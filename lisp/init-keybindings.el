(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2> m") 'open-my-init-file)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "M-=") 'er/expand-region)

;; (setq mac-command-modifier 'meta ;; the position of it is like Alt key
;;       mac-option-modifier 'super ;;
;;       mac-right-command-modifier 'meta ;; is also reachable for right thumb
;;       mac-right-option-modifier 'none  ;; use MacOS defined Option
;;       )

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(provide 'init-keybindings)
