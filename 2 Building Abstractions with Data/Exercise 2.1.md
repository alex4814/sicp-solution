Exercise 2.1
============
Define a better version of `make-rat` that handles both positive and negative arguments.
`make-rat` should normalize the sign so that if the rational number is positive,
both the numerator and denominator are positive, and if the rational number is negative,
only the numerator is negative.


Solutions
---------
```scheme
(define (make-rat n d)
  (cond ((and (> n 0) (< d 0)) (cons (- n) (- d)))
        ((and (< n 0) (< d 0)) (cons (- n) (- d)))
        (else (cons n d))))
```
