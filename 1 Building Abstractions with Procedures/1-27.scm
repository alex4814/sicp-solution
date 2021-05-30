(define (carmichael? n)
  (define (try-it a)
	  (= (expmod a n n) a))
	(define (iter a)
	  (cond ((= a 0) #t)
		      ((try-it a) (iter (- a 1)))
					(else #f)))
	(iter (- n 1)))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

; The smallest few Carmichael numbers are 561, 1105, 1729, 2465, 2821, and 6601
(carmichael? 561)
(carmichael? 1105)
(carmichael? 1729)
(carmichael? 2465)
(carmichael? 2821)
(carmichael? 6601)
; Primes
(carmichael? 103)
(carmichael? 1000003)
; Others
(carmichael? 104)
(carmichael? 999997)
