;;; -*- lexical-binding: t -*-

(use-package uniquify
  :ensure nil
  :custom ((uniquify-buffer-name-style 'forward)
           (uniquify-separator "/")
           (uniquify-after-kill-buffer-p t)))

(use-package autorevert
  :ensure nil
  :custom ((global-auto-revert-non-file-buffers t)
           (auto-revert-verbose nil))
  :hook (after-init . global-auto-revert-mode))

(use-package help
  :ensure nil
  :hook (after-init . temp-buffer-resize-mode))

(use-package midnight
  :ensure nil
  :hook (after-init . midnight-mode))

(use-package ibuffer
  :ensure nil
  :custom (ibuffer-show-empty-filter-groups nil)
  :bind ("C-x C-b" . ibuffer))

(use-package ibuffer-vc
  :commands ibuffer-vc-set-filter-groups-by-vc-root
  :hook (ibuffer-mode . booaa/ibuffer-set-up-preferred-filters))

(defun booaa/ibuffer-set-up-preferred-filters ()
  (ibuffer-vc-set-filter-groups-by-vc-root)
  (unless (eq ibuffer-sorting-mode 'filename/process)
    (ibuffer-do-sort-by-filename/process)))

(provide 'init-buffer)
