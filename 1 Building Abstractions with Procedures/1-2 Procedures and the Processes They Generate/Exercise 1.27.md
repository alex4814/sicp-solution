Exercise 1.27
=============
Demonstrate that the Carmichael numbers listed in footnote 47 really do fool the Fermat test. 
That is, write a procedure that takes an integer *n* and tests whether *a^n* is congruent to *a* modulo *n* for every *a < n*, and try your procedure on the given Carmichael numbers.


Reference
---------
From exercise 1.24

```scheme
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                     m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))
```


Solutions
---------
```scheme
(define (pass-fermat-test? n)
  (define (try-fermat-test a)
    (= (expmod a n n) a))
  (define (fermat-test times)
    (cond ((= times 0) true)
          ((try-fermat-test times) (fermat-test (- times 1)))
          (else false)))
  (fermat-test (- n 1)))
```

And test with Carmichael numbers,

```scheme
1 ]=> (pass-fermat-test? 561)
;Value: #t

1 ]=> (pass-fermat-test? 1105)
;Value: #t

1 ]=> (pass-fermat-test? 1729)
;Value: #t

1 ]=> (pass-fermat-test? 2465)
;Value: #t

1 ]=> (pass-fermat-test? 2821)
;Value: #t

1 ]=> (pass-fermat-test? 6601)
;Value: #t
```


