(define (identity x) x)
(define (inc x) (+ x 1))

; a. Recursive process
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum-integer a b)
  (sum identity a inc b))
(define (factorial n)
  (product identity 1 inc n))

; a. Test
(sum-integer 1 10)
(factorial 10)


; b. Iterative process
(define (accumulate-iter combiner null-value term a next b)
  (define (iter n result)
    (if (> n b)
        result
        (iter (next n) (combiner (term n) result))))
  (iter a null-value))

(define (sum-iter term a next b)
  (accumulate-iter + 0 term a next b))
(define (product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (sum-integer-iter a b)
  (sum-iter identity a inc b))
(define (factorial-iter n)
  (product-iter identity 1 inc n))

; b. Test
(sum-integer-iter 1 10)
(factorial-iter 10)

