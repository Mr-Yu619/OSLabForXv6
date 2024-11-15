
xv6-user/_strace:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

int
main(int argc, char *argv[])
{
   0:	712d                	addi	sp,sp,-288
   2:	ee06                	sd	ra,280(sp)
   4:	ea22                	sd	s0,272(sp)
   6:	e626                	sd	s1,264(sp)
   8:	e24a                	sd	s2,256(sp)
   a:	1200                	addi	s0,sp,288
   c:	892e                	mv	s2,a1
  int i;
  char *nargv[MAXARG];

  if(argc < 3 /*|| (argv[1][0] < '0' || argv[1][0] > '9')*/){
   e:	4789                	li	a5,2
  10:	02a7c163          	blt	a5,a0,32 <main+0x32>
    fprintf(2, "usage: %s MASK COMMAND\n", argv[0]);
  14:	6190                	ld	a2,0(a1)
  16:	00001597          	auipc	a1,0x1
  1a:	8b258593          	addi	a1,a1,-1870 # 8c8 <malloc+0xee>
  1e:	4509                	li	a0,2
  20:	00000097          	auipc	ra,0x0
  24:	6d4080e7          	jalr	1748(ra) # 6f4 <fprintf>
    exit(1);
  28:	4505                	li	a0,1
  2a:	00000097          	auipc	ra,0x0
  2e:	350080e7          	jalr	848(ra) # 37a <exit>
  32:	84aa                	mv	s1,a0
  }

  if (trace(atoi(argv[1])) < 0) {
  34:	6588                	ld	a0,8(a1)
  36:	00000097          	auipc	ra,0x0
  3a:	232080e7          	jalr	562(ra) # 268 <atoi>
  3e:	00000097          	auipc	ra,0x0
  42:	3f4080e7          	jalr	1012(ra) # 432 <trace>
  46:	04054e63          	bltz	a0,a2 <main+0xa2>
  4a:	01090793          	addi	a5,s2,16
  4e:	ee040713          	addi	a4,s0,-288
  52:	ffd4869b          	addiw	a3,s1,-3
  56:	02069613          	slli	a2,a3,0x20
  5a:	01d65693          	srli	a3,a2,0x1d
  5e:	96be                	add	a3,a3,a5
  60:	10090593          	addi	a1,s2,256
    fprintf(2, "%s: strace failed\n", argv[0]);
    exit(1);
  }
  
  for(i = 2; i < argc && i < MAXARG; i++){
    nargv[i-2] = argv[i];
  64:	6390                	ld	a2,0(a5)
  66:	e310                	sd	a2,0(a4)
  for(i = 2; i < argc && i < MAXARG; i++){
  68:	00d78663          	beq	a5,a3,74 <main+0x74>
  6c:	07a1                	addi	a5,a5,8
  6e:	0721                	addi	a4,a4,8
  70:	feb79ae3          	bne	a5,a1,64 <main+0x64>
  }
  exec(nargv[0], nargv);  
  74:	ee040593          	addi	a1,s0,-288
  78:	ee043503          	ld	a0,-288(s0)
  7c:	00000097          	auipc	ra,0x0
  80:	33a080e7          	jalr	826(ra) # 3b6 <exec>
  printf("strace: exec %s fail\n", nargv[0]);
  84:	ee043583          	ld	a1,-288(s0)
  88:	00001517          	auipc	a0,0x1
  8c:	87050513          	addi	a0,a0,-1936 # 8f8 <malloc+0x11e>
  90:	00000097          	auipc	ra,0x0
  94:	692080e7          	jalr	1682(ra) # 722 <printf>
  exit(0);
  98:	4501                	li	a0,0
  9a:	00000097          	auipc	ra,0x0
  9e:	2e0080e7          	jalr	736(ra) # 37a <exit>
    fprintf(2, "%s: strace failed\n", argv[0]);
  a2:	00093603          	ld	a2,0(s2)
  a6:	00001597          	auipc	a1,0x1
  aa:	83a58593          	addi	a1,a1,-1990 # 8e0 <malloc+0x106>
  ae:	4509                	li	a0,2
  b0:	00000097          	auipc	ra,0x0
  b4:	644080e7          	jalr	1604(ra) # 6f4 <fprintf>
    exit(1);
  b8:	4505                	li	a0,1
  ba:	00000097          	auipc	ra,0x0
  be:	2c0080e7          	jalr	704(ra) # 37a <exit>

00000000000000c2 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
  c2:	1141                	addi	sp,sp,-16
  c4:	e422                	sd	s0,8(sp)
  c6:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c8:	87aa                	mv	a5,a0
  ca:	0585                	addi	a1,a1,1
  cc:	0785                	addi	a5,a5,1
  ce:	fff5c703          	lbu	a4,-1(a1)
  d2:	fee78fa3          	sb	a4,-1(a5)
  d6:	fb75                	bnez	a4,ca <strcpy+0x8>
    ;
  return os;
}
  d8:	6422                	ld	s0,8(sp)
  da:	0141                	addi	sp,sp,16
  dc:	8082                	ret

00000000000000de <strcat>:

char*
strcat(char *s, const char *t)
{
  de:	1141                	addi	sp,sp,-16
  e0:	e422                	sd	s0,8(sp)
  e2:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
  e4:	00054783          	lbu	a5,0(a0)
  e8:	c385                	beqz	a5,108 <strcat+0x2a>
  ea:	87aa                	mv	a5,a0
    s++;
  ec:	0785                	addi	a5,a5,1
  while(*s)
  ee:	0007c703          	lbu	a4,0(a5)
  f2:	ff6d                	bnez	a4,ec <strcat+0xe>
  while((*s++ = *t++))
  f4:	0585                	addi	a1,a1,1
  f6:	0785                	addi	a5,a5,1
  f8:	fff5c703          	lbu	a4,-1(a1)
  fc:	fee78fa3          	sb	a4,-1(a5)
 100:	fb75                	bnez	a4,f4 <strcat+0x16>
    ;
  return os;
}
 102:	6422                	ld	s0,8(sp)
 104:	0141                	addi	sp,sp,16
 106:	8082                	ret
  while(*s)
 108:	87aa                	mv	a5,a0
 10a:	b7ed                	j	f4 <strcat+0x16>

000000000000010c <strcmp>:


int
strcmp(const char *p, const char *q)
{
 10c:	1141                	addi	sp,sp,-16
 10e:	e422                	sd	s0,8(sp)
 110:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 112:	00054783          	lbu	a5,0(a0)
 116:	cb91                	beqz	a5,12a <strcmp+0x1e>
 118:	0005c703          	lbu	a4,0(a1)
 11c:	00f71763          	bne	a4,a5,12a <strcmp+0x1e>
    p++, q++;
 120:	0505                	addi	a0,a0,1
 122:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 124:	00054783          	lbu	a5,0(a0)
 128:	fbe5                	bnez	a5,118 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 12a:	0005c503          	lbu	a0,0(a1)
}
 12e:	40a7853b          	subw	a0,a5,a0
 132:	6422                	ld	s0,8(sp)
 134:	0141                	addi	sp,sp,16
 136:	8082                	ret

0000000000000138 <strlen>:

uint
strlen(const char *s)
{
 138:	1141                	addi	sp,sp,-16
 13a:	e422                	sd	s0,8(sp)
 13c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 13e:	00054783          	lbu	a5,0(a0)
 142:	cf91                	beqz	a5,15e <strlen+0x26>
 144:	0505                	addi	a0,a0,1
 146:	87aa                	mv	a5,a0
 148:	4685                	li	a3,1
 14a:	9e89                	subw	a3,a3,a0
 14c:	00f6853b          	addw	a0,a3,a5
 150:	0785                	addi	a5,a5,1
 152:	fff7c703          	lbu	a4,-1(a5)
 156:	fb7d                	bnez	a4,14c <strlen+0x14>
    ;
  return n;
}
 158:	6422                	ld	s0,8(sp)
 15a:	0141                	addi	sp,sp,16
 15c:	8082                	ret
  for(n = 0; s[n]; n++)
 15e:	4501                	li	a0,0
 160:	bfe5                	j	158 <strlen+0x20>

0000000000000162 <memset>:

void*
memset(void *dst, int c, uint n)
{
 162:	1141                	addi	sp,sp,-16
 164:	e422                	sd	s0,8(sp)
 166:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 168:	ca19                	beqz	a2,17e <memset+0x1c>
 16a:	87aa                	mv	a5,a0
 16c:	1602                	slli	a2,a2,0x20
 16e:	9201                	srli	a2,a2,0x20
 170:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 174:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 178:	0785                	addi	a5,a5,1
 17a:	fee79de3          	bne	a5,a4,174 <memset+0x12>
  }
  return dst;
}
 17e:	6422                	ld	s0,8(sp)
 180:	0141                	addi	sp,sp,16
 182:	8082                	ret

0000000000000184 <strchr>:

char*
strchr(const char *s, char c)
{
 184:	1141                	addi	sp,sp,-16
 186:	e422                	sd	s0,8(sp)
 188:	0800                	addi	s0,sp,16
  for(; *s; s++)
 18a:	00054783          	lbu	a5,0(a0)
 18e:	cb99                	beqz	a5,1a4 <strchr+0x20>
    if(*s == c)
 190:	00f58763          	beq	a1,a5,19e <strchr+0x1a>
  for(; *s; s++)
 194:	0505                	addi	a0,a0,1
 196:	00054783          	lbu	a5,0(a0)
 19a:	fbfd                	bnez	a5,190 <strchr+0xc>
      return (char*)s;
  return 0;
 19c:	4501                	li	a0,0
}
 19e:	6422                	ld	s0,8(sp)
 1a0:	0141                	addi	sp,sp,16
 1a2:	8082                	ret
  return 0;
 1a4:	4501                	li	a0,0
 1a6:	bfe5                	j	19e <strchr+0x1a>

00000000000001a8 <gets>:

char*
gets(char *buf, int max)
{
 1a8:	711d                	addi	sp,sp,-96
 1aa:	ec86                	sd	ra,88(sp)
 1ac:	e8a2                	sd	s0,80(sp)
 1ae:	e4a6                	sd	s1,72(sp)
 1b0:	e0ca                	sd	s2,64(sp)
 1b2:	fc4e                	sd	s3,56(sp)
 1b4:	f852                	sd	s4,48(sp)
 1b6:	f456                	sd	s5,40(sp)
 1b8:	f05a                	sd	s6,32(sp)
 1ba:	ec5e                	sd	s7,24(sp)
 1bc:	e862                	sd	s8,16(sp)
 1be:	1080                	addi	s0,sp,96
 1c0:	8baa                	mv	s7,a0
 1c2:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c4:	892a                	mv	s2,a0
 1c6:	4481                	li	s1,0
    cc = read(0, &c, 1);
 1c8:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1cc:	4b29                	li	s6,10
 1ce:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 1d0:	89a6                	mv	s3,s1
 1d2:	2485                	addiw	s1,s1,1
 1d4:	0344d763          	bge	s1,s4,202 <gets+0x5a>
    cc = read(0, &c, 1);
 1d8:	4605                	li	a2,1
 1da:	85d6                	mv	a1,s5
 1dc:	4501                	li	a0,0
 1de:	00000097          	auipc	ra,0x0
 1e2:	1b6080e7          	jalr	438(ra) # 394 <read>
    if(cc < 1)
 1e6:	00a05e63          	blez	a0,202 <gets+0x5a>
    buf[i++] = c;
 1ea:	faf44783          	lbu	a5,-81(s0)
 1ee:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1f2:	01678763          	beq	a5,s6,200 <gets+0x58>
 1f6:	0905                	addi	s2,s2,1
 1f8:	fd879ce3          	bne	a5,s8,1d0 <gets+0x28>
  for(i=0; i+1 < max; ){
 1fc:	89a6                	mv	s3,s1
 1fe:	a011                	j	202 <gets+0x5a>
 200:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 202:	99de                	add	s3,s3,s7
 204:	00098023          	sb	zero,0(s3)
  return buf;
}
 208:	855e                	mv	a0,s7
 20a:	60e6                	ld	ra,88(sp)
 20c:	6446                	ld	s0,80(sp)
 20e:	64a6                	ld	s1,72(sp)
 210:	6906                	ld	s2,64(sp)
 212:	79e2                	ld	s3,56(sp)
 214:	7a42                	ld	s4,48(sp)
 216:	7aa2                	ld	s5,40(sp)
 218:	7b02                	ld	s6,32(sp)
 21a:	6be2                	ld	s7,24(sp)
 21c:	6c42                	ld	s8,16(sp)
 21e:	6125                	addi	sp,sp,96
 220:	8082                	ret

0000000000000222 <stat>:

int
stat(const char *n, struct stat *st)
{
 222:	1101                	addi	sp,sp,-32
 224:	ec06                	sd	ra,24(sp)
 226:	e822                	sd	s0,16(sp)
 228:	e426                	sd	s1,8(sp)
 22a:	e04a                	sd	s2,0(sp)
 22c:	1000                	addi	s0,sp,32
 22e:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 230:	4581                	li	a1,0
 232:	00000097          	auipc	ra,0x0
 236:	18e080e7          	jalr	398(ra) # 3c0 <open>
  if(fd < 0)
 23a:	02054563          	bltz	a0,264 <stat+0x42>
 23e:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 240:	85ca                	mv	a1,s2
 242:	00000097          	auipc	ra,0x0
 246:	186080e7          	jalr	390(ra) # 3c8 <fstat>
 24a:	892a                	mv	s2,a0
  close(fd);
 24c:	8526                	mv	a0,s1
 24e:	00000097          	auipc	ra,0x0
 252:	158080e7          	jalr	344(ra) # 3a6 <close>
  return r;
}
 256:	854a                	mv	a0,s2
 258:	60e2                	ld	ra,24(sp)
 25a:	6442                	ld	s0,16(sp)
 25c:	64a2                	ld	s1,8(sp)
 25e:	6902                	ld	s2,0(sp)
 260:	6105                	addi	sp,sp,32
 262:	8082                	ret
    return -1;
 264:	597d                	li	s2,-1
 266:	bfc5                	j	256 <stat+0x34>

0000000000000268 <atoi>:

int
atoi(const char *s)
{
 268:	1141                	addi	sp,sp,-16
 26a:	e422                	sd	s0,8(sp)
 26c:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 26e:	00054703          	lbu	a4,0(a0)
 272:	02d00793          	li	a5,45
  int neg = 1;
 276:	4585                	li	a1,1
  if (*s == '-') {
 278:	04f70363          	beq	a4,a5,2be <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 27c:	00054703          	lbu	a4,0(a0)
 280:	fd07079b          	addiw	a5,a4,-48
 284:	0ff7f793          	zext.b	a5,a5
 288:	46a5                	li	a3,9
 28a:	02f6ed63          	bltu	a3,a5,2c4 <atoi+0x5c>
  n = 0;
 28e:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 290:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 292:	0505                	addi	a0,a0,1
 294:	0026979b          	slliw	a5,a3,0x2
 298:	9fb5                	addw	a5,a5,a3
 29a:	0017979b          	slliw	a5,a5,0x1
 29e:	9fb9                	addw	a5,a5,a4
 2a0:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 2a4:	00054703          	lbu	a4,0(a0)
 2a8:	fd07079b          	addiw	a5,a4,-48
 2ac:	0ff7f793          	zext.b	a5,a5
 2b0:	fef671e3          	bgeu	a2,a5,292 <atoi+0x2a>
  return n * neg;
}
 2b4:	02d5853b          	mulw	a0,a1,a3
 2b8:	6422                	ld	s0,8(sp)
 2ba:	0141                	addi	sp,sp,16
 2bc:	8082                	ret
    s++;
 2be:	0505                	addi	a0,a0,1
    neg = -1;
 2c0:	55fd                	li	a1,-1
 2c2:	bf6d                	j	27c <atoi+0x14>
  n = 0;
 2c4:	4681                	li	a3,0
 2c6:	b7fd                	j	2b4 <atoi+0x4c>

00000000000002c8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c8:	1141                	addi	sp,sp,-16
 2ca:	e422                	sd	s0,8(sp)
 2cc:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 2ce:	02b57463          	bgeu	a0,a1,2f6 <memmove+0x2e>
    while(n-- > 0)
 2d2:	00c05f63          	blez	a2,2f0 <memmove+0x28>
 2d6:	1602                	slli	a2,a2,0x20
 2d8:	9201                	srli	a2,a2,0x20
 2da:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 2de:	872a                	mv	a4,a0
      *dst++ = *src++;
 2e0:	0585                	addi	a1,a1,1
 2e2:	0705                	addi	a4,a4,1
 2e4:	fff5c683          	lbu	a3,-1(a1)
 2e8:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 2ec:	fee79ae3          	bne	a5,a4,2e0 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 2f0:	6422                	ld	s0,8(sp)
 2f2:	0141                	addi	sp,sp,16
 2f4:	8082                	ret
    dst += n;
 2f6:	00c50733          	add	a4,a0,a2
    src += n;
 2fa:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 2fc:	fec05ae3          	blez	a2,2f0 <memmove+0x28>
 300:	fff6079b          	addiw	a5,a2,-1
 304:	1782                	slli	a5,a5,0x20
 306:	9381                	srli	a5,a5,0x20
 308:	fff7c793          	not	a5,a5
 30c:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 30e:	15fd                	addi	a1,a1,-1
 310:	177d                	addi	a4,a4,-1
 312:	0005c683          	lbu	a3,0(a1)
 316:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 31a:	fee79ae3          	bne	a5,a4,30e <memmove+0x46>
 31e:	bfc9                	j	2f0 <memmove+0x28>

0000000000000320 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 320:	1141                	addi	sp,sp,-16
 322:	e422                	sd	s0,8(sp)
 324:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 326:	ca05                	beqz	a2,356 <memcmp+0x36>
 328:	fff6069b          	addiw	a3,a2,-1
 32c:	1682                	slli	a3,a3,0x20
 32e:	9281                	srli	a3,a3,0x20
 330:	0685                	addi	a3,a3,1
 332:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 334:	00054783          	lbu	a5,0(a0)
 338:	0005c703          	lbu	a4,0(a1)
 33c:	00e79863          	bne	a5,a4,34c <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 340:	0505                	addi	a0,a0,1
    p2++;
 342:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 344:	fed518e3          	bne	a0,a3,334 <memcmp+0x14>
  }
  return 0;
 348:	4501                	li	a0,0
 34a:	a019                	j	350 <memcmp+0x30>
      return *p1 - *p2;
 34c:	40e7853b          	subw	a0,a5,a4
}
 350:	6422                	ld	s0,8(sp)
 352:	0141                	addi	sp,sp,16
 354:	8082                	ret
  return 0;
 356:	4501                	li	a0,0
 358:	bfe5                	j	350 <memcmp+0x30>

000000000000035a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 35a:	1141                	addi	sp,sp,-16
 35c:	e406                	sd	ra,8(sp)
 35e:	e022                	sd	s0,0(sp)
 360:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 362:	00000097          	auipc	ra,0x0
 366:	f66080e7          	jalr	-154(ra) # 2c8 <memmove>
}
 36a:	60a2                	ld	ra,8(sp)
 36c:	6402                	ld	s0,0(sp)
 36e:	0141                	addi	sp,sp,16
 370:	8082                	ret

0000000000000372 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 372:	4885                	li	a7,1
 ecall
 374:	00000073          	ecall
 ret
 378:	8082                	ret

000000000000037a <exit>:
.global exit
exit:
 li a7, SYS_exit
 37a:	05d00893          	li	a7,93
 ecall
 37e:	00000073          	ecall
 ret
 382:	8082                	ret

0000000000000384 <wait>:
.global wait
wait:
 li a7, SYS_wait
 384:	488d                	li	a7,3
 ecall
 386:	00000073          	ecall
 ret
 38a:	8082                	ret

000000000000038c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 38c:	4891                	li	a7,4
 ecall
 38e:	00000073          	ecall
 ret
 392:	8082                	ret

0000000000000394 <read>:
.global read
read:
 li a7, SYS_read
 394:	4895                	li	a7,5
 ecall
 396:	00000073          	ecall
 ret
 39a:	8082                	ret

000000000000039c <write>:
.global write
write:
 li a7, SYS_write
 39c:	04000893          	li	a7,64
 ecall
 3a0:	00000073          	ecall
 ret
 3a4:	8082                	ret

00000000000003a6 <close>:
.global close
close:
 li a7, SYS_close
 3a6:	48d5                	li	a7,21
 ecall
 3a8:	00000073          	ecall
 ret
 3ac:	8082                	ret

00000000000003ae <kill>:
.global kill
kill:
 li a7, SYS_kill
 3ae:	4899                	li	a7,6
 ecall
 3b0:	00000073          	ecall
 ret
 3b4:	8082                	ret

00000000000003b6 <exec>:
.global exec
exec:
 li a7, SYS_exec
 3b6:	0dd00893          	li	a7,221
 ecall
 3ba:	00000073          	ecall
 ret
 3be:	8082                	ret

00000000000003c0 <open>:
.global open
open:
 li a7, SYS_open
 3c0:	48bd                	li	a7,15
 ecall
 3c2:	00000073          	ecall
 ret
 3c6:	8082                	ret

00000000000003c8 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 3c8:	48a1                	li	a7,8
 ecall
 3ca:	00000073          	ecall
 ret
 3ce:	8082                	ret

00000000000003d0 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 3d0:	48d1                	li	a7,20
 ecall
 3d2:	00000073          	ecall
 ret
 3d6:	8082                	ret

00000000000003d8 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 3d8:	48a5                	li	a7,9
 ecall
 3da:	00000073          	ecall
 ret
 3de:	8082                	ret

00000000000003e0 <dup>:
.global dup
dup:
 li a7, SYS_dup
 3e0:	48a9                	li	a7,10
 ecall
 3e2:	00000073          	ecall
 ret
 3e6:	8082                	ret

00000000000003e8 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 3e8:	0ac00893          	li	a7,172
 ecall
 3ec:	00000073          	ecall
 ret
 3f0:	8082                	ret

00000000000003f2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 3f2:	48b1                	li	a7,12
 ecall
 3f4:	00000073          	ecall
 ret
 3f8:	8082                	ret

00000000000003fa <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 3fa:	48b5                	li	a7,13
 ecall
 3fc:	00000073          	ecall
 ret
 400:	8082                	ret

0000000000000402 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 402:	48b9                	li	a7,14
 ecall
 404:	00000073          	ecall
 ret
 408:	8082                	ret

000000000000040a <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 40a:	48d9                	li	a7,22
 ecall
 40c:	00000073          	ecall
 ret
 410:	8082                	ret

0000000000000412 <dev>:
.global dev
dev:
 li a7, SYS_dev
 412:	48dd                	li	a7,23
 ecall
 414:	00000073          	ecall
 ret
 418:	8082                	ret

000000000000041a <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 41a:	48e1                	li	a7,24
 ecall
 41c:	00000073          	ecall
 ret
 420:	8082                	ret

0000000000000422 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 422:	48c5                	li	a7,17
 ecall
 424:	00000073          	ecall
 ret
 428:	8082                	ret

000000000000042a <remove>:
.global remove
remove:
 li a7, SYS_remove
 42a:	48c5                	li	a7,17
 ecall
 42c:	00000073          	ecall
 ret
 430:	8082                	ret

0000000000000432 <trace>:
.global trace
trace:
 li a7, SYS_trace
 432:	48c9                	li	a7,18
 ecall
 434:	00000073          	ecall
 ret
 438:	8082                	ret

000000000000043a <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 43a:	48cd                	li	a7,19
 ecall
 43c:	00000073          	ecall
 ret
 440:	8082                	ret

0000000000000442 <rename>:
.global rename
rename:
 li a7, SYS_rename
 442:	48e9                	li	a7,26
 ecall
 444:	00000073          	ecall
 ret
 448:	8082                	ret

000000000000044a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 44a:	1101                	addi	sp,sp,-32
 44c:	ec06                	sd	ra,24(sp)
 44e:	e822                	sd	s0,16(sp)
 450:	1000                	addi	s0,sp,32
 452:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 456:	4605                	li	a2,1
 458:	fef40593          	addi	a1,s0,-17
 45c:	00000097          	auipc	ra,0x0
 460:	f40080e7          	jalr	-192(ra) # 39c <write>
}
 464:	60e2                	ld	ra,24(sp)
 466:	6442                	ld	s0,16(sp)
 468:	6105                	addi	sp,sp,32
 46a:	8082                	ret

000000000000046c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 46c:	7139                	addi	sp,sp,-64
 46e:	fc06                	sd	ra,56(sp)
 470:	f822                	sd	s0,48(sp)
 472:	f426                	sd	s1,40(sp)
 474:	f04a                	sd	s2,32(sp)
 476:	ec4e                	sd	s3,24(sp)
 478:	0080                	addi	s0,sp,64
 47a:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 47c:	c299                	beqz	a3,482 <printint+0x16>
 47e:	0805c863          	bltz	a1,50e <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 482:	2581                	sext.w	a1,a1
  neg = 0;
 484:	4881                	li	a7,0
  }

  i = 0;
 486:	fc040993          	addi	s3,s0,-64
  neg = 0;
 48a:	86ce                	mv	a3,s3
  i = 0;
 48c:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 48e:	2601                	sext.w	a2,a2
 490:	00000517          	auipc	a0,0x0
 494:	4e050513          	addi	a0,a0,1248 # 970 <digits>
 498:	883a                	mv	a6,a4
 49a:	2705                	addiw	a4,a4,1
 49c:	02c5f7bb          	remuw	a5,a1,a2
 4a0:	1782                	slli	a5,a5,0x20
 4a2:	9381                	srli	a5,a5,0x20
 4a4:	97aa                	add	a5,a5,a0
 4a6:	0007c783          	lbu	a5,0(a5)
 4aa:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 4ae:	0005879b          	sext.w	a5,a1
 4b2:	02c5d5bb          	divuw	a1,a1,a2
 4b6:	0685                	addi	a3,a3,1
 4b8:	fec7f0e3          	bgeu	a5,a2,498 <printint+0x2c>
  if(neg)
 4bc:	00088c63          	beqz	a7,4d4 <printint+0x68>
    buf[i++] = '-';
 4c0:	fd070793          	addi	a5,a4,-48
 4c4:	00878733          	add	a4,a5,s0
 4c8:	02d00793          	li	a5,45
 4cc:	fef70823          	sb	a5,-16(a4)
 4d0:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 4d4:	02e05663          	blez	a4,500 <printint+0x94>
 4d8:	fc040913          	addi	s2,s0,-64
 4dc:	993a                	add	s2,s2,a4
 4de:	19fd                	addi	s3,s3,-1
 4e0:	99ba                	add	s3,s3,a4
 4e2:	377d                	addiw	a4,a4,-1
 4e4:	1702                	slli	a4,a4,0x20
 4e6:	9301                	srli	a4,a4,0x20
 4e8:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 4ec:	fff94583          	lbu	a1,-1(s2)
 4f0:	8526                	mv	a0,s1
 4f2:	00000097          	auipc	ra,0x0
 4f6:	f58080e7          	jalr	-168(ra) # 44a <putc>
  while(--i >= 0)
 4fa:	197d                	addi	s2,s2,-1
 4fc:	ff3918e3          	bne	s2,s3,4ec <printint+0x80>
}
 500:	70e2                	ld	ra,56(sp)
 502:	7442                	ld	s0,48(sp)
 504:	74a2                	ld	s1,40(sp)
 506:	7902                	ld	s2,32(sp)
 508:	69e2                	ld	s3,24(sp)
 50a:	6121                	addi	sp,sp,64
 50c:	8082                	ret
    x = -xx;
 50e:	40b005bb          	negw	a1,a1
    neg = 1;
 512:	4885                	li	a7,1
    x = -xx;
 514:	bf8d                	j	486 <printint+0x1a>

0000000000000516 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 516:	7119                	addi	sp,sp,-128
 518:	fc86                	sd	ra,120(sp)
 51a:	f8a2                	sd	s0,112(sp)
 51c:	f4a6                	sd	s1,104(sp)
 51e:	f0ca                	sd	s2,96(sp)
 520:	ecce                	sd	s3,88(sp)
 522:	e8d2                	sd	s4,80(sp)
 524:	e4d6                	sd	s5,72(sp)
 526:	e0da                	sd	s6,64(sp)
 528:	fc5e                	sd	s7,56(sp)
 52a:	f862                	sd	s8,48(sp)
 52c:	f466                	sd	s9,40(sp)
 52e:	f06a                	sd	s10,32(sp)
 530:	ec6e                	sd	s11,24(sp)
 532:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 534:	0005c903          	lbu	s2,0(a1)
 538:	18090f63          	beqz	s2,6d6 <vprintf+0x1c0>
 53c:	8aaa                	mv	s5,a0
 53e:	8b32                	mv	s6,a2
 540:	00158493          	addi	s1,a1,1
  state = 0;
 544:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 546:	02500a13          	li	s4,37
 54a:	4c55                	li	s8,21
 54c:	00000c97          	auipc	s9,0x0
 550:	3ccc8c93          	addi	s9,s9,972 # 918 <malloc+0x13e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 554:	02800d93          	li	s11,40
  putc(fd, 'x');
 558:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 55a:	00000b97          	auipc	s7,0x0
 55e:	416b8b93          	addi	s7,s7,1046 # 970 <digits>
 562:	a839                	j	580 <vprintf+0x6a>
        putc(fd, c);
 564:	85ca                	mv	a1,s2
 566:	8556                	mv	a0,s5
 568:	00000097          	auipc	ra,0x0
 56c:	ee2080e7          	jalr	-286(ra) # 44a <putc>
 570:	a019                	j	576 <vprintf+0x60>
    } else if(state == '%'){
 572:	01498d63          	beq	s3,s4,58c <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 576:	0485                	addi	s1,s1,1
 578:	fff4c903          	lbu	s2,-1(s1)
 57c:	14090d63          	beqz	s2,6d6 <vprintf+0x1c0>
    if(state == 0){
 580:	fe0999e3          	bnez	s3,572 <vprintf+0x5c>
      if(c == '%'){
 584:	ff4910e3          	bne	s2,s4,564 <vprintf+0x4e>
        state = '%';
 588:	89d2                	mv	s3,s4
 58a:	b7f5                	j	576 <vprintf+0x60>
      if(c == 'd'){
 58c:	11490c63          	beq	s2,s4,6a4 <vprintf+0x18e>
 590:	f9d9079b          	addiw	a5,s2,-99
 594:	0ff7f793          	zext.b	a5,a5
 598:	10fc6e63          	bltu	s8,a5,6b4 <vprintf+0x19e>
 59c:	f9d9079b          	addiw	a5,s2,-99
 5a0:	0ff7f713          	zext.b	a4,a5
 5a4:	10ec6863          	bltu	s8,a4,6b4 <vprintf+0x19e>
 5a8:	00271793          	slli	a5,a4,0x2
 5ac:	97e6                	add	a5,a5,s9
 5ae:	439c                	lw	a5,0(a5)
 5b0:	97e6                	add	a5,a5,s9
 5b2:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 5b4:	008b0913          	addi	s2,s6,8
 5b8:	4685                	li	a3,1
 5ba:	4629                	li	a2,10
 5bc:	000b2583          	lw	a1,0(s6)
 5c0:	8556                	mv	a0,s5
 5c2:	00000097          	auipc	ra,0x0
 5c6:	eaa080e7          	jalr	-342(ra) # 46c <printint>
 5ca:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5cc:	4981                	li	s3,0
 5ce:	b765                	j	576 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 5d0:	008b0913          	addi	s2,s6,8
 5d4:	4681                	li	a3,0
 5d6:	4629                	li	a2,10
 5d8:	000b2583          	lw	a1,0(s6)
 5dc:	8556                	mv	a0,s5
 5de:	00000097          	auipc	ra,0x0
 5e2:	e8e080e7          	jalr	-370(ra) # 46c <printint>
 5e6:	8b4a                	mv	s6,s2
      state = 0;
 5e8:	4981                	li	s3,0
 5ea:	b771                	j	576 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 5ec:	008b0913          	addi	s2,s6,8
 5f0:	4681                	li	a3,0
 5f2:	866a                	mv	a2,s10
 5f4:	000b2583          	lw	a1,0(s6)
 5f8:	8556                	mv	a0,s5
 5fa:	00000097          	auipc	ra,0x0
 5fe:	e72080e7          	jalr	-398(ra) # 46c <printint>
 602:	8b4a                	mv	s6,s2
      state = 0;
 604:	4981                	li	s3,0
 606:	bf85                	j	576 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 608:	008b0793          	addi	a5,s6,8
 60c:	f8f43423          	sd	a5,-120(s0)
 610:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 614:	03000593          	li	a1,48
 618:	8556                	mv	a0,s5
 61a:	00000097          	auipc	ra,0x0
 61e:	e30080e7          	jalr	-464(ra) # 44a <putc>
  putc(fd, 'x');
 622:	07800593          	li	a1,120
 626:	8556                	mv	a0,s5
 628:	00000097          	auipc	ra,0x0
 62c:	e22080e7          	jalr	-478(ra) # 44a <putc>
 630:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 632:	03c9d793          	srli	a5,s3,0x3c
 636:	97de                	add	a5,a5,s7
 638:	0007c583          	lbu	a1,0(a5)
 63c:	8556                	mv	a0,s5
 63e:	00000097          	auipc	ra,0x0
 642:	e0c080e7          	jalr	-500(ra) # 44a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 646:	0992                	slli	s3,s3,0x4
 648:	397d                	addiw	s2,s2,-1
 64a:	fe0914e3          	bnez	s2,632 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 64e:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 652:	4981                	li	s3,0
 654:	b70d                	j	576 <vprintf+0x60>
        s = va_arg(ap, char*);
 656:	008b0913          	addi	s2,s6,8
 65a:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 65e:	02098163          	beqz	s3,680 <vprintf+0x16a>
        while(*s != 0){
 662:	0009c583          	lbu	a1,0(s3)
 666:	c5ad                	beqz	a1,6d0 <vprintf+0x1ba>
          putc(fd, *s);
 668:	8556                	mv	a0,s5
 66a:	00000097          	auipc	ra,0x0
 66e:	de0080e7          	jalr	-544(ra) # 44a <putc>
          s++;
 672:	0985                	addi	s3,s3,1
        while(*s != 0){
 674:	0009c583          	lbu	a1,0(s3)
 678:	f9e5                	bnez	a1,668 <vprintf+0x152>
        s = va_arg(ap, char*);
 67a:	8b4a                	mv	s6,s2
      state = 0;
 67c:	4981                	li	s3,0
 67e:	bde5                	j	576 <vprintf+0x60>
          s = "(null)";
 680:	00000997          	auipc	s3,0x0
 684:	29098993          	addi	s3,s3,656 # 910 <malloc+0x136>
        while(*s != 0){
 688:	85ee                	mv	a1,s11
 68a:	bff9                	j	668 <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 68c:	008b0913          	addi	s2,s6,8
 690:	000b4583          	lbu	a1,0(s6)
 694:	8556                	mv	a0,s5
 696:	00000097          	auipc	ra,0x0
 69a:	db4080e7          	jalr	-588(ra) # 44a <putc>
 69e:	8b4a                	mv	s6,s2
      state = 0;
 6a0:	4981                	li	s3,0
 6a2:	bdd1                	j	576 <vprintf+0x60>
        putc(fd, c);
 6a4:	85d2                	mv	a1,s4
 6a6:	8556                	mv	a0,s5
 6a8:	00000097          	auipc	ra,0x0
 6ac:	da2080e7          	jalr	-606(ra) # 44a <putc>
      state = 0;
 6b0:	4981                	li	s3,0
 6b2:	b5d1                	j	576 <vprintf+0x60>
        putc(fd, '%');
 6b4:	85d2                	mv	a1,s4
 6b6:	8556                	mv	a0,s5
 6b8:	00000097          	auipc	ra,0x0
 6bc:	d92080e7          	jalr	-622(ra) # 44a <putc>
        putc(fd, c);
 6c0:	85ca                	mv	a1,s2
 6c2:	8556                	mv	a0,s5
 6c4:	00000097          	auipc	ra,0x0
 6c8:	d86080e7          	jalr	-634(ra) # 44a <putc>
      state = 0;
 6cc:	4981                	li	s3,0
 6ce:	b565                	j	576 <vprintf+0x60>
        s = va_arg(ap, char*);
 6d0:	8b4a                	mv	s6,s2
      state = 0;
 6d2:	4981                	li	s3,0
 6d4:	b54d                	j	576 <vprintf+0x60>
    }
  }
}
 6d6:	70e6                	ld	ra,120(sp)
 6d8:	7446                	ld	s0,112(sp)
 6da:	74a6                	ld	s1,104(sp)
 6dc:	7906                	ld	s2,96(sp)
 6de:	69e6                	ld	s3,88(sp)
 6e0:	6a46                	ld	s4,80(sp)
 6e2:	6aa6                	ld	s5,72(sp)
 6e4:	6b06                	ld	s6,64(sp)
 6e6:	7be2                	ld	s7,56(sp)
 6e8:	7c42                	ld	s8,48(sp)
 6ea:	7ca2                	ld	s9,40(sp)
 6ec:	7d02                	ld	s10,32(sp)
 6ee:	6de2                	ld	s11,24(sp)
 6f0:	6109                	addi	sp,sp,128
 6f2:	8082                	ret

00000000000006f4 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 6f4:	715d                	addi	sp,sp,-80
 6f6:	ec06                	sd	ra,24(sp)
 6f8:	e822                	sd	s0,16(sp)
 6fa:	1000                	addi	s0,sp,32
 6fc:	e010                	sd	a2,0(s0)
 6fe:	e414                	sd	a3,8(s0)
 700:	e818                	sd	a4,16(s0)
 702:	ec1c                	sd	a5,24(s0)
 704:	03043023          	sd	a6,32(s0)
 708:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 70c:	8622                	mv	a2,s0
 70e:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 712:	00000097          	auipc	ra,0x0
 716:	e04080e7          	jalr	-508(ra) # 516 <vprintf>
}
 71a:	60e2                	ld	ra,24(sp)
 71c:	6442                	ld	s0,16(sp)
 71e:	6161                	addi	sp,sp,80
 720:	8082                	ret

0000000000000722 <printf>:

void
printf(const char *fmt, ...)
{
 722:	711d                	addi	sp,sp,-96
 724:	ec06                	sd	ra,24(sp)
 726:	e822                	sd	s0,16(sp)
 728:	1000                	addi	s0,sp,32
 72a:	e40c                	sd	a1,8(s0)
 72c:	e810                	sd	a2,16(s0)
 72e:	ec14                	sd	a3,24(s0)
 730:	f018                	sd	a4,32(s0)
 732:	f41c                	sd	a5,40(s0)
 734:	03043823          	sd	a6,48(s0)
 738:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 73c:	00840613          	addi	a2,s0,8
 740:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 744:	85aa                	mv	a1,a0
 746:	4505                	li	a0,1
 748:	00000097          	auipc	ra,0x0
 74c:	dce080e7          	jalr	-562(ra) # 516 <vprintf>
}
 750:	60e2                	ld	ra,24(sp)
 752:	6442                	ld	s0,16(sp)
 754:	6125                	addi	sp,sp,96
 756:	8082                	ret

0000000000000758 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 758:	1141                	addi	sp,sp,-16
 75a:	e422                	sd	s0,8(sp)
 75c:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 75e:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 762:	00000797          	auipc	a5,0x0
 766:	2267b783          	ld	a5,550(a5) # 988 <freep>
 76a:	a02d                	j	794 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 76c:	4618                	lw	a4,8(a2)
 76e:	9f2d                	addw	a4,a4,a1
 770:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 774:	6398                	ld	a4,0(a5)
 776:	6310                	ld	a2,0(a4)
 778:	a83d                	j	7b6 <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 77a:	ff852703          	lw	a4,-8(a0)
 77e:	9f31                	addw	a4,a4,a2
 780:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 782:	ff053683          	ld	a3,-16(a0)
 786:	a091                	j	7ca <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 788:	6398                	ld	a4,0(a5)
 78a:	00e7e463          	bltu	a5,a4,792 <free+0x3a>
 78e:	00e6ea63          	bltu	a3,a4,7a2 <free+0x4a>
{
 792:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 794:	fed7fae3          	bgeu	a5,a3,788 <free+0x30>
 798:	6398                	ld	a4,0(a5)
 79a:	00e6e463          	bltu	a3,a4,7a2 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79e:	fee7eae3          	bltu	a5,a4,792 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 7a2:	ff852583          	lw	a1,-8(a0)
 7a6:	6390                	ld	a2,0(a5)
 7a8:	02059813          	slli	a6,a1,0x20
 7ac:	01c85713          	srli	a4,a6,0x1c
 7b0:	9736                	add	a4,a4,a3
 7b2:	fae60de3          	beq	a2,a4,76c <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 7b6:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 7ba:	4790                	lw	a2,8(a5)
 7bc:	02061593          	slli	a1,a2,0x20
 7c0:	01c5d713          	srli	a4,a1,0x1c
 7c4:	973e                	add	a4,a4,a5
 7c6:	fae68ae3          	beq	a3,a4,77a <free+0x22>
    p->s.ptr = bp->s.ptr;
 7ca:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 7cc:	00000717          	auipc	a4,0x0
 7d0:	1af73e23          	sd	a5,444(a4) # 988 <freep>
}
 7d4:	6422                	ld	s0,8(sp)
 7d6:	0141                	addi	sp,sp,16
 7d8:	8082                	ret

00000000000007da <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7da:	7139                	addi	sp,sp,-64
 7dc:	fc06                	sd	ra,56(sp)
 7de:	f822                	sd	s0,48(sp)
 7e0:	f426                	sd	s1,40(sp)
 7e2:	f04a                	sd	s2,32(sp)
 7e4:	ec4e                	sd	s3,24(sp)
 7e6:	e852                	sd	s4,16(sp)
 7e8:	e456                	sd	s5,8(sp)
 7ea:	e05a                	sd	s6,0(sp)
 7ec:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ee:	02051493          	slli	s1,a0,0x20
 7f2:	9081                	srli	s1,s1,0x20
 7f4:	04bd                	addi	s1,s1,15
 7f6:	8091                	srli	s1,s1,0x4
 7f8:	00148a1b          	addiw	s4,s1,1
 7fc:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 7fe:	00000517          	auipc	a0,0x0
 802:	18a53503          	ld	a0,394(a0) # 988 <freep>
 806:	c515                	beqz	a0,832 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 808:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 80a:	4798                	lw	a4,8(a5)
 80c:	04977163          	bgeu	a4,s1,84e <malloc+0x74>
 810:	89d2                	mv	s3,s4
 812:	000a071b          	sext.w	a4,s4
 816:	6685                	lui	a3,0x1
 818:	00d77363          	bgeu	a4,a3,81e <malloc+0x44>
 81c:	6985                	lui	s3,0x1
 81e:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 822:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 826:	00000917          	auipc	s2,0x0
 82a:	16290913          	addi	s2,s2,354 # 988 <freep>
  if(p == (char*)-1)
 82e:	5afd                	li	s5,-1
 830:	a8a5                	j	8a8 <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 832:	00000797          	auipc	a5,0x0
 836:	15678793          	addi	a5,a5,342 # 988 <freep>
 83a:	00000717          	auipc	a4,0x0
 83e:	15670713          	addi	a4,a4,342 # 990 <base>
 842:	e398                	sd	a4,0(a5)
 844:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 846:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84a:	87ba                	mv	a5,a4
 84c:	b7d1                	j	810 <malloc+0x36>
      if(p->s.size == nunits)
 84e:	02e48c63          	beq	s1,a4,886 <malloc+0xac>
        p->s.size -= nunits;
 852:	4147073b          	subw	a4,a4,s4
 856:	c798                	sw	a4,8(a5)
        p += p->s.size;
 858:	02071693          	slli	a3,a4,0x20
 85c:	01c6d713          	srli	a4,a3,0x1c
 860:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 862:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 866:	00000717          	auipc	a4,0x0
 86a:	12a73123          	sd	a0,290(a4) # 988 <freep>
      return (void*)(p + 1);
 86e:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 872:	70e2                	ld	ra,56(sp)
 874:	7442                	ld	s0,48(sp)
 876:	74a2                	ld	s1,40(sp)
 878:	7902                	ld	s2,32(sp)
 87a:	69e2                	ld	s3,24(sp)
 87c:	6a42                	ld	s4,16(sp)
 87e:	6aa2                	ld	s5,8(sp)
 880:	6b02                	ld	s6,0(sp)
 882:	6121                	addi	sp,sp,64
 884:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 886:	6398                	ld	a4,0(a5)
 888:	e118                	sd	a4,0(a0)
 88a:	bff1                	j	866 <malloc+0x8c>
  hp->s.size = nu;
 88c:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 890:	0541                	addi	a0,a0,16
 892:	00000097          	auipc	ra,0x0
 896:	ec6080e7          	jalr	-314(ra) # 758 <free>
  return freep;
 89a:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 89e:	d971                	beqz	a0,872 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a0:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 8a2:	4798                	lw	a4,8(a5)
 8a4:	fa9775e3          	bgeu	a4,s1,84e <malloc+0x74>
    if(p == freep)
 8a8:	00093703          	ld	a4,0(s2)
 8ac:	853e                	mv	a0,a5
 8ae:	fef719e3          	bne	a4,a5,8a0 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 8b2:	854e                	mv	a0,s3
 8b4:	00000097          	auipc	ra,0x0
 8b8:	b3e080e7          	jalr	-1218(ra) # 3f2 <sbrk>
  if(p == (char*)-1)
 8bc:	fd5518e3          	bne	a0,s5,88c <malloc+0xb2>
        return 0;
 8c0:	4501                	li	a0,0
 8c2:	bf45                	j	872 <malloc+0x98>
