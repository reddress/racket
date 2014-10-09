;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname arrangements) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define (arrangements a-word)
  (cond
    ((empty? a-word) (cons empty empty))
    (else (insert-everywhere (first a-word)
                             (arrangements (rest a-word))))))

(define (insert-everywhere letter words)
  (cond
    ;;((empty? words) (list (cons letter empty)))
    ((empty? words) empty)
    (else (append (insert-into letter empty (first words) empty)
                  (insert-everywhere letter (rest words))))))

(define (insert-into letter begin word result)
  (cond
    ((empty? word) (cons (append begin (cons letter empty)) result))
    (else (cons (append begin (cons letter empty) word) 
                (insert-into letter (append begin (cons (first word) empty)) (rest word) result)))))

(arrangements (list 'e 'd))

