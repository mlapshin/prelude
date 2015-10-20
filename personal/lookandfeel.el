(prelude-require-packages '(moe-theme
                            powerline
                            flx
                            window-numbering
                            smooth-scroll))

(require 'flx) ;; fix: missing face flx-highlight-face on mac os

(require 'powerline)
(require 'moe-theme)
(require 'smooth-scroll)
(require 'grizzl)

;; jump between windows by numbers
(require 'window-numbering)
(window-numbering-mode t)

(setq global-hl-line-mode nil
      smooth-scroll-mode t
      smooth-scroll-margin 3
      visible-bell nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(defun ml-customize-faces ()
  (dolist (face '(font-lock-keyword-face))
    (set-face-attribute face nil :weight 'bold))

  (set-face-attribute 'window-numbering-face nil
                      :foreground "#101010" :weight 'bold)

  (set-face-attribute 'flx-highlight-face nil
                      :inherit 'highlight :underline nil)

  (set-face-attribute 'flycheck-warning nil
                      :inherit 'unspecified)

  (set-face-attribute 'grizzl-selection-face nil
                      :inherit 'company-tooltip-common-selection)

  (dolist (face '(whitespace-empty whitespace-hspace))
    (set-face-attribute face nil :background 'unspecified)))

(defun ml-customizations-for-window-system ()
  (require 'powerline)
  (powerline-default-theme)
  (set-face-attribute 'default nil :height 135))

(defun ml-light-theme ()
  (interactive)
  (setq moe-theme-highlight-buffer-id nil)
  (setq moe-theme-mode-line-color 'blue)
  (setq moe-light-pure-white-background-in-terminal t)

  (set-face-attribute 'whitespace-line nil
                      :foreground 'unspecified
                      :background "#dadada")

  (set-face-foreground 'sp-show-pair-match-face "white")

  (set-face-attribute 'whitespace-tab nil
                      :inherit nil
                      :background "white"
                      :foreground 'unspecified)

  (moe-light)
  (powerline-moe-theme))

(defun ml-dark-theme ()
  (interactive)
  (setq moe-theme-highlight-buffer-id nil)
  (setq moe-theme-mode-line-color 'orange)

  (moe-dark)
  (powerline-moe-theme)

  (set-face-attribute 'whitespace-line nil
                      :foreground 'unspecified
                      :background "#4e4e4e")

  ;; TODO: fix it
  (set-face-attribute 'default nil
                      :background 'unspecified))

(ml-dark-theme)

(add-hook 'after-init-hook 'ml-customize-faces)

(when window-system
  (add-hook 'after-init-hook
            'ml-customizations-for-window-system))

(defun ml-temporary-remove-minibuff-background (orig-fun &rest args)
  (let ((original-bg (face-attribute 'minibuffer-prompt :background)))
    (set-face-attribute 'minibuffer-prompt nil :background nil)

    (let ((res (unwind-protect
                   (apply orig-fun args)
                 (set-face-attribute 'minibuffer-prompt nil
                                     :background original-bg))))
      res)))

(advice-add 'grizzl-completing-read
            :around #'ml-temporary-remove-minibuff-background)
