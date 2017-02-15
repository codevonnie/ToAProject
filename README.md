# Theory of Algorithms 4th Year Project
## Author: Yvonne Grealy

###Introduction

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

