(prelude-require-packages '(ac-cider align-cljlet))
(require 'ac-cider)
(require 'align-cljlet)

(setq clojure-defun-style-default-indent nil
      lisp-indent-offset nil)

(defun cider-repl-reset ()
  (interactive)
  (cider-ensure-connected)
  (save-some-buffers)
  (set-buffer (cider-find-or-create-repl-buffer))
  (goto-char (point-max))
  (insert "(user/reset)")
  (cider-repl-return))

(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)

(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))
