(define (report next n)
  (newline)
	(display n)
	(display " times")
	next)
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
	  (< (abs (- v1 v2)) tolerance))
	(define (try guess count)
	  (let ((next (f guess)))
		  (if (close-enough? guess next)
					(report next count)
					(try next (+ count 1)))))
	(try first-guess 0))

(define (average a b)
  (/ (+ a b) 2))
(define (f x)
  (/ (log 1000) (log x)))
(define (g x)
  (average x (f x)))

(fixed-point f 2.0)
(fixed-point g 2.0)

