
xv6-user/_init:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
    "exit",
    // 添加更多的程序
};
int
main(void)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	1800                	addi	s0,sp,48
  dev(O_RDWR, CONSOLE, 0);
   a:	4601                	li	a2,0
   c:	4585                	li	a1,1
   e:	4509                	li	a0,2
  10:	00000097          	auipc	ra,0x0
  14:	3b6080e7          	jalr	950(ra) # 3c6 <dev>
  dup(0); // stdout
  18:	4501                	li	a0,0
  1a:	00000097          	auipc	ra,0x0
  1e:	37a080e7          	jalr	890(ra) # 394 <dup>
  dup(0); // stderr
  22:	4501                	li	a0,0
  24:	00000097          	auipc	ra,0x0
  28:	370080e7          	jalr	880(ra) # 394 <dup>

  for(int i = 0; i< sizeof(tester_list)/sizeof(tester_list[0]);i++)
  {
    char* tester_i = tester_list[i];
  2c:	00001497          	auipc	s1,0x1
  30:	8d44b483          	ld	s1,-1836(s1) # 900 <tester_list>
    //1.用fork新建一个线程，在子线程中执行 tester i
    //2.等待子线程结束
    int pid = fork();
  34:	00000097          	auipc	ra,0x0
  38:	2f2080e7          	jalr	754(ra) # 326 <fork>
    if(pid == 0){
  3c:	c11d                	beqz	a0,62 <main+0x62>
      exec(tester_i, argv);
    }
  }
  int a;
  wait(&a);
  3e:	fdc40513          	addi	a0,s0,-36
  42:	00000097          	auipc	ra,0x0
  46:	2f6080e7          	jalr	758(ra) # 338 <wait>
  (*(volatile uint32 *) 0x100000) = 0x5555; // write PHYSICAL address
  4a:	00100737          	lui	a4,0x100
  4e:	6795                	lui	a5,0x5
  50:	55578793          	addi	a5,a5,1365 # 5555 <__global_pointer$+0x4455>
  54:	c31c                	sw	a5,0(a4)
  return 1;
}
  56:	4505                	li	a0,1
  58:	70a2                	ld	ra,40(sp)
  5a:	7402                	ld	s0,32(sp)
  5c:	64e2                	ld	s1,24(sp)
  5e:	6145                	addi	sp,sp,48
  60:	8082                	ret
      exec(tester_i, argv);
  62:	00001597          	auipc	a1,0x1
  66:	8a658593          	addi	a1,a1,-1882 # 908 <argv>
  6a:	8526                	mv	a0,s1
  6c:	00000097          	auipc	ra,0x0
  70:	2fe080e7          	jalr	766(ra) # 36a <exec>
  74:	b7e9                	j	3e <main+0x3e>

0000000000000076 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  76:	1141                	addi	sp,sp,-16
  78:	e422                	sd	s0,8(sp)
  7a:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7c:	87aa                	mv	a5,a0
  7e:	0585                	addi	a1,a1,1
  80:	0785                	addi	a5,a5,1
  82:	fff5c703          	lbu	a4,-1(a1)
  86:	fee78fa3          	sb	a4,-1(a5)
  8a:	fb75                	bnez	a4,7e <strcpy+0x8>
    ;
  return os;
}
  8c:	6422                	ld	s0,8(sp)
  8e:	0141                	addi	sp,sp,16
  90:	8082                	ret

0000000000000092 <strcat>:

char*
strcat(char *s, const char *t)
{
  92:	1141                	addi	sp,sp,-16
  94:	e422                	sd	s0,8(sp)
  96:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  98:	00054783          	lbu	a5,0(a0)
  9c:	c385                	beqz	a5,bc <strcat+0x2a>
  9e:	87aa                	mv	a5,a0
    s++;
  a0:	0785                	addi	a5,a5,1
  while(*s)
  a2:	0007c703          	lbu	a4,0(a5)
  a6:	ff6d                	bnez	a4,a0 <strcat+0xe>
  while((*s++ = *t++))
  a8:	0585                	addi	a1,a1,1
  aa:	0785                	addi	a5,a5,1
  ac:	fff5c703          	lbu	a4,-1(a1)
  b0:	fee78fa3          	sb	a4,-1(a5)
  b4:	fb75                	bnez	a4,a8 <strcat+0x16>
    ;
  return os;
}
  b6:	6422                	ld	s0,8(sp)
  b8:	0141                	addi	sp,sp,16
  ba:	8082                	ret
  while(*s)
  bc:	87aa                	mv	a5,a0
  be:	b7ed                	j	a8 <strcat+0x16>

00000000000000c0 <strcmp>:


int
strcmp(const char *p, const char *q)
{
  c0:	1141                	addi	sp,sp,-16
  c2:	e422                	sd	s0,8(sp)
  c4:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  c6:	00054783          	lbu	a5,0(a0)
  ca:	cb91                	beqz	a5,de <strcmp+0x1e>
  cc:	0005c703          	lbu	a4,0(a1)
  d0:	00f71763          	bne	a4,a5,de <strcmp+0x1e>
    p++, q++;
  d4:	0505                	addi	a0,a0,1
  d6:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  d8:	00054783          	lbu	a5,0(a0)
  dc:	fbe5                	bnez	a5,cc <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  de:	0005c503          	lbu	a0,0(a1)
}
  e2:	40a7853b          	subw	a0,a5,a0
  e6:	6422                	ld	s0,8(sp)
  e8:	0141                	addi	sp,sp,16
  ea:	8082                	ret

00000000000000ec <strlen>:

uint
strlen(const char *s)
{
  ec:	1141                	addi	sp,sp,-16
  ee:	e422                	sd	s0,8(sp)
  f0:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  f2:	00054783          	lbu	a5,0(a0)
  f6:	cf91                	beqz	a5,112 <strlen+0x26>
  f8:	0505                	addi	a0,a0,1
  fa:	87aa                	mv	a5,a0
  fc:	4685                	li	a3,1
  fe:	9e89                	subw	a3,a3,a0
 100:	00f6853b          	addw	a0,a3,a5
 104:	0785                	addi	a5,a5,1
 106:	fff7c703          	lbu	a4,-1(a5)
 10a:	fb7d                	bnez	a4,100 <strlen+0x14>
    ;
  return n;
}
 10c:	6422                	ld	s0,8(sp)
 10e:	0141                	addi	sp,sp,16
 110:	8082                	ret
  for(n = 0; s[n]; n++)
 112:	4501                	li	a0,0
 114:	bfe5                	j	10c <strlen+0x20>

0000000000000116 <memset>:

void*
memset(void *dst, int c, uint n)
{
 116:	1141                	addi	sp,sp,-16
 118:	e422                	sd	s0,8(sp)
 11a:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 11c:	ca19                	beqz	a2,132 <memset+0x1c>
 11e:	87aa                	mv	a5,a0
 120:	1602                	slli	a2,a2,0x20
 122:	9201                	srli	a2,a2,0x20
 124:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 128:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 12c:	0785                	addi	a5,a5,1
 12e:	fee79de3          	bne	a5,a4,128 <memset+0x12>
  }
  return dst;
}
 132:	6422                	ld	s0,8(sp)
 134:	0141                	addi	sp,sp,16
 136:	8082                	ret

0000000000000138 <strchr>:

char*
strchr(const char *s, char c)
{
 138:	1141                	addi	sp,sp,-16
 13a:	e422                	sd	s0,8(sp)
 13c:	0800                	addi	s0,sp,16
  for(; *s; s++)
 13e:	00054783          	lbu	a5,0(a0)
 142:	cb99                	beqz	a5,158 <strchr+0x20>
    if(*s == c)
 144:	00f58763          	beq	a1,a5,152 <strchr+0x1a>
  for(; *s; s++)
 148:	0505                	addi	a0,a0,1
 14a:	00054783          	lbu	a5,0(a0)
 14e:	fbfd                	bnez	a5,144 <strchr+0xc>
      return (char*)s;
  return 0;
 150:	4501                	li	a0,0
}
 152:	6422                	ld	s0,8(sp)
 154:	0141                	addi	sp,sp,16
 156:	8082                	ret
  return 0;
 158:	4501                	li	a0,0
 15a:	bfe5                	j	152 <strchr+0x1a>

000000000000015c <gets>:

char*
gets(char *buf, int max)
{
 15c:	711d                	addi	sp,sp,-96
 15e:	ec86                	sd	ra,88(sp)
 160:	e8a2                	sd	s0,80(sp)
 162:	e4a6                	sd	s1,72(sp)
 164:	e0ca                	sd	s2,64(sp)
 166:	fc4e                	sd	s3,56(sp)
 168:	f852                	sd	s4,48(sp)
 16a:	f456                	sd	s5,40(sp)
 16c:	f05a                	sd	s6,32(sp)
 16e:	ec5e                	sd	s7,24(sp)
 170:	e862                	sd	s8,16(sp)
 172:	1080                	addi	s0,sp,96
 174:	8baa                	mv	s7,a0
 176:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 178:	892a                	mv	s2,a0
 17a:	4481                	li	s1,0
    cc = read(0, &c, 1);
 17c:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 180:	4b29                	li	s6,10
 182:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 184:	89a6                	mv	s3,s1
 186:	2485                	addiw	s1,s1,1
 188:	0344d763          	bge	s1,s4,1b6 <gets+0x5a>
    cc = read(0, &c, 1);
 18c:	4605                	li	a2,1
 18e:	85d6                	mv	a1,s5
 190:	4501                	li	a0,0
 192:	00000097          	auipc	ra,0x0
 196:	1b6080e7          	jalr	438(ra) # 348 <read>
    if(cc < 1)
 19a:	00a05e63          	blez	a0,1b6 <gets+0x5a>
    buf[i++] = c;
 19e:	faf44783          	lbu	a5,-81(s0)
 1a2:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1a6:	01678763          	beq	a5,s6,1b4 <gets+0x58>
 1aa:	0905                	addi	s2,s2,1
 1ac:	fd879ce3          	bne	a5,s8,184 <gets+0x28>
  for(i=0; i+1 < max; ){
 1b0:	89a6                	mv	s3,s1
 1b2:	a011                	j	1b6 <gets+0x5a>
 1b4:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1b6:	99de                	add	s3,s3,s7
 1b8:	00098023          	sb	zero,0(s3)
  return buf;
}
 1bc:	855e                	mv	a0,s7
 1be:	60e6                	ld	ra,88(sp)
 1c0:	6446                	ld	s0,80(sp)
 1c2:	64a6                	ld	s1,72(sp)
 1c4:	6906                	ld	s2,64(sp)
 1c6:	79e2                	ld	s3,56(sp)
 1c8:	7a42                	ld	s4,48(sp)
 1ca:	7aa2                	ld	s5,40(sp)
 1cc:	7b02                	ld	s6,32(sp)
 1ce:	6be2                	ld	s7,24(sp)
 1d0:	6c42                	ld	s8,16(sp)
 1d2:	6125                	addi	sp,sp,96
 1d4:	8082                	ret

00000000000001d6 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d6:	1101                	addi	sp,sp,-32
 1d8:	ec06                	sd	ra,24(sp)
 1da:	e822                	sd	s0,16(sp)
 1dc:	e426                	sd	s1,8(sp)
 1de:	e04a                	sd	s2,0(sp)
 1e0:	1000                	addi	s0,sp,32
 1e2:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e4:	4581                	li	a1,0
 1e6:	00000097          	auipc	ra,0x0
 1ea:	18e080e7          	jalr	398(ra) # 374 <open>
  if(fd < 0)
 1ee:	02054563          	bltz	a0,218 <stat+0x42>
 1f2:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1f4:	85ca                	mv	a1,s2
 1f6:	00000097          	auipc	ra,0x0
 1fa:	186080e7          	jalr	390(ra) # 37c <fstat>
 1fe:	892a                	mv	s2,a0
  close(fd);
 200:	8526                	mv	a0,s1
 202:	00000097          	auipc	ra,0x0
 206:	158080e7          	jalr	344(ra) # 35a <close>
  return r;
}
 20a:	854a                	mv	a0,s2
 20c:	60e2                	ld	ra,24(sp)
 20e:	6442                	ld	s0,16(sp)
 210:	64a2                	ld	s1,8(sp)
 212:	6902                	ld	s2,0(sp)
 214:	6105                	addi	sp,sp,32
 216:	8082                	ret
    return -1;
 218:	597d                	li	s2,-1
 21a:	bfc5                	j	20a <stat+0x34>

000000000000021c <atoi>:

int
atoi(const char *s)
{
 21c:	1141                	addi	sp,sp,-16
 21e:	e422                	sd	s0,8(sp)
 220:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 222:	00054703          	lbu	a4,0(a0)
 226:	02d00793          	li	a5,45
  int neg = 1;
 22a:	4585                	li	a1,1
  if (*s == '-') {
 22c:	04f70363          	beq	a4,a5,272 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 230:	00054703          	lbu	a4,0(a0)
 234:	fd07079b          	addiw	a5,a4,-48 # fffd0 <__global_pointer$+0xfeed0>
 238:	0ff7f793          	zext.b	a5,a5
 23c:	46a5                	li	a3,9
 23e:	02f6ed63          	bltu	a3,a5,278 <atoi+0x5c>
  n = 0;
 242:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 244:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 246:	0505                	addi	a0,a0,1
 248:	0026979b          	slliw	a5,a3,0x2
 24c:	9fb5                	addw	a5,a5,a3
 24e:	0017979b          	slliw	a5,a5,0x1
 252:	9fb9                	addw	a5,a5,a4
 254:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 258:	00054703          	lbu	a4,0(a0)
 25c:	fd07079b          	addiw	a5,a4,-48
 260:	0ff7f793          	zext.b	a5,a5
 264:	fef671e3          	bgeu	a2,a5,246 <atoi+0x2a>
  return n * neg;
}
 268:	02d5853b          	mulw	a0,a1,a3
 26c:	6422                	ld	s0,8(sp)
 26e:	0141                	addi	sp,sp,16
 270:	8082                	ret
    s++;
 272:	0505                	addi	a0,a0,1
    neg = -1;
 274:	55fd                	li	a1,-1
 276:	bf6d                	j	230 <atoi+0x14>
  n = 0;
 278:	4681                	li	a3,0
 27a:	b7fd                	j	268 <atoi+0x4c>

000000000000027c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 27c:	1141                	addi	sp,sp,-16
 27e:	e422                	sd	s0,8(sp)
 280:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 282:	02b57463          	bgeu	a0,a1,2aa <memmove+0x2e>
    while(n-- > 0)
 286:	00c05f63          	blez	a2,2a4 <memmove+0x28>
 28a:	1602                	slli	a2,a2,0x20
 28c:	9201                	srli	a2,a2,0x20
 28e:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 292:	872a                	mv	a4,a0
      *dst++ = *src++;
 294:	0585                	addi	a1,a1,1
 296:	0705                	addi	a4,a4,1
 298:	fff5c683          	lbu	a3,-1(a1)
 29c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2a0:	fee79ae3          	bne	a5,a4,294 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2a4:	6422                	ld	s0,8(sp)
 2a6:	0141                	addi	sp,sp,16
 2a8:	8082                	ret
    dst += n;
 2aa:	00c50733          	add	a4,a0,a2
    src += n;
 2ae:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2b0:	fec05ae3          	blez	a2,2a4 <memmove+0x28>
 2b4:	fff6079b          	addiw	a5,a2,-1
 2b8:	1782                	slli	a5,a5,0x20
 2ba:	9381                	srli	a5,a5,0x20
 2bc:	fff7c793          	not	a5,a5
 2c0:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2c2:	15fd                	addi	a1,a1,-1
 2c4:	177d                	addi	a4,a4,-1
 2c6:	0005c683          	lbu	a3,0(a1)
 2ca:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2ce:	fee79ae3          	bne	a5,a4,2c2 <memmove+0x46>
 2d2:	bfc9                	j	2a4 <memmove+0x28>

00000000000002d4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2d4:	1141                	addi	sp,sp,-16
 2d6:	e422                	sd	s0,8(sp)
 2d8:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2da:	ca05                	beqz	a2,30a <memcmp+0x36>
 2dc:	fff6069b          	addiw	a3,a2,-1
 2e0:	1682                	slli	a3,a3,0x20
 2e2:	9281                	srli	a3,a3,0x20
 2e4:	0685                	addi	a3,a3,1
 2e6:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2e8:	00054783          	lbu	a5,0(a0)
 2ec:	0005c703          	lbu	a4,0(a1)
 2f0:	00e79863          	bne	a5,a4,300 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 2f4:	0505                	addi	a0,a0,1
    p2++;
 2f6:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2f8:	fed518e3          	bne	a0,a3,2e8 <memcmp+0x14>
  }
  return 0;
 2fc:	4501                	li	a0,0
 2fe:	a019                	j	304 <memcmp+0x30>
      return *p1 - *p2;
 300:	40e7853b          	subw	a0,a5,a4
}
 304:	6422                	ld	s0,8(sp)
 306:	0141                	addi	sp,sp,16
 308:	8082                	ret
  return 0;
 30a:	4501                	li	a0,0
 30c:	bfe5                	j	304 <memcmp+0x30>

000000000000030e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 30e:	1141                	addi	sp,sp,-16
 310:	e406                	sd	ra,8(sp)
 312:	e022                	sd	s0,0(sp)
 314:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 316:	00000097          	auipc	ra,0x0
 31a:	f66080e7          	jalr	-154(ra) # 27c <memmove>
}
 31e:	60a2                	ld	ra,8(sp)
 320:	6402                	ld	s0,0(sp)
 322:	0141                	addi	sp,sp,16
 324:	8082                	ret

0000000000000326 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 326:	4885                	li	a7,1
 ecall
 328:	00000073          	ecall
 ret
 32c:	8082                	ret

000000000000032e <exit>:
.global exit
exit:
 li a7, SYS_exit
 32e:	05d00893          	li	a7,93
 ecall
 332:	00000073          	ecall
 ret
 336:	8082                	ret

0000000000000338 <wait>:
.global wait
wait:
 li a7, SYS_wait
 338:	488d                	li	a7,3
 ecall
 33a:	00000073          	ecall
 ret
 33e:	8082                	ret

0000000000000340 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 340:	4891                	li	a7,4
 ecall
 342:	00000073          	ecall
 ret
 346:	8082                	ret

0000000000000348 <read>:
.global read
read:
 li a7, SYS_read
 348:	4895                	li	a7,5
 ecall
 34a:	00000073          	ecall
 ret
 34e:	8082                	ret

0000000000000350 <write>:
.global write
write:
 li a7, SYS_write
 350:	04000893          	li	a7,64
 ecall
 354:	00000073          	ecall
 ret
 358:	8082                	ret

000000000000035a <close>:
.global close
close:
 li a7, SYS_close
 35a:	48d5                	li	a7,21
 ecall
 35c:	00000073          	ecall
 ret
 360:	8082                	ret

0000000000000362 <kill>:
.global kill
kill:
 li a7, SYS_kill
 362:	4899                	li	a7,6
 ecall
 364:	00000073          	ecall
 ret
 368:	8082                	ret

000000000000036a <exec>:
.global exec
exec:
 li a7, SYS_exec
 36a:	0dd00893          	li	a7,221
 ecall
 36e:	00000073          	ecall
 ret
 372:	8082                	ret

0000000000000374 <open>:
.global open
open:
 li a7, SYS_open
 374:	48bd                	li	a7,15
 ecall
 376:	00000073          	ecall
 ret
 37a:	8082                	ret

000000000000037c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 37c:	48a1                	li	a7,8
 ecall
 37e:	00000073          	ecall
 ret
 382:	8082                	ret

0000000000000384 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 384:	48d1                	li	a7,20
 ecall
 386:	00000073          	ecall
 ret
 38a:	8082                	ret

000000000000038c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 38c:	48a5                	li	a7,9
 ecall
 38e:	00000073          	ecall
 ret
 392:	8082                	ret

0000000000000394 <dup>:
.global dup
dup:
 li a7, SYS_dup
 394:	48a9                	li	a7,10
 ecall
 396:	00000073          	ecall
 ret
 39a:	8082                	ret

000000000000039c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 39c:	0ac00893          	li	a7,172
 ecall
 3a0:	00000073          	ecall
 ret
 3a4:	8082                	ret

00000000000003a6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3a6:	48b1                	li	a7,12
 ecall
 3a8:	00000073          	ecall
 ret
 3ac:	8082                	ret

00000000000003ae <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3ae:	48b5                	li	a7,13
 ecall
 3b0:	00000073          	ecall
 ret
 3b4:	8082                	ret

00000000000003b6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3b6:	48b9                	li	a7,14
 ecall
 3b8:	00000073          	ecall
 ret
 3bc:	8082                	ret

00000000000003be <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3be:	48d9                	li	a7,22
 ecall
 3c0:	00000073          	ecall
 ret
 3c4:	8082                	ret

00000000000003c6 <dev>:
.global dev
dev:
 li a7, SYS_dev
 3c6:	48dd                	li	a7,23
 ecall
 3c8:	00000073          	ecall
 ret
 3cc:	8082                	ret

00000000000003ce <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3ce:	48e1                	li	a7,24
 ecall
 3d0:	00000073          	ecall
 ret
 3d4:	8082                	ret

00000000000003d6 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3d6:	48c5                	li	a7,17
 ecall
 3d8:	00000073          	ecall
 ret
 3dc:	8082                	ret

00000000000003de <remove>:
.global remove
remove:
 li a7, SYS_remove
 3de:	48c5                	li	a7,17
 ecall
 3e0:	00000073          	ecall
 ret
 3e4:	8082                	ret

00000000000003e6 <trace>:
.global trace
trace:
 li a7, SYS_trace
 3e6:	48c9                	li	a7,18
 ecall
 3e8:	00000073          	ecall
 ret
 3ec:	8082                	ret

00000000000003ee <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3ee:	48cd                	li	a7,19
 ecall
 3f0:	00000073          	ecall
 ret
 3f4:	8082                	ret

00000000000003f6 <rename>:
.global rename
rename:
 li a7, SYS_rename
 3f6:	48e9                	li	a7,26
 ecall
 3f8:	00000073          	ecall
 ret
 3fc:	8082                	ret

00000000000003fe <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 3fe:	1101                	addi	sp,sp,-32
 400:	ec06                	sd	ra,24(sp)
 402:	e822                	sd	s0,16(sp)
 404:	1000                	addi	s0,sp,32
 406:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 40a:	4605                	li	a2,1
 40c:	fef40593          	addi	a1,s0,-17
 410:	00000097          	auipc	ra,0x0
 414:	f40080e7          	jalr	-192(ra) # 350 <write>
}
 418:	60e2                	ld	ra,24(sp)
 41a:	6442                	ld	s0,16(sp)
 41c:	6105                	addi	sp,sp,32
 41e:	8082                	ret

0000000000000420 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	7139                	addi	sp,sp,-64
 422:	fc06                	sd	ra,56(sp)
 424:	f822                	sd	s0,48(sp)
 426:	f426                	sd	s1,40(sp)
 428:	f04a                	sd	s2,32(sp)
 42a:	ec4e                	sd	s3,24(sp)
 42c:	0080                	addi	s0,sp,64
 42e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 430:	c299                	beqz	a3,436 <printint+0x16>
 432:	0805c863          	bltz	a1,4c2 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 436:	2581                	sext.w	a1,a1
  neg = 0;
 438:	4881                	li	a7,0
  }

  i = 0;
 43a:	fc040993          	addi	s3,s0,-64
  neg = 0;
 43e:	86ce                	mv	a3,s3
  i = 0;
 440:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 442:	2601                	sext.w	a2,a2
 444:	00000517          	auipc	a0,0x0
 448:	4a450513          	addi	a0,a0,1188 # 8e8 <digits>
 44c:	883a                	mv	a6,a4
 44e:	2705                	addiw	a4,a4,1
 450:	02c5f7bb          	remuw	a5,a1,a2
 454:	1782                	slli	a5,a5,0x20
 456:	9381                	srli	a5,a5,0x20
 458:	97aa                	add	a5,a5,a0
 45a:	0007c783          	lbu	a5,0(a5)
 45e:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 462:	0005879b          	sext.w	a5,a1
 466:	02c5d5bb          	divuw	a1,a1,a2
 46a:	0685                	addi	a3,a3,1
 46c:	fec7f0e3          	bgeu	a5,a2,44c <printint+0x2c>
  if(neg)
 470:	00088c63          	beqz	a7,488 <printint+0x68>
    buf[i++] = '-';
 474:	fd070793          	addi	a5,a4,-48
 478:	00878733          	add	a4,a5,s0
 47c:	02d00793          	li	a5,45
 480:	fef70823          	sb	a5,-16(a4)
 484:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 488:	02e05663          	blez	a4,4b4 <printint+0x94>
 48c:	fc040913          	addi	s2,s0,-64
 490:	993a                	add	s2,s2,a4
 492:	19fd                	addi	s3,s3,-1
 494:	99ba                	add	s3,s3,a4
 496:	377d                	addiw	a4,a4,-1
 498:	1702                	slli	a4,a4,0x20
 49a:	9301                	srli	a4,a4,0x20
 49c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4a0:	fff94583          	lbu	a1,-1(s2)
 4a4:	8526                	mv	a0,s1
 4a6:	00000097          	auipc	ra,0x0
 4aa:	f58080e7          	jalr	-168(ra) # 3fe <putc>
  while(--i >= 0)
 4ae:	197d                	addi	s2,s2,-1
 4b0:	ff3918e3          	bne	s2,s3,4a0 <printint+0x80>
}
 4b4:	70e2                	ld	ra,56(sp)
 4b6:	7442                	ld	s0,48(sp)
 4b8:	74a2                	ld	s1,40(sp)
 4ba:	7902                	ld	s2,32(sp)
 4bc:	69e2                	ld	s3,24(sp)
 4be:	6121                	addi	sp,sp,64
 4c0:	8082                	ret
    x = -xx;
 4c2:	40b005bb          	negw	a1,a1
    neg = 1;
 4c6:	4885                	li	a7,1
    x = -xx;
 4c8:	bf8d                	j	43a <printint+0x1a>

00000000000004ca <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4ca:	7119                	addi	sp,sp,-128
 4cc:	fc86                	sd	ra,120(sp)
 4ce:	f8a2                	sd	s0,112(sp)
 4d0:	f4a6                	sd	s1,104(sp)
 4d2:	f0ca                	sd	s2,96(sp)
 4d4:	ecce                	sd	s3,88(sp)
 4d6:	e8d2                	sd	s4,80(sp)
 4d8:	e4d6                	sd	s5,72(sp)
 4da:	e0da                	sd	s6,64(sp)
 4dc:	fc5e                	sd	s7,56(sp)
 4de:	f862                	sd	s8,48(sp)
 4e0:	f466                	sd	s9,40(sp)
 4e2:	f06a                	sd	s10,32(sp)
 4e4:	ec6e                	sd	s11,24(sp)
 4e6:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4e8:	0005c903          	lbu	s2,0(a1)
 4ec:	18090f63          	beqz	s2,68a <vprintf+0x1c0>
 4f0:	8aaa                	mv	s5,a0
 4f2:	8b32                	mv	s6,a2
 4f4:	00158493          	addi	s1,a1,1
  state = 0;
 4f8:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4fa:	02500a13          	li	s4,37
 4fe:	4c55                	li	s8,21
 500:	00000c97          	auipc	s9,0x0
 504:	390c8c93          	addi	s9,s9,912 # 890 <malloc+0x102>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 508:	02800d93          	li	s11,40
  putc(fd, 'x');
 50c:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 50e:	00000b97          	auipc	s7,0x0
 512:	3dab8b93          	addi	s7,s7,986 # 8e8 <digits>
 516:	a839                	j	534 <vprintf+0x6a>
        putc(fd, c);
 518:	85ca                	mv	a1,s2
 51a:	8556                	mv	a0,s5
 51c:	00000097          	auipc	ra,0x0
 520:	ee2080e7          	jalr	-286(ra) # 3fe <putc>
 524:	a019                	j	52a <vprintf+0x60>
    } else if(state == '%'){
 526:	01498d63          	beq	s3,s4,540 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 52a:	0485                	addi	s1,s1,1
 52c:	fff4c903          	lbu	s2,-1(s1)
 530:	14090d63          	beqz	s2,68a <vprintf+0x1c0>
    if(state == 0){
 534:	fe0999e3          	bnez	s3,526 <vprintf+0x5c>
      if(c == '%'){
 538:	ff4910e3          	bne	s2,s4,518 <vprintf+0x4e>
        state = '%';
 53c:	89d2                	mv	s3,s4
 53e:	b7f5                	j	52a <vprintf+0x60>
      if(c == 'd'){
 540:	11490c63          	beq	s2,s4,658 <vprintf+0x18e>
 544:	f9d9079b          	addiw	a5,s2,-99
 548:	0ff7f793          	zext.b	a5,a5
 54c:	10fc6e63          	bltu	s8,a5,668 <vprintf+0x19e>
 550:	f9d9079b          	addiw	a5,s2,-99
 554:	0ff7f713          	zext.b	a4,a5
 558:	10ec6863          	bltu	s8,a4,668 <vprintf+0x19e>
 55c:	00271793          	slli	a5,a4,0x2
 560:	97e6                	add	a5,a5,s9
 562:	439c                	lw	a5,0(a5)
 564:	97e6                	add	a5,a5,s9
 566:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 568:	008b0913          	addi	s2,s6,8
 56c:	4685                	li	a3,1
 56e:	4629                	li	a2,10
 570:	000b2583          	lw	a1,0(s6)
 574:	8556                	mv	a0,s5
 576:	00000097          	auipc	ra,0x0
 57a:	eaa080e7          	jalr	-342(ra) # 420 <printint>
 57e:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 580:	4981                	li	s3,0
 582:	b765                	j	52a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 584:	008b0913          	addi	s2,s6,8
 588:	4681                	li	a3,0
 58a:	4629                	li	a2,10
 58c:	000b2583          	lw	a1,0(s6)
 590:	8556                	mv	a0,s5
 592:	00000097          	auipc	ra,0x0
 596:	e8e080e7          	jalr	-370(ra) # 420 <printint>
 59a:	8b4a                	mv	s6,s2
      state = 0;
 59c:	4981                	li	s3,0
 59e:	b771                	j	52a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5a0:	008b0913          	addi	s2,s6,8
 5a4:	4681                	li	a3,0
 5a6:	866a                	mv	a2,s10
 5a8:	000b2583          	lw	a1,0(s6)
 5ac:	8556                	mv	a0,s5
 5ae:	00000097          	auipc	ra,0x0
 5b2:	e72080e7          	jalr	-398(ra) # 420 <printint>
 5b6:	8b4a                	mv	s6,s2
      state = 0;
 5b8:	4981                	li	s3,0
 5ba:	bf85                	j	52a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5bc:	008b0793          	addi	a5,s6,8
 5c0:	f8f43423          	sd	a5,-120(s0)
 5c4:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5c8:	03000593          	li	a1,48
 5cc:	8556                	mv	a0,s5
 5ce:	00000097          	auipc	ra,0x0
 5d2:	e30080e7          	jalr	-464(ra) # 3fe <putc>
  putc(fd, 'x');
 5d6:	07800593          	li	a1,120
 5da:	8556                	mv	a0,s5
 5dc:	00000097          	auipc	ra,0x0
 5e0:	e22080e7          	jalr	-478(ra) # 3fe <putc>
 5e4:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5e6:	03c9d793          	srli	a5,s3,0x3c
 5ea:	97de                	add	a5,a5,s7
 5ec:	0007c583          	lbu	a1,0(a5)
 5f0:	8556                	mv	a0,s5
 5f2:	00000097          	auipc	ra,0x0
 5f6:	e0c080e7          	jalr	-500(ra) # 3fe <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 5fa:	0992                	slli	s3,s3,0x4
 5fc:	397d                	addiw	s2,s2,-1
 5fe:	fe0914e3          	bnez	s2,5e6 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 602:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 606:	4981                	li	s3,0
 608:	b70d                	j	52a <vprintf+0x60>
        s = va_arg(ap, char*);
 60a:	008b0913          	addi	s2,s6,8
 60e:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 612:	02098163          	beqz	s3,634 <vprintf+0x16a>
        while(*s != 0){
 616:	0009c583          	lbu	a1,0(s3)
 61a:	c5ad                	beqz	a1,684 <vprintf+0x1ba>
          putc(fd, *s);
 61c:	8556                	mv	a0,s5
 61e:	00000097          	auipc	ra,0x0
 622:	de0080e7          	jalr	-544(ra) # 3fe <putc>
          s++;
 626:	0985                	addi	s3,s3,1
        while(*s != 0){
 628:	0009c583          	lbu	a1,0(s3)
 62c:	f9e5                	bnez	a1,61c <vprintf+0x152>
        s = va_arg(ap, char*);
 62e:	8b4a                	mv	s6,s2
      state = 0;
 630:	4981                	li	s3,0
 632:	bde5                	j	52a <vprintf+0x60>
          s = "(null)";
 634:	00000997          	auipc	s3,0x0
 638:	25498993          	addi	s3,s3,596 # 888 <malloc+0xfa>
        while(*s != 0){
 63c:	85ee                	mv	a1,s11
 63e:	bff9                	j	61c <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 640:	008b0913          	addi	s2,s6,8
 644:	000b4583          	lbu	a1,0(s6)
 648:	8556                	mv	a0,s5
 64a:	00000097          	auipc	ra,0x0
 64e:	db4080e7          	jalr	-588(ra) # 3fe <putc>
 652:	8b4a                	mv	s6,s2
      state = 0;
 654:	4981                	li	s3,0
 656:	bdd1                	j	52a <vprintf+0x60>
        putc(fd, c);
 658:	85d2                	mv	a1,s4
 65a:	8556                	mv	a0,s5
 65c:	00000097          	auipc	ra,0x0
 660:	da2080e7          	jalr	-606(ra) # 3fe <putc>
      state = 0;
 664:	4981                	li	s3,0
 666:	b5d1                	j	52a <vprintf+0x60>
        putc(fd, '%');
 668:	85d2                	mv	a1,s4
 66a:	8556                	mv	a0,s5
 66c:	00000097          	auipc	ra,0x0
 670:	d92080e7          	jalr	-622(ra) # 3fe <putc>
        putc(fd, c);
 674:	85ca                	mv	a1,s2
 676:	8556                	mv	a0,s5
 678:	00000097          	auipc	ra,0x0
 67c:	d86080e7          	jalr	-634(ra) # 3fe <putc>
      state = 0;
 680:	4981                	li	s3,0
 682:	b565                	j	52a <vprintf+0x60>
        s = va_arg(ap, char*);
 684:	8b4a                	mv	s6,s2
      state = 0;
 686:	4981                	li	s3,0
 688:	b54d                	j	52a <vprintf+0x60>
    }
  }
}
 68a:	70e6                	ld	ra,120(sp)
 68c:	7446                	ld	s0,112(sp)
 68e:	74a6                	ld	s1,104(sp)
 690:	7906                	ld	s2,96(sp)
 692:	69e6                	ld	s3,88(sp)
 694:	6a46                	ld	s4,80(sp)
 696:	6aa6                	ld	s5,72(sp)
 698:	6b06                	ld	s6,64(sp)
 69a:	7be2                	ld	s7,56(sp)
 69c:	7c42                	ld	s8,48(sp)
 69e:	7ca2                	ld	s9,40(sp)
 6a0:	7d02                	ld	s10,32(sp)
 6a2:	6de2                	ld	s11,24(sp)
 6a4:	6109                	addi	sp,sp,128
 6a6:	8082                	ret

00000000000006a8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6a8:	715d                	addi	sp,sp,-80
 6aa:	ec06                	sd	ra,24(sp)
 6ac:	e822                	sd	s0,16(sp)
 6ae:	1000                	addi	s0,sp,32
 6b0:	e010                	sd	a2,0(s0)
 6b2:	e414                	sd	a3,8(s0)
 6b4:	e818                	sd	a4,16(s0)
 6b6:	ec1c                	sd	a5,24(s0)
 6b8:	03043023          	sd	a6,32(s0)
 6bc:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6c0:	8622                	mv	a2,s0
 6c2:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6c6:	00000097          	auipc	ra,0x0
 6ca:	e04080e7          	jalr	-508(ra) # 4ca <vprintf>
}
 6ce:	60e2                	ld	ra,24(sp)
 6d0:	6442                	ld	s0,16(sp)
 6d2:	6161                	addi	sp,sp,80
 6d4:	8082                	ret

00000000000006d6 <printf>:

void
printf(const char *fmt, ...)
{
 6d6:	711d                	addi	sp,sp,-96
 6d8:	ec06                	sd	ra,24(sp)
 6da:	e822                	sd	s0,16(sp)
 6dc:	1000                	addi	s0,sp,32
 6de:	e40c                	sd	a1,8(s0)
 6e0:	e810                	sd	a2,16(s0)
 6e2:	ec14                	sd	a3,24(s0)
 6e4:	f018                	sd	a4,32(s0)
 6e6:	f41c                	sd	a5,40(s0)
 6e8:	03043823          	sd	a6,48(s0)
 6ec:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 6f0:	00840613          	addi	a2,s0,8
 6f4:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 6f8:	85aa                	mv	a1,a0
 6fa:	4505                	li	a0,1
 6fc:	00000097          	auipc	ra,0x0
 700:	dce080e7          	jalr	-562(ra) # 4ca <vprintf>
}
 704:	60e2                	ld	ra,24(sp)
 706:	6442                	ld	s0,16(sp)
 708:	6125                	addi	sp,sp,96
 70a:	8082                	ret

000000000000070c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 70c:	1141                	addi	sp,sp,-16
 70e:	e422                	sd	s0,8(sp)
 710:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 712:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 716:	00000797          	auipc	a5,0x0
 71a:	2027b783          	ld	a5,514(a5) # 918 <freep>
 71e:	a02d                	j	748 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 720:	4618                	lw	a4,8(a2)
 722:	9f2d                	addw	a4,a4,a1
 724:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 728:	6398                	ld	a4,0(a5)
 72a:	6310                	ld	a2,0(a4)
 72c:	a83d                	j	76a <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 72e:	ff852703          	lw	a4,-8(a0)
 732:	9f31                	addw	a4,a4,a2
 734:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 736:	ff053683          	ld	a3,-16(a0)
 73a:	a091                	j	77e <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 73c:	6398                	ld	a4,0(a5)
 73e:	00e7e463          	bltu	a5,a4,746 <free+0x3a>
 742:	00e6ea63          	bltu	a3,a4,756 <free+0x4a>
{
 746:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 748:	fed7fae3          	bgeu	a5,a3,73c <free+0x30>
 74c:	6398                	ld	a4,0(a5)
 74e:	00e6e463          	bltu	a3,a4,756 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 752:	fee7eae3          	bltu	a5,a4,746 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 756:	ff852583          	lw	a1,-8(a0)
 75a:	6390                	ld	a2,0(a5)
 75c:	02059813          	slli	a6,a1,0x20
 760:	01c85713          	srli	a4,a6,0x1c
 764:	9736                	add	a4,a4,a3
 766:	fae60de3          	beq	a2,a4,720 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 76a:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 76e:	4790                	lw	a2,8(a5)
 770:	02061593          	slli	a1,a2,0x20
 774:	01c5d713          	srli	a4,a1,0x1c
 778:	973e                	add	a4,a4,a5
 77a:	fae68ae3          	beq	a3,a4,72e <free+0x22>
    p->s.ptr = bp->s.ptr;
 77e:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 780:	00000717          	auipc	a4,0x0
 784:	18f73c23          	sd	a5,408(a4) # 918 <freep>
}
 788:	6422                	ld	s0,8(sp)
 78a:	0141                	addi	sp,sp,16
 78c:	8082                	ret

000000000000078e <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 78e:	7139                	addi	sp,sp,-64
 790:	fc06                	sd	ra,56(sp)
 792:	f822                	sd	s0,48(sp)
 794:	f426                	sd	s1,40(sp)
 796:	f04a                	sd	s2,32(sp)
 798:	ec4e                	sd	s3,24(sp)
 79a:	e852                	sd	s4,16(sp)
 79c:	e456                	sd	s5,8(sp)
 79e:	e05a                	sd	s6,0(sp)
 7a0:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a2:	02051493          	slli	s1,a0,0x20
 7a6:	9081                	srli	s1,s1,0x20
 7a8:	04bd                	addi	s1,s1,15
 7aa:	8091                	srli	s1,s1,0x4
 7ac:	00148a1b          	addiw	s4,s1,1
 7b0:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7b2:	00000517          	auipc	a0,0x0
 7b6:	16653503          	ld	a0,358(a0) # 918 <freep>
 7ba:	c515                	beqz	a0,7e6 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7bc:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7be:	4798                	lw	a4,8(a5)
 7c0:	04977163          	bgeu	a4,s1,802 <malloc+0x74>
 7c4:	89d2                	mv	s3,s4
 7c6:	000a071b          	sext.w	a4,s4
 7ca:	6685                	lui	a3,0x1
 7cc:	00d77363          	bgeu	a4,a3,7d2 <malloc+0x44>
 7d0:	6985                	lui	s3,0x1
 7d2:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 7d6:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7da:	00000917          	auipc	s2,0x0
 7de:	13e90913          	addi	s2,s2,318 # 918 <freep>
  if(p == (char*)-1)
 7e2:	5afd                	li	s5,-1
 7e4:	a8a5                	j	85c <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 7e6:	00000797          	auipc	a5,0x0
 7ea:	13278793          	addi	a5,a5,306 # 918 <freep>
 7ee:	00000717          	auipc	a4,0x0
 7f2:	13270713          	addi	a4,a4,306 # 920 <base>
 7f6:	e398                	sd	a4,0(a5)
 7f8:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 7fa:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fe:	87ba                	mv	a5,a4
 800:	b7d1                	j	7c4 <malloc+0x36>
      if(p->s.size == nunits)
 802:	02e48c63          	beq	s1,a4,83a <malloc+0xac>
        p->s.size -= nunits;
 806:	4147073b          	subw	a4,a4,s4
 80a:	c798                	sw	a4,8(a5)
        p += p->s.size;
 80c:	02071693          	slli	a3,a4,0x20
 810:	01c6d713          	srli	a4,a3,0x1c
 814:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 816:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 81a:	00000717          	auipc	a4,0x0
 81e:	0ea73f23          	sd	a0,254(a4) # 918 <freep>
      return (void*)(p + 1);
 822:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 826:	70e2                	ld	ra,56(sp)
 828:	7442                	ld	s0,48(sp)
 82a:	74a2                	ld	s1,40(sp)
 82c:	7902                	ld	s2,32(sp)
 82e:	69e2                	ld	s3,24(sp)
 830:	6a42                	ld	s4,16(sp)
 832:	6aa2                	ld	s5,8(sp)
 834:	6b02                	ld	s6,0(sp)
 836:	6121                	addi	sp,sp,64
 838:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 83a:	6398                	ld	a4,0(a5)
 83c:	e118                	sd	a4,0(a0)
 83e:	bff1                	j	81a <malloc+0x8c>
  hp->s.size = nu;
 840:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 844:	0541                	addi	a0,a0,16
 846:	00000097          	auipc	ra,0x0
 84a:	ec6080e7          	jalr	-314(ra) # 70c <free>
  return freep;
 84e:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 852:	d971                	beqz	a0,826 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 854:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 856:	4798                	lw	a4,8(a5)
 858:	fa9775e3          	bgeu	a4,s1,802 <malloc+0x74>
    if(p == freep)
 85c:	00093703          	ld	a4,0(s2)
 860:	853e                	mv	a0,a5
 862:	fef719e3          	bne	a4,a5,854 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 866:	854e                	mv	a0,s3
 868:	00000097          	auipc	ra,0x0
 86c:	b3e080e7          	jalr	-1218(ra) # 3a6 <sbrk>
  if(p == (char*)-1)
 870:	fd5518e3          	bne	a0,s5,840 <malloc+0xb2>
        return 0;
 874:	4501                	li	a0,0
 876:	bf45                	j	826 <malloc+0x98>
