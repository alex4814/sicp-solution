Exercise 1.22
=============
Most Lisp implementations include a primitive called `runtime` that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). 
The following `timed-prime-test` procedure, when called with an integer *n*, prints *n* and checks to see if *n* is prime.
If *n* is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

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

Using this procedure, write a procedure `search-for-primes` that checks the primality of consecutive odd integers in a specified range. 

Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. 
Note the time needed to test each prime. Since the testing algorithm has order of growth of ![osn][1], you should expect that testing for primes around 10,000 should take about ![s10][2] times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the n prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

[1]: https://latex.codecogs.com/svg.image?\inline&space;\Theta(\sqrt{n})
[2]: https://latex.codecogs.com/svg.image?\inline&space;\sqrt{n}


Solutions
---------
```scheme
; Search for primes within [a, b) range
(define (search-for-primes a b)
  (define (test-and-next a b)
    (timed-prime-test a)
    (searching (+ a 2) b))
  (define (searching a b)
    (if (>= a b) 
        (newline)
        (test-and-next a b)))
  (if (= (remainder a 2) 0)
      (searching (+ a 1) b)
      (searching a b)))
```

-----
Due to the dramaticly increased power of cpu these days, bigger numbers are tested and small values are ignored.

```scheme
(search-for-primes 1000 1030)
(search-for-primes 10000 10030)
(search-for-primes 100000 100030)
(search-for-primes 1000000 1000030)
(search-for-primes 10000000 10000030)
(search-for-primes 100000000 100000030)
(search-for-primes 1000000000 1000000030)
(search-for-primes 10000000000 10000000030)
(search-for-primes 100000000000 100000000030)
(search-for-primes 1000000000000 1000000000040)
(search-for-primes 10000000000000 10000000000040)
```

We can see from the result that time used is approximately 3 times as long as one-tenth size of *n*,
which is expected.

```scheme
1 ]=> (search-for-primes 10000000000000 10000000000040)

10000000000001
10000000000003
10000000000005
10000000000007
10000000000009
10000000000011
10000000000013
10000000000015
10000000000017
10000000000019
10000000000021
10000000000023
10000000000025
10000000000027
10000000000029
10000000000031
10000000000033
10000000000035
10000000000037 *** 2.42
10000000000039
;Unspecified return value

1 ]=> (search-for-primes 1000000000000 1000000000040)

1000000000001
1000000000003
1000000000005
1000000000007
1000000000009
1000000000011
1000000000013
1000000000015
1000000000017
1000000000019
1000000000021
1000000000023
1000000000025
1000000000027
1000000000029
1000000000031
1000000000033
1000000000035
1000000000037
1000000000039 *** .77
;Unspecified return value

1 ]=> (search-for-primes 100000000000 100000000030)

100000000001
100000000003 *** .25
100000000005
100000000007
100000000009
100000000011
100000000013
100000000015
100000000017
100000000019 *** .2400000000000002
100000000021
100000000023
100000000025
100000000027
100000000029
;Unspecified return value

1 ]=> (search-for-primes 10000000000 10000000030)

10000000001
10000000003
10000000005
10000000007
10000000009
10000000011
10000000013
10000000015
10000000017
10000000019 *** .08000000000000007
10000000021
10000000023
10000000025
10000000027
10000000029
;Unspecified return value
```
