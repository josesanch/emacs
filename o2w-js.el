(require 'js3-mode)

(defun o2w-js-vars ()
  "Set some buffer-local variables."
  (interactive)
;  (whitespace-mode 0)
;  (flymake-mode 1)

  )

(defun o2w-js-key-bindings ()
  "Teclas"
  (interactive)
  (local-set-key [C-s-left] 'js3-mode-hide-functions)
  (local-set-key [C-s-right] 'js3-mode-show-functions)
  (local-set-key [M-right] 'js3-mode-toggle-element)
  (local-set-key [M-left] 'js3-mode-toggle-element)
  (local-set-key [tab] 'yas/expand)
  )


(add-hook 'js-mode-hook
          '(lambda ()
;             (o2w-js-vars)
             (o2w-js-key-bindings)
             ))


(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))


(provide 'o2w-js)
