;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname parent-tree) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define-struct parent (children name date eyes))

(define Gustav (make-parent empty 'Gustav 1988 'brown))

; (make-parent (list Gustav) 'Fred 1950 'yellow)

(define Fred&Eva (list Gustav))

(define Adam (make-parent empty 'Adam 1950 'yellow))
(define Dave (make-parent empty 'Dave 1955 'black))
(define Eva (make-parent Fred&Eva 'Eva 1965 'blue))
(define Fred (make-parent Fred&Eva 'Fred 1966 'pink))

(define Carl&Bettina (list Adam Dave Eva))
(define Carl (make-parent Carl&Bettina 'Carl 1926 'green))
(define Bettina (make-parent Carl&Bettina 'Bettina 1926 'green))

(define (blue-eyed-descendant? a-parent)
  (cond
    ((symbol=? (parent-eyes a-parent) 'blue) true)
    (else
     (contains-blue-eyed (parent-children a-parent)))))

(define (contains-blue-eyed lop)
  (cond
    ((empty? lop) false)
    ((blue-eyed-descendant? (first lop)) true)
    (else
     (contains-blue-eyed (rest lop)))))
