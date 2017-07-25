(setq js-indent-level 2)
(setq js2-basic-offset 2)

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("work/narus/narus-web/.*?\\.js\\'" . web-mode))

  :config
  (setq web-mode-attr-indent-offset 4)
  (setq web-mode-enable-auto-pairing nil)

  (use-package smartparens)

  (defun sp-web-mode-is-code-context (id action context)
    (and (eq action 'insert)
         (not (or (get-text-property (point) 'part-side)
                  (get-text-property (point) 'block-side)))))

  (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))

  (add-hook 'web-mode-hook
            (lambda ()
              (if (and (equal web-mode-content-type "javascript")
                       (string-match "work/narus/narus-web/.*?\\.js\\'" (buffer-file-name)))
                  (progn
                    (require 'prettier-js)
                    (setq prettier-target-mode "web-mode")
                    (add-hook 'before-save-hook 'prettier-before-save)
                    (local-set-key (kbd "C-M-\\") 'prettier)
                    (web-mode-set-content-type "jsx")))
              (message "web-mode content type: %s" web-mode-content-type))))
