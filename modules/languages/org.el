
(use-package org
  :straight t
  :defer t
  :custom
  (fill-column 80)
  (org-startup-with-inline-images t)
  :hook
  (org-mode . auto-fill-mode)
  :config
  (require 'org-tempo)
  ;; Enable Python execution in Org-mode
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t))) ;; <--- The magic line

  (defun my/org-insert-auto-session-block ()
  "Insert a Python block using the most recently used session name."
  (interactive)
  (let ((session-name "*python*")) ;; Default name
    ;; 1. Search backward in the file without moving the cursor permanently
    (save-excursion
      ;; Look for the regex: #+begin_src python ... :session <NAME>
      (when (re-search-backward "^[ \t]*#\\+begin_src[ \t]+python.*:session[ \t]+\\([^ \t\n]+\\)" nil t)
        ;; If found, grab the <NAME> part
        (setq session-name (match-string 1))))
    ;; 2. Insert the fully formatted block with the dynamically found name
    (insert (format "#+begin_src python :session %s :results output\n\n#+end_src" session-name))
    ;; 3. Move the cursor up one line so it sits perfectly inside the block
    (forward-line -1)))

  ;; Bind it to a fast shortcut (like C-c s) in Org-mode
  (define-key org-mode-map (kbd "C-c s") 'my/org-insert-auto-session-block)

  ;; Stop Emacs from asking "Do you want to run this?" every time
  (setq org-confirm-babel-evaluate nil)
  
  ;; Automatically show plots/images after a block finishes
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images))

(provide 'languages/org)
