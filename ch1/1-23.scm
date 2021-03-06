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

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	      ((divides? test-divisor n) test-divisor)
				(else (find-divisor n (next test-divisor)))))
(define (next divisor)
  (if (= divisor 2)
      3
      (+ divisor 2)))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes lo hi)
  (if (= 1 (remainder lo 2))
	    (timed-prime-test lo)
			())
  (if (= lo hi)
			(newline)
			(search-for-primes (+ lo 1) hi)))

(search-for-primes 1000 1050)
(search-for-primes 10000 10050)
(search-for-primes 100000 100050)
(search-for-primes 1000000 1000050)

; To get perceivable results we need bigger numbers for 
; primarity test due to greatly improved computational power.
(search-for-primes 100000000 100000050)
(search-for-primes 1000000000 1000000050)
(search-for-primes 10000000000 10000000050)
(search-for-primes 100000000000 100000000050)

