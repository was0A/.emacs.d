(require 'rainbow-identifiers)
(require 'rainbow-delimiters)
(require 'rainbow-mode)
(require 'symbol-overlay)


(setq symbol-overlay-temp-highlight-on-region t)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'rainbow-identifiers-mode)
(add-hook 'prog-mode-hook #'rainbow-mode)
(add-hook 'prog-mode-hook #'symbol-overlay-mode)


(provide 'init-rainbow)
