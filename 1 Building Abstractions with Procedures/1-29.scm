(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson-intergral f a b n)
  (define h (/ (- b a) n)) 
  (define (g k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((= (remainder k 2) 0) 2)
          (else 4)))
  (define (term k)
    (* (f (+ a (* k h))) (g k)))
  (define (inc k)
    (+ k 1))
  (* (/ h 3) (sum term 0 inc n)))

(define (cube x)
  (* x x x))

(simpson-intergral cube 0 1 100)
(simpson-intergral cube 0 1 1000)

