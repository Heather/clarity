(autoload 'nemerle-mode "nemerle.el"
   "Major mode for editing nemerle programs." t)
 (setq auto-mode-alist (cons '("\\.n$" . nemerle-mode) auto-mode-alist))
