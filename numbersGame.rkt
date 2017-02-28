#lang racket

; Theory of Algorithms 4th Year Project
; Author Yvonne Grealy

(define ops '(+ - * /))
(define nums (list 5 25))
(define numList (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))
(define a 5)
(define b 25)
(define t 125)


; Get all permutations of list of 2 with operator
; ********* INFINTE LOOP **************
;(permutations (list (+ a b)(+ b a)(- a b)(- b a)(* a b)(* b a)(/ a b)(/ b a)))

; print out all possible combinations hard coded
(define something (list (+ a b)(+ b a)(- a b)(- b a)(* a b)(* b a)(/ a b)(/ b a)))
;something


; prints out '(( (+)(-)(+ -)(*)(+ *)(- *)(+ - *)(/)(+ /)(- /)(+ - /)(* /)(+ * /)(- * /)(+ - * /))
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

; prints out '((+ 5 5)(+ 5 25)(+ 25 5)(+ 25 25)(- 5 5)(- 5 25)(- 25 5)(- 25 25)(* 5 5)(* 5 25)(* 25 5)(* 25 25)(/ 5 5)(/ 5 25)(/ 25 5)/ 25 25))
(define allCart (cartesian-product ops (list 5 25) (list 5 25)))
; allCart


; define namespace to use eval on allCart list
(define ns (make-base-namespace))

; function that checks if current calculation is equal to target number
; returns calculation if it is or 0 if it is not equal
;(define (checkTarget a)
;  (if (equal? t (eval a ns))
;      a
;      null
;      ))

; recursive function that takes in the list of possible calculations, calls checkTarget
; function on each calculation and fills a second list with the solutions (if any)
;(define (getList l a)
;  (if (null? l)
;      a
;      (getList (cdr l)(cons (checkTarget(car l)) a))))


; recursive function that takes in list of all possible calculations, evals each and
; checks if it is equal to the target number.  If it is, add to list and recursively
; call itself else don't add anything to list and call itself
(define (getList l a)
  (if (null? l)
      a
      (if (equal? t (eval (car l) ns))
         (getList (cdr l)(cons (car l) a))
         (getList (cdr l) a))))
       


; define function to call that automatically fills in null list for getList
(define (returnList l) (getList l null))

; define variable answers to be the returned list from getList function
(define answers (returnList allCart))

; print answers
answers


      









; expression finds first example of element and returns it
;(findf (lambda (arg)
;              (= arg t))
;       answers)



