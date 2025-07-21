(require 'dirvish)
(require 'dirvish-extras)
(require 'dirvish-ls)
(require 'dirvish-side)

(with-eval-after-load 'dirvish
  (setq dirvish-attributes
        '(vc-state subtree-state nerd-icons collapse git-msg file-size)
        dirvish-side-attributes
        '(vc-state nerd-icons collapse git-msg file-size))
  (setopt dirvish-subtree-state-style 'nerd)
  (setq dirvish-mode-line-format '(:left (sort symlink) :right (vc-info yank index)))
  (setq dirvish-side-width 38)
  (setq dirvish-header-line-format '(:left (path) :right (free-space)))
  (setq dirvish-path-separators (list "  " "  " "  ")))

(setq dired-listing-switches
      "-l --almost-all --human-readable --group-directories-first --no-group")
(setq dirvish-attributes
        '(nerd-icons file-time file-size subtree-state))

(dirvish-define-preview eza (file)
  "Use `eza' to generate directory preview."
  :require ("eza") ; tell Dirvish to check if we have the executable
  (when (file-directory-p file) ; we only interest in directories here
    `(shell . ("eza" "-al" "--color=always" "--icons=always"
               "--group-directories-first" ,file))))

(push 'eza dirvish-preview-dispatchers)

(dirvish-override-dired-mode)


(provide 'init-dired)
