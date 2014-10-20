;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname plot-to-bottom-right) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(start 300 300)

(define (pixel x y)
  (draw-solid-disk (make-posn x y) 1 'red))

;; (pixel 20 20)
;; (pixel 20 50)

(define (plot f)
  (local ((define x-vals (build-list 300 identity))
          (define (add-point x-lst)
            (cond ((empty? x-lst) true)
                  (else (and (pixel (first x-lst) (f (first x-lst)))
                             (add-point (rest x-lst)))))))
    (add-point x-vals)))

(define (some-fun x)
  (+ 150
     (* 99 (sin (/ x 20)))))

;; (plot some-fun)

(define (join lop)
  (cond ((empty? (rest lop)) true)
        (else (and (draw-solid-line (first lop) (second lop) 'blue)
                   (join (rest lop))))))

(define pt-1 (make-posn 10 10))
(define pt-2 (make-posn 120 120))
(define pt-3 (make-posn 200 120))

;; (join (list pt-1 pt-2 pt-3))

(define (mapcar f lst1 lst2)
  (local ((define (mapcar-accum f lst1 lst2 result)
            (cond ((empty? lst1) (reverse result))
                  (else
                   (mapcar-accum f (rest lst1)
                                 (rest lst2)
                                 (cons (f (first lst1) (first lst2)) result))))))
    (mapcar-accum f lst1 lst2 empty)))

(define (other-fun x)
  (+ 20 (* 0.02 (sqr (- x 90)))))

(join (map (lambda (x y) (make-posn x y)) (build-list 300 identity) 
           (map other-fun (build-list 300 identity))))

