;;
(eval-when-compile (require 'cl))

;;;;;;;; Packages Import
(require 'coldnew-macro)
(require 'coldnew-functions)
(require 'coldnew-commands)
(require 'coldnew-variables)


;;;;;;;; Ansi-Color
;; reset ansi-color to match with my theme
;; default is [ "black" "red" "green" yellow" "blue" "magenta" "cyan" "white"]
;;
(when (require* 'ansi-color)
  (setq ansi-color-names-vector
	(vector (frame-parameter nil 'background-color)
		"#ffffff" "#CA3839" "#8ae234" "#edd400"
		"#729fcf" "#ad7fa8" "cyan3"   "#eeeeec")
	ansi-term-color-vector ansi-color-names-vector
	ansi-color-map (ansi-color-make-color-map))
  )

;;;;;;;; Shell-pop
;;
(when (require* 'shell-pop)
  (shell-pop-set-internal-mode "ansi-term")
  ;;  (shell-pop-set-internal-mode "multi-term")
  (shell-pop-set-internal-mode-shell emacs-default-shell)
  (shell-pop-set-window-height emacs-popup-shell-window-height)
  (shell-pop-set-window-position emacs-popup-shell-window-position)
  )

;;;;;;;; Multi-term
;;
(when (require* 'multi-term)
  (setq multi-term-program emacs-default-shell)
  )

;;;;;;;; Term
;;
(when (require* 'term)
  (setq term-default-bg-color nil)
  (setq term-default-fg-color nil)

  ;;;; Keybindings
  (add-hook 'term-mode-hook
	    '(lambda ()
	       ;; Add new key-map
	       (define-key term-raw-map (kbd "<f4>") 'shell-pop)
	       (define-key term-raw-map (kbd "M-x") 'anything-M-x)
	       ))
  )

;;;;;;;; Comint mode
;;
(when (require* 'comint)

  ;; Do not show password in comint-mode
  (setq comint-output-filter-functions  '(comint-watch-for-password-prompt))
  (setq comint-password-prompt-regexp
	"\\(\\([Oo]ld \\|[Nn]ew \\|^\\)[Pp]assword\\|Enter password\\):\\s *\\'")

  ;;;; Hooks
  (add-hook 'comint-mode-hook
	    '(lambda ()

	       ;; Use global programming mode
	       (programming-mode)
	       ))

  ;;;; Keybindings
  (add-hook 'comint-mode-hook
	    '(lambda ()
	       (when (require* 'vim)
		 ;; Normal map
		 (vim:local-nmap (kbd "M-k") 'comint-previous-input)
		 (vim:local-nmap (kbd "M-j") 'comint-previous-input)
		 (vim:local-nmap (kbd "C-c C-r") 'comint-clear-region)
		 ;; Insert map
		 (vim:local-imap (kbd "RET") 'newline-and-indent)
		 )
	       ))
  ;;;; Functions
  (defun comint-clear-region ()
    (interactive)
    (delete-region (point-min) (point-max))
    (comint-send-input))
  )


;;;;;;;; Functions

;;;; Rewrite shell-pop function
;; I don't like use vim like key in shell,after shell popup
;; use emacs-key instead of vim-mode
;; TODO: use advice to rewrite this function.
;;
(defun shell-pop ()
  "Toggle vim-mode between shell-pop-up and shell-pop-down."
  (interactive)
  (if (equal (buffer-name) shell-pop-internal-mode-buffer)
      (progn
	(shell-pop-out)
	(vim:normal-mode)
	)
    (progn
      (shell-pop-up)
      (vim:emacs-mode)
      )))

;; ;; Use emacs-key instead of Vim-key in term-mode
;; ;; TODO: is there a better way to do this?
(defadvice switch-to-buffer (after switch-to-buffer activate)
  "After switch-to-buffer, if tht buffer is term-mode, disable vim-mode."
  (if (equal major-mode 'term-mode)
      (vim:emacs-mode)
    (vim:normal-mode)
    ))


(provide 'coldnew-terminal)
;; coldnew-terminal.el ends here.
