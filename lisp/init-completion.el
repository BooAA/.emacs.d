;;; -*- lexical-binding: t -*-

(setq enable-recursive-minibuffers t)

(minibuffer-depth-indicate-mode)

(use-package ivy
  :custom ((ivy-wrap t)
           (ivy-height 15)
           (ivy-count-format "%d/%d ")
           (ivy-display-style nil)
           (ivy-read-action-function 'ivy-read-action-ivy "using ivy interface when selecting ivy action")
           (ivy-on-del-error-function 'ignore "when no input text, backspace won't quit")
           (ivy-ignore-buffers '("\\` " "\\`\\*") "ignore buffers start with space and asterisks"))
  :bind (:map ivy-mode-map
         ("C-c z" . ivy-resume)
         :map ivy-minibuffer-map
         ("TAB" . ivy-partial)
         ("C-SPC" . booaa/ivy-toggle-mark))
  :hook (after-init . ivy-mode))

(defun booaa/ivy-toggle-mark ()
  "mark or unmark current candidate and move forward"
  (interactive)
  (if (ivy--marked-p)
      (ivy-unmark)
    (ivy-mark)))

(use-package counsel
  :custom ((counsel-grep-base-command "rg -M 120 --with-filename --no-heading --line-number --color never %s")
           (counsel-search-engine 'google))
  :bind (:map counsel-mode-map
         ([remap jump-to-register] . counsel-register)
         ("C-c s" . counsel-rg)
         ("C-c /" . counsel-search)
         ("C-M-i" . counsel-company)
         ([remap recentf-open-files] . counsel-recentf))
  :hook (ivy-mode . counsel-mode))

(use-package smex)

(use-package wgrep)

(use-package hippie-exp
  :ensure nil
  :custom ((hippie-expand-try-functions-list '(try-complete-file-name-partially
                                               try-complete-file-name
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
                  (append '(try-complete-lisp-symbol-partially
                            try-complete-lisp-symbol
                            try-expand-list
                            try-expand-list-all-buffers)
                          hippie-expand-try-functions-list))))

(setq completion-styles '(flex)
      completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t)

(use-package company
  :custom ((company-idle-delay 0.25)
           (company-minimum-prefix-length 3)
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
