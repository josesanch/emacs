(defun gnome-terminal ()
  "Gnome terminal"
  (interactive)
  (shell-command "gnome-terminal .")
  )

(defun refresh-chrome ()
  "Refresh chrome"
  (interactive)
  (shell-command "xdotool search --onlyvisible --name Chromi key control+r"))


(defun refresh-firefox ()
  "Refresh firefox"
  (interactive)
  (comint-send-string (inferior-moz-process) "BrowserReload();"))


(defun git-push-web ()
  "Push web"
  (interactive)
  (shell-command "git push web"))

(defun git-push-commit-web ()
  "Push web"
  (interactive)
  (shell-command (concat "git commit -am '" (read-string "Commit: ") "'")))


(global-set-key [(f9)] 'gnome-terminal)
(global-set-key [f12] 'refresh-chrome)
(global-set-key [C-f5] 'git-push-commit-web)
(global-set-key [(shift f5)] 'git-push-web)

(global-set-key [(shift f2)] 'kill-this-buffer)
(global-set-key [(f5)] 'compile)
(global-set-key [tab] 'yas/expand)


(global-set-key [(control c)(j)]  'find-file-in-git-repo)

(provide 'o2w-keys)
