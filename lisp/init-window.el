;;; -*- lexical-binding: t -*-

(use-package windmove
  :ensure nil
  :custom (windmove-wrap-around t)
  :config (windmove-default-keybindings))

(use-package winner
  :ensure nil
  :hook (after-init . winner-mode))

(use-package tab-bar
  :ensure nil
  ;; using customize-set-variable will trigger tab-bar-mode to  restart,
  ;; we don't wan't that, since minibuffer will disappear with unknown reason
  :init (setq tab-bar-select-tab-modifiers '(control super))
  :custom ((tab-bar-show nil)
           (tab-bar-new-tab-choice "*scratch*"))
  :hook (after-init . tab-bar-mode))

(provide 'init-window)
