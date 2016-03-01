(prelude-require-packages '(moe-theme
                            flx
                            window-numbering
                            golden-ratio
                            smooth-scroll))

(require 'flx) ;; fix: missing face flx-highlight-face on mac os
(require 'moe-theme)
(require 'smooth-scroll)

;; jump between windows by numbers
(require 'window-numbering)
(window-numbering-mode t)

(use-package golden-ratio
  :init
  (setq golden-ratio-extra-commands
        '(select-window-0
          select-window-1
          select-window-2
          select-window-3
          select-window-4
          select-window-5
          select-window-6
          select-window-7
          select-window-8
          select-window-9))
  (setq golden-ratio-adjust-factor 1.1)
  :config
  (golden-ratio-mode 1))

(setq global-hl-line-mode nil
      smooth-scroll-mode t
      smooth-scroll-margin 3
      visible-bell nil
      which-function-mode nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(defun ml-customize-faces ()
  (dolist (face '(font-lock-keyword-face))
    (set-face-attribute face nil :weight 'bold))

  (set-face-attribute 'window-numbering-face nil
                      :foreground "black" :weight 'bold)

  (set-face-attribute 'flx-highlight-face nil
                      :inherit 'highlight :underline nil)

  (set-face-attribute 'flycheck-warning nil
                      :inherit 'unspecified)

  (set-face-attribute 'powerline-active2 nil
                      :foreground "white" :background "black")

  (dolist (face '(whitespace-empty whitespace-hspace))
    (set-face-attribute face nil :background 'unspecified)))

(defun ml-customizations-for-window-system ()
  (set-face-attribute 'default nil :height 135))

(defun ml-customize-powerline ()
  (setq-default mode-line-format
                `("%e"
                  (:eval
                   (let*
                       ((active
                         (powerline-selected-window-active))
                        (mode-line
                         (if active 'mode-line 'mode-line-inactive))
                        (face1
                         (if active 'powerline-active1 'powerline-inactive1))
                        (face2
                         (if active 'powerline-active2 'powerline-inactive2))

                        (separator-left
                         (intern
                          (format "powerline-%s-%s"
                                  (powerline-current-separator)
                                  (car powerline-default-separator-dir))))

                        (separator-right
                         (intern
                          (format "powerline-%s-%s"
                                  (powerline-current-separator)
                                  (cdr powerline-default-separator-dir))))
                        (lhs
                         (list
                          (powerline-raw "%*" nil 'l)

                          (powerline-raw "[%l " nil 'l)
                          (powerline-raw "%c]" nil 'r)

                          (powerline-buffer-id nil 'l)
                          (powerline-raw " ")
                          (funcall separator-left mode-line face1)

                          (powerline-major-mode face1 'l)
                          (powerline-process face1)
                          ;; (powerline-minor-modes face1 'l)
                          (powerline-narrow face1 'l)
                          (powerline-raw " " face1)
                          (funcall separator-left face1 face2)
                          (powerline-vc face2 'r)))
                        (rhs
                         (list
                          (powerline-raw global-mode-string face2 'r)
                          (funcall separator-right face2 face1)

                          (powerline-raw " " face1)
                          (powerline-raw "%I" face1 'r))))

                     (concat
                      (powerline-render lhs)
                      (powerline-fill face2
                                      (powerline-width rhs))
                      (powerline-render rhs))))))
  (force-mode-line-update t))

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
  (powerline-moe-theme)
  (ml-customize-powerline))

(defun ml-dark-theme ()
  (interactive)
  (setq moe-theme-highlight-buffer-id nil)
  (setq moe-theme-mode-line-color 'orange)

  (moe-dark)
  (powerline-moe-theme)
  (ml-customize-powerline)

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
