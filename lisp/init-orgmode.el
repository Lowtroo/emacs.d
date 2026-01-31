(add-hook 'org-mode-hook #'visual-line-mode)
(setq org-agenda-files (quote ("~/Diary")))
(setq org-capture-templates
      '(("j" "Journal" plain
	 (file+olp+datetree "/Users/xieyuhuai/Diary/journal.org")
	 "\n%?\n%i\n" :empty-lines-after 1)))
(provide 'init-orgmode)
