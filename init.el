
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.
;;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "downloaded" user-emacs-directory))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

