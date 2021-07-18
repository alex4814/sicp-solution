Exercise 1.31
=============
a. The `sum` procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.
Write an analogous procedure called `product` that returns the product of the values of a function at points over a given range. 
Show how to define `factorial` in terms of `product`. Also use `product` to compute approximations to ![pi][1] using the formula

![pi-product][2]

b. If your product procedure generates a recursive process, write one that generates an iterative process. 
If it generates an iterative process, write one that generates a recursive process.

[1]: https://latex.codecogs.com/svg.image?\inline&space;\pi
[2]: https://latex.codecogs.com/svg.image?\frac{\pi}{4}=\frac{2\cdot&space;4\cdot&space;4\cdot&space;6\cdot&space;6\cdot&space;8}{3\cdot&space;3\cdot&space;5\cdot&space;5\cdot&space;7\cdot&space;7}


Solutions
---------
a. Analogous to `sum` procedure, we can write

```scheme
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))
```

Use it to define `factorial`,

```scheme
(define (factorial n)
  (define (identity n) n)
  (define (inc n) (+ n 1))
  (product identity 1 inc n))
```

and compute ![pi][1] approximately

```scheme
(define (pi n)
  (define (f i)
    (define a (+ 3.0 i))    ;; 3.0 to floating number calculation
    (define b (- a 1.0))    ;; 1.0 to floating number calculation
    (if (even? i)
        (/ b a)
        (/ a b)))
  (define (inc n) (+ n 1))
  (* 4 (product f 0 inc n)))
```

with higher and higher *n*, we get closer approximation to ![pi][1].

```scheme
1 ]=> (pi 10)

;Value: 3.02317019200136

1 ]=> (pi 100)

;Value: 3.1263793980429795

1 ]=> (pi 1000)

;Value: 3.1400269461050048

1 ]=> (pi 10000)

;Value: 3.1414356249916584

1 ]=> (pi 100000)

;Value: 3.1415769461367824
```


b. Change it to a iterative process,

```scheme
(define (product term a next b)
  (define (product-iter a result)
    (if (> a b)
        result
        (product-iter (next a) (* result (term a)))))
  (product-iter a 1))
```
