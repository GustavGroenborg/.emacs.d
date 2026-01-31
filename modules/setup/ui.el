;; Colour theme
(straight-use-package
 '(everforest :type git :host github :repo "theorytoe/everforest-emacs"))

(load-theme 'everforest-hard-dark t)

;; General UI settings
(setq-default fill-column 80)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(menu-bar-mode -1)

;; Disabled until I find a way to get emojis to work.
;; Appearently this will not work, unless I use the GUI version of
;; emacs, which I will not do. No nyan-cat for me.
;; (use-package nyan-mode
;;   :straight t
;;   :init
;;   (nyan-mode))


(provide 'setup/ui)
