
user/_ln:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/stat.h"
#include "user/user.h"

int
main(int argc, char *argv[])
{
       0:	1101                	addi	sp,sp,-32
       2:	ec06                	sd	ra,24(sp)
       4:	e822                	sd	s0,16(sp)
       6:	1000                	addi	s0,sp,32
       8:	87aa                	mv	a5,a0
       a:	feb43023          	sd	a1,-32(s0)
       e:	fef42623          	sw	a5,-20(s0)
  if(argc != 3){
      12:	fec42783          	lw	a5,-20(s0)
      16:	0007871b          	sext.w	a4,a5
      1a:	478d                	li	a5,3
      1c:	02f70063          	beq	a4,a5,3c <main+0x3c>
    fprintf(2, "Usage: ln old new\n");
      20:	00002597          	auipc	a1,0x2
      24:	00858593          	addi	a1,a1,8 # 2028 <schedule_edf_cbs+0x4ce>
      28:	4509                	li	a0,2
      2a:	00001097          	auipc	ra,0x1
      2e:	9e2080e7          	jalr	-1566(ra) # a0c <fprintf>
    exit(1);
      32:	4505                	li	a0,1
      34:	00000097          	auipc	ra,0x0
      38:	4ea080e7          	jalr	1258(ra) # 51e <exit>
  }
  if(link(argv[1], argv[2]) < 0)
      3c:	fe043783          	ld	a5,-32(s0)
      40:	07a1                	addi	a5,a5,8
      42:	6398                	ld	a4,0(a5)
      44:	fe043783          	ld	a5,-32(s0)
      48:	07c1                	addi	a5,a5,16
      4a:	639c                	ld	a5,0(a5)
      4c:	85be                	mv	a1,a5
      4e:	853a                	mv	a0,a4
      50:	00000097          	auipc	ra,0x0
      54:	52e080e7          	jalr	1326(ra) # 57e <link>
      58:	87aa                	mv	a5,a0
      5a:	0207d563          	bgez	a5,84 <main+0x84>
    fprintf(2, "link %s %s: failed\n", argv[1], argv[2]);
      5e:	fe043783          	ld	a5,-32(s0)
      62:	07a1                	addi	a5,a5,8
      64:	6398                	ld	a4,0(a5)
      66:	fe043783          	ld	a5,-32(s0)
      6a:	07c1                	addi	a5,a5,16
      6c:	639c                	ld	a5,0(a5)
      6e:	86be                	mv	a3,a5
      70:	863a                	mv	a2,a4
      72:	00002597          	auipc	a1,0x2
      76:	fce58593          	addi	a1,a1,-50 # 2040 <schedule_edf_cbs+0x4e6>
      7a:	4509                	li	a0,2
      7c:	00001097          	auipc	ra,0x1
      80:	990080e7          	jalr	-1648(ra) # a0c <fprintf>
  exit(0);
      84:	4501                	li	a0,0
      86:	00000097          	auipc	ra,0x0
      8a:	498080e7          	jalr	1176(ra) # 51e <exit>

000000000000008e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      8e:	7179                	addi	sp,sp,-48
      90:	f422                	sd	s0,40(sp)
      92:	1800                	addi	s0,sp,48
      94:	fca43c23          	sd	a0,-40(s0)
      98:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      9c:	fd843783          	ld	a5,-40(s0)
      a0:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      a4:	0001                	nop
      a6:	fd043703          	ld	a4,-48(s0)
      aa:	00170793          	addi	a5,a4,1
      ae:	fcf43823          	sd	a5,-48(s0)
      b2:	fd843783          	ld	a5,-40(s0)
      b6:	00178693          	addi	a3,a5,1
      ba:	fcd43c23          	sd	a3,-40(s0)
      be:	00074703          	lbu	a4,0(a4)
      c2:	00e78023          	sb	a4,0(a5)
      c6:	0007c783          	lbu	a5,0(a5)
      ca:	fff1                	bnez	a5,a6 <strcpy+0x18>
    ;
  return os;
      cc:	fe843783          	ld	a5,-24(s0)
}
      d0:	853e                	mv	a0,a5
      d2:	7422                	ld	s0,40(sp)
      d4:	6145                	addi	sp,sp,48
      d6:	8082                	ret

00000000000000d8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      d8:	1101                	addi	sp,sp,-32
      da:	ec22                	sd	s0,24(sp)
      dc:	1000                	addi	s0,sp,32
      de:	fea43423          	sd	a0,-24(s0)
      e2:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
      e6:	a819                	j	fc <strcmp+0x24>
    p++, q++;
      e8:	fe843783          	ld	a5,-24(s0)
      ec:	0785                	addi	a5,a5,1
      ee:	fef43423          	sd	a5,-24(s0)
      f2:	fe043783          	ld	a5,-32(s0)
      f6:	0785                	addi	a5,a5,1
      f8:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
      fc:	fe843783          	ld	a5,-24(s0)
     100:	0007c783          	lbu	a5,0(a5)
     104:	cb99                	beqz	a5,11a <strcmp+0x42>
     106:	fe843783          	ld	a5,-24(s0)
     10a:	0007c703          	lbu	a4,0(a5)
     10e:	fe043783          	ld	a5,-32(s0)
     112:	0007c783          	lbu	a5,0(a5)
     116:	fcf709e3          	beq	a4,a5,e8 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     11a:	fe843783          	ld	a5,-24(s0)
     11e:	0007c783          	lbu	a5,0(a5)
     122:	0007871b          	sext.w	a4,a5
     126:	fe043783          	ld	a5,-32(s0)
     12a:	0007c783          	lbu	a5,0(a5)
     12e:	2781                	sext.w	a5,a5
     130:	40f707bb          	subw	a5,a4,a5
     134:	2781                	sext.w	a5,a5
}
     136:	853e                	mv	a0,a5
     138:	6462                	ld	s0,24(sp)
     13a:	6105                	addi	sp,sp,32
     13c:	8082                	ret

000000000000013e <strlen>:

uint
strlen(const char *s)
{
     13e:	7179                	addi	sp,sp,-48
     140:	f422                	sd	s0,40(sp)
     142:	1800                	addi	s0,sp,48
     144:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     148:	fe042623          	sw	zero,-20(s0)
     14c:	a031                	j	158 <strlen+0x1a>
     14e:	fec42783          	lw	a5,-20(s0)
     152:	2785                	addiw	a5,a5,1
     154:	fef42623          	sw	a5,-20(s0)
     158:	fec42783          	lw	a5,-20(s0)
     15c:	fd843703          	ld	a4,-40(s0)
     160:	97ba                	add	a5,a5,a4
     162:	0007c783          	lbu	a5,0(a5)
     166:	f7e5                	bnez	a5,14e <strlen+0x10>
    ;
  return n;
     168:	fec42783          	lw	a5,-20(s0)
}
     16c:	853e                	mv	a0,a5
     16e:	7422                	ld	s0,40(sp)
     170:	6145                	addi	sp,sp,48
     172:	8082                	ret

0000000000000174 <memset>:

void*
memset(void *dst, int c, uint n)
{
     174:	7179                	addi	sp,sp,-48
     176:	f422                	sd	s0,40(sp)
     178:	1800                	addi	s0,sp,48
     17a:	fca43c23          	sd	a0,-40(s0)
     17e:	87ae                	mv	a5,a1
     180:	8732                	mv	a4,a2
     182:	fcf42a23          	sw	a5,-44(s0)
     186:	87ba                	mv	a5,a4
     188:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     18c:	fd843783          	ld	a5,-40(s0)
     190:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     194:	fe042623          	sw	zero,-20(s0)
     198:	a00d                	j	1ba <memset+0x46>
    cdst[i] = c;
     19a:	fec42783          	lw	a5,-20(s0)
     19e:	fe043703          	ld	a4,-32(s0)
     1a2:	97ba                	add	a5,a5,a4
     1a4:	fd442703          	lw	a4,-44(s0)
     1a8:	0ff77713          	andi	a4,a4,255
     1ac:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     1b0:	fec42783          	lw	a5,-20(s0)
     1b4:	2785                	addiw	a5,a5,1
     1b6:	fef42623          	sw	a5,-20(s0)
     1ba:	fec42703          	lw	a4,-20(s0)
     1be:	fd042783          	lw	a5,-48(s0)
     1c2:	2781                	sext.w	a5,a5
     1c4:	fcf76be3          	bltu	a4,a5,19a <memset+0x26>
  }
  return dst;
     1c8:	fd843783          	ld	a5,-40(s0)
}
     1cc:	853e                	mv	a0,a5
     1ce:	7422                	ld	s0,40(sp)
     1d0:	6145                	addi	sp,sp,48
     1d2:	8082                	ret

00000000000001d4 <strchr>:

char*
strchr(const char *s, char c)
{
     1d4:	1101                	addi	sp,sp,-32
     1d6:	ec22                	sd	s0,24(sp)
     1d8:	1000                	addi	s0,sp,32
     1da:	fea43423          	sd	a0,-24(s0)
     1de:	87ae                	mv	a5,a1
     1e0:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     1e4:	a01d                	j	20a <strchr+0x36>
    if(*s == c)
     1e6:	fe843783          	ld	a5,-24(s0)
     1ea:	0007c703          	lbu	a4,0(a5)
     1ee:	fe744783          	lbu	a5,-25(s0)
     1f2:	0ff7f793          	andi	a5,a5,255
     1f6:	00e79563          	bne	a5,a4,200 <strchr+0x2c>
      return (char*)s;
     1fa:	fe843783          	ld	a5,-24(s0)
     1fe:	a821                	j	216 <strchr+0x42>
  for(; *s; s++)
     200:	fe843783          	ld	a5,-24(s0)
     204:	0785                	addi	a5,a5,1
     206:	fef43423          	sd	a5,-24(s0)
     20a:	fe843783          	ld	a5,-24(s0)
     20e:	0007c783          	lbu	a5,0(a5)
     212:	fbf1                	bnez	a5,1e6 <strchr+0x12>
  return 0;
     214:	4781                	li	a5,0
}
     216:	853e                	mv	a0,a5
     218:	6462                	ld	s0,24(sp)
     21a:	6105                	addi	sp,sp,32
     21c:	8082                	ret

000000000000021e <gets>:

char*
gets(char *buf, int max)
{
     21e:	7179                	addi	sp,sp,-48
     220:	f406                	sd	ra,40(sp)
     222:	f022                	sd	s0,32(sp)
     224:	1800                	addi	s0,sp,48
     226:	fca43c23          	sd	a0,-40(s0)
     22a:	87ae                	mv	a5,a1
     22c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     230:	fe042623          	sw	zero,-20(s0)
     234:	a8a1                	j	28c <gets+0x6e>
    cc = read(0, &c, 1);
     236:	fe740793          	addi	a5,s0,-25
     23a:	4605                	li	a2,1
     23c:	85be                	mv	a1,a5
     23e:	4501                	li	a0,0
     240:	00000097          	auipc	ra,0x0
     244:	2f6080e7          	jalr	758(ra) # 536 <read>
     248:	87aa                	mv	a5,a0
     24a:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     24e:	fe842783          	lw	a5,-24(s0)
     252:	2781                	sext.w	a5,a5
     254:	04f05763          	blez	a5,2a2 <gets+0x84>
      break;
    buf[i++] = c;
     258:	fec42783          	lw	a5,-20(s0)
     25c:	0017871b          	addiw	a4,a5,1
     260:	fee42623          	sw	a4,-20(s0)
     264:	873e                	mv	a4,a5
     266:	fd843783          	ld	a5,-40(s0)
     26a:	97ba                	add	a5,a5,a4
     26c:	fe744703          	lbu	a4,-25(s0)
     270:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     274:	fe744783          	lbu	a5,-25(s0)
     278:	873e                	mv	a4,a5
     27a:	47a9                	li	a5,10
     27c:	02f70463          	beq	a4,a5,2a4 <gets+0x86>
     280:	fe744783          	lbu	a5,-25(s0)
     284:	873e                	mv	a4,a5
     286:	47b5                	li	a5,13
     288:	00f70e63          	beq	a4,a5,2a4 <gets+0x86>
  for(i=0; i+1 < max; ){
     28c:	fec42783          	lw	a5,-20(s0)
     290:	2785                	addiw	a5,a5,1
     292:	0007871b          	sext.w	a4,a5
     296:	fd442783          	lw	a5,-44(s0)
     29a:	2781                	sext.w	a5,a5
     29c:	f8f74de3          	blt	a4,a5,236 <gets+0x18>
     2a0:	a011                	j	2a4 <gets+0x86>
      break;
     2a2:	0001                	nop
      break;
  }
  buf[i] = '\0';
     2a4:	fec42783          	lw	a5,-20(s0)
     2a8:	fd843703          	ld	a4,-40(s0)
     2ac:	97ba                	add	a5,a5,a4
     2ae:	00078023          	sb	zero,0(a5)
  return buf;
     2b2:	fd843783          	ld	a5,-40(s0)
}
     2b6:	853e                	mv	a0,a5
     2b8:	70a2                	ld	ra,40(sp)
     2ba:	7402                	ld	s0,32(sp)
     2bc:	6145                	addi	sp,sp,48
     2be:	8082                	ret

00000000000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
     2c0:	7179                	addi	sp,sp,-48
     2c2:	f406                	sd	ra,40(sp)
     2c4:	f022                	sd	s0,32(sp)
     2c6:	1800                	addi	s0,sp,48
     2c8:	fca43c23          	sd	a0,-40(s0)
     2cc:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2d0:	4581                	li	a1,0
     2d2:	fd843503          	ld	a0,-40(s0)
     2d6:	00000097          	auipc	ra,0x0
     2da:	288080e7          	jalr	648(ra) # 55e <open>
     2de:	87aa                	mv	a5,a0
     2e0:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     2e4:	fec42783          	lw	a5,-20(s0)
     2e8:	2781                	sext.w	a5,a5
     2ea:	0007d463          	bgez	a5,2f2 <stat+0x32>
    return -1;
     2ee:	57fd                	li	a5,-1
     2f0:	a035                	j	31c <stat+0x5c>
  r = fstat(fd, st);
     2f2:	fec42783          	lw	a5,-20(s0)
     2f6:	fd043583          	ld	a1,-48(s0)
     2fa:	853e                	mv	a0,a5
     2fc:	00000097          	auipc	ra,0x0
     300:	27a080e7          	jalr	634(ra) # 576 <fstat>
     304:	87aa                	mv	a5,a0
     306:	fef42423          	sw	a5,-24(s0)
  close(fd);
     30a:	fec42783          	lw	a5,-20(s0)
     30e:	853e                	mv	a0,a5
     310:	00000097          	auipc	ra,0x0
     314:	236080e7          	jalr	566(ra) # 546 <close>
  return r;
     318:	fe842783          	lw	a5,-24(s0)
}
     31c:	853e                	mv	a0,a5
     31e:	70a2                	ld	ra,40(sp)
     320:	7402                	ld	s0,32(sp)
     322:	6145                	addi	sp,sp,48
     324:	8082                	ret

0000000000000326 <atoi>:

int
atoi(const char *s)
{
     326:	7179                	addi	sp,sp,-48
     328:	f422                	sd	s0,40(sp)
     32a:	1800                	addi	s0,sp,48
     32c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     330:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     334:	a815                	j	368 <atoi+0x42>
    n = n*10 + *s++ - '0';
     336:	fec42703          	lw	a4,-20(s0)
     33a:	87ba                	mv	a5,a4
     33c:	0027979b          	slliw	a5,a5,0x2
     340:	9fb9                	addw	a5,a5,a4
     342:	0017979b          	slliw	a5,a5,0x1
     346:	0007871b          	sext.w	a4,a5
     34a:	fd843783          	ld	a5,-40(s0)
     34e:	00178693          	addi	a3,a5,1
     352:	fcd43c23          	sd	a3,-40(s0)
     356:	0007c783          	lbu	a5,0(a5)
     35a:	2781                	sext.w	a5,a5
     35c:	9fb9                	addw	a5,a5,a4
     35e:	2781                	sext.w	a5,a5
     360:	fd07879b          	addiw	a5,a5,-48
     364:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     368:	fd843783          	ld	a5,-40(s0)
     36c:	0007c783          	lbu	a5,0(a5)
     370:	873e                	mv	a4,a5
     372:	02f00793          	li	a5,47
     376:	00e7fb63          	bgeu	a5,a4,38c <atoi+0x66>
     37a:	fd843783          	ld	a5,-40(s0)
     37e:	0007c783          	lbu	a5,0(a5)
     382:	873e                	mv	a4,a5
     384:	03900793          	li	a5,57
     388:	fae7f7e3          	bgeu	a5,a4,336 <atoi+0x10>
  return n;
     38c:	fec42783          	lw	a5,-20(s0)
}
     390:	853e                	mv	a0,a5
     392:	7422                	ld	s0,40(sp)
     394:	6145                	addi	sp,sp,48
     396:	8082                	ret

0000000000000398 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     398:	7139                	addi	sp,sp,-64
     39a:	fc22                	sd	s0,56(sp)
     39c:	0080                	addi	s0,sp,64
     39e:	fca43c23          	sd	a0,-40(s0)
     3a2:	fcb43823          	sd	a1,-48(s0)
     3a6:	87b2                	mv	a5,a2
     3a8:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     3ac:	fd843783          	ld	a5,-40(s0)
     3b0:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     3b4:	fd043783          	ld	a5,-48(s0)
     3b8:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3bc:	fe043703          	ld	a4,-32(s0)
     3c0:	fe843783          	ld	a5,-24(s0)
     3c4:	02e7fc63          	bgeu	a5,a4,3fc <memmove+0x64>
    while(n-- > 0)
     3c8:	a00d                	j	3ea <memmove+0x52>
      *dst++ = *src++;
     3ca:	fe043703          	ld	a4,-32(s0)
     3ce:	00170793          	addi	a5,a4,1
     3d2:	fef43023          	sd	a5,-32(s0)
     3d6:	fe843783          	ld	a5,-24(s0)
     3da:	00178693          	addi	a3,a5,1
     3de:	fed43423          	sd	a3,-24(s0)
     3e2:	00074703          	lbu	a4,0(a4)
     3e6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     3ea:	fcc42783          	lw	a5,-52(s0)
     3ee:	fff7871b          	addiw	a4,a5,-1
     3f2:	fce42623          	sw	a4,-52(s0)
     3f6:	fcf04ae3          	bgtz	a5,3ca <memmove+0x32>
     3fa:	a891                	j	44e <memmove+0xb6>
  } else {
    dst += n;
     3fc:	fcc42783          	lw	a5,-52(s0)
     400:	fe843703          	ld	a4,-24(s0)
     404:	97ba                	add	a5,a5,a4
     406:	fef43423          	sd	a5,-24(s0)
    src += n;
     40a:	fcc42783          	lw	a5,-52(s0)
     40e:	fe043703          	ld	a4,-32(s0)
     412:	97ba                	add	a5,a5,a4
     414:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     418:	a01d                	j	43e <memmove+0xa6>
      *--dst = *--src;
     41a:	fe043783          	ld	a5,-32(s0)
     41e:	17fd                	addi	a5,a5,-1
     420:	fef43023          	sd	a5,-32(s0)
     424:	fe843783          	ld	a5,-24(s0)
     428:	17fd                	addi	a5,a5,-1
     42a:	fef43423          	sd	a5,-24(s0)
     42e:	fe043783          	ld	a5,-32(s0)
     432:	0007c703          	lbu	a4,0(a5)
     436:	fe843783          	ld	a5,-24(s0)
     43a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     43e:	fcc42783          	lw	a5,-52(s0)
     442:	fff7871b          	addiw	a4,a5,-1
     446:	fce42623          	sw	a4,-52(s0)
     44a:	fcf048e3          	bgtz	a5,41a <memmove+0x82>
  }
  return vdst;
     44e:	fd843783          	ld	a5,-40(s0)
}
     452:	853e                	mv	a0,a5
     454:	7462                	ld	s0,56(sp)
     456:	6121                	addi	sp,sp,64
     458:	8082                	ret

000000000000045a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     45a:	7139                	addi	sp,sp,-64
     45c:	fc22                	sd	s0,56(sp)
     45e:	0080                	addi	s0,sp,64
     460:	fca43c23          	sd	a0,-40(s0)
     464:	fcb43823          	sd	a1,-48(s0)
     468:	87b2                	mv	a5,a2
     46a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     46e:	fd843783          	ld	a5,-40(s0)
     472:	fef43423          	sd	a5,-24(s0)
     476:	fd043783          	ld	a5,-48(s0)
     47a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     47e:	a0a1                	j	4c6 <memcmp+0x6c>
    if (*p1 != *p2) {
     480:	fe843783          	ld	a5,-24(s0)
     484:	0007c703          	lbu	a4,0(a5)
     488:	fe043783          	ld	a5,-32(s0)
     48c:	0007c783          	lbu	a5,0(a5)
     490:	02f70163          	beq	a4,a5,4b2 <memcmp+0x58>
      return *p1 - *p2;
     494:	fe843783          	ld	a5,-24(s0)
     498:	0007c783          	lbu	a5,0(a5)
     49c:	0007871b          	sext.w	a4,a5
     4a0:	fe043783          	ld	a5,-32(s0)
     4a4:	0007c783          	lbu	a5,0(a5)
     4a8:	2781                	sext.w	a5,a5
     4aa:	40f707bb          	subw	a5,a4,a5
     4ae:	2781                	sext.w	a5,a5
     4b0:	a01d                	j	4d6 <memcmp+0x7c>
    }
    p1++;
     4b2:	fe843783          	ld	a5,-24(s0)
     4b6:	0785                	addi	a5,a5,1
     4b8:	fef43423          	sd	a5,-24(s0)
    p2++;
     4bc:	fe043783          	ld	a5,-32(s0)
     4c0:	0785                	addi	a5,a5,1
     4c2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4c6:	fcc42783          	lw	a5,-52(s0)
     4ca:	fff7871b          	addiw	a4,a5,-1
     4ce:	fce42623          	sw	a4,-52(s0)
     4d2:	f7dd                	bnez	a5,480 <memcmp+0x26>
  }
  return 0;
     4d4:	4781                	li	a5,0
}
     4d6:	853e                	mv	a0,a5
     4d8:	7462                	ld	s0,56(sp)
     4da:	6121                	addi	sp,sp,64
     4dc:	8082                	ret

00000000000004de <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4de:	7179                	addi	sp,sp,-48
     4e0:	f406                	sd	ra,40(sp)
     4e2:	f022                	sd	s0,32(sp)
     4e4:	1800                	addi	s0,sp,48
     4e6:	fea43423          	sd	a0,-24(s0)
     4ea:	feb43023          	sd	a1,-32(s0)
     4ee:	87b2                	mv	a5,a2
     4f0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     4f4:	fdc42783          	lw	a5,-36(s0)
     4f8:	863e                	mv	a2,a5
     4fa:	fe043583          	ld	a1,-32(s0)
     4fe:	fe843503          	ld	a0,-24(s0)
     502:	00000097          	auipc	ra,0x0
     506:	e96080e7          	jalr	-362(ra) # 398 <memmove>
     50a:	87aa                	mv	a5,a0
}
     50c:	853e                	mv	a0,a5
     50e:	70a2                	ld	ra,40(sp)
     510:	7402                	ld	s0,32(sp)
     512:	6145                	addi	sp,sp,48
     514:	8082                	ret

0000000000000516 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     516:	4885                	li	a7,1
 ecall
     518:	00000073          	ecall
 ret
     51c:	8082                	ret

000000000000051e <exit>:
.global exit
exit:
 li a7, SYS_exit
     51e:	4889                	li	a7,2
 ecall
     520:	00000073          	ecall
 ret
     524:	8082                	ret

0000000000000526 <wait>:
.global wait
wait:
 li a7, SYS_wait
     526:	488d                	li	a7,3
 ecall
     528:	00000073          	ecall
 ret
     52c:	8082                	ret

000000000000052e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     52e:	4891                	li	a7,4
 ecall
     530:	00000073          	ecall
 ret
     534:	8082                	ret

0000000000000536 <read>:
.global read
read:
 li a7, SYS_read
     536:	4895                	li	a7,5
 ecall
     538:	00000073          	ecall
 ret
     53c:	8082                	ret

000000000000053e <write>:
.global write
write:
 li a7, SYS_write
     53e:	48c1                	li	a7,16
 ecall
     540:	00000073          	ecall
 ret
     544:	8082                	ret

0000000000000546 <close>:
.global close
close:
 li a7, SYS_close
     546:	48d5                	li	a7,21
 ecall
     548:	00000073          	ecall
 ret
     54c:	8082                	ret

000000000000054e <kill>:
.global kill
kill:
 li a7, SYS_kill
     54e:	4899                	li	a7,6
 ecall
     550:	00000073          	ecall
 ret
     554:	8082                	ret

0000000000000556 <exec>:
.global exec
exec:
 li a7, SYS_exec
     556:	489d                	li	a7,7
 ecall
     558:	00000073          	ecall
 ret
     55c:	8082                	ret

000000000000055e <open>:
.global open
open:
 li a7, SYS_open
     55e:	48bd                	li	a7,15
 ecall
     560:	00000073          	ecall
 ret
     564:	8082                	ret

0000000000000566 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     566:	48c5                	li	a7,17
 ecall
     568:	00000073          	ecall
 ret
     56c:	8082                	ret

000000000000056e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     56e:	48c9                	li	a7,18
 ecall
     570:	00000073          	ecall
 ret
     574:	8082                	ret

0000000000000576 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     576:	48a1                	li	a7,8
 ecall
     578:	00000073          	ecall
 ret
     57c:	8082                	ret

000000000000057e <link>:
.global link
link:
 li a7, SYS_link
     57e:	48cd                	li	a7,19
 ecall
     580:	00000073          	ecall
 ret
     584:	8082                	ret

0000000000000586 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     586:	48d1                	li	a7,20
 ecall
     588:	00000073          	ecall
 ret
     58c:	8082                	ret

000000000000058e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     58e:	48a5                	li	a7,9
 ecall
     590:	00000073          	ecall
 ret
     594:	8082                	ret

0000000000000596 <dup>:
.global dup
dup:
 li a7, SYS_dup
     596:	48a9                	li	a7,10
 ecall
     598:	00000073          	ecall
 ret
     59c:	8082                	ret

000000000000059e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     59e:	48ad                	li	a7,11
 ecall
     5a0:	00000073          	ecall
 ret
     5a4:	8082                	ret

00000000000005a6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     5a6:	48b1                	li	a7,12
 ecall
     5a8:	00000073          	ecall
 ret
     5ac:	8082                	ret

00000000000005ae <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     5ae:	48b5                	li	a7,13
 ecall
     5b0:	00000073          	ecall
 ret
     5b4:	8082                	ret

00000000000005b6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     5b6:	48b9                	li	a7,14
 ecall
     5b8:	00000073          	ecall
 ret
     5bc:	8082                	ret

00000000000005be <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5be:	48d9                	li	a7,22
 ecall
     5c0:	00000073          	ecall
 ret
     5c4:	8082                	ret

00000000000005c6 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5c6:	48dd                	li	a7,23
 ecall
     5c8:	00000073          	ecall
 ret
     5cc:	8082                	ret

00000000000005ce <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5ce:	48e1                	li	a7,24
 ecall
     5d0:	00000073          	ecall
 ret
     5d4:	8082                	ret

00000000000005d6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5d6:	1101                	addi	sp,sp,-32
     5d8:	ec06                	sd	ra,24(sp)
     5da:	e822                	sd	s0,16(sp)
     5dc:	1000                	addi	s0,sp,32
     5de:	87aa                	mv	a5,a0
     5e0:	872e                	mv	a4,a1
     5e2:	fef42623          	sw	a5,-20(s0)
     5e6:	87ba                	mv	a5,a4
     5e8:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     5ec:	feb40713          	addi	a4,s0,-21
     5f0:	fec42783          	lw	a5,-20(s0)
     5f4:	4605                	li	a2,1
     5f6:	85ba                	mv	a1,a4
     5f8:	853e                	mv	a0,a5
     5fa:	00000097          	auipc	ra,0x0
     5fe:	f44080e7          	jalr	-188(ra) # 53e <write>
}
     602:	0001                	nop
     604:	60e2                	ld	ra,24(sp)
     606:	6442                	ld	s0,16(sp)
     608:	6105                	addi	sp,sp,32
     60a:	8082                	ret

000000000000060c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     60c:	7139                	addi	sp,sp,-64
     60e:	fc06                	sd	ra,56(sp)
     610:	f822                	sd	s0,48(sp)
     612:	0080                	addi	s0,sp,64
     614:	87aa                	mv	a5,a0
     616:	8736                	mv	a4,a3
     618:	fcf42623          	sw	a5,-52(s0)
     61c:	87ae                	mv	a5,a1
     61e:	fcf42423          	sw	a5,-56(s0)
     622:	87b2                	mv	a5,a2
     624:	fcf42223          	sw	a5,-60(s0)
     628:	87ba                	mv	a5,a4
     62a:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     62e:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     632:	fc042783          	lw	a5,-64(s0)
     636:	2781                	sext.w	a5,a5
     638:	c38d                	beqz	a5,65a <printint+0x4e>
     63a:	fc842783          	lw	a5,-56(s0)
     63e:	2781                	sext.w	a5,a5
     640:	0007dd63          	bgez	a5,65a <printint+0x4e>
    neg = 1;
     644:	4785                	li	a5,1
     646:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     64a:	fc842783          	lw	a5,-56(s0)
     64e:	40f007bb          	negw	a5,a5
     652:	2781                	sext.w	a5,a5
     654:	fef42223          	sw	a5,-28(s0)
     658:	a029                	j	662 <printint+0x56>
  } else {
    x = xx;
     65a:	fc842783          	lw	a5,-56(s0)
     65e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     662:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     666:	fc442783          	lw	a5,-60(s0)
     66a:	fe442703          	lw	a4,-28(s0)
     66e:	02f777bb          	remuw	a5,a4,a5
     672:	0007861b          	sext.w	a2,a5
     676:	fec42783          	lw	a5,-20(s0)
     67a:	0017871b          	addiw	a4,a5,1
     67e:	fee42623          	sw	a4,-20(s0)
     682:	00002697          	auipc	a3,0x2
     686:	c5668693          	addi	a3,a3,-938 # 22d8 <digits>
     68a:	02061713          	slli	a4,a2,0x20
     68e:	9301                	srli	a4,a4,0x20
     690:	9736                	add	a4,a4,a3
     692:	00074703          	lbu	a4,0(a4)
     696:	ff040693          	addi	a3,s0,-16
     69a:	97b6                	add	a5,a5,a3
     69c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     6a0:	fc442783          	lw	a5,-60(s0)
     6a4:	fe442703          	lw	a4,-28(s0)
     6a8:	02f757bb          	divuw	a5,a4,a5
     6ac:	fef42223          	sw	a5,-28(s0)
     6b0:	fe442783          	lw	a5,-28(s0)
     6b4:	2781                	sext.w	a5,a5
     6b6:	fbc5                	bnez	a5,666 <printint+0x5a>
  if(neg)
     6b8:	fe842783          	lw	a5,-24(s0)
     6bc:	2781                	sext.w	a5,a5
     6be:	cf95                	beqz	a5,6fa <printint+0xee>
    buf[i++] = '-';
     6c0:	fec42783          	lw	a5,-20(s0)
     6c4:	0017871b          	addiw	a4,a5,1
     6c8:	fee42623          	sw	a4,-20(s0)
     6cc:	ff040713          	addi	a4,s0,-16
     6d0:	97ba                	add	a5,a5,a4
     6d2:	02d00713          	li	a4,45
     6d6:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6da:	a005                	j	6fa <printint+0xee>
    putc(fd, buf[i]);
     6dc:	fec42783          	lw	a5,-20(s0)
     6e0:	ff040713          	addi	a4,s0,-16
     6e4:	97ba                	add	a5,a5,a4
     6e6:	fe07c703          	lbu	a4,-32(a5)
     6ea:	fcc42783          	lw	a5,-52(s0)
     6ee:	85ba                	mv	a1,a4
     6f0:	853e                	mv	a0,a5
     6f2:	00000097          	auipc	ra,0x0
     6f6:	ee4080e7          	jalr	-284(ra) # 5d6 <putc>
  while(--i >= 0)
     6fa:	fec42783          	lw	a5,-20(s0)
     6fe:	37fd                	addiw	a5,a5,-1
     700:	fef42623          	sw	a5,-20(s0)
     704:	fec42783          	lw	a5,-20(s0)
     708:	2781                	sext.w	a5,a5
     70a:	fc07d9e3          	bgez	a5,6dc <printint+0xd0>
}
     70e:	0001                	nop
     710:	0001                	nop
     712:	70e2                	ld	ra,56(sp)
     714:	7442                	ld	s0,48(sp)
     716:	6121                	addi	sp,sp,64
     718:	8082                	ret

000000000000071a <printptr>:

static void
printptr(int fd, uint64 x) {
     71a:	7179                	addi	sp,sp,-48
     71c:	f406                	sd	ra,40(sp)
     71e:	f022                	sd	s0,32(sp)
     720:	1800                	addi	s0,sp,48
     722:	87aa                	mv	a5,a0
     724:	fcb43823          	sd	a1,-48(s0)
     728:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     72c:	fdc42783          	lw	a5,-36(s0)
     730:	03000593          	li	a1,48
     734:	853e                	mv	a0,a5
     736:	00000097          	auipc	ra,0x0
     73a:	ea0080e7          	jalr	-352(ra) # 5d6 <putc>
  putc(fd, 'x');
     73e:	fdc42783          	lw	a5,-36(s0)
     742:	07800593          	li	a1,120
     746:	853e                	mv	a0,a5
     748:	00000097          	auipc	ra,0x0
     74c:	e8e080e7          	jalr	-370(ra) # 5d6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     750:	fe042623          	sw	zero,-20(s0)
     754:	a82d                	j	78e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     756:	fd043783          	ld	a5,-48(s0)
     75a:	93f1                	srli	a5,a5,0x3c
     75c:	00002717          	auipc	a4,0x2
     760:	b7c70713          	addi	a4,a4,-1156 # 22d8 <digits>
     764:	97ba                	add	a5,a5,a4
     766:	0007c703          	lbu	a4,0(a5)
     76a:	fdc42783          	lw	a5,-36(s0)
     76e:	85ba                	mv	a1,a4
     770:	853e                	mv	a0,a5
     772:	00000097          	auipc	ra,0x0
     776:	e64080e7          	jalr	-412(ra) # 5d6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     77a:	fec42783          	lw	a5,-20(s0)
     77e:	2785                	addiw	a5,a5,1
     780:	fef42623          	sw	a5,-20(s0)
     784:	fd043783          	ld	a5,-48(s0)
     788:	0792                	slli	a5,a5,0x4
     78a:	fcf43823          	sd	a5,-48(s0)
     78e:	fec42783          	lw	a5,-20(s0)
     792:	873e                	mv	a4,a5
     794:	47bd                	li	a5,15
     796:	fce7f0e3          	bgeu	a5,a4,756 <printptr+0x3c>
}
     79a:	0001                	nop
     79c:	0001                	nop
     79e:	70a2                	ld	ra,40(sp)
     7a0:	7402                	ld	s0,32(sp)
     7a2:	6145                	addi	sp,sp,48
     7a4:	8082                	ret

00000000000007a6 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     7a6:	715d                	addi	sp,sp,-80
     7a8:	e486                	sd	ra,72(sp)
     7aa:	e0a2                	sd	s0,64(sp)
     7ac:	0880                	addi	s0,sp,80
     7ae:	87aa                	mv	a5,a0
     7b0:	fcb43023          	sd	a1,-64(s0)
     7b4:	fac43c23          	sd	a2,-72(s0)
     7b8:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7bc:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7c0:	fe042223          	sw	zero,-28(s0)
     7c4:	a42d                	j	9ee <vprintf+0x248>
    c = fmt[i] & 0xff;
     7c6:	fe442783          	lw	a5,-28(s0)
     7ca:	fc043703          	ld	a4,-64(s0)
     7ce:	97ba                	add	a5,a5,a4
     7d0:	0007c783          	lbu	a5,0(a5)
     7d4:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7d8:	fe042783          	lw	a5,-32(s0)
     7dc:	2781                	sext.w	a5,a5
     7de:	eb9d                	bnez	a5,814 <vprintf+0x6e>
      if(c == '%'){
     7e0:	fdc42783          	lw	a5,-36(s0)
     7e4:	0007871b          	sext.w	a4,a5
     7e8:	02500793          	li	a5,37
     7ec:	00f71763          	bne	a4,a5,7fa <vprintf+0x54>
        state = '%';
     7f0:	02500793          	li	a5,37
     7f4:	fef42023          	sw	a5,-32(s0)
     7f8:	a2f5                	j	9e4 <vprintf+0x23e>
      } else {
        putc(fd, c);
     7fa:	fdc42783          	lw	a5,-36(s0)
     7fe:	0ff7f713          	andi	a4,a5,255
     802:	fcc42783          	lw	a5,-52(s0)
     806:	85ba                	mv	a1,a4
     808:	853e                	mv	a0,a5
     80a:	00000097          	auipc	ra,0x0
     80e:	dcc080e7          	jalr	-564(ra) # 5d6 <putc>
     812:	aac9                	j	9e4 <vprintf+0x23e>
      }
    } else if(state == '%'){
     814:	fe042783          	lw	a5,-32(s0)
     818:	0007871b          	sext.w	a4,a5
     81c:	02500793          	li	a5,37
     820:	1cf71263          	bne	a4,a5,9e4 <vprintf+0x23e>
      if(c == 'd'){
     824:	fdc42783          	lw	a5,-36(s0)
     828:	0007871b          	sext.w	a4,a5
     82c:	06400793          	li	a5,100
     830:	02f71463          	bne	a4,a5,858 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     834:	fb843783          	ld	a5,-72(s0)
     838:	00878713          	addi	a4,a5,8
     83c:	fae43c23          	sd	a4,-72(s0)
     840:	4398                	lw	a4,0(a5)
     842:	fcc42783          	lw	a5,-52(s0)
     846:	4685                	li	a3,1
     848:	4629                	li	a2,10
     84a:	85ba                	mv	a1,a4
     84c:	853e                	mv	a0,a5
     84e:	00000097          	auipc	ra,0x0
     852:	dbe080e7          	jalr	-578(ra) # 60c <printint>
     856:	a269                	j	9e0 <vprintf+0x23a>
      } else if(c == 'l') {
     858:	fdc42783          	lw	a5,-36(s0)
     85c:	0007871b          	sext.w	a4,a5
     860:	06c00793          	li	a5,108
     864:	02f71663          	bne	a4,a5,890 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     868:	fb843783          	ld	a5,-72(s0)
     86c:	00878713          	addi	a4,a5,8
     870:	fae43c23          	sd	a4,-72(s0)
     874:	639c                	ld	a5,0(a5)
     876:	0007871b          	sext.w	a4,a5
     87a:	fcc42783          	lw	a5,-52(s0)
     87e:	4681                	li	a3,0
     880:	4629                	li	a2,10
     882:	85ba                	mv	a1,a4
     884:	853e                	mv	a0,a5
     886:	00000097          	auipc	ra,0x0
     88a:	d86080e7          	jalr	-634(ra) # 60c <printint>
     88e:	aa89                	j	9e0 <vprintf+0x23a>
      } else if(c == 'x') {
     890:	fdc42783          	lw	a5,-36(s0)
     894:	0007871b          	sext.w	a4,a5
     898:	07800793          	li	a5,120
     89c:	02f71463          	bne	a4,a5,8c4 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     8a0:	fb843783          	ld	a5,-72(s0)
     8a4:	00878713          	addi	a4,a5,8
     8a8:	fae43c23          	sd	a4,-72(s0)
     8ac:	4398                	lw	a4,0(a5)
     8ae:	fcc42783          	lw	a5,-52(s0)
     8b2:	4681                	li	a3,0
     8b4:	4641                	li	a2,16
     8b6:	85ba                	mv	a1,a4
     8b8:	853e                	mv	a0,a5
     8ba:	00000097          	auipc	ra,0x0
     8be:	d52080e7          	jalr	-686(ra) # 60c <printint>
     8c2:	aa39                	j	9e0 <vprintf+0x23a>
      } else if(c == 'p') {
     8c4:	fdc42783          	lw	a5,-36(s0)
     8c8:	0007871b          	sext.w	a4,a5
     8cc:	07000793          	li	a5,112
     8d0:	02f71263          	bne	a4,a5,8f4 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8d4:	fb843783          	ld	a5,-72(s0)
     8d8:	00878713          	addi	a4,a5,8
     8dc:	fae43c23          	sd	a4,-72(s0)
     8e0:	6398                	ld	a4,0(a5)
     8e2:	fcc42783          	lw	a5,-52(s0)
     8e6:	85ba                	mv	a1,a4
     8e8:	853e                	mv	a0,a5
     8ea:	00000097          	auipc	ra,0x0
     8ee:	e30080e7          	jalr	-464(ra) # 71a <printptr>
     8f2:	a0fd                	j	9e0 <vprintf+0x23a>
      } else if(c == 's'){
     8f4:	fdc42783          	lw	a5,-36(s0)
     8f8:	0007871b          	sext.w	a4,a5
     8fc:	07300793          	li	a5,115
     900:	04f71c63          	bne	a4,a5,958 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     904:	fb843783          	ld	a5,-72(s0)
     908:	00878713          	addi	a4,a5,8
     90c:	fae43c23          	sd	a4,-72(s0)
     910:	639c                	ld	a5,0(a5)
     912:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     916:	fe843783          	ld	a5,-24(s0)
     91a:	eb8d                	bnez	a5,94c <vprintf+0x1a6>
          s = "(null)";
     91c:	00001797          	auipc	a5,0x1
     920:	73c78793          	addi	a5,a5,1852 # 2058 <schedule_edf_cbs+0x4fe>
     924:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     928:	a015                	j	94c <vprintf+0x1a6>
          putc(fd, *s);
     92a:	fe843783          	ld	a5,-24(s0)
     92e:	0007c703          	lbu	a4,0(a5)
     932:	fcc42783          	lw	a5,-52(s0)
     936:	85ba                	mv	a1,a4
     938:	853e                	mv	a0,a5
     93a:	00000097          	auipc	ra,0x0
     93e:	c9c080e7          	jalr	-868(ra) # 5d6 <putc>
          s++;
     942:	fe843783          	ld	a5,-24(s0)
     946:	0785                	addi	a5,a5,1
     948:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     94c:	fe843783          	ld	a5,-24(s0)
     950:	0007c783          	lbu	a5,0(a5)
     954:	fbf9                	bnez	a5,92a <vprintf+0x184>
     956:	a069                	j	9e0 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     958:	fdc42783          	lw	a5,-36(s0)
     95c:	0007871b          	sext.w	a4,a5
     960:	06300793          	li	a5,99
     964:	02f71463          	bne	a4,a5,98c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     968:	fb843783          	ld	a5,-72(s0)
     96c:	00878713          	addi	a4,a5,8
     970:	fae43c23          	sd	a4,-72(s0)
     974:	439c                	lw	a5,0(a5)
     976:	0ff7f713          	andi	a4,a5,255
     97a:	fcc42783          	lw	a5,-52(s0)
     97e:	85ba                	mv	a1,a4
     980:	853e                	mv	a0,a5
     982:	00000097          	auipc	ra,0x0
     986:	c54080e7          	jalr	-940(ra) # 5d6 <putc>
     98a:	a899                	j	9e0 <vprintf+0x23a>
      } else if(c == '%'){
     98c:	fdc42783          	lw	a5,-36(s0)
     990:	0007871b          	sext.w	a4,a5
     994:	02500793          	li	a5,37
     998:	00f71f63          	bne	a4,a5,9b6 <vprintf+0x210>
        putc(fd, c);
     99c:	fdc42783          	lw	a5,-36(s0)
     9a0:	0ff7f713          	andi	a4,a5,255
     9a4:	fcc42783          	lw	a5,-52(s0)
     9a8:	85ba                	mv	a1,a4
     9aa:	853e                	mv	a0,a5
     9ac:	00000097          	auipc	ra,0x0
     9b0:	c2a080e7          	jalr	-982(ra) # 5d6 <putc>
     9b4:	a035                	j	9e0 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     9b6:	fcc42783          	lw	a5,-52(s0)
     9ba:	02500593          	li	a1,37
     9be:	853e                	mv	a0,a5
     9c0:	00000097          	auipc	ra,0x0
     9c4:	c16080e7          	jalr	-1002(ra) # 5d6 <putc>
        putc(fd, c);
     9c8:	fdc42783          	lw	a5,-36(s0)
     9cc:	0ff7f713          	andi	a4,a5,255
     9d0:	fcc42783          	lw	a5,-52(s0)
     9d4:	85ba                	mv	a1,a4
     9d6:	853e                	mv	a0,a5
     9d8:	00000097          	auipc	ra,0x0
     9dc:	bfe080e7          	jalr	-1026(ra) # 5d6 <putc>
      }
      state = 0;
     9e0:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     9e4:	fe442783          	lw	a5,-28(s0)
     9e8:	2785                	addiw	a5,a5,1
     9ea:	fef42223          	sw	a5,-28(s0)
     9ee:	fe442783          	lw	a5,-28(s0)
     9f2:	fc043703          	ld	a4,-64(s0)
     9f6:	97ba                	add	a5,a5,a4
     9f8:	0007c783          	lbu	a5,0(a5)
     9fc:	dc0795e3          	bnez	a5,7c6 <vprintf+0x20>
    }
  }
}
     a00:	0001                	nop
     a02:	0001                	nop
     a04:	60a6                	ld	ra,72(sp)
     a06:	6406                	ld	s0,64(sp)
     a08:	6161                	addi	sp,sp,80
     a0a:	8082                	ret

0000000000000a0c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a0c:	7159                	addi	sp,sp,-112
     a0e:	fc06                	sd	ra,56(sp)
     a10:	f822                	sd	s0,48(sp)
     a12:	0080                	addi	s0,sp,64
     a14:	fcb43823          	sd	a1,-48(s0)
     a18:	e010                	sd	a2,0(s0)
     a1a:	e414                	sd	a3,8(s0)
     a1c:	e818                	sd	a4,16(s0)
     a1e:	ec1c                	sd	a5,24(s0)
     a20:	03043023          	sd	a6,32(s0)
     a24:	03143423          	sd	a7,40(s0)
     a28:	87aa                	mv	a5,a0
     a2a:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a2e:	03040793          	addi	a5,s0,48
     a32:	fcf43423          	sd	a5,-56(s0)
     a36:	fc843783          	ld	a5,-56(s0)
     a3a:	fd078793          	addi	a5,a5,-48
     a3e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a42:	fe843703          	ld	a4,-24(s0)
     a46:	fdc42783          	lw	a5,-36(s0)
     a4a:	863a                	mv	a2,a4
     a4c:	fd043583          	ld	a1,-48(s0)
     a50:	853e                	mv	a0,a5
     a52:	00000097          	auipc	ra,0x0
     a56:	d54080e7          	jalr	-684(ra) # 7a6 <vprintf>
}
     a5a:	0001                	nop
     a5c:	70e2                	ld	ra,56(sp)
     a5e:	7442                	ld	s0,48(sp)
     a60:	6165                	addi	sp,sp,112
     a62:	8082                	ret

0000000000000a64 <printf>:

void
printf(const char *fmt, ...)
{
     a64:	7159                	addi	sp,sp,-112
     a66:	f406                	sd	ra,40(sp)
     a68:	f022                	sd	s0,32(sp)
     a6a:	1800                	addi	s0,sp,48
     a6c:	fca43c23          	sd	a0,-40(s0)
     a70:	e40c                	sd	a1,8(s0)
     a72:	e810                	sd	a2,16(s0)
     a74:	ec14                	sd	a3,24(s0)
     a76:	f018                	sd	a4,32(s0)
     a78:	f41c                	sd	a5,40(s0)
     a7a:	03043823          	sd	a6,48(s0)
     a7e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a82:	04040793          	addi	a5,s0,64
     a86:	fcf43823          	sd	a5,-48(s0)
     a8a:	fd043783          	ld	a5,-48(s0)
     a8e:	fc878793          	addi	a5,a5,-56
     a92:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     a96:	fe843783          	ld	a5,-24(s0)
     a9a:	863e                	mv	a2,a5
     a9c:	fd843583          	ld	a1,-40(s0)
     aa0:	4505                	li	a0,1
     aa2:	00000097          	auipc	ra,0x0
     aa6:	d04080e7          	jalr	-764(ra) # 7a6 <vprintf>
}
     aaa:	0001                	nop
     aac:	70a2                	ld	ra,40(sp)
     aae:	7402                	ld	s0,32(sp)
     ab0:	6165                	addi	sp,sp,112
     ab2:	8082                	ret

0000000000000ab4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ab4:	7179                	addi	sp,sp,-48
     ab6:	f422                	sd	s0,40(sp)
     ab8:	1800                	addi	s0,sp,48
     aba:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     abe:	fd843783          	ld	a5,-40(s0)
     ac2:	17c1                	addi	a5,a5,-16
     ac4:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ac8:	00002797          	auipc	a5,0x2
     acc:	86878793          	addi	a5,a5,-1944 # 2330 <freep>
     ad0:	639c                	ld	a5,0(a5)
     ad2:	fef43423          	sd	a5,-24(s0)
     ad6:	a815                	j	b0a <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ad8:	fe843783          	ld	a5,-24(s0)
     adc:	639c                	ld	a5,0(a5)
     ade:	fe843703          	ld	a4,-24(s0)
     ae2:	00f76f63          	bltu	a4,a5,b00 <free+0x4c>
     ae6:	fe043703          	ld	a4,-32(s0)
     aea:	fe843783          	ld	a5,-24(s0)
     aee:	02e7eb63          	bltu	a5,a4,b24 <free+0x70>
     af2:	fe843783          	ld	a5,-24(s0)
     af6:	639c                	ld	a5,0(a5)
     af8:	fe043703          	ld	a4,-32(s0)
     afc:	02f76463          	bltu	a4,a5,b24 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b00:	fe843783          	ld	a5,-24(s0)
     b04:	639c                	ld	a5,0(a5)
     b06:	fef43423          	sd	a5,-24(s0)
     b0a:	fe043703          	ld	a4,-32(s0)
     b0e:	fe843783          	ld	a5,-24(s0)
     b12:	fce7f3e3          	bgeu	a5,a4,ad8 <free+0x24>
     b16:	fe843783          	ld	a5,-24(s0)
     b1a:	639c                	ld	a5,0(a5)
     b1c:	fe043703          	ld	a4,-32(s0)
     b20:	faf77ce3          	bgeu	a4,a5,ad8 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b24:	fe043783          	ld	a5,-32(s0)
     b28:	479c                	lw	a5,8(a5)
     b2a:	1782                	slli	a5,a5,0x20
     b2c:	9381                	srli	a5,a5,0x20
     b2e:	0792                	slli	a5,a5,0x4
     b30:	fe043703          	ld	a4,-32(s0)
     b34:	973e                	add	a4,a4,a5
     b36:	fe843783          	ld	a5,-24(s0)
     b3a:	639c                	ld	a5,0(a5)
     b3c:	02f71763          	bne	a4,a5,b6a <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b40:	fe043783          	ld	a5,-32(s0)
     b44:	4798                	lw	a4,8(a5)
     b46:	fe843783          	ld	a5,-24(s0)
     b4a:	639c                	ld	a5,0(a5)
     b4c:	479c                	lw	a5,8(a5)
     b4e:	9fb9                	addw	a5,a5,a4
     b50:	0007871b          	sext.w	a4,a5
     b54:	fe043783          	ld	a5,-32(s0)
     b58:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b5a:	fe843783          	ld	a5,-24(s0)
     b5e:	639c                	ld	a5,0(a5)
     b60:	6398                	ld	a4,0(a5)
     b62:	fe043783          	ld	a5,-32(s0)
     b66:	e398                	sd	a4,0(a5)
     b68:	a039                	j	b76 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b6a:	fe843783          	ld	a5,-24(s0)
     b6e:	6398                	ld	a4,0(a5)
     b70:	fe043783          	ld	a5,-32(s0)
     b74:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b76:	fe843783          	ld	a5,-24(s0)
     b7a:	479c                	lw	a5,8(a5)
     b7c:	1782                	slli	a5,a5,0x20
     b7e:	9381                	srli	a5,a5,0x20
     b80:	0792                	slli	a5,a5,0x4
     b82:	fe843703          	ld	a4,-24(s0)
     b86:	97ba                	add	a5,a5,a4
     b88:	fe043703          	ld	a4,-32(s0)
     b8c:	02f71563          	bne	a4,a5,bb6 <free+0x102>
    p->s.size += bp->s.size;
     b90:	fe843783          	ld	a5,-24(s0)
     b94:	4798                	lw	a4,8(a5)
     b96:	fe043783          	ld	a5,-32(s0)
     b9a:	479c                	lw	a5,8(a5)
     b9c:	9fb9                	addw	a5,a5,a4
     b9e:	0007871b          	sext.w	a4,a5
     ba2:	fe843783          	ld	a5,-24(s0)
     ba6:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     ba8:	fe043783          	ld	a5,-32(s0)
     bac:	6398                	ld	a4,0(a5)
     bae:	fe843783          	ld	a5,-24(s0)
     bb2:	e398                	sd	a4,0(a5)
     bb4:	a031                	j	bc0 <free+0x10c>
  } else
    p->s.ptr = bp;
     bb6:	fe843783          	ld	a5,-24(s0)
     bba:	fe043703          	ld	a4,-32(s0)
     bbe:	e398                	sd	a4,0(a5)
  freep = p;
     bc0:	00001797          	auipc	a5,0x1
     bc4:	77078793          	addi	a5,a5,1904 # 2330 <freep>
     bc8:	fe843703          	ld	a4,-24(s0)
     bcc:	e398                	sd	a4,0(a5)
}
     bce:	0001                	nop
     bd0:	7422                	ld	s0,40(sp)
     bd2:	6145                	addi	sp,sp,48
     bd4:	8082                	ret

0000000000000bd6 <morecore>:

static Header*
morecore(uint nu)
{
     bd6:	7179                	addi	sp,sp,-48
     bd8:	f406                	sd	ra,40(sp)
     bda:	f022                	sd	s0,32(sp)
     bdc:	1800                	addi	s0,sp,48
     bde:	87aa                	mv	a5,a0
     be0:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     be4:	fdc42783          	lw	a5,-36(s0)
     be8:	0007871b          	sext.w	a4,a5
     bec:	6785                	lui	a5,0x1
     bee:	00f77563          	bgeu	a4,a5,bf8 <morecore+0x22>
    nu = 4096;
     bf2:	6785                	lui	a5,0x1
     bf4:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     bf8:	fdc42783          	lw	a5,-36(s0)
     bfc:	0047979b          	slliw	a5,a5,0x4
     c00:	2781                	sext.w	a5,a5
     c02:	2781                	sext.w	a5,a5
     c04:	853e                	mv	a0,a5
     c06:	00000097          	auipc	ra,0x0
     c0a:	9a0080e7          	jalr	-1632(ra) # 5a6 <sbrk>
     c0e:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     c12:	fe843703          	ld	a4,-24(s0)
     c16:	57fd                	li	a5,-1
     c18:	00f71463          	bne	a4,a5,c20 <morecore+0x4a>
    return 0;
     c1c:	4781                	li	a5,0
     c1e:	a03d                	j	c4c <morecore+0x76>
  hp = (Header*)p;
     c20:	fe843783          	ld	a5,-24(s0)
     c24:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c28:	fe043783          	ld	a5,-32(s0)
     c2c:	fdc42703          	lw	a4,-36(s0)
     c30:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c32:	fe043783          	ld	a5,-32(s0)
     c36:	07c1                	addi	a5,a5,16
     c38:	853e                	mv	a0,a5
     c3a:	00000097          	auipc	ra,0x0
     c3e:	e7a080e7          	jalr	-390(ra) # ab4 <free>
  return freep;
     c42:	00001797          	auipc	a5,0x1
     c46:	6ee78793          	addi	a5,a5,1774 # 2330 <freep>
     c4a:	639c                	ld	a5,0(a5)
}
     c4c:	853e                	mv	a0,a5
     c4e:	70a2                	ld	ra,40(sp)
     c50:	7402                	ld	s0,32(sp)
     c52:	6145                	addi	sp,sp,48
     c54:	8082                	ret

0000000000000c56 <malloc>:

void*
malloc(uint nbytes)
{
     c56:	7139                	addi	sp,sp,-64
     c58:	fc06                	sd	ra,56(sp)
     c5a:	f822                	sd	s0,48(sp)
     c5c:	0080                	addi	s0,sp,64
     c5e:	87aa                	mv	a5,a0
     c60:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c64:	fcc46783          	lwu	a5,-52(s0)
     c68:	07bd                	addi	a5,a5,15
     c6a:	8391                	srli	a5,a5,0x4
     c6c:	2781                	sext.w	a5,a5
     c6e:	2785                	addiw	a5,a5,1
     c70:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c74:	00001797          	auipc	a5,0x1
     c78:	6bc78793          	addi	a5,a5,1724 # 2330 <freep>
     c7c:	639c                	ld	a5,0(a5)
     c7e:	fef43023          	sd	a5,-32(s0)
     c82:	fe043783          	ld	a5,-32(s0)
     c86:	ef95                	bnez	a5,cc2 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     c88:	00001797          	auipc	a5,0x1
     c8c:	69878793          	addi	a5,a5,1688 # 2320 <base>
     c90:	fef43023          	sd	a5,-32(s0)
     c94:	00001797          	auipc	a5,0x1
     c98:	69c78793          	addi	a5,a5,1692 # 2330 <freep>
     c9c:	fe043703          	ld	a4,-32(s0)
     ca0:	e398                	sd	a4,0(a5)
     ca2:	00001797          	auipc	a5,0x1
     ca6:	68e78793          	addi	a5,a5,1678 # 2330 <freep>
     caa:	6398                	ld	a4,0(a5)
     cac:	00001797          	auipc	a5,0x1
     cb0:	67478793          	addi	a5,a5,1652 # 2320 <base>
     cb4:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     cb6:	00001797          	auipc	a5,0x1
     cba:	66a78793          	addi	a5,a5,1642 # 2320 <base>
     cbe:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     cc2:	fe043783          	ld	a5,-32(s0)
     cc6:	639c                	ld	a5,0(a5)
     cc8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     ccc:	fe843783          	ld	a5,-24(s0)
     cd0:	4798                	lw	a4,8(a5)
     cd2:	fdc42783          	lw	a5,-36(s0)
     cd6:	2781                	sext.w	a5,a5
     cd8:	06f76863          	bltu	a4,a5,d48 <malloc+0xf2>
      if(p->s.size == nunits)
     cdc:	fe843783          	ld	a5,-24(s0)
     ce0:	4798                	lw	a4,8(a5)
     ce2:	fdc42783          	lw	a5,-36(s0)
     ce6:	2781                	sext.w	a5,a5
     ce8:	00e79963          	bne	a5,a4,cfa <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     cec:	fe843783          	ld	a5,-24(s0)
     cf0:	6398                	ld	a4,0(a5)
     cf2:	fe043783          	ld	a5,-32(s0)
     cf6:	e398                	sd	a4,0(a5)
     cf8:	a82d                	j	d32 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     cfa:	fe843783          	ld	a5,-24(s0)
     cfe:	4798                	lw	a4,8(a5)
     d00:	fdc42783          	lw	a5,-36(s0)
     d04:	40f707bb          	subw	a5,a4,a5
     d08:	0007871b          	sext.w	a4,a5
     d0c:	fe843783          	ld	a5,-24(s0)
     d10:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d12:	fe843783          	ld	a5,-24(s0)
     d16:	479c                	lw	a5,8(a5)
     d18:	1782                	slli	a5,a5,0x20
     d1a:	9381                	srli	a5,a5,0x20
     d1c:	0792                	slli	a5,a5,0x4
     d1e:	fe843703          	ld	a4,-24(s0)
     d22:	97ba                	add	a5,a5,a4
     d24:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d28:	fe843783          	ld	a5,-24(s0)
     d2c:	fdc42703          	lw	a4,-36(s0)
     d30:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d32:	00001797          	auipc	a5,0x1
     d36:	5fe78793          	addi	a5,a5,1534 # 2330 <freep>
     d3a:	fe043703          	ld	a4,-32(s0)
     d3e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d40:	fe843783          	ld	a5,-24(s0)
     d44:	07c1                	addi	a5,a5,16
     d46:	a091                	j	d8a <malloc+0x134>
    }
    if(p == freep)
     d48:	00001797          	auipc	a5,0x1
     d4c:	5e878793          	addi	a5,a5,1512 # 2330 <freep>
     d50:	639c                	ld	a5,0(a5)
     d52:	fe843703          	ld	a4,-24(s0)
     d56:	02f71063          	bne	a4,a5,d76 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d5a:	fdc42783          	lw	a5,-36(s0)
     d5e:	853e                	mv	a0,a5
     d60:	00000097          	auipc	ra,0x0
     d64:	e76080e7          	jalr	-394(ra) # bd6 <morecore>
     d68:	fea43423          	sd	a0,-24(s0)
     d6c:	fe843783          	ld	a5,-24(s0)
     d70:	e399                	bnez	a5,d76 <malloc+0x120>
        return 0;
     d72:	4781                	li	a5,0
     d74:	a819                	j	d8a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d76:	fe843783          	ld	a5,-24(s0)
     d7a:	fef43023          	sd	a5,-32(s0)
     d7e:	fe843783          	ld	a5,-24(s0)
     d82:	639c                	ld	a5,0(a5)
     d84:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d88:	b791                	j	ccc <malloc+0x76>
  }
}
     d8a:	853e                	mv	a0,a5
     d8c:	70e2                	ld	ra,56(sp)
     d8e:	7442                	ld	s0,48(sp)
     d90:	6121                	addi	sp,sp,64
     d92:	8082                	ret

0000000000000d94 <setjmp>:
     d94:	e100                	sd	s0,0(a0)
     d96:	e504                	sd	s1,8(a0)
     d98:	01253823          	sd	s2,16(a0)
     d9c:	01353c23          	sd	s3,24(a0)
     da0:	03453023          	sd	s4,32(a0)
     da4:	03553423          	sd	s5,40(a0)
     da8:	03653823          	sd	s6,48(a0)
     dac:	03753c23          	sd	s7,56(a0)
     db0:	05853023          	sd	s8,64(a0)
     db4:	05953423          	sd	s9,72(a0)
     db8:	05a53823          	sd	s10,80(a0)
     dbc:	05b53c23          	sd	s11,88(a0)
     dc0:	06153023          	sd	ra,96(a0)
     dc4:	06253423          	sd	sp,104(a0)
     dc8:	4501                	li	a0,0
     dca:	8082                	ret

0000000000000dcc <longjmp>:
     dcc:	6100                	ld	s0,0(a0)
     dce:	6504                	ld	s1,8(a0)
     dd0:	01053903          	ld	s2,16(a0)
     dd4:	01853983          	ld	s3,24(a0)
     dd8:	02053a03          	ld	s4,32(a0)
     ddc:	02853a83          	ld	s5,40(a0)
     de0:	03053b03          	ld	s6,48(a0)
     de4:	03853b83          	ld	s7,56(a0)
     de8:	04053c03          	ld	s8,64(a0)
     dec:	04853c83          	ld	s9,72(a0)
     df0:	05053d03          	ld	s10,80(a0)
     df4:	05853d83          	ld	s11,88(a0)
     df8:	06053083          	ld	ra,96(a0)
     dfc:	06853103          	ld	sp,104(a0)
     e00:	c199                	beqz	a1,e06 <longjmp_1>
     e02:	852e                	mv	a0,a1
     e04:	8082                	ret

0000000000000e06 <longjmp_1>:
     e06:	4505                	li	a0,1
     e08:	8082                	ret

0000000000000e0a <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     e0a:	7179                	addi	sp,sp,-48
     e0c:	f422                	sd	s0,40(sp)
     e0e:	1800                	addi	s0,sp,48
     e10:	fea43423          	sd	a0,-24(s0)
     e14:	feb43023          	sd	a1,-32(s0)
     e18:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     e1c:	fd843783          	ld	a5,-40(s0)
     e20:	fe843703          	ld	a4,-24(s0)
     e24:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     e26:	fe843783          	ld	a5,-24(s0)
     e2a:	fd843703          	ld	a4,-40(s0)
     e2e:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     e30:	fe843783          	ld	a5,-24(s0)
     e34:	fe043703          	ld	a4,-32(s0)
     e38:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     e3a:	fe043783          	ld	a5,-32(s0)
     e3e:	fe843703          	ld	a4,-24(s0)
     e42:	e398                	sd	a4,0(a5)
 }
     e44:	0001                	nop
     e46:	7422                	ld	s0,40(sp)
     e48:	6145                	addi	sp,sp,48
     e4a:	8082                	ret

0000000000000e4c <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     e4c:	1101                	addi	sp,sp,-32
     e4e:	ec06                	sd	ra,24(sp)
     e50:	e822                	sd	s0,16(sp)
     e52:	1000                	addi	s0,sp,32
     e54:	fea43423          	sd	a0,-24(s0)
     e58:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     e5c:	fe043783          	ld	a5,-32(s0)
     e60:	679c                	ld	a5,8(a5)
     e62:	fe043603          	ld	a2,-32(s0)
     e66:	85be                	mv	a1,a5
     e68:	fe843503          	ld	a0,-24(s0)
     e6c:	00000097          	auipc	ra,0x0
     e70:	f9e080e7          	jalr	-98(ra) # e0a <__list_add>
 }
     e74:	0001                	nop
     e76:	60e2                	ld	ra,24(sp)
     e78:	6442                	ld	s0,16(sp)
     e7a:	6105                	addi	sp,sp,32
     e7c:	8082                	ret

0000000000000e7e <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     e7e:	1101                	addi	sp,sp,-32
     e80:	ec22                	sd	s0,24(sp)
     e82:	1000                	addi	s0,sp,32
     e84:	fea43423          	sd	a0,-24(s0)
     e88:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
     e8c:	fe043783          	ld	a5,-32(s0)
     e90:	fe843703          	ld	a4,-24(s0)
     e94:	e798                	sd	a4,8(a5)
     prev->next = next;
     e96:	fe843783          	ld	a5,-24(s0)
     e9a:	fe043703          	ld	a4,-32(s0)
     e9e:	e398                	sd	a4,0(a5)
 }
     ea0:	0001                	nop
     ea2:	6462                	ld	s0,24(sp)
     ea4:	6105                	addi	sp,sp,32
     ea6:	8082                	ret

0000000000000ea8 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     ea8:	1101                	addi	sp,sp,-32
     eaa:	ec06                	sd	ra,24(sp)
     eac:	e822                	sd	s0,16(sp)
     eae:	1000                	addi	s0,sp,32
     eb0:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
     eb4:	fe843783          	ld	a5,-24(s0)
     eb8:	6798                	ld	a4,8(a5)
     eba:	fe843783          	ld	a5,-24(s0)
     ebe:	639c                	ld	a5,0(a5)
     ec0:	85be                	mv	a1,a5
     ec2:	853a                	mv	a0,a4
     ec4:	00000097          	auipc	ra,0x0
     ec8:	fba080e7          	jalr	-70(ra) # e7e <__list_del>
     entry->next = LIST_POISON1;
     ecc:	fe843783          	ld	a5,-24(s0)
     ed0:	00100737          	lui	a4,0x100
     ed4:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd628>
     ed8:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
     eda:	fe843783          	ld	a5,-24(s0)
     ede:	00200737          	lui	a4,0x200
     ee2:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd728>
     ee6:	e798                	sd	a4,8(a5)
 }
     ee8:	0001                	nop
     eea:	60e2                	ld	ra,24(sp)
     eec:	6442                	ld	s0,16(sp)
     eee:	6105                	addi	sp,sp,32
     ef0:	8082                	ret

0000000000000ef2 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
     ef2:	1101                	addi	sp,sp,-32
     ef4:	ec22                	sd	s0,24(sp)
     ef6:	1000                	addi	s0,sp,32
     ef8:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
     efc:	fe843783          	ld	a5,-24(s0)
     f00:	639c                	ld	a5,0(a5)
     f02:	fe843703          	ld	a4,-24(s0)
     f06:	40f707b3          	sub	a5,a4,a5
     f0a:	0017b793          	seqz	a5,a5
     f0e:	0ff7f793          	andi	a5,a5,255
     f12:	2781                	sext.w	a5,a5
 }
     f14:	853e                	mv	a0,a5
     f16:	6462                	ld	s0,24(sp)
     f18:	6105                	addi	sp,sp,32
     f1a:	8082                	ret

0000000000000f1c <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     f1c:	715d                	addi	sp,sp,-80
     f1e:	e486                	sd	ra,72(sp)
     f20:	e0a2                	sd	s0,64(sp)
     f22:	0880                	addi	s0,sp,80
     f24:	fca43423          	sd	a0,-56(s0)
     f28:	fcb43023          	sd	a1,-64(s0)
     f2c:	85b2                	mv	a1,a2
     f2e:	8636                	mv	a2,a3
     f30:	86ba                	mv	a3,a4
     f32:	873e                	mv	a4,a5
     f34:	87ae                	mv	a5,a1
     f36:	faf42e23          	sw	a5,-68(s0)
     f3a:	87b2                	mv	a5,a2
     f3c:	faf42c23          	sw	a5,-72(s0)
     f40:	87b6                	mv	a5,a3
     f42:	faf42a23          	sw	a5,-76(s0)
     f46:	87ba                	mv	a5,a4
     f48:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     f4c:	08000513          	li	a0,128
     f50:	00000097          	auipc	ra,0x0
     f54:	d06080e7          	jalr	-762(ra) # c56 <malloc>
     f58:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     f5c:	6505                	lui	a0,0x1
     f5e:	00000097          	auipc	ra,0x0
     f62:	cf8080e7          	jalr	-776(ra) # c56 <malloc>
     f66:	87aa                	mv	a5,a0
     f68:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     f6c:	fe043703          	ld	a4,-32(s0)
     f70:	6785                	lui	a5,0x1
     f72:	17c1                	addi	a5,a5,-16
     f74:	97ba                	add	a5,a5,a4
     f76:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     f7a:	fe843783          	ld	a5,-24(s0)
     f7e:	fc843703          	ld	a4,-56(s0)
     f82:	e398                	sd	a4,0(a5)
    t->arg = arg;
     f84:	fe843783          	ld	a5,-24(s0)
     f88:	fc043703          	ld	a4,-64(s0)
     f8c:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     f8e:	00001797          	auipc	a5,0x1
     f92:	38678793          	addi	a5,a5,902 # 2314 <_id.1241>
     f96:	439c                	lw	a5,0(a5)
     f98:	0017871b          	addiw	a4,a5,1
     f9c:	0007069b          	sext.w	a3,a4
     fa0:	00001717          	auipc	a4,0x1
     fa4:	37470713          	addi	a4,a4,884 # 2314 <_id.1241>
     fa8:	c314                	sw	a3,0(a4)
     faa:	fe843703          	ld	a4,-24(s0)
     fae:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
     fb0:	fe843783          	ld	a5,-24(s0)
     fb4:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
     fb8:	fe043703          	ld	a4,-32(s0)
     fbc:	fe843783          	ld	a5,-24(s0)
     fc0:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
     fc2:	fd843703          	ld	a4,-40(s0)
     fc6:	fe843783          	ld	a5,-24(s0)
     fca:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
     fcc:	fe843783          	ld	a5,-24(s0)
     fd0:	fb842703          	lw	a4,-72(s0)
     fd4:	c3f8                	sw	a4,68(a5)
    t->period = period;
     fd6:	fe843783          	ld	a5,-24(s0)
     fda:	fb442703          	lw	a4,-76(s0)
     fde:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
     fe0:	fe843783          	ld	a5,-24(s0)
     fe4:	fb442703          	lw	a4,-76(s0)
     fe8:	c7b8                	sw	a4,72(a5)
    t->n = n;
     fea:	fe843783          	ld	a5,-24(s0)
     fee:	fb042703          	lw	a4,-80(s0)
     ff2:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
     ff4:	fe843783          	ld	a5,-24(s0)
     ff8:	fbc42703          	lw	a4,-68(s0)
     ffc:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
     ffe:	fe843783          	ld	a5,-24(s0)
    1002:	fb842703          	lw	a4,-72(s0)
    1006:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    1008:	fe843783          	ld	a5,-24(s0)
    100c:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    1010:	fe843783          	ld	a5,-24(s0)
    1014:	06400713          	li	a4,100
    1018:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    101a:	fe843783          	ld	a5,-24(s0)
    101e:	671d                	lui	a4,0x7
    1020:	5307071b          	addiw	a4,a4,1328
    1024:	d3b8                	sw	a4,96(a5)
    
    return t;
    1026:	fe843783          	ld	a5,-24(s0)
}
    102a:	853e                	mv	a0,a5
    102c:	60a6                	ld	ra,72(sp)
    102e:	6406                	ld	s0,64(sp)
    1030:	6161                	addi	sp,sp,80
    1032:	8082                	ret

0000000000001034 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    1034:	1101                	addi	sp,sp,-32
    1036:	ec22                	sd	s0,24(sp)
    1038:	1000                	addi	s0,sp,32
    103a:	fea43423          	sd	a0,-24(s0)
    103e:	87ae                	mv	a5,a1
    1040:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    1044:	fe843783          	ld	a5,-24(s0)
    1048:	fe442703          	lw	a4,-28(s0)
    104c:	cff8                	sw	a4,92(a5)
}
    104e:	0001                	nop
    1050:	6462                	ld	s0,24(sp)
    1052:	6105                	addi	sp,sp,32
    1054:	8082                	ret

0000000000001056 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    1056:	1101                	addi	sp,sp,-32
    1058:	ec22                	sd	s0,24(sp)
    105a:	1000                	addi	s0,sp,32
    105c:	fea43423          	sd	a0,-24(s0)
    1060:	87ae                	mv	a5,a1
    1062:	8732                	mv	a4,a2
    1064:	fef42223          	sw	a5,-28(s0)
    1068:	87ba                	mv	a5,a4
    106a:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    106e:	fe843783          	ld	a5,-24(s0)
    1072:	fe442703          	lw	a4,-28(s0)
    1076:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    1078:	fe843783          	ld	a5,-24(s0)
    107c:	fe442703          	lw	a4,-28(s0)
    1080:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    1082:	fe843783          	ld	a5,-24(s0)
    1086:	fe042703          	lw	a4,-32(s0)
    108a:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    108c:	fe843783          	ld	a5,-24(s0)
    1090:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1094:	fe843783          	ld	a5,-24(s0)
    1098:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    109c:	fe843783          	ld	a5,-24(s0)
    10a0:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    10a4:	fe843783          	ld	a5,-24(s0)
    10a8:	0607ae23          	sw	zero,124(a5)
}
    10ac:	0001                	nop
    10ae:	6462                	ld	s0,24(sp)
    10b0:	6105                	addi	sp,sp,32
    10b2:	8082                	ret

00000000000010b4 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    10b4:	7179                	addi	sp,sp,-48
    10b6:	f406                	sd	ra,40(sp)
    10b8:	f022                	sd	s0,32(sp)
    10ba:	1800                	addi	s0,sp,48
    10bc:	fca43c23          	sd	a0,-40(s0)
    10c0:	87ae                	mv	a5,a1
    10c2:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    10c6:	02000513          	li	a0,32
    10ca:	00000097          	auipc	ra,0x0
    10ce:	b8c080e7          	jalr	-1140(ra) # c56 <malloc>
    10d2:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    10d6:	fe843783          	ld	a5,-24(s0)
    10da:	fd843703          	ld	a4,-40(s0)
    10de:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    10e0:	fe843783          	ld	a5,-24(s0)
    10e4:	fd442703          	lw	a4,-44(s0)
    10e8:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    10ea:	fd843783          	ld	a5,-40(s0)
    10ee:	fd442703          	lw	a4,-44(s0)
    10f2:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    10f4:	fd843783          	ld	a5,-40(s0)
    10f8:	43bc                	lw	a5,64(a5)
    10fa:	cf81                	beqz	a5,1112 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    10fc:	fd843783          	ld	a5,-40(s0)
    1100:	47bc                	lw	a5,72(a5)
    1102:	fd442703          	lw	a4,-44(s0)
    1106:	9fb9                	addw	a5,a5,a4
    1108:	0007871b          	sext.w	a4,a5
    110c:	fd843783          	ld	a5,-40(s0)
    1110:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1112:	fe843783          	ld	a5,-24(s0)
    1116:	07a1                	addi	a5,a5,8
    1118:	00001597          	auipc	a1,0x1
    111c:	1e858593          	addi	a1,a1,488 # 2300 <release_queue>
    1120:	853e                	mv	a0,a5
    1122:	00000097          	auipc	ra,0x0
    1126:	d2a080e7          	jalr	-726(ra) # e4c <list_add_tail>
}
    112a:	0001                	nop
    112c:	70a2                	ld	ra,40(sp)
    112e:	7402                	ld	s0,32(sp)
    1130:	6145                	addi	sp,sp,48
    1132:	8082                	ret

0000000000001134 <__release>:

void __release()
{
    1134:	7139                	addi	sp,sp,-64
    1136:	fc06                	sd	ra,56(sp)
    1138:	f822                	sd	s0,48(sp)
    113a:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    113c:	00001797          	auipc	a5,0x1
    1140:	1c478793          	addi	a5,a5,452 # 2300 <release_queue>
    1144:	639c                	ld	a5,0(a5)
    1146:	fcf43c23          	sd	a5,-40(s0)
    114a:	fd843783          	ld	a5,-40(s0)
    114e:	17e1                	addi	a5,a5,-8
    1150:	fef43423          	sd	a5,-24(s0)
    1154:	fe843783          	ld	a5,-24(s0)
    1158:	679c                	ld	a5,8(a5)
    115a:	fcf43823          	sd	a5,-48(s0)
    115e:	fd043783          	ld	a5,-48(s0)
    1162:	17e1                	addi	a5,a5,-8
    1164:	fef43023          	sd	a5,-32(s0)
    1168:	a0e9                	j	1232 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    116a:	fe843783          	ld	a5,-24(s0)
    116e:	4f98                	lw	a4,24(a5)
    1170:	00001797          	auipc	a5,0x1
    1174:	1d078793          	addi	a5,a5,464 # 2340 <threading_system_time>
    1178:	439c                	lw	a5,0(a5)
    117a:	08e7ce63          	blt	a5,a4,1216 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    117e:	fe843783          	ld	a5,-24(s0)
    1182:	639c                	ld	a5,0(a5)
    1184:	5bbc                	lw	a5,112(a5)
    1186:	c79d                	beqz	a5,11b4 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    1188:	fe843783          	ld	a5,-24(s0)
    118c:	639c                	ld	a5,0(a5)
    118e:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    1192:	fe843783          	ld	a5,-24(s0)
    1196:	6398                	ld	a4,0(a5)
    1198:	fe843783          	ld	a5,-24(s0)
    119c:	639c                	ld	a5,0(a5)
    119e:	5378                	lw	a4,100(a4)
    11a0:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    11a2:	fe843783          	ld	a5,-24(s0)
    11a6:	6398                	ld	a4,0(a5)
    11a8:	fe843783          	ld	a5,-24(s0)
    11ac:	639c                	ld	a5,0(a5)
    11ae:	5f78                	lw	a4,124(a4)
    11b0:	cbf8                	sw	a4,84(a5)
    11b2:	a809                	j	11c4 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    11b4:	fe843783          	ld	a5,-24(s0)
    11b8:	6398                	ld	a4,0(a5)
    11ba:	fe843783          	ld	a5,-24(s0)
    11be:	639c                	ld	a5,0(a5)
    11c0:	4378                	lw	a4,68(a4)
    11c2:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    11c4:	fe843783          	ld	a5,-24(s0)
    11c8:	4f94                	lw	a3,24(a5)
    11ca:	fe843783          	ld	a5,-24(s0)
    11ce:	639c                	ld	a5,0(a5)
    11d0:	47b8                	lw	a4,72(a5)
    11d2:	fe843783          	ld	a5,-24(s0)
    11d6:	639c                	ld	a5,0(a5)
    11d8:	9f35                	addw	a4,a4,a3
    11da:	2701                	sext.w	a4,a4
    11dc:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    11de:	fe843783          	ld	a5,-24(s0)
    11e2:	639c                	ld	a5,0(a5)
    11e4:	02878793          	addi	a5,a5,40
    11e8:	00001597          	auipc	a1,0x1
    11ec:	10858593          	addi	a1,a1,264 # 22f0 <run_queue>
    11f0:	853e                	mv	a0,a5
    11f2:	00000097          	auipc	ra,0x0
    11f6:	c5a080e7          	jalr	-934(ra) # e4c <list_add_tail>
            list_del(&cur->thread_list);
    11fa:	fe843783          	ld	a5,-24(s0)
    11fe:	07a1                	addi	a5,a5,8
    1200:	853e                	mv	a0,a5
    1202:	00000097          	auipc	ra,0x0
    1206:	ca6080e7          	jalr	-858(ra) # ea8 <list_del>
            free(cur);
    120a:	fe843503          	ld	a0,-24(s0)
    120e:	00000097          	auipc	ra,0x0
    1212:	8a6080e7          	jalr	-1882(ra) # ab4 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1216:	fe043783          	ld	a5,-32(s0)
    121a:	fef43423          	sd	a5,-24(s0)
    121e:	fe043783          	ld	a5,-32(s0)
    1222:	679c                	ld	a5,8(a5)
    1224:	fcf43423          	sd	a5,-56(s0)
    1228:	fc843783          	ld	a5,-56(s0)
    122c:	17e1                	addi	a5,a5,-8
    122e:	fef43023          	sd	a5,-32(s0)
    1232:	fe843783          	ld	a5,-24(s0)
    1236:	00878713          	addi	a4,a5,8
    123a:	00001797          	auipc	a5,0x1
    123e:	0c678793          	addi	a5,a5,198 # 2300 <release_queue>
    1242:	f2f714e3          	bne	a4,a5,116a <__release+0x36>
        }
    }
}
    1246:	0001                	nop
    1248:	0001                	nop
    124a:	70e2                	ld	ra,56(sp)
    124c:	7442                	ld	s0,48(sp)
    124e:	6121                	addi	sp,sp,64
    1250:	8082                	ret

0000000000001252 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    1252:	1101                	addi	sp,sp,-32
    1254:	ec06                	sd	ra,24(sp)
    1256:	e822                	sd	s0,16(sp)
    1258:	1000                	addi	s0,sp,32
    125a:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    125e:	fe843783          	ld	a5,-24(s0)
    1262:	7b98                	ld	a4,48(a5)
    1264:	00001797          	auipc	a5,0x1
    1268:	0d478793          	addi	a5,a5,212 # 2338 <current>
    126c:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    126e:	fe843783          	ld	a5,-24(s0)
    1272:	02878793          	addi	a5,a5,40
    1276:	853e                	mv	a0,a5
    1278:	00000097          	auipc	ra,0x0
    127c:	c30080e7          	jalr	-976(ra) # ea8 <list_del>

    free(to_remove->stack);
    1280:	fe843783          	ld	a5,-24(s0)
    1284:	6b9c                	ld	a5,16(a5)
    1286:	853e                	mv	a0,a5
    1288:	00000097          	auipc	ra,0x0
    128c:	82c080e7          	jalr	-2004(ra) # ab4 <free>
    free(to_remove);
    1290:	fe843503          	ld	a0,-24(s0)
    1294:	00000097          	auipc	ra,0x0
    1298:	820080e7          	jalr	-2016(ra) # ab4 <free>

    __schedule();
    129c:	00000097          	auipc	ra,0x0
    12a0:	5e8080e7          	jalr	1512(ra) # 1884 <__schedule>
    __dispatch();
    12a4:	00000097          	auipc	ra,0x0
    12a8:	416080e7          	jalr	1046(ra) # 16ba <__dispatch>
    thrdresume(main_thrd_id);
    12ac:	00001797          	auipc	a5,0x1
    12b0:	06478793          	addi	a5,a5,100 # 2310 <main_thrd_id>
    12b4:	439c                	lw	a5,0(a5)
    12b6:	853e                	mv	a0,a5
    12b8:	fffff097          	auipc	ra,0xfffff
    12bc:	30e080e7          	jalr	782(ra) # 5c6 <thrdresume>
}
    12c0:	0001                	nop
    12c2:	60e2                	ld	ra,24(sp)
    12c4:	6442                	ld	s0,16(sp)
    12c6:	6105                	addi	sp,sp,32
    12c8:	8082                	ret

00000000000012ca <thread_exit>:

void thread_exit(void)
{
    12ca:	7179                	addi	sp,sp,-48
    12cc:	f406                	sd	ra,40(sp)
    12ce:	f022                	sd	s0,32(sp)
    12d0:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    12d2:	00001797          	auipc	a5,0x1
    12d6:	06678793          	addi	a5,a5,102 # 2338 <current>
    12da:	6398                	ld	a4,0(a5)
    12dc:	00001797          	auipc	a5,0x1
    12e0:	01478793          	addi	a5,a5,20 # 22f0 <run_queue>
    12e4:	02f71063          	bne	a4,a5,1304 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    12e8:	00001597          	auipc	a1,0x1
    12ec:	d7858593          	addi	a1,a1,-648 # 2060 <schedule_edf_cbs+0x506>
    12f0:	4509                	li	a0,2
    12f2:	fffff097          	auipc	ra,0xfffff
    12f6:	71a080e7          	jalr	1818(ra) # a0c <fprintf>
        exit(1);
    12fa:	4505                	li	a0,1
    12fc:	fffff097          	auipc	ra,0xfffff
    1300:	222080e7          	jalr	546(ra) # 51e <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    1304:	00001797          	auipc	a5,0x1
    1308:	03478793          	addi	a5,a5,52 # 2338 <current>
    130c:	639c                	ld	a5,0(a5)
    130e:	fef43423          	sd	a5,-24(s0)
    1312:	fe843783          	ld	a5,-24(s0)
    1316:	fd878793          	addi	a5,a5,-40
    131a:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    131e:	fe043783          	ld	a5,-32(s0)
    1322:	5f9c                	lw	a5,56(a5)
    1324:	4585                	li	a1,1
    1326:	853e                	mv	a0,a5
    1328:	fffff097          	auipc	ra,0xfffff
    132c:	2a6080e7          	jalr	678(ra) # 5ce <cancelthrdstop>
    1330:	87aa                	mv	a5,a0
    1332:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    1336:	00001797          	auipc	a5,0x1
    133a:	00a78793          	addi	a5,a5,10 # 2340 <threading_system_time>
    133e:	439c                	lw	a5,0(a5)
    1340:	fdc42703          	lw	a4,-36(s0)
    1344:	9fb9                	addw	a5,a5,a4
    1346:	0007871b          	sext.w	a4,a5
    134a:	00001797          	auipc	a5,0x1
    134e:	ff678793          	addi	a5,a5,-10 # 2340 <threading_system_time>
    1352:	c398                	sw	a4,0(a5)

    __release();
    1354:	00000097          	auipc	ra,0x0
    1358:	de0080e7          	jalr	-544(ra) # 1134 <__release>
    __thread_exit(to_remove);
    135c:	fe043503          	ld	a0,-32(s0)
    1360:	00000097          	auipc	ra,0x0
    1364:	ef2080e7          	jalr	-270(ra) # 1252 <__thread_exit>
}
    1368:	0001                	nop
    136a:	70a2                	ld	ra,40(sp)
    136c:	7402                	ld	s0,32(sp)
    136e:	6145                	addi	sp,sp,48
    1370:	8082                	ret

0000000000001372 <__finish_current>:

void __finish_current()
{
    1372:	7179                	addi	sp,sp,-48
    1374:	f406                	sd	ra,40(sp)
    1376:	f022                	sd	s0,32(sp)
    1378:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    137a:	00001797          	auipc	a5,0x1
    137e:	fbe78793          	addi	a5,a5,-66 # 2338 <current>
    1382:	639c                	ld	a5,0(a5)
    1384:	fef43423          	sd	a5,-24(s0)
    1388:	fe843783          	ld	a5,-24(s0)
    138c:	fd878793          	addi	a5,a5,-40
    1390:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1394:	fe043783          	ld	a5,-32(s0)
    1398:	4bbc                	lw	a5,80(a5)
    139a:	37fd                	addiw	a5,a5,-1
    139c:	0007871b          	sext.w	a4,a5
    13a0:	fe043783          	ld	a5,-32(s0)
    13a4:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    13a6:	fe043783          	ld	a5,-32(s0)
    13aa:	5fd8                	lw	a4,60(a5)
    13ac:	00001797          	auipc	a5,0x1
    13b0:	f9478793          	addi	a5,a5,-108 # 2340 <threading_system_time>
    13b4:	4390                	lw	a2,0(a5)
    13b6:	fe043783          	ld	a5,-32(s0)
    13ba:	4bbc                	lw	a5,80(a5)
    13bc:	86be                	mv	a3,a5
    13be:	85ba                	mv	a1,a4
    13c0:	00001517          	auipc	a0,0x1
    13c4:	cd850513          	addi	a0,a0,-808 # 2098 <schedule_edf_cbs+0x53e>
    13c8:	fffff097          	auipc	ra,0xfffff
    13cc:	69c080e7          	jalr	1692(ra) # a64 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    13d0:	fe043783          	ld	a5,-32(s0)
    13d4:	4bbc                	lw	a5,80(a5)
    13d6:	04f05563          	blez	a5,1420 <__finish_current+0xae>
        struct list_head *to_remove = current;
    13da:	00001797          	auipc	a5,0x1
    13de:	f5e78793          	addi	a5,a5,-162 # 2338 <current>
    13e2:	639c                	ld	a5,0(a5)
    13e4:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    13e8:	00001797          	auipc	a5,0x1
    13ec:	f5078793          	addi	a5,a5,-176 # 2338 <current>
    13f0:	639c                	ld	a5,0(a5)
    13f2:	6798                	ld	a4,8(a5)
    13f4:	00001797          	auipc	a5,0x1
    13f8:	f4478793          	addi	a5,a5,-188 # 2338 <current>
    13fc:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    13fe:	fd843503          	ld	a0,-40(s0)
    1402:	00000097          	auipc	ra,0x0
    1406:	aa6080e7          	jalr	-1370(ra) # ea8 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    140a:	fe043783          	ld	a5,-32(s0)
    140e:	4fbc                	lw	a5,88(a5)
    1410:	85be                	mv	a1,a5
    1412:	fe043503          	ld	a0,-32(s0)
    1416:	00000097          	auipc	ra,0x0
    141a:	c9e080e7          	jalr	-866(ra) # 10b4 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    141e:	a039                	j	142c <__finish_current+0xba>
        __thread_exit(current_thread);
    1420:	fe043503          	ld	a0,-32(s0)
    1424:	00000097          	auipc	ra,0x0
    1428:	e2e080e7          	jalr	-466(ra) # 1252 <__thread_exit>
}
    142c:	0001                	nop
    142e:	70a2                	ld	ra,40(sp)
    1430:	7402                	ld	s0,32(sp)
    1432:	6145                	addi	sp,sp,48
    1434:	8082                	ret

0000000000001436 <__rt_finish_current>:
void __rt_finish_current()
{
    1436:	7179                	addi	sp,sp,-48
    1438:	f406                	sd	ra,40(sp)
    143a:	f022                	sd	s0,32(sp)
    143c:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    143e:	00001797          	auipc	a5,0x1
    1442:	efa78793          	addi	a5,a5,-262 # 2338 <current>
    1446:	639c                	ld	a5,0(a5)
    1448:	fef43423          	sd	a5,-24(s0)
    144c:	fe843783          	ld	a5,-24(s0)
    1450:	fd878793          	addi	a5,a5,-40
    1454:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1458:	fe043783          	ld	a5,-32(s0)
    145c:	4bbc                	lw	a5,80(a5)
    145e:	37fd                	addiw	a5,a5,-1
    1460:	0007871b          	sext.w	a4,a5
    1464:	fe043783          	ld	a5,-32(s0)
    1468:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    146a:	fe043783          	ld	a5,-32(s0)
    146e:	5fd8                	lw	a4,60(a5)
    1470:	00001797          	auipc	a5,0x1
    1474:	ed078793          	addi	a5,a5,-304 # 2340 <threading_system_time>
    1478:	4390                	lw	a2,0(a5)
    147a:	fe043783          	ld	a5,-32(s0)
    147e:	4bbc                	lw	a5,80(a5)
    1480:	86be                	mv	a3,a5
    1482:	85ba                	mv	a1,a4
    1484:	00001517          	auipc	a0,0x1
    1488:	c2c50513          	addi	a0,a0,-980 # 20b0 <schedule_edf_cbs+0x556>
    148c:	fffff097          	auipc	ra,0xfffff
    1490:	5d8080e7          	jalr	1496(ra) # a64 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1494:	fe043783          	ld	a5,-32(s0)
    1498:	4bbc                	lw	a5,80(a5)
    149a:	04f05f63          	blez	a5,14f8 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    149e:	00001797          	auipc	a5,0x1
    14a2:	e9a78793          	addi	a5,a5,-358 # 2338 <current>
    14a6:	639c                	ld	a5,0(a5)
    14a8:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    14ac:	00001797          	auipc	a5,0x1
    14b0:	e8c78793          	addi	a5,a5,-372 # 2338 <current>
    14b4:	639c                	ld	a5,0(a5)
    14b6:	6798                	ld	a4,8(a5)
    14b8:	00001797          	auipc	a5,0x1
    14bc:	e8078793          	addi	a5,a5,-384 # 2338 <current>
    14c0:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    14c2:	fd843503          	ld	a0,-40(s0)
    14c6:	00000097          	auipc	ra,0x0
    14ca:	9e2080e7          	jalr	-1566(ra) # ea8 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    14ce:	fe043783          	ld	a5,-32(s0)
    14d2:	4fbc                	lw	a5,88(a5)
    14d4:	85be                	mv	a1,a5
    14d6:	fe043503          	ld	a0,-32(s0)
    14da:	00000097          	auipc	ra,0x0
    14de:	bda080e7          	jalr	-1062(ra) # 10b4 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    14e2:	fe043783          	ld	a5,-32(s0)
    14e6:	57fc                	lw	a5,108(a5)
    14e8:	ef91                	bnez	a5,1504 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    14ea:	fe043783          	ld	a5,-32(s0)
    14ee:	53f8                	lw	a4,100(a5)
    14f0:	fe043783          	ld	a5,-32(s0)
    14f4:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    14f6:	a039                	j	1504 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    14f8:	fe043503          	ld	a0,-32(s0)
    14fc:	00000097          	auipc	ra,0x0
    1500:	d56080e7          	jalr	-682(ra) # 1252 <__thread_exit>
}
    1504:	0001                	nop
    1506:	70a2                	ld	ra,40(sp)
    1508:	7402                	ld	s0,32(sp)
    150a:	6145                	addi	sp,sp,48
    150c:	8082                	ret

000000000000150e <switch_handler>:

void switch_handler(void *arg)
{
    150e:	7139                	addi	sp,sp,-64
    1510:	fc06                	sd	ra,56(sp)
    1512:	f822                	sd	s0,48(sp)
    1514:	0080                	addi	s0,sp,64
    1516:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    151a:	fc843783          	ld	a5,-56(s0)
    151e:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1522:	00001797          	auipc	a5,0x1
    1526:	e1678793          	addi	a5,a5,-490 # 2338 <current>
    152a:	639c                	ld	a5,0(a5)
    152c:	fef43023          	sd	a5,-32(s0)
    1530:	fe043783          	ld	a5,-32(s0)
    1534:	fd878793          	addi	a5,a5,-40
    1538:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    153c:	fe843783          	ld	a5,-24(s0)
    1540:	0007871b          	sext.w	a4,a5
    1544:	00001797          	auipc	a5,0x1
    1548:	dfc78793          	addi	a5,a5,-516 # 2340 <threading_system_time>
    154c:	439c                	lw	a5,0(a5)
    154e:	2781                	sext.w	a5,a5
    1550:	9fb9                	addw	a5,a5,a4
    1552:	2781                	sext.w	a5,a5
    1554:	0007871b          	sext.w	a4,a5
    1558:	00001797          	auipc	a5,0x1
    155c:	de878793          	addi	a5,a5,-536 # 2340 <threading_system_time>
    1560:	c398                	sw	a4,0(a5)
     __release();
    1562:	00000097          	auipc	ra,0x0
    1566:	bd2080e7          	jalr	-1070(ra) # 1134 <__release>
    current_thread->remaining_time -= elapsed_time;
    156a:	fd843783          	ld	a5,-40(s0)
    156e:	4bfc                	lw	a5,84(a5)
    1570:	0007871b          	sext.w	a4,a5
    1574:	fe843783          	ld	a5,-24(s0)
    1578:	2781                	sext.w	a5,a5
    157a:	40f707bb          	subw	a5,a4,a5
    157e:	2781                	sext.w	a5,a5
    1580:	0007871b          	sext.w	a4,a5
    1584:	fd843783          	ld	a5,-40(s0)
    1588:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    158a:	fd843783          	ld	a5,-40(s0)
    158e:	57fc                	lw	a5,108(a5)
    1590:	e38d                	bnez	a5,15b2 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    1592:	fd843783          	ld	a5,-40(s0)
    1596:	57bc                	lw	a5,104(a5)
    1598:	0007871b          	sext.w	a4,a5
    159c:	fe843783          	ld	a5,-24(s0)
    15a0:	2781                	sext.w	a5,a5
    15a2:	40f707bb          	subw	a5,a4,a5
    15a6:	2781                	sext.w	a5,a5
    15a8:	0007871b          	sext.w	a4,a5
    15ac:	fd843783          	ld	a5,-40(s0)
    15b0:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    15b2:	fd843783          	ld	a5,-40(s0)
    15b6:	43bc                	lw	a5,64(a5)
    15b8:	c3ad                	beqz	a5,161a <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    15ba:	fd843783          	ld	a5,-40(s0)
    15be:	4fb8                	lw	a4,88(a5)
    15c0:	00001797          	auipc	a5,0x1
    15c4:	d8078793          	addi	a5,a5,-640 # 2340 <threading_system_time>
    15c8:	439c                	lw	a5,0(a5)
    15ca:	02f74163          	blt	a4,a5,15ec <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    15ce:	fd843783          	ld	a5,-40(s0)
    15d2:	4fb8                	lw	a4,88(a5)
    15d4:	00001797          	auipc	a5,0x1
    15d8:	d6c78793          	addi	a5,a5,-660 # 2340 <threading_system_time>
    15dc:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    15de:	02f71e63          	bne	a4,a5,161a <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    15e2:	fd843783          	ld	a5,-40(s0)
    15e6:	4bfc                	lw	a5,84(a5)
    15e8:	02f05963          	blez	a5,161a <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    15ec:	fd843783          	ld	a5,-40(s0)
    15f0:	5fd8                	lw	a4,60(a5)
    15f2:	00001797          	auipc	a5,0x1
    15f6:	d4e78793          	addi	a5,a5,-690 # 2340 <threading_system_time>
    15fa:	439c                	lw	a5,0(a5)
    15fc:	863e                	mv	a2,a5
    15fe:	85ba                	mv	a1,a4
    1600:	00001517          	auipc	a0,0x1
    1604:	ae850513          	addi	a0,a0,-1304 # 20e8 <schedule_edf_cbs+0x58e>
    1608:	fffff097          	auipc	ra,0xfffff
    160c:	45c080e7          	jalr	1116(ra) # a64 <printf>
            exit(0);
    1610:	4501                	li	a0,0
    1612:	fffff097          	auipc	ra,0xfffff
    1616:	f0c080e7          	jalr	-244(ra) # 51e <exit>
        }

    if (current_thread->remaining_time <= 0) {
    161a:	fd843783          	ld	a5,-40(s0)
    161e:	4bfc                	lw	a5,84(a5)
    1620:	02f04063          	bgtz	a5,1640 <switch_handler+0x132>
        if (current_thread->is_real_time)
    1624:	fd843783          	ld	a5,-40(s0)
    1628:	43bc                	lw	a5,64(a5)
    162a:	c791                	beqz	a5,1636 <switch_handler+0x128>
            __rt_finish_current();
    162c:	00000097          	auipc	ra,0x0
    1630:	e0a080e7          	jalr	-502(ra) # 1436 <__rt_finish_current>
    1634:	a881                	j	1684 <switch_handler+0x176>
        else
            __finish_current();
    1636:	00000097          	auipc	ra,0x0
    163a:	d3c080e7          	jalr	-708(ra) # 1372 <__finish_current>
    163e:	a099                	j	1684 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    1640:	00001797          	auipc	a5,0x1
    1644:	cf878793          	addi	a5,a5,-776 # 2338 <current>
    1648:	639c                	ld	a5,0(a5)
    164a:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    164e:	00001797          	auipc	a5,0x1
    1652:	cea78793          	addi	a5,a5,-790 # 2338 <current>
    1656:	639c                	ld	a5,0(a5)
    1658:	6798                	ld	a4,8(a5)
    165a:	00001797          	auipc	a5,0x1
    165e:	cde78793          	addi	a5,a5,-802 # 2338 <current>
    1662:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1664:	fd043503          	ld	a0,-48(s0)
    1668:	00000097          	auipc	ra,0x0
    166c:	840080e7          	jalr	-1984(ra) # ea8 <list_del>
        list_add_tail(to_remove, &run_queue);
    1670:	00001597          	auipc	a1,0x1
    1674:	c8058593          	addi	a1,a1,-896 # 22f0 <run_queue>
    1678:	fd043503          	ld	a0,-48(s0)
    167c:	fffff097          	auipc	ra,0xfffff
    1680:	7d0080e7          	jalr	2000(ra) # e4c <list_add_tail>
    }

    __release();
    1684:	00000097          	auipc	ra,0x0
    1688:	ab0080e7          	jalr	-1360(ra) # 1134 <__release>
    __schedule();
    168c:	00000097          	auipc	ra,0x0
    1690:	1f8080e7          	jalr	504(ra) # 1884 <__schedule>
    __dispatch();
    1694:	00000097          	auipc	ra,0x0
    1698:	026080e7          	jalr	38(ra) # 16ba <__dispatch>
    thrdresume(main_thrd_id);
    169c:	00001797          	auipc	a5,0x1
    16a0:	c7478793          	addi	a5,a5,-908 # 2310 <main_thrd_id>
    16a4:	439c                	lw	a5,0(a5)
    16a6:	853e                	mv	a0,a5
    16a8:	fffff097          	auipc	ra,0xfffff
    16ac:	f1e080e7          	jalr	-226(ra) # 5c6 <thrdresume>
}
    16b0:	0001                	nop
    16b2:	70e2                	ld	ra,56(sp)
    16b4:	7442                	ld	s0,48(sp)
    16b6:	6121                	addi	sp,sp,64
    16b8:	8082                	ret

00000000000016ba <__dispatch>:

void __dispatch()
{
    16ba:	7179                	addi	sp,sp,-48
    16bc:	f406                	sd	ra,40(sp)
    16be:	f022                	sd	s0,32(sp)
    16c0:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    16c2:	00001797          	auipc	a5,0x1
    16c6:	c7678793          	addi	a5,a5,-906 # 2338 <current>
    16ca:	6398                	ld	a4,0(a5)
    16cc:	00001797          	auipc	a5,0x1
    16d0:	c2478793          	addi	a5,a5,-988 # 22f0 <run_queue>
    16d4:	1af70363          	beq	a4,a5,187a <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    16d8:	00001797          	auipc	a5,0x1
    16dc:	c6078793          	addi	a5,a5,-928 # 2338 <current>
    16e0:	639c                	ld	a5,0(a5)
    16e2:	fef43423          	sd	a5,-24(s0)
    16e6:	fe843783          	ld	a5,-24(s0)
    16ea:	fd878793          	addi	a5,a5,-40
    16ee:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    16f2:	fe043783          	ld	a5,-32(s0)
    16f6:	5fcc                	lw	a1,60(a5)
    16f8:	00001797          	auipc	a5,0x1
    16fc:	c4878793          	addi	a5,a5,-952 # 2340 <threading_system_time>
    1700:	4390                	lw	a2,0(a5)
    1702:	00001797          	auipc	a5,0x1
    1706:	c4678793          	addi	a5,a5,-954 # 2348 <allocated_time>
    170a:	6394                	ld	a3,0(a5)
    170c:	fe043783          	ld	a5,-32(s0)
    1710:	4bfc                	lw	a5,84(a5)
    1712:	873e                	mv	a4,a5
    1714:	00001517          	auipc	a0,0x1
    1718:	a0450513          	addi	a0,a0,-1532 # 2118 <schedule_edf_cbs+0x5be>
    171c:	fffff097          	auipc	ra,0xfffff
    1720:	348080e7          	jalr	840(ra) # a64 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    1724:	fe043783          	ld	a5,-32(s0)
    1728:	43bc                	lw	a5,64(a5)
    172a:	c3a1                	beqz	a5,176a <__dispatch+0xb0>
    172c:	00001797          	auipc	a5,0x1
    1730:	c1c78793          	addi	a5,a5,-996 # 2348 <allocated_time>
    1734:	639c                	ld	a5,0(a5)
    1736:	eb95                	bnez	a5,176a <__dispatch+0xb0>
    1738:	fe043783          	ld	a5,-32(s0)
    173c:	57fc                	lw	a5,108(a5)
    173e:	c795                	beqz	a5,176a <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    1740:	fe043783          	ld	a5,-32(s0)
    1744:	5fd8                	lw	a4,60(a5)
    1746:	fe043783          	ld	a5,-32(s0)
    174a:	4fbc                	lw	a5,88(a5)
    174c:	863e                	mv	a2,a5
    174e:	85ba                	mv	a1,a4
    1750:	00001517          	auipc	a0,0x1
    1754:	a1850513          	addi	a0,a0,-1512 # 2168 <schedule_edf_cbs+0x60e>
    1758:	fffff097          	auipc	ra,0xfffff
    175c:	30c080e7          	jalr	780(ra) # a64 <printf>
        exit(0);
    1760:	4501                	li	a0,0
    1762:	fffff097          	auipc	ra,0xfffff
    1766:	dbc080e7          	jalr	-580(ra) # 51e <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    176a:	fe043783          	ld	a5,-32(s0)
    176e:	5fd8                	lw	a4,60(a5)
    1770:	00001797          	auipc	a5,0x1
    1774:	bd078793          	addi	a5,a5,-1072 # 2340 <threading_system_time>
    1778:	4390                	lw	a2,0(a5)
    177a:	00001797          	auipc	a5,0x1
    177e:	bce78793          	addi	a5,a5,-1074 # 2348 <allocated_time>
    1782:	639c                	ld	a5,0(a5)
    1784:	86be                	mv	a3,a5
    1786:	85ba                	mv	a1,a4
    1788:	00001517          	auipc	a0,0x1
    178c:	a1050513          	addi	a0,a0,-1520 # 2198 <schedule_edf_cbs+0x63e>
    1790:	fffff097          	auipc	ra,0xfffff
    1794:	2d4080e7          	jalr	724(ra) # a64 <printf>

    if (current_thread->buf_set) {
    1798:	fe043783          	ld	a5,-32(s0)
    179c:	539c                	lw	a5,32(a5)
    179e:	c7a1                	beqz	a5,17e6 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    17a0:	00001797          	auipc	a5,0x1
    17a4:	ba878793          	addi	a5,a5,-1112 # 2348 <allocated_time>
    17a8:	639c                	ld	a5,0(a5)
    17aa:	0007871b          	sext.w	a4,a5
    17ae:	fe043783          	ld	a5,-32(s0)
    17b2:	03878593          	addi	a1,a5,56
    17b6:	00001797          	auipc	a5,0x1
    17ba:	b9278793          	addi	a5,a5,-1134 # 2348 <allocated_time>
    17be:	639c                	ld	a5,0(a5)
    17c0:	86be                	mv	a3,a5
    17c2:	00000617          	auipc	a2,0x0
    17c6:	d4c60613          	addi	a2,a2,-692 # 150e <switch_handler>
    17ca:	853a                	mv	a0,a4
    17cc:	fffff097          	auipc	ra,0xfffff
    17d0:	df2080e7          	jalr	-526(ra) # 5be <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    17d4:	fe043783          	ld	a5,-32(s0)
    17d8:	5f9c                	lw	a5,56(a5)
    17da:	853e                	mv	a0,a5
    17dc:	fffff097          	auipc	ra,0xfffff
    17e0:	dea080e7          	jalr	-534(ra) # 5c6 <thrdresume>
    17e4:	a071                	j	1870 <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    17e6:	fe043783          	ld	a5,-32(s0)
    17ea:	4705                	li	a4,1
    17ec:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    17ee:	fe043783          	ld	a5,-32(s0)
    17f2:	6f9c                	ld	a5,24(a5)
    17f4:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    17f8:	fe043783          	ld	a5,-32(s0)
    17fc:	577d                	li	a4,-1
    17fe:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1800:	00001797          	auipc	a5,0x1
    1804:	b4878793          	addi	a5,a5,-1208 # 2348 <allocated_time>
    1808:	639c                	ld	a5,0(a5)
    180a:	0007871b          	sext.w	a4,a5
    180e:	fe043783          	ld	a5,-32(s0)
    1812:	03878593          	addi	a1,a5,56
    1816:	00001797          	auipc	a5,0x1
    181a:	b3278793          	addi	a5,a5,-1230 # 2348 <allocated_time>
    181e:	639c                	ld	a5,0(a5)
    1820:	86be                	mv	a3,a5
    1822:	00000617          	auipc	a2,0x0
    1826:	cec60613          	addi	a2,a2,-788 # 150e <switch_handler>
    182a:	853a                	mv	a0,a4
    182c:	fffff097          	auipc	ra,0xfffff
    1830:	d92080e7          	jalr	-622(ra) # 5be <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    1834:	fe043783          	ld	a5,-32(s0)
    1838:	5f9c                	lw	a5,56(a5)
    183a:	0207d063          	bgez	a5,185a <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    183e:	00001597          	auipc	a1,0x1
    1842:	98a58593          	addi	a1,a1,-1654 # 21c8 <schedule_edf_cbs+0x66e>
    1846:	4509                	li	a0,2
    1848:	fffff097          	auipc	ra,0xfffff
    184c:	1c4080e7          	jalr	452(ra) # a0c <fprintf>
            exit(1);
    1850:	4505                	li	a0,1
    1852:	fffff097          	auipc	ra,0xfffff
    1856:	ccc080e7          	jalr	-820(ra) # 51e <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    185a:	fd843783          	ld	a5,-40(s0)
    185e:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    1860:	fe043783          	ld	a5,-32(s0)
    1864:	6398                	ld	a4,0(a5)
    1866:	fe043783          	ld	a5,-32(s0)
    186a:	679c                	ld	a5,8(a5)
    186c:	853e                	mv	a0,a5
    186e:	9702                	jalr	a4
    }
    thread_exit();
    1870:	00000097          	auipc	ra,0x0
    1874:	a5a080e7          	jalr	-1446(ra) # 12ca <thread_exit>
    1878:	a011                	j	187c <__dispatch+0x1c2>
        return;
    187a:	0001                	nop
}
    187c:	70a2                	ld	ra,40(sp)
    187e:	7402                	ld	s0,32(sp)
    1880:	6145                	addi	sp,sp,48
    1882:	8082                	ret

0000000000001884 <__schedule>:

void __schedule()
{
    1884:	711d                	addi	sp,sp,-96
    1886:	ec86                	sd	ra,88(sp)
    1888:	e8a2                	sd	s0,80(sp)
    188a:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    188c:	00001797          	auipc	a5,0x1
    1890:	ab478793          	addi	a5,a5,-1356 # 2340 <threading_system_time>
    1894:	439c                	lw	a5,0(a5)
    1896:	fcf42c23          	sw	a5,-40(s0)
    189a:	4789                	li	a5,2
    189c:	fcf42e23          	sw	a5,-36(s0)
    18a0:	00001797          	auipc	a5,0x1
    18a4:	a5078793          	addi	a5,a5,-1456 # 22f0 <run_queue>
    18a8:	fef43023          	sd	a5,-32(s0)
    18ac:	00001797          	auipc	a5,0x1
    18b0:	a5478793          	addi	a5,a5,-1452 # 2300 <release_queue>
    18b4:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    18b8:	fd843783          	ld	a5,-40(s0)
    18bc:	faf43023          	sd	a5,-96(s0)
    18c0:	fe043783          	ld	a5,-32(s0)
    18c4:	faf43423          	sd	a5,-88(s0)
    18c8:	fe843783          	ld	a5,-24(s0)
    18cc:	faf43823          	sd	a5,-80(s0)
    18d0:	fa040793          	addi	a5,s0,-96
    18d4:	853e                	mv	a0,a5
    18d6:	00000097          	auipc	ra,0x0
    18da:	284080e7          	jalr	644(ra) # 1b5a <schedule_edf_cbs>
    18de:	872a                	mv	a4,a0
    18e0:	87ae                	mv	a5,a1
    18e2:	fce43423          	sd	a4,-56(s0)
    18e6:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    18ea:	fc843703          	ld	a4,-56(s0)
    18ee:	00001797          	auipc	a5,0x1
    18f2:	a4a78793          	addi	a5,a5,-1462 # 2338 <current>
    18f6:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    18f8:	fd042783          	lw	a5,-48(s0)
    18fc:	873e                	mv	a4,a5
    18fe:	00001797          	auipc	a5,0x1
    1902:	a4a78793          	addi	a5,a5,-1462 # 2348 <allocated_time>
    1906:	e398                	sd	a4,0(a5)
}
    1908:	0001                	nop
    190a:	60e6                	ld	ra,88(sp)
    190c:	6446                	ld	s0,80(sp)
    190e:	6125                	addi	sp,sp,96
    1910:	8082                	ret

0000000000001912 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    1912:	1101                	addi	sp,sp,-32
    1914:	ec06                	sd	ra,24(sp)
    1916:	e822                	sd	s0,16(sp)
    1918:	1000                	addi	s0,sp,32
    191a:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    191e:	00001797          	auipc	a5,0x1
    1922:	a2678793          	addi	a5,a5,-1498 # 2344 <sleeping>
    1926:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    192a:	fe843783          	ld	a5,-24(s0)
    192e:	0007871b          	sext.w	a4,a5
    1932:	00001797          	auipc	a5,0x1
    1936:	a0e78793          	addi	a5,a5,-1522 # 2340 <threading_system_time>
    193a:	439c                	lw	a5,0(a5)
    193c:	2781                	sext.w	a5,a5
    193e:	9fb9                	addw	a5,a5,a4
    1940:	2781                	sext.w	a5,a5
    1942:	0007871b          	sext.w	a4,a5
    1946:	00001797          	auipc	a5,0x1
    194a:	9fa78793          	addi	a5,a5,-1542 # 2340 <threading_system_time>
    194e:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    1950:	00001797          	auipc	a5,0x1
    1954:	9c078793          	addi	a5,a5,-1600 # 2310 <main_thrd_id>
    1958:	439c                	lw	a5,0(a5)
    195a:	853e                	mv	a0,a5
    195c:	fffff097          	auipc	ra,0xfffff
    1960:	c6a080e7          	jalr	-918(ra) # 5c6 <thrdresume>
}
    1964:	0001                	nop
    1966:	60e2                	ld	ra,24(sp)
    1968:	6442                	ld	s0,16(sp)
    196a:	6105                	addi	sp,sp,32
    196c:	8082                	ret

000000000000196e <thread_start_threading>:

void thread_start_threading()
{
    196e:	1141                	addi	sp,sp,-16
    1970:	e406                	sd	ra,8(sp)
    1972:	e022                	sd	s0,0(sp)
    1974:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1976:	00001797          	auipc	a5,0x1
    197a:	9ca78793          	addi	a5,a5,-1590 # 2340 <threading_system_time>
    197e:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    1982:	00001797          	auipc	a5,0x1
    1986:	9b678793          	addi	a5,a5,-1610 # 2338 <current>
    198a:	00001717          	auipc	a4,0x1
    198e:	96670713          	addi	a4,a4,-1690 # 22f0 <run_queue>
    1992:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1994:	4681                	li	a3,0
    1996:	00000617          	auipc	a2,0x0
    199a:	f7c60613          	addi	a2,a2,-132 # 1912 <back_to_main_handler>
    199e:	00001597          	auipc	a1,0x1
    19a2:	97258593          	addi	a1,a1,-1678 # 2310 <main_thrd_id>
    19a6:	3e800513          	li	a0,1000
    19aa:	fffff097          	auipc	ra,0xfffff
    19ae:	c14080e7          	jalr	-1004(ra) # 5be <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    19b2:	00001797          	auipc	a5,0x1
    19b6:	95e78793          	addi	a5,a5,-1698 # 2310 <main_thrd_id>
    19ba:	439c                	lw	a5,0(a5)
    19bc:	4581                	li	a1,0
    19be:	853e                	mv	a0,a5
    19c0:	fffff097          	auipc	ra,0xfffff
    19c4:	c0e080e7          	jalr	-1010(ra) # 5ce <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    19c8:	a0c9                	j	1a8a <thread_start_threading+0x11c>
        __release();
    19ca:	fffff097          	auipc	ra,0xfffff
    19ce:	76a080e7          	jalr	1898(ra) # 1134 <__release>
        __schedule();
    19d2:	00000097          	auipc	ra,0x0
    19d6:	eb2080e7          	jalr	-334(ra) # 1884 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    19da:	00001797          	auipc	a5,0x1
    19de:	93678793          	addi	a5,a5,-1738 # 2310 <main_thrd_id>
    19e2:	439c                	lw	a5,0(a5)
    19e4:	4581                	li	a1,0
    19e6:	853e                	mv	a0,a5
    19e8:	fffff097          	auipc	ra,0xfffff
    19ec:	be6080e7          	jalr	-1050(ra) # 5ce <cancelthrdstop>
        __dispatch();
    19f0:	00000097          	auipc	ra,0x0
    19f4:	cca080e7          	jalr	-822(ra) # 16ba <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    19f8:	00001517          	auipc	a0,0x1
    19fc:	8f850513          	addi	a0,a0,-1800 # 22f0 <run_queue>
    1a00:	fffff097          	auipc	ra,0xfffff
    1a04:	4f2080e7          	jalr	1266(ra) # ef2 <list_empty>
    1a08:	87aa                	mv	a5,a0
    1a0a:	cb99                	beqz	a5,1a20 <thread_start_threading+0xb2>
    1a0c:	00001517          	auipc	a0,0x1
    1a10:	8f450513          	addi	a0,a0,-1804 # 2300 <release_queue>
    1a14:	fffff097          	auipc	ra,0xfffff
    1a18:	4de080e7          	jalr	1246(ra) # ef2 <list_empty>
    1a1c:	87aa                	mv	a5,a0
    1a1e:	ebd9                	bnez	a5,1ab4 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1a20:	00001797          	auipc	a5,0x1
    1a24:	92878793          	addi	a5,a5,-1752 # 2348 <allocated_time>
    1a28:	639c                	ld	a5,0(a5)
    1a2a:	85be                	mv	a1,a5
    1a2c:	00000517          	auipc	a0,0x0
    1a30:	7d450513          	addi	a0,a0,2004 # 2200 <schedule_edf_cbs+0x6a6>
    1a34:	fffff097          	auipc	ra,0xfffff
    1a38:	030080e7          	jalr	48(ra) # a64 <printf>
        sleeping = 1;
    1a3c:	00001797          	auipc	a5,0x1
    1a40:	90878793          	addi	a5,a5,-1784 # 2344 <sleeping>
    1a44:	4705                	li	a4,1
    1a46:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1a48:	00001797          	auipc	a5,0x1
    1a4c:	90078793          	addi	a5,a5,-1792 # 2348 <allocated_time>
    1a50:	639c                	ld	a5,0(a5)
    1a52:	0007871b          	sext.w	a4,a5
    1a56:	00001797          	auipc	a5,0x1
    1a5a:	8f278793          	addi	a5,a5,-1806 # 2348 <allocated_time>
    1a5e:	639c                	ld	a5,0(a5)
    1a60:	86be                	mv	a3,a5
    1a62:	00000617          	auipc	a2,0x0
    1a66:	eb060613          	addi	a2,a2,-336 # 1912 <back_to_main_handler>
    1a6a:	00001597          	auipc	a1,0x1
    1a6e:	8a658593          	addi	a1,a1,-1882 # 2310 <main_thrd_id>
    1a72:	853a                	mv	a0,a4
    1a74:	fffff097          	auipc	ra,0xfffff
    1a78:	b4a080e7          	jalr	-1206(ra) # 5be <thrdstop>
        while (sleeping) {
    1a7c:	0001                	nop
    1a7e:	00001797          	auipc	a5,0x1
    1a82:	8c678793          	addi	a5,a5,-1850 # 2344 <sleeping>
    1a86:	439c                	lw	a5,0(a5)
    1a88:	fbfd                	bnez	a5,1a7e <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1a8a:	00001517          	auipc	a0,0x1
    1a8e:	86650513          	addi	a0,a0,-1946 # 22f0 <run_queue>
    1a92:	fffff097          	auipc	ra,0xfffff
    1a96:	460080e7          	jalr	1120(ra) # ef2 <list_empty>
    1a9a:	87aa                	mv	a5,a0
    1a9c:	d79d                	beqz	a5,19ca <thread_start_threading+0x5c>
    1a9e:	00001517          	auipc	a0,0x1
    1aa2:	86250513          	addi	a0,a0,-1950 # 2300 <release_queue>
    1aa6:	fffff097          	auipc	ra,0xfffff
    1aaa:	44c080e7          	jalr	1100(ra) # ef2 <list_empty>
    1aae:	87aa                	mv	a5,a0
    1ab0:	df89                	beqz	a5,19ca <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1ab2:	a011                	j	1ab6 <thread_start_threading+0x148>
            break;
    1ab4:	0001                	nop
}
    1ab6:	0001                	nop
    1ab8:	60a2                	ld	ra,8(sp)
    1aba:	6402                	ld	s0,0(sp)
    1abc:	0141                	addi	sp,sp,16
    1abe:	8082                	ret

0000000000001ac0 <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1ac0:	7139                	addi	sp,sp,-64
    1ac2:	fc22                	sd	s0,56(sp)
    1ac4:	0080                	addi	s0,sp,64
    1ac6:	fca43423          	sd	a0,-56(s0)
    1aca:	87ae                	mv	a5,a1
    1acc:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1ad0:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1ad4:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1ad8:	fc843783          	ld	a5,-56(s0)
    1adc:	639c                	ld	a5,0(a5)
    1ade:	fcf43c23          	sd	a5,-40(s0)
    1ae2:	fd843783          	ld	a5,-40(s0)
    1ae6:	fd878793          	addi	a5,a5,-40
    1aea:	fef43423          	sd	a5,-24(s0)
    1aee:	a881                	j	1b3e <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1af0:	fe843783          	ld	a5,-24(s0)
    1af4:	4fb8                	lw	a4,88(a5)
    1af6:	fc442783          	lw	a5,-60(s0)
    1afa:	2781                	sext.w	a5,a5
    1afc:	02e7c663          	blt	a5,a4,1b28 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1b00:	fe043783          	ld	a5,-32(s0)
    1b04:	e791                	bnez	a5,1b10 <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1b06:	fe843783          	ld	a5,-24(s0)
    1b0a:	fef43023          	sd	a5,-32(s0)
    1b0e:	a829                	j	1b28 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1b10:	fe843783          	ld	a5,-24(s0)
    1b14:	5fd8                	lw	a4,60(a5)
    1b16:	fe043783          	ld	a5,-32(s0)
    1b1a:	5fdc                	lw	a5,60(a5)
    1b1c:	00f75663          	bge	a4,a5,1b28 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1b20:	fe843783          	ld	a5,-24(s0)
    1b24:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1b28:	fe843783          	ld	a5,-24(s0)
    1b2c:	779c                	ld	a5,40(a5)
    1b2e:	fcf43823          	sd	a5,-48(s0)
    1b32:	fd043783          	ld	a5,-48(s0)
    1b36:	fd878793          	addi	a5,a5,-40
    1b3a:	fef43423          	sd	a5,-24(s0)
    1b3e:	fe843783          	ld	a5,-24(s0)
    1b42:	02878793          	addi	a5,a5,40
    1b46:	fc843703          	ld	a4,-56(s0)
    1b4a:	faf713e3          	bne	a4,a5,1af0 <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1b4e:	fe043783          	ld	a5,-32(s0)
}
    1b52:	853e                	mv	a0,a5
    1b54:	7462                	ld	s0,56(sp)
    1b56:	6121                	addi	sp,sp,64
    1b58:	8082                	ret

0000000000001b5a <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1b5a:	7131                	addi	sp,sp,-192
    1b5c:	fd06                	sd	ra,184(sp)
    1b5e:	f922                	sd	s0,176(sp)
    1b60:	f526                	sd	s1,168(sp)
    1b62:	f14a                	sd	s2,160(sp)
    1b64:	ed4e                	sd	s3,152(sp)
    1b66:	0180                	addi	s0,sp,192
    1b68:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1b6a:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1b6e:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1b72:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1b76:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1b7a:	649c                	ld	a5,8(s1)
    1b7c:	4098                	lw	a4,0(s1)
    1b7e:	85ba                	mv	a1,a4
    1b80:	853e                	mv	a0,a5
    1b82:	00000097          	auipc	ra,0x0
    1b86:	f3e080e7          	jalr	-194(ra) # 1ac0 <__check_deadline_miss>
    1b8a:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1b8e:	f9843783          	ld	a5,-104(s0)
    1b92:	c7b5                	beqz	a5,1bfe <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1b94:	f9843783          	ld	a5,-104(s0)
    1b98:	5fdc                	lw	a5,60(a5)
    1b9a:	85be                	mv	a1,a5
    1b9c:	00000517          	auipc	a0,0x0
    1ba0:	68c50513          	addi	a0,a0,1676 # 2228 <schedule_edf_cbs+0x6ce>
    1ba4:	fffff097          	auipc	ra,0xfffff
    1ba8:	ec0080e7          	jalr	-320(ra) # a64 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1bac:	f9843783          	ld	a5,-104(s0)
    1bb0:	57fc                	lw	a5,108(a5)
    1bb2:	c395                	beqz	a5,1bd6 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1bb4:	f9843783          	ld	a5,-104(s0)
    1bb8:	02878793          	addi	a5,a5,40
    1bbc:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1bc0:	f4042423          	sw	zero,-184(s0)
            return r;
    1bc4:	f4043783          	ld	a5,-192(s0)
    1bc8:	f4f43823          	sd	a5,-176(s0)
    1bcc:	f4843783          	ld	a5,-184(s0)
    1bd0:	f4f43c23          	sd	a5,-168(s0)
    1bd4:	a13d                	j	2002 <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1bd6:	4098                	lw	a4,0(s1)
    1bd8:	f9843783          	ld	a5,-104(s0)
    1bdc:	47fc                	lw	a5,76(a5)
    1bde:	9fb9                	addw	a5,a5,a4
    1be0:	0007871b          	sext.w	a4,a5
    1be4:	f9843783          	ld	a5,-104(s0)
    1be8:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1bea:	f9843783          	ld	a5,-104(s0)
    1bee:	53f8                	lw	a4,100(a5)
    1bf0:	f9843783          	ld	a5,-104(s0)
    1bf4:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1bf6:	f9843783          	ld	a5,-104(s0)
    1bfa:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1bfe:	fa043783          	ld	a5,-96(s0)
    1c02:	e7dd                	bnez	a5,1cb0 <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1c04:	649c                	ld	a5,8(s1)
    1c06:	639c                	ld	a5,0(a5)
    1c08:	f8f43823          	sd	a5,-112(s0)
    1c0c:	f9043783          	ld	a5,-112(s0)
    1c10:	fd878793          	addi	a5,a5,-40
    1c14:	faf43c23          	sd	a5,-72(s0)
    1c18:	a069                	j	1ca2 <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1c1a:	fb843783          	ld	a5,-72(s0)
    1c1e:	5fd8                	lw	a4,60(a5)
    1c20:	fb843783          	ld	a5,-72(s0)
    1c24:	5bbc                	lw	a5,112(a5)
    1c26:	863e                	mv	a2,a5
    1c28:	85ba                	mv	a1,a4
    1c2a:	00000517          	auipc	a0,0x0
    1c2e:	63650513          	addi	a0,a0,1590 # 2260 <schedule_edf_cbs+0x706>
    1c32:	fffff097          	auipc	ra,0xfffff
    1c36:	e32080e7          	jalr	-462(ra) # a64 <printf>
            if (next == NULL)
    1c3a:	fa043783          	ld	a5,-96(s0)
    1c3e:	e791                	bnez	a5,1c4a <schedule_edf_cbs+0xf0>
                next = th;
    1c40:	fb843783          	ld	a5,-72(s0)
    1c44:	faf43023          	sd	a5,-96(s0)
    1c48:	a091                	j	1c8c <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1c4a:	fb843783          	ld	a5,-72(s0)
    1c4e:	4fb8                	lw	a4,88(a5)
    1c50:	fa043783          	ld	a5,-96(s0)
    1c54:	4fbc                	lw	a5,88(a5)
    1c56:	00f75763          	bge	a4,a5,1c64 <schedule_edf_cbs+0x10a>
                next = th;
    1c5a:	fb843783          	ld	a5,-72(s0)
    1c5e:	faf43023          	sd	a5,-96(s0)
    1c62:	a02d                	j	1c8c <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1c64:	fb843783          	ld	a5,-72(s0)
    1c68:	4fb8                	lw	a4,88(a5)
    1c6a:	fa043783          	ld	a5,-96(s0)
    1c6e:	4fbc                	lw	a5,88(a5)
    1c70:	00f71e63          	bne	a4,a5,1c8c <schedule_edf_cbs+0x132>
    1c74:	fb843783          	ld	a5,-72(s0)
    1c78:	5fd8                	lw	a4,60(a5)
    1c7a:	fa043783          	ld	a5,-96(s0)
    1c7e:	5fdc                	lw	a5,60(a5)
    1c80:	00f75663          	bge	a4,a5,1c8c <schedule_edf_cbs+0x132>
                next = th;
    1c84:	fb843783          	ld	a5,-72(s0)
    1c88:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1c8c:	fb843783          	ld	a5,-72(s0)
    1c90:	779c                	ld	a5,40(a5)
    1c92:	f8f43423          	sd	a5,-120(s0)
    1c96:	f8843783          	ld	a5,-120(s0)
    1c9a:	fd878793          	addi	a5,a5,-40
    1c9e:	faf43c23          	sd	a5,-72(s0)
    1ca2:	fb843783          	ld	a5,-72(s0)
    1ca6:	02878713          	addi	a4,a5,40
    1caa:	649c                	ld	a5,8(s1)
    1cac:	f6f717e3          	bne	a4,a5,1c1a <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1cb0:	fa043783          	ld	a5,-96(s0)
    1cb4:	5fdc                	lw	a5,60(a5)
    1cb6:	85be                	mv	a1,a5
    1cb8:	00000517          	auipc	a0,0x0
    1cbc:	5e050513          	addi	a0,a0,1504 # 2298 <schedule_edf_cbs+0x73e>
    1cc0:	fffff097          	auipc	ra,0xfffff
    1cc4:	da4080e7          	jalr	-604(ra) # a64 <printf>

    if(next && next->cbs.is_throttled){
    1cc8:	fa043783          	ld	a5,-96(s0)
    1ccc:	cb95                	beqz	a5,1d00 <schedule_edf_cbs+0x1a6>
    1cce:	fa043783          	ld	a5,-96(s0)
    1cd2:	5bbc                	lw	a5,112(a5)
    1cd4:	c795                	beqz	a5,1d00 <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1cd6:	fa043783          	ld	a5,-96(s0)
    1cda:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1cde:	fa043783          	ld	a5,-96(s0)
    1ce2:	02878793          	addi	a5,a5,40
    1ce6:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1cea:	f4042423          	sw	zero,-184(s0)
        return r;
    1cee:	f4043783          	ld	a5,-192(s0)
    1cf2:	f4f43823          	sd	a5,-176(s0)
    1cf6:	f4843783          	ld	a5,-184(s0)
    1cfa:	f4f43c23          	sd	a5,-168(s0)
    1cfe:	a611                	j	2002 <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1d00:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d04:	689c                	ld	a5,16(s1)
    1d06:	639c                	ld	a5,0(a5)
    1d08:	f8f43023          	sd	a5,-128(s0)
    1d0c:	f8043783          	ld	a5,-128(s0)
    1d10:	17e1                	addi	a5,a5,-8
    1d12:	fcf43023          	sd	a5,-64(s0)
    1d16:	a0b5                	j	1d82 <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1d18:	fa843783          	ld	a5,-88(s0)
    1d1c:	e791                	bnez	a5,1d28 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1d1e:	fc043783          	ld	a5,-64(s0)
    1d22:	faf43423          	sd	a5,-88(s0)
    1d26:	a0a1                	j	1d6e <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1d28:	fa843783          	ld	a5,-88(s0)
    1d2c:	4f98                	lw	a4,24(a5)
    1d2e:	fc043783          	ld	a5,-64(s0)
    1d32:	4f9c                	lw	a5,24(a5)
    1d34:	00e7d763          	bge	a5,a4,1d42 <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1d38:	fc043783          	ld	a5,-64(s0)
    1d3c:	faf43423          	sd	a5,-88(s0)
    1d40:	a03d                	j	1d6e <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1d42:	fa843783          	ld	a5,-88(s0)
    1d46:	4f98                	lw	a4,24(a5)
    1d48:	fc043783          	ld	a5,-64(s0)
    1d4c:	4f9c                	lw	a5,24(a5)
    1d4e:	02f71063          	bne	a4,a5,1d6e <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1d52:	fa843783          	ld	a5,-88(s0)
    1d56:	639c                	ld	a5,0(a5)
    1d58:	4fb8                	lw	a4,88(a5)
    1d5a:	fc043783          	ld	a5,-64(s0)
    1d5e:	639c                	ld	a5,0(a5)
    1d60:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1d62:	00e7d663          	bge	a5,a4,1d6e <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1d66:	fc043783          	ld	a5,-64(s0)
    1d6a:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d6e:	fc043783          	ld	a5,-64(s0)
    1d72:	679c                	ld	a5,8(a5)
    1d74:	f6f43023          	sd	a5,-160(s0)
    1d78:	f6043783          	ld	a5,-160(s0)
    1d7c:	17e1                	addi	a5,a5,-8
    1d7e:	fcf43023          	sd	a5,-64(s0)
    1d82:	fc043783          	ld	a5,-64(s0)
    1d86:	00878713          	addi	a4,a5,8
    1d8a:	689c                	ld	a5,16(s1)
    1d8c:	f8f716e3          	bne	a4,a5,1d18 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1d90:	689c                	ld	a5,16(s1)
    1d92:	639c                	ld	a5,0(a5)
    1d94:	f6f43c23          	sd	a5,-136(s0)
    1d98:	f7843783          	ld	a5,-136(s0)
    1d9c:	17e1                	addi	a5,a5,-8
    1d9e:	fcf43023          	sd	a5,-64(s0)
    1da2:	a069                	j	1e2c <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1da4:	fb043783          	ld	a5,-80(s0)
    1da8:	eb99                	bnez	a5,1dbe <schedule_edf_cbs+0x264>
    1daa:	fc043783          	ld	a5,-64(s0)
    1dae:	639c                	ld	a5,0(a5)
    1db0:	57fc                	lw	a5,108(a5)
    1db2:	c791                	beqz	a5,1dbe <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1db4:	fc043783          	ld	a5,-64(s0)
    1db8:	faf43823          	sd	a5,-80(s0)
    1dbc:	a8b1                	j	1e18 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1dbe:	fc043783          	ld	a5,-64(s0)
    1dc2:	639c                	ld	a5,0(a5)
    1dc4:	57fc                	lw	a5,108(a5)
    1dc6:	cf91                	beqz	a5,1de2 <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1dc8:	fb043783          	ld	a5,-80(s0)
    1dcc:	4f98                	lw	a4,24(a5)
    1dce:	fc043783          	ld	a5,-64(s0)
    1dd2:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1dd4:	00e7d763          	bge	a5,a4,1de2 <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1dd8:	fc043783          	ld	a5,-64(s0)
    1ddc:	faf43823          	sd	a5,-80(s0)
    1de0:	a825                	j	1e18 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1de2:	fc043783          	ld	a5,-64(s0)
    1de6:	639c                	ld	a5,0(a5)
    1de8:	57fc                	lw	a5,108(a5)
    1dea:	c79d                	beqz	a5,1e18 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1dec:	fb043783          	ld	a5,-80(s0)
    1df0:	4f98                	lw	a4,24(a5)
    1df2:	fc043783          	ld	a5,-64(s0)
    1df6:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1df8:	02f71063          	bne	a4,a5,1e18 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1dfc:	fb043783          	ld	a5,-80(s0)
    1e00:	639c                	ld	a5,0(a5)
    1e02:	4fb8                	lw	a4,88(a5)
    1e04:	fc043783          	ld	a5,-64(s0)
    1e08:	639c                	ld	a5,0(a5)
    1e0a:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1e0c:	00e7d663          	bge	a5,a4,1e18 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1e10:	fc043783          	ld	a5,-64(s0)
    1e14:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1e18:	fc043783          	ld	a5,-64(s0)
    1e1c:	679c                	ld	a5,8(a5)
    1e1e:	f6f43423          	sd	a5,-152(s0)
    1e22:	f6843783          	ld	a5,-152(s0)
    1e26:	17e1                	addi	a5,a5,-8
    1e28:	fcf43023          	sd	a5,-64(s0)
    1e2c:	fc043783          	ld	a5,-64(s0)
    1e30:	00878713          	addi	a4,a5,8
    1e34:	689c                	ld	a5,16(s1)
    1e36:	f6f717e3          	bne	a4,a5,1da4 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1e3a:	fa043783          	ld	a5,-96(s0)
    1e3e:	cb89                	beqz	a5,1e50 <schedule_edf_cbs+0x2f6>
    1e40:	fa043783          	ld	a5,-96(s0)
    1e44:	57fc                	lw	a5,108(a5)
    1e46:	c789                	beqz	a5,1e50 <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1e48:	fb043783          	ld	a5,-80(s0)
    1e4c:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1e50:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1e54:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1e58:	fa843783          	ld	a5,-88(s0)
    1e5c:	c3c5                	beqz	a5,1efc <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1e5e:	fa843783          	ld	a5,-88(s0)
    1e62:	639c                	ld	a5,0(a5)
    1e64:	5fdc                	lw	a5,60(a5)
    1e66:	85be                	mv	a1,a5
    1e68:	00000517          	auipc	a0,0x0
    1e6c:	45050513          	addi	a0,a0,1104 # 22b8 <schedule_edf_cbs+0x75e>
    1e70:	fffff097          	auipc	ra,0xfffff
    1e74:	bf4080e7          	jalr	-1036(ra) # a64 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    1e78:	fa843783          	ld	a5,-88(s0)
    1e7c:	4f98                	lw	a4,24(a5)
    1e7e:	409c                	lw	a5,0(s1)
    1e80:	40f707bb          	subw	a5,a4,a5
    1e84:	fcf42623          	sw	a5,-52(s0)
        if (next){
    1e88:	fa043783          	ld	a5,-96(s0)
    1e8c:	cba5                	beqz	a5,1efc <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    1e8e:	fa043783          	ld	a5,-96(s0)
    1e92:	4bf8                	lw	a4,84(a5)
    1e94:	fcc42783          	lw	a5,-52(s0)
    1e98:	2781                	sext.w	a5,a5
    1e9a:	06e7d163          	bge	a5,a4,1efc <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    1e9e:	fa043783          	ld	a5,-96(s0)
    1ea2:	57fc                	lw	a5,108(a5)
    1ea4:	eb91                	bnez	a5,1eb8 <schedule_edf_cbs+0x35e>
    1ea6:	fa843783          	ld	a5,-88(s0)
    1eaa:	639c                	ld	a5,0(a5)
    1eac:	57fc                	lw	a5,108(a5)
    1eae:	c789                	beqz	a5,1eb8 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    1eb0:	4785                	li	a5,1
    1eb2:	fcf42423          	sw	a5,-56(s0)
    1eb6:	a099                	j	1efc <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    1eb8:	fa043783          	ld	a5,-96(s0)
    1ebc:	4fb8                	lw	a4,88(a5)
    1ebe:	fa843783          	ld	a5,-88(s0)
    1ec2:	639c                	ld	a5,0(a5)
    1ec4:	4fbc                	lw	a5,88(a5)
    1ec6:	00e7d663          	bge	a5,a4,1ed2 <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    1eca:	4785                	li	a5,1
    1ecc:	fcf42423          	sw	a5,-56(s0)
    1ed0:	a035                	j	1efc <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1ed2:	fa043783          	ld	a5,-96(s0)
    1ed6:	4fb8                	lw	a4,88(a5)
    1ed8:	fa843783          	ld	a5,-88(s0)
    1edc:	639c                	ld	a5,0(a5)
    1ede:	4fbc                	lw	a5,88(a5)
    1ee0:	00f71e63          	bne	a4,a5,1efc <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    1ee4:	fa043783          	ld	a5,-96(s0)
    1ee8:	5fd8                	lw	a4,60(a5)
    1eea:	fa843783          	ld	a5,-88(s0)
    1eee:	639c                	ld	a5,0(a5)
    1ef0:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1ef2:	00e7d563          	bge	a5,a4,1efc <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    1ef6:	4785                	li	a5,1
    1ef8:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    1efc:	fa043783          	ld	a5,-96(s0)
    1f00:	cbd1                	beqz	a5,1f94 <schedule_edf_cbs+0x43a>
    1f02:	fa043783          	ld	a5,-96(s0)
    1f06:	57fc                	lw	a5,108(a5)
    1f08:	e7d1                	bnez	a5,1f94 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    1f0a:	fa043783          	ld	a5,-96(s0)
    1f0e:	4fb8                	lw	a4,88(a5)
    1f10:	409c                	lw	a5,0(s1)
    1f12:	40f707bb          	subw	a5,a4,a5
    1f16:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    1f1a:	fa043783          	ld	a5,-96(s0)
    1f1e:	47f8                	lw	a4,76(a5)
    1f20:	fa043783          	ld	a5,-96(s0)
    1f24:	57bc                	lw	a5,104(a5)
    1f26:	02f707bb          	mulw	a5,a4,a5
    1f2a:	0007869b          	sext.w	a3,a5
    1f2e:	fa043783          	ld	a5,-96(s0)
    1f32:	53fc                	lw	a5,100(a5)
    1f34:	f7442703          	lw	a4,-140(s0)
    1f38:	02f707bb          	mulw	a5,a4,a5
    1f3c:	2781                	sext.w	a5,a5
    1f3e:	8736                	mv	a4,a3
    1f40:	02e7d263          	bge	a5,a4,1f64 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    1f44:	4098                	lw	a4,0(s1)
    1f46:	fa043783          	ld	a5,-96(s0)
    1f4a:	47fc                	lw	a5,76(a5)
    1f4c:	9fb9                	addw	a5,a5,a4
    1f4e:	0007871b          	sext.w	a4,a5
    1f52:	fa043783          	ld	a5,-96(s0)
    1f56:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    1f58:	fa043783          	ld	a5,-96(s0)
    1f5c:	53f8                	lw	a4,100(a5)
    1f5e:	fa043783          	ld	a5,-96(s0)
    1f62:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    1f64:	fa043783          	ld	a5,-96(s0)
    1f68:	4bf8                	lw	a4,84(a5)
    1f6a:	fa043783          	ld	a5,-96(s0)
    1f6e:	57bc                	lw	a5,104(a5)
    1f70:	02e7d263          	bge	a5,a4,1f94 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    1f74:	fa043783          	ld	a5,-96(s0)
    1f78:	4705                	li	a4,1
    1f7a:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    1f7c:	fa043783          	ld	a5,-96(s0)
    1f80:	4fb8                	lw	a4,88(a5)
    1f82:	fa043783          	ld	a5,-96(s0)
    1f86:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    1f88:	fa043783          	ld	a5,-96(s0)
    1f8c:	4bf8                	lw	a4,84(a5)
    1f8e:	fa043783          	ld	a5,-96(s0)
    1f92:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    1f94:	fa043783          	ld	a5,-96(s0)
    1f98:	c3a9                	beqz	a5,1fda <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    1f9a:	fa043783          	ld	a5,-96(s0)
    1f9e:	02878793          	addi	a5,a5,40
    1fa2:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    1fa6:	fa843783          	ld	a5,-88(s0)
    1faa:	cb91                	beqz	a5,1fbe <schedule_edf_cbs+0x464>
    1fac:	fc842783          	lw	a5,-56(s0)
    1fb0:	2781                	sext.w	a5,a5
    1fb2:	c791                	beqz	a5,1fbe <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    1fb4:	fcc42783          	lw	a5,-52(s0)
    1fb8:	f4f42423          	sw	a5,-184(s0)
    1fbc:	a81d                	j	1ff2 <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    1fbe:	fa043783          	ld	a5,-96(s0)
    1fc2:	5bbc                	lw	a5,112(a5)
    1fc4:	c789                	beqz	a5,1fce <schedule_edf_cbs+0x474>
    1fc6:	fa043783          	ld	a5,-96(s0)
    1fca:	57bc                	lw	a5,104(a5)
    1fcc:	a021                	j	1fd4 <schedule_edf_cbs+0x47a>
    1fce:	fa043783          	ld	a5,-96(s0)
    1fd2:	4bfc                	lw	a5,84(a5)
    1fd4:	f4f42423          	sw	a5,-184(s0)
    1fd8:	a829                	j	1ff2 <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1fda:	649c                	ld	a5,8(s1)
    1fdc:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    1fe0:	fa843783          	ld	a5,-88(s0)
    1fe4:	c781                	beqz	a5,1fec <schedule_edf_cbs+0x492>
    1fe6:	fcc42783          	lw	a5,-52(s0)
    1fea:	a011                	j	1fee <schedule_edf_cbs+0x494>
    1fec:	4785                	li	a5,1
    1fee:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    1ff2:	f4043783          	ld	a5,-192(s0)
    1ff6:	f4f43823          	sd	a5,-176(s0)
    1ffa:	f4843783          	ld	a5,-184(s0)
    1ffe:	f4f43c23          	sd	a5,-168(s0)
    2002:	4701                	li	a4,0
    2004:	f5043703          	ld	a4,-176(s0)
    2008:	4781                	li	a5,0
    200a:	f5843783          	ld	a5,-168(s0)
    200e:	893a                	mv	s2,a4
    2010:	89be                	mv	s3,a5
    2012:	874a                	mv	a4,s2
    2014:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    2016:	853a                	mv	a0,a4
    2018:	85be                	mv	a1,a5
    201a:	70ea                	ld	ra,184(sp)
    201c:	744a                	ld	s0,176(sp)
    201e:	74aa                	ld	s1,168(sp)
    2020:	790a                	ld	s2,160(sp)
    2022:	69ea                	ld	s3,152(sp)
    2024:	6129                	addi	sp,sp,192
    2026:	8082                	ret
