;;; Initialize MELPA
(toggle-frame-maximized)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(unless package-archive-contents (package-refresh-contents))
(package-initialize)
(require 'helm-config)
;;; Install fsharp-mode
(unless (package-installed-p 'fsharp-mode)
  (package-install 'fsharp-mode))
(unless (package-installed-p 'omnisharp)
  (package-install 'omnisharp))
 
(require 'ido)

(require 'omnisharp)
 (setq omnisharp--curl-executable-path "C://appdev/curl/bin/curl.exe")
 (setq omnisharp-server-executable-path "C://appdev//omnisharp//OmniSharp.exe")
(ido-mode t)
(require 'fsharp-mode)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(defun parent-directory (dir)
  (unless (equal "/" dir)
    (file-name-directory (directory-file-name dir))))

(defun dub-compile ()
    (interactive)
      (compile (concat "dub run --root=" (parent-directory (parent-directory (buffer-file-name))))))

(ido-vertical-mode t)

(toggle-scroll-bar 0)
(toggle-tool-bar-mode-from-frame 0)
(helm-mode 1)
(auto-complete-mode 1 )
(global-set-key (kbd "M-i") `imenu)

(add-hook
 'd-mode-hook
 (lambda ()
   (local-set-key (kbd "C-c c") 'dub-compile)))

(when (window-system)
  (set-default-font "Fira Code Retina"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))


(global-set-key (kbd "M-[") `mc/mark-previous-like-this-word )
(global-set-key (kbd "M-]") `mc/mark-next-like-this-word )
(global-set-key [f4] 'flycheck-next-error)

(setq ring-bell-function 'ignore)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(global-flycheck-mode t)
 '(mc/always-run-for-all t)
 '(omnisharp-auto-complete-popup-help-delay 0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
