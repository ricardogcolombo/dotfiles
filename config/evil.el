
(unless (package-installed-p 'undo-fu)
  (package-install 'undo-fu))
(use-package undo-fu)
;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))

(unless (package-installed-p 'vertico)
  (package-install 'vertico))

;; Enable Evil

(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  :config
  (require 'evil-leader)
  (evil-mode 1))

(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

(use-package evil-collection
             :after evil
             :config
             (setq evil-want-integration t)
             (evil-collection-init))

(use-package vertico
             :config
             (vertico-mode))

(use-package general
         :ensure t)

(general-evil-define-key 'normal 'global
 :prefix "SPC"
 "w/" 'split-window-right
 "f f" 'search-file
 )
