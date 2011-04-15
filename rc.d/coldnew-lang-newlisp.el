;;
(eval-when-compile (require 'cl))

;;;;;;;; Packages Import
(require 'coldnew-editor)
(require 'newlisp)


;;;;;;;; Scheme-mode extensions
(add-to-list 'auto-mode-alist '("\\.lisp$" . newlisp-mode))
(add-to-list 'auto-mode-alist '("\\.lsp$" . newlisp-mode))



;;;;;;;; Auto Complete Settings
(when (require* 'auto-complete)
  (defun ac-newlisp-mode-setup ()
    "auto-complete settings for scheme-mode"
    (setq ac-sources '(ac-source-dictionary
		       ac-source-symbols
		       ac-source-variables
		       ac-source-functions
		       ac-source-features
		       ac-source-filename
		       ac-source-words-in-buffer
		       ac-source-words-in-same-mode-buffers
		       ))))
;;;;;;;; Settings
(add-hook 'newlisp-mode-hook
	  '(lambda ()


	     ))

;;;;;;;; Hooks
(add-hook 'newlisp-mode-hook
	  '(lambda ()

	     ;; Enable Auto Complete
	     (when (require* 'auto-complete)
	       (ac-newlisp-mode-setup))

	     ;; Highlight differnet parentheses
	     (when (require* 'highlight-parentheses)
	       (highlight-parentheses-mode))

	     ;; Use Greek character lambda instead of string
	     (when (require* 'pretty-lambdada)
	       (turn-on-pretty-lambda-mode))

	     ;; Use global programming mode
	     (programming-mode)

	     ))


;;;;;;;; Functions
(defun run-newlisp ()
  "Starts newlisp interperter/or shows if already running.
   Requires newlisp-mode to be loaded."
  (interactive)
  (newlisp-show-interpreter)
  (other-window 1)
  )





(provide 'coldnew-lang-newlisp)
;; coldnew-lang-newlisp.el ends here.
