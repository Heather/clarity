;;  Add Packages to load path
(add-to-list 'load-path "~/.emacs.d/site-lisp/packages/racket-mode/")

(autoload 'racket-mode "racket-mode.el"
   "Major mode for editing racket programs." t)
 (setq auto-mode-alist (cons '("\\.rkt$" . 'racket-mode) auto-mode-alist))

(racket-mode)
