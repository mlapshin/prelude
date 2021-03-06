;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))

;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; (setq ac-modes
;;       (append '(comint-mode css-mode less-css-mode coffee-mode)
;;               ac-modes))

(defun ml-company-set-selection (i)
  (interactive "p")
  (message "%s" i)
  (when (company-manual-begin)
    ;; check if popup is flipped
    (let ((multiplier (if (let ((ov company-pseudo-tooltip-overlay))
                            (and ov (< (overlay-get ov 'company-height) 0)))
                          -1 1)))

      (company-set-selection (+ company-selection (* multiplier i))))))

(dolist (m (list company-active-map company-search-map))
  (define-key m (kbd "M-k") (lambda ()
                              (interactive)
                              (ml-company-set-selection -1)))

  (define-key m (kbd "M-j") (lambda ()
                              (interactive)
                              (ml-company-set-selection +1)))

  (define-key m (kbd "M-K")
    (lambda ()
      (interactive)
      (ml-company-set-selection -5)))

  (define-key m (kbd "M-J")
    (lambda ()
      (interactive)
      (ml-company-set-selection +5))))

(setq company-tooltip-align-annotations t)
(setq tab-always-indent 'complete)
(setq company-idle-delay 0.2)
(setq company-tooltip-limit 16)

;; https://github.com/company-mode/company-mode/issues/94#issuecomment-40884387
(define-key company-mode-map [remap indent-for-tab-command]
  'company-indent-for-tab-command)

(setq tab-always-indent 'complete)

(defvar completion-at-point-functions-saved nil)

(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
        (completion-at-point-functions '(company-complete-common-wrapper)))
    (indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
  (let ((completion-at-point-functions completion-at-point-functions-saved))
    (company-complete-common)))
