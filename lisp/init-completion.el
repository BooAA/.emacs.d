;;; -*- lexical-binding: t -*-

(setopt enable-recursive-minibuffers t)

(setopt completion-styles '(basic)
        completion-ignore-case t
        read-file-name-completion-ignore-case t
        read-buffer-completion-ignore-case t
        completion-category-defaults nil
        completion-category-overrides nil)

(setopt completion-show-help nil
        completions-max-height (round (* (frame-height) 0.3)))

(setopt history-length t
        history-delete-duplicates t)

(use-package mb-depth
  :ensure nil
  :hook (after-init . minibuffer-depth-indicate-mode))

(use-package company
  :custom ((company-idle-delay nil)
           (company-tooltip-align-annotation t)
           (company-selection-wrap-around t)
           (company-files-chop-trailing-slash nil)
           (company-dabbrev-ignore-case t)
           (company-dabbrev-downcase nil)
           (company-dabbrev-code-everywhere t)
           (company-backends '(company-capf
                               company-files
                               (company-dabbrev-code company-keywords)
                               company-dabbrev)))
  :hook ((company-mode . company-tng-mode)
         (after-init . global-company-mode))
  :bind ("C-M-/" . company-manual-begin))

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
  :defer 0.1
  :custom ((helm-minibuffer-history-key nil)
           (helm-grep-ag-command
            "rg --color=always --smart-case --no-heading --line-number %s %s %s"))
  :bind (:map helm-map
         ("C-t" . nil)
         ("C-s" . nil)
         ("C-|" . helm-toggle-resplit-window)
         :map helm-command-map
         ("C-x b" . helm-mini)))

(use-package helm-company
  :after helm
  :bind (:map helm-command-map
         ("C-M-i" . helm-company)))

(use-package vertico
  :custom (vertico-cycle t)
  :hook (vertico-mode . booaa/vertico-setup)
  :preface
  (defun booaa/vertico-setup ()
    (if vertico-mode
        (progn
          (marginalia-mode)
          (setopt completion-styles '(basic orderless))
          (global-set-key (kbd "C-x c") 'consult-command-map))
      (marginalia-mode -1)
      (setopt completion-styles '(basic))
      (global-set-key (kbd "C-x c") 'helm-command-prefix))))

(use-package vertico-multiform
  :ensure nil
  :hook (vertico-mode . vertico-multiform-mode)
  :config
  (add-to-list 'vertico-multiform-commands '(t unobtrusive))
  (dolist (cmd '(consult-buffer consult-project-buffer consult-recentf
                 consult-mode-command consult-complex-command consult-history
                 consult-bookmark consult-register consult-yank-from-kill-ring
                 consult-imenu consult-imenu-multi consult-find consult-locate
                 consult-grep consult-git-grep consult-ripgrep consult-line
                 consult-man consult-info consult-theme consult-company
                 consult-eglot-symbols))
    (add-to-list 'vertico-multiform-commands `(,cmd buffer))))

(use-package orderless)

(use-package marginalia
  :bind (:map vertico-map
         ("M-A" . marginalia-cycle)))

(use-package consult
  :init (define-prefix-command 'consult-command-map)
  :bind (:map consult-command-map
         ("l" . consult-locate)
         ("m" . consult-man)
         ("/" . consult-find)
         ("i" . consult-imenu)
         ("I" . consult-imenu-multi)
         ("C-x r b" . consult-bookmark)
         ("M-y" . consult-yank-from-kill-ring)
         ("M-x" . consult-mode-command)
         ("M-s o" . consult-line)
         ("M-g a" . consult-ripgrep)
         ("C-c f" . consult-recentf)
         ("C-x C-b" . consult-buffer)
         ("C-x r i" . consult-register)
         ("C-M-i" . consult-company)))

(use-package consult-company
  :bind (:map consult-command-map
         ("C-M-i" . consult-company)))

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

(defalias 'sb 'scratch-buffer)

(provide 'init-completion)
