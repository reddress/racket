;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname merge) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define (merge stack-a stack-b)
  (local ((define (iter stack-a stack-b destination)
            (cond ((and (empty? stack-a) (empty? stack-b)) (reverse destination))
                  ((empty? stack-a) (iter stack-a (rest stack-b) (cons (first stack-b) destination)))
                  ((empty? stack-b) (iter (rest stack-a) stack-b (cons (first stack-a) destination)))
                  (else (cond ((< (first stack-a) (first stack-b))
                               (iter (rest stack-a) stack-b (cons (first stack-a) destination)))
                              (else
                               (iter stack-a (rest stack-b) (cons (first stack-b) destination))))))))
    (iter stack-a stack-b empty)))

(merge '(1 3 100 200) (merge '(2 4 6) '(1 3 5 7)))

(define (merge-sort-2^n lst)  ;; only works for lists with length 2^n
  (cond ((empty? (rest lst)) (list (first lst)))
        (else (merge (merge-sort-2^n (odd-half lst)) (merge-sort-2^n (even-half lst))))))

(define (odd-half lst)
  (cond ((or (empty? lst) (empty? (rest lst))) empty)
        (else
         (cons (first lst) (odd-half (rest (rest lst)))))))

(define (even-half lst)
  (cond ((or (empty? lst) (empty? (rest lst))) empty)
        (else
         (cons (first (rest lst)) (even-half (rest (rest lst)))))))

(merge-sort-2^n '(3 7 1 2 6 5 8 4))