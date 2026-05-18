(use-package magit
  :straight t
  :config
  (setq magit-clone-default-directory "~/projects/")
  (defun my/register-cloned-project ()
    "Register a newly cloned directry as a project"
    (let ((repo-dir default-directory))
      (when-let ((pr (project-current nil repo-dir)))
	(project-remember-project pr)
	(message "Registered new project: %s" repo-dir))))
  (add-hook 'magit-post-clone-hook #'my/register-cloned-project)

  ;; Automatically reload files on, e.g. git checkout
  (global-auto-revert-mode 1)
  ;; As above, but for non-file buffer, e.g. dired
  (setq global-auto-revert-non-file-buffers t)
  (setq auto-revert-check-vc-info t)
  (add-hook 'magit-post-checkout-hook (lambda () (force-mode-line-update t))))

(provide 'setup/magit)
