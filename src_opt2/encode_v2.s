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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r3, [fp, #-14]
	and	r3, r3, #8192
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	strh	r3, [fp, #-12]	@ movhi
	ldrh	r3, [fp, #-14]	@ movhi
	mov	r3, r3, asl #19
	mov	r3, r3, lsr #19
	strh	r3, [fp, #-10]	@ movhi
	ldrh	r3, [fp, #-10]	@ movhi
	mov	r3, r3, asl #19
	mov	r3, r3, lsr #19
	strh	r3, [fp, #-8]	@ movhi
	ldrh	r3, [fp, #-8]
	mov	r3, r3, lsr #1
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-8]	@ movhi
	orr	r3, r2, r3
	strh	r3, [fp, #-8]	@ movhi
	ldrh	r3, [fp, #-8]
	mov	r3, r3, lsr #2
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-8]	@ movhi
	orr	r3, r2, r3
	strh	r3, [fp, #-8]	@ movhi
	ldrh	r3, [fp, #-8]
	mov	r3, r3, lsr #4
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-8]	@ movhi
	orr	r3, r2, r3
	strh	r3, [fp, #-8]	@ movhi
	ldrh	r3, [fp, #-8]
	mov	r3, r3, lsr #8
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-8]	@ movhi
	orr	r3, r2, r3
	strh	r3, [fp, #-8]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-6]
	ldrh	r2, [fp, #-8]
	str	r2, [fp, #-20]
	mov	r3, #1020
	add	r3, r3, #3
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L6
	mov	r3, #1020
	add	r3, r3, #3
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bgt	.L10
	ldr	r3, [fp, #-20]
	cmp	r3, #255
	beq	.L4
	mov	r3, #508
	add	r3, r3, #3
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L5
	ldr	r3, [fp, #-20]
	cmp	r3, #127
	beq	.L3
	b	.L2
.L10:
	mov	r3, #4080
	add	r3, r3, #15
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L8
	mov	r3, #8128
	add	r3, r3, #63
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L9
	mov	r3, #2032
	add	r3, r3, #15
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L7
	b	.L2
.L9:
	mov	r3, #7
	strb	r3, [fp, #-6]
	b	.L11
.L8:
	mov	r3, #6
	strb	r3, [fp, #-6]
	b	.L11
.L7:
	mov	r3, #5
	strb	r3, [fp, #-6]
	b	.L11
.L6:
	mov	r3, #4
	strb	r3, [fp, #-6]
	b	.L11
.L5:
	mov	r3, #3
	strb	r3, [fp, #-6]
	b	.L11
.L4:
	mov	r3, #2
	strb	r3, [fp, #-6]
	b	.L11
.L3:
	mov	r3, #1
	strb	r3, [fp, #-6]
	b	.L11
.L2:
	mov	r3, #0
	strb	r3, [fp, #-6]
.L11:
	ldrh	r2, [fp, #-10]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	add	r3, r3, #1
	mov	r3, r2, asr r3
	and	r3, r3, #255
	and	r3, r3, #15
	strb	r3, [fp, #-5]
	ldrh	r3, [fp, #-12]	@ movhi
	and	r3, r3, #255
	mov	r3, r3, asl #7
	and	r2, r3, #255
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	orr	r3, r2, r3
	and	r3, r3, #255
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
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
