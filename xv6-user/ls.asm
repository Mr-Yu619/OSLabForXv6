
xv6-user/_ls:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "kernel/include/stat.h"
#include "xv6-user/user.h"

char*
fmtname(char *name)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
   e:	892a                	mv	s2,a0
  static char buf[STAT_MAX_NAME+1];
  int len = strlen(name);
  10:	00000097          	auipc	ra,0x0
  14:	24c080e7          	jalr	588(ra) # 25c <strlen>
  18:	0005049b          	sext.w	s1,a0

  // Return blank-padded name.
  if(len >= STAT_MAX_NAME)
  1c:	47fd                	li	a5,31
  1e:	0097da63          	bge	a5,s1,32 <fmtname+0x32>
    return name;
  memmove(buf, name, len);
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  buf[STAT_MAX_NAME] = '\0';
  return buf;
}
  22:	854a                	mv	a0,s2
  24:	70a2                	ld	ra,40(sp)
  26:	7402                	ld	s0,32(sp)
  28:	64e2                	ld	s1,24(sp)
  2a:	6942                	ld	s2,16(sp)
  2c:	69a2                	ld	s3,8(sp)
  2e:	6145                	addi	sp,sp,48
  30:	8082                	ret
  memmove(buf, name, len);
  32:	00001997          	auipc	s3,0x1
  36:	a9698993          	addi	s3,s3,-1386 # ac8 <buf.0>
  3a:	8626                	mv	a2,s1
  3c:	85ca                	mv	a1,s2
  3e:	854e                	mv	a0,s3
  40:	00000097          	auipc	ra,0x0
  44:	3ac080e7          	jalr	940(ra) # 3ec <memmove>
  memset(buf + len, ' ', STAT_MAX_NAME - len);
  48:	02000613          	li	a2,32
  4c:	9e05                	subw	a2,a2,s1
  4e:	02000593          	li	a1,32
  52:	00998533          	add	a0,s3,s1
  56:	00000097          	auipc	ra,0x0
  5a:	230080e7          	jalr	560(ra) # 286 <memset>
  buf[STAT_MAX_NAME] = '\0';
  5e:	02098023          	sb	zero,32(s3)
  return buf;
  62:	894e                	mv	s2,s3
  64:	bf7d                	j	22 <fmtname+0x22>

0000000000000066 <ls>:

void
ls(char *path)
{
  66:	7119                	addi	sp,sp,-128
  68:	fc86                	sd	ra,120(sp)
  6a:	f8a2                	sd	s0,112(sp)
  6c:	f4a6                	sd	s1,104(sp)
  6e:	f0ca                	sd	s2,96(sp)
  70:	ecce                	sd	s3,88(sp)
  72:	e8d2                	sd	s4,80(sp)
  74:	0100                	addi	s0,sp,128
  76:	892a                	mv	s2,a0
  int fd;
  struct stat st;
  char *types[] = {
  78:	f8043023          	sd	zero,-128(s0)
  7c:	00001797          	auipc	a5,0x1
  80:	96c78793          	addi	a5,a5,-1684 # 9e8 <malloc+0xea>
  84:	f8f43423          	sd	a5,-120(s0)
  88:	00001797          	auipc	a5,0x1
  8c:	96878793          	addi	a5,a5,-1688 # 9f0 <malloc+0xf2>
  90:	f8f43823          	sd	a5,-112(s0)
    [T_DIR]   "DIR ",
    [T_FILE]  "FILE",
  };

  if((fd = open(path, 0)) < 0){
  94:	4581                	li	a1,0
  96:	00000097          	auipc	ra,0x0
  9a:	44e080e7          	jalr	1102(ra) # 4e4 <open>
  9e:	02054863          	bltz	a0,ce <ls+0x68>
  a2:	84aa                	mv	s1,a0
    fprintf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  a4:	f9840593          	addi	a1,s0,-104
  a8:	00000097          	auipc	ra,0x0
  ac:	444080e7          	jalr	1092(ra) # 4ec <fstat>
  b0:	02054a63          	bltz	a0,e4 <ls+0x7e>
    fprintf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  if (st.type == T_DIR){
  b4:	fc041703          	lh	a4,-64(s0)
  b8:	4785                	li	a5,1
  ba:	08f71f63          	bne	a4,a5,158 <ls+0xf2>
    while(readdir(fd, &st) == 1){
  be:	f9840913          	addi	s2,s0,-104
  c2:	4985                	li	s3,1
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
  c4:	00001a17          	auipc	s4,0x1
  c8:	964a0a13          	addi	s4,s4,-1692 # a28 <malloc+0x12a>
  cc:	a08d                	j	12e <ls+0xc8>
    fprintf(2, "ls: cannot open %s\n", path);
  ce:	864a                	mv	a2,s2
  d0:	00001597          	auipc	a1,0x1
  d4:	92858593          	addi	a1,a1,-1752 # 9f8 <malloc+0xfa>
  d8:	4509                	li	a0,2
  da:	00000097          	auipc	ra,0x0
  de:	73e080e7          	jalr	1854(ra) # 818 <fprintf>
    return;
  e2:	a09d                	j	148 <ls+0xe2>
    fprintf(2, "ls: cannot stat %s\n", path);
  e4:	864a                	mv	a2,s2
  e6:	00001597          	auipc	a1,0x1
  ea:	92a58593          	addi	a1,a1,-1750 # a10 <malloc+0x112>
  ee:	4509                	li	a0,2
  f0:	00000097          	auipc	ra,0x0
  f4:	728080e7          	jalr	1832(ra) # 818 <fprintf>
    close(fd);
  f8:	8526                	mv	a0,s1
  fa:	00000097          	auipc	ra,0x0
  fe:	3d0080e7          	jalr	976(ra) # 4ca <close>
    return;
 102:	a099                	j	148 <ls+0xe2>
      printf("%s %s\t%d\n", fmtname(st.name), types[st.type], st.size);
 104:	854a                	mv	a0,s2
 106:	00000097          	auipc	ra,0x0
 10a:	efa080e7          	jalr	-262(ra) # 0 <fmtname>
 10e:	85aa                	mv	a1,a0
 110:	fc041783          	lh	a5,-64(s0)
 114:	078e                	slli	a5,a5,0x3
 116:	fd078793          	addi	a5,a5,-48
 11a:	97a2                	add	a5,a5,s0
 11c:	fc843683          	ld	a3,-56(s0)
 120:	fb07b603          	ld	a2,-80(a5)
 124:	8552                	mv	a0,s4
 126:	00000097          	auipc	ra,0x0
 12a:	720080e7          	jalr	1824(ra) # 846 <printf>
    while(readdir(fd, &st) == 1){
 12e:	85ca                	mv	a1,s2
 130:	8526                	mv	a0,s1
 132:	00000097          	auipc	ra,0x0
 136:	40c080e7          	jalr	1036(ra) # 53e <readdir>
 13a:	fd3505e3          	beq	a0,s3,104 <ls+0x9e>
    }
  } else {
    printf("%s %s\t%l\n", fmtname(st.name), types[st.type], st.size);
  }
  close(fd);
 13e:	8526                	mv	a0,s1
 140:	00000097          	auipc	ra,0x0
 144:	38a080e7          	jalr	906(ra) # 4ca <close>
}
 148:	70e6                	ld	ra,120(sp)
 14a:	7446                	ld	s0,112(sp)
 14c:	74a6                	ld	s1,104(sp)
 14e:	7906                	ld	s2,96(sp)
 150:	69e6                	ld	s3,88(sp)
 152:	6a46                	ld	s4,80(sp)
 154:	6109                	addi	sp,sp,128
 156:	8082                	ret
    printf("%s %s\t%l\n", fmtname(st.name), types[st.type], st.size);
 158:	f9840513          	addi	a0,s0,-104
 15c:	00000097          	auipc	ra,0x0
 160:	ea4080e7          	jalr	-348(ra) # 0 <fmtname>
 164:	85aa                	mv	a1,a0
 166:	fc041783          	lh	a5,-64(s0)
 16a:	078e                	slli	a5,a5,0x3
 16c:	fd078793          	addi	a5,a5,-48
 170:	97a2                	add	a5,a5,s0
 172:	fc843683          	ld	a3,-56(s0)
 176:	fb07b603          	ld	a2,-80(a5)
 17a:	00001517          	auipc	a0,0x1
 17e:	8be50513          	addi	a0,a0,-1858 # a38 <malloc+0x13a>
 182:	00000097          	auipc	ra,0x0
 186:	6c4080e7          	jalr	1732(ra) # 846 <printf>
 18a:	bf55                	j	13e <ls+0xd8>

000000000000018c <main>:

int
main(int argc, char *argv[])
{
 18c:	1101                	addi	sp,sp,-32
 18e:	ec06                	sd	ra,24(sp)
 190:	e822                	sd	s0,16(sp)
 192:	e426                	sd	s1,8(sp)
 194:	e04a                	sd	s2,0(sp)
 196:	1000                	addi	s0,sp,32
  int i;

  if(argc < 2){
 198:	4785                	li	a5,1
 19a:	02a7d963          	bge	a5,a0,1cc <main+0x40>
 19e:	00858493          	addi	s1,a1,8
 1a2:	ffe5091b          	addiw	s2,a0,-2
 1a6:	02091793          	slli	a5,s2,0x20
 1aa:	01d7d913          	srli	s2,a5,0x1d
 1ae:	05c1                	addi	a1,a1,16
 1b0:	992e                	add	s2,s2,a1
    ls(".");
    exit(0);
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
 1b2:	6088                	ld	a0,0(s1)
 1b4:	00000097          	auipc	ra,0x0
 1b8:	eb2080e7          	jalr	-334(ra) # 66 <ls>
  for(i=1; i<argc; i++)
 1bc:	04a1                	addi	s1,s1,8
 1be:	ff249ae3          	bne	s1,s2,1b2 <main+0x26>
  exit(0);
 1c2:	4501                	li	a0,0
 1c4:	00000097          	auipc	ra,0x0
 1c8:	2da080e7          	jalr	730(ra) # 49e <exit>
    ls(".");
 1cc:	00001517          	auipc	a0,0x1
 1d0:	87c50513          	addi	a0,a0,-1924 # a48 <malloc+0x14a>
 1d4:	00000097          	auipc	ra,0x0
 1d8:	e92080e7          	jalr	-366(ra) # 66 <ls>
    exit(0);
 1dc:	4501                	li	a0,0
 1de:	00000097          	auipc	ra,0x0
 1e2:	2c0080e7          	jalr	704(ra) # 49e <exit>

00000000000001e6 <strcpy>:
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"

char*
strcpy(char *s, const char *t)
{
 1e6:	1141                	addi	sp,sp,-16
 1e8:	e422                	sd	s0,8(sp)
 1ea:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1ec:	87aa                	mv	a5,a0
 1ee:	0585                	addi	a1,a1,1
 1f0:	0785                	addi	a5,a5,1
 1f2:	fff5c703          	lbu	a4,-1(a1)
 1f6:	fee78fa3          	sb	a4,-1(a5)
 1fa:	fb75                	bnez	a4,1ee <strcpy+0x8>
    ;
  return os;
}
 1fc:	6422                	ld	s0,8(sp)
 1fe:	0141                	addi	sp,sp,16
 200:	8082                	ret

0000000000000202 <strcat>:

char*
strcat(char *s, const char *t)
{
 202:	1141                	addi	sp,sp,-16
 204:	e422                	sd	s0,8(sp)
 206:	0800                	addi	s0,sp,16
  char *os = s;
  while(*s)
 208:	00054783          	lbu	a5,0(a0)
 20c:	c385                	beqz	a5,22c <strcat+0x2a>
 20e:	87aa                	mv	a5,a0
    s++;
 210:	0785                	addi	a5,a5,1
  while(*s)
 212:	0007c703          	lbu	a4,0(a5)
 216:	ff6d                	bnez	a4,210 <strcat+0xe>
  while((*s++ = *t++))
 218:	0585                	addi	a1,a1,1
 21a:	0785                	addi	a5,a5,1
 21c:	fff5c703          	lbu	a4,-1(a1)
 220:	fee78fa3          	sb	a4,-1(a5)
 224:	fb75                	bnez	a4,218 <strcat+0x16>
    ;
  return os;
}
 226:	6422                	ld	s0,8(sp)
 228:	0141                	addi	sp,sp,16
 22a:	8082                	ret
  while(*s)
 22c:	87aa                	mv	a5,a0
 22e:	b7ed                	j	218 <strcat+0x16>

0000000000000230 <strcmp>:


int
strcmp(const char *p, const char *q)
{
 230:	1141                	addi	sp,sp,-16
 232:	e422                	sd	s0,8(sp)
 234:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 236:	00054783          	lbu	a5,0(a0)
 23a:	cb91                	beqz	a5,24e <strcmp+0x1e>
 23c:	0005c703          	lbu	a4,0(a1)
 240:	00f71763          	bne	a4,a5,24e <strcmp+0x1e>
    p++, q++;
 244:	0505                	addi	a0,a0,1
 246:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 248:	00054783          	lbu	a5,0(a0)
 24c:	fbe5                	bnez	a5,23c <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 24e:	0005c503          	lbu	a0,0(a1)
}
 252:	40a7853b          	subw	a0,a5,a0
 256:	6422                	ld	s0,8(sp)
 258:	0141                	addi	sp,sp,16
 25a:	8082                	ret

000000000000025c <strlen>:

uint
strlen(const char *s)
{
 25c:	1141                	addi	sp,sp,-16
 25e:	e422                	sd	s0,8(sp)
 260:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 262:	00054783          	lbu	a5,0(a0)
 266:	cf91                	beqz	a5,282 <strlen+0x26>
 268:	0505                	addi	a0,a0,1
 26a:	87aa                	mv	a5,a0
 26c:	4685                	li	a3,1
 26e:	9e89                	subw	a3,a3,a0
 270:	00f6853b          	addw	a0,a3,a5
 274:	0785                	addi	a5,a5,1
 276:	fff7c703          	lbu	a4,-1(a5)
 27a:	fb7d                	bnez	a4,270 <strlen+0x14>
    ;
  return n;
}
 27c:	6422                	ld	s0,8(sp)
 27e:	0141                	addi	sp,sp,16
 280:	8082                	ret
  for(n = 0; s[n]; n++)
 282:	4501                	li	a0,0
 284:	bfe5                	j	27c <strlen+0x20>

0000000000000286 <memset>:

void*
memset(void *dst, int c, uint n)
{
 286:	1141                	addi	sp,sp,-16
 288:	e422                	sd	s0,8(sp)
 28a:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 28c:	ca19                	beqz	a2,2a2 <memset+0x1c>
 28e:	87aa                	mv	a5,a0
 290:	1602                	slli	a2,a2,0x20
 292:	9201                	srli	a2,a2,0x20
 294:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 298:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 29c:	0785                	addi	a5,a5,1
 29e:	fee79de3          	bne	a5,a4,298 <memset+0x12>
  }
  return dst;
}
 2a2:	6422                	ld	s0,8(sp)
 2a4:	0141                	addi	sp,sp,16
 2a6:	8082                	ret

00000000000002a8 <strchr>:

char*
strchr(const char *s, char c)
{
 2a8:	1141                	addi	sp,sp,-16
 2aa:	e422                	sd	s0,8(sp)
 2ac:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2ae:	00054783          	lbu	a5,0(a0)
 2b2:	cb99                	beqz	a5,2c8 <strchr+0x20>
    if(*s == c)
 2b4:	00f58763          	beq	a1,a5,2c2 <strchr+0x1a>
  for(; *s; s++)
 2b8:	0505                	addi	a0,a0,1
 2ba:	00054783          	lbu	a5,0(a0)
 2be:	fbfd                	bnez	a5,2b4 <strchr+0xc>
      return (char*)s;
  return 0;
 2c0:	4501                	li	a0,0
}
 2c2:	6422                	ld	s0,8(sp)
 2c4:	0141                	addi	sp,sp,16
 2c6:	8082                	ret
  return 0;
 2c8:	4501                	li	a0,0
 2ca:	bfe5                	j	2c2 <strchr+0x1a>

00000000000002cc <gets>:

char*
gets(char *buf, int max)
{
 2cc:	711d                	addi	sp,sp,-96
 2ce:	ec86                	sd	ra,88(sp)
 2d0:	e8a2                	sd	s0,80(sp)
 2d2:	e4a6                	sd	s1,72(sp)
 2d4:	e0ca                	sd	s2,64(sp)
 2d6:	fc4e                	sd	s3,56(sp)
 2d8:	f852                	sd	s4,48(sp)
 2da:	f456                	sd	s5,40(sp)
 2dc:	f05a                	sd	s6,32(sp)
 2de:	ec5e                	sd	s7,24(sp)
 2e0:	e862                	sd	s8,16(sp)
 2e2:	1080                	addi	s0,sp,96
 2e4:	8baa                	mv	s7,a0
 2e6:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e8:	892a                	mv	s2,a0
 2ea:	4481                	li	s1,0
    cc = read(0, &c, 1);
 2ec:	faf40a93          	addi	s5,s0,-81
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2f0:	4b29                	li	s6,10
 2f2:	4c35                	li	s8,13
  for(i=0; i+1 < max; ){
 2f4:	89a6                	mv	s3,s1
 2f6:	2485                	addiw	s1,s1,1
 2f8:	0344d763          	bge	s1,s4,326 <gets+0x5a>
    cc = read(0, &c, 1);
 2fc:	4605                	li	a2,1
 2fe:	85d6                	mv	a1,s5
 300:	4501                	li	a0,0
 302:	00000097          	auipc	ra,0x0
 306:	1b6080e7          	jalr	438(ra) # 4b8 <read>
    if(cc < 1)
 30a:	00a05e63          	blez	a0,326 <gets+0x5a>
    buf[i++] = c;
 30e:	faf44783          	lbu	a5,-81(s0)
 312:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 316:	01678763          	beq	a5,s6,324 <gets+0x58>
 31a:	0905                	addi	s2,s2,1
 31c:	fd879ce3          	bne	a5,s8,2f4 <gets+0x28>
  for(i=0; i+1 < max; ){
 320:	89a6                	mv	s3,s1
 322:	a011                	j	326 <gets+0x5a>
 324:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 326:	99de                	add	s3,s3,s7
 328:	00098023          	sb	zero,0(s3)
  return buf;
}
 32c:	855e                	mv	a0,s7
 32e:	60e6                	ld	ra,88(sp)
 330:	6446                	ld	s0,80(sp)
 332:	64a6                	ld	s1,72(sp)
 334:	6906                	ld	s2,64(sp)
 336:	79e2                	ld	s3,56(sp)
 338:	7a42                	ld	s4,48(sp)
 33a:	7aa2                	ld	s5,40(sp)
 33c:	7b02                	ld	s6,32(sp)
 33e:	6be2                	ld	s7,24(sp)
 340:	6c42                	ld	s8,16(sp)
 342:	6125                	addi	sp,sp,96
 344:	8082                	ret

0000000000000346 <stat>:

int
stat(const char *n, struct stat *st)
{
 346:	1101                	addi	sp,sp,-32
 348:	ec06                	sd	ra,24(sp)
 34a:	e822                	sd	s0,16(sp)
 34c:	e426                	sd	s1,8(sp)
 34e:	e04a                	sd	s2,0(sp)
 350:	1000                	addi	s0,sp,32
 352:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 354:	4581                	li	a1,0
 356:	00000097          	auipc	ra,0x0
 35a:	18e080e7          	jalr	398(ra) # 4e4 <open>
  if(fd < 0)
 35e:	02054563          	bltz	a0,388 <stat+0x42>
 362:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 364:	85ca                	mv	a1,s2
 366:	00000097          	auipc	ra,0x0
 36a:	186080e7          	jalr	390(ra) # 4ec <fstat>
 36e:	892a                	mv	s2,a0
  close(fd);
 370:	8526                	mv	a0,s1
 372:	00000097          	auipc	ra,0x0
 376:	158080e7          	jalr	344(ra) # 4ca <close>
  return r;
}
 37a:	854a                	mv	a0,s2
 37c:	60e2                	ld	ra,24(sp)
 37e:	6442                	ld	s0,16(sp)
 380:	64a2                	ld	s1,8(sp)
 382:	6902                	ld	s2,0(sp)
 384:	6105                	addi	sp,sp,32
 386:	8082                	ret
    return -1;
 388:	597d                	li	s2,-1
 38a:	bfc5                	j	37a <stat+0x34>

000000000000038c <atoi>:

int
atoi(const char *s)
{
 38c:	1141                	addi	sp,sp,-16
 38e:	e422                	sd	s0,8(sp)
 390:	0800                	addi	s0,sp,16
  int n;
  int neg = 1;
  if (*s == '-') {
 392:	00054703          	lbu	a4,0(a0)
 396:	02d00793          	li	a5,45
  int neg = 1;
 39a:	4585                	li	a1,1
  if (*s == '-') {
 39c:	04f70363          	beq	a4,a5,3e2 <atoi+0x56>
    s++;
    neg = -1;
  }
  n = 0;
  while('0' <= *s && *s <= '9')
 3a0:	00054703          	lbu	a4,0(a0)
 3a4:	fd07079b          	addiw	a5,a4,-48
 3a8:	0ff7f793          	zext.b	a5,a5
 3ac:	46a5                	li	a3,9
 3ae:	02f6ed63          	bltu	a3,a5,3e8 <atoi+0x5c>
  n = 0;
 3b2:	4681                	li	a3,0
  while('0' <= *s && *s <= '9')
 3b4:	4625                	li	a2,9
    n = n*10 + *s++ - '0';
 3b6:	0505                	addi	a0,a0,1
 3b8:	0026979b          	slliw	a5,a3,0x2
 3bc:	9fb5                	addw	a5,a5,a3
 3be:	0017979b          	slliw	a5,a5,0x1
 3c2:	9fb9                	addw	a5,a5,a4
 3c4:	fd07869b          	addiw	a3,a5,-48
  while('0' <= *s && *s <= '9')
 3c8:	00054703          	lbu	a4,0(a0)
 3cc:	fd07079b          	addiw	a5,a4,-48
 3d0:	0ff7f793          	zext.b	a5,a5
 3d4:	fef671e3          	bgeu	a2,a5,3b6 <atoi+0x2a>
  return n * neg;
}
 3d8:	02d5853b          	mulw	a0,a1,a3
 3dc:	6422                	ld	s0,8(sp)
 3de:	0141                	addi	sp,sp,16
 3e0:	8082                	ret
    s++;
 3e2:	0505                	addi	a0,a0,1
    neg = -1;
 3e4:	55fd                	li	a1,-1
 3e6:	bf6d                	j	3a0 <atoi+0x14>
  n = 0;
 3e8:	4681                	li	a3,0
 3ea:	b7fd                	j	3d8 <atoi+0x4c>

00000000000003ec <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3ec:	1141                	addi	sp,sp,-16
 3ee:	e422                	sd	s0,8(sp)
 3f0:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 3f2:	02b57463          	bgeu	a0,a1,41a <memmove+0x2e>
    while(n-- > 0)
 3f6:	00c05f63          	blez	a2,414 <memmove+0x28>
 3fa:	1602                	slli	a2,a2,0x20
 3fc:	9201                	srli	a2,a2,0x20
 3fe:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 402:	872a                	mv	a4,a0
      *dst++ = *src++;
 404:	0585                	addi	a1,a1,1
 406:	0705                	addi	a4,a4,1
 408:	fff5c683          	lbu	a3,-1(a1)
 40c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 410:	fee79ae3          	bne	a5,a4,404 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 414:	6422                	ld	s0,8(sp)
 416:	0141                	addi	sp,sp,16
 418:	8082                	ret
    dst += n;
 41a:	00c50733          	add	a4,a0,a2
    src += n;
 41e:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 420:	fec05ae3          	blez	a2,414 <memmove+0x28>
 424:	fff6079b          	addiw	a5,a2,-1
 428:	1782                	slli	a5,a5,0x20
 42a:	9381                	srli	a5,a5,0x20
 42c:	fff7c793          	not	a5,a5
 430:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 432:	15fd                	addi	a1,a1,-1
 434:	177d                	addi	a4,a4,-1
 436:	0005c683          	lbu	a3,0(a1)
 43a:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 43e:	fee79ae3          	bne	a5,a4,432 <memmove+0x46>
 442:	bfc9                	j	414 <memmove+0x28>

0000000000000444 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 444:	1141                	addi	sp,sp,-16
 446:	e422                	sd	s0,8(sp)
 448:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 44a:	ca05                	beqz	a2,47a <memcmp+0x36>
 44c:	fff6069b          	addiw	a3,a2,-1
 450:	1682                	slli	a3,a3,0x20
 452:	9281                	srli	a3,a3,0x20
 454:	0685                	addi	a3,a3,1
 456:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 458:	00054783          	lbu	a5,0(a0)
 45c:	0005c703          	lbu	a4,0(a1)
 460:	00e79863          	bne	a5,a4,470 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 464:	0505                	addi	a0,a0,1
    p2++;
 466:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 468:	fed518e3          	bne	a0,a3,458 <memcmp+0x14>
  }
  return 0;
 46c:	4501                	li	a0,0
 46e:	a019                	j	474 <memcmp+0x30>
      return *p1 - *p2;
 470:	40e7853b          	subw	a0,a5,a4
}
 474:	6422                	ld	s0,8(sp)
 476:	0141                	addi	sp,sp,16
 478:	8082                	ret
  return 0;
 47a:	4501                	li	a0,0
 47c:	bfe5                	j	474 <memcmp+0x30>

000000000000047e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 47e:	1141                	addi	sp,sp,-16
 480:	e406                	sd	ra,8(sp)
 482:	e022                	sd	s0,0(sp)
 484:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 486:	00000097          	auipc	ra,0x0
 48a:	f66080e7          	jalr	-154(ra) # 3ec <memmove>
}
 48e:	60a2                	ld	ra,8(sp)
 490:	6402                	ld	s0,0(sp)
 492:	0141                	addi	sp,sp,16
 494:	8082                	ret

0000000000000496 <fork>:
# generated by usys.pl - do not edit
#include "kernel/include/sysnum.h"
.global fork
fork:
 li a7, SYS_fork
 496:	4885                	li	a7,1
 ecall
 498:	00000073          	ecall
 ret
 49c:	8082                	ret

000000000000049e <exit>:
.global exit
exit:
 li a7, SYS_exit
 49e:	05d00893          	li	a7,93
 ecall
 4a2:	00000073          	ecall
 ret
 4a6:	8082                	ret

00000000000004a8 <wait>:
.global wait
wait:
 li a7, SYS_wait
 4a8:	488d                	li	a7,3
 ecall
 4aa:	00000073          	ecall
 ret
 4ae:	8082                	ret

00000000000004b0 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 4b0:	4891                	li	a7,4
 ecall
 4b2:	00000073          	ecall
 ret
 4b6:	8082                	ret

00000000000004b8 <read>:
.global read
read:
 li a7, SYS_read
 4b8:	4895                	li	a7,5
 ecall
 4ba:	00000073          	ecall
 ret
 4be:	8082                	ret

00000000000004c0 <write>:
.global write
write:
 li a7, SYS_write
 4c0:	04000893          	li	a7,64
 ecall
 4c4:	00000073          	ecall
 ret
 4c8:	8082                	ret

00000000000004ca <close>:
.global close
close:
 li a7, SYS_close
 4ca:	48d5                	li	a7,21
 ecall
 4cc:	00000073          	ecall
 ret
 4d0:	8082                	ret

00000000000004d2 <kill>:
.global kill
kill:
 li a7, SYS_kill
 4d2:	4899                	li	a7,6
 ecall
 4d4:	00000073          	ecall
 ret
 4d8:	8082                	ret

00000000000004da <exec>:
.global exec
exec:
 li a7, SYS_exec
 4da:	0dd00893          	li	a7,221
 ecall
 4de:	00000073          	ecall
 ret
 4e2:	8082                	ret

00000000000004e4 <open>:
.global open
open:
 li a7, SYS_open
 4e4:	48bd                	li	a7,15
 ecall
 4e6:	00000073          	ecall
 ret
 4ea:	8082                	ret

00000000000004ec <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 4ec:	48a1                	li	a7,8
 ecall
 4ee:	00000073          	ecall
 ret
 4f2:	8082                	ret

00000000000004f4 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 4f4:	48d1                	li	a7,20
 ecall
 4f6:	00000073          	ecall
 ret
 4fa:	8082                	ret

00000000000004fc <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 4fc:	48a5                	li	a7,9
 ecall
 4fe:	00000073          	ecall
 ret
 502:	8082                	ret

0000000000000504 <dup>:
.global dup
dup:
 li a7, SYS_dup
 504:	48a9                	li	a7,10
 ecall
 506:	00000073          	ecall
 ret
 50a:	8082                	ret

000000000000050c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 50c:	0ac00893          	li	a7,172
 ecall
 510:	00000073          	ecall
 ret
 514:	8082                	ret

0000000000000516 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 516:	48b1                	li	a7,12
 ecall
 518:	00000073          	ecall
 ret
 51c:	8082                	ret

000000000000051e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 51e:	48b5                	li	a7,13
 ecall
 520:	00000073          	ecall
 ret
 524:	8082                	ret

0000000000000526 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 526:	48b9                	li	a7,14
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <test_proc>:
.global test_proc
test_proc:
 li a7, SYS_test_proc
 52e:	48d9                	li	a7,22
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <dev>:
.global dev
dev:
 li a7, SYS_dev
 536:	48dd                	li	a7,23
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <readdir>:
.global readdir
readdir:
 li a7, SYS_readdir
 53e:	48e1                	li	a7,24
 ecall
 540:	00000073          	ecall
 ret
 544:	8082                	ret

0000000000000546 <getcwd>:
.global getcwd
getcwd:
 li a7, SYS_getcwd
 546:	48c5                	li	a7,17
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <remove>:
.global remove
remove:
 li a7, SYS_remove
 54e:	48c5                	li	a7,17
 ecall
 550:	00000073          	ecall
 ret
 554:	8082                	ret

0000000000000556 <trace>:
.global trace
trace:
 li a7, SYS_trace
 556:	48c9                	li	a7,18
 ecall
 558:	00000073          	ecall
 ret
 55c:	8082                	ret

000000000000055e <sysinfo>:
.global sysinfo
sysinfo:
 li a7, SYS_sysinfo
 55e:	48cd                	li	a7,19
 ecall
 560:	00000073          	ecall
 ret
 564:	8082                	ret

0000000000000566 <rename>:
.global rename
rename:
 li a7, SYS_rename
 566:	48e9                	li	a7,26
 ecall
 568:	00000073          	ecall
 ret
 56c:	8082                	ret

000000000000056e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 56e:	1101                	addi	sp,sp,-32
 570:	ec06                	sd	ra,24(sp)
 572:	e822                	sd	s0,16(sp)
 574:	1000                	addi	s0,sp,32
 576:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 57a:	4605                	li	a2,1
 57c:	fef40593          	addi	a1,s0,-17
 580:	00000097          	auipc	ra,0x0
 584:	f40080e7          	jalr	-192(ra) # 4c0 <write>
}
 588:	60e2                	ld	ra,24(sp)
 58a:	6442                	ld	s0,16(sp)
 58c:	6105                	addi	sp,sp,32
 58e:	8082                	ret

0000000000000590 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 590:	7139                	addi	sp,sp,-64
 592:	fc06                	sd	ra,56(sp)
 594:	f822                	sd	s0,48(sp)
 596:	f426                	sd	s1,40(sp)
 598:	f04a                	sd	s2,32(sp)
 59a:	ec4e                	sd	s3,24(sp)
 59c:	0080                	addi	s0,sp,64
 59e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5a0:	c299                	beqz	a3,5a6 <printint+0x16>
 5a2:	0805c863          	bltz	a1,632 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5a6:	2581                	sext.w	a1,a1
  neg = 0;
 5a8:	4881                	li	a7,0
  }

  i = 0;
 5aa:	fc040993          	addi	s3,s0,-64
  neg = 0;
 5ae:	86ce                	mv	a3,s3
  i = 0;
 5b0:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 5b2:	2601                	sext.w	a2,a2
 5b4:	00000517          	auipc	a0,0x0
 5b8:	4fc50513          	addi	a0,a0,1276 # ab0 <digits>
 5bc:	883a                	mv	a6,a4
 5be:	2705                	addiw	a4,a4,1
 5c0:	02c5f7bb          	remuw	a5,a1,a2
 5c4:	1782                	slli	a5,a5,0x20
 5c6:	9381                	srli	a5,a5,0x20
 5c8:	97aa                	add	a5,a5,a0
 5ca:	0007c783          	lbu	a5,0(a5)
 5ce:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 5d2:	0005879b          	sext.w	a5,a1
 5d6:	02c5d5bb          	divuw	a1,a1,a2
 5da:	0685                	addi	a3,a3,1
 5dc:	fec7f0e3          	bgeu	a5,a2,5bc <printint+0x2c>
  if(neg)
 5e0:	00088c63          	beqz	a7,5f8 <printint+0x68>
    buf[i++] = '-';
 5e4:	fd070793          	addi	a5,a4,-48
 5e8:	00878733          	add	a4,a5,s0
 5ec:	02d00793          	li	a5,45
 5f0:	fef70823          	sb	a5,-16(a4)
 5f4:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 5f8:	02e05663          	blez	a4,624 <printint+0x94>
 5fc:	fc040913          	addi	s2,s0,-64
 600:	993a                	add	s2,s2,a4
 602:	19fd                	addi	s3,s3,-1
 604:	99ba                	add	s3,s3,a4
 606:	377d                	addiw	a4,a4,-1
 608:	1702                	slli	a4,a4,0x20
 60a:	9301                	srli	a4,a4,0x20
 60c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 610:	fff94583          	lbu	a1,-1(s2)
 614:	8526                	mv	a0,s1
 616:	00000097          	auipc	ra,0x0
 61a:	f58080e7          	jalr	-168(ra) # 56e <putc>
  while(--i >= 0)
 61e:	197d                	addi	s2,s2,-1
 620:	ff3918e3          	bne	s2,s3,610 <printint+0x80>
}
 624:	70e2                	ld	ra,56(sp)
 626:	7442                	ld	s0,48(sp)
 628:	74a2                	ld	s1,40(sp)
 62a:	7902                	ld	s2,32(sp)
 62c:	69e2                	ld	s3,24(sp)
 62e:	6121                	addi	sp,sp,64
 630:	8082                	ret
    x = -xx;
 632:	40b005bb          	negw	a1,a1
    neg = 1;
 636:	4885                	li	a7,1
    x = -xx;
 638:	bf8d                	j	5aa <printint+0x1a>

000000000000063a <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 63a:	7119                	addi	sp,sp,-128
 63c:	fc86                	sd	ra,120(sp)
 63e:	f8a2                	sd	s0,112(sp)
 640:	f4a6                	sd	s1,104(sp)
 642:	f0ca                	sd	s2,96(sp)
 644:	ecce                	sd	s3,88(sp)
 646:	e8d2                	sd	s4,80(sp)
 648:	e4d6                	sd	s5,72(sp)
 64a:	e0da                	sd	s6,64(sp)
 64c:	fc5e                	sd	s7,56(sp)
 64e:	f862                	sd	s8,48(sp)
 650:	f466                	sd	s9,40(sp)
 652:	f06a                	sd	s10,32(sp)
 654:	ec6e                	sd	s11,24(sp)
 656:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 658:	0005c903          	lbu	s2,0(a1)
 65c:	18090f63          	beqz	s2,7fa <vprintf+0x1c0>
 660:	8aaa                	mv	s5,a0
 662:	8b32                	mv	s6,a2
 664:	00158493          	addi	s1,a1,1
  state = 0;
 668:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 66a:	02500a13          	li	s4,37
 66e:	4c55                	li	s8,21
 670:	00000c97          	auipc	s9,0x0
 674:	3e8c8c93          	addi	s9,s9,1000 # a58 <malloc+0x15a>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
        s = va_arg(ap, char*);
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 678:	02800d93          	li	s11,40
  putc(fd, 'x');
 67c:	4d41                	li	s10,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 67e:	00000b97          	auipc	s7,0x0
 682:	432b8b93          	addi	s7,s7,1074 # ab0 <digits>
 686:	a839                	j	6a4 <vprintf+0x6a>
        putc(fd, c);
 688:	85ca                	mv	a1,s2
 68a:	8556                	mv	a0,s5
 68c:	00000097          	auipc	ra,0x0
 690:	ee2080e7          	jalr	-286(ra) # 56e <putc>
 694:	a019                	j	69a <vprintf+0x60>
    } else if(state == '%'){
 696:	01498d63          	beq	s3,s4,6b0 <vprintf+0x76>
  for(i = 0; fmt[i]; i++){
 69a:	0485                	addi	s1,s1,1
 69c:	fff4c903          	lbu	s2,-1(s1)
 6a0:	14090d63          	beqz	s2,7fa <vprintf+0x1c0>
    if(state == 0){
 6a4:	fe0999e3          	bnez	s3,696 <vprintf+0x5c>
      if(c == '%'){
 6a8:	ff4910e3          	bne	s2,s4,688 <vprintf+0x4e>
        state = '%';
 6ac:	89d2                	mv	s3,s4
 6ae:	b7f5                	j	69a <vprintf+0x60>
      if(c == 'd'){
 6b0:	11490c63          	beq	s2,s4,7c8 <vprintf+0x18e>
 6b4:	f9d9079b          	addiw	a5,s2,-99
 6b8:	0ff7f793          	zext.b	a5,a5
 6bc:	10fc6e63          	bltu	s8,a5,7d8 <vprintf+0x19e>
 6c0:	f9d9079b          	addiw	a5,s2,-99
 6c4:	0ff7f713          	zext.b	a4,a5
 6c8:	10ec6863          	bltu	s8,a4,7d8 <vprintf+0x19e>
 6cc:	00271793          	slli	a5,a4,0x2
 6d0:	97e6                	add	a5,a5,s9
 6d2:	439c                	lw	a5,0(a5)
 6d4:	97e6                	add	a5,a5,s9
 6d6:	8782                	jr	a5
        printint(fd, va_arg(ap, int), 10, 1);
 6d8:	008b0913          	addi	s2,s6,8
 6dc:	4685                	li	a3,1
 6de:	4629                	li	a2,10
 6e0:	000b2583          	lw	a1,0(s6)
 6e4:	8556                	mv	a0,s5
 6e6:	00000097          	auipc	ra,0x0
 6ea:	eaa080e7          	jalr	-342(ra) # 590 <printint>
 6ee:	8b4a                	mv	s6,s2
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6f0:	4981                	li	s3,0
 6f2:	b765                	j	69a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 6f4:	008b0913          	addi	s2,s6,8
 6f8:	4681                	li	a3,0
 6fa:	4629                	li	a2,10
 6fc:	000b2583          	lw	a1,0(s6)
 700:	8556                	mv	a0,s5
 702:	00000097          	auipc	ra,0x0
 706:	e8e080e7          	jalr	-370(ra) # 590 <printint>
 70a:	8b4a                	mv	s6,s2
      state = 0;
 70c:	4981                	li	s3,0
 70e:	b771                	j	69a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 710:	008b0913          	addi	s2,s6,8
 714:	4681                	li	a3,0
 716:	866a                	mv	a2,s10
 718:	000b2583          	lw	a1,0(s6)
 71c:	8556                	mv	a0,s5
 71e:	00000097          	auipc	ra,0x0
 722:	e72080e7          	jalr	-398(ra) # 590 <printint>
 726:	8b4a                	mv	s6,s2
      state = 0;
 728:	4981                	li	s3,0
 72a:	bf85                	j	69a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 72c:	008b0793          	addi	a5,s6,8
 730:	f8f43423          	sd	a5,-120(s0)
 734:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 738:	03000593          	li	a1,48
 73c:	8556                	mv	a0,s5
 73e:	00000097          	auipc	ra,0x0
 742:	e30080e7          	jalr	-464(ra) # 56e <putc>
  putc(fd, 'x');
 746:	07800593          	li	a1,120
 74a:	8556                	mv	a0,s5
 74c:	00000097          	auipc	ra,0x0
 750:	e22080e7          	jalr	-478(ra) # 56e <putc>
 754:	896a                	mv	s2,s10
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 756:	03c9d793          	srli	a5,s3,0x3c
 75a:	97de                	add	a5,a5,s7
 75c:	0007c583          	lbu	a1,0(a5)
 760:	8556                	mv	a0,s5
 762:	00000097          	auipc	ra,0x0
 766:	e0c080e7          	jalr	-500(ra) # 56e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 76a:	0992                	slli	s3,s3,0x4
 76c:	397d                	addiw	s2,s2,-1
 76e:	fe0914e3          	bnez	s2,756 <vprintf+0x11c>
        printptr(fd, va_arg(ap, uint64));
 772:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 776:	4981                	li	s3,0
 778:	b70d                	j	69a <vprintf+0x60>
        s = va_arg(ap, char*);
 77a:	008b0913          	addi	s2,s6,8
 77e:	000b3983          	ld	s3,0(s6)
        if(s == 0)
 782:	02098163          	beqz	s3,7a4 <vprintf+0x16a>
        while(*s != 0){
 786:	0009c583          	lbu	a1,0(s3)
 78a:	c5ad                	beqz	a1,7f4 <vprintf+0x1ba>
          putc(fd, *s);
 78c:	8556                	mv	a0,s5
 78e:	00000097          	auipc	ra,0x0
 792:	de0080e7          	jalr	-544(ra) # 56e <putc>
          s++;
 796:	0985                	addi	s3,s3,1
        while(*s != 0){
 798:	0009c583          	lbu	a1,0(s3)
 79c:	f9e5                	bnez	a1,78c <vprintf+0x152>
        s = va_arg(ap, char*);
 79e:	8b4a                	mv	s6,s2
      state = 0;
 7a0:	4981                	li	s3,0
 7a2:	bde5                	j	69a <vprintf+0x60>
          s = "(null)";
 7a4:	00000997          	auipc	s3,0x0
 7a8:	2ac98993          	addi	s3,s3,684 # a50 <malloc+0x152>
        while(*s != 0){
 7ac:	85ee                	mv	a1,s11
 7ae:	bff9                	j	78c <vprintf+0x152>
        putc(fd, va_arg(ap, uint));
 7b0:	008b0913          	addi	s2,s6,8
 7b4:	000b4583          	lbu	a1,0(s6)
 7b8:	8556                	mv	a0,s5
 7ba:	00000097          	auipc	ra,0x0
 7be:	db4080e7          	jalr	-588(ra) # 56e <putc>
 7c2:	8b4a                	mv	s6,s2
      state = 0;
 7c4:	4981                	li	s3,0
 7c6:	bdd1                	j	69a <vprintf+0x60>
        putc(fd, c);
 7c8:	85d2                	mv	a1,s4
 7ca:	8556                	mv	a0,s5
 7cc:	00000097          	auipc	ra,0x0
 7d0:	da2080e7          	jalr	-606(ra) # 56e <putc>
      state = 0;
 7d4:	4981                	li	s3,0
 7d6:	b5d1                	j	69a <vprintf+0x60>
        putc(fd, '%');
 7d8:	85d2                	mv	a1,s4
 7da:	8556                	mv	a0,s5
 7dc:	00000097          	auipc	ra,0x0
 7e0:	d92080e7          	jalr	-622(ra) # 56e <putc>
        putc(fd, c);
 7e4:	85ca                	mv	a1,s2
 7e6:	8556                	mv	a0,s5
 7e8:	00000097          	auipc	ra,0x0
 7ec:	d86080e7          	jalr	-634(ra) # 56e <putc>
      state = 0;
 7f0:	4981                	li	s3,0
 7f2:	b565                	j	69a <vprintf+0x60>
        s = va_arg(ap, char*);
 7f4:	8b4a                	mv	s6,s2
      state = 0;
 7f6:	4981                	li	s3,0
 7f8:	b54d                	j	69a <vprintf+0x60>
    }
  }
}
 7fa:	70e6                	ld	ra,120(sp)
 7fc:	7446                	ld	s0,112(sp)
 7fe:	74a6                	ld	s1,104(sp)
 800:	7906                	ld	s2,96(sp)
 802:	69e6                	ld	s3,88(sp)
 804:	6a46                	ld	s4,80(sp)
 806:	6aa6                	ld	s5,72(sp)
 808:	6b06                	ld	s6,64(sp)
 80a:	7be2                	ld	s7,56(sp)
 80c:	7c42                	ld	s8,48(sp)
 80e:	7ca2                	ld	s9,40(sp)
 810:	7d02                	ld	s10,32(sp)
 812:	6de2                	ld	s11,24(sp)
 814:	6109                	addi	sp,sp,128
 816:	8082                	ret

0000000000000818 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 818:	715d                	addi	sp,sp,-80
 81a:	ec06                	sd	ra,24(sp)
 81c:	e822                	sd	s0,16(sp)
 81e:	1000                	addi	s0,sp,32
 820:	e010                	sd	a2,0(s0)
 822:	e414                	sd	a3,8(s0)
 824:	e818                	sd	a4,16(s0)
 826:	ec1c                	sd	a5,24(s0)
 828:	03043023          	sd	a6,32(s0)
 82c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 830:	8622                	mv	a2,s0
 832:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 836:	00000097          	auipc	ra,0x0
 83a:	e04080e7          	jalr	-508(ra) # 63a <vprintf>
}
 83e:	60e2                	ld	ra,24(sp)
 840:	6442                	ld	s0,16(sp)
 842:	6161                	addi	sp,sp,80
 844:	8082                	ret

0000000000000846 <printf>:

void
printf(const char *fmt, ...)
{
 846:	711d                	addi	sp,sp,-96
 848:	ec06                	sd	ra,24(sp)
 84a:	e822                	sd	s0,16(sp)
 84c:	1000                	addi	s0,sp,32
 84e:	e40c                	sd	a1,8(s0)
 850:	e810                	sd	a2,16(s0)
 852:	ec14                	sd	a3,24(s0)
 854:	f018                	sd	a4,32(s0)
 856:	f41c                	sd	a5,40(s0)
 858:	03043823          	sd	a6,48(s0)
 85c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 860:	00840613          	addi	a2,s0,8
 864:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 868:	85aa                	mv	a1,a0
 86a:	4505                	li	a0,1
 86c:	00000097          	auipc	ra,0x0
 870:	dce080e7          	jalr	-562(ra) # 63a <vprintf>
}
 874:	60e2                	ld	ra,24(sp)
 876:	6442                	ld	s0,16(sp)
 878:	6125                	addi	sp,sp,96
 87a:	8082                	ret

000000000000087c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 87c:	1141                	addi	sp,sp,-16
 87e:	e422                	sd	s0,8(sp)
 880:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 882:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 886:	00000797          	auipc	a5,0x0
 88a:	26a7b783          	ld	a5,618(a5) # af0 <freep>
 88e:	a02d                	j	8b8 <free+0x3c>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 890:	4618                	lw	a4,8(a2)
 892:	9f2d                	addw	a4,a4,a1
 894:	fee52c23          	sw	a4,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 898:	6398                	ld	a4,0(a5)
 89a:	6310                	ld	a2,0(a4)
 89c:	a83d                	j	8da <free+0x5e>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 89e:	ff852703          	lw	a4,-8(a0)
 8a2:	9f31                	addw	a4,a4,a2
 8a4:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
 8a6:	ff053683          	ld	a3,-16(a0)
 8aa:	a091                	j	8ee <free+0x72>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ac:	6398                	ld	a4,0(a5)
 8ae:	00e7e463          	bltu	a5,a4,8b6 <free+0x3a>
 8b2:	00e6ea63          	bltu	a3,a4,8c6 <free+0x4a>
{
 8b6:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b8:	fed7fae3          	bgeu	a5,a3,8ac <free+0x30>
 8bc:	6398                	ld	a4,0(a5)
 8be:	00e6e463          	bltu	a3,a4,8c6 <free+0x4a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c2:	fee7eae3          	bltu	a5,a4,8b6 <free+0x3a>
  if(bp + bp->s.size == p->s.ptr){
 8c6:	ff852583          	lw	a1,-8(a0)
 8ca:	6390                	ld	a2,0(a5)
 8cc:	02059813          	slli	a6,a1,0x20
 8d0:	01c85713          	srli	a4,a6,0x1c
 8d4:	9736                	add	a4,a4,a3
 8d6:	fae60de3          	beq	a2,a4,890 <free+0x14>
    bp->s.ptr = p->s.ptr->s.ptr;
 8da:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 8de:	4790                	lw	a2,8(a5)
 8e0:	02061593          	slli	a1,a2,0x20
 8e4:	01c5d713          	srli	a4,a1,0x1c
 8e8:	973e                	add	a4,a4,a5
 8ea:	fae68ae3          	beq	a3,a4,89e <free+0x22>
    p->s.ptr = bp->s.ptr;
 8ee:	e394                	sd	a3,0(a5)
  } else
    p->s.ptr = bp;
  freep = p;
 8f0:	00000717          	auipc	a4,0x0
 8f4:	20f73023          	sd	a5,512(a4) # af0 <freep>
}
 8f8:	6422                	ld	s0,8(sp)
 8fa:	0141                	addi	sp,sp,16
 8fc:	8082                	ret

00000000000008fe <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8fe:	7139                	addi	sp,sp,-64
 900:	fc06                	sd	ra,56(sp)
 902:	f822                	sd	s0,48(sp)
 904:	f426                	sd	s1,40(sp)
 906:	f04a                	sd	s2,32(sp)
 908:	ec4e                	sd	s3,24(sp)
 90a:	e852                	sd	s4,16(sp)
 90c:	e456                	sd	s5,8(sp)
 90e:	e05a                	sd	s6,0(sp)
 910:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 912:	02051493          	slli	s1,a0,0x20
 916:	9081                	srli	s1,s1,0x20
 918:	04bd                	addi	s1,s1,15
 91a:	8091                	srli	s1,s1,0x4
 91c:	00148a1b          	addiw	s4,s1,1
 920:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 922:	00000517          	auipc	a0,0x0
 926:	1ce53503          	ld	a0,462(a0) # af0 <freep>
 92a:	c515                	beqz	a0,956 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92c:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 92e:	4798                	lw	a4,8(a5)
 930:	04977163          	bgeu	a4,s1,972 <malloc+0x74>
 934:	89d2                	mv	s3,s4
 936:	000a071b          	sext.w	a4,s4
 93a:	6685                	lui	a3,0x1
 93c:	00d77363          	bgeu	a4,a3,942 <malloc+0x44>
 940:	6985                	lui	s3,0x1
 942:	00098b1b          	sext.w	s6,s3
  p = sbrk(nu * sizeof(Header));
 946:	0049999b          	slliw	s3,s3,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 94a:	00000917          	auipc	s2,0x0
 94e:	1a690913          	addi	s2,s2,422 # af0 <freep>
  if(p == (char*)-1)
 952:	5afd                	li	s5,-1
 954:	a8a5                	j	9cc <malloc+0xce>
    base.s.ptr = freep = prevp = &base;
 956:	00000797          	auipc	a5,0x0
 95a:	19a78793          	addi	a5,a5,410 # af0 <freep>
 95e:	00000717          	auipc	a4,0x0
 962:	19a70713          	addi	a4,a4,410 # af8 <base>
 966:	e398                	sd	a4,0(a5)
 968:	e798                	sd	a4,8(a5)
    base.s.size = 0;
 96a:	0007a823          	sw	zero,16(a5)
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 96e:	87ba                	mv	a5,a4
 970:	b7d1                	j	934 <malloc+0x36>
      if(p->s.size == nunits)
 972:	02e48c63          	beq	s1,a4,9aa <malloc+0xac>
        p->s.size -= nunits;
 976:	4147073b          	subw	a4,a4,s4
 97a:	c798                	sw	a4,8(a5)
        p += p->s.size;
 97c:	02071693          	slli	a3,a4,0x20
 980:	01c6d713          	srli	a4,a3,0x1c
 984:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 986:	0147a423          	sw	s4,8(a5)
      freep = prevp;
 98a:	00000717          	auipc	a4,0x0
 98e:	16a73323          	sd	a0,358(a4) # af0 <freep>
      return (void*)(p + 1);
 992:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 996:	70e2                	ld	ra,56(sp)
 998:	7442                	ld	s0,48(sp)
 99a:	74a2                	ld	s1,40(sp)
 99c:	7902                	ld	s2,32(sp)
 99e:	69e2                	ld	s3,24(sp)
 9a0:	6a42                	ld	s4,16(sp)
 9a2:	6aa2                	ld	s5,8(sp)
 9a4:	6b02                	ld	s6,0(sp)
 9a6:	6121                	addi	sp,sp,64
 9a8:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 9aa:	6398                	ld	a4,0(a5)
 9ac:	e118                	sd	a4,0(a0)
 9ae:	bff1                	j	98a <malloc+0x8c>
  hp->s.size = nu;
 9b0:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 9b4:	0541                	addi	a0,a0,16
 9b6:	00000097          	auipc	ra,0x0
 9ba:	ec6080e7          	jalr	-314(ra) # 87c <free>
  return freep;
 9be:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 9c2:	d971                	beqz	a0,996 <malloc+0x98>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c4:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9c6:	4798                	lw	a4,8(a5)
 9c8:	fa9775e3          	bgeu	a4,s1,972 <malloc+0x74>
    if(p == freep)
 9cc:	00093703          	ld	a4,0(s2)
 9d0:	853e                	mv	a0,a5
 9d2:	fef719e3          	bne	a4,a5,9c4 <malloc+0xc6>
  p = sbrk(nu * sizeof(Header));
 9d6:	854e                	mv	a0,s3
 9d8:	00000097          	auipc	ra,0x0
 9dc:	b3e080e7          	jalr	-1218(ra) # 516 <sbrk>
  if(p == (char*)-1)
 9e0:	fd5518e3          	bne	a0,s5,9b0 <malloc+0xb2>
        return 0;
 9e4:	4501                	li	a0,0
 9e6:	bf45                	j	996 <malloc+0x98>
