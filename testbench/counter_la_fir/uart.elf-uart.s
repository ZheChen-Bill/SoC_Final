	.file	"uart.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/SoC_Final2/SoC_Final/testbench/counter_la_fir" "uart.c"
	.align	2
	.type	flush_cpu_icache, @function
flush_cpu_icache:
.LFB21:
	.file 1 "../../firmware/system.h"
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 26 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	flush_cpu_icache, .-flush_cpu_icache
	.align	2
	.type	flush_cpu_dcache, @function
flush_cpu_dcache:
.LFB22:
	.loc 1 29 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 33 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	flush_cpu_dcache, .-flush_cpu_dcache
	.globl	data_length
	.section	.sdata,"aw"
	.align	2
	.type	data_length, @object
	.size	data_length, 4
data_length:
	.word	64
	.globl	taps
	.data
	.align	2
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
	.globl	reg_fir_y
	.section	.sbss,"aw",@nobits
	.align	2
	.type	reg_fir_y, @object
	.size	reg_fir_y, 4
reg_fir_y:
	.zero	4
	.globl	inputsignal
	.section	.inputdata,"aw"
	.align	2
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
	.globl	outputsignal
	.section	.outputdata,"aw"
	.align	2
	.type	outputsignal, @object
	.size	outputsignal, 256
outputsignal:
	.zero	256
	.globl	A
	.data
	.align	2
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
	.globl	B
	.align	2
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
	.globl	result
	.bss
	.align	2
	.type	result, @object
	.size	result, 64
result:
	.zero	64
	.globl	C
	.data
	.align	2
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
	.globl	endflag
	.section	.sdata
	.align	2
	.type	endflag, @object
	.size	endflag, 4
endflag:
	.word	1
	.section	.mprj,"ax",@progbits
	.align	2
	.globl	uart_end
	.type	uart_end, @function
uart_end:
.LFB321:
	.file 2 "uart.c"
	.loc 2 7 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 8 13
	lui	a5,%hi(endflag)
	li	a4,1
	sw	a4,%lo(endflag)(a5)
	.loc 2 9 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE321:
	.size	uart_end, .-uart_end
	.align	2
	.globl	uart_write
	.type	uart_write, @function
uart_write:
.LFB322:
	.loc 2 12 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 2 13 10
	nop
.L5:
	.loc 2 13 14 discriminator 1
	li	a5,805306368
	addi	a5,a5,8
	lw	a5,0(a5)
	.loc 2 13 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L5
	.loc 2 14 6
	li	a5,805306368
	addi	a5,a5,4
	.loc 2 14 39
	lw	a4,-20(s0)
	sw	a4,0(a5)
	.loc 2 15 1
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE322:
	.size	uart_write, .-uart_write
	.align	2
	.globl	uart_write_char
	.type	uart_write_char, @function
uart_write_char:
.LFB323:
	.loc 2 18 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
	.loc 2 19 5
	lbu	a4,-17(s0)
	li	a5,10
	bne	a4,a5,.L9
	.loc 2 20 3
	li	a0,13
	call	uart_write_char
.L9:
	.loc 2 23 10
	nop
.L8:
	.loc 2 23 14 discriminator 1
	li	a5,805306368
	addi	a5,a5,8
	lw	a5,0(a5)
	.loc 2 23 11 discriminator 1
	andi	a5,a5,8
	bne	a5,zero,.L8
	.loc 2 24 6
	li	a5,805306368
	addi	a5,a5,4
	.loc 2 24 39
	lbu	a4,-17(s0)
	sw	a4,0(a5)
	.loc 2 25 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
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
	.loc 2 28 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 2 29 11
	j	.L11
.L12:
	.loc 2 30 28
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	.loc 2 30 9
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_write_char
.L11:
	.loc 2 29 12
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L12
	.loc 2 31 1
	nop
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE324:
	.size	uart_write_string, .-uart_write_string
	.align	2
	.globl	uart_read_char
	.type	uart_read_char, @function
uart_read_char:
.LFB325:
	.loc 2 35 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 37 12
	li	a5,805306368
	addi	a5,a5,8
	lw	a5,0(a5)
	.loc 2 37 44
	srli	a5,a5,5
	.loc 2 37 7
	bne	a5,zero,.L14
	.loc 2 37 67 discriminator 1
	li	a5,805306368
	addi	a5,a5,8
	lw	a5,0(a5)
	.loc 2 37 99 discriminator 1
	srli	a5,a5,4
	.loc 2 37 60 discriminator 1
	bne	a5,zero,.L14
.LBB2:
	.loc 2 38 17
	sw	zero,-24(s0)
	.loc 2 38 9
	j	.L15
.L16:
	.loc 2 39 13 discriminator 3
 #APP
# 39 "uart.c" 1
	nop
# 0 "" 2
	.loc 2 38 32 discriminator 3
 #NO_APP
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L15:
	.loc 2 38 26 discriminator 1
	lw	a5,-24(s0)
	ble	a5,zero,.L16
.LBE2:
	.loc 2 41 16
	li	a5,805306368
	lw	a5,0(a5)
	.loc 2 41 13
	sb	a5,-17(s0)
.L14:
	.loc 2 44 12
	lbu	a5,-17(s0)
	.loc 2 45 1
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE325:
	.size	uart_read_char, .-uart_read_char
	.align	2
	.globl	uart_read
	.type	uart_read, @function
uart_read:
.LFB326:
	.loc 2 48 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 50 12
	li	a5,805306368
	addi	a5,a5,8
	lw	a5,0(a5)
	.loc 2 50 44
	srli	a5,a5,5
	.loc 2 50 7
	bne	a5,zero,.L19
	.loc 2 50 67 discriminator 1
	li	a5,805306368
	addi	a5,a5,8
	lw	a5,0(a5)
	.loc 2 50 99 discriminator 1
	srli	a5,a5,4
	.loc 2 50 60 discriminator 1
	bne	a5,zero,.L19
.LBB3:
	.loc 2 51 17
	sw	zero,-24(s0)
	.loc 2 51 9
	j	.L20
.L21:
	.loc 2 52 13 discriminator 3
 #APP
# 52 "uart.c" 1
	nop
# 0 "" 2
	.loc 2 51 32 discriminator 3
 #NO_APP
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L20:
	.loc 2 51 26 discriminator 1
	lw	a5,-24(s0)
	ble	a5,zero,.L21
.LBE3:
	.loc 2 54 16
	li	a5,805306368
	lw	a5,0(a5)
	.loc 2 54 13
	sw	a5,-20(s0)
.L19:
	.loc 2 56 42
	lw	a5,-20(s0)
	slli	a4,a5,16
	.loc 2 56 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 56 36
	sw	a4,0(a5)
	.loc 2 58 12
	lw	a5,-20(s0)
	.loc 2 59 1
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE326:
	.size	uart_read, .-uart_read
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB327:
	.loc 2 62 61
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	sw	s1,8(sp)
	.cfi_offset 8, -4
	.cfi_offset 9, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 63 3
	li	a5,805306368
	addi	a5,a5,16
	.loc 2 63 38
	lui	a4,%hi(data_length)
	lw	a4,%lo(data_length)(a4)
	sw	a4,0(a5)
.LBB4:
	.loc 2 64 19
	li	s1,0
	.loc 2 64 2
	j	.L24
.L25:
	.loc 2 65 38 discriminator 3
	li	a5,201326592
	addi	a5,a5,8
	add	a5,s1,a5
	slli	a5,a5,2
	.loc 2 65 5 discriminator 3
	mv	a3,a5
	.loc 2 65 52 discriminator 3
	lui	a5,%hi(taps)
	addi	a4,a5,%lo(taps)
	slli	a5,s1,2
	add	a5,a4,a5
	lw	a5,0(a5)
	.loc 2 65 46 discriminator 3
	sw	a5,0(a3)
	.loc 2 64 29 discriminator 3
	addi	s1,s1,1
.L24:
	.loc 2 64 24 discriminator 1
	li	a5,10
	ble	s1,a5,.L25
.LBE4:
	.loc 2 67 1
	nop
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	lw	s1,8(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE327:
	.size	initfir, .-initfir
	.align	2
	.globl	ap_start
	.type	ap_start, @function
ap_start:
.LFB328:
	.loc 2 70 62
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
.L29:
	.loc 2 72 10
	li	a5,805306368
	lw	a5,0(a5)
	.loc 2 72 45
	andi	a4,a5,4
	.loc 2 72 6
	li	a5,4
	bne	a4,a5,.L29
	.loc 2 73 47
	li	a5,805306368
	lw	a4,0(a5)
	.loc 2 73 5
	li	a5,805306368
	.loc 2 73 82
	ori	a4,a4,1
	.loc 2 73 42
	sw	a4,0(a5)
	.loc 2 74 4
	nop
	.loc 2 77 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE328:
	.size	ap_start, .-ap_start
	.align	2
	.globl	start_DMA2
	.type	start_DMA2, @function
start_DMA2:
.LFB329:
	.loc 2 79 64
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 81 3
	li	a5,805306368
	addi	a5,a5,140
	.loc 2 81 38
	lui	a4,%hi(data_length)
	lw	a4,%lo(data_length)(a4)
	sw	a4,0(a5)
	.loc 2 82 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE329:
	.size	start_DMA2, .-start_DMA2
	.align	2
	.globl	start_DMA1
	.type	start_DMA1, @function
start_DMA1:
.LFB330:
	.loc 2 84 64
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 85 3
	li	a5,805306368
	addi	a5,a5,128
	.loc 2 85 38
	li	a4,939528192
	sw	a4,0(a5)
	.loc 2 86 3
	li	a5,805306368
	addi	a5,a5,132
	.loc 2 86 38
	lui	a4,%hi(data_length)
	lw	a4,%lo(data_length)(a4)
	sw	a4,0(a5)
	.loc 2 87 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE330:
	.size	start_DMA1, .-start_DMA1
	.align	2
	.globl	endflag_check
	.type	endflag_check, @function
endflag_check:
.LFB331:
	.loc 2 89 67
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
.L36:
	.loc 2 98 10
	li	a5,805306368
	lw	a5,0(a5)
	.loc 2 98 45
	andi	a4,a5,4
	.loc 2 98 6
	li	a5,4
	beq	a4,a5,.L38
	j	.L36
.L38:
	.loc 2 99 4
	nop
	.loc 2 102 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE331:
	.size	endflag_check, .-endflag_check
	.align	2
	.globl	check_output
	.type	check_output, @function
check_output:
.LFB332:
	.loc 2 103 74
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 2 104 48
	lw	a4,-20(s0)
	li	a5,234885120
	addi	a5,a5,-2048
	add	a5,a4,a5
	slli	a5,a5,2
	.loc 2 104 15
	lw	a4,0(a5)
	.loc 2 104 12
	lui	a5,%hi(reg_fir_y)
	sw	a4,%lo(reg_fir_y)(a5)
	.loc 2 105 9
	lui	a5,%hi(reg_fir_y)
	lw	a5,%lo(reg_fir_y)(a5)
	.loc 2 106 1
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE332:
	.size	check_output, .-check_output
	.align	2
	.globl	check_input
	.type	check_input, @function
check_input:
.LFB333:
	.loc 2 108 73
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 2 109 48
	lw	a4,-20(s0)
	li	a5,234881024
	addi	a5,a5,1024
	add	a5,a4,a5
	slli	a5,a5,2
	.loc 2 109 15
	lw	a4,0(a5)
	.loc 2 109 12
	lui	a5,%hi(reg_fir_y)
	sw	a4,%lo(reg_fir_y)(a5)
	.loc 2 110 9
	lui	a5,%hi(reg_fir_y)
	lw	a5,%lo(reg_fir_y)(a5)
	.loc 2 111 1
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE333:
	.size	check_input, .-check_input
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB334:
	.loc 2 113 56
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 114 2
	call	initfir
	.loc 2 116 2
	call	ap_start
	.loc 2 119 3
	li	a5,805306368
	addi	a5,a5,136
	.loc 2 119 38
	li	a4,939532288
	sw	a4,0(a5)
	.loc 2 121 2
	call	start_DMA2
	.loc 2 123 2
	call	start_DMA1
	.loc 2 125 1
	nop
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE334:
	.size	fir, .-fir
	.globl	__mulsi3
	.align	2
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB335:
	.loc 2 130 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 2 131 6
	sw	zero,-20(s0)
	.loc 2 136 15
	sw	zero,-36(s0)
	.loc 2 137 8
	sw	zero,-20(s0)
	.loc 2 137 2
	j	.L45
.L50:
	.loc 2 138 9
	sw	zero,-24(s0)
	.loc 2 138 3
	j	.L46
.L49:
	.loc 2 139 8
	sw	zero,-32(s0)
	.loc 2 140 10
	sw	zero,-28(s0)
	.loc 2 140 4
	j	.L47
.L48:
	.loc 2 141 16 discriminator 3
	lw	a5,-20(s0)
	slli	a4,a5,2
	.loc 2 141 20 discriminator 3
	lw	a5,-28(s0)
	add	a5,a4,a5
	.loc 2 141 13 discriminator 3
	lui	a4,%hi(A)
	addi	a4,a4,%lo(A)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a3,0(a5)
	.loc 2 141 31 discriminator 3
	lw	a5,-28(s0)
	slli	a4,a5,2
	.loc 2 141 35 discriminator 3
	lw	a5,-24(s0)
	add	a5,a4,a5
	.loc 2 141 28 discriminator 3
	lui	a4,%hi(B)
	addi	a4,a4,%lo(B)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	.loc 2 141 25 discriminator 3
	mv	a1,a5
	mv	a0,a3
	call	__mulsi3
	mv	a5,a0
	mv	a4,a5
	.loc 2 141 9 discriminator 3
	lw	a5,-32(s0)
	add	a5,a5,a4
	sw	a5,-32(s0)
	.loc 2 140 19 discriminator 3
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L47:
	.loc 2 140 15 discriminator 1
	lw	a4,-28(s0)
	li	a5,3
	ble	a4,a5,.L48
	.loc 2 142 13 discriminator 2
	lw	a5,-20(s0)
	slli	a4,a5,2
	.loc 2 142 17 discriminator 2
	lw	a5,-24(s0)
	add	a5,a4,a5
	.loc 2 142 22 discriminator 2
	lui	a4,%hi(result)
	addi	a4,a4,%lo(result)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-32(s0)
	sw	a4,0(a5)
	.loc 2 138 19 discriminator 2
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L46:
	.loc 2 138 14 discriminator 1
	lw	a4,-24(s0)
	li	a5,3
	ble	a4,a5,.L49
	.loc 2 137 18 discriminator 2
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L45:
	.loc 2 137 13 discriminator 1
	lw	a4,-20(s0)
	li	a5,3
	ble	a4,a5,.L50
	.loc 2 145 9
	lui	a5,%hi(result)
	addi	a5,a5,%lo(result)
	.loc 2 146 1
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE335:
	.size	matmul, .-matmul
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB336:
	.loc 2 149 75
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,44(sp)
	.cfi_offset 8, -4
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	.loc 2 150 6
	lui	a5,%hi(C)
	addi	a4,a5,%lo(C)
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-28(s0)
	.loc 2 151 6
	lw	a5,-36(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	.loc 2 153 8
	lw	a5,-36(s0)
	sw	a5,-24(s0)
	.loc 2 153 2
	j	.L53
.L55:
	.loc 2 154 7
	lui	a5,%hi(C)
	addi	a4,a5,%lo(C)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	.loc 2 154 5
	lw	a4,-28(s0)
	ble	a4,a5,.L54
	.loc 2 155 6
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	.loc 2 156 9
	lui	a5,%hi(C)
	addi	a4,a5,%lo(C)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-32(s0)
	.loc 2 157 12
	lui	a5,%hi(C)
	addi	a4,a5,%lo(C)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 2 157 9
	lui	a5,%hi(C)
	addi	a3,a5,%lo(C)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	.loc 2 158 9
	lui	a5,%hi(C)
	addi	a4,a5,%lo(C)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-32(s0)
	sw	a4,0(a5)
.L54:
	.loc 2 153 20 discriminator 2
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L53:
	.loc 2 153 15 discriminator 1
	lw	a4,-24(s0)
	lw	a5,-40(s0)
	blt	a4,a5,.L55
	.loc 2 161 6
	lui	a5,%hi(C)
	addi	a4,a5,%lo(C)
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,0(a5)
	.loc 2 161 16
	lw	a5,-20(s0)
	addi	a5,a5,1
	.loc 2 161 14
	lui	a3,%hi(C)
	addi	a3,a3,%lo(C)
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	.loc 2 161 4
	bge	a4,a5,.L56
	.loc 2 162 13
	lw	a5,-20(s0)
	addi	a5,a5,1
	.loc 2 162 8
	lui	a4,%hi(C)
	addi	a4,a4,%lo(C)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	sw	a5,-32(s0)
	.loc 2 163 6
	lw	a5,-20(s0)
	addi	a5,a5,1
	.loc 2 163 13
	lui	a4,%hi(C)
	addi	a3,a4,%lo(C)
	lw	a4,-40(s0)
	slli	a4,a4,2
	add	a4,a3,a4
	lw	a4,0(a4)
	.loc 2 163 10
	lui	a3,%hi(C)
	addi	a3,a3,%lo(C)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	.loc 2 164 9
	lui	a5,%hi(C)
	addi	a4,a5,%lo(C)
	lw	a5,-40(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-32(s0)
	sw	a4,0(a5)
.L56:
	.loc 2 166 10
	lw	a5,-20(s0)
	addi	a5,a5,1
	.loc 2 167 1
	mv	a0,a5
	lw	s0,44(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE336:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB337:
	.loc 2 169 72
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	.loc 2 170 4
	lw	a4,-36(s0)
	lw	a5,-40(s0)
	bge	a4,a5,.L60
.LBB5:
	.loc 2 171 11
	lw	a1,-40(s0)
	lw	a0,-36(s0)
	call	partition
	sw	a0,-20(s0)
	.loc 2 172 3
	lw	a5,-20(s0)
	addi	a5,a5,-1
	mv	a1,a5
	lw	a0,-36(s0)
	call	sort
	.loc 2 173 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	lw	a1,-40(s0)
	mv	a0,a5
	call	sort
.L60:
.LBE5:
	.loc 2 175 1
	nop
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE337:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB338:
	.loc 2 177 58
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 178 2
	li	a1,9
	li	a0,0
	call	sort
	.loc 2 179 9
	lui	a5,%hi(C)
	addi	a5,a5,%lo(C)
	.loc 2 180 1
	mv	a0,a5
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE338:
	.size	qsort, .-qsort
	.align	2
	.globl	check
	.type	check, @function
check:
.LFB339:
	.loc 2 182 58
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 184 8
	nop
	.loc 2 187 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE339:
	.size	check, .-check
	.text
.Letext0:
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.file 4 "header.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4a3
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x13
	.4byte	.LASF43
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
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
	.byte	0xd
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
	.byte	0xd
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
	.byte	0x14
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xe
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
	.byte	0xe
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
	.byte	0x9
	.string	"A"
	.byte	0x36
	.byte	0x6
	.4byte	0x101
	.byte	0x5
	.byte	0x3
	.4byte	A
	.byte	0x9
	.string	"B"
	.byte	0x3b
	.byte	0x6
	.4byte	0x101
	.byte	0x5
	.byte	0x3
	.4byte	B
	.byte	0x3
	.4byte	.LASF18
	.byte	0x40
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
	.byte	0x9
	.string	"C"
	.byte	0x44
	.byte	0x5
	.4byte	0x140
	.byte	0x5
	.byte	0x3
	.4byte	C
	.byte	0x3
	.4byte	.LASF19
	.byte	0x46
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	endflag
	.byte	0x5
	.4byte	.LASF25
	.byte	0xb6
	.byte	0x33
	.4byte	.LFB339
	.4byte	.LFE339-.LFB339
	.byte	0x1
	.byte	0x9c
	.byte	0x15
	.4byte	.LASF44
	.byte	0x2
	.byte	0xb1
	.byte	0x33
	.4byte	0x197
	.4byte	.LFB338
	.4byte	.LFE338-.LFB338
	.byte	0x1
	.byte	0x9c
	.byte	0xf
	.4byte	0x74
	.byte	0xa
	.4byte	.LASF22
	.byte	0xa9
	.byte	0x33
	.4byte	.LFB337
	.4byte	.LFE337-.LFB337
	.byte	0x1
	.byte	0x9c
	.4byte	0x1e3
	.byte	0x4
	.string	"low"
	.byte	0xa9
	.byte	0x3c
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x4
	.string	"hi"
	.byte	0xa9
	.byte	0x45
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x8
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.byte	0x1
	.string	"p"
	.byte	0xab
	.byte	0x7
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	.LASF26
	.byte	0x95
	.4byte	0x74
	.4byte	.LFB336
	.4byte	.LFE336-.LFB336
	.byte	0x1
	.byte	0x9c
	.4byte	0x24b
	.byte	0x4
	.string	"low"
	.byte	0x95
	.byte	0x40
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x4
	.string	"hi"
	.byte	0x95
	.byte	0x48
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xc
	.4byte	.LASF20
	.byte	0x96
	.byte	0x6
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1
	.string	"i"
	.byte	0x97
	.byte	0x6
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x1
	.string	"j"
	.byte	0x97
	.byte	0x10
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xc
	.4byte	.LASF21
	.byte	0x98
	.byte	0x6
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x16
	.4byte	.LASF23
	.byte	0x2
	.byte	0x81
	.byte	0x33
	.4byte	0x197
	.4byte	.LFB335
	.4byte	.LFE335-.LFB335
	.byte	0x1
	.byte	0x9c
	.4byte	0x2b1
	.byte	0x1
	.string	"i"
	.byte	0x83
	.byte	0x6
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x1
	.string	"j"
	.byte	0x84
	.byte	0x6
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1
	.string	"k"
	.byte	0x85
	.byte	0x6
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1
	.string	"sum"
	.byte	0x86
	.byte	0x6
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x17
	.string	"kk"
	.byte	0x2
	.byte	0x87
	.byte	0x6
	.4byte	0x74
	.byte	0xc
	.4byte	.LASF24
	.byte	0x88
	.byte	0xf
	.4byte	0x80
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0x18
	.string	"fir"
	.byte	0x2
	.byte	0x71
	.byte	0x33
	.4byte	.LFB334
	.4byte	.LFE334-.LFB334
	.byte	0x1
	.byte	0x9c
	.byte	0xb
	.4byte	.LASF27
	.byte	0x6c
	.4byte	0x74
	.4byte	.LFB333
	.4byte	.LFE333-.LFB333
	.byte	0x1
	.byte	0x9c
	.4byte	0x2ea
	.byte	0x10
	.4byte	.LASF28
	.byte	0x6c
	.byte	0x42
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xb
	.4byte	.LASF29
	.byte	0x67
	.4byte	0x74
	.4byte	.LFB332
	.4byte	.LFE332-.LFB332
	.byte	0x1
	.byte	0x9c
	.4byte	0x311
	.byte	0x10
	.4byte	.LASF28
	.byte	0x67
	.byte	0x43
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x5
	.4byte	.LASF30
	.byte	0x59
	.byte	0x33
	.4byte	.LFB331
	.4byte	.LFE331-.LFB331
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.4byte	.LASF31
	.byte	0x54
	.byte	0x33
	.4byte	.LFB330
	.4byte	.LFE330-.LFB330
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.4byte	.LASF32
	.byte	0x4f
	.byte	0x33
	.4byte	.LFB329
	.4byte	.LFE329-.LFB329
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.4byte	.LASF33
	.byte	0x46
	.byte	0x33
	.4byte	.LFB328
	.4byte	.LFE328-.LFB328
	.byte	0x1
	.byte	0x9c
	.byte	0x19
	.4byte	.LASF45
	.byte	0x2
	.byte	0x3e
	.byte	0x33
	.4byte	.LFB327
	.4byte	.LFE327-.LFB327
	.byte	0x1
	.byte	0x9c
	.4byte	0x381
	.byte	0x8
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.string	"i"
	.byte	0x40
	.byte	0x13
	.4byte	0x74
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF34
	.byte	0x2f
	.byte	0x2f
	.4byte	0x74
	.4byte	.LFB326
	.4byte	.LFE326-.LFB326
	.byte	0x1
	.byte	0x9c
	.4byte	0x3bf
	.byte	0x1
	.string	"num"
	.byte	0x31
	.byte	0x9
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x1
	.string	"i"
	.byte	0x33
	.byte	0x11
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF35
	.byte	0x22
	.byte	0x30
	.4byte	0x3fd
	.4byte	.LFB325
	.4byte	.LFE325-.LFB325
	.byte	0x1
	.byte	0x9c
	.4byte	0x3fd
	.byte	0x1
	.string	"num"
	.byte	0x24
	.byte	0x7
	.4byte	0x3fd
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x8
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x1
	.string	"i"
	.byte	0x26
	.byte	0x11
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF36
	.byte	0x1a
	.4byte	0x3fd
	.byte	0xa
	.4byte	.LASF37
	.byte	0x1b
	.byte	0x30
	.4byte	.LFB324
	.4byte	.LFE324-.LFB324
	.byte	0x1
	.byte	0x9c
	.4byte	0x42b
	.byte	0x4
	.string	"s"
	.byte	0x1b
	.byte	0x4e
	.4byte	0x42b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xf
	.4byte	0x404
	.byte	0xa
	.4byte	.LASF38
	.byte	0x11
	.byte	0x30
	.4byte	.LFB323
	.4byte	.LFE323-.LFB323
	.byte	0x1
	.byte	0x9c
	.4byte	0x452
	.byte	0x4
	.string	"c"
	.byte	0x11
	.byte	0x45
	.4byte	0x3fd
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0x1b
	.4byte	.LASF39
	.byte	0x2
	.byte	0xb
	.byte	0x30
	.4byte	.LFB322
	.4byte	.LFE322-.LFB322
	.byte	0x1
	.byte	0x9c
	.4byte	0x475
	.byte	0x4
	.string	"n"
	.byte	0xb
	.byte	0x3f
	.4byte	0x74
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x5
	.4byte	.LASF40
	.byte	0x6
	.byte	0x30
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.byte	0x12
	.4byte	.LASF41
	.byte	0x1c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x12
	.4byte	.LASF42
	.byte	0xe
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
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
	.byte	0x2
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
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
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x4
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
	.byte	0xa
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
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
	.byte	0x7c
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
	.byte	0x2
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
	.byte	0xc
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x16
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
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x5
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
	.byte	0x2
	.byte	0x18
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
	.byte	0x2
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
	.byte	0x12
	.byte	0x2e
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
	.byte	0x25
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
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0x2e
	.byte	0
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
	.byte	0x7c
	.byte	0x19
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0xb4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
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
.LLRL0:
	.byte	0x6
	.4byte	.Ltext0
	.4byte	.Letext0
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
.LASF16:
	.string	"inputsignal"
.LASF45:
	.string	"initfir"
.LASF24:
	.string	"count"
.LASF33:
	.string	"ap_start"
.LASF25:
	.string	"check"
.LASF22:
	.string	"sort"
.LASF34:
	.string	"uart_read"
.LASF29:
	.string	"check_output"
.LASF23:
	.string	"matmul"
.LASF44:
	.string	"qsort"
.LASF19:
	.string	"endflag"
.LASF6:
	.string	"unsigned char"
.LASF40:
	.string	"uart_end"
.LASF10:
	.string	"long unsigned int"
.LASF21:
	.string	"temp"
.LASF7:
	.string	"short unsigned int"
.LASF43:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF26:
	.string	"partition"
.LASF41:
	.string	"flush_cpu_dcache"
.LASF12:
	.string	"unsigned int"
.LASF35:
	.string	"uart_read_char"
.LASF14:
	.string	"taps"
.LASF11:
	.string	"long long unsigned int"
.LASF42:
	.string	"flush_cpu_icache"
.LASF18:
	.string	"result"
.LASF27:
	.string	"check_input"
.LASF39:
	.string	"uart_write"
.LASF30:
	.string	"endflag_check"
.LASF15:
	.string	"reg_fir_y"
.LASF8:
	.string	"int32_t"
.LASF38:
	.string	"uart_write_char"
.LASF17:
	.string	"outputsignal"
.LASF5:
	.string	"long long int"
.LASF36:
	.string	"char"
.LASF31:
	.string	"start_DMA1"
.LASF32:
	.string	"start_DMA2"
.LASF3:
	.string	"short int"
.LASF13:
	.string	"data_length"
.LASF37:
	.string	"uart_write_string"
.LASF28:
	.string	"index"
.LASF9:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF20:
	.string	"pivot"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/SoC_Final2/SoC_Final/testbench/counter_la_fir"
.LASF0:
	.string	"uart.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
