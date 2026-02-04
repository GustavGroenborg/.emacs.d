;; Colour theme
(straight-use-package
 '(everforest :type git :host github :repo "theorytoe/everforest-emacs"))

(load-theme 'everforest-hard-dark t)

;; General UI settings
(setq-default fill-column 80)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package nyan-mode
  :straight t
  :init
  (nyan-mode))

(provide 'setup/ui)
