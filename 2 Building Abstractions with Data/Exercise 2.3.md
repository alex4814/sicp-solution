Exercise 2.3
============
Implement a representation for rectangles in a plane.
(Hint: You may want to make use of **Exercise 2.2**.)
In terms of your constructors and selectors, create procedures
that compute the perimeter and the area of a given rectangle.
Now implement a different representation for rectangles.
Can you design your system with suitable abstraction
barriers, so that the same perimeter and area procedures
will work using either representation?


References
----------
Borrow definitions of `segment`, with a `length-segment` procedure

```scheme
(define (length-segment s)
  (let ((dx (- (x-point (start-segment s) (x-point (end-segment s)))))
        (dy (- (y-point (start-segment s) (y-point (end-segment s))))))
    (sqrt (+ (square dx) (square dy)))))
```


Solutions
---------
Regardless of the way to implement rectangle,
we design it with these public interfaces to proivde certain barriers:

- `one-side`: returns a segment of the rectangle
- `other-side`: returns another segment that is not parallel to one returned from `one-side`

```scheme
(define (perimeter r)
  (* 2 (+ (length-segment (one-side r))
          (length-segment (other-side r)))))

(define (area r)
  (* (length-segment (one-side r))
     (length-segment (other-side r))))
```

First implementation of rectange,

```scheme
; p0 is a common point that segment p0-p1 is perpendicular to segment p0-p2.
(define (make-rectangle p0 p1 p2)
  (cons p0 (cons p1 p2)))

(define (one-side r)
  (make-segment (car r)
                (car (cdr r))))

(define (other-side r)
  (make-segment (car r)
                (cdr (cdr r))))
```

Second,

```scheme
; s1 and s2 are perpendicular segments of the rectangle.
(define (make-rectangle s1 s2)
  (cons s1 s2))

(define (one-side r)
  (car r))

(define (other-side r)
  (cdr r))
```
