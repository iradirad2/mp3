
user/_zombie:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(void)
{
       0:	1141                	addi	sp,sp,-16
       2:	e406                	sd	ra,8(sp)
       4:	e022                	sd	s0,0(sp)
       6:	0800                	addi	s0,sp,16
  if(fork() > 0)
       8:	00000097          	auipc	ra,0x0
       c:	4aa080e7          	jalr	1194(ra) # 4b2 <fork>
      10:	87aa                	mv	a5,a0
      12:	00f05763          	blez	a5,20 <main+0x20>
    sleep(5);  // Let child exit before parent.
      16:	4515                	li	a0,5
      18:	00000097          	auipc	ra,0x0
      1c:	532080e7          	jalr	1330(ra) # 54a <sleep>
  exit(0);
      20:	4501                	li	a0,0
      22:	00000097          	auipc	ra,0x0
      26:	498080e7          	jalr	1176(ra) # 4ba <exit>

000000000000002a <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      2a:	7179                	addi	sp,sp,-48
      2c:	f422                	sd	s0,40(sp)
      2e:	1800                	addi	s0,sp,48
      30:	fca43c23          	sd	a0,-40(s0)
      34:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      38:	fd843783          	ld	a5,-40(s0)
      3c:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      40:	0001                	nop
      42:	fd043703          	ld	a4,-48(s0)
      46:	00170793          	addi	a5,a4,1
      4a:	fcf43823          	sd	a5,-48(s0)
      4e:	fd843783          	ld	a5,-40(s0)
      52:	00178693          	addi	a3,a5,1
      56:	fcd43c23          	sd	a3,-40(s0)
      5a:	00074703          	lbu	a4,0(a4)
      5e:	00e78023          	sb	a4,0(a5)
      62:	0007c783          	lbu	a5,0(a5)
      66:	fff1                	bnez	a5,42 <strcpy+0x18>
    ;
  return os;
      68:	fe843783          	ld	a5,-24(s0)
}
      6c:	853e                	mv	a0,a5
      6e:	7422                	ld	s0,40(sp)
      70:	6145                	addi	sp,sp,48
      72:	8082                	ret

0000000000000074 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      74:	1101                	addi	sp,sp,-32
      76:	ec22                	sd	s0,24(sp)
      78:	1000                	addi	s0,sp,32
      7a:	fea43423          	sd	a0,-24(s0)
      7e:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
      82:	a819                	j	98 <strcmp+0x24>
    p++, q++;
      84:	fe843783          	ld	a5,-24(s0)
      88:	0785                	addi	a5,a5,1
      8a:	fef43423          	sd	a5,-24(s0)
      8e:	fe043783          	ld	a5,-32(s0)
      92:	0785                	addi	a5,a5,1
      94:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
      98:	fe843783          	ld	a5,-24(s0)
      9c:	0007c783          	lbu	a5,0(a5)
      a0:	cb99                	beqz	a5,b6 <strcmp+0x42>
      a2:	fe843783          	ld	a5,-24(s0)
      a6:	0007c703          	lbu	a4,0(a5)
      aa:	fe043783          	ld	a5,-32(s0)
      ae:	0007c783          	lbu	a5,0(a5)
      b2:	fcf709e3          	beq	a4,a5,84 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
      b6:	fe843783          	ld	a5,-24(s0)
      ba:	0007c783          	lbu	a5,0(a5)
      be:	0007871b          	sext.w	a4,a5
      c2:	fe043783          	ld	a5,-32(s0)
      c6:	0007c783          	lbu	a5,0(a5)
      ca:	2781                	sext.w	a5,a5
      cc:	40f707bb          	subw	a5,a4,a5
      d0:	2781                	sext.w	a5,a5
}
      d2:	853e                	mv	a0,a5
      d4:	6462                	ld	s0,24(sp)
      d6:	6105                	addi	sp,sp,32
      d8:	8082                	ret

00000000000000da <strlen>:

uint
strlen(const char *s)
{
      da:	7179                	addi	sp,sp,-48
      dc:	f422                	sd	s0,40(sp)
      de:	1800                	addi	s0,sp,48
      e0:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
      e4:	fe042623          	sw	zero,-20(s0)
      e8:	a031                	j	f4 <strlen+0x1a>
      ea:	fec42783          	lw	a5,-20(s0)
      ee:	2785                	addiw	a5,a5,1
      f0:	fef42623          	sw	a5,-20(s0)
      f4:	fec42783          	lw	a5,-20(s0)
      f8:	fd843703          	ld	a4,-40(s0)
      fc:	97ba                	add	a5,a5,a4
      fe:	0007c783          	lbu	a5,0(a5)
     102:	f7e5                	bnez	a5,ea <strlen+0x10>
    ;
  return n;
     104:	fec42783          	lw	a5,-20(s0)
}
     108:	853e                	mv	a0,a5
     10a:	7422                	ld	s0,40(sp)
     10c:	6145                	addi	sp,sp,48
     10e:	8082                	ret

0000000000000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
     110:	7179                	addi	sp,sp,-48
     112:	f422                	sd	s0,40(sp)
     114:	1800                	addi	s0,sp,48
     116:	fca43c23          	sd	a0,-40(s0)
     11a:	87ae                	mv	a5,a1
     11c:	8732                	mv	a4,a2
     11e:	fcf42a23          	sw	a5,-44(s0)
     122:	87ba                	mv	a5,a4
     124:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     128:	fd843783          	ld	a5,-40(s0)
     12c:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     130:	fe042623          	sw	zero,-20(s0)
     134:	a00d                	j	156 <memset+0x46>
    cdst[i] = c;
     136:	fec42783          	lw	a5,-20(s0)
     13a:	fe043703          	ld	a4,-32(s0)
     13e:	97ba                	add	a5,a5,a4
     140:	fd442703          	lw	a4,-44(s0)
     144:	0ff77713          	andi	a4,a4,255
     148:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     14c:	fec42783          	lw	a5,-20(s0)
     150:	2785                	addiw	a5,a5,1
     152:	fef42623          	sw	a5,-20(s0)
     156:	fec42703          	lw	a4,-20(s0)
     15a:	fd042783          	lw	a5,-48(s0)
     15e:	2781                	sext.w	a5,a5
     160:	fcf76be3          	bltu	a4,a5,136 <memset+0x26>
  }
  return dst;
     164:	fd843783          	ld	a5,-40(s0)
}
     168:	853e                	mv	a0,a5
     16a:	7422                	ld	s0,40(sp)
     16c:	6145                	addi	sp,sp,48
     16e:	8082                	ret

0000000000000170 <strchr>:

char*
strchr(const char *s, char c)
{
     170:	1101                	addi	sp,sp,-32
     172:	ec22                	sd	s0,24(sp)
     174:	1000                	addi	s0,sp,32
     176:	fea43423          	sd	a0,-24(s0)
     17a:	87ae                	mv	a5,a1
     17c:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     180:	a01d                	j	1a6 <strchr+0x36>
    if(*s == c)
     182:	fe843783          	ld	a5,-24(s0)
     186:	0007c703          	lbu	a4,0(a5)
     18a:	fe744783          	lbu	a5,-25(s0)
     18e:	0ff7f793          	andi	a5,a5,255
     192:	00e79563          	bne	a5,a4,19c <strchr+0x2c>
      return (char*)s;
     196:	fe843783          	ld	a5,-24(s0)
     19a:	a821                	j	1b2 <strchr+0x42>
  for(; *s; s++)
     19c:	fe843783          	ld	a5,-24(s0)
     1a0:	0785                	addi	a5,a5,1
     1a2:	fef43423          	sd	a5,-24(s0)
     1a6:	fe843783          	ld	a5,-24(s0)
     1aa:	0007c783          	lbu	a5,0(a5)
     1ae:	fbf1                	bnez	a5,182 <strchr+0x12>
  return 0;
     1b0:	4781                	li	a5,0
}
     1b2:	853e                	mv	a0,a5
     1b4:	6462                	ld	s0,24(sp)
     1b6:	6105                	addi	sp,sp,32
     1b8:	8082                	ret

00000000000001ba <gets>:

char*
gets(char *buf, int max)
{
     1ba:	7179                	addi	sp,sp,-48
     1bc:	f406                	sd	ra,40(sp)
     1be:	f022                	sd	s0,32(sp)
     1c0:	1800                	addi	s0,sp,48
     1c2:	fca43c23          	sd	a0,-40(s0)
     1c6:	87ae                	mv	a5,a1
     1c8:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1cc:	fe042623          	sw	zero,-20(s0)
     1d0:	a8a1                	j	228 <gets+0x6e>
    cc = read(0, &c, 1);
     1d2:	fe740793          	addi	a5,s0,-25
     1d6:	4605                	li	a2,1
     1d8:	85be                	mv	a1,a5
     1da:	4501                	li	a0,0
     1dc:	00000097          	auipc	ra,0x0
     1e0:	2f6080e7          	jalr	758(ra) # 4d2 <read>
     1e4:	87aa                	mv	a5,a0
     1e6:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     1ea:	fe842783          	lw	a5,-24(s0)
     1ee:	2781                	sext.w	a5,a5
     1f0:	04f05763          	blez	a5,23e <gets+0x84>
      break;
    buf[i++] = c;
     1f4:	fec42783          	lw	a5,-20(s0)
     1f8:	0017871b          	addiw	a4,a5,1
     1fc:	fee42623          	sw	a4,-20(s0)
     200:	873e                	mv	a4,a5
     202:	fd843783          	ld	a5,-40(s0)
     206:	97ba                	add	a5,a5,a4
     208:	fe744703          	lbu	a4,-25(s0)
     20c:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     210:	fe744783          	lbu	a5,-25(s0)
     214:	873e                	mv	a4,a5
     216:	47a9                	li	a5,10
     218:	02f70463          	beq	a4,a5,240 <gets+0x86>
     21c:	fe744783          	lbu	a5,-25(s0)
     220:	873e                	mv	a4,a5
     222:	47b5                	li	a5,13
     224:	00f70e63          	beq	a4,a5,240 <gets+0x86>
  for(i=0; i+1 < max; ){
     228:	fec42783          	lw	a5,-20(s0)
     22c:	2785                	addiw	a5,a5,1
     22e:	0007871b          	sext.w	a4,a5
     232:	fd442783          	lw	a5,-44(s0)
     236:	2781                	sext.w	a5,a5
     238:	f8f74de3          	blt	a4,a5,1d2 <gets+0x18>
     23c:	a011                	j	240 <gets+0x86>
      break;
     23e:	0001                	nop
      break;
  }
  buf[i] = '\0';
     240:	fec42783          	lw	a5,-20(s0)
     244:	fd843703          	ld	a4,-40(s0)
     248:	97ba                	add	a5,a5,a4
     24a:	00078023          	sb	zero,0(a5)
  return buf;
     24e:	fd843783          	ld	a5,-40(s0)
}
     252:	853e                	mv	a0,a5
     254:	70a2                	ld	ra,40(sp)
     256:	7402                	ld	s0,32(sp)
     258:	6145                	addi	sp,sp,48
     25a:	8082                	ret

000000000000025c <stat>:

int
stat(const char *n, struct stat *st)
{
     25c:	7179                	addi	sp,sp,-48
     25e:	f406                	sd	ra,40(sp)
     260:	f022                	sd	s0,32(sp)
     262:	1800                	addi	s0,sp,48
     264:	fca43c23          	sd	a0,-40(s0)
     268:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     26c:	4581                	li	a1,0
     26e:	fd843503          	ld	a0,-40(s0)
     272:	00000097          	auipc	ra,0x0
     276:	288080e7          	jalr	648(ra) # 4fa <open>
     27a:	87aa                	mv	a5,a0
     27c:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     280:	fec42783          	lw	a5,-20(s0)
     284:	2781                	sext.w	a5,a5
     286:	0007d463          	bgez	a5,28e <stat+0x32>
    return -1;
     28a:	57fd                	li	a5,-1
     28c:	a035                	j	2b8 <stat+0x5c>
  r = fstat(fd, st);
     28e:	fec42783          	lw	a5,-20(s0)
     292:	fd043583          	ld	a1,-48(s0)
     296:	853e                	mv	a0,a5
     298:	00000097          	auipc	ra,0x0
     29c:	27a080e7          	jalr	634(ra) # 512 <fstat>
     2a0:	87aa                	mv	a5,a0
     2a2:	fef42423          	sw	a5,-24(s0)
  close(fd);
     2a6:	fec42783          	lw	a5,-20(s0)
     2aa:	853e                	mv	a0,a5
     2ac:	00000097          	auipc	ra,0x0
     2b0:	236080e7          	jalr	566(ra) # 4e2 <close>
  return r;
     2b4:	fe842783          	lw	a5,-24(s0)
}
     2b8:	853e                	mv	a0,a5
     2ba:	70a2                	ld	ra,40(sp)
     2bc:	7402                	ld	s0,32(sp)
     2be:	6145                	addi	sp,sp,48
     2c0:	8082                	ret

00000000000002c2 <atoi>:

int
atoi(const char *s)
{
     2c2:	7179                	addi	sp,sp,-48
     2c4:	f422                	sd	s0,40(sp)
     2c6:	1800                	addi	s0,sp,48
     2c8:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     2cc:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     2d0:	a815                	j	304 <atoi+0x42>
    n = n*10 + *s++ - '0';
     2d2:	fec42703          	lw	a4,-20(s0)
     2d6:	87ba                	mv	a5,a4
     2d8:	0027979b          	slliw	a5,a5,0x2
     2dc:	9fb9                	addw	a5,a5,a4
     2de:	0017979b          	slliw	a5,a5,0x1
     2e2:	0007871b          	sext.w	a4,a5
     2e6:	fd843783          	ld	a5,-40(s0)
     2ea:	00178693          	addi	a3,a5,1
     2ee:	fcd43c23          	sd	a3,-40(s0)
     2f2:	0007c783          	lbu	a5,0(a5)
     2f6:	2781                	sext.w	a5,a5
     2f8:	9fb9                	addw	a5,a5,a4
     2fa:	2781                	sext.w	a5,a5
     2fc:	fd07879b          	addiw	a5,a5,-48
     300:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     304:	fd843783          	ld	a5,-40(s0)
     308:	0007c783          	lbu	a5,0(a5)
     30c:	873e                	mv	a4,a5
     30e:	02f00793          	li	a5,47
     312:	00e7fb63          	bgeu	a5,a4,328 <atoi+0x66>
     316:	fd843783          	ld	a5,-40(s0)
     31a:	0007c783          	lbu	a5,0(a5)
     31e:	873e                	mv	a4,a5
     320:	03900793          	li	a5,57
     324:	fae7f7e3          	bgeu	a5,a4,2d2 <atoi+0x10>
  return n;
     328:	fec42783          	lw	a5,-20(s0)
}
     32c:	853e                	mv	a0,a5
     32e:	7422                	ld	s0,40(sp)
     330:	6145                	addi	sp,sp,48
     332:	8082                	ret

0000000000000334 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     334:	7139                	addi	sp,sp,-64
     336:	fc22                	sd	s0,56(sp)
     338:	0080                	addi	s0,sp,64
     33a:	fca43c23          	sd	a0,-40(s0)
     33e:	fcb43823          	sd	a1,-48(s0)
     342:	87b2                	mv	a5,a2
     344:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     348:	fd843783          	ld	a5,-40(s0)
     34c:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     350:	fd043783          	ld	a5,-48(s0)
     354:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     358:	fe043703          	ld	a4,-32(s0)
     35c:	fe843783          	ld	a5,-24(s0)
     360:	02e7fc63          	bgeu	a5,a4,398 <memmove+0x64>
    while(n-- > 0)
     364:	a00d                	j	386 <memmove+0x52>
      *dst++ = *src++;
     366:	fe043703          	ld	a4,-32(s0)
     36a:	00170793          	addi	a5,a4,1
     36e:	fef43023          	sd	a5,-32(s0)
     372:	fe843783          	ld	a5,-24(s0)
     376:	00178693          	addi	a3,a5,1
     37a:	fed43423          	sd	a3,-24(s0)
     37e:	00074703          	lbu	a4,0(a4)
     382:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     386:	fcc42783          	lw	a5,-52(s0)
     38a:	fff7871b          	addiw	a4,a5,-1
     38e:	fce42623          	sw	a4,-52(s0)
     392:	fcf04ae3          	bgtz	a5,366 <memmove+0x32>
     396:	a891                	j	3ea <memmove+0xb6>
  } else {
    dst += n;
     398:	fcc42783          	lw	a5,-52(s0)
     39c:	fe843703          	ld	a4,-24(s0)
     3a0:	97ba                	add	a5,a5,a4
     3a2:	fef43423          	sd	a5,-24(s0)
    src += n;
     3a6:	fcc42783          	lw	a5,-52(s0)
     3aa:	fe043703          	ld	a4,-32(s0)
     3ae:	97ba                	add	a5,a5,a4
     3b0:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     3b4:	a01d                	j	3da <memmove+0xa6>
      *--dst = *--src;
     3b6:	fe043783          	ld	a5,-32(s0)
     3ba:	17fd                	addi	a5,a5,-1
     3bc:	fef43023          	sd	a5,-32(s0)
     3c0:	fe843783          	ld	a5,-24(s0)
     3c4:	17fd                	addi	a5,a5,-1
     3c6:	fef43423          	sd	a5,-24(s0)
     3ca:	fe043783          	ld	a5,-32(s0)
     3ce:	0007c703          	lbu	a4,0(a5)
     3d2:	fe843783          	ld	a5,-24(s0)
     3d6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     3da:	fcc42783          	lw	a5,-52(s0)
     3de:	fff7871b          	addiw	a4,a5,-1
     3e2:	fce42623          	sw	a4,-52(s0)
     3e6:	fcf048e3          	bgtz	a5,3b6 <memmove+0x82>
  }
  return vdst;
     3ea:	fd843783          	ld	a5,-40(s0)
}
     3ee:	853e                	mv	a0,a5
     3f0:	7462                	ld	s0,56(sp)
     3f2:	6121                	addi	sp,sp,64
     3f4:	8082                	ret

00000000000003f6 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     3f6:	7139                	addi	sp,sp,-64
     3f8:	fc22                	sd	s0,56(sp)
     3fa:	0080                	addi	s0,sp,64
     3fc:	fca43c23          	sd	a0,-40(s0)
     400:	fcb43823          	sd	a1,-48(s0)
     404:	87b2                	mv	a5,a2
     406:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     40a:	fd843783          	ld	a5,-40(s0)
     40e:	fef43423          	sd	a5,-24(s0)
     412:	fd043783          	ld	a5,-48(s0)
     416:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     41a:	a0a1                	j	462 <memcmp+0x6c>
    if (*p1 != *p2) {
     41c:	fe843783          	ld	a5,-24(s0)
     420:	0007c703          	lbu	a4,0(a5)
     424:	fe043783          	ld	a5,-32(s0)
     428:	0007c783          	lbu	a5,0(a5)
     42c:	02f70163          	beq	a4,a5,44e <memcmp+0x58>
      return *p1 - *p2;
     430:	fe843783          	ld	a5,-24(s0)
     434:	0007c783          	lbu	a5,0(a5)
     438:	0007871b          	sext.w	a4,a5
     43c:	fe043783          	ld	a5,-32(s0)
     440:	0007c783          	lbu	a5,0(a5)
     444:	2781                	sext.w	a5,a5
     446:	40f707bb          	subw	a5,a4,a5
     44a:	2781                	sext.w	a5,a5
     44c:	a01d                	j	472 <memcmp+0x7c>
    }
    p1++;
     44e:	fe843783          	ld	a5,-24(s0)
     452:	0785                	addi	a5,a5,1
     454:	fef43423          	sd	a5,-24(s0)
    p2++;
     458:	fe043783          	ld	a5,-32(s0)
     45c:	0785                	addi	a5,a5,1
     45e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     462:	fcc42783          	lw	a5,-52(s0)
     466:	fff7871b          	addiw	a4,a5,-1
     46a:	fce42623          	sw	a4,-52(s0)
     46e:	f7dd                	bnez	a5,41c <memcmp+0x26>
  }
  return 0;
     470:	4781                	li	a5,0
}
     472:	853e                	mv	a0,a5
     474:	7462                	ld	s0,56(sp)
     476:	6121                	addi	sp,sp,64
     478:	8082                	ret

000000000000047a <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     47a:	7179                	addi	sp,sp,-48
     47c:	f406                	sd	ra,40(sp)
     47e:	f022                	sd	s0,32(sp)
     480:	1800                	addi	s0,sp,48
     482:	fea43423          	sd	a0,-24(s0)
     486:	feb43023          	sd	a1,-32(s0)
     48a:	87b2                	mv	a5,a2
     48c:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     490:	fdc42783          	lw	a5,-36(s0)
     494:	863e                	mv	a2,a5
     496:	fe043583          	ld	a1,-32(s0)
     49a:	fe843503          	ld	a0,-24(s0)
     49e:	00000097          	auipc	ra,0x0
     4a2:	e96080e7          	jalr	-362(ra) # 334 <memmove>
     4a6:	87aa                	mv	a5,a0
}
     4a8:	853e                	mv	a0,a5
     4aa:	70a2                	ld	ra,40(sp)
     4ac:	7402                	ld	s0,32(sp)
     4ae:	6145                	addi	sp,sp,48
     4b0:	8082                	ret

00000000000004b2 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     4b2:	4885                	li	a7,1
 ecall
     4b4:	00000073          	ecall
 ret
     4b8:	8082                	ret

00000000000004ba <exit>:
.global exit
exit:
 li a7, SYS_exit
     4ba:	4889                	li	a7,2
 ecall
     4bc:	00000073          	ecall
 ret
     4c0:	8082                	ret

00000000000004c2 <wait>:
.global wait
wait:
 li a7, SYS_wait
     4c2:	488d                	li	a7,3
 ecall
     4c4:	00000073          	ecall
 ret
     4c8:	8082                	ret

00000000000004ca <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     4ca:	4891                	li	a7,4
 ecall
     4cc:	00000073          	ecall
 ret
     4d0:	8082                	ret

00000000000004d2 <read>:
.global read
read:
 li a7, SYS_read
     4d2:	4895                	li	a7,5
 ecall
     4d4:	00000073          	ecall
 ret
     4d8:	8082                	ret

00000000000004da <write>:
.global write
write:
 li a7, SYS_write
     4da:	48c1                	li	a7,16
 ecall
     4dc:	00000073          	ecall
 ret
     4e0:	8082                	ret

00000000000004e2 <close>:
.global close
close:
 li a7, SYS_close
     4e2:	48d5                	li	a7,21
 ecall
     4e4:	00000073          	ecall
 ret
     4e8:	8082                	ret

00000000000004ea <kill>:
.global kill
kill:
 li a7, SYS_kill
     4ea:	4899                	li	a7,6
 ecall
     4ec:	00000073          	ecall
 ret
     4f0:	8082                	ret

00000000000004f2 <exec>:
.global exec
exec:
 li a7, SYS_exec
     4f2:	489d                	li	a7,7
 ecall
     4f4:	00000073          	ecall
 ret
     4f8:	8082                	ret

00000000000004fa <open>:
.global open
open:
 li a7, SYS_open
     4fa:	48bd                	li	a7,15
 ecall
     4fc:	00000073          	ecall
 ret
     500:	8082                	ret

0000000000000502 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     502:	48c5                	li	a7,17
 ecall
     504:	00000073          	ecall
 ret
     508:	8082                	ret

000000000000050a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     50a:	48c9                	li	a7,18
 ecall
     50c:	00000073          	ecall
 ret
     510:	8082                	ret

0000000000000512 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     512:	48a1                	li	a7,8
 ecall
     514:	00000073          	ecall
 ret
     518:	8082                	ret

000000000000051a <link>:
.global link
link:
 li a7, SYS_link
     51a:	48cd                	li	a7,19
 ecall
     51c:	00000073          	ecall
 ret
     520:	8082                	ret

0000000000000522 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     522:	48d1                	li	a7,20
 ecall
     524:	00000073          	ecall
 ret
     528:	8082                	ret

000000000000052a <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     52a:	48a5                	li	a7,9
 ecall
     52c:	00000073          	ecall
 ret
     530:	8082                	ret

0000000000000532 <dup>:
.global dup
dup:
 li a7, SYS_dup
     532:	48a9                	li	a7,10
 ecall
     534:	00000073          	ecall
 ret
     538:	8082                	ret

000000000000053a <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     53a:	48ad                	li	a7,11
 ecall
     53c:	00000073          	ecall
 ret
     540:	8082                	ret

0000000000000542 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     542:	48b1                	li	a7,12
 ecall
     544:	00000073          	ecall
 ret
     548:	8082                	ret

000000000000054a <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     54a:	48b5                	li	a7,13
 ecall
     54c:	00000073          	ecall
 ret
     550:	8082                	ret

0000000000000552 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     552:	48b9                	li	a7,14
 ecall
     554:	00000073          	ecall
 ret
     558:	8082                	ret

000000000000055a <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     55a:	48d9                	li	a7,22
 ecall
     55c:	00000073          	ecall
 ret
     560:	8082                	ret

0000000000000562 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     562:	48dd                	li	a7,23
 ecall
     564:	00000073          	ecall
 ret
     568:	8082                	ret

000000000000056a <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     56a:	48e1                	li	a7,24
 ecall
     56c:	00000073          	ecall
 ret
     570:	8082                	ret

0000000000000572 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     572:	1101                	addi	sp,sp,-32
     574:	ec06                	sd	ra,24(sp)
     576:	e822                	sd	s0,16(sp)
     578:	1000                	addi	s0,sp,32
     57a:	87aa                	mv	a5,a0
     57c:	872e                	mv	a4,a1
     57e:	fef42623          	sw	a5,-20(s0)
     582:	87ba                	mv	a5,a4
     584:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     588:	feb40713          	addi	a4,s0,-21
     58c:	fec42783          	lw	a5,-20(s0)
     590:	4605                	li	a2,1
     592:	85ba                	mv	a1,a4
     594:	853e                	mv	a0,a5
     596:	00000097          	auipc	ra,0x0
     59a:	f44080e7          	jalr	-188(ra) # 4da <write>
}
     59e:	0001                	nop
     5a0:	60e2                	ld	ra,24(sp)
     5a2:	6442                	ld	s0,16(sp)
     5a4:	6105                	addi	sp,sp,32
     5a6:	8082                	ret

00000000000005a8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     5a8:	7139                	addi	sp,sp,-64
     5aa:	fc06                	sd	ra,56(sp)
     5ac:	f822                	sd	s0,48(sp)
     5ae:	0080                	addi	s0,sp,64
     5b0:	87aa                	mv	a5,a0
     5b2:	8736                	mv	a4,a3
     5b4:	fcf42623          	sw	a5,-52(s0)
     5b8:	87ae                	mv	a5,a1
     5ba:	fcf42423          	sw	a5,-56(s0)
     5be:	87b2                	mv	a5,a2
     5c0:	fcf42223          	sw	a5,-60(s0)
     5c4:	87ba                	mv	a5,a4
     5c6:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     5ca:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     5ce:	fc042783          	lw	a5,-64(s0)
     5d2:	2781                	sext.w	a5,a5
     5d4:	c38d                	beqz	a5,5f6 <printint+0x4e>
     5d6:	fc842783          	lw	a5,-56(s0)
     5da:	2781                	sext.w	a5,a5
     5dc:	0007dd63          	bgez	a5,5f6 <printint+0x4e>
    neg = 1;
     5e0:	4785                	li	a5,1
     5e2:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     5e6:	fc842783          	lw	a5,-56(s0)
     5ea:	40f007bb          	negw	a5,a5
     5ee:	2781                	sext.w	a5,a5
     5f0:	fef42223          	sw	a5,-28(s0)
     5f4:	a029                	j	5fe <printint+0x56>
  } else {
    x = xx;
     5f6:	fc842783          	lw	a5,-56(s0)
     5fa:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     5fe:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     602:	fc442783          	lw	a5,-60(s0)
     606:	fe442703          	lw	a4,-28(s0)
     60a:	02f777bb          	remuw	a5,a4,a5
     60e:	0007861b          	sext.w	a2,a5
     612:	fec42783          	lw	a5,-20(s0)
     616:	0017871b          	addiw	a4,a5,1
     61a:	fee42623          	sw	a4,-20(s0)
     61e:	00002697          	auipc	a3,0x2
     622:	c2a68693          	addi	a3,a3,-982 # 2248 <digits>
     626:	02061713          	slli	a4,a2,0x20
     62a:	9301                	srli	a4,a4,0x20
     62c:	9736                	add	a4,a4,a3
     62e:	00074703          	lbu	a4,0(a4)
     632:	ff040693          	addi	a3,s0,-16
     636:	97b6                	add	a5,a5,a3
     638:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     63c:	fc442783          	lw	a5,-60(s0)
     640:	fe442703          	lw	a4,-28(s0)
     644:	02f757bb          	divuw	a5,a4,a5
     648:	fef42223          	sw	a5,-28(s0)
     64c:	fe442783          	lw	a5,-28(s0)
     650:	2781                	sext.w	a5,a5
     652:	fbc5                	bnez	a5,602 <printint+0x5a>
  if(neg)
     654:	fe842783          	lw	a5,-24(s0)
     658:	2781                	sext.w	a5,a5
     65a:	cf95                	beqz	a5,696 <printint+0xee>
    buf[i++] = '-';
     65c:	fec42783          	lw	a5,-20(s0)
     660:	0017871b          	addiw	a4,a5,1
     664:	fee42623          	sw	a4,-20(s0)
     668:	ff040713          	addi	a4,s0,-16
     66c:	97ba                	add	a5,a5,a4
     66e:	02d00713          	li	a4,45
     672:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     676:	a005                	j	696 <printint+0xee>
    putc(fd, buf[i]);
     678:	fec42783          	lw	a5,-20(s0)
     67c:	ff040713          	addi	a4,s0,-16
     680:	97ba                	add	a5,a5,a4
     682:	fe07c703          	lbu	a4,-32(a5)
     686:	fcc42783          	lw	a5,-52(s0)
     68a:	85ba                	mv	a1,a4
     68c:	853e                	mv	a0,a5
     68e:	00000097          	auipc	ra,0x0
     692:	ee4080e7          	jalr	-284(ra) # 572 <putc>
  while(--i >= 0)
     696:	fec42783          	lw	a5,-20(s0)
     69a:	37fd                	addiw	a5,a5,-1
     69c:	fef42623          	sw	a5,-20(s0)
     6a0:	fec42783          	lw	a5,-20(s0)
     6a4:	2781                	sext.w	a5,a5
     6a6:	fc07d9e3          	bgez	a5,678 <printint+0xd0>
}
     6aa:	0001                	nop
     6ac:	0001                	nop
     6ae:	70e2                	ld	ra,56(sp)
     6b0:	7442                	ld	s0,48(sp)
     6b2:	6121                	addi	sp,sp,64
     6b4:	8082                	ret

00000000000006b6 <printptr>:

static void
printptr(int fd, uint64 x) {
     6b6:	7179                	addi	sp,sp,-48
     6b8:	f406                	sd	ra,40(sp)
     6ba:	f022                	sd	s0,32(sp)
     6bc:	1800                	addi	s0,sp,48
     6be:	87aa                	mv	a5,a0
     6c0:	fcb43823          	sd	a1,-48(s0)
     6c4:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     6c8:	fdc42783          	lw	a5,-36(s0)
     6cc:	03000593          	li	a1,48
     6d0:	853e                	mv	a0,a5
     6d2:	00000097          	auipc	ra,0x0
     6d6:	ea0080e7          	jalr	-352(ra) # 572 <putc>
  putc(fd, 'x');
     6da:	fdc42783          	lw	a5,-36(s0)
     6de:	07800593          	li	a1,120
     6e2:	853e                	mv	a0,a5
     6e4:	00000097          	auipc	ra,0x0
     6e8:	e8e080e7          	jalr	-370(ra) # 572 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     6ec:	fe042623          	sw	zero,-20(s0)
     6f0:	a82d                	j	72a <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     6f2:	fd043783          	ld	a5,-48(s0)
     6f6:	93f1                	srli	a5,a5,0x3c
     6f8:	00002717          	auipc	a4,0x2
     6fc:	b5070713          	addi	a4,a4,-1200 # 2248 <digits>
     700:	97ba                	add	a5,a5,a4
     702:	0007c703          	lbu	a4,0(a5)
     706:	fdc42783          	lw	a5,-36(s0)
     70a:	85ba                	mv	a1,a4
     70c:	853e                	mv	a0,a5
     70e:	00000097          	auipc	ra,0x0
     712:	e64080e7          	jalr	-412(ra) # 572 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     716:	fec42783          	lw	a5,-20(s0)
     71a:	2785                	addiw	a5,a5,1
     71c:	fef42623          	sw	a5,-20(s0)
     720:	fd043783          	ld	a5,-48(s0)
     724:	0792                	slli	a5,a5,0x4
     726:	fcf43823          	sd	a5,-48(s0)
     72a:	fec42783          	lw	a5,-20(s0)
     72e:	873e                	mv	a4,a5
     730:	47bd                	li	a5,15
     732:	fce7f0e3          	bgeu	a5,a4,6f2 <printptr+0x3c>
}
     736:	0001                	nop
     738:	0001                	nop
     73a:	70a2                	ld	ra,40(sp)
     73c:	7402                	ld	s0,32(sp)
     73e:	6145                	addi	sp,sp,48
     740:	8082                	ret

0000000000000742 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     742:	715d                	addi	sp,sp,-80
     744:	e486                	sd	ra,72(sp)
     746:	e0a2                	sd	s0,64(sp)
     748:	0880                	addi	s0,sp,80
     74a:	87aa                	mv	a5,a0
     74c:	fcb43023          	sd	a1,-64(s0)
     750:	fac43c23          	sd	a2,-72(s0)
     754:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     758:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     75c:	fe042223          	sw	zero,-28(s0)
     760:	a42d                	j	98a <vprintf+0x248>
    c = fmt[i] & 0xff;
     762:	fe442783          	lw	a5,-28(s0)
     766:	fc043703          	ld	a4,-64(s0)
     76a:	97ba                	add	a5,a5,a4
     76c:	0007c783          	lbu	a5,0(a5)
     770:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     774:	fe042783          	lw	a5,-32(s0)
     778:	2781                	sext.w	a5,a5
     77a:	eb9d                	bnez	a5,7b0 <vprintf+0x6e>
      if(c == '%'){
     77c:	fdc42783          	lw	a5,-36(s0)
     780:	0007871b          	sext.w	a4,a5
     784:	02500793          	li	a5,37
     788:	00f71763          	bne	a4,a5,796 <vprintf+0x54>
        state = '%';
     78c:	02500793          	li	a5,37
     790:	fef42023          	sw	a5,-32(s0)
     794:	a2f5                	j	980 <vprintf+0x23e>
      } else {
        putc(fd, c);
     796:	fdc42783          	lw	a5,-36(s0)
     79a:	0ff7f713          	andi	a4,a5,255
     79e:	fcc42783          	lw	a5,-52(s0)
     7a2:	85ba                	mv	a1,a4
     7a4:	853e                	mv	a0,a5
     7a6:	00000097          	auipc	ra,0x0
     7aa:	dcc080e7          	jalr	-564(ra) # 572 <putc>
     7ae:	aac9                	j	980 <vprintf+0x23e>
      }
    } else if(state == '%'){
     7b0:	fe042783          	lw	a5,-32(s0)
     7b4:	0007871b          	sext.w	a4,a5
     7b8:	02500793          	li	a5,37
     7bc:	1cf71263          	bne	a4,a5,980 <vprintf+0x23e>
      if(c == 'd'){
     7c0:	fdc42783          	lw	a5,-36(s0)
     7c4:	0007871b          	sext.w	a4,a5
     7c8:	06400793          	li	a5,100
     7cc:	02f71463          	bne	a4,a5,7f4 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     7d0:	fb843783          	ld	a5,-72(s0)
     7d4:	00878713          	addi	a4,a5,8
     7d8:	fae43c23          	sd	a4,-72(s0)
     7dc:	4398                	lw	a4,0(a5)
     7de:	fcc42783          	lw	a5,-52(s0)
     7e2:	4685                	li	a3,1
     7e4:	4629                	li	a2,10
     7e6:	85ba                	mv	a1,a4
     7e8:	853e                	mv	a0,a5
     7ea:	00000097          	auipc	ra,0x0
     7ee:	dbe080e7          	jalr	-578(ra) # 5a8 <printint>
     7f2:	a269                	j	97c <vprintf+0x23a>
      } else if(c == 'l') {
     7f4:	fdc42783          	lw	a5,-36(s0)
     7f8:	0007871b          	sext.w	a4,a5
     7fc:	06c00793          	li	a5,108
     800:	02f71663          	bne	a4,a5,82c <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     804:	fb843783          	ld	a5,-72(s0)
     808:	00878713          	addi	a4,a5,8
     80c:	fae43c23          	sd	a4,-72(s0)
     810:	639c                	ld	a5,0(a5)
     812:	0007871b          	sext.w	a4,a5
     816:	fcc42783          	lw	a5,-52(s0)
     81a:	4681                	li	a3,0
     81c:	4629                	li	a2,10
     81e:	85ba                	mv	a1,a4
     820:	853e                	mv	a0,a5
     822:	00000097          	auipc	ra,0x0
     826:	d86080e7          	jalr	-634(ra) # 5a8 <printint>
     82a:	aa89                	j	97c <vprintf+0x23a>
      } else if(c == 'x') {
     82c:	fdc42783          	lw	a5,-36(s0)
     830:	0007871b          	sext.w	a4,a5
     834:	07800793          	li	a5,120
     838:	02f71463          	bne	a4,a5,860 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     83c:	fb843783          	ld	a5,-72(s0)
     840:	00878713          	addi	a4,a5,8
     844:	fae43c23          	sd	a4,-72(s0)
     848:	4398                	lw	a4,0(a5)
     84a:	fcc42783          	lw	a5,-52(s0)
     84e:	4681                	li	a3,0
     850:	4641                	li	a2,16
     852:	85ba                	mv	a1,a4
     854:	853e                	mv	a0,a5
     856:	00000097          	auipc	ra,0x0
     85a:	d52080e7          	jalr	-686(ra) # 5a8 <printint>
     85e:	aa39                	j	97c <vprintf+0x23a>
      } else if(c == 'p') {
     860:	fdc42783          	lw	a5,-36(s0)
     864:	0007871b          	sext.w	a4,a5
     868:	07000793          	li	a5,112
     86c:	02f71263          	bne	a4,a5,890 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     870:	fb843783          	ld	a5,-72(s0)
     874:	00878713          	addi	a4,a5,8
     878:	fae43c23          	sd	a4,-72(s0)
     87c:	6398                	ld	a4,0(a5)
     87e:	fcc42783          	lw	a5,-52(s0)
     882:	85ba                	mv	a1,a4
     884:	853e                	mv	a0,a5
     886:	00000097          	auipc	ra,0x0
     88a:	e30080e7          	jalr	-464(ra) # 6b6 <printptr>
     88e:	a0fd                	j	97c <vprintf+0x23a>
      } else if(c == 's'){
     890:	fdc42783          	lw	a5,-36(s0)
     894:	0007871b          	sext.w	a4,a5
     898:	07300793          	li	a5,115
     89c:	04f71c63          	bne	a4,a5,8f4 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     8a0:	fb843783          	ld	a5,-72(s0)
     8a4:	00878713          	addi	a4,a5,8
     8a8:	fae43c23          	sd	a4,-72(s0)
     8ac:	639c                	ld	a5,0(a5)
     8ae:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     8b2:	fe843783          	ld	a5,-24(s0)
     8b6:	eb8d                	bnez	a5,8e8 <vprintf+0x1a6>
          s = "(null)";
     8b8:	00001797          	auipc	a5,0x1
     8bc:	71078793          	addi	a5,a5,1808 # 1fc8 <schedule_edf_cbs+0x4d2>
     8c0:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     8c4:	a015                	j	8e8 <vprintf+0x1a6>
          putc(fd, *s);
     8c6:	fe843783          	ld	a5,-24(s0)
     8ca:	0007c703          	lbu	a4,0(a5)
     8ce:	fcc42783          	lw	a5,-52(s0)
     8d2:	85ba                	mv	a1,a4
     8d4:	853e                	mv	a0,a5
     8d6:	00000097          	auipc	ra,0x0
     8da:	c9c080e7          	jalr	-868(ra) # 572 <putc>
          s++;
     8de:	fe843783          	ld	a5,-24(s0)
     8e2:	0785                	addi	a5,a5,1
     8e4:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     8e8:	fe843783          	ld	a5,-24(s0)
     8ec:	0007c783          	lbu	a5,0(a5)
     8f0:	fbf9                	bnez	a5,8c6 <vprintf+0x184>
     8f2:	a069                	j	97c <vprintf+0x23a>
        }
      } else if(c == 'c'){
     8f4:	fdc42783          	lw	a5,-36(s0)
     8f8:	0007871b          	sext.w	a4,a5
     8fc:	06300793          	li	a5,99
     900:	02f71463          	bne	a4,a5,928 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     904:	fb843783          	ld	a5,-72(s0)
     908:	00878713          	addi	a4,a5,8
     90c:	fae43c23          	sd	a4,-72(s0)
     910:	439c                	lw	a5,0(a5)
     912:	0ff7f713          	andi	a4,a5,255
     916:	fcc42783          	lw	a5,-52(s0)
     91a:	85ba                	mv	a1,a4
     91c:	853e                	mv	a0,a5
     91e:	00000097          	auipc	ra,0x0
     922:	c54080e7          	jalr	-940(ra) # 572 <putc>
     926:	a899                	j	97c <vprintf+0x23a>
      } else if(c == '%'){
     928:	fdc42783          	lw	a5,-36(s0)
     92c:	0007871b          	sext.w	a4,a5
     930:	02500793          	li	a5,37
     934:	00f71f63          	bne	a4,a5,952 <vprintf+0x210>
        putc(fd, c);
     938:	fdc42783          	lw	a5,-36(s0)
     93c:	0ff7f713          	andi	a4,a5,255
     940:	fcc42783          	lw	a5,-52(s0)
     944:	85ba                	mv	a1,a4
     946:	853e                	mv	a0,a5
     948:	00000097          	auipc	ra,0x0
     94c:	c2a080e7          	jalr	-982(ra) # 572 <putc>
     950:	a035                	j	97c <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     952:	fcc42783          	lw	a5,-52(s0)
     956:	02500593          	li	a1,37
     95a:	853e                	mv	a0,a5
     95c:	00000097          	auipc	ra,0x0
     960:	c16080e7          	jalr	-1002(ra) # 572 <putc>
        putc(fd, c);
     964:	fdc42783          	lw	a5,-36(s0)
     968:	0ff7f713          	andi	a4,a5,255
     96c:	fcc42783          	lw	a5,-52(s0)
     970:	85ba                	mv	a1,a4
     972:	853e                	mv	a0,a5
     974:	00000097          	auipc	ra,0x0
     978:	bfe080e7          	jalr	-1026(ra) # 572 <putc>
      }
      state = 0;
     97c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     980:	fe442783          	lw	a5,-28(s0)
     984:	2785                	addiw	a5,a5,1
     986:	fef42223          	sw	a5,-28(s0)
     98a:	fe442783          	lw	a5,-28(s0)
     98e:	fc043703          	ld	a4,-64(s0)
     992:	97ba                	add	a5,a5,a4
     994:	0007c783          	lbu	a5,0(a5)
     998:	dc0795e3          	bnez	a5,762 <vprintf+0x20>
    }
  }
}
     99c:	0001                	nop
     99e:	0001                	nop
     9a0:	60a6                	ld	ra,72(sp)
     9a2:	6406                	ld	s0,64(sp)
     9a4:	6161                	addi	sp,sp,80
     9a6:	8082                	ret

00000000000009a8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     9a8:	7159                	addi	sp,sp,-112
     9aa:	fc06                	sd	ra,56(sp)
     9ac:	f822                	sd	s0,48(sp)
     9ae:	0080                	addi	s0,sp,64
     9b0:	fcb43823          	sd	a1,-48(s0)
     9b4:	e010                	sd	a2,0(s0)
     9b6:	e414                	sd	a3,8(s0)
     9b8:	e818                	sd	a4,16(s0)
     9ba:	ec1c                	sd	a5,24(s0)
     9bc:	03043023          	sd	a6,32(s0)
     9c0:	03143423          	sd	a7,40(s0)
     9c4:	87aa                	mv	a5,a0
     9c6:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     9ca:	03040793          	addi	a5,s0,48
     9ce:	fcf43423          	sd	a5,-56(s0)
     9d2:	fc843783          	ld	a5,-56(s0)
     9d6:	fd078793          	addi	a5,a5,-48
     9da:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     9de:	fe843703          	ld	a4,-24(s0)
     9e2:	fdc42783          	lw	a5,-36(s0)
     9e6:	863a                	mv	a2,a4
     9e8:	fd043583          	ld	a1,-48(s0)
     9ec:	853e                	mv	a0,a5
     9ee:	00000097          	auipc	ra,0x0
     9f2:	d54080e7          	jalr	-684(ra) # 742 <vprintf>
}
     9f6:	0001                	nop
     9f8:	70e2                	ld	ra,56(sp)
     9fa:	7442                	ld	s0,48(sp)
     9fc:	6165                	addi	sp,sp,112
     9fe:	8082                	ret

0000000000000a00 <printf>:

void
printf(const char *fmt, ...)
{
     a00:	7159                	addi	sp,sp,-112
     a02:	f406                	sd	ra,40(sp)
     a04:	f022                	sd	s0,32(sp)
     a06:	1800                	addi	s0,sp,48
     a08:	fca43c23          	sd	a0,-40(s0)
     a0c:	e40c                	sd	a1,8(s0)
     a0e:	e810                	sd	a2,16(s0)
     a10:	ec14                	sd	a3,24(s0)
     a12:	f018                	sd	a4,32(s0)
     a14:	f41c                	sd	a5,40(s0)
     a16:	03043823          	sd	a6,48(s0)
     a1a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a1e:	04040793          	addi	a5,s0,64
     a22:	fcf43823          	sd	a5,-48(s0)
     a26:	fd043783          	ld	a5,-48(s0)
     a2a:	fc878793          	addi	a5,a5,-56
     a2e:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     a32:	fe843783          	ld	a5,-24(s0)
     a36:	863e                	mv	a2,a5
     a38:	fd843583          	ld	a1,-40(s0)
     a3c:	4505                	li	a0,1
     a3e:	00000097          	auipc	ra,0x0
     a42:	d04080e7          	jalr	-764(ra) # 742 <vprintf>
}
     a46:	0001                	nop
     a48:	70a2                	ld	ra,40(sp)
     a4a:	7402                	ld	s0,32(sp)
     a4c:	6165                	addi	sp,sp,112
     a4e:	8082                	ret

0000000000000a50 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     a50:	7179                	addi	sp,sp,-48
     a52:	f422                	sd	s0,40(sp)
     a54:	1800                	addi	s0,sp,48
     a56:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     a5a:	fd843783          	ld	a5,-40(s0)
     a5e:	17c1                	addi	a5,a5,-16
     a60:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a64:	00002797          	auipc	a5,0x2
     a68:	83c78793          	addi	a5,a5,-1988 # 22a0 <freep>
     a6c:	639c                	ld	a5,0(a5)
     a6e:	fef43423          	sd	a5,-24(s0)
     a72:	a815                	j	aa6 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     a74:	fe843783          	ld	a5,-24(s0)
     a78:	639c                	ld	a5,0(a5)
     a7a:	fe843703          	ld	a4,-24(s0)
     a7e:	00f76f63          	bltu	a4,a5,a9c <free+0x4c>
     a82:	fe043703          	ld	a4,-32(s0)
     a86:	fe843783          	ld	a5,-24(s0)
     a8a:	02e7eb63          	bltu	a5,a4,ac0 <free+0x70>
     a8e:	fe843783          	ld	a5,-24(s0)
     a92:	639c                	ld	a5,0(a5)
     a94:	fe043703          	ld	a4,-32(s0)
     a98:	02f76463          	bltu	a4,a5,ac0 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     a9c:	fe843783          	ld	a5,-24(s0)
     aa0:	639c                	ld	a5,0(a5)
     aa2:	fef43423          	sd	a5,-24(s0)
     aa6:	fe043703          	ld	a4,-32(s0)
     aaa:	fe843783          	ld	a5,-24(s0)
     aae:	fce7f3e3          	bgeu	a5,a4,a74 <free+0x24>
     ab2:	fe843783          	ld	a5,-24(s0)
     ab6:	639c                	ld	a5,0(a5)
     ab8:	fe043703          	ld	a4,-32(s0)
     abc:	faf77ce3          	bgeu	a4,a5,a74 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     ac0:	fe043783          	ld	a5,-32(s0)
     ac4:	479c                	lw	a5,8(a5)
     ac6:	1782                	slli	a5,a5,0x20
     ac8:	9381                	srli	a5,a5,0x20
     aca:	0792                	slli	a5,a5,0x4
     acc:	fe043703          	ld	a4,-32(s0)
     ad0:	973e                	add	a4,a4,a5
     ad2:	fe843783          	ld	a5,-24(s0)
     ad6:	639c                	ld	a5,0(a5)
     ad8:	02f71763          	bne	a4,a5,b06 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     adc:	fe043783          	ld	a5,-32(s0)
     ae0:	4798                	lw	a4,8(a5)
     ae2:	fe843783          	ld	a5,-24(s0)
     ae6:	639c                	ld	a5,0(a5)
     ae8:	479c                	lw	a5,8(a5)
     aea:	9fb9                	addw	a5,a5,a4
     aec:	0007871b          	sext.w	a4,a5
     af0:	fe043783          	ld	a5,-32(s0)
     af4:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     af6:	fe843783          	ld	a5,-24(s0)
     afa:	639c                	ld	a5,0(a5)
     afc:	6398                	ld	a4,0(a5)
     afe:	fe043783          	ld	a5,-32(s0)
     b02:	e398                	sd	a4,0(a5)
     b04:	a039                	j	b12 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b06:	fe843783          	ld	a5,-24(s0)
     b0a:	6398                	ld	a4,0(a5)
     b0c:	fe043783          	ld	a5,-32(s0)
     b10:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b12:	fe843783          	ld	a5,-24(s0)
     b16:	479c                	lw	a5,8(a5)
     b18:	1782                	slli	a5,a5,0x20
     b1a:	9381                	srli	a5,a5,0x20
     b1c:	0792                	slli	a5,a5,0x4
     b1e:	fe843703          	ld	a4,-24(s0)
     b22:	97ba                	add	a5,a5,a4
     b24:	fe043703          	ld	a4,-32(s0)
     b28:	02f71563          	bne	a4,a5,b52 <free+0x102>
    p->s.size += bp->s.size;
     b2c:	fe843783          	ld	a5,-24(s0)
     b30:	4798                	lw	a4,8(a5)
     b32:	fe043783          	ld	a5,-32(s0)
     b36:	479c                	lw	a5,8(a5)
     b38:	9fb9                	addw	a5,a5,a4
     b3a:	0007871b          	sext.w	a4,a5
     b3e:	fe843783          	ld	a5,-24(s0)
     b42:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     b44:	fe043783          	ld	a5,-32(s0)
     b48:	6398                	ld	a4,0(a5)
     b4a:	fe843783          	ld	a5,-24(s0)
     b4e:	e398                	sd	a4,0(a5)
     b50:	a031                	j	b5c <free+0x10c>
  } else
    p->s.ptr = bp;
     b52:	fe843783          	ld	a5,-24(s0)
     b56:	fe043703          	ld	a4,-32(s0)
     b5a:	e398                	sd	a4,0(a5)
  freep = p;
     b5c:	00001797          	auipc	a5,0x1
     b60:	74478793          	addi	a5,a5,1860 # 22a0 <freep>
     b64:	fe843703          	ld	a4,-24(s0)
     b68:	e398                	sd	a4,0(a5)
}
     b6a:	0001                	nop
     b6c:	7422                	ld	s0,40(sp)
     b6e:	6145                	addi	sp,sp,48
     b70:	8082                	ret

0000000000000b72 <morecore>:

static Header*
morecore(uint nu)
{
     b72:	7179                	addi	sp,sp,-48
     b74:	f406                	sd	ra,40(sp)
     b76:	f022                	sd	s0,32(sp)
     b78:	1800                	addi	s0,sp,48
     b7a:	87aa                	mv	a5,a0
     b7c:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     b80:	fdc42783          	lw	a5,-36(s0)
     b84:	0007871b          	sext.w	a4,a5
     b88:	6785                	lui	a5,0x1
     b8a:	00f77563          	bgeu	a4,a5,b94 <morecore+0x22>
    nu = 4096;
     b8e:	6785                	lui	a5,0x1
     b90:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     b94:	fdc42783          	lw	a5,-36(s0)
     b98:	0047979b          	slliw	a5,a5,0x4
     b9c:	2781                	sext.w	a5,a5
     b9e:	2781                	sext.w	a5,a5
     ba0:	853e                	mv	a0,a5
     ba2:	00000097          	auipc	ra,0x0
     ba6:	9a0080e7          	jalr	-1632(ra) # 542 <sbrk>
     baa:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     bae:	fe843703          	ld	a4,-24(s0)
     bb2:	57fd                	li	a5,-1
     bb4:	00f71463          	bne	a4,a5,bbc <morecore+0x4a>
    return 0;
     bb8:	4781                	li	a5,0
     bba:	a03d                	j	be8 <morecore+0x76>
  hp = (Header*)p;
     bbc:	fe843783          	ld	a5,-24(s0)
     bc0:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     bc4:	fe043783          	ld	a5,-32(s0)
     bc8:	fdc42703          	lw	a4,-36(s0)
     bcc:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     bce:	fe043783          	ld	a5,-32(s0)
     bd2:	07c1                	addi	a5,a5,16
     bd4:	853e                	mv	a0,a5
     bd6:	00000097          	auipc	ra,0x0
     bda:	e7a080e7          	jalr	-390(ra) # a50 <free>
  return freep;
     bde:	00001797          	auipc	a5,0x1
     be2:	6c278793          	addi	a5,a5,1730 # 22a0 <freep>
     be6:	639c                	ld	a5,0(a5)
}
     be8:	853e                	mv	a0,a5
     bea:	70a2                	ld	ra,40(sp)
     bec:	7402                	ld	s0,32(sp)
     bee:	6145                	addi	sp,sp,48
     bf0:	8082                	ret

0000000000000bf2 <malloc>:

void*
malloc(uint nbytes)
{
     bf2:	7139                	addi	sp,sp,-64
     bf4:	fc06                	sd	ra,56(sp)
     bf6:	f822                	sd	s0,48(sp)
     bf8:	0080                	addi	s0,sp,64
     bfa:	87aa                	mv	a5,a0
     bfc:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c00:	fcc46783          	lwu	a5,-52(s0)
     c04:	07bd                	addi	a5,a5,15
     c06:	8391                	srli	a5,a5,0x4
     c08:	2781                	sext.w	a5,a5
     c0a:	2785                	addiw	a5,a5,1
     c0c:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c10:	00001797          	auipc	a5,0x1
     c14:	69078793          	addi	a5,a5,1680 # 22a0 <freep>
     c18:	639c                	ld	a5,0(a5)
     c1a:	fef43023          	sd	a5,-32(s0)
     c1e:	fe043783          	ld	a5,-32(s0)
     c22:	ef95                	bnez	a5,c5e <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     c24:	00001797          	auipc	a5,0x1
     c28:	66c78793          	addi	a5,a5,1644 # 2290 <base>
     c2c:	fef43023          	sd	a5,-32(s0)
     c30:	00001797          	auipc	a5,0x1
     c34:	67078793          	addi	a5,a5,1648 # 22a0 <freep>
     c38:	fe043703          	ld	a4,-32(s0)
     c3c:	e398                	sd	a4,0(a5)
     c3e:	00001797          	auipc	a5,0x1
     c42:	66278793          	addi	a5,a5,1634 # 22a0 <freep>
     c46:	6398                	ld	a4,0(a5)
     c48:	00001797          	auipc	a5,0x1
     c4c:	64878793          	addi	a5,a5,1608 # 2290 <base>
     c50:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     c52:	00001797          	auipc	a5,0x1
     c56:	63e78793          	addi	a5,a5,1598 # 2290 <base>
     c5a:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     c5e:	fe043783          	ld	a5,-32(s0)
     c62:	639c                	ld	a5,0(a5)
     c64:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     c68:	fe843783          	ld	a5,-24(s0)
     c6c:	4798                	lw	a4,8(a5)
     c6e:	fdc42783          	lw	a5,-36(s0)
     c72:	2781                	sext.w	a5,a5
     c74:	06f76863          	bltu	a4,a5,ce4 <malloc+0xf2>
      if(p->s.size == nunits)
     c78:	fe843783          	ld	a5,-24(s0)
     c7c:	4798                	lw	a4,8(a5)
     c7e:	fdc42783          	lw	a5,-36(s0)
     c82:	2781                	sext.w	a5,a5
     c84:	00e79963          	bne	a5,a4,c96 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     c88:	fe843783          	ld	a5,-24(s0)
     c8c:	6398                	ld	a4,0(a5)
     c8e:	fe043783          	ld	a5,-32(s0)
     c92:	e398                	sd	a4,0(a5)
     c94:	a82d                	j	cce <malloc+0xdc>
      else {
        p->s.size -= nunits;
     c96:	fe843783          	ld	a5,-24(s0)
     c9a:	4798                	lw	a4,8(a5)
     c9c:	fdc42783          	lw	a5,-36(s0)
     ca0:	40f707bb          	subw	a5,a4,a5
     ca4:	0007871b          	sext.w	a4,a5
     ca8:	fe843783          	ld	a5,-24(s0)
     cac:	c798                	sw	a4,8(a5)
        p += p->s.size;
     cae:	fe843783          	ld	a5,-24(s0)
     cb2:	479c                	lw	a5,8(a5)
     cb4:	1782                	slli	a5,a5,0x20
     cb6:	9381                	srli	a5,a5,0x20
     cb8:	0792                	slli	a5,a5,0x4
     cba:	fe843703          	ld	a4,-24(s0)
     cbe:	97ba                	add	a5,a5,a4
     cc0:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     cc4:	fe843783          	ld	a5,-24(s0)
     cc8:	fdc42703          	lw	a4,-36(s0)
     ccc:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     cce:	00001797          	auipc	a5,0x1
     cd2:	5d278793          	addi	a5,a5,1490 # 22a0 <freep>
     cd6:	fe043703          	ld	a4,-32(s0)
     cda:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     cdc:	fe843783          	ld	a5,-24(s0)
     ce0:	07c1                	addi	a5,a5,16
     ce2:	a091                	j	d26 <malloc+0x134>
    }
    if(p == freep)
     ce4:	00001797          	auipc	a5,0x1
     ce8:	5bc78793          	addi	a5,a5,1468 # 22a0 <freep>
     cec:	639c                	ld	a5,0(a5)
     cee:	fe843703          	ld	a4,-24(s0)
     cf2:	02f71063          	bne	a4,a5,d12 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     cf6:	fdc42783          	lw	a5,-36(s0)
     cfa:	853e                	mv	a0,a5
     cfc:	00000097          	auipc	ra,0x0
     d00:	e76080e7          	jalr	-394(ra) # b72 <morecore>
     d04:	fea43423          	sd	a0,-24(s0)
     d08:	fe843783          	ld	a5,-24(s0)
     d0c:	e399                	bnez	a5,d12 <malloc+0x120>
        return 0;
     d0e:	4781                	li	a5,0
     d10:	a819                	j	d26 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d12:	fe843783          	ld	a5,-24(s0)
     d16:	fef43023          	sd	a5,-32(s0)
     d1a:	fe843783          	ld	a5,-24(s0)
     d1e:	639c                	ld	a5,0(a5)
     d20:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d24:	b791                	j	c68 <malloc+0x76>
  }
}
     d26:	853e                	mv	a0,a5
     d28:	70e2                	ld	ra,56(sp)
     d2a:	7442                	ld	s0,48(sp)
     d2c:	6121                	addi	sp,sp,64
     d2e:	8082                	ret

0000000000000d30 <setjmp>:
     d30:	e100                	sd	s0,0(a0)
     d32:	e504                	sd	s1,8(a0)
     d34:	01253823          	sd	s2,16(a0)
     d38:	01353c23          	sd	s3,24(a0)
     d3c:	03453023          	sd	s4,32(a0)
     d40:	03553423          	sd	s5,40(a0)
     d44:	03653823          	sd	s6,48(a0)
     d48:	03753c23          	sd	s7,56(a0)
     d4c:	05853023          	sd	s8,64(a0)
     d50:	05953423          	sd	s9,72(a0)
     d54:	05a53823          	sd	s10,80(a0)
     d58:	05b53c23          	sd	s11,88(a0)
     d5c:	06153023          	sd	ra,96(a0)
     d60:	06253423          	sd	sp,104(a0)
     d64:	4501                	li	a0,0
     d66:	8082                	ret

0000000000000d68 <longjmp>:
     d68:	6100                	ld	s0,0(a0)
     d6a:	6504                	ld	s1,8(a0)
     d6c:	01053903          	ld	s2,16(a0)
     d70:	01853983          	ld	s3,24(a0)
     d74:	02053a03          	ld	s4,32(a0)
     d78:	02853a83          	ld	s5,40(a0)
     d7c:	03053b03          	ld	s6,48(a0)
     d80:	03853b83          	ld	s7,56(a0)
     d84:	04053c03          	ld	s8,64(a0)
     d88:	04853c83          	ld	s9,72(a0)
     d8c:	05053d03          	ld	s10,80(a0)
     d90:	05853d83          	ld	s11,88(a0)
     d94:	06053083          	ld	ra,96(a0)
     d98:	06853103          	ld	sp,104(a0)
     d9c:	c199                	beqz	a1,da2 <longjmp_1>
     d9e:	852e                	mv	a0,a1
     da0:	8082                	ret

0000000000000da2 <longjmp_1>:
     da2:	4505                	li	a0,1
     da4:	8082                	ret

0000000000000da6 <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     da6:	7179                	addi	sp,sp,-48
     da8:	f422                	sd	s0,40(sp)
     daa:	1800                	addi	s0,sp,48
     dac:	fea43423          	sd	a0,-24(s0)
     db0:	feb43023          	sd	a1,-32(s0)
     db4:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     db8:	fd843783          	ld	a5,-40(s0)
     dbc:	fe843703          	ld	a4,-24(s0)
     dc0:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     dc2:	fe843783          	ld	a5,-24(s0)
     dc6:	fd843703          	ld	a4,-40(s0)
     dca:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     dcc:	fe843783          	ld	a5,-24(s0)
     dd0:	fe043703          	ld	a4,-32(s0)
     dd4:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     dd6:	fe043783          	ld	a5,-32(s0)
     dda:	fe843703          	ld	a4,-24(s0)
     dde:	e398                	sd	a4,0(a5)
 }
     de0:	0001                	nop
     de2:	7422                	ld	s0,40(sp)
     de4:	6145                	addi	sp,sp,48
     de6:	8082                	ret

0000000000000de8 <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     de8:	1101                	addi	sp,sp,-32
     dea:	ec06                	sd	ra,24(sp)
     dec:	e822                	sd	s0,16(sp)
     dee:	1000                	addi	s0,sp,32
     df0:	fea43423          	sd	a0,-24(s0)
     df4:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     df8:	fe043783          	ld	a5,-32(s0)
     dfc:	679c                	ld	a5,8(a5)
     dfe:	fe043603          	ld	a2,-32(s0)
     e02:	85be                	mv	a1,a5
     e04:	fe843503          	ld	a0,-24(s0)
     e08:	00000097          	auipc	ra,0x0
     e0c:	f9e080e7          	jalr	-98(ra) # da6 <__list_add>
 }
     e10:	0001                	nop
     e12:	60e2                	ld	ra,24(sp)
     e14:	6442                	ld	s0,16(sp)
     e16:	6105                	addi	sp,sp,32
     e18:	8082                	ret

0000000000000e1a <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     e1a:	1101                	addi	sp,sp,-32
     e1c:	ec22                	sd	s0,24(sp)
     e1e:	1000                	addi	s0,sp,32
     e20:	fea43423          	sd	a0,-24(s0)
     e24:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
     e28:	fe043783          	ld	a5,-32(s0)
     e2c:	fe843703          	ld	a4,-24(s0)
     e30:	e798                	sd	a4,8(a5)
     prev->next = next;
     e32:	fe843783          	ld	a5,-24(s0)
     e36:	fe043703          	ld	a4,-32(s0)
     e3a:	e398                	sd	a4,0(a5)
 }
     e3c:	0001                	nop
     e3e:	6462                	ld	s0,24(sp)
     e40:	6105                	addi	sp,sp,32
     e42:	8082                	ret

0000000000000e44 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     e44:	1101                	addi	sp,sp,-32
     e46:	ec06                	sd	ra,24(sp)
     e48:	e822                	sd	s0,16(sp)
     e4a:	1000                	addi	s0,sp,32
     e4c:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
     e50:	fe843783          	ld	a5,-24(s0)
     e54:	6798                	ld	a4,8(a5)
     e56:	fe843783          	ld	a5,-24(s0)
     e5a:	639c                	ld	a5,0(a5)
     e5c:	85be                	mv	a1,a5
     e5e:	853a                	mv	a0,a4
     e60:	00000097          	auipc	ra,0x0
     e64:	fba080e7          	jalr	-70(ra) # e1a <__list_del>
     entry->next = LIST_POISON1;
     e68:	fe843783          	ld	a5,-24(s0)
     e6c:	00100737          	lui	a4,0x100
     e70:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd6b8>
     e74:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
     e76:	fe843783          	ld	a5,-24(s0)
     e7a:	00200737          	lui	a4,0x200
     e7e:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd7b8>
     e82:	e798                	sd	a4,8(a5)
 }
     e84:	0001                	nop
     e86:	60e2                	ld	ra,24(sp)
     e88:	6442                	ld	s0,16(sp)
     e8a:	6105                	addi	sp,sp,32
     e8c:	8082                	ret

0000000000000e8e <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
     e8e:	1101                	addi	sp,sp,-32
     e90:	ec22                	sd	s0,24(sp)
     e92:	1000                	addi	s0,sp,32
     e94:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
     e98:	fe843783          	ld	a5,-24(s0)
     e9c:	639c                	ld	a5,0(a5)
     e9e:	fe843703          	ld	a4,-24(s0)
     ea2:	40f707b3          	sub	a5,a4,a5
     ea6:	0017b793          	seqz	a5,a5
     eaa:	0ff7f793          	andi	a5,a5,255
     eae:	2781                	sext.w	a5,a5
 }
     eb0:	853e                	mv	a0,a5
     eb2:	6462                	ld	s0,24(sp)
     eb4:	6105                	addi	sp,sp,32
     eb6:	8082                	ret

0000000000000eb8 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     eb8:	715d                	addi	sp,sp,-80
     eba:	e486                	sd	ra,72(sp)
     ebc:	e0a2                	sd	s0,64(sp)
     ebe:	0880                	addi	s0,sp,80
     ec0:	fca43423          	sd	a0,-56(s0)
     ec4:	fcb43023          	sd	a1,-64(s0)
     ec8:	85b2                	mv	a1,a2
     eca:	8636                	mv	a2,a3
     ecc:	86ba                	mv	a3,a4
     ece:	873e                	mv	a4,a5
     ed0:	87ae                	mv	a5,a1
     ed2:	faf42e23          	sw	a5,-68(s0)
     ed6:	87b2                	mv	a5,a2
     ed8:	faf42c23          	sw	a5,-72(s0)
     edc:	87b6                	mv	a5,a3
     ede:	faf42a23          	sw	a5,-76(s0)
     ee2:	87ba                	mv	a5,a4
     ee4:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     ee8:	08000513          	li	a0,128
     eec:	00000097          	auipc	ra,0x0
     ef0:	d06080e7          	jalr	-762(ra) # bf2 <malloc>
     ef4:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     ef8:	6505                	lui	a0,0x1
     efa:	00000097          	auipc	ra,0x0
     efe:	cf8080e7          	jalr	-776(ra) # bf2 <malloc>
     f02:	87aa                	mv	a5,a0
     f04:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     f08:	fe043703          	ld	a4,-32(s0)
     f0c:	6785                	lui	a5,0x1
     f0e:	17c1                	addi	a5,a5,-16
     f10:	97ba                	add	a5,a5,a4
     f12:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     f16:	fe843783          	ld	a5,-24(s0)
     f1a:	fc843703          	ld	a4,-56(s0)
     f1e:	e398                	sd	a4,0(a5)
    t->arg = arg;
     f20:	fe843783          	ld	a5,-24(s0)
     f24:	fc043703          	ld	a4,-64(s0)
     f28:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     f2a:	00001797          	auipc	a5,0x1
     f2e:	35a78793          	addi	a5,a5,858 # 2284 <_id.1241>
     f32:	439c                	lw	a5,0(a5)
     f34:	0017871b          	addiw	a4,a5,1
     f38:	0007069b          	sext.w	a3,a4
     f3c:	00001717          	auipc	a4,0x1
     f40:	34870713          	addi	a4,a4,840 # 2284 <_id.1241>
     f44:	c314                	sw	a3,0(a4)
     f46:	fe843703          	ld	a4,-24(s0)
     f4a:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
     f4c:	fe843783          	ld	a5,-24(s0)
     f50:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
     f54:	fe043703          	ld	a4,-32(s0)
     f58:	fe843783          	ld	a5,-24(s0)
     f5c:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
     f5e:	fd843703          	ld	a4,-40(s0)
     f62:	fe843783          	ld	a5,-24(s0)
     f66:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
     f68:	fe843783          	ld	a5,-24(s0)
     f6c:	fb842703          	lw	a4,-72(s0)
     f70:	c3f8                	sw	a4,68(a5)
    t->period = period;
     f72:	fe843783          	ld	a5,-24(s0)
     f76:	fb442703          	lw	a4,-76(s0)
     f7a:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
     f7c:	fe843783          	ld	a5,-24(s0)
     f80:	fb442703          	lw	a4,-76(s0)
     f84:	c7b8                	sw	a4,72(a5)
    t->n = n;
     f86:	fe843783          	ld	a5,-24(s0)
     f8a:	fb042703          	lw	a4,-80(s0)
     f8e:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
     f90:	fe843783          	ld	a5,-24(s0)
     f94:	fbc42703          	lw	a4,-68(s0)
     f98:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
     f9a:	fe843783          	ld	a5,-24(s0)
     f9e:	fb842703          	lw	a4,-72(s0)
     fa2:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
     fa4:	fe843783          	ld	a5,-24(s0)
     fa8:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
     fac:	fe843783          	ld	a5,-24(s0)
     fb0:	06400713          	li	a4,100
     fb4:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
     fb6:	fe843783          	ld	a5,-24(s0)
     fba:	671d                	lui	a4,0x7
     fbc:	5307071b          	addiw	a4,a4,1328
     fc0:	d3b8                	sw	a4,96(a5)
    
    return t;
     fc2:	fe843783          	ld	a5,-24(s0)
}
     fc6:	853e                	mv	a0,a5
     fc8:	60a6                	ld	ra,72(sp)
     fca:	6406                	ld	s0,64(sp)
     fcc:	6161                	addi	sp,sp,80
     fce:	8082                	ret

0000000000000fd0 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
     fd0:	1101                	addi	sp,sp,-32
     fd2:	ec22                	sd	s0,24(sp)
     fd4:	1000                	addi	s0,sp,32
     fd6:	fea43423          	sd	a0,-24(s0)
     fda:	87ae                	mv	a5,a1
     fdc:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
     fe0:	fe843783          	ld	a5,-24(s0)
     fe4:	fe442703          	lw	a4,-28(s0)
     fe8:	cff8                	sw	a4,92(a5)
}
     fea:	0001                	nop
     fec:	6462                	ld	s0,24(sp)
     fee:	6105                	addi	sp,sp,32
     ff0:	8082                	ret

0000000000000ff2 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
     ff2:	1101                	addi	sp,sp,-32
     ff4:	ec22                	sd	s0,24(sp)
     ff6:	1000                	addi	s0,sp,32
     ff8:	fea43423          	sd	a0,-24(s0)
     ffc:	87ae                	mv	a5,a1
     ffe:	8732                	mv	a4,a2
    1000:	fef42223          	sw	a5,-28(s0)
    1004:	87ba                	mv	a5,a4
    1006:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    100a:	fe843783          	ld	a5,-24(s0)
    100e:	fe442703          	lw	a4,-28(s0)
    1012:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    1014:	fe843783          	ld	a5,-24(s0)
    1018:	fe442703          	lw	a4,-28(s0)
    101c:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    101e:	fe843783          	ld	a5,-24(s0)
    1022:	fe042703          	lw	a4,-32(s0)
    1026:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    1028:	fe843783          	ld	a5,-24(s0)
    102c:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1030:	fe843783          	ld	a5,-24(s0)
    1034:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    1038:	fe843783          	ld	a5,-24(s0)
    103c:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    1040:	fe843783          	ld	a5,-24(s0)
    1044:	0607ae23          	sw	zero,124(a5)
}
    1048:	0001                	nop
    104a:	6462                	ld	s0,24(sp)
    104c:	6105                	addi	sp,sp,32
    104e:	8082                	ret

0000000000001050 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    1050:	7179                	addi	sp,sp,-48
    1052:	f406                	sd	ra,40(sp)
    1054:	f022                	sd	s0,32(sp)
    1056:	1800                	addi	s0,sp,48
    1058:	fca43c23          	sd	a0,-40(s0)
    105c:	87ae                	mv	a5,a1
    105e:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    1062:	02000513          	li	a0,32
    1066:	00000097          	auipc	ra,0x0
    106a:	b8c080e7          	jalr	-1140(ra) # bf2 <malloc>
    106e:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    1072:	fe843783          	ld	a5,-24(s0)
    1076:	fd843703          	ld	a4,-40(s0)
    107a:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    107c:	fe843783          	ld	a5,-24(s0)
    1080:	fd442703          	lw	a4,-44(s0)
    1084:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    1086:	fd843783          	ld	a5,-40(s0)
    108a:	fd442703          	lw	a4,-44(s0)
    108e:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    1090:	fd843783          	ld	a5,-40(s0)
    1094:	43bc                	lw	a5,64(a5)
    1096:	cf81                	beqz	a5,10ae <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    1098:	fd843783          	ld	a5,-40(s0)
    109c:	47bc                	lw	a5,72(a5)
    109e:	fd442703          	lw	a4,-44(s0)
    10a2:	9fb9                	addw	a5,a5,a4
    10a4:	0007871b          	sext.w	a4,a5
    10a8:	fd843783          	ld	a5,-40(s0)
    10ac:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    10ae:	fe843783          	ld	a5,-24(s0)
    10b2:	07a1                	addi	a5,a5,8
    10b4:	00001597          	auipc	a1,0x1
    10b8:	1bc58593          	addi	a1,a1,444 # 2270 <release_queue>
    10bc:	853e                	mv	a0,a5
    10be:	00000097          	auipc	ra,0x0
    10c2:	d2a080e7          	jalr	-726(ra) # de8 <list_add_tail>
}
    10c6:	0001                	nop
    10c8:	70a2                	ld	ra,40(sp)
    10ca:	7402                	ld	s0,32(sp)
    10cc:	6145                	addi	sp,sp,48
    10ce:	8082                	ret

00000000000010d0 <__release>:

void __release()
{
    10d0:	7139                	addi	sp,sp,-64
    10d2:	fc06                	sd	ra,56(sp)
    10d4:	f822                	sd	s0,48(sp)
    10d6:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    10d8:	00001797          	auipc	a5,0x1
    10dc:	19878793          	addi	a5,a5,408 # 2270 <release_queue>
    10e0:	639c                	ld	a5,0(a5)
    10e2:	fcf43c23          	sd	a5,-40(s0)
    10e6:	fd843783          	ld	a5,-40(s0)
    10ea:	17e1                	addi	a5,a5,-8
    10ec:	fef43423          	sd	a5,-24(s0)
    10f0:	fe843783          	ld	a5,-24(s0)
    10f4:	679c                	ld	a5,8(a5)
    10f6:	fcf43823          	sd	a5,-48(s0)
    10fa:	fd043783          	ld	a5,-48(s0)
    10fe:	17e1                	addi	a5,a5,-8
    1100:	fef43023          	sd	a5,-32(s0)
    1104:	a0e9                	j	11ce <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    1106:	fe843783          	ld	a5,-24(s0)
    110a:	4f98                	lw	a4,24(a5)
    110c:	00001797          	auipc	a5,0x1
    1110:	1a478793          	addi	a5,a5,420 # 22b0 <threading_system_time>
    1114:	439c                	lw	a5,0(a5)
    1116:	08e7ce63          	blt	a5,a4,11b2 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    111a:	fe843783          	ld	a5,-24(s0)
    111e:	639c                	ld	a5,0(a5)
    1120:	5bbc                	lw	a5,112(a5)
    1122:	c79d                	beqz	a5,1150 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    1124:	fe843783          	ld	a5,-24(s0)
    1128:	639c                	ld	a5,0(a5)
    112a:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    112e:	fe843783          	ld	a5,-24(s0)
    1132:	6398                	ld	a4,0(a5)
    1134:	fe843783          	ld	a5,-24(s0)
    1138:	639c                	ld	a5,0(a5)
    113a:	5378                	lw	a4,100(a4)
    113c:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    113e:	fe843783          	ld	a5,-24(s0)
    1142:	6398                	ld	a4,0(a5)
    1144:	fe843783          	ld	a5,-24(s0)
    1148:	639c                	ld	a5,0(a5)
    114a:	5f78                	lw	a4,124(a4)
    114c:	cbf8                	sw	a4,84(a5)
    114e:	a809                	j	1160 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    1150:	fe843783          	ld	a5,-24(s0)
    1154:	6398                	ld	a4,0(a5)
    1156:	fe843783          	ld	a5,-24(s0)
    115a:	639c                	ld	a5,0(a5)
    115c:	4378                	lw	a4,68(a4)
    115e:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    1160:	fe843783          	ld	a5,-24(s0)
    1164:	4f94                	lw	a3,24(a5)
    1166:	fe843783          	ld	a5,-24(s0)
    116a:	639c                	ld	a5,0(a5)
    116c:	47b8                	lw	a4,72(a5)
    116e:	fe843783          	ld	a5,-24(s0)
    1172:	639c                	ld	a5,0(a5)
    1174:	9f35                	addw	a4,a4,a3
    1176:	2701                	sext.w	a4,a4
    1178:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    117a:	fe843783          	ld	a5,-24(s0)
    117e:	639c                	ld	a5,0(a5)
    1180:	02878793          	addi	a5,a5,40
    1184:	00001597          	auipc	a1,0x1
    1188:	0dc58593          	addi	a1,a1,220 # 2260 <run_queue>
    118c:	853e                	mv	a0,a5
    118e:	00000097          	auipc	ra,0x0
    1192:	c5a080e7          	jalr	-934(ra) # de8 <list_add_tail>
            list_del(&cur->thread_list);
    1196:	fe843783          	ld	a5,-24(s0)
    119a:	07a1                	addi	a5,a5,8
    119c:	853e                	mv	a0,a5
    119e:	00000097          	auipc	ra,0x0
    11a2:	ca6080e7          	jalr	-858(ra) # e44 <list_del>
            free(cur);
    11a6:	fe843503          	ld	a0,-24(s0)
    11aa:	00000097          	auipc	ra,0x0
    11ae:	8a6080e7          	jalr	-1882(ra) # a50 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    11b2:	fe043783          	ld	a5,-32(s0)
    11b6:	fef43423          	sd	a5,-24(s0)
    11ba:	fe043783          	ld	a5,-32(s0)
    11be:	679c                	ld	a5,8(a5)
    11c0:	fcf43423          	sd	a5,-56(s0)
    11c4:	fc843783          	ld	a5,-56(s0)
    11c8:	17e1                	addi	a5,a5,-8
    11ca:	fef43023          	sd	a5,-32(s0)
    11ce:	fe843783          	ld	a5,-24(s0)
    11d2:	00878713          	addi	a4,a5,8
    11d6:	00001797          	auipc	a5,0x1
    11da:	09a78793          	addi	a5,a5,154 # 2270 <release_queue>
    11de:	f2f714e3          	bne	a4,a5,1106 <__release+0x36>
        }
    }
}
    11e2:	0001                	nop
    11e4:	0001                	nop
    11e6:	70e2                	ld	ra,56(sp)
    11e8:	7442                	ld	s0,48(sp)
    11ea:	6121                	addi	sp,sp,64
    11ec:	8082                	ret

00000000000011ee <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    11ee:	1101                	addi	sp,sp,-32
    11f0:	ec06                	sd	ra,24(sp)
    11f2:	e822                	sd	s0,16(sp)
    11f4:	1000                	addi	s0,sp,32
    11f6:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    11fa:	fe843783          	ld	a5,-24(s0)
    11fe:	7b98                	ld	a4,48(a5)
    1200:	00001797          	auipc	a5,0x1
    1204:	0a878793          	addi	a5,a5,168 # 22a8 <current>
    1208:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    120a:	fe843783          	ld	a5,-24(s0)
    120e:	02878793          	addi	a5,a5,40
    1212:	853e                	mv	a0,a5
    1214:	00000097          	auipc	ra,0x0
    1218:	c30080e7          	jalr	-976(ra) # e44 <list_del>

    free(to_remove->stack);
    121c:	fe843783          	ld	a5,-24(s0)
    1220:	6b9c                	ld	a5,16(a5)
    1222:	853e                	mv	a0,a5
    1224:	00000097          	auipc	ra,0x0
    1228:	82c080e7          	jalr	-2004(ra) # a50 <free>
    free(to_remove);
    122c:	fe843503          	ld	a0,-24(s0)
    1230:	00000097          	auipc	ra,0x0
    1234:	820080e7          	jalr	-2016(ra) # a50 <free>

    __schedule();
    1238:	00000097          	auipc	ra,0x0
    123c:	5e8080e7          	jalr	1512(ra) # 1820 <__schedule>
    __dispatch();
    1240:	00000097          	auipc	ra,0x0
    1244:	416080e7          	jalr	1046(ra) # 1656 <__dispatch>
    thrdresume(main_thrd_id);
    1248:	00001797          	auipc	a5,0x1
    124c:	03878793          	addi	a5,a5,56 # 2280 <main_thrd_id>
    1250:	439c                	lw	a5,0(a5)
    1252:	853e                	mv	a0,a5
    1254:	fffff097          	auipc	ra,0xfffff
    1258:	30e080e7          	jalr	782(ra) # 562 <thrdresume>
}
    125c:	0001                	nop
    125e:	60e2                	ld	ra,24(sp)
    1260:	6442                	ld	s0,16(sp)
    1262:	6105                	addi	sp,sp,32
    1264:	8082                	ret

0000000000001266 <thread_exit>:

void thread_exit(void)
{
    1266:	7179                	addi	sp,sp,-48
    1268:	f406                	sd	ra,40(sp)
    126a:	f022                	sd	s0,32(sp)
    126c:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    126e:	00001797          	auipc	a5,0x1
    1272:	03a78793          	addi	a5,a5,58 # 22a8 <current>
    1276:	6398                	ld	a4,0(a5)
    1278:	00001797          	auipc	a5,0x1
    127c:	fe878793          	addi	a5,a5,-24 # 2260 <run_queue>
    1280:	02f71063          	bne	a4,a5,12a0 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    1284:	00001597          	auipc	a1,0x1
    1288:	d4c58593          	addi	a1,a1,-692 # 1fd0 <schedule_edf_cbs+0x4da>
    128c:	4509                	li	a0,2
    128e:	fffff097          	auipc	ra,0xfffff
    1292:	71a080e7          	jalr	1818(ra) # 9a8 <fprintf>
        exit(1);
    1296:	4505                	li	a0,1
    1298:	fffff097          	auipc	ra,0xfffff
    129c:	222080e7          	jalr	546(ra) # 4ba <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    12a0:	00001797          	auipc	a5,0x1
    12a4:	00878793          	addi	a5,a5,8 # 22a8 <current>
    12a8:	639c                	ld	a5,0(a5)
    12aa:	fef43423          	sd	a5,-24(s0)
    12ae:	fe843783          	ld	a5,-24(s0)
    12b2:	fd878793          	addi	a5,a5,-40
    12b6:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    12ba:	fe043783          	ld	a5,-32(s0)
    12be:	5f9c                	lw	a5,56(a5)
    12c0:	4585                	li	a1,1
    12c2:	853e                	mv	a0,a5
    12c4:	fffff097          	auipc	ra,0xfffff
    12c8:	2a6080e7          	jalr	678(ra) # 56a <cancelthrdstop>
    12cc:	87aa                	mv	a5,a0
    12ce:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    12d2:	00001797          	auipc	a5,0x1
    12d6:	fde78793          	addi	a5,a5,-34 # 22b0 <threading_system_time>
    12da:	439c                	lw	a5,0(a5)
    12dc:	fdc42703          	lw	a4,-36(s0)
    12e0:	9fb9                	addw	a5,a5,a4
    12e2:	0007871b          	sext.w	a4,a5
    12e6:	00001797          	auipc	a5,0x1
    12ea:	fca78793          	addi	a5,a5,-54 # 22b0 <threading_system_time>
    12ee:	c398                	sw	a4,0(a5)

    __release();
    12f0:	00000097          	auipc	ra,0x0
    12f4:	de0080e7          	jalr	-544(ra) # 10d0 <__release>
    __thread_exit(to_remove);
    12f8:	fe043503          	ld	a0,-32(s0)
    12fc:	00000097          	auipc	ra,0x0
    1300:	ef2080e7          	jalr	-270(ra) # 11ee <__thread_exit>
}
    1304:	0001                	nop
    1306:	70a2                	ld	ra,40(sp)
    1308:	7402                	ld	s0,32(sp)
    130a:	6145                	addi	sp,sp,48
    130c:	8082                	ret

000000000000130e <__finish_current>:

void __finish_current()
{
    130e:	7179                	addi	sp,sp,-48
    1310:	f406                	sd	ra,40(sp)
    1312:	f022                	sd	s0,32(sp)
    1314:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1316:	00001797          	auipc	a5,0x1
    131a:	f9278793          	addi	a5,a5,-110 # 22a8 <current>
    131e:	639c                	ld	a5,0(a5)
    1320:	fef43423          	sd	a5,-24(s0)
    1324:	fe843783          	ld	a5,-24(s0)
    1328:	fd878793          	addi	a5,a5,-40
    132c:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1330:	fe043783          	ld	a5,-32(s0)
    1334:	4bbc                	lw	a5,80(a5)
    1336:	37fd                	addiw	a5,a5,-1
    1338:	0007871b          	sext.w	a4,a5
    133c:	fe043783          	ld	a5,-32(s0)
    1340:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    1342:	fe043783          	ld	a5,-32(s0)
    1346:	5fd8                	lw	a4,60(a5)
    1348:	00001797          	auipc	a5,0x1
    134c:	f6878793          	addi	a5,a5,-152 # 22b0 <threading_system_time>
    1350:	4390                	lw	a2,0(a5)
    1352:	fe043783          	ld	a5,-32(s0)
    1356:	4bbc                	lw	a5,80(a5)
    1358:	86be                	mv	a3,a5
    135a:	85ba                	mv	a1,a4
    135c:	00001517          	auipc	a0,0x1
    1360:	cac50513          	addi	a0,a0,-852 # 2008 <schedule_edf_cbs+0x512>
    1364:	fffff097          	auipc	ra,0xfffff
    1368:	69c080e7          	jalr	1692(ra) # a00 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    136c:	fe043783          	ld	a5,-32(s0)
    1370:	4bbc                	lw	a5,80(a5)
    1372:	04f05563          	blez	a5,13bc <__finish_current+0xae>
        struct list_head *to_remove = current;
    1376:	00001797          	auipc	a5,0x1
    137a:	f3278793          	addi	a5,a5,-206 # 22a8 <current>
    137e:	639c                	ld	a5,0(a5)
    1380:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1384:	00001797          	auipc	a5,0x1
    1388:	f2478793          	addi	a5,a5,-220 # 22a8 <current>
    138c:	639c                	ld	a5,0(a5)
    138e:	6798                	ld	a4,8(a5)
    1390:	00001797          	auipc	a5,0x1
    1394:	f1878793          	addi	a5,a5,-232 # 22a8 <current>
    1398:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    139a:	fd843503          	ld	a0,-40(s0)
    139e:	00000097          	auipc	ra,0x0
    13a2:	aa6080e7          	jalr	-1370(ra) # e44 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    13a6:	fe043783          	ld	a5,-32(s0)
    13aa:	4fbc                	lw	a5,88(a5)
    13ac:	85be                	mv	a1,a5
    13ae:	fe043503          	ld	a0,-32(s0)
    13b2:	00000097          	auipc	ra,0x0
    13b6:	c9e080e7          	jalr	-866(ra) # 1050 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    13ba:	a039                	j	13c8 <__finish_current+0xba>
        __thread_exit(current_thread);
    13bc:	fe043503          	ld	a0,-32(s0)
    13c0:	00000097          	auipc	ra,0x0
    13c4:	e2e080e7          	jalr	-466(ra) # 11ee <__thread_exit>
}
    13c8:	0001                	nop
    13ca:	70a2                	ld	ra,40(sp)
    13cc:	7402                	ld	s0,32(sp)
    13ce:	6145                	addi	sp,sp,48
    13d0:	8082                	ret

00000000000013d2 <__rt_finish_current>:
void __rt_finish_current()
{
    13d2:	7179                	addi	sp,sp,-48
    13d4:	f406                	sd	ra,40(sp)
    13d6:	f022                	sd	s0,32(sp)
    13d8:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    13da:	00001797          	auipc	a5,0x1
    13de:	ece78793          	addi	a5,a5,-306 # 22a8 <current>
    13e2:	639c                	ld	a5,0(a5)
    13e4:	fef43423          	sd	a5,-24(s0)
    13e8:	fe843783          	ld	a5,-24(s0)
    13ec:	fd878793          	addi	a5,a5,-40
    13f0:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    13f4:	fe043783          	ld	a5,-32(s0)
    13f8:	4bbc                	lw	a5,80(a5)
    13fa:	37fd                	addiw	a5,a5,-1
    13fc:	0007871b          	sext.w	a4,a5
    1400:	fe043783          	ld	a5,-32(s0)
    1404:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    1406:	fe043783          	ld	a5,-32(s0)
    140a:	5fd8                	lw	a4,60(a5)
    140c:	00001797          	auipc	a5,0x1
    1410:	ea478793          	addi	a5,a5,-348 # 22b0 <threading_system_time>
    1414:	4390                	lw	a2,0(a5)
    1416:	fe043783          	ld	a5,-32(s0)
    141a:	4bbc                	lw	a5,80(a5)
    141c:	86be                	mv	a3,a5
    141e:	85ba                	mv	a1,a4
    1420:	00001517          	auipc	a0,0x1
    1424:	c0050513          	addi	a0,a0,-1024 # 2020 <schedule_edf_cbs+0x52a>
    1428:	fffff097          	auipc	ra,0xfffff
    142c:	5d8080e7          	jalr	1496(ra) # a00 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1430:	fe043783          	ld	a5,-32(s0)
    1434:	4bbc                	lw	a5,80(a5)
    1436:	04f05f63          	blez	a5,1494 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    143a:	00001797          	auipc	a5,0x1
    143e:	e6e78793          	addi	a5,a5,-402 # 22a8 <current>
    1442:	639c                	ld	a5,0(a5)
    1444:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1448:	00001797          	auipc	a5,0x1
    144c:	e6078793          	addi	a5,a5,-416 # 22a8 <current>
    1450:	639c                	ld	a5,0(a5)
    1452:	6798                	ld	a4,8(a5)
    1454:	00001797          	auipc	a5,0x1
    1458:	e5478793          	addi	a5,a5,-428 # 22a8 <current>
    145c:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    145e:	fd843503          	ld	a0,-40(s0)
    1462:	00000097          	auipc	ra,0x0
    1466:	9e2080e7          	jalr	-1566(ra) # e44 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    146a:	fe043783          	ld	a5,-32(s0)
    146e:	4fbc                	lw	a5,88(a5)
    1470:	85be                	mv	a1,a5
    1472:	fe043503          	ld	a0,-32(s0)
    1476:	00000097          	auipc	ra,0x0
    147a:	bda080e7          	jalr	-1062(ra) # 1050 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    147e:	fe043783          	ld	a5,-32(s0)
    1482:	57fc                	lw	a5,108(a5)
    1484:	ef91                	bnez	a5,14a0 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    1486:	fe043783          	ld	a5,-32(s0)
    148a:	53f8                	lw	a4,100(a5)
    148c:	fe043783          	ld	a5,-32(s0)
    1490:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    1492:	a039                	j	14a0 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    1494:	fe043503          	ld	a0,-32(s0)
    1498:	00000097          	auipc	ra,0x0
    149c:	d56080e7          	jalr	-682(ra) # 11ee <__thread_exit>
}
    14a0:	0001                	nop
    14a2:	70a2                	ld	ra,40(sp)
    14a4:	7402                	ld	s0,32(sp)
    14a6:	6145                	addi	sp,sp,48
    14a8:	8082                	ret

00000000000014aa <switch_handler>:

void switch_handler(void *arg)
{
    14aa:	7139                	addi	sp,sp,-64
    14ac:	fc06                	sd	ra,56(sp)
    14ae:	f822                	sd	s0,48(sp)
    14b0:	0080                	addi	s0,sp,64
    14b2:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    14b6:	fc843783          	ld	a5,-56(s0)
    14ba:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    14be:	00001797          	auipc	a5,0x1
    14c2:	dea78793          	addi	a5,a5,-534 # 22a8 <current>
    14c6:	639c                	ld	a5,0(a5)
    14c8:	fef43023          	sd	a5,-32(s0)
    14cc:	fe043783          	ld	a5,-32(s0)
    14d0:	fd878793          	addi	a5,a5,-40
    14d4:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    14d8:	fe843783          	ld	a5,-24(s0)
    14dc:	0007871b          	sext.w	a4,a5
    14e0:	00001797          	auipc	a5,0x1
    14e4:	dd078793          	addi	a5,a5,-560 # 22b0 <threading_system_time>
    14e8:	439c                	lw	a5,0(a5)
    14ea:	2781                	sext.w	a5,a5
    14ec:	9fb9                	addw	a5,a5,a4
    14ee:	2781                	sext.w	a5,a5
    14f0:	0007871b          	sext.w	a4,a5
    14f4:	00001797          	auipc	a5,0x1
    14f8:	dbc78793          	addi	a5,a5,-580 # 22b0 <threading_system_time>
    14fc:	c398                	sw	a4,0(a5)
     __release();
    14fe:	00000097          	auipc	ra,0x0
    1502:	bd2080e7          	jalr	-1070(ra) # 10d0 <__release>
    current_thread->remaining_time -= elapsed_time;
    1506:	fd843783          	ld	a5,-40(s0)
    150a:	4bfc                	lw	a5,84(a5)
    150c:	0007871b          	sext.w	a4,a5
    1510:	fe843783          	ld	a5,-24(s0)
    1514:	2781                	sext.w	a5,a5
    1516:	40f707bb          	subw	a5,a4,a5
    151a:	2781                	sext.w	a5,a5
    151c:	0007871b          	sext.w	a4,a5
    1520:	fd843783          	ld	a5,-40(s0)
    1524:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    1526:	fd843783          	ld	a5,-40(s0)
    152a:	57fc                	lw	a5,108(a5)
    152c:	e38d                	bnez	a5,154e <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    152e:	fd843783          	ld	a5,-40(s0)
    1532:	57bc                	lw	a5,104(a5)
    1534:	0007871b          	sext.w	a4,a5
    1538:	fe843783          	ld	a5,-24(s0)
    153c:	2781                	sext.w	a5,a5
    153e:	40f707bb          	subw	a5,a4,a5
    1542:	2781                	sext.w	a5,a5
    1544:	0007871b          	sext.w	a4,a5
    1548:	fd843783          	ld	a5,-40(s0)
    154c:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    154e:	fd843783          	ld	a5,-40(s0)
    1552:	43bc                	lw	a5,64(a5)
    1554:	c3ad                	beqz	a5,15b6 <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    1556:	fd843783          	ld	a5,-40(s0)
    155a:	4fb8                	lw	a4,88(a5)
    155c:	00001797          	auipc	a5,0x1
    1560:	d5478793          	addi	a5,a5,-684 # 22b0 <threading_system_time>
    1564:	439c                	lw	a5,0(a5)
    1566:	02f74163          	blt	a4,a5,1588 <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    156a:	fd843783          	ld	a5,-40(s0)
    156e:	4fb8                	lw	a4,88(a5)
    1570:	00001797          	auipc	a5,0x1
    1574:	d4078793          	addi	a5,a5,-704 # 22b0 <threading_system_time>
    1578:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    157a:	02f71e63          	bne	a4,a5,15b6 <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    157e:	fd843783          	ld	a5,-40(s0)
    1582:	4bfc                	lw	a5,84(a5)
    1584:	02f05963          	blez	a5,15b6 <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    1588:	fd843783          	ld	a5,-40(s0)
    158c:	5fd8                	lw	a4,60(a5)
    158e:	00001797          	auipc	a5,0x1
    1592:	d2278793          	addi	a5,a5,-734 # 22b0 <threading_system_time>
    1596:	439c                	lw	a5,0(a5)
    1598:	863e                	mv	a2,a5
    159a:	85ba                	mv	a1,a4
    159c:	00001517          	auipc	a0,0x1
    15a0:	abc50513          	addi	a0,a0,-1348 # 2058 <schedule_edf_cbs+0x562>
    15a4:	fffff097          	auipc	ra,0xfffff
    15a8:	45c080e7          	jalr	1116(ra) # a00 <printf>
            exit(0);
    15ac:	4501                	li	a0,0
    15ae:	fffff097          	auipc	ra,0xfffff
    15b2:	f0c080e7          	jalr	-244(ra) # 4ba <exit>
        }

    if (current_thread->remaining_time <= 0) {
    15b6:	fd843783          	ld	a5,-40(s0)
    15ba:	4bfc                	lw	a5,84(a5)
    15bc:	02f04063          	bgtz	a5,15dc <switch_handler+0x132>
        if (current_thread->is_real_time)
    15c0:	fd843783          	ld	a5,-40(s0)
    15c4:	43bc                	lw	a5,64(a5)
    15c6:	c791                	beqz	a5,15d2 <switch_handler+0x128>
            __rt_finish_current();
    15c8:	00000097          	auipc	ra,0x0
    15cc:	e0a080e7          	jalr	-502(ra) # 13d2 <__rt_finish_current>
    15d0:	a881                	j	1620 <switch_handler+0x176>
        else
            __finish_current();
    15d2:	00000097          	auipc	ra,0x0
    15d6:	d3c080e7          	jalr	-708(ra) # 130e <__finish_current>
    15da:	a099                	j	1620 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    15dc:	00001797          	auipc	a5,0x1
    15e0:	ccc78793          	addi	a5,a5,-820 # 22a8 <current>
    15e4:	639c                	ld	a5,0(a5)
    15e6:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    15ea:	00001797          	auipc	a5,0x1
    15ee:	cbe78793          	addi	a5,a5,-834 # 22a8 <current>
    15f2:	639c                	ld	a5,0(a5)
    15f4:	6798                	ld	a4,8(a5)
    15f6:	00001797          	auipc	a5,0x1
    15fa:	cb278793          	addi	a5,a5,-846 # 22a8 <current>
    15fe:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1600:	fd043503          	ld	a0,-48(s0)
    1604:	00000097          	auipc	ra,0x0
    1608:	840080e7          	jalr	-1984(ra) # e44 <list_del>
        list_add_tail(to_remove, &run_queue);
    160c:	00001597          	auipc	a1,0x1
    1610:	c5458593          	addi	a1,a1,-940 # 2260 <run_queue>
    1614:	fd043503          	ld	a0,-48(s0)
    1618:	fffff097          	auipc	ra,0xfffff
    161c:	7d0080e7          	jalr	2000(ra) # de8 <list_add_tail>
    }

    __release();
    1620:	00000097          	auipc	ra,0x0
    1624:	ab0080e7          	jalr	-1360(ra) # 10d0 <__release>
    __schedule();
    1628:	00000097          	auipc	ra,0x0
    162c:	1f8080e7          	jalr	504(ra) # 1820 <__schedule>
    __dispatch();
    1630:	00000097          	auipc	ra,0x0
    1634:	026080e7          	jalr	38(ra) # 1656 <__dispatch>
    thrdresume(main_thrd_id);
    1638:	00001797          	auipc	a5,0x1
    163c:	c4878793          	addi	a5,a5,-952 # 2280 <main_thrd_id>
    1640:	439c                	lw	a5,0(a5)
    1642:	853e                	mv	a0,a5
    1644:	fffff097          	auipc	ra,0xfffff
    1648:	f1e080e7          	jalr	-226(ra) # 562 <thrdresume>
}
    164c:	0001                	nop
    164e:	70e2                	ld	ra,56(sp)
    1650:	7442                	ld	s0,48(sp)
    1652:	6121                	addi	sp,sp,64
    1654:	8082                	ret

0000000000001656 <__dispatch>:

void __dispatch()
{
    1656:	7179                	addi	sp,sp,-48
    1658:	f406                	sd	ra,40(sp)
    165a:	f022                	sd	s0,32(sp)
    165c:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    165e:	00001797          	auipc	a5,0x1
    1662:	c4a78793          	addi	a5,a5,-950 # 22a8 <current>
    1666:	6398                	ld	a4,0(a5)
    1668:	00001797          	auipc	a5,0x1
    166c:	bf878793          	addi	a5,a5,-1032 # 2260 <run_queue>
    1670:	1af70363          	beq	a4,a5,1816 <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1674:	00001797          	auipc	a5,0x1
    1678:	c3478793          	addi	a5,a5,-972 # 22a8 <current>
    167c:	639c                	ld	a5,0(a5)
    167e:	fef43423          	sd	a5,-24(s0)
    1682:	fe843783          	ld	a5,-24(s0)
    1686:	fd878793          	addi	a5,a5,-40
    168a:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    168e:	fe043783          	ld	a5,-32(s0)
    1692:	5fcc                	lw	a1,60(a5)
    1694:	00001797          	auipc	a5,0x1
    1698:	c1c78793          	addi	a5,a5,-996 # 22b0 <threading_system_time>
    169c:	4390                	lw	a2,0(a5)
    169e:	00001797          	auipc	a5,0x1
    16a2:	c1a78793          	addi	a5,a5,-998 # 22b8 <allocated_time>
    16a6:	6394                	ld	a3,0(a5)
    16a8:	fe043783          	ld	a5,-32(s0)
    16ac:	4bfc                	lw	a5,84(a5)
    16ae:	873e                	mv	a4,a5
    16b0:	00001517          	auipc	a0,0x1
    16b4:	9d850513          	addi	a0,a0,-1576 # 2088 <schedule_edf_cbs+0x592>
    16b8:	fffff097          	auipc	ra,0xfffff
    16bc:	348080e7          	jalr	840(ra) # a00 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    16c0:	fe043783          	ld	a5,-32(s0)
    16c4:	43bc                	lw	a5,64(a5)
    16c6:	c3a1                	beqz	a5,1706 <__dispatch+0xb0>
    16c8:	00001797          	auipc	a5,0x1
    16cc:	bf078793          	addi	a5,a5,-1040 # 22b8 <allocated_time>
    16d0:	639c                	ld	a5,0(a5)
    16d2:	eb95                	bnez	a5,1706 <__dispatch+0xb0>
    16d4:	fe043783          	ld	a5,-32(s0)
    16d8:	57fc                	lw	a5,108(a5)
    16da:	c795                	beqz	a5,1706 <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    16dc:	fe043783          	ld	a5,-32(s0)
    16e0:	5fd8                	lw	a4,60(a5)
    16e2:	fe043783          	ld	a5,-32(s0)
    16e6:	4fbc                	lw	a5,88(a5)
    16e8:	863e                	mv	a2,a5
    16ea:	85ba                	mv	a1,a4
    16ec:	00001517          	auipc	a0,0x1
    16f0:	9ec50513          	addi	a0,a0,-1556 # 20d8 <schedule_edf_cbs+0x5e2>
    16f4:	fffff097          	auipc	ra,0xfffff
    16f8:	30c080e7          	jalr	780(ra) # a00 <printf>
        exit(0);
    16fc:	4501                	li	a0,0
    16fe:	fffff097          	auipc	ra,0xfffff
    1702:	dbc080e7          	jalr	-580(ra) # 4ba <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    1706:	fe043783          	ld	a5,-32(s0)
    170a:	5fd8                	lw	a4,60(a5)
    170c:	00001797          	auipc	a5,0x1
    1710:	ba478793          	addi	a5,a5,-1116 # 22b0 <threading_system_time>
    1714:	4390                	lw	a2,0(a5)
    1716:	00001797          	auipc	a5,0x1
    171a:	ba278793          	addi	a5,a5,-1118 # 22b8 <allocated_time>
    171e:	639c                	ld	a5,0(a5)
    1720:	86be                	mv	a3,a5
    1722:	85ba                	mv	a1,a4
    1724:	00001517          	auipc	a0,0x1
    1728:	9e450513          	addi	a0,a0,-1564 # 2108 <schedule_edf_cbs+0x612>
    172c:	fffff097          	auipc	ra,0xfffff
    1730:	2d4080e7          	jalr	724(ra) # a00 <printf>

    if (current_thread->buf_set) {
    1734:	fe043783          	ld	a5,-32(s0)
    1738:	539c                	lw	a5,32(a5)
    173a:	c7a1                	beqz	a5,1782 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    173c:	00001797          	auipc	a5,0x1
    1740:	b7c78793          	addi	a5,a5,-1156 # 22b8 <allocated_time>
    1744:	639c                	ld	a5,0(a5)
    1746:	0007871b          	sext.w	a4,a5
    174a:	fe043783          	ld	a5,-32(s0)
    174e:	03878593          	addi	a1,a5,56
    1752:	00001797          	auipc	a5,0x1
    1756:	b6678793          	addi	a5,a5,-1178 # 22b8 <allocated_time>
    175a:	639c                	ld	a5,0(a5)
    175c:	86be                	mv	a3,a5
    175e:	00000617          	auipc	a2,0x0
    1762:	d4c60613          	addi	a2,a2,-692 # 14aa <switch_handler>
    1766:	853a                	mv	a0,a4
    1768:	fffff097          	auipc	ra,0xfffff
    176c:	df2080e7          	jalr	-526(ra) # 55a <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    1770:	fe043783          	ld	a5,-32(s0)
    1774:	5f9c                	lw	a5,56(a5)
    1776:	853e                	mv	a0,a5
    1778:	fffff097          	auipc	ra,0xfffff
    177c:	dea080e7          	jalr	-534(ra) # 562 <thrdresume>
    1780:	a071                	j	180c <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    1782:	fe043783          	ld	a5,-32(s0)
    1786:	4705                	li	a4,1
    1788:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    178a:	fe043783          	ld	a5,-32(s0)
    178e:	6f9c                	ld	a5,24(a5)
    1790:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1794:	fe043783          	ld	a5,-32(s0)
    1798:	577d                	li	a4,-1
    179a:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    179c:	00001797          	auipc	a5,0x1
    17a0:	b1c78793          	addi	a5,a5,-1252 # 22b8 <allocated_time>
    17a4:	639c                	ld	a5,0(a5)
    17a6:	0007871b          	sext.w	a4,a5
    17aa:	fe043783          	ld	a5,-32(s0)
    17ae:	03878593          	addi	a1,a5,56
    17b2:	00001797          	auipc	a5,0x1
    17b6:	b0678793          	addi	a5,a5,-1274 # 22b8 <allocated_time>
    17ba:	639c                	ld	a5,0(a5)
    17bc:	86be                	mv	a3,a5
    17be:	00000617          	auipc	a2,0x0
    17c2:	cec60613          	addi	a2,a2,-788 # 14aa <switch_handler>
    17c6:	853a                	mv	a0,a4
    17c8:	fffff097          	auipc	ra,0xfffff
    17cc:	d92080e7          	jalr	-622(ra) # 55a <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    17d0:	fe043783          	ld	a5,-32(s0)
    17d4:	5f9c                	lw	a5,56(a5)
    17d6:	0207d063          	bgez	a5,17f6 <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    17da:	00001597          	auipc	a1,0x1
    17de:	95e58593          	addi	a1,a1,-1698 # 2138 <schedule_edf_cbs+0x642>
    17e2:	4509                	li	a0,2
    17e4:	fffff097          	auipc	ra,0xfffff
    17e8:	1c4080e7          	jalr	452(ra) # 9a8 <fprintf>
            exit(1);
    17ec:	4505                	li	a0,1
    17ee:	fffff097          	auipc	ra,0xfffff
    17f2:	ccc080e7          	jalr	-820(ra) # 4ba <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    17f6:	fd843783          	ld	a5,-40(s0)
    17fa:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    17fc:	fe043783          	ld	a5,-32(s0)
    1800:	6398                	ld	a4,0(a5)
    1802:	fe043783          	ld	a5,-32(s0)
    1806:	679c                	ld	a5,8(a5)
    1808:	853e                	mv	a0,a5
    180a:	9702                	jalr	a4
    }
    thread_exit();
    180c:	00000097          	auipc	ra,0x0
    1810:	a5a080e7          	jalr	-1446(ra) # 1266 <thread_exit>
    1814:	a011                	j	1818 <__dispatch+0x1c2>
        return;
    1816:	0001                	nop
}
    1818:	70a2                	ld	ra,40(sp)
    181a:	7402                	ld	s0,32(sp)
    181c:	6145                	addi	sp,sp,48
    181e:	8082                	ret

0000000000001820 <__schedule>:

void __schedule()
{
    1820:	711d                	addi	sp,sp,-96
    1822:	ec86                	sd	ra,88(sp)
    1824:	e8a2                	sd	s0,80(sp)
    1826:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    1828:	00001797          	auipc	a5,0x1
    182c:	a8878793          	addi	a5,a5,-1400 # 22b0 <threading_system_time>
    1830:	439c                	lw	a5,0(a5)
    1832:	fcf42c23          	sw	a5,-40(s0)
    1836:	4789                	li	a5,2
    1838:	fcf42e23          	sw	a5,-36(s0)
    183c:	00001797          	auipc	a5,0x1
    1840:	a2478793          	addi	a5,a5,-1500 # 2260 <run_queue>
    1844:	fef43023          	sd	a5,-32(s0)
    1848:	00001797          	auipc	a5,0x1
    184c:	a2878793          	addi	a5,a5,-1496 # 2270 <release_queue>
    1850:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    1854:	fd843783          	ld	a5,-40(s0)
    1858:	faf43023          	sd	a5,-96(s0)
    185c:	fe043783          	ld	a5,-32(s0)
    1860:	faf43423          	sd	a5,-88(s0)
    1864:	fe843783          	ld	a5,-24(s0)
    1868:	faf43823          	sd	a5,-80(s0)
    186c:	fa040793          	addi	a5,s0,-96
    1870:	853e                	mv	a0,a5
    1872:	00000097          	auipc	ra,0x0
    1876:	284080e7          	jalr	644(ra) # 1af6 <schedule_edf_cbs>
    187a:	872a                	mv	a4,a0
    187c:	87ae                	mv	a5,a1
    187e:	fce43423          	sd	a4,-56(s0)
    1882:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    1886:	fc843703          	ld	a4,-56(s0)
    188a:	00001797          	auipc	a5,0x1
    188e:	a1e78793          	addi	a5,a5,-1506 # 22a8 <current>
    1892:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1894:	fd042783          	lw	a5,-48(s0)
    1898:	873e                	mv	a4,a5
    189a:	00001797          	auipc	a5,0x1
    189e:	a1e78793          	addi	a5,a5,-1506 # 22b8 <allocated_time>
    18a2:	e398                	sd	a4,0(a5)
}
    18a4:	0001                	nop
    18a6:	60e6                	ld	ra,88(sp)
    18a8:	6446                	ld	s0,80(sp)
    18aa:	6125                	addi	sp,sp,96
    18ac:	8082                	ret

00000000000018ae <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    18ae:	1101                	addi	sp,sp,-32
    18b0:	ec06                	sd	ra,24(sp)
    18b2:	e822                	sd	s0,16(sp)
    18b4:	1000                	addi	s0,sp,32
    18b6:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    18ba:	00001797          	auipc	a5,0x1
    18be:	9fa78793          	addi	a5,a5,-1542 # 22b4 <sleeping>
    18c2:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    18c6:	fe843783          	ld	a5,-24(s0)
    18ca:	0007871b          	sext.w	a4,a5
    18ce:	00001797          	auipc	a5,0x1
    18d2:	9e278793          	addi	a5,a5,-1566 # 22b0 <threading_system_time>
    18d6:	439c                	lw	a5,0(a5)
    18d8:	2781                	sext.w	a5,a5
    18da:	9fb9                	addw	a5,a5,a4
    18dc:	2781                	sext.w	a5,a5
    18de:	0007871b          	sext.w	a4,a5
    18e2:	00001797          	auipc	a5,0x1
    18e6:	9ce78793          	addi	a5,a5,-1586 # 22b0 <threading_system_time>
    18ea:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    18ec:	00001797          	auipc	a5,0x1
    18f0:	99478793          	addi	a5,a5,-1644 # 2280 <main_thrd_id>
    18f4:	439c                	lw	a5,0(a5)
    18f6:	853e                	mv	a0,a5
    18f8:	fffff097          	auipc	ra,0xfffff
    18fc:	c6a080e7          	jalr	-918(ra) # 562 <thrdresume>
}
    1900:	0001                	nop
    1902:	60e2                	ld	ra,24(sp)
    1904:	6442                	ld	s0,16(sp)
    1906:	6105                	addi	sp,sp,32
    1908:	8082                	ret

000000000000190a <thread_start_threading>:

void thread_start_threading()
{
    190a:	1141                	addi	sp,sp,-16
    190c:	e406                	sd	ra,8(sp)
    190e:	e022                	sd	s0,0(sp)
    1910:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1912:	00001797          	auipc	a5,0x1
    1916:	99e78793          	addi	a5,a5,-1634 # 22b0 <threading_system_time>
    191a:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    191e:	00001797          	auipc	a5,0x1
    1922:	98a78793          	addi	a5,a5,-1654 # 22a8 <current>
    1926:	00001717          	auipc	a4,0x1
    192a:	93a70713          	addi	a4,a4,-1734 # 2260 <run_queue>
    192e:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1930:	4681                	li	a3,0
    1932:	00000617          	auipc	a2,0x0
    1936:	f7c60613          	addi	a2,a2,-132 # 18ae <back_to_main_handler>
    193a:	00001597          	auipc	a1,0x1
    193e:	94658593          	addi	a1,a1,-1722 # 2280 <main_thrd_id>
    1942:	3e800513          	li	a0,1000
    1946:	fffff097          	auipc	ra,0xfffff
    194a:	c14080e7          	jalr	-1004(ra) # 55a <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    194e:	00001797          	auipc	a5,0x1
    1952:	93278793          	addi	a5,a5,-1742 # 2280 <main_thrd_id>
    1956:	439c                	lw	a5,0(a5)
    1958:	4581                	li	a1,0
    195a:	853e                	mv	a0,a5
    195c:	fffff097          	auipc	ra,0xfffff
    1960:	c0e080e7          	jalr	-1010(ra) # 56a <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1964:	a0c9                	j	1a26 <thread_start_threading+0x11c>
        __release();
    1966:	fffff097          	auipc	ra,0xfffff
    196a:	76a080e7          	jalr	1898(ra) # 10d0 <__release>
        __schedule();
    196e:	00000097          	auipc	ra,0x0
    1972:	eb2080e7          	jalr	-334(ra) # 1820 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1976:	00001797          	auipc	a5,0x1
    197a:	90a78793          	addi	a5,a5,-1782 # 2280 <main_thrd_id>
    197e:	439c                	lw	a5,0(a5)
    1980:	4581                	li	a1,0
    1982:	853e                	mv	a0,a5
    1984:	fffff097          	auipc	ra,0xfffff
    1988:	be6080e7          	jalr	-1050(ra) # 56a <cancelthrdstop>
        __dispatch();
    198c:	00000097          	auipc	ra,0x0
    1990:	cca080e7          	jalr	-822(ra) # 1656 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1994:	00001517          	auipc	a0,0x1
    1998:	8cc50513          	addi	a0,a0,-1844 # 2260 <run_queue>
    199c:	fffff097          	auipc	ra,0xfffff
    19a0:	4f2080e7          	jalr	1266(ra) # e8e <list_empty>
    19a4:	87aa                	mv	a5,a0
    19a6:	cb99                	beqz	a5,19bc <thread_start_threading+0xb2>
    19a8:	00001517          	auipc	a0,0x1
    19ac:	8c850513          	addi	a0,a0,-1848 # 2270 <release_queue>
    19b0:	fffff097          	auipc	ra,0xfffff
    19b4:	4de080e7          	jalr	1246(ra) # e8e <list_empty>
    19b8:	87aa                	mv	a5,a0
    19ba:	ebd9                	bnez	a5,1a50 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    19bc:	00001797          	auipc	a5,0x1
    19c0:	8fc78793          	addi	a5,a5,-1796 # 22b8 <allocated_time>
    19c4:	639c                	ld	a5,0(a5)
    19c6:	85be                	mv	a1,a5
    19c8:	00000517          	auipc	a0,0x0
    19cc:	7a850513          	addi	a0,a0,1960 # 2170 <schedule_edf_cbs+0x67a>
    19d0:	fffff097          	auipc	ra,0xfffff
    19d4:	030080e7          	jalr	48(ra) # a00 <printf>
        sleeping = 1;
    19d8:	00001797          	auipc	a5,0x1
    19dc:	8dc78793          	addi	a5,a5,-1828 # 22b4 <sleeping>
    19e0:	4705                	li	a4,1
    19e2:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    19e4:	00001797          	auipc	a5,0x1
    19e8:	8d478793          	addi	a5,a5,-1836 # 22b8 <allocated_time>
    19ec:	639c                	ld	a5,0(a5)
    19ee:	0007871b          	sext.w	a4,a5
    19f2:	00001797          	auipc	a5,0x1
    19f6:	8c678793          	addi	a5,a5,-1850 # 22b8 <allocated_time>
    19fa:	639c                	ld	a5,0(a5)
    19fc:	86be                	mv	a3,a5
    19fe:	00000617          	auipc	a2,0x0
    1a02:	eb060613          	addi	a2,a2,-336 # 18ae <back_to_main_handler>
    1a06:	00001597          	auipc	a1,0x1
    1a0a:	87a58593          	addi	a1,a1,-1926 # 2280 <main_thrd_id>
    1a0e:	853a                	mv	a0,a4
    1a10:	fffff097          	auipc	ra,0xfffff
    1a14:	b4a080e7          	jalr	-1206(ra) # 55a <thrdstop>
        while (sleeping) {
    1a18:	0001                	nop
    1a1a:	00001797          	auipc	a5,0x1
    1a1e:	89a78793          	addi	a5,a5,-1894 # 22b4 <sleeping>
    1a22:	439c                	lw	a5,0(a5)
    1a24:	fbfd                	bnez	a5,1a1a <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1a26:	00001517          	auipc	a0,0x1
    1a2a:	83a50513          	addi	a0,a0,-1990 # 2260 <run_queue>
    1a2e:	fffff097          	auipc	ra,0xfffff
    1a32:	460080e7          	jalr	1120(ra) # e8e <list_empty>
    1a36:	87aa                	mv	a5,a0
    1a38:	d79d                	beqz	a5,1966 <thread_start_threading+0x5c>
    1a3a:	00001517          	auipc	a0,0x1
    1a3e:	83650513          	addi	a0,a0,-1994 # 2270 <release_queue>
    1a42:	fffff097          	auipc	ra,0xfffff
    1a46:	44c080e7          	jalr	1100(ra) # e8e <list_empty>
    1a4a:	87aa                	mv	a5,a0
    1a4c:	df89                	beqz	a5,1966 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1a4e:	a011                	j	1a52 <thread_start_threading+0x148>
            break;
    1a50:	0001                	nop
}
    1a52:	0001                	nop
    1a54:	60a2                	ld	ra,8(sp)
    1a56:	6402                	ld	s0,0(sp)
    1a58:	0141                	addi	sp,sp,16
    1a5a:	8082                	ret

0000000000001a5c <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1a5c:	7139                	addi	sp,sp,-64
    1a5e:	fc22                	sd	s0,56(sp)
    1a60:	0080                	addi	s0,sp,64
    1a62:	fca43423          	sd	a0,-56(s0)
    1a66:	87ae                	mv	a5,a1
    1a68:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1a6c:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1a70:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1a74:	fc843783          	ld	a5,-56(s0)
    1a78:	639c                	ld	a5,0(a5)
    1a7a:	fcf43c23          	sd	a5,-40(s0)
    1a7e:	fd843783          	ld	a5,-40(s0)
    1a82:	fd878793          	addi	a5,a5,-40
    1a86:	fef43423          	sd	a5,-24(s0)
    1a8a:	a881                	j	1ada <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1a8c:	fe843783          	ld	a5,-24(s0)
    1a90:	4fb8                	lw	a4,88(a5)
    1a92:	fc442783          	lw	a5,-60(s0)
    1a96:	2781                	sext.w	a5,a5
    1a98:	02e7c663          	blt	a5,a4,1ac4 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1a9c:	fe043783          	ld	a5,-32(s0)
    1aa0:	e791                	bnez	a5,1aac <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1aa2:	fe843783          	ld	a5,-24(s0)
    1aa6:	fef43023          	sd	a5,-32(s0)
    1aaa:	a829                	j	1ac4 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1aac:	fe843783          	ld	a5,-24(s0)
    1ab0:	5fd8                	lw	a4,60(a5)
    1ab2:	fe043783          	ld	a5,-32(s0)
    1ab6:	5fdc                	lw	a5,60(a5)
    1ab8:	00f75663          	bge	a4,a5,1ac4 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1abc:	fe843783          	ld	a5,-24(s0)
    1ac0:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1ac4:	fe843783          	ld	a5,-24(s0)
    1ac8:	779c                	ld	a5,40(a5)
    1aca:	fcf43823          	sd	a5,-48(s0)
    1ace:	fd043783          	ld	a5,-48(s0)
    1ad2:	fd878793          	addi	a5,a5,-40
    1ad6:	fef43423          	sd	a5,-24(s0)
    1ada:	fe843783          	ld	a5,-24(s0)
    1ade:	02878793          	addi	a5,a5,40
    1ae2:	fc843703          	ld	a4,-56(s0)
    1ae6:	faf713e3          	bne	a4,a5,1a8c <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1aea:	fe043783          	ld	a5,-32(s0)
}
    1aee:	853e                	mv	a0,a5
    1af0:	7462                	ld	s0,56(sp)
    1af2:	6121                	addi	sp,sp,64
    1af4:	8082                	ret

0000000000001af6 <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1af6:	7131                	addi	sp,sp,-192
    1af8:	fd06                	sd	ra,184(sp)
    1afa:	f922                	sd	s0,176(sp)
    1afc:	f526                	sd	s1,168(sp)
    1afe:	f14a                	sd	s2,160(sp)
    1b00:	ed4e                	sd	s3,152(sp)
    1b02:	0180                	addi	s0,sp,192
    1b04:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1b06:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1b0a:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1b0e:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1b12:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1b16:	649c                	ld	a5,8(s1)
    1b18:	4098                	lw	a4,0(s1)
    1b1a:	85ba                	mv	a1,a4
    1b1c:	853e                	mv	a0,a5
    1b1e:	00000097          	auipc	ra,0x0
    1b22:	f3e080e7          	jalr	-194(ra) # 1a5c <__check_deadline_miss>
    1b26:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1b2a:	f9843783          	ld	a5,-104(s0)
    1b2e:	c7b5                	beqz	a5,1b9a <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1b30:	f9843783          	ld	a5,-104(s0)
    1b34:	5fdc                	lw	a5,60(a5)
    1b36:	85be                	mv	a1,a5
    1b38:	00000517          	auipc	a0,0x0
    1b3c:	66050513          	addi	a0,a0,1632 # 2198 <schedule_edf_cbs+0x6a2>
    1b40:	fffff097          	auipc	ra,0xfffff
    1b44:	ec0080e7          	jalr	-320(ra) # a00 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1b48:	f9843783          	ld	a5,-104(s0)
    1b4c:	57fc                	lw	a5,108(a5)
    1b4e:	c395                	beqz	a5,1b72 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1b50:	f9843783          	ld	a5,-104(s0)
    1b54:	02878793          	addi	a5,a5,40
    1b58:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1b5c:	f4042423          	sw	zero,-184(s0)
            return r;
    1b60:	f4043783          	ld	a5,-192(s0)
    1b64:	f4f43823          	sd	a5,-176(s0)
    1b68:	f4843783          	ld	a5,-184(s0)
    1b6c:	f4f43c23          	sd	a5,-168(s0)
    1b70:	a13d                	j	1f9e <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1b72:	4098                	lw	a4,0(s1)
    1b74:	f9843783          	ld	a5,-104(s0)
    1b78:	47fc                	lw	a5,76(a5)
    1b7a:	9fb9                	addw	a5,a5,a4
    1b7c:	0007871b          	sext.w	a4,a5
    1b80:	f9843783          	ld	a5,-104(s0)
    1b84:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1b86:	f9843783          	ld	a5,-104(s0)
    1b8a:	53f8                	lw	a4,100(a5)
    1b8c:	f9843783          	ld	a5,-104(s0)
    1b90:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1b92:	f9843783          	ld	a5,-104(s0)
    1b96:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1b9a:	fa043783          	ld	a5,-96(s0)
    1b9e:	e7dd                	bnez	a5,1c4c <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1ba0:	649c                	ld	a5,8(s1)
    1ba2:	639c                	ld	a5,0(a5)
    1ba4:	f8f43823          	sd	a5,-112(s0)
    1ba8:	f9043783          	ld	a5,-112(s0)
    1bac:	fd878793          	addi	a5,a5,-40
    1bb0:	faf43c23          	sd	a5,-72(s0)
    1bb4:	a069                	j	1c3e <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1bb6:	fb843783          	ld	a5,-72(s0)
    1bba:	5fd8                	lw	a4,60(a5)
    1bbc:	fb843783          	ld	a5,-72(s0)
    1bc0:	5bbc                	lw	a5,112(a5)
    1bc2:	863e                	mv	a2,a5
    1bc4:	85ba                	mv	a1,a4
    1bc6:	00000517          	auipc	a0,0x0
    1bca:	60a50513          	addi	a0,a0,1546 # 21d0 <schedule_edf_cbs+0x6da>
    1bce:	fffff097          	auipc	ra,0xfffff
    1bd2:	e32080e7          	jalr	-462(ra) # a00 <printf>
            if (next == NULL)
    1bd6:	fa043783          	ld	a5,-96(s0)
    1bda:	e791                	bnez	a5,1be6 <schedule_edf_cbs+0xf0>
                next = th;
    1bdc:	fb843783          	ld	a5,-72(s0)
    1be0:	faf43023          	sd	a5,-96(s0)
    1be4:	a091                	j	1c28 <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1be6:	fb843783          	ld	a5,-72(s0)
    1bea:	4fb8                	lw	a4,88(a5)
    1bec:	fa043783          	ld	a5,-96(s0)
    1bf0:	4fbc                	lw	a5,88(a5)
    1bf2:	00f75763          	bge	a4,a5,1c00 <schedule_edf_cbs+0x10a>
                next = th;
    1bf6:	fb843783          	ld	a5,-72(s0)
    1bfa:	faf43023          	sd	a5,-96(s0)
    1bfe:	a02d                	j	1c28 <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1c00:	fb843783          	ld	a5,-72(s0)
    1c04:	4fb8                	lw	a4,88(a5)
    1c06:	fa043783          	ld	a5,-96(s0)
    1c0a:	4fbc                	lw	a5,88(a5)
    1c0c:	00f71e63          	bne	a4,a5,1c28 <schedule_edf_cbs+0x132>
    1c10:	fb843783          	ld	a5,-72(s0)
    1c14:	5fd8                	lw	a4,60(a5)
    1c16:	fa043783          	ld	a5,-96(s0)
    1c1a:	5fdc                	lw	a5,60(a5)
    1c1c:	00f75663          	bge	a4,a5,1c28 <schedule_edf_cbs+0x132>
                next = th;
    1c20:	fb843783          	ld	a5,-72(s0)
    1c24:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1c28:	fb843783          	ld	a5,-72(s0)
    1c2c:	779c                	ld	a5,40(a5)
    1c2e:	f8f43423          	sd	a5,-120(s0)
    1c32:	f8843783          	ld	a5,-120(s0)
    1c36:	fd878793          	addi	a5,a5,-40
    1c3a:	faf43c23          	sd	a5,-72(s0)
    1c3e:	fb843783          	ld	a5,-72(s0)
    1c42:	02878713          	addi	a4,a5,40
    1c46:	649c                	ld	a5,8(s1)
    1c48:	f6f717e3          	bne	a4,a5,1bb6 <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1c4c:	fa043783          	ld	a5,-96(s0)
    1c50:	5fdc                	lw	a5,60(a5)
    1c52:	85be                	mv	a1,a5
    1c54:	00000517          	auipc	a0,0x0
    1c58:	5b450513          	addi	a0,a0,1460 # 2208 <schedule_edf_cbs+0x712>
    1c5c:	fffff097          	auipc	ra,0xfffff
    1c60:	da4080e7          	jalr	-604(ra) # a00 <printf>

    if(next && next->cbs.is_throttled){
    1c64:	fa043783          	ld	a5,-96(s0)
    1c68:	cb95                	beqz	a5,1c9c <schedule_edf_cbs+0x1a6>
    1c6a:	fa043783          	ld	a5,-96(s0)
    1c6e:	5bbc                	lw	a5,112(a5)
    1c70:	c795                	beqz	a5,1c9c <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1c72:	fa043783          	ld	a5,-96(s0)
    1c76:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1c7a:	fa043783          	ld	a5,-96(s0)
    1c7e:	02878793          	addi	a5,a5,40
    1c82:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1c86:	f4042423          	sw	zero,-184(s0)
        return r;
    1c8a:	f4043783          	ld	a5,-192(s0)
    1c8e:	f4f43823          	sd	a5,-176(s0)
    1c92:	f4843783          	ld	a5,-184(s0)
    1c96:	f4f43c23          	sd	a5,-168(s0)
    1c9a:	a611                	j	1f9e <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1c9c:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1ca0:	689c                	ld	a5,16(s1)
    1ca2:	639c                	ld	a5,0(a5)
    1ca4:	f8f43023          	sd	a5,-128(s0)
    1ca8:	f8043783          	ld	a5,-128(s0)
    1cac:	17e1                	addi	a5,a5,-8
    1cae:	fcf43023          	sd	a5,-64(s0)
    1cb2:	a0b5                	j	1d1e <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1cb4:	fa843783          	ld	a5,-88(s0)
    1cb8:	e791                	bnez	a5,1cc4 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1cba:	fc043783          	ld	a5,-64(s0)
    1cbe:	faf43423          	sd	a5,-88(s0)
    1cc2:	a0a1                	j	1d0a <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1cc4:	fa843783          	ld	a5,-88(s0)
    1cc8:	4f98                	lw	a4,24(a5)
    1cca:	fc043783          	ld	a5,-64(s0)
    1cce:	4f9c                	lw	a5,24(a5)
    1cd0:	00e7d763          	bge	a5,a4,1cde <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1cd4:	fc043783          	ld	a5,-64(s0)
    1cd8:	faf43423          	sd	a5,-88(s0)
    1cdc:	a03d                	j	1d0a <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1cde:	fa843783          	ld	a5,-88(s0)
    1ce2:	4f98                	lw	a4,24(a5)
    1ce4:	fc043783          	ld	a5,-64(s0)
    1ce8:	4f9c                	lw	a5,24(a5)
    1cea:	02f71063          	bne	a4,a5,1d0a <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1cee:	fa843783          	ld	a5,-88(s0)
    1cf2:	639c                	ld	a5,0(a5)
    1cf4:	4fb8                	lw	a4,88(a5)
    1cf6:	fc043783          	ld	a5,-64(s0)
    1cfa:	639c                	ld	a5,0(a5)
    1cfc:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1cfe:	00e7d663          	bge	a5,a4,1d0a <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1d02:	fc043783          	ld	a5,-64(s0)
    1d06:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d0a:	fc043783          	ld	a5,-64(s0)
    1d0e:	679c                	ld	a5,8(a5)
    1d10:	f6f43023          	sd	a5,-160(s0)
    1d14:	f6043783          	ld	a5,-160(s0)
    1d18:	17e1                	addi	a5,a5,-8
    1d1a:	fcf43023          	sd	a5,-64(s0)
    1d1e:	fc043783          	ld	a5,-64(s0)
    1d22:	00878713          	addi	a4,a5,8
    1d26:	689c                	ld	a5,16(s1)
    1d28:	f8f716e3          	bne	a4,a5,1cb4 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1d2c:	689c                	ld	a5,16(s1)
    1d2e:	639c                	ld	a5,0(a5)
    1d30:	f6f43c23          	sd	a5,-136(s0)
    1d34:	f7843783          	ld	a5,-136(s0)
    1d38:	17e1                	addi	a5,a5,-8
    1d3a:	fcf43023          	sd	a5,-64(s0)
    1d3e:	a069                	j	1dc8 <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1d40:	fb043783          	ld	a5,-80(s0)
    1d44:	eb99                	bnez	a5,1d5a <schedule_edf_cbs+0x264>
    1d46:	fc043783          	ld	a5,-64(s0)
    1d4a:	639c                	ld	a5,0(a5)
    1d4c:	57fc                	lw	a5,108(a5)
    1d4e:	c791                	beqz	a5,1d5a <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1d50:	fc043783          	ld	a5,-64(s0)
    1d54:	faf43823          	sd	a5,-80(s0)
    1d58:	a8b1                	j	1db4 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1d5a:	fc043783          	ld	a5,-64(s0)
    1d5e:	639c                	ld	a5,0(a5)
    1d60:	57fc                	lw	a5,108(a5)
    1d62:	cf91                	beqz	a5,1d7e <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1d64:	fb043783          	ld	a5,-80(s0)
    1d68:	4f98                	lw	a4,24(a5)
    1d6a:	fc043783          	ld	a5,-64(s0)
    1d6e:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1d70:	00e7d763          	bge	a5,a4,1d7e <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1d74:	fc043783          	ld	a5,-64(s0)
    1d78:	faf43823          	sd	a5,-80(s0)
    1d7c:	a825                	j	1db4 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1d7e:	fc043783          	ld	a5,-64(s0)
    1d82:	639c                	ld	a5,0(a5)
    1d84:	57fc                	lw	a5,108(a5)
    1d86:	c79d                	beqz	a5,1db4 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1d88:	fb043783          	ld	a5,-80(s0)
    1d8c:	4f98                	lw	a4,24(a5)
    1d8e:	fc043783          	ld	a5,-64(s0)
    1d92:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1d94:	02f71063          	bne	a4,a5,1db4 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1d98:	fb043783          	ld	a5,-80(s0)
    1d9c:	639c                	ld	a5,0(a5)
    1d9e:	4fb8                	lw	a4,88(a5)
    1da0:	fc043783          	ld	a5,-64(s0)
    1da4:	639c                	ld	a5,0(a5)
    1da6:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1da8:	00e7d663          	bge	a5,a4,1db4 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1dac:	fc043783          	ld	a5,-64(s0)
    1db0:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1db4:	fc043783          	ld	a5,-64(s0)
    1db8:	679c                	ld	a5,8(a5)
    1dba:	f6f43423          	sd	a5,-152(s0)
    1dbe:	f6843783          	ld	a5,-152(s0)
    1dc2:	17e1                	addi	a5,a5,-8
    1dc4:	fcf43023          	sd	a5,-64(s0)
    1dc8:	fc043783          	ld	a5,-64(s0)
    1dcc:	00878713          	addi	a4,a5,8
    1dd0:	689c                	ld	a5,16(s1)
    1dd2:	f6f717e3          	bne	a4,a5,1d40 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1dd6:	fa043783          	ld	a5,-96(s0)
    1dda:	cb89                	beqz	a5,1dec <schedule_edf_cbs+0x2f6>
    1ddc:	fa043783          	ld	a5,-96(s0)
    1de0:	57fc                	lw	a5,108(a5)
    1de2:	c789                	beqz	a5,1dec <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1de4:	fb043783          	ld	a5,-80(s0)
    1de8:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1dec:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1df0:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1df4:	fa843783          	ld	a5,-88(s0)
    1df8:	c3c5                	beqz	a5,1e98 <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1dfa:	fa843783          	ld	a5,-88(s0)
    1dfe:	639c                	ld	a5,0(a5)
    1e00:	5fdc                	lw	a5,60(a5)
    1e02:	85be                	mv	a1,a5
    1e04:	00000517          	auipc	a0,0x0
    1e08:	42450513          	addi	a0,a0,1060 # 2228 <schedule_edf_cbs+0x732>
    1e0c:	fffff097          	auipc	ra,0xfffff
    1e10:	bf4080e7          	jalr	-1036(ra) # a00 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    1e14:	fa843783          	ld	a5,-88(s0)
    1e18:	4f98                	lw	a4,24(a5)
    1e1a:	409c                	lw	a5,0(s1)
    1e1c:	40f707bb          	subw	a5,a4,a5
    1e20:	fcf42623          	sw	a5,-52(s0)
        if (next){
    1e24:	fa043783          	ld	a5,-96(s0)
    1e28:	cba5                	beqz	a5,1e98 <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    1e2a:	fa043783          	ld	a5,-96(s0)
    1e2e:	4bf8                	lw	a4,84(a5)
    1e30:	fcc42783          	lw	a5,-52(s0)
    1e34:	2781                	sext.w	a5,a5
    1e36:	06e7d163          	bge	a5,a4,1e98 <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    1e3a:	fa043783          	ld	a5,-96(s0)
    1e3e:	57fc                	lw	a5,108(a5)
    1e40:	eb91                	bnez	a5,1e54 <schedule_edf_cbs+0x35e>
    1e42:	fa843783          	ld	a5,-88(s0)
    1e46:	639c                	ld	a5,0(a5)
    1e48:	57fc                	lw	a5,108(a5)
    1e4a:	c789                	beqz	a5,1e54 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    1e4c:	4785                	li	a5,1
    1e4e:	fcf42423          	sw	a5,-56(s0)
    1e52:	a099                	j	1e98 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    1e54:	fa043783          	ld	a5,-96(s0)
    1e58:	4fb8                	lw	a4,88(a5)
    1e5a:	fa843783          	ld	a5,-88(s0)
    1e5e:	639c                	ld	a5,0(a5)
    1e60:	4fbc                	lw	a5,88(a5)
    1e62:	00e7d663          	bge	a5,a4,1e6e <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    1e66:	4785                	li	a5,1
    1e68:	fcf42423          	sw	a5,-56(s0)
    1e6c:	a035                	j	1e98 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1e6e:	fa043783          	ld	a5,-96(s0)
    1e72:	4fb8                	lw	a4,88(a5)
    1e74:	fa843783          	ld	a5,-88(s0)
    1e78:	639c                	ld	a5,0(a5)
    1e7a:	4fbc                	lw	a5,88(a5)
    1e7c:	00f71e63          	bne	a4,a5,1e98 <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    1e80:	fa043783          	ld	a5,-96(s0)
    1e84:	5fd8                	lw	a4,60(a5)
    1e86:	fa843783          	ld	a5,-88(s0)
    1e8a:	639c                	ld	a5,0(a5)
    1e8c:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1e8e:	00e7d563          	bge	a5,a4,1e98 <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    1e92:	4785                	li	a5,1
    1e94:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    1e98:	fa043783          	ld	a5,-96(s0)
    1e9c:	cbd1                	beqz	a5,1f30 <schedule_edf_cbs+0x43a>
    1e9e:	fa043783          	ld	a5,-96(s0)
    1ea2:	57fc                	lw	a5,108(a5)
    1ea4:	e7d1                	bnez	a5,1f30 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    1ea6:	fa043783          	ld	a5,-96(s0)
    1eaa:	4fb8                	lw	a4,88(a5)
    1eac:	409c                	lw	a5,0(s1)
    1eae:	40f707bb          	subw	a5,a4,a5
    1eb2:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    1eb6:	fa043783          	ld	a5,-96(s0)
    1eba:	47f8                	lw	a4,76(a5)
    1ebc:	fa043783          	ld	a5,-96(s0)
    1ec0:	57bc                	lw	a5,104(a5)
    1ec2:	02f707bb          	mulw	a5,a4,a5
    1ec6:	0007869b          	sext.w	a3,a5
    1eca:	fa043783          	ld	a5,-96(s0)
    1ece:	53fc                	lw	a5,100(a5)
    1ed0:	f7442703          	lw	a4,-140(s0)
    1ed4:	02f707bb          	mulw	a5,a4,a5
    1ed8:	2781                	sext.w	a5,a5
    1eda:	8736                	mv	a4,a3
    1edc:	02e7d263          	bge	a5,a4,1f00 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    1ee0:	4098                	lw	a4,0(s1)
    1ee2:	fa043783          	ld	a5,-96(s0)
    1ee6:	47fc                	lw	a5,76(a5)
    1ee8:	9fb9                	addw	a5,a5,a4
    1eea:	0007871b          	sext.w	a4,a5
    1eee:	fa043783          	ld	a5,-96(s0)
    1ef2:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    1ef4:	fa043783          	ld	a5,-96(s0)
    1ef8:	53f8                	lw	a4,100(a5)
    1efa:	fa043783          	ld	a5,-96(s0)
    1efe:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    1f00:	fa043783          	ld	a5,-96(s0)
    1f04:	4bf8                	lw	a4,84(a5)
    1f06:	fa043783          	ld	a5,-96(s0)
    1f0a:	57bc                	lw	a5,104(a5)
    1f0c:	02e7d263          	bge	a5,a4,1f30 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    1f10:	fa043783          	ld	a5,-96(s0)
    1f14:	4705                	li	a4,1
    1f16:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    1f18:	fa043783          	ld	a5,-96(s0)
    1f1c:	4fb8                	lw	a4,88(a5)
    1f1e:	fa043783          	ld	a5,-96(s0)
    1f22:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    1f24:	fa043783          	ld	a5,-96(s0)
    1f28:	4bf8                	lw	a4,84(a5)
    1f2a:	fa043783          	ld	a5,-96(s0)
    1f2e:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    1f30:	fa043783          	ld	a5,-96(s0)
    1f34:	c3a9                	beqz	a5,1f76 <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    1f36:	fa043783          	ld	a5,-96(s0)
    1f3a:	02878793          	addi	a5,a5,40
    1f3e:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    1f42:	fa843783          	ld	a5,-88(s0)
    1f46:	cb91                	beqz	a5,1f5a <schedule_edf_cbs+0x464>
    1f48:	fc842783          	lw	a5,-56(s0)
    1f4c:	2781                	sext.w	a5,a5
    1f4e:	c791                	beqz	a5,1f5a <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    1f50:	fcc42783          	lw	a5,-52(s0)
    1f54:	f4f42423          	sw	a5,-184(s0)
    1f58:	a81d                	j	1f8e <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    1f5a:	fa043783          	ld	a5,-96(s0)
    1f5e:	5bbc                	lw	a5,112(a5)
    1f60:	c789                	beqz	a5,1f6a <schedule_edf_cbs+0x474>
    1f62:	fa043783          	ld	a5,-96(s0)
    1f66:	57bc                	lw	a5,104(a5)
    1f68:	a021                	j	1f70 <schedule_edf_cbs+0x47a>
    1f6a:	fa043783          	ld	a5,-96(s0)
    1f6e:	4bfc                	lw	a5,84(a5)
    1f70:	f4f42423          	sw	a5,-184(s0)
    1f74:	a829                	j	1f8e <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1f76:	649c                	ld	a5,8(s1)
    1f78:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    1f7c:	fa843783          	ld	a5,-88(s0)
    1f80:	c781                	beqz	a5,1f88 <schedule_edf_cbs+0x492>
    1f82:	fcc42783          	lw	a5,-52(s0)
    1f86:	a011                	j	1f8a <schedule_edf_cbs+0x494>
    1f88:	4785                	li	a5,1
    1f8a:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    1f8e:	f4043783          	ld	a5,-192(s0)
    1f92:	f4f43823          	sd	a5,-176(s0)
    1f96:	f4843783          	ld	a5,-184(s0)
    1f9a:	f4f43c23          	sd	a5,-168(s0)
    1f9e:	4701                	li	a4,0
    1fa0:	f5043703          	ld	a4,-176(s0)
    1fa4:	4781                	li	a5,0
    1fa6:	f5843783          	ld	a5,-168(s0)
    1faa:	893a                	mv	s2,a4
    1fac:	89be                	mv	s3,a5
    1fae:	874a                	mv	a4,s2
    1fb0:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    1fb2:	853a                	mv	a0,a4
    1fb4:	85be                	mv	a1,a5
    1fb6:	70ea                	ld	ra,184(sp)
    1fb8:	744a                	ld	s0,176(sp)
    1fba:	74aa                	ld	s1,168(sp)
    1fbc:	790a                	ld	s2,160(sp)
    1fbe:	69ea                	ld	s3,152(sp)
    1fc0:	6129                	addi	sp,sp,192
    1fc2:	8082                	ret
