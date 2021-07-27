Exercise 1.37
=============
a. An infinite *continued fraction* is an expression of the form

![cont-frac][1]

As an example, one can show that the infinite continued fraction expansion with the ![N_i][5] and the ![D_i][6] all equal to 1 produces ![1phi][3], where ![phi][2] is the golden ratio (described in section 1.2.2). 

One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. 
Such a truncation -- a so-called *k-term finite continued fraction* -- has the form

![k-finite-cont-frac][4]

Suppose that *n* and *d* are procedures of one argument (the term index *i*) that return the ![N_i][5] and ![D_i][6] of the terms of the continued fraction. Define a procedure `cont-frac` such that evaluating `(cont-frac n d k)` computes the value of the *k*-term finite continued fraction. Check your procedure by approximating ![1phi][3] using

```scheme
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)
```

for successive values of *k*. How large must you make *k* in order to get an approximation that is accurate to 4 decimal places?

b. If your `cont-frac` procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.


[1]: https://latex.codecogs.com/svg.image?f=\frac{N_1}{D_1&plus;\frac{N_2}{D_2&plus;\frac{N_3}{D_3&plus;\cdots}}}
[2]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20%5Cvarphi
[3]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%201/%5Cvarphi
[4]: https://latex.codecogs.com/svg.image?\frac{N_1}{D_1&plus;\frac{N_2}{\ddots&plus;\frac{N_k}{D_k}}}
[5]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20N_i
[6]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20D_i
[7]: https://latex.codecogs.com/svg.image?%5Cdpi%7B100%7D%20%5Cinline%20%5Cvarphi=(1&plus;%5Csqrt%7B5%7D)/2


References
----------
The golden ratio is ![golden-ratio][7].


Solutions
---------
a. Start calculating from *k*-term, it is rather easy to define

```scheme
;; recursive process
(define (cont-frac n d k)
  (define (cont-frac-i n d k i)
    (if (> i k)
        0
        (/ (n i) 
           (+ (d i) 
              (cont-frac-i n d k (+ i 1))))))
  (cont-frac-i n d k 1))
```

, and using successive *k* to approximate ![1phi][3], we can see at least *k >= 11* can we get an approximation that is accurate to 4 decimal places.

```scheme
;k=1   ;Value: 1. 
;k=2   ;Value: .5
;k=3   ;Value: .6666666666666666
;k=4   ;Value: .6000000000000001
;k=5   ;Value: .625
;k=6   ;Value: .6153846153846154
;k=7   ;Value: .6190476190476191
;k=8   ;Value: .6176470588235294
;k=9   ;Value: .6181818181818182
;k=10  ;Value: .6179775280898876
;k=11  ;Value: .6180555555555556
;k=12  ;Value: .6180257510729613
```


b. Then change it to an iterative process,

```scheme
;; iterative process
(define (cont-frac n d k)
  (define (iter i result)
    (if (< i 1)
        result
        (iter (- i 1) (/ (n i) (+ result (d i))))))
  (iter k 0))
```
