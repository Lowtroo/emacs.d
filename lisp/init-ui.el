(require 'zenburn-theme)
(load-theme 'zenburn t)

(with-eval-after-load 'zenburn-theme
 (zenburn-with-color-variables
  (custom-theme-set-faces
   'user
   ;;;;; hl-line-mode
   `(hl-line-face ((t (:background ,zenburn-bg+05))))
   `(hl-line ((t (:background ,zenburn-bg+05))))
   ;; `(ivy-current-match ((t (:background ,zenburn-bg+05
   ;; 					:foreground ,"#F0DFAF"
   ;; 					:weight bold
   ;; 					:extend t))))
   )))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(global-hl-line-mode t)
(setq initial-frame-alist
      '(
	(width . 144)
	(height . 45)
	(top . 150)
	(lef . 437)
	))
(setq default-frame-alist initial-frame-alist)


(defun my-set-terminal-coding-system (&optional frame)
  "Force ther terminal use proper coding system of utf-8"
  (with-selected-frame (or frame (selected-frame))
    (unless window-system
      (require 'pyim)
      (require 'pyim-basedict)
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
      ;; 显示9个候选词
      (setq pyim-page-length 9))))

(my-set-terminal-coding-system)
(add-hook 'after-make-frame-functions 'my-set-terminal-coding-system)


(provide 'init-ui)
