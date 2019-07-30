	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"encode.c"
	.text
	.align	2
	.global	conv_sign_mag
	.type	conv_sign_mag, %function
conv_sign_mag:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r3, r1
	cmp	r1, #0
	rsblt	r1, r1, #0
	mov	r3, r3, lsr #31
	str	r3, [r0, #0]
	str	r1, [r0, #4]
	bx	lr
	.size	conv_sign_mag, .-conv_sign_mag
	.align	2
	.global	calc_chord
	.type	calc_chord, %function
calc_chord:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	tst	r0, #4096
	movne	r0, #7
	bxne	lr
	tst	r0, #2048
	movne	r0, #6
	bxne	lr
	tst	r0, #1024
	movne	r0, #5
	bxne	lr
	tst	r0, #512
	movne	r0, #4
	bxne	lr
	tst	r0, #256
	movne	r0, #3
	bxne	lr
	tst	r0, #128
	moveq	r3, r0, lsr #6
	movne	r0, #2
	andeq	r0, r3, #1
	bx	lr
	.size	calc_chord, .-calc_chord
	.align	2
	.global	extract_steps
	.type	extract_steps, %function
extract_steps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r1, #1
	mov	r0, r0, asr r1
	and	r0, r0, #15
	bx	lr
	.size	extract_steps, .-extract_steps
	.align	2
	.global	assemble_codeword
	.type	assemble_codeword, %function
assemble_codeword:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r0, r0
	orr	r2, r2, r1, asl #4
	and	r0, r0, #255
	orr	r2, r2, r0, asl #7
	and	r2, r2, #255
	mov	r0, r2
	bx	lr
	.size	assemble_codeword, .-assemble_codeword
	.align	2
	.global	invert_codeword
	.type	invert_codeword, %function
invert_codeword:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r0, r0
	bx	lr
	.size	invert_codeword, .-invert_codeword
	.align	2
	.global	encode
	.type	encode, %function
encode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0, asl #16
	mov	r3, r3, asr #16
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	tst	r2, #4096
	movne	r3, #8
	movne	r2, #112
	bne	.L21
	tst	r2, #2048
	movne	r3, #7
	movne	r2, #96
	bne	.L21
	tst	r2, #1024
	movne	r3, #6
	movne	r2, #80
	bne	.L21
	tst	r2, #512
	movne	r3, #5
	movne	r2, #64
	bne	.L21
	tst	r2, #256
	movne	r3, #4
	movne	r2, #48
	bne	.L21
	tst	r2, #128
	moveq	r3, r3, lsr #22
	andeq	r3, r3, #1
	moveq	r2, r3, asl #4
	movne	r3, #3
	movne	r2, #32
	andeq	r2, r2, #255
	addeq	r3, r3, #1
.L21:
	mov	r3, r0, asr r3
	eor	r0, r0, #32768
	mov	r0, r0, lsr #15
	mvn	r0, r0
	and	r0, r0, #255
	orr	r0, r2, r0, asl #7
	and	r3, r3, #15
	orr	r0, r0, r3
	mvn	r0, r0
	and	r0, r0, #255
	bx	lr
	.size	encode, .-encode
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
