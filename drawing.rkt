;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname drawing) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(start 300 300)

(define (draw-polygon a-poly)
  (connect-dots (cons (last a-poly) a-poly)))

(define (connect-dots a-poly)
  (cond
    ((empty? (rest a-poly)) true)
    (else (and (draw-solid-line (first a-poly) (second a-poly) 'red)
               (connect-dots (rest a-poly))))))

(define (last a-poly)
  (cond
    ((empty? (rest a-poly)) (first a-poly))
    (else (last (rest a-poly)))))

(draw-polygon (list (make-posn 10 10)
                    (make-posn 20 10)
                    (make-posn 20 20)
                    ))

;; to close canvas (stop)