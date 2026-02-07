(use-package ls-lisp
  :straight (:type built-in)
  :config
  (setq ls-lisp-use-insert-directory-program nil)
  
  ;; Remove 'uid' and 'gid' from this list to hide Owner and Group
  (setq ls-lisp-verbosity '(size)))

(use-package dired
  :init
  (add-hook 'dired-mode-hook 'auto-revert-mode)
  :config
  ;; Standard listing: "Human readable" sizes, directories first
  (setq dired-listing-switches "-lha --group-directories-first")
  (setq global-auto-revert-non-file-buffers t))

;; Add icons to Dired
(use-package nerd-icons-dired
  :straight t
  :hook (dired-mode . nerd-icons-dired-mode))

(provide 'setup/dired)
