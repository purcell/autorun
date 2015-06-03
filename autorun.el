;;; autorun.el --- automatically run the current file using quickrun  -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Raghav Kumar Gautam

;; Author: Raghav Kumar Gautam <raghav@apache.org>
;; Keywords: tools, convenience, languages
;; Package-Requires: ((emacs "24") (quickrun "2.2.3"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Automatically run the current file using quickrun

;;; Code:

(require 'quickrun)

(defun autorun-run ()
  "Run the current file."
  (interactive)
    (quickrun)
    (other-window 1))

(define-minor-mode autorun-mode
  "Run the file using quickrun on save."
  :lighter " AR"
  (if (bound-and-true-p autorun-mode)
      (progn (make-local-variable 'after-save-hook)
	     (add-hook 'after-save-hook 'autorun-run nil t))
    (kill-local-variable 'after-save-hook)))

(provide 'autorun)
;;; autorun.el ends here
