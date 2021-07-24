Exercise 1.36
=============
Modify `fixed-point` so that it prints the sequence of approximations it generates, using the `newline` and `display` primitives shown in exercise 1.22. 
Then find a solution to *x^x = 1000* by finding a fixed point of *x -> log(1000)/log(x)*. (Use Scheme's primitive log procedure, which computes natural logarithms.) 

Compare the number of steps this takes with and without average damping. (Note that you cannot start fixed-point with a guess of 1, as this would cause division by log(1) = 0.)


References
----------
```scheme
;;;Exercise 1.22

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
```


Solutions
---------
```scheme
(define (report-guess n)
  (newline)
  (display "guessing: ")
  (display n))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (report-guess guess)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 3.0)
```

which produces,

```scheme
guessing: 3.
guessing: 6.287709822868153
guessing: 3.757079790200296
guessing: 5.218748919675315
guessing: 4.180797746063314
guessing: 4.828902657081293
guessing: 4.386936895811029
guessing: 4.671722808746095
guessing: 4.481109436117821
guessing: 4.605567315585735
guessing: 4.522955348093164
guessing: 4.577201597629606
guessing: 4.541325786357399
guessing: 4.564940905198754
guessing: 4.549347961475409
guessing: 4.5596228442307565
guessing: 4.552843114094703
guessing: 4.55731263660315
guessing: 4.554364381825887
guessing: 4.556308401465587
guessing: 4.555026226620339
guessing: 4.55587174038325
guessing: 4.555314115211184
guessing: 4.555681847896976
guessing: 4.555439330395129
guessing: 4.555599264136406
guessing: 4.555493789937456
guessing: 4.555563347820309
guessing: 4.555517475527901
guessing: 4.555547727376273
guessing: 4.555527776815261
guessing: 4.555540933824255
;Value: 4.555532257016376
```

compared with *average damping* version of `fixed-point`,

```scheme
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (/ (+ guess (f guess)) 2)))
      (report-guess guess)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 3.0)
```

which had lower steps to converge,

```scheme
guessing: 3.
guessing: 4.643854911434076
guessing: 4.571212264484558
guessing: 4.558225323866829
guessing: 4.555994244552759
guessing: 4.555613793442989
guessing: 4.5555490009596555
guessing: 4.5555379689379265
;Value: 4.55553609061889
```