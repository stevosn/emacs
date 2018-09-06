;;;; some AUCTeX tweaks from and other
;;;; https://www.emacswiki.org/emacs/AUCTeX
;; set pdflatex as auctex compile command
(setq TeX-PDF-mode t)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
;; enable outline-minor-mode for Auctex
(defun turn-on-outline-minor-mode ()
  (outline-minor-mode 1)
  )
(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c\C-o")
(add-hook 'LaTeX-mode-hook
          '(lambda ()
            (define-key LaTeX-mode-map (kbd "$") 'self-insert-command)))
;; add frame environment to outline minor mode
(setq TeX-outline-extra
      '(("\\\\begin{frame}[{\[].+" 5))
      )
;; new key binding to show errors
(add-hook 'LaTeX-mode-hook '(lambda () (local-set-key (kbd "C-c e") 'TeX-error-overview)))

(provide 'init-auctex)
