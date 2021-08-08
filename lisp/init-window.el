;;; -*- lexical-binding: t -*-

(setq switch-to-buffer-obey-display-actions t)

(use-package windmove
  :ensure nil
  :custom ((windmove-wrap-around t)
           (windmove-default-keybindings '([ignore] shift))
           (windmove-swap-states-default-keybindings '([ignore] super shift))
           (windmove-delete-default-keybindings '("\C-x" shift))
           (windmove-display-default-keybindings '([ignore] meta shift)))
  :hook (after-init . windmove-mode))

(use-package winner
  :ensure nil
  :hook (after-init . winner-mode))

(use-package tab-bar
  :ensure nil
  :custom ((tab-bar-show t)
           (tab-bar-new-button nil)
           (tab-bar-close-button nil)
           (tab-bar-new-tab-choice "*scratch*")
           (tab-bar-select-tab-modifiers '(hyper)))
  :hook ((after-init . tab-bar-mode)))

(provide 'init-window)
