;;; -*- lexical-binding: t -*-

(setq isearch-allow-scroll t
      isearch-lazy-count t
      lazy-highlight-initial-delay 0.2
      search-default-mode t)

(define-key search-map (kbd "g") #'lgrep)
(define-key search-map (kbd "G") #'rgrep)
(define-key search-map (kbd "O") #'multi-occur-in-matching-buffers)

(use-package swiper
  :custom (swiper-verbose nil)
  :bind (("C-M-s" . counsel-grep-or-swiper)
         ("C-M-r" . counsel-grep-or-swiper-backward)))

(define-key isearch-mode-map (kbd "M-s s") 'swiper-isearch-toggle)

(use-package wgrep)

(provide 'init-search)
