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
	.file	"decode_v3.c"
	.text
	.align	2
	.global	decode_v3
	.type	decode_v3, %function
decode_v3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mvn	r3, r2
	and	r3, r3, #255
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	and	r3, r3, #112
	mov	r3, r3, asr #4
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r3, #3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-16]
	and	r3, r3, #15
	orr	r2, r3, #16
	mov	r3, r1
	mov	r3, r2, asl r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	sub	r3, r3, #132
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L2
	ldr	r2, [fp, #-8]
	mov	r3, r2	@ movhi
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-12]
	b	.L3
.L2:
	ldr	r2, [fp, #-8]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-12]
.L3:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	decode_v3, .-decode_v3
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
