;;; -*- lexical-binding: t; -*-

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)

(push '(undecorated . t) default-frame-alist)
(push '(left-fringe . 2) default-frame-alist)
(push '(right-fringe . 2) default-frame-alist)

(push '(fullscreen . maximized) initial-frame-alist)

(set-face-attribute 'default nil
                    :family "hack"
                    :height 110
                    :weight 'normal
                    :width 'normal)

(let ((old-file-name-handler-alist file-name-handler-alist)
      (old-gc-cons-threshold gc-cons-threshold)
      (old-gc-cons-percentage gc-cons-percentage))
  (defun booaa/reset-after-startup ()
    (setq file-name-handler-alist old-file-name-handler-alist)
    (setq gc-cons-threshold old-gc-cons-threshold
          gc-cons-percentage old-gc-cons-percentage))

  (add-hook 'emacs-startup-hook #'booaa/reset-after-startup)

  (setq file-name-handler-alist nil)
  (setq gc-cons-threshold 400000000
        gc-cons-percentage 0.6))

(provide 'early-init)
