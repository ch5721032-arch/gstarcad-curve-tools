;; pline-reverse.lsp - Reverse the direction of curves
;; Command: PLREV
(defun c:PLREV ( / ss )
  (setq ss (ssget '((0 . "LWPOLYLINE,POLYLINE,LINE,SPLINE"))))
  (if ss
    (progn
      (command "_.REVERSE" ss "")
      (princ (strcat "\nReversed " (itoa (sslength ss)) " objects."))
    )
  )
  (princ)
)
