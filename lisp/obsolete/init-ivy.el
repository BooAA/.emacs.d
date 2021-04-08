;;; -*- lexical-binding: t -*-

(use-package ivy
  :custom ((ivy-wrap t)
           (ivy-height 15)
           (ivy-count-format "%d/%d ")
           (ivy-display-style nil)
           (ivy-on-del-error-function 'ignore)
           (ivy-use-virtual-buffers t)
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
         ("C-c /" . counsel-google)
         ([remap recentf-open-files] . counsel-recentf))
  :hook (ivy-mode . counsel-mode))

(use-package smex)

(use-package ivy-rich
  :hook (ivy-mode . ivy-rich-mode)
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-rich-modify-column
   'counsel-describe-function
   'counsel-describe-function-transformer '(:width 0.35))
  (ivy-rich-modify-column
   'counsel-describe-variable
   'counsel-describe-variable-transformer '(:width 0.35)))

(use-package ivy-posframe
  :custom ((ivy-posframe-size-function #'ivy-posframe-adaptive-size)
           (ivy-posframe-parameters '((left-fringe . 4)
                                      (right-fringe . 4)))
           (ivy-posframe-display-functions-alist
            '((swiper . ivy-display-function-fallback)
              (t . ivy-posframe-display-frame-middle-top-center))))
  :hook (ivy-mode . ivy-posframe-mode))

(defun ivy-posframe-adaptive-size ()
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

(use-package swiper
  :custom (swiper-verbose nil)
  :bind (("C-M-s" . counsel-grep-or-swiper)
         ("C-M-r" . counsel-grep-or-swiper-backward)))

(define-key isearch-mode-map (kbd "M-s s") 'swiper-isearch-toggle)

(provide 'init-obsolete)
