Exercise 1.25
=============
Alyssa P. Hacker complains that we went to a lot of extra work in writing `expmod`. 
After all, she says, since we already know how to compute exponentials, we could have simply written

```scheme
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
```

Is she correct? Would this procedure serve as well for our fast prime tester? Explain.


Reference
---------
```scheme
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
```


Solutions
---------
We cannot see the difference when the value is rather small.

It becomes noticeable when *base^exp* is large, and the operations need to compute the remainder
would be proportional to the digits of big numbers.

For instance, we could have tested them by following procedures

```scheme
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (expmod-fast base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod-fast base (/ exp 2) m)) m))
        (else        (remainder (* base (expmod-fast base (- exp 1) m)) m)))))

(define (timed expmod base exp m)
  (newline)
  (display base)
  (display "^")
  (display exp)
  (display " mod ")
  (display m)
  (start-expmod expmod base exp m (runtime)))
(define (start-expmod f base exp m start-time)
  (display " = ")
  (display (f base exp m))
  (display " *** ")
  (display (- (runtime) start-time)))
```

and test with

```scheme
1 ]=> (timed expmod 2 10001000 17221)

2^10001000 mod 17221 = 9113 *** 26.049999999999997
;Unspecified return value

1 ]=> (timed expmod-fast 2 10001000 17221)

2^10001000 mod 17221 = 9113 *** 0.
;Unspecified return value
```

What a huge difference!
