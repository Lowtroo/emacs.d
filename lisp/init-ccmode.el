(setq c-basic-offset 8)
(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "linux")))

(setq-default c-electric-flag nil)

(defun my-make-CR-do-indent()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)


(provide 'init-ccmode)
