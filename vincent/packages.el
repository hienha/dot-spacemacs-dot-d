;;; packages.el --- vincent layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: vincent <changfeng@vangogh.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `vincent-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vincent/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vincent/pre-init-PACKAGE' and/or
;;   `vincent/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vincent-packages
  '(youdao-dictionary
    company
    find-file-in-project
    (occur-mode :location built-in))
  )

(defun vincent/init-youdao-dictionary()
  (use-package youdao-dictionary
    :defer t
    :init
    (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)))

(defun vincent/init-find-file-in-project ()
  (use-package find-file-in-project
    :defer t
    :init
    (global-set-key (kbd "s-f") 'find-file-in-project)))

(defun vincent/post-init-company()
  (setq company-minimum-prefix-length 1)

  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next-or-abort)
    (define-key company-active-map (kbd "C-p") #'company-select-previous-or-abort)
  ))

(defun vincent/pre-init-occur-mode()
  (evilified-state-evilify-map occur-mode-map
    :mode occur-mode))

(defun vincent/open-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (vincent/vcs-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (projectile-find-file)
      (ido-find-file))))

;;; packages.el ends here
