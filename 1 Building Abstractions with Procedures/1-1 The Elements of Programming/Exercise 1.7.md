Exercise 1.7
============
The `good-enough?` test used in computing square roots will not be very effective 
for finding the square roots of very small numbers. Also, in real computers, arithmetic operations 
are almost always performed with limited precision. This makes our test inadequate for 
very large numbers. 

Explain these statements, with examples showing how the test fails for small and large numbers. 

An alternative strategy for implementing good-enough? is to watch 
how guess changes from one iteration to the next and to stop when the change is a very small 
fraction of the guess. Design a square-root procedure that uses this kind of end test. 

Does this work better for small and large numbers?


Explanations
------------
```scheme
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
```

For example, when finding square root of small number, say 1e-8, the test
with guess 1e-3 `(< (abs (- (square 0.001) 0.00000001)) 0.001)` would pass.
In a nutshell, the test would be inadequate for all small numbers less than 
the threshold defined in `good-enough?`.

As for large numbers, the machine precision is unable to represent small 
differences between large numbers. It may even calculates in a infinite loop
to find a guess.


Solutions
---------
```scheme
(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))
```

We can compare with two test cases, e.g., 0.0000000001, 100000000000001.

```scheme
(sqrt 0.0000000001)
;Value: .03125000106562499

(sqrt 100000000000001)
;Value: 10000000.00000005
```

After we change the alternative `good-enough?` implementation,

```scheme
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.001))
```

We get

```scheme
(sqrt 0.0000000001)
;Value: 1.953142066571737e-3

(sqrt 100000000000001)
;Value: 10000000.000044007
```

If we test against the built-in `sqrt`, we get

```scheme
(sqrt 0.0000000001)
;Value: .00001

(sqrt 100000000000001)
;Value: 10000000.00000005
```

We can find that the alternative version of `good-enough?` works better
with small values but worse with larget numbers.
