;; basic

(add-to-list 'default-frame-alist `(font . "Iosevka-20"))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)

(setq-default tab-width 8)

(scroll-bar-mode   -1)
(menu-bar-mode     -1)
(tool-bar-mode     -1)

(load-theme 'gruber-darker t nil)

(setq-default indent-tabs-mode nil)
;; enable ido??

(require 'ido)

(ido-mode t)
(ido-everywhere t)

;; binds

(keymap-global-set "M-p" "C-y")

(defun pop-next ()
  (forward-line 1)
  (let ((nl (thing-at-point 'line)))
    (kill-whole-line)
    (forward-line -1)
    (string-trim nl)))

(defun join-next ()
  (let ((nl (pop-next)))
    (move-end-of-line nil)
    (insert " " nl)))

(defun dotf ()
  (interactive)
  (join-next))

(keymap-global-set "C-." 'dotf)

;; haskell-mode

(require 'haskell-interactive-mode)
(require 'haskell-process)

(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c i") 'haskell-navigate-imports)
(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

(setq haskell-indentation-where-post-offset 8)
(setq haslell-indentation-where-pre-offset 8)
(setq haskell-indentation-starter-offset 8)
(setq haskell-indentation-layout-offset 8)
(setq haskell-indentation-left-offset 8)

(add-hook 'haskell-mode-hook
          (lambda ()
            (setq tab-width 8)))

(add-hook 'haskell-mode-hook
          'interactive-haskell-mode)

;; org-mode

(setq org-return-follows-link t)
(setq org-startup-indented t)

;; direnv-mode

(require 'direnv)

(setq direnv-always-show-summary nil)
(direnv-mode)

;; multiple-cursors

(require 'multiple-cursors)

(global-set-key (kbd "C-:") 'mc/skip-to-previous-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-\"") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; smex

(require 'smex)

(smex-initialize)

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "M-x") 'smex)

;; rainbow-*

(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; ligature

(ligature-set-ligatures 'prog-mode '("--" "---" "==" "===" "!=" "!==" "=!="
                                     "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
                                     "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
                                     "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
                                     "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
                                     "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
                                     "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
                                     "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
                                     "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
                                     "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
                                     "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
                                     ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
                                     "<:<" ";;;"))
(global-ligature-mode t)

;; tramp

(with-eval-after-load 'tramp
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))
