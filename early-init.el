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

(provide 'early-init)
