;;; -*- lexical-binding: t -*-

(setq enable-recursive-minibuffers t)

(minibuffer-depth-indicate-mode)

(setq completion-styles '(basic flex)
      completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

(setq completion-show-help nil
      completion-wrap-movement t
      completion-cycle-threshold 3
      completions-max-height (round (* (frame-height) 0.5)))

(setq tab-always-indent 'complete)

(use-package company
  :custom ((company-idle-delay 0.3)
           (company-tooltip-align-annotations t)
           (company-selection-wrap-around t)
           (company-files-chop-trailing-slash nil)
           (company-dabbrev-ignore-case t)
           (company-dabbrev-downcase nil)
           (company-dabbrev-code-ignore-case t)
           (company-dabbrev-code-everywhere t)
           (company-backends '(company-capf
                               company-files
                               (company-dabbrev-code company-keywords)
                               company-dabbrev)))
  :bind (:map company-active-map
         ("C-n" . nil)
         ("C-p" . nil)
         :map company-search-map
         ("C-n" . nil)
         ("C-p" . nil))
  :hook  (company-mode . company-tng-mode))

(use-package hippie-exp
  :ensure nil
  :custom ((hippie-expand-try-functions-list '(try-complete-file-name
                                               try-expand-dabbrev
                                               try-expand-dabbrev-all-buffers
                                               try-expand-dabbrev-from-kill
                                               try-expand-line
                                               try-expand-line-all-buffers
                                               try-expand-whole-kill
                                               try-complete-lisp-symbol
                                               try-expand-list
                                               try-expand-list-all-buffers))
           (hippie-expand-verbose nil))
  :bind ("M-/" . hippie-expand))

(use-package helm
  :defer 0.3
  :custom ((helm-minibuffer-history-key nil)
           (helm-grep-ag-command
            "rg --color=always --smart-case --no-heading --line-number %s %s %s"))
  :bind (:map helm-map
         ("C-t" . nil)
         ("C-s" . nil)
         ("C-|" . helm-toggle-resplit-window)
         :map helm-command-map
         ("C-x b" . helm-mini)))

(defalias 'ev  'emacs-version)
(defalias 'eit 'emacs-init-time)

(defalias 'plp 'package-list-packages)
(defalias 'pi  'package-install)
(defalias 'pd  'package-delete)
(defalias 'pa  'package-autoremove)

(defalias 'ev-b 'eval-buffer)
(defalias 'ev-r 'eval-region)
(defalias 'ev-d 'eval-defun)

(defalias 'cf 'copy-file)
(defalias 'df 'delete-file)
(defalias 'rf 'rename-file)

(defalias 'lt 'load-theme)
(defalias 'dt 'disable-theme)

(provide 'init-completion)
