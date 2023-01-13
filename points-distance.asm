%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    ; I implemented the code with a small mathematics trick
    ; because it is garanteed that both points are on lines paralel to OX and OY
    ; in order to calculate the distance i calculated p1.x + p1.y - p2.x - p2.y
    ; and the distance is d = abs(ans)
    ; the following lines implement the procedure described, and I think it is
    ; more efficient because i use only one cmp/jg = if, the rest of the code is only mov, add, sub and xor

    ; clear the registers
    xor ecx, ecx
    xor edx, edx
    mov cx, word[ebx + 2 * 0]
    ; mov in cx p1.x
    mov dx, word[ebx + 2 * 1]
    ; mov in dx p1.y

    add ecx, edx
    ; in ecx = p1.x + p1.y

    xor edx, edx
    ; clear edx

    mov dx, word[ebx + 2 * 2]
    ; mov in dx p2.x

    sub ecx, edx
    ; in ecx  = p1.x + p1.y - p2.x

    xor edx, edx
    ; clear edx

    mov dx, word[ebx + 2 * 3]
    ; mov in dx p2.y

    sub ecx, edx
    ; in ecx  = p1.x + p1.y - p2.x - p2.y

    cmp ecx, 0
    jg sar
    xor edx, edx
    xchg ecx, edx
    sub ecx, edx
sar:
    ; simple abs function with a touch of xchg
    mov [eax], ecx
    ; the final result is obtained
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY