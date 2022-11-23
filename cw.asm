[GLOBAL __FPU_LOAD_CW]
[GLOBAL __FPU_RESTORE_CW]

;
; CW stands for Control Word.
; It tells how the FPU will treat the floating point number when put inside the register.
;

SECTION .TEXT
; EBP-8: CW to save
; EBP-4: CW to set.

__FPU_LOAD_CW:
	FSTCW [EBP-8]
	
	FWAIT
	MOV AX, [EBP-8]
	AND AX, 0f3ffh
	OR AX, 0c00h

	PUSH EAX
	FLDCW [EBP-4]
	POP EAX

	RET ; We should be able to return here.

; EBP-4: The CW.
__FPU_RESTORE_CW:
	PUSH EAX
	FLDCW [EBP-4]
	POP EAX

	RET


