Exercise 1.44
=============
The idea of *smoothing* a function is an important concept in signal processing. If *f* is a function and *dx* is some small number, then the smoothed version of *f* is the function whose value at a point *x* is the average of *f(x - dx)*, *f(x)*, and *f(x + dx)*. 

Write a procedure `smooth` that takes as input a procedure that computes *f* and returns a procedure that computes the smoothed *f*. It is sometimes valuable to repeatedly smooth a function (that is, smooth the smoothed function, and so on) to obtained the *n-fold smoothed function*. 

Show how to generate the *n*-fold smoothed function of any given function using `smooth` and `repeated` from exercise 1.43.


References
----------
```scheme
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
```scheme
(define (smooth f)
  (define dx 0.00001)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (repeated-smooth f n)
  ((repeated smooth n) f))
```

For simple testing,

```scheme
((repeated-smooth square 1) 3)
;Value: 9.000000000066665

((repeated-smooth square 5) 3)
;Value: 9.000000000333332

((repeated-smooth square 10) 3)
;Value: 9.000000000666667
```
