Exercise 1.35
=============
Show that the golden ratio ![golden-ratio][2] (section 1.2.2) is a fixed point of the transformation *x -> 1 + 1/x*, and use this fact to compute ![golden-ratio][2] by means of the `fixed-point` procedure.

[1]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20%5Cvarphi=(1&plus;%5Csqrt%7B5%7D)/2
[2]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20%5Cvarphi


References
----------
The golden ratio is ![golden-ratio][1].

```scheme
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
According to the definition of fixed point, the golden ratio is the root of *f(x) = 1 + 1/x = x*.
Multiple the equation by *x* we could get *x + 1 = x^2*, which is the same equation of which golden ratio is a root.

```scheme
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
;Value: 1.6180327868852458
```
