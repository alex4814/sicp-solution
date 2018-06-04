; Segment
(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))
; --- Barrier ---
(define (vec s)
  (make-vec
    (- (x-point (end-segment s)) (x-point (start-segment s)))
    (- (y-point (end-segment s)) (y-point (start-segment s)))))
(define (length-segment s)
  (let ((v (vec s)))
       (length-vec v)))

; Point
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))
; --- Barrier ---
(define (length-point p)
  (sqrt (+ (square (x-point p)) (square (y-point p)))))

; Vector (alias of point)
(define make-vec make-point)
(define x-vec x-point)
(define y-vec y-point)
(define length-vec length-point)

; Representation 1
; Assume inputs are valid to form a rectange 
; and arranged in counter-clockwise direction
(define (make-rect p1 p2 p3 p4)
  (cons (cons p1 p2) (cons p3 p4)))
(define (a-segment r)
  (make-segment (cdr (car r)) (car (car r))))
(define (b-segment r)
  (make-segment (cdr (car r)) (cdr (car r))))

; Representation 2
; Assume axis-aligned rectange with diagonal points
; and p1.x < p2.x and p1.y > p2.y
(define (make-rect p1 p2)
  (cons p1 p2))
(define (ll-point r) ; lower-left point
  (make-point 
    (min (car (car r)) (car (cdr r)))
    (min (cdr (car r)) (cdr (cdr r)))))
(define (a-segment r)
  (make-segment (ll-point r) (car r)))
(define (b-segment r)
  (make-segment (ll-point r) (cdr r)))
; --- Barrier ---
(define (perimeter r)
  (* (+ (length-segment (a-segment r)) (length-segment (b-segment r))) 2))
(define (area r)
  (* (length-segment (a-segment r)) (length-segment (b-segment r))))

