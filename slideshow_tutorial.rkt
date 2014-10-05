#lang slideshow

(define (checker p1 p2)
  (let ((p12 (hc-append p1 p2))
        (p21 (hc-append p2 p1)))
    (vc-append p12 p21)))

(define (series mk)
  (hc-append 40 (mk 5) (mk 10) (mk 20)))

(require slideshow/code)
(code (circle 10))