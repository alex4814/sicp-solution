Exercise 1.5
============
Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

```scheme
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
```

Then he evaluates the expression

```scheme
(test 0 (p))
```

What behavior will Ben observe with an interpreter that uses applicative-order evaluation?
What behavior will he observe with an interpreter that uses normal-order evaluation?

Explain your answer. 
(Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)


Solutions
---------
Answer is that Ben will observe an infinite recursive evaluation if the interpreter uses applicative-order evaluation, and see a `0` as result for normal-order interpreters.

Explanations
------------
`(define (p) (p))` defines a procedure `p` without any formal parameters whose body is calling a procedure named `p`, which means it is recursively calling itself.

According to the description of evaluation given in section 1.1.3, applicative-order interpreter first evaluates the operator and operands and then applies the resulting procedure to the resulting arguments.
Thus, when it comes to evaluating the last expression `(p)`, it fails to terminate because it is defined as an endless recursive call to itself.

A normal-order interpreter however will do a *fully expand and then reduce* method. It would not evaluate the operands until their values were needed. So it would first substitute `(test 0 (p))` to

```scheme
(if (= 0 0)
    0
    (p))
```

Hence according to the evaluation rule for the special form if, we never evaluate the alternative expression `(p)` for the sake of the predicate `(= 0 0)` evaluates to `#t`.
