(use-package cmake-mode
  :straight t
  :mode ("CMakeLists\\.txt\\'" . cmake-mode)
  :config
  (setq cmake-tab-width 4))

(use-package cc-mode
  :defer t
  :hook
  ((auto-fill-mode)
   (c++-mode . eglot-ensure)
   (c-mode   . eglot-ensure))

  :bind
  (:map c++-mode-map
	;; Quick switching between header and source
	("C-c o" . ff-find-other-file)
	("C-c C-c" . project-compile))

  :config
  (setq c-default-style "linux")
  (setq-default c-basic-offset 4)
  (setq compile-command "cmake --build build"))

(provide 'languages/cc)
		      
