;;; -*- lexical-binding: t -*-

(setq isearch-wrap-pause 'no
      isearch-lazy-count t
      lazy-highlight-initial-delay 0.1
      isearch-resume-in-command-history t)

(setq xref-search-program 'ripgrep
      xref-truncation-width 100
      xref-after-jump-hook '(xref-pulse-momentarily))

(use-package wgrep)

(define-key search-map (kbd "g") #'lgrep)
(define-key search-map (kbd "G") #'rgrep)

(provide 'init-search)
