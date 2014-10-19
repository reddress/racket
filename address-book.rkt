;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname address-book) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define ADDR-BOOK
  (list (list 'Joe 1)
        (list 'Kim 2)
        ))

(define (lookup name book)
  (cond ((empty? book) false)
        (else (cond ((symbol=? name (first (first book))) (second (first book)))
                    (else (lookup name (rest book)))))))
