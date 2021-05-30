(define (timed-prime-test n)
  (newline)
	(display n)
	(start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
	    (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
	(display elapsed-time))

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
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

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

