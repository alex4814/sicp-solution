(define (square x) 
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (smallest x y z)
  (and (<= x y) (<= x z)))

(define (f x y z) 
  (cond ((smallest x y z) (sum-of-squares y z))
        ((smallest y x z) (sum-of-squares x z))
        (else (sum-of-squares x y))))

(f 3 2 4)
(f 0 0 2)
(f 5 8 0)

