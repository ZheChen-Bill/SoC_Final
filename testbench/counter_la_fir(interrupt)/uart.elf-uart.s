	.file	"uart.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/SoC_Design/Final/testbench/counter_la_fir(interrupt)" "uart.c"
	.section	.mprj,"ax",@progbits
	.align	2
	.globl	uart_start
	.type	uart_start, @function
uart_start:
.LFB321:
	.file 1 "uart.c"
	.loc 1 7 1
	.cfi_startproc
	.loc 1 8 5
	.loc 1 8 15 is_stmt 0
	lui	a5,%hi(startflag)
	li	a4,1
	sw	a4,%lo(startflag)(a5)
	.loc 1 9 1
	ret
	.cfi_endproc
.LFE321:
	.size	uart_start, .-uart_start
	.align	2
	.globl	uart_end
	.type	uart_end, @function
uart_end:
.LFB322:
	.loc 1 12 1 is_stmt 1
	.cfi_startproc
	.loc 1 13 5
	.loc 1 13 13 is_stmt 0
	lui	a5,%hi(endflag)
	li	a4,1
	sw	a4,%lo(endflag)(a5)
	.loc 1 14 1
	ret
	.cfi_endproc
.LFE322:
	.size	uart_end, .-uart_end
	.align	2
	.globl	uart_write
	.type	uart_write, @function
uart_write:
.LFB323:
	.loc 1 18 1 is_stmt 1
	.cfi_startproc
.LVL0:
	.loc 1 19 5
	.loc 1 19 14 is_stmt 0
	li	a4,805306368
.L4:
	.loc 1 19 11 is_stmt 1 discriminator 1
	.loc 1 19 14 is_stmt 0 discriminator 1
	lw	a5,8(a4)
	.loc 1 19 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L4
	.loc 1 20 5 is_stmt 1
	.loc 1 20 39 is_stmt 0
	sw	a0,4(a4)
	.loc 1 21 1
	ret
	.cfi_endproc
.LFE323:
	.size	uart_write, .-uart_write
	.align	2
	.globl	uart_write_char
	.type	uart_write_char, @function
uart_write_char:
.LFB324:
	.loc 1 24 1 is_stmt 1
	.cfi_startproc
.LVL1:
	.loc 1 25 2
	.loc 1 24 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 25 5
	li	a5,10
	.loc 1 24 1
	mv	s0,a0
	.loc 1 25 5
	bne	a0,a5,.L7
	.loc 1 26 3 is_stmt 1
	li	a0,13
.LVL2:
	call	uart_write_char
.LVL3:
.L7:
	.loc 1 29 14 is_stmt 0 discriminator 1
	li	a4,805306368
.L8:
	.loc 1 29 11 is_stmt 1 discriminator 1
	.loc 1 29 14 is_stmt 0 discriminator 1
	lw	a5,8(a4)
	.loc 1 29 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L8
	.loc 1 30 5 is_stmt 1
	.loc 1 31 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 30 39
	sw	s0,4(a4)
	.loc 1 31 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE324:
	.size	uart_write_char, .-uart_write_char
	.align	2
	.globl	uart_write_string
	.type	uart_write_string, @function
uart_write_string:
.LFB325:
	.loc 1 34 1 is_stmt 1
	.cfi_startproc
.LVL4:
	.loc 1 35 5
.LBB5:
	.loc 1 35 9
.LBE5:
	.loc 1 34 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	.loc 1 34 1
	mv	s2,a0
	mv	s1,a1
.LBB6:
	.loc 1 35 13
	li	s0,0
.LVL5:
.L12:
	.loc 1 35 18 is_stmt 1 discriminator 1
	blt	s0,s1,.L13
.LBE6:
	.loc 1 38 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL6:
	lw	s1,4(sp)
	.cfi_restore 9
.LVL7:
	lw	s2,0(sp)
	.cfi_restore 18
.LVL8:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL9:
.L13:
	.cfi_restore_state
.LBB7:
	.loc 1 36 9 is_stmt 1 discriminator 3
	add	a5,s2,s0
	lbu	a0,0(a5)
	.loc 1 35 24 is_stmt 0 discriminator 3
	addi	s0,s0,1
.LVL10:
	.loc 1 36 9 discriminator 3
	call	uart_write_char
.LVL11:
	.loc 1 35 24 is_stmt 1 discriminator 3
	j	.L12
.LBE7:
	.cfi_endproc
.LFE325:
	.size	uart_write_string, .-uart_write_string
	.align	2
	.globl	uart_read_char
	.type	uart_read_char, @function
uart_read_char:
.LFB326:
	.loc 1 42 1
	.cfi_startproc
	.loc 1 43 2
	.loc 1 44 5
	.loc 1 44 12 is_stmt 0
	li	a5,805306368
	lw	a4,8(a5)
	.loc 1 42 1
	li	a0,0
	.loc 1 44 44
	srli	a4,a4,5
	.loc 1 44 7
	bne	a4,zero,.L16
	.loc 1 44 67 discriminator 1
	lw	a4,8(a5)
	.loc 1 44 99 discriminator 1
	srli	a4,a4,4
	.loc 1 44 60 discriminator 1
	bne	a4,zero,.L16
.LVL12:
.LBB8:
	.loc 1 45 26 is_stmt 1 discriminator 1
	.loc 1 46 13 discriminator 1
 #APP
# 46 "uart.c" 1
	nop
# 0 "" 2
	.loc 1 45 32 discriminator 1
.LVL13:
	.loc 1 45 26 discriminator 1
 #NO_APP
.LBE8:
	.loc 1 48 9 discriminator 1
	.loc 1 48 16 is_stmt 0 discriminator 1
	lw	a0,0(a5)
	.loc 1 48 13 discriminator 1
	andi	a0,a0,0xff
.LVL14:
.L16:
	.loc 1 51 5 is_stmt 1
	.loc 1 52 1 is_stmt 0
	ret
	.cfi_endproc
.LFE326:
	.size	uart_read_char, .-uart_read_char
	.align	2
	.globl	uart_read
	.type	uart_read, @function
uart_read:
.LFB327:
	.loc 1 55 1 is_stmt 1
	.cfi_startproc
	.loc 1 56 5
	.loc 1 57 5
	.loc 1 57 12 is_stmt 0
	li	a5,805306368
	lw	a4,8(a5)
	.loc 1 57 44
	srli	a4,a4,5
	.loc 1 57 7
	bne	a4,zero,.L18
	.loc 1 57 67 discriminator 1
	lw	a4,8(a5)
	.loc 1 57 99 discriminator 1
	srli	a4,a4,4
	.loc 1 57 60 discriminator 1
	bne	a4,zero,.L18
.LVL15:
.LBB9:
	.loc 1 58 26 is_stmt 1 discriminator 1
	.loc 1 59 13 discriminator 1
 #APP
# 59 "uart.c" 1
	nop
# 0 "" 2
	.loc 1 58 32 discriminator 1
.LVL16:
	.loc 1 58 26 discriminator 1
 #NO_APP
.LBE9:
	.loc 1 61 9 discriminator 1
	.loc 1 61 16 is_stmt 0 discriminator 1
	lw	a0,0(a5)
.LVL17:
.L18:
	.loc 1 63 2 is_stmt 1
	.loc 1 63 42 is_stmt 0
	slli	a4,a0,16
	.loc 1 63 36
	li	a5,637534208
	sw	a4,12(a5)
	.loc 1 65 5 is_stmt 1
	.loc 1 66 1 is_stmt 0
	ret
	.cfi_endproc
.LFE327:
	.size	uart_read, .-uart_read
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB328:
	.loc 1 69 61 is_stmt 1
	.cfi_startproc
	.loc 1 70 2
	.loc 1 70 38 is_stmt 0
	lui	a5,%hi(data_length)
	lw	a4,%lo(data_length)(a5)
	li	a5,805306368
	addi	a3,a5,32
	sw	a4,16(a5)
	.loc 1 71 2 is_stmt 1
.LBB10:
	.loc 1 71 6
.LVL18:
	.loc 1 71 24
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	a5,a5,76
.LVL19:
.L20:
	.loc 1 72 3 discriminator 3
	.loc 1 72 52 is_stmt 0 discriminator 3
	lw	a2,0(a4)
	.loc 1 71 24 discriminator 3
	addi	a3,a3,4
	addi	a4,a4,4
	.loc 1 72 46 discriminator 3
	sw	a2,-4(a3)
	.loc 1 71 29 is_stmt 1 discriminator 3
	.loc 1 71 24 discriminator 3
	bne	a3,a5,.L20
.LBE10:
	.loc 1 74 1 is_stmt 0
	ret
	.cfi_endproc
.LFE328:
	.size	initfir, .-initfir
	.align	2
	.globl	ap_start
	.type	ap_start, @function
ap_start:
.LFB329:
	.loc 1 77 62 is_stmt 1
	.cfi_startproc
	.loc 1 79 10 is_stmt 0
	li	a5,805306368
.L23:
	.loc 1 78 2 is_stmt 1
	.loc 1 79 3
	.loc 1 79 10 is_stmt 0
	lw	a4,0(a5)
	.loc 1 79 45
	andi	a4,a4,4
	.loc 1 79 6
	beq	a4,zero,.L23
	.loc 1 80 4 is_stmt 1
	.loc 1 80 47 is_stmt 0
	lw	a4,0(a5)
	.loc 1 80 82
	ori	a4,a4,1
	.loc 1 80 42
	sw	a4,0(a5)
	.loc 1 81 4 is_stmt 1
	.loc 1 84 1 is_stmt 0
	ret
	.cfi_endproc
.LFE329:
	.size	ap_start, .-ap_start
	.align	2
	.globl	input
	.type	input, @function
input:
.LFB330:
	.loc 1 86 59 is_stmt 1
	.cfi_startproc
	.loc 1 87 2
	.loc 1 87 38 is_stmt 0
	lui	a5,%hi(reg_fir_x)
	lw	a4,%lo(reg_fir_x)(a5)
	li	a5,805306368
	sw	a4,128(a5)
	.loc 1 89 1
	ret
	.cfi_endproc
.LFE330:
	.size	input, .-input
	.align	2
	.globl	output
	.type	output, @function
output:
.LFB331:
	.loc 1 90 59 is_stmt 1
	.cfi_startproc
	.loc 1 91 2
	.loc 1 91 15 is_stmt 0
	li	a5,805306368
	lw	a0,132(a5)
	.loc 1 91 12
	lui	a5,%hi(reg_fir_y)
	sw	a0,%lo(reg_fir_y)(a5)
	.loc 1 92 2 is_stmt 1
	.loc 1 93 1 is_stmt 0
	ret
	.cfi_endproc
.LFE331:
	.size	output, .-output
	.align	2
	.globl	check_output
	.type	check_output, @function
check_output:
.LFB332:
	.loc 1 113 74 is_stmt 1
	.cfi_startproc
.LVL20:
	.loc 1 114 2
	.loc 1 114 48 is_stmt 0
	li	a5,234881024
	addi	a5,a5,1024
	add	a0,a0,a5
.LVL21:
	slli	a0,a0,2
.LVL22:
	.loc 1 114 15
	lw	a0,0(a0)
	.loc 1 114 12
	lui	a5,%hi(reg_fir_y)
	sw	a0,%lo(reg_fir_y)(a5)
	.loc 1 115 2 is_stmt 1
	.loc 1 116 1 is_stmt 0
	ret
	.cfi_endproc
.LFE332:
	.size	check_output, .-check_output
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB333:
	.loc 1 118 56 is_stmt 1
	.cfi_startproc
	.loc 1 119 2
	.loc 1 118 56 is_stmt 0
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s2,32(sp)
	sw	s3,28(sp)
	.cfi_offset 18, -16
	.cfi_offset 19, -20
.LBB11:
	.loc 1 124 26
	lui	s2,%hi(.LANCHOR1)
	.loc 1 130 19
	lui	s3,%hi(.LANCHOR2)
.LBE11:
	.loc 1 118 56
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s4,24(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	sw	s7,12(sp)
	sw	s8,8(sp)
	sw	s1,36(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 9, -12
.LBB16:
	.loc 1 123 19
	li	s0,0
.LBE16:
	.loc 1 119 2
	call	initfir
.LVL23:
	.loc 1 121 2 is_stmt 1
.LBB17:
	.loc 1 124 26 is_stmt 0
	addi	s2,s2,%lo(.LANCHOR1)
.LBE17:
	.loc 1 121 2
	call	ap_start
.LVL24:
	.loc 1 123 2 is_stmt 1
.LBB18:
	.loc 1 123 6
	.loc 1 123 24
	.loc 1 124 13 is_stmt 0
	lui	s8,%hi(reg_fir_x)
.LBB12:
.LBB13:
	.loc 1 91 15
	li	s7,805306368
	.loc 1 91 12
	lui	s6,%hi(reg_fir_y)
.LBE13:
.LBE12:
	.loc 1 130 19
	addi	s5,s3,%lo(.LANCHOR2)
	.loc 1 123 24
	li	s4,64
.LVL25:
.L30:
	.loc 1 124 3 is_stmt 1 discriminator 3
	.loc 1 124 26 is_stmt 0 discriminator 3
	slli	s1,s0,2
	add	a5,s2,s1
	lw	a5,0(a5)
	.loc 1 130 19 discriminator 3
	add	s1,s5,s1
	.loc 1 123 29 discriminator 3
	addi	s0,s0,1
.LVL26:
	.loc 1 124 13 discriminator 3
	sw	a5,%lo(reg_fir_x)(s8)
	.loc 1 127 3 is_stmt 1 discriminator 3
	call	input
.LVL27:
	.loc 1 130 3 discriminator 3
.LBB15:
.LBB14:
	.loc 1 91 2 discriminator 3
	.loc 1 91 15 is_stmt 0 discriminator 3
	lw	a5,132(s7)
	.loc 1 91 12 discriminator 3
	sw	a5,%lo(reg_fir_y)(s6)
	.loc 1 92 2 is_stmt 1 discriminator 3
.LBE14:
.LBE15:
	.loc 1 130 19 is_stmt 0 discriminator 3
	sw	a5,0(s1)
	.loc 1 123 29 is_stmt 1 discriminator 3
.LVL28:
	.loc 1 123 24 discriminator 3
	bne	s0,s4,.L30
.LBE18:
	.loc 1 136 2
	.loc 1 137 1 is_stmt 0
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
.LVL29:
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s4,24(sp)
	.cfi_restore 20
	lw	s5,20(sp)
	.cfi_restore 21
	lw	s6,16(sp)
	.cfi_restore 22
	lw	s7,12(sp)
	.cfi_restore 23
	lw	s8,8(sp)
	.cfi_restore 24
	addi	a0,s3,%lo(.LANCHOR2)
	lw	s3,28(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE333:
	.size	fir, .-fir
	.globl	__mulsi3
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB334:
	.loc 1 142 1 is_stmt 1
	.cfi_startproc
	.loc 1 143 2
.LVL30:
	.loc 1 144 2
	.loc 1 145 2
	.loc 1 146 2
	.loc 1 147 2
	.loc 1 148 2
	.loc 1 149 2
	.loc 1 149 13
	.loc 1 142 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	lui	a5,%hi(.LANCHOR0)
	sw	s0,56(sp)
	sw	s11,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 27, -52
	addi	s0,a5,%lo(.LANCHOR0)
	lui	s11,%hi(.LANCHOR3)
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
	addi	s5,s11,%lo(.LANCHOR3)
	.loc 1 150 9
	li	s7,0
	addi	s1,a5,%lo(.LANCHOR0)
.LVL31:
.L34:
	.loc 1 150 14 is_stmt 1
	addi	s6,s1,108
	.loc 1 152 10 is_stmt 0
	mv	s4,s5
	.loc 1 150 9
	li	s3,0
	j	.L38
.LVL32:
.L35:
	.loc 1 153 5 is_stmt 1 discriminator 3
	.loc 1 153 25 is_stmt 0 discriminator 3
	lw	a1,0(s10)
	lw	a0,0(s9)
	.loc 1 152 19 discriminator 3
	addi	s2,s2,1
.LVL33:
	.loc 1 152 15 discriminator 3
	addi	s9,s9,4
	.loc 1 153 25 discriminator 3
	call	__mulsi3
.LVL34:
	.loc 1 152 15 discriminator 3
	li	a5,4
	.loc 1 153 9 discriminator 3
	add	s8,s8,a0
.LVL35:
	.loc 1 152 19 is_stmt 1 discriminator 3
	.loc 1 152 15 discriminator 3
	addi	s10,s10,16
	li	a4,16
	bne	s2,a5,.L35
	.loc 1 154 4 discriminator 2
	.loc 1 154 22 is_stmt 0 discriminator 2
	sw	s8,0(s4)
	.loc 1 150 19 is_stmt 1 discriminator 2
	addi	s3,s3,1
.LVL36:
	.loc 1 150 14 discriminator 2
	addi	s4,s4,4
	addi	s6,s6,4
	beq	s3,s2,.L36
.LVL37:
.L38:
	.loc 1 152 15
	.loc 1 142 1 is_stmt 0
	mv	s10,s6
	mv	s9,s0
	.loc 1 151 8
	li	s8,0
	.loc 1 152 10
	li	s2,0
	j	.L35
.LVL38:
.L36:
	.loc 1 149 18 is_stmt 1 discriminator 2
	.loc 1 149 13 discriminator 2
	addi	s7,s7,4
	addi	s0,s0,16
	addi	s5,s5,16
	bne	s7,a4,.L34
	.loc 1 157 2
	.loc 1 158 1 is_stmt 0
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
.LVL39:
	lw	s3,44(sp)
	.cfi_restore 19
.LVL40:
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
.LVL41:
	lw	s9,20(sp)
	.cfi_restore 25
	lw	s10,16(sp)
	.cfi_restore 26
	addi	a0,s11,%lo(.LANCHOR3)
	lw	s11,12(sp)
	.cfi_restore 27
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE334:
	.size	matmul, .-matmul
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB335:
	.loc 1 161 75 is_stmt 1
	.cfi_startproc
.LVL42:
	.loc 1 162 2
	.loc 1 162 6 is_stmt 0
	lui	a4,%hi(.LANCHOR0)
	addi	a5,a4,%lo(.LANCHOR0)
	slli	a7,a1,2
	add	a2,a5,a7
	lw	t4,172(a2)
.LVL43:
	.loc 1 163 2 is_stmt 1
	addi	a5,a5,172
	slli	a2,a0,2
	.loc 1 161 75 is_stmt 0
	mv	a3,a0
	.loc 1 163 6
	addi	t1,a0,-1
.LVL44:
	.loc 1 164 2 is_stmt 1
	.loc 1 165 2
	add	a5,a5,a2
	addi	a4,a4,%lo(.LANCHOR0)
.LVL45:
.L42:
	.loc 1 165 15 discriminator 1
	.loc 1 167 6 is_stmt 0 discriminator 1
	addi	a0,t1,1
	.loc 1 168 9 discriminator 1
	slli	a2,a0,2
	add	a2,a4,a2
	lw	a6,172(a2)
	.loc 1 165 15 discriminator 1
	blt	a3,a1,.L44
	.loc 1 173 2 is_stmt 1
	.loc 1 173 6 is_stmt 0
	add	a5,a4,a7
	lw	a4,172(a5)
	.loc 1 173 4
	bge	a4,a6,.L41
	.loc 1 174 3 is_stmt 1
.LVL46:
	.loc 1 175 3
	.loc 1 175 10 is_stmt 0
	sw	a4,172(a2)
.LVL47:
	.loc 1 176 3 is_stmt 1
	.loc 1 176 9 is_stmt 0
	sw	a6,172(a5)
	.loc 1 178 2 is_stmt 1
.LVL48:
.L41:
	.loc 1 179 1 is_stmt 0
	ret
.L44:
	.loc 1 166 3 is_stmt 1
	.loc 1 166 7 is_stmt 0
	lw	t3,0(a5)
	.loc 1 166 5
	bge	t3,t4,.L43
	.loc 1 167 4 is_stmt 1
.LVL49:
	.loc 1 168 4
	.loc 1 169 4
	.loc 1 169 9 is_stmt 0
	sw	t3,172(a2)
.LVL50:
	.loc 1 170 4 is_stmt 1
	.loc 1 170 9 is_stmt 0
	sw	a6,0(a5)
.LVL51:
	.loc 1 167 6
	mv	t1,a0
.LVL52:
.L43:
	.loc 1 165 20 is_stmt 1 discriminator 2
	addi	a3,a3,1
.LVL53:
	addi	a5,a5,4
	j	.L42
	.cfi_endproc
.LFE335:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB336:
	.loc 1 181 72
	.cfi_startproc
.LVL54:
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
.LVL55:
.L48:
	.loc 1 182 2
	.loc 1 182 4 is_stmt 0
	bge	s0,s2,.L46
.LBB19:
	.loc 1 183 3 is_stmt 1
	.loc 1 183 11 is_stmt 0
	mv	a1,s2
	mv	a0,s0
	call	partition
.LVL56:
	mv	s1,a0
.LVL57:
	.loc 1 184 3 is_stmt 1
	addi	a1,a0,-1
	mv	a0,s0
	call	sort
.LVL58:
	.loc 1 185 3
	addi	s0,s1,1
	j	.L48
.LVL59:
.L46:
.LBE19:
	.loc 1 187 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
.LVL60:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE336:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB337:
	.loc 1 189 58 is_stmt 1
	.cfi_startproc
	.loc 1 190 2
	.loc 1 189 58 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 190 2
	li	a0,0
	li	a1,9
	.loc 1 189 58
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 190 2
	call	sort
.LVL61:
	.loc 1 191 2 is_stmt 1
	.loc 1 192 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lui	a0,%hi(.LANCHOR0+172)
	addi	a0,a0,%lo(.LANCHOR0+172)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE337:
	.size	qsort, .-qsort
	.align	2
	.globl	check
	.type	check, @function
check:
.LFB338:
	.loc 1 194 58 is_stmt 1
	.cfi_startproc
	.loc 1 196 2
	.loc 1 196 17
	.loc 1 198 3
	.loc 1 199 1 is_stmt 0
	ret
	.cfi_endproc
.LFE338:
	.size	check, .-check
	.section	.mprj
	.align	2
	.globl	transmission
	.type	transmission, @function
transmission:
.LFB339:
	.loc 1 203 1 is_stmt 1
	.cfi_startproc
.LVL62:
	.loc 1 204 5
	.loc 1 205 2
	.loc 1 203 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 205 7
	addi	a5,a0,15
	.loc 1 203 1
	.loc 1 205 7
	andi	a5,a5,-16
	.loc 1 208 6
	lui	a4,%hi(startflag)
	.loc 1 205 7
	sub	sp,sp,a5
.LVL63:
	.loc 1 206 2 is_stmt 1
	.loc 1 207 2
	.loc 1 208 3
	.loc 1 208 5 is_stmt 0
	lw	a5,%lo(startflag)(a4)
	beq	a5,zero,.L54
	.loc 1 209 4 is_stmt 1
	.loc 1 209 10 is_stmt 0
	li	a5,805306368
	lw	a5,8(a5)
	.loc 1 209 44
	andi	a5,a5,2
	.loc 1 209 6
	beq	a5,zero,.L55
	.loc 1 209 72 discriminator 1
	ble	a0,zero,.L55
.LBB20:
	.loc 1 210 5 is_stmt 1
	.loc 1 210 16 is_stmt 0
	call	uart_read
.LVL64:
	.loc 1 211 5 is_stmt 1
	.loc 1 212 5
	.loc 1 213 5
	.loc 1 214 5
.L53:
.LBE20:
	.loc 1 228 1 is_stmt 0
	addi	sp,s0,-16
	.cfi_remember_state
	.cfi_def_cfa 2, 16
.LVL65:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL66:
.L55:
	.cfi_restore_state
	.loc 1 217 5 is_stmt 1
	.loc 1 217 15 is_stmt 0
	sw	zero,%lo(startflag)(a4)
	j	.L53
.L54:
	.loc 1 221 4 is_stmt 1
	li	a1,0
	mv	a0,sp
.LVL67:
	call	uart_write_string
.LVL68:
	.loc 1 222 4
	.loc 1 224 3
	.loc 1 228 1 is_stmt 0
	j	.L53
	.cfi_endproc
.LFE339:
	.size	transmission, .-transmission
	.globl	startflag
	.globl	endflag
	.globl	C
	.globl	result
	.globl	B
	.globl	A
	.globl	outputsignal
	.globl	inputsignal
	.globl	reg_fir_x
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
	.set	.LANCHOR3,. + 0
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.section	.inputdata,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
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
	.section	.outputdata,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	outputsignal, @object
	.size	outputsignal, 256
outputsignal:
	.zero	256
	.section	.sbss,"aw",@nobits
	.align	2
	.type	startflag, @object
	.size	startflag, 4
startflag:
	.zero	4
	.type	endflag, @object
	.size	endflag, 4
endflag:
	.zero	4
	.type	reg_fir_x, @object
	.size	reg_fir_x, 4
reg_fir_x:
	.zero	4
	.type	reg_fir_y, @object
	.size	reg_fir_y, 4
reg_fir_y:
	.zero	4
	.section	.sdata,"aw"
	.align	2
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
	.4byte	0x621
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x18
	.4byte	.LASF47
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL29
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
	.byte	0x10
	.4byte	.LASF8
	.byte	0x28
	.byte	0x12
	.4byte	0x3f
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
	.byte	0x10
	.4byte	.LASF9
	.byte	0x34
	.byte	0x1b
	.4byte	0x66
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0x19
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x11
	.4byte	0x74
	.byte	0x2
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
	.byte	0x7
	.4byte	0x74
	.4byte	0xa8
	.byte	0xa
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
	.byte	0x3
	.4byte	.LASF16
	.byte	0xc
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	reg_fir_x
	.byte	0x7
	.4byte	0x7b
	.4byte	0xeb
	.byte	0xa
	.4byte	0x80
	.byte	0x3f
	.byte	0
	.byte	0x11
	.4byte	0xdb
	.byte	0x3
	.4byte	.LASF17
	.byte	0xe
	.byte	0x35
	.4byte	0xeb
	.byte	0x5
	.byte	0x3
	.4byte	inputsignal
	.byte	0x3
	.4byte	.LASF18
	.byte	0x11
	.byte	0x36
	.4byte	0xeb
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0x7
	.4byte	0x74
	.4byte	0x122
	.byte	0xa
	.4byte	0x80
	.byte	0xf
	.byte	0
	.byte	0xe
	.string	"A"
	.byte	0x35
	.byte	0x6
	.4byte	0x112
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0xe
	.string	"B"
	.byte	0x3a
	.byte	0x6
	.4byte	0x112
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x3
	.4byte	.LASF19
	.byte	0x3f
	.byte	0x6
	.4byte	0x112
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0x7
	.4byte	0x74
	.4byte	0x161
	.byte	0xa
	.4byte	0x80
	.byte	0x9
	.byte	0
	.byte	0xe
	.string	"C"
	.byte	0x43
	.byte	0x5
	.4byte	0x151
	.byte	0x5
	.byte	0x3
	.4byte	C
	.byte	0x3
	.4byte	.LASF20
	.byte	0x45
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	endflag
	.byte	0x3
	.4byte	.LASF21
	.byte	0x46
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	startflag
	.byte	0x8
	.4byte	.LASF26
	.byte	0xca
	.byte	0x30
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.byte	0x1
	.byte	0x9c
	.4byte	0x22e
	.byte	0x12
	.4byte	.LASF29
	.byte	0xca
	.byte	0x41
	.4byte	0x74
	.4byte	.LLST25
	.byte	0xf
	.4byte	.LASF22
	.byte	0xcc
	.byte	0x9
	.4byte	0x74
	.4byte	.LLST26
	.byte	0xf
	.4byte	.LASF23
	.byte	0xcd
	.byte	0x7
	.4byte	0x22e
	.4byte	.LLST27
	.byte	0x1
	.string	"idx"
	.byte	0xce
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST28
	.byte	0x1a
	.4byte	.LBB20
	.4byte	.LBE20-.LBB20
	.4byte	0x20f
	.byte	0x1b
	.4byte	.LASF24
	.byte	0x1
	.byte	0xd2
	.byte	0x9
	.4byte	0x74
	.byte	0x13
	.string	"c"
	.byte	0xd3
	.byte	0xa
	.4byte	0x241
	.byte	0x5
	.4byte	.LVL64
	.4byte	0x4c8
	.byte	0
	.byte	0x1c
	.4byte	0x80
	.4byte	.LLST24
	.byte	0xb
	.4byte	.LVL68
	.4byte	0x544
	.byte	0x4
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	0x241
	.4byte	0x241
	.byte	0x1d
	.4byte	0x80
	.4byte	0x20f
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF25
	.byte	0x1e
	.4byte	0x241
	.byte	0x9
	.4byte	.LASF37
	.byte	0xc2
	.byte	0x33
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF27
	.byte	0xbd
	.byte	0x33
	.4byte	0x28c
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.byte	0x1
	.byte	0x9c
	.4byte	0x28c
	.byte	0xb
	.4byte	.LVL61
	.4byte	0x291
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
	.byte	0x14
	.4byte	0x74
	.byte	0x8
	.4byte	.LASF28
	.byte	0xb5
	.byte	0x33
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.byte	0x1
	.byte	0x9c
	.4byte	0x30b
	.byte	0x6
	.string	"low"
	.byte	0xb5
	.byte	0x3c
	.4byte	0x74
	.4byte	.LLST20
	.byte	0x6
	.string	"hi"
	.byte	0xb5
	.byte	0x45
	.4byte	0x74
	.4byte	.LLST21
	.byte	0xd
	.4byte	.LBB19
	.4byte	.LBE19-.LBB19
	.byte	0x1
	.string	"p"
	.byte	0xb7
	.byte	0x7
	.4byte	0x74
	.4byte	.LLST22
	.byte	0x1f
	.4byte	.LVL56
	.4byte	0x30b
	.4byte	0x2f3
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
	.byte	0xb
	.4byte	.LVL58
	.4byte	0x291
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
	.byte	0x15
	.4byte	.LASF34
	.byte	0xa1
	.4byte	0x74
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.byte	0x1
	.byte	0x9c
	.4byte	0x376
	.byte	0x6
	.string	"low"
	.byte	0xa1
	.byte	0x40
	.4byte	0x74
	.4byte	.LLST16
	.byte	0x16
	.string	"hi"
	.byte	0xa1
	.byte	0x48
	.4byte	0x74
	.byte	0x1
	.byte	0x5b
	.byte	0x20
	.4byte	.LASF30
	.byte	0x1
	.byte	0xa2
	.byte	0x6
	.4byte	0x74
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.string	"i"
	.byte	0xa3
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST17
	.byte	0x1
	.string	"j"
	.byte	0xa3
	.byte	0x10
	.4byte	0x74
	.4byte	.LLST18
	.byte	0xf
	.4byte	.LASF31
	.byte	0xa4
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST19
	.byte	0
	.byte	0xc
	.4byte	.LASF32
	.byte	0x8d
	.byte	0x33
	.4byte	0x28c
	.4byte	.LFB334
	.4byte	.LFE334-.LFB334
	.byte	0x1
	.byte	0x9c
	.4byte	0x3e6
	.byte	0x1
	.string	"i"
	.byte	0x8f
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST12
	.byte	0x1
	.string	"j"
	.byte	0x90
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST13
	.byte	0x1
	.string	"k"
	.byte	0x91
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST14
	.byte	0x1
	.string	"sum"
	.byte	0x92
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST15
	.byte	0x13
	.string	"kk"
	.byte	0x93
	.byte	0x6
	.4byte	0x74
	.byte	0x21
	.4byte	.LASF33
	.byte	0x1
	.byte	0x94
	.byte	0xf
	.4byte	0x80
	.byte	0
	.byte	0x5
	.4byte	.LVL34
	.4byte	0x61b
	.byte	0
	.byte	0x22
	.string	"fir"
	.byte	0x1
	.byte	0x76
	.byte	0x33
	.4byte	0x28c
	.4byte	.LFB333
	.4byte	.LFE333-.LFB333
	.byte	0x1
	.byte	0x9c
	.4byte	0x443
	.byte	0x23
	.4byte	.LLRL9
	.4byte	0x430
	.byte	0x1
	.string	"i"
	.byte	0x7b
	.byte	0x13
	.4byte	0x74
	.4byte	.LLST10
	.byte	0x24
	.4byte	0x46b
	.4byte	.LBB12
	.4byte	.LLRL11
	.byte	0x1
	.byte	0x82
	.byte	0x15
	.byte	0x5
	.4byte	.LVL27
	.4byte	0x478
	.byte	0
	.byte	0x5
	.4byte	.LVL23
	.4byte	0x49a
	.byte	0x5
	.4byte	.LVL24
	.4byte	0x489
	.byte	0
	.byte	0x15
	.4byte	.LASF35
	.byte	0x71
	.4byte	0x74
	.4byte	.LFB332
	.4byte	.LFE332-.LFB332
	.byte	0x1
	.byte	0x9c
	.4byte	0x46b
	.byte	0x12
	.4byte	.LASF36
	.byte	0x71
	.byte	0x43
	.4byte	0x74
	.4byte	.LLST8
	.byte	0
	.byte	0x25
	.4byte	.LASF48
	.byte	0x1
	.byte	0x5a
	.byte	0x32
	.4byte	0x74
	.byte	0x1
	.byte	0x9
	.4byte	.LASF38
	.byte	0x56
	.byte	0x33
	.4byte	.LFB330
	.4byte	.LFE330-.LFB330
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF39
	.byte	0x4d
	.byte	0x33
	.4byte	.LFB329
	.4byte	.LFE329-.LFB329
	.byte	0x1
	.byte	0x9c
	.byte	0x26
	.4byte	.LASF49
	.byte	0x1
	.byte	0x45
	.byte	0x33
	.4byte	.LFB328
	.4byte	.LFE328-.LFB328
	.byte	0x1
	.byte	0x9c
	.4byte	0x4c8
	.byte	0xd
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.byte	0x1
	.string	"i"
	.byte	0x47
	.byte	0x13
	.4byte	0x74
	.4byte	.LLST7
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF40
	.byte	0x36
	.byte	0x2f
	.4byte	0x74
	.4byte	.LFB327
	.4byte	.LFE327-.LFB327
	.byte	0x1
	.byte	0x9c
	.4byte	0x506
	.byte	0x17
	.string	"num"
	.byte	0x38
	.byte	0x9
	.4byte	0x74
	.byte	0x1
	.byte	0x5a
	.byte	0xd
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.byte	0x1
	.string	"i"
	.byte	0x3a
	.byte	0x11
	.4byte	0x74
	.4byte	.LLST6
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF41
	.byte	0x29
	.byte	0x30
	.4byte	0x241
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.byte	0x1
	.byte	0x9c
	.4byte	0x544
	.byte	0x17
	.string	"num"
	.byte	0x2b
	.byte	0x7
	.4byte	0x241
	.byte	0x1
	.byte	0x5a
	.byte	0xd
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.byte	0x1
	.string	"i"
	.byte	0x2d
	.byte	0x11
	.4byte	0x74
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF42
	.byte	0x21
	.byte	0x30
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.byte	0x1
	.byte	0x9c
	.4byte	0x592
	.byte	0x6
	.string	"s"
	.byte	0x21
	.byte	0x4e
	.4byte	0x592
	.4byte	.LLST1
	.byte	0x6
	.string	"idx"
	.byte	0x21
	.byte	0x55
	.4byte	0x74
	.4byte	.LLST2
	.byte	0x27
	.4byte	.LLRL3
	.byte	0x1
	.string	"i"
	.byte	0x23
	.byte	0xd
	.4byte	0x74
	.4byte	.LLST4
	.byte	0x5
	.4byte	.LVL11
	.4byte	0x597
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	0x248
	.byte	0x8
	.4byte	.LASF43
	.byte	0x17
	.byte	0x30
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.byte	0x1
	.byte	0x9c
	.4byte	0x5c9
	.byte	0x6
	.string	"c"
	.byte	0x17
	.byte	0x45
	.4byte	0x241
	.4byte	.LLST0
	.byte	0xb
	.4byte	.LVL3
	.4byte	0x597
	.byte	0x4
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF44
	.byte	0x11
	.byte	0x30
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x5ea
	.byte	0x16
	.string	"n"
	.byte	0x11
	.byte	0x3f
	.4byte	0x74
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x9
	.4byte	.LASF45
	.byte	0xb
	.byte	0x30
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF46
	.byte	0x6
	.byte	0x30
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.byte	0x28
	.4byte	0x46b
	.4byte	.LFB331
	.4byte	.LFE331-.LFB331
	.byte	0x1
	.byte	0x9c
	.byte	0x29
	.4byte	.LASF50
	.4byte	.LASF50
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
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x9
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
	.byte	0xa
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xf
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
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x5
	.byte	0
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
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
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x34
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0x19
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x23
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x1d
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x2e
	.byte	0
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
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x27
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x2e
	.byte	0
	.byte	0x31
	.byte	0x13
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
	.byte	0x29
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
.LLST25:
	.byte	0x7
	.4byte	.LVL62
	.4byte	.LVL64-1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL64-1
	.4byte	.LVL66
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL66
	.4byte	.LVL67
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL67
	.4byte	.LFE339
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST26:
	.byte	0x7
	.4byte	.LVL68
	.4byte	.LFE339
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST27:
	.byte	0x7
	.4byte	.LVL63
	.4byte	.LVL65
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0x7
	.4byte	.LVL66
	.4byte	.LFE339
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0
.LLST28:
	.byte	0x7
	.4byte	.LVL68
	.4byte	.LFE339
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST24:
	.byte	0x7
	.4byte	.LVL62
	.4byte	.LVL64-1
	.byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL64-1
	.4byte	.LVL66
	.byte	0x6
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL66
	.4byte	.LVL67
	.byte	0x3
	.byte	0x7a
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL67
	.4byte	.LFE339
	.byte	0x6
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x31
	.byte	0x1c
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x7
	.4byte	.LVL54
	.4byte	.LVL55
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL55
	.4byte	.LFE336
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST21:
	.byte	0x7
	.4byte	.LVL54
	.4byte	.LVL55
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL55
	.4byte	.LVL60
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL60
	.4byte	.LFE336
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST22:
	.byte	0x7
	.4byte	.LVL57
	.4byte	.LVL59
	.byte	0x1
	.byte	0x59
	.byte	0
.LLST16:
	.byte	0x7
	.4byte	.LVL42
	.4byte	.LVL45
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL45
	.4byte	.LFE335
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x7
	.4byte	.LVL44
	.4byte	.LVL49
	.byte	0x1
	.byte	0x56
	.byte	0x7
	.4byte	.LVL49
	.4byte	.LVL51
	.byte	0x3
	.byte	0x76
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL51
	.4byte	.LVL52
	.byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL52
	.4byte	.LFE335
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST18:
	.byte	0x7
	.4byte	.LVL44
	.4byte	.LVL45
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL45
	.4byte	.LFE335
	.byte	0x1
	.byte	0x5d
	.byte	0
.LLST19:
	.byte	0x7
	.4byte	.LVL46
	.4byte	.LVL47
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL49
	.4byte	.LVL50
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0
.LLST12:
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL31
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x7
	.4byte	.LVL31
	.4byte	.LVL32
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL32
	.4byte	.LVL40
	.byte	0x1
	.byte	0x63
	.byte	0
.LLST14:
	.byte	0x7
	.4byte	.LVL32
	.4byte	.LVL33
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL33
	.4byte	.LVL35
	.byte	0x3
	.byte	0x82
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL37
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LVL38
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL38
	.4byte	.LVL39
	.byte	0x1
	.byte	0x62
	.byte	0
.LLST15:
	.byte	0x7
	.4byte	.LVL32
	.4byte	.LVL37
	.byte	0x1
	.byte	0x68
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LVL38
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL38
	.4byte	.LVL41
	.byte	0x1
	.byte	0x68
	.byte	0
.LLST10:
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL25
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LVL26
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL26
	.4byte	.LVL28
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL28
	.4byte	.LVL29
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST8:
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL21
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL21
	.4byte	.LVL22
	.byte	0x7
	.byte	0x7a
	.byte	0x80,0xf8,0xff,0x8f,0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL22
	.4byte	.LFE332
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL19
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL16
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL17
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL13
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL14
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
	.4byte	.LVL8
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL9
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LFE325
	.byte	0x1
	.byte	0x62
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL7
	.byte	0x1
	.byte	0x59
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL9
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LFE325
	.byte	0x1
	.byte	0x59
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x1
	.byte	0x58
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LFE325
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
	.4byte	.LFE324
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0xac
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
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
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
.LLRL3:
	.byte	0x6
	.4byte	.LBB5
	.4byte	.LBE5
	.byte	0x6
	.4byte	.LBB6
	.4byte	.LBE6
	.byte	0x6
	.4byte	.LBB7
	.4byte	.LBE7
	.byte	0
.LLRL9:
	.byte	0x6
	.4byte	.LBB11
	.4byte	.LBE11
	.byte	0x6
	.4byte	.LBB16
	.4byte	.LBE16
	.byte	0x6
	.4byte	.LBB17
	.4byte	.LBE17
	.byte	0x6
	.4byte	.LBB18
	.4byte	.LBE18
	.byte	0
.LLRL11:
	.byte	0x6
	.4byte	.LBB12
	.4byte	.LBE12
	.byte	0x6
	.4byte	.LBB15
	.4byte	.LBE15
	.byte	0
.LLRL29:
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
	.byte	0x6
	.4byte	.LFB337
	.4byte	.LFE337
	.byte	0x6
	.4byte	.LFB338
	.4byte	.LFE338
	.byte	0x6
	.4byte	.LFB339
	.4byte	.LFE339
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF31:
	.string	"temp"
.LASF17:
	.string	"inputsignal"
.LASF50:
	.string	"__mulsi3"
.LASF23:
	.string	"buffer"
.LASF33:
	.string	"count"
.LASF41:
	.string	"uart_read_char"
.LASF37:
	.string	"check"
.LASF28:
	.string	"sort"
.LASF22:
	.string	"finish"
.LASF35:
	.string	"check_output"
.LASF32:
	.string	"matmul"
.LASF24:
	.string	"data"
.LASF27:
	.string	"qsort"
.LASF20:
	.string	"endflag"
.LASF6:
	.string	"unsigned char"
.LASF38:
	.string	"input"
.LASF45:
	.string	"uart_end"
.LASF10:
	.string	"long unsigned int"
.LASF21:
	.string	"startflag"
.LASF7:
	.string	"short unsigned int"
.LASF39:
	.string	"ap_start"
.LASF29:
	.string	"fifo_size"
.LASF34:
	.string	"partition"
.LASF49:
	.string	"initfir"
.LASF12:
	.string	"unsigned int"
.LASF47:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF14:
	.string	"taps"
.LASF11:
	.string	"long long unsigned int"
.LASF19:
	.string	"result"
.LASF44:
	.string	"uart_write"
.LASF16:
	.string	"reg_fir_x"
.LASF15:
	.string	"reg_fir_y"
.LASF8:
	.string	"int32_t"
.LASF43:
	.string	"uart_write_char"
.LASF18:
	.string	"outputsignal"
.LASF5:
	.string	"long long int"
.LASF25:
	.string	"char"
.LASF40:
	.string	"uart_read"
.LASF3:
	.string	"short int"
.LASF13:
	.string	"data_length"
.LASF42:
	.string	"uart_write_string"
.LASF36:
	.string	"index"
.LASF46:
	.string	"uart_start"
.LASF9:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF30:
	.string	"pivot"
.LASF2:
	.string	"signed char"
.LASF48:
	.string	"output"
.LASF26:
	.string	"transmission"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"uart.c"
.LASF1:
	.string	"/home/ubuntu/SoC_Design/Final/testbench/counter_la_fir(interrupt)"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
