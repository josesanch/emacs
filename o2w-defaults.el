(setq yas/snippet-dirs (concat o2w-dir "snippets/"))
(yas/reload-all)  ; Load the new snipped dir

(setq default-directory "~/Escritorio/Dropbox/web/")

(setq bookmark-default-file "~/.emacs.d/bookmarks") ;; bookmarks

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

(setq bbdb-file "~/.emacs.d/bbdb")

(setq tab-width 4)
(setq-default tab-width 4)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))


(prelude-restore-arrow-keys)
(cua-mode t)

(defun fd-add-file-to-recent ()
  (interactive)
  (when buffer-file-name
    (start-process "addtorecent" nil "addtorecent"
                   (concat "file://" buffer-file-name)
                   "text/plain"
                   "Emacs"
                   "emacsclient %F")))

(add-hook 'find-file-hook 'fd-add-file-to-recent)

(require 'auto-complete)
(global-auto-complete-mode)
(menu-bar-mode)

; Deactivate whitespace
(defun o2w-prog-mode-defaults ()
  "Default coding hook, useful with any programming language."
  (prelude-turn-off-whitespace)
)
(add-hook 'prelude-prog-mode-hook 'o2w-prog-mode-defaults t)


(require 'find-file-in-git-repo)

(provide 'o2w-defaults)
