Exercise 1.12
=============
The following pattern of numbers is called *Pascal's triangle*.

![Pascal's Triangle](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/ch1-Z-G-17.gif)

The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal's triangle by means of a recursive process.


Solutions
---------
```scheme
(define (pascal-triangle-element r c)
  (cond ((= r c) 1)
        ((= c 0) 1)
        ((> c r) 0)
        (else (+ (pascal-triangle-element (- r 1) c)
                 (pascal-triangle-element (- r 1) (- c 1))))))
```
