(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))

; Return 0 if normal-order
; Recursive evaluating `p` (infinite) if applicative-order

