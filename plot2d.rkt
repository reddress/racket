#lang racket
(require plot)

(plot (list
       (axes)
       (function (lambda (x) (* x (- (* x x) 1 ))) -3 3)
       (function (lambda (x) 3))))
