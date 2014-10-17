;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname accumulators) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;(define (invert alox)
;  (cond 
;    ((empty? alox) empty)
;    (else (make-last-item (first alox) (invert (rest alox))))))
;
;(define (make-last-item an-x alox)
;  (cond
;    ((empty? alox) (list an-x))
;    (else (cons (first alox) (make-last-item an-x (rest alox))))))

(define (invert alox)
  (local ((define (rev alox accum)
            (cond
              ((empty? alox) accum)
              (else
               (rev (rest alox) (cons (first alox) accum))
               ))))
    (rev alox empty)))

(define (sum-recur lst)
  (cond ((empty? lst) 0)
        (else (+ (first lst) (sum-recur (rest lst))))))

(define (sum-accum lst)
  (local ((define (sum-step lst-b accum)
            (cond ((empty? lst-b) accum)
                  (else (sum-step (rest lst-b) (+ accum (first lst-b)))))))
    (sum-step lst 0)))

(define (g-series n)
  (cond
    ((zero? n) empty)
    (else (cons (expt -0.99 n) (g-series (sub1 n))))))

(define (! n0)
  (local ((define (!-a n accum)
            (cond ((zero? n) accum)
                  (else (!-a (sub1 n) (* n accum))))))
    (!-a n0 1)))

(define (!-rec n0)
  (cond ((zero? n0) 1)
        (else (* n0 (!-rec (- n0 1))))))