Exercise 1.40
=============
Define a procedure `cubic` that can be used together with the `newtons-method` procedure in expressions of the form

```scheme
(newtons-method (cubic a b c) 1)
```

to approximate zeros of the cubic ![poly][1].

[1]: https://latex.codecogs.com/svg.image?x^3+ax^2+bx+c


References
----------
```scheme
;; Newton's method

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))
(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))


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
```


Solutions
---------
`cubic` with parameters *a*, *b*, *c* is actually a procedure that returns a procedure,

```scheme
(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a x x) (* b x) c)))
```

and use it together with `newtons-method`,

```scheme
1 ]=> (newtons-method (cubic 1 1 1) 1)                    

;Value: -.9999999999997796
```
