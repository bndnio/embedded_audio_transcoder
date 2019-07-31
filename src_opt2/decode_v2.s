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
        .file   "decode_v2.c"
        .text
        .align  2
        .global decode_v2
        .type   decode_v2, %function
decode_v2:
        @ Function supports interworking.
        @ args = 0, pretend = 0, frame = 16
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #20
        mov     r3, r0
        strb    r3, [fp, #-13]
        ldrb    r3, [fp, #-13]  @ zero_extendqisi2
        mov     r3, r3, lsr #4
        and     r3, r3, #255
        and     r3, r3, #7
        strb    r3, [fp, #-5]
        ldrb    r3, [fp, #-13]  @ zero_extendqisi2
        mov     r3, r3, lsr #7
        and     r3, r3, #255
        eor     r3, r3, #1
        and     r3, r3, #255
        mov     r3, r3, asl #13
        mov     r3, r3, asl #16
        mov     r1, r3, lsr #16
        ldrb    r3, [fp, #-5]   @ zero_extendqisi2
        add     r2, r3, #5
        mov     r3, #1
        mov     r3, r3, asl r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mov     r2, r1  @ movhi
        orr     r3, r2, r3
        mov     r3, r3, asl #16
        mov     r1, r3, lsr #16
        ldrb    r2, [fp, #-5]   @ zero_extendqisi2
        mov     r3, #1
        mov     r3, r3, asl r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mov     r2, r1  @ movhi
        orr     r3, r2, r3
        mov     r3, r3, asl #16
        mov     r1, r3, lsr #16
        ldrb    r3, [fp, #-13]  @ zero_extendqisi2
        and     r2, r3, #15
        ldrb    r3, [fp, #-5]   @ zero_extendqisi2
        add     r3, r3, #1
        mov     r3, r2, asl r3
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mov     r2, r1  @ movhi
        orr     r3, r2, r3
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mvn     r3, r3
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        str     r3, [fp, #-20]
        ldr     r2, [fp, #-20]
        mov     r3, r2, asl #18
        mov     r3, r3, lsr #18
        str     r3, [fp, #-20]
        ldr     r3, [fp, #-20]
        mov     r0, r3
        add     sp, fp, #0
        ldmfd   sp!, {fp}
        bx      lr
        .size   decode_v2, .-decode_v2
        .ident  "GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
        .section        .note.GNU-stack,"",%progbits