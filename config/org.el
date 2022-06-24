(unless (package-installed-p 'org)
  (package-install 'org))

(unless (package-installed-p 'org-evil)
  (package-install 'org-evil))


;; org mode
(use-package org :ensure t)


(use-package org-superstar  ;; Improved version of org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))
  
(setq org-startup-indented t)           ;; Indent according to section
(setq org-startup-with-inline-images t) ;; Display images in-buffer by default
; (require 'evil-org)

; (use-package evil-org
;   :ensure t
;   :after (evil org)
;   :config
;   (add-hook 'org-mode-hook 'evil-org-mode)
;   (add-hook 'evil-org-mode-hook
;             (lambda ()
;               (evil-org-set-key-theme '(navigation insert textobjects additional calendar))))
;   (require 'evil-org-agenda)
;   (evil-org-agenda-set-keys))

(setq org-agenda-custom-commands
   '(("h" "Daily habits"
      ((agenda ""))
      ((org-agenda-show-log t)
       (org-agenda-ndays 7)
       (org-agenda-log-mode-items '(state))
       (org-agenda-skip-function '(org-agenda-skip-entry-if 'notregexp ":DAILY:"))))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
