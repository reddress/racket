;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname gcd) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define (gcd-structural n m)
  (local ((define (first-divisor-<= i)
            (cond
              ((= i 1) 1)
              (else (cond
                      ((and (= (remainder n i) 0)
                            (= (remainder m i) 0))
                       i)
                      (else
                       (first-divisor-<= (- i 1))))))))
    (first-divisor-<= (min m n))))
                       
;; insight: (gcd larger smaller) = (gcd smaller (remainder larger smaller))

(define (gcd-insight a b)
  (local ((define (process larger smaller)
            (cond ((zero? smaller) larger)
                  (else (process smaller (remainder larger smaller))))))
    (cond ((> a b) (process a b))
          (else (process b a)))))

(gcd-insight 90 135)