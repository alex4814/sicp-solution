Exercise 1.19
=============
There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps.
Recall the transformation of the state variables a and b in the `fib-iter` process of section 1.2.2: `a <- a + b` and `b <- a`. 
Call this transformation *T*, and observe that applying *T* over and over again *n* times, starting with 1 and 0, produces the pair *Fib(n + 1)* and *Fib(n)*.
In other words, the Fibonacci numbers are produced by applying ![T_n][1], the n-th power of the transformation *T*, starting with the pair (1,0). 
Now consider *T* to be the special case of p = 0 and q = 1 in a family of transformations ![T_pq][2], where ![T_pq][2] transforms the pair (a,b) according to `a <- bq + aq + ap` and `b <- bp + aq`.

Show that if we apply such a transformation ![T_pq][2] twice, the effect is the same as using a single transformation ![T_pq][3] of the same form, and compute p' and q' in terms of p and q.
This gives us an explicit way to square these transformations, and thus we can compute ![T_n][1] using successive squaring, as in the `fast-expt` procedure.

Put this all together to complete the following procedure, which runs in a logarithmic number of steps:

```scheme
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   <??>      ; compute p'
                   <??>      ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
```

[1]: https://latex.codecogs.com/svg.image?\inline&space;T_n
[2]: https://latex.codecogs.com/svg.image?\inline&space;T_{pq}
[3]: https://latex.codecogs.com/svg.image?\inline&space;T_{p'q'}


Solutions
---------
![sicp-1.19.png](https://im.rython.xyz/images/2021/07/03/sicp-1.19.png)

```scheme
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))      ; compute p'
                   (+ (square q) (* 2 p q))       ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
```
