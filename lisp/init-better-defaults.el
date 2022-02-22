(setq ring-bell-function 'ignore)

;; 自动加载外部修改过的文件
(global-auto-revert-mode t)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode t))

;; 关闭自动备份文件
(setq make-backup-files nil)

;; 关闭自动保存文件
(setq auto-save-default nil)

;; set tabs instead of spaces
(setq-default indent-tabs-mode t)

(recentf-mode 1)			
(setq recentf-max-menu-items 25)

(define-advice show-paren-data-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)


(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer. "
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)

(setq dired-dwim-target t)

(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)







(provide 'init-better-defaults)
