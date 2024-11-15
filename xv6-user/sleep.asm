
xv6-user/_sleep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
    if (argc <= 1) {
   8:	4785                	li	a5,1
   a:	02a7d663          	bge	a5,a0,36 <main+0x36>
        fprintf(2, "Usage: sleep TIME\n");
        exit(1);
    }
    int time = atoi(argv[1]);
   e:	6588                	ld	a0,8(a1)
  10:	00000097          	auipc	ra,0x0
  14:	1fa080e7          	jalr	506(ra) # 20a <atoi>
    if (time == 0) {
  18:	ed0d                	bnez	a0,52 <main+0x52>
        fprintf(2, "Usage: sleep TIME\nTIME should be an integer larger than 0.\n");
  1a:	00001597          	auipc	a1,0x1
  1e:	86658593          	addi	a1,a1,-1946 # 880 <malloc+0x104>
  22:	4509                	li	a0,2
  24:	00000097          	auipc	ra,0x0
  28:	672080e7          	jalr	1650(ra) # 696 <fprintf>
        exit(1);
  2c:	4505                	li	a0,1
  2e:	00000097          	auipc	ra,0x0
  32:	2ee080e7          	jalr	750(ra) # 31c <exit>
        fprintf(2, "Usage: sleep TIME\n");
  36:	00001597          	auipc	a1,0x1
  3a:	83258593          	addi	a1,a1,-1998 # 868 <malloc+0xec>
  3e:	4509                	li	a0,2
  40:	00000097          	auipc	ra,0x0
  44:	656080e7          	jalr	1622(ra) # 696 <fprintf>
        exit(1);
  48:	4505                	li	a0,1
  4a:	00000097          	auipc	ra,0x0
  4e:	2d2080e7          	jalr	722(ra) # 31c <exit>
    }
    sleep(time);
  52:	00000097          	auipc	ra,0x0
  56:	34a080e7          	jalr	842(ra) # 39c <sleep>
    exit(0);
  5a:	4501                	li	a0,0
  5c:	00000097          	auipc	ra,0x0
  60:	2c0080e7          	jalr	704(ra) # 31c <exit>

0000000000000064 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  64:	1141                	addi	sp,sp,-16
  66:	e422                	sd	s0,8(sp)
  68:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6a:	87aa                	mv	a5,a0
  6c:	0585                	addi	a1,a1,1
  6e:	0785                	addi	a5,a5,1
  70:	fff5c703          	lbu	a4,-1(a1)
  74:	fee78fa3          	sb	a4,-1(a5)
  78:	fb75                	bnez	a4,6c <strcpy+0x8>
    ;
  return os;
}
  7a:	6422                	ld	s0,8(sp)
  7c:	0141                	addi	sp,sp,16
  7e:	8082                	ret

0000000000000080 <strcat>:

char*
strcat(char *s, const char *t)
{
  80:	1141                	addi	sp,sp,-16
  82:	e422                	sd	s0,8(sp)
  84:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  86:	00054783          	lbu	a5,0(a0)
  8a:	c385                	beqz	a5,aa <strcat+0x2a>
  8c:	87aa                	mv	a5,a0
    s++;
  8e:	0785                	addi	a5,a5,1
  while(*s)
  90:	0007c703          	lbu	a4,0(a5)
  94:	ff6d                	bnez	a4,8e <strcat+0xe>
  while((*s++ = *t++))
  96:	0585                	addi	a1,a1,1
  98:	0785                	addi	a5,a5,1
  9a:	fff5c703          	lbu	a4,-1(a1)
  9e:	fee78fa3          	sb	a4,-1(a5)
  a2:	fb75                	bnez	a4,96 <strcat+0x16>
    ;
  return os;
}
  a4:	6422                	ld	s0,8(sp)
  a6:	0141                	addi	sp,sp,16
  a8:	8082                	ret
  while(*s)
  aa:	87aa                	mv	a5,a0
  ac:	b7ed                	j	96 <strcat+0x16>

00000000000000ae <strcmp>:


int
strcmp(const char *p, const char *q)
{
  ae:	1141                	addi	sp,sp,-16
  b0:	e422                	sd	s0,8(sp)
  b2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  b4:	00054783          	lbu	a5,0(a0)
  b8:	cb91                	beqz	a5,cc <strcmp+0x1e>
  ba:	0005c703          	lbu	a4,0(a1)
  be:	00f71763          	bne	a4,a5,cc <strcmp+0x1e>
    p++, q++;
  c2:	0505                	addi	a0,a0,1
  c4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  c6:	00054783          	lbu	a5,0(a0)
  ca:	fbe5                	bnez	a5,ba <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  cc:	0005c503          	lbu	a0,0(a1)
}
  d0:	40a7853b          	subw	a0,a5,a0
  d4:	6422                	ld	s0,8(sp)
  d6:	0141                	addi	sp,sp,16
  d8:	8082                	ret

00000000000000da <strlen>:

uint
strlen(const char *s)
{
  da:	1141                	addi	sp,sp,-16
  dc:	e422                	sd	s0,8(sp)
  de:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  e0:	00054783          	lbu	a5,0(a0)
  e4:	cf91                	beqz	a5,100 <strlen+0x26>
  e6:	0505                	addi	a0,a0,1
  e8:	87aa                	mv	a5,a0
  ea:	4685                	li	a3,1
  ec:	9e89                	subw	a3,a3,a0
  ee:	00f6853b          	addw	a0,a3,a5
  f2:	0785                	addi	a5,a5,1
  f4:	fff7c703          	lbu	a4,-1(a5)
  f8:	fb7d                	bnez	a4,ee <strlen+0x14>
    ;
  return n;
}
  fa:	6422                	ld	s0,8(sp)
  fc:	0141                	addi	sp,sp,16
  fe:	8082                	ret
  for(n = 0; s[n]; n++)
 100:	4501                	li	a0,0
 102:	bfe5                	j	fa <strlen+0x20>

0000000000000104 <memset>:

void*
memset(void *dst, int c, uint n)
{
 104:	1141                	addi	sp,sp,-16
 106:	e422                	sd	s0,8(sp)
 108:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 10a:	ca19                	beqz	a2,120 <memset+0x1c>
 10c:	87aa                	mv	a5,a0
 10e:	1602                	slli	a2,a2,0x20
 110:	9201                	srli	a2,a2,0x20
 112:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 116:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 11a:	0785                	addi	a5,a5,1
 11c:	fee79de3          	bne	a5,a4,116 <memset+0x12>
  }
  return dst;
}
 120:	6422                	ld	s0,8(sp)
 122:	0141                	addi	sp,sp,16
 124:	8082                	ret

0000000000000126 <strchr>:

char*
strchr(const char *s, char c)
{
 126:	1141                	addi	sp,sp,-16
 128:	e422                	sd	s0,8(sp)
 12a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 12c:	00054783          	lbu	a5,0(a0)
 130:	cb99                	beqz	a5,146 <strchr+0x20>
    if(*s == c)
 132:	00f58763          	beq	a1,a5,140 <strchr+0x1a>
  for(; *s; s++)
 136:	0505                	addi	a0,a0,1
 138:	00054783          	lbu	a5,0(a0)
 13c:	fbfd                	bnez	a5,132 <strchr+0xc>
      return (char*)s;
  return 0;
 13e:	4501                	li	a0,0
}
 140:	6422                	ld	s0,8(sp)
 142:	0141                	addi	sp,sp,16
 144:	8082                	ret
  return 0;
 146:	4501                	li	a0,0
 148:	bfe5                	j	140 <strchr+0x1a>

000000000000014a <gets>:

char*
gets(char *buf, int max)
{
 14a:	711d                	addi	sp,sp,-96
 14c:	ec86                	sd	ra,88(sp)
 14e:	e8a2                	sd	s0,80(sp)
 150:	e4a6                	sd	s1,72(sp)
 152:	e0ca                	sd	s2,64(sp)
 154:	fc4e                	sd	s3,56(sp)
 156:	f852                	sd	s4,48(sp)
 158:	f456                	sd	s5,40(sp)
 15a:	f05a                	sd	s6,32(sp)
 15c:	ec5e                	sd	s7,24(sp)
 15e:	e862                	sd	s8,16(sp)
 160:	1080                	addi	s0,sp,96
 162:	8baa                	mv	s7,a0
 164:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 166:	892a                	mv	s2,a0
 168:	4481                	li	s1,0
    cc = read(0, &c, 1);
 16a:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 16e:	4b29                	li	s6,10
 170:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 172:	89a6                	mv	s3,s1
 174:	2485                	addiw	s1,s1,1
 176:	0344d763          	bge	s1,s4,1a4 <gets+0x5a>
    cc = read(0, &c, 1);
 17a:	4605                	li	a2,1
 17c:	85d6                	mv	a1,s5
 17e:	4501                	li	a0,0
 180:	00000097          	auipc	ra,0x0
 184:	1b6080e7          	jalr	438(ra) # 336 <read>
    if(cc < 1)
 188:	00a05e63          	blez	a0,1a4 <gets+0x5a>
    buf[i++] = c;
 18c:	faf44783          	lbu	a5,-81(s0)
 190:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 194:	01678763          	beq	a5,s6,1a2 <gets+0x58>
 198:	0905                	addi	s2,s2,1
 19a:	fd879ce3          	bne	a5,s8,172 <gets+0x28>
  for(i=0; i+1 < max; ){
 19e:	89a6                	mv	s3,s1
 1a0:	a011                	j	1a4 <gets+0x5a>
 1a2:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1a4:	99de                	add	s3,s3,s7
 1a6:	00098023          	sb	zero,0(s3)
  return buf;
}
 1aa:	855e                	mv	a0,s7
 1ac:	60e6                	ld	ra,88(sp)
 1ae:	6446                	ld	s0,80(sp)
 1b0:	64a6                	ld	s1,72(sp)
 1b2:	6906                	ld	s2,64(sp)
 1b4:	79e2                	ld	s3,56(sp)
 1b6:	7a42                	ld	s4,48(sp)
 1b8:	7aa2                	ld	s5,40(sp)
 1ba:	7b02                	ld	s6,32(sp)
 1bc:	6be2                	ld	s7,24(sp)
 1be:	6c42                	ld	s8,16(sp)
 1c0:	6125                	addi	sp,sp,96
 1c2:	8082                	ret

00000000000001c4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c4:	1101                	addi	sp,sp,-32
 1c6:	ec06                	sd	ra,24(sp)
 1c8:	e822                	sd	s0,16(sp)
 1ca:	e426                	sd	s1,8(sp)
 1cc:	e04a                	sd	s2,0(sp)
 1ce:	1000                	addi	s0,sp,32
 1d0:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d2:	4581                	li	a1,0
 1d4:	00000097          	auipc	ra,0x0
 1d8:	18e080e7          	jalr	398(ra) # 362 <open>
  if(fd < 0)
 1dc:	02054563          	bltz	a0,206 <stat+0x42>
 1e0:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 1e2:	85ca                	mv	a1,s2
 1e4:	00000097          	auipc	ra,0x0
 1e8:	186080e7          	jalr	390(ra) # 36a <fstat>
 1ec:	892a                	mv	s2,a0
  close(fd);
 1ee:	8526                	mv	a0,s1
 1f0:	00000097          	auipc	ra,0x0
 1f4:	158080e7          	jalr	344(ra) # 348 <close>
  return r;
}
 1f8:	854a                	mv	a0,s2
 1fa:	60e2                	ld	ra,24(sp)
 1fc:	6442                	ld	s0,16(sp)
 1fe:	64a2                	ld	s1,8(sp)
 200:	6902                	ld	s2,0(sp)
 202:	6105                	addi	sp,sp,32
 204:	8082                	ret
    return -1;
 206:	597d                	li	s2,-1
 208:	bfc5                	j	1f8 <stat+0x34>

000000000000020a <atoi>:

int
atoi(const char *s)
{
 20a:	1141                	addi	sp,sp,-16
 20c:	e422                	sd	s0,8(sp)
 20e:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 210:	00054703          	lbu	a4,0(a0)
 214:	02d00793          	li	a5,45
  int neg = 1;
 218:	4585                	li	a1,1
  if (*s == '-') {
 21a:	04f70363          	beq	a4,a5,260 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 21e:	00054703          	lbu	a4,0(a0)
 222:	fd07079b          	addiw	a5,a4,-48
 226:	0ff7f793          	zext.b	a5,a5
 22a:	46a5                	li	a3,9
 22c:	02f6ed63          	bltu	a3,a5,266 <atoi+0x5c>
  n = 0;
 230:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 232:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 234:	0505                	addi	a0,a0,1
 236:	0026979b          	slliw	a5,a3,0x2
 23a:	9fb5                	addw	a5,a5,a3
 23c:	0017979b          	slliw	a5,a5,0x1
 240:	9fb9                	addw	a5,a5,a4
 242:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 246:	00054703          	lbu	a4,0(a0)
 24a:	fd07079b          	addiw	a5,a4,-48
 24e:	0ff7f793          	zext.b	a5,a5
 252:	fef671e3          	bgeu	a2,a5,234 <atoi+0x2a>
  return n * neg;
}
 256:	02d5853b          	mulw	a0,a1,a3
 25a:	6422                	ld	s0,8(sp)
 25c:	0141                	addi	sp,sp,16
 25e:	8082                	ret
    s++;
 260:	0505                	addi	a0,a0,1
    neg = -1;
 262:	55fd                	li	a1,-1
 264:	bf6d                	j	21e <atoi+0x14>
  n = 0;
 266:	4681                	li	a3,0
 268:	b7fd                	j	256 <atoi+0x4c>

000000000000026a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 26a:	1141                	addi	sp,sp,-16
 26c:	e422                	sd	s0,8(sp)
 26e:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 270:	02b57463          	bgeu	a0,a1,298 <memmove+0x2e>
    while(n-- > 0)
 274:	00c05f63          	blez	a2,292 <memmove+0x28>
 278:	1602                	slli	a2,a2,0x20
 27a:	9201                	srli	a2,a2,0x20
 27c:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 280:	872a                	mv	a4,a0
      *dst++ = *src++;
 282:	0585                	addi	a1,a1,1
 284:	0705                	addi	a4,a4,1
 286:	fff5c683          	lbu	a3,-1(a1)
 28a:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 28e:	fee79ae3          	bne	a5,a4,282 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 292:	6422                	ld	s0,8(sp)
 294:	0141                	addi	sp,sp,16
 296:	8082                	ret
    dst += n;
 298:	00c50733          	add	a4,a0,a2
    src += n;
 29c:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 29e:	fec05ae3          	blez	a2,292 <memmove+0x28>
 2a2:	fff6079b          	addiw	a5,a2,-1
 2a6:	1782                	slli	a5,a5,0x20
 2a8:	9381                	srli	a5,a5,0x20
 2aa:	fff7c793          	not	a5,a5
 2ae:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 2b0:	15fd                	addi	a1,a1,-1
 2b2:	177d                	addi	a4,a4,-1
 2b4:	0005c683          	lbu	a3,0(a1)
 2b8:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 2bc:	fee79ae3          	bne	a5,a4,2b0 <memmove+0x46>
 2c0:	bfc9                	j	292 <memmove+0x28>

00000000000002c2 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 2c2:	1141                	addi	sp,sp,-16
 2c4:	e422                	sd	s0,8(sp)
 2c6:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 2c8:	ca05                	beqz	a2,2f8 <memcmp+0x36>
 2ca:	fff6069b          	addiw	a3,a2,-1
 2ce:	1682                	slli	a3,a3,0x20
 2d0:	9281                	srli	a3,a3,0x20
 2d2:	0685                	addi	a3,a3,1
 2d4:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 2d6:	00054783          	lbu	a5,0(a0)
 2da:	0005c703          	lbu	a4,0(a1)
 2de:	00e79863          	bne	a5,a4,2ee <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 2e2:	0505                	addi	a0,a0,1
    p2++;
 2e4:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 2e6:	fed518e3          	bne	a0,a3,2d6 <memcmp+0x14>
  }
  return 0;
 2ea:	4501                	li	a0,0
 2ec:	a019                	j	2f2 <memcmp+0x30>
      return *p1 - *p2;
 2ee:	40e7853b          	subw	a0,a5,a4
}
 2f2:	6422                	ld	s0,8(sp)
 2f4:	0141                	addi	sp,sp,16
 2f6:	8082                	ret
  return 0;
 2f8:	4501                	li	a0,0
 2fa:	bfe5                	j	2f2 <memcmp+0x30>

00000000000002fc <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 2fc:	1141                	addi	sp,sp,-16
 2fe:	e406                	sd	ra,8(sp)
 300:	e022                	sd	s0,0(sp)
 302:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 304:	00000097          	auipc	ra,0x0
 308:	f66080e7          	jalr	-154(ra) # 26a <memmove>
}
 30c:	60a2                	ld	ra,8(sp)
 30e:	6402                	ld	s0,0(sp)
 310:	0141                	addi	sp,sp,16
 312:	8082                	ret

0000000000000314 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 314:	4885                	li	a7,1
 ecall
 316:	00000073          	ecall
 ret
 31a:	8082                	ret

000000000000031c <exit>:
.global exit
exit:
 li a7, SYS_exit
 31c:	05d00893          	li	a7,93
 ecall
 320:	00000073          	ecall
 ret
 324:	8082                	ret

0000000000000326 <wait>:
.global wait
wait:
 li a7, SYS_wait
 326:	488d                	li	a7,3
 ecall
 328:	00000073          	ecall
 ret
 32c:	8082                	ret

000000000000032e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 32e:	4891                	li	a7,4
 ecall
 330:	00000073          	ecall
 ret
 334:	8082                	ret

0000000000000336 <read>:
.global read
read:
 li a7, SYS_read
 336:	4895                	li	a7,5
 ecall
 338:	00000073          	ecall
 ret
 33c:	8082                	ret

000000000000033e <write>:
.global write
write:
 li a7, SYS_write
 33e:	04000893          	li	a7,64
 ecall
 342:	00000073          	ecall
 ret
 346:	8082                	ret

0000000000000348 <close>:
.global close
close:
 li a7, SYS_close
 348:	48d5                	li	a7,21
 ecall
 34a:	00000073          	ecall
 ret
 34e:	8082                	ret

0000000000000350 <kill>:
.global kill
kill:
 li a7, SYS_kill
 350:	4899                	li	a7,6
 ecall
 352:	00000073          	ecall
 ret
 356:	8082                	ret

0000000000000358 <exec>:
.global exec
exec:
 li a7, SYS_exec
 358:	0dd00893          	li	a7,221
 ecall
 35c:	00000073          	ecall
 ret
 360:	8082                	ret

0000000000000362 <open>:
.global open
open:
 li a7, SYS_open
 362:	48bd                	li	a7,15
 ecall
 364:	00000073          	ecall
 ret
 368:	8082                	ret

000000000000036a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 36a:	48a1                	li	a7,8
 ecall
 36c:	00000073          	ecall
 ret
 370:	8082                	ret

0000000000000372 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 372:	48d1                	li	a7,20
 ecall
 374:	00000073          	ecall
 ret
 378:	8082                	ret

000000000000037a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 37a:	48a5                	li	a7,9
 ecall
 37c:	00000073          	ecall
 ret
 380:	8082                	ret

0000000000000382 <dup>:
.global dup
dup:
 li a7, SYS_dup
 382:	48a9                	li	a7,10
 ecall
 384:	00000073          	ecall
 ret
 388:	8082                	ret

000000000000038a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 38a:	0ac00893          	li	a7,172
 ecall
 38e:	00000073          	ecall
 ret
 392:	8082                	ret

0000000000000394 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 394:	48b1                	li	a7,12
 ecall
 396:	00000073          	ecall
 ret
 39a:	8082                	ret

000000000000039c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 39c:	48b5                	li	a7,13
 ecall
 39e:	00000073          	ecall
 ret
 3a2:	8082                	ret

00000000000003a4 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 3a4:	48b9                	li	a7,14
 ecall
 3a6:	00000073          	ecall
 ret
 3aa:	8082                	ret

00000000000003ac <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 3ac:	48d9                	li	a7,22
 ecall
 3ae:	00000073          	ecall
 ret
 3b2:	8082                	ret

00000000000003b4 <dev>:
.global dev
dev:
 li a7, SYS_dev
 3b4:	48dd                	li	a7,23
 ecall
 3b6:	00000073          	ecall
 ret
 3ba:	8082                	ret

00000000000003bc <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 3bc:	48e1                	li	a7,24
 ecall
 3be:	00000073          	ecall
 ret
 3c2:	8082                	ret

00000000000003c4 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 3c4:	48c5                	li	a7,17
 ecall
 3c6:	00000073          	ecall
 ret
 3ca:	8082                	ret

00000000000003cc <remove>:
.global remove
remove:
 li a7, SYS_remove
 3cc:	48c5                	li	a7,17
 ecall
 3ce:	00000073          	ecall
 ret
 3d2:	8082                	ret

00000000000003d4 <trace>:
.global trace
trace:
 li a7, SYS_trace
 3d4:	48c9                	li	a7,18
 ecall
 3d6:	00000073          	ecall
 ret
 3da:	8082                	ret

00000000000003dc <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 3dc:	48cd                	li	a7,19
 ecall
 3de:	00000073          	ecall
 ret
 3e2:	8082                	ret

00000000000003e4 <rename>:
.global rename
rename:
 li a7, SYS_rename
 3e4:	48e9                	li	a7,26
 ecall
 3e6:	00000073          	ecall
 ret
 3ea:	8082                	ret

00000000000003ec <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 3ec:	1101                	addi	sp,sp,-32
 3ee:	ec06                	sd	ra,24(sp)
 3f0:	e822                	sd	s0,16(sp)
 3f2:	1000                	addi	s0,sp,32
 3f4:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 3f8:	4605                	li	a2,1
 3fa:	fef40593          	addi	a1,s0,-17
 3fe:	00000097          	auipc	ra,0x0
 402:	f40080e7          	jalr	-192(ra) # 33e <write>
}
 406:	60e2                	ld	ra,24(sp)
 408:	6442                	ld	s0,16(sp)
 40a:	6105                	addi	sp,sp,32
 40c:	8082                	ret

000000000000040e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 40e:	7139                	addi	sp,sp,-64
 410:	fc06                	sd	ra,56(sp)
 412:	f822                	sd	s0,48(sp)
 414:	f426                	sd	s1,40(sp)
 416:	f04a                	sd	s2,32(sp)
 418:	ec4e                	sd	s3,24(sp)
 41a:	0080                	addi	s0,sp,64
 41c:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 41e:	c299                	beqz	a3,424 <printint+0x16>
 420:	0805c863          	bltz	a1,4b0 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 424:	2581                	sext.w	a1,a1
  neg = 0;
 426:	4881                	li	a7,0
  }

  i = 0;
 428:	fc040993          	addi	s3,s0,-64
  neg = 0;
 42c:	86ce                	mv	a3,s3
  i = 0;
 42e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 430:	2601                	sext.w	a2,a2
 432:	00000517          	auipc	a0,0x0
 436:	4ee50513          	addi	a0,a0,1262 # 920 <digits>
 43a:	883a                	mv	a6,a4
 43c:	2705                	addiw	a4,a4,1
 43e:	02c5f7bb          	remuw	a5,a1,a2
 442:	1782                	slli	a5,a5,0x20
 444:	9381                	srli	a5,a5,0x20
 446:	97aa                	add	a5,a5,a0
 448:	0007c783          	lbu	a5,0(a5)
 44c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 450:	0005879b          	sext.w	a5,a1
 454:	02c5d5bb          	divuw	a1,a1,a2
 458:	0685                	addi	a3,a3,1
 45a:	fec7f0e3          	bgeu	a5,a2,43a <printint+0x2c>
  if(neg)
 45e:	00088c63          	beqz	a7,476 <printint+0x68>
    buf[i++] = '-';
 462:	fd070793          	addi	a5,a4,-48
 466:	00878733          	add	a4,a5,s0
 46a:	02d00793          	li	a5,45
 46e:	fef70823          	sb	a5,-16(a4)
 472:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 476:	02e05663          	blez	a4,4a2 <printint+0x94>
 47a:	fc040913          	addi	s2,s0,-64
 47e:	993a                	add	s2,s2,a4
 480:	19fd                	addi	s3,s3,-1
 482:	99ba                	add	s3,s3,a4
 484:	377d                	addiw	a4,a4,-1
 486:	1702                	slli	a4,a4,0x20
 488:	9301                	srli	a4,a4,0x20
 48a:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 48e:	fff94583          	lbu	a1,-1(s2)
 492:	8526                	mv	a0,s1
 494:	00000097          	auipc	ra,0x0
 498:	f58080e7          	jalr	-168(ra) # 3ec <putc>
  while(--i >= 0)
 49c:	197d                	addi	s2,s2,-1
 49e:	ff3918e3          	bne	s2,s3,48e <printint+0x80>
}
 4a2:	70e2                	ld	ra,56(sp)
 4a4:	7442                	ld	s0,48(sp)
 4a6:	74a2                	ld	s1,40(sp)
 4a8:	7902                	ld	s2,32(sp)
 4aa:	69e2                	ld	s3,24(sp)
 4ac:	6121                	addi	sp,sp,64
 4ae:	8082                	ret
    x = -xx;
 4b0:	40b005bb          	negw	a1,a1
    neg = 1;
 4b4:	4885                	li	a7,1
    x = -xx;
 4b6:	bf8d                	j	428 <printint+0x1a>

00000000000004b8 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 4b8:	7119                	addi	sp,sp,-128
 4ba:	fc86                	sd	ra,120(sp)
 4bc:	f8a2                	sd	s0,112(sp)
 4be:	f4a6                	sd	s1,104(sp)
 4c0:	f0ca                	sd	s2,96(sp)
 4c2:	ecce                	sd	s3,88(sp)
 4c4:	e8d2                	sd	s4,80(sp)
 4c6:	e4d6                	sd	s5,72(sp)
 4c8:	e0da                	sd	s6,64(sp)
 4ca:	fc5e                	sd	s7,56(sp)
 4cc:	f862                	sd	s8,48(sp)
 4ce:	f466                	sd	s9,40(sp)
 4d0:	f06a                	sd	s10,32(sp)
 4d2:	ec6e                	sd	s11,24(sp)
 4d4:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 4d6:	0005c903          	lbu	s2,0(a1)
 4da:	18090f63          	beqz	s2,678 <vprintf+0x1c0>
 4de:	8aaa                	mv	s5,a0
 4e0:	8b32                	mv	s6,a2
 4e2:	00158493          	addi	s1,a1,1
  state = 0;
 4e6:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4e8:	02500a13          	li	s4,37
 4ec:	4c55                	li	s8,21
 4ee:	00000c97          	auipc	s9,0x0
 4f2:	3dac8c93          	addi	s9,s9,986 # 8c8 <malloc+0x14c>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4f6:	02800d93          	li	s11,40
  putc(fd, 'x');
 4fa:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 4fc:	00000b97          	auipc	s7,0x0
 500:	424b8b93          	addi	s7,s7,1060 # 920 <digits>
 504:	a839                	j	522 <vprintf+0x6a>
        putc(fd, c);
 506:	85ca                	mv	a1,s2
 508:	8556                	mv	a0,s5
 50a:	00000097          	auipc	ra,0x0
 50e:	ee2080e7          	jalr	-286(ra) # 3ec <putc>
 512:	a019                	j	518 <vprintf+0x60>
    } else if(state == '%'){
 514:	01498d63          	beq	s3,s4,52e <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 518:	0485                	addi	s1,s1,1
 51a:	fff4c903          	lbu	s2,-1(s1)
 51e:	14090d63          	beqz	s2,678 <vprintf+0x1c0>
    if(state == 0){
 522:	fe0999e3          	bnez	s3,514 <vprintf+0x5c>
      if(c == '%'){
 526:	ff4910e3          	bne	s2,s4,506 <vprintf+0x4e>
        state = '%';
 52a:	89d2                	mv	s3,s4
 52c:	b7f5                	j	518 <vprintf+0x60>
      if(c == 'd'){
 52e:	11490c63          	beq	s2,s4,646 <vprintf+0x18e>
 532:	f9d9079b          	addiw	a5,s2,-99
 536:	0ff7f793          	zext.b	a5,a5
 53a:	10fc6e63          	bltu	s8,a5,656 <vprintf+0x19e>
 53e:	f9d9079b          	addiw	a5,s2,-99
 542:	0ff7f713          	zext.b	a4,a5
 546:	10ec6863          	bltu	s8,a4,656 <vprintf+0x19e>
 54a:	00271793          	slli	a5,a4,0x2
 54e:	97e6                	add	a5,a5,s9
 550:	439c                	lw	a5,0(a5)
 552:	97e6                	add	a5,a5,s9
 554:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 556:	008b0913          	addi	s2,s6,8
 55a:	4685                	li	a3,1
 55c:	4629                	li	a2,10
 55e:	000b2583          	lw	a1,0(s6)
 562:	8556                	mv	a0,s5
 564:	00000097          	auipc	ra,0x0
 568:	eaa080e7          	jalr	-342(ra) # 40e <printint>
 56c:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 56e:	4981                	li	s3,0
 570:	b765                	j	518 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 572:	008b0913          	addi	s2,s6,8
 576:	4681                	li	a3,0
 578:	4629                	li	a2,10
 57a:	000b2583          	lw	a1,0(s6)
 57e:	8556                	mv	a0,s5
 580:	00000097          	auipc	ra,0x0
 584:	e8e080e7          	jalr	-370(ra) # 40e <printint>
 588:	8b4a                	mv	s6,s2
      state = 0;
 58a:	4981                	li	s3,0
 58c:	b771                	j	518 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 58e:	008b0913          	addi	s2,s6,8
 592:	4681                	li	a3,0
 594:	866a                	mv	a2,s10
 596:	000b2583          	lw	a1,0(s6)
 59a:	8556                	mv	a0,s5
 59c:	00000097          	auipc	ra,0x0
 5a0:	e72080e7          	jalr	-398(ra) # 40e <printint>
 5a4:	8b4a                	mv	s6,s2
      state = 0;
 5a6:	4981                	li	s3,0
 5a8:	bf85                	j	518 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 5aa:	008b0793          	addi	a5,s6,8
 5ae:	f8f43423          	sd	a5,-120(s0)
 5b2:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 5b6:	03000593          	li	a1,48
 5ba:	8556                	mv	a0,s5
 5bc:	00000097          	auipc	ra,0x0
 5c0:	e30080e7          	jalr	-464(ra) # 3ec <putc>
  putc(fd, 'x');
 5c4:	07800593          	li	a1,120
 5c8:	8556                	mv	a0,s5
 5ca:	00000097          	auipc	ra,0x0
 5ce:	e22080e7          	jalr	-478(ra) # 3ec <putc>
 5d2:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5d4:	03c9d793          	srli	a5,s3,0x3c
 5d8:	97de                	add	a5,a5,s7
 5da:	0007c583          	lbu	a1,0(a5)
 5de:	8556                	mv	a0,s5
 5e0:	00000097          	auipc	ra,0x0
 5e4:	e0c080e7          	jalr	-500(ra) # 3ec <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 5e8:	0992                	slli	s3,s3,0x4
 5ea:	397d                	addiw	s2,s2,-1
 5ec:	fe0914e3          	bnez	s2,5d4 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 5f0:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 5f4:	4981                	li	s3,0
 5f6:	b70d                	j	518 <vprintf+0x60>
        s = va_arg(ap, char*);
 5f8:	008b0913          	addi	s2,s6,8
 5fc:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 600:	02098163          	beqz	s3,622 <vprintf+0x16a>
        while(*s != 0){
 604:	0009c583          	lbu	a1,0(s3)
 608:	c5ad                	beqz	a1,672 <vprintf+0x1ba>
          putc(fd, *s);
 60a:	8556                	mv	a0,s5
 60c:	00000097          	auipc	ra,0x0
 610:	de0080e7          	jalr	-544(ra) # 3ec <putc>
          s++;
 614:	0985                	addi	s3,s3,1
        while(*s != 0){
 616:	0009c583          	lbu	a1,0(s3)
 61a:	f9e5                	bnez	a1,60a <vprintf+0x152>
        s = va_arg(ap, char*);
 61c:	8b4a                	mv	s6,s2
      state = 0;
 61e:	4981                	li	s3,0
 620:	bde5                	j	518 <vprintf+0x60>
          s = "(null)";
 622:	00000997          	auipc	s3,0x0
 626:	29e98993          	addi	s3,s3,670 # 8c0 <malloc+0x144>
        while(*s != 0){
 62a:	85ee                	mv	a1,s11
 62c:	bff9                	j	60a <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 62e:	008b0913          	addi	s2,s6,8
 632:	000b4583          	lbu	a1,0(s6)
 636:	8556                	mv	a0,s5
 638:	00000097          	auipc	ra,0x0
 63c:	db4080e7          	jalr	-588(ra) # 3ec <putc>
 640:	8b4a                	mv	s6,s2
      state = 0;
 642:	4981                	li	s3,0
 644:	bdd1                	j	518 <vprintf+0x60>
        putc(fd, c);
 646:	85d2                	mv	a1,s4
 648:	8556                	mv	a0,s5
 64a:	00000097          	auipc	ra,0x0
 64e:	da2080e7          	jalr	-606(ra) # 3ec <putc>
      state = 0;
 652:	4981                	li	s3,0
 654:	b5d1                	j	518 <vprintf+0x60>
        putc(fd, '%');
 656:	85d2                	mv	a1,s4
 658:	8556                	mv	a0,s5
 65a:	00000097          	auipc	ra,0x0
 65e:	d92080e7          	jalr	-622(ra) # 3ec <putc>
        putc(fd, c);
 662:	85ca                	mv	a1,s2
 664:	8556                	mv	a0,s5
 666:	00000097          	auipc	ra,0x0
 66a:	d86080e7          	jalr	-634(ra) # 3ec <putc>
      state = 0;
 66e:	4981                	li	s3,0
 670:	b565                	j	518 <vprintf+0x60>
        s = va_arg(ap, char*);
 672:	8b4a                	mv	s6,s2
      state = 0;
 674:	4981                	li	s3,0
 676:	b54d                	j	518 <vprintf+0x60>
    }
  }
}
 678:	70e6                	ld	ra,120(sp)
 67a:	7446                	ld	s0,112(sp)
 67c:	74a6                	ld	s1,104(sp)
 67e:	7906                	ld	s2,96(sp)
 680:	69e6                	ld	s3,88(sp)
 682:	6a46                	ld	s4,80(sp)
 684:	6aa6                	ld	s5,72(sp)
 686:	6b06                	ld	s6,64(sp)
 688:	7be2                	ld	s7,56(sp)
 68a:	7c42                	ld	s8,48(sp)
 68c:	7ca2                	ld	s9,40(sp)
 68e:	7d02                	ld	s10,32(sp)
 690:	6de2                	ld	s11,24(sp)
 692:	6109                	addi	sp,sp,128
 694:	8082                	ret

0000000000000696 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 696:	715d                	addi	sp,sp,-80
 698:	ec06                	sd	ra,24(sp)
 69a:	e822                	sd	s0,16(sp)
 69c:	1000                	addi	s0,sp,32
 69e:	e010                	sd	a2,0(s0)
 6a0:	e414                	sd	a3,8(s0)
 6a2:	e818                	sd	a4,16(s0)
 6a4:	ec1c                	sd	a5,24(s0)
 6a6:	03043023          	sd	a6,32(s0)
 6aa:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 6ae:	8622                	mv	a2,s0
 6b0:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 6b4:	00000097          	auipc	ra,0x0
 6b8:	e04080e7          	jalr	-508(ra) # 4b8 <vprintf>
}
 6bc:	60e2                	ld	ra,24(sp)
 6be:	6442                	ld	s0,16(sp)
 6c0:	6161                	addi	sp,sp,80
 6c2:	8082                	ret

00000000000006c4 <printf>:

void
printf(const char *fmt, ...)
{
 6c4:	711d                	addi	sp,sp,-96
 6c6:	ec06                	sd	ra,24(sp)
 6c8:	e822                	sd	s0,16(sp)
 6ca:	1000                	addi	s0,sp,32
 6cc:	e40c                	sd	a1,8(s0)
 6ce:	e810                	sd	a2,16(s0)
 6d0:	ec14                	sd	a3,24(s0)
 6d2:	f018                	sd	a4,32(s0)
 6d4:	f41c                	sd	a5,40(s0)
 6d6:	03043823          	sd	a6,48(s0)
 6da:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 6de:	00840613          	addi	a2,s0,8
 6e2:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 6e6:	85aa                	mv	a1,a0
 6e8:	4505                	li	a0,1
 6ea:	00000097          	auipc	ra,0x0
 6ee:	dce080e7          	jalr	-562(ra) # 4b8 <vprintf>
}
 6f2:	60e2                	ld	ra,24(sp)
 6f4:	6442                	ld	s0,16(sp)
 6f6:	6125                	addi	sp,sp,96
 6f8:	8082                	ret

00000000000006fa <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6fa:	1141                	addi	sp,sp,-16
 6fc:	e422                	sd	s0,8(sp)
 6fe:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 700:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 704:	00000797          	auipc	a5,0x0
 708:	2347b783          	ld	a5,564(a5) # 938 <freep>
 70c:	a02d                	j	736 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 70e:	4618                	lw	a4,8(a2)
 710:	9f2d                	addw	a4,a4,a1
 712:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 716:	6398                	ld	a4,0(a5)
 718:	6310                	ld	a2,0(a4)
 71a:	a83d                	j	758 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 71c:	ff852703          	lw	a4,-8(a0)
 720:	9f31                	addw	a4,a4,a2
 722:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 724:	ff053683          	ld	a3,-16(a0)
 728:	a091                	j	76c <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72a:	6398                	ld	a4,0(a5)
 72c:	00e7e463          	bltu	a5,a4,734 <free+0x3a>
 730:	00e6ea63          	bltu	a3,a4,744 <free+0x4a>
{
 734:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 736:	fed7fae3          	bgeu	a5,a3,72a <free+0x30>
 73a:	6398                	ld	a4,0(a5)
 73c:	00e6e463          	bltu	a3,a4,744 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 740:	fee7eae3          	bltu	a5,a4,734 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 744:	ff852583          	lw	a1,-8(a0)
 748:	6390                	ld	a2,0(a5)
 74a:	02059813          	slli	a6,a1,0x20
 74e:	01c85713          	srli	a4,a6,0x1c
 752:	9736                	add	a4,a4,a3
 754:	fae60de3          	beq	a2,a4,70e <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 758:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 75c:	4790                	lw	a2,8(a5)
 75e:	02061593          	slli	a1,a2,0x20
 762:	01c5d713          	srli	a4,a1,0x1c
 766:	973e                	add	a4,a4,a5
 768:	fae68ae3          	beq	a3,a4,71c <free+0x22>
    p->s.ptr = bp->s.ptr;
 76c:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 76e:	00000717          	auipc	a4,0x0
 772:	1cf73523          	sd	a5,458(a4) # 938 <freep>
}
 776:	6422                	ld	s0,8(sp)
 778:	0141                	addi	sp,sp,16
 77a:	8082                	ret

000000000000077c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 77c:	7139                	addi	sp,sp,-64
 77e:	fc06                	sd	ra,56(sp)
 780:	f822                	sd	s0,48(sp)
 782:	f426                	sd	s1,40(sp)
 784:	f04a                	sd	s2,32(sp)
 786:	ec4e                	sd	s3,24(sp)
 788:	e852                	sd	s4,16(sp)
 78a:	e456                	sd	s5,8(sp)
 78c:	e05a                	sd	s6,0(sp)
 78e:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 790:	02051493          	slli	s1,a0,0x20
 794:	9081                	srli	s1,s1,0x20
 796:	04bd                	addi	s1,s1,15
 798:	8091                	srli	s1,s1,0x4
 79a:	00148a1b          	addiw	s4,s1,1
 79e:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7a0:	00000517          	auipc	a0,0x0
 7a4:	19853503          	ld	a0,408(a0) # 938 <freep>
 7a8:	c515                	beqz	a0,7d4 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7aa:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7ac:	4798                	lw	a4,8(a5)
 7ae:	04977163          	bgeu	a4,s1,7f0 <malloc+0x74>
 7b2:	89d2                	mv	s3,s4
 7b4:	000a071b          	sext.w	a4,s4
 7b8:	6685                	lui	a3,0x1
 7ba:	00d77363          	bgeu	a4,a3,7c0 <malloc+0x44>
 7be:	6985                	lui	s3,0x1
 7c0:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 7c4:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c8:	00000917          	auipc	s2,0x0
 7cc:	17090913          	addi	s2,s2,368 # 938 <freep>
  if(p == (char*)-1)
 7d0:	5afd                	li	s5,-1
 7d2:	a8a5                	j	84a <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 7d4:	00000797          	auipc	a5,0x0
 7d8:	16478793          	addi	a5,a5,356 # 938 <freep>
 7dc:	00000717          	auipc	a4,0x0
 7e0:	16470713          	addi	a4,a4,356 # 940 <base>
 7e4:	e398                	sd	a4,0(a5)
 7e6:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 7e8:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ec:	87ba                	mv	a5,a4
 7ee:	b7d1                	j	7b2 <malloc+0x36>
      if(p->s.size == nunits)
 7f0:	02e48c63          	beq	s1,a4,828 <malloc+0xac>
        p->s.size -= nunits;
 7f4:	4147073b          	subw	a4,a4,s4
 7f8:	c798                	sw	a4,8(a5)
        p += p->s.size;
 7fa:	02071693          	slli	a3,a4,0x20
 7fe:	01c6d713          	srli	a4,a3,0x1c
 802:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 804:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 808:	00000717          	auipc	a4,0x0
 80c:	12a73823          	sd	a0,304(a4) # 938 <freep>
      return (void*)(p + 1);
 810:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 814:	70e2                	ld	ra,56(sp)
 816:	7442                	ld	s0,48(sp)
 818:	74a2                	ld	s1,40(sp)
 81a:	7902                	ld	s2,32(sp)
 81c:	69e2                	ld	s3,24(sp)
 81e:	6a42                	ld	s4,16(sp)
 820:	6aa2                	ld	s5,8(sp)
 822:	6b02                	ld	s6,0(sp)
 824:	6121                	addi	sp,sp,64
 826:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 828:	6398                	ld	a4,0(a5)
 82a:	e118                	sd	a4,0(a0)
 82c:	bff1                	j	808 <malloc+0x8c>
  hp->s.size = nu;
 82e:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 832:	0541                	addi	a0,a0,16
 834:	00000097          	auipc	ra,0x0
 838:	ec6080e7          	jalr	-314(ra) # 6fa <free>
  return freep;
 83c:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 840:	d971                	beqz	a0,814 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 842:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 844:	4798                	lw	a4,8(a5)
 846:	fa9775e3          	bgeu	a4,s1,7f0 <malloc+0x74>
    if(p == freep)
 84a:	00093703          	ld	a4,0(s2)
 84e:	853e                	mv	a0,a5
 850:	fef719e3          	bne	a4,a5,842 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 854:	854e                	mv	a0,s3
 856:	00000097          	auipc	ra,0x0
 85a:	b3e080e7          	jalr	-1218(ra) # 394 <sbrk>
  if(p == (char*)-1)
 85e:	fd5518e3          	bne	a0,s5,82e <malloc+0xb2>
        return 0;
 862:	4501                	li	a0,0
 864:	bf45                	j	814 <malloc+0x98>
