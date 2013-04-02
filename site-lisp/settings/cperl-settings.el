(require 'cperl-mode)
(setq 	auto-mode-alist (cons '("\\.p6\\'" . cperl-mode) auto-mode-alist)
    auto-mode-alist (cons '("\\.t\\'" .  cperl-mode) auto-mode-alist)
    auto-mode-alist (cons '("\\.pl\\'" .  cperl-mode) auto-mode-alist)
    auto-mode-alist (cons '("\\.pm\\'" . cperl-mode) auto-mode-alist))

(add-to-list 'interpreter-mode-alist
             '("perl6" . cperl-mode))

; indentation
(setq cperl-indent-level 4)

; my lovely closing parents style
(setq cperl-indent-parens-as-block t)
