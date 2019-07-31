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
        .file   "decode_v1.c"
        .text
        .align  2
        .global decode_v1
        .type   decode_v1, %function
decode_v1:
        @ Function supports interworking.
        @ args = 0, pretend = 0, frame = 8
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #12
        mov     r1, r0
        mov     r3, r1, lsr #4
        and     r3, r3, #255
        mov     r0, r3
        and     r0, r0, #7
        mov     r3, r1, lsr #7
        and     r3, r3, #255
        eor     r3, r3, #1
        and     r3, r3, #255
        mov     r3, r3, asl #13
        mov     r3, r3, asl #16
        mov     ip, r3, lsr #16
        mov     r3, r0
        add     r2, r3, #5
        mov     r3, #1
        mov     r3, r3, asl r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mov     r2, ip  @ movhi
        orr     r3, r2, r3
        mov     r3, r3, asl #16
        mov     ip, r3, lsr #16
        mov     r2, r0
        mov     r3, #1
        mov     r3, r3, asl r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mov     r2, ip  @ movhi
        orr     r3, r2, r3
        mov     r3, r3, asl #16
        mov     ip, r3, lsr #16
        mov     r3, r1
        and     r2, r3, #15
        mov     r3, r0
        add     r3, r3, #1
        mov     r3, r2, asl r3
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mov     r2, ip  @ movhi
        orr     r3, r2, r3
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mvn     r3, r3
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        str     r3, [fp, #-8]
        ldr     r2, [fp, #-8]
        mov     r3, r2, asl #18
        mov     r3, r3, lsr #18
        str     r3, [fp, #-8]
        ldr     r3, [fp, #-8]
        mov     r0, r3
        add     sp, fp, #0
        ldmfd   sp!, {fp}
        bx      lr
        .size   decode_v1, .-decode_v1
        .ident  "GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
        .section        .note.GNU-stack,"",%progbits
        