;; pline-smooth.lsp - Smooth polylines with the Fit curve option
;; Command: PLSMOOTH
(defun c:PLSMOOTH ( / ss i en )
  (setq ss (ssget '((0 . "LWPOLYLINE,POLYLINE"))))
  (if ss
    (progn
      (setq i 0)
      (repeat (sslength ss)
        (setq en (ssname ss i))
        (command "_.PEDIT" en "_F" "")
        (setq i (1+ i))
      )
      (princ (strcat "\nSmoothed " (itoa (sslength ss)) " polylines."))
    )
  )
  (princ)
)
