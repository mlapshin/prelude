(prelude-require-package 'hydra)

(use-package hydra
  :config
  (defhydra hydra-ml (:color red :columns 2)
    "ML Hydra"
    ("j" avy-goto-char "jump to char")
    ("l" avy-goto-line "jump to line")
    ("SPC" just-one-space "one space")
    ("u" undo-tree-visualize "undo tree")
    ("y" browse-kill-ring "kill ring")))

(global-set-key (kbd "M-SPC") 'hydra-ml/body)
