(use-package eglot
  :straight t
  :defer t
  :preface
  (defun my/eglot-org-src-fix ()
    "Enables Pyright to start in temporary org-mode buffer"
    (when (derived-mode-p 'python-mode)
      (setq-local buffer-file-name (expand-file-name ".org_tmp_src.py" default-directory))
      (eglot-ensure)))
  :hook ((python-mode  . eglot-ensure)
         (c-mode       . eglot-ensure)
         (c++-mode     . eglot-ensure)
         (rust-mode    . eglot-ensure)
         (LaTeX-mode   . eglot-ensure)
	 (org-src-mode . my/eglot-org-src-fix))
  :config
  ;; Optimization: Disable the extensive logging buffer to improve performance
  ;; (Very helpful in TUI/Terminal to reduce noise)
  ;;(setq eglot-events-buffer-size 0)
  
  ;; Optional: Show documentation in the echo area immediately
  (setq eldoc-echo-area-use-multiline-p nil)
  (setq compilation-finish-functions
        (lambda (buf str)
          (if (null (string-match "exited abnormally" str))
              (run-at-time
               "2 sec" nil 'delete-windows-on
               (get-buffer-create "*compilation*"))
            (message "The program compiled surprisingly well!"))))

  (add-to-list 'eglot-server-programs
               '((c++-mode c-mode)
                 . ("clangd"
                    "--header-insertion=never" ;; change to 'iwyu' if wanting insertion
                    "--compile-commands-dir=build"
                    )))
  (add-to-list 'eglot-ignored-server-capabilities :documentOnTypeFormattingProvider)
  (add-to-list 'display-buffer-alist
               '("\\*compilation\\*"
                 (display-buffer-reuse-window display-buffer-in-side-window)
                 (side . bottom)
                 (reusable-frames . visible)
                 (window-height . 0.2))))

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
