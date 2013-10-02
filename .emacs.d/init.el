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
		    :family "Ubuntu mono")
;; 日本語フォントの設定
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Takaoゴシック"))

;; Tabの表示幅
(setq-default tab-width 4)
