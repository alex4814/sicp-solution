(define (cont-frac n d k)
  (define (iter result k)
	  (if (= k 0)
		    result
				(iter (/ (n k) (+ result (d k))) (- k 1))))
	(iter 0 k))

(define (e-2 k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 
               (let ((r (remainder i 3)))
                 (if (= r 2)
                     (* (/ (+ i 1) 3) 2)
                     1.0)))
             k))

(define (e k)
  (+ 2 (e-2 k)))

(e 10)
(e 100)
(e 1000)
(e 10000)
(e 100000)

