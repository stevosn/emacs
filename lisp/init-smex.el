;; Use smex to handle M-x
(when (maybe-require-package 'smex)
  ;; Change path for ~/.smex-items
  (setq-default smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
  (global-set-key [remap execute-extended-command] 'smex))


;; type hyphen instead of space when pressing space
;; found at: https://www.emacswiki.org/emacs/Smex
;; (defadvice smex (around space-inserts-hyphen activate compile)
;;         (let ((ido-cannot-complete-command 
;;                `(lambda ()
;;                   (interactive)
;;                   (if (string= " " (this-command-keys))
;;                       (insert ?-)
;;                     (funcall ,ido-cannot-complete-command)))))
;;           ad-do-it))

(provide 'init-smex)
