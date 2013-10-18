(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)

;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	     (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-to-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
;; 引数とそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos")

;; asciiフォントの設定
(set-face-attribute 'default nil
		    :family "Ubuntu mono"
			:height 120)
;; 日本語フォントの設定
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Takaoゴシック"
			:height 120))

;; Tabの表示幅
(setq-default tab-width 4)

;; 行番号を表示する
(line-number-mode t)
;; モードラインに桁数を表示
(column-number-mode t)

;; auto-installの設定
(when (require 'auto-install nil t)
  ;; インストールディレクトリの設定
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  ;; 必要であればProxyの設定を行う
  ;; (setq url-proxy-services '(("http" . "localhost:8339")))
  ;; install-elispの関数を利用可能にする。
  (auto-install-compatibility-setup))

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; パッケージ提供
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
			   "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

