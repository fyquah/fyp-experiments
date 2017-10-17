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
	.globl	camlQuicksort__data_begin
camlQuicksort__data_begin:
	.text
	.globl	camlQuicksort__code_begin
camlQuicksort__code_begin:
	.data
	.quad	8960
	.globl	camlQuicksort
camlQuicksort:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.data
	.quad	3064
	.globl	camlQuicksort__Pmakeblock_472
camlQuicksort__Pmakeblock_472:
	.quad	1
	.quad	1
	.data
	.quad	1792
	.globl	camlQuicksort__Pccall_473
camlQuicksort__Pccall_473:
	.quad	1
	.data
	.quad	1792
	.globl	camlQuicksort__Pmakeblock_476
camlQuicksort__Pmakeblock_476:
	.quad	1
	.data
	.globl	camlQuicksort__gc_roots
camlQuicksort__gc_roots:
	.quad	camlQuicksort__Pmakeblock_476
	.quad	camlQuicksort__Pccall_473
	.quad	camlQuicksort__Pmakeblock_472
	.quad	camlQuicksort
	.quad	0
	.text
	.align	16
	.globl	camlQuicksort__qsort_25
camlQuicksort__qsort_25:
	.file	1	"quicksort.ml"
	.loc	1	3	14
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L110:
	movq	%rax, %r8
	cmpq	%rbx, %r8
	jge	.L102
	movq	%rdi, 16(%rsp)
	movq	%rbx, 8(%rsp)
	movq	%r8, %rdx
	movq	%rdx, (%rsp)
	movq	%rbx, %rsi
	.loc	1	7	16
	movq	-8(%rdi), %rax
	.loc	1	7	16
	shrq	$9, %rax
	.loc	1	7	16
	cmpq	%rbx, %rax
	jbe	.L111
	.loc	1	7	16
	movq	-4(%rdi,%rbx,4), %rcx
.L104:
	.loc	1	8	10
	cmpq	%rsi, %rdx
	setl	%al
	movzbq	%al, %rax
	.loc	1	8	10
	leaq	1(%rax,%rax), %rax
	cmpq	$1, %rax
	je	.L103
.L108:
	cmpq	%rbx, %rdx
	jge	.L106
	.loc	1	9	23
	movq	-8(%rdi), %rax
	.loc	1	9	23
	shrq	$9, %rax
	.loc	1	9	23
	cmpq	%rdx, %rax
	jbe	.L113
	.loc	1	9	23
	movq	-4(%rdi,%rdx,4), %rax
	.loc	1	9	23
	cmpq	%rcx, %rax
	setle	%al
	movzbq	%al, %rax
	.loc	1	9	23
	leaq	1(%rax,%rax), %rax
	cmpq	$1, %rax
	je	.L106
.L109:
	.loc	1	9	42
	addq	$2, %rdx
	movq	%rdx, (%rsp)
	jmp	.L108
	.align	4
.L106:
	cmpq	%r8, %rsi
	jle	.L105
	.loc	1	10	23
	movq	-8(%rdi), %rax
	.loc	1	10	23
	shrq	$9, %rax
	.loc	1	10	23
	cmpq	%rsi, %rax
	jbe	.L115
	.loc	1	10	23
	movq	-4(%rdi,%rsi,4), %rax
	.loc	1	10	23
	cmpq	%rcx, %rax
	setge	%al
	movzbq	%al, %rax
	.loc	1	10	23
	leaq	1(%rax,%rax), %rax
	cmpq	$1, %rax
	je	.L105
.L107:
	.loc	1	10	42
	addq	$-2, %rsi
	jmp	.L106
	.align	4
.L105:
	cmpq	%rsi, %rdx
	jge	.L104
	.loc	1	12	19
	movq	-8(%rdi), %r9
	.loc	1	12	19
	shrq	$9, %r9
	.loc	1	12	19
	cmpq	%rdx, %r9
	jbe	.L117
	.loc	1	12	19
	movq	-4(%rdi,%rdx,4), %rax
	.loc	1	12	39
	cmpq	%rsi, %r9
	jbe	.L119
	.loc	1	12	39
	movq	-4(%rdi,%rsi,4), %r9
	.loc	1	12	29
	movq	%r9, -4(%rdi,%rdx,4)
	.loc	1	12	47
	movq	-8(%rdi), %r9
	.loc	1	12	47
	shrq	$9, %r9
	.loc	1	12	47
	cmpq	%rsi, %r9
	jbe	.L121
	.loc	1	12	47
	movq	%rax, -4(%rdi,%rsi,4)
	jmp	.L104
	.align	4
.L103:
	.loc	1	15	15
	movq	-8(%rdi), %rax
	.loc	1	15	15
	shrq	$9, %rax
	.loc	1	15	15
	cmpq	%rdx, %rax
	jbe	.L123
	.loc	1	15	15
	movq	-4(%rdi,%rdx,4), %rsi
	.loc	1	15	35
	cmpq	%rbx, %rax
	jbe	.L125
	.loc	1	15	35
	movq	-4(%rdi,%rbx,4), %rax
	.loc	1	15	25
	movq	%rax, -4(%rdi,%rdx,4)
	.loc	1	15	43
	movq	-8(%rdi), %rax
	.loc	1	15	43
	shrq	$9, %rax
	.loc	1	15	43
	cmpq	%rbx, %rax
	jbe	.L127
	.loc	1	15	43
	movq	%rsi, -4(%rdi,%rbx,4)
	movq	%rdx, %rbx
	.loc	1	16	13
	addq	$-2, %rbx
	movq	%r8, %rax
	.loc	1	16	4
	call	camlQuicksort__qsort_25@PLT
.L100:
	movq	(%rsp), %rax
	.loc	1	17	10
	addq	$2, %rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rdi
	.loc	1	17	4
	jmp	.L110
	.align	4
.L102:
	movq	$1, %rax
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
.L127:
	call	caml_ml_array_bound_error@PLT
.L128:
.L125:
	call	caml_ml_array_bound_error@PLT
.L126:
.L123:
	call	caml_ml_array_bound_error@PLT
.L124:
.L121:
	call	caml_ml_array_bound_error@PLT
.L122:
.L119:
	call	caml_ml_array_bound_error@PLT
.L120:
.L117:
	call	caml_ml_array_bound_error@PLT
.L118:
.L115:
	call	caml_ml_array_bound_error@PLT
.L116:
.L113:
	call	caml_ml_array_bound_error@PLT
.L114:
.L111:
	call	caml_ml_array_bound_error@PLT
.L112:
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlQuicksort__qsort_25,@function
	.size camlQuicksort__qsort_25,. - camlQuicksort__qsort_25
	.text
	.align	16
	.globl	camlQuicksort__cmp_123
camlQuicksort__cmp_123:
	.loc	1	23	8
	.cfi_startproc
.L129:
	.loc	1	23	14
	subq	%rbx, %rax
	.loc	1	23	14
	incq	%rax
	ret
	.cfi_endproc
	.type camlQuicksort__cmp_123,@function
	.size camlQuicksort__cmp_123,. - camlQuicksort__cmp_123
	.text
	.align	16
	.globl	camlQuicksort__qsort2_130
camlQuicksort__qsort2_130:
	.loc	1	25	15
	.cfi_startproc
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
.L140:
	movq	%rax, %r8
	cmpq	%rbx, %r8
	jge	.L132
	movq	%rdi, 16(%rsp)
	movq	%rbx, 8(%rsp)
	movq	%r8, %rsi
	movq	%rsi, (%rsp)
	movq	%rbx, %rdx
	.loc	1	29	16
	movq	-8(%rdi), %rax
	.loc	1	29	16
	shrq	$9, %rax
	.loc	1	29	16
	cmpq	%rbx, %rax
	jbe	.L141
	.loc	1	29	16
	movq	-4(%rdi,%rbx,4), %rcx
.L134:
	.loc	1	30	10
	cmpq	%rdx, %rsi
	setl	%al
	movzbq	%al, %rax
	.loc	1	30	10
	leaq	1(%rax,%rax), %rax
	cmpq	$1, %rax
	je	.L133
.L138:
	cmpq	%rbx, %rsi
	jge	.L136
	.loc	1	31	27
	movq	-8(%rdi), %rax
	.loc	1	31	27
	shrq	$9, %rax
	.loc	1	31	27
	cmpq	%rsi, %rax
	jbe	.L143
	.loc	1	31	27
	movq	-4(%rdi,%rsi,4), %rax
	.loc	1	23	14
	subq	%rcx, %rax
	.loc	1	23	14
	incq	%rax
	.loc	1	31	23
	cmpq	$1, %rax
	setle	%al
	movzbq	%al, %rax
	.loc	1	31	23
	leaq	1(%rax,%rax), %rax
	cmpq	$1, %rax
	je	.L136
.L139:
	.loc	1	31	48
	addq	$2, %rsi
	movq	%rsi, (%rsp)
	jmp	.L138
	.align	4
.L136:
	cmpq	%r8, %rdx
	jle	.L135
	.loc	1	32	27
	movq	-8(%rdi), %rax
	.loc	1	32	27
	shrq	$9, %rax
	.loc	1	32	27
	cmpq	%rdx, %rax
	jbe	.L145
	.loc	1	32	27
	movq	-4(%rdi,%rdx,4), %rax
	.loc	1	23	14
	subq	%rcx, %rax
	.loc	1	23	14
	incq	%rax
	.loc	1	32	23
	cmpq	$1, %rax
	setge	%al
	movzbq	%al, %rax
	.loc	1	32	23
	leaq	1(%rax,%rax), %rax
	cmpq	$1, %rax
	je	.L135
.L137:
	.loc	1	32	48
	addq	$-2, %rdx
	jmp	.L136
	.align	4
.L135:
	cmpq	%rdx, %rsi
	jge	.L134
	.loc	1	34	19
	movq	-8(%rdi), %r9
	.loc	1	34	19
	shrq	$9, %r9
	.loc	1	34	19
	cmpq	%rsi, %r9
	jbe	.L147
	.loc	1	34	19
	movq	-4(%rdi,%rsi,4), %rax
	.loc	1	34	39
	cmpq	%rdx, %r9
	jbe	.L149
	.loc	1	34	39
	movq	-4(%rdi,%rdx,4), %r9
	.loc	1	34	29
	movq	%r9, -4(%rdi,%rsi,4)
	.loc	1	34	47
	movq	-8(%rdi), %r9
	.loc	1	34	47
	shrq	$9, %r9
	.loc	1	34	47
	cmpq	%rdx, %r9
	jbe	.L151
	.loc	1	34	47
	movq	%rax, -4(%rdi,%rdx,4)
	jmp	.L134
	.align	4
.L133:
	.loc	1	37	15
	movq	-8(%rdi), %rax
	.loc	1	37	15
	shrq	$9, %rax
	.loc	1	37	15
	cmpq	%rsi, %rax
	jbe	.L153
	.loc	1	37	15
	movq	-4(%rdi,%rsi,4), %rdx
	.loc	1	37	35
	cmpq	%rbx, %rax
	jbe	.L155
	.loc	1	37	35
	movq	-4(%rdi,%rbx,4), %rax
	.loc	1	37	25
	movq	%rax, -4(%rdi,%rsi,4)
	.loc	1	37	43
	movq	-8(%rdi), %rax
	.loc	1	37	43
	shrq	$9, %rax
	.loc	1	37	43
	cmpq	%rbx, %rax
	jbe	.L157
	.loc	1	37	43
	movq	%rdx, -4(%rdi,%rbx,4)
	movq	%rsi, %rbx
	.loc	1	38	14
	addq	$-2, %rbx
	movq	%r8, %rax
	.loc	1	38	4
	call	camlQuicksort__qsort2_130@PLT
.L130:
	movq	(%rsp), %rax
	.loc	1	39	11
	addq	$2, %rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %rdi
	.loc	1	39	4
	jmp	.L140
	.align	4
.L132:
	movq	$1, %rax
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
.L157:
	call	caml_ml_array_bound_error@PLT
.L158:
.L155:
	call	caml_ml_array_bound_error@PLT
.L156:
.L153:
	call	caml_ml_array_bound_error@PLT
.L154:
.L151:
	call	caml_ml_array_bound_error@PLT
.L152:
.L149:
	call	caml_ml_array_bound_error@PLT
.L150:
.L147:
	call	caml_ml_array_bound_error@PLT
.L148:
.L145:
	call	caml_ml_array_bound_error@PLT
.L146:
.L143:
	call	caml_ml_array_bound_error@PLT
.L144:
.L141:
	call	caml_ml_array_bound_error@PLT
.L142:
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlQuicksort__qsort2_130,@function
	.size camlQuicksort__qsort2_130,. - camlQuicksort__qsort2_130
	.text
	.align	16
	.globl	camlQuicksort__random_241
camlQuicksort__random_241:
	.loc	1	47	11
	.cfi_startproc
.L159:
	movq	camlQuicksort__Pmakeblock_476@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	.loc	1	48	10
	movq	(%rbx), %rdi
	.loc	1	48	10
	imulq	$25173, %rdi
	.loc	1	48	10
	addq	$9690, %rdi
	.loc	1	48	2
	movq	%rdi, (%rbx)
	movq	(%rax), %rax
	.loc	1	48	33
	movq	(%rax), %rax
	.loc	1	48	33
	andq	$8191, %rax
	ret
	.cfi_endproc
	.type camlQuicksort__random_241,@function
	.size camlQuicksort__random_241,. - camlQuicksort__random_241
	.text
	.align	16
	.globl	camlQuicksort__test_sort_273
camlQuicksort__test_sort_273:
	.loc	1	54	14
	.cfi_startproc
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
.L178:
	movq	%rax, (%rsp)
	movq	%rbx, 16(%rsp)
	movq	$1, %rsi
	movq	%rbx, %rdi
	.loc	1	55	10
	movq	caml_make_vect@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L160:
	movq	caml_young_ptr@GOTPCREL(%rip), %r11
	movq	(%r11), %r15
	movq	%rax, 24(%rsp)
	movq	$1, %rsi
	movq	$8193, %rdi
	.loc	1	56	14
	movq	caml_make_vect@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L161:
	movq	caml_young_ptr@GOTPCREL(%rip), %r11
	movq	(%r11), %r15
	movq	%rax, 8(%rsp)
	movq	$1, %rdi
	movq	16(%rsp), %rbx
	movq	%rbx, %rsi
	.loc	1	57	15
	addq	$-2, %rsi
	cmpq	%rsi, %rdi
	jg	.L176
.L177:
	movq	camlQuicksort__Pmakeblock_476@GOTPCREL(%rip), %rdx
	movq	(%rdx), %rcx
	.loc	1	48	10
	movq	(%rcx), %r8
	.loc	1	48	10
	imulq	$25173, %r8
	.loc	1	48	10
	addq	$9690, %r8
	.loc	1	48	2
	movq	%r8, (%rcx)
	movq	(%rdx), %rdx
	.loc	1	48	33
	movq	(%rdx), %rdx
	.loc	1	48	33
	andq	$8191, %rdx
	movq	24(%rsp), %r8
	.loc	1	58	25
	movq	-8(%r8), %rcx
	.loc	1	58	25
	shrq	$9, %rcx
	.loc	1	58	25
	cmpq	%rdi, %rcx
	jbe	.L179
	.loc	1	58	25
	movq	%rdx, -4(%r8,%rdi,4)
	.loc	1	58	50
	movq	-8(%rax), %rcx
	.loc	1	58	50
	shrq	$9, %rcx
	.loc	1	58	50
	cmpq	%rdx, %rcx
	jbe	.L181
	.loc	1	58	50
	movq	-4(%rax,%rdx,4), %rcx
	.loc	1	58	50
	addq	$2, %rcx
	.loc	1	58	37
	movq	%rcx, -4(%rax,%rdx,4)
	movq	%rdi, %rdx
	addq	$2, %rdi
	cmpq	%rsi, %rdx
	jne	.L177
.L176:
	.loc	1	60	13
	addq	$-2, %rbx
	movq	$1, %rax
	movq	24(%rsp), %rdi
	movq	(%rsp), %rsi
	.loc	1	60	2
	call	caml_apply3@PLT
.L162:
	call	.L174
	movq	camlQuicksort__Pmakeblock_472@GOTPCREL(%rip), %rbx
	cmpq	%rbx, %rax
	jne	.L175
	movq	camlQuicksort__string_324@GOTPCREL(%rip), %rbx
	movq	camlPervasives__Pccall_1634@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.file	2	"pervasives.ml"
	.loc	2	467	21
	call	camlPervasives__output_string_671@PLT
.L165:
	movq	$1, %rax
	.loc	1	72	27
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	jmp	camlPervasives__print_newline_1085@PLT
	.cfi_adjust_cfa_offset 40
	.align	4
.L175:
	call	caml_raise_exn@PLT
.L183:
	.align	4
.L174:
	.cfi_adjust_cfa_offset 8
	pushq	%r14
	.cfi_adjust_cfa_offset 8
	movq	%rsp, %r14
	movq	40(%rsp), %rbx
	.loc	1	62	28
	movq	-8(%rbx), %rax
	.loc	1	62	28
	cmpq	$1023, %rax
	jbe	.L184
	.loc	1	62	28
	movq	(%rbx), %rax
	movq	24(%rsp), %rdi
	.loc	1	62	21
	movq	-8(%rdi), %rsi
	.loc	1	62	21
	shrq	$9, %rsi
	.loc	1	62	21
	cmpq	%rax, %rsi
	jbe	.L186
	.loc	1	62	21
	movq	-4(%rdi,%rax,4), %rsi
	.loc	1	62	21
	addq	$-2, %rsi
	.loc	1	62	4
	movq	%rsi, -4(%rdi,%rax,4)
	movq	$3, %rax
	movq	32(%rsp), %rsi
	.loc	1	63	17
	addq	$-2, %rsi
	cmpq	%rsi, %rax
	jg	.L171
.L172:
	.loc	1	64	19
	movq	-8(%rbx), %rdx
	.loc	1	64	19
	shrq	$9, %rdx
	.loc	1	64	19
	cmpq	%rax, %rdx
	jbe	.L188
	.loc	1	64	19
	movq	-4(%rbx,%rax,4), %rcx
	movq	%rax, %r8
	.loc	1	64	12
	addq	$-2, %r8
	.loc	1	64	9
	cmpq	%r8, %rdx
	jbe	.L190
	.loc	1	64	9
	movq	-4(%rbx,%r8,4), %rdx
	cmpq	%rcx, %rdx
	jle	.L173
	movq	caml_backtrace_pos@GOTPCREL(%rip), %rax
	xorq	%rbx, %rbx
	.loc	1	64	30
	movl	%ebx, (%rax)
	movq	camlQuicksort__Pmakeblock_472@GOTPCREL(%rip), %rax
	.loc	1	64	30
	call	caml_raise_exn@PLT
.L192:
	.align	4
.L173:
	.loc	1	65	30
	movq	-8(%rbx), %rdx
	.loc	1	65	30
	shrq	$9, %rdx
	.loc	1	65	30
	cmpq	%rax, %rdx
	jbe	.L193
	.loc	1	65	30
	movq	-4(%rbx,%rax,4), %rdx
	.loc	1	65	23
	movq	-8(%rdi), %rcx
	.loc	1	65	23
	shrq	$9, %rcx
	.loc	1	65	23
	cmpq	%rdx, %rcx
	jbe	.L195
	.loc	1	65	23
	movq	-4(%rdi,%rdx,4), %rcx
	.loc	1	65	23
	addq	$-2, %rcx
	.loc	1	65	6
	movq	%rcx, -4(%rdi,%rdx,4)
	movq	%rax, %rdx
	addq	$2, %rax
	cmpq	%rsi, %rdx
	jne	.L172
.L171:
	movq	$1, %rax
	cmpq	$8191, %rax
	jg	.L168
.L169:
	.loc	1	68	9
	movq	-8(%rdi), %rbx
	.loc	1	68	9
	shrq	$9, %rbx
	.loc	1	68	9
	cmpq	%rax, %rbx
	jbe	.L197
	.loc	1	68	9
	movq	-4(%rdi,%rax,4), %rbx
	cmpq	$1, %rbx
	je	.L170
	movq	caml_backtrace_pos@GOTPCREL(%rip), %rax
	xorq	%rbx, %rbx
	.loc	1	68	29
	movl	%ebx, (%rax)
	movq	camlQuicksort__Pmakeblock_472@GOTPCREL(%rip), %rax
	.loc	1	68	29
	call	caml_raise_exn@PLT
.L199:
	.align	4
.L170:
	movq	%rax, %rbx
	addq	$2, %rax
	cmpq	$8191, %rbx
	jne	.L169
.L168:
	movq	camlQuicksort__string_402@GOTPCREL(%rip), %rbx
	movq	camlPervasives__Pccall_1634@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	.loc	2	467	21
	call	camlPervasives__output_string_671@PLT
.L163:
	movq	$1, %rax
	.loc	1	70	24
	call	camlPervasives__print_newline_1085@PLT
.L164:
	popq	%r14
	.cfi_adjust_cfa_offset -8
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
.L167:
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
.L197:
	call	caml_ml_array_bound_error@PLT
.L198:
.L195:
	call	caml_ml_array_bound_error@PLT
.L196:
.L193:
	call	caml_ml_array_bound_error@PLT
.L194:
.L190:
	call	caml_ml_array_bound_error@PLT
.L191:
.L188:
	call	caml_ml_array_bound_error@PLT
.L189:
.L186:
	call	caml_ml_array_bound_error@PLT
.L187:
.L184:
	call	caml_ml_array_bound_error@PLT
.L185:
.L181:
	call	caml_ml_array_bound_error@PLT
.L182:
.L179:
	call	caml_ml_array_bound_error@PLT
.L180:
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlQuicksort__test_sort_273,@function
	.size camlQuicksort__test_sort_273,. - camlQuicksort__test_sort_273
	.text
	.align	16
	.globl	camlQuicksort__main_417
camlQuicksort__main_417:
	.loc	1	75	9
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L204:
	movq	$3, %rax
	cmpq	$201, %rax
	jg	.L202
	movq	%rax, (%rsp)
.L203:
	movq	$100001, %rbx
	movq	camlQuicksort__qsort_25_closure@GOTPCREL(%rip), %rax
	.loc	1	77	4
	call	camlQuicksort__test_sort_273@PLT
.L200:
	movq	$100001, %rbx
	movq	camlQuicksort__qsort2_130_closure@GOTPCREL(%rip), %rax
	.loc	1	78	4
	call	camlQuicksort__test_sort_273@PLT
.L201:
	movq	(%rsp), %rbx
	movq	%rbx, %rax
	addq	$2, %rbx
	movq	%rbx, (%rsp)
	cmpq	$201, %rax
	jne	.L203
.L202:
	movq	$1, %rax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlQuicksort__main_417,@function
	.size camlQuicksort__main_417,. - camlQuicksort__main_417
	.data
	.quad	3063
	.globl	camlQuicksort__random_set_of_closures_605
camlQuicksort__random_set_of_closures_605:
	.globl	camlQuicksort__random_241_closure
camlQuicksort__random_241_closure:
	.quad	camlQuicksort__random_241
	.quad	3
	.data
	.quad	4087
	.globl	camlQuicksort__qsort_1204_448
camlQuicksort__qsort_1204_448:
	.globl	camlQuicksort__qsort_25_closure
camlQuicksort__qsort_25_closure:
	.quad	caml_curry3
	.quad	7
	.quad	camlQuicksort__qsort_25
	.data
	.quad	3063
	.globl	camlQuicksort__main_set_of_closures_607
camlQuicksort__main_set_of_closures_607:
	.globl	camlQuicksort__main_417_closure
camlQuicksort__main_417_closure:
	.quad	camlQuicksort__main_417
	.quad	3
	.data
	.quad	4087
	.globl	camlQuicksort__qsort2_1216_450
camlQuicksort__qsort2_1216_450:
	.globl	camlQuicksort__qsort2_130_closure
camlQuicksort__qsort2_130_closure:
	.quad	caml_curry3
	.quad	7
	.quad	camlQuicksort__qsort2_130
	.data
	.quad	4087
	.globl	camlQuicksort__cmp_set_of_closures_449
camlQuicksort__cmp_set_of_closures_449:
	.globl	camlQuicksort__cmp_123_closure
camlQuicksort__cmp_123_closure:
	.quad	caml_curry2
	.quad	5
	.quad	camlQuicksort__cmp_123
	.data
	.quad	4087
	.globl	camlQuicksort__test_sort_set_of_closures_606
camlQuicksort__test_sort_set_of_closures_606:
	.globl	camlQuicksort__test_sort_273_closure
camlQuicksort__test_sort_273_closure:
	.quad	caml_curry2
	.quad	5
	.quad	camlQuicksort__test_sort_273
	.data
	.data
	.data
	.quad	2044
	.globl	camlQuicksort__string_324
camlQuicksort__string_324:
	.ascii	"failed"
	.space	1
	.byte	1
	.data
	.quad	4092
	.globl	camlQuicksort__string_264
camlQuicksort__string_264:
	.ascii	"Quicksort.Failed"
	.space	7
	.byte	7
	.data
	.data
	.data
	.data
	.data
	.quad	2044
	.globl	camlQuicksort__string_402
camlQuicksort__string_402:
	.ascii	"OK"
	.space	5
	.byte	5
	.text
	.align	16
	.globl	camlQuicksort__entry
camlQuicksort__entry:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
.L211:
	.loc	1	45	11
	call	caml_alloc1@PLT
.L212:
	leaq	8(%r15), %rax
	movq	$1024, -8(%rax)
	movq	$1, (%rax)
	movq	camlQuicksort__Pmakeblock_476@GOTPCREL(%rip), %rbx
	movq	%rax, (%rbx)
	movq	$1, %rdi
	.loc	1	52	0
	call	caml_fresh_oo_id@PLT
	movq	camlQuicksort__Pccall_473@GOTPCREL(%rip), %rbx
	movq	%rax, (%rbx)
	movq	camlQuicksort__Pmakeblock_472@GOTPCREL(%rip), %rax
	movq	(%rbx), %rbx
	movq	%rbx, 8(%rax)
	movq	camlQuicksort__string_264@GOTPCREL(%rip), %rbx
	movq	%rbx, (%rax)
	movq	$3, %rax
	cmpq	$201, %rax
	jg	.L209
	movq	%rax, (%rsp)
.L210:
	movq	$100001, %rbx
	movq	camlQuicksort__qsort_25_closure@GOTPCREL(%rip), %rax
	.loc	1	77	4
	call	camlQuicksort__test_sort_273@PLT
.L206:
	movq	$100001, %rbx
	movq	camlQuicksort__qsort2_130_closure@GOTPCREL(%rip), %rax
	.loc	1	78	4
	call	camlQuicksort__test_sort_273@PLT
.L207:
	movq	(%rsp), %rbx
	movq	%rbx, %rax
	addq	$2, %rbx
	movq	%rbx, (%rsp)
	cmpq	$201, %rax
	jne	.L210
.L209:
	movq	$1, %rax
	.loc	1	81	16
	call	camlPervasives__exit_1294@PLT
.L208:
	movq	camlQuicksort@GOTPCREL(%rip), %rax
	movq	camlQuicksort__main_417_closure@GOTPCREL(%rip), %rbx
	movq	%rbx, 56(%rax)
	movq	camlQuicksort__test_sort_273_closure@GOTPCREL(%rip), %rbx
	movq	%rbx, 48(%rax)
	movq	camlQuicksort__Pmakeblock_472@GOTPCREL(%rip), %rbx
	movq	%rbx, 40(%rax)
	movq	camlQuicksort__random_241_closure@GOTPCREL(%rip), %rbx
	movq	%rbx, 32(%rax)
	movq	camlQuicksort__Pmakeblock_476@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rbx
	movq	%rbx, 24(%rax)
	movq	camlQuicksort__qsort2_130_closure@GOTPCREL(%rip), %rbx
	movq	%rbx, 16(%rax)
	movq	camlQuicksort__cmp_123_closure@GOTPCREL(%rip), %rbx
	movq	%rbx, 8(%rax)
	movq	camlQuicksort__qsort_25_closure@GOTPCREL(%rip), %rbx
	movq	%rbx, (%rax)
	movq	$1, %rax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlQuicksort__entry,@function
	.size camlQuicksort__entry,. - camlQuicksort__entry
	.data
	.text
	.globl	camlQuicksort__code_end
camlQuicksort__code_end:
	.data
				/* relocation table start */
	.align	8
				/* relocation table end */
	.data
	.globl	camlQuicksort__data_end
camlQuicksort__data_end:
	.long	0
	.globl	camlQuicksort__frametable
camlQuicksort__frametable:
	.quad	44
	.quad	.L208
	.word	17
	.word	0
	.align	8
	.quad	.L213
	.quad	.L207
	.word	17
	.word	0
	.align	8
	.quad	.L214
	.quad	.L206
	.word	17
	.word	0
	.align	8
	.quad	.L216
	.quad	.L212
	.word	16
	.word	0
	.align	8
	.quad	.L201
	.word	17
	.word	0
	.align	8
	.quad	.L217
	.quad	.L200
	.word	17
	.word	0
	.align	8
	.quad	.L218
	.quad	.L164
	.word	65
	.word	0
	.align	8
	.quad	.L219
	.quad	.L163
	.word	65
	.word	0
	.align	8
	.quad	.L220
	.quad	.L199
	.word	65
	.word	0
	.align	8
	.quad	.L222
	.quad	.L198
	.word	65
	.word	0
	.align	8
	.quad	.L223
	.quad	.L196
	.word	65
	.word	0
	.align	8
	.quad	.L224
	.quad	.L194
	.word	65
	.word	0
	.align	8
	.quad	.L225
	.quad	.L192
	.word	65
	.word	0
	.align	8
	.quad	.L226
	.quad	.L191
	.word	65
	.word	0
	.align	8
	.quad	.L227
	.quad	.L189
	.word	65
	.word	0
	.align	8
	.quad	.L228
	.quad	.L187
	.word	65
	.word	0
	.align	8
	.quad	.L229
	.quad	.L185
	.word	65
	.word	0
	.align	8
	.quad	.L230
	.quad	.L183
	.word	48
	.word	0
	.align	8
	.quad	.L165
	.word	49
	.word	0
	.align	8
	.quad	.L231
	.quad	.L162
	.word	49
	.word	3
	.word	8
	.word	16
	.word	24
	.align	8
	.quad	.L233
	.quad	.L182
	.word	49
	.word	0
	.align	8
	.quad	.L234
	.quad	.L180
	.word	49
	.word	0
	.align	8
	.quad	.L235
	.quad	.L161
	.word	49
	.word	3
	.word	0
	.word	16
	.word	24
	.align	8
	.quad	.L236
	.quad	.L160
	.word	49
	.word	2
	.word	0
	.word	16
	.align	8
	.quad	.L237
	.quad	.L130
	.word	33
	.word	3
	.word	0
	.word	8
	.word	16
	.align	8
	.quad	.L238
	.quad	.L158
	.word	33
	.word	0
	.align	8
	.quad	.L239
	.quad	.L156
	.word	33
	.word	0
	.align	8
	.quad	.L240
	.quad	.L154
	.word	33
	.word	0
	.align	8
	.quad	.L241
	.quad	.L152
	.word	33
	.word	0
	.align	8
	.quad	.L242
	.quad	.L150
	.word	33
	.word	0
	.align	8
	.quad	.L243
	.quad	.L148
	.word	33
	.word	0
	.align	8
	.quad	.L244
	.quad	.L146
	.word	33
	.word	0
	.align	8
	.quad	.L245
	.quad	.L144
	.word	33
	.word	0
	.align	8
	.quad	.L246
	.quad	.L142
	.word	33
	.word	0
	.align	8
	.quad	.L247
	.quad	.L100
	.word	33
	.word	3
	.word	0
	.word	8
	.word	16
	.align	8
	.quad	.L248
	.quad	.L128
	.word	33
	.word	0
	.align	8
	.quad	.L249
	.quad	.L126
	.word	33
	.word	0
	.align	8
	.quad	.L250
	.quad	.L124
	.word	33
	.word	0
	.align	8
	.quad	.L251
	.quad	.L122
	.word	33
	.word	0
	.align	8
	.quad	.L252
	.quad	.L120
	.word	33
	.word	0
	.align	8
	.quad	.L253
	.quad	.L118
	.word	33
	.word	0
	.align	8
	.quad	.L254
	.quad	.L116
	.word	33
	.word	0
	.align	8
	.quad	.L255
	.quad	.L114
	.word	33
	.word	0
	.align	8
	.quad	.L256
	.quad	.L112
	.word	33
	.word	0
	.align	8
	.quad	.L257
	.align	8
.L235:
	.long	(.L258 - .) + -1946157056
	.long	237968
	.quad	0
	.align	8
.L255:
	.long	(.L258 - .) + 1946157056
	.long	41328
	.quad	0
	.align	8
.L248:
	.long	(.L258 - .) + 1409286144
	.long	65600
	.quad	0
	.align	8
.L234:
	.long	(.L258 - .) + -335544320
	.long	238368
	.quad	0
	.align	8
.L230:
	.long	(.L258 - .) + -2080374784
	.long	254400
	.quad	0
	.align	8
.L214:
	.long	(.L258 - .) + 1744830464
	.long	319552
	.quad	.L215
	.align	8
.L221:
	.long	(.L258 - .) + 1409286144
	.long	286784
	.quad	0
	.align	8
.L251:
	.long	(.L258 - .) + 1409286144
	.long	61680
	.quad	0
	.align	8
.L249:
	.long	(.L258 - .) + -469762048
	.long	62128
	.quad	0
	.align	8
.L232:
	.long	(.L258 - .) + 1677721600
	.long	294976
	.quad	0
	.align	8
.L220:
	.long	(.L259 - .) + -1409286144
	.long	1913168
	.quad	.L221
	.align	8
.L233:
	.long	(.L258 - .) + 1543503872
	.long	245792
	.quad	0
	.align	8
.L254:
	.long	(.L258 - .) + 1677721600
	.long	49456
	.quad	0
	.align	8
.L222:
	.long	(.L258 - .) + -1543503871
	.long	278992
	.quad	0
	.align	8
.L219:
	.long	(.L258 - .) + -1677721600
	.long	287104
	.quad	0
	.align	8
.L256:
	.long	(.L258 - .) + 1946157056
	.long	37232
	.quad	0
	.align	8
.L246:
	.long	(.L258 - .) + -2080374784
	.long	127408
	.quad	0
	.align	8
.L236:
	.long	(.L258 - .) + 2080374784
	.long	229600
	.quad	0
	.align	8
.L239:
	.long	(.L258 - .) + -469762048
	.long	152240
	.quad	0
	.align	8
.L223:
	.long	(.L258 - .) + 1207959552
	.long	278672
	.quad	0
	.align	8
.L240:
	.long	(.L258 - .) + -1543503872
	.long	152112
	.quad	0
	.align	8
.L227:
	.long	(.L258 - .) + 1073741824
	.long	262288
	.quad	0
	.align	8
.L218:
	.long	(.L258 - .) + 1677721600
	.long	315456
	.quad	0
	.align	8
.L245:
	.long	(.L258 - .) + -2080374784
	.long	131504
	.quad	0
	.align	8
.L225:
	.long	(.L258 - .) + -1946157056
	.long	266720
	.quad	0
	.align	8
.L247:
	.long	(.L258 - .) + 1476395008
	.long	119040
	.quad	0
	.align	8
.L243:
	.long	(.L258 - .) + -1275068416
	.long	139888
	.quad	0
	.align	8
.L241:
	.long	(.L258 - .) + 1409286144
	.long	151792
	.quad	0
	.align	8
.L229:
	.long	(.L258 - .) + -2013265920
	.long	254288
	.quad	0
	.align	8
.L217:
	.long	(.L258 - .) + 1744830464
	.long	319552
	.quad	0
	.align	8
.L244:
	.long	(.L258 - .) + 1677721600
	.long	139568
	.quad	0
	.align	8
.L216:
	.long	(.L258 - .) + 1677721600
	.long	315456
	.quad	.L215
	.align	8
.L215:
	.long	(.L258 - .) + 939524096
	.long	331904
	.quad	0
	.align	8
.L237:
	.long	(.L258 - .) + 1811939328
	.long	225440
	.quad	0
	.align	8
.L238:
	.long	(.L258 - .) + 1476395008
	.long	155712
	.quad	0
	.align	8
.L224:
	.long	(.L258 - .) + -1879048192
	.long	266608
	.quad	0
	.align	8
.L231:
	.long	(.L259 - .) + -1409286144
	.long	1913168
	.quad	.L232
	.align	8
.L257:
	.long	(.L258 - .) + 1476395008
	.long	28928
	.quad	0
	.align	8
.L252:
	.long	(.L258 - .) + -201326592
	.long	49904
	.quad	0
	.align	8
.L250:
	.long	(.L258 - .) + -1543503872
	.long	62000
	.quad	0
	.align	8
.L226:
	.long	(.L258 - .) + -1476395007
	.long	262624
	.quad	0
	.align	8
.L242:
	.long	(.L258 - .) + -201326592
	.long	140016
	.quad	0
	.align	8
.L228:
	.long	(.L258 - .) + 1610612736
	.long	262448
	.quad	0
	.align	8
.L213:
	.long	(.L258 - .) + 1476395008
	.long	332032
	.quad	0
	.align	8
.L253:
	.long	(.L258 - .) + -1275068416
	.long	49776
	.quad	0
.L259:
	.ascii	"pervasives.ml\0"
	.align	8
.L258:
	.ascii	"quicksort.ml\0"
	.align	8
	.section .note.GNU-stack,"",%progbits
