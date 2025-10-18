(require 'rime)
(require 'posframe)
(require 'pangu-spacing)
(autoload 'jieba-mode "jieba.el" "Load Jieba.el." t)


(setq rime-user-data-dir "~/.local/share/fcitx5/rime"
      rime-show-candidate 'posframe
      rime-posframe-properties
      (list :background-color "#333333"
            :foreground-color "#dcdccc"
            :font "WenQuanYi Micro Hei Mono"
            :internal-border-width 10)
      default-input-method "rime"
      pangu-spacing-real-insert-separtor t)

(add-hook! (text-mode markdown-mode org-mode) 'pangu-spacing-mode)
(add-hook! (text-mode markdown-mode org-mode) 'jieba-mode)


(provide 'init-chinese)
