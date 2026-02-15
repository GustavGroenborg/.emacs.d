(use-package cmake-mode
  :straight t
  :mode ("CMakeLists\\.txt\\'" . cmake-mode)
  :config
  (setq cmake-tab-width 4))

(use-package find-file
  :defer t
  :config
  (add-to-list 'cc-other-file-alist '("\\.cppm\\'" (".cpp")))
  (add-to-list 'cc-other-file-alist '("\\.cpp\\'" (".hpp" ".h" ".cppm"))))

(use-package cc-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.cppm\\'" . c++-mode))
  :hook
  (c-mode-common . (lambda ()
                     (auto-fill-mode)
                     (eglot-ensure)))
  :bind
  (:map c++-mode-map
	;; Quick switching between header and source
	("C-c o" . ff-find-other-file)
	("C-c C-c" . project-compile))
  :config
  (setq-default c-basic-offset 4)
  (setq-default indent-tabs-mode nil)
  (setq c-default-style "linux")
  (setq c-doc-comment-style 'javadoc)
  (setq compile-command "cmake --build build")
  (setq fill-column 80)
  (setq comment-auto-fill-only-comments t))

(provide 'languages/cc)
		      
