(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
(setq default-input-method "pyim")
(pyim-default-scheme 'quanpin)


;; 显示5个候选词
(setq pyim-page-length 5)

(provide 'init-inputmethod)
