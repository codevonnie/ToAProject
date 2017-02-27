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

; recursive function that takes in the full combination of numbers and operators list and fills a second list with answers
(define (getList l a)
  (if (null? l)
      a
      (getList (cdr l)(cons (eval (car l) ns) a))))

; recursive function that checks if target value is in list of answers
(define (checkTarget l a t)
  (if (null? l)
      a
      (checkTarget (cdr l)(cons (equal? t (car l)) a) t)))


; define function to call that automatically fills in null list for getList
(define (gList l) (getList l null))

; define variable answers to be the returned list from getList function
(define answers (gList allCart))

; print answers
answers

;(define check (checkTarget answers null t))
;check

(checkTarget answers null t)

; expression finds first example of element and returns it
;(findf (lambda (arg)
;              (= arg t))
;       answers)



