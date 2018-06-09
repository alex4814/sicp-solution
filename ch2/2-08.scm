(define (make-interval a b) (cons a b))

(define (upper-bound i) (max (car i) (cdr i)))
(define (lower-bound i) (min (car i) (cdr i)))

(define (sub-interval a b)
 (make-interval (- (lower-bound a) (upper-bound b))
                (- (upper-bound a) (lower-bound b))))

