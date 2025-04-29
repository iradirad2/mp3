
user/_wc:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	0080                	addi	s0,sp,64
       8:	87aa                	mv	a5,a0
       a:	fcb43023          	sd	a1,-64(s0)
       e:	fcf42623          	sw	a5,-52(s0)
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
      12:	fe042023          	sw	zero,-32(s0)
      16:	fe042783          	lw	a5,-32(s0)
      1a:	fef42223          	sw	a5,-28(s0)
      1e:	fe442783          	lw	a5,-28(s0)
      22:	fef42423          	sw	a5,-24(s0)
  inword = 0;
      26:	fc042e23          	sw	zero,-36(s0)
  while((n = read(fd, buf, sizeof(buf))) > 0){
      2a:	a859                	j	c0 <wc+0xc0>
    for(i=0; i<n; i++){
      2c:	fe042623          	sw	zero,-20(s0)
      30:	a041                	j	b0 <wc+0xb0>
      c++;
      32:	fe042783          	lw	a5,-32(s0)
      36:	2785                	addiw	a5,a5,1
      38:	fef42023          	sw	a5,-32(s0)
      if(buf[i] == '\n')
      3c:	00002717          	auipc	a4,0x2
      40:	49470713          	addi	a4,a4,1172 # 24d0 <buf>
      44:	fec42783          	lw	a5,-20(s0)
      48:	97ba                	add	a5,a5,a4
      4a:	0007c783          	lbu	a5,0(a5)
      4e:	873e                	mv	a4,a5
      50:	47a9                	li	a5,10
      52:	00f71763          	bne	a4,a5,60 <wc+0x60>
        l++;
      56:	fe842783          	lw	a5,-24(s0)
      5a:	2785                	addiw	a5,a5,1
      5c:	fef42423          	sw	a5,-24(s0)
      if(strchr(" \r\t\n\v", buf[i]))
      60:	00002717          	auipc	a4,0x2
      64:	47070713          	addi	a4,a4,1136 # 24d0 <buf>
      68:	fec42783          	lw	a5,-20(s0)
      6c:	97ba                	add	a5,a5,a4
      6e:	0007c783          	lbu	a5,0(a5)
      72:	85be                	mv	a1,a5
      74:	00002517          	auipc	a0,0x2
      78:	14c50513          	addi	a0,a0,332 # 21c0 <schedule_edf_cbs+0x4d2>
      7c:	00000097          	auipc	ra,0x0
      80:	2ec080e7          	jalr	748(ra) # 368 <strchr>
      84:	87aa                	mv	a5,a0
      86:	c781                	beqz	a5,8e <wc+0x8e>
        inword = 0;
      88:	fc042e23          	sw	zero,-36(s0)
      8c:	a829                	j	a6 <wc+0xa6>
      else if(!inword){
      8e:	fdc42783          	lw	a5,-36(s0)
      92:	2781                	sext.w	a5,a5
      94:	eb89                	bnez	a5,a6 <wc+0xa6>
        w++;
      96:	fe442783          	lw	a5,-28(s0)
      9a:	2785                	addiw	a5,a5,1
      9c:	fef42223          	sw	a5,-28(s0)
        inword = 1;
      a0:	4785                	li	a5,1
      a2:	fcf42e23          	sw	a5,-36(s0)
    for(i=0; i<n; i++){
      a6:	fec42783          	lw	a5,-20(s0)
      aa:	2785                	addiw	a5,a5,1
      ac:	fef42623          	sw	a5,-20(s0)
      b0:	fec42703          	lw	a4,-20(s0)
      b4:	fd842783          	lw	a5,-40(s0)
      b8:	2701                	sext.w	a4,a4
      ba:	2781                	sext.w	a5,a5
      bc:	f6f74be3          	blt	a4,a5,32 <wc+0x32>
  while((n = read(fd, buf, sizeof(buf))) > 0){
      c0:	fcc42783          	lw	a5,-52(s0)
      c4:	20000613          	li	a2,512
      c8:	00002597          	auipc	a1,0x2
      cc:	40858593          	addi	a1,a1,1032 # 24d0 <buf>
      d0:	853e                	mv	a0,a5
      d2:	00000097          	auipc	ra,0x0
      d6:	5f8080e7          	jalr	1528(ra) # 6ca <read>
      da:	87aa                	mv	a5,a0
      dc:	fcf42c23          	sw	a5,-40(s0)
      e0:	fd842783          	lw	a5,-40(s0)
      e4:	2781                	sext.w	a5,a5
      e6:	f4f043e3          	bgtz	a5,2c <wc+0x2c>
      }
    }
  }
  if(n < 0){
      ea:	fd842783          	lw	a5,-40(s0)
      ee:	2781                	sext.w	a5,a5
      f0:	0007df63          	bgez	a5,10e <wc+0x10e>
    printf("wc: read error\n");
      f4:	00002517          	auipc	a0,0x2
      f8:	0d450513          	addi	a0,a0,212 # 21c8 <schedule_edf_cbs+0x4da>
      fc:	00001097          	auipc	ra,0x1
     100:	afc080e7          	jalr	-1284(ra) # bf8 <printf>
    exit(1);
     104:	4505                	li	a0,1
     106:	00000097          	auipc	ra,0x0
     10a:	5ac080e7          	jalr	1452(ra) # 6b2 <exit>
  }
  printf("%d %d %d %s\n", l, w, c, name);
     10e:	fe042683          	lw	a3,-32(s0)
     112:	fe442603          	lw	a2,-28(s0)
     116:	fe842783          	lw	a5,-24(s0)
     11a:	fc043703          	ld	a4,-64(s0)
     11e:	85be                	mv	a1,a5
     120:	00002517          	auipc	a0,0x2
     124:	0b850513          	addi	a0,a0,184 # 21d8 <schedule_edf_cbs+0x4ea>
     128:	00001097          	auipc	ra,0x1
     12c:	ad0080e7          	jalr	-1328(ra) # bf8 <printf>
}
     130:	0001                	nop
     132:	70e2                	ld	ra,56(sp)
     134:	7442                	ld	s0,48(sp)
     136:	6121                	addi	sp,sp,64
     138:	8082                	ret

000000000000013a <main>:

int
main(int argc, char *argv[])
{
     13a:	7179                	addi	sp,sp,-48
     13c:	f406                	sd	ra,40(sp)
     13e:	f022                	sd	s0,32(sp)
     140:	1800                	addi	s0,sp,48
     142:	87aa                	mv	a5,a0
     144:	fcb43823          	sd	a1,-48(s0)
     148:	fcf42e23          	sw	a5,-36(s0)
  int fd, i;

  if(argc <= 1){
     14c:	fdc42783          	lw	a5,-36(s0)
     150:	0007871b          	sext.w	a4,a5
     154:	4785                	li	a5,1
     156:	02e7c063          	blt	a5,a4,176 <main+0x3c>
    wc(0, "");
     15a:	00002597          	auipc	a1,0x2
     15e:	08e58593          	addi	a1,a1,142 # 21e8 <schedule_edf_cbs+0x4fa>
     162:	4501                	li	a0,0
     164:	00000097          	auipc	ra,0x0
     168:	e9c080e7          	jalr	-356(ra) # 0 <wc>
    exit(0);
     16c:	4501                	li	a0,0
     16e:	00000097          	auipc	ra,0x0
     172:	544080e7          	jalr	1348(ra) # 6b2 <exit>
  }

  for(i = 1; i < argc; i++){
     176:	4785                	li	a5,1
     178:	fef42623          	sw	a5,-20(s0)
     17c:	a071                	j	208 <main+0xce>
    if((fd = open(argv[i], 0)) < 0){
     17e:	fec42783          	lw	a5,-20(s0)
     182:	078e                	slli	a5,a5,0x3
     184:	fd043703          	ld	a4,-48(s0)
     188:	97ba                	add	a5,a5,a4
     18a:	639c                	ld	a5,0(a5)
     18c:	4581                	li	a1,0
     18e:	853e                	mv	a0,a5
     190:	00000097          	auipc	ra,0x0
     194:	562080e7          	jalr	1378(ra) # 6f2 <open>
     198:	87aa                	mv	a5,a0
     19a:	fef42423          	sw	a5,-24(s0)
     19e:	fe842783          	lw	a5,-24(s0)
     1a2:	2781                	sext.w	a5,a5
     1a4:	0207d763          	bgez	a5,1d2 <main+0x98>
      printf("wc: cannot open %s\n", argv[i]);
     1a8:	fec42783          	lw	a5,-20(s0)
     1ac:	078e                	slli	a5,a5,0x3
     1ae:	fd043703          	ld	a4,-48(s0)
     1b2:	97ba                	add	a5,a5,a4
     1b4:	639c                	ld	a5,0(a5)
     1b6:	85be                	mv	a1,a5
     1b8:	00002517          	auipc	a0,0x2
     1bc:	03850513          	addi	a0,a0,56 # 21f0 <schedule_edf_cbs+0x502>
     1c0:	00001097          	auipc	ra,0x1
     1c4:	a38080e7          	jalr	-1480(ra) # bf8 <printf>
      exit(1);
     1c8:	4505                	li	a0,1
     1ca:	00000097          	auipc	ra,0x0
     1ce:	4e8080e7          	jalr	1256(ra) # 6b2 <exit>
    }
    wc(fd, argv[i]);
     1d2:	fec42783          	lw	a5,-20(s0)
     1d6:	078e                	slli	a5,a5,0x3
     1d8:	fd043703          	ld	a4,-48(s0)
     1dc:	97ba                	add	a5,a5,a4
     1de:	6398                	ld	a4,0(a5)
     1e0:	fe842783          	lw	a5,-24(s0)
     1e4:	85ba                	mv	a1,a4
     1e6:	853e                	mv	a0,a5
     1e8:	00000097          	auipc	ra,0x0
     1ec:	e18080e7          	jalr	-488(ra) # 0 <wc>
    close(fd);
     1f0:	fe842783          	lw	a5,-24(s0)
     1f4:	853e                	mv	a0,a5
     1f6:	00000097          	auipc	ra,0x0
     1fa:	4e4080e7          	jalr	1252(ra) # 6da <close>
  for(i = 1; i < argc; i++){
     1fe:	fec42783          	lw	a5,-20(s0)
     202:	2785                	addiw	a5,a5,1
     204:	fef42623          	sw	a5,-20(s0)
     208:	fec42703          	lw	a4,-20(s0)
     20c:	fdc42783          	lw	a5,-36(s0)
     210:	2701                	sext.w	a4,a4
     212:	2781                	sext.w	a5,a5
     214:	f6f745e3          	blt	a4,a5,17e <main+0x44>
  }
  exit(0);
     218:	4501                	li	a0,0
     21a:	00000097          	auipc	ra,0x0
     21e:	498080e7          	jalr	1176(ra) # 6b2 <exit>

0000000000000222 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     222:	7179                	addi	sp,sp,-48
     224:	f422                	sd	s0,40(sp)
     226:	1800                	addi	s0,sp,48
     228:	fca43c23          	sd	a0,-40(s0)
     22c:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     230:	fd843783          	ld	a5,-40(s0)
     234:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     238:	0001                	nop
     23a:	fd043703          	ld	a4,-48(s0)
     23e:	00170793          	addi	a5,a4,1
     242:	fcf43823          	sd	a5,-48(s0)
     246:	fd843783          	ld	a5,-40(s0)
     24a:	00178693          	addi	a3,a5,1
     24e:	fcd43c23          	sd	a3,-40(s0)
     252:	00074703          	lbu	a4,0(a4)
     256:	00e78023          	sb	a4,0(a5)
     25a:	0007c783          	lbu	a5,0(a5)
     25e:	fff1                	bnez	a5,23a <strcpy+0x18>
    ;
  return os;
     260:	fe843783          	ld	a5,-24(s0)
}
     264:	853e                	mv	a0,a5
     266:	7422                	ld	s0,40(sp)
     268:	6145                	addi	sp,sp,48
     26a:	8082                	ret

000000000000026c <strcmp>:

int
strcmp(const char *p, const char *q)
{
     26c:	1101                	addi	sp,sp,-32
     26e:	ec22                	sd	s0,24(sp)
     270:	1000                	addi	s0,sp,32
     272:	fea43423          	sd	a0,-24(s0)
     276:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     27a:	a819                	j	290 <strcmp+0x24>
    p++, q++;
     27c:	fe843783          	ld	a5,-24(s0)
     280:	0785                	addi	a5,a5,1
     282:	fef43423          	sd	a5,-24(s0)
     286:	fe043783          	ld	a5,-32(s0)
     28a:	0785                	addi	a5,a5,1
     28c:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     290:	fe843783          	ld	a5,-24(s0)
     294:	0007c783          	lbu	a5,0(a5)
     298:	cb99                	beqz	a5,2ae <strcmp+0x42>
     29a:	fe843783          	ld	a5,-24(s0)
     29e:	0007c703          	lbu	a4,0(a5)
     2a2:	fe043783          	ld	a5,-32(s0)
     2a6:	0007c783          	lbu	a5,0(a5)
     2aa:	fcf709e3          	beq	a4,a5,27c <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     2ae:	fe843783          	ld	a5,-24(s0)
     2b2:	0007c783          	lbu	a5,0(a5)
     2b6:	0007871b          	sext.w	a4,a5
     2ba:	fe043783          	ld	a5,-32(s0)
     2be:	0007c783          	lbu	a5,0(a5)
     2c2:	2781                	sext.w	a5,a5
     2c4:	40f707bb          	subw	a5,a4,a5
     2c8:	2781                	sext.w	a5,a5
}
     2ca:	853e                	mv	a0,a5
     2cc:	6462                	ld	s0,24(sp)
     2ce:	6105                	addi	sp,sp,32
     2d0:	8082                	ret

00000000000002d2 <strlen>:

uint
strlen(const char *s)
{
     2d2:	7179                	addi	sp,sp,-48
     2d4:	f422                	sd	s0,40(sp)
     2d6:	1800                	addi	s0,sp,48
     2d8:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     2dc:	fe042623          	sw	zero,-20(s0)
     2e0:	a031                	j	2ec <strlen+0x1a>
     2e2:	fec42783          	lw	a5,-20(s0)
     2e6:	2785                	addiw	a5,a5,1
     2e8:	fef42623          	sw	a5,-20(s0)
     2ec:	fec42783          	lw	a5,-20(s0)
     2f0:	fd843703          	ld	a4,-40(s0)
     2f4:	97ba                	add	a5,a5,a4
     2f6:	0007c783          	lbu	a5,0(a5)
     2fa:	f7e5                	bnez	a5,2e2 <strlen+0x10>
    ;
  return n;
     2fc:	fec42783          	lw	a5,-20(s0)
}
     300:	853e                	mv	a0,a5
     302:	7422                	ld	s0,40(sp)
     304:	6145                	addi	sp,sp,48
     306:	8082                	ret

0000000000000308 <memset>:

void*
memset(void *dst, int c, uint n)
{
     308:	7179                	addi	sp,sp,-48
     30a:	f422                	sd	s0,40(sp)
     30c:	1800                	addi	s0,sp,48
     30e:	fca43c23          	sd	a0,-40(s0)
     312:	87ae                	mv	a5,a1
     314:	8732                	mv	a4,a2
     316:	fcf42a23          	sw	a5,-44(s0)
     31a:	87ba                	mv	a5,a4
     31c:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     320:	fd843783          	ld	a5,-40(s0)
     324:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     328:	fe042623          	sw	zero,-20(s0)
     32c:	a00d                	j	34e <memset+0x46>
    cdst[i] = c;
     32e:	fec42783          	lw	a5,-20(s0)
     332:	fe043703          	ld	a4,-32(s0)
     336:	97ba                	add	a5,a5,a4
     338:	fd442703          	lw	a4,-44(s0)
     33c:	0ff77713          	andi	a4,a4,255
     340:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     344:	fec42783          	lw	a5,-20(s0)
     348:	2785                	addiw	a5,a5,1
     34a:	fef42623          	sw	a5,-20(s0)
     34e:	fec42703          	lw	a4,-20(s0)
     352:	fd042783          	lw	a5,-48(s0)
     356:	2781                	sext.w	a5,a5
     358:	fcf76be3          	bltu	a4,a5,32e <memset+0x26>
  }
  return dst;
     35c:	fd843783          	ld	a5,-40(s0)
}
     360:	853e                	mv	a0,a5
     362:	7422                	ld	s0,40(sp)
     364:	6145                	addi	sp,sp,48
     366:	8082                	ret

0000000000000368 <strchr>:

char*
strchr(const char *s, char c)
{
     368:	1101                	addi	sp,sp,-32
     36a:	ec22                	sd	s0,24(sp)
     36c:	1000                	addi	s0,sp,32
     36e:	fea43423          	sd	a0,-24(s0)
     372:	87ae                	mv	a5,a1
     374:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     378:	a01d                	j	39e <strchr+0x36>
    if(*s == c)
     37a:	fe843783          	ld	a5,-24(s0)
     37e:	0007c703          	lbu	a4,0(a5)
     382:	fe744783          	lbu	a5,-25(s0)
     386:	0ff7f793          	andi	a5,a5,255
     38a:	00e79563          	bne	a5,a4,394 <strchr+0x2c>
      return (char*)s;
     38e:	fe843783          	ld	a5,-24(s0)
     392:	a821                	j	3aa <strchr+0x42>
  for(; *s; s++)
     394:	fe843783          	ld	a5,-24(s0)
     398:	0785                	addi	a5,a5,1
     39a:	fef43423          	sd	a5,-24(s0)
     39e:	fe843783          	ld	a5,-24(s0)
     3a2:	0007c783          	lbu	a5,0(a5)
     3a6:	fbf1                	bnez	a5,37a <strchr+0x12>
  return 0;
     3a8:	4781                	li	a5,0
}
     3aa:	853e                	mv	a0,a5
     3ac:	6462                	ld	s0,24(sp)
     3ae:	6105                	addi	sp,sp,32
     3b0:	8082                	ret

00000000000003b2 <gets>:

char*
gets(char *buf, int max)
{
     3b2:	7179                	addi	sp,sp,-48
     3b4:	f406                	sd	ra,40(sp)
     3b6:	f022                	sd	s0,32(sp)
     3b8:	1800                	addi	s0,sp,48
     3ba:	fca43c23          	sd	a0,-40(s0)
     3be:	87ae                	mv	a5,a1
     3c0:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     3c4:	fe042623          	sw	zero,-20(s0)
     3c8:	a8a1                	j	420 <gets+0x6e>
    cc = read(0, &c, 1);
     3ca:	fe740793          	addi	a5,s0,-25
     3ce:	4605                	li	a2,1
     3d0:	85be                	mv	a1,a5
     3d2:	4501                	li	a0,0
     3d4:	00000097          	auipc	ra,0x0
     3d8:	2f6080e7          	jalr	758(ra) # 6ca <read>
     3dc:	87aa                	mv	a5,a0
     3de:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     3e2:	fe842783          	lw	a5,-24(s0)
     3e6:	2781                	sext.w	a5,a5
     3e8:	04f05763          	blez	a5,436 <gets+0x84>
      break;
    buf[i++] = c;
     3ec:	fec42783          	lw	a5,-20(s0)
     3f0:	0017871b          	addiw	a4,a5,1
     3f4:	fee42623          	sw	a4,-20(s0)
     3f8:	873e                	mv	a4,a5
     3fa:	fd843783          	ld	a5,-40(s0)
     3fe:	97ba                	add	a5,a5,a4
     400:	fe744703          	lbu	a4,-25(s0)
     404:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     408:	fe744783          	lbu	a5,-25(s0)
     40c:	873e                	mv	a4,a5
     40e:	47a9                	li	a5,10
     410:	02f70463          	beq	a4,a5,438 <gets+0x86>
     414:	fe744783          	lbu	a5,-25(s0)
     418:	873e                	mv	a4,a5
     41a:	47b5                	li	a5,13
     41c:	00f70e63          	beq	a4,a5,438 <gets+0x86>
  for(i=0; i+1 < max; ){
     420:	fec42783          	lw	a5,-20(s0)
     424:	2785                	addiw	a5,a5,1
     426:	0007871b          	sext.w	a4,a5
     42a:	fd442783          	lw	a5,-44(s0)
     42e:	2781                	sext.w	a5,a5
     430:	f8f74de3          	blt	a4,a5,3ca <gets+0x18>
     434:	a011                	j	438 <gets+0x86>
      break;
     436:	0001                	nop
      break;
  }
  buf[i] = '\0';
     438:	fec42783          	lw	a5,-20(s0)
     43c:	fd843703          	ld	a4,-40(s0)
     440:	97ba                	add	a5,a5,a4
     442:	00078023          	sb	zero,0(a5)
  return buf;
     446:	fd843783          	ld	a5,-40(s0)
}
     44a:	853e                	mv	a0,a5
     44c:	70a2                	ld	ra,40(sp)
     44e:	7402                	ld	s0,32(sp)
     450:	6145                	addi	sp,sp,48
     452:	8082                	ret

0000000000000454 <stat>:

int
stat(const char *n, struct stat *st)
{
     454:	7179                	addi	sp,sp,-48
     456:	f406                	sd	ra,40(sp)
     458:	f022                	sd	s0,32(sp)
     45a:	1800                	addi	s0,sp,48
     45c:	fca43c23          	sd	a0,-40(s0)
     460:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     464:	4581                	li	a1,0
     466:	fd843503          	ld	a0,-40(s0)
     46a:	00000097          	auipc	ra,0x0
     46e:	288080e7          	jalr	648(ra) # 6f2 <open>
     472:	87aa                	mv	a5,a0
     474:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     478:	fec42783          	lw	a5,-20(s0)
     47c:	2781                	sext.w	a5,a5
     47e:	0007d463          	bgez	a5,486 <stat+0x32>
    return -1;
     482:	57fd                	li	a5,-1
     484:	a035                	j	4b0 <stat+0x5c>
  r = fstat(fd, st);
     486:	fec42783          	lw	a5,-20(s0)
     48a:	fd043583          	ld	a1,-48(s0)
     48e:	853e                	mv	a0,a5
     490:	00000097          	auipc	ra,0x0
     494:	27a080e7          	jalr	634(ra) # 70a <fstat>
     498:	87aa                	mv	a5,a0
     49a:	fef42423          	sw	a5,-24(s0)
  close(fd);
     49e:	fec42783          	lw	a5,-20(s0)
     4a2:	853e                	mv	a0,a5
     4a4:	00000097          	auipc	ra,0x0
     4a8:	236080e7          	jalr	566(ra) # 6da <close>
  return r;
     4ac:	fe842783          	lw	a5,-24(s0)
}
     4b0:	853e                	mv	a0,a5
     4b2:	70a2                	ld	ra,40(sp)
     4b4:	7402                	ld	s0,32(sp)
     4b6:	6145                	addi	sp,sp,48
     4b8:	8082                	ret

00000000000004ba <atoi>:

int
atoi(const char *s)
{
     4ba:	7179                	addi	sp,sp,-48
     4bc:	f422                	sd	s0,40(sp)
     4be:	1800                	addi	s0,sp,48
     4c0:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     4c4:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     4c8:	a815                	j	4fc <atoi+0x42>
    n = n*10 + *s++ - '0';
     4ca:	fec42703          	lw	a4,-20(s0)
     4ce:	87ba                	mv	a5,a4
     4d0:	0027979b          	slliw	a5,a5,0x2
     4d4:	9fb9                	addw	a5,a5,a4
     4d6:	0017979b          	slliw	a5,a5,0x1
     4da:	0007871b          	sext.w	a4,a5
     4de:	fd843783          	ld	a5,-40(s0)
     4e2:	00178693          	addi	a3,a5,1
     4e6:	fcd43c23          	sd	a3,-40(s0)
     4ea:	0007c783          	lbu	a5,0(a5)
     4ee:	2781                	sext.w	a5,a5
     4f0:	9fb9                	addw	a5,a5,a4
     4f2:	2781                	sext.w	a5,a5
     4f4:	fd07879b          	addiw	a5,a5,-48
     4f8:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     4fc:	fd843783          	ld	a5,-40(s0)
     500:	0007c783          	lbu	a5,0(a5)
     504:	873e                	mv	a4,a5
     506:	02f00793          	li	a5,47
     50a:	00e7fb63          	bgeu	a5,a4,520 <atoi+0x66>
     50e:	fd843783          	ld	a5,-40(s0)
     512:	0007c783          	lbu	a5,0(a5)
     516:	873e                	mv	a4,a5
     518:	03900793          	li	a5,57
     51c:	fae7f7e3          	bgeu	a5,a4,4ca <atoi+0x10>
  return n;
     520:	fec42783          	lw	a5,-20(s0)
}
     524:	853e                	mv	a0,a5
     526:	7422                	ld	s0,40(sp)
     528:	6145                	addi	sp,sp,48
     52a:	8082                	ret

000000000000052c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     52c:	7139                	addi	sp,sp,-64
     52e:	fc22                	sd	s0,56(sp)
     530:	0080                	addi	s0,sp,64
     532:	fca43c23          	sd	a0,-40(s0)
     536:	fcb43823          	sd	a1,-48(s0)
     53a:	87b2                	mv	a5,a2
     53c:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     540:	fd843783          	ld	a5,-40(s0)
     544:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     548:	fd043783          	ld	a5,-48(s0)
     54c:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     550:	fe043703          	ld	a4,-32(s0)
     554:	fe843783          	ld	a5,-24(s0)
     558:	02e7fc63          	bgeu	a5,a4,590 <memmove+0x64>
    while(n-- > 0)
     55c:	a00d                	j	57e <memmove+0x52>
      *dst++ = *src++;
     55e:	fe043703          	ld	a4,-32(s0)
     562:	00170793          	addi	a5,a4,1
     566:	fef43023          	sd	a5,-32(s0)
     56a:	fe843783          	ld	a5,-24(s0)
     56e:	00178693          	addi	a3,a5,1
     572:	fed43423          	sd	a3,-24(s0)
     576:	00074703          	lbu	a4,0(a4)
     57a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     57e:	fcc42783          	lw	a5,-52(s0)
     582:	fff7871b          	addiw	a4,a5,-1
     586:	fce42623          	sw	a4,-52(s0)
     58a:	fcf04ae3          	bgtz	a5,55e <memmove+0x32>
     58e:	a891                	j	5e2 <memmove+0xb6>
  } else {
    dst += n;
     590:	fcc42783          	lw	a5,-52(s0)
     594:	fe843703          	ld	a4,-24(s0)
     598:	97ba                	add	a5,a5,a4
     59a:	fef43423          	sd	a5,-24(s0)
    src += n;
     59e:	fcc42783          	lw	a5,-52(s0)
     5a2:	fe043703          	ld	a4,-32(s0)
     5a6:	97ba                	add	a5,a5,a4
     5a8:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     5ac:	a01d                	j	5d2 <memmove+0xa6>
      *--dst = *--src;
     5ae:	fe043783          	ld	a5,-32(s0)
     5b2:	17fd                	addi	a5,a5,-1
     5b4:	fef43023          	sd	a5,-32(s0)
     5b8:	fe843783          	ld	a5,-24(s0)
     5bc:	17fd                	addi	a5,a5,-1
     5be:	fef43423          	sd	a5,-24(s0)
     5c2:	fe043783          	ld	a5,-32(s0)
     5c6:	0007c703          	lbu	a4,0(a5)
     5ca:	fe843783          	ld	a5,-24(s0)
     5ce:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     5d2:	fcc42783          	lw	a5,-52(s0)
     5d6:	fff7871b          	addiw	a4,a5,-1
     5da:	fce42623          	sw	a4,-52(s0)
     5de:	fcf048e3          	bgtz	a5,5ae <memmove+0x82>
  }
  return vdst;
     5e2:	fd843783          	ld	a5,-40(s0)
}
     5e6:	853e                	mv	a0,a5
     5e8:	7462                	ld	s0,56(sp)
     5ea:	6121                	addi	sp,sp,64
     5ec:	8082                	ret

00000000000005ee <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     5ee:	7139                	addi	sp,sp,-64
     5f0:	fc22                	sd	s0,56(sp)
     5f2:	0080                	addi	s0,sp,64
     5f4:	fca43c23          	sd	a0,-40(s0)
     5f8:	fcb43823          	sd	a1,-48(s0)
     5fc:	87b2                	mv	a5,a2
     5fe:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     602:	fd843783          	ld	a5,-40(s0)
     606:	fef43423          	sd	a5,-24(s0)
     60a:	fd043783          	ld	a5,-48(s0)
     60e:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     612:	a0a1                	j	65a <memcmp+0x6c>
    if (*p1 != *p2) {
     614:	fe843783          	ld	a5,-24(s0)
     618:	0007c703          	lbu	a4,0(a5)
     61c:	fe043783          	ld	a5,-32(s0)
     620:	0007c783          	lbu	a5,0(a5)
     624:	02f70163          	beq	a4,a5,646 <memcmp+0x58>
      return *p1 - *p2;
     628:	fe843783          	ld	a5,-24(s0)
     62c:	0007c783          	lbu	a5,0(a5)
     630:	0007871b          	sext.w	a4,a5
     634:	fe043783          	ld	a5,-32(s0)
     638:	0007c783          	lbu	a5,0(a5)
     63c:	2781                	sext.w	a5,a5
     63e:	40f707bb          	subw	a5,a4,a5
     642:	2781                	sext.w	a5,a5
     644:	a01d                	j	66a <memcmp+0x7c>
    }
    p1++;
     646:	fe843783          	ld	a5,-24(s0)
     64a:	0785                	addi	a5,a5,1
     64c:	fef43423          	sd	a5,-24(s0)
    p2++;
     650:	fe043783          	ld	a5,-32(s0)
     654:	0785                	addi	a5,a5,1
     656:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     65a:	fcc42783          	lw	a5,-52(s0)
     65e:	fff7871b          	addiw	a4,a5,-1
     662:	fce42623          	sw	a4,-52(s0)
     666:	f7dd                	bnez	a5,614 <memcmp+0x26>
  }
  return 0;
     668:	4781                	li	a5,0
}
     66a:	853e                	mv	a0,a5
     66c:	7462                	ld	s0,56(sp)
     66e:	6121                	addi	sp,sp,64
     670:	8082                	ret

0000000000000672 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     672:	7179                	addi	sp,sp,-48
     674:	f406                	sd	ra,40(sp)
     676:	f022                	sd	s0,32(sp)
     678:	1800                	addi	s0,sp,48
     67a:	fea43423          	sd	a0,-24(s0)
     67e:	feb43023          	sd	a1,-32(s0)
     682:	87b2                	mv	a5,a2
     684:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     688:	fdc42783          	lw	a5,-36(s0)
     68c:	863e                	mv	a2,a5
     68e:	fe043583          	ld	a1,-32(s0)
     692:	fe843503          	ld	a0,-24(s0)
     696:	00000097          	auipc	ra,0x0
     69a:	e96080e7          	jalr	-362(ra) # 52c <memmove>
     69e:	87aa                	mv	a5,a0
}
     6a0:	853e                	mv	a0,a5
     6a2:	70a2                	ld	ra,40(sp)
     6a4:	7402                	ld	s0,32(sp)
     6a6:	6145                	addi	sp,sp,48
     6a8:	8082                	ret

00000000000006aa <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     6aa:	4885                	li	a7,1
 ecall
     6ac:	00000073          	ecall
 ret
     6b0:	8082                	ret

00000000000006b2 <exit>:
.global exit
exit:
 li a7, SYS_exit
     6b2:	4889                	li	a7,2
 ecall
     6b4:	00000073          	ecall
 ret
     6b8:	8082                	ret

00000000000006ba <wait>:
.global wait
wait:
 li a7, SYS_wait
     6ba:	488d                	li	a7,3
 ecall
     6bc:	00000073          	ecall
 ret
     6c0:	8082                	ret

00000000000006c2 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     6c2:	4891                	li	a7,4
 ecall
     6c4:	00000073          	ecall
 ret
     6c8:	8082                	ret

00000000000006ca <read>:
.global read
read:
 li a7, SYS_read
     6ca:	4895                	li	a7,5
 ecall
     6cc:	00000073          	ecall
 ret
     6d0:	8082                	ret

00000000000006d2 <write>:
.global write
write:
 li a7, SYS_write
     6d2:	48c1                	li	a7,16
 ecall
     6d4:	00000073          	ecall
 ret
     6d8:	8082                	ret

00000000000006da <close>:
.global close
close:
 li a7, SYS_close
     6da:	48d5                	li	a7,21
 ecall
     6dc:	00000073          	ecall
 ret
     6e0:	8082                	ret

00000000000006e2 <kill>:
.global kill
kill:
 li a7, SYS_kill
     6e2:	4899                	li	a7,6
 ecall
     6e4:	00000073          	ecall
 ret
     6e8:	8082                	ret

00000000000006ea <exec>:
.global exec
exec:
 li a7, SYS_exec
     6ea:	489d                	li	a7,7
 ecall
     6ec:	00000073          	ecall
 ret
     6f0:	8082                	ret

00000000000006f2 <open>:
.global open
open:
 li a7, SYS_open
     6f2:	48bd                	li	a7,15
 ecall
     6f4:	00000073          	ecall
 ret
     6f8:	8082                	ret

00000000000006fa <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     6fa:	48c5                	li	a7,17
 ecall
     6fc:	00000073          	ecall
 ret
     700:	8082                	ret

0000000000000702 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     702:	48c9                	li	a7,18
 ecall
     704:	00000073          	ecall
 ret
     708:	8082                	ret

000000000000070a <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     70a:	48a1                	li	a7,8
 ecall
     70c:	00000073          	ecall
 ret
     710:	8082                	ret

0000000000000712 <link>:
.global link
link:
 li a7, SYS_link
     712:	48cd                	li	a7,19
 ecall
     714:	00000073          	ecall
 ret
     718:	8082                	ret

000000000000071a <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     71a:	48d1                	li	a7,20
 ecall
     71c:	00000073          	ecall
 ret
     720:	8082                	ret

0000000000000722 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     722:	48a5                	li	a7,9
 ecall
     724:	00000073          	ecall
 ret
     728:	8082                	ret

000000000000072a <dup>:
.global dup
dup:
 li a7, SYS_dup
     72a:	48a9                	li	a7,10
 ecall
     72c:	00000073          	ecall
 ret
     730:	8082                	ret

0000000000000732 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     732:	48ad                	li	a7,11
 ecall
     734:	00000073          	ecall
 ret
     738:	8082                	ret

000000000000073a <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     73a:	48b1                	li	a7,12
 ecall
     73c:	00000073          	ecall
 ret
     740:	8082                	ret

0000000000000742 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     742:	48b5                	li	a7,13
 ecall
     744:	00000073          	ecall
 ret
     748:	8082                	ret

000000000000074a <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     74a:	48b9                	li	a7,14
 ecall
     74c:	00000073          	ecall
 ret
     750:	8082                	ret

0000000000000752 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     752:	48d9                	li	a7,22
 ecall
     754:	00000073          	ecall
 ret
     758:	8082                	ret

000000000000075a <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     75a:	48dd                	li	a7,23
 ecall
     75c:	00000073          	ecall
 ret
     760:	8082                	ret

0000000000000762 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     762:	48e1                	li	a7,24
 ecall
     764:	00000073          	ecall
 ret
     768:	8082                	ret

000000000000076a <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     76a:	1101                	addi	sp,sp,-32
     76c:	ec06                	sd	ra,24(sp)
     76e:	e822                	sd	s0,16(sp)
     770:	1000                	addi	s0,sp,32
     772:	87aa                	mv	a5,a0
     774:	872e                	mv	a4,a1
     776:	fef42623          	sw	a5,-20(s0)
     77a:	87ba                	mv	a5,a4
     77c:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     780:	feb40713          	addi	a4,s0,-21
     784:	fec42783          	lw	a5,-20(s0)
     788:	4605                	li	a2,1
     78a:	85ba                	mv	a1,a4
     78c:	853e                	mv	a0,a5
     78e:	00000097          	auipc	ra,0x0
     792:	f44080e7          	jalr	-188(ra) # 6d2 <write>
}
     796:	0001                	nop
     798:	60e2                	ld	ra,24(sp)
     79a:	6442                	ld	s0,16(sp)
     79c:	6105                	addi	sp,sp,32
     79e:	8082                	ret

00000000000007a0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     7a0:	7139                	addi	sp,sp,-64
     7a2:	fc06                	sd	ra,56(sp)
     7a4:	f822                	sd	s0,48(sp)
     7a6:	0080                	addi	s0,sp,64
     7a8:	87aa                	mv	a5,a0
     7aa:	8736                	mv	a4,a3
     7ac:	fcf42623          	sw	a5,-52(s0)
     7b0:	87ae                	mv	a5,a1
     7b2:	fcf42423          	sw	a5,-56(s0)
     7b6:	87b2                	mv	a5,a2
     7b8:	fcf42223          	sw	a5,-60(s0)
     7bc:	87ba                	mv	a5,a4
     7be:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     7c2:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     7c6:	fc042783          	lw	a5,-64(s0)
     7ca:	2781                	sext.w	a5,a5
     7cc:	c38d                	beqz	a5,7ee <printint+0x4e>
     7ce:	fc842783          	lw	a5,-56(s0)
     7d2:	2781                	sext.w	a5,a5
     7d4:	0007dd63          	bgez	a5,7ee <printint+0x4e>
    neg = 1;
     7d8:	4785                	li	a5,1
     7da:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     7de:	fc842783          	lw	a5,-56(s0)
     7e2:	40f007bb          	negw	a5,a5
     7e6:	2781                	sext.w	a5,a5
     7e8:	fef42223          	sw	a5,-28(s0)
     7ec:	a029                	j	7f6 <printint+0x56>
  } else {
    x = xx;
     7ee:	fc842783          	lw	a5,-56(s0)
     7f2:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     7f6:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     7fa:	fc442783          	lw	a5,-60(s0)
     7fe:	fe442703          	lw	a4,-28(s0)
     802:	02f777bb          	remuw	a5,a4,a5
     806:	0007861b          	sext.w	a2,a5
     80a:	fec42783          	lw	a5,-20(s0)
     80e:	0017871b          	addiw	a4,a5,1
     812:	fee42623          	sw	a4,-20(s0)
     816:	00002697          	auipc	a3,0x2
     81a:	c7268693          	addi	a3,a3,-910 # 2488 <digits>
     81e:	02061713          	slli	a4,a2,0x20
     822:	9301                	srli	a4,a4,0x20
     824:	9736                	add	a4,a4,a3
     826:	00074703          	lbu	a4,0(a4)
     82a:	ff040693          	addi	a3,s0,-16
     82e:	97b6                	add	a5,a5,a3
     830:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     834:	fc442783          	lw	a5,-60(s0)
     838:	fe442703          	lw	a4,-28(s0)
     83c:	02f757bb          	divuw	a5,a4,a5
     840:	fef42223          	sw	a5,-28(s0)
     844:	fe442783          	lw	a5,-28(s0)
     848:	2781                	sext.w	a5,a5
     84a:	fbc5                	bnez	a5,7fa <printint+0x5a>
  if(neg)
     84c:	fe842783          	lw	a5,-24(s0)
     850:	2781                	sext.w	a5,a5
     852:	cf95                	beqz	a5,88e <printint+0xee>
    buf[i++] = '-';
     854:	fec42783          	lw	a5,-20(s0)
     858:	0017871b          	addiw	a4,a5,1
     85c:	fee42623          	sw	a4,-20(s0)
     860:	ff040713          	addi	a4,s0,-16
     864:	97ba                	add	a5,a5,a4
     866:	02d00713          	li	a4,45
     86a:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     86e:	a005                	j	88e <printint+0xee>
    putc(fd, buf[i]);
     870:	fec42783          	lw	a5,-20(s0)
     874:	ff040713          	addi	a4,s0,-16
     878:	97ba                	add	a5,a5,a4
     87a:	fe07c703          	lbu	a4,-32(a5)
     87e:	fcc42783          	lw	a5,-52(s0)
     882:	85ba                	mv	a1,a4
     884:	853e                	mv	a0,a5
     886:	00000097          	auipc	ra,0x0
     88a:	ee4080e7          	jalr	-284(ra) # 76a <putc>
  while(--i >= 0)
     88e:	fec42783          	lw	a5,-20(s0)
     892:	37fd                	addiw	a5,a5,-1
     894:	fef42623          	sw	a5,-20(s0)
     898:	fec42783          	lw	a5,-20(s0)
     89c:	2781                	sext.w	a5,a5
     89e:	fc07d9e3          	bgez	a5,870 <printint+0xd0>
}
     8a2:	0001                	nop
     8a4:	0001                	nop
     8a6:	70e2                	ld	ra,56(sp)
     8a8:	7442                	ld	s0,48(sp)
     8aa:	6121                	addi	sp,sp,64
     8ac:	8082                	ret

00000000000008ae <printptr>:

static void
printptr(int fd, uint64 x) {
     8ae:	7179                	addi	sp,sp,-48
     8b0:	f406                	sd	ra,40(sp)
     8b2:	f022                	sd	s0,32(sp)
     8b4:	1800                	addi	s0,sp,48
     8b6:	87aa                	mv	a5,a0
     8b8:	fcb43823          	sd	a1,-48(s0)
     8bc:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     8c0:	fdc42783          	lw	a5,-36(s0)
     8c4:	03000593          	li	a1,48
     8c8:	853e                	mv	a0,a5
     8ca:	00000097          	auipc	ra,0x0
     8ce:	ea0080e7          	jalr	-352(ra) # 76a <putc>
  putc(fd, 'x');
     8d2:	fdc42783          	lw	a5,-36(s0)
     8d6:	07800593          	li	a1,120
     8da:	853e                	mv	a0,a5
     8dc:	00000097          	auipc	ra,0x0
     8e0:	e8e080e7          	jalr	-370(ra) # 76a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     8e4:	fe042623          	sw	zero,-20(s0)
     8e8:	a82d                	j	922 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     8ea:	fd043783          	ld	a5,-48(s0)
     8ee:	93f1                	srli	a5,a5,0x3c
     8f0:	00002717          	auipc	a4,0x2
     8f4:	b9870713          	addi	a4,a4,-1128 # 2488 <digits>
     8f8:	97ba                	add	a5,a5,a4
     8fa:	0007c703          	lbu	a4,0(a5)
     8fe:	fdc42783          	lw	a5,-36(s0)
     902:	85ba                	mv	a1,a4
     904:	853e                	mv	a0,a5
     906:	00000097          	auipc	ra,0x0
     90a:	e64080e7          	jalr	-412(ra) # 76a <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     90e:	fec42783          	lw	a5,-20(s0)
     912:	2785                	addiw	a5,a5,1
     914:	fef42623          	sw	a5,-20(s0)
     918:	fd043783          	ld	a5,-48(s0)
     91c:	0792                	slli	a5,a5,0x4
     91e:	fcf43823          	sd	a5,-48(s0)
     922:	fec42783          	lw	a5,-20(s0)
     926:	873e                	mv	a4,a5
     928:	47bd                	li	a5,15
     92a:	fce7f0e3          	bgeu	a5,a4,8ea <printptr+0x3c>
}
     92e:	0001                	nop
     930:	0001                	nop
     932:	70a2                	ld	ra,40(sp)
     934:	7402                	ld	s0,32(sp)
     936:	6145                	addi	sp,sp,48
     938:	8082                	ret

000000000000093a <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     93a:	715d                	addi	sp,sp,-80
     93c:	e486                	sd	ra,72(sp)
     93e:	e0a2                	sd	s0,64(sp)
     940:	0880                	addi	s0,sp,80
     942:	87aa                	mv	a5,a0
     944:	fcb43023          	sd	a1,-64(s0)
     948:	fac43c23          	sd	a2,-72(s0)
     94c:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     950:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     954:	fe042223          	sw	zero,-28(s0)
     958:	a42d                	j	b82 <vprintf+0x248>
    c = fmt[i] & 0xff;
     95a:	fe442783          	lw	a5,-28(s0)
     95e:	fc043703          	ld	a4,-64(s0)
     962:	97ba                	add	a5,a5,a4
     964:	0007c783          	lbu	a5,0(a5)
     968:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     96c:	fe042783          	lw	a5,-32(s0)
     970:	2781                	sext.w	a5,a5
     972:	eb9d                	bnez	a5,9a8 <vprintf+0x6e>
      if(c == '%'){
     974:	fdc42783          	lw	a5,-36(s0)
     978:	0007871b          	sext.w	a4,a5
     97c:	02500793          	li	a5,37
     980:	00f71763          	bne	a4,a5,98e <vprintf+0x54>
        state = '%';
     984:	02500793          	li	a5,37
     988:	fef42023          	sw	a5,-32(s0)
     98c:	a2f5                	j	b78 <vprintf+0x23e>
      } else {
        putc(fd, c);
     98e:	fdc42783          	lw	a5,-36(s0)
     992:	0ff7f713          	andi	a4,a5,255
     996:	fcc42783          	lw	a5,-52(s0)
     99a:	85ba                	mv	a1,a4
     99c:	853e                	mv	a0,a5
     99e:	00000097          	auipc	ra,0x0
     9a2:	dcc080e7          	jalr	-564(ra) # 76a <putc>
     9a6:	aac9                	j	b78 <vprintf+0x23e>
      }
    } else if(state == '%'){
     9a8:	fe042783          	lw	a5,-32(s0)
     9ac:	0007871b          	sext.w	a4,a5
     9b0:	02500793          	li	a5,37
     9b4:	1cf71263          	bne	a4,a5,b78 <vprintf+0x23e>
      if(c == 'd'){
     9b8:	fdc42783          	lw	a5,-36(s0)
     9bc:	0007871b          	sext.w	a4,a5
     9c0:	06400793          	li	a5,100
     9c4:	02f71463          	bne	a4,a5,9ec <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     9c8:	fb843783          	ld	a5,-72(s0)
     9cc:	00878713          	addi	a4,a5,8
     9d0:	fae43c23          	sd	a4,-72(s0)
     9d4:	4398                	lw	a4,0(a5)
     9d6:	fcc42783          	lw	a5,-52(s0)
     9da:	4685                	li	a3,1
     9dc:	4629                	li	a2,10
     9de:	85ba                	mv	a1,a4
     9e0:	853e                	mv	a0,a5
     9e2:	00000097          	auipc	ra,0x0
     9e6:	dbe080e7          	jalr	-578(ra) # 7a0 <printint>
     9ea:	a269                	j	b74 <vprintf+0x23a>
      } else if(c == 'l') {
     9ec:	fdc42783          	lw	a5,-36(s0)
     9f0:	0007871b          	sext.w	a4,a5
     9f4:	06c00793          	li	a5,108
     9f8:	02f71663          	bne	a4,a5,a24 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     9fc:	fb843783          	ld	a5,-72(s0)
     a00:	00878713          	addi	a4,a5,8
     a04:	fae43c23          	sd	a4,-72(s0)
     a08:	639c                	ld	a5,0(a5)
     a0a:	0007871b          	sext.w	a4,a5
     a0e:	fcc42783          	lw	a5,-52(s0)
     a12:	4681                	li	a3,0
     a14:	4629                	li	a2,10
     a16:	85ba                	mv	a1,a4
     a18:	853e                	mv	a0,a5
     a1a:	00000097          	auipc	ra,0x0
     a1e:	d86080e7          	jalr	-634(ra) # 7a0 <printint>
     a22:	aa89                	j	b74 <vprintf+0x23a>
      } else if(c == 'x') {
     a24:	fdc42783          	lw	a5,-36(s0)
     a28:	0007871b          	sext.w	a4,a5
     a2c:	07800793          	li	a5,120
     a30:	02f71463          	bne	a4,a5,a58 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     a34:	fb843783          	ld	a5,-72(s0)
     a38:	00878713          	addi	a4,a5,8
     a3c:	fae43c23          	sd	a4,-72(s0)
     a40:	4398                	lw	a4,0(a5)
     a42:	fcc42783          	lw	a5,-52(s0)
     a46:	4681                	li	a3,0
     a48:	4641                	li	a2,16
     a4a:	85ba                	mv	a1,a4
     a4c:	853e                	mv	a0,a5
     a4e:	00000097          	auipc	ra,0x0
     a52:	d52080e7          	jalr	-686(ra) # 7a0 <printint>
     a56:	aa39                	j	b74 <vprintf+0x23a>
      } else if(c == 'p') {
     a58:	fdc42783          	lw	a5,-36(s0)
     a5c:	0007871b          	sext.w	a4,a5
     a60:	07000793          	li	a5,112
     a64:	02f71263          	bne	a4,a5,a88 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     a68:	fb843783          	ld	a5,-72(s0)
     a6c:	00878713          	addi	a4,a5,8
     a70:	fae43c23          	sd	a4,-72(s0)
     a74:	6398                	ld	a4,0(a5)
     a76:	fcc42783          	lw	a5,-52(s0)
     a7a:	85ba                	mv	a1,a4
     a7c:	853e                	mv	a0,a5
     a7e:	00000097          	auipc	ra,0x0
     a82:	e30080e7          	jalr	-464(ra) # 8ae <printptr>
     a86:	a0fd                	j	b74 <vprintf+0x23a>
      } else if(c == 's'){
     a88:	fdc42783          	lw	a5,-36(s0)
     a8c:	0007871b          	sext.w	a4,a5
     a90:	07300793          	li	a5,115
     a94:	04f71c63          	bne	a4,a5,aec <vprintf+0x1b2>
        s = va_arg(ap, char*);
     a98:	fb843783          	ld	a5,-72(s0)
     a9c:	00878713          	addi	a4,a5,8
     aa0:	fae43c23          	sd	a4,-72(s0)
     aa4:	639c                	ld	a5,0(a5)
     aa6:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     aaa:	fe843783          	ld	a5,-24(s0)
     aae:	eb8d                	bnez	a5,ae0 <vprintf+0x1a6>
          s = "(null)";
     ab0:	00001797          	auipc	a5,0x1
     ab4:	75878793          	addi	a5,a5,1880 # 2208 <schedule_edf_cbs+0x51a>
     ab8:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     abc:	a015                	j	ae0 <vprintf+0x1a6>
          putc(fd, *s);
     abe:	fe843783          	ld	a5,-24(s0)
     ac2:	0007c703          	lbu	a4,0(a5)
     ac6:	fcc42783          	lw	a5,-52(s0)
     aca:	85ba                	mv	a1,a4
     acc:	853e                	mv	a0,a5
     ace:	00000097          	auipc	ra,0x0
     ad2:	c9c080e7          	jalr	-868(ra) # 76a <putc>
          s++;
     ad6:	fe843783          	ld	a5,-24(s0)
     ada:	0785                	addi	a5,a5,1
     adc:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     ae0:	fe843783          	ld	a5,-24(s0)
     ae4:	0007c783          	lbu	a5,0(a5)
     ae8:	fbf9                	bnez	a5,abe <vprintf+0x184>
     aea:	a069                	j	b74 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     aec:	fdc42783          	lw	a5,-36(s0)
     af0:	0007871b          	sext.w	a4,a5
     af4:	06300793          	li	a5,99
     af8:	02f71463          	bne	a4,a5,b20 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     afc:	fb843783          	ld	a5,-72(s0)
     b00:	00878713          	addi	a4,a5,8
     b04:	fae43c23          	sd	a4,-72(s0)
     b08:	439c                	lw	a5,0(a5)
     b0a:	0ff7f713          	andi	a4,a5,255
     b0e:	fcc42783          	lw	a5,-52(s0)
     b12:	85ba                	mv	a1,a4
     b14:	853e                	mv	a0,a5
     b16:	00000097          	auipc	ra,0x0
     b1a:	c54080e7          	jalr	-940(ra) # 76a <putc>
     b1e:	a899                	j	b74 <vprintf+0x23a>
      } else if(c == '%'){
     b20:	fdc42783          	lw	a5,-36(s0)
     b24:	0007871b          	sext.w	a4,a5
     b28:	02500793          	li	a5,37
     b2c:	00f71f63          	bne	a4,a5,b4a <vprintf+0x210>
        putc(fd, c);
     b30:	fdc42783          	lw	a5,-36(s0)
     b34:	0ff7f713          	andi	a4,a5,255
     b38:	fcc42783          	lw	a5,-52(s0)
     b3c:	85ba                	mv	a1,a4
     b3e:	853e                	mv	a0,a5
     b40:	00000097          	auipc	ra,0x0
     b44:	c2a080e7          	jalr	-982(ra) # 76a <putc>
     b48:	a035                	j	b74 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     b4a:	fcc42783          	lw	a5,-52(s0)
     b4e:	02500593          	li	a1,37
     b52:	853e                	mv	a0,a5
     b54:	00000097          	auipc	ra,0x0
     b58:	c16080e7          	jalr	-1002(ra) # 76a <putc>
        putc(fd, c);
     b5c:	fdc42783          	lw	a5,-36(s0)
     b60:	0ff7f713          	andi	a4,a5,255
     b64:	fcc42783          	lw	a5,-52(s0)
     b68:	85ba                	mv	a1,a4
     b6a:	853e                	mv	a0,a5
     b6c:	00000097          	auipc	ra,0x0
     b70:	bfe080e7          	jalr	-1026(ra) # 76a <putc>
      }
      state = 0;
     b74:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     b78:	fe442783          	lw	a5,-28(s0)
     b7c:	2785                	addiw	a5,a5,1
     b7e:	fef42223          	sw	a5,-28(s0)
     b82:	fe442783          	lw	a5,-28(s0)
     b86:	fc043703          	ld	a4,-64(s0)
     b8a:	97ba                	add	a5,a5,a4
     b8c:	0007c783          	lbu	a5,0(a5)
     b90:	dc0795e3          	bnez	a5,95a <vprintf+0x20>
    }
  }
}
     b94:	0001                	nop
     b96:	0001                	nop
     b98:	60a6                	ld	ra,72(sp)
     b9a:	6406                	ld	s0,64(sp)
     b9c:	6161                	addi	sp,sp,80
     b9e:	8082                	ret

0000000000000ba0 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     ba0:	7159                	addi	sp,sp,-112
     ba2:	fc06                	sd	ra,56(sp)
     ba4:	f822                	sd	s0,48(sp)
     ba6:	0080                	addi	s0,sp,64
     ba8:	fcb43823          	sd	a1,-48(s0)
     bac:	e010                	sd	a2,0(s0)
     bae:	e414                	sd	a3,8(s0)
     bb0:	e818                	sd	a4,16(s0)
     bb2:	ec1c                	sd	a5,24(s0)
     bb4:	03043023          	sd	a6,32(s0)
     bb8:	03143423          	sd	a7,40(s0)
     bbc:	87aa                	mv	a5,a0
     bbe:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     bc2:	03040793          	addi	a5,s0,48
     bc6:	fcf43423          	sd	a5,-56(s0)
     bca:	fc843783          	ld	a5,-56(s0)
     bce:	fd078793          	addi	a5,a5,-48
     bd2:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     bd6:	fe843703          	ld	a4,-24(s0)
     bda:	fdc42783          	lw	a5,-36(s0)
     bde:	863a                	mv	a2,a4
     be0:	fd043583          	ld	a1,-48(s0)
     be4:	853e                	mv	a0,a5
     be6:	00000097          	auipc	ra,0x0
     bea:	d54080e7          	jalr	-684(ra) # 93a <vprintf>
}
     bee:	0001                	nop
     bf0:	70e2                	ld	ra,56(sp)
     bf2:	7442                	ld	s0,48(sp)
     bf4:	6165                	addi	sp,sp,112
     bf6:	8082                	ret

0000000000000bf8 <printf>:

void
printf(const char *fmt, ...)
{
     bf8:	7159                	addi	sp,sp,-112
     bfa:	f406                	sd	ra,40(sp)
     bfc:	f022                	sd	s0,32(sp)
     bfe:	1800                	addi	s0,sp,48
     c00:	fca43c23          	sd	a0,-40(s0)
     c04:	e40c                	sd	a1,8(s0)
     c06:	e810                	sd	a2,16(s0)
     c08:	ec14                	sd	a3,24(s0)
     c0a:	f018                	sd	a4,32(s0)
     c0c:	f41c                	sd	a5,40(s0)
     c0e:	03043823          	sd	a6,48(s0)
     c12:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     c16:	04040793          	addi	a5,s0,64
     c1a:	fcf43823          	sd	a5,-48(s0)
     c1e:	fd043783          	ld	a5,-48(s0)
     c22:	fc878793          	addi	a5,a5,-56
     c26:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     c2a:	fe843783          	ld	a5,-24(s0)
     c2e:	863e                	mv	a2,a5
     c30:	fd843583          	ld	a1,-40(s0)
     c34:	4505                	li	a0,1
     c36:	00000097          	auipc	ra,0x0
     c3a:	d04080e7          	jalr	-764(ra) # 93a <vprintf>
}
     c3e:	0001                	nop
     c40:	70a2                	ld	ra,40(sp)
     c42:	7402                	ld	s0,32(sp)
     c44:	6165                	addi	sp,sp,112
     c46:	8082                	ret

0000000000000c48 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c48:	7179                	addi	sp,sp,-48
     c4a:	f422                	sd	s0,40(sp)
     c4c:	1800                	addi	s0,sp,48
     c4e:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     c52:	fd843783          	ld	a5,-40(s0)
     c56:	17c1                	addi	a5,a5,-16
     c58:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c5c:	00002797          	auipc	a5,0x2
     c60:	a8478793          	addi	a5,a5,-1404 # 26e0 <freep>
     c64:	639c                	ld	a5,0(a5)
     c66:	fef43423          	sd	a5,-24(s0)
     c6a:	a815                	j	c9e <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     c6c:	fe843783          	ld	a5,-24(s0)
     c70:	639c                	ld	a5,0(a5)
     c72:	fe843703          	ld	a4,-24(s0)
     c76:	00f76f63          	bltu	a4,a5,c94 <free+0x4c>
     c7a:	fe043703          	ld	a4,-32(s0)
     c7e:	fe843783          	ld	a5,-24(s0)
     c82:	02e7eb63          	bltu	a5,a4,cb8 <free+0x70>
     c86:	fe843783          	ld	a5,-24(s0)
     c8a:	639c                	ld	a5,0(a5)
     c8c:	fe043703          	ld	a4,-32(s0)
     c90:	02f76463          	bltu	a4,a5,cb8 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c94:	fe843783          	ld	a5,-24(s0)
     c98:	639c                	ld	a5,0(a5)
     c9a:	fef43423          	sd	a5,-24(s0)
     c9e:	fe043703          	ld	a4,-32(s0)
     ca2:	fe843783          	ld	a5,-24(s0)
     ca6:	fce7f3e3          	bgeu	a5,a4,c6c <free+0x24>
     caa:	fe843783          	ld	a5,-24(s0)
     cae:	639c                	ld	a5,0(a5)
     cb0:	fe043703          	ld	a4,-32(s0)
     cb4:	faf77ce3          	bgeu	a4,a5,c6c <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     cb8:	fe043783          	ld	a5,-32(s0)
     cbc:	479c                	lw	a5,8(a5)
     cbe:	1782                	slli	a5,a5,0x20
     cc0:	9381                	srli	a5,a5,0x20
     cc2:	0792                	slli	a5,a5,0x4
     cc4:	fe043703          	ld	a4,-32(s0)
     cc8:	973e                	add	a4,a4,a5
     cca:	fe843783          	ld	a5,-24(s0)
     cce:	639c                	ld	a5,0(a5)
     cd0:	02f71763          	bne	a4,a5,cfe <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     cd4:	fe043783          	ld	a5,-32(s0)
     cd8:	4798                	lw	a4,8(a5)
     cda:	fe843783          	ld	a5,-24(s0)
     cde:	639c                	ld	a5,0(a5)
     ce0:	479c                	lw	a5,8(a5)
     ce2:	9fb9                	addw	a5,a5,a4
     ce4:	0007871b          	sext.w	a4,a5
     ce8:	fe043783          	ld	a5,-32(s0)
     cec:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     cee:	fe843783          	ld	a5,-24(s0)
     cf2:	639c                	ld	a5,0(a5)
     cf4:	6398                	ld	a4,0(a5)
     cf6:	fe043783          	ld	a5,-32(s0)
     cfa:	e398                	sd	a4,0(a5)
     cfc:	a039                	j	d0a <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     cfe:	fe843783          	ld	a5,-24(s0)
     d02:	6398                	ld	a4,0(a5)
     d04:	fe043783          	ld	a5,-32(s0)
     d08:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     d0a:	fe843783          	ld	a5,-24(s0)
     d0e:	479c                	lw	a5,8(a5)
     d10:	1782                	slli	a5,a5,0x20
     d12:	9381                	srli	a5,a5,0x20
     d14:	0792                	slli	a5,a5,0x4
     d16:	fe843703          	ld	a4,-24(s0)
     d1a:	97ba                	add	a5,a5,a4
     d1c:	fe043703          	ld	a4,-32(s0)
     d20:	02f71563          	bne	a4,a5,d4a <free+0x102>
    p->s.size += bp->s.size;
     d24:	fe843783          	ld	a5,-24(s0)
     d28:	4798                	lw	a4,8(a5)
     d2a:	fe043783          	ld	a5,-32(s0)
     d2e:	479c                	lw	a5,8(a5)
     d30:	9fb9                	addw	a5,a5,a4
     d32:	0007871b          	sext.w	a4,a5
     d36:	fe843783          	ld	a5,-24(s0)
     d3a:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     d3c:	fe043783          	ld	a5,-32(s0)
     d40:	6398                	ld	a4,0(a5)
     d42:	fe843783          	ld	a5,-24(s0)
     d46:	e398                	sd	a4,0(a5)
     d48:	a031                	j	d54 <free+0x10c>
  } else
    p->s.ptr = bp;
     d4a:	fe843783          	ld	a5,-24(s0)
     d4e:	fe043703          	ld	a4,-32(s0)
     d52:	e398                	sd	a4,0(a5)
  freep = p;
     d54:	00002797          	auipc	a5,0x2
     d58:	98c78793          	addi	a5,a5,-1652 # 26e0 <freep>
     d5c:	fe843703          	ld	a4,-24(s0)
     d60:	e398                	sd	a4,0(a5)
}
     d62:	0001                	nop
     d64:	7422                	ld	s0,40(sp)
     d66:	6145                	addi	sp,sp,48
     d68:	8082                	ret

0000000000000d6a <morecore>:

static Header*
morecore(uint nu)
{
     d6a:	7179                	addi	sp,sp,-48
     d6c:	f406                	sd	ra,40(sp)
     d6e:	f022                	sd	s0,32(sp)
     d70:	1800                	addi	s0,sp,48
     d72:	87aa                	mv	a5,a0
     d74:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     d78:	fdc42783          	lw	a5,-36(s0)
     d7c:	0007871b          	sext.w	a4,a5
     d80:	6785                	lui	a5,0x1
     d82:	00f77563          	bgeu	a4,a5,d8c <morecore+0x22>
    nu = 4096;
     d86:	6785                	lui	a5,0x1
     d88:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     d8c:	fdc42783          	lw	a5,-36(s0)
     d90:	0047979b          	slliw	a5,a5,0x4
     d94:	2781                	sext.w	a5,a5
     d96:	2781                	sext.w	a5,a5
     d98:	853e                	mv	a0,a5
     d9a:	00000097          	auipc	ra,0x0
     d9e:	9a0080e7          	jalr	-1632(ra) # 73a <sbrk>
     da2:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     da6:	fe843703          	ld	a4,-24(s0)
     daa:	57fd                	li	a5,-1
     dac:	00f71463          	bne	a4,a5,db4 <morecore+0x4a>
    return 0;
     db0:	4781                	li	a5,0
     db2:	a03d                	j	de0 <morecore+0x76>
  hp = (Header*)p;
     db4:	fe843783          	ld	a5,-24(s0)
     db8:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     dbc:	fe043783          	ld	a5,-32(s0)
     dc0:	fdc42703          	lw	a4,-36(s0)
     dc4:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     dc6:	fe043783          	ld	a5,-32(s0)
     dca:	07c1                	addi	a5,a5,16
     dcc:	853e                	mv	a0,a5
     dce:	00000097          	auipc	ra,0x0
     dd2:	e7a080e7          	jalr	-390(ra) # c48 <free>
  return freep;
     dd6:	00002797          	auipc	a5,0x2
     dda:	90a78793          	addi	a5,a5,-1782 # 26e0 <freep>
     dde:	639c                	ld	a5,0(a5)
}
     de0:	853e                	mv	a0,a5
     de2:	70a2                	ld	ra,40(sp)
     de4:	7402                	ld	s0,32(sp)
     de6:	6145                	addi	sp,sp,48
     de8:	8082                	ret

0000000000000dea <malloc>:

void*
malloc(uint nbytes)
{
     dea:	7139                	addi	sp,sp,-64
     dec:	fc06                	sd	ra,56(sp)
     dee:	f822                	sd	s0,48(sp)
     df0:	0080                	addi	s0,sp,64
     df2:	87aa                	mv	a5,a0
     df4:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     df8:	fcc46783          	lwu	a5,-52(s0)
     dfc:	07bd                	addi	a5,a5,15
     dfe:	8391                	srli	a5,a5,0x4
     e00:	2781                	sext.w	a5,a5
     e02:	2785                	addiw	a5,a5,1
     e04:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     e08:	00002797          	auipc	a5,0x2
     e0c:	8d878793          	addi	a5,a5,-1832 # 26e0 <freep>
     e10:	639c                	ld	a5,0(a5)
     e12:	fef43023          	sd	a5,-32(s0)
     e16:	fe043783          	ld	a5,-32(s0)
     e1a:	ef95                	bnez	a5,e56 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     e1c:	00002797          	auipc	a5,0x2
     e20:	8b478793          	addi	a5,a5,-1868 # 26d0 <base>
     e24:	fef43023          	sd	a5,-32(s0)
     e28:	00002797          	auipc	a5,0x2
     e2c:	8b878793          	addi	a5,a5,-1864 # 26e0 <freep>
     e30:	fe043703          	ld	a4,-32(s0)
     e34:	e398                	sd	a4,0(a5)
     e36:	00002797          	auipc	a5,0x2
     e3a:	8aa78793          	addi	a5,a5,-1878 # 26e0 <freep>
     e3e:	6398                	ld	a4,0(a5)
     e40:	00002797          	auipc	a5,0x2
     e44:	89078793          	addi	a5,a5,-1904 # 26d0 <base>
     e48:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     e4a:	00002797          	auipc	a5,0x2
     e4e:	88678793          	addi	a5,a5,-1914 # 26d0 <base>
     e52:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     e56:	fe043783          	ld	a5,-32(s0)
     e5a:	639c                	ld	a5,0(a5)
     e5c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     e60:	fe843783          	ld	a5,-24(s0)
     e64:	4798                	lw	a4,8(a5)
     e66:	fdc42783          	lw	a5,-36(s0)
     e6a:	2781                	sext.w	a5,a5
     e6c:	06f76863          	bltu	a4,a5,edc <malloc+0xf2>
      if(p->s.size == nunits)
     e70:	fe843783          	ld	a5,-24(s0)
     e74:	4798                	lw	a4,8(a5)
     e76:	fdc42783          	lw	a5,-36(s0)
     e7a:	2781                	sext.w	a5,a5
     e7c:	00e79963          	bne	a5,a4,e8e <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     e80:	fe843783          	ld	a5,-24(s0)
     e84:	6398                	ld	a4,0(a5)
     e86:	fe043783          	ld	a5,-32(s0)
     e8a:	e398                	sd	a4,0(a5)
     e8c:	a82d                	j	ec6 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     e8e:	fe843783          	ld	a5,-24(s0)
     e92:	4798                	lw	a4,8(a5)
     e94:	fdc42783          	lw	a5,-36(s0)
     e98:	40f707bb          	subw	a5,a4,a5
     e9c:	0007871b          	sext.w	a4,a5
     ea0:	fe843783          	ld	a5,-24(s0)
     ea4:	c798                	sw	a4,8(a5)
        p += p->s.size;
     ea6:	fe843783          	ld	a5,-24(s0)
     eaa:	479c                	lw	a5,8(a5)
     eac:	1782                	slli	a5,a5,0x20
     eae:	9381                	srli	a5,a5,0x20
     eb0:	0792                	slli	a5,a5,0x4
     eb2:	fe843703          	ld	a4,-24(s0)
     eb6:	97ba                	add	a5,a5,a4
     eb8:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     ebc:	fe843783          	ld	a5,-24(s0)
     ec0:	fdc42703          	lw	a4,-36(s0)
     ec4:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     ec6:	00002797          	auipc	a5,0x2
     eca:	81a78793          	addi	a5,a5,-2022 # 26e0 <freep>
     ece:	fe043703          	ld	a4,-32(s0)
     ed2:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     ed4:	fe843783          	ld	a5,-24(s0)
     ed8:	07c1                	addi	a5,a5,16
     eda:	a091                	j	f1e <malloc+0x134>
    }
    if(p == freep)
     edc:	00002797          	auipc	a5,0x2
     ee0:	80478793          	addi	a5,a5,-2044 # 26e0 <freep>
     ee4:	639c                	ld	a5,0(a5)
     ee6:	fe843703          	ld	a4,-24(s0)
     eea:	02f71063          	bne	a4,a5,f0a <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     eee:	fdc42783          	lw	a5,-36(s0)
     ef2:	853e                	mv	a0,a5
     ef4:	00000097          	auipc	ra,0x0
     ef8:	e76080e7          	jalr	-394(ra) # d6a <morecore>
     efc:	fea43423          	sd	a0,-24(s0)
     f00:	fe843783          	ld	a5,-24(s0)
     f04:	e399                	bnez	a5,f0a <malloc+0x120>
        return 0;
     f06:	4781                	li	a5,0
     f08:	a819                	j	f1e <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     f0a:	fe843783          	ld	a5,-24(s0)
     f0e:	fef43023          	sd	a5,-32(s0)
     f12:	fe843783          	ld	a5,-24(s0)
     f16:	639c                	ld	a5,0(a5)
     f18:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     f1c:	b791                	j	e60 <malloc+0x76>
  }
}
     f1e:	853e                	mv	a0,a5
     f20:	70e2                	ld	ra,56(sp)
     f22:	7442                	ld	s0,48(sp)
     f24:	6121                	addi	sp,sp,64
     f26:	8082                	ret

0000000000000f28 <setjmp>:
     f28:	e100                	sd	s0,0(a0)
     f2a:	e504                	sd	s1,8(a0)
     f2c:	01253823          	sd	s2,16(a0)
     f30:	01353c23          	sd	s3,24(a0)
     f34:	03453023          	sd	s4,32(a0)
     f38:	03553423          	sd	s5,40(a0)
     f3c:	03653823          	sd	s6,48(a0)
     f40:	03753c23          	sd	s7,56(a0)
     f44:	05853023          	sd	s8,64(a0)
     f48:	05953423          	sd	s9,72(a0)
     f4c:	05a53823          	sd	s10,80(a0)
     f50:	05b53c23          	sd	s11,88(a0)
     f54:	06153023          	sd	ra,96(a0)
     f58:	06253423          	sd	sp,104(a0)
     f5c:	4501                	li	a0,0
     f5e:	8082                	ret

0000000000000f60 <longjmp>:
     f60:	6100                	ld	s0,0(a0)
     f62:	6504                	ld	s1,8(a0)
     f64:	01053903          	ld	s2,16(a0)
     f68:	01853983          	ld	s3,24(a0)
     f6c:	02053a03          	ld	s4,32(a0)
     f70:	02853a83          	ld	s5,40(a0)
     f74:	03053b03          	ld	s6,48(a0)
     f78:	03853b83          	ld	s7,56(a0)
     f7c:	04053c03          	ld	s8,64(a0)
     f80:	04853c83          	ld	s9,72(a0)
     f84:	05053d03          	ld	s10,80(a0)
     f88:	05853d83          	ld	s11,88(a0)
     f8c:	06053083          	ld	ra,96(a0)
     f90:	06853103          	ld	sp,104(a0)
     f94:	c199                	beqz	a1,f9a <longjmp_1>
     f96:	852e                	mv	a0,a1
     f98:	8082                	ret

0000000000000f9a <longjmp_1>:
     f9a:	4505                	li	a0,1
     f9c:	8082                	ret

0000000000000f9e <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     f9e:	7179                	addi	sp,sp,-48
     fa0:	f422                	sd	s0,40(sp)
     fa2:	1800                	addi	s0,sp,48
     fa4:	fea43423          	sd	a0,-24(s0)
     fa8:	feb43023          	sd	a1,-32(s0)
     fac:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     fb0:	fd843783          	ld	a5,-40(s0)
     fb4:	fe843703          	ld	a4,-24(s0)
     fb8:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     fba:	fe843783          	ld	a5,-24(s0)
     fbe:	fd843703          	ld	a4,-40(s0)
     fc2:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     fc4:	fe843783          	ld	a5,-24(s0)
     fc8:	fe043703          	ld	a4,-32(s0)
     fcc:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     fce:	fe043783          	ld	a5,-32(s0)
     fd2:	fe843703          	ld	a4,-24(s0)
     fd6:	e398                	sd	a4,0(a5)
 }
     fd8:	0001                	nop
     fda:	7422                	ld	s0,40(sp)
     fdc:	6145                	addi	sp,sp,48
     fde:	8082                	ret

0000000000000fe0 <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     fe0:	1101                	addi	sp,sp,-32
     fe2:	ec06                	sd	ra,24(sp)
     fe4:	e822                	sd	s0,16(sp)
     fe6:	1000                	addi	s0,sp,32
     fe8:	fea43423          	sd	a0,-24(s0)
     fec:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     ff0:	fe043783          	ld	a5,-32(s0)
     ff4:	679c                	ld	a5,8(a5)
     ff6:	fe043603          	ld	a2,-32(s0)
     ffa:	85be                	mv	a1,a5
     ffc:	fe843503          	ld	a0,-24(s0)
    1000:	00000097          	auipc	ra,0x0
    1004:	f9e080e7          	jalr	-98(ra) # f9e <__list_add>
 }
    1008:	0001                	nop
    100a:	60e2                	ld	ra,24(sp)
    100c:	6442                	ld	s0,16(sp)
    100e:	6105                	addi	sp,sp,32
    1010:	8082                	ret

0000000000001012 <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
    1012:	1101                	addi	sp,sp,-32
    1014:	ec22                	sd	s0,24(sp)
    1016:	1000                	addi	s0,sp,32
    1018:	fea43423          	sd	a0,-24(s0)
    101c:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
    1020:	fe043783          	ld	a5,-32(s0)
    1024:	fe843703          	ld	a4,-24(s0)
    1028:	e798                	sd	a4,8(a5)
     prev->next = next;
    102a:	fe843783          	ld	a5,-24(s0)
    102e:	fe043703          	ld	a4,-32(s0)
    1032:	e398                	sd	a4,0(a5)
 }
    1034:	0001                	nop
    1036:	6462                	ld	s0,24(sp)
    1038:	6105                	addi	sp,sp,32
    103a:	8082                	ret

000000000000103c <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
    103c:	1101                	addi	sp,sp,-32
    103e:	ec06                	sd	ra,24(sp)
    1040:	e822                	sd	s0,16(sp)
    1042:	1000                	addi	s0,sp,32
    1044:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
    1048:	fe843783          	ld	a5,-24(s0)
    104c:	6798                	ld	a4,8(a5)
    104e:	fe843783          	ld	a5,-24(s0)
    1052:	639c                	ld	a5,0(a5)
    1054:	85be                	mv	a1,a5
    1056:	853a                	mv	a0,a4
    1058:	00000097          	auipc	ra,0x0
    105c:	fba080e7          	jalr	-70(ra) # 1012 <__list_del>
     entry->next = LIST_POISON1;
    1060:	fe843783          	ld	a5,-24(s0)
    1064:	00100737          	lui	a4,0x100
    1068:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd478>
    106c:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
    106e:	fe843783          	ld	a5,-24(s0)
    1072:	00200737          	lui	a4,0x200
    1076:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd578>
    107a:	e798                	sd	a4,8(a5)
 }
    107c:	0001                	nop
    107e:	60e2                	ld	ra,24(sp)
    1080:	6442                	ld	s0,16(sp)
    1082:	6105                	addi	sp,sp,32
    1084:	8082                	ret

0000000000001086 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
    1086:	1101                	addi	sp,sp,-32
    1088:	ec22                	sd	s0,24(sp)
    108a:	1000                	addi	s0,sp,32
    108c:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
    1090:	fe843783          	ld	a5,-24(s0)
    1094:	639c                	ld	a5,0(a5)
    1096:	fe843703          	ld	a4,-24(s0)
    109a:	40f707b3          	sub	a5,a4,a5
    109e:	0017b793          	seqz	a5,a5
    10a2:	0ff7f793          	andi	a5,a5,255
    10a6:	2781                	sext.w	a5,a5
 }
    10a8:	853e                	mv	a0,a5
    10aa:	6462                	ld	s0,24(sp)
    10ac:	6105                	addi	sp,sp,32
    10ae:	8082                	ret

00000000000010b0 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
    10b0:	715d                	addi	sp,sp,-80
    10b2:	e486                	sd	ra,72(sp)
    10b4:	e0a2                	sd	s0,64(sp)
    10b6:	0880                	addi	s0,sp,80
    10b8:	fca43423          	sd	a0,-56(s0)
    10bc:	fcb43023          	sd	a1,-64(s0)
    10c0:	85b2                	mv	a1,a2
    10c2:	8636                	mv	a2,a3
    10c4:	86ba                	mv	a3,a4
    10c6:	873e                	mv	a4,a5
    10c8:	87ae                	mv	a5,a1
    10ca:	faf42e23          	sw	a5,-68(s0)
    10ce:	87b2                	mv	a5,a2
    10d0:	faf42c23          	sw	a5,-72(s0)
    10d4:	87b6                	mv	a5,a3
    10d6:	faf42a23          	sw	a5,-76(s0)
    10da:	87ba                	mv	a5,a4
    10dc:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
    10e0:	08000513          	li	a0,128
    10e4:	00000097          	auipc	ra,0x0
    10e8:	d06080e7          	jalr	-762(ra) # dea <malloc>
    10ec:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
    10f0:	6505                	lui	a0,0x1
    10f2:	00000097          	auipc	ra,0x0
    10f6:	cf8080e7          	jalr	-776(ra) # dea <malloc>
    10fa:	87aa                	mv	a5,a0
    10fc:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
    1100:	fe043703          	ld	a4,-32(s0)
    1104:	6785                	lui	a5,0x1
    1106:	17c1                	addi	a5,a5,-16
    1108:	97ba                	add	a5,a5,a4
    110a:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
    110e:	fe843783          	ld	a5,-24(s0)
    1112:	fc843703          	ld	a4,-56(s0)
    1116:	e398                	sd	a4,0(a5)
    t->arg = arg;
    1118:	fe843783          	ld	a5,-24(s0)
    111c:	fc043703          	ld	a4,-64(s0)
    1120:	e798                	sd	a4,8(a5)
    t->ID = _id++;
    1122:	00001797          	auipc	a5,0x1
    1126:	3a278793          	addi	a5,a5,930 # 24c4 <_id.1241>
    112a:	439c                	lw	a5,0(a5)
    112c:	0017871b          	addiw	a4,a5,1
    1130:	0007069b          	sext.w	a3,a4
    1134:	00001717          	auipc	a4,0x1
    1138:	39070713          	addi	a4,a4,912 # 24c4 <_id.1241>
    113c:	c314                	sw	a3,0(a4)
    113e:	fe843703          	ld	a4,-24(s0)
    1142:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    1144:	fe843783          	ld	a5,-24(s0)
    1148:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    114c:	fe043703          	ld	a4,-32(s0)
    1150:	fe843783          	ld	a5,-24(s0)
    1154:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    1156:	fd843703          	ld	a4,-40(s0)
    115a:	fe843783          	ld	a5,-24(s0)
    115e:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    1160:	fe843783          	ld	a5,-24(s0)
    1164:	fb842703          	lw	a4,-72(s0)
    1168:	c3f8                	sw	a4,68(a5)
    t->period = period;
    116a:	fe843783          	ld	a5,-24(s0)
    116e:	fb442703          	lw	a4,-76(s0)
    1172:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
    1174:	fe843783          	ld	a5,-24(s0)
    1178:	fb442703          	lw	a4,-76(s0)
    117c:	c7b8                	sw	a4,72(a5)
    t->n = n;
    117e:	fe843783          	ld	a5,-24(s0)
    1182:	fb042703          	lw	a4,-80(s0)
    1186:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    1188:	fe843783          	ld	a5,-24(s0)
    118c:	fbc42703          	lw	a4,-68(s0)
    1190:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    1192:	fe843783          	ld	a5,-24(s0)
    1196:	fb842703          	lw	a4,-72(s0)
    119a:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    119c:	fe843783          	ld	a5,-24(s0)
    11a0:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    11a4:	fe843783          	ld	a5,-24(s0)
    11a8:	06400713          	li	a4,100
    11ac:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    11ae:	fe843783          	ld	a5,-24(s0)
    11b2:	671d                	lui	a4,0x7
    11b4:	5307071b          	addiw	a4,a4,1328
    11b8:	d3b8                	sw	a4,96(a5)
    
    return t;
    11ba:	fe843783          	ld	a5,-24(s0)
}
    11be:	853e                	mv	a0,a5
    11c0:	60a6                	ld	ra,72(sp)
    11c2:	6406                	ld	s0,64(sp)
    11c4:	6161                	addi	sp,sp,80
    11c6:	8082                	ret

00000000000011c8 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    11c8:	1101                	addi	sp,sp,-32
    11ca:	ec22                	sd	s0,24(sp)
    11cc:	1000                	addi	s0,sp,32
    11ce:	fea43423          	sd	a0,-24(s0)
    11d2:	87ae                	mv	a5,a1
    11d4:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    11d8:	fe843783          	ld	a5,-24(s0)
    11dc:	fe442703          	lw	a4,-28(s0)
    11e0:	cff8                	sw	a4,92(a5)
}
    11e2:	0001                	nop
    11e4:	6462                	ld	s0,24(sp)
    11e6:	6105                	addi	sp,sp,32
    11e8:	8082                	ret

00000000000011ea <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    11ea:	1101                	addi	sp,sp,-32
    11ec:	ec22                	sd	s0,24(sp)
    11ee:	1000                	addi	s0,sp,32
    11f0:	fea43423          	sd	a0,-24(s0)
    11f4:	87ae                	mv	a5,a1
    11f6:	8732                	mv	a4,a2
    11f8:	fef42223          	sw	a5,-28(s0)
    11fc:	87ba                	mv	a5,a4
    11fe:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    1202:	fe843783          	ld	a5,-24(s0)
    1206:	fe442703          	lw	a4,-28(s0)
    120a:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    120c:	fe843783          	ld	a5,-24(s0)
    1210:	fe442703          	lw	a4,-28(s0)
    1214:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    1216:	fe843783          	ld	a5,-24(s0)
    121a:	fe042703          	lw	a4,-32(s0)
    121e:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    1220:	fe843783          	ld	a5,-24(s0)
    1224:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1228:	fe843783          	ld	a5,-24(s0)
    122c:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    1230:	fe843783          	ld	a5,-24(s0)
    1234:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    1238:	fe843783          	ld	a5,-24(s0)
    123c:	0607ae23          	sw	zero,124(a5)
}
    1240:	0001                	nop
    1242:	6462                	ld	s0,24(sp)
    1244:	6105                	addi	sp,sp,32
    1246:	8082                	ret

0000000000001248 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    1248:	7179                	addi	sp,sp,-48
    124a:	f406                	sd	ra,40(sp)
    124c:	f022                	sd	s0,32(sp)
    124e:	1800                	addi	s0,sp,48
    1250:	fca43c23          	sd	a0,-40(s0)
    1254:	87ae                	mv	a5,a1
    1256:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    125a:	02000513          	li	a0,32
    125e:	00000097          	auipc	ra,0x0
    1262:	b8c080e7          	jalr	-1140(ra) # dea <malloc>
    1266:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    126a:	fe843783          	ld	a5,-24(s0)
    126e:	fd843703          	ld	a4,-40(s0)
    1272:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    1274:	fe843783          	ld	a5,-24(s0)
    1278:	fd442703          	lw	a4,-44(s0)
    127c:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    127e:	fd843783          	ld	a5,-40(s0)
    1282:	fd442703          	lw	a4,-44(s0)
    1286:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    1288:	fd843783          	ld	a5,-40(s0)
    128c:	43bc                	lw	a5,64(a5)
    128e:	cf81                	beqz	a5,12a6 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    1290:	fd843783          	ld	a5,-40(s0)
    1294:	47bc                	lw	a5,72(a5)
    1296:	fd442703          	lw	a4,-44(s0)
    129a:	9fb9                	addw	a5,a5,a4
    129c:	0007871b          	sext.w	a4,a5
    12a0:	fd843783          	ld	a5,-40(s0)
    12a4:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    12a6:	fe843783          	ld	a5,-24(s0)
    12aa:	07a1                	addi	a5,a5,8
    12ac:	00001597          	auipc	a1,0x1
    12b0:	20458593          	addi	a1,a1,516 # 24b0 <release_queue>
    12b4:	853e                	mv	a0,a5
    12b6:	00000097          	auipc	ra,0x0
    12ba:	d2a080e7          	jalr	-726(ra) # fe0 <list_add_tail>
}
    12be:	0001                	nop
    12c0:	70a2                	ld	ra,40(sp)
    12c2:	7402                	ld	s0,32(sp)
    12c4:	6145                	addi	sp,sp,48
    12c6:	8082                	ret

00000000000012c8 <__release>:

void __release()
{
    12c8:	7139                	addi	sp,sp,-64
    12ca:	fc06                	sd	ra,56(sp)
    12cc:	f822                	sd	s0,48(sp)
    12ce:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    12d0:	00001797          	auipc	a5,0x1
    12d4:	1e078793          	addi	a5,a5,480 # 24b0 <release_queue>
    12d8:	639c                	ld	a5,0(a5)
    12da:	fcf43c23          	sd	a5,-40(s0)
    12de:	fd843783          	ld	a5,-40(s0)
    12e2:	17e1                	addi	a5,a5,-8
    12e4:	fef43423          	sd	a5,-24(s0)
    12e8:	fe843783          	ld	a5,-24(s0)
    12ec:	679c                	ld	a5,8(a5)
    12ee:	fcf43823          	sd	a5,-48(s0)
    12f2:	fd043783          	ld	a5,-48(s0)
    12f6:	17e1                	addi	a5,a5,-8
    12f8:	fef43023          	sd	a5,-32(s0)
    12fc:	a0e9                	j	13c6 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    12fe:	fe843783          	ld	a5,-24(s0)
    1302:	4f98                	lw	a4,24(a5)
    1304:	00001797          	auipc	a5,0x1
    1308:	3ec78793          	addi	a5,a5,1004 # 26f0 <threading_system_time>
    130c:	439c                	lw	a5,0(a5)
    130e:	08e7ce63          	blt	a5,a4,13aa <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    1312:	fe843783          	ld	a5,-24(s0)
    1316:	639c                	ld	a5,0(a5)
    1318:	5bbc                	lw	a5,112(a5)
    131a:	c79d                	beqz	a5,1348 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    131c:	fe843783          	ld	a5,-24(s0)
    1320:	639c                	ld	a5,0(a5)
    1322:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    1326:	fe843783          	ld	a5,-24(s0)
    132a:	6398                	ld	a4,0(a5)
    132c:	fe843783          	ld	a5,-24(s0)
    1330:	639c                	ld	a5,0(a5)
    1332:	5378                	lw	a4,100(a4)
    1334:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    1336:	fe843783          	ld	a5,-24(s0)
    133a:	6398                	ld	a4,0(a5)
    133c:	fe843783          	ld	a5,-24(s0)
    1340:	639c                	ld	a5,0(a5)
    1342:	5f78                	lw	a4,124(a4)
    1344:	cbf8                	sw	a4,84(a5)
    1346:	a809                	j	1358 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    1348:	fe843783          	ld	a5,-24(s0)
    134c:	6398                	ld	a4,0(a5)
    134e:	fe843783          	ld	a5,-24(s0)
    1352:	639c                	ld	a5,0(a5)
    1354:	4378                	lw	a4,68(a4)
    1356:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    1358:	fe843783          	ld	a5,-24(s0)
    135c:	4f94                	lw	a3,24(a5)
    135e:	fe843783          	ld	a5,-24(s0)
    1362:	639c                	ld	a5,0(a5)
    1364:	47b8                	lw	a4,72(a5)
    1366:	fe843783          	ld	a5,-24(s0)
    136a:	639c                	ld	a5,0(a5)
    136c:	9f35                	addw	a4,a4,a3
    136e:	2701                	sext.w	a4,a4
    1370:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    1372:	fe843783          	ld	a5,-24(s0)
    1376:	639c                	ld	a5,0(a5)
    1378:	02878793          	addi	a5,a5,40
    137c:	00001597          	auipc	a1,0x1
    1380:	12458593          	addi	a1,a1,292 # 24a0 <run_queue>
    1384:	853e                	mv	a0,a5
    1386:	00000097          	auipc	ra,0x0
    138a:	c5a080e7          	jalr	-934(ra) # fe0 <list_add_tail>
            list_del(&cur->thread_list);
    138e:	fe843783          	ld	a5,-24(s0)
    1392:	07a1                	addi	a5,a5,8
    1394:	853e                	mv	a0,a5
    1396:	00000097          	auipc	ra,0x0
    139a:	ca6080e7          	jalr	-858(ra) # 103c <list_del>
            free(cur);
    139e:	fe843503          	ld	a0,-24(s0)
    13a2:	00000097          	auipc	ra,0x0
    13a6:	8a6080e7          	jalr	-1882(ra) # c48 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    13aa:	fe043783          	ld	a5,-32(s0)
    13ae:	fef43423          	sd	a5,-24(s0)
    13b2:	fe043783          	ld	a5,-32(s0)
    13b6:	679c                	ld	a5,8(a5)
    13b8:	fcf43423          	sd	a5,-56(s0)
    13bc:	fc843783          	ld	a5,-56(s0)
    13c0:	17e1                	addi	a5,a5,-8
    13c2:	fef43023          	sd	a5,-32(s0)
    13c6:	fe843783          	ld	a5,-24(s0)
    13ca:	00878713          	addi	a4,a5,8
    13ce:	00001797          	auipc	a5,0x1
    13d2:	0e278793          	addi	a5,a5,226 # 24b0 <release_queue>
    13d6:	f2f714e3          	bne	a4,a5,12fe <__release+0x36>
        }
    }
}
    13da:	0001                	nop
    13dc:	0001                	nop
    13de:	70e2                	ld	ra,56(sp)
    13e0:	7442                	ld	s0,48(sp)
    13e2:	6121                	addi	sp,sp,64
    13e4:	8082                	ret

00000000000013e6 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    13e6:	1101                	addi	sp,sp,-32
    13e8:	ec06                	sd	ra,24(sp)
    13ea:	e822                	sd	s0,16(sp)
    13ec:	1000                	addi	s0,sp,32
    13ee:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    13f2:	fe843783          	ld	a5,-24(s0)
    13f6:	7b98                	ld	a4,48(a5)
    13f8:	00001797          	auipc	a5,0x1
    13fc:	2f078793          	addi	a5,a5,752 # 26e8 <current>
    1400:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    1402:	fe843783          	ld	a5,-24(s0)
    1406:	02878793          	addi	a5,a5,40
    140a:	853e                	mv	a0,a5
    140c:	00000097          	auipc	ra,0x0
    1410:	c30080e7          	jalr	-976(ra) # 103c <list_del>

    free(to_remove->stack);
    1414:	fe843783          	ld	a5,-24(s0)
    1418:	6b9c                	ld	a5,16(a5)
    141a:	853e                	mv	a0,a5
    141c:	00000097          	auipc	ra,0x0
    1420:	82c080e7          	jalr	-2004(ra) # c48 <free>
    free(to_remove);
    1424:	fe843503          	ld	a0,-24(s0)
    1428:	00000097          	auipc	ra,0x0
    142c:	820080e7          	jalr	-2016(ra) # c48 <free>

    __schedule();
    1430:	00000097          	auipc	ra,0x0
    1434:	5e8080e7          	jalr	1512(ra) # 1a18 <__schedule>
    __dispatch();
    1438:	00000097          	auipc	ra,0x0
    143c:	416080e7          	jalr	1046(ra) # 184e <__dispatch>
    thrdresume(main_thrd_id);
    1440:	00001797          	auipc	a5,0x1
    1444:	08078793          	addi	a5,a5,128 # 24c0 <main_thrd_id>
    1448:	439c                	lw	a5,0(a5)
    144a:	853e                	mv	a0,a5
    144c:	fffff097          	auipc	ra,0xfffff
    1450:	30e080e7          	jalr	782(ra) # 75a <thrdresume>
}
    1454:	0001                	nop
    1456:	60e2                	ld	ra,24(sp)
    1458:	6442                	ld	s0,16(sp)
    145a:	6105                	addi	sp,sp,32
    145c:	8082                	ret

000000000000145e <thread_exit>:

void thread_exit(void)
{
    145e:	7179                	addi	sp,sp,-48
    1460:	f406                	sd	ra,40(sp)
    1462:	f022                	sd	s0,32(sp)
    1464:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1466:	00001797          	auipc	a5,0x1
    146a:	28278793          	addi	a5,a5,642 # 26e8 <current>
    146e:	6398                	ld	a4,0(a5)
    1470:	00001797          	auipc	a5,0x1
    1474:	03078793          	addi	a5,a5,48 # 24a0 <run_queue>
    1478:	02f71063          	bne	a4,a5,1498 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    147c:	00001597          	auipc	a1,0x1
    1480:	d9458593          	addi	a1,a1,-620 # 2210 <schedule_edf_cbs+0x522>
    1484:	4509                	li	a0,2
    1486:	fffff097          	auipc	ra,0xfffff
    148a:	71a080e7          	jalr	1818(ra) # ba0 <fprintf>
        exit(1);
    148e:	4505                	li	a0,1
    1490:	fffff097          	auipc	ra,0xfffff
    1494:	222080e7          	jalr	546(ra) # 6b2 <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    1498:	00001797          	auipc	a5,0x1
    149c:	25078793          	addi	a5,a5,592 # 26e8 <current>
    14a0:	639c                	ld	a5,0(a5)
    14a2:	fef43423          	sd	a5,-24(s0)
    14a6:	fe843783          	ld	a5,-24(s0)
    14aa:	fd878793          	addi	a5,a5,-40
    14ae:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    14b2:	fe043783          	ld	a5,-32(s0)
    14b6:	5f9c                	lw	a5,56(a5)
    14b8:	4585                	li	a1,1
    14ba:	853e                	mv	a0,a5
    14bc:	fffff097          	auipc	ra,0xfffff
    14c0:	2a6080e7          	jalr	678(ra) # 762 <cancelthrdstop>
    14c4:	87aa                	mv	a5,a0
    14c6:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    14ca:	00001797          	auipc	a5,0x1
    14ce:	22678793          	addi	a5,a5,550 # 26f0 <threading_system_time>
    14d2:	439c                	lw	a5,0(a5)
    14d4:	fdc42703          	lw	a4,-36(s0)
    14d8:	9fb9                	addw	a5,a5,a4
    14da:	0007871b          	sext.w	a4,a5
    14de:	00001797          	auipc	a5,0x1
    14e2:	21278793          	addi	a5,a5,530 # 26f0 <threading_system_time>
    14e6:	c398                	sw	a4,0(a5)

    __release();
    14e8:	00000097          	auipc	ra,0x0
    14ec:	de0080e7          	jalr	-544(ra) # 12c8 <__release>
    __thread_exit(to_remove);
    14f0:	fe043503          	ld	a0,-32(s0)
    14f4:	00000097          	auipc	ra,0x0
    14f8:	ef2080e7          	jalr	-270(ra) # 13e6 <__thread_exit>
}
    14fc:	0001                	nop
    14fe:	70a2                	ld	ra,40(sp)
    1500:	7402                	ld	s0,32(sp)
    1502:	6145                	addi	sp,sp,48
    1504:	8082                	ret

0000000000001506 <__finish_current>:

void __finish_current()
{
    1506:	7179                	addi	sp,sp,-48
    1508:	f406                	sd	ra,40(sp)
    150a:	f022                	sd	s0,32(sp)
    150c:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    150e:	00001797          	auipc	a5,0x1
    1512:	1da78793          	addi	a5,a5,474 # 26e8 <current>
    1516:	639c                	ld	a5,0(a5)
    1518:	fef43423          	sd	a5,-24(s0)
    151c:	fe843783          	ld	a5,-24(s0)
    1520:	fd878793          	addi	a5,a5,-40
    1524:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1528:	fe043783          	ld	a5,-32(s0)
    152c:	4bbc                	lw	a5,80(a5)
    152e:	37fd                	addiw	a5,a5,-1
    1530:	0007871b          	sext.w	a4,a5
    1534:	fe043783          	ld	a5,-32(s0)
    1538:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    153a:	fe043783          	ld	a5,-32(s0)
    153e:	5fd8                	lw	a4,60(a5)
    1540:	00001797          	auipc	a5,0x1
    1544:	1b078793          	addi	a5,a5,432 # 26f0 <threading_system_time>
    1548:	4390                	lw	a2,0(a5)
    154a:	fe043783          	ld	a5,-32(s0)
    154e:	4bbc                	lw	a5,80(a5)
    1550:	86be                	mv	a3,a5
    1552:	85ba                	mv	a1,a4
    1554:	00001517          	auipc	a0,0x1
    1558:	cf450513          	addi	a0,a0,-780 # 2248 <schedule_edf_cbs+0x55a>
    155c:	fffff097          	auipc	ra,0xfffff
    1560:	69c080e7          	jalr	1692(ra) # bf8 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1564:	fe043783          	ld	a5,-32(s0)
    1568:	4bbc                	lw	a5,80(a5)
    156a:	04f05563          	blez	a5,15b4 <__finish_current+0xae>
        struct list_head *to_remove = current;
    156e:	00001797          	auipc	a5,0x1
    1572:	17a78793          	addi	a5,a5,378 # 26e8 <current>
    1576:	639c                	ld	a5,0(a5)
    1578:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    157c:	00001797          	auipc	a5,0x1
    1580:	16c78793          	addi	a5,a5,364 # 26e8 <current>
    1584:	639c                	ld	a5,0(a5)
    1586:	6798                	ld	a4,8(a5)
    1588:	00001797          	auipc	a5,0x1
    158c:	16078793          	addi	a5,a5,352 # 26e8 <current>
    1590:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1592:	fd843503          	ld	a0,-40(s0)
    1596:	00000097          	auipc	ra,0x0
    159a:	aa6080e7          	jalr	-1370(ra) # 103c <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    159e:	fe043783          	ld	a5,-32(s0)
    15a2:	4fbc                	lw	a5,88(a5)
    15a4:	85be                	mv	a1,a5
    15a6:	fe043503          	ld	a0,-32(s0)
    15aa:	00000097          	auipc	ra,0x0
    15ae:	c9e080e7          	jalr	-866(ra) # 1248 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    15b2:	a039                	j	15c0 <__finish_current+0xba>
        __thread_exit(current_thread);
    15b4:	fe043503          	ld	a0,-32(s0)
    15b8:	00000097          	auipc	ra,0x0
    15bc:	e2e080e7          	jalr	-466(ra) # 13e6 <__thread_exit>
}
    15c0:	0001                	nop
    15c2:	70a2                	ld	ra,40(sp)
    15c4:	7402                	ld	s0,32(sp)
    15c6:	6145                	addi	sp,sp,48
    15c8:	8082                	ret

00000000000015ca <__rt_finish_current>:
void __rt_finish_current()
{
    15ca:	7179                	addi	sp,sp,-48
    15cc:	f406                	sd	ra,40(sp)
    15ce:	f022                	sd	s0,32(sp)
    15d0:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    15d2:	00001797          	auipc	a5,0x1
    15d6:	11678793          	addi	a5,a5,278 # 26e8 <current>
    15da:	639c                	ld	a5,0(a5)
    15dc:	fef43423          	sd	a5,-24(s0)
    15e0:	fe843783          	ld	a5,-24(s0)
    15e4:	fd878793          	addi	a5,a5,-40
    15e8:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    15ec:	fe043783          	ld	a5,-32(s0)
    15f0:	4bbc                	lw	a5,80(a5)
    15f2:	37fd                	addiw	a5,a5,-1
    15f4:	0007871b          	sext.w	a4,a5
    15f8:	fe043783          	ld	a5,-32(s0)
    15fc:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    15fe:	fe043783          	ld	a5,-32(s0)
    1602:	5fd8                	lw	a4,60(a5)
    1604:	00001797          	auipc	a5,0x1
    1608:	0ec78793          	addi	a5,a5,236 # 26f0 <threading_system_time>
    160c:	4390                	lw	a2,0(a5)
    160e:	fe043783          	ld	a5,-32(s0)
    1612:	4bbc                	lw	a5,80(a5)
    1614:	86be                	mv	a3,a5
    1616:	85ba                	mv	a1,a4
    1618:	00001517          	auipc	a0,0x1
    161c:	c4850513          	addi	a0,a0,-952 # 2260 <schedule_edf_cbs+0x572>
    1620:	fffff097          	auipc	ra,0xfffff
    1624:	5d8080e7          	jalr	1496(ra) # bf8 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1628:	fe043783          	ld	a5,-32(s0)
    162c:	4bbc                	lw	a5,80(a5)
    162e:	04f05f63          	blez	a5,168c <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    1632:	00001797          	auipc	a5,0x1
    1636:	0b678793          	addi	a5,a5,182 # 26e8 <current>
    163a:	639c                	ld	a5,0(a5)
    163c:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1640:	00001797          	auipc	a5,0x1
    1644:	0a878793          	addi	a5,a5,168 # 26e8 <current>
    1648:	639c                	ld	a5,0(a5)
    164a:	6798                	ld	a4,8(a5)
    164c:	00001797          	auipc	a5,0x1
    1650:	09c78793          	addi	a5,a5,156 # 26e8 <current>
    1654:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1656:	fd843503          	ld	a0,-40(s0)
    165a:	00000097          	auipc	ra,0x0
    165e:	9e2080e7          	jalr	-1566(ra) # 103c <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    1662:	fe043783          	ld	a5,-32(s0)
    1666:	4fbc                	lw	a5,88(a5)
    1668:	85be                	mv	a1,a5
    166a:	fe043503          	ld	a0,-32(s0)
    166e:	00000097          	auipc	ra,0x0
    1672:	bda080e7          	jalr	-1062(ra) # 1248 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    1676:	fe043783          	ld	a5,-32(s0)
    167a:	57fc                	lw	a5,108(a5)
    167c:	ef91                	bnez	a5,1698 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    167e:	fe043783          	ld	a5,-32(s0)
    1682:	53f8                	lw	a4,100(a5)
    1684:	fe043783          	ld	a5,-32(s0)
    1688:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    168a:	a039                	j	1698 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    168c:	fe043503          	ld	a0,-32(s0)
    1690:	00000097          	auipc	ra,0x0
    1694:	d56080e7          	jalr	-682(ra) # 13e6 <__thread_exit>
}
    1698:	0001                	nop
    169a:	70a2                	ld	ra,40(sp)
    169c:	7402                	ld	s0,32(sp)
    169e:	6145                	addi	sp,sp,48
    16a0:	8082                	ret

00000000000016a2 <switch_handler>:

void switch_handler(void *arg)
{
    16a2:	7139                	addi	sp,sp,-64
    16a4:	fc06                	sd	ra,56(sp)
    16a6:	f822                	sd	s0,48(sp)
    16a8:	0080                	addi	s0,sp,64
    16aa:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    16ae:	fc843783          	ld	a5,-56(s0)
    16b2:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    16b6:	00001797          	auipc	a5,0x1
    16ba:	03278793          	addi	a5,a5,50 # 26e8 <current>
    16be:	639c                	ld	a5,0(a5)
    16c0:	fef43023          	sd	a5,-32(s0)
    16c4:	fe043783          	ld	a5,-32(s0)
    16c8:	fd878793          	addi	a5,a5,-40
    16cc:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    16d0:	fe843783          	ld	a5,-24(s0)
    16d4:	0007871b          	sext.w	a4,a5
    16d8:	00001797          	auipc	a5,0x1
    16dc:	01878793          	addi	a5,a5,24 # 26f0 <threading_system_time>
    16e0:	439c                	lw	a5,0(a5)
    16e2:	2781                	sext.w	a5,a5
    16e4:	9fb9                	addw	a5,a5,a4
    16e6:	2781                	sext.w	a5,a5
    16e8:	0007871b          	sext.w	a4,a5
    16ec:	00001797          	auipc	a5,0x1
    16f0:	00478793          	addi	a5,a5,4 # 26f0 <threading_system_time>
    16f4:	c398                	sw	a4,0(a5)
     __release();
    16f6:	00000097          	auipc	ra,0x0
    16fa:	bd2080e7          	jalr	-1070(ra) # 12c8 <__release>
    current_thread->remaining_time -= elapsed_time;
    16fe:	fd843783          	ld	a5,-40(s0)
    1702:	4bfc                	lw	a5,84(a5)
    1704:	0007871b          	sext.w	a4,a5
    1708:	fe843783          	ld	a5,-24(s0)
    170c:	2781                	sext.w	a5,a5
    170e:	40f707bb          	subw	a5,a4,a5
    1712:	2781                	sext.w	a5,a5
    1714:	0007871b          	sext.w	a4,a5
    1718:	fd843783          	ld	a5,-40(s0)
    171c:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    171e:	fd843783          	ld	a5,-40(s0)
    1722:	57fc                	lw	a5,108(a5)
    1724:	e38d                	bnez	a5,1746 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    1726:	fd843783          	ld	a5,-40(s0)
    172a:	57bc                	lw	a5,104(a5)
    172c:	0007871b          	sext.w	a4,a5
    1730:	fe843783          	ld	a5,-24(s0)
    1734:	2781                	sext.w	a5,a5
    1736:	40f707bb          	subw	a5,a4,a5
    173a:	2781                	sext.w	a5,a5
    173c:	0007871b          	sext.w	a4,a5
    1740:	fd843783          	ld	a5,-40(s0)
    1744:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    1746:	fd843783          	ld	a5,-40(s0)
    174a:	43bc                	lw	a5,64(a5)
    174c:	c3ad                	beqz	a5,17ae <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    174e:	fd843783          	ld	a5,-40(s0)
    1752:	4fb8                	lw	a4,88(a5)
    1754:	00001797          	auipc	a5,0x1
    1758:	f9c78793          	addi	a5,a5,-100 # 26f0 <threading_system_time>
    175c:	439c                	lw	a5,0(a5)
    175e:	02f74163          	blt	a4,a5,1780 <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1762:	fd843783          	ld	a5,-40(s0)
    1766:	4fb8                	lw	a4,88(a5)
    1768:	00001797          	auipc	a5,0x1
    176c:	f8878793          	addi	a5,a5,-120 # 26f0 <threading_system_time>
    1770:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    1772:	02f71e63          	bne	a4,a5,17ae <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1776:	fd843783          	ld	a5,-40(s0)
    177a:	4bfc                	lw	a5,84(a5)
    177c:	02f05963          	blez	a5,17ae <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    1780:	fd843783          	ld	a5,-40(s0)
    1784:	5fd8                	lw	a4,60(a5)
    1786:	00001797          	auipc	a5,0x1
    178a:	f6a78793          	addi	a5,a5,-150 # 26f0 <threading_system_time>
    178e:	439c                	lw	a5,0(a5)
    1790:	863e                	mv	a2,a5
    1792:	85ba                	mv	a1,a4
    1794:	00001517          	auipc	a0,0x1
    1798:	b0450513          	addi	a0,a0,-1276 # 2298 <schedule_edf_cbs+0x5aa>
    179c:	fffff097          	auipc	ra,0xfffff
    17a0:	45c080e7          	jalr	1116(ra) # bf8 <printf>
            exit(0);
    17a4:	4501                	li	a0,0
    17a6:	fffff097          	auipc	ra,0xfffff
    17aa:	f0c080e7          	jalr	-244(ra) # 6b2 <exit>
        }

    if (current_thread->remaining_time <= 0) {
    17ae:	fd843783          	ld	a5,-40(s0)
    17b2:	4bfc                	lw	a5,84(a5)
    17b4:	02f04063          	bgtz	a5,17d4 <switch_handler+0x132>
        if (current_thread->is_real_time)
    17b8:	fd843783          	ld	a5,-40(s0)
    17bc:	43bc                	lw	a5,64(a5)
    17be:	c791                	beqz	a5,17ca <switch_handler+0x128>
            __rt_finish_current();
    17c0:	00000097          	auipc	ra,0x0
    17c4:	e0a080e7          	jalr	-502(ra) # 15ca <__rt_finish_current>
    17c8:	a881                	j	1818 <switch_handler+0x176>
        else
            __finish_current();
    17ca:	00000097          	auipc	ra,0x0
    17ce:	d3c080e7          	jalr	-708(ra) # 1506 <__finish_current>
    17d2:	a099                	j	1818 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    17d4:	00001797          	auipc	a5,0x1
    17d8:	f1478793          	addi	a5,a5,-236 # 26e8 <current>
    17dc:	639c                	ld	a5,0(a5)
    17de:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    17e2:	00001797          	auipc	a5,0x1
    17e6:	f0678793          	addi	a5,a5,-250 # 26e8 <current>
    17ea:	639c                	ld	a5,0(a5)
    17ec:	6798                	ld	a4,8(a5)
    17ee:	00001797          	auipc	a5,0x1
    17f2:	efa78793          	addi	a5,a5,-262 # 26e8 <current>
    17f6:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    17f8:	fd043503          	ld	a0,-48(s0)
    17fc:	00000097          	auipc	ra,0x0
    1800:	840080e7          	jalr	-1984(ra) # 103c <list_del>
        list_add_tail(to_remove, &run_queue);
    1804:	00001597          	auipc	a1,0x1
    1808:	c9c58593          	addi	a1,a1,-868 # 24a0 <run_queue>
    180c:	fd043503          	ld	a0,-48(s0)
    1810:	fffff097          	auipc	ra,0xfffff
    1814:	7d0080e7          	jalr	2000(ra) # fe0 <list_add_tail>
    }

    __release();
    1818:	00000097          	auipc	ra,0x0
    181c:	ab0080e7          	jalr	-1360(ra) # 12c8 <__release>
    __schedule();
    1820:	00000097          	auipc	ra,0x0
    1824:	1f8080e7          	jalr	504(ra) # 1a18 <__schedule>
    __dispatch();
    1828:	00000097          	auipc	ra,0x0
    182c:	026080e7          	jalr	38(ra) # 184e <__dispatch>
    thrdresume(main_thrd_id);
    1830:	00001797          	auipc	a5,0x1
    1834:	c9078793          	addi	a5,a5,-880 # 24c0 <main_thrd_id>
    1838:	439c                	lw	a5,0(a5)
    183a:	853e                	mv	a0,a5
    183c:	fffff097          	auipc	ra,0xfffff
    1840:	f1e080e7          	jalr	-226(ra) # 75a <thrdresume>
}
    1844:	0001                	nop
    1846:	70e2                	ld	ra,56(sp)
    1848:	7442                	ld	s0,48(sp)
    184a:	6121                	addi	sp,sp,64
    184c:	8082                	ret

000000000000184e <__dispatch>:

void __dispatch()
{
    184e:	7179                	addi	sp,sp,-48
    1850:	f406                	sd	ra,40(sp)
    1852:	f022                	sd	s0,32(sp)
    1854:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1856:	00001797          	auipc	a5,0x1
    185a:	e9278793          	addi	a5,a5,-366 # 26e8 <current>
    185e:	6398                	ld	a4,0(a5)
    1860:	00001797          	auipc	a5,0x1
    1864:	c4078793          	addi	a5,a5,-960 # 24a0 <run_queue>
    1868:	1af70363          	beq	a4,a5,1a0e <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    186c:	00001797          	auipc	a5,0x1
    1870:	e7c78793          	addi	a5,a5,-388 # 26e8 <current>
    1874:	639c                	ld	a5,0(a5)
    1876:	fef43423          	sd	a5,-24(s0)
    187a:	fe843783          	ld	a5,-24(s0)
    187e:	fd878793          	addi	a5,a5,-40
    1882:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    1886:	fe043783          	ld	a5,-32(s0)
    188a:	5fcc                	lw	a1,60(a5)
    188c:	00001797          	auipc	a5,0x1
    1890:	e6478793          	addi	a5,a5,-412 # 26f0 <threading_system_time>
    1894:	4390                	lw	a2,0(a5)
    1896:	00001797          	auipc	a5,0x1
    189a:	e6278793          	addi	a5,a5,-414 # 26f8 <allocated_time>
    189e:	6394                	ld	a3,0(a5)
    18a0:	fe043783          	ld	a5,-32(s0)
    18a4:	4bfc                	lw	a5,84(a5)
    18a6:	873e                	mv	a4,a5
    18a8:	00001517          	auipc	a0,0x1
    18ac:	a2050513          	addi	a0,a0,-1504 # 22c8 <schedule_edf_cbs+0x5da>
    18b0:	fffff097          	auipc	ra,0xfffff
    18b4:	348080e7          	jalr	840(ra) # bf8 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    18b8:	fe043783          	ld	a5,-32(s0)
    18bc:	43bc                	lw	a5,64(a5)
    18be:	c3a1                	beqz	a5,18fe <__dispatch+0xb0>
    18c0:	00001797          	auipc	a5,0x1
    18c4:	e3878793          	addi	a5,a5,-456 # 26f8 <allocated_time>
    18c8:	639c                	ld	a5,0(a5)
    18ca:	eb95                	bnez	a5,18fe <__dispatch+0xb0>
    18cc:	fe043783          	ld	a5,-32(s0)
    18d0:	57fc                	lw	a5,108(a5)
    18d2:	c795                	beqz	a5,18fe <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    18d4:	fe043783          	ld	a5,-32(s0)
    18d8:	5fd8                	lw	a4,60(a5)
    18da:	fe043783          	ld	a5,-32(s0)
    18de:	4fbc                	lw	a5,88(a5)
    18e0:	863e                	mv	a2,a5
    18e2:	85ba                	mv	a1,a4
    18e4:	00001517          	auipc	a0,0x1
    18e8:	a3450513          	addi	a0,a0,-1484 # 2318 <schedule_edf_cbs+0x62a>
    18ec:	fffff097          	auipc	ra,0xfffff
    18f0:	30c080e7          	jalr	780(ra) # bf8 <printf>
        exit(0);
    18f4:	4501                	li	a0,0
    18f6:	fffff097          	auipc	ra,0xfffff
    18fa:	dbc080e7          	jalr	-580(ra) # 6b2 <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    18fe:	fe043783          	ld	a5,-32(s0)
    1902:	5fd8                	lw	a4,60(a5)
    1904:	00001797          	auipc	a5,0x1
    1908:	dec78793          	addi	a5,a5,-532 # 26f0 <threading_system_time>
    190c:	4390                	lw	a2,0(a5)
    190e:	00001797          	auipc	a5,0x1
    1912:	dea78793          	addi	a5,a5,-534 # 26f8 <allocated_time>
    1916:	639c                	ld	a5,0(a5)
    1918:	86be                	mv	a3,a5
    191a:	85ba                	mv	a1,a4
    191c:	00001517          	auipc	a0,0x1
    1920:	a2c50513          	addi	a0,a0,-1492 # 2348 <schedule_edf_cbs+0x65a>
    1924:	fffff097          	auipc	ra,0xfffff
    1928:	2d4080e7          	jalr	724(ra) # bf8 <printf>

    if (current_thread->buf_set) {
    192c:	fe043783          	ld	a5,-32(s0)
    1930:	539c                	lw	a5,32(a5)
    1932:	c7a1                	beqz	a5,197a <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1934:	00001797          	auipc	a5,0x1
    1938:	dc478793          	addi	a5,a5,-572 # 26f8 <allocated_time>
    193c:	639c                	ld	a5,0(a5)
    193e:	0007871b          	sext.w	a4,a5
    1942:	fe043783          	ld	a5,-32(s0)
    1946:	03878593          	addi	a1,a5,56
    194a:	00001797          	auipc	a5,0x1
    194e:	dae78793          	addi	a5,a5,-594 # 26f8 <allocated_time>
    1952:	639c                	ld	a5,0(a5)
    1954:	86be                	mv	a3,a5
    1956:	00000617          	auipc	a2,0x0
    195a:	d4c60613          	addi	a2,a2,-692 # 16a2 <switch_handler>
    195e:	853a                	mv	a0,a4
    1960:	fffff097          	auipc	ra,0xfffff
    1964:	df2080e7          	jalr	-526(ra) # 752 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    1968:	fe043783          	ld	a5,-32(s0)
    196c:	5f9c                	lw	a5,56(a5)
    196e:	853e                	mv	a0,a5
    1970:	fffff097          	auipc	ra,0xfffff
    1974:	dea080e7          	jalr	-534(ra) # 75a <thrdresume>
    1978:	a071                	j	1a04 <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    197a:	fe043783          	ld	a5,-32(s0)
    197e:	4705                	li	a4,1
    1980:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    1982:	fe043783          	ld	a5,-32(s0)
    1986:	6f9c                	ld	a5,24(a5)
    1988:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    198c:	fe043783          	ld	a5,-32(s0)
    1990:	577d                	li	a4,-1
    1992:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1994:	00001797          	auipc	a5,0x1
    1998:	d6478793          	addi	a5,a5,-668 # 26f8 <allocated_time>
    199c:	639c                	ld	a5,0(a5)
    199e:	0007871b          	sext.w	a4,a5
    19a2:	fe043783          	ld	a5,-32(s0)
    19a6:	03878593          	addi	a1,a5,56
    19aa:	00001797          	auipc	a5,0x1
    19ae:	d4e78793          	addi	a5,a5,-690 # 26f8 <allocated_time>
    19b2:	639c                	ld	a5,0(a5)
    19b4:	86be                	mv	a3,a5
    19b6:	00000617          	auipc	a2,0x0
    19ba:	cec60613          	addi	a2,a2,-788 # 16a2 <switch_handler>
    19be:	853a                	mv	a0,a4
    19c0:	fffff097          	auipc	ra,0xfffff
    19c4:	d92080e7          	jalr	-622(ra) # 752 <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    19c8:	fe043783          	ld	a5,-32(s0)
    19cc:	5f9c                	lw	a5,56(a5)
    19ce:	0207d063          	bgez	a5,19ee <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    19d2:	00001597          	auipc	a1,0x1
    19d6:	9a658593          	addi	a1,a1,-1626 # 2378 <schedule_edf_cbs+0x68a>
    19da:	4509                	li	a0,2
    19dc:	fffff097          	auipc	ra,0xfffff
    19e0:	1c4080e7          	jalr	452(ra) # ba0 <fprintf>
            exit(1);
    19e4:	4505                	li	a0,1
    19e6:	fffff097          	auipc	ra,0xfffff
    19ea:	ccc080e7          	jalr	-820(ra) # 6b2 <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    19ee:	fd843783          	ld	a5,-40(s0)
    19f2:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    19f4:	fe043783          	ld	a5,-32(s0)
    19f8:	6398                	ld	a4,0(a5)
    19fa:	fe043783          	ld	a5,-32(s0)
    19fe:	679c                	ld	a5,8(a5)
    1a00:	853e                	mv	a0,a5
    1a02:	9702                	jalr	a4
    }
    thread_exit();
    1a04:	00000097          	auipc	ra,0x0
    1a08:	a5a080e7          	jalr	-1446(ra) # 145e <thread_exit>
    1a0c:	a011                	j	1a10 <__dispatch+0x1c2>
        return;
    1a0e:	0001                	nop
}
    1a10:	70a2                	ld	ra,40(sp)
    1a12:	7402                	ld	s0,32(sp)
    1a14:	6145                	addi	sp,sp,48
    1a16:	8082                	ret

0000000000001a18 <__schedule>:

void __schedule()
{
    1a18:	711d                	addi	sp,sp,-96
    1a1a:	ec86                	sd	ra,88(sp)
    1a1c:	e8a2                	sd	s0,80(sp)
    1a1e:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    1a20:	00001797          	auipc	a5,0x1
    1a24:	cd078793          	addi	a5,a5,-816 # 26f0 <threading_system_time>
    1a28:	439c                	lw	a5,0(a5)
    1a2a:	fcf42c23          	sw	a5,-40(s0)
    1a2e:	4789                	li	a5,2
    1a30:	fcf42e23          	sw	a5,-36(s0)
    1a34:	00001797          	auipc	a5,0x1
    1a38:	a6c78793          	addi	a5,a5,-1428 # 24a0 <run_queue>
    1a3c:	fef43023          	sd	a5,-32(s0)
    1a40:	00001797          	auipc	a5,0x1
    1a44:	a7078793          	addi	a5,a5,-1424 # 24b0 <release_queue>
    1a48:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    1a4c:	fd843783          	ld	a5,-40(s0)
    1a50:	faf43023          	sd	a5,-96(s0)
    1a54:	fe043783          	ld	a5,-32(s0)
    1a58:	faf43423          	sd	a5,-88(s0)
    1a5c:	fe843783          	ld	a5,-24(s0)
    1a60:	faf43823          	sd	a5,-80(s0)
    1a64:	fa040793          	addi	a5,s0,-96
    1a68:	853e                	mv	a0,a5
    1a6a:	00000097          	auipc	ra,0x0
    1a6e:	284080e7          	jalr	644(ra) # 1cee <schedule_edf_cbs>
    1a72:	872a                	mv	a4,a0
    1a74:	87ae                	mv	a5,a1
    1a76:	fce43423          	sd	a4,-56(s0)
    1a7a:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    1a7e:	fc843703          	ld	a4,-56(s0)
    1a82:	00001797          	auipc	a5,0x1
    1a86:	c6678793          	addi	a5,a5,-922 # 26e8 <current>
    1a8a:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1a8c:	fd042783          	lw	a5,-48(s0)
    1a90:	873e                	mv	a4,a5
    1a92:	00001797          	auipc	a5,0x1
    1a96:	c6678793          	addi	a5,a5,-922 # 26f8 <allocated_time>
    1a9a:	e398                	sd	a4,0(a5)
}
    1a9c:	0001                	nop
    1a9e:	60e6                	ld	ra,88(sp)
    1aa0:	6446                	ld	s0,80(sp)
    1aa2:	6125                	addi	sp,sp,96
    1aa4:	8082                	ret

0000000000001aa6 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    1aa6:	1101                	addi	sp,sp,-32
    1aa8:	ec06                	sd	ra,24(sp)
    1aaa:	e822                	sd	s0,16(sp)
    1aac:	1000                	addi	s0,sp,32
    1aae:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1ab2:	00001797          	auipc	a5,0x1
    1ab6:	c4278793          	addi	a5,a5,-958 # 26f4 <sleeping>
    1aba:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1abe:	fe843783          	ld	a5,-24(s0)
    1ac2:	0007871b          	sext.w	a4,a5
    1ac6:	00001797          	auipc	a5,0x1
    1aca:	c2a78793          	addi	a5,a5,-982 # 26f0 <threading_system_time>
    1ace:	439c                	lw	a5,0(a5)
    1ad0:	2781                	sext.w	a5,a5
    1ad2:	9fb9                	addw	a5,a5,a4
    1ad4:	2781                	sext.w	a5,a5
    1ad6:	0007871b          	sext.w	a4,a5
    1ada:	00001797          	auipc	a5,0x1
    1ade:	c1678793          	addi	a5,a5,-1002 # 26f0 <threading_system_time>
    1ae2:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    1ae4:	00001797          	auipc	a5,0x1
    1ae8:	9dc78793          	addi	a5,a5,-1572 # 24c0 <main_thrd_id>
    1aec:	439c                	lw	a5,0(a5)
    1aee:	853e                	mv	a0,a5
    1af0:	fffff097          	auipc	ra,0xfffff
    1af4:	c6a080e7          	jalr	-918(ra) # 75a <thrdresume>
}
    1af8:	0001                	nop
    1afa:	60e2                	ld	ra,24(sp)
    1afc:	6442                	ld	s0,16(sp)
    1afe:	6105                	addi	sp,sp,32
    1b00:	8082                	ret

0000000000001b02 <thread_start_threading>:

void thread_start_threading()
{
    1b02:	1141                	addi	sp,sp,-16
    1b04:	e406                	sd	ra,8(sp)
    1b06:	e022                	sd	s0,0(sp)
    1b08:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1b0a:	00001797          	auipc	a5,0x1
    1b0e:	be678793          	addi	a5,a5,-1050 # 26f0 <threading_system_time>
    1b12:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    1b16:	00001797          	auipc	a5,0x1
    1b1a:	bd278793          	addi	a5,a5,-1070 # 26e8 <current>
    1b1e:	00001717          	auipc	a4,0x1
    1b22:	98270713          	addi	a4,a4,-1662 # 24a0 <run_queue>
    1b26:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1b28:	4681                	li	a3,0
    1b2a:	00000617          	auipc	a2,0x0
    1b2e:	f7c60613          	addi	a2,a2,-132 # 1aa6 <back_to_main_handler>
    1b32:	00001597          	auipc	a1,0x1
    1b36:	98e58593          	addi	a1,a1,-1650 # 24c0 <main_thrd_id>
    1b3a:	3e800513          	li	a0,1000
    1b3e:	fffff097          	auipc	ra,0xfffff
    1b42:	c14080e7          	jalr	-1004(ra) # 752 <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    1b46:	00001797          	auipc	a5,0x1
    1b4a:	97a78793          	addi	a5,a5,-1670 # 24c0 <main_thrd_id>
    1b4e:	439c                	lw	a5,0(a5)
    1b50:	4581                	li	a1,0
    1b52:	853e                	mv	a0,a5
    1b54:	fffff097          	auipc	ra,0xfffff
    1b58:	c0e080e7          	jalr	-1010(ra) # 762 <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1b5c:	a0c9                	j	1c1e <thread_start_threading+0x11c>
        __release();
    1b5e:	fffff097          	auipc	ra,0xfffff
    1b62:	76a080e7          	jalr	1898(ra) # 12c8 <__release>
        __schedule();
    1b66:	00000097          	auipc	ra,0x0
    1b6a:	eb2080e7          	jalr	-334(ra) # 1a18 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1b6e:	00001797          	auipc	a5,0x1
    1b72:	95278793          	addi	a5,a5,-1710 # 24c0 <main_thrd_id>
    1b76:	439c                	lw	a5,0(a5)
    1b78:	4581                	li	a1,0
    1b7a:	853e                	mv	a0,a5
    1b7c:	fffff097          	auipc	ra,0xfffff
    1b80:	be6080e7          	jalr	-1050(ra) # 762 <cancelthrdstop>
        __dispatch();
    1b84:	00000097          	auipc	ra,0x0
    1b88:	cca080e7          	jalr	-822(ra) # 184e <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1b8c:	00001517          	auipc	a0,0x1
    1b90:	91450513          	addi	a0,a0,-1772 # 24a0 <run_queue>
    1b94:	fffff097          	auipc	ra,0xfffff
    1b98:	4f2080e7          	jalr	1266(ra) # 1086 <list_empty>
    1b9c:	87aa                	mv	a5,a0
    1b9e:	cb99                	beqz	a5,1bb4 <thread_start_threading+0xb2>
    1ba0:	00001517          	auipc	a0,0x1
    1ba4:	91050513          	addi	a0,a0,-1776 # 24b0 <release_queue>
    1ba8:	fffff097          	auipc	ra,0xfffff
    1bac:	4de080e7          	jalr	1246(ra) # 1086 <list_empty>
    1bb0:	87aa                	mv	a5,a0
    1bb2:	ebd9                	bnez	a5,1c48 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1bb4:	00001797          	auipc	a5,0x1
    1bb8:	b4478793          	addi	a5,a5,-1212 # 26f8 <allocated_time>
    1bbc:	639c                	ld	a5,0(a5)
    1bbe:	85be                	mv	a1,a5
    1bc0:	00000517          	auipc	a0,0x0
    1bc4:	7f050513          	addi	a0,a0,2032 # 23b0 <schedule_edf_cbs+0x6c2>
    1bc8:	fffff097          	auipc	ra,0xfffff
    1bcc:	030080e7          	jalr	48(ra) # bf8 <printf>
        sleeping = 1;
    1bd0:	00001797          	auipc	a5,0x1
    1bd4:	b2478793          	addi	a5,a5,-1244 # 26f4 <sleeping>
    1bd8:	4705                	li	a4,1
    1bda:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1bdc:	00001797          	auipc	a5,0x1
    1be0:	b1c78793          	addi	a5,a5,-1252 # 26f8 <allocated_time>
    1be4:	639c                	ld	a5,0(a5)
    1be6:	0007871b          	sext.w	a4,a5
    1bea:	00001797          	auipc	a5,0x1
    1bee:	b0e78793          	addi	a5,a5,-1266 # 26f8 <allocated_time>
    1bf2:	639c                	ld	a5,0(a5)
    1bf4:	86be                	mv	a3,a5
    1bf6:	00000617          	auipc	a2,0x0
    1bfa:	eb060613          	addi	a2,a2,-336 # 1aa6 <back_to_main_handler>
    1bfe:	00001597          	auipc	a1,0x1
    1c02:	8c258593          	addi	a1,a1,-1854 # 24c0 <main_thrd_id>
    1c06:	853a                	mv	a0,a4
    1c08:	fffff097          	auipc	ra,0xfffff
    1c0c:	b4a080e7          	jalr	-1206(ra) # 752 <thrdstop>
        while (sleeping) {
    1c10:	0001                	nop
    1c12:	00001797          	auipc	a5,0x1
    1c16:	ae278793          	addi	a5,a5,-1310 # 26f4 <sleeping>
    1c1a:	439c                	lw	a5,0(a5)
    1c1c:	fbfd                	bnez	a5,1c12 <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1c1e:	00001517          	auipc	a0,0x1
    1c22:	88250513          	addi	a0,a0,-1918 # 24a0 <run_queue>
    1c26:	fffff097          	auipc	ra,0xfffff
    1c2a:	460080e7          	jalr	1120(ra) # 1086 <list_empty>
    1c2e:	87aa                	mv	a5,a0
    1c30:	d79d                	beqz	a5,1b5e <thread_start_threading+0x5c>
    1c32:	00001517          	auipc	a0,0x1
    1c36:	87e50513          	addi	a0,a0,-1922 # 24b0 <release_queue>
    1c3a:	fffff097          	auipc	ra,0xfffff
    1c3e:	44c080e7          	jalr	1100(ra) # 1086 <list_empty>
    1c42:	87aa                	mv	a5,a0
    1c44:	df89                	beqz	a5,1b5e <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1c46:	a011                	j	1c4a <thread_start_threading+0x148>
            break;
    1c48:	0001                	nop
}
    1c4a:	0001                	nop
    1c4c:	60a2                	ld	ra,8(sp)
    1c4e:	6402                	ld	s0,0(sp)
    1c50:	0141                	addi	sp,sp,16
    1c52:	8082                	ret

0000000000001c54 <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1c54:	7139                	addi	sp,sp,-64
    1c56:	fc22                	sd	s0,56(sp)
    1c58:	0080                	addi	s0,sp,64
    1c5a:	fca43423          	sd	a0,-56(s0)
    1c5e:	87ae                	mv	a5,a1
    1c60:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1c64:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1c68:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1c6c:	fc843783          	ld	a5,-56(s0)
    1c70:	639c                	ld	a5,0(a5)
    1c72:	fcf43c23          	sd	a5,-40(s0)
    1c76:	fd843783          	ld	a5,-40(s0)
    1c7a:	fd878793          	addi	a5,a5,-40
    1c7e:	fef43423          	sd	a5,-24(s0)
    1c82:	a881                	j	1cd2 <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1c84:	fe843783          	ld	a5,-24(s0)
    1c88:	4fb8                	lw	a4,88(a5)
    1c8a:	fc442783          	lw	a5,-60(s0)
    1c8e:	2781                	sext.w	a5,a5
    1c90:	02e7c663          	blt	a5,a4,1cbc <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1c94:	fe043783          	ld	a5,-32(s0)
    1c98:	e791                	bnez	a5,1ca4 <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1c9a:	fe843783          	ld	a5,-24(s0)
    1c9e:	fef43023          	sd	a5,-32(s0)
    1ca2:	a829                	j	1cbc <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1ca4:	fe843783          	ld	a5,-24(s0)
    1ca8:	5fd8                	lw	a4,60(a5)
    1caa:	fe043783          	ld	a5,-32(s0)
    1cae:	5fdc                	lw	a5,60(a5)
    1cb0:	00f75663          	bge	a4,a5,1cbc <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1cb4:	fe843783          	ld	a5,-24(s0)
    1cb8:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1cbc:	fe843783          	ld	a5,-24(s0)
    1cc0:	779c                	ld	a5,40(a5)
    1cc2:	fcf43823          	sd	a5,-48(s0)
    1cc6:	fd043783          	ld	a5,-48(s0)
    1cca:	fd878793          	addi	a5,a5,-40
    1cce:	fef43423          	sd	a5,-24(s0)
    1cd2:	fe843783          	ld	a5,-24(s0)
    1cd6:	02878793          	addi	a5,a5,40
    1cda:	fc843703          	ld	a4,-56(s0)
    1cde:	faf713e3          	bne	a4,a5,1c84 <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1ce2:	fe043783          	ld	a5,-32(s0)
}
    1ce6:	853e                	mv	a0,a5
    1ce8:	7462                	ld	s0,56(sp)
    1cea:	6121                	addi	sp,sp,64
    1cec:	8082                	ret

0000000000001cee <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1cee:	7131                	addi	sp,sp,-192
    1cf0:	fd06                	sd	ra,184(sp)
    1cf2:	f922                	sd	s0,176(sp)
    1cf4:	f526                	sd	s1,168(sp)
    1cf6:	f14a                	sd	s2,160(sp)
    1cf8:	ed4e                	sd	s3,152(sp)
    1cfa:	0180                	addi	s0,sp,192
    1cfc:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1cfe:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1d02:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1d06:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1d0a:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1d0e:	649c                	ld	a5,8(s1)
    1d10:	4098                	lw	a4,0(s1)
    1d12:	85ba                	mv	a1,a4
    1d14:	853e                	mv	a0,a5
    1d16:	00000097          	auipc	ra,0x0
    1d1a:	f3e080e7          	jalr	-194(ra) # 1c54 <__check_deadline_miss>
    1d1e:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1d22:	f9843783          	ld	a5,-104(s0)
    1d26:	c7b5                	beqz	a5,1d92 <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1d28:	f9843783          	ld	a5,-104(s0)
    1d2c:	5fdc                	lw	a5,60(a5)
    1d2e:	85be                	mv	a1,a5
    1d30:	00000517          	auipc	a0,0x0
    1d34:	6a850513          	addi	a0,a0,1704 # 23d8 <schedule_edf_cbs+0x6ea>
    1d38:	fffff097          	auipc	ra,0xfffff
    1d3c:	ec0080e7          	jalr	-320(ra) # bf8 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1d40:	f9843783          	ld	a5,-104(s0)
    1d44:	57fc                	lw	a5,108(a5)
    1d46:	c395                	beqz	a5,1d6a <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1d48:	f9843783          	ld	a5,-104(s0)
    1d4c:	02878793          	addi	a5,a5,40
    1d50:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1d54:	f4042423          	sw	zero,-184(s0)
            return r;
    1d58:	f4043783          	ld	a5,-192(s0)
    1d5c:	f4f43823          	sd	a5,-176(s0)
    1d60:	f4843783          	ld	a5,-184(s0)
    1d64:	f4f43c23          	sd	a5,-168(s0)
    1d68:	a13d                	j	2196 <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1d6a:	4098                	lw	a4,0(s1)
    1d6c:	f9843783          	ld	a5,-104(s0)
    1d70:	47fc                	lw	a5,76(a5)
    1d72:	9fb9                	addw	a5,a5,a4
    1d74:	0007871b          	sext.w	a4,a5
    1d78:	f9843783          	ld	a5,-104(s0)
    1d7c:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1d7e:	f9843783          	ld	a5,-104(s0)
    1d82:	53f8                	lw	a4,100(a5)
    1d84:	f9843783          	ld	a5,-104(s0)
    1d88:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1d8a:	f9843783          	ld	a5,-104(s0)
    1d8e:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1d92:	fa043783          	ld	a5,-96(s0)
    1d96:	e7dd                	bnez	a5,1e44 <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1d98:	649c                	ld	a5,8(s1)
    1d9a:	639c                	ld	a5,0(a5)
    1d9c:	f8f43823          	sd	a5,-112(s0)
    1da0:	f9043783          	ld	a5,-112(s0)
    1da4:	fd878793          	addi	a5,a5,-40
    1da8:	faf43c23          	sd	a5,-72(s0)
    1dac:	a069                	j	1e36 <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1dae:	fb843783          	ld	a5,-72(s0)
    1db2:	5fd8                	lw	a4,60(a5)
    1db4:	fb843783          	ld	a5,-72(s0)
    1db8:	5bbc                	lw	a5,112(a5)
    1dba:	863e                	mv	a2,a5
    1dbc:	85ba                	mv	a1,a4
    1dbe:	00000517          	auipc	a0,0x0
    1dc2:	65250513          	addi	a0,a0,1618 # 2410 <schedule_edf_cbs+0x722>
    1dc6:	fffff097          	auipc	ra,0xfffff
    1dca:	e32080e7          	jalr	-462(ra) # bf8 <printf>
            if (next == NULL)
    1dce:	fa043783          	ld	a5,-96(s0)
    1dd2:	e791                	bnez	a5,1dde <schedule_edf_cbs+0xf0>
                next = th;
    1dd4:	fb843783          	ld	a5,-72(s0)
    1dd8:	faf43023          	sd	a5,-96(s0)
    1ddc:	a091                	j	1e20 <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1dde:	fb843783          	ld	a5,-72(s0)
    1de2:	4fb8                	lw	a4,88(a5)
    1de4:	fa043783          	ld	a5,-96(s0)
    1de8:	4fbc                	lw	a5,88(a5)
    1dea:	00f75763          	bge	a4,a5,1df8 <schedule_edf_cbs+0x10a>
                next = th;
    1dee:	fb843783          	ld	a5,-72(s0)
    1df2:	faf43023          	sd	a5,-96(s0)
    1df6:	a02d                	j	1e20 <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1df8:	fb843783          	ld	a5,-72(s0)
    1dfc:	4fb8                	lw	a4,88(a5)
    1dfe:	fa043783          	ld	a5,-96(s0)
    1e02:	4fbc                	lw	a5,88(a5)
    1e04:	00f71e63          	bne	a4,a5,1e20 <schedule_edf_cbs+0x132>
    1e08:	fb843783          	ld	a5,-72(s0)
    1e0c:	5fd8                	lw	a4,60(a5)
    1e0e:	fa043783          	ld	a5,-96(s0)
    1e12:	5fdc                	lw	a5,60(a5)
    1e14:	00f75663          	bge	a4,a5,1e20 <schedule_edf_cbs+0x132>
                next = th;
    1e18:	fb843783          	ld	a5,-72(s0)
    1e1c:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1e20:	fb843783          	ld	a5,-72(s0)
    1e24:	779c                	ld	a5,40(a5)
    1e26:	f8f43423          	sd	a5,-120(s0)
    1e2a:	f8843783          	ld	a5,-120(s0)
    1e2e:	fd878793          	addi	a5,a5,-40
    1e32:	faf43c23          	sd	a5,-72(s0)
    1e36:	fb843783          	ld	a5,-72(s0)
    1e3a:	02878713          	addi	a4,a5,40
    1e3e:	649c                	ld	a5,8(s1)
    1e40:	f6f717e3          	bne	a4,a5,1dae <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1e44:	fa043783          	ld	a5,-96(s0)
    1e48:	5fdc                	lw	a5,60(a5)
    1e4a:	85be                	mv	a1,a5
    1e4c:	00000517          	auipc	a0,0x0
    1e50:	5fc50513          	addi	a0,a0,1532 # 2448 <schedule_edf_cbs+0x75a>
    1e54:	fffff097          	auipc	ra,0xfffff
    1e58:	da4080e7          	jalr	-604(ra) # bf8 <printf>

    if(next && next->cbs.is_throttled){
    1e5c:	fa043783          	ld	a5,-96(s0)
    1e60:	cb95                	beqz	a5,1e94 <schedule_edf_cbs+0x1a6>
    1e62:	fa043783          	ld	a5,-96(s0)
    1e66:	5bbc                	lw	a5,112(a5)
    1e68:	c795                	beqz	a5,1e94 <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1e6a:	fa043783          	ld	a5,-96(s0)
    1e6e:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1e72:	fa043783          	ld	a5,-96(s0)
    1e76:	02878793          	addi	a5,a5,40
    1e7a:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1e7e:	f4042423          	sw	zero,-184(s0)
        return r;
    1e82:	f4043783          	ld	a5,-192(s0)
    1e86:	f4f43823          	sd	a5,-176(s0)
    1e8a:	f4843783          	ld	a5,-184(s0)
    1e8e:	f4f43c23          	sd	a5,-168(s0)
    1e92:	a611                	j	2196 <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1e94:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1e98:	689c                	ld	a5,16(s1)
    1e9a:	639c                	ld	a5,0(a5)
    1e9c:	f8f43023          	sd	a5,-128(s0)
    1ea0:	f8043783          	ld	a5,-128(s0)
    1ea4:	17e1                	addi	a5,a5,-8
    1ea6:	fcf43023          	sd	a5,-64(s0)
    1eaa:	a0b5                	j	1f16 <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1eac:	fa843783          	ld	a5,-88(s0)
    1eb0:	e791                	bnez	a5,1ebc <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1eb2:	fc043783          	ld	a5,-64(s0)
    1eb6:	faf43423          	sd	a5,-88(s0)
    1eba:	a0a1                	j	1f02 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1ebc:	fa843783          	ld	a5,-88(s0)
    1ec0:	4f98                	lw	a4,24(a5)
    1ec2:	fc043783          	ld	a5,-64(s0)
    1ec6:	4f9c                	lw	a5,24(a5)
    1ec8:	00e7d763          	bge	a5,a4,1ed6 <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1ecc:	fc043783          	ld	a5,-64(s0)
    1ed0:	faf43423          	sd	a5,-88(s0)
    1ed4:	a03d                	j	1f02 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1ed6:	fa843783          	ld	a5,-88(s0)
    1eda:	4f98                	lw	a4,24(a5)
    1edc:	fc043783          	ld	a5,-64(s0)
    1ee0:	4f9c                	lw	a5,24(a5)
    1ee2:	02f71063          	bne	a4,a5,1f02 <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1ee6:	fa843783          	ld	a5,-88(s0)
    1eea:	639c                	ld	a5,0(a5)
    1eec:	4fb8                	lw	a4,88(a5)
    1eee:	fc043783          	ld	a5,-64(s0)
    1ef2:	639c                	ld	a5,0(a5)
    1ef4:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1ef6:	00e7d663          	bge	a5,a4,1f02 <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1efa:	fc043783          	ld	a5,-64(s0)
    1efe:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1f02:	fc043783          	ld	a5,-64(s0)
    1f06:	679c                	ld	a5,8(a5)
    1f08:	f6f43023          	sd	a5,-160(s0)
    1f0c:	f6043783          	ld	a5,-160(s0)
    1f10:	17e1                	addi	a5,a5,-8
    1f12:	fcf43023          	sd	a5,-64(s0)
    1f16:	fc043783          	ld	a5,-64(s0)
    1f1a:	00878713          	addi	a4,a5,8
    1f1e:	689c                	ld	a5,16(s1)
    1f20:	f8f716e3          	bne	a4,a5,1eac <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1f24:	689c                	ld	a5,16(s1)
    1f26:	639c                	ld	a5,0(a5)
    1f28:	f6f43c23          	sd	a5,-136(s0)
    1f2c:	f7843783          	ld	a5,-136(s0)
    1f30:	17e1                	addi	a5,a5,-8
    1f32:	fcf43023          	sd	a5,-64(s0)
    1f36:	a069                	j	1fc0 <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1f38:	fb043783          	ld	a5,-80(s0)
    1f3c:	eb99                	bnez	a5,1f52 <schedule_edf_cbs+0x264>
    1f3e:	fc043783          	ld	a5,-64(s0)
    1f42:	639c                	ld	a5,0(a5)
    1f44:	57fc                	lw	a5,108(a5)
    1f46:	c791                	beqz	a5,1f52 <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1f48:	fc043783          	ld	a5,-64(s0)
    1f4c:	faf43823          	sd	a5,-80(s0)
    1f50:	a8b1                	j	1fac <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1f52:	fc043783          	ld	a5,-64(s0)
    1f56:	639c                	ld	a5,0(a5)
    1f58:	57fc                	lw	a5,108(a5)
    1f5a:	cf91                	beqz	a5,1f76 <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1f5c:	fb043783          	ld	a5,-80(s0)
    1f60:	4f98                	lw	a4,24(a5)
    1f62:	fc043783          	ld	a5,-64(s0)
    1f66:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1f68:	00e7d763          	bge	a5,a4,1f76 <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1f6c:	fc043783          	ld	a5,-64(s0)
    1f70:	faf43823          	sd	a5,-80(s0)
    1f74:	a825                	j	1fac <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1f76:	fc043783          	ld	a5,-64(s0)
    1f7a:	639c                	ld	a5,0(a5)
    1f7c:	57fc                	lw	a5,108(a5)
    1f7e:	c79d                	beqz	a5,1fac <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1f80:	fb043783          	ld	a5,-80(s0)
    1f84:	4f98                	lw	a4,24(a5)
    1f86:	fc043783          	ld	a5,-64(s0)
    1f8a:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1f8c:	02f71063          	bne	a4,a5,1fac <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1f90:	fb043783          	ld	a5,-80(s0)
    1f94:	639c                	ld	a5,0(a5)
    1f96:	4fb8                	lw	a4,88(a5)
    1f98:	fc043783          	ld	a5,-64(s0)
    1f9c:	639c                	ld	a5,0(a5)
    1f9e:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1fa0:	00e7d663          	bge	a5,a4,1fac <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1fa4:	fc043783          	ld	a5,-64(s0)
    1fa8:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1fac:	fc043783          	ld	a5,-64(s0)
    1fb0:	679c                	ld	a5,8(a5)
    1fb2:	f6f43423          	sd	a5,-152(s0)
    1fb6:	f6843783          	ld	a5,-152(s0)
    1fba:	17e1                	addi	a5,a5,-8
    1fbc:	fcf43023          	sd	a5,-64(s0)
    1fc0:	fc043783          	ld	a5,-64(s0)
    1fc4:	00878713          	addi	a4,a5,8
    1fc8:	689c                	ld	a5,16(s1)
    1fca:	f6f717e3          	bne	a4,a5,1f38 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1fce:	fa043783          	ld	a5,-96(s0)
    1fd2:	cb89                	beqz	a5,1fe4 <schedule_edf_cbs+0x2f6>
    1fd4:	fa043783          	ld	a5,-96(s0)
    1fd8:	57fc                	lw	a5,108(a5)
    1fda:	c789                	beqz	a5,1fe4 <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1fdc:	fb043783          	ld	a5,-80(s0)
    1fe0:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1fe4:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1fe8:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1fec:	fa843783          	ld	a5,-88(s0)
    1ff0:	c3c5                	beqz	a5,2090 <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1ff2:	fa843783          	ld	a5,-88(s0)
    1ff6:	639c                	ld	a5,0(a5)
    1ff8:	5fdc                	lw	a5,60(a5)
    1ffa:	85be                	mv	a1,a5
    1ffc:	00000517          	auipc	a0,0x0
    2000:	46c50513          	addi	a0,a0,1132 # 2468 <schedule_edf_cbs+0x77a>
    2004:	fffff097          	auipc	ra,0xfffff
    2008:	bf4080e7          	jalr	-1036(ra) # bf8 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    200c:	fa843783          	ld	a5,-88(s0)
    2010:	4f98                	lw	a4,24(a5)
    2012:	409c                	lw	a5,0(s1)
    2014:	40f707bb          	subw	a5,a4,a5
    2018:	fcf42623          	sw	a5,-52(s0)
        if (next){
    201c:	fa043783          	ld	a5,-96(s0)
    2020:	cba5                	beqz	a5,2090 <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    2022:	fa043783          	ld	a5,-96(s0)
    2026:	4bf8                	lw	a4,84(a5)
    2028:	fcc42783          	lw	a5,-52(s0)
    202c:	2781                	sext.w	a5,a5
    202e:	06e7d163          	bge	a5,a4,2090 <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    2032:	fa043783          	ld	a5,-96(s0)
    2036:	57fc                	lw	a5,108(a5)
    2038:	eb91                	bnez	a5,204c <schedule_edf_cbs+0x35e>
    203a:	fa843783          	ld	a5,-88(s0)
    203e:	639c                	ld	a5,0(a5)
    2040:	57fc                	lw	a5,108(a5)
    2042:	c789                	beqz	a5,204c <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    2044:	4785                	li	a5,1
    2046:	fcf42423          	sw	a5,-56(s0)
    204a:	a099                	j	2090 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    204c:	fa043783          	ld	a5,-96(s0)
    2050:	4fb8                	lw	a4,88(a5)
    2052:	fa843783          	ld	a5,-88(s0)
    2056:	639c                	ld	a5,0(a5)
    2058:	4fbc                	lw	a5,88(a5)
    205a:	00e7d663          	bge	a5,a4,2066 <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    205e:	4785                	li	a5,1
    2060:	fcf42423          	sw	a5,-56(s0)
    2064:	a035                	j	2090 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    2066:	fa043783          	ld	a5,-96(s0)
    206a:	4fb8                	lw	a4,88(a5)
    206c:	fa843783          	ld	a5,-88(s0)
    2070:	639c                	ld	a5,0(a5)
    2072:	4fbc                	lw	a5,88(a5)
    2074:	00f71e63          	bne	a4,a5,2090 <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    2078:	fa043783          	ld	a5,-96(s0)
    207c:	5fd8                	lw	a4,60(a5)
    207e:	fa843783          	ld	a5,-88(s0)
    2082:	639c                	ld	a5,0(a5)
    2084:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    2086:	00e7d563          	bge	a5,a4,2090 <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    208a:	4785                	li	a5,1
    208c:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    2090:	fa043783          	ld	a5,-96(s0)
    2094:	cbd1                	beqz	a5,2128 <schedule_edf_cbs+0x43a>
    2096:	fa043783          	ld	a5,-96(s0)
    209a:	57fc                	lw	a5,108(a5)
    209c:	e7d1                	bnez	a5,2128 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    209e:	fa043783          	ld	a5,-96(s0)
    20a2:	4fb8                	lw	a4,88(a5)
    20a4:	409c                	lw	a5,0(s1)
    20a6:	40f707bb          	subw	a5,a4,a5
    20aa:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    20ae:	fa043783          	ld	a5,-96(s0)
    20b2:	47f8                	lw	a4,76(a5)
    20b4:	fa043783          	ld	a5,-96(s0)
    20b8:	57bc                	lw	a5,104(a5)
    20ba:	02f707bb          	mulw	a5,a4,a5
    20be:	0007869b          	sext.w	a3,a5
    20c2:	fa043783          	ld	a5,-96(s0)
    20c6:	53fc                	lw	a5,100(a5)
    20c8:	f7442703          	lw	a4,-140(s0)
    20cc:	02f707bb          	mulw	a5,a4,a5
    20d0:	2781                	sext.w	a5,a5
    20d2:	8736                	mv	a4,a3
    20d4:	02e7d263          	bge	a5,a4,20f8 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    20d8:	4098                	lw	a4,0(s1)
    20da:	fa043783          	ld	a5,-96(s0)
    20de:	47fc                	lw	a5,76(a5)
    20e0:	9fb9                	addw	a5,a5,a4
    20e2:	0007871b          	sext.w	a4,a5
    20e6:	fa043783          	ld	a5,-96(s0)
    20ea:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    20ec:	fa043783          	ld	a5,-96(s0)
    20f0:	53f8                	lw	a4,100(a5)
    20f2:	fa043783          	ld	a5,-96(s0)
    20f6:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    20f8:	fa043783          	ld	a5,-96(s0)
    20fc:	4bf8                	lw	a4,84(a5)
    20fe:	fa043783          	ld	a5,-96(s0)
    2102:	57bc                	lw	a5,104(a5)
    2104:	02e7d263          	bge	a5,a4,2128 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    2108:	fa043783          	ld	a5,-96(s0)
    210c:	4705                	li	a4,1
    210e:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    2110:	fa043783          	ld	a5,-96(s0)
    2114:	4fb8                	lw	a4,88(a5)
    2116:	fa043783          	ld	a5,-96(s0)
    211a:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    211c:	fa043783          	ld	a5,-96(s0)
    2120:	4bf8                	lw	a4,84(a5)
    2122:	fa043783          	ld	a5,-96(s0)
    2126:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    2128:	fa043783          	ld	a5,-96(s0)
    212c:	c3a9                	beqz	a5,216e <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    212e:	fa043783          	ld	a5,-96(s0)
    2132:	02878793          	addi	a5,a5,40
    2136:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    213a:	fa843783          	ld	a5,-88(s0)
    213e:	cb91                	beqz	a5,2152 <schedule_edf_cbs+0x464>
    2140:	fc842783          	lw	a5,-56(s0)
    2144:	2781                	sext.w	a5,a5
    2146:	c791                	beqz	a5,2152 <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    2148:	fcc42783          	lw	a5,-52(s0)
    214c:	f4f42423          	sw	a5,-184(s0)
    2150:	a81d                	j	2186 <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    2152:	fa043783          	ld	a5,-96(s0)
    2156:	5bbc                	lw	a5,112(a5)
    2158:	c789                	beqz	a5,2162 <schedule_edf_cbs+0x474>
    215a:	fa043783          	ld	a5,-96(s0)
    215e:	57bc                	lw	a5,104(a5)
    2160:	a021                	j	2168 <schedule_edf_cbs+0x47a>
    2162:	fa043783          	ld	a5,-96(s0)
    2166:	4bfc                	lw	a5,84(a5)
    2168:	f4f42423          	sw	a5,-184(s0)
    216c:	a829                	j	2186 <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    216e:	649c                	ld	a5,8(s1)
    2170:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    2174:	fa843783          	ld	a5,-88(s0)
    2178:	c781                	beqz	a5,2180 <schedule_edf_cbs+0x492>
    217a:	fcc42783          	lw	a5,-52(s0)
    217e:	a011                	j	2182 <schedule_edf_cbs+0x494>
    2180:	4785                	li	a5,1
    2182:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    2186:	f4043783          	ld	a5,-192(s0)
    218a:	f4f43823          	sd	a5,-176(s0)
    218e:	f4843783          	ld	a5,-184(s0)
    2192:	f4f43c23          	sd	a5,-168(s0)
    2196:	4701                	li	a4,0
    2198:	f5043703          	ld	a4,-176(s0)
    219c:	4781                	li	a5,0
    219e:	f5843783          	ld	a5,-168(s0)
    21a2:	893a                	mv	s2,a4
    21a4:	89be                	mv	s3,a5
    21a6:	874a                	mv	a4,s2
    21a8:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    21aa:	853a                	mv	a0,a4
    21ac:	85be                	mv	a1,a5
    21ae:	70ea                	ld	ra,184(sp)
    21b0:	744a                	ld	s0,176(sp)
    21b2:	74aa                	ld	s1,168(sp)
    21b4:	790a                	ld	s2,160(sp)
    21b6:	69ea                	ld	s3,152(sp)
    21b8:	6129                	addi	sp,sp,192
    21ba:	8082                	ret
