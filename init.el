;      -- CLARITY --
; yet another emacs config

;; Load all the stuff
(setq init-path (expand-file-name "~/.emacs.d/site-lisp"))
(load-file (expand-file-name "init.el" init-path))

;; Kill the natural evil
(put 'autopair-newline 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Client - Server hack for windows
(when (eq system-type 'windows-nt)
    (load "server")
    (unless (server-running-p) (server-start))

    ;; Hiding the form instead of closing it.
    (defun hide-form ()
        (interactive)
        (server-edit)
        (make-frame-invisible nil t))
    (global-set-key (kbd "C-x C-c") 'hide-form))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(case-fold-search nil)
 '(cua-mode t nil (cua-base))
 '(cua-selection-mode t)
 '(current-language-environment "UTF-8")
 '(cursor-type (quote bar))
 '(global-hl-line-mode f)
 '(global-linum-mode 0)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(lisp-body-indent 2)
 '(lisp-indent-offset 2)
 '(purescript-mode-hook (quote (turn-on-purescript-indent)))
 '(setq backup-directory-alist t)
 '(show-paren-mode t nil (paren))
 '(show-trailing-whitespace t)
 '(tab-width 2)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(truncate-lines t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
