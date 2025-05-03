
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
  include emu8086.inc

.model small
.data
firstNum db 0
secondNum db 0
operation db 0
remainder db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    print "Enter first number (0-9): "
    mov ah, 1
    int 21h
    sub al, 48
    mov firstNum, al

    printn ""
    print "Enter second number (0-9): "
    mov ah, 1
    int 21h
    sub al, 48
    mov secondNum, al

    printn ""
    printn "1. Addition"
    printn "2. Subtraction"
    printn "3. Multiplication"
    printn "4. Division"
    printn ""
    print "Choose operation: "
    mov ah, 1
    int 21h
    sub al, 48
    mov operation, al

    cmp operation, 1
    je addition
    cmp operation, 2
    je subtraction
    cmp operation, 3
    je multiplication
    cmp operation, 4
    je division

addition:
    mov al, firstNum
    add al, secondNum
    add al, 48
    printn ""
    print "Addition is: "
    mov dl, al
    mov ah, 2
    int 21h
    jmp exit

subtraction:
    mov al, firstNum
    sub al, secondNum
    add al, 48
    printn ""
    print "Subtraction is: "
    mov dl, al
    mov ah, 2
    int 21h
    jmp exit

multiplication:
    mov al, firstNum
    mul secondNum
    mov ah, 0
    mov bl, 10
    div bl            ; AL = quotient, AH = remainder
    mov remainder, ah
    add al, 48
    mov dl, al
    printn ""
    print "Multiplication is: "
    mov ah, 2
    int 21h

    mov dl, '.'
    int 21h

    mov dl, remainder
    add dl, 48
    int 21h
    jmp exit

division:
    mov ah, 0
    mov al, firstNum
    div secondNum
    add al, 48
    printn ""
    print "Division is: "
    mov dl, al
    mov ah, 2
    int 21h
    jmp exit

exit:
    mov ah, 4ch
    int 21h

main endp
end main

ret




