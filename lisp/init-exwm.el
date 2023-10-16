;;; -*- lexical-binding: t -*-

(use-package exwm
  :preface
  (defun exwm-run-command-async (command)
    (interactive (list (read-shell-command "$ ")))
    (start-process-shell-command command nil command))
  
  (defun exwm-rename-buffer-title ()
    (exwm-workspace-rename-buffer exwm-title))
  :commands (exwm-enable)
  :custom ((exwm-input-global-keys
            `(([?\s-L] . insecure-lock-enter)
              ([?\s-r] . exwm-run-command-async)
              ,@(mapcar (lambda (i)
                          `(,(kbd (format "s-%d" i)) .
                            (lambda ()
                              (interactive)
                              (tab-bar-select-tab ,i))))
                        (number-sequence 1 8))
              ([?\s-9] . tab-last)
              ([s-f1] . pulseaudio-control-toggle-current-sink-mute)
              ([s-f2] . pulseaudio-control-decrease-sink-volume)
              ([s-f3] . pulseaudio-control-increase-sink-volume)
              ([S-s-f1] . pulseaudio-control-toggle-current-source-mute)
              ([S-s-f2] . pulseaudio-control-decrease-source-volume)
              ([S-s-f3] . pulseaudio-control-increase-source-volume)
              ,@(mapcan (lambda (dir)
                          (list `(,(kbd (format "s-<%s>" dir)) .
                                  ,(intern-soft (format "windmove-%s" dir)))
                                `(,(kbd (format "S-s-<%s>" dir)) .
                                  ,(intern-soft (format "windmove-swap-states-%s" dir)))
                                `(,(kbd (format "s-x <%s>" dir)) .
                                  ,(intern-soft (format "windmove-display-%s" dir)))
                                `(,(kbd (format "s-x S-<%s>" dir)) .
                                  ,(intern-soft (format "windmove-delete-%s" dir)))))
                        '("up" "down" "left" "right"))
              ([s-f5] . exwm-reset)
              ([print] . scrot))))
  :hook (exwm-update-title . exwm-rename-buffer-title))

(use-package exwm-randr
  :preface
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
  :ensure nil
  :hook ((exwm-randr-screen-change . exwm-change-screen-hook)
         (after-init . exwm-randr-enable)))

(use-package scrot
  :vc (:url "https://github.com/dakra/scrot.el.git")
  :custom ((scrot-local-path "~/Pictures/screenshots/")
           (scrot-upload-func nil)))

(use-package pulseaudio-control
  :custom (pulseaudio-control-volume-step "2%")
  :hook ((after-init . pulseaudio-control-default-source-mode)
         (after-init . pulseaudio-control-default-sink-mode)))

(use-package enwc
  :custom (enwc-default-backend 'nm))

(use-package bluetooth
  :custom (bluetooth-bluez-bus :system))

(use-package ednc
  :preface
  (defun ednc-top-notification ()
    (if-let ((notification (car (ednc-notifications))))
        (ednc-format-notification notification)
      ""))  
  :hook (after-init . ednc-mode))

(use-package battery
  :ensure nil
  :demand t
  :custom (battery-load-low 20))

(use-package echo-bar
  :custom ((echo-bar-minibuffer nil)
           (echo-bar-update-interval 2)
           (echo-bar-right-padding 1)
           (echo-bar-format '((:eval (ednc-top-notification)) " "
                              "[ "
                              (:eval (battery-format "%b%p%%%" (battery-upower)))
                              " | "
                              (:eval (format-time-string "%a %b %d | %H:%M"))
                              " ]")))
  :hook (after-init . echo-bar-mode))

(use-package insecure-lock)

(provide 'init-exwm)
