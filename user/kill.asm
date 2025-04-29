
user/_kill:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char **argv)
{
       0:	7179                	addi	sp,sp,-48
       2:	f406                	sd	ra,40(sp)
       4:	f022                	sd	s0,32(sp)
       6:	1800                	addi	s0,sp,48
       8:	87aa                	mv	a5,a0
       a:	fcb43823          	sd	a1,-48(s0)
       e:	fcf42e23          	sw	a5,-36(s0)
  int i;

  if(argc < 2){
      12:	fdc42783          	lw	a5,-36(s0)
      16:	0007871b          	sext.w	a4,a5
      1a:	4785                	li	a5,1
      1c:	02e7c063          	blt	a5,a4,3c <main+0x3c>
    fprintf(2, "usage: kill pid...\n");
      20:	00002597          	auipc	a1,0x2
      24:	00858593          	addi	a1,a1,8 # 2028 <schedule_edf_cbs+0x4d0>
      28:	4509                	li	a0,2
      2a:	00001097          	auipc	ra,0x1
      2e:	9e0080e7          	jalr	-1568(ra) # a0a <fprintf>
    exit(1);
      32:	4505                	li	a0,1
      34:	00000097          	auipc	ra,0x0
      38:	4e8080e7          	jalr	1256(ra) # 51c <exit>
  }
  for(i=1; i<argc; i++)
      3c:	4785                	li	a5,1
      3e:	fef42623          	sw	a5,-20(s0)
      42:	a805                	j	72 <main+0x72>
    kill(atoi(argv[i]));
      44:	fec42783          	lw	a5,-20(s0)
      48:	078e                	slli	a5,a5,0x3
      4a:	fd043703          	ld	a4,-48(s0)
      4e:	97ba                	add	a5,a5,a4
      50:	639c                	ld	a5,0(a5)
      52:	853e                	mv	a0,a5
      54:	00000097          	auipc	ra,0x0
      58:	2d0080e7          	jalr	720(ra) # 324 <atoi>
      5c:	87aa                	mv	a5,a0
      5e:	853e                	mv	a0,a5
      60:	00000097          	auipc	ra,0x0
      64:	4ec080e7          	jalr	1260(ra) # 54c <kill>
  for(i=1; i<argc; i++)
      68:	fec42783          	lw	a5,-20(s0)
      6c:	2785                	addiw	a5,a5,1
      6e:	fef42623          	sw	a5,-20(s0)
      72:	fec42703          	lw	a4,-20(s0)
      76:	fdc42783          	lw	a5,-36(s0)
      7a:	2701                	sext.w	a4,a4
      7c:	2781                	sext.w	a5,a5
      7e:	fcf743e3          	blt	a4,a5,44 <main+0x44>
  exit(0);
      82:	4501                	li	a0,0
      84:	00000097          	auipc	ra,0x0
      88:	498080e7          	jalr	1176(ra) # 51c <exit>

000000000000008c <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      8c:	7179                	addi	sp,sp,-48
      8e:	f422                	sd	s0,40(sp)
      90:	1800                	addi	s0,sp,48
      92:	fca43c23          	sd	a0,-40(s0)
      96:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      9a:	fd843783          	ld	a5,-40(s0)
      9e:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      a2:	0001                	nop
      a4:	fd043703          	ld	a4,-48(s0)
      a8:	00170793          	addi	a5,a4,1
      ac:	fcf43823          	sd	a5,-48(s0)
      b0:	fd843783          	ld	a5,-40(s0)
      b4:	00178693          	addi	a3,a5,1
      b8:	fcd43c23          	sd	a3,-40(s0)
      bc:	00074703          	lbu	a4,0(a4)
      c0:	00e78023          	sb	a4,0(a5)
      c4:	0007c783          	lbu	a5,0(a5)
      c8:	fff1                	bnez	a5,a4 <strcpy+0x18>
    ;
  return os;
      ca:	fe843783          	ld	a5,-24(s0)
}
      ce:	853e                	mv	a0,a5
      d0:	7422                	ld	s0,40(sp)
      d2:	6145                	addi	sp,sp,48
      d4:	8082                	ret

00000000000000d6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      d6:	1101                	addi	sp,sp,-32
      d8:	ec22                	sd	s0,24(sp)
      da:	1000                	addi	s0,sp,32
      dc:	fea43423          	sd	a0,-24(s0)
      e0:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
      e4:	a819                	j	fa <strcmp+0x24>
    p++, q++;
      e6:	fe843783          	ld	a5,-24(s0)
      ea:	0785                	addi	a5,a5,1
      ec:	fef43423          	sd	a5,-24(s0)
      f0:	fe043783          	ld	a5,-32(s0)
      f4:	0785                	addi	a5,a5,1
      f6:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
      fa:	fe843783          	ld	a5,-24(s0)
      fe:	0007c783          	lbu	a5,0(a5)
     102:	cb99                	beqz	a5,118 <strcmp+0x42>
     104:	fe843783          	ld	a5,-24(s0)
     108:	0007c703          	lbu	a4,0(a5)
     10c:	fe043783          	ld	a5,-32(s0)
     110:	0007c783          	lbu	a5,0(a5)
     114:	fcf709e3          	beq	a4,a5,e6 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     118:	fe843783          	ld	a5,-24(s0)
     11c:	0007c783          	lbu	a5,0(a5)
     120:	0007871b          	sext.w	a4,a5
     124:	fe043783          	ld	a5,-32(s0)
     128:	0007c783          	lbu	a5,0(a5)
     12c:	2781                	sext.w	a5,a5
     12e:	40f707bb          	subw	a5,a4,a5
     132:	2781                	sext.w	a5,a5
}
     134:	853e                	mv	a0,a5
     136:	6462                	ld	s0,24(sp)
     138:	6105                	addi	sp,sp,32
     13a:	8082                	ret

000000000000013c <strlen>:

uint
strlen(const char *s)
{
     13c:	7179                	addi	sp,sp,-48
     13e:	f422                	sd	s0,40(sp)
     140:	1800                	addi	s0,sp,48
     142:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     146:	fe042623          	sw	zero,-20(s0)
     14a:	a031                	j	156 <strlen+0x1a>
     14c:	fec42783          	lw	a5,-20(s0)
     150:	2785                	addiw	a5,a5,1
     152:	fef42623          	sw	a5,-20(s0)
     156:	fec42783          	lw	a5,-20(s0)
     15a:	fd843703          	ld	a4,-40(s0)
     15e:	97ba                	add	a5,a5,a4
     160:	0007c783          	lbu	a5,0(a5)
     164:	f7e5                	bnez	a5,14c <strlen+0x10>
    ;
  return n;
     166:	fec42783          	lw	a5,-20(s0)
}
     16a:	853e                	mv	a0,a5
     16c:	7422                	ld	s0,40(sp)
     16e:	6145                	addi	sp,sp,48
     170:	8082                	ret

0000000000000172 <memset>:

void*
memset(void *dst, int c, uint n)
{
     172:	7179                	addi	sp,sp,-48
     174:	f422                	sd	s0,40(sp)
     176:	1800                	addi	s0,sp,48
     178:	fca43c23          	sd	a0,-40(s0)
     17c:	87ae                	mv	a5,a1
     17e:	8732                	mv	a4,a2
     180:	fcf42a23          	sw	a5,-44(s0)
     184:	87ba                	mv	a5,a4
     186:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     18a:	fd843783          	ld	a5,-40(s0)
     18e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     192:	fe042623          	sw	zero,-20(s0)
     196:	a00d                	j	1b8 <memset+0x46>
    cdst[i] = c;
     198:	fec42783          	lw	a5,-20(s0)
     19c:	fe043703          	ld	a4,-32(s0)
     1a0:	97ba                	add	a5,a5,a4
     1a2:	fd442703          	lw	a4,-44(s0)
     1a6:	0ff77713          	andi	a4,a4,255
     1aa:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1ae:	fec42783          	lw	a5,-20(s0)
     1b2:	2785                	addiw	a5,a5,1
     1b4:	fef42623          	sw	a5,-20(s0)
     1b8:	fec42703          	lw	a4,-20(s0)
     1bc:	fd042783          	lw	a5,-48(s0)
     1c0:	2781                	sext.w	a5,a5
     1c2:	fcf76be3          	bltu	a4,a5,198 <memset+0x26>
  }
  return dst;
     1c6:	fd843783          	ld	a5,-40(s0)
}
     1ca:	853e                	mv	a0,a5
     1cc:	7422                	ld	s0,40(sp)
     1ce:	6145                	addi	sp,sp,48
     1d0:	8082                	ret

00000000000001d2 <strchr>:

char*
strchr(const char *s, char c)
{
     1d2:	1101                	addi	sp,sp,-32
     1d4:	ec22                	sd	s0,24(sp)
     1d6:	1000                	addi	s0,sp,32
     1d8:	fea43423          	sd	a0,-24(s0)
     1dc:	87ae                	mv	a5,a1
     1de:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     1e2:	a01d                	j	208 <strchr+0x36>
    if(*s == c)
     1e4:	fe843783          	ld	a5,-24(s0)
     1e8:	0007c703          	lbu	a4,0(a5)
     1ec:	fe744783          	lbu	a5,-25(s0)
     1f0:	0ff7f793          	andi	a5,a5,255
     1f4:	00e79563          	bne	a5,a4,1fe <strchr+0x2c>
      return (char*)s;
     1f8:	fe843783          	ld	a5,-24(s0)
     1fc:	a821                	j	214 <strchr+0x42>
  for(; *s; s++)
     1fe:	fe843783          	ld	a5,-24(s0)
     202:	0785                	addi	a5,a5,1
     204:	fef43423          	sd	a5,-24(s0)
     208:	fe843783          	ld	a5,-24(s0)
     20c:	0007c783          	lbu	a5,0(a5)
     210:	fbf1                	bnez	a5,1e4 <strchr+0x12>
  return 0;
     212:	4781                	li	a5,0
}
     214:	853e                	mv	a0,a5
     216:	6462                	ld	s0,24(sp)
     218:	6105                	addi	sp,sp,32
     21a:	8082                	ret

000000000000021c <gets>:

char*
gets(char *buf, int max)
{
     21c:	7179                	addi	sp,sp,-48
     21e:	f406                	sd	ra,40(sp)
     220:	f022                	sd	s0,32(sp)
     222:	1800                	addi	s0,sp,48
     224:	fca43c23          	sd	a0,-40(s0)
     228:	87ae                	mv	a5,a1
     22a:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     22e:	fe042623          	sw	zero,-20(s0)
     232:	a8a1                	j	28a <gets+0x6e>
    cc = read(0, &c, 1);
     234:	fe740793          	addi	a5,s0,-25
     238:	4605                	li	a2,1
     23a:	85be                	mv	a1,a5
     23c:	4501                	li	a0,0
     23e:	00000097          	auipc	ra,0x0
     242:	2f6080e7          	jalr	758(ra) # 534 <read>
     246:	87aa                	mv	a5,a0
     248:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     24c:	fe842783          	lw	a5,-24(s0)
     250:	2781                	sext.w	a5,a5
     252:	04f05763          	blez	a5,2a0 <gets+0x84>
      break;
    buf[i++] = c;
     256:	fec42783          	lw	a5,-20(s0)
     25a:	0017871b          	addiw	a4,a5,1
     25e:	fee42623          	sw	a4,-20(s0)
     262:	873e                	mv	a4,a5
     264:	fd843783          	ld	a5,-40(s0)
     268:	97ba                	add	a5,a5,a4
     26a:	fe744703          	lbu	a4,-25(s0)
     26e:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     272:	fe744783          	lbu	a5,-25(s0)
     276:	873e                	mv	a4,a5
     278:	47a9                	li	a5,10
     27a:	02f70463          	beq	a4,a5,2a2 <gets+0x86>
     27e:	fe744783          	lbu	a5,-25(s0)
     282:	873e                	mv	a4,a5
     284:	47b5                	li	a5,13
     286:	00f70e63          	beq	a4,a5,2a2 <gets+0x86>
  for(i=0; i+1 < max; ){
     28a:	fec42783          	lw	a5,-20(s0)
     28e:	2785                	addiw	a5,a5,1
     290:	0007871b          	sext.w	a4,a5
     294:	fd442783          	lw	a5,-44(s0)
     298:	2781                	sext.w	a5,a5
     29a:	f8f74de3          	blt	a4,a5,234 <gets+0x18>
     29e:	a011                	j	2a2 <gets+0x86>
      break;
     2a0:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2a2:	fec42783          	lw	a5,-20(s0)
     2a6:	fd843703          	ld	a4,-40(s0)
     2aa:	97ba                	add	a5,a5,a4
     2ac:	00078023          	sb	zero,0(a5)
  return buf;
     2b0:	fd843783          	ld	a5,-40(s0)
}
     2b4:	853e                	mv	a0,a5
     2b6:	70a2                	ld	ra,40(sp)
     2b8:	7402                	ld	s0,32(sp)
     2ba:	6145                	addi	sp,sp,48
     2bc:	8082                	ret

00000000000002be <stat>:

int
stat(const char *n, struct stat *st)
{
     2be:	7179                	addi	sp,sp,-48
     2c0:	f406                	sd	ra,40(sp)
     2c2:	f022                	sd	s0,32(sp)
     2c4:	1800                	addi	s0,sp,48
     2c6:	fca43c23          	sd	a0,-40(s0)
     2ca:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2ce:	4581                	li	a1,0
     2d0:	fd843503          	ld	a0,-40(s0)
     2d4:	00000097          	auipc	ra,0x0
     2d8:	288080e7          	jalr	648(ra) # 55c <open>
     2dc:	87aa                	mv	a5,a0
     2de:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     2e2:	fec42783          	lw	a5,-20(s0)
     2e6:	2781                	sext.w	a5,a5
     2e8:	0007d463          	bgez	a5,2f0 <stat+0x32>
    return -1;
     2ec:	57fd                	li	a5,-1
     2ee:	a035                	j	31a <stat+0x5c>
  r = fstat(fd, st);
     2f0:	fec42783          	lw	a5,-20(s0)
     2f4:	fd043583          	ld	a1,-48(s0)
     2f8:	853e                	mv	a0,a5
     2fa:	00000097          	auipc	ra,0x0
     2fe:	27a080e7          	jalr	634(ra) # 574 <fstat>
     302:	87aa                	mv	a5,a0
     304:	fef42423          	sw	a5,-24(s0)
  close(fd);
     308:	fec42783          	lw	a5,-20(s0)
     30c:	853e                	mv	a0,a5
     30e:	00000097          	auipc	ra,0x0
     312:	236080e7          	jalr	566(ra) # 544 <close>
  return r;
     316:	fe842783          	lw	a5,-24(s0)
}
     31a:	853e                	mv	a0,a5
     31c:	70a2                	ld	ra,40(sp)
     31e:	7402                	ld	s0,32(sp)
     320:	6145                	addi	sp,sp,48
     322:	8082                	ret

0000000000000324 <atoi>:

int
atoi(const char *s)
{
     324:	7179                	addi	sp,sp,-48
     326:	f422                	sd	s0,40(sp)
     328:	1800                	addi	s0,sp,48
     32a:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     32e:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     332:	a815                	j	366 <atoi+0x42>
    n = n*10 + *s++ - '0';
     334:	fec42703          	lw	a4,-20(s0)
     338:	87ba                	mv	a5,a4
     33a:	0027979b          	slliw	a5,a5,0x2
     33e:	9fb9                	addw	a5,a5,a4
     340:	0017979b          	slliw	a5,a5,0x1
     344:	0007871b          	sext.w	a4,a5
     348:	fd843783          	ld	a5,-40(s0)
     34c:	00178693          	addi	a3,a5,1
     350:	fcd43c23          	sd	a3,-40(s0)
     354:	0007c783          	lbu	a5,0(a5)
     358:	2781                	sext.w	a5,a5
     35a:	9fb9                	addw	a5,a5,a4
     35c:	2781                	sext.w	a5,a5
     35e:	fd07879b          	addiw	a5,a5,-48
     362:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     366:	fd843783          	ld	a5,-40(s0)
     36a:	0007c783          	lbu	a5,0(a5)
     36e:	873e                	mv	a4,a5
     370:	02f00793          	li	a5,47
     374:	00e7fb63          	bgeu	a5,a4,38a <atoi+0x66>
     378:	fd843783          	ld	a5,-40(s0)
     37c:	0007c783          	lbu	a5,0(a5)
     380:	873e                	mv	a4,a5
     382:	03900793          	li	a5,57
     386:	fae7f7e3          	bgeu	a5,a4,334 <atoi+0x10>
  return n;
     38a:	fec42783          	lw	a5,-20(s0)
}
     38e:	853e                	mv	a0,a5
     390:	7422                	ld	s0,40(sp)
     392:	6145                	addi	sp,sp,48
     394:	8082                	ret

0000000000000396 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     396:	7139                	addi	sp,sp,-64
     398:	fc22                	sd	s0,56(sp)
     39a:	0080                	addi	s0,sp,64
     39c:	fca43c23          	sd	a0,-40(s0)
     3a0:	fcb43823          	sd	a1,-48(s0)
     3a4:	87b2                	mv	a5,a2
     3a6:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3aa:	fd843783          	ld	a5,-40(s0)
     3ae:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3b2:	fd043783          	ld	a5,-48(s0)
     3b6:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3ba:	fe043703          	ld	a4,-32(s0)
     3be:	fe843783          	ld	a5,-24(s0)
     3c2:	02e7fc63          	bgeu	a5,a4,3fa <memmove+0x64>
    while(n-- > 0)
     3c6:	a00d                	j	3e8 <memmove+0x52>
      *dst++ = *src++;
     3c8:	fe043703          	ld	a4,-32(s0)
     3cc:	00170793          	addi	a5,a4,1
     3d0:	fef43023          	sd	a5,-32(s0)
     3d4:	fe843783          	ld	a5,-24(s0)
     3d8:	00178693          	addi	a3,a5,1
     3dc:	fed43423          	sd	a3,-24(s0)
     3e0:	00074703          	lbu	a4,0(a4)
     3e4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     3e8:	fcc42783          	lw	a5,-52(s0)
     3ec:	fff7871b          	addiw	a4,a5,-1
     3f0:	fce42623          	sw	a4,-52(s0)
     3f4:	fcf04ae3          	bgtz	a5,3c8 <memmove+0x32>
     3f8:	a891                	j	44c <memmove+0xb6>
  } else {
    dst += n;
     3fa:	fcc42783          	lw	a5,-52(s0)
     3fe:	fe843703          	ld	a4,-24(s0)
     402:	97ba                	add	a5,a5,a4
     404:	fef43423          	sd	a5,-24(s0)
    src += n;
     408:	fcc42783          	lw	a5,-52(s0)
     40c:	fe043703          	ld	a4,-32(s0)
     410:	97ba                	add	a5,a5,a4
     412:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     416:	a01d                	j	43c <memmove+0xa6>
      *--dst = *--src;
     418:	fe043783          	ld	a5,-32(s0)
     41c:	17fd                	addi	a5,a5,-1
     41e:	fef43023          	sd	a5,-32(s0)
     422:	fe843783          	ld	a5,-24(s0)
     426:	17fd                	addi	a5,a5,-1
     428:	fef43423          	sd	a5,-24(s0)
     42c:	fe043783          	ld	a5,-32(s0)
     430:	0007c703          	lbu	a4,0(a5)
     434:	fe843783          	ld	a5,-24(s0)
     438:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     43c:	fcc42783          	lw	a5,-52(s0)
     440:	fff7871b          	addiw	a4,a5,-1
     444:	fce42623          	sw	a4,-52(s0)
     448:	fcf048e3          	bgtz	a5,418 <memmove+0x82>
  }
  return vdst;
     44c:	fd843783          	ld	a5,-40(s0)
}
     450:	853e                	mv	a0,a5
     452:	7462                	ld	s0,56(sp)
     454:	6121                	addi	sp,sp,64
     456:	8082                	ret

0000000000000458 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     458:	7139                	addi	sp,sp,-64
     45a:	fc22                	sd	s0,56(sp)
     45c:	0080                	addi	s0,sp,64
     45e:	fca43c23          	sd	a0,-40(s0)
     462:	fcb43823          	sd	a1,-48(s0)
     466:	87b2                	mv	a5,a2
     468:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     46c:	fd843783          	ld	a5,-40(s0)
     470:	fef43423          	sd	a5,-24(s0)
     474:	fd043783          	ld	a5,-48(s0)
     478:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     47c:	a0a1                	j	4c4 <memcmp+0x6c>
    if (*p1 != *p2) {
     47e:	fe843783          	ld	a5,-24(s0)
     482:	0007c703          	lbu	a4,0(a5)
     486:	fe043783          	ld	a5,-32(s0)
     48a:	0007c783          	lbu	a5,0(a5)
     48e:	02f70163          	beq	a4,a5,4b0 <memcmp+0x58>
      return *p1 - *p2;
     492:	fe843783          	ld	a5,-24(s0)
     496:	0007c783          	lbu	a5,0(a5)
     49a:	0007871b          	sext.w	a4,a5
     49e:	fe043783          	ld	a5,-32(s0)
     4a2:	0007c783          	lbu	a5,0(a5)
     4a6:	2781                	sext.w	a5,a5
     4a8:	40f707bb          	subw	a5,a4,a5
     4ac:	2781                	sext.w	a5,a5
     4ae:	a01d                	j	4d4 <memcmp+0x7c>
    }
    p1++;
     4b0:	fe843783          	ld	a5,-24(s0)
     4b4:	0785                	addi	a5,a5,1
     4b6:	fef43423          	sd	a5,-24(s0)
    p2++;
     4ba:	fe043783          	ld	a5,-32(s0)
     4be:	0785                	addi	a5,a5,1
     4c0:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4c4:	fcc42783          	lw	a5,-52(s0)
     4c8:	fff7871b          	addiw	a4,a5,-1
     4cc:	fce42623          	sw	a4,-52(s0)
     4d0:	f7dd                	bnez	a5,47e <memcmp+0x26>
  }
  return 0;
     4d2:	4781                	li	a5,0
}
     4d4:	853e                	mv	a0,a5
     4d6:	7462                	ld	s0,56(sp)
     4d8:	6121                	addi	sp,sp,64
     4da:	8082                	ret

00000000000004dc <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4dc:	7179                	addi	sp,sp,-48
     4de:	f406                	sd	ra,40(sp)
     4e0:	f022                	sd	s0,32(sp)
     4e2:	1800                	addi	s0,sp,48
     4e4:	fea43423          	sd	a0,-24(s0)
     4e8:	feb43023          	sd	a1,-32(s0)
     4ec:	87b2                	mv	a5,a2
     4ee:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     4f2:	fdc42783          	lw	a5,-36(s0)
     4f6:	863e                	mv	a2,a5
     4f8:	fe043583          	ld	a1,-32(s0)
     4fc:	fe843503          	ld	a0,-24(s0)
     500:	00000097          	auipc	ra,0x0
     504:	e96080e7          	jalr	-362(ra) # 396 <memmove>
     508:	87aa                	mv	a5,a0
}
     50a:	853e                	mv	a0,a5
     50c:	70a2                	ld	ra,40(sp)
     50e:	7402                	ld	s0,32(sp)
     510:	6145                	addi	sp,sp,48
     512:	8082                	ret

0000000000000514 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     514:	4885                	li	a7,1
 ecall
     516:	00000073          	ecall
 ret
     51a:	8082                	ret

000000000000051c <exit>:
.global exit
exit:
 li a7, SYS_exit
     51c:	4889                	li	a7,2
 ecall
     51e:	00000073          	ecall
 ret
     522:	8082                	ret

0000000000000524 <wait>:
.global wait
wait:
 li a7, SYS_wait
     524:	488d                	li	a7,3
 ecall
     526:	00000073          	ecall
 ret
     52a:	8082                	ret

000000000000052c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     52c:	4891                	li	a7,4
 ecall
     52e:	00000073          	ecall
 ret
     532:	8082                	ret

0000000000000534 <read>:
.global read
read:
 li a7, SYS_read
     534:	4895                	li	a7,5
 ecall
     536:	00000073          	ecall
 ret
     53a:	8082                	ret

000000000000053c <write>:
.global write
write:
 li a7, SYS_write
     53c:	48c1                	li	a7,16
 ecall
     53e:	00000073          	ecall
 ret
     542:	8082                	ret

0000000000000544 <close>:
.global close
close:
 li a7, SYS_close
     544:	48d5                	li	a7,21
 ecall
     546:	00000073          	ecall
 ret
     54a:	8082                	ret

000000000000054c <kill>:
.global kill
kill:
 li a7, SYS_kill
     54c:	4899                	li	a7,6
 ecall
     54e:	00000073          	ecall
 ret
     552:	8082                	ret

0000000000000554 <exec>:
.global exec
exec:
 li a7, SYS_exec
     554:	489d                	li	a7,7
 ecall
     556:	00000073          	ecall
 ret
     55a:	8082                	ret

000000000000055c <open>:
.global open
open:
 li a7, SYS_open
     55c:	48bd                	li	a7,15
 ecall
     55e:	00000073          	ecall
 ret
     562:	8082                	ret

0000000000000564 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     564:	48c5                	li	a7,17
 ecall
     566:	00000073          	ecall
 ret
     56a:	8082                	ret

000000000000056c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     56c:	48c9                	li	a7,18
 ecall
     56e:	00000073          	ecall
 ret
     572:	8082                	ret

0000000000000574 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     574:	48a1                	li	a7,8
 ecall
     576:	00000073          	ecall
 ret
     57a:	8082                	ret

000000000000057c <link>:
.global link
link:
 li a7, SYS_link
     57c:	48cd                	li	a7,19
 ecall
     57e:	00000073          	ecall
 ret
     582:	8082                	ret

0000000000000584 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     584:	48d1                	li	a7,20
 ecall
     586:	00000073          	ecall
 ret
     58a:	8082                	ret

000000000000058c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     58c:	48a5                	li	a7,9
 ecall
     58e:	00000073          	ecall
 ret
     592:	8082                	ret

0000000000000594 <dup>:
.global dup
dup:
 li a7, SYS_dup
     594:	48a9                	li	a7,10
 ecall
     596:	00000073          	ecall
 ret
     59a:	8082                	ret

000000000000059c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     59c:	48ad                	li	a7,11
 ecall
     59e:	00000073          	ecall
 ret
     5a2:	8082                	ret

00000000000005a4 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5a4:	48b1                	li	a7,12
 ecall
     5a6:	00000073          	ecall
 ret
     5aa:	8082                	ret

00000000000005ac <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5ac:	48b5                	li	a7,13
 ecall
     5ae:	00000073          	ecall
 ret
     5b2:	8082                	ret

00000000000005b4 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5b4:	48b9                	li	a7,14
 ecall
     5b6:	00000073          	ecall
 ret
     5ba:	8082                	ret

00000000000005bc <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5bc:	48d9                	li	a7,22
 ecall
     5be:	00000073          	ecall
 ret
     5c2:	8082                	ret

00000000000005c4 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5c4:	48dd                	li	a7,23
 ecall
     5c6:	00000073          	ecall
 ret
     5ca:	8082                	ret

00000000000005cc <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5cc:	48e1                	li	a7,24
 ecall
     5ce:	00000073          	ecall
 ret
     5d2:	8082                	ret

00000000000005d4 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5d4:	1101                	addi	sp,sp,-32
     5d6:	ec06                	sd	ra,24(sp)
     5d8:	e822                	sd	s0,16(sp)
     5da:	1000                	addi	s0,sp,32
     5dc:	87aa                	mv	a5,a0
     5de:	872e                	mv	a4,a1
     5e0:	fef42623          	sw	a5,-20(s0)
     5e4:	87ba                	mv	a5,a4
     5e6:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     5ea:	feb40713          	addi	a4,s0,-21
     5ee:	fec42783          	lw	a5,-20(s0)
     5f2:	4605                	li	a2,1
     5f4:	85ba                	mv	a1,a4
     5f6:	853e                	mv	a0,a5
     5f8:	00000097          	auipc	ra,0x0
     5fc:	f44080e7          	jalr	-188(ra) # 53c <write>
}
     600:	0001                	nop
     602:	60e2                	ld	ra,24(sp)
     604:	6442                	ld	s0,16(sp)
     606:	6105                	addi	sp,sp,32
     608:	8082                	ret

000000000000060a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     60a:	7139                	addi	sp,sp,-64
     60c:	fc06                	sd	ra,56(sp)
     60e:	f822                	sd	s0,48(sp)
     610:	0080                	addi	s0,sp,64
     612:	87aa                	mv	a5,a0
     614:	8736                	mv	a4,a3
     616:	fcf42623          	sw	a5,-52(s0)
     61a:	87ae                	mv	a5,a1
     61c:	fcf42423          	sw	a5,-56(s0)
     620:	87b2                	mv	a5,a2
     622:	fcf42223          	sw	a5,-60(s0)
     626:	87ba                	mv	a5,a4
     628:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     62c:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     630:	fc042783          	lw	a5,-64(s0)
     634:	2781                	sext.w	a5,a5
     636:	c38d                	beqz	a5,658 <printint+0x4e>
     638:	fc842783          	lw	a5,-56(s0)
     63c:	2781                	sext.w	a5,a5
     63e:	0007dd63          	bgez	a5,658 <printint+0x4e>
    neg = 1;
     642:	4785                	li	a5,1
     644:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     648:	fc842783          	lw	a5,-56(s0)
     64c:	40f007bb          	negw	a5,a5
     650:	2781                	sext.w	a5,a5
     652:	fef42223          	sw	a5,-28(s0)
     656:	a029                	j	660 <printint+0x56>
  } else {
    x = xx;
     658:	fc842783          	lw	a5,-56(s0)
     65c:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     660:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     664:	fc442783          	lw	a5,-60(s0)
     668:	fe442703          	lw	a4,-28(s0)
     66c:	02f777bb          	remuw	a5,a4,a5
     670:	0007861b          	sext.w	a2,a5
     674:	fec42783          	lw	a5,-20(s0)
     678:	0017871b          	addiw	a4,a5,1
     67c:	fee42623          	sw	a4,-20(s0)
     680:	00002697          	auipc	a3,0x2
     684:	c4068693          	addi	a3,a3,-960 # 22c0 <digits>
     688:	02061713          	slli	a4,a2,0x20
     68c:	9301                	srli	a4,a4,0x20
     68e:	9736                	add	a4,a4,a3
     690:	00074703          	lbu	a4,0(a4)
     694:	ff040693          	addi	a3,s0,-16
     698:	97b6                	add	a5,a5,a3
     69a:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     69e:	fc442783          	lw	a5,-60(s0)
     6a2:	fe442703          	lw	a4,-28(s0)
     6a6:	02f757bb          	divuw	a5,a4,a5
     6aa:	fef42223          	sw	a5,-28(s0)
     6ae:	fe442783          	lw	a5,-28(s0)
     6b2:	2781                	sext.w	a5,a5
     6b4:	fbc5                	bnez	a5,664 <printint+0x5a>
  if(neg)
     6b6:	fe842783          	lw	a5,-24(s0)
     6ba:	2781                	sext.w	a5,a5
     6bc:	cf95                	beqz	a5,6f8 <printint+0xee>
    buf[i++] = '-';
     6be:	fec42783          	lw	a5,-20(s0)
     6c2:	0017871b          	addiw	a4,a5,1
     6c6:	fee42623          	sw	a4,-20(s0)
     6ca:	ff040713          	addi	a4,s0,-16
     6ce:	97ba                	add	a5,a5,a4
     6d0:	02d00713          	li	a4,45
     6d4:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6d8:	a005                	j	6f8 <printint+0xee>
    putc(fd, buf[i]);
     6da:	fec42783          	lw	a5,-20(s0)
     6de:	ff040713          	addi	a4,s0,-16
     6e2:	97ba                	add	a5,a5,a4
     6e4:	fe07c703          	lbu	a4,-32(a5)
     6e8:	fcc42783          	lw	a5,-52(s0)
     6ec:	85ba                	mv	a1,a4
     6ee:	853e                	mv	a0,a5
     6f0:	00000097          	auipc	ra,0x0
     6f4:	ee4080e7          	jalr	-284(ra) # 5d4 <putc>
  while(--i >= 0)
     6f8:	fec42783          	lw	a5,-20(s0)
     6fc:	37fd                	addiw	a5,a5,-1
     6fe:	fef42623          	sw	a5,-20(s0)
     702:	fec42783          	lw	a5,-20(s0)
     706:	2781                	sext.w	a5,a5
     708:	fc07d9e3          	bgez	a5,6da <printint+0xd0>
}
     70c:	0001                	nop
     70e:	0001                	nop
     710:	70e2                	ld	ra,56(sp)
     712:	7442                	ld	s0,48(sp)
     714:	6121                	addi	sp,sp,64
     716:	8082                	ret

0000000000000718 <printptr>:

static void
printptr(int fd, uint64 x) {
     718:	7179                	addi	sp,sp,-48
     71a:	f406                	sd	ra,40(sp)
     71c:	f022                	sd	s0,32(sp)
     71e:	1800                	addi	s0,sp,48
     720:	87aa                	mv	a5,a0
     722:	fcb43823          	sd	a1,-48(s0)
     726:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     72a:	fdc42783          	lw	a5,-36(s0)
     72e:	03000593          	li	a1,48
     732:	853e                	mv	a0,a5
     734:	00000097          	auipc	ra,0x0
     738:	ea0080e7          	jalr	-352(ra) # 5d4 <putc>
  putc(fd, 'x');
     73c:	fdc42783          	lw	a5,-36(s0)
     740:	07800593          	li	a1,120
     744:	853e                	mv	a0,a5
     746:	00000097          	auipc	ra,0x0
     74a:	e8e080e7          	jalr	-370(ra) # 5d4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     74e:	fe042623          	sw	zero,-20(s0)
     752:	a82d                	j	78c <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     754:	fd043783          	ld	a5,-48(s0)
     758:	93f1                	srli	a5,a5,0x3c
     75a:	00002717          	auipc	a4,0x2
     75e:	b6670713          	addi	a4,a4,-1178 # 22c0 <digits>
     762:	97ba                	add	a5,a5,a4
     764:	0007c703          	lbu	a4,0(a5)
     768:	fdc42783          	lw	a5,-36(s0)
     76c:	85ba                	mv	a1,a4
     76e:	853e                	mv	a0,a5
     770:	00000097          	auipc	ra,0x0
     774:	e64080e7          	jalr	-412(ra) # 5d4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     778:	fec42783          	lw	a5,-20(s0)
     77c:	2785                	addiw	a5,a5,1
     77e:	fef42623          	sw	a5,-20(s0)
     782:	fd043783          	ld	a5,-48(s0)
     786:	0792                	slli	a5,a5,0x4
     788:	fcf43823          	sd	a5,-48(s0)
     78c:	fec42783          	lw	a5,-20(s0)
     790:	873e                	mv	a4,a5
     792:	47bd                	li	a5,15
     794:	fce7f0e3          	bgeu	a5,a4,754 <printptr+0x3c>
}
     798:	0001                	nop
     79a:	0001                	nop
     79c:	70a2                	ld	ra,40(sp)
     79e:	7402                	ld	s0,32(sp)
     7a0:	6145                	addi	sp,sp,48
     7a2:	8082                	ret

00000000000007a4 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7a4:	715d                	addi	sp,sp,-80
     7a6:	e486                	sd	ra,72(sp)
     7a8:	e0a2                	sd	s0,64(sp)
     7aa:	0880                	addi	s0,sp,80
     7ac:	87aa                	mv	a5,a0
     7ae:	fcb43023          	sd	a1,-64(s0)
     7b2:	fac43c23          	sd	a2,-72(s0)
     7b6:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7ba:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7be:	fe042223          	sw	zero,-28(s0)
     7c2:	a42d                	j	9ec <vprintf+0x248>
    c = fmt[i] & 0xff;
     7c4:	fe442783          	lw	a5,-28(s0)
     7c8:	fc043703          	ld	a4,-64(s0)
     7cc:	97ba                	add	a5,a5,a4
     7ce:	0007c783          	lbu	a5,0(a5)
     7d2:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7d6:	fe042783          	lw	a5,-32(s0)
     7da:	2781                	sext.w	a5,a5
     7dc:	eb9d                	bnez	a5,812 <vprintf+0x6e>
      if(c == '%'){
     7de:	fdc42783          	lw	a5,-36(s0)
     7e2:	0007871b          	sext.w	a4,a5
     7e6:	02500793          	li	a5,37
     7ea:	00f71763          	bne	a4,a5,7f8 <vprintf+0x54>
        state = '%';
     7ee:	02500793          	li	a5,37
     7f2:	fef42023          	sw	a5,-32(s0)
     7f6:	a2f5                	j	9e2 <vprintf+0x23e>
      } else {
        putc(fd, c);
     7f8:	fdc42783          	lw	a5,-36(s0)
     7fc:	0ff7f713          	andi	a4,a5,255
     800:	fcc42783          	lw	a5,-52(s0)
     804:	85ba                	mv	a1,a4
     806:	853e                	mv	a0,a5
     808:	00000097          	auipc	ra,0x0
     80c:	dcc080e7          	jalr	-564(ra) # 5d4 <putc>
     810:	aac9                	j	9e2 <vprintf+0x23e>
      }
    } else if(state == '%'){
     812:	fe042783          	lw	a5,-32(s0)
     816:	0007871b          	sext.w	a4,a5
     81a:	02500793          	li	a5,37
     81e:	1cf71263          	bne	a4,a5,9e2 <vprintf+0x23e>
      if(c == 'd'){
     822:	fdc42783          	lw	a5,-36(s0)
     826:	0007871b          	sext.w	a4,a5
     82a:	06400793          	li	a5,100
     82e:	02f71463          	bne	a4,a5,856 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     832:	fb843783          	ld	a5,-72(s0)
     836:	00878713          	addi	a4,a5,8
     83a:	fae43c23          	sd	a4,-72(s0)
     83e:	4398                	lw	a4,0(a5)
     840:	fcc42783          	lw	a5,-52(s0)
     844:	4685                	li	a3,1
     846:	4629                	li	a2,10
     848:	85ba                	mv	a1,a4
     84a:	853e                	mv	a0,a5
     84c:	00000097          	auipc	ra,0x0
     850:	dbe080e7          	jalr	-578(ra) # 60a <printint>
     854:	a269                	j	9de <vprintf+0x23a>
      } else if(c == 'l') {
     856:	fdc42783          	lw	a5,-36(s0)
     85a:	0007871b          	sext.w	a4,a5
     85e:	06c00793          	li	a5,108
     862:	02f71663          	bne	a4,a5,88e <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     866:	fb843783          	ld	a5,-72(s0)
     86a:	00878713          	addi	a4,a5,8
     86e:	fae43c23          	sd	a4,-72(s0)
     872:	639c                	ld	a5,0(a5)
     874:	0007871b          	sext.w	a4,a5
     878:	fcc42783          	lw	a5,-52(s0)
     87c:	4681                	li	a3,0
     87e:	4629                	li	a2,10
     880:	85ba                	mv	a1,a4
     882:	853e                	mv	a0,a5
     884:	00000097          	auipc	ra,0x0
     888:	d86080e7          	jalr	-634(ra) # 60a <printint>
     88c:	aa89                	j	9de <vprintf+0x23a>
      } else if(c == 'x') {
     88e:	fdc42783          	lw	a5,-36(s0)
     892:	0007871b          	sext.w	a4,a5
     896:	07800793          	li	a5,120
     89a:	02f71463          	bne	a4,a5,8c2 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     89e:	fb843783          	ld	a5,-72(s0)
     8a2:	00878713          	addi	a4,a5,8
     8a6:	fae43c23          	sd	a4,-72(s0)
     8aa:	4398                	lw	a4,0(a5)
     8ac:	fcc42783          	lw	a5,-52(s0)
     8b0:	4681                	li	a3,0
     8b2:	4641                	li	a2,16
     8b4:	85ba                	mv	a1,a4
     8b6:	853e                	mv	a0,a5
     8b8:	00000097          	auipc	ra,0x0
     8bc:	d52080e7          	jalr	-686(ra) # 60a <printint>
     8c0:	aa39                	j	9de <vprintf+0x23a>
      } else if(c == 'p') {
     8c2:	fdc42783          	lw	a5,-36(s0)
     8c6:	0007871b          	sext.w	a4,a5
     8ca:	07000793          	li	a5,112
     8ce:	02f71263          	bne	a4,a5,8f2 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8d2:	fb843783          	ld	a5,-72(s0)
     8d6:	00878713          	addi	a4,a5,8
     8da:	fae43c23          	sd	a4,-72(s0)
     8de:	6398                	ld	a4,0(a5)
     8e0:	fcc42783          	lw	a5,-52(s0)
     8e4:	85ba                	mv	a1,a4
     8e6:	853e                	mv	a0,a5
     8e8:	00000097          	auipc	ra,0x0
     8ec:	e30080e7          	jalr	-464(ra) # 718 <printptr>
     8f0:	a0fd                	j	9de <vprintf+0x23a>
      } else if(c == 's'){
     8f2:	fdc42783          	lw	a5,-36(s0)
     8f6:	0007871b          	sext.w	a4,a5
     8fa:	07300793          	li	a5,115
     8fe:	04f71c63          	bne	a4,a5,956 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     902:	fb843783          	ld	a5,-72(s0)
     906:	00878713          	addi	a4,a5,8
     90a:	fae43c23          	sd	a4,-72(s0)
     90e:	639c                	ld	a5,0(a5)
     910:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     914:	fe843783          	ld	a5,-24(s0)
     918:	eb8d                	bnez	a5,94a <vprintf+0x1a6>
          s = "(null)";
     91a:	00001797          	auipc	a5,0x1
     91e:	72678793          	addi	a5,a5,1830 # 2040 <schedule_edf_cbs+0x4e8>
     922:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     926:	a015                	j	94a <vprintf+0x1a6>
          putc(fd, *s);
     928:	fe843783          	ld	a5,-24(s0)
     92c:	0007c703          	lbu	a4,0(a5)
     930:	fcc42783          	lw	a5,-52(s0)
     934:	85ba                	mv	a1,a4
     936:	853e                	mv	a0,a5
     938:	00000097          	auipc	ra,0x0
     93c:	c9c080e7          	jalr	-868(ra) # 5d4 <putc>
          s++;
     940:	fe843783          	ld	a5,-24(s0)
     944:	0785                	addi	a5,a5,1
     946:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     94a:	fe843783          	ld	a5,-24(s0)
     94e:	0007c783          	lbu	a5,0(a5)
     952:	fbf9                	bnez	a5,928 <vprintf+0x184>
     954:	a069                	j	9de <vprintf+0x23a>
        }
      } else if(c == 'c'){
     956:	fdc42783          	lw	a5,-36(s0)
     95a:	0007871b          	sext.w	a4,a5
     95e:	06300793          	li	a5,99
     962:	02f71463          	bne	a4,a5,98a <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     966:	fb843783          	ld	a5,-72(s0)
     96a:	00878713          	addi	a4,a5,8
     96e:	fae43c23          	sd	a4,-72(s0)
     972:	439c                	lw	a5,0(a5)
     974:	0ff7f713          	andi	a4,a5,255
     978:	fcc42783          	lw	a5,-52(s0)
     97c:	85ba                	mv	a1,a4
     97e:	853e                	mv	a0,a5
     980:	00000097          	auipc	ra,0x0
     984:	c54080e7          	jalr	-940(ra) # 5d4 <putc>
     988:	a899                	j	9de <vprintf+0x23a>
      } else if(c == '%'){
     98a:	fdc42783          	lw	a5,-36(s0)
     98e:	0007871b          	sext.w	a4,a5
     992:	02500793          	li	a5,37
     996:	00f71f63          	bne	a4,a5,9b4 <vprintf+0x210>
        putc(fd, c);
     99a:	fdc42783          	lw	a5,-36(s0)
     99e:	0ff7f713          	andi	a4,a5,255
     9a2:	fcc42783          	lw	a5,-52(s0)
     9a6:	85ba                	mv	a1,a4
     9a8:	853e                	mv	a0,a5
     9aa:	00000097          	auipc	ra,0x0
     9ae:	c2a080e7          	jalr	-982(ra) # 5d4 <putc>
     9b2:	a035                	j	9de <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9b4:	fcc42783          	lw	a5,-52(s0)
     9b8:	02500593          	li	a1,37
     9bc:	853e                	mv	a0,a5
     9be:	00000097          	auipc	ra,0x0
     9c2:	c16080e7          	jalr	-1002(ra) # 5d4 <putc>
        putc(fd, c);
     9c6:	fdc42783          	lw	a5,-36(s0)
     9ca:	0ff7f713          	andi	a4,a5,255
     9ce:	fcc42783          	lw	a5,-52(s0)
     9d2:	85ba                	mv	a1,a4
     9d4:	853e                	mv	a0,a5
     9d6:	00000097          	auipc	ra,0x0
     9da:	bfe080e7          	jalr	-1026(ra) # 5d4 <putc>
      }
      state = 0;
     9de:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     9e2:	fe442783          	lw	a5,-28(s0)
     9e6:	2785                	addiw	a5,a5,1
     9e8:	fef42223          	sw	a5,-28(s0)
     9ec:	fe442783          	lw	a5,-28(s0)
     9f0:	fc043703          	ld	a4,-64(s0)
     9f4:	97ba                	add	a5,a5,a4
     9f6:	0007c783          	lbu	a5,0(a5)
     9fa:	dc0795e3          	bnez	a5,7c4 <vprintf+0x20>
    }
  }
}
     9fe:	0001                	nop
     a00:	0001                	nop
     a02:	60a6                	ld	ra,72(sp)
     a04:	6406                	ld	s0,64(sp)
     a06:	6161                	addi	sp,sp,80
     a08:	8082                	ret

0000000000000a0a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a0a:	7159                	addi	sp,sp,-112
     a0c:	fc06                	sd	ra,56(sp)
     a0e:	f822                	sd	s0,48(sp)
     a10:	0080                	addi	s0,sp,64
     a12:	fcb43823          	sd	a1,-48(s0)
     a16:	e010                	sd	a2,0(s0)
     a18:	e414                	sd	a3,8(s0)
     a1a:	e818                	sd	a4,16(s0)
     a1c:	ec1c                	sd	a5,24(s0)
     a1e:	03043023          	sd	a6,32(s0)
     a22:	03143423          	sd	a7,40(s0)
     a26:	87aa                	mv	a5,a0
     a28:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a2c:	03040793          	addi	a5,s0,48
     a30:	fcf43423          	sd	a5,-56(s0)
     a34:	fc843783          	ld	a5,-56(s0)
     a38:	fd078793          	addi	a5,a5,-48
     a3c:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a40:	fe843703          	ld	a4,-24(s0)
     a44:	fdc42783          	lw	a5,-36(s0)
     a48:	863a                	mv	a2,a4
     a4a:	fd043583          	ld	a1,-48(s0)
     a4e:	853e                	mv	a0,a5
     a50:	00000097          	auipc	ra,0x0
     a54:	d54080e7          	jalr	-684(ra) # 7a4 <vprintf>
}
     a58:	0001                	nop
     a5a:	70e2                	ld	ra,56(sp)
     a5c:	7442                	ld	s0,48(sp)
     a5e:	6165                	addi	sp,sp,112
     a60:	8082                	ret

0000000000000a62 <printf>:

void
printf(const char *fmt, ...)
{
     a62:	7159                	addi	sp,sp,-112
     a64:	f406                	sd	ra,40(sp)
     a66:	f022                	sd	s0,32(sp)
     a68:	1800                	addi	s0,sp,48
     a6a:	fca43c23          	sd	a0,-40(s0)
     a6e:	e40c                	sd	a1,8(s0)
     a70:	e810                	sd	a2,16(s0)
     a72:	ec14                	sd	a3,24(s0)
     a74:	f018                	sd	a4,32(s0)
     a76:	f41c                	sd	a5,40(s0)
     a78:	03043823          	sd	a6,48(s0)
     a7c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a80:	04040793          	addi	a5,s0,64
     a84:	fcf43823          	sd	a5,-48(s0)
     a88:	fd043783          	ld	a5,-48(s0)
     a8c:	fc878793          	addi	a5,a5,-56
     a90:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     a94:	fe843783          	ld	a5,-24(s0)
     a98:	863e                	mv	a2,a5
     a9a:	fd843583          	ld	a1,-40(s0)
     a9e:	4505                	li	a0,1
     aa0:	00000097          	auipc	ra,0x0
     aa4:	d04080e7          	jalr	-764(ra) # 7a4 <vprintf>
}
     aa8:	0001                	nop
     aaa:	70a2                	ld	ra,40(sp)
     aac:	7402                	ld	s0,32(sp)
     aae:	6165                	addi	sp,sp,112
     ab0:	8082                	ret

0000000000000ab2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ab2:	7179                	addi	sp,sp,-48
     ab4:	f422                	sd	s0,40(sp)
     ab6:	1800                	addi	s0,sp,48
     ab8:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     abc:	fd843783          	ld	a5,-40(s0)
     ac0:	17c1                	addi	a5,a5,-16
     ac2:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ac6:	00002797          	auipc	a5,0x2
     aca:	85278793          	addi	a5,a5,-1966 # 2318 <freep>
     ace:	639c                	ld	a5,0(a5)
     ad0:	fef43423          	sd	a5,-24(s0)
     ad4:	a815                	j	b08 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ad6:	fe843783          	ld	a5,-24(s0)
     ada:	639c                	ld	a5,0(a5)
     adc:	fe843703          	ld	a4,-24(s0)
     ae0:	00f76f63          	bltu	a4,a5,afe <free+0x4c>
     ae4:	fe043703          	ld	a4,-32(s0)
     ae8:	fe843783          	ld	a5,-24(s0)
     aec:	02e7eb63          	bltu	a5,a4,b22 <free+0x70>
     af0:	fe843783          	ld	a5,-24(s0)
     af4:	639c                	ld	a5,0(a5)
     af6:	fe043703          	ld	a4,-32(s0)
     afa:	02f76463          	bltu	a4,a5,b22 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     afe:	fe843783          	ld	a5,-24(s0)
     b02:	639c                	ld	a5,0(a5)
     b04:	fef43423          	sd	a5,-24(s0)
     b08:	fe043703          	ld	a4,-32(s0)
     b0c:	fe843783          	ld	a5,-24(s0)
     b10:	fce7f3e3          	bgeu	a5,a4,ad6 <free+0x24>
     b14:	fe843783          	ld	a5,-24(s0)
     b18:	639c                	ld	a5,0(a5)
     b1a:	fe043703          	ld	a4,-32(s0)
     b1e:	faf77ce3          	bgeu	a4,a5,ad6 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b22:	fe043783          	ld	a5,-32(s0)
     b26:	479c                	lw	a5,8(a5)
     b28:	1782                	slli	a5,a5,0x20
     b2a:	9381                	srli	a5,a5,0x20
     b2c:	0792                	slli	a5,a5,0x4
     b2e:	fe043703          	ld	a4,-32(s0)
     b32:	973e                	add	a4,a4,a5
     b34:	fe843783          	ld	a5,-24(s0)
     b38:	639c                	ld	a5,0(a5)
     b3a:	02f71763          	bne	a4,a5,b68 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b3e:	fe043783          	ld	a5,-32(s0)
     b42:	4798                	lw	a4,8(a5)
     b44:	fe843783          	ld	a5,-24(s0)
     b48:	639c                	ld	a5,0(a5)
     b4a:	479c                	lw	a5,8(a5)
     b4c:	9fb9                	addw	a5,a5,a4
     b4e:	0007871b          	sext.w	a4,a5
     b52:	fe043783          	ld	a5,-32(s0)
     b56:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b58:	fe843783          	ld	a5,-24(s0)
     b5c:	639c                	ld	a5,0(a5)
     b5e:	6398                	ld	a4,0(a5)
     b60:	fe043783          	ld	a5,-32(s0)
     b64:	e398                	sd	a4,0(a5)
     b66:	a039                	j	b74 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b68:	fe843783          	ld	a5,-24(s0)
     b6c:	6398                	ld	a4,0(a5)
     b6e:	fe043783          	ld	a5,-32(s0)
     b72:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b74:	fe843783          	ld	a5,-24(s0)
     b78:	479c                	lw	a5,8(a5)
     b7a:	1782                	slli	a5,a5,0x20
     b7c:	9381                	srli	a5,a5,0x20
     b7e:	0792                	slli	a5,a5,0x4
     b80:	fe843703          	ld	a4,-24(s0)
     b84:	97ba                	add	a5,a5,a4
     b86:	fe043703          	ld	a4,-32(s0)
     b8a:	02f71563          	bne	a4,a5,bb4 <free+0x102>
    p->s.size += bp->s.size;
     b8e:	fe843783          	ld	a5,-24(s0)
     b92:	4798                	lw	a4,8(a5)
     b94:	fe043783          	ld	a5,-32(s0)
     b98:	479c                	lw	a5,8(a5)
     b9a:	9fb9                	addw	a5,a5,a4
     b9c:	0007871b          	sext.w	a4,a5
     ba0:	fe843783          	ld	a5,-24(s0)
     ba4:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     ba6:	fe043783          	ld	a5,-32(s0)
     baa:	6398                	ld	a4,0(a5)
     bac:	fe843783          	ld	a5,-24(s0)
     bb0:	e398                	sd	a4,0(a5)
     bb2:	a031                	j	bbe <free+0x10c>
  } else
    p->s.ptr = bp;
     bb4:	fe843783          	ld	a5,-24(s0)
     bb8:	fe043703          	ld	a4,-32(s0)
     bbc:	e398                	sd	a4,0(a5)
  freep = p;
     bbe:	00001797          	auipc	a5,0x1
     bc2:	75a78793          	addi	a5,a5,1882 # 2318 <freep>
     bc6:	fe843703          	ld	a4,-24(s0)
     bca:	e398                	sd	a4,0(a5)
}
     bcc:	0001                	nop
     bce:	7422                	ld	s0,40(sp)
     bd0:	6145                	addi	sp,sp,48
     bd2:	8082                	ret

0000000000000bd4 <morecore>:

static Header*
morecore(uint nu)
{
     bd4:	7179                	addi	sp,sp,-48
     bd6:	f406                	sd	ra,40(sp)
     bd8:	f022                	sd	s0,32(sp)
     bda:	1800                	addi	s0,sp,48
     bdc:	87aa                	mv	a5,a0
     bde:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     be2:	fdc42783          	lw	a5,-36(s0)
     be6:	0007871b          	sext.w	a4,a5
     bea:	6785                	lui	a5,0x1
     bec:	00f77563          	bgeu	a4,a5,bf6 <morecore+0x22>
    nu = 4096;
     bf0:	6785                	lui	a5,0x1
     bf2:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     bf6:	fdc42783          	lw	a5,-36(s0)
     bfa:	0047979b          	slliw	a5,a5,0x4
     bfe:	2781                	sext.w	a5,a5
     c00:	2781                	sext.w	a5,a5
     c02:	853e                	mv	a0,a5
     c04:	00000097          	auipc	ra,0x0
     c08:	9a0080e7          	jalr	-1632(ra) # 5a4 <sbrk>
     c0c:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c10:	fe843703          	ld	a4,-24(s0)
     c14:	57fd                	li	a5,-1
     c16:	00f71463          	bne	a4,a5,c1e <morecore+0x4a>
    return 0;
     c1a:	4781                	li	a5,0
     c1c:	a03d                	j	c4a <morecore+0x76>
  hp = (Header*)p;
     c1e:	fe843783          	ld	a5,-24(s0)
     c22:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c26:	fe043783          	ld	a5,-32(s0)
     c2a:	fdc42703          	lw	a4,-36(s0)
     c2e:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c30:	fe043783          	ld	a5,-32(s0)
     c34:	07c1                	addi	a5,a5,16
     c36:	853e                	mv	a0,a5
     c38:	00000097          	auipc	ra,0x0
     c3c:	e7a080e7          	jalr	-390(ra) # ab2 <free>
  return freep;
     c40:	00001797          	auipc	a5,0x1
     c44:	6d878793          	addi	a5,a5,1752 # 2318 <freep>
     c48:	639c                	ld	a5,0(a5)
}
     c4a:	853e                	mv	a0,a5
     c4c:	70a2                	ld	ra,40(sp)
     c4e:	7402                	ld	s0,32(sp)
     c50:	6145                	addi	sp,sp,48
     c52:	8082                	ret

0000000000000c54 <malloc>:

void*
malloc(uint nbytes)
{
     c54:	7139                	addi	sp,sp,-64
     c56:	fc06                	sd	ra,56(sp)
     c58:	f822                	sd	s0,48(sp)
     c5a:	0080                	addi	s0,sp,64
     c5c:	87aa                	mv	a5,a0
     c5e:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c62:	fcc46783          	lwu	a5,-52(s0)
     c66:	07bd                	addi	a5,a5,15
     c68:	8391                	srli	a5,a5,0x4
     c6a:	2781                	sext.w	a5,a5
     c6c:	2785                	addiw	a5,a5,1
     c6e:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c72:	00001797          	auipc	a5,0x1
     c76:	6a678793          	addi	a5,a5,1702 # 2318 <freep>
     c7a:	639c                	ld	a5,0(a5)
     c7c:	fef43023          	sd	a5,-32(s0)
     c80:	fe043783          	ld	a5,-32(s0)
     c84:	ef95                	bnez	a5,cc0 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     c86:	00001797          	auipc	a5,0x1
     c8a:	68278793          	addi	a5,a5,1666 # 2308 <base>
     c8e:	fef43023          	sd	a5,-32(s0)
     c92:	00001797          	auipc	a5,0x1
     c96:	68678793          	addi	a5,a5,1670 # 2318 <freep>
     c9a:	fe043703          	ld	a4,-32(s0)
     c9e:	e398                	sd	a4,0(a5)
     ca0:	00001797          	auipc	a5,0x1
     ca4:	67878793          	addi	a5,a5,1656 # 2318 <freep>
     ca8:	6398                	ld	a4,0(a5)
     caa:	00001797          	auipc	a5,0x1
     cae:	65e78793          	addi	a5,a5,1630 # 2308 <base>
     cb2:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     cb4:	00001797          	auipc	a5,0x1
     cb8:	65478793          	addi	a5,a5,1620 # 2308 <base>
     cbc:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     cc0:	fe043783          	ld	a5,-32(s0)
     cc4:	639c                	ld	a5,0(a5)
     cc6:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     cca:	fe843783          	ld	a5,-24(s0)
     cce:	4798                	lw	a4,8(a5)
     cd0:	fdc42783          	lw	a5,-36(s0)
     cd4:	2781                	sext.w	a5,a5
     cd6:	06f76863          	bltu	a4,a5,d46 <malloc+0xf2>
      if(p->s.size == nunits)
     cda:	fe843783          	ld	a5,-24(s0)
     cde:	4798                	lw	a4,8(a5)
     ce0:	fdc42783          	lw	a5,-36(s0)
     ce4:	2781                	sext.w	a5,a5
     ce6:	00e79963          	bne	a5,a4,cf8 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     cea:	fe843783          	ld	a5,-24(s0)
     cee:	6398                	ld	a4,0(a5)
     cf0:	fe043783          	ld	a5,-32(s0)
     cf4:	e398                	sd	a4,0(a5)
     cf6:	a82d                	j	d30 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     cf8:	fe843783          	ld	a5,-24(s0)
     cfc:	4798                	lw	a4,8(a5)
     cfe:	fdc42783          	lw	a5,-36(s0)
     d02:	40f707bb          	subw	a5,a4,a5
     d06:	0007871b          	sext.w	a4,a5
     d0a:	fe843783          	ld	a5,-24(s0)
     d0e:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d10:	fe843783          	ld	a5,-24(s0)
     d14:	479c                	lw	a5,8(a5)
     d16:	1782                	slli	a5,a5,0x20
     d18:	9381                	srli	a5,a5,0x20
     d1a:	0792                	slli	a5,a5,0x4
     d1c:	fe843703          	ld	a4,-24(s0)
     d20:	97ba                	add	a5,a5,a4
     d22:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d26:	fe843783          	ld	a5,-24(s0)
     d2a:	fdc42703          	lw	a4,-36(s0)
     d2e:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d30:	00001797          	auipc	a5,0x1
     d34:	5e878793          	addi	a5,a5,1512 # 2318 <freep>
     d38:	fe043703          	ld	a4,-32(s0)
     d3c:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d3e:	fe843783          	ld	a5,-24(s0)
     d42:	07c1                	addi	a5,a5,16
     d44:	a091                	j	d88 <malloc+0x134>
    }
    if(p == freep)
     d46:	00001797          	auipc	a5,0x1
     d4a:	5d278793          	addi	a5,a5,1490 # 2318 <freep>
     d4e:	639c                	ld	a5,0(a5)
     d50:	fe843703          	ld	a4,-24(s0)
     d54:	02f71063          	bne	a4,a5,d74 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d58:	fdc42783          	lw	a5,-36(s0)
     d5c:	853e                	mv	a0,a5
     d5e:	00000097          	auipc	ra,0x0
     d62:	e76080e7          	jalr	-394(ra) # bd4 <morecore>
     d66:	fea43423          	sd	a0,-24(s0)
     d6a:	fe843783          	ld	a5,-24(s0)
     d6e:	e399                	bnez	a5,d74 <malloc+0x120>
        return 0;
     d70:	4781                	li	a5,0
     d72:	a819                	j	d88 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d74:	fe843783          	ld	a5,-24(s0)
     d78:	fef43023          	sd	a5,-32(s0)
     d7c:	fe843783          	ld	a5,-24(s0)
     d80:	639c                	ld	a5,0(a5)
     d82:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d86:	b791                	j	cca <malloc+0x76>
  }
}
     d88:	853e                	mv	a0,a5
     d8a:	70e2                	ld	ra,56(sp)
     d8c:	7442                	ld	s0,48(sp)
     d8e:	6121                	addi	sp,sp,64
     d90:	8082                	ret

0000000000000d92 <setjmp>:
     d92:	e100                	sd	s0,0(a0)
     d94:	e504                	sd	s1,8(a0)
     d96:	01253823          	sd	s2,16(a0)
     d9a:	01353c23          	sd	s3,24(a0)
     d9e:	03453023          	sd	s4,32(a0)
     da2:	03553423          	sd	s5,40(a0)
     da6:	03653823          	sd	s6,48(a0)
     daa:	03753c23          	sd	s7,56(a0)
     dae:	05853023          	sd	s8,64(a0)
     db2:	05953423          	sd	s9,72(a0)
     db6:	05a53823          	sd	s10,80(a0)
     dba:	05b53c23          	sd	s11,88(a0)
     dbe:	06153023          	sd	ra,96(a0)
     dc2:	06253423          	sd	sp,104(a0)
     dc6:	4501                	li	a0,0
     dc8:	8082                	ret

0000000000000dca <longjmp>:
     dca:	6100                	ld	s0,0(a0)
     dcc:	6504                	ld	s1,8(a0)
     dce:	01053903          	ld	s2,16(a0)
     dd2:	01853983          	ld	s3,24(a0)
     dd6:	02053a03          	ld	s4,32(a0)
     dda:	02853a83          	ld	s5,40(a0)
     dde:	03053b03          	ld	s6,48(a0)
     de2:	03853b83          	ld	s7,56(a0)
     de6:	04053c03          	ld	s8,64(a0)
     dea:	04853c83          	ld	s9,72(a0)
     dee:	05053d03          	ld	s10,80(a0)
     df2:	05853d83          	ld	s11,88(a0)
     df6:	06053083          	ld	ra,96(a0)
     dfa:	06853103          	ld	sp,104(a0)
     dfe:	c199                	beqz	a1,e04 <longjmp_1>
     e00:	852e                	mv	a0,a1
     e02:	8082                	ret

0000000000000e04 <longjmp_1>:
     e04:	4505                	li	a0,1
     e06:	8082                	ret

0000000000000e08 <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     e08:	7179                	addi	sp,sp,-48
     e0a:	f422                	sd	s0,40(sp)
     e0c:	1800                	addi	s0,sp,48
     e0e:	fea43423          	sd	a0,-24(s0)
     e12:	feb43023          	sd	a1,-32(s0)
     e16:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     e1a:	fd843783          	ld	a5,-40(s0)
     e1e:	fe843703          	ld	a4,-24(s0)
     e22:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     e24:	fe843783          	ld	a5,-24(s0)
     e28:	fd843703          	ld	a4,-40(s0)
     e2c:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     e2e:	fe843783          	ld	a5,-24(s0)
     e32:	fe043703          	ld	a4,-32(s0)
     e36:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     e38:	fe043783          	ld	a5,-32(s0)
     e3c:	fe843703          	ld	a4,-24(s0)
     e40:	e398                	sd	a4,0(a5)
 }
     e42:	0001                	nop
     e44:	7422                	ld	s0,40(sp)
     e46:	6145                	addi	sp,sp,48
     e48:	8082                	ret

0000000000000e4a <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     e4a:	1101                	addi	sp,sp,-32
     e4c:	ec06                	sd	ra,24(sp)
     e4e:	e822                	sd	s0,16(sp)
     e50:	1000                	addi	s0,sp,32
     e52:	fea43423          	sd	a0,-24(s0)
     e56:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     e5a:	fe043783          	ld	a5,-32(s0)
     e5e:	679c                	ld	a5,8(a5)
     e60:	fe043603          	ld	a2,-32(s0)
     e64:	85be                	mv	a1,a5
     e66:	fe843503          	ld	a0,-24(s0)
     e6a:	00000097          	auipc	ra,0x0
     e6e:	f9e080e7          	jalr	-98(ra) # e08 <__list_add>
 }
     e72:	0001                	nop
     e74:	60e2                	ld	ra,24(sp)
     e76:	6442                	ld	s0,16(sp)
     e78:	6105                	addi	sp,sp,32
     e7a:	8082                	ret

0000000000000e7c <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     e7c:	1101                	addi	sp,sp,-32
     e7e:	ec22                	sd	s0,24(sp)
     e80:	1000                	addi	s0,sp,32
     e82:	fea43423          	sd	a0,-24(s0)
     e86:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
     e8a:	fe043783          	ld	a5,-32(s0)
     e8e:	fe843703          	ld	a4,-24(s0)
     e92:	e798                	sd	a4,8(a5)
     prev->next = next;
     e94:	fe843783          	ld	a5,-24(s0)
     e98:	fe043703          	ld	a4,-32(s0)
     e9c:	e398                	sd	a4,0(a5)
 }
     e9e:	0001                	nop
     ea0:	6462                	ld	s0,24(sp)
     ea2:	6105                	addi	sp,sp,32
     ea4:	8082                	ret

0000000000000ea6 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     ea6:	1101                	addi	sp,sp,-32
     ea8:	ec06                	sd	ra,24(sp)
     eaa:	e822                	sd	s0,16(sp)
     eac:	1000                	addi	s0,sp,32
     eae:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
     eb2:	fe843783          	ld	a5,-24(s0)
     eb6:	6798                	ld	a4,8(a5)
     eb8:	fe843783          	ld	a5,-24(s0)
     ebc:	639c                	ld	a5,0(a5)
     ebe:	85be                	mv	a1,a5
     ec0:	853a                	mv	a0,a4
     ec2:	00000097          	auipc	ra,0x0
     ec6:	fba080e7          	jalr	-70(ra) # e7c <__list_del>
     entry->next = LIST_POISON1;
     eca:	fe843783          	ld	a5,-24(s0)
     ece:	00100737          	lui	a4,0x100
     ed2:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd640>
     ed6:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
     ed8:	fe843783          	ld	a5,-24(s0)
     edc:	00200737          	lui	a4,0x200
     ee0:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd740>
     ee4:	e798                	sd	a4,8(a5)
 }
     ee6:	0001                	nop
     ee8:	60e2                	ld	ra,24(sp)
     eea:	6442                	ld	s0,16(sp)
     eec:	6105                	addi	sp,sp,32
     eee:	8082                	ret

0000000000000ef0 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
     ef0:	1101                	addi	sp,sp,-32
     ef2:	ec22                	sd	s0,24(sp)
     ef4:	1000                	addi	s0,sp,32
     ef6:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
     efa:	fe843783          	ld	a5,-24(s0)
     efe:	639c                	ld	a5,0(a5)
     f00:	fe843703          	ld	a4,-24(s0)
     f04:	40f707b3          	sub	a5,a4,a5
     f08:	0017b793          	seqz	a5,a5
     f0c:	0ff7f793          	andi	a5,a5,255
     f10:	2781                	sext.w	a5,a5
 }
     f12:	853e                	mv	a0,a5
     f14:	6462                	ld	s0,24(sp)
     f16:	6105                	addi	sp,sp,32
     f18:	8082                	ret

0000000000000f1a <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     f1a:	715d                	addi	sp,sp,-80
     f1c:	e486                	sd	ra,72(sp)
     f1e:	e0a2                	sd	s0,64(sp)
     f20:	0880                	addi	s0,sp,80
     f22:	fca43423          	sd	a0,-56(s0)
     f26:	fcb43023          	sd	a1,-64(s0)
     f2a:	85b2                	mv	a1,a2
     f2c:	8636                	mv	a2,a3
     f2e:	86ba                	mv	a3,a4
     f30:	873e                	mv	a4,a5
     f32:	87ae                	mv	a5,a1
     f34:	faf42e23          	sw	a5,-68(s0)
     f38:	87b2                	mv	a5,a2
     f3a:	faf42c23          	sw	a5,-72(s0)
     f3e:	87b6                	mv	a5,a3
     f40:	faf42a23          	sw	a5,-76(s0)
     f44:	87ba                	mv	a5,a4
     f46:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     f4a:	08000513          	li	a0,128
     f4e:	00000097          	auipc	ra,0x0
     f52:	d06080e7          	jalr	-762(ra) # c54 <malloc>
     f56:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     f5a:	6505                	lui	a0,0x1
     f5c:	00000097          	auipc	ra,0x0
     f60:	cf8080e7          	jalr	-776(ra) # c54 <malloc>
     f64:	87aa                	mv	a5,a0
     f66:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     f6a:	fe043703          	ld	a4,-32(s0)
     f6e:	6785                	lui	a5,0x1
     f70:	17c1                	addi	a5,a5,-16
     f72:	97ba                	add	a5,a5,a4
     f74:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     f78:	fe843783          	ld	a5,-24(s0)
     f7c:	fc843703          	ld	a4,-56(s0)
     f80:	e398                	sd	a4,0(a5)
    t->arg = arg;
     f82:	fe843783          	ld	a5,-24(s0)
     f86:	fc043703          	ld	a4,-64(s0)
     f8a:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     f8c:	00001797          	auipc	a5,0x1
     f90:	37078793          	addi	a5,a5,880 # 22fc <_id.1241>
     f94:	439c                	lw	a5,0(a5)
     f96:	0017871b          	addiw	a4,a5,1
     f9a:	0007069b          	sext.w	a3,a4
     f9e:	00001717          	auipc	a4,0x1
     fa2:	35e70713          	addi	a4,a4,862 # 22fc <_id.1241>
     fa6:	c314                	sw	a3,0(a4)
     fa8:	fe843703          	ld	a4,-24(s0)
     fac:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
     fae:	fe843783          	ld	a5,-24(s0)
     fb2:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
     fb6:	fe043703          	ld	a4,-32(s0)
     fba:	fe843783          	ld	a5,-24(s0)
     fbe:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
     fc0:	fd843703          	ld	a4,-40(s0)
     fc4:	fe843783          	ld	a5,-24(s0)
     fc8:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
     fca:	fe843783          	ld	a5,-24(s0)
     fce:	fb842703          	lw	a4,-72(s0)
     fd2:	c3f8                	sw	a4,68(a5)
    t->period = period;
     fd4:	fe843783          	ld	a5,-24(s0)
     fd8:	fb442703          	lw	a4,-76(s0)
     fdc:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
     fde:	fe843783          	ld	a5,-24(s0)
     fe2:	fb442703          	lw	a4,-76(s0)
     fe6:	c7b8                	sw	a4,72(a5)
    t->n = n;
     fe8:	fe843783          	ld	a5,-24(s0)
     fec:	fb042703          	lw	a4,-80(s0)
     ff0:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
     ff2:	fe843783          	ld	a5,-24(s0)
     ff6:	fbc42703          	lw	a4,-68(s0)
     ffa:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
     ffc:	fe843783          	ld	a5,-24(s0)
    1000:	fb842703          	lw	a4,-72(s0)
    1004:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    1006:	fe843783          	ld	a5,-24(s0)
    100a:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    100e:	fe843783          	ld	a5,-24(s0)
    1012:	06400713          	li	a4,100
    1016:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    1018:	fe843783          	ld	a5,-24(s0)
    101c:	671d                	lui	a4,0x7
    101e:	5307071b          	addiw	a4,a4,1328
    1022:	d3b8                	sw	a4,96(a5)
    
    return t;
    1024:	fe843783          	ld	a5,-24(s0)
}
    1028:	853e                	mv	a0,a5
    102a:	60a6                	ld	ra,72(sp)
    102c:	6406                	ld	s0,64(sp)
    102e:	6161                	addi	sp,sp,80
    1030:	8082                	ret

0000000000001032 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    1032:	1101                	addi	sp,sp,-32
    1034:	ec22                	sd	s0,24(sp)
    1036:	1000                	addi	s0,sp,32
    1038:	fea43423          	sd	a0,-24(s0)
    103c:	87ae                	mv	a5,a1
    103e:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    1042:	fe843783          	ld	a5,-24(s0)
    1046:	fe442703          	lw	a4,-28(s0)
    104a:	cff8                	sw	a4,92(a5)
}
    104c:	0001                	nop
    104e:	6462                	ld	s0,24(sp)
    1050:	6105                	addi	sp,sp,32
    1052:	8082                	ret

0000000000001054 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    1054:	1101                	addi	sp,sp,-32
    1056:	ec22                	sd	s0,24(sp)
    1058:	1000                	addi	s0,sp,32
    105a:	fea43423          	sd	a0,-24(s0)
    105e:	87ae                	mv	a5,a1
    1060:	8732                	mv	a4,a2
    1062:	fef42223          	sw	a5,-28(s0)
    1066:	87ba                	mv	a5,a4
    1068:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    106c:	fe843783          	ld	a5,-24(s0)
    1070:	fe442703          	lw	a4,-28(s0)
    1074:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    1076:	fe843783          	ld	a5,-24(s0)
    107a:	fe442703          	lw	a4,-28(s0)
    107e:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    1080:	fe843783          	ld	a5,-24(s0)
    1084:	fe042703          	lw	a4,-32(s0)
    1088:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    108a:	fe843783          	ld	a5,-24(s0)
    108e:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1092:	fe843783          	ld	a5,-24(s0)
    1096:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    109a:	fe843783          	ld	a5,-24(s0)
    109e:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    10a2:	fe843783          	ld	a5,-24(s0)
    10a6:	0607ae23          	sw	zero,124(a5)
}
    10aa:	0001                	nop
    10ac:	6462                	ld	s0,24(sp)
    10ae:	6105                	addi	sp,sp,32
    10b0:	8082                	ret

00000000000010b2 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    10b2:	7179                	addi	sp,sp,-48
    10b4:	f406                	sd	ra,40(sp)
    10b6:	f022                	sd	s0,32(sp)
    10b8:	1800                	addi	s0,sp,48
    10ba:	fca43c23          	sd	a0,-40(s0)
    10be:	87ae                	mv	a5,a1
    10c0:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    10c4:	02000513          	li	a0,32
    10c8:	00000097          	auipc	ra,0x0
    10cc:	b8c080e7          	jalr	-1140(ra) # c54 <malloc>
    10d0:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    10d4:	fe843783          	ld	a5,-24(s0)
    10d8:	fd843703          	ld	a4,-40(s0)
    10dc:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    10de:	fe843783          	ld	a5,-24(s0)
    10e2:	fd442703          	lw	a4,-44(s0)
    10e6:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    10e8:	fd843783          	ld	a5,-40(s0)
    10ec:	fd442703          	lw	a4,-44(s0)
    10f0:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    10f2:	fd843783          	ld	a5,-40(s0)
    10f6:	43bc                	lw	a5,64(a5)
    10f8:	cf81                	beqz	a5,1110 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    10fa:	fd843783          	ld	a5,-40(s0)
    10fe:	47bc                	lw	a5,72(a5)
    1100:	fd442703          	lw	a4,-44(s0)
    1104:	9fb9                	addw	a5,a5,a4
    1106:	0007871b          	sext.w	a4,a5
    110a:	fd843783          	ld	a5,-40(s0)
    110e:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1110:	fe843783          	ld	a5,-24(s0)
    1114:	07a1                	addi	a5,a5,8
    1116:	00001597          	auipc	a1,0x1
    111a:	1d258593          	addi	a1,a1,466 # 22e8 <release_queue>
    111e:	853e                	mv	a0,a5
    1120:	00000097          	auipc	ra,0x0
    1124:	d2a080e7          	jalr	-726(ra) # e4a <list_add_tail>
}
    1128:	0001                	nop
    112a:	70a2                	ld	ra,40(sp)
    112c:	7402                	ld	s0,32(sp)
    112e:	6145                	addi	sp,sp,48
    1130:	8082                	ret

0000000000001132 <__release>:

void __release()
{
    1132:	7139                	addi	sp,sp,-64
    1134:	fc06                	sd	ra,56(sp)
    1136:	f822                	sd	s0,48(sp)
    1138:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    113a:	00001797          	auipc	a5,0x1
    113e:	1ae78793          	addi	a5,a5,430 # 22e8 <release_queue>
    1142:	639c                	ld	a5,0(a5)
    1144:	fcf43c23          	sd	a5,-40(s0)
    1148:	fd843783          	ld	a5,-40(s0)
    114c:	17e1                	addi	a5,a5,-8
    114e:	fef43423          	sd	a5,-24(s0)
    1152:	fe843783          	ld	a5,-24(s0)
    1156:	679c                	ld	a5,8(a5)
    1158:	fcf43823          	sd	a5,-48(s0)
    115c:	fd043783          	ld	a5,-48(s0)
    1160:	17e1                	addi	a5,a5,-8
    1162:	fef43023          	sd	a5,-32(s0)
    1166:	a0e9                	j	1230 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    1168:	fe843783          	ld	a5,-24(s0)
    116c:	4f98                	lw	a4,24(a5)
    116e:	00001797          	auipc	a5,0x1
    1172:	1ba78793          	addi	a5,a5,442 # 2328 <threading_system_time>
    1176:	439c                	lw	a5,0(a5)
    1178:	08e7ce63          	blt	a5,a4,1214 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    117c:	fe843783          	ld	a5,-24(s0)
    1180:	639c                	ld	a5,0(a5)
    1182:	5bbc                	lw	a5,112(a5)
    1184:	c79d                	beqz	a5,11b2 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    1186:	fe843783          	ld	a5,-24(s0)
    118a:	639c                	ld	a5,0(a5)
    118c:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    1190:	fe843783          	ld	a5,-24(s0)
    1194:	6398                	ld	a4,0(a5)
    1196:	fe843783          	ld	a5,-24(s0)
    119a:	639c                	ld	a5,0(a5)
    119c:	5378                	lw	a4,100(a4)
    119e:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    11a0:	fe843783          	ld	a5,-24(s0)
    11a4:	6398                	ld	a4,0(a5)
    11a6:	fe843783          	ld	a5,-24(s0)
    11aa:	639c                	ld	a5,0(a5)
    11ac:	5f78                	lw	a4,124(a4)
    11ae:	cbf8                	sw	a4,84(a5)
    11b0:	a809                	j	11c2 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    11b2:	fe843783          	ld	a5,-24(s0)
    11b6:	6398                	ld	a4,0(a5)
    11b8:	fe843783          	ld	a5,-24(s0)
    11bc:	639c                	ld	a5,0(a5)
    11be:	4378                	lw	a4,68(a4)
    11c0:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    11c2:	fe843783          	ld	a5,-24(s0)
    11c6:	4f94                	lw	a3,24(a5)
    11c8:	fe843783          	ld	a5,-24(s0)
    11cc:	639c                	ld	a5,0(a5)
    11ce:	47b8                	lw	a4,72(a5)
    11d0:	fe843783          	ld	a5,-24(s0)
    11d4:	639c                	ld	a5,0(a5)
    11d6:	9f35                	addw	a4,a4,a3
    11d8:	2701                	sext.w	a4,a4
    11da:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    11dc:	fe843783          	ld	a5,-24(s0)
    11e0:	639c                	ld	a5,0(a5)
    11e2:	02878793          	addi	a5,a5,40
    11e6:	00001597          	auipc	a1,0x1
    11ea:	0f258593          	addi	a1,a1,242 # 22d8 <run_queue>
    11ee:	853e                	mv	a0,a5
    11f0:	00000097          	auipc	ra,0x0
    11f4:	c5a080e7          	jalr	-934(ra) # e4a <list_add_tail>
            list_del(&cur->thread_list);
    11f8:	fe843783          	ld	a5,-24(s0)
    11fc:	07a1                	addi	a5,a5,8
    11fe:	853e                	mv	a0,a5
    1200:	00000097          	auipc	ra,0x0
    1204:	ca6080e7          	jalr	-858(ra) # ea6 <list_del>
            free(cur);
    1208:	fe843503          	ld	a0,-24(s0)
    120c:	00000097          	auipc	ra,0x0
    1210:	8a6080e7          	jalr	-1882(ra) # ab2 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1214:	fe043783          	ld	a5,-32(s0)
    1218:	fef43423          	sd	a5,-24(s0)
    121c:	fe043783          	ld	a5,-32(s0)
    1220:	679c                	ld	a5,8(a5)
    1222:	fcf43423          	sd	a5,-56(s0)
    1226:	fc843783          	ld	a5,-56(s0)
    122a:	17e1                	addi	a5,a5,-8
    122c:	fef43023          	sd	a5,-32(s0)
    1230:	fe843783          	ld	a5,-24(s0)
    1234:	00878713          	addi	a4,a5,8
    1238:	00001797          	auipc	a5,0x1
    123c:	0b078793          	addi	a5,a5,176 # 22e8 <release_queue>
    1240:	f2f714e3          	bne	a4,a5,1168 <__release+0x36>
        }
    }
}
    1244:	0001                	nop
    1246:	0001                	nop
    1248:	70e2                	ld	ra,56(sp)
    124a:	7442                	ld	s0,48(sp)
    124c:	6121                	addi	sp,sp,64
    124e:	8082                	ret

0000000000001250 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    1250:	1101                	addi	sp,sp,-32
    1252:	ec06                	sd	ra,24(sp)
    1254:	e822                	sd	s0,16(sp)
    1256:	1000                	addi	s0,sp,32
    1258:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    125c:	fe843783          	ld	a5,-24(s0)
    1260:	7b98                	ld	a4,48(a5)
    1262:	00001797          	auipc	a5,0x1
    1266:	0be78793          	addi	a5,a5,190 # 2320 <current>
    126a:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    126c:	fe843783          	ld	a5,-24(s0)
    1270:	02878793          	addi	a5,a5,40
    1274:	853e                	mv	a0,a5
    1276:	00000097          	auipc	ra,0x0
    127a:	c30080e7          	jalr	-976(ra) # ea6 <list_del>

    free(to_remove->stack);
    127e:	fe843783          	ld	a5,-24(s0)
    1282:	6b9c                	ld	a5,16(a5)
    1284:	853e                	mv	a0,a5
    1286:	00000097          	auipc	ra,0x0
    128a:	82c080e7          	jalr	-2004(ra) # ab2 <free>
    free(to_remove);
    128e:	fe843503          	ld	a0,-24(s0)
    1292:	00000097          	auipc	ra,0x0
    1296:	820080e7          	jalr	-2016(ra) # ab2 <free>

    __schedule();
    129a:	00000097          	auipc	ra,0x0
    129e:	5e8080e7          	jalr	1512(ra) # 1882 <__schedule>
    __dispatch();
    12a2:	00000097          	auipc	ra,0x0
    12a6:	416080e7          	jalr	1046(ra) # 16b8 <__dispatch>
    thrdresume(main_thrd_id);
    12aa:	00001797          	auipc	a5,0x1
    12ae:	04e78793          	addi	a5,a5,78 # 22f8 <main_thrd_id>
    12b2:	439c                	lw	a5,0(a5)
    12b4:	853e                	mv	a0,a5
    12b6:	fffff097          	auipc	ra,0xfffff
    12ba:	30e080e7          	jalr	782(ra) # 5c4 <thrdresume>
}
    12be:	0001                	nop
    12c0:	60e2                	ld	ra,24(sp)
    12c2:	6442                	ld	s0,16(sp)
    12c4:	6105                	addi	sp,sp,32
    12c6:	8082                	ret

00000000000012c8 <thread_exit>:

void thread_exit(void)
{
    12c8:	7179                	addi	sp,sp,-48
    12ca:	f406                	sd	ra,40(sp)
    12cc:	f022                	sd	s0,32(sp)
    12ce:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    12d0:	00001797          	auipc	a5,0x1
    12d4:	05078793          	addi	a5,a5,80 # 2320 <current>
    12d8:	6398                	ld	a4,0(a5)
    12da:	00001797          	auipc	a5,0x1
    12de:	ffe78793          	addi	a5,a5,-2 # 22d8 <run_queue>
    12e2:	02f71063          	bne	a4,a5,1302 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    12e6:	00001597          	auipc	a1,0x1
    12ea:	d6258593          	addi	a1,a1,-670 # 2048 <schedule_edf_cbs+0x4f0>
    12ee:	4509                	li	a0,2
    12f0:	fffff097          	auipc	ra,0xfffff
    12f4:	71a080e7          	jalr	1818(ra) # a0a <fprintf>
        exit(1);
    12f8:	4505                	li	a0,1
    12fa:	fffff097          	auipc	ra,0xfffff
    12fe:	222080e7          	jalr	546(ra) # 51c <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    1302:	00001797          	auipc	a5,0x1
    1306:	01e78793          	addi	a5,a5,30 # 2320 <current>
    130a:	639c                	ld	a5,0(a5)
    130c:	fef43423          	sd	a5,-24(s0)
    1310:	fe843783          	ld	a5,-24(s0)
    1314:	fd878793          	addi	a5,a5,-40
    1318:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    131c:	fe043783          	ld	a5,-32(s0)
    1320:	5f9c                	lw	a5,56(a5)
    1322:	4585                	li	a1,1
    1324:	853e                	mv	a0,a5
    1326:	fffff097          	auipc	ra,0xfffff
    132a:	2a6080e7          	jalr	678(ra) # 5cc <cancelthrdstop>
    132e:	87aa                	mv	a5,a0
    1330:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    1334:	00001797          	auipc	a5,0x1
    1338:	ff478793          	addi	a5,a5,-12 # 2328 <threading_system_time>
    133c:	439c                	lw	a5,0(a5)
    133e:	fdc42703          	lw	a4,-36(s0)
    1342:	9fb9                	addw	a5,a5,a4
    1344:	0007871b          	sext.w	a4,a5
    1348:	00001797          	auipc	a5,0x1
    134c:	fe078793          	addi	a5,a5,-32 # 2328 <threading_system_time>
    1350:	c398                	sw	a4,0(a5)

    __release();
    1352:	00000097          	auipc	ra,0x0
    1356:	de0080e7          	jalr	-544(ra) # 1132 <__release>
    __thread_exit(to_remove);
    135a:	fe043503          	ld	a0,-32(s0)
    135e:	00000097          	auipc	ra,0x0
    1362:	ef2080e7          	jalr	-270(ra) # 1250 <__thread_exit>
}
    1366:	0001                	nop
    1368:	70a2                	ld	ra,40(sp)
    136a:	7402                	ld	s0,32(sp)
    136c:	6145                	addi	sp,sp,48
    136e:	8082                	ret

0000000000001370 <__finish_current>:

void __finish_current()
{
    1370:	7179                	addi	sp,sp,-48
    1372:	f406                	sd	ra,40(sp)
    1374:	f022                	sd	s0,32(sp)
    1376:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1378:	00001797          	auipc	a5,0x1
    137c:	fa878793          	addi	a5,a5,-88 # 2320 <current>
    1380:	639c                	ld	a5,0(a5)
    1382:	fef43423          	sd	a5,-24(s0)
    1386:	fe843783          	ld	a5,-24(s0)
    138a:	fd878793          	addi	a5,a5,-40
    138e:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1392:	fe043783          	ld	a5,-32(s0)
    1396:	4bbc                	lw	a5,80(a5)
    1398:	37fd                	addiw	a5,a5,-1
    139a:	0007871b          	sext.w	a4,a5
    139e:	fe043783          	ld	a5,-32(s0)
    13a2:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    13a4:	fe043783          	ld	a5,-32(s0)
    13a8:	5fd8                	lw	a4,60(a5)
    13aa:	00001797          	auipc	a5,0x1
    13ae:	f7e78793          	addi	a5,a5,-130 # 2328 <threading_system_time>
    13b2:	4390                	lw	a2,0(a5)
    13b4:	fe043783          	ld	a5,-32(s0)
    13b8:	4bbc                	lw	a5,80(a5)
    13ba:	86be                	mv	a3,a5
    13bc:	85ba                	mv	a1,a4
    13be:	00001517          	auipc	a0,0x1
    13c2:	cc250513          	addi	a0,a0,-830 # 2080 <schedule_edf_cbs+0x528>
    13c6:	fffff097          	auipc	ra,0xfffff
    13ca:	69c080e7          	jalr	1692(ra) # a62 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    13ce:	fe043783          	ld	a5,-32(s0)
    13d2:	4bbc                	lw	a5,80(a5)
    13d4:	04f05563          	blez	a5,141e <__finish_current+0xae>
        struct list_head *to_remove = current;
    13d8:	00001797          	auipc	a5,0x1
    13dc:	f4878793          	addi	a5,a5,-184 # 2320 <current>
    13e0:	639c                	ld	a5,0(a5)
    13e2:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    13e6:	00001797          	auipc	a5,0x1
    13ea:	f3a78793          	addi	a5,a5,-198 # 2320 <current>
    13ee:	639c                	ld	a5,0(a5)
    13f0:	6798                	ld	a4,8(a5)
    13f2:	00001797          	auipc	a5,0x1
    13f6:	f2e78793          	addi	a5,a5,-210 # 2320 <current>
    13fa:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    13fc:	fd843503          	ld	a0,-40(s0)
    1400:	00000097          	auipc	ra,0x0
    1404:	aa6080e7          	jalr	-1370(ra) # ea6 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    1408:	fe043783          	ld	a5,-32(s0)
    140c:	4fbc                	lw	a5,88(a5)
    140e:	85be                	mv	a1,a5
    1410:	fe043503          	ld	a0,-32(s0)
    1414:	00000097          	auipc	ra,0x0
    1418:	c9e080e7          	jalr	-866(ra) # 10b2 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    141c:	a039                	j	142a <__finish_current+0xba>
        __thread_exit(current_thread);
    141e:	fe043503          	ld	a0,-32(s0)
    1422:	00000097          	auipc	ra,0x0
    1426:	e2e080e7          	jalr	-466(ra) # 1250 <__thread_exit>
}
    142a:	0001                	nop
    142c:	70a2                	ld	ra,40(sp)
    142e:	7402                	ld	s0,32(sp)
    1430:	6145                	addi	sp,sp,48
    1432:	8082                	ret

0000000000001434 <__rt_finish_current>:
void __rt_finish_current()
{
    1434:	7179                	addi	sp,sp,-48
    1436:	f406                	sd	ra,40(sp)
    1438:	f022                	sd	s0,32(sp)
    143a:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    143c:	00001797          	auipc	a5,0x1
    1440:	ee478793          	addi	a5,a5,-284 # 2320 <current>
    1444:	639c                	ld	a5,0(a5)
    1446:	fef43423          	sd	a5,-24(s0)
    144a:	fe843783          	ld	a5,-24(s0)
    144e:	fd878793          	addi	a5,a5,-40
    1452:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1456:	fe043783          	ld	a5,-32(s0)
    145a:	4bbc                	lw	a5,80(a5)
    145c:	37fd                	addiw	a5,a5,-1
    145e:	0007871b          	sext.w	a4,a5
    1462:	fe043783          	ld	a5,-32(s0)
    1466:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    1468:	fe043783          	ld	a5,-32(s0)
    146c:	5fd8                	lw	a4,60(a5)
    146e:	00001797          	auipc	a5,0x1
    1472:	eba78793          	addi	a5,a5,-326 # 2328 <threading_system_time>
    1476:	4390                	lw	a2,0(a5)
    1478:	fe043783          	ld	a5,-32(s0)
    147c:	4bbc                	lw	a5,80(a5)
    147e:	86be                	mv	a3,a5
    1480:	85ba                	mv	a1,a4
    1482:	00001517          	auipc	a0,0x1
    1486:	c1650513          	addi	a0,a0,-1002 # 2098 <schedule_edf_cbs+0x540>
    148a:	fffff097          	auipc	ra,0xfffff
    148e:	5d8080e7          	jalr	1496(ra) # a62 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1492:	fe043783          	ld	a5,-32(s0)
    1496:	4bbc                	lw	a5,80(a5)
    1498:	04f05f63          	blez	a5,14f6 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    149c:	00001797          	auipc	a5,0x1
    14a0:	e8478793          	addi	a5,a5,-380 # 2320 <current>
    14a4:	639c                	ld	a5,0(a5)
    14a6:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    14aa:	00001797          	auipc	a5,0x1
    14ae:	e7678793          	addi	a5,a5,-394 # 2320 <current>
    14b2:	639c                	ld	a5,0(a5)
    14b4:	6798                	ld	a4,8(a5)
    14b6:	00001797          	auipc	a5,0x1
    14ba:	e6a78793          	addi	a5,a5,-406 # 2320 <current>
    14be:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    14c0:	fd843503          	ld	a0,-40(s0)
    14c4:	00000097          	auipc	ra,0x0
    14c8:	9e2080e7          	jalr	-1566(ra) # ea6 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    14cc:	fe043783          	ld	a5,-32(s0)
    14d0:	4fbc                	lw	a5,88(a5)
    14d2:	85be                	mv	a1,a5
    14d4:	fe043503          	ld	a0,-32(s0)
    14d8:	00000097          	auipc	ra,0x0
    14dc:	bda080e7          	jalr	-1062(ra) # 10b2 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    14e0:	fe043783          	ld	a5,-32(s0)
    14e4:	57fc                	lw	a5,108(a5)
    14e6:	ef91                	bnez	a5,1502 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    14e8:	fe043783          	ld	a5,-32(s0)
    14ec:	53f8                	lw	a4,100(a5)
    14ee:	fe043783          	ld	a5,-32(s0)
    14f2:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    14f4:	a039                	j	1502 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    14f6:	fe043503          	ld	a0,-32(s0)
    14fa:	00000097          	auipc	ra,0x0
    14fe:	d56080e7          	jalr	-682(ra) # 1250 <__thread_exit>
}
    1502:	0001                	nop
    1504:	70a2                	ld	ra,40(sp)
    1506:	7402                	ld	s0,32(sp)
    1508:	6145                	addi	sp,sp,48
    150a:	8082                	ret

000000000000150c <switch_handler>:

void switch_handler(void *arg)
{
    150c:	7139                	addi	sp,sp,-64
    150e:	fc06                	sd	ra,56(sp)
    1510:	f822                	sd	s0,48(sp)
    1512:	0080                	addi	s0,sp,64
    1514:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    1518:	fc843783          	ld	a5,-56(s0)
    151c:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1520:	00001797          	auipc	a5,0x1
    1524:	e0078793          	addi	a5,a5,-512 # 2320 <current>
    1528:	639c                	ld	a5,0(a5)
    152a:	fef43023          	sd	a5,-32(s0)
    152e:	fe043783          	ld	a5,-32(s0)
    1532:	fd878793          	addi	a5,a5,-40
    1536:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    153a:	fe843783          	ld	a5,-24(s0)
    153e:	0007871b          	sext.w	a4,a5
    1542:	00001797          	auipc	a5,0x1
    1546:	de678793          	addi	a5,a5,-538 # 2328 <threading_system_time>
    154a:	439c                	lw	a5,0(a5)
    154c:	2781                	sext.w	a5,a5
    154e:	9fb9                	addw	a5,a5,a4
    1550:	2781                	sext.w	a5,a5
    1552:	0007871b          	sext.w	a4,a5
    1556:	00001797          	auipc	a5,0x1
    155a:	dd278793          	addi	a5,a5,-558 # 2328 <threading_system_time>
    155e:	c398                	sw	a4,0(a5)
     __release();
    1560:	00000097          	auipc	ra,0x0
    1564:	bd2080e7          	jalr	-1070(ra) # 1132 <__release>
    current_thread->remaining_time -= elapsed_time;
    1568:	fd843783          	ld	a5,-40(s0)
    156c:	4bfc                	lw	a5,84(a5)
    156e:	0007871b          	sext.w	a4,a5
    1572:	fe843783          	ld	a5,-24(s0)
    1576:	2781                	sext.w	a5,a5
    1578:	40f707bb          	subw	a5,a4,a5
    157c:	2781                	sext.w	a5,a5
    157e:	0007871b          	sext.w	a4,a5
    1582:	fd843783          	ld	a5,-40(s0)
    1586:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    1588:	fd843783          	ld	a5,-40(s0)
    158c:	57fc                	lw	a5,108(a5)
    158e:	e38d                	bnez	a5,15b0 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    1590:	fd843783          	ld	a5,-40(s0)
    1594:	57bc                	lw	a5,104(a5)
    1596:	0007871b          	sext.w	a4,a5
    159a:	fe843783          	ld	a5,-24(s0)
    159e:	2781                	sext.w	a5,a5
    15a0:	40f707bb          	subw	a5,a4,a5
    15a4:	2781                	sext.w	a5,a5
    15a6:	0007871b          	sext.w	a4,a5
    15aa:	fd843783          	ld	a5,-40(s0)
    15ae:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    15b0:	fd843783          	ld	a5,-40(s0)
    15b4:	43bc                	lw	a5,64(a5)
    15b6:	c3ad                	beqz	a5,1618 <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    15b8:	fd843783          	ld	a5,-40(s0)
    15bc:	4fb8                	lw	a4,88(a5)
    15be:	00001797          	auipc	a5,0x1
    15c2:	d6a78793          	addi	a5,a5,-662 # 2328 <threading_system_time>
    15c6:	439c                	lw	a5,0(a5)
    15c8:	02f74163          	blt	a4,a5,15ea <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    15cc:	fd843783          	ld	a5,-40(s0)
    15d0:	4fb8                	lw	a4,88(a5)
    15d2:	00001797          	auipc	a5,0x1
    15d6:	d5678793          	addi	a5,a5,-682 # 2328 <threading_system_time>
    15da:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    15dc:	02f71e63          	bne	a4,a5,1618 <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    15e0:	fd843783          	ld	a5,-40(s0)
    15e4:	4bfc                	lw	a5,84(a5)
    15e6:	02f05963          	blez	a5,1618 <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    15ea:	fd843783          	ld	a5,-40(s0)
    15ee:	5fd8                	lw	a4,60(a5)
    15f0:	00001797          	auipc	a5,0x1
    15f4:	d3878793          	addi	a5,a5,-712 # 2328 <threading_system_time>
    15f8:	439c                	lw	a5,0(a5)
    15fa:	863e                	mv	a2,a5
    15fc:	85ba                	mv	a1,a4
    15fe:	00001517          	auipc	a0,0x1
    1602:	ad250513          	addi	a0,a0,-1326 # 20d0 <schedule_edf_cbs+0x578>
    1606:	fffff097          	auipc	ra,0xfffff
    160a:	45c080e7          	jalr	1116(ra) # a62 <printf>
            exit(0);
    160e:	4501                	li	a0,0
    1610:	fffff097          	auipc	ra,0xfffff
    1614:	f0c080e7          	jalr	-244(ra) # 51c <exit>
        }

    if (current_thread->remaining_time <= 0) {
    1618:	fd843783          	ld	a5,-40(s0)
    161c:	4bfc                	lw	a5,84(a5)
    161e:	02f04063          	bgtz	a5,163e <switch_handler+0x132>
        if (current_thread->is_real_time)
    1622:	fd843783          	ld	a5,-40(s0)
    1626:	43bc                	lw	a5,64(a5)
    1628:	c791                	beqz	a5,1634 <switch_handler+0x128>
            __rt_finish_current();
    162a:	00000097          	auipc	ra,0x0
    162e:	e0a080e7          	jalr	-502(ra) # 1434 <__rt_finish_current>
    1632:	a881                	j	1682 <switch_handler+0x176>
        else
            __finish_current();
    1634:	00000097          	auipc	ra,0x0
    1638:	d3c080e7          	jalr	-708(ra) # 1370 <__finish_current>
    163c:	a099                	j	1682 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    163e:	00001797          	auipc	a5,0x1
    1642:	ce278793          	addi	a5,a5,-798 # 2320 <current>
    1646:	639c                	ld	a5,0(a5)
    1648:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    164c:	00001797          	auipc	a5,0x1
    1650:	cd478793          	addi	a5,a5,-812 # 2320 <current>
    1654:	639c                	ld	a5,0(a5)
    1656:	6798                	ld	a4,8(a5)
    1658:	00001797          	auipc	a5,0x1
    165c:	cc878793          	addi	a5,a5,-824 # 2320 <current>
    1660:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1662:	fd043503          	ld	a0,-48(s0)
    1666:	00000097          	auipc	ra,0x0
    166a:	840080e7          	jalr	-1984(ra) # ea6 <list_del>
        list_add_tail(to_remove, &run_queue);
    166e:	00001597          	auipc	a1,0x1
    1672:	c6a58593          	addi	a1,a1,-918 # 22d8 <run_queue>
    1676:	fd043503          	ld	a0,-48(s0)
    167a:	fffff097          	auipc	ra,0xfffff
    167e:	7d0080e7          	jalr	2000(ra) # e4a <list_add_tail>
    }

    __release();
    1682:	00000097          	auipc	ra,0x0
    1686:	ab0080e7          	jalr	-1360(ra) # 1132 <__release>
    __schedule();
    168a:	00000097          	auipc	ra,0x0
    168e:	1f8080e7          	jalr	504(ra) # 1882 <__schedule>
    __dispatch();
    1692:	00000097          	auipc	ra,0x0
    1696:	026080e7          	jalr	38(ra) # 16b8 <__dispatch>
    thrdresume(main_thrd_id);
    169a:	00001797          	auipc	a5,0x1
    169e:	c5e78793          	addi	a5,a5,-930 # 22f8 <main_thrd_id>
    16a2:	439c                	lw	a5,0(a5)
    16a4:	853e                	mv	a0,a5
    16a6:	fffff097          	auipc	ra,0xfffff
    16aa:	f1e080e7          	jalr	-226(ra) # 5c4 <thrdresume>
}
    16ae:	0001                	nop
    16b0:	70e2                	ld	ra,56(sp)
    16b2:	7442                	ld	s0,48(sp)
    16b4:	6121                	addi	sp,sp,64
    16b6:	8082                	ret

00000000000016b8 <__dispatch>:

void __dispatch()
{
    16b8:	7179                	addi	sp,sp,-48
    16ba:	f406                	sd	ra,40(sp)
    16bc:	f022                	sd	s0,32(sp)
    16be:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    16c0:	00001797          	auipc	a5,0x1
    16c4:	c6078793          	addi	a5,a5,-928 # 2320 <current>
    16c8:	6398                	ld	a4,0(a5)
    16ca:	00001797          	auipc	a5,0x1
    16ce:	c0e78793          	addi	a5,a5,-1010 # 22d8 <run_queue>
    16d2:	1af70363          	beq	a4,a5,1878 <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    16d6:	00001797          	auipc	a5,0x1
    16da:	c4a78793          	addi	a5,a5,-950 # 2320 <current>
    16de:	639c                	ld	a5,0(a5)
    16e0:	fef43423          	sd	a5,-24(s0)
    16e4:	fe843783          	ld	a5,-24(s0)
    16e8:	fd878793          	addi	a5,a5,-40
    16ec:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    16f0:	fe043783          	ld	a5,-32(s0)
    16f4:	5fcc                	lw	a1,60(a5)
    16f6:	00001797          	auipc	a5,0x1
    16fa:	c3278793          	addi	a5,a5,-974 # 2328 <threading_system_time>
    16fe:	4390                	lw	a2,0(a5)
    1700:	00001797          	auipc	a5,0x1
    1704:	c3078793          	addi	a5,a5,-976 # 2330 <allocated_time>
    1708:	6394                	ld	a3,0(a5)
    170a:	fe043783          	ld	a5,-32(s0)
    170e:	4bfc                	lw	a5,84(a5)
    1710:	873e                	mv	a4,a5
    1712:	00001517          	auipc	a0,0x1
    1716:	9ee50513          	addi	a0,a0,-1554 # 2100 <schedule_edf_cbs+0x5a8>
    171a:	fffff097          	auipc	ra,0xfffff
    171e:	348080e7          	jalr	840(ra) # a62 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    1722:	fe043783          	ld	a5,-32(s0)
    1726:	43bc                	lw	a5,64(a5)
    1728:	c3a1                	beqz	a5,1768 <__dispatch+0xb0>
    172a:	00001797          	auipc	a5,0x1
    172e:	c0678793          	addi	a5,a5,-1018 # 2330 <allocated_time>
    1732:	639c                	ld	a5,0(a5)
    1734:	eb95                	bnez	a5,1768 <__dispatch+0xb0>
    1736:	fe043783          	ld	a5,-32(s0)
    173a:	57fc                	lw	a5,108(a5)
    173c:	c795                	beqz	a5,1768 <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    173e:	fe043783          	ld	a5,-32(s0)
    1742:	5fd8                	lw	a4,60(a5)
    1744:	fe043783          	ld	a5,-32(s0)
    1748:	4fbc                	lw	a5,88(a5)
    174a:	863e                	mv	a2,a5
    174c:	85ba                	mv	a1,a4
    174e:	00001517          	auipc	a0,0x1
    1752:	a0250513          	addi	a0,a0,-1534 # 2150 <schedule_edf_cbs+0x5f8>
    1756:	fffff097          	auipc	ra,0xfffff
    175a:	30c080e7          	jalr	780(ra) # a62 <printf>
        exit(0);
    175e:	4501                	li	a0,0
    1760:	fffff097          	auipc	ra,0xfffff
    1764:	dbc080e7          	jalr	-580(ra) # 51c <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    1768:	fe043783          	ld	a5,-32(s0)
    176c:	5fd8                	lw	a4,60(a5)
    176e:	00001797          	auipc	a5,0x1
    1772:	bba78793          	addi	a5,a5,-1094 # 2328 <threading_system_time>
    1776:	4390                	lw	a2,0(a5)
    1778:	00001797          	auipc	a5,0x1
    177c:	bb878793          	addi	a5,a5,-1096 # 2330 <allocated_time>
    1780:	639c                	ld	a5,0(a5)
    1782:	86be                	mv	a3,a5
    1784:	85ba                	mv	a1,a4
    1786:	00001517          	auipc	a0,0x1
    178a:	9fa50513          	addi	a0,a0,-1542 # 2180 <schedule_edf_cbs+0x628>
    178e:	fffff097          	auipc	ra,0xfffff
    1792:	2d4080e7          	jalr	724(ra) # a62 <printf>

    if (current_thread->buf_set) {
    1796:	fe043783          	ld	a5,-32(s0)
    179a:	539c                	lw	a5,32(a5)
    179c:	c7a1                	beqz	a5,17e4 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    179e:	00001797          	auipc	a5,0x1
    17a2:	b9278793          	addi	a5,a5,-1134 # 2330 <allocated_time>
    17a6:	639c                	ld	a5,0(a5)
    17a8:	0007871b          	sext.w	a4,a5
    17ac:	fe043783          	ld	a5,-32(s0)
    17b0:	03878593          	addi	a1,a5,56
    17b4:	00001797          	auipc	a5,0x1
    17b8:	b7c78793          	addi	a5,a5,-1156 # 2330 <allocated_time>
    17bc:	639c                	ld	a5,0(a5)
    17be:	86be                	mv	a3,a5
    17c0:	00000617          	auipc	a2,0x0
    17c4:	d4c60613          	addi	a2,a2,-692 # 150c <switch_handler>
    17c8:	853a                	mv	a0,a4
    17ca:	fffff097          	auipc	ra,0xfffff
    17ce:	df2080e7          	jalr	-526(ra) # 5bc <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    17d2:	fe043783          	ld	a5,-32(s0)
    17d6:	5f9c                	lw	a5,56(a5)
    17d8:	853e                	mv	a0,a5
    17da:	fffff097          	auipc	ra,0xfffff
    17de:	dea080e7          	jalr	-534(ra) # 5c4 <thrdresume>
    17e2:	a071                	j	186e <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    17e4:	fe043783          	ld	a5,-32(s0)
    17e8:	4705                	li	a4,1
    17ea:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    17ec:	fe043783          	ld	a5,-32(s0)
    17f0:	6f9c                	ld	a5,24(a5)
    17f2:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    17f6:	fe043783          	ld	a5,-32(s0)
    17fa:	577d                	li	a4,-1
    17fc:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    17fe:	00001797          	auipc	a5,0x1
    1802:	b3278793          	addi	a5,a5,-1230 # 2330 <allocated_time>
    1806:	639c                	ld	a5,0(a5)
    1808:	0007871b          	sext.w	a4,a5
    180c:	fe043783          	ld	a5,-32(s0)
    1810:	03878593          	addi	a1,a5,56
    1814:	00001797          	auipc	a5,0x1
    1818:	b1c78793          	addi	a5,a5,-1252 # 2330 <allocated_time>
    181c:	639c                	ld	a5,0(a5)
    181e:	86be                	mv	a3,a5
    1820:	00000617          	auipc	a2,0x0
    1824:	cec60613          	addi	a2,a2,-788 # 150c <switch_handler>
    1828:	853a                	mv	a0,a4
    182a:	fffff097          	auipc	ra,0xfffff
    182e:	d92080e7          	jalr	-622(ra) # 5bc <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    1832:	fe043783          	ld	a5,-32(s0)
    1836:	5f9c                	lw	a5,56(a5)
    1838:	0207d063          	bgez	a5,1858 <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    183c:	00001597          	auipc	a1,0x1
    1840:	97458593          	addi	a1,a1,-1676 # 21b0 <schedule_edf_cbs+0x658>
    1844:	4509                	li	a0,2
    1846:	fffff097          	auipc	ra,0xfffff
    184a:	1c4080e7          	jalr	452(ra) # a0a <fprintf>
            exit(1);
    184e:	4505                	li	a0,1
    1850:	fffff097          	auipc	ra,0xfffff
    1854:	ccc080e7          	jalr	-820(ra) # 51c <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    1858:	fd843783          	ld	a5,-40(s0)
    185c:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    185e:	fe043783          	ld	a5,-32(s0)
    1862:	6398                	ld	a4,0(a5)
    1864:	fe043783          	ld	a5,-32(s0)
    1868:	679c                	ld	a5,8(a5)
    186a:	853e                	mv	a0,a5
    186c:	9702                	jalr	a4
    }
    thread_exit();
    186e:	00000097          	auipc	ra,0x0
    1872:	a5a080e7          	jalr	-1446(ra) # 12c8 <thread_exit>
    1876:	a011                	j	187a <__dispatch+0x1c2>
        return;
    1878:	0001                	nop
}
    187a:	70a2                	ld	ra,40(sp)
    187c:	7402                	ld	s0,32(sp)
    187e:	6145                	addi	sp,sp,48
    1880:	8082                	ret

0000000000001882 <__schedule>:

void __schedule()
{
    1882:	711d                	addi	sp,sp,-96
    1884:	ec86                	sd	ra,88(sp)
    1886:	e8a2                	sd	s0,80(sp)
    1888:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    188a:	00001797          	auipc	a5,0x1
    188e:	a9e78793          	addi	a5,a5,-1378 # 2328 <threading_system_time>
    1892:	439c                	lw	a5,0(a5)
    1894:	fcf42c23          	sw	a5,-40(s0)
    1898:	4789                	li	a5,2
    189a:	fcf42e23          	sw	a5,-36(s0)
    189e:	00001797          	auipc	a5,0x1
    18a2:	a3a78793          	addi	a5,a5,-1478 # 22d8 <run_queue>
    18a6:	fef43023          	sd	a5,-32(s0)
    18aa:	00001797          	auipc	a5,0x1
    18ae:	a3e78793          	addi	a5,a5,-1474 # 22e8 <release_queue>
    18b2:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    18b6:	fd843783          	ld	a5,-40(s0)
    18ba:	faf43023          	sd	a5,-96(s0)
    18be:	fe043783          	ld	a5,-32(s0)
    18c2:	faf43423          	sd	a5,-88(s0)
    18c6:	fe843783          	ld	a5,-24(s0)
    18ca:	faf43823          	sd	a5,-80(s0)
    18ce:	fa040793          	addi	a5,s0,-96
    18d2:	853e                	mv	a0,a5
    18d4:	00000097          	auipc	ra,0x0
    18d8:	284080e7          	jalr	644(ra) # 1b58 <schedule_edf_cbs>
    18dc:	872a                	mv	a4,a0
    18de:	87ae                	mv	a5,a1
    18e0:	fce43423          	sd	a4,-56(s0)
    18e4:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    18e8:	fc843703          	ld	a4,-56(s0)
    18ec:	00001797          	auipc	a5,0x1
    18f0:	a3478793          	addi	a5,a5,-1484 # 2320 <current>
    18f4:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    18f6:	fd042783          	lw	a5,-48(s0)
    18fa:	873e                	mv	a4,a5
    18fc:	00001797          	auipc	a5,0x1
    1900:	a3478793          	addi	a5,a5,-1484 # 2330 <allocated_time>
    1904:	e398                	sd	a4,0(a5)
}
    1906:	0001                	nop
    1908:	60e6                	ld	ra,88(sp)
    190a:	6446                	ld	s0,80(sp)
    190c:	6125                	addi	sp,sp,96
    190e:	8082                	ret

0000000000001910 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    1910:	1101                	addi	sp,sp,-32
    1912:	ec06                	sd	ra,24(sp)
    1914:	e822                	sd	s0,16(sp)
    1916:	1000                	addi	s0,sp,32
    1918:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    191c:	00001797          	auipc	a5,0x1
    1920:	a1078793          	addi	a5,a5,-1520 # 232c <sleeping>
    1924:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1928:	fe843783          	ld	a5,-24(s0)
    192c:	0007871b          	sext.w	a4,a5
    1930:	00001797          	auipc	a5,0x1
    1934:	9f878793          	addi	a5,a5,-1544 # 2328 <threading_system_time>
    1938:	439c                	lw	a5,0(a5)
    193a:	2781                	sext.w	a5,a5
    193c:	9fb9                	addw	a5,a5,a4
    193e:	2781                	sext.w	a5,a5
    1940:	0007871b          	sext.w	a4,a5
    1944:	00001797          	auipc	a5,0x1
    1948:	9e478793          	addi	a5,a5,-1564 # 2328 <threading_system_time>
    194c:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    194e:	00001797          	auipc	a5,0x1
    1952:	9aa78793          	addi	a5,a5,-1622 # 22f8 <main_thrd_id>
    1956:	439c                	lw	a5,0(a5)
    1958:	853e                	mv	a0,a5
    195a:	fffff097          	auipc	ra,0xfffff
    195e:	c6a080e7          	jalr	-918(ra) # 5c4 <thrdresume>
}
    1962:	0001                	nop
    1964:	60e2                	ld	ra,24(sp)
    1966:	6442                	ld	s0,16(sp)
    1968:	6105                	addi	sp,sp,32
    196a:	8082                	ret

000000000000196c <thread_start_threading>:

void thread_start_threading()
{
    196c:	1141                	addi	sp,sp,-16
    196e:	e406                	sd	ra,8(sp)
    1970:	e022                	sd	s0,0(sp)
    1972:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1974:	00001797          	auipc	a5,0x1
    1978:	9b478793          	addi	a5,a5,-1612 # 2328 <threading_system_time>
    197c:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    1980:	00001797          	auipc	a5,0x1
    1984:	9a078793          	addi	a5,a5,-1632 # 2320 <current>
    1988:	00001717          	auipc	a4,0x1
    198c:	95070713          	addi	a4,a4,-1712 # 22d8 <run_queue>
    1990:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1992:	4681                	li	a3,0
    1994:	00000617          	auipc	a2,0x0
    1998:	f7c60613          	addi	a2,a2,-132 # 1910 <back_to_main_handler>
    199c:	00001597          	auipc	a1,0x1
    19a0:	95c58593          	addi	a1,a1,-1700 # 22f8 <main_thrd_id>
    19a4:	3e800513          	li	a0,1000
    19a8:	fffff097          	auipc	ra,0xfffff
    19ac:	c14080e7          	jalr	-1004(ra) # 5bc <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    19b0:	00001797          	auipc	a5,0x1
    19b4:	94878793          	addi	a5,a5,-1720 # 22f8 <main_thrd_id>
    19b8:	439c                	lw	a5,0(a5)
    19ba:	4581                	li	a1,0
    19bc:	853e                	mv	a0,a5
    19be:	fffff097          	auipc	ra,0xfffff
    19c2:	c0e080e7          	jalr	-1010(ra) # 5cc <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    19c6:	a0c9                	j	1a88 <thread_start_threading+0x11c>
        __release();
    19c8:	fffff097          	auipc	ra,0xfffff
    19cc:	76a080e7          	jalr	1898(ra) # 1132 <__release>
        __schedule();
    19d0:	00000097          	auipc	ra,0x0
    19d4:	eb2080e7          	jalr	-334(ra) # 1882 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    19d8:	00001797          	auipc	a5,0x1
    19dc:	92078793          	addi	a5,a5,-1760 # 22f8 <main_thrd_id>
    19e0:	439c                	lw	a5,0(a5)
    19e2:	4581                	li	a1,0
    19e4:	853e                	mv	a0,a5
    19e6:	fffff097          	auipc	ra,0xfffff
    19ea:	be6080e7          	jalr	-1050(ra) # 5cc <cancelthrdstop>
        __dispatch();
    19ee:	00000097          	auipc	ra,0x0
    19f2:	cca080e7          	jalr	-822(ra) # 16b8 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    19f6:	00001517          	auipc	a0,0x1
    19fa:	8e250513          	addi	a0,a0,-1822 # 22d8 <run_queue>
    19fe:	fffff097          	auipc	ra,0xfffff
    1a02:	4f2080e7          	jalr	1266(ra) # ef0 <list_empty>
    1a06:	87aa                	mv	a5,a0
    1a08:	cb99                	beqz	a5,1a1e <thread_start_threading+0xb2>
    1a0a:	00001517          	auipc	a0,0x1
    1a0e:	8de50513          	addi	a0,a0,-1826 # 22e8 <release_queue>
    1a12:	fffff097          	auipc	ra,0xfffff
    1a16:	4de080e7          	jalr	1246(ra) # ef0 <list_empty>
    1a1a:	87aa                	mv	a5,a0
    1a1c:	ebd9                	bnez	a5,1ab2 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1a1e:	00001797          	auipc	a5,0x1
    1a22:	91278793          	addi	a5,a5,-1774 # 2330 <allocated_time>
    1a26:	639c                	ld	a5,0(a5)
    1a28:	85be                	mv	a1,a5
    1a2a:	00000517          	auipc	a0,0x0
    1a2e:	7be50513          	addi	a0,a0,1982 # 21e8 <schedule_edf_cbs+0x690>
    1a32:	fffff097          	auipc	ra,0xfffff
    1a36:	030080e7          	jalr	48(ra) # a62 <printf>
        sleeping = 1;
    1a3a:	00001797          	auipc	a5,0x1
    1a3e:	8f278793          	addi	a5,a5,-1806 # 232c <sleeping>
    1a42:	4705                	li	a4,1
    1a44:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1a46:	00001797          	auipc	a5,0x1
    1a4a:	8ea78793          	addi	a5,a5,-1814 # 2330 <allocated_time>
    1a4e:	639c                	ld	a5,0(a5)
    1a50:	0007871b          	sext.w	a4,a5
    1a54:	00001797          	auipc	a5,0x1
    1a58:	8dc78793          	addi	a5,a5,-1828 # 2330 <allocated_time>
    1a5c:	639c                	ld	a5,0(a5)
    1a5e:	86be                	mv	a3,a5
    1a60:	00000617          	auipc	a2,0x0
    1a64:	eb060613          	addi	a2,a2,-336 # 1910 <back_to_main_handler>
    1a68:	00001597          	auipc	a1,0x1
    1a6c:	89058593          	addi	a1,a1,-1904 # 22f8 <main_thrd_id>
    1a70:	853a                	mv	a0,a4
    1a72:	fffff097          	auipc	ra,0xfffff
    1a76:	b4a080e7          	jalr	-1206(ra) # 5bc <thrdstop>
        while (sleeping) {
    1a7a:	0001                	nop
    1a7c:	00001797          	auipc	a5,0x1
    1a80:	8b078793          	addi	a5,a5,-1872 # 232c <sleeping>
    1a84:	439c                	lw	a5,0(a5)
    1a86:	fbfd                	bnez	a5,1a7c <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1a88:	00001517          	auipc	a0,0x1
    1a8c:	85050513          	addi	a0,a0,-1968 # 22d8 <run_queue>
    1a90:	fffff097          	auipc	ra,0xfffff
    1a94:	460080e7          	jalr	1120(ra) # ef0 <list_empty>
    1a98:	87aa                	mv	a5,a0
    1a9a:	d79d                	beqz	a5,19c8 <thread_start_threading+0x5c>
    1a9c:	00001517          	auipc	a0,0x1
    1aa0:	84c50513          	addi	a0,a0,-1972 # 22e8 <release_queue>
    1aa4:	fffff097          	auipc	ra,0xfffff
    1aa8:	44c080e7          	jalr	1100(ra) # ef0 <list_empty>
    1aac:	87aa                	mv	a5,a0
    1aae:	df89                	beqz	a5,19c8 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1ab0:	a011                	j	1ab4 <thread_start_threading+0x148>
            break;
    1ab2:	0001                	nop
}
    1ab4:	0001                	nop
    1ab6:	60a2                	ld	ra,8(sp)
    1ab8:	6402                	ld	s0,0(sp)
    1aba:	0141                	addi	sp,sp,16
    1abc:	8082                	ret

0000000000001abe <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1abe:	7139                	addi	sp,sp,-64
    1ac0:	fc22                	sd	s0,56(sp)
    1ac2:	0080                	addi	s0,sp,64
    1ac4:	fca43423          	sd	a0,-56(s0)
    1ac8:	87ae                	mv	a5,a1
    1aca:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1ace:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1ad2:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1ad6:	fc843783          	ld	a5,-56(s0)
    1ada:	639c                	ld	a5,0(a5)
    1adc:	fcf43c23          	sd	a5,-40(s0)
    1ae0:	fd843783          	ld	a5,-40(s0)
    1ae4:	fd878793          	addi	a5,a5,-40
    1ae8:	fef43423          	sd	a5,-24(s0)
    1aec:	a881                	j	1b3c <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1aee:	fe843783          	ld	a5,-24(s0)
    1af2:	4fb8                	lw	a4,88(a5)
    1af4:	fc442783          	lw	a5,-60(s0)
    1af8:	2781                	sext.w	a5,a5
    1afa:	02e7c663          	blt	a5,a4,1b26 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1afe:	fe043783          	ld	a5,-32(s0)
    1b02:	e791                	bnez	a5,1b0e <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1b04:	fe843783          	ld	a5,-24(s0)
    1b08:	fef43023          	sd	a5,-32(s0)
    1b0c:	a829                	j	1b26 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1b0e:	fe843783          	ld	a5,-24(s0)
    1b12:	5fd8                	lw	a4,60(a5)
    1b14:	fe043783          	ld	a5,-32(s0)
    1b18:	5fdc                	lw	a5,60(a5)
    1b1a:	00f75663          	bge	a4,a5,1b26 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1b1e:	fe843783          	ld	a5,-24(s0)
    1b22:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1b26:	fe843783          	ld	a5,-24(s0)
    1b2a:	779c                	ld	a5,40(a5)
    1b2c:	fcf43823          	sd	a5,-48(s0)
    1b30:	fd043783          	ld	a5,-48(s0)
    1b34:	fd878793          	addi	a5,a5,-40
    1b38:	fef43423          	sd	a5,-24(s0)
    1b3c:	fe843783          	ld	a5,-24(s0)
    1b40:	02878793          	addi	a5,a5,40
    1b44:	fc843703          	ld	a4,-56(s0)
    1b48:	faf713e3          	bne	a4,a5,1aee <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1b4c:	fe043783          	ld	a5,-32(s0)
}
    1b50:	853e                	mv	a0,a5
    1b52:	7462                	ld	s0,56(sp)
    1b54:	6121                	addi	sp,sp,64
    1b56:	8082                	ret

0000000000001b58 <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1b58:	7131                	addi	sp,sp,-192
    1b5a:	fd06                	sd	ra,184(sp)
    1b5c:	f922                	sd	s0,176(sp)
    1b5e:	f526                	sd	s1,168(sp)
    1b60:	f14a                	sd	s2,160(sp)
    1b62:	ed4e                	sd	s3,152(sp)
    1b64:	0180                	addi	s0,sp,192
    1b66:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1b68:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1b6c:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1b70:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1b74:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1b78:	649c                	ld	a5,8(s1)
    1b7a:	4098                	lw	a4,0(s1)
    1b7c:	85ba                	mv	a1,a4
    1b7e:	853e                	mv	a0,a5
    1b80:	00000097          	auipc	ra,0x0
    1b84:	f3e080e7          	jalr	-194(ra) # 1abe <__check_deadline_miss>
    1b88:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1b8c:	f9843783          	ld	a5,-104(s0)
    1b90:	c7b5                	beqz	a5,1bfc <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1b92:	f9843783          	ld	a5,-104(s0)
    1b96:	5fdc                	lw	a5,60(a5)
    1b98:	85be                	mv	a1,a5
    1b9a:	00000517          	auipc	a0,0x0
    1b9e:	67650513          	addi	a0,a0,1654 # 2210 <schedule_edf_cbs+0x6b8>
    1ba2:	fffff097          	auipc	ra,0xfffff
    1ba6:	ec0080e7          	jalr	-320(ra) # a62 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1baa:	f9843783          	ld	a5,-104(s0)
    1bae:	57fc                	lw	a5,108(a5)
    1bb0:	c395                	beqz	a5,1bd4 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1bb2:	f9843783          	ld	a5,-104(s0)
    1bb6:	02878793          	addi	a5,a5,40
    1bba:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1bbe:	f4042423          	sw	zero,-184(s0)
            return r;
    1bc2:	f4043783          	ld	a5,-192(s0)
    1bc6:	f4f43823          	sd	a5,-176(s0)
    1bca:	f4843783          	ld	a5,-184(s0)
    1bce:	f4f43c23          	sd	a5,-168(s0)
    1bd2:	a13d                	j	2000 <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1bd4:	4098                	lw	a4,0(s1)
    1bd6:	f9843783          	ld	a5,-104(s0)
    1bda:	47fc                	lw	a5,76(a5)
    1bdc:	9fb9                	addw	a5,a5,a4
    1bde:	0007871b          	sext.w	a4,a5
    1be2:	f9843783          	ld	a5,-104(s0)
    1be6:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1be8:	f9843783          	ld	a5,-104(s0)
    1bec:	53f8                	lw	a4,100(a5)
    1bee:	f9843783          	ld	a5,-104(s0)
    1bf2:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1bf4:	f9843783          	ld	a5,-104(s0)
    1bf8:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1bfc:	fa043783          	ld	a5,-96(s0)
    1c00:	e7dd                	bnez	a5,1cae <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1c02:	649c                	ld	a5,8(s1)
    1c04:	639c                	ld	a5,0(a5)
    1c06:	f8f43823          	sd	a5,-112(s0)
    1c0a:	f9043783          	ld	a5,-112(s0)
    1c0e:	fd878793          	addi	a5,a5,-40
    1c12:	faf43c23          	sd	a5,-72(s0)
    1c16:	a069                	j	1ca0 <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1c18:	fb843783          	ld	a5,-72(s0)
    1c1c:	5fd8                	lw	a4,60(a5)
    1c1e:	fb843783          	ld	a5,-72(s0)
    1c22:	5bbc                	lw	a5,112(a5)
    1c24:	863e                	mv	a2,a5
    1c26:	85ba                	mv	a1,a4
    1c28:	00000517          	auipc	a0,0x0
    1c2c:	62050513          	addi	a0,a0,1568 # 2248 <schedule_edf_cbs+0x6f0>
    1c30:	fffff097          	auipc	ra,0xfffff
    1c34:	e32080e7          	jalr	-462(ra) # a62 <printf>
            if (next == NULL)
    1c38:	fa043783          	ld	a5,-96(s0)
    1c3c:	e791                	bnez	a5,1c48 <schedule_edf_cbs+0xf0>
                next = th;
    1c3e:	fb843783          	ld	a5,-72(s0)
    1c42:	faf43023          	sd	a5,-96(s0)
    1c46:	a091                	j	1c8a <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1c48:	fb843783          	ld	a5,-72(s0)
    1c4c:	4fb8                	lw	a4,88(a5)
    1c4e:	fa043783          	ld	a5,-96(s0)
    1c52:	4fbc                	lw	a5,88(a5)
    1c54:	00f75763          	bge	a4,a5,1c62 <schedule_edf_cbs+0x10a>
                next = th;
    1c58:	fb843783          	ld	a5,-72(s0)
    1c5c:	faf43023          	sd	a5,-96(s0)
    1c60:	a02d                	j	1c8a <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1c62:	fb843783          	ld	a5,-72(s0)
    1c66:	4fb8                	lw	a4,88(a5)
    1c68:	fa043783          	ld	a5,-96(s0)
    1c6c:	4fbc                	lw	a5,88(a5)
    1c6e:	00f71e63          	bne	a4,a5,1c8a <schedule_edf_cbs+0x132>
    1c72:	fb843783          	ld	a5,-72(s0)
    1c76:	5fd8                	lw	a4,60(a5)
    1c78:	fa043783          	ld	a5,-96(s0)
    1c7c:	5fdc                	lw	a5,60(a5)
    1c7e:	00f75663          	bge	a4,a5,1c8a <schedule_edf_cbs+0x132>
                next = th;
    1c82:	fb843783          	ld	a5,-72(s0)
    1c86:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1c8a:	fb843783          	ld	a5,-72(s0)
    1c8e:	779c                	ld	a5,40(a5)
    1c90:	f8f43423          	sd	a5,-120(s0)
    1c94:	f8843783          	ld	a5,-120(s0)
    1c98:	fd878793          	addi	a5,a5,-40
    1c9c:	faf43c23          	sd	a5,-72(s0)
    1ca0:	fb843783          	ld	a5,-72(s0)
    1ca4:	02878713          	addi	a4,a5,40
    1ca8:	649c                	ld	a5,8(s1)
    1caa:	f6f717e3          	bne	a4,a5,1c18 <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1cae:	fa043783          	ld	a5,-96(s0)
    1cb2:	5fdc                	lw	a5,60(a5)
    1cb4:	85be                	mv	a1,a5
    1cb6:	00000517          	auipc	a0,0x0
    1cba:	5ca50513          	addi	a0,a0,1482 # 2280 <schedule_edf_cbs+0x728>
    1cbe:	fffff097          	auipc	ra,0xfffff
    1cc2:	da4080e7          	jalr	-604(ra) # a62 <printf>

    if(next && next->cbs.is_throttled){
    1cc6:	fa043783          	ld	a5,-96(s0)
    1cca:	cb95                	beqz	a5,1cfe <schedule_edf_cbs+0x1a6>
    1ccc:	fa043783          	ld	a5,-96(s0)
    1cd0:	5bbc                	lw	a5,112(a5)
    1cd2:	c795                	beqz	a5,1cfe <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1cd4:	fa043783          	ld	a5,-96(s0)
    1cd8:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1cdc:	fa043783          	ld	a5,-96(s0)
    1ce0:	02878793          	addi	a5,a5,40
    1ce4:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1ce8:	f4042423          	sw	zero,-184(s0)
        return r;
    1cec:	f4043783          	ld	a5,-192(s0)
    1cf0:	f4f43823          	sd	a5,-176(s0)
    1cf4:	f4843783          	ld	a5,-184(s0)
    1cf8:	f4f43c23          	sd	a5,-168(s0)
    1cfc:	a611                	j	2000 <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1cfe:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d02:	689c                	ld	a5,16(s1)
    1d04:	639c                	ld	a5,0(a5)
    1d06:	f8f43023          	sd	a5,-128(s0)
    1d0a:	f8043783          	ld	a5,-128(s0)
    1d0e:	17e1                	addi	a5,a5,-8
    1d10:	fcf43023          	sd	a5,-64(s0)
    1d14:	a0b5                	j	1d80 <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1d16:	fa843783          	ld	a5,-88(s0)
    1d1a:	e791                	bnez	a5,1d26 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1d1c:	fc043783          	ld	a5,-64(s0)
    1d20:	faf43423          	sd	a5,-88(s0)
    1d24:	a0a1                	j	1d6c <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1d26:	fa843783          	ld	a5,-88(s0)
    1d2a:	4f98                	lw	a4,24(a5)
    1d2c:	fc043783          	ld	a5,-64(s0)
    1d30:	4f9c                	lw	a5,24(a5)
    1d32:	00e7d763          	bge	a5,a4,1d40 <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1d36:	fc043783          	ld	a5,-64(s0)
    1d3a:	faf43423          	sd	a5,-88(s0)
    1d3e:	a03d                	j	1d6c <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1d40:	fa843783          	ld	a5,-88(s0)
    1d44:	4f98                	lw	a4,24(a5)
    1d46:	fc043783          	ld	a5,-64(s0)
    1d4a:	4f9c                	lw	a5,24(a5)
    1d4c:	02f71063          	bne	a4,a5,1d6c <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1d50:	fa843783          	ld	a5,-88(s0)
    1d54:	639c                	ld	a5,0(a5)
    1d56:	4fb8                	lw	a4,88(a5)
    1d58:	fc043783          	ld	a5,-64(s0)
    1d5c:	639c                	ld	a5,0(a5)
    1d5e:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1d60:	00e7d663          	bge	a5,a4,1d6c <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1d64:	fc043783          	ld	a5,-64(s0)
    1d68:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d6c:	fc043783          	ld	a5,-64(s0)
    1d70:	679c                	ld	a5,8(a5)
    1d72:	f6f43023          	sd	a5,-160(s0)
    1d76:	f6043783          	ld	a5,-160(s0)
    1d7a:	17e1                	addi	a5,a5,-8
    1d7c:	fcf43023          	sd	a5,-64(s0)
    1d80:	fc043783          	ld	a5,-64(s0)
    1d84:	00878713          	addi	a4,a5,8
    1d88:	689c                	ld	a5,16(s1)
    1d8a:	f8f716e3          	bne	a4,a5,1d16 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1d8e:	689c                	ld	a5,16(s1)
    1d90:	639c                	ld	a5,0(a5)
    1d92:	f6f43c23          	sd	a5,-136(s0)
    1d96:	f7843783          	ld	a5,-136(s0)
    1d9a:	17e1                	addi	a5,a5,-8
    1d9c:	fcf43023          	sd	a5,-64(s0)
    1da0:	a069                	j	1e2a <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1da2:	fb043783          	ld	a5,-80(s0)
    1da6:	eb99                	bnez	a5,1dbc <schedule_edf_cbs+0x264>
    1da8:	fc043783          	ld	a5,-64(s0)
    1dac:	639c                	ld	a5,0(a5)
    1dae:	57fc                	lw	a5,108(a5)
    1db0:	c791                	beqz	a5,1dbc <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1db2:	fc043783          	ld	a5,-64(s0)
    1db6:	faf43823          	sd	a5,-80(s0)
    1dba:	a8b1                	j	1e16 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1dbc:	fc043783          	ld	a5,-64(s0)
    1dc0:	639c                	ld	a5,0(a5)
    1dc2:	57fc                	lw	a5,108(a5)
    1dc4:	cf91                	beqz	a5,1de0 <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1dc6:	fb043783          	ld	a5,-80(s0)
    1dca:	4f98                	lw	a4,24(a5)
    1dcc:	fc043783          	ld	a5,-64(s0)
    1dd0:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1dd2:	00e7d763          	bge	a5,a4,1de0 <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1dd6:	fc043783          	ld	a5,-64(s0)
    1dda:	faf43823          	sd	a5,-80(s0)
    1dde:	a825                	j	1e16 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1de0:	fc043783          	ld	a5,-64(s0)
    1de4:	639c                	ld	a5,0(a5)
    1de6:	57fc                	lw	a5,108(a5)
    1de8:	c79d                	beqz	a5,1e16 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1dea:	fb043783          	ld	a5,-80(s0)
    1dee:	4f98                	lw	a4,24(a5)
    1df0:	fc043783          	ld	a5,-64(s0)
    1df4:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1df6:	02f71063          	bne	a4,a5,1e16 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1dfa:	fb043783          	ld	a5,-80(s0)
    1dfe:	639c                	ld	a5,0(a5)
    1e00:	4fb8                	lw	a4,88(a5)
    1e02:	fc043783          	ld	a5,-64(s0)
    1e06:	639c                	ld	a5,0(a5)
    1e08:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1e0a:	00e7d663          	bge	a5,a4,1e16 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1e0e:	fc043783          	ld	a5,-64(s0)
    1e12:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1e16:	fc043783          	ld	a5,-64(s0)
    1e1a:	679c                	ld	a5,8(a5)
    1e1c:	f6f43423          	sd	a5,-152(s0)
    1e20:	f6843783          	ld	a5,-152(s0)
    1e24:	17e1                	addi	a5,a5,-8
    1e26:	fcf43023          	sd	a5,-64(s0)
    1e2a:	fc043783          	ld	a5,-64(s0)
    1e2e:	00878713          	addi	a4,a5,8
    1e32:	689c                	ld	a5,16(s1)
    1e34:	f6f717e3          	bne	a4,a5,1da2 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1e38:	fa043783          	ld	a5,-96(s0)
    1e3c:	cb89                	beqz	a5,1e4e <schedule_edf_cbs+0x2f6>
    1e3e:	fa043783          	ld	a5,-96(s0)
    1e42:	57fc                	lw	a5,108(a5)
    1e44:	c789                	beqz	a5,1e4e <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1e46:	fb043783          	ld	a5,-80(s0)
    1e4a:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1e4e:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1e52:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1e56:	fa843783          	ld	a5,-88(s0)
    1e5a:	c3c5                	beqz	a5,1efa <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1e5c:	fa843783          	ld	a5,-88(s0)
    1e60:	639c                	ld	a5,0(a5)
    1e62:	5fdc                	lw	a5,60(a5)
    1e64:	85be                	mv	a1,a5
    1e66:	00000517          	auipc	a0,0x0
    1e6a:	43a50513          	addi	a0,a0,1082 # 22a0 <schedule_edf_cbs+0x748>
    1e6e:	fffff097          	auipc	ra,0xfffff
    1e72:	bf4080e7          	jalr	-1036(ra) # a62 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    1e76:	fa843783          	ld	a5,-88(s0)
    1e7a:	4f98                	lw	a4,24(a5)
    1e7c:	409c                	lw	a5,0(s1)
    1e7e:	40f707bb          	subw	a5,a4,a5
    1e82:	fcf42623          	sw	a5,-52(s0)
        if (next){
    1e86:	fa043783          	ld	a5,-96(s0)
    1e8a:	cba5                	beqz	a5,1efa <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    1e8c:	fa043783          	ld	a5,-96(s0)
    1e90:	4bf8                	lw	a4,84(a5)
    1e92:	fcc42783          	lw	a5,-52(s0)
    1e96:	2781                	sext.w	a5,a5
    1e98:	06e7d163          	bge	a5,a4,1efa <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    1e9c:	fa043783          	ld	a5,-96(s0)
    1ea0:	57fc                	lw	a5,108(a5)
    1ea2:	eb91                	bnez	a5,1eb6 <schedule_edf_cbs+0x35e>
    1ea4:	fa843783          	ld	a5,-88(s0)
    1ea8:	639c                	ld	a5,0(a5)
    1eaa:	57fc                	lw	a5,108(a5)
    1eac:	c789                	beqz	a5,1eb6 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    1eae:	4785                	li	a5,1
    1eb0:	fcf42423          	sw	a5,-56(s0)
    1eb4:	a099                	j	1efa <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    1eb6:	fa043783          	ld	a5,-96(s0)
    1eba:	4fb8                	lw	a4,88(a5)
    1ebc:	fa843783          	ld	a5,-88(s0)
    1ec0:	639c                	ld	a5,0(a5)
    1ec2:	4fbc                	lw	a5,88(a5)
    1ec4:	00e7d663          	bge	a5,a4,1ed0 <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    1ec8:	4785                	li	a5,1
    1eca:	fcf42423          	sw	a5,-56(s0)
    1ece:	a035                	j	1efa <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1ed0:	fa043783          	ld	a5,-96(s0)
    1ed4:	4fb8                	lw	a4,88(a5)
    1ed6:	fa843783          	ld	a5,-88(s0)
    1eda:	639c                	ld	a5,0(a5)
    1edc:	4fbc                	lw	a5,88(a5)
    1ede:	00f71e63          	bne	a4,a5,1efa <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    1ee2:	fa043783          	ld	a5,-96(s0)
    1ee6:	5fd8                	lw	a4,60(a5)
    1ee8:	fa843783          	ld	a5,-88(s0)
    1eec:	639c                	ld	a5,0(a5)
    1eee:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1ef0:	00e7d563          	bge	a5,a4,1efa <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    1ef4:	4785                	li	a5,1
    1ef6:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    1efa:	fa043783          	ld	a5,-96(s0)
    1efe:	cbd1                	beqz	a5,1f92 <schedule_edf_cbs+0x43a>
    1f00:	fa043783          	ld	a5,-96(s0)
    1f04:	57fc                	lw	a5,108(a5)
    1f06:	e7d1                	bnez	a5,1f92 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    1f08:	fa043783          	ld	a5,-96(s0)
    1f0c:	4fb8                	lw	a4,88(a5)
    1f0e:	409c                	lw	a5,0(s1)
    1f10:	40f707bb          	subw	a5,a4,a5
    1f14:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    1f18:	fa043783          	ld	a5,-96(s0)
    1f1c:	47f8                	lw	a4,76(a5)
    1f1e:	fa043783          	ld	a5,-96(s0)
    1f22:	57bc                	lw	a5,104(a5)
    1f24:	02f707bb          	mulw	a5,a4,a5
    1f28:	0007869b          	sext.w	a3,a5
    1f2c:	fa043783          	ld	a5,-96(s0)
    1f30:	53fc                	lw	a5,100(a5)
    1f32:	f7442703          	lw	a4,-140(s0)
    1f36:	02f707bb          	mulw	a5,a4,a5
    1f3a:	2781                	sext.w	a5,a5
    1f3c:	8736                	mv	a4,a3
    1f3e:	02e7d263          	bge	a5,a4,1f62 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    1f42:	4098                	lw	a4,0(s1)
    1f44:	fa043783          	ld	a5,-96(s0)
    1f48:	47fc                	lw	a5,76(a5)
    1f4a:	9fb9                	addw	a5,a5,a4
    1f4c:	0007871b          	sext.w	a4,a5
    1f50:	fa043783          	ld	a5,-96(s0)
    1f54:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    1f56:	fa043783          	ld	a5,-96(s0)
    1f5a:	53f8                	lw	a4,100(a5)
    1f5c:	fa043783          	ld	a5,-96(s0)
    1f60:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    1f62:	fa043783          	ld	a5,-96(s0)
    1f66:	4bf8                	lw	a4,84(a5)
    1f68:	fa043783          	ld	a5,-96(s0)
    1f6c:	57bc                	lw	a5,104(a5)
    1f6e:	02e7d263          	bge	a5,a4,1f92 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    1f72:	fa043783          	ld	a5,-96(s0)
    1f76:	4705                	li	a4,1
    1f78:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    1f7a:	fa043783          	ld	a5,-96(s0)
    1f7e:	4fb8                	lw	a4,88(a5)
    1f80:	fa043783          	ld	a5,-96(s0)
    1f84:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    1f86:	fa043783          	ld	a5,-96(s0)
    1f8a:	4bf8                	lw	a4,84(a5)
    1f8c:	fa043783          	ld	a5,-96(s0)
    1f90:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    1f92:	fa043783          	ld	a5,-96(s0)
    1f96:	c3a9                	beqz	a5,1fd8 <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    1f98:	fa043783          	ld	a5,-96(s0)
    1f9c:	02878793          	addi	a5,a5,40
    1fa0:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    1fa4:	fa843783          	ld	a5,-88(s0)
    1fa8:	cb91                	beqz	a5,1fbc <schedule_edf_cbs+0x464>
    1faa:	fc842783          	lw	a5,-56(s0)
    1fae:	2781                	sext.w	a5,a5
    1fb0:	c791                	beqz	a5,1fbc <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    1fb2:	fcc42783          	lw	a5,-52(s0)
    1fb6:	f4f42423          	sw	a5,-184(s0)
    1fba:	a81d                	j	1ff0 <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    1fbc:	fa043783          	ld	a5,-96(s0)
    1fc0:	5bbc                	lw	a5,112(a5)
    1fc2:	c789                	beqz	a5,1fcc <schedule_edf_cbs+0x474>
    1fc4:	fa043783          	ld	a5,-96(s0)
    1fc8:	57bc                	lw	a5,104(a5)
    1fca:	a021                	j	1fd2 <schedule_edf_cbs+0x47a>
    1fcc:	fa043783          	ld	a5,-96(s0)
    1fd0:	4bfc                	lw	a5,84(a5)
    1fd2:	f4f42423          	sw	a5,-184(s0)
    1fd6:	a829                	j	1ff0 <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1fd8:	649c                	ld	a5,8(s1)
    1fda:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    1fde:	fa843783          	ld	a5,-88(s0)
    1fe2:	c781                	beqz	a5,1fea <schedule_edf_cbs+0x492>
    1fe4:	fcc42783          	lw	a5,-52(s0)
    1fe8:	a011                	j	1fec <schedule_edf_cbs+0x494>
    1fea:	4785                	li	a5,1
    1fec:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    1ff0:	f4043783          	ld	a5,-192(s0)
    1ff4:	f4f43823          	sd	a5,-176(s0)
    1ff8:	f4843783          	ld	a5,-184(s0)
    1ffc:	f4f43c23          	sd	a5,-168(s0)
    2000:	4701                	li	a4,0
    2002:	f5043703          	ld	a4,-176(s0)
    2006:	4781                	li	a5,0
    2008:	f5843783          	ld	a5,-168(s0)
    200c:	893a                	mv	s2,a4
    200e:	89be                	mv	s3,a5
    2010:	874a                	mv	a4,s2
    2012:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    2014:	853a                	mv	a0,a4
    2016:	85be                	mv	a1,a5
    2018:	70ea                	ld	ra,184(sp)
    201a:	744a                	ld	s0,176(sp)
    201c:	74aa                	ld	s1,168(sp)
    201e:	790a                	ld	s2,160(sp)
    2020:	69ea                	ld	s3,152(sp)
    2022:	6129                	addi	sp,sp,192
    2024:	8082                	ret
