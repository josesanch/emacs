
(defvar o2w-packages
  '(find-file-in-git-repo js3-mode less-css-mode))


(defun o2w-packages-installed-p ()
  (loop for p in o2w-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (o2w-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs O2w is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p o2w-packages)
    (when (not (package-installed-p p))
      (package-install p))))



(provide 'o2w-packages)
