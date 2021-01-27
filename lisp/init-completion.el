;;; -*- lexical-binding: t -*-

(setq enable-recursive-minibuffers t)

(minibuffer-depth-indicate-mode)

(setq completion-styles '(basic flex)
      completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

(setq completion-show-help nil)

(use-package ivy
  :custom ((ivy-wrap t)
           (ivy-height 15)
           (ivy-count-format "%d/%d ")
           (ivy-display-style nil)
           (ivy-on-del-error-function 'ignore)
           (ivy-ignore-buffers '("\\` " "\\`\\*")))
  :bind (:map ivy-minibuffer-map
         ("TAB" . ivy-partial)
         :map ivy-occur-mode-map
         ("n" . ivy-occur-next-line)
         ("p" . ivy-occur-previous-line))
  :hook (after-init . ivy-mode)
  :config
  (dolist (k '("h" "j" "k" "l"))
    (define-key ivy-occur-mode-map (kbd k) nil)
    (define-key ivy-occur-grep-mode-map (kbd k) nil)))

(use-package counsel
  :custom (counsel-grep-base-command
           "rg -M 120 --with-filename --no-heading --line-number --color never %s")
  :bind (:map counsel-mode-map
         ("C-c s" . counsel-rg)
         ([remap recentf-open-files] . counsel-recentf))
  :hook (ivy-mode . counsel-mode))

(use-package smex)

(use-package ivy-rich
  :hook (ivy-mode . ivy-rich-mode)
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))

(use-package ivy-posframe
  :custom ((ivy-posframe-size-function #'ivy-posframe-fix-size)
           (ivy-posframe-parameters '((left-fringe . 4)
                                      (right-fringe . 4)))
           (ivy-posframe-display-functions-alist
            '((swiper . ivy-display-function-fallback)
              (t . ivy-posframe-display-frame-middle-top-center))))
  :hook (ivy-mode . ivy-posframe-mode))

(defun ivy-posframe-fix-size ()
  (let ((width (round (* .75 (frame-width)))))
    (list :height ivy-height
          :width width
          :min-height 0
          :min-width width)))

(defun ivy-posframe-display-frame-middle-top-center (str)
  (ivy-posframe--display str #'posframe-poshandler-frame-middle-top-center))

(defun posframe-poshandler-frame-middle-top-center (info)
  (cons (/ (- (plist-get info :parent-frame-width)
              (plist-get info :posframe-width))
           2)
        (/ (plist-get info :parent-frame-height) 5)))

(use-package hippie-exp
  :ensure nil
  :custom ((hippie-expand-try-functions-list '(try-complete-file-name
                                               try-expand-dabbrev
                                               try-expand-dabbrev-visible
                                               try-expand-dabbrev-from-kill
                                               try-expand-whole-kill
                                               try-expand-dabbrev-all-buffers
                                               try-expand-line
                                               try-expand-line-all-buffers))
           (hippie-expand-verbose nil))
  :bind ("M-/" . hippie-expand)
  :hook (prog-mode . booaa/hippie-lisp-related-mode-setup))

(defun booaa/hippie-lisp-related-mode-setup ()
  (when (derived-mode-p 'lisp-data-mode)
      (setq-local hippie-expand-try-functions-list
                  (append '(try-complete-lisp-symbol
                            try-expand-list
                            try-expand-list-all-buffers)
                          hippie-expand-try-functions-list))))

(use-package company
  :custom ((company-idle-delay 0.2)
           (company-minimum-prefix-length 2)
           (company-tooltip-align-annotations t)
           (company-selection-wrap-around t)
           (company-dabbrev-ignore-case t)
           (company-dabbrev-downcase nil)
           (company-dabbrev-code-ignore-case t)
           (company-dabbrev-code-everwhere t)
           (company-backends '(company-capf
                               company-files
                               (company-dabbrev-code company-keywords)
                               company-dabbrev)))
  :hook ((after-init . global-company-mode)
         (company-mode . company-tng-mode)))

(defalias 'ev  'emacs-version)
(defalias 'eit 'emacs-init-time)

(defalias 'plp 'package-list-packages)
(defalias 'pi 'package-install)
(defalias 'pd  'package-delete)
(defalias 'pa  'package-autoremove)

(defalias 'ev-b 'eval-buffer)
(defalias 'ev-r 'eval-region)
(defalias 'ev-d 'eval-defun)

(defalias 'cf 'copy-file)
(defalias 'df 'delete-file)
(defalias 'rf 'rename-file)

(provide 'init-completion)
