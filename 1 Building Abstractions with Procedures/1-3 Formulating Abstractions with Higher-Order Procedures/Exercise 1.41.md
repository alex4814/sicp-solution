Exercise 1.41
=============
Define a procedure `double` that takes a procedure of one argument as argument and returns a procedure that applies the original procedure twice. For example, if `inc` is a procedure that adds 1 to its argument, then `(double inc)` should be a procedure that adds 2. What value is returned by

```scheme
(((double (double double)) inc) 5)
```


Solutions
---------
According to its definition, `double` is a procedure that applies its procedure argument twice.

```scheme
(define (double f)
  (lambda (x) (f (f x))))
```

The value returned by expression is

```scheme
(((double (double double)) inc) 5)
;Value: 21
```


Notes
-----
Actually, the result suprised me as 5+8=13 is what I thought in my mind -- which is wrong, and I got it with

```scheme
((double (double (double inc))) 5)
;Value: 13
```

and it is indeed different from `((double (double double)) inc)`.

Explanationis that `((double (double double)) inc)` is equivalent to `(double (double (double (double inc))))`.
