;;; -*- lexical-binding: t -*-

(use-package keycast
  :commands (keycast-mode))

(use-package youtube-dl
  :load-path "site-lisp/youtube-dl-emacs"
  :custom ((youtube-dl-directory "~/Downloads")
           (youtube-dl-slow-rate "10M"))
  :commands (youtube-dl youtube-dl-playlist youtube-dl-list))

(use-package request)

(use-package browse-url
  :ensure nil
  :custom ((browse-url-browser-function #'browse-url-chromium)
           (browse-url-handlers
            '(("\\`file://.*\\(\\.md\\)\\|\\(\\.markdown\\)" . browse-url--browser))))
  :bind (("C-c & ." . browse-url-at-point)
         ("C-c & b" . browse-url-of-buffer)
         ("C-c & r" . browse-url-of-region)
         ("C-c & u" . browse-url)
         ("C-c & v" . browse-url-of-file)))

(use-package markdown-mode
  :custom ((markdown-enable-math t)
           (markdown-fontify-code-blocks-natively t))
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode)))

(provide 'init-misc)
