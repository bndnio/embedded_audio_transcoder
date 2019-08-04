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
	.file	"encode_v1.c"
	.text
	.align	2
	.global	encode_v1
	.type	encode_v1, %function
encode_v1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	mov	r3, #32512
	add	r3, r3, #123
	strh	r3, [fp, #-12]	@ movhi
	ldrsh	r3, [fp, #-14]
	cmp	r3, #0
	bge	.L2
	ldrh	r3, [fp, #-14]	@ movhi
	rsb	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-7]
	b	.L3
.L2:
	ldrh	r3, [fp, #-14]	@ movhi
	strh	r3, [fp, #-10]	@ movhi
	mov	r3, #1
	strb	r3, [fp, #-7]
.L3:
	ldrh	r2, [fp, #-10]
	ldrh	r3, [fp, #-12]
	cmp	r2, r3
	bls	.L4
	ldrh	r3, [fp, #-12]	@ movhi
	strh	r3, [fp, #-10]	@ movhi
.L4:
	ldrh	r3, [fp, #-10]	@ movhi
	add	r3, r3, #132
	strh	r3, [fp, #-10]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-6]
	ldrh	r3, [fp, #-10]
	and	r3, r3, #16384
	cmp	r3, #0
	beq	.L5
	mov	r3, #7
	strb	r3, [fp, #-6]
	b	.L6
.L5:
	ldrh	r3, [fp, #-10]
	and	r3, r3, #8192
	cmp	r3, #0
	beq	.L7
	mov	r3, #6
	strb	r3, [fp, #-6]
	b	.L6
.L7:
	ldrh	r3, [fp, #-10]
	and	r3, r3, #4096
	cmp	r3, #0
	beq	.L8
	mov	r3, #5
	strb	r3, [fp, #-6]
	b	.L6
.L8:
	ldrh	r3, [fp, #-10]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L9
	mov	r3, #4
	strb	r3, [fp, #-6]
	b	.L6
.L9:
	ldrh	r3, [fp, #-10]
	and	r3, r3, #1024
	cmp	r3, #0
	beq	.L10
	mov	r3, #3
	strb	r3, [fp, #-6]
	b	.L6
.L10:
	ldrh	r3, [fp, #-10]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L11
	mov	r3, #2
	strb	r3, [fp, #-6]
	b	.L6
.L11:
	ldrh	r3, [fp, #-10]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L6
	mov	r3, #1
	strb	r3, [fp, #-6]
.L6:
	ldrh	r2, [fp, #-10]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	add	r3, r3, #3
	mov	r3, r2, asr r3
	and	r3, r3, #255
	and	r3, r3, #15
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-7]
	eor	r3, r3, #1
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
	.size	encode_v1, .-encode_v1
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
