(require 'lazy-load)


;;; 增强 minibuffer

(lazy-load-local-keys
 '(("C-<backspace>" . vertico-directory-up))
 minibuffer-local-map
 "vertico-directory")

(lazy-load-global-keys
 '(([remap switch-to-buffer] . consult-buffer)
   ([remap goto-line] . consult-goto-line)
   ("C-c l" . consult-line)
   ("M-y" . consult-yank-pop)
   ("C-c g" . consult-grep))
 "consult")


;;; 绑定跳转快捷键
(lazy-load-global-keys
 '(("C-." . remember-init)
   ("C-," .  remember-jump))
 "init-utils")


;;; 关闭当前 buffer
(lazy-load-global-keys
 '(("C-;" . jump-last-buffer))
 "init-utils")

;;; 复制当前行并插入到下方
(lazy-load-global-keys
 '(("C-<return>" . copy-and-insert-newline))
 "init-utils")


;;; 管理 Tab-bar
(lazy-load-set-keys
 '(("C-c t r" . tab-bar-rename-tab)
   ("C-c t i" . tab-bar-new-tab)
   ("C-c t x" . tab-bar-close-tab)
   ("C-c t n" . tab-bar-switch-to-next-tab)
   ("C-c t e" . tab-bar-switch-to-prev-tab)))


;;; fingertip: 结构化编辑
(defvar fingertip-key-alist nil)
(setq fingertip-key-alist
      '(
        ;; 移动
        ("M-p" . fingertip-jump-left)
        ("M-n" . fingertip-jump-right)
        ;; 符号插入
        ("%" . fingertip-match-paren)            ;括号跳转
        ("(" . fingertip-open-round)             ;智能 (
        ("[" . fingertip-open-bracket)           ;智能 [
        ("{" . fingertip-open-curly)             ;智能 {
        (")" . fingertip-close-round)            ;智能 )
        ("]" . fingertip-close-bracket)          ;智能 ]
        ("}" . fingertip-close-curly)            ;智能 }
        ("（" . fingertip-open-chinese-round)    ;智能 （
        ("「" . fingertip-open-chinese-bracket)  ;智能 「
        ("【" . fingertip-open-chinese-curly)    ;智能 【
        ("）" . fingertip-close-chinese-round)   ;智能 ）
        ("」" . fingertip-close-chinese-bracket) ;智能 」
        ("】" . fingertip-close-chinese-curly)   ;智能 】
        ("\"" . fingertip-double-quote)          ;智能 "
        ("'" . fingertip-single-quote)           ;智能 '
        ("=" . fingertip-equal)                  ;智能 =
        ("SPC" . fingertip-space)                ;智能 space
        ("RET" . fingertip-newline)              ;智能 newline
        ;; 删除
        ("DEL" . fingertip-backward-delete) ;向后删除
        ("C-d" . fingertip-forward-delete)  ;向前删除
        ("C-k" . fingertip-kill)            ;向前kill
        ;; 包围
        ("M-\"" . fingertip-wrap-double-quote) ;用 " " 包围对象, 或跳出字符串
        ("M-'" . fingertip-wrap-single-quote) ;用 ' ' 包围对象, 或跳出字符串
        ("M-[" . fingertip-wrap-bracket)      ;用 [ ] 包围对象
        ("M-{" . fingertip-wrap-curly)        ;用 { } 包围对象
        ("M-(" . fingertip-wrap-round)        ;用 ( ) 包围对象
        ("M-)" . fingertip-unwrap)            ;去掉包围对象
        ;; 跳出并换行缩进
        ("C-j" . fingertip-jump-out-pair-and-newline)
	))
(lazy-load-set-keys fingertip-key-alist fingertip-mode-map)


;; lsp-bridge: 自动补全
(lazy-load-global-keys
 '(("e" . lsp-bridge-popup-documentation)
   ("d" . lsp-bridge-find-def)
   ("D" . lsp-bridge-find-def-return)
   ("n" . lsp-bridge-find-references)
   ("r" . lsp-bridge-rename)
   ("a" . lsp-bridge-code-action)
   ("s" . lsp-bridge-toggle-sdcv-helper)
   ("p" . lsp-bridge-peek)
   ("v" . lsp-bridge-avy-peek)
   ("t" . lsp-bridge-peek-through)
   ("i n" . lsp-bridge-diagnostic-jump-next)
   ("i p" . lsp-bridge-diagnostic-jump-prev)
   ("i l" . lsp-bridge-diagnostic-list)
   ("i i" . lsp-bridge-diagnostic-ignore))
 "init-lsp-bridge"
 "C-c d")


;;; corfu: 自动补全框架
;; (lazy-load-local-keys
;;  '(([tab] . yas-expand))
;;  corfu-map
;;  "init-completion")


;;; dirvish: 文件浏览器
(lazy-load-global-keys
 '(("d" . dirvish)
   ("s" . dirvish-side))
 "init-dired"
 "C-c i")

(with-eval-after-load 'dirvish
  (lazy-load-local-keys
   '(;; (";" . dired-up-directory)  ; So you can adjust dired bindings here
     ("?"   . dirvish-dispatch)     ; contains most of sub-menus in dirvish extensions
     ("y"   . dirvish-yank-menu)
     ("s"   . dirvish-setup-menu)   ; `st' toggles mtime, `ss' toggles file size, etc.
     ("M-f" . dirvish-file-info-menu)
     ("M-l" . dirvish-ls-switches-menu)
     ("M-m" . dirvish-mark-menu)
     ("M-t" . dirvish-layout-toggle)
     ("M-e" . dirvish-emerge-menu))
   dirvish-mode-map
   "dirvish"))


;;; 保存恢复工作布局
(lazy-load-global-keys
 '(("s" . emacs-session-save)
   ("l" . emacs-session-restore)
   ("r" . recentf))
 "init-sessions"
 "C-c s")


;;; maple-run: 编译并运行
(lazy-load-global-keys
 '(("C-c X" . compile-and-run))
 "init-compile-and-run")


;;; embark: 选中后操作
(lazy-load-global-keys
 '(("C-c C-e" . embark-act))
 "embark")


;;; avy: 快速跳转
(lazy-load-global-keys
 '(("c" . avy-goto-char-timer)
   ("l" . avy-goto-line))
 "init-avy"
 "C-c a")

;;; avy-thing-edit: 快速跳转并执行操作
(lazy-load-global-keys
 '(("s" . avy-thing-copy-sexp)
   ("S" . avy-thing-cut-sexp)
   ("e" . avy-thing-copy-email)
   ("E" . avy-thing-cut-email)
   ("f" . avy-thing-copy-filename)
   ("F" . avy-thing-cut-filename)
   ("u" . avy-thing-copy-url)
   ("U" . avy-thing-cut-url)
   ("w" . avy-thing-copy-word)
   ("W" . avy-thing-cut-word)
   ("m" . avy-thing-copy-symbol)
   ("M" . avy-thing-cut-symbol)
   ("d" . avy-thing-copy-defun)
   ("D" . avy-thing-cut-defun)
   ("," . avy-thing-copy-sentence)
   ("." . avy-thing-cut-sentence)
   ("h" . avy-thing-copy-whitespace)
   ("H" . avy-thing-cut-whitespace)
   ("l" . avy-thing-copy-line)
   ("L" . avy-thing-cut-line)
   ("r" . avy-thing-copy-region-or-line)
   ("R" . avy-thing-cut-region-or-line)
   ("k" . avy-thing-copy-to-line-end)
   ("K" . avy-thing-cut-to-line-end)
   ("b" . avy-thing-copy-to-line-beginning)
   ("B" . avy-thing-cut-to-line-beginning)
   ("c" . avy-thing-copy-comment)
   ("C" . avy-thing-cut-comment)
   ("'" . avy-thing-copy-parentheses)
   ("\"" . avy-thing-cut-parentheses))
 "init-avy"
 "C-c c")
(lazy-load-global-keys
 '(("s" . avy-thing-replace-sexp)
   ("e" . avy-thing-replace-email)
   ("f" . avy-thing-replace-filename)
   ("u" . avy-thing-replace-url)
   ("w" . avy-thing-replace-word)
   ("m" . avy-thing-replace-symbol)
   ("d" . avy-thing-replace-defun)
   ("," . avy-thing-replace-sentence)
   ("h" . avy-thing-replace-whitespace)
   ("l" . avy-thing-replace-line)
   ("r" . avy-thing-replace-region-or-line)
   ("k" . avy-thing-replace-to-line-end)
   ("b" . avy-thing-replace-to-line-beginning)
   ("c" . avy-thing-replace-comment)
   ("'" . avy-thing-replace-parentheses))
 "init-avy"
 "C-c r")


;;; blink-search: 快速模糊搜索
(lazy-load-global-keys
 '(("C-c b" . blink-search))
 "init-blink-search")


;;; color-rg: 重构利器
(lazy-load-global-keys
 '(("p" . color-rg-search-input-in-project)
   ("f" . color-rg-search-input-in-current-file))
 "color-rg"
 "C-c C-r")


;;; dape: 利用 dap 协议进行调试
(lazy-load-global-keys
 '(("d" . dape)
   ("b" . dape-breakpoint-toggle))
 "dape"
 "C-x C-a")


;;; ace-window: 对窗口进行快速操作
(lazy-load-unset-keys '("C-x 1" "C-x 0" "C-x 2" "C-x 3"))
(lazy-load-global-keys
 '(;; Actions
   ("o" . ace-window)
   ("z" . toggle-delete-other-windows)
   ("x" . delete-window)
   ("s" . ace-swap-window)
   ;; Resize
   ("H" . shrink-window-horizontally)
   ("N" . enlarge-window)
   ("E" . shrink-window)
   ("I" . enlarge-window-horizontally)
   ("b" . balance-windows)
   ;; Split
   ("h" . split-window-right)
   ("n" . my-split-window-below)
   ("e" . split-window-below)
   ("i" . my-split-window-right)
   ("t" . my-split-window-horizontally)
   ("r" . my-split-window-vertically)
   ;; Undo / Redo
   ("u" . winner-undo)
   ("U" . winner-redo))
 "init-windows"
 "C-c w")


;;; popper: 管理弹出的窗口
(lazy-load-local-keys
 '(("c" . popper-cycle)
   ("y" . popper-toggle-type)
   ("t" . popper-toggle))
 popper-mode-map
 "popper"
 "C-c C-p")

;;; insert-translated-name: 自动为变量起英文名
(lazy-load-global-keys
 '(("C-t" . insert-translated-name-insert))
 "insert-translated-name")


;;; eee.el 对终端应用的集成
(lazy-load-global-keys
 '(("f" . ee-find)
   ("r" . ee-rg)
   ("b" . ee-btop))
 "eee.el"
 "C-c u")


(provide 'init-key)
