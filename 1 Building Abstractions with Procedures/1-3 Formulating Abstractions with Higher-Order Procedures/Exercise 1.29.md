Exercise 1.29
=============
Simpson's Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson's Rule, the integral of a function *f* between *a* and *b* is approximated as

![simpson's-rule][1]

where ![h][2], for some even integer *n*, and ![y_k][3]. (Increasing n increases the accuracy of the approximation.)

Define a procedure that takes as arguments *f*, *a*, *b*, and *n* and returns the value of the integral, computed using Simpson's Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the `integral` procedure shown above.

[1]: https://latex.codecogs.com/svg.image?\frac{h}{3}(y_0&plus;4y_1&plus;2y_2&plus;4y_3&plus;2y_4&plus;\cdots&space;&plus;2y_{n-2}&plus;4y_{n-1}&plus;y_n)
[2]: https://latex.codecogs.com/svg.image?\inline&space;h=(b-a)/n
[3]: https://latex.codecogs.com/svg.image?\inline&space;y_k=f(a+kh)


Reference
---------
```scheme
(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
```


Solutions
---------
```scheme
(define (simpson-integral f a b n)
  (define h (/ (- b a) n 1.0))        ;; 1.0 to tell scheme use floating calculation
  (define (c i)
    (cond ((= i 0) 1)
          ((= i n) 1)
          ((even? i) 2)
          (else 4)))
  (define (y i)
    (f (+ a (* i h))))
  (define (term i)
    (* (c i) (y i) (/ h 3)))
  (define (inc n) (+ n 1))
  (sum term 0 inc n))
```

Use the `simpson-integral` to integrate cube between 0 and 1 (with n=100 and n=1000),

```scheme
1 ]=> (simpson-integral cube 0 1 100)

;Value: .2500000000000001

1 ]=> (simpson-integral cube 0 1 1000)

;Value: .25000000000000006
```

and it is indeed more accurate than trivial `integral` procedure.
