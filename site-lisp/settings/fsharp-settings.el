(add-to-list 'load-path "/usr/share/emacs/site-lisp/fsharpbinding")
(autoload 'fsharp-mode "fsharp-mode" "Major mode for editing F# code." t)
(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))
