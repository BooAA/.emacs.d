;;; -*- lexical-binding: t -*-

(use-package smtpmail
  :ensure nil
  :custom ((smtpmail-smtp-server "smtp.gmail.com")
           (smtpmail-smtp-service 587)))

(use-package sendmail
  :ensure nil
  :custom (send-mail-function 'smtpmail-send-it))

(use-package gnus
  :ensure nil
  :custom ((gnus-select-method '(nnimap "imap.gmail.com"))
           (gnus-secondary-select-methods '((nntp "news.gmane.io")
                                            (nntp "nntp.lore.kernel.org")))))

(use-package mu4e
  :ensure nil
  :load-path "/usr/local/share/emacs/site-lisp/mu4e"
  :custom ((mu4e-get-mail-command "mbsync --all")
           (mu4e-update-interval 100)
           (mu4e-hide-index-messages t)
           (mu4e-split-view 'vertical)
           (mu4e-headers-visible-columns (/ (frame-width) 2))
           (mu4e-use-fancy-chars t)
           (mu4e-confirm-quit nil)
           (mu4e-search-threads nil)
           (mu4e-completing-read-function 'completing-read))
  :commands mu4e)

(use-package notmuch
  :custom ((notmuch-search-oldest-first nil)
           (notmuch-column-control 0.25)
           (notmuch-show-empty-saved-searches t)
           (notmuch-saved-searches
            `((:name "inbox" :query "tag:inbox" :key ,(kbd "i")))
            `((:name "unread" :query "tag:unread" :key ,(kbd "u")))
            `((:name "sent" :query "tag:sent" :key ,(kbd "s")))
            `((:name "draft" :query "tag:draft" :key ,(kbd "d"))))
           (notmuch-hello-sections
            '(notmuch-hello-insert-header
              notmuch-hello-insert-search
              notmuch-hello-insert-saved-searches))))

(provide 'init-mail)
