;;; -*- lexical-binding: t; -*-

;; every frame won't have menu-bar, tool-bar and scroll-bar
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; only the frame created at startup will be maximized
(push '(fullscreen . maximized) initial-frame-alist)
