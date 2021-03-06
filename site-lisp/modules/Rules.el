;;                           -- Clarity --
(defun Rules ()

(setenv "PAGER"     "cat")
(setenv "EDITOR"    "emacsclient")
(setenv "VISUAL"    "emacsclient")

;; Ctrl + F search
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation"
  (interactive) (revert-buffer t t))
(global-set-key (kbd "C-f")  'isearch-forward)
(global-set-key '[f3] 'isearch-repeat-forward)

;; Additional keyworkds
(global-set-key (kbd "C-q") 'revert-buffer-no-confirm)
(global-set-key '[f11] 'menu-bar-mode)

(delete-selection-mode 1)

;; No bars
(defun frame-bg (frame)
  "Custom behaviours for new frames."
  (with-selected-frame frame
    	(when (display-graphic-p)
		  (scroll-bar-mode t)
		  (mouse-wheel-mode t)
		  (set-cursor-color "#002060")
		  (global-set-key (kbd "<C-mouse-4>") 'text-scale-decrease)
        (global-set-key (kbd "<C-mouse-5>") 'text-scale-increase))
    (tool-bar-mode -1)
		(menu-bar-mode -1)))
(frame-bg (selected-frame))
(add-hook 'after-make-frame-functions 'frame-bg)

; ALWAYS USE 2 SPACES ! NO TABS
(add-hook 'after-change-major-mode-hook
          '(lambda ()
             (setq-default indent-tabs-mode nil)
             (setq c-basic-indent 2)
             (setq tab-width 2)))

(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-6] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
(global-set-key [mouse-7] 'up-slightly)

; Scroll up five lines with META held
(global-set-key [M-mouse-4] 'down-slightly)
(global-set-key [M-mouse-5] 'up-slightly)
(global-set-key [M-mouse-6] 'down-slightly)
(global-set-key [M-mouse-7] 'up-slightly)

; Scroll up one line with SHIFT held
(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)
(global-set-key [S-mouse-6] 'down-one)
(global-set-key [S-mouse-7] 'up-one)

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))

(defadvice ibuffer
  (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name."
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)
(global-set-key (kbd "C-x C-k") 'kill-other-buffers)
(global-set-key (kbd "C-x C-z") 'kill-buffer) ; x-k
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-o") 'find-file)
(defadvice find-file-read-args (around find-file-read-args-always-use-dialog-box act)
  "Simulate invoking menu item as if by the mouse; see `use-dialog-box'."
  (let ((last-nonmenu-event nil))
     ad-do-it)))
