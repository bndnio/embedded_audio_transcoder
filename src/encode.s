	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"encode.c"
	.text
	.align	2
	.global	conv_sign_mag
	.type	conv_sign_mag, %function
conv_sign_mag:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	mov	r3, r1
	strh	r3, [fp, #-22]	@ movhi
	mov	r3, #32512
	add	r3, r3, #123
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-22]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	str	r3, [fp, #-16]
	ldrsh	r3, [fp, #-22]
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-12]	@ movhi
	ldrh	r2, [fp, #-12]
	ldrh	r3, [fp, #-6]
	cmp	r3, r2
	bcs	.L2
	ldrh	r3, [fp, #-6]	@ movhi
	strh	r3, [fp, #-12]	@ movhi
.L2:
	ldrh	r3, [fp, #-12]
	add	r3, r3, #132
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-12]	@ movhi
	ldr	r2, [fp, #-28]
	sub	r3, fp, #16
	ldmia	r3, {r0, r1}
	stmia	r2, {r0, r1}
	ldr	r0, [fp, #-28]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	conv_sign_mag, .-conv_sign_mag
	.align	2
	.global	calc_chord
	.type	calc_chord, %function
calc_chord:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrh	r3, [fp, #-6]
	and	r3, r3, #16384
	cmp	r3, #0
	beq	.L5
	mov	r3, #7
	str	r3, [fp, #-12]
	b	.L6
.L5:
	ldrh	r3, [fp, #-6]
	and	r3, r3, #8192
	cmp	r3, #0
	beq	.L7
	mov	r3, #6
	str	r3, [fp, #-12]
	b	.L6
.L7:
	ldrh	r3, [fp, #-6]
	and	r3, r3, #4096
	cmp	r3, #0
	beq	.L8
	mov	r3, #5
	str	r3, [fp, #-12]
	b	.L6
.L8:
	ldrh	r3, [fp, #-6]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L9
	mov	r3, #4
	str	r3, [fp, #-12]
	b	.L6
.L9:
	ldrh	r3, [fp, #-6]
	and	r3, r3, #1024
	cmp	r3, #0
	beq	.L10
	mov	r3, #3
	str	r3, [fp, #-12]
	b	.L6
.L10:
	ldrh	r3, [fp, #-6]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L11
	mov	r3, #2
	str	r3, [fp, #-12]
	b	.L6
.L11:
	ldrh	r3, [fp, #-6]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L12
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L6
.L12:
	mov	r3, #0
	str	r3, [fp, #-12]
.L6:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	calc_chord, .-calc_chord
	.align	2
	.global	extract_steps
	.type	extract_steps, %function
extract_steps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	mov	r2, r1
	strh	r3, [fp, #-6]	@ movhi
	mov	r3, r2
	strb	r3, [fp, #-7]
	ldrh	r2, [fp, #-6]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	add	r3, r3, #3
	mov	r3, r2, asr r3
	and	r3, r3, #255
	and	r3, r3, #15
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	extract_steps, .-extract_steps
	.align	2
	.global	assemble_codeword
	.type	assemble_codeword, %function
assemble_codeword:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, r1
	strb	r3, [fp, #-17]
	mov	r3, r2
	strb	r3, [fp, #-18]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	mov	r3, r3, asl #7
	and	r2, r3, #255
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	orr	r3, r2, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-18]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r2
	orr	r3, r1, r3
	and	r3, r3, #255
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	assemble_codeword, .-assemble_codeword
	.align	2
	.global	invert_codeword
	.type	invert_codeword, %function
invert_codeword:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mvn	r3, r3
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	invert_codeword, .-invert_codeword
	.align	2
	.global	encode
	.type	encode, %function
encode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, r0
	strh	r3, [fp, #-22]	@ movhi
	sub	r3, fp, #16
	ldrsh	r2, [fp, #-22]
	mov	r0, r3
	mov	r1, r2
	bl	conv_sign_mag
	ldrh	r3, [fp, #-12]
	mov	r0, r3
	bl	calc_chord
	mov	r3, r0
	strb	r3, [fp, #-7]
	ldrh	r3, [fp, #-12]
	ldrb	r2, [fp, #-7]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	extract_steps
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldr	r3, [fp, #-16]
	ldrb	r2, [fp, #-7]	@ zero_extendqisi2
	ldrb	ip, [fp, #-6]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	assemble_codeword
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	invert_codeword
	mov	r3, r0
	and	r3, r3, #255
	mov	r0, r3
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	encode, .-encode
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
