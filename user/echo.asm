
user/_echo:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	f426                	sd	s1,40(sp)
       8:	0080                	addi	s0,sp,64
       a:	87aa                	mv	a5,a0
       c:	fcb43023          	sd	a1,-64(s0)
      10:	fcf42623          	sw	a5,-52(s0)
  int i;

  for(i = 1; i < argc; i++){
      14:	4785                	li	a5,1
      16:	fcf42e23          	sw	a5,-36(s0)
      1a:	a051                	j	9e <main+0x9e>
    write(1, argv[i], strlen(argv[i]));
      1c:	fdc42783          	lw	a5,-36(s0)
      20:	078e                	slli	a5,a5,0x3
      22:	fc043703          	ld	a4,-64(s0)
      26:	97ba                	add	a5,a5,a4
      28:	6384                	ld	s1,0(a5)
      2a:	fdc42783          	lw	a5,-36(s0)
      2e:	078e                	slli	a5,a5,0x3
      30:	fc043703          	ld	a4,-64(s0)
      34:	97ba                	add	a5,a5,a4
      36:	639c                	ld	a5,0(a5)
      38:	853e                	mv	a0,a5
      3a:	00000097          	auipc	ra,0x0
      3e:	12e080e7          	jalr	302(ra) # 168 <strlen>
      42:	87aa                	mv	a5,a0
      44:	2781                	sext.w	a5,a5
      46:	2781                	sext.w	a5,a5
      48:	863e                	mv	a2,a5
      4a:	85a6                	mv	a1,s1
      4c:	4505                	li	a0,1
      4e:	00000097          	auipc	ra,0x0
      52:	51a080e7          	jalr	1306(ra) # 568 <write>
    if(i + 1 < argc){
      56:	fdc42783          	lw	a5,-36(s0)
      5a:	2785                	addiw	a5,a5,1
      5c:	0007871b          	sext.w	a4,a5
      60:	fcc42783          	lw	a5,-52(s0)
      64:	2781                	sext.w	a5,a5
      66:	00f75d63          	bge	a4,a5,80 <main+0x80>
      write(1, " ", 1);
      6a:	4605                	li	a2,1
      6c:	00002597          	auipc	a1,0x2
      70:	fec58593          	addi	a1,a1,-20 # 2058 <schedule_edf_cbs+0x4d4>
      74:	4505                	li	a0,1
      76:	00000097          	auipc	ra,0x0
      7a:	4f2080e7          	jalr	1266(ra) # 568 <write>
      7e:	a819                	j	94 <main+0x94>
    } else {
      write(1, "\n", 1);
      80:	4605                	li	a2,1
      82:	00002597          	auipc	a1,0x2
      86:	fde58593          	addi	a1,a1,-34 # 2060 <schedule_edf_cbs+0x4dc>
      8a:	4505                	li	a0,1
      8c:	00000097          	auipc	ra,0x0
      90:	4dc080e7          	jalr	1244(ra) # 568 <write>
  for(i = 1; i < argc; i++){
      94:	fdc42783          	lw	a5,-36(s0)
      98:	2785                	addiw	a5,a5,1
      9a:	fcf42e23          	sw	a5,-36(s0)
      9e:	fdc42703          	lw	a4,-36(s0)
      a2:	fcc42783          	lw	a5,-52(s0)
      a6:	2701                	sext.w	a4,a4
      a8:	2781                	sext.w	a5,a5
      aa:	f6f749e3          	blt	a4,a5,1c <main+0x1c>
    }
  }
  exit(0);
      ae:	4501                	li	a0,0
      b0:	00000097          	auipc	ra,0x0
      b4:	498080e7          	jalr	1176(ra) # 548 <exit>

00000000000000b8 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      b8:	7179                	addi	sp,sp,-48
      ba:	f422                	sd	s0,40(sp)
      bc:	1800                	addi	s0,sp,48
      be:	fca43c23          	sd	a0,-40(s0)
      c2:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      c6:	fd843783          	ld	a5,-40(s0)
      ca:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      ce:	0001                	nop
      d0:	fd043703          	ld	a4,-48(s0)
      d4:	00170793          	addi	a5,a4,1
      d8:	fcf43823          	sd	a5,-48(s0)
      dc:	fd843783          	ld	a5,-40(s0)
      e0:	00178693          	addi	a3,a5,1
      e4:	fcd43c23          	sd	a3,-40(s0)
      e8:	00074703          	lbu	a4,0(a4)
      ec:	00e78023          	sb	a4,0(a5)
      f0:	0007c783          	lbu	a5,0(a5)
      f4:	fff1                	bnez	a5,d0 <strcpy+0x18>
    ;
  return os;
      f6:	fe843783          	ld	a5,-24(s0)
}
      fa:	853e                	mv	a0,a5
      fc:	7422                	ld	s0,40(sp)
      fe:	6145                	addi	sp,sp,48
     100:	8082                	ret

0000000000000102 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     102:	1101                	addi	sp,sp,-32
     104:	ec22                	sd	s0,24(sp)
     106:	1000                	addi	s0,sp,32
     108:	fea43423          	sd	a0,-24(s0)
     10c:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     110:	a819                	j	126 <strcmp+0x24>
    p++, q++;
     112:	fe843783          	ld	a5,-24(s0)
     116:	0785                	addi	a5,a5,1
     118:	fef43423          	sd	a5,-24(s0)
     11c:	fe043783          	ld	a5,-32(s0)
     120:	0785                	addi	a5,a5,1
     122:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     126:	fe843783          	ld	a5,-24(s0)
     12a:	0007c783          	lbu	a5,0(a5)
     12e:	cb99                	beqz	a5,144 <strcmp+0x42>
     130:	fe843783          	ld	a5,-24(s0)
     134:	0007c703          	lbu	a4,0(a5)
     138:	fe043783          	ld	a5,-32(s0)
     13c:	0007c783          	lbu	a5,0(a5)
     140:	fcf709e3          	beq	a4,a5,112 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     144:	fe843783          	ld	a5,-24(s0)
     148:	0007c783          	lbu	a5,0(a5)
     14c:	0007871b          	sext.w	a4,a5
     150:	fe043783          	ld	a5,-32(s0)
     154:	0007c783          	lbu	a5,0(a5)
     158:	2781                	sext.w	a5,a5
     15a:	40f707bb          	subw	a5,a4,a5
     15e:	2781                	sext.w	a5,a5
}
     160:	853e                	mv	a0,a5
     162:	6462                	ld	s0,24(sp)
     164:	6105                	addi	sp,sp,32
     166:	8082                	ret

0000000000000168 <strlen>:

uint
strlen(const char *s)
{
     168:	7179                	addi	sp,sp,-48
     16a:	f422                	sd	s0,40(sp)
     16c:	1800                	addi	s0,sp,48
     16e:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     172:	fe042623          	sw	zero,-20(s0)
     176:	a031                	j	182 <strlen+0x1a>
     178:	fec42783          	lw	a5,-20(s0)
     17c:	2785                	addiw	a5,a5,1
     17e:	fef42623          	sw	a5,-20(s0)
     182:	fec42783          	lw	a5,-20(s0)
     186:	fd843703          	ld	a4,-40(s0)
     18a:	97ba                	add	a5,a5,a4
     18c:	0007c783          	lbu	a5,0(a5)
     190:	f7e5                	bnez	a5,178 <strlen+0x10>
    ;
  return n;
     192:	fec42783          	lw	a5,-20(s0)
}
     196:	853e                	mv	a0,a5
     198:	7422                	ld	s0,40(sp)
     19a:	6145                	addi	sp,sp,48
     19c:	8082                	ret

000000000000019e <memset>:

void*
memset(void *dst, int c, uint n)
{
     19e:	7179                	addi	sp,sp,-48
     1a0:	f422                	sd	s0,40(sp)
     1a2:	1800                	addi	s0,sp,48
     1a4:	fca43c23          	sd	a0,-40(s0)
     1a8:	87ae                	mv	a5,a1
     1aa:	8732                	mv	a4,a2
     1ac:	fcf42a23          	sw	a5,-44(s0)
     1b0:	87ba                	mv	a5,a4
     1b2:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     1b6:	fd843783          	ld	a5,-40(s0)
     1ba:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     1be:	fe042623          	sw	zero,-20(s0)
     1c2:	a00d                	j	1e4 <memset+0x46>
    cdst[i] = c;
     1c4:	fec42783          	lw	a5,-20(s0)
     1c8:	fe043703          	ld	a4,-32(s0)
     1cc:	97ba                	add	a5,a5,a4
     1ce:	fd442703          	lw	a4,-44(s0)
     1d2:	0ff77713          	andi	a4,a4,255
     1d6:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1da:	fec42783          	lw	a5,-20(s0)
     1de:	2785                	addiw	a5,a5,1
     1e0:	fef42623          	sw	a5,-20(s0)
     1e4:	fec42703          	lw	a4,-20(s0)
     1e8:	fd042783          	lw	a5,-48(s0)
     1ec:	2781                	sext.w	a5,a5
     1ee:	fcf76be3          	bltu	a4,a5,1c4 <memset+0x26>
  }
  return dst;
     1f2:	fd843783          	ld	a5,-40(s0)
}
     1f6:	853e                	mv	a0,a5
     1f8:	7422                	ld	s0,40(sp)
     1fa:	6145                	addi	sp,sp,48
     1fc:	8082                	ret

00000000000001fe <strchr>:

char*
strchr(const char *s, char c)
{
     1fe:	1101                	addi	sp,sp,-32
     200:	ec22                	sd	s0,24(sp)
     202:	1000                	addi	s0,sp,32
     204:	fea43423          	sd	a0,-24(s0)
     208:	87ae                	mv	a5,a1
     20a:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     20e:	a01d                	j	234 <strchr+0x36>
    if(*s == c)
     210:	fe843783          	ld	a5,-24(s0)
     214:	0007c703          	lbu	a4,0(a5)
     218:	fe744783          	lbu	a5,-25(s0)
     21c:	0ff7f793          	andi	a5,a5,255
     220:	00e79563          	bne	a5,a4,22a <strchr+0x2c>
      return (char*)s;
     224:	fe843783          	ld	a5,-24(s0)
     228:	a821                	j	240 <strchr+0x42>
  for(; *s; s++)
     22a:	fe843783          	ld	a5,-24(s0)
     22e:	0785                	addi	a5,a5,1
     230:	fef43423          	sd	a5,-24(s0)
     234:	fe843783          	ld	a5,-24(s0)
     238:	0007c783          	lbu	a5,0(a5)
     23c:	fbf1                	bnez	a5,210 <strchr+0x12>
  return 0;
     23e:	4781                	li	a5,0
}
     240:	853e                	mv	a0,a5
     242:	6462                	ld	s0,24(sp)
     244:	6105                	addi	sp,sp,32
     246:	8082                	ret

0000000000000248 <gets>:

char*
gets(char *buf, int max)
{
     248:	7179                	addi	sp,sp,-48
     24a:	f406                	sd	ra,40(sp)
     24c:	f022                	sd	s0,32(sp)
     24e:	1800                	addi	s0,sp,48
     250:	fca43c23          	sd	a0,-40(s0)
     254:	87ae                	mv	a5,a1
     256:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     25a:	fe042623          	sw	zero,-20(s0)
     25e:	a8a1                	j	2b6 <gets+0x6e>
    cc = read(0, &c, 1);
     260:	fe740793          	addi	a5,s0,-25
     264:	4605                	li	a2,1
     266:	85be                	mv	a1,a5
     268:	4501                	li	a0,0
     26a:	00000097          	auipc	ra,0x0
     26e:	2f6080e7          	jalr	758(ra) # 560 <read>
     272:	87aa                	mv	a5,a0
     274:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     278:	fe842783          	lw	a5,-24(s0)
     27c:	2781                	sext.w	a5,a5
     27e:	04f05763          	blez	a5,2cc <gets+0x84>
      break;
    buf[i++] = c;
     282:	fec42783          	lw	a5,-20(s0)
     286:	0017871b          	addiw	a4,a5,1
     28a:	fee42623          	sw	a4,-20(s0)
     28e:	873e                	mv	a4,a5
     290:	fd843783          	ld	a5,-40(s0)
     294:	97ba                	add	a5,a5,a4
     296:	fe744703          	lbu	a4,-25(s0)
     29a:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     29e:	fe744783          	lbu	a5,-25(s0)
     2a2:	873e                	mv	a4,a5
     2a4:	47a9                	li	a5,10
     2a6:	02f70463          	beq	a4,a5,2ce <gets+0x86>
     2aa:	fe744783          	lbu	a5,-25(s0)
     2ae:	873e                	mv	a4,a5
     2b0:	47b5                	li	a5,13
     2b2:	00f70e63          	beq	a4,a5,2ce <gets+0x86>
  for(i=0; i+1 < max; ){
     2b6:	fec42783          	lw	a5,-20(s0)
     2ba:	2785                	addiw	a5,a5,1
     2bc:	0007871b          	sext.w	a4,a5
     2c0:	fd442783          	lw	a5,-44(s0)
     2c4:	2781                	sext.w	a5,a5
     2c6:	f8f74de3          	blt	a4,a5,260 <gets+0x18>
     2ca:	a011                	j	2ce <gets+0x86>
      break;
     2cc:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2ce:	fec42783          	lw	a5,-20(s0)
     2d2:	fd843703          	ld	a4,-40(s0)
     2d6:	97ba                	add	a5,a5,a4
     2d8:	00078023          	sb	zero,0(a5)
  return buf;
     2dc:	fd843783          	ld	a5,-40(s0)
}
     2e0:	853e                	mv	a0,a5
     2e2:	70a2                	ld	ra,40(sp)
     2e4:	7402                	ld	s0,32(sp)
     2e6:	6145                	addi	sp,sp,48
     2e8:	8082                	ret

00000000000002ea <stat>:

int
stat(const char *n, struct stat *st)
{
     2ea:	7179                	addi	sp,sp,-48
     2ec:	f406                	sd	ra,40(sp)
     2ee:	f022                	sd	s0,32(sp)
     2f0:	1800                	addi	s0,sp,48
     2f2:	fca43c23          	sd	a0,-40(s0)
     2f6:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2fa:	4581                	li	a1,0
     2fc:	fd843503          	ld	a0,-40(s0)
     300:	00000097          	auipc	ra,0x0
     304:	288080e7          	jalr	648(ra) # 588 <open>
     308:	87aa                	mv	a5,a0
     30a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     30e:	fec42783          	lw	a5,-20(s0)
     312:	2781                	sext.w	a5,a5
     314:	0007d463          	bgez	a5,31c <stat+0x32>
    return -1;
     318:	57fd                	li	a5,-1
     31a:	a035                	j	346 <stat+0x5c>
  r = fstat(fd, st);
     31c:	fec42783          	lw	a5,-20(s0)
     320:	fd043583          	ld	a1,-48(s0)
     324:	853e                	mv	a0,a5
     326:	00000097          	auipc	ra,0x0
     32a:	27a080e7          	jalr	634(ra) # 5a0 <fstat>
     32e:	87aa                	mv	a5,a0
     330:	fef42423          	sw	a5,-24(s0)
  close(fd);
     334:	fec42783          	lw	a5,-20(s0)
     338:	853e                	mv	a0,a5
     33a:	00000097          	auipc	ra,0x0
     33e:	236080e7          	jalr	566(ra) # 570 <close>
  return r;
     342:	fe842783          	lw	a5,-24(s0)
}
     346:	853e                	mv	a0,a5
     348:	70a2                	ld	ra,40(sp)
     34a:	7402                	ld	s0,32(sp)
     34c:	6145                	addi	sp,sp,48
     34e:	8082                	ret

0000000000000350 <atoi>:

int
atoi(const char *s)
{
     350:	7179                	addi	sp,sp,-48
     352:	f422                	sd	s0,40(sp)
     354:	1800                	addi	s0,sp,48
     356:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     35a:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     35e:	a815                	j	392 <atoi+0x42>
    n = n*10 + *s++ - '0';
     360:	fec42703          	lw	a4,-20(s0)
     364:	87ba                	mv	a5,a4
     366:	0027979b          	slliw	a5,a5,0x2
     36a:	9fb9                	addw	a5,a5,a4
     36c:	0017979b          	slliw	a5,a5,0x1
     370:	0007871b          	sext.w	a4,a5
     374:	fd843783          	ld	a5,-40(s0)
     378:	00178693          	addi	a3,a5,1
     37c:	fcd43c23          	sd	a3,-40(s0)
     380:	0007c783          	lbu	a5,0(a5)
     384:	2781                	sext.w	a5,a5
     386:	9fb9                	addw	a5,a5,a4
     388:	2781                	sext.w	a5,a5
     38a:	fd07879b          	addiw	a5,a5,-48
     38e:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     392:	fd843783          	ld	a5,-40(s0)
     396:	0007c783          	lbu	a5,0(a5)
     39a:	873e                	mv	a4,a5
     39c:	02f00793          	li	a5,47
     3a0:	00e7fb63          	bgeu	a5,a4,3b6 <atoi+0x66>
     3a4:	fd843783          	ld	a5,-40(s0)
     3a8:	0007c783          	lbu	a5,0(a5)
     3ac:	873e                	mv	a4,a5
     3ae:	03900793          	li	a5,57
     3b2:	fae7f7e3          	bgeu	a5,a4,360 <atoi+0x10>
  return n;
     3b6:	fec42783          	lw	a5,-20(s0)
}
     3ba:	853e                	mv	a0,a5
     3bc:	7422                	ld	s0,40(sp)
     3be:	6145                	addi	sp,sp,48
     3c0:	8082                	ret

00000000000003c2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     3c2:	7139                	addi	sp,sp,-64
     3c4:	fc22                	sd	s0,56(sp)
     3c6:	0080                	addi	s0,sp,64
     3c8:	fca43c23          	sd	a0,-40(s0)
     3cc:	fcb43823          	sd	a1,-48(s0)
     3d0:	87b2                	mv	a5,a2
     3d2:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3d6:	fd843783          	ld	a5,-40(s0)
     3da:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3de:	fd043783          	ld	a5,-48(s0)
     3e2:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3e6:	fe043703          	ld	a4,-32(s0)
     3ea:	fe843783          	ld	a5,-24(s0)
     3ee:	02e7fc63          	bgeu	a5,a4,426 <memmove+0x64>
    while(n-- > 0)
     3f2:	a00d                	j	414 <memmove+0x52>
      *dst++ = *src++;
     3f4:	fe043703          	ld	a4,-32(s0)
     3f8:	00170793          	addi	a5,a4,1
     3fc:	fef43023          	sd	a5,-32(s0)
     400:	fe843783          	ld	a5,-24(s0)
     404:	00178693          	addi	a3,a5,1
     408:	fed43423          	sd	a3,-24(s0)
     40c:	00074703          	lbu	a4,0(a4)
     410:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     414:	fcc42783          	lw	a5,-52(s0)
     418:	fff7871b          	addiw	a4,a5,-1
     41c:	fce42623          	sw	a4,-52(s0)
     420:	fcf04ae3          	bgtz	a5,3f4 <memmove+0x32>
     424:	a891                	j	478 <memmove+0xb6>
  } else {
    dst += n;
     426:	fcc42783          	lw	a5,-52(s0)
     42a:	fe843703          	ld	a4,-24(s0)
     42e:	97ba                	add	a5,a5,a4
     430:	fef43423          	sd	a5,-24(s0)
    src += n;
     434:	fcc42783          	lw	a5,-52(s0)
     438:	fe043703          	ld	a4,-32(s0)
     43c:	97ba                	add	a5,a5,a4
     43e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     442:	a01d                	j	468 <memmove+0xa6>
      *--dst = *--src;
     444:	fe043783          	ld	a5,-32(s0)
     448:	17fd                	addi	a5,a5,-1
     44a:	fef43023          	sd	a5,-32(s0)
     44e:	fe843783          	ld	a5,-24(s0)
     452:	17fd                	addi	a5,a5,-1
     454:	fef43423          	sd	a5,-24(s0)
     458:	fe043783          	ld	a5,-32(s0)
     45c:	0007c703          	lbu	a4,0(a5)
     460:	fe843783          	ld	a5,-24(s0)
     464:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     468:	fcc42783          	lw	a5,-52(s0)
     46c:	fff7871b          	addiw	a4,a5,-1
     470:	fce42623          	sw	a4,-52(s0)
     474:	fcf048e3          	bgtz	a5,444 <memmove+0x82>
  }
  return vdst;
     478:	fd843783          	ld	a5,-40(s0)
}
     47c:	853e                	mv	a0,a5
     47e:	7462                	ld	s0,56(sp)
     480:	6121                	addi	sp,sp,64
     482:	8082                	ret

0000000000000484 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     484:	7139                	addi	sp,sp,-64
     486:	fc22                	sd	s0,56(sp)
     488:	0080                	addi	s0,sp,64
     48a:	fca43c23          	sd	a0,-40(s0)
     48e:	fcb43823          	sd	a1,-48(s0)
     492:	87b2                	mv	a5,a2
     494:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     498:	fd843783          	ld	a5,-40(s0)
     49c:	fef43423          	sd	a5,-24(s0)
     4a0:	fd043783          	ld	a5,-48(s0)
     4a4:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4a8:	a0a1                	j	4f0 <memcmp+0x6c>
    if (*p1 != *p2) {
     4aa:	fe843783          	ld	a5,-24(s0)
     4ae:	0007c703          	lbu	a4,0(a5)
     4b2:	fe043783          	ld	a5,-32(s0)
     4b6:	0007c783          	lbu	a5,0(a5)
     4ba:	02f70163          	beq	a4,a5,4dc <memcmp+0x58>
      return *p1 - *p2;
     4be:	fe843783          	ld	a5,-24(s0)
     4c2:	0007c783          	lbu	a5,0(a5)
     4c6:	0007871b          	sext.w	a4,a5
     4ca:	fe043783          	ld	a5,-32(s0)
     4ce:	0007c783          	lbu	a5,0(a5)
     4d2:	2781                	sext.w	a5,a5
     4d4:	40f707bb          	subw	a5,a4,a5
     4d8:	2781                	sext.w	a5,a5
     4da:	a01d                	j	500 <memcmp+0x7c>
    }
    p1++;
     4dc:	fe843783          	ld	a5,-24(s0)
     4e0:	0785                	addi	a5,a5,1
     4e2:	fef43423          	sd	a5,-24(s0)
    p2++;
     4e6:	fe043783          	ld	a5,-32(s0)
     4ea:	0785                	addi	a5,a5,1
     4ec:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4f0:	fcc42783          	lw	a5,-52(s0)
     4f4:	fff7871b          	addiw	a4,a5,-1
     4f8:	fce42623          	sw	a4,-52(s0)
     4fc:	f7dd                	bnez	a5,4aa <memcmp+0x26>
  }
  return 0;
     4fe:	4781                	li	a5,0
}
     500:	853e                	mv	a0,a5
     502:	7462                	ld	s0,56(sp)
     504:	6121                	addi	sp,sp,64
     506:	8082                	ret

0000000000000508 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     508:	7179                	addi	sp,sp,-48
     50a:	f406                	sd	ra,40(sp)
     50c:	f022                	sd	s0,32(sp)
     50e:	1800                	addi	s0,sp,48
     510:	fea43423          	sd	a0,-24(s0)
     514:	feb43023          	sd	a1,-32(s0)
     518:	87b2                	mv	a5,a2
     51a:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     51e:	fdc42783          	lw	a5,-36(s0)
     522:	863e                	mv	a2,a5
     524:	fe043583          	ld	a1,-32(s0)
     528:	fe843503          	ld	a0,-24(s0)
     52c:	00000097          	auipc	ra,0x0
     530:	e96080e7          	jalr	-362(ra) # 3c2 <memmove>
     534:	87aa                	mv	a5,a0
}
     536:	853e                	mv	a0,a5
     538:	70a2                	ld	ra,40(sp)
     53a:	7402                	ld	s0,32(sp)
     53c:	6145                	addi	sp,sp,48
     53e:	8082                	ret

0000000000000540 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     540:	4885                	li	a7,1
 ecall
     542:	00000073          	ecall
 ret
     546:	8082                	ret

0000000000000548 <exit>:
.global exit
exit:
 li a7, SYS_exit
     548:	4889                	li	a7,2
 ecall
     54a:	00000073          	ecall
 ret
     54e:	8082                	ret

0000000000000550 <wait>:
.global wait
wait:
 li a7, SYS_wait
     550:	488d                	li	a7,3
 ecall
     552:	00000073          	ecall
 ret
     556:	8082                	ret

0000000000000558 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     558:	4891                	li	a7,4
 ecall
     55a:	00000073          	ecall
 ret
     55e:	8082                	ret

0000000000000560 <read>:
.global read
read:
 li a7, SYS_read
     560:	4895                	li	a7,5
 ecall
     562:	00000073          	ecall
 ret
     566:	8082                	ret

0000000000000568 <write>:
.global write
write:
 li a7, SYS_write
     568:	48c1                	li	a7,16
 ecall
     56a:	00000073          	ecall
 ret
     56e:	8082                	ret

0000000000000570 <close>:
.global close
close:
 li a7, SYS_close
     570:	48d5                	li	a7,21
 ecall
     572:	00000073          	ecall
 ret
     576:	8082                	ret

0000000000000578 <kill>:
.global kill
kill:
 li a7, SYS_kill
     578:	4899                	li	a7,6
 ecall
     57a:	00000073          	ecall
 ret
     57e:	8082                	ret

0000000000000580 <exec>:
.global exec
exec:
 li a7, SYS_exec
     580:	489d                	li	a7,7
 ecall
     582:	00000073          	ecall
 ret
     586:	8082                	ret

0000000000000588 <open>:
.global open
open:
 li a7, SYS_open
     588:	48bd                	li	a7,15
 ecall
     58a:	00000073          	ecall
 ret
     58e:	8082                	ret

0000000000000590 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     590:	48c5                	li	a7,17
 ecall
     592:	00000073          	ecall
 ret
     596:	8082                	ret

0000000000000598 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     598:	48c9                	li	a7,18
 ecall
     59a:	00000073          	ecall
 ret
     59e:	8082                	ret

00000000000005a0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     5a0:	48a1                	li	a7,8
 ecall
     5a2:	00000073          	ecall
 ret
     5a6:	8082                	ret

00000000000005a8 <link>:
.global link
link:
 li a7, SYS_link
     5a8:	48cd                	li	a7,19
 ecall
     5aa:	00000073          	ecall
 ret
     5ae:	8082                	ret

00000000000005b0 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     5b0:	48d1                	li	a7,20
 ecall
     5b2:	00000073          	ecall
 ret
     5b6:	8082                	ret

00000000000005b8 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     5b8:	48a5                	li	a7,9
 ecall
     5ba:	00000073          	ecall
 ret
     5be:	8082                	ret

00000000000005c0 <dup>:
.global dup
dup:
 li a7, SYS_dup
     5c0:	48a9                	li	a7,10
 ecall
     5c2:	00000073          	ecall
 ret
     5c6:	8082                	ret

00000000000005c8 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     5c8:	48ad                	li	a7,11
 ecall
     5ca:	00000073          	ecall
 ret
     5ce:	8082                	ret

00000000000005d0 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5d0:	48b1                	li	a7,12
 ecall
     5d2:	00000073          	ecall
 ret
     5d6:	8082                	ret

00000000000005d8 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5d8:	48b5                	li	a7,13
 ecall
     5da:	00000073          	ecall
 ret
     5de:	8082                	ret

00000000000005e0 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5e0:	48b9                	li	a7,14
 ecall
     5e2:	00000073          	ecall
 ret
     5e6:	8082                	ret

00000000000005e8 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5e8:	48d9                	li	a7,22
 ecall
     5ea:	00000073          	ecall
 ret
     5ee:	8082                	ret

00000000000005f0 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5f0:	48dd                	li	a7,23
 ecall
     5f2:	00000073          	ecall
 ret
     5f6:	8082                	ret

00000000000005f8 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5f8:	48e1                	li	a7,24
 ecall
     5fa:	00000073          	ecall
 ret
     5fe:	8082                	ret

0000000000000600 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     600:	1101                	addi	sp,sp,-32
     602:	ec06                	sd	ra,24(sp)
     604:	e822                	sd	s0,16(sp)
     606:	1000                	addi	s0,sp,32
     608:	87aa                	mv	a5,a0
     60a:	872e                	mv	a4,a1
     60c:	fef42623          	sw	a5,-20(s0)
     610:	87ba                	mv	a5,a4
     612:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     616:	feb40713          	addi	a4,s0,-21
     61a:	fec42783          	lw	a5,-20(s0)
     61e:	4605                	li	a2,1
     620:	85ba                	mv	a1,a4
     622:	853e                	mv	a0,a5
     624:	00000097          	auipc	ra,0x0
     628:	f44080e7          	jalr	-188(ra) # 568 <write>
}
     62c:	0001                	nop
     62e:	60e2                	ld	ra,24(sp)
     630:	6442                	ld	s0,16(sp)
     632:	6105                	addi	sp,sp,32
     634:	8082                	ret

0000000000000636 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     636:	7139                	addi	sp,sp,-64
     638:	fc06                	sd	ra,56(sp)
     63a:	f822                	sd	s0,48(sp)
     63c:	0080                	addi	s0,sp,64
     63e:	87aa                	mv	a5,a0
     640:	8736                	mv	a4,a3
     642:	fcf42623          	sw	a5,-52(s0)
     646:	87ae                	mv	a5,a1
     648:	fcf42423          	sw	a5,-56(s0)
     64c:	87b2                	mv	a5,a2
     64e:	fcf42223          	sw	a5,-60(s0)
     652:	87ba                	mv	a5,a4
     654:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     658:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     65c:	fc042783          	lw	a5,-64(s0)
     660:	2781                	sext.w	a5,a5
     662:	c38d                	beqz	a5,684 <printint+0x4e>
     664:	fc842783          	lw	a5,-56(s0)
     668:	2781                	sext.w	a5,a5
     66a:	0007dd63          	bgez	a5,684 <printint+0x4e>
    neg = 1;
     66e:	4785                	li	a5,1
     670:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     674:	fc842783          	lw	a5,-56(s0)
     678:	40f007bb          	negw	a5,a5
     67c:	2781                	sext.w	a5,a5
     67e:	fef42223          	sw	a5,-28(s0)
     682:	a029                	j	68c <printint+0x56>
  } else {
    x = xx;
     684:	fc842783          	lw	a5,-56(s0)
     688:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     68c:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     690:	fc442783          	lw	a5,-60(s0)
     694:	fe442703          	lw	a4,-28(s0)
     698:	02f777bb          	remuw	a5,a4,a5
     69c:	0007861b          	sext.w	a2,a5
     6a0:	fec42783          	lw	a5,-20(s0)
     6a4:	0017871b          	addiw	a4,a5,1
     6a8:	fee42623          	sw	a4,-20(s0)
     6ac:	00002697          	auipc	a3,0x2
     6b0:	c3c68693          	addi	a3,a3,-964 # 22e8 <digits>
     6b4:	02061713          	slli	a4,a2,0x20
     6b8:	9301                	srli	a4,a4,0x20
     6ba:	9736                	add	a4,a4,a3
     6bc:	00074703          	lbu	a4,0(a4)
     6c0:	ff040693          	addi	a3,s0,-16
     6c4:	97b6                	add	a5,a5,a3
     6c6:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     6ca:	fc442783          	lw	a5,-60(s0)
     6ce:	fe442703          	lw	a4,-28(s0)
     6d2:	02f757bb          	divuw	a5,a4,a5
     6d6:	fef42223          	sw	a5,-28(s0)
     6da:	fe442783          	lw	a5,-28(s0)
     6de:	2781                	sext.w	a5,a5
     6e0:	fbc5                	bnez	a5,690 <printint+0x5a>
  if(neg)
     6e2:	fe842783          	lw	a5,-24(s0)
     6e6:	2781                	sext.w	a5,a5
     6e8:	cf95                	beqz	a5,724 <printint+0xee>
    buf[i++] = '-';
     6ea:	fec42783          	lw	a5,-20(s0)
     6ee:	0017871b          	addiw	a4,a5,1
     6f2:	fee42623          	sw	a4,-20(s0)
     6f6:	ff040713          	addi	a4,s0,-16
     6fa:	97ba                	add	a5,a5,a4
     6fc:	02d00713          	li	a4,45
     700:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     704:	a005                	j	724 <printint+0xee>
    putc(fd, buf[i]);
     706:	fec42783          	lw	a5,-20(s0)
     70a:	ff040713          	addi	a4,s0,-16
     70e:	97ba                	add	a5,a5,a4
     710:	fe07c703          	lbu	a4,-32(a5)
     714:	fcc42783          	lw	a5,-52(s0)
     718:	85ba                	mv	a1,a4
     71a:	853e                	mv	a0,a5
     71c:	00000097          	auipc	ra,0x0
     720:	ee4080e7          	jalr	-284(ra) # 600 <putc>
  while(--i >= 0)
     724:	fec42783          	lw	a5,-20(s0)
     728:	37fd                	addiw	a5,a5,-1
     72a:	fef42623          	sw	a5,-20(s0)
     72e:	fec42783          	lw	a5,-20(s0)
     732:	2781                	sext.w	a5,a5
     734:	fc07d9e3          	bgez	a5,706 <printint+0xd0>
}
     738:	0001                	nop
     73a:	0001                	nop
     73c:	70e2                	ld	ra,56(sp)
     73e:	7442                	ld	s0,48(sp)
     740:	6121                	addi	sp,sp,64
     742:	8082                	ret

0000000000000744 <printptr>:

static void
printptr(int fd, uint64 x) {
     744:	7179                	addi	sp,sp,-48
     746:	f406                	sd	ra,40(sp)
     748:	f022                	sd	s0,32(sp)
     74a:	1800                	addi	s0,sp,48
     74c:	87aa                	mv	a5,a0
     74e:	fcb43823          	sd	a1,-48(s0)
     752:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     756:	fdc42783          	lw	a5,-36(s0)
     75a:	03000593          	li	a1,48
     75e:	853e                	mv	a0,a5
     760:	00000097          	auipc	ra,0x0
     764:	ea0080e7          	jalr	-352(ra) # 600 <putc>
  putc(fd, 'x');
     768:	fdc42783          	lw	a5,-36(s0)
     76c:	07800593          	li	a1,120
     770:	853e                	mv	a0,a5
     772:	00000097          	auipc	ra,0x0
     776:	e8e080e7          	jalr	-370(ra) # 600 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     77a:	fe042623          	sw	zero,-20(s0)
     77e:	a82d                	j	7b8 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     780:	fd043783          	ld	a5,-48(s0)
     784:	93f1                	srli	a5,a5,0x3c
     786:	00002717          	auipc	a4,0x2
     78a:	b6270713          	addi	a4,a4,-1182 # 22e8 <digits>
     78e:	97ba                	add	a5,a5,a4
     790:	0007c703          	lbu	a4,0(a5)
     794:	fdc42783          	lw	a5,-36(s0)
     798:	85ba                	mv	a1,a4
     79a:	853e                	mv	a0,a5
     79c:	00000097          	auipc	ra,0x0
     7a0:	e64080e7          	jalr	-412(ra) # 600 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7a4:	fec42783          	lw	a5,-20(s0)
     7a8:	2785                	addiw	a5,a5,1
     7aa:	fef42623          	sw	a5,-20(s0)
     7ae:	fd043783          	ld	a5,-48(s0)
     7b2:	0792                	slli	a5,a5,0x4
     7b4:	fcf43823          	sd	a5,-48(s0)
     7b8:	fec42783          	lw	a5,-20(s0)
     7bc:	873e                	mv	a4,a5
     7be:	47bd                	li	a5,15
     7c0:	fce7f0e3          	bgeu	a5,a4,780 <printptr+0x3c>
}
     7c4:	0001                	nop
     7c6:	0001                	nop
     7c8:	70a2                	ld	ra,40(sp)
     7ca:	7402                	ld	s0,32(sp)
     7cc:	6145                	addi	sp,sp,48
     7ce:	8082                	ret

00000000000007d0 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7d0:	715d                	addi	sp,sp,-80
     7d2:	e486                	sd	ra,72(sp)
     7d4:	e0a2                	sd	s0,64(sp)
     7d6:	0880                	addi	s0,sp,80
     7d8:	87aa                	mv	a5,a0
     7da:	fcb43023          	sd	a1,-64(s0)
     7de:	fac43c23          	sd	a2,-72(s0)
     7e2:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7e6:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7ea:	fe042223          	sw	zero,-28(s0)
     7ee:	a42d                	j	a18 <vprintf+0x248>
    c = fmt[i] & 0xff;
     7f0:	fe442783          	lw	a5,-28(s0)
     7f4:	fc043703          	ld	a4,-64(s0)
     7f8:	97ba                	add	a5,a5,a4
     7fa:	0007c783          	lbu	a5,0(a5)
     7fe:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     802:	fe042783          	lw	a5,-32(s0)
     806:	2781                	sext.w	a5,a5
     808:	eb9d                	bnez	a5,83e <vprintf+0x6e>
      if(c == '%'){
     80a:	fdc42783          	lw	a5,-36(s0)
     80e:	0007871b          	sext.w	a4,a5
     812:	02500793          	li	a5,37
     816:	00f71763          	bne	a4,a5,824 <vprintf+0x54>
        state = '%';
     81a:	02500793          	li	a5,37
     81e:	fef42023          	sw	a5,-32(s0)
     822:	a2f5                	j	a0e <vprintf+0x23e>
      } else {
        putc(fd, c);
     824:	fdc42783          	lw	a5,-36(s0)
     828:	0ff7f713          	andi	a4,a5,255
     82c:	fcc42783          	lw	a5,-52(s0)
     830:	85ba                	mv	a1,a4
     832:	853e                	mv	a0,a5
     834:	00000097          	auipc	ra,0x0
     838:	dcc080e7          	jalr	-564(ra) # 600 <putc>
     83c:	aac9                	j	a0e <vprintf+0x23e>
      }
    } else if(state == '%'){
     83e:	fe042783          	lw	a5,-32(s0)
     842:	0007871b          	sext.w	a4,a5
     846:	02500793          	li	a5,37
     84a:	1cf71263          	bne	a4,a5,a0e <vprintf+0x23e>
      if(c == 'd'){
     84e:	fdc42783          	lw	a5,-36(s0)
     852:	0007871b          	sext.w	a4,a5
     856:	06400793          	li	a5,100
     85a:	02f71463          	bne	a4,a5,882 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     85e:	fb843783          	ld	a5,-72(s0)
     862:	00878713          	addi	a4,a5,8
     866:	fae43c23          	sd	a4,-72(s0)
     86a:	4398                	lw	a4,0(a5)
     86c:	fcc42783          	lw	a5,-52(s0)
     870:	4685                	li	a3,1
     872:	4629                	li	a2,10
     874:	85ba                	mv	a1,a4
     876:	853e                	mv	a0,a5
     878:	00000097          	auipc	ra,0x0
     87c:	dbe080e7          	jalr	-578(ra) # 636 <printint>
     880:	a269                	j	a0a <vprintf+0x23a>
      } else if(c == 'l') {
     882:	fdc42783          	lw	a5,-36(s0)
     886:	0007871b          	sext.w	a4,a5
     88a:	06c00793          	li	a5,108
     88e:	02f71663          	bne	a4,a5,8ba <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     892:	fb843783          	ld	a5,-72(s0)
     896:	00878713          	addi	a4,a5,8
     89a:	fae43c23          	sd	a4,-72(s0)
     89e:	639c                	ld	a5,0(a5)
     8a0:	0007871b          	sext.w	a4,a5
     8a4:	fcc42783          	lw	a5,-52(s0)
     8a8:	4681                	li	a3,0
     8aa:	4629                	li	a2,10
     8ac:	85ba                	mv	a1,a4
     8ae:	853e                	mv	a0,a5
     8b0:	00000097          	auipc	ra,0x0
     8b4:	d86080e7          	jalr	-634(ra) # 636 <printint>
     8b8:	aa89                	j	a0a <vprintf+0x23a>
      } else if(c == 'x') {
     8ba:	fdc42783          	lw	a5,-36(s0)
     8be:	0007871b          	sext.w	a4,a5
     8c2:	07800793          	li	a5,120
     8c6:	02f71463          	bne	a4,a5,8ee <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     8ca:	fb843783          	ld	a5,-72(s0)
     8ce:	00878713          	addi	a4,a5,8
     8d2:	fae43c23          	sd	a4,-72(s0)
     8d6:	4398                	lw	a4,0(a5)
     8d8:	fcc42783          	lw	a5,-52(s0)
     8dc:	4681                	li	a3,0
     8de:	4641                	li	a2,16
     8e0:	85ba                	mv	a1,a4
     8e2:	853e                	mv	a0,a5
     8e4:	00000097          	auipc	ra,0x0
     8e8:	d52080e7          	jalr	-686(ra) # 636 <printint>
     8ec:	aa39                	j	a0a <vprintf+0x23a>
      } else if(c == 'p') {
     8ee:	fdc42783          	lw	a5,-36(s0)
     8f2:	0007871b          	sext.w	a4,a5
     8f6:	07000793          	li	a5,112
     8fa:	02f71263          	bne	a4,a5,91e <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8fe:	fb843783          	ld	a5,-72(s0)
     902:	00878713          	addi	a4,a5,8
     906:	fae43c23          	sd	a4,-72(s0)
     90a:	6398                	ld	a4,0(a5)
     90c:	fcc42783          	lw	a5,-52(s0)
     910:	85ba                	mv	a1,a4
     912:	853e                	mv	a0,a5
     914:	00000097          	auipc	ra,0x0
     918:	e30080e7          	jalr	-464(ra) # 744 <printptr>
     91c:	a0fd                	j	a0a <vprintf+0x23a>
      } else if(c == 's'){
     91e:	fdc42783          	lw	a5,-36(s0)
     922:	0007871b          	sext.w	a4,a5
     926:	07300793          	li	a5,115
     92a:	04f71c63          	bne	a4,a5,982 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     92e:	fb843783          	ld	a5,-72(s0)
     932:	00878713          	addi	a4,a5,8
     936:	fae43c23          	sd	a4,-72(s0)
     93a:	639c                	ld	a5,0(a5)
     93c:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     940:	fe843783          	ld	a5,-24(s0)
     944:	eb8d                	bnez	a5,976 <vprintf+0x1a6>
          s = "(null)";
     946:	00001797          	auipc	a5,0x1
     94a:	72278793          	addi	a5,a5,1826 # 2068 <schedule_edf_cbs+0x4e4>
     94e:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     952:	a015                	j	976 <vprintf+0x1a6>
          putc(fd, *s);
     954:	fe843783          	ld	a5,-24(s0)
     958:	0007c703          	lbu	a4,0(a5)
     95c:	fcc42783          	lw	a5,-52(s0)
     960:	85ba                	mv	a1,a4
     962:	853e                	mv	a0,a5
     964:	00000097          	auipc	ra,0x0
     968:	c9c080e7          	jalr	-868(ra) # 600 <putc>
          s++;
     96c:	fe843783          	ld	a5,-24(s0)
     970:	0785                	addi	a5,a5,1
     972:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     976:	fe843783          	ld	a5,-24(s0)
     97a:	0007c783          	lbu	a5,0(a5)
     97e:	fbf9                	bnez	a5,954 <vprintf+0x184>
     980:	a069                	j	a0a <vprintf+0x23a>
        }
      } else if(c == 'c'){
     982:	fdc42783          	lw	a5,-36(s0)
     986:	0007871b          	sext.w	a4,a5
     98a:	06300793          	li	a5,99
     98e:	02f71463          	bne	a4,a5,9b6 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     992:	fb843783          	ld	a5,-72(s0)
     996:	00878713          	addi	a4,a5,8
     99a:	fae43c23          	sd	a4,-72(s0)
     99e:	439c                	lw	a5,0(a5)
     9a0:	0ff7f713          	andi	a4,a5,255
     9a4:	fcc42783          	lw	a5,-52(s0)
     9a8:	85ba                	mv	a1,a4
     9aa:	853e                	mv	a0,a5
     9ac:	00000097          	auipc	ra,0x0
     9b0:	c54080e7          	jalr	-940(ra) # 600 <putc>
     9b4:	a899                	j	a0a <vprintf+0x23a>
      } else if(c == '%'){
     9b6:	fdc42783          	lw	a5,-36(s0)
     9ba:	0007871b          	sext.w	a4,a5
     9be:	02500793          	li	a5,37
     9c2:	00f71f63          	bne	a4,a5,9e0 <vprintf+0x210>
        putc(fd, c);
     9c6:	fdc42783          	lw	a5,-36(s0)
     9ca:	0ff7f713          	andi	a4,a5,255
     9ce:	fcc42783          	lw	a5,-52(s0)
     9d2:	85ba                	mv	a1,a4
     9d4:	853e                	mv	a0,a5
     9d6:	00000097          	auipc	ra,0x0
     9da:	c2a080e7          	jalr	-982(ra) # 600 <putc>
     9de:	a035                	j	a0a <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9e0:	fcc42783          	lw	a5,-52(s0)
     9e4:	02500593          	li	a1,37
     9e8:	853e                	mv	a0,a5
     9ea:	00000097          	auipc	ra,0x0
     9ee:	c16080e7          	jalr	-1002(ra) # 600 <putc>
        putc(fd, c);
     9f2:	fdc42783          	lw	a5,-36(s0)
     9f6:	0ff7f713          	andi	a4,a5,255
     9fa:	fcc42783          	lw	a5,-52(s0)
     9fe:	85ba                	mv	a1,a4
     a00:	853e                	mv	a0,a5
     a02:	00000097          	auipc	ra,0x0
     a06:	bfe080e7          	jalr	-1026(ra) # 600 <putc>
      }
      state = 0;
     a0a:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a0e:	fe442783          	lw	a5,-28(s0)
     a12:	2785                	addiw	a5,a5,1
     a14:	fef42223          	sw	a5,-28(s0)
     a18:	fe442783          	lw	a5,-28(s0)
     a1c:	fc043703          	ld	a4,-64(s0)
     a20:	97ba                	add	a5,a5,a4
     a22:	0007c783          	lbu	a5,0(a5)
     a26:	dc0795e3          	bnez	a5,7f0 <vprintf+0x20>
    }
  }
}
     a2a:	0001                	nop
     a2c:	0001                	nop
     a2e:	60a6                	ld	ra,72(sp)
     a30:	6406                	ld	s0,64(sp)
     a32:	6161                	addi	sp,sp,80
     a34:	8082                	ret

0000000000000a36 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a36:	7159                	addi	sp,sp,-112
     a38:	fc06                	sd	ra,56(sp)
     a3a:	f822                	sd	s0,48(sp)
     a3c:	0080                	addi	s0,sp,64
     a3e:	fcb43823          	sd	a1,-48(s0)
     a42:	e010                	sd	a2,0(s0)
     a44:	e414                	sd	a3,8(s0)
     a46:	e818                	sd	a4,16(s0)
     a48:	ec1c                	sd	a5,24(s0)
     a4a:	03043023          	sd	a6,32(s0)
     a4e:	03143423          	sd	a7,40(s0)
     a52:	87aa                	mv	a5,a0
     a54:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a58:	03040793          	addi	a5,s0,48
     a5c:	fcf43423          	sd	a5,-56(s0)
     a60:	fc843783          	ld	a5,-56(s0)
     a64:	fd078793          	addi	a5,a5,-48
     a68:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a6c:	fe843703          	ld	a4,-24(s0)
     a70:	fdc42783          	lw	a5,-36(s0)
     a74:	863a                	mv	a2,a4
     a76:	fd043583          	ld	a1,-48(s0)
     a7a:	853e                	mv	a0,a5
     a7c:	00000097          	auipc	ra,0x0
     a80:	d54080e7          	jalr	-684(ra) # 7d0 <vprintf>
}
     a84:	0001                	nop
     a86:	70e2                	ld	ra,56(sp)
     a88:	7442                	ld	s0,48(sp)
     a8a:	6165                	addi	sp,sp,112
     a8c:	8082                	ret

0000000000000a8e <printf>:

void
printf(const char *fmt, ...)
{
     a8e:	7159                	addi	sp,sp,-112
     a90:	f406                	sd	ra,40(sp)
     a92:	f022                	sd	s0,32(sp)
     a94:	1800                	addi	s0,sp,48
     a96:	fca43c23          	sd	a0,-40(s0)
     a9a:	e40c                	sd	a1,8(s0)
     a9c:	e810                	sd	a2,16(s0)
     a9e:	ec14                	sd	a3,24(s0)
     aa0:	f018                	sd	a4,32(s0)
     aa2:	f41c                	sd	a5,40(s0)
     aa4:	03043823          	sd	a6,48(s0)
     aa8:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     aac:	04040793          	addi	a5,s0,64
     ab0:	fcf43823          	sd	a5,-48(s0)
     ab4:	fd043783          	ld	a5,-48(s0)
     ab8:	fc878793          	addi	a5,a5,-56
     abc:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     ac0:	fe843783          	ld	a5,-24(s0)
     ac4:	863e                	mv	a2,a5
     ac6:	fd843583          	ld	a1,-40(s0)
     aca:	4505                	li	a0,1
     acc:	00000097          	auipc	ra,0x0
     ad0:	d04080e7          	jalr	-764(ra) # 7d0 <vprintf>
}
     ad4:	0001                	nop
     ad6:	70a2                	ld	ra,40(sp)
     ad8:	7402                	ld	s0,32(sp)
     ada:	6165                	addi	sp,sp,112
     adc:	8082                	ret

0000000000000ade <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ade:	7179                	addi	sp,sp,-48
     ae0:	f422                	sd	s0,40(sp)
     ae2:	1800                	addi	s0,sp,48
     ae4:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     ae8:	fd843783          	ld	a5,-40(s0)
     aec:	17c1                	addi	a5,a5,-16
     aee:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     af2:	00002797          	auipc	a5,0x2
     af6:	84e78793          	addi	a5,a5,-1970 # 2340 <freep>
     afa:	639c                	ld	a5,0(a5)
     afc:	fef43423          	sd	a5,-24(s0)
     b00:	a815                	j	b34 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b02:	fe843783          	ld	a5,-24(s0)
     b06:	639c                	ld	a5,0(a5)
     b08:	fe843703          	ld	a4,-24(s0)
     b0c:	00f76f63          	bltu	a4,a5,b2a <free+0x4c>
     b10:	fe043703          	ld	a4,-32(s0)
     b14:	fe843783          	ld	a5,-24(s0)
     b18:	02e7eb63          	bltu	a5,a4,b4e <free+0x70>
     b1c:	fe843783          	ld	a5,-24(s0)
     b20:	639c                	ld	a5,0(a5)
     b22:	fe043703          	ld	a4,-32(s0)
     b26:	02f76463          	bltu	a4,a5,b4e <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b2a:	fe843783          	ld	a5,-24(s0)
     b2e:	639c                	ld	a5,0(a5)
     b30:	fef43423          	sd	a5,-24(s0)
     b34:	fe043703          	ld	a4,-32(s0)
     b38:	fe843783          	ld	a5,-24(s0)
     b3c:	fce7f3e3          	bgeu	a5,a4,b02 <free+0x24>
     b40:	fe843783          	ld	a5,-24(s0)
     b44:	639c                	ld	a5,0(a5)
     b46:	fe043703          	ld	a4,-32(s0)
     b4a:	faf77ce3          	bgeu	a4,a5,b02 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b4e:	fe043783          	ld	a5,-32(s0)
     b52:	479c                	lw	a5,8(a5)
     b54:	1782                	slli	a5,a5,0x20
     b56:	9381                	srli	a5,a5,0x20
     b58:	0792                	slli	a5,a5,0x4
     b5a:	fe043703          	ld	a4,-32(s0)
     b5e:	973e                	add	a4,a4,a5
     b60:	fe843783          	ld	a5,-24(s0)
     b64:	639c                	ld	a5,0(a5)
     b66:	02f71763          	bne	a4,a5,b94 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b6a:	fe043783          	ld	a5,-32(s0)
     b6e:	4798                	lw	a4,8(a5)
     b70:	fe843783          	ld	a5,-24(s0)
     b74:	639c                	ld	a5,0(a5)
     b76:	479c                	lw	a5,8(a5)
     b78:	9fb9                	addw	a5,a5,a4
     b7a:	0007871b          	sext.w	a4,a5
     b7e:	fe043783          	ld	a5,-32(s0)
     b82:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b84:	fe843783          	ld	a5,-24(s0)
     b88:	639c                	ld	a5,0(a5)
     b8a:	6398                	ld	a4,0(a5)
     b8c:	fe043783          	ld	a5,-32(s0)
     b90:	e398                	sd	a4,0(a5)
     b92:	a039                	j	ba0 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b94:	fe843783          	ld	a5,-24(s0)
     b98:	6398                	ld	a4,0(a5)
     b9a:	fe043783          	ld	a5,-32(s0)
     b9e:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     ba0:	fe843783          	ld	a5,-24(s0)
     ba4:	479c                	lw	a5,8(a5)
     ba6:	1782                	slli	a5,a5,0x20
     ba8:	9381                	srli	a5,a5,0x20
     baa:	0792                	slli	a5,a5,0x4
     bac:	fe843703          	ld	a4,-24(s0)
     bb0:	97ba                	add	a5,a5,a4
     bb2:	fe043703          	ld	a4,-32(s0)
     bb6:	02f71563          	bne	a4,a5,be0 <free+0x102>
    p->s.size += bp->s.size;
     bba:	fe843783          	ld	a5,-24(s0)
     bbe:	4798                	lw	a4,8(a5)
     bc0:	fe043783          	ld	a5,-32(s0)
     bc4:	479c                	lw	a5,8(a5)
     bc6:	9fb9                	addw	a5,a5,a4
     bc8:	0007871b          	sext.w	a4,a5
     bcc:	fe843783          	ld	a5,-24(s0)
     bd0:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     bd2:	fe043783          	ld	a5,-32(s0)
     bd6:	6398                	ld	a4,0(a5)
     bd8:	fe843783          	ld	a5,-24(s0)
     bdc:	e398                	sd	a4,0(a5)
     bde:	a031                	j	bea <free+0x10c>
  } else
    p->s.ptr = bp;
     be0:	fe843783          	ld	a5,-24(s0)
     be4:	fe043703          	ld	a4,-32(s0)
     be8:	e398                	sd	a4,0(a5)
  freep = p;
     bea:	00001797          	auipc	a5,0x1
     bee:	75678793          	addi	a5,a5,1878 # 2340 <freep>
     bf2:	fe843703          	ld	a4,-24(s0)
     bf6:	e398                	sd	a4,0(a5)
}
     bf8:	0001                	nop
     bfa:	7422                	ld	s0,40(sp)
     bfc:	6145                	addi	sp,sp,48
     bfe:	8082                	ret

0000000000000c00 <morecore>:

static Header*
morecore(uint nu)
{
     c00:	7179                	addi	sp,sp,-48
     c02:	f406                	sd	ra,40(sp)
     c04:	f022                	sd	s0,32(sp)
     c06:	1800                	addi	s0,sp,48
     c08:	87aa                	mv	a5,a0
     c0a:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c0e:	fdc42783          	lw	a5,-36(s0)
     c12:	0007871b          	sext.w	a4,a5
     c16:	6785                	lui	a5,0x1
     c18:	00f77563          	bgeu	a4,a5,c22 <morecore+0x22>
    nu = 4096;
     c1c:	6785                	lui	a5,0x1
     c1e:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c22:	fdc42783          	lw	a5,-36(s0)
     c26:	0047979b          	slliw	a5,a5,0x4
     c2a:	2781                	sext.w	a5,a5
     c2c:	2781                	sext.w	a5,a5
     c2e:	853e                	mv	a0,a5
     c30:	00000097          	auipc	ra,0x0
     c34:	9a0080e7          	jalr	-1632(ra) # 5d0 <sbrk>
     c38:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c3c:	fe843703          	ld	a4,-24(s0)
     c40:	57fd                	li	a5,-1
     c42:	00f71463          	bne	a4,a5,c4a <morecore+0x4a>
    return 0;
     c46:	4781                	li	a5,0
     c48:	a03d                	j	c76 <morecore+0x76>
  hp = (Header*)p;
     c4a:	fe843783          	ld	a5,-24(s0)
     c4e:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c52:	fe043783          	ld	a5,-32(s0)
     c56:	fdc42703          	lw	a4,-36(s0)
     c5a:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c5c:	fe043783          	ld	a5,-32(s0)
     c60:	07c1                	addi	a5,a5,16
     c62:	853e                	mv	a0,a5
     c64:	00000097          	auipc	ra,0x0
     c68:	e7a080e7          	jalr	-390(ra) # ade <free>
  return freep;
     c6c:	00001797          	auipc	a5,0x1
     c70:	6d478793          	addi	a5,a5,1748 # 2340 <freep>
     c74:	639c                	ld	a5,0(a5)
}
     c76:	853e                	mv	a0,a5
     c78:	70a2                	ld	ra,40(sp)
     c7a:	7402                	ld	s0,32(sp)
     c7c:	6145                	addi	sp,sp,48
     c7e:	8082                	ret

0000000000000c80 <malloc>:

void*
malloc(uint nbytes)
{
     c80:	7139                	addi	sp,sp,-64
     c82:	fc06                	sd	ra,56(sp)
     c84:	f822                	sd	s0,48(sp)
     c86:	0080                	addi	s0,sp,64
     c88:	87aa                	mv	a5,a0
     c8a:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c8e:	fcc46783          	lwu	a5,-52(s0)
     c92:	07bd                	addi	a5,a5,15
     c94:	8391                	srli	a5,a5,0x4
     c96:	2781                	sext.w	a5,a5
     c98:	2785                	addiw	a5,a5,1
     c9a:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c9e:	00001797          	auipc	a5,0x1
     ca2:	6a278793          	addi	a5,a5,1698 # 2340 <freep>
     ca6:	639c                	ld	a5,0(a5)
     ca8:	fef43023          	sd	a5,-32(s0)
     cac:	fe043783          	ld	a5,-32(s0)
     cb0:	ef95                	bnez	a5,cec <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     cb2:	00001797          	auipc	a5,0x1
     cb6:	67e78793          	addi	a5,a5,1662 # 2330 <base>
     cba:	fef43023          	sd	a5,-32(s0)
     cbe:	00001797          	auipc	a5,0x1
     cc2:	68278793          	addi	a5,a5,1666 # 2340 <freep>
     cc6:	fe043703          	ld	a4,-32(s0)
     cca:	e398                	sd	a4,0(a5)
     ccc:	00001797          	auipc	a5,0x1
     cd0:	67478793          	addi	a5,a5,1652 # 2340 <freep>
     cd4:	6398                	ld	a4,0(a5)
     cd6:	00001797          	auipc	a5,0x1
     cda:	65a78793          	addi	a5,a5,1626 # 2330 <base>
     cde:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     ce0:	00001797          	auipc	a5,0x1
     ce4:	65078793          	addi	a5,a5,1616 # 2330 <base>
     ce8:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     cec:	fe043783          	ld	a5,-32(s0)
     cf0:	639c                	ld	a5,0(a5)
     cf2:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     cf6:	fe843783          	ld	a5,-24(s0)
     cfa:	4798                	lw	a4,8(a5)
     cfc:	fdc42783          	lw	a5,-36(s0)
     d00:	2781                	sext.w	a5,a5
     d02:	06f76863          	bltu	a4,a5,d72 <malloc+0xf2>
      if(p->s.size == nunits)
     d06:	fe843783          	ld	a5,-24(s0)
     d0a:	4798                	lw	a4,8(a5)
     d0c:	fdc42783          	lw	a5,-36(s0)
     d10:	2781                	sext.w	a5,a5
     d12:	00e79963          	bne	a5,a4,d24 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d16:	fe843783          	ld	a5,-24(s0)
     d1a:	6398                	ld	a4,0(a5)
     d1c:	fe043783          	ld	a5,-32(s0)
     d20:	e398                	sd	a4,0(a5)
     d22:	a82d                	j	d5c <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d24:	fe843783          	ld	a5,-24(s0)
     d28:	4798                	lw	a4,8(a5)
     d2a:	fdc42783          	lw	a5,-36(s0)
     d2e:	40f707bb          	subw	a5,a4,a5
     d32:	0007871b          	sext.w	a4,a5
     d36:	fe843783          	ld	a5,-24(s0)
     d3a:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d3c:	fe843783          	ld	a5,-24(s0)
     d40:	479c                	lw	a5,8(a5)
     d42:	1782                	slli	a5,a5,0x20
     d44:	9381                	srli	a5,a5,0x20
     d46:	0792                	slli	a5,a5,0x4
     d48:	fe843703          	ld	a4,-24(s0)
     d4c:	97ba                	add	a5,a5,a4
     d4e:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d52:	fe843783          	ld	a5,-24(s0)
     d56:	fdc42703          	lw	a4,-36(s0)
     d5a:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d5c:	00001797          	auipc	a5,0x1
     d60:	5e478793          	addi	a5,a5,1508 # 2340 <freep>
     d64:	fe043703          	ld	a4,-32(s0)
     d68:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d6a:	fe843783          	ld	a5,-24(s0)
     d6e:	07c1                	addi	a5,a5,16
     d70:	a091                	j	db4 <malloc+0x134>
    }
    if(p == freep)
     d72:	00001797          	auipc	a5,0x1
     d76:	5ce78793          	addi	a5,a5,1486 # 2340 <freep>
     d7a:	639c                	ld	a5,0(a5)
     d7c:	fe843703          	ld	a4,-24(s0)
     d80:	02f71063          	bne	a4,a5,da0 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d84:	fdc42783          	lw	a5,-36(s0)
     d88:	853e                	mv	a0,a5
     d8a:	00000097          	auipc	ra,0x0
     d8e:	e76080e7          	jalr	-394(ra) # c00 <morecore>
     d92:	fea43423          	sd	a0,-24(s0)
     d96:	fe843783          	ld	a5,-24(s0)
     d9a:	e399                	bnez	a5,da0 <malloc+0x120>
        return 0;
     d9c:	4781                	li	a5,0
     d9e:	a819                	j	db4 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     da0:	fe843783          	ld	a5,-24(s0)
     da4:	fef43023          	sd	a5,-32(s0)
     da8:	fe843783          	ld	a5,-24(s0)
     dac:	639c                	ld	a5,0(a5)
     dae:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     db2:	b791                	j	cf6 <malloc+0x76>
  }
}
     db4:	853e                	mv	a0,a5
     db6:	70e2                	ld	ra,56(sp)
     db8:	7442                	ld	s0,48(sp)
     dba:	6121                	addi	sp,sp,64
     dbc:	8082                	ret

0000000000000dbe <setjmp>:
     dbe:	e100                	sd	s0,0(a0)
     dc0:	e504                	sd	s1,8(a0)
     dc2:	01253823          	sd	s2,16(a0)
     dc6:	01353c23          	sd	s3,24(a0)
     dca:	03453023          	sd	s4,32(a0)
     dce:	03553423          	sd	s5,40(a0)
     dd2:	03653823          	sd	s6,48(a0)
     dd6:	03753c23          	sd	s7,56(a0)
     dda:	05853023          	sd	s8,64(a0)
     dde:	05953423          	sd	s9,72(a0)
     de2:	05a53823          	sd	s10,80(a0)
     de6:	05b53c23          	sd	s11,88(a0)
     dea:	06153023          	sd	ra,96(a0)
     dee:	06253423          	sd	sp,104(a0)
     df2:	4501                	li	a0,0
     df4:	8082                	ret

0000000000000df6 <longjmp>:
     df6:	6100                	ld	s0,0(a0)
     df8:	6504                	ld	s1,8(a0)
     dfa:	01053903          	ld	s2,16(a0)
     dfe:	01853983          	ld	s3,24(a0)
     e02:	02053a03          	ld	s4,32(a0)
     e06:	02853a83          	ld	s5,40(a0)
     e0a:	03053b03          	ld	s6,48(a0)
     e0e:	03853b83          	ld	s7,56(a0)
     e12:	04053c03          	ld	s8,64(a0)
     e16:	04853c83          	ld	s9,72(a0)
     e1a:	05053d03          	ld	s10,80(a0)
     e1e:	05853d83          	ld	s11,88(a0)
     e22:	06053083          	ld	ra,96(a0)
     e26:	06853103          	ld	sp,104(a0)
     e2a:	c199                	beqz	a1,e30 <longjmp_1>
     e2c:	852e                	mv	a0,a1
     e2e:	8082                	ret

0000000000000e30 <longjmp_1>:
     e30:	4505                	li	a0,1
     e32:	8082                	ret

0000000000000e34 <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     e34:	7179                	addi	sp,sp,-48
     e36:	f422                	sd	s0,40(sp)
     e38:	1800                	addi	s0,sp,48
     e3a:	fea43423          	sd	a0,-24(s0)
     e3e:	feb43023          	sd	a1,-32(s0)
     e42:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     e46:	fd843783          	ld	a5,-40(s0)
     e4a:	fe843703          	ld	a4,-24(s0)
     e4e:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     e50:	fe843783          	ld	a5,-24(s0)
     e54:	fd843703          	ld	a4,-40(s0)
     e58:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     e5a:	fe843783          	ld	a5,-24(s0)
     e5e:	fe043703          	ld	a4,-32(s0)
     e62:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     e64:	fe043783          	ld	a5,-32(s0)
     e68:	fe843703          	ld	a4,-24(s0)
     e6c:	e398                	sd	a4,0(a5)
 }
     e6e:	0001                	nop
     e70:	7422                	ld	s0,40(sp)
     e72:	6145                	addi	sp,sp,48
     e74:	8082                	ret

0000000000000e76 <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     e76:	1101                	addi	sp,sp,-32
     e78:	ec06                	sd	ra,24(sp)
     e7a:	e822                	sd	s0,16(sp)
     e7c:	1000                	addi	s0,sp,32
     e7e:	fea43423          	sd	a0,-24(s0)
     e82:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     e86:	fe043783          	ld	a5,-32(s0)
     e8a:	679c                	ld	a5,8(a5)
     e8c:	fe043603          	ld	a2,-32(s0)
     e90:	85be                	mv	a1,a5
     e92:	fe843503          	ld	a0,-24(s0)
     e96:	00000097          	auipc	ra,0x0
     e9a:	f9e080e7          	jalr	-98(ra) # e34 <__list_add>
 }
     e9e:	0001                	nop
     ea0:	60e2                	ld	ra,24(sp)
     ea2:	6442                	ld	s0,16(sp)
     ea4:	6105                	addi	sp,sp,32
     ea6:	8082                	ret

0000000000000ea8 <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     ea8:	1101                	addi	sp,sp,-32
     eaa:	ec22                	sd	s0,24(sp)
     eac:	1000                	addi	s0,sp,32
     eae:	fea43423          	sd	a0,-24(s0)
     eb2:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
     eb6:	fe043783          	ld	a5,-32(s0)
     eba:	fe843703          	ld	a4,-24(s0)
     ebe:	e798                	sd	a4,8(a5)
     prev->next = next;
     ec0:	fe843783          	ld	a5,-24(s0)
     ec4:	fe043703          	ld	a4,-32(s0)
     ec8:	e398                	sd	a4,0(a5)
 }
     eca:	0001                	nop
     ecc:	6462                	ld	s0,24(sp)
     ece:	6105                	addi	sp,sp,32
     ed0:	8082                	ret

0000000000000ed2 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     ed2:	1101                	addi	sp,sp,-32
     ed4:	ec06                	sd	ra,24(sp)
     ed6:	e822                	sd	s0,16(sp)
     ed8:	1000                	addi	s0,sp,32
     eda:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
     ede:	fe843783          	ld	a5,-24(s0)
     ee2:	6798                	ld	a4,8(a5)
     ee4:	fe843783          	ld	a5,-24(s0)
     ee8:	639c                	ld	a5,0(a5)
     eea:	85be                	mv	a1,a5
     eec:	853a                	mv	a0,a4
     eee:	00000097          	auipc	ra,0x0
     ef2:	fba080e7          	jalr	-70(ra) # ea8 <__list_del>
     entry->next = LIST_POISON1;
     ef6:	fe843783          	ld	a5,-24(s0)
     efa:	00100737          	lui	a4,0x100
     efe:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd618>
     f02:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
     f04:	fe843783          	ld	a5,-24(s0)
     f08:	00200737          	lui	a4,0x200
     f0c:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd718>
     f10:	e798                	sd	a4,8(a5)
 }
     f12:	0001                	nop
     f14:	60e2                	ld	ra,24(sp)
     f16:	6442                	ld	s0,16(sp)
     f18:	6105                	addi	sp,sp,32
     f1a:	8082                	ret

0000000000000f1c <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
     f1c:	1101                	addi	sp,sp,-32
     f1e:	ec22                	sd	s0,24(sp)
     f20:	1000                	addi	s0,sp,32
     f22:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
     f26:	fe843783          	ld	a5,-24(s0)
     f2a:	639c                	ld	a5,0(a5)
     f2c:	fe843703          	ld	a4,-24(s0)
     f30:	40f707b3          	sub	a5,a4,a5
     f34:	0017b793          	seqz	a5,a5
     f38:	0ff7f793          	andi	a5,a5,255
     f3c:	2781                	sext.w	a5,a5
 }
     f3e:	853e                	mv	a0,a5
     f40:	6462                	ld	s0,24(sp)
     f42:	6105                	addi	sp,sp,32
     f44:	8082                	ret

0000000000000f46 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     f46:	715d                	addi	sp,sp,-80
     f48:	e486                	sd	ra,72(sp)
     f4a:	e0a2                	sd	s0,64(sp)
     f4c:	0880                	addi	s0,sp,80
     f4e:	fca43423          	sd	a0,-56(s0)
     f52:	fcb43023          	sd	a1,-64(s0)
     f56:	85b2                	mv	a1,a2
     f58:	8636                	mv	a2,a3
     f5a:	86ba                	mv	a3,a4
     f5c:	873e                	mv	a4,a5
     f5e:	87ae                	mv	a5,a1
     f60:	faf42e23          	sw	a5,-68(s0)
     f64:	87b2                	mv	a5,a2
     f66:	faf42c23          	sw	a5,-72(s0)
     f6a:	87b6                	mv	a5,a3
     f6c:	faf42a23          	sw	a5,-76(s0)
     f70:	87ba                	mv	a5,a4
     f72:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     f76:	08000513          	li	a0,128
     f7a:	00000097          	auipc	ra,0x0
     f7e:	d06080e7          	jalr	-762(ra) # c80 <malloc>
     f82:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     f86:	6505                	lui	a0,0x1
     f88:	00000097          	auipc	ra,0x0
     f8c:	cf8080e7          	jalr	-776(ra) # c80 <malloc>
     f90:	87aa                	mv	a5,a0
     f92:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     f96:	fe043703          	ld	a4,-32(s0)
     f9a:	6785                	lui	a5,0x1
     f9c:	17c1                	addi	a5,a5,-16
     f9e:	97ba                	add	a5,a5,a4
     fa0:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     fa4:	fe843783          	ld	a5,-24(s0)
     fa8:	fc843703          	ld	a4,-56(s0)
     fac:	e398                	sd	a4,0(a5)
    t->arg = arg;
     fae:	fe843783          	ld	a5,-24(s0)
     fb2:	fc043703          	ld	a4,-64(s0)
     fb6:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     fb8:	00001797          	auipc	a5,0x1
     fbc:	36c78793          	addi	a5,a5,876 # 2324 <_id.1241>
     fc0:	439c                	lw	a5,0(a5)
     fc2:	0017871b          	addiw	a4,a5,1
     fc6:	0007069b          	sext.w	a3,a4
     fca:	00001717          	auipc	a4,0x1
     fce:	35a70713          	addi	a4,a4,858 # 2324 <_id.1241>
     fd2:	c314                	sw	a3,0(a4)
     fd4:	fe843703          	ld	a4,-24(s0)
     fd8:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
     fda:	fe843783          	ld	a5,-24(s0)
     fde:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
     fe2:	fe043703          	ld	a4,-32(s0)
     fe6:	fe843783          	ld	a5,-24(s0)
     fea:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
     fec:	fd843703          	ld	a4,-40(s0)
     ff0:	fe843783          	ld	a5,-24(s0)
     ff4:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
     ff6:	fe843783          	ld	a5,-24(s0)
     ffa:	fb842703          	lw	a4,-72(s0)
     ffe:	c3f8                	sw	a4,68(a5)
    t->period = period;
    1000:	fe843783          	ld	a5,-24(s0)
    1004:	fb442703          	lw	a4,-76(s0)
    1008:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
    100a:	fe843783          	ld	a5,-24(s0)
    100e:	fb442703          	lw	a4,-76(s0)
    1012:	c7b8                	sw	a4,72(a5)
    t->n = n;
    1014:	fe843783          	ld	a5,-24(s0)
    1018:	fb042703          	lw	a4,-80(s0)
    101c:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    101e:	fe843783          	ld	a5,-24(s0)
    1022:	fbc42703          	lw	a4,-68(s0)
    1026:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    1028:	fe843783          	ld	a5,-24(s0)
    102c:	fb842703          	lw	a4,-72(s0)
    1030:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    1032:	fe843783          	ld	a5,-24(s0)
    1036:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    103a:	fe843783          	ld	a5,-24(s0)
    103e:	06400713          	li	a4,100
    1042:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    1044:	fe843783          	ld	a5,-24(s0)
    1048:	671d                	lui	a4,0x7
    104a:	5307071b          	addiw	a4,a4,1328
    104e:	d3b8                	sw	a4,96(a5)
    
    return t;
    1050:	fe843783          	ld	a5,-24(s0)
}
    1054:	853e                	mv	a0,a5
    1056:	60a6                	ld	ra,72(sp)
    1058:	6406                	ld	s0,64(sp)
    105a:	6161                	addi	sp,sp,80
    105c:	8082                	ret

000000000000105e <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    105e:	1101                	addi	sp,sp,-32
    1060:	ec22                	sd	s0,24(sp)
    1062:	1000                	addi	s0,sp,32
    1064:	fea43423          	sd	a0,-24(s0)
    1068:	87ae                	mv	a5,a1
    106a:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    106e:	fe843783          	ld	a5,-24(s0)
    1072:	fe442703          	lw	a4,-28(s0)
    1076:	cff8                	sw	a4,92(a5)
}
    1078:	0001                	nop
    107a:	6462                	ld	s0,24(sp)
    107c:	6105                	addi	sp,sp,32
    107e:	8082                	ret

0000000000001080 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    1080:	1101                	addi	sp,sp,-32
    1082:	ec22                	sd	s0,24(sp)
    1084:	1000                	addi	s0,sp,32
    1086:	fea43423          	sd	a0,-24(s0)
    108a:	87ae                	mv	a5,a1
    108c:	8732                	mv	a4,a2
    108e:	fef42223          	sw	a5,-28(s0)
    1092:	87ba                	mv	a5,a4
    1094:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    1098:	fe843783          	ld	a5,-24(s0)
    109c:	fe442703          	lw	a4,-28(s0)
    10a0:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    10a2:	fe843783          	ld	a5,-24(s0)
    10a6:	fe442703          	lw	a4,-28(s0)
    10aa:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    10ac:	fe843783          	ld	a5,-24(s0)
    10b0:	fe042703          	lw	a4,-32(s0)
    10b4:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    10b6:	fe843783          	ld	a5,-24(s0)
    10ba:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    10be:	fe843783          	ld	a5,-24(s0)
    10c2:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    10c6:	fe843783          	ld	a5,-24(s0)
    10ca:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    10ce:	fe843783          	ld	a5,-24(s0)
    10d2:	0607ae23          	sw	zero,124(a5)
}
    10d6:	0001                	nop
    10d8:	6462                	ld	s0,24(sp)
    10da:	6105                	addi	sp,sp,32
    10dc:	8082                	ret

00000000000010de <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    10de:	7179                	addi	sp,sp,-48
    10e0:	f406                	sd	ra,40(sp)
    10e2:	f022                	sd	s0,32(sp)
    10e4:	1800                	addi	s0,sp,48
    10e6:	fca43c23          	sd	a0,-40(s0)
    10ea:	87ae                	mv	a5,a1
    10ec:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    10f0:	02000513          	li	a0,32
    10f4:	00000097          	auipc	ra,0x0
    10f8:	b8c080e7          	jalr	-1140(ra) # c80 <malloc>
    10fc:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    1100:	fe843783          	ld	a5,-24(s0)
    1104:	fd843703          	ld	a4,-40(s0)
    1108:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    110a:	fe843783          	ld	a5,-24(s0)
    110e:	fd442703          	lw	a4,-44(s0)
    1112:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    1114:	fd843783          	ld	a5,-40(s0)
    1118:	fd442703          	lw	a4,-44(s0)
    111c:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    111e:	fd843783          	ld	a5,-40(s0)
    1122:	43bc                	lw	a5,64(a5)
    1124:	cf81                	beqz	a5,113c <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    1126:	fd843783          	ld	a5,-40(s0)
    112a:	47bc                	lw	a5,72(a5)
    112c:	fd442703          	lw	a4,-44(s0)
    1130:	9fb9                	addw	a5,a5,a4
    1132:	0007871b          	sext.w	a4,a5
    1136:	fd843783          	ld	a5,-40(s0)
    113a:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    113c:	fe843783          	ld	a5,-24(s0)
    1140:	07a1                	addi	a5,a5,8
    1142:	00001597          	auipc	a1,0x1
    1146:	1ce58593          	addi	a1,a1,462 # 2310 <release_queue>
    114a:	853e                	mv	a0,a5
    114c:	00000097          	auipc	ra,0x0
    1150:	d2a080e7          	jalr	-726(ra) # e76 <list_add_tail>
}
    1154:	0001                	nop
    1156:	70a2                	ld	ra,40(sp)
    1158:	7402                	ld	s0,32(sp)
    115a:	6145                	addi	sp,sp,48
    115c:	8082                	ret

000000000000115e <__release>:

void __release()
{
    115e:	7139                	addi	sp,sp,-64
    1160:	fc06                	sd	ra,56(sp)
    1162:	f822                	sd	s0,48(sp)
    1164:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1166:	00001797          	auipc	a5,0x1
    116a:	1aa78793          	addi	a5,a5,426 # 2310 <release_queue>
    116e:	639c                	ld	a5,0(a5)
    1170:	fcf43c23          	sd	a5,-40(s0)
    1174:	fd843783          	ld	a5,-40(s0)
    1178:	17e1                	addi	a5,a5,-8
    117a:	fef43423          	sd	a5,-24(s0)
    117e:	fe843783          	ld	a5,-24(s0)
    1182:	679c                	ld	a5,8(a5)
    1184:	fcf43823          	sd	a5,-48(s0)
    1188:	fd043783          	ld	a5,-48(s0)
    118c:	17e1                	addi	a5,a5,-8
    118e:	fef43023          	sd	a5,-32(s0)
    1192:	a0e9                	j	125c <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    1194:	fe843783          	ld	a5,-24(s0)
    1198:	4f98                	lw	a4,24(a5)
    119a:	00001797          	auipc	a5,0x1
    119e:	1b678793          	addi	a5,a5,438 # 2350 <threading_system_time>
    11a2:	439c                	lw	a5,0(a5)
    11a4:	08e7ce63          	blt	a5,a4,1240 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    11a8:	fe843783          	ld	a5,-24(s0)
    11ac:	639c                	ld	a5,0(a5)
    11ae:	5bbc                	lw	a5,112(a5)
    11b0:	c79d                	beqz	a5,11de <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    11b2:	fe843783          	ld	a5,-24(s0)
    11b6:	639c                	ld	a5,0(a5)
    11b8:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    11bc:	fe843783          	ld	a5,-24(s0)
    11c0:	6398                	ld	a4,0(a5)
    11c2:	fe843783          	ld	a5,-24(s0)
    11c6:	639c                	ld	a5,0(a5)
    11c8:	5378                	lw	a4,100(a4)
    11ca:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    11cc:	fe843783          	ld	a5,-24(s0)
    11d0:	6398                	ld	a4,0(a5)
    11d2:	fe843783          	ld	a5,-24(s0)
    11d6:	639c                	ld	a5,0(a5)
    11d8:	5f78                	lw	a4,124(a4)
    11da:	cbf8                	sw	a4,84(a5)
    11dc:	a809                	j	11ee <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    11de:	fe843783          	ld	a5,-24(s0)
    11e2:	6398                	ld	a4,0(a5)
    11e4:	fe843783          	ld	a5,-24(s0)
    11e8:	639c                	ld	a5,0(a5)
    11ea:	4378                	lw	a4,68(a4)
    11ec:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    11ee:	fe843783          	ld	a5,-24(s0)
    11f2:	4f94                	lw	a3,24(a5)
    11f4:	fe843783          	ld	a5,-24(s0)
    11f8:	639c                	ld	a5,0(a5)
    11fa:	47b8                	lw	a4,72(a5)
    11fc:	fe843783          	ld	a5,-24(s0)
    1200:	639c                	ld	a5,0(a5)
    1202:	9f35                	addw	a4,a4,a3
    1204:	2701                	sext.w	a4,a4
    1206:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    1208:	fe843783          	ld	a5,-24(s0)
    120c:	639c                	ld	a5,0(a5)
    120e:	02878793          	addi	a5,a5,40
    1212:	00001597          	auipc	a1,0x1
    1216:	0ee58593          	addi	a1,a1,238 # 2300 <run_queue>
    121a:	853e                	mv	a0,a5
    121c:	00000097          	auipc	ra,0x0
    1220:	c5a080e7          	jalr	-934(ra) # e76 <list_add_tail>
            list_del(&cur->thread_list);
    1224:	fe843783          	ld	a5,-24(s0)
    1228:	07a1                	addi	a5,a5,8
    122a:	853e                	mv	a0,a5
    122c:	00000097          	auipc	ra,0x0
    1230:	ca6080e7          	jalr	-858(ra) # ed2 <list_del>
            free(cur);
    1234:	fe843503          	ld	a0,-24(s0)
    1238:	00000097          	auipc	ra,0x0
    123c:	8a6080e7          	jalr	-1882(ra) # ade <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1240:	fe043783          	ld	a5,-32(s0)
    1244:	fef43423          	sd	a5,-24(s0)
    1248:	fe043783          	ld	a5,-32(s0)
    124c:	679c                	ld	a5,8(a5)
    124e:	fcf43423          	sd	a5,-56(s0)
    1252:	fc843783          	ld	a5,-56(s0)
    1256:	17e1                	addi	a5,a5,-8
    1258:	fef43023          	sd	a5,-32(s0)
    125c:	fe843783          	ld	a5,-24(s0)
    1260:	00878713          	addi	a4,a5,8
    1264:	00001797          	auipc	a5,0x1
    1268:	0ac78793          	addi	a5,a5,172 # 2310 <release_queue>
    126c:	f2f714e3          	bne	a4,a5,1194 <__release+0x36>
        }
    }
}
    1270:	0001                	nop
    1272:	0001                	nop
    1274:	70e2                	ld	ra,56(sp)
    1276:	7442                	ld	s0,48(sp)
    1278:	6121                	addi	sp,sp,64
    127a:	8082                	ret

000000000000127c <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    127c:	1101                	addi	sp,sp,-32
    127e:	ec06                	sd	ra,24(sp)
    1280:	e822                	sd	s0,16(sp)
    1282:	1000                	addi	s0,sp,32
    1284:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    1288:	fe843783          	ld	a5,-24(s0)
    128c:	7b98                	ld	a4,48(a5)
    128e:	00001797          	auipc	a5,0x1
    1292:	0ba78793          	addi	a5,a5,186 # 2348 <current>
    1296:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    1298:	fe843783          	ld	a5,-24(s0)
    129c:	02878793          	addi	a5,a5,40
    12a0:	853e                	mv	a0,a5
    12a2:	00000097          	auipc	ra,0x0
    12a6:	c30080e7          	jalr	-976(ra) # ed2 <list_del>

    free(to_remove->stack);
    12aa:	fe843783          	ld	a5,-24(s0)
    12ae:	6b9c                	ld	a5,16(a5)
    12b0:	853e                	mv	a0,a5
    12b2:	00000097          	auipc	ra,0x0
    12b6:	82c080e7          	jalr	-2004(ra) # ade <free>
    free(to_remove);
    12ba:	fe843503          	ld	a0,-24(s0)
    12be:	00000097          	auipc	ra,0x0
    12c2:	820080e7          	jalr	-2016(ra) # ade <free>

    __schedule();
    12c6:	00000097          	auipc	ra,0x0
    12ca:	5e8080e7          	jalr	1512(ra) # 18ae <__schedule>
    __dispatch();
    12ce:	00000097          	auipc	ra,0x0
    12d2:	416080e7          	jalr	1046(ra) # 16e4 <__dispatch>
    thrdresume(main_thrd_id);
    12d6:	00001797          	auipc	a5,0x1
    12da:	04a78793          	addi	a5,a5,74 # 2320 <main_thrd_id>
    12de:	439c                	lw	a5,0(a5)
    12e0:	853e                	mv	a0,a5
    12e2:	fffff097          	auipc	ra,0xfffff
    12e6:	30e080e7          	jalr	782(ra) # 5f0 <thrdresume>
}
    12ea:	0001                	nop
    12ec:	60e2                	ld	ra,24(sp)
    12ee:	6442                	ld	s0,16(sp)
    12f0:	6105                	addi	sp,sp,32
    12f2:	8082                	ret

00000000000012f4 <thread_exit>:

void thread_exit(void)
{
    12f4:	7179                	addi	sp,sp,-48
    12f6:	f406                	sd	ra,40(sp)
    12f8:	f022                	sd	s0,32(sp)
    12fa:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    12fc:	00001797          	auipc	a5,0x1
    1300:	04c78793          	addi	a5,a5,76 # 2348 <current>
    1304:	6398                	ld	a4,0(a5)
    1306:	00001797          	auipc	a5,0x1
    130a:	ffa78793          	addi	a5,a5,-6 # 2300 <run_queue>
    130e:	02f71063          	bne	a4,a5,132e <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    1312:	00001597          	auipc	a1,0x1
    1316:	d5e58593          	addi	a1,a1,-674 # 2070 <schedule_edf_cbs+0x4ec>
    131a:	4509                	li	a0,2
    131c:	fffff097          	auipc	ra,0xfffff
    1320:	71a080e7          	jalr	1818(ra) # a36 <fprintf>
        exit(1);
    1324:	4505                	li	a0,1
    1326:	fffff097          	auipc	ra,0xfffff
    132a:	222080e7          	jalr	546(ra) # 548 <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    132e:	00001797          	auipc	a5,0x1
    1332:	01a78793          	addi	a5,a5,26 # 2348 <current>
    1336:	639c                	ld	a5,0(a5)
    1338:	fef43423          	sd	a5,-24(s0)
    133c:	fe843783          	ld	a5,-24(s0)
    1340:	fd878793          	addi	a5,a5,-40
    1344:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    1348:	fe043783          	ld	a5,-32(s0)
    134c:	5f9c                	lw	a5,56(a5)
    134e:	4585                	li	a1,1
    1350:	853e                	mv	a0,a5
    1352:	fffff097          	auipc	ra,0xfffff
    1356:	2a6080e7          	jalr	678(ra) # 5f8 <cancelthrdstop>
    135a:	87aa                	mv	a5,a0
    135c:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    1360:	00001797          	auipc	a5,0x1
    1364:	ff078793          	addi	a5,a5,-16 # 2350 <threading_system_time>
    1368:	439c                	lw	a5,0(a5)
    136a:	fdc42703          	lw	a4,-36(s0)
    136e:	9fb9                	addw	a5,a5,a4
    1370:	0007871b          	sext.w	a4,a5
    1374:	00001797          	auipc	a5,0x1
    1378:	fdc78793          	addi	a5,a5,-36 # 2350 <threading_system_time>
    137c:	c398                	sw	a4,0(a5)

    __release();
    137e:	00000097          	auipc	ra,0x0
    1382:	de0080e7          	jalr	-544(ra) # 115e <__release>
    __thread_exit(to_remove);
    1386:	fe043503          	ld	a0,-32(s0)
    138a:	00000097          	auipc	ra,0x0
    138e:	ef2080e7          	jalr	-270(ra) # 127c <__thread_exit>
}
    1392:	0001                	nop
    1394:	70a2                	ld	ra,40(sp)
    1396:	7402                	ld	s0,32(sp)
    1398:	6145                	addi	sp,sp,48
    139a:	8082                	ret

000000000000139c <__finish_current>:

void __finish_current()
{
    139c:	7179                	addi	sp,sp,-48
    139e:	f406                	sd	ra,40(sp)
    13a0:	f022                	sd	s0,32(sp)
    13a2:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    13a4:	00001797          	auipc	a5,0x1
    13a8:	fa478793          	addi	a5,a5,-92 # 2348 <current>
    13ac:	639c                	ld	a5,0(a5)
    13ae:	fef43423          	sd	a5,-24(s0)
    13b2:	fe843783          	ld	a5,-24(s0)
    13b6:	fd878793          	addi	a5,a5,-40
    13ba:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    13be:	fe043783          	ld	a5,-32(s0)
    13c2:	4bbc                	lw	a5,80(a5)
    13c4:	37fd                	addiw	a5,a5,-1
    13c6:	0007871b          	sext.w	a4,a5
    13ca:	fe043783          	ld	a5,-32(s0)
    13ce:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    13d0:	fe043783          	ld	a5,-32(s0)
    13d4:	5fd8                	lw	a4,60(a5)
    13d6:	00001797          	auipc	a5,0x1
    13da:	f7a78793          	addi	a5,a5,-134 # 2350 <threading_system_time>
    13de:	4390                	lw	a2,0(a5)
    13e0:	fe043783          	ld	a5,-32(s0)
    13e4:	4bbc                	lw	a5,80(a5)
    13e6:	86be                	mv	a3,a5
    13e8:	85ba                	mv	a1,a4
    13ea:	00001517          	auipc	a0,0x1
    13ee:	cbe50513          	addi	a0,a0,-834 # 20a8 <schedule_edf_cbs+0x524>
    13f2:	fffff097          	auipc	ra,0xfffff
    13f6:	69c080e7          	jalr	1692(ra) # a8e <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    13fa:	fe043783          	ld	a5,-32(s0)
    13fe:	4bbc                	lw	a5,80(a5)
    1400:	04f05563          	blez	a5,144a <__finish_current+0xae>
        struct list_head *to_remove = current;
    1404:	00001797          	auipc	a5,0x1
    1408:	f4478793          	addi	a5,a5,-188 # 2348 <current>
    140c:	639c                	ld	a5,0(a5)
    140e:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1412:	00001797          	auipc	a5,0x1
    1416:	f3678793          	addi	a5,a5,-202 # 2348 <current>
    141a:	639c                	ld	a5,0(a5)
    141c:	6798                	ld	a4,8(a5)
    141e:	00001797          	auipc	a5,0x1
    1422:	f2a78793          	addi	a5,a5,-214 # 2348 <current>
    1426:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1428:	fd843503          	ld	a0,-40(s0)
    142c:	00000097          	auipc	ra,0x0
    1430:	aa6080e7          	jalr	-1370(ra) # ed2 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    1434:	fe043783          	ld	a5,-32(s0)
    1438:	4fbc                	lw	a5,88(a5)
    143a:	85be                	mv	a1,a5
    143c:	fe043503          	ld	a0,-32(s0)
    1440:	00000097          	auipc	ra,0x0
    1444:	c9e080e7          	jalr	-866(ra) # 10de <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    1448:	a039                	j	1456 <__finish_current+0xba>
        __thread_exit(current_thread);
    144a:	fe043503          	ld	a0,-32(s0)
    144e:	00000097          	auipc	ra,0x0
    1452:	e2e080e7          	jalr	-466(ra) # 127c <__thread_exit>
}
    1456:	0001                	nop
    1458:	70a2                	ld	ra,40(sp)
    145a:	7402                	ld	s0,32(sp)
    145c:	6145                	addi	sp,sp,48
    145e:	8082                	ret

0000000000001460 <__rt_finish_current>:
void __rt_finish_current()
{
    1460:	7179                	addi	sp,sp,-48
    1462:	f406                	sd	ra,40(sp)
    1464:	f022                	sd	s0,32(sp)
    1466:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1468:	00001797          	auipc	a5,0x1
    146c:	ee078793          	addi	a5,a5,-288 # 2348 <current>
    1470:	639c                	ld	a5,0(a5)
    1472:	fef43423          	sd	a5,-24(s0)
    1476:	fe843783          	ld	a5,-24(s0)
    147a:	fd878793          	addi	a5,a5,-40
    147e:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1482:	fe043783          	ld	a5,-32(s0)
    1486:	4bbc                	lw	a5,80(a5)
    1488:	37fd                	addiw	a5,a5,-1
    148a:	0007871b          	sext.w	a4,a5
    148e:	fe043783          	ld	a5,-32(s0)
    1492:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    1494:	fe043783          	ld	a5,-32(s0)
    1498:	5fd8                	lw	a4,60(a5)
    149a:	00001797          	auipc	a5,0x1
    149e:	eb678793          	addi	a5,a5,-330 # 2350 <threading_system_time>
    14a2:	4390                	lw	a2,0(a5)
    14a4:	fe043783          	ld	a5,-32(s0)
    14a8:	4bbc                	lw	a5,80(a5)
    14aa:	86be                	mv	a3,a5
    14ac:	85ba                	mv	a1,a4
    14ae:	00001517          	auipc	a0,0x1
    14b2:	c1250513          	addi	a0,a0,-1006 # 20c0 <schedule_edf_cbs+0x53c>
    14b6:	fffff097          	auipc	ra,0xfffff
    14ba:	5d8080e7          	jalr	1496(ra) # a8e <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    14be:	fe043783          	ld	a5,-32(s0)
    14c2:	4bbc                	lw	a5,80(a5)
    14c4:	04f05f63          	blez	a5,1522 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    14c8:	00001797          	auipc	a5,0x1
    14cc:	e8078793          	addi	a5,a5,-384 # 2348 <current>
    14d0:	639c                	ld	a5,0(a5)
    14d2:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    14d6:	00001797          	auipc	a5,0x1
    14da:	e7278793          	addi	a5,a5,-398 # 2348 <current>
    14de:	639c                	ld	a5,0(a5)
    14e0:	6798                	ld	a4,8(a5)
    14e2:	00001797          	auipc	a5,0x1
    14e6:	e6678793          	addi	a5,a5,-410 # 2348 <current>
    14ea:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    14ec:	fd843503          	ld	a0,-40(s0)
    14f0:	00000097          	auipc	ra,0x0
    14f4:	9e2080e7          	jalr	-1566(ra) # ed2 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    14f8:	fe043783          	ld	a5,-32(s0)
    14fc:	4fbc                	lw	a5,88(a5)
    14fe:	85be                	mv	a1,a5
    1500:	fe043503          	ld	a0,-32(s0)
    1504:	00000097          	auipc	ra,0x0
    1508:	bda080e7          	jalr	-1062(ra) # 10de <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    150c:	fe043783          	ld	a5,-32(s0)
    1510:	57fc                	lw	a5,108(a5)
    1512:	ef91                	bnez	a5,152e <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    1514:	fe043783          	ld	a5,-32(s0)
    1518:	53f8                	lw	a4,100(a5)
    151a:	fe043783          	ld	a5,-32(s0)
    151e:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    1520:	a039                	j	152e <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    1522:	fe043503          	ld	a0,-32(s0)
    1526:	00000097          	auipc	ra,0x0
    152a:	d56080e7          	jalr	-682(ra) # 127c <__thread_exit>
}
    152e:	0001                	nop
    1530:	70a2                	ld	ra,40(sp)
    1532:	7402                	ld	s0,32(sp)
    1534:	6145                	addi	sp,sp,48
    1536:	8082                	ret

0000000000001538 <switch_handler>:

void switch_handler(void *arg)
{
    1538:	7139                	addi	sp,sp,-64
    153a:	fc06                	sd	ra,56(sp)
    153c:	f822                	sd	s0,48(sp)
    153e:	0080                	addi	s0,sp,64
    1540:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    1544:	fc843783          	ld	a5,-56(s0)
    1548:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    154c:	00001797          	auipc	a5,0x1
    1550:	dfc78793          	addi	a5,a5,-516 # 2348 <current>
    1554:	639c                	ld	a5,0(a5)
    1556:	fef43023          	sd	a5,-32(s0)
    155a:	fe043783          	ld	a5,-32(s0)
    155e:	fd878793          	addi	a5,a5,-40
    1562:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    1566:	fe843783          	ld	a5,-24(s0)
    156a:	0007871b          	sext.w	a4,a5
    156e:	00001797          	auipc	a5,0x1
    1572:	de278793          	addi	a5,a5,-542 # 2350 <threading_system_time>
    1576:	439c                	lw	a5,0(a5)
    1578:	2781                	sext.w	a5,a5
    157a:	9fb9                	addw	a5,a5,a4
    157c:	2781                	sext.w	a5,a5
    157e:	0007871b          	sext.w	a4,a5
    1582:	00001797          	auipc	a5,0x1
    1586:	dce78793          	addi	a5,a5,-562 # 2350 <threading_system_time>
    158a:	c398                	sw	a4,0(a5)
     __release();
    158c:	00000097          	auipc	ra,0x0
    1590:	bd2080e7          	jalr	-1070(ra) # 115e <__release>
    current_thread->remaining_time -= elapsed_time;
    1594:	fd843783          	ld	a5,-40(s0)
    1598:	4bfc                	lw	a5,84(a5)
    159a:	0007871b          	sext.w	a4,a5
    159e:	fe843783          	ld	a5,-24(s0)
    15a2:	2781                	sext.w	a5,a5
    15a4:	40f707bb          	subw	a5,a4,a5
    15a8:	2781                	sext.w	a5,a5
    15aa:	0007871b          	sext.w	a4,a5
    15ae:	fd843783          	ld	a5,-40(s0)
    15b2:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    15b4:	fd843783          	ld	a5,-40(s0)
    15b8:	57fc                	lw	a5,108(a5)
    15ba:	e38d                	bnez	a5,15dc <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    15bc:	fd843783          	ld	a5,-40(s0)
    15c0:	57bc                	lw	a5,104(a5)
    15c2:	0007871b          	sext.w	a4,a5
    15c6:	fe843783          	ld	a5,-24(s0)
    15ca:	2781                	sext.w	a5,a5
    15cc:	40f707bb          	subw	a5,a4,a5
    15d0:	2781                	sext.w	a5,a5
    15d2:	0007871b          	sext.w	a4,a5
    15d6:	fd843783          	ld	a5,-40(s0)
    15da:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    15dc:	fd843783          	ld	a5,-40(s0)
    15e0:	43bc                	lw	a5,64(a5)
    15e2:	c3ad                	beqz	a5,1644 <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    15e4:	fd843783          	ld	a5,-40(s0)
    15e8:	4fb8                	lw	a4,88(a5)
    15ea:	00001797          	auipc	a5,0x1
    15ee:	d6678793          	addi	a5,a5,-666 # 2350 <threading_system_time>
    15f2:	439c                	lw	a5,0(a5)
    15f4:	02f74163          	blt	a4,a5,1616 <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    15f8:	fd843783          	ld	a5,-40(s0)
    15fc:	4fb8                	lw	a4,88(a5)
    15fe:	00001797          	auipc	a5,0x1
    1602:	d5278793          	addi	a5,a5,-686 # 2350 <threading_system_time>
    1606:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    1608:	02f71e63          	bne	a4,a5,1644 <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    160c:	fd843783          	ld	a5,-40(s0)
    1610:	4bfc                	lw	a5,84(a5)
    1612:	02f05963          	blez	a5,1644 <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    1616:	fd843783          	ld	a5,-40(s0)
    161a:	5fd8                	lw	a4,60(a5)
    161c:	00001797          	auipc	a5,0x1
    1620:	d3478793          	addi	a5,a5,-716 # 2350 <threading_system_time>
    1624:	439c                	lw	a5,0(a5)
    1626:	863e                	mv	a2,a5
    1628:	85ba                	mv	a1,a4
    162a:	00001517          	auipc	a0,0x1
    162e:	ace50513          	addi	a0,a0,-1330 # 20f8 <schedule_edf_cbs+0x574>
    1632:	fffff097          	auipc	ra,0xfffff
    1636:	45c080e7          	jalr	1116(ra) # a8e <printf>
            exit(0);
    163a:	4501                	li	a0,0
    163c:	fffff097          	auipc	ra,0xfffff
    1640:	f0c080e7          	jalr	-244(ra) # 548 <exit>
        }

    if (current_thread->remaining_time <= 0) {
    1644:	fd843783          	ld	a5,-40(s0)
    1648:	4bfc                	lw	a5,84(a5)
    164a:	02f04063          	bgtz	a5,166a <switch_handler+0x132>
        if (current_thread->is_real_time)
    164e:	fd843783          	ld	a5,-40(s0)
    1652:	43bc                	lw	a5,64(a5)
    1654:	c791                	beqz	a5,1660 <switch_handler+0x128>
            __rt_finish_current();
    1656:	00000097          	auipc	ra,0x0
    165a:	e0a080e7          	jalr	-502(ra) # 1460 <__rt_finish_current>
    165e:	a881                	j	16ae <switch_handler+0x176>
        else
            __finish_current();
    1660:	00000097          	auipc	ra,0x0
    1664:	d3c080e7          	jalr	-708(ra) # 139c <__finish_current>
    1668:	a099                	j	16ae <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    166a:	00001797          	auipc	a5,0x1
    166e:	cde78793          	addi	a5,a5,-802 # 2348 <current>
    1672:	639c                	ld	a5,0(a5)
    1674:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    1678:	00001797          	auipc	a5,0x1
    167c:	cd078793          	addi	a5,a5,-816 # 2348 <current>
    1680:	639c                	ld	a5,0(a5)
    1682:	6798                	ld	a4,8(a5)
    1684:	00001797          	auipc	a5,0x1
    1688:	cc478793          	addi	a5,a5,-828 # 2348 <current>
    168c:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    168e:	fd043503          	ld	a0,-48(s0)
    1692:	00000097          	auipc	ra,0x0
    1696:	840080e7          	jalr	-1984(ra) # ed2 <list_del>
        list_add_tail(to_remove, &run_queue);
    169a:	00001597          	auipc	a1,0x1
    169e:	c6658593          	addi	a1,a1,-922 # 2300 <run_queue>
    16a2:	fd043503          	ld	a0,-48(s0)
    16a6:	fffff097          	auipc	ra,0xfffff
    16aa:	7d0080e7          	jalr	2000(ra) # e76 <list_add_tail>
    }

    __release();
    16ae:	00000097          	auipc	ra,0x0
    16b2:	ab0080e7          	jalr	-1360(ra) # 115e <__release>
    __schedule();
    16b6:	00000097          	auipc	ra,0x0
    16ba:	1f8080e7          	jalr	504(ra) # 18ae <__schedule>
    __dispatch();
    16be:	00000097          	auipc	ra,0x0
    16c2:	026080e7          	jalr	38(ra) # 16e4 <__dispatch>
    thrdresume(main_thrd_id);
    16c6:	00001797          	auipc	a5,0x1
    16ca:	c5a78793          	addi	a5,a5,-934 # 2320 <main_thrd_id>
    16ce:	439c                	lw	a5,0(a5)
    16d0:	853e                	mv	a0,a5
    16d2:	fffff097          	auipc	ra,0xfffff
    16d6:	f1e080e7          	jalr	-226(ra) # 5f0 <thrdresume>
}
    16da:	0001                	nop
    16dc:	70e2                	ld	ra,56(sp)
    16de:	7442                	ld	s0,48(sp)
    16e0:	6121                	addi	sp,sp,64
    16e2:	8082                	ret

00000000000016e4 <__dispatch>:

void __dispatch()
{
    16e4:	7179                	addi	sp,sp,-48
    16e6:	f406                	sd	ra,40(sp)
    16e8:	f022                	sd	s0,32(sp)
    16ea:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    16ec:	00001797          	auipc	a5,0x1
    16f0:	c5c78793          	addi	a5,a5,-932 # 2348 <current>
    16f4:	6398                	ld	a4,0(a5)
    16f6:	00001797          	auipc	a5,0x1
    16fa:	c0a78793          	addi	a5,a5,-1014 # 2300 <run_queue>
    16fe:	1af70363          	beq	a4,a5,18a4 <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1702:	00001797          	auipc	a5,0x1
    1706:	c4678793          	addi	a5,a5,-954 # 2348 <current>
    170a:	639c                	ld	a5,0(a5)
    170c:	fef43423          	sd	a5,-24(s0)
    1710:	fe843783          	ld	a5,-24(s0)
    1714:	fd878793          	addi	a5,a5,-40
    1718:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    171c:	fe043783          	ld	a5,-32(s0)
    1720:	5fcc                	lw	a1,60(a5)
    1722:	00001797          	auipc	a5,0x1
    1726:	c2e78793          	addi	a5,a5,-978 # 2350 <threading_system_time>
    172a:	4390                	lw	a2,0(a5)
    172c:	00001797          	auipc	a5,0x1
    1730:	c2c78793          	addi	a5,a5,-980 # 2358 <allocated_time>
    1734:	6394                	ld	a3,0(a5)
    1736:	fe043783          	ld	a5,-32(s0)
    173a:	4bfc                	lw	a5,84(a5)
    173c:	873e                	mv	a4,a5
    173e:	00001517          	auipc	a0,0x1
    1742:	9ea50513          	addi	a0,a0,-1558 # 2128 <schedule_edf_cbs+0x5a4>
    1746:	fffff097          	auipc	ra,0xfffff
    174a:	348080e7          	jalr	840(ra) # a8e <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    174e:	fe043783          	ld	a5,-32(s0)
    1752:	43bc                	lw	a5,64(a5)
    1754:	c3a1                	beqz	a5,1794 <__dispatch+0xb0>
    1756:	00001797          	auipc	a5,0x1
    175a:	c0278793          	addi	a5,a5,-1022 # 2358 <allocated_time>
    175e:	639c                	ld	a5,0(a5)
    1760:	eb95                	bnez	a5,1794 <__dispatch+0xb0>
    1762:	fe043783          	ld	a5,-32(s0)
    1766:	57fc                	lw	a5,108(a5)
    1768:	c795                	beqz	a5,1794 <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    176a:	fe043783          	ld	a5,-32(s0)
    176e:	5fd8                	lw	a4,60(a5)
    1770:	fe043783          	ld	a5,-32(s0)
    1774:	4fbc                	lw	a5,88(a5)
    1776:	863e                	mv	a2,a5
    1778:	85ba                	mv	a1,a4
    177a:	00001517          	auipc	a0,0x1
    177e:	9fe50513          	addi	a0,a0,-1538 # 2178 <schedule_edf_cbs+0x5f4>
    1782:	fffff097          	auipc	ra,0xfffff
    1786:	30c080e7          	jalr	780(ra) # a8e <printf>
        exit(0);
    178a:	4501                	li	a0,0
    178c:	fffff097          	auipc	ra,0xfffff
    1790:	dbc080e7          	jalr	-580(ra) # 548 <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    1794:	fe043783          	ld	a5,-32(s0)
    1798:	5fd8                	lw	a4,60(a5)
    179a:	00001797          	auipc	a5,0x1
    179e:	bb678793          	addi	a5,a5,-1098 # 2350 <threading_system_time>
    17a2:	4390                	lw	a2,0(a5)
    17a4:	00001797          	auipc	a5,0x1
    17a8:	bb478793          	addi	a5,a5,-1100 # 2358 <allocated_time>
    17ac:	639c                	ld	a5,0(a5)
    17ae:	86be                	mv	a3,a5
    17b0:	85ba                	mv	a1,a4
    17b2:	00001517          	auipc	a0,0x1
    17b6:	9f650513          	addi	a0,a0,-1546 # 21a8 <schedule_edf_cbs+0x624>
    17ba:	fffff097          	auipc	ra,0xfffff
    17be:	2d4080e7          	jalr	724(ra) # a8e <printf>

    if (current_thread->buf_set) {
    17c2:	fe043783          	ld	a5,-32(s0)
    17c6:	539c                	lw	a5,32(a5)
    17c8:	c7a1                	beqz	a5,1810 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    17ca:	00001797          	auipc	a5,0x1
    17ce:	b8e78793          	addi	a5,a5,-1138 # 2358 <allocated_time>
    17d2:	639c                	ld	a5,0(a5)
    17d4:	0007871b          	sext.w	a4,a5
    17d8:	fe043783          	ld	a5,-32(s0)
    17dc:	03878593          	addi	a1,a5,56
    17e0:	00001797          	auipc	a5,0x1
    17e4:	b7878793          	addi	a5,a5,-1160 # 2358 <allocated_time>
    17e8:	639c                	ld	a5,0(a5)
    17ea:	86be                	mv	a3,a5
    17ec:	00000617          	auipc	a2,0x0
    17f0:	d4c60613          	addi	a2,a2,-692 # 1538 <switch_handler>
    17f4:	853a                	mv	a0,a4
    17f6:	fffff097          	auipc	ra,0xfffff
    17fa:	df2080e7          	jalr	-526(ra) # 5e8 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    17fe:	fe043783          	ld	a5,-32(s0)
    1802:	5f9c                	lw	a5,56(a5)
    1804:	853e                	mv	a0,a5
    1806:	fffff097          	auipc	ra,0xfffff
    180a:	dea080e7          	jalr	-534(ra) # 5f0 <thrdresume>
    180e:	a071                	j	189a <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    1810:	fe043783          	ld	a5,-32(s0)
    1814:	4705                	li	a4,1
    1816:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    1818:	fe043783          	ld	a5,-32(s0)
    181c:	6f9c                	ld	a5,24(a5)
    181e:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1822:	fe043783          	ld	a5,-32(s0)
    1826:	577d                	li	a4,-1
    1828:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    182a:	00001797          	auipc	a5,0x1
    182e:	b2e78793          	addi	a5,a5,-1234 # 2358 <allocated_time>
    1832:	639c                	ld	a5,0(a5)
    1834:	0007871b          	sext.w	a4,a5
    1838:	fe043783          	ld	a5,-32(s0)
    183c:	03878593          	addi	a1,a5,56
    1840:	00001797          	auipc	a5,0x1
    1844:	b1878793          	addi	a5,a5,-1256 # 2358 <allocated_time>
    1848:	639c                	ld	a5,0(a5)
    184a:	86be                	mv	a3,a5
    184c:	00000617          	auipc	a2,0x0
    1850:	cec60613          	addi	a2,a2,-788 # 1538 <switch_handler>
    1854:	853a                	mv	a0,a4
    1856:	fffff097          	auipc	ra,0xfffff
    185a:	d92080e7          	jalr	-622(ra) # 5e8 <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    185e:	fe043783          	ld	a5,-32(s0)
    1862:	5f9c                	lw	a5,56(a5)
    1864:	0207d063          	bgez	a5,1884 <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    1868:	00001597          	auipc	a1,0x1
    186c:	97058593          	addi	a1,a1,-1680 # 21d8 <schedule_edf_cbs+0x654>
    1870:	4509                	li	a0,2
    1872:	fffff097          	auipc	ra,0xfffff
    1876:	1c4080e7          	jalr	452(ra) # a36 <fprintf>
            exit(1);
    187a:	4505                	li	a0,1
    187c:	fffff097          	auipc	ra,0xfffff
    1880:	ccc080e7          	jalr	-820(ra) # 548 <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    1884:	fd843783          	ld	a5,-40(s0)
    1888:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    188a:	fe043783          	ld	a5,-32(s0)
    188e:	6398                	ld	a4,0(a5)
    1890:	fe043783          	ld	a5,-32(s0)
    1894:	679c                	ld	a5,8(a5)
    1896:	853e                	mv	a0,a5
    1898:	9702                	jalr	a4
    }
    thread_exit();
    189a:	00000097          	auipc	ra,0x0
    189e:	a5a080e7          	jalr	-1446(ra) # 12f4 <thread_exit>
    18a2:	a011                	j	18a6 <__dispatch+0x1c2>
        return;
    18a4:	0001                	nop
}
    18a6:	70a2                	ld	ra,40(sp)
    18a8:	7402                	ld	s0,32(sp)
    18aa:	6145                	addi	sp,sp,48
    18ac:	8082                	ret

00000000000018ae <__schedule>:

void __schedule()
{
    18ae:	711d                	addi	sp,sp,-96
    18b0:	ec86                	sd	ra,88(sp)
    18b2:	e8a2                	sd	s0,80(sp)
    18b4:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    18b6:	00001797          	auipc	a5,0x1
    18ba:	a9a78793          	addi	a5,a5,-1382 # 2350 <threading_system_time>
    18be:	439c                	lw	a5,0(a5)
    18c0:	fcf42c23          	sw	a5,-40(s0)
    18c4:	4789                	li	a5,2
    18c6:	fcf42e23          	sw	a5,-36(s0)
    18ca:	00001797          	auipc	a5,0x1
    18ce:	a3678793          	addi	a5,a5,-1482 # 2300 <run_queue>
    18d2:	fef43023          	sd	a5,-32(s0)
    18d6:	00001797          	auipc	a5,0x1
    18da:	a3a78793          	addi	a5,a5,-1478 # 2310 <release_queue>
    18de:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    18e2:	fd843783          	ld	a5,-40(s0)
    18e6:	faf43023          	sd	a5,-96(s0)
    18ea:	fe043783          	ld	a5,-32(s0)
    18ee:	faf43423          	sd	a5,-88(s0)
    18f2:	fe843783          	ld	a5,-24(s0)
    18f6:	faf43823          	sd	a5,-80(s0)
    18fa:	fa040793          	addi	a5,s0,-96
    18fe:	853e                	mv	a0,a5
    1900:	00000097          	auipc	ra,0x0
    1904:	284080e7          	jalr	644(ra) # 1b84 <schedule_edf_cbs>
    1908:	872a                	mv	a4,a0
    190a:	87ae                	mv	a5,a1
    190c:	fce43423          	sd	a4,-56(s0)
    1910:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    1914:	fc843703          	ld	a4,-56(s0)
    1918:	00001797          	auipc	a5,0x1
    191c:	a3078793          	addi	a5,a5,-1488 # 2348 <current>
    1920:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1922:	fd042783          	lw	a5,-48(s0)
    1926:	873e                	mv	a4,a5
    1928:	00001797          	auipc	a5,0x1
    192c:	a3078793          	addi	a5,a5,-1488 # 2358 <allocated_time>
    1930:	e398                	sd	a4,0(a5)
}
    1932:	0001                	nop
    1934:	60e6                	ld	ra,88(sp)
    1936:	6446                	ld	s0,80(sp)
    1938:	6125                	addi	sp,sp,96
    193a:	8082                	ret

000000000000193c <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    193c:	1101                	addi	sp,sp,-32
    193e:	ec06                	sd	ra,24(sp)
    1940:	e822                	sd	s0,16(sp)
    1942:	1000                	addi	s0,sp,32
    1944:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1948:	00001797          	auipc	a5,0x1
    194c:	a0c78793          	addi	a5,a5,-1524 # 2354 <sleeping>
    1950:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1954:	fe843783          	ld	a5,-24(s0)
    1958:	0007871b          	sext.w	a4,a5
    195c:	00001797          	auipc	a5,0x1
    1960:	9f478793          	addi	a5,a5,-1548 # 2350 <threading_system_time>
    1964:	439c                	lw	a5,0(a5)
    1966:	2781                	sext.w	a5,a5
    1968:	9fb9                	addw	a5,a5,a4
    196a:	2781                	sext.w	a5,a5
    196c:	0007871b          	sext.w	a4,a5
    1970:	00001797          	auipc	a5,0x1
    1974:	9e078793          	addi	a5,a5,-1568 # 2350 <threading_system_time>
    1978:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    197a:	00001797          	auipc	a5,0x1
    197e:	9a678793          	addi	a5,a5,-1626 # 2320 <main_thrd_id>
    1982:	439c                	lw	a5,0(a5)
    1984:	853e                	mv	a0,a5
    1986:	fffff097          	auipc	ra,0xfffff
    198a:	c6a080e7          	jalr	-918(ra) # 5f0 <thrdresume>
}
    198e:	0001                	nop
    1990:	60e2                	ld	ra,24(sp)
    1992:	6442                	ld	s0,16(sp)
    1994:	6105                	addi	sp,sp,32
    1996:	8082                	ret

0000000000001998 <thread_start_threading>:

void thread_start_threading()
{
    1998:	1141                	addi	sp,sp,-16
    199a:	e406                	sd	ra,8(sp)
    199c:	e022                	sd	s0,0(sp)
    199e:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    19a0:	00001797          	auipc	a5,0x1
    19a4:	9b078793          	addi	a5,a5,-1616 # 2350 <threading_system_time>
    19a8:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    19ac:	00001797          	auipc	a5,0x1
    19b0:	99c78793          	addi	a5,a5,-1636 # 2348 <current>
    19b4:	00001717          	auipc	a4,0x1
    19b8:	94c70713          	addi	a4,a4,-1716 # 2300 <run_queue>
    19bc:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    19be:	4681                	li	a3,0
    19c0:	00000617          	auipc	a2,0x0
    19c4:	f7c60613          	addi	a2,a2,-132 # 193c <back_to_main_handler>
    19c8:	00001597          	auipc	a1,0x1
    19cc:	95858593          	addi	a1,a1,-1704 # 2320 <main_thrd_id>
    19d0:	3e800513          	li	a0,1000
    19d4:	fffff097          	auipc	ra,0xfffff
    19d8:	c14080e7          	jalr	-1004(ra) # 5e8 <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    19dc:	00001797          	auipc	a5,0x1
    19e0:	94478793          	addi	a5,a5,-1724 # 2320 <main_thrd_id>
    19e4:	439c                	lw	a5,0(a5)
    19e6:	4581                	li	a1,0
    19e8:	853e                	mv	a0,a5
    19ea:	fffff097          	auipc	ra,0xfffff
    19ee:	c0e080e7          	jalr	-1010(ra) # 5f8 <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    19f2:	a0c9                	j	1ab4 <thread_start_threading+0x11c>
        __release();
    19f4:	fffff097          	auipc	ra,0xfffff
    19f8:	76a080e7          	jalr	1898(ra) # 115e <__release>
        __schedule();
    19fc:	00000097          	auipc	ra,0x0
    1a00:	eb2080e7          	jalr	-334(ra) # 18ae <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1a04:	00001797          	auipc	a5,0x1
    1a08:	91c78793          	addi	a5,a5,-1764 # 2320 <main_thrd_id>
    1a0c:	439c                	lw	a5,0(a5)
    1a0e:	4581                	li	a1,0
    1a10:	853e                	mv	a0,a5
    1a12:	fffff097          	auipc	ra,0xfffff
    1a16:	be6080e7          	jalr	-1050(ra) # 5f8 <cancelthrdstop>
        __dispatch();
    1a1a:	00000097          	auipc	ra,0x0
    1a1e:	cca080e7          	jalr	-822(ra) # 16e4 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1a22:	00001517          	auipc	a0,0x1
    1a26:	8de50513          	addi	a0,a0,-1826 # 2300 <run_queue>
    1a2a:	fffff097          	auipc	ra,0xfffff
    1a2e:	4f2080e7          	jalr	1266(ra) # f1c <list_empty>
    1a32:	87aa                	mv	a5,a0
    1a34:	cb99                	beqz	a5,1a4a <thread_start_threading+0xb2>
    1a36:	00001517          	auipc	a0,0x1
    1a3a:	8da50513          	addi	a0,a0,-1830 # 2310 <release_queue>
    1a3e:	fffff097          	auipc	ra,0xfffff
    1a42:	4de080e7          	jalr	1246(ra) # f1c <list_empty>
    1a46:	87aa                	mv	a5,a0
    1a48:	ebd9                	bnez	a5,1ade <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1a4a:	00001797          	auipc	a5,0x1
    1a4e:	90e78793          	addi	a5,a5,-1778 # 2358 <allocated_time>
    1a52:	639c                	ld	a5,0(a5)
    1a54:	85be                	mv	a1,a5
    1a56:	00000517          	auipc	a0,0x0
    1a5a:	7ba50513          	addi	a0,a0,1978 # 2210 <schedule_edf_cbs+0x68c>
    1a5e:	fffff097          	auipc	ra,0xfffff
    1a62:	030080e7          	jalr	48(ra) # a8e <printf>
        sleeping = 1;
    1a66:	00001797          	auipc	a5,0x1
    1a6a:	8ee78793          	addi	a5,a5,-1810 # 2354 <sleeping>
    1a6e:	4705                	li	a4,1
    1a70:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1a72:	00001797          	auipc	a5,0x1
    1a76:	8e678793          	addi	a5,a5,-1818 # 2358 <allocated_time>
    1a7a:	639c                	ld	a5,0(a5)
    1a7c:	0007871b          	sext.w	a4,a5
    1a80:	00001797          	auipc	a5,0x1
    1a84:	8d878793          	addi	a5,a5,-1832 # 2358 <allocated_time>
    1a88:	639c                	ld	a5,0(a5)
    1a8a:	86be                	mv	a3,a5
    1a8c:	00000617          	auipc	a2,0x0
    1a90:	eb060613          	addi	a2,a2,-336 # 193c <back_to_main_handler>
    1a94:	00001597          	auipc	a1,0x1
    1a98:	88c58593          	addi	a1,a1,-1908 # 2320 <main_thrd_id>
    1a9c:	853a                	mv	a0,a4
    1a9e:	fffff097          	auipc	ra,0xfffff
    1aa2:	b4a080e7          	jalr	-1206(ra) # 5e8 <thrdstop>
        while (sleeping) {
    1aa6:	0001                	nop
    1aa8:	00001797          	auipc	a5,0x1
    1aac:	8ac78793          	addi	a5,a5,-1876 # 2354 <sleeping>
    1ab0:	439c                	lw	a5,0(a5)
    1ab2:	fbfd                	bnez	a5,1aa8 <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1ab4:	00001517          	auipc	a0,0x1
    1ab8:	84c50513          	addi	a0,a0,-1972 # 2300 <run_queue>
    1abc:	fffff097          	auipc	ra,0xfffff
    1ac0:	460080e7          	jalr	1120(ra) # f1c <list_empty>
    1ac4:	87aa                	mv	a5,a0
    1ac6:	d79d                	beqz	a5,19f4 <thread_start_threading+0x5c>
    1ac8:	00001517          	auipc	a0,0x1
    1acc:	84850513          	addi	a0,a0,-1976 # 2310 <release_queue>
    1ad0:	fffff097          	auipc	ra,0xfffff
    1ad4:	44c080e7          	jalr	1100(ra) # f1c <list_empty>
    1ad8:	87aa                	mv	a5,a0
    1ada:	df89                	beqz	a5,19f4 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1adc:	a011                	j	1ae0 <thread_start_threading+0x148>
            break;
    1ade:	0001                	nop
}
    1ae0:	0001                	nop
    1ae2:	60a2                	ld	ra,8(sp)
    1ae4:	6402                	ld	s0,0(sp)
    1ae6:	0141                	addi	sp,sp,16
    1ae8:	8082                	ret

0000000000001aea <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1aea:	7139                	addi	sp,sp,-64
    1aec:	fc22                	sd	s0,56(sp)
    1aee:	0080                	addi	s0,sp,64
    1af0:	fca43423          	sd	a0,-56(s0)
    1af4:	87ae                	mv	a5,a1
    1af6:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1afa:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1afe:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1b02:	fc843783          	ld	a5,-56(s0)
    1b06:	639c                	ld	a5,0(a5)
    1b08:	fcf43c23          	sd	a5,-40(s0)
    1b0c:	fd843783          	ld	a5,-40(s0)
    1b10:	fd878793          	addi	a5,a5,-40
    1b14:	fef43423          	sd	a5,-24(s0)
    1b18:	a881                	j	1b68 <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1b1a:	fe843783          	ld	a5,-24(s0)
    1b1e:	4fb8                	lw	a4,88(a5)
    1b20:	fc442783          	lw	a5,-60(s0)
    1b24:	2781                	sext.w	a5,a5
    1b26:	02e7c663          	blt	a5,a4,1b52 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1b2a:	fe043783          	ld	a5,-32(s0)
    1b2e:	e791                	bnez	a5,1b3a <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1b30:	fe843783          	ld	a5,-24(s0)
    1b34:	fef43023          	sd	a5,-32(s0)
    1b38:	a829                	j	1b52 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1b3a:	fe843783          	ld	a5,-24(s0)
    1b3e:	5fd8                	lw	a4,60(a5)
    1b40:	fe043783          	ld	a5,-32(s0)
    1b44:	5fdc                	lw	a5,60(a5)
    1b46:	00f75663          	bge	a4,a5,1b52 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1b4a:	fe843783          	ld	a5,-24(s0)
    1b4e:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1b52:	fe843783          	ld	a5,-24(s0)
    1b56:	779c                	ld	a5,40(a5)
    1b58:	fcf43823          	sd	a5,-48(s0)
    1b5c:	fd043783          	ld	a5,-48(s0)
    1b60:	fd878793          	addi	a5,a5,-40
    1b64:	fef43423          	sd	a5,-24(s0)
    1b68:	fe843783          	ld	a5,-24(s0)
    1b6c:	02878793          	addi	a5,a5,40
    1b70:	fc843703          	ld	a4,-56(s0)
    1b74:	faf713e3          	bne	a4,a5,1b1a <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1b78:	fe043783          	ld	a5,-32(s0)
}
    1b7c:	853e                	mv	a0,a5
    1b7e:	7462                	ld	s0,56(sp)
    1b80:	6121                	addi	sp,sp,64
    1b82:	8082                	ret

0000000000001b84 <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1b84:	7131                	addi	sp,sp,-192
    1b86:	fd06                	sd	ra,184(sp)
    1b88:	f922                	sd	s0,176(sp)
    1b8a:	f526                	sd	s1,168(sp)
    1b8c:	f14a                	sd	s2,160(sp)
    1b8e:	ed4e                	sd	s3,152(sp)
    1b90:	0180                	addi	s0,sp,192
    1b92:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1b94:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1b98:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1b9c:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1ba0:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1ba4:	649c                	ld	a5,8(s1)
    1ba6:	4098                	lw	a4,0(s1)
    1ba8:	85ba                	mv	a1,a4
    1baa:	853e                	mv	a0,a5
    1bac:	00000097          	auipc	ra,0x0
    1bb0:	f3e080e7          	jalr	-194(ra) # 1aea <__check_deadline_miss>
    1bb4:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1bb8:	f9843783          	ld	a5,-104(s0)
    1bbc:	c7b5                	beqz	a5,1c28 <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1bbe:	f9843783          	ld	a5,-104(s0)
    1bc2:	5fdc                	lw	a5,60(a5)
    1bc4:	85be                	mv	a1,a5
    1bc6:	00000517          	auipc	a0,0x0
    1bca:	67250513          	addi	a0,a0,1650 # 2238 <schedule_edf_cbs+0x6b4>
    1bce:	fffff097          	auipc	ra,0xfffff
    1bd2:	ec0080e7          	jalr	-320(ra) # a8e <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1bd6:	f9843783          	ld	a5,-104(s0)
    1bda:	57fc                	lw	a5,108(a5)
    1bdc:	c395                	beqz	a5,1c00 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1bde:	f9843783          	ld	a5,-104(s0)
    1be2:	02878793          	addi	a5,a5,40
    1be6:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1bea:	f4042423          	sw	zero,-184(s0)
            return r;
    1bee:	f4043783          	ld	a5,-192(s0)
    1bf2:	f4f43823          	sd	a5,-176(s0)
    1bf6:	f4843783          	ld	a5,-184(s0)
    1bfa:	f4f43c23          	sd	a5,-168(s0)
    1bfe:	a13d                	j	202c <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1c00:	4098                	lw	a4,0(s1)
    1c02:	f9843783          	ld	a5,-104(s0)
    1c06:	47fc                	lw	a5,76(a5)
    1c08:	9fb9                	addw	a5,a5,a4
    1c0a:	0007871b          	sext.w	a4,a5
    1c0e:	f9843783          	ld	a5,-104(s0)
    1c12:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1c14:	f9843783          	ld	a5,-104(s0)
    1c18:	53f8                	lw	a4,100(a5)
    1c1a:	f9843783          	ld	a5,-104(s0)
    1c1e:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1c20:	f9843783          	ld	a5,-104(s0)
    1c24:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1c28:	fa043783          	ld	a5,-96(s0)
    1c2c:	e7dd                	bnez	a5,1cda <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1c2e:	649c                	ld	a5,8(s1)
    1c30:	639c                	ld	a5,0(a5)
    1c32:	f8f43823          	sd	a5,-112(s0)
    1c36:	f9043783          	ld	a5,-112(s0)
    1c3a:	fd878793          	addi	a5,a5,-40
    1c3e:	faf43c23          	sd	a5,-72(s0)
    1c42:	a069                	j	1ccc <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1c44:	fb843783          	ld	a5,-72(s0)
    1c48:	5fd8                	lw	a4,60(a5)
    1c4a:	fb843783          	ld	a5,-72(s0)
    1c4e:	5bbc                	lw	a5,112(a5)
    1c50:	863e                	mv	a2,a5
    1c52:	85ba                	mv	a1,a4
    1c54:	00000517          	auipc	a0,0x0
    1c58:	61c50513          	addi	a0,a0,1564 # 2270 <schedule_edf_cbs+0x6ec>
    1c5c:	fffff097          	auipc	ra,0xfffff
    1c60:	e32080e7          	jalr	-462(ra) # a8e <printf>
            if (next == NULL)
    1c64:	fa043783          	ld	a5,-96(s0)
    1c68:	e791                	bnez	a5,1c74 <schedule_edf_cbs+0xf0>
                next = th;
    1c6a:	fb843783          	ld	a5,-72(s0)
    1c6e:	faf43023          	sd	a5,-96(s0)
    1c72:	a091                	j	1cb6 <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1c74:	fb843783          	ld	a5,-72(s0)
    1c78:	4fb8                	lw	a4,88(a5)
    1c7a:	fa043783          	ld	a5,-96(s0)
    1c7e:	4fbc                	lw	a5,88(a5)
    1c80:	00f75763          	bge	a4,a5,1c8e <schedule_edf_cbs+0x10a>
                next = th;
    1c84:	fb843783          	ld	a5,-72(s0)
    1c88:	faf43023          	sd	a5,-96(s0)
    1c8c:	a02d                	j	1cb6 <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1c8e:	fb843783          	ld	a5,-72(s0)
    1c92:	4fb8                	lw	a4,88(a5)
    1c94:	fa043783          	ld	a5,-96(s0)
    1c98:	4fbc                	lw	a5,88(a5)
    1c9a:	00f71e63          	bne	a4,a5,1cb6 <schedule_edf_cbs+0x132>
    1c9e:	fb843783          	ld	a5,-72(s0)
    1ca2:	5fd8                	lw	a4,60(a5)
    1ca4:	fa043783          	ld	a5,-96(s0)
    1ca8:	5fdc                	lw	a5,60(a5)
    1caa:	00f75663          	bge	a4,a5,1cb6 <schedule_edf_cbs+0x132>
                next = th;
    1cae:	fb843783          	ld	a5,-72(s0)
    1cb2:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1cb6:	fb843783          	ld	a5,-72(s0)
    1cba:	779c                	ld	a5,40(a5)
    1cbc:	f8f43423          	sd	a5,-120(s0)
    1cc0:	f8843783          	ld	a5,-120(s0)
    1cc4:	fd878793          	addi	a5,a5,-40
    1cc8:	faf43c23          	sd	a5,-72(s0)
    1ccc:	fb843783          	ld	a5,-72(s0)
    1cd0:	02878713          	addi	a4,a5,40
    1cd4:	649c                	ld	a5,8(s1)
    1cd6:	f6f717e3          	bne	a4,a5,1c44 <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1cda:	fa043783          	ld	a5,-96(s0)
    1cde:	5fdc                	lw	a5,60(a5)
    1ce0:	85be                	mv	a1,a5
    1ce2:	00000517          	auipc	a0,0x0
    1ce6:	5c650513          	addi	a0,a0,1478 # 22a8 <schedule_edf_cbs+0x724>
    1cea:	fffff097          	auipc	ra,0xfffff
    1cee:	da4080e7          	jalr	-604(ra) # a8e <printf>

    if(next && next->cbs.is_throttled){
    1cf2:	fa043783          	ld	a5,-96(s0)
    1cf6:	cb95                	beqz	a5,1d2a <schedule_edf_cbs+0x1a6>
    1cf8:	fa043783          	ld	a5,-96(s0)
    1cfc:	5bbc                	lw	a5,112(a5)
    1cfe:	c795                	beqz	a5,1d2a <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1d00:	fa043783          	ld	a5,-96(s0)
    1d04:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1d08:	fa043783          	ld	a5,-96(s0)
    1d0c:	02878793          	addi	a5,a5,40
    1d10:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1d14:	f4042423          	sw	zero,-184(s0)
        return r;
    1d18:	f4043783          	ld	a5,-192(s0)
    1d1c:	f4f43823          	sd	a5,-176(s0)
    1d20:	f4843783          	ld	a5,-184(s0)
    1d24:	f4f43c23          	sd	a5,-168(s0)
    1d28:	a611                	j	202c <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1d2a:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d2e:	689c                	ld	a5,16(s1)
    1d30:	639c                	ld	a5,0(a5)
    1d32:	f8f43023          	sd	a5,-128(s0)
    1d36:	f8043783          	ld	a5,-128(s0)
    1d3a:	17e1                	addi	a5,a5,-8
    1d3c:	fcf43023          	sd	a5,-64(s0)
    1d40:	a0b5                	j	1dac <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1d42:	fa843783          	ld	a5,-88(s0)
    1d46:	e791                	bnez	a5,1d52 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1d48:	fc043783          	ld	a5,-64(s0)
    1d4c:	faf43423          	sd	a5,-88(s0)
    1d50:	a0a1                	j	1d98 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1d52:	fa843783          	ld	a5,-88(s0)
    1d56:	4f98                	lw	a4,24(a5)
    1d58:	fc043783          	ld	a5,-64(s0)
    1d5c:	4f9c                	lw	a5,24(a5)
    1d5e:	00e7d763          	bge	a5,a4,1d6c <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1d62:	fc043783          	ld	a5,-64(s0)
    1d66:	faf43423          	sd	a5,-88(s0)
    1d6a:	a03d                	j	1d98 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1d6c:	fa843783          	ld	a5,-88(s0)
    1d70:	4f98                	lw	a4,24(a5)
    1d72:	fc043783          	ld	a5,-64(s0)
    1d76:	4f9c                	lw	a5,24(a5)
    1d78:	02f71063          	bne	a4,a5,1d98 <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1d7c:	fa843783          	ld	a5,-88(s0)
    1d80:	639c                	ld	a5,0(a5)
    1d82:	4fb8                	lw	a4,88(a5)
    1d84:	fc043783          	ld	a5,-64(s0)
    1d88:	639c                	ld	a5,0(a5)
    1d8a:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1d8c:	00e7d663          	bge	a5,a4,1d98 <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1d90:	fc043783          	ld	a5,-64(s0)
    1d94:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d98:	fc043783          	ld	a5,-64(s0)
    1d9c:	679c                	ld	a5,8(a5)
    1d9e:	f6f43023          	sd	a5,-160(s0)
    1da2:	f6043783          	ld	a5,-160(s0)
    1da6:	17e1                	addi	a5,a5,-8
    1da8:	fcf43023          	sd	a5,-64(s0)
    1dac:	fc043783          	ld	a5,-64(s0)
    1db0:	00878713          	addi	a4,a5,8
    1db4:	689c                	ld	a5,16(s1)
    1db6:	f8f716e3          	bne	a4,a5,1d42 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1dba:	689c                	ld	a5,16(s1)
    1dbc:	639c                	ld	a5,0(a5)
    1dbe:	f6f43c23          	sd	a5,-136(s0)
    1dc2:	f7843783          	ld	a5,-136(s0)
    1dc6:	17e1                	addi	a5,a5,-8
    1dc8:	fcf43023          	sd	a5,-64(s0)
    1dcc:	a069                	j	1e56 <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1dce:	fb043783          	ld	a5,-80(s0)
    1dd2:	eb99                	bnez	a5,1de8 <schedule_edf_cbs+0x264>
    1dd4:	fc043783          	ld	a5,-64(s0)
    1dd8:	639c                	ld	a5,0(a5)
    1dda:	57fc                	lw	a5,108(a5)
    1ddc:	c791                	beqz	a5,1de8 <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1dde:	fc043783          	ld	a5,-64(s0)
    1de2:	faf43823          	sd	a5,-80(s0)
    1de6:	a8b1                	j	1e42 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1de8:	fc043783          	ld	a5,-64(s0)
    1dec:	639c                	ld	a5,0(a5)
    1dee:	57fc                	lw	a5,108(a5)
    1df0:	cf91                	beqz	a5,1e0c <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1df2:	fb043783          	ld	a5,-80(s0)
    1df6:	4f98                	lw	a4,24(a5)
    1df8:	fc043783          	ld	a5,-64(s0)
    1dfc:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1dfe:	00e7d763          	bge	a5,a4,1e0c <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1e02:	fc043783          	ld	a5,-64(s0)
    1e06:	faf43823          	sd	a5,-80(s0)
    1e0a:	a825                	j	1e42 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1e0c:	fc043783          	ld	a5,-64(s0)
    1e10:	639c                	ld	a5,0(a5)
    1e12:	57fc                	lw	a5,108(a5)
    1e14:	c79d                	beqz	a5,1e42 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1e16:	fb043783          	ld	a5,-80(s0)
    1e1a:	4f98                	lw	a4,24(a5)
    1e1c:	fc043783          	ld	a5,-64(s0)
    1e20:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1e22:	02f71063          	bne	a4,a5,1e42 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1e26:	fb043783          	ld	a5,-80(s0)
    1e2a:	639c                	ld	a5,0(a5)
    1e2c:	4fb8                	lw	a4,88(a5)
    1e2e:	fc043783          	ld	a5,-64(s0)
    1e32:	639c                	ld	a5,0(a5)
    1e34:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1e36:	00e7d663          	bge	a5,a4,1e42 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1e3a:	fc043783          	ld	a5,-64(s0)
    1e3e:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1e42:	fc043783          	ld	a5,-64(s0)
    1e46:	679c                	ld	a5,8(a5)
    1e48:	f6f43423          	sd	a5,-152(s0)
    1e4c:	f6843783          	ld	a5,-152(s0)
    1e50:	17e1                	addi	a5,a5,-8
    1e52:	fcf43023          	sd	a5,-64(s0)
    1e56:	fc043783          	ld	a5,-64(s0)
    1e5a:	00878713          	addi	a4,a5,8
    1e5e:	689c                	ld	a5,16(s1)
    1e60:	f6f717e3          	bne	a4,a5,1dce <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1e64:	fa043783          	ld	a5,-96(s0)
    1e68:	cb89                	beqz	a5,1e7a <schedule_edf_cbs+0x2f6>
    1e6a:	fa043783          	ld	a5,-96(s0)
    1e6e:	57fc                	lw	a5,108(a5)
    1e70:	c789                	beqz	a5,1e7a <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1e72:	fb043783          	ld	a5,-80(s0)
    1e76:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1e7a:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1e7e:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1e82:	fa843783          	ld	a5,-88(s0)
    1e86:	c3c5                	beqz	a5,1f26 <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1e88:	fa843783          	ld	a5,-88(s0)
    1e8c:	639c                	ld	a5,0(a5)
    1e8e:	5fdc                	lw	a5,60(a5)
    1e90:	85be                	mv	a1,a5
    1e92:	00000517          	auipc	a0,0x0
    1e96:	43650513          	addi	a0,a0,1078 # 22c8 <schedule_edf_cbs+0x744>
    1e9a:	fffff097          	auipc	ra,0xfffff
    1e9e:	bf4080e7          	jalr	-1036(ra) # a8e <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    1ea2:	fa843783          	ld	a5,-88(s0)
    1ea6:	4f98                	lw	a4,24(a5)
    1ea8:	409c                	lw	a5,0(s1)
    1eaa:	40f707bb          	subw	a5,a4,a5
    1eae:	fcf42623          	sw	a5,-52(s0)
        if (next){
    1eb2:	fa043783          	ld	a5,-96(s0)
    1eb6:	cba5                	beqz	a5,1f26 <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    1eb8:	fa043783          	ld	a5,-96(s0)
    1ebc:	4bf8                	lw	a4,84(a5)
    1ebe:	fcc42783          	lw	a5,-52(s0)
    1ec2:	2781                	sext.w	a5,a5
    1ec4:	06e7d163          	bge	a5,a4,1f26 <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    1ec8:	fa043783          	ld	a5,-96(s0)
    1ecc:	57fc                	lw	a5,108(a5)
    1ece:	eb91                	bnez	a5,1ee2 <schedule_edf_cbs+0x35e>
    1ed0:	fa843783          	ld	a5,-88(s0)
    1ed4:	639c                	ld	a5,0(a5)
    1ed6:	57fc                	lw	a5,108(a5)
    1ed8:	c789                	beqz	a5,1ee2 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    1eda:	4785                	li	a5,1
    1edc:	fcf42423          	sw	a5,-56(s0)
    1ee0:	a099                	j	1f26 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    1ee2:	fa043783          	ld	a5,-96(s0)
    1ee6:	4fb8                	lw	a4,88(a5)
    1ee8:	fa843783          	ld	a5,-88(s0)
    1eec:	639c                	ld	a5,0(a5)
    1eee:	4fbc                	lw	a5,88(a5)
    1ef0:	00e7d663          	bge	a5,a4,1efc <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    1ef4:	4785                	li	a5,1
    1ef6:	fcf42423          	sw	a5,-56(s0)
    1efa:	a035                	j	1f26 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1efc:	fa043783          	ld	a5,-96(s0)
    1f00:	4fb8                	lw	a4,88(a5)
    1f02:	fa843783          	ld	a5,-88(s0)
    1f06:	639c                	ld	a5,0(a5)
    1f08:	4fbc                	lw	a5,88(a5)
    1f0a:	00f71e63          	bne	a4,a5,1f26 <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    1f0e:	fa043783          	ld	a5,-96(s0)
    1f12:	5fd8                	lw	a4,60(a5)
    1f14:	fa843783          	ld	a5,-88(s0)
    1f18:	639c                	ld	a5,0(a5)
    1f1a:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1f1c:	00e7d563          	bge	a5,a4,1f26 <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    1f20:	4785                	li	a5,1
    1f22:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    1f26:	fa043783          	ld	a5,-96(s0)
    1f2a:	cbd1                	beqz	a5,1fbe <schedule_edf_cbs+0x43a>
    1f2c:	fa043783          	ld	a5,-96(s0)
    1f30:	57fc                	lw	a5,108(a5)
    1f32:	e7d1                	bnez	a5,1fbe <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    1f34:	fa043783          	ld	a5,-96(s0)
    1f38:	4fb8                	lw	a4,88(a5)
    1f3a:	409c                	lw	a5,0(s1)
    1f3c:	40f707bb          	subw	a5,a4,a5
    1f40:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    1f44:	fa043783          	ld	a5,-96(s0)
    1f48:	47f8                	lw	a4,76(a5)
    1f4a:	fa043783          	ld	a5,-96(s0)
    1f4e:	57bc                	lw	a5,104(a5)
    1f50:	02f707bb          	mulw	a5,a4,a5
    1f54:	0007869b          	sext.w	a3,a5
    1f58:	fa043783          	ld	a5,-96(s0)
    1f5c:	53fc                	lw	a5,100(a5)
    1f5e:	f7442703          	lw	a4,-140(s0)
    1f62:	02f707bb          	mulw	a5,a4,a5
    1f66:	2781                	sext.w	a5,a5
    1f68:	8736                	mv	a4,a3
    1f6a:	02e7d263          	bge	a5,a4,1f8e <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    1f6e:	4098                	lw	a4,0(s1)
    1f70:	fa043783          	ld	a5,-96(s0)
    1f74:	47fc                	lw	a5,76(a5)
    1f76:	9fb9                	addw	a5,a5,a4
    1f78:	0007871b          	sext.w	a4,a5
    1f7c:	fa043783          	ld	a5,-96(s0)
    1f80:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    1f82:	fa043783          	ld	a5,-96(s0)
    1f86:	53f8                	lw	a4,100(a5)
    1f88:	fa043783          	ld	a5,-96(s0)
    1f8c:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    1f8e:	fa043783          	ld	a5,-96(s0)
    1f92:	4bf8                	lw	a4,84(a5)
    1f94:	fa043783          	ld	a5,-96(s0)
    1f98:	57bc                	lw	a5,104(a5)
    1f9a:	02e7d263          	bge	a5,a4,1fbe <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    1f9e:	fa043783          	ld	a5,-96(s0)
    1fa2:	4705                	li	a4,1
    1fa4:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    1fa6:	fa043783          	ld	a5,-96(s0)
    1faa:	4fb8                	lw	a4,88(a5)
    1fac:	fa043783          	ld	a5,-96(s0)
    1fb0:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    1fb2:	fa043783          	ld	a5,-96(s0)
    1fb6:	4bf8                	lw	a4,84(a5)
    1fb8:	fa043783          	ld	a5,-96(s0)
    1fbc:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    1fbe:	fa043783          	ld	a5,-96(s0)
    1fc2:	c3a9                	beqz	a5,2004 <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    1fc4:	fa043783          	ld	a5,-96(s0)
    1fc8:	02878793          	addi	a5,a5,40
    1fcc:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    1fd0:	fa843783          	ld	a5,-88(s0)
    1fd4:	cb91                	beqz	a5,1fe8 <schedule_edf_cbs+0x464>
    1fd6:	fc842783          	lw	a5,-56(s0)
    1fda:	2781                	sext.w	a5,a5
    1fdc:	c791                	beqz	a5,1fe8 <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    1fde:	fcc42783          	lw	a5,-52(s0)
    1fe2:	f4f42423          	sw	a5,-184(s0)
    1fe6:	a81d                	j	201c <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    1fe8:	fa043783          	ld	a5,-96(s0)
    1fec:	5bbc                	lw	a5,112(a5)
    1fee:	c789                	beqz	a5,1ff8 <schedule_edf_cbs+0x474>
    1ff0:	fa043783          	ld	a5,-96(s0)
    1ff4:	57bc                	lw	a5,104(a5)
    1ff6:	a021                	j	1ffe <schedule_edf_cbs+0x47a>
    1ff8:	fa043783          	ld	a5,-96(s0)
    1ffc:	4bfc                	lw	a5,84(a5)
    1ffe:	f4f42423          	sw	a5,-184(s0)
    2002:	a829                	j	201c <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    2004:	649c                	ld	a5,8(s1)
    2006:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    200a:	fa843783          	ld	a5,-88(s0)
    200e:	c781                	beqz	a5,2016 <schedule_edf_cbs+0x492>
    2010:	fcc42783          	lw	a5,-52(s0)
    2014:	a011                	j	2018 <schedule_edf_cbs+0x494>
    2016:	4785                	li	a5,1
    2018:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    201c:	f4043783          	ld	a5,-192(s0)
    2020:	f4f43823          	sd	a5,-176(s0)
    2024:	f4843783          	ld	a5,-184(s0)
    2028:	f4f43c23          	sd	a5,-168(s0)
    202c:	4701                	li	a4,0
    202e:	f5043703          	ld	a4,-176(s0)
    2032:	4781                	li	a5,0
    2034:	f5843783          	ld	a5,-168(s0)
    2038:	893a                	mv	s2,a4
    203a:	89be                	mv	s3,a5
    203c:	874a                	mv	a4,s2
    203e:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    2040:	853a                	mv	a0,a4
    2042:	85be                	mv	a1,a5
    2044:	70ea                	ld	ra,184(sp)
    2046:	744a                	ld	s0,176(sp)
    2048:	74aa                	ld	s1,168(sp)
    204a:	790a                	ld	s2,160(sp)
    204c:	69ea                	ld	s3,152(sp)
    204e:	6129                	addi	sp,sp,192
    2050:	8082                	ret
