Exercise 1.10
=============
The following procedure computes a mathematical function called Ackermann's function.

```scheme
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
```

What are the values of the following expressions?

    (A 1 10)
    (A 2 4)
    (A 3 3)

Consider the following procedures, where A is the procedure defined above:

```scheme
(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))
```

Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. For example, (k n) computes 5n^2.


Solutions
---------
```scheme
(A 1 10)
(A 0 (A 1 9))
(* 2 (A 1 9))
(* 2 (A 0 (A 1 8)))
(* 2 (* 2 (A 1 8)))
...
1024
```

```scheme
(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2))))
(A 1 (A 1 4))
(A 1 16)
65536
```

```scheme
(A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
(A 2 (A 1 (A 2 1)))
(A 2 (A 1 2))
(A 2 4)
65536
```

```latex
f(n) = 2n
g(n)= 2^n
h(n) = 2^2^2...^2 (total n)
```