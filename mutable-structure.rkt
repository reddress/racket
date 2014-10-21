;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname mutable-structure) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define (fm-make-posn x0 y0)
  (local ((define x x0)
          (define y y0)
          (define (service-manager msg)
            (cond
              ((symbol=? msg 'x) x)
              ((symbol=? msg 'y) y)
              ((symbol=? msg 'set-x) (lambda (x-new) (set! x x-new)))
              ((symbol=? msg 'set-y) (lambda (y-new) (set! y y-new)))
              (else (error 'posn "Unknown command")))))
    service-manager))

(define (fm-posn-x p)
  (p 'x))

(define (fm-set-posn-x! p new-value)
  ((p 'set-x) new-value))

(define p (fm-make-posn 1 2))
;; = service-manager (function)
(define q p)
(begin
  (fm-set-posn-x! p 100)
  (list (fm-posn-x q)))

(define v (vector 1 2 3 4))
(define w v)

(begin
  (vector-set! v 0 100)
  w)

(define (make-my-3-list a b c)
  (local ((define the-head a)
          (define the-list (cons the-head (cons b (cons c empty))))
          (define (service-manager msg)
            (cond ((symbol=? 'show msg) the-list)
                  ((symbol=? 'show-head msg) the-head)
                  ((symbol=? 'change-head msg) (lambda (new-head)
                                                 (begin 
                                                   (set! the-head new-head)
                                                   (set! the-list (cons the-head (cons b (cons c empty)))))))
                  (else (error 'make-my-3-list "unknown command")))))
    service-manager))

(define ml (make-my-3-list 1 2 3))

(define ql ml)

(begin
  ((ql 'change-head) 99)
  (ml 'show))
