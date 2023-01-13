%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor edx, edx
    xchg edx, eax
    ; store in edx nr
    xor esi, esi
    xor edi, edi
    ; clean esi, edi
for1:
    mov [ecx + 4 * esi], edi
    inc esi
    cmp esi, edx
    jl for1
; the above for basically writes 0 in all the vector

    xor esi, esi
    xor edi, edi

for2:
	xor edi, edi

label1:
    ; in this section we use the classic algorithm
    ; for detemining if a number is perfect square using d*d < n method
	xor eax, eax	
	mov eax, edi
	mul al
	inc edi
	cmp eax, [ebx + 4 * esi]
	jl label1
	cmp eax, [ebx + 4 * esi]
	jne label2
	mov [ecx + 4 * esi], dword 1

label2:

	inc esi
	cmp esi, edx
	jl for2
    ;; Your code ends here
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY