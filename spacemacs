;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(yaml
     rust
     django
     javascript
     markdown
     html
     ;; ivy

     (python :variables python-test-runner 'pytest)
     ;; lsp-python
     ;; elpy

     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-complete-with-key-sequence-delay 0.0
                      auto-completion-private-snippets-directory nil)

     ;; better-defaults
     deft
     erc
     emacs-lisp
     (git :variables
          git-gutter-use-fringe t)
     (haskell :variables haskell-completion-backend 'intero)
     ;; latex
     ;; markdown
     org
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking-packages
     (syntax-checking)
     sql
     themes-megapack
     ;; (treemacs :variables treemacs-use-follow-mode t)
     vimrcish
     (version-control :variables
                       version-control-global-margin t)
     ;; (wakatime :variables
     ;;           wakatime-api-key  "639977ce-a414-4475-a015-0634b97c3a3c"
     ;;           ;; use the actual wakatime path
     ;;           wakatime-cli-path "/usr/local/bin/wakatime")

     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(fzf virtualenvwrapper flycheck-mypy flycheck-pycheckers pocket-reader)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   dotspacemacs-mode-line-theme 'spacemacs

   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Org mode stuff
  (setq org-agenda-files (list "~/org/todo.org"
                               "~/org/treebo_todo.org"
                               "~/org/google.org"))
  (setq org-agenda-start-day "-1d")
  (setq org-agenda-span 7)
  (setq org-agenda-start-on-weekday nil)

  ;; (setq org-agenda-custom-commands
  ;;       '(("c" "Simple agenda view"
  ;;          ((agenda "")
  ;;           (alltodo "")))))

  (setq org-agenda-custom-commands
        '(("c" "Simple agenda view"
           ((tags "PRIORITY=\"A\""
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                   (org-agenda-overriding-header "High-priority unfinished tasks:")
                   ))
            (agenda "")
            (alltodo "")))))

  ;; (org-agenda-files (list "~/org/treebo_todo.org"))



  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (define-key evil-motion-state-map "j" 'evil-next-visual-line)
  (define-key evil-motion-state-map "k" 'evil-previous-visual-line)
  ;; Also in visual mode
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line)

  ;; Include _ in word motion
  ;; For python
  (add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; For ruby
  (add-hook 'ruby-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  ;; For Javascript
  (add-hook 'js2-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))







  (add-hook 'python-mode-hook (lambda ()
                                (flycheck-mode 1)
                                (semantic-mode 1)
                                (setq flycheck-checker 'python-pylint
                                      flycheck-checker-error-threshold 900
                                      )))

  (flycheck-define-checker
      python-mypy ""
      :command ("mypy"
                "--ignore-missing-imports" "--fast-parser"
                "--python-version" "3.6"
                source-original)
      :error-patterns
      ((error line-start (file-name) ":" line ": error:" (message) line-end))
      :modes python-mode)

  (add-to-list 'flycheck-checkers 'python-mypy t)
  (flycheck-add-next-checker 'python-pylint 'python-mypy t)

  ;;(define-key global-map (kbd "C-h") #'evil-window-left)
  ;;(define-key global-map (kbd "C-j") #'evil-window-down)
  ;;(define-key global-map (kbd "C-k") #'evil-window-up)
  ;;(define-key global-map (kbd "C-l") #'evil-window-right)

  (define-key evil-normal-state-map (kbd "C-h") #'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") #'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") #'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") #'evil-window-right)

  (setq scroll-margin 8)
  (setq smooth-scroll-margin 8)

  (define-key evil-motion-state-map (kbd "C-i") 'evil-jump-forward)
  (define-key evil-normal-state-map (kbd "C-i") 'evil-jump-forward)

  (remove-hook 'prog-mode-hook #'highlight-parentheses-mode)


  ;; autocomplete settings
  (setq company-dabbrev-downcase 0)
  ;; (setq company-idle-delay 0)

  (defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas-minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))

  (global-set-key [backtab] 'tab-indent-or-complete)

  (setq projectile-enable-caching t)

  ; mypy stuff
  (require 'flycheck-mypy)


  (setq org-todo-keywords
        '((sequence "TODO" "IN-PROGRESS" "DONE")))


  ;; (setq org-directory "~/org/")
  (setq aswin/home-dir (expand-file-name "~"))
  (setq org-directory (concat aswin/home-dir "/org"))

  (setq org-capture-templates
        (quote (

                ("t" "TODO stuff")

                ("tp" "Personal" entry (file+headline "~/org/todo.org" "Personal") (file "~/org/capture_templates/todo.txt") :empty-lines-before 1 :empty-lines-after 0 :prepend t)
                ("tt" "Treebo" entry (file+headline "~/org/treebo_todo.org" "TODOS") (file "~/org/capture_templates/todo.txt") :empty-lines-before 1 :empty-lines-after 0 :prepend t)

                ("l" "Logbook entry" entry (file+datetree "~/org/logbook-work.org") "** %U - %^{Activity}  :LOG:")

                ("r" "reasearch stuff")

                ("rt" "Research topic" entry (file+headline "~/org/google.org" "Things to read") (file "~/org/capture_templates/google.txt") :empty-lines-before 1 :empty-lines-after 0 :prepend t)

                ("rl" "Research link" entry (file+headline "~/org/google.org" "Things to read") (file "~/org/capture_templates/research_link.txt") :empty-lines-before 1 :empty-lines-after 0 :prepend t)

                ("i" "Idea" entry (file+headline "~/org/google.org" "Things to read") (file "~/org/capture_templates/google.txt") :empty-lines-before 1 :empty-lines-after 0 :prepend t)

                )

               )
        )

  (defun rae/org-agenda-day ()
    (interactive)
    (org-agenda-list nil nil 'day nil)
    )

  ;; global keybindings
  (evil-leader/set-key
    "oa" 'org-agenda
    "od" 'rae/org-agenda-day
    "oc" 'org-capture
    "ol" 'org-store-link
    "oj" 'org-clock-jump-to-current-clock
    "og" 'org-clock-goto
    "ot" 'org-capture-goto-target
    )


  ;; deft stuff
  (setq deft-directory "~/org/notes")
  (setq deft-recursive t)

  ;; pocket reader config
  (setq pocket-reader-url-open-fn-map
    '((eww-browse-url "*")))
  (setq pocket-reader-archive-on-open nil)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (sql-indent web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag ace-jump-helm-line mmm-mode markdown-toc markdown-mode gh-md git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode haml-mode emmet-mode company-web web-completion-data intero hlint-refactor hindent haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download magit-gitflow htmlize gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete fzf yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional cython-mode anaconda-mode pythonic ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-make helm helm-core google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump popup f dash s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed async aggressive-indent adaptive-wrap ace-window ace-link avy)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#073642" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-sexp-background-color "#1c1f26")
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files
   (quote
    ("~/org/treebo_todo.org" "~/org/todo.org" "~/org/google.org")))
 '(package-selected-packages
   (quote
    (pdf-tools sql-indent web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-hoogle helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag ace-jump-helm-line mmm-mode markdown-toc markdown-mode gh-md git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode haml-mode emmet-mode company-web web-completion-data intero hlint-refactor hindent haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download magit-gitflow htmlize gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor company-statistics company-anaconda company auto-yasnippet yasnippet ac-ispell auto-complete fzf yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional cython-mode anaconda-mode pythonic ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline smex restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-make helm helm-core google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump popup f dash s diminish define-word counsel-projectile projectile pkg-info epl counsel swiper ivy column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed async aggressive-indent adaptive-wrap ace-window ace-link avy)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values
   (quote
    ((org-todo-keyword-faces
      ("TODO" . "red")
      ("IN-PROGRESS" . "orange")
      ("DONE" . "green"))
     (org-todo-keyword-faces
      ("TO-WATCH" . "red")
      ("WATCHING" . "orange")
      ("WATCHED" . "green")))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(temp-buffer-resize-mode t)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
