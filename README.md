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
3. Add extra number to number list and amend current solution as required
 - [ ] Get all possible combinations of number list with extra number
 - [ ] Get all possible combinations of number lists and operators - will require changes to functions (look at Reverse Polish Notation)
 - [ ] Work out all possible calculations
 - [ ] Check which calculations (if any) equal target number
 - [ ] Output all solutions
 
 ### Reverse Polish Notation
 
I have begun to look at Reverse Polish Notation to try to get all permutations of operators and operands.  

 
 ### Information Sources
 The Scheme documentations found [here](http://schemers.org/Documents/Standards/R5RS//HTML/r5rs-Z-H-15.html#%_index_start) has been invaluable while working on this project!
