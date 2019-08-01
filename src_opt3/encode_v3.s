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
	.file	"encode_v3.c"
	.text
	.align	2
	.global	encode_v3
	.type	encode_v3, %function
encode_v3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	mov	r2, r0
	mov	r3, r2
	and	r3, r3, #8192
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	str	r3, [fp, #-24]
	str	r2, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, r2, asl #19
	mov	r3, r3, lsr #19
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	and	r3, r3, #4096
	cmp	r3, #0
	beq	.L2
	mov	r2, #7
	str	r2, [fp, #-16]
	b	.L3
.L2:
	ldr	r3, [fp, #-20]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L4
	mov	r3, #6
	str	r3, [fp, #-16]
	b	.L3
.L4:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1024
	cmp	r3, #0
	beq	.L5
	mov	r2, #5
	str	r2, [fp, #-16]
	b	.L3
.L5:
	ldr	r3, [fp, #-20]
	and	r3, r3, #512
	cmp	r3, #0
	beq	.L6
	mov	r3, #4
	str	r3, [fp, #-16]
	b	.L3
.L6:
	ldr	r3, [fp, #-20]
	and	r3, r3, #256
	cmp	r3, #0
	beq	.L7
	mov	r2, #3
	str	r2, [fp, #-16]
	b	.L3
.L7:
	ldr	r3, [fp, #-20]
	and	r3, r3, #128
	cmp	r3, #0
	beq	.L8
	mov	r3, #2
	str	r3, [fp, #-16]
	b	.L3
.L8:
	ldr	r3, [fp, #-20]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L3
	mov	r2, #1
	str	r2, [fp, #-16]
.L3:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	mov	r3, r2, asr r3
	and	r3, r3, #255
	and	r3, r3, #15
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asl #7
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
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
	.size	encode_v3, .-encode_v3
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
