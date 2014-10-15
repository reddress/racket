;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname series) (read-case-sensitive #t) (teachpacks ((lib "gui.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.rkt" "teachpack" "htdp")))))
(define (series n a-term)
  (cond
    ((= n 0) (a-term n))
    (else (+ (a-term n)
             (series (- n 1) a-term)))))

(define (e-power x)
  (local ((define (e-taylor i)
            (/ (expt x i) (! i)))
          (define (! n)
            (cond ((= n 0) 1)
                  (else (* n (! (sub1 n)))))))
    (series 10 e-taylor)))

(e-power 5)