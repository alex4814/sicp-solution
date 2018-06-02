(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (average a b)
  (/ (+ a b) 2))

(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x)
        (f ((repeated f (- n 1)) x)))))

(define (fixed-point f fguess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try fguess))
(define tolerance 0.00001)

; 2-th root, 1 time average-damp
; 3-th root, 1 time
; 4-th root, 2/3 times
(define (fourth-rt x)
  (fixed-point 
    ((repeated average-damp 3) (lambda (y) (/ x (* y y y)))) 
    1.0))
(fourth-rt 2)

; 5-th root, 2/3 times
(define (fifth-rt x)
  (fixed-point 
    ((repeated average-damp 3) (lambda (y) (/ x (* y y y y)))) 
    1.0))
(fifth-rt 2)

; 6-th root, 1/2/3 times
(define (sixth-rt x)
  (fixed-point 
    ((repeated average-damp 3) (lambda (y) (/ x (* y y y y y)))) 
    1.0))
(sixth-rt 2)

; 7-th root, 1/2/3 times
(define (seventh-rt x)
  (fixed-point 
    ((repeated average-damp 3) (lambda (y) (/ x (* y y y y y y)))) 
    1.0))
(seventh-rt 2)

; 8-th root, 1/3 times
(define (eightth-rt x)
  (fixed-point 
    ((repeated average-damp 1) (lambda (y) (/ x (* y y y y y y y)))) 
    1.0))
(eightth-rt 2)

; 9-th root, 1/3/4/5 times
(define (ninth-rt x)
  (fixed-point 
    ((repeated average-damp 5) (lambda (y) (/ x (* y y y y y y y y)))) 
    1.0))
(ninth-rt 2)

; Only 4th and 5th needs twice average-damps
(define (nth-rt x n)
  (fixed-point
    ((repeated average-damp (if (or (= n 4) (= n 5)) 2 1)) (f x n))
    1.0))
(define (f x n)
  (lambda (y) (/ x (pow y (- n 1)))))
(define (pow x n)
  (define (iter a result)
    (if (= a n)
        result
        (iter (+ a 1) (* result x))))
  (iter 0 1))

(nth-rt 2 1)
(nth-rt 2 2)
(nth-rt 2 3)
(nth-rt 2 4)
(nth-rt 2 5)
(nth-rt 2 6)
(nth-rt 2 7)
(nth-rt 2 8)
(nth-rt 2 9)
(nth-rt 2 10)

