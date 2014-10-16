;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname board-queens) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define (build-board n f)
  (build-list n (lambda (i) (build-list n (lambda (j) (f i j))))))

(define (board-ref a-board i j)
  (local ((define (extract-from n l)
            (cond
              ((zero? n) (first l))
              (else (extract-from (- n 1) (rest l))))))
    (extract-from j (extract-from i a-board))))

(define (board-dim a-board) (length a-board))

(define (threatened? qp p)
  (or (= (posn-x qp) (posn-x p))
      (= (posn-y qp) (posn-y p))
      (= (- (posn-x qp) (posn-y qp))
         (- (posn-x p) (posn-y p)))
      (= (+ (posn-x qp) (posn-y qp))
         (+ (posn-x p) (posn-y p)))))

(define (placement a-board n)
  (cond
    ((zero? n) a-board)
    (else
     (local ((define possible-places (find-open-spots a-board)))
       (placement/list possible-places a-board (sub1 n))))))

(define (placement/list possible a-board n)
  (cond
    ((empty? possible) false)
    (else (local ((define c (placement (add-queen a-board (first possible)) n)))
            (cond 
              ((boolean? c) (placement/list (rest possible) a-board n))
              (else c))))))

(define (add-queen board p)
  (build-board (board-dim board)
               (lambda (x y)
                 (or (threatened? (make-posn x y) p) (board-ref board x y)))))

(define (find-open-spots board)
  (local ((define (traverse-board n)
            (local ((define (traverse-row j)
                      (cond
                        ((zero? j) empty)
                        (else (cond
                                ((not (board-ref board (sub1 n) (sub1 j)))
                                 (cons (make-posn (sub1 n) (sub1 j))
                                       (traverse-row (sub1 j))))
                                (else (traverse-row (sub1 j))))))))
              (cond
                ((zero? n) empty)
                (else (append (traverse-row (board-dim board))
                              (traverse-board (sub1 n))))))))
    (traverse-board (board-dim board))))

(define (nxn-board-0-0 n)
  (local ((define first-queen (make-posn 0 0)))
    (build-board n (lambda (i j) (threatened? (make-posn i j) first-queen)))))

