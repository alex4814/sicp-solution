Exercise 1.6
============
Alyssa P. Hacker doesn't see why if needs to be provided as a special form. ``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

```scheme
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
```

Eva demonstrates the program for Alyssa:

```scheme
(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0
```

Delighted, Alyssa uses new-if to rewrite the square-root program:

```scheme
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
```

What happens when Alyssa attempts to use this to compute square roots? Explain.


Explanations
------------
The key point is that the evaluation rule for special form *if* is different with
normal applicative-order rule.

The rewritten square-root program would be in a infinie loop because of this.
Because the **sqrt-iter** will never ends evaluation from *else-clause* of new-if procedure.

Applicative-order means new-if would evaluate all 
`predicate`, `then-clause`, `else-clause` expressions before application,
while `else-clause` would not be evaluated in special
form of `if` if `predicate` evaluated to true (#t).
