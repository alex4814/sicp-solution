(define (cont-frac n d k)
  (define (iter result k)
	  (if (= k 0)
		    result
				(iter (/ (n k) (+ result (d k))) (- k 1))))
	(iter 0 k))

(define (tan-cf x k)
  (cont-frac (lambda (i) 
                (if (= i 1)
                    x
                    (- (* x x))))
             (lambda (i)
                (- (* 2 i) 1))
             k))

(define pi 3.14159265358979)
(tan-cf pi 100)
(tan-cf (/ pi 4) 100)
(tan-cf (/ pi 3) 100)

