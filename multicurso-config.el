
;; Create cursors for all strings that match the selected 
;; region or the symbol under cursor.

;; Remove all cursors.

(evil-mc-make-and-goto-next-match)
;; Make a cursor at point and go to the next match of the 
;; selected region or the symbol under cursor.

(evil-mc-skip-and-goto-next-match)
;; Go to the next match of the selected region or the symbol under 
;; cursor without creating a cursor at point.
