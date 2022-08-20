;;; -*- lexical-binding: t -*-

(setopt user-full-name "Liang-Jie Lee"
        user-mail-address "s930054123yaoyao@gmail.com")

(use-package smtpmail
  :ensure nil
  :custom ((smtpmail-smtp-server "smtp.gmail.com")
           (smtpmail-smtp-service 587)))

(use-package sendmail
  :ensure nil
  :custom (send-mail-function 'smtpmail-send-it))

(use-package eww
  :ensure nil
  :custom (eww-auto-rename-buffer 'title))

(use-package shr
  :ensure nil
  :custom ((shr-use-fonts nil)
           (shr-discard-aria-hidden t)
           (shr-use-xwidgets-for-media t)))

(use-package notmuch)

(use-package keycast)

(use-package elfeed
  :custom ((elfeed-feeds '("https://www.reddit.com/r/emacs.rss"
                           "https://www.reddit.com/r/lisp.rss"
                           "https://lwn.net/headlines/rss"))
           (elfeed-search-filter "@3days-ago +unread")))

(provide 'init-misc)
