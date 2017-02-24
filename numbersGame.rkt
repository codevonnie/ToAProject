#lang racket

; Theory of Algorithms 4th Year Project
; Author Yvonne Grealy

(define ops '(+ - * /))
(define nums (list 5 25))
(define a 5)
(define b 25)
(define t 125)


; Get all permutations of list of 2 with operator
; ********* INFINTE LOOP **************
;(permutations (list
;           (+ a b)
;           (+ b a)
;           (- a b)
;           (- b a)
;           (* a b)
;           (* b a)
;           (/ a b)
;           (/ b a)
;           ))

; print out all possible combinations hard coded
(define something (list
           (+ a b)
           (+ b a)
           (- a b)
           (- b a)
           (* a b)
           (* b a)
           (/ a b)
           (/ b a)
           ))
;something


; prints out '((
;  (+)
;  (-)
;  (+ -)
;  (*)
;  (+ *)
;  (- *)
;  (+ - *)
;  (/)
;  (+ /)
;  (- /)
;  (+ - /)
;  (* /)
;  (+ * /)
;  (- * /)
;  (+ - * /))
;(combinations ops)

; '((5 25))
;(combinations nums 2)

; prints out '((+ 5) (+ 25) (- 5) (- 25) (* 5) (* 25) (/ 5) (/ 25))
(define all (cartesian-product ops nums))
;all

; ********* INFINTE LOOP **************
;(permutations all)

; prints out '((5 25) (25 5))
(define num (permutations (list 5 25)))
 ;num

; prints out '((+ (5 25)) (+ (25 5)) (- (5 25)) (- (25 5)) (* (5 25)) (* (25 5)) (/ (5 25)) (/ (25 5)))
;(cartesian-product ops num)

; prints out '((+ 5 5)
;  (+ 5 25)
;  (+ 25 5)
;  (+ 25 25)
;  (- 5 5)
;  (- 5 25)
;  (- 25 5)
;  (- 25 25)
;  (* 5 5)
;  (* 5 25)
;  (* 25 5)
;  (* 25 25)
;  (/ 5 5)
;  (/ 5 25)
;  (/ 25 5)
;  (/ 25 25))
(define allCart (cartesian-product ops (list 5 25) (list 5 25)))
allCart

