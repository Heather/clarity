(defun asp-mode ()
  (html-mode)
  (make-local-variable 'tab-width)
  (setq tab-width 4))
(setq 	auto-mode-alist (cons '("\\.asp\\'"  . asp-mode) auto-mode-alist)
		auto-mode-alist (cons '("\\.aspx\\'" . asp-mode) auto-mode-alist))
