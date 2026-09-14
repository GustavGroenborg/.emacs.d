(use-package lean4-mode
  :straight (lean4-mode
	            :type git
             :host github
	            :repo "bustercopley/lean4-mode"
	            :files ("*.el" "data")))

(with-eval-after-load 'lean4-mode
  (keymap-set lean4-mode-map "C-c C-k" #'quail-show-key)
  (keymap-set lean4-mode-map "C-c C-i" #'lean4-toggle-info)
  (keymap-set lean4-mode-map "C-c C-d" #'lean4-refresh-file-dependencies))

(provide 'languages/lean4)
