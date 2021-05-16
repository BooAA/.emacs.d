;;; -*- lexical-binding: t -*-

(use-package exwm
  :commands (exwm-enable)
  :custom ((exwm-workspace-number 4)
           (exwm-input-global-keys
            `(([?\s-r] . exwm-reset)
              ([?\s-w] . exwm-workspace-switch)
              ([?\s-&] . exwm-launch-application)
              ;; 's-N': Switch to certain workspace.
              ,@(mapcar (lambda (i)
                          `(,(kbd (format "s-%d" i)) .
                            (lambda ()
                              (interactive)
                              (exwm-workspace-switch-create ,i))))
                        (number-sequence 0 9)))))
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

(use-package exwm-systemtray
  :ensure nil
  :hook (after-init . exwm-systemtray-enable))

(provide 'init-exwm)
