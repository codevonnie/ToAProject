#lang racket

; Theory of Algorithms 4th Year Project
; Author Yvonne Grealy

;(define ops '(+ - * /)) ; list of operators
(define ops '(+ - *)) ; list of operators

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

; target number generated using random function with range (101-999)
(define target (random low high))
(printf "Target number: ~v" target)

; returned number list assigned to nList
(define nList (getNumList possNums null))
(printf "   List of numbers: ~v" nList)

; get all possible permutations of numbers in list
(define numList (remove-duplicates (permutations nList)))

; get all possible variants of operators
(define operators (cartesian-product ops ops ops ops ops))

; get list of possible operators and numbers
(define comboList (cartesian-product numList operators))

; make one list of each combination of operands and operators
(define (flattenList l)
  (flatten l))

(define tempList (map flattenList comboList))

; Input list too long - this will not run!!!!!!
;(define permus (remove-duplicates (permutations tempList)))

;(define (valid-rpn? expression [s 0] [stack '()]) ;[arg 0] optional argument defaults to 0 if not passed
;  (if (null? expression) ;if expression list is empty
;      (if (= s 1) #f s) ;if stack is equal to 1 return stack else return false
;      (if (number? (car expression)) ;if element is a number
;          (valid-rpn? (cdr expression)(+ 1 s)(append stack (list (car expression)))) ;add 1 to s, add car of exp to stack and recursive call
;          (valid-rpn? (cdr expression)(- 1 s)(append stack (list (car expression)))) ;take 1 from s, add car of exp to stack and recursive call
;          )))
;
;(define myList (map valid-rpn? tempList))
;(define validRPN (remove* (list #f) myList))
;validRPN

;(define l (map stuff comboList))



;https://gist.github.com/darkf/3335005
;(define (eval-rpn expr [stack '()])
;  (cond
;    [(empty? expr) stack] ;; we're done, return the stack
;    [(number? (car expr)) ;; number
;      (eval-rpn (cdr expr) (cons (car expr) stack))] ;; push number on the stack
;    [(op? (car expr)) ;; operation
;      (let* ([op (car expr)]
;             [rhs (car stack)]
;             [lhs (cadr stack)]
;             [result ((op->procedure op) lhs rhs)]) ;; eval operation
;       (eval-rpn (cdr expr) (cons result (cddr stack))))] ;; push result; pop lhs/rhs
;    [else (error "unknown symbol")]))

;https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket
(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    ;(printf "~a\t -> ~a~N" token stack)
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     ;[('/ (list x y s ___)) (cons (/ y x) s)]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))

(define calculate (map calculate-RPN tempList))

; check if the target is equal to any of the outputs from calculate-RPN function
(define (isTarget? exp)
  (if (null? exp)
      exp
      (if (equal? target (car exp)) #t #f)))

(define checkTarget (map checkTarget calculate))


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
; check if the target is equal to any of the outputs from calculate-RPN function

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


;**********************RPN STUFF**********************************

(define start-perm (list -1 -1 -1 -1 1 1 1 1))

(define perms (remove-duplicates (permutations start-perm)))

;(define (make-rpn l)
;  (append (list 1 1) l (list -1)))
;
;(define permsList (map make-rpn perms))


;(define (valid-rpn? expression [s 0] [stack '()]) ;[arg 0] optional argument defaults to 0 if not passed
;  (if (null? expression) ;if expression list is empty
;      (if (= s 1) stack #f) ;if stack is equal to 1 return stack else return false
;      (if (= (car expression) 1) ;if element is 1
;          (valid-rpn? (cdr expression)(+ 1 s)(append stack (list (car expression)))) ;add 1 to s, add car of exp to stack and recursive call
;          (valid-rpn? (cdr expression)(- 1 s)(append stack (list (car expression)))) ;take 1 from s, add car of exp to stack and recursive call
;          )))
;
;(define myList (map valid-rpn? permsList))
;(define validRPN (remove* (list #f) myList))

;validRPN

;comboList

; try to convert 1s and -1 lists to operands and operators
;(define (rpnImplementer l a [imp '()])
;  (if (null? l)
;      imp
;      (if (= (car l) 1)
;          (rpnImplementer (cdr validRPN)(append imp (list (caar l))))
;          (rpnImplementer (cdr validRPN)(append imp (list (car l))))
;      )))
;
;(define impl (map rpnImplementer comboList validRPN))

;(length impl)

;(length validRPN)
;






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