Exercise 1.33
=============
You can obtain an even more general version of `accumulate` (exercise 1.32) by introducing the notion of a *filter* on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting `filtered-accumulate` abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write `filtered-accumulate` as a procedure. Show how to express the following using `filtered-accumulate`:

a. the sum of the squares of the prime numbers in the interval *a* to *b* (assuming that you have a `prime?` predicate already written)

b. the product of all the positive integers less than *n* that are relatively prime to *n* (i.e., all positive integers *i < n* such that *GCD(i,n)* = 1).


References
----------
```scheme
;;;SECTION 1.2.5
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;;;SECTION 1.2.6
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))
```


Solutions
---------
First, we could take `accumulate` further by introducing a *filter*,

```scheme
;; recursive process
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter a) (term a) null-value)
                (filtered-accumulate filter combiner null-value term (next a) next b))))

;; iterative process
(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (if (filter a) (term a) null-value)
                                 result))))
  (iter a null-value))
```

a. the sum of the squares of the prime numbers in the interval *a* to *b*
```scheme
(define (sum-of-prime-squares a b)
  (define (inc n) (+ n 1))
  (filtered-accumulate prime? + 0 square a inc b))
```

b. the product of all the positive integers less than *n* that are relatively prime to *n*
```scheme
(define (product-of-relative-primes n)
  (define (relatively-prime? a)
    (= 1 (gcd a n)))
  (define (identity n) n)
  (define (inc n) (+ n 1))
  (filtered-accumulate relatively-prime? * 1 identity 1 inc (- n 1)))
```
