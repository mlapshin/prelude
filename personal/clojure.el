;; (prelude-require-packages '(align-cljlet))
;; (require 'align-cljlet)

;; (setq clojure-defun-style-default-indent nil
;;       lisp-indent-offset nil)

;; (defun cider-repl-reset ()
;;   (interactive)
;;   (cider-ensure-connected)
;;   (save-some-buffers)
;;   (set-buffer (cider-find-or-create-repl-buffer))
;;   (goto-char (point-max))
;;   (insert "(user/reset)")
;;   (cider-repl-return))

;; (define-clojure-indent
;;   ;; compojure
;;   (defroutes 'defun)
;;   (GET 2)
;;   (POST 2)
;;   (PUT 2)
;;   (DELETE 2)
;;   (HEAD 2)
;;   (ANY 2)
;;   (context 2)

;;   ;; sqlingvo
;;   (copy 2)
;;   (create-table 1)
;;   (delete 1)
;;   (drop-table 1)
;;   (insert 2)
;;   (select 1)
;;   (truncate 1)
;;   (update 2))
