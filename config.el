;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))

(add-to-list 'default-frame-alist
             '(ns-appearance . light))

(global-auto-revert-mode t)

;; (move-text-default-bindings)

;; * Look and feel

;; ** Start maximised (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; ** Don't ask to quit
(setq confirm-kill-emacs nil)

;; ** Modeline adjustments
(setq doom-modeline-major-mode-icon t)

;; ** lsp always show breadcrumb
(setq lsp-headerline-breadcrumb-enable t)

;; ** doom-gruvbox for the theme
;; (setq doom-theme 'doom-gruvbox display-line-numbers-type 'relative)


;; ** Outshine mini mode for all major modes
(add-hook 'prog-mode-hook 'outshine-mode)

(use-package! company-ctags :config (company-ctags-auto-setup))

;; * Languages

;; ** Python
;; *** Enable dap-mode for python
;; (add-hook 'python-mode (require 'dap-python))


;; * Keybinds

;; ** Docker-compose
(map! :leader (:desc "Docker"  "d" #'docker))

;; ** rgrep in project
(map! :leader (:prefix-map ("s" . "search") :desc "rgrep in project" "r" #'rgrep))

;; ** Ctrl+vim navigation keys in the evil edit mode
;- (map! :i "C-l" #'forward-char
;-      :i "C-h" #'backward-char
;-      :i "C-k" #'previous-line
;-      :i "C-j" #'next-line
;-      :i "C-p" #'previous-line
;-      :i "C-n" #'next-line)

;; ** jump to paranthesis with tab
(map! :n [tab] 'evil-jump-item)

;; ** expand region
(map! :leader (:desc "Expand region"  "v" #'er/expand-region))

(map! :ne "SPC / r" #'deadgrep)


;; ** dired hide files toggle on M-h
(setq my-dired-ls-switches "-alh --ignore=.* --ignore=\\#* --ignore=*~")

(setq my-dired-switch 1)


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Amit Jindal" user-mail-address "amitjindal@aquevix.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "Ubuntu Nerd Font" :size 16)
;;       doom-variable-pitch-font (font-spec :family "Ubuntu Nerd Font" :size 16))

; (setq doom-font (font-spec :family "Ubuntu Mono" :size 16)
; (setq doom-font (font-spec :family "JetBrains Mono" :size 16 :weight 'medium)
(setq
   ;; doom-font (font-spec :family "Source Code Pro" :size 14)
   ;; doom-big-font (font-spec :family "Source Code Pro" :size 18)
   doom-font (font-spec :family "Liberation Mono" :size 15)
   doom-big-font (font-spec :family "Liberation Mono" :size 20)
)
;; (setq-default line-spacing 5)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
; (setq doom-theme 'doom-one-light)
; (setq doom-theme 'doom-nord-light)
; (setq doom-theme 'doom-solarized-light)
; (setq doom-theme 'doom-solarized-dark)

;; ** error in treemacs icons
(doom-themes-treemacs-config)
(after! treemacs (treemacs-load-theme "doom-colors"))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Projectile Config: https://docs.projectile.mx/projectile/configuration.html
(setq projectile-sort-order 'recently-active)
;; (setq projectile-project-search-path '("~/projects/" "~/work/" ("~/work/git/" . 1)))
(setq projectile-project-search-path '( ("~/work/git/" . 1)))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;(require 'doom-themes)

;;(setq auto-mode-alist
;;    (cons '("\\.njk$" . html-mode) auto-mode-alist))

;;(add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))

;(add-hook 'beancount-mode-hook
;  (lambda () (setq-local electric-indent-chars nil)))

(add-hook 'beancount-mode-hook #'outline-minor-mode)

(use-package! lsp-tailwindcss)

;; HTML web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.njk\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(with-eval-after-load 'company
  ;; @see https://github.com/redguardtoo/emacs.d/commit/2ff305c1ddd7faff6dc9fa0869e39f1e9ed1182d
  (defadvice company-in-string-or-comment (around company-in-string-or-comment-hack activate)
    (if (memq major-mode '(html-mode web-mode nxml-mode))
        (setq ad-return-value nil)
      ad-do-it)))
;; (setq web-mode-ac-sources-alist '(
    ;; ("css" . (ac-source-css-property))
    ;; ("html" . (ac-source-words-in-buffer ac-source-abbrev)))
;; )
    ;; ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
    ;; ("css" . (ac-source-css-property ac-source-emmet-css-snippets)))

(add-to-list 'auto-mode-alist '("\\.svg\\'" . xml-mode))

;; Enable windows switching with SHIFT-<Arrow-Key>
(windmove-default-keybindings)

(global-visual-line-mode t)

;; Toggle minimap
(define-key evil-normal-state-map (kbd "SPC t m") 'minimap-mode)
(setq minimap-window-location 1)

(setq display-line-numbers-type 'relative)

