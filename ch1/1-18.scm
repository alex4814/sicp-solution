(define (fast-mul a b)
  (fast-mul-iter 0 a b))
(define (fast-mul-iter n a b)
  (cond ((= b 0) n)
        ((even? b) (fast-mul-iter n (double a) (halve b)))
        (else (fast-mul-iter (+ n a) a (- b 1)))))
(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))

(fast-mul 3 5)
(fast-mul 102 38)

