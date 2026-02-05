(use-package multiple-cursors
  :straight t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-S-c C-S-c" . mc/edit-lines)))

(provide 'setup/qol)
