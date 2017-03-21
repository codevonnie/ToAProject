#lang racket

; Theory of Algorithms 4th Year Project
; Author Yvonne Grealy

(define ops '(+ - * /)) ; list of operators
; all possible numbers for number list
(define nums (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))
; min and max values for target number
(define low 101) 
(define high 999)

; shuffle number list for selection of 6 numbers
(define possNums (shuffle nums))

; function to take n numbers from the shuffled list of numbers
(define (getNumList l a)
  (if (= (length a) 6) ; last number is how many numbers will be taken from list
      a
      (getNumList (cdr l)(cons (car l) a)))); take first number

; returned number list assigned to nList
(define nList (getNumList possNums null))

; get all possible permutations of numbers in lest
(define numList (remove-duplicates (permutations nList)))

; target number generated using random function with range (101-999)
(define target (random low high))
target


; get all possible variants of operators
(define operators (cartesian-product ops ops ops ops ops))

operators


; get list of possible operators and numbers
(define comboList (cartesian-product operators numList))


;-------------------RPN STUFF------------------------

; Reverse Polish Notation list : 1 represents operands -1 represents operators
(define start-perm (list -1 -1 -1 -1 1 1 1 1))

; get all permutations of RPN list and remove any duplicates
(define perms (remove-duplicates (permutations start-perm)))

; function to make sure each RPN entry begins with 2 operands and ends with an operator
(define (make-rpn l)
  (append (list 1 1) l (list -1)))

; permsList contains all the RPN entries
(define permsList (map make-rpn perms))

; function to check if RPN lists are valid
(define (valid-rpn? expression [s 0] [stack '()]) ;[s 0] - stack counter, starts at default 0 [stack '()] - empty stack list, defaults as empty
  (if (null? expression) ;if expression list is empty
      (if (= s 1) stack #f) ; and if stack is equal to 1 return stack else return false
      (if (= (car expression) 1) ;if element is equal to 1
          (valid-rpn? (cdr expression)(+ 1 s)(append stack (list (car expression)))) ;add 1 to s, add car of exp to stack and recursively call function
          (valid-rpn? (cdr expression)(- 1 s)(append stack (list (car expression)))) ;take 1 from s, add car of exp to stack and recursive call function
          )))

; myList contains all valid RPN and #f values
(define myList (map valid-rpn? permsList))
; removes all #f entries from list so only valid RPN remains
(define validRPN (remove* (list #f) myList))

;validRPN

; function to replace all valid RPN list of 1 and -1 with actual operands and operators
(define (rpnImplementer l a [imp '()])
  (if (null? l)
      imp
      (if (= (car l) 1)
          (rpnImplementer (cdr validRPN)(append imp (list (caar l))))
          (rpnImplementer (cdr validRPN)(append imp (list (car l))))
      )))

;(define impl (map rpnImplementer comboList validRPN))

;(length impl)

(length validRPN)



; prints out '((+ 5 5)(+ 5 25)(+ 25 5)(+ 25 25)(- 5 5)(- 5 25)(- 25 5)(- 25 25)(* 5 5)(* 5 25)(* 25 5)(* 25 25)(/ 5 5)(/ 5 25)(/ 25 5)/ 25 25))
;(define allCart (cartesian-product num ops ops))
; allCart

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
;(define (getList l a)
;  (if (null? l)
;      a
;      (if (equal? target (eval (car l) ns))
;         (getList (cdr l)(cons (car l) a))
;         (getList (cdr l) a))))
;       
;
;
;; define function to call that automatically fills in null list for getList
;(define (returnList l) (getList l null))
;
;; define variable answers to be the returned list from getList function
;(define answers (returnList allCart))

; print answers
;answers

;(cdr allCart)
;(equal? target (eval (car allCart) ns))




;-------------------RPN STUFF------------------------

;(define output (list 1 2 3))
;(define start-perm (list -1 -1 -1 -1 1 1 1 1))
;
;(define perms (remove-duplicates (permutations start-perm)))
;
;(define (make-rpn l)
;  (append (list 1 1) l (list -1)))
;
;;(make-rpn (car  perms))
;
;(define permsList (map make-rpn perms))
;
;(define (valid-rpn? expression [s 0] [stack '()]) ;[arg 0] optional argument defaults to 0 if not passed
;  (if (null? expression) ;if expression list is empty
;      (if (= s 1) stack #f) ;if stack is equal to 1 return stack else return false
;      (if (= (car expression) 1) ;if element is 1
;          (valid-rpn? (cdr expression)(+ 1 s)(append stack (list (car expression)))) ;add 1 to s, add car of exp to stack and recursive call
;          (valid-rpn? (cdr expression)(- 1 s)(append stack (list (car expression)))) ;take 1 from s, add car of exp to stack and recursive call
;          )))
;
;(define myList (map valid-rpn? permsList))
;myList

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