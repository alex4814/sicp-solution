; a. Recursive process
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; b. Iterative process
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))
; a
(define (factorial n)
  (product identity 1 inc n))
(define (identity x) x)
(define (inc x) (+ x 1))

; a
(define (f i)
  (define extra 
    (if (= (remainder i 2) 1) 1 0))
  (/ (+ 2 i extra) (+ 3 i (- extra))))
(define (g n)
  (* 4.0 (product f 0 inc n)))

(g 100)
(g 1000)
(g 10000)
(g 100000)

; b
(define (g-iter n)
  (* 4.0 (product-iter f 0 inc n)))

(g-iter 100)
(g-iter 1000)
(g-iter 10000)
;(g-iter 100000)

; Second thought, p76 (pi/8)
(define (pi-product b)
  (define (pi-term x)
    (/ (* (- x 1) (+ x 1)) (square x)))
  (define (pi-next x)
    (+ x 2))
  (* 4 (product-iter pi-term 3.0 pi-next b)))

(pi-product 100)
(pi-product 1000)
(pi-product 10000)
(pi-product 100000)
(pi-product 1000000)

