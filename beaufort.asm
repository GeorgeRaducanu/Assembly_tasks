%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    ; I utilized the direct mathematical formula instead of accesing every time
    ; the tabula_recta matrix
    xor esi, esi; esi as index

foor:
	xor eax, eax
	mov eax, esi
    
	mod1:
    cmp eax, [ebp + 16]
    jl out_mod1
    sub eax, [ebp + 16]
    jmp mod1
out_mod1:

	; in eax I now have esi % len_key
	; in ecx I am going to put key[eax]
	xor edi, edi
	xor ecx, ecx
	mov edi, [ebp + 20]
	mov cl, byte[edi + eax]
	xor edx, edx
	; in edx I now have plain[esi]
	xor edi, edi
	mov edi, [ebp + 12]
	mov dl, byte [edi + esi]
	add ecx, dword 26
	sub ecx, edx
    ; in ecx we have the value

	mod2:
	cmp ecx, dword 26
	jl out_mod2
	sub ecx, dword 26
	jmp mod2
out_mod2:
	; in ecx we have "the good_stuff now"
	add ecx, dword 64
    ; add 64 (ascii code for A is 65)
	add ecx, dword 1
    ; add 1 now because the modulo operations were from 0
	xor edi, edi
	mov edi, [ebp + 28]
	mov [edi + esi], byte cl
    ; write into memory the value
    inc esi
    cmp esi, [ebp + 8]
    jne foor
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
