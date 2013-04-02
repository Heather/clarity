;      -- CLARITY --
; yet another emacs config

;; Load all the stuff
(setq init-path (expand-file-name "~/.emacs.d/site-lisp"))
(load-file (expand-file-name "init.el" init-path))

;; Kill the natural evil
(put 'autopair-newline 'disabled nil)
(put 'downcase-region 'disabled nil)

(when (eq system-type 'windows-nt) 
    (load "server")
    (unless (server-running-p) (server-start))

    ;; Hiding the form instead of closing it.
    (defun hide-form ()
        (interactive)
        (server-edit)
        (make-frame-invisible nil t)) 
    (global-set-key (kbd "C-x C-c") 'hide-form))
