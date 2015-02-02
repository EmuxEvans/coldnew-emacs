;;; coldnew-editor.el --- coldnew-editor Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;; Copyright (c) 2015 Yen-Chin, Lee
;;
;; Author: Yen-Chin, Lee <coldnew.tw@gmail.com>
;; URL: https://github.com/coldnew/coldnew-emacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;;; Local functions
(defun my/set-key (keymap key def &rest bindings)
  (evil-leader--def-keys keymap key def bindings))

;;;; Commands

(defun insert-U200B-char ()
  "Insert <U200B> char, this character is nice use in org-mode."
  (interactive)
  (insert "\ufeff"))

;;;; Commands