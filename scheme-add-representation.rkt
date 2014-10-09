;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname scheme-add-representation) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define-struct add (left right))
(define-struct mul (left right))
(define-struct app (name body))
(define-struct def (name arg body))

(define (numeric? scm-repr)
  (number? scm-repr))

(define (evaluate-expression e)
  (cond
    ((number? e) e)
    ((add? e) (+ (evaluate-expression (add-left e))
                 (evaluate-expression (add-right e))))))

(evaluate-expression (make-add (make-add 1 2) 3))

(define (subst v n e)
  (cond
    ((empty? e) empty)
    ((number? e) e)
    ((symbol? e) 
     (cond
       ((symbol=? e v) n)
       (else e)))
    ((add? e)
     (make-add (subst v n (add-left e)) (subst v n (add-right e))))))
