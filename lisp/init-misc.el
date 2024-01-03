;;; -*- lexical-binding: t -*-

(use-package browse-url
  :preface
  (defun xwidget-webkit-browse-url-new-session (url &optional args)
    (xwidget-webkit-browse-url url t))
  :ensure nil
  :custom ((browse-url-browser-function #'xwidget-webkit-browse-url-new-session)
           ;; (browse-url-browser-function #'browse-url-chrome)
           ;; (browse-url-chrome-arguments '("--new-window"))
           )
  :bind (("C-c z ." . browse-url-at-point)
         ("C-c z b" . browse-url-of-buffer)
         ("C-c z r" . browse-url-of-region)
         ("C-c z u" . browse-url)
         ("C-c z v" . browse-url-of-file)))

(use-package shr
  :ensure nil
  :custom ((shr-use-fonts nil)
           (shr-discard-aria-hidden t)
           (shr-use-xwidgets-for-media t)))

(use-package eww
  :ensure nil
  :custom (eww-auto-rename-buffer 'title))

(use-package xwidget
  :preface
  (defun xwidget-webkit-zoom-4k ()
    (when (= (display-pixel-width) 3840)
      (xwidget-webkit-zoom (xwidget-webkit-current-session) 0.5)))
  :bind (:map xwidget-webkit-edit-mode-map
         ("ESC" . xwidget-webkit-edit-mode))
  :hook (xwidget-webkit-mode . xwidget-webkit-zoom-4k))

(use-package xwwp
  :after xwidget
  :load-path "site-lisp/xwwp/"
  :custom (xwwp-follow-link-completion-system 'ido)
  :bind (:map xwidget-webkit-mode-map
         ("v" . xwwp-follow-link)))

(use-package xwwp-ace
  :after xwidget
  :load-path "site-lisp/xwwp/"
  :bind (:map xwidget-webkit-mode-map
         ("t" . xwwp-ace-toggle)))

(use-package engine-mode
  :hook (after-init . engine-mode)
  :config
  (defengine google
    "https://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "/")
  (defengine moma
    "https://moma.corp.google.com/search?q=%s"
    :keybinding "m")
  (defengine aosp
    "https://android-review.git.corp.google.com/q/%s"
    :keybinding "a o s p")
  (defengine android
    "https://googleplex-android-review.git.corp.google.com/q/%s"
    :keybinding "a g")
  (defengine partner-android
    "https://partner-android-review.git.corp.google.com/q/%s"
    :keybinding "p a")
  (defengine buganizer
    "https://b.corp.google.com/issues?q=%s"
    :keybinding "b")
  (defengine youtube
    "https://www.youtube.com/results?aq=f&oq=&search_query=%s"
    :keybinding "y")
  (defengine stack-overflow
    "https://stackoverflow.com/search?q=%s"
    :keybinding "s")
  (defengine wikipedia
  "https://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w")
  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s"
    :keybinding "g"))

(use-package elfeed
  :custom ((elfeed-feeds '(("https://planet.lisp.org/rss20.xml" lisp)
                           ("https://sachachua.com/blog/category/emacs-news/feed/" emacs)
                           ("https://lwn.net/headlines/rss" linux)))
           (elfeed-search-filter "@3days-ago +unread")))

(use-package hackernews)

(use-package md4rd
  :custom (md4rd-subs-active '(emacs lisp Common_Lisp unixporn linux)))

(use-package sx)

(use-package telega)

(use-package keycast)

(use-package speed-type)

(use-package google-translate
  :custom ((google-translate-default-source-language "auto")
           (google-translate-default-target-language "zh-TW"))
  :bind (("C-c t ." . google-translate-at-point)
         ("C-c t b" . google-translate-buffer)
         ("C-c t q" . google-translate-query-translate)
         ("C-c t s" . google-translate-smooth-translate)))

(provide 'init-misc)
