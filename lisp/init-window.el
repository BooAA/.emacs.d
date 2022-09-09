;;; -*- lexical-binding: t -*-

(setopt switch-to-buffer-obey-display-actions t)

(use-package windmove
  :ensure nil
  :custom ((windmove-wrap-around t)
           (windmove-default-keybindings '([ignore] hyper))
           (windmove-swap-states-default-keybindings '([ignore] hyper shift))
           (windmove-delete-default-keybindings '([?\H-x] shift))
           (windmove-display-default-keybindings '([?\H-x])))
  :hook (after-init . windmove-mode))

(use-package winner
  :ensure nil
  :hook (after-init . winner-mode))

(use-package tab-bar
  :ensure nil
  :custom ((tab-bar-show nil)
           (tab-bar-new-button nil)
           (tab-bar-close-button-show nil)
           (tab-bar-new-tab-choice "*scratch*")
           (tab-bar-select-tab-modifiers '(hyper)))
  :hook ((after-init . tab-bar-mode)))

(use-package winum
  :hook (after-init . winum-mode))

(provide 'init-window)
