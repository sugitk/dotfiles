;; Japanese environment

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; Emacs lisp
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'load-path "~/.emacs.d/elisp")

;; font
(global-font-lock-mode 1)

;; (when (and (eq window-system 'ns) (= emacs-major-version 23))
;;   (set-fontset-font
;;    (frame-parameter nil 'font)
;;    'japanese-jisx0208
;;    '("Hiragino Maru Gothic Pro" . "iso10646-1"))
;;   (setq face-font-rescale-alist
;;         '(("^-apple-hiragino.*" . 1.2)
;;           (".*osaka-bold.*" . 1.2)
;;           (".*osaka-medium.*" . 1.2)
;;           (".*courier-bold-.*-mac-roman" . 1.0)
;;           (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
;;           (".*monaco-bold-.*-mac-roman" . 0.9)
;;           ("-cdac$" . 1.3))))

;; フレームのフォントを設定
(let* ((size 12) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
       (asciifont "Menlo") ; ASCIIフォント
       (jpfont "Hiragino Maru Gothic ProN") ; 日本語フォント
       (h (* size 10))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont)))
  (set-face-attribute 'default nil :family asciifont :height h)
  (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font nil 'katakana-jisx0201 jp-fontspec) ; 半角カナ
  (set-fontset-font nil '(#x0080 . #x024F) fontspec) ; 分音符付きラテン 
  (set-fontset-font nil '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
  )

;; フォントサイズの比を設定
(dolist (elt '(("^-apple-hiragino.*" . 1.2)
	       (".*osaka-bold.*" . 1.2)
	       (".*osaka-medium.*" . 1.2)
	       (".*courier-bold-.*-mac-roman" . 1.0)
	       (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	       (".*monaco-bold-.*-mac-roman" . 0.9)))
  (add-to-list 'face-font-rescale-alist elt))

;; key bindings
(global-set-key [delete] 'delete-char)
(global-set-key "\C-h" 'backward-delete-char)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-/" 'help-for-help)
(global-set-key "\M-r" 'replace-string)
(global-set-key [button4] 'previous-line)
(global-set-key [button5] 'next-line)
;(global-set-key "\M- " 'set-mark-command)

(setq display-time-day-and-date t)
(display-time)

(column-number-mode t)
(line-number-mode t)

(setq next-line-add-newlines nil)
(setq visible-bell t)
(setq minibuffer-max-depth nil)

;; for Mac OS X
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))
(define-key global-map [ns-drag-file] 'ns-find-file)


;; migemo
;(require 'migemo)
;(setq migemo-command "/usr/local/bin/cmigemo")
;(setq migemo-options '("-q" "--emacs"))
;(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
;(setq migemo-user-dictionary nil)
;(setq migemo-coding-system 'utf-8-unix)
;(setq migemo-regex-dictionary nil)
;(migemo-init)

; from http://qiita.com/items/bda92200f4a48ca89228
(setq search-whitespace-regexp nil)

;; navi2ch
;(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)
;(coding-system-put 'cp932 :encode-translation-table
;		   (get 'japanese-ucs-jis-to-cp932-map 'translation-table))


;; ruby
(add-to-list 'load-path "~/.emacs.d/ruby")
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)))


;; auto-install
;(require 'auto-install)
;(setq auto-install-directory "~/.emacs.d/elisp/")
;(auto-install-update-emacswiki-package-name t)
;(auto-install-compatibility-setup)


;; anything
(require 'anything-startup)
(define-key global-map (kbd "C-;") 'anything-for-files)

;; magit
;(require 'magit)
