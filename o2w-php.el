(defvar php-mode-dir (concat o2w-dir "php-mode/"))
(add-to-list 'load-path php-mode-dir)

(require 'php-mode)
(require 'php-electric)


(defun o2w-php-vars ()
  "Set some buffer-local variables."
  (interactive)
;  (c-set-offset 'arglist-cont 0)
;  (c-set-offset 'arglist-intro '+)
;  (c-set-offset 'case-label 2)
;  (c-set-offset 'arglist-close 0)
  (setq case-fold-search t)
  (setq fill-column 95)
  (setq c-basic-offset 4)
  (setq show-paren-mode t)
  (php-electric-mode 1)
  (whitespace-mode 0)
  (electric-pair-mode 0)
  (flymake-mode 1)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  )

(defun o2w-php-key-bindings ()
  "Teclas"
  (interactive)
  (local-set-key [C-s-left] 'hide-sublevels)
  (local-set-key [C-s-right] 'show-all)
  (local-set-key [C-up] 'outline-previous-visible-heading)
  (local-set-key [C-down] 'outline-next-visible-heading)
  (local-set-key [M-up] 'outline-backward-same-level)
  (local-set-key [M-down] 'outline-forward-same-level)
  (local-set-key [M-left] 'hide-subtree)
  (local-set-key [M-right] 'show-subtree)
  (local-set-key [C-s-up] 'outline-move-subtree-up)
  (local-set-key [C-s-down] 'outline-move-subtree-down)
  (local-set-key [tab] 'yas/expand)
  (setq outline-regexp "[ \t]*\\(public static\\|public funct\\|protected funct\\|private funct\\|funct\\|class\\|#head\\)")
  (local-set-key [(control c)(control f)]  'find-file-in-git-repo)
  )

(add-hook 'php-mode-hook
          '(lambda ()
             (o2w-php-vars)
             (o2w-php-key-bindings)
             ))

(provide 'o2w-php)
