

(unless (package-installed-p 'magit)
  (package-install 'magit))

; magit
(use-package magit ; TODO key bindings and such
  :ensure t)

