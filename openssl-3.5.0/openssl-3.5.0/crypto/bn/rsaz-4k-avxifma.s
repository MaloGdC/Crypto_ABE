.text	

.globl	ossl_rsaz_amm52x40_x1_avxifma256
.def	ossl_rsaz_amm52x40_x1_avxifma256;	.scl 2;	.type 32;	.endef
.p2align	5
ossl_rsaz_amm52x40_x1_avxifma256:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_ossl_rsaz_amm52x40_x1_avxifma256:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx
	movq	%r9,%rcx
	movq	40(%rsp),%r8


.byte	243,15,30,250
	pushq	%rbx

	pushq	%rbp

	pushq	%r12

	pushq	%r13

	pushq	%r14

	pushq	%r15

	leaq	-168(%rsp),%rsp
	vmovapd	%xmm6,0(%rsp)
	vmovapd	%xmm7,16(%rsp)
	vmovapd	%xmm8,32(%rsp)
	vmovapd	%xmm9,48(%rsp)
	vmovapd	%xmm10,64(%rsp)
	vmovapd	%xmm11,80(%rsp)
	vmovapd	%xmm12,96(%rsp)
	vmovapd	%xmm13,112(%rsp)
	vmovapd	%xmm14,128(%rsp)
	vmovapd	%xmm15,144(%rsp)
.Lossl_rsaz_amm52x40_x1_avxifma256_body:

	vpxor	%ymm0,%ymm0,%ymm0
	vmovapd	%ymm0,%ymm3
	vmovapd	%ymm0,%ymm4
	vmovapd	%ymm0,%ymm5
	vmovapd	%ymm0,%ymm6
	vmovapd	%ymm0,%ymm7
	vmovapd	%ymm0,%ymm8
	vmovapd	%ymm0,%ymm9
	vmovapd	%ymm0,%ymm10
	vmovapd	%ymm0,%ymm11
	vmovapd	%ymm0,%ymm12

	xorl	%r9d,%r9d

	movq	%rdx,%r11
	movq	$0xfffffffffffff,%rax


	movl	$10,%ebx

.p2align	5
.Lloop10:
	movq	0(%r11),%r13

	vpbroadcastq	0(%r11),%ymm1
	movq	0(%rsi),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	movq	%r12,%r10
	adcq	$0,%r10

	movq	%r8,%r13
	imulq	%r9,%r13
	andq	%rax,%r13

	vmovq	%r13,%xmm2
	vpbroadcastq	%xmm2,%ymm2
	movq	0(%rcx),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	adcq	%r12,%r10

	shrq	$52,%r9
	salq	$12,%r10
	orq	%r10,%r9

	leaq	-328(%rsp),%rsp

{vex} vpmadd52luq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52luq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52luq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52luq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52luq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52luq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52luq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52luq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52luq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52luq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52luq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52luq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52luq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52luq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52luq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52luq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52luq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52luq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52luq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52luq 288(%rcx), %ymm2, %ymm12
	vmovdqu	%ymm3,0(%rsp)
	vmovdqu	%ymm4,32(%rsp)
	vmovdqu	%ymm5,64(%rsp)
	vmovdqu	%ymm6,96(%rsp)
	vmovdqu	%ymm7,128(%rsp)
	vmovdqu	%ymm8,160(%rsp)
	vmovdqu	%ymm9,192(%rsp)
	vmovdqu	%ymm10,224(%rsp)
	vmovdqu	%ymm11,256(%rsp)
	vmovdqu	%ymm12,288(%rsp)
	movq	$0,320(%rsp)

	vmovdqu	8(%rsp),%ymm3
	vmovdqu	40(%rsp),%ymm4
	vmovdqu	72(%rsp),%ymm5
	vmovdqu	104(%rsp),%ymm6
	vmovdqu	136(%rsp),%ymm7
	vmovdqu	168(%rsp),%ymm8
	vmovdqu	200(%rsp),%ymm9
	vmovdqu	232(%rsp),%ymm10
	vmovdqu	264(%rsp),%ymm11
	vmovdqu	296(%rsp),%ymm12

	addq	8(%rsp),%r9

{vex} vpmadd52huq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52huq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52huq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52huq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52huq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52huq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52huq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52huq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52huq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52huq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52huq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52huq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52huq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52huq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52huq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52huq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52huq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52huq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52huq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52huq 288(%rcx), %ymm2, %ymm12
	leaq	328(%rsp),%rsp
	movq	8(%r11),%r13

	vpbroadcastq	8(%r11),%ymm1
	movq	0(%rsi),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	movq	%r12,%r10
	adcq	$0,%r10

	movq	%r8,%r13
	imulq	%r9,%r13
	andq	%rax,%r13

	vmovq	%r13,%xmm2
	vpbroadcastq	%xmm2,%ymm2
	movq	0(%rcx),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	adcq	%r12,%r10

	shrq	$52,%r9
	salq	$12,%r10
	orq	%r10,%r9

	leaq	-328(%rsp),%rsp

{vex} vpmadd52luq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52luq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52luq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52luq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52luq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52luq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52luq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52luq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52luq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52luq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52luq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52luq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52luq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52luq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52luq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52luq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52luq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52luq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52luq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52luq 288(%rcx), %ymm2, %ymm12
	vmovdqu	%ymm3,0(%rsp)
	vmovdqu	%ymm4,32(%rsp)
	vmovdqu	%ymm5,64(%rsp)
	vmovdqu	%ymm6,96(%rsp)
	vmovdqu	%ymm7,128(%rsp)
	vmovdqu	%ymm8,160(%rsp)
	vmovdqu	%ymm9,192(%rsp)
	vmovdqu	%ymm10,224(%rsp)
	vmovdqu	%ymm11,256(%rsp)
	vmovdqu	%ymm12,288(%rsp)
	movq	$0,320(%rsp)

	vmovdqu	8(%rsp),%ymm3
	vmovdqu	40(%rsp),%ymm4
	vmovdqu	72(%rsp),%ymm5
	vmovdqu	104(%rsp),%ymm6
	vmovdqu	136(%rsp),%ymm7
	vmovdqu	168(%rsp),%ymm8
	vmovdqu	200(%rsp),%ymm9
	vmovdqu	232(%rsp),%ymm10
	vmovdqu	264(%rsp),%ymm11
	vmovdqu	296(%rsp),%ymm12

	addq	8(%rsp),%r9

{vex} vpmadd52huq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52huq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52huq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52huq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52huq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52huq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52huq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52huq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52huq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52huq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52huq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52huq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52huq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52huq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52huq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52huq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52huq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52huq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52huq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52huq 288(%rcx), %ymm2, %ymm12
	leaq	328(%rsp),%rsp
	movq	16(%r11),%r13

	vpbroadcastq	16(%r11),%ymm1
	movq	0(%rsi),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	movq	%r12,%r10
	adcq	$0,%r10

	movq	%r8,%r13
	imulq	%r9,%r13
	andq	%rax,%r13

	vmovq	%r13,%xmm2
	vpbroadcastq	%xmm2,%ymm2
	movq	0(%rcx),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	adcq	%r12,%r10

	shrq	$52,%r9
	salq	$12,%r10
	orq	%r10,%r9

	leaq	-328(%rsp),%rsp

{vex} vpmadd52luq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52luq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52luq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52luq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52luq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52luq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52luq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52luq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52luq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52luq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52luq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52luq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52luq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52luq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52luq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52luq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52luq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52luq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52luq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52luq 288(%rcx), %ymm2, %ymm12
	vmovdqu	%ymm3,0(%rsp)
	vmovdqu	%ymm4,32(%rsp)
	vmovdqu	%ymm5,64(%rsp)
	vmovdqu	%ymm6,96(%rsp)
	vmovdqu	%ymm7,128(%rsp)
	vmovdqu	%ymm8,160(%rsp)
	vmovdqu	%ymm9,192(%rsp)
	vmovdqu	%ymm10,224(%rsp)
	vmovdqu	%ymm11,256(%rsp)
	vmovdqu	%ymm12,288(%rsp)
	movq	$0,320(%rsp)

	vmovdqu	8(%rsp),%ymm3
	vmovdqu	40(%rsp),%ymm4
	vmovdqu	72(%rsp),%ymm5
	vmovdqu	104(%rsp),%ymm6
	vmovdqu	136(%rsp),%ymm7
	vmovdqu	168(%rsp),%ymm8
	vmovdqu	200(%rsp),%ymm9
	vmovdqu	232(%rsp),%ymm10
	vmovdqu	264(%rsp),%ymm11
	vmovdqu	296(%rsp),%ymm12

	addq	8(%rsp),%r9

{vex} vpmadd52huq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52huq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52huq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52huq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52huq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52huq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52huq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52huq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52huq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52huq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52huq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52huq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52huq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52huq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52huq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52huq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52huq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52huq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52huq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52huq 288(%rcx), %ymm2, %ymm12
	leaq	328(%rsp),%rsp
	movq	24(%r11),%r13

	vpbroadcastq	24(%r11),%ymm1
	movq	0(%rsi),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	movq	%r12,%r10
	adcq	$0,%r10

	movq	%r8,%r13
	imulq	%r9,%r13
	andq	%rax,%r13

	vmovq	%r13,%xmm2
	vpbroadcastq	%xmm2,%ymm2
	movq	0(%rcx),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	adcq	%r12,%r10

	shrq	$52,%r9
	salq	$12,%r10
	orq	%r10,%r9

	leaq	-328(%rsp),%rsp

{vex} vpmadd52luq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52luq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52luq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52luq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52luq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52luq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52luq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52luq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52luq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52luq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52luq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52luq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52luq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52luq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52luq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52luq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52luq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52luq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52luq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52luq 288(%rcx), %ymm2, %ymm12
	vmovdqu	%ymm3,0(%rsp)
	vmovdqu	%ymm4,32(%rsp)
	vmovdqu	%ymm5,64(%rsp)
	vmovdqu	%ymm6,96(%rsp)
	vmovdqu	%ymm7,128(%rsp)
	vmovdqu	%ymm8,160(%rsp)
	vmovdqu	%ymm9,192(%rsp)
	vmovdqu	%ymm10,224(%rsp)
	vmovdqu	%ymm11,256(%rsp)
	vmovdqu	%ymm12,288(%rsp)
	movq	$0,320(%rsp)

	vmovdqu	8(%rsp),%ymm3
	vmovdqu	40(%rsp),%ymm4
	vmovdqu	72(%rsp),%ymm5
	vmovdqu	104(%rsp),%ymm6
	vmovdqu	136(%rsp),%ymm7
	vmovdqu	168(%rsp),%ymm8
	vmovdqu	200(%rsp),%ymm9
	vmovdqu	232(%rsp),%ymm10
	vmovdqu	264(%rsp),%ymm11
	vmovdqu	296(%rsp),%ymm12

	addq	8(%rsp),%r9

{vex} vpmadd52huq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52huq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52huq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52huq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52huq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52huq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52huq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52huq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52huq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52huq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52huq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52huq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52huq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52huq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52huq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52huq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52huq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52huq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52huq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52huq 288(%rcx), %ymm2, %ymm12
	leaq	328(%rsp),%rsp
	leaq	32(%r11),%r11
	decl	%ebx
	jne	.Lloop10

	vmovq	%r9,%xmm0
	vpbroadcastq	%xmm0,%ymm0
	vpblendd	$3,%ymm0,%ymm3,%ymm3

	leaq	-640(%rsp),%rsp
	vmovupd	%ymm3,0(%rsp)
	vmovupd	%ymm4,32(%rsp)
	vmovupd	%ymm5,64(%rsp)
	vmovupd	%ymm6,96(%rsp)
	vmovupd	%ymm7,128(%rsp)
	vmovupd	%ymm8,160(%rsp)
	vmovupd	%ymm9,192(%rsp)
	vmovupd	%ymm10,224(%rsp)
	vmovupd	%ymm11,256(%rsp)
	vmovupd	%ymm12,288(%rsp)



	vpsrlq	$52,%ymm3,%ymm3
	vpsrlq	$52,%ymm4,%ymm4
	vpsrlq	$52,%ymm5,%ymm5
	vpsrlq	$52,%ymm6,%ymm6
	vpsrlq	$52,%ymm7,%ymm7
	vpsrlq	$52,%ymm8,%ymm8
	vpsrlq	$52,%ymm9,%ymm9
	vpsrlq	$52,%ymm10,%ymm10
	vpsrlq	$52,%ymm11,%ymm11
	vpsrlq	$52,%ymm12,%ymm12


	vpermq	$144,%ymm12,%ymm12
	vpermq	$3,%ymm11,%ymm13
	vblendpd	$1,%ymm13,%ymm12,%ymm12

	vpermq	$144,%ymm11,%ymm11
	vpermq	$3,%ymm10,%ymm13
	vblendpd	$1,%ymm13,%ymm11,%ymm11

	vpermq	$144,%ymm10,%ymm10
	vpermq	$3,%ymm9,%ymm13
	vblendpd	$1,%ymm13,%ymm10,%ymm10

	vpermq	$144,%ymm9,%ymm9
	vpermq	$3,%ymm8,%ymm13
	vblendpd	$1,%ymm13,%ymm9,%ymm9

	vpermq	$144,%ymm8,%ymm8
	vpermq	$3,%ymm7,%ymm13
	vblendpd	$1,%ymm13,%ymm8,%ymm8

	vpermq	$144,%ymm7,%ymm7
	vpermq	$3,%ymm6,%ymm13
	vblendpd	$1,%ymm13,%ymm7,%ymm7

	vpermq	$144,%ymm6,%ymm6
	vpermq	$3,%ymm5,%ymm13
	vblendpd	$1,%ymm13,%ymm6,%ymm6

	vpermq	$144,%ymm5,%ymm5
	vpermq	$3,%ymm4,%ymm13
	vblendpd	$1,%ymm13,%ymm5,%ymm5

	vpermq	$144,%ymm4,%ymm4
	vpermq	$3,%ymm3,%ymm13
	vblendpd	$1,%ymm13,%ymm4,%ymm4

	vpermq	$144,%ymm3,%ymm3
	vpand	.Lhigh64x3(%rip),%ymm3,%ymm3

	vmovupd	%ymm3,320(%rsp)
	vmovupd	%ymm4,352(%rsp)
	vmovupd	%ymm5,384(%rsp)
	vmovupd	%ymm6,416(%rsp)
	vmovupd	%ymm7,448(%rsp)
	vmovupd	%ymm8,480(%rsp)
	vmovupd	%ymm9,512(%rsp)
	vmovupd	%ymm10,544(%rsp)
	vmovupd	%ymm11,576(%rsp)
	vmovupd	%ymm12,608(%rsp)

	vmovupd	0(%rsp),%ymm3
	vmovupd	32(%rsp),%ymm4
	vmovupd	64(%rsp),%ymm5
	vmovupd	96(%rsp),%ymm6
	vmovupd	128(%rsp),%ymm7
	vmovupd	160(%rsp),%ymm8
	vmovupd	192(%rsp),%ymm9
	vmovupd	224(%rsp),%ymm10
	vmovupd	256(%rsp),%ymm11
	vmovupd	288(%rsp),%ymm12


	vpand	.Lmask52x4(%rip),%ymm3,%ymm3
	vpand	.Lmask52x4(%rip),%ymm4,%ymm4
	vpand	.Lmask52x4(%rip),%ymm5,%ymm5
	vpand	.Lmask52x4(%rip),%ymm6,%ymm6
	vpand	.Lmask52x4(%rip),%ymm7,%ymm7
	vpand	.Lmask52x4(%rip),%ymm8,%ymm8
	vpand	.Lmask52x4(%rip),%ymm9,%ymm9
	vpand	.Lmask52x4(%rip),%ymm10,%ymm10
	vpand	.Lmask52x4(%rip),%ymm11,%ymm11
	vpand	.Lmask52x4(%rip),%ymm12,%ymm12


	vpaddq	320(%rsp),%ymm3,%ymm3
	vpaddq	352(%rsp),%ymm4,%ymm4
	vpaddq	384(%rsp),%ymm5,%ymm5
	vpaddq	416(%rsp),%ymm6,%ymm6
	vpaddq	448(%rsp),%ymm7,%ymm7
	vpaddq	480(%rsp),%ymm8,%ymm8
	vpaddq	512(%rsp),%ymm9,%ymm9
	vpaddq	544(%rsp),%ymm10,%ymm10
	vpaddq	576(%rsp),%ymm11,%ymm11
	vpaddq	608(%rsp),%ymm12,%ymm12

	leaq	640(%rsp),%rsp



	vpcmpgtq	.Lmask52x4(%rip),%ymm3,%ymm13
	vmovmskpd	%ymm13,%r14d
	vpcmpgtq	.Lmask52x4(%rip),%ymm4,%ymm13
	vmovmskpd	%ymm13,%r13d
	shlb	$4,%r13b
	orb	%r13b,%r14b

	vpcmpgtq	.Lmask52x4(%rip),%ymm5,%ymm13
	vmovmskpd	%ymm13,%r13d
	vpcmpgtq	.Lmask52x4(%rip),%ymm6,%ymm13
	vmovmskpd	%ymm13,%r12d
	shlb	$4,%r12b
	orb	%r12b,%r13b

	vpcmpgtq	.Lmask52x4(%rip),%ymm7,%ymm13
	vmovmskpd	%ymm13,%r12d
	vpcmpgtq	.Lmask52x4(%rip),%ymm8,%ymm13
	vmovmskpd	%ymm13,%r11d
	shlb	$4,%r11b
	orb	%r11b,%r12b

	vpcmpgtq	.Lmask52x4(%rip),%ymm9,%ymm13
	vmovmskpd	%ymm13,%r11d
	vpcmpgtq	.Lmask52x4(%rip),%ymm10,%ymm13
	vmovmskpd	%ymm13,%r10d
	shlb	$4,%r10b
	orb	%r10b,%r11b

	vpcmpgtq	.Lmask52x4(%rip),%ymm11,%ymm13
	vmovmskpd	%ymm13,%r10d
	vpcmpgtq	.Lmask52x4(%rip),%ymm12,%ymm13
	vmovmskpd	%ymm13,%r9d
	shlb	$4,%r9b
	orb	%r9b,%r10b

	addb	%r14b,%r14b
	adcb	%r13b,%r13b
	adcb	%r12b,%r12b
	adcb	%r11b,%r11b
	adcb	%r10b,%r10b


	vpcmpeqq	.Lmask52x4(%rip),%ymm3,%ymm13
	vmovmskpd	%ymm13,%r9d
	vpcmpeqq	.Lmask52x4(%rip),%ymm4,%ymm13
	vmovmskpd	%ymm13,%r8d
	shlb	$4,%r8b
	orb	%r8b,%r9b

	vpcmpeqq	.Lmask52x4(%rip),%ymm5,%ymm13
	vmovmskpd	%ymm13,%r8d
	vpcmpeqq	.Lmask52x4(%rip),%ymm6,%ymm13
	vmovmskpd	%ymm13,%edx
	shlb	$4,%dl
	orb	%dl,%r8b

	vpcmpeqq	.Lmask52x4(%rip),%ymm7,%ymm13
	vmovmskpd	%ymm13,%edx
	vpcmpeqq	.Lmask52x4(%rip),%ymm8,%ymm13
	vmovmskpd	%ymm13,%ecx
	shlb	$4,%cl
	orb	%cl,%dl

	vpcmpeqq	.Lmask52x4(%rip),%ymm9,%ymm13
	vmovmskpd	%ymm13,%ecx
	vpcmpeqq	.Lmask52x4(%rip),%ymm10,%ymm13
	vmovmskpd	%ymm13,%ebx
	shlb	$4,%bl
	orb	%bl,%cl

	vpcmpeqq	.Lmask52x4(%rip),%ymm11,%ymm13
	vmovmskpd	%ymm13,%ebx
	vpcmpeqq	.Lmask52x4(%rip),%ymm12,%ymm13
	vmovmskpd	%ymm13,%eax
	shlb	$4,%al
	orb	%al,%bl

	addb	%r9b,%r14b
	adcb	%r8b,%r13b
	adcb	%dl,%r12b
	adcb	%cl,%r11b
	adcb	%bl,%r10b

	xorb	%r9b,%r14b
	xorb	%r8b,%r13b
	xorb	%dl,%r12b
	xorb	%cl,%r11b
	xorb	%bl,%r10b

	pushq	%r9
	pushq	%r8

	leaq	.Lkmasklut(%rip),%r8

	movb	%r14b,%r9b
	andq	$0xf,%r14
	vpsubq	.Lmask52x4(%rip),%ymm3,%ymm13
	shlq	$5,%r14
	vmovapd	(%r8,%r14), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm3,%ymm3

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm4,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm4,%ymm4

	movb	%r13b,%r9b
	andq	$0xf,%r13
	vpsubq	.Lmask52x4(%rip),%ymm5,%ymm13
	shlq	$5,%r13
	vmovapd	(%r8,%r13), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm5,%ymm5

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm6,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm6,%ymm6

	movb	%r12b,%r9b
	andq	$0xf,%r12
	vpsubq	.Lmask52x4(%rip),%ymm7,%ymm13
	shlq	$5,%r12
	vmovapd	(%r8,%r12), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm7,%ymm7

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm8,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm8,%ymm8

	movb	%r11b,%r9b
	andq	$0xf,%r11
	vpsubq	.Lmask52x4(%rip),%ymm9,%ymm13
	shlq	$5,%r11
	vmovapd	(%r8,%r11), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm9,%ymm9

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm10,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm10,%ymm10

	movb	%r10b,%r9b
	andq	$0xf,%r10
	vpsubq	.Lmask52x4(%rip),%ymm11,%ymm13
	shlq	$5,%r10
	vmovapd	(%r8,%r10), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm11,%ymm11

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm12,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm12,%ymm12

	popq	%r8
	popq	%r9

	vpand	.Lmask52x4(%rip),%ymm3,%ymm3
	vpand	.Lmask52x4(%rip),%ymm4,%ymm4
	vpand	.Lmask52x4(%rip),%ymm5,%ymm5
	vpand	.Lmask52x4(%rip),%ymm6,%ymm6
	vpand	.Lmask52x4(%rip),%ymm7,%ymm7
	vpand	.Lmask52x4(%rip),%ymm8,%ymm8
	vpand	.Lmask52x4(%rip),%ymm9,%ymm9

	vpand	.Lmask52x4(%rip),%ymm10,%ymm10
	vpand	.Lmask52x4(%rip),%ymm11,%ymm11
	vpand	.Lmask52x4(%rip),%ymm12,%ymm12

	vmovdqu	%ymm3,0(%rdi)
	vmovdqu	%ymm4,32(%rdi)
	vmovdqu	%ymm5,64(%rdi)
	vmovdqu	%ymm6,96(%rdi)
	vmovdqu	%ymm7,128(%rdi)
	vmovdqu	%ymm8,160(%rdi)
	vmovdqu	%ymm9,192(%rdi)
	vmovdqu	%ymm10,224(%rdi)
	vmovdqu	%ymm11,256(%rdi)
	vmovdqu	%ymm12,288(%rdi)

	vzeroupper
	leaq	(%rsp),%rax

	vmovapd	0(%rax),%xmm6
	vmovapd	16(%rax),%xmm7
	vmovapd	32(%rax),%xmm8
	vmovapd	48(%rax),%xmm9
	vmovapd	64(%rax),%xmm10
	vmovapd	80(%rax),%xmm11
	vmovapd	96(%rax),%xmm12
	vmovapd	112(%rax),%xmm13
	vmovapd	128(%rax),%xmm14
	vmovapd	144(%rax),%xmm15
	leaq	168(%rsp),%rax
	movq	0(%rax),%r15

	movq	8(%rax),%r14

	movq	16(%rax),%r13

	movq	24(%rax),%r12

	movq	32(%rax),%rbp

	movq	40(%rax),%rbx

	leaq	48(%rax),%rsp

.Lossl_rsaz_amm52x40_x1_avxifma256_epilogue:

	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3

.LSEH_end_ossl_rsaz_amm52x40_x1_avxifma256:
.section	.rodata
.p2align	5
.Lmask52x4:
.quad	0xfffffffffffff
.quad	0xfffffffffffff
.quad	0xfffffffffffff
.quad	0xfffffffffffff
.Lhigh64x3:
.quad	0x0
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.Lkmasklut:

.quad	0x0
.quad	0x0
.quad	0x0
.quad	0x0

.quad	0xffffffffffffffff
.quad	0x0
.quad	0x0
.quad	0x0

.quad	0x0
.quad	0xffffffffffffffff
.quad	0x0
.quad	0x0

.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.quad	0x0
.quad	0x0

.quad	0x0
.quad	0x0
.quad	0xffffffffffffffff
.quad	0x0

.quad	0xffffffffffffffff
.quad	0x0
.quad	0xffffffffffffffff
.quad	0x0

.quad	0x0
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.quad	0x0

.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.quad	0x0

.quad	0x0
.quad	0x0
.quad	0x0
.quad	0xffffffffffffffff

.quad	0xffffffffffffffff
.quad	0x0
.quad	0x0
.quad	0xffffffffffffffff

.quad	0x0
.quad	0xffffffffffffffff
.quad	0x0
.quad	0xffffffffffffffff

.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.quad	0x0
.quad	0xffffffffffffffff

.quad	0x0
.quad	0x0
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff

.quad	0xffffffffffffffff
.quad	0x0
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff

.quad	0x0
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff

.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.quad	0xffffffffffffffff
.text	

.globl	ossl_rsaz_amm52x40_x2_avxifma256
.def	ossl_rsaz_amm52x40_x2_avxifma256;	.scl 2;	.type 32;	.endef
.p2align	5
ossl_rsaz_amm52x40_x2_avxifma256:
	movq	%rdi,8(%rsp)
	movq	%rsi,16(%rsp)
	movq	%rsp,%rax
.LSEH_begin_ossl_rsaz_amm52x40_x2_avxifma256:
	movq	%rcx,%rdi
	movq	%rdx,%rsi
	movq	%r8,%rdx
	movq	%r9,%rcx
	movq	40(%rsp),%r8


.byte	243,15,30,250
	pushq	%rbx

	pushq	%rbp

	pushq	%r12

	pushq	%r13

	pushq	%r14

	pushq	%r15

	leaq	-168(%rsp),%rsp
	vmovapd	%xmm6,0(%rsp)
	vmovapd	%xmm7,16(%rsp)
	vmovapd	%xmm8,32(%rsp)
	vmovapd	%xmm9,48(%rsp)
	vmovapd	%xmm10,64(%rsp)
	vmovapd	%xmm11,80(%rsp)
	vmovapd	%xmm12,96(%rsp)
	vmovapd	%xmm13,112(%rsp)
	vmovapd	%xmm14,128(%rsp)
	vmovapd	%xmm15,144(%rsp)
.Lossl_rsaz_amm52x40_x2_avxifma256_body:

	vpxor	%ymm0,%ymm0,%ymm0
	vmovapd	%ymm0,%ymm3
	vmovapd	%ymm0,%ymm4
	vmovapd	%ymm0,%ymm5
	vmovapd	%ymm0,%ymm6
	vmovapd	%ymm0,%ymm7
	vmovapd	%ymm0,%ymm8
	vmovapd	%ymm0,%ymm9
	vmovapd	%ymm0,%ymm10
	vmovapd	%ymm0,%ymm11
	vmovapd	%ymm0,%ymm12

	xorl	%r9d,%r9d

	movq	%rdx,%r11
	movq	$0xfffffffffffff,%rax

	movl	$40,%ebx

.p2align	5
.Lloop40:
	movq	0(%r11),%r13

	vpbroadcastq	0(%r11),%ymm1
	movq	0(%rsi),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	movq	%r12,%r10
	adcq	$0,%r10

	movq	(%r8),%r13
	imulq	%r9,%r13
	andq	%rax,%r13

	vmovq	%r13,%xmm2
	vpbroadcastq	%xmm2,%ymm2
	movq	0(%rcx),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	adcq	%r12,%r10

	shrq	$52,%r9
	salq	$12,%r10
	orq	%r10,%r9

	leaq	-328(%rsp),%rsp

{vex} vpmadd52luq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52luq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52luq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52luq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52luq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52luq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52luq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52luq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52luq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52luq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52luq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52luq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52luq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52luq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52luq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52luq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52luq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52luq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52luq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52luq 288(%rcx), %ymm2, %ymm12
	vmovdqu	%ymm3,0(%rsp)
	vmovdqu	%ymm4,32(%rsp)
	vmovdqu	%ymm5,64(%rsp)
	vmovdqu	%ymm6,96(%rsp)
	vmovdqu	%ymm7,128(%rsp)
	vmovdqu	%ymm8,160(%rsp)
	vmovdqu	%ymm9,192(%rsp)
	vmovdqu	%ymm10,224(%rsp)
	vmovdqu	%ymm11,256(%rsp)
	vmovdqu	%ymm12,288(%rsp)
	movq	$0,320(%rsp)

	vmovdqu	8(%rsp),%ymm3
	vmovdqu	40(%rsp),%ymm4
	vmovdqu	72(%rsp),%ymm5
	vmovdqu	104(%rsp),%ymm6
	vmovdqu	136(%rsp),%ymm7
	vmovdqu	168(%rsp),%ymm8
	vmovdqu	200(%rsp),%ymm9
	vmovdqu	232(%rsp),%ymm10
	vmovdqu	264(%rsp),%ymm11
	vmovdqu	296(%rsp),%ymm12

	addq	8(%rsp),%r9

{vex} vpmadd52huq 0(%rsi), %ymm1, %ymm3
{vex} vpmadd52huq 32(%rsi), %ymm1, %ymm4
{vex} vpmadd52huq 64(%rsi), %ymm1, %ymm5
{vex} vpmadd52huq 96(%rsi), %ymm1, %ymm6
{vex} vpmadd52huq 128(%rsi), %ymm1, %ymm7
{vex} vpmadd52huq 160(%rsi), %ymm1, %ymm8
{vex} vpmadd52huq 192(%rsi), %ymm1, %ymm9
{vex} vpmadd52huq 224(%rsi), %ymm1, %ymm10
{vex} vpmadd52huq 256(%rsi), %ymm1, %ymm11
{vex} vpmadd52huq 288(%rsi), %ymm1, %ymm12

{vex} vpmadd52huq 0(%rcx), %ymm2, %ymm3
{vex} vpmadd52huq 32(%rcx), %ymm2, %ymm4
{vex} vpmadd52huq 64(%rcx), %ymm2, %ymm5
{vex} vpmadd52huq 96(%rcx), %ymm2, %ymm6
{vex} vpmadd52huq 128(%rcx), %ymm2, %ymm7
{vex} vpmadd52huq 160(%rcx), %ymm2, %ymm8
{vex} vpmadd52huq 192(%rcx), %ymm2, %ymm9
{vex} vpmadd52huq 224(%rcx), %ymm2, %ymm10
{vex} vpmadd52huq 256(%rcx), %ymm2, %ymm11
{vex} vpmadd52huq 288(%rcx), %ymm2, %ymm12
	leaq	328(%rsp),%rsp
	leaq	8(%r11),%r11
	decl	%ebx
	jne	.Lloop40

	pushq	%r11
	pushq	%rsi
	pushq	%rcx
	pushq	%r8

	vmovq	%r9,%xmm0
	vpbroadcastq	%xmm0,%ymm0
	vpblendd	$3,%ymm0,%ymm3,%ymm3

	leaq	-640(%rsp),%rsp
	vmovupd	%ymm3,0(%rsp)
	vmovupd	%ymm4,32(%rsp)
	vmovupd	%ymm5,64(%rsp)
	vmovupd	%ymm6,96(%rsp)
	vmovupd	%ymm7,128(%rsp)
	vmovupd	%ymm8,160(%rsp)
	vmovupd	%ymm9,192(%rsp)
	vmovupd	%ymm10,224(%rsp)
	vmovupd	%ymm11,256(%rsp)
	vmovupd	%ymm12,288(%rsp)



	vpsrlq	$52,%ymm3,%ymm3
	vpsrlq	$52,%ymm4,%ymm4
	vpsrlq	$52,%ymm5,%ymm5
	vpsrlq	$52,%ymm6,%ymm6
	vpsrlq	$52,%ymm7,%ymm7
	vpsrlq	$52,%ymm8,%ymm8
	vpsrlq	$52,%ymm9,%ymm9
	vpsrlq	$52,%ymm10,%ymm10
	vpsrlq	$52,%ymm11,%ymm11
	vpsrlq	$52,%ymm12,%ymm12


	vpermq	$144,%ymm12,%ymm12
	vpermq	$3,%ymm11,%ymm13
	vblendpd	$1,%ymm13,%ymm12,%ymm12

	vpermq	$144,%ymm11,%ymm11
	vpermq	$3,%ymm10,%ymm13
	vblendpd	$1,%ymm13,%ymm11,%ymm11

	vpermq	$144,%ymm10,%ymm10
	vpermq	$3,%ymm9,%ymm13
	vblendpd	$1,%ymm13,%ymm10,%ymm10

	vpermq	$144,%ymm9,%ymm9
	vpermq	$3,%ymm8,%ymm13
	vblendpd	$1,%ymm13,%ymm9,%ymm9

	vpermq	$144,%ymm8,%ymm8
	vpermq	$3,%ymm7,%ymm13
	vblendpd	$1,%ymm13,%ymm8,%ymm8

	vpermq	$144,%ymm7,%ymm7
	vpermq	$3,%ymm6,%ymm13
	vblendpd	$1,%ymm13,%ymm7,%ymm7

	vpermq	$144,%ymm6,%ymm6
	vpermq	$3,%ymm5,%ymm13
	vblendpd	$1,%ymm13,%ymm6,%ymm6

	vpermq	$144,%ymm5,%ymm5
	vpermq	$3,%ymm4,%ymm13
	vblendpd	$1,%ymm13,%ymm5,%ymm5

	vpermq	$144,%ymm4,%ymm4
	vpermq	$3,%ymm3,%ymm13
	vblendpd	$1,%ymm13,%ymm4,%ymm4

	vpermq	$144,%ymm3,%ymm3
	vpand	.Lhigh64x3(%rip),%ymm3,%ymm3

	vmovupd	%ymm3,320(%rsp)
	vmovupd	%ymm4,352(%rsp)
	vmovupd	%ymm5,384(%rsp)
	vmovupd	%ymm6,416(%rsp)
	vmovupd	%ymm7,448(%rsp)
	vmovupd	%ymm8,480(%rsp)
	vmovupd	%ymm9,512(%rsp)
	vmovupd	%ymm10,544(%rsp)
	vmovupd	%ymm11,576(%rsp)
	vmovupd	%ymm12,608(%rsp)

	vmovupd	0(%rsp),%ymm3
	vmovupd	32(%rsp),%ymm4
	vmovupd	64(%rsp),%ymm5
	vmovupd	96(%rsp),%ymm6
	vmovupd	128(%rsp),%ymm7
	vmovupd	160(%rsp),%ymm8
	vmovupd	192(%rsp),%ymm9
	vmovupd	224(%rsp),%ymm10
	vmovupd	256(%rsp),%ymm11
	vmovupd	288(%rsp),%ymm12


	vpand	.Lmask52x4(%rip),%ymm3,%ymm3
	vpand	.Lmask52x4(%rip),%ymm4,%ymm4
	vpand	.Lmask52x4(%rip),%ymm5,%ymm5
	vpand	.Lmask52x4(%rip),%ymm6,%ymm6
	vpand	.Lmask52x4(%rip),%ymm7,%ymm7
	vpand	.Lmask52x4(%rip),%ymm8,%ymm8
	vpand	.Lmask52x4(%rip),%ymm9,%ymm9
	vpand	.Lmask52x4(%rip),%ymm10,%ymm10
	vpand	.Lmask52x4(%rip),%ymm11,%ymm11
	vpand	.Lmask52x4(%rip),%ymm12,%ymm12


	vpaddq	320(%rsp),%ymm3,%ymm3
	vpaddq	352(%rsp),%ymm4,%ymm4
	vpaddq	384(%rsp),%ymm5,%ymm5
	vpaddq	416(%rsp),%ymm6,%ymm6
	vpaddq	448(%rsp),%ymm7,%ymm7
	vpaddq	480(%rsp),%ymm8,%ymm8
	vpaddq	512(%rsp),%ymm9,%ymm9
	vpaddq	544(%rsp),%ymm10,%ymm10
	vpaddq	576(%rsp),%ymm11,%ymm11
	vpaddq	608(%rsp),%ymm12,%ymm12

	leaq	640(%rsp),%rsp



	vpcmpgtq	.Lmask52x4(%rip),%ymm3,%ymm13
	vmovmskpd	%ymm13,%r14d
	vpcmpgtq	.Lmask52x4(%rip),%ymm4,%ymm13
	vmovmskpd	%ymm13,%r13d
	shlb	$4,%r13b
	orb	%r13b,%r14b

	vpcmpgtq	.Lmask52x4(%rip),%ymm5,%ymm13
	vmovmskpd	%ymm13,%r13d
	vpcmpgtq	.Lmask52x4(%rip),%ymm6,%ymm13
	vmovmskpd	%ymm13,%r12d
	shlb	$4,%r12b
	orb	%r12b,%r13b

	vpcmpgtq	.Lmask52x4(%rip),%ymm7,%ymm13
	vmovmskpd	%ymm13,%r12d
	vpcmpgtq	.Lmask52x4(%rip),%ymm8,%ymm13
	vmovmskpd	%ymm13,%r11d
	shlb	$4,%r11b
	orb	%r11b,%r12b

	vpcmpgtq	.Lmask52x4(%rip),%ymm9,%ymm13
	vmovmskpd	%ymm13,%r11d
	vpcmpgtq	.Lmask52x4(%rip),%ymm10,%ymm13
	vmovmskpd	%ymm13,%r10d
	shlb	$4,%r10b
	orb	%r10b,%r11b

	vpcmpgtq	.Lmask52x4(%rip),%ymm11,%ymm13
	vmovmskpd	%ymm13,%r10d
	vpcmpgtq	.Lmask52x4(%rip),%ymm12,%ymm13
	vmovmskpd	%ymm13,%r9d
	shlb	$4,%r9b
	orb	%r9b,%r10b

	addb	%r14b,%r14b
	adcb	%r13b,%r13b
	adcb	%r12b,%r12b
	adcb	%r11b,%r11b
	adcb	%r10b,%r10b


	vpcmpeqq	.Lmask52x4(%rip),%ymm3,%ymm13
	vmovmskpd	%ymm13,%r9d
	vpcmpeqq	.Lmask52x4(%rip),%ymm4,%ymm13
	vmovmskpd	%ymm13,%r8d
	shlb	$4,%r8b
	orb	%r8b,%r9b

	vpcmpeqq	.Lmask52x4(%rip),%ymm5,%ymm13
	vmovmskpd	%ymm13,%r8d
	vpcmpeqq	.Lmask52x4(%rip),%ymm6,%ymm13
	vmovmskpd	%ymm13,%edx
	shlb	$4,%dl
	orb	%dl,%r8b

	vpcmpeqq	.Lmask52x4(%rip),%ymm7,%ymm13
	vmovmskpd	%ymm13,%edx
	vpcmpeqq	.Lmask52x4(%rip),%ymm8,%ymm13
	vmovmskpd	%ymm13,%ecx
	shlb	$4,%cl
	orb	%cl,%dl

	vpcmpeqq	.Lmask52x4(%rip),%ymm9,%ymm13
	vmovmskpd	%ymm13,%ecx
	vpcmpeqq	.Lmask52x4(%rip),%ymm10,%ymm13
	vmovmskpd	%ymm13,%ebx
	shlb	$4,%bl
	orb	%bl,%cl

	vpcmpeqq	.Lmask52x4(%rip),%ymm11,%ymm13
	vmovmskpd	%ymm13,%ebx
	vpcmpeqq	.Lmask52x4(%rip),%ymm12,%ymm13
	vmovmskpd	%ymm13,%eax
	shlb	$4,%al
	orb	%al,%bl

	addb	%r9b,%r14b
	adcb	%r8b,%r13b
	adcb	%dl,%r12b
	adcb	%cl,%r11b
	adcb	%bl,%r10b

	xorb	%r9b,%r14b
	xorb	%r8b,%r13b
	xorb	%dl,%r12b
	xorb	%cl,%r11b
	xorb	%bl,%r10b

	pushq	%r9
	pushq	%r8

	leaq	.Lkmasklut(%rip),%r8

	movb	%r14b,%r9b
	andq	$0xf,%r14
	vpsubq	.Lmask52x4(%rip),%ymm3,%ymm13
	shlq	$5,%r14
	vmovapd	(%r8,%r14), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm3,%ymm3

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm4,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm4,%ymm4

	movb	%r13b,%r9b
	andq	$0xf,%r13
	vpsubq	.Lmask52x4(%rip),%ymm5,%ymm13
	shlq	$5,%r13
	vmovapd	(%r8,%r13), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm5,%ymm5

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm6,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm6,%ymm6

	movb	%r12b,%r9b
	andq	$0xf,%r12
	vpsubq	.Lmask52x4(%rip),%ymm7,%ymm13
	shlq	$5,%r12
	vmovapd	(%r8,%r12), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm7,%ymm7

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm8,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm8,%ymm8

	movb	%r11b,%r9b
	andq	$0xf,%r11
	vpsubq	.Lmask52x4(%rip),%ymm9,%ymm13
	shlq	$5,%r11
	vmovapd	(%r8,%r11), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm9,%ymm9

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm10,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm10,%ymm10

	movb	%r10b,%r9b
	andq	$0xf,%r10
	vpsubq	.Lmask52x4(%rip),%ymm11,%ymm13
	shlq	$5,%r10
	vmovapd	(%r8,%r10), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm11,%ymm11

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm12,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm12,%ymm12

	popq	%r8
	popq	%r9

	vpand	.Lmask52x4(%rip),%ymm3,%ymm3
	vpand	.Lmask52x4(%rip),%ymm4,%ymm4
	vpand	.Lmask52x4(%rip),%ymm5,%ymm5
	vpand	.Lmask52x4(%rip),%ymm6,%ymm6
	vpand	.Lmask52x4(%rip),%ymm7,%ymm7
	vpand	.Lmask52x4(%rip),%ymm8,%ymm8
	vpand	.Lmask52x4(%rip),%ymm9,%ymm9

	vpand	.Lmask52x4(%rip),%ymm10,%ymm10
	vpand	.Lmask52x4(%rip),%ymm11,%ymm11
	vpand	.Lmask52x4(%rip),%ymm12,%ymm12

	popq	%r8
	popq	%rcx
	popq	%rsi
	popq	%r11

	vmovdqu	%ymm3,0(%rdi)
	vmovdqu	%ymm4,32(%rdi)
	vmovdqu	%ymm5,64(%rdi)
	vmovdqu	%ymm6,96(%rdi)
	vmovdqu	%ymm7,128(%rdi)
	vmovdqu	%ymm8,160(%rdi)
	vmovdqu	%ymm9,192(%rdi)
	vmovdqu	%ymm10,224(%rdi)
	vmovdqu	%ymm11,256(%rdi)
	vmovdqu	%ymm12,288(%rdi)

	xorl	%r15d,%r15d

	movq	$0xfffffffffffff,%rax

	movl	$40,%ebx

	vpxor	%ymm0,%ymm0,%ymm0
	vmovapd	%ymm0,%ymm3
	vmovapd	%ymm0,%ymm4
	vmovapd	%ymm0,%ymm5
	vmovapd	%ymm0,%ymm6
	vmovapd	%ymm0,%ymm7
	vmovapd	%ymm0,%ymm8
	vmovapd	%ymm0,%ymm9
	vmovapd	%ymm0,%ymm10
	vmovapd	%ymm0,%ymm11
	vmovapd	%ymm0,%ymm12
.p2align	5
.Lloop40_1:
	movq	0(%r11),%r13

	vpbroadcastq	0(%r11),%ymm1
	movq	320(%rsi),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	movq	%r12,%r10
	adcq	$0,%r10

	movq	8(%r8),%r13
	imulq	%r9,%r13
	andq	%rax,%r13

	vmovq	%r13,%xmm2
	vpbroadcastq	%xmm2,%ymm2
	movq	320(%rcx),%rdx
	mulxq	%r13,%r13,%r12
	addq	%r13,%r9
	adcq	%r12,%r10

	shrq	$52,%r9
	salq	$12,%r10
	orq	%r10,%r9

	leaq	-328(%rsp),%rsp

{vex} vpmadd52luq 320(%rsi), %ymm1, %ymm3
{vex} vpmadd52luq 352(%rsi), %ymm1, %ymm4
{vex} vpmadd52luq 384(%rsi), %ymm1, %ymm5
{vex} vpmadd52luq 416(%rsi), %ymm1, %ymm6
{vex} vpmadd52luq 448(%rsi), %ymm1, %ymm7
{vex} vpmadd52luq 480(%rsi), %ymm1, %ymm8
{vex} vpmadd52luq 512(%rsi), %ymm1, %ymm9
{vex} vpmadd52luq 544(%rsi), %ymm1, %ymm10
{vex} vpmadd52luq 576(%rsi), %ymm1, %ymm11
{vex} vpmadd52luq 608(%rsi), %ymm1, %ymm12

{vex} vpmadd52luq 320(%rcx), %ymm2, %ymm3
{vex} vpmadd52luq 352(%rcx), %ymm2, %ymm4
{vex} vpmadd52luq 384(%rcx), %ymm2, %ymm5
{vex} vpmadd52luq 416(%rcx), %ymm2, %ymm6
{vex} vpmadd52luq 448(%rcx), %ymm2, %ymm7
{vex} vpmadd52luq 480(%rcx), %ymm2, %ymm8
{vex} vpmadd52luq 512(%rcx), %ymm2, %ymm9
{vex} vpmadd52luq 544(%rcx), %ymm2, %ymm10
{vex} vpmadd52luq 576(%rcx), %ymm2, %ymm11
{vex} vpmadd52luq 608(%rcx), %ymm2, %ymm12
	vmovdqu	%ymm3,0(%rsp)
	vmovdqu	%ymm4,32(%rsp)
	vmovdqu	%ymm5,64(%rsp)
	vmovdqu	%ymm6,96(%rsp)
	vmovdqu	%ymm7,128(%rsp)
	vmovdqu	%ymm8,160(%rsp)
	vmovdqu	%ymm9,192(%rsp)
	vmovdqu	%ymm10,224(%rsp)
	vmovdqu	%ymm11,256(%rsp)
	vmovdqu	%ymm12,288(%rsp)
	movq	$0,320(%rsp)

	vmovdqu	8(%rsp),%ymm3
	vmovdqu	40(%rsp),%ymm4
	vmovdqu	72(%rsp),%ymm5
	vmovdqu	104(%rsp),%ymm6
	vmovdqu	136(%rsp),%ymm7
	vmovdqu	168(%rsp),%ymm8
	vmovdqu	200(%rsp),%ymm9
	vmovdqu	232(%rsp),%ymm10
	vmovdqu	264(%rsp),%ymm11
	vmovdqu	296(%rsp),%ymm12

	addq	8(%rsp),%r9

{vex} vpmadd52huq 320(%rsi), %ymm1, %ymm3
{vex} vpmadd52huq 352(%rsi), %ymm1, %ymm4
{vex} vpmadd52huq 384(%rsi), %ymm1, %ymm5
{vex} vpmadd52huq 416(%rsi), %ymm1, %ymm6
{vex} vpmadd52huq 448(%rsi), %ymm1, %ymm7
{vex} vpmadd52huq 480(%rsi), %ymm1, %ymm8
{vex} vpmadd52huq 512(%rsi), %ymm1, %ymm9
{vex} vpmadd52huq 544(%rsi), %ymm1, %ymm10
{vex} vpmadd52huq 576(%rsi), %ymm1, %ymm11
{vex} vpmadd52huq 608(%rsi), %ymm1, %ymm12

{vex} vpmadd52huq 320(%rcx), %ymm2, %ymm3
{vex} vpmadd52huq 352(%rcx), %ymm2, %ymm4
{vex} vpmadd52huq 384(%rcx), %ymm2, %ymm5
{vex} vpmadd52huq 416(%rcx), %ymm2, %ymm6
{vex} vpmadd52huq 448(%rcx), %ymm2, %ymm7
{vex} vpmadd52huq 480(%rcx), %ymm2, %ymm8
{vex} vpmadd52huq 512(%rcx), %ymm2, %ymm9
{vex} vpmadd52huq 544(%rcx), %ymm2, %ymm10
{vex} vpmadd52huq 576(%rcx), %ymm2, %ymm11
{vex} vpmadd52huq 608(%rcx), %ymm2, %ymm12
	leaq	328(%rsp),%rsp
	leaq	8(%r11),%r11
	decl	%ebx
	jne	.Lloop40_1

	vmovq	%r9,%xmm0
	vpbroadcastq	%xmm0,%ymm0
	vpblendd	$3,%ymm0,%ymm3,%ymm3

	leaq	-640(%rsp),%rsp
	vmovupd	%ymm3,0(%rsp)
	vmovupd	%ymm4,32(%rsp)
	vmovupd	%ymm5,64(%rsp)
	vmovupd	%ymm6,96(%rsp)
	vmovupd	%ymm7,128(%rsp)
	vmovupd	%ymm8,160(%rsp)
	vmovupd	%ymm9,192(%rsp)
	vmovupd	%ymm10,224(%rsp)
	vmovupd	%ymm11,256(%rsp)
	vmovupd	%ymm12,288(%rsp)



	vpsrlq	$52,%ymm3,%ymm3
	vpsrlq	$52,%ymm4,%ymm4
	vpsrlq	$52,%ymm5,%ymm5
	vpsrlq	$52,%ymm6,%ymm6
	vpsrlq	$52,%ymm7,%ymm7
	vpsrlq	$52,%ymm8,%ymm8
	vpsrlq	$52,%ymm9,%ymm9
	vpsrlq	$52,%ymm10,%ymm10
	vpsrlq	$52,%ymm11,%ymm11
	vpsrlq	$52,%ymm12,%ymm12


	vpermq	$144,%ymm12,%ymm12
	vpermq	$3,%ymm11,%ymm13
	vblendpd	$1,%ymm13,%ymm12,%ymm12

	vpermq	$144,%ymm11,%ymm11
	vpermq	$3,%ymm10,%ymm13
	vblendpd	$1,%ymm13,%ymm11,%ymm11

	vpermq	$144,%ymm10,%ymm10
	vpermq	$3,%ymm9,%ymm13
	vblendpd	$1,%ymm13,%ymm10,%ymm10

	vpermq	$144,%ymm9,%ymm9
	vpermq	$3,%ymm8,%ymm13
	vblendpd	$1,%ymm13,%ymm9,%ymm9

	vpermq	$144,%ymm8,%ymm8
	vpermq	$3,%ymm7,%ymm13
	vblendpd	$1,%ymm13,%ymm8,%ymm8

	vpermq	$144,%ymm7,%ymm7
	vpermq	$3,%ymm6,%ymm13
	vblendpd	$1,%ymm13,%ymm7,%ymm7

	vpermq	$144,%ymm6,%ymm6
	vpermq	$3,%ymm5,%ymm13
	vblendpd	$1,%ymm13,%ymm6,%ymm6

	vpermq	$144,%ymm5,%ymm5
	vpermq	$3,%ymm4,%ymm13
	vblendpd	$1,%ymm13,%ymm5,%ymm5

	vpermq	$144,%ymm4,%ymm4
	vpermq	$3,%ymm3,%ymm13
	vblendpd	$1,%ymm13,%ymm4,%ymm4

	vpermq	$144,%ymm3,%ymm3
	vpand	.Lhigh64x3(%rip),%ymm3,%ymm3

	vmovupd	%ymm3,320(%rsp)
	vmovupd	%ymm4,352(%rsp)
	vmovupd	%ymm5,384(%rsp)
	vmovupd	%ymm6,416(%rsp)
	vmovupd	%ymm7,448(%rsp)
	vmovupd	%ymm8,480(%rsp)
	vmovupd	%ymm9,512(%rsp)
	vmovupd	%ymm10,544(%rsp)
	vmovupd	%ymm11,576(%rsp)
	vmovupd	%ymm12,608(%rsp)

	vmovupd	0(%rsp),%ymm3
	vmovupd	32(%rsp),%ymm4
	vmovupd	64(%rsp),%ymm5
	vmovupd	96(%rsp),%ymm6
	vmovupd	128(%rsp),%ymm7
	vmovupd	160(%rsp),%ymm8
	vmovupd	192(%rsp),%ymm9
	vmovupd	224(%rsp),%ymm10
	vmovupd	256(%rsp),%ymm11
	vmovupd	288(%rsp),%ymm12


	vpand	.Lmask52x4(%rip),%ymm3,%ymm3
	vpand	.Lmask52x4(%rip),%ymm4,%ymm4
	vpand	.Lmask52x4(%rip),%ymm5,%ymm5
	vpand	.Lmask52x4(%rip),%ymm6,%ymm6
	vpand	.Lmask52x4(%rip),%ymm7,%ymm7
	vpand	.Lmask52x4(%rip),%ymm8,%ymm8
	vpand	.Lmask52x4(%rip),%ymm9,%ymm9
	vpand	.Lmask52x4(%rip),%ymm10,%ymm10
	vpand	.Lmask52x4(%rip),%ymm11,%ymm11
	vpand	.Lmask52x4(%rip),%ymm12,%ymm12


	vpaddq	320(%rsp),%ymm3,%ymm3
	vpaddq	352(%rsp),%ymm4,%ymm4
	vpaddq	384(%rsp),%ymm5,%ymm5
	vpaddq	416(%rsp),%ymm6,%ymm6
	vpaddq	448(%rsp),%ymm7,%ymm7
	vpaddq	480(%rsp),%ymm8,%ymm8
	vpaddq	512(%rsp),%ymm9,%ymm9
	vpaddq	544(%rsp),%ymm10,%ymm10
	vpaddq	576(%rsp),%ymm11,%ymm11
	vpaddq	608(%rsp),%ymm12,%ymm12

	leaq	640(%rsp),%rsp



	vpcmpgtq	.Lmask52x4(%rip),%ymm3,%ymm13
	vmovmskpd	%ymm13,%r14d
	vpcmpgtq	.Lmask52x4(%rip),%ymm4,%ymm13
	vmovmskpd	%ymm13,%r13d
	shlb	$4,%r13b
	orb	%r13b,%r14b

	vpcmpgtq	.Lmask52x4(%rip),%ymm5,%ymm13
	vmovmskpd	%ymm13,%r13d
	vpcmpgtq	.Lmask52x4(%rip),%ymm6,%ymm13
	vmovmskpd	%ymm13,%r12d
	shlb	$4,%r12b
	orb	%r12b,%r13b

	vpcmpgtq	.Lmask52x4(%rip),%ymm7,%ymm13
	vmovmskpd	%ymm13,%r12d
	vpcmpgtq	.Lmask52x4(%rip),%ymm8,%ymm13
	vmovmskpd	%ymm13,%r11d
	shlb	$4,%r11b
	orb	%r11b,%r12b

	vpcmpgtq	.Lmask52x4(%rip),%ymm9,%ymm13
	vmovmskpd	%ymm13,%r11d
	vpcmpgtq	.Lmask52x4(%rip),%ymm10,%ymm13
	vmovmskpd	%ymm13,%r10d
	shlb	$4,%r10b
	orb	%r10b,%r11b

	vpcmpgtq	.Lmask52x4(%rip),%ymm11,%ymm13
	vmovmskpd	%ymm13,%r10d
	vpcmpgtq	.Lmask52x4(%rip),%ymm12,%ymm13
	vmovmskpd	%ymm13,%r9d
	shlb	$4,%r9b
	orb	%r9b,%r10b

	addb	%r14b,%r14b
	adcb	%r13b,%r13b
	adcb	%r12b,%r12b
	adcb	%r11b,%r11b
	adcb	%r10b,%r10b


	vpcmpeqq	.Lmask52x4(%rip),%ymm3,%ymm13
	vmovmskpd	%ymm13,%r9d
	vpcmpeqq	.Lmask52x4(%rip),%ymm4,%ymm13
	vmovmskpd	%ymm13,%r8d
	shlb	$4,%r8b
	orb	%r8b,%r9b

	vpcmpeqq	.Lmask52x4(%rip),%ymm5,%ymm13
	vmovmskpd	%ymm13,%r8d
	vpcmpeqq	.Lmask52x4(%rip),%ymm6,%ymm13
	vmovmskpd	%ymm13,%edx
	shlb	$4,%dl
	orb	%dl,%r8b

	vpcmpeqq	.Lmask52x4(%rip),%ymm7,%ymm13
	vmovmskpd	%ymm13,%edx
	vpcmpeqq	.Lmask52x4(%rip),%ymm8,%ymm13
	vmovmskpd	%ymm13,%ecx
	shlb	$4,%cl
	orb	%cl,%dl

	vpcmpeqq	.Lmask52x4(%rip),%ymm9,%ymm13
	vmovmskpd	%ymm13,%ecx
	vpcmpeqq	.Lmask52x4(%rip),%ymm10,%ymm13
	vmovmskpd	%ymm13,%ebx
	shlb	$4,%bl
	orb	%bl,%cl

	vpcmpeqq	.Lmask52x4(%rip),%ymm11,%ymm13
	vmovmskpd	%ymm13,%ebx
	vpcmpeqq	.Lmask52x4(%rip),%ymm12,%ymm13
	vmovmskpd	%ymm13,%eax
	shlb	$4,%al
	orb	%al,%bl

	addb	%r9b,%r14b
	adcb	%r8b,%r13b
	adcb	%dl,%r12b
	adcb	%cl,%r11b
	adcb	%bl,%r10b

	xorb	%r9b,%r14b
	xorb	%r8b,%r13b
	xorb	%dl,%r12b
	xorb	%cl,%r11b
	xorb	%bl,%r10b

	pushq	%r9
	pushq	%r8

	leaq	.Lkmasklut(%rip),%r8

	movb	%r14b,%r9b
	andq	$0xf,%r14
	vpsubq	.Lmask52x4(%rip),%ymm3,%ymm13
	shlq	$5,%r14
	vmovapd	(%r8,%r14), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm3,%ymm3

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm4,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm4,%ymm4

	movb	%r13b,%r9b
	andq	$0xf,%r13
	vpsubq	.Lmask52x4(%rip),%ymm5,%ymm13
	shlq	$5,%r13
	vmovapd	(%r8,%r13), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm5,%ymm5

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm6,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm6,%ymm6

	movb	%r12b,%r9b
	andq	$0xf,%r12
	vpsubq	.Lmask52x4(%rip),%ymm7,%ymm13
	shlq	$5,%r12
	vmovapd	(%r8,%r12), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm7,%ymm7

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm8,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm8,%ymm8

	movb	%r11b,%r9b
	andq	$0xf,%r11
	vpsubq	.Lmask52x4(%rip),%ymm9,%ymm13
	shlq	$5,%r11
	vmovapd	(%r8,%r11), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm9,%ymm9

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm10,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm10,%ymm10

	movb	%r10b,%r9b
	andq	$0xf,%r10
	vpsubq	.Lmask52x4(%rip),%ymm11,%ymm13
	shlq	$5,%r10
	vmovapd	(%r8,%r10), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm11,%ymm11

	shrb	$4,%r9b
	andq	$0xf,%r9
	vpsubq	.Lmask52x4(%rip),%ymm12,%ymm13
	shlq	$5,%r9
	vmovapd	(%r8,%r9), %ymm14
	vblendvpd	%ymm14,%ymm13,%ymm12,%ymm12

	popq	%r8
	popq	%r9

	vpand	.Lmask52x4(%rip),%ymm3,%ymm3
	vpand	.Lmask52x4(%rip),%ymm4,%ymm4
	vpand	.Lmask52x4(%rip),%ymm5,%ymm5
	vpand	.Lmask52x4(%rip),%ymm6,%ymm6
	vpand	.Lmask52x4(%rip),%ymm7,%ymm7
	vpand	.Lmask52x4(%rip),%ymm8,%ymm8
	vpand	.Lmask52x4(%rip),%ymm9,%ymm9

	vpand	.Lmask52x4(%rip),%ymm10,%ymm10
	vpand	.Lmask52x4(%rip),%ymm11,%ymm11
	vpand	.Lmask52x4(%rip),%ymm12,%ymm12

	vmovdqu	%ymm3,320(%rdi)
	vmovdqu	%ymm4,352(%rdi)
	vmovdqu	%ymm5,384(%rdi)
	vmovdqu	%ymm6,416(%rdi)
	vmovdqu	%ymm7,448(%rdi)
	vmovdqu	%ymm8,480(%rdi)
	vmovdqu	%ymm9,512(%rdi)
	vmovdqu	%ymm10,544(%rdi)
	vmovdqu	%ymm11,576(%rdi)
	vmovdqu	%ymm12,608(%rdi)

	vzeroupper
	leaq	(%rsp),%rax

	vmovapd	0(%rax),%xmm6
	vmovapd	16(%rax),%xmm7
	vmovapd	32(%rax),%xmm8
	vmovapd	48(%rax),%xmm9
	vmovapd	64(%rax),%xmm10
	vmovapd	80(%rax),%xmm11
	vmovapd	96(%rax),%xmm12
	vmovapd	112(%rax),%xmm13
	vmovapd	128(%rax),%xmm14
	vmovapd	144(%rax),%xmm15
	leaq	168(%rsp),%rax
	movq	0(%rax),%r15

	movq	8(%rax),%r14

	movq	16(%rax),%r13

	movq	24(%rax),%r12

	movq	32(%rax),%rbp

	movq	40(%rax),%rbx

	leaq	48(%rax),%rsp

.Lossl_rsaz_amm52x40_x2_avxifma256_epilogue:
	movq	8(%rsp),%rdi
	movq	16(%rsp),%rsi
	.byte	0xf3,0xc3

.LSEH_end_ossl_rsaz_amm52x40_x2_avxifma256:
.text	

.p2align	5
.globl	ossl_extract_multiplier_2x40_win5_avx
.def	ossl_extract_multiplier_2x40_win5_avx;	.scl 2;	.type 32;	.endef
ossl_extract_multiplier_2x40_win5_avx:

.byte	243,15,30,250
	vmovapd	.Lones(%rip),%ymm14
	vmovq	%r8,%xmm10
	vpbroadcastq	%xmm10,%ymm12
	vmovq	%r9,%xmm10
	vpbroadcastq	%xmm10,%ymm13
	leaq	20480(%rdx),%rax


	movq	%rdx,%r10


	vpxor	%xmm0,%xmm0,%xmm0
	vmovapd	%ymm0,%ymm1
	vmovapd	%ymm0,%ymm2
	vmovapd	%ymm0,%ymm3
	vmovapd	%ymm0,%ymm4
	vmovapd	%ymm0,%ymm5
	vmovapd	%ymm0,%ymm6
	vmovapd	%ymm0,%ymm7
	vmovapd	%ymm0,%ymm8
	vmovapd	%ymm0,%ymm9
	vpxor	%ymm11,%ymm11,%ymm11
.p2align	5
.Lloop_0:
	vpcmpeqq	%ymm11,%ymm12,%ymm15
	vmovdqu	0(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm0,%ymm0
	vmovdqu	32(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm1,%ymm1
	vmovdqu	64(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm2,%ymm2
	vmovdqu	96(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm3,%ymm3
	vmovdqu	128(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm4,%ymm4
	vmovdqu	160(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm5,%ymm5
	vmovdqu	192(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm6,%ymm6
	vmovdqu	224(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm7,%ymm7
	vmovdqu	256(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm8,%ymm8
	vmovdqu	288(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm9,%ymm9
	vpaddq	%ymm14,%ymm11,%ymm11
	addq	$640,%rdx
	cmpq	%rdx,%rax
	jne	.Lloop_0
	vmovdqu	%ymm0,0(%rcx)
	vmovdqu	%ymm1,32(%rcx)
	vmovdqu	%ymm2,64(%rcx)
	vmovdqu	%ymm3,96(%rcx)
	vmovdqu	%ymm4,128(%rcx)
	vmovdqu	%ymm5,160(%rcx)
	vmovdqu	%ymm6,192(%rcx)
	vmovdqu	%ymm7,224(%rcx)
	vmovdqu	%ymm8,256(%rcx)
	vmovdqu	%ymm9,288(%rcx)
	movq	%r10,%rdx
	vpxor	%ymm11,%ymm11,%ymm11
.p2align	5
.Lloop_320:
	vpcmpeqq	%ymm11,%ymm13,%ymm15
	vmovdqu	320(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm0,%ymm0
	vmovdqu	352(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm1,%ymm1
	vmovdqu	384(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm2,%ymm2
	vmovdqu	416(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm3,%ymm3
	vmovdqu	448(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm4,%ymm4
	vmovdqu	480(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm5,%ymm5
	vmovdqu	512(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm6,%ymm6
	vmovdqu	544(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm7,%ymm7
	vmovdqu	576(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm8,%ymm8
	vmovdqu	608(%rdx),%ymm10

	vblendvpd	%ymm15,%ymm10,%ymm9,%ymm9
	vpaddq	%ymm14,%ymm11,%ymm11
	addq	$640,%rdx
	cmpq	%rdx,%rax
	jne	.Lloop_320
	vmovdqu	%ymm0,320(%rcx)
	vmovdqu	%ymm1,352(%rcx)
	vmovdqu	%ymm2,384(%rcx)
	vmovdqu	%ymm3,416(%rcx)
	vmovdqu	%ymm4,448(%rcx)
	vmovdqu	%ymm5,480(%rcx)
	vmovdqu	%ymm6,512(%rcx)
	vmovdqu	%ymm7,544(%rcx)
	vmovdqu	%ymm8,576(%rcx)
	vmovdqu	%ymm9,608(%rcx)

	.byte	0xf3,0xc3


.section	.rodata
.p2align	5
.Lones:
.quad	1,1,1,1
.Lzeros:
.quad	0,0,0,0

.def	rsaz_avx_handler;	.scl 3;	.type 32;	.endef
.p2align	4
rsaz_avx_handler:
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
	jb	.Lcommon_seh_tail

	movl	4(%r11),%r10d
	leaq	(%rsi,%r10,1),%r10
	cmpq	%r10,%rbx
	jae	.Lcommon_seh_tail

	movq	152(%r8),%rax

	leaq	(%rax),%rsi
	leaq	512(%r8),%rdi
	movl	$20,%ecx
.long	0xa548f3fc

	leaq	216(%rax),%rax

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

.Lcommon_seh_tail:
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


.section	.pdata
.p2align	2
.rva	.LSEH_begin_ossl_rsaz_amm52x40_x1_avxifma256
.rva	.LSEH_end_ossl_rsaz_amm52x40_x1_avxifma256
.rva	.LSEH_info_ossl_rsaz_amm52x40_x1_avxifma256

.rva	.LSEH_begin_ossl_rsaz_amm52x40_x2_avxifma256
.rva	.LSEH_end_ossl_rsaz_amm52x40_x2_avxifma256
.rva	.LSEH_info_ossl_rsaz_amm52x40_x2_avxifma256

.section	.xdata
.p2align	3
.LSEH_info_ossl_rsaz_amm52x40_x1_avxifma256:
.byte	9,0,0,0
.rva	rsaz_avx_handler
.rva	.Lossl_rsaz_amm52x40_x1_avxifma256_body,.Lossl_rsaz_amm52x40_x1_avxifma256_epilogue
.LSEH_info_ossl_rsaz_amm52x40_x2_avxifma256:
.byte	9,0,0,0
.rva	rsaz_avx_handler
.rva	.Lossl_rsaz_amm52x40_x2_avxifma256_body,.Lossl_rsaz_amm52x40_x2_avxifma256_epilogue
