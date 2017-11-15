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
	.globl	camlAsync_floating_point__data_begin
camlAsync_floating_point__data_begin:
	.text
	.globl	camlAsync_floating_point__code_begin
camlAsync_floating_point__code_begin:
	.data
	.globl	camlAsync_floating_point__gc_roots
camlAsync_floating_point__gc_roots:
	.quad	0
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_211
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_211:
	.cfi_startproc
.L101:
	movq	8(%rax), %rbx
	movq	(%rax), %rax
	jmp	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_224@PLT
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_211,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_211,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_211
	.text
	.align	16
	.globl	camlAsync_floating_point__stock_ticker_10
camlAsync_floating_point__stock_ticker_10:
	.file	1	"async_floating_point.ml"
	.loc	1	11	17
	.cfi_startproc
.L103:
	movq	$11, %rbx
	.loc	1	28	2
	jmp	camlAsync_floating_point__loop_31@PLT
	.cfi_endproc
	.type camlAsync_floating_point__stock_ticker_10,@function
	.size camlAsync_floating_point__stock_ticker_10,. - camlAsync_floating_point__stock_ticker_10
	.text
	.align	16
	.globl	camlAsync_floating_point__loop_31
camlAsync_floating_point__loop_31:
	.loc	1	13	15
	.cfi_startproc
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
.L112:
	cmpq	$1, %rbx
	jne	.L111
	.file	2	"src/deferred0.ml"
	.loc	2	41	23
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	jmp	camlAsync_kernel__Scheduler1__create_full_281@PLT
	.cfi_adjust_cfa_offset 40
	.align	4
.L111:
	movq	%rax, (%rsp)
.L113:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L114
	leaq	8(%r15), %rax
	movq	%rax, 8(%rsp)
	movq	$3319, -8(%rax)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a24$2c10$2d$2d47$5d_78@GOTPCREL(%rip), %rdi
	movq	%rdi, (%rax)
	movq	$3, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	camlAsync_floating_point__const_float_3765@GOTPCREL(%rip), %rbx
	movq	camlBase__Random__t_450@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.file	3	"src/random.ml"
	.loc	3	88	18
	call	camlRandom__float_582@PLT
.L104:
	.loc	1	12	16
	movsd	(%rax), %xmm0
	movsd	.L116(%rip), %xmm1
	.loc	1	12	16
	subsd	%xmm1, %xmm0
	movq	(%rsp), %rax
	.loc	1	21	19
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 32(%rsp)
	movq	camlAsync_floating_point__const_float_3765@GOTPCREL(%rip), %rbx
	movq	camlBase__Random__t_450@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.loc	3	88	18
	call	camlRandom__float_582@PLT
.L105:
	.loc	1	12	16
	movsd	(%rax), %xmm0
	movsd	.L116(%rip), %xmm1
	.loc	1	12	16
	subsd	%xmm1, %xmm0
	movq	(%rsp), %rax
	.loc	1	20	19
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 24(%rsp)
	movq	camlAsync_floating_point__const_float_3765@GOTPCREL(%rip), %rbx
	movq	camlBase__Random__t_450@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.loc	3	88	18
	call	camlRandom__float_582@PLT
.L106:
	.loc	1	12	16
	movsd	(%rax), %xmm0
	movsd	.L116(%rip), %xmm1
	.loc	1	12	16
	subsd	%xmm1, %xmm0
	movq	(%rsp), %rax
	.loc	1	19	19
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 16(%rsp)
	movq	camlAsync_floating_point__const_float_3765@GOTPCREL(%rip), %rbx
	movq	camlBase__Random__t_450@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.loc	3	88	18
	call	camlRandom__float_582@PLT
.L107:
	.loc	1	12	16
	movsd	(%rax), %xmm0
	movsd	.L116(%rip), %xmm1
	.loc	1	12	16
	subsd	%xmm1, %xmm0
	.loc	1	17	22
.L117:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L118
	leaq	8(%r15), %rax
	movq	$4350, -8(%rax)
	movq	(%rsp), %rbx
	.loc	1	18	19
	addsd	(%rbx), %xmm0
	movsd	%xmm0, (%rax)
	movsd	16(%rsp), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	24(%rsp), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	32(%rsp), %xmm0
	movsd	%xmm0, 24(%rax)
	.loc	2	41	23
	call	camlAsync_kernel__Scheduler1__create_full_281@PLT
.L108:
	movq	8(%rsp), %rbx
	.file	4	"src/monad.ml"
	.loc	4	36	20
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	jmp	camlAsync_kernel__Deferred0__bind_187@PLT
	.cfi_adjust_cfa_offset 40
.L118:
	call	caml_call_gc@PLT
.L119:
	jmp	.L117
.L114:
	call	caml_call_gc@PLT
.L115:
	jmp	.L113
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlAsync_floating_point__loop_31,@function
	.size camlAsync_floating_point__loop_31,. - camlAsync_floating_point__loop_31
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a24$2c10$2d$2d47$5d_78
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a24$2c10$2d$2d47$5d_78:
	.loc	1	24	10
	.cfi_startproc
.L121:
	movq	16(%rbx), %rbx
	.loc	1	25	15
	addq	$-2, %rbx
	.loc	1	25	6
	jmp	camlAsync_floating_point__loop_31@PLT
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a24$2c10$2d$2d47$5d_78,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a24$2c10$2d$2d47$5d_78,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a24$2c10$2d$2d47$5d_78
	.text
	.align	16
	.globl	camlAsync_floating_point__Make_state_104
camlAsync_floating_point__Make_state_104:
	.loc	1	31	17
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L122:
	movq	%rax, %rbx
.L123:
	subq	$64, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L124
	leaq	8(%r15), %rdi
	movq	$4343, -8(%rdi)
	movq	caml_curry2@GOTPCREL(%rip), %rax
	movq	%rax, (%rdi)
	movq	$5, 8(%rdi)
	movq	camlAsync_floating_point__estimate_next_ticker_113@GOTPCREL(%rip), %rax
	movq	%rax, 16(%rdi)
	movq	%rbx, 24(%rdi)
	leaq	40(%rdi), %rax
	movq	$2048, -8(%rax)
	movq	camlAsync_floating_point__const_block_110@GOTPCREL(%rip), %rbx
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L124:
	call	caml_call_gc@PLT
.L125:
	jmp	.L123
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__Make_state_104,@function
	.size camlAsync_floating_point__Make_state_104,. - camlAsync_floating_point__Make_state_104
	.text
	.align	16
	.globl	camlAsync_floating_point__estimate_next_ticker_113
camlAsync_floating_point__estimate_next_ticker_113:
	.loc	1	50	27
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L128:
	movq	%rax, %rsi
.L129:
	subq	$80, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L130
	leaq	8(%r15), %rax
	movq	%rax, (%rsp)
	movq	$5367, -8(%rax)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a52$2c8$2d$2d788$5d_124@GOTPCREL(%rip), %rdx
	movq	%rdx, (%rax)
	movq	$3, 8(%rax)
	movq	24(%rdi), %rdi
	movq	%rdi, 16(%rax)
	movq	%rsi, 24(%rax)
	movq	%rbx, 32(%rax)
	.loc	1	51	47
	movsd	8(%rbx), %xmm0
	.loc	1	51	31
	movsd	(%rbx), %xmm1
	movq	(%rdi), %rdi
	leaq	48(%rax), %rbx
	movq	$1277, -8(%rbx)
	movsd	%xmm0, (%rbx)
	addq	$64, %rax
	movq	$1277, -8(%rax)
	movsd	%xmm1, (%rax)
	.loc	1	51	4
	call	caml_apply2@PLT
.L126:
	movq	(%rsp), %rbx
	.loc	4	36	20
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred0__bind_187@PLT
	.cfi_adjust_cfa_offset 8
.L130:
	call	caml_call_gc@PLT
.L131:
	jmp	.L129
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__estimate_next_ticker_113,@function
	.size camlAsync_floating_point__estimate_next_ticker_113,. - camlAsync_floating_point__estimate_next_ticker_113
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a52$2c8$2d$2d788$5d_124
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a52$2c8$2d$2d788$5d_124:
	.loc	1	52	8
	.cfi_startproc
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
.L141:
	movq	%rax, (%rsp)
	movq	%rbx, 8(%rsp)
	movq	camlAsync_floating_point__Paddfloat_arg_3782@GOTPCREL(%rip), %rbx
	movq	camlBase__Random__t_450@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.loc	3	88	18
	call	camlRandom__float_582@PLT
.L132:
	movq	8(%rsp), %rsi
	movq	24(%rsi), %rbx
	.loc	1	61	53
	movq	16(%rbx), %rdi
	movsd	.L142(%rip), %xmm0
	.loc	1	61	52
	mulsd	(%rdi), %xmm0
	.loc	1	61	34
	movq	(%rbx), %rbx
	movsd	.L143(%rip), %xmm1
	movq	(%rsp), %rdi
	.loc	1	53	13
	movsd	(%rdi), %xmm2
	.loc	1	53	13
	addsd	(%rax), %xmm2
	.loc	1	53	13
	subsd	%xmm1, %xmm2
	.loc	1	61	33
	addsd	(%rbx), %xmm2
	movq	16(%rsi), %rax
	movq	(%rax), %rdi
	.loc	1	61	52
.L144:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L145
	leaq	8(%r15), %rbx
	movq	$1277, -8(%rbx)
	movsd	%xmm0, (%rbx)
	leaq	16(%rbx), %rax
	movq	$1277, -8(%rax)
	movsd	%xmm2, (%rax)
	.loc	1	61	6
	call	caml_apply2@PLT
.L133:
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rbx
	movq	32(%rbx), %rax
	.loc	1	63	58
	movsd	8(%rax), %xmm0
	movsd	.L116(%rip), %xmm1
	.loc	1	63	33
	addsd	(%rax), %xmm1
	movq	16(%rbx), %rax
	movq	(%rax), %rdi
	.loc	1	63	58
.L147:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L148
	leaq	8(%r15), %rbx
	movq	$1277, -8(%rbx)
	movsd	%xmm0, (%rbx)
	leaq	16(%rbx), %rax
	movq	$1277, -8(%rax)
	movsd	%xmm1, (%rax)
	.loc	1	63	6
	call	caml_apply2@PLT
.L134:
	movq	%rax, 24(%rsp)
	movq	8(%rsp), %rbx
	movq	32(%rbx), %rax
	movsd	.L142(%rip), %xmm0
	.loc	1	65	49
	addsd	8(%rax), %xmm0
	.loc	1	65	33
	movsd	(%rax), %xmm1
	movq	16(%rbx), %rax
	movq	(%rax), %rdi
	.loc	1	65	49
.L150:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L151
	leaq	8(%r15), %rbx
	movq	$1277, -8(%rbx)
	movsd	%xmm0, (%rbx)
	leaq	16(%rbx), %rax
	movq	$1277, -8(%rax)
	movsd	%xmm1, (%rax)
	.loc	1	65	6
	call	caml_apply2@PLT
.L135:
	movq	%rax, (%rsp)
	movq	8(%rsp), %rbx
	movq	32(%rbx), %rax
	.loc	1	67	58
	movsd	8(%rax), %xmm0
	movsd	.L153(%rip), %xmm1
	.loc	1	67	33
	addsd	(%rax), %xmm1
	movq	16(%rbx), %rax
	movq	(%rax), %rdi
	.loc	1	67	58
.L154:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L155
	leaq	8(%r15), %rbx
	movq	$1277, -8(%rbx)
	movsd	%xmm0, (%rbx)
	leaq	16(%rbx), %rax
	movq	$1277, -8(%rax)
	movsd	%xmm1, (%rax)
	.loc	1	67	6
	call	caml_apply2@PLT
.L136:
	movq	%rax, %rbx
	movq	(%rsp), %rax
	.loc	1	69	42
	call	camlAsync_kernel__Deferred1__both_339@PLT
.L137:
	movq	%rax, (%rsp)
	movq	16(%rsp), %rax
	movq	24(%rsp), %rbx
	.loc	1	69	18
	call	camlAsync_kernel__Deferred1__both_339@PLT
.L138:
	movq	(%rsp), %rbx
	.loc	1	69	4
	call	camlAsync_kernel__Deferred1__both_339@PLT
.L139:
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_211_closure@GOTPCREL(%rip), %rbx
	.loc	4	37	20
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	jmp	camlAsync_kernel__Deferred1__map_206@PLT
	.cfi_adjust_cfa_offset 40
.L155:
	call	caml_call_gc@PLT
.L156:
	jmp	.L154
.L151:
	call	caml_call_gc@PLT
.L152:
	jmp	.L150
.L148:
	call	caml_call_gc@PLT
.L149:
	jmp	.L147
.L145:
	call	caml_call_gc@PLT
.L146:
	jmp	.L144
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a52$2c8$2d$2d788$5d_124,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a52$2c8$2d$2d788$5d_124,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a52$2c8$2d$2d788$5d_124
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_224
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_224:
	.loc	1	70	8
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L157:
	movq	%rax, %rdi
	movq	8(%rbx), %rsi
	movq	(%rbx), %rbx
	movq	8(%rdi), %rdx
	.loc	1	71	4
.L158:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L159
	leaq	8(%r15), %rax
	movq	$4350, -8(%rax)
	movq	(%rdi), %rdi
	.loc	1	71	4
	movsd	(%rdi), %xmm0
	movsd	%xmm0, (%rax)
	.loc	1	71	4
	movsd	(%rdx), %xmm0
	movsd	%xmm0, 8(%rax)
	.loc	1	71	4
	movsd	(%rbx), %xmm0
	movsd	%xmm0, 16(%rax)
	.loc	1	71	4
	movsd	(%rsi), %xmm0
	movsd	%xmm0, 24(%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L159:
	call	caml_call_gc@PLT
.L160:
	jmp	.L158
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_224,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_224,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_224
	.text
	.align	16
	.globl	camlAsync_floating_point__main_246
camlAsync_floating_point__main_246:
	.loc	1	75	9
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L163:
	movq	camlAsync_floating_point__float_array_252@GOTPCREL(%rip), %rax
	.loc	2	41	23
	call	camlAsync_kernel__Scheduler1__create_full_281@PLT
.L161:
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258_closure@GOTPCREL(%rip), %rbx
	.loc	4	36	20
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred0__bind_187@PLT
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__main_246,@function
	.size camlAsync_floating_point__main_246,. - camlAsync_floating_point__main_246
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258:
	.loc	1	78	6
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L166:
	movq	camlAsync_floating_point__Pmakeblock_3784@GOTPCREL(%rip), %rax
	.loc	1	98	17
	call	camlAsync_floating_point__Make_state_104@PLT
.L164:
	movq	%rax, %rdi
.L167:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L168
	leaq	8(%r15), %rbx
	movq	$3319, -8(%rbx)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a99$2c40$2d$2d595$5d_400@GOTPCREL(%rip), %rax
	movq	%rax, (%rbx)
	movq	$3, 8(%rbx)
	movq	%rdi, 16(%rbx)
	movq	(%rdi), %rax
	.loc	1	99	2
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred1__repeat_until_finished_771@PLT
	.cfi_adjust_cfa_offset 8
.L168:
	call	caml_call_gc@PLT
.L169:
	jmp	.L167
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258
	.text
	.align	16
	.globl	camlAsync_floating_point__estimate_fair_value_268
camlAsync_floating_point__estimate_fair_value_268:
	.loc	1	84	28
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L172:
	movq	%rax, %rdi
.L173:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L174
	leaq	8(%r15), %rax
	movq	%rax, (%rsp)
	movq	$4343, -8(%rax)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a85$2c30$2d$2d150$5d_279@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$3, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	camlAsync_floating_point__Psubfloat_arg_3768@GOTPCREL(%rip), %rax
	.loc	2	41	23
	call	camlAsync_kernel__Scheduler1__create_full_281@PLT
.L170:
	movq	(%rsp), %rbx
	.loc	4	36	20
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred0__bind_187@PLT
	.cfi_adjust_cfa_offset 8
.L174:
	call	caml_call_gc@PLT
.L175:
	jmp	.L173
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__estimate_fair_value_268,@function
	.size camlAsync_floating_point__estimate_fair_value_268,. - camlAsync_floating_point__estimate_fair_value_268
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a85$2c30$2d$2d150$5d_279
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a85$2c30$2d$2d150$5d_279:
	.loc	1	85	30
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L178:
	movq	%rax, %rdi
.L179:
	subq	$48, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L180
	leaq	8(%r15), %rax
	movq	%rax, (%rsp)
	movq	$5367, -8(%rax)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a86$2c30$2d$2d111$5d_291@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$3, 8(%rax)
	movq	16(%rbx), %rsi
	movq	%rsi, 16(%rax)
	movq	24(%rbx), %rbx
	movq	%rbx, 24(%rax)
	movq	%rdi, 32(%rax)
	movq	camlAsync_floating_point__const_float_3765@GOTPCREL(%rip), %rax
	.loc	2	41	23
	call	camlAsync_kernel__Scheduler1__create_full_281@PLT
.L176:
	movq	(%rsp), %rbx
	.loc	4	36	20
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred0__bind_187@PLT
	.cfi_adjust_cfa_offset 8
.L180:
	call	caml_call_gc@PLT
.L181:
	jmp	.L179
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a85$2c30$2d$2d150$5d_279,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a85$2c30$2d$2d150$5d_279,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a85$2c30$2d$2d150$5d_279
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a86$2c30$2d$2d111$5d_291
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a86$2c30$2d$2d111$5d_291:
	.loc	1	86	30
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L184:
	movq	%rax, %rdi
.L185:
	subq	$56, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L186
	leaq	8(%r15), %rax
	movq	%rax, (%rsp)
	movq	$6391, -8(%rax)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a87$2c30$2d$2d72$5d_304@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$3, 8(%rax)
	movq	16(%rbx), %rsi
	movq	%rsi, 16(%rax)
	movq	24(%rbx), %rsi
	movq	%rsi, 24(%rax)
	movq	32(%rbx), %rbx
	movq	%rbx, 32(%rax)
	movq	%rdi, 40(%rax)
	movq	camlAsync_floating_point__Paddfloat_arg_3782@GOTPCREL(%rip), %rax
	.loc	2	41	23
	call	camlAsync_kernel__Scheduler1__create_full_281@PLT
.L182:
	movq	(%rsp), %rbx
	.loc	4	37	20
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred1__map_206@PLT
	.cfi_adjust_cfa_offset 8
.L186:
	call	caml_call_gc@PLT
.L187:
	jmp	.L185
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a86$2c30$2d$2d111$5d_291,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a86$2c30$2d$2d111$5d_291,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a86$2c30$2d$2d111$5d_291
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a87$2c30$2d$2d72$5d_304
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a87$2c30$2d$2d72$5d_304:
	.loc	1	87	30
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L188:
	movq	%rax, %rdi
	.loc	1	88	6
.L189:
	subq	$16, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L190
	leaq	8(%r15), %rax
	movq	$1277, -8(%rax)
	movq	24(%rbx), %rsi
	movq	16(%rbx), %rdx
	movq	40(%rbx), %rcx
	movq	32(%rbx), %rbx
	.loc	1	88	14
	movsd	(%rbx), %xmm0
	.loc	1	88	14
	addsd	(%rcx), %xmm0
	.loc	1	88	13
	addsd	(%rdi), %xmm0
	.loc	1	88	6
	mulsd	(%rdx), %xmm0
	.loc	1	88	6
	addsd	(%rsi), %xmm0
	movsd	%xmm0, (%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L190:
	call	caml_call_gc@PLT
.L191:
	jmp	.L189
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a87$2c30$2d$2d72$5d_304,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a87$2c30$2d$2d72$5d_304,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a87$2c30$2d$2d72$5d_304
	.text
	.align	16
	.globl	camlAsync_floating_point__make_normalizer_359
camlAsync_floating_point__make_normalizer_359:
	.loc	1	94	22
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L195:
	movq	%rax, %rdi
.L196:
	subq	$48, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L197
	leaq	8(%r15), %rax
	movq	%rax, (%rsp)
	movq	$5367, -8(%rax)
	movq	caml_curry2@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$5, 8(%rax)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a96$2c8$2d$2d70$5d_367@GOTPCREL(%rip), %rsi
	movq	%rsi, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	%rbx, 32(%rax)
	movq	camlAsync_floating_point__const_float_3774@GOTPCREL(%rip), %rbx
	movq	camlBase__Random__t_450@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.loc	3	88	18
	call	camlRandom__float_582@PLT
.L192:
	.loc	2	41	23
	call	camlAsync_kernel__Scheduler1__create_full_281@PLT
.L193:
	movq	(%rsp), %rbx
	.loc	4	37	20
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred1__map_206@PLT
	.cfi_adjust_cfa_offset 8
.L197:
	call	caml_call_gc@PLT
.L198:
	jmp	.L196
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__make_normalizer_359,@function
	.size camlAsync_floating_point__make_normalizer_359,. - camlAsync_floating_point__make_normalizer_359
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a96$2c8$2d$2d70$5d_367
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a96$2c8$2d$2d70$5d_367:
	.loc	1	96	8
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L199:
	movq	%rax, %rsi
	.loc	1	96	29
.L200:
	subq	$16, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L201
	leaq	8(%r15), %rax
	movq	$1277, -8(%rax)
	movsd	.L203(%rip), %xmm0
	.loc	1	96	52
	movsd	(%rbx), %xmm1
	.loc	1	96	52
	divsd	%xmm0, %xmm1
	.loc	1	96	52
	mulsd	(%rsi), %xmm1
	movq	32(%rdi), %rsi
	movq	24(%rdi), %rdi
	.loc	1	96	34
	movsd	(%rdi), %xmm0
	.loc	1	96	34
	mulsd	(%rsi), %xmm0
	.loc	1	96	29
	addsd	(%rbx), %xmm0
	.loc	1	96	29
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L201:
	call	caml_call_gc@PLT
.L202:
	jmp	.L200
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a96$2c8$2d$2d70$5d_367,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a96$2c8$2d$2d70$5d_367,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a96$2c8$2d$2d70$5d_367
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a99$2c40$2d$2d595$5d_400
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a99$2c40$2d$2d595$5d_400:
	.loc	1	99	40
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L208:
	movq	%rax, %rdi
	.loc	1	100	7
	movq	8(%rdi), %rax
	cmpq	$20001, %rax
	jne	.L207
	movq	camlAsync_floating_point__const_block_493@GOTPCREL(%rip), %rax
	.loc	2	41	23
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Scheduler1__create_full_281@PLT
	.cfi_adjust_cfa_offset 8
	.align	4
.L207:
.L209:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L210
	leaq	8(%r15), %rax
	movq	%rax, (%rsp)
	movq	$4343, -8(%rax)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a104$2c10$2d$2d418$5d_415@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$3, 8(%rax)
	movq	16(%rbx), %rbx
	movq	%rbx, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	$11, %rbx
	.loc	1	103	19
	movq	16(%rdi), %rax
	.loc	1	28	2
	call	camlAsync_floating_point__loop_31@PLT
.L204:
	movq	(%rsp), %rbx
	.loc	4	36	20
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred0__bind_187@PLT
	.cfi_adjust_cfa_offset 8
.L210:
	call	caml_call_gc@PLT
.L211:
	jmp	.L209
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a99$2c40$2d$2d595$5d_400,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a99$2c40$2d$2d595$5d_400,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a99$2c40$2d$2d595$5d_400
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a104$2c10$2d$2d418$5d_415
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a104$2c10$2d$2d418$5d_415:
	.loc	1	104	10
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L214:
	movq	%rax, %rsi
.L215:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L216
	leaq	8(%r15), %rdi
	movq	%rdi, (%rsp)
	movq	$4343, -8(%rdi)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a106$2c10$2d$2d352$5d_423@GOTPCREL(%rip), %rax
	movq	%rax, (%rdi)
	movq	$3, 8(%rdi)
	movq	24(%rbx), %rax
	movq	%rax, 16(%rdi)
	movq	%rsi, 24(%rdi)
	movq	16(%rbx), %rbx
	movq	8(%rbx), %rdi
	movq	%rsi, %rbx
	.loc	1	105	6
	call	caml_apply2@PLT
.L212:
	movq	(%rsp), %rbx
	.loc	4	36	20
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred0__bind_187@PLT
	.cfi_adjust_cfa_offset 8
.L216:
	call	caml_call_gc@PLT
.L217:
	jmp	.L215
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a104$2c10$2d$2d418$5d_415,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a104$2c10$2d$2d418$5d_415,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a104$2c10$2d$2d418$5d_415
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a106$2c10$2d$2d352$5d_423
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a106$2c10$2d$2d352$5d_423:
	.loc	1	106	10
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L220:
	.loc	1	107	35
	movsd	(%rax), %xmm0
	movsd	.L221(%rip), %xmm1
	.loc	1	107	15
	addsd	8(%rax), %xmm0
	.loc	1	107	15
	divsd	%xmm1, %xmm0
	movq	24(%rbx), %rax
	.loc	1	108	33
	movsd	(%rax), %xmm1
	.loc	1	108	19
	movsd	8(%rax), %xmm2
	.loc	1	108	19
	subsd	%xmm1, %xmm2
.L222:
	subq	$72, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L223
	leaq	8(%r15), %rax
	movq	%rax, (%rsp)
	movq	$4343, -8(%rax)
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a110$2c10$2d$2d180$5d_447@GOTPCREL(%rip), %rdi
	movq	%rdi, (%rax)
	movq	$3, 8(%rax)
	movq	16(%rbx), %rdi
	movq	%rdi, 16(%rax)
	movq	24(%rbx), %rbx
	movq	%rbx, 24(%rax)
	leaq	40(%rax), %rbx
	movq	$1277, -8(%rbx)
	movsd	%xmm2, (%rbx)
	addq	$56, %rax
	movq	$1277, -8(%rax)
	movsd	%xmm0, (%rax)
	.loc	1	109	6
	call	camlAsync_floating_point__make_normalizer_359@PLT
.L218:
	movq	(%rsp), %rbx
	.loc	4	36	20
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Deferred0__bind_187@PLT
	.cfi_adjust_cfa_offset 8
.L223:
	call	caml_call_gc@PLT
.L224:
	jmp	.L222
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a106$2c10$2d$2d352$5d_423,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a106$2c10$2d$2d352$5d_423,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a106$2c10$2d$2d352$5d_423
	.text
	.align	16
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a110$2c10$2d$2d180$5d_447
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a110$2c10$2d$2d180$5d_447:
	.loc	1	110	10
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L227:
	movq	%rax, %rdi
	movq	%rbx, (%rsp)
	movq	16(%rbx), %rax
	.loc	1	114	27
	movq	(%rax), %rax
	.loc	1	114	16
	movq	(%rdi), %rsi
	movq	%rdi, %rbx
	.loc	1	114	16
	call	*%rsi
.L225:
	movq	%rax, %rbx
	.loc	1	112	16
.L228:
	subq	$56, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L229
	leaq	8(%r15), %rdi
	movq	$3072, -8(%rdi)
	movq	%rbx, (%rdi)
	movq	$7, 8(%rdi)
	movq	(%rsp), %rax
	movq	24(%rax), %rax
	movq	%rax, 16(%rdi)
	leaq	32(%rdi), %rax
	movq	$2048, -8(%rax)
	movq	$1981945591, (%rax)
	movq	%rdi, 8(%rax)
	.loc	2	41	23
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_kernel__Scheduler1__create_full_281@PLT
	.cfi_adjust_cfa_offset 8
.L229:
	call	caml_call_gc@PLT
.L230:
	jmp	.L228
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a110$2c10$2d$2d180$5d_447,@function
	.size camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a110$2c10$2d$2d180$5d_447,. - camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a110$2c10$2d$2d180$5d_447
	.data
	.quad	3063
	.globl	camlAsync_floating_point__stock_ticker_set_of_closures_546
camlAsync_floating_point__stock_ticker_set_of_closures_546:
	.globl	camlAsync_floating_point__stock_ticker_10_closure
camlAsync_floating_point__stock_ticker_10_closure:
	.quad	camlAsync_floating_point__stock_ticker_10
	.quad	3
	.data
	.quad	4087
	.globl	camlAsync_floating_point__make_normalizer_set_of_closures_556
camlAsync_floating_point__make_normalizer_set_of_closures_556:
	.globl	camlAsync_floating_point__make_normalizer_359_closure
camlAsync_floating_point__make_normalizer_359_closure:
	.quad	caml_curry2
	.quad	5
	.quad	camlAsync_floating_point__make_normalizer_359
	.data
	.quad	4087
	.globl	camlAsync_floating_point__estimate_fair_value_set_of_closures_553
camlAsync_floating_point__estimate_fair_value_set_of_closures_553:
	.globl	camlAsync_floating_point__estimate_fair_value_268_closure
camlAsync_floating_point__estimate_fair_value_268_closure:
	.quad	caml_curry2
	.quad	5
	.quad	camlAsync_floating_point__estimate_fair_value_268
	.data
	.quad	4087
	.globl	camlAsync_floating_point__loop_2249_548
camlAsync_floating_point__loop_2249_548:
	.globl	camlAsync_floating_point__loop_31_closure
camlAsync_floating_point__loop_31_closure:
	.quad	caml_curry2
	.quad	5
	.quad	camlAsync_floating_point__loop_31
	.data
	.quad	7159
	.globl	camlAsync_floating_point__set_of_closures_anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_550
camlAsync_floating_point__set_of_closures_anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_550:
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_211_closure
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_211_closure:
	.quad	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_211
	.quad	3
	.quad	3321
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_224_closure
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_224_closure:
	.quad	caml_curry2
	.quad	5
	.quad	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a70$2c8$2d$2d75$5d_224
	.data
	.quad	3063
	.globl	camlAsync_floating_point__set_of_closures_anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_552
camlAsync_floating_point__set_of_closures_anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_552:
	.globl	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258_closure
camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258_closure:
	.quad	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258
	.quad	3
	.data
	.quad	3063
	.globl	camlAsync_floating_point__Make_state_set_of_closures_549
camlAsync_floating_point__Make_state_set_of_closures_549:
	.globl	camlAsync_floating_point__Make_state_104_closure
camlAsync_floating_point__Make_state_104_closure:
	.quad	camlAsync_floating_point__Make_state_104
	.quad	3
	.data
	.quad	3063
	.globl	camlAsync_floating_point__main_set_of_closures_551
camlAsync_floating_point__main_set_of_closures_551:
	.globl	camlAsync_floating_point__main_246_closure
camlAsync_floating_point__main_246_closure:
	.quad	camlAsync_floating_point__main_246
	.quad	3
	.data
	.quad	2045
	.globl	camlAsync_floating_point__Pdivfloat_arg_3773
camlAsync_floating_point__Pdivfloat_arg_3773:
	.quad	0x4059000000000000
	.data
	.data
	.data
	.data
	.quad	2045
	.globl	camlAsync_floating_point__Paddfloat_arg_3782
camlAsync_floating_point__Paddfloat_arg_3782:
	.quad	0x4008000000000000
	.data
	.quad	2045
	.globl	camlAsync_floating_point__Paddfloat_arg_3783
camlAsync_floating_point__Paddfloat_arg_3783:
	.quad	0x4014000000000000
	.data
	.quad	2045
	.globl	camlAsync_floating_point__const_float_3774
camlAsync_floating_point__const_float_3774:
	.quad	0x4024000000000000
	.data
	.quad	3840
	.globl	camlAsync_floating_point
camlAsync_floating_point:
	.quad	camlAsync_floating_point__stock_ticker_10_closure
	.quad	camlAsync_floating_point__Make_state_104_closure
	.quad	camlAsync_floating_point__main_246_closure
	.data
	.quad	2816
	.globl	camlAsync_floating_point__const_block_493
camlAsync_floating_point__const_block_493:
	.quad	-578773211
	.quad	1
	.data
	.quad	2045
	.globl	camlAsync_floating_point__Psubfloat_arg_3768
camlAsync_floating_point__Psubfloat_arg_3768:
	.quad	0x3ff0000000000000
	.data
	.quad	2045
	.globl	camlAsync_floating_point__const_float_3765
camlAsync_floating_point__const_float_3765:
	.quad	0x4000000000000000
	.data
	.quad	3840
	.globl	camlAsync_floating_point__const_block_110
camlAsync_floating_point__const_block_110:
	.quad	camlAsync_floating_point__float_108
	.quad	1
	.quad	camlAsync_floating_point__float_array_252
	.data
	.quad	1792
	.globl	camlAsync_floating_point__Pmakeblock_3784
camlAsync_floating_point__Pmakeblock_3784:
	.quad	camlAsync_floating_point__estimate_fair_value_268_closure
	.data
	.data
	.data
	.quad	2045
	.globl	camlAsync_floating_point__float_108
camlAsync_floating_point__float_108:
	.quad	0
	.data
	.quad	5118
	.globl	camlAsync_floating_point__float_array_252
camlAsync_floating_point__float_array_252:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.data
	.quad	2045
	.globl	camlAsync_floating_point__Psubfloat_arg_3778
camlAsync_floating_point__Psubfloat_arg_3778:
	.quad	0x3ff8000000000000
	.data
	.data
	.data
	.text
	.align	16
	.globl	camlAsync_floating_point__entry
camlAsync_floating_point__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L235:
	.loc	3	92	26
	call	caml_alloc1@PLT
.L236:
	leaq	8(%r15), %rbx
	movq	$1024, -8(%rbx)
	movq	$2001, (%rbx)
	movq	camlBase__Random__t_450@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.loc	3	91	21
	call	camlBase__Random__full_init_128@PLT
.L231:
	movq	camlAsync_floating_point__float_array_252@GOTPCREL(%rip), %rax
	.loc	2	41	23
	call	camlAsync_kernel__Scheduler1__create_full_281@PLT
.L232:
	movq	camlAsync_floating_point__anon$2dfn$5basync_floating_point$2eml$3a78$2c6$2d$2d1177$5d_258_closure@GOTPCREL(%rip), %rbx
	.loc	4	36	20
	call	camlAsync_kernel__Deferred0__bind_187@PLT
.L233:
	movq	$1, %rbx
	movq	$1, %rax
	.loc	1	125	19
	call	camlAsync_unix__Raw_scheduler__go_7873@PLT
.L234:
	movq	caml_backtrace_pos@GOTPCREL(%rip), %rax
	xorq	%rbx, %rbx
	.file	5	"src/nothing.ml"
	.loc	5	4	71
	movl	%ebx, (%rax)
	movq	camlCore_kernel__Nothing__Pmakeblock_579@GOTPCREL(%rip), %rax
	.loc	5	4	71
	call	caml_raise_exn@PLT
.L237:
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__entry,@function
	.size camlAsync_floating_point__entry,. - camlAsync_floating_point__entry
	.data
	.section .rodata.cst8,"a",@progbits
.L221:
	.quad	0x4000000000000000
.L203:
	.quad	0x4059000000000000
.L153:
	.quad	0x4014000000000000
.L143:
	.quad	0x3ff8000000000000
.L142:
	.quad	0x4008000000000000
.L116:
	.quad	0x3ff0000000000000
	.text
	.globl	camlAsync_floating_point__code_end
camlAsync_floating_point__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.globl	camlAsync_floating_point__data_end
camlAsync_floating_point__data_end:
	.long	0
	.globl	camlAsync_floating_point__frametable
camlAsync_floating_point__frametable:
	.quad	51
	.quad	.L237
	.word	17
	.word	0
	.align	8
	.quad	.L238
	.quad	.L234
	.word	17
	.word	0
	.align	8
	.quad	.L240
	.quad	.L233
	.word	17
	.word	0
	.align	8
	.quad	.L241
	.quad	.L232
	.word	17
	.word	0
	.align	8
	.quad	.L244
	.quad	.L231
	.word	17
	.word	0
	.align	8
	.quad	.L246
	.quad	.L236
	.word	16
	.word	0
	.align	8
	.quad	.L230
	.word	16
	.word	2
	.word	0
	.word	3
	.align	8
	.quad	.L225
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L249
	.quad	.L218
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L250
	.quad	.L224
	.word	16
	.word	1
	.word	3
	.align	8
	.quad	.L212
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L251
	.quad	.L217
	.word	16
	.word	2
	.word	3
	.word	7
	.align	8
	.quad	.L204
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L252
	.quad	.L211
	.word	16
	.word	2
	.word	3
	.word	5
	.align	8
	.quad	.L202
	.word	16
	.word	3
	.word	3
	.word	5
	.word	7
	.align	8
	.quad	.L193
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L254
	.quad	.L192
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L257
	.quad	.L198
	.word	16
	.word	2
	.word	3
	.word	5
	.align	8
	.quad	.L191
	.word	16
	.word	2
	.word	3
	.word	5
	.align	8
	.quad	.L182
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L259
	.quad	.L187
	.word	16
	.word	2
	.word	3
	.word	5
	.align	8
	.quad	.L176
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L261
	.quad	.L181
	.word	16
	.word	2
	.word	3
	.word	5
	.align	8
	.quad	.L170
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L263
	.quad	.L175
	.word	16
	.word	2
	.word	3
	.word	5
	.align	8
	.quad	.L169
	.word	16
	.word	1
	.word	5
	.align	8
	.quad	.L164
	.word	17
	.word	0
	.align	8
	.quad	.L265
	.quad	.L161
	.word	17
	.word	0
	.align	8
	.quad	.L266
	.quad	.L160
	.word	16
	.word	4
	.word	3
	.word	5
	.word	7
	.word	9
	.align	8
	.quad	.L139
	.word	49
	.word	0
	.align	8
	.quad	.L268
	.quad	.L138
	.word	49
	.word	1
	.word	0
	.align	8
	.quad	.L269
	.quad	.L137
	.word	49
	.word	2
	.word	16
	.word	24
	.align	8
	.quad	.L270
	.quad	.L136
	.word	49
	.word	3
	.word	0
	.word	16
	.word	24
	.align	8
	.quad	.L271
	.quad	.L156
	.word	48
	.word	4
	.word	0
	.word	5
	.word	16
	.word	24
	.align	8
	.quad	.L135
	.word	49
	.word	3
	.word	8
	.word	16
	.word	24
	.align	8
	.quad	.L272
	.quad	.L152
	.word	48
	.word	4
	.word	5
	.word	8
	.word	16
	.word	24
	.align	8
	.quad	.L134
	.word	49
	.word	2
	.word	8
	.word	16
	.align	8
	.quad	.L273
	.quad	.L149
	.word	48
	.word	3
	.word	5
	.word	8
	.word	16
	.align	8
	.quad	.L133
	.word	49
	.word	1
	.word	8
	.align	8
	.quad	.L274
	.quad	.L146
	.word	48
	.word	2
	.word	5
	.word	8
	.align	8
	.quad	.L132
	.word	49
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L275
	.quad	.L126
	.word	17
	.word	1
	.word	0
	.align	8
	.quad	.L277
	.quad	.L131
	.word	16
	.word	3
	.word	3
	.word	5
	.word	7
	.align	8
	.quad	.L125
	.word	16
	.word	1
	.word	3
	.align	8
	.quad	.L108
	.word	49
	.word	1
	.word	8
	.align	8
	.quad	.L278
	.quad	.L119
	.word	48
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L107
	.word	49
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L280
	.quad	.L106
	.word	49
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L283
	.quad	.L105
	.word	49
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L286
	.quad	.L104
	.word	49
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L289
	.quad	.L115
	.word	48
	.word	2
	.word	0
	.word	3
	.align	8
	.align	8
.L241:
	.long	(.L292 - .) + 1946157056
	.long	147776
	.quad	.L242
	.align	8
.L280:
	.long	(.L293 - .) + -1409286144
	.long	360736
	.quad	.L281
	.align	8
.L255:
	.long	(.L294 - .) + 134217728
	.long	381425
	.quad	.L256
	.align	8
.L289:
	.long	(.L293 - .) + -1409286144
	.long	360736
	.quad	.L290
	.align	8
.L258:
	.long	(.L294 - .) + 134217728
	.long	381681
	.quad	.L256
	.align	8
.L290:
	.long	(.L294 - .) + -2013265920
	.long	49408
	.quad	.L291
	.align	8
.L271:
	.long	(.L294 - .) + 268435456
	.long	274529
	.quad	0
	.align	8
.L284:
	.long	(.L294 - .) + -2013265920
	.long	49408
	.quad	.L285
	.align	8
.L265:
	.long	(.L294 - .) + 2013265920
	.long	401680
	.quad	0
	.align	8
.L285:
	.long	(.L294 - .) + -1811939328
	.long	78304
	.quad	0
	.align	8
.L251:
	.long	(.L294 - .) + -1543503872
	.long	430176
	.quad	0
	.align	8
.L246:
	.long	(.L293 - .) + -1006632960
	.long	373072
	.quad	.L247
	.align	8
.L279:
	.long	(.L294 - .) + 603979776
	.long	69731
	.quad	0
	.align	8
.L240:
	.long	(.L294 - .) + -2013265920
	.long	512304
	.quad	0
	.align	8
.L262:
	.long	(.L294 - .) + 1677721600
	.long	352352
	.quad	0
	.align	8
.L291:
	.long	(.L294 - .) + -1744830464
	.long	86512
	.quad	0
	.align	8
.L278:
	.long	(.L295 - .) + -1409286144
	.long	168304
	.quad	.L279
	.align	8
.L245:
	.long	(.L294 - .) + 1476395008
	.long	315424
	.quad	.L243
	.align	8
.L273:
	.long	(.L294 - .) + 268435456
	.long	258145
	.quad	0
	.align	8
.L275:
	.long	(.L293 - .) + -1409286144
	.long	360736
	.quad	.L276
	.align	8
.L263:
	.long	(.L295 - .) + -1409286144
	.long	168304
	.quad	.L264
	.align	8
.L247:
	.long	(.L293 - .) + -1879048192
	.long	377088
	.quad	.L248
	.align	8
.L248:
	.long	(.L294 - .) + 1207959552
	.long	503840
	.quad	0
	.align	8
.L259:
	.long	(.L295 - .) + -1409286144
	.long	168304
	.quad	.L260
	.align	8
.L281:
	.long	(.L294 - .) + -2013265920
	.long	49408
	.quad	.L282
	.align	8
.L250:
	.long	(.L294 - .) + -2080374784
	.long	446560
	.quad	0
	.align	8
.L267:
	.long	(.L294 - .) + 1476395008
	.long	315424
	.quad	0
	.align	8
.L243:
	.long	(.L294 - .) + 1744830464
	.long	508176
	.quad	0
	.align	8
.L288:
	.long	(.L294 - .) + -1610612736
	.long	82448
	.quad	0
	.align	8
.L270:
	.long	(.L294 - .) + 335544320
	.long	283297
	.quad	0
	.align	8
.L260:
	.long	(.L294 - .) + 1677721600
	.long	356448
	.quad	0
	.align	8
.L268:
	.long	(.L294 - .) + 335544320
	.long	282689
	.quad	0
	.align	8
.L266:
	.long	(.L295 - .) + -1409286144
	.long	168304
	.quad	.L267
	.align	8
.L239:
	.long	(.L294 - .) + -2013265920
	.long	512032
	.quad	0
	.align	8
.L244:
	.long	(.L295 - .) + -1409286144
	.long	168304
	.quad	.L245
	.align	8
.L242:
	.long	(.L294 - .) + -67108864
	.long	315439
	.quad	.L243
	.align	8
.L287:
	.long	(.L294 - .) + -2013265920
	.long	49408
	.quad	.L288
	.align	8
.L282:
	.long	(.L294 - .) + -1811939328
	.long	74208
	.quad	0
	.align	8
.L276:
	.long	(.L294 - .) + -1946157056
	.long	217392
	.quad	0
	.align	8
.L256:
	.long	(.L294 - .) + 1744830464
	.long	389184
	.quad	0
	.align	8
.L253:
	.long	(.L294 - .) + 1946157056
	.long	421984
	.quad	0
	.align	8
.L249:
	.long	(.L294 - .) + -1879048192
	.long	467200
	.quad	0
	.align	8
.L261:
	.long	(.L295 - .) + -1409286144
	.long	168304
	.quad	.L262
	.align	8
.L283:
	.long	(.L293 - .) + -1409286144
	.long	360736
	.quad	.L284
	.align	8
.L272:
	.long	(.L294 - .) + 268435456
	.long	266337
	.quad	0
	.align	8
.L286:
	.long	(.L293 - .) + -1409286144
	.long	360736
	.quad	.L287
	.align	8
.L274:
	.long	(.L294 - .) + 469762048
	.long	249953
	.quad	0
	.align	8
.L252:
	.long	(.L294 - .) + 872415232
	.long	114720
	.quad	.L253
	.align	8
.L238:
	.long	(.L296 - .) + 1476395009
	.long	17521
	.quad	.L239
	.align	8
.L269:
	.long	(.L294 - .) + -1543503872
	.long	282912
	.quad	0
	.align	8
.L277:
	.long	(.L294 - .) + -469762048
	.long	208960
	.quad	0
	.align	8
.L264:
	.long	(.L294 - .) + 1677721600
	.long	348256
	.quad	0
	.align	8
.L257:
	.long	(.L293 - .) + -1409286144
	.long	360736
	.quad	.L258
	.align	8
.L254:
	.long	(.L295 - .) + -1409286144
	.long	168304
	.quad	.L255
.L295:
	.ascii	"src/deferred0.ml\0"
	.align	8
.L293:
	.ascii	"src/random.ml\0"
	.align	8
.L294:
	.ascii	"async_floating_point.ml\0"
	.align	8
.L292:
	.ascii	"src/monad.ml\0"
	.align	8
.L296:
	.ascii	"src/nothing.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits
