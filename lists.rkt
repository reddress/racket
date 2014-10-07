;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lists) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define lst (cons 10 (cons 20 (cons 5 empty))))
;
;(rest lst)  ; (cons 20 (cons 5 empty))
;(first (rest lst))  ; 20
;(rest (rest lst)) ; (cons 5 empty)
;(first (rest (rest lst)))  ; 5
;(rest (rest (rest lst))) ; empty


(define (add-up-3 lst)
  (+ (first lst)
     (first (rest lst))
     (first (rest (rest lst)))))

; (add-up-3 (cons 2 (cons 1 (cons 3 empty))))

(define (contains-doll? los)
  (cond
    ((empty? los) false)
    (else (cond
            ((symbol=? (first los) 'doll) true)
            (else (contains-doll? (rest los)))))))

; (contains-doll? (cons 'top (cons 'doll empty)))

(define (new-contains-doll? los)
  (cond
    ((empty? los) false)
    (else (or (symbol=? (first los) 'doll) (new-contains-doll? (rest los))))))

; (new-contains-doll? (cons 'apple (cons 'boy (cons 'doll empty))))

(define (nth los i)
  (cond
    ((empty? los) empty)
    ((= i 0) (first los))
    (else (nth (rest los) (- i 1)))))

(define (sum lon)
  (cond
    ((empty? lon) 0)
    (else (+ (first lon)  (sum (rest lon))))))
             
(define (dollar-store? lon)
  (cond
    ((empty? lon) true)
    (else (and (< (first lon) 1)
               (dollar-store? (rest lon))))))

;(not (dollar-store? (cons .75 (cons 1.9 (cons .25 empty)))))
;(dollar-store? (cons .15 (cons 0.05 (cons 1.25 empty))))
 
(define (count-items lon)
  (cond
    ((empty? lon) 0)
    (else (+ 1 (count-items (rest lon))))))

(define (average-price lon)
  (/ (sum lon)
     (count-items lon)))

(define (hours->wages lon)
  (cond
    ((empty? lon) empty)
    (else (cons (wage (first lon)) (hours->wages (rest lon))))))

(define (wage hour)
  (* 12 hour))

;(hours->wages (cons 20 (cons 15 (cons 1 empty))))

(define (hellos n)
  (cond 
    ((zero? n) empty)
    (else (cons 'hello (hellos (sub1 n))))))

;(hellos 3)

(define (depth dl)
  (cond
    ((symbol? dl) 0)
    (else (add1 (depth (first dl))))))

(define (random-string limit n)
  (cond
    ((zero? n) empty)
    (else (cons (random limit) (random-string limit (- n 1))))))

(define (! n)
  (cond
    ((zero? n) 1)
    (else (* n (! (sub1 n))))))

