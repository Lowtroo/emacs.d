(add-to-list 'load-path "~/.emacs.d/lisp/")


;; 快速打开配置文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-inputmethod)
(require 'init-ccmode)
(require 'init-luamode)
(require 'init-helm)
(require 'init-lsp)
(require 'init-termkeys)
(require 'init-smart-mode-line)





(setq server-auth-dir "/home/xieyuhuai/.emacs.d/server")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-ag-base-command "rg --no-heading --smart-case")
 '(helm-ag-success-exit-status '(0 2))
 '(package-selected-packages
   '(helm helm-ag helm-lsp helm-xref lsp-treemacs lsp-ui hungry-delete swiper counsel smartparens expand-region term-keys smart-mode-line lua-mode exec-path-from-shell monokai-theme dracula-theme kaolin-themes pyim pyim-basedict)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
