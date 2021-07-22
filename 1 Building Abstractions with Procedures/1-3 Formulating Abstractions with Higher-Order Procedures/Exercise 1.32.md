Exercise 1.32
=============
a. Show that `sum` and `product` (exercise 1.31) are both special cases of a still more general notion called `accumulate` that combines a collection of terms, using some general accumulation function:

```scheme
(accumulate combiner null-value term a next b)
```

`Accumulate` takes as arguments the same term and range specifications as `sum` and `product`, together with a `combiner` procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a `null-value` that specifies what base value to use when the terms run out. Write `accumulate` and show how `sum` and `product` can both be defined as simple calls to `accumulate`.

b. If your `accumulate` procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.


References
----------
```scheme
;; sum procedure
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

;; product procedure
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) 
         (product term (next a) next b))))
```


Solutions
---------
a. We could have seen the obvious pattern shared between `sum` and `product` procedure in the references,
and abstract that with `accumulate` below,

```scheme
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))
```

and test that with,

```scheme
(define (identity i) i)
(define (inc i) (+ i 1))

1 ]=> (sum identity 0 inc 10)
;Value: 55

1 ]=> (product identity 1 inc 10)
;Value: 3628800
```

b. Changes it to a iterative process,

```scheme
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))
```
