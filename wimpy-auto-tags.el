(defun get-current-dir-name ()
  "Devuelve el nombre del directorio"
  (interactive)
  (first (rest (reverse (split-string default-directory "/"))))
  )

(defun get-dir-project()
  "Obtiene el directorio del projecto"
  (setq directory-name (get-current-dir-name))
   (cond
	((string-equal "controllers" directory-name)  (concat (pwd) "../../"))
	((string-equal "models"    directory-name)  (concat (pwd) "../../"))
	((string-equal "views"   directory-name) (concat (pwd) "../../"))
	((string-equal "htdocs"   directory-name) (concat (pwd) "../"))
	(t ""))
)


(defun wimpy-update-etags()
  "actualiza tags del proyecto"
  (interactive)
  (setq project-directory (replace-regexp-in-string "Directory " "" (get-dir-project)))
  (cond
   ((string-equal "" project-directory) (message (concat "No está en el directorio correcto" project-directory)))
   (t (compile (concat "find /home/jose/Escritorio/Dropbox/web/include/wimpy " project-directory " -name '*.php' -print \
| grep -v -E '/wimpy/skel/|/library/tcpdf|wimpy/resources/js|PHPMailer|ckeditor|fckeditor|/library/fpdi' \
| xargs etags -e \
--totals=yes \
--tag-relative=yes \
--PHP-kinds=cdfi \
--regex-PHP='/abstract class ([^ ]*)/\1/c/' \
--regex-PHP='/interface ([^ ]*)/\1/c/' \
--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' -o " project-directory "TAGS"))))
  )





(defun wimpy-get-current-dir-name()
  "Devuelve el nombre del directorio"
  (interactive)
  (first (rest (reverse (split-string default-directory "/")))))

(defun wimpy-get-dir-project()
  "Obtiene el directorio del projecto"
  (setq directory-name (wimpy-get-current-dir-name))
   (cond
	((string-equal "controllers" directory-name)  (concat default-directory "../../"))
	((string-equal "models"    directory-name)  (concat default-directory "../../"))
	((string-equal "htdocs"   directory-name) (concat default-directory "../"))
	(t nil)))


(defun wimpy-makefile()
  "Make file para wimpy"
  (interactive)
  (cd (wimpy-get-dir-project))
  (compile (concat "make")))


(defun wimpy-get-project-files()
  "Devuelve lista de archivos del proyecto"
  (interactive)
  (setq current-dir-project (wimpy-get-dir-project))
  (if current-dir-project
	  (split-string
	   (shell-command-to-string
		(concat "find " current-dir-project " -name '*.php' -o -name '*.html' -o -name '*.css'")))))


;-php-kinds=cdfi
;-PHP-kinds=+cf \
