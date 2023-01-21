;*************************************************
;Name: Pranjal Baranwal
;Roll No. 200101083
;Set B Problem 12
;Given an array of size n, take inputs from the user and add them to the array only if
;they satisfy the following conditions: it is a prime and it is a non-duplicate number.
;The program stops taking inputs when the array is full. Print the resultant array.
;*************************************************
section .data
    inputformat dq "%d",0
    printformat dq "%d ",0
    listinput dq "Enter the elements one by one : ",0
    newline dq 10
    added dq "Number added to the array",0
    notsatisfies dq "Either not a prime or already present",0
    input dq "Enter number of elements: ",0
    finalarray dq "The final array is as follows: "
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
    je exit     ;exit if given number is 0
    lea rdi, [newline]
    call printf ;prints a new line
    xor eax,eax
    lea rdi, [listinput]
    call printf ;prints "Enter the elements one by one"

    mov r12, 0
    mov r13, [number]
    mov qword[numberfinalout],0 ; Initializes current input size to 0
    mov r12,0
    looplist:
        xor eax,eax
        lea rdi, [inputformat]
        lea rsi, [listelement]
        call scanf              ; Takes input
        
        mov r14, [listelement]  
        mov r12,[number]
        inc r12                 ;r12=number+1 This statement is used later to check if the element is added to the array or not
        cmp r14, 1              ;1 is not a prime
        je looplistcontrol      
        cmp r14, 2
        je checkinoutarray      ;2 is a prime (directly specified)
        mov r15, 2              ;r15=2
        mov rax,0
        lea rdi, [printformat]
        
        ; mov rsi, r14
        ; call printf
        loopprimecheck:         ;This loop checks for prime
            mov rax, r14        ;rax=r14
            xor rdx,rdx         ;rdx=0
            cqo                 ;rax->rdx:rax
            div r15             ;Division with r15
            cmp rdx,0           ;if rdx i.e. r14%r15==0 jump out of loop
            je looplistcontrol  
            inc r15         
            mov r8,r15
            imul r8,r15
            cmp r8,r14
            jle loopprimecheck  ;jump if r15^2<= r14(original number)
        checkinoutarray:        ;checks if the number is already present in the array
            mov r15, 0
            cmp qword[numberfinalout],0
            je storeinoutputarray
            loopout:
                cmp r14,[finalout+r15*8]
                je looplistcontrol
                inc r15
                cmp r15,[numberfinalout]
                jl loopout
            storeinoutputarray: ;stores the element in the output array and prints the message "Number added to the array"
                mov qword[finalout+r15*8],r14
                inc r15
                mov qword[numberfinalout],r15
                xor eax,eax
                lea rdi, [added]
                call printf
                xor eax,eax
                lea rdi,[newline]
                call printf
                mov r12,[numberfinalout]    ;update r12 so that it does not print in looplistcontrol
        looplistcontrol:                    ; if number of elements in array < n run the loop again
            cmp r12,[numberfinalout]
            je update
            xor eax,eax
            lea rdi,[notsatisfies]          ; prints "Either not a prime of already present"
            call printf
            xor eax,eax
            lea rdi, [newline]
            call printf
            update:
            cmp qword[numberfinalout],r13
            jl looplist
    xor eax,eax
    lea rdi,[finalarray]    ;prints "The final array is as follows"
    call printf
    mov r12,0
    mov r15,[numberfinalout]
    ;The below loop prints all the elements of the finalout array
    loopoutprint:
        xor eax,eax
        lea rdi,[printformat]
        mov rsi, [finalout+r12*8]
        call printf
        inc r12
        cmp r12,r15
        jl loopoutprint
;   The exit part of the code
    exit:
        add rsp,16
        leave
        ret
;*******************************************************************************
section .bss
    number: resq 1          ;size of final array
    listelement: resq 1            ;the input element
    finalout: resq 100      ;the array to store the elements
    numberfinalout: resq 1  ;current size of finaloutput array
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