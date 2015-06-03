;;  Add Packages to load path
(add-to-list 'load-path "~/.emacs.d/site-lisp/packages/purescript-mode/")

(autoload 'purescript-mode "purescript-mode.el"
   "Major mode for editing purescript programs." t)
 (setq auto-mode-alist (cons '("\\.purs$" . 'purescript-mode) auto-mode-alist))

(require 'purescript-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/site-lisp/packages/purescript-mode/")
