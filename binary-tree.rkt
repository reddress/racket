;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname binary-tree) (read-case-sensitive #t) (teachpacks ((lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.rkt" "teachpack" "htdp")))))
(define-struct node (n s left right))

(define (contains-bt n bt)
  (cond 
    ((node? bt) 
     (cond
       ((= (node-n bt) n) true)
       (else (or (contains-bt n (node-left bt))
                 (contains-bt n (node-right bt))))))
    (else false)))
                           
(define my-tree (make-node 9 'a (make-node 4 'b false false)
                             (make-node 19 'c false false)))

(define (inorder bt)
  (cond
    ((boolean? bt) empty)
    (else
     (append (inorder (node-left bt)) (list (node-n bt)) (inorder (node-right bt))))))

(define tree-a (make-node 63 'root
                          (make-node 29 'left-1
                                     (make-node 15 'left-2
                                                (make-node 10 'leaf-left-2
                                                           false false)
                                                (make-node 24 'leaf-left-2
                                                           false false))
                                     false)
                          (make-node 89 'right-1
                                     (make-node 77 'right-left
                                                false false)
                                     (make-node 95 'right-right
                                                false
                                                (make-node 99 'r-r-r
                                                           false false)))))



(define tree-4 (make-node 3 'root
                          (make-node 1 'left
                                     false
                                     (make-node 2 'l-r
                                                false false))
                          (make-node 4 'r-r
                                     false false)))

(define (create-bst b n s)
  (cond
    ((boolean? b) (make-node n s false false))
    (else
     (cond
       ((< n (node-n b))
        (make-node (node-n b)
                   (node-s b)
                   (create-bst (node-left b) n s)
                   (node-right b)))
       ((> n (node-n b))
        (make-node (node-n b)
                   (node-s b)
                   (node-left b)
                   (create-bst (node-right b) n s)))
       (else (error 'create-bst "number already in bst"))))))