;;; -*- lexical-binding: t -*-

(use-package dired
  :ensure nil
  :custom ((dired-dwim-target t)
	   (dired-recursive-copies 'always)
	   (dired-recursive-deletes 'always)
           (dired-auto-revert-buffer t)))

(provide 'init-dired)
