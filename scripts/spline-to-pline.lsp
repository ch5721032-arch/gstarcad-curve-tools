;; spline-to-pline.lsp - Convert splines to polylines
;; Command: SPL2PL
;; Usage: APPLOAD -> SPL2PL -> select splines
(defun c:SPL2PL ( / ss i en n )
  (setq ss (ssget '((0 . "SPLINE"))))
  (if ss
    (progn
      (setq i 0 n 0)
      (repeat (sslength ss)
        (setq en (ssname ss i))
        (command "_.SPLINEDIT" en "_P" "")
        (setq n (1+ n) i (1+ i))
      )
      (princ (strcat "\nConverted " (itoa n) " splines to polylines."))
    )
    (princ "\nNo splines selected.")
  )
  (princ)
)
