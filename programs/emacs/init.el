;; basic

(add-to-list 'default-frame-alist `(font . "Iosevka-20"))

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)

(setq-default tab-width 8)

(scroll-bar-mode   -1)
(menu-bar-mode     -1)
(tool-bar-mode     -1)

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

(setq haskell-process-wrapper-function
      (lambda (xs) (apply 'nix-shell-command (nix-current-sandbox) xs)))

;; org-mode

(setq org-return-follows-link t)
(setq org-startup-indented t)
