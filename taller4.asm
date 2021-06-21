 org  100h

        section .text
        ;Puntero 
        MOV BP, arrNum

        ;Registros inicializados en 0 
        XOR SI,SI 
        XOR CX,CX
        XOR DI,DI
        XOR DX,DX

        ;Llamada a la función 
        CALL OddEven

        int 20h

        section .data
;Arreglo 
arrNum DB 3,2,9,8,5,7,1,4,6,3 ;10 numeros de 1 al 9
mov ah, 00
mov al, 03h
int 10h
call arrNum
 
mov ah, 09h
lea dx, msn1
int 21h
 
;leer y convertir el numero  para verlo en pantalla
 
mov ah,01h
int 21h
sub al, 30h; para convertir en ascii y visualizarlo
 
mov var1, al
int 21h
sub al, 30h
mov ah, var1
 
mov bl, var1
 
cmp bl,1
 
 
JP PAR ; si es par
JNP IMPAR; si es impar
 
;cuando es par que muestre en el msn2
PAR:
mov ah,09h
lea dx, msn2
int 21h
jmp salir
 
;cuando es impar mostrar el msn3
IMPAR:
mov ah,09h
lea dx, msn3
int 21h
jmp salir
 
 
; salir del programa
salir:
mov ax, 4c00h
int 21h
inicio endp
end inicio