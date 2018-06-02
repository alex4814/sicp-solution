; Recursive process
(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x)
        (f ((repeated f (- n 1)) x)))))

(define (smoothed f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (n-fold-smoothed f n)
  (repeated smoothed n))

