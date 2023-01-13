%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor eax, eax
    ;clear register eax it will be used as index
label:
	xor ebx, ebx
    ; clear register ebx
	mov bl, byte[esi + eax]
    ; store in bl the character of index eax
	add ebx, edx
    ; apply ceaser algorithm for encryption
	cmp ebx, 91
    ; we used 91 which in ascii is "[" right after Z

	jl sar
	sub ebx, 26
    ; subtract 26 from character to bring it to range
sar:

	mov byte[edi + eax], bl
    ; write in memory the new value

	inc eax
    ;increment index
	cmp eax, ecx
	jne label

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
