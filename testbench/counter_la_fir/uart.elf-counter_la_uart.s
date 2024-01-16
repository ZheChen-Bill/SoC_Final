	.file	"counter_la_uart.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/SoC_Design/Final/testbench/counter_la_fir" "counter_la_uart.c"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB321:
	.file 1 "counter_la_uart.c"
	.loc 1 53 1
	.cfi_startproc
	.loc 1 55 5
	.loc 1 83 5
	.loc 1 53 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.loc 1 83 53
	li	a2,1
	li	a5,-268419072
	.loc 1 85 39
	li	a3,8192
	addi	a4,a3,-2039
	.loc 1 83 53
	sw	a2,-2048(a5)
	.loc 1 85 5 is_stmt 1
	.loc 1 85 39 is_stmt 0
	li	a5,637534208
	sw	a4,160(a5)
	.loc 1 86 5 is_stmt 1
	.loc 1 86 39 is_stmt 0
	sw	a4,156(a5)
	.loc 1 87 5 is_stmt 1
	.loc 1 87 39 is_stmt 0
	sw	a4,152(a5)
	.loc 1 88 5 is_stmt 1
	.loc 1 88 39 is_stmt 0
	sw	a4,148(a5)
	.loc 1 89 5 is_stmt 1
	.loc 1 89 39 is_stmt 0
	sw	a4,144(a5)
	.loc 1 90 5 is_stmt 1
	.loc 1 90 39 is_stmt 0
	sw	a4,140(a5)
	.loc 1 91 5 is_stmt 1
	.loc 1 91 39 is_stmt 0
	sw	a4,136(a5)
	.loc 1 92 5 is_stmt 1
	.loc 1 92 39 is_stmt 0
	sw	a4,132(a5)
	.loc 1 93 5 is_stmt 1
	.loc 1 93 39 is_stmt 0
	sw	a4,128(a5)
	.loc 1 94 5 is_stmt 1
	.loc 1 94 39 is_stmt 0
	sw	a4,124(a5)
	.loc 1 95 5 is_stmt 1
	.loc 1 95 39 is_stmt 0
	sw	a4,120(a5)
	.loc 1 96 5 is_stmt 1
	.loc 1 96 39 is_stmt 0
	sw	a4,116(a5)
	.loc 1 97 5 is_stmt 1
	.loc 1 97 39 is_stmt 0
	sw	a4,112(a5)
	.loc 1 98 5 is_stmt 1
	.loc 1 98 39 is_stmt 0
	sw	a4,108(a5)
	.loc 1 99 5 is_stmt 1
	.loc 1 99 39 is_stmt 0
	sw	a4,104(a5)
	.loc 1 100 5 is_stmt 1
	.loc 1 100 39 is_stmt 0
	sw	a4,100(a5)
	.loc 1 102 5 is_stmt 1
	.loc 1 102 39 is_stmt 0
	sw	a4,96(a5)
	.loc 1 103 5 is_stmt 1
	.loc 1 103 39 is_stmt 0
	sw	a4,92(a5)
	.loc 1 104 5 is_stmt 1
	.loc 1 104 39 is_stmt 0
	sw	a4,88(a5)
	.loc 1 105 5 is_stmt 1
	.loc 1 105 39 is_stmt 0
	sw	a4,84(a5)
	.loc 1 106 5 is_stmt 1
	.loc 1 106 39 is_stmt 0
	sw	a4,80(a5)
	.loc 1 107 5 is_stmt 1
	.loc 1 107 39 is_stmt 0
	sw	a4,76(a5)
	.loc 1 108 5 is_stmt 1
	.loc 1 108 39 is_stmt 0
	sw	a4,72(a5)
	.loc 1 109 5 is_stmt 1
	.loc 1 109 39 is_stmt 0
	sw	a4,68(a5)
	.loc 1 110 5 is_stmt 1
	.loc 1 110 39 is_stmt 0
	sw	a4,64(a5)
	.loc 1 111 5 is_stmt 1
	.loc 1 111 39 is_stmt 0
	sw	a4,52(a5)
	.loc 1 112 5 is_stmt 1
	.loc 1 112 39 is_stmt 0
	sw	a4,48(a5)
	.loc 1 113 5 is_stmt 1
	.loc 1 113 39 is_stmt 0
	sw	a4,44(a5)
	.loc 1 114 5 is_stmt 1
	.loc 1 114 39 is_stmt 0
	sw	a4,40(a5)
	.loc 1 115 5 is_stmt 1
	.loc 1 115 39 is_stmt 0
	sw	a4,36(a5)
	.loc 1 117 5 is_stmt 1
	.loc 1 117 39 is_stmt 0
	addi	a3,a3,-2040
	sw	a3,60(a5)
	.loc 1 118 5 is_stmt 1
	.loc 1 118 39 is_stmt 0
	li	a4,1026
	sw	a4,56(a5)
	.loc 1 122 2 is_stmt 1
	.loc 1 122 36 is_stmt 0
	sw	a2,0(a5)
	.loc 1 123 2 is_stmt 1
	.loc 1 123 10 is_stmt 0
	li	s0,637534208
	.loc 1 123 43
	li	a4,1
.L2:
	.loc 1 123 43 is_stmt 1 discriminator 1
	.loc 1 123 10 is_stmt 0 discriminator 1
	lw	a5,0(s0)
	.loc 1 123 43 discriminator 1
	beq	a5,a4,.L2
	.loc 1 127 2 is_stmt 1
	.loc 1 127 114 is_stmt 0
	li	a5,-268423168
	sw	zero,12(a5)
	.loc 1 127 57
	sw	zero,28(a5)
	.loc 1 128 2 is_stmt 1
	.loc 1 128 112 is_stmt 0
	li	a3,-1
	sw	a3,8(a5)
	.loc 1 128 56
	sw	a3,24(a5)
	.loc 1 129 2 is_stmt 1
	.loc 1 129 112 is_stmt 0
	sw	zero,4(a5)
	.loc 1 129 56
	sw	zero,20(a5)
	.loc 1 130 2 is_stmt 1
	.loc 1 130 100 is_stmt 0
	sw	zero,0(a5)
	.loc 1 130 50
	sw	zero,16(a5)
	.loc 1 133 2 is_stmt 1
	.loc 1 133 36 is_stmt 0
	li	a3,-1421869056
	sw	a3,12(s0)
	.loc 1 136 2 is_stmt 1
	.loc 1 136 56 is_stmt 0
	sw	zero,56(a5)
	.loc 1 139 2 is_stmt 1
	.loc 1 139 112 is_stmt 0
	sw	zero,8(a5)
	.loc 1 139 56
	sw	zero,24(a5)
	.loc 1 151 2 is_stmt 1
.LBB13:
.LBB14:
	.file 2 "../../firmware/irq_vex.h"
	.loc 2 24 2
	.loc 2 25 2
 #APP
# 25 "../../firmware/irq_vex.h" 1
	csrr a5, 3008
# 0 "" 2
.LVL0:
	.loc 2 26 2
 #NO_APP
.LBE14:
.LBE13:
	.loc 1 152 2
	.loc 1 153 2
.LBB15:
.LBB16:
	.loc 2 31 2
	ori	a5,a5,4
.LVL1:
 #APP
# 31 "../../firmware/irq_vex.h" 1
	csrw 3008, a5
# 0 "" 2
.LVL2:
 #NO_APP
.LBE16:
.LBE15:
	.loc 1 155 2
.LBB17:
	.file 3 "../../firmware/csr.h"
	.loc 3 806 2
.LBB18:
.LBB19:
	.file 4 "../../firmware/hw/common.h"
	.loc 4 34 2
	.loc 4 34 32 is_stmt 0
	li	a5,-268406784
.LVL3:
	sw	a4,-2028(a5)
.LVL4:
.LBE19:
.LBE18:
.LBE17:
	.loc 1 173 2 is_stmt 1
	.loc 1 173 36 is_stmt 0
	li	a5,4063232
	sw	a5,12(s0)
	.loc 1 174 2 is_stmt 1
	.loc 1 174 13 is_stmt 0
	call	matmul
.LVL5:
	.loc 1 175 2 is_stmt 1
	.loc 1 175 43 is_stmt 0
	lw	a5,0(a0)
.LBB20:
	.loc 1 198 37
	li	s1,637534208
	.loc 1 197 16
	li	s2,64
.LBE20:
	.loc 1 175 43
	slli	a5,a5,16
	.loc 1 175 36
	sw	a5,12(s0)
	.loc 1 176 2 is_stmt 1
	.loc 1 176 47 is_stmt 0
	lw	a5,4(a0)
	slli	a5,a5,16
	.loc 1 176 36
	sw	a5,12(s0)
	.loc 1 177 2 is_stmt 1
	.loc 1 177 47 is_stmt 0
	lw	a5,8(a0)
	slli	a5,a5,16
	.loc 1 177 36
	sw	a5,12(s0)
	.loc 1 178 2 is_stmt 1
	.loc 1 178 47 is_stmt 0
	lw	a5,12(a0)
	slli	a5,a5,16
	.loc 1 178 36
	sw	a5,12(s0)
	.loc 1 182 2 is_stmt 1
	.loc 1 182 8 is_stmt 0
	call	qsort
.LVL6:
	.loc 1 183 2 is_stmt 1
	.loc 1 183 43 is_stmt 0
	lw	a5,0(a0)
	slli	a5,a5,16
	.loc 1 183 36
	sw	a5,12(s0)
	.loc 1 184 2 is_stmt 1
	.loc 1 184 47 is_stmt 0
	lw	a5,4(a0)
	slli	a5,a5,16
	.loc 1 184 36
	sw	a5,12(s0)
	.loc 1 185 2 is_stmt 1
	.loc 1 185 47 is_stmt 0
	lw	a5,8(a0)
	slli	a5,a5,16
	.loc 1 185 36
	sw	a5,12(s0)
	.loc 1 186 2 is_stmt 1
	.loc 1 186 47 is_stmt 0
	lw	a5,12(a0)
	slli	a5,a5,16
	.loc 1 186 36
	sw	a5,12(s0)
	.loc 1 187 2 is_stmt 1
	.loc 1 187 47 is_stmt 0
	lw	a5,16(a0)
	slli	a5,a5,16
	.loc 1 187 36
	sw	a5,12(s0)
	.loc 1 188 2 is_stmt 1
	.loc 1 188 47 is_stmt 0
	lw	a5,20(a0)
	slli	a5,a5,16
	.loc 1 188 36
	sw	a5,12(s0)
	.loc 1 189 2 is_stmt 1
	.loc 1 189 47 is_stmt 0
	lw	a5,24(a0)
	slli	a5,a5,16
	.loc 1 189 36
	sw	a5,12(s0)
	.loc 1 190 2 is_stmt 1
	.loc 1 190 47 is_stmt 0
	lw	a5,28(a0)
	slli	a5,a5,16
	.loc 1 190 36
	sw	a5,12(s0)
	.loc 1 191 2 is_stmt 1
	.loc 1 191 47 is_stmt 0
	lw	a5,32(a0)
	slli	a5,a5,16
	.loc 1 191 36
	sw	a5,12(s0)
	.loc 1 192 2 is_stmt 1
	.loc 1 192 47 is_stmt 0
	lw	a5,36(a0)
	slli	a5,a5,16
	.loc 1 192 36
	sw	a5,12(s0)
	.loc 1 195 2 is_stmt 1
	call	endflag_check
.LVL7:
	.loc 1 197 2
.LBB21:
	.loc 1 197 6
	.loc 1 197 16
	.loc 1 197 10 is_stmt 0
	li	s0,0
.LVL8:
.L3:
	.loc 1 198 3 is_stmt 1 discriminator 3
	.loc 1 198 40 is_stmt 0 discriminator 3
	mv	a0,s0
	call	check_output
.LVL9:
	.loc 1 198 57 discriminator 3
	slli	a0,a0,16
	.loc 1 198 37 discriminator 3
	sw	a0,12(s1)
	.loc 1 197 21 is_stmt 1 discriminator 3
	addi	s0,s0,1
.LVL10:
	.loc 1 197 16 discriminator 3
	bne	s0,s2,.L3
.LBE21:
	.loc 1 203 2
	.loc 1 204 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL11:
	.loc 1 203 36
	li	a5,-1420754944
	sw	a5,12(s1)
	.loc 1 204 1
	lw	s2,0(sp)
	.cfi_restore 18
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE321:
	.size	main, .-main
	.text
.Letext0:
	.file 5 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x21a
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x9
	.4byte	.LASF16
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL8
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
	.byte	0xa
	.4byte	.LASF17
	.byte	0x5
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x25
	.byte	0xc
	.4byte	0x6a
	.4byte	0x8e
	.byte	0xd
	.4byte	0x6a
	.byte	0
	.byte	0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0x24
	.byte	0xd
	.4byte	0x9c
	.byte	0x3
	.byte	0
	.byte	0x6
	.4byte	.LASF11
	.byte	0x27
	.4byte	0xac
	.4byte	0xac
	.byte	0x3
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x6a
	.byte	0x6
	.4byte	.LASF12
	.byte	0x26
	.4byte	0xac
	.4byte	0xc2
	.byte	0x3
	.byte	0
	.byte	0x10
	.4byte	.LASF20
	.byte	0x1
	.byte	0x34
	.byte	0x6
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
	.byte	0x1
	.byte	0x9c
	.4byte	0x1b1
	.byte	0x11
	.4byte	.LASF13
	.byte	0x1
	.byte	0x37
	.byte	0x9
	.4byte	0x6a
	.4byte	.LLST0
	.byte	0x7
	.string	"tmp"
	.byte	0xae
	.byte	0x7
	.4byte	0xac
	.4byte	.LLST1
	.byte	0x12
	.4byte	.LLRL6
	.4byte	0x11e
	.byte	0x7
	.string	"i"
	.byte	0xc5
	.byte	0xa
	.4byte	0x6a
	.4byte	.LLST7
	.byte	0x13
	.4byte	.LVL9
	.4byte	0x78
	.byte	0x14
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	0x1cb
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.byte	0x97
	.byte	0x9
	.4byte	0x137
	.byte	0x15
	.4byte	0x1dc
	.byte	0
	.byte	0x4
	.4byte	0x1b1
	.4byte	.LBB15
	.4byte	.LBE15-.LBB15
	.byte	0x99
	.byte	0x2
	.4byte	0x154
	.byte	0x2
	.4byte	0x1be
	.4byte	.LLST2
	.byte	0
	.byte	0x4
	.4byte	0x1e9
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.byte	0x9b
	.byte	0x2
	.4byte	0x195
	.byte	0x2
	.4byte	0x1f7
	.4byte	.LLST3
	.byte	0x16
	.4byte	0x203
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.byte	0x3
	.2byte	0x326
	.byte	0x2
	.byte	0x2
	.4byte	0x214
	.4byte	.LLST4
	.byte	0x2
	.4byte	0x20c
	.4byte	.LLST3
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL5
	.4byte	0xb2
	.byte	0x5
	.4byte	.LVL6
	.4byte	0x9c
	.byte	0x5
	.4byte	.LVL7
	.4byte	0x8e
	.byte	0
	.byte	0x17
	.4byte	.LASF14
	.byte	0x2
	.byte	0x1d
	.byte	0x14
	.byte	0x3
	.4byte	0x1cb
	.byte	0x18
	.4byte	.LASF13
	.byte	0x2
	.byte	0x1d
	.byte	0x2d
	.4byte	0x71
	.byte	0
	.byte	0x19
	.4byte	.LASF21
	.byte	0x2
	.byte	0x16
	.byte	0x1c
	.4byte	0x71
	.byte	0x3
	.4byte	0x1e9
	.byte	0x1a
	.4byte	.LASF13
	.byte	0x2
	.byte	0x18
	.byte	0xf
	.4byte	0x71
	.byte	0
	.byte	0x1b
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x325
	.byte	0x14
	.byte	0x3
	.4byte	0x203
	.byte	0x1c
	.string	"v"
	.byte	0x3
	.2byte	0x325
	.byte	0x38
	.4byte	0x50
	.byte	0
	.byte	0x1d
	.4byte	.LASF22
	.byte	0x4
	.byte	0x20
	.byte	0x14
	.byte	0x3
	.byte	0x8
	.string	"v"
	.byte	0x33
	.4byte	0x5c
	.byte	0x8
	.string	"a"
	.byte	0x44
	.4byte	0x5c
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
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
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
	.byte	0xd
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x4
	.byte	0x3b
	.byte	0x21
	.byte	0x20
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
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
	.byte	0x11
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
	.byte	0x12
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x2e
	.byte	0x1
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
	.byte	0x2e
	.byte	0x1
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
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x2e
	.byte	0x1
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
	.byte	0x20
	.byte	0xb
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
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6-1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL7-1
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL8
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LVL11
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x34
	.byte	0x21
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL2
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL4
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL4
	.byte	0x6
	.byte	0x9e
	.byte	0x4
	.4byte	0xf0006814
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB321
	.4byte	.LFE321-.LFB321
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
.LLRL6:
	.byte	0x6
	.4byte	.LBB20
	.4byte	.LBE20
	.byte	0x6
	.4byte	.LBB21
	.4byte	.LBE21
	.byte	0
.LLRL8:
	.byte	0x6
	.4byte	.LFB321
	.4byte	.LFE321
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF22:
	.string	"csr_write_simple"
.LASF18:
	.string	"check_output"
.LASF12:
	.string	"matmul"
.LASF11:
	.string	"qsort"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF20:
	.string	"main"
.LASF21:
	.string	"irq_getmask"
.LASF14:
	.string	"irq_setmask"
.LASF10:
	.string	"unsigned int"
.LASF16:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -Os -ffreestanding"
.LASF15:
	.string	"user_irq_0_ev_enable_write"
.LASF9:
	.string	"long long unsigned int"
.LASF19:
	.string	"endflag_check"
.LASF5:
	.string	"long long int"
.LASF13:
	.string	"mask"
.LASF3:
	.string	"short int"
.LASF17:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/SoC_Design/Final/testbench/counter_la_fir"
.LASF0:
	.string	"counter_la_uart.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
