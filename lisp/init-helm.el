(require 'helm)
(require 'helm-config)
(require 'helm-xref)
(require 'helm-ag)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)

;; (when (executable-find "ack")
;;   (setq helm-grep-default-command "ack -Hn --no-group --no-color %e %p %f"
;;         helm-grep-default-recurse-command "ack -H --no-group --no-color %e %p %f"))

(semantic-mode 1)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)

(setq helm-findutils-search-full-path t)


(setq helm-apropos-fuzzy-match t)

(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

(global-set-key (kbd "C-c h x") 'helm-register)
(global-set-key (kbd "C-c h g") 'helm-do-ag-project-root)

(helm-autoresize-mode t)

(helm-mode 1)


(custom-set-variables
 '(helm-ag-base-command "rg --no-heading --smart-case")
 '(helm-ag-success-exit-status '(0 2)))


(provide 'init-helm)
