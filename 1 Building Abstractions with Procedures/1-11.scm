(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
; f: Recursive process

(define (g n)
  (if (< n 3)
      n
      (g-iter 2 1 0 n)))
(define (g-iter a b c n)
  (if (< n 3)
      a
      (g-iter (+ a (* 2 b) (* 3 c)) a b (- n 1))))
; g: Iterative process

(g -1230)
(f -1230)

(g 4)
(f 4)

(g 10)
(f 10)

(g 64)
(f 64)

