(prelude-require-package 'restclient)

(defun ml-restclient-response-hook ()
  (local-set-key (kbd "q") 'popwin:close-popup-window))

(use-package hydra
  :config
  (setq restclient-response-loaded-hook 'ml-restclient-response-hook))
