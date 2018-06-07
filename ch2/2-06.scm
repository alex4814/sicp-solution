(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
 (lambda (f) (lambda (x) (f ((n f) x)))))

;one
;(add-1 zero) =>
;(lambda (f) (lambda (x) (f ((zero f) x)))) =>
;(lambda (f) (lambda (x) (f ((lambda (x) x) x)))) =>
;(lambda (f) (lambda (x) (f x)))

;two
;(add-1 one) =>
;(lambda (f) (lambda (x) (f ((one f) x)))) =>
;(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)))) =>
;(lambda (f) (lambda (x) (f (f x))))

