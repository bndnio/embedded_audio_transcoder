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
	.file	"decode_v1.c"
	.text
	.align	2
	.global	decode_v1
	.type	decode_v1, %function
decode_v1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	ldr	r2, [fp, #-24]
	mvn	r3, r2
	and	r3, r3, #255
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	mov	r3, r2, lsr #7
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	mov	r4, r3
	ldr	r3, [fp, #-24]
	and	r3, r3, #112
	mov	r3, r3, asr #4
	mov	r3, r3, asl #16
	mov	r0, r3, lsr #16
	ldr	r3, [fp, #-24]
	mov	r1, r3
	and	r1, r1, #15
	mov	r5, #132
	mov	r3, r0
	add	r2, r3, #7
	mov	r3, #1
	mov	r3, r3, asl r2
	mov	r3, r3, asl #16
	mov	ip, r3, lsr #16
	mov	r2, r1
	mov	r3, r0
	add	r3, r3, #3
	mov	r3, r2, asl r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, ip, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	rsb	r3, r5, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-16]
	cmp	r4, #0
	bne	.L2
	ldr	r2, [fp, #-16]
	mov	r3, r2	@ movhi
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-20]
	b	.L3
.L2:
	ldr	r2, [fp, #-16]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-20]
.L3:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, r5, fp}
	bx	lr
	.size	decode_v1, .-decode_v1
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
