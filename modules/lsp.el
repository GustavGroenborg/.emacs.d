(use-package eglot
  :straight t
  :defer t
  :hook ((python-mode . eglot-ensure)
         (c-mode      . eglot-ensure)
         (c++-mode    . eglot-ensure)
         (rust-mode   . eglot-ensure)
         (LaTeX-mode  . eglot-ensure))
  :config
  ;; Optimization: Disable the extensive logging buffer to improve performance
  ;; (Very helpful in TUI/Terminal to reduce noise)
  (setq eglot-events-buffer-size 0)
  
  ;; Optional: Show documentation in the echo area immediately
  (setq eldoc-echo-area-use-multiline-p nil))

(use-package flymake
  :defer t
  :bind (:map flymake-mode-map
	      ("M-n" . flymake-goto-next-error)
	      ("M-p" . flymake-goto-prev-error)))

(use-package company
  :straight t
  :hook (after-init . global-company-mode)
  :config
  ;; Speed up the popup (default is too slow)
  (setq company-idle-delay 0.1) ; Show menu after 0.1 seconds
  (setq company-minimum-prefix-length 1) ; Show menu after typing 1 character
  ;; Make it loop (going down from the last item goes to the top)
  (setq company-selection-wrap-around t)
  (company-tng-mode))

(provide 'lsp)
