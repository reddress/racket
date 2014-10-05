#lang web-server/insta

(define (start request)
  (response/xexpr
   '(html
     (head (title "Racket roolz"))
     (body (h1 "Under constr")))))

