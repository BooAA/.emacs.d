;;; -*- lexical-binding: t; -*-

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)

(push '(undecorated . t) default-frame-alist)
(push '(left-fringe . 2) default-frame-alist)
(push '(right-fringe . 2) default-frame-alist)

(push '(fullscreen . maximized) initial-frame-alist)

(set-face-attribute 'default nil
                    :family "monospace"
                    :height 100
                    :weight 'normal
                    :width 'normal)

(setq gc-cons-threshold 8000000
      gc-cons-percentage 0.6)

(provide 'early-init)
