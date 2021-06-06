Exercise 1.8
============
Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, 
then a better approximation is given by the value

    (x/y^2 + 2y) / 3

Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In section 1.3.4 we will see how to implement Newton's method in general as an abstraction of these square-root and cube-root procedures.)


Solutions
---------
```scheme
(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) 
     0.001))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x) x)))

(define (cube-root x)
  (cbrt-iter 1.0 x))
; 1 or 1.0 matters

(cube-root 0.001)
;Value: .10001409266436927

(cube-root 9)
;Value: 2.0801035255095734

(cube-root 1992212)
;Value: 125.82867359798139
```
