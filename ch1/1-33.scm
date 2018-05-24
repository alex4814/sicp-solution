; Prime predicate
(define (square-check x m)
  (if (and 
       (not (or (= x 1) (= x (- m 1))))
       (= (remainder (square x) m) 1))
      0
      (remainder (square x) m)))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (square-check (expmod base (/ exp 2) m) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else #f)))
(define (prime? n)
  (fast-prime? n 5))

; Recursive process
(define (filtered-accumulate filtered? combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filtered? a)
          (combiner 
            (term a) 
            (filtered-accumulate filtered? combiner null-value term (next a) next b)))
        (else 
          (filtered-accumulate filtered? combiner null-value term (next a) next b))))

; Iterative process
(define (filtered-accumulate2 filtered? combiner null-value term a next b)
  (define (iter n result)
    (cond ((> n b) result)
          ((filtered? n) (iter (next n) (combiner (term n) result)))
          (else (iter (next n) result))))
  (iter a null-value))

; a
(define (inc x) (+ x 1))
(define (sum-square-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

; 2^2 + 3^2 + 5^2 + 7^2 = 4+9+25+49 = 87
(sum-square-primes 2 10)

; b
(define (identity x) x)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (product-relatively-prime-to n)
  (define (relatively-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate relatively-prime? * 1 identity 1 inc (- n 1)))

; 1*3*7*9 = 189
(product-relatively-prime-to 10)

