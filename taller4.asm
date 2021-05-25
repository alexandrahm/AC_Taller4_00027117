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

;Para encontrar los numeros pares se dividen entre 2, se define la constante 

;Función general(contiene el recorrido del arreglo, y las comprobaciones de par e impar)
OddEven:
        ;Para saber que es par: 
        MOV BL, 02d

;funcion de recorrido
R:
        ;Si el SI es igual a 10, entonces termina el proceso y salta a End 
        CMP SI, 10
        JE End
        ;Limpiando AH
        XOR AH,AH
        ;Se mueve al registro AL
        MOV AL,[BP+SI]
        ;Se copia el dato de AL en BH
        MOV BH,AL
        DIV BL
        ;Se incrementa el valor de SI
        INC SI
        ;Se compara el residuo de la division
        ;Si el residio (AH) es 0 salta a Even y si es distinto de 0 salta a Odd
        CMP AH,0
        JE Even
        JNE Odd

;Pproceso de numeros pares
Even:
        ;CX= 0
        MOV DI,CX
        ;Se mueve el valor que se copio en BH a la direccion de memoria
        MOV[300h+DI], BH
        ;Se incrementa el DI 
        INC DI 
        ;Se mueve el valor de DI ya incrementado a CX 
        MOV CX,DI
        ;Salto a R para comprobar lo demás
        JMP R

;Procesos de numeros impares
Odd:
        ;Se repite el mismo proceso que con los numeros pares
        ;Se mueve el valor que se copio en BH a la drieccion de memoria, en este caso 0320H
        ;Para los impares se utilizara el registro DX en lugar de CX
        MOV DI,DX
        MOV[320h+DI], BH
        INC DI 
        MOV DX,DI
        JMP R

;Finalización 
End:
        RET