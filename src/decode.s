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
	.file	"decode.c"
	.text
	.align	2
	.global	decode_from_table
	.type	decode_from_table, %function
decode_from_table:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0, lsr #4
	mov	ip, #1
	and	r3, r3, #7
	mov	r1, r0
	mov	r0, ip, asl r3
	str	r4, [sp, #-4]!
	mov	r2, r1, lsr #7
	add	r4, r3, #5
	and	r1, r1, #15
	add	r3, r3, ip
	and	r0, r0, #255
	orr	r0, r0, r1, asl r3
	orr	r2, r2, ip, asl r4
	orr	r0, r0, r2
	mvn	r0, r0
	bic	r0, r0, #49152
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	ldmfd	sp!, {r4}
	bx	lr
	.size	decode_from_table, .-decode_from_table
	.align	2
	.global	decode
	.type	decode, %function
decode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0, lsr #4
	mov	ip, #1
	and	r3, r3, #7
	mov	r1, r0
	mov	r0, ip, asl r3
	str	r4, [sp, #-4]!
	mov	r2, r1, lsr #7
	add	r4, r3, #5
	and	r1, r1, #15
	add	r3, r3, ip
	and	r0, r0, #255
	orr	r0, r0, r1, asl r3
	orr	r2, r2, ip, asl r4
	orr	r0, r0, r2
	mvn	r0, r0
	bic	r0, r0, #49152
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	ldmfd	sp!, {r4}
	bx	lr
	.size	decode, .-decode
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
