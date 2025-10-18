(add-to-list 'load-path "~/.emacs.d/site-lisp/configs")

;; 让窗口启动更平滑
(setq frame-inhibit-implied-resize t)
(setq-default inhibit-redisplay t
              inhibit-message t)
(add-hook 'window-setup-hook
          (lambda ()
            (setq-default inhibit-redisplay nil
                          inhibit-message nil)
            (redisplay)))

(require 'cl-lib)
(require 'init-utils)
(require 'init-generic)

(run-with-timer
 0.02 nil
 (lambda ()

   (load-configs
    (add-subdirs-to-load-path (concat user-emacs-directory "site-lisp/") 0)
    (require 'init-theme)
    (require 'init-fonts)
    (require 'init-svg)
    (require 'init-tab)
    (require 'init-windows)
    (require 'init-meow)
    (require 'init-completion)
    (require 'init-treesit)
    ;; (require 'init-indent-bars)
    (require 'init-vc)
    (require 'init-auto-save)
    (require 'init-compile-and-run)
    (require 'init-undo)
    (require 'init-key)
    (require 'init-avy)
    (require 'init-sessions))

   (run-with-timer
    2 nil
    (lambda ()
      (load-configs
       (require 'init-icons)
       (require 'init-dired)
       (require 'init-yas)
       (require 'init-org)
       (require 'init-chinese)
       (require 'init-goggles)
       (require 'init-rainbow)
       (require 'init-eee)
       ;; (require 'init-telega)
       ;; (require 'init-holo-layer)
       (require 'init-lsp)
       ;; (require 'init-dape)
       )))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(xenops)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
