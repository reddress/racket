;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname spreadsheet) (read-case-sensitive #t) (teachpacks ((lib "gui.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "gui.rkt" "teachpack" "htdp")))))
(define-struct cell (name content))

(define-struct content (type value))

(define a1 (make-cell 'a1 (make-content 'number 5)))
(define a2 (make-cell 'a2 (make-content 'formula (list '= a1))))
(define a3 (make-cell 'a3 (make-content 'formula (list '+ a2 a1))))
(define a4 (make-cell 'a4 (make-content 'number 10)))
(define a6 (make-cell 'a6 (make-content 'formula (list '+ a1 a2))))
(define a5 (make-cell 'a5 (make-content 'formula (list '+ a6 a4))))  

(define (cell-value a-cell)
  (cond ((symbol=? (content-type (cell-content a-cell)) 'number)
         (content-value (cell-content a-cell)))
        ((symbol=? (content-type (cell-content a-cell)) 'formula)
         (local ((define formula-type (first (content-value (cell-content a-cell)))))
           (cond ((symbol=? '= formula-type) (cell-value (second (content-value (cell-content a-cell)))))
                 ((symbol=? '+ formula-type) (+ (cell-value (second (content-value (cell-content a-cell))))
                                                (cell-value (third (content-value (cell-content a-cell)))))))))))

(cell-value a5)