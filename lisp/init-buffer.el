;;; -*- lexical-binding: t -*-

(use-package uniquify
  :custom ((uniquify-buffer-name-style 'forward)
           (uniquify-separator "/")
           (uniquify-after-kill-buffer-p t))
  :ensure nil)

(use-package autorevert
  :ensure nil
  :custom ((global-auto-revert-non-file-buffers t)
           (auto-revert-verbose nil))
  :hook (after-init . global-auto-revert-mode))

(use-package buffer-move
  :bind (("C-S-<up>" . 'buf-move-up)
         ("C-S-<down>" . 'buf-move-down)
         ("C-S-<left>" . 'buf-move-left)
         ("C-S-<right>" . 'buf-move-right)))

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
