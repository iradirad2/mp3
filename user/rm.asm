
user/_rm:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
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
    fprintf(2, "Usage: rm files...\n");
      20:	00002597          	auipc	a1,0x2
      24:	02858593          	addi	a1,a1,40 # 2048 <schedule_edf_cbs+0x4d2>
      28:	4509                	li	a0,2
      2a:	00001097          	auipc	ra,0x1
      2e:	9fe080e7          	jalr	-1538(ra) # a28 <fprintf>
    exit(1);
      32:	4505                	li	a0,1
      34:	00000097          	auipc	ra,0x0
      38:	506080e7          	jalr	1286(ra) # 53a <exit>
  }

  for(i = 1; i < argc; i++){
      3c:	4785                	li	a5,1
      3e:	fef42623          	sw	a5,-20(s0)
      42:	a0b9                	j	90 <main+0x90>
    if(unlink(argv[i]) < 0){
      44:	fec42783          	lw	a5,-20(s0)
      48:	078e                	slli	a5,a5,0x3
      4a:	fd043703          	ld	a4,-48(s0)
      4e:	97ba                	add	a5,a5,a4
      50:	639c                	ld	a5,0(a5)
      52:	853e                	mv	a0,a5
      54:	00000097          	auipc	ra,0x0
      58:	536080e7          	jalr	1334(ra) # 58a <unlink>
      5c:	87aa                	mv	a5,a0
      5e:	0207d463          	bgez	a5,86 <main+0x86>
      fprintf(2, "rm: %s failed to delete\n", argv[i]);
      62:	fec42783          	lw	a5,-20(s0)
      66:	078e                	slli	a5,a5,0x3
      68:	fd043703          	ld	a4,-48(s0)
      6c:	97ba                	add	a5,a5,a4
      6e:	639c                	ld	a5,0(a5)
      70:	863e                	mv	a2,a5
      72:	00002597          	auipc	a1,0x2
      76:	fee58593          	addi	a1,a1,-18 # 2060 <schedule_edf_cbs+0x4ea>
      7a:	4509                	li	a0,2
      7c:	00001097          	auipc	ra,0x1
      80:	9ac080e7          	jalr	-1620(ra) # a28 <fprintf>
      break;
      84:	a831                	j	a0 <main+0xa0>
  for(i = 1; i < argc; i++){
      86:	fec42783          	lw	a5,-20(s0)
      8a:	2785                	addiw	a5,a5,1
      8c:	fef42623          	sw	a5,-20(s0)
      90:	fec42703          	lw	a4,-20(s0)
      94:	fdc42783          	lw	a5,-36(s0)
      98:	2701                	sext.w	a4,a4
      9a:	2781                	sext.w	a5,a5
      9c:	faf744e3          	blt	a4,a5,44 <main+0x44>
    }
  }

  exit(0);
      a0:	4501                	li	a0,0
      a2:	00000097          	auipc	ra,0x0
      a6:	498080e7          	jalr	1176(ra) # 53a <exit>

00000000000000aa <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      aa:	7179                	addi	sp,sp,-48
      ac:	f422                	sd	s0,40(sp)
      ae:	1800                	addi	s0,sp,48
      b0:	fca43c23          	sd	a0,-40(s0)
      b4:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      b8:	fd843783          	ld	a5,-40(s0)
      bc:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      c0:	0001                	nop
      c2:	fd043703          	ld	a4,-48(s0)
      c6:	00170793          	addi	a5,a4,1
      ca:	fcf43823          	sd	a5,-48(s0)
      ce:	fd843783          	ld	a5,-40(s0)
      d2:	00178693          	addi	a3,a5,1
      d6:	fcd43c23          	sd	a3,-40(s0)
      da:	00074703          	lbu	a4,0(a4)
      de:	00e78023          	sb	a4,0(a5)
      e2:	0007c783          	lbu	a5,0(a5)
      e6:	fff1                	bnez	a5,c2 <strcpy+0x18>
    ;
  return os;
      e8:	fe843783          	ld	a5,-24(s0)
}
      ec:	853e                	mv	a0,a5
      ee:	7422                	ld	s0,40(sp)
      f0:	6145                	addi	sp,sp,48
      f2:	8082                	ret

00000000000000f4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      f4:	1101                	addi	sp,sp,-32
      f6:	ec22                	sd	s0,24(sp)
      f8:	1000                	addi	s0,sp,32
      fa:	fea43423          	sd	a0,-24(s0)
      fe:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     102:	a819                	j	118 <strcmp+0x24>
    p++, q++;
     104:	fe843783          	ld	a5,-24(s0)
     108:	0785                	addi	a5,a5,1
     10a:	fef43423          	sd	a5,-24(s0)
     10e:	fe043783          	ld	a5,-32(s0)
     112:	0785                	addi	a5,a5,1
     114:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     118:	fe843783          	ld	a5,-24(s0)
     11c:	0007c783          	lbu	a5,0(a5)
     120:	cb99                	beqz	a5,136 <strcmp+0x42>
     122:	fe843783          	ld	a5,-24(s0)
     126:	0007c703          	lbu	a4,0(a5)
     12a:	fe043783          	ld	a5,-32(s0)
     12e:	0007c783          	lbu	a5,0(a5)
     132:	fcf709e3          	beq	a4,a5,104 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     136:	fe843783          	ld	a5,-24(s0)
     13a:	0007c783          	lbu	a5,0(a5)
     13e:	0007871b          	sext.w	a4,a5
     142:	fe043783          	ld	a5,-32(s0)
     146:	0007c783          	lbu	a5,0(a5)
     14a:	2781                	sext.w	a5,a5
     14c:	40f707bb          	subw	a5,a4,a5
     150:	2781                	sext.w	a5,a5
}
     152:	853e                	mv	a0,a5
     154:	6462                	ld	s0,24(sp)
     156:	6105                	addi	sp,sp,32
     158:	8082                	ret

000000000000015a <strlen>:

uint
strlen(const char *s)
{
     15a:	7179                	addi	sp,sp,-48
     15c:	f422                	sd	s0,40(sp)
     15e:	1800                	addi	s0,sp,48
     160:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     164:	fe042623          	sw	zero,-20(s0)
     168:	a031                	j	174 <strlen+0x1a>
     16a:	fec42783          	lw	a5,-20(s0)
     16e:	2785                	addiw	a5,a5,1
     170:	fef42623          	sw	a5,-20(s0)
     174:	fec42783          	lw	a5,-20(s0)
     178:	fd843703          	ld	a4,-40(s0)
     17c:	97ba                	add	a5,a5,a4
     17e:	0007c783          	lbu	a5,0(a5)
     182:	f7e5                	bnez	a5,16a <strlen+0x10>
    ;
  return n;
     184:	fec42783          	lw	a5,-20(s0)
}
     188:	853e                	mv	a0,a5
     18a:	7422                	ld	s0,40(sp)
     18c:	6145                	addi	sp,sp,48
     18e:	8082                	ret

0000000000000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
     190:	7179                	addi	sp,sp,-48
     192:	f422                	sd	s0,40(sp)
     194:	1800                	addi	s0,sp,48
     196:	fca43c23          	sd	a0,-40(s0)
     19a:	87ae                	mv	a5,a1
     19c:	8732                	mv	a4,a2
     19e:	fcf42a23          	sw	a5,-44(s0)
     1a2:	87ba                	mv	a5,a4
     1a4:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     1a8:	fd843783          	ld	a5,-40(s0)
     1ac:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     1b0:	fe042623          	sw	zero,-20(s0)
     1b4:	a00d                	j	1d6 <memset+0x46>
    cdst[i] = c;
     1b6:	fec42783          	lw	a5,-20(s0)
     1ba:	fe043703          	ld	a4,-32(s0)
     1be:	97ba                	add	a5,a5,a4
     1c0:	fd442703          	lw	a4,-44(s0)
     1c4:	0ff77713          	andi	a4,a4,255
     1c8:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1cc:	fec42783          	lw	a5,-20(s0)
     1d0:	2785                	addiw	a5,a5,1
     1d2:	fef42623          	sw	a5,-20(s0)
     1d6:	fec42703          	lw	a4,-20(s0)
     1da:	fd042783          	lw	a5,-48(s0)
     1de:	2781                	sext.w	a5,a5
     1e0:	fcf76be3          	bltu	a4,a5,1b6 <memset+0x26>
  }
  return dst;
     1e4:	fd843783          	ld	a5,-40(s0)
}
     1e8:	853e                	mv	a0,a5
     1ea:	7422                	ld	s0,40(sp)
     1ec:	6145                	addi	sp,sp,48
     1ee:	8082                	ret

00000000000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
     1f0:	1101                	addi	sp,sp,-32
     1f2:	ec22                	sd	s0,24(sp)
     1f4:	1000                	addi	s0,sp,32
     1f6:	fea43423          	sd	a0,-24(s0)
     1fa:	87ae                	mv	a5,a1
     1fc:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     200:	a01d                	j	226 <strchr+0x36>
    if(*s == c)
     202:	fe843783          	ld	a5,-24(s0)
     206:	0007c703          	lbu	a4,0(a5)
     20a:	fe744783          	lbu	a5,-25(s0)
     20e:	0ff7f793          	andi	a5,a5,255
     212:	00e79563          	bne	a5,a4,21c <strchr+0x2c>
      return (char*)s;
     216:	fe843783          	ld	a5,-24(s0)
     21a:	a821                	j	232 <strchr+0x42>
  for(; *s; s++)
     21c:	fe843783          	ld	a5,-24(s0)
     220:	0785                	addi	a5,a5,1
     222:	fef43423          	sd	a5,-24(s0)
     226:	fe843783          	ld	a5,-24(s0)
     22a:	0007c783          	lbu	a5,0(a5)
     22e:	fbf1                	bnez	a5,202 <strchr+0x12>
  return 0;
     230:	4781                	li	a5,0
}
     232:	853e                	mv	a0,a5
     234:	6462                	ld	s0,24(sp)
     236:	6105                	addi	sp,sp,32
     238:	8082                	ret

000000000000023a <gets>:

char*
gets(char *buf, int max)
{
     23a:	7179                	addi	sp,sp,-48
     23c:	f406                	sd	ra,40(sp)
     23e:	f022                	sd	s0,32(sp)
     240:	1800                	addi	s0,sp,48
     242:	fca43c23          	sd	a0,-40(s0)
     246:	87ae                	mv	a5,a1
     248:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     24c:	fe042623          	sw	zero,-20(s0)
     250:	a8a1                	j	2a8 <gets+0x6e>
    cc = read(0, &c, 1);
     252:	fe740793          	addi	a5,s0,-25
     256:	4605                	li	a2,1
     258:	85be                	mv	a1,a5
     25a:	4501                	li	a0,0
     25c:	00000097          	auipc	ra,0x0
     260:	2f6080e7          	jalr	758(ra) # 552 <read>
     264:	87aa                	mv	a5,a0
     266:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     26a:	fe842783          	lw	a5,-24(s0)
     26e:	2781                	sext.w	a5,a5
     270:	04f05763          	blez	a5,2be <gets+0x84>
      break;
    buf[i++] = c;
     274:	fec42783          	lw	a5,-20(s0)
     278:	0017871b          	addiw	a4,a5,1
     27c:	fee42623          	sw	a4,-20(s0)
     280:	873e                	mv	a4,a5
     282:	fd843783          	ld	a5,-40(s0)
     286:	97ba                	add	a5,a5,a4
     288:	fe744703          	lbu	a4,-25(s0)
     28c:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     290:	fe744783          	lbu	a5,-25(s0)
     294:	873e                	mv	a4,a5
     296:	47a9                	li	a5,10
     298:	02f70463          	beq	a4,a5,2c0 <gets+0x86>
     29c:	fe744783          	lbu	a5,-25(s0)
     2a0:	873e                	mv	a4,a5
     2a2:	47b5                	li	a5,13
     2a4:	00f70e63          	beq	a4,a5,2c0 <gets+0x86>
  for(i=0; i+1 < max; ){
     2a8:	fec42783          	lw	a5,-20(s0)
     2ac:	2785                	addiw	a5,a5,1
     2ae:	0007871b          	sext.w	a4,a5
     2b2:	fd442783          	lw	a5,-44(s0)
     2b6:	2781                	sext.w	a5,a5
     2b8:	f8f74de3          	blt	a4,a5,252 <gets+0x18>
     2bc:	a011                	j	2c0 <gets+0x86>
      break;
     2be:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2c0:	fec42783          	lw	a5,-20(s0)
     2c4:	fd843703          	ld	a4,-40(s0)
     2c8:	97ba                	add	a5,a5,a4
     2ca:	00078023          	sb	zero,0(a5)
  return buf;
     2ce:	fd843783          	ld	a5,-40(s0)
}
     2d2:	853e                	mv	a0,a5
     2d4:	70a2                	ld	ra,40(sp)
     2d6:	7402                	ld	s0,32(sp)
     2d8:	6145                	addi	sp,sp,48
     2da:	8082                	ret

00000000000002dc <stat>:

int
stat(const char *n, struct stat *st)
{
     2dc:	7179                	addi	sp,sp,-48
     2de:	f406                	sd	ra,40(sp)
     2e0:	f022                	sd	s0,32(sp)
     2e2:	1800                	addi	s0,sp,48
     2e4:	fca43c23          	sd	a0,-40(s0)
     2e8:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2ec:	4581                	li	a1,0
     2ee:	fd843503          	ld	a0,-40(s0)
     2f2:	00000097          	auipc	ra,0x0
     2f6:	288080e7          	jalr	648(ra) # 57a <open>
     2fa:	87aa                	mv	a5,a0
     2fc:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     300:	fec42783          	lw	a5,-20(s0)
     304:	2781                	sext.w	a5,a5
     306:	0007d463          	bgez	a5,30e <stat+0x32>
    return -1;
     30a:	57fd                	li	a5,-1
     30c:	a035                	j	338 <stat+0x5c>
  r = fstat(fd, st);
     30e:	fec42783          	lw	a5,-20(s0)
     312:	fd043583          	ld	a1,-48(s0)
     316:	853e                	mv	a0,a5
     318:	00000097          	auipc	ra,0x0
     31c:	27a080e7          	jalr	634(ra) # 592 <fstat>
     320:	87aa                	mv	a5,a0
     322:	fef42423          	sw	a5,-24(s0)
  close(fd);
     326:	fec42783          	lw	a5,-20(s0)
     32a:	853e                	mv	a0,a5
     32c:	00000097          	auipc	ra,0x0
     330:	236080e7          	jalr	566(ra) # 562 <close>
  return r;
     334:	fe842783          	lw	a5,-24(s0)
}
     338:	853e                	mv	a0,a5
     33a:	70a2                	ld	ra,40(sp)
     33c:	7402                	ld	s0,32(sp)
     33e:	6145                	addi	sp,sp,48
     340:	8082                	ret

0000000000000342 <atoi>:

int
atoi(const char *s)
{
     342:	7179                	addi	sp,sp,-48
     344:	f422                	sd	s0,40(sp)
     346:	1800                	addi	s0,sp,48
     348:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     34c:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     350:	a815                	j	384 <atoi+0x42>
    n = n*10 + *s++ - '0';
     352:	fec42703          	lw	a4,-20(s0)
     356:	87ba                	mv	a5,a4
     358:	0027979b          	slliw	a5,a5,0x2
     35c:	9fb9                	addw	a5,a5,a4
     35e:	0017979b          	slliw	a5,a5,0x1
     362:	0007871b          	sext.w	a4,a5
     366:	fd843783          	ld	a5,-40(s0)
     36a:	00178693          	addi	a3,a5,1
     36e:	fcd43c23          	sd	a3,-40(s0)
     372:	0007c783          	lbu	a5,0(a5)
     376:	2781                	sext.w	a5,a5
     378:	9fb9                	addw	a5,a5,a4
     37a:	2781                	sext.w	a5,a5
     37c:	fd07879b          	addiw	a5,a5,-48
     380:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     384:	fd843783          	ld	a5,-40(s0)
     388:	0007c783          	lbu	a5,0(a5)
     38c:	873e                	mv	a4,a5
     38e:	02f00793          	li	a5,47
     392:	00e7fb63          	bgeu	a5,a4,3a8 <atoi+0x66>
     396:	fd843783          	ld	a5,-40(s0)
     39a:	0007c783          	lbu	a5,0(a5)
     39e:	873e                	mv	a4,a5
     3a0:	03900793          	li	a5,57
     3a4:	fae7f7e3          	bgeu	a5,a4,352 <atoi+0x10>
  return n;
     3a8:	fec42783          	lw	a5,-20(s0)
}
     3ac:	853e                	mv	a0,a5
     3ae:	7422                	ld	s0,40(sp)
     3b0:	6145                	addi	sp,sp,48
     3b2:	8082                	ret

00000000000003b4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     3b4:	7139                	addi	sp,sp,-64
     3b6:	fc22                	sd	s0,56(sp)
     3b8:	0080                	addi	s0,sp,64
     3ba:	fca43c23          	sd	a0,-40(s0)
     3be:	fcb43823          	sd	a1,-48(s0)
     3c2:	87b2                	mv	a5,a2
     3c4:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3c8:	fd843783          	ld	a5,-40(s0)
     3cc:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3d0:	fd043783          	ld	a5,-48(s0)
     3d4:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3d8:	fe043703          	ld	a4,-32(s0)
     3dc:	fe843783          	ld	a5,-24(s0)
     3e0:	02e7fc63          	bgeu	a5,a4,418 <memmove+0x64>
    while(n-- > 0)
     3e4:	a00d                	j	406 <memmove+0x52>
      *dst++ = *src++;
     3e6:	fe043703          	ld	a4,-32(s0)
     3ea:	00170793          	addi	a5,a4,1
     3ee:	fef43023          	sd	a5,-32(s0)
     3f2:	fe843783          	ld	a5,-24(s0)
     3f6:	00178693          	addi	a3,a5,1
     3fa:	fed43423          	sd	a3,-24(s0)
     3fe:	00074703          	lbu	a4,0(a4)
     402:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     406:	fcc42783          	lw	a5,-52(s0)
     40a:	fff7871b          	addiw	a4,a5,-1
     40e:	fce42623          	sw	a4,-52(s0)
     412:	fcf04ae3          	bgtz	a5,3e6 <memmove+0x32>
     416:	a891                	j	46a <memmove+0xb6>
  } else {
    dst += n;
     418:	fcc42783          	lw	a5,-52(s0)
     41c:	fe843703          	ld	a4,-24(s0)
     420:	97ba                	add	a5,a5,a4
     422:	fef43423          	sd	a5,-24(s0)
    src += n;
     426:	fcc42783          	lw	a5,-52(s0)
     42a:	fe043703          	ld	a4,-32(s0)
     42e:	97ba                	add	a5,a5,a4
     430:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     434:	a01d                	j	45a <memmove+0xa6>
      *--dst = *--src;
     436:	fe043783          	ld	a5,-32(s0)
     43a:	17fd                	addi	a5,a5,-1
     43c:	fef43023          	sd	a5,-32(s0)
     440:	fe843783          	ld	a5,-24(s0)
     444:	17fd                	addi	a5,a5,-1
     446:	fef43423          	sd	a5,-24(s0)
     44a:	fe043783          	ld	a5,-32(s0)
     44e:	0007c703          	lbu	a4,0(a5)
     452:	fe843783          	ld	a5,-24(s0)
     456:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     45a:	fcc42783          	lw	a5,-52(s0)
     45e:	fff7871b          	addiw	a4,a5,-1
     462:	fce42623          	sw	a4,-52(s0)
     466:	fcf048e3          	bgtz	a5,436 <memmove+0x82>
  }
  return vdst;
     46a:	fd843783          	ld	a5,-40(s0)
}
     46e:	853e                	mv	a0,a5
     470:	7462                	ld	s0,56(sp)
     472:	6121                	addi	sp,sp,64
     474:	8082                	ret

0000000000000476 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     476:	7139                	addi	sp,sp,-64
     478:	fc22                	sd	s0,56(sp)
     47a:	0080                	addi	s0,sp,64
     47c:	fca43c23          	sd	a0,-40(s0)
     480:	fcb43823          	sd	a1,-48(s0)
     484:	87b2                	mv	a5,a2
     486:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     48a:	fd843783          	ld	a5,-40(s0)
     48e:	fef43423          	sd	a5,-24(s0)
     492:	fd043783          	ld	a5,-48(s0)
     496:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     49a:	a0a1                	j	4e2 <memcmp+0x6c>
    if (*p1 != *p2) {
     49c:	fe843783          	ld	a5,-24(s0)
     4a0:	0007c703          	lbu	a4,0(a5)
     4a4:	fe043783          	ld	a5,-32(s0)
     4a8:	0007c783          	lbu	a5,0(a5)
     4ac:	02f70163          	beq	a4,a5,4ce <memcmp+0x58>
      return *p1 - *p2;
     4b0:	fe843783          	ld	a5,-24(s0)
     4b4:	0007c783          	lbu	a5,0(a5)
     4b8:	0007871b          	sext.w	a4,a5
     4bc:	fe043783          	ld	a5,-32(s0)
     4c0:	0007c783          	lbu	a5,0(a5)
     4c4:	2781                	sext.w	a5,a5
     4c6:	40f707bb          	subw	a5,a4,a5
     4ca:	2781                	sext.w	a5,a5
     4cc:	a01d                	j	4f2 <memcmp+0x7c>
    }
    p1++;
     4ce:	fe843783          	ld	a5,-24(s0)
     4d2:	0785                	addi	a5,a5,1
     4d4:	fef43423          	sd	a5,-24(s0)
    p2++;
     4d8:	fe043783          	ld	a5,-32(s0)
     4dc:	0785                	addi	a5,a5,1
     4de:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4e2:	fcc42783          	lw	a5,-52(s0)
     4e6:	fff7871b          	addiw	a4,a5,-1
     4ea:	fce42623          	sw	a4,-52(s0)
     4ee:	f7dd                	bnez	a5,49c <memcmp+0x26>
  }
  return 0;
     4f0:	4781                	li	a5,0
}
     4f2:	853e                	mv	a0,a5
     4f4:	7462                	ld	s0,56(sp)
     4f6:	6121                	addi	sp,sp,64
     4f8:	8082                	ret

00000000000004fa <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4fa:	7179                	addi	sp,sp,-48
     4fc:	f406                	sd	ra,40(sp)
     4fe:	f022                	sd	s0,32(sp)
     500:	1800                	addi	s0,sp,48
     502:	fea43423          	sd	a0,-24(s0)
     506:	feb43023          	sd	a1,-32(s0)
     50a:	87b2                	mv	a5,a2
     50c:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     510:	fdc42783          	lw	a5,-36(s0)
     514:	863e                	mv	a2,a5
     516:	fe043583          	ld	a1,-32(s0)
     51a:	fe843503          	ld	a0,-24(s0)
     51e:	00000097          	auipc	ra,0x0
     522:	e96080e7          	jalr	-362(ra) # 3b4 <memmove>
     526:	87aa                	mv	a5,a0
}
     528:	853e                	mv	a0,a5
     52a:	70a2                	ld	ra,40(sp)
     52c:	7402                	ld	s0,32(sp)
     52e:	6145                	addi	sp,sp,48
     530:	8082                	ret

0000000000000532 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     532:	4885                	li	a7,1
 ecall
     534:	00000073          	ecall
 ret
     538:	8082                	ret

000000000000053a <exit>:
.global exit
exit:
 li a7, SYS_exit
     53a:	4889                	li	a7,2
 ecall
     53c:	00000073          	ecall
 ret
     540:	8082                	ret

0000000000000542 <wait>:
.global wait
wait:
 li a7, SYS_wait
     542:	488d                	li	a7,3
 ecall
     544:	00000073          	ecall
 ret
     548:	8082                	ret

000000000000054a <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     54a:	4891                	li	a7,4
 ecall
     54c:	00000073          	ecall
 ret
     550:	8082                	ret

0000000000000552 <read>:
.global read
read:
 li a7, SYS_read
     552:	4895                	li	a7,5
 ecall
     554:	00000073          	ecall
 ret
     558:	8082                	ret

000000000000055a <write>:
.global write
write:
 li a7, SYS_write
     55a:	48c1                	li	a7,16
 ecall
     55c:	00000073          	ecall
 ret
     560:	8082                	ret

0000000000000562 <close>:
.global close
close:
 li a7, SYS_close
     562:	48d5                	li	a7,21
 ecall
     564:	00000073          	ecall
 ret
     568:	8082                	ret

000000000000056a <kill>:
.global kill
kill:
 li a7, SYS_kill
     56a:	4899                	li	a7,6
 ecall
     56c:	00000073          	ecall
 ret
     570:	8082                	ret

0000000000000572 <exec>:
.global exec
exec:
 li a7, SYS_exec
     572:	489d                	li	a7,7
 ecall
     574:	00000073          	ecall
 ret
     578:	8082                	ret

000000000000057a <open>:
.global open
open:
 li a7, SYS_open
     57a:	48bd                	li	a7,15
 ecall
     57c:	00000073          	ecall
 ret
     580:	8082                	ret

0000000000000582 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     582:	48c5                	li	a7,17
 ecall
     584:	00000073          	ecall
 ret
     588:	8082                	ret

000000000000058a <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     58a:	48c9                	li	a7,18
 ecall
     58c:	00000073          	ecall
 ret
     590:	8082                	ret

0000000000000592 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     592:	48a1                	li	a7,8
 ecall
     594:	00000073          	ecall
 ret
     598:	8082                	ret

000000000000059a <link>:
.global link
link:
 li a7, SYS_link
     59a:	48cd                	li	a7,19
 ecall
     59c:	00000073          	ecall
 ret
     5a0:	8082                	ret

00000000000005a2 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     5a2:	48d1                	li	a7,20
 ecall
     5a4:	00000073          	ecall
 ret
     5a8:	8082                	ret

00000000000005aa <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     5aa:	48a5                	li	a7,9
 ecall
     5ac:	00000073          	ecall
 ret
     5b0:	8082                	ret

00000000000005b2 <dup>:
.global dup
dup:
 li a7, SYS_dup
     5b2:	48a9                	li	a7,10
 ecall
     5b4:	00000073          	ecall
 ret
     5b8:	8082                	ret

00000000000005ba <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     5ba:	48ad                	li	a7,11
 ecall
     5bc:	00000073          	ecall
 ret
     5c0:	8082                	ret

00000000000005c2 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5c2:	48b1                	li	a7,12
 ecall
     5c4:	00000073          	ecall
 ret
     5c8:	8082                	ret

00000000000005ca <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5ca:	48b5                	li	a7,13
 ecall
     5cc:	00000073          	ecall
 ret
     5d0:	8082                	ret

00000000000005d2 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5d2:	48b9                	li	a7,14
 ecall
     5d4:	00000073          	ecall
 ret
     5d8:	8082                	ret

00000000000005da <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5da:	48d9                	li	a7,22
 ecall
     5dc:	00000073          	ecall
 ret
     5e0:	8082                	ret

00000000000005e2 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5e2:	48dd                	li	a7,23
 ecall
     5e4:	00000073          	ecall
 ret
     5e8:	8082                	ret

00000000000005ea <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5ea:	48e1                	li	a7,24
 ecall
     5ec:	00000073          	ecall
 ret
     5f0:	8082                	ret

00000000000005f2 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5f2:	1101                	addi	sp,sp,-32
     5f4:	ec06                	sd	ra,24(sp)
     5f6:	e822                	sd	s0,16(sp)
     5f8:	1000                	addi	s0,sp,32
     5fa:	87aa                	mv	a5,a0
     5fc:	872e                	mv	a4,a1
     5fe:	fef42623          	sw	a5,-20(s0)
     602:	87ba                	mv	a5,a4
     604:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     608:	feb40713          	addi	a4,s0,-21
     60c:	fec42783          	lw	a5,-20(s0)
     610:	4605                	li	a2,1
     612:	85ba                	mv	a1,a4
     614:	853e                	mv	a0,a5
     616:	00000097          	auipc	ra,0x0
     61a:	f44080e7          	jalr	-188(ra) # 55a <write>
}
     61e:	0001                	nop
     620:	60e2                	ld	ra,24(sp)
     622:	6442                	ld	s0,16(sp)
     624:	6105                	addi	sp,sp,32
     626:	8082                	ret

0000000000000628 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     628:	7139                	addi	sp,sp,-64
     62a:	fc06                	sd	ra,56(sp)
     62c:	f822                	sd	s0,48(sp)
     62e:	0080                	addi	s0,sp,64
     630:	87aa                	mv	a5,a0
     632:	8736                	mv	a4,a3
     634:	fcf42623          	sw	a5,-52(s0)
     638:	87ae                	mv	a5,a1
     63a:	fcf42423          	sw	a5,-56(s0)
     63e:	87b2                	mv	a5,a2
     640:	fcf42223          	sw	a5,-60(s0)
     644:	87ba                	mv	a5,a4
     646:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     64a:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     64e:	fc042783          	lw	a5,-64(s0)
     652:	2781                	sext.w	a5,a5
     654:	c38d                	beqz	a5,676 <printint+0x4e>
     656:	fc842783          	lw	a5,-56(s0)
     65a:	2781                	sext.w	a5,a5
     65c:	0007dd63          	bgez	a5,676 <printint+0x4e>
    neg = 1;
     660:	4785                	li	a5,1
     662:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     666:	fc842783          	lw	a5,-56(s0)
     66a:	40f007bb          	negw	a5,a5
     66e:	2781                	sext.w	a5,a5
     670:	fef42223          	sw	a5,-28(s0)
     674:	a029                	j	67e <printint+0x56>
  } else {
    x = xx;
     676:	fc842783          	lw	a5,-56(s0)
     67a:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     67e:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     682:	fc442783          	lw	a5,-60(s0)
     686:	fe442703          	lw	a4,-28(s0)
     68a:	02f777bb          	remuw	a5,a4,a5
     68e:	0007861b          	sext.w	a2,a5
     692:	fec42783          	lw	a5,-20(s0)
     696:	0017871b          	addiw	a4,a5,1
     69a:	fee42623          	sw	a4,-20(s0)
     69e:	00002697          	auipc	a3,0x2
     6a2:	c6268693          	addi	a3,a3,-926 # 2300 <digits>
     6a6:	02061713          	slli	a4,a2,0x20
     6aa:	9301                	srli	a4,a4,0x20
     6ac:	9736                	add	a4,a4,a3
     6ae:	00074703          	lbu	a4,0(a4)
     6b2:	ff040693          	addi	a3,s0,-16
     6b6:	97b6                	add	a5,a5,a3
     6b8:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     6bc:	fc442783          	lw	a5,-60(s0)
     6c0:	fe442703          	lw	a4,-28(s0)
     6c4:	02f757bb          	divuw	a5,a4,a5
     6c8:	fef42223          	sw	a5,-28(s0)
     6cc:	fe442783          	lw	a5,-28(s0)
     6d0:	2781                	sext.w	a5,a5
     6d2:	fbc5                	bnez	a5,682 <printint+0x5a>
  if(neg)
     6d4:	fe842783          	lw	a5,-24(s0)
     6d8:	2781                	sext.w	a5,a5
     6da:	cf95                	beqz	a5,716 <printint+0xee>
    buf[i++] = '-';
     6dc:	fec42783          	lw	a5,-20(s0)
     6e0:	0017871b          	addiw	a4,a5,1
     6e4:	fee42623          	sw	a4,-20(s0)
     6e8:	ff040713          	addi	a4,s0,-16
     6ec:	97ba                	add	a5,a5,a4
     6ee:	02d00713          	li	a4,45
     6f2:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6f6:	a005                	j	716 <printint+0xee>
    putc(fd, buf[i]);
     6f8:	fec42783          	lw	a5,-20(s0)
     6fc:	ff040713          	addi	a4,s0,-16
     700:	97ba                	add	a5,a5,a4
     702:	fe07c703          	lbu	a4,-32(a5)
     706:	fcc42783          	lw	a5,-52(s0)
     70a:	85ba                	mv	a1,a4
     70c:	853e                	mv	a0,a5
     70e:	00000097          	auipc	ra,0x0
     712:	ee4080e7          	jalr	-284(ra) # 5f2 <putc>
  while(--i >= 0)
     716:	fec42783          	lw	a5,-20(s0)
     71a:	37fd                	addiw	a5,a5,-1
     71c:	fef42623          	sw	a5,-20(s0)
     720:	fec42783          	lw	a5,-20(s0)
     724:	2781                	sext.w	a5,a5
     726:	fc07d9e3          	bgez	a5,6f8 <printint+0xd0>
}
     72a:	0001                	nop
     72c:	0001                	nop
     72e:	70e2                	ld	ra,56(sp)
     730:	7442                	ld	s0,48(sp)
     732:	6121                	addi	sp,sp,64
     734:	8082                	ret

0000000000000736 <printptr>:

static void
printptr(int fd, uint64 x) {
     736:	7179                	addi	sp,sp,-48
     738:	f406                	sd	ra,40(sp)
     73a:	f022                	sd	s0,32(sp)
     73c:	1800                	addi	s0,sp,48
     73e:	87aa                	mv	a5,a0
     740:	fcb43823          	sd	a1,-48(s0)
     744:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     748:	fdc42783          	lw	a5,-36(s0)
     74c:	03000593          	li	a1,48
     750:	853e                	mv	a0,a5
     752:	00000097          	auipc	ra,0x0
     756:	ea0080e7          	jalr	-352(ra) # 5f2 <putc>
  putc(fd, 'x');
     75a:	fdc42783          	lw	a5,-36(s0)
     75e:	07800593          	li	a1,120
     762:	853e                	mv	a0,a5
     764:	00000097          	auipc	ra,0x0
     768:	e8e080e7          	jalr	-370(ra) # 5f2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     76c:	fe042623          	sw	zero,-20(s0)
     770:	a82d                	j	7aa <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     772:	fd043783          	ld	a5,-48(s0)
     776:	93f1                	srli	a5,a5,0x3c
     778:	00002717          	auipc	a4,0x2
     77c:	b8870713          	addi	a4,a4,-1144 # 2300 <digits>
     780:	97ba                	add	a5,a5,a4
     782:	0007c703          	lbu	a4,0(a5)
     786:	fdc42783          	lw	a5,-36(s0)
     78a:	85ba                	mv	a1,a4
     78c:	853e                	mv	a0,a5
     78e:	00000097          	auipc	ra,0x0
     792:	e64080e7          	jalr	-412(ra) # 5f2 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     796:	fec42783          	lw	a5,-20(s0)
     79a:	2785                	addiw	a5,a5,1
     79c:	fef42623          	sw	a5,-20(s0)
     7a0:	fd043783          	ld	a5,-48(s0)
     7a4:	0792                	slli	a5,a5,0x4
     7a6:	fcf43823          	sd	a5,-48(s0)
     7aa:	fec42783          	lw	a5,-20(s0)
     7ae:	873e                	mv	a4,a5
     7b0:	47bd                	li	a5,15
     7b2:	fce7f0e3          	bgeu	a5,a4,772 <printptr+0x3c>
}
     7b6:	0001                	nop
     7b8:	0001                	nop
     7ba:	70a2                	ld	ra,40(sp)
     7bc:	7402                	ld	s0,32(sp)
     7be:	6145                	addi	sp,sp,48
     7c0:	8082                	ret

00000000000007c2 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7c2:	715d                	addi	sp,sp,-80
     7c4:	e486                	sd	ra,72(sp)
     7c6:	e0a2                	sd	s0,64(sp)
     7c8:	0880                	addi	s0,sp,80
     7ca:	87aa                	mv	a5,a0
     7cc:	fcb43023          	sd	a1,-64(s0)
     7d0:	fac43c23          	sd	a2,-72(s0)
     7d4:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7d8:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7dc:	fe042223          	sw	zero,-28(s0)
     7e0:	a42d                	j	a0a <vprintf+0x248>
    c = fmt[i] & 0xff;
     7e2:	fe442783          	lw	a5,-28(s0)
     7e6:	fc043703          	ld	a4,-64(s0)
     7ea:	97ba                	add	a5,a5,a4
     7ec:	0007c783          	lbu	a5,0(a5)
     7f0:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7f4:	fe042783          	lw	a5,-32(s0)
     7f8:	2781                	sext.w	a5,a5
     7fa:	eb9d                	bnez	a5,830 <vprintf+0x6e>
      if(c == '%'){
     7fc:	fdc42783          	lw	a5,-36(s0)
     800:	0007871b          	sext.w	a4,a5
     804:	02500793          	li	a5,37
     808:	00f71763          	bne	a4,a5,816 <vprintf+0x54>
        state = '%';
     80c:	02500793          	li	a5,37
     810:	fef42023          	sw	a5,-32(s0)
     814:	a2f5                	j	a00 <vprintf+0x23e>
      } else {
        putc(fd, c);
     816:	fdc42783          	lw	a5,-36(s0)
     81a:	0ff7f713          	andi	a4,a5,255
     81e:	fcc42783          	lw	a5,-52(s0)
     822:	85ba                	mv	a1,a4
     824:	853e                	mv	a0,a5
     826:	00000097          	auipc	ra,0x0
     82a:	dcc080e7          	jalr	-564(ra) # 5f2 <putc>
     82e:	aac9                	j	a00 <vprintf+0x23e>
      }
    } else if(state == '%'){
     830:	fe042783          	lw	a5,-32(s0)
     834:	0007871b          	sext.w	a4,a5
     838:	02500793          	li	a5,37
     83c:	1cf71263          	bne	a4,a5,a00 <vprintf+0x23e>
      if(c == 'd'){
     840:	fdc42783          	lw	a5,-36(s0)
     844:	0007871b          	sext.w	a4,a5
     848:	06400793          	li	a5,100
     84c:	02f71463          	bne	a4,a5,874 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     850:	fb843783          	ld	a5,-72(s0)
     854:	00878713          	addi	a4,a5,8
     858:	fae43c23          	sd	a4,-72(s0)
     85c:	4398                	lw	a4,0(a5)
     85e:	fcc42783          	lw	a5,-52(s0)
     862:	4685                	li	a3,1
     864:	4629                	li	a2,10
     866:	85ba                	mv	a1,a4
     868:	853e                	mv	a0,a5
     86a:	00000097          	auipc	ra,0x0
     86e:	dbe080e7          	jalr	-578(ra) # 628 <printint>
     872:	a269                	j	9fc <vprintf+0x23a>
      } else if(c == 'l') {
     874:	fdc42783          	lw	a5,-36(s0)
     878:	0007871b          	sext.w	a4,a5
     87c:	06c00793          	li	a5,108
     880:	02f71663          	bne	a4,a5,8ac <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     884:	fb843783          	ld	a5,-72(s0)
     888:	00878713          	addi	a4,a5,8
     88c:	fae43c23          	sd	a4,-72(s0)
     890:	639c                	ld	a5,0(a5)
     892:	0007871b          	sext.w	a4,a5
     896:	fcc42783          	lw	a5,-52(s0)
     89a:	4681                	li	a3,0
     89c:	4629                	li	a2,10
     89e:	85ba                	mv	a1,a4
     8a0:	853e                	mv	a0,a5
     8a2:	00000097          	auipc	ra,0x0
     8a6:	d86080e7          	jalr	-634(ra) # 628 <printint>
     8aa:	aa89                	j	9fc <vprintf+0x23a>
      } else if(c == 'x') {
     8ac:	fdc42783          	lw	a5,-36(s0)
     8b0:	0007871b          	sext.w	a4,a5
     8b4:	07800793          	li	a5,120
     8b8:	02f71463          	bne	a4,a5,8e0 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     8bc:	fb843783          	ld	a5,-72(s0)
     8c0:	00878713          	addi	a4,a5,8
     8c4:	fae43c23          	sd	a4,-72(s0)
     8c8:	4398                	lw	a4,0(a5)
     8ca:	fcc42783          	lw	a5,-52(s0)
     8ce:	4681                	li	a3,0
     8d0:	4641                	li	a2,16
     8d2:	85ba                	mv	a1,a4
     8d4:	853e                	mv	a0,a5
     8d6:	00000097          	auipc	ra,0x0
     8da:	d52080e7          	jalr	-686(ra) # 628 <printint>
     8de:	aa39                	j	9fc <vprintf+0x23a>
      } else if(c == 'p') {
     8e0:	fdc42783          	lw	a5,-36(s0)
     8e4:	0007871b          	sext.w	a4,a5
     8e8:	07000793          	li	a5,112
     8ec:	02f71263          	bne	a4,a5,910 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8f0:	fb843783          	ld	a5,-72(s0)
     8f4:	00878713          	addi	a4,a5,8
     8f8:	fae43c23          	sd	a4,-72(s0)
     8fc:	6398                	ld	a4,0(a5)
     8fe:	fcc42783          	lw	a5,-52(s0)
     902:	85ba                	mv	a1,a4
     904:	853e                	mv	a0,a5
     906:	00000097          	auipc	ra,0x0
     90a:	e30080e7          	jalr	-464(ra) # 736 <printptr>
     90e:	a0fd                	j	9fc <vprintf+0x23a>
      } else if(c == 's'){
     910:	fdc42783          	lw	a5,-36(s0)
     914:	0007871b          	sext.w	a4,a5
     918:	07300793          	li	a5,115
     91c:	04f71c63          	bne	a4,a5,974 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     920:	fb843783          	ld	a5,-72(s0)
     924:	00878713          	addi	a4,a5,8
     928:	fae43c23          	sd	a4,-72(s0)
     92c:	639c                	ld	a5,0(a5)
     92e:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     932:	fe843783          	ld	a5,-24(s0)
     936:	eb8d                	bnez	a5,968 <vprintf+0x1a6>
          s = "(null)";
     938:	00001797          	auipc	a5,0x1
     93c:	74878793          	addi	a5,a5,1864 # 2080 <schedule_edf_cbs+0x50a>
     940:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     944:	a015                	j	968 <vprintf+0x1a6>
          putc(fd, *s);
     946:	fe843783          	ld	a5,-24(s0)
     94a:	0007c703          	lbu	a4,0(a5)
     94e:	fcc42783          	lw	a5,-52(s0)
     952:	85ba                	mv	a1,a4
     954:	853e                	mv	a0,a5
     956:	00000097          	auipc	ra,0x0
     95a:	c9c080e7          	jalr	-868(ra) # 5f2 <putc>
          s++;
     95e:	fe843783          	ld	a5,-24(s0)
     962:	0785                	addi	a5,a5,1
     964:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     968:	fe843783          	ld	a5,-24(s0)
     96c:	0007c783          	lbu	a5,0(a5)
     970:	fbf9                	bnez	a5,946 <vprintf+0x184>
     972:	a069                	j	9fc <vprintf+0x23a>
        }
      } else if(c == 'c'){
     974:	fdc42783          	lw	a5,-36(s0)
     978:	0007871b          	sext.w	a4,a5
     97c:	06300793          	li	a5,99
     980:	02f71463          	bne	a4,a5,9a8 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     984:	fb843783          	ld	a5,-72(s0)
     988:	00878713          	addi	a4,a5,8
     98c:	fae43c23          	sd	a4,-72(s0)
     990:	439c                	lw	a5,0(a5)
     992:	0ff7f713          	andi	a4,a5,255
     996:	fcc42783          	lw	a5,-52(s0)
     99a:	85ba                	mv	a1,a4
     99c:	853e                	mv	a0,a5
     99e:	00000097          	auipc	ra,0x0
     9a2:	c54080e7          	jalr	-940(ra) # 5f2 <putc>
     9a6:	a899                	j	9fc <vprintf+0x23a>
      } else if(c == '%'){
     9a8:	fdc42783          	lw	a5,-36(s0)
     9ac:	0007871b          	sext.w	a4,a5
     9b0:	02500793          	li	a5,37
     9b4:	00f71f63          	bne	a4,a5,9d2 <vprintf+0x210>
        putc(fd, c);
     9b8:	fdc42783          	lw	a5,-36(s0)
     9bc:	0ff7f713          	andi	a4,a5,255
     9c0:	fcc42783          	lw	a5,-52(s0)
     9c4:	85ba                	mv	a1,a4
     9c6:	853e                	mv	a0,a5
     9c8:	00000097          	auipc	ra,0x0
     9cc:	c2a080e7          	jalr	-982(ra) # 5f2 <putc>
     9d0:	a035                	j	9fc <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9d2:	fcc42783          	lw	a5,-52(s0)
     9d6:	02500593          	li	a1,37
     9da:	853e                	mv	a0,a5
     9dc:	00000097          	auipc	ra,0x0
     9e0:	c16080e7          	jalr	-1002(ra) # 5f2 <putc>
        putc(fd, c);
     9e4:	fdc42783          	lw	a5,-36(s0)
     9e8:	0ff7f713          	andi	a4,a5,255
     9ec:	fcc42783          	lw	a5,-52(s0)
     9f0:	85ba                	mv	a1,a4
     9f2:	853e                	mv	a0,a5
     9f4:	00000097          	auipc	ra,0x0
     9f8:	bfe080e7          	jalr	-1026(ra) # 5f2 <putc>
      }
      state = 0;
     9fc:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a00:	fe442783          	lw	a5,-28(s0)
     a04:	2785                	addiw	a5,a5,1
     a06:	fef42223          	sw	a5,-28(s0)
     a0a:	fe442783          	lw	a5,-28(s0)
     a0e:	fc043703          	ld	a4,-64(s0)
     a12:	97ba                	add	a5,a5,a4
     a14:	0007c783          	lbu	a5,0(a5)
     a18:	dc0795e3          	bnez	a5,7e2 <vprintf+0x20>
    }
  }
}
     a1c:	0001                	nop
     a1e:	0001                	nop
     a20:	60a6                	ld	ra,72(sp)
     a22:	6406                	ld	s0,64(sp)
     a24:	6161                	addi	sp,sp,80
     a26:	8082                	ret

0000000000000a28 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a28:	7159                	addi	sp,sp,-112
     a2a:	fc06                	sd	ra,56(sp)
     a2c:	f822                	sd	s0,48(sp)
     a2e:	0080                	addi	s0,sp,64
     a30:	fcb43823          	sd	a1,-48(s0)
     a34:	e010                	sd	a2,0(s0)
     a36:	e414                	sd	a3,8(s0)
     a38:	e818                	sd	a4,16(s0)
     a3a:	ec1c                	sd	a5,24(s0)
     a3c:	03043023          	sd	a6,32(s0)
     a40:	03143423          	sd	a7,40(s0)
     a44:	87aa                	mv	a5,a0
     a46:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a4a:	03040793          	addi	a5,s0,48
     a4e:	fcf43423          	sd	a5,-56(s0)
     a52:	fc843783          	ld	a5,-56(s0)
     a56:	fd078793          	addi	a5,a5,-48
     a5a:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a5e:	fe843703          	ld	a4,-24(s0)
     a62:	fdc42783          	lw	a5,-36(s0)
     a66:	863a                	mv	a2,a4
     a68:	fd043583          	ld	a1,-48(s0)
     a6c:	853e                	mv	a0,a5
     a6e:	00000097          	auipc	ra,0x0
     a72:	d54080e7          	jalr	-684(ra) # 7c2 <vprintf>
}
     a76:	0001                	nop
     a78:	70e2                	ld	ra,56(sp)
     a7a:	7442                	ld	s0,48(sp)
     a7c:	6165                	addi	sp,sp,112
     a7e:	8082                	ret

0000000000000a80 <printf>:

void
printf(const char *fmt, ...)
{
     a80:	7159                	addi	sp,sp,-112
     a82:	f406                	sd	ra,40(sp)
     a84:	f022                	sd	s0,32(sp)
     a86:	1800                	addi	s0,sp,48
     a88:	fca43c23          	sd	a0,-40(s0)
     a8c:	e40c                	sd	a1,8(s0)
     a8e:	e810                	sd	a2,16(s0)
     a90:	ec14                	sd	a3,24(s0)
     a92:	f018                	sd	a4,32(s0)
     a94:	f41c                	sd	a5,40(s0)
     a96:	03043823          	sd	a6,48(s0)
     a9a:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a9e:	04040793          	addi	a5,s0,64
     aa2:	fcf43823          	sd	a5,-48(s0)
     aa6:	fd043783          	ld	a5,-48(s0)
     aaa:	fc878793          	addi	a5,a5,-56
     aae:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     ab2:	fe843783          	ld	a5,-24(s0)
     ab6:	863e                	mv	a2,a5
     ab8:	fd843583          	ld	a1,-40(s0)
     abc:	4505                	li	a0,1
     abe:	00000097          	auipc	ra,0x0
     ac2:	d04080e7          	jalr	-764(ra) # 7c2 <vprintf>
}
     ac6:	0001                	nop
     ac8:	70a2                	ld	ra,40(sp)
     aca:	7402                	ld	s0,32(sp)
     acc:	6165                	addi	sp,sp,112
     ace:	8082                	ret

0000000000000ad0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ad0:	7179                	addi	sp,sp,-48
     ad2:	f422                	sd	s0,40(sp)
     ad4:	1800                	addi	s0,sp,48
     ad6:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     ada:	fd843783          	ld	a5,-40(s0)
     ade:	17c1                	addi	a5,a5,-16
     ae0:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ae4:	00002797          	auipc	a5,0x2
     ae8:	87478793          	addi	a5,a5,-1932 # 2358 <freep>
     aec:	639c                	ld	a5,0(a5)
     aee:	fef43423          	sd	a5,-24(s0)
     af2:	a815                	j	b26 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     af4:	fe843783          	ld	a5,-24(s0)
     af8:	639c                	ld	a5,0(a5)
     afa:	fe843703          	ld	a4,-24(s0)
     afe:	00f76f63          	bltu	a4,a5,b1c <free+0x4c>
     b02:	fe043703          	ld	a4,-32(s0)
     b06:	fe843783          	ld	a5,-24(s0)
     b0a:	02e7eb63          	bltu	a5,a4,b40 <free+0x70>
     b0e:	fe843783          	ld	a5,-24(s0)
     b12:	639c                	ld	a5,0(a5)
     b14:	fe043703          	ld	a4,-32(s0)
     b18:	02f76463          	bltu	a4,a5,b40 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b1c:	fe843783          	ld	a5,-24(s0)
     b20:	639c                	ld	a5,0(a5)
     b22:	fef43423          	sd	a5,-24(s0)
     b26:	fe043703          	ld	a4,-32(s0)
     b2a:	fe843783          	ld	a5,-24(s0)
     b2e:	fce7f3e3          	bgeu	a5,a4,af4 <free+0x24>
     b32:	fe843783          	ld	a5,-24(s0)
     b36:	639c                	ld	a5,0(a5)
     b38:	fe043703          	ld	a4,-32(s0)
     b3c:	faf77ce3          	bgeu	a4,a5,af4 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b40:	fe043783          	ld	a5,-32(s0)
     b44:	479c                	lw	a5,8(a5)
     b46:	1782                	slli	a5,a5,0x20
     b48:	9381                	srli	a5,a5,0x20
     b4a:	0792                	slli	a5,a5,0x4
     b4c:	fe043703          	ld	a4,-32(s0)
     b50:	973e                	add	a4,a4,a5
     b52:	fe843783          	ld	a5,-24(s0)
     b56:	639c                	ld	a5,0(a5)
     b58:	02f71763          	bne	a4,a5,b86 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b5c:	fe043783          	ld	a5,-32(s0)
     b60:	4798                	lw	a4,8(a5)
     b62:	fe843783          	ld	a5,-24(s0)
     b66:	639c                	ld	a5,0(a5)
     b68:	479c                	lw	a5,8(a5)
     b6a:	9fb9                	addw	a5,a5,a4
     b6c:	0007871b          	sext.w	a4,a5
     b70:	fe043783          	ld	a5,-32(s0)
     b74:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b76:	fe843783          	ld	a5,-24(s0)
     b7a:	639c                	ld	a5,0(a5)
     b7c:	6398                	ld	a4,0(a5)
     b7e:	fe043783          	ld	a5,-32(s0)
     b82:	e398                	sd	a4,0(a5)
     b84:	a039                	j	b92 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b86:	fe843783          	ld	a5,-24(s0)
     b8a:	6398                	ld	a4,0(a5)
     b8c:	fe043783          	ld	a5,-32(s0)
     b90:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b92:	fe843783          	ld	a5,-24(s0)
     b96:	479c                	lw	a5,8(a5)
     b98:	1782                	slli	a5,a5,0x20
     b9a:	9381                	srli	a5,a5,0x20
     b9c:	0792                	slli	a5,a5,0x4
     b9e:	fe843703          	ld	a4,-24(s0)
     ba2:	97ba                	add	a5,a5,a4
     ba4:	fe043703          	ld	a4,-32(s0)
     ba8:	02f71563          	bne	a4,a5,bd2 <free+0x102>
    p->s.size += bp->s.size;
     bac:	fe843783          	ld	a5,-24(s0)
     bb0:	4798                	lw	a4,8(a5)
     bb2:	fe043783          	ld	a5,-32(s0)
     bb6:	479c                	lw	a5,8(a5)
     bb8:	9fb9                	addw	a5,a5,a4
     bba:	0007871b          	sext.w	a4,a5
     bbe:	fe843783          	ld	a5,-24(s0)
     bc2:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     bc4:	fe043783          	ld	a5,-32(s0)
     bc8:	6398                	ld	a4,0(a5)
     bca:	fe843783          	ld	a5,-24(s0)
     bce:	e398                	sd	a4,0(a5)
     bd0:	a031                	j	bdc <free+0x10c>
  } else
    p->s.ptr = bp;
     bd2:	fe843783          	ld	a5,-24(s0)
     bd6:	fe043703          	ld	a4,-32(s0)
     bda:	e398                	sd	a4,0(a5)
  freep = p;
     bdc:	00001797          	auipc	a5,0x1
     be0:	77c78793          	addi	a5,a5,1916 # 2358 <freep>
     be4:	fe843703          	ld	a4,-24(s0)
     be8:	e398                	sd	a4,0(a5)
}
     bea:	0001                	nop
     bec:	7422                	ld	s0,40(sp)
     bee:	6145                	addi	sp,sp,48
     bf0:	8082                	ret

0000000000000bf2 <morecore>:

static Header*
morecore(uint nu)
{
     bf2:	7179                	addi	sp,sp,-48
     bf4:	f406                	sd	ra,40(sp)
     bf6:	f022                	sd	s0,32(sp)
     bf8:	1800                	addi	s0,sp,48
     bfa:	87aa                	mv	a5,a0
     bfc:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c00:	fdc42783          	lw	a5,-36(s0)
     c04:	0007871b          	sext.w	a4,a5
     c08:	6785                	lui	a5,0x1
     c0a:	00f77563          	bgeu	a4,a5,c14 <morecore+0x22>
    nu = 4096;
     c0e:	6785                	lui	a5,0x1
     c10:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c14:	fdc42783          	lw	a5,-36(s0)
     c18:	0047979b          	slliw	a5,a5,0x4
     c1c:	2781                	sext.w	a5,a5
     c1e:	2781                	sext.w	a5,a5
     c20:	853e                	mv	a0,a5
     c22:	00000097          	auipc	ra,0x0
     c26:	9a0080e7          	jalr	-1632(ra) # 5c2 <sbrk>
     c2a:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c2e:	fe843703          	ld	a4,-24(s0)
     c32:	57fd                	li	a5,-1
     c34:	00f71463          	bne	a4,a5,c3c <morecore+0x4a>
    return 0;
     c38:	4781                	li	a5,0
     c3a:	a03d                	j	c68 <morecore+0x76>
  hp = (Header*)p;
     c3c:	fe843783          	ld	a5,-24(s0)
     c40:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c44:	fe043783          	ld	a5,-32(s0)
     c48:	fdc42703          	lw	a4,-36(s0)
     c4c:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c4e:	fe043783          	ld	a5,-32(s0)
     c52:	07c1                	addi	a5,a5,16
     c54:	853e                	mv	a0,a5
     c56:	00000097          	auipc	ra,0x0
     c5a:	e7a080e7          	jalr	-390(ra) # ad0 <free>
  return freep;
     c5e:	00001797          	auipc	a5,0x1
     c62:	6fa78793          	addi	a5,a5,1786 # 2358 <freep>
     c66:	639c                	ld	a5,0(a5)
}
     c68:	853e                	mv	a0,a5
     c6a:	70a2                	ld	ra,40(sp)
     c6c:	7402                	ld	s0,32(sp)
     c6e:	6145                	addi	sp,sp,48
     c70:	8082                	ret

0000000000000c72 <malloc>:

void*
malloc(uint nbytes)
{
     c72:	7139                	addi	sp,sp,-64
     c74:	fc06                	sd	ra,56(sp)
     c76:	f822                	sd	s0,48(sp)
     c78:	0080                	addi	s0,sp,64
     c7a:	87aa                	mv	a5,a0
     c7c:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c80:	fcc46783          	lwu	a5,-52(s0)
     c84:	07bd                	addi	a5,a5,15
     c86:	8391                	srli	a5,a5,0x4
     c88:	2781                	sext.w	a5,a5
     c8a:	2785                	addiw	a5,a5,1
     c8c:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c90:	00001797          	auipc	a5,0x1
     c94:	6c878793          	addi	a5,a5,1736 # 2358 <freep>
     c98:	639c                	ld	a5,0(a5)
     c9a:	fef43023          	sd	a5,-32(s0)
     c9e:	fe043783          	ld	a5,-32(s0)
     ca2:	ef95                	bnez	a5,cde <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     ca4:	00001797          	auipc	a5,0x1
     ca8:	6a478793          	addi	a5,a5,1700 # 2348 <base>
     cac:	fef43023          	sd	a5,-32(s0)
     cb0:	00001797          	auipc	a5,0x1
     cb4:	6a878793          	addi	a5,a5,1704 # 2358 <freep>
     cb8:	fe043703          	ld	a4,-32(s0)
     cbc:	e398                	sd	a4,0(a5)
     cbe:	00001797          	auipc	a5,0x1
     cc2:	69a78793          	addi	a5,a5,1690 # 2358 <freep>
     cc6:	6398                	ld	a4,0(a5)
     cc8:	00001797          	auipc	a5,0x1
     ccc:	68078793          	addi	a5,a5,1664 # 2348 <base>
     cd0:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     cd2:	00001797          	auipc	a5,0x1
     cd6:	67678793          	addi	a5,a5,1654 # 2348 <base>
     cda:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     cde:	fe043783          	ld	a5,-32(s0)
     ce2:	639c                	ld	a5,0(a5)
     ce4:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     ce8:	fe843783          	ld	a5,-24(s0)
     cec:	4798                	lw	a4,8(a5)
     cee:	fdc42783          	lw	a5,-36(s0)
     cf2:	2781                	sext.w	a5,a5
     cf4:	06f76863          	bltu	a4,a5,d64 <malloc+0xf2>
      if(p->s.size == nunits)
     cf8:	fe843783          	ld	a5,-24(s0)
     cfc:	4798                	lw	a4,8(a5)
     cfe:	fdc42783          	lw	a5,-36(s0)
     d02:	2781                	sext.w	a5,a5
     d04:	00e79963          	bne	a5,a4,d16 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d08:	fe843783          	ld	a5,-24(s0)
     d0c:	6398                	ld	a4,0(a5)
     d0e:	fe043783          	ld	a5,-32(s0)
     d12:	e398                	sd	a4,0(a5)
     d14:	a82d                	j	d4e <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d16:	fe843783          	ld	a5,-24(s0)
     d1a:	4798                	lw	a4,8(a5)
     d1c:	fdc42783          	lw	a5,-36(s0)
     d20:	40f707bb          	subw	a5,a4,a5
     d24:	0007871b          	sext.w	a4,a5
     d28:	fe843783          	ld	a5,-24(s0)
     d2c:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d2e:	fe843783          	ld	a5,-24(s0)
     d32:	479c                	lw	a5,8(a5)
     d34:	1782                	slli	a5,a5,0x20
     d36:	9381                	srli	a5,a5,0x20
     d38:	0792                	slli	a5,a5,0x4
     d3a:	fe843703          	ld	a4,-24(s0)
     d3e:	97ba                	add	a5,a5,a4
     d40:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d44:	fe843783          	ld	a5,-24(s0)
     d48:	fdc42703          	lw	a4,-36(s0)
     d4c:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d4e:	00001797          	auipc	a5,0x1
     d52:	60a78793          	addi	a5,a5,1546 # 2358 <freep>
     d56:	fe043703          	ld	a4,-32(s0)
     d5a:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d5c:	fe843783          	ld	a5,-24(s0)
     d60:	07c1                	addi	a5,a5,16
     d62:	a091                	j	da6 <malloc+0x134>
    }
    if(p == freep)
     d64:	00001797          	auipc	a5,0x1
     d68:	5f478793          	addi	a5,a5,1524 # 2358 <freep>
     d6c:	639c                	ld	a5,0(a5)
     d6e:	fe843703          	ld	a4,-24(s0)
     d72:	02f71063          	bne	a4,a5,d92 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d76:	fdc42783          	lw	a5,-36(s0)
     d7a:	853e                	mv	a0,a5
     d7c:	00000097          	auipc	ra,0x0
     d80:	e76080e7          	jalr	-394(ra) # bf2 <morecore>
     d84:	fea43423          	sd	a0,-24(s0)
     d88:	fe843783          	ld	a5,-24(s0)
     d8c:	e399                	bnez	a5,d92 <malloc+0x120>
        return 0;
     d8e:	4781                	li	a5,0
     d90:	a819                	j	da6 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d92:	fe843783          	ld	a5,-24(s0)
     d96:	fef43023          	sd	a5,-32(s0)
     d9a:	fe843783          	ld	a5,-24(s0)
     d9e:	639c                	ld	a5,0(a5)
     da0:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     da4:	b791                	j	ce8 <malloc+0x76>
  }
}
     da6:	853e                	mv	a0,a5
     da8:	70e2                	ld	ra,56(sp)
     daa:	7442                	ld	s0,48(sp)
     dac:	6121                	addi	sp,sp,64
     dae:	8082                	ret

0000000000000db0 <setjmp>:
     db0:	e100                	sd	s0,0(a0)
     db2:	e504                	sd	s1,8(a0)
     db4:	01253823          	sd	s2,16(a0)
     db8:	01353c23          	sd	s3,24(a0)
     dbc:	03453023          	sd	s4,32(a0)
     dc0:	03553423          	sd	s5,40(a0)
     dc4:	03653823          	sd	s6,48(a0)
     dc8:	03753c23          	sd	s7,56(a0)
     dcc:	05853023          	sd	s8,64(a0)
     dd0:	05953423          	sd	s9,72(a0)
     dd4:	05a53823          	sd	s10,80(a0)
     dd8:	05b53c23          	sd	s11,88(a0)
     ddc:	06153023          	sd	ra,96(a0)
     de0:	06253423          	sd	sp,104(a0)
     de4:	4501                	li	a0,0
     de6:	8082                	ret

0000000000000de8 <longjmp>:
     de8:	6100                	ld	s0,0(a0)
     dea:	6504                	ld	s1,8(a0)
     dec:	01053903          	ld	s2,16(a0)
     df0:	01853983          	ld	s3,24(a0)
     df4:	02053a03          	ld	s4,32(a0)
     df8:	02853a83          	ld	s5,40(a0)
     dfc:	03053b03          	ld	s6,48(a0)
     e00:	03853b83          	ld	s7,56(a0)
     e04:	04053c03          	ld	s8,64(a0)
     e08:	04853c83          	ld	s9,72(a0)
     e0c:	05053d03          	ld	s10,80(a0)
     e10:	05853d83          	ld	s11,88(a0)
     e14:	06053083          	ld	ra,96(a0)
     e18:	06853103          	ld	sp,104(a0)
     e1c:	c199                	beqz	a1,e22 <longjmp_1>
     e1e:	852e                	mv	a0,a1
     e20:	8082                	ret

0000000000000e22 <longjmp_1>:
     e22:	4505                	li	a0,1
     e24:	8082                	ret

0000000000000e26 <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     e26:	7179                	addi	sp,sp,-48
     e28:	f422                	sd	s0,40(sp)
     e2a:	1800                	addi	s0,sp,48
     e2c:	fea43423          	sd	a0,-24(s0)
     e30:	feb43023          	sd	a1,-32(s0)
     e34:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     e38:	fd843783          	ld	a5,-40(s0)
     e3c:	fe843703          	ld	a4,-24(s0)
     e40:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     e42:	fe843783          	ld	a5,-24(s0)
     e46:	fd843703          	ld	a4,-40(s0)
     e4a:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     e4c:	fe843783          	ld	a5,-24(s0)
     e50:	fe043703          	ld	a4,-32(s0)
     e54:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     e56:	fe043783          	ld	a5,-32(s0)
     e5a:	fe843703          	ld	a4,-24(s0)
     e5e:	e398                	sd	a4,0(a5)
 }
     e60:	0001                	nop
     e62:	7422                	ld	s0,40(sp)
     e64:	6145                	addi	sp,sp,48
     e66:	8082                	ret

0000000000000e68 <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     e68:	1101                	addi	sp,sp,-32
     e6a:	ec06                	sd	ra,24(sp)
     e6c:	e822                	sd	s0,16(sp)
     e6e:	1000                	addi	s0,sp,32
     e70:	fea43423          	sd	a0,-24(s0)
     e74:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     e78:	fe043783          	ld	a5,-32(s0)
     e7c:	679c                	ld	a5,8(a5)
     e7e:	fe043603          	ld	a2,-32(s0)
     e82:	85be                	mv	a1,a5
     e84:	fe843503          	ld	a0,-24(s0)
     e88:	00000097          	auipc	ra,0x0
     e8c:	f9e080e7          	jalr	-98(ra) # e26 <__list_add>
 }
     e90:	0001                	nop
     e92:	60e2                	ld	ra,24(sp)
     e94:	6442                	ld	s0,16(sp)
     e96:	6105                	addi	sp,sp,32
     e98:	8082                	ret

0000000000000e9a <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     e9a:	1101                	addi	sp,sp,-32
     e9c:	ec22                	sd	s0,24(sp)
     e9e:	1000                	addi	s0,sp,32
     ea0:	fea43423          	sd	a0,-24(s0)
     ea4:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
     ea8:	fe043783          	ld	a5,-32(s0)
     eac:	fe843703          	ld	a4,-24(s0)
     eb0:	e798                	sd	a4,8(a5)
     prev->next = next;
     eb2:	fe843783          	ld	a5,-24(s0)
     eb6:	fe043703          	ld	a4,-32(s0)
     eba:	e398                	sd	a4,0(a5)
 }
     ebc:	0001                	nop
     ebe:	6462                	ld	s0,24(sp)
     ec0:	6105                	addi	sp,sp,32
     ec2:	8082                	ret

0000000000000ec4 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     ec4:	1101                	addi	sp,sp,-32
     ec6:	ec06                	sd	ra,24(sp)
     ec8:	e822                	sd	s0,16(sp)
     eca:	1000                	addi	s0,sp,32
     ecc:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
     ed0:	fe843783          	ld	a5,-24(s0)
     ed4:	6798                	ld	a4,8(a5)
     ed6:	fe843783          	ld	a5,-24(s0)
     eda:	639c                	ld	a5,0(a5)
     edc:	85be                	mv	a1,a5
     ede:	853a                	mv	a0,a4
     ee0:	00000097          	auipc	ra,0x0
     ee4:	fba080e7          	jalr	-70(ra) # e9a <__list_del>
     entry->next = LIST_POISON1;
     ee8:	fe843783          	ld	a5,-24(s0)
     eec:	00100737          	lui	a4,0x100
     ef0:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd600>
     ef4:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
     ef6:	fe843783          	ld	a5,-24(s0)
     efa:	00200737          	lui	a4,0x200
     efe:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd700>
     f02:	e798                	sd	a4,8(a5)
 }
     f04:	0001                	nop
     f06:	60e2                	ld	ra,24(sp)
     f08:	6442                	ld	s0,16(sp)
     f0a:	6105                	addi	sp,sp,32
     f0c:	8082                	ret

0000000000000f0e <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
     f0e:	1101                	addi	sp,sp,-32
     f10:	ec22                	sd	s0,24(sp)
     f12:	1000                	addi	s0,sp,32
     f14:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
     f18:	fe843783          	ld	a5,-24(s0)
     f1c:	639c                	ld	a5,0(a5)
     f1e:	fe843703          	ld	a4,-24(s0)
     f22:	40f707b3          	sub	a5,a4,a5
     f26:	0017b793          	seqz	a5,a5
     f2a:	0ff7f793          	andi	a5,a5,255
     f2e:	2781                	sext.w	a5,a5
 }
     f30:	853e                	mv	a0,a5
     f32:	6462                	ld	s0,24(sp)
     f34:	6105                	addi	sp,sp,32
     f36:	8082                	ret

0000000000000f38 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     f38:	715d                	addi	sp,sp,-80
     f3a:	e486                	sd	ra,72(sp)
     f3c:	e0a2                	sd	s0,64(sp)
     f3e:	0880                	addi	s0,sp,80
     f40:	fca43423          	sd	a0,-56(s0)
     f44:	fcb43023          	sd	a1,-64(s0)
     f48:	85b2                	mv	a1,a2
     f4a:	8636                	mv	a2,a3
     f4c:	86ba                	mv	a3,a4
     f4e:	873e                	mv	a4,a5
     f50:	87ae                	mv	a5,a1
     f52:	faf42e23          	sw	a5,-68(s0)
     f56:	87b2                	mv	a5,a2
     f58:	faf42c23          	sw	a5,-72(s0)
     f5c:	87b6                	mv	a5,a3
     f5e:	faf42a23          	sw	a5,-76(s0)
     f62:	87ba                	mv	a5,a4
     f64:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     f68:	08000513          	li	a0,128
     f6c:	00000097          	auipc	ra,0x0
     f70:	d06080e7          	jalr	-762(ra) # c72 <malloc>
     f74:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     f78:	6505                	lui	a0,0x1
     f7a:	00000097          	auipc	ra,0x0
     f7e:	cf8080e7          	jalr	-776(ra) # c72 <malloc>
     f82:	87aa                	mv	a5,a0
     f84:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     f88:	fe043703          	ld	a4,-32(s0)
     f8c:	6785                	lui	a5,0x1
     f8e:	17c1                	addi	a5,a5,-16
     f90:	97ba                	add	a5,a5,a4
     f92:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     f96:	fe843783          	ld	a5,-24(s0)
     f9a:	fc843703          	ld	a4,-56(s0)
     f9e:	e398                	sd	a4,0(a5)
    t->arg = arg;
     fa0:	fe843783          	ld	a5,-24(s0)
     fa4:	fc043703          	ld	a4,-64(s0)
     fa8:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     faa:	00001797          	auipc	a5,0x1
     fae:	39278793          	addi	a5,a5,914 # 233c <_id.1241>
     fb2:	439c                	lw	a5,0(a5)
     fb4:	0017871b          	addiw	a4,a5,1
     fb8:	0007069b          	sext.w	a3,a4
     fbc:	00001717          	auipc	a4,0x1
     fc0:	38070713          	addi	a4,a4,896 # 233c <_id.1241>
     fc4:	c314                	sw	a3,0(a4)
     fc6:	fe843703          	ld	a4,-24(s0)
     fca:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
     fcc:	fe843783          	ld	a5,-24(s0)
     fd0:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
     fd4:	fe043703          	ld	a4,-32(s0)
     fd8:	fe843783          	ld	a5,-24(s0)
     fdc:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
     fde:	fd843703          	ld	a4,-40(s0)
     fe2:	fe843783          	ld	a5,-24(s0)
     fe6:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
     fe8:	fe843783          	ld	a5,-24(s0)
     fec:	fb842703          	lw	a4,-72(s0)
     ff0:	c3f8                	sw	a4,68(a5)
    t->period = period;
     ff2:	fe843783          	ld	a5,-24(s0)
     ff6:	fb442703          	lw	a4,-76(s0)
     ffa:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
     ffc:	fe843783          	ld	a5,-24(s0)
    1000:	fb442703          	lw	a4,-76(s0)
    1004:	c7b8                	sw	a4,72(a5)
    t->n = n;
    1006:	fe843783          	ld	a5,-24(s0)
    100a:	fb042703          	lw	a4,-80(s0)
    100e:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    1010:	fe843783          	ld	a5,-24(s0)
    1014:	fbc42703          	lw	a4,-68(s0)
    1018:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    101a:	fe843783          	ld	a5,-24(s0)
    101e:	fb842703          	lw	a4,-72(s0)
    1022:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    1024:	fe843783          	ld	a5,-24(s0)
    1028:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    102c:	fe843783          	ld	a5,-24(s0)
    1030:	06400713          	li	a4,100
    1034:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    1036:	fe843783          	ld	a5,-24(s0)
    103a:	671d                	lui	a4,0x7
    103c:	5307071b          	addiw	a4,a4,1328
    1040:	d3b8                	sw	a4,96(a5)
    
    return t;
    1042:	fe843783          	ld	a5,-24(s0)
}
    1046:	853e                	mv	a0,a5
    1048:	60a6                	ld	ra,72(sp)
    104a:	6406                	ld	s0,64(sp)
    104c:	6161                	addi	sp,sp,80
    104e:	8082                	ret

0000000000001050 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    1050:	1101                	addi	sp,sp,-32
    1052:	ec22                	sd	s0,24(sp)
    1054:	1000                	addi	s0,sp,32
    1056:	fea43423          	sd	a0,-24(s0)
    105a:	87ae                	mv	a5,a1
    105c:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    1060:	fe843783          	ld	a5,-24(s0)
    1064:	fe442703          	lw	a4,-28(s0)
    1068:	cff8                	sw	a4,92(a5)
}
    106a:	0001                	nop
    106c:	6462                	ld	s0,24(sp)
    106e:	6105                	addi	sp,sp,32
    1070:	8082                	ret

0000000000001072 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    1072:	1101                	addi	sp,sp,-32
    1074:	ec22                	sd	s0,24(sp)
    1076:	1000                	addi	s0,sp,32
    1078:	fea43423          	sd	a0,-24(s0)
    107c:	87ae                	mv	a5,a1
    107e:	8732                	mv	a4,a2
    1080:	fef42223          	sw	a5,-28(s0)
    1084:	87ba                	mv	a5,a4
    1086:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    108a:	fe843783          	ld	a5,-24(s0)
    108e:	fe442703          	lw	a4,-28(s0)
    1092:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    1094:	fe843783          	ld	a5,-24(s0)
    1098:	fe442703          	lw	a4,-28(s0)
    109c:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    109e:	fe843783          	ld	a5,-24(s0)
    10a2:	fe042703          	lw	a4,-32(s0)
    10a6:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    10a8:	fe843783          	ld	a5,-24(s0)
    10ac:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    10b0:	fe843783          	ld	a5,-24(s0)
    10b4:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    10b8:	fe843783          	ld	a5,-24(s0)
    10bc:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    10c0:	fe843783          	ld	a5,-24(s0)
    10c4:	0607ae23          	sw	zero,124(a5)
}
    10c8:	0001                	nop
    10ca:	6462                	ld	s0,24(sp)
    10cc:	6105                	addi	sp,sp,32
    10ce:	8082                	ret

00000000000010d0 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    10d0:	7179                	addi	sp,sp,-48
    10d2:	f406                	sd	ra,40(sp)
    10d4:	f022                	sd	s0,32(sp)
    10d6:	1800                	addi	s0,sp,48
    10d8:	fca43c23          	sd	a0,-40(s0)
    10dc:	87ae                	mv	a5,a1
    10de:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    10e2:	02000513          	li	a0,32
    10e6:	00000097          	auipc	ra,0x0
    10ea:	b8c080e7          	jalr	-1140(ra) # c72 <malloc>
    10ee:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    10f2:	fe843783          	ld	a5,-24(s0)
    10f6:	fd843703          	ld	a4,-40(s0)
    10fa:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    10fc:	fe843783          	ld	a5,-24(s0)
    1100:	fd442703          	lw	a4,-44(s0)
    1104:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    1106:	fd843783          	ld	a5,-40(s0)
    110a:	fd442703          	lw	a4,-44(s0)
    110e:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    1110:	fd843783          	ld	a5,-40(s0)
    1114:	43bc                	lw	a5,64(a5)
    1116:	cf81                	beqz	a5,112e <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    1118:	fd843783          	ld	a5,-40(s0)
    111c:	47bc                	lw	a5,72(a5)
    111e:	fd442703          	lw	a4,-44(s0)
    1122:	9fb9                	addw	a5,a5,a4
    1124:	0007871b          	sext.w	a4,a5
    1128:	fd843783          	ld	a5,-40(s0)
    112c:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    112e:	fe843783          	ld	a5,-24(s0)
    1132:	07a1                	addi	a5,a5,8
    1134:	00001597          	auipc	a1,0x1
    1138:	1f458593          	addi	a1,a1,500 # 2328 <release_queue>
    113c:	853e                	mv	a0,a5
    113e:	00000097          	auipc	ra,0x0
    1142:	d2a080e7          	jalr	-726(ra) # e68 <list_add_tail>
}
    1146:	0001                	nop
    1148:	70a2                	ld	ra,40(sp)
    114a:	7402                	ld	s0,32(sp)
    114c:	6145                	addi	sp,sp,48
    114e:	8082                	ret

0000000000001150 <__release>:

void __release()
{
    1150:	7139                	addi	sp,sp,-64
    1152:	fc06                	sd	ra,56(sp)
    1154:	f822                	sd	s0,48(sp)
    1156:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1158:	00001797          	auipc	a5,0x1
    115c:	1d078793          	addi	a5,a5,464 # 2328 <release_queue>
    1160:	639c                	ld	a5,0(a5)
    1162:	fcf43c23          	sd	a5,-40(s0)
    1166:	fd843783          	ld	a5,-40(s0)
    116a:	17e1                	addi	a5,a5,-8
    116c:	fef43423          	sd	a5,-24(s0)
    1170:	fe843783          	ld	a5,-24(s0)
    1174:	679c                	ld	a5,8(a5)
    1176:	fcf43823          	sd	a5,-48(s0)
    117a:	fd043783          	ld	a5,-48(s0)
    117e:	17e1                	addi	a5,a5,-8
    1180:	fef43023          	sd	a5,-32(s0)
    1184:	a0e9                	j	124e <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    1186:	fe843783          	ld	a5,-24(s0)
    118a:	4f98                	lw	a4,24(a5)
    118c:	00001797          	auipc	a5,0x1
    1190:	1dc78793          	addi	a5,a5,476 # 2368 <threading_system_time>
    1194:	439c                	lw	a5,0(a5)
    1196:	08e7ce63          	blt	a5,a4,1232 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    119a:	fe843783          	ld	a5,-24(s0)
    119e:	639c                	ld	a5,0(a5)
    11a0:	5bbc                	lw	a5,112(a5)
    11a2:	c79d                	beqz	a5,11d0 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    11a4:	fe843783          	ld	a5,-24(s0)
    11a8:	639c                	ld	a5,0(a5)
    11aa:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    11ae:	fe843783          	ld	a5,-24(s0)
    11b2:	6398                	ld	a4,0(a5)
    11b4:	fe843783          	ld	a5,-24(s0)
    11b8:	639c                	ld	a5,0(a5)
    11ba:	5378                	lw	a4,100(a4)
    11bc:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    11be:	fe843783          	ld	a5,-24(s0)
    11c2:	6398                	ld	a4,0(a5)
    11c4:	fe843783          	ld	a5,-24(s0)
    11c8:	639c                	ld	a5,0(a5)
    11ca:	5f78                	lw	a4,124(a4)
    11cc:	cbf8                	sw	a4,84(a5)
    11ce:	a809                	j	11e0 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    11d0:	fe843783          	ld	a5,-24(s0)
    11d4:	6398                	ld	a4,0(a5)
    11d6:	fe843783          	ld	a5,-24(s0)
    11da:	639c                	ld	a5,0(a5)
    11dc:	4378                	lw	a4,68(a4)
    11de:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    11e0:	fe843783          	ld	a5,-24(s0)
    11e4:	4f94                	lw	a3,24(a5)
    11e6:	fe843783          	ld	a5,-24(s0)
    11ea:	639c                	ld	a5,0(a5)
    11ec:	47b8                	lw	a4,72(a5)
    11ee:	fe843783          	ld	a5,-24(s0)
    11f2:	639c                	ld	a5,0(a5)
    11f4:	9f35                	addw	a4,a4,a3
    11f6:	2701                	sext.w	a4,a4
    11f8:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    11fa:	fe843783          	ld	a5,-24(s0)
    11fe:	639c                	ld	a5,0(a5)
    1200:	02878793          	addi	a5,a5,40
    1204:	00001597          	auipc	a1,0x1
    1208:	11458593          	addi	a1,a1,276 # 2318 <run_queue>
    120c:	853e                	mv	a0,a5
    120e:	00000097          	auipc	ra,0x0
    1212:	c5a080e7          	jalr	-934(ra) # e68 <list_add_tail>
            list_del(&cur->thread_list);
    1216:	fe843783          	ld	a5,-24(s0)
    121a:	07a1                	addi	a5,a5,8
    121c:	853e                	mv	a0,a5
    121e:	00000097          	auipc	ra,0x0
    1222:	ca6080e7          	jalr	-858(ra) # ec4 <list_del>
            free(cur);
    1226:	fe843503          	ld	a0,-24(s0)
    122a:	00000097          	auipc	ra,0x0
    122e:	8a6080e7          	jalr	-1882(ra) # ad0 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1232:	fe043783          	ld	a5,-32(s0)
    1236:	fef43423          	sd	a5,-24(s0)
    123a:	fe043783          	ld	a5,-32(s0)
    123e:	679c                	ld	a5,8(a5)
    1240:	fcf43423          	sd	a5,-56(s0)
    1244:	fc843783          	ld	a5,-56(s0)
    1248:	17e1                	addi	a5,a5,-8
    124a:	fef43023          	sd	a5,-32(s0)
    124e:	fe843783          	ld	a5,-24(s0)
    1252:	00878713          	addi	a4,a5,8
    1256:	00001797          	auipc	a5,0x1
    125a:	0d278793          	addi	a5,a5,210 # 2328 <release_queue>
    125e:	f2f714e3          	bne	a4,a5,1186 <__release+0x36>
        }
    }
}
    1262:	0001                	nop
    1264:	0001                	nop
    1266:	70e2                	ld	ra,56(sp)
    1268:	7442                	ld	s0,48(sp)
    126a:	6121                	addi	sp,sp,64
    126c:	8082                	ret

000000000000126e <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    126e:	1101                	addi	sp,sp,-32
    1270:	ec06                	sd	ra,24(sp)
    1272:	e822                	sd	s0,16(sp)
    1274:	1000                	addi	s0,sp,32
    1276:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    127a:	fe843783          	ld	a5,-24(s0)
    127e:	7b98                	ld	a4,48(a5)
    1280:	00001797          	auipc	a5,0x1
    1284:	0e078793          	addi	a5,a5,224 # 2360 <current>
    1288:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    128a:	fe843783          	ld	a5,-24(s0)
    128e:	02878793          	addi	a5,a5,40
    1292:	853e                	mv	a0,a5
    1294:	00000097          	auipc	ra,0x0
    1298:	c30080e7          	jalr	-976(ra) # ec4 <list_del>

    free(to_remove->stack);
    129c:	fe843783          	ld	a5,-24(s0)
    12a0:	6b9c                	ld	a5,16(a5)
    12a2:	853e                	mv	a0,a5
    12a4:	00000097          	auipc	ra,0x0
    12a8:	82c080e7          	jalr	-2004(ra) # ad0 <free>
    free(to_remove);
    12ac:	fe843503          	ld	a0,-24(s0)
    12b0:	00000097          	auipc	ra,0x0
    12b4:	820080e7          	jalr	-2016(ra) # ad0 <free>

    __schedule();
    12b8:	00000097          	auipc	ra,0x0
    12bc:	5e8080e7          	jalr	1512(ra) # 18a0 <__schedule>
    __dispatch();
    12c0:	00000097          	auipc	ra,0x0
    12c4:	416080e7          	jalr	1046(ra) # 16d6 <__dispatch>
    thrdresume(main_thrd_id);
    12c8:	00001797          	auipc	a5,0x1
    12cc:	07078793          	addi	a5,a5,112 # 2338 <main_thrd_id>
    12d0:	439c                	lw	a5,0(a5)
    12d2:	853e                	mv	a0,a5
    12d4:	fffff097          	auipc	ra,0xfffff
    12d8:	30e080e7          	jalr	782(ra) # 5e2 <thrdresume>
}
    12dc:	0001                	nop
    12de:	60e2                	ld	ra,24(sp)
    12e0:	6442                	ld	s0,16(sp)
    12e2:	6105                	addi	sp,sp,32
    12e4:	8082                	ret

00000000000012e6 <thread_exit>:

void thread_exit(void)
{
    12e6:	7179                	addi	sp,sp,-48
    12e8:	f406                	sd	ra,40(sp)
    12ea:	f022                	sd	s0,32(sp)
    12ec:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    12ee:	00001797          	auipc	a5,0x1
    12f2:	07278793          	addi	a5,a5,114 # 2360 <current>
    12f6:	6398                	ld	a4,0(a5)
    12f8:	00001797          	auipc	a5,0x1
    12fc:	02078793          	addi	a5,a5,32 # 2318 <run_queue>
    1300:	02f71063          	bne	a4,a5,1320 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    1304:	00001597          	auipc	a1,0x1
    1308:	d8458593          	addi	a1,a1,-636 # 2088 <schedule_edf_cbs+0x512>
    130c:	4509                	li	a0,2
    130e:	fffff097          	auipc	ra,0xfffff
    1312:	71a080e7          	jalr	1818(ra) # a28 <fprintf>
        exit(1);
    1316:	4505                	li	a0,1
    1318:	fffff097          	auipc	ra,0xfffff
    131c:	222080e7          	jalr	546(ra) # 53a <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    1320:	00001797          	auipc	a5,0x1
    1324:	04078793          	addi	a5,a5,64 # 2360 <current>
    1328:	639c                	ld	a5,0(a5)
    132a:	fef43423          	sd	a5,-24(s0)
    132e:	fe843783          	ld	a5,-24(s0)
    1332:	fd878793          	addi	a5,a5,-40
    1336:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    133a:	fe043783          	ld	a5,-32(s0)
    133e:	5f9c                	lw	a5,56(a5)
    1340:	4585                	li	a1,1
    1342:	853e                	mv	a0,a5
    1344:	fffff097          	auipc	ra,0xfffff
    1348:	2a6080e7          	jalr	678(ra) # 5ea <cancelthrdstop>
    134c:	87aa                	mv	a5,a0
    134e:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    1352:	00001797          	auipc	a5,0x1
    1356:	01678793          	addi	a5,a5,22 # 2368 <threading_system_time>
    135a:	439c                	lw	a5,0(a5)
    135c:	fdc42703          	lw	a4,-36(s0)
    1360:	9fb9                	addw	a5,a5,a4
    1362:	0007871b          	sext.w	a4,a5
    1366:	00001797          	auipc	a5,0x1
    136a:	00278793          	addi	a5,a5,2 # 2368 <threading_system_time>
    136e:	c398                	sw	a4,0(a5)

    __release();
    1370:	00000097          	auipc	ra,0x0
    1374:	de0080e7          	jalr	-544(ra) # 1150 <__release>
    __thread_exit(to_remove);
    1378:	fe043503          	ld	a0,-32(s0)
    137c:	00000097          	auipc	ra,0x0
    1380:	ef2080e7          	jalr	-270(ra) # 126e <__thread_exit>
}
    1384:	0001                	nop
    1386:	70a2                	ld	ra,40(sp)
    1388:	7402                	ld	s0,32(sp)
    138a:	6145                	addi	sp,sp,48
    138c:	8082                	ret

000000000000138e <__finish_current>:

void __finish_current()
{
    138e:	7179                	addi	sp,sp,-48
    1390:	f406                	sd	ra,40(sp)
    1392:	f022                	sd	s0,32(sp)
    1394:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1396:	00001797          	auipc	a5,0x1
    139a:	fca78793          	addi	a5,a5,-54 # 2360 <current>
    139e:	639c                	ld	a5,0(a5)
    13a0:	fef43423          	sd	a5,-24(s0)
    13a4:	fe843783          	ld	a5,-24(s0)
    13a8:	fd878793          	addi	a5,a5,-40
    13ac:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    13b0:	fe043783          	ld	a5,-32(s0)
    13b4:	4bbc                	lw	a5,80(a5)
    13b6:	37fd                	addiw	a5,a5,-1
    13b8:	0007871b          	sext.w	a4,a5
    13bc:	fe043783          	ld	a5,-32(s0)
    13c0:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    13c2:	fe043783          	ld	a5,-32(s0)
    13c6:	5fd8                	lw	a4,60(a5)
    13c8:	00001797          	auipc	a5,0x1
    13cc:	fa078793          	addi	a5,a5,-96 # 2368 <threading_system_time>
    13d0:	4390                	lw	a2,0(a5)
    13d2:	fe043783          	ld	a5,-32(s0)
    13d6:	4bbc                	lw	a5,80(a5)
    13d8:	86be                	mv	a3,a5
    13da:	85ba                	mv	a1,a4
    13dc:	00001517          	auipc	a0,0x1
    13e0:	ce450513          	addi	a0,a0,-796 # 20c0 <schedule_edf_cbs+0x54a>
    13e4:	fffff097          	auipc	ra,0xfffff
    13e8:	69c080e7          	jalr	1692(ra) # a80 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    13ec:	fe043783          	ld	a5,-32(s0)
    13f0:	4bbc                	lw	a5,80(a5)
    13f2:	04f05563          	blez	a5,143c <__finish_current+0xae>
        struct list_head *to_remove = current;
    13f6:	00001797          	auipc	a5,0x1
    13fa:	f6a78793          	addi	a5,a5,-150 # 2360 <current>
    13fe:	639c                	ld	a5,0(a5)
    1400:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1404:	00001797          	auipc	a5,0x1
    1408:	f5c78793          	addi	a5,a5,-164 # 2360 <current>
    140c:	639c                	ld	a5,0(a5)
    140e:	6798                	ld	a4,8(a5)
    1410:	00001797          	auipc	a5,0x1
    1414:	f5078793          	addi	a5,a5,-176 # 2360 <current>
    1418:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    141a:	fd843503          	ld	a0,-40(s0)
    141e:	00000097          	auipc	ra,0x0
    1422:	aa6080e7          	jalr	-1370(ra) # ec4 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    1426:	fe043783          	ld	a5,-32(s0)
    142a:	4fbc                	lw	a5,88(a5)
    142c:	85be                	mv	a1,a5
    142e:	fe043503          	ld	a0,-32(s0)
    1432:	00000097          	auipc	ra,0x0
    1436:	c9e080e7          	jalr	-866(ra) # 10d0 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    143a:	a039                	j	1448 <__finish_current+0xba>
        __thread_exit(current_thread);
    143c:	fe043503          	ld	a0,-32(s0)
    1440:	00000097          	auipc	ra,0x0
    1444:	e2e080e7          	jalr	-466(ra) # 126e <__thread_exit>
}
    1448:	0001                	nop
    144a:	70a2                	ld	ra,40(sp)
    144c:	7402                	ld	s0,32(sp)
    144e:	6145                	addi	sp,sp,48
    1450:	8082                	ret

0000000000001452 <__rt_finish_current>:
void __rt_finish_current()
{
    1452:	7179                	addi	sp,sp,-48
    1454:	f406                	sd	ra,40(sp)
    1456:	f022                	sd	s0,32(sp)
    1458:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    145a:	00001797          	auipc	a5,0x1
    145e:	f0678793          	addi	a5,a5,-250 # 2360 <current>
    1462:	639c                	ld	a5,0(a5)
    1464:	fef43423          	sd	a5,-24(s0)
    1468:	fe843783          	ld	a5,-24(s0)
    146c:	fd878793          	addi	a5,a5,-40
    1470:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1474:	fe043783          	ld	a5,-32(s0)
    1478:	4bbc                	lw	a5,80(a5)
    147a:	37fd                	addiw	a5,a5,-1
    147c:	0007871b          	sext.w	a4,a5
    1480:	fe043783          	ld	a5,-32(s0)
    1484:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    1486:	fe043783          	ld	a5,-32(s0)
    148a:	5fd8                	lw	a4,60(a5)
    148c:	00001797          	auipc	a5,0x1
    1490:	edc78793          	addi	a5,a5,-292 # 2368 <threading_system_time>
    1494:	4390                	lw	a2,0(a5)
    1496:	fe043783          	ld	a5,-32(s0)
    149a:	4bbc                	lw	a5,80(a5)
    149c:	86be                	mv	a3,a5
    149e:	85ba                	mv	a1,a4
    14a0:	00001517          	auipc	a0,0x1
    14a4:	c3850513          	addi	a0,a0,-968 # 20d8 <schedule_edf_cbs+0x562>
    14a8:	fffff097          	auipc	ra,0xfffff
    14ac:	5d8080e7          	jalr	1496(ra) # a80 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    14b0:	fe043783          	ld	a5,-32(s0)
    14b4:	4bbc                	lw	a5,80(a5)
    14b6:	04f05f63          	blez	a5,1514 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    14ba:	00001797          	auipc	a5,0x1
    14be:	ea678793          	addi	a5,a5,-346 # 2360 <current>
    14c2:	639c                	ld	a5,0(a5)
    14c4:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    14c8:	00001797          	auipc	a5,0x1
    14cc:	e9878793          	addi	a5,a5,-360 # 2360 <current>
    14d0:	639c                	ld	a5,0(a5)
    14d2:	6798                	ld	a4,8(a5)
    14d4:	00001797          	auipc	a5,0x1
    14d8:	e8c78793          	addi	a5,a5,-372 # 2360 <current>
    14dc:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    14de:	fd843503          	ld	a0,-40(s0)
    14e2:	00000097          	auipc	ra,0x0
    14e6:	9e2080e7          	jalr	-1566(ra) # ec4 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    14ea:	fe043783          	ld	a5,-32(s0)
    14ee:	4fbc                	lw	a5,88(a5)
    14f0:	85be                	mv	a1,a5
    14f2:	fe043503          	ld	a0,-32(s0)
    14f6:	00000097          	auipc	ra,0x0
    14fa:	bda080e7          	jalr	-1062(ra) # 10d0 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    14fe:	fe043783          	ld	a5,-32(s0)
    1502:	57fc                	lw	a5,108(a5)
    1504:	ef91                	bnez	a5,1520 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    1506:	fe043783          	ld	a5,-32(s0)
    150a:	53f8                	lw	a4,100(a5)
    150c:	fe043783          	ld	a5,-32(s0)
    1510:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    1512:	a039                	j	1520 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    1514:	fe043503          	ld	a0,-32(s0)
    1518:	00000097          	auipc	ra,0x0
    151c:	d56080e7          	jalr	-682(ra) # 126e <__thread_exit>
}
    1520:	0001                	nop
    1522:	70a2                	ld	ra,40(sp)
    1524:	7402                	ld	s0,32(sp)
    1526:	6145                	addi	sp,sp,48
    1528:	8082                	ret

000000000000152a <switch_handler>:

void switch_handler(void *arg)
{
    152a:	7139                	addi	sp,sp,-64
    152c:	fc06                	sd	ra,56(sp)
    152e:	f822                	sd	s0,48(sp)
    1530:	0080                	addi	s0,sp,64
    1532:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    1536:	fc843783          	ld	a5,-56(s0)
    153a:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    153e:	00001797          	auipc	a5,0x1
    1542:	e2278793          	addi	a5,a5,-478 # 2360 <current>
    1546:	639c                	ld	a5,0(a5)
    1548:	fef43023          	sd	a5,-32(s0)
    154c:	fe043783          	ld	a5,-32(s0)
    1550:	fd878793          	addi	a5,a5,-40
    1554:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    1558:	fe843783          	ld	a5,-24(s0)
    155c:	0007871b          	sext.w	a4,a5
    1560:	00001797          	auipc	a5,0x1
    1564:	e0878793          	addi	a5,a5,-504 # 2368 <threading_system_time>
    1568:	439c                	lw	a5,0(a5)
    156a:	2781                	sext.w	a5,a5
    156c:	9fb9                	addw	a5,a5,a4
    156e:	2781                	sext.w	a5,a5
    1570:	0007871b          	sext.w	a4,a5
    1574:	00001797          	auipc	a5,0x1
    1578:	df478793          	addi	a5,a5,-524 # 2368 <threading_system_time>
    157c:	c398                	sw	a4,0(a5)
     __release();
    157e:	00000097          	auipc	ra,0x0
    1582:	bd2080e7          	jalr	-1070(ra) # 1150 <__release>
    current_thread->remaining_time -= elapsed_time;
    1586:	fd843783          	ld	a5,-40(s0)
    158a:	4bfc                	lw	a5,84(a5)
    158c:	0007871b          	sext.w	a4,a5
    1590:	fe843783          	ld	a5,-24(s0)
    1594:	2781                	sext.w	a5,a5
    1596:	40f707bb          	subw	a5,a4,a5
    159a:	2781                	sext.w	a5,a5
    159c:	0007871b          	sext.w	a4,a5
    15a0:	fd843783          	ld	a5,-40(s0)
    15a4:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    15a6:	fd843783          	ld	a5,-40(s0)
    15aa:	57fc                	lw	a5,108(a5)
    15ac:	e38d                	bnez	a5,15ce <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    15ae:	fd843783          	ld	a5,-40(s0)
    15b2:	57bc                	lw	a5,104(a5)
    15b4:	0007871b          	sext.w	a4,a5
    15b8:	fe843783          	ld	a5,-24(s0)
    15bc:	2781                	sext.w	a5,a5
    15be:	40f707bb          	subw	a5,a4,a5
    15c2:	2781                	sext.w	a5,a5
    15c4:	0007871b          	sext.w	a4,a5
    15c8:	fd843783          	ld	a5,-40(s0)
    15cc:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    15ce:	fd843783          	ld	a5,-40(s0)
    15d2:	43bc                	lw	a5,64(a5)
    15d4:	c3ad                	beqz	a5,1636 <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    15d6:	fd843783          	ld	a5,-40(s0)
    15da:	4fb8                	lw	a4,88(a5)
    15dc:	00001797          	auipc	a5,0x1
    15e0:	d8c78793          	addi	a5,a5,-628 # 2368 <threading_system_time>
    15e4:	439c                	lw	a5,0(a5)
    15e6:	02f74163          	blt	a4,a5,1608 <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    15ea:	fd843783          	ld	a5,-40(s0)
    15ee:	4fb8                	lw	a4,88(a5)
    15f0:	00001797          	auipc	a5,0x1
    15f4:	d7878793          	addi	a5,a5,-648 # 2368 <threading_system_time>
    15f8:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    15fa:	02f71e63          	bne	a4,a5,1636 <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    15fe:	fd843783          	ld	a5,-40(s0)
    1602:	4bfc                	lw	a5,84(a5)
    1604:	02f05963          	blez	a5,1636 <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    1608:	fd843783          	ld	a5,-40(s0)
    160c:	5fd8                	lw	a4,60(a5)
    160e:	00001797          	auipc	a5,0x1
    1612:	d5a78793          	addi	a5,a5,-678 # 2368 <threading_system_time>
    1616:	439c                	lw	a5,0(a5)
    1618:	863e                	mv	a2,a5
    161a:	85ba                	mv	a1,a4
    161c:	00001517          	auipc	a0,0x1
    1620:	af450513          	addi	a0,a0,-1292 # 2110 <schedule_edf_cbs+0x59a>
    1624:	fffff097          	auipc	ra,0xfffff
    1628:	45c080e7          	jalr	1116(ra) # a80 <printf>
            exit(0);
    162c:	4501                	li	a0,0
    162e:	fffff097          	auipc	ra,0xfffff
    1632:	f0c080e7          	jalr	-244(ra) # 53a <exit>
        }

    if (current_thread->remaining_time <= 0) {
    1636:	fd843783          	ld	a5,-40(s0)
    163a:	4bfc                	lw	a5,84(a5)
    163c:	02f04063          	bgtz	a5,165c <switch_handler+0x132>
        if (current_thread->is_real_time)
    1640:	fd843783          	ld	a5,-40(s0)
    1644:	43bc                	lw	a5,64(a5)
    1646:	c791                	beqz	a5,1652 <switch_handler+0x128>
            __rt_finish_current();
    1648:	00000097          	auipc	ra,0x0
    164c:	e0a080e7          	jalr	-502(ra) # 1452 <__rt_finish_current>
    1650:	a881                	j	16a0 <switch_handler+0x176>
        else
            __finish_current();
    1652:	00000097          	auipc	ra,0x0
    1656:	d3c080e7          	jalr	-708(ra) # 138e <__finish_current>
    165a:	a099                	j	16a0 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    165c:	00001797          	auipc	a5,0x1
    1660:	d0478793          	addi	a5,a5,-764 # 2360 <current>
    1664:	639c                	ld	a5,0(a5)
    1666:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    166a:	00001797          	auipc	a5,0x1
    166e:	cf678793          	addi	a5,a5,-778 # 2360 <current>
    1672:	639c                	ld	a5,0(a5)
    1674:	6798                	ld	a4,8(a5)
    1676:	00001797          	auipc	a5,0x1
    167a:	cea78793          	addi	a5,a5,-790 # 2360 <current>
    167e:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1680:	fd043503          	ld	a0,-48(s0)
    1684:	00000097          	auipc	ra,0x0
    1688:	840080e7          	jalr	-1984(ra) # ec4 <list_del>
        list_add_tail(to_remove, &run_queue);
    168c:	00001597          	auipc	a1,0x1
    1690:	c8c58593          	addi	a1,a1,-884 # 2318 <run_queue>
    1694:	fd043503          	ld	a0,-48(s0)
    1698:	fffff097          	auipc	ra,0xfffff
    169c:	7d0080e7          	jalr	2000(ra) # e68 <list_add_tail>
    }

    __release();
    16a0:	00000097          	auipc	ra,0x0
    16a4:	ab0080e7          	jalr	-1360(ra) # 1150 <__release>
    __schedule();
    16a8:	00000097          	auipc	ra,0x0
    16ac:	1f8080e7          	jalr	504(ra) # 18a0 <__schedule>
    __dispatch();
    16b0:	00000097          	auipc	ra,0x0
    16b4:	026080e7          	jalr	38(ra) # 16d6 <__dispatch>
    thrdresume(main_thrd_id);
    16b8:	00001797          	auipc	a5,0x1
    16bc:	c8078793          	addi	a5,a5,-896 # 2338 <main_thrd_id>
    16c0:	439c                	lw	a5,0(a5)
    16c2:	853e                	mv	a0,a5
    16c4:	fffff097          	auipc	ra,0xfffff
    16c8:	f1e080e7          	jalr	-226(ra) # 5e2 <thrdresume>
}
    16cc:	0001                	nop
    16ce:	70e2                	ld	ra,56(sp)
    16d0:	7442                	ld	s0,48(sp)
    16d2:	6121                	addi	sp,sp,64
    16d4:	8082                	ret

00000000000016d6 <__dispatch>:

void __dispatch()
{
    16d6:	7179                	addi	sp,sp,-48
    16d8:	f406                	sd	ra,40(sp)
    16da:	f022                	sd	s0,32(sp)
    16dc:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    16de:	00001797          	auipc	a5,0x1
    16e2:	c8278793          	addi	a5,a5,-894 # 2360 <current>
    16e6:	6398                	ld	a4,0(a5)
    16e8:	00001797          	auipc	a5,0x1
    16ec:	c3078793          	addi	a5,a5,-976 # 2318 <run_queue>
    16f0:	1af70363          	beq	a4,a5,1896 <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    16f4:	00001797          	auipc	a5,0x1
    16f8:	c6c78793          	addi	a5,a5,-916 # 2360 <current>
    16fc:	639c                	ld	a5,0(a5)
    16fe:	fef43423          	sd	a5,-24(s0)
    1702:	fe843783          	ld	a5,-24(s0)
    1706:	fd878793          	addi	a5,a5,-40
    170a:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    170e:	fe043783          	ld	a5,-32(s0)
    1712:	5fcc                	lw	a1,60(a5)
    1714:	00001797          	auipc	a5,0x1
    1718:	c5478793          	addi	a5,a5,-940 # 2368 <threading_system_time>
    171c:	4390                	lw	a2,0(a5)
    171e:	00001797          	auipc	a5,0x1
    1722:	c5278793          	addi	a5,a5,-942 # 2370 <allocated_time>
    1726:	6394                	ld	a3,0(a5)
    1728:	fe043783          	ld	a5,-32(s0)
    172c:	4bfc                	lw	a5,84(a5)
    172e:	873e                	mv	a4,a5
    1730:	00001517          	auipc	a0,0x1
    1734:	a1050513          	addi	a0,a0,-1520 # 2140 <schedule_edf_cbs+0x5ca>
    1738:	fffff097          	auipc	ra,0xfffff
    173c:	348080e7          	jalr	840(ra) # a80 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    1740:	fe043783          	ld	a5,-32(s0)
    1744:	43bc                	lw	a5,64(a5)
    1746:	c3a1                	beqz	a5,1786 <__dispatch+0xb0>
    1748:	00001797          	auipc	a5,0x1
    174c:	c2878793          	addi	a5,a5,-984 # 2370 <allocated_time>
    1750:	639c                	ld	a5,0(a5)
    1752:	eb95                	bnez	a5,1786 <__dispatch+0xb0>
    1754:	fe043783          	ld	a5,-32(s0)
    1758:	57fc                	lw	a5,108(a5)
    175a:	c795                	beqz	a5,1786 <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    175c:	fe043783          	ld	a5,-32(s0)
    1760:	5fd8                	lw	a4,60(a5)
    1762:	fe043783          	ld	a5,-32(s0)
    1766:	4fbc                	lw	a5,88(a5)
    1768:	863e                	mv	a2,a5
    176a:	85ba                	mv	a1,a4
    176c:	00001517          	auipc	a0,0x1
    1770:	a2450513          	addi	a0,a0,-1500 # 2190 <schedule_edf_cbs+0x61a>
    1774:	fffff097          	auipc	ra,0xfffff
    1778:	30c080e7          	jalr	780(ra) # a80 <printf>
        exit(0);
    177c:	4501                	li	a0,0
    177e:	fffff097          	auipc	ra,0xfffff
    1782:	dbc080e7          	jalr	-580(ra) # 53a <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    1786:	fe043783          	ld	a5,-32(s0)
    178a:	5fd8                	lw	a4,60(a5)
    178c:	00001797          	auipc	a5,0x1
    1790:	bdc78793          	addi	a5,a5,-1060 # 2368 <threading_system_time>
    1794:	4390                	lw	a2,0(a5)
    1796:	00001797          	auipc	a5,0x1
    179a:	bda78793          	addi	a5,a5,-1062 # 2370 <allocated_time>
    179e:	639c                	ld	a5,0(a5)
    17a0:	86be                	mv	a3,a5
    17a2:	85ba                	mv	a1,a4
    17a4:	00001517          	auipc	a0,0x1
    17a8:	a1c50513          	addi	a0,a0,-1508 # 21c0 <schedule_edf_cbs+0x64a>
    17ac:	fffff097          	auipc	ra,0xfffff
    17b0:	2d4080e7          	jalr	724(ra) # a80 <printf>

    if (current_thread->buf_set) {
    17b4:	fe043783          	ld	a5,-32(s0)
    17b8:	539c                	lw	a5,32(a5)
    17ba:	c7a1                	beqz	a5,1802 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    17bc:	00001797          	auipc	a5,0x1
    17c0:	bb478793          	addi	a5,a5,-1100 # 2370 <allocated_time>
    17c4:	639c                	ld	a5,0(a5)
    17c6:	0007871b          	sext.w	a4,a5
    17ca:	fe043783          	ld	a5,-32(s0)
    17ce:	03878593          	addi	a1,a5,56
    17d2:	00001797          	auipc	a5,0x1
    17d6:	b9e78793          	addi	a5,a5,-1122 # 2370 <allocated_time>
    17da:	639c                	ld	a5,0(a5)
    17dc:	86be                	mv	a3,a5
    17de:	00000617          	auipc	a2,0x0
    17e2:	d4c60613          	addi	a2,a2,-692 # 152a <switch_handler>
    17e6:	853a                	mv	a0,a4
    17e8:	fffff097          	auipc	ra,0xfffff
    17ec:	df2080e7          	jalr	-526(ra) # 5da <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    17f0:	fe043783          	ld	a5,-32(s0)
    17f4:	5f9c                	lw	a5,56(a5)
    17f6:	853e                	mv	a0,a5
    17f8:	fffff097          	auipc	ra,0xfffff
    17fc:	dea080e7          	jalr	-534(ra) # 5e2 <thrdresume>
    1800:	a071                	j	188c <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    1802:	fe043783          	ld	a5,-32(s0)
    1806:	4705                	li	a4,1
    1808:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    180a:	fe043783          	ld	a5,-32(s0)
    180e:	6f9c                	ld	a5,24(a5)
    1810:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1814:	fe043783          	ld	a5,-32(s0)
    1818:	577d                	li	a4,-1
    181a:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    181c:	00001797          	auipc	a5,0x1
    1820:	b5478793          	addi	a5,a5,-1196 # 2370 <allocated_time>
    1824:	639c                	ld	a5,0(a5)
    1826:	0007871b          	sext.w	a4,a5
    182a:	fe043783          	ld	a5,-32(s0)
    182e:	03878593          	addi	a1,a5,56
    1832:	00001797          	auipc	a5,0x1
    1836:	b3e78793          	addi	a5,a5,-1218 # 2370 <allocated_time>
    183a:	639c                	ld	a5,0(a5)
    183c:	86be                	mv	a3,a5
    183e:	00000617          	auipc	a2,0x0
    1842:	cec60613          	addi	a2,a2,-788 # 152a <switch_handler>
    1846:	853a                	mv	a0,a4
    1848:	fffff097          	auipc	ra,0xfffff
    184c:	d92080e7          	jalr	-622(ra) # 5da <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    1850:	fe043783          	ld	a5,-32(s0)
    1854:	5f9c                	lw	a5,56(a5)
    1856:	0207d063          	bgez	a5,1876 <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    185a:	00001597          	auipc	a1,0x1
    185e:	99658593          	addi	a1,a1,-1642 # 21f0 <schedule_edf_cbs+0x67a>
    1862:	4509                	li	a0,2
    1864:	fffff097          	auipc	ra,0xfffff
    1868:	1c4080e7          	jalr	452(ra) # a28 <fprintf>
            exit(1);
    186c:	4505                	li	a0,1
    186e:	fffff097          	auipc	ra,0xfffff
    1872:	ccc080e7          	jalr	-820(ra) # 53a <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    1876:	fd843783          	ld	a5,-40(s0)
    187a:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    187c:	fe043783          	ld	a5,-32(s0)
    1880:	6398                	ld	a4,0(a5)
    1882:	fe043783          	ld	a5,-32(s0)
    1886:	679c                	ld	a5,8(a5)
    1888:	853e                	mv	a0,a5
    188a:	9702                	jalr	a4
    }
    thread_exit();
    188c:	00000097          	auipc	ra,0x0
    1890:	a5a080e7          	jalr	-1446(ra) # 12e6 <thread_exit>
    1894:	a011                	j	1898 <__dispatch+0x1c2>
        return;
    1896:	0001                	nop
}
    1898:	70a2                	ld	ra,40(sp)
    189a:	7402                	ld	s0,32(sp)
    189c:	6145                	addi	sp,sp,48
    189e:	8082                	ret

00000000000018a0 <__schedule>:

void __schedule()
{
    18a0:	711d                	addi	sp,sp,-96
    18a2:	ec86                	sd	ra,88(sp)
    18a4:	e8a2                	sd	s0,80(sp)
    18a6:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    18a8:	00001797          	auipc	a5,0x1
    18ac:	ac078793          	addi	a5,a5,-1344 # 2368 <threading_system_time>
    18b0:	439c                	lw	a5,0(a5)
    18b2:	fcf42c23          	sw	a5,-40(s0)
    18b6:	4789                	li	a5,2
    18b8:	fcf42e23          	sw	a5,-36(s0)
    18bc:	00001797          	auipc	a5,0x1
    18c0:	a5c78793          	addi	a5,a5,-1444 # 2318 <run_queue>
    18c4:	fef43023          	sd	a5,-32(s0)
    18c8:	00001797          	auipc	a5,0x1
    18cc:	a6078793          	addi	a5,a5,-1440 # 2328 <release_queue>
    18d0:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    18d4:	fd843783          	ld	a5,-40(s0)
    18d8:	faf43023          	sd	a5,-96(s0)
    18dc:	fe043783          	ld	a5,-32(s0)
    18e0:	faf43423          	sd	a5,-88(s0)
    18e4:	fe843783          	ld	a5,-24(s0)
    18e8:	faf43823          	sd	a5,-80(s0)
    18ec:	fa040793          	addi	a5,s0,-96
    18f0:	853e                	mv	a0,a5
    18f2:	00000097          	auipc	ra,0x0
    18f6:	284080e7          	jalr	644(ra) # 1b76 <schedule_edf_cbs>
    18fa:	872a                	mv	a4,a0
    18fc:	87ae                	mv	a5,a1
    18fe:	fce43423          	sd	a4,-56(s0)
    1902:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    1906:	fc843703          	ld	a4,-56(s0)
    190a:	00001797          	auipc	a5,0x1
    190e:	a5678793          	addi	a5,a5,-1450 # 2360 <current>
    1912:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1914:	fd042783          	lw	a5,-48(s0)
    1918:	873e                	mv	a4,a5
    191a:	00001797          	auipc	a5,0x1
    191e:	a5678793          	addi	a5,a5,-1450 # 2370 <allocated_time>
    1922:	e398                	sd	a4,0(a5)
}
    1924:	0001                	nop
    1926:	60e6                	ld	ra,88(sp)
    1928:	6446                	ld	s0,80(sp)
    192a:	6125                	addi	sp,sp,96
    192c:	8082                	ret

000000000000192e <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    192e:	1101                	addi	sp,sp,-32
    1930:	ec06                	sd	ra,24(sp)
    1932:	e822                	sd	s0,16(sp)
    1934:	1000                	addi	s0,sp,32
    1936:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    193a:	00001797          	auipc	a5,0x1
    193e:	a3278793          	addi	a5,a5,-1486 # 236c <sleeping>
    1942:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1946:	fe843783          	ld	a5,-24(s0)
    194a:	0007871b          	sext.w	a4,a5
    194e:	00001797          	auipc	a5,0x1
    1952:	a1a78793          	addi	a5,a5,-1510 # 2368 <threading_system_time>
    1956:	439c                	lw	a5,0(a5)
    1958:	2781                	sext.w	a5,a5
    195a:	9fb9                	addw	a5,a5,a4
    195c:	2781                	sext.w	a5,a5
    195e:	0007871b          	sext.w	a4,a5
    1962:	00001797          	auipc	a5,0x1
    1966:	a0678793          	addi	a5,a5,-1530 # 2368 <threading_system_time>
    196a:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    196c:	00001797          	auipc	a5,0x1
    1970:	9cc78793          	addi	a5,a5,-1588 # 2338 <main_thrd_id>
    1974:	439c                	lw	a5,0(a5)
    1976:	853e                	mv	a0,a5
    1978:	fffff097          	auipc	ra,0xfffff
    197c:	c6a080e7          	jalr	-918(ra) # 5e2 <thrdresume>
}
    1980:	0001                	nop
    1982:	60e2                	ld	ra,24(sp)
    1984:	6442                	ld	s0,16(sp)
    1986:	6105                	addi	sp,sp,32
    1988:	8082                	ret

000000000000198a <thread_start_threading>:

void thread_start_threading()
{
    198a:	1141                	addi	sp,sp,-16
    198c:	e406                	sd	ra,8(sp)
    198e:	e022                	sd	s0,0(sp)
    1990:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1992:	00001797          	auipc	a5,0x1
    1996:	9d678793          	addi	a5,a5,-1578 # 2368 <threading_system_time>
    199a:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    199e:	00001797          	auipc	a5,0x1
    19a2:	9c278793          	addi	a5,a5,-1598 # 2360 <current>
    19a6:	00001717          	auipc	a4,0x1
    19aa:	97270713          	addi	a4,a4,-1678 # 2318 <run_queue>
    19ae:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    19b0:	4681                	li	a3,0
    19b2:	00000617          	auipc	a2,0x0
    19b6:	f7c60613          	addi	a2,a2,-132 # 192e <back_to_main_handler>
    19ba:	00001597          	auipc	a1,0x1
    19be:	97e58593          	addi	a1,a1,-1666 # 2338 <main_thrd_id>
    19c2:	3e800513          	li	a0,1000
    19c6:	fffff097          	auipc	ra,0xfffff
    19ca:	c14080e7          	jalr	-1004(ra) # 5da <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    19ce:	00001797          	auipc	a5,0x1
    19d2:	96a78793          	addi	a5,a5,-1686 # 2338 <main_thrd_id>
    19d6:	439c                	lw	a5,0(a5)
    19d8:	4581                	li	a1,0
    19da:	853e                	mv	a0,a5
    19dc:	fffff097          	auipc	ra,0xfffff
    19e0:	c0e080e7          	jalr	-1010(ra) # 5ea <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    19e4:	a0c9                	j	1aa6 <thread_start_threading+0x11c>
        __release();
    19e6:	fffff097          	auipc	ra,0xfffff
    19ea:	76a080e7          	jalr	1898(ra) # 1150 <__release>
        __schedule();
    19ee:	00000097          	auipc	ra,0x0
    19f2:	eb2080e7          	jalr	-334(ra) # 18a0 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    19f6:	00001797          	auipc	a5,0x1
    19fa:	94278793          	addi	a5,a5,-1726 # 2338 <main_thrd_id>
    19fe:	439c                	lw	a5,0(a5)
    1a00:	4581                	li	a1,0
    1a02:	853e                	mv	a0,a5
    1a04:	fffff097          	auipc	ra,0xfffff
    1a08:	be6080e7          	jalr	-1050(ra) # 5ea <cancelthrdstop>
        __dispatch();
    1a0c:	00000097          	auipc	ra,0x0
    1a10:	cca080e7          	jalr	-822(ra) # 16d6 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1a14:	00001517          	auipc	a0,0x1
    1a18:	90450513          	addi	a0,a0,-1788 # 2318 <run_queue>
    1a1c:	fffff097          	auipc	ra,0xfffff
    1a20:	4f2080e7          	jalr	1266(ra) # f0e <list_empty>
    1a24:	87aa                	mv	a5,a0
    1a26:	cb99                	beqz	a5,1a3c <thread_start_threading+0xb2>
    1a28:	00001517          	auipc	a0,0x1
    1a2c:	90050513          	addi	a0,a0,-1792 # 2328 <release_queue>
    1a30:	fffff097          	auipc	ra,0xfffff
    1a34:	4de080e7          	jalr	1246(ra) # f0e <list_empty>
    1a38:	87aa                	mv	a5,a0
    1a3a:	ebd9                	bnez	a5,1ad0 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1a3c:	00001797          	auipc	a5,0x1
    1a40:	93478793          	addi	a5,a5,-1740 # 2370 <allocated_time>
    1a44:	639c                	ld	a5,0(a5)
    1a46:	85be                	mv	a1,a5
    1a48:	00000517          	auipc	a0,0x0
    1a4c:	7e050513          	addi	a0,a0,2016 # 2228 <schedule_edf_cbs+0x6b2>
    1a50:	fffff097          	auipc	ra,0xfffff
    1a54:	030080e7          	jalr	48(ra) # a80 <printf>
        sleeping = 1;
    1a58:	00001797          	auipc	a5,0x1
    1a5c:	91478793          	addi	a5,a5,-1772 # 236c <sleeping>
    1a60:	4705                	li	a4,1
    1a62:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1a64:	00001797          	auipc	a5,0x1
    1a68:	90c78793          	addi	a5,a5,-1780 # 2370 <allocated_time>
    1a6c:	639c                	ld	a5,0(a5)
    1a6e:	0007871b          	sext.w	a4,a5
    1a72:	00001797          	auipc	a5,0x1
    1a76:	8fe78793          	addi	a5,a5,-1794 # 2370 <allocated_time>
    1a7a:	639c                	ld	a5,0(a5)
    1a7c:	86be                	mv	a3,a5
    1a7e:	00000617          	auipc	a2,0x0
    1a82:	eb060613          	addi	a2,a2,-336 # 192e <back_to_main_handler>
    1a86:	00001597          	auipc	a1,0x1
    1a8a:	8b258593          	addi	a1,a1,-1870 # 2338 <main_thrd_id>
    1a8e:	853a                	mv	a0,a4
    1a90:	fffff097          	auipc	ra,0xfffff
    1a94:	b4a080e7          	jalr	-1206(ra) # 5da <thrdstop>
        while (sleeping) {
    1a98:	0001                	nop
    1a9a:	00001797          	auipc	a5,0x1
    1a9e:	8d278793          	addi	a5,a5,-1838 # 236c <sleeping>
    1aa2:	439c                	lw	a5,0(a5)
    1aa4:	fbfd                	bnez	a5,1a9a <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1aa6:	00001517          	auipc	a0,0x1
    1aaa:	87250513          	addi	a0,a0,-1934 # 2318 <run_queue>
    1aae:	fffff097          	auipc	ra,0xfffff
    1ab2:	460080e7          	jalr	1120(ra) # f0e <list_empty>
    1ab6:	87aa                	mv	a5,a0
    1ab8:	d79d                	beqz	a5,19e6 <thread_start_threading+0x5c>
    1aba:	00001517          	auipc	a0,0x1
    1abe:	86e50513          	addi	a0,a0,-1938 # 2328 <release_queue>
    1ac2:	fffff097          	auipc	ra,0xfffff
    1ac6:	44c080e7          	jalr	1100(ra) # f0e <list_empty>
    1aca:	87aa                	mv	a5,a0
    1acc:	df89                	beqz	a5,19e6 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1ace:	a011                	j	1ad2 <thread_start_threading+0x148>
            break;
    1ad0:	0001                	nop
}
    1ad2:	0001                	nop
    1ad4:	60a2                	ld	ra,8(sp)
    1ad6:	6402                	ld	s0,0(sp)
    1ad8:	0141                	addi	sp,sp,16
    1ada:	8082                	ret

0000000000001adc <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1adc:	7139                	addi	sp,sp,-64
    1ade:	fc22                	sd	s0,56(sp)
    1ae0:	0080                	addi	s0,sp,64
    1ae2:	fca43423          	sd	a0,-56(s0)
    1ae6:	87ae                	mv	a5,a1
    1ae8:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1aec:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1af0:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1af4:	fc843783          	ld	a5,-56(s0)
    1af8:	639c                	ld	a5,0(a5)
    1afa:	fcf43c23          	sd	a5,-40(s0)
    1afe:	fd843783          	ld	a5,-40(s0)
    1b02:	fd878793          	addi	a5,a5,-40
    1b06:	fef43423          	sd	a5,-24(s0)
    1b0a:	a881                	j	1b5a <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1b0c:	fe843783          	ld	a5,-24(s0)
    1b10:	4fb8                	lw	a4,88(a5)
    1b12:	fc442783          	lw	a5,-60(s0)
    1b16:	2781                	sext.w	a5,a5
    1b18:	02e7c663          	blt	a5,a4,1b44 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1b1c:	fe043783          	ld	a5,-32(s0)
    1b20:	e791                	bnez	a5,1b2c <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1b22:	fe843783          	ld	a5,-24(s0)
    1b26:	fef43023          	sd	a5,-32(s0)
    1b2a:	a829                	j	1b44 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1b2c:	fe843783          	ld	a5,-24(s0)
    1b30:	5fd8                	lw	a4,60(a5)
    1b32:	fe043783          	ld	a5,-32(s0)
    1b36:	5fdc                	lw	a5,60(a5)
    1b38:	00f75663          	bge	a4,a5,1b44 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1b3c:	fe843783          	ld	a5,-24(s0)
    1b40:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1b44:	fe843783          	ld	a5,-24(s0)
    1b48:	779c                	ld	a5,40(a5)
    1b4a:	fcf43823          	sd	a5,-48(s0)
    1b4e:	fd043783          	ld	a5,-48(s0)
    1b52:	fd878793          	addi	a5,a5,-40
    1b56:	fef43423          	sd	a5,-24(s0)
    1b5a:	fe843783          	ld	a5,-24(s0)
    1b5e:	02878793          	addi	a5,a5,40
    1b62:	fc843703          	ld	a4,-56(s0)
    1b66:	faf713e3          	bne	a4,a5,1b0c <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1b6a:	fe043783          	ld	a5,-32(s0)
}
    1b6e:	853e                	mv	a0,a5
    1b70:	7462                	ld	s0,56(sp)
    1b72:	6121                	addi	sp,sp,64
    1b74:	8082                	ret

0000000000001b76 <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1b76:	7131                	addi	sp,sp,-192
    1b78:	fd06                	sd	ra,184(sp)
    1b7a:	f922                	sd	s0,176(sp)
    1b7c:	f526                	sd	s1,168(sp)
    1b7e:	f14a                	sd	s2,160(sp)
    1b80:	ed4e                	sd	s3,152(sp)
    1b82:	0180                	addi	s0,sp,192
    1b84:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1b86:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1b8a:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1b8e:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1b92:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1b96:	649c                	ld	a5,8(s1)
    1b98:	4098                	lw	a4,0(s1)
    1b9a:	85ba                	mv	a1,a4
    1b9c:	853e                	mv	a0,a5
    1b9e:	00000097          	auipc	ra,0x0
    1ba2:	f3e080e7          	jalr	-194(ra) # 1adc <__check_deadline_miss>
    1ba6:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1baa:	f9843783          	ld	a5,-104(s0)
    1bae:	c7b5                	beqz	a5,1c1a <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1bb0:	f9843783          	ld	a5,-104(s0)
    1bb4:	5fdc                	lw	a5,60(a5)
    1bb6:	85be                	mv	a1,a5
    1bb8:	00000517          	auipc	a0,0x0
    1bbc:	69850513          	addi	a0,a0,1688 # 2250 <schedule_edf_cbs+0x6da>
    1bc0:	fffff097          	auipc	ra,0xfffff
    1bc4:	ec0080e7          	jalr	-320(ra) # a80 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1bc8:	f9843783          	ld	a5,-104(s0)
    1bcc:	57fc                	lw	a5,108(a5)
    1bce:	c395                	beqz	a5,1bf2 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1bd0:	f9843783          	ld	a5,-104(s0)
    1bd4:	02878793          	addi	a5,a5,40
    1bd8:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1bdc:	f4042423          	sw	zero,-184(s0)
            return r;
    1be0:	f4043783          	ld	a5,-192(s0)
    1be4:	f4f43823          	sd	a5,-176(s0)
    1be8:	f4843783          	ld	a5,-184(s0)
    1bec:	f4f43c23          	sd	a5,-168(s0)
    1bf0:	a13d                	j	201e <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1bf2:	4098                	lw	a4,0(s1)
    1bf4:	f9843783          	ld	a5,-104(s0)
    1bf8:	47fc                	lw	a5,76(a5)
    1bfa:	9fb9                	addw	a5,a5,a4
    1bfc:	0007871b          	sext.w	a4,a5
    1c00:	f9843783          	ld	a5,-104(s0)
    1c04:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1c06:	f9843783          	ld	a5,-104(s0)
    1c0a:	53f8                	lw	a4,100(a5)
    1c0c:	f9843783          	ld	a5,-104(s0)
    1c10:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1c12:	f9843783          	ld	a5,-104(s0)
    1c16:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1c1a:	fa043783          	ld	a5,-96(s0)
    1c1e:	e7dd                	bnez	a5,1ccc <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1c20:	649c                	ld	a5,8(s1)
    1c22:	639c                	ld	a5,0(a5)
    1c24:	f8f43823          	sd	a5,-112(s0)
    1c28:	f9043783          	ld	a5,-112(s0)
    1c2c:	fd878793          	addi	a5,a5,-40
    1c30:	faf43c23          	sd	a5,-72(s0)
    1c34:	a069                	j	1cbe <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1c36:	fb843783          	ld	a5,-72(s0)
    1c3a:	5fd8                	lw	a4,60(a5)
    1c3c:	fb843783          	ld	a5,-72(s0)
    1c40:	5bbc                	lw	a5,112(a5)
    1c42:	863e                	mv	a2,a5
    1c44:	85ba                	mv	a1,a4
    1c46:	00000517          	auipc	a0,0x0
    1c4a:	64250513          	addi	a0,a0,1602 # 2288 <schedule_edf_cbs+0x712>
    1c4e:	fffff097          	auipc	ra,0xfffff
    1c52:	e32080e7          	jalr	-462(ra) # a80 <printf>
            if (next == NULL)
    1c56:	fa043783          	ld	a5,-96(s0)
    1c5a:	e791                	bnez	a5,1c66 <schedule_edf_cbs+0xf0>
                next = th;
    1c5c:	fb843783          	ld	a5,-72(s0)
    1c60:	faf43023          	sd	a5,-96(s0)
    1c64:	a091                	j	1ca8 <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1c66:	fb843783          	ld	a5,-72(s0)
    1c6a:	4fb8                	lw	a4,88(a5)
    1c6c:	fa043783          	ld	a5,-96(s0)
    1c70:	4fbc                	lw	a5,88(a5)
    1c72:	00f75763          	bge	a4,a5,1c80 <schedule_edf_cbs+0x10a>
                next = th;
    1c76:	fb843783          	ld	a5,-72(s0)
    1c7a:	faf43023          	sd	a5,-96(s0)
    1c7e:	a02d                	j	1ca8 <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1c80:	fb843783          	ld	a5,-72(s0)
    1c84:	4fb8                	lw	a4,88(a5)
    1c86:	fa043783          	ld	a5,-96(s0)
    1c8a:	4fbc                	lw	a5,88(a5)
    1c8c:	00f71e63          	bne	a4,a5,1ca8 <schedule_edf_cbs+0x132>
    1c90:	fb843783          	ld	a5,-72(s0)
    1c94:	5fd8                	lw	a4,60(a5)
    1c96:	fa043783          	ld	a5,-96(s0)
    1c9a:	5fdc                	lw	a5,60(a5)
    1c9c:	00f75663          	bge	a4,a5,1ca8 <schedule_edf_cbs+0x132>
                next = th;
    1ca0:	fb843783          	ld	a5,-72(s0)
    1ca4:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1ca8:	fb843783          	ld	a5,-72(s0)
    1cac:	779c                	ld	a5,40(a5)
    1cae:	f8f43423          	sd	a5,-120(s0)
    1cb2:	f8843783          	ld	a5,-120(s0)
    1cb6:	fd878793          	addi	a5,a5,-40
    1cba:	faf43c23          	sd	a5,-72(s0)
    1cbe:	fb843783          	ld	a5,-72(s0)
    1cc2:	02878713          	addi	a4,a5,40
    1cc6:	649c                	ld	a5,8(s1)
    1cc8:	f6f717e3          	bne	a4,a5,1c36 <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1ccc:	fa043783          	ld	a5,-96(s0)
    1cd0:	5fdc                	lw	a5,60(a5)
    1cd2:	85be                	mv	a1,a5
    1cd4:	00000517          	auipc	a0,0x0
    1cd8:	5ec50513          	addi	a0,a0,1516 # 22c0 <schedule_edf_cbs+0x74a>
    1cdc:	fffff097          	auipc	ra,0xfffff
    1ce0:	da4080e7          	jalr	-604(ra) # a80 <printf>

    if(next && next->cbs.is_throttled){
    1ce4:	fa043783          	ld	a5,-96(s0)
    1ce8:	cb95                	beqz	a5,1d1c <schedule_edf_cbs+0x1a6>
    1cea:	fa043783          	ld	a5,-96(s0)
    1cee:	5bbc                	lw	a5,112(a5)
    1cf0:	c795                	beqz	a5,1d1c <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1cf2:	fa043783          	ld	a5,-96(s0)
    1cf6:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1cfa:	fa043783          	ld	a5,-96(s0)
    1cfe:	02878793          	addi	a5,a5,40
    1d02:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1d06:	f4042423          	sw	zero,-184(s0)
        return r;
    1d0a:	f4043783          	ld	a5,-192(s0)
    1d0e:	f4f43823          	sd	a5,-176(s0)
    1d12:	f4843783          	ld	a5,-184(s0)
    1d16:	f4f43c23          	sd	a5,-168(s0)
    1d1a:	a611                	j	201e <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1d1c:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d20:	689c                	ld	a5,16(s1)
    1d22:	639c                	ld	a5,0(a5)
    1d24:	f8f43023          	sd	a5,-128(s0)
    1d28:	f8043783          	ld	a5,-128(s0)
    1d2c:	17e1                	addi	a5,a5,-8
    1d2e:	fcf43023          	sd	a5,-64(s0)
    1d32:	a0b5                	j	1d9e <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1d34:	fa843783          	ld	a5,-88(s0)
    1d38:	e791                	bnez	a5,1d44 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1d3a:	fc043783          	ld	a5,-64(s0)
    1d3e:	faf43423          	sd	a5,-88(s0)
    1d42:	a0a1                	j	1d8a <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1d44:	fa843783          	ld	a5,-88(s0)
    1d48:	4f98                	lw	a4,24(a5)
    1d4a:	fc043783          	ld	a5,-64(s0)
    1d4e:	4f9c                	lw	a5,24(a5)
    1d50:	00e7d763          	bge	a5,a4,1d5e <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1d54:	fc043783          	ld	a5,-64(s0)
    1d58:	faf43423          	sd	a5,-88(s0)
    1d5c:	a03d                	j	1d8a <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1d5e:	fa843783          	ld	a5,-88(s0)
    1d62:	4f98                	lw	a4,24(a5)
    1d64:	fc043783          	ld	a5,-64(s0)
    1d68:	4f9c                	lw	a5,24(a5)
    1d6a:	02f71063          	bne	a4,a5,1d8a <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1d6e:	fa843783          	ld	a5,-88(s0)
    1d72:	639c                	ld	a5,0(a5)
    1d74:	4fb8                	lw	a4,88(a5)
    1d76:	fc043783          	ld	a5,-64(s0)
    1d7a:	639c                	ld	a5,0(a5)
    1d7c:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1d7e:	00e7d663          	bge	a5,a4,1d8a <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1d82:	fc043783          	ld	a5,-64(s0)
    1d86:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d8a:	fc043783          	ld	a5,-64(s0)
    1d8e:	679c                	ld	a5,8(a5)
    1d90:	f6f43023          	sd	a5,-160(s0)
    1d94:	f6043783          	ld	a5,-160(s0)
    1d98:	17e1                	addi	a5,a5,-8
    1d9a:	fcf43023          	sd	a5,-64(s0)
    1d9e:	fc043783          	ld	a5,-64(s0)
    1da2:	00878713          	addi	a4,a5,8
    1da6:	689c                	ld	a5,16(s1)
    1da8:	f8f716e3          	bne	a4,a5,1d34 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1dac:	689c                	ld	a5,16(s1)
    1dae:	639c                	ld	a5,0(a5)
    1db0:	f6f43c23          	sd	a5,-136(s0)
    1db4:	f7843783          	ld	a5,-136(s0)
    1db8:	17e1                	addi	a5,a5,-8
    1dba:	fcf43023          	sd	a5,-64(s0)
    1dbe:	a069                	j	1e48 <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1dc0:	fb043783          	ld	a5,-80(s0)
    1dc4:	eb99                	bnez	a5,1dda <schedule_edf_cbs+0x264>
    1dc6:	fc043783          	ld	a5,-64(s0)
    1dca:	639c                	ld	a5,0(a5)
    1dcc:	57fc                	lw	a5,108(a5)
    1dce:	c791                	beqz	a5,1dda <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1dd0:	fc043783          	ld	a5,-64(s0)
    1dd4:	faf43823          	sd	a5,-80(s0)
    1dd8:	a8b1                	j	1e34 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1dda:	fc043783          	ld	a5,-64(s0)
    1dde:	639c                	ld	a5,0(a5)
    1de0:	57fc                	lw	a5,108(a5)
    1de2:	cf91                	beqz	a5,1dfe <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1de4:	fb043783          	ld	a5,-80(s0)
    1de8:	4f98                	lw	a4,24(a5)
    1dea:	fc043783          	ld	a5,-64(s0)
    1dee:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1df0:	00e7d763          	bge	a5,a4,1dfe <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1df4:	fc043783          	ld	a5,-64(s0)
    1df8:	faf43823          	sd	a5,-80(s0)
    1dfc:	a825                	j	1e34 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1dfe:	fc043783          	ld	a5,-64(s0)
    1e02:	639c                	ld	a5,0(a5)
    1e04:	57fc                	lw	a5,108(a5)
    1e06:	c79d                	beqz	a5,1e34 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1e08:	fb043783          	ld	a5,-80(s0)
    1e0c:	4f98                	lw	a4,24(a5)
    1e0e:	fc043783          	ld	a5,-64(s0)
    1e12:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1e14:	02f71063          	bne	a4,a5,1e34 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1e18:	fb043783          	ld	a5,-80(s0)
    1e1c:	639c                	ld	a5,0(a5)
    1e1e:	4fb8                	lw	a4,88(a5)
    1e20:	fc043783          	ld	a5,-64(s0)
    1e24:	639c                	ld	a5,0(a5)
    1e26:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1e28:	00e7d663          	bge	a5,a4,1e34 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1e2c:	fc043783          	ld	a5,-64(s0)
    1e30:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1e34:	fc043783          	ld	a5,-64(s0)
    1e38:	679c                	ld	a5,8(a5)
    1e3a:	f6f43423          	sd	a5,-152(s0)
    1e3e:	f6843783          	ld	a5,-152(s0)
    1e42:	17e1                	addi	a5,a5,-8
    1e44:	fcf43023          	sd	a5,-64(s0)
    1e48:	fc043783          	ld	a5,-64(s0)
    1e4c:	00878713          	addi	a4,a5,8
    1e50:	689c                	ld	a5,16(s1)
    1e52:	f6f717e3          	bne	a4,a5,1dc0 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1e56:	fa043783          	ld	a5,-96(s0)
    1e5a:	cb89                	beqz	a5,1e6c <schedule_edf_cbs+0x2f6>
    1e5c:	fa043783          	ld	a5,-96(s0)
    1e60:	57fc                	lw	a5,108(a5)
    1e62:	c789                	beqz	a5,1e6c <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1e64:	fb043783          	ld	a5,-80(s0)
    1e68:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1e6c:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1e70:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1e74:	fa843783          	ld	a5,-88(s0)
    1e78:	c3c5                	beqz	a5,1f18 <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1e7a:	fa843783          	ld	a5,-88(s0)
    1e7e:	639c                	ld	a5,0(a5)
    1e80:	5fdc                	lw	a5,60(a5)
    1e82:	85be                	mv	a1,a5
    1e84:	00000517          	auipc	a0,0x0
    1e88:	45c50513          	addi	a0,a0,1116 # 22e0 <schedule_edf_cbs+0x76a>
    1e8c:	fffff097          	auipc	ra,0xfffff
    1e90:	bf4080e7          	jalr	-1036(ra) # a80 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    1e94:	fa843783          	ld	a5,-88(s0)
    1e98:	4f98                	lw	a4,24(a5)
    1e9a:	409c                	lw	a5,0(s1)
    1e9c:	40f707bb          	subw	a5,a4,a5
    1ea0:	fcf42623          	sw	a5,-52(s0)
        if (next){
    1ea4:	fa043783          	ld	a5,-96(s0)
    1ea8:	cba5                	beqz	a5,1f18 <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    1eaa:	fa043783          	ld	a5,-96(s0)
    1eae:	4bf8                	lw	a4,84(a5)
    1eb0:	fcc42783          	lw	a5,-52(s0)
    1eb4:	2781                	sext.w	a5,a5
    1eb6:	06e7d163          	bge	a5,a4,1f18 <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    1eba:	fa043783          	ld	a5,-96(s0)
    1ebe:	57fc                	lw	a5,108(a5)
    1ec0:	eb91                	bnez	a5,1ed4 <schedule_edf_cbs+0x35e>
    1ec2:	fa843783          	ld	a5,-88(s0)
    1ec6:	639c                	ld	a5,0(a5)
    1ec8:	57fc                	lw	a5,108(a5)
    1eca:	c789                	beqz	a5,1ed4 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    1ecc:	4785                	li	a5,1
    1ece:	fcf42423          	sw	a5,-56(s0)
    1ed2:	a099                	j	1f18 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    1ed4:	fa043783          	ld	a5,-96(s0)
    1ed8:	4fb8                	lw	a4,88(a5)
    1eda:	fa843783          	ld	a5,-88(s0)
    1ede:	639c                	ld	a5,0(a5)
    1ee0:	4fbc                	lw	a5,88(a5)
    1ee2:	00e7d663          	bge	a5,a4,1eee <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    1ee6:	4785                	li	a5,1
    1ee8:	fcf42423          	sw	a5,-56(s0)
    1eec:	a035                	j	1f18 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1eee:	fa043783          	ld	a5,-96(s0)
    1ef2:	4fb8                	lw	a4,88(a5)
    1ef4:	fa843783          	ld	a5,-88(s0)
    1ef8:	639c                	ld	a5,0(a5)
    1efa:	4fbc                	lw	a5,88(a5)
    1efc:	00f71e63          	bne	a4,a5,1f18 <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    1f00:	fa043783          	ld	a5,-96(s0)
    1f04:	5fd8                	lw	a4,60(a5)
    1f06:	fa843783          	ld	a5,-88(s0)
    1f0a:	639c                	ld	a5,0(a5)
    1f0c:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1f0e:	00e7d563          	bge	a5,a4,1f18 <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    1f12:	4785                	li	a5,1
    1f14:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    1f18:	fa043783          	ld	a5,-96(s0)
    1f1c:	cbd1                	beqz	a5,1fb0 <schedule_edf_cbs+0x43a>
    1f1e:	fa043783          	ld	a5,-96(s0)
    1f22:	57fc                	lw	a5,108(a5)
    1f24:	e7d1                	bnez	a5,1fb0 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    1f26:	fa043783          	ld	a5,-96(s0)
    1f2a:	4fb8                	lw	a4,88(a5)
    1f2c:	409c                	lw	a5,0(s1)
    1f2e:	40f707bb          	subw	a5,a4,a5
    1f32:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    1f36:	fa043783          	ld	a5,-96(s0)
    1f3a:	47f8                	lw	a4,76(a5)
    1f3c:	fa043783          	ld	a5,-96(s0)
    1f40:	57bc                	lw	a5,104(a5)
    1f42:	02f707bb          	mulw	a5,a4,a5
    1f46:	0007869b          	sext.w	a3,a5
    1f4a:	fa043783          	ld	a5,-96(s0)
    1f4e:	53fc                	lw	a5,100(a5)
    1f50:	f7442703          	lw	a4,-140(s0)
    1f54:	02f707bb          	mulw	a5,a4,a5
    1f58:	2781                	sext.w	a5,a5
    1f5a:	8736                	mv	a4,a3
    1f5c:	02e7d263          	bge	a5,a4,1f80 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    1f60:	4098                	lw	a4,0(s1)
    1f62:	fa043783          	ld	a5,-96(s0)
    1f66:	47fc                	lw	a5,76(a5)
    1f68:	9fb9                	addw	a5,a5,a4
    1f6a:	0007871b          	sext.w	a4,a5
    1f6e:	fa043783          	ld	a5,-96(s0)
    1f72:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    1f74:	fa043783          	ld	a5,-96(s0)
    1f78:	53f8                	lw	a4,100(a5)
    1f7a:	fa043783          	ld	a5,-96(s0)
    1f7e:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    1f80:	fa043783          	ld	a5,-96(s0)
    1f84:	4bf8                	lw	a4,84(a5)
    1f86:	fa043783          	ld	a5,-96(s0)
    1f8a:	57bc                	lw	a5,104(a5)
    1f8c:	02e7d263          	bge	a5,a4,1fb0 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    1f90:	fa043783          	ld	a5,-96(s0)
    1f94:	4705                	li	a4,1
    1f96:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    1f98:	fa043783          	ld	a5,-96(s0)
    1f9c:	4fb8                	lw	a4,88(a5)
    1f9e:	fa043783          	ld	a5,-96(s0)
    1fa2:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    1fa4:	fa043783          	ld	a5,-96(s0)
    1fa8:	4bf8                	lw	a4,84(a5)
    1faa:	fa043783          	ld	a5,-96(s0)
    1fae:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    1fb0:	fa043783          	ld	a5,-96(s0)
    1fb4:	c3a9                	beqz	a5,1ff6 <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    1fb6:	fa043783          	ld	a5,-96(s0)
    1fba:	02878793          	addi	a5,a5,40
    1fbe:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    1fc2:	fa843783          	ld	a5,-88(s0)
    1fc6:	cb91                	beqz	a5,1fda <schedule_edf_cbs+0x464>
    1fc8:	fc842783          	lw	a5,-56(s0)
    1fcc:	2781                	sext.w	a5,a5
    1fce:	c791                	beqz	a5,1fda <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    1fd0:	fcc42783          	lw	a5,-52(s0)
    1fd4:	f4f42423          	sw	a5,-184(s0)
    1fd8:	a81d                	j	200e <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    1fda:	fa043783          	ld	a5,-96(s0)
    1fde:	5bbc                	lw	a5,112(a5)
    1fe0:	c789                	beqz	a5,1fea <schedule_edf_cbs+0x474>
    1fe2:	fa043783          	ld	a5,-96(s0)
    1fe6:	57bc                	lw	a5,104(a5)
    1fe8:	a021                	j	1ff0 <schedule_edf_cbs+0x47a>
    1fea:	fa043783          	ld	a5,-96(s0)
    1fee:	4bfc                	lw	a5,84(a5)
    1ff0:	f4f42423          	sw	a5,-184(s0)
    1ff4:	a829                	j	200e <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1ff6:	649c                	ld	a5,8(s1)
    1ff8:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    1ffc:	fa843783          	ld	a5,-88(s0)
    2000:	c781                	beqz	a5,2008 <schedule_edf_cbs+0x492>
    2002:	fcc42783          	lw	a5,-52(s0)
    2006:	a011                	j	200a <schedule_edf_cbs+0x494>
    2008:	4785                	li	a5,1
    200a:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    200e:	f4043783          	ld	a5,-192(s0)
    2012:	f4f43823          	sd	a5,-176(s0)
    2016:	f4843783          	ld	a5,-184(s0)
    201a:	f4f43c23          	sd	a5,-168(s0)
    201e:	4701                	li	a4,0
    2020:	f5043703          	ld	a4,-176(s0)
    2024:	4781                	li	a5,0
    2026:	f5843783          	ld	a5,-168(s0)
    202a:	893a                	mv	s2,a4
    202c:	89be                	mv	s3,a5
    202e:	874a                	mv	a4,s2
    2030:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    2032:	853a                	mv	a0,a4
    2034:	85be                	mv	a1,a5
    2036:	70ea                	ld	ra,184(sp)
    2038:	744a                	ld	s0,176(sp)
    203a:	74aa                	ld	s1,168(sp)
    203c:	790a                	ld	s2,160(sp)
    203e:	69ea                	ld	s3,152(sp)
    2040:	6129                	addi	sp,sp,192
    2042:	8082                	ret
