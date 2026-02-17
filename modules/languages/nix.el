(use-package nix-mode
  :straight t
  :mode "\\.nix\\'"
  :hook
  (nix-mode . eglot-ensure)
  :config
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		 '(nix-mode . ("nixd")))))

(provide 'languages/nix)
