(use-package envrc
  :straight t
  :hook (after-init . envrc-global-mode)
  :config
  (add-hook 'envrc-post-reload-hook #'eglot-reconnect))

(provide 'setup/envrc)
