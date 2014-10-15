;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname quicksort) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define (quick-sort alon)
  (cond
    ((empty? alon) empty)
    (else (append (quick-sort (filter (lambda (x) (<= x (first alon))) (rest alon))) 
                  (list (first alon))
                  (quick-sort (filter (lambda (x) (> x (first alon))) (rest alon)))))))

(quick-sort '(11 3 2 4 9 5 5))