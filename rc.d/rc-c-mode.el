;;
(provide 'rc-c-mode)

(add-hook 'c-mode-hook
	  '(lambda ()
	     (setq c-basic-offset             8 ) ; 縮排設定
	     (setq tab-width                  4 ) ; TAB 寬度為4個空格
	     (setq indent-tabs-mode         nil ) ; 禁止在縮排中插入制表符
	     (setq c-max-one-liner-length   100 ) ; 最大格數為 100 格
	     (setq compilation-window-height 10 ) ; 編譯結果視窗高度
	     (c-set-style "linux")                ; C 語言風格為 linux
	     ;; hook for c-mode
	     (programming-common-hook)	; programming common hook
	     (find-source-or-header)	; switch between sorece and header
	     ))

;;;; Keybindings
(add-hook 'c-mode-hook
	  '(lambda ()
	     (when (featurep 'vim)
	       (vim:nmap (kbd ",o") 'ff-find-other-file)
	       (vim:nmap (kbd ",h") 'ff-find-related-file)
	       (vim:imap (kbd "=")   'c-mode:insert-equal)
	       (vim:imap (kbd "M-i") 'c-mode:insert-inc-or-if)
	       (vim:imap (kbd "M-d") 'c-mode:insert-do-while)
	       )))

;;;; Functions

(defcmd c-mode:insert-inc-or-if ()
  "If at the start of line. add `inc' and expand it,
else add `if' and expand it."
  (let* ((current (point))
	 (begin (line-beginning-position)))
    (if (eq current begin)
	(insert "inc")
      (insert "if"))
    (yas/expand)))

(defcmd c-mode:insert-equal ()
  "insert equal for easy."
  (if (featurep 'smartchr)
      (smartchr '(" = " " == "  "="))
    (self-insert-command)))

(defcmd c-mode:insert-do-while ()
  "insert do{...} while()."
  (insert "do")
  (yas/expand))
