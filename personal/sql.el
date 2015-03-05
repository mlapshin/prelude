(eval-after-load 'sql
  '(progn
     (define-key sql-mode-map (kbd "C-x C-e") 'sql-send-region)))

(add-to-list 'prelude-indent-sensitive-modes
             'sql-mode)
