
target/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_entry>:
    80200000:	00150293          	addi	t0,a0,1
    80200004:	02ba                	slli	t0,t0,0xe
    80200006:	0000c117          	auipc	sp,0xc
    8020000a:	9fa13103          	ld	sp,-1542(sp) # 8020ba00 <_GLOBAL_OFFSET_TABLE_+0x50>
    8020000e:	9116                	add	sp,sp,t0
    80200010:	203000ef          	jal	ra,80200a12 <main>

0000000080200014 <loop>:
    80200014:	a001                	j	80200014 <loop>

0000000080200016 <printint>:
    }
}

static void
printint(int xx, int base, int sign)
{
    80200016:	7179                	addi	sp,sp,-48
    80200018:	f406                	sd	ra,40(sp)
    8020001a:	f022                	sd	s0,32(sp)
    8020001c:	ec26                	sd	s1,24(sp)
    8020001e:	e84a                	sd	s2,16(sp)
    80200020:	1800                	addi	s0,sp,48
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    80200022:	c219                	beqz	a2,80200028 <printint+0x12>
    80200024:	08054663          	bltz	a0,802000b0 <printint+0x9a>
    x = -xx;
  else
    x = xx;
    80200028:	2501                	sext.w	a0,a0
    8020002a:	4881                	li	a7,0

  i = 0;
    8020002c:	fd040913          	addi	s2,s0,-48
    x = xx;
    80200030:	86ca                	mv	a3,s2
  i = 0;
    80200032:	4701                	li	a4,0
  do {
    buf[i++] = digits[x % base];
    80200034:	2581                	sext.w	a1,a1
    80200036:	00009617          	auipc	a2,0x9
    8020003a:	34a60613          	addi	a2,a2,842 # 80209380 <digits>
    8020003e:	883a                	mv	a6,a4
    80200040:	2705                	addiw	a4,a4,1
    80200042:	02b577bb          	remuw	a5,a0,a1
    80200046:	1782                	slli	a5,a5,0x20
    80200048:	9381                	srli	a5,a5,0x20
    8020004a:	97b2                	add	a5,a5,a2
    8020004c:	0007c783          	lbu	a5,0(a5)
    80200050:	00f68023          	sb	a5,0(a3)
  } while((x /= base) != 0);
    80200054:	0005079b          	sext.w	a5,a0
    80200058:	02b5553b          	divuw	a0,a0,a1
    8020005c:	0685                	addi	a3,a3,1
    8020005e:	feb7f0e3          	bgeu	a5,a1,8020003e <printint+0x28>

  if(sign)
    80200062:	00088c63          	beqz	a7,8020007a <printint+0x64>
    buf[i++] = '-';
    80200066:	fe070793          	addi	a5,a4,-32
    8020006a:	00878733          	add	a4,a5,s0
    8020006e:	02d00793          	li	a5,45
    80200072:	fef70823          	sb	a5,-16(a4)
    80200076:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    8020007a:	02e05563          	blez	a4,802000a4 <printint+0x8e>
    8020007e:	fd040493          	addi	s1,s0,-48
    80200082:	94ba                	add	s1,s1,a4
    80200084:	197d                	addi	s2,s2,-1
    80200086:	993a                	add	s2,s2,a4
    80200088:	377d                	addiw	a4,a4,-1
    8020008a:	1702                	slli	a4,a4,0x20
    8020008c:	9301                	srli	a4,a4,0x20
    8020008e:	40e90933          	sub	s2,s2,a4
    consputc(buf[i]);
    80200092:	fff4c503          	lbu	a0,-1(s1)
    80200096:	00007097          	auipc	ra,0x7
    8020009a:	f9a080e7          	jalr	-102(ra) # 80207030 <consputc>
  while(--i >= 0)
    8020009e:	14fd                	addi	s1,s1,-1
    802000a0:	ff2499e3          	bne	s1,s2,80200092 <printint+0x7c>
}
    802000a4:	70a2                	ld	ra,40(sp)
    802000a6:	7402                	ld	s0,32(sp)
    802000a8:	64e2                	ld	s1,24(sp)
    802000aa:	6942                	ld	s2,16(sp)
    802000ac:	6145                	addi	sp,sp,48
    802000ae:	8082                	ret
    x = -xx;
    802000b0:	40a0053b          	negw	a0,a0
  if(sign && (sign = xx < 0))
    802000b4:	4885                	li	a7,1
    x = -xx;
    802000b6:	bf9d                	j	8020002c <printint+0x16>

00000000802000b8 <printstring>:
void printstring(const char* s) {
    802000b8:	1101                	addi	sp,sp,-32
    802000ba:	ec06                	sd	ra,24(sp)
    802000bc:	e822                	sd	s0,16(sp)
    802000be:	e426                	sd	s1,8(sp)
    802000c0:	1000                	addi	s0,sp,32
    802000c2:	84aa                	mv	s1,a0
    while (*s)
    802000c4:	00054503          	lbu	a0,0(a0)
    802000c8:	c909                	beqz	a0,802000da <printstring+0x22>
        consputc(*s++);
    802000ca:	0485                	addi	s1,s1,1
    802000cc:	00007097          	auipc	ra,0x7
    802000d0:	f64080e7          	jalr	-156(ra) # 80207030 <consputc>
    while (*s)
    802000d4:	0004c503          	lbu	a0,0(s1)
    802000d8:	f96d                	bnez	a0,802000ca <printstring+0x12>
}
    802000da:	60e2                	ld	ra,24(sp)
    802000dc:	6442                	ld	s0,16(sp)
    802000de:	64a2                	ld	s1,8(sp)
    802000e0:	6105                	addi	sp,sp,32
    802000e2:	8082                	ret

00000000802000e4 <backtrace>:
  for(;;)
    ;
}

void backtrace()
{
    802000e4:	7179                	addi	sp,sp,-48
    802000e6:	f406                	sd	ra,40(sp)
    802000e8:	f022                	sd	s0,32(sp)
    802000ea:	ec26                	sd	s1,24(sp)
    802000ec:	e84a                	sd	s2,16(sp)
    802000ee:	e44e                	sd	s3,8(sp)
    802000f0:	1800                	addi	s0,sp,48

static inline uint64
r_fp()
{
  uint64 x;
  asm volatile("mv %0, s0" : "=r" (x) );
    802000f2:	8922                	mv	s2,s0
  uint64 *fp = (uint64 *)r_fp();
    802000f4:	84ca                	mv	s1,s2
  uint64 *bottom = (uint64 *)PGROUNDUP((uint64)fp);
    802000f6:	6785                	lui	a5,0x1
    802000f8:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    802000fa:	993e                	add	s2,s2,a5
    802000fc:	77fd                	lui	a5,0xfffff
    802000fe:	00f97933          	and	s2,s2,a5
  printf("backtrace:\n");
    80200102:	00009517          	auipc	a0,0x9
    80200106:	efe50513          	addi	a0,a0,-258 # 80209000 <etext>
    8020010a:	00000097          	auipc	ra,0x0
    8020010e:	084080e7          	jalr	132(ra) # 8020018e <printf>
  while (fp < bottom) {
    80200112:	0324f263          	bgeu	s1,s2,80200136 <backtrace+0x52>
    uint64 ra = *(fp - 1);
    printf("%p\n", ra - 4);
    80200116:	00009997          	auipc	s3,0x9
    8020011a:	53a98993          	addi	s3,s3,1338 # 80209650 <digits+0x2d0>
    8020011e:	ff84b583          	ld	a1,-8(s1)
    80200122:	15f1                	addi	a1,a1,-4
    80200124:	854e                	mv	a0,s3
    80200126:	00000097          	auipc	ra,0x0
    8020012a:	068080e7          	jalr	104(ra) # 8020018e <printf>
    fp = (uint64 *)*(fp - 2);
    8020012e:	ff04b483          	ld	s1,-16(s1)
  while (fp < bottom) {
    80200132:	ff24e6e3          	bltu	s1,s2,8020011e <backtrace+0x3a>
  }
}
    80200136:	70a2                	ld	ra,40(sp)
    80200138:	7402                	ld	s0,32(sp)
    8020013a:	64e2                	ld	s1,24(sp)
    8020013c:	6942                	ld	s2,16(sp)
    8020013e:	69a2                	ld	s3,8(sp)
    80200140:	6145                	addi	sp,sp,48
    80200142:	8082                	ret

0000000080200144 <panic>:
{
    80200144:	1101                	addi	sp,sp,-32
    80200146:	ec06                	sd	ra,24(sp)
    80200148:	e822                	sd	s0,16(sp)
    8020014a:	e426                	sd	s1,8(sp)
    8020014c:	1000                	addi	s0,sp,32
    8020014e:	84aa                	mv	s1,a0
  printf("panic: ");
    80200150:	00009517          	auipc	a0,0x9
    80200154:	ec050513          	addi	a0,a0,-320 # 80209010 <etext+0x10>
    80200158:	00000097          	auipc	ra,0x0
    8020015c:	036080e7          	jalr	54(ra) # 8020018e <printf>
  printf(s);
    80200160:	8526                	mv	a0,s1
    80200162:	00000097          	auipc	ra,0x0
    80200166:	02c080e7          	jalr	44(ra) # 8020018e <printf>
  printf("\n");
    8020016a:	00009517          	auipc	a0,0x9
    8020016e:	f6e50513          	addi	a0,a0,-146 # 802090d8 <etext+0xd8>
    80200172:	00000097          	auipc	ra,0x0
    80200176:	01c080e7          	jalr	28(ra) # 8020018e <printf>
  backtrace();
    8020017a:	00000097          	auipc	ra,0x0
    8020017e:	f6a080e7          	jalr	-150(ra) # 802000e4 <backtrace>
  panicked = 1; // freeze uart output from other CPUs
    80200182:	4785                	li	a5,1
    80200184:	00014717          	auipc	a4,0x14
    80200188:	e6f72e23          	sw	a5,-388(a4) # 80214000 <panicked>
  for(;;)
    8020018c:	a001                	j	8020018c <panic+0x48>

000000008020018e <printf>:
{
    8020018e:	7131                	addi	sp,sp,-192
    80200190:	fc86                	sd	ra,120(sp)
    80200192:	f8a2                	sd	s0,112(sp)
    80200194:	f4a6                	sd	s1,104(sp)
    80200196:	f0ca                	sd	s2,96(sp)
    80200198:	ecce                	sd	s3,88(sp)
    8020019a:	e8d2                	sd	s4,80(sp)
    8020019c:	e4d6                	sd	s5,72(sp)
    8020019e:	e0da                	sd	s6,64(sp)
    802001a0:	fc5e                	sd	s7,56(sp)
    802001a2:	f862                	sd	s8,48(sp)
    802001a4:	f466                	sd	s9,40(sp)
    802001a6:	f06a                	sd	s10,32(sp)
    802001a8:	ec6e                	sd	s11,24(sp)
    802001aa:	0100                	addi	s0,sp,128
    802001ac:	8a2a                	mv	s4,a0
    802001ae:	e40c                	sd	a1,8(s0)
    802001b0:	e810                	sd	a2,16(s0)
    802001b2:	ec14                	sd	a3,24(s0)
    802001b4:	f018                	sd	a4,32(s0)
    802001b6:	f41c                	sd	a5,40(s0)
    802001b8:	03043823          	sd	a6,48(s0)
    802001bc:	03143c23          	sd	a7,56(s0)
  locking = pr.locking;
    802001c0:	00014d97          	auipc	s11,0x14
    802001c4:	e60dad83          	lw	s11,-416(s11) # 80214020 <pr+0x18>
  if(locking)
    802001c8:	020d9b63          	bnez	s11,802001fe <printf+0x70>
  if (fmt == 0)
    802001cc:	040a0263          	beqz	s4,80200210 <printf+0x82>
  va_start(ap, fmt);
    802001d0:	00840793          	addi	a5,s0,8
    802001d4:	f8f43423          	sd	a5,-120(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    802001d8:	000a4503          	lbu	a0,0(s4)
    802001dc:	14050f63          	beqz	a0,8020033a <printf+0x1ac>
    802001e0:	4981                	li	s3,0
    if(c != '%'){
    802001e2:	02500a93          	li	s5,37
    switch(c){
    802001e6:	07000b93          	li	s7,112
  consputc('x');
    802001ea:	4d41                	li	s10,16
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802001ec:	00009b17          	auipc	s6,0x9
    802001f0:	194b0b13          	addi	s6,s6,404 # 80209380 <digits>
    switch(c){
    802001f4:	07300c93          	li	s9,115
    802001f8:	06400c13          	li	s8,100
    802001fc:	a82d                	j	80200236 <printf+0xa8>
    acquire(&pr.lock);
    802001fe:	00014517          	auipc	a0,0x14
    80200202:	e0a50513          	addi	a0,a0,-502 # 80214008 <pr>
    80200206:	00000097          	auipc	ra,0x0
    8020020a:	4ee080e7          	jalr	1262(ra) # 802006f4 <acquire>
    8020020e:	bf7d                	j	802001cc <printf+0x3e>
    panic("null fmt");
    80200210:	00009517          	auipc	a0,0x9
    80200214:	e1050513          	addi	a0,a0,-496 # 80209020 <etext+0x20>
    80200218:	00000097          	auipc	ra,0x0
    8020021c:	f2c080e7          	jalr	-212(ra) # 80200144 <panic>
      consputc(c);
    80200220:	00007097          	auipc	ra,0x7
    80200224:	e10080e7          	jalr	-496(ra) # 80207030 <consputc>
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80200228:	2985                	addiw	s3,s3,1
    8020022a:	013a07b3          	add	a5,s4,s3
    8020022e:	0007c503          	lbu	a0,0(a5) # fffffffffffff000 <ebss_clear+0xffffffff7fdd9000>
    80200232:	10050463          	beqz	a0,8020033a <printf+0x1ac>
    if(c != '%'){
    80200236:	ff5515e3          	bne	a0,s5,80200220 <printf+0x92>
    c = fmt[++i] & 0xff;
    8020023a:	2985                	addiw	s3,s3,1
    8020023c:	013a07b3          	add	a5,s4,s3
    80200240:	0007c783          	lbu	a5,0(a5)
    80200244:	0007849b          	sext.w	s1,a5
    if(c == 0)
    80200248:	cbed                	beqz	a5,8020033a <printf+0x1ac>
    switch(c){
    8020024a:	05778a63          	beq	a5,s7,8020029e <printf+0x110>
    8020024e:	02fbf663          	bgeu	s7,a5,8020027a <printf+0xec>
    80200252:	09978863          	beq	a5,s9,802002e2 <printf+0x154>
    80200256:	07800713          	li	a4,120
    8020025a:	0ce79563          	bne	a5,a4,80200324 <printf+0x196>
      printint(va_arg(ap, int), 16, 1);
    8020025e:	f8843783          	ld	a5,-120(s0)
    80200262:	00878713          	addi	a4,a5,8
    80200266:	f8e43423          	sd	a4,-120(s0)
    8020026a:	4605                	li	a2,1
    8020026c:	85ea                	mv	a1,s10
    8020026e:	4388                	lw	a0,0(a5)
    80200270:	00000097          	auipc	ra,0x0
    80200274:	da6080e7          	jalr	-602(ra) # 80200016 <printint>
      break;
    80200278:	bf45                	j	80200228 <printf+0x9a>
    switch(c){
    8020027a:	09578f63          	beq	a5,s5,80200318 <printf+0x18a>
    8020027e:	0b879363          	bne	a5,s8,80200324 <printf+0x196>
      printint(va_arg(ap, int), 10, 1);
    80200282:	f8843783          	ld	a5,-120(s0)
    80200286:	00878713          	addi	a4,a5,8
    8020028a:	f8e43423          	sd	a4,-120(s0)
    8020028e:	4605                	li	a2,1
    80200290:	45a9                	li	a1,10
    80200292:	4388                	lw	a0,0(a5)
    80200294:	00000097          	auipc	ra,0x0
    80200298:	d82080e7          	jalr	-638(ra) # 80200016 <printint>
      break;
    8020029c:	b771                	j	80200228 <printf+0x9a>
      printptr(va_arg(ap, uint64));
    8020029e:	f8843783          	ld	a5,-120(s0)
    802002a2:	00878713          	addi	a4,a5,8
    802002a6:	f8e43423          	sd	a4,-120(s0)
    802002aa:	0007b903          	ld	s2,0(a5)
  consputc('0');
    802002ae:	03000513          	li	a0,48
    802002b2:	00007097          	auipc	ra,0x7
    802002b6:	d7e080e7          	jalr	-642(ra) # 80207030 <consputc>
  consputc('x');
    802002ba:	07800513          	li	a0,120
    802002be:	00007097          	auipc	ra,0x7
    802002c2:	d72080e7          	jalr	-654(ra) # 80207030 <consputc>
    802002c6:	84ea                	mv	s1,s10
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    802002c8:	03c95793          	srli	a5,s2,0x3c
    802002cc:	97da                	add	a5,a5,s6
    802002ce:	0007c503          	lbu	a0,0(a5)
    802002d2:	00007097          	auipc	ra,0x7
    802002d6:	d5e080e7          	jalr	-674(ra) # 80207030 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    802002da:	0912                	slli	s2,s2,0x4
    802002dc:	34fd                	addiw	s1,s1,-1
    802002de:	f4ed                	bnez	s1,802002c8 <printf+0x13a>
    802002e0:	b7a1                	j	80200228 <printf+0x9a>
      if((s = va_arg(ap, char*)) == 0)
    802002e2:	f8843783          	ld	a5,-120(s0)
    802002e6:	00878713          	addi	a4,a5,8
    802002ea:	f8e43423          	sd	a4,-120(s0)
    802002ee:	6384                	ld	s1,0(a5)
    802002f0:	cc89                	beqz	s1,8020030a <printf+0x17c>
      for(; *s; s++)
    802002f2:	0004c503          	lbu	a0,0(s1)
    802002f6:	d90d                	beqz	a0,80200228 <printf+0x9a>
        consputc(*s);
    802002f8:	00007097          	auipc	ra,0x7
    802002fc:	d38080e7          	jalr	-712(ra) # 80207030 <consputc>
      for(; *s; s++)
    80200300:	0485                	addi	s1,s1,1
    80200302:	0004c503          	lbu	a0,0(s1)
    80200306:	f96d                	bnez	a0,802002f8 <printf+0x16a>
    80200308:	b705                	j	80200228 <printf+0x9a>
        s = "(null)";
    8020030a:	00009497          	auipc	s1,0x9
    8020030e:	d0e48493          	addi	s1,s1,-754 # 80209018 <etext+0x18>
      for(; *s; s++)
    80200312:	02800513          	li	a0,40
    80200316:	b7cd                	j	802002f8 <printf+0x16a>
      consputc('%');
    80200318:	8556                	mv	a0,s5
    8020031a:	00007097          	auipc	ra,0x7
    8020031e:	d16080e7          	jalr	-746(ra) # 80207030 <consputc>
      break;
    80200322:	b719                	j	80200228 <printf+0x9a>
      consputc('%');
    80200324:	8556                	mv	a0,s5
    80200326:	00007097          	auipc	ra,0x7
    8020032a:	d0a080e7          	jalr	-758(ra) # 80207030 <consputc>
      consputc(c);
    8020032e:	8526                	mv	a0,s1
    80200330:	00007097          	auipc	ra,0x7
    80200334:	d00080e7          	jalr	-768(ra) # 80207030 <consputc>
      break;
    80200338:	bdc5                	j	80200228 <printf+0x9a>
  if(locking)
    8020033a:	020d9163          	bnez	s11,8020035c <printf+0x1ce>
}
    8020033e:	70e6                	ld	ra,120(sp)
    80200340:	7446                	ld	s0,112(sp)
    80200342:	74a6                	ld	s1,104(sp)
    80200344:	7906                	ld	s2,96(sp)
    80200346:	69e6                	ld	s3,88(sp)
    80200348:	6a46                	ld	s4,80(sp)
    8020034a:	6aa6                	ld	s5,72(sp)
    8020034c:	6b06                	ld	s6,64(sp)
    8020034e:	7be2                	ld	s7,56(sp)
    80200350:	7c42                	ld	s8,48(sp)
    80200352:	7ca2                	ld	s9,40(sp)
    80200354:	7d02                	ld	s10,32(sp)
    80200356:	6de2                	ld	s11,24(sp)
    80200358:	6129                	addi	sp,sp,192
    8020035a:	8082                	ret
    release(&pr.lock);
    8020035c:	00014517          	auipc	a0,0x14
    80200360:	cac50513          	addi	a0,a0,-852 # 80214008 <pr>
    80200364:	00000097          	auipc	ra,0x0
    80200368:	3e4080e7          	jalr	996(ra) # 80200748 <release>
}
    8020036c:	bfc9                	j	8020033e <printf+0x1b0>

000000008020036e <printfinit>:

void
printfinit(void)
{
    8020036e:	1141                	addi	sp,sp,-16
    80200370:	e406                	sd	ra,8(sp)
    80200372:	e022                	sd	s0,0(sp)
    80200374:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80200376:	00009597          	auipc	a1,0x9
    8020037a:	cba58593          	addi	a1,a1,-838 # 80209030 <etext+0x30>
    8020037e:	00014517          	auipc	a0,0x14
    80200382:	c8a50513          	addi	a0,a0,-886 # 80214008 <pr>
    80200386:	00000097          	auipc	ra,0x0
    8020038a:	32a080e7          	jalr	810(ra) # 802006b0 <initlock>
  pr.locking = 1;   // changed, used to be 1
    8020038e:	4785                	li	a5,1
    80200390:	00014717          	auipc	a4,0x14
    80200394:	c8f72823          	sw	a5,-880(a4) # 80214020 <pr+0x18>
}
    80200398:	60a2                	ld	ra,8(sp)
    8020039a:	6402                	ld	s0,0(sp)
    8020039c:	0141                	addi	sp,sp,16
    8020039e:	8082                	ret

00000000802003a0 <print_logo>:

#ifdef QEMU
void print_logo() {
    802003a0:	1141                	addi	sp,sp,-16
    802003a2:	e406                	sd	ra,8(sp)
    802003a4:	e022                	sd	s0,0(sp)
    802003a6:	0800                	addi	s0,sp,16
    printf("  (`-.            (`-.                            .-')       ('-.    _   .-')\n");
    802003a8:	00009517          	auipc	a0,0x9
    802003ac:	c9050513          	addi	a0,a0,-880 # 80209038 <etext+0x38>
    802003b0:	00000097          	auipc	ra,0x0
    802003b4:	dde080e7          	jalr	-546(ra) # 8020018e <printf>
    printf(" ( OO ).        _(OO  )_                        .(  OO)    _(  OO)  ( '.( OO )_ \n");
    802003b8:	00009517          	auipc	a0,0x9
    802003bc:	cd050513          	addi	a0,a0,-816 # 80209088 <etext+0x88>
    802003c0:	00000097          	auipc	ra,0x0
    802003c4:	dce080e7          	jalr	-562(ra) # 8020018e <printf>
    printf("(_/.  \\_)-. ,--(_/   ,. \\  ,--.                (_)---\\_)  (,------.  ,--.   ,--.) ,--. ,--.  \n");
    802003c8:	00009517          	auipc	a0,0x9
    802003cc:	d1850513          	addi	a0,a0,-744 # 802090e0 <etext+0xe0>
    802003d0:	00000097          	auipc	ra,0x0
    802003d4:	dbe080e7          	jalr	-578(ra) # 8020018e <printf>
    printf(" \\  `.'  /  \\   \\   /(__/ /  .'       .-')     '  .-.  '   |  .---'  |   `.'   |  |  | |  |   \n");
    802003d8:	00009517          	auipc	a0,0x9
    802003dc:	d6850513          	addi	a0,a0,-664 # 80209140 <etext+0x140>
    802003e0:	00000097          	auipc	ra,0x0
    802003e4:	dae080e7          	jalr	-594(ra) # 8020018e <printf>
    printf("  \\     /\\   \\   \\ /   / .  / -.    _(  OO)   ,|  | |  |   |  |      |         |  |  | | .-')\n");
    802003e8:	00009517          	auipc	a0,0x9
    802003ec:	db850513          	addi	a0,a0,-584 # 802091a0 <etext+0x1a0>
    802003f0:	00000097          	auipc	ra,0x0
    802003f4:	d9e080e7          	jalr	-610(ra) # 8020018e <printf>
    printf("   \\   \\ |    \\   '   /, | .-.  '  (,------. (_|  | |  |  (|  '--.   |  |'.'|  |  |  |_|( OO )\n");
    802003f8:	00009517          	auipc	a0,0x9
    802003fc:	e0850513          	addi	a0,a0,-504 # 80209200 <etext+0x200>
    80200400:	00000097          	auipc	ra,0x0
    80200404:	d8e080e7          	jalr	-626(ra) # 8020018e <printf>
    printf("  .'    \\_)    \\     /__)' \\  |  |  '------'   |  | |  |   |  .--'   |  |   |  |  |  | | `-' /\n");
    80200408:	00009517          	auipc	a0,0x9
    8020040c:	e5850513          	addi	a0,a0,-424 # 80209260 <etext+0x260>
    80200410:	00000097          	auipc	ra,0x0
    80200414:	d7e080e7          	jalr	-642(ra) # 8020018e <printf>
    printf(" /  .'.  \\      \\   /    \\  `'  /              '  '-'  '-. |  `---.  |  |   |  | ('  '-'(_.-'\n");
    80200418:	00009517          	auipc	a0,0x9
    8020041c:	ea850513          	addi	a0,a0,-344 # 802092c0 <etext+0x2c0>
    80200420:	00000097          	auipc	ra,0x0
    80200424:	d6e080e7          	jalr	-658(ra) # 8020018e <printf>
    printf("'--'   '--'      `-'      `----'                `-----'--' `------'  `--'   `--'   `-----'\n");
    80200428:	00009517          	auipc	a0,0x9
    8020042c:	ef850513          	addi	a0,a0,-264 # 80209320 <etext+0x320>
    80200430:	00000097          	auipc	ra,0x0
    80200434:	d5e080e7          	jalr	-674(ra) # 8020018e <printf>
}
    80200438:	60a2                	ld	ra,8(sp)
    8020043a:	6402                	ld	s0,0(sp)
    8020043c:	0141                	addi	sp,sp,16
    8020043e:	8082                	ret

0000000080200440 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80200440:	1101                	addi	sp,sp,-32
    80200442:	ec06                	sd	ra,24(sp)
    80200444:	e822                	sd	s0,16(sp)
    80200446:	e426                	sd	s1,8(sp)
    80200448:	e04a                	sd	s2,0(sp)
    8020044a:	1000                	addi	s0,sp,32
  struct run *r;
  
  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < kernel_end || (uint64)pa >= PHYSTOP)
    8020044c:	03451793          	slli	a5,a0,0x34
    80200450:	e3ad                	bnez	a5,802004b2 <kfree+0x72>
    80200452:	84aa                	mv	s1,a0
    80200454:	0000b797          	auipc	a5,0xb
    80200458:	5847b783          	ld	a5,1412(a5) # 8020b9d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    8020045c:	04f56b63          	bltu	a0,a5,802004b2 <kfree+0x72>
    80200460:	40300793          	li	a5,1027
    80200464:	07d6                	slli	a5,a5,0x15
    80200466:	04f57663          	bgeu	a0,a5,802004b2 <kfree+0x72>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    8020046a:	6605                	lui	a2,0x1
    8020046c:	4585                	li	a1,1
    8020046e:	00000097          	auipc	ra,0x0
    80200472:	322080e7          	jalr	802(ra) # 80200790 <memset>

  r = (struct run*)pa;

  acquire(&kmem.lock);
    80200476:	00014917          	auipc	s2,0x14
    8020047a:	bb290913          	addi	s2,s2,-1102 # 80214028 <kmem>
    8020047e:	854a                	mv	a0,s2
    80200480:	00000097          	auipc	ra,0x0
    80200484:	274080e7          	jalr	628(ra) # 802006f4 <acquire>
  r->next = kmem.freelist;
    80200488:	01893783          	ld	a5,24(s2)
    8020048c:	e09c                	sd	a5,0(s1)
  kmem.freelist = r;
    8020048e:	00993c23          	sd	s1,24(s2)
  kmem.npage++;
    80200492:	02093783          	ld	a5,32(s2)
    80200496:	0785                	addi	a5,a5,1
    80200498:	02f93023          	sd	a5,32(s2)
  release(&kmem.lock);
    8020049c:	854a                	mv	a0,s2
    8020049e:	00000097          	auipc	ra,0x0
    802004a2:	2aa080e7          	jalr	682(ra) # 80200748 <release>
}
    802004a6:	60e2                	ld	ra,24(sp)
    802004a8:	6442                	ld	s0,16(sp)
    802004aa:	64a2                	ld	s1,8(sp)
    802004ac:	6902                	ld	s2,0(sp)
    802004ae:	6105                	addi	sp,sp,32
    802004b0:	8082                	ret
    panic("kfree");
    802004b2:	00009517          	auipc	a0,0x9
    802004b6:	ee650513          	addi	a0,a0,-282 # 80209398 <digits+0x18>
    802004ba:	00000097          	auipc	ra,0x0
    802004be:	c8a080e7          	jalr	-886(ra) # 80200144 <panic>

00000000802004c2 <freerange>:
{
    802004c2:	7179                	addi	sp,sp,-48
    802004c4:	f406                	sd	ra,40(sp)
    802004c6:	f022                	sd	s0,32(sp)
    802004c8:	ec26                	sd	s1,24(sp)
    802004ca:	e84a                	sd	s2,16(sp)
    802004cc:	e44e                	sd	s3,8(sp)
    802004ce:	e052                	sd	s4,0(sp)
    802004d0:	1800                	addi	s0,sp,48
  p = (char*)PGROUNDUP((uint64)pa_start);
    802004d2:	6785                	lui	a5,0x1
    802004d4:	fff78713          	addi	a4,a5,-1 # fff <_entry-0x801ff001>
    802004d8:	00e504b3          	add	s1,a0,a4
    802004dc:	777d                	lui	a4,0xfffff
    802004de:	8cf9                	and	s1,s1,a4
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004e0:	94be                	add	s1,s1,a5
    802004e2:	0095ee63          	bltu	a1,s1,802004fe <freerange+0x3c>
    802004e6:	892e                	mv	s2,a1
    kfree(p);
    802004e8:	7a7d                	lui	s4,0xfffff
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004ea:	6985                	lui	s3,0x1
    kfree(p);
    802004ec:	01448533          	add	a0,s1,s4
    802004f0:	00000097          	auipc	ra,0x0
    802004f4:	f50080e7          	jalr	-176(ra) # 80200440 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    802004f8:	94ce                	add	s1,s1,s3
    802004fa:	fe9979e3          	bgeu	s2,s1,802004ec <freerange+0x2a>
}
    802004fe:	70a2                	ld	ra,40(sp)
    80200500:	7402                	ld	s0,32(sp)
    80200502:	64e2                	ld	s1,24(sp)
    80200504:	6942                	ld	s2,16(sp)
    80200506:	69a2                	ld	s3,8(sp)
    80200508:	6a02                	ld	s4,0(sp)
    8020050a:	6145                	addi	sp,sp,48
    8020050c:	8082                	ret

000000008020050e <kinit>:
{
    8020050e:	1101                	addi	sp,sp,-32
    80200510:	ec06                	sd	ra,24(sp)
    80200512:	e822                	sd	s0,16(sp)
    80200514:	e426                	sd	s1,8(sp)
    80200516:	1000                	addi	s0,sp,32
  initlock(&kmem.lock, "kmem");
    80200518:	00014497          	auipc	s1,0x14
    8020051c:	b1048493          	addi	s1,s1,-1264 # 80214028 <kmem>
    80200520:	00009597          	auipc	a1,0x9
    80200524:	e8058593          	addi	a1,a1,-384 # 802093a0 <digits+0x20>
    80200528:	8526                	mv	a0,s1
    8020052a:	00000097          	auipc	ra,0x0
    8020052e:	186080e7          	jalr	390(ra) # 802006b0 <initlock>
  kmem.freelist = 0;
    80200532:	0004bc23          	sd	zero,24(s1)
  kmem.npage = 0;
    80200536:	0204b023          	sd	zero,32(s1)
  freerange(kernel_end, (void*)PHYSTOP);
    8020053a:	40300493          	li	s1,1027
    8020053e:	01549593          	slli	a1,s1,0x15
    80200542:	0000b517          	auipc	a0,0xb
    80200546:	49653503          	ld	a0,1174(a0) # 8020b9d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    8020054a:	00000097          	auipc	ra,0x0
    8020054e:	f78080e7          	jalr	-136(ra) # 802004c2 <freerange>
  printf("kernel_end: %p, phystop: %p\n", kernel_end, (void*)PHYSTOP);
    80200552:	01549613          	slli	a2,s1,0x15
    80200556:	0000b597          	auipc	a1,0xb
    8020055a:	4825b583          	ld	a1,1154(a1) # 8020b9d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    8020055e:	00009517          	auipc	a0,0x9
    80200562:	e4a50513          	addi	a0,a0,-438 # 802093a8 <digits+0x28>
    80200566:	00000097          	auipc	ra,0x0
    8020056a:	c28080e7          	jalr	-984(ra) # 8020018e <printf>
  printf("kinit\n");
    8020056e:	00009517          	auipc	a0,0x9
    80200572:	e5a50513          	addi	a0,a0,-422 # 802093c8 <digits+0x48>
    80200576:	00000097          	auipc	ra,0x0
    8020057a:	c18080e7          	jalr	-1000(ra) # 8020018e <printf>
}
    8020057e:	60e2                	ld	ra,24(sp)
    80200580:	6442                	ld	s0,16(sp)
    80200582:	64a2                	ld	s1,8(sp)
    80200584:	6105                	addi	sp,sp,32
    80200586:	8082                	ret

0000000080200588 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    80200588:	1101                	addi	sp,sp,-32
    8020058a:	ec06                	sd	ra,24(sp)
    8020058c:	e822                	sd	s0,16(sp)
    8020058e:	e426                	sd	s1,8(sp)
    80200590:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    80200592:	00014497          	auipc	s1,0x14
    80200596:	a9648493          	addi	s1,s1,-1386 # 80214028 <kmem>
    8020059a:	8526                	mv	a0,s1
    8020059c:	00000097          	auipc	ra,0x0
    802005a0:	158080e7          	jalr	344(ra) # 802006f4 <acquire>
  r = kmem.freelist;
    802005a4:	6c84                	ld	s1,24(s1)
  if(r) {
    802005a6:	c89d                	beqz	s1,802005dc <kalloc+0x54>
    kmem.freelist = r->next;
    802005a8:	609c                	ld	a5,0(s1)
    802005aa:	00014517          	auipc	a0,0x14
    802005ae:	a7e50513          	addi	a0,a0,-1410 # 80214028 <kmem>
    802005b2:	ed1c                	sd	a5,24(a0)
    kmem.npage--;
    802005b4:	711c                	ld	a5,32(a0)
    802005b6:	17fd                	addi	a5,a5,-1
    802005b8:	f11c                	sd	a5,32(a0)
  }
  release(&kmem.lock);
    802005ba:	00000097          	auipc	ra,0x0
    802005be:	18e080e7          	jalr	398(ra) # 80200748 <release>

  if(r)
    memset((char*)r, 5, PGSIZE); // fill with junk
    802005c2:	6605                	lui	a2,0x1
    802005c4:	4595                	li	a1,5
    802005c6:	8526                	mv	a0,s1
    802005c8:	00000097          	auipc	ra,0x0
    802005cc:	1c8080e7          	jalr	456(ra) # 80200790 <memset>
  return (void*)r;
}
    802005d0:	8526                	mv	a0,s1
    802005d2:	60e2                	ld	ra,24(sp)
    802005d4:	6442                	ld	s0,16(sp)
    802005d6:	64a2                	ld	s1,8(sp)
    802005d8:	6105                	addi	sp,sp,32
    802005da:	8082                	ret
  release(&kmem.lock);
    802005dc:	00014517          	auipc	a0,0x14
    802005e0:	a4c50513          	addi	a0,a0,-1460 # 80214028 <kmem>
    802005e4:	00000097          	auipc	ra,0x0
    802005e8:	164080e7          	jalr	356(ra) # 80200748 <release>
  if(r)
    802005ec:	b7d5                	j	802005d0 <kalloc+0x48>

00000000802005ee <freemem_amount>:

uint64
freemem_amount(void)
{
    802005ee:	1141                	addi	sp,sp,-16
    802005f0:	e422                	sd	s0,8(sp)
    802005f2:	0800                	addi	s0,sp,16
  return kmem.npage << PGSHIFT;
}
    802005f4:	00014517          	auipc	a0,0x14
    802005f8:	a5453503          	ld	a0,-1452(a0) # 80214048 <kmem+0x20>
    802005fc:	0532                	slli	a0,a0,0xc
    802005fe:	6422                	ld	s0,8(sp)
    80200600:	0141                	addi	sp,sp,16
    80200602:	8082                	ret

0000000080200604 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    80200604:	1101                	addi	sp,sp,-32
    80200606:	ec06                	sd	ra,24(sp)
    80200608:	e822                	sd	s0,16(sp)
    8020060a:	e426                	sd	s1,8(sp)
    8020060c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020060e:	100024f3          	csrr	s1,sstatus
    80200612:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80200616:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80200618:	10079073          	csrw	sstatus,a5
  int old = intr_get();

  intr_off();
  //printf("\e[32mpush_off()\e[0m: cpuid(): %d\n", cpuid());
  if(mycpu()->noff == 0)
    8020061c:	00001097          	auipc	ra,0x1
    80200620:	4a0080e7          	jalr	1184(ra) # 80201abc <mycpu>
    80200624:	5d3c                	lw	a5,120(a0)
    80200626:	cf89                	beqz	a5,80200640 <push_off+0x3c>
    mycpu()->intena = old;
  mycpu()->noff += 1;
    80200628:	00001097          	auipc	ra,0x1
    8020062c:	494080e7          	jalr	1172(ra) # 80201abc <mycpu>
    80200630:	5d3c                	lw	a5,120(a0)
    80200632:	2785                	addiw	a5,a5,1
    80200634:	dd3c                	sw	a5,120(a0)
}
    80200636:	60e2                	ld	ra,24(sp)
    80200638:	6442                	ld	s0,16(sp)
    8020063a:	64a2                	ld	s1,8(sp)
    8020063c:	6105                	addi	sp,sp,32
    8020063e:	8082                	ret
    mycpu()->intena = old;
    80200640:	00001097          	auipc	ra,0x1
    80200644:	47c080e7          	jalr	1148(ra) # 80201abc <mycpu>
  return (x & SSTATUS_SIE) != 0;
    80200648:	8085                	srli	s1,s1,0x1
    8020064a:	8885                	andi	s1,s1,1
    8020064c:	dd64                	sw	s1,124(a0)
    8020064e:	bfe9                	j	80200628 <push_off+0x24>

0000000080200650 <pop_off>:

void
pop_off(void)
{
    80200650:	1141                	addi	sp,sp,-16
    80200652:	e406                	sd	ra,8(sp)
    80200654:	e022                	sd	s0,0(sp)
    80200656:	0800                	addi	s0,sp,16
  struct cpu *c = mycpu();
    80200658:	00001097          	auipc	ra,0x1
    8020065c:	464080e7          	jalr	1124(ra) # 80201abc <mycpu>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80200660:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80200664:	8b89                	andi	a5,a5,2

  //printf("\e[31mpop_off()\e[0m: cpuid(): %d\n", cpuid());
  if(intr_get())
    80200666:	e78d                	bnez	a5,80200690 <pop_off+0x40>
    panic("pop_off - interruptible");
  if(c->noff < 1) {
    80200668:	5d3c                	lw	a5,120(a0)
    8020066a:	02f05b63          	blez	a5,802006a0 <pop_off+0x50>
    //printf("c->noff = %d\n", c->noff);
    panic("pop_off");
  }
  //printf("c->noff: %d\n", c->noff);
  //printf("c: %x\n", c);
  c->noff -= 1;
    8020066e:	37fd                	addiw	a5,a5,-1
    80200670:	0007871b          	sext.w	a4,a5
    80200674:	dd3c                	sw	a5,120(a0)
  if(c->noff == 0 && c->intena)
    80200676:	eb09                	bnez	a4,80200688 <pop_off+0x38>
    80200678:	5d7c                	lw	a5,124(a0)
    8020067a:	c799                	beqz	a5,80200688 <pop_off+0x38>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020067c:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80200680:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80200684:	10079073          	csrw	sstatus,a5
    intr_on();
}
    80200688:	60a2                	ld	ra,8(sp)
    8020068a:	6402                	ld	s0,0(sp)
    8020068c:	0141                	addi	sp,sp,16
    8020068e:	8082                	ret
    panic("pop_off - interruptible");
    80200690:	00009517          	auipc	a0,0x9
    80200694:	d4050513          	addi	a0,a0,-704 # 802093d0 <digits+0x50>
    80200698:	00000097          	auipc	ra,0x0
    8020069c:	aac080e7          	jalr	-1364(ra) # 80200144 <panic>
    panic("pop_off");
    802006a0:	00009517          	auipc	a0,0x9
    802006a4:	d4850513          	addi	a0,a0,-696 # 802093e8 <digits+0x68>
    802006a8:	00000097          	auipc	ra,0x0
    802006ac:	a9c080e7          	jalr	-1380(ra) # 80200144 <panic>

00000000802006b0 <initlock>:
#include "include/intr.h"
#include "include/printf.h"

void
initlock(struct spinlock *lk, char *name)
{
    802006b0:	1141                	addi	sp,sp,-16
    802006b2:	e422                	sd	s0,8(sp)
    802006b4:	0800                	addi	s0,sp,16
  lk->name = name;
    802006b6:	e50c                	sd	a1,8(a0)
  lk->locked = 0;
    802006b8:	00052023          	sw	zero,0(a0)
  lk->cpu = 0;
    802006bc:	00053823          	sd	zero,16(a0)
}
    802006c0:	6422                	ld	s0,8(sp)
    802006c2:	0141                	addi	sp,sp,16
    802006c4:	8082                	ret

00000000802006c6 <holding>:
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    802006c6:	411c                	lw	a5,0(a0)
    802006c8:	e399                	bnez	a5,802006ce <holding+0x8>
    802006ca:	4501                	li	a0,0
  return r;
}
    802006cc:	8082                	ret
{
    802006ce:	1101                	addi	sp,sp,-32
    802006d0:	ec06                	sd	ra,24(sp)
    802006d2:	e822                	sd	s0,16(sp)
    802006d4:	e426                	sd	s1,8(sp)
    802006d6:	1000                	addi	s0,sp,32
  r = (lk->locked && lk->cpu == mycpu());
    802006d8:	6904                	ld	s1,16(a0)
    802006da:	00001097          	auipc	ra,0x1
    802006de:	3e2080e7          	jalr	994(ra) # 80201abc <mycpu>
    802006e2:	40a48533          	sub	a0,s1,a0
    802006e6:	00153513          	seqz	a0,a0
}
    802006ea:	60e2                	ld	ra,24(sp)
    802006ec:	6442                	ld	s0,16(sp)
    802006ee:	64a2                	ld	s1,8(sp)
    802006f0:	6105                	addi	sp,sp,32
    802006f2:	8082                	ret

00000000802006f4 <acquire>:
{
    802006f4:	1101                	addi	sp,sp,-32
    802006f6:	ec06                	sd	ra,24(sp)
    802006f8:	e822                	sd	s0,16(sp)
    802006fa:	e426                	sd	s1,8(sp)
    802006fc:	1000                	addi	s0,sp,32
    802006fe:	84aa                	mv	s1,a0
  push_off(); // disable interrupts to avoid deadlock.
    80200700:	00000097          	auipc	ra,0x0
    80200704:	f04080e7          	jalr	-252(ra) # 80200604 <push_off>
  if(holding(lk))
    80200708:	8526                	mv	a0,s1
    8020070a:	00000097          	auipc	ra,0x0
    8020070e:	fbc080e7          	jalr	-68(ra) # 802006c6 <holding>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    80200712:	4705                	li	a4,1
  if(holding(lk))
    80200714:	e115                	bnez	a0,80200738 <acquire+0x44>
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    80200716:	87ba                	mv	a5,a4
    80200718:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    8020071c:	2781                	sext.w	a5,a5
    8020071e:	ffe5                	bnez	a5,80200716 <acquire+0x22>
  __sync_synchronize();
    80200720:	0ff0000f          	fence
  lk->cpu = mycpu();
    80200724:	00001097          	auipc	ra,0x1
    80200728:	398080e7          	jalr	920(ra) # 80201abc <mycpu>
    8020072c:	e888                	sd	a0,16(s1)
}
    8020072e:	60e2                	ld	ra,24(sp)
    80200730:	6442                	ld	s0,16(sp)
    80200732:	64a2                	ld	s1,8(sp)
    80200734:	6105                	addi	sp,sp,32
    80200736:	8082                	ret
    panic("acquire");
    80200738:	00009517          	auipc	a0,0x9
    8020073c:	cb850513          	addi	a0,a0,-840 # 802093f0 <digits+0x70>
    80200740:	00000097          	auipc	ra,0x0
    80200744:	a04080e7          	jalr	-1532(ra) # 80200144 <panic>

0000000080200748 <release>:
{
    80200748:	1101                	addi	sp,sp,-32
    8020074a:	ec06                	sd	ra,24(sp)
    8020074c:	e822                	sd	s0,16(sp)
    8020074e:	e426                	sd	s1,8(sp)
    80200750:	1000                	addi	s0,sp,32
    80200752:	84aa                	mv	s1,a0
  if(!holding(lk))
    80200754:	00000097          	auipc	ra,0x0
    80200758:	f72080e7          	jalr	-142(ra) # 802006c6 <holding>
    8020075c:	c115                	beqz	a0,80200780 <release+0x38>
  lk->cpu = 0;
    8020075e:	0004b823          	sd	zero,16(s1)
  __sync_synchronize();
    80200762:	0ff0000f          	fence
  __sync_lock_release(&lk->locked);
    80200766:	0f50000f          	fence	iorw,ow
    8020076a:	0804a02f          	amoswap.w	zero,zero,(s1)
  pop_off();
    8020076e:	00000097          	auipc	ra,0x0
    80200772:	ee2080e7          	jalr	-286(ra) # 80200650 <pop_off>
}
    80200776:	60e2                	ld	ra,24(sp)
    80200778:	6442                	ld	s0,16(sp)
    8020077a:	64a2                	ld	s1,8(sp)
    8020077c:	6105                	addi	sp,sp,32
    8020077e:	8082                	ret
    panic("release");
    80200780:	00009517          	auipc	a0,0x9
    80200784:	c7850513          	addi	a0,a0,-904 # 802093f8 <digits+0x78>
    80200788:	00000097          	auipc	ra,0x0
    8020078c:	9bc080e7          	jalr	-1604(ra) # 80200144 <panic>

0000000080200790 <memset>:
#include "include/types.h"

void*
memset(void *dst, int c, uint n)
{
    80200790:	1141                	addi	sp,sp,-16
    80200792:	e422                	sd	s0,8(sp)
    80200794:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    80200796:	ca19                	beqz	a2,802007ac <memset+0x1c>
    80200798:	87aa                	mv	a5,a0
    8020079a:	1602                	slli	a2,a2,0x20
    8020079c:	9201                	srli	a2,a2,0x20
    8020079e:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
    802007a2:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    802007a6:	0785                	addi	a5,a5,1
    802007a8:	fee79de3          	bne	a5,a4,802007a2 <memset+0x12>
  }
  return dst;
}
    802007ac:	6422                	ld	s0,8(sp)
    802007ae:	0141                	addi	sp,sp,16
    802007b0:	8082                	ret

00000000802007b2 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    802007b2:	1141                	addi	sp,sp,-16
    802007b4:	e422                	sd	s0,8(sp)
    802007b6:	0800                	addi	s0,sp,16
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    802007b8:	ca05                	beqz	a2,802007e8 <memcmp+0x36>
    802007ba:	fff6069b          	addiw	a3,a2,-1 # fff <_entry-0x801ff001>
    802007be:	1682                	slli	a3,a3,0x20
    802007c0:	9281                	srli	a3,a3,0x20
    802007c2:	0685                	addi	a3,a3,1
    802007c4:	96aa                	add	a3,a3,a0
    if(*s1 != *s2)
    802007c6:	00054783          	lbu	a5,0(a0)
    802007ca:	0005c703          	lbu	a4,0(a1)
    802007ce:	00e79863          	bne	a5,a4,802007de <memcmp+0x2c>
      return *s1 - *s2;
    s1++, s2++;
    802007d2:	0505                	addi	a0,a0,1
    802007d4:	0585                	addi	a1,a1,1
  while(n-- > 0){
    802007d6:	fed518e3          	bne	a0,a3,802007c6 <memcmp+0x14>
  }

  return 0;
    802007da:	4501                	li	a0,0
    802007dc:	a019                	j	802007e2 <memcmp+0x30>
      return *s1 - *s2;
    802007de:	40e7853b          	subw	a0,a5,a4
}
    802007e2:	6422                	ld	s0,8(sp)
    802007e4:	0141                	addi	sp,sp,16
    802007e6:	8082                	ret
  return 0;
    802007e8:	4501                	li	a0,0
    802007ea:	bfe5                	j	802007e2 <memcmp+0x30>

00000000802007ec <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    802007ec:	1141                	addi	sp,sp,-16
    802007ee:	e422                	sd	s0,8(sp)
    802007f0:	0800                	addi	s0,sp,16
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
    802007f2:	02a5e563          	bltu	a1,a0,8020081c <memmove+0x30>
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
    802007f6:	fff6069b          	addiw	a3,a2,-1
    802007fa:	ce11                	beqz	a2,80200816 <memmove+0x2a>
    802007fc:	1682                	slli	a3,a3,0x20
    802007fe:	9281                	srli	a3,a3,0x20
    80200800:	0685                	addi	a3,a3,1
    80200802:	96ae                	add	a3,a3,a1
    80200804:	87aa                	mv	a5,a0
      *d++ = *s++;
    80200806:	0585                	addi	a1,a1,1
    80200808:	0785                	addi	a5,a5,1
    8020080a:	fff5c703          	lbu	a4,-1(a1)
    8020080e:	fee78fa3          	sb	a4,-1(a5)
    while(n-- > 0)
    80200812:	fed59ae3          	bne	a1,a3,80200806 <memmove+0x1a>

  return dst;
}
    80200816:	6422                	ld	s0,8(sp)
    80200818:	0141                	addi	sp,sp,16
    8020081a:	8082                	ret
  if(s < d && s + n > d){
    8020081c:	02061713          	slli	a4,a2,0x20
    80200820:	9301                	srli	a4,a4,0x20
    80200822:	00e587b3          	add	a5,a1,a4
    80200826:	fcf578e3          	bgeu	a0,a5,802007f6 <memmove+0xa>
    d += n;
    8020082a:	972a                	add	a4,a4,a0
    while(n-- > 0)
    8020082c:	fff6069b          	addiw	a3,a2,-1
    80200830:	d27d                	beqz	a2,80200816 <memmove+0x2a>
    80200832:	02069613          	slli	a2,a3,0x20
    80200836:	9201                	srli	a2,a2,0x20
    80200838:	fff64613          	not	a2,a2
    8020083c:	963e                	add	a2,a2,a5
      *--d = *--s;
    8020083e:	17fd                	addi	a5,a5,-1
    80200840:	177d                	addi	a4,a4,-1 # ffffffffffffefff <ebss_clear+0xffffffff7fdd8fff>
    80200842:	0007c683          	lbu	a3,0(a5)
    80200846:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    8020084a:	fef61ae3          	bne	a2,a5,8020083e <memmove+0x52>
    8020084e:	b7e1                	j	80200816 <memmove+0x2a>

0000000080200850 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    80200850:	1141                	addi	sp,sp,-16
    80200852:	e406                	sd	ra,8(sp)
    80200854:	e022                	sd	s0,0(sp)
    80200856:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    80200858:	00000097          	auipc	ra,0x0
    8020085c:	f94080e7          	jalr	-108(ra) # 802007ec <memmove>
}
    80200860:	60a2                	ld	ra,8(sp)
    80200862:	6402                	ld	s0,0(sp)
    80200864:	0141                	addi	sp,sp,16
    80200866:	8082                	ret

0000000080200868 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    80200868:	1141                	addi	sp,sp,-16
    8020086a:	e422                	sd	s0,8(sp)
    8020086c:	0800                	addi	s0,sp,16
  while(n > 0 && *p && *p == *q)
    8020086e:	ce11                	beqz	a2,8020088a <strncmp+0x22>
    80200870:	00054783          	lbu	a5,0(a0)
    80200874:	cf89                	beqz	a5,8020088e <strncmp+0x26>
    80200876:	0005c703          	lbu	a4,0(a1)
    8020087a:	00f71a63          	bne	a4,a5,8020088e <strncmp+0x26>
    n--, p++, q++;
    8020087e:	367d                	addiw	a2,a2,-1
    80200880:	0505                	addi	a0,a0,1
    80200882:	0585                	addi	a1,a1,1
  while(n > 0 && *p && *p == *q)
    80200884:	f675                	bnez	a2,80200870 <strncmp+0x8>
  if(n == 0)
    return 0;
    80200886:	4501                	li	a0,0
    80200888:	a809                	j	8020089a <strncmp+0x32>
    8020088a:	4501                	li	a0,0
    8020088c:	a039                	j	8020089a <strncmp+0x32>
  if(n == 0)
    8020088e:	ca09                	beqz	a2,802008a0 <strncmp+0x38>
  return (uchar)*p - (uchar)*q;
    80200890:	00054503          	lbu	a0,0(a0)
    80200894:	0005c783          	lbu	a5,0(a1)
    80200898:	9d1d                	subw	a0,a0,a5
}
    8020089a:	6422                	ld	s0,8(sp)
    8020089c:	0141                	addi	sp,sp,16
    8020089e:	8082                	ret
    return 0;
    802008a0:	4501                	li	a0,0
    802008a2:	bfe5                	j	8020089a <strncmp+0x32>

00000000802008a4 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    802008a4:	1141                	addi	sp,sp,-16
    802008a6:	e422                	sd	s0,8(sp)
    802008a8:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    802008aa:	872a                	mv	a4,a0
    802008ac:	8832                	mv	a6,a2
    802008ae:	367d                	addiw	a2,a2,-1
    802008b0:	01005963          	blez	a6,802008c2 <strncpy+0x1e>
    802008b4:	0705                	addi	a4,a4,1
    802008b6:	0005c783          	lbu	a5,0(a1)
    802008ba:	fef70fa3          	sb	a5,-1(a4)
    802008be:	0585                	addi	a1,a1,1
    802008c0:	f7f5                	bnez	a5,802008ac <strncpy+0x8>
    ;
  while(n-- > 0)
    802008c2:	86ba                	mv	a3,a4
    802008c4:	00c05c63          	blez	a2,802008dc <strncpy+0x38>
    *s++ = 0;
    802008c8:	0685                	addi	a3,a3,1
    802008ca:	fe068fa3          	sb	zero,-1(a3)
  while(n-- > 0)
    802008ce:	40d707bb          	subw	a5,a4,a3
    802008d2:	37fd                	addiw	a5,a5,-1
    802008d4:	010787bb          	addw	a5,a5,a6
    802008d8:	fef048e3          	bgtz	a5,802008c8 <strncpy+0x24>
  return os;
}
    802008dc:	6422                	ld	s0,8(sp)
    802008de:	0141                	addi	sp,sp,16
    802008e0:	8082                	ret

00000000802008e2 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    802008e2:	1141                	addi	sp,sp,-16
    802008e4:	e422                	sd	s0,8(sp)
    802008e6:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  if(n <= 0)
    802008e8:	02c05363          	blez	a2,8020090e <safestrcpy+0x2c>
    802008ec:	fff6069b          	addiw	a3,a2,-1
    802008f0:	1682                	slli	a3,a3,0x20
    802008f2:	9281                	srli	a3,a3,0x20
    802008f4:	96ae                	add	a3,a3,a1
    802008f6:	87aa                	mv	a5,a0
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
    802008f8:	00d58963          	beq	a1,a3,8020090a <safestrcpy+0x28>
    802008fc:	0585                	addi	a1,a1,1
    802008fe:	0785                	addi	a5,a5,1
    80200900:	fff5c703          	lbu	a4,-1(a1)
    80200904:	fee78fa3          	sb	a4,-1(a5)
    80200908:	fb65                	bnez	a4,802008f8 <safestrcpy+0x16>
    ;
  *s = 0;
    8020090a:	00078023          	sb	zero,0(a5)
  return os;
}
    8020090e:	6422                	ld	s0,8(sp)
    80200910:	0141                	addi	sp,sp,16
    80200912:	8082                	ret

0000000080200914 <strlen>:

int
strlen(const char *s)
{
    80200914:	1141                	addi	sp,sp,-16
    80200916:	e422                	sd	s0,8(sp)
    80200918:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    8020091a:	00054783          	lbu	a5,0(a0)
    8020091e:	cf91                	beqz	a5,8020093a <strlen+0x26>
    80200920:	0505                	addi	a0,a0,1
    80200922:	87aa                	mv	a5,a0
    80200924:	4685                	li	a3,1
    80200926:	9e89                	subw	a3,a3,a0
    80200928:	00f6853b          	addw	a0,a3,a5
    8020092c:	0785                	addi	a5,a5,1
    8020092e:	fff7c703          	lbu	a4,-1(a5)
    80200932:	fb7d                	bnez	a4,80200928 <strlen+0x14>
    ;
  return n;
}
    80200934:	6422                	ld	s0,8(sp)
    80200936:	0141                	addi	sp,sp,16
    80200938:	8082                	ret
  for(n = 0; s[n]; n++)
    8020093a:	4501                	li	a0,0
    8020093c:	bfe5                	j	80200934 <strlen+0x20>

000000008020093e <wnstr>:

// convert uchar string into wide char string 
void wnstr(wchar *dst, char const *src, int len) {
    8020093e:	1141                	addi	sp,sp,-16
    80200940:	e422                	sd	s0,8(sp)
    80200942:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    80200944:	c20d                	beqz	a2,80200966 <wnstr+0x28>
    80200946:	02061793          	slli	a5,a2,0x20
    8020094a:	01f7d613          	srli	a2,a5,0x1f
    8020094e:	00c50733          	add	a4,a0,a2
    80200952:	0005c783          	lbu	a5,0(a1)
    80200956:	cb81                	beqz	a5,80200966 <wnstr+0x28>
    *(uchar*)dst = *src++;
    80200958:	0585                	addi	a1,a1,1
    8020095a:	00f50023          	sb	a5,0(a0)
    dst ++;
    8020095e:	0509                	addi	a0,a0,2
  while (len -- && *src) {
    80200960:	fee519e3          	bne	a0,a4,80200952 <wnstr+0x14>
    dst ++;
    80200964:	853a                	mv	a0,a4
  }

  *dst = 0;
    80200966:	00051023          	sh	zero,0(a0)
}
    8020096a:	6422                	ld	s0,8(sp)
    8020096c:	0141                	addi	sp,sp,16
    8020096e:	8082                	ret

0000000080200970 <snstr>:

// convert wide char string into uchar string 
void snstr(char *dst, wchar const *src, int len) {
    80200970:	1141                	addi	sp,sp,-16
    80200972:	e422                	sd	s0,8(sp)
    80200974:	0800                	addi	s0,sp,16
  while (len -- && *src) {
    80200976:	fff6071b          	addiw	a4,a2,-1
    8020097a:	02061693          	slli	a3,a2,0x20
    8020097e:	9281                	srli	a3,a3,0x20
    80200980:	96aa                	add	a3,a3,a0
    80200982:	c61d                	beqz	a2,802009b0 <snstr+0x40>
    80200984:	0005d783          	lhu	a5,0(a1)
    80200988:	cb89                	beqz	a5,8020099a <snstr+0x2a>
    *dst++ = (uchar)(*src & 0xff);
    8020098a:	0505                	addi	a0,a0,1
    8020098c:	fef50fa3          	sb	a5,-1(a0)
    src ++;
    80200990:	0589                	addi	a1,a1,2
  while (len -- && *src) {
    80200992:	377d                	addiw	a4,a4,-1
    80200994:	fed518e3          	bne	a0,a3,80200984 <snstr+0x14>
    *dst++ = (uchar)(*src & 0xff);
    80200998:	8536                	mv	a0,a3
  }
  while(len-- > 0)
    8020099a:	02071793          	slli	a5,a4,0x20
    8020099e:	9381                	srli	a5,a5,0x20
    802009a0:	97aa                	add	a5,a5,a0
    802009a2:	00e05763          	blez	a4,802009b0 <snstr+0x40>
    *dst++ = 0;
    802009a6:	0505                	addi	a0,a0,1
    802009a8:	fe050fa3          	sb	zero,-1(a0)
  while(len-- > 0)
    802009ac:	fea79de3          	bne	a5,a0,802009a6 <snstr+0x36>
}
    802009b0:	6422                	ld	s0,8(sp)
    802009b2:	0141                	addi	sp,sp,16
    802009b4:	8082                	ret

00000000802009b6 <wcsncmp>:

int wcsncmp(wchar const *s1, wchar const *s2, int len) {
    802009b6:	1141                	addi	sp,sp,-16
    802009b8:	e422                	sd	s0,8(sp)
    802009ba:	0800                	addi	s0,sp,16
    802009bc:	872a                	mv	a4,a0
  int ret = 0;

  while (len-- && *s1) {
    802009be:	02061793          	slli	a5,a2,0x20
    802009c2:	01f7d613          	srli	a2,a5,0x1f
    802009c6:	962e                	add	a2,a2,a1
    802009c8:	00c58f63          	beq	a1,a2,802009e6 <wcsncmp+0x30>
    802009cc:	00075783          	lhu	a5,0(a4)
    802009d0:	cb89                	beqz	a5,802009e2 <wcsncmp+0x2c>
    ret = (int)(*s1++ - *s2++);
    802009d2:	0709                	addi	a4,a4,2
    802009d4:	0589                	addi	a1,a1,2
    802009d6:	ffe5d683          	lhu	a3,-2(a1)
    802009da:	40d7853b          	subw	a0,a5,a3
    if (ret) break;
    802009de:	d56d                	beqz	a0,802009c8 <wcsncmp+0x12>
    802009e0:	a021                	j	802009e8 <wcsncmp+0x32>
    802009e2:	4501                	li	a0,0
    802009e4:	a011                	j	802009e8 <wcsncmp+0x32>
    802009e6:	4501                	li	a0,0
  }

  return ret;
}
    802009e8:	6422                	ld	s0,8(sp)
    802009ea:	0141                	addi	sp,sp,16
    802009ec:	8082                	ret

00000000802009ee <strchr>:

char*
strchr(const char *s, char c)
{
    802009ee:	1141                	addi	sp,sp,-16
    802009f0:	e422                	sd	s0,8(sp)
    802009f2:	0800                	addi	s0,sp,16
  for(; *s; s++)
    802009f4:	00054783          	lbu	a5,0(a0)
    802009f8:	cb99                	beqz	a5,80200a0e <strchr+0x20>
    if(*s == c)
    802009fa:	00f58763          	beq	a1,a5,80200a08 <strchr+0x1a>
  for(; *s; s++)
    802009fe:	0505                	addi	a0,a0,1
    80200a00:	00054783          	lbu	a5,0(a0)
    80200a04:	fbfd                	bnez	a5,802009fa <strchr+0xc>
      return (char*)s;
  return 0;
    80200a06:	4501                	li	a0,0
    80200a08:	6422                	ld	s0,8(sp)
    80200a0a:	0141                	addi	sp,sp,16
    80200a0c:	8082                	ret
  return 0;
    80200a0e:	4501                	li	a0,0
    80200a10:	bfe5                	j	80200a08 <strchr+0x1a>

0000000080200a12 <main>:

volatile static int started = 0;

void
main(unsigned long hartid, unsigned long dtb_pa)
{
    80200a12:	1101                	addi	sp,sp,-32
    80200a14:	ec06                	sd	ra,24(sp)
    80200a16:	e822                	sd	s0,16(sp)
    80200a18:	1000                	addi	s0,sp,32
    80200a1a:	85aa                	mv	a1,a0
  asm volatile("mv tp, %0" : : "r" (hartid & 0x1));
    80200a1c:	00157793          	andi	a5,a0,1
    80200a20:	823e                	mv	tp,a5
    started = 1;
  }
  else
  {
    // hart 1
    while (started == 0)
    80200a22:	00013717          	auipc	a4,0x13
    80200a26:	62e70713          	addi	a4,a4,1582 # 80214050 <started>
  if (hartid == 0) {
    80200a2a:	c531                	beqz	a0,80200a76 <main+0x64>
    while (started == 0)
    80200a2c:	431c                	lw	a5,0(a4)
    80200a2e:	2781                	sext.w	a5,a5
    80200a30:	dff5                	beqz	a5,80200a2c <main+0x1a>
      ;
    __sync_synchronize();
    80200a32:	0ff0000f          	fence
    #ifdef DEBUG
    printf("hart %d enter main()...\n", hartid);
    80200a36:	00009517          	auipc	a0,0x9
    80200a3a:	9ca50513          	addi	a0,a0,-1590 # 80209400 <digits+0x80>
    80200a3e:	fffff097          	auipc	ra,0xfffff
    80200a42:	750080e7          	jalr	1872(ra) # 8020018e <printf>
    #endif
    kvminithart();
    80200a46:	00000097          	auipc	ra,0x0
    80200a4a:	0f0080e7          	jalr	240(ra) # 80200b36 <kvminithart>
    trapinithart();
    80200a4e:	00002097          	auipc	ra,0x2
    80200a52:	f7a080e7          	jalr	-134(ra) # 802029c8 <trapinithart>
    plicinithart();  // ask PLIC for device interrupts
    80200a56:	00006097          	auipc	ra,0x6
    80200a5a:	388080e7          	jalr	904(ra) # 80206dde <plicinithart>
    printf("hart 1 init done\n");
    80200a5e:	00009517          	auipc	a0,0x9
    80200a62:	9da50513          	addi	a0,a0,-1574 # 80209438 <digits+0xb8>
    80200a66:	fffff097          	auipc	ra,0xfffff
    80200a6a:	728080e7          	jalr	1832(ra) # 8020018e <printf>
  }
  scheduler();
    80200a6e:	00001097          	auipc	ra,0x1
    80200a72:	5fe080e7          	jalr	1534(ra) # 8020206c <scheduler>
    consoleinit();
    80200a76:	00006097          	auipc	ra,0x6
    80200a7a:	78a080e7          	jalr	1930(ra) # 80207200 <consoleinit>
    printfinit();   // init a lock for printf 
    80200a7e:	00000097          	auipc	ra,0x0
    80200a82:	8f0080e7          	jalr	-1808(ra) # 8020036e <printfinit>
    print_logo();
    80200a86:	00000097          	auipc	ra,0x0
    80200a8a:	91a080e7          	jalr	-1766(ra) # 802003a0 <print_logo>
    printf("hart %d enter main()...\n", hartid);
    80200a8e:	4581                	li	a1,0
    80200a90:	00009517          	auipc	a0,0x9
    80200a94:	97050513          	addi	a0,a0,-1680 # 80209400 <digits+0x80>
    80200a98:	fffff097          	auipc	ra,0xfffff
    80200a9c:	6f6080e7          	jalr	1782(ra) # 8020018e <printf>
    kinit();         // physical page allocator
    80200aa0:	00000097          	auipc	ra,0x0
    80200aa4:	a6e080e7          	jalr	-1426(ra) # 8020050e <kinit>
    kvminit();       // create kernel page table
    80200aa8:	00000097          	auipc	ra,0x0
    80200aac:	2ec080e7          	jalr	748(ra) # 80200d94 <kvminit>
    kvminithart();   // turn on paging
    80200ab0:	00000097          	auipc	ra,0x0
    80200ab4:	086080e7          	jalr	134(ra) # 80200b36 <kvminithart>
    timerinit();     // init a lock for timer
    80200ab8:	00005097          	auipc	ra,0x5
    80200abc:	836080e7          	jalr	-1994(ra) # 802052ee <timerinit>
    trapinithart();  // install kernel trap vector, including interrupt handler
    80200ac0:	00002097          	auipc	ra,0x2
    80200ac4:	f08080e7          	jalr	-248(ra) # 802029c8 <trapinithart>
    procinit();
    80200ac8:	00001097          	auipc	ra,0x1
    80200acc:	f5e080e7          	jalr	-162(ra) # 80201a26 <procinit>
    plicinit();
    80200ad0:	00006097          	auipc	ra,0x6
    80200ad4:	2e2080e7          	jalr	738(ra) # 80206db2 <plicinit>
    plicinithart();
    80200ad8:	00006097          	auipc	ra,0x6
    80200adc:	306080e7          	jalr	774(ra) # 80206dde <plicinithart>
    disk_init();
    80200ae0:	00005097          	auipc	ra,0x5
    80200ae4:	8ba080e7          	jalr	-1862(ra) # 8020539a <disk_init>
    binit();         // buffer cache
    80200ae8:	00003097          	auipc	ra,0x3
    80200aec:	b22080e7          	jalr	-1246(ra) # 8020360a <binit>
    fileinit();      // file table
    80200af0:	00003097          	auipc	ra,0x3
    80200af4:	f36080e7          	jalr	-202(ra) # 80203a26 <fileinit>
    userinit();      // first user process
    80200af8:	00001097          	auipc	ra,0x1
    80200afc:	2ee080e7          	jalr	750(ra) # 80201de6 <userinit>
    printf("hart 0 init done\n");
    80200b00:	00009517          	auipc	a0,0x9
    80200b04:	92050513          	addi	a0,a0,-1760 # 80209420 <digits+0xa0>
    80200b08:	fffff097          	auipc	ra,0xfffff
    80200b0c:	686080e7          	jalr	1670(ra) # 8020018e <printf>
      unsigned long mask = 1 << i;
    80200b10:	4789                	li	a5,2
    80200b12:	fef43423          	sd	a5,-24(s0)
	SBI_CALL_0(SBI_CLEAR_IPI);
}

static inline void sbi_send_ipi(const unsigned long *hart_mask)
{
	SBI_CALL_1(SBI_SEND_IPI, hart_mask);
    80200b16:	fe840513          	addi	a0,s0,-24
    80200b1a:	4581                	li	a1,0
    80200b1c:	4601                	li	a2,0
    80200b1e:	4681                	li	a3,0
    80200b20:	4891                	li	a7,4
    80200b22:	00000073          	ecall
    __sync_synchronize();
    80200b26:	0ff0000f          	fence
    started = 1;
    80200b2a:	4785                	li	a5,1
    80200b2c:	00013717          	auipc	a4,0x13
    80200b30:	52f72223          	sw	a5,1316(a4) # 80214050 <started>
    80200b34:	bf2d                	j	80200a6e <main+0x5c>

0000000080200b36 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80200b36:	1141                	addi	sp,sp,-16
    80200b38:	e406                	sd	ra,8(sp)
    80200b3a:	e022                	sd	s0,0(sp)
    80200b3c:	0800                	addi	s0,sp,16
  w_satp(MAKE_SATP(kernel_pagetable));
    80200b3e:	00013797          	auipc	a5,0x13
    80200b42:	51a7b783          	ld	a5,1306(a5) # 80214058 <kernel_pagetable>
    80200b46:	83b1                	srli	a5,a5,0xc
    80200b48:	577d                	li	a4,-1
    80200b4a:	177e                	slli	a4,a4,0x3f
    80200b4c:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    80200b4e:	18079073          	csrw	satp,a5
static inline void
sfence_vma()
{
  // the zero, zero means flush all TLB entries.
  // asm volatile("sfence.vma zero, zero");
  asm volatile("sfence.vma");
    80200b52:	12000073          	sfence.vma
  // reg_info();
  sfence_vma();
  #ifdef DEBUG
  printf("kvminithart\n");
    80200b56:	00009517          	auipc	a0,0x9
    80200b5a:	8fa50513          	addi	a0,a0,-1798 # 80209450 <digits+0xd0>
    80200b5e:	fffff097          	auipc	ra,0xfffff
    80200b62:	630080e7          	jalr	1584(ra) # 8020018e <printf>
  #endif
}
    80200b66:	60a2                	ld	ra,8(sp)
    80200b68:	6402                	ld	s0,0(sp)
    80200b6a:	0141                	addi	sp,sp,16
    80200b6c:	8082                	ret

0000000080200b6e <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80200b6e:	7139                	addi	sp,sp,-64
    80200b70:	fc06                	sd	ra,56(sp)
    80200b72:	f822                	sd	s0,48(sp)
    80200b74:	f426                	sd	s1,40(sp)
    80200b76:	f04a                	sd	s2,32(sp)
    80200b78:	ec4e                	sd	s3,24(sp)
    80200b7a:	e852                	sd	s4,16(sp)
    80200b7c:	e456                	sd	s5,8(sp)
    80200b7e:	e05a                	sd	s6,0(sp)
    80200b80:	0080                	addi	s0,sp,64
    80200b82:	84aa                	mv	s1,a0
    80200b84:	89ae                	mv	s3,a1
    80200b86:	8ab2                	mv	s5,a2
  
  if(va >= MAXVA)
    80200b88:	57fd                	li	a5,-1
    80200b8a:	83e9                	srli	a5,a5,0x1a
    80200b8c:	4a79                	li	s4,30
    panic("walk");

  for(int level = 2; level > 0; level--) {
    80200b8e:	4b31                	li	s6,12
  if(va >= MAXVA)
    80200b90:	04b7f263          	bgeu	a5,a1,80200bd4 <walk+0x66>
    panic("walk");
    80200b94:	00009517          	auipc	a0,0x9
    80200b98:	8cc50513          	addi	a0,a0,-1844 # 80209460 <digits+0xe0>
    80200b9c:	fffff097          	auipc	ra,0xfffff
    80200ba0:	5a8080e7          	jalr	1448(ra) # 80200144 <panic>
    pte_t *pte = &pagetable[PX(level, va)];
    if(*pte & PTE_V) {
      pagetable = (pagetable_t)PTE2PA(*pte);
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == NULL)
    80200ba4:	060a8663          	beqz	s5,80200c10 <walk+0xa2>
    80200ba8:	00000097          	auipc	ra,0x0
    80200bac:	9e0080e7          	jalr	-1568(ra) # 80200588 <kalloc>
    80200bb0:	84aa                	mv	s1,a0
    80200bb2:	c529                	beqz	a0,80200bfc <walk+0x8e>
        return NULL;
      memset(pagetable, 0, PGSIZE);
    80200bb4:	6605                	lui	a2,0x1
    80200bb6:	4581                	li	a1,0
    80200bb8:	00000097          	auipc	ra,0x0
    80200bbc:	bd8080e7          	jalr	-1064(ra) # 80200790 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80200bc0:	00c4d793          	srli	a5,s1,0xc
    80200bc4:	07aa                	slli	a5,a5,0xa
    80200bc6:	0017e793          	ori	a5,a5,1
    80200bca:	00f93023          	sd	a5,0(s2)
  for(int level = 2; level > 0; level--) {
    80200bce:	3a5d                	addiw	s4,s4,-9 # ffffffffffffeff7 <ebss_clear+0xffffffff7fdd8ff7>
    80200bd0:	036a0063          	beq	s4,s6,80200bf0 <walk+0x82>
    pte_t *pte = &pagetable[PX(level, va)];
    80200bd4:	0149d933          	srl	s2,s3,s4
    80200bd8:	1ff97913          	andi	s2,s2,511
    80200bdc:	090e                	slli	s2,s2,0x3
    80200bde:	9926                	add	s2,s2,s1
    if(*pte & PTE_V) {
    80200be0:	00093483          	ld	s1,0(s2)
    80200be4:	0014f793          	andi	a5,s1,1
    80200be8:	dfd5                	beqz	a5,80200ba4 <walk+0x36>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80200bea:	80a9                	srli	s1,s1,0xa
    80200bec:	04b2                	slli	s1,s1,0xc
    80200bee:	b7c5                	j	80200bce <walk+0x60>
    }
  }
  return &pagetable[PX(0, va)];
    80200bf0:	00c9d513          	srli	a0,s3,0xc
    80200bf4:	1ff57513          	andi	a0,a0,511
    80200bf8:	050e                	slli	a0,a0,0x3
    80200bfa:	9526                	add	a0,a0,s1
}
    80200bfc:	70e2                	ld	ra,56(sp)
    80200bfe:	7442                	ld	s0,48(sp)
    80200c00:	74a2                	ld	s1,40(sp)
    80200c02:	7902                	ld	s2,32(sp)
    80200c04:	69e2                	ld	s3,24(sp)
    80200c06:	6a42                	ld	s4,16(sp)
    80200c08:	6aa2                	ld	s5,8(sp)
    80200c0a:	6b02                	ld	s6,0(sp)
    80200c0c:	6121                	addi	sp,sp,64
    80200c0e:	8082                	ret
        return NULL;
    80200c10:	4501                	li	a0,0
    80200c12:	b7ed                	j	80200bfc <walk+0x8e>

0000000080200c14 <walkaddr>:
walkaddr(pagetable_t pagetable, uint64 va)
{
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80200c14:	57fd                	li	a5,-1
    80200c16:	83e9                	srli	a5,a5,0x1a
    80200c18:	00b7f463          	bgeu	a5,a1,80200c20 <walkaddr+0xc>
    return NULL;
    80200c1c:	4501                	li	a0,0
    return NULL;
  if((*pte & PTE_U) == 0)
    return NULL;
  pa = PTE2PA(*pte);
  return pa;
}
    80200c1e:	8082                	ret
{
    80200c20:	1141                	addi	sp,sp,-16
    80200c22:	e406                	sd	ra,8(sp)
    80200c24:	e022                	sd	s0,0(sp)
    80200c26:	0800                	addi	s0,sp,16
  pte = walk(pagetable, va, 0);
    80200c28:	4601                	li	a2,0
    80200c2a:	00000097          	auipc	ra,0x0
    80200c2e:	f44080e7          	jalr	-188(ra) # 80200b6e <walk>
  if(pte == 0)
    80200c32:	c105                	beqz	a0,80200c52 <walkaddr+0x3e>
  if((*pte & PTE_V) == 0)
    80200c34:	611c                	ld	a5,0(a0)
  if((*pte & PTE_U) == 0)
    80200c36:	0117f693          	andi	a3,a5,17
    80200c3a:	4745                	li	a4,17
    return NULL;
    80200c3c:	4501                	li	a0,0
  if((*pte & PTE_U) == 0)
    80200c3e:	00e68663          	beq	a3,a4,80200c4a <walkaddr+0x36>
}
    80200c42:	60a2                	ld	ra,8(sp)
    80200c44:	6402                	ld	s0,0(sp)
    80200c46:	0141                	addi	sp,sp,16
    80200c48:	8082                	ret
  pa = PTE2PA(*pte);
    80200c4a:	83a9                	srli	a5,a5,0xa
    80200c4c:	00c79513          	slli	a0,a5,0xc
  return pa;
    80200c50:	bfcd                	j	80200c42 <walkaddr+0x2e>
    return NULL;
    80200c52:	4501                	li	a0,0
    80200c54:	b7fd                	j	80200c42 <walkaddr+0x2e>

0000000080200c56 <kwalkaddr>:
  return kwalkaddr(kernel_pagetable, va);
}

uint64
kwalkaddr(pagetable_t kpt, uint64 va)
{
    80200c56:	1101                	addi	sp,sp,-32
    80200c58:	ec06                	sd	ra,24(sp)
    80200c5a:	e822                	sd	s0,16(sp)
    80200c5c:	e426                	sd	s1,8(sp)
    80200c5e:	1000                	addi	s0,sp,32
  uint64 off = va % PGSIZE;
    80200c60:	03459793          	slli	a5,a1,0x34
    80200c64:	0347d493          	srli	s1,a5,0x34
  pte_t *pte;
  uint64 pa;
  
  pte = walk(kpt, va, 0);
    80200c68:	4601                	li	a2,0
    80200c6a:	00000097          	auipc	ra,0x0
    80200c6e:	f04080e7          	jalr	-252(ra) # 80200b6e <walk>
  if(pte == 0)
    80200c72:	cd09                	beqz	a0,80200c8c <kwalkaddr+0x36>
    panic("kvmpa");
  if((*pte & PTE_V) == 0)
    80200c74:	6108                	ld	a0,0(a0)
    80200c76:	00157793          	andi	a5,a0,1
    80200c7a:	c38d                	beqz	a5,80200c9c <kwalkaddr+0x46>
    panic("kvmpa");
  pa = PTE2PA(*pte);
    80200c7c:	8129                	srli	a0,a0,0xa
    80200c7e:	0532                	slli	a0,a0,0xc
  return pa+off;
}
    80200c80:	9526                	add	a0,a0,s1
    80200c82:	60e2                	ld	ra,24(sp)
    80200c84:	6442                	ld	s0,16(sp)
    80200c86:	64a2                	ld	s1,8(sp)
    80200c88:	6105                	addi	sp,sp,32
    80200c8a:	8082                	ret
    panic("kvmpa");
    80200c8c:	00008517          	auipc	a0,0x8
    80200c90:	7dc50513          	addi	a0,a0,2012 # 80209468 <digits+0xe8>
    80200c94:	fffff097          	auipc	ra,0xfffff
    80200c98:	4b0080e7          	jalr	1200(ra) # 80200144 <panic>
    panic("kvmpa");
    80200c9c:	00008517          	auipc	a0,0x8
    80200ca0:	7cc50513          	addi	a0,a0,1996 # 80209468 <digits+0xe8>
    80200ca4:	fffff097          	auipc	ra,0xfffff
    80200ca8:	4a0080e7          	jalr	1184(ra) # 80200144 <panic>

0000000080200cac <kvmpa>:
{
    80200cac:	1141                	addi	sp,sp,-16
    80200cae:	e406                	sd	ra,8(sp)
    80200cb0:	e022                	sd	s0,0(sp)
    80200cb2:	0800                	addi	s0,sp,16
    80200cb4:	85aa                	mv	a1,a0
  return kwalkaddr(kernel_pagetable, va);
    80200cb6:	00013517          	auipc	a0,0x13
    80200cba:	3a253503          	ld	a0,930(a0) # 80214058 <kernel_pagetable>
    80200cbe:	00000097          	auipc	ra,0x0
    80200cc2:	f98080e7          	jalr	-104(ra) # 80200c56 <kwalkaddr>
}
    80200cc6:	60a2                	ld	ra,8(sp)
    80200cc8:	6402                	ld	s0,0(sp)
    80200cca:	0141                	addi	sp,sp,16
    80200ccc:	8082                	ret

0000000080200cce <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80200cce:	715d                	addi	sp,sp,-80
    80200cd0:	e486                	sd	ra,72(sp)
    80200cd2:	e0a2                	sd	s0,64(sp)
    80200cd4:	fc26                	sd	s1,56(sp)
    80200cd6:	f84a                	sd	s2,48(sp)
    80200cd8:	f44e                	sd	s3,40(sp)
    80200cda:	f052                	sd	s4,32(sp)
    80200cdc:	ec56                	sd	s5,24(sp)
    80200cde:	e85a                	sd	s6,16(sp)
    80200ce0:	e45e                	sd	s7,8(sp)
    80200ce2:	0880                	addi	s0,sp,80
    80200ce4:	8aaa                	mv	s5,a0
    80200ce6:	8b3a                	mv	s6,a4
  uint64 a, last;
  pte_t *pte;

  a = PGROUNDDOWN(va);
    80200ce8:	777d                	lui	a4,0xfffff
    80200cea:	00e5f7b3          	and	a5,a1,a4
  last = PGROUNDDOWN(va + size - 1);
    80200cee:	fff60993          	addi	s3,a2,-1 # fff <_entry-0x801ff001>
    80200cf2:	99ae                	add	s3,s3,a1
    80200cf4:	00e9f9b3          	and	s3,s3,a4
  a = PGROUNDDOWN(va);
    80200cf8:	893e                	mv	s2,a5
    80200cfa:	40f68a33          	sub	s4,a3,a5
    if(*pte & PTE_V)
      panic("remap");
    *pte = PA2PTE(pa) | perm | PTE_V;
    if(a == last)
      break;
    a += PGSIZE;
    80200cfe:	6b85                	lui	s7,0x1
    80200d00:	012a04b3          	add	s1,s4,s2
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200d04:	4605                	li	a2,1
    80200d06:	85ca                	mv	a1,s2
    80200d08:	8556                	mv	a0,s5
    80200d0a:	00000097          	auipc	ra,0x0
    80200d0e:	e64080e7          	jalr	-412(ra) # 80200b6e <walk>
    80200d12:	c51d                	beqz	a0,80200d40 <mappages+0x72>
    if(*pte & PTE_V)
    80200d14:	611c                	ld	a5,0(a0)
    80200d16:	8b85                	andi	a5,a5,1
    80200d18:	ef81                	bnez	a5,80200d30 <mappages+0x62>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80200d1a:	80b1                	srli	s1,s1,0xc
    80200d1c:	04aa                	slli	s1,s1,0xa
    80200d1e:	0164e4b3          	or	s1,s1,s6
    80200d22:	0014e493          	ori	s1,s1,1
    80200d26:	e104                	sd	s1,0(a0)
    if(a == last)
    80200d28:	03390863          	beq	s2,s3,80200d58 <mappages+0x8a>
    a += PGSIZE;
    80200d2c:	995e                	add	s2,s2,s7
    if((pte = walk(pagetable, a, 1)) == NULL)
    80200d2e:	bfc9                	j	80200d00 <mappages+0x32>
      panic("remap");
    80200d30:	00008517          	auipc	a0,0x8
    80200d34:	74050513          	addi	a0,a0,1856 # 80209470 <digits+0xf0>
    80200d38:	fffff097          	auipc	ra,0xfffff
    80200d3c:	40c080e7          	jalr	1036(ra) # 80200144 <panic>
      return -1;
    80200d40:	557d                	li	a0,-1
    pa += PGSIZE;
  }
  return 0;
}
    80200d42:	60a6                	ld	ra,72(sp)
    80200d44:	6406                	ld	s0,64(sp)
    80200d46:	74e2                	ld	s1,56(sp)
    80200d48:	7942                	ld	s2,48(sp)
    80200d4a:	79a2                	ld	s3,40(sp)
    80200d4c:	7a02                	ld	s4,32(sp)
    80200d4e:	6ae2                	ld	s5,24(sp)
    80200d50:	6b42                	ld	s6,16(sp)
    80200d52:	6ba2                	ld	s7,8(sp)
    80200d54:	6161                	addi	sp,sp,80
    80200d56:	8082                	ret
  return 0;
    80200d58:	4501                	li	a0,0
    80200d5a:	b7e5                	j	80200d42 <mappages+0x74>

0000000080200d5c <kvmmap>:
{
    80200d5c:	1141                	addi	sp,sp,-16
    80200d5e:	e406                	sd	ra,8(sp)
    80200d60:	e022                	sd	s0,0(sp)
    80200d62:	0800                	addi	s0,sp,16
    80200d64:	8736                	mv	a4,a3
  if(mappages(kernel_pagetable, va, sz, pa, perm) != 0)
    80200d66:	86ae                	mv	a3,a1
    80200d68:	85aa                	mv	a1,a0
    80200d6a:	00013517          	auipc	a0,0x13
    80200d6e:	2ee53503          	ld	a0,750(a0) # 80214058 <kernel_pagetable>
    80200d72:	00000097          	auipc	ra,0x0
    80200d76:	f5c080e7          	jalr	-164(ra) # 80200cce <mappages>
    80200d7a:	e509                	bnez	a0,80200d84 <kvmmap+0x28>
}
    80200d7c:	60a2                	ld	ra,8(sp)
    80200d7e:	6402                	ld	s0,0(sp)
    80200d80:	0141                	addi	sp,sp,16
    80200d82:	8082                	ret
    panic("kvmmap");
    80200d84:	00008517          	auipc	a0,0x8
    80200d88:	6f450513          	addi	a0,a0,1780 # 80209478 <digits+0xf8>
    80200d8c:	fffff097          	auipc	ra,0xfffff
    80200d90:	3b8080e7          	jalr	952(ra) # 80200144 <panic>

0000000080200d94 <kvminit>:
{
    80200d94:	1101                	addi	sp,sp,-32
    80200d96:	ec06                	sd	ra,24(sp)
    80200d98:	e822                	sd	s0,16(sp)
    80200d9a:	e426                	sd	s1,8(sp)
    80200d9c:	1000                	addi	s0,sp,32
  kernel_pagetable = (pagetable_t) kalloc();
    80200d9e:	fffff097          	auipc	ra,0xfffff
    80200da2:	7ea080e7          	jalr	2026(ra) # 80200588 <kalloc>
    80200da6:	00013717          	auipc	a4,0x13
    80200daa:	2aa73923          	sd	a0,690(a4) # 80214058 <kernel_pagetable>
  memset(kernel_pagetable, 0, PGSIZE);
    80200dae:	6605                	lui	a2,0x1
    80200db0:	4581                	li	a1,0
    80200db2:	00000097          	auipc	ra,0x0
    80200db6:	9de080e7          	jalr	-1570(ra) # 80200790 <memset>
  kvmmap(UART_V, UART, PGSIZE, PTE_R | PTE_W);
    80200dba:	4699                	li	a3,6
    80200dbc:	6605                	lui	a2,0x1
    80200dbe:	100005b7          	lui	a1,0x10000
    80200dc2:	3f100513          	li	a0,1009
    80200dc6:	0572                	slli	a0,a0,0x1c
    80200dc8:	00000097          	auipc	ra,0x0
    80200dcc:	f94080e7          	jalr	-108(ra) # 80200d5c <kvmmap>
  kvmmap(VIRTIO0_V, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80200dd0:	4699                	li	a3,6
    80200dd2:	6605                	lui	a2,0x1
    80200dd4:	100015b7          	lui	a1,0x10001
    80200dd8:	03f10537          	lui	a0,0x3f10
    80200ddc:	0505                	addi	a0,a0,1 # 3f10001 <_entry-0x7c2effff>
    80200dde:	0532                	slli	a0,a0,0xc
    80200de0:	00000097          	auipc	ra,0x0
    80200de4:	f7c080e7          	jalr	-132(ra) # 80200d5c <kvmmap>
  kvmmap(CLINT_V, CLINT, 0x10000, PTE_R | PTE_W);
    80200de8:	4699                	li	a3,6
    80200dea:	6641                	lui	a2,0x10
    80200dec:	020005b7          	lui	a1,0x2000
    80200df0:	01f81537          	lui	a0,0x1f81
    80200df4:	0536                	slli	a0,a0,0xd
    80200df6:	00000097          	auipc	ra,0x0
    80200dfa:	f66080e7          	jalr	-154(ra) # 80200d5c <kvmmap>
  kvmmap(PLIC_V, PLIC, 0x4000, PTE_R | PTE_W);
    80200dfe:	4699                	li	a3,6
    80200e00:	6611                	lui	a2,0x4
    80200e02:	0c0005b7          	lui	a1,0xc000
    80200e06:	00fc3537          	lui	a0,0xfc3
    80200e0a:	053a                	slli	a0,a0,0xe
    80200e0c:	00000097          	auipc	ra,0x0
    80200e10:	f50080e7          	jalr	-176(ra) # 80200d5c <kvmmap>
  kvmmap(PLIC_V + 0x200000, PLIC + 0x200000, 0x4000, PTE_R | PTE_W);
    80200e14:	4699                	li	a3,6
    80200e16:	6611                	lui	a2,0x4
    80200e18:	0c2005b7          	lui	a1,0xc200
    80200e1c:	1f861537          	lui	a0,0x1f861
    80200e20:	0526                	slli	a0,a0,0x9
    80200e22:	00000097          	auipc	ra,0x0
    80200e26:	f3a080e7          	jalr	-198(ra) # 80200d5c <kvmmap>
  kvmmap(KERNBASE, KERNBASE, (uint64)etext - KERNBASE, PTE_R | PTE_X);
    80200e2a:	0000b497          	auipc	s1,0xb
    80200e2e:	ba64b483          	ld	s1,-1114(s1) # 8020b9d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80200e32:	46a9                	li	a3,10
    80200e34:	bff00613          	li	a2,-1025
    80200e38:	0656                	slli	a2,a2,0x15
    80200e3a:	9626                	add	a2,a2,s1
    80200e3c:	40100593          	li	a1,1025
    80200e40:	05d6                	slli	a1,a1,0x15
    80200e42:	852e                	mv	a0,a1
    80200e44:	00000097          	auipc	ra,0x0
    80200e48:	f18080e7          	jalr	-232(ra) # 80200d5c <kvmmap>
  kvmmap((uint64)etext, (uint64)etext, PHYSTOP - (uint64)etext, PTE_R | PTE_W);
    80200e4c:	4699                	li	a3,6
    80200e4e:	40300613          	li	a2,1027
    80200e52:	0656                	slli	a2,a2,0x15
    80200e54:	8e05                	sub	a2,a2,s1
    80200e56:	85a6                	mv	a1,s1
    80200e58:	8526                	mv	a0,s1
    80200e5a:	00000097          	auipc	ra,0x0
    80200e5e:	f02080e7          	jalr	-254(ra) # 80200d5c <kvmmap>
  kvmmap(TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80200e62:	46a9                	li	a3,10
    80200e64:	6605                	lui	a2,0x1
    80200e66:	0000b597          	auipc	a1,0xb
    80200e6a:	b525b583          	ld	a1,-1198(a1) # 8020b9b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80200e6e:	04000537          	lui	a0,0x4000
    80200e72:	157d                	addi	a0,a0,-1 # 3ffffff <_entry-0x7c200001>
    80200e74:	0532                	slli	a0,a0,0xc
    80200e76:	00000097          	auipc	ra,0x0
    80200e7a:	ee6080e7          	jalr	-282(ra) # 80200d5c <kvmmap>
  printf("kvminit\n");
    80200e7e:	00008517          	auipc	a0,0x8
    80200e82:	60250513          	addi	a0,a0,1538 # 80209480 <digits+0x100>
    80200e86:	fffff097          	auipc	ra,0xfffff
    80200e8a:	308080e7          	jalr	776(ra) # 8020018e <printf>
}
    80200e8e:	60e2                	ld	ra,24(sp)
    80200e90:	6442                	ld	s0,16(sp)
    80200e92:	64a2                	ld	s1,8(sp)
    80200e94:	6105                	addi	sp,sp,32
    80200e96:	8082                	ret

0000000080200e98 <vmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
vmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80200e98:	715d                	addi	sp,sp,-80
    80200e9a:	e486                	sd	ra,72(sp)
    80200e9c:	e0a2                	sd	s0,64(sp)
    80200e9e:	fc26                	sd	s1,56(sp)
    80200ea0:	f84a                	sd	s2,48(sp)
    80200ea2:	f44e                	sd	s3,40(sp)
    80200ea4:	f052                	sd	s4,32(sp)
    80200ea6:	ec56                	sd	s5,24(sp)
    80200ea8:	e85a                	sd	s6,16(sp)
    80200eaa:	e45e                	sd	s7,8(sp)
    80200eac:	0880                	addi	s0,sp,80
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80200eae:	03459793          	slli	a5,a1,0x34
    80200eb2:	e795                	bnez	a5,80200ede <vmunmap+0x46>
    80200eb4:	8a2a                	mv	s4,a0
    80200eb6:	892e                	mv	s2,a1
    80200eb8:	8ab6                	mv	s5,a3
    panic("vmunmap: not aligned");

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200eba:	0632                	slli	a2,a2,0xc
    80200ebc:	00b609b3          	add	s3,a2,a1
    if((pte = walk(pagetable, a, 0)) == 0)
      panic("vmunmap: walk");
    if((*pte & PTE_V) == 0)
      panic("vmunmap: not mapped");
    if(PTE_FLAGS(*pte) == PTE_V)
    80200ec0:	4b85                	li	s7,1
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200ec2:	6b05                	lui	s6,0x1
    80200ec4:	0735e263          	bltu	a1,s3,80200f28 <vmunmap+0x90>
      uint64 pa = PTE2PA(*pte);
      kfree((void*)pa);
    }
    *pte = 0;
  }
}
    80200ec8:	60a6                	ld	ra,72(sp)
    80200eca:	6406                	ld	s0,64(sp)
    80200ecc:	74e2                	ld	s1,56(sp)
    80200ece:	7942                	ld	s2,48(sp)
    80200ed0:	79a2                	ld	s3,40(sp)
    80200ed2:	7a02                	ld	s4,32(sp)
    80200ed4:	6ae2                	ld	s5,24(sp)
    80200ed6:	6b42                	ld	s6,16(sp)
    80200ed8:	6ba2                	ld	s7,8(sp)
    80200eda:	6161                	addi	sp,sp,80
    80200edc:	8082                	ret
    panic("vmunmap: not aligned");
    80200ede:	00008517          	auipc	a0,0x8
    80200ee2:	5b250513          	addi	a0,a0,1458 # 80209490 <digits+0x110>
    80200ee6:	fffff097          	auipc	ra,0xfffff
    80200eea:	25e080e7          	jalr	606(ra) # 80200144 <panic>
      panic("vmunmap: walk");
    80200eee:	00008517          	auipc	a0,0x8
    80200ef2:	5ba50513          	addi	a0,a0,1466 # 802094a8 <digits+0x128>
    80200ef6:	fffff097          	auipc	ra,0xfffff
    80200efa:	24e080e7          	jalr	590(ra) # 80200144 <panic>
      panic("vmunmap: not mapped");
    80200efe:	00008517          	auipc	a0,0x8
    80200f02:	5ba50513          	addi	a0,a0,1466 # 802094b8 <digits+0x138>
    80200f06:	fffff097          	auipc	ra,0xfffff
    80200f0a:	23e080e7          	jalr	574(ra) # 80200144 <panic>
      panic("vmunmap: not a leaf");
    80200f0e:	00008517          	auipc	a0,0x8
    80200f12:	5c250513          	addi	a0,a0,1474 # 802094d0 <digits+0x150>
    80200f16:	fffff097          	auipc	ra,0xfffff
    80200f1a:	22e080e7          	jalr	558(ra) # 80200144 <panic>
    *pte = 0;
    80200f1e:	0004b023          	sd	zero,0(s1)
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80200f22:	995a                	add	s2,s2,s6
    80200f24:	fb3972e3          	bgeu	s2,s3,80200ec8 <vmunmap+0x30>
    if((pte = walk(pagetable, a, 0)) == 0)
    80200f28:	4601                	li	a2,0
    80200f2a:	85ca                	mv	a1,s2
    80200f2c:	8552                	mv	a0,s4
    80200f2e:	00000097          	auipc	ra,0x0
    80200f32:	c40080e7          	jalr	-960(ra) # 80200b6e <walk>
    80200f36:	84aa                	mv	s1,a0
    80200f38:	d95d                	beqz	a0,80200eee <vmunmap+0x56>
    if((*pte & PTE_V) == 0)
    80200f3a:	6108                	ld	a0,0(a0)
    80200f3c:	00157793          	andi	a5,a0,1
    80200f40:	dfdd                	beqz	a5,80200efe <vmunmap+0x66>
    if(PTE_FLAGS(*pte) == PTE_V)
    80200f42:	3ff57793          	andi	a5,a0,1023
    80200f46:	fd7784e3          	beq	a5,s7,80200f0e <vmunmap+0x76>
    if(do_free){
    80200f4a:	fc0a8ae3          	beqz	s5,80200f1e <vmunmap+0x86>
      uint64 pa = PTE2PA(*pte);
    80200f4e:	8129                	srli	a0,a0,0xa
      kfree((void*)pa);
    80200f50:	0532                	slli	a0,a0,0xc
    80200f52:	fffff097          	auipc	ra,0xfffff
    80200f56:	4ee080e7          	jalr	1262(ra) # 80200440 <kfree>
    80200f5a:	b7d1                	j	80200f1e <vmunmap+0x86>

0000000080200f5c <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80200f5c:	1101                	addi	sp,sp,-32
    80200f5e:	ec06                	sd	ra,24(sp)
    80200f60:	e822                	sd	s0,16(sp)
    80200f62:	e426                	sd	s1,8(sp)
    80200f64:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80200f66:	fffff097          	auipc	ra,0xfffff
    80200f6a:	622080e7          	jalr	1570(ra) # 80200588 <kalloc>
    80200f6e:	84aa                	mv	s1,a0
  if(pagetable == NULL)
    80200f70:	c519                	beqz	a0,80200f7e <uvmcreate+0x22>
    return NULL;
  memset(pagetable, 0, PGSIZE);
    80200f72:	6605                	lui	a2,0x1
    80200f74:	4581                	li	a1,0
    80200f76:	00000097          	auipc	ra,0x0
    80200f7a:	81a080e7          	jalr	-2022(ra) # 80200790 <memset>
  return pagetable;
}
    80200f7e:	8526                	mv	a0,s1
    80200f80:	60e2                	ld	ra,24(sp)
    80200f82:	6442                	ld	s0,16(sp)
    80200f84:	64a2                	ld	s1,8(sp)
    80200f86:	6105                	addi	sp,sp,32
    80200f88:	8082                	ret

0000000080200f8a <uvminit>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvminit(pagetable_t pagetable, pagetable_t kpagetable, uchar *src, uint sz)
{
    80200f8a:	7139                	addi	sp,sp,-64
    80200f8c:	fc06                	sd	ra,56(sp)
    80200f8e:	f822                	sd	s0,48(sp)
    80200f90:	f426                	sd	s1,40(sp)
    80200f92:	f04a                	sd	s2,32(sp)
    80200f94:	ec4e                	sd	s3,24(sp)
    80200f96:	e852                	sd	s4,16(sp)
    80200f98:	e456                	sd	s5,8(sp)
    80200f9a:	0080                	addi	s0,sp,64
  char *mem;

  if(sz >= PGSIZE)
    80200f9c:	6785                	lui	a5,0x1
    80200f9e:	06f6fe63          	bgeu	a3,a5,8020101a <uvminit+0x90>
    80200fa2:	89aa                	mv	s3,a0
    80200fa4:	8aae                	mv	s5,a1
    80200fa6:	8a32                	mv	s4,a2
    80200fa8:	8936                	mv	s2,a3
    panic("inituvm: more than a page");
  mem = kalloc();
    80200faa:	fffff097          	auipc	ra,0xfffff
    80200fae:	5de080e7          	jalr	1502(ra) # 80200588 <kalloc>
    80200fb2:	84aa                	mv	s1,a0
  memset(mem, 0, PGSIZE);
    80200fb4:	6605                	lui	a2,0x1
    80200fb6:	4581                	li	a1,0
    80200fb8:	fffff097          	auipc	ra,0xfffff
    80200fbc:	7d8080e7          	jalr	2008(ra) # 80200790 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80200fc0:	4779                	li	a4,30
    80200fc2:	86a6                	mv	a3,s1
    80200fc4:	6605                	lui	a2,0x1
    80200fc6:	4581                	li	a1,0
    80200fc8:	854e                	mv	a0,s3
    80200fca:	00000097          	auipc	ra,0x0
    80200fce:	d04080e7          	jalr	-764(ra) # 80200cce <mappages>
  mappages(pagetable, 0x100000, PGSIZE, 0x100000, PTE_W|PTE_R|PTE_U);  // mark!
    80200fd2:	4759                	li	a4,22
    80200fd4:	001006b7          	lui	a3,0x100
    80200fd8:	6605                	lui	a2,0x1
    80200fda:	001005b7          	lui	a1,0x100
    80200fde:	854e                	mv	a0,s3
    80200fe0:	00000097          	auipc	ra,0x0
    80200fe4:	cee080e7          	jalr	-786(ra) # 80200cce <mappages>
  mappages(kpagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X);
    80200fe8:	4739                	li	a4,14
    80200fea:	86a6                	mv	a3,s1
    80200fec:	6605                	lui	a2,0x1
    80200fee:	4581                	li	a1,0
    80200ff0:	8556                	mv	a0,s5
    80200ff2:	00000097          	auipc	ra,0x0
    80200ff6:	cdc080e7          	jalr	-804(ra) # 80200cce <mappages>
  memmove(mem, src, sz);
    80200ffa:	864a                	mv	a2,s2
    80200ffc:	85d2                	mv	a1,s4
    80200ffe:	8526                	mv	a0,s1
    80201000:	fffff097          	auipc	ra,0xfffff
    80201004:	7ec080e7          	jalr	2028(ra) # 802007ec <memmove>
}
    80201008:	70e2                	ld	ra,56(sp)
    8020100a:	7442                	ld	s0,48(sp)
    8020100c:	74a2                	ld	s1,40(sp)
    8020100e:	7902                	ld	s2,32(sp)
    80201010:	69e2                	ld	s3,24(sp)
    80201012:	6a42                	ld	s4,16(sp)
    80201014:	6aa2                	ld	s5,8(sp)
    80201016:	6121                	addi	sp,sp,64
    80201018:	8082                	ret
    panic("inituvm: more than a page");
    8020101a:	00008517          	auipc	a0,0x8
    8020101e:	4ce50513          	addi	a0,a0,1230 # 802094e8 <digits+0x168>
    80201022:	fffff097          	auipc	ra,0xfffff
    80201026:	122080e7          	jalr	290(ra) # 80200144 <panic>

000000008020102a <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, pagetable_t kpagetable, uint64 oldsz, uint64 newsz)
{
    8020102a:	7179                	addi	sp,sp,-48
    8020102c:	f406                	sd	ra,40(sp)
    8020102e:	f022                	sd	s0,32(sp)
    80201030:	ec26                	sd	s1,24(sp)
    80201032:	e84a                	sd	s2,16(sp)
    80201034:	e44e                	sd	s3,8(sp)
    80201036:	e052                	sd	s4,0(sp)
    80201038:	1800                	addi	s0,sp,48
  if(newsz >= oldsz)
    return oldsz;
    8020103a:	8932                	mv	s2,a2
  if(newsz >= oldsz)
    8020103c:	02c6f063          	bgeu	a3,a2,8020105c <uvmdealloc+0x32>
    80201040:	89aa                	mv	s3,a0
    80201042:	852e                	mv	a0,a1
    80201044:	8936                	mv	s2,a3

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80201046:	6785                	lui	a5,0x1
    80201048:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    8020104a:	00f68a33          	add	s4,a3,a5
    8020104e:	777d                	lui	a4,0xfffff
    80201050:	00ea7a33          	and	s4,s4,a4
    80201054:	963e                	add	a2,a2,a5
    80201056:	8e79                	and	a2,a2,a4
    80201058:	00ca6b63          	bltu	s4,a2,8020106e <uvmdealloc+0x44>
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
  }

  return newsz;
}
    8020105c:	854a                	mv	a0,s2
    8020105e:	70a2                	ld	ra,40(sp)
    80201060:	7402                	ld	s0,32(sp)
    80201062:	64e2                	ld	s1,24(sp)
    80201064:	6942                	ld	s2,16(sp)
    80201066:	69a2                	ld	s3,8(sp)
    80201068:	6a02                	ld	s4,0(sp)
    8020106a:	6145                	addi	sp,sp,48
    8020106c:	8082                	ret
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    8020106e:	414604b3          	sub	s1,a2,s4
    80201072:	80b1                	srli	s1,s1,0xc
    vmunmap(kpagetable, PGROUNDUP(newsz), npages, 0);
    80201074:	2481                	sext.w	s1,s1
    80201076:	4681                	li	a3,0
    80201078:	8626                	mv	a2,s1
    8020107a:	85d2                	mv	a1,s4
    8020107c:	00000097          	auipc	ra,0x0
    80201080:	e1c080e7          	jalr	-484(ra) # 80200e98 <vmunmap>
    vmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80201084:	4685                	li	a3,1
    80201086:	8626                	mv	a2,s1
    80201088:	85d2                	mv	a1,s4
    8020108a:	854e                	mv	a0,s3
    8020108c:	00000097          	auipc	ra,0x0
    80201090:	e0c080e7          	jalr	-500(ra) # 80200e98 <vmunmap>
    80201094:	b7e1                	j	8020105c <uvmdealloc+0x32>

0000000080201096 <uvmalloc>:
  if(newsz < oldsz)
    80201096:	0ec6e763          	bltu	a3,a2,80201184 <uvmalloc+0xee>
{
    8020109a:	7139                	addi	sp,sp,-64
    8020109c:	fc06                	sd	ra,56(sp)
    8020109e:	f822                	sd	s0,48(sp)
    802010a0:	f426                	sd	s1,40(sp)
    802010a2:	f04a                	sd	s2,32(sp)
    802010a4:	ec4e                	sd	s3,24(sp)
    802010a6:	e852                	sd	s4,16(sp)
    802010a8:	e456                	sd	s5,8(sp)
    802010aa:	e05a                	sd	s6,0(sp)
    802010ac:	0080                	addi	s0,sp,64
    802010ae:	8a2a                	mv	s4,a0
    802010b0:	8aae                	mv	s5,a1
    802010b2:	8b36                	mv	s6,a3
  oldsz = PGROUNDUP(oldsz);
    802010b4:	6785                	lui	a5,0x1
    802010b6:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    802010b8:	963e                	add	a2,a2,a5
    802010ba:	77fd                	lui	a5,0xfffff
    802010bc:	00f679b3          	and	s3,a2,a5
  for(a = oldsz; a < newsz; a += PGSIZE){
    802010c0:	0cd9f463          	bgeu	s3,a3,80201188 <uvmalloc+0xf2>
    802010c4:	894e                	mv	s2,s3
    mem = kalloc();
    802010c6:	fffff097          	auipc	ra,0xfffff
    802010ca:	4c2080e7          	jalr	1218(ra) # 80200588 <kalloc>
    802010ce:	84aa                	mv	s1,a0
    if(mem == NULL){
    802010d0:	c129                	beqz	a0,80201112 <uvmalloc+0x7c>
    memset(mem, 0, PGSIZE);
    802010d2:	6605                	lui	a2,0x1
    802010d4:	4581                	li	a1,0
    802010d6:	fffff097          	auipc	ra,0xfffff
    802010da:	6ba080e7          	jalr	1722(ra) # 80200790 <memset>
    if (mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R|PTE_U) != 0) {
    802010de:	4779                	li	a4,30
    802010e0:	86a6                	mv	a3,s1
    802010e2:	6605                	lui	a2,0x1
    802010e4:	85ca                	mv	a1,s2
    802010e6:	8552                	mv	a0,s4
    802010e8:	00000097          	auipc	ra,0x0
    802010ec:	be6080e7          	jalr	-1050(ra) # 80200cce <mappages>
    802010f0:	e521                	bnez	a0,80201138 <uvmalloc+0xa2>
    if (mappages(kpagetable, a, PGSIZE, (uint64)mem, PTE_W|PTE_X|PTE_R) != 0){
    802010f2:	4739                	li	a4,14
    802010f4:	86a6                	mv	a3,s1
    802010f6:	6605                	lui	a2,0x1
    802010f8:	85ca                	mv	a1,s2
    802010fa:	8556                	mv	a0,s5
    802010fc:	00000097          	auipc	ra,0x0
    80201100:	bd2080e7          	jalr	-1070(ra) # 80200cce <mappages>
    80201104:	e929                	bnez	a0,80201156 <uvmalloc+0xc0>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80201106:	6785                	lui	a5,0x1
    80201108:	993e                	add	s2,s2,a5
    8020110a:	fb696ee3          	bltu	s2,s6,802010c6 <uvmalloc+0x30>
  return newsz;
    8020110e:	855a                	mv	a0,s6
    80201110:	a811                	j	80201124 <uvmalloc+0x8e>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    80201112:	86ce                	mv	a3,s3
    80201114:	864a                	mv	a2,s2
    80201116:	85d6                	mv	a1,s5
    80201118:	8552                	mv	a0,s4
    8020111a:	00000097          	auipc	ra,0x0
    8020111e:	f10080e7          	jalr	-240(ra) # 8020102a <uvmdealloc>
      return 0;
    80201122:	4501                	li	a0,0
}
    80201124:	70e2                	ld	ra,56(sp)
    80201126:	7442                	ld	s0,48(sp)
    80201128:	74a2                	ld	s1,40(sp)
    8020112a:	7902                	ld	s2,32(sp)
    8020112c:	69e2                	ld	s3,24(sp)
    8020112e:	6a42                	ld	s4,16(sp)
    80201130:	6aa2                	ld	s5,8(sp)
    80201132:	6b02                	ld	s6,0(sp)
    80201134:	6121                	addi	sp,sp,64
    80201136:	8082                	ret
      kfree(mem);
    80201138:	8526                	mv	a0,s1
    8020113a:	fffff097          	auipc	ra,0xfffff
    8020113e:	306080e7          	jalr	774(ra) # 80200440 <kfree>
      uvmdealloc(pagetable, kpagetable, a, oldsz);
    80201142:	86ce                	mv	a3,s3
    80201144:	864a                	mv	a2,s2
    80201146:	85d6                	mv	a1,s5
    80201148:	8552                	mv	a0,s4
    8020114a:	00000097          	auipc	ra,0x0
    8020114e:	ee0080e7          	jalr	-288(ra) # 8020102a <uvmdealloc>
      return 0;
    80201152:	4501                	li	a0,0
    80201154:	bfc1                	j	80201124 <uvmalloc+0x8e>
      int npages = (a - oldsz) / PGSIZE;
    80201156:	41390633          	sub	a2,s2,s3
    8020115a:	8231                	srli	a2,a2,0xc
    8020115c:	0006049b          	sext.w	s1,a2
      vmunmap(pagetable, oldsz, npages + 1, 1);   // plus the page allocated above.
    80201160:	4685                	li	a3,1
    80201162:	2605                	addiw	a2,a2,1 # 1001 <_entry-0x801fefff>
    80201164:	85ce                	mv	a1,s3
    80201166:	8552                	mv	a0,s4
    80201168:	00000097          	auipc	ra,0x0
    8020116c:	d30080e7          	jalr	-720(ra) # 80200e98 <vmunmap>
      vmunmap(kpagetable, oldsz, npages, 0);
    80201170:	4681                	li	a3,0
    80201172:	8626                	mv	a2,s1
    80201174:	85ce                	mv	a1,s3
    80201176:	8556                	mv	a0,s5
    80201178:	00000097          	auipc	ra,0x0
    8020117c:	d20080e7          	jalr	-736(ra) # 80200e98 <vmunmap>
      return 0;
    80201180:	4501                	li	a0,0
    80201182:	b74d                	j	80201124 <uvmalloc+0x8e>
    return oldsz;
    80201184:	8532                	mv	a0,a2
}
    80201186:	8082                	ret
  return newsz;
    80201188:	8536                	mv	a0,a3
    8020118a:	bf69                	j	80201124 <uvmalloc+0x8e>

000000008020118c <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8020118c:	7179                	addi	sp,sp,-48
    8020118e:	f406                	sd	ra,40(sp)
    80201190:	f022                	sd	s0,32(sp)
    80201192:	ec26                	sd	s1,24(sp)
    80201194:	e84a                	sd	s2,16(sp)
    80201196:	e44e                	sd	s3,8(sp)
    80201198:	e052                	sd	s4,0(sp)
    8020119a:	1800                	addi	s0,sp,48
    8020119c:	8a2a                	mv	s4,a0
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    8020119e:	84aa                	mv	s1,a0
    802011a0:	6905                	lui	s2,0x1
    802011a2:	992a                	add	s2,s2,a0
    pte_t pte = pagetable[i];
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    802011a4:	4985                	li	s3,1
    802011a6:	a829                	j	802011c0 <freewalk+0x34>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    802011a8:	83a9                	srli	a5,a5,0xa
      freewalk((pagetable_t)child);
    802011aa:	00c79513          	slli	a0,a5,0xc
    802011ae:	00000097          	auipc	ra,0x0
    802011b2:	fde080e7          	jalr	-34(ra) # 8020118c <freewalk>
      pagetable[i] = 0;
    802011b6:	0004b023          	sd	zero,0(s1)
  for(int i = 0; i < 512; i++){
    802011ba:	04a1                	addi	s1,s1,8
    802011bc:	03248163          	beq	s1,s2,802011de <freewalk+0x52>
    pte_t pte = pagetable[i];
    802011c0:	609c                	ld	a5,0(s1)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    802011c2:	00f7f713          	andi	a4,a5,15
    802011c6:	ff3701e3          	beq	a4,s3,802011a8 <freewalk+0x1c>
    } else if(pte & PTE_V){
    802011ca:	8b85                	andi	a5,a5,1
    802011cc:	d7fd                	beqz	a5,802011ba <freewalk+0x2e>
      panic("freewalk: leaf");
    802011ce:	00008517          	auipc	a0,0x8
    802011d2:	33a50513          	addi	a0,a0,826 # 80209508 <digits+0x188>
    802011d6:	fffff097          	auipc	ra,0xfffff
    802011da:	f6e080e7          	jalr	-146(ra) # 80200144 <panic>
    }
  }
  kfree((void*)pagetable);
    802011de:	8552                	mv	a0,s4
    802011e0:	fffff097          	auipc	ra,0xfffff
    802011e4:	260080e7          	jalr	608(ra) # 80200440 <kfree>
}
    802011e8:	70a2                	ld	ra,40(sp)
    802011ea:	7402                	ld	s0,32(sp)
    802011ec:	64e2                	ld	s1,24(sp)
    802011ee:	6942                	ld	s2,16(sp)
    802011f0:	69a2                	ld	s3,8(sp)
    802011f2:	6a02                	ld	s4,0(sp)
    802011f4:	6145                	addi	sp,sp,48
    802011f6:	8082                	ret

00000000802011f8 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    802011f8:	1101                	addi	sp,sp,-32
    802011fa:	ec06                	sd	ra,24(sp)
    802011fc:	e822                	sd	s0,16(sp)
    802011fe:	e426                	sd	s1,8(sp)
    80201200:	1000                	addi	s0,sp,32
    80201202:	84aa                	mv	s1,a0
  if(sz > 0)
    80201204:	e999                	bnez	a1,8020121a <uvmfree+0x22>
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
  freewalk(pagetable);
    80201206:	8526                	mv	a0,s1
    80201208:	00000097          	auipc	ra,0x0
    8020120c:	f84080e7          	jalr	-124(ra) # 8020118c <freewalk>
}
    80201210:	60e2                	ld	ra,24(sp)
    80201212:	6442                	ld	s0,16(sp)
    80201214:	64a2                	ld	s1,8(sp)
    80201216:	6105                	addi	sp,sp,32
    80201218:	8082                	ret
    vmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    8020121a:	6785                	lui	a5,0x1
    8020121c:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    8020121e:	95be                	add	a1,a1,a5
    80201220:	4685                	li	a3,1
    80201222:	00c5d613          	srli	a2,a1,0xc
    80201226:	4581                	li	a1,0
    80201228:	00000097          	auipc	ra,0x0
    8020122c:	c70080e7          	jalr	-912(ra) # 80200e98 <vmunmap>
    80201230:	bfd9                	j	80201206 <uvmfree+0xe>

0000000080201232 <uvmcopy>:
  pte_t *pte;
  uint64 pa, i = 0, ki = 0;
  uint flags;
  char *mem;

  while (i < sz){
    80201232:	10068563          	beqz	a3,8020133c <uvmcopy+0x10a>
{
    80201236:	715d                	addi	sp,sp,-80
    80201238:	e486                	sd	ra,72(sp)
    8020123a:	e0a2                	sd	s0,64(sp)
    8020123c:	fc26                	sd	s1,56(sp)
    8020123e:	f84a                	sd	s2,48(sp)
    80201240:	f44e                	sd	s3,40(sp)
    80201242:	f052                	sd	s4,32(sp)
    80201244:	ec56                	sd	s5,24(sp)
    80201246:	e85a                	sd	s6,16(sp)
    80201248:	e45e                	sd	s7,8(sp)
    8020124a:	e062                	sd	s8,0(sp)
    8020124c:	0880                	addi	s0,sp,80
    8020124e:	8baa                	mv	s7,a0
    80201250:	8a2e                	mv	s4,a1
    80201252:	8b32                	mv	s6,a2
    80201254:	8ab6                	mv	s5,a3
  uint64 pa, i = 0, ki = 0;
    80201256:	4981                	li	s3,0
    80201258:	a011                	j	8020125c <uvmcopy+0x2a>
    memmove(mem, (char*)pa, PGSIZE);
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
      kfree(mem);
      goto err;
    }
    i += PGSIZE;
    8020125a:	89e2                	mv	s3,s8
    if((pte = walk(old, i, 0)) == NULL)
    8020125c:	4601                	li	a2,0
    8020125e:	85ce                	mv	a1,s3
    80201260:	855e                	mv	a0,s7
    80201262:	00000097          	auipc	ra,0x0
    80201266:	90c080e7          	jalr	-1780(ra) # 80200b6e <walk>
    8020126a:	c135                	beqz	a0,802012ce <uvmcopy+0x9c>
    if((*pte & PTE_V) == 0)
    8020126c:	6118                	ld	a4,0(a0)
    8020126e:	00177793          	andi	a5,a4,1
    80201272:	c7b5                	beqz	a5,802012de <uvmcopy+0xac>
    pa = PTE2PA(*pte);
    80201274:	00a75593          	srli	a1,a4,0xa
    80201278:	00c59c13          	slli	s8,a1,0xc
    flags = PTE_FLAGS(*pte);
    8020127c:	3ff77493          	andi	s1,a4,1023
    if((mem = kalloc()) == NULL)
    80201280:	fffff097          	auipc	ra,0xfffff
    80201284:	308080e7          	jalr	776(ra) # 80200588 <kalloc>
    80201288:	892a                	mv	s2,a0
    8020128a:	c92d                	beqz	a0,802012fc <uvmcopy+0xca>
    memmove(mem, (char*)pa, PGSIZE);
    8020128c:	6605                	lui	a2,0x1
    8020128e:	85e2                	mv	a1,s8
    80201290:	fffff097          	auipc	ra,0xfffff
    80201294:	55c080e7          	jalr	1372(ra) # 802007ec <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0) {
    80201298:	2481                	sext.w	s1,s1
    8020129a:	8726                	mv	a4,s1
    8020129c:	86ca                	mv	a3,s2
    8020129e:	6605                	lui	a2,0x1
    802012a0:	85ce                	mv	a1,s3
    802012a2:	8552                	mv	a0,s4
    802012a4:	00000097          	auipc	ra,0x0
    802012a8:	a2a080e7          	jalr	-1494(ra) # 80200cce <mappages>
    802012ac:	e129                	bnez	a0,802012ee <uvmcopy+0xbc>
    i += PGSIZE;
    802012ae:	6c05                	lui	s8,0x1
    802012b0:	9c4e                	add	s8,s8,s3
    if(mappages(knew, ki, PGSIZE, (uint64)mem, flags & ~PTE_U) != 0){
    802012b2:	3ef4f713          	andi	a4,s1,1007
    802012b6:	86ca                	mv	a3,s2
    802012b8:	6605                	lui	a2,0x1
    802012ba:	85ce                	mv	a1,s3
    802012bc:	855a                	mv	a0,s6
    802012be:	00000097          	auipc	ra,0x0
    802012c2:	a10080e7          	jalr	-1520(ra) # 80200cce <mappages>
    802012c6:	ed05                	bnez	a0,802012fe <uvmcopy+0xcc>
  while (i < sz){
    802012c8:	f95c69e3          	bltu	s8,s5,8020125a <uvmcopy+0x28>
    802012cc:	a8a1                	j	80201324 <uvmcopy+0xf2>
      panic("uvmcopy: pte should exist");
    802012ce:	00008517          	auipc	a0,0x8
    802012d2:	24a50513          	addi	a0,a0,586 # 80209518 <digits+0x198>
    802012d6:	fffff097          	auipc	ra,0xfffff
    802012da:	e6e080e7          	jalr	-402(ra) # 80200144 <panic>
      panic("uvmcopy: page not present");
    802012de:	00008517          	auipc	a0,0x8
    802012e2:	25a50513          	addi	a0,a0,602 # 80209538 <digits+0x1b8>
    802012e6:	fffff097          	auipc	ra,0xfffff
    802012ea:	e5e080e7          	jalr	-418(ra) # 80200144 <panic>
      kfree(mem);
    802012ee:	854a                	mv	a0,s2
    802012f0:	fffff097          	auipc	ra,0xfffff
    802012f4:	150080e7          	jalr	336(ra) # 80200440 <kfree>
      goto err;
    802012f8:	8c4e                	mv	s8,s3
    802012fa:	a011                	j	802012fe <uvmcopy+0xcc>
    802012fc:	8c4e                	mv	s8,s3
    ki += PGSIZE;
  }
  return 0;

 err:
  vmunmap(knew, 0, ki / PGSIZE, 0);
    802012fe:	4681                	li	a3,0
    80201300:	00c9d613          	srli	a2,s3,0xc
    80201304:	4581                	li	a1,0
    80201306:	855a                	mv	a0,s6
    80201308:	00000097          	auipc	ra,0x0
    8020130c:	b90080e7          	jalr	-1136(ra) # 80200e98 <vmunmap>
  vmunmap(new, 0, i / PGSIZE, 1);
    80201310:	4685                	li	a3,1
    80201312:	00cc5613          	srli	a2,s8,0xc
    80201316:	4581                	li	a1,0
    80201318:	8552                	mv	a0,s4
    8020131a:	00000097          	auipc	ra,0x0
    8020131e:	b7e080e7          	jalr	-1154(ra) # 80200e98 <vmunmap>
  return -1;
    80201322:	557d                	li	a0,-1
}
    80201324:	60a6                	ld	ra,72(sp)
    80201326:	6406                	ld	s0,64(sp)
    80201328:	74e2                	ld	s1,56(sp)
    8020132a:	7942                	ld	s2,48(sp)
    8020132c:	79a2                	ld	s3,40(sp)
    8020132e:	7a02                	ld	s4,32(sp)
    80201330:	6ae2                	ld	s5,24(sp)
    80201332:	6b42                	ld	s6,16(sp)
    80201334:	6ba2                	ld	s7,8(sp)
    80201336:	6c02                	ld	s8,0(sp)
    80201338:	6161                	addi	sp,sp,80
    8020133a:	8082                	ret
  return 0;
    8020133c:	4501                	li	a0,0
}
    8020133e:	8082                	ret

0000000080201340 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80201340:	1141                	addi	sp,sp,-16
    80201342:	e406                	sd	ra,8(sp)
    80201344:	e022                	sd	s0,0(sp)
    80201346:	0800                	addi	s0,sp,16
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    80201348:	4601                	li	a2,0
    8020134a:	00000097          	auipc	ra,0x0
    8020134e:	824080e7          	jalr	-2012(ra) # 80200b6e <walk>
  if(pte == NULL)
    80201352:	c901                	beqz	a0,80201362 <uvmclear+0x22>
    panic("uvmclear");
  *pte &= ~PTE_U;
    80201354:	611c                	ld	a5,0(a0)
    80201356:	9bbd                	andi	a5,a5,-17
    80201358:	e11c                	sd	a5,0(a0)
}
    8020135a:	60a2                	ld	ra,8(sp)
    8020135c:	6402                	ld	s0,0(sp)
    8020135e:	0141                	addi	sp,sp,16
    80201360:	8082                	ret
    panic("uvmclear");
    80201362:	00008517          	auipc	a0,0x8
    80201366:	1f650513          	addi	a0,a0,502 # 80209558 <digits+0x1d8>
    8020136a:	fffff097          	auipc	ra,0xfffff
    8020136e:	dda080e7          	jalr	-550(ra) # 80200144 <panic>

0000000080201372 <copyout>:
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80201372:	c6bd                	beqz	a3,802013e0 <copyout+0x6e>
{
    80201374:	715d                	addi	sp,sp,-80
    80201376:	e486                	sd	ra,72(sp)
    80201378:	e0a2                	sd	s0,64(sp)
    8020137a:	fc26                	sd	s1,56(sp)
    8020137c:	f84a                	sd	s2,48(sp)
    8020137e:	f44e                	sd	s3,40(sp)
    80201380:	f052                	sd	s4,32(sp)
    80201382:	ec56                	sd	s5,24(sp)
    80201384:	e85a                	sd	s6,16(sp)
    80201386:	e45e                	sd	s7,8(sp)
    80201388:	e062                	sd	s8,0(sp)
    8020138a:	0880                	addi	s0,sp,80
    8020138c:	8b2a                	mv	s6,a0
    8020138e:	8c2e                	mv	s8,a1
    80201390:	8a32                	mv	s4,a2
    80201392:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(dstva);
    80201394:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (dstva - va0);
    80201396:	6a85                	lui	s5,0x1
    80201398:	a015                	j	802013bc <copyout+0x4a>
    if(n > len)
      n = len;
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    8020139a:	9562                	add	a0,a0,s8
    8020139c:	0004861b          	sext.w	a2,s1
    802013a0:	85d2                	mv	a1,s4
    802013a2:	41250533          	sub	a0,a0,s2
    802013a6:	fffff097          	auipc	ra,0xfffff
    802013aa:	446080e7          	jalr	1094(ra) # 802007ec <memmove>

    len -= n;
    802013ae:	409989b3          	sub	s3,s3,s1
    src += n;
    802013b2:	9a26                	add	s4,s4,s1
    dstva = va0 + PGSIZE;
    802013b4:	01590c33          	add	s8,s2,s5
  while(len > 0){
    802013b8:	02098263          	beqz	s3,802013dc <copyout+0x6a>
    va0 = PGROUNDDOWN(dstva);
    802013bc:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    802013c0:	85ca                	mv	a1,s2
    802013c2:	855a                	mv	a0,s6
    802013c4:	00000097          	auipc	ra,0x0
    802013c8:	850080e7          	jalr	-1968(ra) # 80200c14 <walkaddr>
    if(pa0 == NULL)
    802013cc:	cd01                	beqz	a0,802013e4 <copyout+0x72>
    n = PGSIZE - (dstva - va0);
    802013ce:	418904b3          	sub	s1,s2,s8
    802013d2:	94d6                	add	s1,s1,s5
    802013d4:	fc99f3e3          	bgeu	s3,s1,8020139a <copyout+0x28>
    802013d8:	84ce                	mv	s1,s3
    802013da:	b7c1                	j	8020139a <copyout+0x28>
  }
  return 0;
    802013dc:	4501                	li	a0,0
    802013de:	a021                	j	802013e6 <copyout+0x74>
    802013e0:	4501                	li	a0,0
}
    802013e2:	8082                	ret
      return -1;
    802013e4:	557d                	li	a0,-1
}
    802013e6:	60a6                	ld	ra,72(sp)
    802013e8:	6406                	ld	s0,64(sp)
    802013ea:	74e2                	ld	s1,56(sp)
    802013ec:	7942                	ld	s2,48(sp)
    802013ee:	79a2                	ld	s3,40(sp)
    802013f0:	7a02                	ld	s4,32(sp)
    802013f2:	6ae2                	ld	s5,24(sp)
    802013f4:	6b42                	ld	s6,16(sp)
    802013f6:	6ba2                	ld	s7,8(sp)
    802013f8:	6c02                	ld	s8,0(sp)
    802013fa:	6161                	addi	sp,sp,80
    802013fc:	8082                	ret

00000000802013fe <copyout2>:

int
copyout2(uint64 dstva, char *src, uint64 len)
{
    802013fe:	7179                	addi	sp,sp,-48
    80201400:	f406                	sd	ra,40(sp)
    80201402:	f022                	sd	s0,32(sp)
    80201404:	ec26                	sd	s1,24(sp)
    80201406:	e84a                	sd	s2,16(sp)
    80201408:	e44e                	sd	s3,8(sp)
    8020140a:	1800                	addi	s0,sp,48
    8020140c:	84aa                	mv	s1,a0
    8020140e:	89ae                	mv	s3,a1
    80201410:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    80201412:	00000097          	auipc	ra,0x0
    80201416:	6c6080e7          	jalr	1734(ra) # 80201ad8 <myproc>
    8020141a:	653c                	ld	a5,72(a0)
  if (dstva + len > sz || dstva >= sz) {
    8020141c:	01248733          	add	a4,s1,s2
    80201420:	02e7e463          	bltu	a5,a4,80201448 <copyout2+0x4a>
    80201424:	02f4f463          	bgeu	s1,a5,8020144c <copyout2+0x4e>
    return -1;
  }
  memmove((void *)dstva, src, len);
    80201428:	0009061b          	sext.w	a2,s2
    8020142c:	85ce                	mv	a1,s3
    8020142e:	8526                	mv	a0,s1
    80201430:	fffff097          	auipc	ra,0xfffff
    80201434:	3bc080e7          	jalr	956(ra) # 802007ec <memmove>
  return 0;
    80201438:	4501                	li	a0,0
}
    8020143a:	70a2                	ld	ra,40(sp)
    8020143c:	7402                	ld	s0,32(sp)
    8020143e:	64e2                	ld	s1,24(sp)
    80201440:	6942                	ld	s2,16(sp)
    80201442:	69a2                	ld	s3,8(sp)
    80201444:	6145                	addi	sp,sp,48
    80201446:	8082                	ret
    return -1;
    80201448:	557d                	li	a0,-1
    8020144a:	bfc5                	j	8020143a <copyout2+0x3c>
    8020144c:	557d                	li	a0,-1
    8020144e:	b7f5                	j	8020143a <copyout2+0x3c>

0000000080201450 <copyin>:
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
  uint64 n, va0, pa0;

  while(len > 0){
    80201450:	caa5                	beqz	a3,802014c0 <copyin+0x70>
{
    80201452:	715d                	addi	sp,sp,-80
    80201454:	e486                	sd	ra,72(sp)
    80201456:	e0a2                	sd	s0,64(sp)
    80201458:	fc26                	sd	s1,56(sp)
    8020145a:	f84a                	sd	s2,48(sp)
    8020145c:	f44e                	sd	s3,40(sp)
    8020145e:	f052                	sd	s4,32(sp)
    80201460:	ec56                	sd	s5,24(sp)
    80201462:	e85a                	sd	s6,16(sp)
    80201464:	e45e                	sd	s7,8(sp)
    80201466:	e062                	sd	s8,0(sp)
    80201468:	0880                	addi	s0,sp,80
    8020146a:	8b2a                	mv	s6,a0
    8020146c:	8a2e                	mv	s4,a1
    8020146e:	8c32                	mv	s8,a2
    80201470:	89b6                	mv	s3,a3
    va0 = PGROUNDDOWN(srcva);
    80201472:	7bfd                	lui	s7,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    80201474:	6a85                	lui	s5,0x1
    80201476:	a01d                	j	8020149c <copyin+0x4c>
    if(n > len)
      n = len;
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80201478:	018505b3          	add	a1,a0,s8
    8020147c:	0004861b          	sext.w	a2,s1
    80201480:	412585b3          	sub	a1,a1,s2
    80201484:	8552                	mv	a0,s4
    80201486:	fffff097          	auipc	ra,0xfffff
    8020148a:	366080e7          	jalr	870(ra) # 802007ec <memmove>

    len -= n;
    8020148e:	409989b3          	sub	s3,s3,s1
    dst += n;
    80201492:	9a26                	add	s4,s4,s1
    srcva = va0 + PGSIZE;
    80201494:	01590c33          	add	s8,s2,s5
  while(len > 0){
    80201498:	02098263          	beqz	s3,802014bc <copyin+0x6c>
    va0 = PGROUNDDOWN(srcva);
    8020149c:	017c7933          	and	s2,s8,s7
    pa0 = walkaddr(pagetable, va0);
    802014a0:	85ca                	mv	a1,s2
    802014a2:	855a                	mv	a0,s6
    802014a4:	fffff097          	auipc	ra,0xfffff
    802014a8:	770080e7          	jalr	1904(ra) # 80200c14 <walkaddr>
    if(pa0 == NULL)
    802014ac:	cd01                	beqz	a0,802014c4 <copyin+0x74>
    n = PGSIZE - (srcva - va0);
    802014ae:	418904b3          	sub	s1,s2,s8
    802014b2:	94d6                	add	s1,s1,s5
    802014b4:	fc99f2e3          	bgeu	s3,s1,80201478 <copyin+0x28>
    802014b8:	84ce                	mv	s1,s3
    802014ba:	bf7d                	j	80201478 <copyin+0x28>
  }
  return 0;
    802014bc:	4501                	li	a0,0
    802014be:	a021                	j	802014c6 <copyin+0x76>
    802014c0:	4501                	li	a0,0
}
    802014c2:	8082                	ret
      return -1;
    802014c4:	557d                	li	a0,-1
}
    802014c6:	60a6                	ld	ra,72(sp)
    802014c8:	6406                	ld	s0,64(sp)
    802014ca:	74e2                	ld	s1,56(sp)
    802014cc:	7942                	ld	s2,48(sp)
    802014ce:	79a2                	ld	s3,40(sp)
    802014d0:	7a02                	ld	s4,32(sp)
    802014d2:	6ae2                	ld	s5,24(sp)
    802014d4:	6b42                	ld	s6,16(sp)
    802014d6:	6ba2                	ld	s7,8(sp)
    802014d8:	6c02                	ld	s8,0(sp)
    802014da:	6161                	addi	sp,sp,80
    802014dc:	8082                	ret

00000000802014de <copyin2>:

int
copyin2(char *dst, uint64 srcva, uint64 len)
{
    802014de:	7179                	addi	sp,sp,-48
    802014e0:	f406                	sd	ra,40(sp)
    802014e2:	f022                	sd	s0,32(sp)
    802014e4:	ec26                	sd	s1,24(sp)
    802014e6:	e84a                	sd	s2,16(sp)
    802014e8:	e44e                	sd	s3,8(sp)
    802014ea:	1800                	addi	s0,sp,48
    802014ec:	89aa                	mv	s3,a0
    802014ee:	84ae                	mv	s1,a1
    802014f0:	8932                	mv	s2,a2
  uint64 sz = myproc()->sz;
    802014f2:	00000097          	auipc	ra,0x0
    802014f6:	5e6080e7          	jalr	1510(ra) # 80201ad8 <myproc>
    802014fa:	653c                	ld	a5,72(a0)
  if (srcva + len > sz || srcva >= sz) {
    802014fc:	01248733          	add	a4,s1,s2
    80201500:	02e7e463          	bltu	a5,a4,80201528 <copyin2+0x4a>
    80201504:	02f4f463          	bgeu	s1,a5,8020152c <copyin2+0x4e>
    return -1;
  }
  memmove(dst, (void *)srcva, len);
    80201508:	0009061b          	sext.w	a2,s2
    8020150c:	85a6                	mv	a1,s1
    8020150e:	854e                	mv	a0,s3
    80201510:	fffff097          	auipc	ra,0xfffff
    80201514:	2dc080e7          	jalr	732(ra) # 802007ec <memmove>
  return 0;
    80201518:	4501                	li	a0,0
}
    8020151a:	70a2                	ld	ra,40(sp)
    8020151c:	7402                	ld	s0,32(sp)
    8020151e:	64e2                	ld	s1,24(sp)
    80201520:	6942                	ld	s2,16(sp)
    80201522:	69a2                	ld	s3,8(sp)
    80201524:	6145                	addi	sp,sp,48
    80201526:	8082                	ret
    return -1;
    80201528:	557d                	li	a0,-1
    8020152a:	bfc5                	j	8020151a <copyin2+0x3c>
    8020152c:	557d                	li	a0,-1
    8020152e:	b7f5                	j	8020151a <copyin2+0x3c>

0000000080201530 <copyinstr>:
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
  uint64 n, va0, pa0;
  int got_null = 0;

  while(got_null == 0 && max > 0){
    80201530:	c2dd                	beqz	a3,802015d6 <copyinstr+0xa6>
{
    80201532:	715d                	addi	sp,sp,-80
    80201534:	e486                	sd	ra,72(sp)
    80201536:	e0a2                	sd	s0,64(sp)
    80201538:	fc26                	sd	s1,56(sp)
    8020153a:	f84a                	sd	s2,48(sp)
    8020153c:	f44e                	sd	s3,40(sp)
    8020153e:	f052                	sd	s4,32(sp)
    80201540:	ec56                	sd	s5,24(sp)
    80201542:	e85a                	sd	s6,16(sp)
    80201544:	e45e                	sd	s7,8(sp)
    80201546:	0880                	addi	s0,sp,80
    80201548:	8a2a                	mv	s4,a0
    8020154a:	8b2e                	mv	s6,a1
    8020154c:	8bb2                	mv	s7,a2
    8020154e:	84b6                	mv	s1,a3
    va0 = PGROUNDDOWN(srcva);
    80201550:	7afd                	lui	s5,0xfffff
    pa0 = walkaddr(pagetable, va0);
    if(pa0 == NULL)
      return -1;
    n = PGSIZE - (srcva - va0);
    80201552:	6985                	lui	s3,0x1
    80201554:	a02d                	j	8020157e <copyinstr+0x4e>
      n = max;

    char *p = (char *) (pa0 + (srcva - va0));
    while(n > 0){
      if(*p == '\0'){
        *dst = '\0';
    80201556:	00078023          	sb	zero,0(a5)
    8020155a:	4785                	li	a5,1
      dst++;
    }

    srcva = va0 + PGSIZE;
  }
  if(got_null){
    8020155c:	37fd                	addiw	a5,a5,-1
    8020155e:	0007851b          	sext.w	a0,a5
    return 0;
  } else {
    return -1;
  }
}
    80201562:	60a6                	ld	ra,72(sp)
    80201564:	6406                	ld	s0,64(sp)
    80201566:	74e2                	ld	s1,56(sp)
    80201568:	7942                	ld	s2,48(sp)
    8020156a:	79a2                	ld	s3,40(sp)
    8020156c:	7a02                	ld	s4,32(sp)
    8020156e:	6ae2                	ld	s5,24(sp)
    80201570:	6b42                	ld	s6,16(sp)
    80201572:	6ba2                	ld	s7,8(sp)
    80201574:	6161                	addi	sp,sp,80
    80201576:	8082                	ret
    srcva = va0 + PGSIZE;
    80201578:	01390bb3          	add	s7,s2,s3
  while(got_null == 0 && max > 0){
    8020157c:	c8a9                	beqz	s1,802015ce <copyinstr+0x9e>
    va0 = PGROUNDDOWN(srcva);
    8020157e:	015bf933          	and	s2,s7,s5
    pa0 = walkaddr(pagetable, va0);
    80201582:	85ca                	mv	a1,s2
    80201584:	8552                	mv	a0,s4
    80201586:	fffff097          	auipc	ra,0xfffff
    8020158a:	68e080e7          	jalr	1678(ra) # 80200c14 <walkaddr>
    if(pa0 == NULL)
    8020158e:	c131                	beqz	a0,802015d2 <copyinstr+0xa2>
    n = PGSIZE - (srcva - va0);
    80201590:	417906b3          	sub	a3,s2,s7
    80201594:	96ce                	add	a3,a3,s3
    80201596:	00d4f363          	bgeu	s1,a3,8020159c <copyinstr+0x6c>
    8020159a:	86a6                	mv	a3,s1
    char *p = (char *) (pa0 + (srcva - va0));
    8020159c:	955e                	add	a0,a0,s7
    8020159e:	41250533          	sub	a0,a0,s2
    while(n > 0){
    802015a2:	daf9                	beqz	a3,80201578 <copyinstr+0x48>
    802015a4:	87da                	mv	a5,s6
      if(*p == '\0'){
    802015a6:	41650633          	sub	a2,a0,s6
    802015aa:	fff48593          	addi	a1,s1,-1
    802015ae:	95da                	add	a1,a1,s6
    while(n > 0){
    802015b0:	96da                	add	a3,a3,s6
      if(*p == '\0'){
    802015b2:	00f60733          	add	a4,a2,a5
    802015b6:	00074703          	lbu	a4,0(a4) # fffffffffffff000 <ebss_clear+0xffffffff7fdd9000>
    802015ba:	df51                	beqz	a4,80201556 <copyinstr+0x26>
        *dst = *p;
    802015bc:	00e78023          	sb	a4,0(a5)
      --max;
    802015c0:	40f584b3          	sub	s1,a1,a5
      dst++;
    802015c4:	0785                	addi	a5,a5,1
    while(n > 0){
    802015c6:	fed796e3          	bne	a5,a3,802015b2 <copyinstr+0x82>
      dst++;
    802015ca:	8b3e                	mv	s6,a5
    802015cc:	b775                	j	80201578 <copyinstr+0x48>
    802015ce:	4781                	li	a5,0
    802015d0:	b771                	j	8020155c <copyinstr+0x2c>
      return -1;
    802015d2:	557d                	li	a0,-1
    802015d4:	b779                	j	80201562 <copyinstr+0x32>
  int got_null = 0;
    802015d6:	4781                	li	a5,0
  if(got_null){
    802015d8:	37fd                	addiw	a5,a5,-1
    802015da:	0007851b          	sext.w	a0,a5
}
    802015de:	8082                	ret

00000000802015e0 <copyinstr2>:

int
copyinstr2(char *dst, uint64 srcva, uint64 max)
{
    802015e0:	7179                	addi	sp,sp,-48
    802015e2:	f406                	sd	ra,40(sp)
    802015e4:	f022                	sd	s0,32(sp)
    802015e6:	ec26                	sd	s1,24(sp)
    802015e8:	e84a                	sd	s2,16(sp)
    802015ea:	e44e                	sd	s3,8(sp)
    802015ec:	1800                	addi	s0,sp,48
    802015ee:	89aa                	mv	s3,a0
    802015f0:	84ae                	mv	s1,a1
    802015f2:	8932                	mv	s2,a2
  int got_null = 0;
  uint64 sz = myproc()->sz;
    802015f4:	00000097          	auipc	ra,0x0
    802015f8:	4e4080e7          	jalr	1252(ra) # 80201ad8 <myproc>
    802015fc:	6534                	ld	a3,72(a0)
  while(srcva < sz && max > 0){
    802015fe:	04d4f363          	bgeu	s1,a3,80201644 <copyinstr2+0x64>
    80201602:	04090363          	beqz	s2,80201648 <copyinstr2+0x68>
    80201606:	01298633          	add	a2,s3,s2
    8020160a:	8e85                	sub	a3,a3,s1
    8020160c:	96ce                	add	a3,a3,s3
    8020160e:	87ce                	mv	a5,s3
    char *p = (char *)srcva;
    if(*p == '\0'){
    80201610:	413485b3          	sub	a1,s1,s3
    80201614:	00b78733          	add	a4,a5,a1
    80201618:	00074703          	lbu	a4,0(a4)
    8020161c:	cb11                	beqz	a4,80201630 <copyinstr2+0x50>
      *dst = '\0';
      got_null = 1;
      break;
    } else {
      *dst = *p;
    8020161e:	00e78023          	sb	a4,0(a5)
    }
    --max;
    srcva++;
    dst++;
    80201622:	0785                	addi	a5,a5,1
  while(srcva < sz && max > 0){
    80201624:	02d78463          	beq	a5,a3,8020164c <copyinstr2+0x6c>
    80201628:	fec796e3          	bne	a5,a2,80201614 <copyinstr2+0x34>
  }
  if(got_null){
    return 0;
  } else {
    return -1;
    8020162c:	557d                	li	a0,-1
    8020162e:	a021                	j	80201636 <copyinstr2+0x56>
      *dst = '\0';
    80201630:	00078023          	sb	zero,0(a5)
    return 0;
    80201634:	4501                	li	a0,0
  }
}
    80201636:	70a2                	ld	ra,40(sp)
    80201638:	7402                	ld	s0,32(sp)
    8020163a:	64e2                	ld	s1,24(sp)
    8020163c:	6942                	ld	s2,16(sp)
    8020163e:	69a2                	ld	s3,8(sp)
    80201640:	6145                	addi	sp,sp,48
    80201642:	8082                	ret
    return -1;
    80201644:	557d                	li	a0,-1
    80201646:	bfc5                	j	80201636 <copyinstr2+0x56>
    80201648:	557d                	li	a0,-1
    8020164a:	b7f5                	j	80201636 <copyinstr2+0x56>
    8020164c:	557d                	li	a0,-1
    8020164e:	b7e5                	j	80201636 <copyinstr2+0x56>

0000000080201650 <kfreewalk>:
}

// only free page table, not physical pages
void
kfreewalk(pagetable_t kpt)
{
    80201650:	7179                	addi	sp,sp,-48
    80201652:	f406                	sd	ra,40(sp)
    80201654:	f022                	sd	s0,32(sp)
    80201656:	ec26                	sd	s1,24(sp)
    80201658:	e84a                	sd	s2,16(sp)
    8020165a:	e44e                	sd	s3,8(sp)
    8020165c:	e052                	sd	s4,0(sp)
    8020165e:	1800                	addi	s0,sp,48
    80201660:	8a2a                	mv	s4,a0
  for (int i = 0; i < 512; i++) {
    80201662:	84aa                	mv	s1,a0
    80201664:	6905                	lui	s2,0x1
    80201666:	992a                	add	s2,s2,a0
    pte_t pte = kpt[i];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201668:	4985                	li	s3,1
    8020166a:	a829                	j	80201684 <kfreewalk+0x34>
      kfreewalk((pagetable_t) PTE2PA(pte));
    8020166c:	83a9                	srli	a5,a5,0xa
    8020166e:	00c79513          	slli	a0,a5,0xc
    80201672:	00000097          	auipc	ra,0x0
    80201676:	fde080e7          	jalr	-34(ra) # 80201650 <kfreewalk>
      kpt[i] = 0;
    8020167a:	0004b023          	sd	zero,0(s1)
  for (int i = 0; i < 512; i++) {
    8020167e:	04a1                	addi	s1,s1,8
    80201680:	01248963          	beq	s1,s2,80201692 <kfreewalk+0x42>
    pte_t pte = kpt[i];
    80201684:	609c                	ld	a5,0(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201686:	00f7f713          	andi	a4,a5,15
    8020168a:	ff3701e3          	beq	a4,s3,8020166c <kfreewalk+0x1c>
    } else if (pte & PTE_V) {
    8020168e:	8b85                	andi	a5,a5,1
    80201690:	d7fd                	beqz	a5,8020167e <kfreewalk+0x2e>
      break;
    }
  }
  kfree((void *) kpt);
    80201692:	8552                	mv	a0,s4
    80201694:	fffff097          	auipc	ra,0xfffff
    80201698:	dac080e7          	jalr	-596(ra) # 80200440 <kfree>
}
    8020169c:	70a2                	ld	ra,40(sp)
    8020169e:	7402                	ld	s0,32(sp)
    802016a0:	64e2                	ld	s1,24(sp)
    802016a2:	6942                	ld	s2,16(sp)
    802016a4:	69a2                	ld	s3,8(sp)
    802016a6:	6a02                	ld	s4,0(sp)
    802016a8:	6145                	addi	sp,sp,48
    802016aa:	8082                	ret

00000000802016ac <kvmfreeusr>:

void
kvmfreeusr(pagetable_t kpt)
{
    802016ac:	1101                	addi	sp,sp,-32
    802016ae:	ec06                	sd	ra,24(sp)
    802016b0:	e822                	sd	s0,16(sp)
    802016b2:	e426                	sd	s1,8(sp)
    802016b4:	1000                	addi	s0,sp,32
    802016b6:	84aa                	mv	s1,a0
  pte_t pte;
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    pte = kpt[i];
    802016b8:	6108                	ld	a0,0(a0)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016ba:	00f57713          	andi	a4,a0,15
    802016be:	4785                	li	a5,1
    802016c0:	00f70d63          	beq	a4,a5,802016da <kvmfreeusr+0x2e>
    pte = kpt[i];
    802016c4:	6488                	ld	a0,8(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    802016c6:	00f57713          	andi	a4,a0,15
    802016ca:	4785                	li	a5,1
    802016cc:	02f70063          	beq	a4,a5,802016ec <kvmfreeusr+0x40>
      kfreewalk((pagetable_t) PTE2PA(pte));
      kpt[i] = 0;
    }
  }
}
    802016d0:	60e2                	ld	ra,24(sp)
    802016d2:	6442                	ld	s0,16(sp)
    802016d4:	64a2                	ld	s1,8(sp)
    802016d6:	6105                	addi	sp,sp,32
    802016d8:	8082                	ret
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016da:	8129                	srli	a0,a0,0xa
    802016dc:	0532                	slli	a0,a0,0xc
    802016de:	00000097          	auipc	ra,0x0
    802016e2:	f72080e7          	jalr	-142(ra) # 80201650 <kfreewalk>
      kpt[i] = 0;
    802016e6:	0004b023          	sd	zero,0(s1)
    802016ea:	bfe9                	j	802016c4 <kvmfreeusr+0x18>
      kfreewalk((pagetable_t) PTE2PA(pte));
    802016ec:	8129                	srli	a0,a0,0xa
    802016ee:	0532                	slli	a0,a0,0xc
    802016f0:	00000097          	auipc	ra,0x0
    802016f4:	f60080e7          	jalr	-160(ra) # 80201650 <kfreewalk>
      kpt[i] = 0;
    802016f8:	0004b423          	sd	zero,8(s1)
}
    802016fc:	bfd1                	j	802016d0 <kvmfreeusr+0x24>

00000000802016fe <kvmfree>:

void
kvmfree(pagetable_t kpt, int stack_free)
{
    802016fe:	1101                	addi	sp,sp,-32
    80201700:	ec06                	sd	ra,24(sp)
    80201702:	e822                	sd	s0,16(sp)
    80201704:	e426                	sd	s1,8(sp)
    80201706:	1000                	addi	s0,sp,32
    80201708:	84aa                	mv	s1,a0
  if (stack_free) {
    8020170a:	e185                	bnez	a1,8020172a <kvmfree+0x2c>
    pte_t pte = kpt[PX(2, VKSTACK)];
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
      kfreewalk((pagetable_t) PTE2PA(pte));
    }
  }
  kvmfreeusr(kpt);
    8020170c:	8526                	mv	a0,s1
    8020170e:	00000097          	auipc	ra,0x0
    80201712:	f9e080e7          	jalr	-98(ra) # 802016ac <kvmfreeusr>
  kfree(kpt);
    80201716:	8526                	mv	a0,s1
    80201718:	fffff097          	auipc	ra,0xfffff
    8020171c:	d28080e7          	jalr	-728(ra) # 80200440 <kfree>
}
    80201720:	60e2                	ld	ra,24(sp)
    80201722:	6442                	ld	s0,16(sp)
    80201724:	64a2                	ld	s1,8(sp)
    80201726:	6105                	addi	sp,sp,32
    80201728:	8082                	ret
    vmunmap(kpt, VKSTACK, 1, 1);
    8020172a:	4685                	li	a3,1
    8020172c:	4605                	li	a2,1
    8020172e:	0fb00593          	li	a1,251
    80201732:	05fa                	slli	a1,a1,0x1e
    80201734:	fffff097          	auipc	ra,0xfffff
    80201738:	764080e7          	jalr	1892(ra) # 80200e98 <vmunmap>
    pte_t pte = kpt[PX(2, VKSTACK)];
    8020173c:	7d84b503          	ld	a0,2008(s1)
    if ((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0) {
    80201740:	00f57713          	andi	a4,a0,15
    80201744:	4785                	li	a5,1
    80201746:	fcf713e3          	bne	a4,a5,8020170c <kvmfree+0xe>
      kfreewalk((pagetable_t) PTE2PA(pte));
    8020174a:	8129                	srli	a0,a0,0xa
    8020174c:	0532                	slli	a0,a0,0xc
    8020174e:	00000097          	auipc	ra,0x0
    80201752:	f02080e7          	jalr	-254(ra) # 80201650 <kfreewalk>
    80201756:	bf5d                	j	8020170c <kvmfree+0xe>

0000000080201758 <proc_kpagetable>:
{
    80201758:	1101                	addi	sp,sp,-32
    8020175a:	ec06                	sd	ra,24(sp)
    8020175c:	e822                	sd	s0,16(sp)
    8020175e:	e426                	sd	s1,8(sp)
    80201760:	1000                	addi	s0,sp,32
  pagetable_t kpt = (pagetable_t) kalloc();
    80201762:	fffff097          	auipc	ra,0xfffff
    80201766:	e26080e7          	jalr	-474(ra) # 80200588 <kalloc>
    8020176a:	84aa                	mv	s1,a0
  if (kpt == NULL)
    8020176c:	c91d                	beqz	a0,802017a2 <proc_kpagetable+0x4a>
  memmove(kpt, kernel_pagetable, PGSIZE);
    8020176e:	6605                	lui	a2,0x1
    80201770:	00013597          	auipc	a1,0x13
    80201774:	8e85b583          	ld	a1,-1816(a1) # 80214058 <kernel_pagetable>
    80201778:	fffff097          	auipc	ra,0xfffff
    8020177c:	074080e7          	jalr	116(ra) # 802007ec <memmove>
  char *pstack = kalloc();
    80201780:	fffff097          	auipc	ra,0xfffff
    80201784:	e08080e7          	jalr	-504(ra) # 80200588 <kalloc>
    80201788:	86aa                	mv	a3,a0
  if(pstack == NULL)
    8020178a:	c115                	beqz	a0,802017ae <proc_kpagetable+0x56>
  if (mappages(kpt, VKSTACK, PGSIZE, (uint64)pstack, PTE_R | PTE_W) != 0)
    8020178c:	4719                	li	a4,6
    8020178e:	6605                	lui	a2,0x1
    80201790:	0fb00593          	li	a1,251
    80201794:	05fa                	slli	a1,a1,0x1e
    80201796:	8526                	mv	a0,s1
    80201798:	fffff097          	auipc	ra,0xfffff
    8020179c:	536080e7          	jalr	1334(ra) # 80200cce <mappages>
    802017a0:	e519                	bnez	a0,802017ae <proc_kpagetable+0x56>
}
    802017a2:	8526                	mv	a0,s1
    802017a4:	60e2                	ld	ra,24(sp)
    802017a6:	6442                	ld	s0,16(sp)
    802017a8:	64a2                	ld	s1,8(sp)
    802017aa:	6105                	addi	sp,sp,32
    802017ac:	8082                	ret
  kvmfree(kpt, 1);
    802017ae:	4585                	li	a1,1
    802017b0:	8526                	mv	a0,s1
    802017b2:	00000097          	auipc	ra,0x0
    802017b6:	f4c080e7          	jalr	-180(ra) # 802016fe <kvmfree>
  return NULL;
    802017ba:	4481                	li	s1,0
    802017bc:	b7dd                	j	802017a2 <proc_kpagetable+0x4a>

00000000802017be <vmprint>:

void vmprint(pagetable_t pagetable)
{
    802017be:	7119                	addi	sp,sp,-128
    802017c0:	fc86                	sd	ra,120(sp)
    802017c2:	f8a2                	sd	s0,112(sp)
    802017c4:	f4a6                	sd	s1,104(sp)
    802017c6:	f0ca                	sd	s2,96(sp)
    802017c8:	ecce                	sd	s3,88(sp)
    802017ca:	e8d2                	sd	s4,80(sp)
    802017cc:	e4d6                	sd	s5,72(sp)
    802017ce:	e0da                	sd	s6,64(sp)
    802017d0:	fc5e                	sd	s7,56(sp)
    802017d2:	f862                	sd	s8,48(sp)
    802017d4:	f466                	sd	s9,40(sp)
    802017d6:	f06a                	sd	s10,32(sp)
    802017d8:	ec6e                	sd	s11,24(sp)
    802017da:	0100                	addi	s0,sp,128
    802017dc:	8baa                	mv	s7,a0
    802017de:	f8a43423          	sd	a0,-120(s0)
  const int capacity = 512;
  printf("page table %p\n", pagetable);
    802017e2:	85aa                	mv	a1,a0
    802017e4:	00008517          	auipc	a0,0x8
    802017e8:	d8450513          	addi	a0,a0,-636 # 80209568 <digits+0x1e8>
    802017ec:	fffff097          	auipc	ra,0xfffff
    802017f0:	9a2080e7          	jalr	-1630(ra) # 8020018e <printf>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    802017f4:	6d85                	lui	s11,0x1
    802017f6:	9dde                	add	s11,s11,s7
    802017f8:	6c85                	lui	s9,0x1

      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
        if (*pte2 & PTE_V)
        {
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    802017fa:	00008d17          	auipc	s10,0x8
    802017fe:	d96d0d13          	addi	s10,s10,-618 # 80209590 <digits+0x210>

          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
            if (*pte3 & PTE_V)
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    80201802:	00008a17          	auipc	s4,0x8
    80201806:	da6a0a13          	addi	s4,s4,-602 # 802095a8 <digits+0x228>
    8020180a:	a885                	j	8020187a <vmprint+0xbc>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    8020180c:	04a1                	addi	s1,s1,8
    8020180e:	197d                	addi	s2,s2,-1 # fff <_entry-0x801ff001>
    80201810:	02090263          	beqz	s2,80201834 <vmprint+0x76>
            if (*pte3 & PTE_V)
    80201814:	6090                	ld	a2,0(s1)
    80201816:	00167793          	andi	a5,a2,1
    8020181a:	dbed                	beqz	a5,8020180c <vmprint+0x4e>
              printf(".. .. ..%d: pte %p pa %p\n", pte3 - pt3, *pte3, PTE2PA(*pte3));
    8020181c:	00a65693          	srli	a3,a2,0xa
    80201820:	413485b3          	sub	a1,s1,s3
    80201824:	06b2                	slli	a3,a3,0xc
    80201826:	858d                	srai	a1,a1,0x3
    80201828:	8552                	mv	a0,s4
    8020182a:	fffff097          	auipc	ra,0xfffff
    8020182e:	964080e7          	jalr	-1692(ra) # 8020018e <printf>
    80201832:	bfe9                	j	8020180c <vmprint+0x4e>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    80201834:	0aa1                	addi	s5,s5,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd9008>
    80201836:	1b7d                	addi	s6,s6,-1 # fff <_entry-0x801ff001>
    80201838:	020b0e63          	beqz	s6,80201874 <vmprint+0xb6>
        if (*pte2 & PTE_V)
    8020183c:	000ab603          	ld	a2,0(s5)
    80201840:	00167793          	andi	a5,a2,1
    80201844:	dbe5                	beqz	a5,80201834 <vmprint+0x76>
          pagetable_t pt3 = (pagetable_t) PTE2PA(*pte2);
    80201846:	00a65993          	srli	s3,a2,0xa
    8020184a:	09b2                	slli	s3,s3,0xc
          printf(".. ..%d: pte %p pa %p\n", pte2 - pt2, *pte2, pt3);
    8020184c:	418a85b3          	sub	a1,s5,s8
    80201850:	86ce                	mv	a3,s3
    80201852:	858d                	srai	a1,a1,0x3
    80201854:	856a                	mv	a0,s10
    80201856:	fffff097          	auipc	ra,0xfffff
    8020185a:	938080e7          	jalr	-1736(ra) # 8020018e <printf>
          for (pte_t *pte3 = (pte_t *) pt3; pte3 < pt3 + capacity; pte3++)
    8020185e:	00898713          	addi	a4,s3,8 # 1008 <_entry-0x801feff8>
    80201862:	019987b3          	add	a5,s3,s9
    80201866:	20000913          	li	s2,512
    8020186a:	00e7f363          	bgeu	a5,a4,80201870 <vmprint+0xb2>
    8020186e:	4905                	li	s2,1
    80201870:	84ce                	mv	s1,s3
    80201872:	b74d                	j	80201814 <vmprint+0x56>
  for (pte_t *pte = (pte_t *) pagetable; pte < pagetable + capacity; pte++) {
    80201874:	0ba1                	addi	s7,s7,8 # fffffffffffff008 <ebss_clear+0xffffffff7fdd9008>
    80201876:	05bb8463          	beq	s7,s11,802018be <vmprint+0x100>
    if (*pte & PTE_V)
    8020187a:	000bb603          	ld	a2,0(s7)
    8020187e:	00167793          	andi	a5,a2,1
    80201882:	dbed                	beqz	a5,80201874 <vmprint+0xb6>
      pagetable_t pt2 = (pagetable_t) PTE2PA(*pte); 
    80201884:	00a65c13          	srli	s8,a2,0xa
    80201888:	0c32                	slli	s8,s8,0xc
      printf("..%d: pte %p pa %p\n", pte - pagetable, *pte, pt2);
    8020188a:	f8843783          	ld	a5,-120(s0)
    8020188e:	40fb87b3          	sub	a5,s7,a5
    80201892:	86e2                	mv	a3,s8
    80201894:	4037d593          	srai	a1,a5,0x3
    80201898:	00008517          	auipc	a0,0x8
    8020189c:	ce050513          	addi	a0,a0,-800 # 80209578 <digits+0x1f8>
    802018a0:	fffff097          	auipc	ra,0xfffff
    802018a4:	8ee080e7          	jalr	-1810(ra) # 8020018e <printf>
      for (pte_t *pte2 = (pte_t *) pt2; pte2 < pt2 + capacity; pte2++) {
    802018a8:	019c0733          	add	a4,s8,s9
    802018ac:	008c0793          	addi	a5,s8,8 # 1008 <_entry-0x801feff8>
    802018b0:	20000b13          	li	s6,512
    802018b4:	00f77363          	bgeu	a4,a5,802018ba <vmprint+0xfc>
    802018b8:	4b05                	li	s6,1
    802018ba:	8ae2                	mv	s5,s8
    802018bc:	b741                	j	8020183c <vmprint+0x7e>
        }
      }
    }
  }
  return;
    802018be:	70e6                	ld	ra,120(sp)
    802018c0:	7446                	ld	s0,112(sp)
    802018c2:	74a6                	ld	s1,104(sp)
    802018c4:	7906                	ld	s2,96(sp)
    802018c6:	69e6                	ld	s3,88(sp)
    802018c8:	6a46                	ld	s4,80(sp)
    802018ca:	6aa6                	ld	s5,72(sp)
    802018cc:	6b06                	ld	s6,64(sp)
    802018ce:	7be2                	ld	s7,56(sp)
    802018d0:	7c42                	ld	s8,48(sp)
    802018d2:	7ca2                	ld	s9,40(sp)
    802018d4:	7d02                	ld	s10,32(sp)
    802018d6:	6de2                	ld	s11,24(sp)
    802018d8:	6109                	addi	sp,sp,128
    802018da:	8082                	ret

00000000802018dc <wakeup1>:

// Wake up p if it is sleeping in wait(); used by exit().
// Caller must hold p->lock.
static void
wakeup1(struct proc *p)
{
    802018dc:	1101                	addi	sp,sp,-32
    802018de:	ec06                	sd	ra,24(sp)
    802018e0:	e822                	sd	s0,16(sp)
    802018e2:	e426                	sd	s1,8(sp)
    802018e4:	1000                	addi	s0,sp,32
    802018e6:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    802018e8:	fffff097          	auipc	ra,0xfffff
    802018ec:	dde080e7          	jalr	-546(ra) # 802006c6 <holding>
    802018f0:	c909                	beqz	a0,80201902 <wakeup1+0x26>
    panic("wakeup1");
  if(p->chan == p && p->state == SLEEPING) {
    802018f2:	749c                	ld	a5,40(s1)
    802018f4:	00978f63          	beq	a5,s1,80201912 <wakeup1+0x36>
    p->state = RUNNABLE;
  }
}
    802018f8:	60e2                	ld	ra,24(sp)
    802018fa:	6442                	ld	s0,16(sp)
    802018fc:	64a2                	ld	s1,8(sp)
    802018fe:	6105                	addi	sp,sp,32
    80201900:	8082                	ret
    panic("wakeup1");
    80201902:	00008517          	auipc	a0,0x8
    80201906:	cc650513          	addi	a0,a0,-826 # 802095c8 <digits+0x248>
    8020190a:	fffff097          	auipc	ra,0xfffff
    8020190e:	83a080e7          	jalr	-1990(ra) # 80200144 <panic>
  if(p->chan == p && p->state == SLEEPING) {
    80201912:	4c98                	lw	a4,24(s1)
    80201914:	4785                	li	a5,1
    80201916:	fef711e3          	bne	a4,a5,802018f8 <wakeup1+0x1c>
    p->state = RUNNABLE;
    8020191a:	4789                	li	a5,2
    8020191c:	cc9c                	sw	a5,24(s1)
}
    8020191e:	bfe9                	j	802018f8 <wakeup1+0x1c>

0000000080201920 <reg_info>:
void reg_info(void) {
    80201920:	1141                	addi	sp,sp,-16
    80201922:	e406                	sd	ra,8(sp)
    80201924:	e022                	sd	s0,0(sp)
    80201926:	0800                	addi	s0,sp,16
  printf("register info: {\n");
    80201928:	00008517          	auipc	a0,0x8
    8020192c:	ca850513          	addi	a0,a0,-856 # 802095d0 <digits+0x250>
    80201930:	fffff097          	auipc	ra,0xfffff
    80201934:	85e080e7          	jalr	-1954(ra) # 8020018e <printf>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80201938:	100025f3          	csrr	a1,sstatus
  printf("sstatus: %p\n", r_sstatus());
    8020193c:	00008517          	auipc	a0,0x8
    80201940:	cac50513          	addi	a0,a0,-852 # 802095e8 <digits+0x268>
    80201944:	fffff097          	auipc	ra,0xfffff
    80201948:	84a080e7          	jalr	-1974(ra) # 8020018e <printf>
  asm volatile("csrr %0, sip" : "=r" (x) );
    8020194c:	144025f3          	csrr	a1,sip
  printf("sip: %p\n", r_sip());
    80201950:	00008517          	auipc	a0,0x8
    80201954:	ca850513          	addi	a0,a0,-856 # 802095f8 <digits+0x278>
    80201958:	fffff097          	auipc	ra,0xfffff
    8020195c:	836080e7          	jalr	-1994(ra) # 8020018e <printf>
  asm volatile("csrr %0, sie" : "=r" (x) );
    80201960:	104025f3          	csrr	a1,sie
  printf("sie: %p\n", r_sie());
    80201964:	00008517          	auipc	a0,0x8
    80201968:	ca450513          	addi	a0,a0,-860 # 80209608 <digits+0x288>
    8020196c:	fffff097          	auipc	ra,0xfffff
    80201970:	822080e7          	jalr	-2014(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80201974:	141025f3          	csrr	a1,sepc
  printf("sepc: %p\n", r_sepc());
    80201978:	00008517          	auipc	a0,0x8
    8020197c:	ca050513          	addi	a0,a0,-864 # 80209618 <digits+0x298>
    80201980:	fffff097          	auipc	ra,0xfffff
    80201984:	80e080e7          	jalr	-2034(ra) # 8020018e <printf>
  asm volatile("csrr %0, stvec" : "=r" (x) );
    80201988:	105025f3          	csrr	a1,stvec
  printf("stvec: %p\n", r_stvec());
    8020198c:	00008517          	auipc	a0,0x8
    80201990:	c9c50513          	addi	a0,a0,-868 # 80209628 <digits+0x2a8>
    80201994:	ffffe097          	auipc	ra,0xffffe
    80201998:	7fa080e7          	jalr	2042(ra) # 8020018e <printf>
  asm volatile("csrr %0, satp" : "=r" (x) );
    8020199c:	180025f3          	csrr	a1,satp
  printf("satp: %p\n", r_satp());
    802019a0:	00008517          	auipc	a0,0x8
    802019a4:	c9850513          	addi	a0,a0,-872 # 80209638 <digits+0x2b8>
    802019a8:	ffffe097          	auipc	ra,0xffffe
    802019ac:	7e6080e7          	jalr	2022(ra) # 8020018e <printf>
  asm volatile("csrr %0, scause" : "=r" (x) );
    802019b0:	142025f3          	csrr	a1,scause
  printf("scause: %p\n", r_scause());
    802019b4:	00008517          	auipc	a0,0x8
    802019b8:	c9450513          	addi	a0,a0,-876 # 80209648 <digits+0x2c8>
    802019bc:	ffffe097          	auipc	ra,0xffffe
    802019c0:	7d2080e7          	jalr	2002(ra) # 8020018e <printf>
  asm volatile("csrr %0, stval" : "=r" (x) );
    802019c4:	143025f3          	csrr	a1,stval
  printf("stval: %p\n", r_stval());
    802019c8:	00008517          	auipc	a0,0x8
    802019cc:	c9050513          	addi	a0,a0,-880 # 80209658 <digits+0x2d8>
    802019d0:	ffffe097          	auipc	ra,0xffffe
    802019d4:	7be080e7          	jalr	1982(ra) # 8020018e <printf>
  asm volatile("mv %0, sp" : "=r" (x) );
    802019d8:	858a                	mv	a1,sp
  printf("sp: %p\n", r_sp());
    802019da:	00008517          	auipc	a0,0x8
    802019de:	c8e50513          	addi	a0,a0,-882 # 80209668 <digits+0x2e8>
    802019e2:	ffffe097          	auipc	ra,0xffffe
    802019e6:	7ac080e7          	jalr	1964(ra) # 8020018e <printf>
  asm volatile("mv %0, tp" : "=r" (x) );
    802019ea:	8592                	mv	a1,tp
  printf("tp: %p\n", r_tp());
    802019ec:	00008517          	auipc	a0,0x8
    802019f0:	c8450513          	addi	a0,a0,-892 # 80209670 <digits+0x2f0>
    802019f4:	ffffe097          	auipc	ra,0xffffe
    802019f8:	79a080e7          	jalr	1946(ra) # 8020018e <printf>
  asm volatile("mv %0, ra" : "=r" (x) );
    802019fc:	8586                	mv	a1,ra
  printf("ra: %p\n", r_ra());
    802019fe:	00008517          	auipc	a0,0x8
    80201a02:	c7a50513          	addi	a0,a0,-902 # 80209678 <digits+0x2f8>
    80201a06:	ffffe097          	auipc	ra,0xffffe
    80201a0a:	788080e7          	jalr	1928(ra) # 8020018e <printf>
  printf("}\n");
    80201a0e:	00008517          	auipc	a0,0x8
    80201a12:	c7250513          	addi	a0,a0,-910 # 80209680 <digits+0x300>
    80201a16:	ffffe097          	auipc	ra,0xffffe
    80201a1a:	778080e7          	jalr	1912(ra) # 8020018e <printf>
}
    80201a1e:	60a2                	ld	ra,8(sp)
    80201a20:	6402                	ld	s0,0(sp)
    80201a22:	0141                	addi	sp,sp,16
    80201a24:	8082                	ret

0000000080201a26 <procinit>:
{
    80201a26:	7179                	addi	sp,sp,-48
    80201a28:	f406                	sd	ra,40(sp)
    80201a2a:	f022                	sd	s0,32(sp)
    80201a2c:	ec26                	sd	s1,24(sp)
    80201a2e:	e84a                	sd	s2,16(sp)
    80201a30:	e44e                	sd	s3,8(sp)
    80201a32:	1800                	addi	s0,sp,48
  initlock(&pid_lock, "nextpid");
    80201a34:	00008597          	auipc	a1,0x8
    80201a38:	c5458593          	addi	a1,a1,-940 # 80209688 <digits+0x308>
    80201a3c:	00012517          	auipc	a0,0x12
    80201a40:	62450513          	addi	a0,a0,1572 # 80214060 <pid_lock>
    80201a44:	fffff097          	auipc	ra,0xfffff
    80201a48:	c6c080e7          	jalr	-916(ra) # 802006b0 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a4c:	00012497          	auipc	s1,0x12
    80201a50:	73448493          	addi	s1,s1,1844 # 80214180 <proc>
      initlock(&p->lock, "proc");
    80201a54:	00008997          	auipc	s3,0x8
    80201a58:	c3c98993          	addi	s3,s3,-964 # 80209690 <digits+0x310>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a5c:	00017917          	auipc	s2,0x17
    80201a60:	09490913          	addi	s2,s2,148 # 80218af0 <bcache>
      initlock(&p->lock, "proc");
    80201a64:	85ce                	mv	a1,s3
    80201a66:	8526                	mv	a0,s1
    80201a68:	fffff097          	auipc	ra,0xfffff
    80201a6c:	c48080e7          	jalr	-952(ra) # 802006b0 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201a70:	17848493          	addi	s1,s1,376
    80201a74:	ff2498e3          	bne	s1,s2,80201a64 <procinit+0x3e>
  memset(cpus, 0, sizeof(cpus));
    80201a78:	10000613          	li	a2,256
    80201a7c:	4581                	li	a1,0
    80201a7e:	00012517          	auipc	a0,0x12
    80201a82:	5fa50513          	addi	a0,a0,1530 # 80214078 <cpus>
    80201a86:	fffff097          	auipc	ra,0xfffff
    80201a8a:	d0a080e7          	jalr	-758(ra) # 80200790 <memset>
  printf("procinit\n");
    80201a8e:	00008517          	auipc	a0,0x8
    80201a92:	c0a50513          	addi	a0,a0,-1014 # 80209698 <digits+0x318>
    80201a96:	ffffe097          	auipc	ra,0xffffe
    80201a9a:	6f8080e7          	jalr	1784(ra) # 8020018e <printf>
}
    80201a9e:	70a2                	ld	ra,40(sp)
    80201aa0:	7402                	ld	s0,32(sp)
    80201aa2:	64e2                	ld	s1,24(sp)
    80201aa4:	6942                	ld	s2,16(sp)
    80201aa6:	69a2                	ld	s3,8(sp)
    80201aa8:	6145                	addi	sp,sp,48
    80201aaa:	8082                	ret

0000000080201aac <cpuid>:
{
    80201aac:	1141                	addi	sp,sp,-16
    80201aae:	e422                	sd	s0,8(sp)
    80201ab0:	0800                	addi	s0,sp,16
  asm volatile("mv %0, tp" : "=r" (x) );
    80201ab2:	8512                	mv	a0,tp
}
    80201ab4:	2501                	sext.w	a0,a0
    80201ab6:	6422                	ld	s0,8(sp)
    80201ab8:	0141                	addi	sp,sp,16
    80201aba:	8082                	ret

0000000080201abc <mycpu>:
mycpu(void) {
    80201abc:	1141                	addi	sp,sp,-16
    80201abe:	e422                	sd	s0,8(sp)
    80201ac0:	0800                	addi	s0,sp,16
    80201ac2:	8792                	mv	a5,tp
  struct cpu *c = &cpus[id];
    80201ac4:	2781                	sext.w	a5,a5
    80201ac6:	079e                	slli	a5,a5,0x7
}
    80201ac8:	00012517          	auipc	a0,0x12
    80201acc:	5b050513          	addi	a0,a0,1456 # 80214078 <cpus>
    80201ad0:	953e                	add	a0,a0,a5
    80201ad2:	6422                	ld	s0,8(sp)
    80201ad4:	0141                	addi	sp,sp,16
    80201ad6:	8082                	ret

0000000080201ad8 <myproc>:
myproc(void) {
    80201ad8:	1101                	addi	sp,sp,-32
    80201ada:	ec06                	sd	ra,24(sp)
    80201adc:	e822                	sd	s0,16(sp)
    80201ade:	e426                	sd	s1,8(sp)
    80201ae0:	1000                	addi	s0,sp,32
  push_off();
    80201ae2:	fffff097          	auipc	ra,0xfffff
    80201ae6:	b22080e7          	jalr	-1246(ra) # 80200604 <push_off>
    80201aea:	8792                	mv	a5,tp
  struct proc *p = c->proc;
    80201aec:	2781                	sext.w	a5,a5
    80201aee:	079e                	slli	a5,a5,0x7
    80201af0:	00012717          	auipc	a4,0x12
    80201af4:	57070713          	addi	a4,a4,1392 # 80214060 <pid_lock>
    80201af8:	97ba                	add	a5,a5,a4
    80201afa:	6f84                	ld	s1,24(a5)
  pop_off();
    80201afc:	fffff097          	auipc	ra,0xfffff
    80201b00:	b54080e7          	jalr	-1196(ra) # 80200650 <pop_off>
}
    80201b04:	8526                	mv	a0,s1
    80201b06:	60e2                	ld	ra,24(sp)
    80201b08:	6442                	ld	s0,16(sp)
    80201b0a:	64a2                	ld	s1,8(sp)
    80201b0c:	6105                	addi	sp,sp,32
    80201b0e:	8082                	ret

0000000080201b10 <forkret>:
{
    80201b10:	1101                	addi	sp,sp,-32
    80201b12:	ec06                	sd	ra,24(sp)
    80201b14:	e822                	sd	s0,16(sp)
    80201b16:	e426                	sd	s1,8(sp)
    80201b18:	1000                	addi	s0,sp,32
  release(&myproc()->lock);
    80201b1a:	00000097          	auipc	ra,0x0
    80201b1e:	fbe080e7          	jalr	-66(ra) # 80201ad8 <myproc>
    80201b22:	fffff097          	auipc	ra,0xfffff
    80201b26:	c26080e7          	jalr	-986(ra) # 80200748 <release>
  if (first) {
    80201b2a:	00008797          	auipc	a5,0x8
    80201b2e:	4d67a783          	lw	a5,1238(a5) # 8020a000 <first.1>
    80201b32:	eb91                	bnez	a5,80201b46 <forkret+0x36>
  usertrapret();
    80201b34:	00001097          	auipc	ra,0x1
    80201b38:	ee0080e7          	jalr	-288(ra) # 80202a14 <usertrapret>
}
    80201b3c:	60e2                	ld	ra,24(sp)
    80201b3e:	6442                	ld	s0,16(sp)
    80201b40:	64a2                	ld	s1,8(sp)
    80201b42:	6105                	addi	sp,sp,32
    80201b44:	8082                	ret
    first = 0;
    80201b46:	00008797          	auipc	a5,0x8
    80201b4a:	4a07ad23          	sw	zero,1210(a5) # 8020a000 <first.1>
    fat32_init();
    80201b4e:	00004097          	auipc	ra,0x4
    80201b52:	f36080e7          	jalr	-202(ra) # 80205a84 <fat32_init>
    myproc()->cwd = ename("/");
    80201b56:	00000097          	auipc	ra,0x0
    80201b5a:	f82080e7          	jalr	-126(ra) # 80201ad8 <myproc>
    80201b5e:	84aa                	mv	s1,a0
    80201b60:	00008517          	auipc	a0,0x8
    80201b64:	b4850513          	addi	a0,a0,-1208 # 802096a8 <digits+0x328>
    80201b68:	00005097          	auipc	ra,0x5
    80201b6c:	210080e7          	jalr	528(ra) # 80206d78 <ename>
    80201b70:	14a4bc23          	sd	a0,344(s1)
    80201b74:	b7c1                	j	80201b34 <forkret+0x24>

0000000080201b76 <allocpid>:
allocpid() {
    80201b76:	1101                	addi	sp,sp,-32
    80201b78:	ec06                	sd	ra,24(sp)
    80201b7a:	e822                	sd	s0,16(sp)
    80201b7c:	e426                	sd	s1,8(sp)
    80201b7e:	e04a                	sd	s2,0(sp)
    80201b80:	1000                	addi	s0,sp,32
  acquire(&pid_lock);
    80201b82:	00012917          	auipc	s2,0x12
    80201b86:	4de90913          	addi	s2,s2,1246 # 80214060 <pid_lock>
    80201b8a:	854a                	mv	a0,s2
    80201b8c:	fffff097          	auipc	ra,0xfffff
    80201b90:	b68080e7          	jalr	-1176(ra) # 802006f4 <acquire>
  pid = nextpid;
    80201b94:	00008797          	auipc	a5,0x8
    80201b98:	46c78793          	addi	a5,a5,1132 # 8020a000 <first.1>
    80201b9c:	43c4                	lw	s1,4(a5)
  nextpid = nextpid + 1;
    80201b9e:	0014871b          	addiw	a4,s1,1
    80201ba2:	c3d8                	sw	a4,4(a5)
  release(&pid_lock);
    80201ba4:	854a                	mv	a0,s2
    80201ba6:	fffff097          	auipc	ra,0xfffff
    80201baa:	ba2080e7          	jalr	-1118(ra) # 80200748 <release>
}
    80201bae:	8526                	mv	a0,s1
    80201bb0:	60e2                	ld	ra,24(sp)
    80201bb2:	6442                	ld	s0,16(sp)
    80201bb4:	64a2                	ld	s1,8(sp)
    80201bb6:	6902                	ld	s2,0(sp)
    80201bb8:	6105                	addi	sp,sp,32
    80201bba:	8082                	ret

0000000080201bbc <proc_pagetable>:
{
    80201bbc:	1101                	addi	sp,sp,-32
    80201bbe:	ec06                	sd	ra,24(sp)
    80201bc0:	e822                	sd	s0,16(sp)
    80201bc2:	e426                	sd	s1,8(sp)
    80201bc4:	e04a                	sd	s2,0(sp)
    80201bc6:	1000                	addi	s0,sp,32
    80201bc8:	892a                	mv	s2,a0
  pagetable = uvmcreate();
    80201bca:	fffff097          	auipc	ra,0xfffff
    80201bce:	392080e7          	jalr	914(ra) # 80200f5c <uvmcreate>
    80201bd2:	84aa                	mv	s1,a0
  if(pagetable == 0)
    80201bd4:	c121                	beqz	a0,80201c14 <proc_pagetable+0x58>
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80201bd6:	4729                	li	a4,10
    80201bd8:	0000a697          	auipc	a3,0xa
    80201bdc:	de06b683          	ld	a3,-544(a3) # 8020b9b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201be0:	6605                	lui	a2,0x1
    80201be2:	040005b7          	lui	a1,0x4000
    80201be6:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201be8:	05b2                	slli	a1,a1,0xc
    80201bea:	fffff097          	auipc	ra,0xfffff
    80201bee:	0e4080e7          	jalr	228(ra) # 80200cce <mappages>
    80201bf2:	02054863          	bltz	a0,80201c22 <proc_pagetable+0x66>
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80201bf6:	4719                	li	a4,6
    80201bf8:	06093683          	ld	a3,96(s2)
    80201bfc:	6605                	lui	a2,0x1
    80201bfe:	020005b7          	lui	a1,0x2000
    80201c02:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201c04:	05b6                	slli	a1,a1,0xd
    80201c06:	8526                	mv	a0,s1
    80201c08:	fffff097          	auipc	ra,0xfffff
    80201c0c:	0c6080e7          	jalr	198(ra) # 80200cce <mappages>
    80201c10:	02054163          	bltz	a0,80201c32 <proc_pagetable+0x76>
}
    80201c14:	8526                	mv	a0,s1
    80201c16:	60e2                	ld	ra,24(sp)
    80201c18:	6442                	ld	s0,16(sp)
    80201c1a:	64a2                	ld	s1,8(sp)
    80201c1c:	6902                	ld	s2,0(sp)
    80201c1e:	6105                	addi	sp,sp,32
    80201c20:	8082                	ret
    uvmfree(pagetable, 0);
    80201c22:	4581                	li	a1,0
    80201c24:	8526                	mv	a0,s1
    80201c26:	fffff097          	auipc	ra,0xfffff
    80201c2a:	5d2080e7          	jalr	1490(ra) # 802011f8 <uvmfree>
    return NULL;
    80201c2e:	4481                	li	s1,0
    80201c30:	b7d5                	j	80201c14 <proc_pagetable+0x58>
    vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201c32:	4681                	li	a3,0
    80201c34:	4605                	li	a2,1
    80201c36:	040005b7          	lui	a1,0x4000
    80201c3a:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201c3c:	05b2                	slli	a1,a1,0xc
    80201c3e:	8526                	mv	a0,s1
    80201c40:	fffff097          	auipc	ra,0xfffff
    80201c44:	258080e7          	jalr	600(ra) # 80200e98 <vmunmap>
    uvmfree(pagetable, 0);
    80201c48:	4581                	li	a1,0
    80201c4a:	8526                	mv	a0,s1
    80201c4c:	fffff097          	auipc	ra,0xfffff
    80201c50:	5ac080e7          	jalr	1452(ra) # 802011f8 <uvmfree>
    return NULL;
    80201c54:	4481                	li	s1,0
    80201c56:	bf7d                	j	80201c14 <proc_pagetable+0x58>

0000000080201c58 <proc_freepagetable>:
{
    80201c58:	1101                	addi	sp,sp,-32
    80201c5a:	ec06                	sd	ra,24(sp)
    80201c5c:	e822                	sd	s0,16(sp)
    80201c5e:	e426                	sd	s1,8(sp)
    80201c60:	e04a                	sd	s2,0(sp)
    80201c62:	1000                	addi	s0,sp,32
    80201c64:	84aa                	mv	s1,a0
    80201c66:	892e                	mv	s2,a1
  vmunmap(pagetable, TRAMPOLINE, 1, 0);
    80201c68:	4681                	li	a3,0
    80201c6a:	4605                	li	a2,1
    80201c6c:	040005b7          	lui	a1,0x4000
    80201c70:	15fd                	addi	a1,a1,-1 # 3ffffff <_entry-0x7c200001>
    80201c72:	05b2                	slli	a1,a1,0xc
    80201c74:	fffff097          	auipc	ra,0xfffff
    80201c78:	224080e7          	jalr	548(ra) # 80200e98 <vmunmap>
  vmunmap(pagetable, TRAPFRAME, 1, 0);
    80201c7c:	4681                	li	a3,0
    80201c7e:	4605                	li	a2,1
    80201c80:	020005b7          	lui	a1,0x2000
    80201c84:	15fd                	addi	a1,a1,-1 # 1ffffff <_entry-0x7e200001>
    80201c86:	05b6                	slli	a1,a1,0xd
    80201c88:	8526                	mv	a0,s1
    80201c8a:	fffff097          	auipc	ra,0xfffff
    80201c8e:	20e080e7          	jalr	526(ra) # 80200e98 <vmunmap>
  uvmfree(pagetable, sz);
    80201c92:	85ca                	mv	a1,s2
    80201c94:	8526                	mv	a0,s1
    80201c96:	fffff097          	auipc	ra,0xfffff
    80201c9a:	562080e7          	jalr	1378(ra) # 802011f8 <uvmfree>
}
    80201c9e:	60e2                	ld	ra,24(sp)
    80201ca0:	6442                	ld	s0,16(sp)
    80201ca2:	64a2                	ld	s1,8(sp)
    80201ca4:	6902                	ld	s2,0(sp)
    80201ca6:	6105                	addi	sp,sp,32
    80201ca8:	8082                	ret

0000000080201caa <freeproc>:
{
    80201caa:	1101                	addi	sp,sp,-32
    80201cac:	ec06                	sd	ra,24(sp)
    80201cae:	e822                	sd	s0,16(sp)
    80201cb0:	e426                	sd	s1,8(sp)
    80201cb2:	1000                	addi	s0,sp,32
    80201cb4:	84aa                	mv	s1,a0
  if(p->trapframe)
    80201cb6:	7128                	ld	a0,96(a0)
    80201cb8:	c509                	beqz	a0,80201cc2 <freeproc+0x18>
    kfree((void*)p->trapframe);
    80201cba:	ffffe097          	auipc	ra,0xffffe
    80201cbe:	786080e7          	jalr	1926(ra) # 80200440 <kfree>
  p->trapframe = 0;
    80201cc2:	0604b023          	sd	zero,96(s1)
  if (p->kpagetable) {
    80201cc6:	6ca8                	ld	a0,88(s1)
    80201cc8:	c511                	beqz	a0,80201cd4 <freeproc+0x2a>
    kvmfree(p->kpagetable, 1);
    80201cca:	4585                	li	a1,1
    80201ccc:	00000097          	auipc	ra,0x0
    80201cd0:	a32080e7          	jalr	-1486(ra) # 802016fe <kvmfree>
  p->kpagetable = 0;
    80201cd4:	0404bc23          	sd	zero,88(s1)
  if(p->pagetable)
    80201cd8:	68a8                	ld	a0,80(s1)
    80201cda:	c511                	beqz	a0,80201ce6 <freeproc+0x3c>
    proc_freepagetable(p->pagetable, p->sz);
    80201cdc:	64ac                	ld	a1,72(s1)
    80201cde:	00000097          	auipc	ra,0x0
    80201ce2:	f7a080e7          	jalr	-134(ra) # 80201c58 <proc_freepagetable>
  p->pagetable = 0;
    80201ce6:	0404b823          	sd	zero,80(s1)
  p->sz = 0;
    80201cea:	0404b423          	sd	zero,72(s1)
  p->pid = 0;
    80201cee:	0204ac23          	sw	zero,56(s1)
  p->parent = 0;
    80201cf2:	0204b023          	sd	zero,32(s1)
  p->name[0] = 0;
    80201cf6:	16048023          	sb	zero,352(s1)
  p->chan = 0;
    80201cfa:	0204b423          	sd	zero,40(s1)
  p->killed = 0;
    80201cfe:	0204a823          	sw	zero,48(s1)
  p->xstate = 0;
    80201d02:	0204aa23          	sw	zero,52(s1)
  p->state = UNUSED;
    80201d06:	0004ac23          	sw	zero,24(s1)
}
    80201d0a:	60e2                	ld	ra,24(sp)
    80201d0c:	6442                	ld	s0,16(sp)
    80201d0e:	64a2                	ld	s1,8(sp)
    80201d10:	6105                	addi	sp,sp,32
    80201d12:	8082                	ret

0000000080201d14 <allocproc>:
{
    80201d14:	1101                	addi	sp,sp,-32
    80201d16:	ec06                	sd	ra,24(sp)
    80201d18:	e822                	sd	s0,16(sp)
    80201d1a:	e426                	sd	s1,8(sp)
    80201d1c:	e04a                	sd	s2,0(sp)
    80201d1e:	1000                	addi	s0,sp,32
  for(p = proc; p < &proc[NPROC]; p++) {
    80201d20:	00012497          	auipc	s1,0x12
    80201d24:	46048493          	addi	s1,s1,1120 # 80214180 <proc>
    80201d28:	00017917          	auipc	s2,0x17
    80201d2c:	dc890913          	addi	s2,s2,-568 # 80218af0 <bcache>
    acquire(&p->lock);
    80201d30:	8526                	mv	a0,s1
    80201d32:	fffff097          	auipc	ra,0xfffff
    80201d36:	9c2080e7          	jalr	-1598(ra) # 802006f4 <acquire>
    if(p->state == UNUSED) {
    80201d3a:	4c9c                	lw	a5,24(s1)
    80201d3c:	cf81                	beqz	a5,80201d54 <allocproc+0x40>
      release(&p->lock);
    80201d3e:	8526                	mv	a0,s1
    80201d40:	fffff097          	auipc	ra,0xfffff
    80201d44:	a08080e7          	jalr	-1528(ra) # 80200748 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80201d48:	17848493          	addi	s1,s1,376
    80201d4c:	ff2492e3          	bne	s1,s2,80201d30 <allocproc+0x1c>
  return NULL;
    80201d50:	4481                	li	s1,0
    80201d52:	a085                	j	80201db2 <allocproc+0x9e>
  p->pid = allocpid();
    80201d54:	00000097          	auipc	ra,0x0
    80201d58:	e22080e7          	jalr	-478(ra) # 80201b76 <allocpid>
    80201d5c:	dc88                	sw	a0,56(s1)
  if((p->trapframe = (struct trapframe *)kalloc()) == NULL){
    80201d5e:	fffff097          	auipc	ra,0xfffff
    80201d62:	82a080e7          	jalr	-2006(ra) # 80200588 <kalloc>
    80201d66:	892a                	mv	s2,a0
    80201d68:	f0a8                	sd	a0,96(s1)
    80201d6a:	c939                	beqz	a0,80201dc0 <allocproc+0xac>
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d6c:	8526                	mv	a0,s1
    80201d6e:	00000097          	auipc	ra,0x0
    80201d72:	e4e080e7          	jalr	-434(ra) # 80201bbc <proc_pagetable>
    80201d76:	e8a8                	sd	a0,80(s1)
    80201d78:	c939                	beqz	a0,80201dce <allocproc+0xba>
      (p->kpagetable = proc_kpagetable()) == NULL) {
    80201d7a:	00000097          	auipc	ra,0x0
    80201d7e:	9de080e7          	jalr	-1570(ra) # 80201758 <proc_kpagetable>
    80201d82:	eca8                	sd	a0,88(s1)
  if ((p->pagetable = proc_pagetable(p)) == NULL ||
    80201d84:	c529                	beqz	a0,80201dce <allocproc+0xba>
  p->kstack = VKSTACK;
    80201d86:	0fb00793          	li	a5,251
    80201d8a:	07fa                	slli	a5,a5,0x1e
    80201d8c:	e0bc                	sd	a5,64(s1)
  memset(&p->context, 0, sizeof(p->context));
    80201d8e:	07000613          	li	a2,112
    80201d92:	4581                	li	a1,0
    80201d94:	06848513          	addi	a0,s1,104
    80201d98:	fffff097          	auipc	ra,0xfffff
    80201d9c:	9f8080e7          	jalr	-1544(ra) # 80200790 <memset>
  p->context.ra = (uint64)forkret;
    80201da0:	00000797          	auipc	a5,0x0
    80201da4:	d7078793          	addi	a5,a5,-656 # 80201b10 <forkret>
    80201da8:	f4bc                	sd	a5,104(s1)
  p->context.sp = p->kstack + PGSIZE;
    80201daa:	60bc                	ld	a5,64(s1)
    80201dac:	6705                	lui	a4,0x1
    80201dae:	97ba                	add	a5,a5,a4
    80201db0:	f8bc                	sd	a5,112(s1)
}
    80201db2:	8526                	mv	a0,s1
    80201db4:	60e2                	ld	ra,24(sp)
    80201db6:	6442                	ld	s0,16(sp)
    80201db8:	64a2                	ld	s1,8(sp)
    80201dba:	6902                	ld	s2,0(sp)
    80201dbc:	6105                	addi	sp,sp,32
    80201dbe:	8082                	ret
    release(&p->lock);
    80201dc0:	8526                	mv	a0,s1
    80201dc2:	fffff097          	auipc	ra,0xfffff
    80201dc6:	986080e7          	jalr	-1658(ra) # 80200748 <release>
    return NULL;
    80201dca:	84ca                	mv	s1,s2
    80201dcc:	b7dd                	j	80201db2 <allocproc+0x9e>
    freeproc(p);
    80201dce:	8526                	mv	a0,s1
    80201dd0:	00000097          	auipc	ra,0x0
    80201dd4:	eda080e7          	jalr	-294(ra) # 80201caa <freeproc>
    release(&p->lock);
    80201dd8:	8526                	mv	a0,s1
    80201dda:	fffff097          	auipc	ra,0xfffff
    80201dde:	96e080e7          	jalr	-1682(ra) # 80200748 <release>
    return NULL;
    80201de2:	4481                	li	s1,0
    80201de4:	b7f9                	j	80201db2 <allocproc+0x9e>

0000000080201de6 <userinit>:
{
    80201de6:	1101                	addi	sp,sp,-32
    80201de8:	ec06                	sd	ra,24(sp)
    80201dea:	e822                	sd	s0,16(sp)
    80201dec:	e426                	sd	s1,8(sp)
    80201dee:	e04a                	sd	s2,0(sp)
    80201df0:	1000                	addi	s0,sp,32
  p = allocproc();
    80201df2:	00000097          	auipc	ra,0x0
    80201df6:	f22080e7          	jalr	-222(ra) # 80201d14 <allocproc>
    80201dfa:	84aa                	mv	s1,a0
  initproc = p;
    80201dfc:	00012797          	auipc	a5,0x12
    80201e00:	36a7be23          	sd	a0,892(a5) # 80214178 <initproc>
  uvminit(p->pagetable , p->kpagetable, initcode, sizeof(initcode));
    80201e04:	6905                	lui	s2,0x1
    80201e06:	91890693          	addi	a3,s2,-1768 # 918 <_entry-0x801ff6e8>
    80201e0a:	00008617          	auipc	a2,0x8
    80201e0e:	1fe60613          	addi	a2,a2,510 # 8020a008 <initcode>
    80201e12:	6d2c                	ld	a1,88(a0)
    80201e14:	6928                	ld	a0,80(a0)
    80201e16:	fffff097          	auipc	ra,0xfffff
    80201e1a:	174080e7          	jalr	372(ra) # 80200f8a <uvminit>
  p->sz = PGSIZE;
    80201e1e:	0524b423          	sd	s2,72(s1)
  p->trapframe->epc = 0x0;      // user program counter
    80201e22:	70bc                	ld	a5,96(s1)
    80201e24:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80201e28:	70bc                	ld	a5,96(s1)
    80201e2a:	0327b823          	sd	s2,48(a5)
  safestrcpy(p->name, "initcode", sizeof(p->name));
    80201e2e:	4641                	li	a2,16
    80201e30:	00008597          	auipc	a1,0x8
    80201e34:	88058593          	addi	a1,a1,-1920 # 802096b0 <digits+0x330>
    80201e38:	16048513          	addi	a0,s1,352
    80201e3c:	fffff097          	auipc	ra,0xfffff
    80201e40:	aa6080e7          	jalr	-1370(ra) # 802008e2 <safestrcpy>
  p->state = RUNNABLE;
    80201e44:	4789                	li	a5,2
    80201e46:	cc9c                	sw	a5,24(s1)
  p->tmask = 0;
    80201e48:	1604a823          	sw	zero,368(s1)
  release(&p->lock);
    80201e4c:	8526                	mv	a0,s1
    80201e4e:	fffff097          	auipc	ra,0xfffff
    80201e52:	8fa080e7          	jalr	-1798(ra) # 80200748 <release>
  printf("userinit\n");
    80201e56:	00008517          	auipc	a0,0x8
    80201e5a:	86a50513          	addi	a0,a0,-1942 # 802096c0 <digits+0x340>
    80201e5e:	ffffe097          	auipc	ra,0xffffe
    80201e62:	330080e7          	jalr	816(ra) # 8020018e <printf>
}
    80201e66:	60e2                	ld	ra,24(sp)
    80201e68:	6442                	ld	s0,16(sp)
    80201e6a:	64a2                	ld	s1,8(sp)
    80201e6c:	6902                	ld	s2,0(sp)
    80201e6e:	6105                	addi	sp,sp,32
    80201e70:	8082                	ret

0000000080201e72 <growproc>:
{
    80201e72:	1101                	addi	sp,sp,-32
    80201e74:	ec06                	sd	ra,24(sp)
    80201e76:	e822                	sd	s0,16(sp)
    80201e78:	e426                	sd	s1,8(sp)
    80201e7a:	e04a                	sd	s2,0(sp)
    80201e7c:	1000                	addi	s0,sp,32
    80201e7e:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80201e80:	00000097          	auipc	ra,0x0
    80201e84:	c58080e7          	jalr	-936(ra) # 80201ad8 <myproc>
    80201e88:	892a                	mv	s2,a0
  sz = p->sz;
    80201e8a:	6530                	ld	a2,72(a0)
    80201e8c:	0006079b          	sext.w	a5,a2
  if(n > 0){
    80201e90:	00904f63          	bgtz	s1,80201eae <growproc+0x3c>
  } else if(n < 0){
    80201e94:	0204ce63          	bltz	s1,80201ed0 <growproc+0x5e>
  p->sz = sz;
    80201e98:	1782                	slli	a5,a5,0x20
    80201e9a:	9381                	srli	a5,a5,0x20
    80201e9c:	04f93423          	sd	a5,72(s2)
  return 0;
    80201ea0:	4501                	li	a0,0
}
    80201ea2:	60e2                	ld	ra,24(sp)
    80201ea4:	6442                	ld	s0,16(sp)
    80201ea6:	64a2                	ld	s1,8(sp)
    80201ea8:	6902                	ld	s2,0(sp)
    80201eaa:	6105                	addi	sp,sp,32
    80201eac:	8082                	ret
    if((sz = uvmalloc(p->pagetable, p->kpagetable, sz, sz + n)) == 0) {
    80201eae:	00f486bb          	addw	a3,s1,a5
    80201eb2:	1682                	slli	a3,a3,0x20
    80201eb4:	9281                	srli	a3,a3,0x20
    80201eb6:	1602                	slli	a2,a2,0x20
    80201eb8:	9201                	srli	a2,a2,0x20
    80201eba:	6d2c                	ld	a1,88(a0)
    80201ebc:	6928                	ld	a0,80(a0)
    80201ebe:	fffff097          	auipc	ra,0xfffff
    80201ec2:	1d8080e7          	jalr	472(ra) # 80201096 <uvmalloc>
    80201ec6:	0005079b          	sext.w	a5,a0
    80201eca:	f7f9                	bnez	a5,80201e98 <growproc+0x26>
      return -1;
    80201ecc:	557d                	li	a0,-1
    80201ece:	bfd1                	j	80201ea2 <growproc+0x30>
    sz = uvmdealloc(p->pagetable, p->kpagetable, sz, sz + n);
    80201ed0:	00f486bb          	addw	a3,s1,a5
    80201ed4:	1682                	slli	a3,a3,0x20
    80201ed6:	9281                	srli	a3,a3,0x20
    80201ed8:	1602                	slli	a2,a2,0x20
    80201eda:	9201                	srli	a2,a2,0x20
    80201edc:	6d2c                	ld	a1,88(a0)
    80201ede:	6928                	ld	a0,80(a0)
    80201ee0:	fffff097          	auipc	ra,0xfffff
    80201ee4:	14a080e7          	jalr	330(ra) # 8020102a <uvmdealloc>
    80201ee8:	0005079b          	sext.w	a5,a0
    80201eec:	b775                	j	80201e98 <growproc+0x26>

0000000080201eee <fork>:
{
    80201eee:	7139                	addi	sp,sp,-64
    80201ef0:	fc06                	sd	ra,56(sp)
    80201ef2:	f822                	sd	s0,48(sp)
    80201ef4:	f426                	sd	s1,40(sp)
    80201ef6:	f04a                	sd	s2,32(sp)
    80201ef8:	ec4e                	sd	s3,24(sp)
    80201efa:	e852                	sd	s4,16(sp)
    80201efc:	e456                	sd	s5,8(sp)
    80201efe:	0080                	addi	s0,sp,64
  struct proc *p = myproc();
    80201f00:	00000097          	auipc	ra,0x0
    80201f04:	bd8080e7          	jalr	-1064(ra) # 80201ad8 <myproc>
    80201f08:	8aaa                	mv	s5,a0
  if((np = allocproc()) == NULL){
    80201f0a:	00000097          	auipc	ra,0x0
    80201f0e:	e0a080e7          	jalr	-502(ra) # 80201d14 <allocproc>
    80201f12:	c965                	beqz	a0,80202002 <fork+0x114>
    80201f14:	8a2a                	mv	s4,a0
  if(uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0){
    80201f16:	048ab683          	ld	a3,72(s5)
    80201f1a:	6d30                	ld	a2,88(a0)
    80201f1c:	692c                	ld	a1,80(a0)
    80201f1e:	050ab503          	ld	a0,80(s5)
    80201f22:	fffff097          	auipc	ra,0xfffff
    80201f26:	310080e7          	jalr	784(ra) # 80201232 <uvmcopy>
    80201f2a:	04054e63          	bltz	a0,80201f86 <fork+0x98>
  np->sz = p->sz;
    80201f2e:	048ab783          	ld	a5,72(s5)
    80201f32:	04fa3423          	sd	a5,72(s4)
  np->parent = p;
    80201f36:	035a3023          	sd	s5,32(s4)
  np->tmask = p->tmask;
    80201f3a:	170aa783          	lw	a5,368(s5)
    80201f3e:	16fa2823          	sw	a5,368(s4)
  *(np->trapframe) = *(p->trapframe);
    80201f42:	060ab683          	ld	a3,96(s5)
    80201f46:	87b6                	mv	a5,a3
    80201f48:	060a3703          	ld	a4,96(s4)
    80201f4c:	12068693          	addi	a3,a3,288
    80201f50:	0007b803          	ld	a6,0(a5)
    80201f54:	6788                	ld	a0,8(a5)
    80201f56:	6b8c                	ld	a1,16(a5)
    80201f58:	6f90                	ld	a2,24(a5)
    80201f5a:	01073023          	sd	a6,0(a4) # 1000 <_entry-0x801ff000>
    80201f5e:	e708                	sd	a0,8(a4)
    80201f60:	eb0c                	sd	a1,16(a4)
    80201f62:	ef10                	sd	a2,24(a4)
    80201f64:	02078793          	addi	a5,a5,32
    80201f68:	02070713          	addi	a4,a4,32
    80201f6c:	fed792e3          	bne	a5,a3,80201f50 <fork+0x62>
  np->trapframe->a0 = 0;
    80201f70:	060a3783          	ld	a5,96(s4)
    80201f74:	0607b823          	sd	zero,112(a5)
  for(i = 0; i < NOFILE; i++)
    80201f78:	0d8a8493          	addi	s1,s5,216
    80201f7c:	0d8a0913          	addi	s2,s4,216
    80201f80:	158a8993          	addi	s3,s5,344
    80201f84:	a00d                	j	80201fa6 <fork+0xb8>
    freeproc(np);
    80201f86:	8552                	mv	a0,s4
    80201f88:	00000097          	auipc	ra,0x0
    80201f8c:	d22080e7          	jalr	-734(ra) # 80201caa <freeproc>
    release(&np->lock);
    80201f90:	8552                	mv	a0,s4
    80201f92:	ffffe097          	auipc	ra,0xffffe
    80201f96:	7b6080e7          	jalr	1974(ra) # 80200748 <release>
    return -1;
    80201f9a:	54fd                	li	s1,-1
    80201f9c:	a889                	j	80201fee <fork+0x100>
  for(i = 0; i < NOFILE; i++)
    80201f9e:	04a1                	addi	s1,s1,8
    80201fa0:	0921                	addi	s2,s2,8
    80201fa2:	01348b63          	beq	s1,s3,80201fb8 <fork+0xca>
    if(p->ofile[i])
    80201fa6:	6088                	ld	a0,0(s1)
    80201fa8:	d97d                	beqz	a0,80201f9e <fork+0xb0>
      np->ofile[i] = filedup(p->ofile[i]);
    80201faa:	00002097          	auipc	ra,0x2
    80201fae:	b4e080e7          	jalr	-1202(ra) # 80203af8 <filedup>
    80201fb2:	00a93023          	sd	a0,0(s2)
    80201fb6:	b7e5                	j	80201f9e <fork+0xb0>
  np->cwd = edup(p->cwd);
    80201fb8:	158ab503          	ld	a0,344(s5)
    80201fbc:	00004097          	auipc	ra,0x4
    80201fc0:	3b6080e7          	jalr	950(ra) # 80206372 <edup>
    80201fc4:	14aa3c23          	sd	a0,344(s4)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80201fc8:	4641                	li	a2,16
    80201fca:	160a8593          	addi	a1,s5,352
    80201fce:	160a0513          	addi	a0,s4,352
    80201fd2:	fffff097          	auipc	ra,0xfffff
    80201fd6:	910080e7          	jalr	-1776(ra) # 802008e2 <safestrcpy>
  pid = np->pid;
    80201fda:	038a2483          	lw	s1,56(s4)
  np->state = RUNNABLE;
    80201fde:	4789                	li	a5,2
    80201fe0:	00fa2c23          	sw	a5,24(s4)
  release(&np->lock);
    80201fe4:	8552                	mv	a0,s4
    80201fe6:	ffffe097          	auipc	ra,0xffffe
    80201fea:	762080e7          	jalr	1890(ra) # 80200748 <release>
}
    80201fee:	8526                	mv	a0,s1
    80201ff0:	70e2                	ld	ra,56(sp)
    80201ff2:	7442                	ld	s0,48(sp)
    80201ff4:	74a2                	ld	s1,40(sp)
    80201ff6:	7902                	ld	s2,32(sp)
    80201ff8:	69e2                	ld	s3,24(sp)
    80201ffa:	6a42                	ld	s4,16(sp)
    80201ffc:	6aa2                	ld	s5,8(sp)
    80201ffe:	6121                	addi	sp,sp,64
    80202000:	8082                	ret
    return -1;
    80202002:	54fd                	li	s1,-1
    80202004:	b7ed                	j	80201fee <fork+0x100>

0000000080202006 <reparent>:
{
    80202006:	7179                	addi	sp,sp,-48
    80202008:	f406                	sd	ra,40(sp)
    8020200a:	f022                	sd	s0,32(sp)
    8020200c:	ec26                	sd	s1,24(sp)
    8020200e:	e84a                	sd	s2,16(sp)
    80202010:	e44e                	sd	s3,8(sp)
    80202012:	e052                	sd	s4,0(sp)
    80202014:	1800                	addi	s0,sp,48
    80202016:	892a                	mv	s2,a0
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80202018:	00012497          	auipc	s1,0x12
    8020201c:	16848493          	addi	s1,s1,360 # 80214180 <proc>
      pp->parent = initproc;
    80202020:	00012a17          	auipc	s4,0x12
    80202024:	040a0a13          	addi	s4,s4,64 # 80214060 <pid_lock>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80202028:	00017997          	auipc	s3,0x17
    8020202c:	ac898993          	addi	s3,s3,-1336 # 80218af0 <bcache>
    80202030:	a029                	j	8020203a <reparent+0x34>
    80202032:	17848493          	addi	s1,s1,376
    80202036:	03348363          	beq	s1,s3,8020205c <reparent+0x56>
    if(pp->parent == p){
    8020203a:	709c                	ld	a5,32(s1)
    8020203c:	ff279be3          	bne	a5,s2,80202032 <reparent+0x2c>
      acquire(&pp->lock);
    80202040:	8526                	mv	a0,s1
    80202042:	ffffe097          	auipc	ra,0xffffe
    80202046:	6b2080e7          	jalr	1714(ra) # 802006f4 <acquire>
      pp->parent = initproc;
    8020204a:	118a3783          	ld	a5,280(s4)
    8020204e:	f09c                	sd	a5,32(s1)
      release(&pp->lock);
    80202050:	8526                	mv	a0,s1
    80202052:	ffffe097          	auipc	ra,0xffffe
    80202056:	6f6080e7          	jalr	1782(ra) # 80200748 <release>
    8020205a:	bfe1                	j	80202032 <reparent+0x2c>
}
    8020205c:	70a2                	ld	ra,40(sp)
    8020205e:	7402                	ld	s0,32(sp)
    80202060:	64e2                	ld	s1,24(sp)
    80202062:	6942                	ld	s2,16(sp)
    80202064:	69a2                	ld	s3,8(sp)
    80202066:	6a02                	ld	s4,0(sp)
    80202068:	6145                	addi	sp,sp,48
    8020206a:	8082                	ret

000000008020206c <scheduler>:
{
    8020206c:	715d                	addi	sp,sp,-80
    8020206e:	e486                	sd	ra,72(sp)
    80202070:	e0a2                	sd	s0,64(sp)
    80202072:	fc26                	sd	s1,56(sp)
    80202074:	f84a                	sd	s2,48(sp)
    80202076:	f44e                	sd	s3,40(sp)
    80202078:	f052                	sd	s4,32(sp)
    8020207a:	ec56                	sd	s5,24(sp)
    8020207c:	e85a                	sd	s6,16(sp)
    8020207e:	e45e                	sd	s7,8(sp)
    80202080:	e062                	sd	s8,0(sp)
    80202082:	0880                	addi	s0,sp,80
    80202084:	8792                	mv	a5,tp
  int id = r_tp();
    80202086:	2781                	sext.w	a5,a5
  c->proc = 0;
    80202088:	00779b13          	slli	s6,a5,0x7
    8020208c:	00012717          	auipc	a4,0x12
    80202090:	fd470713          	addi	a4,a4,-44 # 80214060 <pid_lock>
    80202094:	975a                	add	a4,a4,s6
    80202096:	00073c23          	sd	zero,24(a4)
        swtch(&c->context, &p->context);
    8020209a:	00012717          	auipc	a4,0x12
    8020209e:	fe670713          	addi	a4,a4,-26 # 80214080 <cpus+0x8>
    802020a2:	9b3a                	add	s6,s6,a4
        c->proc = p;
    802020a4:	079e                	slli	a5,a5,0x7
    802020a6:	00012a97          	auipc	s5,0x12
    802020aa:	fbaa8a93          	addi	s5,s5,-70 # 80214060 <pid_lock>
    802020ae:	9abe                	add	s5,s5,a5
        w_satp(MAKE_SATP(p->kpagetable));
    802020b0:	5a7d                	li	s4,-1
    802020b2:	1a7e                	slli	s4,s4,0x3f
        w_satp(MAKE_SATP(kernel_pagetable));
    802020b4:	0000ab97          	auipc	s7,0xa
    802020b8:	944bbb83          	ld	s7,-1724(s7) # 8020b9f8 <_GLOBAL_OFFSET_TABLE_+0x48>
    802020bc:	a8a5                	j	80202134 <scheduler+0xc8>
      release(&p->lock);
    802020be:	8526                	mv	a0,s1
    802020c0:	ffffe097          	auipc	ra,0xffffe
    802020c4:	688080e7          	jalr	1672(ra) # 80200748 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    802020c8:	17848493          	addi	s1,s1,376
    802020cc:	05248a63          	beq	s1,s2,80202120 <scheduler+0xb4>
      acquire(&p->lock);
    802020d0:	8526                	mv	a0,s1
    802020d2:	ffffe097          	auipc	ra,0xffffe
    802020d6:	622080e7          	jalr	1570(ra) # 802006f4 <acquire>
      if(p->state == RUNNABLE) {
    802020da:	4c9c                	lw	a5,24(s1)
    802020dc:	ff3791e3          	bne	a5,s3,802020be <scheduler+0x52>
        p->state = RUNNING;
    802020e0:	478d                	li	a5,3
    802020e2:	cc9c                	sw	a5,24(s1)
        c->proc = p;
    802020e4:	009abc23          	sd	s1,24(s5)
        w_satp(MAKE_SATP(p->kpagetable));
    802020e8:	6cbc                	ld	a5,88(s1)
    802020ea:	83b1                	srli	a5,a5,0xc
    802020ec:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    802020f0:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802020f4:	12000073          	sfence.vma
        swtch(&c->context, &p->context);
    802020f8:	06848593          	addi	a1,s1,104
    802020fc:	855a                	mv	a0,s6
    802020fe:	00001097          	auipc	ra,0x1
    80202102:	860080e7          	jalr	-1952(ra) # 8020295e <swtch>
        w_satp(MAKE_SATP(kernel_pagetable));
    80202106:	000bb783          	ld	a5,0(s7)
    8020210a:	83b1                	srli	a5,a5,0xc
    8020210c:	0147e7b3          	or	a5,a5,s4
  asm volatile("csrw satp, %0" : : "r" (x));
    80202110:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    80202114:	12000073          	sfence.vma
        c->proc = 0;
    80202118:	000abc23          	sd	zero,24(s5)
        found = 1;
    8020211c:	4c05                	li	s8,1
    8020211e:	b745                	j	802020be <scheduler+0x52>
    if(found == 0) {
    80202120:	000c1a63          	bnez	s8,80202134 <scheduler+0xc8>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202124:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202128:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020212c:	10079073          	csrw	sstatus,a5
      asm volatile("wfi");
    80202130:	10500073          	wfi
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202134:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202138:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8020213c:	10079073          	csrw	sstatus,a5
    int found = 0;
    80202140:	4c01                	li	s8,0
    for(p = proc; p < &proc[NPROC]; p++) {
    80202142:	00012497          	auipc	s1,0x12
    80202146:	03e48493          	addi	s1,s1,62 # 80214180 <proc>
      if(p->state == RUNNABLE) {
    8020214a:	4989                	li	s3,2
    for(p = proc; p < &proc[NPROC]; p++) {
    8020214c:	00017917          	auipc	s2,0x17
    80202150:	9a490913          	addi	s2,s2,-1628 # 80218af0 <bcache>
    80202154:	bfb5                	j	802020d0 <scheduler+0x64>

0000000080202156 <sched>:
{
    80202156:	7179                	addi	sp,sp,-48
    80202158:	f406                	sd	ra,40(sp)
    8020215a:	f022                	sd	s0,32(sp)
    8020215c:	ec26                	sd	s1,24(sp)
    8020215e:	e84a                	sd	s2,16(sp)
    80202160:	e44e                	sd	s3,8(sp)
    80202162:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    80202164:	00000097          	auipc	ra,0x0
    80202168:	974080e7          	jalr	-1676(ra) # 80201ad8 <myproc>
    8020216c:	84aa                	mv	s1,a0
  if(!holding(&p->lock))
    8020216e:	ffffe097          	auipc	ra,0xffffe
    80202172:	558080e7          	jalr	1368(ra) # 802006c6 <holding>
    80202176:	c93d                	beqz	a0,802021ec <sched+0x96>
  asm volatile("mv %0, tp" : "=r" (x) );
    80202178:	8792                	mv	a5,tp
  if(mycpu()->noff != 1)
    8020217a:	2781                	sext.w	a5,a5
    8020217c:	079e                	slli	a5,a5,0x7
    8020217e:	00012717          	auipc	a4,0x12
    80202182:	ee270713          	addi	a4,a4,-286 # 80214060 <pid_lock>
    80202186:	97ba                	add	a5,a5,a4
    80202188:	0907a703          	lw	a4,144(a5)
    8020218c:	4785                	li	a5,1
    8020218e:	06f71763          	bne	a4,a5,802021fc <sched+0xa6>
  if(p->state == RUNNING)
    80202192:	4c98                	lw	a4,24(s1)
    80202194:	478d                	li	a5,3
    80202196:	06f70b63          	beq	a4,a5,8020220c <sched+0xb6>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8020219a:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    8020219e:	8b89                	andi	a5,a5,2
  if(intr_get())
    802021a0:	efb5                	bnez	a5,8020221c <sched+0xc6>
  asm volatile("mv %0, tp" : "=r" (x) );
    802021a2:	8792                	mv	a5,tp
  intena = mycpu()->intena;
    802021a4:	00012917          	auipc	s2,0x12
    802021a8:	ebc90913          	addi	s2,s2,-324 # 80214060 <pid_lock>
    802021ac:	2781                	sext.w	a5,a5
    802021ae:	079e                	slli	a5,a5,0x7
    802021b0:	97ca                	add	a5,a5,s2
    802021b2:	0947a983          	lw	s3,148(a5)
    802021b6:	8792                	mv	a5,tp
  swtch(&p->context, &mycpu()->context);
    802021b8:	2781                	sext.w	a5,a5
    802021ba:	079e                	slli	a5,a5,0x7
    802021bc:	00012597          	auipc	a1,0x12
    802021c0:	ec458593          	addi	a1,a1,-316 # 80214080 <cpus+0x8>
    802021c4:	95be                	add	a1,a1,a5
    802021c6:	06848513          	addi	a0,s1,104
    802021ca:	00000097          	auipc	ra,0x0
    802021ce:	794080e7          	jalr	1940(ra) # 8020295e <swtch>
    802021d2:	8792                	mv	a5,tp
  mycpu()->intena = intena;
    802021d4:	2781                	sext.w	a5,a5
    802021d6:	079e                	slli	a5,a5,0x7
    802021d8:	993e                	add	s2,s2,a5
    802021da:	09392a23          	sw	s3,148(s2)
}
    802021de:	70a2                	ld	ra,40(sp)
    802021e0:	7402                	ld	s0,32(sp)
    802021e2:	64e2                	ld	s1,24(sp)
    802021e4:	6942                	ld	s2,16(sp)
    802021e6:	69a2                	ld	s3,8(sp)
    802021e8:	6145                	addi	sp,sp,48
    802021ea:	8082                	ret
    panic("sched p->lock");
    802021ec:	00007517          	auipc	a0,0x7
    802021f0:	4e450513          	addi	a0,a0,1252 # 802096d0 <digits+0x350>
    802021f4:	ffffe097          	auipc	ra,0xffffe
    802021f8:	f50080e7          	jalr	-176(ra) # 80200144 <panic>
    panic("sched locks");
    802021fc:	00007517          	auipc	a0,0x7
    80202200:	4e450513          	addi	a0,a0,1252 # 802096e0 <digits+0x360>
    80202204:	ffffe097          	auipc	ra,0xffffe
    80202208:	f40080e7          	jalr	-192(ra) # 80200144 <panic>
    panic("sched running");
    8020220c:	00007517          	auipc	a0,0x7
    80202210:	4e450513          	addi	a0,a0,1252 # 802096f0 <digits+0x370>
    80202214:	ffffe097          	auipc	ra,0xffffe
    80202218:	f30080e7          	jalr	-208(ra) # 80200144 <panic>
    panic("sched interruptible");
    8020221c:	00007517          	auipc	a0,0x7
    80202220:	4e450513          	addi	a0,a0,1252 # 80209700 <digits+0x380>
    80202224:	ffffe097          	auipc	ra,0xffffe
    80202228:	f20080e7          	jalr	-224(ra) # 80200144 <panic>

000000008020222c <exit>:
{
    8020222c:	7179                	addi	sp,sp,-48
    8020222e:	f406                	sd	ra,40(sp)
    80202230:	f022                	sd	s0,32(sp)
    80202232:	ec26                	sd	s1,24(sp)
    80202234:	e84a                	sd	s2,16(sp)
    80202236:	e44e                	sd	s3,8(sp)
    80202238:	e052                	sd	s4,0(sp)
    8020223a:	1800                	addi	s0,sp,48
    8020223c:	8a2a                	mv	s4,a0
  struct proc *p = myproc();
    8020223e:	00000097          	auipc	ra,0x0
    80202242:	89a080e7          	jalr	-1894(ra) # 80201ad8 <myproc>
    80202246:	89aa                	mv	s3,a0
  if(p == initproc)
    80202248:	00012797          	auipc	a5,0x12
    8020224c:	f307b783          	ld	a5,-208(a5) # 80214178 <initproc>
    80202250:	0d850493          	addi	s1,a0,216
    80202254:	15850913          	addi	s2,a0,344
    80202258:	02a79363          	bne	a5,a0,8020227e <exit+0x52>
    panic("init exiting");
    8020225c:	00007517          	auipc	a0,0x7
    80202260:	4bc50513          	addi	a0,a0,1212 # 80209718 <digits+0x398>
    80202264:	ffffe097          	auipc	ra,0xffffe
    80202268:	ee0080e7          	jalr	-288(ra) # 80200144 <panic>
      fileclose(f);
    8020226c:	00002097          	auipc	ra,0x2
    80202270:	8de080e7          	jalr	-1826(ra) # 80203b4a <fileclose>
      p->ofile[fd] = 0;
    80202274:	0004b023          	sd	zero,0(s1)
  for(int fd = 0; fd < NOFILE; fd++){
    80202278:	04a1                	addi	s1,s1,8
    8020227a:	01248563          	beq	s1,s2,80202284 <exit+0x58>
    if(p->ofile[fd]){
    8020227e:	6088                	ld	a0,0(s1)
    80202280:	f575                	bnez	a0,8020226c <exit+0x40>
    80202282:	bfdd                	j	80202278 <exit+0x4c>
  eput(p->cwd);
    80202284:	1589b503          	ld	a0,344(s3)
    80202288:	00004097          	auipc	ra,0x4
    8020228c:	3cc080e7          	jalr	972(ra) # 80206654 <eput>
  p->cwd = 0;
    80202290:	1409bc23          	sd	zero,344(s3)
  acquire(&initproc->lock);
    80202294:	00012497          	auipc	s1,0x12
    80202298:	dcc48493          	addi	s1,s1,-564 # 80214060 <pid_lock>
    8020229c:	1184b503          	ld	a0,280(s1)
    802022a0:	ffffe097          	auipc	ra,0xffffe
    802022a4:	454080e7          	jalr	1108(ra) # 802006f4 <acquire>
  wakeup1(initproc);
    802022a8:	1184b503          	ld	a0,280(s1)
    802022ac:	fffff097          	auipc	ra,0xfffff
    802022b0:	630080e7          	jalr	1584(ra) # 802018dc <wakeup1>
  release(&initproc->lock);
    802022b4:	1184b503          	ld	a0,280(s1)
    802022b8:	ffffe097          	auipc	ra,0xffffe
    802022bc:	490080e7          	jalr	1168(ra) # 80200748 <release>
  acquire(&p->lock);
    802022c0:	854e                	mv	a0,s3
    802022c2:	ffffe097          	auipc	ra,0xffffe
    802022c6:	432080e7          	jalr	1074(ra) # 802006f4 <acquire>
  struct proc *original_parent = p->parent;
    802022ca:	0209b483          	ld	s1,32(s3)
  release(&p->lock);
    802022ce:	854e                	mv	a0,s3
    802022d0:	ffffe097          	auipc	ra,0xffffe
    802022d4:	478080e7          	jalr	1144(ra) # 80200748 <release>
  acquire(&original_parent->lock);
    802022d8:	8526                	mv	a0,s1
    802022da:	ffffe097          	auipc	ra,0xffffe
    802022de:	41a080e7          	jalr	1050(ra) # 802006f4 <acquire>
  acquire(&p->lock);
    802022e2:	854e                	mv	a0,s3
    802022e4:	ffffe097          	auipc	ra,0xffffe
    802022e8:	410080e7          	jalr	1040(ra) # 802006f4 <acquire>
  reparent(p);
    802022ec:	854e                	mv	a0,s3
    802022ee:	00000097          	auipc	ra,0x0
    802022f2:	d18080e7          	jalr	-744(ra) # 80202006 <reparent>
  wakeup1(original_parent);
    802022f6:	8526                	mv	a0,s1
    802022f8:	fffff097          	auipc	ra,0xfffff
    802022fc:	5e4080e7          	jalr	1508(ra) # 802018dc <wakeup1>
  p->xstate = status;
    80202300:	0349aa23          	sw	s4,52(s3)
  p->state = ZOMBIE;
    80202304:	4791                	li	a5,4
    80202306:	00f9ac23          	sw	a5,24(s3)
  release(&original_parent->lock);
    8020230a:	8526                	mv	a0,s1
    8020230c:	ffffe097          	auipc	ra,0xffffe
    80202310:	43c080e7          	jalr	1084(ra) # 80200748 <release>
  sched();
    80202314:	00000097          	auipc	ra,0x0
    80202318:	e42080e7          	jalr	-446(ra) # 80202156 <sched>
  panic("zombie exit");
    8020231c:	00007517          	auipc	a0,0x7
    80202320:	40c50513          	addi	a0,a0,1036 # 80209728 <digits+0x3a8>
    80202324:	ffffe097          	auipc	ra,0xffffe
    80202328:	e20080e7          	jalr	-480(ra) # 80200144 <panic>

000000008020232c <yield>:
{
    8020232c:	1101                	addi	sp,sp,-32
    8020232e:	ec06                	sd	ra,24(sp)
    80202330:	e822                	sd	s0,16(sp)
    80202332:	e426                	sd	s1,8(sp)
    80202334:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80202336:	fffff097          	auipc	ra,0xfffff
    8020233a:	7a2080e7          	jalr	1954(ra) # 80201ad8 <myproc>
    8020233e:	84aa                	mv	s1,a0
  acquire(&p->lock);
    80202340:	ffffe097          	auipc	ra,0xffffe
    80202344:	3b4080e7          	jalr	948(ra) # 802006f4 <acquire>
  p->state = RUNNABLE;
    80202348:	4789                	li	a5,2
    8020234a:	cc9c                	sw	a5,24(s1)
  sched();
    8020234c:	00000097          	auipc	ra,0x0
    80202350:	e0a080e7          	jalr	-502(ra) # 80202156 <sched>
  release(&p->lock);
    80202354:	8526                	mv	a0,s1
    80202356:	ffffe097          	auipc	ra,0xffffe
    8020235a:	3f2080e7          	jalr	1010(ra) # 80200748 <release>
}
    8020235e:	60e2                	ld	ra,24(sp)
    80202360:	6442                	ld	s0,16(sp)
    80202362:	64a2                	ld	s1,8(sp)
    80202364:	6105                	addi	sp,sp,32
    80202366:	8082                	ret

0000000080202368 <sleep>:
{
    80202368:	7179                	addi	sp,sp,-48
    8020236a:	f406                	sd	ra,40(sp)
    8020236c:	f022                	sd	s0,32(sp)
    8020236e:	ec26                	sd	s1,24(sp)
    80202370:	e84a                	sd	s2,16(sp)
    80202372:	e44e                	sd	s3,8(sp)
    80202374:	1800                	addi	s0,sp,48
    80202376:	89aa                	mv	s3,a0
    80202378:	892e                	mv	s2,a1
  struct proc *p = myproc();
    8020237a:	fffff097          	auipc	ra,0xfffff
    8020237e:	75e080e7          	jalr	1886(ra) # 80201ad8 <myproc>
    80202382:	84aa                	mv	s1,a0
  if(lk != &p->lock){  //DOC: sleeplock0
    80202384:	05250663          	beq	a0,s2,802023d0 <sleep+0x68>
    acquire(&p->lock);  //DOC: sleeplock1
    80202388:	ffffe097          	auipc	ra,0xffffe
    8020238c:	36c080e7          	jalr	876(ra) # 802006f4 <acquire>
    release(lk);
    80202390:	854a                	mv	a0,s2
    80202392:	ffffe097          	auipc	ra,0xffffe
    80202396:	3b6080e7          	jalr	950(ra) # 80200748 <release>
  p->chan = chan;
    8020239a:	0334b423          	sd	s3,40(s1)
  p->state = SLEEPING;
    8020239e:	4785                	li	a5,1
    802023a0:	cc9c                	sw	a5,24(s1)
  sched();
    802023a2:	00000097          	auipc	ra,0x0
    802023a6:	db4080e7          	jalr	-588(ra) # 80202156 <sched>
  p->chan = 0;
    802023aa:	0204b423          	sd	zero,40(s1)
    release(&p->lock);
    802023ae:	8526                	mv	a0,s1
    802023b0:	ffffe097          	auipc	ra,0xffffe
    802023b4:	398080e7          	jalr	920(ra) # 80200748 <release>
    acquire(lk);
    802023b8:	854a                	mv	a0,s2
    802023ba:	ffffe097          	auipc	ra,0xffffe
    802023be:	33a080e7          	jalr	826(ra) # 802006f4 <acquire>
}
    802023c2:	70a2                	ld	ra,40(sp)
    802023c4:	7402                	ld	s0,32(sp)
    802023c6:	64e2                	ld	s1,24(sp)
    802023c8:	6942                	ld	s2,16(sp)
    802023ca:	69a2                	ld	s3,8(sp)
    802023cc:	6145                	addi	sp,sp,48
    802023ce:	8082                	ret
  p->chan = chan;
    802023d0:	03353423          	sd	s3,40(a0)
  p->state = SLEEPING;
    802023d4:	4785                	li	a5,1
    802023d6:	cd1c                	sw	a5,24(a0)
  sched();
    802023d8:	00000097          	auipc	ra,0x0
    802023dc:	d7e080e7          	jalr	-642(ra) # 80202156 <sched>
  p->chan = 0;
    802023e0:	0204b423          	sd	zero,40(s1)
  if(lk != &p->lock){
    802023e4:	bff9                	j	802023c2 <sleep+0x5a>

00000000802023e6 <wait>:
{
    802023e6:	715d                	addi	sp,sp,-80
    802023e8:	e486                	sd	ra,72(sp)
    802023ea:	e0a2                	sd	s0,64(sp)
    802023ec:	fc26                	sd	s1,56(sp)
    802023ee:	f84a                	sd	s2,48(sp)
    802023f0:	f44e                	sd	s3,40(sp)
    802023f2:	f052                	sd	s4,32(sp)
    802023f4:	ec56                	sd	s5,24(sp)
    802023f6:	e85a                	sd	s6,16(sp)
    802023f8:	e45e                	sd	s7,8(sp)
    802023fa:	0880                	addi	s0,sp,80
    802023fc:	8b2a                	mv	s6,a0
  struct proc *p = myproc();
    802023fe:	fffff097          	auipc	ra,0xfffff
    80202402:	6da080e7          	jalr	1754(ra) # 80201ad8 <myproc>
    80202406:	892a                	mv	s2,a0
  acquire(&p->lock);
    80202408:	ffffe097          	auipc	ra,0xffffe
    8020240c:	2ec080e7          	jalr	748(ra) # 802006f4 <acquire>
    havekids = 0;
    80202410:	4b81                	li	s7,0
        if(np->state == ZOMBIE){
    80202412:	4a11                	li	s4,4
        havekids = 1;
    80202414:	4a85                	li	s5,1
    for(np = proc; np < &proc[NPROC]; np++){
    80202416:	00016997          	auipc	s3,0x16
    8020241a:	6da98993          	addi	s3,s3,1754 # 80218af0 <bcache>
    havekids = 0;
    8020241e:	875e                	mv	a4,s7
    for(np = proc; np < &proc[NPROC]; np++){
    80202420:	00012497          	auipc	s1,0x12
    80202424:	d6048493          	addi	s1,s1,-672 # 80214180 <proc>
    80202428:	a8b9                	j	80202486 <wait+0xa0>
          pid = np->pid;
    8020242a:	0384a983          	lw	s3,56(s1)
          if(addr != 0 && copyout2(addr, (char *)&np->xstate, sizeof(np->xstate)) < 0) {
    8020242e:	000b0c63          	beqz	s6,80202446 <wait+0x60>
    80202432:	4611                	li	a2,4
    80202434:	03448593          	addi	a1,s1,52
    80202438:	855a                	mv	a0,s6
    8020243a:	fffff097          	auipc	ra,0xfffff
    8020243e:	fc4080e7          	jalr	-60(ra) # 802013fe <copyout2>
    80202442:	02054263          	bltz	a0,80202466 <wait+0x80>
          freeproc(np);
    80202446:	8526                	mv	a0,s1
    80202448:	00000097          	auipc	ra,0x0
    8020244c:	862080e7          	jalr	-1950(ra) # 80201caa <freeproc>
          release(&np->lock);
    80202450:	8526                	mv	a0,s1
    80202452:	ffffe097          	auipc	ra,0xffffe
    80202456:	2f6080e7          	jalr	758(ra) # 80200748 <release>
          release(&p->lock);
    8020245a:	854a                	mv	a0,s2
    8020245c:	ffffe097          	auipc	ra,0xffffe
    80202460:	2ec080e7          	jalr	748(ra) # 80200748 <release>
          return pid;
    80202464:	a8a9                	j	802024be <wait+0xd8>
            release(&np->lock);
    80202466:	8526                	mv	a0,s1
    80202468:	ffffe097          	auipc	ra,0xffffe
    8020246c:	2e0080e7          	jalr	736(ra) # 80200748 <release>
            release(&p->lock);
    80202470:	854a                	mv	a0,s2
    80202472:	ffffe097          	auipc	ra,0xffffe
    80202476:	2d6080e7          	jalr	726(ra) # 80200748 <release>
            return -1;
    8020247a:	59fd                	li	s3,-1
    8020247c:	a089                	j	802024be <wait+0xd8>
    for(np = proc; np < &proc[NPROC]; np++){
    8020247e:	17848493          	addi	s1,s1,376
    80202482:	03348463          	beq	s1,s3,802024aa <wait+0xc4>
      if(np->parent == p){
    80202486:	709c                	ld	a5,32(s1)
    80202488:	ff279be3          	bne	a5,s2,8020247e <wait+0x98>
        acquire(&np->lock);
    8020248c:	8526                	mv	a0,s1
    8020248e:	ffffe097          	auipc	ra,0xffffe
    80202492:	266080e7          	jalr	614(ra) # 802006f4 <acquire>
        if(np->state == ZOMBIE){
    80202496:	4c9c                	lw	a5,24(s1)
    80202498:	f94789e3          	beq	a5,s4,8020242a <wait+0x44>
        release(&np->lock);
    8020249c:	8526                	mv	a0,s1
    8020249e:	ffffe097          	auipc	ra,0xffffe
    802024a2:	2aa080e7          	jalr	682(ra) # 80200748 <release>
        havekids = 1;
    802024a6:	8756                	mv	a4,s5
    802024a8:	bfd9                	j	8020247e <wait+0x98>
    if(!havekids || p->killed){
    802024aa:	c701                	beqz	a4,802024b2 <wait+0xcc>
    802024ac:	03092783          	lw	a5,48(s2)
    802024b0:	c39d                	beqz	a5,802024d6 <wait+0xf0>
      release(&p->lock);
    802024b2:	854a                	mv	a0,s2
    802024b4:	ffffe097          	auipc	ra,0xffffe
    802024b8:	294080e7          	jalr	660(ra) # 80200748 <release>
      return -1;
    802024bc:	59fd                	li	s3,-1
}
    802024be:	854e                	mv	a0,s3
    802024c0:	60a6                	ld	ra,72(sp)
    802024c2:	6406                	ld	s0,64(sp)
    802024c4:	74e2                	ld	s1,56(sp)
    802024c6:	7942                	ld	s2,48(sp)
    802024c8:	79a2                	ld	s3,40(sp)
    802024ca:	7a02                	ld	s4,32(sp)
    802024cc:	6ae2                	ld	s5,24(sp)
    802024ce:	6b42                	ld	s6,16(sp)
    802024d0:	6ba2                	ld	s7,8(sp)
    802024d2:	6161                	addi	sp,sp,80
    802024d4:	8082                	ret
    sleep(p, &p->lock);  //DOC: wait-sleep
    802024d6:	85ca                	mv	a1,s2
    802024d8:	854a                	mv	a0,s2
    802024da:	00000097          	auipc	ra,0x0
    802024de:	e8e080e7          	jalr	-370(ra) # 80202368 <sleep>
    havekids = 0;
    802024e2:	bf35                	j	8020241e <wait+0x38>

00000000802024e4 <wakeup>:
{
    802024e4:	7139                	addi	sp,sp,-64
    802024e6:	fc06                	sd	ra,56(sp)
    802024e8:	f822                	sd	s0,48(sp)
    802024ea:	f426                	sd	s1,40(sp)
    802024ec:	f04a                	sd	s2,32(sp)
    802024ee:	ec4e                	sd	s3,24(sp)
    802024f0:	e852                	sd	s4,16(sp)
    802024f2:	e456                	sd	s5,8(sp)
    802024f4:	0080                	addi	s0,sp,64
    802024f6:	8a2a                	mv	s4,a0
  for(p = proc; p < &proc[NPROC]; p++) {
    802024f8:	00012497          	auipc	s1,0x12
    802024fc:	c8848493          	addi	s1,s1,-888 # 80214180 <proc>
    if(p->state == SLEEPING && p->chan == chan) {
    80202500:	4985                	li	s3,1
      p->state = RUNNABLE;
    80202502:	4a89                	li	s5,2
  for(p = proc; p < &proc[NPROC]; p++) {
    80202504:	00016917          	auipc	s2,0x16
    80202508:	5ec90913          	addi	s2,s2,1516 # 80218af0 <bcache>
    8020250c:	a811                	j	80202520 <wakeup+0x3c>
    release(&p->lock);
    8020250e:	8526                	mv	a0,s1
    80202510:	ffffe097          	auipc	ra,0xffffe
    80202514:	238080e7          	jalr	568(ra) # 80200748 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80202518:	17848493          	addi	s1,s1,376
    8020251c:	03248063          	beq	s1,s2,8020253c <wakeup+0x58>
    acquire(&p->lock);
    80202520:	8526                	mv	a0,s1
    80202522:	ffffe097          	auipc	ra,0xffffe
    80202526:	1d2080e7          	jalr	466(ra) # 802006f4 <acquire>
    if(p->state == SLEEPING && p->chan == chan) {
    8020252a:	4c9c                	lw	a5,24(s1)
    8020252c:	ff3791e3          	bne	a5,s3,8020250e <wakeup+0x2a>
    80202530:	749c                	ld	a5,40(s1)
    80202532:	fd479ee3          	bne	a5,s4,8020250e <wakeup+0x2a>
      p->state = RUNNABLE;
    80202536:	0154ac23          	sw	s5,24(s1)
    8020253a:	bfd1                	j	8020250e <wakeup+0x2a>
}
    8020253c:	70e2                	ld	ra,56(sp)
    8020253e:	7442                	ld	s0,48(sp)
    80202540:	74a2                	ld	s1,40(sp)
    80202542:	7902                	ld	s2,32(sp)
    80202544:	69e2                	ld	s3,24(sp)
    80202546:	6a42                	ld	s4,16(sp)
    80202548:	6aa2                	ld	s5,8(sp)
    8020254a:	6121                	addi	sp,sp,64
    8020254c:	8082                	ret

000000008020254e <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    8020254e:	7179                	addi	sp,sp,-48
    80202550:	f406                	sd	ra,40(sp)
    80202552:	f022                	sd	s0,32(sp)
    80202554:	ec26                	sd	s1,24(sp)
    80202556:	e84a                	sd	s2,16(sp)
    80202558:	e44e                	sd	s3,8(sp)
    8020255a:	1800                	addi	s0,sp,48
    8020255c:	892a                	mv	s2,a0
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    8020255e:	00012497          	auipc	s1,0x12
    80202562:	c2248493          	addi	s1,s1,-990 # 80214180 <proc>
    80202566:	00016997          	auipc	s3,0x16
    8020256a:	58a98993          	addi	s3,s3,1418 # 80218af0 <bcache>
    acquire(&p->lock);
    8020256e:	8526                	mv	a0,s1
    80202570:	ffffe097          	auipc	ra,0xffffe
    80202574:	184080e7          	jalr	388(ra) # 802006f4 <acquire>
    if(p->pid == pid){
    80202578:	5c9c                	lw	a5,56(s1)
    8020257a:	01278d63          	beq	a5,s2,80202594 <kill+0x46>
        p->state = RUNNABLE;
      }
      release(&p->lock);
      return 0;
    }
    release(&p->lock);
    8020257e:	8526                	mv	a0,s1
    80202580:	ffffe097          	auipc	ra,0xffffe
    80202584:	1c8080e7          	jalr	456(ra) # 80200748 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80202588:	17848493          	addi	s1,s1,376
    8020258c:	ff3491e3          	bne	s1,s3,8020256e <kill+0x20>
  }
  return -1;
    80202590:	557d                	li	a0,-1
    80202592:	a821                	j	802025aa <kill+0x5c>
      p->killed = 1;
    80202594:	4785                	li	a5,1
    80202596:	d89c                	sw	a5,48(s1)
      if(p->state == SLEEPING){
    80202598:	4c98                	lw	a4,24(s1)
    8020259a:	00f70f63          	beq	a4,a5,802025b8 <kill+0x6a>
      release(&p->lock);
    8020259e:	8526                	mv	a0,s1
    802025a0:	ffffe097          	auipc	ra,0xffffe
    802025a4:	1a8080e7          	jalr	424(ra) # 80200748 <release>
      return 0;
    802025a8:	4501                	li	a0,0
}
    802025aa:	70a2                	ld	ra,40(sp)
    802025ac:	7402                	ld	s0,32(sp)
    802025ae:	64e2                	ld	s1,24(sp)
    802025b0:	6942                	ld	s2,16(sp)
    802025b2:	69a2                	ld	s3,8(sp)
    802025b4:	6145                	addi	sp,sp,48
    802025b6:	8082                	ret
        p->state = RUNNABLE;
    802025b8:	4789                	li	a5,2
    802025ba:	cc9c                	sw	a5,24(s1)
    802025bc:	b7cd                	j	8020259e <kill+0x50>

00000000802025be <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    802025be:	1101                	addi	sp,sp,-32
    802025c0:	ec06                	sd	ra,24(sp)
    802025c2:	e822                	sd	s0,16(sp)
    802025c4:	e426                	sd	s1,8(sp)
    802025c6:	1000                	addi	s0,sp,32
    802025c8:	84aa                	mv	s1,a0
    802025ca:	852e                	mv	a0,a1
    802025cc:	85b2                	mv	a1,a2
    802025ce:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_dst){
    802025d0:	c891                	beqz	s1,802025e4 <either_copyout+0x26>
    // return copyout(p->pagetable, dst, src, len);
    return copyout2(dst, src, len);
    802025d2:	fffff097          	auipc	ra,0xfffff
    802025d6:	e2c080e7          	jalr	-468(ra) # 802013fe <copyout2>
  } else {
    memmove((char *)dst, src, len);
    return 0;
  }
}
    802025da:	60e2                	ld	ra,24(sp)
    802025dc:	6442                	ld	s0,16(sp)
    802025de:	64a2                	ld	s1,8(sp)
    802025e0:	6105                	addi	sp,sp,32
    802025e2:	8082                	ret
    memmove((char *)dst, src, len);
    802025e4:	0006861b          	sext.w	a2,a3
    802025e8:	ffffe097          	auipc	ra,0xffffe
    802025ec:	204080e7          	jalr	516(ra) # 802007ec <memmove>
    return 0;
    802025f0:	8526                	mv	a0,s1
    802025f2:	b7e5                	j	802025da <either_copyout+0x1c>

00000000802025f4 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    802025f4:	1101                	addi	sp,sp,-32
    802025f6:	ec06                	sd	ra,24(sp)
    802025f8:	e822                	sd	s0,16(sp)
    802025fa:	e426                	sd	s1,8(sp)
    802025fc:	1000                	addi	s0,sp,32
    802025fe:	84ae                	mv	s1,a1
    80202600:	85b2                	mv	a1,a2
    80202602:	8636                	mv	a2,a3
  // struct proc *p = myproc();
  if(user_src){
    80202604:	c891                	beqz	s1,80202618 <either_copyin+0x24>
    // return copyin(p->pagetable, dst, src, len);
    return copyin2(dst, src, len);
    80202606:	fffff097          	auipc	ra,0xfffff
    8020260a:	ed8080e7          	jalr	-296(ra) # 802014de <copyin2>
  } else {
    memmove(dst, (char*)src, len);
    return 0;
  }
}
    8020260e:	60e2                	ld	ra,24(sp)
    80202610:	6442                	ld	s0,16(sp)
    80202612:	64a2                	ld	s1,8(sp)
    80202614:	6105                	addi	sp,sp,32
    80202616:	8082                	ret
    memmove(dst, (char*)src, len);
    80202618:	0006861b          	sext.w	a2,a3
    8020261c:	ffffe097          	auipc	ra,0xffffe
    80202620:	1d0080e7          	jalr	464(ra) # 802007ec <memmove>
    return 0;
    80202624:	8526                	mv	a0,s1
    80202626:	b7e5                	j	8020260e <either_copyin+0x1a>

0000000080202628 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80202628:	715d                	addi	sp,sp,-80
    8020262a:	e486                	sd	ra,72(sp)
    8020262c:	e0a2                	sd	s0,64(sp)
    8020262e:	fc26                	sd	s1,56(sp)
    80202630:	f84a                	sd	s2,48(sp)
    80202632:	f44e                	sd	s3,40(sp)
    80202634:	f052                	sd	s4,32(sp)
    80202636:	ec56                	sd	s5,24(sp)
    80202638:	e85a                	sd	s6,16(sp)
    8020263a:	e45e                	sd	s7,8(sp)
    8020263c:	0880                	addi	s0,sp,80
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\nPID\tSTATE\tNAME\tMEM\n");
    8020263e:	00007517          	auipc	a0,0x7
    80202642:	10250513          	addi	a0,a0,258 # 80209740 <digits+0x3c0>
    80202646:	ffffe097          	auipc	ra,0xffffe
    8020264a:	b48080e7          	jalr	-1208(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    8020264e:	00012497          	auipc	s1,0x12
    80202652:	c9248493          	addi	s1,s1,-878 # 802142e0 <proc+0x160>
    80202656:	00016917          	auipc	s2,0x16
    8020265a:	5fa90913          	addi	s2,s2,1530 # 80218c50 <bcache+0x160>
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8020265e:	4b11                	li	s6,4
      state = states[p->state];
    else
      state = "???";
    80202660:	00007997          	auipc	s3,0x7
    80202664:	0d898993          	addi	s3,s3,216 # 80209738 <digits+0x3b8>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    80202668:	00007a97          	auipc	s5,0x7
    8020266c:	0f0a8a93          	addi	s5,s5,240 # 80209758 <digits+0x3d8>
    printf("\n");
    80202670:	00007a17          	auipc	s4,0x7
    80202674:	a68a0a13          	addi	s4,s4,-1432 # 802090d8 <etext+0xd8>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80202678:	00008b97          	auipc	s7,0x8
    8020267c:	2a8b8b93          	addi	s7,s7,680 # 8020a920 <states.0>
    80202680:	a01d                	j	802026a6 <procdump+0x7e>
    printf("%d\t%s\t%s\t%d", p->pid, state, p->name, p->sz);
    80202682:	ee86b703          	ld	a4,-280(a3)
    80202686:	ed86a583          	lw	a1,-296(a3)
    8020268a:	8556                	mv	a0,s5
    8020268c:	ffffe097          	auipc	ra,0xffffe
    80202690:	b02080e7          	jalr	-1278(ra) # 8020018e <printf>
    printf("\n");
    80202694:	8552                	mv	a0,s4
    80202696:	ffffe097          	auipc	ra,0xffffe
    8020269a:	af8080e7          	jalr	-1288(ra) # 8020018e <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    8020269e:	17848493          	addi	s1,s1,376
    802026a2:	03248263          	beq	s1,s2,802026c6 <procdump+0x9e>
    if(p->state == UNUSED)
    802026a6:	86a6                	mv	a3,s1
    802026a8:	eb84a783          	lw	a5,-328(s1)
    802026ac:	dbed                	beqz	a5,8020269e <procdump+0x76>
      state = "???";
    802026ae:	864e                	mv	a2,s3
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    802026b0:	fcfb69e3          	bltu	s6,a5,80202682 <procdump+0x5a>
    802026b4:	02079713          	slli	a4,a5,0x20
    802026b8:	01d75793          	srli	a5,a4,0x1d
    802026bc:	97de                	add	a5,a5,s7
    802026be:	6390                	ld	a2,0(a5)
    802026c0:	f269                	bnez	a2,80202682 <procdump+0x5a>
      state = "???";
    802026c2:	864e                	mv	a2,s3
    802026c4:	bf7d                	j	80202682 <procdump+0x5a>
  }
}
    802026c6:	60a6                	ld	ra,72(sp)
    802026c8:	6406                	ld	s0,64(sp)
    802026ca:	74e2                	ld	s1,56(sp)
    802026cc:	7942                	ld	s2,48(sp)
    802026ce:	79a2                	ld	s3,40(sp)
    802026d0:	7a02                	ld	s4,32(sp)
    802026d2:	6ae2                	ld	s5,24(sp)
    802026d4:	6b42                	ld	s6,16(sp)
    802026d6:	6ba2                	ld	s7,8(sp)
    802026d8:	6161                	addi	sp,sp,80
    802026da:	8082                	ret

00000000802026dc <procnum>:

uint64
procnum(void)
{
    802026dc:	1141                	addi	sp,sp,-16
    802026de:	e422                	sd	s0,8(sp)
    802026e0:	0800                	addi	s0,sp,16
  int num = 0;
  struct proc *p;

  for (p = proc; p < &proc[NPROC]; p++) {
    802026e2:	00012797          	auipc	a5,0x12
    802026e6:	a9e78793          	addi	a5,a5,-1378 # 80214180 <proc>
  int num = 0;
    802026ea:	4501                	li	a0,0
  for (p = proc; p < &proc[NPROC]; p++) {
    802026ec:	00016697          	auipc	a3,0x16
    802026f0:	40468693          	addi	a3,a3,1028 # 80218af0 <bcache>
    802026f4:	a029                	j	802026fe <procnum+0x22>
    802026f6:	17878793          	addi	a5,a5,376
    802026fa:	00d78663          	beq	a5,a3,80202706 <procnum+0x2a>
    if (p->state != UNUSED) {
    802026fe:	4f98                	lw	a4,24(a5)
    80202700:	db7d                	beqz	a4,802026f6 <procnum+0x1a>
      num++;
    80202702:	2505                	addiw	a0,a0,1
    80202704:	bfcd                	j	802026f6 <procnum+0x1a>
    }
  }

  return num;
}
    80202706:	6422                	ld	s0,8(sp)
    80202708:	0141                	addi	sp,sp,16
    8020270a:	8082                	ret

000000008020270c <clone>:

uint64
clone(void)
{
    8020270c:	7139                	addi	sp,sp,-64
    8020270e:	fc06                	sd	ra,56(sp)
    80202710:	f822                	sd	s0,48(sp)
    80202712:	f426                	sd	s1,40(sp)
    80202714:	f04a                	sd	s2,32(sp)
    80202716:	ec4e                	sd	s3,24(sp)
    80202718:	e852                	sd	s4,16(sp)
    8020271a:	e456                	sd	s5,8(sp)
    8020271c:	0080                	addi	s0,sp,64
  struct proc *np;
  struct proc *p = myproc();
    8020271e:	fffff097          	auipc	ra,0xfffff
    80202722:	3ba080e7          	jalr	954(ra) # 80201ad8 <myproc>
    80202726:	8aaa                	mv	s5,a0
  int pid;

  if((np = allocproc()) == NULL){
    80202728:	fffff097          	auipc	ra,0xfffff
    8020272c:	5ec080e7          	jalr	1516(ra) # 80201d14 <allocproc>
    80202730:	10050863          	beqz	a0,80202840 <clone+0x134>
    80202734:	89aa                	mv	s3,a0
    return -1;
  }
   // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, np->kpagetable, p->sz) < 0){
    80202736:	048ab683          	ld	a3,72(s5)
    8020273a:	6d30                	ld	a2,88(a0)
    8020273c:	692c                	ld	a1,80(a0)
    8020273e:	050ab503          	ld	a0,80(s5)
    80202742:	fffff097          	auipc	ra,0xfffff
    80202746:	af0080e7          	jalr	-1296(ra) # 80201232 <uvmcopy>
    8020274a:	06054d63          	bltz	a0,802027c4 <clone+0xb8>
    freeproc(np);
    release(&np->lock);
    return -1;
  }
  np->sz = p->sz;
    8020274e:	048ab783          	ld	a5,72(s5)
    80202752:	04f9b423          	sd	a5,72(s3)
  np->parent = p;
    80202756:	0359b023          	sd	s5,32(s3)
  
  // copy tracing mask from parent.
  np->tmask = p->tmask;
    8020275a:	170aa783          	lw	a5,368(s5)
    8020275e:	16f9a823          	sw	a5,368(s3)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80202762:	060ab683          	ld	a3,96(s5)
    80202766:	87b6                	mv	a5,a3
    80202768:	0609b703          	ld	a4,96(s3)
    8020276c:	12068693          	addi	a3,a3,288
    80202770:	0007b803          	ld	a6,0(a5)
    80202774:	6788                	ld	a0,8(a5)
    80202776:	6b8c                	ld	a1,16(a5)
    80202778:	6f90                	ld	a2,24(a5)
    8020277a:	01073023          	sd	a6,0(a4)
    8020277e:	e708                	sd	a0,8(a4)
    80202780:	eb0c                	sd	a1,16(a4)
    80202782:	ef10                	sd	a2,24(a4)
    80202784:	02078793          	addi	a5,a5,32
    80202788:	02070713          	addi	a4,a4,32
    8020278c:	fed792e3          	bne	a5,a3,80202770 <clone+0x64>

  uint64 stack = p->trapframe->a1;
    80202790:	060ab783          	ld	a5,96(s5)
    80202794:	7fbc                	ld	a5,120(a5)
  if(stack!=0){
    80202796:	cf81                	beqz	a5,802027ae <clone+0xa2>
    uint64 fn = *((uint64 *)((char *)(p->trapframe->a1)));
    80202798:	6394                	ld	a3,0(a5)
    uint64 arg = *((uint64 *)((char *)(p->trapframe->a1) + 8));
    8020279a:	6798                	ld	a4,8(a5)
    // 修改栈指针
    np->trapframe->sp = stack;
    8020279c:	0609b603          	ld	a2,96(s3)
    802027a0:	fa1c                	sd	a5,48(a2)
    // 修改进程程序计数器
    np->trapframe->epc = fn;
    802027a2:	0609b783          	ld	a5,96(s3)
    802027a6:	ef94                	sd	a3,24(a5)
    // 设置参数
    np->trapframe->a0 = arg;
    802027a8:	0609b783          	ld	a5,96(s3)
    802027ac:	fbb8                	sd	a4,112(a5)
  }
  // Cause clone to return 0 in the child. 
  np->trapframe->a0 = 0;
    802027ae:	0609b783          	ld	a5,96(s3)
    802027b2:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(int i = 0; i < NOFILE; i++)
    802027b6:	0d8a8493          	addi	s1,s5,216
    802027ba:	0d898913          	addi	s2,s3,216
    802027be:	158a8a13          	addi	s4,s5,344
    802027c2:	a00d                	j	802027e4 <clone+0xd8>
    freeproc(np);
    802027c4:	854e                	mv	a0,s3
    802027c6:	fffff097          	auipc	ra,0xfffff
    802027ca:	4e4080e7          	jalr	1252(ra) # 80201caa <freeproc>
    release(&np->lock);
    802027ce:	854e                	mv	a0,s3
    802027d0:	ffffe097          	auipc	ra,0xffffe
    802027d4:	f78080e7          	jalr	-136(ra) # 80200748 <release>
    return -1;
    802027d8:	557d                	li	a0,-1
    802027da:	a891                	j	8020282e <clone+0x122>
  for(int i = 0; i < NOFILE; i++)
    802027dc:	04a1                	addi	s1,s1,8
    802027de:	0921                	addi	s2,s2,8
    802027e0:	01448b63          	beq	s1,s4,802027f6 <clone+0xea>
    if(p->ofile[i])
    802027e4:	6088                	ld	a0,0(s1)
    802027e6:	d97d                	beqz	a0,802027dc <clone+0xd0>
      np->ofile[i] = filedup(p->ofile[i]);
    802027e8:	00001097          	auipc	ra,0x1
    802027ec:	310080e7          	jalr	784(ra) # 80203af8 <filedup>
    802027f0:	00a93023          	sd	a0,0(s2)
    802027f4:	b7e5                	j	802027dc <clone+0xd0>
  np->cwd = edup(p->cwd);
    802027f6:	158ab503          	ld	a0,344(s5)
    802027fa:	00004097          	auipc	ra,0x4
    802027fe:	b78080e7          	jalr	-1160(ra) # 80206372 <edup>
    80202802:	14a9bc23          	sd	a0,344(s3)
  safestrcpy(np->name, p->name, sizeof(p->name));
    80202806:	4641                	li	a2,16
    80202808:	160a8593          	addi	a1,s5,352
    8020280c:	16098513          	addi	a0,s3,352
    80202810:	ffffe097          	auipc	ra,0xffffe
    80202814:	0d2080e7          	jalr	210(ra) # 802008e2 <safestrcpy>
  pid = np->pid;
    80202818:	0389a483          	lw	s1,56(s3)
  np->state = RUNNABLE;
    8020281c:	4789                	li	a5,2
    8020281e:	00f9ac23          	sw	a5,24(s3)
  release(&np->lock);
    80202822:	854e                	mv	a0,s3
    80202824:	ffffe097          	auipc	ra,0xffffe
    80202828:	f24080e7          	jalr	-220(ra) # 80200748 <release>
  return pid;
    8020282c:	8526                	mv	a0,s1
}
    8020282e:	70e2                	ld	ra,56(sp)
    80202830:	7442                	ld	s0,48(sp)
    80202832:	74a2                	ld	s1,40(sp)
    80202834:	7902                	ld	s2,32(sp)
    80202836:	69e2                	ld	s3,24(sp)
    80202838:	6a42                	ld	s4,16(sp)
    8020283a:	6aa2                	ld	s5,8(sp)
    8020283c:	6121                	addi	sp,sp,64
    8020283e:	8082                	ret
    return -1;
    80202840:	557d                	li	a0,-1
    80202842:	b7f5                	j	8020282e <clone+0x122>

0000000080202844 <waitpid>:


int
waitpid(int upid, uint64 addr)
{
    80202844:	7159                	addi	sp,sp,-112
    80202846:	f486                	sd	ra,104(sp)
    80202848:	f0a2                	sd	s0,96(sp)
    8020284a:	eca6                	sd	s1,88(sp)
    8020284c:	e8ca                	sd	s2,80(sp)
    8020284e:	e4ce                	sd	s3,72(sp)
    80202850:	e0d2                	sd	s4,64(sp)
    80202852:	fc56                	sd	s5,56(sp)
    80202854:	f85a                	sd	s6,48(sp)
    80202856:	f45e                	sd	s7,40(sp)
    80202858:	f062                	sd	s8,32(sp)
    8020285a:	ec66                	sd	s9,24(sp)
    8020285c:	1880                	addi	s0,sp,112
    8020285e:	8a2a                	mv	s4,a0
    80202860:	8c2e                	mv	s8,a1
  struct proc *np;
  int havekids, pid;
  struct proc *p = myproc();
    80202862:	fffff097          	auipc	ra,0xfffff
    80202866:	276080e7          	jalr	630(ra) # 80201ad8 <myproc>
    8020286a:	892a                	mv	s2,a0
  int status;

  // hold p->lock for the whole time to avoid lost
  // wakeups from a child's exit().
  acquire(&p->lock);
    8020286c:	ffffe097          	auipc	ra,0xffffe
    80202870:	e88080e7          	jalr	-376(ra) # 802006f4 <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80202874:	4c81                	li	s9,0
      if(np->parent == p){
        // np->parent can't change between the check and the acquire()
        // because only the parent changes it, and we're the parent.
        acquire(&np->lock);
        havekids = 1;
       if(np->state == ZOMBIE && (np->pid == upid || upid == -1)){
    80202876:	4a91                	li	s5,4
        havekids = 1;
    80202878:	4b05                	li	s6,1
       if(np->state == ZOMBIE && (np->pid == upid || upid == -1)){
    8020287a:	5bfd                	li	s7,-1
    for(np = proc; np < &proc[NPROC]; np++){
    8020287c:	00016997          	auipc	s3,0x16
    80202880:	27498993          	addi	s3,s3,628 # 80218af0 <bcache>
    havekids = 0;
    80202884:	8766                	mv	a4,s9
    for(np = proc; np < &proc[NPROC]; np++){
    80202886:	00012497          	auipc	s1,0x12
    8020288a:	8fa48493          	addi	s1,s1,-1798 # 80214180 <proc>
    8020288e:	a03d                	j	802028bc <waitpid+0x78>
          // Found one.
          pid = np->pid;
          status = np->xstate << 8; // note

          if(addr != 0 && copyout2(addr, (char *)&status, sizeof(status)) < 0) {
            release(&np->lock);
    80202890:	8526                	mv	a0,s1
    80202892:	ffffe097          	auipc	ra,0xffffe
    80202896:	eb6080e7          	jalr	-330(ra) # 80200748 <release>
            release(&p->lock);
    8020289a:	854a                	mv	a0,s2
    8020289c:	ffffe097          	auipc	ra,0xffffe
    802028a0:	eac080e7          	jalr	-340(ra) # 80200748 <release>
            return -1;
    802028a4:	557d                	li	a0,-1
    802028a6:	a841                	j	80202936 <waitpid+0xf2>
          freeproc(np);
          release(&np->lock);
          release(&p->lock);
          return pid;
        }
        release(&np->lock);
    802028a8:	8526                	mv	a0,s1
    802028aa:	ffffe097          	auipc	ra,0xffffe
    802028ae:	e9e080e7          	jalr	-354(ra) # 80200748 <release>
        havekids = 1;
    802028b2:	875a                	mv	a4,s6
    for(np = proc; np < &proc[NPROC]; np++){
    802028b4:	17848493          	addi	s1,s1,376
    802028b8:	07348563          	beq	s1,s3,80202922 <waitpid+0xde>
      if(np->parent == p){
    802028bc:	709c                	ld	a5,32(s1)
    802028be:	ff279be3          	bne	a5,s2,802028b4 <waitpid+0x70>
        acquire(&np->lock);
    802028c2:	8526                	mv	a0,s1
    802028c4:	ffffe097          	auipc	ra,0xffffe
    802028c8:	e30080e7          	jalr	-464(ra) # 802006f4 <acquire>
       if(np->state == ZOMBIE && (np->pid == upid || upid == -1)){
    802028cc:	4c9c                	lw	a5,24(s1)
    802028ce:	fd579de3          	bne	a5,s5,802028a8 <waitpid+0x64>
    802028d2:	5c9c                	lw	a5,56(s1)
    802028d4:	01478563          	beq	a5,s4,802028de <waitpid+0x9a>
    802028d8:	fd7a18e3          	bne	s4,s7,802028a8 <waitpid+0x64>
    802028dc:	8a3e                	mv	s4,a5
          status = np->xstate << 8; // note
    802028de:	58dc                	lw	a5,52(s1)
    802028e0:	0087979b          	slliw	a5,a5,0x8
    802028e4:	f8f42e23          	sw	a5,-100(s0)
          if(addr != 0 && copyout2(addr, (char *)&status, sizeof(status)) < 0) {
    802028e8:	000c0c63          	beqz	s8,80202900 <waitpid+0xbc>
    802028ec:	4611                	li	a2,4
    802028ee:	f9c40593          	addi	a1,s0,-100
    802028f2:	8562                	mv	a0,s8
    802028f4:	fffff097          	auipc	ra,0xfffff
    802028f8:	b0a080e7          	jalr	-1270(ra) # 802013fe <copyout2>
    802028fc:	f8054ae3          	bltz	a0,80202890 <waitpid+0x4c>
          freeproc(np);
    80202900:	8526                	mv	a0,s1
    80202902:	fffff097          	auipc	ra,0xfffff
    80202906:	3a8080e7          	jalr	936(ra) # 80201caa <freeproc>
          release(&np->lock);
    8020290a:	8526                	mv	a0,s1
    8020290c:	ffffe097          	auipc	ra,0xffffe
    80202910:	e3c080e7          	jalr	-452(ra) # 80200748 <release>
          release(&p->lock);
    80202914:	854a                	mv	a0,s2
    80202916:	ffffe097          	auipc	ra,0xffffe
    8020291a:	e32080e7          	jalr	-462(ra) # 80200748 <release>
          return pid;
    8020291e:	8552                	mv	a0,s4
    80202920:	a819                	j	80202936 <waitpid+0xf2>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || p->killed){
    80202922:	c701                	beqz	a4,8020292a <waitpid+0xe6>
    80202924:	03092783          	lw	a5,48(s2)
    80202928:	c785                	beqz	a5,80202950 <waitpid+0x10c>
      release(&p->lock);
    8020292a:	854a                	mv	a0,s2
    8020292c:	ffffe097          	auipc	ra,0xffffe
    80202930:	e1c080e7          	jalr	-484(ra) # 80200748 <release>
      return -1;
    80202934:	557d                	li	a0,-1
    }
    
    // Wait for a child to exit.
    sleep(p, &p->lock);  //DOC: wait-sleep
  }
}
    80202936:	70a6                	ld	ra,104(sp)
    80202938:	7406                	ld	s0,96(sp)
    8020293a:	64e6                	ld	s1,88(sp)
    8020293c:	6946                	ld	s2,80(sp)
    8020293e:	69a6                	ld	s3,72(sp)
    80202940:	6a06                	ld	s4,64(sp)
    80202942:	7ae2                	ld	s5,56(sp)
    80202944:	7b42                	ld	s6,48(sp)
    80202946:	7ba2                	ld	s7,40(sp)
    80202948:	7c02                	ld	s8,32(sp)
    8020294a:	6ce2                	ld	s9,24(sp)
    8020294c:	6165                	addi	sp,sp,112
    8020294e:	8082                	ret
    sleep(p, &p->lock);  //DOC: wait-sleep
    80202950:	85ca                	mv	a1,s2
    80202952:	854a                	mv	a0,s2
    80202954:	00000097          	auipc	ra,0x0
    80202958:	a14080e7          	jalr	-1516(ra) # 80202368 <sleep>
    havekids = 0;
    8020295c:	b725                	j	80202884 <waitpid+0x40>

000000008020295e <swtch>:
    8020295e:	00153023          	sd	ra,0(a0)
    80202962:	00253423          	sd	sp,8(a0)
    80202966:	e900                	sd	s0,16(a0)
    80202968:	ed04                	sd	s1,24(a0)
    8020296a:	03253023          	sd	s2,32(a0)
    8020296e:	03353423          	sd	s3,40(a0)
    80202972:	03453823          	sd	s4,48(a0)
    80202976:	03553c23          	sd	s5,56(a0)
    8020297a:	05653023          	sd	s6,64(a0)
    8020297e:	05753423          	sd	s7,72(a0)
    80202982:	05853823          	sd	s8,80(a0)
    80202986:	05953c23          	sd	s9,88(a0)
    8020298a:	07a53023          	sd	s10,96(a0)
    8020298e:	07b53423          	sd	s11,104(a0)
    80202992:	0005b083          	ld	ra,0(a1)
    80202996:	0085b103          	ld	sp,8(a1)
    8020299a:	6980                	ld	s0,16(a1)
    8020299c:	6d84                	ld	s1,24(a1)
    8020299e:	0205b903          	ld	s2,32(a1)
    802029a2:	0285b983          	ld	s3,40(a1)
    802029a6:	0305ba03          	ld	s4,48(a1)
    802029aa:	0385ba83          	ld	s5,56(a1)
    802029ae:	0405bb03          	ld	s6,64(a1)
    802029b2:	0485bb83          	ld	s7,72(a1)
    802029b6:	0505bc03          	ld	s8,80(a1)
    802029ba:	0585bc83          	ld	s9,88(a1)
    802029be:	0605bd03          	ld	s10,96(a1)
    802029c2:	0685bd83          	ld	s11,104(a1)
    802029c6:	8082                	ret

00000000802029c8 <trapinithart>:
// }

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    802029c8:	1141                	addi	sp,sp,-16
    802029ca:	e406                	sd	ra,8(sp)
    802029cc:	e022                	sd	s0,0(sp)
    802029ce:	0800                	addi	s0,sp,16
  asm volatile("csrw stvec, %0" : : "r" (x));
    802029d0:	00009797          	auipc	a5,0x9
    802029d4:	ff87b783          	ld	a5,-8(a5) # 8020b9c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    802029d8:	10579073          	csrw	stvec,a5
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    802029dc:	100027f3          	csrr	a5,sstatus
  w_stvec((uint64)kernelvec);
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    802029e0:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    802029e4:	10079073          	csrw	sstatus,a5
  asm volatile("csrr %0, sie" : "=r" (x) );
    802029e8:	104027f3          	csrr	a5,sie
  // enable supervisor-mode timer interrupts.
  w_sie(r_sie() | SIE_SEIE | SIE_SSIE | SIE_STIE);
    802029ec:	2227e793          	ori	a5,a5,546
  asm volatile("csrw sie, %0" : : "r" (x));
    802029f0:	10479073          	csrw	sie,a5
  set_next_timeout();
    802029f4:	00003097          	auipc	ra,0x3
    802029f8:	932080e7          	jalr	-1742(ra) # 80205326 <set_next_timeout>
  #ifdef DEBUG
  printf("trapinithart\n");
    802029fc:	00007517          	auipc	a0,0x7
    80202a00:	d9450513          	addi	a0,a0,-620 # 80209790 <digits+0x410>
    80202a04:	ffffd097          	auipc	ra,0xffffd
    80202a08:	78a080e7          	jalr	1930(ra) # 8020018e <printf>
  #endif
}
    80202a0c:	60a2                	ld	ra,8(sp)
    80202a0e:	6402                	ld	s0,0(sp)
    80202a10:	0141                	addi	sp,sp,16
    80202a12:	8082                	ret

0000000080202a14 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80202a14:	1141                	addi	sp,sp,-16
    80202a16:	e406                	sd	ra,8(sp)
    80202a18:	e022                	sd	s0,0(sp)
    80202a1a:	0800                	addi	s0,sp,16
  struct proc *p = myproc();
    80202a1c:	fffff097          	auipc	ra,0xfffff
    80202a20:	0bc080e7          	jalr	188(ra) # 80201ad8 <myproc>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a24:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80202a28:	9bf5                	andi	a5,a5,-3
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a2a:	10079073          	csrw	sstatus,a5
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));
    80202a2e:	00009697          	auipc	a3,0x9
    80202a32:	f8a6b683          	ld	a3,-118(a3) # 8020b9b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80202a36:	00009717          	auipc	a4,0x9
    80202a3a:	fb273703          	ld	a4,-78(a4) # 8020b9e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80202a3e:	8f15                	sub	a4,a4,a3
    80202a40:	040007b7          	lui	a5,0x4000
    80202a44:	17fd                	addi	a5,a5,-1 # 3ffffff <_entry-0x7c200001>
    80202a46:	07b2                	slli	a5,a5,0xc
    80202a48:	973e                	add	a4,a4,a5
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202a4a:	10571073          	csrw	stvec,a4

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80202a4e:	7138                	ld	a4,96(a0)
  asm volatile("csrr %0, satp" : "=r" (x) );
    80202a50:	18002673          	csrr	a2,satp
    80202a54:	e310                	sd	a2,0(a4)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80202a56:	7130                	ld	a2,96(a0)
    80202a58:	6138                	ld	a4,64(a0)
    80202a5a:	6585                	lui	a1,0x1
    80202a5c:	972e                	add	a4,a4,a1
    80202a5e:	e618                	sd	a4,8(a2)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80202a60:	7138                	ld	a4,96(a0)
    80202a62:	00000617          	auipc	a2,0x0
    80202a66:	0f460613          	addi	a2,a2,244 # 80202b56 <usertrap>
    80202a6a:	eb10                	sd	a2,16(a4)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80202a6c:	7138                	ld	a4,96(a0)
  asm volatile("mv %0, tp" : "=r" (x) );
    80202a6e:	8612                	mv	a2,tp
    80202a70:	f310                	sd	a2,32(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202a72:	10002773          	csrr	a4,sstatus
  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80202a76:	eff77713          	andi	a4,a4,-257
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80202a7a:	02076713          	ori	a4,a4,32
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202a7e:	10071073          	csrw	sstatus,a4
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80202a82:	7138                	ld	a4,96(a0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202a84:	6f18                	ld	a4,24(a4)
    80202a86:	14171073          	csrw	sepc,a4

  // tell trampoline.S the user page table to switch to.
  // printf("[usertrapret]p->pagetable: %p\n", p->pagetable);
  uint64 satp = MAKE_SATP(p->pagetable);
    80202a8a:	692c                	ld	a1,80(a0)
    80202a8c:	81b1                	srli	a1,a1,0xc

  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
    80202a8e:	00009717          	auipc	a4,0x9
    80202a92:	f3273703          	ld	a4,-206(a4) # 8020b9c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80202a96:	8f15                	sub	a4,a4,a3
    80202a98:	97ba                	add	a5,a5,a4
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
    80202a9a:	577d                	li	a4,-1
    80202a9c:	177e                	slli	a4,a4,0x3f
    80202a9e:	8dd9                	or	a1,a1,a4
    80202aa0:	02000537          	lui	a0,0x2000
    80202aa4:	157d                	addi	a0,a0,-1 # 1ffffff <_entry-0x7e200001>
    80202aa6:	0536                	slli	a0,a0,0xd
    80202aa8:	9782                	jalr	a5
}
    80202aaa:	60a2                	ld	ra,8(sp)
    80202aac:	6402                	ld	s0,0(sp)
    80202aae:	0141                	addi	sp,sp,16
    80202ab0:	8082                	ret

0000000080202ab2 <devintr>:
// Check if it's an external/software interrupt, 
// and handle it. 
// returns  2 if timer interrupt, 
//          1 if other device, 
//          0 if not recognized. 
int devintr(void) {
    80202ab2:	1101                	addi	sp,sp,-32
    80202ab4:	ec06                	sd	ra,24(sp)
    80202ab6:	e822                	sd	s0,16(sp)
    80202ab8:	e426                	sd	s1,8(sp)
    80202aba:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202abc:	14202773          	csrr	a4,scause
	uint64 scause = r_scause();

	#ifdef QEMU 
	// handle external interrupt 
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202ac0:	00074d63          	bltz	a4,80202ada <devintr+0x28>
		sbi_set_mie();
		#endif 

		return 1;
	}
	else if (0x8000000000000005L == scause) {
    80202ac4:	57fd                	li	a5,-1
    80202ac6:	17fe                	slli	a5,a5,0x3f
    80202ac8:	0795                	addi	a5,a5,5
		timer_tick();
		return 2;
	}
	else { return 0;}
    80202aca:	4501                	li	a0,0
	else if (0x8000000000000005L == scause) {
    80202acc:	06f70f63          	beq	a4,a5,80202b4a <devintr+0x98>
}
    80202ad0:	60e2                	ld	ra,24(sp)
    80202ad2:	6442                	ld	s0,16(sp)
    80202ad4:	64a2                	ld	s1,8(sp)
    80202ad6:	6105                	addi	sp,sp,32
    80202ad8:	8082                	ret
	if ((0x8000000000000000L & scause) && 9 == (scause & 0xff)) 
    80202ada:	0ff77793          	zext.b	a5,a4
    80202ade:	46a5                	li	a3,9
    80202ae0:	fed792e3          	bne	a5,a3,80202ac4 <devintr+0x12>
		int irq = plic_claim();
    80202ae4:	00004097          	auipc	ra,0x4
    80202ae8:	34c080e7          	jalr	844(ra) # 80206e30 <plic_claim>
    80202aec:	84aa                	mv	s1,a0
		if (UART_IRQ == irq) {
    80202aee:	47a9                	li	a5,10
    80202af0:	02f50163          	beq	a0,a5,80202b12 <devintr+0x60>
		else if (DISK_IRQ == irq) {
    80202af4:	4785                	li	a5,1
    80202af6:	04f50563          	beq	a0,a5,80202b40 <devintr+0x8e>
		return 1;
    80202afa:	4505                	li	a0,1
		else if (irq) {
    80202afc:	d8f1                	beqz	s1,80202ad0 <devintr+0x1e>
			printf("unexpected interrupt irq = %d\n", irq);
    80202afe:	85a6                	mv	a1,s1
    80202b00:	00007517          	auipc	a0,0x7
    80202b04:	ca050513          	addi	a0,a0,-864 # 802097a0 <digits+0x420>
    80202b08:	ffffd097          	auipc	ra,0xffffd
    80202b0c:	686080e7          	jalr	1670(ra) # 8020018e <printf>
    80202b10:	a821                	j	80202b28 <devintr+0x76>
	return SBI_CALL_0(SBI_CONSOLE_GETCHAR);
    80202b12:	4501                	li	a0,0
    80202b14:	4581                	li	a1,0
    80202b16:	4601                	li	a2,0
    80202b18:	4681                	li	a3,0
    80202b1a:	4889                	li	a7,2
    80202b1c:	00000073          	ecall
    80202b20:	2501                	sext.w	a0,a0
			if (-1 != c) {
    80202b22:	57fd                	li	a5,-1
    80202b24:	00f51963          	bne	a0,a5,80202b36 <devintr+0x84>
		if (irq) { plic_complete(irq);}
    80202b28:	8526                	mv	a0,s1
    80202b2a:	00004097          	auipc	ra,0x4
    80202b2e:	330080e7          	jalr	816(ra) # 80206e5a <plic_complete>
		return 1;
    80202b32:	4505                	li	a0,1
    80202b34:	bf71                	j	80202ad0 <devintr+0x1e>
				consoleintr(c);
    80202b36:	00004097          	auipc	ra,0x4
    80202b3a:	538080e7          	jalr	1336(ra) # 8020706e <consoleintr>
    80202b3e:	b7ed                	j	80202b28 <devintr+0x76>
			disk_intr();
    80202b40:	00003097          	auipc	ra,0x3
    80202b44:	8a6080e7          	jalr	-1882(ra) # 802053e6 <disk_intr>
    80202b48:	b7c5                	j	80202b28 <devintr+0x76>
		timer_tick();
    80202b4a:	00003097          	auipc	ra,0x3
    80202b4e:	802080e7          	jalr	-2046(ra) # 8020534c <timer_tick>
		return 2;
    80202b52:	4509                	li	a0,2
    80202b54:	bfb5                	j	80202ad0 <devintr+0x1e>

0000000080202b56 <usertrap>:
{
    80202b56:	1101                	addi	sp,sp,-32
    80202b58:	ec06                	sd	ra,24(sp)
    80202b5a:	e822                	sd	s0,16(sp)
    80202b5c:	e426                	sd	s1,8(sp)
    80202b5e:	e04a                	sd	s2,0(sp)
    80202b60:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202b62:	100027f3          	csrr	a5,sstatus
  if((r_sstatus() & SSTATUS_SPP) != 0)
    80202b66:	1007f793          	andi	a5,a5,256
    80202b6a:	e3ad                	bnez	a5,80202bcc <usertrap+0x76>
  asm volatile("csrw stvec, %0" : : "r" (x));
    80202b6c:	00009797          	auipc	a5,0x9
    80202b70:	e5c7b783          	ld	a5,-420(a5) # 8020b9c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80202b74:	10579073          	csrw	stvec,a5
  struct proc *p = myproc();
    80202b78:	fffff097          	auipc	ra,0xfffff
    80202b7c:	f60080e7          	jalr	-160(ra) # 80201ad8 <myproc>
    80202b80:	84aa                	mv	s1,a0
  p->trapframe->epc = r_sepc();
    80202b82:	713c                	ld	a5,96(a0)
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202b84:	14102773          	csrr	a4,sepc
    80202b88:	ef98                	sd	a4,24(a5)
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202b8a:	14202773          	csrr	a4,scause
  if(r_scause() == 8){
    80202b8e:	47a1                	li	a5,8
    80202b90:	04f71c63          	bne	a4,a5,80202be8 <usertrap+0x92>
    if(p->killed)
    80202b94:	591c                	lw	a5,48(a0)
    80202b96:	e3b9                	bnez	a5,80202bdc <usertrap+0x86>
    p->trapframe->epc += 4;
    80202b98:	70b8                	ld	a4,96(s1)
    80202b9a:	6f1c                	ld	a5,24(a4)
    80202b9c:	0791                	addi	a5,a5,4
    80202b9e:	ef1c                	sd	a5,24(a4)
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202ba0:	100027f3          	csrr	a5,sstatus
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80202ba4:	0027e793          	ori	a5,a5,2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202ba8:	10079073          	csrw	sstatus,a5
    syscall();
    80202bac:	00000097          	auipc	ra,0x0
    80202bb0:	5d4080e7          	jalr	1492(ra) # 80203180 <syscall>
  if(p->killed)
    80202bb4:	589c                	lw	a5,48(s1)
    80202bb6:	ebd1                	bnez	a5,80202c4a <usertrap+0xf4>
  usertrapret();
    80202bb8:	00000097          	auipc	ra,0x0
    80202bbc:	e5c080e7          	jalr	-420(ra) # 80202a14 <usertrapret>
}
    80202bc0:	60e2                	ld	ra,24(sp)
    80202bc2:	6442                	ld	s0,16(sp)
    80202bc4:	64a2                	ld	s1,8(sp)
    80202bc6:	6902                	ld	s2,0(sp)
    80202bc8:	6105                	addi	sp,sp,32
    80202bca:	8082                	ret
    panic("usertrap: not from user mode");
    80202bcc:	00007517          	auipc	a0,0x7
    80202bd0:	bf450513          	addi	a0,a0,-1036 # 802097c0 <digits+0x440>
    80202bd4:	ffffd097          	auipc	ra,0xffffd
    80202bd8:	570080e7          	jalr	1392(ra) # 80200144 <panic>
      exit(-1);
    80202bdc:	557d                	li	a0,-1
    80202bde:	fffff097          	auipc	ra,0xfffff
    80202be2:	64e080e7          	jalr	1614(ra) # 8020222c <exit>
    80202be6:	bf4d                	j	80202b98 <usertrap+0x42>
  else if((which_dev = devintr()) != 0){
    80202be8:	00000097          	auipc	ra,0x0
    80202bec:	eca080e7          	jalr	-310(ra) # 80202ab2 <devintr>
    80202bf0:	892a                	mv	s2,a0
    80202bf2:	c501                	beqz	a0,80202bfa <usertrap+0xa4>
  if(p->killed)
    80202bf4:	589c                	lw	a5,48(s1)
    80202bf6:	c3b1                	beqz	a5,80202c3a <usertrap+0xe4>
    80202bf8:	a825                	j	80202c30 <usertrap+0xda>
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202bfa:	142025f3          	csrr	a1,scause
    printf("\nusertrap(): unexpected scause %p pid=%d %s\n", r_scause(), p->pid, p->name);
    80202bfe:	16048693          	addi	a3,s1,352
    80202c02:	5c90                	lw	a2,56(s1)
    80202c04:	00007517          	auipc	a0,0x7
    80202c08:	bdc50513          	addi	a0,a0,-1060 # 802097e0 <digits+0x460>
    80202c0c:	ffffd097          	auipc	ra,0xffffd
    80202c10:	582080e7          	jalr	1410(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202c14:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202c18:	14302673          	csrr	a2,stval
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80202c1c:	00007517          	auipc	a0,0x7
    80202c20:	bf450513          	addi	a0,a0,-1036 # 80209810 <digits+0x490>
    80202c24:	ffffd097          	auipc	ra,0xffffd
    80202c28:	56a080e7          	jalr	1386(ra) # 8020018e <printf>
    p->killed = 1;
    80202c2c:	4785                	li	a5,1
    80202c2e:	d89c                	sw	a5,48(s1)
    exit(-1);
    80202c30:	557d                	li	a0,-1
    80202c32:	fffff097          	auipc	ra,0xfffff
    80202c36:	5fa080e7          	jalr	1530(ra) # 8020222c <exit>
  if(which_dev == 2)
    80202c3a:	4789                	li	a5,2
    80202c3c:	f6f91ee3          	bne	s2,a5,80202bb8 <usertrap+0x62>
    yield();
    80202c40:	fffff097          	auipc	ra,0xfffff
    80202c44:	6ec080e7          	jalr	1772(ra) # 8020232c <yield>
    80202c48:	bf85                	j	80202bb8 <usertrap+0x62>
  int which_dev = 0;
    80202c4a:	4901                	li	s2,0
    80202c4c:	b7d5                	j	80202c30 <usertrap+0xda>

0000000080202c4e <kerneltrap>:
kerneltrap() {
    80202c4e:	7179                	addi	sp,sp,-48
    80202c50:	f406                	sd	ra,40(sp)
    80202c52:	f022                	sd	s0,32(sp)
    80202c54:	ec26                	sd	s1,24(sp)
    80202c56:	e84a                	sd	s2,16(sp)
    80202c58:	e44e                	sd	s3,8(sp)
    80202c5a:	1800                	addi	s0,sp,48
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202c5c:	14102973          	csrr	s2,sepc
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202c60:	100024f3          	csrr	s1,sstatus
  asm volatile("csrr %0, scause" : "=r" (x) );
    80202c64:	142029f3          	csrr	s3,scause
  if((sstatus & SSTATUS_SPP) == 0)
    80202c68:	1004f793          	andi	a5,s1,256
    80202c6c:	cb85                	beqz	a5,80202c9c <kerneltrap+0x4e>
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80202c6e:	100027f3          	csrr	a5,sstatus
  return (x & SSTATUS_SIE) != 0;
    80202c72:	8b89                	andi	a5,a5,2
  if(intr_get() != 0)
    80202c74:	ef85                	bnez	a5,80202cac <kerneltrap+0x5e>
  if((which_dev = devintr()) == 0){
    80202c76:	00000097          	auipc	ra,0x0
    80202c7a:	e3c080e7          	jalr	-452(ra) # 80202ab2 <devintr>
    80202c7e:	cd1d                	beqz	a0,80202cbc <kerneltrap+0x6e>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202c80:	4789                	li	a5,2
    80202c82:	08f50b63          	beq	a0,a5,80202d18 <kerneltrap+0xca>
  asm volatile("csrw sepc, %0" : : "r" (x));
    80202c86:	14191073          	csrw	sepc,s2
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80202c8a:	10049073          	csrw	sstatus,s1
}
    80202c8e:	70a2                	ld	ra,40(sp)
    80202c90:	7402                	ld	s0,32(sp)
    80202c92:	64e2                	ld	s1,24(sp)
    80202c94:	6942                	ld	s2,16(sp)
    80202c96:	69a2                	ld	s3,8(sp)
    80202c98:	6145                	addi	sp,sp,48
    80202c9a:	8082                	ret
    panic("kerneltrap: not from supervisor mode");
    80202c9c:	00007517          	auipc	a0,0x7
    80202ca0:	b9450513          	addi	a0,a0,-1132 # 80209830 <digits+0x4b0>
    80202ca4:	ffffd097          	auipc	ra,0xffffd
    80202ca8:	4a0080e7          	jalr	1184(ra) # 80200144 <panic>
    panic("kerneltrap: interrupts enabled");
    80202cac:	00007517          	auipc	a0,0x7
    80202cb0:	bac50513          	addi	a0,a0,-1108 # 80209858 <digits+0x4d8>
    80202cb4:	ffffd097          	auipc	ra,0xffffd
    80202cb8:	490080e7          	jalr	1168(ra) # 80200144 <panic>
    printf("\nscause %p\n", scause);
    80202cbc:	85ce                	mv	a1,s3
    80202cbe:	00007517          	auipc	a0,0x7
    80202cc2:	bba50513          	addi	a0,a0,-1094 # 80209878 <digits+0x4f8>
    80202cc6:	ffffd097          	auipc	ra,0xffffd
    80202cca:	4c8080e7          	jalr	1224(ra) # 8020018e <printf>
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80202cce:	141025f3          	csrr	a1,sepc
  asm volatile("csrr %0, stval" : "=r" (x) );
    80202cd2:	14302673          	csrr	a2,stval
  asm volatile("mv %0, tp" : "=r" (x) );
    80202cd6:	8692                	mv	a3,tp
    printf("sepc=%p stval=%p hart=%d\n", r_sepc(), r_stval(), r_tp());
    80202cd8:	00007517          	auipc	a0,0x7
    80202cdc:	bb050513          	addi	a0,a0,-1104 # 80209888 <digits+0x508>
    80202ce0:	ffffd097          	auipc	ra,0xffffd
    80202ce4:	4ae080e7          	jalr	1198(ra) # 8020018e <printf>
    struct proc *p = myproc();
    80202ce8:	fffff097          	auipc	ra,0xfffff
    80202cec:	df0080e7          	jalr	-528(ra) # 80201ad8 <myproc>
    if (p != 0) {
    80202cf0:	cd01                	beqz	a0,80202d08 <kerneltrap+0xba>
      printf("pid: %d, name: %s\n", p->pid, p->name);
    80202cf2:	16050613          	addi	a2,a0,352
    80202cf6:	5d0c                	lw	a1,56(a0)
    80202cf8:	00007517          	auipc	a0,0x7
    80202cfc:	bb050513          	addi	a0,a0,-1104 # 802098a8 <digits+0x528>
    80202d00:	ffffd097          	auipc	ra,0xffffd
    80202d04:	48e080e7          	jalr	1166(ra) # 8020018e <printf>
    panic("kerneltrap");
    80202d08:	00007517          	auipc	a0,0x7
    80202d0c:	bb850513          	addi	a0,a0,-1096 # 802098c0 <digits+0x540>
    80202d10:	ffffd097          	auipc	ra,0xffffd
    80202d14:	434080e7          	jalr	1076(ra) # 80200144 <panic>
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING) {
    80202d18:	fffff097          	auipc	ra,0xfffff
    80202d1c:	dc0080e7          	jalr	-576(ra) # 80201ad8 <myproc>
    80202d20:	d13d                	beqz	a0,80202c86 <kerneltrap+0x38>
    80202d22:	fffff097          	auipc	ra,0xfffff
    80202d26:	db6080e7          	jalr	-586(ra) # 80201ad8 <myproc>
    80202d2a:	4d18                	lw	a4,24(a0)
    80202d2c:	478d                	li	a5,3
    80202d2e:	f4f71ce3          	bne	a4,a5,80202c86 <kerneltrap+0x38>
    yield();
    80202d32:	fffff097          	auipc	ra,0xfffff
    80202d36:	5fa080e7          	jalr	1530(ra) # 8020232c <yield>
    80202d3a:	b7b1                	j	80202c86 <kerneltrap+0x38>

0000000080202d3c <trapframedump>:

void trapframedump(struct trapframe *tf)
{
    80202d3c:	1101                	addi	sp,sp,-32
    80202d3e:	ec06                	sd	ra,24(sp)
    80202d40:	e822                	sd	s0,16(sp)
    80202d42:	e426                	sd	s1,8(sp)
    80202d44:	1000                	addi	s0,sp,32
    80202d46:	84aa                	mv	s1,a0
  printf("a0: %p\t", tf->a0);
    80202d48:	792c                	ld	a1,112(a0)
    80202d4a:	00007517          	auipc	a0,0x7
    80202d4e:	b8650513          	addi	a0,a0,-1146 # 802098d0 <digits+0x550>
    80202d52:	ffffd097          	auipc	ra,0xffffd
    80202d56:	43c080e7          	jalr	1084(ra) # 8020018e <printf>
  printf("a1: %p\t", tf->a1);
    80202d5a:	7cac                	ld	a1,120(s1)
    80202d5c:	00007517          	auipc	a0,0x7
    80202d60:	b7c50513          	addi	a0,a0,-1156 # 802098d8 <digits+0x558>
    80202d64:	ffffd097          	auipc	ra,0xffffd
    80202d68:	42a080e7          	jalr	1066(ra) # 8020018e <printf>
  printf("a2: %p\t", tf->a2);
    80202d6c:	60cc                	ld	a1,128(s1)
    80202d6e:	00007517          	auipc	a0,0x7
    80202d72:	b7250513          	addi	a0,a0,-1166 # 802098e0 <digits+0x560>
    80202d76:	ffffd097          	auipc	ra,0xffffd
    80202d7a:	418080e7          	jalr	1048(ra) # 8020018e <printf>
  printf("a3: %p\n", tf->a3);
    80202d7e:	64cc                	ld	a1,136(s1)
    80202d80:	00007517          	auipc	a0,0x7
    80202d84:	b6850513          	addi	a0,a0,-1176 # 802098e8 <digits+0x568>
    80202d88:	ffffd097          	auipc	ra,0xffffd
    80202d8c:	406080e7          	jalr	1030(ra) # 8020018e <printf>
  printf("a4: %p\t", tf->a4);
    80202d90:	68cc                	ld	a1,144(s1)
    80202d92:	00007517          	auipc	a0,0x7
    80202d96:	b5e50513          	addi	a0,a0,-1186 # 802098f0 <digits+0x570>
    80202d9a:	ffffd097          	auipc	ra,0xffffd
    80202d9e:	3f4080e7          	jalr	1012(ra) # 8020018e <printf>
  printf("a5: %p\t", tf->a5);
    80202da2:	6ccc                	ld	a1,152(s1)
    80202da4:	00007517          	auipc	a0,0x7
    80202da8:	b5450513          	addi	a0,a0,-1196 # 802098f8 <digits+0x578>
    80202dac:	ffffd097          	auipc	ra,0xffffd
    80202db0:	3e2080e7          	jalr	994(ra) # 8020018e <printf>
  printf("a6: %p\t", tf->a6);
    80202db4:	70cc                	ld	a1,160(s1)
    80202db6:	00007517          	auipc	a0,0x7
    80202dba:	b4a50513          	addi	a0,a0,-1206 # 80209900 <digits+0x580>
    80202dbe:	ffffd097          	auipc	ra,0xffffd
    80202dc2:	3d0080e7          	jalr	976(ra) # 8020018e <printf>
  printf("a7: %p\n", tf->a7);
    80202dc6:	74cc                	ld	a1,168(s1)
    80202dc8:	00007517          	auipc	a0,0x7
    80202dcc:	b4050513          	addi	a0,a0,-1216 # 80209908 <digits+0x588>
    80202dd0:	ffffd097          	auipc	ra,0xffffd
    80202dd4:	3be080e7          	jalr	958(ra) # 8020018e <printf>
  printf("t0: %p\t", tf->t0);
    80202dd8:	64ac                	ld	a1,72(s1)
    80202dda:	00007517          	auipc	a0,0x7
    80202dde:	b3650513          	addi	a0,a0,-1226 # 80209910 <digits+0x590>
    80202de2:	ffffd097          	auipc	ra,0xffffd
    80202de6:	3ac080e7          	jalr	940(ra) # 8020018e <printf>
  printf("t1: %p\t", tf->t1);
    80202dea:	68ac                	ld	a1,80(s1)
    80202dec:	00007517          	auipc	a0,0x7
    80202df0:	b2c50513          	addi	a0,a0,-1236 # 80209918 <digits+0x598>
    80202df4:	ffffd097          	auipc	ra,0xffffd
    80202df8:	39a080e7          	jalr	922(ra) # 8020018e <printf>
  printf("t2: %p\t", tf->t2);
    80202dfc:	6cac                	ld	a1,88(s1)
    80202dfe:	00007517          	auipc	a0,0x7
    80202e02:	b2250513          	addi	a0,a0,-1246 # 80209920 <digits+0x5a0>
    80202e06:	ffffd097          	auipc	ra,0xffffd
    80202e0a:	388080e7          	jalr	904(ra) # 8020018e <printf>
  printf("t3: %p\n", tf->t3);
    80202e0e:	1004b583          	ld	a1,256(s1)
    80202e12:	00007517          	auipc	a0,0x7
    80202e16:	b1650513          	addi	a0,a0,-1258 # 80209928 <digits+0x5a8>
    80202e1a:	ffffd097          	auipc	ra,0xffffd
    80202e1e:	374080e7          	jalr	884(ra) # 8020018e <printf>
  printf("t4: %p\t", tf->t4);
    80202e22:	1084b583          	ld	a1,264(s1)
    80202e26:	00007517          	auipc	a0,0x7
    80202e2a:	b0a50513          	addi	a0,a0,-1270 # 80209930 <digits+0x5b0>
    80202e2e:	ffffd097          	auipc	ra,0xffffd
    80202e32:	360080e7          	jalr	864(ra) # 8020018e <printf>
  printf("t5: %p\t", tf->t5);
    80202e36:	1104b583          	ld	a1,272(s1)
    80202e3a:	00007517          	auipc	a0,0x7
    80202e3e:	afe50513          	addi	a0,a0,-1282 # 80209938 <digits+0x5b8>
    80202e42:	ffffd097          	auipc	ra,0xffffd
    80202e46:	34c080e7          	jalr	844(ra) # 8020018e <printf>
  printf("t6: %p\t", tf->t6);
    80202e4a:	1184b583          	ld	a1,280(s1)
    80202e4e:	00007517          	auipc	a0,0x7
    80202e52:	af250513          	addi	a0,a0,-1294 # 80209940 <digits+0x5c0>
    80202e56:	ffffd097          	auipc	ra,0xffffd
    80202e5a:	338080e7          	jalr	824(ra) # 8020018e <printf>
  printf("s0: %p\n", tf->s0);
    80202e5e:	70ac                	ld	a1,96(s1)
    80202e60:	00007517          	auipc	a0,0x7
    80202e64:	ae850513          	addi	a0,a0,-1304 # 80209948 <digits+0x5c8>
    80202e68:	ffffd097          	auipc	ra,0xffffd
    80202e6c:	326080e7          	jalr	806(ra) # 8020018e <printf>
  printf("s1: %p\t", tf->s1);
    80202e70:	74ac                	ld	a1,104(s1)
    80202e72:	00007517          	auipc	a0,0x7
    80202e76:	ade50513          	addi	a0,a0,-1314 # 80209950 <digits+0x5d0>
    80202e7a:	ffffd097          	auipc	ra,0xffffd
    80202e7e:	314080e7          	jalr	788(ra) # 8020018e <printf>
  printf("s2: %p\t", tf->s2);
    80202e82:	78cc                	ld	a1,176(s1)
    80202e84:	00007517          	auipc	a0,0x7
    80202e88:	ad450513          	addi	a0,a0,-1324 # 80209958 <digits+0x5d8>
    80202e8c:	ffffd097          	auipc	ra,0xffffd
    80202e90:	302080e7          	jalr	770(ra) # 8020018e <printf>
  printf("s3: %p\t", tf->s3);
    80202e94:	7ccc                	ld	a1,184(s1)
    80202e96:	00007517          	auipc	a0,0x7
    80202e9a:	aca50513          	addi	a0,a0,-1334 # 80209960 <digits+0x5e0>
    80202e9e:	ffffd097          	auipc	ra,0xffffd
    80202ea2:	2f0080e7          	jalr	752(ra) # 8020018e <printf>
  printf("s4: %p\n", tf->s4);
    80202ea6:	60ec                	ld	a1,192(s1)
    80202ea8:	00007517          	auipc	a0,0x7
    80202eac:	ac050513          	addi	a0,a0,-1344 # 80209968 <digits+0x5e8>
    80202eb0:	ffffd097          	auipc	ra,0xffffd
    80202eb4:	2de080e7          	jalr	734(ra) # 8020018e <printf>
  printf("s5: %p\t", tf->s5);
    80202eb8:	64ec                	ld	a1,200(s1)
    80202eba:	00007517          	auipc	a0,0x7
    80202ebe:	ab650513          	addi	a0,a0,-1354 # 80209970 <digits+0x5f0>
    80202ec2:	ffffd097          	auipc	ra,0xffffd
    80202ec6:	2cc080e7          	jalr	716(ra) # 8020018e <printf>
  printf("s6: %p\t", tf->s6);
    80202eca:	68ec                	ld	a1,208(s1)
    80202ecc:	00007517          	auipc	a0,0x7
    80202ed0:	aac50513          	addi	a0,a0,-1364 # 80209978 <digits+0x5f8>
    80202ed4:	ffffd097          	auipc	ra,0xffffd
    80202ed8:	2ba080e7          	jalr	698(ra) # 8020018e <printf>
  printf("s7: %p\t", tf->s7);
    80202edc:	6cec                	ld	a1,216(s1)
    80202ede:	00007517          	auipc	a0,0x7
    80202ee2:	aa250513          	addi	a0,a0,-1374 # 80209980 <digits+0x600>
    80202ee6:	ffffd097          	auipc	ra,0xffffd
    80202eea:	2a8080e7          	jalr	680(ra) # 8020018e <printf>
  printf("s8: %p\n", tf->s8);
    80202eee:	70ec                	ld	a1,224(s1)
    80202ef0:	00007517          	auipc	a0,0x7
    80202ef4:	a9850513          	addi	a0,a0,-1384 # 80209988 <digits+0x608>
    80202ef8:	ffffd097          	auipc	ra,0xffffd
    80202efc:	296080e7          	jalr	662(ra) # 8020018e <printf>
  printf("s9: %p\t", tf->s9);
    80202f00:	74ec                	ld	a1,232(s1)
    80202f02:	00007517          	auipc	a0,0x7
    80202f06:	a8e50513          	addi	a0,a0,-1394 # 80209990 <digits+0x610>
    80202f0a:	ffffd097          	auipc	ra,0xffffd
    80202f0e:	284080e7          	jalr	644(ra) # 8020018e <printf>
  printf("s10: %p\t", tf->s10);
    80202f12:	78ec                	ld	a1,240(s1)
    80202f14:	00007517          	auipc	a0,0x7
    80202f18:	a8450513          	addi	a0,a0,-1404 # 80209998 <digits+0x618>
    80202f1c:	ffffd097          	auipc	ra,0xffffd
    80202f20:	272080e7          	jalr	626(ra) # 8020018e <printf>
  printf("s11: %p\t", tf->s11);
    80202f24:	7cec                	ld	a1,248(s1)
    80202f26:	00007517          	auipc	a0,0x7
    80202f2a:	a8250513          	addi	a0,a0,-1406 # 802099a8 <digits+0x628>
    80202f2e:	ffffd097          	auipc	ra,0xffffd
    80202f32:	260080e7          	jalr	608(ra) # 8020018e <printf>
  printf("ra: %p\n", tf->ra);
    80202f36:	748c                	ld	a1,40(s1)
    80202f38:	00006517          	auipc	a0,0x6
    80202f3c:	74050513          	addi	a0,a0,1856 # 80209678 <digits+0x2f8>
    80202f40:	ffffd097          	auipc	ra,0xffffd
    80202f44:	24e080e7          	jalr	590(ra) # 8020018e <printf>
  printf("sp: %p\t", tf->sp);
    80202f48:	788c                	ld	a1,48(s1)
    80202f4a:	00007517          	auipc	a0,0x7
    80202f4e:	a6e50513          	addi	a0,a0,-1426 # 802099b8 <digits+0x638>
    80202f52:	ffffd097          	auipc	ra,0xffffd
    80202f56:	23c080e7          	jalr	572(ra) # 8020018e <printf>
  printf("gp: %p\t", tf->gp);
    80202f5a:	7c8c                	ld	a1,56(s1)
    80202f5c:	00007517          	auipc	a0,0x7
    80202f60:	a6450513          	addi	a0,a0,-1436 # 802099c0 <digits+0x640>
    80202f64:	ffffd097          	auipc	ra,0xffffd
    80202f68:	22a080e7          	jalr	554(ra) # 8020018e <printf>
  printf("tp: %p\t", tf->tp);
    80202f6c:	60ac                	ld	a1,64(s1)
    80202f6e:	00007517          	auipc	a0,0x7
    80202f72:	a5a50513          	addi	a0,a0,-1446 # 802099c8 <digits+0x648>
    80202f76:	ffffd097          	auipc	ra,0xffffd
    80202f7a:	218080e7          	jalr	536(ra) # 8020018e <printf>
  printf("epc: %p\n", tf->epc);
    80202f7e:	6c8c                	ld	a1,24(s1)
    80202f80:	00007517          	auipc	a0,0x7
    80202f84:	a5050513          	addi	a0,a0,-1456 # 802099d0 <digits+0x650>
    80202f88:	ffffd097          	auipc	ra,0xffffd
    80202f8c:	206080e7          	jalr	518(ra) # 8020018e <printf>
}
    80202f90:	60e2                	ld	ra,24(sp)
    80202f92:	6442                	ld	s0,16(sp)
    80202f94:	64a2                	ld	s1,8(sp)
    80202f96:	6105                	addi	sp,sp,32
    80202f98:	8082                	ret

0000000080202f9a <argraw>:
  return strlen(buf);
}

static uint64
argraw(int n)
{
    80202f9a:	1101                	addi	sp,sp,-32
    80202f9c:	ec06                	sd	ra,24(sp)
    80202f9e:	e822                	sd	s0,16(sp)
    80202fa0:	e426                	sd	s1,8(sp)
    80202fa2:	1000                	addi	s0,sp,32
    80202fa4:	84aa                	mv	s1,a0
  struct proc *p = myproc();
    80202fa6:	fffff097          	auipc	ra,0xfffff
    80202faa:	b32080e7          	jalr	-1230(ra) # 80201ad8 <myproc>
  switch (n) {
    80202fae:	4795                	li	a5,5
    80202fb0:	0497e163          	bltu	a5,s1,80202ff2 <argraw+0x58>
    80202fb4:	048a                	slli	s1,s1,0x2
    80202fb6:	00007717          	auipc	a4,0x7
    80202fba:	b7e70713          	addi	a4,a4,-1154 # 80209b34 <digits+0x7b4>
    80202fbe:	94ba                	add	s1,s1,a4
    80202fc0:	409c                	lw	a5,0(s1)
    80202fc2:	97ba                	add	a5,a5,a4
    80202fc4:	8782                	jr	a5
  case 0:
    return p->trapframe->a0;
    80202fc6:	713c                	ld	a5,96(a0)
    80202fc8:	7ba8                	ld	a0,112(a5)
  case 5:
    return p->trapframe->a5;
  }
  panic("argraw");
  return -1;
}
    80202fca:	60e2                	ld	ra,24(sp)
    80202fcc:	6442                	ld	s0,16(sp)
    80202fce:	64a2                	ld	s1,8(sp)
    80202fd0:	6105                	addi	sp,sp,32
    80202fd2:	8082                	ret
    return p->trapframe->a1;
    80202fd4:	713c                	ld	a5,96(a0)
    80202fd6:	7fa8                	ld	a0,120(a5)
    80202fd8:	bfcd                	j	80202fca <argraw+0x30>
    return p->trapframe->a2;
    80202fda:	713c                	ld	a5,96(a0)
    80202fdc:	63c8                	ld	a0,128(a5)
    80202fde:	b7f5                	j	80202fca <argraw+0x30>
    return p->trapframe->a3;
    80202fe0:	713c                	ld	a5,96(a0)
    80202fe2:	67c8                	ld	a0,136(a5)
    80202fe4:	b7dd                	j	80202fca <argraw+0x30>
    return p->trapframe->a4;
    80202fe6:	713c                	ld	a5,96(a0)
    80202fe8:	6bc8                	ld	a0,144(a5)
    80202fea:	b7c5                	j	80202fca <argraw+0x30>
    return p->trapframe->a5;
    80202fec:	713c                	ld	a5,96(a0)
    80202fee:	6fc8                	ld	a0,152(a5)
    80202ff0:	bfe9                	j	80202fca <argraw+0x30>
  panic("argraw");
    80202ff2:	00007517          	auipc	a0,0x7
    80202ff6:	9ee50513          	addi	a0,a0,-1554 # 802099e0 <digits+0x660>
    80202ffa:	ffffd097          	auipc	ra,0xffffd
    80202ffe:	14a080e7          	jalr	330(ra) # 80200144 <panic>

0000000080203002 <sys_sysinfo>:
    return 0;
}

uint64
sys_sysinfo(void)
{
    80203002:	7179                	addi	sp,sp,-48
    80203004:	f406                	sd	ra,40(sp)
    80203006:	f022                	sd	s0,32(sp)
    80203008:	ec26                	sd	s1,24(sp)
    8020300a:	1800                	addi	s0,sp,48
  *ip = argraw(n);
    8020300c:	4501                	li	a0,0
    8020300e:	00000097          	auipc	ra,0x0
    80203012:	f8c080e7          	jalr	-116(ra) # 80202f9a <argraw>
    80203016:	84aa                	mv	s1,a0
  if (argaddr(0, &addr) < 0) {
    return -1;
  }

  struct sysinfo info;
  info.freemem = freemem_amount();
    80203018:	ffffd097          	auipc	ra,0xffffd
    8020301c:	5d6080e7          	jalr	1494(ra) # 802005ee <freemem_amount>
    80203020:	fca43823          	sd	a0,-48(s0)
  info.nproc = procnum();
    80203024:	fffff097          	auipc	ra,0xfffff
    80203028:	6b8080e7          	jalr	1720(ra) # 802026dc <procnum>
    8020302c:	fca43c23          	sd	a0,-40(s0)

  // if (copyout(p->pagetable, addr, (char *)&info, sizeof(info)) < 0) {
  if (copyout2(addr, (char *)&info, sizeof(info)) < 0) {
    80203030:	4641                	li	a2,16
    80203032:	fd040593          	addi	a1,s0,-48
    80203036:	8526                	mv	a0,s1
    80203038:	ffffe097          	auipc	ra,0xffffe
    8020303c:	3c6080e7          	jalr	966(ra) # 802013fe <copyout2>
    return -1;
  }

  return 0;
    80203040:	957d                	srai	a0,a0,0x3f
    80203042:	70a2                	ld	ra,40(sp)
    80203044:	7402                	ld	s0,32(sp)
    80203046:	64e2                	ld	s1,24(sp)
    80203048:	6145                	addi	sp,sp,48
    8020304a:	8082                	ret

000000008020304c <fetchaddr>:
{
    8020304c:	1101                	addi	sp,sp,-32
    8020304e:	ec06                	sd	ra,24(sp)
    80203050:	e822                	sd	s0,16(sp)
    80203052:	e426                	sd	s1,8(sp)
    80203054:	e04a                	sd	s2,0(sp)
    80203056:	1000                	addi	s0,sp,32
    80203058:	84aa                	mv	s1,a0
    8020305a:	892e                	mv	s2,a1
  struct proc *p = myproc();
    8020305c:	fffff097          	auipc	ra,0xfffff
    80203060:	a7c080e7          	jalr	-1412(ra) # 80201ad8 <myproc>
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz)
    80203064:	653c                	ld	a5,72(a0)
    80203066:	02f4f763          	bgeu	s1,a5,80203094 <fetchaddr+0x48>
    8020306a:	00848713          	addi	a4,s1,8
    8020306e:	02e7e563          	bltu	a5,a4,80203098 <fetchaddr+0x4c>
  if(copyin2((char *)ip, addr, sizeof(*ip)) != 0)
    80203072:	4621                	li	a2,8
    80203074:	85a6                	mv	a1,s1
    80203076:	854a                	mv	a0,s2
    80203078:	ffffe097          	auipc	ra,0xffffe
    8020307c:	466080e7          	jalr	1126(ra) # 802014de <copyin2>
    80203080:	00a03533          	snez	a0,a0
    80203084:	40a00533          	neg	a0,a0
}
    80203088:	60e2                	ld	ra,24(sp)
    8020308a:	6442                	ld	s0,16(sp)
    8020308c:	64a2                	ld	s1,8(sp)
    8020308e:	6902                	ld	s2,0(sp)
    80203090:	6105                	addi	sp,sp,32
    80203092:	8082                	ret
    return -1;
    80203094:	557d                	li	a0,-1
    80203096:	bfcd                	j	80203088 <fetchaddr+0x3c>
    80203098:	557d                	li	a0,-1
    8020309a:	b7fd                	j	80203088 <fetchaddr+0x3c>

000000008020309c <fetchstr>:
{
    8020309c:	1101                	addi	sp,sp,-32
    8020309e:	ec06                	sd	ra,24(sp)
    802030a0:	e822                	sd	s0,16(sp)
    802030a2:	e426                	sd	s1,8(sp)
    802030a4:	1000                	addi	s0,sp,32
    802030a6:	84ae                	mv	s1,a1
  int err = copyinstr2(buf, addr, max);
    802030a8:	85aa                	mv	a1,a0
    802030aa:	8526                	mv	a0,s1
    802030ac:	ffffe097          	auipc	ra,0xffffe
    802030b0:	534080e7          	jalr	1332(ra) # 802015e0 <copyinstr2>
  if(err < 0)
    802030b4:	00054763          	bltz	a0,802030c2 <fetchstr+0x26>
  return strlen(buf);
    802030b8:	8526                	mv	a0,s1
    802030ba:	ffffe097          	auipc	ra,0xffffe
    802030be:	85a080e7          	jalr	-1958(ra) # 80200914 <strlen>
}
    802030c2:	60e2                	ld	ra,24(sp)
    802030c4:	6442                	ld	s0,16(sp)
    802030c6:	64a2                	ld	s1,8(sp)
    802030c8:	6105                	addi	sp,sp,32
    802030ca:	8082                	ret

00000000802030cc <argint>:
{
    802030cc:	1101                	addi	sp,sp,-32
    802030ce:	ec06                	sd	ra,24(sp)
    802030d0:	e822                	sd	s0,16(sp)
    802030d2:	e426                	sd	s1,8(sp)
    802030d4:	1000                	addi	s0,sp,32
    802030d6:	84ae                	mv	s1,a1
  *ip = argraw(n);
    802030d8:	00000097          	auipc	ra,0x0
    802030dc:	ec2080e7          	jalr	-318(ra) # 80202f9a <argraw>
    802030e0:	c088                	sw	a0,0(s1)
}
    802030e2:	4501                	li	a0,0
    802030e4:	60e2                	ld	ra,24(sp)
    802030e6:	6442                	ld	s0,16(sp)
    802030e8:	64a2                	ld	s1,8(sp)
    802030ea:	6105                	addi	sp,sp,32
    802030ec:	8082                	ret

00000000802030ee <sys_test_proc>:
sys_test_proc(void) {
    802030ee:	1101                	addi	sp,sp,-32
    802030f0:	ec06                	sd	ra,24(sp)
    802030f2:	e822                	sd	s0,16(sp)
    802030f4:	1000                	addi	s0,sp,32
    argint(0, &n);
    802030f6:	fec40593          	addi	a1,s0,-20
    802030fa:	4501                	li	a0,0
    802030fc:	00000097          	auipc	ra,0x0
    80203100:	fd0080e7          	jalr	-48(ra) # 802030cc <argint>
    printf("hello world from proc %d, hart %d, arg %d\n", myproc()->pid, r_tp(), n);
    80203104:	fffff097          	auipc	ra,0xfffff
    80203108:	9d4080e7          	jalr	-1580(ra) # 80201ad8 <myproc>
    8020310c:	8612                	mv	a2,tp
    8020310e:	fec42683          	lw	a3,-20(s0)
    80203112:	5d0c                	lw	a1,56(a0)
    80203114:	00007517          	auipc	a0,0x7
    80203118:	8d450513          	addi	a0,a0,-1836 # 802099e8 <digits+0x668>
    8020311c:	ffffd097          	auipc	ra,0xffffd
    80203120:	072080e7          	jalr	114(ra) # 8020018e <printf>
}
    80203124:	4501                	li	a0,0
    80203126:	60e2                	ld	ra,24(sp)
    80203128:	6442                	ld	s0,16(sp)
    8020312a:	6105                	addi	sp,sp,32
    8020312c:	8082                	ret

000000008020312e <argaddr>:
{
    8020312e:	1101                	addi	sp,sp,-32
    80203130:	ec06                	sd	ra,24(sp)
    80203132:	e822                	sd	s0,16(sp)
    80203134:	e426                	sd	s1,8(sp)
    80203136:	1000                	addi	s0,sp,32
    80203138:	84ae                	mv	s1,a1
  *ip = argraw(n);
    8020313a:	00000097          	auipc	ra,0x0
    8020313e:	e60080e7          	jalr	-416(ra) # 80202f9a <argraw>
    80203142:	e088                	sd	a0,0(s1)
}
    80203144:	4501                	li	a0,0
    80203146:	60e2                	ld	ra,24(sp)
    80203148:	6442                	ld	s0,16(sp)
    8020314a:	64a2                	ld	s1,8(sp)
    8020314c:	6105                	addi	sp,sp,32
    8020314e:	8082                	ret

0000000080203150 <argstr>:
{
    80203150:	1101                	addi	sp,sp,-32
    80203152:	ec06                	sd	ra,24(sp)
    80203154:	e822                	sd	s0,16(sp)
    80203156:	e426                	sd	s1,8(sp)
    80203158:	e04a                	sd	s2,0(sp)
    8020315a:	1000                	addi	s0,sp,32
    8020315c:	84ae                	mv	s1,a1
    8020315e:	8932                	mv	s2,a2
  *ip = argraw(n);
    80203160:	00000097          	auipc	ra,0x0
    80203164:	e3a080e7          	jalr	-454(ra) # 80202f9a <argraw>
  return fetchstr(addr, buf, max);
    80203168:	864a                	mv	a2,s2
    8020316a:	85a6                	mv	a1,s1
    8020316c:	00000097          	auipc	ra,0x0
    80203170:	f30080e7          	jalr	-208(ra) # 8020309c <fetchstr>
}
    80203174:	60e2                	ld	ra,24(sp)
    80203176:	6442                	ld	s0,16(sp)
    80203178:	64a2                	ld	s1,8(sp)
    8020317a:	6902                	ld	s2,0(sp)
    8020317c:	6105                	addi	sp,sp,32
    8020317e:	8082                	ret

0000000080203180 <syscall>:
{
    80203180:	7179                	addi	sp,sp,-48
    80203182:	f406                	sd	ra,40(sp)
    80203184:	f022                	sd	s0,32(sp)
    80203186:	ec26                	sd	s1,24(sp)
    80203188:	e84a                	sd	s2,16(sp)
    8020318a:	e44e                	sd	s3,8(sp)
    8020318c:	1800                	addi	s0,sp,48
  struct proc *p = myproc();
    8020318e:	fffff097          	auipc	ra,0xfffff
    80203192:	94a080e7          	jalr	-1718(ra) # 80201ad8 <myproc>
    80203196:	84aa                	mv	s1,a0
  num = p->trapframe->a7;
    80203198:	06053903          	ld	s2,96(a0)
    8020319c:	0a893783          	ld	a5,168(s2)
    802031a0:	0007899b          	sext.w	s3,a5
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    802031a4:	37fd                	addiw	a5,a5,-1
    802031a6:	10300713          	li	a4,259
    802031aa:	04f76763          	bltu	a4,a5,802031f8 <syscall+0x78>
    802031ae:	00399713          	slli	a4,s3,0x3
    802031b2:	00007797          	auipc	a5,0x7
    802031b6:	79678793          	addi	a5,a5,1942 # 8020a948 <syscalls>
    802031ba:	97ba                	add	a5,a5,a4
    802031bc:	639c                	ld	a5,0(a5)
    802031be:	cf8d                	beqz	a5,802031f8 <syscall+0x78>
    p->trapframe->a0 = syscalls[num]();
    802031c0:	9782                	jalr	a5
    802031c2:	06a93823          	sd	a0,112(s2)
    if ((p->tmask & (1 << num)) != 0) {
    802031c6:	1704a783          	lw	a5,368(s1)
    802031ca:	4137d7bb          	sraw	a5,a5,s3
    802031ce:	8b85                	andi	a5,a5,1
    802031d0:	c3b9                	beqz	a5,80203216 <syscall+0x96>
      printf("pid %d: %s -> %d\n", p->pid, sysnames[num], p->trapframe->a0);
    802031d2:	70b8                	ld	a4,96(s1)
    802031d4:	098e                	slli	s3,s3,0x3
    802031d6:	00008797          	auipc	a5,0x8
    802031da:	f9a78793          	addi	a5,a5,-102 # 8020b170 <sysnames>
    802031de:	97ce                	add	a5,a5,s3
    802031e0:	7b34                	ld	a3,112(a4)
    802031e2:	6390                	ld	a2,0(a5)
    802031e4:	5c8c                	lw	a1,56(s1)
    802031e6:	00007517          	auipc	a0,0x7
    802031ea:	83250513          	addi	a0,a0,-1998 # 80209a18 <digits+0x698>
    802031ee:	ffffd097          	auipc	ra,0xffffd
    802031f2:	fa0080e7          	jalr	-96(ra) # 8020018e <printf>
    802031f6:	a005                	j	80203216 <syscall+0x96>
    printf("pid %d %s: unknown sys call %d\n",
    802031f8:	86ce                	mv	a3,s3
    802031fa:	16048613          	addi	a2,s1,352
    802031fe:	5c8c                	lw	a1,56(s1)
    80203200:	00007517          	auipc	a0,0x7
    80203204:	83050513          	addi	a0,a0,-2000 # 80209a30 <digits+0x6b0>
    80203208:	ffffd097          	auipc	ra,0xffffd
    8020320c:	f86080e7          	jalr	-122(ra) # 8020018e <printf>
    p->trapframe->a0 = -1;
    80203210:	70bc                	ld	a5,96(s1)
    80203212:	577d                	li	a4,-1
    80203214:	fbb8                	sd	a4,112(a5)
}
    80203216:	70a2                	ld	ra,40(sp)
    80203218:	7402                	ld	s0,32(sp)
    8020321a:	64e2                	ld	s1,24(sp)
    8020321c:	6942                	ld	s2,16(sp)
    8020321e:	69a2                	ld	s3,8(sp)
    80203220:	6145                	addi	sp,sp,48
    80203222:	8082                	ret

0000000080203224 <sys_exec>:

extern int exec(char *path, char **argv);

uint64
sys_exec(void)
{
    80203224:	d9010113          	addi	sp,sp,-624
    80203228:	26113423          	sd	ra,616(sp)
    8020322c:	26813023          	sd	s0,608(sp)
    80203230:	24913c23          	sd	s1,600(sp)
    80203234:	25213823          	sd	s2,592(sp)
    80203238:	25313423          	sd	s3,584(sp)
    8020323c:	25413023          	sd	s4,576(sp)
    80203240:	23513c23          	sd	s5,568(sp)
    80203244:	23613823          	sd	s6,560(sp)
    80203248:	23713423          	sd	s7,552(sp)
    8020324c:	1c80                	addi	s0,sp,624
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    8020324e:	10400613          	li	a2,260
    80203252:	ea840593          	addi	a1,s0,-344
    80203256:	4501                	li	a0,0
    80203258:	00000097          	auipc	ra,0x0
    8020325c:	ef8080e7          	jalr	-264(ra) # 80203150 <argstr>
    return -1;
    80203260:	597d                	li	s2,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    80203262:	0c054c63          	bltz	a0,8020333a <sys_exec+0x116>
    80203266:	da040593          	addi	a1,s0,-608
    8020326a:	4505                	li	a0,1
    8020326c:	00000097          	auipc	ra,0x0
    80203270:	ec2080e7          	jalr	-318(ra) # 8020312e <argaddr>
    80203274:	0c054363          	bltz	a0,8020333a <sys_exec+0x116>
  }
  memset(argv, 0, sizeof(argv));
    80203278:	da840a13          	addi	s4,s0,-600
    8020327c:	10000613          	li	a2,256
    80203280:	4581                	li	a1,0
    80203282:	8552                	mv	a0,s4
    80203284:	ffffd097          	auipc	ra,0xffffd
    80203288:	50c080e7          	jalr	1292(ra) # 80200790 <memset>
  for(i=0;; i++){
    if(i >= NELEM(argv)){
    8020328c:	84d2                	mv	s1,s4
  memset(argv, 0, sizeof(argv));
    8020328e:	89d2                	mv	s3,s4
    80203290:	4901                	li	s2,0
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80203292:	d9840a93          	addi	s5,s0,-616
    if(i >= NELEM(argv)){
    80203296:	02000b13          	li	s6,32
    8020329a:	00090b9b          	sext.w	s7,s2
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8020329e:	00391513          	slli	a0,s2,0x3
    802032a2:	85d6                	mv	a1,s5
    802032a4:	da043783          	ld	a5,-608(s0)
    802032a8:	953e                	add	a0,a0,a5
    802032aa:	00000097          	auipc	ra,0x0
    802032ae:	da2080e7          	jalr	-606(ra) # 8020304c <fetchaddr>
    802032b2:	02054a63          	bltz	a0,802032e6 <sys_exec+0xc2>
      goto bad;
    }
    if(uarg == 0){
    802032b6:	d9843783          	ld	a5,-616(s0)
    802032ba:	c3b9                	beqz	a5,80203300 <sys_exec+0xdc>
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    802032bc:	ffffd097          	auipc	ra,0xffffd
    802032c0:	2cc080e7          	jalr	716(ra) # 80200588 <kalloc>
    802032c4:	85aa                	mv	a1,a0
    802032c6:	00a9b023          	sd	a0,0(s3)
    if(argv[i] == 0)
    802032ca:	cd11                	beqz	a0,802032e6 <sys_exec+0xc2>
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    802032cc:	6605                	lui	a2,0x1
    802032ce:	d9843503          	ld	a0,-616(s0)
    802032d2:	00000097          	auipc	ra,0x0
    802032d6:	dca080e7          	jalr	-566(ra) # 8020309c <fetchstr>
    802032da:	00054663          	bltz	a0,802032e6 <sys_exec+0xc2>
    if(i >= NELEM(argv)){
    802032de:	0905                	addi	s2,s2,1
    802032e0:	09a1                	addi	s3,s3,8
    802032e2:	fb691ce3          	bne	s2,s6,8020329a <sys_exec+0x76>
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802032e6:	100a0a13          	addi	s4,s4,256
    802032ea:	6088                	ld	a0,0(s1)
    802032ec:	c531                	beqz	a0,80203338 <sys_exec+0x114>
    kfree(argv[i]);
    802032ee:	ffffd097          	auipc	ra,0xffffd
    802032f2:	152080e7          	jalr	338(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    802032f6:	04a1                	addi	s1,s1,8
    802032f8:	ff4499e3          	bne	s1,s4,802032ea <sys_exec+0xc6>
  return -1;
    802032fc:	597d                	li	s2,-1
    802032fe:	a835                	j	8020333a <sys_exec+0x116>
      argv[i] = 0;
    80203300:	0b8e                	slli	s7,s7,0x3
    80203302:	fb0b8793          	addi	a5,s7,-80
    80203306:	00878bb3          	add	s7,a5,s0
    8020330a:	de0bbc23          	sd	zero,-520(s7)
  int ret = exec(path, argv);
    8020330e:	da840593          	addi	a1,s0,-600
    80203312:	ea840513          	addi	a0,s0,-344
    80203316:	00001097          	auipc	ra,0x1
    8020331a:	eda080e7          	jalr	-294(ra) # 802041f0 <exec>
    8020331e:	892a                	mv	s2,a0
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203320:	100a0a13          	addi	s4,s4,256
    80203324:	6088                	ld	a0,0(s1)
    80203326:	c911                	beqz	a0,8020333a <sys_exec+0x116>
    kfree(argv[i]);
    80203328:	ffffd097          	auipc	ra,0xffffd
    8020332c:	118080e7          	jalr	280(ra) # 80200440 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80203330:	04a1                	addi	s1,s1,8
    80203332:	ff4499e3          	bne	s1,s4,80203324 <sys_exec+0x100>
    80203336:	a011                	j	8020333a <sys_exec+0x116>
  return -1;
    80203338:	597d                	li	s2,-1
}
    8020333a:	854a                	mv	a0,s2
    8020333c:	26813083          	ld	ra,616(sp)
    80203340:	26013403          	ld	s0,608(sp)
    80203344:	25813483          	ld	s1,600(sp)
    80203348:	25013903          	ld	s2,592(sp)
    8020334c:	24813983          	ld	s3,584(sp)
    80203350:	24013a03          	ld	s4,576(sp)
    80203354:	23813a83          	ld	s5,568(sp)
    80203358:	23013b03          	ld	s6,560(sp)
    8020335c:	22813b83          	ld	s7,552(sp)
    80203360:	27010113          	addi	sp,sp,624
    80203364:	8082                	ret

0000000080203366 <sys_exit>:

uint64
sys_exit(void)
{
    80203366:	1101                	addi	sp,sp,-32
    80203368:	ec06                	sd	ra,24(sp)
    8020336a:	e822                	sd	s0,16(sp)
    8020336c:	1000                	addi	s0,sp,32
  int n;
  if(argint(0, &n) < 0)
    8020336e:	fec40593          	addi	a1,s0,-20
    80203372:	4501                	li	a0,0
    80203374:	00000097          	auipc	ra,0x0
    80203378:	d58080e7          	jalr	-680(ra) # 802030cc <argint>
    return -1;
    8020337c:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    8020337e:	00054963          	bltz	a0,80203390 <sys_exit+0x2a>
  exit(n);
    80203382:	fec42503          	lw	a0,-20(s0)
    80203386:	fffff097          	auipc	ra,0xfffff
    8020338a:	ea6080e7          	jalr	-346(ra) # 8020222c <exit>
  return 0;  // not reached
    8020338e:	4781                	li	a5,0
}
    80203390:	853e                	mv	a0,a5
    80203392:	60e2                	ld	ra,24(sp)
    80203394:	6442                	ld	s0,16(sp)
    80203396:	6105                	addi	sp,sp,32
    80203398:	8082                	ret

000000008020339a <sys_getpid>:

uint64
sys_getpid(void)
{
    8020339a:	1141                	addi	sp,sp,-16
    8020339c:	e406                	sd	ra,8(sp)
    8020339e:	e022                	sd	s0,0(sp)
    802033a0:	0800                	addi	s0,sp,16
  return myproc()->pid;
    802033a2:	ffffe097          	auipc	ra,0xffffe
    802033a6:	736080e7          	jalr	1846(ra) # 80201ad8 <myproc>
}
    802033aa:	5d08                	lw	a0,56(a0)
    802033ac:	60a2                	ld	ra,8(sp)
    802033ae:	6402                	ld	s0,0(sp)
    802033b0:	0141                	addi	sp,sp,16
    802033b2:	8082                	ret

00000000802033b4 <sys_fork>:

uint64
sys_fork(void)
{
    802033b4:	1141                	addi	sp,sp,-16
    802033b6:	e406                	sd	ra,8(sp)
    802033b8:	e022                	sd	s0,0(sp)
    802033ba:	0800                	addi	s0,sp,16
  return fork();
    802033bc:	fffff097          	auipc	ra,0xfffff
    802033c0:	b32080e7          	jalr	-1230(ra) # 80201eee <fork>
}
    802033c4:	60a2                	ld	ra,8(sp)
    802033c6:	6402                	ld	s0,0(sp)
    802033c8:	0141                	addi	sp,sp,16
    802033ca:	8082                	ret

00000000802033cc <sys_wait>:

uint64
sys_wait(void)
{
    802033cc:	1101                	addi	sp,sp,-32
    802033ce:	ec06                	sd	ra,24(sp)
    802033d0:	e822                	sd	s0,16(sp)
    802033d2:	1000                	addi	s0,sp,32
  uint64 p;
  if(argaddr(0, &p) < 0)
    802033d4:	fe840593          	addi	a1,s0,-24
    802033d8:	4501                	li	a0,0
    802033da:	00000097          	auipc	ra,0x0
    802033de:	d54080e7          	jalr	-684(ra) # 8020312e <argaddr>
    802033e2:	87aa                	mv	a5,a0
    return -1;
    802033e4:	557d                	li	a0,-1
  if(argaddr(0, &p) < 0)
    802033e6:	0007c863          	bltz	a5,802033f6 <sys_wait+0x2a>
  return wait(p);
    802033ea:	fe843503          	ld	a0,-24(s0)
    802033ee:	fffff097          	auipc	ra,0xfffff
    802033f2:	ff8080e7          	jalr	-8(ra) # 802023e6 <wait>
}
    802033f6:	60e2                	ld	ra,24(sp)
    802033f8:	6442                	ld	s0,16(sp)
    802033fa:	6105                	addi	sp,sp,32
    802033fc:	8082                	ret

00000000802033fe <sys_sbrk>:

uint64
sys_sbrk(void)
{
    802033fe:	7179                	addi	sp,sp,-48
    80203400:	f406                	sd	ra,40(sp)
    80203402:	f022                	sd	s0,32(sp)
    80203404:	ec26                	sd	s1,24(sp)
    80203406:	1800                	addi	s0,sp,48
  int addr;
  int n;

  if(argint(0, &n) < 0)
    80203408:	fdc40593          	addi	a1,s0,-36
    8020340c:	4501                	li	a0,0
    8020340e:	00000097          	auipc	ra,0x0
    80203412:	cbe080e7          	jalr	-834(ra) # 802030cc <argint>
    80203416:	87aa                	mv	a5,a0
    return -1;
    80203418:	557d                	li	a0,-1
  if(argint(0, &n) < 0)
    8020341a:	0207c063          	bltz	a5,8020343a <sys_sbrk+0x3c>
  addr = myproc()->sz;
    8020341e:	ffffe097          	auipc	ra,0xffffe
    80203422:	6ba080e7          	jalr	1722(ra) # 80201ad8 <myproc>
    80203426:	4524                	lw	s1,72(a0)
  if(growproc(n) < 0)
    80203428:	fdc42503          	lw	a0,-36(s0)
    8020342c:	fffff097          	auipc	ra,0xfffff
    80203430:	a46080e7          	jalr	-1466(ra) # 80201e72 <growproc>
    80203434:	00054863          	bltz	a0,80203444 <sys_sbrk+0x46>
    return -1;
  return addr;
    80203438:	8526                	mv	a0,s1
}
    8020343a:	70a2                	ld	ra,40(sp)
    8020343c:	7402                	ld	s0,32(sp)
    8020343e:	64e2                	ld	s1,24(sp)
    80203440:	6145                	addi	sp,sp,48
    80203442:	8082                	ret
    return -1;
    80203444:	557d                	li	a0,-1
    80203446:	bfd5                	j	8020343a <sys_sbrk+0x3c>

0000000080203448 <sys_sleep>:

uint64
sys_sleep(void)
{
    80203448:	7139                	addi	sp,sp,-64
    8020344a:	fc06                	sd	ra,56(sp)
    8020344c:	f822                	sd	s0,48(sp)
    8020344e:	f426                	sd	s1,40(sp)
    80203450:	f04a                	sd	s2,32(sp)
    80203452:	ec4e                	sd	s3,24(sp)
    80203454:	0080                	addi	s0,sp,64
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    80203456:	fcc40593          	addi	a1,s0,-52
    8020345a:	4501                	li	a0,0
    8020345c:	00000097          	auipc	ra,0x0
    80203460:	c70080e7          	jalr	-912(ra) # 802030cc <argint>
    return -1;
    80203464:	57fd                	li	a5,-1
  if(argint(0, &n) < 0)
    80203466:	06054763          	bltz	a0,802034d4 <sys_sleep+0x8c>
  acquire(&tickslock);
    8020346a:	00008517          	auipc	a0,0x8
    8020346e:	57653503          	ld	a0,1398(a0) # 8020b9e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203472:	ffffd097          	auipc	ra,0xffffd
    80203476:	282080e7          	jalr	642(ra) # 802006f4 <acquire>
  ticks0 = ticks;
    8020347a:	00008797          	auipc	a5,0x8
    8020347e:	5767b783          	ld	a5,1398(a5) # 8020b9f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80203482:	0007a903          	lw	s2,0(a5)
  while(ticks - ticks0 < n){
    80203486:	fcc42783          	lw	a5,-52(s0)
    8020348a:	cf85                	beqz	a5,802034c2 <sys_sleep+0x7a>
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
    8020348c:	00008997          	auipc	s3,0x8
    80203490:	5549b983          	ld	s3,1364(s3) # 8020b9e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203494:	00008497          	auipc	s1,0x8
    80203498:	55c4b483          	ld	s1,1372(s1) # 8020b9f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    if(myproc()->killed){
    8020349c:	ffffe097          	auipc	ra,0xffffe
    802034a0:	63c080e7          	jalr	1596(ra) # 80201ad8 <myproc>
    802034a4:	591c                	lw	a5,48(a0)
    802034a6:	ef9d                	bnez	a5,802034e4 <sys_sleep+0x9c>
    sleep(&ticks, &tickslock);
    802034a8:	85ce                	mv	a1,s3
    802034aa:	8526                	mv	a0,s1
    802034ac:	fffff097          	auipc	ra,0xfffff
    802034b0:	ebc080e7          	jalr	-324(ra) # 80202368 <sleep>
  while(ticks - ticks0 < n){
    802034b4:	409c                	lw	a5,0(s1)
    802034b6:	412787bb          	subw	a5,a5,s2
    802034ba:	fcc42703          	lw	a4,-52(s0)
    802034be:	fce7efe3          	bltu	a5,a4,8020349c <sys_sleep+0x54>
  }
  release(&tickslock);
    802034c2:	00008517          	auipc	a0,0x8
    802034c6:	51e53503          	ld	a0,1310(a0) # 8020b9e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    802034ca:	ffffd097          	auipc	ra,0xffffd
    802034ce:	27e080e7          	jalr	638(ra) # 80200748 <release>
  return 0;
    802034d2:	4781                	li	a5,0
}
    802034d4:	853e                	mv	a0,a5
    802034d6:	70e2                	ld	ra,56(sp)
    802034d8:	7442                	ld	s0,48(sp)
    802034da:	74a2                	ld	s1,40(sp)
    802034dc:	7902                	ld	s2,32(sp)
    802034de:	69e2                	ld	s3,24(sp)
    802034e0:	6121                	addi	sp,sp,64
    802034e2:	8082                	ret
      release(&tickslock);
    802034e4:	00008517          	auipc	a0,0x8
    802034e8:	4fc53503          	ld	a0,1276(a0) # 8020b9e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    802034ec:	ffffd097          	auipc	ra,0xffffd
    802034f0:	25c080e7          	jalr	604(ra) # 80200748 <release>
      return -1;
    802034f4:	57fd                	li	a5,-1
    802034f6:	bff9                	j	802034d4 <sys_sleep+0x8c>

00000000802034f8 <sys_kill>:

uint64
sys_kill(void)
{
    802034f8:	1101                	addi	sp,sp,-32
    802034fa:	ec06                	sd	ra,24(sp)
    802034fc:	e822                	sd	s0,16(sp)
    802034fe:	1000                	addi	s0,sp,32
  int pid;

  if(argint(0, &pid) < 0)
    80203500:	fec40593          	addi	a1,s0,-20
    80203504:	4501                	li	a0,0
    80203506:	00000097          	auipc	ra,0x0
    8020350a:	bc6080e7          	jalr	-1082(ra) # 802030cc <argint>
    8020350e:	87aa                	mv	a5,a0
    return -1;
    80203510:	557d                	li	a0,-1
  if(argint(0, &pid) < 0)
    80203512:	0007c863          	bltz	a5,80203522 <sys_kill+0x2a>
  return kill(pid);
    80203516:	fec42503          	lw	a0,-20(s0)
    8020351a:	fffff097          	auipc	ra,0xfffff
    8020351e:	034080e7          	jalr	52(ra) # 8020254e <kill>
}
    80203522:	60e2                	ld	ra,24(sp)
    80203524:	6442                	ld	s0,16(sp)
    80203526:	6105                	addi	sp,sp,32
    80203528:	8082                	ret

000000008020352a <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    8020352a:	1101                	addi	sp,sp,-32
    8020352c:	ec06                	sd	ra,24(sp)
    8020352e:	e822                	sd	s0,16(sp)
    80203530:	e426                	sd	s1,8(sp)
    80203532:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80203534:	00008517          	auipc	a0,0x8
    80203538:	4ac53503          	ld	a0,1196(a0) # 8020b9e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    8020353c:	ffffd097          	auipc	ra,0xffffd
    80203540:	1b8080e7          	jalr	440(ra) # 802006f4 <acquire>
  xticks = ticks;
    80203544:	00008797          	auipc	a5,0x8
    80203548:	4ac7b783          	ld	a5,1196(a5) # 8020b9f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    8020354c:	4384                	lw	s1,0(a5)
  release(&tickslock);
    8020354e:	00008517          	auipc	a0,0x8
    80203552:	49253503          	ld	a0,1170(a0) # 8020b9e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80203556:	ffffd097          	auipc	ra,0xffffd
    8020355a:	1f2080e7          	jalr	498(ra) # 80200748 <release>
  return xticks;
}
    8020355e:	02049513          	slli	a0,s1,0x20
    80203562:	9101                	srli	a0,a0,0x20
    80203564:	60e2                	ld	ra,24(sp)
    80203566:	6442                	ld	s0,16(sp)
    80203568:	64a2                	ld	s1,8(sp)
    8020356a:	6105                	addi	sp,sp,32
    8020356c:	8082                	ret

000000008020356e <sys_trace>:

uint64
sys_trace(void)
{
    8020356e:	1101                	addi	sp,sp,-32
    80203570:	ec06                	sd	ra,24(sp)
    80203572:	e822                	sd	s0,16(sp)
    80203574:	1000                	addi	s0,sp,32
  int mask;
  if(argint(0, &mask) < 0) {
    80203576:	fec40593          	addi	a1,s0,-20
    8020357a:	4501                	li	a0,0
    8020357c:	00000097          	auipc	ra,0x0
    80203580:	b50080e7          	jalr	-1200(ra) # 802030cc <argint>
    return -1;
    80203584:	57fd                	li	a5,-1
  if(argint(0, &mask) < 0) {
    80203586:	00054b63          	bltz	a0,8020359c <sys_trace+0x2e>
  }
  myproc()->tmask = mask;
    8020358a:	ffffe097          	auipc	ra,0xffffe
    8020358e:	54e080e7          	jalr	1358(ra) # 80201ad8 <myproc>
    80203592:	fec42783          	lw	a5,-20(s0)
    80203596:	16f52823          	sw	a5,368(a0)
  return 0;
    8020359a:	4781                	li	a5,0
}
    8020359c:	853e                	mv	a0,a5
    8020359e:	60e2                	ld	ra,24(sp)
    802035a0:	6442                	ld	s0,16(sp)
    802035a2:	6105                	addi	sp,sp,32
    802035a4:	8082                	ret

00000000802035a6 <sys_clone>:


uint64
sys_clone(void)
{
    802035a6:	1141                	addi	sp,sp,-16
    802035a8:	e406                	sd	ra,8(sp)
    802035aa:	e022                	sd	s0,0(sp)
    802035ac:	0800                	addi	s0,sp,16
  return clone();
    802035ae:	fffff097          	auipc	ra,0xfffff
    802035b2:	15e080e7          	jalr	350(ra) # 8020270c <clone>
}
    802035b6:	60a2                	ld	ra,8(sp)
    802035b8:	6402                	ld	s0,0(sp)
    802035ba:	0141                	addi	sp,sp,16
    802035bc:	8082                	ret

00000000802035be <sys_waitpid>:

uint64
sys_waitpid(void)
{
    802035be:	1101                	addi	sp,sp,-32
    802035c0:	ec06                	sd	ra,24(sp)
    802035c2:	e822                	sd	s0,16(sp)
    802035c4:	1000                	addi	s0,sp,32
  uint64 p;
  int pid;
  // 获取参数的地址
  if (argint(0, &pid) < 0 || argaddr(1, &p) < 0)
    802035c6:	fe440593          	addi	a1,s0,-28
    802035ca:	4501                	li	a0,0
    802035cc:	00000097          	auipc	ra,0x0
    802035d0:	b00080e7          	jalr	-1280(ra) # 802030cc <argint>
    return -1;
    802035d4:	57fd                	li	a5,-1
  if (argint(0, &pid) < 0 || argaddr(1, &p) < 0)
    802035d6:	02054563          	bltz	a0,80203600 <sys_waitpid+0x42>
    802035da:	fe840593          	addi	a1,s0,-24
    802035de:	4505                	li	a0,1
    802035e0:	00000097          	auipc	ra,0x0
    802035e4:	b4e080e7          	jalr	-1202(ra) # 8020312e <argaddr>
    return -1;
    802035e8:	57fd                	li	a5,-1
  if (argint(0, &pid) < 0 || argaddr(1, &p) < 0)
    802035ea:	00054b63          	bltz	a0,80203600 <sys_waitpid+0x42>
  return waitpid(pid, p);
    802035ee:	fe843583          	ld	a1,-24(s0)
    802035f2:	fe442503          	lw	a0,-28(s0)
    802035f6:	fffff097          	auipc	ra,0xfffff
    802035fa:	24e080e7          	jalr	590(ra) # 80202844 <waitpid>
    802035fe:	87aa                	mv	a5,a0
    80203600:	853e                	mv	a0,a5
    80203602:	60e2                	ld	ra,24(sp)
    80203604:	6442                	ld	s0,16(sp)
    80203606:	6105                	addi	sp,sp,32
    80203608:	8082                	ret

000000008020360a <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    8020360a:	7139                	addi	sp,sp,-64
    8020360c:	fc06                	sd	ra,56(sp)
    8020360e:	f822                	sd	s0,48(sp)
    80203610:	f426                	sd	s1,40(sp)
    80203612:	f04a                	sd	s2,32(sp)
    80203614:	ec4e                	sd	s3,24(sp)
    80203616:	e852                	sd	s4,16(sp)
    80203618:	e456                	sd	s5,8(sp)
    8020361a:	0080                	addi	s0,sp,64
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    8020361c:	00006597          	auipc	a1,0x6
    80203620:	53458593          	addi	a1,a1,1332 # 80209b50 <digits+0x7d0>
    80203624:	00015517          	auipc	a0,0x15
    80203628:	4cc50513          	addi	a0,a0,1228 # 80218af0 <bcache>
    8020362c:	ffffd097          	auipc	ra,0xffffd
    80203630:	084080e7          	jalr	132(ra) # 802006b0 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80203634:	00019797          	auipc	a5,0x19
    80203638:	4bc78793          	addi	a5,a5,1212 # 8021caf0 <bcache+0x4000>
    8020363c:	0001a717          	auipc	a4,0x1a
    80203640:	b1c70713          	addi	a4,a4,-1252 # 8021d158 <bcache+0x4668>
    80203644:	6ae7b823          	sd	a4,1712(a5)
  bcache.head.next = &bcache.head;
    80203648:	6ae7bc23          	sd	a4,1720(a5)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8020364c:	00015497          	auipc	s1,0x15
    80203650:	4bc48493          	addi	s1,s1,1212 # 80218b08 <bcache+0x18>
    b->refcnt = 0;
    b->sectorno = ~0;
    80203654:	5a7d                	li	s4,-1
    b->dev = ~0;
    b->next = bcache.head.next;
    80203656:	893e                	mv	s2,a5
    b->prev = &bcache.head;
    80203658:	89ba                	mv	s3,a4
    initsleeplock(&b->lock, "buffer");
    8020365a:	00006a97          	auipc	s5,0x6
    8020365e:	4fea8a93          	addi	s5,s5,1278 # 80209b58 <digits+0x7d8>
    b->refcnt = 0;
    80203662:	0404a023          	sw	zero,64(s1)
    b->sectorno = ~0;
    80203666:	0144a623          	sw	s4,12(s1)
    b->dev = ~0;
    8020366a:	0144a423          	sw	s4,8(s1)
    b->next = bcache.head.next;
    8020366e:	6b893783          	ld	a5,1720(s2)
    80203672:	e8bc                	sd	a5,80(s1)
    b->prev = &bcache.head;
    80203674:	0534b423          	sd	s3,72(s1)
    initsleeplock(&b->lock, "buffer");
    80203678:	85d6                	mv	a1,s5
    8020367a:	01048513          	addi	a0,s1,16
    8020367e:	00000097          	auipc	ra,0x0
    80203682:	27e080e7          	jalr	638(ra) # 802038fc <initsleeplock>
    bcache.head.next->prev = b;
    80203686:	6b893783          	ld	a5,1720(s2)
    8020368a:	e7a4                	sd	s1,72(a5)
    bcache.head.next = b;
    8020368c:	6a993c23          	sd	s1,1720(s2)
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80203690:	25848493          	addi	s1,s1,600
    80203694:	fd3497e3          	bne	s1,s3,80203662 <binit+0x58>
  }
  #ifdef DEBUG
  printf("binit\n");
    80203698:	00006517          	auipc	a0,0x6
    8020369c:	4c850513          	addi	a0,a0,1224 # 80209b60 <digits+0x7e0>
    802036a0:	ffffd097          	auipc	ra,0xffffd
    802036a4:	aee080e7          	jalr	-1298(ra) # 8020018e <printf>
  #endif
}
    802036a8:	70e2                	ld	ra,56(sp)
    802036aa:	7442                	ld	s0,48(sp)
    802036ac:	74a2                	ld	s1,40(sp)
    802036ae:	7902                	ld	s2,32(sp)
    802036b0:	69e2                	ld	s3,24(sp)
    802036b2:	6a42                	ld	s4,16(sp)
    802036b4:	6aa2                	ld	s5,8(sp)
    802036b6:	6121                	addi	sp,sp,64
    802036b8:	8082                	ret

00000000802036ba <bread>:
  panic("bget: no buffers");
}

// Return a locked buf with the contents of the indicated block.
struct buf* 
bread(uint dev, uint sectorno) {
    802036ba:	7179                	addi	sp,sp,-48
    802036bc:	f406                	sd	ra,40(sp)
    802036be:	f022                	sd	s0,32(sp)
    802036c0:	ec26                	sd	s1,24(sp)
    802036c2:	e84a                	sd	s2,16(sp)
    802036c4:	e44e                	sd	s3,8(sp)
    802036c6:	1800                	addi	s0,sp,48
    802036c8:	892a                	mv	s2,a0
    802036ca:	89ae                	mv	s3,a1
  acquire(&bcache.lock);
    802036cc:	00015517          	auipc	a0,0x15
    802036d0:	42450513          	addi	a0,a0,1060 # 80218af0 <bcache>
    802036d4:	ffffd097          	auipc	ra,0xffffd
    802036d8:	020080e7          	jalr	32(ra) # 802006f4 <acquire>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    802036dc:	0001a497          	auipc	s1,0x1a
    802036e0:	acc4b483          	ld	s1,-1332(s1) # 8021d1a8 <bcache+0x46b8>
    802036e4:	0001a797          	auipc	a5,0x1a
    802036e8:	a7478793          	addi	a5,a5,-1420 # 8021d158 <bcache+0x4668>
    802036ec:	02f48f63          	beq	s1,a5,8020372a <bread+0x70>
    802036f0:	873e                	mv	a4,a5
    802036f2:	a021                	j	802036fa <bread+0x40>
    802036f4:	68a4                	ld	s1,80(s1)
    802036f6:	02e48a63          	beq	s1,a4,8020372a <bread+0x70>
    if(b->dev == dev && b->sectorno == sectorno){
    802036fa:	449c                	lw	a5,8(s1)
    802036fc:	ff279ce3          	bne	a5,s2,802036f4 <bread+0x3a>
    80203700:	44dc                	lw	a5,12(s1)
    80203702:	ff3799e3          	bne	a5,s3,802036f4 <bread+0x3a>
      b->refcnt++;
    80203706:	40bc                	lw	a5,64(s1)
    80203708:	2785                	addiw	a5,a5,1
    8020370a:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    8020370c:	00015517          	auipc	a0,0x15
    80203710:	3e450513          	addi	a0,a0,996 # 80218af0 <bcache>
    80203714:	ffffd097          	auipc	ra,0xffffd
    80203718:	034080e7          	jalr	52(ra) # 80200748 <release>
      acquiresleep(&b->lock);
    8020371c:	01048513          	addi	a0,s1,16
    80203720:	00000097          	auipc	ra,0x0
    80203724:	216080e7          	jalr	534(ra) # 80203936 <acquiresleep>
      return b;
    80203728:	a8b9                	j	80203786 <bread+0xcc>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8020372a:	0001a497          	auipc	s1,0x1a
    8020372e:	a764b483          	ld	s1,-1418(s1) # 8021d1a0 <bcache+0x46b0>
    80203732:	0001a797          	auipc	a5,0x1a
    80203736:	a2678793          	addi	a5,a5,-1498 # 8021d158 <bcache+0x4668>
    8020373a:	00f48863          	beq	s1,a5,8020374a <bread+0x90>
    8020373e:	873e                	mv	a4,a5
    if(b->refcnt == 0) {
    80203740:	40bc                	lw	a5,64(s1)
    80203742:	cf81                	beqz	a5,8020375a <bread+0xa0>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80203744:	64a4                	ld	s1,72(s1)
    80203746:	fee49de3          	bne	s1,a4,80203740 <bread+0x86>
  panic("bget: no buffers");
    8020374a:	00006517          	auipc	a0,0x6
    8020374e:	41e50513          	addi	a0,a0,1054 # 80209b68 <digits+0x7e8>
    80203752:	ffffd097          	auipc	ra,0xffffd
    80203756:	9f2080e7          	jalr	-1550(ra) # 80200144 <panic>
      b->dev = dev;
    8020375a:	0124a423          	sw	s2,8(s1)
      b->sectorno = sectorno;
    8020375e:	0134a623          	sw	s3,12(s1)
      b->valid = 0;
    80203762:	0004a023          	sw	zero,0(s1)
      b->refcnt = 1;
    80203766:	4785                	li	a5,1
    80203768:	c0bc                	sw	a5,64(s1)
      release(&bcache.lock);
    8020376a:	00015517          	auipc	a0,0x15
    8020376e:	38650513          	addi	a0,a0,902 # 80218af0 <bcache>
    80203772:	ffffd097          	auipc	ra,0xffffd
    80203776:	fd6080e7          	jalr	-42(ra) # 80200748 <release>
      acquiresleep(&b->lock);
    8020377a:	01048513          	addi	a0,s1,16
    8020377e:	00000097          	auipc	ra,0x0
    80203782:	1b8080e7          	jalr	440(ra) # 80203936 <acquiresleep>
  struct buf *b;

  b = bget(dev, sectorno);
  if (!b->valid) {
    80203786:	409c                	lw	a5,0(s1)
    80203788:	cb89                	beqz	a5,8020379a <bread+0xe0>
    disk_read(b);
    b->valid = 1;
  }

  return b;
}
    8020378a:	8526                	mv	a0,s1
    8020378c:	70a2                	ld	ra,40(sp)
    8020378e:	7402                	ld	s0,32(sp)
    80203790:	64e2                	ld	s1,24(sp)
    80203792:	6942                	ld	s2,16(sp)
    80203794:	69a2                	ld	s3,8(sp)
    80203796:	6145                	addi	sp,sp,48
    80203798:	8082                	ret
    disk_read(b);
    8020379a:	8526                	mv	a0,s1
    8020379c:	00002097          	auipc	ra,0x2
    802037a0:	c16080e7          	jalr	-1002(ra) # 802053b2 <disk_read>
    b->valid = 1;
    802037a4:	4785                	li	a5,1
    802037a6:	c09c                	sw	a5,0(s1)
  return b;
    802037a8:	b7cd                	j	8020378a <bread+0xd0>

00000000802037aa <bwrite>:

// Write b's contents to disk.  Must be locked.
void 
bwrite(struct buf *b) {
    802037aa:	1101                	addi	sp,sp,-32
    802037ac:	ec06                	sd	ra,24(sp)
    802037ae:	e822                	sd	s0,16(sp)
    802037b0:	e426                	sd	s1,8(sp)
    802037b2:	1000                	addi	s0,sp,32
    802037b4:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    802037b6:	0541                	addi	a0,a0,16
    802037b8:	00000097          	auipc	ra,0x0
    802037bc:	218080e7          	jalr	536(ra) # 802039d0 <holdingsleep>
    802037c0:	c919                	beqz	a0,802037d6 <bwrite+0x2c>
    panic("bwrite");
  disk_write(b);
    802037c2:	8526                	mv	a0,s1
    802037c4:	00002097          	auipc	ra,0x2
    802037c8:	c08080e7          	jalr	-1016(ra) # 802053cc <disk_write>
}
    802037cc:	60e2                	ld	ra,24(sp)
    802037ce:	6442                	ld	s0,16(sp)
    802037d0:	64a2                	ld	s1,8(sp)
    802037d2:	6105                	addi	sp,sp,32
    802037d4:	8082                	ret
    panic("bwrite");
    802037d6:	00006517          	auipc	a0,0x6
    802037da:	3aa50513          	addi	a0,a0,938 # 80209b80 <digits+0x800>
    802037de:	ffffd097          	auipc	ra,0xffffd
    802037e2:	966080e7          	jalr	-1690(ra) # 80200144 <panic>

00000000802037e6 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    802037e6:	1101                	addi	sp,sp,-32
    802037e8:	ec06                	sd	ra,24(sp)
    802037ea:	e822                	sd	s0,16(sp)
    802037ec:	e426                	sd	s1,8(sp)
    802037ee:	e04a                	sd	s2,0(sp)
    802037f0:	1000                	addi	s0,sp,32
    802037f2:	84aa                	mv	s1,a0
  if(!holdingsleep(&b->lock))
    802037f4:	01050913          	addi	s2,a0,16
    802037f8:	854a                	mv	a0,s2
    802037fa:	00000097          	auipc	ra,0x0
    802037fe:	1d6080e7          	jalr	470(ra) # 802039d0 <holdingsleep>
    80203802:	c92d                	beqz	a0,80203874 <brelse+0x8e>
    panic("brelse");

  releasesleep(&b->lock);
    80203804:	854a                	mv	a0,s2
    80203806:	00000097          	auipc	ra,0x0
    8020380a:	186080e7          	jalr	390(ra) # 8020398c <releasesleep>

  acquire(&bcache.lock);
    8020380e:	00015517          	auipc	a0,0x15
    80203812:	2e250513          	addi	a0,a0,738 # 80218af0 <bcache>
    80203816:	ffffd097          	auipc	ra,0xffffd
    8020381a:	ede080e7          	jalr	-290(ra) # 802006f4 <acquire>
  b->refcnt--;
    8020381e:	40bc                	lw	a5,64(s1)
    80203820:	37fd                	addiw	a5,a5,-1
    80203822:	0007871b          	sext.w	a4,a5
    80203826:	c0bc                	sw	a5,64(s1)
  if (b->refcnt == 0) {
    80203828:	eb05                	bnez	a4,80203858 <brelse+0x72>
    // no one is waiting for it.
    b->next->prev = b->prev;
    8020382a:	68bc                	ld	a5,80(s1)
    8020382c:	64b8                	ld	a4,72(s1)
    8020382e:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80203830:	64bc                	ld	a5,72(s1)
    80203832:	68b8                	ld	a4,80(s1)
    80203834:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80203836:	00019797          	auipc	a5,0x19
    8020383a:	2ba78793          	addi	a5,a5,698 # 8021caf0 <bcache+0x4000>
    8020383e:	6b87b703          	ld	a4,1720(a5)
    80203842:	e8b8                	sd	a4,80(s1)
    b->prev = &bcache.head;
    80203844:	0001a717          	auipc	a4,0x1a
    80203848:	91470713          	addi	a4,a4,-1772 # 8021d158 <bcache+0x4668>
    8020384c:	e4b8                	sd	a4,72(s1)
    bcache.head.next->prev = b;
    8020384e:	6b87b703          	ld	a4,1720(a5)
    80203852:	e724                	sd	s1,72(a4)
    bcache.head.next = b;
    80203854:	6a97bc23          	sd	s1,1720(a5)
  }
  
  release(&bcache.lock);
    80203858:	00015517          	auipc	a0,0x15
    8020385c:	29850513          	addi	a0,a0,664 # 80218af0 <bcache>
    80203860:	ffffd097          	auipc	ra,0xffffd
    80203864:	ee8080e7          	jalr	-280(ra) # 80200748 <release>
}
    80203868:	60e2                	ld	ra,24(sp)
    8020386a:	6442                	ld	s0,16(sp)
    8020386c:	64a2                	ld	s1,8(sp)
    8020386e:	6902                	ld	s2,0(sp)
    80203870:	6105                	addi	sp,sp,32
    80203872:	8082                	ret
    panic("brelse");
    80203874:	00006517          	auipc	a0,0x6
    80203878:	31450513          	addi	a0,a0,788 # 80209b88 <digits+0x808>
    8020387c:	ffffd097          	auipc	ra,0xffffd
    80203880:	8c8080e7          	jalr	-1848(ra) # 80200144 <panic>

0000000080203884 <bpin>:

void
bpin(struct buf *b) {
    80203884:	1101                	addi	sp,sp,-32
    80203886:	ec06                	sd	ra,24(sp)
    80203888:	e822                	sd	s0,16(sp)
    8020388a:	e426                	sd	s1,8(sp)
    8020388c:	1000                	addi	s0,sp,32
    8020388e:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    80203890:	00015517          	auipc	a0,0x15
    80203894:	26050513          	addi	a0,a0,608 # 80218af0 <bcache>
    80203898:	ffffd097          	auipc	ra,0xffffd
    8020389c:	e5c080e7          	jalr	-420(ra) # 802006f4 <acquire>
  b->refcnt++;
    802038a0:	40bc                	lw	a5,64(s1)
    802038a2:	2785                	addiw	a5,a5,1
    802038a4:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    802038a6:	00015517          	auipc	a0,0x15
    802038aa:	24a50513          	addi	a0,a0,586 # 80218af0 <bcache>
    802038ae:	ffffd097          	auipc	ra,0xffffd
    802038b2:	e9a080e7          	jalr	-358(ra) # 80200748 <release>
}
    802038b6:	60e2                	ld	ra,24(sp)
    802038b8:	6442                	ld	s0,16(sp)
    802038ba:	64a2                	ld	s1,8(sp)
    802038bc:	6105                	addi	sp,sp,32
    802038be:	8082                	ret

00000000802038c0 <bunpin>:

void
bunpin(struct buf *b) {
    802038c0:	1101                	addi	sp,sp,-32
    802038c2:	ec06                	sd	ra,24(sp)
    802038c4:	e822                	sd	s0,16(sp)
    802038c6:	e426                	sd	s1,8(sp)
    802038c8:	1000                	addi	s0,sp,32
    802038ca:	84aa                	mv	s1,a0
  acquire(&bcache.lock);
    802038cc:	00015517          	auipc	a0,0x15
    802038d0:	22450513          	addi	a0,a0,548 # 80218af0 <bcache>
    802038d4:	ffffd097          	auipc	ra,0xffffd
    802038d8:	e20080e7          	jalr	-480(ra) # 802006f4 <acquire>
  b->refcnt--;
    802038dc:	40bc                	lw	a5,64(s1)
    802038de:	37fd                	addiw	a5,a5,-1
    802038e0:	c0bc                	sw	a5,64(s1)
  release(&bcache.lock);
    802038e2:	00015517          	auipc	a0,0x15
    802038e6:	20e50513          	addi	a0,a0,526 # 80218af0 <bcache>
    802038ea:	ffffd097          	auipc	ra,0xffffd
    802038ee:	e5e080e7          	jalr	-418(ra) # 80200748 <release>
}
    802038f2:	60e2                	ld	ra,24(sp)
    802038f4:	6442                	ld	s0,16(sp)
    802038f6:	64a2                	ld	s1,8(sp)
    802038f8:	6105                	addi	sp,sp,32
    802038fa:	8082                	ret

00000000802038fc <initsleeplock>:
#include "include/proc.h"
#include "include/sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    802038fc:	1101                	addi	sp,sp,-32
    802038fe:	ec06                	sd	ra,24(sp)
    80203900:	e822                	sd	s0,16(sp)
    80203902:	e426                	sd	s1,8(sp)
    80203904:	e04a                	sd	s2,0(sp)
    80203906:	1000                	addi	s0,sp,32
    80203908:	84aa                	mv	s1,a0
    8020390a:	892e                	mv	s2,a1
  initlock(&lk->lk, "sleep lock");
    8020390c:	00006597          	auipc	a1,0x6
    80203910:	28458593          	addi	a1,a1,644 # 80209b90 <digits+0x810>
    80203914:	0521                	addi	a0,a0,8
    80203916:	ffffd097          	auipc	ra,0xffffd
    8020391a:	d9a080e7          	jalr	-614(ra) # 802006b0 <initlock>
  lk->name = name;
    8020391e:	0324b023          	sd	s2,32(s1)
  lk->locked = 0;
    80203922:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    80203926:	0204a423          	sw	zero,40(s1)
}
    8020392a:	60e2                	ld	ra,24(sp)
    8020392c:	6442                	ld	s0,16(sp)
    8020392e:	64a2                	ld	s1,8(sp)
    80203930:	6902                	ld	s2,0(sp)
    80203932:	6105                	addi	sp,sp,32
    80203934:	8082                	ret

0000000080203936 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80203936:	1101                	addi	sp,sp,-32
    80203938:	ec06                	sd	ra,24(sp)
    8020393a:	e822                	sd	s0,16(sp)
    8020393c:	e426                	sd	s1,8(sp)
    8020393e:	e04a                	sd	s2,0(sp)
    80203940:	1000                	addi	s0,sp,32
    80203942:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    80203944:	00850913          	addi	s2,a0,8
    80203948:	854a                	mv	a0,s2
    8020394a:	ffffd097          	auipc	ra,0xffffd
    8020394e:	daa080e7          	jalr	-598(ra) # 802006f4 <acquire>
  while (lk->locked) {
    80203952:	409c                	lw	a5,0(s1)
    80203954:	cb89                	beqz	a5,80203966 <acquiresleep+0x30>
    sleep(lk, &lk->lk);
    80203956:	85ca                	mv	a1,s2
    80203958:	8526                	mv	a0,s1
    8020395a:	fffff097          	auipc	ra,0xfffff
    8020395e:	a0e080e7          	jalr	-1522(ra) # 80202368 <sleep>
  while (lk->locked) {
    80203962:	409c                	lw	a5,0(s1)
    80203964:	fbed                	bnez	a5,80203956 <acquiresleep+0x20>
  }
  lk->locked = 1;
    80203966:	4785                	li	a5,1
    80203968:	c09c                	sw	a5,0(s1)
  lk->pid = myproc()->pid;
    8020396a:	ffffe097          	auipc	ra,0xffffe
    8020396e:	16e080e7          	jalr	366(ra) # 80201ad8 <myproc>
    80203972:	5d1c                	lw	a5,56(a0)
    80203974:	d49c                	sw	a5,40(s1)
  release(&lk->lk);
    80203976:	854a                	mv	a0,s2
    80203978:	ffffd097          	auipc	ra,0xffffd
    8020397c:	dd0080e7          	jalr	-560(ra) # 80200748 <release>
}
    80203980:	60e2                	ld	ra,24(sp)
    80203982:	6442                	ld	s0,16(sp)
    80203984:	64a2                	ld	s1,8(sp)
    80203986:	6902                	ld	s2,0(sp)
    80203988:	6105                	addi	sp,sp,32
    8020398a:	8082                	ret

000000008020398c <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    8020398c:	1101                	addi	sp,sp,-32
    8020398e:	ec06                	sd	ra,24(sp)
    80203990:	e822                	sd	s0,16(sp)
    80203992:	e426                	sd	s1,8(sp)
    80203994:	e04a                	sd	s2,0(sp)
    80203996:	1000                	addi	s0,sp,32
    80203998:	84aa                	mv	s1,a0
  acquire(&lk->lk);
    8020399a:	00850913          	addi	s2,a0,8
    8020399e:	854a                	mv	a0,s2
    802039a0:	ffffd097          	auipc	ra,0xffffd
    802039a4:	d54080e7          	jalr	-684(ra) # 802006f4 <acquire>
  lk->locked = 0;
    802039a8:	0004a023          	sw	zero,0(s1)
  lk->pid = 0;
    802039ac:	0204a423          	sw	zero,40(s1)
  wakeup(lk);
    802039b0:	8526                	mv	a0,s1
    802039b2:	fffff097          	auipc	ra,0xfffff
    802039b6:	b32080e7          	jalr	-1230(ra) # 802024e4 <wakeup>
  release(&lk->lk);
    802039ba:	854a                	mv	a0,s2
    802039bc:	ffffd097          	auipc	ra,0xffffd
    802039c0:	d8c080e7          	jalr	-628(ra) # 80200748 <release>
}
    802039c4:	60e2                	ld	ra,24(sp)
    802039c6:	6442                	ld	s0,16(sp)
    802039c8:	64a2                	ld	s1,8(sp)
    802039ca:	6902                	ld	s2,0(sp)
    802039cc:	6105                	addi	sp,sp,32
    802039ce:	8082                	ret

00000000802039d0 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    802039d0:	7179                	addi	sp,sp,-48
    802039d2:	f406                	sd	ra,40(sp)
    802039d4:	f022                	sd	s0,32(sp)
    802039d6:	ec26                	sd	s1,24(sp)
    802039d8:	e84a                	sd	s2,16(sp)
    802039da:	e44e                	sd	s3,8(sp)
    802039dc:	1800                	addi	s0,sp,48
    802039de:	84aa                	mv	s1,a0
  int r;
  
  acquire(&lk->lk);
    802039e0:	00850913          	addi	s2,a0,8
    802039e4:	854a                	mv	a0,s2
    802039e6:	ffffd097          	auipc	ra,0xffffd
    802039ea:	d0e080e7          	jalr	-754(ra) # 802006f4 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    802039ee:	409c                	lw	a5,0(s1)
    802039f0:	ef99                	bnez	a5,80203a0e <holdingsleep+0x3e>
    802039f2:	4481                	li	s1,0
  release(&lk->lk);
    802039f4:	854a                	mv	a0,s2
    802039f6:	ffffd097          	auipc	ra,0xffffd
    802039fa:	d52080e7          	jalr	-686(ra) # 80200748 <release>
  return r;
}
    802039fe:	8526                	mv	a0,s1
    80203a00:	70a2                	ld	ra,40(sp)
    80203a02:	7402                	ld	s0,32(sp)
    80203a04:	64e2                	ld	s1,24(sp)
    80203a06:	6942                	ld	s2,16(sp)
    80203a08:	69a2                	ld	s3,8(sp)
    80203a0a:	6145                	addi	sp,sp,48
    80203a0c:	8082                	ret
  r = lk->locked && (lk->pid == myproc()->pid);
    80203a0e:	0284a983          	lw	s3,40(s1)
    80203a12:	ffffe097          	auipc	ra,0xffffe
    80203a16:	0c6080e7          	jalr	198(ra) # 80201ad8 <myproc>
    80203a1a:	5d04                	lw	s1,56(a0)
    80203a1c:	413484b3          	sub	s1,s1,s3
    80203a20:	0014b493          	seqz	s1,s1
    80203a24:	bfc1                	j	802039f4 <holdingsleep+0x24>

0000000080203a26 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80203a26:	1101                	addi	sp,sp,-32
    80203a28:	ec06                	sd	ra,24(sp)
    80203a2a:	e822                	sd	s0,16(sp)
    80203a2c:	e426                	sd	s1,8(sp)
    80203a2e:	e04a                	sd	s2,0(sp)
    80203a30:	1000                	addi	s0,sp,32
  initlock(&ftable.lock, "ftable");
    80203a32:	00006597          	auipc	a1,0x6
    80203a36:	16e58593          	addi	a1,a1,366 # 80209ba0 <digits+0x820>
    80203a3a:	0001a517          	auipc	a0,0x1a
    80203a3e:	a1650513          	addi	a0,a0,-1514 # 8021d450 <ftable>
    80203a42:	ffffd097          	auipc	ra,0xffffd
    80203a46:	c6e080e7          	jalr	-914(ra) # 802006b0 <initlock>
  struct file *f;
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203a4a:	0001a497          	auipc	s1,0x1a
    80203a4e:	a1e48493          	addi	s1,s1,-1506 # 8021d468 <ftable+0x18>
    80203a52:	0001b917          	auipc	s2,0x1b
    80203a56:	9b690913          	addi	s2,s2,-1610 # 8021e408 <tickslock>
    memset(f, 0, sizeof(struct file));
    80203a5a:	02800613          	li	a2,40
    80203a5e:	4581                	li	a1,0
    80203a60:	8526                	mv	a0,s1
    80203a62:	ffffd097          	auipc	ra,0xffffd
    80203a66:	d2e080e7          	jalr	-722(ra) # 80200790 <memset>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203a6a:	02848493          	addi	s1,s1,40
    80203a6e:	ff2496e3          	bne	s1,s2,80203a5a <fileinit+0x34>
  }
  #ifdef DEBUG
  printf("fileinit\n");
    80203a72:	00006517          	auipc	a0,0x6
    80203a76:	13650513          	addi	a0,a0,310 # 80209ba8 <digits+0x828>
    80203a7a:	ffffc097          	auipc	ra,0xffffc
    80203a7e:	714080e7          	jalr	1812(ra) # 8020018e <printf>
  #endif
}
    80203a82:	60e2                	ld	ra,24(sp)
    80203a84:	6442                	ld	s0,16(sp)
    80203a86:	64a2                	ld	s1,8(sp)
    80203a88:	6902                	ld	s2,0(sp)
    80203a8a:	6105                	addi	sp,sp,32
    80203a8c:	8082                	ret

0000000080203a8e <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80203a8e:	1101                	addi	sp,sp,-32
    80203a90:	ec06                	sd	ra,24(sp)
    80203a92:	e822                	sd	s0,16(sp)
    80203a94:	e426                	sd	s1,8(sp)
    80203a96:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80203a98:	0001a517          	auipc	a0,0x1a
    80203a9c:	9b850513          	addi	a0,a0,-1608 # 8021d450 <ftable>
    80203aa0:	ffffd097          	auipc	ra,0xffffd
    80203aa4:	c54080e7          	jalr	-940(ra) # 802006f4 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203aa8:	0001a497          	auipc	s1,0x1a
    80203aac:	9c048493          	addi	s1,s1,-1600 # 8021d468 <ftable+0x18>
    80203ab0:	0001b717          	auipc	a4,0x1b
    80203ab4:	95870713          	addi	a4,a4,-1704 # 8021e408 <tickslock>
    if(f->ref == 0){
    80203ab8:	40dc                	lw	a5,4(s1)
    80203aba:	cf99                	beqz	a5,80203ad8 <filealloc+0x4a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80203abc:	02848493          	addi	s1,s1,40
    80203ac0:	fee49ce3          	bne	s1,a4,80203ab8 <filealloc+0x2a>
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
    80203ac4:	0001a517          	auipc	a0,0x1a
    80203ac8:	98c50513          	addi	a0,a0,-1652 # 8021d450 <ftable>
    80203acc:	ffffd097          	auipc	ra,0xffffd
    80203ad0:	c7c080e7          	jalr	-900(ra) # 80200748 <release>
  return NULL;
    80203ad4:	4481                	li	s1,0
    80203ad6:	a819                	j	80203aec <filealloc+0x5e>
      f->ref = 1;
    80203ad8:	4785                	li	a5,1
    80203ada:	c0dc                	sw	a5,4(s1)
      release(&ftable.lock);
    80203adc:	0001a517          	auipc	a0,0x1a
    80203ae0:	97450513          	addi	a0,a0,-1676 # 8021d450 <ftable>
    80203ae4:	ffffd097          	auipc	ra,0xffffd
    80203ae8:	c64080e7          	jalr	-924(ra) # 80200748 <release>
}
    80203aec:	8526                	mv	a0,s1
    80203aee:	60e2                	ld	ra,24(sp)
    80203af0:	6442                	ld	s0,16(sp)
    80203af2:	64a2                	ld	s1,8(sp)
    80203af4:	6105                	addi	sp,sp,32
    80203af6:	8082                	ret

0000000080203af8 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80203af8:	1101                	addi	sp,sp,-32
    80203afa:	ec06                	sd	ra,24(sp)
    80203afc:	e822                	sd	s0,16(sp)
    80203afe:	e426                	sd	s1,8(sp)
    80203b00:	1000                	addi	s0,sp,32
    80203b02:	84aa                	mv	s1,a0
  acquire(&ftable.lock);
    80203b04:	0001a517          	auipc	a0,0x1a
    80203b08:	94c50513          	addi	a0,a0,-1716 # 8021d450 <ftable>
    80203b0c:	ffffd097          	auipc	ra,0xffffd
    80203b10:	be8080e7          	jalr	-1048(ra) # 802006f4 <acquire>
  if(f->ref < 1)
    80203b14:	40dc                	lw	a5,4(s1)
    80203b16:	02f05263          	blez	a5,80203b3a <filedup+0x42>
    panic("filedup");
  f->ref++;
    80203b1a:	2785                	addiw	a5,a5,1
    80203b1c:	c0dc                	sw	a5,4(s1)
  release(&ftable.lock);
    80203b1e:	0001a517          	auipc	a0,0x1a
    80203b22:	93250513          	addi	a0,a0,-1742 # 8021d450 <ftable>
    80203b26:	ffffd097          	auipc	ra,0xffffd
    80203b2a:	c22080e7          	jalr	-990(ra) # 80200748 <release>
  return f;
}
    80203b2e:	8526                	mv	a0,s1
    80203b30:	60e2                	ld	ra,24(sp)
    80203b32:	6442                	ld	s0,16(sp)
    80203b34:	64a2                	ld	s1,8(sp)
    80203b36:	6105                	addi	sp,sp,32
    80203b38:	8082                	ret
    panic("filedup");
    80203b3a:	00006517          	auipc	a0,0x6
    80203b3e:	07e50513          	addi	a0,a0,126 # 80209bb8 <digits+0x838>
    80203b42:	ffffc097          	auipc	ra,0xffffc
    80203b46:	602080e7          	jalr	1538(ra) # 80200144 <panic>

0000000080203b4a <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80203b4a:	7139                	addi	sp,sp,-64
    80203b4c:	fc06                	sd	ra,56(sp)
    80203b4e:	f822                	sd	s0,48(sp)
    80203b50:	f426                	sd	s1,40(sp)
    80203b52:	f04a                	sd	s2,32(sp)
    80203b54:	ec4e                	sd	s3,24(sp)
    80203b56:	e852                	sd	s4,16(sp)
    80203b58:	e456                	sd	s5,8(sp)
    80203b5a:	0080                	addi	s0,sp,64
    80203b5c:	84aa                	mv	s1,a0
  struct file ff;

  acquire(&ftable.lock);
    80203b5e:	0001a517          	auipc	a0,0x1a
    80203b62:	8f250513          	addi	a0,a0,-1806 # 8021d450 <ftable>
    80203b66:	ffffd097          	auipc	ra,0xffffd
    80203b6a:	b8e080e7          	jalr	-1138(ra) # 802006f4 <acquire>
  if(f->ref < 1)
    80203b6e:	40dc                	lw	a5,4(s1)
    80203b70:	04f05863          	blez	a5,80203bc0 <fileclose+0x76>
    panic("fileclose");
  if(--f->ref > 0){
    80203b74:	37fd                	addiw	a5,a5,-1
    80203b76:	0007871b          	sext.w	a4,a5
    80203b7a:	c0dc                	sw	a5,4(s1)
    80203b7c:	04e04a63          	bgtz	a4,80203bd0 <fileclose+0x86>
    release(&ftable.lock);
    return;
  }
  ff = *f;
    80203b80:	0004a903          	lw	s2,0(s1)
    80203b84:	0094ca03          	lbu	s4,9(s1)
    80203b88:	0104b983          	ld	s3,16(s1)
    80203b8c:	0184ba83          	ld	s5,24(s1)
  f->ref = 0;
    80203b90:	0004a223          	sw	zero,4(s1)
  f->type = FD_NONE;
    80203b94:	0004a023          	sw	zero,0(s1)
  release(&ftable.lock);
    80203b98:	0001a517          	auipc	a0,0x1a
    80203b9c:	8b850513          	addi	a0,a0,-1864 # 8021d450 <ftable>
    80203ba0:	ffffd097          	auipc	ra,0xffffd
    80203ba4:	ba8080e7          	jalr	-1112(ra) # 80200748 <release>

  if(ff.type == FD_PIPE){
    80203ba8:	4785                	li	a5,1
    80203baa:	04f90463          	beq	s2,a5,80203bf2 <fileclose+0xa8>
    pipeclose(ff.pipe, ff.writable);
  } else if(ff.type == FD_ENTRY){
    80203bae:	4789                	li	a5,2
    80203bb0:	02f91863          	bne	s2,a5,80203be0 <fileclose+0x96>
    eput(ff.ep);
    80203bb4:	8556                	mv	a0,s5
    80203bb6:	00003097          	auipc	ra,0x3
    80203bba:	a9e080e7          	jalr	-1378(ra) # 80206654 <eput>
    80203bbe:	a00d                	j	80203be0 <fileclose+0x96>
    panic("fileclose");
    80203bc0:	00006517          	auipc	a0,0x6
    80203bc4:	00050513          	mv	a0,a0
    80203bc8:	ffffc097          	auipc	ra,0xffffc
    80203bcc:	57c080e7          	jalr	1404(ra) # 80200144 <panic>
    release(&ftable.lock);
    80203bd0:	0001a517          	auipc	a0,0x1a
    80203bd4:	88050513          	addi	a0,a0,-1920 # 8021d450 <ftable>
    80203bd8:	ffffd097          	auipc	ra,0xffffd
    80203bdc:	b70080e7          	jalr	-1168(ra) # 80200748 <release>
  } else if (ff.type == FD_DEVICE) {

  }
}
    80203be0:	70e2                	ld	ra,56(sp)
    80203be2:	7442                	ld	s0,48(sp)
    80203be4:	74a2                	ld	s1,40(sp)
    80203be6:	7902                	ld	s2,32(sp)
    80203be8:	69e2                	ld	s3,24(sp)
    80203bea:	6a42                	ld	s4,16(sp)
    80203bec:	6aa2                	ld	s5,8(sp)
    80203bee:	6121                	addi	sp,sp,64
    80203bf0:	8082                	ret
    pipeclose(ff.pipe, ff.writable);
    80203bf2:	85d2                	mv	a1,s4
    80203bf4:	854e                	mv	a0,s3
    80203bf6:	00000097          	auipc	ra,0x0
    80203bfa:	3a0080e7          	jalr	928(ra) # 80203f96 <pipeclose>
    80203bfe:	b7cd                	j	80203be0 <fileclose+0x96>

0000000080203c00 <filestat>:
filestat(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();
  struct stat st;
  
  if(f->type == FD_ENTRY){
    80203c00:	4118                	lw	a4,0(a0)
    80203c02:	4789                	li	a5,2
    80203c04:	04f71e63          	bne	a4,a5,80203c60 <filestat+0x60>
{
    80203c08:	7159                	addi	sp,sp,-112
    80203c0a:	f486                	sd	ra,104(sp)
    80203c0c:	f0a2                	sd	s0,96(sp)
    80203c0e:	eca6                	sd	s1,88(sp)
    80203c10:	e8ca                	sd	s2,80(sp)
    80203c12:	e4ce                	sd	s3,72(sp)
    80203c14:	1880                	addi	s0,sp,112
    80203c16:	84aa                	mv	s1,a0
    80203c18:	892e                	mv	s2,a1
    elock(f->ep);
    80203c1a:	6d08                	ld	a0,24(a0)
    80203c1c:	00003097          	auipc	ra,0x3
    80203c20:	9b4080e7          	jalr	-1612(ra) # 802065d0 <elock>
    estat(f->ep, &st);
    80203c24:	f9840993          	addi	s3,s0,-104
    80203c28:	85ce                	mv	a1,s3
    80203c2a:	6c88                	ld	a0,24(s1)
    80203c2c:	00003097          	auipc	ra,0x3
    80203c30:	b60080e7          	jalr	-1184(ra) # 8020678c <estat>
    eunlock(f->ep);
    80203c34:	6c88                	ld	a0,24(s1)
    80203c36:	00003097          	auipc	ra,0x3
    80203c3a:	9d0080e7          	jalr	-1584(ra) # 80206606 <eunlock>
    // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203c3e:	03800613          	li	a2,56
    80203c42:	85ce                	mv	a1,s3
    80203c44:	854a                	mv	a0,s2
    80203c46:	ffffd097          	auipc	ra,0xffffd
    80203c4a:	7b8080e7          	jalr	1976(ra) # 802013fe <copyout2>
    80203c4e:	41f5551b          	sraiw	a0,a0,0x1f
      return -1;
    return 0;
  }
  return -1;
}
    80203c52:	70a6                	ld	ra,104(sp)
    80203c54:	7406                	ld	s0,96(sp)
    80203c56:	64e6                	ld	s1,88(sp)
    80203c58:	6946                	ld	s2,80(sp)
    80203c5a:	69a6                	ld	s3,72(sp)
    80203c5c:	6165                	addi	sp,sp,112
    80203c5e:	8082                	ret
  return -1;
    80203c60:	557d                	li	a0,-1
}
    80203c62:	8082                	ret

0000000080203c64 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80203c64:	7179                	addi	sp,sp,-48
    80203c66:	f406                	sd	ra,40(sp)
    80203c68:	f022                	sd	s0,32(sp)
    80203c6a:	ec26                	sd	s1,24(sp)
    80203c6c:	e84a                	sd	s2,16(sp)
    80203c6e:	e44e                	sd	s3,8(sp)
    80203c70:	1800                	addi	s0,sp,48
  int r = 0;

  if(f->readable == 0)
    80203c72:	00854783          	lbu	a5,8(a0)
    80203c76:	c3d5                	beqz	a5,80203d1a <fileread+0xb6>
    80203c78:	84aa                	mv	s1,a0
    80203c7a:	89ae                	mv	s3,a1
    80203c7c:	8932                	mv	s2,a2
    return -1;

  switch (f->type) {
    80203c7e:	411c                	lw	a5,0(a0)
    80203c80:	4709                	li	a4,2
    80203c82:	06e78263          	beq	a5,a4,80203ce6 <fileread+0x82>
    80203c86:	470d                	li	a4,3
    80203c88:	02e78b63          	beq	a5,a4,80203cbe <fileread+0x5a>
    80203c8c:	4705                	li	a4,1
    80203c8e:	00e78a63          	beq	a5,a4,80203ca2 <fileread+0x3e>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
            f->off += r;
        eunlock(f->ep);
        break;
    default:
      panic("fileread");
    80203c92:	00006517          	auipc	a0,0x6
    80203c96:	f3e50513          	addi	a0,a0,-194 # 80209bd0 <digits+0x850>
    80203c9a:	ffffc097          	auipc	ra,0xffffc
    80203c9e:	4aa080e7          	jalr	1194(ra) # 80200144 <panic>
        r = piperead(f->pipe, addr, n);
    80203ca2:	6908                	ld	a0,16(a0)
    80203ca4:	00000097          	auipc	ra,0x0
    80203ca8:	466080e7          	jalr	1126(ra) # 8020410a <piperead>
    80203cac:	892a                	mv	s2,a0
  }

  return r;
}
    80203cae:	854a                	mv	a0,s2
    80203cb0:	70a2                	ld	ra,40(sp)
    80203cb2:	7402                	ld	s0,32(sp)
    80203cb4:	64e2                	ld	s1,24(sp)
    80203cb6:	6942                	ld	s2,16(sp)
    80203cb8:	69a2                	ld	s3,8(sp)
    80203cba:	6145                	addi	sp,sp,48
    80203cbc:	8082                	ret
        if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80203cbe:	02451783          	lh	a5,36(a0)
    80203cc2:	03079693          	slli	a3,a5,0x30
    80203cc6:	92c1                	srli	a3,a3,0x30
    80203cc8:	4725                	li	a4,9
    80203cca:	04d76a63          	bltu	a4,a3,80203d1e <fileread+0xba>
    80203cce:	0792                	slli	a5,a5,0x4
    80203cd0:	00019717          	auipc	a4,0x19
    80203cd4:	6e070713          	addi	a4,a4,1760 # 8021d3b0 <devsw>
    80203cd8:	97ba                	add	a5,a5,a4
    80203cda:	639c                	ld	a5,0(a5)
    80203cdc:	c3b9                	beqz	a5,80203d22 <fileread+0xbe>
        r = devsw[f->major].read(1, addr, n);
    80203cde:	4505                	li	a0,1
    80203ce0:	9782                	jalr	a5
    80203ce2:	892a                	mv	s2,a0
        break;
    80203ce4:	b7e9                	j	80203cae <fileread+0x4a>
        elock(f->ep);
    80203ce6:	6d08                	ld	a0,24(a0)
    80203ce8:	00003097          	auipc	ra,0x3
    80203cec:	8e8080e7          	jalr	-1816(ra) # 802065d0 <elock>
          if((r = eread(f->ep, 1, addr, f->off, n)) > 0)
    80203cf0:	874a                	mv	a4,s2
    80203cf2:	5094                	lw	a3,32(s1)
    80203cf4:	864e                	mv	a2,s3
    80203cf6:	4585                	li	a1,1
    80203cf8:	6c88                	ld	a0,24(s1)
    80203cfa:	00002097          	auipc	ra,0x2
    80203cfe:	fd2080e7          	jalr	-46(ra) # 80205ccc <eread>
    80203d02:	892a                	mv	s2,a0
    80203d04:	00a05563          	blez	a0,80203d0e <fileread+0xaa>
            f->off += r;
    80203d08:	509c                	lw	a5,32(s1)
    80203d0a:	9fa9                	addw	a5,a5,a0
    80203d0c:	d09c                	sw	a5,32(s1)
        eunlock(f->ep);
    80203d0e:	6c88                	ld	a0,24(s1)
    80203d10:	00003097          	auipc	ra,0x3
    80203d14:	8f6080e7          	jalr	-1802(ra) # 80206606 <eunlock>
        break;
    80203d18:	bf59                	j	80203cae <fileread+0x4a>
    return -1;
    80203d1a:	597d                	li	s2,-1
    80203d1c:	bf49                	j	80203cae <fileread+0x4a>
          return -1;
    80203d1e:	597d                	li	s2,-1
    80203d20:	b779                	j	80203cae <fileread+0x4a>
    80203d22:	597d                	li	s2,-1
    80203d24:	b769                	j	80203cae <fileread+0x4a>

0000000080203d26 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80203d26:	7179                	addi	sp,sp,-48
    80203d28:	f406                	sd	ra,40(sp)
    80203d2a:	f022                	sd	s0,32(sp)
    80203d2c:	ec26                	sd	s1,24(sp)
    80203d2e:	e84a                	sd	s2,16(sp)
    80203d30:	e44e                	sd	s3,8(sp)
    80203d32:	e052                	sd	s4,0(sp)
    80203d34:	1800                	addi	s0,sp,48
  int ret = 0;

  if(f->writable == 0)
    80203d36:	00954783          	lbu	a5,9(a0)
    80203d3a:	cbc5                	beqz	a5,80203dea <filewrite+0xc4>
    80203d3c:	84aa                	mv	s1,a0
    80203d3e:	892e                	mv	s2,a1
    80203d40:	89b2                	mv	s3,a2
    return -1;

  if(f->type == FD_PIPE){
    80203d42:	411c                	lw	a5,0(a0)
    80203d44:	4705                	li	a4,1
    80203d46:	04e78963          	beq	a5,a4,80203d98 <filewrite+0x72>
    ret = pipewrite(f->pipe, addr, n);
  } else if(f->type == FD_DEVICE){
    80203d4a:	470d                	li	a4,3
    80203d4c:	04e78d63          	beq	a5,a4,80203da6 <filewrite+0x80>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
      return -1;
    ret = devsw[f->major].write(1, addr, n);
  } else if(f->type == FD_ENTRY){
    80203d50:	4709                	li	a4,2
    80203d52:	08e79463          	bne	a5,a4,80203dda <filewrite+0xb4>
    elock(f->ep);
    80203d56:	6d08                	ld	a0,24(a0)
    80203d58:	00003097          	auipc	ra,0x3
    80203d5c:	878080e7          	jalr	-1928(ra) # 802065d0 <elock>
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203d60:	00098a1b          	sext.w	s4,s3
    80203d64:	8752                	mv	a4,s4
    80203d66:	5094                	lw	a3,32(s1)
    80203d68:	864a                	mv	a2,s2
    80203d6a:	4585                	li	a1,1
    80203d6c:	6c88                	ld	a0,24(s1)
    80203d6e:	00002097          	auipc	ra,0x2
    80203d72:	056080e7          	jalr	86(ra) # 80205dc4 <ewrite>
      ret = n;
      f->off += n;
    } else {
      ret = -1;
    80203d76:	597d                	li	s2,-1
    if (ewrite(f->ep, 1, addr, f->off, n) == n) {
    80203d78:	05350b63          	beq	a0,s3,80203dce <filewrite+0xa8>
    }
    eunlock(f->ep);
    80203d7c:	6c88                	ld	a0,24(s1)
    80203d7e:	00003097          	auipc	ra,0x3
    80203d82:	888080e7          	jalr	-1912(ra) # 80206606 <eunlock>
  } else {
    panic("filewrite");
  }

  return ret;
}
    80203d86:	854a                	mv	a0,s2
    80203d88:	70a2                	ld	ra,40(sp)
    80203d8a:	7402                	ld	s0,32(sp)
    80203d8c:	64e2                	ld	s1,24(sp)
    80203d8e:	6942                	ld	s2,16(sp)
    80203d90:	69a2                	ld	s3,8(sp)
    80203d92:	6a02                	ld	s4,0(sp)
    80203d94:	6145                	addi	sp,sp,48
    80203d96:	8082                	ret
    ret = pipewrite(f->pipe, addr, n);
    80203d98:	6908                	ld	a0,16(a0)
    80203d9a:	00000097          	auipc	ra,0x0
    80203d9e:	26c080e7          	jalr	620(ra) # 80204006 <pipewrite>
    80203da2:	892a                	mv	s2,a0
    80203da4:	b7cd                	j	80203d86 <filewrite+0x60>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80203da6:	02451783          	lh	a5,36(a0)
    80203daa:	03079693          	slli	a3,a5,0x30
    80203dae:	92c1                	srli	a3,a3,0x30
    80203db0:	4725                	li	a4,9
    80203db2:	02d76e63          	bltu	a4,a3,80203dee <filewrite+0xc8>
    80203db6:	0792                	slli	a5,a5,0x4
    80203db8:	00019717          	auipc	a4,0x19
    80203dbc:	5f870713          	addi	a4,a4,1528 # 8021d3b0 <devsw>
    80203dc0:	97ba                	add	a5,a5,a4
    80203dc2:	679c                	ld	a5,8(a5)
    80203dc4:	c79d                	beqz	a5,80203df2 <filewrite+0xcc>
    ret = devsw[f->major].write(1, addr, n);
    80203dc6:	4505                	li	a0,1
    80203dc8:	9782                	jalr	a5
    80203dca:	892a                	mv	s2,a0
    80203dcc:	bf6d                	j	80203d86 <filewrite+0x60>
      f->off += n;
    80203dce:	509c                	lw	a5,32(s1)
    80203dd0:	014787bb          	addw	a5,a5,s4
    80203dd4:	d09c                	sw	a5,32(s1)
      ret = n;
    80203dd6:	894e                	mv	s2,s3
    80203dd8:	b755                	j	80203d7c <filewrite+0x56>
    panic("filewrite");
    80203dda:	00006517          	auipc	a0,0x6
    80203dde:	e0650513          	addi	a0,a0,-506 # 80209be0 <digits+0x860>
    80203de2:	ffffc097          	auipc	ra,0xffffc
    80203de6:	362080e7          	jalr	866(ra) # 80200144 <panic>
    return -1;
    80203dea:	597d                	li	s2,-1
    80203dec:	bf69                	j	80203d86 <filewrite+0x60>
      return -1;
    80203dee:	597d                	li	s2,-1
    80203df0:	bf59                	j	80203d86 <filewrite+0x60>
    80203df2:	597d                	li	s2,-1
    80203df4:	bf49                	j	80203d86 <filewrite+0x60>

0000000080203df6 <dirnext>:
int
dirnext(struct file *f, uint64 addr)
{
  // struct proc *p = myproc();

  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203df6:	00854783          	lbu	a5,8(a0)
    80203dfa:	cfdd                	beqz	a5,80203eb8 <dirnext+0xc2>
{
    80203dfc:	7141                	addi	sp,sp,-496
    80203dfe:	f786                	sd	ra,488(sp)
    80203e00:	f3a2                	sd	s0,480(sp)
    80203e02:	efa6                	sd	s1,472(sp)
    80203e04:	ebca                	sd	s2,464(sp)
    80203e06:	e7ce                	sd	s3,456(sp)
    80203e08:	e3d2                	sd	s4,448(sp)
    80203e0a:	ff56                	sd	s5,440(sp)
    80203e0c:	1b80                	addi	s0,sp,496
    80203e0e:	84aa                	mv	s1,a0
    80203e10:	8aae                	mv	s5,a1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203e12:	6d18                	ld	a4,24(a0)
    80203e14:	10074783          	lbu	a5,256(a4)
    80203e18:	8bc1                	andi	a5,a5,16
    return -1;
    80203e1a:	557d                	li	a0,-1
  if(f->readable == 0 || !(f->ep->attribute & ATTR_DIRECTORY))
    80203e1c:	eb91                	bnez	a5,80203e30 <dirnext+0x3a>
  // if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    return -1;

  return 1;
    80203e1e:	70be                	ld	ra,488(sp)
    80203e20:	741e                	ld	s0,480(sp)
    80203e22:	64fe                	ld	s1,472(sp)
    80203e24:	695e                	ld	s2,464(sp)
    80203e26:	69be                	ld	s3,456(sp)
    80203e28:	6a1e                	ld	s4,448(sp)
    80203e2a:	7afa                	ld	s5,440(sp)
    80203e2c:	617d                	addi	sp,sp,496
    80203e2e:	8082                	ret
  int count = 0;
    80203e30:	e0042e23          	sw	zero,-484(s0)
  elock(f->ep);
    80203e34:	853a                	mv	a0,a4
    80203e36:	00002097          	auipc	ra,0x2
    80203e3a:	79a080e7          	jalr	1946(ra) # 802065d0 <elock>
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203e3e:	e1c40a13          	addi	s4,s0,-484
    80203e42:	e5840993          	addi	s3,s0,-424
    80203e46:	a801                	j	80203e56 <dirnext+0x60>
    f->off += count * 32;
    80203e48:	e1c42783          	lw	a5,-484(s0)
    80203e4c:	0057979b          	slliw	a5,a5,0x5
    80203e50:	5098                	lw	a4,32(s1)
    80203e52:	9fb9                	addw	a5,a5,a4
    80203e54:	d09c                	sw	a5,32(s1)
  while ((ret = enext(f->ep, &de, f->off, &count)) == 0) {  // skip empty entry
    80203e56:	86d2                	mv	a3,s4
    80203e58:	5090                	lw	a2,32(s1)
    80203e5a:	85ce                	mv	a1,s3
    80203e5c:	6c88                	ld	a0,24(s1)
    80203e5e:	00003097          	auipc	ra,0x3
    80203e62:	976080e7          	jalr	-1674(ra) # 802067d4 <enext>
    80203e66:	892a                	mv	s2,a0
    80203e68:	d165                	beqz	a0,80203e48 <dirnext+0x52>
  eunlock(f->ep);
    80203e6a:	6c88                	ld	a0,24(s1)
    80203e6c:	00002097          	auipc	ra,0x2
    80203e70:	79a080e7          	jalr	1946(ra) # 80206606 <eunlock>
  if (ret == -1)
    80203e74:	57fd                	li	a5,-1
    return 0;
    80203e76:	4501                	li	a0,0
  if (ret == -1)
    80203e78:	faf903e3          	beq	s2,a5,80203e1e <dirnext+0x28>
  f->off += count * 32;
    80203e7c:	e1c42783          	lw	a5,-484(s0)
    80203e80:	0057979b          	slliw	a5,a5,0x5
    80203e84:	5098                	lw	a4,32(s1)
    80203e86:	9fb9                	addw	a5,a5,a4
    80203e88:	d09c                	sw	a5,32(s1)
  estat(&de, &st);
    80203e8a:	e2040493          	addi	s1,s0,-480
    80203e8e:	85a6                	mv	a1,s1
    80203e90:	e5840513          	addi	a0,s0,-424
    80203e94:	00003097          	auipc	ra,0x3
    80203e98:	8f8080e7          	jalr	-1800(ra) # 8020678c <estat>
  if(copyout2(addr, (char *)&st, sizeof(st)) < 0)
    80203e9c:	03800613          	li	a2,56
    80203ea0:	85a6                	mv	a1,s1
    80203ea2:	8556                	mv	a0,s5
    80203ea4:	ffffd097          	auipc	ra,0xffffd
    80203ea8:	55a080e7          	jalr	1370(ra) # 802013fe <copyout2>
    return -1;
    80203eac:	fff54513          	not	a0,a0
    80203eb0:	957d                	srai	a0,a0,0x3f
    80203eb2:	8909                	andi	a0,a0,2
    80203eb4:	157d                	addi	a0,a0,-1
    80203eb6:	b7a5                	j	80203e1e <dirnext+0x28>
    return -1;
    80203eb8:	557d                	li	a0,-1
    80203eba:	8082                	ret

0000000080203ebc <pipealloc>:
#include "include/kalloc.h"
#include "include/vm.h"

int
pipealloc(struct file **f0, struct file **f1)
{
    80203ebc:	7179                	addi	sp,sp,-48
    80203ebe:	f406                	sd	ra,40(sp)
    80203ec0:	f022                	sd	s0,32(sp)
    80203ec2:	ec26                	sd	s1,24(sp)
    80203ec4:	e84a                	sd	s2,16(sp)
    80203ec6:	e44e                	sd	s3,8(sp)
    80203ec8:	e052                	sd	s4,0(sp)
    80203eca:	1800                	addi	s0,sp,48
    80203ecc:	84aa                	mv	s1,a0
    80203ece:	8a2e                	mv	s4,a1
  struct pipe *pi;

  pi = 0;
  *f0 = *f1 = 0;
    80203ed0:	0005b023          	sd	zero,0(a1)
    80203ed4:	00053023          	sd	zero,0(a0)
  if((*f0 = filealloc()) == NULL || (*f1 = filealloc()) == NULL)
    80203ed8:	00000097          	auipc	ra,0x0
    80203edc:	bb6080e7          	jalr	-1098(ra) # 80203a8e <filealloc>
    80203ee0:	e088                	sd	a0,0(s1)
    80203ee2:	c551                	beqz	a0,80203f6e <pipealloc+0xb2>
    80203ee4:	00000097          	auipc	ra,0x0
    80203ee8:	baa080e7          	jalr	-1110(ra) # 80203a8e <filealloc>
    80203eec:	00aa3023          	sd	a0,0(s4)
    80203ef0:	c92d                	beqz	a0,80203f62 <pipealloc+0xa6>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == NULL)
    80203ef2:	ffffc097          	auipc	ra,0xffffc
    80203ef6:	696080e7          	jalr	1686(ra) # 80200588 <kalloc>
    80203efa:	892a                	mv	s2,a0
    80203efc:	c125                	beqz	a0,80203f5c <pipealloc+0xa0>
    goto bad;
  pi->readopen = 1;
    80203efe:	4985                	li	s3,1
    80203f00:	23352023          	sw	s3,544(a0)
  pi->writeopen = 1;
    80203f04:	23352223          	sw	s3,548(a0)
  pi->nwrite = 0;
    80203f08:	20052e23          	sw	zero,540(a0)
  pi->nread = 0;
    80203f0c:	20052c23          	sw	zero,536(a0)
  initlock(&pi->lock, "pipe");
    80203f10:	00006597          	auipc	a1,0x6
    80203f14:	b5058593          	addi	a1,a1,-1200 # 80209a60 <digits+0x6e0>
    80203f18:	ffffc097          	auipc	ra,0xffffc
    80203f1c:	798080e7          	jalr	1944(ra) # 802006b0 <initlock>
  (*f0)->type = FD_PIPE;
    80203f20:	609c                	ld	a5,0(s1)
    80203f22:	0137a023          	sw	s3,0(a5)
  (*f0)->readable = 1;
    80203f26:	609c                	ld	a5,0(s1)
    80203f28:	01378423          	sb	s3,8(a5)
  (*f0)->writable = 0;
    80203f2c:	609c                	ld	a5,0(s1)
    80203f2e:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80203f32:	609c                	ld	a5,0(s1)
    80203f34:	0127b823          	sd	s2,16(a5)
  (*f1)->type = FD_PIPE;
    80203f38:	000a3783          	ld	a5,0(s4)
    80203f3c:	0137a023          	sw	s3,0(a5)
  (*f1)->readable = 0;
    80203f40:	000a3783          	ld	a5,0(s4)
    80203f44:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80203f48:	000a3783          	ld	a5,0(s4)
    80203f4c:	013784a3          	sb	s3,9(a5)
  (*f1)->pipe = pi;
    80203f50:	000a3783          	ld	a5,0(s4)
    80203f54:	0127b823          	sd	s2,16(a5)
  return 0;
    80203f58:	4501                	li	a0,0
    80203f5a:	a025                	j	80203f82 <pipealloc+0xc6>

 bad:
  if(pi)
    kfree((char*)pi);
  if(*f0)
    80203f5c:	6088                	ld	a0,0(s1)
    80203f5e:	e501                	bnez	a0,80203f66 <pipealloc+0xaa>
    80203f60:	a039                	j	80203f6e <pipealloc+0xb2>
    80203f62:	6088                	ld	a0,0(s1)
    80203f64:	c51d                	beqz	a0,80203f92 <pipealloc+0xd6>
    fileclose(*f0);
    80203f66:	00000097          	auipc	ra,0x0
    80203f6a:	be4080e7          	jalr	-1052(ra) # 80203b4a <fileclose>
  if(*f1)
    80203f6e:	000a3783          	ld	a5,0(s4)
    fileclose(*f1);
  return -1;
    80203f72:	557d                	li	a0,-1
  if(*f1)
    80203f74:	c799                	beqz	a5,80203f82 <pipealloc+0xc6>
    fileclose(*f1);
    80203f76:	853e                	mv	a0,a5
    80203f78:	00000097          	auipc	ra,0x0
    80203f7c:	bd2080e7          	jalr	-1070(ra) # 80203b4a <fileclose>
  return -1;
    80203f80:	557d                	li	a0,-1
}
    80203f82:	70a2                	ld	ra,40(sp)
    80203f84:	7402                	ld	s0,32(sp)
    80203f86:	64e2                	ld	s1,24(sp)
    80203f88:	6942                	ld	s2,16(sp)
    80203f8a:	69a2                	ld	s3,8(sp)
    80203f8c:	6a02                	ld	s4,0(sp)
    80203f8e:	6145                	addi	sp,sp,48
    80203f90:	8082                	ret
  return -1;
    80203f92:	557d                	li	a0,-1
    80203f94:	b7fd                	j	80203f82 <pipealloc+0xc6>

0000000080203f96 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80203f96:	1101                	addi	sp,sp,-32
    80203f98:	ec06                	sd	ra,24(sp)
    80203f9a:	e822                	sd	s0,16(sp)
    80203f9c:	e426                	sd	s1,8(sp)
    80203f9e:	e04a                	sd	s2,0(sp)
    80203fa0:	1000                	addi	s0,sp,32
    80203fa2:	84aa                	mv	s1,a0
    80203fa4:	892e                	mv	s2,a1
  acquire(&pi->lock);
    80203fa6:	ffffc097          	auipc	ra,0xffffc
    80203faa:	74e080e7          	jalr	1870(ra) # 802006f4 <acquire>
  if(writable){
    80203fae:	02090d63          	beqz	s2,80203fe8 <pipeclose+0x52>
    pi->writeopen = 0;
    80203fb2:	2204a223          	sw	zero,548(s1)
    wakeup(&pi->nread);
    80203fb6:	21848513          	addi	a0,s1,536
    80203fba:	ffffe097          	auipc	ra,0xffffe
    80203fbe:	52a080e7          	jalr	1322(ra) # 802024e4 <wakeup>
  } else {
    pi->readopen = 0;
    wakeup(&pi->nwrite);
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80203fc2:	2204b783          	ld	a5,544(s1)
    80203fc6:	eb95                	bnez	a5,80203ffa <pipeclose+0x64>
    release(&pi->lock);
    80203fc8:	8526                	mv	a0,s1
    80203fca:	ffffc097          	auipc	ra,0xffffc
    80203fce:	77e080e7          	jalr	1918(ra) # 80200748 <release>
    kfree((char*)pi);
    80203fd2:	8526                	mv	a0,s1
    80203fd4:	ffffc097          	auipc	ra,0xffffc
    80203fd8:	46c080e7          	jalr	1132(ra) # 80200440 <kfree>
  } else
    release(&pi->lock);
}
    80203fdc:	60e2                	ld	ra,24(sp)
    80203fde:	6442                	ld	s0,16(sp)
    80203fe0:	64a2                	ld	s1,8(sp)
    80203fe2:	6902                	ld	s2,0(sp)
    80203fe4:	6105                	addi	sp,sp,32
    80203fe6:	8082                	ret
    pi->readopen = 0;
    80203fe8:	2204a023          	sw	zero,544(s1)
    wakeup(&pi->nwrite);
    80203fec:	21c48513          	addi	a0,s1,540
    80203ff0:	ffffe097          	auipc	ra,0xffffe
    80203ff4:	4f4080e7          	jalr	1268(ra) # 802024e4 <wakeup>
    80203ff8:	b7e9                	j	80203fc2 <pipeclose+0x2c>
    release(&pi->lock);
    80203ffa:	8526                	mv	a0,s1
    80203ffc:	ffffc097          	auipc	ra,0xffffc
    80204000:	74c080e7          	jalr	1868(ra) # 80200748 <release>
}
    80204004:	bfe1                	j	80203fdc <pipeclose+0x46>

0000000080204006 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80204006:	7159                	addi	sp,sp,-112
    80204008:	f486                	sd	ra,104(sp)
    8020400a:	f0a2                	sd	s0,96(sp)
    8020400c:	eca6                	sd	s1,88(sp)
    8020400e:	e8ca                	sd	s2,80(sp)
    80204010:	e4ce                	sd	s3,72(sp)
    80204012:	e0d2                	sd	s4,64(sp)
    80204014:	fc56                	sd	s5,56(sp)
    80204016:	f85a                	sd	s6,48(sp)
    80204018:	f45e                	sd	s7,40(sp)
    8020401a:	f062                	sd	s8,32(sp)
    8020401c:	ec66                	sd	s9,24(sp)
    8020401e:	1880                	addi	s0,sp,112
    80204020:	84aa                	mv	s1,a0
    80204022:	8b2e                	mv	s6,a1
    80204024:	8ab2                	mv	s5,a2
  int i;
  char ch;
  struct proc *pr = myproc();
    80204026:	ffffe097          	auipc	ra,0xffffe
    8020402a:	ab2080e7          	jalr	-1358(ra) # 80201ad8 <myproc>
    8020402e:	892a                	mv	s2,a0

  acquire(&pi->lock);
    80204030:	8526                	mv	a0,s1
    80204032:	ffffc097          	auipc	ra,0xffffc
    80204036:	6c2080e7          	jalr	1730(ra) # 802006f4 <acquire>
  for(i = 0; i < n; i++){
    8020403a:	09505763          	blez	s5,802040c8 <pipewrite+0xc2>
    8020403e:	4b81                	li	s7,0
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
      if(pi->readopen == 0 || pr->killed){
        release(&pi->lock);
        return -1;
      }
      wakeup(&pi->nread);
    80204040:	21848a13          	addi	s4,s1,536
      sleep(&pi->nwrite, &pi->lock);
    80204044:	21c48993          	addi	s3,s1,540
    }
    // if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    if(copyin2(&ch, addr + i, 1) == -1)
    80204048:	f9f40c93          	addi	s9,s0,-97
    8020404c:	5c7d                	li	s8,-1
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    8020404e:	2184a783          	lw	a5,536(s1)
    80204052:	21c4a703          	lw	a4,540(s1)
    80204056:	2007879b          	addiw	a5,a5,512
    8020405a:	02f71b63          	bne	a4,a5,80204090 <pipewrite+0x8a>
      if(pi->readopen == 0 || pr->killed){
    8020405e:	2204a783          	lw	a5,544(s1)
    80204062:	c3c1                	beqz	a5,802040e2 <pipewrite+0xdc>
    80204064:	03092783          	lw	a5,48(s2)
    80204068:	efad                	bnez	a5,802040e2 <pipewrite+0xdc>
      wakeup(&pi->nread);
    8020406a:	8552                	mv	a0,s4
    8020406c:	ffffe097          	auipc	ra,0xffffe
    80204070:	478080e7          	jalr	1144(ra) # 802024e4 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80204074:	85a6                	mv	a1,s1
    80204076:	854e                	mv	a0,s3
    80204078:	ffffe097          	auipc	ra,0xffffe
    8020407c:	2f0080e7          	jalr	752(ra) # 80202368 <sleep>
    while(pi->nwrite == pi->nread + PIPESIZE){  //DOC: pipewrite-full
    80204080:	2184a783          	lw	a5,536(s1)
    80204084:	21c4a703          	lw	a4,540(s1)
    80204088:	2007879b          	addiw	a5,a5,512
    8020408c:	fcf709e3          	beq	a4,a5,8020405e <pipewrite+0x58>
    if(copyin2(&ch, addr + i, 1) == -1)
    80204090:	4605                	li	a2,1
    80204092:	85da                	mv	a1,s6
    80204094:	8566                	mv	a0,s9
    80204096:	ffffd097          	auipc	ra,0xffffd
    8020409a:	448080e7          	jalr	1096(ra) # 802014de <copyin2>
    8020409e:	03850663          	beq	a0,s8,802040ca <pipewrite+0xc4>
      break;
    pi->data[pi->nwrite++ % PIPESIZE] = ch;
    802040a2:	21c4a783          	lw	a5,540(s1)
    802040a6:	0017871b          	addiw	a4,a5,1
    802040aa:	20e4ae23          	sw	a4,540(s1)
    802040ae:	1ff7f793          	andi	a5,a5,511
    802040b2:	97a6                	add	a5,a5,s1
    802040b4:	f9f44703          	lbu	a4,-97(s0)
    802040b8:	00e78c23          	sb	a4,24(a5)
  for(i = 0; i < n; i++){
    802040bc:	2b85                	addiw	s7,s7,1
    802040be:	0b05                	addi	s6,s6,1
    802040c0:	f97a97e3          	bne	s5,s7,8020404e <pipewrite+0x48>
    802040c4:	8bd6                	mv	s7,s5
    802040c6:	a011                	j	802040ca <pipewrite+0xc4>
    802040c8:	4b81                	li	s7,0
  }
  wakeup(&pi->nread);
    802040ca:	21848513          	addi	a0,s1,536
    802040ce:	ffffe097          	auipc	ra,0xffffe
    802040d2:	416080e7          	jalr	1046(ra) # 802024e4 <wakeup>
  release(&pi->lock);
    802040d6:	8526                	mv	a0,s1
    802040d8:	ffffc097          	auipc	ra,0xffffc
    802040dc:	670080e7          	jalr	1648(ra) # 80200748 <release>
  return i;
    802040e0:	a039                	j	802040ee <pipewrite+0xe8>
        release(&pi->lock);
    802040e2:	8526                	mv	a0,s1
    802040e4:	ffffc097          	auipc	ra,0xffffc
    802040e8:	664080e7          	jalr	1636(ra) # 80200748 <release>
        return -1;
    802040ec:	5bfd                	li	s7,-1
}
    802040ee:	855e                	mv	a0,s7
    802040f0:	70a6                	ld	ra,104(sp)
    802040f2:	7406                	ld	s0,96(sp)
    802040f4:	64e6                	ld	s1,88(sp)
    802040f6:	6946                	ld	s2,80(sp)
    802040f8:	69a6                	ld	s3,72(sp)
    802040fa:	6a06                	ld	s4,64(sp)
    802040fc:	7ae2                	ld	s5,56(sp)
    802040fe:	7b42                	ld	s6,48(sp)
    80204100:	7ba2                	ld	s7,40(sp)
    80204102:	7c02                	ld	s8,32(sp)
    80204104:	6ce2                	ld	s9,24(sp)
    80204106:	6165                	addi	sp,sp,112
    80204108:	8082                	ret

000000008020410a <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    8020410a:	715d                	addi	sp,sp,-80
    8020410c:	e486                	sd	ra,72(sp)
    8020410e:	e0a2                	sd	s0,64(sp)
    80204110:	fc26                	sd	s1,56(sp)
    80204112:	f84a                	sd	s2,48(sp)
    80204114:	f44e                	sd	s3,40(sp)
    80204116:	f052                	sd	s4,32(sp)
    80204118:	ec56                	sd	s5,24(sp)
    8020411a:	e85a                	sd	s6,16(sp)
    8020411c:	0880                	addi	s0,sp,80
    8020411e:	84aa                	mv	s1,a0
    80204120:	892e                	mv	s2,a1
    80204122:	8a32                	mv	s4,a2
  int i;
  struct proc *pr = myproc();
    80204124:	ffffe097          	auipc	ra,0xffffe
    80204128:	9b4080e7          	jalr	-1612(ra) # 80201ad8 <myproc>
    8020412c:	89aa                	mv	s3,a0
  char ch;

  acquire(&pi->lock);
    8020412e:	8526                	mv	a0,s1
    80204130:	ffffc097          	auipc	ra,0xffffc
    80204134:	5c4080e7          	jalr	1476(ra) # 802006f4 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204138:	2184a703          	lw	a4,536(s1)
    8020413c:	21c4a783          	lw	a5,540(s1)
    if(pr->killed){
      release(&pi->lock);
      return -1;
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80204140:	21848a93          	addi	s5,s1,536
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204144:	02f71463          	bne	a4,a5,8020416c <piperead+0x62>
    80204148:	2244a783          	lw	a5,548(s1)
    8020414c:	c385                	beqz	a5,8020416c <piperead+0x62>
    if(pr->killed){
    8020414e:	0309a783          	lw	a5,48(s3)
    80204152:	ebc1                	bnez	a5,802041e2 <piperead+0xd8>
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80204154:	85a6                	mv	a1,s1
    80204156:	8556                	mv	a0,s5
    80204158:	ffffe097          	auipc	ra,0xffffe
    8020415c:	210080e7          	jalr	528(ra) # 80202368 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80204160:	2184a703          	lw	a4,536(s1)
    80204164:	21c4a783          	lw	a5,540(s1)
    80204168:	fef700e3          	beq	a4,a5,80204148 <piperead+0x3e>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8020416c:	4981                	li	s3,0
    if(pi->nread == pi->nwrite)
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    // if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    if(copyout2(addr + i, &ch, 1) == -1)
    8020416e:	fbf40b13          	addi	s6,s0,-65
    80204172:	5afd                	li	s5,-1
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80204174:	05405163          	blez	s4,802041b6 <piperead+0xac>
    if(pi->nread == pi->nwrite)
    80204178:	2184a783          	lw	a5,536(s1)
    8020417c:	21c4a703          	lw	a4,540(s1)
    80204180:	02f70b63          	beq	a4,a5,802041b6 <piperead+0xac>
    ch = pi->data[pi->nread++ % PIPESIZE];
    80204184:	0017871b          	addiw	a4,a5,1
    80204188:	20e4ac23          	sw	a4,536(s1)
    8020418c:	1ff7f793          	andi	a5,a5,511
    80204190:	97a6                	add	a5,a5,s1
    80204192:	0187c783          	lbu	a5,24(a5)
    80204196:	faf40fa3          	sb	a5,-65(s0)
    if(copyout2(addr + i, &ch, 1) == -1)
    8020419a:	4605                	li	a2,1
    8020419c:	85da                	mv	a1,s6
    8020419e:	854a                	mv	a0,s2
    802041a0:	ffffd097          	auipc	ra,0xffffd
    802041a4:	25e080e7          	jalr	606(ra) # 802013fe <copyout2>
    802041a8:	01550763          	beq	a0,s5,802041b6 <piperead+0xac>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    802041ac:	2985                	addiw	s3,s3,1
    802041ae:	0905                	addi	s2,s2,1
    802041b0:	fd3a14e3          	bne	s4,s3,80204178 <piperead+0x6e>
    802041b4:	89d2                	mv	s3,s4
      break;
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    802041b6:	21c48513          	addi	a0,s1,540
    802041ba:	ffffe097          	auipc	ra,0xffffe
    802041be:	32a080e7          	jalr	810(ra) # 802024e4 <wakeup>
  release(&pi->lock);
    802041c2:	8526                	mv	a0,s1
    802041c4:	ffffc097          	auipc	ra,0xffffc
    802041c8:	584080e7          	jalr	1412(ra) # 80200748 <release>
  return i;
}
    802041cc:	854e                	mv	a0,s3
    802041ce:	60a6                	ld	ra,72(sp)
    802041d0:	6406                	ld	s0,64(sp)
    802041d2:	74e2                	ld	s1,56(sp)
    802041d4:	7942                	ld	s2,48(sp)
    802041d6:	79a2                	ld	s3,40(sp)
    802041d8:	7a02                	ld	s4,32(sp)
    802041da:	6ae2                	ld	s5,24(sp)
    802041dc:	6b42                	ld	s6,16(sp)
    802041de:	6161                	addi	sp,sp,80
    802041e0:	8082                	ret
      release(&pi->lock);
    802041e2:	8526                	mv	a0,s1
    802041e4:	ffffc097          	auipc	ra,0xffffc
    802041e8:	564080e7          	jalr	1380(ra) # 80200748 <release>
      return -1;
    802041ec:	59fd                	li	s3,-1
    802041ee:	bff9                	j	802041cc <piperead+0xc2>

00000000802041f0 <exec>:
  return 0;
}


int exec(char *path, char **argv)
{
    802041f0:	dd010113          	addi	sp,sp,-560
    802041f4:	22113423          	sd	ra,552(sp)
    802041f8:	22813023          	sd	s0,544(sp)
    802041fc:	20913c23          	sd	s1,536(sp)
    80204200:	21213823          	sd	s2,528(sp)
    80204204:	21313423          	sd	s3,520(sp)
    80204208:	21413023          	sd	s4,512(sp)
    8020420c:	ffd6                	sd	s5,504(sp)
    8020420e:	fbda                	sd	s6,496(sp)
    80204210:	f7de                	sd	s7,488(sp)
    80204212:	f3e2                	sd	s8,480(sp)
    80204214:	efe6                	sd	s9,472(sp)
    80204216:	ebea                	sd	s10,464(sp)
    80204218:	e7ee                	sd	s11,456(sp)
    8020421a:	1c00                	addi	s0,sp,560
    8020421c:	89aa                	mv	s3,a0
    8020421e:	dea43023          	sd	a0,-544(s0)
    80204222:	dcb43c23          	sd	a1,-552(s0)
  struct elfhdr elf;
  struct dirent *ep;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
  pagetable_t kpagetable = 0, oldkpagetable;
  struct proc *p = myproc();
    80204226:	ffffe097          	auipc	ra,0xffffe
    8020422a:	8b2080e7          	jalr	-1870(ra) # 80201ad8 <myproc>
    8020422e:	84aa                	mv	s1,a0

  // Make a copy of p->kpt without old user space, 
  // but with the same kstack we are using now, which can't be changed
  if ((kpagetable = (pagetable_t)kalloc()) == NULL) {
    80204230:	ffffc097          	auipc	ra,0xffffc
    80204234:	358080e7          	jalr	856(ra) # 80200588 <kalloc>
    80204238:	e0a43423          	sd	a0,-504(s0)
    8020423c:	2a050f63          	beqz	a0,802044fa <exec+0x30a>
    80204240:	892a                	mv	s2,a0
    return -1;
  }
  memmove(kpagetable, p->kpagetable, PGSIZE);
    80204242:	6605                	lui	a2,0x1
    80204244:	6cac                	ld	a1,88(s1)
    80204246:	ffffc097          	auipc	ra,0xffffc
    8020424a:	5a6080e7          	jalr	1446(ra) # 802007ec <memmove>
  for (int i = 0; i < PX(2, MAXUVA); i++) {
    kpagetable[i] = 0;
    8020424e:	00093023          	sd	zero,0(s2)
    80204252:	00093423          	sd	zero,8(s2)
  }

  if((ep = ename(path)) == NULL) {
    80204256:	854e                	mv	a0,s3
    80204258:	00003097          	auipc	ra,0x3
    8020425c:	b20080e7          	jalr	-1248(ra) # 80206d78 <ename>
    80204260:	8a2a                	mv	s4,a0
    80204262:	c529                	beqz	a0,802042ac <exec+0xbc>
    #ifdef DEBUG
    printf("[exec] %s not found\n", path);
    #endif
    goto bad;
  }
  elock(ep);
    80204264:	00002097          	auipc	ra,0x2
    80204268:	36c080e7          	jalr	876(ra) # 802065d0 <elock>

  // Check ELF header
  if(eread(ep, 0, (uint64) &elf, 0, sizeof(elf)) != sizeof(elf))
    8020426c:	04000713          	li	a4,64
    80204270:	4681                	li	a3,0
    80204272:	e4840613          	addi	a2,s0,-440
    80204276:	4581                	li	a1,0
    80204278:	8552                	mv	a0,s4
    8020427a:	00002097          	auipc	ra,0x2
    8020427e:	a52080e7          	jalr	-1454(ra) # 80205ccc <eread>
    80204282:	04000793          	li	a5,64
    80204286:	00f51a63          	bne	a0,a5,8020429a <exec+0xaa>
    goto bad;
  if(elf.magic != ELF_MAGIC)
    8020428a:	e4842703          	lw	a4,-440(s0)
    8020428e:	464c47b7          	lui	a5,0x464c4
    80204292:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39d3ba81>
    80204296:	02f70663          	beq	a4,a5,802042c2 <exec+0xd2>
  kvmfree(oldkpagetable, 0);
  return argc; // this ends up in a0, the first argument to main(argc, argv)

 bad:
  #ifdef DEBUG
  printf("[exec] reach bad\n");
    8020429a:	00006517          	auipc	a0,0x6
    8020429e:	98e50513          	addi	a0,a0,-1650 # 80209c28 <digits+0x8a8>
    802042a2:	ffffc097          	auipc	ra,0xffffc
    802042a6:	eec080e7          	jalr	-276(ra) # 8020018e <printf>
  #endif
  if(pagetable)
    802042aa:	ac9d                	j	80204520 <exec+0x330>
    printf("[exec] %s not found\n", path);
    802042ac:	de043583          	ld	a1,-544(s0)
    802042b0:	00006517          	auipc	a0,0x6
    802042b4:	94050513          	addi	a0,a0,-1728 # 80209bf0 <digits+0x870>
    802042b8:	ffffc097          	auipc	ra,0xffffc
    802042bc:	ed6080e7          	jalr	-298(ra) # 8020018e <printf>
    goto bad;
    802042c0:	bfe9                	j	8020429a <exec+0xaa>
  if((pagetable = proc_pagetable(p)) == NULL)
    802042c2:	8526                	mv	a0,s1
    802042c4:	ffffe097          	auipc	ra,0xffffe
    802042c8:	8f8080e7          	jalr	-1800(ra) # 80201bbc <proc_pagetable>
    802042cc:	8b2a                	mv	s6,a0
    802042ce:	d571                	beqz	a0,8020429a <exec+0xaa>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802042d0:	e6842783          	lw	a5,-408(s0)
    802042d4:	e8045703          	lhu	a4,-384(s0)
    802042d8:	cb35                	beqz	a4,8020434c <exec+0x15c>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    802042da:	4481                	li	s1,0
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802042dc:	e0043023          	sd	zero,-512(s0)
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    802042e0:	e1040713          	addi	a4,s0,-496
    802042e4:	dee43423          	sd	a4,-536(s0)
    if(ph.vaddr % PGSIZE != 0)
    802042e8:	6a85                	lui	s5,0x1
    802042ea:	fffa8713          	addi	a4,s5,-1 # fff <_entry-0x801ff001>
    802042ee:	dce43823          	sd	a4,-560(s0)
  for(i = 0; i < sz; i += PGSIZE){
    802042f2:	6d85                	lui	s11,0x1
    802042f4:	7d7d                	lui	s10,0xfffff
    802042f6:	a4e9                	j	802045c0 <exec+0x3d0>
      panic("loadseg: address should exist");
    802042f8:	00006517          	auipc	a0,0x6
    802042fc:	91050513          	addi	a0,a0,-1776 # 80209c08 <digits+0x888>
    80204300:	ffffc097          	auipc	ra,0xffffc
    80204304:	e44080e7          	jalr	-444(ra) # 80200144 <panic>
    if(eread(ep, 0, (uint64)pa, offset+i, n) != n)
    80204308:	874a                	mv	a4,s2
    8020430a:	009c86bb          	addw	a3,s9,s1
    8020430e:	4581                	li	a1,0
    80204310:	8552                	mv	a0,s4
    80204312:	00002097          	auipc	ra,0x2
    80204316:	9ba080e7          	jalr	-1606(ra) # 80205ccc <eread>
    8020431a:	2501                	sext.w	a0,a0
    8020431c:	1ea91363          	bne	s2,a0,80204502 <exec+0x312>
  for(i = 0; i < sz; i += PGSIZE){
    80204320:	009d84bb          	addw	s1,s11,s1
    80204324:	013d09bb          	addw	s3,s10,s3
    80204328:	2774fc63          	bgeu	s1,s7,802045a0 <exec+0x3b0>
    pa = walkaddr(pagetable, va + i);
    8020432c:	02049593          	slli	a1,s1,0x20
    80204330:	9181                	srli	a1,a1,0x20
    80204332:	95e2                	add	a1,a1,s8
    80204334:	855a                	mv	a0,s6
    80204336:	ffffd097          	auipc	ra,0xffffd
    8020433a:	8de080e7          	jalr	-1826(ra) # 80200c14 <walkaddr>
    8020433e:	862a                	mv	a2,a0
    if(pa == NULL)
    80204340:	dd45                	beqz	a0,802042f8 <exec+0x108>
      n = PGSIZE;
    80204342:	8956                	mv	s2,s5
    if(sz - i < PGSIZE)
    80204344:	fd59f2e3          	bgeu	s3,s5,80204308 <exec+0x118>
      n = sz - i;
    80204348:	894e                	mv	s2,s3
    8020434a:	bf7d                	j	80204308 <exec+0x118>
  uint64 argc, sz = 0, sp, ustack[MAXARG+1], stackbase;
    8020434c:	4481                	li	s1,0
  eunlock(ep);
    8020434e:	8552                	mv	a0,s4
    80204350:	00002097          	auipc	ra,0x2
    80204354:	2b6080e7          	jalr	694(ra) # 80206606 <eunlock>
  eput(ep);
    80204358:	8552                	mv	a0,s4
    8020435a:	00002097          	auipc	ra,0x2
    8020435e:	2fa080e7          	jalr	762(ra) # 80206654 <eput>
  p = myproc();
    80204362:	ffffd097          	auipc	ra,0xffffd
    80204366:	776080e7          	jalr	1910(ra) # 80201ad8 <myproc>
    8020436a:	8aaa                	mv	s5,a0
  uint64 oldsz = p->sz;
    8020436c:	04853d03          	ld	s10,72(a0)
  sz = PGROUNDUP(sz);
    80204370:	6785                	lui	a5,0x1
    80204372:	17fd                	addi	a5,a5,-1 # fff <_entry-0x801ff001>
    80204374:	97a6                	add	a5,a5,s1
    80204376:	777d                	lui	a4,0xfffff
    80204378:	8ff9                	and	a5,a5,a4
    8020437a:	def43823          	sd	a5,-528(s0)
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    8020437e:	6689                	lui	a3,0x2
    80204380:	96be                	add	a3,a3,a5
    80204382:	863e                	mv	a2,a5
    80204384:	e0843583          	ld	a1,-504(s0)
    80204388:	855a                	mv	a0,s6
    8020438a:	ffffd097          	auipc	ra,0xffffd
    8020438e:	d0c080e7          	jalr	-756(ra) # 80201096 <uvmalloc>
    80204392:	8caa                	mv	s9,a0
  ep = 0;
    80204394:	4a01                	li	s4,0
  if((sz1 = uvmalloc(pagetable, kpagetable, sz, sz + 2*PGSIZE)) == 0)
    80204396:	16050663          	beqz	a0,80204502 <exec+0x312>
  uvmclear(pagetable, sz-2*PGSIZE);
    8020439a:	75f9                	lui	a1,0xffffe
    8020439c:	95aa                	add	a1,a1,a0
    8020439e:	855a                	mv	a0,s6
    802043a0:	ffffd097          	auipc	ra,0xffffd
    802043a4:	fa0080e7          	jalr	-96(ra) # 80201340 <uvmclear>
  stackbase = sp - PGSIZE;
    802043a8:	7bfd                	lui	s7,0xfffff
    802043aa:	9be6                	add	s7,s7,s9
  for(argc = 0; argv[argc]; argc++) {
    802043ac:	dd843783          	ld	a5,-552(s0)
    802043b0:	6388                	ld	a0,0(a5)
    802043b2:	c925                	beqz	a0,80204422 <exec+0x232>
    802043b4:	e8840993          	addi	s3,s0,-376
    802043b8:	f8840c13          	addi	s8,s0,-120
  sp = sz;
    802043bc:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    802043be:	4481                	li	s1,0
    sp -= strlen(argv[argc]) + 1;
    802043c0:	ffffc097          	auipc	ra,0xffffc
    802043c4:	554080e7          	jalr	1364(ra) # 80200914 <strlen>
    802043c8:	0015079b          	addiw	a5,a0,1
    802043cc:	40f907b3          	sub	a5,s2,a5
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    802043d0:	ff07f913          	andi	s2,a5,-16
    if(sp < stackbase)
    802043d4:	1b796a63          	bltu	s2,s7,80204588 <exec+0x398>
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    802043d8:	dd843d83          	ld	s11,-552(s0)
    802043dc:	000dba03          	ld	s4,0(s11) # 1000 <_entry-0x801ff000>
    802043e0:	8552                	mv	a0,s4
    802043e2:	ffffc097          	auipc	ra,0xffffc
    802043e6:	532080e7          	jalr	1330(ra) # 80200914 <strlen>
    802043ea:	0015069b          	addiw	a3,a0,1
    802043ee:	8652                	mv	a2,s4
    802043f0:	85ca                	mv	a1,s2
    802043f2:	855a                	mv	a0,s6
    802043f4:	ffffd097          	auipc	ra,0xffffd
    802043f8:	f7e080e7          	jalr	-130(ra) # 80201372 <copyout>
    802043fc:	18054a63          	bltz	a0,80204590 <exec+0x3a0>
    ustack[argc] = sp;
    80204400:	0129b023          	sd	s2,0(s3)
  for(argc = 0; argv[argc]; argc++) {
    80204404:	0485                	addi	s1,s1,1
    80204406:	008d8793          	addi	a5,s11,8
    8020440a:	dcf43c23          	sd	a5,-552(s0)
    8020440e:	008db503          	ld	a0,8(s11)
    80204412:	c911                	beqz	a0,80204426 <exec+0x236>
    if(argc >= MAXARG)
    80204414:	09a1                	addi	s3,s3,8
    80204416:	fb8995e3          	bne	s3,s8,802043c0 <exec+0x1d0>
  sz = sz1;
    8020441a:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020441e:	4a01                	li	s4,0
    80204420:	a0cd                	j	80204502 <exec+0x312>
  sp = sz;
    80204422:	8966                	mv	s2,s9
  for(argc = 0; argv[argc]; argc++) {
    80204424:	4481                	li	s1,0
  ustack[argc] = 0;
    80204426:	00349793          	slli	a5,s1,0x3
    8020442a:	f9078793          	addi	a5,a5,-112
    8020442e:	97a2                	add	a5,a5,s0
    80204430:	ee07bc23          	sd	zero,-264(a5)
  sp -= (argc+1) * sizeof(uint64);
    80204434:	00148693          	addi	a3,s1,1
    80204438:	068e                	slli	a3,a3,0x3
    8020443a:	40d90933          	sub	s2,s2,a3
  sp -= sp % 16;
    8020443e:	ff097913          	andi	s2,s2,-16
  if(sp < stackbase)
    80204442:	01797663          	bgeu	s2,s7,8020444e <exec+0x25e>
  sz = sz1;
    80204446:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020444a:	4a01                	li	s4,0
    8020444c:	a85d                	j	80204502 <exec+0x312>
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    8020444e:	e8840613          	addi	a2,s0,-376
    80204452:	85ca                	mv	a1,s2
    80204454:	855a                	mv	a0,s6
    80204456:	ffffd097          	auipc	ra,0xffffd
    8020445a:	f1c080e7          	jalr	-228(ra) # 80201372 <copyout>
    8020445e:	12054d63          	bltz	a0,80204598 <exec+0x3a8>
  p->trapframe->a1 = sp;
    80204462:	060ab783          	ld	a5,96(s5)
    80204466:	0727bc23          	sd	s2,120(a5)
  for(last=s=path; *s; s++)
    8020446a:	de043783          	ld	a5,-544(s0)
    8020446e:	0007c703          	lbu	a4,0(a5)
    80204472:	cf11                	beqz	a4,8020448e <exec+0x29e>
    80204474:	0785                	addi	a5,a5,1
    if(*s == '/')
    80204476:	02f00693          	li	a3,47
    8020447a:	a039                	j	80204488 <exec+0x298>
      last = s+1;
    8020447c:	def43023          	sd	a5,-544(s0)
  for(last=s=path; *s; s++)
    80204480:	0785                	addi	a5,a5,1
    80204482:	fff7c703          	lbu	a4,-1(a5)
    80204486:	c701                	beqz	a4,8020448e <exec+0x29e>
    if(*s == '/')
    80204488:	fed71ce3          	bne	a4,a3,80204480 <exec+0x290>
    8020448c:	bfc5                	j	8020447c <exec+0x28c>
  safestrcpy(p->name, last, sizeof(p->name));
    8020448e:	4641                	li	a2,16
    80204490:	de043583          	ld	a1,-544(s0)
    80204494:	160a8513          	addi	a0,s5,352
    80204498:	ffffc097          	auipc	ra,0xffffc
    8020449c:	44a080e7          	jalr	1098(ra) # 802008e2 <safestrcpy>
  oldpagetable = p->pagetable;
    802044a0:	050ab503          	ld	a0,80(s5)
  oldkpagetable = p->kpagetable;
    802044a4:	058ab983          	ld	s3,88(s5)
  p->pagetable = pagetable;
    802044a8:	056ab823          	sd	s6,80(s5)
  p->kpagetable = kpagetable;
    802044ac:	e0843783          	ld	a5,-504(s0)
    802044b0:	04fabc23          	sd	a5,88(s5)
  p->sz = sz;
    802044b4:	059ab423          	sd	s9,72(s5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    802044b8:	060ab783          	ld	a5,96(s5)
    802044bc:	e6043703          	ld	a4,-416(s0)
    802044c0:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    802044c2:	060ab783          	ld	a5,96(s5)
    802044c6:	0327b823          	sd	s2,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    802044ca:	85ea                	mv	a1,s10
    802044cc:	ffffd097          	auipc	ra,0xffffd
    802044d0:	78c080e7          	jalr	1932(ra) # 80201c58 <proc_freepagetable>
  w_satp(MAKE_SATP(p->kpagetable));
    802044d4:	058ab783          	ld	a5,88(s5)
    802044d8:	83b1                	srli	a5,a5,0xc
    802044da:	577d                	li	a4,-1
    802044dc:	177e                	slli	a4,a4,0x3f
    802044de:	8fd9                	or	a5,a5,a4
  asm volatile("csrw satp, %0" : : "r" (x));
    802044e0:	18079073          	csrw	satp,a5
  asm volatile("sfence.vma");
    802044e4:	12000073          	sfence.vma
  kvmfree(oldkpagetable, 0);
    802044e8:	4581                	li	a1,0
    802044ea:	854e                	mv	a0,s3
    802044ec:	ffffd097          	auipc	ra,0xffffd
    802044f0:	212080e7          	jalr	530(ra) # 802016fe <kvmfree>
  return argc; // this ends up in a0, the first argument to main(argc, argv)
    802044f4:	0004851b          	sext.w	a0,s1
    802044f8:	a889                	j	8020454a <exec+0x35a>
    return -1;
    802044fa:	557d                	li	a0,-1
    802044fc:	a0b9                	j	8020454a <exec+0x35a>
    802044fe:	de943823          	sd	s1,-528(s0)
  printf("[exec] reach bad\n");
    80204502:	00005517          	auipc	a0,0x5
    80204506:	72650513          	addi	a0,a0,1830 # 80209c28 <digits+0x8a8>
    8020450a:	ffffc097          	auipc	ra,0xffffc
    8020450e:	c84080e7          	jalr	-892(ra) # 8020018e <printf>
    proc_freepagetable(pagetable, sz);
    80204512:	df043583          	ld	a1,-528(s0)
    80204516:	855a                	mv	a0,s6
    80204518:	ffffd097          	auipc	ra,0xffffd
    8020451c:	740080e7          	jalr	1856(ra) # 80201c58 <proc_freepagetable>
  if(kpagetable)
    kvmfree(kpagetable, 0);
    80204520:	4581                	li	a1,0
    80204522:	e0843503          	ld	a0,-504(s0)
    80204526:	ffffd097          	auipc	ra,0xffffd
    8020452a:	1d8080e7          	jalr	472(ra) # 802016fe <kvmfree>
  if(ep){
    eunlock(ep);
    eput(ep);
  }
  return -1;
    8020452e:	557d                	li	a0,-1
  if(ep){
    80204530:	000a0d63          	beqz	s4,8020454a <exec+0x35a>
    eunlock(ep);
    80204534:	8552                	mv	a0,s4
    80204536:	00002097          	auipc	ra,0x2
    8020453a:	0d0080e7          	jalr	208(ra) # 80206606 <eunlock>
    eput(ep);
    8020453e:	8552                	mv	a0,s4
    80204540:	00002097          	auipc	ra,0x2
    80204544:	114080e7          	jalr	276(ra) # 80206654 <eput>
  return -1;
    80204548:	557d                	li	a0,-1
}
    8020454a:	22813083          	ld	ra,552(sp)
    8020454e:	22013403          	ld	s0,544(sp)
    80204552:	21813483          	ld	s1,536(sp)
    80204556:	21013903          	ld	s2,528(sp)
    8020455a:	20813983          	ld	s3,520(sp)
    8020455e:	20013a03          	ld	s4,512(sp)
    80204562:	7afe                	ld	s5,504(sp)
    80204564:	7b5e                	ld	s6,496(sp)
    80204566:	7bbe                	ld	s7,488(sp)
    80204568:	7c1e                	ld	s8,480(sp)
    8020456a:	6cfe                	ld	s9,472(sp)
    8020456c:	6d5e                	ld	s10,464(sp)
    8020456e:	6dbe                	ld	s11,456(sp)
    80204570:	23010113          	addi	sp,sp,560
    80204574:	8082                	ret
    80204576:	de943823          	sd	s1,-528(s0)
    8020457a:	b761                	j	80204502 <exec+0x312>
    8020457c:	de943823          	sd	s1,-528(s0)
    80204580:	b749                	j	80204502 <exec+0x312>
    80204582:	de943823          	sd	s1,-528(s0)
    80204586:	bfb5                	j	80204502 <exec+0x312>
  sz = sz1;
    80204588:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020458c:	4a01                	li	s4,0
    8020458e:	bf95                	j	80204502 <exec+0x312>
  sz = sz1;
    80204590:	df943823          	sd	s9,-528(s0)
  ep = 0;
    80204594:	4a01                	li	s4,0
    80204596:	b7b5                	j	80204502 <exec+0x312>
  sz = sz1;
    80204598:	df943823          	sd	s9,-528(s0)
  ep = 0;
    8020459c:	4a01                	li	s4,0
    8020459e:	b795                	j	80204502 <exec+0x312>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    802045a0:	df043483          	ld	s1,-528(s0)
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    802045a4:	e0043783          	ld	a5,-512(s0)
    802045a8:	0017869b          	addiw	a3,a5,1
    802045ac:	e0d43023          	sd	a3,-512(s0)
    802045b0:	df843783          	ld	a5,-520(s0)
    802045b4:	0387879b          	addiw	a5,a5,56
    802045b8:	e8045703          	lhu	a4,-384(s0)
    802045bc:	d8e6d9e3          	bge	a3,a4,8020434e <exec+0x15e>
    if(eread(ep, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    802045c0:	2781                	sext.w	a5,a5
    802045c2:	def43c23          	sd	a5,-520(s0)
    802045c6:	03800713          	li	a4,56
    802045ca:	86be                	mv	a3,a5
    802045cc:	de843603          	ld	a2,-536(s0)
    802045d0:	4581                	li	a1,0
    802045d2:	8552                	mv	a0,s4
    802045d4:	00001097          	auipc	ra,0x1
    802045d8:	6f8080e7          	jalr	1784(ra) # 80205ccc <eread>
    802045dc:	03800793          	li	a5,56
    802045e0:	f0f51fe3          	bne	a0,a5,802044fe <exec+0x30e>
    if(ph.type != ELF_PROG_LOAD)
    802045e4:	e1042783          	lw	a5,-496(s0)
    802045e8:	4705                	li	a4,1
    802045ea:	fae79de3          	bne	a5,a4,802045a4 <exec+0x3b4>
    if(ph.memsz < ph.filesz)
    802045ee:	e3843683          	ld	a3,-456(s0)
    802045f2:	e3043783          	ld	a5,-464(s0)
    802045f6:	f8f6e0e3          	bltu	a3,a5,80204576 <exec+0x386>
    if(ph.vaddr + ph.memsz < ph.vaddr)
    802045fa:	e2043783          	ld	a5,-480(s0)
    802045fe:	96be                	add	a3,a3,a5
    80204600:	f6f6eee3          	bltu	a3,a5,8020457c <exec+0x38c>
    if((sz1 = uvmalloc(pagetable, kpagetable, sz, ph.vaddr + ph.memsz)) == 0)
    80204604:	8626                	mv	a2,s1
    80204606:	e0843583          	ld	a1,-504(s0)
    8020460a:	855a                	mv	a0,s6
    8020460c:	ffffd097          	auipc	ra,0xffffd
    80204610:	a8a080e7          	jalr	-1398(ra) # 80201096 <uvmalloc>
    80204614:	dea43823          	sd	a0,-528(s0)
    80204618:	d52d                	beqz	a0,80204582 <exec+0x392>
    if(ph.vaddr % PGSIZE != 0)
    8020461a:	e2043c03          	ld	s8,-480(s0)
    8020461e:	dd043783          	ld	a5,-560(s0)
    80204622:	00fc77b3          	and	a5,s8,a5
    80204626:	ec079ee3          	bnez	a5,80204502 <exec+0x312>
    if(loadseg(pagetable, ph.vaddr, ep, ph.off, ph.filesz) < 0)
    8020462a:	e1842c83          	lw	s9,-488(s0)
    8020462e:	e3042b83          	lw	s7,-464(s0)
  for(i = 0; i < sz; i += PGSIZE){
    80204632:	f60b87e3          	beqz	s7,802045a0 <exec+0x3b0>
    80204636:	89de                	mv	s3,s7
    80204638:	4481                	li	s1,0
    8020463a:	b9cd                	j	8020432c <exec+0x13c>

000000008020463c <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    8020463c:	7179                	addi	sp,sp,-48
    8020463e:	f406                	sd	ra,40(sp)
    80204640:	f022                	sd	s0,32(sp)
    80204642:	ec26                	sd	s1,24(sp)
    80204644:	e84a                	sd	s2,16(sp)
    80204646:	1800                	addi	s0,sp,48
    80204648:	892e                	mv	s2,a1
    8020464a:	84b2                	mv	s1,a2
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    8020464c:	fdc40593          	addi	a1,s0,-36
    80204650:	fffff097          	auipc	ra,0xfffff
    80204654:	a7c080e7          	jalr	-1412(ra) # 802030cc <argint>
    80204658:	04054063          	bltz	a0,80204698 <argfd+0x5c>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    8020465c:	fdc42703          	lw	a4,-36(s0)
    80204660:	47bd                	li	a5,15
    80204662:	02e7ed63          	bltu	a5,a4,8020469c <argfd+0x60>
    80204666:	ffffd097          	auipc	ra,0xffffd
    8020466a:	472080e7          	jalr	1138(ra) # 80201ad8 <myproc>
    8020466e:	fdc42703          	lw	a4,-36(s0)
    80204672:	01a70793          	addi	a5,a4,26 # fffffffffffff01a <ebss_clear+0xffffffff7fdd901a>
    80204676:	078e                	slli	a5,a5,0x3
    80204678:	953e                	add	a0,a0,a5
    8020467a:	651c                	ld	a5,8(a0)
    8020467c:	c395                	beqz	a5,802046a0 <argfd+0x64>
    return -1;
  if(pfd)
    8020467e:	00090463          	beqz	s2,80204686 <argfd+0x4a>
    *pfd = fd;
    80204682:	00e92023          	sw	a4,0(s2)
  if(pf)
    *pf = f;
  return 0;
    80204686:	4501                	li	a0,0
  if(pf)
    80204688:	c091                	beqz	s1,8020468c <argfd+0x50>
    *pf = f;
    8020468a:	e09c                	sd	a5,0(s1)
}
    8020468c:	70a2                	ld	ra,40(sp)
    8020468e:	7402                	ld	s0,32(sp)
    80204690:	64e2                	ld	s1,24(sp)
    80204692:	6942                	ld	s2,16(sp)
    80204694:	6145                	addi	sp,sp,48
    80204696:	8082                	ret
    return -1;
    80204698:	557d                	li	a0,-1
    8020469a:	bfcd                	j	8020468c <argfd+0x50>
    return -1;
    8020469c:	557d                	li	a0,-1
    8020469e:	b7fd                	j	8020468c <argfd+0x50>
    802046a0:	557d                	li	a0,-1
    802046a2:	b7ed                	j	8020468c <argfd+0x50>

00000000802046a4 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    802046a4:	1101                	addi	sp,sp,-32
    802046a6:	ec06                	sd	ra,24(sp)
    802046a8:	e822                	sd	s0,16(sp)
    802046aa:	e426                	sd	s1,8(sp)
    802046ac:	1000                	addi	s0,sp,32
    802046ae:	84aa                	mv	s1,a0
  int fd;
  struct proc *p = myproc();
    802046b0:	ffffd097          	auipc	ra,0xffffd
    802046b4:	428080e7          	jalr	1064(ra) # 80201ad8 <myproc>
    802046b8:	862a                	mv	a2,a0

  for(fd = 0; fd < NOFILE; fd++){
    802046ba:	0d850793          	addi	a5,a0,216
    802046be:	4501                	li	a0,0
    802046c0:	46c1                	li	a3,16
    if(p->ofile[fd] == 0){
    802046c2:	6398                	ld	a4,0(a5)
    802046c4:	cb19                	beqz	a4,802046da <fdalloc+0x36>
  for(fd = 0; fd < NOFILE; fd++){
    802046c6:	2505                	addiw	a0,a0,1
    802046c8:	07a1                	addi	a5,a5,8
    802046ca:	fed51ce3          	bne	a0,a3,802046c2 <fdalloc+0x1e>
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
    802046ce:	557d                	li	a0,-1
}
    802046d0:	60e2                	ld	ra,24(sp)
    802046d2:	6442                	ld	s0,16(sp)
    802046d4:	64a2                	ld	s1,8(sp)
    802046d6:	6105                	addi	sp,sp,32
    802046d8:	8082                	ret
      p->ofile[fd] = f;
    802046da:	01a50793          	addi	a5,a0,26
    802046de:	078e                	slli	a5,a5,0x3
    802046e0:	963e                	add	a2,a2,a5
    802046e2:	e604                	sd	s1,8(a2)
      return fd;
    802046e4:	b7f5                	j	802046d0 <fdalloc+0x2c>

00000000802046e6 <create>:
  return filestat(f, st);
}

static struct dirent*
create(char *path, short type, int mode)
{
    802046e6:	7169                	addi	sp,sp,-304
    802046e8:	f606                	sd	ra,296(sp)
    802046ea:	f222                	sd	s0,288(sp)
    802046ec:	ee26                	sd	s1,280(sp)
    802046ee:	ea4a                	sd	s2,272(sp)
    802046f0:	e64e                	sd	s3,264(sp)
    802046f2:	1a00                	addi	s0,sp,304
    802046f4:	892e                	mv	s2,a1
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    802046f6:	ed040593          	addi	a1,s0,-304
    802046fa:	00002097          	auipc	ra,0x2
    802046fe:	69c080e7          	jalr	1692(ra) # 80206d96 <enameparent>
    80204702:	84aa                	mv	s1,a0
    80204704:	c945                	beqz	a0,802047b4 <create+0xce>
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
    80204706:	00002097          	auipc	ra,0x2
    8020470a:	eca080e7          	jalr	-310(ra) # 802065d0 <elock>
  if (type == T_DIR) {
    8020470e:	fff90613          	addi	a2,s2,-1
    80204712:	00163613          	seqz	a2,a2
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    80204716:	0046161b          	slliw	a2,a2,0x4
    8020471a:	ed040593          	addi	a1,s0,-304
    8020471e:	8526                	mv	a0,s1
    80204720:	00002097          	auipc	ra,0x2
    80204724:	39c080e7          	jalr	924(ra) # 80206abc <ealloc>
    80204728:	89aa                	mv	s3,a0
    8020472a:	c529                	beqz	a0,80204774 <create+0x8e>
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    8020472c:	0009079b          	sext.w	a5,s2
    80204730:	4705                	li	a4,1
    80204732:	04e78c63          	beq	a5,a4,8020478a <create+0xa4>
    80204736:	2901                	sext.w	s2,s2
    80204738:	4789                	li	a5,2
    8020473a:	00f91663          	bne	s2,a5,80204746 <create+0x60>
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    8020473e:	10054783          	lbu	a5,256(a0)
    80204742:	8bc1                	andi	a5,a5,16
    80204744:	e7b9                	bnez	a5,80204792 <create+0xac>
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
    80204746:	8526                	mv	a0,s1
    80204748:	00002097          	auipc	ra,0x2
    8020474c:	ebe080e7          	jalr	-322(ra) # 80206606 <eunlock>
  eput(dp);
    80204750:	8526                	mv	a0,s1
    80204752:	00002097          	auipc	ra,0x2
    80204756:	f02080e7          	jalr	-254(ra) # 80206654 <eput>

  elock(ep);
    8020475a:	854e                	mv	a0,s3
    8020475c:	00002097          	auipc	ra,0x2
    80204760:	e74080e7          	jalr	-396(ra) # 802065d0 <elock>
  return ep;
}
    80204764:	854e                	mv	a0,s3
    80204766:	70b2                	ld	ra,296(sp)
    80204768:	7412                	ld	s0,288(sp)
    8020476a:	64f2                	ld	s1,280(sp)
    8020476c:	6952                	ld	s2,272(sp)
    8020476e:	69b2                	ld	s3,264(sp)
    80204770:	6155                	addi	sp,sp,304
    80204772:	8082                	ret
    eunlock(dp);
    80204774:	8526                	mv	a0,s1
    80204776:	00002097          	auipc	ra,0x2
    8020477a:	e90080e7          	jalr	-368(ra) # 80206606 <eunlock>
    eput(dp);
    8020477e:	8526                	mv	a0,s1
    80204780:	00002097          	auipc	ra,0x2
    80204784:	ed4080e7          	jalr	-300(ra) # 80206654 <eput>
    return NULL;
    80204788:	bff1                	j	80204764 <create+0x7e>
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
    8020478a:	10054783          	lbu	a5,256(a0)
    8020478e:	8bc1                	andi	a5,a5,16
    80204790:	fbdd                	bnez	a5,80204746 <create+0x60>
    eunlock(dp);
    80204792:	8526                	mv	a0,s1
    80204794:	00002097          	auipc	ra,0x2
    80204798:	e72080e7          	jalr	-398(ra) # 80206606 <eunlock>
    eput(ep);
    8020479c:	854e                	mv	a0,s3
    8020479e:	00002097          	auipc	ra,0x2
    802047a2:	eb6080e7          	jalr	-330(ra) # 80206654 <eput>
    eput(dp);
    802047a6:	8526                	mv	a0,s1
    802047a8:	00002097          	auipc	ra,0x2
    802047ac:	eac080e7          	jalr	-340(ra) # 80206654 <eput>
    return NULL;
    802047b0:	4981                	li	s3,0
    802047b2:	bf4d                	j	80204764 <create+0x7e>
    return NULL;
    802047b4:	89aa                	mv	s3,a0
    802047b6:	b77d                	j	80204764 <create+0x7e>

00000000802047b8 <sys_dup>:
{
    802047b8:	7179                	addi	sp,sp,-48
    802047ba:	f406                	sd	ra,40(sp)
    802047bc:	f022                	sd	s0,32(sp)
    802047be:	ec26                	sd	s1,24(sp)
    802047c0:	e84a                	sd	s2,16(sp)
    802047c2:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0)
    802047c4:	fd840613          	addi	a2,s0,-40
    802047c8:	4581                	li	a1,0
    802047ca:	4501                	li	a0,0
    802047cc:	00000097          	auipc	ra,0x0
    802047d0:	e70080e7          	jalr	-400(ra) # 8020463c <argfd>
    return -1;
    802047d4:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0)
    802047d6:	02054363          	bltz	a0,802047fc <sys_dup+0x44>
  if((fd=fdalloc(f)) < 0)
    802047da:	fd843903          	ld	s2,-40(s0)
    802047de:	854a                	mv	a0,s2
    802047e0:	00000097          	auipc	ra,0x0
    802047e4:	ec4080e7          	jalr	-316(ra) # 802046a4 <fdalloc>
    802047e8:	84aa                	mv	s1,a0
    return -1;
    802047ea:	57fd                	li	a5,-1
  if((fd=fdalloc(f)) < 0)
    802047ec:	00054863          	bltz	a0,802047fc <sys_dup+0x44>
  filedup(f);
    802047f0:	854a                	mv	a0,s2
    802047f2:	fffff097          	auipc	ra,0xfffff
    802047f6:	306080e7          	jalr	774(ra) # 80203af8 <filedup>
  return fd;
    802047fa:	87a6                	mv	a5,s1
}
    802047fc:	853e                	mv	a0,a5
    802047fe:	70a2                	ld	ra,40(sp)
    80204800:	7402                	ld	s0,32(sp)
    80204802:	64e2                	ld	s1,24(sp)
    80204804:	6942                	ld	s2,16(sp)
    80204806:	6145                	addi	sp,sp,48
    80204808:	8082                	ret

000000008020480a <sys_read>:
{
    8020480a:	7179                	addi	sp,sp,-48
    8020480c:	f406                	sd	ra,40(sp)
    8020480e:	f022                	sd	s0,32(sp)
    80204810:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204812:	fe840613          	addi	a2,s0,-24
    80204816:	4581                	li	a1,0
    80204818:	4501                	li	a0,0
    8020481a:	00000097          	auipc	ra,0x0
    8020481e:	e22080e7          	jalr	-478(ra) # 8020463c <argfd>
    return -1;
    80204822:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204824:	04054163          	bltz	a0,80204866 <sys_read+0x5c>
    80204828:	fe440593          	addi	a1,s0,-28
    8020482c:	4509                	li	a0,2
    8020482e:	fffff097          	auipc	ra,0xfffff
    80204832:	89e080e7          	jalr	-1890(ra) # 802030cc <argint>
    return -1;
    80204836:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204838:	02054763          	bltz	a0,80204866 <sys_read+0x5c>
    8020483c:	fd840593          	addi	a1,s0,-40
    80204840:	4505                	li	a0,1
    80204842:	fffff097          	auipc	ra,0xfffff
    80204846:	8ec080e7          	jalr	-1812(ra) # 8020312e <argaddr>
    return -1;
    8020484a:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020484c:	00054d63          	bltz	a0,80204866 <sys_read+0x5c>
  return fileread(f, p, n);
    80204850:	fe442603          	lw	a2,-28(s0)
    80204854:	fd843583          	ld	a1,-40(s0)
    80204858:	fe843503          	ld	a0,-24(s0)
    8020485c:	fffff097          	auipc	ra,0xfffff
    80204860:	408080e7          	jalr	1032(ra) # 80203c64 <fileread>
    80204864:	87aa                	mv	a5,a0
}
    80204866:	853e                	mv	a0,a5
    80204868:	70a2                	ld	ra,40(sp)
    8020486a:	7402                	ld	s0,32(sp)
    8020486c:	6145                	addi	sp,sp,48
    8020486e:	8082                	ret

0000000080204870 <sys_write>:
{
    80204870:	7179                	addi	sp,sp,-48
    80204872:	f406                	sd	ra,40(sp)
    80204874:	f022                	sd	s0,32(sp)
    80204876:	1800                	addi	s0,sp,48
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    80204878:	fe840613          	addi	a2,s0,-24
    8020487c:	4581                	li	a1,0
    8020487e:	4501                	li	a0,0
    80204880:	00000097          	auipc	ra,0x0
    80204884:	dbc080e7          	jalr	-580(ra) # 8020463c <argfd>
    return -1;
    80204888:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020488a:	04054163          	bltz	a0,802048cc <sys_write+0x5c>
    8020488e:	fe440593          	addi	a1,s0,-28
    80204892:	4509                	li	a0,2
    80204894:	fffff097          	auipc	ra,0xfffff
    80204898:	838080e7          	jalr	-1992(ra) # 802030cc <argint>
    return -1;
    8020489c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    8020489e:	02054763          	bltz	a0,802048cc <sys_write+0x5c>
    802048a2:	fd840593          	addi	a1,s0,-40
    802048a6:	4505                	li	a0,1
    802048a8:	fffff097          	auipc	ra,0xfffff
    802048ac:	886080e7          	jalr	-1914(ra) # 8020312e <argaddr>
    return -1;
    802048b0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0)
    802048b2:	00054d63          	bltz	a0,802048cc <sys_write+0x5c>
  return filewrite(f, p, n);
    802048b6:	fe442603          	lw	a2,-28(s0)
    802048ba:	fd843583          	ld	a1,-40(s0)
    802048be:	fe843503          	ld	a0,-24(s0)
    802048c2:	fffff097          	auipc	ra,0xfffff
    802048c6:	464080e7          	jalr	1124(ra) # 80203d26 <filewrite>
    802048ca:	87aa                	mv	a5,a0
}
    802048cc:	853e                	mv	a0,a5
    802048ce:	70a2                	ld	ra,40(sp)
    802048d0:	7402                	ld	s0,32(sp)
    802048d2:	6145                	addi	sp,sp,48
    802048d4:	8082                	ret

00000000802048d6 <sys_close>:
{
    802048d6:	1101                	addi	sp,sp,-32
    802048d8:	ec06                	sd	ra,24(sp)
    802048da:	e822                	sd	s0,16(sp)
    802048dc:	1000                	addi	s0,sp,32
  if(argfd(0, &fd, &f) < 0)
    802048de:	fe040613          	addi	a2,s0,-32
    802048e2:	fec40593          	addi	a1,s0,-20
    802048e6:	4501                	li	a0,0
    802048e8:	00000097          	auipc	ra,0x0
    802048ec:	d54080e7          	jalr	-684(ra) # 8020463c <argfd>
    return -1;
    802048f0:	57fd                	li	a5,-1
  if(argfd(0, &fd, &f) < 0)
    802048f2:	02054463          	bltz	a0,8020491a <sys_close+0x44>
  myproc()->ofile[fd] = 0;
    802048f6:	ffffd097          	auipc	ra,0xffffd
    802048fa:	1e2080e7          	jalr	482(ra) # 80201ad8 <myproc>
    802048fe:	fec42783          	lw	a5,-20(s0)
    80204902:	07e9                	addi	a5,a5,26
    80204904:	078e                	slli	a5,a5,0x3
    80204906:	953e                	add	a0,a0,a5
    80204908:	00053423          	sd	zero,8(a0)
  fileclose(f);
    8020490c:	fe043503          	ld	a0,-32(s0)
    80204910:	fffff097          	auipc	ra,0xfffff
    80204914:	23a080e7          	jalr	570(ra) # 80203b4a <fileclose>
  return 0;
    80204918:	4781                	li	a5,0
}
    8020491a:	853e                	mv	a0,a5
    8020491c:	60e2                	ld	ra,24(sp)
    8020491e:	6442                	ld	s0,16(sp)
    80204920:	6105                	addi	sp,sp,32
    80204922:	8082                	ret

0000000080204924 <sys_fstat>:
{
    80204924:	1101                	addi	sp,sp,-32
    80204926:	ec06                	sd	ra,24(sp)
    80204928:	e822                	sd	s0,16(sp)
    8020492a:	1000                	addi	s0,sp,32
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    8020492c:	fe840613          	addi	a2,s0,-24
    80204930:	4581                	li	a1,0
    80204932:	4501                	li	a0,0
    80204934:	00000097          	auipc	ra,0x0
    80204938:	d08080e7          	jalr	-760(ra) # 8020463c <argfd>
    return -1;
    8020493c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    8020493e:	02054563          	bltz	a0,80204968 <sys_fstat+0x44>
    80204942:	fe040593          	addi	a1,s0,-32
    80204946:	4505                	li	a0,1
    80204948:	ffffe097          	auipc	ra,0xffffe
    8020494c:	7e6080e7          	jalr	2022(ra) # 8020312e <argaddr>
    return -1;
    80204950:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    80204952:	00054b63          	bltz	a0,80204968 <sys_fstat+0x44>
  return filestat(f, st);
    80204956:	fe043583          	ld	a1,-32(s0)
    8020495a:	fe843503          	ld	a0,-24(s0)
    8020495e:	fffff097          	auipc	ra,0xfffff
    80204962:	2a2080e7          	jalr	674(ra) # 80203c00 <filestat>
    80204966:	87aa                	mv	a5,a0
}
    80204968:	853e                	mv	a0,a5
    8020496a:	60e2                	ld	ra,24(sp)
    8020496c:	6442                	ld	s0,16(sp)
    8020496e:	6105                	addi	sp,sp,32
    80204970:	8082                	ret

0000000080204972 <sys_open>:

uint64
sys_open(void)
{
    80204972:	7129                	addi	sp,sp,-320
    80204974:	fe06                	sd	ra,312(sp)
    80204976:	fa22                	sd	s0,304(sp)
    80204978:	f626                	sd	s1,296(sp)
    8020497a:	f24a                	sd	s2,288(sp)
    8020497c:	ee4e                	sd	s3,280(sp)
    8020497e:	0280                	addi	s0,sp,320
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204980:	10400613          	li	a2,260
    80204984:	ec840593          	addi	a1,s0,-312
    80204988:	4501                	li	a0,0
    8020498a:	ffffe097          	auipc	ra,0xffffe
    8020498e:	7c6080e7          	jalr	1990(ra) # 80203150 <argstr>
    80204992:	87aa                	mv	a5,a0
    return -1;
    80204994:	557d                	li	a0,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argint(1, &omode) < 0)
    80204996:	0807ce63          	bltz	a5,80204a32 <sys_open+0xc0>
    8020499a:	ec440593          	addi	a1,s0,-316
    8020499e:	4505                	li	a0,1
    802049a0:	ffffe097          	auipc	ra,0xffffe
    802049a4:	72c080e7          	jalr	1836(ra) # 802030cc <argint>
    802049a8:	0e054163          	bltz	a0,80204a8a <sys_open+0x118>

  if(omode & O_CREATE){
    802049ac:	ec442603          	lw	a2,-316(s0)
    802049b0:	20067793          	andi	a5,a2,512
    802049b4:	c7d1                	beqz	a5,80204a40 <sys_open+0xce>
    ep = create(path, T_FILE, omode);
    802049b6:	4589                	li	a1,2
    802049b8:	ec840513          	addi	a0,s0,-312
    802049bc:	00000097          	auipc	ra,0x0
    802049c0:	d2a080e7          	jalr	-726(ra) # 802046e6 <create>
    802049c4:	892a                	mv	s2,a0
    if(ep == NULL){
    802049c6:	c561                	beqz	a0,80204a8e <sys_open+0x11c>
      eput(ep);
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    802049c8:	fffff097          	auipc	ra,0xfffff
    802049cc:	0c6080e7          	jalr	198(ra) # 80203a8e <filealloc>
    802049d0:	89aa                	mv	s3,a0
    802049d2:	c579                	beqz	a0,80204aa0 <sys_open+0x12e>
    802049d4:	00000097          	auipc	ra,0x0
    802049d8:	cd0080e7          	jalr	-816(ra) # 802046a4 <fdalloc>
    802049dc:	84aa                	mv	s1,a0
    802049de:	0a054c63          	bltz	a0,80204a96 <sys_open+0x124>
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    802049e2:	10094783          	lbu	a5,256(s2)
    802049e6:	8bc1                	andi	a5,a5,16
    802049e8:	e791                	bnez	a5,802049f4 <sys_open+0x82>
    802049ea:	ec442783          	lw	a5,-316(s0)
    802049ee:	4007f793          	andi	a5,a5,1024
    802049f2:	e7d1                	bnez	a5,80204a7e <sys_open+0x10c>
    etrunc(ep);
  }

  f->type = FD_ENTRY;
    802049f4:	4789                	li	a5,2
    802049f6:	00f9a023          	sw	a5,0(s3)
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
    802049fa:	ec442783          	lw	a5,-316(s0)
    802049fe:	0047f693          	andi	a3,a5,4
    80204a02:	4701                	li	a4,0
    80204a04:	c299                	beqz	a3,80204a0a <sys_open+0x98>
    80204a06:	10892703          	lw	a4,264(s2)
    80204a0a:	02e9a023          	sw	a4,32(s3)
  f->ep = ep;
    80204a0e:	0129bc23          	sd	s2,24(s3)
  f->readable = !(omode & O_WRONLY);
    80204a12:	0017c713          	xori	a4,a5,1
    80204a16:	8b05                	andi	a4,a4,1
    80204a18:	00e98423          	sb	a4,8(s3)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204a1c:	8b8d                	andi	a5,a5,3
    80204a1e:	00f037b3          	snez	a5,a5
    80204a22:	00f984a3          	sb	a5,9(s3)

  eunlock(ep);
    80204a26:	854a                	mv	a0,s2
    80204a28:	00002097          	auipc	ra,0x2
    80204a2c:	bde080e7          	jalr	-1058(ra) # 80206606 <eunlock>

  return fd;
    80204a30:	8526                	mv	a0,s1
}
    80204a32:	70f2                	ld	ra,312(sp)
    80204a34:	7452                	ld	s0,304(sp)
    80204a36:	74b2                	ld	s1,296(sp)
    80204a38:	7912                	ld	s2,288(sp)
    80204a3a:	69f2                	ld	s3,280(sp)
    80204a3c:	6131                	addi	sp,sp,320
    80204a3e:	8082                	ret
    if((ep = ename(path)) == NULL){
    80204a40:	ec840513          	addi	a0,s0,-312
    80204a44:	00002097          	auipc	ra,0x2
    80204a48:	334080e7          	jalr	820(ra) # 80206d78 <ename>
    80204a4c:	892a                	mv	s2,a0
    80204a4e:	c131                	beqz	a0,80204a92 <sys_open+0x120>
    elock(ep);
    80204a50:	00002097          	auipc	ra,0x2
    80204a54:	b80080e7          	jalr	-1152(ra) # 802065d0 <elock>
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
    80204a58:	10094783          	lbu	a5,256(s2)
    80204a5c:	8bc1                	andi	a5,a5,16
    80204a5e:	d7ad                	beqz	a5,802049c8 <sys_open+0x56>
    80204a60:	ec442783          	lw	a5,-316(s0)
    80204a64:	d3b5                	beqz	a5,802049c8 <sys_open+0x56>
      eunlock(ep);
    80204a66:	854a                	mv	a0,s2
    80204a68:	00002097          	auipc	ra,0x2
    80204a6c:	b9e080e7          	jalr	-1122(ra) # 80206606 <eunlock>
      eput(ep);
    80204a70:	854a                	mv	a0,s2
    80204a72:	00002097          	auipc	ra,0x2
    80204a76:	be2080e7          	jalr	-1054(ra) # 80206654 <eput>
      return -1;
    80204a7a:	557d                	li	a0,-1
    80204a7c:	bf5d                	j	80204a32 <sys_open+0xc0>
    etrunc(ep);
    80204a7e:	854a                	mv	a0,s2
    80204a80:	00002097          	auipc	ra,0x2
    80204a84:	ae6080e7          	jalr	-1306(ra) # 80206566 <etrunc>
    80204a88:	b7b5                	j	802049f4 <sys_open+0x82>
    return -1;
    80204a8a:	557d                	li	a0,-1
    80204a8c:	b75d                	j	80204a32 <sys_open+0xc0>
      return -1;
    80204a8e:	557d                	li	a0,-1
    80204a90:	b74d                	j	80204a32 <sys_open+0xc0>
      return -1;
    80204a92:	557d                	li	a0,-1
    80204a94:	bf79                	j	80204a32 <sys_open+0xc0>
      fileclose(f);
    80204a96:	854e                	mv	a0,s3
    80204a98:	fffff097          	auipc	ra,0xfffff
    80204a9c:	0b2080e7          	jalr	178(ra) # 80203b4a <fileclose>
    eunlock(ep);
    80204aa0:	854a                	mv	a0,s2
    80204aa2:	00002097          	auipc	ra,0x2
    80204aa6:	b64080e7          	jalr	-1180(ra) # 80206606 <eunlock>
    eput(ep);
    80204aaa:	854a                	mv	a0,s2
    80204aac:	00002097          	auipc	ra,0x2
    80204ab0:	ba8080e7          	jalr	-1112(ra) # 80206654 <eput>
    return -1;
    80204ab4:	557d                	li	a0,-1
    80204ab6:	bfb5                	j	80204a32 <sys_open+0xc0>

0000000080204ab8 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80204ab8:	7169                	addi	sp,sp,-304
    80204aba:	f606                	sd	ra,296(sp)
    80204abc:	f222                	sd	s0,288(sp)
    80204abe:	ee26                	sd	s1,280(sp)
    80204ac0:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204ac2:	10400613          	li	a2,260
    80204ac6:	ed840593          	addi	a1,s0,-296
    80204aca:	4501                	li	a0,0
    80204acc:	ffffe097          	auipc	ra,0xffffe
    80204ad0:	684080e7          	jalr	1668(ra) # 80203150 <argstr>
    return -1;
    80204ad4:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    80204ad6:	02054663          	bltz	a0,80204b02 <sys_mkdir+0x4a>
    80204ada:	4601                	li	a2,0
    80204adc:	4585                	li	a1,1
    80204ade:	ed840513          	addi	a0,s0,-296
    80204ae2:	00000097          	auipc	ra,0x0
    80204ae6:	c04080e7          	jalr	-1020(ra) # 802046e6 <create>
    80204aea:	84aa                	mv	s1,a0
    80204aec:	c10d                	beqz	a0,80204b0e <sys_mkdir+0x56>
  }
  eunlock(ep);
    80204aee:	00002097          	auipc	ra,0x2
    80204af2:	b18080e7          	jalr	-1256(ra) # 80206606 <eunlock>
  eput(ep);
    80204af6:	8526                	mv	a0,s1
    80204af8:	00002097          	auipc	ra,0x2
    80204afc:	b5c080e7          	jalr	-1188(ra) # 80206654 <eput>
  return 0;
    80204b00:	4781                	li	a5,0
}
    80204b02:	853e                	mv	a0,a5
    80204b04:	70b2                	ld	ra,296(sp)
    80204b06:	7412                	ld	s0,288(sp)
    80204b08:	64f2                	ld	s1,280(sp)
    80204b0a:	6155                	addi	sp,sp,304
    80204b0c:	8082                	ret
    return -1;
    80204b0e:	57fd                	li	a5,-1
    80204b10:	bfcd                	j	80204b02 <sys_mkdir+0x4a>

0000000080204b12 <sys_chdir>:

uint64
sys_chdir(void)
{
    80204b12:	7169                	addi	sp,sp,-304
    80204b14:	f606                	sd	ra,296(sp)
    80204b16:	f222                	sd	s0,288(sp)
    80204b18:	ee26                	sd	s1,280(sp)
    80204b1a:	ea4a                	sd	s2,272(sp)
    80204b1c:	1a00                	addi	s0,sp,304
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
    80204b1e:	ffffd097          	auipc	ra,0xffffd
    80204b22:	fba080e7          	jalr	-70(ra) # 80201ad8 <myproc>
    80204b26:	892a                	mv	s2,a0
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204b28:	10400613          	li	a2,260
    80204b2c:	ed840593          	addi	a1,s0,-296
    80204b30:	4501                	li	a0,0
    80204b32:	ffffe097          	auipc	ra,0xffffe
    80204b36:	61e080e7          	jalr	1566(ra) # 80203150 <argstr>
    return -1;
    80204b3a:	57fd                	li	a5,-1
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    80204b3c:	04054063          	bltz	a0,80204b7c <sys_chdir+0x6a>
    80204b40:	ed840513          	addi	a0,s0,-296
    80204b44:	00002097          	auipc	ra,0x2
    80204b48:	234080e7          	jalr	564(ra) # 80206d78 <ename>
    80204b4c:	84aa                	mv	s1,a0
    80204b4e:	c931                	beqz	a0,80204ba2 <sys_chdir+0x90>
  }
  elock(ep);
    80204b50:	00002097          	auipc	ra,0x2
    80204b54:	a80080e7          	jalr	-1408(ra) # 802065d0 <elock>
  if(!(ep->attribute & ATTR_DIRECTORY)){
    80204b58:	1004c783          	lbu	a5,256(s1)
    80204b5c:	8bc1                	andi	a5,a5,16
    80204b5e:	c795                	beqz	a5,80204b8a <sys_chdir+0x78>
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
    80204b60:	8526                	mv	a0,s1
    80204b62:	00002097          	auipc	ra,0x2
    80204b66:	aa4080e7          	jalr	-1372(ra) # 80206606 <eunlock>
  eput(p->cwd);
    80204b6a:	15893503          	ld	a0,344(s2)
    80204b6e:	00002097          	auipc	ra,0x2
    80204b72:	ae6080e7          	jalr	-1306(ra) # 80206654 <eput>
  p->cwd = ep;
    80204b76:	14993c23          	sd	s1,344(s2)
  return 0;
    80204b7a:	4781                	li	a5,0
}
    80204b7c:	853e                	mv	a0,a5
    80204b7e:	70b2                	ld	ra,296(sp)
    80204b80:	7412                	ld	s0,288(sp)
    80204b82:	64f2                	ld	s1,280(sp)
    80204b84:	6952                	ld	s2,272(sp)
    80204b86:	6155                	addi	sp,sp,304
    80204b88:	8082                	ret
    eunlock(ep);
    80204b8a:	8526                	mv	a0,s1
    80204b8c:	00002097          	auipc	ra,0x2
    80204b90:	a7a080e7          	jalr	-1414(ra) # 80206606 <eunlock>
    eput(ep);
    80204b94:	8526                	mv	a0,s1
    80204b96:	00002097          	auipc	ra,0x2
    80204b9a:	abe080e7          	jalr	-1346(ra) # 80206654 <eput>
    return -1;
    80204b9e:	57fd                	li	a5,-1
    80204ba0:	bff1                	j	80204b7c <sys_chdir+0x6a>
    return -1;
    80204ba2:	57fd                	li	a5,-1
    80204ba4:	bfe1                	j	80204b7c <sys_chdir+0x6a>

0000000080204ba6 <sys_pipe>:

uint64
sys_pipe(void)
{
    80204ba6:	7139                	addi	sp,sp,-64
    80204ba8:	fc06                	sd	ra,56(sp)
    80204baa:	f822                	sd	s0,48(sp)
    80204bac:	f426                	sd	s1,40(sp)
    80204bae:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80204bb0:	ffffd097          	auipc	ra,0xffffd
    80204bb4:	f28080e7          	jalr	-216(ra) # 80201ad8 <myproc>
    80204bb8:	84aa                	mv	s1,a0

  if(argaddr(0, &fdarray) < 0)
    80204bba:	fd840593          	addi	a1,s0,-40
    80204bbe:	4501                	li	a0,0
    80204bc0:	ffffe097          	auipc	ra,0xffffe
    80204bc4:	56e080e7          	jalr	1390(ra) # 8020312e <argaddr>
    return -1;
    80204bc8:	57fd                	li	a5,-1
  if(argaddr(0, &fdarray) < 0)
    80204bca:	0c054e63          	bltz	a0,80204ca6 <sys_pipe+0x100>
  if(pipealloc(&rf, &wf) < 0)
    80204bce:	fc840593          	addi	a1,s0,-56
    80204bd2:	fd040513          	addi	a0,s0,-48
    80204bd6:	fffff097          	auipc	ra,0xfffff
    80204bda:	2e6080e7          	jalr	742(ra) # 80203ebc <pipealloc>
    return -1;
    80204bde:	57fd                	li	a5,-1
  if(pipealloc(&rf, &wf) < 0)
    80204be0:	0c054363          	bltz	a0,80204ca6 <sys_pipe+0x100>
  fd0 = -1;
    80204be4:	fcf42223          	sw	a5,-60(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80204be8:	fd043503          	ld	a0,-48(s0)
    80204bec:	00000097          	auipc	ra,0x0
    80204bf0:	ab8080e7          	jalr	-1352(ra) # 802046a4 <fdalloc>
    80204bf4:	fca42223          	sw	a0,-60(s0)
    80204bf8:	08054a63          	bltz	a0,80204c8c <sys_pipe+0xe6>
    80204bfc:	fc843503          	ld	a0,-56(s0)
    80204c00:	00000097          	auipc	ra,0x0
    80204c04:	aa4080e7          	jalr	-1372(ra) # 802046a4 <fdalloc>
    80204c08:	fca42023          	sw	a0,-64(s0)
    80204c0c:	06054763          	bltz	a0,80204c7a <sys_pipe+0xd4>
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204c10:	4611                	li	a2,4
    80204c12:	fc440593          	addi	a1,s0,-60
    80204c16:	fd843503          	ld	a0,-40(s0)
    80204c1a:	ffffc097          	auipc	ra,0xffffc
    80204c1e:	7e4080e7          	jalr	2020(ra) # 802013fe <copyout2>
    80204c22:	00054f63          	bltz	a0,80204c40 <sys_pipe+0x9a>
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80204c26:	4611                	li	a2,4
    80204c28:	fc040593          	addi	a1,s0,-64
    80204c2c:	fd843503          	ld	a0,-40(s0)
    80204c30:	0511                	addi	a0,a0,4
    80204c32:	ffffc097          	auipc	ra,0xffffc
    80204c36:	7cc080e7          	jalr	1996(ra) # 802013fe <copyout2>
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
    80204c3a:	4781                	li	a5,0
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80204c3c:	06055563          	bgez	a0,80204ca6 <sys_pipe+0x100>
    p->ofile[fd0] = 0;
    80204c40:	fc442783          	lw	a5,-60(s0)
    80204c44:	07e9                	addi	a5,a5,26
    80204c46:	078e                	slli	a5,a5,0x3
    80204c48:	97a6                	add	a5,a5,s1
    80204c4a:	0007b423          	sd	zero,8(a5)
    p->ofile[fd1] = 0;
    80204c4e:	fc042783          	lw	a5,-64(s0)
    80204c52:	07e9                	addi	a5,a5,26
    80204c54:	078e                	slli	a5,a5,0x3
    80204c56:	00f48533          	add	a0,s1,a5
    80204c5a:	00053423          	sd	zero,8(a0)
    fileclose(rf);
    80204c5e:	fd043503          	ld	a0,-48(s0)
    80204c62:	fffff097          	auipc	ra,0xfffff
    80204c66:	ee8080e7          	jalr	-280(ra) # 80203b4a <fileclose>
    fileclose(wf);
    80204c6a:	fc843503          	ld	a0,-56(s0)
    80204c6e:	fffff097          	auipc	ra,0xfffff
    80204c72:	edc080e7          	jalr	-292(ra) # 80203b4a <fileclose>
    return -1;
    80204c76:	57fd                	li	a5,-1
    80204c78:	a03d                	j	80204ca6 <sys_pipe+0x100>
    if(fd0 >= 0)
    80204c7a:	fc442783          	lw	a5,-60(s0)
    80204c7e:	0007c763          	bltz	a5,80204c8c <sys_pipe+0xe6>
      p->ofile[fd0] = 0;
    80204c82:	07e9                	addi	a5,a5,26
    80204c84:	078e                	slli	a5,a5,0x3
    80204c86:	97a6                	add	a5,a5,s1
    80204c88:	0007b423          	sd	zero,8(a5)
    fileclose(rf);
    80204c8c:	fd043503          	ld	a0,-48(s0)
    80204c90:	fffff097          	auipc	ra,0xfffff
    80204c94:	eba080e7          	jalr	-326(ra) # 80203b4a <fileclose>
    fileclose(wf);
    80204c98:	fc843503          	ld	a0,-56(s0)
    80204c9c:	fffff097          	auipc	ra,0xfffff
    80204ca0:	eae080e7          	jalr	-338(ra) # 80203b4a <fileclose>
    return -1;
    80204ca4:	57fd                	li	a5,-1
}
    80204ca6:	853e                	mv	a0,a5
    80204ca8:	70e2                	ld	ra,56(sp)
    80204caa:	7442                	ld	s0,48(sp)
    80204cac:	74a2                	ld	s1,40(sp)
    80204cae:	6121                	addi	sp,sp,64
    80204cb0:	8082                	ret

0000000080204cb2 <sys_dev>:

// To open console device.
uint64
sys_dev(void)
{
    80204cb2:	7179                	addi	sp,sp,-48
    80204cb4:	f406                	sd	ra,40(sp)
    80204cb6:	f022                	sd	s0,32(sp)
    80204cb8:	ec26                	sd	s1,24(sp)
    80204cba:	1800                	addi	s0,sp,48
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    80204cbc:	fdc40593          	addi	a1,s0,-36
    80204cc0:	4501                	li	a0,0
    80204cc2:	ffffe097          	auipc	ra,0xffffe
    80204cc6:	40a080e7          	jalr	1034(ra) # 802030cc <argint>
    80204cca:	08054a63          	bltz	a0,80204d5e <sys_dev+0xac>
    80204cce:	fd840593          	addi	a1,s0,-40
    80204cd2:	4505                	li	a0,1
    80204cd4:	ffffe097          	auipc	ra,0xffffe
    80204cd8:	3f8080e7          	jalr	1016(ra) # 802030cc <argint>
    80204cdc:	08054763          	bltz	a0,80204d6a <sys_dev+0xb8>
    80204ce0:	fd440593          	addi	a1,s0,-44
    80204ce4:	4509                	li	a0,2
    80204ce6:	ffffe097          	auipc	ra,0xffffe
    80204cea:	3e6080e7          	jalr	998(ra) # 802030cc <argint>
    80204cee:	08054063          	bltz	a0,80204d6e <sys_dev+0xbc>
    return -1;
  }

  if(omode & O_CREATE){
    80204cf2:	fdc42783          	lw	a5,-36(s0)
    80204cf6:	2007f793          	andi	a5,a5,512
    80204cfa:	ebb1                	bnez	a5,80204d4e <sys_dev+0x9c>
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    80204cfc:	fd842703          	lw	a4,-40(s0)
    80204d00:	47a5                	li	a5,9
    return -1;
    80204d02:	557d                	li	a0,-1
  if(major < 0 || major >= NDEV)
    80204d04:	04e7ee63          	bltu	a5,a4,80204d60 <sys_dev+0xae>

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    80204d08:	fffff097          	auipc	ra,0xfffff
    80204d0c:	d86080e7          	jalr	-634(ra) # 80203a8e <filealloc>
    80204d10:	84aa                	mv	s1,a0
    80204d12:	c125                	beqz	a0,80204d72 <sys_dev+0xc0>
    80204d14:	00000097          	auipc	ra,0x0
    80204d18:	990080e7          	jalr	-1648(ra) # 802046a4 <fdalloc>
    80204d1c:	04054d63          	bltz	a0,80204d76 <sys_dev+0xc4>
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
    80204d20:	478d                	li	a5,3
    80204d22:	c09c                	sw	a5,0(s1)
  f->off = 0;
    80204d24:	0204a023          	sw	zero,32(s1)
  f->ep = 0;
    80204d28:	0004bc23          	sd	zero,24(s1)
  f->major = major;
    80204d2c:	fd842783          	lw	a5,-40(s0)
    80204d30:	02f49223          	sh	a5,36(s1)
  f->readable = !(omode & O_WRONLY);
    80204d34:	fdc42783          	lw	a5,-36(s0)
    80204d38:	0017c713          	xori	a4,a5,1
    80204d3c:	8b05                	andi	a4,a4,1
    80204d3e:	00e48423          	sb	a4,8(s1)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80204d42:	8b8d                	andi	a5,a5,3
    80204d44:	00f037b3          	snez	a5,a5
    80204d48:	00f484a3          	sb	a5,9(s1)

  return fd;
    80204d4c:	a811                	j	80204d60 <sys_dev+0xae>
    panic("dev file on FAT");
    80204d4e:	00005517          	auipc	a0,0x5
    80204d52:	ef250513          	addi	a0,a0,-270 # 80209c40 <digits+0x8c0>
    80204d56:	ffffb097          	auipc	ra,0xffffb
    80204d5a:	3ee080e7          	jalr	1006(ra) # 80200144 <panic>
    return -1;
    80204d5e:	557d                	li	a0,-1
}
    80204d60:	70a2                	ld	ra,40(sp)
    80204d62:	7402                	ld	s0,32(sp)
    80204d64:	64e2                	ld	s1,24(sp)
    80204d66:	6145                	addi	sp,sp,48
    80204d68:	8082                	ret
    return -1;
    80204d6a:	557d                	li	a0,-1
    80204d6c:	bfd5                	j	80204d60 <sys_dev+0xae>
    80204d6e:	557d                	li	a0,-1
    80204d70:	bfc5                	j	80204d60 <sys_dev+0xae>
    return -1;
    80204d72:	557d                	li	a0,-1
    80204d74:	b7f5                	j	80204d60 <sys_dev+0xae>
      fileclose(f);
    80204d76:	8526                	mv	a0,s1
    80204d78:	fffff097          	auipc	ra,0xfffff
    80204d7c:	dd2080e7          	jalr	-558(ra) # 80203b4a <fileclose>
    return -1;
    80204d80:	557d                	li	a0,-1
    80204d82:	bff9                	j	80204d60 <sys_dev+0xae>

0000000080204d84 <sys_readdir>:

// To support ls command
uint64
sys_readdir(void)
{
    80204d84:	1101                	addi	sp,sp,-32
    80204d86:	ec06                	sd	ra,24(sp)
    80204d88:	e822                	sd	s0,16(sp)
    80204d8a:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204d8c:	fe840613          	addi	a2,s0,-24
    80204d90:	4581                	li	a1,0
    80204d92:	4501                	li	a0,0
    80204d94:	00000097          	auipc	ra,0x0
    80204d98:	8a8080e7          	jalr	-1880(ra) # 8020463c <argfd>
    return -1;
    80204d9c:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204d9e:	02054563          	bltz	a0,80204dc8 <sys_readdir+0x44>
    80204da2:	fe040593          	addi	a1,s0,-32
    80204da6:	4505                	li	a0,1
    80204da8:	ffffe097          	auipc	ra,0xffffe
    80204dac:	386080e7          	jalr	902(ra) # 8020312e <argaddr>
    return -1;
    80204db0:	57fd                	li	a5,-1
  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    80204db2:	00054b63          	bltz	a0,80204dc8 <sys_readdir+0x44>
  return dirnext(f, p);
    80204db6:	fe043583          	ld	a1,-32(s0)
    80204dba:	fe843503          	ld	a0,-24(s0)
    80204dbe:	fffff097          	auipc	ra,0xfffff
    80204dc2:	038080e7          	jalr	56(ra) # 80203df6 <dirnext>
    80204dc6:	87aa                	mv	a5,a0
}
    80204dc8:	853e                	mv	a0,a5
    80204dca:	60e2                	ld	ra,24(sp)
    80204dcc:	6442                	ld	s0,16(sp)
    80204dce:	6105                	addi	sp,sp,32
    80204dd0:	8082                	ret

0000000080204dd2 <sys_getcwd>:

// get absolute cwd string
uint64
sys_getcwd(void)
{
    80204dd2:	714d                	addi	sp,sp,-336
    80204dd4:	e686                	sd	ra,328(sp)
    80204dd6:	e2a2                	sd	s0,320(sp)
    80204dd8:	fe26                	sd	s1,312(sp)
    80204dda:	fa4a                	sd	s2,304(sp)
    80204ddc:	f64e                	sd	s3,296(sp)
    80204dde:	f252                	sd	s4,288(sp)
    80204de0:	ee56                	sd	s5,280(sp)
    80204de2:	0a80                	addi	s0,sp,336
  uint64 addr;
  int size;
  if (argaddr(0, &addr) < 0 || argint(1, &size))
    80204de4:	fb840593          	addi	a1,s0,-72
    80204de8:	4501                	li	a0,0
    80204dea:	ffffe097          	auipc	ra,0xffffe
    80204dee:	344080e7          	jalr	836(ra) # 8020312e <argaddr>
    return -1;
    80204df2:	57fd                	li	a5,-1
  if (argaddr(0, &addr) < 0 || argint(1, &size))
    80204df4:	0e054a63          	bltz	a0,80204ee8 <sys_getcwd+0x116>
    80204df8:	fb440593          	addi	a1,s0,-76
    80204dfc:	4505                	li	a0,1
    80204dfe:	ffffe097          	auipc	ra,0xffffe
    80204e02:	2ce080e7          	jalr	718(ra) # 802030cc <argint>
    return -1;
    80204e06:	57fd                	li	a5,-1
  if (argaddr(0, &addr) < 0 || argint(1, &size))
    80204e08:	e165                	bnez	a0,80204ee8 <sys_getcwd+0x116>

  
  struct dirent *de = myproc()->cwd;
    80204e0a:	ffffd097          	auipc	ra,0xffffd
    80204e0e:	cce080e7          	jalr	-818(ra) # 80201ad8 <myproc>
    80204e12:	15853483          	ld	s1,344(a0)
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    80204e16:	1204b783          	ld	a5,288(s1)
    80204e1a:	c7c9                	beqz	a5,80204ea4 <sys_getcwd+0xd2>
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    80204e1c:	fa0409a3          	sb	zero,-77(s0)
    s = path + FAT32_MAX_PATH - 1;
    80204e20:	fb340993          	addi	s3,s0,-77
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
    80204e24:	eb040a13          	addi	s4,s0,-336
        return -1;
      strncpy(s, de->filename, len);
      *--s = '/';
    80204e28:	02f00a93          	li	s5,47
      len = strlen(de->filename);
    80204e2c:	8526                	mv	a0,s1
    80204e2e:	ffffc097          	auipc	ra,0xffffc
    80204e32:	ae6080e7          	jalr	-1306(ra) # 80200914 <strlen>
    80204e36:	862a                	mv	a2,a0
      s -= len;
    80204e38:	40a98933          	sub	s2,s3,a0
      if (s <= path)          // can't reach root "/"
    80204e3c:	0d2a7063          	bgeu	s4,s2,80204efc <sys_getcwd+0x12a>
      strncpy(s, de->filename, len);
    80204e40:	85a6                	mv	a1,s1
    80204e42:	854a                	mv	a0,s2
    80204e44:	ffffc097          	auipc	ra,0xffffc
    80204e48:	a60080e7          	jalr	-1440(ra) # 802008a4 <strncpy>
      *--s = '/';
    80204e4c:	fff90993          	addi	s3,s2,-1
    80204e50:	ff590fa3          	sb	s5,-1(s2)
      de = de->parent;
    80204e54:	1204b483          	ld	s1,288(s1)
    while (de->parent) {
    80204e58:	1204b783          	ld	a5,288(s1)
    80204e5c:	fbe1                	bnez	a5,80204e2c <sys_getcwd+0x5a>
    }
  }

  if (addr == NULL) {
    80204e5e:	fb843783          	ld	a5,-72(s0)
    80204e62:	e7b1                	bnez	a5,80204eae <sys_getcwd+0xdc>
    struct proc *p = myproc();
    80204e64:	ffffd097          	auipc	ra,0xffffd
    80204e68:	c74080e7          	jalr	-908(ra) # 80201ad8 <myproc>
    80204e6c:	84aa                	mv	s1,a0
    // Ensure there is enough space in the stack
    if (p->trapframe->sp < (strlen(s) + 1))
    80204e6e:	713c                	ld	a5,96(a0)
    80204e70:	0307b903          	ld	s2,48(a5)
    80204e74:	854e                	mv	a0,s3
    80204e76:	ffffc097          	auipc	ra,0xffffc
    80204e7a:	a9e080e7          	jalr	-1378(ra) # 80200914 <strlen>
    80204e7e:	2505                	addiw	a0,a0,1
      return -1;
    80204e80:	57fd                	li	a5,-1
    if (p->trapframe->sp < (strlen(s) + 1))
    80204e82:	06a96363          	bltu	s2,a0,80204ee8 <sys_getcwd+0x116>
    p->trapframe->sp -= strlen(s) + 1;
    80204e86:	854e                	mv	a0,s3
    80204e88:	ffffc097          	auipc	ra,0xffffc
    80204e8c:	a8c080e7          	jalr	-1396(ra) # 80200914 <strlen>
    80204e90:	70b8                	ld	a4,96(s1)
    80204e92:	2505                	addiw	a0,a0,1
    80204e94:	7b1c                	ld	a5,48(a4)
    80204e96:	8f89                	sub	a5,a5,a0
    80204e98:	fb1c                	sd	a5,48(a4)
    addr = p->trapframe->sp;
    80204e9a:	70bc                	ld	a5,96(s1)
    80204e9c:	7b9c                	ld	a5,48(a5)
    80204e9e:	faf43c23          	sd	a5,-72(s0)
    80204ea2:	a005                	j	80204ec2 <sys_getcwd+0xf0>
    s = "/";
    80204ea4:	00005997          	auipc	s3,0x5
    80204ea8:	80498993          	addi	s3,s3,-2044 # 802096a8 <digits+0x328>
    80204eac:	bf4d                	j	80204e5e <sys_getcwd+0x8c>
  }
  else{
    int path_length = strlen(s) + 1;  // 缓冲区空间不足
    80204eae:	854e                	mv	a0,s3
    80204eb0:	ffffc097          	auipc	ra,0xffffc
    80204eb4:	a64080e7          	jalr	-1436(ra) # 80200914 <strlen>
      if (size < path_length)
    80204eb8:	fb442703          	lw	a4,-76(s0)
        return NULL;
    80204ebc:	4781                	li	a5,0
      if (size < path_length)
    80204ebe:	02e55563          	bge	a0,a4,80204ee8 <sys_getcwd+0x116>
  }


  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  if (copyout2(addr, s, strlen(s) + 1) < 0)
    80204ec2:	fb843483          	ld	s1,-72(s0)
    80204ec6:	854e                	mv	a0,s3
    80204ec8:	ffffc097          	auipc	ra,0xffffc
    80204ecc:	a4c080e7          	jalr	-1460(ra) # 80200914 <strlen>
    80204ed0:	0015061b          	addiw	a2,a0,1
    80204ed4:	85ce                	mv	a1,s3
    80204ed6:	8526                	mv	a0,s1
    80204ed8:	ffffc097          	auipc	ra,0xffffc
    80204edc:	526080e7          	jalr	1318(ra) # 802013fe <copyout2>
    80204ee0:	02054063          	bltz	a0,80204f00 <sys_getcwd+0x12e>
    return -1;
  
  return addr;
    80204ee4:	fb843783          	ld	a5,-72(s0)

}
    80204ee8:	853e                	mv	a0,a5
    80204eea:	60b6                	ld	ra,328(sp)
    80204eec:	6416                	ld	s0,320(sp)
    80204eee:	74f2                	ld	s1,312(sp)
    80204ef0:	7952                	ld	s2,304(sp)
    80204ef2:	79b2                	ld	s3,296(sp)
    80204ef4:	7a12                	ld	s4,288(sp)
    80204ef6:	6af2                	ld	s5,280(sp)
    80204ef8:	6171                	addi	sp,sp,336
    80204efa:	8082                	ret
        return -1;
    80204efc:	57fd                	li	a5,-1
    80204efe:	b7ed                	j	80204ee8 <sys_getcwd+0x116>
    return -1;
    80204f00:	57fd                	li	a5,-1
    80204f02:	b7dd                	j	80204ee8 <sys_getcwd+0x116>

0000000080204f04 <sys_remove>:
  return ret == -1;
}

uint64
sys_remove(void)
{
    80204f04:	d6010113          	addi	sp,sp,-672
    80204f08:	28113c23          	sd	ra,664(sp)
    80204f0c:	28813823          	sd	s0,656(sp)
    80204f10:	28913423          	sd	s1,648(sp)
    80204f14:	1500                	addi	s0,sp,672
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    80204f16:	10400613          	li	a2,260
    80204f1a:	ed840593          	addi	a1,s0,-296
    80204f1e:	4501                	li	a0,0
    80204f20:	ffffe097          	auipc	ra,0xffffe
    80204f24:	230080e7          	jalr	560(ra) # 80203150 <argstr>
    80204f28:	0ea05a63          	blez	a0,8020501c <sys_remove+0x118>
    return -1;

  char *s = path + len - 1;
    80204f2c:	157d                	addi	a0,a0,-1
    80204f2e:	ed840713          	addi	a4,s0,-296
    80204f32:	00a707b3          	add	a5,a4,a0
  while (s >= path && *s == '/') {
    80204f36:	02f00693          	li	a3,47
    80204f3a:	863a                	mv	a2,a4
    80204f3c:	00e7e963          	bltu	a5,a4,80204f4e <sys_remove+0x4a>
    80204f40:	0007c703          	lbu	a4,0(a5)
    80204f44:	08d71a63          	bne	a4,a3,80204fd8 <sys_remove+0xd4>
    s--;
    80204f48:	17fd                	addi	a5,a5,-1
  while (s >= path && *s == '/') {
    80204f4a:	fec7fbe3          	bgeu	a5,a2,80204f40 <sys_remove+0x3c>
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    80204f4e:	ed840513          	addi	a0,s0,-296
    80204f52:	00002097          	auipc	ra,0x2
    80204f56:	e26080e7          	jalr	-474(ra) # 80206d78 <ename>
    80204f5a:	84aa                	mv	s1,a0
    80204f5c:	c561                	beqz	a0,80205024 <sys_remove+0x120>
    return -1;
  }
  elock(ep);
    80204f5e:	00001097          	auipc	ra,0x1
    80204f62:	672080e7          	jalr	1650(ra) # 802065d0 <elock>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204f66:	1004c783          	lbu	a5,256(s1)
    80204f6a:	8bc1                	andi	a5,a5,16
    80204f6c:	c38d                	beqz	a5,80204f8e <sys_remove+0x8a>
  ep.valid = 0;
    80204f6e:	e8041323          	sh	zero,-378(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80204f72:	d6c40693          	addi	a3,s0,-660
    80204f76:	04000613          	li	a2,64
    80204f7a:	d7040593          	addi	a1,s0,-656
    80204f7e:	8526                	mv	a0,s1
    80204f80:	00002097          	auipc	ra,0x2
    80204f84:	854080e7          	jalr	-1964(ra) # 802067d4 <enext>
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
    80204f88:	57fd                	li	a5,-1
    80204f8a:	06f51d63          	bne	a0,a5,80205004 <sys_remove+0x100>
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
    80204f8e:	1204b503          	ld	a0,288(s1)
    80204f92:	00001097          	auipc	ra,0x1
    80204f96:	63e080e7          	jalr	1598(ra) # 802065d0 <elock>
  eremove(ep);
    80204f9a:	8526                	mv	a0,s1
    80204f9c:	00001097          	auipc	ra,0x1
    80204fa0:	500080e7          	jalr	1280(ra) # 8020649c <eremove>
  eunlock(ep->parent);
    80204fa4:	1204b503          	ld	a0,288(s1)
    80204fa8:	00001097          	auipc	ra,0x1
    80204fac:	65e080e7          	jalr	1630(ra) # 80206606 <eunlock>
  eunlock(ep);
    80204fb0:	8526                	mv	a0,s1
    80204fb2:	00001097          	auipc	ra,0x1
    80204fb6:	654080e7          	jalr	1620(ra) # 80206606 <eunlock>
  eput(ep);
    80204fba:	8526                	mv	a0,s1
    80204fbc:	00001097          	auipc	ra,0x1
    80204fc0:	698080e7          	jalr	1688(ra) # 80206654 <eput>

  return 0;
    80204fc4:	4501                	li	a0,0
}
    80204fc6:	29813083          	ld	ra,664(sp)
    80204fca:	29013403          	ld	s0,656(sp)
    80204fce:	28813483          	ld	s1,648(sp)
    80204fd2:	2a010113          	addi	sp,sp,672
    80204fd6:	8082                	ret
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    80204fd8:	ed840713          	addi	a4,s0,-296
    80204fdc:	f6e7e9e3          	bltu	a5,a4,80204f4e <sys_remove+0x4a>
    80204fe0:	0007c683          	lbu	a3,0(a5)
    80204fe4:	02e00713          	li	a4,46
    80204fe8:	f6e693e3          	bne	a3,a4,80204f4e <sys_remove+0x4a>
    80204fec:	ed840713          	addi	a4,s0,-296
    80204ff0:	02e78863          	beq	a5,a4,80205020 <sys_remove+0x11c>
    80204ff4:	fff7c703          	lbu	a4,-1(a5)
    80204ff8:	02f00793          	li	a5,47
    80204ffc:	f4f719e3          	bne	a4,a5,80204f4e <sys_remove+0x4a>
    return -1;
    80205000:	557d                	li	a0,-1
    80205002:	b7d1                	j	80204fc6 <sys_remove+0xc2>
      eunlock(ep);
    80205004:	8526                	mv	a0,s1
    80205006:	00001097          	auipc	ra,0x1
    8020500a:	600080e7          	jalr	1536(ra) # 80206606 <eunlock>
      eput(ep);
    8020500e:	8526                	mv	a0,s1
    80205010:	00001097          	auipc	ra,0x1
    80205014:	644080e7          	jalr	1604(ra) # 80206654 <eput>
      return -1;
    80205018:	557d                	li	a0,-1
    8020501a:	b775                	j	80204fc6 <sys_remove+0xc2>
    return -1;
    8020501c:	557d                	li	a0,-1
    8020501e:	b765                	j	80204fc6 <sys_remove+0xc2>
    return -1;
    80205020:	557d                	li	a0,-1
    80205022:	b755                	j	80204fc6 <sys_remove+0xc2>
    return -1;
    80205024:	557d                	li	a0,-1
    80205026:	b745                	j	80204fc6 <sys_remove+0xc2>

0000000080205028 <sys_rename>:

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
    80205028:	c4010113          	addi	sp,sp,-960
    8020502c:	3a113c23          	sd	ra,952(sp)
    80205030:	3a813823          	sd	s0,944(sp)
    80205034:	3a913423          	sd	s1,936(sp)
    80205038:	3b213023          	sd	s2,928(sp)
    8020503c:	39313c23          	sd	s3,920(sp)
    80205040:	39413823          	sd	s4,912(sp)
    80205044:	0780                	addi	s0,sp,960
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205046:	10400613          	li	a2,260
    8020504a:	ec840593          	addi	a1,s0,-312
    8020504e:	4501                	li	a0,0
    80205050:	ffffe097          	auipc	ra,0xffffe
    80205054:	100080e7          	jalr	256(ra) # 80203150 <argstr>
      return -1;
    80205058:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    8020505a:	0c054d63          	bltz	a0,80205134 <sys_rename+0x10c>
    8020505e:	10400613          	li	a2,260
    80205062:	dc040593          	addi	a1,s0,-576
    80205066:	4505                	li	a0,1
    80205068:	ffffe097          	auipc	ra,0xffffe
    8020506c:	0e8080e7          	jalr	232(ra) # 80203150 <argstr>
      return -1;
    80205070:	57fd                	li	a5,-1
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
    80205072:	0c054163          	bltz	a0,80205134 <sys_rename+0x10c>
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
    80205076:	ec840513          	addi	a0,s0,-312
    8020507a:	00002097          	auipc	ra,0x2
    8020507e:	cfe080e7          	jalr	-770(ra) # 80206d78 <ename>
    80205082:	84aa                	mv	s1,a0
    80205084:	1c050963          	beqz	a0,80205256 <sys_rename+0x22e>
    80205088:	ec840593          	addi	a1,s0,-312
    8020508c:	dc040513          	addi	a0,s0,-576
    80205090:	00002097          	auipc	ra,0x2
    80205094:	d06080e7          	jalr	-762(ra) # 80206d96 <enameparent>
    80205098:	892a                	mv	s2,a0
    8020509a:	cd35                	beqz	a0,80205116 <sys_rename+0xee>
      || (name = formatname(old)) == NULL) {
    8020509c:	ec840513          	addi	a0,s0,-312
    802050a0:	00001097          	auipc	ra,0x1
    802050a4:	e50080e7          	jalr	-432(ra) # 80205ef0 <formatname>
    802050a8:	89aa                	mv	s3,a0
    802050aa:	c535                	beqz	a0,80205116 <sys_rename+0xee>
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
    802050ac:	07248563          	beq	s1,s2,80205116 <sys_rename+0xee>
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    802050b0:	87ca                	mv	a5,s2
    802050b2:	1207b783          	ld	a5,288(a5)
    802050b6:	c781                	beqz	a5,802050be <sys_rename+0x96>
    if (ep == src) {    // In what universe can we move a directory into its child?
    802050b8:	fef49de3          	bne	s1,a5,802050b2 <sys_rename+0x8a>
    802050bc:	a8a9                	j	80205116 <sys_rename+0xee>
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
    802050be:	8526                	mv	a0,s1
    802050c0:	00001097          	auipc	ra,0x1
    802050c4:	510080e7          	jalr	1296(ra) # 802065d0 <elock>
  srclock = 1;
  elock(pdst);
    802050c8:	854a                	mv	a0,s2
    802050ca:	00001097          	auipc	ra,0x1
    802050ce:	506080e7          	jalr	1286(ra) # 802065d0 <elock>
  dst = dirlookup(pdst, name, &off);
    802050d2:	dbc40613          	addi	a2,s0,-580
    802050d6:	85ce                	mv	a1,s3
    802050d8:	854a                	mv	a0,s2
    802050da:	00002097          	auipc	ra,0x2
    802050de:	884080e7          	jalr	-1916(ra) # 8020695e <dirlookup>
    802050e2:	8a2a                	mv	s4,a0
  if (dst != NULL) {
    802050e4:	cd45                	beqz	a0,8020519c <sys_rename+0x174>
    eunlock(pdst);
    802050e6:	854a                	mv	a0,s2
    802050e8:	00001097          	auipc	ra,0x1
    802050ec:	51e080e7          	jalr	1310(ra) # 80206606 <eunlock>
    if (src == dst) {
    802050f0:	01448963          	beq	s1,s4,80205102 <sys_rename+0xda>
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
    802050f4:	1004c783          	lbu	a5,256(s1)
    802050f8:	100a4703          	lbu	a4,256(s4)
    802050fc:	8ff9                	and	a5,a5,a4
    802050fe:	8bc1                	andi	a5,a5,16
    80205100:	ebb1                	bnez	a5,80205154 <sys_rename+0x12c>

  return 0;

fail:
  if (srclock)
    eunlock(src);
    80205102:	8526                	mv	a0,s1
    80205104:	00001097          	auipc	ra,0x1
    80205108:	502080e7          	jalr	1282(ra) # 80206606 <eunlock>
  if (dst)
    eput(dst);
    8020510c:	8552                	mv	a0,s4
    8020510e:	00001097          	auipc	ra,0x1
    80205112:	546080e7          	jalr	1350(ra) # 80206654 <eput>
  if (pdst)
    80205116:	00090763          	beqz	s2,80205124 <sys_rename+0xfc>
    eput(pdst);
    8020511a:	854a                	mv	a0,s2
    8020511c:	00001097          	auipc	ra,0x1
    80205120:	538080e7          	jalr	1336(ra) # 80206654 <eput>
  if (src)
    eput(src);
  return -1;
    80205124:	57fd                	li	a5,-1
  if (src)
    80205126:	c499                	beqz	s1,80205134 <sys_rename+0x10c>
    eput(src);
    80205128:	8526                	mv	a0,s1
    8020512a:	00001097          	auipc	ra,0x1
    8020512e:	52a080e7          	jalr	1322(ra) # 80206654 <eput>
  return -1;
    80205132:	57fd                	li	a5,-1
}
    80205134:	853e                	mv	a0,a5
    80205136:	3b813083          	ld	ra,952(sp)
    8020513a:	3b013403          	ld	s0,944(sp)
    8020513e:	3a813483          	ld	s1,936(sp)
    80205142:	3a013903          	ld	s2,928(sp)
    80205146:	39813983          	ld	s3,920(sp)
    8020514a:	39013a03          	ld	s4,912(sp)
    8020514e:	3c010113          	addi	sp,sp,960
    80205152:	8082                	ret
      elock(dst);
    80205154:	8552                	mv	a0,s4
    80205156:	00001097          	auipc	ra,0x1
    8020515a:	47a080e7          	jalr	1146(ra) # 802065d0 <elock>
  ep.valid = 0;
    8020515e:	d6041323          	sh	zero,-666(s0)
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
    80205162:	c4c40693          	addi	a3,s0,-948
    80205166:	04000613          	li	a2,64
    8020516a:	c5040593          	addi	a1,s0,-944
    8020516e:	8552                	mv	a0,s4
    80205170:	00001097          	auipc	ra,0x1
    80205174:	664080e7          	jalr	1636(ra) # 802067d4 <enext>
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
    80205178:	57fd                	li	a5,-1
    8020517a:	0cf51863          	bne	a0,a5,8020524a <sys_rename+0x222>
      elock(pdst);
    8020517e:	854a                	mv	a0,s2
    80205180:	00001097          	auipc	ra,0x1
    80205184:	450080e7          	jalr	1104(ra) # 802065d0 <elock>
    eremove(dst);
    80205188:	8552                	mv	a0,s4
    8020518a:	00001097          	auipc	ra,0x1
    8020518e:	312080e7          	jalr	786(ra) # 8020649c <eremove>
    eunlock(dst);
    80205192:	8552                	mv	a0,s4
    80205194:	00001097          	auipc	ra,0x1
    80205198:	472080e7          	jalr	1138(ra) # 80206606 <eunlock>
  memmove(src->filename, name, FAT32_MAX_FILENAME);
    8020519c:	0ff00613          	li	a2,255
    802051a0:	85ce                	mv	a1,s3
    802051a2:	8526                	mv	a0,s1
    802051a4:	ffffb097          	auipc	ra,0xffffb
    802051a8:	648080e7          	jalr	1608(ra) # 802007ec <memmove>
  emake(pdst, src, off);
    802051ac:	dbc42603          	lw	a2,-580(s0)
    802051b0:	85a6                	mv	a1,s1
    802051b2:	854a                	mv	a0,s2
    802051b4:	00001097          	auipc	ra,0x1
    802051b8:	df4080e7          	jalr	-524(ra) # 80205fa8 <emake>
  if (src->parent != pdst) {
    802051bc:	1204b783          	ld	a5,288(s1)
    802051c0:	01278d63          	beq	a5,s2,802051da <sys_rename+0x1b2>
    eunlock(pdst);
    802051c4:	854a                	mv	a0,s2
    802051c6:	00001097          	auipc	ra,0x1
    802051ca:	440080e7          	jalr	1088(ra) # 80206606 <eunlock>
    elock(src->parent);
    802051ce:	1204b503          	ld	a0,288(s1)
    802051d2:	00001097          	auipc	ra,0x1
    802051d6:	3fe080e7          	jalr	1022(ra) # 802065d0 <elock>
  eremove(src);
    802051da:	8526                	mv	a0,s1
    802051dc:	00001097          	auipc	ra,0x1
    802051e0:	2c0080e7          	jalr	704(ra) # 8020649c <eremove>
  eunlock(src->parent);
    802051e4:	1204b503          	ld	a0,288(s1)
    802051e8:	00001097          	auipc	ra,0x1
    802051ec:	41e080e7          	jalr	1054(ra) # 80206606 <eunlock>
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
    802051f0:	1204b983          	ld	s3,288(s1)
  src->parent = edup(pdst);
    802051f4:	854a                	mv	a0,s2
    802051f6:	00001097          	auipc	ra,0x1
    802051fa:	17c080e7          	jalr	380(ra) # 80206372 <edup>
    802051fe:	12a4b023          	sd	a0,288(s1)
  src->off = off;
    80205202:	dbc42783          	lw	a5,-580(s0)
    80205206:	10f4ae23          	sw	a5,284(s1)
  src->valid = 1;
    8020520a:	4785                	li	a5,1
    8020520c:	10f49b23          	sh	a5,278(s1)
  eunlock(src);
    80205210:	8526                	mv	a0,s1
    80205212:	00001097          	auipc	ra,0x1
    80205216:	3f4080e7          	jalr	1012(ra) # 80206606 <eunlock>
  eput(psrc);
    8020521a:	854e                	mv	a0,s3
    8020521c:	00001097          	auipc	ra,0x1
    80205220:	438080e7          	jalr	1080(ra) # 80206654 <eput>
  if (dst) {
    80205224:	000a0763          	beqz	s4,80205232 <sys_rename+0x20a>
    eput(dst);
    80205228:	8552                	mv	a0,s4
    8020522a:	00001097          	auipc	ra,0x1
    8020522e:	42a080e7          	jalr	1066(ra) # 80206654 <eput>
  eput(pdst);
    80205232:	854a                	mv	a0,s2
    80205234:	00001097          	auipc	ra,0x1
    80205238:	420080e7          	jalr	1056(ra) # 80206654 <eput>
  eput(src);
    8020523c:	8526                	mv	a0,s1
    8020523e:	00001097          	auipc	ra,0x1
    80205242:	416080e7          	jalr	1046(ra) # 80206654 <eput>
  return 0;
    80205246:	4781                	li	a5,0
    80205248:	b5f5                	j	80205134 <sys_rename+0x10c>
        eunlock(dst);
    8020524a:	8552                	mv	a0,s4
    8020524c:	00001097          	auipc	ra,0x1
    80205250:	3ba080e7          	jalr	954(ra) # 80206606 <eunlock>
        goto fail;
    80205254:	b57d                	j	80205102 <sys_rename+0xda>
  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
    80205256:	892a                	mv	s2,a0
  if (dst)
    80205258:	bd7d                	j	80205116 <sys_rename+0xee>
    8020525a:	0000                	unimp
    8020525c:	0000                	unimp
	...

0000000080205260 <kernelvec>:
    80205260:	7111                	addi	sp,sp,-256
    80205262:	e006                	sd	ra,0(sp)
    80205264:	e40a                	sd	sp,8(sp)
    80205266:	e80e                	sd	gp,16(sp)
    80205268:	ec12                	sd	tp,24(sp)
    8020526a:	f016                	sd	t0,32(sp)
    8020526c:	f41a                	sd	t1,40(sp)
    8020526e:	f81e                	sd	t2,48(sp)
    80205270:	fc22                	sd	s0,56(sp)
    80205272:	e0a6                	sd	s1,64(sp)
    80205274:	e4aa                	sd	a0,72(sp)
    80205276:	e8ae                	sd	a1,80(sp)
    80205278:	ecb2                	sd	a2,88(sp)
    8020527a:	f0b6                	sd	a3,96(sp)
    8020527c:	f4ba                	sd	a4,104(sp)
    8020527e:	f8be                	sd	a5,112(sp)
    80205280:	fcc2                	sd	a6,120(sp)
    80205282:	e146                	sd	a7,128(sp)
    80205284:	e54a                	sd	s2,136(sp)
    80205286:	e94e                	sd	s3,144(sp)
    80205288:	ed52                	sd	s4,152(sp)
    8020528a:	f156                	sd	s5,160(sp)
    8020528c:	f55a                	sd	s6,168(sp)
    8020528e:	f95e                	sd	s7,176(sp)
    80205290:	fd62                	sd	s8,184(sp)
    80205292:	e1e6                	sd	s9,192(sp)
    80205294:	e5ea                	sd	s10,200(sp)
    80205296:	e9ee                	sd	s11,208(sp)
    80205298:	edf2                	sd	t3,216(sp)
    8020529a:	f1f6                	sd	t4,224(sp)
    8020529c:	f5fa                	sd	t5,232(sp)
    8020529e:	f9fe                	sd	t6,240(sp)
    802052a0:	9affd0ef          	jal	ra,80202c4e <kerneltrap>
    802052a4:	6082                	ld	ra,0(sp)
    802052a6:	6122                	ld	sp,8(sp)
    802052a8:	61c2                	ld	gp,16(sp)
    802052aa:	7282                	ld	t0,32(sp)
    802052ac:	7322                	ld	t1,40(sp)
    802052ae:	73c2                	ld	t2,48(sp)
    802052b0:	7462                	ld	s0,56(sp)
    802052b2:	6486                	ld	s1,64(sp)
    802052b4:	6526                	ld	a0,72(sp)
    802052b6:	65c6                	ld	a1,80(sp)
    802052b8:	6666                	ld	a2,88(sp)
    802052ba:	7686                	ld	a3,96(sp)
    802052bc:	7726                	ld	a4,104(sp)
    802052be:	77c6                	ld	a5,112(sp)
    802052c0:	7866                	ld	a6,120(sp)
    802052c2:	688a                	ld	a7,128(sp)
    802052c4:	692a                	ld	s2,136(sp)
    802052c6:	69ca                	ld	s3,144(sp)
    802052c8:	6a6a                	ld	s4,152(sp)
    802052ca:	7a8a                	ld	s5,160(sp)
    802052cc:	7b2a                	ld	s6,168(sp)
    802052ce:	7bca                	ld	s7,176(sp)
    802052d0:	7c6a                	ld	s8,184(sp)
    802052d2:	6c8e                	ld	s9,192(sp)
    802052d4:	6d2e                	ld	s10,200(sp)
    802052d6:	6dce                	ld	s11,208(sp)
    802052d8:	6e6e                	ld	t3,216(sp)
    802052da:	7e8e                	ld	t4,224(sp)
    802052dc:	7f2e                	ld	t5,232(sp)
    802052de:	7fce                	ld	t6,240(sp)
    802052e0:	6111                	addi	sp,sp,256
    802052e2:	10200073          	sret
	...

00000000802052ee <timerinit>:
#include "include/proc.h"

struct spinlock tickslock;
uint ticks;

void timerinit() {
    802052ee:	1141                	addi	sp,sp,-16
    802052f0:	e406                	sd	ra,8(sp)
    802052f2:	e022                	sd	s0,0(sp)
    802052f4:	0800                	addi	s0,sp,16
    initlock(&tickslock, "time");
    802052f6:	00005597          	auipc	a1,0x5
    802052fa:	95a58593          	addi	a1,a1,-1702 # 80209c50 <digits+0x8d0>
    802052fe:	00019517          	auipc	a0,0x19
    80205302:	10a50513          	addi	a0,a0,266 # 8021e408 <tickslock>
    80205306:	ffffb097          	auipc	ra,0xffffb
    8020530a:	3aa080e7          	jalr	938(ra) # 802006b0 <initlock>
    #ifdef DEBUG
    printf("timerinit\n");
    8020530e:	00005517          	auipc	a0,0x5
    80205312:	94a50513          	addi	a0,a0,-1718 # 80209c58 <digits+0x8d8>
    80205316:	ffffb097          	auipc	ra,0xffffb
    8020531a:	e78080e7          	jalr	-392(ra) # 8020018e <printf>
    #endif
}
    8020531e:	60a2                	ld	ra,8(sp)
    80205320:	6402                	ld	s0,0(sp)
    80205322:	0141                	addi	sp,sp,16
    80205324:	8082                	ret

0000000080205326 <set_next_timeout>:

void
set_next_timeout() {
    80205326:	1141                	addi	sp,sp,-16
    80205328:	e422                	sd	s0,8(sp)
    8020532a:	0800                	addi	s0,sp,16
  asm volatile("rdtime %0" : "=r" (x) );
    8020532c:	c0102573          	rdtime	a0
    // if comment the `printf` line below
    // the timer will not work.

    // this bug seems to disappear automatically
    // printf("");
    sbi_set_timer(r_time() + INTERVAL);
    80205330:	001dc7b7          	lui	a5,0x1dc
    80205334:	13078793          	addi	a5,a5,304 # 1dc130 <_entry-0x80023ed0>
    80205338:	953e                	add	a0,a0,a5
	SBI_CALL_1(SBI_SET_TIMER, stime_value);
    8020533a:	4581                	li	a1,0
    8020533c:	4601                	li	a2,0
    8020533e:	4681                	li	a3,0
    80205340:	4881                	li	a7,0
    80205342:	00000073          	ecall
}
    80205346:	6422                	ld	s0,8(sp)
    80205348:	0141                	addi	sp,sp,16
    8020534a:	8082                	ret

000000008020534c <timer_tick>:

void timer_tick() {
    8020534c:	1101                	addi	sp,sp,-32
    8020534e:	ec06                	sd	ra,24(sp)
    80205350:	e822                	sd	s0,16(sp)
    80205352:	e426                	sd	s1,8(sp)
    80205354:	1000                	addi	s0,sp,32
    acquire(&tickslock);
    80205356:	00019497          	auipc	s1,0x19
    8020535a:	0b248493          	addi	s1,s1,178 # 8021e408 <tickslock>
    8020535e:	8526                	mv	a0,s1
    80205360:	ffffb097          	auipc	ra,0xffffb
    80205364:	394080e7          	jalr	916(ra) # 802006f4 <acquire>
    ticks++;
    80205368:	4c9c                	lw	a5,24(s1)
    8020536a:	2785                	addiw	a5,a5,1
    8020536c:	cc9c                	sw	a5,24(s1)
    wakeup(&ticks);
    8020536e:	00019517          	auipc	a0,0x19
    80205372:	0b250513          	addi	a0,a0,178 # 8021e420 <ticks>
    80205376:	ffffd097          	auipc	ra,0xffffd
    8020537a:	16e080e7          	jalr	366(ra) # 802024e4 <wakeup>
    release(&tickslock);
    8020537e:	8526                	mv	a0,s1
    80205380:	ffffb097          	auipc	ra,0xffffb
    80205384:	3c8080e7          	jalr	968(ra) # 80200748 <release>
    set_next_timeout();
    80205388:	00000097          	auipc	ra,0x0
    8020538c:	f9e080e7          	jalr	-98(ra) # 80205326 <set_next_timeout>
}
    80205390:	60e2                	ld	ra,24(sp)
    80205392:	6442                	ld	s0,16(sp)
    80205394:	64a2                	ld	s1,8(sp)
    80205396:	6105                	addi	sp,sp,32
    80205398:	8082                	ret

000000008020539a <disk_init>:
#else
#include "include/virtio.h"
#endif 

void disk_init(void)
{
    8020539a:	1141                	addi	sp,sp,-16
    8020539c:	e406                	sd	ra,8(sp)
    8020539e:	e022                	sd	s0,0(sp)
    802053a0:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_init();
    802053a2:	00002097          	auipc	ra,0x2
    802053a6:	f34080e7          	jalr	-204(ra) # 802072d6 <virtio_disk_init>
	#else 
	sdcard_init();
    #endif
}
    802053aa:	60a2                	ld	ra,8(sp)
    802053ac:	6402                	ld	s0,0(sp)
    802053ae:	0141                	addi	sp,sp,16
    802053b0:	8082                	ret

00000000802053b2 <disk_read>:

void disk_read(struct buf *b)
{
    802053b2:	1141                	addi	sp,sp,-16
    802053b4:	e406                	sd	ra,8(sp)
    802053b6:	e022                	sd	s0,0(sp)
    802053b8:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 0);
    802053ba:	4581                	li	a1,0
    802053bc:	00002097          	auipc	ra,0x2
    802053c0:	0b0080e7          	jalr	176(ra) # 8020746c <virtio_disk_rw>
    #else 
	sdcard_read_sector(b->data, b->sectorno);
	#endif
}
    802053c4:	60a2                	ld	ra,8(sp)
    802053c6:	6402                	ld	s0,0(sp)
    802053c8:	0141                	addi	sp,sp,16
    802053ca:	8082                	ret

00000000802053cc <disk_write>:

void disk_write(struct buf *b)
{
    802053cc:	1141                	addi	sp,sp,-16
    802053ce:	e406                	sd	ra,8(sp)
    802053d0:	e022                	sd	s0,0(sp)
    802053d2:	0800                	addi	s0,sp,16
    #ifdef QEMU
	virtio_disk_rw(b, 1);
    802053d4:	4585                	li	a1,1
    802053d6:	00002097          	auipc	ra,0x2
    802053da:	096080e7          	jalr	150(ra) # 8020746c <virtio_disk_rw>
    #else 
	sdcard_write_sector(b->data, b->sectorno);
	#endif
}
    802053de:	60a2                	ld	ra,8(sp)
    802053e0:	6402                	ld	s0,0(sp)
    802053e2:	0141                	addi	sp,sp,16
    802053e4:	8082                	ret

00000000802053e6 <disk_intr>:

void disk_intr(void)
{
    802053e6:	1141                	addi	sp,sp,-16
    802053e8:	e406                	sd	ra,8(sp)
    802053ea:	e022                	sd	s0,0(sp)
    802053ec:	0800                	addi	s0,sp,16
    #ifdef QEMU
    virtio_disk_intr();
    802053ee:	00002097          	auipc	ra,0x2
    802053f2:	30a080e7          	jalr	778(ra) # 802076f8 <virtio_disk_intr>
    #else 
    dmac_intr(DMAC_CHANNEL0);
    #endif
}
    802053f6:	60a2                	ld	ra,8(sp)
    802053f8:	6402                	ld	s0,0(sp)
    802053fa:	0141                	addi	sp,sp,16
    802053fc:	8082                	ret

00000000802053fe <read_fat>:
/**
 * Read the FAT table content corresponded to the given cluster number.
 * @param   cluster     the number of cluster which you want to read its content in FAT table
 */
static uint32 read_fat(uint32 cluster)
{
    802053fe:	1101                	addi	sp,sp,-32
    80205400:	ec06                	sd	ra,24(sp)
    80205402:	e822                	sd	s0,16(sp)
    80205404:	e426                	sd	s1,8(sp)
    80205406:	e04a                	sd	s2,0(sp)
    80205408:	1000                	addi	s0,sp,32
    if (cluster >= FAT32_EOC) {
    8020540a:	100007b7          	lui	a5,0x10000
    8020540e:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
        return cluster;
    80205410:	84aa                	mv	s1,a0
    if (cluster >= FAT32_EOC) {
    80205412:	00a7ea63          	bltu	a5,a0,80205426 <read_fat+0x28>
    }
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205416:	00019797          	auipc	a5,0x19
    8020541a:	01a7a783          	lw	a5,26(a5) # 8021e430 <fat+0x8>
    8020541e:	2785                	addiw	a5,a5,1
        return 0;
    80205420:	4481                	li	s1,0
    if (cluster > fat.data_clus_cnt + 1) {     // because cluster number starts at 2, not 0
    80205422:	00a7f963          	bgeu	a5,a0,80205434 <read_fat+0x36>
    // here should be a cache layer for FAT table, but not implemented yet.
    struct buf *b = bread(0, fat_sec);
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    brelse(b);
    return next_clus;
}
    80205426:	8526                	mv	a0,s1
    80205428:	60e2                	ld	ra,24(sp)
    8020542a:	6442                	ld	s0,16(sp)
    8020542c:	64a2                	ld	s1,8(sp)
    8020542e:	6902                	ld	s2,0(sp)
    80205430:	6105                	addi	sp,sp,32
    80205432:	8082                	ret
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    80205434:	0025149b          	slliw	s1,a0,0x2
    80205438:	00019917          	auipc	s2,0x19
    8020543c:	ff090913          	addi	s2,s2,-16 # 8021e428 <fat>
    80205440:	01095783          	lhu	a5,16(s2)
    80205444:	02f4d7bb          	divuw	a5,s1,a5
    80205448:	01495583          	lhu	a1,20(s2)
    struct buf *b = bread(0, fat_sec);
    8020544c:	9dbd                	addw	a1,a1,a5
    8020544e:	4501                	li	a0,0
    80205450:	ffffe097          	auipc	ra,0xffffe
    80205454:	26a080e7          	jalr	618(ra) # 802036ba <bread>
    return (cluster << 2) % fat.bpb.byts_per_sec;
    80205458:	01095783          	lhu	a5,16(s2)
    8020545c:	02f4f4bb          	remuw	s1,s1,a5
    uint32 next_clus = *(uint32 *)(b->data + fat_offset_of_clus(cluster));
    80205460:	1482                	slli	s1,s1,0x20
    80205462:	9081                	srli	s1,s1,0x20
    80205464:	009507b3          	add	a5,a0,s1
    80205468:	4fa4                	lw	s1,88(a5)
    brelse(b);
    8020546a:	ffffe097          	auipc	ra,0xffffe
    8020546e:	37c080e7          	jalr	892(ra) # 802037e6 <brelse>
    return next_clus;
    80205472:	bf55                	j	80205426 <read_fat+0x28>

0000000080205474 <alloc_clus>:
        brelse(b);
    }
}

static uint32 alloc_clus(uint8 dev)
{
    80205474:	711d                	addi	sp,sp,-96
    80205476:	ec86                	sd	ra,88(sp)
    80205478:	e8a2                	sd	s0,80(sp)
    8020547a:	e4a6                	sd	s1,72(sp)
    8020547c:	e0ca                	sd	s2,64(sp)
    8020547e:	fc4e                	sd	s3,56(sp)
    80205480:	f852                	sd	s4,48(sp)
    80205482:	f456                	sd	s5,40(sp)
    80205484:	f05a                	sd	s6,32(sp)
    80205486:	ec5e                	sd	s7,24(sp)
    80205488:	e862                	sd	s8,16(sp)
    8020548a:	e466                	sd	s9,8(sp)
    8020548c:	1080                	addi	s0,sp,96
    // should we keep a free cluster list? instead of searching fat every time.
    struct buf *b;
    uint32 sec = fat.bpb.rsvd_sec_cnt;
    8020548e:	00019797          	auipc	a5,0x19
    80205492:	f9a78793          	addi	a5,a5,-102 # 8021e428 <fat>
    80205496:	0147db83          	lhu	s7,20(a5)
    uint32 const ent_per_sec = fat.bpb.byts_per_sec / sizeof(uint32);
    8020549a:	0107d903          	lhu	s2,16(a5)
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    8020549e:	539c                	lw	a5,32(a5)
    802054a0:	10078363          	beqz	a5,802055a6 <alloc_clus+0x132>
    802054a4:	0029591b          	srliw	s2,s2,0x2
    802054a8:	0009099b          	sext.w	s3,s2
    802054ac:	4b01                	li	s6,0
        b = bread(dev, sec);
    802054ae:	00050a9b          	sext.w	s5,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    802054b2:	4c01                	li	s8,0
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    802054b4:	00019c97          	auipc	s9,0x19
    802054b8:	f74c8c93          	addi	s9,s9,-140 # 8021e428 <fat>
    802054bc:	a0c9                	j	8020557e <alloc_clus+0x10a>
            if (((uint32 *)(b->data))[j] == 0) {
                ((uint32 *)(b->data))[j] = FAT32_EOC + 7;
    802054be:	100007b7          	lui	a5,0x10000
    802054c2:	17fd                	addi	a5,a5,-1 # fffffff <_entry-0x70200001>
    802054c4:	c29c                	sw	a5,0(a3)
                bwrite(b);
    802054c6:	8552                	mv	a0,s4
    802054c8:	ffffe097          	auipc	ra,0xffffe
    802054cc:	2e2080e7          	jalr	738(ra) # 802037aa <bwrite>
                brelse(b);
    802054d0:	8552                	mv	a0,s4
    802054d2:	ffffe097          	auipc	ra,0xffffe
    802054d6:	314080e7          	jalr	788(ra) # 802037e6 <brelse>
                uint32 clus = i * ent_per_sec + j;
    802054da:	0369093b          	mulw	s2,s2,s6
    802054de:	0099093b          	addw	s2,s2,s1
    802054e2:	00090a9b          	sext.w	s5,s2
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    802054e6:	00019717          	auipc	a4,0x19
    802054ea:	f4270713          	addi	a4,a4,-190 # 8021e428 <fat>
    802054ee:	01274783          	lbu	a5,18(a4)
    802054f2:	ffe9099b          	addiw	s3,s2,-2
    802054f6:	02f989bb          	mulw	s3,s3,a5
    802054fa:	4318                	lw	a4,0(a4)
    802054fc:	00e989bb          	addw	s3,s3,a4
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205500:	c7b1                	beqz	a5,8020554c <alloc_clus+0xd8>
    80205502:	4901                	li	s2,0
    80205504:	00019a17          	auipc	s4,0x19
    80205508:	f24a0a13          	addi	s4,s4,-220 # 8021e428 <fat>
        b = bread(0, sec++);
    8020550c:	013905bb          	addw	a1,s2,s3
    80205510:	4501                	li	a0,0
    80205512:	ffffe097          	auipc	ra,0xffffe
    80205516:	1a8080e7          	jalr	424(ra) # 802036ba <bread>
    8020551a:	84aa                	mv	s1,a0
        memset(b->data, 0, BSIZE);
    8020551c:	20000613          	li	a2,512
    80205520:	4581                	li	a1,0
    80205522:	05850513          	addi	a0,a0,88
    80205526:	ffffb097          	auipc	ra,0xffffb
    8020552a:	26a080e7          	jalr	618(ra) # 80200790 <memset>
        bwrite(b);
    8020552e:	8526                	mv	a0,s1
    80205530:	ffffe097          	auipc	ra,0xffffe
    80205534:	27a080e7          	jalr	634(ra) # 802037aa <bwrite>
        brelse(b);
    80205538:	8526                	mv	a0,s1
    8020553a:	ffffe097          	auipc	ra,0xffffe
    8020553e:	2ac080e7          	jalr	684(ra) # 802037e6 <brelse>
    for (int i = 0; i < fat.bpb.sec_per_clus; i++) {
    80205542:	2905                	addiw	s2,s2,1
    80205544:	012a4783          	lbu	a5,18(s4)
    80205548:	fcf942e3          	blt	s2,a5,8020550c <alloc_clus+0x98>
            }
        }
        brelse(b);
    }
    panic("no clusters");
}
    8020554c:	8556                	mv	a0,s5
    8020554e:	60e6                	ld	ra,88(sp)
    80205550:	6446                	ld	s0,80(sp)
    80205552:	64a6                	ld	s1,72(sp)
    80205554:	6906                	ld	s2,64(sp)
    80205556:	79e2                	ld	s3,56(sp)
    80205558:	7a42                	ld	s4,48(sp)
    8020555a:	7aa2                	ld	s5,40(sp)
    8020555c:	7b02                	ld	s6,32(sp)
    8020555e:	6be2                	ld	s7,24(sp)
    80205560:	6c42                	ld	s8,16(sp)
    80205562:	6ca2                	ld	s9,8(sp)
    80205564:	6125                	addi	sp,sp,96
    80205566:	8082                	ret
        brelse(b);
    80205568:	8552                	mv	a0,s4
    8020556a:	ffffe097          	auipc	ra,0xffffe
    8020556e:	27c080e7          	jalr	636(ra) # 802037e6 <brelse>
    for (uint32 i = 0; i < fat.bpb.fat_sz; i++, sec++) {
    80205572:	2b05                	addiw	s6,s6,1
    80205574:	2b85                	addiw	s7,s7,1 # fffffffffffff001 <ebss_clear+0xffffffff7fdd9001>
    80205576:	020ca783          	lw	a5,32(s9)
    8020557a:	02fb7663          	bgeu	s6,a5,802055a6 <alloc_clus+0x132>
        b = bread(dev, sec);
    8020557e:	85de                	mv	a1,s7
    80205580:	8556                	mv	a0,s5
    80205582:	ffffe097          	auipc	ra,0xffffe
    80205586:	138080e7          	jalr	312(ra) # 802036ba <bread>
    8020558a:	8a2a                	mv	s4,a0
        for (uint32 j = 0; j < ent_per_sec; j++) {
    8020558c:	fc098ee3          	beqz	s3,80205568 <alloc_clus+0xf4>
    80205590:	05850793          	addi	a5,a0,88
    80205594:	84e2                	mv	s1,s8
            if (((uint32 *)(b->data))[j] == 0) {
    80205596:	86be                	mv	a3,a5
    80205598:	4398                	lw	a4,0(a5)
    8020559a:	d315                	beqz	a4,802054be <alloc_clus+0x4a>
        for (uint32 j = 0; j < ent_per_sec; j++) {
    8020559c:	2485                	addiw	s1,s1,1
    8020559e:	0791                	addi	a5,a5,4
    802055a0:	fe999be3          	bne	s3,s1,80205596 <alloc_clus+0x122>
    802055a4:	b7d1                	j	80205568 <alloc_clus+0xf4>
    panic("no clusters");
    802055a6:	00004517          	auipc	a0,0x4
    802055aa:	6c250513          	addi	a0,a0,1730 # 80209c68 <digits+0x8e8>
    802055ae:	ffffb097          	auipc	ra,0xffffb
    802055b2:	b96080e7          	jalr	-1130(ra) # 80200144 <panic>

00000000802055b6 <write_fat>:
    if (cluster > fat.data_clus_cnt + 1) {
    802055b6:	00019797          	auipc	a5,0x19
    802055ba:	e7a7a783          	lw	a5,-390(a5) # 8021e430 <fat+0x8>
    802055be:	2785                	addiw	a5,a5,1
    802055c0:	06a7e963          	bltu	a5,a0,80205632 <write_fat+0x7c>
{
    802055c4:	7179                	addi	sp,sp,-48
    802055c6:	f406                	sd	ra,40(sp)
    802055c8:	f022                	sd	s0,32(sp)
    802055ca:	ec26                	sd	s1,24(sp)
    802055cc:	e84a                	sd	s2,16(sp)
    802055ce:	e44e                	sd	s3,8(sp)
    802055d0:	e052                	sd	s4,0(sp)
    802055d2:	1800                	addi	s0,sp,48
    802055d4:	89ae                	mv	s3,a1
    return fat.bpb.rsvd_sec_cnt + (cluster << 2) / fat.bpb.byts_per_sec + fat.bpb.fat_sz * (fat_num - 1);
    802055d6:	0025149b          	slliw	s1,a0,0x2
    802055da:	00019a17          	auipc	s4,0x19
    802055de:	e4ea0a13          	addi	s4,s4,-434 # 8021e428 <fat>
    802055e2:	010a5783          	lhu	a5,16(s4)
    802055e6:	02f4d7bb          	divuw	a5,s1,a5
    802055ea:	014a5583          	lhu	a1,20(s4)
    struct buf *b = bread(0, fat_sec);
    802055ee:	9dbd                	addw	a1,a1,a5
    802055f0:	4501                	li	a0,0
    802055f2:	ffffe097          	auipc	ra,0xffffe
    802055f6:	0c8080e7          	jalr	200(ra) # 802036ba <bread>
    802055fa:	892a                	mv	s2,a0
    return (cluster << 2) % fat.bpb.byts_per_sec;
    802055fc:	010a5783          	lhu	a5,16(s4)
    80205600:	02f4f4bb          	remuw	s1,s1,a5
    *(uint32 *)(b->data + off) = content;
    80205604:	1482                	slli	s1,s1,0x20
    80205606:	9081                	srli	s1,s1,0x20
    80205608:	94aa                	add	s1,s1,a0
    8020560a:	0534ac23          	sw	s3,88(s1)
    bwrite(b);
    8020560e:	ffffe097          	auipc	ra,0xffffe
    80205612:	19c080e7          	jalr	412(ra) # 802037aa <bwrite>
    brelse(b);
    80205616:	854a                	mv	a0,s2
    80205618:	ffffe097          	auipc	ra,0xffffe
    8020561c:	1ce080e7          	jalr	462(ra) # 802037e6 <brelse>
    return 0;
    80205620:	4501                	li	a0,0
}
    80205622:	70a2                	ld	ra,40(sp)
    80205624:	7402                	ld	s0,32(sp)
    80205626:	64e2                	ld	s1,24(sp)
    80205628:	6942                	ld	s2,16(sp)
    8020562a:	69a2                	ld	s3,8(sp)
    8020562c:	6a02                	ld	s4,0(sp)
    8020562e:	6145                	addi	sp,sp,48
    80205630:	8082                	ret
        return -1;
    80205632:	557d                	li	a0,-1
}
    80205634:	8082                	ret

0000000080205636 <reloc_clus>:
 * @param   off         the offset from the beginning of the relative file
 * @param   alloc       whether alloc new cluster when meeting end of FAT chains
 * @return              the offset from the new cur_clus
 */
static int reloc_clus(struct dirent *entry, uint off, int alloc)
{
    80205636:	715d                	addi	sp,sp,-80
    80205638:	e486                	sd	ra,72(sp)
    8020563a:	e0a2                	sd	s0,64(sp)
    8020563c:	fc26                	sd	s1,56(sp)
    8020563e:	f84a                	sd	s2,48(sp)
    80205640:	f44e                	sd	s3,40(sp)
    80205642:	f052                	sd	s4,32(sp)
    80205644:	ec56                	sd	s5,24(sp)
    80205646:	e85a                	sd	s6,16(sp)
    80205648:	e45e                	sd	s7,8(sp)
    8020564a:	0880                	addi	s0,sp,80
    8020564c:	84aa                	mv	s1,a0
    8020564e:	8a2e                	mv	s4,a1
    int clus_num = off / fat.byts_per_clus;
    80205650:	00019b97          	auipc	s7,0x19
    80205654:	de4bab83          	lw	s7,-540(s7) # 8021e434 <fat+0xc>
    80205658:	0375d9bb          	divuw	s3,a1,s7
    while (clus_num > entry->clus_cnt) {
    8020565c:	11052703          	lw	a4,272(a0)
    80205660:	07377563          	bgeu	a4,s3,802056ca <reloc_clus+0x94>
    80205664:	8b32                	mv	s6,a2
        int clus = read_fat(entry->cur_clus);
        if (clus >= FAT32_EOC) {
    80205666:	10000ab7          	lui	s5,0x10000
    8020566a:	1add                	addi	s5,s5,-9 # ffffff7 <_entry-0x70200009>
    8020566c:	a81d                	j	802056a2 <reloc_clus+0x6c>
            if (alloc) {
                clus = alloc_clus(entry->dev);
    8020566e:	1144c503          	lbu	a0,276(s1)
    80205672:	00000097          	auipc	ra,0x0
    80205676:	e02080e7          	jalr	-510(ra) # 80205474 <alloc_clus>
    8020567a:	0005091b          	sext.w	s2,a0
                write_fat(entry->cur_clus, clus);
    8020567e:	85ca                	mv	a1,s2
    80205680:	10c4a503          	lw	a0,268(s1)
    80205684:	00000097          	auipc	ra,0x0
    80205688:	f32080e7          	jalr	-206(ra) # 802055b6 <write_fat>
                entry->cur_clus = entry->first_clus;
                entry->clus_cnt = 0;
                return -1;
            }
        }
        entry->cur_clus = clus;
    8020568c:	1124a623          	sw	s2,268(s1)
        entry->clus_cnt++;
    80205690:	1104a783          	lw	a5,272(s1)
    80205694:	2785                	addiw	a5,a5,1
    80205696:	0007871b          	sext.w	a4,a5
    8020569a:	10f4a823          	sw	a5,272(s1)
    while (clus_num > entry->clus_cnt) {
    8020569e:	03377663          	bgeu	a4,s3,802056ca <reloc_clus+0x94>
        int clus = read_fat(entry->cur_clus);
    802056a2:	10c4a503          	lw	a0,268(s1)
    802056a6:	00000097          	auipc	ra,0x0
    802056aa:	d58080e7          	jalr	-680(ra) # 802053fe <read_fat>
    802056ae:	0005091b          	sext.w	s2,a0
        if (clus >= FAT32_EOC) {
    802056b2:	fd2adde3          	bge	s5,s2,8020568c <reloc_clus+0x56>
            if (alloc) {
    802056b6:	fa0b1ce3          	bnez	s6,8020566e <reloc_clus+0x38>
                entry->cur_clus = entry->first_clus;
    802056ba:	1044a783          	lw	a5,260(s1)
    802056be:	10f4a623          	sw	a5,268(s1)
                entry->clus_cnt = 0;
    802056c2:	1004a823          	sw	zero,272(s1)
                return -1;
    802056c6:	557d                	li	a0,-1
    802056c8:	a881                	j	80205718 <reloc_clus+0xe2>
    }
    if (clus_num < entry->clus_cnt) {
    802056ca:	04e9f163          	bgeu	s3,a4,8020570c <reloc_clus+0xd6>
        entry->cur_clus = entry->first_clus;
    802056ce:	1044a783          	lw	a5,260(s1)
    802056d2:	10f4a623          	sw	a5,268(s1)
        entry->clus_cnt = 0;
    802056d6:	1004a823          	sw	zero,272(s1)
        while (entry->clus_cnt < clus_num) {
    802056da:	037a6963          	bltu	s4,s7,8020570c <reloc_clus+0xd6>
            entry->cur_clus = read_fat(entry->cur_clus);
            if (entry->cur_clus >= FAT32_EOC) {
    802056de:	10000937          	lui	s2,0x10000
    802056e2:	195d                	addi	s2,s2,-9 # ffffff7 <_entry-0x70200009>
            entry->cur_clus = read_fat(entry->cur_clus);
    802056e4:	10c4a503          	lw	a0,268(s1)
    802056e8:	00000097          	auipc	ra,0x0
    802056ec:	d16080e7          	jalr	-746(ra) # 802053fe <read_fat>
    802056f0:	2501                	sext.w	a0,a0
    802056f2:	10a4a623          	sw	a0,268(s1)
            if (entry->cur_clus >= FAT32_EOC) {
    802056f6:	02a96c63          	bltu	s2,a0,8020572e <reloc_clus+0xf8>
                panic("reloc_clus");
            }
            entry->clus_cnt++;
    802056fa:	1104a783          	lw	a5,272(s1)
    802056fe:	2785                	addiw	a5,a5,1
    80205700:	0007871b          	sext.w	a4,a5
    80205704:	10f4a823          	sw	a5,272(s1)
        while (entry->clus_cnt < clus_num) {
    80205708:	fd376ee3          	bltu	a4,s3,802056e4 <reloc_clus+0xae>
        }
    }
    return off % fat.byts_per_clus;
    8020570c:	00019797          	auipc	a5,0x19
    80205710:	d287a783          	lw	a5,-728(a5) # 8021e434 <fat+0xc>
    80205714:	02fa753b          	remuw	a0,s4,a5
}
    80205718:	60a6                	ld	ra,72(sp)
    8020571a:	6406                	ld	s0,64(sp)
    8020571c:	74e2                	ld	s1,56(sp)
    8020571e:	7942                	ld	s2,48(sp)
    80205720:	79a2                	ld	s3,40(sp)
    80205722:	7a02                	ld	s4,32(sp)
    80205724:	6ae2                	ld	s5,24(sp)
    80205726:	6b42                	ld	s6,16(sp)
    80205728:	6ba2                	ld	s7,8(sp)
    8020572a:	6161                	addi	sp,sp,80
    8020572c:	8082                	ret
                panic("reloc_clus");
    8020572e:	00004517          	auipc	a0,0x4
    80205732:	54a50513          	addi	a0,a0,1354 # 80209c78 <digits+0x8f8>
    80205736:	ffffb097          	auipc	ra,0xffffb
    8020573a:	a0e080e7          	jalr	-1522(ra) # 80200144 <panic>

000000008020573e <rw_clus>:
{
    8020573e:	7119                	addi	sp,sp,-128
    80205740:	fc86                	sd	ra,120(sp)
    80205742:	f8a2                	sd	s0,112(sp)
    80205744:	f4a6                	sd	s1,104(sp)
    80205746:	f0ca                	sd	s2,96(sp)
    80205748:	ecce                	sd	s3,88(sp)
    8020574a:	e8d2                	sd	s4,80(sp)
    8020574c:	e4d6                	sd	s5,72(sp)
    8020574e:	e0da                	sd	s6,64(sp)
    80205750:	fc5e                	sd	s7,56(sp)
    80205752:	f862                	sd	s8,48(sp)
    80205754:	f466                	sd	s9,40(sp)
    80205756:	f06a                	sd	s10,32(sp)
    80205758:	ec6e                	sd	s11,24(sp)
    8020575a:	0100                	addi	s0,sp,128
    8020575c:	f8c43423          	sd	a2,-120(s0)
    80205760:	8b36                	mv	s6,a3
    80205762:	8c3e                	mv	s8,a5
    if (off + n > fat.byts_per_clus)
    80205764:	00f706bb          	addw	a3,a4,a5
    80205768:	00019797          	auipc	a5,0x19
    8020576c:	ccc7a783          	lw	a5,-820(a5) # 8021e434 <fat+0xc>
    80205770:	02d7ef63          	bltu	a5,a3,802057ae <rw_clus+0x70>
    80205774:	8cae                	mv	s9,a1
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205776:	00019797          	auipc	a5,0x19
    8020577a:	cb278793          	addi	a5,a5,-846 # 8021e428 <fat>
    8020577e:	0107d683          	lhu	a3,16(a5)
    return ((cluster - 2) * fat.bpb.sec_per_clus) + fat.first_data_sec;
    80205782:	ffe5099b          	addiw	s3,a0,-2
    80205786:	0127c603          	lbu	a2,18(a5)
    8020578a:	02c989bb          	mulw	s3,s3,a2
    8020578e:	439c                	lw	a5,0(a5)
    80205790:	00f989bb          	addw	s3,s3,a5
    uint sec = first_sec_of_clus(cluster) + off / fat.bpb.byts_per_sec;
    80205794:	02d757bb          	divuw	a5,a4,a3
    80205798:	00f989bb          	addw	s3,s3,a5
    off = off % fat.bpb.byts_per_sec;
    8020579c:	02d77abb          	remuw	s5,a4,a3
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802057a0:	0e0c0363          	beqz	s8,80205886 <rw_clus+0x148>
    802057a4:	4a01                	li	s4,0
        m = BSIZE - off % BSIZE;
    802057a6:	20000d93          	li	s11,512
        if (bad == -1) {
    802057aa:	5d7d                	li	s10,-1
    802057ac:	a095                	j	80205810 <rw_clus+0xd2>
        panic("offset out of range");
    802057ae:	00004517          	auipc	a0,0x4
    802057b2:	4da50513          	addi	a0,a0,1242 # 80209c88 <digits+0x908>
    802057b6:	ffffb097          	auipc	ra,0xffffb
    802057ba:	98e080e7          	jalr	-1650(ra) # 80200144 <panic>
                bwrite(bp);
    802057be:	854a                	mv	a0,s2
    802057c0:	ffffe097          	auipc	ra,0xffffe
    802057c4:	fea080e7          	jalr	-22(ra) # 802037aa <bwrite>
        brelse(bp);
    802057c8:	854a                	mv	a0,s2
    802057ca:	ffffe097          	auipc	ra,0xffffe
    802057ce:	01c080e7          	jalr	28(ra) # 802037e6 <brelse>
        if (bad == -1) {
    802057d2:	a02d                	j	802057fc <rw_clus+0xbe>
            bad = either_copyout(user, data, bp->data + (off % BSIZE), m);
    802057d4:	05890613          	addi	a2,s2,88
    802057d8:	1682                	slli	a3,a3,0x20
    802057da:	9281                	srli	a3,a3,0x20
    802057dc:	963a                	add	a2,a2,a4
    802057de:	85da                	mv	a1,s6
    802057e0:	f8843503          	ld	a0,-120(s0)
    802057e4:	ffffd097          	auipc	ra,0xffffd
    802057e8:	dda080e7          	jalr	-550(ra) # 802025be <either_copyout>
    802057ec:	8baa                	mv	s7,a0
        brelse(bp);
    802057ee:	854a                	mv	a0,s2
    802057f0:	ffffe097          	auipc	ra,0xffffe
    802057f4:	ff6080e7          	jalr	-10(ra) # 802037e6 <brelse>
        if (bad == -1) {
    802057f8:	07ab8763          	beq	s7,s10,80205866 <rw_clus+0x128>
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    802057fc:	01448a3b          	addw	s4,s1,s4
    80205800:	01548abb          	addw	s5,s1,s5
    80205804:	1482                	slli	s1,s1,0x20
    80205806:	9081                	srli	s1,s1,0x20
    80205808:	9b26                	add	s6,s6,s1
    8020580a:	2985                	addiw	s3,s3,1
    8020580c:	058a7d63          	bgeu	s4,s8,80205866 <rw_clus+0x128>
        bp = bread(0, sec);
    80205810:	85ce                	mv	a1,s3
    80205812:	4501                	li	a0,0
    80205814:	ffffe097          	auipc	ra,0xffffe
    80205818:	ea6080e7          	jalr	-346(ra) # 802036ba <bread>
    8020581c:	892a                	mv	s2,a0
        m = BSIZE - off % BSIZE;
    8020581e:	1ffaf713          	andi	a4,s5,511
        if (n - tot < m) {
    80205822:	414c07bb          	subw	a5,s8,s4
        m = BSIZE - off % BSIZE;
    80205826:	40ed863b          	subw	a2,s11,a4
    8020582a:	86be                	mv	a3,a5
    8020582c:	2781                	sext.w	a5,a5
    8020582e:	0006059b          	sext.w	a1,a2
    80205832:	00f5f363          	bgeu	a1,a5,80205838 <rw_clus+0xfa>
    80205836:	86b2                	mv	a3,a2
    80205838:	0006849b          	sext.w	s1,a3
        if (write) {
    8020583c:	f80c8ce3          	beqz	s9,802057d4 <rw_clus+0x96>
            if ((bad = either_copyin(bp->data + (off % BSIZE), user, data, m)) != -1) {
    80205840:	05890513          	addi	a0,s2,88
    80205844:	1682                	slli	a3,a3,0x20
    80205846:	9281                	srli	a3,a3,0x20
    80205848:	865a                	mv	a2,s6
    8020584a:	f8843583          	ld	a1,-120(s0)
    8020584e:	953a                	add	a0,a0,a4
    80205850:	ffffd097          	auipc	ra,0xffffd
    80205854:	da4080e7          	jalr	-604(ra) # 802025f4 <either_copyin>
    80205858:	f7a513e3          	bne	a0,s10,802057be <rw_clus+0x80>
        brelse(bp);
    8020585c:	854a                	mv	a0,s2
    8020585e:	ffffe097          	auipc	ra,0xffffe
    80205862:	f88080e7          	jalr	-120(ra) # 802037e6 <brelse>
}
    80205866:	8552                	mv	a0,s4
    80205868:	70e6                	ld	ra,120(sp)
    8020586a:	7446                	ld	s0,112(sp)
    8020586c:	74a6                	ld	s1,104(sp)
    8020586e:	7906                	ld	s2,96(sp)
    80205870:	69e6                	ld	s3,88(sp)
    80205872:	6a46                	ld	s4,80(sp)
    80205874:	6aa6                	ld	s5,72(sp)
    80205876:	6b06                	ld	s6,64(sp)
    80205878:	7be2                	ld	s7,56(sp)
    8020587a:	7c42                	ld	s8,48(sp)
    8020587c:	7ca2                	ld	s9,40(sp)
    8020587e:	7d02                	ld	s10,32(sp)
    80205880:	6de2                	ld	s11,24(sp)
    80205882:	6109                	addi	sp,sp,128
    80205884:	8082                	ret
    for (tot = 0; tot < n; tot += m, off += m, data += m, sec++) {
    80205886:	8a62                	mv	s4,s8
    80205888:	bff9                	j	80205866 <rw_clus+0x128>

000000008020588a <eget>:
// by their whole path. But when parsing a path, we open all the directories through it, 
// which forms a linked list from the final file to the root. Thus, we use the "parent" pointer 
// to recognize whether an entry with the "name" as given is really the file we want in the right path.
// Should never get root by eget, it's easy to understand.
static struct dirent *eget(struct dirent *parent, char *name)
{
    8020588a:	7139                	addi	sp,sp,-64
    8020588c:	fc06                	sd	ra,56(sp)
    8020588e:	f822                	sd	s0,48(sp)
    80205890:	f426                	sd	s1,40(sp)
    80205892:	f04a                	sd	s2,32(sp)
    80205894:	ec4e                	sd	s3,24(sp)
    80205896:	e852                	sd	s4,16(sp)
    80205898:	e456                	sd	s5,8(sp)
    8020589a:	0080                	addi	s0,sp,64
    8020589c:	8a2a                	mv	s4,a0
    8020589e:	8aae                	mv	s5,a1
    struct dirent *ep;
    acquire(&ecache.lock);
    802058a0:	00019517          	auipc	a0,0x19
    802058a4:	d1850513          	addi	a0,a0,-744 # 8021e5b8 <ecache>
    802058a8:	ffffb097          	auipc	ra,0xffffb
    802058ac:	e4c080e7          	jalr	-436(ra) # 802006f4 <acquire>
    if (name) {
    802058b0:	060a8b63          	beqz	s5,80205926 <eget+0x9c>
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802058b4:	00019497          	auipc	s1,0x19
    802058b8:	cc44b483          	ld	s1,-828(s1) # 8021e578 <root+0x128>
    802058bc:	00019797          	auipc	a5,0x19
    802058c0:	b9478793          	addi	a5,a5,-1132 # 8021e450 <root>
    802058c4:	06f48163          	beq	s1,a5,80205926 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    802058c8:	4905                	li	s2,1
        for (ep = root.next; ep != &root; ep = ep->next) {          // LRU algo
    802058ca:	89be                	mv	s3,a5
    802058cc:	a029                	j	802058d6 <eget+0x4c>
    802058ce:	1284b483          	ld	s1,296(s1)
    802058d2:	05348a63          	beq	s1,s3,80205926 <eget+0x9c>
            if (ep->valid == 1 && ep->parent == parent
    802058d6:	11649783          	lh	a5,278(s1)
    802058da:	ff279ae3          	bne	a5,s2,802058ce <eget+0x44>
    802058de:	1204b783          	ld	a5,288(s1)
    802058e2:	ff4796e3          	bne	a5,s4,802058ce <eget+0x44>
                && strncmp(ep->filename, name, FAT32_MAX_FILENAME) == 0) {
    802058e6:	0ff00613          	li	a2,255
    802058ea:	85d6                	mv	a1,s5
    802058ec:	8526                	mv	a0,s1
    802058ee:	ffffb097          	auipc	ra,0xffffb
    802058f2:	f7a080e7          	jalr	-134(ra) # 80200868 <strncmp>
    802058f6:	fd61                	bnez	a0,802058ce <eget+0x44>
                if (ep->ref++ == 0) {
    802058f8:	1184a783          	lw	a5,280(s1)
    802058fc:	0017871b          	addiw	a4,a5,1
    80205900:	10e4ac23          	sw	a4,280(s1)
    80205904:	eb81                	bnez	a5,80205914 <eget+0x8a>
                    ep->parent->ref++;
    80205906:	1204b703          	ld	a4,288(s1)
    8020590a:	11872783          	lw	a5,280(a4)
    8020590e:	2785                	addiw	a5,a5,1
    80205910:	10f72c23          	sw	a5,280(a4)
                }
                release(&ecache.lock);
    80205914:	00019517          	auipc	a0,0x19
    80205918:	ca450513          	addi	a0,a0,-860 # 8021e5b8 <ecache>
    8020591c:	ffffb097          	auipc	ra,0xffffb
    80205920:	e2c080e7          	jalr	-468(ra) # 80200748 <release>
                // edup(ep->parent);
                return ep;
    80205924:	a085                	j	80205984 <eget+0xfa>
            }
        }
    }
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205926:	00019497          	auipc	s1,0x19
    8020592a:	c5a4b483          	ld	s1,-934(s1) # 8021e580 <root+0x130>
    8020592e:	00019797          	auipc	a5,0x19
    80205932:	b2278793          	addi	a5,a5,-1246 # 8021e450 <root>
    80205936:	00f48a63          	beq	s1,a5,8020594a <eget+0xc0>
    8020593a:	873e                	mv	a4,a5
        if (ep->ref == 0) {
    8020593c:	1184a783          	lw	a5,280(s1)
    80205940:	cf89                	beqz	a5,8020595a <eget+0xd0>
    for (ep = root.prev; ep != &root; ep = ep->prev) {              // LRU algo
    80205942:	1304b483          	ld	s1,304(s1)
    80205946:	fee49be3          	bne	s1,a4,8020593c <eget+0xb2>
            ep->dirty = 0;
            release(&ecache.lock);
            return ep;
        }
    }
    panic("eget: insufficient ecache");
    8020594a:	00004517          	auipc	a0,0x4
    8020594e:	35650513          	addi	a0,a0,854 # 80209ca0 <digits+0x920>
    80205952:	ffffa097          	auipc	ra,0xffffa
    80205956:	7f2080e7          	jalr	2034(ra) # 80200144 <panic>
            ep->ref = 1;
    8020595a:	4785                	li	a5,1
    8020595c:	10f4ac23          	sw	a5,280(s1)
            ep->dev = parent->dev;
    80205960:	114a4783          	lbu	a5,276(s4)
    80205964:	10f48a23          	sb	a5,276(s1)
            ep->off = 0;
    80205968:	1004ae23          	sw	zero,284(s1)
            ep->valid = 0;
    8020596c:	10049b23          	sh	zero,278(s1)
            ep->dirty = 0;
    80205970:	10048aa3          	sb	zero,277(s1)
            release(&ecache.lock);
    80205974:	00019517          	auipc	a0,0x19
    80205978:	c4450513          	addi	a0,a0,-956 # 8021e5b8 <ecache>
    8020597c:	ffffb097          	auipc	ra,0xffffb
    80205980:	dcc080e7          	jalr	-564(ra) # 80200748 <release>
    return 0;
}
    80205984:	8526                	mv	a0,s1
    80205986:	70e2                	ld	ra,56(sp)
    80205988:	7442                	ld	s0,48(sp)
    8020598a:	74a2                	ld	s1,40(sp)
    8020598c:	7902                	ld	s2,32(sp)
    8020598e:	69e2                	ld	s3,24(sp)
    80205990:	6a42                	ld	s4,16(sp)
    80205992:	6aa2                	ld	s5,8(sp)
    80205994:	6121                	addi	sp,sp,64
    80205996:	8082                	ret

0000000080205998 <read_entry_name>:
 * @param   buffer      pointer to the array that stores the name
 * @param   raw_entry   pointer to the entry in a sector buffer
 * @param   islong      if non-zero, read as l-n-e, otherwise s-n-e.
 */
static void read_entry_name(char *buffer, union dentry *d)
{
    80205998:	7139                	addi	sp,sp,-64
    8020599a:	fc06                	sd	ra,56(sp)
    8020599c:	f822                	sd	s0,48(sp)
    8020599e:	f426                	sd	s1,40(sp)
    802059a0:	f04a                	sd	s2,32(sp)
    802059a2:	ec4e                	sd	s3,24(sp)
    802059a4:	0080                	addi	s0,sp,64
    802059a6:	84aa                	mv	s1,a0
    802059a8:	892e                	mv	s2,a1
    if (d->lne.attr == ATTR_LONG_NAME) {                       // long entry branch
    802059aa:	00b5c703          	lbu	a4,11(a1)
    802059ae:	47bd                	li	a5,15
    802059b0:	08f70563          	beq	a4,a5,80205a3a <read_entry_name+0xa2>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
        buffer += NELEM(d->lne.name2);
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    } else {
        // assert: only "." and ".." will enter this branch
        memset(buffer, 0, CHAR_SHORT_NAME + 2); // plus '.' and '\0'
    802059b4:	4635                	li	a2,13
    802059b6:	4581                	li	a1,0
    802059b8:	ffffb097          	auipc	ra,0xffffb
    802059bc:	dd8080e7          	jalr	-552(ra) # 80200790 <memset>
        int i;
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802059c0:	00094703          	lbu	a4,0(s2)
    802059c4:	02000793          	li	a5,32
    802059c8:	0af70c63          	beq	a4,a5,80205a80 <read_entry_name+0xe8>
    802059cc:	4785                	li	a5,1
    802059ce:	02000613          	li	a2,32
    802059d2:	45a5                	li	a1,9
            buffer[i] = d->sne.name[i];
    802059d4:	00f486b3          	add	a3,s1,a5
    802059d8:	fee68fa3          	sb	a4,-1(a3) # 1fff <_entry-0x801fe001>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    802059dc:	0007869b          	sext.w	a3,a5
    802059e0:	00f90733          	add	a4,s2,a5
    802059e4:	00074703          	lbu	a4,0(a4)
    802059e8:	00c70563          	beq	a4,a2,802059f2 <read_entry_name+0x5a>
    802059ec:	0785                	addi	a5,a5,1
    802059ee:	feb793e3          	bne	a5,a1,802059d4 <read_entry_name+0x3c>
        }
        if (d->sne.name[8] != ' ') {
    802059f2:	00894703          	lbu	a4,8(s2)
    802059f6:	02000793          	li	a5,32
    802059fa:	00f70963          	beq	a4,a5,80205a0c <read_entry_name+0x74>
            buffer[i++] = '.';
    802059fe:	00d487b3          	add	a5,s1,a3
    80205a02:	02e00713          	li	a4,46
    80205a06:	00e78023          	sb	a4,0(a5)
    80205a0a:	2685                	addiw	a3,a3,1
        }
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205a0c:	00890793          	addi	a5,s2,8
    80205a10:	94b6                	add	s1,s1,a3
    80205a12:	092d                	addi	s2,s2,11
            if (d->sne.name[j] == ' ') { break; }
    80205a14:	02000693          	li	a3,32
    80205a18:	0007c703          	lbu	a4,0(a5)
    80205a1c:	00d70863          	beq	a4,a3,80205a2c <read_entry_name+0x94>
            buffer[i] = d->sne.name[j];
    80205a20:	00e48023          	sb	a4,0(s1)
        for (int j = 8; j < CHAR_SHORT_NAME; j++, i++) {
    80205a24:	0785                	addi	a5,a5,1
    80205a26:	0485                	addi	s1,s1,1
    80205a28:	ff2798e3          	bne	a5,s2,80205a18 <read_entry_name+0x80>
        }
    }
}
    80205a2c:	70e2                	ld	ra,56(sp)
    80205a2e:	7442                	ld	s0,48(sp)
    80205a30:	74a2                	ld	s1,40(sp)
    80205a32:	7902                	ld	s2,32(sp)
    80205a34:	69e2                	ld	s3,24(sp)
    80205a36:	6121                	addi	sp,sp,64
    80205a38:	8082                	ret
        memmove(temp, d->lne.name1, sizeof(temp));
    80205a3a:	4629                	li	a2,10
    80205a3c:	0585                	addi	a1,a1,1
    80205a3e:	fc040993          	addi	s3,s0,-64
    80205a42:	854e                	mv	a0,s3
    80205a44:	ffffb097          	auipc	ra,0xffffb
    80205a48:	da8080e7          	jalr	-600(ra) # 802007ec <memmove>
        snstr(buffer, temp, NELEM(d->lne.name1));
    80205a4c:	4615                	li	a2,5
    80205a4e:	85ce                	mv	a1,s3
    80205a50:	8526                	mv	a0,s1
    80205a52:	ffffb097          	auipc	ra,0xffffb
    80205a56:	f1e080e7          	jalr	-226(ra) # 80200970 <snstr>
        snstr(buffer, d->lne.name2, NELEM(d->lne.name2));
    80205a5a:	4619                	li	a2,6
    80205a5c:	00e90593          	addi	a1,s2,14
    80205a60:	00548513          	addi	a0,s1,5
    80205a64:	ffffb097          	auipc	ra,0xffffb
    80205a68:	f0c080e7          	jalr	-244(ra) # 80200970 <snstr>
        snstr(buffer, d->lne.name3, NELEM(d->lne.name3));
    80205a6c:	4609                	li	a2,2
    80205a6e:	01c90593          	addi	a1,s2,28
    80205a72:	00b48513          	addi	a0,s1,11
    80205a76:	ffffb097          	auipc	ra,0xffffb
    80205a7a:	efa080e7          	jalr	-262(ra) # 80200970 <snstr>
    80205a7e:	b77d                	j	80205a2c <read_entry_name+0x94>
        for (i = 0; d->sne.name[i] != ' ' && i < 8; i++) {
    80205a80:	4681                	li	a3,0
    80205a82:	bf85                	j	802059f2 <read_entry_name+0x5a>

0000000080205a84 <fat32_init>:
{
    80205a84:	7139                	addi	sp,sp,-64
    80205a86:	fc06                	sd	ra,56(sp)
    80205a88:	f822                	sd	s0,48(sp)
    80205a8a:	f426                	sd	s1,40(sp)
    80205a8c:	f04a                	sd	s2,32(sp)
    80205a8e:	ec4e                	sd	s3,24(sp)
    80205a90:	e852                	sd	s4,16(sp)
    80205a92:	e456                	sd	s5,8(sp)
    80205a94:	0080                	addi	s0,sp,64
    printf("[fat32_init] enter!\n");
    80205a96:	00004517          	auipc	a0,0x4
    80205a9a:	22a50513          	addi	a0,a0,554 # 80209cc0 <digits+0x940>
    80205a9e:	ffffa097          	auipc	ra,0xffffa
    80205aa2:	6f0080e7          	jalr	1776(ra) # 8020018e <printf>
    struct buf *b = bread(0, 0);
    80205aa6:	4581                	li	a1,0
    80205aa8:	4501                	li	a0,0
    80205aaa:	ffffe097          	auipc	ra,0xffffe
    80205aae:	c10080e7          	jalr	-1008(ra) # 802036ba <bread>
    80205ab2:	892a                	mv	s2,a0
    if (strncmp((char const*)(b->data + 82), "FAT32", 5))
    80205ab4:	4615                	li	a2,5
    80205ab6:	00004597          	auipc	a1,0x4
    80205aba:	22258593          	addi	a1,a1,546 # 80209cd8 <digits+0x958>
    80205abe:	0aa50513          	addi	a0,a0,170
    80205ac2:	ffffb097          	auipc	ra,0xffffb
    80205ac6:	da6080e7          	jalr	-602(ra) # 80200868 <strncmp>
    80205aca:	1e051163          	bnez	a0,80205cac <fat32_init+0x228>
    memmove(&fat.bpb.byts_per_sec, b->data + 11, 2);            // avoid misaligned load on k210
    80205ace:	00019497          	auipc	s1,0x19
    80205ad2:	95a48493          	addi	s1,s1,-1702 # 8021e428 <fat>
    80205ad6:	4609                	li	a2,2
    80205ad8:	06390593          	addi	a1,s2,99
    80205adc:	00019517          	auipc	a0,0x19
    80205ae0:	95c50513          	addi	a0,a0,-1700 # 8021e438 <fat+0x10>
    80205ae4:	ffffb097          	auipc	ra,0xffffb
    80205ae8:	d08080e7          	jalr	-760(ra) # 802007ec <memmove>
    fat.bpb.sec_per_clus = *(b->data + 13);
    80205aec:	06594683          	lbu	a3,101(s2)
    80205af0:	00d48923          	sb	a3,18(s1)
    fat.bpb.rsvd_sec_cnt = *(uint16 *)(b->data + 14);
    80205af4:	06695603          	lhu	a2,102(s2)
    80205af8:	00c49a23          	sh	a2,20(s1)
    fat.bpb.fat_cnt = *(b->data + 16);
    80205afc:	06894703          	lbu	a4,104(s2)
    80205b00:	00e48b23          	sb	a4,22(s1)
    fat.bpb.hidd_sec = *(uint32 *)(b->data + 28);
    80205b04:	07492783          	lw	a5,116(s2)
    80205b08:	cc9c                	sw	a5,24(s1)
    fat.bpb.tot_sec = *(uint32 *)(b->data + 32);
    80205b0a:	07892783          	lw	a5,120(s2)
    80205b0e:	ccdc                	sw	a5,28(s1)
    fat.bpb.fat_sz = *(uint32 *)(b->data + 36);
    80205b10:	07c92583          	lw	a1,124(s2)
    80205b14:	d08c                	sw	a1,32(s1)
    fat.bpb.root_clus = *(uint32 *)(b->data + 44);
    80205b16:	08492503          	lw	a0,132(s2)
    80205b1a:	d0c8                	sw	a0,36(s1)
    fat.first_data_sec = fat.bpb.rsvd_sec_cnt + fat.bpb.fat_cnt * fat.bpb.fat_sz;
    80205b1c:	02b7073b          	mulw	a4,a4,a1
    80205b20:	9f31                	addw	a4,a4,a2
    80205b22:	c098                	sw	a4,0(s1)
    fat.data_sec_cnt = fat.bpb.tot_sec - fat.first_data_sec;
    80205b24:	9f99                	subw	a5,a5,a4
    80205b26:	c0dc                	sw	a5,4(s1)
    fat.data_clus_cnt = fat.data_sec_cnt / fat.bpb.sec_per_clus;
    80205b28:	02d7d7bb          	divuw	a5,a5,a3
    80205b2c:	c49c                	sw	a5,8(s1)
    fat.byts_per_clus = fat.bpb.sec_per_clus * fat.bpb.byts_per_sec;
    80205b2e:	0104d783          	lhu	a5,16(s1)
    80205b32:	02d787bb          	mulw	a5,a5,a3
    80205b36:	c4dc                	sw	a5,12(s1)
    brelse(b);
    80205b38:	854a                	mv	a0,s2
    80205b3a:	ffffe097          	auipc	ra,0xffffe
    80205b3e:	cac080e7          	jalr	-852(ra) # 802037e6 <brelse>
    printf("[FAT32 init]byts_per_sec: %d\n", fat.bpb.byts_per_sec);
    80205b42:	0104d583          	lhu	a1,16(s1)
    80205b46:	00004517          	auipc	a0,0x4
    80205b4a:	1b250513          	addi	a0,a0,434 # 80209cf8 <digits+0x978>
    80205b4e:	ffffa097          	auipc	ra,0xffffa
    80205b52:	640080e7          	jalr	1600(ra) # 8020018e <printf>
    printf("[FAT32 init]root_clus: %d\n", fat.bpb.root_clus);
    80205b56:	50cc                	lw	a1,36(s1)
    80205b58:	00004517          	auipc	a0,0x4
    80205b5c:	1c050513          	addi	a0,a0,448 # 80209d18 <digits+0x998>
    80205b60:	ffffa097          	auipc	ra,0xffffa
    80205b64:	62e080e7          	jalr	1582(ra) # 8020018e <printf>
    printf("[FAT32 init]sec_per_clus: %d\n", fat.bpb.sec_per_clus);
    80205b68:	0124c583          	lbu	a1,18(s1)
    80205b6c:	00004517          	auipc	a0,0x4
    80205b70:	1cc50513          	addi	a0,a0,460 # 80209d38 <digits+0x9b8>
    80205b74:	ffffa097          	auipc	ra,0xffffa
    80205b78:	61a080e7          	jalr	1562(ra) # 8020018e <printf>
    printf("[FAT32 init]fat_cnt: %d\n", fat.bpb.fat_cnt);
    80205b7c:	0164c583          	lbu	a1,22(s1)
    80205b80:	00004517          	auipc	a0,0x4
    80205b84:	1d850513          	addi	a0,a0,472 # 80209d58 <digits+0x9d8>
    80205b88:	ffffa097          	auipc	ra,0xffffa
    80205b8c:	606080e7          	jalr	1542(ra) # 8020018e <printf>
    printf("[FAT32 init]fat_sz: %d\n", fat.bpb.fat_sz);
    80205b90:	508c                	lw	a1,32(s1)
    80205b92:	00004517          	auipc	a0,0x4
    80205b96:	1e650513          	addi	a0,a0,486 # 80209d78 <digits+0x9f8>
    80205b9a:	ffffa097          	auipc	ra,0xffffa
    80205b9e:	5f4080e7          	jalr	1524(ra) # 8020018e <printf>
    printf("[FAT32 init]first_data_sec: %d\n", fat.first_data_sec);
    80205ba2:	408c                	lw	a1,0(s1)
    80205ba4:	00004517          	auipc	a0,0x4
    80205ba8:	1ec50513          	addi	a0,a0,492 # 80209d90 <digits+0xa10>
    80205bac:	ffffa097          	auipc	ra,0xffffa
    80205bb0:	5e2080e7          	jalr	1506(ra) # 8020018e <printf>
    if (BSIZE != fat.bpb.byts_per_sec) 
    80205bb4:	0104d703          	lhu	a4,16(s1)
    80205bb8:	20000793          	li	a5,512
    80205bbc:	10f71063          	bne	a4,a5,80205cbc <fat32_init+0x238>
    initlock(&ecache.lock, "ecache");
    80205bc0:	00004597          	auipc	a1,0x4
    80205bc4:	20858593          	addi	a1,a1,520 # 80209dc8 <digits+0xa48>
    80205bc8:	00019517          	auipc	a0,0x19
    80205bcc:	9f050513          	addi	a0,a0,-1552 # 8021e5b8 <ecache>
    80205bd0:	ffffb097          	auipc	ra,0xffffb
    80205bd4:	ae0080e7          	jalr	-1312(ra) # 802006b0 <initlock>
    memset(&root, 0, sizeof(root));
    80205bd8:	00019497          	auipc	s1,0x19
    80205bdc:	85048493          	addi	s1,s1,-1968 # 8021e428 <fat>
    80205be0:	00019917          	auipc	s2,0x19
    80205be4:	87090913          	addi	s2,s2,-1936 # 8021e450 <root>
    80205be8:	16800613          	li	a2,360
    80205bec:	4581                	li	a1,0
    80205bee:	854a                	mv	a0,s2
    80205bf0:	ffffb097          	auipc	ra,0xffffb
    80205bf4:	ba0080e7          	jalr	-1120(ra) # 80200790 <memset>
    initsleeplock(&root.lock, "entry");
    80205bf8:	00004597          	auipc	a1,0x4
    80205bfc:	1d858593          	addi	a1,a1,472 # 80209dd0 <digits+0xa50>
    80205c00:	00019517          	auipc	a0,0x19
    80205c04:	98850513          	addi	a0,a0,-1656 # 8021e588 <root+0x138>
    80205c08:	ffffe097          	auipc	ra,0xffffe
    80205c0c:	cf4080e7          	jalr	-780(ra) # 802038fc <initsleeplock>
    root.attribute = (ATTR_DIRECTORY | ATTR_SYSTEM);
    80205c10:	47d1                	li	a5,20
    80205c12:	12f48423          	sb	a5,296(s1)
    root.first_clus = root.cur_clus = fat.bpb.root_clus;
    80205c16:	50dc                	lw	a5,36(s1)
    80205c18:	12f4aa23          	sw	a5,308(s1)
    80205c1c:	12f4a623          	sw	a5,300(s1)
    root.valid = 1;
    80205c20:	4785                	li	a5,1
    80205c22:	12f49f23          	sh	a5,318(s1)
    root.prev = &root;
    80205c26:	1524bc23          	sd	s2,344(s1)
    root.next = &root;
    80205c2a:	1524b823          	sd	s2,336(s1)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80205c2e:	00019497          	auipc	s1,0x19
    80205c32:	9a248493          	addi	s1,s1,-1630 # 8021e5d0 <ecache+0x18>
        de->next = root.next;
    80205c36:	00018917          	auipc	s2,0x18
    80205c3a:	7f290913          	addi	s2,s2,2034 # 8021e428 <fat>
        de->prev = &root;
    80205c3e:	00019a97          	auipc	s5,0x19
    80205c42:	812a8a93          	addi	s5,s5,-2030 # 8021e450 <root>
        initsleeplock(&de->lock, "entry");
    80205c46:	00004a17          	auipc	s4,0x4
    80205c4a:	18aa0a13          	addi	s4,s4,394 # 80209dd0 <digits+0xa50>
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80205c4e:	0001d997          	auipc	s3,0x1d
    80205c52:	fd298993          	addi	s3,s3,-46 # 80222c20 <cons>
        de->dev = 0;
    80205c56:	10048a23          	sb	zero,276(s1)
        de->valid = 0;
    80205c5a:	10049b23          	sh	zero,278(s1)
        de->ref = 0;
    80205c5e:	1004ac23          	sw	zero,280(s1)
        de->dirty = 0;
    80205c62:	10048aa3          	sb	zero,277(s1)
        de->parent = 0;
    80205c66:	1204b023          	sd	zero,288(s1)
        de->next = root.next;
    80205c6a:	15093783          	ld	a5,336(s2)
    80205c6e:	12f4b423          	sd	a5,296(s1)
        de->prev = &root;
    80205c72:	1354b823          	sd	s5,304(s1)
        initsleeplock(&de->lock, "entry");
    80205c76:	85d2                	mv	a1,s4
    80205c78:	13848513          	addi	a0,s1,312
    80205c7c:	ffffe097          	auipc	ra,0xffffe
    80205c80:	c80080e7          	jalr	-896(ra) # 802038fc <initsleeplock>
        root.next->prev = de;
    80205c84:	15093783          	ld	a5,336(s2)
    80205c88:	1297b823          	sd	s1,304(a5)
        root.next = de;
    80205c8c:	14993823          	sd	s1,336(s2)
    for(struct dirent *de = ecache.entries; de < ecache.entries + ENTRY_CACHE_NUM; de++) {
    80205c90:	16848493          	addi	s1,s1,360
    80205c94:	fd3491e3          	bne	s1,s3,80205c56 <fat32_init+0x1d2>
}
    80205c98:	4501                	li	a0,0
    80205c9a:	70e2                	ld	ra,56(sp)
    80205c9c:	7442                	ld	s0,48(sp)
    80205c9e:	74a2                	ld	s1,40(sp)
    80205ca0:	7902                	ld	s2,32(sp)
    80205ca2:	69e2                	ld	s3,24(sp)
    80205ca4:	6a42                	ld	s4,16(sp)
    80205ca6:	6aa2                	ld	s5,8(sp)
    80205ca8:	6121                	addi	sp,sp,64
    80205caa:	8082                	ret
        panic("not FAT32 volume");
    80205cac:	00004517          	auipc	a0,0x4
    80205cb0:	03450513          	addi	a0,a0,52 # 80209ce0 <digits+0x960>
    80205cb4:	ffffa097          	auipc	ra,0xffffa
    80205cb8:	490080e7          	jalr	1168(ra) # 80200144 <panic>
        panic("byts_per_sec != BSIZE");
    80205cbc:	00004517          	auipc	a0,0x4
    80205cc0:	0f450513          	addi	a0,a0,244 # 80209db0 <digits+0xa30>
    80205cc4:	ffffa097          	auipc	ra,0xffffa
    80205cc8:	480080e7          	jalr	1152(ra) # 80200144 <panic>

0000000080205ccc <eread>:
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80205ccc:	10852783          	lw	a5,264(a0)
    80205cd0:	0ed7e863          	bltu	a5,a3,80205dc0 <eread+0xf4>
{
    80205cd4:	711d                	addi	sp,sp,-96
    80205cd6:	ec86                	sd	ra,88(sp)
    80205cd8:	e8a2                	sd	s0,80(sp)
    80205cda:	e4a6                	sd	s1,72(sp)
    80205cdc:	e0ca                	sd	s2,64(sp)
    80205cde:	fc4e                	sd	s3,56(sp)
    80205ce0:	f852                	sd	s4,48(sp)
    80205ce2:	f456                	sd	s5,40(sp)
    80205ce4:	f05a                	sd	s6,32(sp)
    80205ce6:	ec5e                	sd	s7,24(sp)
    80205ce8:	e862                	sd	s8,16(sp)
    80205cea:	e466                	sd	s9,8(sp)
    80205cec:	e06a                	sd	s10,0(sp)
    80205cee:	1080                	addi	s0,sp,96
    80205cf0:	8a2a                	mv	s4,a0
    80205cf2:	8bae                	mv	s7,a1
    80205cf4:	8ab2                	mv	s5,a2
    80205cf6:	8936                	mv	s2,a3
    80205cf8:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80205cfa:	9eb9                	addw	a3,a3,a4
        return 0;
    80205cfc:	4501                	li	a0,0
    if (off > entry->file_size || off + n < off || (entry->attribute & ATTR_DIRECTORY)) {
    80205cfe:	0b26e163          	bltu	a3,s2,80205da0 <eread+0xd4>
    80205d02:	100a4703          	lbu	a4,256(s4)
    80205d06:	8b41                	andi	a4,a4,16
    80205d08:	ef41                	bnez	a4,80205da0 <eread+0xd4>
    if (off + n > entry->file_size) {
    80205d0a:	00d7f463          	bgeu	a5,a3,80205d12 <eread+0x46>
        n = entry->file_size - off;
    80205d0e:	41278b3b          	subw	s6,a5,s2
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205d12:	10ca2703          	lw	a4,268(s4)
    80205d16:	100007b7          	lui	a5,0x10000
    80205d1a:	17dd                	addi	a5,a5,-9 # ffffff7 <_entry-0x70200009>
    80205d1c:	06e7ef63          	bltu	a5,a4,80205d9a <eread+0xce>
    80205d20:	080b0e63          	beqz	s6,80205dbc <eread+0xf0>
    80205d24:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205d26:	00018c97          	auipc	s9,0x18
    80205d2a:	702c8c93          	addi	s9,s9,1794 # 8021e428 <fat>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205d2e:	8c3e                	mv	s8,a5
    80205d30:	a82d                	j	80205d6a <eread+0x9e>
    80205d32:	00048d1b          	sext.w	s10,s1
        if (rw_clus(entry->cur_clus, 0, user_dst, dst, off % fat.byts_per_clus, m) != m) {
    80205d36:	87ea                	mv	a5,s10
    80205d38:	86d6                	mv	a3,s5
    80205d3a:	865e                	mv	a2,s7
    80205d3c:	4581                	li	a1,0
    80205d3e:	10ca2503          	lw	a0,268(s4)
    80205d42:	00000097          	auipc	ra,0x0
    80205d46:	9fc080e7          	jalr	-1540(ra) # 8020573e <rw_clus>
    80205d4a:	2501                	sext.w	a0,a0
    80205d4c:	04ad1863          	bne	s10,a0,80205d9c <eread+0xd0>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205d50:	013489bb          	addw	s3,s1,s3
    80205d54:	0124893b          	addw	s2,s1,s2
    80205d58:	1482                	slli	s1,s1,0x20
    80205d5a:	9081                	srli	s1,s1,0x20
    80205d5c:	9aa6                	add	s5,s5,s1
    80205d5e:	10ca2783          	lw	a5,268(s4)
    80205d62:	02fc6d63          	bltu	s8,a5,80205d9c <eread+0xd0>
    80205d66:	0369fb63          	bgeu	s3,s6,80205d9c <eread+0xd0>
        reloc_clus(entry, off, 0);
    80205d6a:	4601                	li	a2,0
    80205d6c:	85ca                	mv	a1,s2
    80205d6e:	8552                	mv	a0,s4
    80205d70:	00000097          	auipc	ra,0x0
    80205d74:	8c6080e7          	jalr	-1850(ra) # 80205636 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205d78:	00cca683          	lw	a3,12(s9)
    80205d7c:	02d9763b          	remuw	a2,s2,a3
    80205d80:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80205d84:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205d88:	9e91                	subw	a3,a3,a2
    80205d8a:	84be                	mv	s1,a5
    80205d8c:	2781                	sext.w	a5,a5
    80205d8e:	0006861b          	sext.w	a2,a3
    80205d92:	faf670e3          	bgeu	a2,a5,80205d32 <eread+0x66>
    80205d96:	84b6                	mv	s1,a3
    80205d98:	bf69                	j	80205d32 <eread+0x66>
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205d9a:	4981                	li	s3,0
    return tot;
    80205d9c:	0009851b          	sext.w	a0,s3
}
    80205da0:	60e6                	ld	ra,88(sp)
    80205da2:	6446                	ld	s0,80(sp)
    80205da4:	64a6                	ld	s1,72(sp)
    80205da6:	6906                	ld	s2,64(sp)
    80205da8:	79e2                	ld	s3,56(sp)
    80205daa:	7a42                	ld	s4,48(sp)
    80205dac:	7aa2                	ld	s5,40(sp)
    80205dae:	7b02                	ld	s6,32(sp)
    80205db0:	6be2                	ld	s7,24(sp)
    80205db2:	6c42                	ld	s8,16(sp)
    80205db4:	6ca2                	ld	s9,8(sp)
    80205db6:	6d02                	ld	s10,0(sp)
    80205db8:	6125                	addi	sp,sp,96
    80205dba:	8082                	ret
    for (tot = 0; entry->cur_clus < FAT32_EOC && tot < n; tot += m, off += m, dst += m) {
    80205dbc:	89da                	mv	s3,s6
    80205dbe:	bff9                	j	80205d9c <eread+0xd0>
        return 0;
    80205dc0:	4501                	li	a0,0
}
    80205dc2:	8082                	ret

0000000080205dc4 <ewrite>:
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80205dc4:	10852783          	lw	a5,264(a0)
    80205dc8:	0ed7e463          	bltu	a5,a3,80205eb0 <ewrite+0xec>
{
    80205dcc:	711d                	addi	sp,sp,-96
    80205dce:	ec86                	sd	ra,88(sp)
    80205dd0:	e8a2                	sd	s0,80(sp)
    80205dd2:	e4a6                	sd	s1,72(sp)
    80205dd4:	e0ca                	sd	s2,64(sp)
    80205dd6:	fc4e                	sd	s3,56(sp)
    80205dd8:	f852                	sd	s4,48(sp)
    80205dda:	f456                	sd	s5,40(sp)
    80205ddc:	f05a                	sd	s6,32(sp)
    80205dde:	ec5e                	sd	s7,24(sp)
    80205de0:	e862                	sd	s8,16(sp)
    80205de2:	e466                	sd	s9,8(sp)
    80205de4:	1080                	addi	s0,sp,96
    80205de6:	8aaa                	mv	s5,a0
    80205de8:	8bae                	mv	s7,a1
    80205dea:	8a32                	mv	s4,a2
    80205dec:	8936                	mv	s2,a3
    80205dee:	8b3a                	mv	s6,a4
    if (off > entry->file_size || off + n < off || (uint64)off + n > 0xffffffff
    80205df0:	00e687bb          	addw	a5,a3,a4
    80205df4:	0cd7e063          	bltu	a5,a3,80205eb4 <ewrite+0xf0>
    80205df8:	02069793          	slli	a5,a3,0x20
    80205dfc:	9381                	srli	a5,a5,0x20
    80205dfe:	1702                	slli	a4,a4,0x20
    80205e00:	9301                	srli	a4,a4,0x20
    80205e02:	97ba                	add	a5,a5,a4
    80205e04:	577d                	li	a4,-1
    80205e06:	9301                	srli	a4,a4,0x20
    80205e08:	0af76863          	bltu	a4,a5,80205eb8 <ewrite+0xf4>
        || (entry->attribute & ATTR_READ_ONLY)) {
    80205e0c:	10054783          	lbu	a5,256(a0)
    80205e10:	8b85                	andi	a5,a5,1
    80205e12:	e7cd                	bnez	a5,80205ebc <ewrite+0xf8>
    if (entry->first_clus == 0) {   // so file_size if 0 too, which requests off == 0
    80205e14:	10452783          	lw	a5,260(a0)
    80205e18:	cb89                	beqz	a5,80205e2a <ewrite+0x66>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205e1a:	080b0963          	beqz	s6,80205eac <ewrite+0xe8>
    80205e1e:	4981                	li	s3,0
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205e20:	00018c17          	auipc	s8,0x18
    80205e24:	608c0c13          	addi	s8,s8,1544 # 8021e428 <fat>
    80205e28:	a891                	j	80205e7c <ewrite+0xb8>
        entry->cur_clus = entry->first_clus = alloc_clus(entry->dev);
    80205e2a:	11454503          	lbu	a0,276(a0)
    80205e2e:	fffff097          	auipc	ra,0xfffff
    80205e32:	646080e7          	jalr	1606(ra) # 80205474 <alloc_clus>
    80205e36:	2501                	sext.w	a0,a0
    80205e38:	10aaa223          	sw	a0,260(s5)
    80205e3c:	10aaa623          	sw	a0,268(s5)
        entry->clus_cnt = 0;
    80205e40:	100aa823          	sw	zero,272(s5)
        entry->dirty = 1;
    80205e44:	4785                	li	a5,1
    80205e46:	10fa8aa3          	sb	a5,277(s5)
    80205e4a:	bfc1                	j	80205e1a <ewrite+0x56>
    80205e4c:	00048c9b          	sext.w	s9,s1
        if (rw_clus(entry->cur_clus, 1, user_src, src, off % fat.byts_per_clus, m) != m) {
    80205e50:	87e6                	mv	a5,s9
    80205e52:	86d2                	mv	a3,s4
    80205e54:	865e                	mv	a2,s7
    80205e56:	4585                	li	a1,1
    80205e58:	10caa503          	lw	a0,268(s5)
    80205e5c:	00000097          	auipc	ra,0x0
    80205e60:	8e2080e7          	jalr	-1822(ra) # 8020573e <rw_clus>
    80205e64:	2501                	sext.w	a0,a0
    80205e66:	04ac9d63          	bne	s9,a0,80205ec0 <ewrite+0xfc>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205e6a:	013489bb          	addw	s3,s1,s3
    80205e6e:	0124893b          	addw	s2,s1,s2
    80205e72:	1482                	slli	s1,s1,0x20
    80205e74:	9081                	srli	s1,s1,0x20
    80205e76:	9a26                	add	s4,s4,s1
    80205e78:	0569f463          	bgeu	s3,s6,80205ec0 <ewrite+0xfc>
        reloc_clus(entry, off, 1);
    80205e7c:	4605                	li	a2,1
    80205e7e:	85ca                	mv	a1,s2
    80205e80:	8556                	mv	a0,s5
    80205e82:	fffff097          	auipc	ra,0xfffff
    80205e86:	7b4080e7          	jalr	1972(ra) # 80205636 <reloc_clus>
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205e8a:	00cc2683          	lw	a3,12(s8)
    80205e8e:	02d9763b          	remuw	a2,s2,a3
    80205e92:	0006071b          	sext.w	a4,a2
        if (n - tot < m) {
    80205e96:	413b07bb          	subw	a5,s6,s3
        m = fat.byts_per_clus - off % fat.byts_per_clus;
    80205e9a:	9e91                	subw	a3,a3,a2
    80205e9c:	84be                	mv	s1,a5
    80205e9e:	2781                	sext.w	a5,a5
    80205ea0:	0006861b          	sext.w	a2,a3
    80205ea4:	faf674e3          	bgeu	a2,a5,80205e4c <ewrite+0x88>
    80205ea8:	84b6                	mv	s1,a3
    80205eaa:	b74d                	j	80205e4c <ewrite+0x88>
    for (tot = 0; tot < n; tot += m, off += m, src += m) {
    80205eac:	89da                	mv	s3,s6
    80205eae:	a015                	j	80205ed2 <ewrite+0x10e>
        return -1;
    80205eb0:	557d                	li	a0,-1
}
    80205eb2:	8082                	ret
        return -1;
    80205eb4:	557d                	li	a0,-1
    80205eb6:	a005                	j	80205ed6 <ewrite+0x112>
    80205eb8:	557d                	li	a0,-1
    80205eba:	a831                	j	80205ed6 <ewrite+0x112>
    80205ebc:	557d                	li	a0,-1
    80205ebe:	a821                	j	80205ed6 <ewrite+0x112>
        if(off > entry->file_size) {
    80205ec0:	108aa783          	lw	a5,264(s5)
    80205ec4:	0127f763          	bgeu	a5,s2,80205ed2 <ewrite+0x10e>
            entry->file_size = off;
    80205ec8:	112aa423          	sw	s2,264(s5)
            entry->dirty = 1;
    80205ecc:	4785                	li	a5,1
    80205ece:	10fa8aa3          	sb	a5,277(s5)
    return tot;
    80205ed2:	0009851b          	sext.w	a0,s3
}
    80205ed6:	60e6                	ld	ra,88(sp)
    80205ed8:	6446                	ld	s0,80(sp)
    80205eda:	64a6                	ld	s1,72(sp)
    80205edc:	6906                	ld	s2,64(sp)
    80205ede:	79e2                	ld	s3,56(sp)
    80205ee0:	7a42                	ld	s4,48(sp)
    80205ee2:	7aa2                	ld	s5,40(sp)
    80205ee4:	7b02                	ld	s6,32(sp)
    80205ee6:	6be2                	ld	s7,24(sp)
    80205ee8:	6c42                	ld	s8,16(sp)
    80205eea:	6ca2                	ld	s9,8(sp)
    80205eec:	6125                	addi	sp,sp,96
    80205eee:	8082                	ret

0000000080205ef0 <formatname>:
{
    80205ef0:	7179                	addi	sp,sp,-48
    80205ef2:	f406                	sd	ra,40(sp)
    80205ef4:	f022                	sd	s0,32(sp)
    80205ef6:	ec26                	sd	s1,24(sp)
    80205ef8:	e84a                	sd	s2,16(sp)
    80205efa:	e44e                	sd	s3,8(sp)
    80205efc:	e052                	sd	s4,0(sp)
    80205efe:	1800                	addi	s0,sp,48
    80205f00:	84aa                	mv	s1,a0
    while (*name == ' ' || *name == '.') { name++; }
    80205f02:	02000793          	li	a5,32
    80205f06:	02e00713          	li	a4,46
    80205f0a:	a011                	j	80205f0e <formatname+0x1e>
    80205f0c:	0485                	addi	s1,s1,1
    80205f0e:	0004c583          	lbu	a1,0(s1)
    80205f12:	fef58de3          	beq	a1,a5,80205f0c <formatname+0x1c>
    80205f16:	fee58be3          	beq	a1,a4,80205f0c <formatname+0x1c>
    for (p = name; *p; p++) {
    80205f1a:	c1b9                	beqz	a1,80205f60 <formatname+0x70>
    80205f1c:	8926                	mv	s2,s1
        if (c < 0x20 || strchr(illegal, c)) {
    80205f1e:	49fd                	li	s3,31
    80205f20:	00006a17          	auipc	s4,0x6
    80205f24:	a78a0a13          	addi	s4,s4,-1416 # 8020b998 <illegal.1>
    80205f28:	02b9fe63          	bgeu	s3,a1,80205f64 <formatname+0x74>
    80205f2c:	8552                	mv	a0,s4
    80205f2e:	ffffb097          	auipc	ra,0xffffb
    80205f32:	ac0080e7          	jalr	-1344(ra) # 802009ee <strchr>
    80205f36:	e121                	bnez	a0,80205f76 <formatname+0x86>
    for (p = name; *p; p++) {
    80205f38:	0905                	addi	s2,s2,1
    80205f3a:	00094583          	lbu	a1,0(s2)
    80205f3e:	f5ed                	bnez	a1,80205f28 <formatname+0x38>
        if (*p != ' ') {
    80205f40:	02000693          	li	a3,32
    80205f44:	874a                	mv	a4,s2
    while (p-- > name) {
    80205f46:	0124fb63          	bgeu	s1,s2,80205f5c <formatname+0x6c>
        if (*p != ' ') {
    80205f4a:	197d                	addi	s2,s2,-1
    80205f4c:	00094783          	lbu	a5,0(s2)
    80205f50:	fed78ae3          	beq	a5,a3,80205f44 <formatname+0x54>
            p[1] = '\0';
    80205f54:	00070023          	sb	zero,0(a4)
            break;
    80205f58:	8526                	mv	a0,s1
    80205f5a:	a031                	j	80205f66 <formatname+0x76>
    80205f5c:	8526                	mv	a0,s1
    80205f5e:	a021                	j	80205f66 <formatname+0x76>
    for (p = name; *p; p++) {
    80205f60:	8526                	mv	a0,s1
    80205f62:	a011                	j	80205f66 <formatname+0x76>
            return 0;
    80205f64:	4501                	li	a0,0
}
    80205f66:	70a2                	ld	ra,40(sp)
    80205f68:	7402                	ld	s0,32(sp)
    80205f6a:	64e2                	ld	s1,24(sp)
    80205f6c:	6942                	ld	s2,16(sp)
    80205f6e:	69a2                	ld	s3,8(sp)
    80205f70:	6a02                	ld	s4,0(sp)
    80205f72:	6145                	addi	sp,sp,48
    80205f74:	8082                	ret
            return 0;
    80205f76:	4501                	li	a0,0
    80205f78:	b7fd                	j	80205f66 <formatname+0x76>

0000000080205f7a <cal_checksum>:
{
    80205f7a:	1141                	addi	sp,sp,-16
    80205f7c:	e422                	sd	s0,8(sp)
    80205f7e:	0800                	addi	s0,sp,16
    80205f80:	87aa                	mv	a5,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80205f82:	00b50613          	addi	a2,a0,11
    uint8 sum = 0;
    80205f86:	4501                	li	a0,0
        sum = ((sum & 1) ? 0x80 : 0) + (sum >> 1) + *shortname++;
    80205f88:	0075171b          	slliw	a4,a0,0x7
    80205f8c:	0785                	addi	a5,a5,1
    80205f8e:	0015551b          	srliw	a0,a0,0x1
    80205f92:	fff7c683          	lbu	a3,-1(a5)
    80205f96:	9d35                	addw	a0,a0,a3
    80205f98:	953a                	add	a0,a0,a4
    80205f9a:	0ff57513          	zext.b	a0,a0
    for (int i = CHAR_SHORT_NAME; i != 0; i--) {
    80205f9e:	fef615e3          	bne	a2,a5,80205f88 <cal_checksum+0xe>
}
    80205fa2:	6422                	ld	s0,8(sp)
    80205fa4:	0141                	addi	sp,sp,16
    80205fa6:	8082                	ret

0000000080205fa8 <emake>:
{
    80205fa8:	7131                	addi	sp,sp,-192
    80205faa:	fd06                	sd	ra,184(sp)
    80205fac:	f922                	sd	s0,176(sp)
    80205fae:	f526                	sd	s1,168(sp)
    80205fb0:	f14a                	sd	s2,160(sp)
    80205fb2:	ed4e                	sd	s3,152(sp)
    80205fb4:	e952                	sd	s4,144(sp)
    80205fb6:	e556                	sd	s5,136(sp)
    80205fb8:	e15a                	sd	s6,128(sp)
    80205fba:	fcde                	sd	s7,120(sp)
    80205fbc:	f8e2                	sd	s8,112(sp)
    80205fbe:	f4e6                	sd	s9,104(sp)
    80205fc0:	f0ea                	sd	s10,96(sp)
    80205fc2:	ecee                	sd	s11,88(sp)
    80205fc4:	0180                	addi	s0,sp,192
    if (!(dp->attribute & ATTR_DIRECTORY))
    80205fc6:	10054783          	lbu	a5,256(a0)
    80205fca:	8bc1                	andi	a5,a5,16
    80205fcc:	c3d5                	beqz	a5,80206070 <emake+0xc8>
    80205fce:	8b2a                	mv	s6,a0
    80205fd0:	8d2e                	mv	s10,a1
    80205fd2:	8cb2                	mv	s9,a2
    if (off % sizeof(union dentry))
    80205fd4:	01f67793          	andi	a5,a2,31
    80205fd8:	e7c5                	bnez	a5,80206080 <emake+0xd8>
    memset(&de, 0, sizeof(de));
    80205fda:	02000613          	li	a2,32
    80205fde:	4581                	li	a1,0
    80205fe0:	f7040513          	addi	a0,s0,-144
    80205fe4:	ffffa097          	auipc	ra,0xffffa
    80205fe8:	7ac080e7          	jalr	1964(ra) # 80200790 <memset>
    if (off <= 32) {
    80205fec:	02000793          	li	a5,32
    80205ff0:	0b97ec63          	bltu	a5,s9,802060a8 <emake+0x100>
        if (off == 0) {
    80205ff4:	080c9e63          	bnez	s9,80206090 <emake+0xe8>
            strncpy(de.sne.name, ".          ", sizeof(de.sne.name));
    80205ff8:	462d                	li	a2,11
    80205ffa:	00004597          	auipc	a1,0x4
    80205ffe:	e0658593          	addi	a1,a1,-506 # 80209e00 <digits+0xa80>
    80206002:	f7040513          	addi	a0,s0,-144
    80206006:	ffffb097          	auipc	ra,0xffffb
    8020600a:	89e080e7          	jalr	-1890(ra) # 802008a4 <strncpy>
        de.sne.attr = ATTR_DIRECTORY;
    8020600e:	47c1                	li	a5,16
    80206010:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);        // first clus high 16 bits
    80206014:	104d2783          	lw	a5,260(s10) # fffffffffffff104 <ebss_clear+0xffffffff7fdd9104>
    80206018:	0107d71b          	srliw	a4,a5,0x10
    8020601c:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);       // low 16 bits
    80206020:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = 0;                                       // filesize is updated in eupdate()
    80206024:	f8042623          	sw	zero,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206028:	4605                	li	a2,1
    8020602a:	85e6                	mv	a1,s9
    8020602c:	855a                	mv	a0,s6
    8020602e:	fffff097          	auipc	ra,0xfffff
    80206032:	608080e7          	jalr	1544(ra) # 80205636 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206036:	02000793          	li	a5,32
    8020603a:	0005071b          	sext.w	a4,a0
    8020603e:	f7040693          	addi	a3,s0,-144
    80206042:	4601                	li	a2,0
    80206044:	4585                	li	a1,1
    80206046:	10cb2503          	lw	a0,268(s6)
    8020604a:	fffff097          	auipc	ra,0xfffff
    8020604e:	6f4080e7          	jalr	1780(ra) # 8020573e <rw_clus>
}
    80206052:	70ea                	ld	ra,184(sp)
    80206054:	744a                	ld	s0,176(sp)
    80206056:	74aa                	ld	s1,168(sp)
    80206058:	790a                	ld	s2,160(sp)
    8020605a:	69ea                	ld	s3,152(sp)
    8020605c:	6a4a                	ld	s4,144(sp)
    8020605e:	6aaa                	ld	s5,136(sp)
    80206060:	6b0a                	ld	s6,128(sp)
    80206062:	7be6                	ld	s7,120(sp)
    80206064:	7c46                	ld	s8,112(sp)
    80206066:	7ca6                	ld	s9,104(sp)
    80206068:	7d06                	ld	s10,96(sp)
    8020606a:	6de6                	ld	s11,88(sp)
    8020606c:	6129                	addi	sp,sp,192
    8020606e:	8082                	ret
        panic("emake: not dir");
    80206070:	00004517          	auipc	a0,0x4
    80206074:	d6850513          	addi	a0,a0,-664 # 80209dd8 <digits+0xa58>
    80206078:	ffffa097          	auipc	ra,0xffffa
    8020607c:	0cc080e7          	jalr	204(ra) # 80200144 <panic>
        panic("emake: not aligned");
    80206080:	00004517          	auipc	a0,0x4
    80206084:	d6850513          	addi	a0,a0,-664 # 80209de8 <digits+0xa68>
    80206088:	ffffa097          	auipc	ra,0xffffa
    8020608c:	0bc080e7          	jalr	188(ra) # 80200144 <panic>
            strncpy(de.sne.name, "..         ", sizeof(de.sne.name));
    80206090:	462d                	li	a2,11
    80206092:	00004597          	auipc	a1,0x4
    80206096:	d7e58593          	addi	a1,a1,-642 # 80209e10 <digits+0xa90>
    8020609a:	f7040513          	addi	a0,s0,-144
    8020609e:	ffffb097          	auipc	ra,0xffffb
    802060a2:	806080e7          	jalr	-2042(ra) # 802008a4 <strncpy>
    802060a6:	b7a5                	j	8020600e <emake+0x66>
        int entcnt = (strlen(ep->filename) + CHAR_LONG_NAME - 1) / CHAR_LONG_NAME;   // count of l-n-entries, rounds up
    802060a8:	896a                	mv	s2,s10
    802060aa:	856a                	mv	a0,s10
    802060ac:	ffffb097          	auipc	ra,0xffffb
    802060b0:	868080e7          	jalr	-1944(ra) # 80200914 <strlen>
    802060b4:	f4a43423          	sd	a0,-184(s0)
    802060b8:	00c5071b          	addiw	a4,a0,12
    802060bc:	47b5                	li	a5,13
    802060be:	02f747bb          	divw	a5,a4,a5
    802060c2:	f4f42c23          	sw	a5,-168(s0)
    802060c6:	00078d9b          	sext.w	s11,a5
        memset(shortname, 0, sizeof(shortname));
    802060ca:	4631                	li	a2,12
    802060cc:	4581                	li	a1,0
    802060ce:	f6040513          	addi	a0,s0,-160
    802060d2:	ffffa097          	auipc	ra,0xffffa
    802060d6:	6be080e7          	jalr	1726(ra) # 80200790 <memset>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    802060da:	856a                	mv	a0,s10
    802060dc:	ffffb097          	auipc	ra,0xffffb
    802060e0:	838080e7          	jalr	-1992(ra) # 80200914 <strlen>
    802060e4:	fff5079b          	addiw	a5,a0,-1
    802060e8:	0207cf63          	bltz	a5,80206126 <emake+0x17e>
    802060ec:	97ea                	add	a5,a5,s10
    802060ee:	ffed0693          	addi	a3,s10,-2
    802060f2:	96aa                	add	a3,a3,a0
    802060f4:	fff5071b          	addiw	a4,a0,-1
    802060f8:	1702                	slli	a4,a4,0x20
    802060fa:	9301                	srli	a4,a4,0x20
    802060fc:	8e99                	sub	a3,a3,a4
        if (name[j] == '.') {
    802060fe:	02e00613          	li	a2,46
    80206102:	89be                	mv	s3,a5
    80206104:	0007c703          	lbu	a4,0(a5)
    80206108:	00c70663          	beq	a4,a2,80206114 <emake+0x16c>
    for (int j = strlen(name) - 1; j >= 0; j--) {
    8020610c:	17fd                	addi	a5,a5,-1
    8020610e:	fed79ae3          	bne	a5,a3,80206102 <emake+0x15a>
    char c, *p = name;
    80206112:	89ea                	mv	s3,s10
        shortname[i++] = c;
    80206114:	4481                	li	s1,0
        if (i == 8 && p) {
    80206116:	4aa1                	li	s5,8
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    80206118:	4ba9                	li	s7,10
        if (c >= 'a' && c <= 'z') {
    8020611a:	4c65                	li	s8,25
                memset(shortname + i, ' ', 8 - i);
    8020611c:	f6040793          	addi	a5,s0,-160
    80206120:	f4f43823          	sd	a5,-176(s0)
    80206124:	a8d9                	j	802061fa <emake+0x252>
    char c, *p = name;
    80206126:	89ea                	mv	s3,s10
    80206128:	b7f5                	j	80206114 <emake+0x16c>
        if (i == 8 && p) {
    8020612a:	22098b63          	beqz	s3,80206360 <emake+0x3b8>
            if (p + 1 < name) { break; }            // no '.'
    8020612e:	0985                	addi	s3,s3,1
    80206130:	0949fc63          	bgeu	s3,s4,802061c8 <emake+0x220>
    80206134:	f6040793          	addi	a5,s0,-160
    80206138:	97a6                	add	a5,a5,s1
        shortname[i++] = ' ';
    8020613a:	02000693          	li	a3,32
    while (i < CHAR_SHORT_NAME) {
    8020613e:	4729                	li	a4,10
        shortname[i++] = ' ';
    80206140:	2485                	addiw	s1,s1,1
    80206142:	00d78023          	sb	a3,0(a5)
    while (i < CHAR_SHORT_NAME) {
    80206146:	0785                	addi	a5,a5,1
    80206148:	fe975ce3          	bge	a4,s1,80206140 <emake+0x198>
        de.lne.checksum = cal_checksum((uchar *)shortname);
    8020614c:	f6040513          	addi	a0,s0,-160
    80206150:	00000097          	auipc	ra,0x0
    80206154:	e2a080e7          	jalr	-470(ra) # 80205f7a <cal_checksum>
    80206158:	f6a40ea3          	sb	a0,-131(s0)
        de.lne.attr = ATTR_LONG_NAME;
    8020615c:	47bd                	li	a5,15
    8020615e:	f6f40da3          	sb	a5,-133(s0)
        for (int i = entcnt; i > 0; i--) {
    80206162:	f4843783          	ld	a5,-184(s0)
    80206166:	14f05c63          	blez	a5,802062be <emake+0x316>
    8020616a:	f5842783          	lw	a5,-168(s0)
    8020616e:	37fd                	addiw	a5,a5,-1
    80206170:	f4f42223          	sw	a5,-188(s0)
    80206174:	00179b9b          	slliw	s7,a5,0x1
    80206178:	00fb8bbb          	addw	s7,s7,a5
    8020617c:	002b9b9b          	slliw	s7,s7,0x2
    80206180:	00fb8bbb          	addw	s7,s7,a5
    80206184:	9bea                	add	s7,s7,s10
    80206186:	8aee                	mv	s5,s11
    80206188:	8c66                	mv	s8,s9
            int end = 0;
    8020618a:	4981                	li	s3,0
            uint8 *w = (uint8 *)de.lne.name1;
    8020618c:	f7140793          	addi	a5,s0,-143
    80206190:	f4f43823          	sd	a5,-176(s0)
    80206194:	0ff00913          	li	s2,255
                    case 5:     w = (uint8 *)de.lne.name2; break;
    80206198:	f7e40793          	addi	a5,s0,-130
    8020619c:	f4f43c23          	sd	a5,-168(s0)
                switch (j) {
    802061a0:	44ad                	li	s1,11
    802061a2:	f8c40a13          	addi	s4,s0,-116
    802061a6:	a0c5                	j	80206286 <emake+0x2de>
            if (name > p) {                    // last '.'
    802061a8:	0549f663          	bgeu	s3,s4,802061f4 <emake+0x24c>
                memset(shortname + i, ' ', 8 - i);
    802061ac:	47a1                	li	a5,8
    802061ae:	4097863b          	subw	a2,a5,s1
    802061b2:	02000593          	li	a1,32
    802061b6:	f5043783          	ld	a5,-176(s0)
    802061ba:	00978533          	add	a0,a5,s1
    802061be:	ffffa097          	auipc	ra,0xffffa
    802061c2:	5d2080e7          	jalr	1490(ra) # 80200790 <memset>
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802061c6:	89d2                	mv	s3,s4
        shortname[i++] = c;
    802061c8:	8a4e                	mv	s4,s3
    802061ca:	84d6                	mv	s1,s5
    802061cc:	4981                	li	s3,0
    802061ce:	a02d                	j	802061f8 <emake+0x250>
            if (strchr(illegal, c) != NULL) {
    802061d0:	85ca                	mv	a1,s2
    802061d2:	00005517          	auipc	a0,0x5
    802061d6:	7d650513          	addi	a0,a0,2006 # 8020b9a8 <illegal.0>
    802061da:	ffffb097          	auipc	ra,0xffffb
    802061de:	814080e7          	jalr	-2028(ra) # 802009ee <strchr>
    802061e2:	c119                	beqz	a0,802061e8 <emake+0x240>
                c = '_';
    802061e4:	05f00913          	li	s2,95
        shortname[i++] = c;
    802061e8:	f9048793          	addi	a5,s1,-112
    802061ec:	97a2                	add	a5,a5,s0
    802061ee:	fd278823          	sb	s2,-48(a5)
    802061f2:	2485                	addiw	s1,s1,1
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802061f4:	f49bcce3          	blt	s7,s1,8020614c <emake+0x1a4>
        shortname[i++] = c;
    802061f8:	8952                	mv	s2,s4
    while (i < CHAR_SHORT_NAME && (c = *name++)) {
    802061fa:	00190a13          	addi	s4,s2,1
    802061fe:	00094903          	lbu	s2,0(s2)
    80206202:	02090663          	beqz	s2,8020622e <emake+0x286>
        if (i == 8 && p) {
    80206206:	f35482e3          	beq	s1,s5,8020612a <emake+0x182>
        if (c == ' ') { continue; }
    8020620a:	02000793          	li	a5,32
    8020620e:	fef903e3          	beq	s2,a5,802061f4 <emake+0x24c>
        if (c == '.') {
    80206212:	02e00793          	li	a5,46
    80206216:	f8f909e3          	beq	s2,a5,802061a8 <emake+0x200>
        if (c >= 'a' && c <= 'z') {
    8020621a:	f9f9079b          	addiw	a5,s2,-97
    8020621e:	0ff7f793          	zext.b	a5,a5
    80206222:	fafc67e3          	bltu	s8,a5,802061d0 <emake+0x228>
            c += 'A' - 'a';
    80206226:	3901                	addiw	s2,s2,-32
    80206228:	0ff97913          	zext.b	s2,s2
    8020622c:	bf75                	j	802061e8 <emake+0x240>
    while (i < CHAR_SHORT_NAME) {
    8020622e:	47a9                	li	a5,10
    80206230:	f097d2e3          	bge	a5,s1,80206134 <emake+0x18c>
    80206234:	bf21                	j	8020614c <emake+0x1a4>
                de.lne.order |= LAST_LONG_ENTRY;
    80206236:	0407e793          	ori	a5,a5,64
    8020623a:	f6f40823          	sb	a5,-144(s0)
    8020623e:	a891                	j	80206292 <emake+0x2ea>
                    if ((*w++ = *p++) == 0) {
    80206240:	00084603          	lbu	a2,0(a6)
                        end = 1;
    80206244:	00163513          	seqz	a0,a2
                    *w++ = 0;
    80206248:	00278893          	addi	a7,a5,2
                    if ((*w++ = *p++) == 0) {
    8020624c:	0805                	addi	a6,a6,1
                    *w++ = 0;
    8020624e:	85ce                	mv	a1,s3
    80206250:	a8d5                	j	80206344 <emake+0x39c>
            uint off2 = reloc_clus(dp, off, 1);
    80206252:	4605                	li	a2,1
    80206254:	85e2                	mv	a1,s8
    80206256:	855a                	mv	a0,s6
    80206258:	fffff097          	auipc	ra,0xfffff
    8020625c:	3de080e7          	jalr	990(ra) # 80205636 <reloc_clus>
            rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off2, sizeof(de));
    80206260:	02000793          	li	a5,32
    80206264:	0005071b          	sext.w	a4,a0
    80206268:	f7040693          	addi	a3,s0,-144
    8020626c:	864e                	mv	a2,s3
    8020626e:	4585                	li	a1,1
    80206270:	10cb2503          	lw	a0,268(s6)
    80206274:	fffff097          	auipc	ra,0xfffff
    80206278:	4ca080e7          	jalr	1226(ra) # 8020573e <rw_clus>
            off += sizeof(de);
    8020627c:	020c0c1b          	addiw	s8,s8,32
        for (int i = entcnt; i > 0; i--) {
    80206280:	1bcd                	addi	s7,s7,-13
    80206282:	03505163          	blez	s5,802062a4 <emake+0x2fc>
            if ((de.lne.order = i) == entcnt) {
    80206286:	0ffaf793          	zext.b	a5,s5
    8020628a:	fafd86e3          	beq	s11,a5,80206236 <emake+0x28e>
    8020628e:	f6f40823          	sb	a5,-144(s0)
            char *p = ep->filename + (i - 1) * CHAR_LONG_NAME;
    80206292:	3afd                	addiw	s5,s5,-1
    80206294:	885e                	mv	a6,s7
    80206296:	4709                	li	a4,2
            int end = 0;
    80206298:	854e                	mv	a0,s3
            uint8 *w = (uint8 *)de.lne.name1;
    8020629a:	f5043783          	ld	a5,-176(s0)
                switch (j) {
    8020629e:	4315                	li	t1,5
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    802062a0:	4e35                	li	t3,13
    802062a2:	a851                	j	80206336 <emake+0x38e>
    802062a4:	020c8c9b          	addiw	s9,s9,32
            off += sizeof(de);
    802062a8:	4781                	li	a5,0
    802062aa:	f4843703          	ld	a4,-184(s0)
    802062ae:	00e05663          	blez	a4,802062ba <emake+0x312>
    802062b2:	f4442783          	lw	a5,-188(s0)
    802062b6:	0057979b          	slliw	a5,a5,0x5
    802062ba:	01978cbb          	addw	s9,a5,s9
        memset(&de, 0, sizeof(de));
    802062be:	02000613          	li	a2,32
    802062c2:	4581                	li	a1,0
    802062c4:	f7040493          	addi	s1,s0,-144
    802062c8:	8526                	mv	a0,s1
    802062ca:	ffffa097          	auipc	ra,0xffffa
    802062ce:	4c6080e7          	jalr	1222(ra) # 80200790 <memset>
        strncpy(de.sne.name, shortname, sizeof(de.sne.name));
    802062d2:	462d                	li	a2,11
    802062d4:	f6040593          	addi	a1,s0,-160
    802062d8:	8526                	mv	a0,s1
    802062da:	ffffa097          	auipc	ra,0xffffa
    802062de:	5ca080e7          	jalr	1482(ra) # 802008a4 <strncpy>
        de.sne.attr = ep->attribute;
    802062e2:	100d4783          	lbu	a5,256(s10)
    802062e6:	f6f40da3          	sb	a5,-133(s0)
        de.sne.fst_clus_hi = (uint16)(ep->first_clus >> 16);      // first clus high 16 bits
    802062ea:	104d2783          	lw	a5,260(s10)
    802062ee:	0107d71b          	srliw	a4,a5,0x10
    802062f2:	f8e41223          	sh	a4,-124(s0)
        de.sne.fst_clus_lo = (uint16)(ep->first_clus & 0xffff);     // low 16 bits
    802062f6:	f8f41523          	sh	a5,-118(s0)
        de.sne.file_size = ep->file_size;                         // filesize is updated in eupdate()
    802062fa:	108d2783          	lw	a5,264(s10)
    802062fe:	f8f42623          	sw	a5,-116(s0)
        off = reloc_clus(dp, off, 1);
    80206302:	4605                	li	a2,1
    80206304:	85e6                	mv	a1,s9
    80206306:	855a                	mv	a0,s6
    80206308:	fffff097          	auipc	ra,0xfffff
    8020630c:	32e080e7          	jalr	814(ra) # 80205636 <reloc_clus>
        rw_clus(dp->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206310:	02000793          	li	a5,32
    80206314:	0005071b          	sext.w	a4,a0
    80206318:	86a6                	mv	a3,s1
    8020631a:	4601                	li	a2,0
    8020631c:	4585                	li	a1,1
    8020631e:	10cb2503          	lw	a0,268(s6)
    80206322:	fffff097          	auipc	ra,0xfffff
    80206326:	41c080e7          	jalr	1052(ra) # 8020573e <rw_clus>
}
    8020632a:	b325                	j	80206052 <emake+0xaa>
                    case 5:     w = (uint8 *)de.lne.name2; break;
    8020632c:	f5843783          	ld	a5,-168(s0)
    80206330:	a011                	j	80206334 <emake+0x38c>
                switch (j) {
    80206332:	87d2                	mv	a5,s4
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206334:	2705                	addiw	a4,a4,1
    80206336:	fff7069b          	addiw	a3,a4,-1
                if (end) {
    8020633a:	d119                	beqz	a0,80206240 <emake+0x298>
                    *w++ = 0xff;
    8020633c:	00278893          	addi	a7,a5,2
    80206340:	864a                	mv	a2,s2
    80206342:	85ca                	mv	a1,s2
                    *w++ = 0xff;            // on k210, unaligned reading is illegal
    80206344:	00c78023          	sb	a2,0(a5)
                    *w++ = 0xff;
    80206348:	00b780a3          	sb	a1,1(a5)
                switch (j) {
    8020634c:	fe6680e3          	beq	a3,t1,8020632c <emake+0x384>
    80206350:	fe9681e3          	beq	a3,s1,80206332 <emake+0x38a>
            for (int j = 1; j <= CHAR_LONG_NAME; j++) {
    80206354:	0007079b          	sext.w	a5,a4
    80206358:	eefe4de3          	blt	t3,a5,80206252 <emake+0x2aa>
    8020635c:	87c6                	mv	a5,a7
    8020635e:	bfd9                	j	80206334 <emake+0x38c>
        if (c == ' ') { continue; }
    80206360:	02000793          	li	a5,32
    80206364:	e8f90ae3          	beq	s2,a5,802061f8 <emake+0x250>
        if (c == '.') {
    80206368:	02e00793          	li	a5,46
    8020636c:	eaf917e3          	bne	s2,a5,8020621a <emake+0x272>
    80206370:	bd35                	j	802061ac <emake+0x204>

0000000080206372 <edup>:
{
    80206372:	1101                	addi	sp,sp,-32
    80206374:	ec06                	sd	ra,24(sp)
    80206376:	e822                	sd	s0,16(sp)
    80206378:	e426                	sd	s1,8(sp)
    8020637a:	1000                	addi	s0,sp,32
    8020637c:	84aa                	mv	s1,a0
    if (entry != 0) {
    8020637e:	c515                	beqz	a0,802063aa <edup+0x38>
        acquire(&ecache.lock);
    80206380:	00018517          	auipc	a0,0x18
    80206384:	23850513          	addi	a0,a0,568 # 8021e5b8 <ecache>
    80206388:	ffffa097          	auipc	ra,0xffffa
    8020638c:	36c080e7          	jalr	876(ra) # 802006f4 <acquire>
        entry->ref++;
    80206390:	1184a783          	lw	a5,280(s1)
    80206394:	2785                	addiw	a5,a5,1
    80206396:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    8020639a:	00018517          	auipc	a0,0x18
    8020639e:	21e50513          	addi	a0,a0,542 # 8021e5b8 <ecache>
    802063a2:	ffffa097          	auipc	ra,0xffffa
    802063a6:	3a6080e7          	jalr	934(ra) # 80200748 <release>
}
    802063aa:	8526                	mv	a0,s1
    802063ac:	60e2                	ld	ra,24(sp)
    802063ae:	6442                	ld	s0,16(sp)
    802063b0:	64a2                	ld	s1,8(sp)
    802063b2:	6105                	addi	sp,sp,32
    802063b4:	8082                	ret

00000000802063b6 <eupdate>:
    if (!entry->dirty || entry->valid != 1) { return; }
    802063b6:	11554783          	lbu	a5,277(a0)
    802063ba:	c3e5                	beqz	a5,8020649a <eupdate+0xe4>
{
    802063bc:	711d                	addi	sp,sp,-96
    802063be:	ec86                	sd	ra,88(sp)
    802063c0:	e8a2                	sd	s0,80(sp)
    802063c2:	e4a6                	sd	s1,72(sp)
    802063c4:	e0ca                	sd	s2,64(sp)
    802063c6:	fc4e                	sd	s3,56(sp)
    802063c8:	1080                	addi	s0,sp,96
    802063ca:	84aa                	mv	s1,a0
    if (!entry->dirty || entry->valid != 1) { return; }
    802063cc:	11651703          	lh	a4,278(a0)
    802063d0:	4785                	li	a5,1
    802063d2:	00f70963          	beq	a4,a5,802063e4 <eupdate+0x2e>
}
    802063d6:	60e6                	ld	ra,88(sp)
    802063d8:	6446                	ld	s0,80(sp)
    802063da:	64a6                	ld	s1,72(sp)
    802063dc:	6906                	ld	s2,64(sp)
    802063de:	79e2                	ld	s3,56(sp)
    802063e0:	6125                	addi	sp,sp,96
    802063e2:	8082                	ret
    uint entcnt = 0;
    802063e4:	fc042623          	sw	zero,-52(s0)
    uint32 off = reloc_clus(entry->parent, entry->off, 0);
    802063e8:	4601                	li	a2,0
    802063ea:	11c52583          	lw	a1,284(a0)
    802063ee:	12053503          	ld	a0,288(a0)
    802063f2:	fffff097          	auipc	ra,0xfffff
    802063f6:	244080e7          	jalr	580(ra) # 80205636 <reloc_clus>
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off, 1);
    802063fa:	1204b803          	ld	a6,288(s1)
    802063fe:	4785                	li	a5,1
    80206400:	0005071b          	sext.w	a4,a0
    80206404:	fcc40693          	addi	a3,s0,-52
    80206408:	4601                	li	a2,0
    8020640a:	4581                	li	a1,0
    8020640c:	10c82503          	lw	a0,268(a6)
    80206410:	fffff097          	auipc	ra,0xfffff
    80206414:	32e080e7          	jalr	814(ra) # 8020573e <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    80206418:	fcc42583          	lw	a1,-52(s0)
    8020641c:	fbf5f593          	andi	a1,a1,-65
    80206420:	fcb42623          	sw	a1,-52(s0)
    off = reloc_clus(entry->parent, entry->off + (entcnt << 5), 0);
    80206424:	0055959b          	slliw	a1,a1,0x5
    80206428:	11c4a783          	lw	a5,284(s1)
    8020642c:	4601                	li	a2,0
    8020642e:	9dbd                	addw	a1,a1,a5
    80206430:	1204b503          	ld	a0,288(s1)
    80206434:	fffff097          	auipc	ra,0xfffff
    80206438:	202080e7          	jalr	514(ra) # 80205636 <reloc_clus>
    8020643c:	0005099b          	sext.w	s3,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64)&de, off, sizeof(de));
    80206440:	1204b503          	ld	a0,288(s1)
    80206444:	02000793          	li	a5,32
    80206448:	874e                	mv	a4,s3
    8020644a:	fa840913          	addi	s2,s0,-88
    8020644e:	86ca                	mv	a3,s2
    80206450:	4601                	li	a2,0
    80206452:	4581                	li	a1,0
    80206454:	10c52503          	lw	a0,268(a0)
    80206458:	fffff097          	auipc	ra,0xfffff
    8020645c:	2e6080e7          	jalr	742(ra) # 8020573e <rw_clus>
    de.sne.fst_clus_hi = (uint16)(entry->first_clus >> 16);
    80206460:	1044a783          	lw	a5,260(s1)
    80206464:	0107d71b          	srliw	a4,a5,0x10
    80206468:	fae41e23          	sh	a4,-68(s0)
    de.sne.fst_clus_lo = (uint16)(entry->first_clus & 0xffff);
    8020646c:	fcf41123          	sh	a5,-62(s0)
    de.sne.file_size = entry->file_size;
    80206470:	1084a783          	lw	a5,264(s1)
    80206474:	fcf42223          	sw	a5,-60(s0)
    rw_clus(entry->parent->cur_clus, 1, 0, (uint64)&de, off, sizeof(de));
    80206478:	1204b503          	ld	a0,288(s1)
    8020647c:	02000793          	li	a5,32
    80206480:	874e                	mv	a4,s3
    80206482:	86ca                	mv	a3,s2
    80206484:	4601                	li	a2,0
    80206486:	4585                	li	a1,1
    80206488:	10c52503          	lw	a0,268(a0)
    8020648c:	fffff097          	auipc	ra,0xfffff
    80206490:	2b2080e7          	jalr	690(ra) # 8020573e <rw_clus>
    entry->dirty = 0;
    80206494:	10048aa3          	sb	zero,277(s1)
    80206498:	bf3d                	j	802063d6 <eupdate+0x20>
    8020649a:	8082                	ret

000000008020649c <eremove>:
    if (entry->valid != 1) { return; }
    8020649c:	11651703          	lh	a4,278(a0)
    802064a0:	4785                	li	a5,1
    802064a2:	00f70363          	beq	a4,a5,802064a8 <eremove+0xc>
    802064a6:	8082                	ret
{
    802064a8:	715d                	addi	sp,sp,-80
    802064aa:	e486                	sd	ra,72(sp)
    802064ac:	e0a2                	sd	s0,64(sp)
    802064ae:	fc26                	sd	s1,56(sp)
    802064b0:	f84a                	sd	s2,48(sp)
    802064b2:	f44e                	sd	s3,40(sp)
    802064b4:	f052                	sd	s4,32(sp)
    802064b6:	ec56                	sd	s5,24(sp)
    802064b8:	0880                	addi	s0,sp,80
    802064ba:	89aa                	mv	s3,a0
    uint entcnt = 0;
    802064bc:	fa042e23          	sw	zero,-68(s0)
    uint32 off = entry->off;
    802064c0:	11c52a03          	lw	s4,284(a0)
    uint32 off2 = reloc_clus(entry->parent, off, 0);
    802064c4:	4601                	li	a2,0
    802064c6:	85d2                	mv	a1,s4
    802064c8:	12053503          	ld	a0,288(a0)
    802064cc:	fffff097          	auipc	ra,0xfffff
    802064d0:	16a080e7          	jalr	362(ra) # 80205636 <reloc_clus>
    802064d4:	0005049b          	sext.w	s1,a0
    rw_clus(entry->parent->cur_clus, 0, 0, (uint64) &entcnt, off2, 1);
    802064d8:	1209b503          	ld	a0,288(s3)
    802064dc:	4785                	li	a5,1
    802064de:	8726                	mv	a4,s1
    802064e0:	fbc40693          	addi	a3,s0,-68
    802064e4:	4601                	li	a2,0
    802064e6:	4581                	li	a1,0
    802064e8:	10c52503          	lw	a0,268(a0)
    802064ec:	fffff097          	auipc	ra,0xfffff
    802064f0:	252080e7          	jalr	594(ra) # 8020573e <rw_clus>
    entcnt &= ~LAST_LONG_ENTRY;
    802064f4:	fbc42783          	lw	a5,-68(s0)
    802064f8:	fbf7f793          	andi	a5,a5,-65
    802064fc:	faf42e23          	sw	a5,-68(s0)
    uint8 flag = EMPTY_ENTRY;
    80206500:	5795                	li	a5,-27
    80206502:	faf40da3          	sb	a5,-69(s0)
    for (int i = 0; i <= entcnt; i++) {
    80206506:	4901                	li	s2,0
        rw_clus(entry->parent->cur_clus, 1, 0, (uint64) &flag, off2, 1);
    80206508:	fbb40a93          	addi	s5,s0,-69
    8020650c:	1209b503          	ld	a0,288(s3)
    80206510:	4785                	li	a5,1
    80206512:	8726                	mv	a4,s1
    80206514:	86d6                	mv	a3,s5
    80206516:	4601                	li	a2,0
    80206518:	4585                	li	a1,1
    8020651a:	10c52503          	lw	a0,268(a0)
    8020651e:	fffff097          	auipc	ra,0xfffff
    80206522:	220080e7          	jalr	544(ra) # 8020573e <rw_clus>
        off += 32;
    80206526:	020a0a1b          	addiw	s4,s4,32
        off2 = reloc_clus(entry->parent, off, 0);
    8020652a:	4601                	li	a2,0
    8020652c:	85d2                	mv	a1,s4
    8020652e:	1209b503          	ld	a0,288(s3)
    80206532:	fffff097          	auipc	ra,0xfffff
    80206536:	104080e7          	jalr	260(ra) # 80205636 <reloc_clus>
    8020653a:	0005049b          	sext.w	s1,a0
    for (int i = 0; i <= entcnt; i++) {
    8020653e:	0019079b          	addiw	a5,s2,1
    80206542:	0007891b          	sext.w	s2,a5
    80206546:	fbc42703          	lw	a4,-68(s0)
    8020654a:	fd2771e3          	bgeu	a4,s2,8020650c <eremove+0x70>
    entry->valid = -1;
    8020654e:	57fd                	li	a5,-1
    80206550:	10f99b23          	sh	a5,278(s3)
}
    80206554:	60a6                	ld	ra,72(sp)
    80206556:	6406                	ld	s0,64(sp)
    80206558:	74e2                	ld	s1,56(sp)
    8020655a:	7942                	ld	s2,48(sp)
    8020655c:	79a2                	ld	s3,40(sp)
    8020655e:	7a02                	ld	s4,32(sp)
    80206560:	6ae2                	ld	s5,24(sp)
    80206562:	6161                	addi	sp,sp,80
    80206564:	8082                	ret

0000000080206566 <etrunc>:
{
    80206566:	7179                	addi	sp,sp,-48
    80206568:	f406                	sd	ra,40(sp)
    8020656a:	f022                	sd	s0,32(sp)
    8020656c:	ec26                	sd	s1,24(sp)
    8020656e:	e84a                	sd	s2,16(sp)
    80206570:	e44e                	sd	s3,8(sp)
    80206572:	e052                	sd	s4,0(sp)
    80206574:	1800                	addi	s0,sp,48
    80206576:	8a2a                	mv	s4,a0
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    80206578:	10452483          	lw	s1,260(a0)
    8020657c:	ffe4871b          	addiw	a4,s1,-2
    80206580:	100007b7          	lui	a5,0x10000
    80206584:	17d5                	addi	a5,a5,-11 # ffffff5 <_entry-0x7020000b>
    80206586:	02e7e663          	bltu	a5,a4,802065b2 <etrunc+0x4c>
    8020658a:	89be                	mv	s3,a5
        uint32 next = read_fat(clus);
    8020658c:	0004891b          	sext.w	s2,s1
    80206590:	8526                	mv	a0,s1
    80206592:	fffff097          	auipc	ra,0xfffff
    80206596:	e6c080e7          	jalr	-404(ra) # 802053fe <read_fat>
    8020659a:	0005049b          	sext.w	s1,a0
    write_fat(cluster, 0);
    8020659e:	4581                	li	a1,0
    802065a0:	854a                	mv	a0,s2
    802065a2:	fffff097          	auipc	ra,0xfffff
    802065a6:	014080e7          	jalr	20(ra) # 802055b6 <write_fat>
    for (uint32 clus = entry->first_clus; clus >= 2 && clus < FAT32_EOC; ) {
    802065aa:	ffe4879b          	addiw	a5,s1,-2
    802065ae:	fcf9ffe3          	bgeu	s3,a5,8020658c <etrunc+0x26>
    entry->file_size = 0;
    802065b2:	100a2423          	sw	zero,264(s4)
    entry->first_clus = 0;
    802065b6:	100a2223          	sw	zero,260(s4)
    entry->dirty = 1;
    802065ba:	4785                	li	a5,1
    802065bc:	10fa0aa3          	sb	a5,277(s4)
}
    802065c0:	70a2                	ld	ra,40(sp)
    802065c2:	7402                	ld	s0,32(sp)
    802065c4:	64e2                	ld	s1,24(sp)
    802065c6:	6942                	ld	s2,16(sp)
    802065c8:	69a2                	ld	s3,8(sp)
    802065ca:	6a02                	ld	s4,0(sp)
    802065cc:	6145                	addi	sp,sp,48
    802065ce:	8082                	ret

00000000802065d0 <elock>:
{
    802065d0:	1141                	addi	sp,sp,-16
    802065d2:	e406                	sd	ra,8(sp)
    802065d4:	e022                	sd	s0,0(sp)
    802065d6:	0800                	addi	s0,sp,16
    if (entry == 0 || entry->ref < 1)
    802065d8:	cd19                	beqz	a0,802065f6 <elock+0x26>
    802065da:	11852783          	lw	a5,280(a0)
    802065de:	00f05c63          	blez	a5,802065f6 <elock+0x26>
    acquiresleep(&entry->lock);
    802065e2:	13850513          	addi	a0,a0,312
    802065e6:	ffffd097          	auipc	ra,0xffffd
    802065ea:	350080e7          	jalr	848(ra) # 80203936 <acquiresleep>
}
    802065ee:	60a2                	ld	ra,8(sp)
    802065f0:	6402                	ld	s0,0(sp)
    802065f2:	0141                	addi	sp,sp,16
    802065f4:	8082                	ret
        panic("elock");
    802065f6:	00004517          	auipc	a0,0x4
    802065fa:	82a50513          	addi	a0,a0,-2006 # 80209e20 <digits+0xaa0>
    802065fe:	ffffa097          	auipc	ra,0xffffa
    80206602:	b46080e7          	jalr	-1210(ra) # 80200144 <panic>

0000000080206606 <eunlock>:
{
    80206606:	1101                	addi	sp,sp,-32
    80206608:	ec06                	sd	ra,24(sp)
    8020660a:	e822                	sd	s0,16(sp)
    8020660c:	e426                	sd	s1,8(sp)
    8020660e:	e04a                	sd	s2,0(sp)
    80206610:	1000                	addi	s0,sp,32
    if (entry == 0 || !holdingsleep(&entry->lock) || entry->ref < 1)
    80206612:	c90d                	beqz	a0,80206644 <eunlock+0x3e>
    80206614:	84aa                	mv	s1,a0
    80206616:	13850913          	addi	s2,a0,312
    8020661a:	854a                	mv	a0,s2
    8020661c:	ffffd097          	auipc	ra,0xffffd
    80206620:	3b4080e7          	jalr	948(ra) # 802039d0 <holdingsleep>
    80206624:	c105                	beqz	a0,80206644 <eunlock+0x3e>
    80206626:	1184a783          	lw	a5,280(s1)
    8020662a:	00f05d63          	blez	a5,80206644 <eunlock+0x3e>
    releasesleep(&entry->lock);
    8020662e:	854a                	mv	a0,s2
    80206630:	ffffd097          	auipc	ra,0xffffd
    80206634:	35c080e7          	jalr	860(ra) # 8020398c <releasesleep>
}
    80206638:	60e2                	ld	ra,24(sp)
    8020663a:	6442                	ld	s0,16(sp)
    8020663c:	64a2                	ld	s1,8(sp)
    8020663e:	6902                	ld	s2,0(sp)
    80206640:	6105                	addi	sp,sp,32
    80206642:	8082                	ret
        panic("eunlock");
    80206644:	00003517          	auipc	a0,0x3
    80206648:	7e450513          	addi	a0,a0,2020 # 80209e28 <digits+0xaa8>
    8020664c:	ffffa097          	auipc	ra,0xffffa
    80206650:	af8080e7          	jalr	-1288(ra) # 80200144 <panic>

0000000080206654 <eput>:
{
    80206654:	1101                	addi	sp,sp,-32
    80206656:	ec06                	sd	ra,24(sp)
    80206658:	e822                	sd	s0,16(sp)
    8020665a:	e426                	sd	s1,8(sp)
    8020665c:	e04a                	sd	s2,0(sp)
    8020665e:	1000                	addi	s0,sp,32
    80206660:	84aa                	mv	s1,a0
    acquire(&ecache.lock);
    80206662:	00018517          	auipc	a0,0x18
    80206666:	f5650513          	addi	a0,a0,-170 # 8021e5b8 <ecache>
    8020666a:	ffffa097          	auipc	ra,0xffffa
    8020666e:	08a080e7          	jalr	138(ra) # 802006f4 <acquire>
    if (entry != &root && entry->valid != 0 && entry->ref == 1) {
    80206672:	00018797          	auipc	a5,0x18
    80206676:	dde78793          	addi	a5,a5,-546 # 8021e450 <root>
    8020667a:	00f48a63          	beq	s1,a5,8020668e <eput+0x3a>
    8020667e:	11649783          	lh	a5,278(s1)
    80206682:	c791                	beqz	a5,8020668e <eput+0x3a>
    80206684:	1184a703          	lw	a4,280(s1)
    80206688:	4785                	li	a5,1
    8020668a:	02f70563          	beq	a4,a5,802066b4 <eput+0x60>
    entry->ref--;
    8020668e:	1184a783          	lw	a5,280(s1)
    80206692:	37fd                	addiw	a5,a5,-1
    80206694:	10f4ac23          	sw	a5,280(s1)
    release(&ecache.lock);
    80206698:	00018517          	auipc	a0,0x18
    8020669c:	f2050513          	addi	a0,a0,-224 # 8021e5b8 <ecache>
    802066a0:	ffffa097          	auipc	ra,0xffffa
    802066a4:	0a8080e7          	jalr	168(ra) # 80200748 <release>
}
    802066a8:	60e2                	ld	ra,24(sp)
    802066aa:	6442                	ld	s0,16(sp)
    802066ac:	64a2                	ld	s1,8(sp)
    802066ae:	6902                	ld	s2,0(sp)
    802066b0:	6105                	addi	sp,sp,32
    802066b2:	8082                	ret
        acquiresleep(&entry->lock);
    802066b4:	13848913          	addi	s2,s1,312
    802066b8:	854a                	mv	a0,s2
    802066ba:	ffffd097          	auipc	ra,0xffffd
    802066be:	27c080e7          	jalr	636(ra) # 80203936 <acquiresleep>
        entry->next->prev = entry->prev;
    802066c2:	1284b703          	ld	a4,296(s1)
    802066c6:	1304b783          	ld	a5,304(s1)
    802066ca:	12f73823          	sd	a5,304(a4)
        entry->prev->next = entry->next;
    802066ce:	1284b703          	ld	a4,296(s1)
    802066d2:	12e7b423          	sd	a4,296(a5)
        entry->next = root.next;
    802066d6:	00018797          	auipc	a5,0x18
    802066da:	d5278793          	addi	a5,a5,-686 # 8021e428 <fat>
    802066de:	1507b703          	ld	a4,336(a5)
    802066e2:	12e4b423          	sd	a4,296(s1)
        entry->prev = &root;
    802066e6:	00018697          	auipc	a3,0x18
    802066ea:	d6a68693          	addi	a3,a3,-662 # 8021e450 <root>
    802066ee:	12d4b823          	sd	a3,304(s1)
        root.next->prev = entry;
    802066f2:	12973823          	sd	s1,304(a4)
        root.next = entry;
    802066f6:	1497b823          	sd	s1,336(a5)
        release(&ecache.lock);
    802066fa:	00018517          	auipc	a0,0x18
    802066fe:	ebe50513          	addi	a0,a0,-322 # 8021e5b8 <ecache>
    80206702:	ffffa097          	auipc	ra,0xffffa
    80206706:	046080e7          	jalr	70(ra) # 80200748 <release>
        if (entry->valid == -1) {       // this means some one has called eremove()
    8020670a:	11649703          	lh	a4,278(s1)
    8020670e:	57fd                	li	a5,-1
    80206710:	06f70863          	beq	a4,a5,80206780 <eput+0x12c>
            elock(entry->parent);
    80206714:	1204b503          	ld	a0,288(s1)
    80206718:	00000097          	auipc	ra,0x0
    8020671c:	eb8080e7          	jalr	-328(ra) # 802065d0 <elock>
            eupdate(entry);
    80206720:	8526                	mv	a0,s1
    80206722:	00000097          	auipc	ra,0x0
    80206726:	c94080e7          	jalr	-876(ra) # 802063b6 <eupdate>
            eunlock(entry->parent);
    8020672a:	1204b503          	ld	a0,288(s1)
    8020672e:	00000097          	auipc	ra,0x0
    80206732:	ed8080e7          	jalr	-296(ra) # 80206606 <eunlock>
        releasesleep(&entry->lock);
    80206736:	854a                	mv	a0,s2
    80206738:	ffffd097          	auipc	ra,0xffffd
    8020673c:	254080e7          	jalr	596(ra) # 8020398c <releasesleep>
        struct dirent *eparent = entry->parent;
    80206740:	1204b903          	ld	s2,288(s1)
        acquire(&ecache.lock);
    80206744:	00018517          	auipc	a0,0x18
    80206748:	e7450513          	addi	a0,a0,-396 # 8021e5b8 <ecache>
    8020674c:	ffffa097          	auipc	ra,0xffffa
    80206750:	fa8080e7          	jalr	-88(ra) # 802006f4 <acquire>
        entry->ref--;
    80206754:	1184a783          	lw	a5,280(s1)
    80206758:	37fd                	addiw	a5,a5,-1
    8020675a:	10f4ac23          	sw	a5,280(s1)
        release(&ecache.lock);
    8020675e:	00018517          	auipc	a0,0x18
    80206762:	e5a50513          	addi	a0,a0,-422 # 8021e5b8 <ecache>
    80206766:	ffffa097          	auipc	ra,0xffffa
    8020676a:	fe2080e7          	jalr	-30(ra) # 80200748 <release>
        if (entry->ref == 0) {
    8020676e:	1184a783          	lw	a5,280(s1)
    80206772:	fb9d                	bnez	a5,802066a8 <eput+0x54>
            eput(eparent);
    80206774:	854a                	mv	a0,s2
    80206776:	00000097          	auipc	ra,0x0
    8020677a:	ede080e7          	jalr	-290(ra) # 80206654 <eput>
    8020677e:	b72d                	j	802066a8 <eput+0x54>
            etrunc(entry);
    80206780:	8526                	mv	a0,s1
    80206782:	00000097          	auipc	ra,0x0
    80206786:	de4080e7          	jalr	-540(ra) # 80206566 <etrunc>
    8020678a:	b775                	j	80206736 <eput+0xe2>

000000008020678c <estat>:
{
    8020678c:	1101                	addi	sp,sp,-32
    8020678e:	ec06                	sd	ra,24(sp)
    80206790:	e822                	sd	s0,16(sp)
    80206792:	e426                	sd	s1,8(sp)
    80206794:	e04a                	sd	s2,0(sp)
    80206796:	1000                	addi	s0,sp,32
    80206798:	892a                	mv	s2,a0
    8020679a:	84ae                	mv	s1,a1
    strncpy(st->name, de->filename, STAT_MAX_NAME);
    8020679c:	02000613          	li	a2,32
    802067a0:	85aa                	mv	a1,a0
    802067a2:	8526                	mv	a0,s1
    802067a4:	ffffa097          	auipc	ra,0xffffa
    802067a8:	100080e7          	jalr	256(ra) # 802008a4 <strncpy>
    st->type = (de->attribute & ATTR_DIRECTORY) ? T_DIR : T_FILE;
    802067ac:	10094783          	lbu	a5,256(s2)
    802067b0:	8bc1                	andi	a5,a5,16
    802067b2:	0017b793          	seqz	a5,a5
    802067b6:	0785                	addi	a5,a5,1
    802067b8:	02f49423          	sh	a5,40(s1)
    st->dev = de->dev;
    802067bc:	11494783          	lbu	a5,276(s2)
    802067c0:	d0dc                	sw	a5,36(s1)
    st->size = de->file_size;
    802067c2:	10896783          	lwu	a5,264(s2)
    802067c6:	f89c                	sd	a5,48(s1)
}
    802067c8:	60e2                	ld	ra,24(sp)
    802067ca:	6442                	ld	s0,16(sp)
    802067cc:	64a2                	ld	s1,8(sp)
    802067ce:	6902                	ld	s2,0(sp)
    802067d0:	6105                	addi	sp,sp,32
    802067d2:	8082                	ret

00000000802067d4 <enext>:
 * @return  -1      meet the end of dir
 *          0       find empty slots
 *          1       find a file with all its entries
 */
int enext(struct dirent *dp, struct dirent *ep, uint off, int *count)
{
    802067d4:	7119                	addi	sp,sp,-128
    802067d6:	fc86                	sd	ra,120(sp)
    802067d8:	f8a2                	sd	s0,112(sp)
    802067da:	f4a6                	sd	s1,104(sp)
    802067dc:	f0ca                	sd	s2,96(sp)
    802067de:	ecce                	sd	s3,88(sp)
    802067e0:	e8d2                	sd	s4,80(sp)
    802067e2:	e4d6                	sd	s5,72(sp)
    802067e4:	e0da                	sd	s6,64(sp)
    802067e6:	fc5e                	sd	s7,56(sp)
    802067e8:	f862                	sd	s8,48(sp)
    802067ea:	f466                	sd	s9,40(sp)
    802067ec:	0100                	addi	s0,sp,128
    if (!(dp->attribute & ATTR_DIRECTORY))
    802067ee:	10054783          	lbu	a5,256(a0)
    802067f2:	8bc1                	andi	a5,a5,16
    802067f4:	cf95                	beqz	a5,80206830 <enext+0x5c>
    802067f6:	892a                	mv	s2,a0
    802067f8:	89ae                	mv	s3,a1
    802067fa:	84b2                	mv	s1,a2
    802067fc:	8ab6                	mv	s5,a3
        panic("enext not dir");
    if (ep->valid)
    802067fe:	11659783          	lh	a5,278(a1)
    80206802:	ef9d                	bnez	a5,80206840 <enext+0x6c>
        panic("enext ep valid");
    if (off % 32)
    80206804:	01f67793          	andi	a5,a2,31
    80206808:	e7a1                	bnez	a5,80206850 <enext+0x7c>
        panic("enext not align");
    if (dp->valid != 1) { return -1; }
    8020680a:	11651703          	lh	a4,278(a0)
    8020680e:	4785                	li	a5,1
    80206810:	557d                	li	a0,-1
    80206812:	04f70763          	beq	a4,a5,80206860 <enext+0x8c>
            read_entry_info(ep, &de);
            return 1;
        }
    }
    return -1;
}
    80206816:	70e6                	ld	ra,120(sp)
    80206818:	7446                	ld	s0,112(sp)
    8020681a:	74a6                	ld	s1,104(sp)
    8020681c:	7906                	ld	s2,96(sp)
    8020681e:	69e6                	ld	s3,88(sp)
    80206820:	6a46                	ld	s4,80(sp)
    80206822:	6aa6                	ld	s5,72(sp)
    80206824:	6b06                	ld	s6,64(sp)
    80206826:	7be2                	ld	s7,56(sp)
    80206828:	7c42                	ld	s8,48(sp)
    8020682a:	7ca2                	ld	s9,40(sp)
    8020682c:	6109                	addi	sp,sp,128
    8020682e:	8082                	ret
        panic("enext not dir");
    80206830:	00003517          	auipc	a0,0x3
    80206834:	60050513          	addi	a0,a0,1536 # 80209e30 <digits+0xab0>
    80206838:	ffffa097          	auipc	ra,0xffffa
    8020683c:	90c080e7          	jalr	-1780(ra) # 80200144 <panic>
        panic("enext ep valid");
    80206840:	00003517          	auipc	a0,0x3
    80206844:	60050513          	addi	a0,a0,1536 # 80209e40 <digits+0xac0>
    80206848:	ffffa097          	auipc	ra,0xffffa
    8020684c:	8fc080e7          	jalr	-1796(ra) # 80200144 <panic>
        panic("enext not align");
    80206850:	00003517          	auipc	a0,0x3
    80206854:	60050513          	addi	a0,a0,1536 # 80209e50 <digits+0xad0>
    80206858:	ffffa097          	auipc	ra,0xffffa
    8020685c:	8ec080e7          	jalr	-1812(ra) # 80200144 <panic>
    memset(ep->filename, 0, FAT32_MAX_FILENAME + 1);
    80206860:	10000613          	li	a2,256
    80206864:	4581                	li	a1,0
    80206866:	854e                	mv	a0,s3
    80206868:	ffffa097          	auipc	ra,0xffffa
    8020686c:	f28080e7          	jalr	-216(ra) # 80200790 <memset>
    int cnt = 0;
    80206870:	4b01                	li	s6,0
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    80206872:	5bfd                	li	s7,-1
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    80206874:	f8040a13          	addi	s4,s0,-128
        if (de.lne.order == EMPTY_ENTRY) {
    80206878:	0e500c13          	li	s8,229
        if (de.lne.attr == ATTR_LONG_NAME) {
    8020687c:	4cbd                	li	s9,15
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    8020687e:	a03d                	j	802068ac <enext+0xd8>
            cnt++;
    80206880:	2b05                	addiw	s6,s6,1
            continue;
    80206882:	a01d                	j	802068a8 <enext+0xd4>
            *count = cnt;
    80206884:	016aa023          	sw	s6,0(s5)
            return 0;
    80206888:	4501                	li	a0,0
    8020688a:	b771                	j	80206816 <enext+0x42>
            read_entry_name(ep->filename + (lcnt - 1) * CHAR_LONG_NAME, &de);
    8020688c:	fff7079b          	addiw	a5,a4,-1
    80206890:	0017951b          	slliw	a0,a5,0x1
    80206894:	9d3d                	addw	a0,a0,a5
    80206896:	0025151b          	slliw	a0,a0,0x2
    8020689a:	9d3d                	addw	a0,a0,a5
    8020689c:	85d2                	mv	a1,s4
    8020689e:	954e                	add	a0,a0,s3
    802068a0:	fffff097          	auipc	ra,0xfffff
    802068a4:	0f8080e7          	jalr	248(ra) # 80205998 <read_entry_name>
    for (int off2; (off2 = reloc_clus(dp, off, 0)) != -1; off += 32) {
    802068a8:	0204849b          	addiw	s1,s1,32
    802068ac:	4601                	li	a2,0
    802068ae:	85a6                	mv	a1,s1
    802068b0:	854a                	mv	a0,s2
    802068b2:	fffff097          	auipc	ra,0xfffff
    802068b6:	d84080e7          	jalr	-636(ra) # 80205636 <reloc_clus>
    802068ba:	f5750ee3          	beq	a0,s7,80206816 <enext+0x42>
        if (rw_clus(dp->cur_clus, 0, 0, (uint64)&de, off2, 32) != 32 || de.lne.order == END_OF_ENTRY) {
    802068be:	02000793          	li	a5,32
    802068c2:	0005071b          	sext.w	a4,a0
    802068c6:	86d2                	mv	a3,s4
    802068c8:	4601                	li	a2,0
    802068ca:	4581                	li	a1,0
    802068cc:	10c92503          	lw	a0,268(s2)
    802068d0:	fffff097          	auipc	ra,0xfffff
    802068d4:	e6e080e7          	jalr	-402(ra) # 8020573e <rw_clus>
    802068d8:	2501                	sext.w	a0,a0
    802068da:	02000793          	li	a5,32
    802068de:	06f51c63          	bne	a0,a5,80206956 <enext+0x182>
    802068e2:	f8044783          	lbu	a5,-128(s0)
    802068e6:	cbb5                	beqz	a5,8020695a <enext+0x186>
        if (de.lne.order == EMPTY_ENTRY) {
    802068e8:	f9878ce3          	beq	a5,s8,80206880 <enext+0xac>
        } else if (cnt) {
    802068ec:	f80b1ce3          	bnez	s6,80206884 <enext+0xb0>
        if (de.lne.attr == ATTR_LONG_NAME) {
    802068f0:	f8b44703          	lbu	a4,-117(s0)
    802068f4:	01971d63          	bne	a4,s9,8020690e <enext+0x13a>
            int lcnt = de.lne.order & ~LAST_LONG_ENTRY;
    802068f8:	0bf7f713          	andi	a4,a5,191
            if (de.lne.order & LAST_LONG_ENTRY) {
    802068fc:	0407f793          	andi	a5,a5,64
    80206900:	d7d1                	beqz	a5,8020688c <enext+0xb8>
                *count = lcnt + 1;                              // plus the s-n-e;
    80206902:	0017079b          	addiw	a5,a4,1
    80206906:	00faa023          	sw	a5,0(s5)
                count = 0;
    8020690a:	4a81                	li	s5,0
    8020690c:	b741                	j	8020688c <enext+0xb8>
            if (count) {
    8020690e:	000a8c63          	beqz	s5,80206926 <enext+0x152>
                *count = 1;
    80206912:	4785                	li	a5,1
    80206914:	00faa023          	sw	a5,0(s5)
                read_entry_name(ep->filename, &de);
    80206918:	f8040593          	addi	a1,s0,-128
    8020691c:	854e                	mv	a0,s3
    8020691e:	fffff097          	auipc	ra,0xfffff
    80206922:	07a080e7          	jalr	122(ra) # 80205998 <read_entry_name>
    entry->attribute = d->sne.attr;
    80206926:	f8b44783          	lbu	a5,-117(s0)
    8020692a:	10f98023          	sb	a5,256(s3)
    entry->first_clus = ((uint32)d->sne.fst_clus_hi << 16) | d->sne.fst_clus_lo;
    8020692e:	f9445783          	lhu	a5,-108(s0)
    80206932:	0107979b          	slliw	a5,a5,0x10
    80206936:	f9a45703          	lhu	a4,-102(s0)
    8020693a:	8fd9                	or	a5,a5,a4
    8020693c:	2781                	sext.w	a5,a5
    8020693e:	10f9a223          	sw	a5,260(s3)
    entry->file_size = d->sne.file_size;
    80206942:	f9c42703          	lw	a4,-100(s0)
    80206946:	10e9a423          	sw	a4,264(s3)
    entry->cur_clus = entry->first_clus;
    8020694a:	10f9a623          	sw	a5,268(s3)
    entry->clus_cnt = 0;
    8020694e:	1009a823          	sw	zero,272(s3)
            return 1;
    80206952:	4505                	li	a0,1
}
    80206954:	b5c9                	j	80206816 <enext+0x42>
            return -1;
    80206956:	557d                	li	a0,-1
    80206958:	bd7d                	j	80206816 <enext+0x42>
    8020695a:	557d                	li	a0,-1
    8020695c:	bd6d                	j	80206816 <enext+0x42>

000000008020695e <dirlookup>:
 * @param   dp          entry of a directory file
 * @param   filename    target filename
 * @param   poff        offset of proper empty entry slots from the beginning of the dir
 */
struct dirent *dirlookup(struct dirent *dp, char *filename, uint *poff)
{
    8020695e:	711d                	addi	sp,sp,-96
    80206960:	ec86                	sd	ra,88(sp)
    80206962:	e8a2                	sd	s0,80(sp)
    80206964:	e4a6                	sd	s1,72(sp)
    80206966:	e0ca                	sd	s2,64(sp)
    80206968:	fc4e                	sd	s3,56(sp)
    8020696a:	f852                	sd	s4,48(sp)
    8020696c:	f456                	sd	s5,40(sp)
    8020696e:	f05a                	sd	s6,32(sp)
    80206970:	ec5e                	sd	s7,24(sp)
    80206972:	1080                	addi	s0,sp,96
    if (!(dp->attribute & ATTR_DIRECTORY))
    80206974:	10054783          	lbu	a5,256(a0)
    80206978:	8bc1                	andi	a5,a5,16
    8020697a:	cbb1                	beqz	a5,802069ce <dirlookup+0x70>
    8020697c:	84aa                	mv	s1,a0
    8020697e:	89ae                	mv	s3,a1
    80206980:	8ab2                	mv	s5,a2
        panic("dirlookup not DIR");
    if (strncmp(filename, ".", FAT32_MAX_FILENAME) == 0) {
    80206982:	0ff00613          	li	a2,255
    80206986:	00003597          	auipc	a1,0x3
    8020698a:	4f258593          	addi	a1,a1,1266 # 80209e78 <digits+0xaf8>
    8020698e:	854e                	mv	a0,s3
    80206990:	ffffa097          	auipc	ra,0xffffa
    80206994:	ed8080e7          	jalr	-296(ra) # 80200868 <strncmp>
    80206998:	c139                	beqz	a0,802069de <dirlookup+0x80>
        return edup(dp);
    } else if (strncmp(filename, "..", FAT32_MAX_FILENAME) == 0) {
    8020699a:	0ff00613          	li	a2,255
    8020699e:	00003597          	auipc	a1,0x3
    802069a2:	4e258593          	addi	a1,a1,1250 # 80209e80 <digits+0xb00>
    802069a6:	854e                	mv	a0,s3
    802069a8:	ffffa097          	auipc	ra,0xffffa
    802069ac:	ec0080e7          	jalr	-320(ra) # 80200868 <strncmp>
    802069b0:	e125                	bnez	a0,80206a10 <dirlookup+0xb2>
        if (dp == &root) {
    802069b2:	00018797          	auipc	a5,0x18
    802069b6:	a9e78793          	addi	a5,a5,-1378 # 8021e450 <root>
    802069ba:	04f48463          	beq	s1,a5,80206a02 <dirlookup+0xa4>
            return edup(&root);
        }
        return edup(dp->parent);
    802069be:	1204b503          	ld	a0,288(s1)
    802069c2:	00000097          	auipc	ra,0x0
    802069c6:	9b0080e7          	jalr	-1616(ra) # 80206372 <edup>
    802069ca:	892a                	mv	s2,a0
    802069cc:	a839                	j	802069ea <dirlookup+0x8c>
        panic("dirlookup not DIR");
    802069ce:	00003517          	auipc	a0,0x3
    802069d2:	49250513          	addi	a0,a0,1170 # 80209e60 <digits+0xae0>
    802069d6:	ffff9097          	auipc	ra,0xffff9
    802069da:	76e080e7          	jalr	1902(ra) # 80200144 <panic>
        return edup(dp);
    802069de:	8526                	mv	a0,s1
    802069e0:	00000097          	auipc	ra,0x0
    802069e4:	992080e7          	jalr	-1646(ra) # 80206372 <edup>
    802069e8:	892a                	mv	s2,a0
    if (poff) {
        *poff = off;
    }
    eput(ep);
    return NULL;
}
    802069ea:	854a                	mv	a0,s2
    802069ec:	60e6                	ld	ra,88(sp)
    802069ee:	6446                	ld	s0,80(sp)
    802069f0:	64a6                	ld	s1,72(sp)
    802069f2:	6906                	ld	s2,64(sp)
    802069f4:	79e2                	ld	s3,56(sp)
    802069f6:	7a42                	ld	s4,48(sp)
    802069f8:	7aa2                	ld	s5,40(sp)
    802069fa:	7b02                	ld	s6,32(sp)
    802069fc:	6be2                	ld	s7,24(sp)
    802069fe:	6125                	addi	sp,sp,96
    80206a00:	8082                	ret
            return edup(&root);
    80206a02:	853e                	mv	a0,a5
    80206a04:	00000097          	auipc	ra,0x0
    80206a08:	96e080e7          	jalr	-1682(ra) # 80206372 <edup>
    80206a0c:	892a                	mv	s2,a0
    80206a0e:	bff1                	j	802069ea <dirlookup+0x8c>
    if (dp->valid != 1) {
    80206a10:	11649703          	lh	a4,278(s1)
    80206a14:	4785                	li	a5,1
        return NULL;
    80206a16:	4901                	li	s2,0
    if (dp->valid != 1) {
    80206a18:	fcf719e3          	bne	a4,a5,802069ea <dirlookup+0x8c>
    struct dirent *ep = eget(dp, filename);
    80206a1c:	85ce                	mv	a1,s3
    80206a1e:	8526                	mv	a0,s1
    80206a20:	fffff097          	auipc	ra,0xfffff
    80206a24:	e6a080e7          	jalr	-406(ra) # 8020588a <eget>
    80206a28:	892a                	mv	s2,a0
    if (ep->valid == 1) { return ep; }                               // ecache hits
    80206a2a:	11651703          	lh	a4,278(a0)
    80206a2e:	4785                	li	a5,1
    80206a30:	faf70de3          	beq	a4,a5,802069ea <dirlookup+0x8c>
    int len = strlen(filename);
    80206a34:	854e                	mv	a0,s3
    80206a36:	ffffa097          	auipc	ra,0xffffa
    80206a3a:	ede080e7          	jalr	-290(ra) # 80200914 <strlen>
    int count = 0;
    80206a3e:	fa042623          	sw	zero,-84(s0)
    reloc_clus(dp, 0, 0);
    80206a42:	4601                	li	a2,0
    80206a44:	4581                	li	a1,0
    80206a46:	8526                	mv	a0,s1
    80206a48:	fffff097          	auipc	ra,0xfffff
    80206a4c:	bee080e7          	jalr	-1042(ra) # 80205636 <reloc_clus>
    uint off = 0;
    80206a50:	4a01                	li	s4,0
    while ((type = enext(dp, ep, off, &count) != -1)) {
    80206a52:	fac40b93          	addi	s7,s0,-84
    80206a56:	5b7d                	li	s6,-1
    80206a58:	86de                	mv	a3,s7
    80206a5a:	8652                	mv	a2,s4
    80206a5c:	85ca                	mv	a1,s2
    80206a5e:	8526                	mv	a0,s1
    80206a60:	00000097          	auipc	ra,0x0
    80206a64:	d74080e7          	jalr	-652(ra) # 802067d4 <enext>
    80206a68:	03650f63          	beq	a0,s6,80206aa6 <dirlookup+0x148>
        } else if (strncmp(filename, ep->filename, FAT32_MAX_FILENAME) == 0) {
    80206a6c:	0ff00613          	li	a2,255
    80206a70:	85ca                	mv	a1,s2
    80206a72:	854e                	mv	a0,s3
    80206a74:	ffffa097          	auipc	ra,0xffffa
    80206a78:	df4080e7          	jalr	-524(ra) # 80200868 <strncmp>
    80206a7c:	c901                	beqz	a0,80206a8c <dirlookup+0x12e>
        off += count << 5;
    80206a7e:	fac42783          	lw	a5,-84(s0)
    80206a82:	0057979b          	slliw	a5,a5,0x5
    80206a86:	01478a3b          	addw	s4,a5,s4
    80206a8a:	b7f9                	j	80206a58 <dirlookup+0xfa>
            ep->parent = edup(dp);
    80206a8c:	8526                	mv	a0,s1
    80206a8e:	00000097          	auipc	ra,0x0
    80206a92:	8e4080e7          	jalr	-1820(ra) # 80206372 <edup>
    80206a96:	12a93023          	sd	a0,288(s2)
            ep->off = off;
    80206a9a:	11492e23          	sw	s4,284(s2)
            ep->valid = 1;
    80206a9e:	4785                	li	a5,1
    80206aa0:	10f91b23          	sh	a5,278(s2)
            return ep;
    80206aa4:	b799                	j	802069ea <dirlookup+0x8c>
    if (poff) {
    80206aa6:	000a8463          	beqz	s5,80206aae <dirlookup+0x150>
        *poff = off;
    80206aaa:	014aa023          	sw	s4,0(s5)
    eput(ep);
    80206aae:	854a                	mv	a0,s2
    80206ab0:	00000097          	auipc	ra,0x0
    80206ab4:	ba4080e7          	jalr	-1116(ra) # 80206654 <eput>
    return NULL;
    80206ab8:	4901                	li	s2,0
    80206aba:	bf05                	j	802069ea <dirlookup+0x8c>

0000000080206abc <ealloc>:
{
    80206abc:	715d                	addi	sp,sp,-80
    80206abe:	e486                	sd	ra,72(sp)
    80206ac0:	e0a2                	sd	s0,64(sp)
    80206ac2:	fc26                	sd	s1,56(sp)
    80206ac4:	f84a                	sd	s2,48(sp)
    80206ac6:	f44e                	sd	s3,40(sp)
    80206ac8:	f052                	sd	s4,32(sp)
    80206aca:	ec56                	sd	s5,24(sp)
    80206acc:	0880                	addi	s0,sp,80
    80206ace:	892a                	mv	s2,a0
    if (!(dp->attribute & ATTR_DIRECTORY)) {
    80206ad0:	10054783          	lbu	a5,256(a0)
    80206ad4:	8bc1                	andi	a5,a5,16
    80206ad6:	c7b1                	beqz	a5,80206b22 <ealloc+0x66>
    80206ad8:	852e                	mv	a0,a1
    80206ada:	8a32                	mv	s4,a2
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80206adc:	11691703          	lh	a4,278(s2)
    80206ae0:	4785                	li	a5,1
        return NULL;
    80206ae2:	4481                	li	s1,0
    if (dp->valid != 1 || !(name = formatname(name))) {        // detect illegal character
    80206ae4:	02f71563          	bne	a4,a5,80206b0e <ealloc+0x52>
    80206ae8:	fffff097          	auipc	ra,0xfffff
    80206aec:	408080e7          	jalr	1032(ra) # 80205ef0 <formatname>
    80206af0:	89aa                	mv	s3,a0
    80206af2:	10050663          	beqz	a0,80206bfe <ealloc+0x142>
    uint off = 0;
    80206af6:	fa042e23          	sw	zero,-68(s0)
    if ((ep = dirlookup(dp, name, &off)) != 0) {      // entry exists
    80206afa:	fbc40613          	addi	a2,s0,-68
    80206afe:	85aa                	mv	a1,a0
    80206b00:	854a                	mv	a0,s2
    80206b02:	00000097          	auipc	ra,0x0
    80206b06:	e5c080e7          	jalr	-420(ra) # 8020695e <dirlookup>
    80206b0a:	84aa                	mv	s1,a0
    80206b0c:	c11d                	beqz	a0,80206b32 <ealloc+0x76>
}
    80206b0e:	8526                	mv	a0,s1
    80206b10:	60a6                	ld	ra,72(sp)
    80206b12:	6406                	ld	s0,64(sp)
    80206b14:	74e2                	ld	s1,56(sp)
    80206b16:	7942                	ld	s2,48(sp)
    80206b18:	79a2                	ld	s3,40(sp)
    80206b1a:	7a02                	ld	s4,32(sp)
    80206b1c:	6ae2                	ld	s5,24(sp)
    80206b1e:	6161                	addi	sp,sp,80
    80206b20:	8082                	ret
        panic("ealloc not dir");
    80206b22:	00003517          	auipc	a0,0x3
    80206b26:	36650513          	addi	a0,a0,870 # 80209e88 <digits+0xb08>
    80206b2a:	ffff9097          	auipc	ra,0xffff9
    80206b2e:	61a080e7          	jalr	1562(ra) # 80200144 <panic>
    ep = eget(dp, name);
    80206b32:	85ce                	mv	a1,s3
    80206b34:	854a                	mv	a0,s2
    80206b36:	fffff097          	auipc	ra,0xfffff
    80206b3a:	d54080e7          	jalr	-684(ra) # 8020588a <eget>
    80206b3e:	84aa                	mv	s1,a0
    elock(ep);
    80206b40:	00000097          	auipc	ra,0x0
    80206b44:	a90080e7          	jalr	-1392(ra) # 802065d0 <elock>
    ep->attribute = attr;
    80206b48:	11448023          	sb	s4,256(s1)
    ep->file_size = 0;
    80206b4c:	1004a423          	sw	zero,264(s1)
    ep->first_clus = 0;
    80206b50:	1004a223          	sw	zero,260(s1)
    ep->parent = edup(dp);
    80206b54:	854a                	mv	a0,s2
    80206b56:	00000097          	auipc	ra,0x0
    80206b5a:	81c080e7          	jalr	-2020(ra) # 80206372 <edup>
    80206b5e:	12a4b023          	sd	a0,288(s1)
    ep->off = off;
    80206b62:	fbc42a83          	lw	s5,-68(s0)
    80206b66:	1154ae23          	sw	s5,284(s1)
    ep->clus_cnt = 0;
    80206b6a:	1004a823          	sw	zero,272(s1)
    ep->cur_clus = 0;
    80206b6e:	1004a623          	sw	zero,268(s1)
    ep->dirty = 0;
    80206b72:	10048aa3          	sb	zero,277(s1)
    strncpy(ep->filename, name, FAT32_MAX_FILENAME);
    80206b76:	0ff00613          	li	a2,255
    80206b7a:	85ce                	mv	a1,s3
    80206b7c:	8526                	mv	a0,s1
    80206b7e:	ffffa097          	auipc	ra,0xffffa
    80206b82:	d26080e7          	jalr	-730(ra) # 802008a4 <strncpy>
    ep->filename[FAT32_MAX_FILENAME] = '\0';
    80206b86:	0e048fa3          	sb	zero,255(s1)
    if (attr == ATTR_DIRECTORY) {    // generate "." and ".." for ep
    80206b8a:	47c1                	li	a5,16
    80206b8c:	02fa0863          	beq	s4,a5,80206bbc <ealloc+0x100>
        ep->attribute |= ATTR_ARCHIVE;
    80206b90:	1004c783          	lbu	a5,256(s1)
    80206b94:	0207e793          	ori	a5,a5,32
    80206b98:	10f48023          	sb	a5,256(s1)
    emake(dp, ep, off);
    80206b9c:	8656                	mv	a2,s5
    80206b9e:	85a6                	mv	a1,s1
    80206ba0:	854a                	mv	a0,s2
    80206ba2:	fffff097          	auipc	ra,0xfffff
    80206ba6:	406080e7          	jalr	1030(ra) # 80205fa8 <emake>
    ep->valid = 1;
    80206baa:	4785                	li	a5,1
    80206bac:	10f49b23          	sh	a5,278(s1)
    eunlock(ep);
    80206bb0:	8526                	mv	a0,s1
    80206bb2:	00000097          	auipc	ra,0x0
    80206bb6:	a54080e7          	jalr	-1452(ra) # 80206606 <eunlock>
    return ep;
    80206bba:	bf91                	j	80206b0e <ealloc+0x52>
        ep->attribute |= ATTR_DIRECTORY;
    80206bbc:	1004c783          	lbu	a5,256(s1)
    80206bc0:	0107e793          	ori	a5,a5,16
    80206bc4:	10f48023          	sb	a5,256(s1)
        ep->cur_clus = ep->first_clus = alloc_clus(dp->dev);
    80206bc8:	11494503          	lbu	a0,276(s2)
    80206bcc:	fffff097          	auipc	ra,0xfffff
    80206bd0:	8a8080e7          	jalr	-1880(ra) # 80205474 <alloc_clus>
    80206bd4:	2501                	sext.w	a0,a0
    80206bd6:	10a4a223          	sw	a0,260(s1)
    80206bda:	10a4a623          	sw	a0,268(s1)
        emake(ep, ep, 0);
    80206bde:	4601                	li	a2,0
    80206be0:	85a6                	mv	a1,s1
    80206be2:	8526                	mv	a0,s1
    80206be4:	fffff097          	auipc	ra,0xfffff
    80206be8:	3c4080e7          	jalr	964(ra) # 80205fa8 <emake>
        emake(ep, dp, 32);
    80206bec:	02000613          	li	a2,32
    80206bf0:	85ca                	mv	a1,s2
    80206bf2:	8526                	mv	a0,s1
    80206bf4:	fffff097          	auipc	ra,0xfffff
    80206bf8:	3b4080e7          	jalr	948(ra) # 80205fa8 <emake>
    80206bfc:	b745                	j	80206b9c <ealloc+0xe0>
        return NULL;
    80206bfe:	84aa                	mv	s1,a0
    80206c00:	b739                	j	80206b0e <ealloc+0x52>

0000000080206c02 <lookup_path>:
    return path;
}

// FAT32 version of namex in xv6's original file system.
static struct dirent *lookup_path(char *path, int parent, char *name)
{
    80206c02:	715d                	addi	sp,sp,-80
    80206c04:	e486                	sd	ra,72(sp)
    80206c06:	e0a2                	sd	s0,64(sp)
    80206c08:	fc26                	sd	s1,56(sp)
    80206c0a:	f84a                	sd	s2,48(sp)
    80206c0c:	f44e                	sd	s3,40(sp)
    80206c0e:	f052                	sd	s4,32(sp)
    80206c10:	ec56                	sd	s5,24(sp)
    80206c12:	e85a                	sd	s6,16(sp)
    80206c14:	e45e                	sd	s7,8(sp)
    80206c16:	e062                	sd	s8,0(sp)
    80206c18:	0880                	addi	s0,sp,80
    80206c1a:	892a                	mv	s2,a0
    80206c1c:	8b2e                	mv	s6,a1
    80206c1e:	8ab2                	mv	s5,a2
    struct dirent *entry, *next;
    if (*path == '/') {
    80206c20:	00054783          	lbu	a5,0(a0)
    80206c24:	02f00713          	li	a4,47
    80206c28:	02e78663          	beq	a5,a4,80206c54 <lookup_path+0x52>
        entry = edup(&root);
    } else if (*path != '\0') {
        entry = edup(myproc()->cwd);
    } else {
        return NULL;
    80206c2c:	4a01                	li	s4,0
    } else if (*path != '\0') {
    80206c2e:	cba1                	beqz	a5,80206c7e <lookup_path+0x7c>
        entry = edup(myproc()->cwd);
    80206c30:	ffffb097          	auipc	ra,0xffffb
    80206c34:	ea8080e7          	jalr	-344(ra) # 80201ad8 <myproc>
    80206c38:	15853503          	ld	a0,344(a0)
    80206c3c:	fffff097          	auipc	ra,0xfffff
    80206c40:	736080e7          	jalr	1846(ra) # 80206372 <edup>
    80206c44:	8a2a                	mv	s4,a0
    while (*path == '/') {
    80206c46:	02f00993          	li	s3,47
    80206c4a:	0ff00b93          	li	s7,255
    80206c4e:	0ff00c13          	li	s8,255
    80206c52:	a0e5                	j	80206d3a <lookup_path+0x138>
        entry = edup(&root);
    80206c54:	00017517          	auipc	a0,0x17
    80206c58:	7fc50513          	addi	a0,a0,2044 # 8021e450 <root>
    80206c5c:	fffff097          	auipc	ra,0xfffff
    80206c60:	716080e7          	jalr	1814(ra) # 80206372 <edup>
    80206c64:	8a2a                	mv	s4,a0
    80206c66:	b7c5                	j	80206c46 <lookup_path+0x44>
    }
    while ((path = skipelem(path, name)) != 0) {
        elock(entry);
        if (!(entry->attribute & ATTR_DIRECTORY)) {
            eunlock(entry);
    80206c68:	8552                	mv	a0,s4
    80206c6a:	00000097          	auipc	ra,0x0
    80206c6e:	99c080e7          	jalr	-1636(ra) # 80206606 <eunlock>
            eput(entry);
    80206c72:	8552                	mv	a0,s4
    80206c74:	00000097          	auipc	ra,0x0
    80206c78:	9e0080e7          	jalr	-1568(ra) # 80206654 <eput>
            return NULL;
    80206c7c:	4a01                	li	s4,0
    if (parent) {
        eput(entry);
        return NULL;
    }
    return entry;
}
    80206c7e:	8552                	mv	a0,s4
    80206c80:	60a6                	ld	ra,72(sp)
    80206c82:	6406                	ld	s0,64(sp)
    80206c84:	74e2                	ld	s1,56(sp)
    80206c86:	7942                	ld	s2,48(sp)
    80206c88:	79a2                	ld	s3,40(sp)
    80206c8a:	7a02                	ld	s4,32(sp)
    80206c8c:	6ae2                	ld	s5,24(sp)
    80206c8e:	6b42                	ld	s6,16(sp)
    80206c90:	6ba2                	ld	s7,8(sp)
    80206c92:	6c02                	ld	s8,0(sp)
    80206c94:	6161                	addi	sp,sp,80
    80206c96:	8082                	ret
            eunlock(entry);
    80206c98:	8552                	mv	a0,s4
    80206c9a:	00000097          	auipc	ra,0x0
    80206c9e:	96c080e7          	jalr	-1684(ra) # 80206606 <eunlock>
            return entry;
    80206ca2:	bff1                	j	80206c7e <lookup_path+0x7c>
            eunlock(entry);
    80206ca4:	8552                	mv	a0,s4
    80206ca6:	00000097          	auipc	ra,0x0
    80206caa:	960080e7          	jalr	-1696(ra) # 80206606 <eunlock>
            eput(entry);
    80206cae:	8552                	mv	a0,s4
    80206cb0:	00000097          	auipc	ra,0x0
    80206cb4:	9a4080e7          	jalr	-1628(ra) # 80206654 <eput>
            return NULL;
    80206cb8:	8a4a                	mv	s4,s2
    80206cba:	b7d1                	j	80206c7e <lookup_path+0x7c>
    int len = path - s;
    80206cbc:	412487b3          	sub	a5,s1,s2
    80206cc0:	863e                	mv	a2,a5
    80206cc2:	2781                	sext.w	a5,a5
    80206cc4:	00fbd363          	bge	s7,a5,80206cca <lookup_path+0xc8>
    80206cc8:	8662                	mv	a2,s8
    80206cca:	0006079b          	sext.w	a5,a2
    name[len] = 0;
    80206cce:	97d6                	add	a5,a5,s5
    80206cd0:	00078023          	sb	zero,0(a5)
    memmove(name, s, len);
    80206cd4:	2601                	sext.w	a2,a2
    80206cd6:	85ca                	mv	a1,s2
    80206cd8:	8556                	mv	a0,s5
    80206cda:	ffffa097          	auipc	ra,0xffffa
    80206cde:	b12080e7          	jalr	-1262(ra) # 802007ec <memmove>
    while (*path == '/') {
    80206ce2:	0004c783          	lbu	a5,0(s1)
    80206ce6:	01379763          	bne	a5,s3,80206cf4 <lookup_path+0xf2>
        path++;
    80206cea:	0485                	addi	s1,s1,1
    while (*path == '/') {
    80206cec:	0004c783          	lbu	a5,0(s1)
    80206cf0:	ff378de3          	beq	a5,s3,80206cea <lookup_path+0xe8>
        elock(entry);
    80206cf4:	8552                	mv	a0,s4
    80206cf6:	00000097          	auipc	ra,0x0
    80206cfa:	8da080e7          	jalr	-1830(ra) # 802065d0 <elock>
        if (!(entry->attribute & ATTR_DIRECTORY)) {
    80206cfe:	100a4783          	lbu	a5,256(s4)
    80206d02:	8bc1                	andi	a5,a5,16
    80206d04:	d3b5                	beqz	a5,80206c68 <lookup_path+0x66>
        if (parent && *path == '\0') {
    80206d06:	000b0563          	beqz	s6,80206d10 <lookup_path+0x10e>
    80206d0a:	0004c783          	lbu	a5,0(s1)
    80206d0e:	d7c9                	beqz	a5,80206c98 <lookup_path+0x96>
        if ((next = dirlookup(entry, name, 0)) == 0) {
    80206d10:	4601                	li	a2,0
    80206d12:	85d6                	mv	a1,s5
    80206d14:	8552                	mv	a0,s4
    80206d16:	00000097          	auipc	ra,0x0
    80206d1a:	c48080e7          	jalr	-952(ra) # 8020695e <dirlookup>
    80206d1e:	892a                	mv	s2,a0
    80206d20:	d151                	beqz	a0,80206ca4 <lookup_path+0xa2>
        eunlock(entry);
    80206d22:	8552                	mv	a0,s4
    80206d24:	00000097          	auipc	ra,0x0
    80206d28:	8e2080e7          	jalr	-1822(ra) # 80206606 <eunlock>
        eput(entry);
    80206d2c:	8552                	mv	a0,s4
    80206d2e:	00000097          	auipc	ra,0x0
    80206d32:	926080e7          	jalr	-1754(ra) # 80206654 <eput>
        entry = next;
    80206d36:	8a4a                	mv	s4,s2
        eput(entry);
    80206d38:	8926                	mv	s2,s1
    while (*path == '/') {
    80206d3a:	00094783          	lbu	a5,0(s2)
    80206d3e:	03379363          	bne	a5,s3,80206d64 <lookup_path+0x162>
        path++;
    80206d42:	0905                	addi	s2,s2,1
    while (*path == '/') {
    80206d44:	00094783          	lbu	a5,0(s2)
    80206d48:	ff378de3          	beq	a5,s3,80206d42 <lookup_path+0x140>
    if (*path == 0) { return NULL; }
    80206d4c:	cf89                	beqz	a5,80206d66 <lookup_path+0x164>
        path++;
    80206d4e:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80206d50:	f73786e3          	beq	a5,s3,80206cbc <lookup_path+0xba>
        eput(entry);
    80206d54:	84ca                	mv	s1,s2
    while (*path != '/' && *path != 0) {
    80206d56:	d3bd                	beqz	a5,80206cbc <lookup_path+0xba>
        path++;
    80206d58:	0485                	addi	s1,s1,1
    while (*path != '/' && *path != 0) {
    80206d5a:	0004c783          	lbu	a5,0(s1)
    80206d5e:	ff379ce3          	bne	a5,s3,80206d56 <lookup_path+0x154>
    80206d62:	bfa9                	j	80206cbc <lookup_path+0xba>
    if (*path == 0) { return NULL; }
    80206d64:	fbe5                	bnez	a5,80206d54 <lookup_path+0x152>
    if (parent) {
    80206d66:	f00b0ce3          	beqz	s6,80206c7e <lookup_path+0x7c>
        eput(entry);
    80206d6a:	8552                	mv	a0,s4
    80206d6c:	00000097          	auipc	ra,0x0
    80206d70:	8e8080e7          	jalr	-1816(ra) # 80206654 <eput>
        return NULL;
    80206d74:	4a01                	li	s4,0
    80206d76:	b721                	j	80206c7e <lookup_path+0x7c>

0000000080206d78 <ename>:

struct dirent *ename(char *path)
{
    80206d78:	716d                	addi	sp,sp,-272
    80206d7a:	e606                	sd	ra,264(sp)
    80206d7c:	e222                	sd	s0,256(sp)
    80206d7e:	0a00                	addi	s0,sp,272
    char name[FAT32_MAX_FILENAME + 1];
    return lookup_path(path, 0, name);
    80206d80:	ef040613          	addi	a2,s0,-272
    80206d84:	4581                	li	a1,0
    80206d86:	00000097          	auipc	ra,0x0
    80206d8a:	e7c080e7          	jalr	-388(ra) # 80206c02 <lookup_path>
}
    80206d8e:	60b2                	ld	ra,264(sp)
    80206d90:	6412                	ld	s0,256(sp)
    80206d92:	6151                	addi	sp,sp,272
    80206d94:	8082                	ret

0000000080206d96 <enameparent>:

struct dirent *enameparent(char *path, char *name)
{
    80206d96:	1141                	addi	sp,sp,-16
    80206d98:	e406                	sd	ra,8(sp)
    80206d9a:	e022                	sd	s0,0(sp)
    80206d9c:	0800                	addi	s0,sp,16
    80206d9e:	862e                	mv	a2,a1
    return lookup_path(path, 1, name);
    80206da0:	4585                	li	a1,1
    80206da2:	00000097          	auipc	ra,0x0
    80206da6:	e60080e7          	jalr	-416(ra) # 80206c02 <lookup_path>
}
    80206daa:	60a2                	ld	ra,8(sp)
    80206dac:	6402                	ld	s0,0(sp)
    80206dae:	0141                	addi	sp,sp,16
    80206db0:	8082                	ret

0000000080206db2 <plicinit>:

//
// the riscv Platform Level Interrupt Controller (PLIC).
//

void plicinit(void) {
    80206db2:	1141                	addi	sp,sp,-16
    80206db4:	e406                	sd	ra,8(sp)
    80206db6:	e022                	sd	s0,0(sp)
    80206db8:	0800                	addi	s0,sp,16
	writed(1, PLIC_V + DISK_IRQ * sizeof(uint32));
    80206dba:	00fc37b7          	lui	a5,0xfc3
    80206dbe:	07ba                	slli	a5,a5,0xe
    80206dc0:	4705                	li	a4,1
    80206dc2:	c3d8                	sw	a4,4(a5)
	writed(1, PLIC_V + UART_IRQ * sizeof(uint32));
    80206dc4:	d798                	sw	a4,40(a5)

	#ifdef DEBUG 
	printf("plicinit\n");
    80206dc6:	00003517          	auipc	a0,0x3
    80206dca:	0d250513          	addi	a0,a0,210 # 80209e98 <digits+0xb18>
    80206dce:	ffff9097          	auipc	ra,0xffff9
    80206dd2:	3c0080e7          	jalr	960(ra) # 8020018e <printf>
	#endif 
}
    80206dd6:	60a2                	ld	ra,8(sp)
    80206dd8:	6402                	ld	s0,0(sp)
    80206dda:	0141                	addi	sp,sp,16
    80206ddc:	8082                	ret

0000000080206dde <plicinithart>:

void
plicinithart(void)
{
    80206dde:	1141                	addi	sp,sp,-16
    80206de0:	e406                	sd	ra,8(sp)
    80206de2:	e022                	sd	s0,0(sp)
    80206de4:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80206de6:	ffffb097          	auipc	ra,0xffffb
    80206dea:	cc6080e7          	jalr	-826(ra) # 80201aac <cpuid>
  #ifdef QEMU
  // set uart's enable bit for this hart's S-mode. 
  *(uint32*)PLIC_SENABLE(hart)= (1 << UART_IRQ) | (1 << DISK_IRQ);
    80206dee:	0085171b          	slliw	a4,a0,0x8
    80206df2:	01f867b7          	lui	a5,0x1f86
    80206df6:	0785                	addi	a5,a5,1 # 1f86001 <_entry-0x7e279fff>
    80206df8:	07b6                	slli	a5,a5,0xd
    80206dfa:	97ba                	add	a5,a5,a4
    80206dfc:	40200713          	li	a4,1026
    80206e00:	08e7a023          	sw	a4,128(a5)
  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80206e04:	00d5151b          	slliw	a0,a0,0xd
    80206e08:	03f0c7b7          	lui	a5,0x3f0c
    80206e0c:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206e10:	07b2                	slli	a5,a5,0xc
    80206e12:	97aa                	add	a5,a5,a0
    80206e14:	0007a023          	sw	zero,0(a5)
  *(hart_m_enable) = readd(hart_m_enable) | (1 << DISK_IRQ);
  uint32 *hart0_m_int_enable_hi = hart_m_enable + 1;
  *(hart0_m_int_enable_hi) = readd(hart0_m_int_enable_hi) | (1 << (UART_IRQ % 32));
  #endif
  #ifdef DEBUG
  printf("plicinithart\n");
    80206e18:	00003517          	auipc	a0,0x3
    80206e1c:	09050513          	addi	a0,a0,144 # 80209ea8 <digits+0xb28>
    80206e20:	ffff9097          	auipc	ra,0xffff9
    80206e24:	36e080e7          	jalr	878(ra) # 8020018e <printf>
  #endif
}
    80206e28:	60a2                	ld	ra,8(sp)
    80206e2a:	6402                	ld	s0,0(sp)
    80206e2c:	0141                	addi	sp,sp,16
    80206e2e:	8082                	ret

0000000080206e30 <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80206e30:	1141                	addi	sp,sp,-16
    80206e32:	e406                	sd	ra,8(sp)
    80206e34:	e022                	sd	s0,0(sp)
    80206e36:	0800                	addi	s0,sp,16
  int hart = cpuid();
    80206e38:	ffffb097          	auipc	ra,0xffffb
    80206e3c:	c74080e7          	jalr	-908(ra) # 80201aac <cpuid>
  int irq;
  #ifndef QEMU
  irq = *(uint32*)PLIC_MCLAIM(hart);
  #else
  irq = *(uint32*)PLIC_SCLAIM(hart);
    80206e40:	00d5151b          	slliw	a0,a0,0xd
    80206e44:	03f0c7b7          	lui	a5,0x3f0c
    80206e48:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206e4c:	07b2                	slli	a5,a5,0xc
    80206e4e:	97aa                	add	a5,a5,a0
  #endif
  return irq;
}
    80206e50:	43c8                	lw	a0,4(a5)
    80206e52:	60a2                	ld	ra,8(sp)
    80206e54:	6402                	ld	s0,0(sp)
    80206e56:	0141                	addi	sp,sp,16
    80206e58:	8082                	ret

0000000080206e5a <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80206e5a:	1101                	addi	sp,sp,-32
    80206e5c:	ec06                	sd	ra,24(sp)
    80206e5e:	e822                	sd	s0,16(sp)
    80206e60:	e426                	sd	s1,8(sp)
    80206e62:	1000                	addi	s0,sp,32
    80206e64:	84aa                	mv	s1,a0
  int hart = cpuid();
    80206e66:	ffffb097          	auipc	ra,0xffffb
    80206e6a:	c46080e7          	jalr	-954(ra) # 80201aac <cpuid>
  #ifndef QEMU
  *(uint32*)PLIC_MCLAIM(hart) = irq;
  #else
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80206e6e:	00d5151b          	slliw	a0,a0,0xd
    80206e72:	03f0c7b7          	lui	a5,0x3f0c
    80206e76:	20178793          	addi	a5,a5,513 # 3f0c201 <_entry-0x7c2f3dff>
    80206e7a:	07b2                	slli	a5,a5,0xc
    80206e7c:	97aa                	add	a5,a5,a0
    80206e7e:	c3c4                	sw	s1,4(a5)
  #endif
}
    80206e80:	60e2                	ld	ra,24(sp)
    80206e82:	6442                	ld	s0,16(sp)
    80206e84:	64a2                	ld	s1,8(sp)
    80206e86:	6105                	addi	sp,sp,32
    80206e88:	8082                	ret

0000000080206e8a <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    80206e8a:	715d                	addi	sp,sp,-80
    80206e8c:	e486                	sd	ra,72(sp)
    80206e8e:	e0a2                	sd	s0,64(sp)
    80206e90:	fc26                	sd	s1,56(sp)
    80206e92:	f84a                	sd	s2,48(sp)
    80206e94:	f44e                	sd	s3,40(sp)
    80206e96:	f052                	sd	s4,32(sp)
    80206e98:	ec56                	sd	s5,24(sp)
    80206e9a:	e85a                	sd	s6,16(sp)
    80206e9c:	0880                	addi	s0,sp,80
    80206e9e:	8a2a                	mv	s4,a0
    80206ea0:	84ae                	mv	s1,a1
    80206ea2:	89b2                	mv	s3,a2
  int i;

  acquire(&cons.lock);
    80206ea4:	0001c517          	auipc	a0,0x1c
    80206ea8:	d7c50513          	addi	a0,a0,-644 # 80222c20 <cons>
    80206eac:	ffffa097          	auipc	ra,0xffffa
    80206eb0:	848080e7          	jalr	-1976(ra) # 802006f4 <acquire>
  for(i = 0; i < n; i++){
    80206eb4:	07305063          	blez	s3,80206f14 <consolewrite+0x8a>
    80206eb8:	4901                	li	s2,0
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    80206eba:	fbf40b13          	addi	s6,s0,-65
    80206ebe:	5afd                	li	s5,-1
    80206ec0:	4685                	li	a3,1
    80206ec2:	8626                	mv	a2,s1
    80206ec4:	85d2                	mv	a1,s4
    80206ec6:	855a                	mv	a0,s6
    80206ec8:	ffffb097          	auipc	ra,0xffffb
    80206ecc:	72c080e7          	jalr	1836(ra) # 802025f4 <either_copyin>
    80206ed0:	01550f63          	beq	a0,s5,80206eee <consolewrite+0x64>
	SBI_CALL_1(SBI_CONSOLE_PUTCHAR, ch);
    80206ed4:	fbf44503          	lbu	a0,-65(s0)
    80206ed8:	4581                	li	a1,0
    80206eda:	4601                	li	a2,0
    80206edc:	4681                	li	a3,0
    80206ede:	4885                	li	a7,1
    80206ee0:	00000073          	ecall
  for(i = 0; i < n; i++){
    80206ee4:	2905                	addiw	s2,s2,1
    80206ee6:	0485                	addi	s1,s1,1
    80206ee8:	fd299ce3          	bne	s3,s2,80206ec0 <consolewrite+0x36>
    80206eec:	894e                	mv	s2,s3
      break;
    sbi_console_putchar(c);
  }
  release(&cons.lock);
    80206eee:	0001c517          	auipc	a0,0x1c
    80206ef2:	d3250513          	addi	a0,a0,-718 # 80222c20 <cons>
    80206ef6:	ffffa097          	auipc	ra,0xffffa
    80206efa:	852080e7          	jalr	-1966(ra) # 80200748 <release>

  return i;
}
    80206efe:	854a                	mv	a0,s2
    80206f00:	60a6                	ld	ra,72(sp)
    80206f02:	6406                	ld	s0,64(sp)
    80206f04:	74e2                	ld	s1,56(sp)
    80206f06:	7942                	ld	s2,48(sp)
    80206f08:	79a2                	ld	s3,40(sp)
    80206f0a:	7a02                	ld	s4,32(sp)
    80206f0c:	6ae2                	ld	s5,24(sp)
    80206f0e:	6b42                	ld	s6,16(sp)
    80206f10:	6161                	addi	sp,sp,80
    80206f12:	8082                	ret
  for(i = 0; i < n; i++){
    80206f14:	4901                	li	s2,0
    80206f16:	bfe1                	j	80206eee <consolewrite+0x64>

0000000080206f18 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80206f18:	7119                	addi	sp,sp,-128
    80206f1a:	fc86                	sd	ra,120(sp)
    80206f1c:	f8a2                	sd	s0,112(sp)
    80206f1e:	f4a6                	sd	s1,104(sp)
    80206f20:	f0ca                	sd	s2,96(sp)
    80206f22:	ecce                	sd	s3,88(sp)
    80206f24:	e8d2                	sd	s4,80(sp)
    80206f26:	e4d6                	sd	s5,72(sp)
    80206f28:	e0da                	sd	s6,64(sp)
    80206f2a:	fc5e                	sd	s7,56(sp)
    80206f2c:	f862                	sd	s8,48(sp)
    80206f2e:	f466                	sd	s9,40(sp)
    80206f30:	f06a                	sd	s10,32(sp)
    80206f32:	ec6e                	sd	s11,24(sp)
    80206f34:	0100                	addi	s0,sp,128
    80206f36:	8aaa                	mv	s5,a0
    80206f38:	8a2e                	mv	s4,a1
    80206f3a:	89b2                	mv	s3,a2
  uint target;
  int c;
  char cbuf;

  target = n;
    80206f3c:	00060b1b          	sext.w	s6,a2
  acquire(&cons.lock);
    80206f40:	0001c517          	auipc	a0,0x1c
    80206f44:	ce050513          	addi	a0,a0,-800 # 80222c20 <cons>
    80206f48:	ffff9097          	auipc	ra,0xffff9
    80206f4c:	7ac080e7          	jalr	1964(ra) # 802006f4 <acquire>
  while(n > 0){
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
    80206f50:	0001c497          	auipc	s1,0x1c
    80206f54:	cd048493          	addi	s1,s1,-816 # 80222c20 <cons>
      if(myproc()->killed){
        release(&cons.lock);
        return -1;
      }
      sleep(&cons.r, &cons.lock);
    80206f58:	0001c917          	auipc	s2,0x1c
    80206f5c:	d6090913          	addi	s2,s2,-672 # 80222cb8 <cons+0x98>
    }

    c = cons.buf[cons.r++ % INPUT_BUF];

    if(c == C('D')){  // end-of-file
    80206f60:	4c11                	li	s8,4
      break;
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80206f62:	f8f40d13          	addi	s10,s0,-113
    80206f66:	5cfd                	li	s9,-1
      break;

    dst++;
    --n;

    if(c == '\n'){
    80206f68:	4da9                	li	s11,10
  while(n > 0){
    80206f6a:	07305763          	blez	s3,80206fd8 <consoleread+0xc0>
    while(cons.r == cons.w){
    80206f6e:	0984a783          	lw	a5,152(s1)
    80206f72:	09c4a703          	lw	a4,156(s1)
    80206f76:	02f71463          	bne	a4,a5,80206f9e <consoleread+0x86>
      if(myproc()->killed){
    80206f7a:	ffffb097          	auipc	ra,0xffffb
    80206f7e:	b5e080e7          	jalr	-1186(ra) # 80201ad8 <myproc>
    80206f82:	591c                	lw	a5,48(a0)
    80206f84:	e7ad                	bnez	a5,80206fee <consoleread+0xd6>
      sleep(&cons.r, &cons.lock);
    80206f86:	85a6                	mv	a1,s1
    80206f88:	854a                	mv	a0,s2
    80206f8a:	ffffb097          	auipc	ra,0xffffb
    80206f8e:	3de080e7          	jalr	990(ra) # 80202368 <sleep>
    while(cons.r == cons.w){
    80206f92:	0984a783          	lw	a5,152(s1)
    80206f96:	09c4a703          	lw	a4,156(s1)
    80206f9a:	fef700e3          	beq	a4,a5,80206f7a <consoleread+0x62>
    c = cons.buf[cons.r++ % INPUT_BUF];
    80206f9e:	0017871b          	addiw	a4,a5,1
    80206fa2:	08e4ac23          	sw	a4,152(s1)
    80206fa6:	07f7f713          	andi	a4,a5,127
    80206faa:	9726                	add	a4,a4,s1
    80206fac:	01874703          	lbu	a4,24(a4)
    80206fb0:	00070b9b          	sext.w	s7,a4
    if(c == C('D')){  // end-of-file
    80206fb4:	078b8563          	beq	s7,s8,8020701e <consoleread+0x106>
    cbuf = c;
    80206fb8:	f8e407a3          	sb	a4,-113(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    80206fbc:	4685                	li	a3,1
    80206fbe:	866a                	mv	a2,s10
    80206fc0:	85d2                	mv	a1,s4
    80206fc2:	8556                	mv	a0,s5
    80206fc4:	ffffb097          	auipc	ra,0xffffb
    80206fc8:	5fa080e7          	jalr	1530(ra) # 802025be <either_copyout>
    80206fcc:	01950663          	beq	a0,s9,80206fd8 <consoleread+0xc0>
    dst++;
    80206fd0:	0a05                	addi	s4,s4,1
    --n;
    80206fd2:	39fd                	addiw	s3,s3,-1
    if(c == '\n'){
    80206fd4:	f9bb9be3          	bne	s7,s11,80206f6a <consoleread+0x52>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    }
  }
  release(&cons.lock);
    80206fd8:	0001c517          	auipc	a0,0x1c
    80206fdc:	c4850513          	addi	a0,a0,-952 # 80222c20 <cons>
    80206fe0:	ffff9097          	auipc	ra,0xffff9
    80206fe4:	768080e7          	jalr	1896(ra) # 80200748 <release>

  return target - n;
    80206fe8:	413b053b          	subw	a0,s6,s3
    80206fec:	a811                	j	80207000 <consoleread+0xe8>
        release(&cons.lock);
    80206fee:	0001c517          	auipc	a0,0x1c
    80206ff2:	c3250513          	addi	a0,a0,-974 # 80222c20 <cons>
    80206ff6:	ffff9097          	auipc	ra,0xffff9
    80206ffa:	752080e7          	jalr	1874(ra) # 80200748 <release>
        return -1;
    80206ffe:	557d                	li	a0,-1
}
    80207000:	70e6                	ld	ra,120(sp)
    80207002:	7446                	ld	s0,112(sp)
    80207004:	74a6                	ld	s1,104(sp)
    80207006:	7906                	ld	s2,96(sp)
    80207008:	69e6                	ld	s3,88(sp)
    8020700a:	6a46                	ld	s4,80(sp)
    8020700c:	6aa6                	ld	s5,72(sp)
    8020700e:	6b06                	ld	s6,64(sp)
    80207010:	7be2                	ld	s7,56(sp)
    80207012:	7c42                	ld	s8,48(sp)
    80207014:	7ca2                	ld	s9,40(sp)
    80207016:	7d02                	ld	s10,32(sp)
    80207018:	6de2                	ld	s11,24(sp)
    8020701a:	6109                	addi	sp,sp,128
    8020701c:	8082                	ret
      if(n < target){
    8020701e:	0009871b          	sext.w	a4,s3
    80207022:	fb677be3          	bgeu	a4,s6,80206fd8 <consoleread+0xc0>
        cons.r--;
    80207026:	0001c717          	auipc	a4,0x1c
    8020702a:	c8f72923          	sw	a5,-878(a4) # 80222cb8 <cons+0x98>
    8020702e:	b76d                	j	80206fd8 <consoleread+0xc0>

0000000080207030 <consputc>:
void consputc(int c) {
    80207030:	1141                	addi	sp,sp,-16
    80207032:	e422                	sd	s0,8(sp)
    80207034:	0800                	addi	s0,sp,16
  if(c == BACKSPACE){
    80207036:	10000793          	li	a5,256
    8020703a:	00f50b63          	beq	a0,a5,80207050 <consputc+0x20>
    8020703e:	4581                	li	a1,0
    80207040:	4601                	li	a2,0
    80207042:	4681                	li	a3,0
    80207044:	4885                	li	a7,1
    80207046:	00000073          	ecall
}
    8020704a:	6422                	ld	s0,8(sp)
    8020704c:	0141                	addi	sp,sp,16
    8020704e:	8082                	ret
    80207050:	4521                	li	a0,8
    80207052:	4581                	li	a1,0
    80207054:	4601                	li	a2,0
    80207056:	4681                	li	a3,0
    80207058:	4885                	li	a7,1
    8020705a:	00000073          	ecall
    8020705e:	02000513          	li	a0,32
    80207062:	00000073          	ecall
    80207066:	4521                	li	a0,8
    80207068:	00000073          	ecall
}
    8020706c:	bff9                	j	8020704a <consputc+0x1a>

000000008020706e <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    8020706e:	1101                	addi	sp,sp,-32
    80207070:	ec06                	sd	ra,24(sp)
    80207072:	e822                	sd	s0,16(sp)
    80207074:	e426                	sd	s1,8(sp)
    80207076:	e04a                	sd	s2,0(sp)
    80207078:	1000                	addi	s0,sp,32
    8020707a:	84aa                	mv	s1,a0
  acquire(&cons.lock);
    8020707c:	0001c517          	auipc	a0,0x1c
    80207080:	ba450513          	addi	a0,a0,-1116 # 80222c20 <cons>
    80207084:	ffff9097          	auipc	ra,0xffff9
    80207088:	670080e7          	jalr	1648(ra) # 802006f4 <acquire>

  switch(c){
    8020708c:	47d5                	li	a5,21
    8020708e:	0af48663          	beq	s1,a5,8020713a <consoleintr+0xcc>
    80207092:	0297ca63          	blt	a5,s1,802070c6 <consoleintr+0x58>
    80207096:	47a1                	li	a5,8
    80207098:	0ef48763          	beq	s1,a5,80207186 <consoleintr+0x118>
    8020709c:	47c1                	li	a5,16
    8020709e:	10f49a63          	bne	s1,a5,802071b2 <consoleintr+0x144>
  case C('P'):  // Print process list.
    procdump();
    802070a2:	ffffb097          	auipc	ra,0xffffb
    802070a6:	586080e7          	jalr	1414(ra) # 80202628 <procdump>
      }
    }
    break;
  }
  
  release(&cons.lock);
    802070aa:	0001c517          	auipc	a0,0x1c
    802070ae:	b7650513          	addi	a0,a0,-1162 # 80222c20 <cons>
    802070b2:	ffff9097          	auipc	ra,0xffff9
    802070b6:	696080e7          	jalr	1686(ra) # 80200748 <release>
}
    802070ba:	60e2                	ld	ra,24(sp)
    802070bc:	6442                	ld	s0,16(sp)
    802070be:	64a2                	ld	s1,8(sp)
    802070c0:	6902                	ld	s2,0(sp)
    802070c2:	6105                	addi	sp,sp,32
    802070c4:	8082                	ret
  switch(c){
    802070c6:	07f00793          	li	a5,127
    802070ca:	0af48e63          	beq	s1,a5,80207186 <consoleintr+0x118>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    802070ce:	0001c717          	auipc	a4,0x1c
    802070d2:	b5270713          	addi	a4,a4,-1198 # 80222c20 <cons>
    802070d6:	0a072783          	lw	a5,160(a4)
    802070da:	09872703          	lw	a4,152(a4)
    802070de:	9f99                	subw	a5,a5,a4
    802070e0:	07f00713          	li	a4,127
    802070e4:	fcf763e3          	bltu	a4,a5,802070aa <consoleintr+0x3c>
      c = (c == '\r') ? '\n' : c;
    802070e8:	47b5                	li	a5,13
    802070ea:	0cf48763          	beq	s1,a5,802071b8 <consoleintr+0x14a>
      consputc(c);
    802070ee:	8526                	mv	a0,s1
    802070f0:	00000097          	auipc	ra,0x0
    802070f4:	f40080e7          	jalr	-192(ra) # 80207030 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802070f8:	0001c797          	auipc	a5,0x1c
    802070fc:	b2878793          	addi	a5,a5,-1240 # 80222c20 <cons>
    80207100:	0a07a703          	lw	a4,160(a5)
    80207104:	0017069b          	addiw	a3,a4,1
    80207108:	0006861b          	sext.w	a2,a3
    8020710c:	0ad7a023          	sw	a3,160(a5)
    80207110:	07f77713          	andi	a4,a4,127
    80207114:	97ba                	add	a5,a5,a4
    80207116:	00978c23          	sb	s1,24(a5)
      if(c == '\n' || c == C('D') || cons.e == cons.r+INPUT_BUF){
    8020711a:	47a9                	li	a5,10
    8020711c:	0cf48563          	beq	s1,a5,802071e6 <consoleintr+0x178>
    80207120:	4791                	li	a5,4
    80207122:	0cf48263          	beq	s1,a5,802071e6 <consoleintr+0x178>
    80207126:	0001c797          	auipc	a5,0x1c
    8020712a:	b927a783          	lw	a5,-1134(a5) # 80222cb8 <cons+0x98>
    8020712e:	0807879b          	addiw	a5,a5,128
    80207132:	f6f61ce3          	bne	a2,a5,802070aa <consoleintr+0x3c>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    80207136:	863e                	mv	a2,a5
    80207138:	a07d                	j	802071e6 <consoleintr+0x178>
    while(cons.e != cons.w &&
    8020713a:	0001c717          	auipc	a4,0x1c
    8020713e:	ae670713          	addi	a4,a4,-1306 # 80222c20 <cons>
    80207142:	0a072783          	lw	a5,160(a4)
    80207146:	09c72703          	lw	a4,156(a4)
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    8020714a:	0001c497          	auipc	s1,0x1c
    8020714e:	ad648493          	addi	s1,s1,-1322 # 80222c20 <cons>
    while(cons.e != cons.w &&
    80207152:	4929                	li	s2,10
    80207154:	f4f70be3          	beq	a4,a5,802070aa <consoleintr+0x3c>
          cons.buf[(cons.e-1) % INPUT_BUF] != '\n'){
    80207158:	37fd                	addiw	a5,a5,-1
    8020715a:	07f7f713          	andi	a4,a5,127
    8020715e:	9726                	add	a4,a4,s1
    while(cons.e != cons.w &&
    80207160:	01874703          	lbu	a4,24(a4)
    80207164:	f52703e3          	beq	a4,s2,802070aa <consoleintr+0x3c>
      cons.e--;
    80207168:	0af4a023          	sw	a5,160(s1)
      consputc(BACKSPACE);
    8020716c:	10000513          	li	a0,256
    80207170:	00000097          	auipc	ra,0x0
    80207174:	ec0080e7          	jalr	-320(ra) # 80207030 <consputc>
    while(cons.e != cons.w &&
    80207178:	0a04a783          	lw	a5,160(s1)
    8020717c:	09c4a703          	lw	a4,156(s1)
    80207180:	fcf71ce3          	bne	a4,a5,80207158 <consoleintr+0xea>
    80207184:	b71d                	j	802070aa <consoleintr+0x3c>
    if(cons.e != cons.w){
    80207186:	0001c717          	auipc	a4,0x1c
    8020718a:	a9a70713          	addi	a4,a4,-1382 # 80222c20 <cons>
    8020718e:	0a072783          	lw	a5,160(a4)
    80207192:	09c72703          	lw	a4,156(a4)
    80207196:	f0f70ae3          	beq	a4,a5,802070aa <consoleintr+0x3c>
      cons.e--;
    8020719a:	37fd                	addiw	a5,a5,-1
    8020719c:	0001c717          	auipc	a4,0x1c
    802071a0:	b2f72223          	sw	a5,-1244(a4) # 80222cc0 <cons+0xa0>
      consputc(BACKSPACE);
    802071a4:	10000513          	li	a0,256
    802071a8:	00000097          	auipc	ra,0x0
    802071ac:	e88080e7          	jalr	-376(ra) # 80207030 <consputc>
    802071b0:	bded                	j	802070aa <consoleintr+0x3c>
    if(c != 0 && cons.e-cons.r < INPUT_BUF){
    802071b2:	ee048ce3          	beqz	s1,802070aa <consoleintr+0x3c>
    802071b6:	bf21                	j	802070ce <consoleintr+0x60>
      consputc(c);
    802071b8:	4529                	li	a0,10
    802071ba:	00000097          	auipc	ra,0x0
    802071be:	e76080e7          	jalr	-394(ra) # 80207030 <consputc>
      cons.buf[cons.e++ % INPUT_BUF] = c;
    802071c2:	0001c797          	auipc	a5,0x1c
    802071c6:	a5e78793          	addi	a5,a5,-1442 # 80222c20 <cons>
    802071ca:	0a07a703          	lw	a4,160(a5)
    802071ce:	0017069b          	addiw	a3,a4,1
    802071d2:	0006861b          	sext.w	a2,a3
    802071d6:	0ad7a023          	sw	a3,160(a5)
    802071da:	07f77713          	andi	a4,a4,127
    802071de:	97ba                	add	a5,a5,a4
    802071e0:	4729                	li	a4,10
    802071e2:	00e78c23          	sb	a4,24(a5)
        cons.w = cons.e;
    802071e6:	0001c797          	auipc	a5,0x1c
    802071ea:	acc7ab23          	sw	a2,-1322(a5) # 80222cbc <cons+0x9c>
        wakeup(&cons.r);
    802071ee:	0001c517          	auipc	a0,0x1c
    802071f2:	aca50513          	addi	a0,a0,-1334 # 80222cb8 <cons+0x98>
    802071f6:	ffffb097          	auipc	ra,0xffffb
    802071fa:	2ee080e7          	jalr	750(ra) # 802024e4 <wakeup>
    802071fe:	b575                	j	802070aa <consoleintr+0x3c>

0000000080207200 <consoleinit>:

void
consoleinit(void)
{
    80207200:	1101                	addi	sp,sp,-32
    80207202:	ec06                	sd	ra,24(sp)
    80207204:	e822                	sd	s0,16(sp)
    80207206:	e426                	sd	s1,8(sp)
    80207208:	1000                	addi	s0,sp,32
  initlock(&cons.lock, "cons");
    8020720a:	0001c497          	auipc	s1,0x1c
    8020720e:	a1648493          	addi	s1,s1,-1514 # 80222c20 <cons>
    80207212:	00003597          	auipc	a1,0x3
    80207216:	ca658593          	addi	a1,a1,-858 # 80209eb8 <digits+0xb38>
    8020721a:	8526                	mv	a0,s1
    8020721c:	ffff9097          	auipc	ra,0xffff9
    80207220:	494080e7          	jalr	1172(ra) # 802006b0 <initlock>

  cons.e = cons.w = cons.r = 0;
    80207224:	0804ac23          	sw	zero,152(s1)
    80207228:	0804ae23          	sw	zero,156(s1)
    8020722c:	0a04a023          	sw	zero,160(s1)
  
  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80207230:	00004797          	auipc	a5,0x4
    80207234:	7d87b783          	ld	a5,2008(a5) # 8020ba08 <_GLOBAL_OFFSET_TABLE_+0x58>
    80207238:	00000717          	auipc	a4,0x0
    8020723c:	ce070713          	addi	a4,a4,-800 # 80206f18 <consoleread>
    80207240:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    80207242:	00000717          	auipc	a4,0x0
    80207246:	c4870713          	addi	a4,a4,-952 # 80206e8a <consolewrite>
    8020724a:	ef98                	sd	a4,24(a5)
}
    8020724c:	60e2                	ld	ra,24(sp)
    8020724e:	6442                	ld	s0,16(sp)
    80207250:	64a2                	ld	s1,8(sp)
    80207252:	6105                	addi	sp,sp,32
    80207254:	8082                	ret

0000000080207256 <free_desc>:
}

// mark a descriptor as free.
static void
free_desc(int i)
{
    80207256:	1141                	addi	sp,sp,-16
    80207258:	e406                	sd	ra,8(sp)
    8020725a:	e022                	sd	s0,0(sp)
    8020725c:	0800                	addi	s0,sp,16
  if(i >= NUM)
    8020725e:	479d                	li	a5,7
    80207260:	04a7cb63          	blt	a5,a0,802072b6 <free_desc+0x60>
    panic("virtio_disk_intr 1");
  if(disk.free[i])
    80207264:	0001c717          	auipc	a4,0x1c
    80207268:	d9c70713          	addi	a4,a4,-612 # 80223000 <disk>
    8020726c:	972a                	add	a4,a4,a0
    8020726e:	6789                	lui	a5,0x2
    80207270:	97ba                	add	a5,a5,a4
    80207272:	0187c783          	lbu	a5,24(a5) # 2018 <_entry-0x801fdfe8>
    80207276:	eba1                	bnez	a5,802072c6 <free_desc+0x70>
    panic("virtio_disk_intr 2");
  disk.desc[i].addr = 0;
    80207278:	00451713          	slli	a4,a0,0x4
    8020727c:	0001e797          	auipc	a5,0x1e
    80207280:	d847b783          	ld	a5,-636(a5) # 80225000 <disk+0x2000>
    80207284:	97ba                	add	a5,a5,a4
    80207286:	0007b023          	sd	zero,0(a5)
  disk.free[i] = 1;
    8020728a:	0001c717          	auipc	a4,0x1c
    8020728e:	d7670713          	addi	a4,a4,-650 # 80223000 <disk>
    80207292:	972a                	add	a4,a4,a0
    80207294:	6789                	lui	a5,0x2
    80207296:	97ba                	add	a5,a5,a4
    80207298:	4705                	li	a4,1
    8020729a:	00e78c23          	sb	a4,24(a5) # 2018 <_entry-0x801fdfe8>
  wakeup(&disk.free[0]);
    8020729e:	0001e517          	auipc	a0,0x1e
    802072a2:	d7a50513          	addi	a0,a0,-646 # 80225018 <disk+0x2018>
    802072a6:	ffffb097          	auipc	ra,0xffffb
    802072aa:	23e080e7          	jalr	574(ra) # 802024e4 <wakeup>
}
    802072ae:	60a2                	ld	ra,8(sp)
    802072b0:	6402                	ld	s0,0(sp)
    802072b2:	0141                	addi	sp,sp,16
    802072b4:	8082                	ret
    panic("virtio_disk_intr 1");
    802072b6:	00003517          	auipc	a0,0x3
    802072ba:	c0a50513          	addi	a0,a0,-1014 # 80209ec0 <digits+0xb40>
    802072be:	ffff9097          	auipc	ra,0xffff9
    802072c2:	e86080e7          	jalr	-378(ra) # 80200144 <panic>
    panic("virtio_disk_intr 2");
    802072c6:	00003517          	auipc	a0,0x3
    802072ca:	c1250513          	addi	a0,a0,-1006 # 80209ed8 <digits+0xb58>
    802072ce:	ffff9097          	auipc	ra,0xffff9
    802072d2:	e76080e7          	jalr	-394(ra) # 80200144 <panic>

00000000802072d6 <virtio_disk_init>:
{
    802072d6:	1141                	addi	sp,sp,-16
    802072d8:	e406                	sd	ra,8(sp)
    802072da:	e022                	sd	s0,0(sp)
    802072dc:	0800                	addi	s0,sp,16
  initlock(&disk.vdisk_lock, "virtio_disk");
    802072de:	00003597          	auipc	a1,0x3
    802072e2:	c1258593          	addi	a1,a1,-1006 # 80209ef0 <digits+0xb70>
    802072e6:	0001e517          	auipc	a0,0x1e
    802072ea:	dc250513          	addi	a0,a0,-574 # 802250a8 <disk+0x20a8>
    802072ee:	ffff9097          	auipc	ra,0xffff9
    802072f2:	3c2080e7          	jalr	962(ra) # 802006b0 <initlock>
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    802072f6:	03f107b7          	lui	a5,0x3f10
    802072fa:	0785                	addi	a5,a5,1 # 3f10001 <_entry-0x7c2effff>
    802072fc:	07b2                	slli	a5,a5,0xc
    802072fe:	4398                	lw	a4,0(a5)
    80207300:	2701                	sext.w	a4,a4
    80207302:	747277b7          	lui	a5,0x74727
    80207306:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xbad968a>
    8020730a:	12f71963          	bne	a4,a5,8020743c <virtio_disk_init+0x166>
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    8020730e:	00003797          	auipc	a5,0x3
    80207312:	c827b783          	ld	a5,-894(a5) # 80209f90 <digits+0xc10>
    80207316:	439c                	lw	a5,0(a5)
    80207318:	2781                	sext.w	a5,a5
  if(*R(VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    8020731a:	4705                	li	a4,1
    8020731c:	12e79063          	bne	a5,a4,8020743c <virtio_disk_init+0x166>
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80207320:	00003797          	auipc	a5,0x3
    80207324:	c787b783          	ld	a5,-904(a5) # 80209f98 <digits+0xc18>
    80207328:	439c                	lw	a5,0(a5)
    8020732a:	2781                	sext.w	a5,a5
     *R(VIRTIO_MMIO_VERSION) != 1 ||
    8020732c:	4709                	li	a4,2
    8020732e:	10e79763          	bne	a5,a4,8020743c <virtio_disk_init+0x166>
     *R(VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80207332:	00003797          	auipc	a5,0x3
    80207336:	c6e7b783          	ld	a5,-914(a5) # 80209fa0 <digits+0xc20>
    8020733a:	4398                	lw	a4,0(a5)
    8020733c:	2701                	sext.w	a4,a4
     *R(VIRTIO_MMIO_DEVICE_ID) != 2 ||
    8020733e:	554d47b7          	lui	a5,0x554d4
    80207342:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ad2baaf>
    80207346:	0ef71b63          	bne	a4,a5,8020743c <virtio_disk_init+0x166>
  *R(VIRTIO_MMIO_STATUS) = status;
    8020734a:	00003797          	auipc	a5,0x3
    8020734e:	c5e7b783          	ld	a5,-930(a5) # 80209fa8 <digits+0xc28>
    80207352:	4705                	li	a4,1
    80207354:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207356:	470d                	li	a4,3
    80207358:	c398                	sw	a4,0(a5)
  uint64 features = *R(VIRTIO_MMIO_DEVICE_FEATURES);
    8020735a:	00003717          	auipc	a4,0x3
    8020735e:	c5673703          	ld	a4,-938(a4) # 80209fb0 <digits+0xc30>
    80207362:	4318                	lw	a4,0(a4)
  *R(VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80207364:	c7ffe6b7          	lui	a3,0xc7ffe
    80207368:	75f68693          	addi	a3,a3,1887 # ffffffffc7ffe75f <ebss_clear+0xffffffff47dd875f>
    8020736c:	8f75                	and	a4,a4,a3
    8020736e:	00003697          	auipc	a3,0x3
    80207372:	c4a6b683          	ld	a3,-950(a3) # 80209fb8 <digits+0xc38>
    80207376:	c298                	sw	a4,0(a3)
  *R(VIRTIO_MMIO_STATUS) = status;
    80207378:	472d                	li	a4,11
    8020737a:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_STATUS) = status;
    8020737c:	473d                	li	a4,15
    8020737e:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_GUEST_PAGE_SIZE) = PGSIZE;
    80207380:	00003797          	auipc	a5,0x3
    80207384:	c407b783          	ld	a5,-960(a5) # 80209fc0 <digits+0xc40>
    80207388:	6705                	lui	a4,0x1
    8020738a:	c398                	sw	a4,0(a5)
  *R(VIRTIO_MMIO_QUEUE_SEL) = 0;
    8020738c:	00003797          	auipc	a5,0x3
    80207390:	c3c7b783          	ld	a5,-964(a5) # 80209fc8 <digits+0xc48>
    80207394:	0007a023          	sw	zero,0(a5)
  uint32 max = *R(VIRTIO_MMIO_QUEUE_NUM_MAX);
    80207398:	00003797          	auipc	a5,0x3
    8020739c:	c387b783          	ld	a5,-968(a5) # 80209fd0 <digits+0xc50>
    802073a0:	439c                	lw	a5,0(a5)
    802073a2:	2781                	sext.w	a5,a5
  if(max == 0)
    802073a4:	c7c5                	beqz	a5,8020744c <virtio_disk_init+0x176>
  if(max < NUM)
    802073a6:	471d                	li	a4,7
    802073a8:	0af77a63          	bgeu	a4,a5,8020745c <virtio_disk_init+0x186>
  *R(VIRTIO_MMIO_QUEUE_NUM) = NUM;
    802073ac:	00003797          	auipc	a5,0x3
    802073b0:	c2c7b783          	ld	a5,-980(a5) # 80209fd8 <digits+0xc58>
    802073b4:	4721                	li	a4,8
    802073b6:	c398                	sw	a4,0(a5)
  memset(disk.pages, 0, sizeof(disk.pages));
    802073b8:	6609                	lui	a2,0x2
    802073ba:	4581                	li	a1,0
    802073bc:	0001c517          	auipc	a0,0x1c
    802073c0:	c4450513          	addi	a0,a0,-956 # 80223000 <disk>
    802073c4:	ffff9097          	auipc	ra,0xffff9
    802073c8:	3cc080e7          	jalr	972(ra) # 80200790 <memset>
  *R(VIRTIO_MMIO_QUEUE_PFN) = ((uint64)disk.pages) >> PGSHIFT;
    802073cc:	0001c717          	auipc	a4,0x1c
    802073d0:	c3470713          	addi	a4,a4,-972 # 80223000 <disk>
    802073d4:	00c75793          	srli	a5,a4,0xc
    802073d8:	2781                	sext.w	a5,a5
    802073da:	00003697          	auipc	a3,0x3
    802073de:	c066b683          	ld	a3,-1018(a3) # 80209fe0 <digits+0xc60>
    802073e2:	c29c                	sw	a5,0(a3)
  disk.desc = (struct VRingDesc *) disk.pages;
    802073e4:	0001e797          	auipc	a5,0x1e
    802073e8:	c1c78793          	addi	a5,a5,-996 # 80225000 <disk+0x2000>
    802073ec:	e398                	sd	a4,0(a5)
  disk.avail = (uint16*)(((char*)disk.desc) + NUM*sizeof(struct VRingDesc));
    802073ee:	0001c717          	auipc	a4,0x1c
    802073f2:	c9270713          	addi	a4,a4,-878 # 80223080 <disk+0x80>
    802073f6:	e798                	sd	a4,8(a5)
  disk.used = (struct UsedArea *) (disk.pages + PGSIZE);
    802073f8:	0001d717          	auipc	a4,0x1d
    802073fc:	c0870713          	addi	a4,a4,-1016 # 80224000 <disk+0x1000>
    80207400:	eb98                	sd	a4,16(a5)
    disk.free[i] = 1;
    80207402:	4705                	li	a4,1
    80207404:	00e78c23          	sb	a4,24(a5)
    80207408:	00e78ca3          	sb	a4,25(a5)
    8020740c:	00e78d23          	sb	a4,26(a5)
    80207410:	00e78da3          	sb	a4,27(a5)
    80207414:	00e78e23          	sb	a4,28(a5)
    80207418:	00e78ea3          	sb	a4,29(a5)
    8020741c:	00e78f23          	sb	a4,30(a5)
    80207420:	00e78fa3          	sb	a4,31(a5)
  printf("virtio_disk_init\n");
    80207424:	00003517          	auipc	a0,0x3
    80207428:	b3c50513          	addi	a0,a0,-1220 # 80209f60 <digits+0xbe0>
    8020742c:	ffff9097          	auipc	ra,0xffff9
    80207430:	d62080e7          	jalr	-670(ra) # 8020018e <printf>
}
    80207434:	60a2                	ld	ra,8(sp)
    80207436:	6402                	ld	s0,0(sp)
    80207438:	0141                	addi	sp,sp,16
    8020743a:	8082                	ret
    panic("could not find virtio disk");
    8020743c:	00003517          	auipc	a0,0x3
    80207440:	ac450513          	addi	a0,a0,-1340 # 80209f00 <digits+0xb80>
    80207444:	ffff9097          	auipc	ra,0xffff9
    80207448:	d00080e7          	jalr	-768(ra) # 80200144 <panic>
    panic("virtio disk has no queue 0");
    8020744c:	00003517          	auipc	a0,0x3
    80207450:	ad450513          	addi	a0,a0,-1324 # 80209f20 <digits+0xba0>
    80207454:	ffff9097          	auipc	ra,0xffff9
    80207458:	cf0080e7          	jalr	-784(ra) # 80200144 <panic>
    panic("virtio disk max queue too short");
    8020745c:	00003517          	auipc	a0,0x3
    80207460:	ae450513          	addi	a0,a0,-1308 # 80209f40 <digits+0xbc0>
    80207464:	ffff9097          	auipc	ra,0xffff9
    80207468:	ce0080e7          	jalr	-800(ra) # 80200144 <panic>

000000008020746c <virtio_disk_rw>:
  return 0;
}

void
virtio_disk_rw(struct buf *b, int write)
{
    8020746c:	7175                	addi	sp,sp,-144
    8020746e:	e506                	sd	ra,136(sp)
    80207470:	e122                	sd	s0,128(sp)
    80207472:	fca6                	sd	s1,120(sp)
    80207474:	f8ca                	sd	s2,112(sp)
    80207476:	f4ce                	sd	s3,104(sp)
    80207478:	f0d2                	sd	s4,96(sp)
    8020747a:	ecd6                	sd	s5,88(sp)
    8020747c:	e8da                	sd	s6,80(sp)
    8020747e:	e4de                	sd	s7,72(sp)
    80207480:	e0e2                	sd	s8,64(sp)
    80207482:	fc66                	sd	s9,56(sp)
    80207484:	f86a                	sd	s10,48(sp)
    80207486:	f46e                	sd	s11,40(sp)
    80207488:	0900                	addi	s0,sp,144
    8020748a:	8aaa                	mv	s5,a0
    8020748c:	8cae                	mv	s9,a1
  uint64 sector = b->sectorno;
    8020748e:	00c56d03          	lwu	s10,12(a0)

  acquire(&disk.vdisk_lock);
    80207492:	0001e517          	auipc	a0,0x1e
    80207496:	c1650513          	addi	a0,a0,-1002 # 802250a8 <disk+0x20a8>
    8020749a:	ffff9097          	auipc	ra,0xffff9
    8020749e:	25a080e7          	jalr	602(ra) # 802006f4 <acquire>
  for(int i = 0; i < 3; i++){
    802074a2:	4981                	li	s3,0
  for(int i = 0; i < NUM; i++){
    802074a4:	44a1                	li	s1,8
      disk.free[i] = 0;
    802074a6:	0001cc17          	auipc	s8,0x1c
    802074aa:	b5ac0c13          	addi	s8,s8,-1190 # 80223000 <disk>
    802074ae:	6b89                	lui	s7,0x2
  for(int i = 0; i < 3; i++){
    802074b0:	4b0d                	li	s6,3
    802074b2:	a0ad                	j	8020751c <virtio_disk_rw+0xb0>
      disk.free[i] = 0;
    802074b4:	00fc0733          	add	a4,s8,a5
    802074b8:	975e                	add	a4,a4,s7
    802074ba:	00070c23          	sb	zero,24(a4)
    idx[i] = alloc_desc();
    802074be:	c19c                	sw	a5,0(a1)
    if(idx[i] < 0){
    802074c0:	0207c563          	bltz	a5,802074ea <virtio_disk_rw+0x7e>
  for(int i = 0; i < 3; i++){
    802074c4:	2905                	addiw	s2,s2,1
    802074c6:	0611                	addi	a2,a2,4 # 2004 <_entry-0x801fdffc>
    802074c8:	19690e63          	beq	s2,s6,80207664 <virtio_disk_rw+0x1f8>
    idx[i] = alloc_desc();
    802074cc:	85b2                	mv	a1,a2
  for(int i = 0; i < NUM; i++){
    802074ce:	0001e717          	auipc	a4,0x1e
    802074d2:	b4a70713          	addi	a4,a4,-1206 # 80225018 <disk+0x2018>
    802074d6:	87ce                	mv	a5,s3
    if(disk.free[i]){
    802074d8:	00074683          	lbu	a3,0(a4)
    802074dc:	fee1                	bnez	a3,802074b4 <virtio_disk_rw+0x48>
  for(int i = 0; i < NUM; i++){
    802074de:	2785                	addiw	a5,a5,1
    802074e0:	0705                	addi	a4,a4,1
    802074e2:	fe979be3          	bne	a5,s1,802074d8 <virtio_disk_rw+0x6c>
    idx[i] = alloc_desc();
    802074e6:	57fd                	li	a5,-1
    802074e8:	c19c                	sw	a5,0(a1)
      for(int j = 0; j < i; j++)
    802074ea:	01205d63          	blez	s2,80207504 <virtio_disk_rw+0x98>
    802074ee:	8dce                	mv	s11,s3
        free_desc(idx[j]);
    802074f0:	000a2503          	lw	a0,0(s4)
    802074f4:	00000097          	auipc	ra,0x0
    802074f8:	d62080e7          	jalr	-670(ra) # 80207256 <free_desc>
      for(int j = 0; j < i; j++)
    802074fc:	2d85                	addiw	s11,s11,1
    802074fe:	0a11                	addi	s4,s4,4
    80207500:	ff2d98e3          	bne	s11,s2,802074f0 <virtio_disk_rw+0x84>
  int idx[3];
  while(1){
    if(alloc3_desc(idx) == 0) {
      break;
    }
    sleep(&disk.free[0], &disk.vdisk_lock);
    80207504:	0001e597          	auipc	a1,0x1e
    80207508:	ba458593          	addi	a1,a1,-1116 # 802250a8 <disk+0x20a8>
    8020750c:	0001e517          	auipc	a0,0x1e
    80207510:	b0c50513          	addi	a0,a0,-1268 # 80225018 <disk+0x2018>
    80207514:	ffffb097          	auipc	ra,0xffffb
    80207518:	e54080e7          	jalr	-428(ra) # 80202368 <sleep>
  for(int i = 0; i < 3; i++){
    8020751c:	f8040a13          	addi	s4,s0,-128
{
    80207520:	8652                	mv	a2,s4
  for(int i = 0; i < 3; i++){
    80207522:	894e                	mv	s2,s3
    80207524:	b765                	j	802074cc <virtio_disk_rw+0x60>
  disk.desc[idx[0]].next = idx[1];

  disk.desc[idx[1]].addr = (uint64) b->data;
  disk.desc[idx[1]].len = BSIZE;
  if(write)
    disk.desc[idx[1]].flags = 0; // device reads b->data
    80207526:	0001e717          	auipc	a4,0x1e
    8020752a:	ada73703          	ld	a4,-1318(a4) # 80225000 <disk+0x2000>
    8020752e:	973e                	add	a4,a4,a5
    80207530:	00071623          	sh	zero,12(a4)
  else
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
  disk.desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80207534:	0001c517          	auipc	a0,0x1c
    80207538:	acc50513          	addi	a0,a0,-1332 # 80223000 <disk>
    8020753c:	0001e717          	auipc	a4,0x1e
    80207540:	ac470713          	addi	a4,a4,-1340 # 80225000 <disk+0x2000>
    80207544:	6314                	ld	a3,0(a4)
    80207546:	96be                	add	a3,a3,a5
    80207548:	00c6d603          	lhu	a2,12(a3)
    8020754c:	00166613          	ori	a2,a2,1
    80207550:	00c69623          	sh	a2,12(a3)
  disk.desc[idx[1]].next = idx[2];
    80207554:	f8842683          	lw	a3,-120(s0)
    80207558:	6310                	ld	a2,0(a4)
    8020755a:	97b2                	add	a5,a5,a2
    8020755c:	00d79723          	sh	a3,14(a5)

  disk.info[idx[0]].status = 0;
    80207560:	20048613          	addi	a2,s1,512
    80207564:	0612                	slli	a2,a2,0x4
    80207566:	962a                	add	a2,a2,a0
    80207568:	02060823          	sb	zero,48(a2)
  disk.desc[idx[2]].addr = (uint64) &disk.info[idx[0]].status;
    8020756c:	00469793          	slli	a5,a3,0x4
    80207570:	630c                	ld	a1,0(a4)
    80207572:	95be                	add	a1,a1,a5
    80207574:	6689                	lui	a3,0x2
    80207576:	03068693          	addi	a3,a3,48 # 2030 <_entry-0x801fdfd0>
    8020757a:	96ca                	add	a3,a3,s2
    8020757c:	96aa                	add	a3,a3,a0
    8020757e:	e194                	sd	a3,0(a1)
  disk.desc[idx[2]].len = 1;
    80207580:	6314                	ld	a3,0(a4)
    80207582:	96be                	add	a3,a3,a5
    80207584:	4585                	li	a1,1
    80207586:	c68c                	sw	a1,8(a3)
  disk.desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80207588:	6314                	ld	a3,0(a4)
    8020758a:	96be                	add	a3,a3,a5
    8020758c:	4509                	li	a0,2
    8020758e:	00a69623          	sh	a0,12(a3)
  disk.desc[idx[2]].next = 0;
    80207592:	6314                	ld	a3,0(a4)
    80207594:	97b6                	add	a5,a5,a3
    80207596:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8020759a:	00baa223          	sw	a1,4(s5)
  disk.info[idx[0]].b = b;
    8020759e:	03563423          	sd	s5,40(a2)

  // avail[0] is flags
  // avail[1] tells the device how far to look in avail[2...].
  // avail[2...] are desc[] indices the device should process.
  // we only tell device the first index in our chain of descriptors.
  disk.avail[2 + (disk.avail[1] % NUM)] = idx[0];
    802075a2:	6714                	ld	a3,8(a4)
    802075a4:	0026d783          	lhu	a5,2(a3)
    802075a8:	8b9d                	andi	a5,a5,7
    802075aa:	0789                	addi	a5,a5,2
    802075ac:	0786                	slli	a5,a5,0x1
    802075ae:	96be                	add	a3,a3,a5
    802075b0:	00969023          	sh	s1,0(a3)
  __sync_synchronize();
    802075b4:	0ff0000f          	fence
  disk.avail[1] = disk.avail[1] + 1;
    802075b8:	6718                	ld	a4,8(a4)
    802075ba:	00275783          	lhu	a5,2(a4)
    802075be:	2785                	addiw	a5,a5,1
    802075c0:	00f71123          	sh	a5,2(a4)

  *R(VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    802075c4:	00003797          	auipc	a5,0x3
    802075c8:	a247b783          	ld	a5,-1500(a5) # 80209fe8 <digits+0xc68>
    802075cc:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    802075d0:	004aa783          	lw	a5,4(s5)
    802075d4:	02b79163          	bne	a5,a1,802075f6 <virtio_disk_rw+0x18a>
    sleep(b, &disk.vdisk_lock);
    802075d8:	0001e917          	auipc	s2,0x1e
    802075dc:	ad090913          	addi	s2,s2,-1328 # 802250a8 <disk+0x20a8>
  while(b->disk == 1) {
    802075e0:	4485                	li	s1,1
    sleep(b, &disk.vdisk_lock);
    802075e2:	85ca                	mv	a1,s2
    802075e4:	8556                	mv	a0,s5
    802075e6:	ffffb097          	auipc	ra,0xffffb
    802075ea:	d82080e7          	jalr	-638(ra) # 80202368 <sleep>
  while(b->disk == 1) {
    802075ee:	004aa783          	lw	a5,4(s5)
    802075f2:	fe9788e3          	beq	a5,s1,802075e2 <virtio_disk_rw+0x176>
  }

  disk.info[idx[0]].b = 0;
    802075f6:	f8042483          	lw	s1,-128(s0)
    802075fa:	20048713          	addi	a4,s1,512
    802075fe:	0712                	slli	a4,a4,0x4
    80207600:	0001c797          	auipc	a5,0x1c
    80207604:	a0078793          	addi	a5,a5,-1536 # 80223000 <disk>
    80207608:	97ba                	add	a5,a5,a4
    8020760a:	0207b423          	sd	zero,40(a5)
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    8020760e:	0001e917          	auipc	s2,0x1e
    80207612:	9f290913          	addi	s2,s2,-1550 # 80225000 <disk+0x2000>
    80207616:	a019                	j	8020761c <virtio_disk_rw+0x1b0>
      i = disk.desc[i].next;
    80207618:	00e7d483          	lhu	s1,14(a5)
    free_desc(i);
    8020761c:	8526                	mv	a0,s1
    8020761e:	00000097          	auipc	ra,0x0
    80207622:	c38080e7          	jalr	-968(ra) # 80207256 <free_desc>
    if(disk.desc[i].flags & VRING_DESC_F_NEXT)
    80207626:	0492                	slli	s1,s1,0x4
    80207628:	00093783          	ld	a5,0(s2)
    8020762c:	97a6                	add	a5,a5,s1
    8020762e:	00c7d703          	lhu	a4,12(a5)
    80207632:	8b05                	andi	a4,a4,1
    80207634:	f375                	bnez	a4,80207618 <virtio_disk_rw+0x1ac>
  free_chain(idx[0]);

  release(&disk.vdisk_lock);
    80207636:	0001e517          	auipc	a0,0x1e
    8020763a:	a7250513          	addi	a0,a0,-1422 # 802250a8 <disk+0x20a8>
    8020763e:	ffff9097          	auipc	ra,0xffff9
    80207642:	10a080e7          	jalr	266(ra) # 80200748 <release>
}
    80207646:	60aa                	ld	ra,136(sp)
    80207648:	640a                	ld	s0,128(sp)
    8020764a:	74e6                	ld	s1,120(sp)
    8020764c:	7946                	ld	s2,112(sp)
    8020764e:	79a6                	ld	s3,104(sp)
    80207650:	7a06                	ld	s4,96(sp)
    80207652:	6ae6                	ld	s5,88(sp)
    80207654:	6b46                	ld	s6,80(sp)
    80207656:	6ba6                	ld	s7,72(sp)
    80207658:	6c06                	ld	s8,64(sp)
    8020765a:	7ce2                	ld	s9,56(sp)
    8020765c:	7d42                	ld	s10,48(sp)
    8020765e:	7da2                	ld	s11,40(sp)
    80207660:	6149                	addi	sp,sp,144
    80207662:	8082                	ret
  if(write)
    80207664:	019037b3          	snez	a5,s9
    80207668:	f6f42823          	sw	a5,-144(s0)
  buf0.reserved = 0;
    8020766c:	f6042a23          	sw	zero,-140(s0)
  buf0.sector = sector;
    80207670:	f7a43c23          	sd	s10,-136(s0)
  disk.desc[idx[0]].addr = (uint64) kwalkaddr(myproc()->kpagetable, (uint64) &buf0);
    80207674:	ffffa097          	auipc	ra,0xffffa
    80207678:	464080e7          	jalr	1124(ra) # 80201ad8 <myproc>
    8020767c:	f8042483          	lw	s1,-128(s0)
    80207680:	00449913          	slli	s2,s1,0x4
    80207684:	0001e997          	auipc	s3,0x1e
    80207688:	97c98993          	addi	s3,s3,-1668 # 80225000 <disk+0x2000>
    8020768c:	0009ba03          	ld	s4,0(s3)
    80207690:	9a4a                	add	s4,s4,s2
    80207692:	f7040593          	addi	a1,s0,-144
    80207696:	6d28                	ld	a0,88(a0)
    80207698:	ffff9097          	auipc	ra,0xffff9
    8020769c:	5be080e7          	jalr	1470(ra) # 80200c56 <kwalkaddr>
    802076a0:	00aa3023          	sd	a0,0(s4)
  disk.desc[idx[0]].len = sizeof(buf0);
    802076a4:	0009b783          	ld	a5,0(s3)
    802076a8:	97ca                	add	a5,a5,s2
    802076aa:	4741                	li	a4,16
    802076ac:	c798                	sw	a4,8(a5)
  disk.desc[idx[0]].flags = VRING_DESC_F_NEXT;
    802076ae:	0009b783          	ld	a5,0(s3)
    802076b2:	97ca                	add	a5,a5,s2
    802076b4:	4705                	li	a4,1
    802076b6:	00e79623          	sh	a4,12(a5)
  disk.desc[idx[0]].next = idx[1];
    802076ba:	f8442783          	lw	a5,-124(s0)
    802076be:	0009b703          	ld	a4,0(s3)
    802076c2:	974a                	add	a4,a4,s2
    802076c4:	00f71723          	sh	a5,14(a4)
  disk.desc[idx[1]].addr = (uint64) b->data;
    802076c8:	0792                	slli	a5,a5,0x4
    802076ca:	0009b703          	ld	a4,0(s3)
    802076ce:	973e                	add	a4,a4,a5
    802076d0:	058a8693          	addi	a3,s5,88
    802076d4:	e314                	sd	a3,0(a4)
  disk.desc[idx[1]].len = BSIZE;
    802076d6:	0009b703          	ld	a4,0(s3)
    802076da:	973e                	add	a4,a4,a5
    802076dc:	20000693          	li	a3,512
    802076e0:	c714                	sw	a3,8(a4)
  if(write)
    802076e2:	e40c92e3          	bnez	s9,80207526 <virtio_disk_rw+0xba>
    disk.desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    802076e6:	0001e717          	auipc	a4,0x1e
    802076ea:	91a73703          	ld	a4,-1766(a4) # 80225000 <disk+0x2000>
    802076ee:	973e                	add	a4,a4,a5
    802076f0:	4689                	li	a3,2
    802076f2:	00d71623          	sh	a3,12(a4)
    802076f6:	bd3d                	j	80207534 <virtio_disk_rw+0xc8>

00000000802076f8 <virtio_disk_intr>:

void
virtio_disk_intr()
{
    802076f8:	1101                	addi	sp,sp,-32
    802076fa:	ec06                	sd	ra,24(sp)
    802076fc:	e822                	sd	s0,16(sp)
    802076fe:	e426                	sd	s1,8(sp)
    80207700:	e04a                	sd	s2,0(sp)
    80207702:	1000                	addi	s0,sp,32
  acquire(&disk.vdisk_lock);
    80207704:	0001e517          	auipc	a0,0x1e
    80207708:	9a450513          	addi	a0,a0,-1628 # 802250a8 <disk+0x20a8>
    8020770c:	ffff9097          	auipc	ra,0xffff9
    80207710:	fe8080e7          	jalr	-24(ra) # 802006f4 <acquire>

  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207714:	0001e717          	auipc	a4,0x1e
    80207718:	8ec70713          	addi	a4,a4,-1812 # 80225000 <disk+0x2000>
    8020771c:	02075783          	lhu	a5,32(a4)
    80207720:	6b18                	ld	a4,16(a4)
    80207722:	00275683          	lhu	a3,2(a4)
    80207726:	8ebd                	xor	a3,a3,a5
    80207728:	8a9d                	andi	a3,a3,7
    8020772a:	cab9                	beqz	a3,80207780 <virtio_disk_intr+0x88>
    int id = disk.used->elems[disk.used_idx].id;

    if(disk.info[id].status != 0)
    8020772c:	0001c917          	auipc	s2,0x1c
    80207730:	8d490913          	addi	s2,s2,-1836 # 80223000 <disk>
      panic("virtio_disk_intr status");
    
    disk.info[id].b->disk = 0;   // disk is done with buf
    wakeup(disk.info[id].b);

    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207734:	0001e497          	auipc	s1,0x1e
    80207738:	8cc48493          	addi	s1,s1,-1844 # 80225000 <disk+0x2000>
    int id = disk.used->elems[disk.used_idx].id;
    8020773c:	078e                	slli	a5,a5,0x3
    8020773e:	973e                	add	a4,a4,a5
    80207740:	435c                	lw	a5,4(a4)
    if(disk.info[id].status != 0)
    80207742:	20078713          	addi	a4,a5,512
    80207746:	0712                	slli	a4,a4,0x4
    80207748:	974a                	add	a4,a4,s2
    8020774a:	03074703          	lbu	a4,48(a4)
    8020774e:	e335                	bnez	a4,802077b2 <virtio_disk_intr+0xba>
    disk.info[id].b->disk = 0;   // disk is done with buf
    80207750:	20078793          	addi	a5,a5,512
    80207754:	0792                	slli	a5,a5,0x4
    80207756:	97ca                	add	a5,a5,s2
    80207758:	7798                	ld	a4,40(a5)
    8020775a:	00072223          	sw	zero,4(a4)
    wakeup(disk.info[id].b);
    8020775e:	7788                	ld	a0,40(a5)
    80207760:	ffffb097          	auipc	ra,0xffffb
    80207764:	d84080e7          	jalr	-636(ra) # 802024e4 <wakeup>
    disk.used_idx = (disk.used_idx + 1) % NUM;
    80207768:	0204d783          	lhu	a5,32(s1)
    8020776c:	2785                	addiw	a5,a5,1
    8020776e:	8b9d                	andi	a5,a5,7
    80207770:	02f49023          	sh	a5,32(s1)
  while((disk.used_idx % NUM) != (disk.used->id % NUM)){
    80207774:	6898                	ld	a4,16(s1)
    80207776:	00275683          	lhu	a3,2(a4)
    8020777a:	8a9d                	andi	a3,a3,7
    8020777c:	fcf690e3          	bne	a3,a5,8020773c <virtio_disk_intr+0x44>
  }
  *R(VIRTIO_MMIO_INTERRUPT_ACK) = *R(VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80207780:	00003797          	auipc	a5,0x3
    80207784:	8707b783          	ld	a5,-1936(a5) # 80209ff0 <digits+0xc70>
    80207788:	439c                	lw	a5,0(a5)
    8020778a:	8b8d                	andi	a5,a5,3
    8020778c:	00003717          	auipc	a4,0x3
    80207790:	86c73703          	ld	a4,-1940(a4) # 80209ff8 <digits+0xc78>
    80207794:	c31c                	sw	a5,0(a4)

  release(&disk.vdisk_lock);
    80207796:	0001e517          	auipc	a0,0x1e
    8020779a:	91250513          	addi	a0,a0,-1774 # 802250a8 <disk+0x20a8>
    8020779e:	ffff9097          	auipc	ra,0xffff9
    802077a2:	faa080e7          	jalr	-86(ra) # 80200748 <release>
}
    802077a6:	60e2                	ld	ra,24(sp)
    802077a8:	6442                	ld	s0,16(sp)
    802077aa:	64a2                	ld	s1,8(sp)
    802077ac:	6902                	ld	s2,0(sp)
    802077ae:	6105                	addi	sp,sp,32
    802077b0:	8082                	ret
      panic("virtio_disk_intr status");
    802077b2:	00002517          	auipc	a0,0x2
    802077b6:	7c650513          	addi	a0,a0,1990 # 80209f78 <digits+0xbf8>
    802077ba:	ffff9097          	auipc	ra,0xffff9
    802077be:	98a080e7          	jalr	-1654(ra) # 80200144 <panic>
	...

0000000080208000 <_trampoline>:
    80208000:	14051573          	csrrw	a0,sscratch,a0
    80208004:	02153423          	sd	ra,40(a0)
    80208008:	02253823          	sd	sp,48(a0)
    8020800c:	02353c23          	sd	gp,56(a0)
    80208010:	04453023          	sd	tp,64(a0)
    80208014:	04553423          	sd	t0,72(a0)
    80208018:	04653823          	sd	t1,80(a0)
    8020801c:	04753c23          	sd	t2,88(a0)
    80208020:	f120                	sd	s0,96(a0)
    80208022:	f524                	sd	s1,104(a0)
    80208024:	fd2c                	sd	a1,120(a0)
    80208026:	e150                	sd	a2,128(a0)
    80208028:	e554                	sd	a3,136(a0)
    8020802a:	e958                	sd	a4,144(a0)
    8020802c:	ed5c                	sd	a5,152(a0)
    8020802e:	0b053023          	sd	a6,160(a0)
    80208032:	0b153423          	sd	a7,168(a0)
    80208036:	0b253823          	sd	s2,176(a0)
    8020803a:	0b353c23          	sd	s3,184(a0)
    8020803e:	0d453023          	sd	s4,192(a0)
    80208042:	0d553423          	sd	s5,200(a0)
    80208046:	0d653823          	sd	s6,208(a0)
    8020804a:	0d753c23          	sd	s7,216(a0)
    8020804e:	0f853023          	sd	s8,224(a0)
    80208052:	0f953423          	sd	s9,232(a0)
    80208056:	0fa53823          	sd	s10,240(a0)
    8020805a:	0fb53c23          	sd	s11,248(a0)
    8020805e:	11c53023          	sd	t3,256(a0)
    80208062:	11d53423          	sd	t4,264(a0)
    80208066:	11e53823          	sd	t5,272(a0)
    8020806a:	11f53c23          	sd	t6,280(a0)
    8020806e:	140022f3          	csrr	t0,sscratch
    80208072:	06553823          	sd	t0,112(a0)
    80208076:	00853103          	ld	sp,8(a0)
    8020807a:	02053203          	ld	tp,32(a0)
    8020807e:	01053283          	ld	t0,16(a0)
    80208082:	00053303          	ld	t1,0(a0)
    80208086:	18031073          	csrw	satp,t1
    8020808a:	12000073          	sfence.vma
    8020808e:	8282                	jr	t0

0000000080208090 <userret>:
    80208090:	18059073          	csrw	satp,a1
    80208094:	12000073          	sfence.vma
    80208098:	07053283          	ld	t0,112(a0)
    8020809c:	14029073          	csrw	sscratch,t0
    802080a0:	02853083          	ld	ra,40(a0)
    802080a4:	03053103          	ld	sp,48(a0)
    802080a8:	03853183          	ld	gp,56(a0)
    802080ac:	04053203          	ld	tp,64(a0)
    802080b0:	04853283          	ld	t0,72(a0)
    802080b4:	05053303          	ld	t1,80(a0)
    802080b8:	05853383          	ld	t2,88(a0)
    802080bc:	7120                	ld	s0,96(a0)
    802080be:	7524                	ld	s1,104(a0)
    802080c0:	7d2c                	ld	a1,120(a0)
    802080c2:	6150                	ld	a2,128(a0)
    802080c4:	6554                	ld	a3,136(a0)
    802080c6:	6958                	ld	a4,144(a0)
    802080c8:	6d5c                	ld	a5,152(a0)
    802080ca:	0a053803          	ld	a6,160(a0)
    802080ce:	0a853883          	ld	a7,168(a0)
    802080d2:	0b053903          	ld	s2,176(a0)
    802080d6:	0b853983          	ld	s3,184(a0)
    802080da:	0c053a03          	ld	s4,192(a0)
    802080de:	0c853a83          	ld	s5,200(a0)
    802080e2:	0d053b03          	ld	s6,208(a0)
    802080e6:	0d853b83          	ld	s7,216(a0)
    802080ea:	0e053c03          	ld	s8,224(a0)
    802080ee:	0e853c83          	ld	s9,232(a0)
    802080f2:	0f053d03          	ld	s10,240(a0)
    802080f6:	0f853d83          	ld	s11,248(a0)
    802080fa:	10053e03          	ld	t3,256(a0)
    802080fe:	10853e83          	ld	t4,264(a0)
    80208102:	11053f03          	ld	t5,272(a0)
    80208106:	11853f83          	ld	t6,280(a0)
    8020810a:	14051573          	csrrw	a0,sscratch,a0
    8020810e:	10200073          	sret
	...
