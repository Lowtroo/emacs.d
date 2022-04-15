(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 100000000)

(defun baal-setup-lsp-company ()
  (setq-local company-backends
              '(company-capf company-dabbrev company-dabbrev-code)))

(add-hook 'lsp-completion-mode-hook #'baal-setup-lsp-company)
(provide 'init-lsp)
