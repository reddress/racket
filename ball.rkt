;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ball) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define-struct ball (x y delta-x delta-y))

(define (draw-and-clear a-ball)
  (and
   (draw-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 15 'red)
   (sleep-for-a-while DELAY)
   (clear-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 15 'red)))

(define (draw-balls-clear-once lob)
  (local ((define (draw-red a-ball)
            (draw-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 15 'red))
          (define (clear-ball a-ball)
            (clear-solid-disk (make-posn (ball-x a-ball) (ball-y a-ball)) 15 'red)))
    (and
     (andmap draw-red lob)
     (sleep-for-a-while DELAY)
     (andmap clear-ball lob))))

(define (move-ball a-ball)
  (make-ball (+ (ball-x a-ball) (ball-delta-x a-ball))
             (+ (ball-y a-ball) (ball-delta-y a-ball))
             (ball-delta-x a-ball)
             (+ 1 (ball-delta-y a-ball))))

(define WIDTH 500)
(define HEIGHT 500)
(define DELAY 0.03)

(define (out-of-bounds? a-ball)
  (not
   (and
    (<= 0 (ball-x a-ball) WIDTH)
    (<= 0 (ball-y a-ball) HEIGHT))))

(define (move-until-out a-ball)
  (cond
    ((out-of-bounds? a-ball) true)
    (else (and (draw-and-clear a-ball)
               (move-until-out (move-ball a-ball))))))

(define (in-bounds? ball)
  (not (out-of-bounds? ball)))

(define (move-balls.v0 lob)
  (cond
    ((empty? lob) true)
    (else (and (andmap draw-and-clear lob)
               (move-balls.v0 (map move-ball (filter in-bounds? lob)))))))

(define (move-balls-clear-once lob)
  (cond
    ((empty? lob) true)
    (else (and (draw-balls-clear-once lob)
               (move-balls-clear-once (map move-ball (filter in-bounds? lob)))))))

(define (move-balls lob)
  (cond
    ((empty? lob) true)
    (else (and (andmap draw-and-clear lob)
               (move-balls (move-all (remove-outs lob)))))))

(define (remove-outs lob)
  (cond
    ((empty? lob) empty)
    (else (if (in-bounds? (first lob))
              (cons (first lob) (remove-outs (rest lob)))
              (remove-outs (rest lob))))))

(define (move-all lob)
  (cond
    ((empty? lob) empty)
    (else (cons (move-ball (first lob)) (move-all (rest lob))))))

(start WIDTH HEIGHT)
(move-balls-clear-once (list (make-ball 300 300 5 3) (make-ball 400 400 -6 -18) (make-ball 0 0 5 5)))
(stop)
