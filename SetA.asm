;*************************************************
;Name: Pranjal Baranwal
;Roll No. 200101083
;Set A Problem 14
;Read two single dimensional sorted arrays of size n and generate a 2n sized single
;dimensional sorted array.
;*************************************************
section .data
    inputformat dq "%d",0
    printformat dq "%d ",0
    list1input dq "Enter list1 elements: ",0
    list2input dq "Enter list2 elements: ",0
    newline dq 10
    input dq "Enter number of elements: ",0
    mergedoutput dq "The final merged output: ",0
; *******************************************************

global main
extern printf,scanf

;********************************************************
section .text
main:
    push rbp           ; Keep the stack aligned
    mov  rbp, rsp 
    sub rsp, 16        ;//must be 16 byte increments  to maintain state alignment

    xor eax,eax
    lea rdi, [input]
    call printf     
;   The above Three lines are equivalent to the following code
;   printf("Enter number of elements");
;   Input number of elements
    mov eax,0
    lea rdi, [inputformat]
    lea rsi, [number]
    call scanf

;   The above four lines are equivalent to
;   scanf("%d",&number);

;   Take input of the elements of list1
    
    xor eax,eax
    cmp eax,[number]
    je exit
    lea rdi, [newline]
    call printf
    xor eax,eax
    lea rdi, [list1input]
    call printf
    mov r12, 0
    mov r13, [number]
    loopinputlist1:
        xor eax,eax
        lea rdi, [inputformat]
        lea rsi, [list1+r12*8]
        call scanf
        inc r12
        ; call printf
        cmp r12, r13
        jl loopinputlist1

;   These lines(40-53) are equivalent to following lines of code
;   printf("Enter List 1 elements");
;   for(int i=0;i<number;i++)
;   scanf("%d",list1+i);

;   Take input of the elements of list2
    mov r12,0
    xor eax,eax
    lea rdi, [newline]
    call printf
    xor eax,eax
    lea rdi, [list2input]
    call printf
    loopinputlist2:
        xor eax,eax
        lea rdi, [inputformat]
        lea rsi, [list2+r12*8]
        call scanf
        inc r12
        ; call printf
        cmp r12, r13
        jl loopinputlist2
;   These lines(63-75) are equivalent to following lines of code
;   printf("Enter List 2 elements");
;   for(int i=0;i<number;i++)
;   scanf("%d",list2+i);

;   Print the elements from both of the lists until one of the lists get exhausted
    xor eax,eax
    lea rdi, [newline]
    call printf
    xor eax,eax
    lea rdi, [mergedoutput]
    call printf
    mov r15, 0
    mov r14, 0
    looplist:
        mov rax, 0
        mov r12, [list2+r14*8]
        mov r13, [list1+r15*8]
        lea rdi, [printformat]
        cmp r12, r13
        jg if
        jle else
        if:
            mov rsi, r13
            inc r15
            jmp label
        else:
            mov rsi, r12
            inc r14
        label:
            ; mov rdx, [number]
            mov rax,0
            call printf
        mov r12, [number]
        cmp r15, r12
        jge next
        cmp r14, r12
        jl looplist

;   Print the remaining elements of list1(if any)
    next:
        cmp r15, [number]
        je next2
    looplist1:
        mov rax,0
        mov rsi , [list1+r15*8]
        lea rdi, [printformat]
        call printf
        inc r15
        cmp r15, [number]
        jl looplist1

;   Print the remaining elements of list2 (if any)
    next2:
        cmp r14, [number]
        je exit
    looplist2:
        mov rax,0
        mov rsi , [list2+r14*8]
        lea rdi, [printformat]
        call printf
        inc r14
        cmp r14, [number]
        jl looplist2
;   The exit part of the code
    exit:
        add rsp,16
        leave
        ret
;*******************************************************************************
section .bss
    number: resq 1
    list1: resq 100
    list2: resq 100
;******************************************************************************
;******************************************************************************

; ╭━━━╮╱╱╱╱╭╮╱╱╱╱╭━╮╭━━━╮////////////////
; ┃╭━━╯╱╱╱╱┃┃╱╱╱╱┃╭╯┃╭━╮┃////////////////
; ┃╰━━┳━╮╭━╯┃╭━━┳╯╰╮┃╰━╯┣━┳━━┳━━┳━┳━━┳╮╭╮
; ┃╭━━┫╭╮┫╭╮┃┃╭╮┣╮╭╯┃╭━━┫╭┫╭╮┃╭╮┃╭┫╭╮┃╰╯┃
; ┃╰━━┫┃┃┃╰╯┃┃╰╯┃┃┃╱┃┃╱╱┃┃┃╰╯┃╰╯┃┃┃╭╮┃┃┃┃
; ╰━━━┻╯╰┻━━╯╰━━╯╰╯╱╰╯╱╱╰╯╰━━┻━╮┣╯╰╯╰┻┻┻╯
; ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┃////////
; ╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━╯////////