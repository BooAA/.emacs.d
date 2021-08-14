;;; -*- lexical-binding: t -*-

(setq user-full-name "Liang-Jie Lee"
      user-mail-address "s930054123yaoyao@gmail.com")

(setq send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

(use-package mu4e
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :custom ((mu4e-get-mail-command "mbsync gmail-inbox")
           (mu4e-update-interval 100)
           (mu4e-split-view 'vertical)
           (mu4e-headers-visible-columns (/ (frame-width) 2))
           (mu4e-use-fancy-chars t)
           (mu4e-confirm-quit nil)
           (mu4e-completing-read-function 'completing-read))
  :commands (mu4e))

(provide 'init-mail)
