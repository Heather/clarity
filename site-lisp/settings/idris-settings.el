;;  Add Packages to load path
(add-to-list 'load-path "~/.emacs.d/site-lisp/packages/prop-menu/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/packages/idris-mode/")

(autoload 'prop-menu "prop-menu.el" "Popup menus" t)
(autoload 'idris-mode "idris-mode.el"
   "Major mode for editing idris programs." t)
 (setq auto-mode-alist (cons '("\\.idr$" . 'idris-mode) auto-mode-alist))

(require 'prop-menu)
(require 'idris-mode)

(add-to-list 'completion-ignored-extensions ".ibc")
