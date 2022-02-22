(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 100000000)


(provide 'init-lsp)
