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
	.quad	3840
	.globl	camlAsync_floating_point
camlAsync_floating_point:
	.quad	1
	.quad	1
	.quad	1
	.data
	.globl	camlAsync_floating_point__gc_roots
camlAsync_floating_point__gc_roots:
	.quad	camlAsync_floating_point
	.quad	0
	.text
	.align	16
	.globl	camlAsync_floating_point__stock_ticker_2233
camlAsync_floating_point__stock_ticker_2233:
	.file	1	"async_floating_point.ml"
	.loc	1	11	17
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L101:
	movq	%rax, %rsi
	movq	camlAsync_floating_point__120@GOTPCREL(%rip), %rbx
.L102:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L103
	leaq	8(%r15), %rdi
	movq	$4343, -8(%rdi)
	movq	caml_curry2@GOTPCREL(%rip), %rax
	movq	%rax, (%rdi)
	movq	$5, 8(%rdi)
	movq	camlAsync_floating_point__loop_2249@GOTPCREL(%rip), %rax
	movq	%rax, 16(%rdi)
	movq	%rbx, 24(%rdi)
	movq	$11, %rbx
	movq	%rsi, %rax
	.loc	1	28	2
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	jmp	camlAsync_floating_point__loop_2249@PLT
	.cfi_adjust_cfa_offset 8
.L103:
	call	caml_call_gc@PLT
.L104:
	jmp	.L102
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__stock_ticker_2233,@function
	.size camlAsync_floating_point__stock_ticker_2233,. - camlAsync_floating_point__stock_ticker_2233
	.text
	.align	16
	.globl	camlAsync_floating_point__diff_2235
camlAsync_floating_point__diff_2235:
	.loc	1	12	11
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L106:
	movq	camlBase__Random@GOTPCREL(%rip), %rax
	.loc	1	12	16
	movq	120(%rax), %rax
	.file	2	"random.ml"
	.loc	2	142	22
	call	camlRandom__rawfloat_1278@PLT
.L105:
	.loc	2	142	22
	movsd	(%rax), %xmm0
	movsd	.L107(%rip), %xmm1
	.loc	2	142	22
	mulsd	%xmm1, %xmm0
	movsd	.L108(%rip), %xmm1
	.loc	1	12	16
	subsd	%xmm1, %xmm0
	.loc	1	12	16
.L109:
	subq	$16, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L110
	leaq	8(%r15), %rax
	movq	$1277, -8(%rax)
	movsd	%xmm0, (%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L110:
	call	caml_call_gc@PLT
.L111:
	jmp	.L109
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__diff_2235,@function
	.size camlAsync_floating_point__diff_2235,. - camlAsync_floating_point__diff_2235
	.text
	.align	16
	.globl	camlAsync_floating_point__loop_2249
camlAsync_floating_point__loop_2249:
	.loc	1	13	15
	.cfi_startproc
	subq	$56, %rsp
	.cfi_adjust_cfa_offset 56
.L120:
	cmpq	$1, %rbx
	jne	.L119
	.file	3	"src/deferred0.ml"
	.loc	3	41	23
	call	camlAsync_kernel__Scheduler1__create_full_4190@PLT
.L118:
	addq	$56, %rsp
	.cfi_adjust_cfa_offset -56
	ret
	.cfi_adjust_cfa_offset 56
	.align	4
.L119:
	movq	%rax, (%rsp)
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	312(%rax), %rax
	movq	%rax, 8(%rsp)
.L121:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L122
	leaq	8(%r15), %rax
	movq	%rax, 16(%rsp)
	movq	$4343, -8(%rax)
	movq	camlAsync_floating_point__fun_4312@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$3, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	$1, %rax
	.loc	1	21	31
	call	camlAsync_floating_point__diff_2235@PLT
.L112:
	.loc	1	21	19
	movsd	(%rax), %xmm0
	movq	(%rsp), %rax
	.loc	1	21	19
	addsd	24(%rax), %xmm0
	movsd	%xmm0, 40(%rsp)
	movq	$1, %rax
	.loc	1	20	33
	call	camlAsync_floating_point__diff_2235@PLT
.L113:
	.loc	1	20	19
	movsd	(%rax), %xmm0
	movq	(%rsp), %rax
	.loc	1	20	19
	addsd	16(%rax), %xmm0
	movsd	%xmm0, 32(%rsp)
	movq	$1, %rax
	.loc	1	19	30
	call	camlAsync_floating_point__diff_2235@PLT
.L114:
	.loc	1	19	19
	movsd	(%rax), %xmm0
	movq	(%rsp), %rax
	.loc	1	19	19
	addsd	8(%rax), %xmm0
	movsd	%xmm0, 24(%rsp)
	movq	$1, %rax
	.loc	1	18	30
	call	camlAsync_floating_point__diff_2235@PLT
.L115:
	.loc	1	18	19
	movsd	(%rax), %xmm0
	movq	(%rsp), %rax
	.loc	1	18	19
	addsd	(%rax), %xmm0
	.loc	1	17	22
.L124:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L125
	leaq	8(%r15), %rax
	movq	$4350, -8(%rax)
	movsd	%xmm0, (%rax)
	movsd	24(%rsp), %xmm0
	movsd	%xmm0, 8(%rax)
	movsd	32(%rsp), %xmm0
	movsd	%xmm0, 16(%rax)
	movsd	40(%rsp), %xmm0
	movsd	%xmm0, 24(%rax)
	.loc	3	41	23
	call	camlAsync_kernel__Scheduler1__create_full_4190@PLT
.L116:
	movq	8(%rsp), %rbx
	.loc	1	16	13
	movq	24(%rbx), %rdi
	movq	16(%rsp), %rbx
	.file	4	"src/monad.ml"
	.loc	4	36	20
	addq	$56, %rsp
	.cfi_adjust_cfa_offset -56
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 56
.L125:
	call	caml_call_gc@PLT
.L126:
	jmp	.L124
.L122:
	call	caml_call_gc@PLT
.L123:
	jmp	.L121
	.cfi_adjust_cfa_offset -56
	.cfi_endproc
	.type camlAsync_floating_point__loop_2249,@function
	.size camlAsync_floating_point__loop_2249,. - camlAsync_floating_point__loop_2249
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4312
camlAsync_floating_point__fun_4312:
	.loc	1	24	10
	.cfi_startproc
.L128:
	movq	16(%rbx), %rdi
	movq	24(%rbx), %rbx
	.loc	1	25	15
	addq	$-2, %rbx
	.loc	1	25	6
	jmp	camlAsync_floating_point__loop_2249@PLT
	.cfi_endproc
	.type camlAsync_floating_point__fun_4312,@function
	.size camlAsync_floating_point__fun_4312,. - camlAsync_floating_point__fun_4312
	.text
	.align	16
	.globl	camlAsync_floating_point__Make_state_2498
camlAsync_floating_point__Make_state_2498:
	.loc	1	31	17
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L129:
	movq	%rax, %rbx
.L130:
	subq	$64, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L131
	leaq	8(%r15), %rdi
	movq	$4343, -8(%rdi)
	movq	caml_curry2@GOTPCREL(%rip), %rax
	movq	%rax, (%rdi)
	movq	$5, 8(%rdi)
	movq	camlAsync_floating_point__estimate_next_ticker_2506@GOTPCREL(%rip), %rax
	movq	%rax, 16(%rdi)
	movq	%rbx, 24(%rdi)
	leaq	40(%rdi), %rax
	movq	$2048, -8(%rax)
	movq	camlAsync_floating_point__5@GOTPCREL(%rip), %rbx
	movq	%rbx, (%rax)
	movq	%rdi, 8(%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L131:
	call	caml_call_gc@PLT
.L132:
	jmp	.L130
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__Make_state_2498,@function
	.size camlAsync_floating_point__Make_state_2498,. - camlAsync_floating_point__Make_state_2498
	.text
	.align	16
	.globl	camlAsync_floating_point__estimate_next_ticker_2506
camlAsync_floating_point__estimate_next_ticker_2506:
	.loc	1	50	27
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L135:
	movq	%rax, %rsi
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	312(%rax), %rax
	movq	%rax, (%rsp)
.L136:
	subq	$80, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L137
	leaq	8(%r15), %rax
	movq	%rax, 8(%rsp)
	movq	$5367, -8(%rax)
	movq	camlAsync_floating_point__fun_4340@GOTPCREL(%rip), %rdx
	movq	%rdx, (%rax)
	movq	$3, 8(%rax)
	movq	24(%rdi), %rdi
	movq	%rdi, 16(%rax)
	movq	%rsi, 24(%rax)
	movq	%rbx, 32(%rax)
	leaq	48(%rax), %rsi
	movq	$1277, -8(%rsi)
	.loc	1	51	47
	movsd	8(%rbx), %xmm0
	movsd	%xmm0, (%rsi)
	addq	$64, %rax
	movq	$1277, -8(%rax)
	.loc	1	51	31
	movsd	(%rbx), %xmm0
	movsd	%xmm0, (%rax)
	movq	(%rdi), %rdi
	movq	%rsi, %rbx
	.loc	1	51	4
	call	caml_apply2@PLT
.L133:
	movq	(%rsp), %rbx
	.loc	1	51	4
	movq	24(%rbx), %rdi
	movq	8(%rsp), %rbx
	.loc	4	36	20
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 24
.L137:
	call	caml_call_gc@PLT
.L138:
	jmp	.L136
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlAsync_floating_point__estimate_next_ticker_2506,@function
	.size camlAsync_floating_point__estimate_next_ticker_2506,. - camlAsync_floating_point__estimate_next_ticker_2506
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4340
camlAsync_floating_point__fun_4340:
	.loc	1	52	8
	.cfi_startproc
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
.L148:
	movq	%rax, (%rsp)
	movq	%rbx, 8(%rsp)
	movq	camlBase__Random@GOTPCREL(%rip), %rax
	.loc	1	53	19
	movq	120(%rax), %rax
	.loc	2	142	22
	call	camlRandom__rawfloat_1278@PLT
.L139:
	.loc	2	142	22
	movsd	(%rax), %xmm0
	movsd	.L149(%rip), %xmm1
	.loc	2	142	22
	mulsd	%xmm1, %xmm0
	movq	(%rsp), %rax
	.loc	1	53	13
	addsd	(%rax), %xmm0
	movsd	.L150(%rip), %xmm2
	.loc	1	53	13
	subsd	%xmm2, %xmm0
	.loc	1	61	52
.L151:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L152
	leaq	8(%r15), %rbx
	movq	$1277, -8(%rbx)
	movq	8(%rsp), %rsi
	movq	24(%rsi), %rdi
	.loc	1	61	53
	movq	16(%rdi), %rax
	.loc	1	61	52
	mulsd	(%rax), %xmm1
	movsd	%xmm1, (%rbx)
	leaq	16(%rbx), %rax
	movq	$1277, -8(%rax)
	.loc	1	61	34
	movq	(%rdi), %rdi
	.loc	1	61	33
	addsd	(%rdi), %xmm0
	movsd	%xmm0, (%rax)
	movq	16(%rsi), %rdi
	movq	(%rdi), %rdi
	.loc	1	61	6
	call	caml_apply2@PLT
.L140:
	movq	%rax, 16(%rsp)
	.loc	1	63	58
.L154:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L155
	leaq	8(%r15), %rbx
	movq	$1277, -8(%rbx)
	movq	8(%rsp), %rsi
	movq	32(%rsi), %rdi
	.loc	1	63	58
	movsd	8(%rdi), %xmm0
	movsd	%xmm0, (%rbx)
	leaq	16(%rbx), %rax
	movq	$1277, -8(%rax)
	movsd	.L108(%rip), %xmm0
	.loc	1	63	33
	addsd	(%rdi), %xmm0
	movsd	%xmm0, (%rax)
	movq	16(%rsi), %rdi
	movq	(%rdi), %rdi
	.loc	1	63	6
	call	caml_apply2@PLT
.L141:
	movq	%rax, 24(%rsp)
	.loc	1	65	49
.L157:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L158
	leaq	8(%r15), %rbx
	movq	$1277, -8(%rbx)
	movq	8(%rsp), %rsi
	movq	32(%rsi), %rdi
	movsd	.L149(%rip), %xmm0
	.loc	1	65	49
	addsd	8(%rdi), %xmm0
	movsd	%xmm0, (%rbx)
	leaq	16(%rbx), %rax
	movq	$1277, -8(%rax)
	.loc	1	65	33
	movsd	(%rdi), %xmm0
	movsd	%xmm0, (%rax)
	movq	16(%rsi), %rdi
	movq	(%rdi), %rdi
	.loc	1	65	6
	call	caml_apply2@PLT
.L142:
	movq	%rax, (%rsp)
	.loc	1	67	58
.L160:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L161
	leaq	8(%r15), %rbx
	movq	$1277, -8(%rbx)
	movq	8(%rsp), %rsi
	movq	32(%rsi), %rdi
	.loc	1	67	58
	movsd	8(%rdi), %xmm0
	movsd	%xmm0, (%rbx)
	leaq	16(%rbx), %rax
	movq	$1277, -8(%rax)
	movsd	.L163(%rip), %xmm0
	.loc	1	67	33
	addsd	(%rdi), %xmm0
	movsd	%xmm0, (%rax)
	movq	16(%rsi), %rdi
	movq	(%rdi), %rdi
	.loc	1	67	6
	call	caml_apply2@PLT
.L143:
	movq	%rax, %rbx
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	320(%rax), %rax
	movq	%rax, 8(%rsp)
	movq	camlAsync_floating_point__125@GOTPCREL(%rip), %rax
	movq	%rax, 32(%rsp)
	movq	(%rsp), %rax
	.loc	1	69	42
	call	camlAsync_kernel__Deferred1__both_6502@PLT
.L144:
	movq	%rax, (%rsp)
	movq	16(%rsp), %rax
	movq	24(%rsp), %rbx
	.loc	1	69	18
	call	camlAsync_kernel__Deferred1__both_6502@PLT
.L145:
	movq	(%rsp), %rbx
	.loc	1	69	4
	call	camlAsync_kernel__Deferred1__both_6502@PLT
.L146:
	movq	8(%rsp), %rbx
	.loc	1	69	4
	movq	24(%rbx), %rdi
	movq	32(%rsp), %rbx
	.loc	4	37	20
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 40
.L161:
	call	caml_call_gc@PLT
.L162:
	jmp	.L160
.L158:
	call	caml_call_gc@PLT
.L159:
	jmp	.L157
.L155:
	call	caml_call_gc@PLT
.L156:
	jmp	.L154
.L152:
	call	caml_call_gc@PLT
.L153:
	jmp	.L151
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlAsync_floating_point__fun_4340,@function
	.size camlAsync_floating_point__fun_4340,. - camlAsync_floating_point__fun_4340
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4350
camlAsync_floating_point__fun_4350:
	.loc	1	70	8
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L164:
	movq	%rax, %rdi
	.loc	1	71	4
.L165:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L166
	leaq	8(%r15), %rax
	movq	$4350, -8(%rax)
	movq	(%rdi), %rsi
	.loc	1	71	4
	movsd	(%rsi), %xmm0
	movsd	%xmm0, (%rax)
	movq	8(%rdi), %rdi
	.loc	1	71	4
	movsd	(%rdi), %xmm0
	movsd	%xmm0, 8(%rax)
	movq	(%rbx), %rdi
	.loc	1	71	4
	movsd	(%rdi), %xmm0
	movsd	%xmm0, 16(%rax)
	movq	8(%rbx), %rbx
	.loc	1	71	4
	movsd	(%rbx), %xmm0
	movsd	%xmm0, 24(%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L166:
	call	caml_call_gc@PLT
.L167:
	jmp	.L165
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__fun_4350,@function
	.size camlAsync_floating_point__fun_4350,. - camlAsync_floating_point__fun_4350
	.text
	.align	16
	.globl	camlAsync_floating_point__main_2520
camlAsync_floating_point__main_2520:
	.loc	1	75	9
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L170:
	movq	%rax, %rbx
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	312(%rax), %rax
	movq	%rax, (%rsp)
.L171:
	subq	$32, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L172
	leaq	8(%r15), %rax
	movq	%rax, 8(%rsp)
	movq	$3319, -8(%rax)
	movq	camlAsync_floating_point__fun_4360@GOTPCREL(%rip), %rdi
	movq	%rdi, (%rax)
	movq	$3, 8(%rax)
	movq	%rbx, 16(%rax)
	movq	camlAsync_floating_point__18@GOTPCREL(%rip), %rax
	.loc	3	41	23
	call	camlAsync_kernel__Scheduler1__create_full_4190@PLT
.L168:
	movq	(%rsp), %rbx
	.loc	1	77	2
	movq	24(%rbx), %rdi
	movq	8(%rsp), %rbx
	.loc	4	36	20
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 24
.L172:
	call	caml_call_gc@PLT
.L173:
	jmp	.L171
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlAsync_floating_point__main_2520,@function
	.size camlAsync_floating_point__main_2520,. - camlAsync_floating_point__main_2520
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4360
camlAsync_floating_point__fun_4360:
	.loc	1	78	6
	.cfi_startproc
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
.L177:
	movq	%rbx, (%rsp)
	movq	camlAsync_floating_point__124@GOTPCREL(%rip), %rbx
	.loc	1	79	17
.L178:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L179
	leaq	8(%r15), %rdi
	movq	$2048, -8(%rdi)
	movq	camlAsync_floating_point__68@GOTPCREL(%rip), %rax
	movq	%rax, (%rdi)
	movq	%rbx, 8(%rdi)
	movq	camlAsync_floating_point__122@GOTPCREL(%rip), %rax
	movq	%rax, 8(%rsp)
	leaq	24(%rdi), %rax
	movq	$1024, -8(%rax)
	.loc	1	98	28
	movq	8(%rdi), %rbx
	movq	%rbx, (%rax)
	.loc	1	98	17
	call	camlAsync_floating_point__Make_state_2498@PLT
.L174:
	movq	%rax, %rdi
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	312(%rax), %rax
	movq	%rax, 16(%rsp)
	movq	camlAsync_floating_point__121@GOTPCREL(%rip), %rax
	movq	%rax, 24(%rsp)
.L181:
	subq	$48, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L182
	leaq	8(%r15), %rbx
	movq	$5367, -8(%rbx)
	movq	camlAsync_floating_point__fun_4532@GOTPCREL(%rip), %rax
	movq	%rax, (%rbx)
	movq	$3, 8(%rbx)
	movq	(%rsp), %rax
	movq	16(%rax), %rax
	movq	%rax, 16(%rbx)
	movq	8(%rsp), %rax
	movq	%rax, 24(%rbx)
	movq	%rdi, 32(%rbx)
	movq	camlAsync_floating_point__5@GOTPCREL(%rip), %rax
	.loc	1	99	2
	call	camlAsync_kernel__Deferred1__repeat_until_finished_8947@PLT
.L175:
	movq	16(%rsp), %rbx
	.loc	1	99	2
	movq	24(%rbx), %rdi
	movq	24(%rsp), %rbx
	.loc	4	36	20
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 40
.L182:
	call	caml_call_gc@PLT
.L183:
	jmp	.L181
.L179:
	call	caml_call_gc@PLT
.L180:
	jmp	.L178
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlAsync_floating_point__fun_4360,@function
	.size camlAsync_floating_point__fun_4360,. - camlAsync_floating_point__fun_4360
	.text
	.align	16
	.globl	camlAsync_floating_point__estimate_fair_value_2525
camlAsync_floating_point__estimate_fair_value_2525:
	.loc	1	84	28
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L186:
	movq	%rax, %rdi
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	312(%rax), %rax
	movq	%rax, (%rsp)
.L187:
	subq	$40, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L188
	leaq	8(%r15), %rax
	movq	%rax, 8(%rsp)
	movq	$4343, -8(%rax)
	movq	camlAsync_floating_point__fun_4491@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$3, 8(%rax)
	movq	%rdi, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	camlAsync_floating_point__2@GOTPCREL(%rip), %rax
	.loc	3	41	23
	call	camlAsync_kernel__Scheduler1__create_full_4190@PLT
.L184:
	movq	(%rsp), %rbx
	.loc	1	85	6
	movq	24(%rbx), %rdi
	movq	8(%rsp), %rbx
	.loc	4	36	20
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 24
.L188:
	call	caml_call_gc@PLT
.L189:
	jmp	.L187
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlAsync_floating_point__estimate_fair_value_2525,@function
	.size camlAsync_floating_point__estimate_fair_value_2525,. - camlAsync_floating_point__estimate_fair_value_2525
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4491
camlAsync_floating_point__fun_4491:
	.loc	1	85	30
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L192:
	movq	%rax, %rdi
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	312(%rax), %rax
	movq	%rax, (%rsp)
.L193:
	subq	$48, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L194
	leaq	8(%r15), %rax
	movq	%rax, 8(%rsp)
	movq	$5367, -8(%rax)
	movq	camlAsync_floating_point__fun_4507@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$3, 8(%rax)
	movq	16(%rbx), %rsi
	movq	%rsi, 16(%rax)
	movq	24(%rbx), %rbx
	movq	%rbx, 24(%rax)
	movq	%rdi, 32(%rax)
	movq	camlAsync_floating_point__1@GOTPCREL(%rip), %rax
	.loc	3	41	23
	call	camlAsync_kernel__Scheduler1__create_full_4190@PLT
.L190:
	movq	(%rsp), %rbx
	.loc	1	86	6
	movq	24(%rbx), %rdi
	movq	8(%rsp), %rbx
	.loc	4	36	20
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 24
.L194:
	call	caml_call_gc@PLT
.L195:
	jmp	.L193
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlAsync_floating_point__fun_4491,@function
	.size camlAsync_floating_point__fun_4491,. - camlAsync_floating_point__fun_4491
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4507
camlAsync_floating_point__fun_4507:
	.loc	1	86	30
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L198:
	movq	%rax, %rdi
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	320(%rax), %rax
	movq	%rax, (%rsp)
.L199:
	subq	$56, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L200
	leaq	8(%r15), %rax
	movq	%rax, 8(%rsp)
	movq	$6391, -8(%rax)
	movq	camlAsync_floating_point__fun_4510@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$3, 8(%rax)
	movq	16(%rbx), %rsi
	movq	%rsi, 16(%rax)
	movq	24(%rbx), %rsi
	movq	%rsi, 24(%rax)
	movq	32(%rbx), %rbx
	movq	%rbx, 32(%rax)
	movq	%rdi, 40(%rax)
	movq	camlAsync_floating_point__15@GOTPCREL(%rip), %rax
	.loc	3	41	23
	call	camlAsync_kernel__Scheduler1__create_full_4190@PLT
.L196:
	movq	(%rsp), %rbx
	.loc	1	87	6
	movq	24(%rbx), %rdi
	movq	8(%rsp), %rbx
	.loc	4	37	20
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 24
.L200:
	call	caml_call_gc@PLT
.L201:
	jmp	.L199
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlAsync_floating_point__fun_4507,@function
	.size camlAsync_floating_point__fun_4507,. - camlAsync_floating_point__fun_4507
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4510
camlAsync_floating_point__fun_4510:
	.loc	1	87	30
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L202:
	movq	%rax, %rdi
	.loc	1	88	6
.L203:
	subq	$16, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L204
	leaq	8(%r15), %rax
	movq	$1277, -8(%rax)
	movsd	.L206(%rip), %xmm0
	movq	24(%rbx), %rsi
	movq	16(%rbx), %rdx
	movq	40(%rbx), %rcx
	movq	32(%rbx), %rbx
	.loc	1	88	14
	movsd	(%rbx), %xmm1
	.loc	1	88	14
	addsd	(%rcx), %xmm1
	.loc	1	88	13
	addsd	(%rdi), %xmm1
	.loc	1	88	6
	mulsd	(%rdx), %xmm1
	.loc	1	88	6
	addsd	(%rsi), %xmm1
	.loc	1	88	6
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L204:
	call	caml_call_gc@PLT
.L205:
	jmp	.L203
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__fun_4510,@function
	.size camlAsync_floating_point__fun_4510,. - camlAsync_floating_point__fun_4510
	.text
	.align	16
	.globl	camlAsync_floating_point__get_market_variance_2532
camlAsync_floating_point__get_market_variance_2532:
	.loc	1	93	26
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L209:
	movq	camlBase__Random@GOTPCREL(%rip), %rax
	.loc	1	93	47
	movq	120(%rax), %rax
	.loc	2	142	22
	call	camlRandom__rawfloat_1278@PLT
.L207:
	.loc	2	142	22
	movsd	(%rax), %xmm0
	movsd	.L206(%rip), %xmm1
	.loc	2	142	22
	mulsd	%xmm1, %xmm0
	.loc	2	142	22
.L210:
	subq	$16, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L211
	leaq	8(%r15), %rax
	movq	$1277, -8(%rax)
	movsd	%xmm0, (%rax)
	.loc	3	41	23
	call	camlAsync_kernel__Scheduler1__create_full_4190@PLT
.L208:
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L211:
	call	caml_call_gc@PLT
.L212:
	jmp	.L210
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__get_market_variance_2532,@function
	.size camlAsync_floating_point__get_market_variance_2532,. - camlAsync_floating_point__get_market_variance_2532
	.text
	.align	16
	.globl	camlAsync_floating_point__make_normalizer_2535
camlAsync_floating_point__make_normalizer_2535:
	.loc	1	94	22
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L215:
	movq	%rax, %rdi
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	320(%rax), %rax
	movq	%rax, (%rsp)
.L216:
	subq	$48, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L217
	leaq	8(%r15), %rax
	movq	%rax, 8(%rsp)
	movq	$5367, -8(%rax)
	movq	caml_curry2@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$5, 8(%rax)
	movq	camlAsync_floating_point__fun_4526@GOTPCREL(%rip), %rsi
	movq	%rsi, 16(%rax)
	movq	%rdi, 24(%rax)
	movq	%rbx, 32(%rax)
	movq	$1, %rax
	.loc	1	95	4
	call	camlAsync_floating_point__get_market_variance_2532@PLT
.L213:
	movq	(%rsp), %rbx
	.loc	1	95	4
	movq	24(%rbx), %rdi
	movq	8(%rsp), %rbx
	.loc	4	37	20
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 24
.L217:
	call	caml_call_gc@PLT
.L218:
	jmp	.L216
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlAsync_floating_point__make_normalizer_2535,@function
	.size camlAsync_floating_point__make_normalizer_2535,. - camlAsync_floating_point__make_normalizer_2535
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4526
camlAsync_floating_point__fun_4526:
	.loc	1	96	8
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L219:
	movq	%rax, %rsi
	.loc	1	96	29
.L220:
	subq	$16, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L221
	leaq	8(%r15), %rax
	movq	$1277, -8(%rax)
	movsd	.L223(%rip), %xmm0
	movsd	.L224(%rip), %xmm1
	.loc	1	96	53
	movsd	(%rbx), %xmm2
	.loc	1	96	53
	divsd	%xmm1, %xmm2
	.loc	1	96	53
	mulsd	(%rsi), %xmm2
	movq	32(%rdi), %rsi
	movq	24(%rdi), %rdi
	.loc	1	96	35
	movsd	(%rdi), %xmm1
	.loc	1	96	35
	mulsd	(%rsi), %xmm1
	.loc	1	96	30
	addsd	(%rbx), %xmm1
	.loc	1	96	29
	addsd	%xmm2, %xmm1
	.loc	1	96	29
	divsd	%xmm0, %xmm1
	movsd	%xmm1, (%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L221:
	call	caml_call_gc@PLT
.L222:
	jmp	.L220
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__fun_4526,@function
	.size camlAsync_floating_point__fun_4526,. - camlAsync_floating_point__fun_4526
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4532
camlAsync_floating_point__fun_4532:
	.loc	1	99	40
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L229:
	movq	%rax, %rdi
	movq	16(%rbx), %rax
	.loc	1	100	7
	movq	8(%rdi), %rsi
	cmpq	%rax, %rsi
	jne	.L228
	movq	camlAsync_floating_point__96@GOTPCREL(%rip), %rax
	.loc	3	41	23
	call	camlAsync_kernel__Scheduler1__create_full_4190@PLT
.L227:
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
	.align	4
.L228:
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	312(%rax), %rax
	movq	%rax, (%rsp)
.L230:
	subq	$48, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L231
	leaq	8(%r15), %rax
	movq	%rax, 8(%rsp)
	movq	$5367, -8(%rax)
	movq	camlAsync_floating_point__fun_4573@GOTPCREL(%rip), %rsi
	movq	%rsi, (%rax)
	movq	$3, 8(%rax)
	movq	24(%rbx), %rsi
	movq	%rsi, 16(%rax)
	movq	32(%rbx), %rbx
	movq	%rbx, 24(%rax)
	movq	%rdi, 32(%rax)
	.loc	1	103	19
	movq	16(%rdi), %rax
	.loc	1	103	6
	call	camlAsync_floating_point__stock_ticker_2233@PLT
.L225:
	movq	(%rsp), %rbx
	.loc	1	102	9
	movq	24(%rbx), %rdi
	movq	8(%rsp), %rbx
	.loc	4	36	20
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 24
.L231:
	call	caml_call_gc@PLT
.L232:
	jmp	.L230
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlAsync_floating_point__fun_4532,@function
	.size camlAsync_floating_point__fun_4532,. - camlAsync_floating_point__fun_4532
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4573
camlAsync_floating_point__fun_4573:
	.loc	1	104	10
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L235:
	movq	%rax, %rsi
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	312(%rax), %rax
	movq	%rax, (%rsp)
.L236:
	subq	$48, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L237
	leaq	8(%r15), %rdi
	movq	%rdi, 8(%rsp)
	movq	$5367, -8(%rdi)
	movq	camlAsync_floating_point__fun_4591@GOTPCREL(%rip), %rax
	movq	%rax, (%rdi)
	movq	$3, 8(%rdi)
	movq	16(%rbx), %rax
	movq	%rax, 16(%rdi)
	movq	32(%rbx), %rax
	movq	%rax, 24(%rdi)
	movq	%rsi, 32(%rdi)
	movq	24(%rbx), %rbx
	movq	8(%rbx), %rdi
	movq	%rsi, %rbx
	.loc	1	105	6
	call	camlAsync_floating_point__estimate_next_ticker_2506@PLT
.L233:
	movq	(%rsp), %rbx
	.loc	1	105	6
	movq	24(%rbx), %rdi
	movq	8(%rsp), %rbx
	.loc	4	36	20
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 24
.L237:
	call	caml_call_gc@PLT
.L238:
	jmp	.L236
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlAsync_floating_point__fun_4573,@function
	.size camlAsync_floating_point__fun_4573,. - camlAsync_floating_point__fun_4573
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4591
camlAsync_floating_point__fun_4591:
	.loc	1	106	10
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L241:
	movsd	.L107(%rip), %xmm0
	.loc	1	107	16
	movsd	8(%rax), %xmm1
	.loc	1	107	15
	addsd	(%rax), %xmm1
	.loc	1	107	15
	divsd	%xmm0, %xmm1
	movq	32(%rbx), %rax
	.loc	1	108	19
	movsd	8(%rax), %xmm0
	.loc	1	108	19
	subsd	(%rax), %xmm0
	movq	camlAsync@GOTPCREL(%rip), %rax
	movq	312(%rax), %rax
	movq	%rax, (%rsp)
.L242:
	subq	$72, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L243
	leaq	8(%r15), %rax
	movq	%rax, 8(%rsp)
	movq	$4343, -8(%rax)
	movq	camlAsync_floating_point__fun_4593@GOTPCREL(%rip), %rdi
	movq	%rdi, (%rax)
	movq	$3, 8(%rax)
	movq	24(%rbx), %rdi
	movq	%rdi, 16(%rax)
	movq	32(%rbx), %rbx
	movq	%rbx, 24(%rax)
	leaq	40(%rax), %rbx
	movq	$1277, -8(%rbx)
	movsd	%xmm0, (%rbx)
	addq	$56, %rax
	movq	$1277, -8(%rax)
	movsd	%xmm1, (%rax)
	.loc	1	109	6
	call	camlAsync_floating_point__make_normalizer_2535@PLT
.L239:
	movq	(%rsp), %rbx
	.loc	1	109	6
	movq	24(%rbx), %rdi
	movq	8(%rsp), %rbx
	.loc	4	36	20
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	jmp	caml_apply2@PLT
	.cfi_adjust_cfa_offset 24
.L243:
	call	caml_call_gc@PLT
.L244:
	jmp	.L242
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlAsync_floating_point__fun_4591,@function
	.size camlAsync_floating_point__fun_4591,. - camlAsync_floating_point__fun_4591
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4593
camlAsync_floating_point__fun_4593:
	.loc	1	110	10
	.cfi_startproc
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
.L249:
	movq	%rax, 16(%rsp)
	movq	%rbx, 24(%rsp)
	movq	16(%rbx), %rax
	.loc	1	111	49
	movq	(%rax), %rbx
	movq	%rbx, 8(%rsp)
	.loc	1	111	38
	movq	8(%rax), %rax
	movq	%rax, (%rsp)
	movq	camlAsync_floating_point__116@GOTPCREL(%rip), %rax
	.loc	1	111	6
	call	camlAsync_unix__Async_print__printf_2325@PLT
.L245:
	movq	%rax, %rdi
	movq	(%rsp), %rax
	movq	8(%rsp), %rbx
	.loc	1	111	6
	call	caml_apply2@PLT
.L246:
	movq	24(%rsp), %rax
	movq	16(%rax), %rax
	.loc	1	116	17
	movq	8(%rax), %rbx
	.loc	1	116	17
	addq	$2, %rbx
	movq	%rbx, (%rsp)
	.loc	1	115	27
	movq	(%rax), %rax
	movq	16(%rsp), %rbx
	.loc	1	115	16
	movq	(%rbx), %rdi
	.loc	1	115	16
	call	*%rdi
.L247:
	movq	%rax, %rbx
	.loc	1	113	16
.L250:
	subq	$56, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L251
	leaq	8(%r15), %rdi
	movq	$3072, -8(%rdi)
	movq	%rbx, (%rdi)
	movq	(%rsp), %rax
	movq	%rax, 8(%rdi)
	movq	24(%rsp), %rax
	movq	24(%rax), %rax
	movq	%rax, 16(%rdi)
	leaq	32(%rdi), %rax
	movq	$2048, -8(%rax)
	movq	$1981945591, (%rax)
	movq	%rdi, 8(%rax)
	.loc	3	41	23
	call	camlAsync_kernel__Scheduler1__create_full_4190@PLT
.L248:
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
.L251:
	call	caml_call_gc@PLT
.L252:
	jmp	.L250
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlAsync_floating_point__fun_4593,@function
	.size camlAsync_floating_point__fun_4593,. - camlAsync_floating_point__fun_4593
	.text
	.align	16
	.globl	camlAsync_floating_point__fun_4609
camlAsync_floating_point__fun_4609:
	.loc	1	121	6
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L254:
	movq	$1, %rbx
	movq	$1, %rax
	.file	5	"src/shutdown.ml"
	.loc	5	79	25
	call	camlAsync_unix__Shutdown__shutdown_11764@PLT
.L253:
	.file	6	"src/scheduler1.ml"
	.loc	6	13	30
.L255:
	subq	$16, %r15
	movq	caml_young_limit@GOTPCREL(%rip), %rax
	cmpq	(%rax), %r15
	jb	.L256
	leaq	8(%r15), %rax
	movq	$1024, -8(%rax)
	movq	$1, (%rax)
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L256:
	call	caml_call_gc@PLT
.L257:
	jmp	.L255
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__fun_4609,@function
	.size camlAsync_floating_point__fun_4609,. - camlAsync_floating_point__fun_4609
	.data
	.quad	3063
camlAsync_floating_point__120:
	.quad	camlAsync_floating_point__diff_2235
	.quad	3
	.data
	.quad	3063
camlAsync_floating_point__121:
	.quad	camlAsync_floating_point__fun_4609
	.quad	3
	.data
	.quad	4087
camlAsync_floating_point__122:
	.quad	caml_curry2
	.quad	5
	.quad	camlAsync_floating_point__make_normalizer_2535
	.data
	.quad	3063
camlAsync_floating_point__123:
	.quad	camlAsync_floating_point__get_market_variance_2532
	.quad	3
	.data
	.quad	4087
camlAsync_floating_point__124:
	.quad	caml_curry2
	.quad	5
	.quad	camlAsync_floating_point__estimate_fair_value_2525
	.data
	.quad	4087
camlAsync_floating_point__125:
	.quad	caml_tuplify2
	.quad	-3
	.quad	camlAsync_floating_point__fun_4350
	.data
	.quad	2045
camlAsync_floating_point__1:
	.quad	0x4000000000000000
	.data
	.quad	2045
camlAsync_floating_point__2:
	.quad	0x3ff0000000000000
	.data
	.quad	2045
	.globl	camlAsync_floating_point__3
camlAsync_floating_point__3:
	.quad	0
	.data
	.quad	5118
	.globl	camlAsync_floating_point__4
camlAsync_floating_point__4:
	.quad	0x401399999999999a
	.quad	0x4014cccccccccccd
	.quad	0x4008000000000000
	.quad	0x4028000000000000
	.data
	.quad	3840
	.globl	camlAsync_floating_point__5
camlAsync_floating_point__5:
	.quad	camlAsync_floating_point__3
	.quad	1
	.quad	camlAsync_floating_point__4
	.data
	.quad	2045
camlAsync_floating_point__15:
	.quad	0x4008000000000000
	.data
	.quad	2045
camlAsync_floating_point__16:
	.quad	0x3ff8000000000000
	.data
	.quad	2045
camlAsync_floating_point__17:
	.quad	0x4014000000000000
	.data
	.quad	5118
camlAsync_floating_point__18:
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.data
	.quad	5118
camlAsync_floating_point__68:
	.quad	0x401f333333333333
	.quad	0x3ff3333333333333
	.quad	0x402299999999999a
	.quad	0x4028cccccccccccd
	.data
	.quad	2045
camlAsync_floating_point__70:
	.quad	0x4024000000000000
	.data
	.quad	2045
camlAsync_floating_point__73:
	.quad	0x4059000000000000
	.data
	.quad	2045
camlAsync_floating_point__74:
	.quad	0x40c3880000000000
	.data
	.quad	2816
camlAsync_floating_point__96:
	.quad	-578773211
	.quad	1
	.data
	.quad	2044
camlAsync_floating_point__107:
	.ascii	"iter = "
	.byte	0
	.data
	.quad	2044
camlAsync_floating_point__108:
	.ascii	" pnl = "
	.byte	0
	.data
	.quad	1792
camlAsync_floating_point__109:
	.quad	7
	.data
	.quad	2828
camlAsync_floating_point__110:
	.quad	21
	.quad	1
	.data
	.quad	4872
camlAsync_floating_point__111:
	.quad	1
	.quad	1
	.quad	camlAsync_floating_point__109
	.quad	camlAsync_floating_point__110
	.data
	.quad	2827
camlAsync_floating_point__112:
	.quad	camlAsync_floating_point__108
	.quad	camlAsync_floating_point__111
	.data
	.quad	4868
camlAsync_floating_point__113:
	.quad	1
	.quad	1
	.quad	1
	.quad	camlAsync_floating_point__112
	.data
	.quad	2827
camlAsync_floating_point__114:
	.quad	camlAsync_floating_point__107
	.quad	camlAsync_floating_point__113
	.data
	.quad	4092
camlAsync_floating_point__115:
	.ascii	"iter = %d pnl = %.3f\12"
	.space	2
	.byte	2
	.data
	.quad	2816
camlAsync_floating_point__116:
	.quad	camlAsync_floating_point__114
	.quad	camlAsync_floating_point__115
	.data
	.quad	3063
camlAsync_floating_point__117:
	.quad	camlAsync_floating_point__main_2520
	.quad	3
	.data
	.quad	3063
camlAsync_floating_point__118:
	.quad	camlAsync_floating_point__Make_state_2498
	.quad	3
	.data
	.quad	3063
camlAsync_floating_point__119:
	.quad	camlAsync_floating_point__stock_ticker_2233
	.quad	3
	.text
	.align	16
	.globl	camlAsync_floating_point__entry
camlAsync_floating_point__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L263:
	movq	camlAsync_floating_point__119@GOTPCREL(%rip), %rax
	movq	camlAsync_floating_point@GOTPCREL(%rip), %rbx
	movq	%rax, (%rbx)
	movq	camlAsync_floating_point__118@GOTPCREL(%rip), %rax
	.loc	1	31	0
	movq	%rax, 8(%rbx)
	movq	camlAsync_floating_point__117@GOTPCREL(%rip), %rax
	movq	%rax, 16(%rbx)
	movq	$2001, %rax
	.loc	1	125	2
	call	camlBase__Random__init_2081@PLT
.L258:
	movq	camlAsync_unix__Async_sys@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.loc	1	126	38
	movq	-8(%rax), %rbx
	.loc	1	126	38
	cmpq	$2047, %rbx
	jbe	.L264
	.loc	1	126	38
	movq	8(%rax), %rdi
	.loc	1	126	23
	movq	caml_int_of_string@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L259:
	movq	caml_young_ptr@GOTPCREL(%rip), %r11
	movq	(%r11), %r15
	.loc	1	126	17
	call	camlAsync_floating_point__main_2520@PLT
.L260:
	movq	$1, %rbx
	movq	$1, %rax
	.loc	1	127	19
	call	camlAsync_unix__Raw_scheduler__go_48582@PLT
.L261:
	.loc	1	127	2
	call	camlCore_kernel__Nothing__unreachable_code_2832@PLT
.L262:
	movq	$1, %rax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
.L264:
	call	caml_ml_array_bound_error@PLT
.L265:
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlAsync_floating_point__entry,@function
	.size camlAsync_floating_point__entry,. - camlAsync_floating_point__entry
	.data
	.section .rodata.cst8,"a",@progbits
.L224:
	.quad	0x4059000000000000
.L223:
	.quad	0x40c3880000000000
.L206:
	.quad	0x4024000000000000
.L163:
	.quad	0x4014000000000000
.L150:
	.quad	0x3ff8000000000000
.L149:
	.quad	0x4008000000000000
.L108:
	.quad	0x3ff0000000000000
.L107:
	.quad	0x4000000000000000
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
	.quad	66
	.quad	.L262
	.word	17
	.word	0
	.align	8
	.quad	.L266
	.quad	.L261
	.word	17
	.word	0
	.align	8
	.quad	.L267
	.quad	.L260
	.word	17
	.word	0
	.align	8
	.quad	.L268
	.quad	.L259
	.word	17
	.word	0
	.align	8
	.quad	.L269
	.quad	.L265
	.word	17
	.word	0
	.align	8
	.quad	.L270
	.quad	.L258
	.word	17
	.word	0
	.align	8
	.quad	.L271
	.quad	.L257
	.word	16
	.word	0
	.align	8
	.quad	.L253
	.word	17
	.word	0
	.align	8
	.quad	.L272
	.quad	.L248
	.word	49
	.word	0
	.align	8
	.quad	.L274
	.quad	.L252
	.word	48
	.word	2
	.word	3
	.word	24
	.align	8
	.quad	.L247
	.word	49
	.word	1
	.word	24
	.align	8
	.quad	.L276
	.quad	.L246
	.word	49
	.word	2
	.word	16
	.word	24
	.align	8
	.quad	.L277
	.quad	.L245
	.word	49
	.word	4
	.word	0
	.word	8
	.word	16
	.word	24
	.align	8
	.quad	.L277
	.quad	.L239
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L278
	.quad	.L244
	.word	32
	.word	2
	.word	0
	.word	3
	.align	8
	.quad	.L233
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L279
	.quad	.L238
	.word	32
	.word	3
	.word	0
	.word	3
	.word	7
	.align	8
	.quad	.L225
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L280
	.quad	.L232
	.word	32
	.word	3
	.word	0
	.word	3
	.word	5
	.align	8
	.quad	.L227
	.word	33
	.word	0
	.align	8
	.quad	.L281
	.quad	.L222
	.word	16
	.word	3
	.word	3
	.word	5
	.word	7
	.align	8
	.quad	.L213
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L283
	.quad	.L218
	.word	32
	.word	3
	.word	0
	.word	3
	.word	5
	.align	8
	.quad	.L208
	.word	17
	.word	0
	.align	8
	.quad	.L284
	.quad	.L212
	.word	16
	.word	0
	.align	8
	.quad	.L207
	.word	17
	.word	0
	.align	8
	.quad	.L286
	.quad	.L205
	.word	16
	.word	2
	.word	3
	.word	5
	.align	8
	.quad	.L196
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L289
	.quad	.L201
	.word	32
	.word	3
	.word	0
	.word	3
	.word	5
	.align	8
	.quad	.L190
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L291
	.quad	.L195
	.word	32
	.word	3
	.word	0
	.word	3
	.word	5
	.align	8
	.quad	.L184
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L293
	.quad	.L189
	.word	32
	.word	3
	.word	0
	.word	3
	.word	5
	.align	8
	.quad	.L175
	.word	49
	.word	2
	.word	16
	.word	24
	.align	8
	.quad	.L295
	.quad	.L183
	.word	48
	.word	5
	.word	0
	.word	5
	.word	8
	.word	16
	.word	24
	.align	8
	.quad	.L174
	.word	49
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L296
	.quad	.L180
	.word	48
	.word	2
	.word	0
	.word	3
	.align	8
	.quad	.L168
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L297
	.quad	.L173
	.word	32
	.word	2
	.word	0
	.word	3
	.align	8
	.quad	.L167
	.word	16
	.word	2
	.word	3
	.word	5
	.align	8
	.quad	.L146
	.word	49
	.word	2
	.word	8
	.word	32
	.align	8
	.quad	.L299
	.quad	.L145
	.word	49
	.word	3
	.word	0
	.word	8
	.word	32
	.align	8
	.quad	.L300
	.quad	.L144
	.word	49
	.word	4
	.word	8
	.word	16
	.word	24
	.word	32
	.align	8
	.quad	.L301
	.quad	.L143
	.word	49
	.word	3
	.word	0
	.word	16
	.word	24
	.align	8
	.quad	.L302
	.quad	.L162
	.word	48
	.word	4
	.word	0
	.word	8
	.word	16
	.word	24
	.align	8
	.quad	.L142
	.word	49
	.word	3
	.word	8
	.word	16
	.word	24
	.align	8
	.quad	.L303
	.quad	.L159
	.word	48
	.word	3
	.word	8
	.word	16
	.word	24
	.align	8
	.quad	.L141
	.word	49
	.word	2
	.word	8
	.word	16
	.align	8
	.quad	.L304
	.quad	.L156
	.word	48
	.word	2
	.word	8
	.word	16
	.align	8
	.quad	.L140
	.word	49
	.word	1
	.word	8
	.align	8
	.quad	.L305
	.quad	.L153
	.word	48
	.word	1
	.word	8
	.align	8
	.quad	.L139
	.word	49
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L306
	.quad	.L133
	.word	33
	.word	2
	.word	0
	.word	8
	.align	8
	.quad	.L309
	.quad	.L138
	.word	32
	.word	4
	.word	0
	.word	3
	.word	5
	.word	7
	.align	8
	.quad	.L132
	.word	16
	.word	1
	.word	3
	.align	8
	.quad	.L116
	.word	65
	.word	2
	.word	8
	.word	16
	.align	8
	.quad	.L310
	.quad	.L126
	.word	64
	.word	2
	.word	8
	.word	16
	.align	8
	.quad	.L115
	.word	65
	.word	3
	.word	0
	.word	8
	.word	16
	.align	8
	.quad	.L312
	.quad	.L114
	.word	65
	.word	3
	.word	0
	.word	8
	.word	16
	.align	8
	.quad	.L313
	.quad	.L113
	.word	65
	.word	3
	.word	0
	.word	8
	.word	16
	.align	8
	.quad	.L314
	.quad	.L112
	.word	65
	.word	3
	.word	0
	.word	8
	.word	16
	.align	8
	.quad	.L315
	.quad	.L123
	.word	64
	.word	4
	.word	0
	.word	3
	.word	5
	.word	8
	.align	8
	.quad	.L118
	.word	65
	.word	0
	.align	8
	.quad	.L316
	.quad	.L111
	.word	16
	.word	0
	.align	8
	.quad	.L105
	.word	17
	.word	0
	.align	8
	.quad	.L318
	.quad	.L104
	.word	16
	.word	2
	.word	3
	.word	7
	.align	8
	.align	8
.L266:
	.long	(.L321 - .) + -2013265920
	.long	520224
	.quad	0
	.align	8
.L277:
	.long	(.L321 - .) + -402653184
	.long	454752
	.quad	0
	.align	8
.L285:
	.long	(.L321 - .) + 134217728
	.long	381425
	.quad	0
	.align	8
.L276:
	.long	(.L321 - .) + -1879048192
	.long	471296
	.quad	0
	.align	8
.L268:
	.long	(.L321 - .) + -805306368
	.long	516368
	.quad	0
	.align	8
.L302:
	.long	(.L321 - .) + 268435456
	.long	274529
	.quad	0
	.align	8
.L269:
	.long	(.L321 - .) + -872415232
	.long	516464
	.quad	0
	.align	8
.L296:
	.long	(.L321 - .) + 2013265920
	.long	401680
	.quad	0
	.align	8
.L288:
	.long	(.L321 - .) + 134217728
	.long	381681
	.quad	0
	.align	8
.L320:
	.long	(.L321 - .) + -2013265920
	.long	49408
	.quad	0
	.align	8
.L313:
	.long	(.L321 - .) + -1811939328
	.long	78304
	.quad	0
	.align	8
.L279:
	.long	(.L321 - .) + -1543503872
	.long	430176
	.quad	0
	.align	8
.L267:
	.long	(.L321 - .) + -2013265920
	.long	520496
	.quad	0
	.align	8
.L311:
	.long	(.L321 - .) + 603979776
	.long	69731
	.quad	0
	.align	8
.L292:
	.long	(.L321 - .) + 1677721600
	.long	352352
	.quad	0
	.align	8
.L317:
	.long	(.L321 - .) + -201326592
	.long	57696
	.quad	0
	.align	8
.L315:
	.long	(.L321 - .) + -1744830464
	.long	86512
	.quad	0
	.align	8
.L310:
	.long	(.L322 - .) + -1409286144
	.long	168304
	.quad	.L311
	.align	8
.L272:
	.long	(.L323 - .) + -1140850688
	.long	323984
	.quad	.L273
	.align	8
.L318:
	.long	(.L324 - .) + -2147483648
	.long	581984
	.quad	.L319
	.align	8
.L304:
	.long	(.L321 - .) + 268435456
	.long	258145
	.quad	0
	.align	8
.L284:
	.long	(.L322 - .) + -1409286144
	.long	168304
	.quad	.L285
	.align	8
.L307:
	.long	(.L325 - .) + -1409286144
	.long	360736
	.quad	.L308
	.align	8
.L293:
	.long	(.L322 - .) + -1409286144
	.long	168304
	.quad	.L294
	.align	8
.L274:
	.long	(.L322 - .) + -1409286144
	.long	168304
	.quad	.L275
	.align	8
.L275:
	.long	(.L321 - .) + -2080374784
	.long	458850
	.quad	0
	.align	8
.L270:
	.long	(.L321 - .) + -939524096
	.long	516704
	.quad	0
	.align	8
.L289:
	.long	(.L322 - .) + -1409286144
	.long	168304
	.quad	.L290
	.align	8
.L286:
	.long	(.L324 - .) + -2147483648
	.long	581984
	.quad	.L287
	.align	8
.L295:
	.long	(.L321 - .) + 1610612736
	.long	405546
	.quad	0
	.align	8
.L278:
	.long	(.L321 - .) + -2080374784
	.long	446560
	.quad	0
	.align	8
.L298:
	.long	(.L321 - .) + 1476395008
	.long	315424
	.quad	0
	.align	8
.L319:
	.long	(.L325 - .) + -1409286144
	.long	360736
	.quad	.L320
	.align	8
.L314:
	.long	(.L321 - .) + -1610612736
	.long	82448
	.quad	0
	.align	8
.L301:
	.long	(.L321 - .) + 335544320
	.long	283297
	.quad	0
	.align	8
.L290:
	.long	(.L321 - .) + 1677721600
	.long	356448
	.quad	0
	.align	8
.L287:
	.long	(.L325 - .) + -1409286144
	.long	360736
	.quad	.L288
	.align	8
.L299:
	.long	(.L321 - .) + 335544320
	.long	282689
	.quad	0
	.align	8
.L282:
	.long	(.L321 - .) + -1677721600
	.long	413840
	.quad	0
	.align	8
.L316:
	.long	(.L322 - .) + -1409286144
	.long	168304
	.quad	.L317
	.align	8
.L297:
	.long	(.L322 - .) + -1409286144
	.long	168304
	.quad	.L298
	.align	8
.L306:
	.long	(.L324 - .) + -2147483648
	.long	581984
	.quad	.L307
	.align	8
.L271:
	.long	(.L321 - .) + 1207959552
	.long	512032
	.quad	0
	.align	8
.L273:
	.long	(.L321 - .) + 2080374784
	.long	495872
	.quad	0
	.align	8
.L312:
	.long	(.L321 - .) + -1811939328
	.long	74208
	.quad	0
	.align	8
.L308:
	.long	(.L321 - .) + -1946157056
	.long	217392
	.quad	0
	.align	8
.L283:
	.long	(.L321 - .) + 1744830464
	.long	389184
	.quad	0
	.align	8
.L280:
	.long	(.L321 - .) + 1946157056
	.long	421984
	.quad	0
	.align	8
.L291:
	.long	(.L322 - .) + -1409286144
	.long	168304
	.quad	.L292
	.align	8
.L303:
	.long	(.L321 - .) + 268435456
	.long	266337
	.quad	0
	.align	8
.L305:
	.long	(.L321 - .) + 469762048
	.long	249953
	.quad	0
	.align	8
.L300:
	.long	(.L321 - .) + -1543503872
	.long	282912
	.quad	0
	.align	8
.L281:
	.long	(.L322 - .) + -1409286144
	.long	168304
	.quad	.L282
	.align	8
.L309:
	.long	(.L321 - .) + -469762048
	.long	208960
	.quad	0
	.align	8
.L294:
	.long	(.L321 - .) + 1677721600
	.long	348256
	.quad	0
.L322:
	.ascii	"src/deferred0.ml\0"
	.align	8
.L325:
	.ascii	"src/random.ml\0"
	.align	8
.L323:
	.ascii	"src/shutdown.ml\0"
	.align	8
.L321:
	.ascii	"async_floating_point.ml\0"
	.align	8
.L324:
	.ascii	"random.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits
