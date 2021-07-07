Exercise 1.23
=============
The `smallest-divisor` procedure shown at the start of this section does lots of needless testing: 
After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. 
This suggests that the values used for `test-divisor` should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9, .... 

To implement this change, define a procedure `next` that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. 
Modify the `smallest-divisor` procedure to use `(next test-divisor)` instead of `(+ test-divisor 1)`. 
With `timed-prime-test` incorporating this modified version of `smallest-divisor`, run the test for each of the 12 primes found in exercise 1.22. 
Since this modification halves the number of test steps, you should expect it to run about twice as fast. 
Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, 
and how do you explain the fact that it is different from 2?

For reference,
```scheme
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))
```


Solutions
---------
The modified version of `smallest-divisor` is:

```scheme
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

(define (prime? n)
  (= n (smallest-divisor n)))
```

Together with procedure `timed-prime-test`,

```scheme
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
```

testing two versions we can get:

```scheme
1 ]=> (timed-prime-test 10000000000037) 

10000000000037 *** 1.5
;Unspecified return value

;Compared with the time used in exercise 1.22
;10000000000037 *** 2.42
;Unspecified return value
;Ratio = 2.42/1.5 = 1.6133333333333333


1 ]=> (timed-prime-test 1000000000039)

1000000000039 *** .45999999999999996
;Unspecified return value

;Compared with the time used in exercise 1.22
;1000000000039 *** .77
;Unspecified return value
;Ratio = .77/.46 = 1.6739130434782608


1 ]=> (timed-prime-test 100000000019)

100000000019 *** .14000000000000012
;Unspecified return value

;Compared with the time used in exercise 1.22
;100000000019 *** .2400000000000002
;Unspecified return value
;Ratio = .24/.14 = 1.714285714285714
```

The ratio is less than 2, and gets lower when the number tested becomes larger.

Observe that when we use `(next test-divisor)` instead of `(+ test-divisor 1)` the steps
are actually not halved, rather more than half, because more `if` evaluated.
The larget number to test, the more *if* is tested, thus lower the ratio compared to original version.
