(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-default-init t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(org-agenda-files (quote ("~/Escritorio/Dropbox/org/diario.org" "~/Escritorio/Dropbox/org/gtd.org" "~/Escritorio/Dropbox/org/gtd.org_archive" "~/Escritorio/Dropbox/org/inbox.org" "~/Escritorio/Dropbox/org/inbox.org_archive" "~/Escritorio/Dropbox/org/journal.org" "~/Escritorio/Dropbox/org/tareas.org" "~/Escritorio/Dropbox/org/tareas.org_archive")))
 '(safe-local-variable-values (quote ((js2-basic-offset . 4))))
 '(standard-indent 4)
 '(tab-width 4)
 '(user-mail-address "jose@o2w.es")
 '(w3m-use-cookies t)
 '(prelude-disable-arrow-navigation nil)
 '(evernote-username "josesanch")
 '(fill-column 255)
 )

(defvar o2w-dir (file-name-directory load-file-name))

(add-to-list 'load-path o2w-dir)

(require 'o2w-packages)
(require 'o2w-defaults)
(require 'o2w-php)
(require 'o2w-css)
(require 'o2w-js)
(require 'o2w-keys)
