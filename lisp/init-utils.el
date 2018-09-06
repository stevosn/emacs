(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))


;;----------------------------------------------------------------------------
;; Handier way to add modes to auto-mode-alist
;;----------------------------------------------------------------------------
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))


;;----------------------------------------------------------------------------
;; String utilities missing from core emacs
;;----------------------------------------------------------------------------
(defun sanityinc/string-all-matches (regex str &optional group)
  "Find all matches for `REGEX' within `STR', returning the full match string or group `GROUP'."
  (let ((result nil)
        (pos 0)
        (group (or group 0)))
    (while (string-match regex str pos)
      (push (match-string group str) result)
      (setq pos (match-end group)))
    result))


;;----------------------------------------------------------------------------
;; Delete the current file
;;----------------------------------------------------------------------------
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))


;;----------------------------------------------------------------------------
;; Rename the current file
;;----------------------------------------------------------------------------
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
        (rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name))))

;;----------------------------------------------------------------------------
;; Browse current HTML file
;;----------------------------------------------------------------------------
(defun browse-current-file ()
  "Open the current file as a URL using `browse-url'."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (and (fboundp 'tramp-tramp-file-p)
             (tramp-tramp-file-p file-name))
        (error "Cannot open tramp file")
      (browse-url (concat "file://" file-name)))))


;; implement unfill --> is now done via unfill package loaded in init-editing-utils.el
;; (defun xah-fill-or-unfill ()
;;   "Reformat current paragraph or region to `fill-column', like `fill-paragraph' or “unfill”.
;; When there is a text selection, act on the selection, else, act
;; on a text block separated by blank lines.  URL
;; `http://ergoemacs.org/emacs/modernization_fill-paragraph.html'
;; Version 2017-01-08"
;;   (interactive)
;;   ;; This command symbol has a property “'compact-p”, the possible
;;   ;; values are t and nil. This property is used to easily determine
;;   ;; whether to compact or uncompact, when this command is called
;;   ;; again
;;   (let ( ($compact-p
;;           (if (eq last-command this-command)
;;               (get this-command 'compact-p)
;;             (> (- (line-end-position) (line-beginning-position)) fill-column)))
;;          (deactivate-mark nil)
;;          ($blanks-regex "\n[ \t]*\n")
;;          $p1 $p2
;;          )
;;     (if (use-region-p)
;;         (progn (setq $p1 (region-beginning))
;;                (setq $p2 (region-end)))
;;       (save-excursion
;;         (if (re-search-backward $blanks-regex nil "NOERROR")
;;             (progn (re-search-forward $blanks-regex)
;;                    (setq $p1 (point)))
;;           (setq $p1 (point)))
;;         (if (re-search-forward $blanks-regex nil "NOERROR")
;;             (progn (re-search-backward $blanks-regex)
;;                    (setq $p2 (point)))
;;           (setq $p2 (point)))))
;;     (if $compact-p
;;         (fill-region $p1 $p2)
;;       (let ((fill-column most-positive-fixnum ))
;;         (fill-region $p1 $p2)))
;;     (put this-command 'compact-p (not $compact-p))))
;; ;; setup key binding for xah fill unfill
;; (global-set-key (kbd "M-Q") 'xah-fill-or-unfill)

;; comment out as a heading
(defun comment-fill-aligned (arg)
  "Comment out the current line using fill-column to pad and
align with comment chars."
  (interactive "p")
  (comment-normalize-vars)
  (let* ((comment-style 'aligned)
        (beg (line-beginning-position))
        (end (line-end-position))
        (com-add (/ (- fill-column (+ (- end beg) 2)) 2)))
    (comment-region beg end (+ comment-add com-add))
    )
  (end-of-line)
  (if (> (current-column) (+ fill-column 1))
      (delete-backward-char 1)
    ()
   )
  (newline)
  )
(global-set-key (kbd "C-x C") 'comment-fill-aligned)
;; kill the other window buffer
(defun other-window-kill-buffer ()
  "Kill the buffer in the other window"
  (interactive)
  ;; Window selection is used because point goes to a different window
  ;; if more than 2 windows are present
  (let ((win-curr (selected-window))
        (win-other (next-window)))
    (select-window win-other)
    (kill-this-buffer)
    (select-window win-curr)))
(global-set-key (kbd "C-x K") 'other-window-kill-buffer)


(provide 'init-utils)
