;;; -*- lexical-binding: t -*-

(use-package windmove
  :init (setq switch-to-buffer-obey-display-actions t)
  :ensure nil
  :custom (windmove-wrap-around t)
  :hook (after-init . booaa/windmove-setup-keybindings))

(defun booaa/windmove-setup-keybindings ()
  (windmove-default-keybindings)
  (windmove-swap-states-default-keybindings '(ctrl shift))
  (windmove-delete-default-keybindings)
  (windmove-display-default-keybindings))

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
