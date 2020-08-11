(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search t)
 '(current-language-environment "Japanese")
 '(default-input-method "japanese")
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(tool-bar-mode -1)

(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(global-set-key "\e\?" 'goto-line)

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

;; モードラインに列番号を表示
(column-number-mode t)
