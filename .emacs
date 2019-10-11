;;; MELPA:
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;--------------------------------EVIL mode setup-------------------------------------------
(setq evil-want-integration t)
(setq evil-want-keybinding nil)

;; add C-u as scroll up as opposed to standard emacs bind
(setq evil-want-C-u-scroll t)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; add evil key bindings to vanilla unsupported modes
(when (require 'evil-collection nil t)
  (evil-collection-init))

;;-------------------------------------ivy setup-------------------------------------------
(ivy-mode 1)
;; slim down ivy display
(setq ivy-count-format ""
      ivy-display-style nil
      ivy-minibuffer-faces nil)

;;------------------------------visual_settings--------------------------------------------

;; don't beep, flash modline instead
(setq ring-bell-function
      (lambda ()
        (let ((orig-fg (face-foreground 'mode-line)))
          (set-face-foreground 'mode-line "#F2804F")
          (run-with-idle-timer 0.1 nil
                               (lambda (fg) (set-face-foreground 'mode-line fg))
                               orig-fg))))
;; toolbar disable
(tool-bar-mode -1)
;; menubar disable
(menu-bar-mode -1)

;;make lines visible
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode 1))

;; disable scroll bars
(scroll-bar-mode -1)
;; set default font
(set-frame-font "Source Code Pro-10" nil t)

;; set theme
;;(load-theme 'sanityinc-tomorrow-night t)
(load-theme 'base16-chalk t)


;; non blinking cursor
(blink-cursor-mode 0)

;; relative line numbers
;; (setq display-line-numbers 'relative)

;; enable global line wrapping
(global-visual-line-mode t)

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(beacon-color "#cc6666")
 '(custom-safe-themes
   (quote
    ("e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" default)))
 '(fci-rule-color "#373b41")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(package-selected-packages
   (quote
    (molokai-theme base16-theme evil-collection highlight-parentheses ivy telephone-line color-theme-sanityinc-tomorrow)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-checkbox-statistics-todo ((t (:background "#151515"))))
 '(org-done ((t (:background "#151515" :foreground "#acc267"))))
 '(org-level-2 ((t (:inherit outline-8))))
 '(org-level-4 ((t (:inherit outline-2))))
 '(org-todo ((t (:background "#151515" :foreground "#fb9fb1"))))
 '(telephone-line-evil-insert ((t (:inherit telephone-line-evil :background "plum3" :foreground "black" :weight normal))))
 '(telephone-line-evil-normal ((t (:inherit telephone-line-evil :background "#b5bd68" :foreground "black" :weight normal))))
 '(telephone-line-evil-visual ((t (:inherit telephone-line-evil :background "dark gray" :foreground "black" :weight normal)))))

;; -----------------------------modline---------------------------------------------
(require 'telephone-line)
(telephone-line-mode 1)

;;------------------------------org mode--------------------------------------------

;; change standard evil keybindings
(define-key evil-normal-state-map (kbd "L") 'org-shiftright)
(define-key evil-normal-state-map (kbd "H") 'org-shiftleft)
