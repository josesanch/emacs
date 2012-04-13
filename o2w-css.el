(require 'less-css-mode)


(defun make-less()
  (interactive)
  (shell-command "cd ../.. && make less"))

; Function to compile current buffer (if it's a LESS file) to CSS
(defun compile-less-css ()
  "Compile LESS to CSS"
  (interactive)
  (if (string-match "\.less$" (buffer-file-name))
      (async-shell-command (concat "lessc -x " (buffer-file-name) " "
                                   (file-name-directory (directory-file-name (file-name-directory buffer-file-name)))
                                   "css/" (file-name-sans-extension (file-name-nondirectory buffer-file-name)) ".css") nil nil))
  )

;; HotKey  to compile LESS to CSS
;(global-set-key '[f9] 'compile-less-css)

;; To compile whenever the file is saved, uncomment the following line:
                                        ;(add-hook 'after-save-hook 'compile-less-css)
(add-hook 'after-save-hook 'compile-less-css)


;(setq-default less-css-compile-at-save t)
(setq-default less-css-lessc-options "-x")


(provide 'o2w-css)
