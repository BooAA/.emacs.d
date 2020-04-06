;;; -*- lexical-binding: t -*-

(use-package swiper
  :custom (swiper-verbose nil)
  :bind (("C-M-s" . swiper)
         ("C-M-r" . swiper-backward)))

(setq isearch-allow-scroll t
      isearch-lazy-count t
      lazy-highlight-initiald-delay 0.2
      search-default-mode t)

(define-key isearch-mode-map (kbd "M-s s") 'swiper-isearch-toggle)

(provide 'init-search)
