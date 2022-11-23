[GLOBAL __FPU_TEST]

[EXTERN CR0_TS]
[EXTERN CR0_EM]

SECTION .TEXT
__FPU_TEST:
	; Configure the Control Register 0
	; To probe the x87.
	; We clear the TS, and EM 
	MOV EDX, CR0
	AND EDX, [CR0_TS]
	AND EDX, [CR0_EM]
	MOV CR0, EDX

	FNINIT
	FNSTSW [TESTWORD]
	CMP WORD [TESTWORD], 0
	JNE __NO_FPU
	MOV EAX, 0
	RET
	
	__NO_FPU:
		MOV EAX, 5
		RET

SECTION .DATA
TESTWORD: DW 0x55AA ; We store garbage and check for a change.

