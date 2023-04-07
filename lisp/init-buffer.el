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

(use-package ibuffer
  :ensure nil
  :custom ((ibuffer-show-empty-filter-groups nil)
           (ibuffer-default-sorting-mode 'major-mode))
  :bind ("C-x C-b" . ibuffer))

(use-package isearchb
  :ensure nil
  :bind ("C-;" . isearchb-activate))

(provide 'init-buffer)
