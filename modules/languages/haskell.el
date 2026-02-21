(use-package haskell-mode
  :straight t
  :defer t
  :mode "\\.hs\\'"
  :init
  (defun my/cabal-test ()
    "Runs cabal test from the project root"
    (interactive)
    (if-let ((proj (project-current)))
	(let ((default-directory (project-root proj)))
	  (compile "cabal test"))
      (message "Cannot test, when not in a project")))
  :hook
  (haskell-mode . (lambda ()
		    (eglot-ensure)
		    (interactive-haskell-mode)
		    (turn-on-haskell-indentation)
		    (define-key interactive-haskell-mode-map (kbd "C-c C-c") 'my/cabal-test)))
  :config
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		 '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))))

(provide 'languages/haskell)
