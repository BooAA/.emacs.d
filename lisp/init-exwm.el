;;; -*- lexical-binding: t -*-

(use-package exwm
  :commands (exwm-enable)
  :custom ((exwm-workspace-number 4)
           (exwm-input-global-keys
            `(([?\s-r] . exwm-reset)
              ([?\s-&] . exwm-launch-application)
              ;; 's-N': Switch to certain tab
              ,@(mapcar (lambda (i)
                          `(,(kbd (format "s-%d" i)) .
                            (lambda ()
                              (interactive)
                              (tab-bar-select-tab ,i))))
                        (number-sequence 1 8))
              ([?\s-9] . tab-last)
              ([s-f9] . pactl-mute)
              ([s-f10] . pactl-decrease-volume)
              ([s-f11] . pactl-increase-volume)))
           (exwm-input-simulation-keys
            '(([?\C-b] . [left])
              ([?\C-f] . [right])
              ([?\M-f] . [C-right])
              ([?\M-b] . [C-left])
              ([?\C-p] . [up])
              ([?\C-n] . [down])
              ([?\C-a] . [home])
              ([?\C-e] . [end])
              ([?\M-v] . [prior])
              ([?\C-v] . [next])
              ([?\C-d] . [delete])
              ([?\M-d] . [C-delete])
              ([M-backspace] . [C-backspace])
              ([?\C-k] . [S-end delete])
              ([?\C-w] . [?\C-x])
              ([?\M-w] . [?\C-c])
              ([?\C-y] . [?\C-v])
              ([?\C-s] . [f3])
              ([?\C-r] . [S-f3]))))
  :hook (exwm-update-class . exwm-rename-buffer-class-name))

(defun exwm-rename-buffer-class-name ()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun exwm-launch-application (command)
  (interactive (list (read-shell-command "$ ")))
  (start-process-shell-command command nil command))

(use-package exwm-randr
  :ensure nil
  :hook ((exwm-randr-screen-change . exwm-change-screen-hook)
         (after-init . exwm-randr-enable)))

(defun exwm-change-screen-hook ()
  (let ((xrandr-output-regexp "\n\\([^ ]+\\) connected ")
        default-output)
    (with-temp-buffer
      (call-process "xrandr" nil t nil)
      (goto-char (point-min))
      (re-search-forward xrandr-output-regexp nil 'noerror)
      (setq default-output (match-string 1))
      (forward-line)
      (if (not (re-search-forward xrandr-output-regexp nil 'noerror))
          (call-process "xrandr" nil nil nil "--output" default-output "--auto")
        (call-process
         "xrandr" nil nil nil
         "--output" (match-string 1) "--primary" "--auto"
         "--output" default-output "--off")
        (setq exwm-randr-workspace-monitor-plist (list 0 (match-string 1)))))))

(defvar pactl-volume-delta 3)

(defun pactl--get-current-volume ()
  (with-temp-buffer
    (call-process "pactl" nil t nil "get-sink-volume" "@DEFAULT_SINK@")
    (goto-char (point-min))
    (re-search-forward "[0-9]+%")
    (match-string 0)))

(defun pactl--change-volume (arg)
  (call-process
   "pactl" nil nil nil
   "set-sink-volume"
   "@DEFAULT_SINK@"
   (format "%+d%%" arg)))

(defun pactl--handle-arg (arg)
  (if arg
      (prefix-numeric-value arg)
    pactl-volume-delta))

(defun pactl-increase-volume (arg)
  (interactive "P")
  (pactl--change-volume (pactl--handle-arg arg))
  (message "Current volume: %s" (pactl--get-current-volume)))

(defun pactl-decrease-volume (arg)
  (interactive "P")
  (pactl--change-volume (- (pactl--handle-arg arg)))
  (message "Current volume: %s" (pactl--get-current-volume)))

(defun pactl--get-mute-status ()
  (with-temp-buffer
    (call-process "pactl" nil t nil "get-sink-mute" "@DEFAULT_SINK@")
    (buffer-substring 1 (buffer-size))))

(defun pactl-mute ()
  (interactive)
  (call-process "pactl" nil nil nil "set-sink-mute" "@DEFAULT_SINK@" "toggle")
  (message "%s" (pactl--get-mute-status)))

;; (use-package exwm-systemtray
;;   :ensure nil
;;   :hook (after-init . exwm-systemtray-enable))

(provide 'init-exwm)
