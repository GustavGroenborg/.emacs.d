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
  (add-hook 'magit-post-clone-hook #'my/register-cloned-project))

(provide 'setup/magit)
