(defun ml-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v"))

  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "C-C C-K") 'compile))

(add-hook 'go-mode-hook 'ml-go-mode-hook)
