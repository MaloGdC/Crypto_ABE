.text	


.globl	sha256_block_data_order
.def	sha256_block_data_order;	.scl 2;	.type 32;	.endef
.p2align	4
sha256_block_data_order:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_sha256_block_data_order:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx


	leaq	OPENSSL_ia32cap_P(%rip),%r11
	movl	0(%r11),%r9d
	movl	4(%r11),%r10d
	movl	8(%r11),%r11d
	testl	$536870912,%r11d
	jnz	_shaext_shortcut
	andl	$296,%r11d
	cmpl	$296,%r11d
	je	.Lavx2_shortcut
	andl	$1073741824,%r9d
	andl	$268435968,%r10d
	orl	%r9d,%r10d
	cmpl	$1342177792,%r10d
	je	.Lavx_shortcut
	testl	$512,%r10d
	jnz	.Lssse3_shortcut
	movq	%rsp,%rax

	pushq	%rbx

	pushq	%rbp

	pushq	%r12

	pushq	%r13

	pushq	%r14

	pushq	%r15

	shlq	$4,%rdx
	subq	$64+32,%rsp
	leaq	(%rsi,%rdx,4),%rdx
	andq	$-64,%rsp
	movq	%rdi,64+0(%rsp)
	movq	%rsi,64+8(%rsp)
	movq	%rdx,64+16(%rsp)
	movq	%rax,88(%rsp)

.Lprologue:

	movl	0(%rdi),%eax
	movl	4(%rdi),%ebx
	movl	8(%rdi),%ecx
	movl	12(%rdi),%edx
	movl	16(%rdi),%r8d
	movl	20(%rdi),%r9d
	movl	24(%rdi),%r10d
	movl	28(%rdi),%r11d
	jmp	.Lloop

.p2align	4
.Lloop:
	movl	%ebx,%edi
	leaq	K256(%rip),%rbp
	xorl	%ecx,%edi
	movl	0(%rsi),%r12d
	movl	%r8d,%r13d
	movl	%eax,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r9d,%r15d

	xorl	%r8d,%r13d
	rorl	$9,%r14d
	xorl	%r10d,%r15d

	movl	%r12d,0(%rsp)
	xorl	%eax,%r14d
	andl	%r8d,%r15d

	rorl	$5,%r13d
	addl	%r11d,%r12d
	xorl	%r10d,%r15d

	rorl	$11,%r14d
	xorl	%r8d,%r13d
	addl	%r15d,%r12d

	movl	%eax,%r15d
	addl	(%rbp),%r12d
	xorl	%eax,%r14d

	xorl	%ebx,%r15d
	rorl	$6,%r13d
	movl	%ebx,%r11d

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%r11d
	addl	%r12d,%edx
	addl	%r12d,%r11d

	leaq	4(%rbp),%rbp
	addl	%r14d,%r11d
	movl	4(%rsi),%r12d
	movl	%edx,%r13d
	movl	%r11d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r8d,%edi

	xorl	%edx,%r13d
	rorl	$9,%r14d
	xorl	%r9d,%edi

	movl	%r12d,4(%rsp)
	xorl	%r11d,%r14d
	andl	%edx,%edi

	rorl	$5,%r13d
	addl	%r10d,%r12d
	xorl	%r9d,%edi

	rorl	$11,%r14d
	xorl	%edx,%r13d
	addl	%edi,%r12d

	movl	%r11d,%edi
	addl	(%rbp),%r12d
	xorl	%r11d,%r14d

	xorl	%eax,%edi
	rorl	$6,%r13d
	movl	%eax,%r10d

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%r10d
	addl	%r12d,%ecx
	addl	%r12d,%r10d

	leaq	4(%rbp),%rbp
	addl	%r14d,%r10d
	movl	8(%rsi),%r12d
	movl	%ecx,%r13d
	movl	%r10d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%edx,%r15d

	xorl	%ecx,%r13d
	rorl	$9,%r14d
	xorl	%r8d,%r15d

	movl	%r12d,8(%rsp)
	xorl	%r10d,%r14d
	andl	%ecx,%r15d

	rorl	$5,%r13d
	addl	%r9d,%r12d
	xorl	%r8d,%r15d

	rorl	$11,%r14d
	xorl	%ecx,%r13d
	addl	%r15d,%r12d

	movl	%r10d,%r15d
	addl	(%rbp),%r12d
	xorl	%r10d,%r14d

	xorl	%r11d,%r15d
	rorl	$6,%r13d
	movl	%r11d,%r9d

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%r9d
	addl	%r12d,%ebx
	addl	%r12d,%r9d

	leaq	4(%rbp),%rbp
	addl	%r14d,%r9d
	movl	12(%rsi),%r12d
	movl	%ebx,%r13d
	movl	%r9d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%ecx,%edi

	xorl	%ebx,%r13d
	rorl	$9,%r14d
	xorl	%edx,%edi

	movl	%r12d,12(%rsp)
	xorl	%r9d,%r14d
	andl	%ebx,%edi

	rorl	$5,%r13d
	addl	%r8d,%r12d
	xorl	%edx,%edi

	rorl	$11,%r14d
	xorl	%ebx,%r13d
	addl	%edi,%r12d

	movl	%r9d,%edi
	addl	(%rbp),%r12d
	xorl	%r9d,%r14d

	xorl	%r10d,%edi
	rorl	$6,%r13d
	movl	%r10d,%r8d

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%r8d
	addl	%r12d,%eax
	addl	%r12d,%r8d

	leaq	20(%rbp),%rbp
	addl	%r14d,%r8d
	movl	16(%rsi),%r12d
	movl	%eax,%r13d
	movl	%r8d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%ebx,%r15d

	xorl	%eax,%r13d
	rorl	$9,%r14d
	xorl	%ecx,%r15d

	movl	%r12d,16(%rsp)
	xorl	%r8d,%r14d
	andl	%eax,%r15d

	rorl	$5,%r13d
	addl	%edx,%r12d
	xorl	%ecx,%r15d

	rorl	$11,%r14d
	xorl	%eax,%r13d
	addl	%r15d,%r12d

	movl	%r8d,%r15d
	addl	(%rbp),%r12d
	xorl	%r8d,%r14d

	xorl	%r9d,%r15d
	rorl	$6,%r13d
	movl	%r9d,%edx

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%edx
	addl	%r12d,%r11d
	addl	%r12d,%edx

	leaq	4(%rbp),%rbp
	addl	%r14d,%edx
	movl	20(%rsi),%r12d
	movl	%r11d,%r13d
	movl	%edx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%eax,%edi

	xorl	%r11d,%r13d
	rorl	$9,%r14d
	xorl	%ebx,%edi

	movl	%r12d,20(%rsp)
	xorl	%edx,%r14d
	andl	%r11d,%edi

	rorl	$5,%r13d
	addl	%ecx,%r12d
	xorl	%ebx,%edi

	rorl	$11,%r14d
	xorl	%r11d,%r13d
	addl	%edi,%r12d

	movl	%edx,%edi
	addl	(%rbp),%r12d
	xorl	%edx,%r14d

	xorl	%r8d,%edi
	rorl	$6,%r13d
	movl	%r8d,%ecx

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%ecx
	addl	%r12d,%r10d
	addl	%r12d,%ecx

	leaq	4(%rbp),%rbp
	addl	%r14d,%ecx
	movl	24(%rsi),%r12d
	movl	%r10d,%r13d
	movl	%ecx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r11d,%r15d

	xorl	%r10d,%r13d
	rorl	$9,%r14d
	xorl	%eax,%r15d

	movl	%r12d,24(%rsp)
	xorl	%ecx,%r14d
	andl	%r10d,%r15d

	rorl	$5,%r13d
	addl	%ebx,%r12d
	xorl	%eax,%r15d

	rorl	$11,%r14d
	xorl	%r10d,%r13d
	addl	%r15d,%r12d

	movl	%ecx,%r15d
	addl	(%rbp),%r12d
	xorl	%ecx,%r14d

	xorl	%edx,%r15d
	rorl	$6,%r13d
	movl	%edx,%ebx

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%ebx
	addl	%r12d,%r9d
	addl	%r12d,%ebx

	leaq	4(%rbp),%rbp
	addl	%r14d,%ebx
	movl	28(%rsi),%r12d
	movl	%r9d,%r13d
	movl	%ebx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r10d,%edi

	xorl	%r9d,%r13d
	rorl	$9,%r14d
	xorl	%r11d,%edi

	movl	%r12d,28(%rsp)
	xorl	%ebx,%r14d
	andl	%r9d,%edi

	rorl	$5,%r13d
	addl	%eax,%r12d
	xorl	%r11d,%edi

	rorl	$11,%r14d
	xorl	%r9d,%r13d
	addl	%edi,%r12d

	movl	%ebx,%edi
	addl	(%rbp),%r12d
	xorl	%ebx,%r14d

	xorl	%ecx,%edi
	rorl	$6,%r13d
	movl	%ecx,%eax

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%eax
	addl	%r12d,%r8d
	addl	%r12d,%eax

	leaq	20(%rbp),%rbp
	addl	%r14d,%eax
	movl	32(%rsi),%r12d
	movl	%r8d,%r13d
	movl	%eax,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r9d,%r15d

	xorl	%r8d,%r13d
	rorl	$9,%r14d
	xorl	%r10d,%r15d

	movl	%r12d,32(%rsp)
	xorl	%eax,%r14d
	andl	%r8d,%r15d

	rorl	$5,%r13d
	addl	%r11d,%r12d
	xorl	%r10d,%r15d

	rorl	$11,%r14d
	xorl	%r8d,%r13d
	addl	%r15d,%r12d

	movl	%eax,%r15d
	addl	(%rbp),%r12d
	xorl	%eax,%r14d

	xorl	%ebx,%r15d
	rorl	$6,%r13d
	movl	%ebx,%r11d

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%r11d
	addl	%r12d,%edx
	addl	%r12d,%r11d

	leaq	4(%rbp),%rbp
	addl	%r14d,%r11d
	movl	36(%rsi),%r12d
	movl	%edx,%r13d
	movl	%r11d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r8d,%edi

	xorl	%edx,%r13d
	rorl	$9,%r14d
	xorl	%r9d,%edi

	movl	%r12d,36(%rsp)
	xorl	%r11d,%r14d
	andl	%edx,%edi

	rorl	$5,%r13d
	addl	%r10d,%r12d
	xorl	%r9d,%edi

	rorl	$11,%r14d
	xorl	%edx,%r13d
	addl	%edi,%r12d

	movl	%r11d,%edi
	addl	(%rbp),%r12d
	xorl	%r11d,%r14d

	xorl	%eax,%edi
	rorl	$6,%r13d
	movl	%eax,%r10d

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%r10d
	addl	%r12d,%ecx
	addl	%r12d,%r10d

	leaq	4(%rbp),%rbp
	addl	%r14d,%r10d
	movl	40(%rsi),%r12d
	movl	%ecx,%r13d
	movl	%r10d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%edx,%r15d

	xorl	%ecx,%r13d
	rorl	$9,%r14d
	xorl	%r8d,%r15d

	movl	%r12d,40(%rsp)
	xorl	%r10d,%r14d
	andl	%ecx,%r15d

	rorl	$5,%r13d
	addl	%r9d,%r12d
	xorl	%r8d,%r15d

	rorl	$11,%r14d
	xorl	%ecx,%r13d
	addl	%r15d,%r12d

	movl	%r10d,%r15d
	addl	(%rbp),%r12d
	xorl	%r10d,%r14d

	xorl	%r11d,%r15d
	rorl	$6,%r13d
	movl	%r11d,%r9d

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%r9d
	addl	%r12d,%ebx
	addl	%r12d,%r9d

	leaq	4(%rbp),%rbp
	addl	%r14d,%r9d
	movl	44(%rsi),%r12d
	movl	%ebx,%r13d
	movl	%r9d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%ecx,%edi

	xorl	%ebx,%r13d
	rorl	$9,%r14d
	xorl	%edx,%edi

	movl	%r12d,44(%rsp)
	xorl	%r9d,%r14d
	andl	%ebx,%edi

	rorl	$5,%r13d
	addl	%r8d,%r12d
	xorl	%edx,%edi

	rorl	$11,%r14d
	xorl	%ebx,%r13d
	addl	%edi,%r12d

	movl	%r9d,%edi
	addl	(%rbp),%r12d
	xorl	%r9d,%r14d

	xorl	%r10d,%edi
	rorl	$6,%r13d
	movl	%r10d,%r8d

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%r8d
	addl	%r12d,%eax
	addl	%r12d,%r8d

	leaq	20(%rbp),%rbp
	addl	%r14d,%r8d
	movl	48(%rsi),%r12d
	movl	%eax,%r13d
	movl	%r8d,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%ebx,%r15d

	xorl	%eax,%r13d
	rorl	$9,%r14d
	xorl	%ecx,%r15d

	movl	%r12d,48(%rsp)
	xorl	%r8d,%r14d
	andl	%eax,%r15d

	rorl	$5,%r13d
	addl	%edx,%r12d
	xorl	%ecx,%r15d

	rorl	$11,%r14d
	xorl	%eax,%r13d
	addl	%r15d,%r12d

	movl	%r8d,%r15d
	addl	(%rbp),%r12d
	xorl	%r8d,%r14d

	xorl	%r9d,%r15d
	rorl	$6,%r13d
	movl	%r9d,%edx

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%edx
	addl	%r12d,%r11d
	addl	%r12d,%edx

	leaq	4(%rbp),%rbp
	addl	%r14d,%edx
	movl	52(%rsi),%r12d
	movl	%r11d,%r13d
	movl	%edx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%eax,%edi

	xorl	%r11d,%r13d
	rorl	$9,%r14d
	xorl	%ebx,%edi

	movl	%r12d,52(%rsp)
	xorl	%edx,%r14d
	andl	%r11d,%edi

	rorl	$5,%r13d
	addl	%ecx,%r12d
	xorl	%ebx,%edi

	rorl	$11,%r14d
	xorl	%r11d,%r13d
	addl	%edi,%r12d

	movl	%edx,%edi
	addl	(%rbp),%r12d
	xorl	%edx,%r14d

	xorl	%r8d,%edi
	rorl	$6,%r13d
	movl	%r8d,%ecx

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%ecx
	addl	%r12d,%r10d
	addl	%r12d,%ecx

	leaq	4(%rbp),%rbp
	addl	%r14d,%ecx
	movl	56(%rsi),%r12d
	movl	%r10d,%r13d
	movl	%ecx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r11d,%r15d

	xorl	%r10d,%r13d
	rorl	$9,%r14d
	xorl	%eax,%r15d

	movl	%r12d,56(%rsp)
	xorl	%ecx,%r14d
	andl	%r10d,%r15d

	rorl	$5,%r13d
	addl	%ebx,%r12d
	xorl	%eax,%r15d

	rorl	$11,%r14d
	xorl	%r10d,%r13d
	addl	%r15d,%r12d

	movl	%ecx,%r15d
	addl	(%rbp),%r12d
	xorl	%ecx,%r14d

	xorl	%edx,%r15d
	rorl	$6,%r13d
	movl	%edx,%ebx

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%ebx
	addl	%r12d,%r9d
	addl	%r12d,%ebx

	leaq	4(%rbp),%rbp
	addl	%r14d,%ebx
	movl	60(%rsi),%r12d
	movl	%r9d,%r13d
	movl	%ebx,%r14d
	bswapl	%r12d
	rorl	$14,%r13d
	movl	%r10d,%edi

	xorl	%r9d,%r13d
	rorl	$9,%r14d
	xorl	%r11d,%edi

	movl	%r12d,60(%rsp)
	xorl	%ebx,%r14d
	andl	%r9d,%edi

	rorl	$5,%r13d
	addl	%eax,%r12d
	xorl	%r11d,%edi

	rorl	$11,%r14d
	xorl	%r9d,%r13d
	addl	%edi,%r12d

	movl	%ebx,%edi
	addl	(%rbp),%r12d
	xorl	%ebx,%r14d

	xorl	%ecx,%edi
	rorl	$6,%r13d
	movl	%ecx,%eax

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%eax
	addl	%r12d,%r8d
	addl	%r12d,%eax

	leaq	20(%rbp),%rbp
	jmp	.Lrounds_16_xx
.p2align	4
.Lrounds_16_xx:
	movl	4(%rsp),%r13d
	movl	56(%rsp),%r15d

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%eax
	movl	%r15d,%r14d
	rorl	$2,%r15d

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	xorl	%r13d,%r12d
	xorl	%r14d,%r15d
	addl	36(%rsp),%r12d

	addl	0(%rsp),%r12d
	movl	%r8d,%r13d
	addl	%r15d,%r12d
	movl	%eax,%r14d
	rorl	$14,%r13d
	movl	%r9d,%r15d

	xorl	%r8d,%r13d
	rorl	$9,%r14d
	xorl	%r10d,%r15d

	movl	%r12d,0(%rsp)
	xorl	%eax,%r14d
	andl	%r8d,%r15d

	rorl	$5,%r13d
	addl	%r11d,%r12d
	xorl	%r10d,%r15d

	rorl	$11,%r14d
	xorl	%r8d,%r13d
	addl	%r15d,%r12d

	movl	%eax,%r15d
	addl	(%rbp),%r12d
	xorl	%eax,%r14d

	xorl	%ebx,%r15d
	rorl	$6,%r13d
	movl	%ebx,%r11d

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%r11d
	addl	%r12d,%edx
	addl	%r12d,%r11d

	leaq	4(%rbp),%rbp
	movl	8(%rsp),%r13d
	movl	60(%rsp),%edi

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%r11d
	movl	%edi,%r14d
	rorl	$2,%edi

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%edi
	shrl	$10,%r14d

	rorl	$17,%edi
	xorl	%r13d,%r12d
	xorl	%r14d,%edi
	addl	40(%rsp),%r12d

	addl	4(%rsp),%r12d
	movl	%edx,%r13d
	addl	%edi,%r12d
	movl	%r11d,%r14d
	rorl	$14,%r13d
	movl	%r8d,%edi

	xorl	%edx,%r13d
	rorl	$9,%r14d
	xorl	%r9d,%edi

	movl	%r12d,4(%rsp)
	xorl	%r11d,%r14d
	andl	%edx,%edi

	rorl	$5,%r13d
	addl	%r10d,%r12d
	xorl	%r9d,%edi

	rorl	$11,%r14d
	xorl	%edx,%r13d
	addl	%edi,%r12d

	movl	%r11d,%edi
	addl	(%rbp),%r12d
	xorl	%r11d,%r14d

	xorl	%eax,%edi
	rorl	$6,%r13d
	movl	%eax,%r10d

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%r10d
	addl	%r12d,%ecx
	addl	%r12d,%r10d

	leaq	4(%rbp),%rbp
	movl	12(%rsp),%r13d
	movl	0(%rsp),%r15d

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%r10d
	movl	%r15d,%r14d
	rorl	$2,%r15d

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	xorl	%r13d,%r12d
	xorl	%r14d,%r15d
	addl	44(%rsp),%r12d

	addl	8(%rsp),%r12d
	movl	%ecx,%r13d
	addl	%r15d,%r12d
	movl	%r10d,%r14d
	rorl	$14,%r13d
	movl	%edx,%r15d

	xorl	%ecx,%r13d
	rorl	$9,%r14d
	xorl	%r8d,%r15d

	movl	%r12d,8(%rsp)
	xorl	%r10d,%r14d
	andl	%ecx,%r15d

	rorl	$5,%r13d
	addl	%r9d,%r12d
	xorl	%r8d,%r15d

	rorl	$11,%r14d
	xorl	%ecx,%r13d
	addl	%r15d,%r12d

	movl	%r10d,%r15d
	addl	(%rbp),%r12d
	xorl	%r10d,%r14d

	xorl	%r11d,%r15d
	rorl	$6,%r13d
	movl	%r11d,%r9d

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%r9d
	addl	%r12d,%ebx
	addl	%r12d,%r9d

	leaq	4(%rbp),%rbp
	movl	16(%rsp),%r13d
	movl	4(%rsp),%edi

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%r9d
	movl	%edi,%r14d
	rorl	$2,%edi

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%edi
	shrl	$10,%r14d

	rorl	$17,%edi
	xorl	%r13d,%r12d
	xorl	%r14d,%edi
	addl	48(%rsp),%r12d

	addl	12(%rsp),%r12d
	movl	%ebx,%r13d
	addl	%edi,%r12d
	movl	%r9d,%r14d
	rorl	$14,%r13d
	movl	%ecx,%edi

	xorl	%ebx,%r13d
	rorl	$9,%r14d
	xorl	%edx,%edi

	movl	%r12d,12(%rsp)
	xorl	%r9d,%r14d
	andl	%ebx,%edi

	rorl	$5,%r13d
	addl	%r8d,%r12d
	xorl	%edx,%edi

	rorl	$11,%r14d
	xorl	%ebx,%r13d
	addl	%edi,%r12d

	movl	%r9d,%edi
	addl	(%rbp),%r12d
	xorl	%r9d,%r14d

	xorl	%r10d,%edi
	rorl	$6,%r13d
	movl	%r10d,%r8d

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%r8d
	addl	%r12d,%eax
	addl	%r12d,%r8d

	leaq	20(%rbp),%rbp
	movl	20(%rsp),%r13d
	movl	8(%rsp),%r15d

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%r8d
	movl	%r15d,%r14d
	rorl	$2,%r15d

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	xorl	%r13d,%r12d
	xorl	%r14d,%r15d
	addl	52(%rsp),%r12d

	addl	16(%rsp),%r12d
	movl	%eax,%r13d
	addl	%r15d,%r12d
	movl	%r8d,%r14d
	rorl	$14,%r13d
	movl	%ebx,%r15d

	xorl	%eax,%r13d
	rorl	$9,%r14d
	xorl	%ecx,%r15d

	movl	%r12d,16(%rsp)
	xorl	%r8d,%r14d
	andl	%eax,%r15d

	rorl	$5,%r13d
	addl	%edx,%r12d
	xorl	%ecx,%r15d

	rorl	$11,%r14d
	xorl	%eax,%r13d
	addl	%r15d,%r12d

	movl	%r8d,%r15d
	addl	(%rbp),%r12d
	xorl	%r8d,%r14d

	xorl	%r9d,%r15d
	rorl	$6,%r13d
	movl	%r9d,%edx

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%edx
	addl	%r12d,%r11d
	addl	%r12d,%edx

	leaq	4(%rbp),%rbp
	movl	24(%rsp),%r13d
	movl	12(%rsp),%edi

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%edx
	movl	%edi,%r14d
	rorl	$2,%edi

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%edi
	shrl	$10,%r14d

	rorl	$17,%edi
	xorl	%r13d,%r12d
	xorl	%r14d,%edi
	addl	56(%rsp),%r12d

	addl	20(%rsp),%r12d
	movl	%r11d,%r13d
	addl	%edi,%r12d
	movl	%edx,%r14d
	rorl	$14,%r13d
	movl	%eax,%edi

	xorl	%r11d,%r13d
	rorl	$9,%r14d
	xorl	%ebx,%edi

	movl	%r12d,20(%rsp)
	xorl	%edx,%r14d
	andl	%r11d,%edi

	rorl	$5,%r13d
	addl	%ecx,%r12d
	xorl	%ebx,%edi

	rorl	$11,%r14d
	xorl	%r11d,%r13d
	addl	%edi,%r12d

	movl	%edx,%edi
	addl	(%rbp),%r12d
	xorl	%edx,%r14d

	xorl	%r8d,%edi
	rorl	$6,%r13d
	movl	%r8d,%ecx

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%ecx
	addl	%r12d,%r10d
	addl	%r12d,%ecx

	leaq	4(%rbp),%rbp
	movl	28(%rsp),%r13d
	movl	16(%rsp),%r15d

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%ecx
	movl	%r15d,%r14d
	rorl	$2,%r15d

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	xorl	%r13d,%r12d
	xorl	%r14d,%r15d
	addl	60(%rsp),%r12d

	addl	24(%rsp),%r12d
	movl	%r10d,%r13d
	addl	%r15d,%r12d
	movl	%ecx,%r14d
	rorl	$14,%r13d
	movl	%r11d,%r15d

	xorl	%r10d,%r13d
	rorl	$9,%r14d
	xorl	%eax,%r15d

	movl	%r12d,24(%rsp)
	xorl	%ecx,%r14d
	andl	%r10d,%r15d

	rorl	$5,%r13d
	addl	%ebx,%r12d
	xorl	%eax,%r15d

	rorl	$11,%r14d
	xorl	%r10d,%r13d
	addl	%r15d,%r12d

	movl	%ecx,%r15d
	addl	(%rbp),%r12d
	xorl	%ecx,%r14d

	xorl	%edx,%r15d
	rorl	$6,%r13d
	movl	%edx,%ebx

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%ebx
	addl	%r12d,%r9d
	addl	%r12d,%ebx

	leaq	4(%rbp),%rbp
	movl	32(%rsp),%r13d
	movl	20(%rsp),%edi

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%ebx
	movl	%edi,%r14d
	rorl	$2,%edi

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%edi
	shrl	$10,%r14d

	rorl	$17,%edi
	xorl	%r13d,%r12d
	xorl	%r14d,%edi
	addl	0(%rsp),%r12d

	addl	28(%rsp),%r12d
	movl	%r9d,%r13d
	addl	%edi,%r12d
	movl	%ebx,%r14d
	rorl	$14,%r13d
	movl	%r10d,%edi

	xorl	%r9d,%r13d
	rorl	$9,%r14d
	xorl	%r11d,%edi

	movl	%r12d,28(%rsp)
	xorl	%ebx,%r14d
	andl	%r9d,%edi

	rorl	$5,%r13d
	addl	%eax,%r12d
	xorl	%r11d,%edi

	rorl	$11,%r14d
	xorl	%r9d,%r13d
	addl	%edi,%r12d

	movl	%ebx,%edi
	addl	(%rbp),%r12d
	xorl	%ebx,%r14d

	xorl	%ecx,%edi
	rorl	$6,%r13d
	movl	%ecx,%eax

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%eax
	addl	%r12d,%r8d
	addl	%r12d,%eax

	leaq	20(%rbp),%rbp
	movl	36(%rsp),%r13d
	movl	24(%rsp),%r15d

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%eax
	movl	%r15d,%r14d
	rorl	$2,%r15d

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	xorl	%r13d,%r12d
	xorl	%r14d,%r15d
	addl	4(%rsp),%r12d

	addl	32(%rsp),%r12d
	movl	%r8d,%r13d
	addl	%r15d,%r12d
	movl	%eax,%r14d
	rorl	$14,%r13d
	movl	%r9d,%r15d

	xorl	%r8d,%r13d
	rorl	$9,%r14d
	xorl	%r10d,%r15d

	movl	%r12d,32(%rsp)
	xorl	%eax,%r14d
	andl	%r8d,%r15d

	rorl	$5,%r13d
	addl	%r11d,%r12d
	xorl	%r10d,%r15d

	rorl	$11,%r14d
	xorl	%r8d,%r13d
	addl	%r15d,%r12d

	movl	%eax,%r15d
	addl	(%rbp),%r12d
	xorl	%eax,%r14d

	xorl	%ebx,%r15d
	rorl	$6,%r13d
	movl	%ebx,%r11d

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%r11d
	addl	%r12d,%edx
	addl	%r12d,%r11d

	leaq	4(%rbp),%rbp
	movl	40(%rsp),%r13d
	movl	28(%rsp),%edi

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%r11d
	movl	%edi,%r14d
	rorl	$2,%edi

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%edi
	shrl	$10,%r14d

	rorl	$17,%edi
	xorl	%r13d,%r12d
	xorl	%r14d,%edi
	addl	8(%rsp),%r12d

	addl	36(%rsp),%r12d
	movl	%edx,%r13d
	addl	%edi,%r12d
	movl	%r11d,%r14d
	rorl	$14,%r13d
	movl	%r8d,%edi

	xorl	%edx,%r13d
	rorl	$9,%r14d
	xorl	%r9d,%edi

	movl	%r12d,36(%rsp)
	xorl	%r11d,%r14d
	andl	%edx,%edi

	rorl	$5,%r13d
	addl	%r10d,%r12d
	xorl	%r9d,%edi

	rorl	$11,%r14d
	xorl	%edx,%r13d
	addl	%edi,%r12d

	movl	%r11d,%edi
	addl	(%rbp),%r12d
	xorl	%r11d,%r14d

	xorl	%eax,%edi
	rorl	$6,%r13d
	movl	%eax,%r10d

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%r10d
	addl	%r12d,%ecx
	addl	%r12d,%r10d

	leaq	4(%rbp),%rbp
	movl	44(%rsp),%r13d
	movl	32(%rsp),%r15d

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%r10d
	movl	%r15d,%r14d
	rorl	$2,%r15d

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	xorl	%r13d,%r12d
	xorl	%r14d,%r15d
	addl	12(%rsp),%r12d

	addl	40(%rsp),%r12d
	movl	%ecx,%r13d
	addl	%r15d,%r12d
	movl	%r10d,%r14d
	rorl	$14,%r13d
	movl	%edx,%r15d

	xorl	%ecx,%r13d
	rorl	$9,%r14d
	xorl	%r8d,%r15d

	movl	%r12d,40(%rsp)
	xorl	%r10d,%r14d
	andl	%ecx,%r15d

	rorl	$5,%r13d
	addl	%r9d,%r12d
	xorl	%r8d,%r15d

	rorl	$11,%r14d
	xorl	%ecx,%r13d
	addl	%r15d,%r12d

	movl	%r10d,%r15d
	addl	(%rbp),%r12d
	xorl	%r10d,%r14d

	xorl	%r11d,%r15d
	rorl	$6,%r13d
	movl	%r11d,%r9d

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%r9d
	addl	%r12d,%ebx
	addl	%r12d,%r9d

	leaq	4(%rbp),%rbp
	movl	48(%rsp),%r13d
	movl	36(%rsp),%edi

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%r9d
	movl	%edi,%r14d
	rorl	$2,%edi

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%edi
	shrl	$10,%r14d

	rorl	$17,%edi
	xorl	%r13d,%r12d
	xorl	%r14d,%edi
	addl	16(%rsp),%r12d

	addl	44(%rsp),%r12d
	movl	%ebx,%r13d
	addl	%edi,%r12d
	movl	%r9d,%r14d
	rorl	$14,%r13d
	movl	%ecx,%edi

	xorl	%ebx,%r13d
	rorl	$9,%r14d
	xorl	%edx,%edi

	movl	%r12d,44(%rsp)
	xorl	%r9d,%r14d
	andl	%ebx,%edi

	rorl	$5,%r13d
	addl	%r8d,%r12d
	xorl	%edx,%edi

	rorl	$11,%r14d
	xorl	%ebx,%r13d
	addl	%edi,%r12d

	movl	%r9d,%edi
	addl	(%rbp),%r12d
	xorl	%r9d,%r14d

	xorl	%r10d,%edi
	rorl	$6,%r13d
	movl	%r10d,%r8d

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%r8d
	addl	%r12d,%eax
	addl	%r12d,%r8d

	leaq	20(%rbp),%rbp
	movl	52(%rsp),%r13d
	movl	40(%rsp),%r15d

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%r8d
	movl	%r15d,%r14d
	rorl	$2,%r15d

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	xorl	%r13d,%r12d
	xorl	%r14d,%r15d
	addl	20(%rsp),%r12d

	addl	48(%rsp),%r12d
	movl	%eax,%r13d
	addl	%r15d,%r12d
	movl	%r8d,%r14d
	rorl	$14,%r13d
	movl	%ebx,%r15d

	xorl	%eax,%r13d
	rorl	$9,%r14d
	xorl	%ecx,%r15d

	movl	%r12d,48(%rsp)
	xorl	%r8d,%r14d
	andl	%eax,%r15d

	rorl	$5,%r13d
	addl	%edx,%r12d
	xorl	%ecx,%r15d

	rorl	$11,%r14d
	xorl	%eax,%r13d
	addl	%r15d,%r12d

	movl	%r8d,%r15d
	addl	(%rbp),%r12d
	xorl	%r8d,%r14d

	xorl	%r9d,%r15d
	rorl	$6,%r13d
	movl	%r9d,%edx

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%edx
	addl	%r12d,%r11d
	addl	%r12d,%edx

	leaq	4(%rbp),%rbp
	movl	56(%rsp),%r13d
	movl	44(%rsp),%edi

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%edx
	movl	%edi,%r14d
	rorl	$2,%edi

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%edi
	shrl	$10,%r14d

	rorl	$17,%edi
	xorl	%r13d,%r12d
	xorl	%r14d,%edi
	addl	24(%rsp),%r12d

	addl	52(%rsp),%r12d
	movl	%r11d,%r13d
	addl	%edi,%r12d
	movl	%edx,%r14d
	rorl	$14,%r13d
	movl	%eax,%edi

	xorl	%r11d,%r13d
	rorl	$9,%r14d
	xorl	%ebx,%edi

	movl	%r12d,52(%rsp)
	xorl	%edx,%r14d
	andl	%r11d,%edi

	rorl	$5,%r13d
	addl	%ecx,%r12d
	xorl	%ebx,%edi

	rorl	$11,%r14d
	xorl	%r11d,%r13d
	addl	%edi,%r12d

	movl	%edx,%edi
	addl	(%rbp),%r12d
	xorl	%edx,%r14d

	xorl	%r8d,%edi
	rorl	$6,%r13d
	movl	%r8d,%ecx

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%ecx
	addl	%r12d,%r10d
	addl	%r12d,%ecx

	leaq	4(%rbp),%rbp
	movl	60(%rsp),%r13d
	movl	48(%rsp),%r15d

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%ecx
	movl	%r15d,%r14d
	rorl	$2,%r15d

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%r15d
	shrl	$10,%r14d

	rorl	$17,%r15d
	xorl	%r13d,%r12d
	xorl	%r14d,%r15d
	addl	28(%rsp),%r12d

	addl	56(%rsp),%r12d
	movl	%r10d,%r13d
	addl	%r15d,%r12d
	movl	%ecx,%r14d
	rorl	$14,%r13d
	movl	%r11d,%r15d

	xorl	%r10d,%r13d
	rorl	$9,%r14d
	xorl	%eax,%r15d

	movl	%r12d,56(%rsp)
	xorl	%ecx,%r14d
	andl	%r10d,%r15d

	rorl	$5,%r13d
	addl	%ebx,%r12d
	xorl	%eax,%r15d

	rorl	$11,%r14d
	xorl	%r10d,%r13d
	addl	%r15d,%r12d

	movl	%ecx,%r15d
	addl	(%rbp),%r12d
	xorl	%ecx,%r14d

	xorl	%edx,%r15d
	rorl	$6,%r13d
	movl	%edx,%ebx

	andl	%r15d,%edi
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%edi,%ebx
	addl	%r12d,%r9d
	addl	%r12d,%ebx

	leaq	4(%rbp),%rbp
	movl	0(%rsp),%r13d
	movl	52(%rsp),%edi

	movl	%r13d,%r12d
	rorl	$11,%r13d
	addl	%r14d,%ebx
	movl	%edi,%r14d
	rorl	$2,%edi

	xorl	%r12d,%r13d
	shrl	$3,%r12d
	rorl	$7,%r13d
	xorl	%r14d,%edi
	shrl	$10,%r14d

	rorl	$17,%edi
	xorl	%r13d,%r12d
	xorl	%r14d,%edi
	addl	32(%rsp),%r12d

	addl	60(%rsp),%r12d
	movl	%r9d,%r13d
	addl	%edi,%r12d
	movl	%ebx,%r14d
	rorl	$14,%r13d
	movl	%r10d,%edi

	xorl	%r9d,%r13d
	rorl	$9,%r14d
	xorl	%r11d,%edi

	movl	%r12d,60(%rsp)
	xorl	%ebx,%r14d
	andl	%r9d,%edi

	rorl	$5,%r13d
	addl	%eax,%r12d
	xorl	%r11d,%edi

	rorl	$11,%r14d
	xorl	%r9d,%r13d
	addl	%edi,%r12d

	movl	%ebx,%edi
	addl	(%rbp),%r12d
	xorl	%ebx,%r14d

	xorl	%ecx,%edi
	rorl	$6,%r13d
	movl	%ecx,%eax

	andl	%edi,%r15d
	rorl	$2,%r14d
	addl	%r13d,%r12d

	xorl	%r15d,%eax
	addl	%r12d,%r8d
	addl	%r12d,%eax

	leaq	20(%rbp),%rbp
	cmpb	$0,3(%rbp)
	jnz	.Lrounds_16_xx

	movq	64+0(%rsp),%rdi
	addl	%r14d,%eax
	leaq	64(%rsi),%rsi

	addl	0(%rdi),%eax
	addl	4(%rdi),%ebx
	addl	8(%rdi),%ecx
	addl	12(%rdi),%edx
	addl	16(%rdi),%r8d
	addl	20(%rdi),%r9d
	addl	24(%rdi),%r10d
	addl	28(%rdi),%r11d

	cmpq	64+16(%rsp),%rsi

	movl	%eax,0(%rdi)
	movl	%ebx,4(%rdi)
	movl	%ecx,8(%rdi)
	movl	%edx,12(%rdi)
	movl	%r8d,16(%rdi)
	movl	%r9d,20(%rdi)
	movl	%r10d,24(%rdi)
	movl	%r11d,28(%rdi)
	jb	.Lloop

	movq	88(%rsp),%rsi

	movq	-48(%rsi),%r15

	movq	-40(%rsi),%r14

	movq	-32(%rsi),%r13

	movq	-24(%rsi),%r12

	movq	-16(%rsi),%rbp

	movq	-8(%rsi),%rbx

	leaq	(%rsi),%rsp

.Lepilogue:
	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3

.LSEH_end_sha256_block_data_order:
.section	.rodata
.p2align	6

K256:
.long	0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5
.long	0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5
.long	0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5
.long	0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5
.long	0xd807aa98,0x12835b01,0x243185be,0x550c7dc3
.long	0xd807aa98,0x12835b01,0x243185be,0x550c7dc3
.long	0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174
.long	0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174
.long	0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc
.long	0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc
.long	0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da
.long	0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da
.long	0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7
.long	0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7
.long	0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967
.long	0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967
.long	0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13
.long	0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13
.long	0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85
.long	0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85
.long	0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3
.long	0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3
.long	0xd192e819,0xd6990624,0xf40e3585,0x106aa070
.long	0xd192e819,0xd6990624,0xf40e3585,0x106aa070
.long	0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5
.long	0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5
.long	0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3
.long	0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3
.long	0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208
.long	0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208
.long	0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
.long	0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2

.long	0x00010203,0x04050607,0x08090a0b,0x0c0d0e0f
.long	0x00010203,0x04050607,0x08090a0b,0x0c0d0e0f
.long	0x03020100,0x0b0a0908,0xffffffff,0xffffffff
.long	0x03020100,0x0b0a0908,0xffffffff,0xffffffff
.long	0xffffffff,0xffffffff,0x03020100,0x0b0a0908
.long	0xffffffff,0xffffffff,0x03020100,0x0b0a0908
.byte	83,72,65,50,53,54,32,98,108,111,99,107,32,116,114,97,110,115,102,111,114,109,32,102,111,114,32,120,56,54,95,54,52,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
.text
.def	sha256_block_data_order_shaext;	.scl 3;	.type 32;	.endef
.p2align	6
sha256_block_data_order_shaext:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_sha256_block_data_order_shaext:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx

_shaext_shortcut:

	leaq	-88(%rsp),%rsp
	movaps	%xmm6,-8-80(%rax)
	movaps	%xmm7,-8-64(%rax)
	movaps	%xmm8,-8-48(%rax)
	movaps	%xmm9,-8-32(%rax)
	movaps	%xmm10,-8-16(%rax)
.Lprologue_shaext:
	leaq	K256+128(%rip),%rcx
	movdqu	(%rdi),%xmm1
	movdqu	16(%rdi),%xmm2
	movdqa	512-128(%rcx),%xmm7

	pshufd	$0x1b,%xmm1,%xmm0
	pshufd	$0xb1,%xmm1,%xmm1
	pshufd	$0x1b,%xmm2,%xmm2
	movdqa	%xmm7,%xmm8
.byte	102,15,58,15,202,8
	punpcklqdq	%xmm0,%xmm2
	jmp	.Loop_shaext

.p2align	4
.Loop_shaext:
	movdqu	(%rsi),%xmm3
	movdqu	16(%rsi),%xmm4
	movdqu	32(%rsi),%xmm5
.byte	102,15,56,0,223
	movdqu	48(%rsi),%xmm6

	movdqa	0-128(%rcx),%xmm0
	paddd	%xmm3,%xmm0
.byte	102,15,56,0,231
	movdqa	%xmm2,%xmm10
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	nop
	movdqa	%xmm1,%xmm9
.byte	15,56,203,202

	movdqa	32-128(%rcx),%xmm0
	paddd	%xmm4,%xmm0
.byte	102,15,56,0,239
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	leaq	64(%rsi),%rsi
.byte	15,56,204,220
.byte	15,56,203,202

	movdqa	64-128(%rcx),%xmm0
	paddd	%xmm5,%xmm0
.byte	102,15,56,0,247
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm6,%xmm7
.byte	102,15,58,15,253,4
	nop
	paddd	%xmm7,%xmm3
.byte	15,56,204,229
.byte	15,56,203,202

	movdqa	96-128(%rcx),%xmm0
	paddd	%xmm6,%xmm0
.byte	15,56,205,222
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm3,%xmm7
.byte	102,15,58,15,254,4
	nop
	paddd	%xmm7,%xmm4
.byte	15,56,204,238
.byte	15,56,203,202
	movdqa	128-128(%rcx),%xmm0
	paddd	%xmm3,%xmm0
.byte	15,56,205,227
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm4,%xmm7
.byte	102,15,58,15,251,4
	nop
	paddd	%xmm7,%xmm5
.byte	15,56,204,243
.byte	15,56,203,202
	movdqa	160-128(%rcx),%xmm0
	paddd	%xmm4,%xmm0
.byte	15,56,205,236
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm5,%xmm7
.byte	102,15,58,15,252,4
	nop
	paddd	%xmm7,%xmm6
.byte	15,56,204,220
.byte	15,56,203,202
	movdqa	192-128(%rcx),%xmm0
	paddd	%xmm5,%xmm0
.byte	15,56,205,245
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm6,%xmm7
.byte	102,15,58,15,253,4
	nop
	paddd	%xmm7,%xmm3
.byte	15,56,204,229
.byte	15,56,203,202
	movdqa	224-128(%rcx),%xmm0
	paddd	%xmm6,%xmm0
.byte	15,56,205,222
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm3,%xmm7
.byte	102,15,58,15,254,4
	nop
	paddd	%xmm7,%xmm4
.byte	15,56,204,238
.byte	15,56,203,202
	movdqa	256-128(%rcx),%xmm0
	paddd	%xmm3,%xmm0
.byte	15,56,205,227
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm4,%xmm7
.byte	102,15,58,15,251,4
	nop
	paddd	%xmm7,%xmm5
.byte	15,56,204,243
.byte	15,56,203,202
	movdqa	288-128(%rcx),%xmm0
	paddd	%xmm4,%xmm0
.byte	15,56,205,236
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm5,%xmm7
.byte	102,15,58,15,252,4
	nop
	paddd	%xmm7,%xmm6
.byte	15,56,204,220
.byte	15,56,203,202
	movdqa	320-128(%rcx),%xmm0
	paddd	%xmm5,%xmm0
.byte	15,56,205,245
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm6,%xmm7
.byte	102,15,58,15,253,4
	nop
	paddd	%xmm7,%xmm3
.byte	15,56,204,229
.byte	15,56,203,202
	movdqa	352-128(%rcx),%xmm0
	paddd	%xmm6,%xmm0
.byte	15,56,205,222
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm3,%xmm7
.byte	102,15,58,15,254,4
	nop
	paddd	%xmm7,%xmm4
.byte	15,56,204,238
.byte	15,56,203,202
	movdqa	384-128(%rcx),%xmm0
	paddd	%xmm3,%xmm0
.byte	15,56,205,227
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm4,%xmm7
.byte	102,15,58,15,251,4
	nop
	paddd	%xmm7,%xmm5
.byte	15,56,204,243
.byte	15,56,203,202
	movdqa	416-128(%rcx),%xmm0
	paddd	%xmm4,%xmm0
.byte	15,56,205,236
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	movdqa	%xmm5,%xmm7
.byte	102,15,58,15,252,4
.byte	15,56,203,202
	paddd	%xmm7,%xmm6

	movdqa	448-128(%rcx),%xmm0
	paddd	%xmm5,%xmm0
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
.byte	15,56,205,245
	movdqa	%xmm8,%xmm7
.byte	15,56,203,202

	movdqa	480-128(%rcx),%xmm0
	paddd	%xmm6,%xmm0
	nop
.byte	15,56,203,209
	pshufd	$0x0e,%xmm0,%xmm0
	decq	%rdx
	nop
.byte	15,56,203,202

	paddd	%xmm10,%xmm2
	paddd	%xmm9,%xmm1
	jnz	.Loop_shaext

	pshufd	$0xb1,%xmm2,%xmm2
	pshufd	$0x1b,%xmm1,%xmm7
	pshufd	$0xb1,%xmm1,%xmm1
	punpckhqdq	%xmm2,%xmm1
.byte	102,15,58,15,215,8

	movdqu	%xmm1,(%rdi)
	movdqu	%xmm2,16(%rdi)
	movaps	-8-80(%rax),%xmm6
	movaps	-8-64(%rax),%xmm7
	movaps	-8-48(%rax),%xmm8
	movaps	-8-32(%rax),%xmm9
	movaps	-8-16(%rax),%xmm10
	movq	%rax,%rsp
.Lepilogue_shaext:
	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3

.LSEH_end_sha256_block_data_order_shaext:
.def	sha256_block_data_order_ssse3;	.scl 3;	.type 32;	.endef
.p2align	6
sha256_block_data_order_ssse3:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_sha256_block_data_order_ssse3:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx


.Lssse3_shortcut:
	movq	%rsp,%rax

	pushq	%rbx

	pushq	%rbp

	pushq	%r12

	pushq	%r13

	pushq	%r14

	pushq	%r15

	shlq	$4,%rdx
	subq	$160,%rsp
	leaq	(%rsi,%rdx,4),%rdx
	andq	$-64,%rsp
	movq	%rdi,64+0(%rsp)
	movq	%rsi,64+8(%rsp)
	movq	%rdx,64+16(%rsp)
	movq	%rax,88(%rsp)

	movaps	%xmm6,64+32(%rsp)
	movaps	%xmm7,64+48(%rsp)
	movaps	%xmm8,64+64(%rsp)
	movaps	%xmm9,64+80(%rsp)
.Lprologue_ssse3:

	movl	0(%rdi),%eax
	movl	4(%rdi),%ebx
	movl	8(%rdi),%ecx
	movl	12(%rdi),%edx
	movl	16(%rdi),%r8d
	movl	20(%rdi),%r9d
	movl	24(%rdi),%r10d
	movl	28(%rdi),%r11d


	jmp	.Lloop_ssse3
.p2align	4
.Lloop_ssse3:
	movdqa	K256+512(%rip),%xmm7
	movdqu	0(%rsi),%xmm0
	movdqu	16(%rsi),%xmm1
	movdqu	32(%rsi),%xmm2
.byte	102,15,56,0,199
	movdqu	48(%rsi),%xmm3
	leaq	K256(%rip),%rbp
.byte	102,15,56,0,207
	movdqa	0(%rbp),%xmm4
	movdqa	32(%rbp),%xmm5
.byte	102,15,56,0,215
	paddd	%xmm0,%xmm4
	movdqa	64(%rbp),%xmm6
.byte	102,15,56,0,223
	movdqa	96(%rbp),%xmm7
	paddd	%xmm1,%xmm5
	paddd	%xmm2,%xmm6
	paddd	%xmm3,%xmm7
	movdqa	%xmm4,0(%rsp)
	movl	%eax,%r14d
	movdqa	%xmm5,16(%rsp)
	movl	%ebx,%edi
	movdqa	%xmm6,32(%rsp)
	xorl	%ecx,%edi
	movdqa	%xmm7,48(%rsp)
	movl	%r8d,%r13d
	jmp	.Lssse3_00_47

.p2align	4
.Lssse3_00_47:
	subq	$-128,%rbp
	rorl	$14,%r13d
	movdqa	%xmm1,%xmm4
	movl	%r14d,%eax
	movl	%r9d,%r12d
	movdqa	%xmm3,%xmm7
	rorl	$9,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r12d
	rorl	$5,%r13d
	xorl	%eax,%r14d
.byte	102,15,58,15,224,4
	andl	%r8d,%r12d
	xorl	%r8d,%r13d
.byte	102,15,58,15,250,4
	addl	0(%rsp),%r11d
	movl	%eax,%r15d
	xorl	%r10d,%r12d
	rorl	$11,%r14d
	movdqa	%xmm4,%xmm5
	xorl	%ebx,%r15d
	addl	%r12d,%r11d
	movdqa	%xmm4,%xmm6
	rorl	$6,%r13d
	andl	%r15d,%edi
	psrld	$3,%xmm4
	xorl	%eax,%r14d
	addl	%r13d,%r11d
	xorl	%ebx,%edi
	paddd	%xmm7,%xmm0
	rorl	$2,%r14d
	addl	%r11d,%edx
	psrld	$7,%xmm6
	addl	%edi,%r11d
	movl	%edx,%r13d
	pshufd	$250,%xmm3,%xmm7
	addl	%r11d,%r14d
	rorl	$14,%r13d
	pslld	$14,%xmm5
	movl	%r14d,%r11d
	movl	%r8d,%r12d
	pxor	%xmm6,%xmm4
	rorl	$9,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r12d
	rorl	$5,%r13d
	psrld	$11,%xmm6
	xorl	%r11d,%r14d
	pxor	%xmm5,%xmm4
	andl	%edx,%r12d
	xorl	%edx,%r13d
	pslld	$11,%xmm5
	addl	4(%rsp),%r10d
	movl	%r11d,%edi
	pxor	%xmm6,%xmm4
	xorl	%r9d,%r12d
	rorl	$11,%r14d
	movdqa	%xmm7,%xmm6
	xorl	%eax,%edi
	addl	%r12d,%r10d
	pxor	%xmm5,%xmm4
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%r11d,%r14d
	psrld	$10,%xmm7
	addl	%r13d,%r10d
	xorl	%eax,%r15d
	paddd	%xmm4,%xmm0
	rorl	$2,%r14d
	addl	%r10d,%ecx
	psrlq	$17,%xmm6
	addl	%r15d,%r10d
	movl	%ecx,%r13d
	addl	%r10d,%r14d
	pxor	%xmm6,%xmm7
	rorl	$14,%r13d
	movl	%r14d,%r10d
	movl	%edx,%r12d
	rorl	$9,%r14d
	psrlq	$2,%xmm6
	xorl	%ecx,%r13d
	xorl	%r8d,%r12d
	pxor	%xmm6,%xmm7
	rorl	$5,%r13d
	xorl	%r10d,%r14d
	andl	%ecx,%r12d
	pshufd	$128,%xmm7,%xmm7
	xorl	%ecx,%r13d
	addl	8(%rsp),%r9d
	movl	%r10d,%r15d
	psrldq	$8,%xmm7
	xorl	%r8d,%r12d
	rorl	$11,%r14d
	xorl	%r11d,%r15d
	addl	%r12d,%r9d
	rorl	$6,%r13d
	paddd	%xmm7,%xmm0
	andl	%r15d,%edi
	xorl	%r10d,%r14d
	addl	%r13d,%r9d
	pshufd	$80,%xmm0,%xmm7
	xorl	%r11d,%edi
	rorl	$2,%r14d
	addl	%r9d,%ebx
	movdqa	%xmm7,%xmm6
	addl	%edi,%r9d
	movl	%ebx,%r13d
	psrld	$10,%xmm7
	addl	%r9d,%r14d
	rorl	$14,%r13d
	psrlq	$17,%xmm6
	movl	%r14d,%r9d
	movl	%ecx,%r12d
	pxor	%xmm6,%xmm7
	rorl	$9,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r12d
	rorl	$5,%r13d
	xorl	%r9d,%r14d
	psrlq	$2,%xmm6
	andl	%ebx,%r12d
	xorl	%ebx,%r13d
	addl	12(%rsp),%r8d
	pxor	%xmm6,%xmm7
	movl	%r9d,%edi
	xorl	%edx,%r12d
	rorl	$11,%r14d
	pshufd	$8,%xmm7,%xmm7
	xorl	%r10d,%edi
	addl	%r12d,%r8d
	movdqa	0(%rbp),%xmm6
	rorl	$6,%r13d
	andl	%edi,%r15d
	pslldq	$8,%xmm7
	xorl	%r9d,%r14d
	addl	%r13d,%r8d
	xorl	%r10d,%r15d
	paddd	%xmm7,%xmm0
	rorl	$2,%r14d
	addl	%r8d,%eax
	addl	%r15d,%r8d
	paddd	%xmm0,%xmm6
	movl	%eax,%r13d
	addl	%r8d,%r14d
	movdqa	%xmm6,0(%rsp)
	rorl	$14,%r13d
	movdqa	%xmm2,%xmm4
	movl	%r14d,%r8d
	movl	%ebx,%r12d
	movdqa	%xmm0,%xmm7
	rorl	$9,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r12d
	rorl	$5,%r13d
	xorl	%r8d,%r14d
.byte	102,15,58,15,225,4
	andl	%eax,%r12d
	xorl	%eax,%r13d
.byte	102,15,58,15,251,4
	addl	16(%rsp),%edx
	movl	%r8d,%r15d
	xorl	%ecx,%r12d
	rorl	$11,%r14d
	movdqa	%xmm4,%xmm5
	xorl	%r9d,%r15d
	addl	%r12d,%edx
	movdqa	%xmm4,%xmm6
	rorl	$6,%r13d
	andl	%r15d,%edi
	psrld	$3,%xmm4
	xorl	%r8d,%r14d
	addl	%r13d,%edx
	xorl	%r9d,%edi
	paddd	%xmm7,%xmm1
	rorl	$2,%r14d
	addl	%edx,%r11d
	psrld	$7,%xmm6
	addl	%edi,%edx
	movl	%r11d,%r13d
	pshufd	$250,%xmm0,%xmm7
	addl	%edx,%r14d
	rorl	$14,%r13d
	pslld	$14,%xmm5
	movl	%r14d,%edx
	movl	%eax,%r12d
	pxor	%xmm6,%xmm4
	rorl	$9,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r12d
	rorl	$5,%r13d
	psrld	$11,%xmm6
	xorl	%edx,%r14d
	pxor	%xmm5,%xmm4
	andl	%r11d,%r12d
	xorl	%r11d,%r13d
	pslld	$11,%xmm5
	addl	20(%rsp),%ecx
	movl	%edx,%edi
	pxor	%xmm6,%xmm4
	xorl	%ebx,%r12d
	rorl	$11,%r14d
	movdqa	%xmm7,%xmm6
	xorl	%r8d,%edi
	addl	%r12d,%ecx
	pxor	%xmm5,%xmm4
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%edx,%r14d
	psrld	$10,%xmm7
	addl	%r13d,%ecx
	xorl	%r8d,%r15d
	paddd	%xmm4,%xmm1
	rorl	$2,%r14d
	addl	%ecx,%r10d
	psrlq	$17,%xmm6
	addl	%r15d,%ecx
	movl	%r10d,%r13d
	addl	%ecx,%r14d
	pxor	%xmm6,%xmm7
	rorl	$14,%r13d
	movl	%r14d,%ecx
	movl	%r11d,%r12d
	rorl	$9,%r14d
	psrlq	$2,%xmm6
	xorl	%r10d,%r13d
	xorl	%eax,%r12d
	pxor	%xmm6,%xmm7
	rorl	$5,%r13d
	xorl	%ecx,%r14d
	andl	%r10d,%r12d
	pshufd	$128,%xmm7,%xmm7
	xorl	%r10d,%r13d
	addl	24(%rsp),%ebx
	movl	%ecx,%r15d
	psrldq	$8,%xmm7
	xorl	%eax,%r12d
	rorl	$11,%r14d
	xorl	%edx,%r15d
	addl	%r12d,%ebx
	rorl	$6,%r13d
	paddd	%xmm7,%xmm1
	andl	%r15d,%edi
	xorl	%ecx,%r14d
	addl	%r13d,%ebx
	pshufd	$80,%xmm1,%xmm7
	xorl	%edx,%edi
	rorl	$2,%r14d
	addl	%ebx,%r9d
	movdqa	%xmm7,%xmm6
	addl	%edi,%ebx
	movl	%r9d,%r13d
	psrld	$10,%xmm7
	addl	%ebx,%r14d
	rorl	$14,%r13d
	psrlq	$17,%xmm6
	movl	%r14d,%ebx
	movl	%r10d,%r12d
	pxor	%xmm6,%xmm7
	rorl	$9,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r12d
	rorl	$5,%r13d
	xorl	%ebx,%r14d
	psrlq	$2,%xmm6
	andl	%r9d,%r12d
	xorl	%r9d,%r13d
	addl	28(%rsp),%eax
	pxor	%xmm6,%xmm7
	movl	%ebx,%edi
	xorl	%r11d,%r12d
	rorl	$11,%r14d
	pshufd	$8,%xmm7,%xmm7
	xorl	%ecx,%edi
	addl	%r12d,%eax
	movdqa	32(%rbp),%xmm6
	rorl	$6,%r13d
	andl	%edi,%r15d
	pslldq	$8,%xmm7
	xorl	%ebx,%r14d
	addl	%r13d,%eax
	xorl	%ecx,%r15d
	paddd	%xmm7,%xmm1
	rorl	$2,%r14d
	addl	%eax,%r8d
	addl	%r15d,%eax
	paddd	%xmm1,%xmm6
	movl	%r8d,%r13d
	addl	%eax,%r14d
	movdqa	%xmm6,16(%rsp)
	rorl	$14,%r13d
	movdqa	%xmm3,%xmm4
	movl	%r14d,%eax
	movl	%r9d,%r12d
	movdqa	%xmm1,%xmm7
	rorl	$9,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r12d
	rorl	$5,%r13d
	xorl	%eax,%r14d
.byte	102,15,58,15,226,4
	andl	%r8d,%r12d
	xorl	%r8d,%r13d
.byte	102,15,58,15,248,4
	addl	32(%rsp),%r11d
	movl	%eax,%r15d
	xorl	%r10d,%r12d
	rorl	$11,%r14d
	movdqa	%xmm4,%xmm5
	xorl	%ebx,%r15d
	addl	%r12d,%r11d
	movdqa	%xmm4,%xmm6
	rorl	$6,%r13d
	andl	%r15d,%edi
	psrld	$3,%xmm4
	xorl	%eax,%r14d
	addl	%r13d,%r11d
	xorl	%ebx,%edi
	paddd	%xmm7,%xmm2
	rorl	$2,%r14d
	addl	%r11d,%edx
	psrld	$7,%xmm6
	addl	%edi,%r11d
	movl	%edx,%r13d
	pshufd	$250,%xmm1,%xmm7
	addl	%r11d,%r14d
	rorl	$14,%r13d
	pslld	$14,%xmm5
	movl	%r14d,%r11d
	movl	%r8d,%r12d
	pxor	%xmm6,%xmm4
	rorl	$9,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r12d
	rorl	$5,%r13d
	psrld	$11,%xmm6
	xorl	%r11d,%r14d
	pxor	%xmm5,%xmm4
	andl	%edx,%r12d
	xorl	%edx,%r13d
	pslld	$11,%xmm5
	addl	36(%rsp),%r10d
	movl	%r11d,%edi
	pxor	%xmm6,%xmm4
	xorl	%r9d,%r12d
	rorl	$11,%r14d
	movdqa	%xmm7,%xmm6
	xorl	%eax,%edi
	addl	%r12d,%r10d
	pxor	%xmm5,%xmm4
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%r11d,%r14d
	psrld	$10,%xmm7
	addl	%r13d,%r10d
	xorl	%eax,%r15d
	paddd	%xmm4,%xmm2
	rorl	$2,%r14d
	addl	%r10d,%ecx
	psrlq	$17,%xmm6
	addl	%r15d,%r10d
	movl	%ecx,%r13d
	addl	%r10d,%r14d
	pxor	%xmm6,%xmm7
	rorl	$14,%r13d
	movl	%r14d,%r10d
	movl	%edx,%r12d
	rorl	$9,%r14d
	psrlq	$2,%xmm6
	xorl	%ecx,%r13d
	xorl	%r8d,%r12d
	pxor	%xmm6,%xmm7
	rorl	$5,%r13d
	xorl	%r10d,%r14d
	andl	%ecx,%r12d
	pshufd	$128,%xmm7,%xmm7
	xorl	%ecx,%r13d
	addl	40(%rsp),%r9d
	movl	%r10d,%r15d
	psrldq	$8,%xmm7
	xorl	%r8d,%r12d
	rorl	$11,%r14d
	xorl	%r11d,%r15d
	addl	%r12d,%r9d
	rorl	$6,%r13d
	paddd	%xmm7,%xmm2
	andl	%r15d,%edi
	xorl	%r10d,%r14d
	addl	%r13d,%r9d
	pshufd	$80,%xmm2,%xmm7
	xorl	%r11d,%edi
	rorl	$2,%r14d
	addl	%r9d,%ebx
	movdqa	%xmm7,%xmm6
	addl	%edi,%r9d
	movl	%ebx,%r13d
	psrld	$10,%xmm7
	addl	%r9d,%r14d
	rorl	$14,%r13d
	psrlq	$17,%xmm6
	movl	%r14d,%r9d
	movl	%ecx,%r12d
	pxor	%xmm6,%xmm7
	rorl	$9,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r12d
	rorl	$5,%r13d
	xorl	%r9d,%r14d
	psrlq	$2,%xmm6
	andl	%ebx,%r12d
	xorl	%ebx,%r13d
	addl	44(%rsp),%r8d
	pxor	%xmm6,%xmm7
	movl	%r9d,%edi
	xorl	%edx,%r12d
	rorl	$11,%r14d
	pshufd	$8,%xmm7,%xmm7
	xorl	%r10d,%edi
	addl	%r12d,%r8d
	movdqa	64(%rbp),%xmm6
	rorl	$6,%r13d
	andl	%edi,%r15d
	pslldq	$8,%xmm7
	xorl	%r9d,%r14d
	addl	%r13d,%r8d
	xorl	%r10d,%r15d
	paddd	%xmm7,%xmm2
	rorl	$2,%r14d
	addl	%r8d,%eax
	addl	%r15d,%r8d
	paddd	%xmm2,%xmm6
	movl	%eax,%r13d
	addl	%r8d,%r14d
	movdqa	%xmm6,32(%rsp)
	rorl	$14,%r13d
	movdqa	%xmm0,%xmm4
	movl	%r14d,%r8d
	movl	%ebx,%r12d
	movdqa	%xmm2,%xmm7
	rorl	$9,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r12d
	rorl	$5,%r13d
	xorl	%r8d,%r14d
.byte	102,15,58,15,227,4
	andl	%eax,%r12d
	xorl	%eax,%r13d
.byte	102,15,58,15,249,4
	addl	48(%rsp),%edx
	movl	%r8d,%r15d
	xorl	%ecx,%r12d
	rorl	$11,%r14d
	movdqa	%xmm4,%xmm5
	xorl	%r9d,%r15d
	addl	%r12d,%edx
	movdqa	%xmm4,%xmm6
	rorl	$6,%r13d
	andl	%r15d,%edi
	psrld	$3,%xmm4
	xorl	%r8d,%r14d
	addl	%r13d,%edx
	xorl	%r9d,%edi
	paddd	%xmm7,%xmm3
	rorl	$2,%r14d
	addl	%edx,%r11d
	psrld	$7,%xmm6
	addl	%edi,%edx
	movl	%r11d,%r13d
	pshufd	$250,%xmm2,%xmm7
	addl	%edx,%r14d
	rorl	$14,%r13d
	pslld	$14,%xmm5
	movl	%r14d,%edx
	movl	%eax,%r12d
	pxor	%xmm6,%xmm4
	rorl	$9,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r12d
	rorl	$5,%r13d
	psrld	$11,%xmm6
	xorl	%edx,%r14d
	pxor	%xmm5,%xmm4
	andl	%r11d,%r12d
	xorl	%r11d,%r13d
	pslld	$11,%xmm5
	addl	52(%rsp),%ecx
	movl	%edx,%edi
	pxor	%xmm6,%xmm4
	xorl	%ebx,%r12d
	rorl	$11,%r14d
	movdqa	%xmm7,%xmm6
	xorl	%r8d,%edi
	addl	%r12d,%ecx
	pxor	%xmm5,%xmm4
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%edx,%r14d
	psrld	$10,%xmm7
	addl	%r13d,%ecx
	xorl	%r8d,%r15d
	paddd	%xmm4,%xmm3
	rorl	$2,%r14d
	addl	%ecx,%r10d
	psrlq	$17,%xmm6
	addl	%r15d,%ecx
	movl	%r10d,%r13d
	addl	%ecx,%r14d
	pxor	%xmm6,%xmm7
	rorl	$14,%r13d
	movl	%r14d,%ecx
	movl	%r11d,%r12d
	rorl	$9,%r14d
	psrlq	$2,%xmm6
	xorl	%r10d,%r13d
	xorl	%eax,%r12d
	pxor	%xmm6,%xmm7
	rorl	$5,%r13d
	xorl	%ecx,%r14d
	andl	%r10d,%r12d
	pshufd	$128,%xmm7,%xmm7
	xorl	%r10d,%r13d
	addl	56(%rsp),%ebx
	movl	%ecx,%r15d
	psrldq	$8,%xmm7
	xorl	%eax,%r12d
	rorl	$11,%r14d
	xorl	%edx,%r15d
	addl	%r12d,%ebx
	rorl	$6,%r13d
	paddd	%xmm7,%xmm3
	andl	%r15d,%edi
	xorl	%ecx,%r14d
	addl	%r13d,%ebx
	pshufd	$80,%xmm3,%xmm7
	xorl	%edx,%edi
	rorl	$2,%r14d
	addl	%ebx,%r9d
	movdqa	%xmm7,%xmm6
	addl	%edi,%ebx
	movl	%r9d,%r13d
	psrld	$10,%xmm7
	addl	%ebx,%r14d
	rorl	$14,%r13d
	psrlq	$17,%xmm6
	movl	%r14d,%ebx
	movl	%r10d,%r12d
	pxor	%xmm6,%xmm7
	rorl	$9,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r12d
	rorl	$5,%r13d
	xorl	%ebx,%r14d
	psrlq	$2,%xmm6
	andl	%r9d,%r12d
	xorl	%r9d,%r13d
	addl	60(%rsp),%eax
	pxor	%xmm6,%xmm7
	movl	%ebx,%edi
	xorl	%r11d,%r12d
	rorl	$11,%r14d
	pshufd	$8,%xmm7,%xmm7
	xorl	%ecx,%edi
	addl	%r12d,%eax
	movdqa	96(%rbp),%xmm6
	rorl	$6,%r13d
	andl	%edi,%r15d
	pslldq	$8,%xmm7
	xorl	%ebx,%r14d
	addl	%r13d,%eax
	xorl	%ecx,%r15d
	paddd	%xmm7,%xmm3
	rorl	$2,%r14d
	addl	%eax,%r8d
	addl	%r15d,%eax
	paddd	%xmm3,%xmm6
	movl	%r8d,%r13d
	addl	%eax,%r14d
	movdqa	%xmm6,48(%rsp)
	cmpb	$0,131(%rbp)
	jne	.Lssse3_00_47
	rorl	$14,%r13d
	movl	%r14d,%eax
	movl	%r9d,%r12d
	rorl	$9,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r12d
	rorl	$5,%r13d
	xorl	%eax,%r14d
	andl	%r8d,%r12d
	xorl	%r8d,%r13d
	addl	0(%rsp),%r11d
	movl	%eax,%r15d
	xorl	%r10d,%r12d
	rorl	$11,%r14d
	xorl	%ebx,%r15d
	addl	%r12d,%r11d
	rorl	$6,%r13d
	andl	%r15d,%edi
	xorl	%eax,%r14d
	addl	%r13d,%r11d
	xorl	%ebx,%edi
	rorl	$2,%r14d
	addl	%r11d,%edx
	addl	%edi,%r11d
	movl	%edx,%r13d
	addl	%r11d,%r14d
	rorl	$14,%r13d
	movl	%r14d,%r11d
	movl	%r8d,%r12d
	rorl	$9,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r12d
	rorl	$5,%r13d
	xorl	%r11d,%r14d
	andl	%edx,%r12d
	xorl	%edx,%r13d
	addl	4(%rsp),%r10d
	movl	%r11d,%edi
	xorl	%r9d,%r12d
	rorl	$11,%r14d
	xorl	%eax,%edi
	addl	%r12d,%r10d
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%r11d,%r14d
	addl	%r13d,%r10d
	xorl	%eax,%r15d
	rorl	$2,%r14d
	addl	%r10d,%ecx
	addl	%r15d,%r10d
	movl	%ecx,%r13d
	addl	%r10d,%r14d
	rorl	$14,%r13d
	movl	%r14d,%r10d
	movl	%edx,%r12d
	rorl	$9,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r12d
	rorl	$5,%r13d
	xorl	%r10d,%r14d
	andl	%ecx,%r12d
	xorl	%ecx,%r13d
	addl	8(%rsp),%r9d
	movl	%r10d,%r15d
	xorl	%r8d,%r12d
	rorl	$11,%r14d
	xorl	%r11d,%r15d
	addl	%r12d,%r9d
	rorl	$6,%r13d
	andl	%r15d,%edi
	xorl	%r10d,%r14d
	addl	%r13d,%r9d
	xorl	%r11d,%edi
	rorl	$2,%r14d
	addl	%r9d,%ebx
	addl	%edi,%r9d
	movl	%ebx,%r13d
	addl	%r9d,%r14d
	rorl	$14,%r13d
	movl	%r14d,%r9d
	movl	%ecx,%r12d
	rorl	$9,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r12d
	rorl	$5,%r13d
	xorl	%r9d,%r14d
	andl	%ebx,%r12d
	xorl	%ebx,%r13d
	addl	12(%rsp),%r8d
	movl	%r9d,%edi
	xorl	%edx,%r12d
	rorl	$11,%r14d
	xorl	%r10d,%edi
	addl	%r12d,%r8d
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%r9d,%r14d
	addl	%r13d,%r8d
	xorl	%r10d,%r15d
	rorl	$2,%r14d
	addl	%r8d,%eax
	addl	%r15d,%r8d
	movl	%eax,%r13d
	addl	%r8d,%r14d
	rorl	$14,%r13d
	movl	%r14d,%r8d
	movl	%ebx,%r12d
	rorl	$9,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r12d
	rorl	$5,%r13d
	xorl	%r8d,%r14d
	andl	%eax,%r12d
	xorl	%eax,%r13d
	addl	16(%rsp),%edx
	movl	%r8d,%r15d
	xorl	%ecx,%r12d
	rorl	$11,%r14d
	xorl	%r9d,%r15d
	addl	%r12d,%edx
	rorl	$6,%r13d
	andl	%r15d,%edi
	xorl	%r8d,%r14d
	addl	%r13d,%edx
	xorl	%r9d,%edi
	rorl	$2,%r14d
	addl	%edx,%r11d
	addl	%edi,%edx
	movl	%r11d,%r13d
	addl	%edx,%r14d
	rorl	$14,%r13d
	movl	%r14d,%edx
	movl	%eax,%r12d
	rorl	$9,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r12d
	rorl	$5,%r13d
	xorl	%edx,%r14d
	andl	%r11d,%r12d
	xorl	%r11d,%r13d
	addl	20(%rsp),%ecx
	movl	%edx,%edi
	xorl	%ebx,%r12d
	rorl	$11,%r14d
	xorl	%r8d,%edi
	addl	%r12d,%ecx
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%edx,%r14d
	addl	%r13d,%ecx
	xorl	%r8d,%r15d
	rorl	$2,%r14d
	addl	%ecx,%r10d
	addl	%r15d,%ecx
	movl	%r10d,%r13d
	addl	%ecx,%r14d
	rorl	$14,%r13d
	movl	%r14d,%ecx
	movl	%r11d,%r12d
	rorl	$9,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r12d
	rorl	$5,%r13d
	xorl	%ecx,%r14d
	andl	%r10d,%r12d
	xorl	%r10d,%r13d
	addl	24(%rsp),%ebx
	movl	%ecx,%r15d
	xorl	%eax,%r12d
	rorl	$11,%r14d
	xorl	%edx,%r15d
	addl	%r12d,%ebx
	rorl	$6,%r13d
	andl	%r15d,%edi
	xorl	%ecx,%r14d
	addl	%r13d,%ebx
	xorl	%edx,%edi
	rorl	$2,%r14d
	addl	%ebx,%r9d
	addl	%edi,%ebx
	movl	%r9d,%r13d
	addl	%ebx,%r14d
	rorl	$14,%r13d
	movl	%r14d,%ebx
	movl	%r10d,%r12d
	rorl	$9,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r12d
	rorl	$5,%r13d
	xorl	%ebx,%r14d
	andl	%r9d,%r12d
	xorl	%r9d,%r13d
	addl	28(%rsp),%eax
	movl	%ebx,%edi
	xorl	%r11d,%r12d
	rorl	$11,%r14d
	xorl	%ecx,%edi
	addl	%r12d,%eax
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%ebx,%r14d
	addl	%r13d,%eax
	xorl	%ecx,%r15d
	rorl	$2,%r14d
	addl	%eax,%r8d
	addl	%r15d,%eax
	movl	%r8d,%r13d
	addl	%eax,%r14d
	rorl	$14,%r13d
	movl	%r14d,%eax
	movl	%r9d,%r12d
	rorl	$9,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r12d
	rorl	$5,%r13d
	xorl	%eax,%r14d
	andl	%r8d,%r12d
	xorl	%r8d,%r13d
	addl	32(%rsp),%r11d
	movl	%eax,%r15d
	xorl	%r10d,%r12d
	rorl	$11,%r14d
	xorl	%ebx,%r15d
	addl	%r12d,%r11d
	rorl	$6,%r13d
	andl	%r15d,%edi
	xorl	%eax,%r14d
	addl	%r13d,%r11d
	xorl	%ebx,%edi
	rorl	$2,%r14d
	addl	%r11d,%edx
	addl	%edi,%r11d
	movl	%edx,%r13d
	addl	%r11d,%r14d
	rorl	$14,%r13d
	movl	%r14d,%r11d
	movl	%r8d,%r12d
	rorl	$9,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r12d
	rorl	$5,%r13d
	xorl	%r11d,%r14d
	andl	%edx,%r12d
	xorl	%edx,%r13d
	addl	36(%rsp),%r10d
	movl	%r11d,%edi
	xorl	%r9d,%r12d
	rorl	$11,%r14d
	xorl	%eax,%edi
	addl	%r12d,%r10d
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%r11d,%r14d
	addl	%r13d,%r10d
	xorl	%eax,%r15d
	rorl	$2,%r14d
	addl	%r10d,%ecx
	addl	%r15d,%r10d
	movl	%ecx,%r13d
	addl	%r10d,%r14d
	rorl	$14,%r13d
	movl	%r14d,%r10d
	movl	%edx,%r12d
	rorl	$9,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r12d
	rorl	$5,%r13d
	xorl	%r10d,%r14d
	andl	%ecx,%r12d
	xorl	%ecx,%r13d
	addl	40(%rsp),%r9d
	movl	%r10d,%r15d
	xorl	%r8d,%r12d
	rorl	$11,%r14d
	xorl	%r11d,%r15d
	addl	%r12d,%r9d
	rorl	$6,%r13d
	andl	%r15d,%edi
	xorl	%r10d,%r14d
	addl	%r13d,%r9d
	xorl	%r11d,%edi
	rorl	$2,%r14d
	addl	%r9d,%ebx
	addl	%edi,%r9d
	movl	%ebx,%r13d
	addl	%r9d,%r14d
	rorl	$14,%r13d
	movl	%r14d,%r9d
	movl	%ecx,%r12d
	rorl	$9,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r12d
	rorl	$5,%r13d
	xorl	%r9d,%r14d
	andl	%ebx,%r12d
	xorl	%ebx,%r13d
	addl	44(%rsp),%r8d
	movl	%r9d,%edi
	xorl	%edx,%r12d
	rorl	$11,%r14d
	xorl	%r10d,%edi
	addl	%r12d,%r8d
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%r9d,%r14d
	addl	%r13d,%r8d
	xorl	%r10d,%r15d
	rorl	$2,%r14d
	addl	%r8d,%eax
	addl	%r15d,%r8d
	movl	%eax,%r13d
	addl	%r8d,%r14d
	rorl	$14,%r13d
	movl	%r14d,%r8d
	movl	%ebx,%r12d
	rorl	$9,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r12d
	rorl	$5,%r13d
	xorl	%r8d,%r14d
	andl	%eax,%r12d
	xorl	%eax,%r13d
	addl	48(%rsp),%edx
	movl	%r8d,%r15d
	xorl	%ecx,%r12d
	rorl	$11,%r14d
	xorl	%r9d,%r15d
	addl	%r12d,%edx
	rorl	$6,%r13d
	andl	%r15d,%edi
	xorl	%r8d,%r14d
	addl	%r13d,%edx
	xorl	%r9d,%edi
	rorl	$2,%r14d
	addl	%edx,%r11d
	addl	%edi,%edx
	movl	%r11d,%r13d
	addl	%edx,%r14d
	rorl	$14,%r13d
	movl	%r14d,%edx
	movl	%eax,%r12d
	rorl	$9,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r12d
	rorl	$5,%r13d
	xorl	%edx,%r14d
	andl	%r11d,%r12d
	xorl	%r11d,%r13d
	addl	52(%rsp),%ecx
	movl	%edx,%edi
	xorl	%ebx,%r12d
	rorl	$11,%r14d
	xorl	%r8d,%edi
	addl	%r12d,%ecx
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%edx,%r14d
	addl	%r13d,%ecx
	xorl	%r8d,%r15d
	rorl	$2,%r14d
	addl	%ecx,%r10d
	addl	%r15d,%ecx
	movl	%r10d,%r13d
	addl	%ecx,%r14d
	rorl	$14,%r13d
	movl	%r14d,%ecx
	movl	%r11d,%r12d
	rorl	$9,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r12d
	rorl	$5,%r13d
	xorl	%ecx,%r14d
	andl	%r10d,%r12d
	xorl	%r10d,%r13d
	addl	56(%rsp),%ebx
	movl	%ecx,%r15d
	xorl	%eax,%r12d
	rorl	$11,%r14d
	xorl	%edx,%r15d
	addl	%r12d,%ebx
	rorl	$6,%r13d
	andl	%r15d,%edi
	xorl	%ecx,%r14d
	addl	%r13d,%ebx
	xorl	%edx,%edi
	rorl	$2,%r14d
	addl	%ebx,%r9d
	addl	%edi,%ebx
	movl	%r9d,%r13d
	addl	%ebx,%r14d
	rorl	$14,%r13d
	movl	%r14d,%ebx
	movl	%r10d,%r12d
	rorl	$9,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r12d
	rorl	$5,%r13d
	xorl	%ebx,%r14d
	andl	%r9d,%r12d
	xorl	%r9d,%r13d
	addl	60(%rsp),%eax
	movl	%ebx,%edi
	xorl	%r11d,%r12d
	rorl	$11,%r14d
	xorl	%ecx,%edi
	addl	%r12d,%eax
	rorl	$6,%r13d
	andl	%edi,%r15d
	xorl	%ebx,%r14d
	addl	%r13d,%eax
	xorl	%ecx,%r15d
	rorl	$2,%r14d
	addl	%eax,%r8d
	addl	%r15d,%eax
	movl	%r8d,%r13d
	addl	%eax,%r14d
	movq	64+0(%rsp),%rdi
	movl	%r14d,%eax

	addl	0(%rdi),%eax
	leaq	64(%rsi),%rsi
	addl	4(%rdi),%ebx
	addl	8(%rdi),%ecx
	addl	12(%rdi),%edx
	addl	16(%rdi),%r8d
	addl	20(%rdi),%r9d
	addl	24(%rdi),%r10d
	addl	28(%rdi),%r11d

	cmpq	64+16(%rsp),%rsi

	movl	%eax,0(%rdi)
	movl	%ebx,4(%rdi)
	movl	%ecx,8(%rdi)
	movl	%edx,12(%rdi)
	movl	%r8d,16(%rdi)
	movl	%r9d,20(%rdi)
	movl	%r10d,24(%rdi)
	movl	%r11d,28(%rdi)
	jb	.Lloop_ssse3

	movq	88(%rsp),%rsi

	movaps	64+32(%rsp),%xmm6
	movaps	64+48(%rsp),%xmm7
	movaps	64+64(%rsp),%xmm8
	movaps	64+80(%rsp),%xmm9
	movq	-48(%rsi),%r15

	movq	-40(%rsi),%r14

	movq	-32(%rsi),%r13

	movq	-24(%rsi),%r12

	movq	-16(%rsi),%rbp

	movq	-8(%rsi),%rbx

	leaq	(%rsi),%rsp

.Lepilogue_ssse3:
	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3

.LSEH_end_sha256_block_data_order_ssse3:
.def	sha256_block_data_order_avx;	.scl 3;	.type 32;	.endef
.p2align	6
sha256_block_data_order_avx:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_sha256_block_data_order_avx:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx


.Lavx_shortcut:
	movq	%rsp,%rax

	pushq	%rbx

	pushq	%rbp

	pushq	%r12

	pushq	%r13

	pushq	%r14

	pushq	%r15

	shlq	$4,%rdx
	subq	$160,%rsp
	leaq	(%rsi,%rdx,4),%rdx
	andq	$-64,%rsp
	movq	%rdi,64+0(%rsp)
	movq	%rsi,64+8(%rsp)
	movq	%rdx,64+16(%rsp)
	movq	%rax,88(%rsp)

	movaps	%xmm6,64+32(%rsp)
	movaps	%xmm7,64+48(%rsp)
	movaps	%xmm8,64+64(%rsp)
	movaps	%xmm9,64+80(%rsp)
.Lprologue_avx:

	vzeroupper
	movl	0(%rdi),%eax
	movl	4(%rdi),%ebx
	movl	8(%rdi),%ecx
	movl	12(%rdi),%edx
	movl	16(%rdi),%r8d
	movl	20(%rdi),%r9d
	movl	24(%rdi),%r10d
	movl	28(%rdi),%r11d
	vmovdqa	K256+512+32(%rip),%xmm8
	vmovdqa	K256+512+64(%rip),%xmm9
	jmp	.Lloop_avx
.p2align	4
.Lloop_avx:
	vmovdqa	K256+512(%rip),%xmm7
	vmovdqu	0(%rsi),%xmm0
	vmovdqu	16(%rsi),%xmm1
	vmovdqu	32(%rsi),%xmm2
	vmovdqu	48(%rsi),%xmm3
	vpshufb	%xmm7,%xmm0,%xmm0
	leaq	K256(%rip),%rbp
	vpshufb	%xmm7,%xmm1,%xmm1
	vpshufb	%xmm7,%xmm2,%xmm2
	vpaddd	0(%rbp),%xmm0,%xmm4
	vpshufb	%xmm7,%xmm3,%xmm3
	vpaddd	32(%rbp),%xmm1,%xmm5
	vpaddd	64(%rbp),%xmm2,%xmm6
	vpaddd	96(%rbp),%xmm3,%xmm7
	vmovdqa	%xmm4,0(%rsp)
	movl	%eax,%r14d
	vmovdqa	%xmm5,16(%rsp)
	movl	%ebx,%edi
	vmovdqa	%xmm6,32(%rsp)
	xorl	%ecx,%edi
	vmovdqa	%xmm7,48(%rsp)
	movl	%r8d,%r13d
	jmp	.Lavx_00_47

.p2align	4
.Lavx_00_47:
	subq	$-128,%rbp
	vpalignr	$4,%xmm0,%xmm1,%xmm4
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%eax
	movl	%r9d,%r12d
	vpalignr	$4,%xmm2,%xmm3,%xmm7
	shrdl	$9,%r14d,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r12d
	vpsrld	$7,%xmm4,%xmm6
	shrdl	$5,%r13d,%r13d
	xorl	%eax,%r14d
	andl	%r8d,%r12d
	vpaddd	%xmm7,%xmm0,%xmm0
	xorl	%r8d,%r13d
	addl	0(%rsp),%r11d
	movl	%eax,%r15d
	vpsrld	$3,%xmm4,%xmm7
	xorl	%r10d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%ebx,%r15d
	vpslld	$14,%xmm4,%xmm5
	addl	%r12d,%r11d
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	vpxor	%xmm6,%xmm7,%xmm4
	xorl	%eax,%r14d
	addl	%r13d,%r11d
	xorl	%ebx,%edi
	vpshufd	$250,%xmm3,%xmm7
	shrdl	$2,%r14d,%r14d
	addl	%r11d,%edx
	addl	%edi,%r11d
	vpsrld	$11,%xmm6,%xmm6
	movl	%edx,%r13d
	addl	%r11d,%r14d
	shrdl	$14,%r13d,%r13d
	vpxor	%xmm5,%xmm4,%xmm4
	movl	%r14d,%r11d
	movl	%r8d,%r12d
	shrdl	$9,%r14d,%r14d
	vpslld	$11,%xmm5,%xmm5
	xorl	%edx,%r13d
	xorl	%r9d,%r12d
	shrdl	$5,%r13d,%r13d
	vpxor	%xmm6,%xmm4,%xmm4
	xorl	%r11d,%r14d
	andl	%edx,%r12d
	xorl	%edx,%r13d
	vpsrld	$10,%xmm7,%xmm6
	addl	4(%rsp),%r10d
	movl	%r11d,%edi
	xorl	%r9d,%r12d
	vpxor	%xmm5,%xmm4,%xmm4
	shrdl	$11,%r14d,%r14d
	xorl	%eax,%edi
	addl	%r12d,%r10d
	vpsrlq	$17,%xmm7,%xmm7
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%r11d,%r14d
	vpaddd	%xmm4,%xmm0,%xmm0
	addl	%r13d,%r10d
	xorl	%eax,%r15d
	shrdl	$2,%r14d,%r14d
	vpxor	%xmm7,%xmm6,%xmm6
	addl	%r10d,%ecx
	addl	%r15d,%r10d
	movl	%ecx,%r13d
	vpsrlq	$2,%xmm7,%xmm7
	addl	%r10d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r10d
	vpxor	%xmm7,%xmm6,%xmm6
	movl	%edx,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%ecx,%r13d
	vpshufb	%xmm8,%xmm6,%xmm6
	xorl	%r8d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r10d,%r14d
	vpaddd	%xmm6,%xmm0,%xmm0
	andl	%ecx,%r12d
	xorl	%ecx,%r13d
	addl	8(%rsp),%r9d
	vpshufd	$80,%xmm0,%xmm7
	movl	%r10d,%r15d
	xorl	%r8d,%r12d
	shrdl	$11,%r14d,%r14d
	vpsrld	$10,%xmm7,%xmm6
	xorl	%r11d,%r15d
	addl	%r12d,%r9d
	shrdl	$6,%r13d,%r13d
	vpsrlq	$17,%xmm7,%xmm7
	andl	%r15d,%edi
	xorl	%r10d,%r14d
	addl	%r13d,%r9d
	vpxor	%xmm7,%xmm6,%xmm6
	xorl	%r11d,%edi
	shrdl	$2,%r14d,%r14d
	addl	%r9d,%ebx
	vpsrlq	$2,%xmm7,%xmm7
	addl	%edi,%r9d
	movl	%ebx,%r13d
	addl	%r9d,%r14d
	vpxor	%xmm7,%xmm6,%xmm6
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r9d
	movl	%ecx,%r12d
	vpshufb	%xmm9,%xmm6,%xmm6
	shrdl	$9,%r14d,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r12d
	vpaddd	%xmm6,%xmm0,%xmm0
	shrdl	$5,%r13d,%r13d
	xorl	%r9d,%r14d
	andl	%ebx,%r12d
	vpaddd	0(%rbp),%xmm0,%xmm6
	xorl	%ebx,%r13d
	addl	12(%rsp),%r8d
	movl	%r9d,%edi
	xorl	%edx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r10d,%edi
	addl	%r12d,%r8d
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%r9d,%r14d
	addl	%r13d,%r8d
	xorl	%r10d,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%r8d,%eax
	addl	%r15d,%r8d
	movl	%eax,%r13d
	addl	%r8d,%r14d
	vmovdqa	%xmm6,0(%rsp)
	vpalignr	$4,%xmm1,%xmm2,%xmm4
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r8d
	movl	%ebx,%r12d
	vpalignr	$4,%xmm3,%xmm0,%xmm7
	shrdl	$9,%r14d,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r12d
	vpsrld	$7,%xmm4,%xmm6
	shrdl	$5,%r13d,%r13d
	xorl	%r8d,%r14d
	andl	%eax,%r12d
	vpaddd	%xmm7,%xmm1,%xmm1
	xorl	%eax,%r13d
	addl	16(%rsp),%edx
	movl	%r8d,%r15d
	vpsrld	$3,%xmm4,%xmm7
	xorl	%ecx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r9d,%r15d
	vpslld	$14,%xmm4,%xmm5
	addl	%r12d,%edx
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	vpxor	%xmm6,%xmm7,%xmm4
	xorl	%r8d,%r14d
	addl	%r13d,%edx
	xorl	%r9d,%edi
	vpshufd	$250,%xmm0,%xmm7
	shrdl	$2,%r14d,%r14d
	addl	%edx,%r11d
	addl	%edi,%edx
	vpsrld	$11,%xmm6,%xmm6
	movl	%r11d,%r13d
	addl	%edx,%r14d
	shrdl	$14,%r13d,%r13d
	vpxor	%xmm5,%xmm4,%xmm4
	movl	%r14d,%edx
	movl	%eax,%r12d
	shrdl	$9,%r14d,%r14d
	vpslld	$11,%xmm5,%xmm5
	xorl	%r11d,%r13d
	xorl	%ebx,%r12d
	shrdl	$5,%r13d,%r13d
	vpxor	%xmm6,%xmm4,%xmm4
	xorl	%edx,%r14d
	andl	%r11d,%r12d
	xorl	%r11d,%r13d
	vpsrld	$10,%xmm7,%xmm6
	addl	20(%rsp),%ecx
	movl	%edx,%edi
	xorl	%ebx,%r12d
	vpxor	%xmm5,%xmm4,%xmm4
	shrdl	$11,%r14d,%r14d
	xorl	%r8d,%edi
	addl	%r12d,%ecx
	vpsrlq	$17,%xmm7,%xmm7
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%edx,%r14d
	vpaddd	%xmm4,%xmm1,%xmm1
	addl	%r13d,%ecx
	xorl	%r8d,%r15d
	shrdl	$2,%r14d,%r14d
	vpxor	%xmm7,%xmm6,%xmm6
	addl	%ecx,%r10d
	addl	%r15d,%ecx
	movl	%r10d,%r13d
	vpsrlq	$2,%xmm7,%xmm7
	addl	%ecx,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%ecx
	vpxor	%xmm7,%xmm6,%xmm6
	movl	%r11d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r10d,%r13d
	vpshufb	%xmm8,%xmm6,%xmm6
	xorl	%eax,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%ecx,%r14d
	vpaddd	%xmm6,%xmm1,%xmm1
	andl	%r10d,%r12d
	xorl	%r10d,%r13d
	addl	24(%rsp),%ebx
	vpshufd	$80,%xmm1,%xmm7
	movl	%ecx,%r15d
	xorl	%eax,%r12d
	shrdl	$11,%r14d,%r14d
	vpsrld	$10,%xmm7,%xmm6
	xorl	%edx,%r15d
	addl	%r12d,%ebx
	shrdl	$6,%r13d,%r13d
	vpsrlq	$17,%xmm7,%xmm7
	andl	%r15d,%edi
	xorl	%ecx,%r14d
	addl	%r13d,%ebx
	vpxor	%xmm7,%xmm6,%xmm6
	xorl	%edx,%edi
	shrdl	$2,%r14d,%r14d
	addl	%ebx,%r9d
	vpsrlq	$2,%xmm7,%xmm7
	addl	%edi,%ebx
	movl	%r9d,%r13d
	addl	%ebx,%r14d
	vpxor	%xmm7,%xmm6,%xmm6
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%ebx
	movl	%r10d,%r12d
	vpshufb	%xmm9,%xmm6,%xmm6
	shrdl	$9,%r14d,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r12d
	vpaddd	%xmm6,%xmm1,%xmm1
	shrdl	$5,%r13d,%r13d
	xorl	%ebx,%r14d
	andl	%r9d,%r12d
	vpaddd	32(%rbp),%xmm1,%xmm6
	xorl	%r9d,%r13d
	addl	28(%rsp),%eax
	movl	%ebx,%edi
	xorl	%r11d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%ecx,%edi
	addl	%r12d,%eax
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%ebx,%r14d
	addl	%r13d,%eax
	xorl	%ecx,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%eax,%r8d
	addl	%r15d,%eax
	movl	%r8d,%r13d
	addl	%eax,%r14d
	vmovdqa	%xmm6,16(%rsp)
	vpalignr	$4,%xmm2,%xmm3,%xmm4
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%eax
	movl	%r9d,%r12d
	vpalignr	$4,%xmm0,%xmm1,%xmm7
	shrdl	$9,%r14d,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r12d
	vpsrld	$7,%xmm4,%xmm6
	shrdl	$5,%r13d,%r13d
	xorl	%eax,%r14d
	andl	%r8d,%r12d
	vpaddd	%xmm7,%xmm2,%xmm2
	xorl	%r8d,%r13d
	addl	32(%rsp),%r11d
	movl	%eax,%r15d
	vpsrld	$3,%xmm4,%xmm7
	xorl	%r10d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%ebx,%r15d
	vpslld	$14,%xmm4,%xmm5
	addl	%r12d,%r11d
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	vpxor	%xmm6,%xmm7,%xmm4
	xorl	%eax,%r14d
	addl	%r13d,%r11d
	xorl	%ebx,%edi
	vpshufd	$250,%xmm1,%xmm7
	shrdl	$2,%r14d,%r14d
	addl	%r11d,%edx
	addl	%edi,%r11d
	vpsrld	$11,%xmm6,%xmm6
	movl	%edx,%r13d
	addl	%r11d,%r14d
	shrdl	$14,%r13d,%r13d
	vpxor	%xmm5,%xmm4,%xmm4
	movl	%r14d,%r11d
	movl	%r8d,%r12d
	shrdl	$9,%r14d,%r14d
	vpslld	$11,%xmm5,%xmm5
	xorl	%edx,%r13d
	xorl	%r9d,%r12d
	shrdl	$5,%r13d,%r13d
	vpxor	%xmm6,%xmm4,%xmm4
	xorl	%r11d,%r14d
	andl	%edx,%r12d
	xorl	%edx,%r13d
	vpsrld	$10,%xmm7,%xmm6
	addl	36(%rsp),%r10d
	movl	%r11d,%edi
	xorl	%r9d,%r12d
	vpxor	%xmm5,%xmm4,%xmm4
	shrdl	$11,%r14d,%r14d
	xorl	%eax,%edi
	addl	%r12d,%r10d
	vpsrlq	$17,%xmm7,%xmm7
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%r11d,%r14d
	vpaddd	%xmm4,%xmm2,%xmm2
	addl	%r13d,%r10d
	xorl	%eax,%r15d
	shrdl	$2,%r14d,%r14d
	vpxor	%xmm7,%xmm6,%xmm6
	addl	%r10d,%ecx
	addl	%r15d,%r10d
	movl	%ecx,%r13d
	vpsrlq	$2,%xmm7,%xmm7
	addl	%r10d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r10d
	vpxor	%xmm7,%xmm6,%xmm6
	movl	%edx,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%ecx,%r13d
	vpshufb	%xmm8,%xmm6,%xmm6
	xorl	%r8d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r10d,%r14d
	vpaddd	%xmm6,%xmm2,%xmm2
	andl	%ecx,%r12d
	xorl	%ecx,%r13d
	addl	40(%rsp),%r9d
	vpshufd	$80,%xmm2,%xmm7
	movl	%r10d,%r15d
	xorl	%r8d,%r12d
	shrdl	$11,%r14d,%r14d
	vpsrld	$10,%xmm7,%xmm6
	xorl	%r11d,%r15d
	addl	%r12d,%r9d
	shrdl	$6,%r13d,%r13d
	vpsrlq	$17,%xmm7,%xmm7
	andl	%r15d,%edi
	xorl	%r10d,%r14d
	addl	%r13d,%r9d
	vpxor	%xmm7,%xmm6,%xmm6
	xorl	%r11d,%edi
	shrdl	$2,%r14d,%r14d
	addl	%r9d,%ebx
	vpsrlq	$2,%xmm7,%xmm7
	addl	%edi,%r9d
	movl	%ebx,%r13d
	addl	%r9d,%r14d
	vpxor	%xmm7,%xmm6,%xmm6
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r9d
	movl	%ecx,%r12d
	vpshufb	%xmm9,%xmm6,%xmm6
	shrdl	$9,%r14d,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r12d
	vpaddd	%xmm6,%xmm2,%xmm2
	shrdl	$5,%r13d,%r13d
	xorl	%r9d,%r14d
	andl	%ebx,%r12d
	vpaddd	64(%rbp),%xmm2,%xmm6
	xorl	%ebx,%r13d
	addl	44(%rsp),%r8d
	movl	%r9d,%edi
	xorl	%edx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r10d,%edi
	addl	%r12d,%r8d
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%r9d,%r14d
	addl	%r13d,%r8d
	xorl	%r10d,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%r8d,%eax
	addl	%r15d,%r8d
	movl	%eax,%r13d
	addl	%r8d,%r14d
	vmovdqa	%xmm6,32(%rsp)
	vpalignr	$4,%xmm3,%xmm0,%xmm4
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r8d
	movl	%ebx,%r12d
	vpalignr	$4,%xmm1,%xmm2,%xmm7
	shrdl	$9,%r14d,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r12d
	vpsrld	$7,%xmm4,%xmm6
	shrdl	$5,%r13d,%r13d
	xorl	%r8d,%r14d
	andl	%eax,%r12d
	vpaddd	%xmm7,%xmm3,%xmm3
	xorl	%eax,%r13d
	addl	48(%rsp),%edx
	movl	%r8d,%r15d
	vpsrld	$3,%xmm4,%xmm7
	xorl	%ecx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r9d,%r15d
	vpslld	$14,%xmm4,%xmm5
	addl	%r12d,%edx
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	vpxor	%xmm6,%xmm7,%xmm4
	xorl	%r8d,%r14d
	addl	%r13d,%edx
	xorl	%r9d,%edi
	vpshufd	$250,%xmm2,%xmm7
	shrdl	$2,%r14d,%r14d
	addl	%edx,%r11d
	addl	%edi,%edx
	vpsrld	$11,%xmm6,%xmm6
	movl	%r11d,%r13d
	addl	%edx,%r14d
	shrdl	$14,%r13d,%r13d
	vpxor	%xmm5,%xmm4,%xmm4
	movl	%r14d,%edx
	movl	%eax,%r12d
	shrdl	$9,%r14d,%r14d
	vpslld	$11,%xmm5,%xmm5
	xorl	%r11d,%r13d
	xorl	%ebx,%r12d
	shrdl	$5,%r13d,%r13d
	vpxor	%xmm6,%xmm4,%xmm4
	xorl	%edx,%r14d
	andl	%r11d,%r12d
	xorl	%r11d,%r13d
	vpsrld	$10,%xmm7,%xmm6
	addl	52(%rsp),%ecx
	movl	%edx,%edi
	xorl	%ebx,%r12d
	vpxor	%xmm5,%xmm4,%xmm4
	shrdl	$11,%r14d,%r14d
	xorl	%r8d,%edi
	addl	%r12d,%ecx
	vpsrlq	$17,%xmm7,%xmm7
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%edx,%r14d
	vpaddd	%xmm4,%xmm3,%xmm3
	addl	%r13d,%ecx
	xorl	%r8d,%r15d
	shrdl	$2,%r14d,%r14d
	vpxor	%xmm7,%xmm6,%xmm6
	addl	%ecx,%r10d
	addl	%r15d,%ecx
	movl	%r10d,%r13d
	vpsrlq	$2,%xmm7,%xmm7
	addl	%ecx,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%ecx
	vpxor	%xmm7,%xmm6,%xmm6
	movl	%r11d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r10d,%r13d
	vpshufb	%xmm8,%xmm6,%xmm6
	xorl	%eax,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%ecx,%r14d
	vpaddd	%xmm6,%xmm3,%xmm3
	andl	%r10d,%r12d
	xorl	%r10d,%r13d
	addl	56(%rsp),%ebx
	vpshufd	$80,%xmm3,%xmm7
	movl	%ecx,%r15d
	xorl	%eax,%r12d
	shrdl	$11,%r14d,%r14d
	vpsrld	$10,%xmm7,%xmm6
	xorl	%edx,%r15d
	addl	%r12d,%ebx
	shrdl	$6,%r13d,%r13d
	vpsrlq	$17,%xmm7,%xmm7
	andl	%r15d,%edi
	xorl	%ecx,%r14d
	addl	%r13d,%ebx
	vpxor	%xmm7,%xmm6,%xmm6
	xorl	%edx,%edi
	shrdl	$2,%r14d,%r14d
	addl	%ebx,%r9d
	vpsrlq	$2,%xmm7,%xmm7
	addl	%edi,%ebx
	movl	%r9d,%r13d
	addl	%ebx,%r14d
	vpxor	%xmm7,%xmm6,%xmm6
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%ebx
	movl	%r10d,%r12d
	vpshufb	%xmm9,%xmm6,%xmm6
	shrdl	$9,%r14d,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r12d
	vpaddd	%xmm6,%xmm3,%xmm3
	shrdl	$5,%r13d,%r13d
	xorl	%ebx,%r14d
	andl	%r9d,%r12d
	vpaddd	96(%rbp),%xmm3,%xmm6
	xorl	%r9d,%r13d
	addl	60(%rsp),%eax
	movl	%ebx,%edi
	xorl	%r11d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%ecx,%edi
	addl	%r12d,%eax
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%ebx,%r14d
	addl	%r13d,%eax
	xorl	%ecx,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%eax,%r8d
	addl	%r15d,%eax
	movl	%r8d,%r13d
	addl	%eax,%r14d
	vmovdqa	%xmm6,48(%rsp)
	cmpb	$0,131(%rbp)
	jne	.Lavx_00_47
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%eax
	movl	%r9d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%eax,%r14d
	andl	%r8d,%r12d
	xorl	%r8d,%r13d
	addl	0(%rsp),%r11d
	movl	%eax,%r15d
	xorl	%r10d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%ebx,%r15d
	addl	%r12d,%r11d
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	xorl	%eax,%r14d
	addl	%r13d,%r11d
	xorl	%ebx,%edi
	shrdl	$2,%r14d,%r14d
	addl	%r11d,%edx
	addl	%edi,%r11d
	movl	%edx,%r13d
	addl	%r11d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r11d
	movl	%r8d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r11d,%r14d
	andl	%edx,%r12d
	xorl	%edx,%r13d
	addl	4(%rsp),%r10d
	movl	%r11d,%edi
	xorl	%r9d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%eax,%edi
	addl	%r12d,%r10d
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%r11d,%r14d
	addl	%r13d,%r10d
	xorl	%eax,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%r10d,%ecx
	addl	%r15d,%r10d
	movl	%ecx,%r13d
	addl	%r10d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r10d
	movl	%edx,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r10d,%r14d
	andl	%ecx,%r12d
	xorl	%ecx,%r13d
	addl	8(%rsp),%r9d
	movl	%r10d,%r15d
	xorl	%r8d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r11d,%r15d
	addl	%r12d,%r9d
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	xorl	%r10d,%r14d
	addl	%r13d,%r9d
	xorl	%r11d,%edi
	shrdl	$2,%r14d,%r14d
	addl	%r9d,%ebx
	addl	%edi,%r9d
	movl	%ebx,%r13d
	addl	%r9d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r9d
	movl	%ecx,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r9d,%r14d
	andl	%ebx,%r12d
	xorl	%ebx,%r13d
	addl	12(%rsp),%r8d
	movl	%r9d,%edi
	xorl	%edx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r10d,%edi
	addl	%r12d,%r8d
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%r9d,%r14d
	addl	%r13d,%r8d
	xorl	%r10d,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%r8d,%eax
	addl	%r15d,%r8d
	movl	%eax,%r13d
	addl	%r8d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r8d
	movl	%ebx,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r8d,%r14d
	andl	%eax,%r12d
	xorl	%eax,%r13d
	addl	16(%rsp),%edx
	movl	%r8d,%r15d
	xorl	%ecx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r9d,%r15d
	addl	%r12d,%edx
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	xorl	%r8d,%r14d
	addl	%r13d,%edx
	xorl	%r9d,%edi
	shrdl	$2,%r14d,%r14d
	addl	%edx,%r11d
	addl	%edi,%edx
	movl	%r11d,%r13d
	addl	%edx,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%edx
	movl	%eax,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%edx,%r14d
	andl	%r11d,%r12d
	xorl	%r11d,%r13d
	addl	20(%rsp),%ecx
	movl	%edx,%edi
	xorl	%ebx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r8d,%edi
	addl	%r12d,%ecx
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%edx,%r14d
	addl	%r13d,%ecx
	xorl	%r8d,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%ecx,%r10d
	addl	%r15d,%ecx
	movl	%r10d,%r13d
	addl	%ecx,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%ecx
	movl	%r11d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%ecx,%r14d
	andl	%r10d,%r12d
	xorl	%r10d,%r13d
	addl	24(%rsp),%ebx
	movl	%ecx,%r15d
	xorl	%eax,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%edx,%r15d
	addl	%r12d,%ebx
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	xorl	%ecx,%r14d
	addl	%r13d,%ebx
	xorl	%edx,%edi
	shrdl	$2,%r14d,%r14d
	addl	%ebx,%r9d
	addl	%edi,%ebx
	movl	%r9d,%r13d
	addl	%ebx,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%ebx
	movl	%r10d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%ebx,%r14d
	andl	%r9d,%r12d
	xorl	%r9d,%r13d
	addl	28(%rsp),%eax
	movl	%ebx,%edi
	xorl	%r11d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%ecx,%edi
	addl	%r12d,%eax
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%ebx,%r14d
	addl	%r13d,%eax
	xorl	%ecx,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%eax,%r8d
	addl	%r15d,%eax
	movl	%r8d,%r13d
	addl	%eax,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%eax
	movl	%r9d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r8d,%r13d
	xorl	%r10d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%eax,%r14d
	andl	%r8d,%r12d
	xorl	%r8d,%r13d
	addl	32(%rsp),%r11d
	movl	%eax,%r15d
	xorl	%r10d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%ebx,%r15d
	addl	%r12d,%r11d
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	xorl	%eax,%r14d
	addl	%r13d,%r11d
	xorl	%ebx,%edi
	shrdl	$2,%r14d,%r14d
	addl	%r11d,%edx
	addl	%edi,%r11d
	movl	%edx,%r13d
	addl	%r11d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r11d
	movl	%r8d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%edx,%r13d
	xorl	%r9d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r11d,%r14d
	andl	%edx,%r12d
	xorl	%edx,%r13d
	addl	36(%rsp),%r10d
	movl	%r11d,%edi
	xorl	%r9d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%eax,%edi
	addl	%r12d,%r10d
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%r11d,%r14d
	addl	%r13d,%r10d
	xorl	%eax,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%r10d,%ecx
	addl	%r15d,%r10d
	movl	%ecx,%r13d
	addl	%r10d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r10d
	movl	%edx,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%ecx,%r13d
	xorl	%r8d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r10d,%r14d
	andl	%ecx,%r12d
	xorl	%ecx,%r13d
	addl	40(%rsp),%r9d
	movl	%r10d,%r15d
	xorl	%r8d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r11d,%r15d
	addl	%r12d,%r9d
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	xorl	%r10d,%r14d
	addl	%r13d,%r9d
	xorl	%r11d,%edi
	shrdl	$2,%r14d,%r14d
	addl	%r9d,%ebx
	addl	%edi,%r9d
	movl	%ebx,%r13d
	addl	%r9d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r9d
	movl	%ecx,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%ebx,%r13d
	xorl	%edx,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r9d,%r14d
	andl	%ebx,%r12d
	xorl	%ebx,%r13d
	addl	44(%rsp),%r8d
	movl	%r9d,%edi
	xorl	%edx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r10d,%edi
	addl	%r12d,%r8d
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%r9d,%r14d
	addl	%r13d,%r8d
	xorl	%r10d,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%r8d,%eax
	addl	%r15d,%r8d
	movl	%eax,%r13d
	addl	%r8d,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%r8d
	movl	%ebx,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%eax,%r13d
	xorl	%ecx,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%r8d,%r14d
	andl	%eax,%r12d
	xorl	%eax,%r13d
	addl	48(%rsp),%edx
	movl	%r8d,%r15d
	xorl	%ecx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r9d,%r15d
	addl	%r12d,%edx
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	xorl	%r8d,%r14d
	addl	%r13d,%edx
	xorl	%r9d,%edi
	shrdl	$2,%r14d,%r14d
	addl	%edx,%r11d
	addl	%edi,%edx
	movl	%r11d,%r13d
	addl	%edx,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%edx
	movl	%eax,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r11d,%r13d
	xorl	%ebx,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%edx,%r14d
	andl	%r11d,%r12d
	xorl	%r11d,%r13d
	addl	52(%rsp),%ecx
	movl	%edx,%edi
	xorl	%ebx,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%r8d,%edi
	addl	%r12d,%ecx
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%edx,%r14d
	addl	%r13d,%ecx
	xorl	%r8d,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%ecx,%r10d
	addl	%r15d,%ecx
	movl	%r10d,%r13d
	addl	%ecx,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%ecx
	movl	%r11d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r10d,%r13d
	xorl	%eax,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%ecx,%r14d
	andl	%r10d,%r12d
	xorl	%r10d,%r13d
	addl	56(%rsp),%ebx
	movl	%ecx,%r15d
	xorl	%eax,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%edx,%r15d
	addl	%r12d,%ebx
	shrdl	$6,%r13d,%r13d
	andl	%r15d,%edi
	xorl	%ecx,%r14d
	addl	%r13d,%ebx
	xorl	%edx,%edi
	shrdl	$2,%r14d,%r14d
	addl	%ebx,%r9d
	addl	%edi,%ebx
	movl	%r9d,%r13d
	addl	%ebx,%r14d
	shrdl	$14,%r13d,%r13d
	movl	%r14d,%ebx
	movl	%r10d,%r12d
	shrdl	$9,%r14d,%r14d
	xorl	%r9d,%r13d
	xorl	%r11d,%r12d
	shrdl	$5,%r13d,%r13d
	xorl	%ebx,%r14d
	andl	%r9d,%r12d
	xorl	%r9d,%r13d
	addl	60(%rsp),%eax
	movl	%ebx,%edi
	xorl	%r11d,%r12d
	shrdl	$11,%r14d,%r14d
	xorl	%ecx,%edi
	addl	%r12d,%eax
	shrdl	$6,%r13d,%r13d
	andl	%edi,%r15d
	xorl	%ebx,%r14d
	addl	%r13d,%eax
	xorl	%ecx,%r15d
	shrdl	$2,%r14d,%r14d
	addl	%eax,%r8d
	addl	%r15d,%eax
	movl	%r8d,%r13d
	addl	%eax,%r14d
	movq	64+0(%rsp),%rdi
	movl	%r14d,%eax

	addl	0(%rdi),%eax
	leaq	64(%rsi),%rsi
	addl	4(%rdi),%ebx
	addl	8(%rdi),%ecx
	addl	12(%rdi),%edx
	addl	16(%rdi),%r8d
	addl	20(%rdi),%r9d
	addl	24(%rdi),%r10d
	addl	28(%rdi),%r11d

	cmpq	64+16(%rsp),%rsi

	movl	%eax,0(%rdi)
	movl	%ebx,4(%rdi)
	movl	%ecx,8(%rdi)
	movl	%edx,12(%rdi)
	movl	%r8d,16(%rdi)
	movl	%r9d,20(%rdi)
	movl	%r10d,24(%rdi)
	movl	%r11d,28(%rdi)
	jb	.Lloop_avx

	movq	88(%rsp),%rsi

	vzeroupper
	movaps	64+32(%rsp),%xmm6
	movaps	64+48(%rsp),%xmm7
	movaps	64+64(%rsp),%xmm8
	movaps	64+80(%rsp),%xmm9
	movq	-48(%rsi),%r15

	movq	-40(%rsi),%r14

	movq	-32(%rsi),%r13

	movq	-24(%rsi),%r12

	movq	-16(%rsi),%rbp

	movq	-8(%rsi),%rbx

	leaq	(%rsi),%rsp

.Lepilogue_avx:
	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3

.LSEH_end_sha256_block_data_order_avx:
.def	sha256_block_data_order_avx2;	.scl 3;	.type 32;	.endef
.p2align	6
sha256_block_data_order_avx2:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_sha256_block_data_order_avx2:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx


.Lavx2_shortcut:
	movq	%rsp,%rax

	pushq	%rbx

	pushq	%rbp

	pushq	%r12

	pushq	%r13

	pushq	%r14

	pushq	%r15

	subq	$608,%rsp
	shlq	$4,%rdx
	andq	$-1024,%rsp
	leaq	(%rsi,%rdx,4),%rdx
	addq	$448,%rsp
	movq	%rdi,64+0(%rsp)
	movq	%rsi,64+8(%rsp)
	movq	%rdx,64+16(%rsp)
	movq	%rax,88(%rsp)

	movaps	%xmm6,64+32(%rsp)
	movaps	%xmm7,64+48(%rsp)
	movaps	%xmm8,64+64(%rsp)
	movaps	%xmm9,64+80(%rsp)
.Lprologue_avx2:

	vzeroupper
	subq	$-64,%rsi
	movl	0(%rdi),%eax
	movq	%rsi,%r12
	movl	4(%rdi),%ebx
	cmpq	%rdx,%rsi
	movl	8(%rdi),%ecx
	cmoveq	%rsp,%r12
	movl	12(%rdi),%edx
	movl	16(%rdi),%r8d
	movl	20(%rdi),%r9d
	movl	24(%rdi),%r10d
	movl	28(%rdi),%r11d
	vmovdqa	K256+512+32(%rip),%ymm8
	vmovdqa	K256+512+64(%rip),%ymm9
	jmp	.Loop_avx2
.p2align	4
.Loop_avx2:
	vmovdqa	K256+512(%rip),%ymm7
	vmovdqu	-64+0(%rsi),%xmm0
	vmovdqu	-64+16(%rsi),%xmm1
	vmovdqu	-64+32(%rsi),%xmm2
	vmovdqu	-64+48(%rsi),%xmm3

	vinserti128	$1,(%r12),%ymm0,%ymm0
	vinserti128	$1,16(%r12),%ymm1,%ymm1
	vpshufb	%ymm7,%ymm0,%ymm0
	vinserti128	$1,32(%r12),%ymm2,%ymm2
	vpshufb	%ymm7,%ymm1,%ymm1
	vinserti128	$1,48(%r12),%ymm3,%ymm3

	leaq	K256(%rip),%rbp
	vpshufb	%ymm7,%ymm2,%ymm2
	vpaddd	0(%rbp),%ymm0,%ymm4
	vpshufb	%ymm7,%ymm3,%ymm3
	vpaddd	32(%rbp),%ymm1,%ymm5
	vpaddd	64(%rbp),%ymm2,%ymm6
	vpaddd	96(%rbp),%ymm3,%ymm7
	vmovdqa	%ymm4,0(%rsp)
	xorl	%r14d,%r14d
	vmovdqa	%ymm5,32(%rsp)
	leaq	-64(%rsp),%rsp
	movl	%ebx,%edi
	vmovdqa	%ymm6,0(%rsp)
	xorl	%ecx,%edi
	vmovdqa	%ymm7,32(%rsp)
	movl	%r9d,%r12d
	subq	$-32*4,%rbp
	jmp	.Lavx2_00_47

.p2align	4
.Lavx2_00_47:
	leaq	-64(%rsp),%rsp
	vpalignr	$4,%ymm0,%ymm1,%ymm4
	addl	0+128(%rsp),%r11d
	andl	%r8d,%r12d
	rorxl	$25,%r8d,%r13d
	vpalignr	$4,%ymm2,%ymm3,%ymm7
	rorxl	$11,%r8d,%r15d
	leal	(%rax,%r14,1),%eax
	leal	(%r11,%r12,1),%r11d
	vpsrld	$7,%ymm4,%ymm6
	andnl	%r10d,%r8d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r8d,%r14d
	vpaddd	%ymm7,%ymm0,%ymm0
	leal	(%r11,%r12,1),%r11d
	xorl	%r14d,%r13d
	movl	%eax,%r15d
	vpsrld	$3,%ymm4,%ymm7
	rorxl	$22,%eax,%r12d
	leal	(%r11,%r13,1),%r11d
	xorl	%ebx,%r15d
	vpslld	$14,%ymm4,%ymm5
	rorxl	$13,%eax,%r14d
	rorxl	$2,%eax,%r13d
	leal	(%rdx,%r11,1),%edx
	vpxor	%ymm6,%ymm7,%ymm4
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%ebx,%edi
	vpshufd	$250,%ymm3,%ymm7
	xorl	%r13d,%r14d
	leal	(%r11,%rdi,1),%r11d
	movl	%r8d,%r12d
	vpsrld	$11,%ymm6,%ymm6
	addl	4+128(%rsp),%r10d
	andl	%edx,%r12d
	rorxl	$25,%edx,%r13d
	vpxor	%ymm5,%ymm4,%ymm4
	rorxl	$11,%edx,%edi
	leal	(%r11,%r14,1),%r11d
	leal	(%r10,%r12,1),%r10d
	vpslld	$11,%ymm5,%ymm5
	andnl	%r9d,%edx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%edx,%r14d
	vpxor	%ymm6,%ymm4,%ymm4
	leal	(%r10,%r12,1),%r10d
	xorl	%r14d,%r13d
	movl	%r11d,%edi
	vpsrld	$10,%ymm7,%ymm6
	rorxl	$22,%r11d,%r12d
	leal	(%r10,%r13,1),%r10d
	xorl	%eax,%edi
	vpxor	%ymm5,%ymm4,%ymm4
	rorxl	$13,%r11d,%r14d
	rorxl	$2,%r11d,%r13d
	leal	(%rcx,%r10,1),%ecx
	vpsrlq	$17,%ymm7,%ymm7
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%eax,%r15d
	vpaddd	%ymm4,%ymm0,%ymm0
	xorl	%r13d,%r14d
	leal	(%r10,%r15,1),%r10d
	movl	%edx,%r12d
	vpxor	%ymm7,%ymm6,%ymm6
	addl	8+128(%rsp),%r9d
	andl	%ecx,%r12d
	rorxl	$25,%ecx,%r13d
	vpsrlq	$2,%ymm7,%ymm7
	rorxl	$11,%ecx,%r15d
	leal	(%r10,%r14,1),%r10d
	leal	(%r9,%r12,1),%r9d
	vpxor	%ymm7,%ymm6,%ymm6
	andnl	%r8d,%ecx,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%ecx,%r14d
	vpshufb	%ymm8,%ymm6,%ymm6
	leal	(%r9,%r12,1),%r9d
	xorl	%r14d,%r13d
	movl	%r10d,%r15d
	vpaddd	%ymm6,%ymm0,%ymm0
	rorxl	$22,%r10d,%r12d
	leal	(%r9,%r13,1),%r9d
	xorl	%r11d,%r15d
	vpshufd	$80,%ymm0,%ymm7
	rorxl	$13,%r10d,%r14d
	rorxl	$2,%r10d,%r13d
	leal	(%rbx,%r9,1),%ebx
	vpsrld	$10,%ymm7,%ymm6
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r11d,%edi
	vpsrlq	$17,%ymm7,%ymm7
	xorl	%r13d,%r14d
	leal	(%r9,%rdi,1),%r9d
	movl	%ecx,%r12d
	vpxor	%ymm7,%ymm6,%ymm6
	addl	12+128(%rsp),%r8d
	andl	%ebx,%r12d
	rorxl	$25,%ebx,%r13d
	vpsrlq	$2,%ymm7,%ymm7
	rorxl	$11,%ebx,%edi
	leal	(%r9,%r14,1),%r9d
	leal	(%r8,%r12,1),%r8d
	vpxor	%ymm7,%ymm6,%ymm6
	andnl	%edx,%ebx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%ebx,%r14d
	vpshufb	%ymm9,%ymm6,%ymm6
	leal	(%r8,%r12,1),%r8d
	xorl	%r14d,%r13d
	movl	%r9d,%edi
	vpaddd	%ymm6,%ymm0,%ymm0
	rorxl	$22,%r9d,%r12d
	leal	(%r8,%r13,1),%r8d
	xorl	%r10d,%edi
	vpaddd	0(%rbp),%ymm0,%ymm6
	rorxl	$13,%r9d,%r14d
	rorxl	$2,%r9d,%r13d
	leal	(%rax,%r8,1),%eax
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r10d,%r15d
	xorl	%r13d,%r14d
	leal	(%r8,%r15,1),%r8d
	movl	%ebx,%r12d
	vmovdqa	%ymm6,0(%rsp)
	vpalignr	$4,%ymm1,%ymm2,%ymm4
	addl	32+128(%rsp),%edx
	andl	%eax,%r12d
	rorxl	$25,%eax,%r13d
	vpalignr	$4,%ymm3,%ymm0,%ymm7
	rorxl	$11,%eax,%r15d
	leal	(%r8,%r14,1),%r8d
	leal	(%rdx,%r12,1),%edx
	vpsrld	$7,%ymm4,%ymm6
	andnl	%ecx,%eax,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%eax,%r14d
	vpaddd	%ymm7,%ymm1,%ymm1
	leal	(%rdx,%r12,1),%edx
	xorl	%r14d,%r13d
	movl	%r8d,%r15d
	vpsrld	$3,%ymm4,%ymm7
	rorxl	$22,%r8d,%r12d
	leal	(%rdx,%r13,1),%edx
	xorl	%r9d,%r15d
	vpslld	$14,%ymm4,%ymm5
	rorxl	$13,%r8d,%r14d
	rorxl	$2,%r8d,%r13d
	leal	(%r11,%rdx,1),%r11d
	vpxor	%ymm6,%ymm7,%ymm4
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r9d,%edi
	vpshufd	$250,%ymm0,%ymm7
	xorl	%r13d,%r14d
	leal	(%rdx,%rdi,1),%edx
	movl	%eax,%r12d
	vpsrld	$11,%ymm6,%ymm6
	addl	36+128(%rsp),%ecx
	andl	%r11d,%r12d
	rorxl	$25,%r11d,%r13d
	vpxor	%ymm5,%ymm4,%ymm4
	rorxl	$11,%r11d,%edi
	leal	(%rdx,%r14,1),%edx
	leal	(%rcx,%r12,1),%ecx
	vpslld	$11,%ymm5,%ymm5
	andnl	%ebx,%r11d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r11d,%r14d
	vpxor	%ymm6,%ymm4,%ymm4
	leal	(%rcx,%r12,1),%ecx
	xorl	%r14d,%r13d
	movl	%edx,%edi
	vpsrld	$10,%ymm7,%ymm6
	rorxl	$22,%edx,%r12d
	leal	(%rcx,%r13,1),%ecx
	xorl	%r8d,%edi
	vpxor	%ymm5,%ymm4,%ymm4
	rorxl	$13,%edx,%r14d
	rorxl	$2,%edx,%r13d
	leal	(%r10,%rcx,1),%r10d
	vpsrlq	$17,%ymm7,%ymm7
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r8d,%r15d
	vpaddd	%ymm4,%ymm1,%ymm1
	xorl	%r13d,%r14d
	leal	(%rcx,%r15,1),%ecx
	movl	%r11d,%r12d
	vpxor	%ymm7,%ymm6,%ymm6
	addl	40+128(%rsp),%ebx
	andl	%r10d,%r12d
	rorxl	$25,%r10d,%r13d
	vpsrlq	$2,%ymm7,%ymm7
	rorxl	$11,%r10d,%r15d
	leal	(%rcx,%r14,1),%ecx
	leal	(%rbx,%r12,1),%ebx
	vpxor	%ymm7,%ymm6,%ymm6
	andnl	%eax,%r10d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r10d,%r14d
	vpshufb	%ymm8,%ymm6,%ymm6
	leal	(%rbx,%r12,1),%ebx
	xorl	%r14d,%r13d
	movl	%ecx,%r15d
	vpaddd	%ymm6,%ymm1,%ymm1
	rorxl	$22,%ecx,%r12d
	leal	(%rbx,%r13,1),%ebx
	xorl	%edx,%r15d
	vpshufd	$80,%ymm1,%ymm7
	rorxl	$13,%ecx,%r14d
	rorxl	$2,%ecx,%r13d
	leal	(%r9,%rbx,1),%r9d
	vpsrld	$10,%ymm7,%ymm6
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%edx,%edi
	vpsrlq	$17,%ymm7,%ymm7
	xorl	%r13d,%r14d
	leal	(%rbx,%rdi,1),%ebx
	movl	%r10d,%r12d
	vpxor	%ymm7,%ymm6,%ymm6
	addl	44+128(%rsp),%eax
	andl	%r9d,%r12d
	rorxl	$25,%r9d,%r13d
	vpsrlq	$2,%ymm7,%ymm7
	rorxl	$11,%r9d,%edi
	leal	(%rbx,%r14,1),%ebx
	leal	(%rax,%r12,1),%eax
	vpxor	%ymm7,%ymm6,%ymm6
	andnl	%r11d,%r9d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r9d,%r14d
	vpshufb	%ymm9,%ymm6,%ymm6
	leal	(%rax,%r12,1),%eax
	xorl	%r14d,%r13d
	movl	%ebx,%edi
	vpaddd	%ymm6,%ymm1,%ymm1
	rorxl	$22,%ebx,%r12d
	leal	(%rax,%r13,1),%eax
	xorl	%ecx,%edi
	vpaddd	32(%rbp),%ymm1,%ymm6
	rorxl	$13,%ebx,%r14d
	rorxl	$2,%ebx,%r13d
	leal	(%r8,%rax,1),%r8d
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%ecx,%r15d
	xorl	%r13d,%r14d
	leal	(%rax,%r15,1),%eax
	movl	%r9d,%r12d
	vmovdqa	%ymm6,32(%rsp)
	leaq	-64(%rsp),%rsp
	vpalignr	$4,%ymm2,%ymm3,%ymm4
	addl	0+128(%rsp),%r11d
	andl	%r8d,%r12d
	rorxl	$25,%r8d,%r13d
	vpalignr	$4,%ymm0,%ymm1,%ymm7
	rorxl	$11,%r8d,%r15d
	leal	(%rax,%r14,1),%eax
	leal	(%r11,%r12,1),%r11d
	vpsrld	$7,%ymm4,%ymm6
	andnl	%r10d,%r8d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r8d,%r14d
	vpaddd	%ymm7,%ymm2,%ymm2
	leal	(%r11,%r12,1),%r11d
	xorl	%r14d,%r13d
	movl	%eax,%r15d
	vpsrld	$3,%ymm4,%ymm7
	rorxl	$22,%eax,%r12d
	leal	(%r11,%r13,1),%r11d
	xorl	%ebx,%r15d
	vpslld	$14,%ymm4,%ymm5
	rorxl	$13,%eax,%r14d
	rorxl	$2,%eax,%r13d
	leal	(%rdx,%r11,1),%edx
	vpxor	%ymm6,%ymm7,%ymm4
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%ebx,%edi
	vpshufd	$250,%ymm1,%ymm7
	xorl	%r13d,%r14d
	leal	(%r11,%rdi,1),%r11d
	movl	%r8d,%r12d
	vpsrld	$11,%ymm6,%ymm6
	addl	4+128(%rsp),%r10d
	andl	%edx,%r12d
	rorxl	$25,%edx,%r13d
	vpxor	%ymm5,%ymm4,%ymm4
	rorxl	$11,%edx,%edi
	leal	(%r11,%r14,1),%r11d
	leal	(%r10,%r12,1),%r10d
	vpslld	$11,%ymm5,%ymm5
	andnl	%r9d,%edx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%edx,%r14d
	vpxor	%ymm6,%ymm4,%ymm4
	leal	(%r10,%r12,1),%r10d
	xorl	%r14d,%r13d
	movl	%r11d,%edi
	vpsrld	$10,%ymm7,%ymm6
	rorxl	$22,%r11d,%r12d
	leal	(%r10,%r13,1),%r10d
	xorl	%eax,%edi
	vpxor	%ymm5,%ymm4,%ymm4
	rorxl	$13,%r11d,%r14d
	rorxl	$2,%r11d,%r13d
	leal	(%rcx,%r10,1),%ecx
	vpsrlq	$17,%ymm7,%ymm7
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%eax,%r15d
	vpaddd	%ymm4,%ymm2,%ymm2
	xorl	%r13d,%r14d
	leal	(%r10,%r15,1),%r10d
	movl	%edx,%r12d
	vpxor	%ymm7,%ymm6,%ymm6
	addl	8+128(%rsp),%r9d
	andl	%ecx,%r12d
	rorxl	$25,%ecx,%r13d
	vpsrlq	$2,%ymm7,%ymm7
	rorxl	$11,%ecx,%r15d
	leal	(%r10,%r14,1),%r10d
	leal	(%r9,%r12,1),%r9d
	vpxor	%ymm7,%ymm6,%ymm6
	andnl	%r8d,%ecx,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%ecx,%r14d
	vpshufb	%ymm8,%ymm6,%ymm6
	leal	(%r9,%r12,1),%r9d
	xorl	%r14d,%r13d
	movl	%r10d,%r15d
	vpaddd	%ymm6,%ymm2,%ymm2
	rorxl	$22,%r10d,%r12d
	leal	(%r9,%r13,1),%r9d
	xorl	%r11d,%r15d
	vpshufd	$80,%ymm2,%ymm7
	rorxl	$13,%r10d,%r14d
	rorxl	$2,%r10d,%r13d
	leal	(%rbx,%r9,1),%ebx
	vpsrld	$10,%ymm7,%ymm6
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r11d,%edi
	vpsrlq	$17,%ymm7,%ymm7
	xorl	%r13d,%r14d
	leal	(%r9,%rdi,1),%r9d
	movl	%ecx,%r12d
	vpxor	%ymm7,%ymm6,%ymm6
	addl	12+128(%rsp),%r8d
	andl	%ebx,%r12d
	rorxl	$25,%ebx,%r13d
	vpsrlq	$2,%ymm7,%ymm7
	rorxl	$11,%ebx,%edi
	leal	(%r9,%r14,1),%r9d
	leal	(%r8,%r12,1),%r8d
	vpxor	%ymm7,%ymm6,%ymm6
	andnl	%edx,%ebx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%ebx,%r14d
	vpshufb	%ymm9,%ymm6,%ymm6
	leal	(%r8,%r12,1),%r8d
	xorl	%r14d,%r13d
	movl	%r9d,%edi
	vpaddd	%ymm6,%ymm2,%ymm2
	rorxl	$22,%r9d,%r12d
	leal	(%r8,%r13,1),%r8d
	xorl	%r10d,%edi
	vpaddd	64(%rbp),%ymm2,%ymm6
	rorxl	$13,%r9d,%r14d
	rorxl	$2,%r9d,%r13d
	leal	(%rax,%r8,1),%eax
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r10d,%r15d
	xorl	%r13d,%r14d
	leal	(%r8,%r15,1),%r8d
	movl	%ebx,%r12d
	vmovdqa	%ymm6,0(%rsp)
	vpalignr	$4,%ymm3,%ymm0,%ymm4
	addl	32+128(%rsp),%edx
	andl	%eax,%r12d
	rorxl	$25,%eax,%r13d
	vpalignr	$4,%ymm1,%ymm2,%ymm7
	rorxl	$11,%eax,%r15d
	leal	(%r8,%r14,1),%r8d
	leal	(%rdx,%r12,1),%edx
	vpsrld	$7,%ymm4,%ymm6
	andnl	%ecx,%eax,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%eax,%r14d
	vpaddd	%ymm7,%ymm3,%ymm3
	leal	(%rdx,%r12,1),%edx
	xorl	%r14d,%r13d
	movl	%r8d,%r15d
	vpsrld	$3,%ymm4,%ymm7
	rorxl	$22,%r8d,%r12d
	leal	(%rdx,%r13,1),%edx
	xorl	%r9d,%r15d
	vpslld	$14,%ymm4,%ymm5
	rorxl	$13,%r8d,%r14d
	rorxl	$2,%r8d,%r13d
	leal	(%r11,%rdx,1),%r11d
	vpxor	%ymm6,%ymm7,%ymm4
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r9d,%edi
	vpshufd	$250,%ymm2,%ymm7
	xorl	%r13d,%r14d
	leal	(%rdx,%rdi,1),%edx
	movl	%eax,%r12d
	vpsrld	$11,%ymm6,%ymm6
	addl	36+128(%rsp),%ecx
	andl	%r11d,%r12d
	rorxl	$25,%r11d,%r13d
	vpxor	%ymm5,%ymm4,%ymm4
	rorxl	$11,%r11d,%edi
	leal	(%rdx,%r14,1),%edx
	leal	(%rcx,%r12,1),%ecx
	vpslld	$11,%ymm5,%ymm5
	andnl	%ebx,%r11d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r11d,%r14d
	vpxor	%ymm6,%ymm4,%ymm4
	leal	(%rcx,%r12,1),%ecx
	xorl	%r14d,%r13d
	movl	%edx,%edi
	vpsrld	$10,%ymm7,%ymm6
	rorxl	$22,%edx,%r12d
	leal	(%rcx,%r13,1),%ecx
	xorl	%r8d,%edi
	vpxor	%ymm5,%ymm4,%ymm4
	rorxl	$13,%edx,%r14d
	rorxl	$2,%edx,%r13d
	leal	(%r10,%rcx,1),%r10d
	vpsrlq	$17,%ymm7,%ymm7
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r8d,%r15d
	vpaddd	%ymm4,%ymm3,%ymm3
	xorl	%r13d,%r14d
	leal	(%rcx,%r15,1),%ecx
	movl	%r11d,%r12d
	vpxor	%ymm7,%ymm6,%ymm6
	addl	40+128(%rsp),%ebx
	andl	%r10d,%r12d
	rorxl	$25,%r10d,%r13d
	vpsrlq	$2,%ymm7,%ymm7
	rorxl	$11,%r10d,%r15d
	leal	(%rcx,%r14,1),%ecx
	leal	(%rbx,%r12,1),%ebx
	vpxor	%ymm7,%ymm6,%ymm6
	andnl	%eax,%r10d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r10d,%r14d
	vpshufb	%ymm8,%ymm6,%ymm6
	leal	(%rbx,%r12,1),%ebx
	xorl	%r14d,%r13d
	movl	%ecx,%r15d
	vpaddd	%ymm6,%ymm3,%ymm3
	rorxl	$22,%ecx,%r12d
	leal	(%rbx,%r13,1),%ebx
	xorl	%edx,%r15d
	vpshufd	$80,%ymm3,%ymm7
	rorxl	$13,%ecx,%r14d
	rorxl	$2,%ecx,%r13d
	leal	(%r9,%rbx,1),%r9d
	vpsrld	$10,%ymm7,%ymm6
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%edx,%edi
	vpsrlq	$17,%ymm7,%ymm7
	xorl	%r13d,%r14d
	leal	(%rbx,%rdi,1),%ebx
	movl	%r10d,%r12d
	vpxor	%ymm7,%ymm6,%ymm6
	addl	44+128(%rsp),%eax
	andl	%r9d,%r12d
	rorxl	$25,%r9d,%r13d
	vpsrlq	$2,%ymm7,%ymm7
	rorxl	$11,%r9d,%edi
	leal	(%rbx,%r14,1),%ebx
	leal	(%rax,%r12,1),%eax
	vpxor	%ymm7,%ymm6,%ymm6
	andnl	%r11d,%r9d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r9d,%r14d
	vpshufb	%ymm9,%ymm6,%ymm6
	leal	(%rax,%r12,1),%eax
	xorl	%r14d,%r13d
	movl	%ebx,%edi
	vpaddd	%ymm6,%ymm3,%ymm3
	rorxl	$22,%ebx,%r12d
	leal	(%rax,%r13,1),%eax
	xorl	%ecx,%edi
	vpaddd	96(%rbp),%ymm3,%ymm6
	rorxl	$13,%ebx,%r14d
	rorxl	$2,%ebx,%r13d
	leal	(%r8,%rax,1),%r8d
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%ecx,%r15d
	xorl	%r13d,%r14d
	leal	(%rax,%r15,1),%eax
	movl	%r9d,%r12d
	vmovdqa	%ymm6,32(%rsp)
	leaq	128(%rbp),%rbp
	cmpb	$0,3(%rbp)
	jne	.Lavx2_00_47
	addl	0+64(%rsp),%r11d
	andl	%r8d,%r12d
	rorxl	$25,%r8d,%r13d
	rorxl	$11,%r8d,%r15d
	leal	(%rax,%r14,1),%eax
	leal	(%r11,%r12,1),%r11d
	andnl	%r10d,%r8d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r8d,%r14d
	leal	(%r11,%r12,1),%r11d
	xorl	%r14d,%r13d
	movl	%eax,%r15d
	rorxl	$22,%eax,%r12d
	leal	(%r11,%r13,1),%r11d
	xorl	%ebx,%r15d
	rorxl	$13,%eax,%r14d
	rorxl	$2,%eax,%r13d
	leal	(%rdx,%r11,1),%edx
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%ebx,%edi
	xorl	%r13d,%r14d
	leal	(%r11,%rdi,1),%r11d
	movl	%r8d,%r12d
	addl	4+64(%rsp),%r10d
	andl	%edx,%r12d
	rorxl	$25,%edx,%r13d
	rorxl	$11,%edx,%edi
	leal	(%r11,%r14,1),%r11d
	leal	(%r10,%r12,1),%r10d
	andnl	%r9d,%edx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%edx,%r14d
	leal	(%r10,%r12,1),%r10d
	xorl	%r14d,%r13d
	movl	%r11d,%edi
	rorxl	$22,%r11d,%r12d
	leal	(%r10,%r13,1),%r10d
	xorl	%eax,%edi
	rorxl	$13,%r11d,%r14d
	rorxl	$2,%r11d,%r13d
	leal	(%rcx,%r10,1),%ecx
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%eax,%r15d
	xorl	%r13d,%r14d
	leal	(%r10,%r15,1),%r10d
	movl	%edx,%r12d
	addl	8+64(%rsp),%r9d
	andl	%ecx,%r12d
	rorxl	$25,%ecx,%r13d
	rorxl	$11,%ecx,%r15d
	leal	(%r10,%r14,1),%r10d
	leal	(%r9,%r12,1),%r9d
	andnl	%r8d,%ecx,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%ecx,%r14d
	leal	(%r9,%r12,1),%r9d
	xorl	%r14d,%r13d
	movl	%r10d,%r15d
	rorxl	$22,%r10d,%r12d
	leal	(%r9,%r13,1),%r9d
	xorl	%r11d,%r15d
	rorxl	$13,%r10d,%r14d
	rorxl	$2,%r10d,%r13d
	leal	(%rbx,%r9,1),%ebx
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r11d,%edi
	xorl	%r13d,%r14d
	leal	(%r9,%rdi,1),%r9d
	movl	%ecx,%r12d
	addl	12+64(%rsp),%r8d
	andl	%ebx,%r12d
	rorxl	$25,%ebx,%r13d
	rorxl	$11,%ebx,%edi
	leal	(%r9,%r14,1),%r9d
	leal	(%r8,%r12,1),%r8d
	andnl	%edx,%ebx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%ebx,%r14d
	leal	(%r8,%r12,1),%r8d
	xorl	%r14d,%r13d
	movl	%r9d,%edi
	rorxl	$22,%r9d,%r12d
	leal	(%r8,%r13,1),%r8d
	xorl	%r10d,%edi
	rorxl	$13,%r9d,%r14d
	rorxl	$2,%r9d,%r13d
	leal	(%rax,%r8,1),%eax
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r10d,%r15d
	xorl	%r13d,%r14d
	leal	(%r8,%r15,1),%r8d
	movl	%ebx,%r12d
	addl	32+64(%rsp),%edx
	andl	%eax,%r12d
	rorxl	$25,%eax,%r13d
	rorxl	$11,%eax,%r15d
	leal	(%r8,%r14,1),%r8d
	leal	(%rdx,%r12,1),%edx
	andnl	%ecx,%eax,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%eax,%r14d
	leal	(%rdx,%r12,1),%edx
	xorl	%r14d,%r13d
	movl	%r8d,%r15d
	rorxl	$22,%r8d,%r12d
	leal	(%rdx,%r13,1),%edx
	xorl	%r9d,%r15d
	rorxl	$13,%r8d,%r14d
	rorxl	$2,%r8d,%r13d
	leal	(%r11,%rdx,1),%r11d
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r9d,%edi
	xorl	%r13d,%r14d
	leal	(%rdx,%rdi,1),%edx
	movl	%eax,%r12d
	addl	36+64(%rsp),%ecx
	andl	%r11d,%r12d
	rorxl	$25,%r11d,%r13d
	rorxl	$11,%r11d,%edi
	leal	(%rdx,%r14,1),%edx
	leal	(%rcx,%r12,1),%ecx
	andnl	%ebx,%r11d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r11d,%r14d
	leal	(%rcx,%r12,1),%ecx
	xorl	%r14d,%r13d
	movl	%edx,%edi
	rorxl	$22,%edx,%r12d
	leal	(%rcx,%r13,1),%ecx
	xorl	%r8d,%edi
	rorxl	$13,%edx,%r14d
	rorxl	$2,%edx,%r13d
	leal	(%r10,%rcx,1),%r10d
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r8d,%r15d
	xorl	%r13d,%r14d
	leal	(%rcx,%r15,1),%ecx
	movl	%r11d,%r12d
	addl	40+64(%rsp),%ebx
	andl	%r10d,%r12d
	rorxl	$25,%r10d,%r13d
	rorxl	$11,%r10d,%r15d
	leal	(%rcx,%r14,1),%ecx
	leal	(%rbx,%r12,1),%ebx
	andnl	%eax,%r10d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r10d,%r14d
	leal	(%rbx,%r12,1),%ebx
	xorl	%r14d,%r13d
	movl	%ecx,%r15d
	rorxl	$22,%ecx,%r12d
	leal	(%rbx,%r13,1),%ebx
	xorl	%edx,%r15d
	rorxl	$13,%ecx,%r14d
	rorxl	$2,%ecx,%r13d
	leal	(%r9,%rbx,1),%r9d
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%edx,%edi
	xorl	%r13d,%r14d
	leal	(%rbx,%rdi,1),%ebx
	movl	%r10d,%r12d
	addl	44+64(%rsp),%eax
	andl	%r9d,%r12d
	rorxl	$25,%r9d,%r13d
	rorxl	$11,%r9d,%edi
	leal	(%rbx,%r14,1),%ebx
	leal	(%rax,%r12,1),%eax
	andnl	%r11d,%r9d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r9d,%r14d
	leal	(%rax,%r12,1),%eax
	xorl	%r14d,%r13d
	movl	%ebx,%edi
	rorxl	$22,%ebx,%r12d
	leal	(%rax,%r13,1),%eax
	xorl	%ecx,%edi
	rorxl	$13,%ebx,%r14d
	rorxl	$2,%ebx,%r13d
	leal	(%r8,%rax,1),%r8d
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%ecx,%r15d
	xorl	%r13d,%r14d
	leal	(%rax,%r15,1),%eax
	movl	%r9d,%r12d
	addl	0(%rsp),%r11d
	andl	%r8d,%r12d
	rorxl	$25,%r8d,%r13d
	rorxl	$11,%r8d,%r15d
	leal	(%rax,%r14,1),%eax
	leal	(%r11,%r12,1),%r11d
	andnl	%r10d,%r8d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r8d,%r14d
	leal	(%r11,%r12,1),%r11d
	xorl	%r14d,%r13d
	movl	%eax,%r15d
	rorxl	$22,%eax,%r12d
	leal	(%r11,%r13,1),%r11d
	xorl	%ebx,%r15d
	rorxl	$13,%eax,%r14d
	rorxl	$2,%eax,%r13d
	leal	(%rdx,%r11,1),%edx
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%ebx,%edi
	xorl	%r13d,%r14d
	leal	(%r11,%rdi,1),%r11d
	movl	%r8d,%r12d
	addl	4(%rsp),%r10d
	andl	%edx,%r12d
	rorxl	$25,%edx,%r13d
	rorxl	$11,%edx,%edi
	leal	(%r11,%r14,1),%r11d
	leal	(%r10,%r12,1),%r10d
	andnl	%r9d,%edx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%edx,%r14d
	leal	(%r10,%r12,1),%r10d
	xorl	%r14d,%r13d
	movl	%r11d,%edi
	rorxl	$22,%r11d,%r12d
	leal	(%r10,%r13,1),%r10d
	xorl	%eax,%edi
	rorxl	$13,%r11d,%r14d
	rorxl	$2,%r11d,%r13d
	leal	(%rcx,%r10,1),%ecx
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%eax,%r15d
	xorl	%r13d,%r14d
	leal	(%r10,%r15,1),%r10d
	movl	%edx,%r12d
	addl	8(%rsp),%r9d
	andl	%ecx,%r12d
	rorxl	$25,%ecx,%r13d
	rorxl	$11,%ecx,%r15d
	leal	(%r10,%r14,1),%r10d
	leal	(%r9,%r12,1),%r9d
	andnl	%r8d,%ecx,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%ecx,%r14d
	leal	(%r9,%r12,1),%r9d
	xorl	%r14d,%r13d
	movl	%r10d,%r15d
	rorxl	$22,%r10d,%r12d
	leal	(%r9,%r13,1),%r9d
	xorl	%r11d,%r15d
	rorxl	$13,%r10d,%r14d
	rorxl	$2,%r10d,%r13d
	leal	(%rbx,%r9,1),%ebx
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r11d,%edi
	xorl	%r13d,%r14d
	leal	(%r9,%rdi,1),%r9d
	movl	%ecx,%r12d
	addl	12(%rsp),%r8d
	andl	%ebx,%r12d
	rorxl	$25,%ebx,%r13d
	rorxl	$11,%ebx,%edi
	leal	(%r9,%r14,1),%r9d
	leal	(%r8,%r12,1),%r8d
	andnl	%edx,%ebx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%ebx,%r14d
	leal	(%r8,%r12,1),%r8d
	xorl	%r14d,%r13d
	movl	%r9d,%edi
	rorxl	$22,%r9d,%r12d
	leal	(%r8,%r13,1),%r8d
	xorl	%r10d,%edi
	rorxl	$13,%r9d,%r14d
	rorxl	$2,%r9d,%r13d
	leal	(%rax,%r8,1),%eax
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r10d,%r15d
	xorl	%r13d,%r14d
	leal	(%r8,%r15,1),%r8d
	movl	%ebx,%r12d
	addl	32(%rsp),%edx
	andl	%eax,%r12d
	rorxl	$25,%eax,%r13d
	rorxl	$11,%eax,%r15d
	leal	(%r8,%r14,1),%r8d
	leal	(%rdx,%r12,1),%edx
	andnl	%ecx,%eax,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%eax,%r14d
	leal	(%rdx,%r12,1),%edx
	xorl	%r14d,%r13d
	movl	%r8d,%r15d
	rorxl	$22,%r8d,%r12d
	leal	(%rdx,%r13,1),%edx
	xorl	%r9d,%r15d
	rorxl	$13,%r8d,%r14d
	rorxl	$2,%r8d,%r13d
	leal	(%r11,%rdx,1),%r11d
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r9d,%edi
	xorl	%r13d,%r14d
	leal	(%rdx,%rdi,1),%edx
	movl	%eax,%r12d
	addl	36(%rsp),%ecx
	andl	%r11d,%r12d
	rorxl	$25,%r11d,%r13d
	rorxl	$11,%r11d,%edi
	leal	(%rdx,%r14,1),%edx
	leal	(%rcx,%r12,1),%ecx
	andnl	%ebx,%r11d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r11d,%r14d
	leal	(%rcx,%r12,1),%ecx
	xorl	%r14d,%r13d
	movl	%edx,%edi
	rorxl	$22,%edx,%r12d
	leal	(%rcx,%r13,1),%ecx
	xorl	%r8d,%edi
	rorxl	$13,%edx,%r14d
	rorxl	$2,%edx,%r13d
	leal	(%r10,%rcx,1),%r10d
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r8d,%r15d
	xorl	%r13d,%r14d
	leal	(%rcx,%r15,1),%ecx
	movl	%r11d,%r12d
	addl	40(%rsp),%ebx
	andl	%r10d,%r12d
	rorxl	$25,%r10d,%r13d
	rorxl	$11,%r10d,%r15d
	leal	(%rcx,%r14,1),%ecx
	leal	(%rbx,%r12,1),%ebx
	andnl	%eax,%r10d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r10d,%r14d
	leal	(%rbx,%r12,1),%ebx
	xorl	%r14d,%r13d
	movl	%ecx,%r15d
	rorxl	$22,%ecx,%r12d
	leal	(%rbx,%r13,1),%ebx
	xorl	%edx,%r15d
	rorxl	$13,%ecx,%r14d
	rorxl	$2,%ecx,%r13d
	leal	(%r9,%rbx,1),%r9d
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%edx,%edi
	xorl	%r13d,%r14d
	leal	(%rbx,%rdi,1),%ebx
	movl	%r10d,%r12d
	addl	44(%rsp),%eax
	andl	%r9d,%r12d
	rorxl	$25,%r9d,%r13d
	rorxl	$11,%r9d,%edi
	leal	(%rbx,%r14,1),%ebx
	leal	(%rax,%r12,1),%eax
	andnl	%r11d,%r9d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r9d,%r14d
	leal	(%rax,%r12,1),%eax
	xorl	%r14d,%r13d
	movl	%ebx,%edi
	rorxl	$22,%ebx,%r12d
	leal	(%rax,%r13,1),%eax
	xorl	%ecx,%edi
	rorxl	$13,%ebx,%r14d
	rorxl	$2,%ebx,%r13d
	leal	(%r8,%rax,1),%r8d
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%ecx,%r15d
	xorl	%r13d,%r14d
	leal	(%rax,%r15,1),%eax
	movl	%r9d,%r12d
	movq	512(%rsp),%rdi
	addl	%r14d,%eax

	leaq	448(%rsp),%rbp

	addl	0(%rdi),%eax
	addl	4(%rdi),%ebx
	addl	8(%rdi),%ecx
	addl	12(%rdi),%edx
	addl	16(%rdi),%r8d
	addl	20(%rdi),%r9d
	addl	24(%rdi),%r10d
	addl	28(%rdi),%r11d

	movl	%eax,0(%rdi)
	movl	%ebx,4(%rdi)
	movl	%ecx,8(%rdi)
	movl	%edx,12(%rdi)
	movl	%r8d,16(%rdi)
	movl	%r9d,20(%rdi)
	movl	%r10d,24(%rdi)
	movl	%r11d,28(%rdi)

	cmpq	80(%rbp),%rsi
	je	.Ldone_avx2

	xorl	%r14d,%r14d
	movl	%ebx,%edi
	xorl	%ecx,%edi
	movl	%r9d,%r12d
	jmp	.Lower_avx2
.p2align	4
.Lower_avx2:
	addl	0+16(%rbp),%r11d
	andl	%r8d,%r12d
	rorxl	$25,%r8d,%r13d
	rorxl	$11,%r8d,%r15d
	leal	(%rax,%r14,1),%eax
	leal	(%r11,%r12,1),%r11d
	andnl	%r10d,%r8d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r8d,%r14d
	leal	(%r11,%r12,1),%r11d
	xorl	%r14d,%r13d
	movl	%eax,%r15d
	rorxl	$22,%eax,%r12d
	leal	(%r11,%r13,1),%r11d
	xorl	%ebx,%r15d
	rorxl	$13,%eax,%r14d
	rorxl	$2,%eax,%r13d
	leal	(%rdx,%r11,1),%edx
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%ebx,%edi
	xorl	%r13d,%r14d
	leal	(%r11,%rdi,1),%r11d
	movl	%r8d,%r12d
	addl	4+16(%rbp),%r10d
	andl	%edx,%r12d
	rorxl	$25,%edx,%r13d
	rorxl	$11,%edx,%edi
	leal	(%r11,%r14,1),%r11d
	leal	(%r10,%r12,1),%r10d
	andnl	%r9d,%edx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%edx,%r14d
	leal	(%r10,%r12,1),%r10d
	xorl	%r14d,%r13d
	movl	%r11d,%edi
	rorxl	$22,%r11d,%r12d
	leal	(%r10,%r13,1),%r10d
	xorl	%eax,%edi
	rorxl	$13,%r11d,%r14d
	rorxl	$2,%r11d,%r13d
	leal	(%rcx,%r10,1),%ecx
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%eax,%r15d
	xorl	%r13d,%r14d
	leal	(%r10,%r15,1),%r10d
	movl	%edx,%r12d
	addl	8+16(%rbp),%r9d
	andl	%ecx,%r12d
	rorxl	$25,%ecx,%r13d
	rorxl	$11,%ecx,%r15d
	leal	(%r10,%r14,1),%r10d
	leal	(%r9,%r12,1),%r9d
	andnl	%r8d,%ecx,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%ecx,%r14d
	leal	(%r9,%r12,1),%r9d
	xorl	%r14d,%r13d
	movl	%r10d,%r15d
	rorxl	$22,%r10d,%r12d
	leal	(%r9,%r13,1),%r9d
	xorl	%r11d,%r15d
	rorxl	$13,%r10d,%r14d
	rorxl	$2,%r10d,%r13d
	leal	(%rbx,%r9,1),%ebx
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r11d,%edi
	xorl	%r13d,%r14d
	leal	(%r9,%rdi,1),%r9d
	movl	%ecx,%r12d
	addl	12+16(%rbp),%r8d
	andl	%ebx,%r12d
	rorxl	$25,%ebx,%r13d
	rorxl	$11,%ebx,%edi
	leal	(%r9,%r14,1),%r9d
	leal	(%r8,%r12,1),%r8d
	andnl	%edx,%ebx,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%ebx,%r14d
	leal	(%r8,%r12,1),%r8d
	xorl	%r14d,%r13d
	movl	%r9d,%edi
	rorxl	$22,%r9d,%r12d
	leal	(%r8,%r13,1),%r8d
	xorl	%r10d,%edi
	rorxl	$13,%r9d,%r14d
	rorxl	$2,%r9d,%r13d
	leal	(%rax,%r8,1),%eax
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r10d,%r15d
	xorl	%r13d,%r14d
	leal	(%r8,%r15,1),%r8d
	movl	%ebx,%r12d
	addl	32+16(%rbp),%edx
	andl	%eax,%r12d
	rorxl	$25,%eax,%r13d
	rorxl	$11,%eax,%r15d
	leal	(%r8,%r14,1),%r8d
	leal	(%rdx,%r12,1),%edx
	andnl	%ecx,%eax,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%eax,%r14d
	leal	(%rdx,%r12,1),%edx
	xorl	%r14d,%r13d
	movl	%r8d,%r15d
	rorxl	$22,%r8d,%r12d
	leal	(%rdx,%r13,1),%edx
	xorl	%r9d,%r15d
	rorxl	$13,%r8d,%r14d
	rorxl	$2,%r8d,%r13d
	leal	(%r11,%rdx,1),%r11d
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%r9d,%edi
	xorl	%r13d,%r14d
	leal	(%rdx,%rdi,1),%edx
	movl	%eax,%r12d
	addl	36+16(%rbp),%ecx
	andl	%r11d,%r12d
	rorxl	$25,%r11d,%r13d
	rorxl	$11,%r11d,%edi
	leal	(%rdx,%r14,1),%edx
	leal	(%rcx,%r12,1),%ecx
	andnl	%ebx,%r11d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r11d,%r14d
	leal	(%rcx,%r12,1),%ecx
	xorl	%r14d,%r13d
	movl	%edx,%edi
	rorxl	$22,%edx,%r12d
	leal	(%rcx,%r13,1),%ecx
	xorl	%r8d,%edi
	rorxl	$13,%edx,%r14d
	rorxl	$2,%edx,%r13d
	leal	(%r10,%rcx,1),%r10d
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%r8d,%r15d
	xorl	%r13d,%r14d
	leal	(%rcx,%r15,1),%ecx
	movl	%r11d,%r12d
	addl	40+16(%rbp),%ebx
	andl	%r10d,%r12d
	rorxl	$25,%r10d,%r13d
	rorxl	$11,%r10d,%r15d
	leal	(%rcx,%r14,1),%ecx
	leal	(%rbx,%r12,1),%ebx
	andnl	%eax,%r10d,%r12d
	xorl	%r15d,%r13d
	rorxl	$6,%r10d,%r14d
	leal	(%rbx,%r12,1),%ebx
	xorl	%r14d,%r13d
	movl	%ecx,%r15d
	rorxl	$22,%ecx,%r12d
	leal	(%rbx,%r13,1),%ebx
	xorl	%edx,%r15d
	rorxl	$13,%ecx,%r14d
	rorxl	$2,%ecx,%r13d
	leal	(%r9,%rbx,1),%r9d
	andl	%r15d,%edi
	xorl	%r12d,%r14d
	xorl	%edx,%edi
	xorl	%r13d,%r14d
	leal	(%rbx,%rdi,1),%ebx
	movl	%r10d,%r12d
	addl	44+16(%rbp),%eax
	andl	%r9d,%r12d
	rorxl	$25,%r9d,%r13d
	rorxl	$11,%r9d,%edi
	leal	(%rbx,%r14,1),%ebx
	leal	(%rax,%r12,1),%eax
	andnl	%r11d,%r9d,%r12d
	xorl	%edi,%r13d
	rorxl	$6,%r9d,%r14d
	leal	(%rax,%r12,1),%eax
	xorl	%r14d,%r13d
	movl	%ebx,%edi
	rorxl	$22,%ebx,%r12d
	leal	(%rax,%r13,1),%eax
	xorl	%ecx,%edi
	rorxl	$13,%ebx,%r14d
	rorxl	$2,%ebx,%r13d
	leal	(%r8,%rax,1),%r8d
	andl	%edi,%r15d
	xorl	%r12d,%r14d
	xorl	%ecx,%r15d
	xorl	%r13d,%r14d
	leal	(%rax,%r15,1),%eax
	movl	%r9d,%r12d
	leaq	-64(%rbp),%rbp
	cmpq	%rsp,%rbp
	jae	.Lower_avx2

	movq	512(%rsp),%rdi
	addl	%r14d,%eax

	leaq	448(%rsp),%rsp



	addl	0(%rdi),%eax
	addl	4(%rdi),%ebx
	addl	8(%rdi),%ecx
	addl	12(%rdi),%edx
	addl	16(%rdi),%r8d
	addl	20(%rdi),%r9d
	leaq	128(%rsi),%rsi
	addl	24(%rdi),%r10d
	movq	%rsi,%r12
	addl	28(%rdi),%r11d
	cmpq	64+16(%rsp),%rsi

	movl	%eax,0(%rdi)
	cmoveq	%rsp,%r12
	movl	%ebx,4(%rdi)
	movl	%ecx,8(%rdi)
	movl	%edx,12(%rdi)
	movl	%r8d,16(%rdi)
	movl	%r9d,20(%rdi)
	movl	%r10d,24(%rdi)
	movl	%r11d,28(%rdi)

	jbe	.Loop_avx2
	leaq	(%rsp),%rbp




.Ldone_avx2:
	movq	88(%rbp),%rsi

	vzeroupper
	movaps	64+32(%rbp),%xmm6
	movaps	64+48(%rbp),%xmm7
	movaps	64+64(%rbp),%xmm8
	movaps	64+80(%rbp),%xmm9
	movq	-48(%rsi),%r15

	movq	-40(%rsi),%r14

	movq	-32(%rsi),%r13

	movq	-24(%rsi),%r12

	movq	-16(%rsi),%rbp

	movq	-8(%rsi),%rbx

	leaq	(%rsi),%rsp

.Lepilogue_avx2:
	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3

.LSEH_end_sha256_block_data_order_avx2:

.def	se_handler;	.scl 3;	.type 32;	.endef
.p2align	4
se_handler:
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushfq
	subq	$64,%rsp

	movq	120(%r8),%rax
	movq	248(%r8),%rbx

	movq	8(%r9),%rsi
	movq	56(%r9),%r11

	movl	0(%r11),%r10d
	leaq	(%rsi,%r10,1),%r10
	cmpq	%r10,%rbx
	jb	.Lin_prologue

	movq	152(%r8),%rax

	movl	4(%r11),%r10d
	leaq	(%rsi,%r10,1),%r10
	cmpq	%r10,%rbx
	jae	.Lin_prologue
	leaq	.Lavx2_shortcut(%rip),%r10
	cmpq	%r10,%rbx
	jb	.Lnot_in_avx2

	andq	$-1024,%rax
	addq	$448,%rax
.Lnot_in_avx2:
	movq	%rax,%rsi
	movq	64+24(%rax),%rax

	movq	-8(%rax),%rbx
	movq	-16(%rax),%rbp
	movq	-24(%rax),%r12
	movq	-32(%rax),%r13
	movq	-40(%rax),%r14
	movq	-48(%rax),%r15
	movq	%rbx,144(%r8)
	movq	%rbp,160(%r8)
	movq	%r12,216(%r8)
	movq	%r13,224(%r8)
	movq	%r14,232(%r8)
	movq	%r15,240(%r8)

	leaq	.Lepilogue(%rip),%r10
	cmpq	%r10,%rbx
	jb	.Lin_prologue

	leaq	64+32(%rsi),%rsi
	leaq	512(%r8),%rdi
	movl	$8,%ecx
.long	0xa548f3fc

.Lin_prologue:
	movq	8(%rax),%rdi
	movq	16(%rax),%rsi
	movq	%rax,152(%r8)
	movq	%rsi,168(%r8)
	movq	%rdi,176(%r8)

	movq	40(%r9),%rdi
	movq	%r8,%rsi
	movl	$154,%ecx
.long	0xa548f3fc

	movq	%r9,%rsi
	xorq	%rcx,%rcx
	movq	8(%rsi),%rdx
	movq	0(%rsi),%r8
	movq	16(%rsi),%r9
	movq	40(%rsi),%r10
	leaq	56(%rsi),%r11
	leaq	24(%rsi),%r12
	movq	%r10,32(%rsp)
	movq	%r11,40(%rsp)
	movq	%r12,48(%rsp)
	movq	%rcx,56(%rsp)
	call	*__imp_RtlVirtualUnwind(%rip)

	movl	$1,%eax
	addq	$64,%rsp
	popfq
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	.byte	0xf3,0xc3

.def	shaext_handler;	.scl 3;	.type 32;	.endef
.p2align	4
shaext_handler:
	pushq	%rsi
	pushq	%rdi
	pushq	%rbx
	pushq	%rbp
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	pushfq
	subq	$64,%rsp

	movq	120(%r8),%rax
	movq	248(%r8),%rbx

	leaq	.Lprologue_shaext(%rip),%r10
	cmpq	%r10,%rbx
	jb	.Lin_prologue

	leaq	.Lepilogue_shaext(%rip),%r10
	cmpq	%r10,%rbx
	jae	.Lin_prologue

	leaq	-8-80(%rax),%rsi
	leaq	512(%r8),%rdi
	movl	$10,%ecx
.long	0xa548f3fc

	jmp	.Lin_prologue

.section	.pdata
.p2align	2
.rva	.LSEH_begin_sha256_block_data_order
.rva	.LSEH_end_sha256_block_data_order
.rva	.LSEH_info_sha256_block_data_order
.rva	.LSEH_begin_sha256_block_data_order_shaext
.rva	.LSEH_end_sha256_block_data_order_shaext
.rva	.LSEH_info_sha256_block_data_order_shaext
.rva	.LSEH_begin_sha256_block_data_order_ssse3
.rva	.LSEH_end_sha256_block_data_order_ssse3
.rva	.LSEH_info_sha256_block_data_order_ssse3
.rva	.LSEH_begin_sha256_block_data_order_avx
.rva	.LSEH_end_sha256_block_data_order_avx
.rva	.LSEH_info_sha256_block_data_order_avx
.rva	.LSEH_begin_sha256_block_data_order_avx2
.rva	.LSEH_end_sha256_block_data_order_avx2
.rva	.LSEH_info_sha256_block_data_order_avx2
.section	.xdata
.p2align	3
.LSEH_info_sha256_block_data_order:
.byte	9,0,0,0
.rva	se_handler
.rva	.Lprologue,.Lepilogue
.LSEH_info_sha256_block_data_order_shaext:
.byte	9,0,0,0
.rva	shaext_handler
.LSEH_info_sha256_block_data_order_ssse3:
.byte	9,0,0,0
.rva	se_handler
.rva	.Lprologue_ssse3,.Lepilogue_ssse3
.LSEH_info_sha256_block_data_order_avx:
.byte	9,0,0,0
.rva	se_handler
.rva	.Lprologue_avx,.Lepilogue_avx
.LSEH_info_sha256_block_data_order_avx2:
.byte	9,0,0,0
.rva	se_handler
.rva	.Lprologue_avx2,.Lepilogue_avx2
