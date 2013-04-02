(setq auto-mode-alist (cons '("\\.chs\\'" . haskell-mode) auto-mode-alist))

(custom-set-variables
 '(haskell-mode-hook '(turn-on-haskell-indentation)))
