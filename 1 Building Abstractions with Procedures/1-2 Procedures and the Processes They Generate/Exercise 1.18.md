Exercise 1.18
=============
Using the results of Exercise 1.16 and Exercise 1.17,
devise a procedure that generates an iterative process for multiplying
two integers in terms of adding, doubling, and halving and
uses a logarithmic number of steps.


Solutions
---------
It is analogous to `fast-expt-iter`.
Observe that `a * (b/2*2) = 2a * (b/2)`, and use `m+a*b` acting as invariant from state to state.

```scheme
(define (* a b)
  (fast-mult-iter 0 a b))

(define (fast-mult-iter m a b)
  (cond ((= b 0) m)
        ((even? b) (fast-mult-iter m (double a) (half b)))
        (else (fast-mult-iter (+ m a) a (- b 1)))))
```
