;;; -*- lexical-binding: t -*-

(use-package rmail
  :ensure nil
  :custom ((rmail-primary-inbox-list '("pops://r09944008@msa.ntu.edu.tw:995"))
           (rmail-preserve-inbox t)
           (rmail-movemail-flags '("-r"))
           (rmail-remote-password-required t)))

(provide 'init-mail)
