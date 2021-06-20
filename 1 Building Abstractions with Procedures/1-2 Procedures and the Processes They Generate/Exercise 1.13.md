Exercise 1.13
=============
Prove that ![fib][0] is the closest integer to ![fibonacci][1], where ![golden-ratio][2].

**Hint**: Let ![psi][3]. Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that ![equation][4].


Solutions
---------
First, we use induction to prove that ![fibonacci-equation][4], where ![psi][3]. Note that ![varphi][6] and ![psi][7] are two roots of equation ![golden-ration-equation][8].

By feeding n with 0 and 1, we can prove that *Fib(0)=0* and *Fib(1)=1*. Suppose *Fib(n)* meets the equation, then starting from *n=2*, we can prove, according to definition of Fibonacci numbers, that

<img src="https://latex.codecogs.com/svg.image?\begin{align*}\text{Fib}(n&plus;1)&space;&=&space;\text{Fib}(n)&plus;\text{Fib}(n-1)&space;\\&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&=&space;(\varphi^{n}-\psi^{n})/\sqrt{5}&space;&plus;&space;(\varphi^{n-1}-\psi^{n-1})/\sqrt{5}&space;\\&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&=&space;(\varphi^{n-1}(\varphi&plus;1)-\psi^{n-1}(\psi&plus;1)/\sqrt{5}&space;\\&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&space;&=&space;(\varphi^{n&plus;1}-\psi^{n&plus;1})/\sqrt{5}\end{align}" title="\begin{align*}\text{Fib}(n+1) &= \text{Fib}(n)+\text{Fib}(n-1) \\ &= (\varphi^{n}-\psi^{n})/\sqrt{5} + (\varphi^{n-1}-\psi^{n-1})/\sqrt{5} \\ &= (\varphi^{n-1}(\varphi+1)-\psi^{n-1}(\psi+1)/\sqrt{5} \\ &= (\varphi^{n+1}-\psi^{n+1})/\sqrt{5}\end{align}" />

Second, let ![g(n)][5], to prove ![fib][0] is the closest integer we just need to prove for each *n*,
the following inequality stands,

<img src="https://latex.codecogs.com/svg.image?-\frac{1}{2}&space;<&space;\text{Fib}(n)-g(n)\leq&space;\frac{1}{2}" title="-\frac{1}{2} < \text{Fib}(n)-g(n)\leq \frac{1}{2}" />

, and this means to prove

<img src="https://latex.codecogs.com/svg.image?-\frac{\sqrt{5}}{2}&space;\leq&space;\psi^{n}&space;<&space;\frac{\sqrt{5}}{2}" title="-\frac{\sqrt{5}}{2} \leq \psi^{n} < \frac{\sqrt{5}}{2}" />

, which is obvious because ![][9], thus

<img src="https://latex.codecogs.com/svg.image?-\frac{\sqrt{5}}{2}&space;\leq&space;-1&space;<&space;\psi^{n}&space;<&space;1&space;<&space;\frac{\sqrt{5}}{2}" title="-\frac{\sqrt{5}}{2} \leq -1 < \psi^{n} < 1 < \frac{\sqrt{5}}{2}" />

Q.E.D.


[0]: https://latex.codecogs.com/svg.image?%5Cinline%20%5Ctext%20{Fib}(n)
[1]: https://latex.codecogs.com/svg.image?%5Cvarphi%20%5E%7Bn%7D/%5Csqrt%7B5%7D
[2]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20%5Cvarphi=(1&plus;%5Csqrt%7B5%7D)/2
[3]: https://latex.codecogs.com/svg.image?%5Cpsi%20=%20(1-%5Csqrt%7B5%7D)/2
[4]: https://latex.codecogs.com/svg.image?%5Cinline%20%5Ctext%20{Fib}(n)%20=%20(%5Cvarphi%20%5E%7Bn%7D%20-%20%5Cpsi%20%5E%7Bn%7D)%20/%20%5Csqrt%7B5%7D
[5]: https://latex.codecogs.com/svg.image?\inline&space;g(n)&space;=&space;\varphi&space;^{n}/\sqrt{5}
[6]: https://latex.codecogs.com/svg.image?\inline&space;\varphi
[7]: https://latex.codecogs.com/svg.image?\inline&space;\psi
[8]: https://latex.codecogs.com/svg.image?\inline&space;x^2=x&plus;1
[9]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20-1<%5Cvarphi=(1&plus;%5Csqrt%7B5%7D)/2<0
