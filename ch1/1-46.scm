(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define (average a b)
  (/ (+ a b) 2))

; 1.1.7 sqrt
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))
(sqrt 2)

; 1.3.3 fixed-point
(define (fixed-point f)
  (define (good-enough? guess)
    (< (abs (- guess (f guess))) 0.00001))
  (define (improve guess)
    (f guess))
  ((iterative-improve good-enough? improve) 1.0))
(fixed-point (lambda (x) (average x (/ 2 x))))

