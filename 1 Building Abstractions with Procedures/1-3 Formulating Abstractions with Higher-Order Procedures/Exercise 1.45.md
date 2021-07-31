Exercise 1.45
=============
We saw in section 1.3.3 that attempting to compute square roots by naively finding a fixed point of *y -> x/y* does not converge, and that this can be fixed by average damping. The same method works for finding cube roots as fixed points of the average-damped *y -> x/y^2*. Unfortunately, the process does not work for fourth roots -- a single average damp is not enough to make a fixed-point search for *y -> x/y^3* converge. On the other hand, if we average damp twice (i.e., use the average damp of the average damp of *y -> x/y^3*) the fixed-point search does converge. 

Do some experiments to determine how many average damps are required to compute *n*-th roots as a fixed-point search based upon repeated average damping of *y -> x/y^(n-1)*. Use this to implement a simple procedure for computing n-th roots using `fixed-point`, `average-damp`, and the `repeated` procedure of exercise 1.43. Assume that any arithmetic operations you need are available as primitives.


References
----------
```scheme
;;;SECTION 1.1.7

(define (average x y)
  (/ (+ x y) 2))

;;;SECTION 1.3.4

(define (average-damp f)
  (lambda (x) (average x (f x))))

;; Fixed points

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;;;Exersice 1.42

(define (compose f g)
  (lambda (x) (f (g x))))

;;;Exercise 1.43

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))
```


Solutions
---------
Firsr, we define a general method to compute *n*-th root with repeated average-damping *m* times.

```scheme
(define (repeated-nth-root x n m)
  (let ((f (lambda (y) (/ x (expt y (- n 1))))))
    (fixed-point ((repeated average-damp m) f) 1.0)))
```

and use this to do some experiments,

```scheme
(repeated-nth-root 2 2 1)   ;; ;Value: 1.4142135623746899

(repeated-nth-root 2 3 1)   ;; ;Value: 1.259923236422975

(repeated-nth-root 2 4 1)   ;; Do not converge
(repeated-nth-root 2 4 2)   ;; ;Value: 1.189207115002721

(repeated-nth-root 2 5 1)   ;; Do not converge
(repeated-nth-root 2 5 2)   ;; ;Value: 1.1486967244204176

(repeated-nth-root 2 6 1)   ;; ;Value: 1.1224584896267153

(repeated-nth-root 2 7 1)   ;; ;Value: 1.1040826937788428

(repeated-nth-root 2 8 1)   ;; ;Value: 1.0905043471721103

(repeated-nth-root 2 9 1)   ;; ;Value: 1.0800576491909106

(repeated-nth-root 2 10 1)  ;; ;Value: 1.071771304877285

(repeated-nth-root 2 11 1)  ;; ;Value: 1.06504305500914
```

Applying average damping at most 2 times seems sufficient, and take one argument out to get
a simpler version of `repeated-nth-root`.

```scheme
(define (repeated-nth-root x n)
  (let ((f (lambda (y) (/ x (expt y (- n 1))))))
    (fixed-point ((repeated average-damp 2) f) 1.0)))
```
