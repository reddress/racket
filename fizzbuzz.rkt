;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname fizzbuzz) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define (fizzify n)
  (cond
    ((= (remainder n 15) 0) 'fizzbuzz)
    ((= (remainder n 5) 0) 'buzz)
    ((= (remainder n 3) 0)'fizz)
    (else n)))

(define (divis-by x n)
  (= (remainder x n) 0))

(define (fizz-branch n)
  (cond
    ((divis-by n 3) (string-append "FIZZ"
                                   (cond ((divis-by n 5) "BUZZ")
                                         (else ""))))          
    ((divis-by n 5) "BUZZ")
    (else n)))
