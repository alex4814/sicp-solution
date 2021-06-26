Exercise 1.15
=============
The sine of an angle (specified in radians) can be computed by making use of the approximation ![sinx=x][1] if x is sufficiently small, and the trigonometric identity

![trigonometric-identity][2]

to reduce the size of the argument of *sin*. (For purposes of this exercise an angle is considered ``sufficiently small'' if its magnitude is not greater than 0.1 radians.) These ideas are incorporated in the following procedures:

```scheme
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
```

a.  How many times is the procedure p applied when (sine 12.15) is evaluated?

b.  What is the order of growth in space and number of steps (as a function of a) used by the process generated by the sine procedure when (sine a) is evaluated?

[1]: https://latex.codecogs.com/svg.image?\inline&space;\sin{x}&space;\approx&space;x
[2]: https://latex.codecogs.com/svg.image?\sin{x}&space;=&space;3\sin{\frac{x}{3}}-4\sin^3{\frac{x}{3}}


Solutions
---------
a.  How many times is the procedure p applied when (sine 12.15) is evaluated?

```scheme
(sine 12.15)
(p (sine (/ 12.15 3.0)))
(p (sine 4.05))
(p (p (sine (/ 4.05 3.0))))
(p (p (sine 1.35)))
(p (p (p (sine (/ 1.35 3.0)))))
(p (p (p (sine 0.45))))
(p (p (p (p (sine (/ 0.45 3.0))))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine (/ 0.15 3.0)))))))
(p (p (p (p (p (sine 0.05))))))
```

From the evolution of procedure *sine*, we can see that `p` is applied **5** times.


b.  What is the order of growth in space and number of steps (as a function of a) used by the process generated by the sine procedure when (sine a) is evaluated?

The number of steps needed to compute (sine a) could be roughly the number of times procedure `p` is applied. Thus,

<img src="https://latex.codecogs.com/svg.image?\begin{align*}&space;\frac{a}{3^{R(n)}}&space;&\leq&space;0.1&space;\\&space;R(n)&space;&\geq&space;\log_3{10a}\end{align*}" title="\begin{align*} \frac{a}{3^{R(n)}} &\leq 0.1 \\ R(n) &\geq \log_3{10a}\end{align*}" />

So, the order of growth is ![growth][3].


[3]: https://latex.codecogs.com/svg.image?\inline&space;\Theta&space;(\log_3{n})
