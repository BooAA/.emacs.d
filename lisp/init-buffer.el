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

(use-package midnight
  :ensure nil
  :hook (after-init . midnight-mode))

(use-package help
  :ensure nil
  :custom (help-window-keep-selected t))

(use-package isearchb
  :ensure nil
  :bind ("C-." . isearchb-activate))

(use-package ibuffer
  :ensure nil
  :custom ((ibuffer-show-empty-filter-groups nil)
           (ibuffer-default-sorting-mode 'major-mode))
  :bind ("C-x C-b" . ibuffer))

(use-package ibuffer-vc
  :preface
  (defun ibuffer-vc-setup ()
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic)))
  :custom (ibuffer-vc-skip-if-remote nil)
  :hook (ibuffer . ibuffer-vc-setup))

(use-package bufferlo
  :bind (("C-c b b" . bufferlo-switch-to-buffer)
         ("C-c b B" . bufferlo-list-buffers)
         ("C-c b r" . bufferlo-remove)
         ("C-c b c" . bufferlo-clear)
         ("C-c b f" . bufferlo-find-buffer-switch))
  :hook (after-init . bufferlo-mode))

(provide 'init-buffer)
