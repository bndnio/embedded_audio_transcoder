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
	.global	encodeTable
	.section	.rodata
	.align	2
	.type	encodeTable, %object
	.size	encodeTable, 1024
encodeTable:
	.word	0
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	2
	.word	2
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	3
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	5
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	6
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
	.word	7
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
	str	r0, [fp, #-28]
	ldr	r2, [fp, #-28]
	mov	r2, r2, lsr #31
	str	r2, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	bne	.L2
	ldr	r2, [fp, #-28]
	rsb	r3, r2, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-24]
	b	.L3
.L2:
	ldr	r2, [fp, #-28]
	mov	r3, r2, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-24]
.L3:
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
	mov	r3, #32512
	add	r3, r3, #123
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bls	.L4
	mov	r3, #32512
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	add	r2, r2, #123
	str	r2, [fp, #-16]
.L4:
	ldr	r2, [fp, #-16]
	add	r3, r2, #132
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, r2, lsr #7
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	and	r2, r3, #255
	ldr	r3, .L6
	ldr	r3, [r3, r2, asl #2]
	and	r1, r3, #255
	ldr	r2, [fp, #-16]
	mov	r3, r1
	add	r3, r3, #3
	mov	r3, r2, asr r3
	and	r3, r3, #255
	and	r3, r3, #15
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #7
	and	r2, r3, #255
	mov	r3, r1
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
.L7:
	.align	2
.L6:
	.word	encodeTable
	.size	encode_v3, .-encode_v3
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
