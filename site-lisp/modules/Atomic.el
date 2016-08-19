;;                           -- Clarity --
(defun Atomic ()

(setq
  sr-speedbar-width-x 40
  speedbar-use-images nil
  speedbar-show-unknown-files t
  sr-speedbar-right-side t)

;; No bars
(defun frame-bg (frame)
  "Custom behaviours for new frames."
  (with-selected-frame frame
    	(when (display-graphic-p)
        (sr-speedbar-open)
        (with-current-buffer sr-speedbar-buffer-name
          (setq window-size-fixed 'width))

        (defadvice delete-other-windows (after my-sr-speedbar-delete-other-window-advice activate)
          "Check whether we are in speedbar, if it is, jump to next window."
          (let ()
        	(when (and (sr-speedbar-window-exist-p sr-speedbar-window)
                       (eq sr-speedbar-window (selected-window)))
              (other-window 1)
        	)))
        (ad-enable-advice 'delete-other-windows 'after 'my-sr-speedbar-delete-other-window-advice)
        (ad-activate 'delete-other-windows))))
(frame-bg (selected-frame))
(add-hook 'after-make-frame-functions 'frame-bg))
