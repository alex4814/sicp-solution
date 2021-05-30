Exercise 1.3
============
Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

Solutions
---------
```scheme
; `square` is built-in primitive procedure.

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (sum-of-two-larger a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
        ((and (<= b a) (<= b c)) (sum-of-squares a c))
        (else (sum-of-squares a b))))
```

Tests
-----
```scheme
(sum-of-two-larger 2 3 4)
;Value: 25
(sum-of-two-larger -1 -1 2)
;Value: 5
```
