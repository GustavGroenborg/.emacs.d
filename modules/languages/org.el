(use-package org
  :straight t
  :defer t
  :custom
  (fill-column 80)
  (org-startup-with-inline-images t)
  :hook
  (org-mode . auto-fill-mode)
  (org-mode . (lambda () (company-mode -1)))
  :config
  (require 'org-tempo)
  ;; Enable Python execution in Org-mode
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t))) ;; <--- The magic line
  
  ;; Stop Emacs from asking "Do you want to run this?" every time
  (setq org-confirm-babel-evaluate nil)
  
  (defun my/org-insert-python-block ()
  "Insert a Python block using the most recently used session name."
  (interactive)
  (let ((session-name "*python*")) ;; Default name
    ;; Search backward in the file without moving the cursor permanently
    (save-excursion
      ;; Look for the regex: #+begin_src python ... :session <NAME>
      (when (re-search-backward "^[ \t]*#\\+begin_src[ \t]+python.*:session[ \t]+\\([^ \t\n]+\\)" nil t)
        (setq session-name (match-string 1))))
    (insert (format "#+begin_src python :session %s :results silent\n\n#+end_src" session-name))
    ;; Move the cursor up one line so it sits perfectly inside the block
    (forward-line -1)))
  (define-key org-mode-map (kbd "C-c s") 'my/org-insert-python-block)

  ;; The below two functions is loosly inspired by this answer https://emacs.stackexchange.com/a/22147
  (defun my/org-child-checkboxes-complete-p ()
    "Return t if all child checkboxes are marked as complete"
    (let ((end (line-end-position))
	  (is-complete nil))
      (save-excursion
	(when (re-search-forward "\\[\\([0-9]*%\\)\\]\\|\\[\\([0-9]*\\)/\\([0-9]*\\)\\]" end t)
	  (setq is-complete (if (match-end 1) (string-equal (match-string 1) "100%")
			      (and (match-string 2) (string-equal (match-string 2) (match-string 3)))))))
    is-complete))

  (defun my/org-update-parent-task-state ()
    "Updates the state of the parent task when all child checkboxes are ticked."
    (let ((todo-state (org-get-todo-state)))
      (when todo-state
	(save-excursion
	  (org-back-to-heading t)
	  (if (my/org-child-checkboxes-complete-p)
	      (unless (string-equal todo-state "DONE")
		(org-todo 'done))
	    ;; Relevant in the case, when checkboxes are unchecked
	    (unless (string-equal todo-state "TODO")
	      (org-todo 'todo)))))))
  
  ;; Automatically show plots/images after a block finishes
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

  ;; Automically updates parent task upon checkbox toggle
  (add-hook 'org-checkbox-statistics-hook 'my/org-update-parent-task-state))

(provide 'languages/org)
