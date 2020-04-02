;; org agenda files
(setq org-agenda-files '("~/org"))
(defvar org-agenda-dir ""
  "gtd org files location")

(defvar deft-dir ""
  "deft org files location")

(defvar blog-admin-dir ""
  "blog-admin files location")

(if (spacemacs/system-is-mswindows)
    (setq
     org-agenda-dir "c:/Users/vincent/tasks/org/"
     deft-dir "c:/Users/vincent/tasks/org/"
     blog-admin-dit "c:/Users/vincent/Documents/tasks/org/")
  (setq
   org-agenda-dir "~/Documents/tasks/org/"
   deft-dir "~/Documents/tasks/org/"
   blog-admin-dit "~/Documents/workspace/goproj"))

(global-linum-mode t)

(global-set-key (kbd "M-s o") 'occur-dwim)
