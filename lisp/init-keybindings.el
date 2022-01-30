(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "M-=") 'er/expand-region)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(provide 'init-keybindings)
