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
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(set-frame-font "Hack 14" nil t)
(global-hl-line-mode t)

(provide 'init-ui)
