(define (make-interval x y)
  (cons x y))
(define (lower-bound i)
  (car i))
(define (upper-bound i)
  (cdr i))

(define (center i)
  (/ (+ (upper-bound i) (lower-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-interval (* c (- 1.0 p)) (* c (+ 1.0 p))))
(define (percent i)
  (/ (width i) (center i)))

(define (mul-interval x y)
  (make-center-percent 
	  (* (center x) (center y))
		(+ (percent x) (percent y))))

