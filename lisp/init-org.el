;; change bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; org mode with flyspell-mode
(add-hook 'org-mode-hook 'flyspell-mode)
;; org mode with auto-fill-mode
(add-hook 'org-mode-hook 'auto-fill-mode)
;; custom config for org-latex-export-to-pdf
(setq org-latex-packages-alist
      '((""     "color"     t)
        "\\tolerance=1000"
        "\\definecolor{color1}{rgb}{0.1,0.0,0.7}"
        "\\hypersetup{pdfauthor={Steve Simmert},colorlinks,linkcolor=color1, urlcolor=color1, breaklinks}"))
;; Customize Heading font size
(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.15))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.05))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 )

;; display of entities as UTF-8 characters
(setq org-pretty-entities t)

;; (define-key global-map (kbd "C-c l") 'org-store-link)
;; (define-key global-map (kbd "C-c a") 'org-agenda)

(setq org-startup-indented t)

;; Various preferences
(setq org-log-done t
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80
      org-export-backends (quote (ascii html icalendar latex md))
      org-startup-align-all-tables t)

(setq org-support-shift-select t)


;;; To-do settings

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "CANCELLED(c@/!)")))
      org-todo-repeat-to-state "NEXT")

(setq org-todo-keyword-faces
      (quote (("NEXT" :inherit warning)
              ("PROJECT" :inherit font-lock-string-face))))


(provide 'init-org)
