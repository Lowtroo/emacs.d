

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; install use-package to integrate with it 
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom (straight-use-package-by-default t))


;; packages
(use-package helm)
(use-package helm-ag)
(use-package helm-xref)
(use-package lsp-treemacs)
(use-package lsp-ui)
(use-package company)
(use-package hungry-delete)
(use-package smartparens)
(use-package expand-region)
;;(use-package term-keys)
(use-package smart-mode-line)
(use-package cnfonts)
(use-package yaml-mode)
(use-package lua-mode)
(use-package org-roam)
(use-package exec-path-from-shell)
(use-package lsp-mode)
(use-package kaolin-themes)


;; helm settings  BEGIN
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

(helm-autoresize-mode t)

(helm-mode 1)


(custom-set-variables
 '(helm-ag-base-command "rg --no-heading --smart-case")
 '(helm-ag-success-exit-status '(0 2)))
;; helm settings END

;; Appearance settings BEGIN
(require 'kaolin-themes)
(load-theme 'kaolin-galaxy t)

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(set-default-coding-systems 'utf-8)
(set-file-name-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

(set-buffer-file-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)


(set-next-selection-coding-system 'utf-8-unix)
(set-selection-coding-system 'utf-8-unix)

(setq locale-coding-system 'utf-8)


(tool-bar-mode -1)
(menu-bar-mode -1)
;;(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(set-frame-font "Hack 12" nil t)
(global-hl-line-mode t)
;; Appearance settings END


;; some default settings BEGIN
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
(setq recentf-max-menu-items 100)

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
(global-hungry-delete-mode t)

(smartparens-global-mode t)

(global-company-mode t)
(setq company-minimum-prefix-length 3
      company-idle-delay 0.05)
;; some default settings END

;; keybindings  BEGIN

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(global-set-key (kbd "M-=") 'er/expand-region)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; keybindings  END



;; ccmode BEGIN
(setq c-basic-offset 8)
(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "linux")))

(setq-default c-electric-flag nil)

(defun my-make-CR-do-indent()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)
;; ccmode END


;; lua mode BEGIN
(with-eval-after-load 'lua-mode
  (setq lua-indent-level 8)
  (setq lua-indent-nested-block-content-align t)
  (setq lua-indent-close-paren-align t)
  )
;; lua mode END

;; lsp mode BEGIN
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(setq read-process-output-max (* 1024 1024))
(setq gc-cons-threshold 100000000)
(defun baal-setup-lsp-company ()
  (setq-local company-backends
              '(company-capf company-dabbrev company-dabbrev-code)))

(add-hook 'lsp-completion-mode-hook #'baal-setup-lsp-company)
;; lsp mode END



;; smart mode line BEGIN
(sml/setup)
;; smart mode line END

;; org roam BEGIN
(setq org-roam-directory (file-truename "~/notes/"))
(org-roam-db-autosync-mode)
;; org roam END


;; org latex BEGIN
(setq org-format-latex-options '(
				:foreground default :background default :scale 2.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
	     ("begin" "$1" "$" "$$" "\\(" "\\[")
			       ))
;; org latex END


;; cnfonts BEGIN
(require 'cnfonts)
(cnfonts-mode 1)
;; cnfonts END
