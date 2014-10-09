;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sort) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
;; insertion sort

(define (sort alon)
  (cond
    ((empty? alon) empty)
    (else (insert (first alon) (sort (rest alon))))))

(define (insert n alon) ; assume alon is already sorted
  (cond
    ((empty? alon) (cons n empty))
    (else (cond
            ((< n (first alon)) (cons (first alon) (insert n (rest alon))))
            ((>= n (first alon)) (cons n (cons (first alon) (rest alon))))))))
;; (cons (first alon) (rest alon)) same as alon

(define (their-sort alon)
  (cond
    ((empty? alon) empty)
    ((cons? alon) (their-insert (first alon) (their-sort (rest alon))))))

(define (their-insert n alon)
  (cond
    ((empty? alon) (cons n empty))
    (else (cond
            ((>= n (first alon)) (cons n alon))
            ((< n (first alon)) (cons (first alon) (their-insert n (rest alon))))))))