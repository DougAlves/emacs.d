(require 'package)
(package-initialize)
(setq-default tab-width 4)
(setq c-basic-offset 4)
;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)
(setq inhibit-splash-screen t)
(setq inhib-startup-screen t)
(set-face-attribute 'default nil :height 130)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(show-paren-mode 0)

(add-to-list 'load-path "~/.emacs.d/org-bullets")
(add-to-list 'load-path "~/.emacs.d/undo-tree")

(require 'undo-tree)
(require 'org-bullets)
(require 'evil-mc)


(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(menu-bar-mode 0)
(tool-bar-mode 0)
(ido-mode t)
(evil-mode t)
(evil-mc-mode 1)
(set-cursor-color "#fff000")


(defun findMarker ()
  (interactive)
  (search-forward "<++>")
  (backward-char 4)
  (delete-char 4))


(defun for ()
  (interactive)
  (insert "for(<++>; <++>; <++>) ")
  (backward-char (length "for(<++>; <++>; <++>) ")))

(defun fi()
  (interactive)
  (insert  "if (<++>)")
  (previous-line 4))


(global-set-key (kbd "C-c C-g") 'evil-mc-undo-all-cursors)
(global-set-key (kbd "C-ç") 'findMarker)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (badger)))
 '(custom-safe-themes
   (quote
	("e7b49145d311e86da34a32a7e1f73497fa365110a813d2ecd8105eaa551969da" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "5c3d187c7cf75ab371b3fbc38778f58a9463b300c9c71e69044fd916361fce8e" "47ec21abaa6642fefec1b7ace282221574c2dd7ef7715c099af5629926eb4fd7" "dd2346baba899fa7eee2bba4936cfcdf30ca55cdc2df0a1a4c9808320c4d4b22" default)))
 '(frame-brackground-mode (quote dark))
 '(package-selected-packages
   (quote
	(evil-mc csv-mode badger-theme evil-magit magit evil-visual-mark-mode undo-tree evil markdown-mode haskell-mode gruber-darker-theme goto-chg abyss-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

