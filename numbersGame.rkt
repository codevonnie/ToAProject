#lang racket

; Theory of Algorithms 4th Year Project
; Author Yvonne Grealy

(define ops '(+ - * /)) ; list of operators
;(define nums (list 5 25))
; all possible numbers for number list
(define numList (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))
; min and max values for target number
(define low 101) 
(define high 999)

; shuffle number list for selection of 6 numbers
(define possNums (shuffle numList))

; function to take n numbers from the shuffled list of numbers
(define (getNumList l a)
  (if (= (length a) 3) ; last number is how many numbers will be taken from list
      a
      (getNumList (cdr l)(cons (car l) a)))); take first number

; returned number list assigned to nList
(define nList (getNumList possNums null))

; target number generated using random function with range (101-999)
(define target (random low high))
target

; prints out '((5 25) (25 5))
(define num (permutations nList))
;num

;(cartesian-product ops ops num)

; prints out '((+ 5 5)(+ 5 25)(+ 25 5)(+ 25 25)(- 5 5)(- 5 25)(- 25 5)(- 25 25)(* 5 5)(* 5 25)(* 25 5)(* 25 25)(/ 5 5)(/ 5 25)(/ 25 5)/ 25 25))
(define allCart (cartesian-product num ops ops))
 allCart

; TESTING METHOD TO GET LIST OF POSSIBLE COMBINATIONS OF NUMBERS AND OPERATORS WITHOUT
; HARDCODING AS ABOVE

;(define (getCartProd l a)
;  (if (null? l)
;      a
;      (getCartProd (cdr l)(append (cartesian-product ops (car l)) a))))
;
;(define allCartP (getCartProd num null))
;
;allCartP

; define namespace to use eval on allCart list
(define ns (make-base-namespace))

; recursive function that takes in list of all possible calculations, evals each and
; checks if it is equal to the target number.  If it is, add to list and recursively
; call itself else don't add anything to list and call itself
(define (getList l a)
  (if (null? l)
      a
      (if (equal? target (eval (car l) ns))
         (getList (cdr l)(cons (car l) a))
         (getList (cdr l) a))))
       


; define function to call that automatically fills in null list for getList
(define (returnList l) (getList l null))

; define variable answers to be the returned list from getList function
;(define answers (returnList allCart))

; print answers
;answers

;(cdr allCart)
;(equal? target (eval (car allCart) ns))




;-------------------RPN STUFF------------------------

(define output (list 1 2 3))
(define start-perm (list -1 -1 -1 -1 1 1 1 1))

(define perms (remove-duplicates (permutations start-perm)))

(define (make-rpn l)
  (append (list 1 1) l (list -1)))

;(make-rpn (car  perms))

(define permsList (map make-rpn perms))

(define (valid-rpn? expression [stack 0]) ;[arg 0] optional argument defaults to 0 if not passed
  (if (null? expression)
      (if (= stack 1) #t #f)
      (if (= (car expression) 1)
          (valid-rpn? (cdr expression) (+ 1 stack))
          (valid-rpn? (cdr expression)(- 1 stack)) ;decrement s by one
          )))

(define myList (map valid-rpn? permsList))
myList

;permsList

; add to readme - how many possible combinations of operators and numbers 11! = 39916800 with duplicates
; 462 distinct combinations

;(define ops(list '+ '- '* '/))
;
;(define opsList (cartesian-product ops ops ops ops ops))
;(define numList (permutations (list 25 100 50 1 1 2)))
;
;(define comboList (cartesian-product opsList numList))
;comboList











;*********************NOT BEING USED ATM*********************************


; expression finds first example of element and returns it
;(findf (lambda (arg)
;              (= arg t))
;       answers)

; Get all permutations of list of 2 with operator
; ********* INFINTE LOOP **************
;(permutations (list (+ a b)(+ b a)(- a b)(- b a)(* a b)(* b a)(/ a b)(/ b a)))

; print out all possible combinations hard coded
;(define something (list (+ a b)(+ b a)(- a b)(- b a)(* a b)(* b a)(/ a b)(/ b a)))
;something


; prints out '(( (+)(-)(+ -)(*)(+ *)(- *)(+ - *)(/)(+ /)(- /)(+ - /)(* /)(+ * /)(- * /)(+ - * /))
;(combinations ops)

; '((5 25))
;(combinations nums 2)

; prints out '((+ 5) (+ 25) (- 5) (- 25) (* 5) (* 25) (/ 5) (/ 25))
;(define all (cartesian-product ops nums))
;all

; ********* INFINTE LOOP **************
;(permutations all)

; prints out '((+ (5 25)) (+ (25 5)) (- (5 25)) (- (25 5)) (* (5 25)) (* (25 5)) (/ (5 25)) (/ (25 5)))
;(cartesian-product ops num)