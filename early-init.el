;;; early-init.el --- Early init -*- lexical-binding: t; -*-

;; 启动时先别让 package.el 自动介入
(setq package-enable-at-startup nil)

;; 稍微减少启动时的 UI 干扰
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 启动时先别做太多 GC
(setq gc-cons-threshold most-positive-fixnum)

;; 启动完成后恢复一个更合理的 GC 阈值
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 64 1024 1024))))
