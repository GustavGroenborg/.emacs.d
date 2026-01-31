(use-package python
  :straight (:type built-in)
  :hook (python-mode . eglot-ensure) ; Auto-start Eglot
  :config
  ;; Optimization: Don't guess indent, it can be slow in TUI
  (setq python-indent-guess-indent-offset-verbose nil))

(use-package pyvenv
  :straight t
  :config
  ;; Tell pyvenv where your pyenv versions are located
  ;; This makes "M-x pyvenv-workon" list your pyenv versions!
  (setq pyvenv-workon-home (expand-file-name "~/.pyenv/versions"))
  )

(provide 'languages/python)
