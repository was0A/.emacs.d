(require 'org)
(require 'org-modern)
(require 'ob)
(require 'xenops)
;; (run-with-idle-timer 1 nil (lambda () (require 'xenops)))
(load "~/.emacs.d/site-lisp/extensions/auctex/font-latex.el")

(setq
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "..."
 org-startup-with-inline-images nil
 org-todo-keywords
 (quote ((sequence "TODO(t/!)" "STARTED(s)" "|" "DONE(d!)")
	 (sequence "PROJECT(p)" "|" "DONE(d!)" "CANCELLED(c@/!)")
	 (sequence "WAITING(w@/!)" "NEXT(n!/!)"
                   "SOMEDAY(S)" "|" "CANCELLED(c@/!)")))
 org-modern-star '("⦿" "⌾" "⊚" "🞅" "▸" "▹")
 org-src-window-setup 'current-window
 org-confirm-babel-evaluate nil
 xenops-font-height 160
 xenops-reveal-on-entry t
 xenops-math-image-scale-factor	0.9
 org-babel-default-header-args '((:session . "none")
                                 (:results . "replace")
                                 (:exports . "code")
                                 (:cache . "no")
                                 (:noweb . "yes")
                                 (:hlines . "no")
                                 (:tangle . "no"))
 org-babel-load-languages '((emacs-lisp . t)
                            (shell . t)
                            (C . t)
                            (js . t)
                            (latex . t)
                            (python . t))
 org-babel-latex-preamble
 (lambda (_)
   "\\documentclass{standalone}")
 org-babel-latex-pdf-svg-process
 "inkscape \
-n 1 \
--pdf-poppler \
--export-area-drawing \
--export-text-to-path \
--export-plain-svg \
--export-filename=%O \
%f"
 org-babel-default-header-args:latex
 '((:results . "file raw")
   (:exports . "results")
   (:eval . "never-export")
   (:file . (lambda ()
              (let* ((elt (org-element-at-point))
                     (name (org-element-property :name elt))
                     (cap (org-export-get-caption elt))
                     (sha (concat (sha1 (org-element-property :value elt)))))
                (concat (or name cap )
                        ".svg"))))))

(org-babel-do-load-languages 'org-babel-load-languages
                             '((emacs-lisp . t)
                               (shell . t)
                               (C . t)
                               (js . t)
                               (latex . t)
                               (python . t)))


;; 为不同标题级别设置不同字号
(set-face-attribute 'org-level-1 nil :height 1.6)  ; 一级标题 160% 大小
(set-face-attribute 'org-level-2 nil :height 1.4)  ; 二级标题 140%
(set-face-attribute 'org-level-3 nil :height 1.2)  ; 三级标题 120%
(set-face-attribute 'org-level-4 nil :height 1.0)  ; 四级标题 100%
(set-face-attribute 'org-table nil :family "Iosevka")

(defun +buffer-face-mode-variable ()
  (interactive)
  (make-face 'width-font-face)
  (set-face-attribute 'width-font-face nil :font "Iosevka 14")
  (setq buffer-face-mode-face 'width-font-face)
  (buffer-face-mode))
(add-hook 'org-mode-hook '+buffer-face-mode-variable)

(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-mode-hook (lambda () (run-with-idle-timer 1 nil (lambda () (xenops-mode) (font-lock-fontify-buffer)))))
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'org-mode-hook (lambda ()
                           (make-local-variable 'font-lock-extra-managed-props)
                           (svg-tag-mode)))
(add-hook 'org-mode-hook (lambda ()
                           (toggle-word-wrap 1)
			   (toggle-truncate-lines -1)))
;; (add-hook 'org-babel-after-execute-hook #'org-redisplay-inline-images)

(defun my/text-scale-adjust-latex-previews ()
  "Adjust the size of latex preview fragments when changing the
buffer's text scale."
  (pcase major-mode
    ('latex-mode
     (dolist (ov (overlays-in (point-min) (point-max)))
       (if (eq (overlay-get ov 'category)
               'preview-overlay)
           (my/text-scale--resize-fragment ov))))
    ('org-mode
     (dolist (ov (overlays-in (point-min) (point-max)))
       (if (eq (overlay-get ov 'org-overlay-type)
               'org-latex-overlay)
           (my/text-scale--resize-fragment ov))))))

(defun my/text-scale--resize-fragment (ov)
  (overlay-put
   ov 'display
   (cons 'image
         (plist-put
          (cdr (overlay-get ov 'display))
          :scale (+ 1.0 (* 0.25 text-scale-mode-amount))))))

(add-hook 'text-scale-mode-hook #'my/text-scale-adjust-latex-previews)


(provide 'init-org)
