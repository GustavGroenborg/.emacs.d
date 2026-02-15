(use-package multiple-cursors
  :straight t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-S-c C-S-c" . mc/edit-lines)))

(use-package windmove
  :config
  (windmove-default-keybindings)
  :bind*
  (("C-S-h" . windmove-left)
   ("C-S-j" . windmove-down)
   ("C-S-k" . windmove-up)
   ("C-S-l" . windmove-right)))

(defun my/vim-copy ()
  "Copy the entire line under the cursor, if nothing is marked."
  (interactive)
  (if (use-region-p) ;; Region is marked -> copy region.
      (call-interactively 'kill-ring-save)
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))
    (message "Yanked current line")))
(global-set-key (kbd "M-w") 'my/vim-copy)
  

(provide 'setup/qol)
