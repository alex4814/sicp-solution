(define (cons a b)
 (* (expt 2 a)
    (expt 3 b)))
(define (car p)
 (num-divs p 2))
(define (cdr p)
 (num-divs p 3))

(define (num-divs n d)
 (define (iter a cnt)
  (if (= (remainder a d) 0)
      (iter (/ a d) (+ cnt 1))
      cnt))
 (iter n 0))

(define x (cons 3 4))
(car x)
(cdr x)

