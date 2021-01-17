;;; -*- lexical-binding: t -*-

(setq switch-to-buffer-obey-display-actions t)

(use-package windmove
  :ensure nil
  :custom ((windmove-wrap-around t)
           (windmove-create-window t)
           (windmove-display-no-select t))
  :bind ("M-S-<return>" . windmove-display-same-window)
  :hook ((after-init . windmove-default-keybindings)
         (after-init . windmove-swap-states-default-keybindings)
         (after-init . windmove-delete-default-keybindings)
         (after-init . windmove-display-default-keybindings)))

(use-package winner
  :ensure nil
  :hook (after-init . winner-mode))

(use-package tab-bar
  :ensure nil
   :init (custom-set-variables '(tab-bar-show nil))
   :custom (;; (tab-bar-show nil)
           (tab-bar-new-tab-choice "*scratch*")
           (tab-bar-select-tab-modifiers '(control super)))
   :hook (after-init . tab-bar-mode))

(provide 'init-window)
