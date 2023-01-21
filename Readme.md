# Assignment1
## Pranjal Baranwal
## 200101083
1. [Set A](#set-a)
    1. [Problem Statement](#problem-statement-14)
    2. [Instructions for running](#instructions-for-running)
    3. [Example execution](#example-execution)
2. [Set B](#set-B)
    1. [Problem Statement](#problem-statement-12)
    2. [Instructions for running](#instructions-for-running-set-b)
    3. [Example execution](#example-execution-set-b)
---
## Set A 
### Problem Statement 14
*Read two single dimensional sorted arrays of size n and generate a 2n sized single
dimensional sorted array.*

There are 3 files:

- SetA.asm
- SetA.o
- SetA

### Instructions for running

- `nasm -f elf64 SetA.asm`
- `gcc -m64 -no-pie SetA.o -o SetA`
- `./SetA`

Then you will be asked to enter the number n as in question and give elements of list 1 and list 2

### Example execution:
```C
Enter number of elements: 5
Enter list1 elements: 10 20 30 40 50
Enter list2 elements: 20 25 30 35 40
The final merged output: 10 20 20 25 30 30 35 40 40 50
```
---

## Set B
### Problem Statement 12
*Given an array of size n, take inputs from the user and add them to the array only if
they satisfy the following conditions: it is a prime and it is a non-duplicate number.
The program stops taking inputs when the array is full. Print the resultant array.*

There are 3 files:

- SetB.asm
- SetB.o
- SetB

### Instructions for running SET B

- `nasm -f elf64 SetB.asm`
- `gcc -m64 -no-pie SetB.o -o SetB`
- `./SetB`

Then you will be asked to input n as in quetion the giving the number one by one until the array becomes full.

### Example Execution Set B
```C
Enter number of elements: 10
Enter the elements one by one : 3
Number added to the array
5
Number added to the array
7
Number added to the array
6
Either not a prime or already present
5
Either not a prime or already present
3
Either not a prime or already present
12
Either not a prime or already present
17
Number added to the array
19
Number added to the array
23
Number added to the array
29
Number added to the array
97
Number added to the array
17
Either not a prime or already present
23
Either not a prime or already present
29
Either not a prime or already present
31
Number added to the array
37
Number added to the array
The final array is as follows: 3 5 7 17 19 23 29 97 31 37 
```