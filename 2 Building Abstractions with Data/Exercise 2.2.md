Exercise 2.2
============
Consider the problem of representing line
segments in a plane. Each segment is represented as a pair
of points: a starting point and an ending point. Define a
constructor `make-segment` and selectors `start-segment` and
`end-segment` that define the representation of segments in
terms of points. Furthermore, a point can be represented
as a pair of numbers: the *x* coordinate and the *y* coordinate.
Accordingly, specify a constructor `make-point` and
selectors `x-point` and `y-point` that define this representation.
Finally, using your selectors and constructors, define a
procedure `midpoint-segment` that takes a line segment as
argument and returns its midpoint (the point whose coordinates
are the average of the coordinates of the endpoints).
To try your procedures, you’ll need a way to print points:

```scheme
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
```


Solutions
---------
```scheme
(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment s e)
  (cons s e))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (midpoint-segment s)
  (let ((sp (start-segment s))
        (ep (end-segment s)))
    (make-point (average (x-point sp) (x-point ep))
                (average (y-point sp) (y-point ep)))))

(define a (make-point 2 3))
(define b (make-point 5 10))
(define s (make-segment a b))
(print-point (midpoint-segment s))

; 1 ]=>  (midpoint-segment s))
; (7/2,13/2)
```
