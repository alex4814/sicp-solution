; Formal paramters: row `r` column `c`, both starts at one
(define (pascal-triangle r c)
  (cond ((or (> c r) (< r 1) (< c 1)) 0)
        ((or (= c 1) (= r c)) 1)
        (else (+ (pascal-triangle (- r 1) (- c 1))
                 (pascal-triangle (- r 1) c)))))

(pascal-triangle 1 1)
(pascal-triangle 5 3)
(pascal-triangle 9 8)
(pascal-triangle 20 8)

