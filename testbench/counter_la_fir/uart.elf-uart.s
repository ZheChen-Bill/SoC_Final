	.file	"uart.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/SoC_Design/Final/testbench/counter_la_fir" "uart.c"
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
	.loc 1 63 38 is_stmt 0
	lui	a5,%hi(data_length)
	lw	a4,%lo(data_length)(a5)
	li	a5,805306368
	addi	a3,a5,32
	sw	a4,16(a5)
	.loc 1 64 2 is_stmt 1
.LBB4:
	.loc 1 64 6
.LVL16:
	.loc 1 64 24
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	a5,a5,76
.LVL17:
.L19:
	.loc 1 65 3 discriminator 3
	.loc 1 65 52 is_stmt 0 discriminator 3
	lw	a2,0(a4)
	.loc 1 64 24 discriminator 3
	addi	a3,a3,4
	addi	a4,a4,4
	.loc 1 65 46 discriminator 3
	sw	a2,-4(a3)
	.loc 1 64 29 is_stmt 1 discriminator 3
	.loc 1 64 24 discriminator 3
	bne	a3,a5,.L19
.LBE4:
	.loc 1 67 1 is_stmt 0
	ret
	.cfi_endproc
.LFE327:
	.size	initfir, .-initfir
	.align	2
	.globl	ap_start
	.type	ap_start, @function
ap_start:
.LFB328:
	.loc 1 70 62 is_stmt 1
	.cfi_startproc
	.loc 1 72 10 is_stmt 0
	li	a5,805306368
.L22:
	.loc 1 71 2 is_stmt 1
	.loc 1 72 3
	.loc 1 72 10 is_stmt 0
	lw	a4,0(a5)
	.loc 1 72 45
	andi	a4,a4,4
	.loc 1 72 6
	beq	a4,zero,.L22
	.loc 1 73 4 is_stmt 1
	.loc 1 73 47 is_stmt 0
	lw	a4,0(a5)
	.loc 1 73 82
	ori	a4,a4,1
	.loc 1 73 42
	sw	a4,0(a5)
	.loc 1 74 4 is_stmt 1
	.loc 1 77 1 is_stmt 0
	ret
	.cfi_endproc
.LFE328:
	.size	ap_start, .-ap_start
	.align	2
	.globl	start_DMA
	.type	start_DMA, @function
start_DMA:
.LFB329:
	.loc 1 79 63 is_stmt 1
	.cfi_startproc
	.loc 1 80 2
	.loc 1 80 38 is_stmt 0
	li	a5,805306368
	li	a4,939532288
	sw	a4,128(a5)
	.loc 1 81 2 is_stmt 1
	.loc 1 81 38 is_stmt 0
	lui	a4,%hi(data_length)
	lw	a4,%lo(data_length)(a4)
	sw	a4,132(a5)
	.loc 1 82 1
	ret
	.cfi_endproc
.LFE329:
	.size	start_DMA, .-start_DMA
	.align	2
	.globl	check_output
	.type	check_output, @function
check_output:
.LFB330:
	.loc 1 84 74 is_stmt 1
	.cfi_startproc
.LVL18:
	.loc 1 85 2
	.loc 1 85 48 is_stmt 0
	li	a5,234885120
	addi	a5,a5,-1024
	add	a0,a0,a5
.LVL19:
	slli	a0,a0,2
.LVL20:
	.loc 1 85 15
	lw	a0,0(a0)
	.loc 1 85 12
	lui	a5,%hi(reg_fir_y)
	sw	a0,%lo(reg_fir_y)(a5)
	.loc 1 86 2 is_stmt 1
	.loc 1 87 1 is_stmt 0
	ret
	.cfi_endproc
.LFE330:
	.size	check_output, .-check_output
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB331:
	.loc 1 89 56 is_stmt 1
	.cfi_startproc
	.loc 1 90 2
	tail	initfir
.LVL21:
	.cfi_endproc
.LFE331:
	.size	fir, .-fir
	.globl	__mulsi3
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB332:
	.loc 1 100 1
	.cfi_startproc
	.loc 1 101 2
.LVL22:
	.loc 1 102 2
	.loc 1 103 2
	.loc 1 104 2
	.loc 1 105 2
	.loc 1 106 2
	.loc 1 107 2
	.loc 1 107 13
	.loc 1 100 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	lui	a5,%hi(.LANCHOR0)
	sw	s0,56(sp)
	sw	s11,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 27, -52
	addi	s0,a5,%lo(.LANCHOR0)
	lui	s11,%hi(.LANCHOR1)
	sw	s1,52(sp)
	sw	s5,36(sp)
	sw	s7,28(sp)
	sw	ra,60(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s6,32(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	.cfi_offset 9, -12
	.cfi_offset 21, -28
	.cfi_offset 23, -36
	.cfi_offset 1, -4
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	addi	s0,s0,44
	addi	s5,s11,%lo(.LANCHOR1)
	.loc 1 108 9
	li	s7,0
	addi	s1,a5,%lo(.LANCHOR0)
.LVL23:
.L29:
	.loc 1 108 14 is_stmt 1
	addi	s6,s1,108
	.loc 1 110 10 is_stmt 0
	mv	s4,s5
	.loc 1 108 9
	li	s3,0
	j	.L33
.LVL24:
.L30:
	.loc 1 111 5 is_stmt 1 discriminator 3
	.loc 1 111 25 is_stmt 0 discriminator 3
	lw	a1,0(s10)
	lw	a0,0(s9)
	.loc 1 110 19 discriminator 3
	addi	s2,s2,1
.LVL25:
	.loc 1 110 15 discriminator 3
	addi	s9,s9,4
	.loc 1 111 25 discriminator 3
	call	__mulsi3
.LVL26:
	.loc 1 110 15 discriminator 3
	li	a5,4
	.loc 1 111 9 discriminator 3
	add	s8,s8,a0
.LVL27:
	.loc 1 110 19 is_stmt 1 discriminator 3
	.loc 1 110 15 discriminator 3
	addi	s10,s10,16
	li	a4,16
	bne	s2,a5,.L30
	.loc 1 112 4 discriminator 2
	.loc 1 112 22 is_stmt 0 discriminator 2
	sw	s8,0(s4)
	.loc 1 108 19 is_stmt 1 discriminator 2
	addi	s3,s3,1
.LVL28:
	.loc 1 108 14 discriminator 2
	addi	s4,s4,4
	addi	s6,s6,4
	beq	s3,s2,.L31
.LVL29:
.L33:
	.loc 1 110 15
	.loc 1 100 1 is_stmt 0
	mv	s10,s6
	mv	s9,s0
	.loc 1 109 8
	li	s8,0
	.loc 1 110 10
	li	s2,0
	j	.L30
.LVL30:
.L31:
	.loc 1 107 18 is_stmt 1 discriminator 2
	.loc 1 107 13 discriminator 2
	addi	s7,s7,4
	addi	s0,s0,16
	addi	s5,s5,16
	bne	s7,a4,.L29
	.loc 1 115 2
	.loc 1 116 1 is_stmt 0
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
.LVL31:
	lw	s3,44(sp)
	.cfi_restore 19
.LVL32:
	lw	s4,40(sp)
	.cfi_restore 20
	lw	s5,36(sp)
	.cfi_restore 21
	lw	s6,32(sp)
	.cfi_restore 22
	lw	s7,28(sp)
	.cfi_restore 23
	lw	s8,24(sp)
	.cfi_restore 24
.LVL33:
	lw	s9,20(sp)
	.cfi_restore 25
	lw	s10,16(sp)
	.cfi_restore 26
	addi	a0,s11,%lo(.LANCHOR1)
	lw	s11,12(sp)
	.cfi_restore 27
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE332:
	.size	matmul, .-matmul
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB333:
	.loc 1 119 75 is_stmt 1
	.cfi_startproc
.LVL34:
	.loc 1 120 2
	.loc 1 120 6 is_stmt 0
	lui	a4,%hi(.LANCHOR0)
	addi	a5,a4,%lo(.LANCHOR0)
	slli	a7,a1,2
	add	a2,a5,a7
	lw	t4,172(a2)
.LVL35:
	.loc 1 121 2 is_stmt 1
	addi	a5,a5,172
	slli	a2,a0,2
	.loc 1 119 75 is_stmt 0
	mv	a3,a0
	.loc 1 121 6
	addi	t1,a0,-1
.LVL36:
	.loc 1 122 2 is_stmt 1
	.loc 1 123 2
	add	a5,a5,a2
	addi	a4,a4,%lo(.LANCHOR0)
.LVL37:
.L37:
	.loc 1 123 15 discriminator 1
	.loc 1 125 6 is_stmt 0 discriminator 1
	addi	a0,t1,1
	.loc 1 126 9 discriminator 1
	slli	a2,a0,2
	add	a2,a4,a2
	lw	a6,172(a2)
	.loc 1 123 15 discriminator 1
	blt	a3,a1,.L39
	.loc 1 131 2 is_stmt 1
	.loc 1 131 6 is_stmt 0
	add	a5,a4,a7
	lw	a4,172(a5)
	.loc 1 131 4
	bge	a4,a6,.L36
	.loc 1 132 3 is_stmt 1
.LVL38:
	.loc 1 133 3
	.loc 1 133 10 is_stmt 0
	sw	a4,172(a2)
.LVL39:
	.loc 1 134 3 is_stmt 1
	.loc 1 134 9 is_stmt 0
	sw	a6,172(a5)
	.loc 1 136 2 is_stmt 1
.LVL40:
.L36:
	.loc 1 137 1 is_stmt 0
	ret
.L39:
	.loc 1 124 3 is_stmt 1
	.loc 1 124 7 is_stmt 0
	lw	t3,0(a5)
	.loc 1 124 5
	bge	t3,t4,.L38
	.loc 1 125 4 is_stmt 1
.LVL41:
	.loc 1 126 4
	.loc 1 127 4
	.loc 1 127 9 is_stmt 0
	sw	t3,172(a2)
.LVL42:
	.loc 1 128 4 is_stmt 1
	.loc 1 128 9 is_stmt 0
	sw	a6,0(a5)
.LVL43:
	.loc 1 125 6
	mv	t1,a0
.LVL44:
.L38:
	.loc 1 123 20 is_stmt 1 discriminator 2
	addi	a3,a3,1
.LVL45:
	addi	a5,a5,4
	j	.L37
	.cfi_endproc
.LFE333:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB334:
	.loc 1 139 72
	.cfi_startproc
.LVL46:
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
.LVL47:
.L43:
	.loc 1 140 2
	.loc 1 140 4 is_stmt 0
	bge	s0,s2,.L41
.LBB5:
	.loc 1 141 3 is_stmt 1
	.loc 1 141 11 is_stmt 0
	mv	a1,s2
	mv	a0,s0
	call	partition
.LVL48:
	mv	s1,a0
.LVL49:
	.loc 1 142 3 is_stmt 1
	addi	a1,a0,-1
	mv	a0,s0
	call	sort
.LVL50:
	.loc 1 143 3
	addi	s0,s1,1
	j	.L43
.LVL51:
.L41:
.LBE5:
	.loc 1 145 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
.LVL52:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE334:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB335:
	.loc 1 147 58 is_stmt 1
	.cfi_startproc
	.loc 1 148 2
	.loc 1 147 58 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 148 2
	li	a0,0
	li	a1,9
	.loc 1 147 58
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 148 2
	call	sort
.LVL53:
	.loc 1 149 2 is_stmt 1
	.loc 1 150 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lui	a0,%hi(.LANCHOR0+172)
	addi	a0,a0,%lo(.LANCHOR0+172)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE335:
	.size	qsort, .-qsort
	.align	2
	.globl	check
	.type	check, @function
check:
.LFB336:
	.loc 1 152 58 is_stmt 1
	.cfi_startproc
	.loc 1 154 2
	.loc 1 154 17
	.loc 1 156 3
	.loc 1 157 1 is_stmt 0
	ret
	.cfi_endproc
.LFE336:
	.size	check, .-check
	.globl	endflag
	.globl	C
	.globl	result
	.globl	B
	.globl	A
	.globl	outputsignal
	.globl	inputsignal
	.globl	reg_fir_y
	.globl	taps
	.globl	data_length
	.data
	.align	2
	.set	.LANCHOR0,. + 0
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
	.set	.LANCHOR1,. + 0
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.section	.inputdata,"aw"
	.align	2
	.type	inputsignal, @object
	.size	inputsignal, 256
inputsignal:
	.word	0
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
	.section	.outputdata,"aw"
	.align	2
	.type	outputsignal, @object
	.size	outputsignal, 256
outputsignal:
	.zero	256
	.section	.sbss,"aw",@nobits
	.align	2
	.type	reg_fir_y, @object
	.size	reg_fir_y, 4
reg_fir_y:
	.zero	4
	.section	.sdata,"aw"
	.align	2
	.type	endflag, @object
	.size	endflag, 4
endflag:
	.word	1
	.type	data_length, @object
	.size	data_length, 4
data_length:
	.word	64
	.text
.Letext0:
	.file 2 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.file 3 "header.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4c7
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x15
	.4byte	.LASF40
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL17
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0xe
	.4byte	.LASF8
	.byte	0x28
	.byte	0x12
	.4byte	0x3f
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0xe
	.4byte	.LASF9
	.byte	0x34
	.byte	0x1b
	.4byte	0x66
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0x16
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xf
	.4byte	0x74
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.byte	0x3
	.4byte	.LASF13
	.byte	0x9
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	data_length
	.byte	0x6
	.4byte	0x74
	.4byte	0xa8
	.byte	0x7
	.4byte	0x80
	.byte	0xa
	.byte	0
	.byte	0x3
	.4byte	.LASF14
	.byte	0xa
	.byte	0x5
	.4byte	0x98
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x3
	.4byte	.LASF15
	.byte	0xb
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	reg_fir_y
	.byte	0x6
	.4byte	0x7b
	.4byte	0xda
	.byte	0x7
	.4byte	0x80
	.byte	0x3f
	.byte	0
	.byte	0xf
	.4byte	0xca
	.byte	0x3
	.4byte	.LASF16
	.byte	0xd
	.byte	0x35
	.4byte	0xda
	.byte	0x5
	.byte	0x3
	.4byte	inputsignal
	.byte	0x3
	.4byte	.LASF17
	.byte	0x14
	.byte	0x36
	.4byte	0xda
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0x6
	.4byte	0x74
	.4byte	0x111
	.byte	0x7
	.4byte	0x80
	.byte	0xf
	.byte	0
	.byte	0xc
	.string	"A"
	.byte	0x33
	.byte	0x6
	.4byte	0x101
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0xc
	.string	"B"
	.byte	0x38
	.byte	0x6
	.4byte	0x101
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x3
	.4byte	.LASF18
	.byte	0x3d
	.byte	0x6
	.4byte	0x101
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0x6
	.4byte	0x74
	.4byte	0x150
	.byte	0x7
	.4byte	0x80
	.byte	0x9
	.byte	0
	.byte	0xc
	.string	"C"
	.byte	0x41
	.byte	0x5
	.4byte	0x140
	.byte	0x5
	.byte	0x3
	.4byte	C
	.byte	0x3
	.4byte	.LASF19
	.byte	0x43
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	endflag
	.byte	0x8
	.4byte	.LASF29
	.byte	0x98
	.byte	0x33
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF20
	.byte	0x93
	.byte	0x33
	.4byte	0x1af
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.byte	0x1
	.byte	0x9c
	.4byte	0x1af
	.byte	0xd
	.4byte	.LVL53
	.4byte	0x1b4
	.byte	0x4
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x30
	.byte	0x4
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x39
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	0x74
	.byte	0xa
	.4byte	.LASF21
	.byte	0x8b
	.byte	0x33
	.4byte	.LFB334
	.4byte	.LFE334-.LFB334
	.byte	0x1
	.byte	0x9c
	.4byte	0x22e
	.byte	0x5
	.string	"low"
	.byte	0x8b
	.byte	0x3c
	.4byte	0x74
	.4byte	.LLST14
	.byte	0x5
	.string	"hi"
	.byte	0x8b
	.byte	0x45
	.4byte	0x74
	.4byte	.LLST15
	.byte	0xb
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.byte	0x2
	.string	"p"
	.byte	0x8d
	.byte	0x7
	.4byte	0x74
	.4byte	.LLST16
	.byte	0x17
	.4byte	.LVL48
	.4byte	0x22e
	.4byte	0x216
	.byte	0x4
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	.LVL50
	.4byte	0x1b4
	.byte	0x4
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0x7f
	.byte	0
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF26
	.byte	0x77
	.4byte	0x74
	.4byte	.LFB333
	.4byte	.LFE333-.LFB333
	.byte	0x1
	.byte	0x9c
	.4byte	0x29a
	.byte	0x5
	.string	"low"
	.byte	0x77
	.byte	0x40
	.4byte	0x74
	.4byte	.LLST10
	.byte	0x12
	.string	"hi"
	.byte	0x77
	.byte	0x48
	.4byte	0x74
	.byte	0x1
	.byte	0x5b
	.byte	0x18
	.4byte	.LASF22
	.byte	0x1
	.byte	0x78
	.byte	0x6
	.4byte	0x74
	.byte	0x1
	.byte	0x6d
	.byte	0x2
	.string	"i"
	.byte	0x79
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST11
	.byte	0x2
	.string	"j"
	.byte	0x79
	.byte	0x10
	.4byte	0x74
	.4byte	.LLST12
	.byte	0x19
	.4byte	.LASF23
	.byte	0x1
	.byte	0x7a
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST13
	.byte	0
	.byte	0x9
	.4byte	.LASF24
	.byte	0x63
	.byte	0x33
	.4byte	0x1af
	.4byte	.LFB332
	.4byte	.LFE332-.LFB332
	.byte	0x1
	.byte	0x9c
	.4byte	0x30b
	.byte	0x2
	.string	"i"
	.byte	0x65
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST6
	.byte	0x2
	.string	"j"
	.byte	0x66
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST7
	.byte	0x2
	.string	"k"
	.byte	0x67
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST8
	.byte	0x2
	.string	"sum"
	.byte	0x68
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST9
	.byte	0x1a
	.string	"kk"
	.byte	0x1
	.byte	0x69
	.byte	0x6
	.4byte	0x74
	.byte	0x1b
	.4byte	.LASF25
	.byte	0x1
	.byte	0x6a
	.byte	0xf
	.4byte	0x80
	.byte	0
	.byte	0x13
	.4byte	.LVL26
	.4byte	0x4c1
	.byte	0
	.byte	0x1c
	.string	"fir"
	.byte	0x1
	.byte	0x59
	.byte	0x33
	.4byte	.LFB331
	.4byte	.LFE331-.LFB331
	.byte	0x1
	.byte	0x9c
	.4byte	0x32b
	.byte	0x1d
	.4byte	.LVL21
	.4byte	0x376
	.byte	0
	.byte	0x11
	.4byte	.LASF27
	.byte	0x54
	.4byte	0x74
	.4byte	.LFB330
	.4byte	.LFE330-.LFB330
	.byte	0x1
	.byte	0x9c
	.4byte	0x354
	.byte	0x1e
	.4byte	.LASF28
	.byte	0x1
	.byte	0x54
	.byte	0x43
	.4byte	0x74
	.4byte	.LLST5
	.byte	0
	.byte	0x8
	.4byte	.LASF30
	.byte	0x4f
	.byte	0x33
	.4byte	.LFB329
	.4byte	.LFE329-.LFB329
	.byte	0x1
	.byte	0x9c
	.byte	0x8
	.4byte	.LASF31
	.byte	0x46
	.byte	0x33
	.4byte	.LFB328
	.4byte	.LFE328-.LFB328
	.byte	0x1
	.byte	0x9c
	.byte	0x1f
	.4byte	.LASF32
	.byte	0x1
	.byte	0x3e
	.byte	0x33
	.4byte	.LFB327
	.4byte	.LFE327-.LFB327
	.byte	0x1
	.byte	0x9c
	.4byte	0x3a4
	.byte	0xb
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x2
	.string	"i"
	.byte	0x40
	.byte	0x13
	.4byte	0x74
	.4byte	.LLST4
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF33
	.byte	0x2f
	.byte	0x2f
	.4byte	0x74
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.byte	0x1
	.byte	0x9c
	.4byte	0x3e2
	.byte	0x14
	.string	"num"
	.byte	0x31
	.byte	0x9
	.4byte	0x74
	.byte	0x1
	.byte	0x5a
	.byte	0xb
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x2
	.string	"i"
	.byte	0x33
	.byte	0x11
	.4byte	0x74
	.4byte	.LLST3
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF34
	.byte	0x22
	.byte	0x30
	.4byte	0x420
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.byte	0x1
	.byte	0x9c
	.4byte	0x420
	.byte	0x14
	.string	"num"
	.byte	0x24
	.byte	0x7
	.4byte	0x420
	.byte	0x1
	.byte	0x5a
	.byte	0xb
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x2
	.string	"i"
	.byte	0x26
	.byte	0x11
	.4byte	0x74
	.4byte	.LLST2
	.byte	0
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF35
	.byte	0x20
	.4byte	0x420
	.byte	0xa
	.4byte	.LASF36
	.byte	0x1b
	.byte	0x30
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.byte	0x1
	.byte	0x9c
	.4byte	0x458
	.byte	0x5
	.string	"s"
	.byte	0x1b
	.byte	0x4e
	.4byte	0x458
	.4byte	.LLST1
	.byte	0x13
	.4byte	.LVL9
	.4byte	0x45d
	.byte	0
	.byte	0x10
	.4byte	0x427
	.byte	0xa
	.4byte	.LASF37
	.byte	0x11
	.byte	0x30
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x48f
	.byte	0x5
	.string	"c"
	.byte	0x11
	.byte	0x45
	.4byte	0x420
	.4byte	.LLST0
	.byte	0xd
	.4byte	.LVL3
	.4byte	0x45d
	.byte	0x4
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	.LASF38
	.byte	0xb
	.byte	0x30
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.byte	0x1
	.byte	0x9c
	.4byte	0x4b0
	.byte	0x12
	.string	"n"
	.byte	0xb
	.byte	0x3f
	.4byte	0x74
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x8
	.4byte	.LASF39
	.byte	0x6
	.byte	0x30
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.byte	0x21
	.4byte	.LASF41
	.4byte	.LASF41
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
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
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
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
	.byte	0x4
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x3
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
	.byte	0xd
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x16
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
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x82,0x1
	.byte	0x19
	.byte	0x7f
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
.LLST14:
	.byte	0x7
	.4byte	.LVL46
	.4byte	.LVL47
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL47
	.4byte	.LFE334
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x7
	.4byte	.LVL46
	.4byte	.LVL47
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL47
	.4byte	.LVL52
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL52
	.4byte	.LFE334
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST16:
	.byte	0x7
	.4byte	.LVL49
	.4byte	.LVL51
	.byte	0x1
	.byte	0x59
	.byte	0
.LLST10:
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL37
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LFE333
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL36
	.4byte	.LVL41
	.byte	0x1
	.byte	0x56
	.byte	0x7
	.4byte	.LVL41
	.4byte	.LVL43
	.byte	0x3
	.byte	0x76
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL43
	.4byte	.LVL44
	.byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL44
	.4byte	.LFE333
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST12:
	.byte	0x7
	.4byte	.LVL36
	.4byte	.LVL37
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LFE333
	.byte	0x1
	.byte	0x5d
	.byte	0
.LLST13:
	.byte	0x7
	.4byte	.LVL38
	.4byte	.LVL39
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL41
	.4byte	.LVL42
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL22
	.4byte	.LVL23
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL23
	.4byte	.LVL24
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL32
	.byte	0x1
	.byte	0x63
	.byte	0
.LLST8:
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL25
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LVL27
	.byte	0x3
	.byte	0x82
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL27
	.4byte	.LVL29
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL29
	.4byte	.LVL30
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL31
	.byte	0x1
	.byte	0x62
	.byte	0
.LLST9:
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL29
	.byte	0x1
	.byte	0x68
	.byte	0x7
	.4byte	.LVL29
	.4byte	.LVL30
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL33
	.byte	0x1
	.byte	0x68
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL19
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL20
	.byte	0x7
	.byte	0x7a
	.byte	0x80,0xe8,0xff,0x8f,0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LFE330
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST4:
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
	.4byte	0x94
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
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
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
.LLRL17:
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
	.byte	0x6
	.4byte	.LFB335
	.4byte	.LFE335
	.byte	0x6
	.4byte	.LFB336
	.4byte	.LFE336
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF16:
	.string	"inputsignal"
.LASF32:
	.string	"initfir"
.LASF25:
	.string	"count"
.LASF34:
	.string	"uart_read_char"
.LASF30:
	.string	"start_DMA"
.LASF29:
	.string	"check"
.LASF21:
	.string	"sort"
.LASF33:
	.string	"uart_read"
.LASF27:
	.string	"check_output"
.LASF24:
	.string	"matmul"
.LASF20:
	.string	"qsort"
.LASF19:
	.string	"endflag"
.LASF6:
	.string	"unsigned char"
.LASF39:
	.string	"uart_end"
.LASF10:
	.string	"long unsigned int"
.LASF23:
	.string	"temp"
.LASF7:
	.string	"short unsigned int"
.LASF31:
	.string	"ap_start"
.LASF26:
	.string	"partition"
.LASF41:
	.string	"__mulsi3"
.LASF12:
	.string	"unsigned int"
.LASF40:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF14:
	.string	"taps"
.LASF11:
	.string	"long long unsigned int"
.LASF18:
	.string	"result"
.LASF38:
	.string	"uart_write"
.LASF15:
	.string	"reg_fir_y"
.LASF8:
	.string	"int32_t"
.LASF37:
	.string	"uart_write_char"
.LASF17:
	.string	"outputsignal"
.LASF5:
	.string	"long long int"
.LASF35:
	.string	"char"
.LASF3:
	.string	"short int"
.LASF13:
	.string	"data_length"
.LASF36:
	.string	"uart_write_string"
.LASF28:
	.string	"index"
.LASF9:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF22:
	.string	"pivot"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/SoC_Design/Final/testbench/counter_la_fir"
.LASF0:
	.string	"uart.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
