(define (cont-frac n d k)
  (define (iter result k)
	  (if (= k 0)
		    result
				(iter (/ (n k) (+ result (d k))) (- k 1))))
	(iter 0 k))

(define (golden-ratio k)
	(cont-frac (lambda (i) 1.0)
						 (lambda (i) 1.0)
						 k))

(define (close? x)
  (let ((diff (- x 0.6180)))
			 (newline)
			 (display x)
	     (and (< diff 0.0001) (> diff 0))))

(define (search)
  (define (iter n)
	  (if (close? (golden-ratio n))
		    (golden-ratio n)
				(iter (+ n 1))))
  (iter 0))

(search)

