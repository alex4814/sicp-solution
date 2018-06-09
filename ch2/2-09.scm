(define (width-interval x)
 (/ (- (upper-bound x) (lower-bound x)) 2))

; Addtion
(define (add-interval x y)
 (make-interval (+ (lower-bound x) (lower-bound y))
                (+ (upper-bound x) (upper-bound y))))

;(width-interval (add-interval x y)) =>
;(/ (- (+ (upper-bound x) (upper-bound y))
;      (+ (lower-bound x) (lower-bound y))) 2) =>
;(- (/ (+ (upper-bound x) (upper-bound y) 2))
;   (/ (+ (lower-bound x) (lower-bound y) 2))) =>
;(- (width-interval x) (width-interval y))

; Multiplication

