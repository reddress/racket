;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname card-hand) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define-struct hand (rank suit next))

(define (create-hand r s)
  (make-hand r s empty))

(define hand0 (create-hand 13 's))

hand0

(define hand1 (make-hand 9 'h hand0))

hand1