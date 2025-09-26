;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File name: ` ~/.emacs '
;;; ---------------------
;;;
;;; If you need your own personal ~/.emacs
;;; please make a copy of this file
;;; an placein your changes and/or extension.
;;;
;;; Copyright (c) 1997-2002 SuSE Gmbh Nuernberg, Germany.
;;;
;;; Author: Werner Fink, <feedback@suse.de> 1997,98,99,2002
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Test of Emacs derivates
;;; -----------------------

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(setq package-check-signature nil)
;(setq url-proxy-services '(("http" . "http://proxy.mri-jma.go.jp:8080")))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)


;(setq url-proxy-services 
;      '(("http" . "160.202.2.15:8080")
;        ("https" . "160.202.2.15:8080")))

(if (string-match "XEmacs\\|Lucid" emacs-version)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; XEmacs
  ;;; ------
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (progn
     (if (file-readable-p "~/.xemacs/init.el")
        (load "~/.xemacs/init.el" nil t))
  )
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;; GNU-Emacs
  ;;; ---------
  ;;; load ~/.gnu-emacs or, if not exists /etc/skel/.gnu-emacs
  ;;; For a description and the settings see /etc/skel/.gnu-emacs
  ;;;   ... for your private ~/.gnu-emacs your are on your one.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (if (file-readable-p "~/.gnu-emacs")
      (load "~/.gnu-emacs" nil t)
    (if (file-readable-p "/etc/skel/.gnu-emacs")
	(load "/etc/skel/.gnu-emacs" nil t)))

  ;; Custom Settings
  ;; ===============
  ;; To avoid any trouble with the customization system of GNU emacs
  ;; we set the default file ~/.gnu-emacs-custom
  (setq custom-file "~/.gnu-emacs-custom")
  (load "~/.gnu-emacs-custom" t t)
;;;
)
;;;
;;; Hide toolbar ( M-x tool-bar-mode to swicth )
(tool-bar-mode -1)

(setq inhibit-startup-message t)

;(set-default-font "-adobe-courier-medium-r-normal--17-120-100-100-m-100-iso8859-1")


;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

(setq f90-mode-hook
      '(lambda () (setq f90-do-indent 2
                        f90-if-indent 2
                        f90-type-indent 2
                        f90-program-indent 2
                        f90-font-lock-keywords f90-font-lock-keywords-4
                  )))
(add-to-list 'auto-mode-alist '("\\.F90\\'" . f90-mode))

;; C-x bでミニバッファにバッファ候補を表示
;(iswitchb-mode t)
;(iswitchb-default-keybindings)

;; C-kで行全体を削除
(setq kill-whole-line t)

;; 暫定マークモード
(setq transient-mark-mode t)

;; モードラインに列番号を表示
(column-number-mode t)

;; xterm のマウスイベントを取得する
(xterm-mouse-mode t)
;; マウスホイールを取得する
(mouse-wheel-mode t)
;; ポインタの移動ではなくて画面をスクロールさせたい場合はこっち
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 2)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   2)))

(defun reset-frame-parameter (frame)
  (sleep-for 0.1)
  (set-frame-parameter frame 'height 32))

(add-hook 'after-make-frame-functions #'reset-frame-parameter)
