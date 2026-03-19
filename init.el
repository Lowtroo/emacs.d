;;; init.el --- Init -*- lexical-binding: t; -*-

;; --------------------------------
;; Package manager: package.el
;; --------------------------------
(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("melpa" . "https://melpa.org/packages/")
	))

(package-initialize)

;; 刷新包索引
(unless package-archive-contents
  (package-refresh-contents))

;; Emacs 29+ 通常自带 use-package；
;; 如果没有，就自动安装
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; --------------------------------
;; Load literate config
;; --------------------------------
(require 'org)

(defvar my/config-org (expand-file-name "config.org" user-emacs-directory))
(defvar my/config-el  (expand-file-name "config.el"  user-emacs-directory))

;; 如果 config.el 不存在，或者 config.org 更新了，就重新 tangle
(when (or (not (file-exists-p my/config-el))
          (file-newer-than-file-p my/config-org my/config-el))
  (org-babel-tangle-file my/config-org my/config-el "emacs-lisp"))

(load my/config-el nil 'nomessage)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auctex cdlatex cmake-mode cnfonts company corfu counsel
	    dracula-theme exec-path-from-shell expand-region
	    find-file-in-project format-all go-mode hungry-delete
	    kaolin-themes lsp-treemacs lsp-ui lua-mode monokai-theme
	    org-roam pyim-basedict smart-mode-line smartparens
	    term-keys zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
