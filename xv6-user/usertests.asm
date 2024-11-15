
xv6-user/_usertests:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <copyinstr1>:
}

// what if you pass ridiculous string pointers to system calls?
void
copyinstr1(char *s)
{
       0:	1141                	addi	sp,sp,-16
       2:	e406                	sd	ra,8(sp)
       4:	e022                	sd	s0,0(sp)
       6:	0800                	addi	s0,sp,16
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };

  for(int ai = 0; ai < 2; ai++){
    uint64 addr = addrs[ai];

    int fd = open((char *)addr, O_CREATE|O_WRONLY);
       8:	20100593          	li	a1,513
       c:	4505                	li	a0,1
       e:	057e                	slli	a0,a0,0x1f
      10:	00005097          	auipc	ra,0x5
      14:	93a080e7          	jalr	-1734(ra) # 494a <open>
    if(fd >= 0){
      18:	02055063          	bgez	a0,38 <copyinstr1+0x38>
    int fd = open((char *)addr, O_CREATE|O_WRONLY);
      1c:	20100593          	li	a1,513
      20:	557d                	li	a0,-1
      22:	00005097          	auipc	ra,0x5
      26:	928080e7          	jalr	-1752(ra) # 494a <open>
    uint64 addr = addrs[ai];
      2a:	55fd                	li	a1,-1
    if(fd >= 0){
      2c:	00055863          	bgez	a0,3c <copyinstr1+0x3c>
      printf("open(%p) returned %d, not -1\n", addr, fd);
      exit(1);
    }
  }
}
      30:	60a2                	ld	ra,8(sp)
      32:	6402                	ld	s0,0(sp)
      34:	0141                	addi	sp,sp,16
      36:	8082                	ret
    uint64 addr = addrs[ai];
      38:	4585                	li	a1,1
      3a:	05fe                	slli	a1,a1,0x1f
      printf("open(%p) returned %d, not -1\n", addr, fd);
      3c:	862a                	mv	a2,a0
      3e:	00005517          	auipc	a0,0x5
      42:	e1250513          	addi	a0,a0,-494 # 4e50 <malloc+0xec>
      46:	00005097          	auipc	ra,0x5
      4a:	c66080e7          	jalr	-922(ra) # 4cac <printf>
      exit(1);
      4e:	4505                	li	a0,1
      50:	00005097          	auipc	ra,0x5
      54:	8b4080e7          	jalr	-1868(ra) # 4904 <exit>

0000000000000058 <validatetest>:
  } 
}

void
validatetest(char *s)
{
      58:	7139                	addi	sp,sp,-64
      5a:	fc06                	sd	ra,56(sp)
      5c:	f822                	sd	s0,48(sp)
      5e:	f426                	sd	s1,40(sp)
      60:	f04a                	sd	s2,32(sp)
      62:	ec4e                	sd	s3,24(sp)
      64:	e852                	sd	s4,16(sp)
      66:	e456                	sd	s5,8(sp)
      68:	e05a                	sd	s6,0(sp)
      6a:	0080                	addi	s0,sp,64
      6c:	8b2a                	mv	s6,a0
  int hi;
  uint64 p;

  hi = 1100*1024;
  for(p = 0; p <= (uint)hi; p += PGSIZE){
      6e:	4481                	li	s1,0
    // try to crash the kernel by passing in a bad string pointer
    if(open((char*)p, O_RDONLY) != -1){
      70:	597d                	li	s2,-1
  for(p = 0; p <= (uint)hi; p += PGSIZE){
      72:	6a05                	lui	s4,0x1
      74:	001149b7          	lui	s3,0x114
    if(open((char*)p, O_RDONLY) != -1){
      78:	4581                	li	a1,0
      7a:	8526                	mv	a0,s1
      7c:	00005097          	auipc	ra,0x5
      80:	8ce080e7          	jalr	-1842(ra) # 494a <open>
      84:	01251f63          	bne	a0,s2,a2 <validatetest+0x4a>
  for(p = 0; p <= (uint)hi; p += PGSIZE){
      88:	94d2                	add	s1,s1,s4
      8a:	ff3497e3          	bne	s1,s3,78 <validatetest+0x20>
      printf("%s: link should not succeed\n", s);
      printf("bad string:[%s]\n", (char*)p);
      exit(1);
    }
  }
}
      8e:	70e2                	ld	ra,56(sp)
      90:	7442                	ld	s0,48(sp)
      92:	74a2                	ld	s1,40(sp)
      94:	7902                	ld	s2,32(sp)
      96:	69e2                	ld	s3,24(sp)
      98:	6a42                	ld	s4,16(sp)
      9a:	6aa2                	ld	s5,8(sp)
      9c:	6b02                	ld	s6,0(sp)
      9e:	6121                	addi	sp,sp,64
      a0:	8082                	ret
      printf("%s: link should not succeed\n", s);
      a2:	85da                	mv	a1,s6
      a4:	00005517          	auipc	a0,0x5
      a8:	dcc50513          	addi	a0,a0,-564 # 4e70 <malloc+0x10c>
      ac:	00005097          	auipc	ra,0x5
      b0:	c00080e7          	jalr	-1024(ra) # 4cac <printf>
      printf("bad string:[%s]\n", (char*)p);
      b4:	85a6                	mv	a1,s1
      b6:	00005517          	auipc	a0,0x5
      ba:	dda50513          	addi	a0,a0,-550 # 4e90 <malloc+0x12c>
      be:	00005097          	auipc	ra,0x5
      c2:	bee080e7          	jalr	-1042(ra) # 4cac <printf>
      exit(1);
      c6:	4505                	li	a0,1
      c8:	00005097          	auipc	ra,0x5
      cc:	83c080e7          	jalr	-1988(ra) # 4904 <exit>

00000000000000d0 <bsstest>:
void
bsstest(char *s)
{
  int i;

  for(i = 0; i < sizeof(uninit); i++){
      d0:	00008797          	auipc	a5,0x8
      d4:	09878793          	addi	a5,a5,152 # 8168 <uninit>
      d8:	0000a697          	auipc	a3,0xa
      dc:	7a068693          	addi	a3,a3,1952 # a878 <buf>
    if(uninit[i] != '\0'){
      e0:	0007c703          	lbu	a4,0(a5)
      e4:	e709                	bnez	a4,ee <bsstest+0x1e>
  for(i = 0; i < sizeof(uninit); i++){
      e6:	0785                	addi	a5,a5,1
      e8:	fed79ce3          	bne	a5,a3,e0 <bsstest+0x10>
      ec:	8082                	ret
{
      ee:	1141                	addi	sp,sp,-16
      f0:	e406                	sd	ra,8(sp)
      f2:	e022                	sd	s0,0(sp)
      f4:	0800                	addi	s0,sp,16
      printf("%s: bss test failed\n", s);
      f6:	85aa                	mv	a1,a0
      f8:	00005517          	auipc	a0,0x5
      fc:	db050513          	addi	a0,a0,-592 # 4ea8 <malloc+0x144>
     100:	00005097          	auipc	ra,0x5
     104:	bac080e7          	jalr	-1108(ra) # 4cac <printf>
      exit(1);
     108:	4505                	li	a0,1
     10a:	00004097          	auipc	ra,0x4
     10e:	7fa080e7          	jalr	2042(ra) # 4904 <exit>

0000000000000112 <opentest>:
{
     112:	1101                	addi	sp,sp,-32
     114:	ec06                	sd	ra,24(sp)
     116:	e822                	sd	s0,16(sp)
     118:	e426                	sd	s1,8(sp)
     11a:	1000                	addi	s0,sp,32
     11c:	84aa                	mv	s1,a0
  fd = open("echo", 0);
     11e:	4581                	li	a1,0
     120:	00005517          	auipc	a0,0x5
     124:	da050513          	addi	a0,a0,-608 # 4ec0 <malloc+0x15c>
     128:	00005097          	auipc	ra,0x5
     12c:	822080e7          	jalr	-2014(ra) # 494a <open>
  if(fd < 0){
     130:	02054663          	bltz	a0,15c <opentest+0x4a>
  close(fd);
     134:	00004097          	auipc	ra,0x4
     138:	7fc080e7          	jalr	2044(ra) # 4930 <close>
  fd = open("doesnotexist", 0);
     13c:	4581                	li	a1,0
     13e:	00005517          	auipc	a0,0x5
     142:	da250513          	addi	a0,a0,-606 # 4ee0 <malloc+0x17c>
     146:	00005097          	auipc	ra,0x5
     14a:	804080e7          	jalr	-2044(ra) # 494a <open>
  if(fd >= 0){
     14e:	02055563          	bgez	a0,178 <opentest+0x66>
}
     152:	60e2                	ld	ra,24(sp)
     154:	6442                	ld	s0,16(sp)
     156:	64a2                	ld	s1,8(sp)
     158:	6105                	addi	sp,sp,32
     15a:	8082                	ret
    printf("%s: open echo failed!\n", s);
     15c:	85a6                	mv	a1,s1
     15e:	00005517          	auipc	a0,0x5
     162:	d6a50513          	addi	a0,a0,-662 # 4ec8 <malloc+0x164>
     166:	00005097          	auipc	ra,0x5
     16a:	b46080e7          	jalr	-1210(ra) # 4cac <printf>
    exit(1);
     16e:	4505                	li	a0,1
     170:	00004097          	auipc	ra,0x4
     174:	794080e7          	jalr	1940(ra) # 4904 <exit>
    printf("%s: open doesnotexist succeeded!\n", s);
     178:	85a6                	mv	a1,s1
     17a:	00005517          	auipc	a0,0x5
     17e:	d7650513          	addi	a0,a0,-650 # 4ef0 <malloc+0x18c>
     182:	00005097          	auipc	ra,0x5
     186:	b2a080e7          	jalr	-1238(ra) # 4cac <printf>
    exit(1);
     18a:	4505                	li	a0,1
     18c:	00004097          	auipc	ra,0x4
     190:	778080e7          	jalr	1912(ra) # 4904 <exit>

0000000000000194 <truncate2>:
{
     194:	7179                	addi	sp,sp,-48
     196:	f406                	sd	ra,40(sp)
     198:	f022                	sd	s0,32(sp)
     19a:	ec26                	sd	s1,24(sp)
     19c:	e84a                	sd	s2,16(sp)
     19e:	e44e                	sd	s3,8(sp)
     1a0:	1800                	addi	s0,sp,48
     1a2:	89aa                	mv	s3,a0
  remove("truncfile");
     1a4:	00005517          	auipc	a0,0x5
     1a8:	d7450513          	addi	a0,a0,-652 # 4f18 <malloc+0x1b4>
     1ac:	00005097          	auipc	ra,0x5
     1b0:	808080e7          	jalr	-2040(ra) # 49b4 <remove>
  int fd1 = open("truncfile", O_CREATE|O_TRUNC|O_WRONLY);
     1b4:	60100593          	li	a1,1537
     1b8:	00005517          	auipc	a0,0x5
     1bc:	d6050513          	addi	a0,a0,-672 # 4f18 <malloc+0x1b4>
     1c0:	00004097          	auipc	ra,0x4
     1c4:	78a080e7          	jalr	1930(ra) # 494a <open>
     1c8:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     1ca:	4611                	li	a2,4
     1cc:	00005597          	auipc	a1,0x5
     1d0:	d5c58593          	addi	a1,a1,-676 # 4f28 <malloc+0x1c4>
     1d4:	00004097          	auipc	ra,0x4
     1d8:	752080e7          	jalr	1874(ra) # 4926 <write>
  int fd2 = open("truncfile", O_TRUNC|O_WRONLY);
     1dc:	40100593          	li	a1,1025
     1e0:	00005517          	auipc	a0,0x5
     1e4:	d3850513          	addi	a0,a0,-712 # 4f18 <malloc+0x1b4>
     1e8:	00004097          	auipc	ra,0x4
     1ec:	762080e7          	jalr	1890(ra) # 494a <open>
     1f0:	892a                	mv	s2,a0
  int n = write(fd1, "x", 1);
     1f2:	4605                	li	a2,1
     1f4:	00005597          	auipc	a1,0x5
     1f8:	d3c58593          	addi	a1,a1,-708 # 4f30 <malloc+0x1cc>
     1fc:	8526                	mv	a0,s1
     1fe:	00004097          	auipc	ra,0x4
     202:	728080e7          	jalr	1832(ra) # 4926 <write>
  if(n != -1){
     206:	57fd                	li	a5,-1
     208:	02f51b63          	bne	a0,a5,23e <truncate2+0xaa>
  remove("truncfile");
     20c:	00005517          	auipc	a0,0x5
     210:	d0c50513          	addi	a0,a0,-756 # 4f18 <malloc+0x1b4>
     214:	00004097          	auipc	ra,0x4
     218:	7a0080e7          	jalr	1952(ra) # 49b4 <remove>
  close(fd1);
     21c:	8526                	mv	a0,s1
     21e:	00004097          	auipc	ra,0x4
     222:	712080e7          	jalr	1810(ra) # 4930 <close>
  close(fd2);
     226:	854a                	mv	a0,s2
     228:	00004097          	auipc	ra,0x4
     22c:	708080e7          	jalr	1800(ra) # 4930 <close>
}
     230:	70a2                	ld	ra,40(sp)
     232:	7402                	ld	s0,32(sp)
     234:	64e2                	ld	s1,24(sp)
     236:	6942                	ld	s2,16(sp)
     238:	69a2                	ld	s3,8(sp)
     23a:	6145                	addi	sp,sp,48
     23c:	8082                	ret
    printf("%s: write returned %d, expected -1\n", s, n);
     23e:	862a                	mv	a2,a0
     240:	85ce                	mv	a1,s3
     242:	00005517          	auipc	a0,0x5
     246:	cf650513          	addi	a0,a0,-778 # 4f38 <malloc+0x1d4>
     24a:	00005097          	auipc	ra,0x5
     24e:	a62080e7          	jalr	-1438(ra) # 4cac <printf>
    exit(1);
     252:	4505                	li	a0,1
     254:	00004097          	auipc	ra,0x4
     258:	6b0080e7          	jalr	1712(ra) # 4904 <exit>

000000000000025c <createtest>:
{
     25c:	7179                	addi	sp,sp,-48
     25e:	f406                	sd	ra,40(sp)
     260:	f022                	sd	s0,32(sp)
     262:	ec26                	sd	s1,24(sp)
     264:	e84a                	sd	s2,16(sp)
     266:	e44e                	sd	s3,8(sp)
     268:	1800                	addi	s0,sp,48
  name[0] = 'a';
     26a:	00007797          	auipc	a5,0x7
     26e:	dee78793          	addi	a5,a5,-530 # 7058 <name>
     272:	06100713          	li	a4,97
     276:	00e78023          	sb	a4,0(a5)
  name[2] = '\0';
     27a:	00078123          	sb	zero,2(a5)
     27e:	03000493          	li	s1,48
    name[1] = '0' + i;
     282:	893e                	mv	s2,a5
  for(i = 0; i < N; i++){
     284:	06400993          	li	s3,100
    name[1] = '0' + i;
     288:	009900a3          	sb	s1,1(s2)
    fd = open(name, O_CREATE|O_RDWR);
     28c:	20200593          	li	a1,514
     290:	854a                	mv	a0,s2
     292:	00004097          	auipc	ra,0x4
     296:	6b8080e7          	jalr	1720(ra) # 494a <open>
    close(fd);
     29a:	00004097          	auipc	ra,0x4
     29e:	696080e7          	jalr	1686(ra) # 4930 <close>
  for(i = 0; i < N; i++){
     2a2:	2485                	addiw	s1,s1,1
     2a4:	0ff4f493          	zext.b	s1,s1
     2a8:	ff3490e3          	bne	s1,s3,288 <createtest+0x2c>
  name[0] = 'a';
     2ac:	00007797          	auipc	a5,0x7
     2b0:	dac78793          	addi	a5,a5,-596 # 7058 <name>
     2b4:	06100713          	li	a4,97
     2b8:	00e78023          	sb	a4,0(a5)
  name[2] = '\0';
     2bc:	00078123          	sb	zero,2(a5)
     2c0:	03000493          	li	s1,48
    name[1] = '0' + i;
     2c4:	893e                	mv	s2,a5
  for(i = 0; i < N; i++){
     2c6:	06400993          	li	s3,100
    name[1] = '0' + i;
     2ca:	009900a3          	sb	s1,1(s2)
    remove(name);
     2ce:	854a                	mv	a0,s2
     2d0:	00004097          	auipc	ra,0x4
     2d4:	6e4080e7          	jalr	1764(ra) # 49b4 <remove>
  for(i = 0; i < N; i++){
     2d8:	2485                	addiw	s1,s1,1
     2da:	0ff4f493          	zext.b	s1,s1
     2de:	ff3496e3          	bne	s1,s3,2ca <createtest+0x6e>
}
     2e2:	70a2                	ld	ra,40(sp)
     2e4:	7402                	ld	s0,32(sp)
     2e6:	64e2                	ld	s1,24(sp)
     2e8:	6942                	ld	s2,16(sp)
     2ea:	69a2                	ld	s3,8(sp)
     2ec:	6145                	addi	sp,sp,48
     2ee:	8082                	ret

00000000000002f0 <bigwrite>:
{
     2f0:	715d                	addi	sp,sp,-80
     2f2:	e486                	sd	ra,72(sp)
     2f4:	e0a2                	sd	s0,64(sp)
     2f6:	fc26                	sd	s1,56(sp)
     2f8:	f84a                	sd	s2,48(sp)
     2fa:	f44e                	sd	s3,40(sp)
     2fc:	f052                	sd	s4,32(sp)
     2fe:	ec56                	sd	s5,24(sp)
     300:	e85a                	sd	s6,16(sp)
     302:	e45e                	sd	s7,8(sp)
     304:	0880                	addi	s0,sp,80
     306:	8baa                	mv	s7,a0
  remove("bigwrite");
     308:	00005517          	auipc	a0,0x5
     30c:	c5850513          	addi	a0,a0,-936 # 4f60 <malloc+0x1fc>
     310:	00004097          	auipc	ra,0x4
     314:	6a4080e7          	jalr	1700(ra) # 49b4 <remove>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     318:	1f300493          	li	s1,499
    fd = open("bigwrite", O_CREATE | O_RDWR);
     31c:	00005a97          	auipc	s5,0x5
     320:	c44a8a93          	addi	s5,s5,-956 # 4f60 <malloc+0x1fc>
      int cc = write(fd, buf, sz);
     324:	0000aa17          	auipc	s4,0xa
     328:	554a0a13          	addi	s4,s4,1364 # a878 <buf>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     32c:	6b09                	lui	s6,0x2
     32e:	807b0b13          	addi	s6,s6,-2041 # 1807 <forkfork+0x49>
    fd = open("bigwrite", O_CREATE | O_RDWR);
     332:	20200593          	li	a1,514
     336:	8556                	mv	a0,s5
     338:	00004097          	auipc	ra,0x4
     33c:	612080e7          	jalr	1554(ra) # 494a <open>
     340:	892a                	mv	s2,a0
    if(fd < 0){
     342:	04054d63          	bltz	a0,39c <bigwrite+0xac>
      int cc = write(fd, buf, sz);
     346:	8626                	mv	a2,s1
     348:	85d2                	mv	a1,s4
     34a:	00004097          	auipc	ra,0x4
     34e:	5dc080e7          	jalr	1500(ra) # 4926 <write>
     352:	89aa                	mv	s3,a0
      if(cc != sz){
     354:	06a49263          	bne	s1,a0,3b8 <bigwrite+0xc8>
      int cc = write(fd, buf, sz);
     358:	8626                	mv	a2,s1
     35a:	85d2                	mv	a1,s4
     35c:	854a                	mv	a0,s2
     35e:	00004097          	auipc	ra,0x4
     362:	5c8080e7          	jalr	1480(ra) # 4926 <write>
      if(cc != sz){
     366:	04951a63          	bne	a0,s1,3ba <bigwrite+0xca>
    close(fd);
     36a:	854a                	mv	a0,s2
     36c:	00004097          	auipc	ra,0x4
     370:	5c4080e7          	jalr	1476(ra) # 4930 <close>
    remove("bigwrite");
     374:	8556                	mv	a0,s5
     376:	00004097          	auipc	ra,0x4
     37a:	63e080e7          	jalr	1598(ra) # 49b4 <remove>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
     37e:	1d74849b          	addiw	s1,s1,471
     382:	fb6498e3          	bne	s1,s6,332 <bigwrite+0x42>
}
     386:	60a6                	ld	ra,72(sp)
     388:	6406                	ld	s0,64(sp)
     38a:	74e2                	ld	s1,56(sp)
     38c:	7942                	ld	s2,48(sp)
     38e:	79a2                	ld	s3,40(sp)
     390:	7a02                	ld	s4,32(sp)
     392:	6ae2                	ld	s5,24(sp)
     394:	6b42                	ld	s6,16(sp)
     396:	6ba2                	ld	s7,8(sp)
     398:	6161                	addi	sp,sp,80
     39a:	8082                	ret
      printf("%s: cannot create bigwrite\n", s);
     39c:	85de                	mv	a1,s7
     39e:	00005517          	auipc	a0,0x5
     3a2:	bd250513          	addi	a0,a0,-1070 # 4f70 <malloc+0x20c>
     3a6:	00005097          	auipc	ra,0x5
     3aa:	906080e7          	jalr	-1786(ra) # 4cac <printf>
      exit(1);
     3ae:	4505                	li	a0,1
     3b0:	00004097          	auipc	ra,0x4
     3b4:	554080e7          	jalr	1364(ra) # 4904 <exit>
      if(cc != sz){
     3b8:	89a6                	mv	s3,s1
        printf("%s: write(%d) ret %d\n", s, sz, cc);
     3ba:	86aa                	mv	a3,a0
     3bc:	864e                	mv	a2,s3
     3be:	85de                	mv	a1,s7
     3c0:	00005517          	auipc	a0,0x5
     3c4:	bd050513          	addi	a0,a0,-1072 # 4f90 <malloc+0x22c>
     3c8:	00005097          	auipc	ra,0x5
     3cc:	8e4080e7          	jalr	-1820(ra) # 4cac <printf>
        exit(1);
     3d0:	4505                	li	a0,1
     3d2:	00004097          	auipc	ra,0x4
     3d6:	532080e7          	jalr	1330(ra) # 4904 <exit>

00000000000003da <badwrite>:
// file is deleted? if the kernel has this bug, it will panic: balloc:
// out of blocks. assumed_free may need to be raised to be more than
// the number of free blocks. this test takes a long time.
void
badwrite(char *s)
{
     3da:	7179                	addi	sp,sp,-48
     3dc:	f406                	sd	ra,40(sp)
     3de:	f022                	sd	s0,32(sp)
     3e0:	ec26                	sd	s1,24(sp)
     3e2:	e84a                	sd	s2,16(sp)
     3e4:	e44e                	sd	s3,8(sp)
     3e6:	e052                	sd	s4,0(sp)
     3e8:	1800                	addi	s0,sp,48
  int assumed_free = 600;
  
  remove("junk");
     3ea:	00005517          	auipc	a0,0x5
     3ee:	bbe50513          	addi	a0,a0,-1090 # 4fa8 <malloc+0x244>
     3f2:	00004097          	auipc	ra,0x4
     3f6:	5c2080e7          	jalr	1474(ra) # 49b4 <remove>
     3fa:	25800913          	li	s2,600
  for(int i = 0; i < assumed_free; i++){
    int fd = open("junk", O_CREATE|O_WRONLY);
     3fe:	00005997          	auipc	s3,0x5
     402:	baa98993          	addi	s3,s3,-1110 # 4fa8 <malloc+0x244>
    if(fd < 0){
      printf("open junk failed\n");
      exit(1);
    }
    write(fd, (char*)0xffffffffffL, 1);
     406:	5a7d                	li	s4,-1
     408:	018a5a13          	srli	s4,s4,0x18
    int fd = open("junk", O_CREATE|O_WRONLY);
     40c:	20100593          	li	a1,513
     410:	854e                	mv	a0,s3
     412:	00004097          	auipc	ra,0x4
     416:	538080e7          	jalr	1336(ra) # 494a <open>
     41a:	84aa                	mv	s1,a0
    if(fd < 0){
     41c:	06054b63          	bltz	a0,492 <badwrite+0xb8>
    write(fd, (char*)0xffffffffffL, 1);
     420:	4605                	li	a2,1
     422:	85d2                	mv	a1,s4
     424:	00004097          	auipc	ra,0x4
     428:	502080e7          	jalr	1282(ra) # 4926 <write>
    close(fd);
     42c:	8526                	mv	a0,s1
     42e:	00004097          	auipc	ra,0x4
     432:	502080e7          	jalr	1282(ra) # 4930 <close>
    remove("junk");
     436:	854e                	mv	a0,s3
     438:	00004097          	auipc	ra,0x4
     43c:	57c080e7          	jalr	1404(ra) # 49b4 <remove>
  for(int i = 0; i < assumed_free; i++){
     440:	397d                	addiw	s2,s2,-1
     442:	fc0915e3          	bnez	s2,40c <badwrite+0x32>
  }

  int fd = open("junk", O_CREATE|O_WRONLY);
     446:	20100593          	li	a1,513
     44a:	00005517          	auipc	a0,0x5
     44e:	b5e50513          	addi	a0,a0,-1186 # 4fa8 <malloc+0x244>
     452:	00004097          	auipc	ra,0x4
     456:	4f8080e7          	jalr	1272(ra) # 494a <open>
     45a:	84aa                	mv	s1,a0
  if(fd < 0){
     45c:	04054863          	bltz	a0,4ac <badwrite+0xd2>
    printf("open junk failed\n");
    exit(1);
  }
  if(write(fd, "x", 1) != 1){
     460:	4605                	li	a2,1
     462:	00005597          	auipc	a1,0x5
     466:	ace58593          	addi	a1,a1,-1330 # 4f30 <malloc+0x1cc>
     46a:	00004097          	auipc	ra,0x4
     46e:	4bc080e7          	jalr	1212(ra) # 4926 <write>
     472:	4785                	li	a5,1
     474:	04f50963          	beq	a0,a5,4c6 <badwrite+0xec>
    printf("write failed\n");
     478:	00005517          	auipc	a0,0x5
     47c:	b5050513          	addi	a0,a0,-1200 # 4fc8 <malloc+0x264>
     480:	00005097          	auipc	ra,0x5
     484:	82c080e7          	jalr	-2004(ra) # 4cac <printf>
    exit(1);
     488:	4505                	li	a0,1
     48a:	00004097          	auipc	ra,0x4
     48e:	47a080e7          	jalr	1146(ra) # 4904 <exit>
      printf("open junk failed\n");
     492:	00005517          	auipc	a0,0x5
     496:	b1e50513          	addi	a0,a0,-1250 # 4fb0 <malloc+0x24c>
     49a:	00005097          	auipc	ra,0x5
     49e:	812080e7          	jalr	-2030(ra) # 4cac <printf>
      exit(1);
     4a2:	4505                	li	a0,1
     4a4:	00004097          	auipc	ra,0x4
     4a8:	460080e7          	jalr	1120(ra) # 4904 <exit>
    printf("open junk failed\n");
     4ac:	00005517          	auipc	a0,0x5
     4b0:	b0450513          	addi	a0,a0,-1276 # 4fb0 <malloc+0x24c>
     4b4:	00004097          	auipc	ra,0x4
     4b8:	7f8080e7          	jalr	2040(ra) # 4cac <printf>
    exit(1);
     4bc:	4505                	li	a0,1
     4be:	00004097          	auipc	ra,0x4
     4c2:	446080e7          	jalr	1094(ra) # 4904 <exit>
  }
  close(fd);
     4c6:	8526                	mv	a0,s1
     4c8:	00004097          	auipc	ra,0x4
     4cc:	468080e7          	jalr	1128(ra) # 4930 <close>
  remove("junk");
     4d0:	00005517          	auipc	a0,0x5
     4d4:	ad850513          	addi	a0,a0,-1320 # 4fa8 <malloc+0x244>
     4d8:	00004097          	auipc	ra,0x4
     4dc:	4dc080e7          	jalr	1244(ra) # 49b4 <remove>

  exit(0);
     4e0:	4501                	li	a0,0
     4e2:	00004097          	auipc	ra,0x4
     4e6:	422080e7          	jalr	1058(ra) # 4904 <exit>

00000000000004ea <copyin>:
{
     4ea:	7159                	addi	sp,sp,-112
     4ec:	f486                	sd	ra,104(sp)
     4ee:	f0a2                	sd	s0,96(sp)
     4f0:	eca6                	sd	s1,88(sp)
     4f2:	e8ca                	sd	s2,80(sp)
     4f4:	e4ce                	sd	s3,72(sp)
     4f6:	e0d2                	sd	s4,64(sp)
     4f8:	fc56                	sd	s5,56(sp)
     4fa:	1880                	addi	s0,sp,112
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     4fc:	4785                	li	a5,1
     4fe:	07fe                	slli	a5,a5,0x1f
     500:	faf43823          	sd	a5,-80(s0)
     504:	57fd                	li	a5,-1
     506:	faf43c23          	sd	a5,-72(s0)
  for(int ai = 0; ai < 2; ai++){
     50a:	fb040913          	addi	s2,s0,-80
     50e:	fc040793          	addi	a5,s0,-64
     512:	f8f43c23          	sd	a5,-104(s0)
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     516:	00005a17          	auipc	s4,0x5
     51a:	ac2a0a13          	addi	s4,s4,-1342 # 4fd8 <malloc+0x274>
    if(pipe(fds) < 0){
     51e:	fa840a93          	addi	s5,s0,-88
    uint64 addr = addrs[ai];
     522:	00093983          	ld	s3,0(s2)
    int fd = open("copyin1", O_CREATE|O_WRONLY);
     526:	20100593          	li	a1,513
     52a:	8552                	mv	a0,s4
     52c:	00004097          	auipc	ra,0x4
     530:	41e080e7          	jalr	1054(ra) # 494a <open>
     534:	84aa                	mv	s1,a0
    if(fd < 0){
     536:	08054863          	bltz	a0,5c6 <copyin+0xdc>
    int n = write(fd, (void*)addr, 8192);
     53a:	6609                	lui	a2,0x2
     53c:	85ce                	mv	a1,s3
     53e:	00004097          	auipc	ra,0x4
     542:	3e8080e7          	jalr	1000(ra) # 4926 <write>
    if(n >= 0){
     546:	08055d63          	bgez	a0,5e0 <copyin+0xf6>
    close(fd);
     54a:	8526                	mv	a0,s1
     54c:	00004097          	auipc	ra,0x4
     550:	3e4080e7          	jalr	996(ra) # 4930 <close>
    remove("copyin1");
     554:	8552                	mv	a0,s4
     556:	00004097          	auipc	ra,0x4
     55a:	45e080e7          	jalr	1118(ra) # 49b4 <remove>
    n = write(1, (char*)addr, 8192);
     55e:	6609                	lui	a2,0x2
     560:	85ce                	mv	a1,s3
     562:	4505                	li	a0,1
     564:	00004097          	auipc	ra,0x4
     568:	3c2080e7          	jalr	962(ra) # 4926 <write>
    if(n > 0){
     56c:	08a04963          	bgtz	a0,5fe <copyin+0x114>
    if(pipe(fds) < 0){
     570:	8556                	mv	a0,s5
     572:	00004097          	auipc	ra,0x4
     576:	3a4080e7          	jalr	932(ra) # 4916 <pipe>
     57a:	0a054163          	bltz	a0,61c <copyin+0x132>
    n = write(fds[1], (char*)addr, 8192);
     57e:	6609                	lui	a2,0x2
     580:	85ce                	mv	a1,s3
     582:	fac42503          	lw	a0,-84(s0)
     586:	00004097          	auipc	ra,0x4
     58a:	3a0080e7          	jalr	928(ra) # 4926 <write>
    if(n > 0){
     58e:	0aa04463          	bgtz	a0,636 <copyin+0x14c>
    close(fds[0]);
     592:	fa842503          	lw	a0,-88(s0)
     596:	00004097          	auipc	ra,0x4
     59a:	39a080e7          	jalr	922(ra) # 4930 <close>
    close(fds[1]);
     59e:	fac42503          	lw	a0,-84(s0)
     5a2:	00004097          	auipc	ra,0x4
     5a6:	38e080e7          	jalr	910(ra) # 4930 <close>
  for(int ai = 0; ai < 2; ai++){
     5aa:	0921                	addi	s2,s2,8
     5ac:	f9843783          	ld	a5,-104(s0)
     5b0:	f6f919e3          	bne	s2,a5,522 <copyin+0x38>
}
     5b4:	70a6                	ld	ra,104(sp)
     5b6:	7406                	ld	s0,96(sp)
     5b8:	64e6                	ld	s1,88(sp)
     5ba:	6946                	ld	s2,80(sp)
     5bc:	69a6                	ld	s3,72(sp)
     5be:	6a06                	ld	s4,64(sp)
     5c0:	7ae2                	ld	s5,56(sp)
     5c2:	6165                	addi	sp,sp,112
     5c4:	8082                	ret
      printf("open(copyin1) failed\n");
     5c6:	00005517          	auipc	a0,0x5
     5ca:	a1a50513          	addi	a0,a0,-1510 # 4fe0 <malloc+0x27c>
     5ce:	00004097          	auipc	ra,0x4
     5d2:	6de080e7          	jalr	1758(ra) # 4cac <printf>
      exit(1);
     5d6:	4505                	li	a0,1
     5d8:	00004097          	auipc	ra,0x4
     5dc:	32c080e7          	jalr	812(ra) # 4904 <exit>
      printf("write(fd, %p, 8192) returned %d, not -1\n", addr, n);
     5e0:	862a                	mv	a2,a0
     5e2:	85ce                	mv	a1,s3
     5e4:	00005517          	auipc	a0,0x5
     5e8:	a1450513          	addi	a0,a0,-1516 # 4ff8 <malloc+0x294>
     5ec:	00004097          	auipc	ra,0x4
     5f0:	6c0080e7          	jalr	1728(ra) # 4cac <printf>
      exit(1);
     5f4:	4505                	li	a0,1
     5f6:	00004097          	auipc	ra,0x4
     5fa:	30e080e7          	jalr	782(ra) # 4904 <exit>
      printf("write(1, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     5fe:	862a                	mv	a2,a0
     600:	85ce                	mv	a1,s3
     602:	00005517          	auipc	a0,0x5
     606:	a2650513          	addi	a0,a0,-1498 # 5028 <malloc+0x2c4>
     60a:	00004097          	auipc	ra,0x4
     60e:	6a2080e7          	jalr	1698(ra) # 4cac <printf>
      exit(1);
     612:	4505                	li	a0,1
     614:	00004097          	auipc	ra,0x4
     618:	2f0080e7          	jalr	752(ra) # 4904 <exit>
      printf("pipe() failed\n");
     61c:	00005517          	auipc	a0,0x5
     620:	a3c50513          	addi	a0,a0,-1476 # 5058 <malloc+0x2f4>
     624:	00004097          	auipc	ra,0x4
     628:	688080e7          	jalr	1672(ra) # 4cac <printf>
      exit(1);
     62c:	4505                	li	a0,1
     62e:	00004097          	auipc	ra,0x4
     632:	2d6080e7          	jalr	726(ra) # 4904 <exit>
      printf("write(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     636:	862a                	mv	a2,a0
     638:	85ce                	mv	a1,s3
     63a:	00005517          	auipc	a0,0x5
     63e:	a2e50513          	addi	a0,a0,-1490 # 5068 <malloc+0x304>
     642:	00004097          	auipc	ra,0x4
     646:	66a080e7          	jalr	1642(ra) # 4cac <printf>
      exit(1);
     64a:	4505                	li	a0,1
     64c:	00004097          	auipc	ra,0x4
     650:	2b8080e7          	jalr	696(ra) # 4904 <exit>

0000000000000654 <copyout>:
{
     654:	7159                	addi	sp,sp,-112
     656:	f486                	sd	ra,104(sp)
     658:	f0a2                	sd	s0,96(sp)
     65a:	eca6                	sd	s1,88(sp)
     65c:	e8ca                	sd	s2,80(sp)
     65e:	e4ce                	sd	s3,72(sp)
     660:	e0d2                	sd	s4,64(sp)
     662:	fc56                	sd	s5,56(sp)
     664:	f85a                	sd	s6,48(sp)
     666:	1880                	addi	s0,sp,112
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     668:	4785                	li	a5,1
     66a:	07fe                	slli	a5,a5,0x1f
     66c:	faf43823          	sd	a5,-80(s0)
     670:	57fd                	li	a5,-1
     672:	faf43c23          	sd	a5,-72(s0)
  for(int ai = 0; ai < 2; ai++){
     676:	fb040913          	addi	s2,s0,-80
     67a:	fc040793          	addi	a5,s0,-64
     67e:	f8f43c23          	sd	a5,-104(s0)
    int fd = open("README", 0);
     682:	00005a97          	auipc	s5,0x5
     686:	a16a8a93          	addi	s5,s5,-1514 # 5098 <malloc+0x334>
    if(pipe(fds) < 0){
     68a:	fa840a13          	addi	s4,s0,-88
    n = write(fds[1], "x", 1);
     68e:	00005b17          	auipc	s6,0x5
     692:	8a2b0b13          	addi	s6,s6,-1886 # 4f30 <malloc+0x1cc>
    uint64 addr = addrs[ai];
     696:	00093983          	ld	s3,0(s2)
    int fd = open("README", 0);
     69a:	4581                	li	a1,0
     69c:	8556                	mv	a0,s5
     69e:	00004097          	auipc	ra,0x4
     6a2:	2ac080e7          	jalr	684(ra) # 494a <open>
     6a6:	84aa                	mv	s1,a0
    if(fd < 0){
     6a8:	08054663          	bltz	a0,734 <copyout+0xe0>
    int n = read(fd, (void*)addr, 8192);
     6ac:	6609                	lui	a2,0x2
     6ae:	85ce                	mv	a1,s3
     6b0:	00004097          	auipc	ra,0x4
     6b4:	26e080e7          	jalr	622(ra) # 491e <read>
    if(n > 0){
     6b8:	08a04b63          	bgtz	a0,74e <copyout+0xfa>
    close(fd);
     6bc:	8526                	mv	a0,s1
     6be:	00004097          	auipc	ra,0x4
     6c2:	272080e7          	jalr	626(ra) # 4930 <close>
    if(pipe(fds) < 0){
     6c6:	8552                	mv	a0,s4
     6c8:	00004097          	auipc	ra,0x4
     6cc:	24e080e7          	jalr	590(ra) # 4916 <pipe>
     6d0:	08054e63          	bltz	a0,76c <copyout+0x118>
    n = write(fds[1], "x", 1);
     6d4:	4605                	li	a2,1
     6d6:	85da                	mv	a1,s6
     6d8:	fac42503          	lw	a0,-84(s0)
     6dc:	00004097          	auipc	ra,0x4
     6e0:	24a080e7          	jalr	586(ra) # 4926 <write>
    if(n != 1){
     6e4:	4785                	li	a5,1
     6e6:	0af51063          	bne	a0,a5,786 <copyout+0x132>
    n = read(fds[0], (void*)addr, 8192);
     6ea:	6609                	lui	a2,0x2
     6ec:	85ce                	mv	a1,s3
     6ee:	fa842503          	lw	a0,-88(s0)
     6f2:	00004097          	auipc	ra,0x4
     6f6:	22c080e7          	jalr	556(ra) # 491e <read>
    if(n > 0){
     6fa:	0aa04363          	bgtz	a0,7a0 <copyout+0x14c>
    close(fds[0]);
     6fe:	fa842503          	lw	a0,-88(s0)
     702:	00004097          	auipc	ra,0x4
     706:	22e080e7          	jalr	558(ra) # 4930 <close>
    close(fds[1]);
     70a:	fac42503          	lw	a0,-84(s0)
     70e:	00004097          	auipc	ra,0x4
     712:	222080e7          	jalr	546(ra) # 4930 <close>
  for(int ai = 0; ai < 2; ai++){
     716:	0921                	addi	s2,s2,8
     718:	f9843783          	ld	a5,-104(s0)
     71c:	f6f91de3          	bne	s2,a5,696 <copyout+0x42>
}
     720:	70a6                	ld	ra,104(sp)
     722:	7406                	ld	s0,96(sp)
     724:	64e6                	ld	s1,88(sp)
     726:	6946                	ld	s2,80(sp)
     728:	69a6                	ld	s3,72(sp)
     72a:	6a06                	ld	s4,64(sp)
     72c:	7ae2                	ld	s5,56(sp)
     72e:	7b42                	ld	s6,48(sp)
     730:	6165                	addi	sp,sp,112
     732:	8082                	ret
      printf("open(README) failed\n");
     734:	00005517          	auipc	a0,0x5
     738:	96c50513          	addi	a0,a0,-1684 # 50a0 <malloc+0x33c>
     73c:	00004097          	auipc	ra,0x4
     740:	570080e7          	jalr	1392(ra) # 4cac <printf>
      exit(1);
     744:	4505                	li	a0,1
     746:	00004097          	auipc	ra,0x4
     74a:	1be080e7          	jalr	446(ra) # 4904 <exit>
      printf("read(fd, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     74e:	862a                	mv	a2,a0
     750:	85ce                	mv	a1,s3
     752:	00005517          	auipc	a0,0x5
     756:	96650513          	addi	a0,a0,-1690 # 50b8 <malloc+0x354>
     75a:	00004097          	auipc	ra,0x4
     75e:	552080e7          	jalr	1362(ra) # 4cac <printf>
      exit(1);
     762:	4505                	li	a0,1
     764:	00004097          	auipc	ra,0x4
     768:	1a0080e7          	jalr	416(ra) # 4904 <exit>
      printf("pipe() failed\n");
     76c:	00005517          	auipc	a0,0x5
     770:	8ec50513          	addi	a0,a0,-1812 # 5058 <malloc+0x2f4>
     774:	00004097          	auipc	ra,0x4
     778:	538080e7          	jalr	1336(ra) # 4cac <printf>
      exit(1);
     77c:	4505                	li	a0,1
     77e:	00004097          	auipc	ra,0x4
     782:	186080e7          	jalr	390(ra) # 4904 <exit>
      printf("pipe write failed\n");
     786:	00005517          	auipc	a0,0x5
     78a:	96250513          	addi	a0,a0,-1694 # 50e8 <malloc+0x384>
     78e:	00004097          	auipc	ra,0x4
     792:	51e080e7          	jalr	1310(ra) # 4cac <printf>
      exit(1);
     796:	4505                	li	a0,1
     798:	00004097          	auipc	ra,0x4
     79c:	16c080e7          	jalr	364(ra) # 4904 <exit>
      printf("read(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     7a0:	862a                	mv	a2,a0
     7a2:	85ce                	mv	a1,s3
     7a4:	00005517          	auipc	a0,0x5
     7a8:	95c50513          	addi	a0,a0,-1700 # 5100 <malloc+0x39c>
     7ac:	00004097          	auipc	ra,0x4
     7b0:	500080e7          	jalr	1280(ra) # 4cac <printf>
      exit(1);
     7b4:	4505                	li	a0,1
     7b6:	00004097          	auipc	ra,0x4
     7ba:	14e080e7          	jalr	334(ra) # 4904 <exit>

00000000000007be <truncate1>:
{
     7be:	711d                	addi	sp,sp,-96
     7c0:	ec86                	sd	ra,88(sp)
     7c2:	e8a2                	sd	s0,80(sp)
     7c4:	e4a6                	sd	s1,72(sp)
     7c6:	e0ca                	sd	s2,64(sp)
     7c8:	fc4e                	sd	s3,56(sp)
     7ca:	f852                	sd	s4,48(sp)
     7cc:	f456                	sd	s5,40(sp)
     7ce:	1080                	addi	s0,sp,96
     7d0:	8aaa                	mv	s5,a0
  remove("truncfile");
     7d2:	00004517          	auipc	a0,0x4
     7d6:	74650513          	addi	a0,a0,1862 # 4f18 <malloc+0x1b4>
     7da:	00004097          	auipc	ra,0x4
     7de:	1da080e7          	jalr	474(ra) # 49b4 <remove>
  int fd1 = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
     7e2:	60100593          	li	a1,1537
     7e6:	00004517          	auipc	a0,0x4
     7ea:	73250513          	addi	a0,a0,1842 # 4f18 <malloc+0x1b4>
     7ee:	00004097          	auipc	ra,0x4
     7f2:	15c080e7          	jalr	348(ra) # 494a <open>
     7f6:	84aa                	mv	s1,a0
  write(fd1, "abcd", 4);
     7f8:	4611                	li	a2,4
     7fa:	00004597          	auipc	a1,0x4
     7fe:	72e58593          	addi	a1,a1,1838 # 4f28 <malloc+0x1c4>
     802:	00004097          	auipc	ra,0x4
     806:	124080e7          	jalr	292(ra) # 4926 <write>
  close(fd1);
     80a:	8526                	mv	a0,s1
     80c:	00004097          	auipc	ra,0x4
     810:	124080e7          	jalr	292(ra) # 4930 <close>
  int fd2 = open("truncfile", O_RDONLY);
     814:	4581                	li	a1,0
     816:	00004517          	auipc	a0,0x4
     81a:	70250513          	addi	a0,a0,1794 # 4f18 <malloc+0x1b4>
     81e:	00004097          	auipc	ra,0x4
     822:	12c080e7          	jalr	300(ra) # 494a <open>
     826:	84aa                	mv	s1,a0
  int n = read(fd2, buf, sizeof(buf));
     828:	02000613          	li	a2,32
     82c:	fa040593          	addi	a1,s0,-96
     830:	00004097          	auipc	ra,0x4
     834:	0ee080e7          	jalr	238(ra) # 491e <read>
  if(n != 4){
     838:	4791                	li	a5,4
     83a:	0cf51e63          	bne	a0,a5,916 <truncate1+0x158>
  fd1 = open("truncfile", O_WRONLY|O_TRUNC);
     83e:	40100593          	li	a1,1025
     842:	00004517          	auipc	a0,0x4
     846:	6d650513          	addi	a0,a0,1750 # 4f18 <malloc+0x1b4>
     84a:	00004097          	auipc	ra,0x4
     84e:	100080e7          	jalr	256(ra) # 494a <open>
     852:	89aa                	mv	s3,a0
  int fd3 = open("truncfile", O_RDONLY);
     854:	4581                	li	a1,0
     856:	00004517          	auipc	a0,0x4
     85a:	6c250513          	addi	a0,a0,1730 # 4f18 <malloc+0x1b4>
     85e:	00004097          	auipc	ra,0x4
     862:	0ec080e7          	jalr	236(ra) # 494a <open>
     866:	892a                	mv	s2,a0
  n = read(fd3, buf, sizeof(buf));
     868:	02000613          	li	a2,32
     86c:	fa040593          	addi	a1,s0,-96
     870:	00004097          	auipc	ra,0x4
     874:	0ae080e7          	jalr	174(ra) # 491e <read>
     878:	8a2a                	mv	s4,a0
  if(n != 0){
     87a:	ed4d                	bnez	a0,934 <truncate1+0x176>
  n = read(fd2, buf, sizeof(buf));
     87c:	02000613          	li	a2,32
     880:	fa040593          	addi	a1,s0,-96
     884:	8526                	mv	a0,s1
     886:	00004097          	auipc	ra,0x4
     88a:	098080e7          	jalr	152(ra) # 491e <read>
     88e:	8a2a                	mv	s4,a0
  if(n != 0){
     890:	e971                	bnez	a0,964 <truncate1+0x1a6>
  write(fd1, "abcdef", 6);
     892:	4619                	li	a2,6
     894:	00005597          	auipc	a1,0x5
     898:	8fc58593          	addi	a1,a1,-1796 # 5190 <malloc+0x42c>
     89c:	854e                	mv	a0,s3
     89e:	00004097          	auipc	ra,0x4
     8a2:	088080e7          	jalr	136(ra) # 4926 <write>
  n = read(fd3, buf, sizeof(buf));
     8a6:	02000613          	li	a2,32
     8aa:	fa040593          	addi	a1,s0,-96
     8ae:	854a                	mv	a0,s2
     8b0:	00004097          	auipc	ra,0x4
     8b4:	06e080e7          	jalr	110(ra) # 491e <read>
  if(n != 6){
     8b8:	4799                	li	a5,6
     8ba:	0cf51d63          	bne	a0,a5,994 <truncate1+0x1d6>
  n = read(fd2, buf, sizeof(buf));
     8be:	02000613          	li	a2,32
     8c2:	fa040593          	addi	a1,s0,-96
     8c6:	8526                	mv	a0,s1
     8c8:	00004097          	auipc	ra,0x4
     8cc:	056080e7          	jalr	86(ra) # 491e <read>
  if(n != 2){
     8d0:	4789                	li	a5,2
     8d2:	0ef51063          	bne	a0,a5,9b2 <truncate1+0x1f4>
  remove("truncfile");
     8d6:	00004517          	auipc	a0,0x4
     8da:	64250513          	addi	a0,a0,1602 # 4f18 <malloc+0x1b4>
     8de:	00004097          	auipc	ra,0x4
     8e2:	0d6080e7          	jalr	214(ra) # 49b4 <remove>
  close(fd1);
     8e6:	854e                	mv	a0,s3
     8e8:	00004097          	auipc	ra,0x4
     8ec:	048080e7          	jalr	72(ra) # 4930 <close>
  close(fd2);
     8f0:	8526                	mv	a0,s1
     8f2:	00004097          	auipc	ra,0x4
     8f6:	03e080e7          	jalr	62(ra) # 4930 <close>
  close(fd3);
     8fa:	854a                	mv	a0,s2
     8fc:	00004097          	auipc	ra,0x4
     900:	034080e7          	jalr	52(ra) # 4930 <close>
}
     904:	60e6                	ld	ra,88(sp)
     906:	6446                	ld	s0,80(sp)
     908:	64a6                	ld	s1,72(sp)
     90a:	6906                	ld	s2,64(sp)
     90c:	79e2                	ld	s3,56(sp)
     90e:	7a42                	ld	s4,48(sp)
     910:	7aa2                	ld	s5,40(sp)
     912:	6125                	addi	sp,sp,96
     914:	8082                	ret
    printf("%s: read %d bytes, wanted 4\n", s, n);
     916:	862a                	mv	a2,a0
     918:	85d6                	mv	a1,s5
     91a:	00005517          	auipc	a0,0x5
     91e:	81650513          	addi	a0,a0,-2026 # 5130 <malloc+0x3cc>
     922:	00004097          	auipc	ra,0x4
     926:	38a080e7          	jalr	906(ra) # 4cac <printf>
    exit(1);
     92a:	4505                	li	a0,1
     92c:	00004097          	auipc	ra,0x4
     930:	fd8080e7          	jalr	-40(ra) # 4904 <exit>
    printf("aaa fd3=%d\n", fd3);
     934:	85ca                	mv	a1,s2
     936:	00005517          	auipc	a0,0x5
     93a:	81a50513          	addi	a0,a0,-2022 # 5150 <malloc+0x3ec>
     93e:	00004097          	auipc	ra,0x4
     942:	36e080e7          	jalr	878(ra) # 4cac <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     946:	8652                	mv	a2,s4
     948:	85d6                	mv	a1,s5
     94a:	00005517          	auipc	a0,0x5
     94e:	81650513          	addi	a0,a0,-2026 # 5160 <malloc+0x3fc>
     952:	00004097          	auipc	ra,0x4
     956:	35a080e7          	jalr	858(ra) # 4cac <printf>
    exit(1);
     95a:	4505                	li	a0,1
     95c:	00004097          	auipc	ra,0x4
     960:	fa8080e7          	jalr	-88(ra) # 4904 <exit>
    printf("bbb fd2=%d\n", fd2);
     964:	85a6                	mv	a1,s1
     966:	00005517          	auipc	a0,0x5
     96a:	81a50513          	addi	a0,a0,-2022 # 5180 <malloc+0x41c>
     96e:	00004097          	auipc	ra,0x4
     972:	33e080e7          	jalr	830(ra) # 4cac <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     976:	8652                	mv	a2,s4
     978:	85d6                	mv	a1,s5
     97a:	00004517          	auipc	a0,0x4
     97e:	7e650513          	addi	a0,a0,2022 # 5160 <malloc+0x3fc>
     982:	00004097          	auipc	ra,0x4
     986:	32a080e7          	jalr	810(ra) # 4cac <printf>
    exit(1);
     98a:	4505                	li	a0,1
     98c:	00004097          	auipc	ra,0x4
     990:	f78080e7          	jalr	-136(ra) # 4904 <exit>
    printf("%s: read %d bytes, wanted 6\n", s, n);
     994:	862a                	mv	a2,a0
     996:	85d6                	mv	a1,s5
     998:	00005517          	auipc	a0,0x5
     99c:	80050513          	addi	a0,a0,-2048 # 5198 <malloc+0x434>
     9a0:	00004097          	auipc	ra,0x4
     9a4:	30c080e7          	jalr	780(ra) # 4cac <printf>
    exit(1);
     9a8:	4505                	li	a0,1
     9aa:	00004097          	auipc	ra,0x4
     9ae:	f5a080e7          	jalr	-166(ra) # 4904 <exit>
    printf("%s: read %d bytes, wanted 2\n", s, n);
     9b2:	862a                	mv	a2,a0
     9b4:	85d6                	mv	a1,s5
     9b6:	00005517          	auipc	a0,0x5
     9ba:	80250513          	addi	a0,a0,-2046 # 51b8 <malloc+0x454>
     9be:	00004097          	auipc	ra,0x4
     9c2:	2ee080e7          	jalr	750(ra) # 4cac <printf>
    exit(1);
     9c6:	4505                	li	a0,1
     9c8:	00004097          	auipc	ra,0x4
     9cc:	f3c080e7          	jalr	-196(ra) # 4904 <exit>

00000000000009d0 <writetest>:
{
     9d0:	7139                	addi	sp,sp,-64
     9d2:	fc06                	sd	ra,56(sp)
     9d4:	f822                	sd	s0,48(sp)
     9d6:	f426                	sd	s1,40(sp)
     9d8:	f04a                	sd	s2,32(sp)
     9da:	ec4e                	sd	s3,24(sp)
     9dc:	e852                	sd	s4,16(sp)
     9de:	e456                	sd	s5,8(sp)
     9e0:	e05a                	sd	s6,0(sp)
     9e2:	0080                	addi	s0,sp,64
     9e4:	8b2a                	mv	s6,a0
  fd = open("small", O_CREATE|O_RDWR);
     9e6:	20200593          	li	a1,514
     9ea:	00004517          	auipc	a0,0x4
     9ee:	7ee50513          	addi	a0,a0,2030 # 51d8 <malloc+0x474>
     9f2:	00004097          	auipc	ra,0x4
     9f6:	f58080e7          	jalr	-168(ra) # 494a <open>
  if(fd < 0){
     9fa:	0a054d63          	bltz	a0,ab4 <writetest+0xe4>
     9fe:	892a                	mv	s2,a0
     a00:	4481                	li	s1,0
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     a02:	00004997          	auipc	s3,0x4
     a06:	7fe98993          	addi	s3,s3,2046 # 5200 <malloc+0x49c>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     a0a:	00005a97          	auipc	s5,0x5
     a0e:	82ea8a93          	addi	s5,s5,-2002 # 5238 <malloc+0x4d4>
  for(i = 0; i < N; i++){
     a12:	06400a13          	li	s4,100
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
     a16:	4629                	li	a2,10
     a18:	85ce                	mv	a1,s3
     a1a:	854a                	mv	a0,s2
     a1c:	00004097          	auipc	ra,0x4
     a20:	f0a080e7          	jalr	-246(ra) # 4926 <write>
     a24:	47a9                	li	a5,10
     a26:	0af51563          	bne	a0,a5,ad0 <writetest+0x100>
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
     a2a:	4629                	li	a2,10
     a2c:	85d6                	mv	a1,s5
     a2e:	854a                	mv	a0,s2
     a30:	00004097          	auipc	ra,0x4
     a34:	ef6080e7          	jalr	-266(ra) # 4926 <write>
     a38:	47a9                	li	a5,10
     a3a:	0af51963          	bne	a0,a5,aec <writetest+0x11c>
  for(i = 0; i < N; i++){
     a3e:	2485                	addiw	s1,s1,1
     a40:	fd449be3          	bne	s1,s4,a16 <writetest+0x46>
  close(fd);
     a44:	854a                	mv	a0,s2
     a46:	00004097          	auipc	ra,0x4
     a4a:	eea080e7          	jalr	-278(ra) # 4930 <close>
  fd = open("small", O_RDONLY);
     a4e:	4581                	li	a1,0
     a50:	00004517          	auipc	a0,0x4
     a54:	78850513          	addi	a0,a0,1928 # 51d8 <malloc+0x474>
     a58:	00004097          	auipc	ra,0x4
     a5c:	ef2080e7          	jalr	-270(ra) # 494a <open>
     a60:	84aa                	mv	s1,a0
  if(fd < 0){
     a62:	0a054363          	bltz	a0,b08 <writetest+0x138>
  i = read(fd, buf, N*SZ*2);
     a66:	7d000613          	li	a2,2000
     a6a:	0000a597          	auipc	a1,0xa
     a6e:	e0e58593          	addi	a1,a1,-498 # a878 <buf>
     a72:	00004097          	auipc	ra,0x4
     a76:	eac080e7          	jalr	-340(ra) # 491e <read>
  if(i != N*SZ*2){
     a7a:	7d000793          	li	a5,2000
     a7e:	0af51363          	bne	a0,a5,b24 <writetest+0x154>
  close(fd);
     a82:	8526                	mv	a0,s1
     a84:	00004097          	auipc	ra,0x4
     a88:	eac080e7          	jalr	-340(ra) # 4930 <close>
  if(remove("small") < 0){
     a8c:	00004517          	auipc	a0,0x4
     a90:	74c50513          	addi	a0,a0,1868 # 51d8 <malloc+0x474>
     a94:	00004097          	auipc	ra,0x4
     a98:	f20080e7          	jalr	-224(ra) # 49b4 <remove>
     a9c:	0a054263          	bltz	a0,b40 <writetest+0x170>
}
     aa0:	70e2                	ld	ra,56(sp)
     aa2:	7442                	ld	s0,48(sp)
     aa4:	74a2                	ld	s1,40(sp)
     aa6:	7902                	ld	s2,32(sp)
     aa8:	69e2                	ld	s3,24(sp)
     aaa:	6a42                	ld	s4,16(sp)
     aac:	6aa2                	ld	s5,8(sp)
     aae:	6b02                	ld	s6,0(sp)
     ab0:	6121                	addi	sp,sp,64
     ab2:	8082                	ret
    printf("%s: error: creat small failed!\n", s);
     ab4:	85da                	mv	a1,s6
     ab6:	00004517          	auipc	a0,0x4
     aba:	72a50513          	addi	a0,a0,1834 # 51e0 <malloc+0x47c>
     abe:	00004097          	auipc	ra,0x4
     ac2:	1ee080e7          	jalr	494(ra) # 4cac <printf>
    exit(1);
     ac6:	4505                	li	a0,1
     ac8:	00004097          	auipc	ra,0x4
     acc:	e3c080e7          	jalr	-452(ra) # 4904 <exit>
      printf("%s: error: write aa %d new file failed\n", i);
     ad0:	85a6                	mv	a1,s1
     ad2:	00004517          	auipc	a0,0x4
     ad6:	73e50513          	addi	a0,a0,1854 # 5210 <malloc+0x4ac>
     ada:	00004097          	auipc	ra,0x4
     ade:	1d2080e7          	jalr	466(ra) # 4cac <printf>
      exit(1);
     ae2:	4505                	li	a0,1
     ae4:	00004097          	auipc	ra,0x4
     ae8:	e20080e7          	jalr	-480(ra) # 4904 <exit>
      printf("%s: error: write bb %d new file failed\n", i);
     aec:	85a6                	mv	a1,s1
     aee:	00004517          	auipc	a0,0x4
     af2:	75a50513          	addi	a0,a0,1882 # 5248 <malloc+0x4e4>
     af6:	00004097          	auipc	ra,0x4
     afa:	1b6080e7          	jalr	438(ra) # 4cac <printf>
      exit(1);
     afe:	4505                	li	a0,1
     b00:	00004097          	auipc	ra,0x4
     b04:	e04080e7          	jalr	-508(ra) # 4904 <exit>
    printf("%s: error: open small failed!\n", s);
     b08:	85da                	mv	a1,s6
     b0a:	00004517          	auipc	a0,0x4
     b0e:	76650513          	addi	a0,a0,1894 # 5270 <malloc+0x50c>
     b12:	00004097          	auipc	ra,0x4
     b16:	19a080e7          	jalr	410(ra) # 4cac <printf>
    exit(1);
     b1a:	4505                	li	a0,1
     b1c:	00004097          	auipc	ra,0x4
     b20:	de8080e7          	jalr	-536(ra) # 4904 <exit>
    printf("%s: read failed\n", s);
     b24:	85da                	mv	a1,s6
     b26:	00004517          	auipc	a0,0x4
     b2a:	76a50513          	addi	a0,a0,1898 # 5290 <malloc+0x52c>
     b2e:	00004097          	auipc	ra,0x4
     b32:	17e080e7          	jalr	382(ra) # 4cac <printf>
    exit(1);
     b36:	4505                	li	a0,1
     b38:	00004097          	auipc	ra,0x4
     b3c:	dcc080e7          	jalr	-564(ra) # 4904 <exit>
    printf("%s: remove small failed\n", s);
     b40:	85da                	mv	a1,s6
     b42:	00004517          	auipc	a0,0x4
     b46:	76650513          	addi	a0,a0,1894 # 52a8 <malloc+0x544>
     b4a:	00004097          	auipc	ra,0x4
     b4e:	162080e7          	jalr	354(ra) # 4cac <printf>
    exit(1);
     b52:	4505                	li	a0,1
     b54:	00004097          	auipc	ra,0x4
     b58:	db0080e7          	jalr	-592(ra) # 4904 <exit>

0000000000000b5c <writebig>:
{
     b5c:	7179                	addi	sp,sp,-48
     b5e:	f406                	sd	ra,40(sp)
     b60:	f022                	sd	s0,32(sp)
     b62:	ec26                	sd	s1,24(sp)
     b64:	e84a                	sd	s2,16(sp)
     b66:	e44e                	sd	s3,8(sp)
     b68:	e052                	sd	s4,0(sp)
     b6a:	1800                	addi	s0,sp,48
     b6c:	8a2a                	mv	s4,a0
  fd = open("big", O_CREATE|O_RDWR);
     b6e:	20200593          	li	a1,514
     b72:	00004517          	auipc	a0,0x4
     b76:	75650513          	addi	a0,a0,1878 # 52c8 <malloc+0x564>
     b7a:	00004097          	auipc	ra,0x4
     b7e:	dd0080e7          	jalr	-560(ra) # 494a <open>
     b82:	89aa                	mv	s3,a0
  for(i = 0; i < MAXFILE; i++){
     b84:	4481                	li	s1,0
    ((int*)buf)[0] = i;
     b86:	0000a917          	auipc	s2,0xa
     b8a:	cf290913          	addi	s2,s2,-782 # a878 <buf>
  if(fd < 0){
     b8e:	06054e63          	bltz	a0,c0a <writebig+0xae>
    ((int*)buf)[0] = i;
     b92:	00992023          	sw	s1,0(s2)
    if(write(fd, buf, BSIZE) != BSIZE){
     b96:	20000613          	li	a2,512
     b9a:	85ca                	mv	a1,s2
     b9c:	854e                	mv	a0,s3
     b9e:	00004097          	auipc	ra,0x4
     ba2:	d88080e7          	jalr	-632(ra) # 4926 <write>
     ba6:	20000793          	li	a5,512
     baa:	06f51e63          	bne	a0,a5,c26 <writebig+0xca>
  for(i = 0; i < MAXFILE; i++){
     bae:	2485                	addiw	s1,s1,1
     bb0:	20000793          	li	a5,512
     bb4:	fcf49fe3          	bne	s1,a5,b92 <writebig+0x36>
  close(fd);
     bb8:	854e                	mv	a0,s3
     bba:	00004097          	auipc	ra,0x4
     bbe:	d76080e7          	jalr	-650(ra) # 4930 <close>
  fd = open("big", O_RDONLY);
     bc2:	4581                	li	a1,0
     bc4:	00004517          	auipc	a0,0x4
     bc8:	70450513          	addi	a0,a0,1796 # 52c8 <malloc+0x564>
     bcc:	00004097          	auipc	ra,0x4
     bd0:	d7e080e7          	jalr	-642(ra) # 494a <open>
     bd4:	89aa                	mv	s3,a0
  n = 0;
     bd6:	4481                	li	s1,0
    i = read(fd, buf, BSIZE);
     bd8:	0000a917          	auipc	s2,0xa
     bdc:	ca090913          	addi	s2,s2,-864 # a878 <buf>
  if(fd < 0){
     be0:	06054163          	bltz	a0,c42 <writebig+0xe6>
    i = read(fd, buf, BSIZE);
     be4:	20000613          	li	a2,512
     be8:	85ca                	mv	a1,s2
     bea:	854e                	mv	a0,s3
     bec:	00004097          	auipc	ra,0x4
     bf0:	d32080e7          	jalr	-718(ra) # 491e <read>
    if(i == 0){
     bf4:	c52d                	beqz	a0,c5e <writebig+0x102>
    } else if(i != BSIZE){
     bf6:	20000793          	li	a5,512
     bfa:	0af51c63          	bne	a0,a5,cb2 <writebig+0x156>
    if(((int*)buf)[0] != n){
     bfe:	00092603          	lw	a2,0(s2)
     c02:	0c961663          	bne	a2,s1,cce <writebig+0x172>
    n++;
     c06:	2485                	addiw	s1,s1,1
    i = read(fd, buf, BSIZE);
     c08:	bff1                	j	be4 <writebig+0x88>
    printf("%s: error: creat big failed!\n", s);
     c0a:	85d2                	mv	a1,s4
     c0c:	00004517          	auipc	a0,0x4
     c10:	6c450513          	addi	a0,a0,1732 # 52d0 <malloc+0x56c>
     c14:	00004097          	auipc	ra,0x4
     c18:	098080e7          	jalr	152(ra) # 4cac <printf>
    exit(1);
     c1c:	4505                	li	a0,1
     c1e:	00004097          	auipc	ra,0x4
     c22:	ce6080e7          	jalr	-794(ra) # 4904 <exit>
      printf("%s: error: write big file failed\n", i);
     c26:	85a6                	mv	a1,s1
     c28:	00004517          	auipc	a0,0x4
     c2c:	6c850513          	addi	a0,a0,1736 # 52f0 <malloc+0x58c>
     c30:	00004097          	auipc	ra,0x4
     c34:	07c080e7          	jalr	124(ra) # 4cac <printf>
      exit(1);
     c38:	4505                	li	a0,1
     c3a:	00004097          	auipc	ra,0x4
     c3e:	cca080e7          	jalr	-822(ra) # 4904 <exit>
    printf("%s: error: open big failed!\n", s);
     c42:	85d2                	mv	a1,s4
     c44:	00004517          	auipc	a0,0x4
     c48:	6d450513          	addi	a0,a0,1748 # 5318 <malloc+0x5b4>
     c4c:	00004097          	auipc	ra,0x4
     c50:	060080e7          	jalr	96(ra) # 4cac <printf>
    exit(1);
     c54:	4505                	li	a0,1
     c56:	00004097          	auipc	ra,0x4
     c5a:	cae080e7          	jalr	-850(ra) # 4904 <exit>
      if(n == MAXFILE - 1){
     c5e:	1ff00793          	li	a5,511
     c62:	02f48963          	beq	s1,a5,c94 <writebig+0x138>
  close(fd);
     c66:	854e                	mv	a0,s3
     c68:	00004097          	auipc	ra,0x4
     c6c:	cc8080e7          	jalr	-824(ra) # 4930 <close>
  if(remove("big") < 0){
     c70:	00004517          	auipc	a0,0x4
     c74:	65850513          	addi	a0,a0,1624 # 52c8 <malloc+0x564>
     c78:	00004097          	auipc	ra,0x4
     c7c:	d3c080e7          	jalr	-708(ra) # 49b4 <remove>
     c80:	06054563          	bltz	a0,cea <writebig+0x18e>
}
     c84:	70a2                	ld	ra,40(sp)
     c86:	7402                	ld	s0,32(sp)
     c88:	64e2                	ld	s1,24(sp)
     c8a:	6942                	ld	s2,16(sp)
     c8c:	69a2                	ld	s3,8(sp)
     c8e:	6a02                	ld	s4,0(sp)
     c90:	6145                	addi	sp,sp,48
     c92:	8082                	ret
        printf("%s: read only %d blocks from big", n);
     c94:	1ff00593          	li	a1,511
     c98:	00004517          	auipc	a0,0x4
     c9c:	6a050513          	addi	a0,a0,1696 # 5338 <malloc+0x5d4>
     ca0:	00004097          	auipc	ra,0x4
     ca4:	00c080e7          	jalr	12(ra) # 4cac <printf>
        exit(1);
     ca8:	4505                	li	a0,1
     caa:	00004097          	auipc	ra,0x4
     cae:	c5a080e7          	jalr	-934(ra) # 4904 <exit>
      printf("%s: read failed %d\n", i);
     cb2:	85aa                	mv	a1,a0
     cb4:	00004517          	auipc	a0,0x4
     cb8:	6ac50513          	addi	a0,a0,1708 # 5360 <malloc+0x5fc>
     cbc:	00004097          	auipc	ra,0x4
     cc0:	ff0080e7          	jalr	-16(ra) # 4cac <printf>
      exit(1);
     cc4:	4505                	li	a0,1
     cc6:	00004097          	auipc	ra,0x4
     cca:	c3e080e7          	jalr	-962(ra) # 4904 <exit>
      printf("%s: read content of block %d is %d\n",
     cce:	85a6                	mv	a1,s1
     cd0:	00004517          	auipc	a0,0x4
     cd4:	6a850513          	addi	a0,a0,1704 # 5378 <malloc+0x614>
     cd8:	00004097          	auipc	ra,0x4
     cdc:	fd4080e7          	jalr	-44(ra) # 4cac <printf>
      exit(1);
     ce0:	4505                	li	a0,1
     ce2:	00004097          	auipc	ra,0x4
     ce6:	c22080e7          	jalr	-990(ra) # 4904 <exit>
    printf("%s: remove big failed\n", s);
     cea:	85d2                	mv	a1,s4
     cec:	00004517          	auipc	a0,0x4
     cf0:	6b450513          	addi	a0,a0,1716 # 53a0 <malloc+0x63c>
     cf4:	00004097          	auipc	ra,0x4
     cf8:	fb8080e7          	jalr	-72(ra) # 4cac <printf>
    exit(1);
     cfc:	4505                	li	a0,1
     cfe:	00004097          	auipc	ra,0x4
     d02:	c06080e7          	jalr	-1018(ra) # 4904 <exit>

0000000000000d06 <removeread>:
{
     d06:	7179                	addi	sp,sp,-48
     d08:	f406                	sd	ra,40(sp)
     d0a:	f022                	sd	s0,32(sp)
     d0c:	ec26                	sd	s1,24(sp)
     d0e:	e84a                	sd	s2,16(sp)
     d10:	e44e                	sd	s3,8(sp)
     d12:	1800                	addi	s0,sp,48
     d14:	89aa                	mv	s3,a0
  fd = open("removeread", O_CREATE | O_RDWR);
     d16:	20200593          	li	a1,514
     d1a:	00004517          	auipc	a0,0x4
     d1e:	69e50513          	addi	a0,a0,1694 # 53b8 <malloc+0x654>
     d22:	00004097          	auipc	ra,0x4
     d26:	c28080e7          	jalr	-984(ra) # 494a <open>
  if(fd < 0){
     d2a:	0e054763          	bltz	a0,e18 <removeread+0x112>
     d2e:	84aa                	mv	s1,a0
  write(fd, "hello", SZ);
     d30:	4615                	li	a2,5
     d32:	00004597          	auipc	a1,0x4
     d36:	6b658593          	addi	a1,a1,1718 # 53e8 <malloc+0x684>
     d3a:	00004097          	auipc	ra,0x4
     d3e:	bec080e7          	jalr	-1044(ra) # 4926 <write>
  close(fd);
     d42:	8526                	mv	a0,s1
     d44:	00004097          	auipc	ra,0x4
     d48:	bec080e7          	jalr	-1044(ra) # 4930 <close>
  fd = open("removeread", O_RDWR);
     d4c:	4589                	li	a1,2
     d4e:	00004517          	auipc	a0,0x4
     d52:	66a50513          	addi	a0,a0,1642 # 53b8 <malloc+0x654>
     d56:	00004097          	auipc	ra,0x4
     d5a:	bf4080e7          	jalr	-1036(ra) # 494a <open>
     d5e:	84aa                	mv	s1,a0
  if(fd < 0){
     d60:	0c054a63          	bltz	a0,e34 <removeread+0x12e>
  if(remove("removeread") != 0){
     d64:	00004517          	auipc	a0,0x4
     d68:	65450513          	addi	a0,a0,1620 # 53b8 <malloc+0x654>
     d6c:	00004097          	auipc	ra,0x4
     d70:	c48080e7          	jalr	-952(ra) # 49b4 <remove>
     d74:	ed71                	bnez	a0,e50 <removeread+0x14a>
  fd1 = open("removeread", O_CREATE | O_RDWR);
     d76:	20200593          	li	a1,514
     d7a:	00004517          	auipc	a0,0x4
     d7e:	63e50513          	addi	a0,a0,1598 # 53b8 <malloc+0x654>
     d82:	00004097          	auipc	ra,0x4
     d86:	bc8080e7          	jalr	-1080(ra) # 494a <open>
     d8a:	892a                	mv	s2,a0
  write(fd1, "yyy", 3);
     d8c:	460d                	li	a2,3
     d8e:	00004597          	auipc	a1,0x4
     d92:	6a258593          	addi	a1,a1,1698 # 5430 <malloc+0x6cc>
     d96:	00004097          	auipc	ra,0x4
     d9a:	b90080e7          	jalr	-1136(ra) # 4926 <write>
  close(fd1);
     d9e:	854a                	mv	a0,s2
     da0:	00004097          	auipc	ra,0x4
     da4:	b90080e7          	jalr	-1136(ra) # 4930 <close>
  if(read(fd, buf, sizeof(buf)) != SZ){
     da8:	6609                	lui	a2,0x2
     daa:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x42>
     dae:	0000a597          	auipc	a1,0xa
     db2:	aca58593          	addi	a1,a1,-1334 # a878 <buf>
     db6:	8526                	mv	a0,s1
     db8:	00004097          	auipc	ra,0x4
     dbc:	b66080e7          	jalr	-1178(ra) # 491e <read>
     dc0:	4795                	li	a5,5
     dc2:	0af51563          	bne	a0,a5,e6c <removeread+0x166>
  if(buf[0] != 'h'){
     dc6:	0000a717          	auipc	a4,0xa
     dca:	ab274703          	lbu	a4,-1358(a4) # a878 <buf>
     dce:	06800793          	li	a5,104
     dd2:	0af71b63          	bne	a4,a5,e88 <removeread+0x182>
  if(write(fd, buf, 10) != 10){
     dd6:	4629                	li	a2,10
     dd8:	0000a597          	auipc	a1,0xa
     ddc:	aa058593          	addi	a1,a1,-1376 # a878 <buf>
     de0:	8526                	mv	a0,s1
     de2:	00004097          	auipc	ra,0x4
     de6:	b44080e7          	jalr	-1212(ra) # 4926 <write>
     dea:	47a9                	li	a5,10
     dec:	0af51c63          	bne	a0,a5,ea4 <removeread+0x19e>
  close(fd);
     df0:	8526                	mv	a0,s1
     df2:	00004097          	auipc	ra,0x4
     df6:	b3e080e7          	jalr	-1218(ra) # 4930 <close>
  remove("removeread");
     dfa:	00004517          	auipc	a0,0x4
     dfe:	5be50513          	addi	a0,a0,1470 # 53b8 <malloc+0x654>
     e02:	00004097          	auipc	ra,0x4
     e06:	bb2080e7          	jalr	-1102(ra) # 49b4 <remove>
}
     e0a:	70a2                	ld	ra,40(sp)
     e0c:	7402                	ld	s0,32(sp)
     e0e:	64e2                	ld	s1,24(sp)
     e10:	6942                	ld	s2,16(sp)
     e12:	69a2                	ld	s3,8(sp)
     e14:	6145                	addi	sp,sp,48
     e16:	8082                	ret
    printf("%s: create removeread failed\n", s);
     e18:	85ce                	mv	a1,s3
     e1a:	00004517          	auipc	a0,0x4
     e1e:	5ae50513          	addi	a0,a0,1454 # 53c8 <malloc+0x664>
     e22:	00004097          	auipc	ra,0x4
     e26:	e8a080e7          	jalr	-374(ra) # 4cac <printf>
    exit(1);
     e2a:	4505                	li	a0,1
     e2c:	00004097          	auipc	ra,0x4
     e30:	ad8080e7          	jalr	-1320(ra) # 4904 <exit>
    printf("%s: open removeread failed\n", s);
     e34:	85ce                	mv	a1,s3
     e36:	00004517          	auipc	a0,0x4
     e3a:	5ba50513          	addi	a0,a0,1466 # 53f0 <malloc+0x68c>
     e3e:	00004097          	auipc	ra,0x4
     e42:	e6e080e7          	jalr	-402(ra) # 4cac <printf>
    exit(1);
     e46:	4505                	li	a0,1
     e48:	00004097          	auipc	ra,0x4
     e4c:	abc080e7          	jalr	-1348(ra) # 4904 <exit>
    printf("%s: remove removeread failed\n", s);
     e50:	85ce                	mv	a1,s3
     e52:	00004517          	auipc	a0,0x4
     e56:	5be50513          	addi	a0,a0,1470 # 5410 <malloc+0x6ac>
     e5a:	00004097          	auipc	ra,0x4
     e5e:	e52080e7          	jalr	-430(ra) # 4cac <printf>
    exit(1);
     e62:	4505                	li	a0,1
     e64:	00004097          	auipc	ra,0x4
     e68:	aa0080e7          	jalr	-1376(ra) # 4904 <exit>
    printf("%s: removeread read failed", s);
     e6c:	85ce                	mv	a1,s3
     e6e:	00004517          	auipc	a0,0x4
     e72:	5ca50513          	addi	a0,a0,1482 # 5438 <malloc+0x6d4>
     e76:	00004097          	auipc	ra,0x4
     e7a:	e36080e7          	jalr	-458(ra) # 4cac <printf>
    exit(1);
     e7e:	4505                	li	a0,1
     e80:	00004097          	auipc	ra,0x4
     e84:	a84080e7          	jalr	-1404(ra) # 4904 <exit>
    printf("%s: removeread wrong data\n", s);
     e88:	85ce                	mv	a1,s3
     e8a:	00004517          	auipc	a0,0x4
     e8e:	5ce50513          	addi	a0,a0,1486 # 5458 <malloc+0x6f4>
     e92:	00004097          	auipc	ra,0x4
     e96:	e1a080e7          	jalr	-486(ra) # 4cac <printf>
    exit(1);
     e9a:	4505                	li	a0,1
     e9c:	00004097          	auipc	ra,0x4
     ea0:	a68080e7          	jalr	-1432(ra) # 4904 <exit>
    printf("%s: removeread write failed\n", s);
     ea4:	85ce                	mv	a1,s3
     ea6:	00004517          	auipc	a0,0x4
     eaa:	5d250513          	addi	a0,a0,1490 # 5478 <malloc+0x714>
     eae:	00004097          	auipc	ra,0x4
     eb2:	dfe080e7          	jalr	-514(ra) # 4cac <printf>
    exit(1);
     eb6:	4505                	li	a0,1
     eb8:	00004097          	auipc	ra,0x4
     ebc:	a4c080e7          	jalr	-1460(ra) # 4904 <exit>

0000000000000ec0 <pgbug>:
{
     ec0:	7179                	addi	sp,sp,-48
     ec2:	f406                	sd	ra,40(sp)
     ec4:	f022                	sd	s0,32(sp)
     ec6:	ec26                	sd	s1,24(sp)
     ec8:	1800                	addi	s0,sp,48
  argv[0] = 0;
     eca:	fc043c23          	sd	zero,-40(s0)
  exec((char*)0xeaeb0b5b00002f5e, argv);
     ece:	00006497          	auipc	s1,0x6
     ed2:	da24b483          	ld	s1,-606(s1) # 6c70 <malloc+0x1f0c>
     ed6:	fd840593          	addi	a1,s0,-40
     eda:	8526                	mv	a0,s1
     edc:	00004097          	auipc	ra,0x4
     ee0:	a64080e7          	jalr	-1436(ra) # 4940 <exec>
  pipe((int*)0xeaeb0b5b00002f5e);
     ee4:	8526                	mv	a0,s1
     ee6:	00004097          	auipc	ra,0x4
     eea:	a30080e7          	jalr	-1488(ra) # 4916 <pipe>
  exit(0);
     eee:	4501                	li	a0,0
     ef0:	00004097          	auipc	ra,0x4
     ef4:	a14080e7          	jalr	-1516(ra) # 4904 <exit>

0000000000000ef8 <badarg>:

// regression test. test whether exec() leaks memory if one of the
// arguments is invalid. the test passes if the kernel doesn't panic.
void
badarg(char *s)
{
     ef8:	7139                	addi	sp,sp,-64
     efa:	fc06                	sd	ra,56(sp)
     efc:	f822                	sd	s0,48(sp)
     efe:	f426                	sd	s1,40(sp)
     f00:	f04a                	sd	s2,32(sp)
     f02:	ec4e                	sd	s3,24(sp)
     f04:	e852                	sd	s4,16(sp)
     f06:	0080                	addi	s0,sp,64
     f08:	64b1                	lui	s1,0xc
     f0a:	35048493          	addi	s1,s1,848 # c350 <__BSS_END__+0x2c0>
  for(int i = 0; i < 50000; i++){
    char *argv[2];
    argv[0] = (char*)0xffffffff;
     f0e:	597d                	li	s2,-1
     f10:	02095913          	srli	s2,s2,0x20
    argv[1] = 0;
    exec("echo", argv);
     f14:	fc040a13          	addi	s4,s0,-64
     f18:	00004997          	auipc	s3,0x4
     f1c:	fa898993          	addi	s3,s3,-88 # 4ec0 <malloc+0x15c>
    argv[0] = (char*)0xffffffff;
     f20:	fd243023          	sd	s2,-64(s0)
    argv[1] = 0;
     f24:	fc043423          	sd	zero,-56(s0)
    exec("echo", argv);
     f28:	85d2                	mv	a1,s4
     f2a:	854e                	mv	a0,s3
     f2c:	00004097          	auipc	ra,0x4
     f30:	a14080e7          	jalr	-1516(ra) # 4940 <exec>
  for(int i = 0; i < 50000; i++){
     f34:	34fd                	addiw	s1,s1,-1
     f36:	f4ed                	bnez	s1,f20 <badarg+0x28>
  }
  
  exit(0);
     f38:	4501                	li	a0,0
     f3a:	00004097          	auipc	ra,0x4
     f3e:	9ca080e7          	jalr	-1590(ra) # 4904 <exit>

0000000000000f42 <copyinstr2>:
{
     f42:	714d                	addi	sp,sp,-336
     f44:	e686                	sd	ra,328(sp)
     f46:	e2a2                	sd	s0,320(sp)
     f48:	0a80                	addi	s0,sp,336
  for(int i = 0; i < MAXPATH; i++)
     f4a:	ee840793          	addi	a5,s0,-280
     f4e:	fec40693          	addi	a3,s0,-20
    b[i] = 'x';
     f52:	07800713          	li	a4,120
     f56:	00e78023          	sb	a4,0(a5)
  for(int i = 0; i < MAXPATH; i++)
     f5a:	0785                	addi	a5,a5,1
     f5c:	fed79de3          	bne	a5,a3,f56 <copyinstr2+0x14>
  b[MAXPATH] = '\0';
     f60:	fe040623          	sb	zero,-20(s0)
  int ret = remove(b);
     f64:	ee840513          	addi	a0,s0,-280
     f68:	00004097          	auipc	ra,0x4
     f6c:	a4c080e7          	jalr	-1460(ra) # 49b4 <remove>
  if(ret != -1){
     f70:	57fd                	li	a5,-1
     f72:	0cf51663          	bne	a0,a5,103e <copyinstr2+0xfc>
  int fd = open(b, O_CREATE | O_WRONLY);
     f76:	20100593          	li	a1,513
     f7a:	ee840513          	addi	a0,s0,-280
     f7e:	00004097          	auipc	ra,0x4
     f82:	9cc080e7          	jalr	-1588(ra) # 494a <open>
  if(fd != -1){
     f86:	57fd                	li	a5,-1
     f88:	0cf51b63          	bne	a0,a5,105e <copyinstr2+0x11c>
  char *args[] = { "xx", 0 };
     f8c:	00005797          	auipc	a5,0x5
     f90:	12478793          	addi	a5,a5,292 # 60b0 <malloc+0x134c>
     f94:	ecf43c23          	sd	a5,-296(s0)
     f98:	ee043023          	sd	zero,-288(s0)
  ret = exec(b, args);
     f9c:	ed840593          	addi	a1,s0,-296
     fa0:	ee840513          	addi	a0,s0,-280
     fa4:	00004097          	auipc	ra,0x4
     fa8:	99c080e7          	jalr	-1636(ra) # 4940 <exec>
  if(ret != -1){
     fac:	57fd                	li	a5,-1
     fae:	0cf51863          	bne	a0,a5,107e <copyinstr2+0x13c>
  int pid = fork();
     fb2:	00004097          	auipc	ra,0x4
     fb6:	94a080e7          	jalr	-1718(ra) # 48fc <fork>
  if(pid < 0){
     fba:	0e054263          	bltz	a0,109e <copyinstr2+0x15c>
  if(pid == 0){
     fbe:	10051363          	bnez	a0,10c4 <copyinstr2+0x182>
     fc2:	00006797          	auipc	a5,0x6
     fc6:	19e78793          	addi	a5,a5,414 # 7160 <big.0>
     fca:	00007697          	auipc	a3,0x7
     fce:	19668693          	addi	a3,a3,406 # 8160 <__global_pointer$+0x908>
      big[i] = 'x';
     fd2:	07800713          	li	a4,120
     fd6:	00e78023          	sb	a4,0(a5)
    for(int i = 0; i < PGSIZE; i++)
     fda:	0785                	addi	a5,a5,1
     fdc:	fed79de3          	bne	a5,a3,fd6 <copyinstr2+0x94>
    big[PGSIZE] = '\0';
     fe0:	00007797          	auipc	a5,0x7
     fe4:	18078023          	sb	zero,384(a5) # 8160 <__global_pointer$+0x908>
    char *args2[] = { big, big, big, 0 };
     fe8:	00006797          	auipc	a5,0x6
     fec:	d0878793          	addi	a5,a5,-760 # 6cf0 <__DATA_BEGIN__>
     ff0:	6390                	ld	a2,0(a5)
     ff2:	6794                	ld	a3,8(a5)
     ff4:	6b98                	ld	a4,16(a5)
     ff6:	6f9c                	ld	a5,24(a5)
     ff8:	eac43823          	sd	a2,-336(s0)
     ffc:	ead43c23          	sd	a3,-328(s0)
    1000:	ece43023          	sd	a4,-320(s0)
    1004:	ecf43423          	sd	a5,-312(s0)
    ret = exec("echo", args2);
    1008:	eb040593          	addi	a1,s0,-336
    100c:	00004517          	auipc	a0,0x4
    1010:	eb450513          	addi	a0,a0,-332 # 4ec0 <malloc+0x15c>
    1014:	00004097          	auipc	ra,0x4
    1018:	92c080e7          	jalr	-1748(ra) # 4940 <exec>
    if(ret != -1){
    101c:	57fd                	li	a5,-1
    101e:	08f50d63          	beq	a0,a5,10b8 <copyinstr2+0x176>
      printf("exec(echo, BIG) returned %d, not -1\n", fd);
    1022:	55fd                	li	a1,-1
    1024:	00004517          	auipc	a0,0x4
    1028:	4d450513          	addi	a0,a0,1236 # 54f8 <malloc+0x794>
    102c:	00004097          	auipc	ra,0x4
    1030:	c80080e7          	jalr	-896(ra) # 4cac <printf>
      exit(1);
    1034:	4505                	li	a0,1
    1036:	00004097          	auipc	ra,0x4
    103a:	8ce080e7          	jalr	-1842(ra) # 4904 <exit>
    printf("remove(%s) returned %d, not -1\n", b, ret);
    103e:	862a                	mv	a2,a0
    1040:	ee840593          	addi	a1,s0,-280
    1044:	00004517          	auipc	a0,0x4
    1048:	45450513          	addi	a0,a0,1108 # 5498 <malloc+0x734>
    104c:	00004097          	auipc	ra,0x4
    1050:	c60080e7          	jalr	-928(ra) # 4cac <printf>
    exit(1);
    1054:	4505                	li	a0,1
    1056:	00004097          	auipc	ra,0x4
    105a:	8ae080e7          	jalr	-1874(ra) # 4904 <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    105e:	862a                	mv	a2,a0
    1060:	ee840593          	addi	a1,s0,-280
    1064:	00004517          	auipc	a0,0x4
    1068:	45450513          	addi	a0,a0,1108 # 54b8 <malloc+0x754>
    106c:	00004097          	auipc	ra,0x4
    1070:	c40080e7          	jalr	-960(ra) # 4cac <printf>
    exit(1);
    1074:	4505                	li	a0,1
    1076:	00004097          	auipc	ra,0x4
    107a:	88e080e7          	jalr	-1906(ra) # 4904 <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    107e:	567d                	li	a2,-1
    1080:	ee840593          	addi	a1,s0,-280
    1084:	00004517          	auipc	a0,0x4
    1088:	45450513          	addi	a0,a0,1108 # 54d8 <malloc+0x774>
    108c:	00004097          	auipc	ra,0x4
    1090:	c20080e7          	jalr	-992(ra) # 4cac <printf>
    exit(1);
    1094:	4505                	li	a0,1
    1096:	00004097          	auipc	ra,0x4
    109a:	86e080e7          	jalr	-1938(ra) # 4904 <exit>
    printf("fork failed\n");
    109e:	00005517          	auipc	a0,0x5
    10a2:	83250513          	addi	a0,a0,-1998 # 58d0 <malloc+0xb6c>
    10a6:	00004097          	auipc	ra,0x4
    10aa:	c06080e7          	jalr	-1018(ra) # 4cac <printf>
    exit(1);
    10ae:	4505                	li	a0,1
    10b0:	00004097          	auipc	ra,0x4
    10b4:	854080e7          	jalr	-1964(ra) # 4904 <exit>
    exit(747); // OK
    10b8:	2eb00513          	li	a0,747
    10bc:	00004097          	auipc	ra,0x4
    10c0:	848080e7          	jalr	-1976(ra) # 4904 <exit>
  int st = 0;
    10c4:	ec042a23          	sw	zero,-300(s0)
  wait(&st);
    10c8:	ed440513          	addi	a0,s0,-300
    10cc:	00004097          	auipc	ra,0x4
    10d0:	842080e7          	jalr	-1982(ra) # 490e <wait>
  if(st != 747){
    10d4:	ed442703          	lw	a4,-300(s0)
    10d8:	2eb00793          	li	a5,747
    10dc:	00f71663          	bne	a4,a5,10e8 <copyinstr2+0x1a6>
}
    10e0:	60b6                	ld	ra,328(sp)
    10e2:	6416                	ld	s0,320(sp)
    10e4:	6171                	addi	sp,sp,336
    10e6:	8082                	ret
    printf("exec(echo, BIG) succeeded, should have failed\n");
    10e8:	00004517          	auipc	a0,0x4
    10ec:	43850513          	addi	a0,a0,1080 # 5520 <malloc+0x7bc>
    10f0:	00004097          	auipc	ra,0x4
    10f4:	bbc080e7          	jalr	-1092(ra) # 4cac <printf>
    exit(1);
    10f8:	4505                	li	a0,1
    10fa:	00004097          	auipc	ra,0x4
    10fe:	80a080e7          	jalr	-2038(ra) # 4904 <exit>

0000000000001102 <truncate3>:
{
    1102:	7159                	addi	sp,sp,-112
    1104:	f486                	sd	ra,104(sp)
    1106:	f0a2                	sd	s0,96(sp)
    1108:	eca6                	sd	s1,88(sp)
    110a:	e8ca                	sd	s2,80(sp)
    110c:	e4ce                	sd	s3,72(sp)
    110e:	e0d2                	sd	s4,64(sp)
    1110:	fc56                	sd	s5,56(sp)
    1112:	f85a                	sd	s6,48(sp)
    1114:	1880                	addi	s0,sp,112
    1116:	892a                	mv	s2,a0
  close(open("truncfile", O_CREATE|O_TRUNC|O_WRONLY));
    1118:	60100593          	li	a1,1537
    111c:	00004517          	auipc	a0,0x4
    1120:	dfc50513          	addi	a0,a0,-516 # 4f18 <malloc+0x1b4>
    1124:	00004097          	auipc	ra,0x4
    1128:	826080e7          	jalr	-2010(ra) # 494a <open>
    112c:	00004097          	auipc	ra,0x4
    1130:	804080e7          	jalr	-2044(ra) # 4930 <close>
  pid = fork();
    1134:	00003097          	auipc	ra,0x3
    1138:	7c8080e7          	jalr	1992(ra) # 48fc <fork>
  if(pid < 0){
    113c:	08054163          	bltz	a0,11be <truncate3+0xbc>
  if(pid == 0){
    1140:	e971                	bnez	a0,1214 <truncate3+0x112>
    1142:	06400993          	li	s3,100
      int fd = open("truncfile", O_WRONLY);
    1146:	00004a17          	auipc	s4,0x4
    114a:	dd2a0a13          	addi	s4,s4,-558 # 4f18 <malloc+0x1b4>
      int n = write(fd, "1234567890", 10);
    114e:	00004a97          	auipc	s5,0x4
    1152:	432a8a93          	addi	s5,s5,1074 # 5580 <malloc+0x81c>
      read(fd, buf, sizeof(buf));
    1156:	f9840b13          	addi	s6,s0,-104
      int fd = open("truncfile", O_WRONLY);
    115a:	4585                	li	a1,1
    115c:	8552                	mv	a0,s4
    115e:	00003097          	auipc	ra,0x3
    1162:	7ec080e7          	jalr	2028(ra) # 494a <open>
    1166:	84aa                	mv	s1,a0
      if(fd < 0){
    1168:	06054963          	bltz	a0,11da <truncate3+0xd8>
      int n = write(fd, "1234567890", 10);
    116c:	4629                	li	a2,10
    116e:	85d6                	mv	a1,s5
    1170:	00003097          	auipc	ra,0x3
    1174:	7b6080e7          	jalr	1974(ra) # 4926 <write>
      if(n != 10){
    1178:	47a9                	li	a5,10
    117a:	06f51e63          	bne	a0,a5,11f6 <truncate3+0xf4>
      close(fd);
    117e:	8526                	mv	a0,s1
    1180:	00003097          	auipc	ra,0x3
    1184:	7b0080e7          	jalr	1968(ra) # 4930 <close>
      fd = open("truncfile", O_RDONLY);
    1188:	4581                	li	a1,0
    118a:	8552                	mv	a0,s4
    118c:	00003097          	auipc	ra,0x3
    1190:	7be080e7          	jalr	1982(ra) # 494a <open>
    1194:	84aa                	mv	s1,a0
      read(fd, buf, sizeof(buf));
    1196:	02000613          	li	a2,32
    119a:	85da                	mv	a1,s6
    119c:	00003097          	auipc	ra,0x3
    11a0:	782080e7          	jalr	1922(ra) # 491e <read>
      close(fd);
    11a4:	8526                	mv	a0,s1
    11a6:	00003097          	auipc	ra,0x3
    11aa:	78a080e7          	jalr	1930(ra) # 4930 <close>
    for(int i = 0; i < 100; i++){
    11ae:	39fd                	addiw	s3,s3,-1
    11b0:	fa0995e3          	bnez	s3,115a <truncate3+0x58>
    exit(0);
    11b4:	4501                	li	a0,0
    11b6:	00003097          	auipc	ra,0x3
    11ba:	74e080e7          	jalr	1870(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    11be:	85ca                	mv	a1,s2
    11c0:	00004517          	auipc	a0,0x4
    11c4:	39050513          	addi	a0,a0,912 # 5550 <malloc+0x7ec>
    11c8:	00004097          	auipc	ra,0x4
    11cc:	ae4080e7          	jalr	-1308(ra) # 4cac <printf>
    exit(1);
    11d0:	4505                	li	a0,1
    11d2:	00003097          	auipc	ra,0x3
    11d6:	732080e7          	jalr	1842(ra) # 4904 <exit>
        printf("%s: open failed\n", s);
    11da:	85ca                	mv	a1,s2
    11dc:	00004517          	auipc	a0,0x4
    11e0:	38c50513          	addi	a0,a0,908 # 5568 <malloc+0x804>
    11e4:	00004097          	auipc	ra,0x4
    11e8:	ac8080e7          	jalr	-1336(ra) # 4cac <printf>
        exit(1);
    11ec:	4505                	li	a0,1
    11ee:	00003097          	auipc	ra,0x3
    11f2:	716080e7          	jalr	1814(ra) # 4904 <exit>
        printf("%s: write got %d, expected 10\n", s, n);
    11f6:	862a                	mv	a2,a0
    11f8:	85ca                	mv	a1,s2
    11fa:	00004517          	auipc	a0,0x4
    11fe:	39650513          	addi	a0,a0,918 # 5590 <malloc+0x82c>
    1202:	00004097          	auipc	ra,0x4
    1206:	aaa080e7          	jalr	-1366(ra) # 4cac <printf>
        exit(1);
    120a:	4505                	li	a0,1
    120c:	00003097          	auipc	ra,0x3
    1210:	6f8080e7          	jalr	1784(ra) # 4904 <exit>
    1214:	09600993          	li	s3,150
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    1218:	00004a17          	auipc	s4,0x4
    121c:	d00a0a13          	addi	s4,s4,-768 # 4f18 <malloc+0x1b4>
    int n = write(fd, "xxx", 3);
    1220:	00004a97          	auipc	s5,0x4
    1224:	390a8a93          	addi	s5,s5,912 # 55b0 <malloc+0x84c>
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
    1228:	60100593          	li	a1,1537
    122c:	8552                	mv	a0,s4
    122e:	00003097          	auipc	ra,0x3
    1232:	71c080e7          	jalr	1820(ra) # 494a <open>
    1236:	84aa                	mv	s1,a0
    if(fd < 0){
    1238:	04054763          	bltz	a0,1286 <truncate3+0x184>
    int n = write(fd, "xxx", 3);
    123c:	460d                	li	a2,3
    123e:	85d6                	mv	a1,s5
    1240:	00003097          	auipc	ra,0x3
    1244:	6e6080e7          	jalr	1766(ra) # 4926 <write>
    if(n != 3){
    1248:	478d                	li	a5,3
    124a:	04f51c63          	bne	a0,a5,12a2 <truncate3+0x1a0>
    close(fd);
    124e:	8526                	mv	a0,s1
    1250:	00003097          	auipc	ra,0x3
    1254:	6e0080e7          	jalr	1760(ra) # 4930 <close>
  for(int i = 0; i < 150; i++){
    1258:	39fd                	addiw	s3,s3,-1
    125a:	fc0997e3          	bnez	s3,1228 <truncate3+0x126>
  wait(&xstatus);
    125e:	fbc40513          	addi	a0,s0,-68
    1262:	00003097          	auipc	ra,0x3
    1266:	6ac080e7          	jalr	1708(ra) # 490e <wait>
  remove("truncfile");
    126a:	00004517          	auipc	a0,0x4
    126e:	cae50513          	addi	a0,a0,-850 # 4f18 <malloc+0x1b4>
    1272:	00003097          	auipc	ra,0x3
    1276:	742080e7          	jalr	1858(ra) # 49b4 <remove>
  exit(xstatus);
    127a:	fbc42503          	lw	a0,-68(s0)
    127e:	00003097          	auipc	ra,0x3
    1282:	686080e7          	jalr	1670(ra) # 4904 <exit>
      printf("%s: open failed\n", s);
    1286:	85ca                	mv	a1,s2
    1288:	00004517          	auipc	a0,0x4
    128c:	2e050513          	addi	a0,a0,736 # 5568 <malloc+0x804>
    1290:	00004097          	auipc	ra,0x4
    1294:	a1c080e7          	jalr	-1508(ra) # 4cac <printf>
      exit(1);
    1298:	4505                	li	a0,1
    129a:	00003097          	auipc	ra,0x3
    129e:	66a080e7          	jalr	1642(ra) # 4904 <exit>
      printf("%s: write got %d, expected 3\n", s, n);
    12a2:	862a                	mv	a2,a0
    12a4:	85ca                	mv	a1,s2
    12a6:	00004517          	auipc	a0,0x4
    12aa:	31250513          	addi	a0,a0,786 # 55b8 <malloc+0x854>
    12ae:	00004097          	auipc	ra,0x4
    12b2:	9fe080e7          	jalr	-1538(ra) # 4cac <printf>
      exit(1);
    12b6:	4505                	li	a0,1
    12b8:	00003097          	auipc	ra,0x3
    12bc:	64c080e7          	jalr	1612(ra) # 4904 <exit>

00000000000012c0 <exectest>:
{
    12c0:	715d                	addi	sp,sp,-80
    12c2:	e486                	sd	ra,72(sp)
    12c4:	e0a2                	sd	s0,64(sp)
    12c6:	fc26                	sd	s1,56(sp)
    12c8:	f84a                	sd	s2,48(sp)
    12ca:	0880                	addi	s0,sp,80
    12cc:	892a                	mv	s2,a0
  char *echoargv[] = { "echo", "OK", 0 };
    12ce:	00004797          	auipc	a5,0x4
    12d2:	bf278793          	addi	a5,a5,-1038 # 4ec0 <malloc+0x15c>
    12d6:	fcf43023          	sd	a5,-64(s0)
    12da:	00004797          	auipc	a5,0x4
    12de:	2fe78793          	addi	a5,a5,766 # 55d8 <malloc+0x874>
    12e2:	fcf43423          	sd	a5,-56(s0)
    12e6:	fc043823          	sd	zero,-48(s0)
  remove("echo-ok");
    12ea:	00004517          	auipc	a0,0x4
    12ee:	2f650513          	addi	a0,a0,758 # 55e0 <malloc+0x87c>
    12f2:	00003097          	auipc	ra,0x3
    12f6:	6c2080e7          	jalr	1730(ra) # 49b4 <remove>
  pid = fork();
    12fa:	00003097          	auipc	ra,0x3
    12fe:	602080e7          	jalr	1538(ra) # 48fc <fork>
  if(pid < 0) {
    1302:	04054663          	bltz	a0,134e <exectest+0x8e>
    1306:	84aa                	mv	s1,a0
  if(pid == 0) {
    1308:	e959                	bnez	a0,139e <exectest+0xde>
    close(1);
    130a:	4505                	li	a0,1
    130c:	00003097          	auipc	ra,0x3
    1310:	624080e7          	jalr	1572(ra) # 4930 <close>
    fd = open("echo-ok", O_CREATE|O_WRONLY);
    1314:	20100593          	li	a1,513
    1318:	00004517          	auipc	a0,0x4
    131c:	2c850513          	addi	a0,a0,712 # 55e0 <malloc+0x87c>
    1320:	00003097          	auipc	ra,0x3
    1324:	62a080e7          	jalr	1578(ra) # 494a <open>
    if(fd < 0) {
    1328:	04054163          	bltz	a0,136a <exectest+0xaa>
    if(fd != 1) {
    132c:	4785                	li	a5,1
    132e:	04f50c63          	beq	a0,a5,1386 <exectest+0xc6>
      printf("%s: wrong fd\n", s);
    1332:	85ca                	mv	a1,s2
    1334:	00004517          	auipc	a0,0x4
    1338:	2cc50513          	addi	a0,a0,716 # 5600 <malloc+0x89c>
    133c:	00004097          	auipc	ra,0x4
    1340:	970080e7          	jalr	-1680(ra) # 4cac <printf>
      exit(1);
    1344:	4505                	li	a0,1
    1346:	00003097          	auipc	ra,0x3
    134a:	5be080e7          	jalr	1470(ra) # 4904 <exit>
     printf("%s: fork failed\n", s);
    134e:	85ca                	mv	a1,s2
    1350:	00004517          	auipc	a0,0x4
    1354:	20050513          	addi	a0,a0,512 # 5550 <malloc+0x7ec>
    1358:	00004097          	auipc	ra,0x4
    135c:	954080e7          	jalr	-1708(ra) # 4cac <printf>
     exit(1);
    1360:	4505                	li	a0,1
    1362:	00003097          	auipc	ra,0x3
    1366:	5a2080e7          	jalr	1442(ra) # 4904 <exit>
      printf("%s: create failed\n", s);
    136a:	85ca                	mv	a1,s2
    136c:	00004517          	auipc	a0,0x4
    1370:	27c50513          	addi	a0,a0,636 # 55e8 <malloc+0x884>
    1374:	00004097          	auipc	ra,0x4
    1378:	938080e7          	jalr	-1736(ra) # 4cac <printf>
      exit(1);
    137c:	4505                	li	a0,1
    137e:	00003097          	auipc	ra,0x3
    1382:	586080e7          	jalr	1414(ra) # 4904 <exit>
    if(exec("echo", echoargv) < 0){
    1386:	fc040593          	addi	a1,s0,-64
    138a:	00004517          	auipc	a0,0x4
    138e:	b3650513          	addi	a0,a0,-1226 # 4ec0 <malloc+0x15c>
    1392:	00003097          	auipc	ra,0x3
    1396:	5ae080e7          	jalr	1454(ra) # 4940 <exec>
    139a:	02054163          	bltz	a0,13bc <exectest+0xfc>
  if (wait(&xstatus) != pid) {
    139e:	fdc40513          	addi	a0,s0,-36
    13a2:	00003097          	auipc	ra,0x3
    13a6:	56c080e7          	jalr	1388(ra) # 490e <wait>
    13aa:	02951763          	bne	a0,s1,13d8 <exectest+0x118>
  if(xstatus != 0)
    13ae:	fdc42503          	lw	a0,-36(s0)
    13b2:	cd0d                	beqz	a0,13ec <exectest+0x12c>
    exit(xstatus);
    13b4:	00003097          	auipc	ra,0x3
    13b8:	550080e7          	jalr	1360(ra) # 4904 <exit>
      printf("%s: exec echo failed\n", s);
    13bc:	85ca                	mv	a1,s2
    13be:	00004517          	auipc	a0,0x4
    13c2:	25250513          	addi	a0,a0,594 # 5610 <malloc+0x8ac>
    13c6:	00004097          	auipc	ra,0x4
    13ca:	8e6080e7          	jalr	-1818(ra) # 4cac <printf>
      exit(1);
    13ce:	4505                	li	a0,1
    13d0:	00003097          	auipc	ra,0x3
    13d4:	534080e7          	jalr	1332(ra) # 4904 <exit>
    printf("%s: wait failed!\n", s);
    13d8:	85ca                	mv	a1,s2
    13da:	00004517          	auipc	a0,0x4
    13de:	24e50513          	addi	a0,a0,590 # 5628 <malloc+0x8c4>
    13e2:	00004097          	auipc	ra,0x4
    13e6:	8ca080e7          	jalr	-1846(ra) # 4cac <printf>
    13ea:	b7d1                	j	13ae <exectest+0xee>
  fd = open("echo-ok", O_RDONLY);
    13ec:	4581                	li	a1,0
    13ee:	00004517          	auipc	a0,0x4
    13f2:	1f250513          	addi	a0,a0,498 # 55e0 <malloc+0x87c>
    13f6:	00003097          	auipc	ra,0x3
    13fa:	554080e7          	jalr	1364(ra) # 494a <open>
  if(fd < 0) {
    13fe:	02054a63          	bltz	a0,1432 <exectest+0x172>
  if (read(fd, buf, 2) != 2) {
    1402:	4609                	li	a2,2
    1404:	fb840593          	addi	a1,s0,-72
    1408:	00003097          	auipc	ra,0x3
    140c:	516080e7          	jalr	1302(ra) # 491e <read>
    1410:	4789                	li	a5,2
    1412:	02f50e63          	beq	a0,a5,144e <exectest+0x18e>
    printf("%s: read failed\n", s);
    1416:	85ca                	mv	a1,s2
    1418:	00004517          	auipc	a0,0x4
    141c:	e7850513          	addi	a0,a0,-392 # 5290 <malloc+0x52c>
    1420:	00004097          	auipc	ra,0x4
    1424:	88c080e7          	jalr	-1908(ra) # 4cac <printf>
    exit(1);
    1428:	4505                	li	a0,1
    142a:	00003097          	auipc	ra,0x3
    142e:	4da080e7          	jalr	1242(ra) # 4904 <exit>
    printf("%s: open failed\n", s);
    1432:	85ca                	mv	a1,s2
    1434:	00004517          	auipc	a0,0x4
    1438:	13450513          	addi	a0,a0,308 # 5568 <malloc+0x804>
    143c:	00004097          	auipc	ra,0x4
    1440:	870080e7          	jalr	-1936(ra) # 4cac <printf>
    exit(1);
    1444:	4505                	li	a0,1
    1446:	00003097          	auipc	ra,0x3
    144a:	4be080e7          	jalr	1214(ra) # 4904 <exit>
  remove("echo-ok");
    144e:	00004517          	auipc	a0,0x4
    1452:	19250513          	addi	a0,a0,402 # 55e0 <malloc+0x87c>
    1456:	00003097          	auipc	ra,0x3
    145a:	55e080e7          	jalr	1374(ra) # 49b4 <remove>
  if(buf[0] == 'O' && buf[1] == 'K')
    145e:	fb844703          	lbu	a4,-72(s0)
    1462:	04f00793          	li	a5,79
    1466:	00f71863          	bne	a4,a5,1476 <exectest+0x1b6>
    146a:	fb944703          	lbu	a4,-71(s0)
    146e:	04b00793          	li	a5,75
    1472:	02f70063          	beq	a4,a5,1492 <exectest+0x1d2>
    printf("%s: wrong output\n", s);
    1476:	85ca                	mv	a1,s2
    1478:	00004517          	auipc	a0,0x4
    147c:	1c850513          	addi	a0,a0,456 # 5640 <malloc+0x8dc>
    1480:	00004097          	auipc	ra,0x4
    1484:	82c080e7          	jalr	-2004(ra) # 4cac <printf>
    exit(1);
    1488:	4505                	li	a0,1
    148a:	00003097          	auipc	ra,0x3
    148e:	47a080e7          	jalr	1146(ra) # 4904 <exit>
    exit(0);
    1492:	4501                	li	a0,0
    1494:	00003097          	auipc	ra,0x3
    1498:	470080e7          	jalr	1136(ra) # 4904 <exit>

000000000000149c <pipe1>:
{
    149c:	711d                	addi	sp,sp,-96
    149e:	ec86                	sd	ra,88(sp)
    14a0:	e8a2                	sd	s0,80(sp)
    14a2:	e4a6                	sd	s1,72(sp)
    14a4:	e0ca                	sd	s2,64(sp)
    14a6:	fc4e                	sd	s3,56(sp)
    14a8:	f852                	sd	s4,48(sp)
    14aa:	f456                	sd	s5,40(sp)
    14ac:	f05a                	sd	s6,32(sp)
    14ae:	ec5e                	sd	s7,24(sp)
    14b0:	1080                	addi	s0,sp,96
    14b2:	892a                	mv	s2,a0
  if(pipe(fds) != 0){
    14b4:	fa840513          	addi	a0,s0,-88
    14b8:	00003097          	auipc	ra,0x3
    14bc:	45e080e7          	jalr	1118(ra) # 4916 <pipe>
    14c0:	ed2d                	bnez	a0,153a <pipe1+0x9e>
    14c2:	84aa                	mv	s1,a0
  pid = fork();
    14c4:	00003097          	auipc	ra,0x3
    14c8:	438080e7          	jalr	1080(ra) # 48fc <fork>
    14cc:	8a2a                	mv	s4,a0
  if(pid == 0){
    14ce:	c541                	beqz	a0,1556 <pipe1+0xba>
  } else if(pid > 0){
    14d0:	16a05f63          	blez	a0,164e <pipe1+0x1b2>
    close(fds[1]);
    14d4:	fac42503          	lw	a0,-84(s0)
    14d8:	00003097          	auipc	ra,0x3
    14dc:	458080e7          	jalr	1112(ra) # 4930 <close>
    total = 0;
    14e0:	8aa6                	mv	s5,s1
    cc = 1;
    14e2:	4985                	li	s3,1
    while((n = read(fds[0], buf, cc)) > 0){
    14e4:	00009b17          	auipc	s6,0x9
    14e8:	394b0b13          	addi	s6,s6,916 # a878 <buf>
      if(cc > sizeof(buf))
    14ec:	6a09                	lui	s4,0x2
    14ee:	800a0a13          	addi	s4,s4,-2048 # 1800 <forkfork+0x42>
    while((n = read(fds[0], buf, cc)) > 0){
    14f2:	864e                	mv	a2,s3
    14f4:	85da                	mv	a1,s6
    14f6:	fa842503          	lw	a0,-88(s0)
    14fa:	00003097          	auipc	ra,0x3
    14fe:	424080e7          	jalr	1060(ra) # 491e <read>
    1502:	10a05163          	blez	a0,1604 <pipe1+0x168>
      for(i = 0; i < n; i++){
    1506:	00009717          	auipc	a4,0x9
    150a:	37270713          	addi	a4,a4,882 # a878 <buf>
    150e:	00a4863b          	addw	a2,s1,a0
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1512:	00074683          	lbu	a3,0(a4)
    1516:	0ff4f793          	zext.b	a5,s1
    151a:	2485                	addiw	s1,s1,1
    151c:	0cf69063          	bne	a3,a5,15dc <pipe1+0x140>
      for(i = 0; i < n; i++){
    1520:	0705                	addi	a4,a4,1
    1522:	fec498e3          	bne	s1,a2,1512 <pipe1+0x76>
      total += n;
    1526:	00aa8abb          	addw	s5,s5,a0
      cc = cc * 2;
    152a:	0019979b          	slliw	a5,s3,0x1
    152e:	0007899b          	sext.w	s3,a5
      if(cc > sizeof(buf))
    1532:	fd3a70e3          	bgeu	s4,s3,14f2 <pipe1+0x56>
        cc = sizeof(buf);
    1536:	89d2                	mv	s3,s4
    1538:	bf6d                	j	14f2 <pipe1+0x56>
    printf("%s: pipe() failed\n", s);
    153a:	85ca                	mv	a1,s2
    153c:	00004517          	auipc	a0,0x4
    1540:	11c50513          	addi	a0,a0,284 # 5658 <malloc+0x8f4>
    1544:	00003097          	auipc	ra,0x3
    1548:	768080e7          	jalr	1896(ra) # 4cac <printf>
    exit(1);
    154c:	4505                	li	a0,1
    154e:	00003097          	auipc	ra,0x3
    1552:	3b6080e7          	jalr	950(ra) # 4904 <exit>
    close(fds[0]);
    1556:	fa842503          	lw	a0,-88(s0)
    155a:	00003097          	auipc	ra,0x3
    155e:	3d6080e7          	jalr	982(ra) # 4930 <close>
    for(n = 0; n < N; n++){
    1562:	00009b17          	auipc	s6,0x9
    1566:	316b0b13          	addi	s6,s6,790 # a878 <buf>
    156a:	416004bb          	negw	s1,s6
    156e:	0ff4f493          	zext.b	s1,s1
    1572:	409b0993          	addi	s3,s6,1033
      if(write(fds[1], buf, SZ) != SZ){
    1576:	8bda                	mv	s7,s6
    for(n = 0; n < N; n++){
    1578:	6a85                	lui	s5,0x1
    157a:	42da8a93          	addi	s5,s5,1069 # 142d <exectest+0x16d>
{
    157e:	87da                	mv	a5,s6
        buf[i] = seq++;
    1580:	0097873b          	addw	a4,a5,s1
    1584:	00e78023          	sb	a4,0(a5)
      for(i = 0; i < SZ; i++)
    1588:	0785                	addi	a5,a5,1
    158a:	fef99be3          	bne	s3,a5,1580 <pipe1+0xe4>
        buf[i] = seq++;
    158e:	409a0a1b          	addiw	s4,s4,1033
      if(write(fds[1], buf, SZ) != SZ){
    1592:	40900613          	li	a2,1033
    1596:	85de                	mv	a1,s7
    1598:	fac42503          	lw	a0,-84(s0)
    159c:	00003097          	auipc	ra,0x3
    15a0:	38a080e7          	jalr	906(ra) # 4926 <write>
    15a4:	40900793          	li	a5,1033
    15a8:	00f51c63          	bne	a0,a5,15c0 <pipe1+0x124>
    for(n = 0; n < N; n++){
    15ac:	24a5                	addiw	s1,s1,9
    15ae:	0ff4f493          	zext.b	s1,s1
    15b2:	fd5a16e3          	bne	s4,s5,157e <pipe1+0xe2>
    exit(0);
    15b6:	4501                	li	a0,0
    15b8:	00003097          	auipc	ra,0x3
    15bc:	34c080e7          	jalr	844(ra) # 4904 <exit>
        printf("%s: pipe1 oops 1\n", s);
    15c0:	85ca                	mv	a1,s2
    15c2:	00004517          	auipc	a0,0x4
    15c6:	0ae50513          	addi	a0,a0,174 # 5670 <malloc+0x90c>
    15ca:	00003097          	auipc	ra,0x3
    15ce:	6e2080e7          	jalr	1762(ra) # 4cac <printf>
        exit(1);
    15d2:	4505                	li	a0,1
    15d4:	00003097          	auipc	ra,0x3
    15d8:	330080e7          	jalr	816(ra) # 4904 <exit>
          printf("%s: pipe1 oops 2\n", s);
    15dc:	85ca                	mv	a1,s2
    15de:	00004517          	auipc	a0,0x4
    15e2:	0aa50513          	addi	a0,a0,170 # 5688 <malloc+0x924>
    15e6:	00003097          	auipc	ra,0x3
    15ea:	6c6080e7          	jalr	1734(ra) # 4cac <printf>
}
    15ee:	60e6                	ld	ra,88(sp)
    15f0:	6446                	ld	s0,80(sp)
    15f2:	64a6                	ld	s1,72(sp)
    15f4:	6906                	ld	s2,64(sp)
    15f6:	79e2                	ld	s3,56(sp)
    15f8:	7a42                	ld	s4,48(sp)
    15fa:	7aa2                	ld	s5,40(sp)
    15fc:	7b02                	ld	s6,32(sp)
    15fe:	6be2                	ld	s7,24(sp)
    1600:	6125                	addi	sp,sp,96
    1602:	8082                	ret
    if(total != N * SZ){
    1604:	6785                	lui	a5,0x1
    1606:	42d78793          	addi	a5,a5,1069 # 142d <exectest+0x16d>
    160a:	02fa8063          	beq	s5,a5,162a <pipe1+0x18e>
      printf("%s: pipe1 oops 3 total %d\n", total);
    160e:	85d6                	mv	a1,s5
    1610:	00004517          	auipc	a0,0x4
    1614:	09050513          	addi	a0,a0,144 # 56a0 <malloc+0x93c>
    1618:	00003097          	auipc	ra,0x3
    161c:	694080e7          	jalr	1684(ra) # 4cac <printf>
      exit(1);
    1620:	4505                	li	a0,1
    1622:	00003097          	auipc	ra,0x3
    1626:	2e2080e7          	jalr	738(ra) # 4904 <exit>
    close(fds[0]);
    162a:	fa842503          	lw	a0,-88(s0)
    162e:	00003097          	auipc	ra,0x3
    1632:	302080e7          	jalr	770(ra) # 4930 <close>
    wait(&xstatus);
    1636:	fa440513          	addi	a0,s0,-92
    163a:	00003097          	auipc	ra,0x3
    163e:	2d4080e7          	jalr	724(ra) # 490e <wait>
    exit(xstatus);
    1642:	fa442503          	lw	a0,-92(s0)
    1646:	00003097          	auipc	ra,0x3
    164a:	2be080e7          	jalr	702(ra) # 4904 <exit>
    printf("%s: fork() failed\n", s);
    164e:	85ca                	mv	a1,s2
    1650:	00004517          	auipc	a0,0x4
    1654:	07050513          	addi	a0,a0,112 # 56c0 <malloc+0x95c>
    1658:	00003097          	auipc	ra,0x3
    165c:	654080e7          	jalr	1620(ra) # 4cac <printf>
    exit(1);
    1660:	4505                	li	a0,1
    1662:	00003097          	auipc	ra,0x3
    1666:	2a2080e7          	jalr	674(ra) # 4904 <exit>

000000000000166a <exitwait>:
{
    166a:	715d                	addi	sp,sp,-80
    166c:	e486                	sd	ra,72(sp)
    166e:	e0a2                	sd	s0,64(sp)
    1670:	fc26                	sd	s1,56(sp)
    1672:	f84a                	sd	s2,48(sp)
    1674:	f44e                	sd	s3,40(sp)
    1676:	f052                	sd	s4,32(sp)
    1678:	ec56                	sd	s5,24(sp)
    167a:	0880                	addi	s0,sp,80
    167c:	8aaa                	mv	s5,a0
  for(i = 0; i < 100; i++){
    167e:	4901                	li	s2,0
      if(wait(&xstate) != pid){
    1680:	fbc40993          	addi	s3,s0,-68
  for(i = 0; i < 100; i++){
    1684:	06400a13          	li	s4,100
    pid = fork();
    1688:	00003097          	auipc	ra,0x3
    168c:	274080e7          	jalr	628(ra) # 48fc <fork>
    1690:	84aa                	mv	s1,a0
    if(pid < 0){
    1692:	02054a63          	bltz	a0,16c6 <exitwait+0x5c>
    if(pid){
    1696:	c151                	beqz	a0,171a <exitwait+0xb0>
      if(wait(&xstate) != pid){
    1698:	854e                	mv	a0,s3
    169a:	00003097          	auipc	ra,0x3
    169e:	274080e7          	jalr	628(ra) # 490e <wait>
    16a2:	04951063          	bne	a0,s1,16e2 <exitwait+0x78>
      if(i != xstate) {
    16a6:	fbc42783          	lw	a5,-68(s0)
    16aa:	05279a63          	bne	a5,s2,16fe <exitwait+0x94>
  for(i = 0; i < 100; i++){
    16ae:	2905                	addiw	s2,s2,1
    16b0:	fd491ce3          	bne	s2,s4,1688 <exitwait+0x1e>
}
    16b4:	60a6                	ld	ra,72(sp)
    16b6:	6406                	ld	s0,64(sp)
    16b8:	74e2                	ld	s1,56(sp)
    16ba:	7942                	ld	s2,48(sp)
    16bc:	79a2                	ld	s3,40(sp)
    16be:	7a02                	ld	s4,32(sp)
    16c0:	6ae2                	ld	s5,24(sp)
    16c2:	6161                	addi	sp,sp,80
    16c4:	8082                	ret
      printf("%s: fork failed\n", s);
    16c6:	85d6                	mv	a1,s5
    16c8:	00004517          	auipc	a0,0x4
    16cc:	e8850513          	addi	a0,a0,-376 # 5550 <malloc+0x7ec>
    16d0:	00003097          	auipc	ra,0x3
    16d4:	5dc080e7          	jalr	1500(ra) # 4cac <printf>
      exit(1);
    16d8:	4505                	li	a0,1
    16da:	00003097          	auipc	ra,0x3
    16de:	22a080e7          	jalr	554(ra) # 4904 <exit>
        printf("%s: wait wrong pid\n", s);
    16e2:	85d6                	mv	a1,s5
    16e4:	00004517          	auipc	a0,0x4
    16e8:	ff450513          	addi	a0,a0,-12 # 56d8 <malloc+0x974>
    16ec:	00003097          	auipc	ra,0x3
    16f0:	5c0080e7          	jalr	1472(ra) # 4cac <printf>
        exit(1);
    16f4:	4505                	li	a0,1
    16f6:	00003097          	auipc	ra,0x3
    16fa:	20e080e7          	jalr	526(ra) # 4904 <exit>
        printf("%s: wait wrong exit status\n", s);
    16fe:	85d6                	mv	a1,s5
    1700:	00004517          	auipc	a0,0x4
    1704:	ff050513          	addi	a0,a0,-16 # 56f0 <malloc+0x98c>
    1708:	00003097          	auipc	ra,0x3
    170c:	5a4080e7          	jalr	1444(ra) # 4cac <printf>
        exit(1);
    1710:	4505                	li	a0,1
    1712:	00003097          	auipc	ra,0x3
    1716:	1f2080e7          	jalr	498(ra) # 4904 <exit>
      exit(i);
    171a:	854a                	mv	a0,s2
    171c:	00003097          	auipc	ra,0x3
    1720:	1e8080e7          	jalr	488(ra) # 4904 <exit>

0000000000001724 <twochildren>:
{
    1724:	1101                	addi	sp,sp,-32
    1726:	ec06                	sd	ra,24(sp)
    1728:	e822                	sd	s0,16(sp)
    172a:	e426                	sd	s1,8(sp)
    172c:	e04a                	sd	s2,0(sp)
    172e:	1000                	addi	s0,sp,32
    1730:	892a                	mv	s2,a0
    1732:	3e800493          	li	s1,1000
    int pid1 = fork();
    1736:	00003097          	auipc	ra,0x3
    173a:	1c6080e7          	jalr	454(ra) # 48fc <fork>
    if(pid1 < 0){
    173e:	02054c63          	bltz	a0,1776 <twochildren+0x52>
    if(pid1 == 0){
    1742:	c921                	beqz	a0,1792 <twochildren+0x6e>
      int pid2 = fork();
    1744:	00003097          	auipc	ra,0x3
    1748:	1b8080e7          	jalr	440(ra) # 48fc <fork>
      if(pid2 < 0){
    174c:	04054763          	bltz	a0,179a <twochildren+0x76>
      if(pid2 == 0){
    1750:	c13d                	beqz	a0,17b6 <twochildren+0x92>
        wait(0);
    1752:	4501                	li	a0,0
    1754:	00003097          	auipc	ra,0x3
    1758:	1ba080e7          	jalr	442(ra) # 490e <wait>
        wait(0);
    175c:	4501                	li	a0,0
    175e:	00003097          	auipc	ra,0x3
    1762:	1b0080e7          	jalr	432(ra) # 490e <wait>
  for(int i = 0; i < 1000; i++){
    1766:	34fd                	addiw	s1,s1,-1
    1768:	f4f9                	bnez	s1,1736 <twochildren+0x12>
}
    176a:	60e2                	ld	ra,24(sp)
    176c:	6442                	ld	s0,16(sp)
    176e:	64a2                	ld	s1,8(sp)
    1770:	6902                	ld	s2,0(sp)
    1772:	6105                	addi	sp,sp,32
    1774:	8082                	ret
      printf("%s: fork failed\n", s);
    1776:	85ca                	mv	a1,s2
    1778:	00004517          	auipc	a0,0x4
    177c:	dd850513          	addi	a0,a0,-552 # 5550 <malloc+0x7ec>
    1780:	00003097          	auipc	ra,0x3
    1784:	52c080e7          	jalr	1324(ra) # 4cac <printf>
      exit(1);
    1788:	4505                	li	a0,1
    178a:	00003097          	auipc	ra,0x3
    178e:	17a080e7          	jalr	378(ra) # 4904 <exit>
      exit(0);
    1792:	00003097          	auipc	ra,0x3
    1796:	172080e7          	jalr	370(ra) # 4904 <exit>
        printf("%s: fork failed\n", s);
    179a:	85ca                	mv	a1,s2
    179c:	00004517          	auipc	a0,0x4
    17a0:	db450513          	addi	a0,a0,-588 # 5550 <malloc+0x7ec>
    17a4:	00003097          	auipc	ra,0x3
    17a8:	508080e7          	jalr	1288(ra) # 4cac <printf>
        exit(1);
    17ac:	4505                	li	a0,1
    17ae:	00003097          	auipc	ra,0x3
    17b2:	156080e7          	jalr	342(ra) # 4904 <exit>
        exit(0);
    17b6:	00003097          	auipc	ra,0x3
    17ba:	14e080e7          	jalr	334(ra) # 4904 <exit>

00000000000017be <forkfork>:
{
    17be:	7179                	addi	sp,sp,-48
    17c0:	f406                	sd	ra,40(sp)
    17c2:	f022                	sd	s0,32(sp)
    17c4:	ec26                	sd	s1,24(sp)
    17c6:	1800                	addi	s0,sp,48
    17c8:	84aa                	mv	s1,a0
    int pid = fork();
    17ca:	00003097          	auipc	ra,0x3
    17ce:	132080e7          	jalr	306(ra) # 48fc <fork>
    if(pid < 0){
    17d2:	04054163          	bltz	a0,1814 <forkfork+0x56>
    if(pid == 0){
    17d6:	cd29                	beqz	a0,1830 <forkfork+0x72>
    int pid = fork();
    17d8:	00003097          	auipc	ra,0x3
    17dc:	124080e7          	jalr	292(ra) # 48fc <fork>
    if(pid < 0){
    17e0:	02054a63          	bltz	a0,1814 <forkfork+0x56>
    if(pid == 0){
    17e4:	c531                	beqz	a0,1830 <forkfork+0x72>
    wait(&xstatus);
    17e6:	fdc40513          	addi	a0,s0,-36
    17ea:	00003097          	auipc	ra,0x3
    17ee:	124080e7          	jalr	292(ra) # 490e <wait>
    if(xstatus != 0) {
    17f2:	fdc42783          	lw	a5,-36(s0)
    17f6:	ebbd                	bnez	a5,186c <forkfork+0xae>
    wait(&xstatus);
    17f8:	fdc40513          	addi	a0,s0,-36
    17fc:	00003097          	auipc	ra,0x3
    1800:	112080e7          	jalr	274(ra) # 490e <wait>
    if(xstatus != 0) {
    1804:	fdc42783          	lw	a5,-36(s0)
    1808:	e3b5                	bnez	a5,186c <forkfork+0xae>
}
    180a:	70a2                	ld	ra,40(sp)
    180c:	7402                	ld	s0,32(sp)
    180e:	64e2                	ld	s1,24(sp)
    1810:	6145                	addi	sp,sp,48
    1812:	8082                	ret
      printf("%s: fork failed", s);
    1814:	85a6                	mv	a1,s1
    1816:	00004517          	auipc	a0,0x4
    181a:	efa50513          	addi	a0,a0,-262 # 5710 <malloc+0x9ac>
    181e:	00003097          	auipc	ra,0x3
    1822:	48e080e7          	jalr	1166(ra) # 4cac <printf>
      exit(1);
    1826:	4505                	li	a0,1
    1828:	00003097          	auipc	ra,0x3
    182c:	0dc080e7          	jalr	220(ra) # 4904 <exit>
{
    1830:	0c800493          	li	s1,200
        int pid1 = fork();
    1834:	00003097          	auipc	ra,0x3
    1838:	0c8080e7          	jalr	200(ra) # 48fc <fork>
        if(pid1 < 0){
    183c:	00054f63          	bltz	a0,185a <forkfork+0x9c>
        if(pid1 == 0){
    1840:	c115                	beqz	a0,1864 <forkfork+0xa6>
        wait(0);
    1842:	4501                	li	a0,0
    1844:	00003097          	auipc	ra,0x3
    1848:	0ca080e7          	jalr	202(ra) # 490e <wait>
      for(int j = 0; j < 200; j++){
    184c:	34fd                	addiw	s1,s1,-1
    184e:	f0fd                	bnez	s1,1834 <forkfork+0x76>
      exit(0);
    1850:	4501                	li	a0,0
    1852:	00003097          	auipc	ra,0x3
    1856:	0b2080e7          	jalr	178(ra) # 4904 <exit>
          exit(1);
    185a:	4505                	li	a0,1
    185c:	00003097          	auipc	ra,0x3
    1860:	0a8080e7          	jalr	168(ra) # 4904 <exit>
          exit(0);
    1864:	00003097          	auipc	ra,0x3
    1868:	0a0080e7          	jalr	160(ra) # 4904 <exit>
      printf("%s: fork in child failed", s);
    186c:	85a6                	mv	a1,s1
    186e:	00004517          	auipc	a0,0x4
    1872:	eb250513          	addi	a0,a0,-334 # 5720 <malloc+0x9bc>
    1876:	00003097          	auipc	ra,0x3
    187a:	436080e7          	jalr	1078(ra) # 4cac <printf>
      exit(1);
    187e:	4505                	li	a0,1
    1880:	00003097          	auipc	ra,0x3
    1884:	084080e7          	jalr	132(ra) # 4904 <exit>

0000000000001888 <reparent2>:
{
    1888:	1101                	addi	sp,sp,-32
    188a:	ec06                	sd	ra,24(sp)
    188c:	e822                	sd	s0,16(sp)
    188e:	e426                	sd	s1,8(sp)
    1890:	1000                	addi	s0,sp,32
    1892:	32000493          	li	s1,800
    int pid1 = fork();
    1896:	00003097          	auipc	ra,0x3
    189a:	066080e7          	jalr	102(ra) # 48fc <fork>
    if(pid1 < 0){
    189e:	00054f63          	bltz	a0,18bc <reparent2+0x34>
    if(pid1 == 0){
    18a2:	c915                	beqz	a0,18d6 <reparent2+0x4e>
    wait(0);
    18a4:	4501                	li	a0,0
    18a6:	00003097          	auipc	ra,0x3
    18aa:	068080e7          	jalr	104(ra) # 490e <wait>
  for(int i = 0; i < 800; i++){
    18ae:	34fd                	addiw	s1,s1,-1
    18b0:	f0fd                	bnez	s1,1896 <reparent2+0xe>
  exit(0);
    18b2:	4501                	li	a0,0
    18b4:	00003097          	auipc	ra,0x3
    18b8:	050080e7          	jalr	80(ra) # 4904 <exit>
      printf("fork failed\n");
    18bc:	00004517          	auipc	a0,0x4
    18c0:	01450513          	addi	a0,a0,20 # 58d0 <malloc+0xb6c>
    18c4:	00003097          	auipc	ra,0x3
    18c8:	3e8080e7          	jalr	1000(ra) # 4cac <printf>
      exit(1);
    18cc:	4505                	li	a0,1
    18ce:	00003097          	auipc	ra,0x3
    18d2:	036080e7          	jalr	54(ra) # 4904 <exit>
      fork();
    18d6:	00003097          	auipc	ra,0x3
    18da:	026080e7          	jalr	38(ra) # 48fc <fork>
      fork();
    18de:	00003097          	auipc	ra,0x3
    18e2:	01e080e7          	jalr	30(ra) # 48fc <fork>
      exit(0);
    18e6:	4501                	li	a0,0
    18e8:	00003097          	auipc	ra,0x3
    18ec:	01c080e7          	jalr	28(ra) # 4904 <exit>

00000000000018f0 <forktest>:
{
    18f0:	7179                	addi	sp,sp,-48
    18f2:	f406                	sd	ra,40(sp)
    18f4:	f022                	sd	s0,32(sp)
    18f6:	ec26                	sd	s1,24(sp)
    18f8:	e84a                	sd	s2,16(sp)
    18fa:	e44e                	sd	s3,8(sp)
    18fc:	1800                	addi	s0,sp,48
    18fe:	89aa                	mv	s3,a0
  for(n=0; n<N; n++){
    1900:	4481                	li	s1,0
    1902:	3e800913          	li	s2,1000
    pid = fork();
    1906:	00003097          	auipc	ra,0x3
    190a:	ff6080e7          	jalr	-10(ra) # 48fc <fork>
    if(pid < 0)
    190e:	02054863          	bltz	a0,193e <forktest+0x4e>
    if(pid == 0)
    1912:	c115                	beqz	a0,1936 <forktest+0x46>
  for(n=0; n<N; n++){
    1914:	2485                	addiw	s1,s1,1
    1916:	ff2498e3          	bne	s1,s2,1906 <forktest+0x16>
    printf("%s: fork claimed to work 1000 times!\n", s);
    191a:	85ce                	mv	a1,s3
    191c:	00004517          	auipc	a0,0x4
    1920:	e3c50513          	addi	a0,a0,-452 # 5758 <malloc+0x9f4>
    1924:	00003097          	auipc	ra,0x3
    1928:	388080e7          	jalr	904(ra) # 4cac <printf>
    exit(1);
    192c:	4505                	li	a0,1
    192e:	00003097          	auipc	ra,0x3
    1932:	fd6080e7          	jalr	-42(ra) # 4904 <exit>
      exit(0);
    1936:	00003097          	auipc	ra,0x3
    193a:	fce080e7          	jalr	-50(ra) # 4904 <exit>
  if (n == 0) {
    193e:	cc9d                	beqz	s1,197c <forktest+0x8c>
  if(n == N){
    1940:	3e800793          	li	a5,1000
    1944:	fcf48be3          	beq	s1,a5,191a <forktest+0x2a>
  for(; n > 0; n--){
    1948:	00905b63          	blez	s1,195e <forktest+0x6e>
    if(wait(0) < 0){
    194c:	4501                	li	a0,0
    194e:	00003097          	auipc	ra,0x3
    1952:	fc0080e7          	jalr	-64(ra) # 490e <wait>
    1956:	04054163          	bltz	a0,1998 <forktest+0xa8>
  for(; n > 0; n--){
    195a:	34fd                	addiw	s1,s1,-1
    195c:	f8e5                	bnez	s1,194c <forktest+0x5c>
  if(wait(0) != -1){
    195e:	4501                	li	a0,0
    1960:	00003097          	auipc	ra,0x3
    1964:	fae080e7          	jalr	-82(ra) # 490e <wait>
    1968:	57fd                	li	a5,-1
    196a:	04f51563          	bne	a0,a5,19b4 <forktest+0xc4>
}
    196e:	70a2                	ld	ra,40(sp)
    1970:	7402                	ld	s0,32(sp)
    1972:	64e2                	ld	s1,24(sp)
    1974:	6942                	ld	s2,16(sp)
    1976:	69a2                	ld	s3,8(sp)
    1978:	6145                	addi	sp,sp,48
    197a:	8082                	ret
    printf("%s: no fork at all!\n", s);
    197c:	85ce                	mv	a1,s3
    197e:	00004517          	auipc	a0,0x4
    1982:	dc250513          	addi	a0,a0,-574 # 5740 <malloc+0x9dc>
    1986:	00003097          	auipc	ra,0x3
    198a:	326080e7          	jalr	806(ra) # 4cac <printf>
    exit(1);
    198e:	4505                	li	a0,1
    1990:	00003097          	auipc	ra,0x3
    1994:	f74080e7          	jalr	-140(ra) # 4904 <exit>
      printf("%s: wait stopped early\n", s);
    1998:	85ce                	mv	a1,s3
    199a:	00004517          	auipc	a0,0x4
    199e:	de650513          	addi	a0,a0,-538 # 5780 <malloc+0xa1c>
    19a2:	00003097          	auipc	ra,0x3
    19a6:	30a080e7          	jalr	778(ra) # 4cac <printf>
      exit(1);
    19aa:	4505                	li	a0,1
    19ac:	00003097          	auipc	ra,0x3
    19b0:	f58080e7          	jalr	-168(ra) # 4904 <exit>
    printf("%s: wait got too many\n", s);
    19b4:	85ce                	mv	a1,s3
    19b6:	00004517          	auipc	a0,0x4
    19ba:	de250513          	addi	a0,a0,-542 # 5798 <malloc+0xa34>
    19be:	00003097          	auipc	ra,0x3
    19c2:	2ee080e7          	jalr	750(ra) # 4cac <printf>
    exit(1);
    19c6:	4505                	li	a0,1
    19c8:	00003097          	auipc	ra,0x3
    19cc:	f3c080e7          	jalr	-196(ra) # 4904 <exit>

00000000000019d0 <kernmem>:
{
    19d0:	715d                	addi	sp,sp,-80
    19d2:	e486                	sd	ra,72(sp)
    19d4:	e0a2                	sd	s0,64(sp)
    19d6:	fc26                	sd	s1,56(sp)
    19d8:	f84a                	sd	s2,48(sp)
    19da:	f44e                	sd	s3,40(sp)
    19dc:	f052                	sd	s4,32(sp)
    19de:	ec56                	sd	s5,24(sp)
    19e0:	e85a                	sd	s6,16(sp)
    19e2:	0880                	addi	s0,sp,80
    19e4:	8b2a                	mv	s6,a0
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    19e6:	40100493          	li	s1,1025
    19ea:	04d6                	slli	s1,s1,0x15
    wait(&xstatus);
    19ec:	fbc40a93          	addi	s5,s0,-68
    if(xstatus != -1)  // did kernel kill child?
    19f0:	5a7d                	li	s4,-1
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    19f2:	69b1                	lui	s3,0xc
    19f4:	35098993          	addi	s3,s3,848 # c350 <__BSS_END__+0x2c0>
    19f8:	1007d937          	lui	s2,0x1007d
    19fc:	090e                	slli	s2,s2,0x3
    19fe:	48090913          	addi	s2,s2,1152 # 1007d480 <__BSS_END__+0x100713f0>
    pid = fork();
    1a02:	00003097          	auipc	ra,0x3
    1a06:	efa080e7          	jalr	-262(ra) # 48fc <fork>
    if(pid < 0){
    1a0a:	02054963          	bltz	a0,1a3c <kernmem+0x6c>
    if(pid == 0){
    1a0e:	c529                	beqz	a0,1a58 <kernmem+0x88>
    wait(&xstatus);
    1a10:	8556                	mv	a0,s5
    1a12:	00003097          	auipc	ra,0x3
    1a16:	efc080e7          	jalr	-260(ra) # 490e <wait>
    if(xstatus != -1)  // did kernel kill child?
    1a1a:	fbc42783          	lw	a5,-68(s0)
    1a1e:	05479d63          	bne	a5,s4,1a78 <kernmem+0xa8>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    1a22:	94ce                	add	s1,s1,s3
    1a24:	fd249fe3          	bne	s1,s2,1a02 <kernmem+0x32>
}
    1a28:	60a6                	ld	ra,72(sp)
    1a2a:	6406                	ld	s0,64(sp)
    1a2c:	74e2                	ld	s1,56(sp)
    1a2e:	7942                	ld	s2,48(sp)
    1a30:	79a2                	ld	s3,40(sp)
    1a32:	7a02                	ld	s4,32(sp)
    1a34:	6ae2                	ld	s5,24(sp)
    1a36:	6b42                	ld	s6,16(sp)
    1a38:	6161                	addi	sp,sp,80
    1a3a:	8082                	ret
      printf("%s: fork failed\n", s);
    1a3c:	85da                	mv	a1,s6
    1a3e:	00004517          	auipc	a0,0x4
    1a42:	b1250513          	addi	a0,a0,-1262 # 5550 <malloc+0x7ec>
    1a46:	00003097          	auipc	ra,0x3
    1a4a:	266080e7          	jalr	614(ra) # 4cac <printf>
      exit(1);
    1a4e:	4505                	li	a0,1
    1a50:	00003097          	auipc	ra,0x3
    1a54:	eb4080e7          	jalr	-332(ra) # 4904 <exit>
      printf("%s: oops could read %x = %x\n", a, *a);
    1a58:	0004c603          	lbu	a2,0(s1)
    1a5c:	85a6                	mv	a1,s1
    1a5e:	00004517          	auipc	a0,0x4
    1a62:	d5250513          	addi	a0,a0,-686 # 57b0 <malloc+0xa4c>
    1a66:	00003097          	auipc	ra,0x3
    1a6a:	246080e7          	jalr	582(ra) # 4cac <printf>
      exit(1);
    1a6e:	4505                	li	a0,1
    1a70:	00003097          	auipc	ra,0x3
    1a74:	e94080e7          	jalr	-364(ra) # 4904 <exit>
      exit(1);
    1a78:	4505                	li	a0,1
    1a7a:	00003097          	auipc	ra,0x3
    1a7e:	e8a080e7          	jalr	-374(ra) # 4904 <exit>

0000000000001a82 <bigargtest>:
{
    1a82:	7179                	addi	sp,sp,-48
    1a84:	f406                	sd	ra,40(sp)
    1a86:	f022                	sd	s0,32(sp)
    1a88:	ec26                	sd	s1,24(sp)
    1a8a:	1800                	addi	s0,sp,48
    1a8c:	84aa                	mv	s1,a0
  remove("bigarg-ok");
    1a8e:	00004517          	auipc	a0,0x4
    1a92:	d4250513          	addi	a0,a0,-702 # 57d0 <malloc+0xa6c>
    1a96:	00003097          	auipc	ra,0x3
    1a9a:	f1e080e7          	jalr	-226(ra) # 49b4 <remove>
  pid = fork();
    1a9e:	00003097          	auipc	ra,0x3
    1aa2:	e5e080e7          	jalr	-418(ra) # 48fc <fork>
  if(pid == 0){
    1aa6:	c921                	beqz	a0,1af6 <bigargtest+0x74>
  } else if(pid < 0){
    1aa8:	0a054a63          	bltz	a0,1b5c <bigargtest+0xda>
  wait(&xstatus);
    1aac:	fdc40513          	addi	a0,s0,-36
    1ab0:	00003097          	auipc	ra,0x3
    1ab4:	e5e080e7          	jalr	-418(ra) # 490e <wait>
  if(xstatus != 0)
    1ab8:	fdc42503          	lw	a0,-36(s0)
    1abc:	ed55                	bnez	a0,1b78 <bigargtest+0xf6>
  fd = open("bigarg-ok", 0);
    1abe:	4581                	li	a1,0
    1ac0:	00004517          	auipc	a0,0x4
    1ac4:	d1050513          	addi	a0,a0,-752 # 57d0 <malloc+0xa6c>
    1ac8:	00003097          	auipc	ra,0x3
    1acc:	e82080e7          	jalr	-382(ra) # 494a <open>
  if(fd < 0){
    1ad0:	0a054863          	bltz	a0,1b80 <bigargtest+0xfe>
  close(fd);
    1ad4:	00003097          	auipc	ra,0x3
    1ad8:	e5c080e7          	jalr	-420(ra) # 4930 <close>
  remove("bigarg-ok");
    1adc:	00004517          	auipc	a0,0x4
    1ae0:	cf450513          	addi	a0,a0,-780 # 57d0 <malloc+0xa6c>
    1ae4:	00003097          	auipc	ra,0x3
    1ae8:	ed0080e7          	jalr	-304(ra) # 49b4 <remove>
}
    1aec:	70a2                	ld	ra,40(sp)
    1aee:	7402                	ld	s0,32(sp)
    1af0:	64e2                	ld	s1,24(sp)
    1af2:	6145                	addi	sp,sp,48
    1af4:	8082                	ret
    1af6:	00005797          	auipc	a5,0x5
    1afa:	56a78793          	addi	a5,a5,1386 # 7060 <args.1>
    1afe:	00005697          	auipc	a3,0x5
    1b02:	65a68693          	addi	a3,a3,1626 # 7158 <args.1+0xf8>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    1b06:	00004717          	auipc	a4,0x4
    1b0a:	cda70713          	addi	a4,a4,-806 # 57e0 <malloc+0xa7c>
    1b0e:	e398                	sd	a4,0(a5)
    for(i = 0; i < MAXARG-1; i++)
    1b10:	07a1                	addi	a5,a5,8
    1b12:	fed79ee3          	bne	a5,a3,1b0e <bigargtest+0x8c>
    args[MAXARG-1] = 0;
    1b16:	00005797          	auipc	a5,0x5
    1b1a:	6407b123          	sd	zero,1602(a5) # 7158 <args.1+0xf8>
    exec("echo", args);
    1b1e:	00005597          	auipc	a1,0x5
    1b22:	54258593          	addi	a1,a1,1346 # 7060 <args.1>
    1b26:	00003517          	auipc	a0,0x3
    1b2a:	39a50513          	addi	a0,a0,922 # 4ec0 <malloc+0x15c>
    1b2e:	00003097          	auipc	ra,0x3
    1b32:	e12080e7          	jalr	-494(ra) # 4940 <exec>
    fd = open("bigarg-ok", O_CREATE);
    1b36:	20000593          	li	a1,512
    1b3a:	00004517          	auipc	a0,0x4
    1b3e:	c9650513          	addi	a0,a0,-874 # 57d0 <malloc+0xa6c>
    1b42:	00003097          	auipc	ra,0x3
    1b46:	e08080e7          	jalr	-504(ra) # 494a <open>
    close(fd);
    1b4a:	00003097          	auipc	ra,0x3
    1b4e:	de6080e7          	jalr	-538(ra) # 4930 <close>
    exit(0);
    1b52:	4501                	li	a0,0
    1b54:	00003097          	auipc	ra,0x3
    1b58:	db0080e7          	jalr	-592(ra) # 4904 <exit>
    printf("%s: bigargtest: fork failed\n", s);
    1b5c:	85a6                	mv	a1,s1
    1b5e:	00004517          	auipc	a0,0x4
    1b62:	d6250513          	addi	a0,a0,-670 # 58c0 <malloc+0xb5c>
    1b66:	00003097          	auipc	ra,0x3
    1b6a:	146080e7          	jalr	326(ra) # 4cac <printf>
    exit(1);
    1b6e:	4505                	li	a0,1
    1b70:	00003097          	auipc	ra,0x3
    1b74:	d94080e7          	jalr	-620(ra) # 4904 <exit>
    exit(xstatus);
    1b78:	00003097          	auipc	ra,0x3
    1b7c:	d8c080e7          	jalr	-628(ra) # 4904 <exit>
    printf("%s: bigarg test failed!\n", s);
    1b80:	85a6                	mv	a1,s1
    1b82:	00004517          	auipc	a0,0x4
    1b86:	d5e50513          	addi	a0,a0,-674 # 58e0 <malloc+0xb7c>
    1b8a:	00003097          	auipc	ra,0x3
    1b8e:	122080e7          	jalr	290(ra) # 4cac <printf>
    exit(1);
    1b92:	4505                	li	a0,1
    1b94:	00003097          	auipc	ra,0x3
    1b98:	d70080e7          	jalr	-656(ra) # 4904 <exit>

0000000000001b9c <stacktest>:
{
    1b9c:	7179                	addi	sp,sp,-48
    1b9e:	f406                	sd	ra,40(sp)
    1ba0:	f022                	sd	s0,32(sp)
    1ba2:	ec26                	sd	s1,24(sp)
    1ba4:	1800                	addi	s0,sp,48
    1ba6:	84aa                	mv	s1,a0
  pid = fork();
    1ba8:	00003097          	auipc	ra,0x3
    1bac:	d54080e7          	jalr	-684(ra) # 48fc <fork>
  if(pid == 0) {
    1bb0:	c115                	beqz	a0,1bd4 <stacktest+0x38>
  } else if(pid < 0){
    1bb2:	04054363          	bltz	a0,1bf8 <stacktest+0x5c>
  wait(&xstatus);
    1bb6:	fdc40513          	addi	a0,s0,-36
    1bba:	00003097          	auipc	ra,0x3
    1bbe:	d54080e7          	jalr	-684(ra) # 490e <wait>
  if(xstatus == -1)  // kernel killed child?
    1bc2:	fdc42503          	lw	a0,-36(s0)
    1bc6:	57fd                	li	a5,-1
    1bc8:	04f50663          	beq	a0,a5,1c14 <stacktest+0x78>
    exit(xstatus);
    1bcc:	00003097          	auipc	ra,0x3
    1bd0:	d38080e7          	jalr	-712(ra) # 4904 <exit>

static inline uint64
r_sp()
{
  uint64 x;
  asm volatile("mv %0, sp" : "=r" (x) );
    1bd4:	870a                	mv	a4,sp
    printf("%s: stacktest: read below stack %p\n", *sp);
    1bd6:	77fd                	lui	a5,0xfffff
    1bd8:	97ba                	add	a5,a5,a4
    1bda:	0007c583          	lbu	a1,0(a5) # fffffffffffff000 <__BSS_END__+0xffffffffffff2f70>
    1bde:	00004517          	auipc	a0,0x4
    1be2:	d2250513          	addi	a0,a0,-734 # 5900 <malloc+0xb9c>
    1be6:	00003097          	auipc	ra,0x3
    1bea:	0c6080e7          	jalr	198(ra) # 4cac <printf>
    exit(1);
    1bee:	4505                	li	a0,1
    1bf0:	00003097          	auipc	ra,0x3
    1bf4:	d14080e7          	jalr	-748(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    1bf8:	85a6                	mv	a1,s1
    1bfa:	00004517          	auipc	a0,0x4
    1bfe:	95650513          	addi	a0,a0,-1706 # 5550 <malloc+0x7ec>
    1c02:	00003097          	auipc	ra,0x3
    1c06:	0aa080e7          	jalr	170(ra) # 4cac <printf>
    exit(1);
    1c0a:	4505                	li	a0,1
    1c0c:	00003097          	auipc	ra,0x3
    1c10:	cf8080e7          	jalr	-776(ra) # 4904 <exit>
    exit(0);
    1c14:	4501                	li	a0,0
    1c16:	00003097          	auipc	ra,0x3
    1c1a:	cee080e7          	jalr	-786(ra) # 4904 <exit>

0000000000001c1e <copyinstr3>:
{
    1c1e:	7179                	addi	sp,sp,-48
    1c20:	f406                	sd	ra,40(sp)
    1c22:	f022                	sd	s0,32(sp)
    1c24:	ec26                	sd	s1,24(sp)
    1c26:	1800                	addi	s0,sp,48
  sbrk(8192);
    1c28:	6509                	lui	a0,0x2
    1c2a:	00003097          	auipc	ra,0x3
    1c2e:	d52080e7          	jalr	-686(ra) # 497c <sbrk>
  uint64 top = (uint64) sbrk(0);
    1c32:	4501                	li	a0,0
    1c34:	00003097          	auipc	ra,0x3
    1c38:	d48080e7          	jalr	-696(ra) # 497c <sbrk>
  if((top % PGSIZE) != 0){
    1c3c:	03451793          	slli	a5,a0,0x34
    1c40:	eba5                	bnez	a5,1cb0 <copyinstr3+0x92>
  top = (uint64) sbrk(0);
    1c42:	4501                	li	a0,0
    1c44:	00003097          	auipc	ra,0x3
    1c48:	d38080e7          	jalr	-712(ra) # 497c <sbrk>
  if(top % PGSIZE){
    1c4c:	03451793          	slli	a5,a0,0x34
    1c50:	ebb5                	bnez	a5,1cc4 <copyinstr3+0xa6>
  char *b = (char *) (top - 1);
    1c52:	fff50493          	addi	s1,a0,-1 # 1fff <sbrkmuch+0x143>
  *b = 'x';
    1c56:	07800793          	li	a5,120
    1c5a:	fef50fa3          	sb	a5,-1(a0)
  int ret = remove(b);
    1c5e:	8526                	mv	a0,s1
    1c60:	00003097          	auipc	ra,0x3
    1c64:	d54080e7          	jalr	-684(ra) # 49b4 <remove>
  if(ret != -1){
    1c68:	57fd                	li	a5,-1
    1c6a:	06f51a63          	bne	a0,a5,1cde <copyinstr3+0xc0>
  int fd = open(b, O_CREATE | O_WRONLY);
    1c6e:	20100593          	li	a1,513
    1c72:	8526                	mv	a0,s1
    1c74:	00003097          	auipc	ra,0x3
    1c78:	cd6080e7          	jalr	-810(ra) # 494a <open>
  if(fd != -1){
    1c7c:	57fd                	li	a5,-1
    1c7e:	06f51f63          	bne	a0,a5,1cfc <copyinstr3+0xde>
  char *args[] = { "xx", 0 };
    1c82:	00004797          	auipc	a5,0x4
    1c86:	42e78793          	addi	a5,a5,1070 # 60b0 <malloc+0x134c>
    1c8a:	fcf43823          	sd	a5,-48(s0)
    1c8e:	fc043c23          	sd	zero,-40(s0)
  ret = exec(b, args);
    1c92:	fd040593          	addi	a1,s0,-48
    1c96:	8526                	mv	a0,s1
    1c98:	00003097          	auipc	ra,0x3
    1c9c:	ca8080e7          	jalr	-856(ra) # 4940 <exec>
  if(ret != -1){
    1ca0:	57fd                	li	a5,-1
    1ca2:	06f51c63          	bne	a0,a5,1d1a <copyinstr3+0xfc>
}
    1ca6:	70a2                	ld	ra,40(sp)
    1ca8:	7402                	ld	s0,32(sp)
    1caa:	64e2                	ld	s1,24(sp)
    1cac:	6145                	addi	sp,sp,48
    1cae:	8082                	ret
    sbrk(PGSIZE - (top % PGSIZE));
    1cb0:	0347d513          	srli	a0,a5,0x34
    1cb4:	6785                	lui	a5,0x1
    1cb6:	40a7853b          	subw	a0,a5,a0
    1cba:	00003097          	auipc	ra,0x3
    1cbe:	cc2080e7          	jalr	-830(ra) # 497c <sbrk>
    1cc2:	b741                	j	1c42 <copyinstr3+0x24>
    printf("oops\n");
    1cc4:	00004517          	auipc	a0,0x4
    1cc8:	c6450513          	addi	a0,a0,-924 # 5928 <malloc+0xbc4>
    1ccc:	00003097          	auipc	ra,0x3
    1cd0:	fe0080e7          	jalr	-32(ra) # 4cac <printf>
    exit(1);
    1cd4:	4505                	li	a0,1
    1cd6:	00003097          	auipc	ra,0x3
    1cda:	c2e080e7          	jalr	-978(ra) # 4904 <exit>
    printf("remove(%s) returned %d, not -1\n", b, ret);
    1cde:	862a                	mv	a2,a0
    1ce0:	85a6                	mv	a1,s1
    1ce2:	00003517          	auipc	a0,0x3
    1ce6:	7b650513          	addi	a0,a0,1974 # 5498 <malloc+0x734>
    1cea:	00003097          	auipc	ra,0x3
    1cee:	fc2080e7          	jalr	-62(ra) # 4cac <printf>
    exit(1);
    1cf2:	4505                	li	a0,1
    1cf4:	00003097          	auipc	ra,0x3
    1cf8:	c10080e7          	jalr	-1008(ra) # 4904 <exit>
    printf("open(%s) returned %d, not -1\n", b, fd);
    1cfc:	862a                	mv	a2,a0
    1cfe:	85a6                	mv	a1,s1
    1d00:	00003517          	auipc	a0,0x3
    1d04:	7b850513          	addi	a0,a0,1976 # 54b8 <malloc+0x754>
    1d08:	00003097          	auipc	ra,0x3
    1d0c:	fa4080e7          	jalr	-92(ra) # 4cac <printf>
    exit(1);
    1d10:	4505                	li	a0,1
    1d12:	00003097          	auipc	ra,0x3
    1d16:	bf2080e7          	jalr	-1038(ra) # 4904 <exit>
    printf("exec(%s) returned %d, not -1\n", b, fd);
    1d1a:	567d                	li	a2,-1
    1d1c:	85a6                	mv	a1,s1
    1d1e:	00003517          	auipc	a0,0x3
    1d22:	7ba50513          	addi	a0,a0,1978 # 54d8 <malloc+0x774>
    1d26:	00003097          	auipc	ra,0x3
    1d2a:	f86080e7          	jalr	-122(ra) # 4cac <printf>
    exit(1);
    1d2e:	4505                	li	a0,1
    1d30:	00003097          	auipc	ra,0x3
    1d34:	bd4080e7          	jalr	-1068(ra) # 4904 <exit>

0000000000001d38 <sbrkbasic>:
{
    1d38:	7139                	addi	sp,sp,-64
    1d3a:	fc06                	sd	ra,56(sp)
    1d3c:	f822                	sd	s0,48(sp)
    1d3e:	f426                	sd	s1,40(sp)
    1d40:	f04a                	sd	s2,32(sp)
    1d42:	ec4e                	sd	s3,24(sp)
    1d44:	e852                	sd	s4,16(sp)
    1d46:	0080                	addi	s0,sp,64
    1d48:	8a2a                	mv	s4,a0
  pid = fork();
    1d4a:	00003097          	auipc	ra,0x3
    1d4e:	bb2080e7          	jalr	-1102(ra) # 48fc <fork>
  if(pid < 0){
    1d52:	02054c63          	bltz	a0,1d8a <sbrkbasic+0x52>
  if(pid == 0){
    1d56:	ed21                	bnez	a0,1dae <sbrkbasic+0x76>
    a = sbrk(TOOMUCH);
    1d58:	40000537          	lui	a0,0x40000
    1d5c:	00003097          	auipc	ra,0x3
    1d60:	c20080e7          	jalr	-992(ra) # 497c <sbrk>
    if(a == (char*)0xffffffffffffffffL){
    1d64:	57fd                	li	a5,-1
    1d66:	02f50f63          	beq	a0,a5,1da4 <sbrkbasic+0x6c>
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d6a:	400007b7          	lui	a5,0x40000
    1d6e:	97aa                	add	a5,a5,a0
      *b = 99;
    1d70:	06300693          	li	a3,99
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d74:	6705                	lui	a4,0x1
      *b = 99;
    1d76:	00d50023          	sb	a3,0(a0) # 40000000 <__BSS_END__+0x3fff3f70>
    for(b = a; b < a+TOOMUCH; b += 4096){
    1d7a:	953a                	add	a0,a0,a4
    1d7c:	fef51de3          	bne	a0,a5,1d76 <sbrkbasic+0x3e>
    exit(1);
    1d80:	4505                	li	a0,1
    1d82:	00003097          	auipc	ra,0x3
    1d86:	b82080e7          	jalr	-1150(ra) # 4904 <exit>
    printf("fork failed in sbrkbasic\n");
    1d8a:	00004517          	auipc	a0,0x4
    1d8e:	ba650513          	addi	a0,a0,-1114 # 5930 <malloc+0xbcc>
    1d92:	00003097          	auipc	ra,0x3
    1d96:	f1a080e7          	jalr	-230(ra) # 4cac <printf>
    exit(1);
    1d9a:	4505                	li	a0,1
    1d9c:	00003097          	auipc	ra,0x3
    1da0:	b68080e7          	jalr	-1176(ra) # 4904 <exit>
      exit(0);
    1da4:	4501                	li	a0,0
    1da6:	00003097          	auipc	ra,0x3
    1daa:	b5e080e7          	jalr	-1186(ra) # 4904 <exit>
  wait(&xstatus);
    1dae:	fcc40513          	addi	a0,s0,-52
    1db2:	00003097          	auipc	ra,0x3
    1db6:	b5c080e7          	jalr	-1188(ra) # 490e <wait>
  if(xstatus == 1){
    1dba:	fcc42703          	lw	a4,-52(s0)
    1dbe:	4785                	li	a5,1
    1dc0:	00f70d63          	beq	a4,a5,1dda <sbrkbasic+0xa2>
  a = sbrk(0);
    1dc4:	4501                	li	a0,0
    1dc6:	00003097          	auipc	ra,0x3
    1dca:	bb6080e7          	jalr	-1098(ra) # 497c <sbrk>
    1dce:	84aa                	mv	s1,a0
  for(i = 0; i < 5000; i++){
    1dd0:	4901                	li	s2,0
    1dd2:	6985                	lui	s3,0x1
    1dd4:	38898993          	addi	s3,s3,904 # 1388 <exectest+0xc8>
    1dd8:	a005                	j	1df8 <sbrkbasic+0xc0>
    printf("%s: too much memory allocated!\n", s);
    1dda:	85d2                	mv	a1,s4
    1ddc:	00004517          	auipc	a0,0x4
    1de0:	b7450513          	addi	a0,a0,-1164 # 5950 <malloc+0xbec>
    1de4:	00003097          	auipc	ra,0x3
    1de8:	ec8080e7          	jalr	-312(ra) # 4cac <printf>
    exit(1);
    1dec:	4505                	li	a0,1
    1dee:	00003097          	auipc	ra,0x3
    1df2:	b16080e7          	jalr	-1258(ra) # 4904 <exit>
    a = b + 1;
    1df6:	84be                	mv	s1,a5
    b = sbrk(1);
    1df8:	4505                	li	a0,1
    1dfa:	00003097          	auipc	ra,0x3
    1dfe:	b82080e7          	jalr	-1150(ra) # 497c <sbrk>
    if(b != a){
    1e02:	04951c63          	bne	a0,s1,1e5a <sbrkbasic+0x122>
    *b = 1;
    1e06:	4785                	li	a5,1
    1e08:	00f48023          	sb	a5,0(s1)
    a = b + 1;
    1e0c:	00148793          	addi	a5,s1,1
  for(i = 0; i < 5000; i++){
    1e10:	2905                	addiw	s2,s2,1
    1e12:	ff3912e3          	bne	s2,s3,1df6 <sbrkbasic+0xbe>
  pid = fork();
    1e16:	00003097          	auipc	ra,0x3
    1e1a:	ae6080e7          	jalr	-1306(ra) # 48fc <fork>
    1e1e:	892a                	mv	s2,a0
  if(pid < 0){
    1e20:	04054d63          	bltz	a0,1e7a <sbrkbasic+0x142>
  c = sbrk(1);
    1e24:	4505                	li	a0,1
    1e26:	00003097          	auipc	ra,0x3
    1e2a:	b56080e7          	jalr	-1194(ra) # 497c <sbrk>
  c = sbrk(1);
    1e2e:	4505                	li	a0,1
    1e30:	00003097          	auipc	ra,0x3
    1e34:	b4c080e7          	jalr	-1204(ra) # 497c <sbrk>
  if(c != a + 1){
    1e38:	0489                	addi	s1,s1,2
    1e3a:	04a48e63          	beq	s1,a0,1e96 <sbrkbasic+0x15e>
    printf("%s: sbrk test failed post-fork\n", s);
    1e3e:	85d2                	mv	a1,s4
    1e40:	00004517          	auipc	a0,0x4
    1e44:	b7050513          	addi	a0,a0,-1168 # 59b0 <malloc+0xc4c>
    1e48:	00003097          	auipc	ra,0x3
    1e4c:	e64080e7          	jalr	-412(ra) # 4cac <printf>
    exit(1);
    1e50:	4505                	li	a0,1
    1e52:	00003097          	auipc	ra,0x3
    1e56:	ab2080e7          	jalr	-1358(ra) # 4904 <exit>
      printf("%s: sbrk test failed %d %x %x\n", i, a, b);
    1e5a:	86aa                	mv	a3,a0
    1e5c:	8626                	mv	a2,s1
    1e5e:	85ca                	mv	a1,s2
    1e60:	00004517          	auipc	a0,0x4
    1e64:	b1050513          	addi	a0,a0,-1264 # 5970 <malloc+0xc0c>
    1e68:	00003097          	auipc	ra,0x3
    1e6c:	e44080e7          	jalr	-444(ra) # 4cac <printf>
      exit(1);
    1e70:	4505                	li	a0,1
    1e72:	00003097          	auipc	ra,0x3
    1e76:	a92080e7          	jalr	-1390(ra) # 4904 <exit>
    printf("%s: sbrk test fork failed\n", s);
    1e7a:	85d2                	mv	a1,s4
    1e7c:	00004517          	auipc	a0,0x4
    1e80:	b1450513          	addi	a0,a0,-1260 # 5990 <malloc+0xc2c>
    1e84:	00003097          	auipc	ra,0x3
    1e88:	e28080e7          	jalr	-472(ra) # 4cac <printf>
    exit(1);
    1e8c:	4505                	li	a0,1
    1e8e:	00003097          	auipc	ra,0x3
    1e92:	a76080e7          	jalr	-1418(ra) # 4904 <exit>
  if(pid == 0)
    1e96:	00091763          	bnez	s2,1ea4 <sbrkbasic+0x16c>
    exit(0);
    1e9a:	4501                	li	a0,0
    1e9c:	00003097          	auipc	ra,0x3
    1ea0:	a68080e7          	jalr	-1432(ra) # 4904 <exit>
  wait(&xstatus);
    1ea4:	fcc40513          	addi	a0,s0,-52
    1ea8:	00003097          	auipc	ra,0x3
    1eac:	a66080e7          	jalr	-1434(ra) # 490e <wait>
  exit(xstatus);
    1eb0:	fcc42503          	lw	a0,-52(s0)
    1eb4:	00003097          	auipc	ra,0x3
    1eb8:	a50080e7          	jalr	-1456(ra) # 4904 <exit>

0000000000001ebc <sbrkmuch>:
{
    1ebc:	7179                	addi	sp,sp,-48
    1ebe:	f406                	sd	ra,40(sp)
    1ec0:	f022                	sd	s0,32(sp)
    1ec2:	ec26                	sd	s1,24(sp)
    1ec4:	e84a                	sd	s2,16(sp)
    1ec6:	e44e                	sd	s3,8(sp)
    1ec8:	e052                	sd	s4,0(sp)
    1eca:	1800                	addi	s0,sp,48
    1ecc:	89aa                	mv	s3,a0
  oldbrk = sbrk(0);
    1ece:	4501                	li	a0,0
    1ed0:	00003097          	auipc	ra,0x3
    1ed4:	aac080e7          	jalr	-1364(ra) # 497c <sbrk>
    1ed8:	892a                	mv	s2,a0
  a = sbrk(0);
    1eda:	4501                	li	a0,0
    1edc:	00003097          	auipc	ra,0x3
    1ee0:	aa0080e7          	jalr	-1376(ra) # 497c <sbrk>
    1ee4:	84aa                	mv	s1,a0
  p = sbrk(amt);
    1ee6:	00300537          	lui	a0,0x300
    1eea:	9d05                	subw	a0,a0,s1
    1eec:	00003097          	auipc	ra,0x3
    1ef0:	a90080e7          	jalr	-1392(ra) # 497c <sbrk>
  if (p != a) {
    1ef4:	0ca49863          	bne	s1,a0,1fc4 <sbrkmuch+0x108>
  char *eee = sbrk(0);
    1ef8:	4501                	li	a0,0
    1efa:	00003097          	auipc	ra,0x3
    1efe:	a82080e7          	jalr	-1406(ra) # 497c <sbrk>
    1f02:	87aa                	mv	a5,a0
  for(char *pp = a; pp < eee; pp += 4096)
    1f04:	00a4f963          	bgeu	s1,a0,1f16 <sbrkmuch+0x5a>
    *pp = 1;
    1f08:	4685                	li	a3,1
  for(char *pp = a; pp < eee; pp += 4096)
    1f0a:	6705                	lui	a4,0x1
    *pp = 1;
    1f0c:	00d48023          	sb	a3,0(s1)
  for(char *pp = a; pp < eee; pp += 4096)
    1f10:	94ba                	add	s1,s1,a4
    1f12:	fef4ede3          	bltu	s1,a5,1f0c <sbrkmuch+0x50>
  *lastaddr = 99;
    1f16:	003007b7          	lui	a5,0x300
    1f1a:	06300713          	li	a4,99
    1f1e:	fee78fa3          	sb	a4,-1(a5) # 2fffff <__BSS_END__+0x2f3f6f>
  a = sbrk(0);
    1f22:	4501                	li	a0,0
    1f24:	00003097          	auipc	ra,0x3
    1f28:	a58080e7          	jalr	-1448(ra) # 497c <sbrk>
    1f2c:	84aa                	mv	s1,a0
  c = sbrk(-PGSIZE);
    1f2e:	757d                	lui	a0,0xfffff
    1f30:	00003097          	auipc	ra,0x3
    1f34:	a4c080e7          	jalr	-1460(ra) # 497c <sbrk>
  if(c == (char*)0xffffffffffffffffL){
    1f38:	57fd                	li	a5,-1
    1f3a:	0af50363          	beq	a0,a5,1fe0 <sbrkmuch+0x124>
  c = sbrk(0);
    1f3e:	4501                	li	a0,0
    1f40:	00003097          	auipc	ra,0x3
    1f44:	a3c080e7          	jalr	-1476(ra) # 497c <sbrk>
  if(c != a - PGSIZE){
    1f48:	77fd                	lui	a5,0xfffff
    1f4a:	97a6                	add	a5,a5,s1
    1f4c:	0af51863          	bne	a0,a5,1ffc <sbrkmuch+0x140>
  a = sbrk(0);
    1f50:	4501                	li	a0,0
    1f52:	00003097          	auipc	ra,0x3
    1f56:	a2a080e7          	jalr	-1494(ra) # 497c <sbrk>
    1f5a:	84aa                	mv	s1,a0
  c = sbrk(PGSIZE);
    1f5c:	6505                	lui	a0,0x1
    1f5e:	00003097          	auipc	ra,0x3
    1f62:	a1e080e7          	jalr	-1506(ra) # 497c <sbrk>
    1f66:	8a2a                	mv	s4,a0
  if(c != a || sbrk(0) != a + PGSIZE){
    1f68:	0aa49963          	bne	s1,a0,201a <sbrkmuch+0x15e>
    1f6c:	4501                	li	a0,0
    1f6e:	00003097          	auipc	ra,0x3
    1f72:	a0e080e7          	jalr	-1522(ra) # 497c <sbrk>
    1f76:	6785                	lui	a5,0x1
    1f78:	97a6                	add	a5,a5,s1
    1f7a:	0af51063          	bne	a0,a5,201a <sbrkmuch+0x15e>
  if(*lastaddr == 99){
    1f7e:	003007b7          	lui	a5,0x300
    1f82:	fff7c703          	lbu	a4,-1(a5) # 2fffff <__BSS_END__+0x2f3f6f>
    1f86:	06300793          	li	a5,99
    1f8a:	0af70763          	beq	a4,a5,2038 <sbrkmuch+0x17c>
  a = sbrk(0);
    1f8e:	4501                	li	a0,0
    1f90:	00003097          	auipc	ra,0x3
    1f94:	9ec080e7          	jalr	-1556(ra) # 497c <sbrk>
    1f98:	84aa                	mv	s1,a0
  c = sbrk(-(sbrk(0) - oldbrk));
    1f9a:	4501                	li	a0,0
    1f9c:	00003097          	auipc	ra,0x3
    1fa0:	9e0080e7          	jalr	-1568(ra) # 497c <sbrk>
    1fa4:	40a9053b          	subw	a0,s2,a0
    1fa8:	00003097          	auipc	ra,0x3
    1fac:	9d4080e7          	jalr	-1580(ra) # 497c <sbrk>
  if(c != a){
    1fb0:	0aa49263          	bne	s1,a0,2054 <sbrkmuch+0x198>
}
    1fb4:	70a2                	ld	ra,40(sp)
    1fb6:	7402                	ld	s0,32(sp)
    1fb8:	64e2                	ld	s1,24(sp)
    1fba:	6942                	ld	s2,16(sp)
    1fbc:	69a2                	ld	s3,8(sp)
    1fbe:	6a02                	ld	s4,0(sp)
    1fc0:	6145                	addi	sp,sp,48
    1fc2:	8082                	ret
    printf("%s: sbrk test failed to grow big address space; enough phys mem?\n", s);
    1fc4:	85ce                	mv	a1,s3
    1fc6:	00004517          	auipc	a0,0x4
    1fca:	a0a50513          	addi	a0,a0,-1526 # 59d0 <malloc+0xc6c>
    1fce:	00003097          	auipc	ra,0x3
    1fd2:	cde080e7          	jalr	-802(ra) # 4cac <printf>
    exit(1);
    1fd6:	4505                	li	a0,1
    1fd8:	00003097          	auipc	ra,0x3
    1fdc:	92c080e7          	jalr	-1748(ra) # 4904 <exit>
    printf("%s: sbrk could not deallocate\n", s);
    1fe0:	85ce                	mv	a1,s3
    1fe2:	00004517          	auipc	a0,0x4
    1fe6:	a3650513          	addi	a0,a0,-1482 # 5a18 <malloc+0xcb4>
    1fea:	00003097          	auipc	ra,0x3
    1fee:	cc2080e7          	jalr	-830(ra) # 4cac <printf>
    exit(1);
    1ff2:	4505                	li	a0,1
    1ff4:	00003097          	auipc	ra,0x3
    1ff8:	910080e7          	jalr	-1776(ra) # 4904 <exit>
    printf("%s: sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    1ffc:	862a                	mv	a2,a0
    1ffe:	85a6                	mv	a1,s1
    2000:	00004517          	auipc	a0,0x4
    2004:	a3850513          	addi	a0,a0,-1480 # 5a38 <malloc+0xcd4>
    2008:	00003097          	auipc	ra,0x3
    200c:	ca4080e7          	jalr	-860(ra) # 4cac <printf>
    exit(1);
    2010:	4505                	li	a0,1
    2012:	00003097          	auipc	ra,0x3
    2016:	8f2080e7          	jalr	-1806(ra) # 4904 <exit>
    printf("%s: sbrk re-allocation failed, a %x c %x\n", a, c);
    201a:	8652                	mv	a2,s4
    201c:	85a6                	mv	a1,s1
    201e:	00004517          	auipc	a0,0x4
    2022:	a5a50513          	addi	a0,a0,-1446 # 5a78 <malloc+0xd14>
    2026:	00003097          	auipc	ra,0x3
    202a:	c86080e7          	jalr	-890(ra) # 4cac <printf>
    exit(1);
    202e:	4505                	li	a0,1
    2030:	00003097          	auipc	ra,0x3
    2034:	8d4080e7          	jalr	-1836(ra) # 4904 <exit>
    printf("%s: sbrk de-allocation didn't really deallocate\n", s);
    2038:	85ce                	mv	a1,s3
    203a:	00004517          	auipc	a0,0x4
    203e:	a6e50513          	addi	a0,a0,-1426 # 5aa8 <malloc+0xd44>
    2042:	00003097          	auipc	ra,0x3
    2046:	c6a080e7          	jalr	-918(ra) # 4cac <printf>
    exit(1);
    204a:	4505                	li	a0,1
    204c:	00003097          	auipc	ra,0x3
    2050:	8b8080e7          	jalr	-1864(ra) # 4904 <exit>
    printf("%s: sbrk downsize failed, a %x c %x\n", a, c);
    2054:	862a                	mv	a2,a0
    2056:	85a6                	mv	a1,s1
    2058:	00004517          	auipc	a0,0x4
    205c:	a8850513          	addi	a0,a0,-1400 # 5ae0 <malloc+0xd7c>
    2060:	00003097          	auipc	ra,0x3
    2064:	c4c080e7          	jalr	-948(ra) # 4cac <printf>
    exit(1);
    2068:	4505                	li	a0,1
    206a:	00003097          	auipc	ra,0x3
    206e:	89a080e7          	jalr	-1894(ra) # 4904 <exit>

0000000000002072 <sbrkarg>:
{
    2072:	7179                	addi	sp,sp,-48
    2074:	f406                	sd	ra,40(sp)
    2076:	f022                	sd	s0,32(sp)
    2078:	ec26                	sd	s1,24(sp)
    207a:	e84a                	sd	s2,16(sp)
    207c:	e44e                	sd	s3,8(sp)
    207e:	1800                	addi	s0,sp,48
    2080:	89aa                	mv	s3,a0
  a = sbrk(PGSIZE);
    2082:	6505                	lui	a0,0x1
    2084:	00003097          	auipc	ra,0x3
    2088:	8f8080e7          	jalr	-1800(ra) # 497c <sbrk>
    208c:	892a                	mv	s2,a0
  fd = open("sbrk", O_CREATE|O_WRONLY);
    208e:	20100593          	li	a1,513
    2092:	00004517          	auipc	a0,0x4
    2096:	a7650513          	addi	a0,a0,-1418 # 5b08 <malloc+0xda4>
    209a:	00003097          	auipc	ra,0x3
    209e:	8b0080e7          	jalr	-1872(ra) # 494a <open>
    20a2:	84aa                	mv	s1,a0
  remove("sbrk");
    20a4:	00004517          	auipc	a0,0x4
    20a8:	a6450513          	addi	a0,a0,-1436 # 5b08 <malloc+0xda4>
    20ac:	00003097          	auipc	ra,0x3
    20b0:	908080e7          	jalr	-1784(ra) # 49b4 <remove>
  if(fd < 0)  {
    20b4:	0404c163          	bltz	s1,20f6 <sbrkarg+0x84>
  if ((n = write(fd, a, PGSIZE)) < 0) {
    20b8:	6605                	lui	a2,0x1
    20ba:	85ca                	mv	a1,s2
    20bc:	8526                	mv	a0,s1
    20be:	00003097          	auipc	ra,0x3
    20c2:	868080e7          	jalr	-1944(ra) # 4926 <write>
    20c6:	04054663          	bltz	a0,2112 <sbrkarg+0xa0>
  close(fd);
    20ca:	8526                	mv	a0,s1
    20cc:	00003097          	auipc	ra,0x3
    20d0:	864080e7          	jalr	-1948(ra) # 4930 <close>
  a = sbrk(PGSIZE);
    20d4:	6505                	lui	a0,0x1
    20d6:	00003097          	auipc	ra,0x3
    20da:	8a6080e7          	jalr	-1882(ra) # 497c <sbrk>
  if(pipe((int *) a) != 0){
    20de:	00003097          	auipc	ra,0x3
    20e2:	838080e7          	jalr	-1992(ra) # 4916 <pipe>
    20e6:	e521                	bnez	a0,212e <sbrkarg+0xbc>
}
    20e8:	70a2                	ld	ra,40(sp)
    20ea:	7402                	ld	s0,32(sp)
    20ec:	64e2                	ld	s1,24(sp)
    20ee:	6942                	ld	s2,16(sp)
    20f0:	69a2                	ld	s3,8(sp)
    20f2:	6145                	addi	sp,sp,48
    20f4:	8082                	ret
    printf("%s: open sbrk failed\n", s);
    20f6:	85ce                	mv	a1,s3
    20f8:	00004517          	auipc	a0,0x4
    20fc:	a1850513          	addi	a0,a0,-1512 # 5b10 <malloc+0xdac>
    2100:	00003097          	auipc	ra,0x3
    2104:	bac080e7          	jalr	-1108(ra) # 4cac <printf>
    exit(1);
    2108:	4505                	li	a0,1
    210a:	00002097          	auipc	ra,0x2
    210e:	7fa080e7          	jalr	2042(ra) # 4904 <exit>
    printf("%s: write sbrk failed\n", s);
    2112:	85ce                	mv	a1,s3
    2114:	00004517          	auipc	a0,0x4
    2118:	a1450513          	addi	a0,a0,-1516 # 5b28 <malloc+0xdc4>
    211c:	00003097          	auipc	ra,0x3
    2120:	b90080e7          	jalr	-1136(ra) # 4cac <printf>
    exit(1);
    2124:	4505                	li	a0,1
    2126:	00002097          	auipc	ra,0x2
    212a:	7de080e7          	jalr	2014(ra) # 4904 <exit>
    printf("%s: pipe() failed\n", s);
    212e:	85ce                	mv	a1,s3
    2130:	00003517          	auipc	a0,0x3
    2134:	52850513          	addi	a0,a0,1320 # 5658 <malloc+0x8f4>
    2138:	00003097          	auipc	ra,0x3
    213c:	b74080e7          	jalr	-1164(ra) # 4cac <printf>
    exit(1);
    2140:	4505                	li	a0,1
    2142:	00002097          	auipc	ra,0x2
    2146:	7c2080e7          	jalr	1986(ra) # 4904 <exit>

000000000000214a <argptest>:
{
    214a:	1101                	addi	sp,sp,-32
    214c:	ec06                	sd	ra,24(sp)
    214e:	e822                	sd	s0,16(sp)
    2150:	e426                	sd	s1,8(sp)
    2152:	e04a                	sd	s2,0(sp)
    2154:	1000                	addi	s0,sp,32
    2156:	892a                	mv	s2,a0
  fd = open("init", O_RDONLY);
    2158:	4581                	li	a1,0
    215a:	00004517          	auipc	a0,0x4
    215e:	9e650513          	addi	a0,a0,-1562 # 5b40 <malloc+0xddc>
    2162:	00002097          	auipc	ra,0x2
    2166:	7e8080e7          	jalr	2024(ra) # 494a <open>
  if (fd < 0) {
    216a:	02054b63          	bltz	a0,21a0 <argptest+0x56>
    216e:	84aa                	mv	s1,a0
  read(fd, sbrk(0) - 1, -1);
    2170:	4501                	li	a0,0
    2172:	00003097          	auipc	ra,0x3
    2176:	80a080e7          	jalr	-2038(ra) # 497c <sbrk>
    217a:	567d                	li	a2,-1
    217c:	fff50593          	addi	a1,a0,-1
    2180:	8526                	mv	a0,s1
    2182:	00002097          	auipc	ra,0x2
    2186:	79c080e7          	jalr	1948(ra) # 491e <read>
  close(fd);
    218a:	8526                	mv	a0,s1
    218c:	00002097          	auipc	ra,0x2
    2190:	7a4080e7          	jalr	1956(ra) # 4930 <close>
}
    2194:	60e2                	ld	ra,24(sp)
    2196:	6442                	ld	s0,16(sp)
    2198:	64a2                	ld	s1,8(sp)
    219a:	6902                	ld	s2,0(sp)
    219c:	6105                	addi	sp,sp,32
    219e:	8082                	ret
    printf("%s: open failed\n", s);
    21a0:	85ca                	mv	a1,s2
    21a2:	00003517          	auipc	a0,0x3
    21a6:	3c650513          	addi	a0,a0,966 # 5568 <malloc+0x804>
    21aa:	00003097          	auipc	ra,0x3
    21ae:	b02080e7          	jalr	-1278(ra) # 4cac <printf>
    exit(1);
    21b2:	4505                	li	a0,1
    21b4:	00002097          	auipc	ra,0x2
    21b8:	750080e7          	jalr	1872(ra) # 4904 <exit>

00000000000021bc <sbrkbugs>:
{
    21bc:	1141                	addi	sp,sp,-16
    21be:	e406                	sd	ra,8(sp)
    21c0:	e022                	sd	s0,0(sp)
    21c2:	0800                	addi	s0,sp,16
  int pid = fork();
    21c4:	00002097          	auipc	ra,0x2
    21c8:	738080e7          	jalr	1848(ra) # 48fc <fork>
  if(pid < 0){
    21cc:	02054263          	bltz	a0,21f0 <sbrkbugs+0x34>
  if(pid == 0){
    21d0:	ed0d                	bnez	a0,220a <sbrkbugs+0x4e>
    int sz = (uint64) sbrk(0);
    21d2:	00002097          	auipc	ra,0x2
    21d6:	7aa080e7          	jalr	1962(ra) # 497c <sbrk>
    sbrk(-sz);
    21da:	40a0053b          	negw	a0,a0
    21de:	00002097          	auipc	ra,0x2
    21e2:	79e080e7          	jalr	1950(ra) # 497c <sbrk>
    exit(0);
    21e6:	4501                	li	a0,0
    21e8:	00002097          	auipc	ra,0x2
    21ec:	71c080e7          	jalr	1820(ra) # 4904 <exit>
    printf("fork failed\n");
    21f0:	00003517          	auipc	a0,0x3
    21f4:	6e050513          	addi	a0,a0,1760 # 58d0 <malloc+0xb6c>
    21f8:	00003097          	auipc	ra,0x3
    21fc:	ab4080e7          	jalr	-1356(ra) # 4cac <printf>
    exit(1);
    2200:	4505                	li	a0,1
    2202:	00002097          	auipc	ra,0x2
    2206:	702080e7          	jalr	1794(ra) # 4904 <exit>
  wait(0);
    220a:	4501                	li	a0,0
    220c:	00002097          	auipc	ra,0x2
    2210:	702080e7          	jalr	1794(ra) # 490e <wait>
  pid = fork();
    2214:	00002097          	auipc	ra,0x2
    2218:	6e8080e7          	jalr	1768(ra) # 48fc <fork>
  if(pid < 0){
    221c:	02054563          	bltz	a0,2246 <sbrkbugs+0x8a>
  if(pid == 0){
    2220:	e121                	bnez	a0,2260 <sbrkbugs+0xa4>
    int sz = (uint64) sbrk(0);
    2222:	00002097          	auipc	ra,0x2
    2226:	75a080e7          	jalr	1882(ra) # 497c <sbrk>
    sbrk(-(sz - 3500));
    222a:	6785                	lui	a5,0x1
    222c:	dac7879b          	addiw	a5,a5,-596 # dac <removeread+0xa6>
    2230:	40a7853b          	subw	a0,a5,a0
    2234:	00002097          	auipc	ra,0x2
    2238:	748080e7          	jalr	1864(ra) # 497c <sbrk>
    exit(0);
    223c:	4501                	li	a0,0
    223e:	00002097          	auipc	ra,0x2
    2242:	6c6080e7          	jalr	1734(ra) # 4904 <exit>
    printf("fork failed\n");
    2246:	00003517          	auipc	a0,0x3
    224a:	68a50513          	addi	a0,a0,1674 # 58d0 <malloc+0xb6c>
    224e:	00003097          	auipc	ra,0x3
    2252:	a5e080e7          	jalr	-1442(ra) # 4cac <printf>
    exit(1);
    2256:	4505                	li	a0,1
    2258:	00002097          	auipc	ra,0x2
    225c:	6ac080e7          	jalr	1708(ra) # 4904 <exit>
  wait(0);
    2260:	4501                	li	a0,0
    2262:	00002097          	auipc	ra,0x2
    2266:	6ac080e7          	jalr	1708(ra) # 490e <wait>
  pid = fork();
    226a:	00002097          	auipc	ra,0x2
    226e:	692080e7          	jalr	1682(ra) # 48fc <fork>
  if(pid < 0){
    2272:	02054a63          	bltz	a0,22a6 <sbrkbugs+0xea>
  if(pid == 0){
    2276:	e529                	bnez	a0,22c0 <sbrkbugs+0x104>
    sbrk((10*4096 + 2048) - (uint64)sbrk(0));
    2278:	00002097          	auipc	ra,0x2
    227c:	704080e7          	jalr	1796(ra) # 497c <sbrk>
    2280:	67ad                	lui	a5,0xb
    2282:	8007879b          	addiw	a5,a5,-2048 # a800 <uninit+0x2698>
    2286:	40a7853b          	subw	a0,a5,a0
    228a:	00002097          	auipc	ra,0x2
    228e:	6f2080e7          	jalr	1778(ra) # 497c <sbrk>
    sbrk(-10);
    2292:	5559                	li	a0,-10
    2294:	00002097          	auipc	ra,0x2
    2298:	6e8080e7          	jalr	1768(ra) # 497c <sbrk>
    exit(0);
    229c:	4501                	li	a0,0
    229e:	00002097          	auipc	ra,0x2
    22a2:	666080e7          	jalr	1638(ra) # 4904 <exit>
    printf("fork failed\n");
    22a6:	00003517          	auipc	a0,0x3
    22aa:	62a50513          	addi	a0,a0,1578 # 58d0 <malloc+0xb6c>
    22ae:	00003097          	auipc	ra,0x3
    22b2:	9fe080e7          	jalr	-1538(ra) # 4cac <printf>
    exit(1);
    22b6:	4505                	li	a0,1
    22b8:	00002097          	auipc	ra,0x2
    22bc:	64c080e7          	jalr	1612(ra) # 4904 <exit>
  wait(0);
    22c0:	4501                	li	a0,0
    22c2:	00002097          	auipc	ra,0x2
    22c6:	64c080e7          	jalr	1612(ra) # 490e <wait>
  exit(0);
    22ca:	4501                	li	a0,0
    22cc:	00002097          	auipc	ra,0x2
    22d0:	638080e7          	jalr	1592(ra) # 4904 <exit>

00000000000022d4 <execout>:
// test the exec() code that cleans up if it runs out
// of memory. it's really a test that such a condition
// doesn't cause a panic.
void
execout(char *s)
{
    22d4:	715d                	addi	sp,sp,-80
    22d6:	e486                	sd	ra,72(sp)
    22d8:	e0a2                	sd	s0,64(sp)
    22da:	fc26                	sd	s1,56(sp)
    22dc:	f84a                	sd	s2,48(sp)
    22de:	f44e                	sd	s3,40(sp)
    22e0:	f052                	sd	s4,32(sp)
    22e2:	0880                	addi	s0,sp,80
  for(int avail = 0; avail < 15; avail++){
    22e4:	4901                	li	s2,0
    22e6:	49bd                	li	s3,15
    int pid = fork();
    22e8:	00002097          	auipc	ra,0x2
    22ec:	614080e7          	jalr	1556(ra) # 48fc <fork>
    22f0:	84aa                	mv	s1,a0
    if(pid < 0){
    22f2:	02054063          	bltz	a0,2312 <execout+0x3e>
      printf("fork failed\n");
      exit(1);
    } else if(pid == 0){
    22f6:	c91d                	beqz	a0,232c <execout+0x58>
      close(1);
      char *args[] = { "echo", "x", 0 };
      exec("echo", args);
      exit(0);
    } else {
      wait((int*)0);
    22f8:	4501                	li	a0,0
    22fa:	00002097          	auipc	ra,0x2
    22fe:	614080e7          	jalr	1556(ra) # 490e <wait>
  for(int avail = 0; avail < 15; avail++){
    2302:	2905                	addiw	s2,s2,1
    2304:	ff3912e3          	bne	s2,s3,22e8 <execout+0x14>
    }
  }

  exit(0);
    2308:	4501                	li	a0,0
    230a:	00002097          	auipc	ra,0x2
    230e:	5fa080e7          	jalr	1530(ra) # 4904 <exit>
      printf("fork failed\n");
    2312:	00003517          	auipc	a0,0x3
    2316:	5be50513          	addi	a0,a0,1470 # 58d0 <malloc+0xb6c>
    231a:	00003097          	auipc	ra,0x3
    231e:	992080e7          	jalr	-1646(ra) # 4cac <printf>
      exit(1);
    2322:	4505                	li	a0,1
    2324:	00002097          	auipc	ra,0x2
    2328:	5e0080e7          	jalr	1504(ra) # 4904 <exit>
        if(a == 0xffffffffffffffffLL)
    232c:	59fd                	li	s3,-1
        *(char*)(a + 4096 - 1) = 1;
    232e:	4a05                	li	s4,1
        uint64 a = (uint64) sbrk(4096);
    2330:	6505                	lui	a0,0x1
    2332:	00002097          	auipc	ra,0x2
    2336:	64a080e7          	jalr	1610(ra) # 497c <sbrk>
        if(a == 0xffffffffffffffffLL)
    233a:	01350763          	beq	a0,s3,2348 <execout+0x74>
        *(char*)(a + 4096 - 1) = 1;
    233e:	6785                	lui	a5,0x1
    2340:	97aa                	add	a5,a5,a0
    2342:	ff478fa3          	sb	s4,-1(a5) # fff <copyinstr2+0xbd>
      while(1){
    2346:	b7ed                	j	2330 <execout+0x5c>
      for(int i = 0; i < avail; i++)
    2348:	01205a63          	blez	s2,235c <execout+0x88>
        sbrk(-4096);
    234c:	757d                	lui	a0,0xfffff
    234e:	00002097          	auipc	ra,0x2
    2352:	62e080e7          	jalr	1582(ra) # 497c <sbrk>
      for(int i = 0; i < avail; i++)
    2356:	2485                	addiw	s1,s1,1
    2358:	ff249ae3          	bne	s1,s2,234c <execout+0x78>
      close(1);
    235c:	4505                	li	a0,1
    235e:	00002097          	auipc	ra,0x2
    2362:	5d2080e7          	jalr	1490(ra) # 4930 <close>
      char *args[] = { "echo", "x", 0 };
    2366:	00003517          	auipc	a0,0x3
    236a:	b5a50513          	addi	a0,a0,-1190 # 4ec0 <malloc+0x15c>
    236e:	faa43c23          	sd	a0,-72(s0)
    2372:	00003797          	auipc	a5,0x3
    2376:	bbe78793          	addi	a5,a5,-1090 # 4f30 <malloc+0x1cc>
    237a:	fcf43023          	sd	a5,-64(s0)
    237e:	fc043423          	sd	zero,-56(s0)
      exec("echo", args);
    2382:	fb840593          	addi	a1,s0,-72
    2386:	00002097          	auipc	ra,0x2
    238a:	5ba080e7          	jalr	1466(ra) # 4940 <exec>
      exit(0);
    238e:	4501                	li	a0,0
    2390:	00002097          	auipc	ra,0x2
    2394:	574080e7          	jalr	1396(ra) # 4904 <exit>

0000000000002398 <iputtest>:
{
    2398:	1101                	addi	sp,sp,-32
    239a:	ec06                	sd	ra,24(sp)
    239c:	e822                	sd	s0,16(sp)
    239e:	e426                	sd	s1,8(sp)
    23a0:	1000                	addi	s0,sp,32
    23a2:	84aa                	mv	s1,a0
  if(mkdir("iputdir") < 0){
    23a4:	00003517          	auipc	a0,0x3
    23a8:	7a450513          	addi	a0,a0,1956 # 5b48 <malloc+0xde4>
    23ac:	00002097          	auipc	ra,0x2
    23b0:	5ae080e7          	jalr	1454(ra) # 495a <mkdir>
    23b4:	04054563          	bltz	a0,23fe <iputtest+0x66>
  if(chdir("iputdir") < 0){
    23b8:	00003517          	auipc	a0,0x3
    23bc:	79050513          	addi	a0,a0,1936 # 5b48 <malloc+0xde4>
    23c0:	00002097          	auipc	ra,0x2
    23c4:	5a2080e7          	jalr	1442(ra) # 4962 <chdir>
    23c8:	04054963          	bltz	a0,241a <iputtest+0x82>
  if(remove("../iputdir") < 0){
    23cc:	00003517          	auipc	a0,0x3
    23d0:	7bc50513          	addi	a0,a0,1980 # 5b88 <malloc+0xe24>
    23d4:	00002097          	auipc	ra,0x2
    23d8:	5e0080e7          	jalr	1504(ra) # 49b4 <remove>
    23dc:	04054d63          	bltz	a0,2436 <iputtest+0x9e>
  if(chdir("/") < 0){
    23e0:	00003517          	auipc	a0,0x3
    23e4:	7d850513          	addi	a0,a0,2008 # 5bb8 <malloc+0xe54>
    23e8:	00002097          	auipc	ra,0x2
    23ec:	57a080e7          	jalr	1402(ra) # 4962 <chdir>
    23f0:	06054163          	bltz	a0,2452 <iputtest+0xba>
}
    23f4:	60e2                	ld	ra,24(sp)
    23f6:	6442                	ld	s0,16(sp)
    23f8:	64a2                	ld	s1,8(sp)
    23fa:	6105                	addi	sp,sp,32
    23fc:	8082                	ret
    printf("%s: mkdir failed\n", s);
    23fe:	85a6                	mv	a1,s1
    2400:	00003517          	auipc	a0,0x3
    2404:	75050513          	addi	a0,a0,1872 # 5b50 <malloc+0xdec>
    2408:	00003097          	auipc	ra,0x3
    240c:	8a4080e7          	jalr	-1884(ra) # 4cac <printf>
    exit(1);
    2410:	4505                	li	a0,1
    2412:	00002097          	auipc	ra,0x2
    2416:	4f2080e7          	jalr	1266(ra) # 4904 <exit>
    printf("%s: chdir iputdir failed\n", s);
    241a:	85a6                	mv	a1,s1
    241c:	00003517          	auipc	a0,0x3
    2420:	74c50513          	addi	a0,a0,1868 # 5b68 <malloc+0xe04>
    2424:	00003097          	auipc	ra,0x3
    2428:	888080e7          	jalr	-1912(ra) # 4cac <printf>
    exit(1);
    242c:	4505                	li	a0,1
    242e:	00002097          	auipc	ra,0x2
    2432:	4d6080e7          	jalr	1238(ra) # 4904 <exit>
    printf("%s: remove ../iputdir failed\n", s);
    2436:	85a6                	mv	a1,s1
    2438:	00003517          	auipc	a0,0x3
    243c:	76050513          	addi	a0,a0,1888 # 5b98 <malloc+0xe34>
    2440:	00003097          	auipc	ra,0x3
    2444:	86c080e7          	jalr	-1940(ra) # 4cac <printf>
    exit(1);
    2448:	4505                	li	a0,1
    244a:	00002097          	auipc	ra,0x2
    244e:	4ba080e7          	jalr	1210(ra) # 4904 <exit>
    printf("%s: chdir / failed\n", s);
    2452:	85a6                	mv	a1,s1
    2454:	00003517          	auipc	a0,0x3
    2458:	76c50513          	addi	a0,a0,1900 # 5bc0 <malloc+0xe5c>
    245c:	00003097          	auipc	ra,0x3
    2460:	850080e7          	jalr	-1968(ra) # 4cac <printf>
    exit(1);
    2464:	4505                	li	a0,1
    2466:	00002097          	auipc	ra,0x2
    246a:	49e080e7          	jalr	1182(ra) # 4904 <exit>

000000000000246e <exitiputtest>:
{
    246e:	7179                	addi	sp,sp,-48
    2470:	f406                	sd	ra,40(sp)
    2472:	f022                	sd	s0,32(sp)
    2474:	ec26                	sd	s1,24(sp)
    2476:	1800                	addi	s0,sp,48
    2478:	84aa                	mv	s1,a0
  pid = fork();
    247a:	00002097          	auipc	ra,0x2
    247e:	482080e7          	jalr	1154(ra) # 48fc <fork>
  if(pid < 0){
    2482:	04054663          	bltz	a0,24ce <exitiputtest+0x60>
  if(pid == 0){
    2486:	ed45                	bnez	a0,253e <exitiputtest+0xd0>
    if(mkdir("iputdir") < 0){
    2488:	00003517          	auipc	a0,0x3
    248c:	6c050513          	addi	a0,a0,1728 # 5b48 <malloc+0xde4>
    2490:	00002097          	auipc	ra,0x2
    2494:	4ca080e7          	jalr	1226(ra) # 495a <mkdir>
    2498:	04054963          	bltz	a0,24ea <exitiputtest+0x7c>
    if(chdir("iputdir") < 0){
    249c:	00003517          	auipc	a0,0x3
    24a0:	6ac50513          	addi	a0,a0,1708 # 5b48 <malloc+0xde4>
    24a4:	00002097          	auipc	ra,0x2
    24a8:	4be080e7          	jalr	1214(ra) # 4962 <chdir>
    24ac:	04054d63          	bltz	a0,2506 <exitiputtest+0x98>
    if(remove("../iputdir") < 0){
    24b0:	00003517          	auipc	a0,0x3
    24b4:	6d850513          	addi	a0,a0,1752 # 5b88 <malloc+0xe24>
    24b8:	00002097          	auipc	ra,0x2
    24bc:	4fc080e7          	jalr	1276(ra) # 49b4 <remove>
    24c0:	06054163          	bltz	a0,2522 <exitiputtest+0xb4>
    exit(0);
    24c4:	4501                	li	a0,0
    24c6:	00002097          	auipc	ra,0x2
    24ca:	43e080e7          	jalr	1086(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    24ce:	85a6                	mv	a1,s1
    24d0:	00003517          	auipc	a0,0x3
    24d4:	08050513          	addi	a0,a0,128 # 5550 <malloc+0x7ec>
    24d8:	00002097          	auipc	ra,0x2
    24dc:	7d4080e7          	jalr	2004(ra) # 4cac <printf>
    exit(1);
    24e0:	4505                	li	a0,1
    24e2:	00002097          	auipc	ra,0x2
    24e6:	422080e7          	jalr	1058(ra) # 4904 <exit>
      printf("%s: mkdir failed\n", s);
    24ea:	85a6                	mv	a1,s1
    24ec:	00003517          	auipc	a0,0x3
    24f0:	66450513          	addi	a0,a0,1636 # 5b50 <malloc+0xdec>
    24f4:	00002097          	auipc	ra,0x2
    24f8:	7b8080e7          	jalr	1976(ra) # 4cac <printf>
      exit(1);
    24fc:	4505                	li	a0,1
    24fe:	00002097          	auipc	ra,0x2
    2502:	406080e7          	jalr	1030(ra) # 4904 <exit>
      printf("%s: child chdir failed\n", s);
    2506:	85a6                	mv	a1,s1
    2508:	00003517          	auipc	a0,0x3
    250c:	6d050513          	addi	a0,a0,1744 # 5bd8 <malloc+0xe74>
    2510:	00002097          	auipc	ra,0x2
    2514:	79c080e7          	jalr	1948(ra) # 4cac <printf>
      exit(1);
    2518:	4505                	li	a0,1
    251a:	00002097          	auipc	ra,0x2
    251e:	3ea080e7          	jalr	1002(ra) # 4904 <exit>
      printf("%s: remove ../iputdir failed\n", s);
    2522:	85a6                	mv	a1,s1
    2524:	00003517          	auipc	a0,0x3
    2528:	67450513          	addi	a0,a0,1652 # 5b98 <malloc+0xe34>
    252c:	00002097          	auipc	ra,0x2
    2530:	780080e7          	jalr	1920(ra) # 4cac <printf>
      exit(1);
    2534:	4505                	li	a0,1
    2536:	00002097          	auipc	ra,0x2
    253a:	3ce080e7          	jalr	974(ra) # 4904 <exit>
  wait(&xstatus);
    253e:	fdc40513          	addi	a0,s0,-36
    2542:	00002097          	auipc	ra,0x2
    2546:	3cc080e7          	jalr	972(ra) # 490e <wait>
  exit(xstatus);
    254a:	fdc42503          	lw	a0,-36(s0)
    254e:	00002097          	auipc	ra,0x2
    2552:	3b6080e7          	jalr	950(ra) # 4904 <exit>

0000000000002556 <subdir>:
{
    2556:	1101                	addi	sp,sp,-32
    2558:	ec06                	sd	ra,24(sp)
    255a:	e822                	sd	s0,16(sp)
    255c:	e426                	sd	s1,8(sp)
    255e:	e04a                	sd	s2,0(sp)
    2560:	1000                	addi	s0,sp,32
    2562:	892a                	mv	s2,a0
  remove("ff");
    2564:	00003517          	auipc	a0,0x3
    2568:	68c50513          	addi	a0,a0,1676 # 5bf0 <malloc+0xe8c>
    256c:	00002097          	auipc	ra,0x2
    2570:	448080e7          	jalr	1096(ra) # 49b4 <remove>
  if(mkdir("dd") != 0){
    2574:	00003517          	auipc	a0,0x3
    2578:	68450513          	addi	a0,a0,1668 # 5bf8 <malloc+0xe94>
    257c:	00002097          	auipc	ra,0x2
    2580:	3de080e7          	jalr	990(ra) # 495a <mkdir>
    2584:	24051363          	bnez	a0,27ca <subdir+0x274>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    2588:	20200593          	li	a1,514
    258c:	00003517          	auipc	a0,0x3
    2590:	68c50513          	addi	a0,a0,1676 # 5c18 <malloc+0xeb4>
    2594:	00002097          	auipc	ra,0x2
    2598:	3b6080e7          	jalr	950(ra) # 494a <open>
    259c:	84aa                	mv	s1,a0
  if(fd < 0){
    259e:	24054463          	bltz	a0,27e6 <subdir+0x290>
  write(fd, "ff", 2);
    25a2:	4609                	li	a2,2
    25a4:	00003597          	auipc	a1,0x3
    25a8:	64c58593          	addi	a1,a1,1612 # 5bf0 <malloc+0xe8c>
    25ac:	00002097          	auipc	ra,0x2
    25b0:	37a080e7          	jalr	890(ra) # 4926 <write>
  close(fd);
    25b4:	8526                	mv	a0,s1
    25b6:	00002097          	auipc	ra,0x2
    25ba:	37a080e7          	jalr	890(ra) # 4930 <close>
  if(remove("dd") >= 0){
    25be:	00003517          	auipc	a0,0x3
    25c2:	63a50513          	addi	a0,a0,1594 # 5bf8 <malloc+0xe94>
    25c6:	00002097          	auipc	ra,0x2
    25ca:	3ee080e7          	jalr	1006(ra) # 49b4 <remove>
    25ce:	22055a63          	bgez	a0,2802 <subdir+0x2ac>
  if(mkdir("/dd/dd") != 0){
    25d2:	00003517          	auipc	a0,0x3
    25d6:	69e50513          	addi	a0,a0,1694 # 5c70 <malloc+0xf0c>
    25da:	00002097          	auipc	ra,0x2
    25de:	380080e7          	jalr	896(ra) # 495a <mkdir>
    25e2:	22051e63          	bnez	a0,281e <subdir+0x2c8>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    25e6:	20200593          	li	a1,514
    25ea:	00003517          	auipc	a0,0x3
    25ee:	6ae50513          	addi	a0,a0,1710 # 5c98 <malloc+0xf34>
    25f2:	00002097          	auipc	ra,0x2
    25f6:	358080e7          	jalr	856(ra) # 494a <open>
    25fa:	84aa                	mv	s1,a0
  if(fd < 0){
    25fc:	22054f63          	bltz	a0,283a <subdir+0x2e4>
  write(fd, "FF", 2);
    2600:	4609                	li	a2,2
    2602:	00003597          	auipc	a1,0x3
    2606:	6c658593          	addi	a1,a1,1734 # 5cc8 <malloc+0xf64>
    260a:	00002097          	auipc	ra,0x2
    260e:	31c080e7          	jalr	796(ra) # 4926 <write>
  close(fd);
    2612:	8526                	mv	a0,s1
    2614:	00002097          	auipc	ra,0x2
    2618:	31c080e7          	jalr	796(ra) # 4930 <close>
  fd = open("dd/dd/../ff", 0);
    261c:	4581                	li	a1,0
    261e:	00003517          	auipc	a0,0x3
    2622:	6b250513          	addi	a0,a0,1714 # 5cd0 <malloc+0xf6c>
    2626:	00002097          	auipc	ra,0x2
    262a:	324080e7          	jalr	804(ra) # 494a <open>
    262e:	84aa                	mv	s1,a0
  if(fd < 0){
    2630:	22054363          	bltz	a0,2856 <subdir+0x300>
  cc = read(fd, buf, sizeof(buf));
    2634:	6609                	lui	a2,0x2
    2636:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x42>
    263a:	00008597          	auipc	a1,0x8
    263e:	23e58593          	addi	a1,a1,574 # a878 <buf>
    2642:	00002097          	auipc	ra,0x2
    2646:	2dc080e7          	jalr	732(ra) # 491e <read>
  if(cc != 2 || buf[0] != 'f'){
    264a:	4789                	li	a5,2
    264c:	22f51363          	bne	a0,a5,2872 <subdir+0x31c>
    2650:	00008717          	auipc	a4,0x8
    2654:	22874703          	lbu	a4,552(a4) # a878 <buf>
    2658:	06600793          	li	a5,102
    265c:	20f71b63          	bne	a4,a5,2872 <subdir+0x31c>
  close(fd);
    2660:	8526                	mv	a0,s1
    2662:	00002097          	auipc	ra,0x2
    2666:	2ce080e7          	jalr	718(ra) # 4930 <close>
  if(remove("dd/dd/ff") != 0){
    266a:	00003517          	auipc	a0,0x3
    266e:	62e50513          	addi	a0,a0,1582 # 5c98 <malloc+0xf34>
    2672:	00002097          	auipc	ra,0x2
    2676:	342080e7          	jalr	834(ra) # 49b4 <remove>
    267a:	20051a63          	bnez	a0,288e <subdir+0x338>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    267e:	4581                	li	a1,0
    2680:	00003517          	auipc	a0,0x3
    2684:	61850513          	addi	a0,a0,1560 # 5c98 <malloc+0xf34>
    2688:	00002097          	auipc	ra,0x2
    268c:	2c2080e7          	jalr	706(ra) # 494a <open>
    2690:	20055d63          	bgez	a0,28aa <subdir+0x354>
  if(chdir("dd") != 0){
    2694:	00003517          	auipc	a0,0x3
    2698:	56450513          	addi	a0,a0,1380 # 5bf8 <malloc+0xe94>
    269c:	00002097          	auipc	ra,0x2
    26a0:	2c6080e7          	jalr	710(ra) # 4962 <chdir>
    26a4:	22051163          	bnez	a0,28c6 <subdir+0x370>
  if(chdir("dd/../../dd") != 0){
    26a8:	00003517          	auipc	a0,0x3
    26ac:	6d850513          	addi	a0,a0,1752 # 5d80 <malloc+0x101c>
    26b0:	00002097          	auipc	ra,0x2
    26b4:	2b2080e7          	jalr	690(ra) # 4962 <chdir>
    26b8:	22051563          	bnez	a0,28e2 <subdir+0x38c>
  if(chdir("dd/../../../dd") != 0){
    26bc:	00003517          	auipc	a0,0x3
    26c0:	6f450513          	addi	a0,a0,1780 # 5db0 <malloc+0x104c>
    26c4:	00002097          	auipc	ra,0x2
    26c8:	29e080e7          	jalr	670(ra) # 4962 <chdir>
    26cc:	22051963          	bnez	a0,28fe <subdir+0x3a8>
  if(chdir("./..") != 0){
    26d0:	00003517          	auipc	a0,0x3
    26d4:	71050513          	addi	a0,a0,1808 # 5de0 <malloc+0x107c>
    26d8:	00002097          	auipc	ra,0x2
    26dc:	28a080e7          	jalr	650(ra) # 4962 <chdir>
    26e0:	22051d63          	bnez	a0,291a <subdir+0x3c4>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    26e4:	4581                	li	a1,0
    26e6:	00003517          	auipc	a0,0x3
    26ea:	5b250513          	addi	a0,a0,1458 # 5c98 <malloc+0xf34>
    26ee:	00002097          	auipc	ra,0x2
    26f2:	25c080e7          	jalr	604(ra) # 494a <open>
    26f6:	24055063          	bgez	a0,2936 <subdir+0x3e0>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    26fa:	20200593          	li	a1,514
    26fe:	00003517          	auipc	a0,0x3
    2702:	73250513          	addi	a0,a0,1842 # 5e30 <malloc+0x10cc>
    2706:	00002097          	auipc	ra,0x2
    270a:	244080e7          	jalr	580(ra) # 494a <open>
    270e:	24055263          	bgez	a0,2952 <subdir+0x3fc>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2712:	20200593          	li	a1,514
    2716:	00003517          	auipc	a0,0x3
    271a:	74a50513          	addi	a0,a0,1866 # 5e60 <malloc+0x10fc>
    271e:	00002097          	auipc	ra,0x2
    2722:	22c080e7          	jalr	556(ra) # 494a <open>
    2726:	24055463          	bgez	a0,296e <subdir+0x418>
  if(open("dd", O_CREATE) >= 0){
    272a:	20000593          	li	a1,512
    272e:	00003517          	auipc	a0,0x3
    2732:	4ca50513          	addi	a0,a0,1226 # 5bf8 <malloc+0xe94>
    2736:	00002097          	auipc	ra,0x2
    273a:	214080e7          	jalr	532(ra) # 494a <open>
    273e:	24055663          	bgez	a0,298a <subdir+0x434>
  if(open("dd", O_RDWR) >= 0){
    2742:	4589                	li	a1,2
    2744:	00003517          	auipc	a0,0x3
    2748:	4b450513          	addi	a0,a0,1204 # 5bf8 <malloc+0xe94>
    274c:	00002097          	auipc	ra,0x2
    2750:	1fe080e7          	jalr	510(ra) # 494a <open>
    2754:	24055963          	bgez	a0,29a6 <subdir+0x450>
  if(open("dd", O_WRONLY) >= 0){
    2758:	4585                	li	a1,1
    275a:	00003517          	auipc	a0,0x3
    275e:	49e50513          	addi	a0,a0,1182 # 5bf8 <malloc+0xe94>
    2762:	00002097          	auipc	ra,0x2
    2766:	1e8080e7          	jalr	488(ra) # 494a <open>
    276a:	24055c63          	bgez	a0,29c2 <subdir+0x46c>
  if(remove("dd/ff") != 0){
    276e:	00003517          	auipc	a0,0x3
    2772:	4aa50513          	addi	a0,a0,1194 # 5c18 <malloc+0xeb4>
    2776:	00002097          	auipc	ra,0x2
    277a:	23e080e7          	jalr	574(ra) # 49b4 <remove>
    277e:	26051063          	bnez	a0,29de <subdir+0x488>
  if(remove("dd") == 0){
    2782:	00003517          	auipc	a0,0x3
    2786:	47650513          	addi	a0,a0,1142 # 5bf8 <malloc+0xe94>
    278a:	00002097          	auipc	ra,0x2
    278e:	22a080e7          	jalr	554(ra) # 49b4 <remove>
    2792:	26050463          	beqz	a0,29fa <subdir+0x4a4>
  if(remove("dd/dd") < 0){
    2796:	00003517          	auipc	a0,0x3
    279a:	7a250513          	addi	a0,a0,1954 # 5f38 <malloc+0x11d4>
    279e:	00002097          	auipc	ra,0x2
    27a2:	216080e7          	jalr	534(ra) # 49b4 <remove>
    27a6:	26054863          	bltz	a0,2a16 <subdir+0x4c0>
  if(remove("dd") < 0){
    27aa:	00003517          	auipc	a0,0x3
    27ae:	44e50513          	addi	a0,a0,1102 # 5bf8 <malloc+0xe94>
    27b2:	00002097          	auipc	ra,0x2
    27b6:	202080e7          	jalr	514(ra) # 49b4 <remove>
    27ba:	26054c63          	bltz	a0,2a32 <subdir+0x4dc>
}
    27be:	60e2                	ld	ra,24(sp)
    27c0:	6442                	ld	s0,16(sp)
    27c2:	64a2                	ld	s1,8(sp)
    27c4:	6902                	ld	s2,0(sp)
    27c6:	6105                	addi	sp,sp,32
    27c8:	8082                	ret
    printf("%s: mkdir dd failed\n", s);
    27ca:	85ca                	mv	a1,s2
    27cc:	00003517          	auipc	a0,0x3
    27d0:	43450513          	addi	a0,a0,1076 # 5c00 <malloc+0xe9c>
    27d4:	00002097          	auipc	ra,0x2
    27d8:	4d8080e7          	jalr	1240(ra) # 4cac <printf>
    exit(1);
    27dc:	4505                	li	a0,1
    27de:	00002097          	auipc	ra,0x2
    27e2:	126080e7          	jalr	294(ra) # 4904 <exit>
    printf("%s: create dd/ff failed\n", s);
    27e6:	85ca                	mv	a1,s2
    27e8:	00003517          	auipc	a0,0x3
    27ec:	43850513          	addi	a0,a0,1080 # 5c20 <malloc+0xebc>
    27f0:	00002097          	auipc	ra,0x2
    27f4:	4bc080e7          	jalr	1212(ra) # 4cac <printf>
    exit(1);
    27f8:	4505                	li	a0,1
    27fa:	00002097          	auipc	ra,0x2
    27fe:	10a080e7          	jalr	266(ra) # 4904 <exit>
    printf("%s: remove dd (non-empty dir) succeeded!\n", s);
    2802:	85ca                	mv	a1,s2
    2804:	00003517          	auipc	a0,0x3
    2808:	43c50513          	addi	a0,a0,1084 # 5c40 <malloc+0xedc>
    280c:	00002097          	auipc	ra,0x2
    2810:	4a0080e7          	jalr	1184(ra) # 4cac <printf>
    exit(1);
    2814:	4505                	li	a0,1
    2816:	00002097          	auipc	ra,0x2
    281a:	0ee080e7          	jalr	238(ra) # 4904 <exit>
    printf("subdir mkdir dd/dd failed\n", s);
    281e:	85ca                	mv	a1,s2
    2820:	00003517          	auipc	a0,0x3
    2824:	45850513          	addi	a0,a0,1112 # 5c78 <malloc+0xf14>
    2828:	00002097          	auipc	ra,0x2
    282c:	484080e7          	jalr	1156(ra) # 4cac <printf>
    exit(1);
    2830:	4505                	li	a0,1
    2832:	00002097          	auipc	ra,0x2
    2836:	0d2080e7          	jalr	210(ra) # 4904 <exit>
    printf("%s: create dd/dd/ff failed\n", s);
    283a:	85ca                	mv	a1,s2
    283c:	00003517          	auipc	a0,0x3
    2840:	46c50513          	addi	a0,a0,1132 # 5ca8 <malloc+0xf44>
    2844:	00002097          	auipc	ra,0x2
    2848:	468080e7          	jalr	1128(ra) # 4cac <printf>
    exit(1);
    284c:	4505                	li	a0,1
    284e:	00002097          	auipc	ra,0x2
    2852:	0b6080e7          	jalr	182(ra) # 4904 <exit>
    printf("%s: open dd/dd/../ff failed\n", s);
    2856:	85ca                	mv	a1,s2
    2858:	00003517          	auipc	a0,0x3
    285c:	48850513          	addi	a0,a0,1160 # 5ce0 <malloc+0xf7c>
    2860:	00002097          	auipc	ra,0x2
    2864:	44c080e7          	jalr	1100(ra) # 4cac <printf>
    exit(1);
    2868:	4505                	li	a0,1
    286a:	00002097          	auipc	ra,0x2
    286e:	09a080e7          	jalr	154(ra) # 4904 <exit>
    printf("%s: dd/dd/../ff wrong content\n", s);
    2872:	85ca                	mv	a1,s2
    2874:	00003517          	auipc	a0,0x3
    2878:	48c50513          	addi	a0,a0,1164 # 5d00 <malloc+0xf9c>
    287c:	00002097          	auipc	ra,0x2
    2880:	430080e7          	jalr	1072(ra) # 4cac <printf>
    exit(1);
    2884:	4505                	li	a0,1
    2886:	00002097          	auipc	ra,0x2
    288a:	07e080e7          	jalr	126(ra) # 4904 <exit>
    printf("%s: remove dd/dd/ff failed\n", s);
    288e:	85ca                	mv	a1,s2
    2890:	00003517          	auipc	a0,0x3
    2894:	49050513          	addi	a0,a0,1168 # 5d20 <malloc+0xfbc>
    2898:	00002097          	auipc	ra,0x2
    289c:	414080e7          	jalr	1044(ra) # 4cac <printf>
    exit(1);
    28a0:	4505                	li	a0,1
    28a2:	00002097          	auipc	ra,0x2
    28a6:	062080e7          	jalr	98(ra) # 4904 <exit>
    printf("%s: open (removeed) dd/dd/ff succeeded\n", s);
    28aa:	85ca                	mv	a1,s2
    28ac:	00003517          	auipc	a0,0x3
    28b0:	49450513          	addi	a0,a0,1172 # 5d40 <malloc+0xfdc>
    28b4:	00002097          	auipc	ra,0x2
    28b8:	3f8080e7          	jalr	1016(ra) # 4cac <printf>
    exit(1);
    28bc:	4505                	li	a0,1
    28be:	00002097          	auipc	ra,0x2
    28c2:	046080e7          	jalr	70(ra) # 4904 <exit>
    printf("%s: chdir dd failed\n", s);
    28c6:	85ca                	mv	a1,s2
    28c8:	00003517          	auipc	a0,0x3
    28cc:	4a050513          	addi	a0,a0,1184 # 5d68 <malloc+0x1004>
    28d0:	00002097          	auipc	ra,0x2
    28d4:	3dc080e7          	jalr	988(ra) # 4cac <printf>
    exit(1);
    28d8:	4505                	li	a0,1
    28da:	00002097          	auipc	ra,0x2
    28de:	02a080e7          	jalr	42(ra) # 4904 <exit>
    printf("%s: chdir dd/../../dd failed\n", s);
    28e2:	85ca                	mv	a1,s2
    28e4:	00003517          	auipc	a0,0x3
    28e8:	4ac50513          	addi	a0,a0,1196 # 5d90 <malloc+0x102c>
    28ec:	00002097          	auipc	ra,0x2
    28f0:	3c0080e7          	jalr	960(ra) # 4cac <printf>
    exit(1);
    28f4:	4505                	li	a0,1
    28f6:	00002097          	auipc	ra,0x2
    28fa:	00e080e7          	jalr	14(ra) # 4904 <exit>
    printf("chdir dd/../../dd failed\n", s);
    28fe:	85ca                	mv	a1,s2
    2900:	00003517          	auipc	a0,0x3
    2904:	4c050513          	addi	a0,a0,1216 # 5dc0 <malloc+0x105c>
    2908:	00002097          	auipc	ra,0x2
    290c:	3a4080e7          	jalr	932(ra) # 4cac <printf>
    exit(1);
    2910:	4505                	li	a0,1
    2912:	00002097          	auipc	ra,0x2
    2916:	ff2080e7          	jalr	-14(ra) # 4904 <exit>
    printf("%s: chdir ./.. failed\n", s);
    291a:	85ca                	mv	a1,s2
    291c:	00003517          	auipc	a0,0x3
    2920:	4cc50513          	addi	a0,a0,1228 # 5de8 <malloc+0x1084>
    2924:	00002097          	auipc	ra,0x2
    2928:	388080e7          	jalr	904(ra) # 4cac <printf>
    exit(1);
    292c:	4505                	li	a0,1
    292e:	00002097          	auipc	ra,0x2
    2932:	fd6080e7          	jalr	-42(ra) # 4904 <exit>
    printf("%s: open (removeed) dd/dd/ff succeeded!\n", s);
    2936:	85ca                	mv	a1,s2
    2938:	00003517          	auipc	a0,0x3
    293c:	4c850513          	addi	a0,a0,1224 # 5e00 <malloc+0x109c>
    2940:	00002097          	auipc	ra,0x2
    2944:	36c080e7          	jalr	876(ra) # 4cac <printf>
    exit(1);
    2948:	4505                	li	a0,1
    294a:	00002097          	auipc	ra,0x2
    294e:	fba080e7          	jalr	-70(ra) # 4904 <exit>
    printf("%s: create dd/ff/ff succeeded!\n", s);
    2952:	85ca                	mv	a1,s2
    2954:	00003517          	auipc	a0,0x3
    2958:	4ec50513          	addi	a0,a0,1260 # 5e40 <malloc+0x10dc>
    295c:	00002097          	auipc	ra,0x2
    2960:	350080e7          	jalr	848(ra) # 4cac <printf>
    exit(1);
    2964:	4505                	li	a0,1
    2966:	00002097          	auipc	ra,0x2
    296a:	f9e080e7          	jalr	-98(ra) # 4904 <exit>
    printf("%s: create dd/xx/ff succeeded!\n", s);
    296e:	85ca                	mv	a1,s2
    2970:	00003517          	auipc	a0,0x3
    2974:	50050513          	addi	a0,a0,1280 # 5e70 <malloc+0x110c>
    2978:	00002097          	auipc	ra,0x2
    297c:	334080e7          	jalr	820(ra) # 4cac <printf>
    exit(1);
    2980:	4505                	li	a0,1
    2982:	00002097          	auipc	ra,0x2
    2986:	f82080e7          	jalr	-126(ra) # 4904 <exit>
    printf("%s: create dd succeeded!\n", s);
    298a:	85ca                	mv	a1,s2
    298c:	00003517          	auipc	a0,0x3
    2990:	50450513          	addi	a0,a0,1284 # 5e90 <malloc+0x112c>
    2994:	00002097          	auipc	ra,0x2
    2998:	318080e7          	jalr	792(ra) # 4cac <printf>
    exit(1);
    299c:	4505                	li	a0,1
    299e:	00002097          	auipc	ra,0x2
    29a2:	f66080e7          	jalr	-154(ra) # 4904 <exit>
    printf("%s: open dd rdwr succeeded!\n", s);
    29a6:	85ca                	mv	a1,s2
    29a8:	00003517          	auipc	a0,0x3
    29ac:	50850513          	addi	a0,a0,1288 # 5eb0 <malloc+0x114c>
    29b0:	00002097          	auipc	ra,0x2
    29b4:	2fc080e7          	jalr	764(ra) # 4cac <printf>
    exit(1);
    29b8:	4505                	li	a0,1
    29ba:	00002097          	auipc	ra,0x2
    29be:	f4a080e7          	jalr	-182(ra) # 4904 <exit>
    printf("%s: open dd wronly succeeded!\n", s);
    29c2:	85ca                	mv	a1,s2
    29c4:	00003517          	auipc	a0,0x3
    29c8:	50c50513          	addi	a0,a0,1292 # 5ed0 <malloc+0x116c>
    29cc:	00002097          	auipc	ra,0x2
    29d0:	2e0080e7          	jalr	736(ra) # 4cac <printf>
    exit(1);
    29d4:	4505                	li	a0,1
    29d6:	00002097          	auipc	ra,0x2
    29da:	f2e080e7          	jalr	-210(ra) # 4904 <exit>
    printf("%s: remove dd/ff failed\n", s);
    29de:	85ca                	mv	a1,s2
    29e0:	00003517          	auipc	a0,0x3
    29e4:	51050513          	addi	a0,a0,1296 # 5ef0 <malloc+0x118c>
    29e8:	00002097          	auipc	ra,0x2
    29ec:	2c4080e7          	jalr	708(ra) # 4cac <printf>
    exit(1);
    29f0:	4505                	li	a0,1
    29f2:	00002097          	auipc	ra,0x2
    29f6:	f12080e7          	jalr	-238(ra) # 4904 <exit>
    printf("%s: remove non-empty dd succeeded!\n", s);
    29fa:	85ca                	mv	a1,s2
    29fc:	00003517          	auipc	a0,0x3
    2a00:	51450513          	addi	a0,a0,1300 # 5f10 <malloc+0x11ac>
    2a04:	00002097          	auipc	ra,0x2
    2a08:	2a8080e7          	jalr	680(ra) # 4cac <printf>
    exit(1);
    2a0c:	4505                	li	a0,1
    2a0e:	00002097          	auipc	ra,0x2
    2a12:	ef6080e7          	jalr	-266(ra) # 4904 <exit>
    printf("%s: remove dd/dd failed\n", s);
    2a16:	85ca                	mv	a1,s2
    2a18:	00003517          	auipc	a0,0x3
    2a1c:	52850513          	addi	a0,a0,1320 # 5f40 <malloc+0x11dc>
    2a20:	00002097          	auipc	ra,0x2
    2a24:	28c080e7          	jalr	652(ra) # 4cac <printf>
    exit(1);
    2a28:	4505                	li	a0,1
    2a2a:	00002097          	auipc	ra,0x2
    2a2e:	eda080e7          	jalr	-294(ra) # 4904 <exit>
    printf("%s: remove dd failed\n", s);
    2a32:	85ca                	mv	a1,s2
    2a34:	00003517          	auipc	a0,0x3
    2a38:	52c50513          	addi	a0,a0,1324 # 5f60 <malloc+0x11fc>
    2a3c:	00002097          	auipc	ra,0x2
    2a40:	270080e7          	jalr	624(ra) # 4cac <printf>
    exit(1);
    2a44:	4505                	li	a0,1
    2a46:	00002097          	auipc	ra,0x2
    2a4a:	ebe080e7          	jalr	-322(ra) # 4904 <exit>

0000000000002a4e <rmdot>:
{
    2a4e:	1101                	addi	sp,sp,-32
    2a50:	ec06                	sd	ra,24(sp)
    2a52:	e822                	sd	s0,16(sp)
    2a54:	e426                	sd	s1,8(sp)
    2a56:	1000                	addi	s0,sp,32
    2a58:	84aa                	mv	s1,a0
  if(mkdir("dots") != 0){
    2a5a:	00003517          	auipc	a0,0x3
    2a5e:	51e50513          	addi	a0,a0,1310 # 5f78 <malloc+0x1214>
    2a62:	00002097          	auipc	ra,0x2
    2a66:	ef8080e7          	jalr	-264(ra) # 495a <mkdir>
    2a6a:	e549                	bnez	a0,2af4 <rmdot+0xa6>
  if(chdir("dots") != 0){
    2a6c:	00003517          	auipc	a0,0x3
    2a70:	50c50513          	addi	a0,a0,1292 # 5f78 <malloc+0x1214>
    2a74:	00002097          	auipc	ra,0x2
    2a78:	eee080e7          	jalr	-274(ra) # 4962 <chdir>
    2a7c:	e951                	bnez	a0,2b10 <rmdot+0xc2>
  if(remove(".") == 0){
    2a7e:	00003517          	auipc	a0,0x3
    2a82:	53250513          	addi	a0,a0,1330 # 5fb0 <malloc+0x124c>
    2a86:	00002097          	auipc	ra,0x2
    2a8a:	f2e080e7          	jalr	-210(ra) # 49b4 <remove>
    2a8e:	cd59                	beqz	a0,2b2c <rmdot+0xde>
  if(remove("..") == 0){
    2a90:	00003517          	auipc	a0,0x3
    2a94:	54050513          	addi	a0,a0,1344 # 5fd0 <malloc+0x126c>
    2a98:	00002097          	auipc	ra,0x2
    2a9c:	f1c080e7          	jalr	-228(ra) # 49b4 <remove>
    2aa0:	c545                	beqz	a0,2b48 <rmdot+0xfa>
  if(chdir("/") != 0){
    2aa2:	00003517          	auipc	a0,0x3
    2aa6:	11650513          	addi	a0,a0,278 # 5bb8 <malloc+0xe54>
    2aaa:	00002097          	auipc	ra,0x2
    2aae:	eb8080e7          	jalr	-328(ra) # 4962 <chdir>
    2ab2:	e94d                	bnez	a0,2b64 <rmdot+0x116>
  if(remove("dots/.") == 0){
    2ab4:	00003517          	auipc	a0,0x3
    2ab8:	53c50513          	addi	a0,a0,1340 # 5ff0 <malloc+0x128c>
    2abc:	00002097          	auipc	ra,0x2
    2ac0:	ef8080e7          	jalr	-264(ra) # 49b4 <remove>
    2ac4:	cd55                	beqz	a0,2b80 <rmdot+0x132>
  if(remove("dots/..") == 0){
    2ac6:	00003517          	auipc	a0,0x3
    2aca:	55250513          	addi	a0,a0,1362 # 6018 <malloc+0x12b4>
    2ace:	00002097          	auipc	ra,0x2
    2ad2:	ee6080e7          	jalr	-282(ra) # 49b4 <remove>
    2ad6:	c179                	beqz	a0,2b9c <rmdot+0x14e>
  if(remove("dots") != 0){
    2ad8:	00003517          	auipc	a0,0x3
    2adc:	4a050513          	addi	a0,a0,1184 # 5f78 <malloc+0x1214>
    2ae0:	00002097          	auipc	ra,0x2
    2ae4:	ed4080e7          	jalr	-300(ra) # 49b4 <remove>
    2ae8:	e961                	bnez	a0,2bb8 <rmdot+0x16a>
}
    2aea:	60e2                	ld	ra,24(sp)
    2aec:	6442                	ld	s0,16(sp)
    2aee:	64a2                	ld	s1,8(sp)
    2af0:	6105                	addi	sp,sp,32
    2af2:	8082                	ret
    printf("%s: mkdir dots failed\n", s);
    2af4:	85a6                	mv	a1,s1
    2af6:	00003517          	auipc	a0,0x3
    2afa:	48a50513          	addi	a0,a0,1162 # 5f80 <malloc+0x121c>
    2afe:	00002097          	auipc	ra,0x2
    2b02:	1ae080e7          	jalr	430(ra) # 4cac <printf>
    exit(1);
    2b06:	4505                	li	a0,1
    2b08:	00002097          	auipc	ra,0x2
    2b0c:	dfc080e7          	jalr	-516(ra) # 4904 <exit>
    printf("%s: chdir dots failed\n", s);
    2b10:	85a6                	mv	a1,s1
    2b12:	00003517          	auipc	a0,0x3
    2b16:	48650513          	addi	a0,a0,1158 # 5f98 <malloc+0x1234>
    2b1a:	00002097          	auipc	ra,0x2
    2b1e:	192080e7          	jalr	402(ra) # 4cac <printf>
    exit(1);
    2b22:	4505                	li	a0,1
    2b24:	00002097          	auipc	ra,0x2
    2b28:	de0080e7          	jalr	-544(ra) # 4904 <exit>
    printf("%s: rm . worked!\n", s);
    2b2c:	85a6                	mv	a1,s1
    2b2e:	00003517          	auipc	a0,0x3
    2b32:	48a50513          	addi	a0,a0,1162 # 5fb8 <malloc+0x1254>
    2b36:	00002097          	auipc	ra,0x2
    2b3a:	176080e7          	jalr	374(ra) # 4cac <printf>
    exit(1);
    2b3e:	4505                	li	a0,1
    2b40:	00002097          	auipc	ra,0x2
    2b44:	dc4080e7          	jalr	-572(ra) # 4904 <exit>
    printf("%s: rm .. worked!\n", s);
    2b48:	85a6                	mv	a1,s1
    2b4a:	00003517          	auipc	a0,0x3
    2b4e:	48e50513          	addi	a0,a0,1166 # 5fd8 <malloc+0x1274>
    2b52:	00002097          	auipc	ra,0x2
    2b56:	15a080e7          	jalr	346(ra) # 4cac <printf>
    exit(1);
    2b5a:	4505                	li	a0,1
    2b5c:	00002097          	auipc	ra,0x2
    2b60:	da8080e7          	jalr	-600(ra) # 4904 <exit>
    printf("%s: chdir / failed\n", s);
    2b64:	85a6                	mv	a1,s1
    2b66:	00003517          	auipc	a0,0x3
    2b6a:	05a50513          	addi	a0,a0,90 # 5bc0 <malloc+0xe5c>
    2b6e:	00002097          	auipc	ra,0x2
    2b72:	13e080e7          	jalr	318(ra) # 4cac <printf>
    exit(1);
    2b76:	4505                	li	a0,1
    2b78:	00002097          	auipc	ra,0x2
    2b7c:	d8c080e7          	jalr	-628(ra) # 4904 <exit>
    printf("%s: remove dots/. worked!\n", s);
    2b80:	85a6                	mv	a1,s1
    2b82:	00003517          	auipc	a0,0x3
    2b86:	47650513          	addi	a0,a0,1142 # 5ff8 <malloc+0x1294>
    2b8a:	00002097          	auipc	ra,0x2
    2b8e:	122080e7          	jalr	290(ra) # 4cac <printf>
    exit(1);
    2b92:	4505                	li	a0,1
    2b94:	00002097          	auipc	ra,0x2
    2b98:	d70080e7          	jalr	-656(ra) # 4904 <exit>
    printf("%s: remove dots/.. worked!\n", s);
    2b9c:	85a6                	mv	a1,s1
    2b9e:	00003517          	auipc	a0,0x3
    2ba2:	48250513          	addi	a0,a0,1154 # 6020 <malloc+0x12bc>
    2ba6:	00002097          	auipc	ra,0x2
    2baa:	106080e7          	jalr	262(ra) # 4cac <printf>
    exit(1);
    2bae:	4505                	li	a0,1
    2bb0:	00002097          	auipc	ra,0x2
    2bb4:	d54080e7          	jalr	-684(ra) # 4904 <exit>
    printf("%s: remove dots failed!\n", s);
    2bb8:	85a6                	mv	a1,s1
    2bba:	00003517          	auipc	a0,0x3
    2bbe:	48650513          	addi	a0,a0,1158 # 6040 <malloc+0x12dc>
    2bc2:	00002097          	auipc	ra,0x2
    2bc6:	0ea080e7          	jalr	234(ra) # 4cac <printf>
    exit(1);
    2bca:	4505                	li	a0,1
    2bcc:	00002097          	auipc	ra,0x2
    2bd0:	d38080e7          	jalr	-712(ra) # 4904 <exit>

0000000000002bd4 <dirfile>:
{
    2bd4:	1101                	addi	sp,sp,-32
    2bd6:	ec06                	sd	ra,24(sp)
    2bd8:	e822                	sd	s0,16(sp)
    2bda:	e426                	sd	s1,8(sp)
    2bdc:	e04a                	sd	s2,0(sp)
    2bde:	1000                	addi	s0,sp,32
    2be0:	892a                	mv	s2,a0
  fd = open("dirfile", O_CREATE);
    2be2:	20000593          	li	a1,512
    2be6:	00003517          	auipc	a0,0x3
    2bea:	47a50513          	addi	a0,a0,1146 # 6060 <malloc+0x12fc>
    2bee:	00002097          	auipc	ra,0x2
    2bf2:	d5c080e7          	jalr	-676(ra) # 494a <open>
  if(fd < 0){
    2bf6:	0c054d63          	bltz	a0,2cd0 <dirfile+0xfc>
  close(fd);
    2bfa:	00002097          	auipc	ra,0x2
    2bfe:	d36080e7          	jalr	-714(ra) # 4930 <close>
  if(chdir("dirfile") == 0){
    2c02:	00003517          	auipc	a0,0x3
    2c06:	45e50513          	addi	a0,a0,1118 # 6060 <malloc+0x12fc>
    2c0a:	00002097          	auipc	ra,0x2
    2c0e:	d58080e7          	jalr	-680(ra) # 4962 <chdir>
    2c12:	cd69                	beqz	a0,2cec <dirfile+0x118>
  fd = open("dirfile/xx", 0);
    2c14:	4581                	li	a1,0
    2c16:	00003517          	auipc	a0,0x3
    2c1a:	49250513          	addi	a0,a0,1170 # 60a8 <malloc+0x1344>
    2c1e:	00002097          	auipc	ra,0x2
    2c22:	d2c080e7          	jalr	-724(ra) # 494a <open>
  if(fd >= 0){
    2c26:	0e055163          	bgez	a0,2d08 <dirfile+0x134>
  fd = open("dirfile/xx", O_CREATE);
    2c2a:	20000593          	li	a1,512
    2c2e:	00003517          	auipc	a0,0x3
    2c32:	47a50513          	addi	a0,a0,1146 # 60a8 <malloc+0x1344>
    2c36:	00002097          	auipc	ra,0x2
    2c3a:	d14080e7          	jalr	-748(ra) # 494a <open>
  if(fd >= 0){
    2c3e:	0e055363          	bgez	a0,2d24 <dirfile+0x150>
  if(mkdir("dirfile/xx") == 0){
    2c42:	00003517          	auipc	a0,0x3
    2c46:	46650513          	addi	a0,a0,1126 # 60a8 <malloc+0x1344>
    2c4a:	00002097          	auipc	ra,0x2
    2c4e:	d10080e7          	jalr	-752(ra) # 495a <mkdir>
    2c52:	c57d                	beqz	a0,2d40 <dirfile+0x16c>
  if(remove("dirfile/xx") == 0){
    2c54:	00003517          	auipc	a0,0x3
    2c58:	45450513          	addi	a0,a0,1108 # 60a8 <malloc+0x1344>
    2c5c:	00002097          	auipc	ra,0x2
    2c60:	d58080e7          	jalr	-680(ra) # 49b4 <remove>
    2c64:	cd65                	beqz	a0,2d5c <dirfile+0x188>
  if(remove("dirfile") != 0){
    2c66:	00003517          	auipc	a0,0x3
    2c6a:	3fa50513          	addi	a0,a0,1018 # 6060 <malloc+0x12fc>
    2c6e:	00002097          	auipc	ra,0x2
    2c72:	d46080e7          	jalr	-698(ra) # 49b4 <remove>
    2c76:	10051163          	bnez	a0,2d78 <dirfile+0x1a4>
  fd = open(".", O_RDWR);
    2c7a:	4589                	li	a1,2
    2c7c:	00003517          	auipc	a0,0x3
    2c80:	33450513          	addi	a0,a0,820 # 5fb0 <malloc+0x124c>
    2c84:	00002097          	auipc	ra,0x2
    2c88:	cc6080e7          	jalr	-826(ra) # 494a <open>
  if(fd >= 0){
    2c8c:	10055463          	bgez	a0,2d94 <dirfile+0x1c0>
  fd = open(".", 0);
    2c90:	4581                	li	a1,0
    2c92:	00003517          	auipc	a0,0x3
    2c96:	31e50513          	addi	a0,a0,798 # 5fb0 <malloc+0x124c>
    2c9a:	00002097          	auipc	ra,0x2
    2c9e:	cb0080e7          	jalr	-848(ra) # 494a <open>
    2ca2:	84aa                	mv	s1,a0
  if(write(fd, "x", 1) > 0){
    2ca4:	4605                	li	a2,1
    2ca6:	00002597          	auipc	a1,0x2
    2caa:	28a58593          	addi	a1,a1,650 # 4f30 <malloc+0x1cc>
    2cae:	00002097          	auipc	ra,0x2
    2cb2:	c78080e7          	jalr	-904(ra) # 4926 <write>
    2cb6:	0ea04d63          	bgtz	a0,2db0 <dirfile+0x1dc>
  close(fd);
    2cba:	8526                	mv	a0,s1
    2cbc:	00002097          	auipc	ra,0x2
    2cc0:	c74080e7          	jalr	-908(ra) # 4930 <close>
}
    2cc4:	60e2                	ld	ra,24(sp)
    2cc6:	6442                	ld	s0,16(sp)
    2cc8:	64a2                	ld	s1,8(sp)
    2cca:	6902                	ld	s2,0(sp)
    2ccc:	6105                	addi	sp,sp,32
    2cce:	8082                	ret
    printf("%s: create dirfile failed\n", s);
    2cd0:	85ca                	mv	a1,s2
    2cd2:	00003517          	auipc	a0,0x3
    2cd6:	39650513          	addi	a0,a0,918 # 6068 <malloc+0x1304>
    2cda:	00002097          	auipc	ra,0x2
    2cde:	fd2080e7          	jalr	-46(ra) # 4cac <printf>
    exit(1);
    2ce2:	4505                	li	a0,1
    2ce4:	00002097          	auipc	ra,0x2
    2ce8:	c20080e7          	jalr	-992(ra) # 4904 <exit>
    printf("%s: chdir dirfile succeeded!\n", s);
    2cec:	85ca                	mv	a1,s2
    2cee:	00003517          	auipc	a0,0x3
    2cf2:	39a50513          	addi	a0,a0,922 # 6088 <malloc+0x1324>
    2cf6:	00002097          	auipc	ra,0x2
    2cfa:	fb6080e7          	jalr	-74(ra) # 4cac <printf>
    exit(1);
    2cfe:	4505                	li	a0,1
    2d00:	00002097          	auipc	ra,0x2
    2d04:	c04080e7          	jalr	-1020(ra) # 4904 <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    2d08:	85ca                	mv	a1,s2
    2d0a:	00003517          	auipc	a0,0x3
    2d0e:	3ae50513          	addi	a0,a0,942 # 60b8 <malloc+0x1354>
    2d12:	00002097          	auipc	ra,0x2
    2d16:	f9a080e7          	jalr	-102(ra) # 4cac <printf>
    exit(1);
    2d1a:	4505                	li	a0,1
    2d1c:	00002097          	auipc	ra,0x2
    2d20:	be8080e7          	jalr	-1048(ra) # 4904 <exit>
    printf("%s: create dirfile/xx succeeded!\n", s);
    2d24:	85ca                	mv	a1,s2
    2d26:	00003517          	auipc	a0,0x3
    2d2a:	39250513          	addi	a0,a0,914 # 60b8 <malloc+0x1354>
    2d2e:	00002097          	auipc	ra,0x2
    2d32:	f7e080e7          	jalr	-130(ra) # 4cac <printf>
    exit(1);
    2d36:	4505                	li	a0,1
    2d38:	00002097          	auipc	ra,0x2
    2d3c:	bcc080e7          	jalr	-1076(ra) # 4904 <exit>
    printf("%s: mkdir dirfile/xx succeeded!\n", s);
    2d40:	85ca                	mv	a1,s2
    2d42:	00003517          	auipc	a0,0x3
    2d46:	39e50513          	addi	a0,a0,926 # 60e0 <malloc+0x137c>
    2d4a:	00002097          	auipc	ra,0x2
    2d4e:	f62080e7          	jalr	-158(ra) # 4cac <printf>
    exit(1);
    2d52:	4505                	li	a0,1
    2d54:	00002097          	auipc	ra,0x2
    2d58:	bb0080e7          	jalr	-1104(ra) # 4904 <exit>
    printf("%s: remove dirfile/xx succeeded!\n", s);
    2d5c:	85ca                	mv	a1,s2
    2d5e:	00003517          	auipc	a0,0x3
    2d62:	3aa50513          	addi	a0,a0,938 # 6108 <malloc+0x13a4>
    2d66:	00002097          	auipc	ra,0x2
    2d6a:	f46080e7          	jalr	-186(ra) # 4cac <printf>
    exit(1);
    2d6e:	4505                	li	a0,1
    2d70:	00002097          	auipc	ra,0x2
    2d74:	b94080e7          	jalr	-1132(ra) # 4904 <exit>
    printf("%s: remove dirfile failed!\n", s);
    2d78:	85ca                	mv	a1,s2
    2d7a:	00003517          	auipc	a0,0x3
    2d7e:	3b650513          	addi	a0,a0,950 # 6130 <malloc+0x13cc>
    2d82:	00002097          	auipc	ra,0x2
    2d86:	f2a080e7          	jalr	-214(ra) # 4cac <printf>
    exit(1);
    2d8a:	4505                	li	a0,1
    2d8c:	00002097          	auipc	ra,0x2
    2d90:	b78080e7          	jalr	-1160(ra) # 4904 <exit>
    printf("%s: open . for writing succeeded!\n", s);
    2d94:	85ca                	mv	a1,s2
    2d96:	00003517          	auipc	a0,0x3
    2d9a:	3ba50513          	addi	a0,a0,954 # 6150 <malloc+0x13ec>
    2d9e:	00002097          	auipc	ra,0x2
    2da2:	f0e080e7          	jalr	-242(ra) # 4cac <printf>
    exit(1);
    2da6:	4505                	li	a0,1
    2da8:	00002097          	auipc	ra,0x2
    2dac:	b5c080e7          	jalr	-1188(ra) # 4904 <exit>
    printf("%s: write . succeeded!\n", s);
    2db0:	85ca                	mv	a1,s2
    2db2:	00003517          	auipc	a0,0x3
    2db6:	3c650513          	addi	a0,a0,966 # 6178 <malloc+0x1414>
    2dba:	00002097          	auipc	ra,0x2
    2dbe:	ef2080e7          	jalr	-270(ra) # 4cac <printf>
    exit(1);
    2dc2:	4505                	li	a0,1
    2dc4:	00002097          	auipc	ra,0x2
    2dc8:	b40080e7          	jalr	-1216(ra) # 4904 <exit>

0000000000002dcc <iref>:
{
    2dcc:	7139                	addi	sp,sp,-64
    2dce:	fc06                	sd	ra,56(sp)
    2dd0:	f822                	sd	s0,48(sp)
    2dd2:	f426                	sd	s1,40(sp)
    2dd4:	f04a                	sd	s2,32(sp)
    2dd6:	ec4e                	sd	s3,24(sp)
    2dd8:	e852                	sd	s4,16(sp)
    2dda:	e456                	sd	s5,8(sp)
    2ddc:	0080                	addi	s0,sp,64
    2dde:	8aaa                	mv	s5,a0
    2de0:	02e00493          	li	s1,46
    if(mkdir("irefd") != 0){
    2de4:	00003917          	auipc	s2,0x3
    2de8:	3ac90913          	addi	s2,s2,940 # 6190 <malloc+0x142c>
    mkdir("");
    2dec:	00003a17          	auipc	s4,0x3
    2df0:	03ca0a13          	addi	s4,s4,60 # 5e28 <malloc+0x10c4>
    fd = open("xx", O_CREATE);
    2df4:	00003997          	auipc	s3,0x3
    2df8:	2bc98993          	addi	s3,s3,700 # 60b0 <malloc+0x134c>
    2dfc:	a889                	j	2e4e <iref+0x82>
      printf("%s: mkdir irefd failed\n", s);
    2dfe:	85d6                	mv	a1,s5
    2e00:	00003517          	auipc	a0,0x3
    2e04:	39850513          	addi	a0,a0,920 # 6198 <malloc+0x1434>
    2e08:	00002097          	auipc	ra,0x2
    2e0c:	ea4080e7          	jalr	-348(ra) # 4cac <printf>
      exit(1);
    2e10:	4505                	li	a0,1
    2e12:	00002097          	auipc	ra,0x2
    2e16:	af2080e7          	jalr	-1294(ra) # 4904 <exit>
      printf("%s: chdir irefd failed\n", s);
    2e1a:	85d6                	mv	a1,s5
    2e1c:	00003517          	auipc	a0,0x3
    2e20:	39450513          	addi	a0,a0,916 # 61b0 <malloc+0x144c>
    2e24:	00002097          	auipc	ra,0x2
    2e28:	e88080e7          	jalr	-376(ra) # 4cac <printf>
      exit(1);
    2e2c:	4505                	li	a0,1
    2e2e:	00002097          	auipc	ra,0x2
    2e32:	ad6080e7          	jalr	-1322(ra) # 4904 <exit>
      close(fd);
    2e36:	00002097          	auipc	ra,0x2
    2e3a:	afa080e7          	jalr	-1286(ra) # 4930 <close>
    2e3e:	a091                	j	2e82 <iref+0xb6>
    remove("xx");
    2e40:	854e                	mv	a0,s3
    2e42:	00002097          	auipc	ra,0x2
    2e46:	b72080e7          	jalr	-1166(ra) # 49b4 <remove>
  for(i = 0; i < NINODE - 4; i++){
    2e4a:	34fd                	addiw	s1,s1,-1
    2e4c:	c8a9                	beqz	s1,2e9e <iref+0xd2>
    if(mkdir("irefd") != 0){
    2e4e:	854a                	mv	a0,s2
    2e50:	00002097          	auipc	ra,0x2
    2e54:	b0a080e7          	jalr	-1270(ra) # 495a <mkdir>
    2e58:	f15d                	bnez	a0,2dfe <iref+0x32>
    if(chdir("irefd") != 0){
    2e5a:	854a                	mv	a0,s2
    2e5c:	00002097          	auipc	ra,0x2
    2e60:	b06080e7          	jalr	-1274(ra) # 4962 <chdir>
    2e64:	f95d                	bnez	a0,2e1a <iref+0x4e>
    mkdir("");
    2e66:	8552                	mv	a0,s4
    2e68:	00002097          	auipc	ra,0x2
    2e6c:	af2080e7          	jalr	-1294(ra) # 495a <mkdir>
    fd = open("", O_CREATE);
    2e70:	20000593          	li	a1,512
    2e74:	8552                	mv	a0,s4
    2e76:	00002097          	auipc	ra,0x2
    2e7a:	ad4080e7          	jalr	-1324(ra) # 494a <open>
    if(fd >= 0)
    2e7e:	fa055ce3          	bgez	a0,2e36 <iref+0x6a>
    fd = open("xx", O_CREATE);
    2e82:	20000593          	li	a1,512
    2e86:	854e                	mv	a0,s3
    2e88:	00002097          	auipc	ra,0x2
    2e8c:	ac2080e7          	jalr	-1342(ra) # 494a <open>
    if(fd >= 0)
    2e90:	fa0548e3          	bltz	a0,2e40 <iref+0x74>
      close(fd);
    2e94:	00002097          	auipc	ra,0x2
    2e98:	a9c080e7          	jalr	-1380(ra) # 4930 <close>
    2e9c:	b755                	j	2e40 <iref+0x74>
    2e9e:	03300493          	li	s1,51
    chdir("..");
    2ea2:	00003997          	auipc	s3,0x3
    2ea6:	12e98993          	addi	s3,s3,302 # 5fd0 <malloc+0x126c>
    remove("irefd");
    2eaa:	00003917          	auipc	s2,0x3
    2eae:	2e690913          	addi	s2,s2,742 # 6190 <malloc+0x142c>
    chdir("..");
    2eb2:	854e                	mv	a0,s3
    2eb4:	00002097          	auipc	ra,0x2
    2eb8:	aae080e7          	jalr	-1362(ra) # 4962 <chdir>
    remove("irefd");
    2ebc:	854a                	mv	a0,s2
    2ebe:	00002097          	auipc	ra,0x2
    2ec2:	af6080e7          	jalr	-1290(ra) # 49b4 <remove>
  for(i = 0; i < NINODE + 1; i++){
    2ec6:	34fd                	addiw	s1,s1,-1
    2ec8:	f4ed                	bnez	s1,2eb2 <iref+0xe6>
  chdir("/");
    2eca:	00003517          	auipc	a0,0x3
    2ece:	cee50513          	addi	a0,a0,-786 # 5bb8 <malloc+0xe54>
    2ed2:	00002097          	auipc	ra,0x2
    2ed6:	a90080e7          	jalr	-1392(ra) # 4962 <chdir>
}
    2eda:	70e2                	ld	ra,56(sp)
    2edc:	7442                	ld	s0,48(sp)
    2ede:	74a2                	ld	s1,40(sp)
    2ee0:	7902                	ld	s2,32(sp)
    2ee2:	69e2                	ld	s3,24(sp)
    2ee4:	6a42                	ld	s4,16(sp)
    2ee6:	6aa2                	ld	s5,8(sp)
    2ee8:	6121                	addi	sp,sp,64
    2eea:	8082                	ret

0000000000002eec <openiputtest>:
{
    2eec:	7179                	addi	sp,sp,-48
    2eee:	f406                	sd	ra,40(sp)
    2ef0:	f022                	sd	s0,32(sp)
    2ef2:	ec26                	sd	s1,24(sp)
    2ef4:	1800                	addi	s0,sp,48
    2ef6:	84aa                	mv	s1,a0
  if(mkdir("oidir") < 0){
    2ef8:	00003517          	auipc	a0,0x3
    2efc:	2d050513          	addi	a0,a0,720 # 61c8 <malloc+0x1464>
    2f00:	00002097          	auipc	ra,0x2
    2f04:	a5a080e7          	jalr	-1446(ra) # 495a <mkdir>
    2f08:	04054263          	bltz	a0,2f4c <openiputtest+0x60>
  pid = fork();
    2f0c:	00002097          	auipc	ra,0x2
    2f10:	9f0080e7          	jalr	-1552(ra) # 48fc <fork>
  if(pid < 0){
    2f14:	04054a63          	bltz	a0,2f68 <openiputtest+0x7c>
  if(pid == 0){
    2f18:	e93d                	bnez	a0,2f8e <openiputtest+0xa2>
    int fd = open("oidir", O_RDWR);
    2f1a:	4589                	li	a1,2
    2f1c:	00003517          	auipc	a0,0x3
    2f20:	2ac50513          	addi	a0,a0,684 # 61c8 <malloc+0x1464>
    2f24:	00002097          	auipc	ra,0x2
    2f28:	a26080e7          	jalr	-1498(ra) # 494a <open>
    if(fd >= 0){
    2f2c:	04054c63          	bltz	a0,2f84 <openiputtest+0x98>
      printf("%s: open directory for write succeeded\n", s);
    2f30:	85a6                	mv	a1,s1
    2f32:	00003517          	auipc	a0,0x3
    2f36:	2b650513          	addi	a0,a0,694 # 61e8 <malloc+0x1484>
    2f3a:	00002097          	auipc	ra,0x2
    2f3e:	d72080e7          	jalr	-654(ra) # 4cac <printf>
      exit(1);
    2f42:	4505                	li	a0,1
    2f44:	00002097          	auipc	ra,0x2
    2f48:	9c0080e7          	jalr	-1600(ra) # 4904 <exit>
    printf("%s: mkdir oidir failed\n", s);
    2f4c:	85a6                	mv	a1,s1
    2f4e:	00003517          	auipc	a0,0x3
    2f52:	28250513          	addi	a0,a0,642 # 61d0 <malloc+0x146c>
    2f56:	00002097          	auipc	ra,0x2
    2f5a:	d56080e7          	jalr	-682(ra) # 4cac <printf>
    exit(1);
    2f5e:	4505                	li	a0,1
    2f60:	00002097          	auipc	ra,0x2
    2f64:	9a4080e7          	jalr	-1628(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    2f68:	85a6                	mv	a1,s1
    2f6a:	00002517          	auipc	a0,0x2
    2f6e:	5e650513          	addi	a0,a0,1510 # 5550 <malloc+0x7ec>
    2f72:	00002097          	auipc	ra,0x2
    2f76:	d3a080e7          	jalr	-710(ra) # 4cac <printf>
    exit(1);
    2f7a:	4505                	li	a0,1
    2f7c:	00002097          	auipc	ra,0x2
    2f80:	988080e7          	jalr	-1656(ra) # 4904 <exit>
    exit(0);
    2f84:	4501                	li	a0,0
    2f86:	00002097          	auipc	ra,0x2
    2f8a:	97e080e7          	jalr	-1666(ra) # 4904 <exit>
  sleep(1);
    2f8e:	4505                	li	a0,1
    2f90:	00002097          	auipc	ra,0x2
    2f94:	9f4080e7          	jalr	-1548(ra) # 4984 <sleep>
  if(remove("oidir") != 0){
    2f98:	00003517          	auipc	a0,0x3
    2f9c:	23050513          	addi	a0,a0,560 # 61c8 <malloc+0x1464>
    2fa0:	00002097          	auipc	ra,0x2
    2fa4:	a14080e7          	jalr	-1516(ra) # 49b4 <remove>
    2fa8:	cd19                	beqz	a0,2fc6 <openiputtest+0xda>
    printf("%s: remove failed\n", s);
    2faa:	85a6                	mv	a1,s1
    2fac:	00003517          	auipc	a0,0x3
    2fb0:	26450513          	addi	a0,a0,612 # 6210 <malloc+0x14ac>
    2fb4:	00002097          	auipc	ra,0x2
    2fb8:	cf8080e7          	jalr	-776(ra) # 4cac <printf>
    exit(1);
    2fbc:	4505                	li	a0,1
    2fbe:	00002097          	auipc	ra,0x2
    2fc2:	946080e7          	jalr	-1722(ra) # 4904 <exit>
  wait(&xstatus);
    2fc6:	fdc40513          	addi	a0,s0,-36
    2fca:	00002097          	auipc	ra,0x2
    2fce:	944080e7          	jalr	-1724(ra) # 490e <wait>
  exit(xstatus);
    2fd2:	fdc42503          	lw	a0,-36(s0)
    2fd6:	00002097          	auipc	ra,0x2
    2fda:	92e080e7          	jalr	-1746(ra) # 4904 <exit>

0000000000002fde <forkforkfork>:
{
    2fde:	1101                	addi	sp,sp,-32
    2fe0:	ec06                	sd	ra,24(sp)
    2fe2:	e822                	sd	s0,16(sp)
    2fe4:	e426                	sd	s1,8(sp)
    2fe6:	1000                	addi	s0,sp,32
    2fe8:	84aa                	mv	s1,a0
  remove("stopforking");
    2fea:	00003517          	auipc	a0,0x3
    2fee:	23e50513          	addi	a0,a0,574 # 6228 <malloc+0x14c4>
    2ff2:	00002097          	auipc	ra,0x2
    2ff6:	9c2080e7          	jalr	-1598(ra) # 49b4 <remove>
  int pid = fork();
    2ffa:	00002097          	auipc	ra,0x2
    2ffe:	902080e7          	jalr	-1790(ra) # 48fc <fork>
  if(pid < 0){
    3002:	04054d63          	bltz	a0,305c <forkforkfork+0x7e>
  if(pid == 0){
    3006:	c92d                	beqz	a0,3078 <forkforkfork+0x9a>
  sleep(20); // two seconds
    3008:	4551                	li	a0,20
    300a:	00002097          	auipc	ra,0x2
    300e:	97a080e7          	jalr	-1670(ra) # 4984 <sleep>
  close(open("stopforking", O_CREATE|O_RDWR));
    3012:	20200593          	li	a1,514
    3016:	00003517          	auipc	a0,0x3
    301a:	21250513          	addi	a0,a0,530 # 6228 <malloc+0x14c4>
    301e:	00002097          	auipc	ra,0x2
    3022:	92c080e7          	jalr	-1748(ra) # 494a <open>
    3026:	00002097          	auipc	ra,0x2
    302a:	90a080e7          	jalr	-1782(ra) # 4930 <close>
  wait(0);
    302e:	4501                	li	a0,0
    3030:	00002097          	auipc	ra,0x2
    3034:	8de080e7          	jalr	-1826(ra) # 490e <wait>
  sleep(10); // one second
    3038:	4529                	li	a0,10
    303a:	00002097          	auipc	ra,0x2
    303e:	94a080e7          	jalr	-1718(ra) # 4984 <sleep>
  remove("stopforking");
    3042:	00003517          	auipc	a0,0x3
    3046:	1e650513          	addi	a0,a0,486 # 6228 <malloc+0x14c4>
    304a:	00002097          	auipc	ra,0x2
    304e:	96a080e7          	jalr	-1686(ra) # 49b4 <remove>
}
    3052:	60e2                	ld	ra,24(sp)
    3054:	6442                	ld	s0,16(sp)
    3056:	64a2                	ld	s1,8(sp)
    3058:	6105                	addi	sp,sp,32
    305a:	8082                	ret
    printf("%s: fork failed", s);
    305c:	85a6                	mv	a1,s1
    305e:	00002517          	auipc	a0,0x2
    3062:	6b250513          	addi	a0,a0,1714 # 5710 <malloc+0x9ac>
    3066:	00002097          	auipc	ra,0x2
    306a:	c46080e7          	jalr	-954(ra) # 4cac <printf>
    exit(1);
    306e:	4505                	li	a0,1
    3070:	00002097          	auipc	ra,0x2
    3074:	894080e7          	jalr	-1900(ra) # 4904 <exit>
      int fd = open("stopforking", 0);
    3078:	00003497          	auipc	s1,0x3
    307c:	1b048493          	addi	s1,s1,432 # 6228 <malloc+0x14c4>
    3080:	4581                	li	a1,0
    3082:	8526                	mv	a0,s1
    3084:	00002097          	auipc	ra,0x2
    3088:	8c6080e7          	jalr	-1850(ra) # 494a <open>
      if(fd >= 0){
    308c:	02055463          	bgez	a0,30b4 <forkforkfork+0xd6>
      if(fork() < 0){
    3090:	00002097          	auipc	ra,0x2
    3094:	86c080e7          	jalr	-1940(ra) # 48fc <fork>
    3098:	fe0554e3          	bgez	a0,3080 <forkforkfork+0xa2>
        close(open("stopforking", O_CREATE|O_RDWR));
    309c:	20200593          	li	a1,514
    30a0:	8526                	mv	a0,s1
    30a2:	00002097          	auipc	ra,0x2
    30a6:	8a8080e7          	jalr	-1880(ra) # 494a <open>
    30aa:	00002097          	auipc	ra,0x2
    30ae:	886080e7          	jalr	-1914(ra) # 4930 <close>
    30b2:	b7f9                	j	3080 <forkforkfork+0xa2>
        exit(0);
    30b4:	4501                	li	a0,0
    30b6:	00002097          	auipc	ra,0x2
    30ba:	84e080e7          	jalr	-1970(ra) # 4904 <exit>

00000000000030be <preempt>:
{
    30be:	7139                	addi	sp,sp,-64
    30c0:	fc06                	sd	ra,56(sp)
    30c2:	f822                	sd	s0,48(sp)
    30c4:	f426                	sd	s1,40(sp)
    30c6:	f04a                	sd	s2,32(sp)
    30c8:	ec4e                	sd	s3,24(sp)
    30ca:	e852                	sd	s4,16(sp)
    30cc:	0080                	addi	s0,sp,64
    30ce:	892a                	mv	s2,a0
  pid1 = fork();
    30d0:	00002097          	auipc	ra,0x2
    30d4:	82c080e7          	jalr	-2004(ra) # 48fc <fork>
  if(pid1 < 0) {
    30d8:	00054563          	bltz	a0,30e2 <preempt+0x24>
    30dc:	84aa                	mv	s1,a0
  if(pid1 == 0)
    30de:	ed19                	bnez	a0,30fc <preempt+0x3e>
    for(;;)
    30e0:	a001                	j	30e0 <preempt+0x22>
    printf("%s: fork failed");
    30e2:	00002517          	auipc	a0,0x2
    30e6:	62e50513          	addi	a0,a0,1582 # 5710 <malloc+0x9ac>
    30ea:	00002097          	auipc	ra,0x2
    30ee:	bc2080e7          	jalr	-1086(ra) # 4cac <printf>
    exit(1);
    30f2:	4505                	li	a0,1
    30f4:	00002097          	auipc	ra,0x2
    30f8:	810080e7          	jalr	-2032(ra) # 4904 <exit>
  pid2 = fork();
    30fc:	00002097          	auipc	ra,0x2
    3100:	800080e7          	jalr	-2048(ra) # 48fc <fork>
    3104:	89aa                	mv	s3,a0
  if(pid2 < 0) {
    3106:	00054463          	bltz	a0,310e <preempt+0x50>
  if(pid2 == 0)
    310a:	e105                	bnez	a0,312a <preempt+0x6c>
    for(;;)
    310c:	a001                	j	310c <preempt+0x4e>
    printf("%s: fork failed\n", s);
    310e:	85ca                	mv	a1,s2
    3110:	00002517          	auipc	a0,0x2
    3114:	44050513          	addi	a0,a0,1088 # 5550 <malloc+0x7ec>
    3118:	00002097          	auipc	ra,0x2
    311c:	b94080e7          	jalr	-1132(ra) # 4cac <printf>
    exit(1);
    3120:	4505                	li	a0,1
    3122:	00001097          	auipc	ra,0x1
    3126:	7e2080e7          	jalr	2018(ra) # 4904 <exit>
  pipe(pfds);
    312a:	fc840513          	addi	a0,s0,-56
    312e:	00001097          	auipc	ra,0x1
    3132:	7e8080e7          	jalr	2024(ra) # 4916 <pipe>
  pid3 = fork();
    3136:	00001097          	auipc	ra,0x1
    313a:	7c6080e7          	jalr	1990(ra) # 48fc <fork>
    313e:	8a2a                	mv	s4,a0
  if(pid3 < 0) {
    3140:	02054e63          	bltz	a0,317c <preempt+0xbe>
  if(pid3 == 0){
    3144:	e13d                	bnez	a0,31aa <preempt+0xec>
    close(pfds[0]);
    3146:	fc842503          	lw	a0,-56(s0)
    314a:	00001097          	auipc	ra,0x1
    314e:	7e6080e7          	jalr	2022(ra) # 4930 <close>
    if(write(pfds[1], "x", 1) != 1)
    3152:	4605                	li	a2,1
    3154:	00002597          	auipc	a1,0x2
    3158:	ddc58593          	addi	a1,a1,-548 # 4f30 <malloc+0x1cc>
    315c:	fcc42503          	lw	a0,-52(s0)
    3160:	00001097          	auipc	ra,0x1
    3164:	7c6080e7          	jalr	1990(ra) # 4926 <write>
    3168:	4785                	li	a5,1
    316a:	02f51763          	bne	a0,a5,3198 <preempt+0xda>
    close(pfds[1]);
    316e:	fcc42503          	lw	a0,-52(s0)
    3172:	00001097          	auipc	ra,0x1
    3176:	7be080e7          	jalr	1982(ra) # 4930 <close>
    for(;;)
    317a:	a001                	j	317a <preempt+0xbc>
     printf("%s: fork failed\n", s);
    317c:	85ca                	mv	a1,s2
    317e:	00002517          	auipc	a0,0x2
    3182:	3d250513          	addi	a0,a0,978 # 5550 <malloc+0x7ec>
    3186:	00002097          	auipc	ra,0x2
    318a:	b26080e7          	jalr	-1242(ra) # 4cac <printf>
     exit(1);
    318e:	4505                	li	a0,1
    3190:	00001097          	auipc	ra,0x1
    3194:	774080e7          	jalr	1908(ra) # 4904 <exit>
      printf("%s: preempt write error");
    3198:	00003517          	auipc	a0,0x3
    319c:	0a050513          	addi	a0,a0,160 # 6238 <malloc+0x14d4>
    31a0:	00002097          	auipc	ra,0x2
    31a4:	b0c080e7          	jalr	-1268(ra) # 4cac <printf>
    31a8:	b7d9                	j	316e <preempt+0xb0>
  close(pfds[1]);
    31aa:	fcc42503          	lw	a0,-52(s0)
    31ae:	00001097          	auipc	ra,0x1
    31b2:	782080e7          	jalr	1922(ra) # 4930 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    31b6:	6609                	lui	a2,0x2
    31b8:	80060613          	addi	a2,a2,-2048 # 1800 <forkfork+0x42>
    31bc:	00007597          	auipc	a1,0x7
    31c0:	6bc58593          	addi	a1,a1,1724 # a878 <buf>
    31c4:	fc842503          	lw	a0,-56(s0)
    31c8:	00001097          	auipc	ra,0x1
    31cc:	756080e7          	jalr	1878(ra) # 491e <read>
    31d0:	4785                	li	a5,1
    31d2:	02f50263          	beq	a0,a5,31f6 <preempt+0x138>
    printf("%s: preempt read error");
    31d6:	00003517          	auipc	a0,0x3
    31da:	07a50513          	addi	a0,a0,122 # 6250 <malloc+0x14ec>
    31de:	00002097          	auipc	ra,0x2
    31e2:	ace080e7          	jalr	-1330(ra) # 4cac <printf>
}
    31e6:	70e2                	ld	ra,56(sp)
    31e8:	7442                	ld	s0,48(sp)
    31ea:	74a2                	ld	s1,40(sp)
    31ec:	7902                	ld	s2,32(sp)
    31ee:	69e2                	ld	s3,24(sp)
    31f0:	6a42                	ld	s4,16(sp)
    31f2:	6121                	addi	sp,sp,64
    31f4:	8082                	ret
  close(pfds[0]);
    31f6:	fc842503          	lw	a0,-56(s0)
    31fa:	00001097          	auipc	ra,0x1
    31fe:	736080e7          	jalr	1846(ra) # 4930 <close>
  printf("kill... ");
    3202:	00003517          	auipc	a0,0x3
    3206:	06650513          	addi	a0,a0,102 # 6268 <malloc+0x1504>
    320a:	00002097          	auipc	ra,0x2
    320e:	aa2080e7          	jalr	-1374(ra) # 4cac <printf>
  kill(pid1);
    3212:	8526                	mv	a0,s1
    3214:	00001097          	auipc	ra,0x1
    3218:	724080e7          	jalr	1828(ra) # 4938 <kill>
  kill(pid2);
    321c:	854e                	mv	a0,s3
    321e:	00001097          	auipc	ra,0x1
    3222:	71a080e7          	jalr	1818(ra) # 4938 <kill>
  kill(pid3);
    3226:	8552                	mv	a0,s4
    3228:	00001097          	auipc	ra,0x1
    322c:	710080e7          	jalr	1808(ra) # 4938 <kill>
  printf("wait... ");
    3230:	00003517          	auipc	a0,0x3
    3234:	04850513          	addi	a0,a0,72 # 6278 <malloc+0x1514>
    3238:	00002097          	auipc	ra,0x2
    323c:	a74080e7          	jalr	-1420(ra) # 4cac <printf>
  wait(0);
    3240:	4501                	li	a0,0
    3242:	00001097          	auipc	ra,0x1
    3246:	6cc080e7          	jalr	1740(ra) # 490e <wait>
  wait(0);
    324a:	4501                	li	a0,0
    324c:	00001097          	auipc	ra,0x1
    3250:	6c2080e7          	jalr	1730(ra) # 490e <wait>
  wait(0);
    3254:	4501                	li	a0,0
    3256:	00001097          	auipc	ra,0x1
    325a:	6b8080e7          	jalr	1720(ra) # 490e <wait>
    325e:	b761                	j	31e6 <preempt+0x128>

0000000000003260 <sbrkfail>:
{
    3260:	7119                	addi	sp,sp,-128
    3262:	fc86                	sd	ra,120(sp)
    3264:	f8a2                	sd	s0,112(sp)
    3266:	f4a6                	sd	s1,104(sp)
    3268:	f0ca                	sd	s2,96(sp)
    326a:	ecce                	sd	s3,88(sp)
    326c:	e8d2                	sd	s4,80(sp)
    326e:	e4d6                	sd	s5,72(sp)
    3270:	e0da                	sd	s6,64(sp)
    3272:	0100                	addi	s0,sp,128
    3274:	8b2a                	mv	s6,a0
  if(pipe(fds) != 0){
    3276:	fb040513          	addi	a0,s0,-80
    327a:	00001097          	auipc	ra,0x1
    327e:	69c080e7          	jalr	1692(ra) # 4916 <pipe>
    3282:	e911                	bnez	a0,3296 <sbrkfail+0x36>
    3284:	f8040493          	addi	s1,s0,-128
    3288:	fa840993          	addi	s3,s0,-88
    328c:	8926                	mv	s2,s1
    if(pids[i] != -1)
    328e:	5a7d                	li	s4,-1
      read(fds[0], &scratch, 1);
    3290:	faf40a93          	addi	s5,s0,-81
    3294:	a085                	j	32f4 <sbrkfail+0x94>
    printf("%s: pipe() failed\n", s);
    3296:	85da                	mv	a1,s6
    3298:	00002517          	auipc	a0,0x2
    329c:	3c050513          	addi	a0,a0,960 # 5658 <malloc+0x8f4>
    32a0:	00002097          	auipc	ra,0x2
    32a4:	a0c080e7          	jalr	-1524(ra) # 4cac <printf>
    exit(1);
    32a8:	4505                	li	a0,1
    32aa:	00001097          	auipc	ra,0x1
    32ae:	65a080e7          	jalr	1626(ra) # 4904 <exit>
      sbrk(BIG - (uint64)sbrk(0));
    32b2:	00001097          	auipc	ra,0x1
    32b6:	6ca080e7          	jalr	1738(ra) # 497c <sbrk>
    32ba:	064007b7          	lui	a5,0x6400
    32be:	40a7853b          	subw	a0,a5,a0
    32c2:	00001097          	auipc	ra,0x1
    32c6:	6ba080e7          	jalr	1722(ra) # 497c <sbrk>
      write(fds[1], "x", 1);
    32ca:	4605                	li	a2,1
    32cc:	00002597          	auipc	a1,0x2
    32d0:	c6458593          	addi	a1,a1,-924 # 4f30 <malloc+0x1cc>
    32d4:	fb442503          	lw	a0,-76(s0)
    32d8:	00001097          	auipc	ra,0x1
    32dc:	64e080e7          	jalr	1614(ra) # 4926 <write>
      for(;;) sleep(1000);
    32e0:	3e800513          	li	a0,1000
    32e4:	00001097          	auipc	ra,0x1
    32e8:	6a0080e7          	jalr	1696(ra) # 4984 <sleep>
    32ec:	bfd5                	j	32e0 <sbrkfail+0x80>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32ee:	0911                	addi	s2,s2,4
    32f0:	03390463          	beq	s2,s3,3318 <sbrkfail+0xb8>
    if((pids[i] = fork()) == 0){
    32f4:	00001097          	auipc	ra,0x1
    32f8:	608080e7          	jalr	1544(ra) # 48fc <fork>
    32fc:	00a92023          	sw	a0,0(s2)
    3300:	d94d                	beqz	a0,32b2 <sbrkfail+0x52>
    if(pids[i] != -1)
    3302:	ff4506e3          	beq	a0,s4,32ee <sbrkfail+0x8e>
      read(fds[0], &scratch, 1);
    3306:	4605                	li	a2,1
    3308:	85d6                	mv	a1,s5
    330a:	fb042503          	lw	a0,-80(s0)
    330e:	00001097          	auipc	ra,0x1
    3312:	610080e7          	jalr	1552(ra) # 491e <read>
    3316:	bfe1                	j	32ee <sbrkfail+0x8e>
  c = sbrk(PGSIZE);
    3318:	6505                	lui	a0,0x1
    331a:	00001097          	auipc	ra,0x1
    331e:	662080e7          	jalr	1634(ra) # 497c <sbrk>
    3322:	8a2a                	mv	s4,a0
    if(pids[i] == -1)
    3324:	597d                	li	s2,-1
    3326:	a021                	j	332e <sbrkfail+0xce>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3328:	0491                	addi	s1,s1,4
    332a:	01348f63          	beq	s1,s3,3348 <sbrkfail+0xe8>
    if(pids[i] == -1)
    332e:	4088                	lw	a0,0(s1)
    3330:	ff250ce3          	beq	a0,s2,3328 <sbrkfail+0xc8>
    kill(pids[i]);
    3334:	00001097          	auipc	ra,0x1
    3338:	604080e7          	jalr	1540(ra) # 4938 <kill>
    wait(0);
    333c:	4501                	li	a0,0
    333e:	00001097          	auipc	ra,0x1
    3342:	5d0080e7          	jalr	1488(ra) # 490e <wait>
    3346:	b7cd                	j	3328 <sbrkfail+0xc8>
  if(c == (char*)0xffffffffffffffffL){
    3348:	57fd                	li	a5,-1
    334a:	04fa0263          	beq	s4,a5,338e <sbrkfail+0x12e>
  pid = fork();
    334e:	00001097          	auipc	ra,0x1
    3352:	5ae080e7          	jalr	1454(ra) # 48fc <fork>
    3356:	84aa                	mv	s1,a0
  if(pid < 0){
    3358:	04054963          	bltz	a0,33aa <sbrkfail+0x14a>
  if(pid == 0){
    335c:	c52d                	beqz	a0,33c6 <sbrkfail+0x166>
  wait(&xstatus);
    335e:	fbc40513          	addi	a0,s0,-68
    3362:	00001097          	auipc	ra,0x1
    3366:	5ac080e7          	jalr	1452(ra) # 490e <wait>
  if(xstatus != -1 && xstatus != 2)
    336a:	fbc42783          	lw	a5,-68(s0)
    336e:	577d                	li	a4,-1
    3370:	00e78563          	beq	a5,a4,337a <sbrkfail+0x11a>
    3374:	4709                	li	a4,2
    3376:	08e79d63          	bne	a5,a4,3410 <sbrkfail+0x1b0>
}
    337a:	70e6                	ld	ra,120(sp)
    337c:	7446                	ld	s0,112(sp)
    337e:	74a6                	ld	s1,104(sp)
    3380:	7906                	ld	s2,96(sp)
    3382:	69e6                	ld	s3,88(sp)
    3384:	6a46                	ld	s4,80(sp)
    3386:	6aa6                	ld	s5,72(sp)
    3388:	6b06                	ld	s6,64(sp)
    338a:	6109                	addi	sp,sp,128
    338c:	8082                	ret
    printf("%s: failed sbrk leaked memory\n", s);
    338e:	85da                	mv	a1,s6
    3390:	00003517          	auipc	a0,0x3
    3394:	ef850513          	addi	a0,a0,-264 # 6288 <malloc+0x1524>
    3398:	00002097          	auipc	ra,0x2
    339c:	914080e7          	jalr	-1772(ra) # 4cac <printf>
    exit(1);
    33a0:	4505                	li	a0,1
    33a2:	00001097          	auipc	ra,0x1
    33a6:	562080e7          	jalr	1378(ra) # 4904 <exit>
    printf("%s: fork failed\n", s);
    33aa:	85da                	mv	a1,s6
    33ac:	00002517          	auipc	a0,0x2
    33b0:	1a450513          	addi	a0,a0,420 # 5550 <malloc+0x7ec>
    33b4:	00002097          	auipc	ra,0x2
    33b8:	8f8080e7          	jalr	-1800(ra) # 4cac <printf>
    exit(1);
    33bc:	4505                	li	a0,1
    33be:	00001097          	auipc	ra,0x1
    33c2:	546080e7          	jalr	1350(ra) # 4904 <exit>
    a = sbrk(0);
    33c6:	4501                	li	a0,0
    33c8:	00001097          	auipc	ra,0x1
    33cc:	5b4080e7          	jalr	1460(ra) # 497c <sbrk>
    33d0:	892a                	mv	s2,a0
    sbrk(10*BIG);
    33d2:	3e800537          	lui	a0,0x3e800
    33d6:	00001097          	auipc	ra,0x1
    33da:	5a6080e7          	jalr	1446(ra) # 497c <sbrk>
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    33de:	87ca                	mv	a5,s2
    33e0:	3e800737          	lui	a4,0x3e800
    33e4:	993a                	add	s2,s2,a4
    33e6:	6705                	lui	a4,0x1
      n += *(a+i);
    33e8:	0007c683          	lbu	a3,0(a5) # 6400000 <__BSS_END__+0x63f3f70>
    33ec:	9cb5                	addw	s1,s1,a3
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    33ee:	97ba                	add	a5,a5,a4
    33f0:	ff279ce3          	bne	a5,s2,33e8 <sbrkfail+0x188>
    printf("%s: allocate a lot of memory succeeded %d\n", n);
    33f4:	85a6                	mv	a1,s1
    33f6:	00003517          	auipc	a0,0x3
    33fa:	eb250513          	addi	a0,a0,-334 # 62a8 <malloc+0x1544>
    33fe:	00002097          	auipc	ra,0x2
    3402:	8ae080e7          	jalr	-1874(ra) # 4cac <printf>
    exit(1);
    3406:	4505                	li	a0,1
    3408:	00001097          	auipc	ra,0x1
    340c:	4fc080e7          	jalr	1276(ra) # 4904 <exit>
    exit(1);
    3410:	4505                	li	a0,1
    3412:	00001097          	auipc	ra,0x1
    3416:	4f2080e7          	jalr	1266(ra) # 4904 <exit>

000000000000341a <reparent>:
{
    341a:	7179                	addi	sp,sp,-48
    341c:	f406                	sd	ra,40(sp)
    341e:	f022                	sd	s0,32(sp)
    3420:	ec26                	sd	s1,24(sp)
    3422:	e84a                	sd	s2,16(sp)
    3424:	e44e                	sd	s3,8(sp)
    3426:	e052                	sd	s4,0(sp)
    3428:	1800                	addi	s0,sp,48
    342a:	89aa                	mv	s3,a0
  int master_pid = getpid();
    342c:	00001097          	auipc	ra,0x1
    3430:	546080e7          	jalr	1350(ra) # 4972 <getpid>
    3434:	8a2a                	mv	s4,a0
    3436:	0c800913          	li	s2,200
    int pid = fork();
    343a:	00001097          	auipc	ra,0x1
    343e:	4c2080e7          	jalr	1218(ra) # 48fc <fork>
    3442:	84aa                	mv	s1,a0
    if(pid < 0){
    3444:	02054263          	bltz	a0,3468 <reparent+0x4e>
    if(pid){
    3448:	cd21                	beqz	a0,34a0 <reparent+0x86>
      if(wait(0) != pid){
    344a:	4501                	li	a0,0
    344c:	00001097          	auipc	ra,0x1
    3450:	4c2080e7          	jalr	1218(ra) # 490e <wait>
    3454:	02951863          	bne	a0,s1,3484 <reparent+0x6a>
  for(int i = 0; i < 200; i++){
    3458:	397d                	addiw	s2,s2,-1
    345a:	fe0910e3          	bnez	s2,343a <reparent+0x20>
  exit(0);
    345e:	4501                	li	a0,0
    3460:	00001097          	auipc	ra,0x1
    3464:	4a4080e7          	jalr	1188(ra) # 4904 <exit>
      printf("%s: fork failed\n", s);
    3468:	85ce                	mv	a1,s3
    346a:	00002517          	auipc	a0,0x2
    346e:	0e650513          	addi	a0,a0,230 # 5550 <malloc+0x7ec>
    3472:	00002097          	auipc	ra,0x2
    3476:	83a080e7          	jalr	-1990(ra) # 4cac <printf>
      exit(1);
    347a:	4505                	li	a0,1
    347c:	00001097          	auipc	ra,0x1
    3480:	488080e7          	jalr	1160(ra) # 4904 <exit>
        printf("%s: wait wrong pid\n", s);
    3484:	85ce                	mv	a1,s3
    3486:	00002517          	auipc	a0,0x2
    348a:	25250513          	addi	a0,a0,594 # 56d8 <malloc+0x974>
    348e:	00002097          	auipc	ra,0x2
    3492:	81e080e7          	jalr	-2018(ra) # 4cac <printf>
        exit(1);
    3496:	4505                	li	a0,1
    3498:	00001097          	auipc	ra,0x1
    349c:	46c080e7          	jalr	1132(ra) # 4904 <exit>
      int pid2 = fork();
    34a0:	00001097          	auipc	ra,0x1
    34a4:	45c080e7          	jalr	1116(ra) # 48fc <fork>
      if(pid2 < 0){
    34a8:	00054763          	bltz	a0,34b6 <reparent+0x9c>
      exit(0);
    34ac:	4501                	li	a0,0
    34ae:	00001097          	auipc	ra,0x1
    34b2:	456080e7          	jalr	1110(ra) # 4904 <exit>
        kill(master_pid);
    34b6:	8552                	mv	a0,s4
    34b8:	00001097          	auipc	ra,0x1
    34bc:	480080e7          	jalr	1152(ra) # 4938 <kill>
        exit(1);
    34c0:	4505                	li	a0,1
    34c2:	00001097          	auipc	ra,0x1
    34c6:	442080e7          	jalr	1090(ra) # 4904 <exit>

00000000000034ca <mem>:
{
    34ca:	7139                	addi	sp,sp,-64
    34cc:	fc06                	sd	ra,56(sp)
    34ce:	f822                	sd	s0,48(sp)
    34d0:	f426                	sd	s1,40(sp)
    34d2:	f04a                	sd	s2,32(sp)
    34d4:	ec4e                	sd	s3,24(sp)
    34d6:	0080                	addi	s0,sp,64
    34d8:	89aa                	mv	s3,a0
  if((pid = fork()) == 0){
    34da:	00001097          	auipc	ra,0x1
    34de:	422080e7          	jalr	1058(ra) # 48fc <fork>
    m1 = 0;
    34e2:	4481                	li	s1,0
    while((m2 = malloc(10001)) != 0){
    34e4:	6909                	lui	s2,0x2
    34e6:	71190913          	addi	s2,s2,1809 # 2711 <subdir+0x1bb>
  if((pid = fork()) == 0){
    34ea:	c115                	beqz	a0,350e <mem+0x44>
    wait(&xstatus);
    34ec:	fcc40513          	addi	a0,s0,-52
    34f0:	00001097          	auipc	ra,0x1
    34f4:	41e080e7          	jalr	1054(ra) # 490e <wait>
    if(xstatus == -1){
    34f8:	fcc42503          	lw	a0,-52(s0)
    34fc:	57fd                	li	a5,-1
    34fe:	06f50363          	beq	a0,a5,3564 <mem+0x9a>
    exit(xstatus);
    3502:	00001097          	auipc	ra,0x1
    3506:	402080e7          	jalr	1026(ra) # 4904 <exit>
      *(char**)m2 = m1;
    350a:	e104                	sd	s1,0(a0)
      m1 = m2;
    350c:	84aa                	mv	s1,a0
    while((m2 = malloc(10001)) != 0){
    350e:	854a                	mv	a0,s2
    3510:	00002097          	auipc	ra,0x2
    3514:	854080e7          	jalr	-1964(ra) # 4d64 <malloc>
    3518:	f96d                	bnez	a0,350a <mem+0x40>
    while(m1){
    351a:	c881                	beqz	s1,352a <mem+0x60>
      m2 = *(char**)m1;
    351c:	8526                	mv	a0,s1
    351e:	6084                	ld	s1,0(s1)
      free(m1);
    3520:	00001097          	auipc	ra,0x1
    3524:	7c2080e7          	jalr	1986(ra) # 4ce2 <free>
    while(m1){
    3528:	f8f5                	bnez	s1,351c <mem+0x52>
    m1 = malloc(1024*20);
    352a:	6515                	lui	a0,0x5
    352c:	00002097          	auipc	ra,0x2
    3530:	838080e7          	jalr	-1992(ra) # 4d64 <malloc>
    if(m1 == 0){
    3534:	c911                	beqz	a0,3548 <mem+0x7e>
    free(m1);
    3536:	00001097          	auipc	ra,0x1
    353a:	7ac080e7          	jalr	1964(ra) # 4ce2 <free>
    exit(0);
    353e:	4501                	li	a0,0
    3540:	00001097          	auipc	ra,0x1
    3544:	3c4080e7          	jalr	964(ra) # 4904 <exit>
      printf("couldn't allocate mem?!!\n", s);
    3548:	85ce                	mv	a1,s3
    354a:	00003517          	auipc	a0,0x3
    354e:	d8e50513          	addi	a0,a0,-626 # 62d8 <malloc+0x1574>
    3552:	00001097          	auipc	ra,0x1
    3556:	75a080e7          	jalr	1882(ra) # 4cac <printf>
      exit(1);
    355a:	4505                	li	a0,1
    355c:	00001097          	auipc	ra,0x1
    3560:	3a8080e7          	jalr	936(ra) # 4904 <exit>
      exit(0);
    3564:	4501                	li	a0,0
    3566:	00001097          	auipc	ra,0x1
    356a:	39e080e7          	jalr	926(ra) # 4904 <exit>

000000000000356e <sharedfd>:
{
    356e:	7159                	addi	sp,sp,-112
    3570:	f486                	sd	ra,104(sp)
    3572:	f0a2                	sd	s0,96(sp)
    3574:	eca6                	sd	s1,88(sp)
    3576:	e8ca                	sd	s2,80(sp)
    3578:	e4ce                	sd	s3,72(sp)
    357a:	e0d2                	sd	s4,64(sp)
    357c:	fc56                	sd	s5,56(sp)
    357e:	f85a                	sd	s6,48(sp)
    3580:	f45e                	sd	s7,40(sp)
    3582:	f062                	sd	s8,32(sp)
    3584:	1880                	addi	s0,sp,112
    3586:	8aaa                	mv	s5,a0
  remove("sharedfd");
    3588:	00003517          	auipc	a0,0x3
    358c:	d7050513          	addi	a0,a0,-656 # 62f8 <malloc+0x1594>
    3590:	00001097          	auipc	ra,0x1
    3594:	424080e7          	jalr	1060(ra) # 49b4 <remove>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    3598:	20200593          	li	a1,514
    359c:	00003517          	auipc	a0,0x3
    35a0:	d5c50513          	addi	a0,a0,-676 # 62f8 <malloc+0x1594>
    35a4:	00001097          	auipc	ra,0x1
    35a8:	3a6080e7          	jalr	934(ra) # 494a <open>
  if(fd < 0){
    35ac:	04054b63          	bltz	a0,3602 <sharedfd+0x94>
    35b0:	892a                	mv	s2,a0
  pid = fork();
    35b2:	00001097          	auipc	ra,0x1
    35b6:	34a080e7          	jalr	842(ra) # 48fc <fork>
    35ba:	8a2a                	mv	s4,a0
  memset(buf, pid==0?'c':'p', sizeof(buf));
    35bc:	06300593          	li	a1,99
    35c0:	c119                	beqz	a0,35c6 <sharedfd+0x58>
    35c2:	07000593          	li	a1,112
    35c6:	4629                	li	a2,10
    35c8:	fa040513          	addi	a0,s0,-96
    35cc:	00001097          	auipc	ra,0x1
    35d0:	120080e7          	jalr	288(ra) # 46ec <memset>
    35d4:	3e800493          	li	s1,1000
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    35d8:	fa040993          	addi	s3,s0,-96
    35dc:	4629                	li	a2,10
    35de:	85ce                	mv	a1,s3
    35e0:	854a                	mv	a0,s2
    35e2:	00001097          	auipc	ra,0x1
    35e6:	344080e7          	jalr	836(ra) # 4926 <write>
    35ea:	47a9                	li	a5,10
    35ec:	02f51963          	bne	a0,a5,361e <sharedfd+0xb0>
  for(i = 0; i < N; i++){
    35f0:	34fd                	addiw	s1,s1,-1
    35f2:	f4ed                	bnez	s1,35dc <sharedfd+0x6e>
  if(pid == 0) {
    35f4:	040a1363          	bnez	s4,363a <sharedfd+0xcc>
    exit(0);
    35f8:	4501                	li	a0,0
    35fa:	00001097          	auipc	ra,0x1
    35fe:	30a080e7          	jalr	778(ra) # 4904 <exit>
    printf("%s: cannot open sharedfd for writing", s);
    3602:	85d6                	mv	a1,s5
    3604:	00003517          	auipc	a0,0x3
    3608:	d0450513          	addi	a0,a0,-764 # 6308 <malloc+0x15a4>
    360c:	00001097          	auipc	ra,0x1
    3610:	6a0080e7          	jalr	1696(ra) # 4cac <printf>
    exit(1);
    3614:	4505                	li	a0,1
    3616:	00001097          	auipc	ra,0x1
    361a:	2ee080e7          	jalr	750(ra) # 4904 <exit>
      printf("%s: write sharedfd failed\n", s);
    361e:	85d6                	mv	a1,s5
    3620:	00003517          	auipc	a0,0x3
    3624:	d1050513          	addi	a0,a0,-752 # 6330 <malloc+0x15cc>
    3628:	00001097          	auipc	ra,0x1
    362c:	684080e7          	jalr	1668(ra) # 4cac <printf>
      exit(1);
    3630:	4505                	li	a0,1
    3632:	00001097          	auipc	ra,0x1
    3636:	2d2080e7          	jalr	722(ra) # 4904 <exit>
    wait(&xstatus);
    363a:	f9c40513          	addi	a0,s0,-100
    363e:	00001097          	auipc	ra,0x1
    3642:	2d0080e7          	jalr	720(ra) # 490e <wait>
    if(xstatus != 0)
    3646:	f9c42983          	lw	s3,-100(s0)
    364a:	00098763          	beqz	s3,3658 <sharedfd+0xea>
      exit(xstatus);
    364e:	854e                	mv	a0,s3
    3650:	00001097          	auipc	ra,0x1
    3654:	2b4080e7          	jalr	692(ra) # 4904 <exit>
  close(fd);
    3658:	854a                	mv	a0,s2
    365a:	00001097          	auipc	ra,0x1
    365e:	2d6080e7          	jalr	726(ra) # 4930 <close>
  fd = open("sharedfd", 0);
    3662:	4581                	li	a1,0
    3664:	00003517          	auipc	a0,0x3
    3668:	c9450513          	addi	a0,a0,-876 # 62f8 <malloc+0x1594>
    366c:	00001097          	auipc	ra,0x1
    3670:	2de080e7          	jalr	734(ra) # 494a <open>
    3674:	8baa                	mv	s7,a0
  nc = np = 0;
    3676:	8a4e                	mv	s4,s3
  if(fd < 0){
    3678:	02054663          	bltz	a0,36a4 <sharedfd+0x136>
  while((n = read(fd, buf, sizeof(buf))) > 0){
    367c:	fa040c13          	addi	s8,s0,-96
    3680:	faa40913          	addi	s2,s0,-86
      if(buf[i] == 'c')
    3684:	06300493          	li	s1,99
      if(buf[i] == 'p')
    3688:	07000b13          	li	s6,112
  while((n = read(fd, buf, sizeof(buf))) > 0){
    368c:	4629                	li	a2,10
    368e:	85e2                	mv	a1,s8
    3690:	855e                	mv	a0,s7
    3692:	00001097          	auipc	ra,0x1
    3696:	28c080e7          	jalr	652(ra) # 491e <read>
    369a:	02a05f63          	blez	a0,36d8 <sharedfd+0x16a>
    369e:	fa040793          	addi	a5,s0,-96
    36a2:	a01d                	j	36c8 <sharedfd+0x15a>
    printf("%s: cannot open sharedfd for reading\n", s);
    36a4:	85d6                	mv	a1,s5
    36a6:	00003517          	auipc	a0,0x3
    36aa:	caa50513          	addi	a0,a0,-854 # 6350 <malloc+0x15ec>
    36ae:	00001097          	auipc	ra,0x1
    36b2:	5fe080e7          	jalr	1534(ra) # 4cac <printf>
    exit(1);
    36b6:	4505                	li	a0,1
    36b8:	00001097          	auipc	ra,0x1
    36bc:	24c080e7          	jalr	588(ra) # 4904 <exit>
        nc++;
    36c0:	2985                	addiw	s3,s3,1
    for(i = 0; i < sizeof(buf); i++){
    36c2:	0785                	addi	a5,a5,1
    36c4:	fd2784e3          	beq	a5,s2,368c <sharedfd+0x11e>
      if(buf[i] == 'c')
    36c8:	0007c703          	lbu	a4,0(a5)
    36cc:	fe970ae3          	beq	a4,s1,36c0 <sharedfd+0x152>
      if(buf[i] == 'p')
    36d0:	ff6719e3          	bne	a4,s6,36c2 <sharedfd+0x154>
        np++;
    36d4:	2a05                	addiw	s4,s4,1
    36d6:	b7f5                	j	36c2 <sharedfd+0x154>
  close(fd);
    36d8:	855e                	mv	a0,s7
    36da:	00001097          	auipc	ra,0x1
    36de:	256080e7          	jalr	598(ra) # 4930 <close>
  remove("sharedfd");
    36e2:	00003517          	auipc	a0,0x3
    36e6:	c1650513          	addi	a0,a0,-1002 # 62f8 <malloc+0x1594>
    36ea:	00001097          	auipc	ra,0x1
    36ee:	2ca080e7          	jalr	714(ra) # 49b4 <remove>
  if(nc == N*SZ && np == N*SZ){
    36f2:	6789                	lui	a5,0x2
    36f4:	71078793          	addi	a5,a5,1808 # 2710 <subdir+0x1ba>
    36f8:	00f99763          	bne	s3,a5,3706 <sharedfd+0x198>
    36fc:	6789                	lui	a5,0x2
    36fe:	71078793          	addi	a5,a5,1808 # 2710 <subdir+0x1ba>
    3702:	02fa0063          	beq	s4,a5,3722 <sharedfd+0x1b4>
    printf("%s: nc/np test fails\n", s);
    3706:	85d6                	mv	a1,s5
    3708:	00003517          	auipc	a0,0x3
    370c:	c7050513          	addi	a0,a0,-912 # 6378 <malloc+0x1614>
    3710:	00001097          	auipc	ra,0x1
    3714:	59c080e7          	jalr	1436(ra) # 4cac <printf>
    exit(1);
    3718:	4505                	li	a0,1
    371a:	00001097          	auipc	ra,0x1
    371e:	1ea080e7          	jalr	490(ra) # 4904 <exit>
    exit(0);
    3722:	4501                	li	a0,0
    3724:	00001097          	auipc	ra,0x1
    3728:	1e0080e7          	jalr	480(ra) # 4904 <exit>

000000000000372c <fourfiles>:
{
    372c:	7171                	addi	sp,sp,-176
    372e:	f506                	sd	ra,168(sp)
    3730:	f122                	sd	s0,160(sp)
    3732:	ed26                	sd	s1,152(sp)
    3734:	e94a                	sd	s2,144(sp)
    3736:	e54e                	sd	s3,136(sp)
    3738:	e152                	sd	s4,128(sp)
    373a:	fcd6                	sd	s5,120(sp)
    373c:	f8da                	sd	s6,112(sp)
    373e:	f4de                	sd	s7,104(sp)
    3740:	f0e2                	sd	s8,96(sp)
    3742:	ece6                	sd	s9,88(sp)
    3744:	e8ea                	sd	s10,80(sp)
    3746:	e4ee                	sd	s11,72(sp)
    3748:	1900                	addi	s0,sp,176
    374a:	f4a43c23          	sd	a0,-168(s0)
  char *names[] = { "f0", "f1", "f2", "f3" };
    374e:	00003797          	auipc	a5,0x3
    3752:	c4278793          	addi	a5,a5,-958 # 6390 <malloc+0x162c>
    3756:	f6f43823          	sd	a5,-144(s0)
    375a:	00003797          	auipc	a5,0x3
    375e:	c3e78793          	addi	a5,a5,-962 # 6398 <malloc+0x1634>
    3762:	f6f43c23          	sd	a5,-136(s0)
    3766:	00003797          	auipc	a5,0x3
    376a:	c3a78793          	addi	a5,a5,-966 # 63a0 <malloc+0x163c>
    376e:	f8f43023          	sd	a5,-128(s0)
    3772:	00003797          	auipc	a5,0x3
    3776:	c3678793          	addi	a5,a5,-970 # 63a8 <malloc+0x1644>
    377a:	f8f43423          	sd	a5,-120(s0)
  for(pi = 0; pi < NCHILD; pi++){
    377e:	f7040c93          	addi	s9,s0,-144
  char *names[] = { "f0", "f1", "f2", "f3" };
    3782:	8966                	mv	s2,s9
  for(pi = 0; pi < NCHILD; pi++){
    3784:	4481                	li	s1,0
    3786:	4a11                	li	s4,4
    fname = names[pi];
    3788:	00093983          	ld	s3,0(s2)
    remove(fname);
    378c:	854e                	mv	a0,s3
    378e:	00001097          	auipc	ra,0x1
    3792:	226080e7          	jalr	550(ra) # 49b4 <remove>
    pid = fork();
    3796:	00001097          	auipc	ra,0x1
    379a:	166080e7          	jalr	358(ra) # 48fc <fork>
    if(pid < 0){
    379e:	04054a63          	bltz	a0,37f2 <fourfiles+0xc6>
    if(pid == 0){
    37a2:	c53d                	beqz	a0,3810 <fourfiles+0xe4>
  for(pi = 0; pi < NCHILD; pi++){
    37a4:	2485                	addiw	s1,s1,1
    37a6:	0921                	addi	s2,s2,8
    37a8:	ff4490e3          	bne	s1,s4,3788 <fourfiles+0x5c>
    37ac:	4491                	li	s1,4
    wait(&xstatus);
    37ae:	f6c40913          	addi	s2,s0,-148
    37b2:	854a                	mv	a0,s2
    37b4:	00001097          	auipc	ra,0x1
    37b8:	15a080e7          	jalr	346(ra) # 490e <wait>
    if(xstatus != 0)
    37bc:	f6c42b83          	lw	s7,-148(s0)
    37c0:	0e0b9363          	bnez	s7,38a6 <fourfiles+0x17a>
  for(pi = 0; pi < NCHILD; pi++){
    37c4:	34fd                	addiw	s1,s1,-1
    37c6:	f4f5                	bnez	s1,37b2 <fourfiles+0x86>
    37c8:	03000c13          	li	s8,48
    while((n = read(fd, buf, sizeof(buf))) > 0){
    37cc:	6a09                	lui	s4,0x2
    37ce:	800a0a13          	addi	s4,s4,-2048 # 1800 <forkfork+0x42>
    37d2:	00007a97          	auipc	s5,0x7
    37d6:	0a6a8a93          	addi	s5,s5,166 # a878 <buf>
    37da:	00007b17          	auipc	s6,0x7
    37de:	09fb0b13          	addi	s6,s6,159 # a879 <buf+0x1>
    if(total != N*SZ){
    37e2:	6785                	lui	a5,0x1
    37e4:	77078793          	addi	a5,a5,1904 # 1770 <twochildren+0x4c>
    37e8:	f4f43823          	sd	a5,-176(s0)
  for(i = 0; i < NCHILD; i++){
    37ec:	03400d93          	li	s11,52
    37f0:	aa2d                	j	392a <fourfiles+0x1fe>
      printf("fork failed\n", s);
    37f2:	f5843583          	ld	a1,-168(s0)
    37f6:	00002517          	auipc	a0,0x2
    37fa:	0da50513          	addi	a0,a0,218 # 58d0 <malloc+0xb6c>
    37fe:	00001097          	auipc	ra,0x1
    3802:	4ae080e7          	jalr	1198(ra) # 4cac <printf>
      exit(1);
    3806:	4505                	li	a0,1
    3808:	00001097          	auipc	ra,0x1
    380c:	0fc080e7          	jalr	252(ra) # 4904 <exit>
      fd = open(fname, O_CREATE | O_RDWR);
    3810:	20200593          	li	a1,514
    3814:	854e                	mv	a0,s3
    3816:	00001097          	auipc	ra,0x1
    381a:	134080e7          	jalr	308(ra) # 494a <open>
    381e:	892a                	mv	s2,a0
      if(fd < 0){
    3820:	04054763          	bltz	a0,386e <fourfiles+0x142>
      memset(buf, '0'+pi, SZ);
    3824:	1f400613          	li	a2,500
    3828:	0304859b          	addiw	a1,s1,48
    382c:	00007517          	auipc	a0,0x7
    3830:	04c50513          	addi	a0,a0,76 # a878 <buf>
    3834:	00001097          	auipc	ra,0x1
    3838:	eb8080e7          	jalr	-328(ra) # 46ec <memset>
    383c:	44b1                	li	s1,12
        if((n = write(fd, buf, SZ)) != SZ){
    383e:	00007997          	auipc	s3,0x7
    3842:	03a98993          	addi	s3,s3,58 # a878 <buf>
    3846:	1f400613          	li	a2,500
    384a:	85ce                	mv	a1,s3
    384c:	854a                	mv	a0,s2
    384e:	00001097          	auipc	ra,0x1
    3852:	0d8080e7          	jalr	216(ra) # 4926 <write>
    3856:	85aa                	mv	a1,a0
    3858:	1f400793          	li	a5,500
    385c:	02f51863          	bne	a0,a5,388c <fourfiles+0x160>
      for(i = 0; i < N; i++){
    3860:	34fd                	addiw	s1,s1,-1
    3862:	f0f5                	bnez	s1,3846 <fourfiles+0x11a>
      exit(0);
    3864:	4501                	li	a0,0
    3866:	00001097          	auipc	ra,0x1
    386a:	09e080e7          	jalr	158(ra) # 4904 <exit>
        printf("create failed\n", s);
    386e:	f5843583          	ld	a1,-168(s0)
    3872:	00003517          	auipc	a0,0x3
    3876:	b3e50513          	addi	a0,a0,-1218 # 63b0 <malloc+0x164c>
    387a:	00001097          	auipc	ra,0x1
    387e:	432080e7          	jalr	1074(ra) # 4cac <printf>
        exit(1);
    3882:	4505                	li	a0,1
    3884:	00001097          	auipc	ra,0x1
    3888:	080080e7          	jalr	128(ra) # 4904 <exit>
          printf("write failed %d\n", n);
    388c:	00003517          	auipc	a0,0x3
    3890:	b3450513          	addi	a0,a0,-1228 # 63c0 <malloc+0x165c>
    3894:	00001097          	auipc	ra,0x1
    3898:	418080e7          	jalr	1048(ra) # 4cac <printf>
          exit(1);
    389c:	4505                	li	a0,1
    389e:	00001097          	auipc	ra,0x1
    38a2:	066080e7          	jalr	102(ra) # 4904 <exit>
      exit(xstatus);
    38a6:	855e                	mv	a0,s7
    38a8:	00001097          	auipc	ra,0x1
    38ac:	05c080e7          	jalr	92(ra) # 4904 <exit>
          printf("wrong char\n", s);
    38b0:	f5843583          	ld	a1,-168(s0)
    38b4:	00003517          	auipc	a0,0x3
    38b8:	b2450513          	addi	a0,a0,-1244 # 63d8 <malloc+0x1674>
    38bc:	00001097          	auipc	ra,0x1
    38c0:	3f0080e7          	jalr	1008(ra) # 4cac <printf>
          exit(1);
    38c4:	4505                	li	a0,1
    38c6:	00001097          	auipc	ra,0x1
    38ca:	03e080e7          	jalr	62(ra) # 4904 <exit>
      total += n;
    38ce:	00a9093b          	addw	s2,s2,a0
    while((n = read(fd, buf, sizeof(buf))) > 0){
    38d2:	8652                	mv	a2,s4
    38d4:	85d6                	mv	a1,s5
    38d6:	854e                	mv	a0,s3
    38d8:	00001097          	auipc	ra,0x1
    38dc:	046080e7          	jalr	70(ra) # 491e <read>
    38e0:	02a05363          	blez	a0,3906 <fourfiles+0x1da>
    38e4:	00007797          	auipc	a5,0x7
    38e8:	f9478793          	addi	a5,a5,-108 # a878 <buf>
    38ec:	fff5069b          	addiw	a3,a0,-1
    38f0:	1682                	slli	a3,a3,0x20
    38f2:	9281                	srli	a3,a3,0x20
    38f4:	96da                	add	a3,a3,s6
        if(buf[j] != '0'+i){
    38f6:	0007c703          	lbu	a4,0(a5)
    38fa:	fa971be3          	bne	a4,s1,38b0 <fourfiles+0x184>
      for(j = 0; j < n; j++){
    38fe:	0785                	addi	a5,a5,1
    3900:	fed79be3          	bne	a5,a3,38f6 <fourfiles+0x1ca>
    3904:	b7e9                	j	38ce <fourfiles+0x1a2>
    close(fd);
    3906:	854e                	mv	a0,s3
    3908:	00001097          	auipc	ra,0x1
    390c:	028080e7          	jalr	40(ra) # 4930 <close>
    if(total != N*SZ){
    3910:	f5043783          	ld	a5,-176(s0)
    3914:	02f91863          	bne	s2,a5,3944 <fourfiles+0x218>
    remove(fname);
    3918:	856a                	mv	a0,s10
    391a:	00001097          	auipc	ra,0x1
    391e:	09a080e7          	jalr	154(ra) # 49b4 <remove>
  for(i = 0; i < NCHILD; i++){
    3922:	0ca1                	addi	s9,s9,8
    3924:	2c05                	addiw	s8,s8,1
    3926:	03bc0d63          	beq	s8,s11,3960 <fourfiles+0x234>
    fname = names[i];
    392a:	000cbd03          	ld	s10,0(s9)
    fd = open(fname, 0);
    392e:	4581                	li	a1,0
    3930:	856a                	mv	a0,s10
    3932:	00001097          	auipc	ra,0x1
    3936:	018080e7          	jalr	24(ra) # 494a <open>
    393a:	89aa                	mv	s3,a0
    total = 0;
    393c:	895e                	mv	s2,s7
        if(buf[j] != '0'+i){
    393e:	000c049b          	sext.w	s1,s8
    while((n = read(fd, buf, sizeof(buf))) > 0){
    3942:	bf41                	j	38d2 <fourfiles+0x1a6>
      printf("wrong length %d\n", total);
    3944:	85ca                	mv	a1,s2
    3946:	00003517          	auipc	a0,0x3
    394a:	aa250513          	addi	a0,a0,-1374 # 63e8 <malloc+0x1684>
    394e:	00001097          	auipc	ra,0x1
    3952:	35e080e7          	jalr	862(ra) # 4cac <printf>
      exit(1);
    3956:	4505                	li	a0,1
    3958:	00001097          	auipc	ra,0x1
    395c:	fac080e7          	jalr	-84(ra) # 4904 <exit>
}
    3960:	70aa                	ld	ra,168(sp)
    3962:	740a                	ld	s0,160(sp)
    3964:	64ea                	ld	s1,152(sp)
    3966:	694a                	ld	s2,144(sp)
    3968:	69aa                	ld	s3,136(sp)
    396a:	6a0a                	ld	s4,128(sp)
    396c:	7ae6                	ld	s5,120(sp)
    396e:	7b46                	ld	s6,112(sp)
    3970:	7ba6                	ld	s7,104(sp)
    3972:	7c06                	ld	s8,96(sp)
    3974:	6ce6                	ld	s9,88(sp)
    3976:	6d46                	ld	s10,80(sp)
    3978:	6da6                	ld	s11,72(sp)
    397a:	614d                	addi	sp,sp,176
    397c:	8082                	ret

000000000000397e <bigfile>:
{
    397e:	7139                	addi	sp,sp,-64
    3980:	fc06                	sd	ra,56(sp)
    3982:	f822                	sd	s0,48(sp)
    3984:	f426                	sd	s1,40(sp)
    3986:	f04a                	sd	s2,32(sp)
    3988:	ec4e                	sd	s3,24(sp)
    398a:	e852                	sd	s4,16(sp)
    398c:	e456                	sd	s5,8(sp)
    398e:	0080                	addi	s0,sp,64
    3990:	8aaa                	mv	s5,a0
  remove("bigfile.dat");
    3992:	00003517          	auipc	a0,0x3
    3996:	a6e50513          	addi	a0,a0,-1426 # 6400 <malloc+0x169c>
    399a:	00001097          	auipc	ra,0x1
    399e:	01a080e7          	jalr	26(ra) # 49b4 <remove>
  fd = open("bigfile.dat", O_CREATE | O_RDWR);
    39a2:	20200593          	li	a1,514
    39a6:	00003517          	auipc	a0,0x3
    39aa:	a5a50513          	addi	a0,a0,-1446 # 6400 <malloc+0x169c>
    39ae:	00001097          	auipc	ra,0x1
    39b2:	f9c080e7          	jalr	-100(ra) # 494a <open>
    39b6:	89aa                	mv	s3,a0
  for(i = 0; i < N; i++){
    39b8:	4481                	li	s1,0
    memset(buf, i, SZ);
    39ba:	00007917          	auipc	s2,0x7
    39be:	ebe90913          	addi	s2,s2,-322 # a878 <buf>
  for(i = 0; i < N; i++){
    39c2:	4a51                	li	s4,20
  if(fd < 0){
    39c4:	0a054063          	bltz	a0,3a64 <bigfile+0xe6>
    memset(buf, i, SZ);
    39c8:	25800613          	li	a2,600
    39cc:	85a6                	mv	a1,s1
    39ce:	854a                	mv	a0,s2
    39d0:	00001097          	auipc	ra,0x1
    39d4:	d1c080e7          	jalr	-740(ra) # 46ec <memset>
    if(write(fd, buf, SZ) != SZ){
    39d8:	25800613          	li	a2,600
    39dc:	85ca                	mv	a1,s2
    39de:	854e                	mv	a0,s3
    39e0:	00001097          	auipc	ra,0x1
    39e4:	f46080e7          	jalr	-186(ra) # 4926 <write>
    39e8:	25800793          	li	a5,600
    39ec:	08f51a63          	bne	a0,a5,3a80 <bigfile+0x102>
  for(i = 0; i < N; i++){
    39f0:	2485                	addiw	s1,s1,1
    39f2:	fd449be3          	bne	s1,s4,39c8 <bigfile+0x4a>
  close(fd);
    39f6:	854e                	mv	a0,s3
    39f8:	00001097          	auipc	ra,0x1
    39fc:	f38080e7          	jalr	-200(ra) # 4930 <close>
  fd = open("bigfile.dat", 0);
    3a00:	4581                	li	a1,0
    3a02:	00003517          	auipc	a0,0x3
    3a06:	9fe50513          	addi	a0,a0,-1538 # 6400 <malloc+0x169c>
    3a0a:	00001097          	auipc	ra,0x1
    3a0e:	f40080e7          	jalr	-192(ra) # 494a <open>
    3a12:	8a2a                	mv	s4,a0
  total = 0;
    3a14:	4981                	li	s3,0
  for(i = 0; ; i++){
    3a16:	4481                	li	s1,0
    cc = read(fd, buf, SZ/2);
    3a18:	00007917          	auipc	s2,0x7
    3a1c:	e6090913          	addi	s2,s2,-416 # a878 <buf>
  if(fd < 0){
    3a20:	06054e63          	bltz	a0,3a9c <bigfile+0x11e>
    cc = read(fd, buf, SZ/2);
    3a24:	12c00613          	li	a2,300
    3a28:	85ca                	mv	a1,s2
    3a2a:	8552                	mv	a0,s4
    3a2c:	00001097          	auipc	ra,0x1
    3a30:	ef2080e7          	jalr	-270(ra) # 491e <read>
    if(cc < 0){
    3a34:	08054263          	bltz	a0,3ab8 <bigfile+0x13a>
    if(cc == 0)
    3a38:	c971                	beqz	a0,3b0c <bigfile+0x18e>
    if(cc != SZ/2){
    3a3a:	12c00793          	li	a5,300
    3a3e:	08f51b63          	bne	a0,a5,3ad4 <bigfile+0x156>
    if(buf[0] != i/2 || buf[SZ/2-1] != i/2){
    3a42:	01f4d79b          	srliw	a5,s1,0x1f
    3a46:	9fa5                	addw	a5,a5,s1
    3a48:	4017d79b          	sraiw	a5,a5,0x1
    3a4c:	00094703          	lbu	a4,0(s2)
    3a50:	0af71063          	bne	a4,a5,3af0 <bigfile+0x172>
    3a54:	12b94703          	lbu	a4,299(s2)
    3a58:	08f71c63          	bne	a4,a5,3af0 <bigfile+0x172>
    total += cc;
    3a5c:	12c9899b          	addiw	s3,s3,300
  for(i = 0; ; i++){
    3a60:	2485                	addiw	s1,s1,1
    cc = read(fd, buf, SZ/2);
    3a62:	b7c9                	j	3a24 <bigfile+0xa6>
    printf("%s: cannot create bigfile", s);
    3a64:	85d6                	mv	a1,s5
    3a66:	00003517          	auipc	a0,0x3
    3a6a:	9aa50513          	addi	a0,a0,-1622 # 6410 <malloc+0x16ac>
    3a6e:	00001097          	auipc	ra,0x1
    3a72:	23e080e7          	jalr	574(ra) # 4cac <printf>
    exit(1);
    3a76:	4505                	li	a0,1
    3a78:	00001097          	auipc	ra,0x1
    3a7c:	e8c080e7          	jalr	-372(ra) # 4904 <exit>
      printf("%s: write bigfile failed\n", s);
    3a80:	85d6                	mv	a1,s5
    3a82:	00003517          	auipc	a0,0x3
    3a86:	9ae50513          	addi	a0,a0,-1618 # 6430 <malloc+0x16cc>
    3a8a:	00001097          	auipc	ra,0x1
    3a8e:	222080e7          	jalr	546(ra) # 4cac <printf>
      exit(1);
    3a92:	4505                	li	a0,1
    3a94:	00001097          	auipc	ra,0x1
    3a98:	e70080e7          	jalr	-400(ra) # 4904 <exit>
    printf("%s: cannot open bigfile\n", s);
    3a9c:	85d6                	mv	a1,s5
    3a9e:	00003517          	auipc	a0,0x3
    3aa2:	9b250513          	addi	a0,a0,-1614 # 6450 <malloc+0x16ec>
    3aa6:	00001097          	auipc	ra,0x1
    3aaa:	206080e7          	jalr	518(ra) # 4cac <printf>
    exit(1);
    3aae:	4505                	li	a0,1
    3ab0:	00001097          	auipc	ra,0x1
    3ab4:	e54080e7          	jalr	-428(ra) # 4904 <exit>
      printf("%s: read bigfile failed\n", s);
    3ab8:	85d6                	mv	a1,s5
    3aba:	00003517          	auipc	a0,0x3
    3abe:	9b650513          	addi	a0,a0,-1610 # 6470 <malloc+0x170c>
    3ac2:	00001097          	auipc	ra,0x1
    3ac6:	1ea080e7          	jalr	490(ra) # 4cac <printf>
      exit(1);
    3aca:	4505                	li	a0,1
    3acc:	00001097          	auipc	ra,0x1
    3ad0:	e38080e7          	jalr	-456(ra) # 4904 <exit>
      printf("%s: short read bigfile\n", s);
    3ad4:	85d6                	mv	a1,s5
    3ad6:	00003517          	auipc	a0,0x3
    3ada:	9ba50513          	addi	a0,a0,-1606 # 6490 <malloc+0x172c>
    3ade:	00001097          	auipc	ra,0x1
    3ae2:	1ce080e7          	jalr	462(ra) # 4cac <printf>
      exit(1);
    3ae6:	4505                	li	a0,1
    3ae8:	00001097          	auipc	ra,0x1
    3aec:	e1c080e7          	jalr	-484(ra) # 4904 <exit>
      printf("%s: read bigfile wrong data\n", s);
    3af0:	85d6                	mv	a1,s5
    3af2:	00003517          	auipc	a0,0x3
    3af6:	9b650513          	addi	a0,a0,-1610 # 64a8 <malloc+0x1744>
    3afa:	00001097          	auipc	ra,0x1
    3afe:	1b2080e7          	jalr	434(ra) # 4cac <printf>
      exit(1);
    3b02:	4505                	li	a0,1
    3b04:	00001097          	auipc	ra,0x1
    3b08:	e00080e7          	jalr	-512(ra) # 4904 <exit>
  close(fd);
    3b0c:	8552                	mv	a0,s4
    3b0e:	00001097          	auipc	ra,0x1
    3b12:	e22080e7          	jalr	-478(ra) # 4930 <close>
  if(total != N*SZ){
    3b16:	678d                	lui	a5,0x3
    3b18:	ee078793          	addi	a5,a5,-288 # 2ee0 <iref+0x114>
    3b1c:	02f99363          	bne	s3,a5,3b42 <bigfile+0x1c4>
  remove("bigfile.dat");
    3b20:	00003517          	auipc	a0,0x3
    3b24:	8e050513          	addi	a0,a0,-1824 # 6400 <malloc+0x169c>
    3b28:	00001097          	auipc	ra,0x1
    3b2c:	e8c080e7          	jalr	-372(ra) # 49b4 <remove>
}
    3b30:	70e2                	ld	ra,56(sp)
    3b32:	7442                	ld	s0,48(sp)
    3b34:	74a2                	ld	s1,40(sp)
    3b36:	7902                	ld	s2,32(sp)
    3b38:	69e2                	ld	s3,24(sp)
    3b3a:	6a42                	ld	s4,16(sp)
    3b3c:	6aa2                	ld	s5,8(sp)
    3b3e:	6121                	addi	sp,sp,64
    3b40:	8082                	ret
    printf("%s: read bigfile wrong total\n", s);
    3b42:	85d6                	mv	a1,s5
    3b44:	00003517          	auipc	a0,0x3
    3b48:	98450513          	addi	a0,a0,-1660 # 64c8 <malloc+0x1764>
    3b4c:	00001097          	auipc	ra,0x1
    3b50:	160080e7          	jalr	352(ra) # 4cac <printf>
    exit(1);
    3b54:	4505                	li	a0,1
    3b56:	00001097          	auipc	ra,0x1
    3b5a:	dae080e7          	jalr	-594(ra) # 4904 <exit>

0000000000003b5e <createdelete>:
{
    3b5e:	7171                	addi	sp,sp,-176
    3b60:	f506                	sd	ra,168(sp)
    3b62:	f122                	sd	s0,160(sp)
    3b64:	ed26                	sd	s1,152(sp)
    3b66:	e94a                	sd	s2,144(sp)
    3b68:	e54e                	sd	s3,136(sp)
    3b6a:	e152                	sd	s4,128(sp)
    3b6c:	fcd6                	sd	s5,120(sp)
    3b6e:	f8da                	sd	s6,112(sp)
    3b70:	f4de                	sd	s7,104(sp)
    3b72:	f0e2                	sd	s8,96(sp)
    3b74:	ece6                	sd	s9,88(sp)
    3b76:	e8ea                	sd	s10,80(sp)
    3b78:	e4ee                	sd	s11,72(sp)
    3b7a:	1900                	addi	s0,sp,176
    3b7c:	8daa                	mv	s11,a0
  char illegal[] = { '\"', '*', '/', ':', '<', '>', '?', '\\', '|', 0 };
    3b7e:	00003797          	auipc	a5,0x3
    3b82:	9d278793          	addi	a5,a5,-1582 # 6550 <malloc+0x17ec>
    3b86:	6398                	ld	a4,0(a5)
    3b88:	f6e43023          	sd	a4,-160(s0)
    3b8c:	0087d783          	lhu	a5,8(a5)
    3b90:	f6f41423          	sh	a5,-152(s0)
  for(pi = 0; pi < NCHILD; pi++){
    3b94:	4901                	li	s2,0
    3b96:	4991                	li	s3,4
    pid = fork();
    3b98:	00001097          	auipc	ra,0x1
    3b9c:	d64080e7          	jalr	-668(ra) # 48fc <fork>
    3ba0:	84aa                	mv	s1,a0
    if(pid < 0){
    3ba2:	04054263          	bltz	a0,3be6 <createdelete+0x88>
    if(pid == 0){
    3ba6:	cd31                	beqz	a0,3c02 <createdelete+0xa4>
  for(pi = 0; pi < NCHILD; pi++){
    3ba8:	2905                	addiw	s2,s2,1
    3baa:	ff3917e3          	bne	s2,s3,3b98 <createdelete+0x3a>
    3bae:	4491                	li	s1,4
    wait(&xstatus);
    3bb0:	f5c40913          	addi	s2,s0,-164
    3bb4:	854a                	mv	a0,s2
    3bb6:	00001097          	auipc	ra,0x1
    3bba:	d58080e7          	jalr	-680(ra) # 490e <wait>
    if(xstatus != 0)
    3bbe:	f5c42983          	lw	s3,-164(s0)
    3bc2:	10099963          	bnez	s3,3cd4 <createdelete+0x176>
  for(pi = 0; pi < NCHILD; pi++){
    3bc6:	34fd                	addiw	s1,s1,-1
    3bc8:	f4f5                	bnez	s1,3bb4 <createdelete+0x56>
  name[0] = name[1] = name[2] = 0;
    3bca:	f6040923          	sb	zero,-142(s0)
    3bce:	03000913          	li	s2,48
    3bd2:	5b7d                	li	s6,-1
    3bd4:	07000c93          	li	s9,112
      if (strchr(illegal, name[1]) != 0) { continue; }
    3bd8:	f6040a93          	addi	s5,s0,-160
      fd = open(name, 0);
    3bdc:	f7040c13          	addi	s8,s0,-144
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3be0:	4ba1                	li	s7,8
      if((i == 0 || i >= N/2) && fd < 0){
    3be2:	4d25                	li	s10,9
    3be4:	aa71                	j	3d80 <createdelete+0x222>
      printf("fork failed\n", s);
    3be6:	85ee                	mv	a1,s11
    3be8:	00002517          	auipc	a0,0x2
    3bec:	ce850513          	addi	a0,a0,-792 # 58d0 <malloc+0xb6c>
    3bf0:	00001097          	auipc	ra,0x1
    3bf4:	0bc080e7          	jalr	188(ra) # 4cac <printf>
      exit(1);
    3bf8:	4505                	li	a0,1
    3bfa:	00001097          	auipc	ra,0x1
    3bfe:	d0a080e7          	jalr	-758(ra) # 4904 <exit>
      name[0] = 'p' + pi;
    3c02:	0709091b          	addiw	s2,s2,112
    3c06:	f7240823          	sb	s2,-144(s0)
      name[2] = '\0';
    3c0a:	f6040923          	sb	zero,-142(s0)
        if (strchr(illegal, name[1]) == 0) {
    3c0e:	f6040913          	addi	s2,s0,-160
          fd = open(name, O_CREATE | O_RDWR);
    3c12:	f7040a13          	addi	s4,s0,-144
      for(i = 0; i < N; i++){
    3c16:	49d1                	li	s3,20
    3c18:	a091                	j	3c5c <createdelete+0xfe>
          fd = open(name, O_CREATE | O_RDWR);
    3c1a:	20200593          	li	a1,514
    3c1e:	8552                	mv	a0,s4
    3c20:	00001097          	auipc	ra,0x1
    3c24:	d2a080e7          	jalr	-726(ra) # 494a <open>
          if(fd < 0){
    3c28:	00054763          	bltz	a0,3c36 <createdelete+0xd8>
          close(fd);
    3c2c:	00001097          	auipc	ra,0x1
    3c30:	d04080e7          	jalr	-764(ra) # 4930 <close>
    3c34:	a081                	j	3c74 <createdelete+0x116>
            printf("%s: create %s failed\n", s, name);
    3c36:	f7040613          	addi	a2,s0,-144
    3c3a:	85ee                	mv	a1,s11
    3c3c:	00003517          	auipc	a0,0x3
    3c40:	8ac50513          	addi	a0,a0,-1876 # 64e8 <malloc+0x1784>
    3c44:	00001097          	auipc	ra,0x1
    3c48:	068080e7          	jalr	104(ra) # 4cac <printf>
            exit(1);
    3c4c:	4505                	li	a0,1
    3c4e:	00001097          	auipc	ra,0x1
    3c52:	cb6080e7          	jalr	-842(ra) # 4904 <exit>
      for(i = 0; i < N; i++){
    3c56:	2485                	addiw	s1,s1,1
    3c58:	07348963          	beq	s1,s3,3cca <createdelete+0x16c>
        name[1] = '0' + i;
    3c5c:	0304859b          	addiw	a1,s1,48
    3c60:	0ff5f593          	zext.b	a1,a1
    3c64:	f6b408a3          	sb	a1,-143(s0)
        if (strchr(illegal, name[1]) == 0) {
    3c68:	854a                	mv	a0,s2
    3c6a:	00001097          	auipc	ra,0x1
    3c6e:	aa4080e7          	jalr	-1372(ra) # 470e <strchr>
    3c72:	d545                	beqz	a0,3c1a <createdelete+0xbc>
        if(i > 0 && (i % 2 ) == 0){
    3c74:	fe9051e3          	blez	s1,3c56 <createdelete+0xf8>
    3c78:	0014f793          	andi	a5,s1,1
    3c7c:	ffe9                	bnez	a5,3c56 <createdelete+0xf8>
          name[1] = '0' + (i / 2);
    3c7e:	01f4d59b          	srliw	a1,s1,0x1f
    3c82:	9da5                	addw	a1,a1,s1
    3c84:	4015d59b          	sraiw	a1,a1,0x1
    3c88:	0305859b          	addiw	a1,a1,48
    3c8c:	0ff5f593          	zext.b	a1,a1
    3c90:	f6b408a3          	sb	a1,-143(s0)
          if (strchr(illegal, name[1]) == 0) {
    3c94:	854a                	mv	a0,s2
    3c96:	00001097          	auipc	ra,0x1
    3c9a:	a78080e7          	jalr	-1416(ra) # 470e <strchr>
    3c9e:	fd45                	bnez	a0,3c56 <createdelete+0xf8>
            if(remove(name) < 0){
    3ca0:	8552                	mv	a0,s4
    3ca2:	00001097          	auipc	ra,0x1
    3ca6:	d12080e7          	jalr	-750(ra) # 49b4 <remove>
    3caa:	fa0556e3          	bgez	a0,3c56 <createdelete+0xf8>
              printf("%s: remove failed\n", s);
    3cae:	85ee                	mv	a1,s11
    3cb0:	00002517          	auipc	a0,0x2
    3cb4:	56050513          	addi	a0,a0,1376 # 6210 <malloc+0x14ac>
    3cb8:	00001097          	auipc	ra,0x1
    3cbc:	ff4080e7          	jalr	-12(ra) # 4cac <printf>
              exit(1);
    3cc0:	4505                	li	a0,1
    3cc2:	00001097          	auipc	ra,0x1
    3cc6:	c42080e7          	jalr	-958(ra) # 4904 <exit>
      exit(0);
    3cca:	4501                	li	a0,0
    3ccc:	00001097          	auipc	ra,0x1
    3cd0:	c38080e7          	jalr	-968(ra) # 4904 <exit>
      exit(1);
    3cd4:	4505                	li	a0,1
    3cd6:	00001097          	auipc	ra,0x1
    3cda:	c2e080e7          	jalr	-978(ra) # 4904 <exit>
        printf("%s: oops createdelete %s didn't exist\n", s, name);
    3cde:	f7040613          	addi	a2,s0,-144
    3ce2:	85ee                	mv	a1,s11
    3ce4:	00003517          	auipc	a0,0x3
    3ce8:	81c50513          	addi	a0,a0,-2020 # 6500 <malloc+0x179c>
    3cec:	00001097          	auipc	ra,0x1
    3cf0:	fc0080e7          	jalr	-64(ra) # 4cac <printf>
        exit(1);
    3cf4:	4505                	li	a0,1
    3cf6:	00001097          	auipc	ra,0x1
    3cfa:	c0e080e7          	jalr	-1010(ra) # 4904 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3cfe:	056bf763          	bgeu	s7,s6,3d4c <createdelete+0x1ee>
      if(fd >= 0)
    3d02:	04055063          	bgez	a0,3d42 <createdelete+0x1e4>
    for(pi = 0; pi < NCHILD; pi++){
    3d06:	2485                	addiw	s1,s1,1
    3d08:	0ff4f493          	zext.b	s1,s1
    3d0c:	07448263          	beq	s1,s4,3d70 <createdelete+0x212>
      name[0] = 'p' + pi;
    3d10:	f6940823          	sb	s1,-144(s0)
      name[1] = '0' + i;
    3d14:	f72408a3          	sb	s2,-143(s0)
      if (strchr(illegal, name[1]) != 0) { continue; }
    3d18:	85ca                	mv	a1,s2
    3d1a:	8556                	mv	a0,s5
    3d1c:	00001097          	auipc	ra,0x1
    3d20:	9f2080e7          	jalr	-1550(ra) # 470e <strchr>
    3d24:	f16d                	bnez	a0,3d06 <createdelete+0x1a8>
      fd = open(name, 0);
    3d26:	4581                	li	a1,0
    3d28:	8562                	mv	a0,s8
    3d2a:	00001097          	auipc	ra,0x1
    3d2e:	c20080e7          	jalr	-992(ra) # 494a <open>
      if((i == 0 || i >= N/2) && fd < 0){
    3d32:	00098463          	beqz	s3,3d3a <createdelete+0x1dc>
    3d36:	fd3d54e3          	bge	s10,s3,3cfe <createdelete+0x1a0>
    3d3a:	fa0542e3          	bltz	a0,3cde <createdelete+0x180>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d3e:	016bf963          	bgeu	s7,s6,3d50 <createdelete+0x1f2>
        close(fd);
    3d42:	00001097          	auipc	ra,0x1
    3d46:	bee080e7          	jalr	-1042(ra) # 4930 <close>
    3d4a:	bf75                	j	3d06 <createdelete+0x1a8>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    3d4c:	fa054de3          	bltz	a0,3d06 <createdelete+0x1a8>
        printf("%s: oops createdelete %s did exist\n", s, name);
    3d50:	f7040613          	addi	a2,s0,-144
    3d54:	85ee                	mv	a1,s11
    3d56:	00002517          	auipc	a0,0x2
    3d5a:	7d250513          	addi	a0,a0,2002 # 6528 <malloc+0x17c4>
    3d5e:	00001097          	auipc	ra,0x1
    3d62:	f4e080e7          	jalr	-178(ra) # 4cac <printf>
        exit(1);
    3d66:	4505                	li	a0,1
    3d68:	00001097          	auipc	ra,0x1
    3d6c:	b9c080e7          	jalr	-1124(ra) # 4904 <exit>
  for(i = 0; i < N; i++){
    3d70:	2985                	addiw	s3,s3,1
    3d72:	2b05                	addiw	s6,s6,1
    3d74:	2905                	addiw	s2,s2,1
    3d76:	0ff97913          	zext.b	s2,s2
    3d7a:	47d1                	li	a5,20
    3d7c:	02f98b63          	beq	s3,a5,3db2 <createdelete+0x254>
    for(pi = 0; pi < NCHILD; pi++){
    3d80:	84e6                	mv	s1,s9
    3d82:	07400a13          	li	s4,116
    3d86:	b769                	j	3d10 <createdelete+0x1b2>
  for(i = 0; i < N; i++){
    3d88:	2905                	addiw	s2,s2,1
    3d8a:	0ff97913          	zext.b	s2,s2
    3d8e:	03590d63          	beq	s2,s5,3dc8 <createdelete+0x26a>
  name[0] = name[1] = name[2] = 0;
    3d92:	84da                	mv	s1,s6
      name[0] = 'p' + pi;
    3d94:	f6940823          	sb	s1,-144(s0)
      name[1] = '0' + i;
    3d98:	f72408a3          	sb	s2,-143(s0)
      remove(name);
    3d9c:	8552                	mv	a0,s4
    3d9e:	00001097          	auipc	ra,0x1
    3da2:	c16080e7          	jalr	-1002(ra) # 49b4 <remove>
    for(pi = 0; pi < NCHILD; pi++){
    3da6:	2485                	addiw	s1,s1,1
    3da8:	0ff4f493          	zext.b	s1,s1
    3dac:	ff3494e3          	bne	s1,s3,3d94 <createdelete+0x236>
    3db0:	bfe1                	j	3d88 <createdelete+0x22a>
    3db2:	03000913          	li	s2,48
  name[0] = name[1] = name[2] = 0;
    3db6:	07000b13          	li	s6,112
      remove(name);
    3dba:	f7040a13          	addi	s4,s0,-144
    for(pi = 0; pi < NCHILD; pi++){
    3dbe:	07400993          	li	s3,116
  for(i = 0; i < N; i++){
    3dc2:	04400a93          	li	s5,68
    3dc6:	b7f1                	j	3d92 <createdelete+0x234>
}
    3dc8:	70aa                	ld	ra,168(sp)
    3dca:	740a                	ld	s0,160(sp)
    3dcc:	64ea                	ld	s1,152(sp)
    3dce:	694a                	ld	s2,144(sp)
    3dd0:	69aa                	ld	s3,136(sp)
    3dd2:	6a0a                	ld	s4,128(sp)
    3dd4:	7ae6                	ld	s5,120(sp)
    3dd6:	7b46                	ld	s6,112(sp)
    3dd8:	7ba6                	ld	s7,104(sp)
    3dda:	7c06                	ld	s8,96(sp)
    3ddc:	6ce6                	ld	s9,88(sp)
    3dde:	6d46                	ld	s10,80(sp)
    3de0:	6da6                	ld	s11,72(sp)
    3de2:	614d                	addi	sp,sp,176
    3de4:	8082                	ret

0000000000003de6 <dirtest>:
{
    3de6:	1101                	addi	sp,sp,-32
    3de8:	ec06                	sd	ra,24(sp)
    3dea:	e822                	sd	s0,16(sp)
    3dec:	e426                	sd	s1,8(sp)
    3dee:	1000                	addi	s0,sp,32
    3df0:	84aa                	mv	s1,a0
  printf("mkdir test\n");
    3df2:	00002517          	auipc	a0,0x2
    3df6:	76e50513          	addi	a0,a0,1902 # 6560 <malloc+0x17fc>
    3dfa:	00001097          	auipc	ra,0x1
    3dfe:	eb2080e7          	jalr	-334(ra) # 4cac <printf>
  if(mkdir("dir0") < 0){
    3e02:	00002517          	auipc	a0,0x2
    3e06:	76e50513          	addi	a0,a0,1902 # 6570 <malloc+0x180c>
    3e0a:	00001097          	auipc	ra,0x1
    3e0e:	b50080e7          	jalr	-1200(ra) # 495a <mkdir>
    3e12:	04054d63          	bltz	a0,3e6c <dirtest+0x86>
  if(chdir("dir0") < 0){
    3e16:	00002517          	auipc	a0,0x2
    3e1a:	75a50513          	addi	a0,a0,1882 # 6570 <malloc+0x180c>
    3e1e:	00001097          	auipc	ra,0x1
    3e22:	b44080e7          	jalr	-1212(ra) # 4962 <chdir>
    3e26:	06054163          	bltz	a0,3e88 <dirtest+0xa2>
  if(chdir("..") < 0){
    3e2a:	00002517          	auipc	a0,0x2
    3e2e:	1a650513          	addi	a0,a0,422 # 5fd0 <malloc+0x126c>
    3e32:	00001097          	auipc	ra,0x1
    3e36:	b30080e7          	jalr	-1232(ra) # 4962 <chdir>
    3e3a:	06054563          	bltz	a0,3ea4 <dirtest+0xbe>
  if(remove("dir0") < 0){
    3e3e:	00002517          	auipc	a0,0x2
    3e42:	73250513          	addi	a0,a0,1842 # 6570 <malloc+0x180c>
    3e46:	00001097          	auipc	ra,0x1
    3e4a:	b6e080e7          	jalr	-1170(ra) # 49b4 <remove>
    3e4e:	06054963          	bltz	a0,3ec0 <dirtest+0xda>
  printf("%s: mkdir test ok\n");
    3e52:	00002517          	auipc	a0,0x2
    3e56:	76e50513          	addi	a0,a0,1902 # 65c0 <malloc+0x185c>
    3e5a:	00001097          	auipc	ra,0x1
    3e5e:	e52080e7          	jalr	-430(ra) # 4cac <printf>
}
    3e62:	60e2                	ld	ra,24(sp)
    3e64:	6442                	ld	s0,16(sp)
    3e66:	64a2                	ld	s1,8(sp)
    3e68:	6105                	addi	sp,sp,32
    3e6a:	8082                	ret
    printf("%s: mkdir failed\n", s);
    3e6c:	85a6                	mv	a1,s1
    3e6e:	00002517          	auipc	a0,0x2
    3e72:	ce250513          	addi	a0,a0,-798 # 5b50 <malloc+0xdec>
    3e76:	00001097          	auipc	ra,0x1
    3e7a:	e36080e7          	jalr	-458(ra) # 4cac <printf>
    exit(1);
    3e7e:	4505                	li	a0,1
    3e80:	00001097          	auipc	ra,0x1
    3e84:	a84080e7          	jalr	-1404(ra) # 4904 <exit>
    printf("%s: chdir dir0 failed\n", s);
    3e88:	85a6                	mv	a1,s1
    3e8a:	00002517          	auipc	a0,0x2
    3e8e:	6ee50513          	addi	a0,a0,1774 # 6578 <malloc+0x1814>
    3e92:	00001097          	auipc	ra,0x1
    3e96:	e1a080e7          	jalr	-486(ra) # 4cac <printf>
    exit(1);
    3e9a:	4505                	li	a0,1
    3e9c:	00001097          	auipc	ra,0x1
    3ea0:	a68080e7          	jalr	-1432(ra) # 4904 <exit>
    printf("%s: chdir .. failed\n", s);
    3ea4:	85a6                	mv	a1,s1
    3ea6:	00002517          	auipc	a0,0x2
    3eaa:	6ea50513          	addi	a0,a0,1770 # 6590 <malloc+0x182c>
    3eae:	00001097          	auipc	ra,0x1
    3eb2:	dfe080e7          	jalr	-514(ra) # 4cac <printf>
    exit(1);
    3eb6:	4505                	li	a0,1
    3eb8:	00001097          	auipc	ra,0x1
    3ebc:	a4c080e7          	jalr	-1460(ra) # 4904 <exit>
    printf("%s: remove dir0 failed\n", s);
    3ec0:	85a6                	mv	a1,s1
    3ec2:	00002517          	auipc	a0,0x2
    3ec6:	6e650513          	addi	a0,a0,1766 # 65a8 <malloc+0x1844>
    3eca:	00001097          	auipc	ra,0x1
    3ece:	de2080e7          	jalr	-542(ra) # 4cac <printf>
    exit(1);
    3ed2:	4505                	li	a0,1
    3ed4:	00001097          	auipc	ra,0x1
    3ed8:	a30080e7          	jalr	-1488(ra) # 4904 <exit>

0000000000003edc <fourteen>:
{
    3edc:	1101                	addi	sp,sp,-32
    3ede:	ec06                	sd	ra,24(sp)
    3ee0:	e822                	sd	s0,16(sp)
    3ee2:	e426                	sd	s1,8(sp)
    3ee4:	1000                	addi	s0,sp,32
    3ee6:	84aa                	mv	s1,a0
  if(mkdir("12345678901234") != 0){
    3ee8:	00003517          	auipc	a0,0x3
    3eec:	8c050513          	addi	a0,a0,-1856 # 67a8 <malloc+0x1a44>
    3ef0:	00001097          	auipc	ra,0x1
    3ef4:	a6a080e7          	jalr	-1430(ra) # 495a <mkdir>
    3ef8:	e165                	bnez	a0,3fd8 <fourteen+0xfc>
  if(mkdir("12345678901234/123456789012345") != 0){
    3efa:	00002517          	auipc	a0,0x2
    3efe:	70650513          	addi	a0,a0,1798 # 6600 <malloc+0x189c>
    3f02:	00001097          	auipc	ra,0x1
    3f06:	a58080e7          	jalr	-1448(ra) # 495a <mkdir>
    3f0a:	e56d                	bnez	a0,3ff4 <fourteen+0x118>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    3f0c:	20000593          	li	a1,512
    3f10:	00002517          	auipc	a0,0x2
    3f14:	74850513          	addi	a0,a0,1864 # 6658 <malloc+0x18f4>
    3f18:	00001097          	auipc	ra,0x1
    3f1c:	a32080e7          	jalr	-1486(ra) # 494a <open>
  if(fd < 0){
    3f20:	0e054863          	bltz	a0,4010 <fourteen+0x134>
  close(fd);
    3f24:	00001097          	auipc	ra,0x1
    3f28:	a0c080e7          	jalr	-1524(ra) # 4930 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    3f2c:	4581                	li	a1,0
    3f2e:	00002517          	auipc	a0,0x2
    3f32:	7a250513          	addi	a0,a0,1954 # 66d0 <malloc+0x196c>
    3f36:	00001097          	auipc	ra,0x1
    3f3a:	a14080e7          	jalr	-1516(ra) # 494a <open>
  if(fd < 0){
    3f3e:	0e054763          	bltz	a0,402c <fourteen+0x150>
  close(fd);
    3f42:	00001097          	auipc	ra,0x1
    3f46:	9ee080e7          	jalr	-1554(ra) # 4930 <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    3f4a:	00002517          	auipc	a0,0x2
    3f4e:	7f650513          	addi	a0,a0,2038 # 6740 <malloc+0x19dc>
    3f52:	00001097          	auipc	ra,0x1
    3f56:	a08080e7          	jalr	-1528(ra) # 495a <mkdir>
    3f5a:	c57d                	beqz	a0,4048 <fourteen+0x16c>
  if(mkdir("123456789012345/12345678901234") == 0){
    3f5c:	00003517          	auipc	a0,0x3
    3f60:	83c50513          	addi	a0,a0,-1988 # 6798 <malloc+0x1a34>
    3f64:	00001097          	auipc	ra,0x1
    3f68:	9f6080e7          	jalr	-1546(ra) # 495a <mkdir>
    3f6c:	cd65                	beqz	a0,4064 <fourteen+0x188>
  remove("123456789012345/12345678901234");
    3f6e:	00003517          	auipc	a0,0x3
    3f72:	82a50513          	addi	a0,a0,-2006 # 6798 <malloc+0x1a34>
    3f76:	00001097          	auipc	ra,0x1
    3f7a:	a3e080e7          	jalr	-1474(ra) # 49b4 <remove>
  remove("12345678901234/12345678901234");
    3f7e:	00002517          	auipc	a0,0x2
    3f82:	7c250513          	addi	a0,a0,1986 # 6740 <malloc+0x19dc>
    3f86:	00001097          	auipc	ra,0x1
    3f8a:	a2e080e7          	jalr	-1490(ra) # 49b4 <remove>
  remove("12345678901234/12345678901234/12345678901234");
    3f8e:	00002517          	auipc	a0,0x2
    3f92:	74250513          	addi	a0,a0,1858 # 66d0 <malloc+0x196c>
    3f96:	00001097          	auipc	ra,0x1
    3f9a:	a1e080e7          	jalr	-1506(ra) # 49b4 <remove>
  remove("123456789012345/123456789012345/123456789012345");
    3f9e:	00002517          	auipc	a0,0x2
    3fa2:	6ba50513          	addi	a0,a0,1722 # 6658 <malloc+0x18f4>
    3fa6:	00001097          	auipc	ra,0x1
    3faa:	a0e080e7          	jalr	-1522(ra) # 49b4 <remove>
  remove("12345678901234/123456789012345");
    3fae:	00002517          	auipc	a0,0x2
    3fb2:	65250513          	addi	a0,a0,1618 # 6600 <malloc+0x189c>
    3fb6:	00001097          	auipc	ra,0x1
    3fba:	9fe080e7          	jalr	-1538(ra) # 49b4 <remove>
  remove("12345678901234");
    3fbe:	00002517          	auipc	a0,0x2
    3fc2:	7ea50513          	addi	a0,a0,2026 # 67a8 <malloc+0x1a44>
    3fc6:	00001097          	auipc	ra,0x1
    3fca:	9ee080e7          	jalr	-1554(ra) # 49b4 <remove>
}
    3fce:	60e2                	ld	ra,24(sp)
    3fd0:	6442                	ld	s0,16(sp)
    3fd2:	64a2                	ld	s1,8(sp)
    3fd4:	6105                	addi	sp,sp,32
    3fd6:	8082                	ret
    printf("%s: mkdir 12345678901234 failed\n", s);
    3fd8:	85a6                	mv	a1,s1
    3fda:	00002517          	auipc	a0,0x2
    3fde:	5fe50513          	addi	a0,a0,1534 # 65d8 <malloc+0x1874>
    3fe2:	00001097          	auipc	ra,0x1
    3fe6:	cca080e7          	jalr	-822(ra) # 4cac <printf>
    exit(1);
    3fea:	4505                	li	a0,1
    3fec:	00001097          	auipc	ra,0x1
    3ff0:	918080e7          	jalr	-1768(ra) # 4904 <exit>
    printf("%s: mkdir 12345678901234/123456789012345 failed\n", s);
    3ff4:	85a6                	mv	a1,s1
    3ff6:	00002517          	auipc	a0,0x2
    3ffa:	62a50513          	addi	a0,a0,1578 # 6620 <malloc+0x18bc>
    3ffe:	00001097          	auipc	ra,0x1
    4002:	cae080e7          	jalr	-850(ra) # 4cac <printf>
    exit(1);
    4006:	4505                	li	a0,1
    4008:	00001097          	auipc	ra,0x1
    400c:	8fc080e7          	jalr	-1796(ra) # 4904 <exit>
    printf("%s: create 123456789012345/123456789012345/123456789012345 failed\n", s);
    4010:	85a6                	mv	a1,s1
    4012:	00002517          	auipc	a0,0x2
    4016:	67650513          	addi	a0,a0,1654 # 6688 <malloc+0x1924>
    401a:	00001097          	auipc	ra,0x1
    401e:	c92080e7          	jalr	-878(ra) # 4cac <printf>
    exit(1);
    4022:	4505                	li	a0,1
    4024:	00001097          	auipc	ra,0x1
    4028:	8e0080e7          	jalr	-1824(ra) # 4904 <exit>
    printf("%s: open 12345678901234/12345678901234/12345678901234 failed\n", s);
    402c:	85a6                	mv	a1,s1
    402e:	00002517          	auipc	a0,0x2
    4032:	6d250513          	addi	a0,a0,1746 # 6700 <malloc+0x199c>
    4036:	00001097          	auipc	ra,0x1
    403a:	c76080e7          	jalr	-906(ra) # 4cac <printf>
    exit(1);
    403e:	4505                	li	a0,1
    4040:	00001097          	auipc	ra,0x1
    4044:	8c4080e7          	jalr	-1852(ra) # 4904 <exit>
    printf("%s: mkdir 12345678901234/12345678901234 succeeded!\n", s);
    4048:	85a6                	mv	a1,s1
    404a:	00002517          	auipc	a0,0x2
    404e:	71650513          	addi	a0,a0,1814 # 6760 <malloc+0x19fc>
    4052:	00001097          	auipc	ra,0x1
    4056:	c5a080e7          	jalr	-934(ra) # 4cac <printf>
    exit(1);
    405a:	4505                	li	a0,1
    405c:	00001097          	auipc	ra,0x1
    4060:	8a8080e7          	jalr	-1880(ra) # 4904 <exit>
    printf("%s: mkdir 12345678901234/123456789012345 succeeded!\n", s);
    4064:	85a6                	mv	a1,s1
    4066:	00002517          	auipc	a0,0x2
    406a:	75250513          	addi	a0,a0,1874 # 67b8 <malloc+0x1a54>
    406e:	00001097          	auipc	ra,0x1
    4072:	c3e080e7          	jalr	-962(ra) # 4cac <printf>
    exit(1);
    4076:	4505                	li	a0,1
    4078:	00001097          	auipc	ra,0x1
    407c:	88c080e7          	jalr	-1908(ra) # 4904 <exit>

0000000000004080 <fsfull>:
{
    4080:	7171                	addi	sp,sp,-176
    4082:	f506                	sd	ra,168(sp)
    4084:	f122                	sd	s0,160(sp)
    4086:	ed26                	sd	s1,152(sp)
    4088:	e94a                	sd	s2,144(sp)
    408a:	e54e                	sd	s3,136(sp)
    408c:	e152                	sd	s4,128(sp)
    408e:	fcd6                	sd	s5,120(sp)
    4090:	f8da                	sd	s6,112(sp)
    4092:	f4de                	sd	s7,104(sp)
    4094:	f0e2                	sd	s8,96(sp)
    4096:	ece6                	sd	s9,88(sp)
    4098:	e8ea                	sd	s10,80(sp)
    409a:	e4ee                	sd	s11,72(sp)
    409c:	1900                	addi	s0,sp,176
  printf("fsfull test\n");
    409e:	00002517          	auipc	a0,0x2
    40a2:	75250513          	addi	a0,a0,1874 # 67f0 <malloc+0x1a8c>
    40a6:	00001097          	auipc	ra,0x1
    40aa:	c06080e7          	jalr	-1018(ra) # 4cac <printf>
  for(nfiles = 0; ; nfiles++){
    40ae:	4481                	li	s1,0
    name[0] = 'f';
    40b0:	06600d93          	li	s11,102
    name[1] = '0' + nfiles / 1000;
    40b4:	3e800c93          	li	s9,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    40b8:	06400c13          	li	s8,100
    name[3] = '0' + (nfiles % 100) / 10;
    40bc:	4ba9                	li	s7,10
    printf("%s: writing %s\n", name);
    40be:	f5040b13          	addi	s6,s0,-176
    40c2:	00002d17          	auipc	s10,0x2
    40c6:	73ed0d13          	addi	s10,s10,1854 # 6800 <malloc+0x1a9c>
      int cc = write(fd, buf, BSIZE);
    40ca:	00006a17          	auipc	s4,0x6
    40ce:	7aea0a13          	addi	s4,s4,1966 # a878 <buf>
    name[0] = 'f';
    40d2:	f5b40823          	sb	s11,-176(s0)
    name[1] = '0' + nfiles / 1000;
    40d6:	0394c7bb          	divw	a5,s1,s9
    40da:	0307879b          	addiw	a5,a5,48
    40de:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    40e2:	0394e7bb          	remw	a5,s1,s9
    40e6:	0387c7bb          	divw	a5,a5,s8
    40ea:	0307879b          	addiw	a5,a5,48
    40ee:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    40f2:	0384e7bb          	remw	a5,s1,s8
    40f6:	0377c7bb          	divw	a5,a5,s7
    40fa:	0307879b          	addiw	a5,a5,48
    40fe:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    4102:	0374e7bb          	remw	a5,s1,s7
    4106:	0307879b          	addiw	a5,a5,48
    410a:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    410e:	f4040aa3          	sb	zero,-171(s0)
    printf("%s: writing %s\n", name);
    4112:	85da                	mv	a1,s6
    4114:	856a                	mv	a0,s10
    4116:	00001097          	auipc	ra,0x1
    411a:	b96080e7          	jalr	-1130(ra) # 4cac <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    411e:	20200593          	li	a1,514
    4122:	855a                	mv	a0,s6
    4124:	00001097          	auipc	ra,0x1
    4128:	826080e7          	jalr	-2010(ra) # 494a <open>
    412c:	892a                	mv	s2,a0
    if(fd < 0){
    412e:	0a055763          	bgez	a0,41dc <fsfull+0x15c>
      printf("%s: open %s failed\n", name);
    4132:	f5040593          	addi	a1,s0,-176
    4136:	00002517          	auipc	a0,0x2
    413a:	6da50513          	addi	a0,a0,1754 # 6810 <malloc+0x1aac>
    413e:	00001097          	auipc	ra,0x1
    4142:	b6e080e7          	jalr	-1170(ra) # 4cac <printf>
  while(nfiles >= 0){
    4146:	0604c463          	bltz	s1,41ae <fsfull+0x12e>
    name[0] = 'f';
    414a:	06600b93          	li	s7,102
    name[1] = '0' + nfiles / 1000;
    414e:	3e800a13          	li	s4,1000
    name[2] = '0' + (nfiles % 1000) / 100;
    4152:	06400993          	li	s3,100
    name[3] = '0' + (nfiles % 100) / 10;
    4156:	4929                	li	s2,10
    remove(name);
    4158:	f5040b13          	addi	s6,s0,-176
  while(nfiles >= 0){
    415c:	5afd                	li	s5,-1
    name[0] = 'f';
    415e:	f5740823          	sb	s7,-176(s0)
    name[1] = '0' + nfiles / 1000;
    4162:	0344c7bb          	divw	a5,s1,s4
    4166:	0307879b          	addiw	a5,a5,48
    416a:	f4f408a3          	sb	a5,-175(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    416e:	0344e7bb          	remw	a5,s1,s4
    4172:	0337c7bb          	divw	a5,a5,s3
    4176:	0307879b          	addiw	a5,a5,48
    417a:	f4f40923          	sb	a5,-174(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    417e:	0334e7bb          	remw	a5,s1,s3
    4182:	0327c7bb          	divw	a5,a5,s2
    4186:	0307879b          	addiw	a5,a5,48
    418a:	f4f409a3          	sb	a5,-173(s0)
    name[4] = '0' + (nfiles % 10);
    418e:	0324e7bb          	remw	a5,s1,s2
    4192:	0307879b          	addiw	a5,a5,48
    4196:	f4f40a23          	sb	a5,-172(s0)
    name[5] = '\0';
    419a:	f4040aa3          	sb	zero,-171(s0)
    remove(name);
    419e:	855a                	mv	a0,s6
    41a0:	00001097          	auipc	ra,0x1
    41a4:	814080e7          	jalr	-2028(ra) # 49b4 <remove>
    nfiles--;
    41a8:	34fd                	addiw	s1,s1,-1
  while(nfiles >= 0){
    41aa:	fb549ae3          	bne	s1,s5,415e <fsfull+0xde>
  printf("fsfull test finished\n");
    41ae:	00002517          	auipc	a0,0x2
    41b2:	69250513          	addi	a0,a0,1682 # 6840 <malloc+0x1adc>
    41b6:	00001097          	auipc	ra,0x1
    41ba:	af6080e7          	jalr	-1290(ra) # 4cac <printf>
}
    41be:	70aa                	ld	ra,168(sp)
    41c0:	740a                	ld	s0,160(sp)
    41c2:	64ea                	ld	s1,152(sp)
    41c4:	694a                	ld	s2,144(sp)
    41c6:	69aa                	ld	s3,136(sp)
    41c8:	6a0a                	ld	s4,128(sp)
    41ca:	7ae6                	ld	s5,120(sp)
    41cc:	7b46                	ld	s6,112(sp)
    41ce:	7ba6                	ld	s7,104(sp)
    41d0:	7c06                	ld	s8,96(sp)
    41d2:	6ce6                	ld	s9,88(sp)
    41d4:	6d46                	ld	s10,80(sp)
    41d6:	6da6                	ld	s11,72(sp)
    41d8:	614d                	addi	sp,sp,176
    41da:	8082                	ret
    int total = 0;
    41dc:	4981                	li	s3,0
      if(cc < BSIZE)
    41de:	1ff00a93          	li	s5,511
      int cc = write(fd, buf, BSIZE);
    41e2:	20000613          	li	a2,512
    41e6:	85d2                	mv	a1,s4
    41e8:	854a                	mv	a0,s2
    41ea:	00000097          	auipc	ra,0x0
    41ee:	73c080e7          	jalr	1852(ra) # 4926 <write>
      if(cc < BSIZE)
    41f2:	00aad563          	bge	s5,a0,41fc <fsfull+0x17c>
      total += cc;
    41f6:	00a989bb          	addw	s3,s3,a0
    while(1){
    41fa:	b7e5                	j	41e2 <fsfull+0x162>
    printf("%s: wrote %d bytes\n", total);
    41fc:	85ce                	mv	a1,s3
    41fe:	00002517          	auipc	a0,0x2
    4202:	62a50513          	addi	a0,a0,1578 # 6828 <malloc+0x1ac4>
    4206:	00001097          	auipc	ra,0x1
    420a:	aa6080e7          	jalr	-1370(ra) # 4cac <printf>
    close(fd);
    420e:	854a                	mv	a0,s2
    4210:	00000097          	auipc	ra,0x0
    4214:	720080e7          	jalr	1824(ra) # 4930 <close>
    if(total == 0)
    4218:	f20987e3          	beqz	s3,4146 <fsfull+0xc6>
  for(nfiles = 0; ; nfiles++){
    421c:	2485                	addiw	s1,s1,1
    421e:	bd55                	j	40d2 <fsfull+0x52>

0000000000004220 <rand>:
{
    4220:	1141                	addi	sp,sp,-16
    4222:	e422                	sd	s0,8(sp)
    4224:	0800                	addi	s0,sp,16
  randstate = randstate * 1664525 + 1013904223;
    4226:	00003717          	auipc	a4,0x3
    422a:	aca70713          	addi	a4,a4,-1334 # 6cf0 <__DATA_BEGIN__>
    422e:	7308                	ld	a0,32(a4)
    4230:	001967b7          	lui	a5,0x196
    4234:	60d78793          	addi	a5,a5,1549 # 19660d <__BSS_END__+0x18a57d>
    4238:	02f50533          	mul	a0,a0,a5
    423c:	3c6ef7b7          	lui	a5,0x3c6ef
    4240:	35f78793          	addi	a5,a5,863 # 3c6ef35f <__BSS_END__+0x3c6e32cf>
    4244:	953e                	add	a0,a0,a5
    4246:	f308                	sd	a0,32(a4)
}
    4248:	2501                	sext.w	a0,a0
    424a:	6422                	ld	s0,8(sp)
    424c:	0141                	addi	sp,sp,16
    424e:	8082                	ret

0000000000004250 <countfree>:
// because out of memory with lazy allocation results in the process
// taking a fault and being killed, fork and report back.
//
int
countfree()
{
    4250:	7139                	addi	sp,sp,-64
    4252:	fc06                	sd	ra,56(sp)
    4254:	f822                	sd	s0,48(sp)
    4256:	f426                	sd	s1,40(sp)
    4258:	f04a                	sd	s2,32(sp)
    425a:	ec4e                	sd	s3,24(sp)
    425c:	0080                	addi	s0,sp,64
  int fds[2];

  if(pipe(fds) < 0){
    425e:	fc840513          	addi	a0,s0,-56
    4262:	00000097          	auipc	ra,0x0
    4266:	6b4080e7          	jalr	1716(ra) # 4916 <pipe>
    426a:	06054763          	bltz	a0,42d8 <countfree+0x88>
    printf("pipe() failed in countfree()\n");
    exit(1);
  }
  
  int pid = fork();
    426e:	00000097          	auipc	ra,0x0
    4272:	68e080e7          	jalr	1678(ra) # 48fc <fork>

  if(pid < 0){
    4276:	06054e63          	bltz	a0,42f2 <countfree+0xa2>
    printf("fork failed in countfree()\n");
    exit(1);
  }

  if(pid == 0){
    427a:	ed51                	bnez	a0,4316 <countfree+0xc6>
    close(fds[0]);
    427c:	fc842503          	lw	a0,-56(s0)
    4280:	00000097          	auipc	ra,0x0
    4284:	6b0080e7          	jalr	1712(ra) # 4930 <close>
    
    while(1){
      uint64 a = (uint64) sbrk(4096);
      if(a == 0xffffffffffffffff){
    4288:	597d                	li	s2,-1
        break;
      }

      // modify the memory to make sure it's really allocated.
      *(char *)(a + 4096 - 1) = 1;
    428a:	4485                	li	s1,1

      // report back one more page.
      if(write(fds[1], "x", 1) != 1){
    428c:	00001997          	auipc	s3,0x1
    4290:	ca498993          	addi	s3,s3,-860 # 4f30 <malloc+0x1cc>
      uint64 a = (uint64) sbrk(4096);
    4294:	6505                	lui	a0,0x1
    4296:	00000097          	auipc	ra,0x0
    429a:	6e6080e7          	jalr	1766(ra) # 497c <sbrk>
      if(a == 0xffffffffffffffff){
    429e:	07250763          	beq	a0,s2,430c <countfree+0xbc>
      *(char *)(a + 4096 - 1) = 1;
    42a2:	6785                	lui	a5,0x1
    42a4:	97aa                	add	a5,a5,a0
    42a6:	fe978fa3          	sb	s1,-1(a5) # fff <copyinstr2+0xbd>
      if(write(fds[1], "x", 1) != 1){
    42aa:	8626                	mv	a2,s1
    42ac:	85ce                	mv	a1,s3
    42ae:	fcc42503          	lw	a0,-52(s0)
    42b2:	00000097          	auipc	ra,0x0
    42b6:	674080e7          	jalr	1652(ra) # 4926 <write>
    42ba:	fc950de3          	beq	a0,s1,4294 <countfree+0x44>
        printf("write() failed in countfree()\n");
    42be:	00002517          	auipc	a0,0x2
    42c2:	5da50513          	addi	a0,a0,1498 # 6898 <malloc+0x1b34>
    42c6:	00001097          	auipc	ra,0x1
    42ca:	9e6080e7          	jalr	-1562(ra) # 4cac <printf>
        exit(1);
    42ce:	4505                	li	a0,1
    42d0:	00000097          	auipc	ra,0x0
    42d4:	634080e7          	jalr	1588(ra) # 4904 <exit>
    printf("pipe() failed in countfree()\n");
    42d8:	00002517          	auipc	a0,0x2
    42dc:	58050513          	addi	a0,a0,1408 # 6858 <malloc+0x1af4>
    42e0:	00001097          	auipc	ra,0x1
    42e4:	9cc080e7          	jalr	-1588(ra) # 4cac <printf>
    exit(1);
    42e8:	4505                	li	a0,1
    42ea:	00000097          	auipc	ra,0x0
    42ee:	61a080e7          	jalr	1562(ra) # 4904 <exit>
    printf("fork failed in countfree()\n");
    42f2:	00002517          	auipc	a0,0x2
    42f6:	58650513          	addi	a0,a0,1414 # 6878 <malloc+0x1b14>
    42fa:	00001097          	auipc	ra,0x1
    42fe:	9b2080e7          	jalr	-1614(ra) # 4cac <printf>
    exit(1);
    4302:	4505                	li	a0,1
    4304:	00000097          	auipc	ra,0x0
    4308:	600080e7          	jalr	1536(ra) # 4904 <exit>
      }
    }

    exit(0);
    430c:	4501                	li	a0,0
    430e:	00000097          	auipc	ra,0x0
    4312:	5f6080e7          	jalr	1526(ra) # 4904 <exit>
  }

  close(fds[1]);
    4316:	fcc42503          	lw	a0,-52(s0)
    431a:	00000097          	auipc	ra,0x0
    431e:	616080e7          	jalr	1558(ra) # 4930 <close>

  int n = 0;
    4322:	4481                	li	s1,0
  while(1){
    char c;
    int cc = read(fds[0], &c, 1);
    4324:	fc740913          	addi	s2,s0,-57
    4328:	4605                	li	a2,1
    432a:	85ca                	mv	a1,s2
    432c:	fc842503          	lw	a0,-56(s0)
    4330:	00000097          	auipc	ra,0x0
    4334:	5ee080e7          	jalr	1518(ra) # 491e <read>
    if(cc < 0){
    4338:	00054563          	bltz	a0,4342 <countfree+0xf2>
      printf("read() failed in countfree()\n");
      exit(1);
    }
    if(cc == 0)
    433c:	c105                	beqz	a0,435c <countfree+0x10c>
      break;
    n += 1;
    433e:	2485                	addiw	s1,s1,1
  while(1){
    4340:	b7e5                	j	4328 <countfree+0xd8>
      printf("read() failed in countfree()\n");
    4342:	00002517          	auipc	a0,0x2
    4346:	57650513          	addi	a0,a0,1398 # 68b8 <malloc+0x1b54>
    434a:	00001097          	auipc	ra,0x1
    434e:	962080e7          	jalr	-1694(ra) # 4cac <printf>
      exit(1);
    4352:	4505                	li	a0,1
    4354:	00000097          	auipc	ra,0x0
    4358:	5b0080e7          	jalr	1456(ra) # 4904 <exit>
  }

  close(fds[0]);
    435c:	fc842503          	lw	a0,-56(s0)
    4360:	00000097          	auipc	ra,0x0
    4364:	5d0080e7          	jalr	1488(ra) # 4930 <close>
  wait((int*)0);
    4368:	4501                	li	a0,0
    436a:	00000097          	auipc	ra,0x0
    436e:	5a4080e7          	jalr	1444(ra) # 490e <wait>
  
  return n;
}
    4372:	8526                	mv	a0,s1
    4374:	70e2                	ld	ra,56(sp)
    4376:	7442                	ld	s0,48(sp)
    4378:	74a2                	ld	s1,40(sp)
    437a:	7902                	ld	s2,32(sp)
    437c:	69e2                	ld	s3,24(sp)
    437e:	6121                	addi	sp,sp,64
    4380:	8082                	ret

0000000000004382 <run>:

// run each test in its own process. run returns 1 if child's exit()
// indicates success.
int
run(void f(char *), char *s) {
    4382:	7179                	addi	sp,sp,-48
    4384:	f406                	sd	ra,40(sp)
    4386:	f022                	sd	s0,32(sp)
    4388:	ec26                	sd	s1,24(sp)
    438a:	e84a                	sd	s2,16(sp)
    438c:	1800                	addi	s0,sp,48
    438e:	84aa                	mv	s1,a0
    4390:	892e                	mv	s2,a1
  int pid;
  int xstatus;

  printf("test %s: ", s);
    4392:	00002517          	auipc	a0,0x2
    4396:	54650513          	addi	a0,a0,1350 # 68d8 <malloc+0x1b74>
    439a:	00001097          	auipc	ra,0x1
    439e:	912080e7          	jalr	-1774(ra) # 4cac <printf>
  if((pid = fork()) < 0) {
    43a2:	00000097          	auipc	ra,0x0
    43a6:	55a080e7          	jalr	1370(ra) # 48fc <fork>
    43aa:	02054e63          	bltz	a0,43e6 <run+0x64>
    printf("runtest: fork error\n");
    exit(1);
  }
  if(pid == 0) {
    43ae:	c929                	beqz	a0,4400 <run+0x7e>
    f(s);
    exit(0);
  } else {
    wait(&xstatus);
    43b0:	fdc40513          	addi	a0,s0,-36
    43b4:	00000097          	auipc	ra,0x0
    43b8:	55a080e7          	jalr	1370(ra) # 490e <wait>
    if(xstatus != 0) 
    43bc:	fdc42783          	lw	a5,-36(s0)
    43c0:	c7b9                	beqz	a5,440e <run+0x8c>
      printf("FAILED\n");
    43c2:	00002517          	auipc	a0,0x2
    43c6:	53e50513          	addi	a0,a0,1342 # 6900 <malloc+0x1b9c>
    43ca:	00001097          	auipc	ra,0x1
    43ce:	8e2080e7          	jalr	-1822(ra) # 4cac <printf>
    else
      printf("OK\n");
    return xstatus == 0;
    43d2:	fdc42503          	lw	a0,-36(s0)
  }
}
    43d6:	00153513          	seqz	a0,a0
    43da:	70a2                	ld	ra,40(sp)
    43dc:	7402                	ld	s0,32(sp)
    43de:	64e2                	ld	s1,24(sp)
    43e0:	6942                	ld	s2,16(sp)
    43e2:	6145                	addi	sp,sp,48
    43e4:	8082                	ret
    printf("runtest: fork error\n");
    43e6:	00002517          	auipc	a0,0x2
    43ea:	50250513          	addi	a0,a0,1282 # 68e8 <malloc+0x1b84>
    43ee:	00001097          	auipc	ra,0x1
    43f2:	8be080e7          	jalr	-1858(ra) # 4cac <printf>
    exit(1);
    43f6:	4505                	li	a0,1
    43f8:	00000097          	auipc	ra,0x0
    43fc:	50c080e7          	jalr	1292(ra) # 4904 <exit>
    f(s);
    4400:	854a                	mv	a0,s2
    4402:	9482                	jalr	s1
    exit(0);
    4404:	4501                	li	a0,0
    4406:	00000097          	auipc	ra,0x0
    440a:	4fe080e7          	jalr	1278(ra) # 4904 <exit>
      printf("OK\n");
    440e:	00002517          	auipc	a0,0x2
    4412:	4fa50513          	addi	a0,a0,1274 # 6908 <malloc+0x1ba4>
    4416:	00001097          	auipc	ra,0x1
    441a:	896080e7          	jalr	-1898(ra) # 4cac <printf>
    441e:	bf55                	j	43d2 <run+0x50>

0000000000004420 <main>:

int
main(int argc, char *argv[])
{
    4420:	c8010113          	addi	sp,sp,-896
    4424:	36113c23          	sd	ra,888(sp)
    4428:	36813823          	sd	s0,880(sp)
    442c:	36913423          	sd	s1,872(sp)
    4430:	37213023          	sd	s2,864(sp)
    4434:	35313c23          	sd	s3,856(sp)
    4438:	35413823          	sd	s4,848(sp)
    443c:	35513423          	sd	s5,840(sp)
    4440:	35613023          	sd	s6,832(sp)
    4444:	0700                	addi	s0,sp,896
    4446:	89aa                	mv	s3,a0
  int continuous = 0;
  char *justone = 0;

  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    4448:	4789                	li	a5,2
    444a:	08f50763          	beq	a0,a5,44d8 <main+0xb8>
    continuous = 1;
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    continuous = 2;
  } else if(argc == 2 && argv[1][0] != '-'){
    justone = argv[1];
  } else if(argc > 1){
    444e:	4785                	li	a5,1
  char *justone = 0;
    4450:	4901                	li	s2,0
  } else if(argc > 1){
    4452:	0ca7c163          	blt	a5,a0,4514 <main+0xf4>
  }
  
  struct test {
    void (*f)(char *);
    char *s;
  } tests[] = {
    4456:	00003797          	auipc	a5,0x3
    445a:	8c278793          	addi	a5,a5,-1854 # 6d18 <randstate+0x8>
    445e:	c8040713          	addi	a4,s0,-896
    4462:	00003817          	auipc	a6,0x3
    4466:	bf680813          	addi	a6,a6,-1034 # 7058 <name>
    446a:	6388                	ld	a0,0(a5)
    446c:	678c                	ld	a1,8(a5)
    446e:	6b90                	ld	a2,16(a5)
    4470:	6f94                	ld	a3,24(a5)
    4472:	e308                	sd	a0,0(a4)
    4474:	e70c                	sd	a1,8(a4)
    4476:	eb10                	sd	a2,16(a4)
    4478:	ef14                	sd	a3,24(a4)
    447a:	02078793          	addi	a5,a5,32
    447e:	02070713          	addi	a4,a4,32
    4482:	ff0794e3          	bne	a5,a6,446a <main+0x4a>
          exit(1);
      }
    }
  }

  printf("usertests starting\n");
    4486:	00002517          	auipc	a0,0x2
    448a:	53a50513          	addi	a0,a0,1338 # 69c0 <malloc+0x1c5c>
    448e:	00001097          	auipc	ra,0x1
    4492:	81e080e7          	jalr	-2018(ra) # 4cac <printf>
  int free0 = countfree();
    4496:	00000097          	auipc	ra,0x0
    449a:	dba080e7          	jalr	-582(ra) # 4250 <countfree>
    449e:	8a2a                	mv	s4,a0
  int free1 = 0;
  int fail = 0;
  for (struct test *t = tests; t->s != 0; t++) {
    44a0:	c8843503          	ld	a0,-888(s0)
    44a4:	c8040493          	addi	s1,s0,-896
  int fail = 0;
    44a8:	4981                	li	s3,0
    if((justone == 0) || strcmp(t->s, justone) == 0) {
      if(!run(t->f, t->s))
        fail = 1;
    44aa:	4a85                	li	s5,1
  for (struct test *t = tests; t->s != 0; t++) {
    44ac:	e55d                	bnez	a0,455a <main+0x13a>
  }

  if(fail){
    printf("SOME TESTS FAILED\n");
    exit(1);
  } else if((free1 = countfree()) < free0){
    44ae:	00000097          	auipc	ra,0x0
    44b2:	da2080e7          	jalr	-606(ra) # 4250 <countfree>
    44b6:	85aa                	mv	a1,a0
    44b8:	0f455163          	bge	a0,s4,459a <main+0x17a>
    printf("FAILED -- lost some free pages %d (out of %d)\n", free1, free0);
    44bc:	8652                	mv	a2,s4
    44be:	00002517          	auipc	a0,0x2
    44c2:	4ba50513          	addi	a0,a0,1210 # 6978 <malloc+0x1c14>
    44c6:	00000097          	auipc	ra,0x0
    44ca:	7e6080e7          	jalr	2022(ra) # 4cac <printf>
    exit(1);
    44ce:	4505                	li	a0,1
    44d0:	00000097          	auipc	ra,0x0
    44d4:	434080e7          	jalr	1076(ra) # 4904 <exit>
    44d8:	84ae                	mv	s1,a1
  if(argc == 2 && strcmp(argv[1], "-c") == 0){
    44da:	00002597          	auipc	a1,0x2
    44de:	43658593          	addi	a1,a1,1078 # 6910 <malloc+0x1bac>
    44e2:	6488                	ld	a0,8(s1)
    44e4:	00000097          	auipc	ra,0x0
    44e8:	1b2080e7          	jalr	434(ra) # 4696 <strcmp>
    44ec:	10050563          	beqz	a0,45f6 <main+0x1d6>
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    44f0:	00002597          	auipc	a1,0x2
    44f4:	50858593          	addi	a1,a1,1288 # 69f8 <malloc+0x1c94>
    44f8:	6488                	ld	a0,8(s1)
    44fa:	00000097          	auipc	ra,0x0
    44fe:	19c080e7          	jalr	412(ra) # 4696 <strcmp>
    4502:	c97d                	beqz	a0,45f8 <main+0x1d8>
  } else if(argc == 2 && argv[1][0] != '-'){
    4504:	0084b903          	ld	s2,8(s1)
    4508:	00094703          	lbu	a4,0(s2)
    450c:	02d00793          	li	a5,45
    4510:	f4f713e3          	bne	a4,a5,4456 <main+0x36>
    printf("Usage: usertests [-c] [testname]\n");
    4514:	00002517          	auipc	a0,0x2
    4518:	40450513          	addi	a0,a0,1028 # 6918 <malloc+0x1bb4>
    451c:	00000097          	auipc	ra,0x0
    4520:	790080e7          	jalr	1936(ra) # 4cac <printf>
    exit(1);
    4524:	4505                	li	a0,1
    4526:	00000097          	auipc	ra,0x0
    452a:	3de080e7          	jalr	990(ra) # 4904 <exit>
          exit(1);
    452e:	4505                	li	a0,1
    4530:	00000097          	auipc	ra,0x0
    4534:	3d4080e7          	jalr	980(ra) # 4904 <exit>
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    4538:	40a905bb          	subw	a1,s2,a0
    453c:	855a                	mv	a0,s6
    453e:	00000097          	auipc	ra,0x0
    4542:	76e080e7          	jalr	1902(ra) # 4cac <printf>
        if(continuous != 2)
    4546:	09498463          	beq	s3,s4,45ce <main+0x1ae>
          exit(1);
    454a:	4505                	li	a0,1
    454c:	00000097          	auipc	ra,0x0
    4550:	3b8080e7          	jalr	952(ra) # 4904 <exit>
  for (struct test *t = tests; t->s != 0; t++) {
    4554:	04c1                	addi	s1,s1,16
    4556:	6488                	ld	a0,8(s1)
    4558:	c115                	beqz	a0,457c <main+0x15c>
    if((justone == 0) || strcmp(t->s, justone) == 0) {
    455a:	00090863          	beqz	s2,456a <main+0x14a>
    455e:	85ca                	mv	a1,s2
    4560:	00000097          	auipc	ra,0x0
    4564:	136080e7          	jalr	310(ra) # 4696 <strcmp>
    4568:	f575                	bnez	a0,4554 <main+0x134>
      if(!run(t->f, t->s))
    456a:	648c                	ld	a1,8(s1)
    456c:	6088                	ld	a0,0(s1)
    456e:	00000097          	auipc	ra,0x0
    4572:	e14080e7          	jalr	-492(ra) # 4382 <run>
    4576:	fd79                	bnez	a0,4554 <main+0x134>
        fail = 1;
    4578:	89d6                	mv	s3,s5
    457a:	bfe9                	j	4554 <main+0x134>
  if(fail){
    457c:	f20989e3          	beqz	s3,44ae <main+0x8e>
    printf("SOME TESTS FAILED\n");
    4580:	00002517          	auipc	a0,0x2
    4584:	3e050513          	addi	a0,a0,992 # 6960 <malloc+0x1bfc>
    4588:	00000097          	auipc	ra,0x0
    458c:	724080e7          	jalr	1828(ra) # 4cac <printf>
    exit(1);
    4590:	4505                	li	a0,1
    4592:	00000097          	auipc	ra,0x0
    4596:	372080e7          	jalr	882(ra) # 4904 <exit>
  } else {
    printf("ALL TESTS PASSED\n");
    459a:	00002517          	auipc	a0,0x2
    459e:	40e50513          	addi	a0,a0,1038 # 69a8 <malloc+0x1c44>
    45a2:	00000097          	auipc	ra,0x0
    45a6:	70a080e7          	jalr	1802(ra) # 4cac <printf>
    exit(0);
    45aa:	4501                	li	a0,0
    45ac:	00000097          	auipc	ra,0x0
    45b0:	358080e7          	jalr	856(ra) # 4904 <exit>
        printf("SOME TESTS FAILED\n");
    45b4:	8556                	mv	a0,s5
    45b6:	00000097          	auipc	ra,0x0
    45ba:	6f6080e7          	jalr	1782(ra) # 4cac <printf>
        if(continuous != 2)
    45be:	f74998e3          	bne	s3,s4,452e <main+0x10e>
      int free1 = countfree();
    45c2:	00000097          	auipc	ra,0x0
    45c6:	c8e080e7          	jalr	-882(ra) # 4250 <countfree>
      if(free1 < free0){
    45ca:	f72547e3          	blt	a0,s2,4538 <main+0x118>
      int free0 = countfree();
    45ce:	00000097          	auipc	ra,0x0
    45d2:	c82080e7          	jalr	-894(ra) # 4250 <countfree>
    45d6:	892a                	mv	s2,a0
      for (struct test *t = tests; t->s != 0; t++) {
    45d8:	c8843583          	ld	a1,-888(s0)
    45dc:	d1fd                	beqz	a1,45c2 <main+0x1a2>
    45de:	c8040493          	addi	s1,s0,-896
        if(!run(t->f, t->s)){
    45e2:	6088                	ld	a0,0(s1)
    45e4:	00000097          	auipc	ra,0x0
    45e8:	d9e080e7          	jalr	-610(ra) # 4382 <run>
    45ec:	d561                	beqz	a0,45b4 <main+0x194>
      for (struct test *t = tests; t->s != 0; t++) {
    45ee:	04c1                	addi	s1,s1,16
    45f0:	648c                	ld	a1,8(s1)
    45f2:	f9e5                	bnez	a1,45e2 <main+0x1c2>
    45f4:	b7f9                	j	45c2 <main+0x1a2>
    continuous = 1;
    45f6:	4985                	li	s3,1
  } tests[] = {
    45f8:	00002797          	auipc	a5,0x2
    45fc:	72078793          	addi	a5,a5,1824 # 6d18 <randstate+0x8>
    4600:	c8040713          	addi	a4,s0,-896
    4604:	00003817          	auipc	a6,0x3
    4608:	a5480813          	addi	a6,a6,-1452 # 7058 <name>
    460c:	6388                	ld	a0,0(a5)
    460e:	678c                	ld	a1,8(a5)
    4610:	6b90                	ld	a2,16(a5)
    4612:	6f94                	ld	a3,24(a5)
    4614:	e308                	sd	a0,0(a4)
    4616:	e70c                	sd	a1,8(a4)
    4618:	eb10                	sd	a2,16(a4)
    461a:	ef14                	sd	a3,24(a4)
    461c:	02078793          	addi	a5,a5,32
    4620:	02070713          	addi	a4,a4,32
    4624:	ff0794e3          	bne	a5,a6,460c <main+0x1ec>
    printf("continuous usertests starting\n");
    4628:	00002517          	auipc	a0,0x2
    462c:	3b050513          	addi	a0,a0,944 # 69d8 <malloc+0x1c74>
    4630:	00000097          	auipc	ra,0x0
    4634:	67c080e7          	jalr	1660(ra) # 4cac <printf>
        printf("SOME TESTS FAILED\n");
    4638:	00002a97          	auipc	s5,0x2
    463c:	328a8a93          	addi	s5,s5,808 # 6960 <malloc+0x1bfc>
        if(continuous != 2)
    4640:	4a09                	li	s4,2
        printf("FAILED -- lost %d free pages\n", free0 - free1);
    4642:	00002b17          	auipc	s6,0x2
    4646:	2feb0b13          	addi	s6,s6,766 # 6940 <malloc+0x1bdc>
    464a:	b751                	j	45ce <main+0x1ae>

000000000000464c <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
    464c:	1141                	addi	sp,sp,-16
    464e:	e422                	sd	s0,8(sp)
    4650:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    4652:	87aa                	mv	a5,a0
    4654:	0585                	addi	a1,a1,1
    4656:	0785                	addi	a5,a5,1
    4658:	fff5c703          	lbu	a4,-1(a1)
    465c:	fee78fa3          	sb	a4,-1(a5)
    4660:	fb75                	bnez	a4,4654 <strcpy+0x8>
    ;
  return os;
}
    4662:	6422                	ld	s0,8(sp)
    4664:	0141                	addi	sp,sp,16
    4666:	8082                	ret

0000000000004668 <strcat>:

char*
strcat(char *s, const char *t)
{
    4668:	1141                	addi	sp,sp,-16
    466a:	e422                	sd	s0,8(sp)
    466c:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
    466e:	00054783          	lbu	a5,0(a0)
    4672:	c385                	beqz	a5,4692 <strcat+0x2a>
    4674:	87aa                	mv	a5,a0
    s++;
    4676:	0785                	addi	a5,a5,1
  while(*s)
    4678:	0007c703          	lbu	a4,0(a5)
    467c:	ff6d                	bnez	a4,4676 <strcat+0xe>
  while((*s++ = *t++))
    467e:	0585                	addi	a1,a1,1
    4680:	0785                	addi	a5,a5,1
    4682:	fff5c703          	lbu	a4,-1(a1)
    4686:	fee78fa3          	sb	a4,-1(a5)
    468a:	fb75                	bnez	a4,467e <strcat+0x16>
    ;
  return os;
}
    468c:	6422                	ld	s0,8(sp)
    468e:	0141                	addi	sp,sp,16
    4690:	8082                	ret
  while(*s)
    4692:	87aa                	mv	a5,a0
    4694:	b7ed                	j	467e <strcat+0x16>

0000000000004696 <strcmp>:


int
strcmp(const char *p, const char *q)
{
    4696:	1141                	addi	sp,sp,-16
    4698:	e422                	sd	s0,8(sp)
    469a:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
    469c:	00054783          	lbu	a5,0(a0)
    46a0:	cb91                	beqz	a5,46b4 <strcmp+0x1e>
    46a2:	0005c703          	lbu	a4,0(a1)
    46a6:	00f71763          	bne	a4,a5,46b4 <strcmp+0x1e>
    p++, q++;
    46aa:	0505                	addi	a0,a0,1
    46ac:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
    46ae:	00054783          	lbu	a5,0(a0)
    46b2:	fbe5                	bnez	a5,46a2 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
    46b4:	0005c503          	lbu	a0,0(a1)
}
    46b8:	40a7853b          	subw	a0,a5,a0
    46bc:	6422                	ld	s0,8(sp)
    46be:	0141                	addi	sp,sp,16
    46c0:	8082                	ret

00000000000046c2 <strlen>:

uint
strlen(const char *s)
{
    46c2:	1141                	addi	sp,sp,-16
    46c4:	e422                	sd	s0,8(sp)
    46c6:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
    46c8:	00054783          	lbu	a5,0(a0)
    46cc:	cf91                	beqz	a5,46e8 <strlen+0x26>
    46ce:	0505                	addi	a0,a0,1
    46d0:	87aa                	mv	a5,a0
    46d2:	4685                	li	a3,1
    46d4:	9e89                	subw	a3,a3,a0
    46d6:	00f6853b          	addw	a0,a3,a5
    46da:	0785                	addi	a5,a5,1
    46dc:	fff7c703          	lbu	a4,-1(a5)
    46e0:	fb7d                	bnez	a4,46d6 <strlen+0x14>
    ;
  return n;
}
    46e2:	6422                	ld	s0,8(sp)
    46e4:	0141                	addi	sp,sp,16
    46e6:	8082                	ret
  for(n = 0; s[n]; n++)
    46e8:	4501                	li	a0,0
    46ea:	bfe5                	j	46e2 <strlen+0x20>

00000000000046ec <memset>:

void*
memset(void *dst, int c, uint n)
{
    46ec:	1141                	addi	sp,sp,-16
    46ee:	e422                	sd	s0,8(sp)
    46f0:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
    46f2:	ca19                	beqz	a2,4708 <memset+0x1c>
    46f4:	87aa                	mv	a5,a0
    46f6:	1602                	slli	a2,a2,0x20
    46f8:	9201                	srli	a2,a2,0x20
    46fa:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
    46fe:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
    4702:	0785                	addi	a5,a5,1
    4704:	fee79de3          	bne	a5,a4,46fe <memset+0x12>
  }
  return dst;
}
    4708:	6422                	ld	s0,8(sp)
    470a:	0141                	addi	sp,sp,16
    470c:	8082                	ret

000000000000470e <strchr>:

char*
strchr(const char *s, char c)
{
    470e:	1141                	addi	sp,sp,-16
    4710:	e422                	sd	s0,8(sp)
    4712:	0800                	addi	s0,sp,16
  for(; *s; s++)
    4714:	00054783          	lbu	a5,0(a0)
    4718:	cb99                	beqz	a5,472e <strchr+0x20>
    if(*s == c)
    471a:	00f58763          	beq	a1,a5,4728 <strchr+0x1a>
  for(; *s; s++)
    471e:	0505                	addi	a0,a0,1
    4720:	00054783          	lbu	a5,0(a0)
    4724:	fbfd                	bnez	a5,471a <strchr+0xc>
      return (char*)s;
  return 0;
    4726:	4501                	li	a0,0
}
    4728:	6422                	ld	s0,8(sp)
    472a:	0141                	addi	sp,sp,16
    472c:	8082                	ret
  return 0;
    472e:	4501                	li	a0,0
    4730:	bfe5                	j	4728 <strchr+0x1a>

0000000000004732 <gets>:

char*
gets(char *buf, int max)
{
    4732:	711d                	addi	sp,sp,-96
    4734:	ec86                	sd	ra,88(sp)
    4736:	e8a2                	sd	s0,80(sp)
    4738:	e4a6                	sd	s1,72(sp)
    473a:	e0ca                	sd	s2,64(sp)
    473c:	fc4e                	sd	s3,56(sp)
    473e:	f852                	sd	s4,48(sp)
    4740:	f456                	sd	s5,40(sp)
    4742:	f05a                	sd	s6,32(sp)
    4744:	ec5e                	sd	s7,24(sp)
    4746:	e862                	sd	s8,16(sp)
    4748:	1080                	addi	s0,sp,96
    474a:	8baa                	mv	s7,a0
    474c:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    474e:	892a                	mv	s2,a0
    4750:	4481                	li	s1,0
    cc = read(0, &c, 1);
    4752:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    4756:	4b29                	li	s6,10
    4758:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
    475a:	89a6                	mv	s3,s1
    475c:	2485                	addiw	s1,s1,1
    475e:	0344d763          	bge	s1,s4,478c <gets+0x5a>
    cc = read(0, &c, 1);
    4762:	4605                	li	a2,1
    4764:	85d6                	mv	a1,s5
    4766:	4501                	li	a0,0
    4768:	00000097          	auipc	ra,0x0
    476c:	1b6080e7          	jalr	438(ra) # 491e <read>
    if(cc < 1)
    4770:	00a05e63          	blez	a0,478c <gets+0x5a>
    buf[i++] = c;
    4774:	faf44783          	lbu	a5,-81(s0)
    4778:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
    477c:	01678763          	beq	a5,s6,478a <gets+0x58>
    4780:	0905                	addi	s2,s2,1
    4782:	fd879ce3          	bne	a5,s8,475a <gets+0x28>
  for(i=0; i+1 < max; ){
    4786:	89a6                	mv	s3,s1
    4788:	a011                	j	478c <gets+0x5a>
    478a:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
    478c:	99de                	add	s3,s3,s7
    478e:	00098023          	sb	zero,0(s3)
  return buf;
}
    4792:	855e                	mv	a0,s7
    4794:	60e6                	ld	ra,88(sp)
    4796:	6446                	ld	s0,80(sp)
    4798:	64a6                	ld	s1,72(sp)
    479a:	6906                	ld	s2,64(sp)
    479c:	79e2                	ld	s3,56(sp)
    479e:	7a42                	ld	s4,48(sp)
    47a0:	7aa2                	ld	s5,40(sp)
    47a2:	7b02                	ld	s6,32(sp)
    47a4:	6be2                	ld	s7,24(sp)
    47a6:	6c42                	ld	s8,16(sp)
    47a8:	6125                	addi	sp,sp,96
    47aa:	8082                	ret

00000000000047ac <stat>:

int
stat(const char *n, struct stat *st)
{
    47ac:	1101                	addi	sp,sp,-32
    47ae:	ec06                	sd	ra,24(sp)
    47b0:	e822                	sd	s0,16(sp)
    47b2:	e426                	sd	s1,8(sp)
    47b4:	e04a                	sd	s2,0(sp)
    47b6:	1000                	addi	s0,sp,32
    47b8:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    47ba:	4581                	li	a1,0
    47bc:	00000097          	auipc	ra,0x0
    47c0:	18e080e7          	jalr	398(ra) # 494a <open>
  if(fd < 0)
    47c4:	02054563          	bltz	a0,47ee <stat+0x42>
    47c8:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
    47ca:	85ca                	mv	a1,s2
    47cc:	00000097          	auipc	ra,0x0
    47d0:	186080e7          	jalr	390(ra) # 4952 <fstat>
    47d4:	892a                	mv	s2,a0
  close(fd);
    47d6:	8526                	mv	a0,s1
    47d8:	00000097          	auipc	ra,0x0
    47dc:	158080e7          	jalr	344(ra) # 4930 <close>
  return r;
}
    47e0:	854a                	mv	a0,s2
    47e2:	60e2                	ld	ra,24(sp)
    47e4:	6442                	ld	s0,16(sp)
    47e6:	64a2                	ld	s1,8(sp)
    47e8:	6902                	ld	s2,0(sp)
    47ea:	6105                	addi	sp,sp,32
    47ec:	8082                	ret
    return -1;
    47ee:	597d                	li	s2,-1
    47f0:	bfc5                	j	47e0 <stat+0x34>

00000000000047f2 <atoi>:

int
atoi(const char *s)
{
    47f2:	1141                	addi	sp,sp,-16
    47f4:	e422                	sd	s0,8(sp)
    47f6:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
    47f8:	00054703          	lbu	a4,0(a0)
    47fc:	02d00793          	li	a5,45
  int neg = 1;
    4800:	4585                	li	a1,1
  if (*s == '-') {
    4802:	04f70363          	beq	a4,a5,4848 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
    4806:	00054703          	lbu	a4,0(a0)
    480a:	fd07079b          	addiw	a5,a4,-48
    480e:	0ff7f793          	zext.b	a5,a5
    4812:	46a5                	li	a3,9
    4814:	02f6ed63          	bltu	a3,a5,484e <atoi+0x5c>
  n = 0;
    4818:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
    481a:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
    481c:	0505                	addi	a0,a0,1
    481e:	0026979b          	slliw	a5,a3,0x2
    4822:	9fb5                	addw	a5,a5,a3
    4824:	0017979b          	slliw	a5,a5,0x1
    4828:	9fb9                	addw	a5,a5,a4
    482a:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
    482e:	00054703          	lbu	a4,0(a0)
    4832:	fd07079b          	addiw	a5,a4,-48
    4836:	0ff7f793          	zext.b	a5,a5
    483a:	fef671e3          	bgeu	a2,a5,481c <atoi+0x2a>
  return n * neg;
}
    483e:	02d5853b          	mulw	a0,a1,a3
    4842:	6422                	ld	s0,8(sp)
    4844:	0141                	addi	sp,sp,16
    4846:	8082                	ret
    s++;
    4848:	0505                	addi	a0,a0,1
    neg = -1;
    484a:	55fd                	li	a1,-1
    484c:	bf6d                	j	4806 <atoi+0x14>
  n = 0;
    484e:	4681                	li	a3,0
    4850:	b7fd                	j	483e <atoi+0x4c>

0000000000004852 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    4852:	1141                	addi	sp,sp,-16
    4854:	e422                	sd	s0,8(sp)
    4856:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
    4858:	02b57463          	bgeu	a0,a1,4880 <memmove+0x2e>
    while(n-- > 0)
    485c:	00c05f63          	blez	a2,487a <memmove+0x28>
    4860:	1602                	slli	a2,a2,0x20
    4862:	9201                	srli	a2,a2,0x20
    4864:	00c507b3          	add	a5,a0,a2
  dst = vdst;
    4868:	872a                	mv	a4,a0
      *dst++ = *src++;
    486a:	0585                	addi	a1,a1,1
    486c:	0705                	addi	a4,a4,1
    486e:	fff5c683          	lbu	a3,-1(a1)
    4872:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
    4876:	fee79ae3          	bne	a5,a4,486a <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
    487a:	6422                	ld	s0,8(sp)
    487c:	0141                	addi	sp,sp,16
    487e:	8082                	ret
    dst += n;
    4880:	00c50733          	add	a4,a0,a2
    src += n;
    4884:	95b2                	add	a1,a1,a2
    while(n-- > 0)
    4886:	fec05ae3          	blez	a2,487a <memmove+0x28>
    488a:	fff6079b          	addiw	a5,a2,-1
    488e:	1782                	slli	a5,a5,0x20
    4890:	9381                	srli	a5,a5,0x20
    4892:	fff7c793          	not	a5,a5
    4896:	97ba                	add	a5,a5,a4
      *--dst = *--src;
    4898:	15fd                	addi	a1,a1,-1
    489a:	177d                	addi	a4,a4,-1
    489c:	0005c683          	lbu	a3,0(a1)
    48a0:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
    48a4:	fee79ae3          	bne	a5,a4,4898 <memmove+0x46>
    48a8:	bfc9                	j	487a <memmove+0x28>

00000000000048aa <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    48aa:	1141                	addi	sp,sp,-16
    48ac:	e422                	sd	s0,8(sp)
    48ae:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
    48b0:	ca05                	beqz	a2,48e0 <memcmp+0x36>
    48b2:	fff6069b          	addiw	a3,a2,-1
    48b6:	1682                	slli	a3,a3,0x20
    48b8:	9281                	srli	a3,a3,0x20
    48ba:	0685                	addi	a3,a3,1
    48bc:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
    48be:	00054783          	lbu	a5,0(a0)
    48c2:	0005c703          	lbu	a4,0(a1)
    48c6:	00e79863          	bne	a5,a4,48d6 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
    48ca:	0505                	addi	a0,a0,1
    p2++;
    48cc:	0585                	addi	a1,a1,1
  while (n-- > 0) {
    48ce:	fed518e3          	bne	a0,a3,48be <memcmp+0x14>
  }
  return 0;
    48d2:	4501                	li	a0,0
    48d4:	a019                	j	48da <memcmp+0x30>
      return *p1 - *p2;
    48d6:	40e7853b          	subw	a0,a5,a4
}
    48da:	6422                	ld	s0,8(sp)
    48dc:	0141                	addi	sp,sp,16
    48de:	8082                	ret
  return 0;
    48e0:	4501                	li	a0,0
    48e2:	bfe5                	j	48da <memcmp+0x30>

00000000000048e4 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    48e4:	1141                	addi	sp,sp,-16
    48e6:	e406                	sd	ra,8(sp)
    48e8:	e022                	sd	s0,0(sp)
    48ea:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
    48ec:	00000097          	auipc	ra,0x0
    48f0:	f66080e7          	jalr	-154(ra) # 4852 <memmove>
}
    48f4:	60a2                	ld	ra,8(sp)
    48f6:	6402                	ld	s0,0(sp)
    48f8:	0141                	addi	sp,sp,16
    48fa:	8082                	ret

00000000000048fc <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
    48fc:	4885                	li	a7,1
 ecall
    48fe:	00000073          	ecall
 ret
    4902:	8082                	ret

0000000000004904 <exit>:
.global exit
exit:
 li a7, SYS_exit
    4904:	05d00893          	li	a7,93
 ecall
    4908:	00000073          	ecall
 ret
    490c:	8082                	ret

000000000000490e <wait>:
.global wait
wait:
 li a7, SYS_wait
    490e:	488d                	li	a7,3
 ecall
    4910:	00000073          	ecall
 ret
    4914:	8082                	ret

0000000000004916 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    4916:	4891                	li	a7,4
 ecall
    4918:	00000073          	ecall
 ret
    491c:	8082                	ret

000000000000491e <read>:
.global read
read:
 li a7, SYS_read
    491e:	4895                	li	a7,5
 ecall
    4920:	00000073          	ecall
 ret
    4924:	8082                	ret

0000000000004926 <write>:
.global write
write:
 li a7, SYS_write
    4926:	04000893          	li	a7,64
 ecall
    492a:	00000073          	ecall
 ret
    492e:	8082                	ret

0000000000004930 <close>:
.global close
close:
 li a7, SYS_close
    4930:	48d5                	li	a7,21
 ecall
    4932:	00000073          	ecall
 ret
    4936:	8082                	ret

0000000000004938 <kill>:
.global kill
kill:
 li a7, SYS_kill
    4938:	4899                	li	a7,6
 ecall
    493a:	00000073          	ecall
 ret
    493e:	8082                	ret

0000000000004940 <exec>:
.global exec
exec:
 li a7, SYS_exec
    4940:	0dd00893          	li	a7,221
 ecall
    4944:	00000073          	ecall
 ret
    4948:	8082                	ret

000000000000494a <open>:
.global open
open:
 li a7, SYS_open
    494a:	48bd                	li	a7,15
 ecall
    494c:	00000073          	ecall
 ret
    4950:	8082                	ret

0000000000004952 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    4952:	48a1                	li	a7,8
 ecall
    4954:	00000073          	ecall
 ret
    4958:	8082                	ret

000000000000495a <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    495a:	48d1                	li	a7,20
 ecall
    495c:	00000073          	ecall
 ret
    4960:	8082                	ret

0000000000004962 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    4962:	48a5                	li	a7,9
 ecall
    4964:	00000073          	ecall
 ret
    4968:	8082                	ret

000000000000496a <dup>:
.global dup
dup:
 li a7, SYS_dup
    496a:	48a9                	li	a7,10
 ecall
    496c:	00000073          	ecall
 ret
    4970:	8082                	ret

0000000000004972 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    4972:	0ac00893          	li	a7,172
 ecall
    4976:	00000073          	ecall
 ret
    497a:	8082                	ret

000000000000497c <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    497c:	48b1                	li	a7,12
 ecall
    497e:	00000073          	ecall
 ret
    4982:	8082                	ret

0000000000004984 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    4984:	48b5                	li	a7,13
 ecall
    4986:	00000073          	ecall
 ret
    498a:	8082                	ret

000000000000498c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    498c:	48b9                	li	a7,14
 ecall
    498e:	00000073          	ecall
 ret
    4992:	8082                	ret

0000000000004994 <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
    4994:	48d9                	li	a7,22
 ecall
    4996:	00000073          	ecall
 ret
    499a:	8082                	ret

000000000000499c <dev>:
.global dev
dev:
 li a7, SYS_dev
    499c:	48dd                	li	a7,23
 ecall
    499e:	00000073          	ecall
 ret
    49a2:	8082                	ret

00000000000049a4 <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
    49a4:	48e1                	li	a7,24
 ecall
    49a6:	00000073          	ecall
 ret
    49aa:	8082                	ret

00000000000049ac <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
    49ac:	48c5                	li	a7,17
 ecall
    49ae:	00000073          	ecall
 ret
    49b2:	8082                	ret

00000000000049b4 <remove>:
.global remove
remove:
 li a7, SYS_remove
    49b4:	48c5                	li	a7,17
 ecall
    49b6:	00000073          	ecall
 ret
    49ba:	8082                	ret

00000000000049bc <trace>:
.global trace
trace:
 li a7, SYS_trace
    49bc:	48c9                	li	a7,18
 ecall
    49be:	00000073          	ecall
 ret
    49c2:	8082                	ret

00000000000049c4 <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
    49c4:	48cd                	li	a7,19
 ecall
    49c6:	00000073          	ecall
 ret
    49ca:	8082                	ret

00000000000049cc <rename>:
.global rename
rename:
 li a7, SYS_rename
    49cc:	48e9                	li	a7,26
 ecall
    49ce:	00000073          	ecall
 ret
    49d2:	8082                	ret

00000000000049d4 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    49d4:	1101                	addi	sp,sp,-32
    49d6:	ec06                	sd	ra,24(sp)
    49d8:	e822                	sd	s0,16(sp)
    49da:	1000                	addi	s0,sp,32
    49dc:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
    49e0:	4605                	li	a2,1
    49e2:	fef40593          	addi	a1,s0,-17
    49e6:	00000097          	auipc	ra,0x0
    49ea:	f40080e7          	jalr	-192(ra) # 4926 <write>
}
    49ee:	60e2                	ld	ra,24(sp)
    49f0:	6442                	ld	s0,16(sp)
    49f2:	6105                	addi	sp,sp,32
    49f4:	8082                	ret

00000000000049f6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    49f6:	7139                	addi	sp,sp,-64
    49f8:	fc06                	sd	ra,56(sp)
    49fa:	f822                	sd	s0,48(sp)
    49fc:	f426                	sd	s1,40(sp)
    49fe:	f04a                	sd	s2,32(sp)
    4a00:	ec4e                	sd	s3,24(sp)
    4a02:	0080                	addi	s0,sp,64
    4a04:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    4a06:	c299                	beqz	a3,4a0c <printint+0x16>
    4a08:	0805c863          	bltz	a1,4a98 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    4a0c:	2581                	sext.w	a1,a1
  neg = 0;
    4a0e:	4881                	li	a7,0
  }

  i = 0;
    4a10:	fc040993          	addi	s3,s0,-64
  neg = 0;
    4a14:	86ce                	mv	a3,s3
  i = 0;
    4a16:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
    4a18:	2601                	sext.w	a2,a2
    4a1a:	00002517          	auipc	a0,0x2
    4a1e:	2be50513          	addi	a0,a0,702 # 6cd8 <digits>
    4a22:	883a                	mv	a6,a4
    4a24:	2705                	addiw	a4,a4,1
    4a26:	02c5f7bb          	remuw	a5,a1,a2
    4a2a:	1782                	slli	a5,a5,0x20
    4a2c:	9381                	srli	a5,a5,0x20
    4a2e:	97aa                	add	a5,a5,a0
    4a30:	0007c783          	lbu	a5,0(a5)
    4a34:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
    4a38:	0005879b          	sext.w	a5,a1
    4a3c:	02c5d5bb          	divuw	a1,a1,a2
    4a40:	0685                	addi	a3,a3,1
    4a42:	fec7f0e3          	bgeu	a5,a2,4a22 <printint+0x2c>
  if(neg)
    4a46:	00088c63          	beqz	a7,4a5e <printint+0x68>
    buf[i++] = '-';
    4a4a:	fd070793          	addi	a5,a4,-48
    4a4e:	00878733          	add	a4,a5,s0
    4a52:	02d00793          	li	a5,45
    4a56:	fef70823          	sb	a5,-16(a4)
    4a5a:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
    4a5e:	02e05663          	blez	a4,4a8a <printint+0x94>
    4a62:	fc040913          	addi	s2,s0,-64
    4a66:	993a                	add	s2,s2,a4
    4a68:	19fd                	addi	s3,s3,-1
    4a6a:	99ba                	add	s3,s3,a4
    4a6c:	377d                	addiw	a4,a4,-1
    4a6e:	1702                	slli	a4,a4,0x20
    4a70:	9301                	srli	a4,a4,0x20
    4a72:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
    4a76:	fff94583          	lbu	a1,-1(s2)
    4a7a:	8526                	mv	a0,s1
    4a7c:	00000097          	auipc	ra,0x0
    4a80:	f58080e7          	jalr	-168(ra) # 49d4 <putc>
  while(--i >= 0)
    4a84:	197d                	addi	s2,s2,-1
    4a86:	ff3918e3          	bne	s2,s3,4a76 <printint+0x80>
}
    4a8a:	70e2                	ld	ra,56(sp)
    4a8c:	7442                	ld	s0,48(sp)
    4a8e:	74a2                	ld	s1,40(sp)
    4a90:	7902                	ld	s2,32(sp)
    4a92:	69e2                	ld	s3,24(sp)
    4a94:	6121                	addi	sp,sp,64
    4a96:	8082                	ret
    x = -xx;
    4a98:	40b005bb          	negw	a1,a1
    neg = 1;
    4a9c:	4885                	li	a7,1
    x = -xx;
    4a9e:	bf8d                	j	4a10 <printint+0x1a>

0000000000004aa0 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    4aa0:	7119                	addi	sp,sp,-128
    4aa2:	fc86                	sd	ra,120(sp)
    4aa4:	f8a2                	sd	s0,112(sp)
    4aa6:	f4a6                	sd	s1,104(sp)
    4aa8:	f0ca                	sd	s2,96(sp)
    4aaa:	ecce                	sd	s3,88(sp)
    4aac:	e8d2                	sd	s4,80(sp)
    4aae:	e4d6                	sd	s5,72(sp)
    4ab0:	e0da                	sd	s6,64(sp)
    4ab2:	fc5e                	sd	s7,56(sp)
    4ab4:	f862                	sd	s8,48(sp)
    4ab6:	f466                	sd	s9,40(sp)
    4ab8:	f06a                	sd	s10,32(sp)
    4aba:	ec6e                	sd	s11,24(sp)
    4abc:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
    4abe:	0005c903          	lbu	s2,0(a1)
    4ac2:	18090f63          	beqz	s2,4c60 <vprintf+0x1c0>
    4ac6:	8aaa                	mv	s5,a0
    4ac8:	8b32                	mv	s6,a2
    4aca:	00158493          	addi	s1,a1,1
  state = 0;
    4ace:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    4ad0:	02500a13          	li	s4,37
    4ad4:	4c55                	li	s8,21
    4ad6:	00002c97          	auipc	s9,0x2
    4ada:	1aac8c93          	addi	s9,s9,426 # 6c80 <malloc+0x1f1c>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4ade:	02800d93          	li	s11,40
  putc(fd, 'x');
    4ae2:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    4ae4:	00002b97          	auipc	s7,0x2
    4ae8:	1f4b8b93          	addi	s7,s7,500 # 6cd8 <digits>
    4aec:	a839                	j	4b0a <vprintf+0x6a>
        putc(fd, c);
    4aee:	85ca                	mv	a1,s2
    4af0:	8556                	mv	a0,s5
    4af2:	00000097          	auipc	ra,0x0
    4af6:	ee2080e7          	jalr	-286(ra) # 49d4 <putc>
    4afa:	a019                	j	4b00 <vprintf+0x60>
    } else if(state == '%'){
    4afc:	01498d63          	beq	s3,s4,4b16 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
    4b00:	0485                	addi	s1,s1,1
    4b02:	fff4c903          	lbu	s2,-1(s1)
    4b06:	14090d63          	beqz	s2,4c60 <vprintf+0x1c0>
    if(state == 0){
    4b0a:	fe0999e3          	bnez	s3,4afc <vprintf+0x5c>
      if(c == '%'){
    4b0e:	ff4910e3          	bne	s2,s4,4aee <vprintf+0x4e>
        state = '%';
    4b12:	89d2                	mv	s3,s4
    4b14:	b7f5                	j	4b00 <vprintf+0x60>
      if(c == 'd'){
    4b16:	11490c63          	beq	s2,s4,4c2e <vprintf+0x18e>
    4b1a:	f9d9079b          	addiw	a5,s2,-99
    4b1e:	0ff7f793          	zext.b	a5,a5
    4b22:	10fc6e63          	bltu	s8,a5,4c3e <vprintf+0x19e>
    4b26:	f9d9079b          	addiw	a5,s2,-99
    4b2a:	0ff7f713          	zext.b	a4,a5
    4b2e:	10ec6863          	bltu	s8,a4,4c3e <vprintf+0x19e>
    4b32:	00271793          	slli	a5,a4,0x2
    4b36:	97e6                	add	a5,a5,s9
    4b38:	439c                	lw	a5,0(a5)
    4b3a:	97e6                	add	a5,a5,s9
    4b3c:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
    4b3e:	008b0913          	addi	s2,s6,8
    4b42:	4685                	li	a3,1
    4b44:	4629                	li	a2,10
    4b46:	000b2583          	lw	a1,0(s6)
    4b4a:	8556                	mv	a0,s5
    4b4c:	00000097          	auipc	ra,0x0
    4b50:	eaa080e7          	jalr	-342(ra) # 49f6 <printint>
    4b54:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    4b56:	4981                	li	s3,0
    4b58:	b765                	j	4b00 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
    4b5a:	008b0913          	addi	s2,s6,8
    4b5e:	4681                	li	a3,0
    4b60:	4629                	li	a2,10
    4b62:	000b2583          	lw	a1,0(s6)
    4b66:	8556                	mv	a0,s5
    4b68:	00000097          	auipc	ra,0x0
    4b6c:	e8e080e7          	jalr	-370(ra) # 49f6 <printint>
    4b70:	8b4a                	mv	s6,s2
      state = 0;
    4b72:	4981                	li	s3,0
    4b74:	b771                	j	4b00 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
    4b76:	008b0913          	addi	s2,s6,8
    4b7a:	4681                	li	a3,0
    4b7c:	866a                	mv	a2,s10
    4b7e:	000b2583          	lw	a1,0(s6)
    4b82:	8556                	mv	a0,s5
    4b84:	00000097          	auipc	ra,0x0
    4b88:	e72080e7          	jalr	-398(ra) # 49f6 <printint>
    4b8c:	8b4a                	mv	s6,s2
      state = 0;
    4b8e:	4981                	li	s3,0
    4b90:	bf85                	j	4b00 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
    4b92:	008b0793          	addi	a5,s6,8
    4b96:	f8f43423          	sd	a5,-120(s0)
    4b9a:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
    4b9e:	03000593          	li	a1,48
    4ba2:	8556                	mv	a0,s5
    4ba4:	00000097          	auipc	ra,0x0
    4ba8:	e30080e7          	jalr	-464(ra) # 49d4 <putc>
  putc(fd, 'x');
    4bac:	07800593          	li	a1,120
    4bb0:	8556                	mv	a0,s5
    4bb2:	00000097          	auipc	ra,0x0
    4bb6:	e22080e7          	jalr	-478(ra) # 49d4 <putc>
    4bba:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    4bbc:	03c9d793          	srli	a5,s3,0x3c
    4bc0:	97de                	add	a5,a5,s7
    4bc2:	0007c583          	lbu	a1,0(a5)
    4bc6:	8556                	mv	a0,s5
    4bc8:	00000097          	auipc	ra,0x0
    4bcc:	e0c080e7          	jalr	-500(ra) # 49d4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    4bd0:	0992                	slli	s3,s3,0x4
    4bd2:	397d                	addiw	s2,s2,-1
    4bd4:	fe0914e3          	bnez	s2,4bbc <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
    4bd8:	f8843b03          	ld	s6,-120(s0)
      state = 0;
    4bdc:	4981                	li	s3,0
    4bde:	b70d                	j	4b00 <vprintf+0x60>
        s = va_arg(ap, char*);
    4be0:	008b0913          	addi	s2,s6,8
    4be4:	000b3983          	ld	s3,0(s6)
        if(s == 0)
    4be8:	02098163          	beqz	s3,4c0a <vprintf+0x16a>
        while(*s != 0){
    4bec:	0009c583          	lbu	a1,0(s3)
    4bf0:	c5ad                	beqz	a1,4c5a <vprintf+0x1ba>
          putc(fd, *s);
    4bf2:	8556                	mv	a0,s5
    4bf4:	00000097          	auipc	ra,0x0
    4bf8:	de0080e7          	jalr	-544(ra) # 49d4 <putc>
          s++;
    4bfc:	0985                	addi	s3,s3,1
        while(*s != 0){
    4bfe:	0009c583          	lbu	a1,0(s3)
    4c02:	f9e5                	bnez	a1,4bf2 <vprintf+0x152>
        s = va_arg(ap, char*);
    4c04:	8b4a                	mv	s6,s2
      state = 0;
    4c06:	4981                	li	s3,0
    4c08:	bde5                	j	4b00 <vprintf+0x60>
          s = "(null)";
    4c0a:	00002997          	auipc	s3,0x2
    4c0e:	06e98993          	addi	s3,s3,110 # 6c78 <malloc+0x1f14>
        while(*s != 0){
    4c12:	85ee                	mv	a1,s11
    4c14:	bff9                	j	4bf2 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
    4c16:	008b0913          	addi	s2,s6,8
    4c1a:	000b4583          	lbu	a1,0(s6)
    4c1e:	8556                	mv	a0,s5
    4c20:	00000097          	auipc	ra,0x0
    4c24:	db4080e7          	jalr	-588(ra) # 49d4 <putc>
    4c28:	8b4a                	mv	s6,s2
      state = 0;
    4c2a:	4981                	li	s3,0
    4c2c:	bdd1                	j	4b00 <vprintf+0x60>
        putc(fd, c);
    4c2e:	85d2                	mv	a1,s4
    4c30:	8556                	mv	a0,s5
    4c32:	00000097          	auipc	ra,0x0
    4c36:	da2080e7          	jalr	-606(ra) # 49d4 <putc>
      state = 0;
    4c3a:	4981                	li	s3,0
    4c3c:	b5d1                	j	4b00 <vprintf+0x60>
        putc(fd, '%');
    4c3e:	85d2                	mv	a1,s4
    4c40:	8556                	mv	a0,s5
    4c42:	00000097          	auipc	ra,0x0
    4c46:	d92080e7          	jalr	-622(ra) # 49d4 <putc>
        putc(fd, c);
    4c4a:	85ca                	mv	a1,s2
    4c4c:	8556                	mv	a0,s5
    4c4e:	00000097          	auipc	ra,0x0
    4c52:	d86080e7          	jalr	-634(ra) # 49d4 <putc>
      state = 0;
    4c56:	4981                	li	s3,0
    4c58:	b565                	j	4b00 <vprintf+0x60>
        s = va_arg(ap, char*);
    4c5a:	8b4a                	mv	s6,s2
      state = 0;
    4c5c:	4981                	li	s3,0
    4c5e:	b54d                	j	4b00 <vprintf+0x60>
    }
  }
}
    4c60:	70e6                	ld	ra,120(sp)
    4c62:	7446                	ld	s0,112(sp)
    4c64:	74a6                	ld	s1,104(sp)
    4c66:	7906                	ld	s2,96(sp)
    4c68:	69e6                	ld	s3,88(sp)
    4c6a:	6a46                	ld	s4,80(sp)
    4c6c:	6aa6                	ld	s5,72(sp)
    4c6e:	6b06                	ld	s6,64(sp)
    4c70:	7be2                	ld	s7,56(sp)
    4c72:	7c42                	ld	s8,48(sp)
    4c74:	7ca2                	ld	s9,40(sp)
    4c76:	7d02                	ld	s10,32(sp)
    4c78:	6de2                	ld	s11,24(sp)
    4c7a:	6109                	addi	sp,sp,128
    4c7c:	8082                	ret

0000000000004c7e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    4c7e:	715d                	addi	sp,sp,-80
    4c80:	ec06                	sd	ra,24(sp)
    4c82:	e822                	sd	s0,16(sp)
    4c84:	1000                	addi	s0,sp,32
    4c86:	e010                	sd	a2,0(s0)
    4c88:	e414                	sd	a3,8(s0)
    4c8a:	e818                	sd	a4,16(s0)
    4c8c:	ec1c                	sd	a5,24(s0)
    4c8e:	03043023          	sd	a6,32(s0)
    4c92:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
    4c96:	8622                	mv	a2,s0
    4c98:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
    4c9c:	00000097          	auipc	ra,0x0
    4ca0:	e04080e7          	jalr	-508(ra) # 4aa0 <vprintf>
}
    4ca4:	60e2                	ld	ra,24(sp)
    4ca6:	6442                	ld	s0,16(sp)
    4ca8:	6161                	addi	sp,sp,80
    4caa:	8082                	ret

0000000000004cac <printf>:

void
printf(const char *fmt, ...)
{
    4cac:	711d                	addi	sp,sp,-96
    4cae:	ec06                	sd	ra,24(sp)
    4cb0:	e822                	sd	s0,16(sp)
    4cb2:	1000                	addi	s0,sp,32
    4cb4:	e40c                	sd	a1,8(s0)
    4cb6:	e810                	sd	a2,16(s0)
    4cb8:	ec14                	sd	a3,24(s0)
    4cba:	f018                	sd	a4,32(s0)
    4cbc:	f41c                	sd	a5,40(s0)
    4cbe:	03043823          	sd	a6,48(s0)
    4cc2:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    4cc6:	00840613          	addi	a2,s0,8
    4cca:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
    4cce:	85aa                	mv	a1,a0
    4cd0:	4505                	li	a0,1
    4cd2:	00000097          	auipc	ra,0x0
    4cd6:	dce080e7          	jalr	-562(ra) # 4aa0 <vprintf>
}
    4cda:	60e2                	ld	ra,24(sp)
    4cdc:	6442                	ld	s0,16(sp)
    4cde:	6125                	addi	sp,sp,96
    4ce0:	8082                	ret

0000000000004ce2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4ce2:	1141                	addi	sp,sp,-16
    4ce4:	e422                	sd	s0,8(sp)
    4ce6:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
    4ce8:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4cec:	00007797          	auipc	a5,0x7
    4cf0:	38c7b783          	ld	a5,908(a5) # c078 <freep>
    4cf4:	a02d                	j	4d1e <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    4cf6:	4618                	lw	a4,8(a2)
    4cf8:	9f2d                	addw	a4,a4,a1
    4cfa:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
    4cfe:	6398                	ld	a4,0(a5)
    4d00:	6310                	ld	a2,0(a4)
    4d02:	a83d                	j	4d40 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    4d04:	ff852703          	lw	a4,-8(a0)
    4d08:	9f31                	addw	a4,a4,a2
    4d0a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    4d0c:	ff053683          	ld	a3,-16(a0)
    4d10:	a091                	j	4d54 <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4d12:	6398                	ld	a4,0(a5)
    4d14:	00e7e463          	bltu	a5,a4,4d1c <free+0x3a>
    4d18:	00e6ea63          	bltu	a3,a4,4d2c <free+0x4a>
{
    4d1c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    4d1e:	fed7fae3          	bgeu	a5,a3,4d12 <free+0x30>
    4d22:	6398                	ld	a4,0(a5)
    4d24:	00e6e463          	bltu	a3,a4,4d2c <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    4d28:	fee7eae3          	bltu	a5,a4,4d1c <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
    4d2c:	ff852583          	lw	a1,-8(a0)
    4d30:	6390                	ld	a2,0(a5)
    4d32:	02059813          	slli	a6,a1,0x20
    4d36:	01c85713          	srli	a4,a6,0x1c
    4d3a:	9736                	add	a4,a4,a3
    4d3c:	fae60de3          	beq	a2,a4,4cf6 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
    4d40:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
    4d44:	4790                	lw	a2,8(a5)
    4d46:	02061593          	slli	a1,a2,0x20
    4d4a:	01c5d713          	srli	a4,a1,0x1c
    4d4e:	973e                	add	a4,a4,a5
    4d50:	fae68ae3          	beq	a3,a4,4d04 <free+0x22>
    p->s.ptr = bp->s.ptr;
    4d54:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
    4d56:	00007717          	auipc	a4,0x7
    4d5a:	32f73123          	sd	a5,802(a4) # c078 <freep>
}
    4d5e:	6422                	ld	s0,8(sp)
    4d60:	0141                	addi	sp,sp,16
    4d62:	8082                	ret

0000000000004d64 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    4d64:	7139                	addi	sp,sp,-64
    4d66:	fc06                	sd	ra,56(sp)
    4d68:	f822                	sd	s0,48(sp)
    4d6a:	f426                	sd	s1,40(sp)
    4d6c:	f04a                	sd	s2,32(sp)
    4d6e:	ec4e                	sd	s3,24(sp)
    4d70:	e852                	sd	s4,16(sp)
    4d72:	e456                	sd	s5,8(sp)
    4d74:	e05a                	sd	s6,0(sp)
    4d76:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4d78:	02051493          	slli	s1,a0,0x20
    4d7c:	9081                	srli	s1,s1,0x20
    4d7e:	04bd                	addi	s1,s1,15
    4d80:	8091                	srli	s1,s1,0x4
    4d82:	00148a1b          	addiw	s4,s1,1
    4d86:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
    4d88:	00007517          	auipc	a0,0x7
    4d8c:	2f053503          	ld	a0,752(a0) # c078 <freep>
    4d90:	c515                	beqz	a0,4dbc <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4d92:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    4d94:	4798                	lw	a4,8(a5)
    4d96:	04977163          	bgeu	a4,s1,4dd8 <malloc+0x74>
    4d9a:	89d2                	mv	s3,s4
    4d9c:	000a071b          	sext.w	a4,s4
    4da0:	6685                	lui	a3,0x1
    4da2:	00d77363          	bgeu	a4,a3,4da8 <malloc+0x44>
    4da6:	6985                	lui	s3,0x1
    4da8:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
    4dac:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    4db0:	00007917          	auipc	s2,0x7
    4db4:	2c890913          	addi	s2,s2,712 # c078 <freep>
  if(p == (char*)-1)
    4db8:	5afd                	li	s5,-1
    4dba:	a8a5                	j	4e32 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
    4dbc:	00007797          	auipc	a5,0x7
    4dc0:	2bc78793          	addi	a5,a5,700 # c078 <freep>
    4dc4:	00007717          	auipc	a4,0x7
    4dc8:	2bc70713          	addi	a4,a4,700 # c080 <base>
    4dcc:	e398                	sd	a4,0(a5)
    4dce:	e798                	sd	a4,8(a5)
    base.s.size = 0;
    4dd0:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4dd4:	87ba                	mv	a5,a4
    4dd6:	b7d1                	j	4d9a <malloc+0x36>
      if(p->s.size == nunits)
    4dd8:	02e48c63          	beq	s1,a4,4e10 <malloc+0xac>
        p->s.size -= nunits;
    4ddc:	4147073b          	subw	a4,a4,s4
    4de0:	c798                	sw	a4,8(a5)
        p += p->s.size;
    4de2:	02071693          	slli	a3,a4,0x20
    4de6:	01c6d713          	srli	a4,a3,0x1c
    4dea:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
    4dec:	0147a423          	sw	s4,8(a5)
      freep = prevp;
    4df0:	00007717          	auipc	a4,0x7
    4df4:	28a73423          	sd	a0,648(a4) # c078 <freep>
      return (void*)(p + 1);
    4df8:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    4dfc:	70e2                	ld	ra,56(sp)
    4dfe:	7442                	ld	s0,48(sp)
    4e00:	74a2                	ld	s1,40(sp)
    4e02:	7902                	ld	s2,32(sp)
    4e04:	69e2                	ld	s3,24(sp)
    4e06:	6a42                	ld	s4,16(sp)
    4e08:	6aa2                	ld	s5,8(sp)
    4e0a:	6b02                	ld	s6,0(sp)
    4e0c:	6121                	addi	sp,sp,64
    4e0e:	8082                	ret
        prevp->s.ptr = p->s.ptr;
    4e10:	6398                	ld	a4,0(a5)
    4e12:	e118                	sd	a4,0(a0)
    4e14:	bff1                	j	4df0 <malloc+0x8c>
  hp->s.size = nu;
    4e16:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
    4e1a:	0541                	addi	a0,a0,16
    4e1c:	00000097          	auipc	ra,0x0
    4e20:	ec6080e7          	jalr	-314(ra) # 4ce2 <free>
  return freep;
    4e24:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
    4e28:	d971                	beqz	a0,4dfc <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4e2a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
    4e2c:	4798                	lw	a4,8(a5)
    4e2e:	fa9775e3          	bgeu	a4,s1,4dd8 <malloc+0x74>
    if(p == freep)
    4e32:	00093703          	ld	a4,0(s2)
    4e36:	853e                	mv	a0,a5
    4e38:	fef719e3          	bne	a4,a5,4e2a <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
    4e3c:	854e                	mv	a0,s3
    4e3e:	00000097          	auipc	ra,0x0
    4e42:	b3e080e7          	jalr	-1218(ra) # 497c <sbrk>
  if(p == (char*)-1)
    4e46:	fd5518e3          	bne	a0,s5,4e16 <malloc+0xb2>
        return 0;
    4e4a:	4501                	li	a0,0
    4e4c:	bf45                	j	4dfc <malloc+0x98>
