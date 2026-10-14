(use-package go-mode
  :straight t
  :defer t
  :hook 
  ;; 1. Automatically start the language server
  (go-mode . eglot-ensure)
  
  ;; 2. Automatically format the code before saving (buffer-local hook)
  (go-mode . (lambda ()
               (add-hook 'before-save-hook #'gofmt-before-save nil t)))
  
  :config
  ;; Tell the formatter to use 'goimports' instead of standard 'gofmt'
  (setq gofmt-command "goimports")
  
  ;; Go standard dictates 8-space tabs, but if you prefer 4, uncomment this:
  ;; (setq tab-width 4)
  )

(provide 'languages/go)
