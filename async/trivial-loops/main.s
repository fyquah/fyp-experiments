	.file ""
	.section .rodata.cst8,"a",@progbits
	.align	16
caml_negf_mask:
	.quad	0x8000000000000000
	.quad	0
	.align	16
caml_absf_mask:
	.quad	0x7fffffffffffffff
	.quad	-1
	.data
	.globl	camlMain__data_begin
camlMain__data_begin:
	.text
	.globl	camlMain__code_begin
camlMain__code_begin:
	.data
	.globl	camlMain__gc_roots
camlMain__gc_roots:
	.quad	0
	.text
	.align	16
	.globl	camlMain__run_4
camlMain__run_4:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L102:
	movq	camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9_closure@GOTPCREL(%rip), %rbx
	movq	$1, %rax
	call	camlAsync_kernel__Deferred1__repeat_until_finished_771@PLT
.L100:
	movq	camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42_closure@GOTPCREL(%rip), %rbx
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred1__map_206@PLT
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlMain__run_4,@function
	.size camlMain__run_4,. - camlMain__run_4
	.text
	.align	16
	.globl	camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9
camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L106:
	movq	%rax, %rbx
	cmpq	$1, %rbx
	jle	.L105
.L107:
	subq	$24, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L108
	leaq	8(%r15), %rax
	movq	$2048, -8(%rax)
	movq	$-578773211, (%rax)
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Scheduler1__create_full_281@PLT
	.cfi_adjust_cfa_offset 8
	.align	4
.L105:
.L110:
	subq	$24, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L111
	leaq	8(%r15), %rax
	movq	$2048, -8(%rax)
	movq	$1981945591, (%rax)
	addq	$2, %rbx
	movq	%rbx, 8(%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Scheduler1__create_full_281@PLT
	.cfi_adjust_cfa_offset 8
.L111:
	call	caml_call_gc@PLT
.L112:
	jmp	.L110
.L108:
	call	caml_call_gc@PLT
.L109:
	jmp	.L107
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9,@function
	.size camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9,. - camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9
	.text
	.align	16
	.globl	camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42
camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L115:
	movq	%rax, (%rsp)
	movq	camlMain__const_block_48@GOTPCREL(%rip), %rax
	call	camlAsync_unix__Async_print__printf_133@PLT
.L113:
	movq	%rax, %rbx
	movq	(%rsp), %rax
	addq	$2, %rax
	movq	(%rbx), %rdi
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	*%rdi
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42,@function
	.size camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42,. - camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42
	.data
	.quad	3063
	.globl	camlMain__set_of_closures_anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_90
camlMain__set_of_closures_anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_90:
	.globl	camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9_closure
camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9_closure:
	.quad	camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9
	.quad	3
	.data
	.quad	3063
	.globl	camlMain__set_of_closures_anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_89
camlMain__set_of_closures_anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_89:
	.globl	camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42_closure
camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42_closure:
	.quad	camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42
	.quad	3
	.data
	.quad	3063
	.globl	camlMain__run_set_of_closures_88
camlMain__run_set_of_closures_88:
	.globl	camlMain__run_4_closure
camlMain__run_4_closure:
	.quad	camlMain__run_4
	.quad	3
	.data
	.quad	2816
	.globl	camlMain__const_block_48
camlMain__const_block_48:
	.quad	camlMain__const_block_46
	.quad	camlMain__string_47
	.data
	.data
	.quad	2044
	.globl	camlMain__string_47
camlMain__string_47:
	.ascii	"%d\12"
	.space	4
	.byte	4
	.data
	.quad	2828
	.globl	camlMain__const_block_45
camlMain__const_block_45:
	.quad	21
	.quad	1
	.data
	.quad	1792
	.globl	camlMain
camlMain:
	.quad	camlMain__run_4_closure
	.data
	.data
	.data
	.quad	4868
	.globl	camlMain__const_block_46
camlMain__const_block_46:
	.quad	1
	.quad	1
	.quad	1
	.quad	camlMain__const_block_45
	.text
	.align	16
	.globl	camlMain__entry
camlMain__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L119:
	movq	camlMain__anon$2dfn$5bmain$2eml$3a6$2c35$2d$2d143$5d_9_closure@GOTPCREL(%rip), %rbx
	movq	$1, %rax
	call	camlAsync_kernel__Deferred1__repeat_until_finished_771@PLT
.L116:
	movq	camlMain__anon$2dfn$5bmain$2eml$3a11$2c6$2d$2d36$5d_42_closure@GOTPCREL(%rip), %rbx
	call	camlAsync_kernel__Deferred1__map_206@PLT
.L117:
	movq	$1, %rbx
	movq	$1, %rax
	call	camlAsync_unix__Raw_scheduler__go_7873@PLT
.L118:
	movq	camlCore_kernel__Nothing__Pmakeblock_579@GOTPCREL(%rip), %rax
	movq	%r14, %rsp
	popq	%r14
	ret
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlMain__entry,@function
	.size camlMain__entry,. - camlMain__entry
	.data
	.text
	.globl	camlMain__code_end
camlMain__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.globl	camlMain__data_end
camlMain__data_end:
	.long	0
	.globl	camlMain__frametable
camlMain__frametable:
	.quad	7
	.quad	.L118
	.word	17
	.word	0
	.align	8
	.quad	.L120
	.quad	.L117
	.word	17
	.word	0
	.align	8
	.quad	.L121
	.quad	.L116
	.word	17
	.word	0
	.align	8
	.quad	.L124
	.quad	.L113
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L125
	.quad	.L112
	.word	16
	.word	1
	.word	3
	.align	8
	.quad	.L109
	.word	16
	.word	1
	.word	3
	.align	8
	.quad	.L100
	.word	17
	.word	0
	.align	8
	.quad	.L126
	.align	8
.L120:
	.long	(.L127 - .) + -2080374784
	.long	61696
	.quad	0
	.align	8
.L126:
	.long	(.L127 - .) + 1006632960
	.long	24610
	.quad	0
	.align	8
.L123:
	.long	(.L127 - .) + 1140850688
	.long	57488
	.quad	0
	.align	8
.L122:
	.long	(.L127 - .) + -805306368
	.long	24610
	.quad	.L123
	.align	8
.L125:
	.long	(.L127 - .) + -1879048192
	.long	45296
	.quad	0
	.align	8
.L124:
	.long	(.L127 - .) + 1006632960
	.long	24610
	.quad	.L123
	.align	8
.L121:
	.long	(.L128 - .) + 1946157056
	.long	151872
	.quad	.L122
.L127:
	.ascii	"main.ml\0"
	.align	8
.L128:
	.ascii	"src/monad.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits
