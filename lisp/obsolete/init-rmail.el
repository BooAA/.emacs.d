;;; -*- lexical-binding: t -*-

(defvar rmail-accounts
  `(("RMAIL-Gmail" . ,(concat "maildir://" (expand-file-name "~/Mail/Gmail/inbox")))
    ("RMAIL-NTU" . ,(concat "maildir://" (expand-file-name "~/Mail/NTU/inbox")))))

(defun rmail-select-account ()
  (interactive)
  (let* ((file (completing-read "select account:"
                                (mapcar #'car rmail-accounts)))
         (inbox (alist-get file rmail-accounts nil nil #'equal)))
    (rmail (expand-file-name file no-littering-var-directory))
    (set-rmail-inbox-list inbox)))

(use-package rmail
  :ensure nil
  :custom ((rmail-primary-inbox-list `(,(cdar rmail-accounts)))
           (rmail-file-name (expand-file-name (caar rmail-accounts)
                                              no-littering-var-directory))))

(provide 'init-mail)
