# `~/.emacs.d`

``` scheme
(defun find-subdirs-containing (dir pattern)
  (let* ((ret nil)
            (files (directory-files dir))
            (max-lisp-eval-depth 3000))
    (while files
      (let* ((file (car files))
                (path (expand-file-name file dir)))
          (if (and (file-directory-p path)
                  (not (string-match "^\\.+" file)))
              (setq ret (append ret (find-subdirs-containing path pattern)))
              (if (string-match pattern file)
                  (add-to-list 'ret dir))))
        (setq files (cdr files))) ret))
(defun add-init-path-to-load-path ()
  (interactive)
  (setq load-path (append (find-subdirs-containing init-settings-path "\\.el$")
                          (find-subdirs-containing init-packages-path "\\.el$")
                          (list init-path)
                          initial-load-path)))
```

<img align="right" src="https://s-media-cache-ak0.pinimg.com/originals/02/b7/68/02b768567a796815d50585de3c5b1680.jpg">

``` scheme
(require 'cperl-mode)
(setq auto-mode-alist (cons '("\\.p6\\'" . cperl-mode) auto-mode-alist)
      auto-mode-alist (cons '("\\.t\\'"  . cperl-mode) auto-mode-alist)
      auto-mode-alist (cons '("\\.pl\\'" . cperl-mode) auto-mode-alist)
      auto-mode-alist (cons '("\\.pm\\'" . cperl-mode) auto-mode-alist))
(add-to-list 'interpreter-mode-alist  '("perl6" . cperl-mode))
; indentation
(setq cperl-indent-level 4)
(setq cperl-indent-parens-as-block t)
```
