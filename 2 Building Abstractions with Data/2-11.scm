(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (mul-interval x y)
 (let ((lx (lower-bound x))
       (ux (upper-bound x))
       (ly (lower-bound y))
       (uy (upper-bound y)))
  (cond ((< ux 0) 
         (cond ((< uy 0)
                (make-interval (* ux uy) (* lx ly)))
               ((< ly 0)
                (make-interval (* lx uy) (* lx ly)))
               (else
                (make-interval (* lx uy) (* ux ly)))))
        ((< lx 0)
         (cond ((< uy 0)
                (make-interval (* ux ly) (* lx ly)))
               ((< ly 0)
                (make-interval 
                 (min (* lx uy) (* ux ly)) 
                 (min (* lx ly) (* ux uy))))
               (else
                (make-interval (* lx uy) (* ux uy)))))
        (else
         (cond ((< uy 0)
                (make-interval (* ux ly) (* lx uy)))
               ((< ly 0)
                (make-interval (* ux ly) (* ux uy))
               (else
                (make-interval (* lx ly) (* ux uy)))))))))

(define a (make-interval -3 3))
(define b (make-interval 1 9))

(mul-interval a b)

