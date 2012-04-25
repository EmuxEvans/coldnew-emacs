;;; coldnew-evil.el ---
;;; Time-stamp: <2012-04-26 05:09:02 (coldnew)>
(eval-when-compile (require 'cl))

(require 'coldnew-global-keybindings)


;;;; ---------------------------------------------------------------------------
;;;; evil
;;;; ---------------------------------------------------------------------------
(require 'evil)

;; change default cursor face
(setq evil-default-cursor '(:background (face-attribute 'cursor :background) box))

(setq evil-want-visual-char-semi-exclusive t)

(setq evil-emacs-state-mode '(git-branch-mode))


;;;; ---------------------------------------------------------------------------
;;;; Keybinding
;;;; ---------------------------------------------------------------------------

;;;;;;;; Normal
(define-key evil-normal-state-map (kbd "C-c C-f") 'my-anything-filelist)
(define-key evil-normal-state-map (kbd "C-c C-t") 'my-anything-occur)
(define-key evil-normal-state-map (kbd "C-x vv") 'egg-next-action)
(define-key evil-normal-state-map (kbd "C-w") 'one-key-menu-window-navigation)
(define-key evil-normal-state-map (kbd "M-p") 'anything-show-kill-ring)


;;;;;;;; Insert
(define-key evil-insert-state-map (kbd "C-x C-n") 'auto-complete)
(define-key evil-insert-state-map (kbd "C-c C-t") 'my-anything-occur)
(define-key evil-insert-state-map (kbd "C-c C-f") 'my-anything-filelist)
(define-key evil-insert-state-map (kbd "C-x vv") 'egg-next-action)
(define-key evil-insert-state-map (kbd "M-p") 'anything-show-kill-ring)


;;;;;;;; Emacs
(define-key evil-emacs-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-emacs-state-map (kbd "C-c C-t") 'my-anything-occur)
(define-key evil-emacs-state-map (kbd "C-c C-f") 'my-anything-filelist)
(define-key evil-emacs-state-map (kbd "C-x vv") 'egg-next-action)
(define-key evil-emacs-state-map (kbd "M-p") 'anything-show-kill-ring)


;;;; ---------------------------------------------------------------------------
;;;; Commands
;;;; ---------------------------------------------------------------------------

(defun evil-undefine ()
  "commands for undefine evil-keybinding"
  (interactive)
  (let (evil-mode-map-alist)
    (call-interactively (key-binding (this-command-keys)))))



;;;; ---------------------------------------------------------------------------
;;;; Functions
;;;;---------------------------------------------------------------------------



;;;; ---------------------------------------------------------------------------
;;;; Macros
;;;; ---------------------------------------------------------------------------

(defmacro evil-define-key-insert (state map key name)
  "insert string in evil-mode."
  `(evil-define-key ,state ,map ,key
     '(lambda ()
	(interactive) (insert ,name) (if (featurep 'yasnippet) (yas/expand)))))




(provide 'coldnew-evil)
;; coldnew-evil.el ends here.