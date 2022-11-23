[BITS 64]
[GLOBAL __CR2]

SECTION .TEXT
__CR2:
	mov rax, cr2
	ret	
