;;; -*- lexical-binding: t -*-

(setq isearch-allow-scroll t
      isearch-lazy-count t
      lazy-highlight-initial-delay 0.2
      search-default-mode t)

(use-package consult
  :bind (("M-s f" . consult-find)
         ("M-s L" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ("M-s e" . consult-isearch)))

(use-package wgrep)

(provide 'init-search)
