Exercise 1.34
=============
Suppose we define the procedure

```scheme
(define (f g)
  (g 2))
```

Then we have

```
(f square)
4

(f (lambda (z) (* z (+ z 1))))
6
```

What happens if we (perversely) ask the interpreter to evaluate the combination `(f f)`? Explain.


Solutions
---------
With applicative-order evaluation, we could follow its process

```scheme
(f f)
(f 2)
(2 2)
```

and found that 2 is not applicable.
