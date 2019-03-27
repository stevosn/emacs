
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Documents/notes/work.org")))
 '(package-selected-packages (quote (smex company magit))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-date ((t (:foreground "dim gray" :underline "dim gray"))))
 '(org-level-1 ((t (:foreground "cyan" :height 1.35))))
 '(org-level-2 ((t (:foreground "light goldenrod" :weight normal :height 1.2))))
 '(org-level-3 ((t (:foreground "orange" :height 1.2))))
 '(org-level-4 ((t (:foreground "OliveDrab3" :height 1.15))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(org-special-keyword ((t (:foreground "dim gray")))))

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.
;;(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "downloaded" user-emacs-directory))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

