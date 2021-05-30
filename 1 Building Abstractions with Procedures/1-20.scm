; normal-order
; (gcd 206 40)
; (gcd 40 (remainder 206 40))
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; ...
; the number of `remainder` operations x, y, z
; begins each at 0 for a, b, and in if statement.
; In the next expansion,
; x = y
; y = x + y + 1
; z = y
; Total 4+7+4=15 times of calling `remainder`

; applicative-order
; (gcd 206 40)
; (gcd 40 6)
; (gcd 6 4)
; (gcd 4 2)
; (gcd 2 0)
; Total 4 times of calling `remainder`

