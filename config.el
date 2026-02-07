;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Aditya Chaturvedi"
      user-mail-address "aditya.chaturvedi1608@gmail.com")

(setq doom-font (font-spec :family "VictorMono Nerd Font" :size 15))

(setq doom-theme 'doom-nord)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/docs/org")

;; Copilot configuration
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)
              ("C-n" . 'copilot-next-completion)
              ("C-p" . 'copilot-previous-completion))
  :config
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode . 2)))

(use-package! gptel
  :config
  (require 'gptel-integrations)
  (require 'gptel-org)
  (setq gptel-model 'gpt-4.1
        gptel-default-mode 'org-mode
        gptel-use-curl t
        gptel-use-tools t
        gptel-confirm-tool-calls 'always
        gptel-include-tool-results 'auto
        ;; gptel--system-message (concat gptel--system-message "")
        gptel-backend (gptel-make-gh-copilot "Copilot" :stream t)))
