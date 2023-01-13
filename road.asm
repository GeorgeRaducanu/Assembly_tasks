%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
    ;; Your code starts here
    ; the program uses the same principle desctibed in task 2.1
    ; but it does not call the function, it is a ground-up implementation

    xor esi, esi
    ; esi index
for:
    xor edx, edx
    xor edi, edi
    mov dx, word[eax + 4 * esi]

    xor edi, edi
    mov di, word[eax + 4 * esi + 2]
    add edx, edi

    xor edi, edi
    mov di, word[eax + 4 * esi + 4]
    sub edx, edi

    xor edi, edi
    mov di, word[eax + 4 * esi + 6]
    sub edx, edi

    inc esi
    ; increment index
    cmp edx, 0
    jg sar
    xor edi, edi
    xchg edi, edx
    sub edx, edi
sar:
    ; in edx we have now the final result
    mov [ebx + 4 * (esi - 1)], edx
    ; write the final result to memory
    cmp esi, ecx
    jne for
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY