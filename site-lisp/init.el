;;                            -- Clarity --
;; Base init
(defvar init-path (expand-file-name "~/.emacs.d/site-lisp"))
(setq custom-file (expand-file-name "custom.el" init-path))
(add-to-list 'load-path "~/.emacs.d/site-lisp/modules")
(when (file-readable-p custom-file) (load-file custom-file))
;; Modules load
(autoload 'Rules "Rules" t)
;; Fonts
(set-face-attribute 'default nil :height 110) ;; ~11ptr
(defun fontify-frame (frame) 
    (cond 
        ((eq system-type 'gnu/linux) (set-frame-parameter frame 'font "Monospace-11"))
        (t (set-frame-parameter frame 'font "Lucida Console"))
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
(dolist (file (directory-files init-settings-path t "-settings\\.el$"))
    (condition-case e
        (load-file file)
        (error (warn "Error while loading settings file %s: %S" file (cdr e)))))
(provide 'init)
;; Add the init-path tree to the load path
(setq initial-load-path load-path)
(add-init-path-to-load-path)
;; C Formatting
(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open '+)
(c-set-offset 'defun-open '+)
;; Lisp Formatting
(setq-default lisp-indent-offset 4)
(setq-default lisp-body-indent 4)
;; Custom flags
(custom-set-variables
 '(case-fold-search nil)                         ;; No idea =='
 '(cua-selection-mode t)                         ;; + cua
 '(cua-mode t nil (cua-base))                    ;; C-c C-v Copy/Paste
 '(current-language-environment "UTF-8")         ;; As I said earlier
 '(inhibit-startup-screen t)                     ;; MUSTHAVE
 '(initial-buffer-choice nil)                    ;; MUSTHAVE
 '(setq backup-directory-alist t)                ;; .emacs.d backup dir
 '(show-paren-mode t nil (paren))                ;; Default
 '(tab-width 4)                                  ;; 4
 '(global-linum-mode 0)                          ;; line numbers
 '(setq-default indent-tabs-mode nil)            ;; emacs, use SPACES!
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
;; Additional theaming
(if show-paren-mode (set-face-bold-p 'show-paren-match t))
;; Default Frame
(add-to-list 'default-frame-alist '(left . 70))
(add-to-list 'default-frame-alist '(top . 60))
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 160))

;; Applieng Rules
(Rules)
