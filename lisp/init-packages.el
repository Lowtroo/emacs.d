(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
			   ("melpa" . "https://melpa.org/packages/")
			   ("cselpa" . "https://elpa.thecybershadow.net/packages/"))))
(require 'cl)

;; Add packages
(defvar my/packages '(
		      helm
		      helm-ag
		      helm-lsp
		      helm-xref
		      lsp-treemacs
		      lsp-ui
		      ;; --- Auto-completion ---
		      company		
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      expand-region
		      term-keys
		      smart-mode-line
		      cnfonts
		      ;; --- Major Mode ---

		      lua-mode
		      org-roam
		      ;; --- Minor Mode ---
		      exec-path-from-shell
		      lsp-mode
		      ;; --- Themes ---
		      monokai-theme
		      dracula-theme
		      kaolin-themes
		      ;; solarized-theme
		      ;; input method
		      pyim
		      pyim-basedict
		      ;; cxx language
		      
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))


(global-hungry-delete-mode t)

(smartparens-global-mode t)

(global-company-mode t)
(setq company-minimum-prefix-length 3
      company-idle-delay 0.05)



(provide 'init-packages)



