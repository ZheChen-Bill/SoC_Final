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
.LBB7:
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
.LBE7:
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
.LBB8:
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
.LBE8:
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
	.loc 1 64 2
	.loc 1 64 36 is_stmt 0
	lui	a5,%hi(data_length)
	lw	a4,%lo(data_length)(a5)
	li	a5,805306368
	addi	a3,a5,32
	sw	a4,16(a5)
	.loc 1 65 2 is_stmt 1
.LBB9:
	.loc 1 65 6
.LVL16:
	.loc 1 65 24
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	a5,a5,76
.LVL17:
.L19:
	.loc 1 66 3 discriminator 3
	.loc 1 66 50 is_stmt 0 discriminator 3
	lw	a2,0(a4)
	.loc 1 65 24 discriminator 3
	addi	a3,a3,4
	addi	a4,a4,4
	.loc 1 66 44 discriminator 3
	sw	a2,-4(a3)
	.loc 1 65 29 is_stmt 1 discriminator 3
	.loc 1 65 24 discriminator 3
	bne	a3,a5,.L19
.LBE9:
	.loc 1 71 1 is_stmt 0
	ret
	.cfi_endproc
.LFE327:
	.size	initfir, .-initfir
	.align	2
	.globl	preparedata
	.type	preparedata, @function
preparedata:
.LFB328:
	.loc 1 73 65 is_stmt 1
	.cfi_startproc
	.loc 1 75 2
.LBB10:
	.loc 1 75 6
.LVL18:
	.loc 1 75 24
	.loc 1 76 18 is_stmt 0
	lui	a3,%hi(.LANCHOR1)
	.loc 1 75 19
	li	a5,0
	.loc 1 76 18
	addi	a3,a3,%lo(.LANCHOR1)
	.loc 1 75 24
	li	a2,64
.LVL19:
.L22:
	.loc 1 76 3 is_stmt 1 discriminator 3
	.loc 1 76 18 is_stmt 0 discriminator 3
	slli	a4,a5,2
	add	a4,a3,a4
	sw	a5,0(a4)
	.loc 1 75 29 is_stmt 1 discriminator 3
	addi	a5,a5,1
.LVL20:
	.loc 1 75 24 discriminator 3
	bne	a5,a2,.L22
.LBE10:
	.loc 1 79 1 is_stmt 0
	ret
	.cfi_endproc
.LFE328:
	.size	preparedata, .-preparedata
	.align	2
	.globl	start
	.type	start, @function
start:
.LFB329:
	.loc 1 80 59 is_stmt 1
	.cfi_startproc
	.loc 1 83 10 is_stmt 0
	li	a5,805306368
.L25:
	.loc 1 82 2 is_stmt 1
	.loc 1 83 3
	.loc 1 83 10 is_stmt 0
	lw	a4,0(a5)
	.loc 1 83 43
	andi	a4,a4,4
	.loc 1 83 6
	beq	a4,zero,.L25
	.loc 1 84 4 is_stmt 1
	.loc 1 84 45 is_stmt 0
	lw	a4,0(a5)
	.loc 1 84 78
	ori	a4,a4,1
	.loc 1 84 40
	sw	a4,0(a5)
	.loc 1 85 4 is_stmt 1
	.loc 1 88 1 is_stmt 0
	ret
	.cfi_endproc
.LFE329:
	.size	start, .-start
	.align	2
	.globl	input
	.type	input, @function
input:
.LFB330:
	.loc 1 90 68 is_stmt 1
	.cfi_startproc
.LVL21:
	.loc 1 94 4
	.loc 1 94 38 is_stmt 0
	li	a5,805306368
	sw	a0,128(a5)
.LVL22:
	.loc 1 98 1
	ret
	.cfi_endproc
.LFE330:
	.size	input, .-input
	.align	2
	.globl	output
	.type	output, @function
output:
.LFB331:
	.loc 1 100 59 is_stmt 1
	.cfi_startproc
	.loc 1 104 4
	.loc 1 104 17 is_stmt 0
	li	a5,805306368
	lw	a0,132(a5)
	.loc 1 104 14
	lui	a5,%hi(reg_fir_y)
	sw	a0,%lo(reg_fir_y)(a5)
	.loc 1 105 4 is_stmt 1
	.loc 1 109 1 is_stmt 0
	ret
	.cfi_endproc
.LFE331:
	.size	output, .-output
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB332:
	.loc 1 111 56 is_stmt 1
	.cfi_startproc
	.loc 1 112 2
	.loc 1 111 56 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 112 2
	call	initfir
.LVL23:
	.loc 1 113 2 is_stmt 1
	call	preparedata
.LVL24:
	.loc 1 114 2
	call	start
.LVL25:
	.loc 1 115 2
.LBB11:
	.loc 1 115 6
	.loc 1 115 24
	.loc 1 117 20 is_stmt 0
	lui	a2,%hi(.LANCHOR1)
	.loc 1 119 19
	lui	a0,%hi(.LANCHOR2)
	.loc 1 115 19
	li	a5,0
	.loc 1 117 20
	addi	a2,a2,%lo(.LANCHOR1)
.LBB12:
.LBB13:
	.loc 1 94 38
	li	a6,805306368
.LBE13:
.LBE12:
	.loc 1 119 19
	addi	a1,a0,%lo(.LANCHOR2)
	.loc 1 115 24
	li	a7,64
.LVL26:
.L31:
	.loc 1 117 3 is_stmt 1 discriminator 3
	.loc 1 117 20 is_stmt 0 discriminator 3
	slli	a4,a5,2
	add	a3,a2,a4
	lw	a3,0(a3)
.LVL27:
.LBB16:
.LBB14:
	.loc 1 94 4 is_stmt 1 discriminator 3
.LBE14:
.LBE16:
	.loc 1 119 19 is_stmt 0 discriminator 3
	add	a4,a1,a4
	.loc 1 115 29 discriminator 3
	addi	a5,a5,1
.LVL28:
.LBB17:
.LBB15:
	.loc 1 94 38 discriminator 3
	sw	a3,128(a6)
.LVL29:
.LBE15:
.LBE17:
	.loc 1 119 3 is_stmt 1 discriminator 3
.LBB18:
.LBB19:
	.loc 1 104 4 discriminator 3
	.loc 1 104 17 is_stmt 0 discriminator 3
	lw	a3,132(a6)
	.loc 1 105 4 is_stmt 1 discriminator 3
.LBE19:
.LBE18:
	.loc 1 119 19 is_stmt 0 discriminator 3
	sw	a3,0(a4)
	.loc 1 115 29 is_stmt 1 discriminator 3
.LVL30:
	.loc 1 115 24 discriminator 3
	bne	a5,a7,.L31
.LBE11:
	.loc 1 122 2 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lui	a5,%hi(reg_fir_y)
.LVL31:
	sw	a3,%lo(reg_fir_y)(a5)
	sw	a3,252(a1)
	.loc 1 121 3 is_stmt 1
	.loc 1 122 2 is_stmt 0
	addi	a0,a0,%lo(.LANCHOR2)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE332:
	.size	fir, .-fir
	.globl	__mulsi3
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB333:
	.loc 1 126 1 is_stmt 1
	.cfi_startproc
	.loc 1 127 2
.LVL32:
	.loc 1 128 2
	.loc 1 129 2
	.loc 1 130 2
	.loc 1 131 2
	.loc 1 132 2
	.loc 1 133 2
	.loc 1 133 13
	.loc 1 126 1 is_stmt 0
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
	.loc 1 134 9
	li	s7,0
	addi	s1,a5,%lo(.LANCHOR0)
.LVL33:
.L35:
	.loc 1 134 14 is_stmt 1
	addi	s6,s1,108
	.loc 1 136 10 is_stmt 0
	mv	s4,s5
	.loc 1 134 9
	li	s3,0
	j	.L39
.LVL34:
.L36:
	.loc 1 137 5 is_stmt 1 discriminator 3
	.loc 1 137 25 is_stmt 0 discriminator 3
	lw	a1,0(s10)
	lw	a0,0(s9)
	.loc 1 136 19 discriminator 3
	addi	s2,s2,1
.LVL35:
	.loc 1 136 15 discriminator 3
	addi	s9,s9,4
	.loc 1 137 25 discriminator 3
	call	__mulsi3
.LVL36:
	.loc 1 136 15 discriminator 3
	li	a5,4
	.loc 1 137 9 discriminator 3
	add	s8,s8,a0
.LVL37:
	.loc 1 136 19 is_stmt 1 discriminator 3
	.loc 1 136 15 discriminator 3
	addi	s10,s10,16
	li	a4,16
	bne	s2,a5,.L36
	.loc 1 138 4 discriminator 2
	.loc 1 138 22 is_stmt 0 discriminator 2
	sw	s8,0(s4)
	.loc 1 134 19 is_stmt 1 discriminator 2
	addi	s3,s3,1
.LVL38:
	.loc 1 134 14 discriminator 2
	addi	s4,s4,4
	addi	s6,s6,4
	beq	s3,s2,.L37
.LVL39:
.L39:
	.loc 1 136 15
	.loc 1 126 1 is_stmt 0
	mv	s10,s6
	mv	s9,s0
	.loc 1 135 8
	li	s8,0
	.loc 1 136 10
	li	s2,0
	j	.L36
.LVL40:
.L37:
	.loc 1 133 18 is_stmt 1 discriminator 2
	.loc 1 133 13 discriminator 2
	addi	s7,s7,4
	addi	s0,s0,16
	addi	s5,s5,16
	bne	s7,a4,.L35
	.loc 1 141 2
	.loc 1 142 1 is_stmt 0
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
.LVL41:
	lw	s3,44(sp)
	.cfi_restore 19
.LVL42:
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
.LVL43:
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
.LFE333:
	.size	matmul, .-matmul
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB334:
	.loc 1 145 75 is_stmt 1
	.cfi_startproc
.LVL44:
	.loc 1 146 2
	.loc 1 146 6 is_stmt 0
	lui	a4,%hi(.LANCHOR0)
	addi	a5,a4,%lo(.LANCHOR0)
	slli	a7,a1,2
	add	a2,a5,a7
	lw	t4,172(a2)
.LVL45:
	.loc 1 147 2 is_stmt 1
	addi	a5,a5,172
	slli	a2,a0,2
	.loc 1 145 75 is_stmt 0
	mv	a3,a0
	.loc 1 147 6
	addi	t1,a0,-1
.LVL46:
	.loc 1 148 2 is_stmt 1
	.loc 1 149 2
	add	a5,a5,a2
	addi	a4,a4,%lo(.LANCHOR0)
.LVL47:
.L43:
	.loc 1 149 15 discriminator 1
	.loc 1 151 6 is_stmt 0 discriminator 1
	addi	a0,t1,1
	.loc 1 152 9 discriminator 1
	slli	a2,a0,2
	add	a2,a4,a2
	lw	a6,172(a2)
	.loc 1 149 15 discriminator 1
	blt	a3,a1,.L45
	.loc 1 157 2 is_stmt 1
	.loc 1 157 6 is_stmt 0
	add	a5,a4,a7
	lw	a4,172(a5)
	.loc 1 157 4
	bge	a4,a6,.L42
	.loc 1 158 3 is_stmt 1
.LVL48:
	.loc 1 159 3
	.loc 1 159 10 is_stmt 0
	sw	a4,172(a2)
.LVL49:
	.loc 1 160 3 is_stmt 1
	.loc 1 160 9 is_stmt 0
	sw	a6,172(a5)
	.loc 1 162 2 is_stmt 1
.LVL50:
.L42:
	.loc 1 163 1 is_stmt 0
	ret
.L45:
	.loc 1 150 3 is_stmt 1
	.loc 1 150 7 is_stmt 0
	lw	t3,0(a5)
	.loc 1 150 5
	bge	t3,t4,.L44
	.loc 1 151 4 is_stmt 1
.LVL51:
	.loc 1 152 4
	.loc 1 153 4
	.loc 1 153 9 is_stmt 0
	sw	t3,172(a2)
.LVL52:
	.loc 1 154 4 is_stmt 1
	.loc 1 154 9 is_stmt 0
	sw	a6,0(a5)
.LVL53:
	.loc 1 151 6
	mv	t1,a0
.LVL54:
.L44:
	.loc 1 149 20 is_stmt 1 discriminator 2
	addi	a3,a3,1
.LVL55:
	addi	a5,a5,4
	j	.L43
	.cfi_endproc
.LFE334:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB335:
	.loc 1 165 72
	.cfi_startproc
.LVL56:
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
.LVL57:
.L49:
	.loc 1 166 2
	.loc 1 166 4 is_stmt 0
	bge	s0,s2,.L47
.LBB20:
	.loc 1 167 3 is_stmt 1
	.loc 1 167 11 is_stmt 0
	mv	a1,s2
	mv	a0,s0
	call	partition
.LVL58:
	mv	s1,a0
.LVL59:
	.loc 1 168 3 is_stmt 1
	addi	a1,a0,-1
	mv	a0,s0
	call	sort
.LVL60:
	.loc 1 169 3
	addi	s0,s1,1
	j	.L49
.LVL61:
.L47:
.LBE20:
	.loc 1 171 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
.LVL62:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE335:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB336:
	.loc 1 173 58 is_stmt 1
	.cfi_startproc
	.loc 1 174 2
	.loc 1 173 58 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 174 2
	li	a0,0
	li	a1,9
	.loc 1 173 58
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 174 2
	call	sort
.LVL63:
	.loc 1 175 2 is_stmt 1
	.loc 1 176 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lui	a0,%hi(.LANCHOR0+172)
	addi	a0,a0,%lo(.LANCHOR0+172)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE336:
	.size	qsort, .-qsort
	.align	2
	.globl	check
	.type	check, @function
check:
.LFB337:
	.loc 1 178 58 is_stmt 1
	.cfi_startproc
	.loc 1 180 2
	.loc 1 180 17
	.loc 1 182 3
	.loc 1 183 1 is_stmt 0
	ret
	.cfi_endproc
.LFE337:
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
	.zero	256
	.section	.outputdata,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
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
	.4byte	0x56f
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x16
	.4byte	.LASF37
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL21
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
	.byte	0xf
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
	.byte	0xf
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
	.byte	0x17
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x10
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
	.byte	0x8
	.4byte	0x74
	.4byte	0xa8
	.byte	0x9
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
	.byte	0x8
	.4byte	0x7b
	.4byte	0xda
	.byte	0x9
	.4byte	0x80
	.byte	0x3f
	.byte	0
	.byte	0x10
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
	.byte	0xe
	.byte	0x36
	.4byte	0xda
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0x8
	.4byte	0x74
	.4byte	0x111
	.byte	0x9
	.4byte	0x80
	.byte	0xf
	.byte	0
	.byte	0xc
	.string	"A"
	.byte	0x2c
	.byte	0x6
	.4byte	0x101
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0xc
	.string	"B"
	.byte	0x31
	.byte	0x6
	.4byte	0x101
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x3
	.4byte	.LASF18
	.byte	0x36
	.byte	0x6
	.4byte	0x101
	.byte	0x5
	.byte	0x3
	.4byte	result
	.byte	0x8
	.4byte	0x74
	.4byte	0x150
	.byte	0x9
	.4byte	0x80
	.byte	0x9
	.byte	0
	.byte	0xc
	.string	"C"
	.byte	0x3a
	.byte	0x5
	.4byte	0x140
	.byte	0x5
	.byte	0x3
	.4byte	C
	.byte	0x3
	.4byte	.LASF19
	.byte	0x3c
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	endflag
	.byte	0xd
	.4byte	.LASF26
	.byte	0xb2
	.byte	0x33
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.byte	0x1
	.byte	0x9c
	.byte	0xa
	.4byte	.LASF20
	.byte	0xad
	.byte	0x33
	.4byte	0x1af
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.byte	0x1
	.byte	0x9c
	.4byte	0x1af
	.byte	0xe
	.4byte	.LVL63
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
	.byte	0x11
	.4byte	0x74
	.byte	0xb
	.4byte	.LASF21
	.byte	0xa5
	.byte	0x33
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.byte	0x1
	.byte	0x9c
	.4byte	0x22e
	.byte	0x5
	.string	"low"
	.byte	0xa5
	.byte	0x3c
	.4byte	0x74
	.4byte	.LLST18
	.byte	0x5
	.string	"hi"
	.byte	0xa5
	.byte	0x45
	.4byte	0x74
	.4byte	.LLST19
	.byte	0x6
	.4byte	.LBB20
	.4byte	.LBE20-.LBB20
	.byte	0x1
	.string	"p"
	.byte	0xa7
	.byte	0x7
	.4byte	0x74
	.4byte	.LLST20
	.byte	0x18
	.4byte	.LVL58
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
	.byte	0xe
	.4byte	.LVL60
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
	.byte	0x19
	.4byte	.LASF38
	.byte	0x1
	.byte	0x91
	.byte	0x32
	.4byte	0x74
	.4byte	.LFB334
	.4byte	.LFE334-.LFB334
	.byte	0x1
	.byte	0x9c
	.4byte	0x29c
	.byte	0x5
	.string	"low"
	.byte	0x91
	.byte	0x40
	.4byte	0x74
	.4byte	.LLST14
	.byte	0x12
	.string	"hi"
	.byte	0x91
	.byte	0x48
	.4byte	0x74
	.byte	0x1
	.byte	0x5b
	.byte	0x1a
	.4byte	.LASF22
	.byte	0x1
	.byte	0x92
	.byte	0x6
	.4byte	0x74
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.string	"i"
	.byte	0x93
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST15
	.byte	0x1
	.string	"j"
	.byte	0x93
	.byte	0x10
	.4byte	0x74
	.4byte	.LLST16
	.byte	0x1b
	.4byte	.LASF23
	.byte	0x1
	.byte	0x94
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST17
	.byte	0
	.byte	0xa
	.4byte	.LASF24
	.byte	0x7d
	.byte	0x33
	.4byte	0x1af
	.4byte	.LFB333
	.4byte	.LFE333-.LFB333
	.byte	0x1
	.byte	0x9c
	.4byte	0x30d
	.byte	0x1
	.string	"i"
	.byte	0x7f
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST10
	.byte	0x1
	.string	"j"
	.byte	0x80
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST11
	.byte	0x1
	.string	"k"
	.byte	0x81
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST12
	.byte	0x1
	.string	"sum"
	.byte	0x82
	.byte	0x6
	.4byte	0x74
	.4byte	.LLST13
	.byte	0x1c
	.string	"kk"
	.byte	0x1
	.byte	0x83
	.byte	0x6
	.4byte	0x74
	.byte	0x1d
	.4byte	.LASF25
	.byte	0x1
	.byte	0x84
	.byte	0xf
	.4byte	0x80
	.byte	0
	.byte	0x7
	.4byte	.LVL36
	.4byte	0x569
	.byte	0
	.byte	0x1e
	.string	"fir"
	.byte	0x1
	.byte	0x6f
	.byte	0x33
	.4byte	0x1af
	.4byte	.LFB332
	.4byte	.LFE332-.LFB332
	.byte	0x1
	.byte	0x9c
	.4byte	0x38c
	.byte	0x1f
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.4byte	0x370
	.byte	0x1
	.string	"i"
	.byte	0x73
	.byte	0x13
	.4byte	0x74
	.4byte	.LLST7
	.byte	0x20
	.4byte	0x399
	.4byte	.LBB12
	.4byte	.LLRL8
	.byte	0x1
	.byte	0x75
	.byte	0x3
	.4byte	0x35f
	.byte	0x13
	.4byte	0x3aa
	.4byte	.LLST9
	.byte	0
	.byte	0x21
	.4byte	0x38c
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.byte	0x1
	.byte	0x77
	.byte	0x15
	.byte	0
	.byte	0x7
	.4byte	.LVL23
	.4byte	0x3f4
	.byte	0x7
	.4byte	.LVL24
	.4byte	0x3c8
	.byte	0x7
	.4byte	.LVL25
	.4byte	0x3b7
	.byte	0
	.byte	0x22
	.4byte	.LASF39
	.byte	0x1
	.byte	0x64
	.byte	0x32
	.4byte	0x74
	.byte	0x1
	.byte	0x23
	.4byte	.LASF40
	.byte	0x1
	.byte	0x5a
	.byte	0x32
	.4byte	0x74
	.byte	0x1
	.4byte	0x3b7
	.byte	0x24
	.4byte	.LASF41
	.byte	0x1
	.byte	0x5a
	.byte	0x3c
	.4byte	0x74
	.byte	0
	.byte	0xd
	.4byte	.LASF27
	.byte	0x50
	.byte	0x33
	.4byte	.LFB329
	.4byte	.LFE329-.LFB329
	.byte	0x1
	.byte	0x9c
	.byte	0x14
	.4byte	.LASF28
	.byte	0x49
	.4byte	.LFB328
	.4byte	.LFE328-.LFB328
	.byte	0x1
	.byte	0x9c
	.4byte	0x3f4
	.byte	0x6
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.byte	0x1
	.string	"i"
	.byte	0x4b
	.byte	0x13
	.4byte	0x74
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF29
	.byte	0x3e
	.4byte	.LFB327
	.4byte	.LFE327-.LFB327
	.byte	0x1
	.byte	0x9c
	.4byte	0x420
	.byte	0x6
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.byte	0x1
	.string	"i"
	.byte	0x41
	.byte	0x13
	.4byte	0x74
	.4byte	.LLST4
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	.LASF30
	.byte	0x2f
	.byte	0x2f
	.4byte	0x74
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.byte	0x1
	.byte	0x9c
	.4byte	0x45e
	.byte	0x15
	.string	"num"
	.byte	0x31
	.byte	0x9
	.4byte	0x74
	.byte	0x1
	.byte	0x5a
	.byte	0x6
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.byte	0x1
	.string	"i"
	.byte	0x33
	.byte	0x11
	.4byte	0x74
	.4byte	.LLST3
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	.LASF31
	.byte	0x22
	.byte	0x30
	.4byte	0x49c
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.byte	0x1
	.byte	0x9c
	.4byte	0x49c
	.byte	0x15
	.string	"num"
	.byte	0x24
	.byte	0x7
	.4byte	0x49c
	.byte	0x1
	.byte	0x5a
	.byte	0x6
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.byte	0x1
	.string	"i"
	.byte	0x26
	.byte	0x11
	.4byte	0x74
	.4byte	.LLST2
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF32
	.byte	0x25
	.4byte	0x49c
	.byte	0xb
	.4byte	.LASF33
	.byte	0x1b
	.byte	0x30
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.byte	0x1
	.byte	0x9c
	.4byte	0x4d4
	.byte	0x5
	.string	"s"
	.byte	0x1b
	.byte	0x4e
	.4byte	0x4d4
	.4byte	.LLST1
	.byte	0x7
	.4byte	.LVL9
	.4byte	0x4d9
	.byte	0
	.byte	0x11
	.4byte	0x4a3
	.byte	0xb
	.4byte	.LASF34
	.byte	0x11
	.byte	0x30
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x50b
	.byte	0x5
	.string	"c"
	.byte	0x11
	.byte	0x45
	.4byte	0x49c
	.4byte	.LLST0
	.byte	0xe
	.4byte	.LVL3
	.4byte	0x4d9
	.byte	0x4
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3d
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	.LASF35
	.byte	0xb
	.byte	0x30
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.byte	0x1
	.byte	0x9c
	.4byte	0x52c
	.byte	0x12
	.string	"n"
	.byte	0xb
	.byte	0x3f
	.4byte	0x74
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0xd
	.4byte	.LASF36
	.byte	0x6
	.byte	0x30
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.byte	0x26
	.4byte	0x399
	.4byte	.LFB330
	.4byte	.LFE330-.LFB330
	.byte	0x1
	.byte	0x9c
	.4byte	0x55a
	.byte	0x13
	.4byte	0x3aa
	.4byte	.LLST6
	.byte	0
	.byte	0x27
	.4byte	0x38c
	.4byte	.LFB331
	.4byte	.LFE331-.LFB331
	.byte	0x1
	.byte	0x9c
	.byte	0x28
	.4byte	.LASF42
	.4byte	.LASF42
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
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0xb
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
	.byte	0xe
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
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
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x33
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
	.byte	0x1d
	.byte	0x1
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x1d
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x22
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
	.byte	0x23
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
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x2e
	.byte	0x1
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
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
	.byte	0x28
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
.LLST18:
	.byte	0x7
	.4byte	.LVL56
	.4byte	.LVL57
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL57
	.4byte	.LFE335
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x7
	.4byte	.LVL56
	.4byte	.LVL57
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL57
	.4byte	.LVL62
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL62
	.4byte	.LFE335
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST20:
	.byte	0x7
	.4byte	.LVL59
	.4byte	.LVL61
	.byte	0x1
	.byte	0x59
	.byte	0
.LLST14:
	.byte	0x7
	.4byte	.LVL44
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
	.4byte	.LVL51
	.byte	0x1
	.byte	0x56
	.byte	0x7
	.4byte	.LVL51
	.4byte	.LVL53
	.byte	0x3
	.byte	0x76
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL53
	.4byte	.LVL54
	.byte	0x3
	.byte	0x7a
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL54
	.4byte	.LFE334
	.byte	0x1
	.byte	0x56
	.byte	0
.LLST16:
	.byte	0x7
	.4byte	.LVL46
	.4byte	.LVL47
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL47
	.4byte	.LFE334
	.byte	0x1
	.byte	0x5d
	.byte	0
.LLST17:
	.byte	0x7
	.4byte	.LVL48
	.4byte	.LVL49
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0x7
	.4byte	.LVL51
	.4byte	.LVL52
	.byte	0xa
	.byte	0x76
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	C
	.byte	0x22
	.byte	0
.LLST10:
	.byte	0x7
	.4byte	.LVL32
	.4byte	.LVL33
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL33
	.4byte	.LVL34
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL42
	.byte	0x1
	.byte	0x63
	.byte	0
.LLST12:
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL35
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL37
	.byte	0x3
	.byte	0x82
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LVL39
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL39
	.4byte	.LVL40
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL40
	.4byte	.LVL41
	.byte	0x1
	.byte	0x62
	.byte	0
.LLST13:
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL39
	.byte	0x1
	.byte	0x68
	.byte	0x7
	.4byte	.LVL39
	.4byte	.LVL40
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL40
	.4byte	.LVL43
	.byte	0x1
	.byte	0x68
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LVL26
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL26
	.4byte	.LVL28
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL28
	.4byte	.LVL30
	.byte	0x3
	.byte	0x7f
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL30
	.4byte	.LVL31
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST9:
	.byte	0x7
	.4byte	.LVL27
	.4byte	.LVL29
	.byte	0x1
	.byte	0x5d
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL19
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LFE328
	.byte	0x1
	.byte	0x5f
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
.LLST6:
	.byte	0x7
	.4byte	.LVL21
	.4byte	.LVL22
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL22
	.4byte	.LFE330
	.byte	0x3
	.byte	0x7f
	.byte	0x80,0x1
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x9c
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
.LLRL8:
	.byte	0x6
	.4byte	.LBB12
	.4byte	.LBE12
	.byte	0x6
	.4byte	.LBB16
	.4byte	.LBE16
	.byte	0x6
	.4byte	.LBB17
	.4byte	.LBE17
	.byte	0
.LLRL21:
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
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF16:
	.string	"inputsignal"
.LASF29:
	.string	"initfir"
.LASF25:
	.string	"count"
.LASF27:
	.string	"start"
.LASF31:
	.string	"uart_read_char"
.LASF26:
	.string	"check"
.LASF21:
	.string	"sort"
.LASF30:
	.string	"uart_read"
.LASF24:
	.string	"matmul"
.LASF20:
	.string	"qsort"
.LASF19:
	.string	"endflag"
.LASF6:
	.string	"unsigned char"
.LASF40:
	.string	"input"
.LASF36:
	.string	"uart_end"
.LASF10:
	.string	"long unsigned int"
.LASF23:
	.string	"temp"
.LASF7:
	.string	"short unsigned int"
.LASF38:
	.string	"partition"
.LASF42:
	.string	"__mulsi3"
.LASF12:
	.string	"unsigned int"
.LASF37:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF14:
	.string	"taps"
.LASF11:
	.string	"long long unsigned int"
.LASF18:
	.string	"result"
.LASF35:
	.string	"uart_write"
.LASF15:
	.string	"reg_fir_y"
.LASF8:
	.string	"int32_t"
.LASF34:
	.string	"uart_write_char"
.LASF17:
	.string	"outputsignal"
.LASF5:
	.string	"long long int"
.LASF32:
	.string	"char"
.LASF3:
	.string	"short int"
.LASF13:
	.string	"data_length"
.LASF33:
	.string	"uart_write_string"
.LASF9:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF22:
	.string	"pivot"
.LASF2:
	.string	"signed char"
.LASF39:
	.string	"output"
.LASF41:
	.string	"indata"
.LASF28:
	.string	"preparedata"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/SoC_Design/Final/testbench/counter_la"
.LASF0:
	.string	"uart.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
