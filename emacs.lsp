(require 'package)


(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; SQL indent
(eval-after-load "sql"
  (load-library "sql-indent"))

;; Remove welcome window
(setq-default inhibit-startup-screen t)

;; Compiling tex documents to PDF by default
(setq TeX-PDF-mode t)

;; Nav bar -> F8
(add-to-list 'load-path "~/.emacs.d/elpa/nav")
(require 'nav)
(nav-disable-overeager-window-splitting)
(global-set-key [f8] 'nav-toggle)

(tool-bar-mode -1)
(menu-bar-mode -1)

;; load default theme
(load-theme 'monokai t)

;; c-eldoc mode
(load "c-eldoc")
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;;doxymacs
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(setq doxymacs-doxygen-dirs '(("/home/ivan/svn/kalashnikovdb/src/")))

;; clang-auto-complete
(require 'auto-complete-clang)

;; compiling c source
(add-hook 'c-mode-common-hook 
          (lambda () (define-key c-mode-base-map (kbd "C-x c") 'compile)))

;; Aditional YaSnippet-s
;;(add-to-list ‘yas/root-directory “/home/ivan/.emacs.d/yasnippet-snippets”)
;;(yas/initialize)

;; Move around windows
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; Give me columns and lines
(column-number-mode 1)
(line-number-mode 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(setq ecb-tip-of-the-day nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu t)
 '(ac-auto-start t)
 '(ac-dictionary-directories (quote ("/home/ivan/.emacs.d/emacs-for-python/auto-complete/ac-dict" "/home/ivan/.emacs.d/emacs-for-python/elpa-to-submit/auto-complete/dict/" "/home/ivan/.emacs.d/elpa/auto-complete-20121022.2254/dict")))
 '(c-default-style (quote ((c-mode . "") (c++-mode . "") (other . "gnu"))))
 '(column-number-mode t)
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" default)))
 '(display-battery-mode t)
 '(doxymacs-doxygen-style "JavaDoc")
 '(ecb-layout-name "left9")
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("/" "/"))))
 '(ecb-windows-width 0.13)
 '(global-auto-complete-mode t)
 '(js2-auto-indent-p t)
 '(js2-bounce-indent-p t)
 '(js2-highlight-level 3)
 '(js2-indent-on-enter-key t)
 '(prolog-align-comments-flag nil)
 '(prolog-indent-mline-comments-flag nil)
 '(python-guess-indent nil)
 '(python-indent 4)
 '(show-paren-mode t)
 '(tab-always-indent t))
(ecb-activate)


(setenv "PYMACS_PYTHON" "python2.7")

;; On enter key -> new line and indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; save shortcut
(global-set-key (kbd "C-<") 'kill-ring-save)

;; Emacs for python module
(load-file "/home/ivan/.emacs.d/emacs-for-python/epy-init.el")

(add-to-list 'load-path "~/.emacs.d/")

;; Error checking
;;(epy-setup-checker "pyflakes %f")

;; remove scrollbar
(scroll-bar-mode -1)

;; Show line-number in the mode line
(line-number-mode 1)

;; GOTO end or beggining of html tag 
(add-hook 'html-mode-hook
 (lambda ()
 (define-key html-mode-map (kbd "<M-f1>") 'sgml-skip-tag-backward)
 (define-key html-mode-map (kbd "<M-f2>") 'sgml-skip-tag-forward)
 )
)

;;prevet making backup files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t ; Dont delink hardlinks
      version-control t ; Use version numbers on backups
      delete-old-versions t ; Automatically delete excess
      kept-new-versions 20 ; how many of the newest version
      kept-old-versions 5 ; and how many of the old
)

;; Set HTML indent 4
(add-hook 'html-mode-hook
  (lambda ()
    ;; Default indentation is usually 2 spaces, changing to 4.
    (set (make-local-variable 'sgml-basic-offset) 4))) 

;; Prolog mode
(setq auto-mode-alist
  (cons (cons "\\.pl" 'prolog-mode)
     auto-mode-alist))
(setq auto-mode-alist
  (cons (cons "\\.P" 'prolog-mode)
     auto-mode-alist))
(setq auto-mode-alist
  (cons (cons "\\.flr" 'prolog-mode)
     auto-mode-alist))

;; Turn-on autoCompletion for js3-mode
;;(add-to-list 'ac-modes 'js3-mode)
;;(add-to-list 'ac-modes 'prolog-mode)

;;  Syntax highlighting
(global-font-lock-mode t)       
(setq font-lock-maximum-decoration t)

;; Prolog load
(setq load-path (cons "/home/ivan/prolog/" load-path))
(setq prolog-use-sicstus-sd t) 

(add-to-list 'load-path "/home/ivan/.emacs.d/elpa/js3-mode-20120802.929")
(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

(setq js3-lazy-commas t)
(setq js3-lazy-operators t)
(setq js3-lazy-dots t)
(setq js3-expr-indent-offset 2)
(setq js3-paren-indent-offset 2)
(setq js3-square-indent-offset 2)
(setq js3-curly-indent-offset 2)
(setq js3-auto-indent-p t)
(setq js3-enter-indents-newline t)
(setq js3-indent-on-enter-key t)

(custom-set-faces)
(put 'upcase-region 'disabled nil)
