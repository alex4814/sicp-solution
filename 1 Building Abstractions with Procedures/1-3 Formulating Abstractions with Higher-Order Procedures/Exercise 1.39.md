Exercise 1.39
=============
A continued fraction representation of the tangent function was published in 1770 by the German mathematician J.H. Lambert:

![tangent-cont][1]

where *x* is in radians. Define a procedure `(tan-cf x k)` that computes an approximation to the tangent function based on Lambert's formula. *k* specifies the number of terms to compute, as in **exercise 1.37**.


[1]: https://latex.codecogs.com/svg.image?\text{tan}x=\frac{x}{1-\frac{x^2}{3-\frac{x^2}{5-\cdots}}}


References
----------
```scheme
(define (cont-frac n d k)
  (define (iter i result)
    (if (< i 1)
        result
        (iter (- i 1) (/ (n i) (+ result (d i))))))
  (iter k 0))
```


Solutions
---------
Analogous to procedure defined in **Exercise 1.37**, we calculate it backwords,

```scheme
(define (tan-cf x k)
  (define (tan-i x i k)
    (let ((n (if (= i 1) x (square x)))
          (d (- (* 2 i) 1.0)))
      (if (> i k)
          0
          (/ n (- d (tan-i x (+ i 1) k))))))
  (tan-i x 1 k))

(tan-cf 1.25 50)
;Value: 3.009569673862831
```
