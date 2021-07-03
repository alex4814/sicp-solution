Exercise 1.2
============
Translate the following expression into preﬁx form:

<img src="https://latex.codecogs.com/svg.image?\frac{5&plus;4&plus;(2-(3-(6&plus;\frac{4}{5})))}{3(6-2)(2-7)}" title="\frac{5+4+(2-(3-(6+\frac{4}{5})))}{3(6-2)(2-7)}" />

Solutions
---------
```scheme
(/ (+ 5 
      4 
      (- 2 (- 3 (+ 6 
                   (/ 4 5)))))
   (* 3 
      (- 6 2) 
      (- 2 7)))
      
;Value: -37/150
```
