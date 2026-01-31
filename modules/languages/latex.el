;; LaTeX related setup
(use-package auctex
  :straight t
  :defer t
  :init
  (setq TeX-command-default "LaTeX") ; Default to pdflatex
  (setq TeX-output-dir "build")
  (setq TeX-save-query nil)
  :hook (LaTeX-mode . (lambda ()
                        (turn-on-reftex)   ; Enable bibliography support
                        (auto-fill-mode)   ; Soft wrap text
                        (TeX-PDF-mode 1)   ; Double-check PDF mode is on
			(add-hook 'after-save-hook
			      (lambda () (TeX-command "LaTeX" 'TeX-master-file -1))
			      nil t)))
  :config
  (require 'tex)

  (setq TeX-view-program-list '(("System Default" "xdg-open %o")))
  (setq TeX-view-program-selection '((output-pdf "System Default")))
  (setq TeX-command-list
        (append 
         (list 
          '("LaTeX" 
            "pdflatex -output-directory=build -file-line-error -interaction=nonstopmode %t"
            TeX-run-TeX nil t :help "Run pdflatex into build dir")
          
          ;; --output-directory tells it where to write the .bbl file
          '("Biber" 
            "biber --outputdirectory=build build/*.bcf" 
            TeX-run-Biber nil t :help "Run Biber in build dir"))
         
         ;; Keep the rest of the commands, removing old LaTeX/Biber entries
         (cl-remove-if (lambda (x) (member (car x) '("LaTeX" "Biber"))) TeX-command-list)))

  (advice-add 'TeX-command-master :before
              (lambda (&rest _)
                (let ((dir (file-name-as-directory "build")))
                  (unless (file-exists-p dir)
                    (make-directory dir))))))

(provide 'languages/latex)
