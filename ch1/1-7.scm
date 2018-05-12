(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (good-enough2? guess x)
  (< (abs (- guess (improve guess x))) 0.001))

(define (sqrt-iter2 guess x)
  (if (good-enough2? guess x)
      guess
      (sqrt-iter2 (improve guess x) x)))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))


(sqrt2 0.00000001)
(sqrt 0.00000001)

(sqrt2 1000000000000001)
(sqrt 1000000000000001)

