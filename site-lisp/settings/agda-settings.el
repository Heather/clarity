(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(setq agda2-include-dirs
      (list "." (expand-file-name "D:\\Heather\\Contrib\\P\\agda-stdlib\\src\\")))

(require 'agda2)
