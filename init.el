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

