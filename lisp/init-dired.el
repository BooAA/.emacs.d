;;; -*- lexical-binding: t -*-

(use-package dired
  :ensure nil
  :custom ((dired-dwim-target t)
	         (dired-recursive-copies 'always)
	         (dired-recursive-deletes 'always))
  :config (put 'dired-find-alternate-file 'disabled nil))

(provide 'init-dired)
