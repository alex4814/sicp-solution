Exercise 1.46
=============
Several of the numerical methods described in this chapter are instances of an extremely general computational strategy known as *iterative improvement*. Iterative improvement says that, to compute something, we start with an initial guess for the answer, test if the guess is good enough, and otherwise improve the guess and continue the process using the improved guess as the new guess. 

Write a procedure `iterative-improve` that takes two procedures as arguments: a method for telling whether a guess is good enough and a method for improving a guess. `Iterative-improve` should return as its value a procedure that takes a guess as argument and keeps improving the guess until it is good enough. Rewrite the `sqrt` procedure of section 1.1.7 and the `fixed-point` procedure of section 1.3.3 in terms of `iterative-improve`.


References
----------
```scheme
(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))
```

Solutions
---------
Using a top-down approach, we write

```scheme
(define (iterative-improve good-enough? improve)
  (define (improve-until-good-enough guess)
    (if (good-enough? guess)
        guess
        (improve-until-good-enough (improve guess))))
  improve-until-good-enough
)
```

and rewrite the `sqrt` using it,

```scheme
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0)
)

(sqrt 2)
;Value: 1.4142156862745097
```

also rewrite `fixed-point`,

```scheme
(define (fixed-point f)
  (define (improve guess)
    ((average-damp f) guess))
  (define (good-enough? guess)
    (< (abs (- guess (improve guess))) 0.00001))
  ((iterative-improve good-enough? improve) 1.0)
)

(fixed-point (lambda (x) (/ 2 x)))
;Value: 1.4142156862745097
```