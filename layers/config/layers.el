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

   ;;;; org
   (org :variables
        org-enable-github-support t
        org-enable-bootstrap-support t
        org-enable-org-journal-support t
        org-projectile-file "TODOs.org"
        org-want-todo-bindings t
        org-enable-hugo-support t
        org-enable-reveal-js t)

   (shell :variables
          shell-default-shell 'eshell)
   spell-checking
   syntax-checking
   (version-control :variables
                    version-control-global-margin t
                    version-control-diff-tool 'git-gutter+)

   ;; Misc
   (colors :variables
           colors-colorize-identifiers nil)
   graphviz
   ranger
   (ibuffer :variables
            ibuffer-group-buffers-by 'projects)
   theming
   prodigy

   ;; Markups
   csv
   html
   markdown
   yaml
   (latex :variables
          latex-enable-auto-fill t
          latex-enable-folding t)
   pdf-tools

   ;; Languages
   javascript
   emacs-lisp
   ;; hie-nix
   (lsp-haskell :location (recipe :fetcher github :repo "emacs-lsp/lsp-haskell"))
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
