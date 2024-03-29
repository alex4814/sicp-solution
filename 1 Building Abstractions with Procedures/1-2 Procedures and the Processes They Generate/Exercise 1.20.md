Exercise 1.20
=============
The process that a procedure generates is of course dependent on the rules used by the interpreter. 

As an example, consider the iterative *gcd* procedure given above. 
Suppose we were to interpret this procedure using normal-order evaluation, as discussed in section 1.1.5. 
(The normal-order-evaluation rule for *if* is described in exercise 1.5.) 
Using the substitution method (for normal order), illustrate the process generated in evaluating (gcd 206 40) and indicate the remainder operations that are actually performed. How many remainder operations are actually performed in the normal-order evaluation of `(gcd 206 40)`? In the applicative-order evaluation?

> For reference,
> ```scheme
> (define (gcd a b)
>   (if (= b 0)
>       a
>       (gcd b (remainder a b))))
> ```

Solutions
---------
With normal-order evaluation, the process is expanded below:

```scheme
(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

...
```
First, we count how many times `remainder` is performed in *if* evaluation,

```scheme
(if (= 40 0)                                                                   ; 0
(if (= (remainder 206 40) 0)                                                   ; 1                   , (206, 40)
(if (= (remainder 40 (remainder 206 40)) 0)                                    ; 2  = (0 + 1) + 1    , (40, 6)
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)     ; 4  = (1 + 2) + 1    , (6, 4)
...                                                                            ; 7  = (2 + 4) + 1    , (4, 2)
```

and the final *if* should be evaluated with `if (= (remainder 4 2) 0)`, which is *7* times,
so the total times is *14* (1+2+4+7) times.
and the true-clause of the final *if* would be evaluating `(remainder 6 4)`, which is *4* times.

Thus, the normal-order process has **18** `remainder` operations.

------

With applicative-order evaluation, it is rather easy to calculate.

```scheme
(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))
(gcd 40 (remainder 206 40))

(gcd 40 6)
(if (= 6 0)
    40
    (gcd 6 (remainder 40 6)))
(gcd 6 (remainder 40 6))

(gcd 6 4)
(if (= 4 0)
    6
    (gcd 4 (remainder 6 4)))
(gcd 4 (remainder 6 4))

(gcd 4 2)
(if (= 2 0)
    4
    (gcd 2 (remainder 4 2)))
(gcd 2 (remainder 4 2))

(gcd 2 0)
(if (= 0 0)
    2
    (gcd 0 (remainder 2 0)))
```

The applicative-order process has **4** `remainder` operations.
