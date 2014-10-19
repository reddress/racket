;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname inexact-struct) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define-struct inex (mantissa sign exponent))

(define (create-inex m s e)
  (cond
    ((and (<= 0 m 99) (<= 0 e 99) (or (= s 1) (= s -1)))
     (make-inex m s e))
    (else
     (error 'make-inex "conditions not met"))))

(define (inex->number an-inex)
  (* (inex-mantissa an-inex)
     (expt 10 (* (inex-sign an-inex) (inex-exponent an-inex)))))

(define poor-mans-pi (create-inex 31 -1 1))

(define JANUS
  (list #i31
        #i2e+34
        #i-1.2345678901235e+80
        #i2749
        #i-2939234
        #i-2e+33
        #i3.2e+270
        #i17
        #i-2.4e+270
        #i4.2344294738446e+170
        #i1
        #i-8e+269
        #i0
        #i99)) ;; e270 values discard smaller values, so only the
;; first or last values are returned as the result

(define (sum lst)
  (cond ((empty? lst) 0)
        (else (+ (first lst) (sum (rest lst))))))

(sum JANUS)
(sum (reverse JANUS))