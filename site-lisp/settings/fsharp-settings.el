(autoload 'fsharp-mode "fsharp-mode" "Major mode for editing F# code." t)
(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))

(setq inferior-fsharp-program
    (cond ((eq system-type 'gnu/linux) "/usr/bin/fsharpi --readline-")
          (t "fsharpi.exe")))
(setq fsharp-compiler
    (cond ((eq system-type 'gnu/linux) "/usr/bin/fsharpc")
          (t "fsharpc.exe")))

(add-hook 'fsharp-mode-hook
 (lambda ()
   (define-key fsharp-mode-map (kbd "M-RET") 'fsharp-eval-region)
   (define-key fsharp-mode-map (kbd "C-SPC") 'completion-at-point)))
