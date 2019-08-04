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
	.file	"encode_v2.c"
	.text
	.align	2
	.global	encode_v2
	.type	encode_v2, %function
encode_v2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-6]
	cmp	r3, #0
	bge	.L2
	ldrh	r3, [fp, #-6]	@ movhi
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [fp, #-20]
	b	.L3
.L2:
	ldrh	r3, [fp, #-6]
	str	r3, [fp, #-24]
	mov	r2, #1
	str	r2, [fp, #-20]
.L3:
	mov	r3, #32512
	add	r3, r3, #123
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	bls	.L4
	mov	r3, #32512
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	add	r2, r2, #123
	str	r2, [fp, #-24]
.L4:
	ldr	r2, [fp, #-24]
	add	r3, r2, #132
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, r2, lsr #8
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-16]
	orr	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, r2, lsr #4
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-16]
	orr	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, r2, lsr #2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-16]
	orr	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, r2, lsr #1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-16]
	orr	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-16]
	mov	r3, #0
	ldr	r2, [fp, #-16]
	str	r2, [fp, #-28]
	mov	r3, #4080
	add	r3, r3, #15
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L9
	mov	r3, #4080
	add	r3, r3, #15
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	bgt	.L13
	mov	r3, #1020
	add	r3, r3, #3
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L7
	mov	r3, #2032
	add	r3, r3, #15
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L8
	mov	r3, #508
	add	r3, r3, #3
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L6
	b	.L5
.L13:
	mov	r3, #16320
	add	r3, r3, #63
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L11
	mov	r3, #32512
	add	r3, r3, #255
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L12
	mov	r3, #8128
	add	r3, r3, #63
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	beq	.L10
	b	.L5
.L12:
	mov	r3, #7
	str	r3, [fp, #-12]
	b	.L14
.L11:
	mov	r2, #6
	str	r2, [fp, #-12]
	b	.L14
.L10:
	mov	r3, #5
	str	r3, [fp, #-12]
	b	.L14
.L9:
	mov	r2, #4
	str	r2, [fp, #-12]
	b	.L14
.L8:
	mov	r3, #3
	str	r3, [fp, #-12]
	b	.L14
.L7:
	mov	r2, #2
	str	r2, [fp, #-12]
	b	.L14
.L6:
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L14
.L5:
	mov	r2, #0
	str	r2, [fp, #-12]
.L14:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r3, #3
	mov	r3, r2, asr r3
	and	r3, r3, #255
	mov	r1, r3
	and	r1, r1, #15
	ldr	r2, [fp, #-20]
	eor	r3, r2, #1
	and	r3, r3, #255
	mov	r3, r3, asl #7
	and	r2, r3, #255
	ldr	r3, [fp, #-12]
	mov	r3, r3, asl #4
	and	r3, r3, #255
	orr	r3, r2, r3
	and	r3, r3, #255
	mov	r2, r1
	mov	r1, r3
	mov	r3, r2
	orr	r3, r1, r3
	and	r3, r3, #255
	mvn	r3, r3
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	encode_v2, .-encode_v2
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
