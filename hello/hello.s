	.text
	.def	 sprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,sprintf
	.globl	sprintf
	.align	16, 0x90
sprintf:                                # @sprintf
.Ltmp0:
.seh_proc sprintf
# BB#0:                                 # %entry
	subq	$72, %rsp
.Ltmp1:
	.seh_stackalloc 72
.Ltmp2:
	.seh_endprologue
	movq	%r9, 104(%rsp)
	movq	%r8, 96(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%rcx, 56(%rsp)
	leaq	96(%rsp), %r9
	movq	%r9, 40(%rsp)
	movq	64(%rsp), %rdx
	movq	56(%rsp), %rcx
	xorl	%r8d, %r8d
	callq	_vsprintf_l
	movl	%eax, 52(%rsp)
	addq	$72, %rsp
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,sprintf
.Ltmp3:
	.seh_endproc

	.def	 vsprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,vsprintf
	.globl	vsprintf
	.align	16, 0x90
vsprintf:                               # @vsprintf
.Ltmp4:
.seh_proc vsprintf
# BB#0:                                 # %entry
	subq	$72, %rsp
.Ltmp5:
	.seh_stackalloc 72
.Ltmp6:
	.seh_endprologue
	movq	%r8, 64(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rcx, 48(%rsp)
	movq	64(%rsp), %rax
	movq	56(%rsp), %r8
	movq	%rax, 32(%rsp)
	movq	$-1, %rdx
	xorl	%r9d, %r9d
	callq	_vsnprintf_l
	nop
	addq	$72, %rsp
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,vsprintf
.Ltmp7:
	.seh_endproc

	.def	 _snprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_snprintf
	.globl	_snprintf
	.align	16, 0x90
_snprintf:                              # @_snprintf
.Ltmp8:
.seh_proc _snprintf
# BB#0:                                 # %entry
	subq	$72, %rsp
.Ltmp9:
	.seh_stackalloc 72
.Ltmp10:
	.seh_endprologue
	movq	%r9, 104(%rsp)
	movq	%r8, 64(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rcx, 48(%rsp)
	leaq	104(%rsp), %r9
	movq	%r9, 32(%rsp)
	movq	64(%rsp), %r8
	movq	56(%rsp), %rdx
	movq	48(%rsp), %rcx
	callq	_vsnprintf
	movl	%eax, 44(%rsp)
	addq	$72, %rsp
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,_snprintf
.Ltmp11:
	.seh_endproc

	.def	 _vsnprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_vsnprintf
	.globl	_vsnprintf
	.align	16, 0x90
_vsnprintf:                             # @_vsnprintf
.Ltmp12:
.seh_proc _vsnprintf
# BB#0:                                 # %entry
	subq	$72, %rsp
.Ltmp13:
	.seh_stackalloc 72
.Ltmp14:
	.seh_endprologue
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 40(%rsp)
	movq	64(%rsp), %rax
	movq	56(%rsp), %r8
	movq	48(%rsp), %rdx
	movq	%rax, 32(%rsp)
	xorl	%r9d, %r9d
	callq	_vsnprintf_l
	nop
	addq	$72, %rsp
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,_vsnprintf
.Ltmp15:
	.seh_endproc

	.def	 main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	main
	.align	16, 0x90
main:                                   # @main
.Ltmp16:
.seh_proc main
# BB#0:                                 # %entry
	subq	$40, %rsp
.Ltmp17:
	.seh_stackalloc 40
.Ltmp18:
	.seh_endprologue
	movl	$0, 36(%rsp)
	leaq	"??_C@_0N@GIINEEDM@hello?5world?6?$AA@"(%rip), %rcx
	callq	printf
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
	.seh_handlerdata
	.text
.Ltmp19:
	.seh_endproc

	.def	 printf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,printf
	.globl	printf
	.align	16, 0x90
printf:                                 # @printf
.Ltmp20:
.seh_proc printf
# BB#0:                                 # %entry
	pushq	%rsi
.Ltmp21:
	.seh_pushreg 6
	pushq	%rdi
.Ltmp22:
	.seh_pushreg 7
	subq	$56, %rsp
.Ltmp23:
	.seh_stackalloc 56
.Ltmp24:
	.seh_endprologue
	movq	%r9, 104(%rsp)
	movq	%r8, 96(%rsp)
	movq	%rdx, 88(%rsp)
	movq	%rcx, 48(%rsp)
	leaq	88(%rsp), %rsi
	movq	%rsi, 32(%rsp)
	movq	48(%rsp), %rdi
	movl	$1, %ecx
	callq	__acrt_iob_func
	xorl	%r8d, %r8d
	movq	%rax, %rcx
	movq	%rdi, %rdx
	movq	%rsi, %r9
	callq	_vfprintf_l
	movl	%eax, 44(%rsp)
	addq	$56, %rsp
	popq	%rdi
	popq	%rsi
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,printf
.Ltmp25:
	.seh_endproc

	.def	 _vsprintf_l;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_vsprintf_l
	.globl	_vsprintf_l
	.align	16, 0x90
_vsprintf_l:                            # @_vsprintf_l
.Ltmp26:
.seh_proc _vsprintf_l
# BB#0:                                 # %entry
	subq	$72, %rsp
.Ltmp27:
	.seh_stackalloc 72
.Ltmp28:
	.seh_endprologue
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 40(%rsp)
	movq	64(%rsp), %rax
	movq	56(%rsp), %r9
	movq	48(%rsp), %r8
	movq	%rax, 32(%rsp)
	movq	$-1, %rdx
	callq	_vsnprintf_l
	nop
	addq	$72, %rsp
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,_vsprintf_l
.Ltmp29:
	.seh_endproc

	.def	 _vsnprintf_l;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_vsnprintf_l
	.globl	_vsnprintf_l
	.align	16, 0x90
_vsnprintf_l:                           # @_vsnprintf_l
.Ltmp30:
.seh_proc _vsnprintf_l
# BB#0:                                 # %entry
	pushq	%r15
.Ltmp31:
	.seh_pushreg 15
	pushq	%r14
.Ltmp32:
	.seh_pushreg 14
	pushq	%rsi
.Ltmp33:
	.seh_pushreg 6
	pushq	%rdi
.Ltmp34:
	.seh_pushreg 7
	pushq	%rbx
.Ltmp35:
	.seh_pushreg 3
	subq	$96, %rsp
.Ltmp36:
	.seh_stackalloc 96
.Ltmp37:
	.seh_endprologue
	movq	%rcx, %rsi
	movq	176(%rsp), %rax
	movq	%rax, 88(%rsp)
	movq	%r9, 80(%rsp)
	movq	%r8, 72(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%rsi, 56(%rsp)
	movq	88(%rsp), %rdi
	movq	80(%rsp), %rbx
	movq	72(%rsp), %r14
	movq	64(%rsp), %r15
	callq	__local_stdio_printf_options
	movq	(%rax), %rcx
	orq	$1, %rcx
	movq	%rdi, 40(%rsp)
	movq	%rbx, 32(%rsp)
	movq	%rsi, %rdx
	movq	%r15, %r8
	movq	%r14, %r9
	callq	__stdio_common_vsprintf
	movl	%eax, %ecx
	movl	%ecx, 52(%rsp)
	movl	$-1, %eax
	testl	%ecx, %ecx
	js	.LBB7_2
# BB#1:                                 # %cond.false
	movl	52(%rsp), %eax
.LBB7_2:                                # %cond.end
	addq	$96, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	popq	%r15
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,_vsnprintf_l
.Ltmp38:
	.seh_endproc

	.def	 __local_stdio_printf_options;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,__local_stdio_printf_options
	.globl	__local_stdio_printf_options
	.align	16, 0x90
__local_stdio_printf_options:           # @__local_stdio_printf_options
.Ltmp39:
.seh_proc __local_stdio_printf_options
# BB#0:                                 # %entry
.Ltmp40:
	.seh_endprologue
	leaq	__local_stdio_printf_options._OptionsStorage(%rip), %rax
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,__local_stdio_printf_options
.Ltmp41:
	.seh_endproc

	.def	 _vfprintf_l;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_vfprintf_l
	.globl	_vfprintf_l
	.align	16, 0x90
_vfprintf_l:                            # @_vfprintf_l
.Ltmp42:
.seh_proc _vfprintf_l
# BB#0:                                 # %entry
	pushq	%r14
.Ltmp43:
	.seh_pushreg 14
	pushq	%rsi
.Ltmp44:
	.seh_pushreg 6
	pushq	%rdi
.Ltmp45:
	.seh_pushreg 7
	pushq	%rbx
.Ltmp46:
	.seh_pushreg 3
	subq	$72, %rsp
.Ltmp47:
	.seh_stackalloc 72
.Ltmp48:
	.seh_endprologue
	movq	%rcx, %rsi
	movq	%r9, 64(%rsp)
	movq	%r8, 56(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rsi, 40(%rsp)
	movq	64(%rsp), %rdi
	movq	56(%rsp), %r14
	movq	48(%rsp), %rbx
	callq	__local_stdio_printf_options
	movq	(%rax), %rcx
	movq	%rdi, 32(%rsp)
	movq	%rsi, %rdx
	movq	%rbx, %r8
	movq	%r14, %r9
	callq	__stdio_common_vfprintf
	nop
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r14
	retq
	.seh_handlerdata
	.section	.text,"xr",discard,_vfprintf_l
.Ltmp49:
	.seh_endproc

	.section	.rdata,"dr",discard,"??_C@_0N@GIINEEDM@hello?5world?6?$AA@"
	.globl	"??_C@_0N@GIINEEDM@hello?5world?6?$AA@" # @"\01??_C@_0N@GIINEEDM@hello?5world?6?$AA@"
"??_C@_0N@GIINEEDM@hello?5world?6?$AA@":
	.asciz	"hello world\n"

	.lcomm	__local_stdio_printf_options._OptionsStorage,8,8 # @__local_stdio_printf_options._OptionsStorage

