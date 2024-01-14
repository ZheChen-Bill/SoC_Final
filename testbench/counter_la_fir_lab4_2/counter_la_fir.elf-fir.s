	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/SoC_Design/Final/testbench/counter_la_fir_lab4_2" "fir.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB316:
	.file 1 "fir.c"
	.loc 1 4 61
	.cfi_startproc
	.loc 1 6 2
	.loc 1 6 36 is_stmt 0
	lui	a5,%hi(data_length)
	lw	a4,%lo(data_length)(a5)
	li	a5,805306368
	sw	a4,16(a5)
	.loc 1 7 2 is_stmt 1
.LBB2:
	.loc 1 7 6
.LVL0:
	.loc 1 7 24
	lui	a5,%hi(.LANCHOR0)
	addi	a4,a5,%lo(.LANCHOR0)
	addi	a1,a4,44
.LBE2:
	.loc 1 6 36 is_stmt 0
	addi	a5,a5,%lo(.LANCHOR0)
.LBB3:
	.loc 1 8 5
	li	a2,805306368
	addi	a2,a2,32
	sub	a2,a2,a4
.LVL1:
.L2:
	.loc 1 8 3 is_stmt 1 discriminator 3
	.loc 1 8 5 is_stmt 0 discriminator 3
	add	a4,a2,a5
	.loc 1 8 50 discriminator 3
	lw	a3,0(a5)
	.loc 1 8 44 discriminator 3
	sw	a3,0(a4)
	.loc 1 7 29 is_stmt 1 discriminator 3
	.loc 1 7 24 discriminator 3
	addi	a5,a5,4
	bne	a5,a1,.L2
.LBE3:
	.loc 1 10 2
	.loc 1 10 12 is_stmt 0
	lui	a5,%hi(reg_fir_x)
	sw	zero,%lo(reg_fir_x)(a5)
	.loc 1 11 2 is_stmt 1
	.loc 1 11 12 is_stmt 0
	lui	a5,%hi(reg_fir_y)
	sw	zero,%lo(reg_fir_y)(a5)
	.loc 1 13 1
	ret
	.cfi_endproc
.LFE316:
	.size	initfir, .-initfir
	.align	2
	.globl	start
	.type	start, @function
start:
.LFB317:
	.loc 1 15 59 is_stmt 1
	.cfi_startproc
	.loc 1 18 10 is_stmt 0
	li	a4,805306368
.L5:
	.loc 1 17 2 is_stmt 1
	.loc 1 18 3
	.loc 1 18 10 is_stmt 0
	lw	a5,0(a4)
	.loc 1 18 43
	andi	a5,a5,4
	.loc 1 18 6
	beq	a5,zero,.L5
	.loc 1 19 4 is_stmt 1
	.loc 1 19 45 is_stmt 0
	li	a4,805306368
	lw	a5,0(a4)
	.loc 1 19 78
	ori	a5,a5,1
	.loc 1 19 40
	sw	a5,0(a4)
	.loc 1 20 4 is_stmt 1
	.loc 1 23 1 is_stmt 0
	ret
	.cfi_endproc
.LFE317:
	.size	start, .-start
	.align	2
	.globl	input
	.type	input, @function
input:
.LFB318:
	.loc 1 25 59 is_stmt 1
	.cfi_startproc
	.loc 1 29 4
	.loc 1 29 38 is_stmt 0
	lui	a5,%hi(reg_fir_x)
	lw	a4,%lo(reg_fir_x)(a5)
	li	a5,805306368
	sw	a4,128(a5)
	.loc 1 33 1
	ret
	.cfi_endproc
.LFE318:
	.size	input, .-input
	.align	2
	.globl	output
	.type	output, @function
output:
.LFB319:
	.loc 1 35 60 is_stmt 1
	.cfi_startproc
	.loc 1 39 4
	.loc 1 39 17 is_stmt 0
	li	a5,805306368
	lw	a4,132(a5)
	.loc 1 39 14
	lui	a5,%hi(reg_fir_y)
	sw	a4,%lo(reg_fir_y)(a5)
	.loc 1 43 1
	ret
	.cfi_endproc
.LFE319:
	.size	output, .-output
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB320:
	.loc 1 45 56 is_stmt 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	s6,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.loc 1 47 2
	.loc 1 47 36 is_stmt 0
	li	a5,637534208
	li	a4,10813440
	sw	a4,12(a5)
	.loc 1 48 2 is_stmt 1
	call	initfir
.LVL2:
	.loc 1 50 2
	call	start
.LVL3:
	.loc 1 52 2
.LBB4:
	.loc 1 52 6
	.loc 1 52 24
	.loc 1 52 19 is_stmt 0
	li	s1,0
	.loc 1 53 26
	lui	s3,%hi(.LANCHOR1)
	addi	s3,s3,%lo(.LANCHOR1)
	.loc 1 53 13
	lui	s6,%hi(reg_fir_x)
	.loc 1 60 19
	lui	s5,%hi(reg_fir_y)
	lui	s2,%hi(.LANCHOR2)
	addi	s2,s2,%lo(.LANCHOR2)
	.loc 1 52 24
	li	s4,11
.LVL4:
.L10:
	.loc 1 53 3 is_stmt 1 discriminator 3
	.loc 1 53 26 is_stmt 0 discriminator 3
	slli	s0,s1,2
	add	a5,s3,s0
	lw	a5,0(a5)
	.loc 1 53 13 discriminator 3
	sw	a5,%lo(reg_fir_x)(s6)
	.loc 1 56 3 is_stmt 1 discriminator 3
	call	input
.LVL5:
	.loc 1 59 3 discriminator 3
	call	output
.LVL6:
	.loc 1 60 3 discriminator 3
	.loc 1 60 19 is_stmt 0 discriminator 3
	lw	a5,%lo(reg_fir_y)(s5)
	add	s0,s2,s0
	sw	a5,0(s0)
	.loc 1 52 29 is_stmt 1 discriminator 3
	addi	s1,s1,1
.LVL7:
	.loc 1 52 24 discriminator 3
	bne	s1,s4,.L10
.LBE4:
	.loc 1 97 3
	.loc 1 97 10 is_stmt 0
	lui	a0,%hi(.LANCHOR2)
	.loc 1 98 2
	addi	a0,a0,%lo(.LANCHOR2)
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
.LVL8:
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	lw	s6,0(sp)
	.cfi_restore 22
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE320:
	.size	fir, .-fir
	.globl	outputsignal
	.globl	inputsignal
	.globl	reg_fir_y
	.globl	reg_fir_x
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
	.section	.indata,"aw"
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
	.section	.outdata,"aw"
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
	.type	reg_fir_x, @object
	.size	reg_fir_x, 4
reg_fir_x:
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
	.file 3 "fir.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1c3
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL3
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x6
	.4byte	0x74
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.byte	0x2
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
	.byte	0x8
	.4byte	0x80
	.byte	0xa
	.byte	0
	.byte	0x2
	.4byte	.LASF14
	.byte	0xa
	.byte	0x5
	.4byte	0x98
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x2
	.4byte	.LASF15
	.byte	0xb
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	reg_fir_x
	.byte	0x2
	.4byte	.LASF16
	.byte	0xc
	.byte	0x5
	.4byte	0x74
	.byte	0x5
	.byte	0x3
	.4byte	reg_fir_y
	.byte	0x7
	.4byte	0x7b
	.4byte	0xeb
	.byte	0x8
	.4byte	0x80
	.byte	0x3f
	.byte	0
	.byte	0x6
	.4byte	0xdb
	.byte	0x2
	.4byte	.LASF17
	.byte	0xe
	.byte	0x32
	.4byte	0xeb
	.byte	0x5
	.byte	0x3
	.4byte	inputsignal
	.byte	0x2
	.4byte	.LASF18
	.byte	0x15
	.byte	0x33
	.4byte	0xeb
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0xc
	.string	"fir"
	.byte	0x1
	.byte	0x2d
	.byte	0x33
	.4byte	0x16b
	.4byte	.LFB320
	.4byte	.LFE320-.LFB320
	.byte	0x1
	.byte	0x9c
	.4byte	0x16b
	.byte	0xd
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x158
	.byte	0x9
	.string	"i"
	.byte	0x34
	.4byte	0x74
	.4byte	.LLST2
	.byte	0x3
	.4byte	.LVL5
	.4byte	0x181
	.byte	0x3
	.4byte	.LVL6
	.4byte	0x171
	.byte	0
	.byte	0x3
	.4byte	.LVL2
	.4byte	0x1a1
	.byte	0x3
	.4byte	.LVL3
	.4byte	0x191
	.byte	0
	.byte	0xe
	.byte	0x4
	.4byte	0x74
	.byte	0x4
	.4byte	.LASF19
	.byte	0x23
	.4byte	.LFB319
	.4byte	.LFE319-.LFB319
	.byte	0x1
	.byte	0x9c
	.byte	0x4
	.4byte	.LASF20
	.byte	0x19
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.byte	0x1
	.byte	0x9c
	.byte	0x4
	.4byte	.LASF21
	.byte	0xf
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.byte	0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0x4
	.byte	0x33
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.byte	0x10
	.4byte	.LLRL0
	.byte	0x9
	.string	"i"
	.byte	0x7
	.4byte	0x74
	.4byte	.LLST1
	.byte	0
	.byte	0
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
	.byte	0x3
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
	.byte	0x35
	.byte	0
	.byte	0x49
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
	.byte	0x21
	.byte	0x13
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
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
	.byte	0xe
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
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
.LLST2:
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL8
	.byte	0x1
	.byte	0x59
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.4byte	.LFB319
	.4byte	.LFE319-.LFB319
	.4byte	.LFB320
	.4byte	.LFE320-.LFB320
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
	.4byte	.LBB2
	.4byte	.LBE2
	.byte	0x6
	.4byte	.LBB3
	.4byte	.LBE3
	.byte	0
.LLRL3:
	.byte	0x6
	.4byte	.LFB316
	.4byte	.LFE316
	.byte	0x6
	.4byte	.LFB317
	.4byte	.LFE317
	.byte	0x6
	.4byte	.LFB318
	.4byte	.LFE318
	.byte	0x6
	.4byte	.LFB319
	.4byte	.LFE319
	.byte	0x6
	.4byte	.LFB320
	.4byte	.LFE320
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF17:
	.string	"inputsignal"
.LASF23:
	.string	"initfir"
.LASF22:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O1 -ffreestanding"
.LASF21:
	.string	"start"
.LASF6:
	.string	"unsigned char"
.LASF20:
	.string	"input"
.LASF10:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF12:
	.string	"unsigned int"
.LASF14:
	.string	"taps"
.LASF11:
	.string	"long long unsigned int"
.LASF15:
	.string	"reg_fir_x"
.LASF16:
	.string	"reg_fir_y"
.LASF8:
	.string	"int32_t"
.LASF18:
	.string	"outputsignal"
.LASF5:
	.string	"long long int"
.LASF3:
	.string	"short int"
.LASF13:
	.string	"data_length"
.LASF9:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
.LASF19:
	.string	"output"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"fir.c"
.LASF1:
	.string	"/home/ubuntu/SoC_Design/Final/testbench/counter_la_fir_lab4_2"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
