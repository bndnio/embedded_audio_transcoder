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
        .file   "decode.c"
        .text
        .align  2
        .global decode_from_table
        .type   decode_from_table, %function
decode_from_table:
        @ Function supports interworking.
        @ args = 0, pretend = 0, frame = 24
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #28
        mov     r3, r0
        strb    r3, [fp, #-21]
        ldrb    r3, [fp, #-21]  @ zero_extendqisi2
        mov     r3, r3, lsr #7
        and     r3, r3, #255
        eor     r3, r3, #1
        strb    r3, [fp, #-17]
        ldrb    r3, [fp, #-21]
        and     r3, r3, #15
        strb    r3, [fp, #-16]
        ldrb    r3, [fp, #-21]  @ zero_extendqisi2
        mov     r3, r3, lsr #4
        and     r3, r3, #255
        and     r3, r3, #7
        strb    r3, [fp, #-15]
        ldrb    r3, [fp, #-17]  @ zero_extendqisi2
        mov     r3, r3, asl #13
        strh    r3, [fp, #-14]  @ movhi
        ldrb    r3, [fp, #-15]  @ zero_extendqisi2
        add     r2, r3, #5
        mov     r3, #1
        mov     r3, r3, asl r2
        strh    r3, [fp, #-12]  @ movhi
        ldrb    r2, [fp, #-15]  @ zero_extendqisi2
        mov     r3, #1
        mov     r3, r3, asl r2
        strh    r3, [fp, #-10]  @ movhi
        ldrb    r2, [fp, #-16]  @ zero_extendqisi2
        ldrb    r3, [fp, #-15]  @ zero_extendqisi2
        add     r3, r3, #1
        mov     r3, r2, asl r3
        strh    r3, [fp, #-8]   @ movhi
        ldrh    r2, [fp, #-14]  @ movhi
        ldrh    r3, [fp, #-12]  @ movhi
        orr     r3, r2, r3
        mov     r3, r3, asl #16
        mov     r2, r3, lsr #16
        ldrh    r3, [fp, #-8]   @ movhi
        orr     r3, r2, r3
        mov     r3, r3, asl #16
        mov     r2, r3, lsr #16
        ldrh    r3, [fp, #-10]  @ movhi
        orr     r3, r2, r3
        strh    r3, [fp, #-6]   @ movhi
        ldrh    r3, [fp, #-6]   @ movhi
        mvn     r3, r3
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        str     r3, [fp, #-28]
        ldr     r2, [fp, #-28]
        mov     r3, r2, asl #18
        mov     r3, r3, lsr #18
        str     r3, [fp, #-28]
        ldr     r3, [fp, #-28]
        mov     r0, r3
        add     sp, fp, #0
        ldmfd   sp!, {fp}
        bx      lr
        .size   decode_from_table, .-decode_from_table
        .align  2
        .global decode
        .type   decode, %function
decode:
        @ Function supports interworking.
        @ args = 0, pretend = 0, frame = 8
        @ frame_needed = 1, uses_anonymous_args = 0
        stmfd   sp!, {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #8
        mov     r3, r0
        strb    r3, [fp, #-5]
        ldrb    r3, [fp, #-5]   @ zero_extendqisi2
        mov     r0, r3
        bl      decode_from_table
        mov     r3, r0
        mov     r0, r3
        sub     sp, fp, #4
        ldmfd   sp!, {fp, lr}
        bx      lr
        .size   decode, .-decode
        .ident  "GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
        .section        .note.GNU-stack,"",%progbits
