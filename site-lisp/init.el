;;                            -- Clarity --

;; Base init
(defvar init-path (expand-file-name "~/.emacs.d/site-lisp"))
(add-to-list 'load-path "~/.emacs.d/site-lisp/modules")

;; FreeBSD correction for C-h
(global-set-key [(control ?h)] 'delete-backward-char)

;; Modules load
(autoload 'Rules "Rules" t)
(autoload 'Atomic "Atomic" t)

;; Fonts
(set-face-attribute 'default nil :height 120)
(defun fontify-frame (frame)
    (cond
      ((eq system-type 'windows-nt) (set-frame-parameter frame 'font "Lucida Console"))
      ((eq system-type 'gnu/linux) (set-frame-parameter frame 'font "Dejavu Sans Mono"))
      (t (set-frame-parameter frame 'font "Monospace-12"))
    ))
(fontify-frame nil)
(push 'fontify-frame after-make-frame-functions)
(setq font-lock-support-mode 'jit-lock-mode)
(setq font-lock-maximum-decoration t)

;; UTF8
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Packages & Settings
(setq init-packages-path (expand-file-name "packages" init-path))
(setq
      init-settings-path (expand-file-name "settings" init-path)
      init-persistence-path (expand-file-name "persistence" init-path))
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

;;  Add Packages to load path
(add-to-list 'load-path "~/.emacs.d/site-lisp/packages/")

;; Load Settings
(dolist (file (directory-files init-settings-path t "-settings\\.el$"))
    (condition-case e
        (load-file file)
        (error (warn "Error while loading settings file %s: %S" file (cdr e)))))
(provide 'init)

;; Add the init-path tree to the load path
(setq initial-load-path load-path)
(add-init-path-to-load-path)

;; C Formatting
(c-set-offset 'substatement-open '+)
(c-set-offset 'defun-open '+)

;; PuTTY fix. Ugly. Bad. But it works. (Good)
(define-key global-map "\M-[1~" 'beginning-of-line)
(define-key global-map [select] 'end-of-line)

;;!Deprecated since emacs25
;;(set-face-background hl-line-face "gray97")

;; Additional theaming
(if show-paren-mode (set-face-bold-p 'show-paren-match t))
;; Default Frame
(add-to-list 'default-frame-alist '(left . 70))
(add-to-list 'default-frame-alist '(top . 60))
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 100))

(require 'package)
(require 'sr-speedbar)

;; Applieng Rules
(Rules)
(Atomic)

;; Additional functions
(defun byte-recompile-init-path ()
  (interactive)
  (dolist (dir (find-subdirs-containing init-packages-path "\\.el$"))
    (byte-recompile-directory dir 0)))
