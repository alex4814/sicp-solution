Exercise 1.38
=============
In 1737, the Swiss mathematician Leonhard Euler published a memoir *De Fractionibus Continuis*, which included a continued fraction expansion for *e - 2*, where *e* is the base of the natural logarithms. In this fraction, the ![N_i][5] are all 1, and the ![D_i][6] are successively *1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...*. Write a program that uses your `cont-frac` procedure from **exercise 1.37** to approximate *e*, based on Euler's expansion.

[5]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20N_i
[6]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20D_i


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
```scheme
(define (n i) 1.0)
(define (d i)
  (let ((r (remainder i 3)))
    (if (= r 2)
        (* 2 (+ 1.0 (/ (- i 2) 3)))
        1.0)))

(define e (+ 2 (cont-frac n d 1000)))

e
;Value: 2.7182818284590455
```
