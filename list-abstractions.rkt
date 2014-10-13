;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname list-abstractions) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define (fold f base lst)
  (cond
    ((empty? lst) base)
    (else (f (first lst)
             (fold f base (rest lst))))))

(define (sum-from-fold alon)
  (fold + 0 alon))

(define (my-append lst1 lst2)
;; (local ((define (move-last elt1 lst2)
;;            (cond
;;              ((empty? lst1) lst2)
;;              (else (cons (first lst1) (move-last (rest lst1) lst2))))))
   ;;         )))
    (fold cons lst2 lst1))

;; (my-append '(1) '(6 7))

(define (my-map f lst)
  ...)

(define (map-soln f l)
  (local ((define (cmb fst rst)
            (cons (f fst) rst)))
    (fold cmb empty l)))

(define (build-up lst)
  (cond
    ((empty? lst) empty)
    (else (cons lst (build-up (rest lst))))))

(define (natural-f f base step n)
  (cond
    ((zero? n) base)
    (else (f step
             (natural-f f base step (- n 1))))))

(define (copy-with-natural n obj)
  (natural-f cons empty obj n))

(define (n-adder-with-natural n x)
  (natural-f + x 1 n))

