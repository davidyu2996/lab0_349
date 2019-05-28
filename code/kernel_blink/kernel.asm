
kernel_lab0_blink/kernel.elf:     file format elf32-littlearm


Disassembly of section .text:

00008000 <__start>:
    8000:	e10f0000 	mrs	r0, CPSR
    8004:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
    8008:	e59fd034 	ldr	sp, [pc, #52]	; 8044 <hang+0x8>
    800c:	e121f000 	msr	CPSR_c, r0
    8010:	e59fd030 	ldr	sp, [pc, #48]	; 8048 <hang+0xc>
    8014:	e59f0030 	ldr	r0, [pc, #48]	; 804c <hang+0x10>
    8018:	e59f1030 	ldr	r1, [pc, #48]	; 8050 <hang+0x14>
    801c:	e3a02000 	mov	r2, #0
    8020:	e3a03000 	mov	r3, #0
    8024:	e3a04000 	mov	r4, #0
    8028:	e3a05000 	mov	r5, #0

0000802c <bss_loop>:
    802c:	e8a0003c 	stmia	r0!, {r2, r3, r4, r5}
    8030:	e1500001 	cmp	r0, r1
    8034:	3afffffc 	bcc	802c <bss_loop>
    8038:	eb000075 	bl	8214 <kernel_main>

0000803c <hang>:
    803c:	e320f003 	wfi
    8040:	eafffffd 	b	803c <hang>
    8044:	0012a000 	andseq	sl, r2, r0
    8048:	00119000 	andseq	r9, r1, r0
    804c:	00009000 	andeq	r9, r0, r0
    8050:	00009000 	andeq	r9, r0, r0

00008054 <gpio_config>:
    8054:	e3510007 	cmp	r1, #7
    8058:	93500035 	cmpls	r0, #53	; 0x35
    805c:	812fff1e 	bxhi	lr
    8060:	e30c2ccd 	movw	r2, #52429	; 0xcccd
    8064:	e34c2ccc 	movt	r2, #52428	; 0xcccc
    8068:	e0832290 	umull	r2, r3, r0, r2
    806c:	e1a0c1a3 	lsr	ip, r3, #3
    8070:	e6ef307c 	uxtb	r3, ip
    8074:	e1a03103 	lsl	r3, r3, #2
    8078:	e283343f 	add	r3, r3, #1056964608	; 0x3f000000
    807c:	e2833602 	add	r3, r3, #2097152	; 0x200000
    8080:	e5932000 	ldr	r2, [r3]
    8084:	e08cc10c 	add	ip, ip, ip, lsl #2
    8088:	e040008c 	sub	r0, r0, ip, lsl #1
    808c:	e6ef0070 	uxtb	r0, r0
    8090:	e0800080 	add	r0, r0, r0, lsl #1
    8094:	e3a0c007 	mov	ip, #7
    8098:	e1c2201c 	bic	r2, r2, ip, lsl r0
    809c:	e1820011 	orr	r0, r2, r1, lsl r0
    80a0:	e5830000 	str	r0, [r3]
    80a4:	e12fff1e 	bx	lr

000080a8 <gpio_set>:
    80a8:	e3500035 	cmp	r0, #53	; 0x35
    80ac:	812fff1e 	bxhi	lr
    80b0:	e350001f 	cmp	r0, #31
    80b4:	9a000006 	bls	80d4 <gpio_set+0x2c>
    80b8:	e2400020 	sub	r0, r0, #32
    80bc:	e3a03001 	mov	r3, #1
    80c0:	e1a00013 	lsl	r0, r3, r0
    80c4:	e3a03000 	mov	r3, #0
    80c8:	e3433f20 	movt	r3, #16160	; 0x3f20
    80cc:	e5830020 	str	r0, [r3, #32]
    80d0:	e12fff1e 	bx	lr
    80d4:	e3a03001 	mov	r3, #1
    80d8:	e1a00013 	lsl	r0, r3, r0
    80dc:	e3a03000 	mov	r3, #0
    80e0:	e3433f20 	movt	r3, #16160	; 0x3f20
    80e4:	e583001c 	str	r0, [r3, #28]
    80e8:	e12fff1e 	bx	lr

000080ec <gpio_clr>:
    80ec:	e3500035 	cmp	r0, #53	; 0x35
    80f0:	812fff1e 	bxhi	lr
    80f4:	e350001f 	cmp	r0, #31
    80f8:	9a000006 	bls	8118 <gpio_clr+0x2c>
    80fc:	e2400020 	sub	r0, r0, #32
    8100:	e3a03001 	mov	r3, #1
    8104:	e1a00013 	lsl	r0, r3, r0
    8108:	e3a03000 	mov	r3, #0
    810c:	e3433f20 	movt	r3, #16160	; 0x3f20
    8110:	e583002c 	str	r0, [r3, #44]	; 0x2c
    8114:	e12fff1e 	bx	lr
    8118:	e3a03001 	mov	r3, #1
    811c:	e1a00013 	lsl	r0, r3, r0
    8120:	e3a03000 	mov	r3, #0
    8124:	e3433f20 	movt	r3, #16160	; 0x3f20
    8128:	e5830028 	str	r0, [r3, #40]	; 0x28
    812c:	e12fff1e 	bx	lr

00008130 <gpio_set_pull>:
    8130:	e3510002 	cmp	r1, #2
    8134:	93500035 	cmpls	r0, #53	; 0x35
    8138:	812fff1e 	bxhi	lr
    813c:	e92d4038 	push	{r3, r4, r5, lr}
    8140:	e1a04000 	mov	r4, r0
    8144:	e3a03000 	mov	r3, #0
    8148:	e3433f20 	movt	r3, #16160	; 0x3f20
    814c:	e5831094 	str	r1, [r3, #148]	; 0x94
    8150:	e3a00096 	mov	r0, #150	; 0x96
    8154:	eb000043 	bl	8268 <delay_cycles>
    8158:	e354001f 	cmp	r4, #31
    815c:	9a00000a 	bls	818c <gpio_set_pull+0x5c>
    8160:	e2440020 	sub	r0, r4, #32
    8164:	e3a04001 	mov	r4, #1
    8168:	e1a00014 	lsl	r0, r4, r0
    816c:	e3a05000 	mov	r5, #0
    8170:	e3435f20 	movt	r5, #16160	; 0x3f20
    8174:	e585009c 	str	r0, [r5, #156]	; 0x9c
    8178:	e3a00096 	mov	r0, #150	; 0x96
    817c:	eb000039 	bl	8268 <delay_cycles>
    8180:	e3a03000 	mov	r3, #0
    8184:	e585309c 	str	r3, [r5, #156]	; 0x9c
    8188:	e8bd8038 	pop	{r3, r4, r5, pc}
    818c:	e3a00001 	mov	r0, #1
    8190:	e1a00410 	lsl	r0, r0, r4
    8194:	e3a05000 	mov	r5, #0
    8198:	e3435f20 	movt	r5, #16160	; 0x3f20
    819c:	e5850098 	str	r0, [r5, #152]	; 0x98
    81a0:	e3a00096 	mov	r0, #150	; 0x96
    81a4:	eb00002f 	bl	8268 <delay_cycles>
    81a8:	e3a03000 	mov	r3, #0
    81ac:	e5853098 	str	r3, [r5, #152]	; 0x98
    81b0:	e8bd8038 	pop	{r3, r4, r5, pc}

000081b4 <led_init>:
    81b4:	e92d4008 	push	{r3, lr}
    81b8:	e3a0002f 	mov	r0, #47	; 0x2f
    81bc:	e3a01001 	mov	r1, #1
    81c0:	ebffffa3 	bl	8054 <gpio_config>
    81c4:	e3a00023 	mov	r0, #35	; 0x23
    81c8:	e3a01001 	mov	r1, #1
    81cc:	ebffffa0 	bl	8054 <gpio_config>
    81d0:	e8bd8008 	pop	{r3, pc}

000081d4 <led_set_green>:
    81d4:	e92d4008 	push	{r3, lr}
    81d8:	e3a0002f 	mov	r0, #47	; 0x2f
    81dc:	ebffffb1 	bl	80a8 <gpio_set>
    81e0:	e8bd8008 	pop	{r3, pc}

000081e4 <led_clr_green>:
    81e4:	e92d4008 	push	{r3, lr}
    81e8:	e3a0002f 	mov	r0, #47	; 0x2f
    81ec:	ebffffbe 	bl	80ec <gpio_clr>
    81f0:	e8bd8008 	pop	{r3, pc}

000081f4 <led_set_red>:
    81f4:	e92d4008 	push	{r3, lr}
    81f8:	e3a00023 	mov	r0, #35	; 0x23
    81fc:	ebffffa9 	bl	80a8 <gpio_set>
    8200:	e8bd8008 	pop	{r3, pc}

00008204 <led_clr_red>:
    8204:	e92d4008 	push	{r3, lr}
    8208:	e3a00023 	mov	r0, #35	; 0x23
    820c:	ebffffb6 	bl	80ec <gpio_clr>
    8210:	e8bd8008 	pop	{r3, pc}

00008214 <kernel_main>:
    8214:	e92d4010 	push	{r4, lr}
    8218:	e24dd008 	sub	sp, sp, #8
    821c:	ebffffe4 	bl	81b4 <led_init>
    8220:	ebfffff7 	bl	8204 <led_clr_red>
    8224:	ebffffee 	bl	81e4 <led_clr_green>
    8228:	e3a03000 	mov	r3, #0
    822c:	e58d3004 	str	r3, [sp, #4]
    8230:	e30846a0 	movw	r4, #34464	; 0x86a0
    8234:	e3404001 	movt	r4, #1
    8238:	e1a00004 	mov	r0, r4
    823c:	eb000009 	bl	8268 <delay_cycles>
    8240:	ebffffeb 	bl	81f4 <led_set_red>
    8244:	ebffffe6 	bl	81e4 <led_clr_green>
    8248:	e1a00004 	mov	r0, r4
    824c:	eb000005 	bl	8268 <delay_cycles>
    8250:	ebffffdf 	bl	81d4 <led_set_green>
    8254:	ebffffea 	bl	8204 <led_clr_red>
    8258:	e59d3004 	ldr	r3, [sp, #4]
    825c:	e2833001 	add	r3, r3, #1
    8260:	e58d3004 	str	r3, [sp, #4]
    8264:	eafffff3 	b	8238 <kernel_main+0x24>

00008268 <delay_cycles>:
    8268:	e2500001 	subs	r0, r0, #1
    826c:	1afffffd 	bne	8268 <delay_cycles>
    8270:	e1a0f00e 	mov	pc, lr

00008274 <read_cpsr>:
    8274:	e10f0000 	mrs	r0, CPSR
    8278:	e1a0f00e 	mov	pc, lr

0000827c <write_cpsr>:
    827c:	e129f000 	msr	CPSR_fc, r0
    8280:	e1a0f00e 	mov	pc, lr

00008284 <disable_interrupts>:
    8284:	e10f0000 	mrs	r0, CPSR
    8288:	e3a01d07 	mov	r1, #448	; 0x1c0
    828c:	e1800001 	orr	r0, r0, r1
    8290:	e129f000 	msr	CPSR_fc, r0
    8294:	e1a0f00e 	mov	pc, lr

00008298 <enable_interrupts>:
    8298:	e10f0000 	mrs	r0, CPSR
    829c:	e3a01d07 	mov	r1, #448	; 0x1c0
    82a0:	e1c00001 	bic	r0, r0, r1
    82a4:	e129f000 	msr	CPSR_fc, r0
    82a8:	e1a0f00e 	mov	pc, lr

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	000001b1 			; <UNDEFINED> instruction: 0x000001b1
   4:	00000004 	andeq	r0, r0, r4
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	0000004a 	andeq	r0, r0, sl, asr #32
  10:	00014c01 	andeq	r4, r1, r1, lsl #24
  14:	00012400 	andeq	r2, r1, r0, lsl #8
  18:	00805400 	addeq	r5, r0, r0, lsl #8
  1c:	00016000 	andeq	r6, r1, r0
  20:	00000000 	andeq	r0, r0, r0
  24:	08010200 	stmdaeq	r1, {r9}
  28:	000000d1 	ldrdeq	r0, [r0], -r1
  2c:	da080102 	ble	20043c <__end+0xd643c>
  30:	02000000 	andeq	r0, r0, #0
  34:	011a0502 	tsteq	sl, r2, lsl #10
  38:	04030000 	streq	r0, [r3], #-0
  3c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
  40:	05080200 	streq	r0, [r8, #-512]	; 0x200
  44:	00000000 	andeq	r0, r0, r0
  48:	0000c904 	andeq	ip, r0, r4, lsl #18
  4c:	25160200 	ldrcs	r0, [r6, #-512]	; 0x200
  50:	02000000 	andeq	r0, r0, #0
  54:	00f50702 	rscseq	r0, r5, r2, lsl #14
  58:	df040000 	svcle	0x00040000
  5c:	02000000 	andeq	r0, r0, #0
  60:	0000651a 	andeq	r6, r0, sl, lsl r5
  64:	07040200 	streq	r0, [r4, -r0, lsl #4]
  68:	00000034 	andeq	r0, r0, r4, lsr r0
  6c:	2a070802 	bcs	1c207c <__end+0x9807c>
  70:	05000000 	streq	r0, [r0, #-0]
  74:	0000010e 	andeq	r0, r0, lr, lsl #2
  78:	80545401 	subshi	r5, r4, r1, lsl #8
  7c:	00540000 	subseq	r0, r4, r0
  80:	9c010000 	stcls	0, cr0, [r1], {-0}
  84:	000000d2 	ldrdeq	r0, [r0], -r2
  88:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
  8c:	48540100 	ldmdami	r4, {r8}^
  90:	00000000 	andeq	r0, r0, r0
  94:	07000000 	streq	r0, [r0, -r0]
  98:	006e7566 	rsbeq	r7, lr, r6, ror #10
  9c:	00485401 	subeq	r5, r8, r1, lsl #8
  a0:	51010000 	mrspl	r0, (UNDEF: 1)
  a4:	67657208 	strbvs	r7, [r5, -r8, lsl #4]!
  a8:	5a590100 	bpl	16404b0 <__user_program+0x13404b0>
  ac:	21000000 	mrscs	r0, (UNDEF: 0)
  b0:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
  b4:	00000113 	andeq	r0, r0, r3, lsl r1
  b8:	005a5b01 	subseq	r5, sl, r1, lsl #22
  bc:	005a0000 	subseq	r0, sl, r0
  c0:	45090000 	strmi	r0, [r9, #-0]
  c4:	01000001 	tsteq	r0, r1
  c8:	00005a5d 	andeq	r5, r0, sp, asr sl
  cc:	00007800 	andeq	r7, r0, r0, lsl #16
  d0:	21050000 	mrscs	r0, (UNDEF: 5)
  d4:	01000000 	mrseq	r0, (UNDEF: 0)
  d8:	0080a864 	addeq	sl, r0, r4, ror #16
  dc:	00004400 	andeq	r4, r0, r0, lsl #8
  e0:	f79c0100 			; <UNDEFINED> instruction: 0xf79c0100
  e4:	06000000 	streq	r0, [r0], -r0
  e8:	006e6970 	rsbeq	r6, lr, r0, ror r9
  ec:	00486401 	subeq	r6, r8, r1, lsl #8
  f0:	008b0000 	addeq	r0, fp, r0
  f4:	05000000 	streq	r0, [r0, #-0]
  f8:	00000041 	andeq	r0, r0, r1, asr #32
  fc:	80ec7001 	rschi	r7, ip, r1
 100:	00440000 	subeq	r0, r4, r0
 104:	9c010000 	stcls	0, cr0, [r1], {-0}
 108:	0000011c 	andeq	r0, r0, ip, lsl r1
 10c:	6e697006 	cdpvs	0, 6, cr7, cr9, cr6, {0}
 110:	48700100 	ldmdami	r0!, {r8}^
 114:	c5000000 	strgt	r0, [r0, #-0]
 118:	00000000 	andeq	r0, r0, r0
 11c:	00000e05 	andeq	r0, r0, r5, lsl #28
 120:	307c0100 	rsbscc	r0, ip, r0, lsl #2
 124:	84000081 	strhi	r0, [r0], #-129	; 0x81
 128:	01000000 	mrseq	r0, (UNDEF: 0)
 12c:	0001889c 	muleq	r1, ip, r8
 130:	69700600 	ldmdbvs	r0!, {r9, sl}^
 134:	7c01006e 	stcvc	0, cr0, [r1], {110}	; 0x6e
 138:	00000048 	andeq	r0, r0, r8, asr #32
 13c:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 140:	0001080a 	andeq	r0, r1, sl, lsl #16
 144:	487c0100 	ldmdami	ip!, {r8}^
 148:	20000000 	andcs	r0, r0, r0
 14c:	0b000001 	bleq	158 <__start-0x7ea8>
 150:	00008158 	andeq	r8, r0, r8, asr r1
 154:	000001a7 	andeq	r0, r0, r7, lsr #3
 158:	00000163 	andeq	r0, r0, r3, ror #2
 15c:	0250010c 	subseq	r0, r0, #12, 2
 160:	0b009608 	bleq	25988 <__bss_end+0x1c988>
 164:	00008180 	andeq	r8, r0, r0, lsl #3
 168:	000001a7 	andeq	r0, r0, r7, lsr #3
 16c:	00000177 	andeq	r0, r0, r7, ror r1
 170:	0250010c 	subseq	r0, r0, #12, 2
 174:	0d009608 	stceq	6, cr9, [r0, #-32]	; 0xffffffe0
 178:	000081a8 	andeq	r8, r0, r8, lsr #3
 17c:	000001a7 	andeq	r0, r0, r7, lsr #3
 180:	0250010c 	subseq	r0, r0, #12, 2
 184:	00009608 	andeq	r9, r0, r8, lsl #12
 188:	00001c0e 	andeq	r1, r0, lr, lsl #24
 18c:	97510100 	ldrbls	r0, [r1, -r0, lsl #2]
 190:	00000001 	andeq	r0, r0, r1
 194:	0f3f2000 	svceq	0x003f2000
 198:	0000019c 	muleq	r0, ip, r1
 19c:	01a20410 			; <UNDEFINED> instruction: 0x01a20410
 1a0:	5a110000 	bpl	4401a8 <__user_program+0x1401a8>
 1a4:	12000000 	andne	r0, r0, #0
 1a8:	000000e8 	andeq	r0, r0, r8, ror #1
 1ac:	5a131903 	bpl	4c65c0 <__user_program+0x1c65c0>
 1b0:	00000000 	andeq	r0, r0, r0
 1b4:	00017500 	andeq	r7, r1, r0, lsl #10
 1b8:	fe000400 	cdp2	4, 0, cr0, cr0, cr0, {0}
 1bc:	04000000 	streq	r0, [r0], #-0
 1c0:	00004a01 	andeq	r4, r0, r1, lsl #20
 1c4:	01820100 	orreq	r0, r2, r0, lsl #2
 1c8:	01240000 	teqeq	r4, r0
 1cc:	81b40000 			; <UNDEFINED> instruction: 0x81b40000
 1d0:	00600000 	rsbeq	r0, r0, r0
 1d4:	00860000 	addeq	r0, r6, r0
 1d8:	01020000 	mrseq	r0, (UNDEF: 2)
 1dc:	0000da08 	andeq	sp, r0, r8, lsl #20
 1e0:	05020200 	streq	r0, [r2, #-512]	; 0x200
 1e4:	0000011a 	andeq	r0, r0, sl, lsl r1
 1e8:	69050403 	stmdbvs	r5, {r0, r1, sl}
 1ec:	0200746e 	andeq	r7, r0, #1845493760	; 0x6e000000
 1f0:	00000508 	andeq	r0, r0, r8, lsl #10
 1f4:	c9040000 	stmdbgt	r4, {}	; <UNPREDICTABLE>
 1f8:	03000000 	movweq	r0, #0
 1fc:	00004c16 	andeq	r4, r0, r6, lsl ip
 200:	08010200 	stmdaeq	r1, {r9}
 204:	000000d1 	ldrdeq	r0, [r0], -r1
 208:	f5070202 			; <UNDEFINED> instruction: 0xf5070202
 20c:	02000000 	andeq	r0, r0, #0
 210:	00340704 	eorseq	r0, r4, r4, lsl #14
 214:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
 218:	00002a07 	andeq	r2, r0, r7, lsl #20
 21c:	01790500 	cmneq	r9, r0, lsl #10
 220:	17010000 	strne	r0, [r1, -r0]
 224:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
 228:	00000020 	andeq	r0, r0, r0, lsr #32
 22c:	00ac9c01 	adceq	r9, ip, r1, lsl #24
 230:	c4060000 	strgt	r0, [r6], #-0
 234:	44000081 	strmi	r0, [r0], #-129	; 0x81
 238:	96000001 	strls	r0, [r0], -r1
 23c:	07000000 	streq	r0, [r0, -r0]
 240:	31015101 	tstcc	r1, r1, lsl #2
 244:	02500107 	subseq	r0, r0, #-1073741823	; 0xc0000001
 248:	08002f08 	stmdaeq	r0, {r3, r8, r9, sl, fp, sp}
 24c:	000081d0 	ldrdeq	r8, [r0], -r0
 250:	00000144 	andeq	r0, r0, r4, asr #2
 254:	01510107 	cmpeq	r1, r7, lsl #2
 258:	50010731 	andpl	r0, r1, r1, lsr r7
 25c:	00230802 	eoreq	r0, r3, r2, lsl #16
 260:	01a10500 			; <UNDEFINED> instruction: 0x01a10500
 264:	1d010000 	stcne	0, cr0, [r1, #-0]
 268:	000081d4 	ldrdeq	r8, [r0], -r4
 26c:	00000010 	andeq	r0, r0, r0, lsl r0
 270:	00d29c01 	sbcseq	r9, r2, r1, lsl #24
 274:	e0080000 	and	r0, r8, r0
 278:	5a000081 	bpl	484 <__start-0x7b7c>
 27c:	07000001 	streq	r0, [r0, -r1]
 280:	08025001 	stmdaeq	r2, {r0, ip, lr}
 284:	0500002f 	streq	r0, [r0, #-47]	; 0x2f
 288:	0000015f 	andeq	r0, r0, pc, asr r1
 28c:	81e42201 	mvnhi	r2, r1, lsl #4
 290:	00100000 	andseq	r0, r0, r0
 294:	9c010000 	stcls	0, cr0, [r1], {-0}
 298:	000000f8 	strdeq	r0, [r0], -r8
 29c:	0081f008 	addeq	pc, r1, r8
 2a0:	00016b00 	andeq	r6, r1, r0, lsl #22
 2a4:	50010700 	andpl	r0, r1, r0, lsl #14
 2a8:	002f0802 	eoreq	r0, pc, r2, lsl #16
 2ac:	016d0500 	cmneq	sp, r0, lsl #10
 2b0:	27010000 	strcs	r0, [r1, -r0]
 2b4:	000081f4 	strdeq	r8, [r0], -r4
 2b8:	00000010 	andeq	r0, r0, r0, lsl r0
 2bc:	011e9c01 	tsteq	lr, r1, lsl #24
 2c0:	00080000 	andeq	r0, r8, r0
 2c4:	5a000082 	bpl	4d4 <__start-0x7b2c>
 2c8:	07000001 	streq	r0, [r0, -r1]
 2cc:	08025001 	stmdaeq	r2, {r0, ip, lr}
 2d0:	05000023 	streq	r0, [r0, #-35]	; 0x23
 2d4:	00000195 	muleq	r0, r5, r1
 2d8:	82042c01 	andhi	r2, r4, #256	; 0x100
 2dc:	00100000 	andseq	r0, r0, r0
 2e0:	9c010000 	stcls	0, cr0, [r1], {-0}
 2e4:	00000144 	andeq	r0, r0, r4, asr #2
 2e8:	00821008 	addeq	r1, r2, r8
 2ec:	00016b00 	andeq	r6, r1, r0, lsl #22
 2f0:	50010700 	andpl	r0, r1, r0, lsl #14
 2f4:	00230802 	eoreq	r0, r3, r2, lsl #16
 2f8:	010e0900 	tsteq	lr, r0, lsl #18
 2fc:	37020000 	strcc	r0, [r2, -r0]
 300:	0000015a 	andeq	r0, r0, sl, asr r1
 304:	0000410a 	andeq	r4, r0, sl, lsl #2
 308:	00410a00 	subeq	r0, r1, r0, lsl #20
 30c:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
 310:	00000021 	andeq	r0, r0, r1, lsr #32
 314:	016b3d02 	cmneq	fp, r2, lsl #26
 318:	410a0000 	mrsmi	r0, (UNDEF: 10)
 31c:	00000000 	andeq	r0, r0, r0
 320:	0000410b 	andeq	r4, r0, fp, lsl #2
 324:	0a430200 	beq	10c0b2c <__user_program+0xdc0b2c>
 328:	00000041 	andeq	r0, r0, r1, asr #32
 32c:	01290000 	teqeq	r9, r0
 330:	00040000 	andeq	r0, r4, r0
 334:	0000019e 	muleq	r0, lr, r1
 338:	004a0104 	subeq	r0, sl, r4, lsl #2
 33c:	af010000 	svcge	0x00010000
 340:	24000001 	strcs	r0, [r0], #-1
 344:	14000001 	strne	r0, [r0], #-1
 348:	54000082 	strpl	r0, [r0], #-130	; 0x82
 34c:	f9000000 			; <UNDEFINED> instruction: 0xf9000000
 350:	02000000 	andeq	r0, r0, #0
 354:	00da0801 	sbcseq	r0, sl, r1, lsl #16
 358:	02020000 	andeq	r0, r2, #0
 35c:	00011a05 	andeq	r1, r1, r5, lsl #20
 360:	05040300 	streq	r0, [r4, #-768]	; 0x300
 364:	00746e69 	rsbseq	r6, r4, r9, ror #28
 368:	00050802 	andeq	r0, r5, r2, lsl #16
 36c:	02000000 	andeq	r0, r0, #0
 370:	00d10801 	sbcseq	r0, r1, r1, lsl #16
 374:	02020000 	andeq	r0, r2, #0
 378:	0000f507 	andeq	pc, r0, r7, lsl #10
 37c:	00df0400 	sbcseq	r0, pc, r0, lsl #8
 380:	1a030000 	bne	c0388 <__bss_end+0xb7388>
 384:	0000005a 	andeq	r0, r0, sl, asr r0
 388:	34070402 	strcc	r0, [r7], #-1026	; 0x402
 38c:	02000000 	andeq	r0, r0, #0
 390:	002a0708 	eoreq	r0, sl, r8, lsl #14
 394:	ca050000 	bgt	14039c <__end+0x1639c>
 398:	01000001 	tsteq	r0, r1
 39c:	0082140e 	addeq	r1, r2, lr, lsl #8
 3a0:	00005400 	andeq	r5, r0, r0, lsl #8
 3a4:	f39c0100 	vaddw.u16	q0, q6, d0
 3a8:	06000000 	streq	r0, [r0], -r0
 3ac:	00746e63 	rsbseq	r6, r4, r3, ror #28
 3b0:	00f30f01 	rscseq	r0, r3, r1, lsl #30
 3b4:	91020000 	mrsls	r0, (UNDEF: 2)
 3b8:	82200774 	eorhi	r0, r0, #116, 14	; 0x1d00000
 3bc:	00f80000 	rscseq	r0, r8, r0
 3c0:	24070000 	strcs	r0, [r7], #-0
 3c4:	ff000082 			; <UNDEFINED> instruction: 0xff000082
 3c8:	07000000 	streq	r0, [r0, -r0]
 3cc:	00008228 	andeq	r8, r0, r8, lsr #4
 3d0:	00000106 	andeq	r0, r0, r6, lsl #2
 3d4:	00824008 	addeq	r4, r2, r8
 3d8:	00010d00 	andeq	r0, r1, r0, lsl #26
 3dc:	0000ba00 	andeq	fp, r0, r0, lsl #20
 3e0:	50010900 	andpl	r0, r1, r0, lsl #18
 3e4:	00007402 	andeq	r7, r0, r2, lsl #8
 3e8:	00824407 	addeq	r4, r2, r7, lsl #8
 3ec:	00011e00 	andeq	r1, r1, r0, lsl #28
 3f0:	82480700 	subhi	r0, r8, #0, 14
 3f4:	01060000 	mrseq	r0, (UNDEF: 6)
 3f8:	50080000 	andpl	r0, r8, r0
 3fc:	0d000082 	stceq	0, cr0, [r0, #-520]	; 0xfffffdf8
 400:	e0000001 	and	r0, r0, r1
 404:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
 408:	74025001 	strvc	r5, [r2], #-1
 40c:	54070000 	strpl	r0, [r7], #-0
 410:	25000082 	strcs	r0, [r0, #-130]	; 0x82
 414:	07000001 	streq	r0, [r0, -r1]
 418:	00008258 	andeq	r8, r0, r8, asr r2
 41c:	000000ff 	strdeq	r0, [r0], -pc	; <UNPREDICTABLE>
 420:	004f0a00 	subeq	r0, pc, r0, lsl #20
 424:	790b0000 	stmdbvc	fp, {}	; <UNPREDICTABLE>
 428:	02000001 	andeq	r0, r0, #1
 42c:	01950b10 	orrseq	r0, r5, r0, lsl fp
 430:	24020000 	strcs	r0, [r2], #-0
 434:	00015f0b 	andeq	r5, r1, fp, lsl #30
 438:	0c1a0200 	lfmeq	f0, 4, [sl], {-0}
 43c:	000000e8 	andeq	r0, r0, r8, ror #1
 440:	011e1904 	tsteq	lr, r4, lsl #18
 444:	4f0d0000 	svcmi	0x000d0000
 448:	00000000 	andeq	r0, r0, r0
 44c:	00016d0b 	andeq	r6, r1, fp, lsl #26
 450:	0b1f0200 	bleq	7c0c58 <__user_program+0x4c0c58>
 454:	000001a1 	andeq	r0, r0, r1, lsr #3
 458:	58001502 	stmdapl	r0, {r1, r8, sl, ip}
 45c:	02000000 	andeq	r0, r0, #0
 460:	00025400 	andeq	r5, r2, r0, lsl #8
 464:	a2010400 	andge	r0, r1, #0, 8
 468:	00000001 	andeq	r0, r0, r1
 46c:	54000080 	strpl	r0, [r0], #-128	; 0x80
 470:	33000080 	movwcc	r0, #128	; 0x80
 474:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 478:	732f6b62 	teqvc	pc, #100352	; 0x18800
 47c:	622f6372 	eorvs	r6, pc, #-939524095	; 0xc8000001
 480:	2e746f6f 	cdpcs	15, 7, cr6, cr4, cr15, {3}
 484:	682f0053 	stmdavs	pc!, {r0, r1, r4, r6}	; <UNPREDICTABLE>
 488:	2f656d6f 	svccs	0x00656d6f
 48c:	33656365 	cmncc	r5, #-1811939327	; 0x94000001
 490:	442f3934 	strtmi	r3, [pc], #-2356	; 498 <__start-0x7b68>
 494:	746b7365 	strbtvc	r7, [fp], #-869	; 0x365
 498:	462f706f 	strtmi	r7, [pc], -pc, rrx
 49c:	542d3731 	strtpl	r3, [sp], #-1841	; 0x731
 4a0:	6f632f41 	svcvs	0x00632f41
 4a4:	47006564 	strmi	r6, [r0, -r4, ror #10]
 4a8:	4120554e 	teqmi	r0, lr, asr #10
 4ac:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
 4b0:	302e3432 	eorcc	r3, lr, r2, lsr r4
 4b4:	57800100 	strpl	r0, [r0, r0, lsl #2]
 4b8:	02000000 	andeq	r0, r0, #0
 4bc:	00026800 	andeq	r6, r2, r0, lsl #16
 4c0:	fa010400 	blx	414c8 <__bss_end+0x384c8>
 4c4:	68000001 	stmdavs	r0, {r0}
 4c8:	ac000082 	stcge	0, cr0, [r0], {130}	; 0x82
 4cc:	33000082 	movwcc	r0, #130	; 0x82
 4d0:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
 4d4:	732f6b62 	teqvc	pc, #100352	; 0x18800
 4d8:	612f6372 	teqvs	pc, r2, ror r3	; <UNPREDICTABLE>
 4dc:	532e6d72 	teqpl	lr, #7296	; 0x1c80
 4e0:	6f682f00 	svcvs	0x00682f00
 4e4:	652f656d 	strvs	r6, [pc, #-1389]!	; ffffff7f <__user_program+0xffcfff7f>
 4e8:	34336563 	ldrtcc	r6, [r3], #-1379	; 0x563
 4ec:	65442f39 	strbvs	r2, [r4, #-3897]	; 0xf39
 4f0:	6f746b73 	svcvs	0x00746b73
 4f4:	31462f70 	hvccc	25328	; 0x62f0
 4f8:	41542d37 	cmpmi	r4, r7, lsr sp
 4fc:	646f632f 	strbtvs	r6, [pc], #-815	; 504 <__start-0x7afc>
 500:	4e470065 	cdpmi	0, 4, cr0, cr7, cr5, {3}
 504:	53412055 	movtpl	r2, #4181	; 0x1055
 508:	322e3220 	eorcc	r3, lr, #32, 4
 50c:	00302e34 	eorseq	r2, r0, r4, lsr lr
 510:	Address 0x00000510 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0x101
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	110e1b0e 	tstne	lr, lr, lsl #22
   c:	10061201 	andne	r1, r6, r1, lsl #4
  10:	02000017 	andeq	r0, r0, #23
  14:	0b0b0024 	bleq	2c00ac <__end+0x1960ac>
  18:	0e030b3e 	vmoveq.16	d3[0], r0
  1c:	24030000 	strcs	r0, [r3], #-0
  20:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  24:	0008030b 	andeq	r0, r8, fp, lsl #6
  28:	00160400 	andseq	r0, r6, r0, lsl #8
  2c:	0b3a0e03 	bleq	e83840 <__user_program+0xb83840>
  30:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  34:	2e050000 	cdpcs	0, 0, cr0, cr5, cr0, {0}
  38:	03193f01 	tsteq	r9, #1, 30
  3c:	3b0b3a0e 	blcc	2ce87c <__end+0x1a487c>
  40:	1119270b 	tstne	r9, fp, lsl #14
  44:	40061201 	andmi	r1, r6, r1, lsl #4
  48:	19429718 	stmdbne	r2, {r3, r4, r8, r9, sl, ip, pc}^
  4c:	00001301 	andeq	r1, r0, r1, lsl #6
  50:	03000506 	movweq	r0, #1286	; 0x506
  54:	3b0b3a08 	blcc	2ce87c <__end+0x1a487c>
  58:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  5c:	07000017 	smladeq	r0, r7, r0, r0
  60:	08030005 	stmdaeq	r3, {r0, r2}
  64:	0b3b0b3a 	bleq	ec2d54 <__user_program+0xbc2d54>
  68:	18021349 	stmdane	r2, {r0, r3, r6, r8, r9, ip}
  6c:	34080000 	strcc	r0, [r8], #-0
  70:	3a080300 	bcc	200c78 <__end+0xd6c78>
  74:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  78:	00170213 	andseq	r0, r7, r3, lsl r2
  7c:	00340900 	eorseq	r0, r4, r0, lsl #18
  80:	0b3a0e03 	bleq	e83894 <__user_program+0xb83894>
  84:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  88:	00001702 	andeq	r1, r0, r2, lsl #14
  8c:	0300050a 	movweq	r0, #1290	; 0x50a
  90:	3b0b3a0e 	blcc	2ce8d0 <__end+0x1a48d0>
  94:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  98:	0b000017 	bleq	fc <__start-0x7f04>
  9c:	01018289 	smlabbeq	r1, r9, r2, r8
  a0:	13310111 	teqne	r1, #1073741828	; 0x40000004
  a4:	00001301 	andeq	r1, r0, r1, lsl #6
  a8:	01828a0c 	orreq	r8, r2, ip, lsl #20
  ac:	91180200 	tstls	r8, r0, lsl #4
  b0:	00001842 	andeq	r1, r0, r2, asr #16
  b4:	0182890d 	orreq	r8, r2, sp, lsl #18
  b8:	31011101 	tstcc	r1, r1, lsl #2
  bc:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
  c0:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  c4:	0b3b0b3a 	bleq	ec2db4 <__user_program+0xbc2db4>
  c8:	061c1349 	ldreq	r1, [ip], -r9, asr #6
  cc:	260f0000 	strcs	r0, [pc], -r0
  d0:	00134900 	andseq	r4, r3, r0, lsl #18
  d4:	000f1000 	andeq	r1, pc, r0
  d8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
  dc:	35110000 	ldrcc	r0, [r1, #-0]
  e0:	00134900 	andseq	r4, r3, r0, lsl #18
  e4:	012e1200 	teqeq	lr, r0, lsl #4
  e8:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
  ec:	0b3b0b3a 	bleq	ec2ddc <__user_program+0xbc2ddc>
  f0:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
  f4:	05130000 	ldreq	r0, [r3, #-0]
  f8:	00134900 	andseq	r4, r3, r0, lsl #18
  fc:	11010000 	mrsne	r0, (UNDEF: 1)
 100:	130e2501 	movwne	r2, #58625	; 0xe501
 104:	1b0e030b 	blne	380d38 <__user_program+0x80d38>
 108:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 10c:	00171006 	andseq	r1, r7, r6
 110:	00240200 	eoreq	r0, r4, r0, lsl #4
 114:	0b3e0b0b 	bleq	f82d48 <__user_program+0xc82d48>
 118:	00000e03 	andeq	r0, r0, r3, lsl #28
 11c:	0b002403 	bleq	9130 <__bss_end+0x130>
 120:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 124:	04000008 	streq	r0, [r0], #-8
 128:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 12c:	0b3b0b3a 	bleq	ec2e1c <__user_program+0xbc2e1c>
 130:	00001349 	andeq	r1, r0, r9, asr #6
 134:	3f012e05 	svccc	0x00012e05
 138:	3a0e0319 	bcc	380da4 <__user_program+0x80da4>
 13c:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 140:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 144:	97184006 	ldrls	r4, [r8, -r6]
 148:	13011942 	movwne	r1, #6466	; 0x1942
 14c:	89060000 	stmdbhi	r6, {}	; <UNPREDICTABLE>
 150:	11010182 	smlabbne	r1, r2, r1, r0
 154:	01133101 	tsteq	r3, r1, lsl #2
 158:	07000013 	smladeq	r0, r3, r0, r0
 15c:	0001828a 	andeq	r8, r1, sl, lsl #5
 160:	42911802 	addsmi	r1, r1, #131072	; 0x20000
 164:	08000018 	stmdaeq	r0, {r3, r4}
 168:	01018289 	smlabbeq	r1, r9, r2, r8
 16c:	13310111 	teqne	r1, #1073741828	; 0x40000004
 170:	2e090000 	cdpcs	0, 0, cr0, cr9, cr0, {0}
 174:	03193f01 	tsteq	r9, #1, 30
 178:	3b0b3a0e 	blcc	2ce9b8 <__end+0x1a49b8>
 17c:	3c19270b 	ldccc	7, cr2, [r9], {11}
 180:	00130119 	andseq	r0, r3, r9, lsl r1
 184:	00050a00 	andeq	r0, r5, r0, lsl #20
 188:	00001349 	andeq	r1, r0, r9, asr #6
 18c:	3f012e0b 	svccc	0x00012e0b
 190:	3a0e0319 	bcc	380dfc <__user_program+0x80dfc>
 194:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 198:	00193c19 	andseq	r3, r9, r9, lsl ip
 19c:	11010000 	mrsne	r0, (UNDEF: 1)
 1a0:	130e2501 	movwne	r2, #58625	; 0xe501
 1a4:	1b0e030b 	blne	380dd8 <__user_program+0x80dd8>
 1a8:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 1ac:	00171006 	andseq	r1, r7, r6
 1b0:	00240200 	eoreq	r0, r4, r0, lsl #4
 1b4:	0b3e0b0b 	bleq	f82de8 <__user_program+0xc82de8>
 1b8:	00000e03 	andeq	r0, r0, r3, lsl #28
 1bc:	0b002403 	bleq	91d0 <__bss_end+0x1d0>
 1c0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 1c4:	04000008 	streq	r0, [r0], #-8
 1c8:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 1cc:	0b3b0b3a 	bleq	ec2ebc <__user_program+0xbc2ebc>
 1d0:	00001349 	andeq	r1, r0, r9, asr #6
 1d4:	3f012e05 	svccc	0x00012e05
 1d8:	3a0e0319 	bcc	380e44 <__user_program+0x80e44>
 1dc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 1e0:	12011119 	andne	r1, r1, #1073741830	; 0x40000006
 1e4:	97184006 	ldrls	r4, [r8, -r6]
 1e8:	13011942 	movwne	r1, #6466	; 0x1942
 1ec:	34060000 	strcc	r0, [r6], #-0
 1f0:	3a080300 	bcc	200df8 <__end+0xd6df8>
 1f4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1f8:	00180213 	andseq	r0, r8, r3, lsl r2
 1fc:	82890700 	addhi	r0, r9, #0, 14
 200:	01110001 	tsteq	r1, r1
 204:	00001331 	andeq	r1, r0, r1, lsr r3
 208:	01828908 	orreq	r8, r2, r8, lsl #18
 20c:	31011101 	tstcc	r1, r1, lsl #2
 210:	00130113 	andseq	r0, r3, r3, lsl r1
 214:	828a0900 	addhi	r0, sl, #0, 18
 218:	18020001 	stmdane	r2, {r0}
 21c:	00184291 	mulseq	r8, r1, r2
 220:	00350a00 	eorseq	r0, r5, r0, lsl #20
 224:	00001349 	andeq	r1, r0, r9, asr #6
 228:	3f002e0b 	svccc	0x00002e0b
 22c:	3a0e0319 	bcc	380e98 <__user_program+0x80e98>
 230:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 234:	00193c19 	andseq	r3, r9, r9, lsl ip
 238:	012e0c00 	teqeq	lr, r0, lsl #24
 23c:	0e03193f 	mcreq	9, 0, r1, cr3, cr15, {1}
 240:	0b3b0b3a 	bleq	ec2f30 <__user_program+0xbc2f30>
 244:	193c1927 	ldmdbne	ip!, {r0, r1, r2, r5, r8, fp, ip}
 248:	00001301 	andeq	r1, r0, r1, lsl #6
 24c:	4900050d 	stmdbmi	r0, {r0, r2, r3, r8, sl}
 250:	00000013 	andeq	r0, r0, r3, lsl r0
 254:	10001101 	andne	r1, r0, r1, lsl #2
 258:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 25c:	1b080301 	blne	200e68 <__end+0xd6e68>
 260:	13082508 	movwne	r2, #34056	; 0x8508
 264:	00000005 	andeq	r0, r0, r5
 268:	10001101 	andne	r1, r0, r1, lsl #2
 26c:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
 270:	1b080301 	blne	200e7c <__end+0xd6e7c>
 274:	13082508 	movwne	r2, #34056	; 0x8508
 278:	00000005 	andeq	r0, r0, r5

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000038 	andeq	r0, r0, r8, lsr r0
   8:	38500001 	ldmdacc	r0, {r0}^
   c:	54000000 	strpl	r0, [r0], #-0
  10:	04000000 	streq	r0, [r0], #-0
  14:	5001f300 	andpl	pc, r1, r0, lsl #6
  18:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  1c:	00000000 	andeq	r0, r0, r0
  20:	00000c00 	andeq	r0, r0, r0, lsl #24
  24:	00003800 	andeq	r3, r0, r0, lsl #16
  28:	70000e00 	andvc	r0, r0, r0, lsl #28
  2c:	3a25f700 	bcc	97dc34 <__user_program+0x67dc34>
  30:	f71b25f7 			; <UNDEFINED> instruction: 0xf71b25f7
  34:	1aff0800 	bne	fffc203c <__user_program+0xffcc203c>
  38:	0000389f 	muleq	r0, pc, r8	; <UNPREDICTABLE>
  3c:	00005400 	andeq	r5, r0, r0, lsl #8
  40:	f3000f00 	vpmax.f32	d0, d0, d0
  44:	25f75001 	ldrbcs	r5, [r7, #1]!
  48:	1b25f73a 	blne	97dd38 <__user_program+0x67dd38>
  4c:	ff0800f7 			; <UNDEFINED> instruction: 0xff0800f7
  50:	00009f1a 	andeq	r9, r0, sl, lsl pc
  54:	00000000 	andeq	r0, r0, r0
  58:	00300000 	eorseq	r0, r0, r0
  5c:	004c0000 	subeq	r0, ip, r0
  60:	00010000 	andeq	r0, r1, r0
  64:	00004c52 	andeq	r4, r0, r2, asr ip
  68:	00005400 	andeq	r5, r0, r0, lsl #8
  6c:	50000100 	andpl	r0, r0, r0, lsl #2
	...
  78:	00000040 	andeq	r0, r0, r0, asr #32
  7c:	0000004c 	andeq	r0, r0, ip, asr #32
  80:	00500001 	subseq	r0, r0, r1
  84:	00000000 	andeq	r0, r0, r0
  88:	54000000 	strpl	r0, [r0], #-0
  8c:	68000000 	stmdavs	r0, {}	; <UNPREDICTABLE>
  90:	01000000 	mrseq	r0, (UNDEF: 0)
  94:	00685000 	rsbeq	r5, r8, r0
  98:	00800000 	addeq	r0, r0, r0
  9c:	00040000 	andeq	r0, r4, r0
  a0:	9f5001f3 	svcls	0x005001f3
  a4:	00000080 	andeq	r0, r0, r0, lsl #1
  a8:	00000088 	andeq	r0, r0, r8, lsl #1
  ac:	88500001 	ldmdahi	r0, {r0}^
  b0:	98000000 	stmdals	r0, {}	; <UNPREDICTABLE>
  b4:	04000000 	streq	r0, [r0], #-0
  b8:	5001f300 	andpl	pc, r1, r0, lsl #6
  bc:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  c0:	00000000 	andeq	r0, r0, r0
  c4:	00009800 	andeq	r9, r0, r0, lsl #16
  c8:	0000ac00 	andeq	sl, r0, r0, lsl #24
  cc:	50000100 	andpl	r0, r0, r0, lsl #2
  d0:	000000ac 	andeq	r0, r0, ip, lsr #1
  d4:	000000c4 	andeq	r0, r0, r4, asr #1
  d8:	01f30004 	mvnseq	r0, r4
  dc:	00c49f50 	sbceq	r9, r4, r0, asr pc
  e0:	00cc0000 	sbceq	r0, ip, r0
  e4:	00010000 	andeq	r0, r1, r0
  e8:	0000cc50 	andeq	ip, r0, r0, asr ip
  ec:	0000dc00 	andeq	sp, r0, r0, lsl #24
  f0:	f3000400 	vshl.u8	d0, d0, d0
  f4:	009f5001 	addseq	r5, pc, r1
  f8:	00000000 	andeq	r0, r0, r0
  fc:	dc000000 	stcle	0, cr0, [r0], {-0}
 100:	00000000 	andeq	r0, r0, r0
 104:	01000001 	tsteq	r0, r1
 108:	01005000 	mrseq	r5, (UNDEF: 0)
 10c:	01600000 	cmneq	r0, r0
 110:	00040000 	andeq	r0, r4, r0
 114:	9f5001f3 	svcls	0x005001f3
	...
 120:	000000dc 	ldrdeq	r0, [r0], -ip
 124:	00000103 	andeq	r0, r0, r3, lsl #2
 128:	03510001 	cmpeq	r1, #1
 12c:	60000001 	andvs	r0, r0, r1
 130:	04000001 	streq	r0, [r0], #-1
 134:	5101f300 	mrspl	pc, SP_irq	; <UNPREDICTABLE>
 138:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
 13c:	00000000 	andeq	r0, r0, r0
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	00008054 	andeq	r8, r0, r4, asr r0
  14:	00000160 	andeq	r0, r0, r0, ror #2
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	01b50002 			; <UNDEFINED> instruction: 0x01b50002
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  34:	00000060 	andeq	r0, r0, r0, rrx
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	032e0002 	teqeq	lr, #2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	00008214 	andeq	r8, r0, r4, lsl r2
  54:	00000054 	andeq	r0, r0, r4, asr r0
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	045b0002 	ldrbeq	r0, [fp], #-2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00008000 	andeq	r8, r0, r0
  74:	00000054 	andeq	r0, r0, r4, asr r0
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	04b70002 	ldrteq	r0, [r7], #2
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00008268 	andeq	r8, r0, r8, ror #4
  94:	00000044 	andeq	r0, r0, r4, asr #32
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000082 	andeq	r0, r0, r2, lsl #1
   4:	004f0002 	subeq	r0, pc, r2
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	33010000 	movwcc	r0, #4096	; 0x1000
  1c:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  20:	732f6b62 	teqvc	pc, #100352	; 0x18800
  24:	33006372 	movwcc	r6, #882	; 0x372
  28:	696c3934 	stmdbvs	ip!, {r2, r4, r5, r8, fp, ip, sp}^
  2c:	692f6b62 	stmdbvs	pc!, {r1, r5, r6, r8, r9, fp, sp, lr}	; <UNPREDICTABLE>
  30:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
  34:	00006564 	andeq	r6, r0, r4, ror #10
  38:	6f697067 	svcvs	0x00697067
  3c:	0100632e 	tsteq	r0, lr, lsr #6
  40:	736b0000 	cmnvc	fp, #0
  44:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  48:	00682e74 	rsbeq	r2, r8, r4, ror lr
  4c:	61000002 	tstvs	r0, r2
  50:	682e6d72 	stmdavs	lr!, {r1, r4, r5, r6, r8, sl, fp, sp, lr}
  54:	00000200 	andeq	r0, r0, r0, lsl #4
  58:	02050000 	andeq	r0, r5, #0
  5c:	00008054 	andeq	r8, r0, r4, asr r0
  60:	0100d303 	tsteq	r0, r3, lsl #6
  64:	84a06a13 	strthi	r6, [r0], #2579	; 0xa13
  68:	4e2f4b83 	vmulmi.f64	d4, d31, d3
  6c:	d84b4d13 	stmdale	fp, {r0, r1, r4, r8, sl, fp, lr}^
  70:	4b4d13bf 	blmi	1344f74 <__user_program+0x1044f74>
  74:	6513bfd8 	ldrvs	fp, [r3, #-4056]	; 0xfd8
  78:	4b4b674f 	blmi	12d9dbc <__user_program+0xfd9dbc>
  7c:	9f684bbb 	svcls	0x00684bbb
  80:	0006024b 	andeq	r0, r6, fp, asr #4
  84:	006f0101 	rsbeq	r0, pc, r1, lsl #2
  88:	00020000 	andeq	r0, r2, r0
  8c:	00000050 	andeq	r0, r0, r0, asr r0
  90:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
  94:	0101000d 	tsteq	r1, sp
  98:	00000101 	andeq	r0, r0, r1, lsl #2
  9c:	00000100 	andeq	r0, r0, r0, lsl #2
  a0:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
  a4:	6b62696c 	blvs	189a65c <__user_program+0x159a65c>
  a8:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
  ac:	39343300 	ldmdbcc	r4!, {r8, r9, ip, sp}
  b0:	6b62696c 	blvs	189a668 <__user_program+0x159a668>
  b4:	636e692f 	cmnvs	lr, #770048	; 0xbc000
  b8:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
  bc:	656c0000 	strbvs	r0, [ip, #-0]!
  c0:	632e7364 	teqvs	lr, #100, 6	; 0x90000001
  c4:	00000100 	andeq	r0, r0, r0, lsl #2
  c8:	6f697067 	svcvs	0x00697067
  cc:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
  d0:	736b0000 	cmnvc	fp, #0
  d4:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  d8:	00682e74 	rsbeq	r2, r8, r4, ror lr
  dc:	00000002 	andeq	r0, r0, r2
  e0:	b4020500 	strlt	r0, [r2], #-1280	; 0x500
  e4:	03000081 	movweq	r0, #129	; 0x81
  e8:	672f0116 			; <UNDEFINED> instruction: 0x672f0116
  ec:	2f6a2f86 	svccs	0x006a2f86
  f0:	2f6a2f6a 	svccs	0x006a2f6a
  f4:	01000602 	tsteq	r0, r2, lsl #12
  f8:	0000a501 	andeq	sl, r0, r1, lsl #10
  fc:	61000200 	mrsvs	r0, R8_usr
 100:	02000000 	andeq	r0, r0, #0
 104:	0d0efb01 	vstreq	d15, [lr, #-4]
 108:	01010100 	mrseq	r0, (UNDEF: 17)
 10c:	00000001 	andeq	r0, r0, r1
 110:	01000001 	tsteq	r0, r1
 114:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 118:	6c5f6c65 	mrrcvs	12, 6, r6, pc, cr5	; <UNPREDICTABLE>
 11c:	5f306261 	svcpl	0x00306261
 120:	6e696c62 	cdpvs	12, 6, cr6, cr9, cr2, {3}
 124:	3433006b 	ldrtcc	r0, [r3], #-107	; 0x6b
 128:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 12c:	6e692f6b 	cdpvs	15, 6, cr2, cr9, cr11, {3}
 130:	64756c63 	ldrbtvs	r6, [r5], #-3171	; 0xc63
 134:	6b000065 	blvs	2d0 <__start-0x7d30>
 138:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 13c:	00632e6c 	rsbeq	r2, r3, ip, ror #28
 140:	6c000001 	stcvs	0, cr0, [r0], {1}
 144:	2e736465 	cdpcs	4, 7, cr6, cr3, cr5, {3}
 148:	00020068 	andeq	r0, r2, r8, rrx
 14c:	74736b00 	ldrbtvc	r6, [r3], #-2816	; 0xb00
 150:	746e6964 	strbtvc	r6, [lr], #-2404	; 0x964
 154:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 158:	72610000 	rsbvc	r0, r1, #0
 15c:	00682e6d 	rsbeq	r2, r8, sp, ror #28
 160:	00000002 	andeq	r0, r0, r2
 164:	14020500 	strne	r0, [r2], #-1280	; 0x500
 168:	03000082 	movweq	r0, #130	; 0x82
 16c:	2f4d010d 	svccs	0x004d010d
 170:	004d302f 	subeq	r3, sp, pc, lsr #32
 174:	06010402 	streq	r0, [r1], -r2, lsl #8
 178:	0402004a 	streq	r0, [r2], #-74	; 0x4a
 17c:	004b0601 	subeq	r0, fp, r1, lsl #12
 180:	2f010402 	svccs	0x00010402
 184:	01040200 	mrseq	r0, R12_usr
 188:	0402002f 	streq	r0, [r2], #-47	; 0x2f
 18c:	02004b01 	andeq	r4, r0, #1024	; 0x400
 190:	002f0104 	eoreq	r0, pc, r4, lsl #2
 194:	2f010402 	svccs	0x00010402
 198:	01040200 	mrseq	r0, R12_usr
 19c:	00020267 	andeq	r0, r2, r7, ror #4
 1a0:	00540101 	subseq	r0, r4, r1, lsl #2
 1a4:	00020000 	andeq	r0, r2, r0
 1a8:	00000029 	andeq	r0, r0, r9, lsr #32
 1ac:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 1b0:	0101000d 	tsteq	r1, sp
 1b4:	00000101 	andeq	r0, r0, r1, lsl #2
 1b8:	00000100 	andeq	r0, r0, r0, lsl #2
 1bc:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 1c0:	6b62696c 	blvs	189a778 <__user_program+0x159a778>
 1c4:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 1c8:	6f620000 	svcvs	0x00620000
 1cc:	532e746f 	teqpl	lr, #1862270976	; 0x6f000000
 1d0:	00000100 	andeq	r0, r0, r0, lsl #2
 1d4:	02050000 	andeq	r0, r5, #0
 1d8:	00008000 	andeq	r8, r0, r0
 1dc:	2f011b03 	svccs	0x00011b03
 1e0:	2f302f2f 	svccs	0x00302f2f
 1e4:	2f2f2f2f 	svccs	0x002f2f2f
 1e8:	2f2f312f 	svccs	0x002f312f
 1ec:	032f3331 	teqeq	pc, #-1006632960	; 0xc4000000
 1f0:	2f312e69 	svccs	0x00312e69
 1f4:	0002022f 	andeq	r0, r2, pc, lsr #4
 1f8:	004d0101 	subeq	r0, sp, r1, lsl #2
 1fc:	00020000 	andeq	r0, r2, r0
 200:	00000028 	andeq	r0, r0, r8, lsr #32
 204:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 208:	0101000d 	tsteq	r1, sp
 20c:	00000101 	andeq	r0, r0, r1, lsl #2
 210:	00000100 	andeq	r0, r0, r0, lsl #2
 214:	39343301 	ldmdbcc	r4!, {r0, r8, r9, ip, sp}
 218:	6b62696c 	blvs	189a7d0 <__user_program+0x159a7d0>
 21c:	6372732f 	cmnvs	r2, #-1140850688	; 0xbc000000
 220:	72610000 	rsbvc	r0, r1, #0
 224:	00532e6d 	subseq	r2, r3, sp, ror #28
 228:	00000001 	andeq	r0, r0, r1
 22c:	68020500 	stmdavs	r2, {r8, sl}
 230:	03000082 	movweq	r0, #130	; 0x82
 234:	2f2f0110 	svccs	0x002f0110
 238:	2f332f33 	svccs	0x00332f33
 23c:	2f2f2f33 	svccs	0x002f2f33
 240:	2f2f332f 	svccs	0x002f332f
 244:	02022f2f 	andeq	r2, r2, #47, 30	; 0xbc
 248:	Address 0x00000248 is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
   4:	6e6f6c20 	cdpvs	12, 6, cr6, cr15, cr0, {1}
   8:	6e692067 	cdpvs	0, 6, cr2, cr9, cr7, {3}
   c:	70670074 	rsbvc	r0, r7, r4, ror r0
  10:	735f6f69 	cmpvc	pc, #420	; 0x1a4
  14:	705f7465 	subsvc	r7, pc, r5, ror #8
  18:	006c6c75 	rsbeq	r6, ip, r5, ror ip
  1c:	6f697067 	svcvs	0x00697067
  20:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  24:	65735f6f 	ldrbvs	r5, [r3, #-3951]!	; 0xf6f
  28:	6f6c0074 	svcvs	0x006c0074
  2c:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
  30:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  34:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  38:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  3c:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
  40:	69706700 	ldmdbvs	r0!, {r8, r9, sl, sp, lr}^
  44:	6c635f6f 	stclvs	15, cr5, [r3], #-444	; 0xfffffe44
  48:	4e470072 	mcrmi	0, 2, r0, cr7, cr2, {3}
  4c:	20432055 	subcs	r2, r3, r5, asr r0
  50:	2e392e34 	mrccs	14, 1, r2, cr9, cr4, {1}
  54:	30322033 	eorscc	r2, r2, r3, lsr r0
  58:	35303531 	ldrcc	r3, [r0, #-1329]!	; 0x531
  5c:	28203932 	stmdacs	r0!, {r1, r4, r5, r8, fp, ip, sp}
  60:	656c6572 	strbvs	r6, [ip, #-1394]!	; 0x572
  64:	29657361 	stmdbcs	r5!, {r0, r5, r6, r8, r9, ip, sp, lr}^
  68:	52415b20 	subpl	r5, r1, #32, 22	; 0x8000
  6c:	6d652f4d 	stclvs	15, cr2, [r5, #-308]!	; 0xfffffecc
  70:	64646562 	strbtvs	r6, [r4], #-1378	; 0x562
  74:	342d6465 	strtcc	r6, [sp], #-1125	; 0x465
  78:	622d395f 	eorvs	r3, sp, #1556480	; 0x17c000
  7c:	636e6172 	cmnvs	lr, #-2147483620	; 0x8000001c
  80:	65722068 	ldrbvs	r2, [r2, #-104]!	; 0x68
  84:	69736976 	ldmdbvs	r3!, {r1, r2, r4, r5, r6, r8, fp, sp, lr}^
  88:	32206e6f 	eorcc	r6, r0, #1776	; 0x6f0
  8c:	38323432 	ldmdacc	r2!, {r1, r4, r5, sl, ip, sp}
  90:	2d205d38 	stccs	13, cr5, [r0, #-224]!	; 0xffffff20
  94:	6f6c666d 	svcvs	0x006c666d
  98:	612d7461 	teqvs	sp, r1, ror #8
  9c:	733d6962 	teqvc	sp, #1605632	; 0x188000
  a0:	2074666f 	rsbscs	r6, r4, pc, ror #12
  a4:	72616d2d 	rsbvc	r6, r1, #2880	; 0xb40
  a8:	613d6863 	teqvs	sp, r3, ror #16
  ac:	37766d72 			; <UNDEFINED> instruction: 0x37766d72
  b0:	2d20612d 	stfcss	f6, [r0, #-180]!	; 0xffffff4c
  b4:	4f2d2067 	svcmi	0x002d2067
  b8:	662d2031 			; <UNDEFINED> instruction: 0x662d2031
  bc:	65657266 	strbvs	r7, [r5, #-614]!	; 0x266
  c0:	6e617473 	mcrvs	4, 3, r7, cr1, cr3, {3}
  c4:	676e6964 	strbvs	r6, [lr, -r4, ror #18]!
  c8:	6e697500 	cdpvs	5, 6, cr7, cr9, cr0, {0}
  cc:	745f3874 	ldrbvc	r3, [pc], #-2164	; d4 <__start-0x7f2c>
  d0:	736e7500 	cmnvc	lr, #0, 10
  d4:	656e6769 	strbvs	r6, [lr, #-1897]!	; 0x769
  d8:	68632064 	stmdavs	r3!, {r2, r5, r6, sp}^
  dc:	75007261 	strvc	r7, [r0, #-609]	; 0x261
  e0:	33746e69 	cmncc	r4, #1680	; 0x690
  e4:	00745f32 	rsbseq	r5, r4, r2, lsr pc
  e8:	616c6564 	cmnvs	ip, r4, ror #10
  ec:	79635f79 	stmdbvc	r3!, {r0, r3, r4, r5, r6, r8, r9, sl, fp, ip, lr}^
  f0:	73656c63 	cmnvc	r5, #25344	; 0x6300
  f4:	6f687300 	svcvs	0x00687300
  f8:	75207472 	strvc	r7, [r0, #-1138]!	; 0x472
  fc:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
 100:	2064656e 	rsbcs	r6, r4, lr, ror #10
 104:	00746e69 	rsbseq	r6, r4, r9, ror #28
 108:	74617473 	strbtvc	r7, [r1], #-1139	; 0x473
 10c:	70670065 	rsbvc	r0, r7, r5, rrx
 110:	635f6f69 	cmpvs	pc, #420	; 0x1a4
 114:	69666e6f 	stmdbvs	r6!, {r0, r1, r2, r3, r5, r6, r9, sl, fp, sp, lr}^
 118:	68730067 	ldmdavs	r3!, {r0, r1, r2, r5, r6}^
 11c:	2074726f 	rsbscs	r7, r4, pc, ror #4
 120:	00746e69 	rsbseq	r6, r4, r9, ror #28
 124:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 70 <__start-0x7f90>
 128:	63652f65 	cmnvs	r5, #404	; 0x194
 12c:	39343365 	ldmdbcc	r4!, {r0, r2, r5, r6, r8, r9, ip, sp}
 130:	7365442f 	cmnvc	r5, #788529152	; 0x2f000000
 134:	706f746b 	rsbvc	r7, pc, fp, ror #8
 138:	3731462f 	ldrcc	r4, [r1, -pc, lsr #12]!
 13c:	2f41542d 	svccs	0x0041542d
 140:	65646f63 	strbvs	r6, [r4, #-3939]!	; 0xf63
 144:	66666f00 	strbtvs	r6, [r6], -r0, lsl #30
 148:	00746573 	rsbseq	r6, r4, r3, ror r5
 14c:	6c393433 	cfldrsvs	mvf3, [r9], #-204	; 0xffffff34
 150:	2f6b6269 	svccs	0x006b6269
 154:	2f637273 	svccs	0x00637273
 158:	6f697067 	svcvs	0x00697067
 15c:	6c00632e 	stcvs	3, cr6, [r0], {46}	; 0x2e
 160:	635f6465 	cmpvs	pc, #1694498816	; 0x65000000
 164:	675f726c 	ldrbvs	r7, [pc, -ip, ror #4]
 168:	6e656572 	mcrvs	5, 3, r6, cr5, cr2, {3}
 16c:	64656c00 	strbtvs	r6, [r5], #-3072	; 0xc00
 170:	7465735f 	strbtvc	r7, [r5], #-863	; 0x35f
 174:	6465725f 	strbtvs	r7, [r5], #-607	; 0x25f
 178:	64656c00 	strbtvs	r6, [r5], #-3072	; 0xc00
 17c:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 180:	34330074 	ldrtcc	r0, [r3], #-116	; 0x74
 184:	62696c39 	rsbvs	r6, r9, #14592	; 0x3900
 188:	72732f6b 	rsbsvc	r2, r3, #428	; 0x1ac
 18c:	656c2f63 	strbvs	r2, [ip, #-3939]!	; 0xf63
 190:	632e7364 	teqvs	lr, #100, 6	; 0x90000001
 194:	64656c00 	strbtvs	r6, [r5], #-3072	; 0xc00
 198:	726c635f 	rsbvc	r6, ip, #2080374785	; 0x7c000001
 19c:	6465725f 	strbtvs	r7, [r5], #-607	; 0x25f
 1a0:	64656c00 	strbtvs	r6, [r5], #-3072	; 0xc00
 1a4:	7465735f 	strbtvc	r7, [r5], #-863	; 0x35f
 1a8:	6572675f 	ldrbvs	r6, [r2, #-1887]!	; 0x75f
 1ac:	6b006e65 	blvs	1bb48 <__bss_end+0x12b48>
 1b0:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 1b4:	616c5f6c 	cmnvs	ip, ip, ror #30
 1b8:	625f3062 	subsvs	r3, pc, #98	; 0x62
 1bc:	6b6e696c 	blvs	1b9a774 <__user_program+0x189a774>
 1c0:	72656b2f 	rsbvc	r6, r5, #48128	; 0xbc00
 1c4:	2e6c656e 	cdpcs	5, 6, cr6, cr12, cr14, {3}
 1c8:	656b0063 	strbvs	r0, [fp, #-99]!	; 0x63
 1cc:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 1d0:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
 1d4:	Address 0x000001d4 is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <__user_program+0xdd0d24>
   4:	4e472820 	cdpmi	8, 4, cr2, cr7, cr0, {1}
   8:	6f542055 	svcvs	0x00542055
   c:	20736c6f 	rsbscs	r6, r3, pc, ror #24
  10:	20726f66 	rsbscs	r6, r2, r6, ror #30
  14:	204d5241 	subcs	r5, sp, r1, asr #4
  18:	65626d45 	strbvs	r6, [r2, #-3397]!	; 0xd45
  1c:	64656464 	strbtvs	r6, [r5], #-1124	; 0x464
  20:	6f725020 	svcvs	0x00725020
  24:	73736563 	cmnvc	r3, #415236096	; 0x18c00000
  28:	2973726f 	ldmdbcs	r3!, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}^
  2c:	392e3420 	stmdbcc	lr!, {r5, sl, ip, sp}
  30:	3220332e 	eorcc	r3, r0, #-1207959552	; 0xb8000000
  34:	30353130 	eorscc	r3, r5, r0, lsr r1
  38:	20393235 	eorscs	r3, r9, r5, lsr r2
  3c:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  40:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0x165
  44:	415b2029 	cmpmi	fp, r9, lsr #32
  48:	652f4d52 	strvs	r4, [pc, #-3410]!	; fffff2fe <__user_program+0xffcff2fe>
  4c:	6465626d 	strbtvs	r6, [r5], #-621	; 0x26d
  50:	2d646564 	cfstr64cs	mvdx6, [r4, #-400]!	; 0xfffffe70
  54:	2d395f34 	ldccs	15, cr5, [r9, #-208]!	; 0xffffff30
  58:	6e617262 	cdpvs	2, 6, cr7, cr1, cr2, {3}
  5c:	72206863 	eorvc	r6, r0, #6488064	; 0x630000
  60:	73697665 	cmnvc	r9, #105906176	; 0x6500000
  64:	206e6f69 	rsbcs	r6, lr, r9, ror #30
  68:	32343232 	eorscc	r3, r4, #536870915	; 0x20000003
  6c:	005d3838 	subseq	r3, sp, r8, lsr r8

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002c41 	andeq	r2, r0, r1, asr #24
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000022 	andeq	r0, r0, r2, lsr #32
  10:	412d3705 	teqmi	sp, r5, lsl #14
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	09010841 	stmdbeq	r1, {r0, r6, fp}
  1c:	14041202 	strne	r1, [r4], #-514	; 0x202
  20:	17011501 	strne	r1, [r1, -r1, lsl #10]
  24:	1a011803 	bne	46038 <__bss_end+0x3d038>
  28:	22011e01 	andcs	r1, r1, #1, 28
  2c:	Address 0x0000002c is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000000c 	andeq	r0, r0, ip
  14:	00000000 	andeq	r0, r0, r0
  18:	00008054 	andeq	r8, r0, r4, asr r0
  1c:	00000054 	andeq	r0, r0, r4, asr r0
  20:	0000000c 	andeq	r0, r0, ip
  24:	00000000 	andeq	r0, r0, r0
  28:	000080a8 	andeq	r8, r0, r8, lsr #1
  2c:	00000044 	andeq	r0, r0, r4, asr #32
  30:	0000000c 	andeq	r0, r0, ip
  34:	00000000 	andeq	r0, r0, r0
  38:	000080ec 	andeq	r8, r0, ip, ror #1
  3c:	00000044 	andeq	r0, r0, r4, asr #32
  40:	00000018 	andeq	r0, r0, r8, lsl r0
  44:	00000000 	andeq	r0, r0, r0
  48:	00008130 	andeq	r8, r0, r0, lsr r1
  4c:	00000084 	andeq	r0, r0, r4, lsl #1
  50:	83100e48 	tsthi	r0, #72, 28	; 0x480
  54:	85038404 	strhi	r8, [r3, #-1028]	; 0x404
  58:	00018e02 	andeq	r8, r1, r2, lsl #28
  5c:	0000000c 	andeq	r0, r0, ip
  60:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  64:	7c020001 	stcvc	0, cr0, [r2], {1}
  68:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  6c:	00000014 	andeq	r0, r0, r4, lsl r0
  70:	0000005c 	andeq	r0, r0, ip, asr r0
  74:	000081b4 			; <UNDEFINED> instruction: 0x000081b4
  78:	00000020 	andeq	r0, r0, r0, lsr #32
  7c:	83080e42 	movwhi	r0, #36418	; 0x8e42
  80:	00018e02 	andeq	r8, r1, r2, lsl #28
  84:	00000014 	andeq	r0, r0, r4, lsl r0
  88:	0000005c 	andeq	r0, r0, ip, asr r0
  8c:	000081d4 	ldrdeq	r8, [r0], -r4
  90:	00000010 	andeq	r0, r0, r0, lsl r0
  94:	83080e42 	movwhi	r0, #36418	; 0x8e42
  98:	00018e02 	andeq	r8, r1, r2, lsl #28
  9c:	00000014 	andeq	r0, r0, r4, lsl r0
  a0:	0000005c 	andeq	r0, r0, ip, asr r0
  a4:	000081e4 	andeq	r8, r0, r4, ror #3
  a8:	00000010 	andeq	r0, r0, r0, lsl r0
  ac:	83080e42 	movwhi	r0, #36418	; 0x8e42
  b0:	00018e02 	andeq	r8, r1, r2, lsl #28
  b4:	00000014 	andeq	r0, r0, r4, lsl r0
  b8:	0000005c 	andeq	r0, r0, ip, asr r0
  bc:	000081f4 	strdeq	r8, [r0], -r4
  c0:	00000010 	andeq	r0, r0, r0, lsl r0
  c4:	83080e42 	movwhi	r0, #36418	; 0x8e42
  c8:	00018e02 	andeq	r8, r1, r2, lsl #28
  cc:	00000014 	andeq	r0, r0, r4, lsl r0
  d0:	0000005c 	andeq	r0, r0, ip, asr r0
  d4:	00008204 	andeq	r8, r0, r4, lsl #4
  d8:	00000010 	andeq	r0, r0, r0, lsl r0
  dc:	83080e42 	movwhi	r0, #36418	; 0x8e42
  e0:	00018e02 	andeq	r8, r1, r2, lsl #28
  e4:	0000000c 	andeq	r0, r0, ip
  e8:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
  ec:	7c020001 	stcvc	0, cr0, [r2], {1}
  f0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  f4:	00000018 	andeq	r0, r0, r8, lsl r0
  f8:	000000e4 	andeq	r0, r0, r4, ror #1
  fc:	00008214 	andeq	r8, r0, r4, lsl r2
 100:	00000054 	andeq	r0, r0, r4, asr r0
 104:	84080e42 	strhi	r0, [r8], #-3650	; 0xe42
 108:	42018e02 	andmi	r8, r1, #2, 28
 10c:	0000100e 	andeq	r1, r0, lr
