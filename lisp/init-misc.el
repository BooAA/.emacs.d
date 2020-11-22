;;; -*- lexical-binding: t -*-

(use-package request)

(use-package keycast
  :commands (keycast-mode))

(use-package olivetti
  :custom (olivetti-body-width 80))

(use-package youtube-dl
  :load-path "site-lisp/youtube-dl-emacs"
  :custom ((youtube-dl-directory "~/Downloads")
           (youtube-dl-slow-rate "10M"))
  :commands (youtube-dl youtube-dl-playlist youtube-dl-list))

(setq browse-url-browser-function 'browse-url-chromium)
(add-to-list 'browse-url-handlers '("\\`file://.*\\(\\.md\\)\\|\\(\\.markdown\\)" . browse-url--browser))

(global-set-key (kbd "C-c C-z .") 'browse-url-at-point)
(global-set-key (kbd "C-c C-z b") 'browse-url-of-buffer)
(global-set-key (kbd "C-c C-z r") 'browse-url-of-region)
(global-set-key (kbd "C-c C-z u") 'browse-url)
(global-set-key (kbd "C-c C-z v") 'browse-url-of-file)

(use-package engine-mode
  :hook (after-init . engine-mode))

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w")

(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
  :keybinding "y")

(defengine wolfram-alpha
  "http://www.wolframalpha.com/input/?i=%s")

(use-package exwm
  :commands (exwm-enable)
  :custom ((exwm-workspace-number 4)
           ;; (exwm-input-line-mode-passthrough t)
           (exwm-input-global-keys
            `(([?\s-r] . exwm-reset)
              ([?\s-&] . booaa/exwm-launch-application)
              ;; 's-N': Switch to certain workspace.
              ,@(mapcar (lambda (i)
                          `(,(kbd (format "s-%d" i)) .
                            (lambda ()
                              (interactive)
                              (exwm-workspace-switch-create ,i))))
                        (number-sequence 0 9)))))
  :hook (exwm-update-class . booaa/exwm-rename-buffer-class-name))

(defun booaa/exwm-rename-buffer-class-name ()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun booaa/exwm-launch-application (command)
  (interactive (list (read-shell-command "$ ")))
  (start-process-shell-command command nil command))

(provide 'init-misc)
