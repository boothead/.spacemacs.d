;;; Setup -*- lexical-binding: t; -*-
;;;; Commentary

;; -- Eric Kaschalk's Spacemacs Configuration --
;; -- Contact: ekaschalk@gmail.com --
;; -- MIT License --
;; -- Emacs 26.1 ~ Spacemacs Dev Branch 0.300.0.x ~ pkgs updated: 11/16/18 --
;; -- http://modernemacs.com --
;;
;; Personal layers host most of my configuration - see README.
;; Ligatures and icons require installation - see README.
;;
;; Layers are declared in `layers/config/layers.el'.
;;
;; Set `redo-bindings?' to true if you - want my aggressive rebindings.
;; Set `server?'        to true if you - use emacs as a daemon.
;;
;; `init.el' sets spacemacs up, defining required `dotspacemacs/..' funcs & vars.

;;;; Constants

(defconst eric?    (string= "Eric Kaschalk" (user-full-name)) "Am I me?")
(defconst linux?   (eq system-type 'gnu/linux) "Are we on a linux machine?")
(defconst mac?     (eq system-type 'darwin)    "Are we on a macOS machine?")
(defconst windows? (not (or linux? mac?))      "Are we on windows machine?")

;;;; Configuration

(defvar redo-bindings? (if eric? t nil)
  "Redo spacemacs bindings? Defaults to nil for non-eric users.

I aggressively re-bind and un-bind spacemacs defaults.

This indicator:
1. Removes prefixes/bindings contained within `redo-spacemacs-prefixes-list'.
2. Removes bindings in `redo-spacemacs-undo-bindings-alist'.
3. Adds bindings in `redo-spacemacs-new-bindings-alist'.

It is highly recommend to look through the above 3 variables before enabling,
defined at end of `layers/config/packages.el' in `config/init-redo-spacemacs'.")

;;; Spacemacs/
;;;; Spacemacs/init

(defun dotspacemacs/init ()
  "Instantiate Spacemacs core settings.

All `dotspacemacs-' variables with values set different than their defaults.

They are all defined in `~/.emacs.d/core/core-dotspacemacs.el'.
Check `dotspacemacs/get-variable-string-list' for all vars you can configure."
  (setq-default
   ;; Display
   dotspacemacs-default-font `(,(if (x-list-fonts "Operator Mono")
                                    "operator mono medium"
                                  "Source Code Pro")
                               :size ,(if (= 1080 (display-pixel-height)) 12 22))
   dotspacemacs-themes       '(zenburn
                               spacemacs-dark
                               solarized-light
                               )

   ;; General
   dotspacemacs-auto-generate-layout-names t
   dotspacemacs-editing-style              '(vim :variables
                                                 vim-style-visual-feedback t
                                                 vim-style-remap-Y-to-y$ t)
   dotspacemacs-elpa-https                 nil
   dotspacemacs-elpa-subdirectory          nil
   dotspacemacs-enable-server              t
   dotspacemacs-fullscreen-at-startup      t
   dotspacemacs-large-file-size            5
   dotspacemacs-persistent-server          nil
   dotspacemacs-pretty-docs                t
   dotspacemacs-search-tools               '("ag" "rg" "pt" "ack" "grep")
   dotspacemacs-scratch-mode               'org-mode
   dotspacemacs-startup-banner             nil
   dotspacemacs-startup-lists              nil
   dotspacemacs-whitespace-cleanup         'trailing

   ;; The following are unchanged but are still required for reloading via
   ;; 'SPC f e R' `dotspacemacs/sync-configuration-layers' to not throw warnings
   dotspacemacs-emacs-leader-key  "M-m"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-leader-key        "SPC"
   dotspacemacs-mode-line-theme   '(all-the-icons :separator arrow)))

;;;; Spacemacs/layers

(defun dotspacemacs/layers ()
  "Instantiate Spacemacs layers declarations and package configurations."
  (setq-default
   dotspacemacs-configuration-layers     '((config   :location local)
                                           (display  :location local)
                                           ;; (personal :location local)
                                           )
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   dotspacemacs-additional-packages      '()
   dotspacemacs-frozen-packages          '()
   dotspacemacs-excluded-packages
   '(;; Must Exclude (for styling, functionality, bug-fixing reasons)
     fringe importmagic scss-mode vi-tilde-fringe

            ;; Packages I don't use (non-exhaustive)
            anzu centered-cursor-mode column-enforce-mode company-statistics
            doom-modeline eshell-prompt-extras evil-anzu evil-mc evil-tutor
            fancy-battery fill-column-indicator gnuplot golden-ratio indent-guide
            live-py-mode multi-term multiple-cursors mwim neotree paradox py-isort
            yapfify)))

;;;; Spacemacs/user-init

(defun dotspacemacs/user-init ()
  "Package independent settings to run before `dotspacemacs/user-config'."
  (fringe-mode 0)
  (add-to-list 'configuration-layer-elpa-archives '("melpa-stable" . "stable.melpa.org/packages/"))
  (add-to-list 'package-pinned-packages '(spaceline . "melpa-stable"))
  (add-to-list 'package-pinned-packages '(spaceline-all-the-icons . "melpa-stable"))
  (add-to-list 'package-pinned-packages '(all-the-icons . "melpa-stable"))
  (setq browse-url-browser-function 'browse-url-chromium)
  (setq custom-file "~/.spacemacs.d/.custom-settings.el"))

;;;; Spacemacs/user-config
;;;;; Post Layer Load

(defun dotspacemacs/user-config/post-layer-load-config ()
  "Configuration to take place *after all* layers/pkgs are instantiated."

  ;; While toggling with `toggle-frame-fullscreen' works, I could not get
  ;; it to work as a hook attached to the frame-make or window-setup.
  ;; Depending on your OS, you may need a different/not-at-all need this.
  (when (and mac? server?)
    (add-to-list 'default-frame-alist '(fullscreen . fullboth))))

;;;;; Core

(defun dotspacemacs/user-config ()
  "Configuration that cannot be delegated to layers."
  (dotspacemacs/user-config/post-layer-load-config)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; Drop-in whatever config here without having to worry about good practices
  )
