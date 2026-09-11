# GstarCAD Curve Tools

Convert splines to polylines, smooth polylines and reverse curve direction with three simple commands.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Curves arrive in every drawing from every direction: splines that should be polylines, lumpy polylines that need smoothing, and paths that were drawn the wrong way round. These three commands handle those jobs with one selection each, using standard AutoLISP only.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/spline-to-pline.lsp` | ;; spline-to-pline.lsp - Convert splines to polylines
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
 |
| `scripts/pline-smooth.lsp` | ;; pline-smooth.lsp - Smooth polylines with the Fit curve option
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
 |
| `scripts/pline-reverse.lsp` | ;; pline-reverse.lsp - Reverse the direction of curves
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
