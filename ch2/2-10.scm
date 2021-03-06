(define (div-interval x y)
 (mul-interval
  x
  (make-interval (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y)))))

; Revised
(define (div-interval x y)
 (if (spans-zero? y)
     (error "spans zero")
     (mul-interval 
      x
      (make-interval (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound x))))))

