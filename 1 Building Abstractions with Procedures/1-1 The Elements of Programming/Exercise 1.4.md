Exercise 1.4
============
Observe that our model of evaluation allows for combinations whose operators are compound expressions. 
Use this observation to describe the behavior of the following procedure:

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

Solutions
---------
`a-plus-abs-b` is a procedure that calculate the sum of `a` and absolute value of `b`.

When interpreter evaluates the sub-expression, 
it first evaluates the left-most operator to `+`(plus) if `b` is positive,
or to `-`(minus) otherwise.
