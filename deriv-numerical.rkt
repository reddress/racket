;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname deriv-numerical) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (nderiv f)
  ;; provide approximate slope of the function f at point x
  (local ((define dx 0.00000001))
    (lambda (x)
      (/ (- (f (+ x dx))
            (f (- x dx)))
         (* 2 dx)))))

(define (my-f x)
  (+ (* 2 x x x) (* -3 x x) 5))

((nderiv my-f) 3)

((nderiv (nderiv my-f)) 3)

((nderiv (nderiv (nderiv my-f))) 3)

((nderiv (nderiv (nderiv (nderiv my-f)))) 3)

((nderiv sin) 0.3)