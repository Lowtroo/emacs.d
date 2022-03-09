(require 'kaolin-themes)
(load-theme 'kaolin-galaxy t)
(require 'pyim)
(require 'pyim-basedict)

(defun my-set-terminal-coding-system (&optional frame)
  "Force ther terminal use proper coding system of utf-8"
  (with-selected-frame (or frame (selected-frame))
    (unless window-system
      (set-language-environment "UTF-8")
      (prefer-coding-system 'utf-8)

      (set-default-coding-systems 'utf-8)
      (set-keyboard-coding-system 'utf-8-unix)
      (set-terminal-coding-system 'utf-8-unix)
      
      (set-buffer-file-coding-system 'utf-8-unix)
      
      ;; (set-next-selection-coding-system 'utf-8-unix) ;; for x window 
      ;; (set-selection-coding-system 'utf-8-unix) ;; for x window 

      (setq locale-coding-system 'utf-8)
      
      (pyim-basedict-enable)
      (setq default-input-method "pyim")
      (pyim-default-scheme 'quanpin)
      ;; 显示5个候选词
      (setq pyim-page-length 5))))

(my-set-terminal-coding-system)
(add-hook 'after-make-frame-functions 'my-set-terminal-coding-system)

(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-splash-screen t)

(set-frame-font "Hack 12" nil t)
(global-hl-line-mode t)

(provide 'init-ui)
