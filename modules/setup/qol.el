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

(provide 'setup/qol)
