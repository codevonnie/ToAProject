# Theory of Algorithms 4th Year Project
## Author: Yvonne Grealy

### Introduction

This project is for the module Theory of Algorithms for 4th year BSc in Software Development at Galway Mayo Institute of Technology.  It is written in the Racket functional programming language.

###Summary of Project
The aim of the project is to produce a Racket solution to a game that works as follows:

1. 6 random numbers are chosen from a list of 24 possible numbers:

   [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100]
   
2. A target number is generated between 101 and 999 inclusive.
3. Using the four basic operators, + - * / , with the list of 6 numbers, all solutions to the find the given target number must be computed.

There are a number of conditions that affect how the solution can be arrived at:

* Each of the 6 numbers in the list can only be used once.
* Negative numbers are not allowed.
* Fractions are not allowed.

An example of the game would be the random list [100, 25, 2, 8, 3, 4] with a target number of 778.  A solution for this calculation is (100*8)-25-3.  The steps in this calculation are:

* 100 multiplied by 8 gives 800
* 25 minus 3 gives 22
* 800 minus 22 gives the target number of 778

### Algorithm Building

There are a number of steps I am taking in trying to figure out an algorithm to solve this problem.

1. Simplify the problem
 * Try to work out the solution using two numbers and an obtainable target number
 * The numbers I am working with are (5, 25) with a target number of 125
  - [x] Get all possible combinations of the number list i.e. (5, 25) (25, 5)
  - [x] Get all possible combinations of the above lists with each of the operators (+ - * /)
  - [x] Work out all the possible calculations
  - [x] Check which of the calculations give an answer equal to the target number
  - [x] Output all solutions
2. Extra functions
  - [x] Function to get random numbers from number list (how many numbers can be selected can be amended)
  - [x] Function to get random target number from 101-999
3. Reverse Polish Notation
 - [x] Get all possible combinations of number list with 6 numbers
 - [x] Get all possible combinations of number lists and operators 
 - [x] Get all valid RPN lists using substitutes for operands and operators (1 denotes operand, 
 - [ ] Replace valid RPN list with actual operands and operators
 - [ ] Write function to calculate each list
 - [ ] Check which calculations (if any) equal target number
 - [ ] Output all solutions
 
 ### Reverse Polish Notation
 
I have begun to look at Reverse Polish Notation to try to get all permutations of operators and operands.  Reverse Polish Notation (RPN) is used to represent expressions where the operator is placed after the operands.  RPN allows the expressions to be written without brackets.  An RPN expression is carried out using a stack like notion where a operand will be pushed to the stack and an operator will cause 2 operands to be popped off the stack and the operator will be applied to the two numbers.  The result is then pushed back on the stack.  If an operator occurs and there is not 2 operands on the stack to be popped then the expression is not a valid RPN expression.  This also applies if the first arguement in the expression is an operator.   

And example of a valid RPN can be seen below:

> 8 2 4 + *

This expression is read from left to right and so it will be calculated as follows:

* 8 is pushed to the stack **[stack: 8]**
* 2 is pushed to the stack **[stack: 2 8]**
* 4 is pushed to the stack **[stack: 4 2 8]**
* \+ means 4 and 2 are popped from the stack and added together. The result 6 is pushed to the stack **[stack: 6 8]**
* \* causes 6 and 8 to be popped off the stack and multiplied by each other. The result 48 is pushed to the stack **[stack: 48]**
* The expression is finished so the result is popped off the stack **[stack: ]**

 
 ### Information Sources
 * The Racket documentation found [here](https://docs.racket-lang.org/reference/index.html) and the Scheme documentations found [here](http://schemers.org/Documents/Standards/R5RS//HTML/r5rs-Z-H-15.html#%_index_start) have been invaluable while working on this project!
 * Reverse Polish Notation information [click](http://mathworld.wolfram.com/ReversePolishNotation.html)
