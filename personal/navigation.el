(defun ml-smart-beginning-of-line ()
  (interactive)

  (let ((saved-point (point)))
    (beginning-of-line-text)
    (if (= saved-point (point)) (beginning-of-line))))

(global-set-key (kbd "C-a") 'ml-smart-beginning-of-line)

(defun ml-scroll-up ()
  (interactive)
  (scroll-up 5))

(defun ml-scroll-down ()
  (interactive)
  (scroll-down 5))

(global-set-key (kbd "s-j") 'ml-scroll-down)
(global-set-key (kbd "s-k") 'ml-scroll-up)
