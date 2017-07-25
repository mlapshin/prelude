(use-package swiper
  :init
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

  :config
  (ivy-mode t)
  (use-package flx)
  (use-package counsel)

  (set-face-attribute 'ivy-current-match nil
                      :background "#005f87"
                      :foreground "#afd7ff"
                      :bold t)

  (set-face-attribute 'ivy-minibuffer-match-face-1 nil
                      :background "#9a08ff"
                      :foreground "white")

  (set-face-attribute 'ivy-minibuffer-match-face-2 nil
                      :background "#ff1f8b"
                      :foreground "white")

  (set-face-attribute 'ivy-minibuffer-match-face-3 nil
                      :background "#ff5d17"
                      :foreground "white")

  (set-face-attribute 'ivy-minibuffer-match-face-4 nil
                      :background "#008700"
                      :foreground "white")

  :bind (("C-s" . swiper)
         ("M-x" . counsel-M-x)
         ("C-x C-r" . counsel-ag)
         ("C-x b" . ivy-switch-buffer)
         ("C-x C-f" . counsel-find-file)
         ("C-x C-p" . counsel-git)
         :map ivy-minibuffer-map
         ("M-j" . ivy-next-line)
         ("M-k" . ivy-previous-line)
         ("M-w" . ivy-yank-word)
         ("RET" . ivy-alt-done)
         ("C-w" . ivy-backward-kill-word)))
