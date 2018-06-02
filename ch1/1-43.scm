; Recursive process
(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x)
        (f ((repeated f (- n 1)) x)))))

; Iterative process
(define (repeated-iter f n)
  (define (iter g a)
    (if (= a n)
        g
        (iter (lambda (x) (f (g x))) (+ a 1))))
  (iter f 1))

((repeated square 2) 5)
((repeated-iter square 2) 5)

