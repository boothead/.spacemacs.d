;;; -*- lexical-binding: t; -*-

(configuration-layer/declare-layers
 '(
   ;;;; Core
   (auto-completion :variables
                    auto-completion-return-key-behavior 'complete
                    auto-completion-tab-key-behavior 'complete
                    haskell-completion-backend 'ghci
                    auto-completion-enable-snippets-in-popup t)
   better-defaults
   (git :variables
        git-enable-github-support t
        git-gutter-use-fringe t)
   github
   (ivy :variables
        ivy-extra-directories nil)
   ;;;; mu4e
   (mu4e :variables
         ;; TODO FIXME
         mu4e-installation-path "/nix/store/4ww1ays3mmwv7wnbp940bh4gcmyzjw7x-mu-1.0/share/emacs/site-lisp"
         mu4e-use-maildirs-extension t
         mu4e-enable-async-operations t
         mu4e-enable-notifications t
         mu4e-maildir "~/.mail"
         ;; TODO FIXME
         mu4e-mu-binary "/run/current-system/sw/bin/mu"
         mu4e-headers-include-related t
         mu4e-drafts-folder "/drafts"
         mu4e-sent-folder "/sent"
         ;; mu4e-sent-messages-behavior 'delete
         mu4e-show-images t
         mu4e-trash-folder "/trash"
         mu4e-refile-folder "/archive"
         mu4e-update-interval 300
         mu4e-compose-signature-auto-include nil
         mu4e-use-conversation t
         ;; TODO FIXME
         mu4e-get-mail-command "mbsync -a")
   ;;;; org
   (org :variables
        org-enable-github-support t
        org-enable-bootstrap-support t
        org-enable-org-journal-support t
        org-projectile-file "TODOs.org"
        org-want-todo-bindings t
        org-enable-reveal-js t)

   (shell :variables
          shell-default-shell 'eshell)
   spell-checking
   syntax-checking
   (version-control :variables
                    version-control-global-margin t
                    version-control-diff-tool 'git-gutter+)

   ;; Misc
   graphviz
   ranger
   (ibuffer :variables
            ibuffer-group-buffers-by 'projects)

   ;; Markups
   csv
   html
   markdown
   yaml

   ;; Languages
   emacs-lisp
   hie-nix
   lsp
   nixos
   (purescript :variables
               purescript-enable-rebuild-on-save t
               purescript-add-import-on-completion nil
               )
   (python :variables
           python-test-runner 'pytest
           python-spacemacs-indent-guess nil)
   ))
