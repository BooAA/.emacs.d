;;; -*- lexical-binding: t -*-

(use-package eww
  :ensure nil
  :custom (eww-auto-rename-buffer 'title))

(use-package shr
  :ensure nil
  :custom ((shr-use-fonts nil)
           (shr-discard-aria-hidden t)
           (shr-use-xwidgets-for-media t)))

(use-package browse-url
  :ensure nil
  :custom ((browse-url-browser-function #'browse-url-chrome)
           (browse-url-chrome-arguments '("--new-window"))))

(use-package keycast)

(use-package elfeed
  :custom ((elfeed-feeds '(("https://planet.lisp.org/rss20.xml" lisp)
                           ("https://sachachua.com/blog/category/emacs-news/feed/" emacs)
                           ("https://lwn.net/headlines/rss" linux)))
           (elfeed-search-filter "@3days-ago +unread")))

(use-package engine-mode
  :hook (after-init . engine-mode)
  :config
  (defengine google
    "https://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "/")
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

(use-package md4rd
  :custom (md4rd-subs-active '(emacs lisp Common_Lisp unixporn linux)))

(use-package sx)

(use-package telega)

(provide 'init-misc)
