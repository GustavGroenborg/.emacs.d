(use-package java-mode
  :defer t
  :hook
  (java-mode . eglot-ensure)
  :config
  (setq c-basic-offset 4))
(provide 'languages/java)
