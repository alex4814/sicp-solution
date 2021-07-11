Exercise 1.26
=============
Louis Reasoner is having great difficulty doing exercise 1.24. His *fast-prime?* test seems to run more slowly than his *prime?* test. Louis calls his friend Eva Lu Ator over to help. 
When they examine Louis's code, they find that he has rewritten the *expmod* procedure to use an explicit multiplication, rather than calling *square*:

```scheme
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
```

"I don't see what difference that could make," says Louis. "I do." says Eva. "By writing the procedure like that, you have transformed the O(log n) process into a O(n) process."

Explain.


Solutions
---------
Suppose *R(n)* is the number of steps used to perform procedure `expmod`, we can roughly say

    R(n) = 2R(n/2), if n is even
    R(n) = 1 + R(n-1), if n is odd
    R(1) = 1

We could conclude that *R(n) = n*, obviously, if n is odd,
and when *n* is even but with odd *n/2*, *R(n)=2R(n/2)=2(n/2)=n*.
and when *n* is multiple of *2^x*, then *R(n) = 2^x R(n/(2^x)) = 2^x(n/(2^x)) = n*.

Louis indeed transformed the process into a O(n) process.
