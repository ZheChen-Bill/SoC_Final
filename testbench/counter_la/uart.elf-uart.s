	.file	"uart.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/SoC_Design/Final/testbench/counter_la" "uart.c"
	.section	.mprj,"ax",@progbits
	.align	2
	.globl	uart_end
	.type	uart_end, @function
uart_end:
.LFB321:
	.file 1 "uart.c"
	.loc 1 7 1
	.cfi_startproc
	.loc 1 8 5
	.loc 1 8 13 is_stmt 0
	lui	a5,%hi(endflag)
	li	a4,1
	sw	a4,%lo(endflag)(a5)
	.loc 1 9 1
	ret
	.cfi_endproc
.LFE321:
	.size	uart_end, .-uart_end
	.align	2
	.globl	uart_write
	.type	uart_write, @function
uart_write:
.LFB322:
	.loc 1 12 1 is_stmt 1
	.cfi_startproc
.LVL0:
	.loc 1 13 5
	.loc 1 13 14 is_stmt 0
	li	a4,805306368
.L3:
	.loc 1 13 11 is_stmt 1 discriminator 1
	.loc 1 13 14 is_stmt 0 discriminator 1
	lw	a5,8(a4)
	.loc 1 13 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L3
	.loc 1 14 5 is_stmt 1
	.loc 1 14 39 is_stmt 0
	sw	a0,4(a4)
	.loc 1 15 1
	ret
	.cfi_endproc
.LFE322:
	.size	uart_write, .-uart_write
	.align	2
	.globl	uart_write_char
	.type	uart_write_char, @function
uart_write_char:
.LFB323:
	.loc 1 18 1 is_stmt 1
	.cfi_startproc
.LVL1:
	.loc 1 19 2
	.loc 1 18 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 19 5
	li	a5,10
	.loc 1 18 1
	mv	s0,a0
	.loc 1 19 5
	bne	a0,a5,.L6
	.loc 1 20 3 is_stmt 1
	li	a0,13
.LVL2:
	call	uart_write_char
.LVL3:
.L6:
	.loc 1 23 14 is_stmt 0 discriminator 1
	li	a4,805306368
.L7:
	.loc 1 23 11 is_stmt 1 discriminator 1
	.loc 1 23 14 is_stmt 0 discriminator 1
	lw	a5,8(a4)
	.loc 1 23 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L7
	.loc 1 24 5 is_stmt 1
	.loc 1 25 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 24 39
	sw	s0,4(a4)
	.loc 1 25 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE323:
	.size	uart_write_char, .-uart_write_char
	.align	2
	.globl	uart_write_string
	.type	uart_write_string, @function
uart_write_string:
.LFB324:
	.loc 1 28 1 is_stmt 1
	.cfi_startproc
.LVL4:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	.loc 1 29 5
.LVL5:
.L11:
	.loc 1 29 12
	lbu	a0,0(s0)
	bne	a0,zero,.L12
	.loc 1 31 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL6:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL7:
.L12:
	.cfi_restore_state
	.loc 1 30 9 is_stmt 1
	.loc 1 30 28 is_stmt 0
	addi	s0,s0,1
.LVL8:
	.loc 1 30 9
	call	uart_write_char
.LVL9:
	j	.L11
	.cfi_endproc
.LFE324:
	.size	uart_write_string, .-uart_write_string
	.align	2
	.globl	uart_read_char
	.type	uart_read_char, @function
uart_read_char:
.LFB325:
	.loc 1 35 1 is_stmt 1
	.cfi_startproc
	.loc 1 36 2
	.loc 1 37 5
	.loc 1 37 12 is_stmt 0
	li	a5,805306368
	lw	a4,8(a5)
	.loc 1 35 1
	li	a0,0
	.loc 1 37 44
	srli	a4,a4,5
	.loc 1 37 7
	bne	a4,zero,.L15
	.loc 1 37 67 discriminator 1
	lw	a4,8(a5)
	.loc 1 37 99 discriminator 1
	srli	a4,a4,4
	.loc 1 37 60 discriminator 1
	bne	a4,zero,.L15
.LVL10:
.LBB2:
	.loc 1 38 26 is_stmt 1 discriminator 1
	.loc 1 39 13 discriminator 1
 #APP
# 39 "uart.c" 1
	nop
# 0 "" 2
	.loc 1 38 32 discriminator 1
.LVL11:
	.loc 1 38 26 discriminator 1
 #NO_APP
.LBE2:
	.loc 1 41 9 discriminator 1
	.loc 1 41 16 is_stmt 0 discriminator 1
	lw	a0,0(a5)
	.loc 1 41 13 discriminator 1
	andi	a0,a0,0xff
.LVL12:
.L15:
	.loc 1 44 5 is_stmt 1
	.loc 1 45 1 is_stmt 0
	ret
	.cfi_endproc
.LFE325:
	.size	uart_read_char, .-uart_read_char
	.align	2
	.globl	uart_read
	.type	uart_read, @function
uart_read:
.LFB326:
	.loc 1 48 1 is_stmt 1
	.cfi_startproc
	.loc 1 49 5
	.loc 1 50 5
	.loc 1 50 12 is_stmt 0
	li	a5,805306368
	lw	a4,8(a5)
	.loc 1 50 44
	srli	a4,a4,5
	.loc 1 50 7
	bne	a4,zero,.L17
	.loc 1 50 67 discriminator 1
	lw	a4,8(a5)
	.loc 1 50 99 discriminator 1
	srli	a4,a4,4
	.loc 1 50 60 discriminator 1
	bne	a4,zero,.L17
.LVL13:
.LBB3:
	.loc 1 51 26 is_stmt 1 discriminator 1
	.loc 1 52 13 discriminator 1
 #APP
# 52 "uart.c" 1
	nop
# 0 "" 2
	.loc 1 51 32 discriminator 1
.LVL14:
	.loc 1 51 26 discriminator 1
 #NO_APP
.LBE3:
	.loc 1 54 9 discriminator 1
	.loc 1 54 16 is_stmt 0 discriminator 1
	lw	a0,0(a5)
.LVL15:
.L17:
	.loc 1 56 2 is_stmt 1
	.loc 1 56 42 is_stmt 0
	slli	a4,a0,16
	.loc 1 56 36
	li	a5,637534208
	sw	a4,12(a5)
	.loc 1 58 5 is_stmt 1
	.loc 1 59 1 is_stmt 0
	ret
	.cfi_endproc
.LFE326:
	.size	uart_read, .-uart_read
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB327:
	.loc 1 62 61 is_stmt 1
	.cfi_startproc
	.loc 1 63 2
.LBB4:
	.loc 1 63 6
.LVL16:
	.loc 1 63 16
	.loc 1 64 18 is_stmt 0
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
.LBE4:
	.loc 1 62 61
	li	a5,0
.LBB5:
	.loc 1 65 19
	addi	a1,a4,44
	.loc 1 63 16
	li	a3,44
.LVL17:
.L19:
	.loc 1 64 3 is_stmt 1 discriminator 3
	.loc 1 64 18 is_stmt 0 discriminator 3
	add	a2,a4,a5
	sw	zero,0(a2)
	.loc 1 65 3 is_stmt 1 discriminator 3
	.loc 1 65 19 is_stmt 0 discriminator 3
	add	a2,a1,a5
	sw	zero,0(a2)
	.loc 1 63 22 is_stmt 1 discriminator 3
	.loc 1 63 16 discriminator 3
	addi	a5,a5,4
	bne	a5,a3,.L19
.LBE5:
	.loc 1 67 1 is_stmt 0
	ret
	.cfi_endproc
.LFE327:
	.size	initfir, .-initfir
	.globl	__mulsi3
	.align	2
	.globl	firfilter
	.type	firfilter, @function
firfilter:
.LFB328:
	.loc 1 69 76 is_stmt 1
	.cfi_startproc
.LVL18:
	.loc 1 70 2
.LBB6:
	.loc 1 70 6
	.loc 1 70 20
	lui	a4,%hi(.LANCHOR0)
.LBE6:
	.loc 1 69 76 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	addi	a5,a4,%lo(.LANCHOR0)
	sw	s0,24(sp)
	sw	ra,28(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	addi	a5,a5,40
	addi	a3,a4,%lo(.LANCHOR0)
	addi	s0,a4,%lo(.LANCHOR0)
.LVL19:
.L22:
.LBB7:
	.loc 1 71 3 is_stmt 1 discriminator 3
	.loc 1 71 18 is_stmt 0 discriminator 3
	lw	a4,-4(a5)
	.loc 1 70 20 discriminator 3
	addi	a5,a5,-4
	.loc 1 71 18 discriminator 3
	sw	a4,4(a5)
	.loc 1 70 25 is_stmt 1 discriminator 3
	.loc 1 70 20 discriminator 3
	bne	a5,a3,.L22
.LBE7:
	.loc 1 73 2
.LBB8:
	.loc 1 77 23 is_stmt 0
	lui	s3,%hi(.LANCHOR1)
.LBE8:
	.loc 1 73 17
	sw	a0,0(s0)
	.loc 1 75 2 is_stmt 1
.LVL20:
	.loc 1 76 2
.LBB9:
	.loc 1 76 6
	.loc 1 76 16
.LBE9:
	.loc 1 73 17 is_stmt 0
	li	s1,0
	.loc 1 75 6
	li	s2,0
.LBB10:
	.loc 1 77 23
	addi	s3,s3,%lo(.LANCHOR1)
	.loc 1 76 16
	li	s4,44
.LVL21:
.L23:
	.loc 1 77 3 is_stmt 1 discriminator 3
	.loc 1 77 23 is_stmt 0 discriminator 3
	add	a5,s3,s1
	.loc 1 77 38 discriminator 3
	add	a4,s0,s1
	.loc 1 77 26 discriminator 3
	lw	a1,0(a4)
	lw	a0,0(a5)
	.loc 1 76 16 discriminator 3
	addi	s1,s1,4
	.loc 1 77 26 discriminator 3
	call	__mulsi3
.LVL22:
	.loc 1 77 16 discriminator 3
	add	s2,s2,a0
.LVL23:
	.loc 1 76 22 is_stmt 1 discriminator 3
	.loc 1 76 16 discriminator 3
	bne	s1,s4,.L23
.LBE10:
	.loc 1 79 2
	.loc 1 80 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	mv	a0,s2
	lw	s2,16(sp)
	.cfi_restore 18
.LVL24:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE328:
	.size	firfilter, .-firfilter
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB329:
	.loc 1 82 56 is_stmt 1
	.cfi_startproc
	.loc 1 83 2
	.loc 1 82 56 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s1,20(sp)
	sw	s2,16(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
.LBB11:
	.loc 1 85 19
	lui	s1,%hi(.LANCHOR0+44)
	.loc 1 85 21
	lui	s2,%hi(.LANCHOR1+44)
.LBE11:
	.loc 1 82 56
	sw	s0,24(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	.loc 1 83 2
	li	s0,0
	call	initfir
.LVL25:
	.loc 1 84 2 is_stmt 1
.LBB12:
	.loc 1 84 6
	.loc 1 84 16
	.loc 1 85 21 is_stmt 0
	addi	s2,s2,%lo(.LANCHOR1+44)
	.loc 1 85 19
	addi	s1,s1,%lo(.LANCHOR0+44)
	.loc 1 84 16
	li	s3,256
.LVL26:
.L28:
	.loc 1 85 3 is_stmt 1 discriminator 3
	.loc 1 85 21 is_stmt 0 discriminator 3
	add	a5,s2,s0
	lw	a0,0(a5)
	call	firfilter
.LVL27:
	.loc 1 85 19 discriminator 3
	add	a5,s1,s0
	sw	a0,0(a5)
	.loc 1 84 22 is_stmt 1 discriminator 3
	.loc 1 84 16 discriminator 3
	addi	s0,s0,4
	bne	s0,s3,.L28
.LBE12:
	.loc 1 87 2
	.loc 1 88 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	mv	a0,s1
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE329:
	.size	fir, .-fir
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB330:
	.loc 1 92 1 is_stmt 1
	.cfi_startproc
	.loc 1 93 2
.LVL28:
	.loc 1 94 2
	.loc 1 95 2
	.loc 1 96 2
	.loc 1 97 2
	.loc 1 98 2
	.loc 1 99 2
	.loc 1 99 13
	.loc 1 92 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	lui	a5,%hi(.LANCHOR1)
	sw	s0,56(sp)
	sw	s1,52(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	lui	s0,%hi(.LANCHOR0+300)
	addi	s1,a5,%lo(.LANCHOR1)
	sw	s2,48(sp)
	sw	s7,28(sp)
	sw	s11,12(sp)
	sw	ra,60(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	.cfi_offset 18, -16
	.cfi_offset 23, -36
	.cfi_offset 27, -52
	.cfi_offset 1, -4
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	addi	s1,s1,300
	addi	s0,s0,%lo(.LANCHOR0+300)
	.loc 1 100 9
	li	s7,0
	addi	s2,a5,%lo(.LANCHOR1)
	lui	s11,%hi(.LANCHOR0+300)
.LVL29:
.L32:
	.loc 1 100 14 is_stmt 1
	addi	s6,s2,364
	.loc 1 102 10 is_stmt 0
	mv	s5,s0
	.loc 1 100 9
	li	s4,0
	j	.L36
.LVL30:
.L33:
	.loc 1 103 5 is_stmt 1 discriminator 3
	.loc 1 103 25 is_stmt 0 discriminator 3
	lw	a1,0(s10)
	lw	a0,0(s9)
	.loc 1 102 19 discriminator 3
	addi	s3,s3,1
.LVL31:
	.loc 1 102 15 discriminator 3
	addi	s9,s9,4
	.loc 1 103 25 discriminator 3
	call	__mulsi3
.LVL32:
	.loc 1 102 15 discriminator 3
	li	a5,4
	.loc 1 103 9 discriminator 3
	add	s8,s8,a0
.LVL33:
	.loc 1 102 19 is_stmt 1 discriminator 3
	.loc 1 102 15 discriminator 3
	addi	s10,s10,16
	li	a4,16
	bne	s3,a5,.L33
	.loc 1 104 4 discriminator 2
	.loc 1 104 22 is_stmt 0 discriminator 2
	sw	s8,0(s5)
	.loc 1 100 19 is_stmt 1 discriminator 2
	addi	s4,s4,1
.LVL34:
	.loc 1 100 14 discriminator 2
	addi	s5,s5,4
	addi	s6,s6,4
	beq	s4,s3,.L34
.LVL35:
.L36:
	.loc 1 102 15
	.loc 1 92 1 is_stmt 0
	mv	s10,s6
	mv	s9,s1
	.loc 1 101 8
	li	s8,0
	.loc 1 102 10
	li	s3,0
	j	.L33
.LVL36:
.L34:
	.loc 1 99 18 is_stmt 1 discriminator 2
	.loc 1 99 13 discriminator 2
	addi	s7,s7,4
	addi	s1,s1,16
	addi	s0,s0,16
	bne	s7,a4,.L32
	.loc 1 107 2
	.loc 1 108 1 is_stmt 0
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
	lw	s3,44(sp)
	.cfi_restore 19
.LVL37:
	lw	s4,40(sp)
	.cfi_restore 20
.LVL38:
	lw	s5,36(sp)
	.cfi_restore 21
	lw	s6,32(sp)
	.cfi_restore 22
	lw	s7,28(sp)
	.cfi_restore 23
	lw	s8,24(sp)
	.cfi_restore 24
.LVL39:
	lw	s9,20(sp)
	.cfi_restore 25
	lw	s10,16(sp)
	.cfi_restore 26
	addi	a0,s11,%lo(.LANCHOR0+300)
	lw	s11,12(sp)
	.cfi_restore 27
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE330:
	.size	matmul, .-matmul
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB331:
	.loc 1 111 75 is_stmt 1
	.cfi_startproc
.LVL40:
	.loc 1 112 2
	.loc 1 112 6 is_stmt 0
	lui	a4,%hi(.LANCHOR1)
	addi	a5,a4,%lo(.LANCHOR1)
	slli	a7,a1,2
	add	a2,a5,a7
	lw	t4,428(a2)
.LVL41:
	.loc 1 113 2 is_stmt 1
	addi	a5,a5,428
	slli	a2,a0,2
	.loc 1 111 75 is_stmt 0
	mv	a3,a0
	.loc 1 113 6
	addi	t1,a0,-1
.LVL42:
	.loc 1 114 2 is_stmt 1
	.loc 1 115 2
	add	a5,a5,a2
	addi	a4,a4,%lo(.LANCHOR1)
.LVL43:
.L40:
	.loc 1 115 15 discriminator 1
	.loc 1 117 6 is_stmt 0 discriminator 1
	addi	a0,t1,1
	.loc 1 118 9 discriminator 1
	slli	a2,a0,2
	add	a2,a4,a2
	lw	a6,428(a2)
	.loc 1 115 15 discriminator 1
	blt	a3,a1,.L42
	.loc 1 123 2 is_stmt 1
	.loc 1 123 6 is_stmt 0
	add	a5,a4,a7
	lw	a4,428(a5)
	.loc 1 123 4
	bge	a4,a6,.L39
	.loc 1 124 3 is_stmt 1
.LVL44:
	.loc 1 125 3
	.loc 1 125 10 is_stmt 0
	sw	a4,428(a2)
.LVL45:
	.loc 1 126 3 is_stmt 1
	.loc 1 126 9 is_stmt 0
	sw	a6,428(a5)
	.loc 1 128 2 is_stmt 1
.LVL46:
.L39:
	.loc 1 129 1 is_stmt 0
	ret
.L42:
	.loc 1 116 3 is_stmt 1
	.loc 1 116 7 is_stmt 0
	lw	t3,0(a5)
	.loc 1 116 5
	bge	t3,t4,.L41
	.loc 1 117 4 is_stmt 1
.LVL47:
	.loc 1 118 4
	.loc 1 119 4
	.loc 1 119 9 is_stmt 0
	sw	t3,428(a2)
.LVL48:
	.loc 1 120 4 is_stmt 1
	.loc 1 120 9 is_stmt 0
	sw	a6,0(a5)
.LVL49:
	.loc 1 117 6
	mv	t1,a0
.LVL50:
.L41:
	.loc 1 115 20 is_stmt 1 discriminator 2
	addi	a3,a3,1
.LVL51:
	addi	a5,a5,4
	j	.L40
	.cfi_endproc
.LFE331:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB332:
	.loc 1 131 72
	.cfi_startproc
.LVL52:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	mv	s0,a0
	mv	s2,a1
.LVL53:
.L46:
	.loc 1 132 2
	.loc 1 132 4 is_stmt 0
	bge	s0,s2,.L44
.LBB13:
	.loc 1 133 3 is_stmt 1
	.loc 1 133 11 is_stmt 0
	mv	a1,s2
	mv	a0,s0
	call	partition
.LVL54:
	mv	s1,a0
.LVL55:
	.loc 1 134 3 is_stmt 1
	addi	a1,a0,-1
	mv	a0,s0
	call	sort
.LVL56:
	.loc 1 135 3
	addi	s0,s1,1
	j	.L46
.LVL57:
.L44:
.LBE13:
	.loc 1 137 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
.LVL58:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE332:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB333:
	.loc 1 139 58 is_stmt 1
	.cfi_startproc
	.loc 1 140 2
	.loc 1 139 58 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 140 2
	li	a0,0
	li	a1,9
	.loc 1 139 58
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 140 2
	call	sort
.LVL59:
	.loc 1 141 2 is_stmt 1
	.loc 1 142 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lui	a0,%hi(.LANCHOR1+428)
	addi	a0,a0,%lo(.LANCHOR1+428)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE333:
	.size	qsort, .-qsort
	.align	2
	.globl	check
	.type	check, @function
check:
.LFB334:
	.loc 1 144 58 is_stmt 1
	.cfi_startproc
	.loc 1 146 2
	.loc 1 146 17
	.loc 1 148 3
	.loc 1 149 1 is_stmt 0
	ret
	.cfi_endproc
.LFE334:
	.size	check, .-check
	.globl	endflag
	.globl	C
	.globl	result
	.globl	B
	.globl	A
	.globl	outputsignal
	.globl	inputsignal
	.globl	inputbuffer
	.globl	taps
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	taps, @object
	.size	taps, 44
taps:
	.word	0
	.word	-10
	.word	-9
	.word	23
	.word	56
	.word	63
	.word	56
	.word	23
	.word	-9
	.word	-10
	.word	0
	.type	inputsignal, @object
	.size	inputsignal, 256
inputsignal:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	30
	.word	31
	.word	32
	.word	33
	.word	34
	.word	35
	.word	36
	.word	37
	.word	38
	.word	39
	.word	40
	.word	41
	.word	42
	.word	43
	.word	44
	.word	45
	.word	46
	.word	47
	.word	48
	.word	49
	.word	50
	.word	51
	.word	52
	.word	53
	.word	54
	.word	55
	.word	56
	.word	57
	.word	58
	.word	59
	.word	60
	.word	61
	.word	62
	.word	63
	.word	64
	.type	A, @object
	.size	A, 64
A:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.word	0
	.word	1
	.word	2
	.word	3
	.type	B, @object
	.size	B, 64
B:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.type	C, @object
	.size	C, 40
C:
	.word	893
	.word	40
	.word	3233
	.word	4267
	.word	2669
	.word	2541
	.word	9073
	.word	6023
	.word	5681
	.word	4622
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	inputbuffer, @object
	.size	inputbuffer, 44
inputbuffer:
	.zero	44
	.type	outputsignal, @object
	.size	outputsignal, 256
outputsignal:
	.zero	256
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.section	.sdata,"aw"
	.align	2
	.type	endflag, @object
	.size	endflag, 4
endflag:
	.word	1
	.text
.Letext0:
	.file 2 "header.h"
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4df
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x16
	.4byte	.LASF35
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL25
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x17
	.4byte	.LASF36
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x18
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x7
	.4byte	0x6a
	.4byte	0x88
	.byte	0x8
	.4byte	0x71
	.byte	0xa
	.byte	0
	.byte	0x4
	.4byte	.LASF11
	.byte	0x7
	.byte	0x5
	.4byte	0x78
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x4
	.4byte	.LASF12
	.byte	0x8
	.byte	0x5
	.4byte	0x78
	.byte	0x5
	.byte	0x3
	.4byte	inputbuffer
	.byte	0x7
	.4byte	0x6a
	.4byte	0xba
	.byte	0x8
	.4byte	0x71
	.byte	0x3f
	.byte	0
	.byte	0x4
	.4byte	.LASF13
	.byte	0x9
	.byte	0x5
	.4byte	0xaa
	.byte	0x5
	.byte	0x3
	.4byte	inputsignal
	.byte	0x4
	.4byte	.LASF14
	.byte	0x10
	.byte	0x5
	.4byte	0xaa
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0x7
	.4byte	0x6a
	.4byte	0xec
	.byte	0x8
	.4byte	0x71
	.byte	0xf
	.byte	0
	.byte	0xb
	.string	"A"
	.byte	0x14
	.byte	0x6
	.4byte	0xdc
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0xb
	.string	"B"
	.byte	0x19
	.byte	0x6
	.4byte	0xdc
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x4
	.4byte	.LASF15
	.byte	0x1e
	.byte	0x6
	.4byte	0xdc
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0x7
	.4byte	0x6a
	.4byte	0x12b
	.byte	0x8
	.4byte	0x71
	.byte	0x9
	.byte	0
	.byte	0xb
	.string	"C"
	.byte	0x22
	.byte	0x5
	.4byte	0x11b
	.byte	0x5
	.byte	0x3
	.4byte	C
	.byte	0x4
	.4byte	.LASF16
	.byte	0x24
	.byte	0x5
	.4byte	0x6a
	.byte	0x5
	.byte	0x3
	.4byte	endflag
	.byte	0xe
	.4byte	.LASF33
	.byte	0x90
	.byte	0x33
	.4byte	.LFB334
	.4byte	.LFE334-.LFB334
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF17
	.byte	0x8b
	.byte	0x33
	.4byte	0x18a
	.4byte	.LFB333
	.4byte	.LFE333-.LFB333
	.byte	0x1
	.byte	0x9c
	.4byte	0x18a
	.byte	0xc
	.4byte	.LVL59
	.4byte	0x18f
	.byte	0x3
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x30
	.byte	0x3
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x39
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	0x6a
	.byte	0xa
	.4byte	.LASF18
	.byte	0x83
	.byte	0x33
	.4byte	.LFB332
	.4byte	.LFE332-.LFB332
	.byte	0x1
	.byte	0x9c
	.4byte	0x209
	.byte	0x5
	.string	"low"
	.byte	0x83
	.byte	0x3c
	.4byte	0x6a
	.4byte	.LLST22
	.byte	0x5
	.string	"hi"
	.byte	0x83
	.byte	0x45
	.4byte	0x6a
	.4byte	.LLST23
	.byte	0xd
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.byte	0x1
	.string	"p"
	.byte	0x85
	.byte	0x7
	.4byte	0x6a
	.4byte	.LLST24
	.byte	0x19
	.4byte	.LVL54
	.4byte	0x209
	.4byte	0x1f1
	.byte	0x3
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x3
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LVL56
	.4byte	0x18f
	.byte	0x3
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x3
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0x7f
	.byte	0
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF23
	.byte	0x6f
	.4byte	0x6a
	.4byte	.LFB331
	.4byte	.LFE331-.LFB331
	.byte	0x1
	.byte	0x9c
	.4byte	0x273
	.byte	0x5
	.string	"low"
	.byte	0x6f
	.byte	0x40
	.4byte	0x6a
	.4byte	.LLST18
	.byte	0x11
	.string	"hi"
	.byte	0x6f
	.byte	0x48
	.4byte	0x6a
	.byte	0x1
	.byte	0x5b
	.byte	0x1a
	.4byte	.LASF19
	.byte	0x1
	.byte	0x70
	.byte	0x6
	.4byte	0x6a
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.string	"i"
	.byte	0x71
	.byte	0x6
	.4byte	0x6a
	.4byte	.LLST19
	.byte	0x1
	.string	"j"
	.byte	0x71
	.byte	0x10
	.4byte	0x6a
	.4byte	.LLST20
	.byte	0x12
	.4byte	.LASF20
	.byte	0x72
	.4byte	0x6a
	.4byte	.LLST21
	.byte	0
	.byte	0x9
	.4byte	.LASF21
	.byte	0x5b
	.byte	0x33
	.4byte	0x18a
	.4byte	.LFB330
	.4byte	.LFE330-.LFB330
	.byte	0x1
	.byte	0x9c
	.4byte	0x2e4
	.byte	0x1
	.string	"i"
	.byte	0x5d
	.byte	0x6
	.4byte	0x6a
	.4byte	.LLST14
	.byte	0x1
	.string	"j"
	.byte	0x5e
	.byte	0x6
	.4byte	0x6a
	.4byte	.LLST15
	.byte	0x1
	.string	"k"
	.byte	0x5f
	.byte	0x6
	.4byte	0x6a
	.4byte	.LLST16
	.byte	0x1
	.string	"sum"
	.byte	0x60
	.byte	0x6
	.4byte	0x6a
	.4byte	.LLST17
	.byte	0x1b
	.string	"kk"
	.byte	0x1
	.byte	0x61
	.byte	0x6
	.4byte	0x6a
	.byte	0x1c
	.4byte	.LASF22
	.byte	0x1
	.byte	0x62
	.byte	0xf
	.4byte	0x71
	.byte	0
	.byte	0x6
	.4byte	.LVL32
	.4byte	0x4d9
	.byte	0
	.byte	0x1d
	.string	"fir"
	.byte	0x1
	.byte	0x52
	.byte	0x33
	.4byte	0x18a
	.4byte	.LFB329
	.4byte	.LFE329-.LFB329
	.byte	0x1
	.byte	0x9c
	.4byte	0x328
	.byte	0x13
	.4byte	.LLRL12
	.4byte	0x31e
	.byte	0x1
	.string	"i"
	.byte	0x54
	.byte	0xa
	.4byte	0x6a
	.4byte	.LLST13
	.byte	0x6
	.4byte	.LVL27
	.4byte	0x328
	.byte	0
	.byte	0x6
	.4byte	.LVL25
	.4byte	0x392
	.byte	0
	.byte	0x10
	.4byte	.LASF24
	.byte	0x45
	.4byte	0x6a
	.4byte	.LFB328
	.4byte	.LFE328-.LFB328
	.byte	0x1
	.byte	0x9c
	.4byte	0x392
	.byte	0x1e
	.4byte	.LASF25
	.byte	0x1
	.byte	0x45
	.byte	0x40
	.4byte	0x6a
	.4byte	.LLST6
	.byte	0x12
	.4byte	.LASF26
	.byte	0x4b
	.4byte	0x6a
	.4byte	.LLST7
	.byte	0x13
	.4byte	.LLRL8
	.4byte	0x375
	.byte	0x1
	.string	"i"
	.byte	0x46
	.byte	0xa
	.4byte	0x6a
	.4byte	.LLST9
	.byte	0
	.byte	0x14
	.4byte	.LLRL10
	.byte	0x1
	.string	"i"
	.byte	0x4c
	.byte	0xa
	.4byte	0x6a
	.4byte	.LLST11
	.byte	0x6
	.4byte	.LVL22
	.4byte	0x4d9
	.byte	0
	.byte	0
	.byte	0x1f
	.4byte	.LASF37
	.byte	0x1
	.byte	0x3e
	.byte	0x33
	.4byte	.LFB327
	.4byte	.LFE327-.LFB327
	.byte	0x1
	.byte	0x9c
	.4byte	0x3bc
	.byte	0x14
	.4byte	.LLRL4
	.byte	0x1
	.string	"i"
	.byte	0x3f
	.byte	0xa
	.4byte	0x6a
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF27
	.byte	0x2f
	.byte	0x2f
	.4byte	0x6a
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.byte	0x1
	.byte	0x9c
	.4byte	0x3fa
	.byte	0x15
	.string	"num"
	.byte	0x31
	.byte	0x9
	.4byte	0x6a
	.byte	0x1
	.byte	0x5a
	.byte	0xd
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x1
	.string	"i"
	.byte	0x33
	.byte	0x11
	.4byte	0x6a
	.4byte	.LLST3
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF28
	.byte	0x22
	.byte	0x30
	.4byte	0x438
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.byte	0x1
	.byte	0x9c
	.4byte	0x438
	.byte	0x15
	.string	"num"
	.byte	0x24
	.byte	0x7
	.4byte	0x438
	.byte	0x1
	.byte	0x5a
	.byte	0xd
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x1
	.string	"i"
	.byte	0x26
	.byte	0x11
	.4byte	0x6a
	.4byte	.LLST2
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF29
	.byte	0x20
	.4byte	0x438
	.byte	0xa
	.4byte	.LASF30
	.byte	0x1b
	.byte	0x30
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.byte	0x1
	.byte	0x9c
	.4byte	0x470
	.byte	0x5
	.string	"s"
	.byte	0x1b
	.byte	0x4e
	.4byte	0x470
	.4byte	.LLST1
	.byte	0x6
	.4byte	.LVL9
	.4byte	0x475
	.byte	0
	.byte	0xf
	.4byte	0x43f
	.byte	0xa
	.4byte	.LASF31
	.byte	0x11
	.byte	0x30
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x4a7
	.byte	0x5
	.string	"c"
	.byte	0x11
	.byte	0x45
	.4byte	0x438
	.4byte	.LLST0
	.byte	0xc
	.4byte	.LVL3
	.4byte	0x475
	.byte	0x3
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	.LASF32
	.byte	0xb
	.byte	0x30
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.byte	0x1
	.byte	0x9c
	.4byte	0x4c8
	.byte	0x11
	.string	"n"
	.byte	0xb
	.byte	0x3f
	.4byte	0x6a
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0xe
	.4byte	.LASF34
	.byte	0x6
	.byte	0x30
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.byte	0x21
	.4byte	.LASF38
	.4byte	.LASF38
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x32
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST22:
	.byte	0x7
	.4byte	.LVL52
	.4byte	.LVL53
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL53
	.4byte	.LFE332
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST23:
	.byte	0x7
	.4byte	.LVL52
	.4byte	.LVL53
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL53
	.4byte	.LVL58
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL58
	.4byte	.LFE332
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST24:
	.byte	0x7
	.4byte	.LVL55
	.4byte	.LVL57
	.byte	0x1
	.byte	0x59
	.byte	0
.LLST18:
	.byte	0x7
	.4byte	.LVL40
	.4byte	.LVL43
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL43
	.4byte	.LFE331
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL47
	.byte	0x1
	.byte	0x56
	.byte	0x7
	.4byte	.LVL47
	.4byte	.LVL49
	.byte	0x3
	.byte	0x76
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL49
	.4byte	.LVL50
	.byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL50
	.4byte	.LFE331
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST20:
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL43
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL43
	.4byte	.LFE331
	.byte	0x1
	.byte	0x5d
	.byte	0
.LLST21:
	.byte	0x7
	.4byte	.LVL44
	.4byte	.LVL45
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL47
	.4byte	.LVL48
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0
.LLST14:
	.byte	0x7
	.4byte	.LVL28
	.4byte	.LVL29
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x7
	.4byte	.LVL29
	.4byte	.LVL30
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL38
	.byte	0x1
	.byte	0x64
	.byte	0
.LLST16:
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL31
	.byte	0x1
	.byte	0x63
	.byte	0x7
	.4byte	.LVL31
	.4byte	.LVL33
	.byte	0x3
	.byte	0x83
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL33
	.4byte	.LVL35
	.byte	0x1
	.byte	0x63
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL36
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL36
	.4byte	.LVL37
	.byte	0x1
	.byte	0x63
	.byte	0
.LLST17:
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL35
	.byte	0x1
	.byte	0x68
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL36
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL36
	.4byte	.LVL39
	.byte	0x1
	.byte	0x68
	.byte	0
.LLST13:
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LVL26
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL21
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL21
	.4byte	.LFE328
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL21
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL21
	.4byte	.LVL24
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LFE328
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST9:
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL19
	.byte	0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL21
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL17
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL14
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LFE324
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LFE323
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x84
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.4byte	.LFB327
	.4byte	.LFE327-.LFB327
	.4byte	.LFB328
	.4byte	.LFE328-.LFB328
	.4byte	.LFB329
	.4byte	.LFE329-.LFB329
	.4byte	.LFB330
	.4byte	.LFE330-.LFB330
	.4byte	.LFB331
	.4byte	.LFE331-.LFB331
	.4byte	.LFB332
	.4byte	.LFE332-.LFB332
	.4byte	.LFB333
	.4byte	.LFE333-.LFB333
	.4byte	.LFB334
	.4byte	.LFE334-.LFB334
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL4:
	.byte	0x6
	.4byte	.LBB4
	.4byte	.LBE4
	.byte	0x6
	.4byte	.LBB5
	.4byte	.LBE5
	.byte	0
.LLRL8:
	.byte	0x6
	.4byte	.LBB6
	.4byte	.LBE6
	.byte	0x6
	.4byte	.LBB7
	.4byte	.LBE7
	.byte	0
.LLRL10:
	.byte	0x6
	.4byte	.LBB8
	.4byte	.LBE8
	.byte	0x6
	.4byte	.LBB9
	.4byte	.LBE9
	.byte	0x6
	.4byte	.LBB10
	.4byte	.LBE10
	.byte	0
.LLRL12:
	.byte	0x6
	.4byte	.LBB11
	.4byte	.LBE11
	.byte	0x6
	.4byte	.LBB12
	.4byte	.LBE12
	.byte	0
.LLRL25:
	.byte	0x6
	.4byte	.LFB321
	.4byte	.LFE321
	.byte	0x6
	.4byte	.LFB322
	.4byte	.LFE322
	.byte	0x6
	.4byte	.LFB323
	.4byte	.LFE323
	.byte	0x6
	.4byte	.LFB324
	.4byte	.LFE324
	.byte	0x6
	.4byte	.LFB325
	.4byte	.LFE325
	.byte	0x6
	.4byte	.LFB326
	.4byte	.LFE326
	.byte	0x6
	.4byte	.LFB327
	.4byte	.LFE327
	.byte	0x6
	.4byte	.LFB328
	.4byte	.LFE328
	.byte	0x6
	.4byte	.LFB329
	.4byte	.LFE329
	.byte	0x6
	.4byte	.LFB330
	.4byte	.LFE330
	.byte	0x6
	.4byte	.LFB331
	.4byte	.LFE331
	.byte	0x6
	.4byte	.LFB332
	.4byte	.LFE332
	.byte	0x6
	.4byte	.LFB333
	.4byte	.LFE333
	.byte	0x6
	.4byte	.LFB334
	.4byte	.LFE334
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF13:
	.string	"inputsignal"
.LASF37:
	.string	"initfir"
.LASF22:
	.string	"count"
.LASF28:
	.string	"uart_read_char"
.LASF33:
	.string	"check"
.LASF18:
	.string	"sort"
.LASF27:
	.string	"uart_read"
.LASF21:
	.string	"matmul"
.LASF17:
	.string	"qsort"
.LASF16:
	.string	"endflag"
.LASF6:
	.string	"unsigned char"
.LASF34:
	.string	"uart_end"
.LASF8:
	.string	"long unsigned int"
.LASF20:
	.string	"temp"
.LASF7:
	.string	"short unsigned int"
.LASF26:
	.string	"outputsample"
.LASF23:
	.string	"partition"
.LASF38:
	.string	"__mulsi3"
.LASF10:
	.string	"unsigned int"
.LASF35:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF11:
	.string	"taps"
.LASF9:
	.string	"long long unsigned int"
.LASF15:
	.string	"result"
.LASF32:
	.string	"uart_write"
.LASF12:
	.string	"inputbuffer"
.LASF31:
	.string	"uart_write_char"
.LASF14:
	.string	"outputsignal"
.LASF5:
	.string	"long long int"
.LASF29:
	.string	"char"
.LASF3:
	.string	"short int"
.LASF30:
	.string	"uart_write_string"
.LASF24:
	.string	"firfilter"
.LASF36:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF19:
	.string	"pivot"
.LASF2:
	.string	"signed char"
.LASF25:
	.string	"inputsample"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/SoC_Design/Final/testbench/counter_la"
.LASF0:
	.string	"uart.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
