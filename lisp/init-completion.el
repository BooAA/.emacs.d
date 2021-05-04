;;; -*- lexical-binding: t -*-

(setq enable-recursive-minibuffers t)

(minibuffer-depth-indicate-mode)

(setq completion-styles '(basic substring flex orderless)
      completion-ignore-case t
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

(setq completion-show-help nil)

(use-package orderless
  :custom (orderless-skip-highlighting t))

(use-package selectrum
  :custom ((selectrum-max-window-height 20)
           (selectrum-highlight-candidates-function
            #'orderless-highlight-matches))
  :hook (after-init . selectrum-mode)
  :config (require 'orderless))

(use-package marginalia
  :hook (after-init . marginalia-mode))

(use-package consult
  :custom (consult-preview-key nil)
  :bind (("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c b" . consult-bookmark)
         ("C-c k" . consult-kmacro)
         ("C-x M-:" . consult-complex-command)
         ([remap switch-to-buffer] . consult-buffer)
         ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
         ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
         ([remap apropos] . consult-apropos)))

(use-package embark
  :custom (embark-prompter 'embark-completing-read-prompter)
  :bind ("C-;" . embark-act)
  :hook (embark-collect-mode . embark-collect-direct-action-minor-mode)
  :config (require 'embark-consult))

(add-hook 'embark-pre-action-hook (lambda () (mini-frame-mode -1)))
(add-hook 'embark-post-action-hook (lambda () (mini-frame-mode 1)))

(use-package embark-consult)

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
  :custom ((company-idle-delay 0.7)
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
