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
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                       auto-completion-enable-help-tooltip t)
     ;s better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     org
     osx
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 20
            shell-default-position 'bottom)
     ;; spell-checking
     semantic
     syntax-checking
     c-c++
     python
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     vim-empty-lines
     ;;monky
     beacon
     erc
     ;; secure-config
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

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
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; stop prompting for additional languages
   dotspacemacs-enable-lazy-installation nil
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
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
   dotspacemacs-fullscreen-at-startup t
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
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
   dotspacemacs-whitespace-cleanup nil
   ))

(require 'compile)
(defun start-buck-build ()
  "helm-gtags-dwim in the other window"
  (interactive)
  (set (make-local-variable 'compile-command) "buck build messenger-no-watch")
  (recompile)
  )
(defun buck-run-on-simulator-name (name)
  (set 'compile-command (concat "buck install --run messenger-no-watch --simulator-name \"" name "\""))
  (recompile))
(defun buck-run-on-simulator ()
  (interactive)
  (buck-run-on-simulator-name "iPhone 6"))
(defun buck-run-on-device ()
  (interactive)
  (set 'compile-command "buck install --run messenger-no-watch#iphoneos-arm64")
  (recompile))
(defun list-hg-bookmarks ()
  (split-string (shell-command-to-string
                 "hg book | awk '{$NF\"\"; pring $0}'")
                 "\n"))

(defun buck-run-on-simulator-select ()
  (interactive)
  (helm :sources (-map (lambda (version)
                         (helm-build-sync-source (symbol-name (car version))
                           :candidates (-map (lambda (device) (assoc-default 'name device))
                                             (cdr version))
                           :action (lambda (sim-name)
                                     (buck-run-on-simulator-name sim-name))))
                       (reverse
                        (-filter (lambda (os)
                                   (some (lambda (device)
                                           (string= (assoc-default 'availability
                                                                   device)
                                                    "(available)"))
                                         (cdr os)))
                                 (assoc-default 'devices
                                                (json-read-from-string (shell-command-to-string "xcrun simctl list -j devices"))))))
        :buffer "*helm iOS simulators*")
  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."

  (defun spacemacs/objective-c-file-p ()
    (and buffer-file-name
         (string= (file-name-extension buffer-file-name) "m")
         (string= (file-name-extension buffer-file-name) "mm")
         (re-search-forward "@interface" 
                            magic-mode-regexp-match-limit t)))

  (add-to-list 'magic-mode-alist
               (cons #'spacemacs/objective-c-file-p #'objc-mode))
  (spacemacs/set-leader-keys "fa" 'ff-find-other-file)
  (spacemacs/set-leader-keys "cb" 'start-buck-build)
  (spacemacs/set-leader-keys "cd" 'buck-run-on-device)
  (spacemacs/set-leader-keys "cs" 'buck-run-on-simulator)
  (spacemacs/set-leader-keys "bD" 'server-edit)
  (add-hook 'java-mode-hook (lambda ()
                              (setq c-basic-offset 2
                                    tab-width 2
                                    indent-tabs-mode nil)))

  )


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (defun notify-compilation-result(buffer msg)
    "Notify that the compilation is finished,
close the *compilation* buffer if the compilation is successful,
and set the focus back to Emacs frame"
    (if (string-match "^finished" msg)
      (tooltip-show "\n Compilation Failed :-( \n "))
    (setq current-frame (car (car (cdr (current-frame-configuration)))))
    (select-frame-set-input-focus current-frame)
    )

  ;; Allow switching to .mm files when available
  (require 'find-file)
  (nconc (cadr (assoc "\\.h\\'" cc-other-file-alist)) '(".m" ".mm"))
  (nconc (cadr (assoc "\\.mm\\'" cc-other-file-alist)) '(".h"))

  (defun helm-hg-bookmarks ()
    (interactive)
    (defvar helm-source-arc-features
      (helm-build-in-file-source "Mercurial bookmarks" "/Users/bmnic/fbsource/.hg/bookmarks"
        :filter-one-by-one (lambda (bookmark)
                                  (last (split-string bookmark)))
        :action (lambda (elm)
                  (shell-command (concat "arc feature " (first (delete "*" (split-string elm)))))
                  )))
    (defvar helm-source-new-arc-feature
      (helm-build-dummy-source "New feature"
        :action (lambda (elm)
                  (shell-command (concat "arc feature " elm))
                  )))
    (helm :sources '(helm-source-arc-features
                      helm-source-new-arc-feature)
          :buffer "*helm mercurial bookmarks*")
    )
  (spacemacs/set-leader-keys "gb" 'helm-hg-bookmarks)
  (spacemacs/set-leader-keys "cS" 'buck-run-on-simulator-select)

  ;; Set up quick jumps to commonly used org files
  (defconst org-file-base "~/Library/Mobile Documents/com~apple~CloudDocs/org")
  (defun go-to-org-file (filename)
    (find-file-existing (concat (file-name-as-directory org-file-base) filename)))
  (defun go-to-arbitrary-org-file (file)
    (interactive (list
                  (read-file-name "org file:" (file-name-as-directory org-file-base))))
    (find-file-existing (concat (file-name-as-directory org-file-base) (concat file ".org"))))
  (spacemacs/declare-prefix "fO" "org files")
  (spacemacs/set-leader-keys "fOe" (lambda () (interactive) (go-to-org-file "emacs.org")))
  (spacemacs/set-leader-keys "fOn" (lambda () (interactive) (go-to-org-file "inbox.org")))
  (spacemacs/set-leader-keys "fOi" (lambda () (interactive) (go-to-org-file "impact.org")))
  (spacemacs/set-leader-keys "fOh" (lambda () (interactive) (go-to-org-file "hackday.org")))
  (spacemacs/set-leader-keys "fOH" (lambda () (interactive) (go-to-org-file "hackathon.org")))
  (spacemacs/set-leader-keys "fOs" (lambda () (interactive) (go-to-org-file "sideprojects.org")))
  (spacemacs/set-leader-keys "fOf" (lambda () (interactive) (go-to-org-file "facebook.org")))
  (spacemacs/set-leader-keys "fOm" (lambda () (interactive) (go-to-org-file "media.org")))
  (spacemacs/set-leader-keys "fOa" 'go-to-arbitrary-org-file)

  (defun generate-value-files ()
    (interactive)
    (projectile-with-default-dir (projectile-project-root)
      (shell-command "fbobjc/Tools/remodel/bin/generate fbobjc/Libraries/FBWebRTCKit/FBWebRTCKit/")))
  (defun generate-announcers ()
    (interactive)
    (projectile-with-default-dir (projectile-project-root)
      (shell-command "fbobjc/Tools/object-generation/exec/generateAnnouncers")))
  (defun generate-mobile-config ()
    (interactive)
    (projectile-with-default-dir (projectile-project-root)
      (shell-command  "fbobjc/Libraries/FBMobileConfig/Tools/download_definition.sh -c webrtc_config")))
  (defun generate-xcode-project-and-open ()
    (interactive)
    (start-process-shell-command "buck project" "*project generation*" "buck project messenger-no-watch && open ~/fbsource/fbobjc/Apps/FBMessenger/MessengerWithoutWatch.xcworkspace"))
  (defun generate-focused-xcode-project-and-open ()
    (interactive)
    (start-process-shell-command "arc focus" "*project generation*" "arc focus bn_rtc"))
  (defun generate-focused-xcode-project-for-device-and-open ()
    (interactive)
    (start-process-shell-command "arc focus" "*project generation*" "arc focus bn_rtc --arch arm64"))
  (spacemacs/declare-prefix "og" "generate project files")
  (spacemacs/set-leader-keys "ogv" 'generate-value-files)
  (spacemacs/set-leader-keys "oga" 'generate-announcers)
  (spacemacs/set-leader-keys "ogc" 'generate-mobile-config)
  (spacemacs/set-leader-keys "ogx" 'generate-xcode-project-and-open)
  (spacemacs/set-leader-keys "ogf" 'generate-focused-xcode-project-and-open)
  (spacemacs/set-leader-keys "ogF" 'generate-focused-xcode-project-for-device-and-open)


  (defun erc-facebook-connect ()
    (interactive)
    (erc-tls :server "irc.tfbnw.net" :port 6443
             :nick "bmnic" :full-name "Ben Nicholas" :password user-fb-irc-password))
  (spacemacs/set-leader-keys "aif" 'erc-facebook-connect)

  (add-to-list 'compilation-finish-functions
               'notify-compilation-result)

  )

(with-eval-after-load 'org
  (setq org-directory "~/Library/Mobile Documents/com~apple~CloudDocs/org")
  (setq org-default-notes-file "~/Library/Mobile Documents/com~apple~CloudDocs/org/inbox.org")
  (setq org-agenda-files (quote ("~/Library/Mobile Documents/com~apple~CloudDocs/org")))

  (defun org-task-open (path)
    "Open a FB task on intern."
    (browse-url (concat "https://our.intern.facebook.com/intern/tasks/?t=" path)))

  (org-add-link-type "t" 'org-task-open)

  (defun org-diff-open (path)
    "Open a FB diff on intern."
    (browse-url (concat "https://phabricator.intern.facebook.com/D" path)))

  (org-add-link-type "D" 'org-diff-open)

  (setq org-refile-targets
        '((nil :maxlevel . 3)
          (org-agenda-files :maxlevel . 2)))

  (setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Library/Mobile Documents/com~apple~CloudDocs/inbox.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/Library/Mobile Documents/com~apple~CloudDocs/inbox.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/Library/Mobile Documents/com~apple~CloudDocs/inbox.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("d" "Desk Chat" entry (file "~/Library/Mobile Documents/com~apple~CloudDocs/inbox.org")
               "* Desk Chat with %? :PHONE:\n%U" :clock-in t :clock-resume t))))

  (setq org-todo-keywords '((sequence "TASK" "NEXT" "INPROGRESS" "OUTBOX" "|" "LANDED" "PICK REQUESTED" "PICKED" "HANDEDOFF")
                            (sequence "TODO" "WORKING" "DONE"))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-prompt (lambda nil (concat "[" (buffer-name) "]")))
 '(erc-prompt-for-nickserv-password nil)
 '(erc-services-mode nil)
 '(org-startup-indented t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
