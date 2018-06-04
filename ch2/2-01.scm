(define (make-rat n d)
  (cond ((> (* n d) 0) (cons (abs n) (abs d)))
        ((> n 0) (cons (- n) (- d)))
        (else (cons n d))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define x (make-rat 8 -5))
(print-rat x)

(define x (make-rat -2 5))
(print-rat x)

(define x (make-rat -2 -5))
(print-rat x)

(define x (make-rat 8 5))
(print-rat x)

