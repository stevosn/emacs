;; line number configuration
(global-linum-mode t);show line number
;; disable line number display for some modes
(setq linum-disabled-modes-list '(eshell-mode shell-mode term-mode org-mode text-mode inferior-python-mode TeX-output-mode compilation-mode comint-mode blog-admin-mode gnus-group-mode gnus-article-mode bbdb-mode))
(defun linum-on ()
  (unless (or (minibufferp)
			  (member major-mode linum-disabled-modes-list))
	(linum-mode 1)))

;;;cursor stop blinking
;; (blink-cursor-mode -1)
;; (transient-mark-mode 1)

;; ;;;highlight the current row
;; (require 'hl-line)
;; (global-hl-line-mode t)

;; change backup file directory
(setq backup-directory-alist `(("." . "~/.emacs_backups")))
;; stop creating those #auto-save# files
(setq auto-save-default nil)
;; make typing delete/overwrites selected text
(delete-selection-mode 1)
;; auto insert closing bracket
(electric-pair-mode 1)
;; turn on bracket match highlight
(show-paren-mode 1)
;; accept y/n for yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'init-preload-local)
