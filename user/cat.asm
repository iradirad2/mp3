
user/_cat:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <cat>:

char buf[512];

void
cat(int fd)
{
       0:	7179                	addi	sp,sp,-48
       2:	f406                	sd	ra,40(sp)
       4:	f022                	sd	s0,32(sp)
       6:	1800                	addi	s0,sp,48
       8:	87aa                	mv	a5,a0
       a:	fcf42e23          	sw	a5,-36(s0)
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
       e:	a091                	j	52 <cat+0x52>
    if (write(1, buf, n) != n) {
      10:	fec42783          	lw	a5,-20(s0)
      14:	863e                	mv	a2,a5
      16:	00002597          	auipc	a1,0x2
      1a:	41258593          	addi	a1,a1,1042 # 2428 <buf>
      1e:	4505                	li	a0,1
      20:	00000097          	auipc	ra,0x0
      24:	60e080e7          	jalr	1550(ra) # 62e <write>
      28:	87aa                	mv	a5,a0
      2a:	873e                	mv	a4,a5
      2c:	fec42783          	lw	a5,-20(s0)
      30:	2781                	sext.w	a5,a5
      32:	02e78063          	beq	a5,a4,52 <cat+0x52>
      fprintf(2, "cat: write error\n");
      36:	00002597          	auipc	a1,0x2
      3a:	0e258593          	addi	a1,a1,226 # 2118 <schedule_edf_cbs+0x4ce>
      3e:	4509                	li	a0,2
      40:	00001097          	auipc	ra,0x1
      44:	abc080e7          	jalr	-1348(ra) # afc <fprintf>
      exit(1);
      48:	4505                	li	a0,1
      4a:	00000097          	auipc	ra,0x0
      4e:	5c4080e7          	jalr	1476(ra) # 60e <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
      52:	fdc42783          	lw	a5,-36(s0)
      56:	20000613          	li	a2,512
      5a:	00002597          	auipc	a1,0x2
      5e:	3ce58593          	addi	a1,a1,974 # 2428 <buf>
      62:	853e                	mv	a0,a5
      64:	00000097          	auipc	ra,0x0
      68:	5c2080e7          	jalr	1474(ra) # 626 <read>
      6c:	87aa                	mv	a5,a0
      6e:	fef42623          	sw	a5,-20(s0)
      72:	fec42783          	lw	a5,-20(s0)
      76:	2781                	sext.w	a5,a5
      78:	f8f04ce3          	bgtz	a5,10 <cat+0x10>
    }
  }
  if(n < 0){
      7c:	fec42783          	lw	a5,-20(s0)
      80:	2781                	sext.w	a5,a5
      82:	0207d063          	bgez	a5,a2 <cat+0xa2>
    fprintf(2, "cat: read error\n");
      86:	00002597          	auipc	a1,0x2
      8a:	0aa58593          	addi	a1,a1,170 # 2130 <schedule_edf_cbs+0x4e6>
      8e:	4509                	li	a0,2
      90:	00001097          	auipc	ra,0x1
      94:	a6c080e7          	jalr	-1428(ra) # afc <fprintf>
    exit(1);
      98:	4505                	li	a0,1
      9a:	00000097          	auipc	ra,0x0
      9e:	574080e7          	jalr	1396(ra) # 60e <exit>
  }
}
      a2:	0001                	nop
      a4:	70a2                	ld	ra,40(sp)
      a6:	7402                	ld	s0,32(sp)
      a8:	6145                	addi	sp,sp,48
      aa:	8082                	ret

00000000000000ac <main>:

int
main(int argc, char *argv[])
{
      ac:	7179                	addi	sp,sp,-48
      ae:	f406                	sd	ra,40(sp)
      b0:	f022                	sd	s0,32(sp)
      b2:	1800                	addi	s0,sp,48
      b4:	87aa                	mv	a5,a0
      b6:	fcb43823          	sd	a1,-48(s0)
      ba:	fcf42e23          	sw	a5,-36(s0)
  int fd, i;

  if(argc <= 1){
      be:	fdc42783          	lw	a5,-36(s0)
      c2:	0007871b          	sext.w	a4,a5
      c6:	4785                	li	a5,1
      c8:	00e7cc63          	blt	a5,a4,e0 <main+0x34>
    cat(0);
      cc:	4501                	li	a0,0
      ce:	00000097          	auipc	ra,0x0
      d2:	f32080e7          	jalr	-206(ra) # 0 <cat>
    exit(0);
      d6:	4501                	li	a0,0
      d8:	00000097          	auipc	ra,0x0
      dc:	536080e7          	jalr	1334(ra) # 60e <exit>
  }

  for(i = 1; i < argc; i++){
      e0:	4785                	li	a5,1
      e2:	fef42623          	sw	a5,-20(s0)
      e6:	a8bd                	j	164 <main+0xb8>
    if((fd = open(argv[i], 0)) < 0){
      e8:	fec42783          	lw	a5,-20(s0)
      ec:	078e                	slli	a5,a5,0x3
      ee:	fd043703          	ld	a4,-48(s0)
      f2:	97ba                	add	a5,a5,a4
      f4:	639c                	ld	a5,0(a5)
      f6:	4581                	li	a1,0
      f8:	853e                	mv	a0,a5
      fa:	00000097          	auipc	ra,0x0
      fe:	554080e7          	jalr	1364(ra) # 64e <open>
     102:	87aa                	mv	a5,a0
     104:	fef42423          	sw	a5,-24(s0)
     108:	fe842783          	lw	a5,-24(s0)
     10c:	2781                	sext.w	a5,a5
     10e:	0207d863          	bgez	a5,13e <main+0x92>
      fprintf(2, "cat: cannot open %s\n", argv[i]);
     112:	fec42783          	lw	a5,-20(s0)
     116:	078e                	slli	a5,a5,0x3
     118:	fd043703          	ld	a4,-48(s0)
     11c:	97ba                	add	a5,a5,a4
     11e:	639c                	ld	a5,0(a5)
     120:	863e                	mv	a2,a5
     122:	00002597          	auipc	a1,0x2
     126:	02658593          	addi	a1,a1,38 # 2148 <schedule_edf_cbs+0x4fe>
     12a:	4509                	li	a0,2
     12c:	00001097          	auipc	ra,0x1
     130:	9d0080e7          	jalr	-1584(ra) # afc <fprintf>
      exit(1);
     134:	4505                	li	a0,1
     136:	00000097          	auipc	ra,0x0
     13a:	4d8080e7          	jalr	1240(ra) # 60e <exit>
    }
    cat(fd);
     13e:	fe842783          	lw	a5,-24(s0)
     142:	853e                	mv	a0,a5
     144:	00000097          	auipc	ra,0x0
     148:	ebc080e7          	jalr	-324(ra) # 0 <cat>
    close(fd);
     14c:	fe842783          	lw	a5,-24(s0)
     150:	853e                	mv	a0,a5
     152:	00000097          	auipc	ra,0x0
     156:	4e4080e7          	jalr	1252(ra) # 636 <close>
  for(i = 1; i < argc; i++){
     15a:	fec42783          	lw	a5,-20(s0)
     15e:	2785                	addiw	a5,a5,1
     160:	fef42623          	sw	a5,-20(s0)
     164:	fec42703          	lw	a4,-20(s0)
     168:	fdc42783          	lw	a5,-36(s0)
     16c:	2701                	sext.w	a4,a4
     16e:	2781                	sext.w	a5,a5
     170:	f6f74ce3          	blt	a4,a5,e8 <main+0x3c>
  }
  exit(0);
     174:	4501                	li	a0,0
     176:	00000097          	auipc	ra,0x0
     17a:	498080e7          	jalr	1176(ra) # 60e <exit>

000000000000017e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     17e:	7179                	addi	sp,sp,-48
     180:	f422                	sd	s0,40(sp)
     182:	1800                	addi	s0,sp,48
     184:	fca43c23          	sd	a0,-40(s0)
     188:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     18c:	fd843783          	ld	a5,-40(s0)
     190:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     194:	0001                	nop
     196:	fd043703          	ld	a4,-48(s0)
     19a:	00170793          	addi	a5,a4,1
     19e:	fcf43823          	sd	a5,-48(s0)
     1a2:	fd843783          	ld	a5,-40(s0)
     1a6:	00178693          	addi	a3,a5,1
     1aa:	fcd43c23          	sd	a3,-40(s0)
     1ae:	00074703          	lbu	a4,0(a4)
     1b2:	00e78023          	sb	a4,0(a5)
     1b6:	0007c783          	lbu	a5,0(a5)
     1ba:	fff1                	bnez	a5,196 <strcpy+0x18>
    ;
  return os;
     1bc:	fe843783          	ld	a5,-24(s0)
}
     1c0:	853e                	mv	a0,a5
     1c2:	7422                	ld	s0,40(sp)
     1c4:	6145                	addi	sp,sp,48
     1c6:	8082                	ret

00000000000001c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     1c8:	1101                	addi	sp,sp,-32
     1ca:	ec22                	sd	s0,24(sp)
     1cc:	1000                	addi	s0,sp,32
     1ce:	fea43423          	sd	a0,-24(s0)
     1d2:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     1d6:	a819                	j	1ec <strcmp+0x24>
    p++, q++;
     1d8:	fe843783          	ld	a5,-24(s0)
     1dc:	0785                	addi	a5,a5,1
     1de:	fef43423          	sd	a5,-24(s0)
     1e2:	fe043783          	ld	a5,-32(s0)
     1e6:	0785                	addi	a5,a5,1
     1e8:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     1ec:	fe843783          	ld	a5,-24(s0)
     1f0:	0007c783          	lbu	a5,0(a5)
     1f4:	cb99                	beqz	a5,20a <strcmp+0x42>
     1f6:	fe843783          	ld	a5,-24(s0)
     1fa:	0007c703          	lbu	a4,0(a5)
     1fe:	fe043783          	ld	a5,-32(s0)
     202:	0007c783          	lbu	a5,0(a5)
     206:	fcf709e3          	beq	a4,a5,1d8 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     20a:	fe843783          	ld	a5,-24(s0)
     20e:	0007c783          	lbu	a5,0(a5)
     212:	0007871b          	sext.w	a4,a5
     216:	fe043783          	ld	a5,-32(s0)
     21a:	0007c783          	lbu	a5,0(a5)
     21e:	2781                	sext.w	a5,a5
     220:	40f707bb          	subw	a5,a4,a5
     224:	2781                	sext.w	a5,a5
}
     226:	853e                	mv	a0,a5
     228:	6462                	ld	s0,24(sp)
     22a:	6105                	addi	sp,sp,32
     22c:	8082                	ret

000000000000022e <strlen>:

uint
strlen(const char *s)
{
     22e:	7179                	addi	sp,sp,-48
     230:	f422                	sd	s0,40(sp)
     232:	1800                	addi	s0,sp,48
     234:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     238:	fe042623          	sw	zero,-20(s0)
     23c:	a031                	j	248 <strlen+0x1a>
     23e:	fec42783          	lw	a5,-20(s0)
     242:	2785                	addiw	a5,a5,1
     244:	fef42623          	sw	a5,-20(s0)
     248:	fec42783          	lw	a5,-20(s0)
     24c:	fd843703          	ld	a4,-40(s0)
     250:	97ba                	add	a5,a5,a4
     252:	0007c783          	lbu	a5,0(a5)
     256:	f7e5                	bnez	a5,23e <strlen+0x10>
    ;
  return n;
     258:	fec42783          	lw	a5,-20(s0)
}
     25c:	853e                	mv	a0,a5
     25e:	7422                	ld	s0,40(sp)
     260:	6145                	addi	sp,sp,48
     262:	8082                	ret

0000000000000264 <memset>:

void*
memset(void *dst, int c, uint n)
{
     264:	7179                	addi	sp,sp,-48
     266:	f422                	sd	s0,40(sp)
     268:	1800                	addi	s0,sp,48
     26a:	fca43c23          	sd	a0,-40(s0)
     26e:	87ae                	mv	a5,a1
     270:	8732                	mv	a4,a2
     272:	fcf42a23          	sw	a5,-44(s0)
     276:	87ba                	mv	a5,a4
     278:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     27c:	fd843783          	ld	a5,-40(s0)
     280:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     284:	fe042623          	sw	zero,-20(s0)
     288:	a00d                	j	2aa <memset+0x46>
    cdst[i] = c;
     28a:	fec42783          	lw	a5,-20(s0)
     28e:	fe043703          	ld	a4,-32(s0)
     292:	97ba                	add	a5,a5,a4
     294:	fd442703          	lw	a4,-44(s0)
     298:	0ff77713          	andi	a4,a4,255
     29c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     2a0:	fec42783          	lw	a5,-20(s0)
     2a4:	2785                	addiw	a5,a5,1
     2a6:	fef42623          	sw	a5,-20(s0)
     2aa:	fec42703          	lw	a4,-20(s0)
     2ae:	fd042783          	lw	a5,-48(s0)
     2b2:	2781                	sext.w	a5,a5
     2b4:	fcf76be3          	bltu	a4,a5,28a <memset+0x26>
  }
  return dst;
     2b8:	fd843783          	ld	a5,-40(s0)
}
     2bc:	853e                	mv	a0,a5
     2be:	7422                	ld	s0,40(sp)
     2c0:	6145                	addi	sp,sp,48
     2c2:	8082                	ret

00000000000002c4 <strchr>:

char*
strchr(const char *s, char c)
{
     2c4:	1101                	addi	sp,sp,-32
     2c6:	ec22                	sd	s0,24(sp)
     2c8:	1000                	addi	s0,sp,32
     2ca:	fea43423          	sd	a0,-24(s0)
     2ce:	87ae                	mv	a5,a1
     2d0:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     2d4:	a01d                	j	2fa <strchr+0x36>
    if(*s == c)
     2d6:	fe843783          	ld	a5,-24(s0)
     2da:	0007c703          	lbu	a4,0(a5)
     2de:	fe744783          	lbu	a5,-25(s0)
     2e2:	0ff7f793          	andi	a5,a5,255
     2e6:	00e79563          	bne	a5,a4,2f0 <strchr+0x2c>
      return (char*)s;
     2ea:	fe843783          	ld	a5,-24(s0)
     2ee:	a821                	j	306 <strchr+0x42>
  for(; *s; s++)
     2f0:	fe843783          	ld	a5,-24(s0)
     2f4:	0785                	addi	a5,a5,1
     2f6:	fef43423          	sd	a5,-24(s0)
     2fa:	fe843783          	ld	a5,-24(s0)
     2fe:	0007c783          	lbu	a5,0(a5)
     302:	fbf1                	bnez	a5,2d6 <strchr+0x12>
  return 0;
     304:	4781                	li	a5,0
}
     306:	853e                	mv	a0,a5
     308:	6462                	ld	s0,24(sp)
     30a:	6105                	addi	sp,sp,32
     30c:	8082                	ret

000000000000030e <gets>:

char*
gets(char *buf, int max)
{
     30e:	7179                	addi	sp,sp,-48
     310:	f406                	sd	ra,40(sp)
     312:	f022                	sd	s0,32(sp)
     314:	1800                	addi	s0,sp,48
     316:	fca43c23          	sd	a0,-40(s0)
     31a:	87ae                	mv	a5,a1
     31c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     320:	fe042623          	sw	zero,-20(s0)
     324:	a8a1                	j	37c <gets+0x6e>
    cc = read(0, &c, 1);
     326:	fe740793          	addi	a5,s0,-25
     32a:	4605                	li	a2,1
     32c:	85be                	mv	a1,a5
     32e:	4501                	li	a0,0
     330:	00000097          	auipc	ra,0x0
     334:	2f6080e7          	jalr	758(ra) # 626 <read>
     338:	87aa                	mv	a5,a0
     33a:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     33e:	fe842783          	lw	a5,-24(s0)
     342:	2781                	sext.w	a5,a5
     344:	04f05763          	blez	a5,392 <gets+0x84>
      break;
    buf[i++] = c;
     348:	fec42783          	lw	a5,-20(s0)
     34c:	0017871b          	addiw	a4,a5,1
     350:	fee42623          	sw	a4,-20(s0)
     354:	873e                	mv	a4,a5
     356:	fd843783          	ld	a5,-40(s0)
     35a:	97ba                	add	a5,a5,a4
     35c:	fe744703          	lbu	a4,-25(s0)
     360:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     364:	fe744783          	lbu	a5,-25(s0)
     368:	873e                	mv	a4,a5
     36a:	47a9                	li	a5,10
     36c:	02f70463          	beq	a4,a5,394 <gets+0x86>
     370:	fe744783          	lbu	a5,-25(s0)
     374:	873e                	mv	a4,a5
     376:	47b5                	li	a5,13
     378:	00f70e63          	beq	a4,a5,394 <gets+0x86>
  for(i=0; i+1 < max; ){
     37c:	fec42783          	lw	a5,-20(s0)
     380:	2785                	addiw	a5,a5,1
     382:	0007871b          	sext.w	a4,a5
     386:	fd442783          	lw	a5,-44(s0)
     38a:	2781                	sext.w	a5,a5
     38c:	f8f74de3          	blt	a4,a5,326 <gets+0x18>
     390:	a011                	j	394 <gets+0x86>
      break;
     392:	0001                	nop
      break;
  }
  buf[i] = '\0';
     394:	fec42783          	lw	a5,-20(s0)
     398:	fd843703          	ld	a4,-40(s0)
     39c:	97ba                	add	a5,a5,a4
     39e:	00078023          	sb	zero,0(a5)
  return buf;
     3a2:	fd843783          	ld	a5,-40(s0)
}
     3a6:	853e                	mv	a0,a5
     3a8:	70a2                	ld	ra,40(sp)
     3aa:	7402                	ld	s0,32(sp)
     3ac:	6145                	addi	sp,sp,48
     3ae:	8082                	ret

00000000000003b0 <stat>:

int
stat(const char *n, struct stat *st)
{
     3b0:	7179                	addi	sp,sp,-48
     3b2:	f406                	sd	ra,40(sp)
     3b4:	f022                	sd	s0,32(sp)
     3b6:	1800                	addi	s0,sp,48
     3b8:	fca43c23          	sd	a0,-40(s0)
     3bc:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     3c0:	4581                	li	a1,0
     3c2:	fd843503          	ld	a0,-40(s0)
     3c6:	00000097          	auipc	ra,0x0
     3ca:	288080e7          	jalr	648(ra) # 64e <open>
     3ce:	87aa                	mv	a5,a0
     3d0:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     3d4:	fec42783          	lw	a5,-20(s0)
     3d8:	2781                	sext.w	a5,a5
     3da:	0007d463          	bgez	a5,3e2 <stat+0x32>
    return -1;
     3de:	57fd                	li	a5,-1
     3e0:	a035                	j	40c <stat+0x5c>
  r = fstat(fd, st);
     3e2:	fec42783          	lw	a5,-20(s0)
     3e6:	fd043583          	ld	a1,-48(s0)
     3ea:	853e                	mv	a0,a5
     3ec:	00000097          	auipc	ra,0x0
     3f0:	27a080e7          	jalr	634(ra) # 666 <fstat>
     3f4:	87aa                	mv	a5,a0
     3f6:	fef42423          	sw	a5,-24(s0)
  close(fd);
     3fa:	fec42783          	lw	a5,-20(s0)
     3fe:	853e                	mv	a0,a5
     400:	00000097          	auipc	ra,0x0
     404:	236080e7          	jalr	566(ra) # 636 <close>
  return r;
     408:	fe842783          	lw	a5,-24(s0)
}
     40c:	853e                	mv	a0,a5
     40e:	70a2                	ld	ra,40(sp)
     410:	7402                	ld	s0,32(sp)
     412:	6145                	addi	sp,sp,48
     414:	8082                	ret

0000000000000416 <atoi>:

int
atoi(const char *s)
{
     416:	7179                	addi	sp,sp,-48
     418:	f422                	sd	s0,40(sp)
     41a:	1800                	addi	s0,sp,48
     41c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     420:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     424:	a815                	j	458 <atoi+0x42>
    n = n*10 + *s++ - '0';
     426:	fec42703          	lw	a4,-20(s0)
     42a:	87ba                	mv	a5,a4
     42c:	0027979b          	slliw	a5,a5,0x2
     430:	9fb9                	addw	a5,a5,a4
     432:	0017979b          	slliw	a5,a5,0x1
     436:	0007871b          	sext.w	a4,a5
     43a:	fd843783          	ld	a5,-40(s0)
     43e:	00178693          	addi	a3,a5,1
     442:	fcd43c23          	sd	a3,-40(s0)
     446:	0007c783          	lbu	a5,0(a5)
     44a:	2781                	sext.w	a5,a5
     44c:	9fb9                	addw	a5,a5,a4
     44e:	2781                	sext.w	a5,a5
     450:	fd07879b          	addiw	a5,a5,-48
     454:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     458:	fd843783          	ld	a5,-40(s0)
     45c:	0007c783          	lbu	a5,0(a5)
     460:	873e                	mv	a4,a5
     462:	02f00793          	li	a5,47
     466:	00e7fb63          	bgeu	a5,a4,47c <atoi+0x66>
     46a:	fd843783          	ld	a5,-40(s0)
     46e:	0007c783          	lbu	a5,0(a5)
     472:	873e                	mv	a4,a5
     474:	03900793          	li	a5,57
     478:	fae7f7e3          	bgeu	a5,a4,426 <atoi+0x10>
  return n;
     47c:	fec42783          	lw	a5,-20(s0)
}
     480:	853e                	mv	a0,a5
     482:	7422                	ld	s0,40(sp)
     484:	6145                	addi	sp,sp,48
     486:	8082                	ret

0000000000000488 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     488:	7139                	addi	sp,sp,-64
     48a:	fc22                	sd	s0,56(sp)
     48c:	0080                	addi	s0,sp,64
     48e:	fca43c23          	sd	a0,-40(s0)
     492:	fcb43823          	sd	a1,-48(s0)
     496:	87b2                	mv	a5,a2
     498:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     49c:	fd843783          	ld	a5,-40(s0)
     4a0:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     4a4:	fd043783          	ld	a5,-48(s0)
     4a8:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     4ac:	fe043703          	ld	a4,-32(s0)
     4b0:	fe843783          	ld	a5,-24(s0)
     4b4:	02e7fc63          	bgeu	a5,a4,4ec <memmove+0x64>
    while(n-- > 0)
     4b8:	a00d                	j	4da <memmove+0x52>
      *dst++ = *src++;
     4ba:	fe043703          	ld	a4,-32(s0)
     4be:	00170793          	addi	a5,a4,1
     4c2:	fef43023          	sd	a5,-32(s0)
     4c6:	fe843783          	ld	a5,-24(s0)
     4ca:	00178693          	addi	a3,a5,1
     4ce:	fed43423          	sd	a3,-24(s0)
     4d2:	00074703          	lbu	a4,0(a4)
     4d6:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     4da:	fcc42783          	lw	a5,-52(s0)
     4de:	fff7871b          	addiw	a4,a5,-1
     4e2:	fce42623          	sw	a4,-52(s0)
     4e6:	fcf04ae3          	bgtz	a5,4ba <memmove+0x32>
     4ea:	a891                	j	53e <memmove+0xb6>
  } else {
    dst += n;
     4ec:	fcc42783          	lw	a5,-52(s0)
     4f0:	fe843703          	ld	a4,-24(s0)
     4f4:	97ba                	add	a5,a5,a4
     4f6:	fef43423          	sd	a5,-24(s0)
    src += n;
     4fa:	fcc42783          	lw	a5,-52(s0)
     4fe:	fe043703          	ld	a4,-32(s0)
     502:	97ba                	add	a5,a5,a4
     504:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     508:	a01d                	j	52e <memmove+0xa6>
      *--dst = *--src;
     50a:	fe043783          	ld	a5,-32(s0)
     50e:	17fd                	addi	a5,a5,-1
     510:	fef43023          	sd	a5,-32(s0)
     514:	fe843783          	ld	a5,-24(s0)
     518:	17fd                	addi	a5,a5,-1
     51a:	fef43423          	sd	a5,-24(s0)
     51e:	fe043783          	ld	a5,-32(s0)
     522:	0007c703          	lbu	a4,0(a5)
     526:	fe843783          	ld	a5,-24(s0)
     52a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     52e:	fcc42783          	lw	a5,-52(s0)
     532:	fff7871b          	addiw	a4,a5,-1
     536:	fce42623          	sw	a4,-52(s0)
     53a:	fcf048e3          	bgtz	a5,50a <memmove+0x82>
  }
  return vdst;
     53e:	fd843783          	ld	a5,-40(s0)
}
     542:	853e                	mv	a0,a5
     544:	7462                	ld	s0,56(sp)
     546:	6121                	addi	sp,sp,64
     548:	8082                	ret

000000000000054a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     54a:	7139                	addi	sp,sp,-64
     54c:	fc22                	sd	s0,56(sp)
     54e:	0080                	addi	s0,sp,64
     550:	fca43c23          	sd	a0,-40(s0)
     554:	fcb43823          	sd	a1,-48(s0)
     558:	87b2                	mv	a5,a2
     55a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     55e:	fd843783          	ld	a5,-40(s0)
     562:	fef43423          	sd	a5,-24(s0)
     566:	fd043783          	ld	a5,-48(s0)
     56a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     56e:	a0a1                	j	5b6 <memcmp+0x6c>
    if (*p1 != *p2) {
     570:	fe843783          	ld	a5,-24(s0)
     574:	0007c703          	lbu	a4,0(a5)
     578:	fe043783          	ld	a5,-32(s0)
     57c:	0007c783          	lbu	a5,0(a5)
     580:	02f70163          	beq	a4,a5,5a2 <memcmp+0x58>
      return *p1 - *p2;
     584:	fe843783          	ld	a5,-24(s0)
     588:	0007c783          	lbu	a5,0(a5)
     58c:	0007871b          	sext.w	a4,a5
     590:	fe043783          	ld	a5,-32(s0)
     594:	0007c783          	lbu	a5,0(a5)
     598:	2781                	sext.w	a5,a5
     59a:	40f707bb          	subw	a5,a4,a5
     59e:	2781                	sext.w	a5,a5
     5a0:	a01d                	j	5c6 <memcmp+0x7c>
    }
    p1++;
     5a2:	fe843783          	ld	a5,-24(s0)
     5a6:	0785                	addi	a5,a5,1
     5a8:	fef43423          	sd	a5,-24(s0)
    p2++;
     5ac:	fe043783          	ld	a5,-32(s0)
     5b0:	0785                	addi	a5,a5,1
     5b2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     5b6:	fcc42783          	lw	a5,-52(s0)
     5ba:	fff7871b          	addiw	a4,a5,-1
     5be:	fce42623          	sw	a4,-52(s0)
     5c2:	f7dd                	bnez	a5,570 <memcmp+0x26>
  }
  return 0;
     5c4:	4781                	li	a5,0
}
     5c6:	853e                	mv	a0,a5
     5c8:	7462                	ld	s0,56(sp)
     5ca:	6121                	addi	sp,sp,64
     5cc:	8082                	ret

00000000000005ce <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     5ce:	7179                	addi	sp,sp,-48
     5d0:	f406                	sd	ra,40(sp)
     5d2:	f022                	sd	s0,32(sp)
     5d4:	1800                	addi	s0,sp,48
     5d6:	fea43423          	sd	a0,-24(s0)
     5da:	feb43023          	sd	a1,-32(s0)
     5de:	87b2                	mv	a5,a2
     5e0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     5e4:	fdc42783          	lw	a5,-36(s0)
     5e8:	863e                	mv	a2,a5
     5ea:	fe043583          	ld	a1,-32(s0)
     5ee:	fe843503          	ld	a0,-24(s0)
     5f2:	00000097          	auipc	ra,0x0
     5f6:	e96080e7          	jalr	-362(ra) # 488 <memmove>
     5fa:	87aa                	mv	a5,a0
}
     5fc:	853e                	mv	a0,a5
     5fe:	70a2                	ld	ra,40(sp)
     600:	7402                	ld	s0,32(sp)
     602:	6145                	addi	sp,sp,48
     604:	8082                	ret

0000000000000606 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     606:	4885                	li	a7,1
 ecall
     608:	00000073          	ecall
 ret
     60c:	8082                	ret

000000000000060e <exit>:
.global exit
exit:
 li a7, SYS_exit
     60e:	4889                	li	a7,2
 ecall
     610:	00000073          	ecall
 ret
     614:	8082                	ret

0000000000000616 <wait>:
.global wait
wait:
 li a7, SYS_wait
     616:	488d                	li	a7,3
 ecall
     618:	00000073          	ecall
 ret
     61c:	8082                	ret

000000000000061e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     61e:	4891                	li	a7,4
 ecall
     620:	00000073          	ecall
 ret
     624:	8082                	ret

0000000000000626 <read>:
.global read
read:
 li a7, SYS_read
     626:	4895                	li	a7,5
 ecall
     628:	00000073          	ecall
 ret
     62c:	8082                	ret

000000000000062e <write>:
.global write
write:
 li a7, SYS_write
     62e:	48c1                	li	a7,16
 ecall
     630:	00000073          	ecall
 ret
     634:	8082                	ret

0000000000000636 <close>:
.global close
close:
 li a7, SYS_close
     636:	48d5                	li	a7,21
 ecall
     638:	00000073          	ecall
 ret
     63c:	8082                	ret

000000000000063e <kill>:
.global kill
kill:
 li a7, SYS_kill
     63e:	4899                	li	a7,6
 ecall
     640:	00000073          	ecall
 ret
     644:	8082                	ret

0000000000000646 <exec>:
.global exec
exec:
 li a7, SYS_exec
     646:	489d                	li	a7,7
 ecall
     648:	00000073          	ecall
 ret
     64c:	8082                	ret

000000000000064e <open>:
.global open
open:
 li a7, SYS_open
     64e:	48bd                	li	a7,15
 ecall
     650:	00000073          	ecall
 ret
     654:	8082                	ret

0000000000000656 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     656:	48c5                	li	a7,17
 ecall
     658:	00000073          	ecall
 ret
     65c:	8082                	ret

000000000000065e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     65e:	48c9                	li	a7,18
 ecall
     660:	00000073          	ecall
 ret
     664:	8082                	ret

0000000000000666 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     666:	48a1                	li	a7,8
 ecall
     668:	00000073          	ecall
 ret
     66c:	8082                	ret

000000000000066e <link>:
.global link
link:
 li a7, SYS_link
     66e:	48cd                	li	a7,19
 ecall
     670:	00000073          	ecall
 ret
     674:	8082                	ret

0000000000000676 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     676:	48d1                	li	a7,20
 ecall
     678:	00000073          	ecall
 ret
     67c:	8082                	ret

000000000000067e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     67e:	48a5                	li	a7,9
 ecall
     680:	00000073          	ecall
 ret
     684:	8082                	ret

0000000000000686 <dup>:
.global dup
dup:
 li a7, SYS_dup
     686:	48a9                	li	a7,10
 ecall
     688:	00000073          	ecall
 ret
     68c:	8082                	ret

000000000000068e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     68e:	48ad                	li	a7,11
 ecall
     690:	00000073          	ecall
 ret
     694:	8082                	ret

0000000000000696 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     696:	48b1                	li	a7,12
 ecall
     698:	00000073          	ecall
 ret
     69c:	8082                	ret

000000000000069e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     69e:	48b5                	li	a7,13
 ecall
     6a0:	00000073          	ecall
 ret
     6a4:	8082                	ret

00000000000006a6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     6a6:	48b9                	li	a7,14
 ecall
     6a8:	00000073          	ecall
 ret
     6ac:	8082                	ret

00000000000006ae <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     6ae:	48d9                	li	a7,22
 ecall
     6b0:	00000073          	ecall
 ret
     6b4:	8082                	ret

00000000000006b6 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     6b6:	48dd                	li	a7,23
 ecall
     6b8:	00000073          	ecall
 ret
     6bc:	8082                	ret

00000000000006be <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     6be:	48e1                	li	a7,24
 ecall
     6c0:	00000073          	ecall
 ret
     6c4:	8082                	ret

00000000000006c6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     6c6:	1101                	addi	sp,sp,-32
     6c8:	ec06                	sd	ra,24(sp)
     6ca:	e822                	sd	s0,16(sp)
     6cc:	1000                	addi	s0,sp,32
     6ce:	87aa                	mv	a5,a0
     6d0:	872e                	mv	a4,a1
     6d2:	fef42623          	sw	a5,-20(s0)
     6d6:	87ba                	mv	a5,a4
     6d8:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     6dc:	feb40713          	addi	a4,s0,-21
     6e0:	fec42783          	lw	a5,-20(s0)
     6e4:	4605                	li	a2,1
     6e6:	85ba                	mv	a1,a4
     6e8:	853e                	mv	a0,a5
     6ea:	00000097          	auipc	ra,0x0
     6ee:	f44080e7          	jalr	-188(ra) # 62e <write>
}
     6f2:	0001                	nop
     6f4:	60e2                	ld	ra,24(sp)
     6f6:	6442                	ld	s0,16(sp)
     6f8:	6105                	addi	sp,sp,32
     6fa:	8082                	ret

00000000000006fc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     6fc:	7139                	addi	sp,sp,-64
     6fe:	fc06                	sd	ra,56(sp)
     700:	f822                	sd	s0,48(sp)
     702:	0080                	addi	s0,sp,64
     704:	87aa                	mv	a5,a0
     706:	8736                	mv	a4,a3
     708:	fcf42623          	sw	a5,-52(s0)
     70c:	87ae                	mv	a5,a1
     70e:	fcf42423          	sw	a5,-56(s0)
     712:	87b2                	mv	a5,a2
     714:	fcf42223          	sw	a5,-60(s0)
     718:	87ba                	mv	a5,a4
     71a:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     71e:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     722:	fc042783          	lw	a5,-64(s0)
     726:	2781                	sext.w	a5,a5
     728:	c38d                	beqz	a5,74a <printint+0x4e>
     72a:	fc842783          	lw	a5,-56(s0)
     72e:	2781                	sext.w	a5,a5
     730:	0007dd63          	bgez	a5,74a <printint+0x4e>
    neg = 1;
     734:	4785                	li	a5,1
     736:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     73a:	fc842783          	lw	a5,-56(s0)
     73e:	40f007bb          	negw	a5,a5
     742:	2781                	sext.w	a5,a5
     744:	fef42223          	sw	a5,-28(s0)
     748:	a029                	j	752 <printint+0x56>
  } else {
    x = xx;
     74a:	fc842783          	lw	a5,-56(s0)
     74e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     752:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     756:	fc442783          	lw	a5,-60(s0)
     75a:	fe442703          	lw	a4,-28(s0)
     75e:	02f777bb          	remuw	a5,a4,a5
     762:	0007861b          	sext.w	a2,a5
     766:	fec42783          	lw	a5,-20(s0)
     76a:	0017871b          	addiw	a4,a5,1
     76e:	fee42623          	sw	a4,-20(s0)
     772:	00002697          	auipc	a3,0x2
     776:	c6e68693          	addi	a3,a3,-914 # 23e0 <digits>
     77a:	02061713          	slli	a4,a2,0x20
     77e:	9301                	srli	a4,a4,0x20
     780:	9736                	add	a4,a4,a3
     782:	00074703          	lbu	a4,0(a4)
     786:	ff040693          	addi	a3,s0,-16
     78a:	97b6                	add	a5,a5,a3
     78c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     790:	fc442783          	lw	a5,-60(s0)
     794:	fe442703          	lw	a4,-28(s0)
     798:	02f757bb          	divuw	a5,a4,a5
     79c:	fef42223          	sw	a5,-28(s0)
     7a0:	fe442783          	lw	a5,-28(s0)
     7a4:	2781                	sext.w	a5,a5
     7a6:	fbc5                	bnez	a5,756 <printint+0x5a>
  if(neg)
     7a8:	fe842783          	lw	a5,-24(s0)
     7ac:	2781                	sext.w	a5,a5
     7ae:	cf95                	beqz	a5,7ea <printint+0xee>
    buf[i++] = '-';
     7b0:	fec42783          	lw	a5,-20(s0)
     7b4:	0017871b          	addiw	a4,a5,1
     7b8:	fee42623          	sw	a4,-20(s0)
     7bc:	ff040713          	addi	a4,s0,-16
     7c0:	97ba                	add	a5,a5,a4
     7c2:	02d00713          	li	a4,45
     7c6:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     7ca:	a005                	j	7ea <printint+0xee>
    putc(fd, buf[i]);
     7cc:	fec42783          	lw	a5,-20(s0)
     7d0:	ff040713          	addi	a4,s0,-16
     7d4:	97ba                	add	a5,a5,a4
     7d6:	fe07c703          	lbu	a4,-32(a5)
     7da:	fcc42783          	lw	a5,-52(s0)
     7de:	85ba                	mv	a1,a4
     7e0:	853e                	mv	a0,a5
     7e2:	00000097          	auipc	ra,0x0
     7e6:	ee4080e7          	jalr	-284(ra) # 6c6 <putc>
  while(--i >= 0)
     7ea:	fec42783          	lw	a5,-20(s0)
     7ee:	37fd                	addiw	a5,a5,-1
     7f0:	fef42623          	sw	a5,-20(s0)
     7f4:	fec42783          	lw	a5,-20(s0)
     7f8:	2781                	sext.w	a5,a5
     7fa:	fc07d9e3          	bgez	a5,7cc <printint+0xd0>
}
     7fe:	0001                	nop
     800:	0001                	nop
     802:	70e2                	ld	ra,56(sp)
     804:	7442                	ld	s0,48(sp)
     806:	6121                	addi	sp,sp,64
     808:	8082                	ret

000000000000080a <printptr>:

static void
printptr(int fd, uint64 x) {
     80a:	7179                	addi	sp,sp,-48
     80c:	f406                	sd	ra,40(sp)
     80e:	f022                	sd	s0,32(sp)
     810:	1800                	addi	s0,sp,48
     812:	87aa                	mv	a5,a0
     814:	fcb43823          	sd	a1,-48(s0)
     818:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     81c:	fdc42783          	lw	a5,-36(s0)
     820:	03000593          	li	a1,48
     824:	853e                	mv	a0,a5
     826:	00000097          	auipc	ra,0x0
     82a:	ea0080e7          	jalr	-352(ra) # 6c6 <putc>
  putc(fd, 'x');
     82e:	fdc42783          	lw	a5,-36(s0)
     832:	07800593          	li	a1,120
     836:	853e                	mv	a0,a5
     838:	00000097          	auipc	ra,0x0
     83c:	e8e080e7          	jalr	-370(ra) # 6c6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     840:	fe042623          	sw	zero,-20(s0)
     844:	a82d                	j	87e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     846:	fd043783          	ld	a5,-48(s0)
     84a:	93f1                	srli	a5,a5,0x3c
     84c:	00002717          	auipc	a4,0x2
     850:	b9470713          	addi	a4,a4,-1132 # 23e0 <digits>
     854:	97ba                	add	a5,a5,a4
     856:	0007c703          	lbu	a4,0(a5)
     85a:	fdc42783          	lw	a5,-36(s0)
     85e:	85ba                	mv	a1,a4
     860:	853e                	mv	a0,a5
     862:	00000097          	auipc	ra,0x0
     866:	e64080e7          	jalr	-412(ra) # 6c6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     86a:	fec42783          	lw	a5,-20(s0)
     86e:	2785                	addiw	a5,a5,1
     870:	fef42623          	sw	a5,-20(s0)
     874:	fd043783          	ld	a5,-48(s0)
     878:	0792                	slli	a5,a5,0x4
     87a:	fcf43823          	sd	a5,-48(s0)
     87e:	fec42783          	lw	a5,-20(s0)
     882:	873e                	mv	a4,a5
     884:	47bd                	li	a5,15
     886:	fce7f0e3          	bgeu	a5,a4,846 <printptr+0x3c>
}
     88a:	0001                	nop
     88c:	0001                	nop
     88e:	70a2                	ld	ra,40(sp)
     890:	7402                	ld	s0,32(sp)
     892:	6145                	addi	sp,sp,48
     894:	8082                	ret

0000000000000896 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     896:	715d                	addi	sp,sp,-80
     898:	e486                	sd	ra,72(sp)
     89a:	e0a2                	sd	s0,64(sp)
     89c:	0880                	addi	s0,sp,80
     89e:	87aa                	mv	a5,a0
     8a0:	fcb43023          	sd	a1,-64(s0)
     8a4:	fac43c23          	sd	a2,-72(s0)
     8a8:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     8ac:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     8b0:	fe042223          	sw	zero,-28(s0)
     8b4:	a42d                	j	ade <vprintf+0x248>
    c = fmt[i] & 0xff;
     8b6:	fe442783          	lw	a5,-28(s0)
     8ba:	fc043703          	ld	a4,-64(s0)
     8be:	97ba                	add	a5,a5,a4
     8c0:	0007c783          	lbu	a5,0(a5)
     8c4:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     8c8:	fe042783          	lw	a5,-32(s0)
     8cc:	2781                	sext.w	a5,a5
     8ce:	eb9d                	bnez	a5,904 <vprintf+0x6e>
      if(c == '%'){
     8d0:	fdc42783          	lw	a5,-36(s0)
     8d4:	0007871b          	sext.w	a4,a5
     8d8:	02500793          	li	a5,37
     8dc:	00f71763          	bne	a4,a5,8ea <vprintf+0x54>
        state = '%';
     8e0:	02500793          	li	a5,37
     8e4:	fef42023          	sw	a5,-32(s0)
     8e8:	a2f5                	j	ad4 <vprintf+0x23e>
      } else {
        putc(fd, c);
     8ea:	fdc42783          	lw	a5,-36(s0)
     8ee:	0ff7f713          	andi	a4,a5,255
     8f2:	fcc42783          	lw	a5,-52(s0)
     8f6:	85ba                	mv	a1,a4
     8f8:	853e                	mv	a0,a5
     8fa:	00000097          	auipc	ra,0x0
     8fe:	dcc080e7          	jalr	-564(ra) # 6c6 <putc>
     902:	aac9                	j	ad4 <vprintf+0x23e>
      }
    } else if(state == '%'){
     904:	fe042783          	lw	a5,-32(s0)
     908:	0007871b          	sext.w	a4,a5
     90c:	02500793          	li	a5,37
     910:	1cf71263          	bne	a4,a5,ad4 <vprintf+0x23e>
      if(c == 'd'){
     914:	fdc42783          	lw	a5,-36(s0)
     918:	0007871b          	sext.w	a4,a5
     91c:	06400793          	li	a5,100
     920:	02f71463          	bne	a4,a5,948 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     924:	fb843783          	ld	a5,-72(s0)
     928:	00878713          	addi	a4,a5,8
     92c:	fae43c23          	sd	a4,-72(s0)
     930:	4398                	lw	a4,0(a5)
     932:	fcc42783          	lw	a5,-52(s0)
     936:	4685                	li	a3,1
     938:	4629                	li	a2,10
     93a:	85ba                	mv	a1,a4
     93c:	853e                	mv	a0,a5
     93e:	00000097          	auipc	ra,0x0
     942:	dbe080e7          	jalr	-578(ra) # 6fc <printint>
     946:	a269                	j	ad0 <vprintf+0x23a>
      } else if(c == 'l') {
     948:	fdc42783          	lw	a5,-36(s0)
     94c:	0007871b          	sext.w	a4,a5
     950:	06c00793          	li	a5,108
     954:	02f71663          	bne	a4,a5,980 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     958:	fb843783          	ld	a5,-72(s0)
     95c:	00878713          	addi	a4,a5,8
     960:	fae43c23          	sd	a4,-72(s0)
     964:	639c                	ld	a5,0(a5)
     966:	0007871b          	sext.w	a4,a5
     96a:	fcc42783          	lw	a5,-52(s0)
     96e:	4681                	li	a3,0
     970:	4629                	li	a2,10
     972:	85ba                	mv	a1,a4
     974:	853e                	mv	a0,a5
     976:	00000097          	auipc	ra,0x0
     97a:	d86080e7          	jalr	-634(ra) # 6fc <printint>
     97e:	aa89                	j	ad0 <vprintf+0x23a>
      } else if(c == 'x') {
     980:	fdc42783          	lw	a5,-36(s0)
     984:	0007871b          	sext.w	a4,a5
     988:	07800793          	li	a5,120
     98c:	02f71463          	bne	a4,a5,9b4 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     990:	fb843783          	ld	a5,-72(s0)
     994:	00878713          	addi	a4,a5,8
     998:	fae43c23          	sd	a4,-72(s0)
     99c:	4398                	lw	a4,0(a5)
     99e:	fcc42783          	lw	a5,-52(s0)
     9a2:	4681                	li	a3,0
     9a4:	4641                	li	a2,16
     9a6:	85ba                	mv	a1,a4
     9a8:	853e                	mv	a0,a5
     9aa:	00000097          	auipc	ra,0x0
     9ae:	d52080e7          	jalr	-686(ra) # 6fc <printint>
     9b2:	aa39                	j	ad0 <vprintf+0x23a>
      } else if(c == 'p') {
     9b4:	fdc42783          	lw	a5,-36(s0)
     9b8:	0007871b          	sext.w	a4,a5
     9bc:	07000793          	li	a5,112
     9c0:	02f71263          	bne	a4,a5,9e4 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     9c4:	fb843783          	ld	a5,-72(s0)
     9c8:	00878713          	addi	a4,a5,8
     9cc:	fae43c23          	sd	a4,-72(s0)
     9d0:	6398                	ld	a4,0(a5)
     9d2:	fcc42783          	lw	a5,-52(s0)
     9d6:	85ba                	mv	a1,a4
     9d8:	853e                	mv	a0,a5
     9da:	00000097          	auipc	ra,0x0
     9de:	e30080e7          	jalr	-464(ra) # 80a <printptr>
     9e2:	a0fd                	j	ad0 <vprintf+0x23a>
      } else if(c == 's'){
     9e4:	fdc42783          	lw	a5,-36(s0)
     9e8:	0007871b          	sext.w	a4,a5
     9ec:	07300793          	li	a5,115
     9f0:	04f71c63          	bne	a4,a5,a48 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     9f4:	fb843783          	ld	a5,-72(s0)
     9f8:	00878713          	addi	a4,a5,8
     9fc:	fae43c23          	sd	a4,-72(s0)
     a00:	639c                	ld	a5,0(a5)
     a02:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     a06:	fe843783          	ld	a5,-24(s0)
     a0a:	eb8d                	bnez	a5,a3c <vprintf+0x1a6>
          s = "(null)";
     a0c:	00001797          	auipc	a5,0x1
     a10:	75478793          	addi	a5,a5,1876 # 2160 <schedule_edf_cbs+0x516>
     a14:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     a18:	a015                	j	a3c <vprintf+0x1a6>
          putc(fd, *s);
     a1a:	fe843783          	ld	a5,-24(s0)
     a1e:	0007c703          	lbu	a4,0(a5)
     a22:	fcc42783          	lw	a5,-52(s0)
     a26:	85ba                	mv	a1,a4
     a28:	853e                	mv	a0,a5
     a2a:	00000097          	auipc	ra,0x0
     a2e:	c9c080e7          	jalr	-868(ra) # 6c6 <putc>
          s++;
     a32:	fe843783          	ld	a5,-24(s0)
     a36:	0785                	addi	a5,a5,1
     a38:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     a3c:	fe843783          	ld	a5,-24(s0)
     a40:	0007c783          	lbu	a5,0(a5)
     a44:	fbf9                	bnez	a5,a1a <vprintf+0x184>
     a46:	a069                	j	ad0 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     a48:	fdc42783          	lw	a5,-36(s0)
     a4c:	0007871b          	sext.w	a4,a5
     a50:	06300793          	li	a5,99
     a54:	02f71463          	bne	a4,a5,a7c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     a58:	fb843783          	ld	a5,-72(s0)
     a5c:	00878713          	addi	a4,a5,8
     a60:	fae43c23          	sd	a4,-72(s0)
     a64:	439c                	lw	a5,0(a5)
     a66:	0ff7f713          	andi	a4,a5,255
     a6a:	fcc42783          	lw	a5,-52(s0)
     a6e:	85ba                	mv	a1,a4
     a70:	853e                	mv	a0,a5
     a72:	00000097          	auipc	ra,0x0
     a76:	c54080e7          	jalr	-940(ra) # 6c6 <putc>
     a7a:	a899                	j	ad0 <vprintf+0x23a>
      } else if(c == '%'){
     a7c:	fdc42783          	lw	a5,-36(s0)
     a80:	0007871b          	sext.w	a4,a5
     a84:	02500793          	li	a5,37
     a88:	00f71f63          	bne	a4,a5,aa6 <vprintf+0x210>
        putc(fd, c);
     a8c:	fdc42783          	lw	a5,-36(s0)
     a90:	0ff7f713          	andi	a4,a5,255
     a94:	fcc42783          	lw	a5,-52(s0)
     a98:	85ba                	mv	a1,a4
     a9a:	853e                	mv	a0,a5
     a9c:	00000097          	auipc	ra,0x0
     aa0:	c2a080e7          	jalr	-982(ra) # 6c6 <putc>
     aa4:	a035                	j	ad0 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     aa6:	fcc42783          	lw	a5,-52(s0)
     aaa:	02500593          	li	a1,37
     aae:	853e                	mv	a0,a5
     ab0:	00000097          	auipc	ra,0x0
     ab4:	c16080e7          	jalr	-1002(ra) # 6c6 <putc>
        putc(fd, c);
     ab8:	fdc42783          	lw	a5,-36(s0)
     abc:	0ff7f713          	andi	a4,a5,255
     ac0:	fcc42783          	lw	a5,-52(s0)
     ac4:	85ba                	mv	a1,a4
     ac6:	853e                	mv	a0,a5
     ac8:	00000097          	auipc	ra,0x0
     acc:	bfe080e7          	jalr	-1026(ra) # 6c6 <putc>
      }
      state = 0;
     ad0:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     ad4:	fe442783          	lw	a5,-28(s0)
     ad8:	2785                	addiw	a5,a5,1
     ada:	fef42223          	sw	a5,-28(s0)
     ade:	fe442783          	lw	a5,-28(s0)
     ae2:	fc043703          	ld	a4,-64(s0)
     ae6:	97ba                	add	a5,a5,a4
     ae8:	0007c783          	lbu	a5,0(a5)
     aec:	dc0795e3          	bnez	a5,8b6 <vprintf+0x20>
    }
  }
}
     af0:	0001                	nop
     af2:	0001                	nop
     af4:	60a6                	ld	ra,72(sp)
     af6:	6406                	ld	s0,64(sp)
     af8:	6161                	addi	sp,sp,80
     afa:	8082                	ret

0000000000000afc <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     afc:	7159                	addi	sp,sp,-112
     afe:	fc06                	sd	ra,56(sp)
     b00:	f822                	sd	s0,48(sp)
     b02:	0080                	addi	s0,sp,64
     b04:	fcb43823          	sd	a1,-48(s0)
     b08:	e010                	sd	a2,0(s0)
     b0a:	e414                	sd	a3,8(s0)
     b0c:	e818                	sd	a4,16(s0)
     b0e:	ec1c                	sd	a5,24(s0)
     b10:	03043023          	sd	a6,32(s0)
     b14:	03143423          	sd	a7,40(s0)
     b18:	87aa                	mv	a5,a0
     b1a:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     b1e:	03040793          	addi	a5,s0,48
     b22:	fcf43423          	sd	a5,-56(s0)
     b26:	fc843783          	ld	a5,-56(s0)
     b2a:	fd078793          	addi	a5,a5,-48
     b2e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     b32:	fe843703          	ld	a4,-24(s0)
     b36:	fdc42783          	lw	a5,-36(s0)
     b3a:	863a                	mv	a2,a4
     b3c:	fd043583          	ld	a1,-48(s0)
     b40:	853e                	mv	a0,a5
     b42:	00000097          	auipc	ra,0x0
     b46:	d54080e7          	jalr	-684(ra) # 896 <vprintf>
}
     b4a:	0001                	nop
     b4c:	70e2                	ld	ra,56(sp)
     b4e:	7442                	ld	s0,48(sp)
     b50:	6165                	addi	sp,sp,112
     b52:	8082                	ret

0000000000000b54 <printf>:

void
printf(const char *fmt, ...)
{
     b54:	7159                	addi	sp,sp,-112
     b56:	f406                	sd	ra,40(sp)
     b58:	f022                	sd	s0,32(sp)
     b5a:	1800                	addi	s0,sp,48
     b5c:	fca43c23          	sd	a0,-40(s0)
     b60:	e40c                	sd	a1,8(s0)
     b62:	e810                	sd	a2,16(s0)
     b64:	ec14                	sd	a3,24(s0)
     b66:	f018                	sd	a4,32(s0)
     b68:	f41c                	sd	a5,40(s0)
     b6a:	03043823          	sd	a6,48(s0)
     b6e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     b72:	04040793          	addi	a5,s0,64
     b76:	fcf43823          	sd	a5,-48(s0)
     b7a:	fd043783          	ld	a5,-48(s0)
     b7e:	fc878793          	addi	a5,a5,-56
     b82:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     b86:	fe843783          	ld	a5,-24(s0)
     b8a:	863e                	mv	a2,a5
     b8c:	fd843583          	ld	a1,-40(s0)
     b90:	4505                	li	a0,1
     b92:	00000097          	auipc	ra,0x0
     b96:	d04080e7          	jalr	-764(ra) # 896 <vprintf>
}
     b9a:	0001                	nop
     b9c:	70a2                	ld	ra,40(sp)
     b9e:	7402                	ld	s0,32(sp)
     ba0:	6165                	addi	sp,sp,112
     ba2:	8082                	ret

0000000000000ba4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     ba4:	7179                	addi	sp,sp,-48
     ba6:	f422                	sd	s0,40(sp)
     ba8:	1800                	addi	s0,sp,48
     baa:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     bae:	fd843783          	ld	a5,-40(s0)
     bb2:	17c1                	addi	a5,a5,-16
     bb4:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     bb8:	00002797          	auipc	a5,0x2
     bbc:	a8078793          	addi	a5,a5,-1408 # 2638 <freep>
     bc0:	639c                	ld	a5,0(a5)
     bc2:	fef43423          	sd	a5,-24(s0)
     bc6:	a815                	j	bfa <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     bc8:	fe843783          	ld	a5,-24(s0)
     bcc:	639c                	ld	a5,0(a5)
     bce:	fe843703          	ld	a4,-24(s0)
     bd2:	00f76f63          	bltu	a4,a5,bf0 <free+0x4c>
     bd6:	fe043703          	ld	a4,-32(s0)
     bda:	fe843783          	ld	a5,-24(s0)
     bde:	02e7eb63          	bltu	a5,a4,c14 <free+0x70>
     be2:	fe843783          	ld	a5,-24(s0)
     be6:	639c                	ld	a5,0(a5)
     be8:	fe043703          	ld	a4,-32(s0)
     bec:	02f76463          	bltu	a4,a5,c14 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     bf0:	fe843783          	ld	a5,-24(s0)
     bf4:	639c                	ld	a5,0(a5)
     bf6:	fef43423          	sd	a5,-24(s0)
     bfa:	fe043703          	ld	a4,-32(s0)
     bfe:	fe843783          	ld	a5,-24(s0)
     c02:	fce7f3e3          	bgeu	a5,a4,bc8 <free+0x24>
     c06:	fe843783          	ld	a5,-24(s0)
     c0a:	639c                	ld	a5,0(a5)
     c0c:	fe043703          	ld	a4,-32(s0)
     c10:	faf77ce3          	bgeu	a4,a5,bc8 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     c14:	fe043783          	ld	a5,-32(s0)
     c18:	479c                	lw	a5,8(a5)
     c1a:	1782                	slli	a5,a5,0x20
     c1c:	9381                	srli	a5,a5,0x20
     c1e:	0792                	slli	a5,a5,0x4
     c20:	fe043703          	ld	a4,-32(s0)
     c24:	973e                	add	a4,a4,a5
     c26:	fe843783          	ld	a5,-24(s0)
     c2a:	639c                	ld	a5,0(a5)
     c2c:	02f71763          	bne	a4,a5,c5a <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     c30:	fe043783          	ld	a5,-32(s0)
     c34:	4798                	lw	a4,8(a5)
     c36:	fe843783          	ld	a5,-24(s0)
     c3a:	639c                	ld	a5,0(a5)
     c3c:	479c                	lw	a5,8(a5)
     c3e:	9fb9                	addw	a5,a5,a4
     c40:	0007871b          	sext.w	a4,a5
     c44:	fe043783          	ld	a5,-32(s0)
     c48:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     c4a:	fe843783          	ld	a5,-24(s0)
     c4e:	639c                	ld	a5,0(a5)
     c50:	6398                	ld	a4,0(a5)
     c52:	fe043783          	ld	a5,-32(s0)
     c56:	e398                	sd	a4,0(a5)
     c58:	a039                	j	c66 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     c5a:	fe843783          	ld	a5,-24(s0)
     c5e:	6398                	ld	a4,0(a5)
     c60:	fe043783          	ld	a5,-32(s0)
     c64:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     c66:	fe843783          	ld	a5,-24(s0)
     c6a:	479c                	lw	a5,8(a5)
     c6c:	1782                	slli	a5,a5,0x20
     c6e:	9381                	srli	a5,a5,0x20
     c70:	0792                	slli	a5,a5,0x4
     c72:	fe843703          	ld	a4,-24(s0)
     c76:	97ba                	add	a5,a5,a4
     c78:	fe043703          	ld	a4,-32(s0)
     c7c:	02f71563          	bne	a4,a5,ca6 <free+0x102>
    p->s.size += bp->s.size;
     c80:	fe843783          	ld	a5,-24(s0)
     c84:	4798                	lw	a4,8(a5)
     c86:	fe043783          	ld	a5,-32(s0)
     c8a:	479c                	lw	a5,8(a5)
     c8c:	9fb9                	addw	a5,a5,a4
     c8e:	0007871b          	sext.w	a4,a5
     c92:	fe843783          	ld	a5,-24(s0)
     c96:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     c98:	fe043783          	ld	a5,-32(s0)
     c9c:	6398                	ld	a4,0(a5)
     c9e:	fe843783          	ld	a5,-24(s0)
     ca2:	e398                	sd	a4,0(a5)
     ca4:	a031                	j	cb0 <free+0x10c>
  } else
    p->s.ptr = bp;
     ca6:	fe843783          	ld	a5,-24(s0)
     caa:	fe043703          	ld	a4,-32(s0)
     cae:	e398                	sd	a4,0(a5)
  freep = p;
     cb0:	00002797          	auipc	a5,0x2
     cb4:	98878793          	addi	a5,a5,-1656 # 2638 <freep>
     cb8:	fe843703          	ld	a4,-24(s0)
     cbc:	e398                	sd	a4,0(a5)
}
     cbe:	0001                	nop
     cc0:	7422                	ld	s0,40(sp)
     cc2:	6145                	addi	sp,sp,48
     cc4:	8082                	ret

0000000000000cc6 <morecore>:

static Header*
morecore(uint nu)
{
     cc6:	7179                	addi	sp,sp,-48
     cc8:	f406                	sd	ra,40(sp)
     cca:	f022                	sd	s0,32(sp)
     ccc:	1800                	addi	s0,sp,48
     cce:	87aa                	mv	a5,a0
     cd0:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     cd4:	fdc42783          	lw	a5,-36(s0)
     cd8:	0007871b          	sext.w	a4,a5
     cdc:	6785                	lui	a5,0x1
     cde:	00f77563          	bgeu	a4,a5,ce8 <morecore+0x22>
    nu = 4096;
     ce2:	6785                	lui	a5,0x1
     ce4:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     ce8:	fdc42783          	lw	a5,-36(s0)
     cec:	0047979b          	slliw	a5,a5,0x4
     cf0:	2781                	sext.w	a5,a5
     cf2:	2781                	sext.w	a5,a5
     cf4:	853e                	mv	a0,a5
     cf6:	00000097          	auipc	ra,0x0
     cfa:	9a0080e7          	jalr	-1632(ra) # 696 <sbrk>
     cfe:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     d02:	fe843703          	ld	a4,-24(s0)
     d06:	57fd                	li	a5,-1
     d08:	00f71463          	bne	a4,a5,d10 <morecore+0x4a>
    return 0;
     d0c:	4781                	li	a5,0
     d0e:	a03d                	j	d3c <morecore+0x76>
  hp = (Header*)p;
     d10:	fe843783          	ld	a5,-24(s0)
     d14:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     d18:	fe043783          	ld	a5,-32(s0)
     d1c:	fdc42703          	lw	a4,-36(s0)
     d20:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     d22:	fe043783          	ld	a5,-32(s0)
     d26:	07c1                	addi	a5,a5,16
     d28:	853e                	mv	a0,a5
     d2a:	00000097          	auipc	ra,0x0
     d2e:	e7a080e7          	jalr	-390(ra) # ba4 <free>
  return freep;
     d32:	00002797          	auipc	a5,0x2
     d36:	90678793          	addi	a5,a5,-1786 # 2638 <freep>
     d3a:	639c                	ld	a5,0(a5)
}
     d3c:	853e                	mv	a0,a5
     d3e:	70a2                	ld	ra,40(sp)
     d40:	7402                	ld	s0,32(sp)
     d42:	6145                	addi	sp,sp,48
     d44:	8082                	ret

0000000000000d46 <malloc>:

void*
malloc(uint nbytes)
{
     d46:	7139                	addi	sp,sp,-64
     d48:	fc06                	sd	ra,56(sp)
     d4a:	f822                	sd	s0,48(sp)
     d4c:	0080                	addi	s0,sp,64
     d4e:	87aa                	mv	a5,a0
     d50:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     d54:	fcc46783          	lwu	a5,-52(s0)
     d58:	07bd                	addi	a5,a5,15
     d5a:	8391                	srli	a5,a5,0x4
     d5c:	2781                	sext.w	a5,a5
     d5e:	2785                	addiw	a5,a5,1
     d60:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     d64:	00002797          	auipc	a5,0x2
     d68:	8d478793          	addi	a5,a5,-1836 # 2638 <freep>
     d6c:	639c                	ld	a5,0(a5)
     d6e:	fef43023          	sd	a5,-32(s0)
     d72:	fe043783          	ld	a5,-32(s0)
     d76:	ef95                	bnez	a5,db2 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     d78:	00002797          	auipc	a5,0x2
     d7c:	8b078793          	addi	a5,a5,-1872 # 2628 <base>
     d80:	fef43023          	sd	a5,-32(s0)
     d84:	00002797          	auipc	a5,0x2
     d88:	8b478793          	addi	a5,a5,-1868 # 2638 <freep>
     d8c:	fe043703          	ld	a4,-32(s0)
     d90:	e398                	sd	a4,0(a5)
     d92:	00002797          	auipc	a5,0x2
     d96:	8a678793          	addi	a5,a5,-1882 # 2638 <freep>
     d9a:	6398                	ld	a4,0(a5)
     d9c:	00002797          	auipc	a5,0x2
     da0:	88c78793          	addi	a5,a5,-1908 # 2628 <base>
     da4:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     da6:	00002797          	auipc	a5,0x2
     daa:	88278793          	addi	a5,a5,-1918 # 2628 <base>
     dae:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     db2:	fe043783          	ld	a5,-32(s0)
     db6:	639c                	ld	a5,0(a5)
     db8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     dbc:	fe843783          	ld	a5,-24(s0)
     dc0:	4798                	lw	a4,8(a5)
     dc2:	fdc42783          	lw	a5,-36(s0)
     dc6:	2781                	sext.w	a5,a5
     dc8:	06f76863          	bltu	a4,a5,e38 <malloc+0xf2>
      if(p->s.size == nunits)
     dcc:	fe843783          	ld	a5,-24(s0)
     dd0:	4798                	lw	a4,8(a5)
     dd2:	fdc42783          	lw	a5,-36(s0)
     dd6:	2781                	sext.w	a5,a5
     dd8:	00e79963          	bne	a5,a4,dea <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     ddc:	fe843783          	ld	a5,-24(s0)
     de0:	6398                	ld	a4,0(a5)
     de2:	fe043783          	ld	a5,-32(s0)
     de6:	e398                	sd	a4,0(a5)
     de8:	a82d                	j	e22 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     dea:	fe843783          	ld	a5,-24(s0)
     dee:	4798                	lw	a4,8(a5)
     df0:	fdc42783          	lw	a5,-36(s0)
     df4:	40f707bb          	subw	a5,a4,a5
     df8:	0007871b          	sext.w	a4,a5
     dfc:	fe843783          	ld	a5,-24(s0)
     e00:	c798                	sw	a4,8(a5)
        p += p->s.size;
     e02:	fe843783          	ld	a5,-24(s0)
     e06:	479c                	lw	a5,8(a5)
     e08:	1782                	slli	a5,a5,0x20
     e0a:	9381                	srli	a5,a5,0x20
     e0c:	0792                	slli	a5,a5,0x4
     e0e:	fe843703          	ld	a4,-24(s0)
     e12:	97ba                	add	a5,a5,a4
     e14:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     e18:	fe843783          	ld	a5,-24(s0)
     e1c:	fdc42703          	lw	a4,-36(s0)
     e20:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     e22:	00002797          	auipc	a5,0x2
     e26:	81678793          	addi	a5,a5,-2026 # 2638 <freep>
     e2a:	fe043703          	ld	a4,-32(s0)
     e2e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     e30:	fe843783          	ld	a5,-24(s0)
     e34:	07c1                	addi	a5,a5,16
     e36:	a091                	j	e7a <malloc+0x134>
    }
    if(p == freep)
     e38:	00002797          	auipc	a5,0x2
     e3c:	80078793          	addi	a5,a5,-2048 # 2638 <freep>
     e40:	639c                	ld	a5,0(a5)
     e42:	fe843703          	ld	a4,-24(s0)
     e46:	02f71063          	bne	a4,a5,e66 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     e4a:	fdc42783          	lw	a5,-36(s0)
     e4e:	853e                	mv	a0,a5
     e50:	00000097          	auipc	ra,0x0
     e54:	e76080e7          	jalr	-394(ra) # cc6 <morecore>
     e58:	fea43423          	sd	a0,-24(s0)
     e5c:	fe843783          	ld	a5,-24(s0)
     e60:	e399                	bnez	a5,e66 <malloc+0x120>
        return 0;
     e62:	4781                	li	a5,0
     e64:	a819                	j	e7a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     e66:	fe843783          	ld	a5,-24(s0)
     e6a:	fef43023          	sd	a5,-32(s0)
     e6e:	fe843783          	ld	a5,-24(s0)
     e72:	639c                	ld	a5,0(a5)
     e74:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     e78:	b791                	j	dbc <malloc+0x76>
  }
}
     e7a:	853e                	mv	a0,a5
     e7c:	70e2                	ld	ra,56(sp)
     e7e:	7442                	ld	s0,48(sp)
     e80:	6121                	addi	sp,sp,64
     e82:	8082                	ret

0000000000000e84 <setjmp>:
     e84:	e100                	sd	s0,0(a0)
     e86:	e504                	sd	s1,8(a0)
     e88:	01253823          	sd	s2,16(a0)
     e8c:	01353c23          	sd	s3,24(a0)
     e90:	03453023          	sd	s4,32(a0)
     e94:	03553423          	sd	s5,40(a0)
     e98:	03653823          	sd	s6,48(a0)
     e9c:	03753c23          	sd	s7,56(a0)
     ea0:	05853023          	sd	s8,64(a0)
     ea4:	05953423          	sd	s9,72(a0)
     ea8:	05a53823          	sd	s10,80(a0)
     eac:	05b53c23          	sd	s11,88(a0)
     eb0:	06153023          	sd	ra,96(a0)
     eb4:	06253423          	sd	sp,104(a0)
     eb8:	4501                	li	a0,0
     eba:	8082                	ret

0000000000000ebc <longjmp>:
     ebc:	6100                	ld	s0,0(a0)
     ebe:	6504                	ld	s1,8(a0)
     ec0:	01053903          	ld	s2,16(a0)
     ec4:	01853983          	ld	s3,24(a0)
     ec8:	02053a03          	ld	s4,32(a0)
     ecc:	02853a83          	ld	s5,40(a0)
     ed0:	03053b03          	ld	s6,48(a0)
     ed4:	03853b83          	ld	s7,56(a0)
     ed8:	04053c03          	ld	s8,64(a0)
     edc:	04853c83          	ld	s9,72(a0)
     ee0:	05053d03          	ld	s10,80(a0)
     ee4:	05853d83          	ld	s11,88(a0)
     ee8:	06053083          	ld	ra,96(a0)
     eec:	06853103          	ld	sp,104(a0)
     ef0:	c199                	beqz	a1,ef6 <longjmp_1>
     ef2:	852e                	mv	a0,a1
     ef4:	8082                	ret

0000000000000ef6 <longjmp_1>:
     ef6:	4505                	li	a0,1
     ef8:	8082                	ret

0000000000000efa <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     efa:	7179                	addi	sp,sp,-48
     efc:	f422                	sd	s0,40(sp)
     efe:	1800                	addi	s0,sp,48
     f00:	fea43423          	sd	a0,-24(s0)
     f04:	feb43023          	sd	a1,-32(s0)
     f08:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     f0c:	fd843783          	ld	a5,-40(s0)
     f10:	fe843703          	ld	a4,-24(s0)
     f14:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     f16:	fe843783          	ld	a5,-24(s0)
     f1a:	fd843703          	ld	a4,-40(s0)
     f1e:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     f20:	fe843783          	ld	a5,-24(s0)
     f24:	fe043703          	ld	a4,-32(s0)
     f28:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     f2a:	fe043783          	ld	a5,-32(s0)
     f2e:	fe843703          	ld	a4,-24(s0)
     f32:	e398                	sd	a4,0(a5)
 }
     f34:	0001                	nop
     f36:	7422                	ld	s0,40(sp)
     f38:	6145                	addi	sp,sp,48
     f3a:	8082                	ret

0000000000000f3c <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     f3c:	1101                	addi	sp,sp,-32
     f3e:	ec06                	sd	ra,24(sp)
     f40:	e822                	sd	s0,16(sp)
     f42:	1000                	addi	s0,sp,32
     f44:	fea43423          	sd	a0,-24(s0)
     f48:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     f4c:	fe043783          	ld	a5,-32(s0)
     f50:	679c                	ld	a5,8(a5)
     f52:	fe043603          	ld	a2,-32(s0)
     f56:	85be                	mv	a1,a5
     f58:	fe843503          	ld	a0,-24(s0)
     f5c:	00000097          	auipc	ra,0x0
     f60:	f9e080e7          	jalr	-98(ra) # efa <__list_add>
 }
     f64:	0001                	nop
     f66:	60e2                	ld	ra,24(sp)
     f68:	6442                	ld	s0,16(sp)
     f6a:	6105                	addi	sp,sp,32
     f6c:	8082                	ret

0000000000000f6e <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     f6e:	1101                	addi	sp,sp,-32
     f70:	ec22                	sd	s0,24(sp)
     f72:	1000                	addi	s0,sp,32
     f74:	fea43423          	sd	a0,-24(s0)
     f78:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
     f7c:	fe043783          	ld	a5,-32(s0)
     f80:	fe843703          	ld	a4,-24(s0)
     f84:	e798                	sd	a4,8(a5)
     prev->next = next;
     f86:	fe843783          	ld	a5,-24(s0)
     f8a:	fe043703          	ld	a4,-32(s0)
     f8e:	e398                	sd	a4,0(a5)
 }
     f90:	0001                	nop
     f92:	6462                	ld	s0,24(sp)
     f94:	6105                	addi	sp,sp,32
     f96:	8082                	ret

0000000000000f98 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     f98:	1101                	addi	sp,sp,-32
     f9a:	ec06                	sd	ra,24(sp)
     f9c:	e822                	sd	s0,16(sp)
     f9e:	1000                	addi	s0,sp,32
     fa0:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
     fa4:	fe843783          	ld	a5,-24(s0)
     fa8:	6798                	ld	a4,8(a5)
     faa:	fe843783          	ld	a5,-24(s0)
     fae:	639c                	ld	a5,0(a5)
     fb0:	85be                	mv	a1,a5
     fb2:	853a                	mv	a0,a4
     fb4:	00000097          	auipc	ra,0x0
     fb8:	fba080e7          	jalr	-70(ra) # f6e <__list_del>
     entry->next = LIST_POISON1;
     fbc:	fe843783          	ld	a5,-24(s0)
     fc0:	00100737          	lui	a4,0x100
     fc4:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd520>
     fc8:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
     fca:	fe843783          	ld	a5,-24(s0)
     fce:	00200737          	lui	a4,0x200
     fd2:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd620>
     fd6:	e798                	sd	a4,8(a5)
 }
     fd8:	0001                	nop
     fda:	60e2                	ld	ra,24(sp)
     fdc:	6442                	ld	s0,16(sp)
     fde:	6105                	addi	sp,sp,32
     fe0:	8082                	ret

0000000000000fe2 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
     fe2:	1101                	addi	sp,sp,-32
     fe4:	ec22                	sd	s0,24(sp)
     fe6:	1000                	addi	s0,sp,32
     fe8:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
     fec:	fe843783          	ld	a5,-24(s0)
     ff0:	639c                	ld	a5,0(a5)
     ff2:	fe843703          	ld	a4,-24(s0)
     ff6:	40f707b3          	sub	a5,a4,a5
     ffa:	0017b793          	seqz	a5,a5
     ffe:	0ff7f793          	andi	a5,a5,255
    1002:	2781                	sext.w	a5,a5
 }
    1004:	853e                	mv	a0,a5
    1006:	6462                	ld	s0,24(sp)
    1008:	6105                	addi	sp,sp,32
    100a:	8082                	ret

000000000000100c <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
    100c:	715d                	addi	sp,sp,-80
    100e:	e486                	sd	ra,72(sp)
    1010:	e0a2                	sd	s0,64(sp)
    1012:	0880                	addi	s0,sp,80
    1014:	fca43423          	sd	a0,-56(s0)
    1018:	fcb43023          	sd	a1,-64(s0)
    101c:	85b2                	mv	a1,a2
    101e:	8636                	mv	a2,a3
    1020:	86ba                	mv	a3,a4
    1022:	873e                	mv	a4,a5
    1024:	87ae                	mv	a5,a1
    1026:	faf42e23          	sw	a5,-68(s0)
    102a:	87b2                	mv	a5,a2
    102c:	faf42c23          	sw	a5,-72(s0)
    1030:	87b6                	mv	a5,a3
    1032:	faf42a23          	sw	a5,-76(s0)
    1036:	87ba                	mv	a5,a4
    1038:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
    103c:	08000513          	li	a0,128
    1040:	00000097          	auipc	ra,0x0
    1044:	d06080e7          	jalr	-762(ra) # d46 <malloc>
    1048:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
    104c:	6505                	lui	a0,0x1
    104e:	00000097          	auipc	ra,0x0
    1052:	cf8080e7          	jalr	-776(ra) # d46 <malloc>
    1056:	87aa                	mv	a5,a0
    1058:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
    105c:	fe043703          	ld	a4,-32(s0)
    1060:	6785                	lui	a5,0x1
    1062:	17c1                	addi	a5,a5,-16
    1064:	97ba                	add	a5,a5,a4
    1066:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
    106a:	fe843783          	ld	a5,-24(s0)
    106e:	fc843703          	ld	a4,-56(s0)
    1072:	e398                	sd	a4,0(a5)
    t->arg = arg;
    1074:	fe843783          	ld	a5,-24(s0)
    1078:	fc043703          	ld	a4,-64(s0)
    107c:	e798                	sd	a4,8(a5)
    t->ID = _id++;
    107e:	00001797          	auipc	a5,0x1
    1082:	39e78793          	addi	a5,a5,926 # 241c <_id.1241>
    1086:	439c                	lw	a5,0(a5)
    1088:	0017871b          	addiw	a4,a5,1
    108c:	0007069b          	sext.w	a3,a4
    1090:	00001717          	auipc	a4,0x1
    1094:	38c70713          	addi	a4,a4,908 # 241c <_id.1241>
    1098:	c314                	sw	a3,0(a4)
    109a:	fe843703          	ld	a4,-24(s0)
    109e:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    10a0:	fe843783          	ld	a5,-24(s0)
    10a4:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    10a8:	fe043703          	ld	a4,-32(s0)
    10ac:	fe843783          	ld	a5,-24(s0)
    10b0:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    10b2:	fd843703          	ld	a4,-40(s0)
    10b6:	fe843783          	ld	a5,-24(s0)
    10ba:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    10bc:	fe843783          	ld	a5,-24(s0)
    10c0:	fb842703          	lw	a4,-72(s0)
    10c4:	c3f8                	sw	a4,68(a5)
    t->period = period;
    10c6:	fe843783          	ld	a5,-24(s0)
    10ca:	fb442703          	lw	a4,-76(s0)
    10ce:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
    10d0:	fe843783          	ld	a5,-24(s0)
    10d4:	fb442703          	lw	a4,-76(s0)
    10d8:	c7b8                	sw	a4,72(a5)
    t->n = n;
    10da:	fe843783          	ld	a5,-24(s0)
    10de:	fb042703          	lw	a4,-80(s0)
    10e2:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    10e4:	fe843783          	ld	a5,-24(s0)
    10e8:	fbc42703          	lw	a4,-68(s0)
    10ec:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    10ee:	fe843783          	ld	a5,-24(s0)
    10f2:	fb842703          	lw	a4,-72(s0)
    10f6:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    10f8:	fe843783          	ld	a5,-24(s0)
    10fc:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    1100:	fe843783          	ld	a5,-24(s0)
    1104:	06400713          	li	a4,100
    1108:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    110a:	fe843783          	ld	a5,-24(s0)
    110e:	671d                	lui	a4,0x7
    1110:	5307071b          	addiw	a4,a4,1328
    1114:	d3b8                	sw	a4,96(a5)
    
    return t;
    1116:	fe843783          	ld	a5,-24(s0)
}
    111a:	853e                	mv	a0,a5
    111c:	60a6                	ld	ra,72(sp)
    111e:	6406                	ld	s0,64(sp)
    1120:	6161                	addi	sp,sp,80
    1122:	8082                	ret

0000000000001124 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    1124:	1101                	addi	sp,sp,-32
    1126:	ec22                	sd	s0,24(sp)
    1128:	1000                	addi	s0,sp,32
    112a:	fea43423          	sd	a0,-24(s0)
    112e:	87ae                	mv	a5,a1
    1130:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    1134:	fe843783          	ld	a5,-24(s0)
    1138:	fe442703          	lw	a4,-28(s0)
    113c:	cff8                	sw	a4,92(a5)
}
    113e:	0001                	nop
    1140:	6462                	ld	s0,24(sp)
    1142:	6105                	addi	sp,sp,32
    1144:	8082                	ret

0000000000001146 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    1146:	1101                	addi	sp,sp,-32
    1148:	ec22                	sd	s0,24(sp)
    114a:	1000                	addi	s0,sp,32
    114c:	fea43423          	sd	a0,-24(s0)
    1150:	87ae                	mv	a5,a1
    1152:	8732                	mv	a4,a2
    1154:	fef42223          	sw	a5,-28(s0)
    1158:	87ba                	mv	a5,a4
    115a:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    115e:	fe843783          	ld	a5,-24(s0)
    1162:	fe442703          	lw	a4,-28(s0)
    1166:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    1168:	fe843783          	ld	a5,-24(s0)
    116c:	fe442703          	lw	a4,-28(s0)
    1170:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    1172:	fe843783          	ld	a5,-24(s0)
    1176:	fe042703          	lw	a4,-32(s0)
    117a:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    117c:	fe843783          	ld	a5,-24(s0)
    1180:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1184:	fe843783          	ld	a5,-24(s0)
    1188:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    118c:	fe843783          	ld	a5,-24(s0)
    1190:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    1194:	fe843783          	ld	a5,-24(s0)
    1198:	0607ae23          	sw	zero,124(a5)
}
    119c:	0001                	nop
    119e:	6462                	ld	s0,24(sp)
    11a0:	6105                	addi	sp,sp,32
    11a2:	8082                	ret

00000000000011a4 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    11a4:	7179                	addi	sp,sp,-48
    11a6:	f406                	sd	ra,40(sp)
    11a8:	f022                	sd	s0,32(sp)
    11aa:	1800                	addi	s0,sp,48
    11ac:	fca43c23          	sd	a0,-40(s0)
    11b0:	87ae                	mv	a5,a1
    11b2:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    11b6:	02000513          	li	a0,32
    11ba:	00000097          	auipc	ra,0x0
    11be:	b8c080e7          	jalr	-1140(ra) # d46 <malloc>
    11c2:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    11c6:	fe843783          	ld	a5,-24(s0)
    11ca:	fd843703          	ld	a4,-40(s0)
    11ce:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    11d0:	fe843783          	ld	a5,-24(s0)
    11d4:	fd442703          	lw	a4,-44(s0)
    11d8:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    11da:	fd843783          	ld	a5,-40(s0)
    11de:	fd442703          	lw	a4,-44(s0)
    11e2:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    11e4:	fd843783          	ld	a5,-40(s0)
    11e8:	43bc                	lw	a5,64(a5)
    11ea:	cf81                	beqz	a5,1202 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    11ec:	fd843783          	ld	a5,-40(s0)
    11f0:	47bc                	lw	a5,72(a5)
    11f2:	fd442703          	lw	a4,-44(s0)
    11f6:	9fb9                	addw	a5,a5,a4
    11f8:	0007871b          	sext.w	a4,a5
    11fc:	fd843783          	ld	a5,-40(s0)
    1200:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1202:	fe843783          	ld	a5,-24(s0)
    1206:	07a1                	addi	a5,a5,8
    1208:	00001597          	auipc	a1,0x1
    120c:	20058593          	addi	a1,a1,512 # 2408 <release_queue>
    1210:	853e                	mv	a0,a5
    1212:	00000097          	auipc	ra,0x0
    1216:	d2a080e7          	jalr	-726(ra) # f3c <list_add_tail>
}
    121a:	0001                	nop
    121c:	70a2                	ld	ra,40(sp)
    121e:	7402                	ld	s0,32(sp)
    1220:	6145                	addi	sp,sp,48
    1222:	8082                	ret

0000000000001224 <__release>:

void __release()
{
    1224:	7139                	addi	sp,sp,-64
    1226:	fc06                	sd	ra,56(sp)
    1228:	f822                	sd	s0,48(sp)
    122a:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    122c:	00001797          	auipc	a5,0x1
    1230:	1dc78793          	addi	a5,a5,476 # 2408 <release_queue>
    1234:	639c                	ld	a5,0(a5)
    1236:	fcf43c23          	sd	a5,-40(s0)
    123a:	fd843783          	ld	a5,-40(s0)
    123e:	17e1                	addi	a5,a5,-8
    1240:	fef43423          	sd	a5,-24(s0)
    1244:	fe843783          	ld	a5,-24(s0)
    1248:	679c                	ld	a5,8(a5)
    124a:	fcf43823          	sd	a5,-48(s0)
    124e:	fd043783          	ld	a5,-48(s0)
    1252:	17e1                	addi	a5,a5,-8
    1254:	fef43023          	sd	a5,-32(s0)
    1258:	a0e9                	j	1322 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    125a:	fe843783          	ld	a5,-24(s0)
    125e:	4f98                	lw	a4,24(a5)
    1260:	00001797          	auipc	a5,0x1
    1264:	3e878793          	addi	a5,a5,1000 # 2648 <threading_system_time>
    1268:	439c                	lw	a5,0(a5)
    126a:	08e7ce63          	blt	a5,a4,1306 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    126e:	fe843783          	ld	a5,-24(s0)
    1272:	639c                	ld	a5,0(a5)
    1274:	5bbc                	lw	a5,112(a5)
    1276:	c79d                	beqz	a5,12a4 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    1278:	fe843783          	ld	a5,-24(s0)
    127c:	639c                	ld	a5,0(a5)
    127e:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    1282:	fe843783          	ld	a5,-24(s0)
    1286:	6398                	ld	a4,0(a5)
    1288:	fe843783          	ld	a5,-24(s0)
    128c:	639c                	ld	a5,0(a5)
    128e:	5378                	lw	a4,100(a4)
    1290:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    1292:	fe843783          	ld	a5,-24(s0)
    1296:	6398                	ld	a4,0(a5)
    1298:	fe843783          	ld	a5,-24(s0)
    129c:	639c                	ld	a5,0(a5)
    129e:	5f78                	lw	a4,124(a4)
    12a0:	cbf8                	sw	a4,84(a5)
    12a2:	a809                	j	12b4 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    12a4:	fe843783          	ld	a5,-24(s0)
    12a8:	6398                	ld	a4,0(a5)
    12aa:	fe843783          	ld	a5,-24(s0)
    12ae:	639c                	ld	a5,0(a5)
    12b0:	4378                	lw	a4,68(a4)
    12b2:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    12b4:	fe843783          	ld	a5,-24(s0)
    12b8:	4f94                	lw	a3,24(a5)
    12ba:	fe843783          	ld	a5,-24(s0)
    12be:	639c                	ld	a5,0(a5)
    12c0:	47b8                	lw	a4,72(a5)
    12c2:	fe843783          	ld	a5,-24(s0)
    12c6:	639c                	ld	a5,0(a5)
    12c8:	9f35                	addw	a4,a4,a3
    12ca:	2701                	sext.w	a4,a4
    12cc:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    12ce:	fe843783          	ld	a5,-24(s0)
    12d2:	639c                	ld	a5,0(a5)
    12d4:	02878793          	addi	a5,a5,40
    12d8:	00001597          	auipc	a1,0x1
    12dc:	12058593          	addi	a1,a1,288 # 23f8 <run_queue>
    12e0:	853e                	mv	a0,a5
    12e2:	00000097          	auipc	ra,0x0
    12e6:	c5a080e7          	jalr	-934(ra) # f3c <list_add_tail>
            list_del(&cur->thread_list);
    12ea:	fe843783          	ld	a5,-24(s0)
    12ee:	07a1                	addi	a5,a5,8
    12f0:	853e                	mv	a0,a5
    12f2:	00000097          	auipc	ra,0x0
    12f6:	ca6080e7          	jalr	-858(ra) # f98 <list_del>
            free(cur);
    12fa:	fe843503          	ld	a0,-24(s0)
    12fe:	00000097          	auipc	ra,0x0
    1302:	8a6080e7          	jalr	-1882(ra) # ba4 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1306:	fe043783          	ld	a5,-32(s0)
    130a:	fef43423          	sd	a5,-24(s0)
    130e:	fe043783          	ld	a5,-32(s0)
    1312:	679c                	ld	a5,8(a5)
    1314:	fcf43423          	sd	a5,-56(s0)
    1318:	fc843783          	ld	a5,-56(s0)
    131c:	17e1                	addi	a5,a5,-8
    131e:	fef43023          	sd	a5,-32(s0)
    1322:	fe843783          	ld	a5,-24(s0)
    1326:	00878713          	addi	a4,a5,8
    132a:	00001797          	auipc	a5,0x1
    132e:	0de78793          	addi	a5,a5,222 # 2408 <release_queue>
    1332:	f2f714e3          	bne	a4,a5,125a <__release+0x36>
        }
    }
}
    1336:	0001                	nop
    1338:	0001                	nop
    133a:	70e2                	ld	ra,56(sp)
    133c:	7442                	ld	s0,48(sp)
    133e:	6121                	addi	sp,sp,64
    1340:	8082                	ret

0000000000001342 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    1342:	1101                	addi	sp,sp,-32
    1344:	ec06                	sd	ra,24(sp)
    1346:	e822                	sd	s0,16(sp)
    1348:	1000                	addi	s0,sp,32
    134a:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    134e:	fe843783          	ld	a5,-24(s0)
    1352:	7b98                	ld	a4,48(a5)
    1354:	00001797          	auipc	a5,0x1
    1358:	2ec78793          	addi	a5,a5,748 # 2640 <current>
    135c:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    135e:	fe843783          	ld	a5,-24(s0)
    1362:	02878793          	addi	a5,a5,40
    1366:	853e                	mv	a0,a5
    1368:	00000097          	auipc	ra,0x0
    136c:	c30080e7          	jalr	-976(ra) # f98 <list_del>

    free(to_remove->stack);
    1370:	fe843783          	ld	a5,-24(s0)
    1374:	6b9c                	ld	a5,16(a5)
    1376:	853e                	mv	a0,a5
    1378:	00000097          	auipc	ra,0x0
    137c:	82c080e7          	jalr	-2004(ra) # ba4 <free>
    free(to_remove);
    1380:	fe843503          	ld	a0,-24(s0)
    1384:	00000097          	auipc	ra,0x0
    1388:	820080e7          	jalr	-2016(ra) # ba4 <free>

    __schedule();
    138c:	00000097          	auipc	ra,0x0
    1390:	5e8080e7          	jalr	1512(ra) # 1974 <__schedule>
    __dispatch();
    1394:	00000097          	auipc	ra,0x0
    1398:	416080e7          	jalr	1046(ra) # 17aa <__dispatch>
    thrdresume(main_thrd_id);
    139c:	00001797          	auipc	a5,0x1
    13a0:	07c78793          	addi	a5,a5,124 # 2418 <main_thrd_id>
    13a4:	439c                	lw	a5,0(a5)
    13a6:	853e                	mv	a0,a5
    13a8:	fffff097          	auipc	ra,0xfffff
    13ac:	30e080e7          	jalr	782(ra) # 6b6 <thrdresume>
}
    13b0:	0001                	nop
    13b2:	60e2                	ld	ra,24(sp)
    13b4:	6442                	ld	s0,16(sp)
    13b6:	6105                	addi	sp,sp,32
    13b8:	8082                	ret

00000000000013ba <thread_exit>:

void thread_exit(void)
{
    13ba:	7179                	addi	sp,sp,-48
    13bc:	f406                	sd	ra,40(sp)
    13be:	f022                	sd	s0,32(sp)
    13c0:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    13c2:	00001797          	auipc	a5,0x1
    13c6:	27e78793          	addi	a5,a5,638 # 2640 <current>
    13ca:	6398                	ld	a4,0(a5)
    13cc:	00001797          	auipc	a5,0x1
    13d0:	02c78793          	addi	a5,a5,44 # 23f8 <run_queue>
    13d4:	02f71063          	bne	a4,a5,13f4 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    13d8:	00001597          	auipc	a1,0x1
    13dc:	d9058593          	addi	a1,a1,-624 # 2168 <schedule_edf_cbs+0x51e>
    13e0:	4509                	li	a0,2
    13e2:	fffff097          	auipc	ra,0xfffff
    13e6:	71a080e7          	jalr	1818(ra) # afc <fprintf>
        exit(1);
    13ea:	4505                	li	a0,1
    13ec:	fffff097          	auipc	ra,0xfffff
    13f0:	222080e7          	jalr	546(ra) # 60e <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    13f4:	00001797          	auipc	a5,0x1
    13f8:	24c78793          	addi	a5,a5,588 # 2640 <current>
    13fc:	639c                	ld	a5,0(a5)
    13fe:	fef43423          	sd	a5,-24(s0)
    1402:	fe843783          	ld	a5,-24(s0)
    1406:	fd878793          	addi	a5,a5,-40
    140a:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    140e:	fe043783          	ld	a5,-32(s0)
    1412:	5f9c                	lw	a5,56(a5)
    1414:	4585                	li	a1,1
    1416:	853e                	mv	a0,a5
    1418:	fffff097          	auipc	ra,0xfffff
    141c:	2a6080e7          	jalr	678(ra) # 6be <cancelthrdstop>
    1420:	87aa                	mv	a5,a0
    1422:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    1426:	00001797          	auipc	a5,0x1
    142a:	22278793          	addi	a5,a5,546 # 2648 <threading_system_time>
    142e:	439c                	lw	a5,0(a5)
    1430:	fdc42703          	lw	a4,-36(s0)
    1434:	9fb9                	addw	a5,a5,a4
    1436:	0007871b          	sext.w	a4,a5
    143a:	00001797          	auipc	a5,0x1
    143e:	20e78793          	addi	a5,a5,526 # 2648 <threading_system_time>
    1442:	c398                	sw	a4,0(a5)

    __release();
    1444:	00000097          	auipc	ra,0x0
    1448:	de0080e7          	jalr	-544(ra) # 1224 <__release>
    __thread_exit(to_remove);
    144c:	fe043503          	ld	a0,-32(s0)
    1450:	00000097          	auipc	ra,0x0
    1454:	ef2080e7          	jalr	-270(ra) # 1342 <__thread_exit>
}
    1458:	0001                	nop
    145a:	70a2                	ld	ra,40(sp)
    145c:	7402                	ld	s0,32(sp)
    145e:	6145                	addi	sp,sp,48
    1460:	8082                	ret

0000000000001462 <__finish_current>:

void __finish_current()
{
    1462:	7179                	addi	sp,sp,-48
    1464:	f406                	sd	ra,40(sp)
    1466:	f022                	sd	s0,32(sp)
    1468:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    146a:	00001797          	auipc	a5,0x1
    146e:	1d678793          	addi	a5,a5,470 # 2640 <current>
    1472:	639c                	ld	a5,0(a5)
    1474:	fef43423          	sd	a5,-24(s0)
    1478:	fe843783          	ld	a5,-24(s0)
    147c:	fd878793          	addi	a5,a5,-40
    1480:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1484:	fe043783          	ld	a5,-32(s0)
    1488:	4bbc                	lw	a5,80(a5)
    148a:	37fd                	addiw	a5,a5,-1
    148c:	0007871b          	sext.w	a4,a5
    1490:	fe043783          	ld	a5,-32(s0)
    1494:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    1496:	fe043783          	ld	a5,-32(s0)
    149a:	5fd8                	lw	a4,60(a5)
    149c:	00001797          	auipc	a5,0x1
    14a0:	1ac78793          	addi	a5,a5,428 # 2648 <threading_system_time>
    14a4:	4390                	lw	a2,0(a5)
    14a6:	fe043783          	ld	a5,-32(s0)
    14aa:	4bbc                	lw	a5,80(a5)
    14ac:	86be                	mv	a3,a5
    14ae:	85ba                	mv	a1,a4
    14b0:	00001517          	auipc	a0,0x1
    14b4:	cf050513          	addi	a0,a0,-784 # 21a0 <schedule_edf_cbs+0x556>
    14b8:	fffff097          	auipc	ra,0xfffff
    14bc:	69c080e7          	jalr	1692(ra) # b54 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    14c0:	fe043783          	ld	a5,-32(s0)
    14c4:	4bbc                	lw	a5,80(a5)
    14c6:	04f05563          	blez	a5,1510 <__finish_current+0xae>
        struct list_head *to_remove = current;
    14ca:	00001797          	auipc	a5,0x1
    14ce:	17678793          	addi	a5,a5,374 # 2640 <current>
    14d2:	639c                	ld	a5,0(a5)
    14d4:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    14d8:	00001797          	auipc	a5,0x1
    14dc:	16878793          	addi	a5,a5,360 # 2640 <current>
    14e0:	639c                	ld	a5,0(a5)
    14e2:	6798                	ld	a4,8(a5)
    14e4:	00001797          	auipc	a5,0x1
    14e8:	15c78793          	addi	a5,a5,348 # 2640 <current>
    14ec:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    14ee:	fd843503          	ld	a0,-40(s0)
    14f2:	00000097          	auipc	ra,0x0
    14f6:	aa6080e7          	jalr	-1370(ra) # f98 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    14fa:	fe043783          	ld	a5,-32(s0)
    14fe:	4fbc                	lw	a5,88(a5)
    1500:	85be                	mv	a1,a5
    1502:	fe043503          	ld	a0,-32(s0)
    1506:	00000097          	auipc	ra,0x0
    150a:	c9e080e7          	jalr	-866(ra) # 11a4 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    150e:	a039                	j	151c <__finish_current+0xba>
        __thread_exit(current_thread);
    1510:	fe043503          	ld	a0,-32(s0)
    1514:	00000097          	auipc	ra,0x0
    1518:	e2e080e7          	jalr	-466(ra) # 1342 <__thread_exit>
}
    151c:	0001                	nop
    151e:	70a2                	ld	ra,40(sp)
    1520:	7402                	ld	s0,32(sp)
    1522:	6145                	addi	sp,sp,48
    1524:	8082                	ret

0000000000001526 <__rt_finish_current>:
void __rt_finish_current()
{
    1526:	7179                	addi	sp,sp,-48
    1528:	f406                	sd	ra,40(sp)
    152a:	f022                	sd	s0,32(sp)
    152c:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    152e:	00001797          	auipc	a5,0x1
    1532:	11278793          	addi	a5,a5,274 # 2640 <current>
    1536:	639c                	ld	a5,0(a5)
    1538:	fef43423          	sd	a5,-24(s0)
    153c:	fe843783          	ld	a5,-24(s0)
    1540:	fd878793          	addi	a5,a5,-40
    1544:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1548:	fe043783          	ld	a5,-32(s0)
    154c:	4bbc                	lw	a5,80(a5)
    154e:	37fd                	addiw	a5,a5,-1
    1550:	0007871b          	sext.w	a4,a5
    1554:	fe043783          	ld	a5,-32(s0)
    1558:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    155a:	fe043783          	ld	a5,-32(s0)
    155e:	5fd8                	lw	a4,60(a5)
    1560:	00001797          	auipc	a5,0x1
    1564:	0e878793          	addi	a5,a5,232 # 2648 <threading_system_time>
    1568:	4390                	lw	a2,0(a5)
    156a:	fe043783          	ld	a5,-32(s0)
    156e:	4bbc                	lw	a5,80(a5)
    1570:	86be                	mv	a3,a5
    1572:	85ba                	mv	a1,a4
    1574:	00001517          	auipc	a0,0x1
    1578:	c4450513          	addi	a0,a0,-956 # 21b8 <schedule_edf_cbs+0x56e>
    157c:	fffff097          	auipc	ra,0xfffff
    1580:	5d8080e7          	jalr	1496(ra) # b54 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1584:	fe043783          	ld	a5,-32(s0)
    1588:	4bbc                	lw	a5,80(a5)
    158a:	04f05f63          	blez	a5,15e8 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    158e:	00001797          	auipc	a5,0x1
    1592:	0b278793          	addi	a5,a5,178 # 2640 <current>
    1596:	639c                	ld	a5,0(a5)
    1598:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    159c:	00001797          	auipc	a5,0x1
    15a0:	0a478793          	addi	a5,a5,164 # 2640 <current>
    15a4:	639c                	ld	a5,0(a5)
    15a6:	6798                	ld	a4,8(a5)
    15a8:	00001797          	auipc	a5,0x1
    15ac:	09878793          	addi	a5,a5,152 # 2640 <current>
    15b0:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    15b2:	fd843503          	ld	a0,-40(s0)
    15b6:	00000097          	auipc	ra,0x0
    15ba:	9e2080e7          	jalr	-1566(ra) # f98 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    15be:	fe043783          	ld	a5,-32(s0)
    15c2:	4fbc                	lw	a5,88(a5)
    15c4:	85be                	mv	a1,a5
    15c6:	fe043503          	ld	a0,-32(s0)
    15ca:	00000097          	auipc	ra,0x0
    15ce:	bda080e7          	jalr	-1062(ra) # 11a4 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    15d2:	fe043783          	ld	a5,-32(s0)
    15d6:	57fc                	lw	a5,108(a5)
    15d8:	ef91                	bnez	a5,15f4 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    15da:	fe043783          	ld	a5,-32(s0)
    15de:	53f8                	lw	a4,100(a5)
    15e0:	fe043783          	ld	a5,-32(s0)
    15e4:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    15e6:	a039                	j	15f4 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    15e8:	fe043503          	ld	a0,-32(s0)
    15ec:	00000097          	auipc	ra,0x0
    15f0:	d56080e7          	jalr	-682(ra) # 1342 <__thread_exit>
}
    15f4:	0001                	nop
    15f6:	70a2                	ld	ra,40(sp)
    15f8:	7402                	ld	s0,32(sp)
    15fa:	6145                	addi	sp,sp,48
    15fc:	8082                	ret

00000000000015fe <switch_handler>:

void switch_handler(void *arg)
{
    15fe:	7139                	addi	sp,sp,-64
    1600:	fc06                	sd	ra,56(sp)
    1602:	f822                	sd	s0,48(sp)
    1604:	0080                	addi	s0,sp,64
    1606:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    160a:	fc843783          	ld	a5,-56(s0)
    160e:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1612:	00001797          	auipc	a5,0x1
    1616:	02e78793          	addi	a5,a5,46 # 2640 <current>
    161a:	639c                	ld	a5,0(a5)
    161c:	fef43023          	sd	a5,-32(s0)
    1620:	fe043783          	ld	a5,-32(s0)
    1624:	fd878793          	addi	a5,a5,-40
    1628:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    162c:	fe843783          	ld	a5,-24(s0)
    1630:	0007871b          	sext.w	a4,a5
    1634:	00001797          	auipc	a5,0x1
    1638:	01478793          	addi	a5,a5,20 # 2648 <threading_system_time>
    163c:	439c                	lw	a5,0(a5)
    163e:	2781                	sext.w	a5,a5
    1640:	9fb9                	addw	a5,a5,a4
    1642:	2781                	sext.w	a5,a5
    1644:	0007871b          	sext.w	a4,a5
    1648:	00001797          	auipc	a5,0x1
    164c:	00078793          	mv	a5,a5
    1650:	c398                	sw	a4,0(a5)
     __release();
    1652:	00000097          	auipc	ra,0x0
    1656:	bd2080e7          	jalr	-1070(ra) # 1224 <__release>
    current_thread->remaining_time -= elapsed_time;
    165a:	fd843783          	ld	a5,-40(s0)
    165e:	4bfc                	lw	a5,84(a5)
    1660:	0007871b          	sext.w	a4,a5
    1664:	fe843783          	ld	a5,-24(s0)
    1668:	2781                	sext.w	a5,a5
    166a:	40f707bb          	subw	a5,a4,a5
    166e:	2781                	sext.w	a5,a5
    1670:	0007871b          	sext.w	a4,a5
    1674:	fd843783          	ld	a5,-40(s0)
    1678:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    167a:	fd843783          	ld	a5,-40(s0)
    167e:	57fc                	lw	a5,108(a5)
    1680:	e38d                	bnez	a5,16a2 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    1682:	fd843783          	ld	a5,-40(s0)
    1686:	57bc                	lw	a5,104(a5)
    1688:	0007871b          	sext.w	a4,a5
    168c:	fe843783          	ld	a5,-24(s0)
    1690:	2781                	sext.w	a5,a5
    1692:	40f707bb          	subw	a5,a4,a5
    1696:	2781                	sext.w	a5,a5
    1698:	0007871b          	sext.w	a4,a5
    169c:	fd843783          	ld	a5,-40(s0)
    16a0:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    16a2:	fd843783          	ld	a5,-40(s0)
    16a6:	43bc                	lw	a5,64(a5)
    16a8:	c3ad                	beqz	a5,170a <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    16aa:	fd843783          	ld	a5,-40(s0)
    16ae:	4fb8                	lw	a4,88(a5)
    16b0:	00001797          	auipc	a5,0x1
    16b4:	f9878793          	addi	a5,a5,-104 # 2648 <threading_system_time>
    16b8:	439c                	lw	a5,0(a5)
    16ba:	02f74163          	blt	a4,a5,16dc <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    16be:	fd843783          	ld	a5,-40(s0)
    16c2:	4fb8                	lw	a4,88(a5)
    16c4:	00001797          	auipc	a5,0x1
    16c8:	f8478793          	addi	a5,a5,-124 # 2648 <threading_system_time>
    16cc:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    16ce:	02f71e63          	bne	a4,a5,170a <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    16d2:	fd843783          	ld	a5,-40(s0)
    16d6:	4bfc                	lw	a5,84(a5)
    16d8:	02f05963          	blez	a5,170a <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    16dc:	fd843783          	ld	a5,-40(s0)
    16e0:	5fd8                	lw	a4,60(a5)
    16e2:	00001797          	auipc	a5,0x1
    16e6:	f6678793          	addi	a5,a5,-154 # 2648 <threading_system_time>
    16ea:	439c                	lw	a5,0(a5)
    16ec:	863e                	mv	a2,a5
    16ee:	85ba                	mv	a1,a4
    16f0:	00001517          	auipc	a0,0x1
    16f4:	b0050513          	addi	a0,a0,-1280 # 21f0 <schedule_edf_cbs+0x5a6>
    16f8:	fffff097          	auipc	ra,0xfffff
    16fc:	45c080e7          	jalr	1116(ra) # b54 <printf>
            exit(0);
    1700:	4501                	li	a0,0
    1702:	fffff097          	auipc	ra,0xfffff
    1706:	f0c080e7          	jalr	-244(ra) # 60e <exit>
        }

    if (current_thread->remaining_time <= 0) {
    170a:	fd843783          	ld	a5,-40(s0)
    170e:	4bfc                	lw	a5,84(a5)
    1710:	02f04063          	bgtz	a5,1730 <switch_handler+0x132>
        if (current_thread->is_real_time)
    1714:	fd843783          	ld	a5,-40(s0)
    1718:	43bc                	lw	a5,64(a5)
    171a:	c791                	beqz	a5,1726 <switch_handler+0x128>
            __rt_finish_current();
    171c:	00000097          	auipc	ra,0x0
    1720:	e0a080e7          	jalr	-502(ra) # 1526 <__rt_finish_current>
    1724:	a881                	j	1774 <switch_handler+0x176>
        else
            __finish_current();
    1726:	00000097          	auipc	ra,0x0
    172a:	d3c080e7          	jalr	-708(ra) # 1462 <__finish_current>
    172e:	a099                	j	1774 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    1730:	00001797          	auipc	a5,0x1
    1734:	f1078793          	addi	a5,a5,-240 # 2640 <current>
    1738:	639c                	ld	a5,0(a5)
    173a:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    173e:	00001797          	auipc	a5,0x1
    1742:	f0278793          	addi	a5,a5,-254 # 2640 <current>
    1746:	639c                	ld	a5,0(a5)
    1748:	6798                	ld	a4,8(a5)
    174a:	00001797          	auipc	a5,0x1
    174e:	ef678793          	addi	a5,a5,-266 # 2640 <current>
    1752:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1754:	fd043503          	ld	a0,-48(s0)
    1758:	00000097          	auipc	ra,0x0
    175c:	840080e7          	jalr	-1984(ra) # f98 <list_del>
        list_add_tail(to_remove, &run_queue);
    1760:	00001597          	auipc	a1,0x1
    1764:	c9858593          	addi	a1,a1,-872 # 23f8 <run_queue>
    1768:	fd043503          	ld	a0,-48(s0)
    176c:	fffff097          	auipc	ra,0xfffff
    1770:	7d0080e7          	jalr	2000(ra) # f3c <list_add_tail>
    }

    __release();
    1774:	00000097          	auipc	ra,0x0
    1778:	ab0080e7          	jalr	-1360(ra) # 1224 <__release>
    __schedule();
    177c:	00000097          	auipc	ra,0x0
    1780:	1f8080e7          	jalr	504(ra) # 1974 <__schedule>
    __dispatch();
    1784:	00000097          	auipc	ra,0x0
    1788:	026080e7          	jalr	38(ra) # 17aa <__dispatch>
    thrdresume(main_thrd_id);
    178c:	00001797          	auipc	a5,0x1
    1790:	c8c78793          	addi	a5,a5,-884 # 2418 <main_thrd_id>
    1794:	439c                	lw	a5,0(a5)
    1796:	853e                	mv	a0,a5
    1798:	fffff097          	auipc	ra,0xfffff
    179c:	f1e080e7          	jalr	-226(ra) # 6b6 <thrdresume>
}
    17a0:	0001                	nop
    17a2:	70e2                	ld	ra,56(sp)
    17a4:	7442                	ld	s0,48(sp)
    17a6:	6121                	addi	sp,sp,64
    17a8:	8082                	ret

00000000000017aa <__dispatch>:

void __dispatch()
{
    17aa:	7179                	addi	sp,sp,-48
    17ac:	f406                	sd	ra,40(sp)
    17ae:	f022                	sd	s0,32(sp)
    17b0:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    17b2:	00001797          	auipc	a5,0x1
    17b6:	e8e78793          	addi	a5,a5,-370 # 2640 <current>
    17ba:	6398                	ld	a4,0(a5)
    17bc:	00001797          	auipc	a5,0x1
    17c0:	c3c78793          	addi	a5,a5,-964 # 23f8 <run_queue>
    17c4:	1af70363          	beq	a4,a5,196a <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    17c8:	00001797          	auipc	a5,0x1
    17cc:	e7878793          	addi	a5,a5,-392 # 2640 <current>
    17d0:	639c                	ld	a5,0(a5)
    17d2:	fef43423          	sd	a5,-24(s0)
    17d6:	fe843783          	ld	a5,-24(s0)
    17da:	fd878793          	addi	a5,a5,-40
    17de:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    17e2:	fe043783          	ld	a5,-32(s0)
    17e6:	5fcc                	lw	a1,60(a5)
    17e8:	00001797          	auipc	a5,0x1
    17ec:	e6078793          	addi	a5,a5,-416 # 2648 <threading_system_time>
    17f0:	4390                	lw	a2,0(a5)
    17f2:	00001797          	auipc	a5,0x1
    17f6:	e5e78793          	addi	a5,a5,-418 # 2650 <allocated_time>
    17fa:	6394                	ld	a3,0(a5)
    17fc:	fe043783          	ld	a5,-32(s0)
    1800:	4bfc                	lw	a5,84(a5)
    1802:	873e                	mv	a4,a5
    1804:	00001517          	auipc	a0,0x1
    1808:	a1c50513          	addi	a0,a0,-1508 # 2220 <schedule_edf_cbs+0x5d6>
    180c:	fffff097          	auipc	ra,0xfffff
    1810:	348080e7          	jalr	840(ra) # b54 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    1814:	fe043783          	ld	a5,-32(s0)
    1818:	43bc                	lw	a5,64(a5)
    181a:	c3a1                	beqz	a5,185a <__dispatch+0xb0>
    181c:	00001797          	auipc	a5,0x1
    1820:	e3478793          	addi	a5,a5,-460 # 2650 <allocated_time>
    1824:	639c                	ld	a5,0(a5)
    1826:	eb95                	bnez	a5,185a <__dispatch+0xb0>
    1828:	fe043783          	ld	a5,-32(s0)
    182c:	57fc                	lw	a5,108(a5)
    182e:	c795                	beqz	a5,185a <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    1830:	fe043783          	ld	a5,-32(s0)
    1834:	5fd8                	lw	a4,60(a5)
    1836:	fe043783          	ld	a5,-32(s0)
    183a:	4fbc                	lw	a5,88(a5)
    183c:	863e                	mv	a2,a5
    183e:	85ba                	mv	a1,a4
    1840:	00001517          	auipc	a0,0x1
    1844:	a3050513          	addi	a0,a0,-1488 # 2270 <schedule_edf_cbs+0x626>
    1848:	fffff097          	auipc	ra,0xfffff
    184c:	30c080e7          	jalr	780(ra) # b54 <printf>
        exit(0);
    1850:	4501                	li	a0,0
    1852:	fffff097          	auipc	ra,0xfffff
    1856:	dbc080e7          	jalr	-580(ra) # 60e <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    185a:	fe043783          	ld	a5,-32(s0)
    185e:	5fd8                	lw	a4,60(a5)
    1860:	00001797          	auipc	a5,0x1
    1864:	de878793          	addi	a5,a5,-536 # 2648 <threading_system_time>
    1868:	4390                	lw	a2,0(a5)
    186a:	00001797          	auipc	a5,0x1
    186e:	de678793          	addi	a5,a5,-538 # 2650 <allocated_time>
    1872:	639c                	ld	a5,0(a5)
    1874:	86be                	mv	a3,a5
    1876:	85ba                	mv	a1,a4
    1878:	00001517          	auipc	a0,0x1
    187c:	a2850513          	addi	a0,a0,-1496 # 22a0 <schedule_edf_cbs+0x656>
    1880:	fffff097          	auipc	ra,0xfffff
    1884:	2d4080e7          	jalr	724(ra) # b54 <printf>

    if (current_thread->buf_set) {
    1888:	fe043783          	ld	a5,-32(s0)
    188c:	539c                	lw	a5,32(a5)
    188e:	c7a1                	beqz	a5,18d6 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1890:	00001797          	auipc	a5,0x1
    1894:	dc078793          	addi	a5,a5,-576 # 2650 <allocated_time>
    1898:	639c                	ld	a5,0(a5)
    189a:	0007871b          	sext.w	a4,a5
    189e:	fe043783          	ld	a5,-32(s0)
    18a2:	03878593          	addi	a1,a5,56
    18a6:	00001797          	auipc	a5,0x1
    18aa:	daa78793          	addi	a5,a5,-598 # 2650 <allocated_time>
    18ae:	639c                	ld	a5,0(a5)
    18b0:	86be                	mv	a3,a5
    18b2:	00000617          	auipc	a2,0x0
    18b6:	d4c60613          	addi	a2,a2,-692 # 15fe <switch_handler>
    18ba:	853a                	mv	a0,a4
    18bc:	fffff097          	auipc	ra,0xfffff
    18c0:	df2080e7          	jalr	-526(ra) # 6ae <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    18c4:	fe043783          	ld	a5,-32(s0)
    18c8:	5f9c                	lw	a5,56(a5)
    18ca:	853e                	mv	a0,a5
    18cc:	fffff097          	auipc	ra,0xfffff
    18d0:	dea080e7          	jalr	-534(ra) # 6b6 <thrdresume>
    18d4:	a071                	j	1960 <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    18d6:	fe043783          	ld	a5,-32(s0)
    18da:	4705                	li	a4,1
    18dc:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    18de:	fe043783          	ld	a5,-32(s0)
    18e2:	6f9c                	ld	a5,24(a5)
    18e4:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    18e8:	fe043783          	ld	a5,-32(s0)
    18ec:	577d                	li	a4,-1
    18ee:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    18f0:	00001797          	auipc	a5,0x1
    18f4:	d6078793          	addi	a5,a5,-672 # 2650 <allocated_time>
    18f8:	639c                	ld	a5,0(a5)
    18fa:	0007871b          	sext.w	a4,a5
    18fe:	fe043783          	ld	a5,-32(s0)
    1902:	03878593          	addi	a1,a5,56
    1906:	00001797          	auipc	a5,0x1
    190a:	d4a78793          	addi	a5,a5,-694 # 2650 <allocated_time>
    190e:	639c                	ld	a5,0(a5)
    1910:	86be                	mv	a3,a5
    1912:	00000617          	auipc	a2,0x0
    1916:	cec60613          	addi	a2,a2,-788 # 15fe <switch_handler>
    191a:	853a                	mv	a0,a4
    191c:	fffff097          	auipc	ra,0xfffff
    1920:	d92080e7          	jalr	-622(ra) # 6ae <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    1924:	fe043783          	ld	a5,-32(s0)
    1928:	5f9c                	lw	a5,56(a5)
    192a:	0207d063          	bgez	a5,194a <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    192e:	00001597          	auipc	a1,0x1
    1932:	9a258593          	addi	a1,a1,-1630 # 22d0 <schedule_edf_cbs+0x686>
    1936:	4509                	li	a0,2
    1938:	fffff097          	auipc	ra,0xfffff
    193c:	1c4080e7          	jalr	452(ra) # afc <fprintf>
            exit(1);
    1940:	4505                	li	a0,1
    1942:	fffff097          	auipc	ra,0xfffff
    1946:	ccc080e7          	jalr	-820(ra) # 60e <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    194a:	fd843783          	ld	a5,-40(s0)
    194e:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    1950:	fe043783          	ld	a5,-32(s0)
    1954:	6398                	ld	a4,0(a5)
    1956:	fe043783          	ld	a5,-32(s0)
    195a:	679c                	ld	a5,8(a5)
    195c:	853e                	mv	a0,a5
    195e:	9702                	jalr	a4
    }
    thread_exit();
    1960:	00000097          	auipc	ra,0x0
    1964:	a5a080e7          	jalr	-1446(ra) # 13ba <thread_exit>
    1968:	a011                	j	196c <__dispatch+0x1c2>
        return;
    196a:	0001                	nop
}
    196c:	70a2                	ld	ra,40(sp)
    196e:	7402                	ld	s0,32(sp)
    1970:	6145                	addi	sp,sp,48
    1972:	8082                	ret

0000000000001974 <__schedule>:

void __schedule()
{
    1974:	711d                	addi	sp,sp,-96
    1976:	ec86                	sd	ra,88(sp)
    1978:	e8a2                	sd	s0,80(sp)
    197a:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    197c:	00001797          	auipc	a5,0x1
    1980:	ccc78793          	addi	a5,a5,-820 # 2648 <threading_system_time>
    1984:	439c                	lw	a5,0(a5)
    1986:	fcf42c23          	sw	a5,-40(s0)
    198a:	4789                	li	a5,2
    198c:	fcf42e23          	sw	a5,-36(s0)
    1990:	00001797          	auipc	a5,0x1
    1994:	a6878793          	addi	a5,a5,-1432 # 23f8 <run_queue>
    1998:	fef43023          	sd	a5,-32(s0)
    199c:	00001797          	auipc	a5,0x1
    19a0:	a6c78793          	addi	a5,a5,-1428 # 2408 <release_queue>
    19a4:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    19a8:	fd843783          	ld	a5,-40(s0)
    19ac:	faf43023          	sd	a5,-96(s0)
    19b0:	fe043783          	ld	a5,-32(s0)
    19b4:	faf43423          	sd	a5,-88(s0)
    19b8:	fe843783          	ld	a5,-24(s0)
    19bc:	faf43823          	sd	a5,-80(s0)
    19c0:	fa040793          	addi	a5,s0,-96
    19c4:	853e                	mv	a0,a5
    19c6:	00000097          	auipc	ra,0x0
    19ca:	284080e7          	jalr	644(ra) # 1c4a <schedule_edf_cbs>
    19ce:	872a                	mv	a4,a0
    19d0:	87ae                	mv	a5,a1
    19d2:	fce43423          	sd	a4,-56(s0)
    19d6:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    19da:	fc843703          	ld	a4,-56(s0)
    19de:	00001797          	auipc	a5,0x1
    19e2:	c6278793          	addi	a5,a5,-926 # 2640 <current>
    19e6:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    19e8:	fd042783          	lw	a5,-48(s0)
    19ec:	873e                	mv	a4,a5
    19ee:	00001797          	auipc	a5,0x1
    19f2:	c6278793          	addi	a5,a5,-926 # 2650 <allocated_time>
    19f6:	e398                	sd	a4,0(a5)
}
    19f8:	0001                	nop
    19fa:	60e6                	ld	ra,88(sp)
    19fc:	6446                	ld	s0,80(sp)
    19fe:	6125                	addi	sp,sp,96
    1a00:	8082                	ret

0000000000001a02 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    1a02:	1101                	addi	sp,sp,-32
    1a04:	ec06                	sd	ra,24(sp)
    1a06:	e822                	sd	s0,16(sp)
    1a08:	1000                	addi	s0,sp,32
    1a0a:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1a0e:	00001797          	auipc	a5,0x1
    1a12:	c3e78793          	addi	a5,a5,-962 # 264c <sleeping>
    1a16:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1a1a:	fe843783          	ld	a5,-24(s0)
    1a1e:	0007871b          	sext.w	a4,a5
    1a22:	00001797          	auipc	a5,0x1
    1a26:	c2678793          	addi	a5,a5,-986 # 2648 <threading_system_time>
    1a2a:	439c                	lw	a5,0(a5)
    1a2c:	2781                	sext.w	a5,a5
    1a2e:	9fb9                	addw	a5,a5,a4
    1a30:	2781                	sext.w	a5,a5
    1a32:	0007871b          	sext.w	a4,a5
    1a36:	00001797          	auipc	a5,0x1
    1a3a:	c1278793          	addi	a5,a5,-1006 # 2648 <threading_system_time>
    1a3e:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    1a40:	00001797          	auipc	a5,0x1
    1a44:	9d878793          	addi	a5,a5,-1576 # 2418 <main_thrd_id>
    1a48:	439c                	lw	a5,0(a5)
    1a4a:	853e                	mv	a0,a5
    1a4c:	fffff097          	auipc	ra,0xfffff
    1a50:	c6a080e7          	jalr	-918(ra) # 6b6 <thrdresume>
}
    1a54:	0001                	nop
    1a56:	60e2                	ld	ra,24(sp)
    1a58:	6442                	ld	s0,16(sp)
    1a5a:	6105                	addi	sp,sp,32
    1a5c:	8082                	ret

0000000000001a5e <thread_start_threading>:

void thread_start_threading()
{
    1a5e:	1141                	addi	sp,sp,-16
    1a60:	e406                	sd	ra,8(sp)
    1a62:	e022                	sd	s0,0(sp)
    1a64:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1a66:	00001797          	auipc	a5,0x1
    1a6a:	be278793          	addi	a5,a5,-1054 # 2648 <threading_system_time>
    1a6e:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    1a72:	00001797          	auipc	a5,0x1
    1a76:	bce78793          	addi	a5,a5,-1074 # 2640 <current>
    1a7a:	00001717          	auipc	a4,0x1
    1a7e:	97e70713          	addi	a4,a4,-1666 # 23f8 <run_queue>
    1a82:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1a84:	4681                	li	a3,0
    1a86:	00000617          	auipc	a2,0x0
    1a8a:	f7c60613          	addi	a2,a2,-132 # 1a02 <back_to_main_handler>
    1a8e:	00001597          	auipc	a1,0x1
    1a92:	98a58593          	addi	a1,a1,-1654 # 2418 <main_thrd_id>
    1a96:	3e800513          	li	a0,1000
    1a9a:	fffff097          	auipc	ra,0xfffff
    1a9e:	c14080e7          	jalr	-1004(ra) # 6ae <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    1aa2:	00001797          	auipc	a5,0x1
    1aa6:	97678793          	addi	a5,a5,-1674 # 2418 <main_thrd_id>
    1aaa:	439c                	lw	a5,0(a5)
    1aac:	4581                	li	a1,0
    1aae:	853e                	mv	a0,a5
    1ab0:	fffff097          	auipc	ra,0xfffff
    1ab4:	c0e080e7          	jalr	-1010(ra) # 6be <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1ab8:	a0c9                	j	1b7a <thread_start_threading+0x11c>
        __release();
    1aba:	fffff097          	auipc	ra,0xfffff
    1abe:	76a080e7          	jalr	1898(ra) # 1224 <__release>
        __schedule();
    1ac2:	00000097          	auipc	ra,0x0
    1ac6:	eb2080e7          	jalr	-334(ra) # 1974 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1aca:	00001797          	auipc	a5,0x1
    1ace:	94e78793          	addi	a5,a5,-1714 # 2418 <main_thrd_id>
    1ad2:	439c                	lw	a5,0(a5)
    1ad4:	4581                	li	a1,0
    1ad6:	853e                	mv	a0,a5
    1ad8:	fffff097          	auipc	ra,0xfffff
    1adc:	be6080e7          	jalr	-1050(ra) # 6be <cancelthrdstop>
        __dispatch();
    1ae0:	00000097          	auipc	ra,0x0
    1ae4:	cca080e7          	jalr	-822(ra) # 17aa <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1ae8:	00001517          	auipc	a0,0x1
    1aec:	91050513          	addi	a0,a0,-1776 # 23f8 <run_queue>
    1af0:	fffff097          	auipc	ra,0xfffff
    1af4:	4f2080e7          	jalr	1266(ra) # fe2 <list_empty>
    1af8:	87aa                	mv	a5,a0
    1afa:	cb99                	beqz	a5,1b10 <thread_start_threading+0xb2>
    1afc:	00001517          	auipc	a0,0x1
    1b00:	90c50513          	addi	a0,a0,-1780 # 2408 <release_queue>
    1b04:	fffff097          	auipc	ra,0xfffff
    1b08:	4de080e7          	jalr	1246(ra) # fe2 <list_empty>
    1b0c:	87aa                	mv	a5,a0
    1b0e:	ebd9                	bnez	a5,1ba4 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1b10:	00001797          	auipc	a5,0x1
    1b14:	b4078793          	addi	a5,a5,-1216 # 2650 <allocated_time>
    1b18:	639c                	ld	a5,0(a5)
    1b1a:	85be                	mv	a1,a5
    1b1c:	00000517          	auipc	a0,0x0
    1b20:	7ec50513          	addi	a0,a0,2028 # 2308 <schedule_edf_cbs+0x6be>
    1b24:	fffff097          	auipc	ra,0xfffff
    1b28:	030080e7          	jalr	48(ra) # b54 <printf>
        sleeping = 1;
    1b2c:	00001797          	auipc	a5,0x1
    1b30:	b2078793          	addi	a5,a5,-1248 # 264c <sleeping>
    1b34:	4705                	li	a4,1
    1b36:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1b38:	00001797          	auipc	a5,0x1
    1b3c:	b1878793          	addi	a5,a5,-1256 # 2650 <allocated_time>
    1b40:	639c                	ld	a5,0(a5)
    1b42:	0007871b          	sext.w	a4,a5
    1b46:	00001797          	auipc	a5,0x1
    1b4a:	b0a78793          	addi	a5,a5,-1270 # 2650 <allocated_time>
    1b4e:	639c                	ld	a5,0(a5)
    1b50:	86be                	mv	a3,a5
    1b52:	00000617          	auipc	a2,0x0
    1b56:	eb060613          	addi	a2,a2,-336 # 1a02 <back_to_main_handler>
    1b5a:	00001597          	auipc	a1,0x1
    1b5e:	8be58593          	addi	a1,a1,-1858 # 2418 <main_thrd_id>
    1b62:	853a                	mv	a0,a4
    1b64:	fffff097          	auipc	ra,0xfffff
    1b68:	b4a080e7          	jalr	-1206(ra) # 6ae <thrdstop>
        while (sleeping) {
    1b6c:	0001                	nop
    1b6e:	00001797          	auipc	a5,0x1
    1b72:	ade78793          	addi	a5,a5,-1314 # 264c <sleeping>
    1b76:	439c                	lw	a5,0(a5)
    1b78:	fbfd                	bnez	a5,1b6e <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1b7a:	00001517          	auipc	a0,0x1
    1b7e:	87e50513          	addi	a0,a0,-1922 # 23f8 <run_queue>
    1b82:	fffff097          	auipc	ra,0xfffff
    1b86:	460080e7          	jalr	1120(ra) # fe2 <list_empty>
    1b8a:	87aa                	mv	a5,a0
    1b8c:	d79d                	beqz	a5,1aba <thread_start_threading+0x5c>
    1b8e:	00001517          	auipc	a0,0x1
    1b92:	87a50513          	addi	a0,a0,-1926 # 2408 <release_queue>
    1b96:	fffff097          	auipc	ra,0xfffff
    1b9a:	44c080e7          	jalr	1100(ra) # fe2 <list_empty>
    1b9e:	87aa                	mv	a5,a0
    1ba0:	df89                	beqz	a5,1aba <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1ba2:	a011                	j	1ba6 <thread_start_threading+0x148>
            break;
    1ba4:	0001                	nop
}
    1ba6:	0001                	nop
    1ba8:	60a2                	ld	ra,8(sp)
    1baa:	6402                	ld	s0,0(sp)
    1bac:	0141                	addi	sp,sp,16
    1bae:	8082                	ret

0000000000001bb0 <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1bb0:	7139                	addi	sp,sp,-64
    1bb2:	fc22                	sd	s0,56(sp)
    1bb4:	0080                	addi	s0,sp,64
    1bb6:	fca43423          	sd	a0,-56(s0)
    1bba:	87ae                	mv	a5,a1
    1bbc:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1bc0:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1bc4:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1bc8:	fc843783          	ld	a5,-56(s0)
    1bcc:	639c                	ld	a5,0(a5)
    1bce:	fcf43c23          	sd	a5,-40(s0)
    1bd2:	fd843783          	ld	a5,-40(s0)
    1bd6:	fd878793          	addi	a5,a5,-40
    1bda:	fef43423          	sd	a5,-24(s0)
    1bde:	a881                	j	1c2e <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1be0:	fe843783          	ld	a5,-24(s0)
    1be4:	4fb8                	lw	a4,88(a5)
    1be6:	fc442783          	lw	a5,-60(s0)
    1bea:	2781                	sext.w	a5,a5
    1bec:	02e7c663          	blt	a5,a4,1c18 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1bf0:	fe043783          	ld	a5,-32(s0)
    1bf4:	e791                	bnez	a5,1c00 <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1bf6:	fe843783          	ld	a5,-24(s0)
    1bfa:	fef43023          	sd	a5,-32(s0)
    1bfe:	a829                	j	1c18 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1c00:	fe843783          	ld	a5,-24(s0)
    1c04:	5fd8                	lw	a4,60(a5)
    1c06:	fe043783          	ld	a5,-32(s0)
    1c0a:	5fdc                	lw	a5,60(a5)
    1c0c:	00f75663          	bge	a4,a5,1c18 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1c10:	fe843783          	ld	a5,-24(s0)
    1c14:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1c18:	fe843783          	ld	a5,-24(s0)
    1c1c:	779c                	ld	a5,40(a5)
    1c1e:	fcf43823          	sd	a5,-48(s0)
    1c22:	fd043783          	ld	a5,-48(s0)
    1c26:	fd878793          	addi	a5,a5,-40
    1c2a:	fef43423          	sd	a5,-24(s0)
    1c2e:	fe843783          	ld	a5,-24(s0)
    1c32:	02878793          	addi	a5,a5,40
    1c36:	fc843703          	ld	a4,-56(s0)
    1c3a:	faf713e3          	bne	a4,a5,1be0 <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1c3e:	fe043783          	ld	a5,-32(s0)
}
    1c42:	853e                	mv	a0,a5
    1c44:	7462                	ld	s0,56(sp)
    1c46:	6121                	addi	sp,sp,64
    1c48:	8082                	ret

0000000000001c4a <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1c4a:	7131                	addi	sp,sp,-192
    1c4c:	fd06                	sd	ra,184(sp)
    1c4e:	f922                	sd	s0,176(sp)
    1c50:	f526                	sd	s1,168(sp)
    1c52:	f14a                	sd	s2,160(sp)
    1c54:	ed4e                	sd	s3,152(sp)
    1c56:	0180                	addi	s0,sp,192
    1c58:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1c5a:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1c5e:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1c62:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1c66:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1c6a:	649c                	ld	a5,8(s1)
    1c6c:	4098                	lw	a4,0(s1)
    1c6e:	85ba                	mv	a1,a4
    1c70:	853e                	mv	a0,a5
    1c72:	00000097          	auipc	ra,0x0
    1c76:	f3e080e7          	jalr	-194(ra) # 1bb0 <__check_deadline_miss>
    1c7a:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1c7e:	f9843783          	ld	a5,-104(s0)
    1c82:	c7b5                	beqz	a5,1cee <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1c84:	f9843783          	ld	a5,-104(s0)
    1c88:	5fdc                	lw	a5,60(a5)
    1c8a:	85be                	mv	a1,a5
    1c8c:	00000517          	auipc	a0,0x0
    1c90:	6a450513          	addi	a0,a0,1700 # 2330 <schedule_edf_cbs+0x6e6>
    1c94:	fffff097          	auipc	ra,0xfffff
    1c98:	ec0080e7          	jalr	-320(ra) # b54 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1c9c:	f9843783          	ld	a5,-104(s0)
    1ca0:	57fc                	lw	a5,108(a5)
    1ca2:	c395                	beqz	a5,1cc6 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1ca4:	f9843783          	ld	a5,-104(s0)
    1ca8:	02878793          	addi	a5,a5,40
    1cac:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1cb0:	f4042423          	sw	zero,-184(s0)
            return r;
    1cb4:	f4043783          	ld	a5,-192(s0)
    1cb8:	f4f43823          	sd	a5,-176(s0)
    1cbc:	f4843783          	ld	a5,-184(s0)
    1cc0:	f4f43c23          	sd	a5,-168(s0)
    1cc4:	a13d                	j	20f2 <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1cc6:	4098                	lw	a4,0(s1)
    1cc8:	f9843783          	ld	a5,-104(s0)
    1ccc:	47fc                	lw	a5,76(a5)
    1cce:	9fb9                	addw	a5,a5,a4
    1cd0:	0007871b          	sext.w	a4,a5
    1cd4:	f9843783          	ld	a5,-104(s0)
    1cd8:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1cda:	f9843783          	ld	a5,-104(s0)
    1cde:	53f8                	lw	a4,100(a5)
    1ce0:	f9843783          	ld	a5,-104(s0)
    1ce4:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1ce6:	f9843783          	ld	a5,-104(s0)
    1cea:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1cee:	fa043783          	ld	a5,-96(s0)
    1cf2:	e7dd                	bnez	a5,1da0 <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1cf4:	649c                	ld	a5,8(s1)
    1cf6:	639c                	ld	a5,0(a5)
    1cf8:	f8f43823          	sd	a5,-112(s0)
    1cfc:	f9043783          	ld	a5,-112(s0)
    1d00:	fd878793          	addi	a5,a5,-40
    1d04:	faf43c23          	sd	a5,-72(s0)
    1d08:	a069                	j	1d92 <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1d0a:	fb843783          	ld	a5,-72(s0)
    1d0e:	5fd8                	lw	a4,60(a5)
    1d10:	fb843783          	ld	a5,-72(s0)
    1d14:	5bbc                	lw	a5,112(a5)
    1d16:	863e                	mv	a2,a5
    1d18:	85ba                	mv	a1,a4
    1d1a:	00000517          	auipc	a0,0x0
    1d1e:	64e50513          	addi	a0,a0,1614 # 2368 <schedule_edf_cbs+0x71e>
    1d22:	fffff097          	auipc	ra,0xfffff
    1d26:	e32080e7          	jalr	-462(ra) # b54 <printf>
            if (next == NULL)
    1d2a:	fa043783          	ld	a5,-96(s0)
    1d2e:	e791                	bnez	a5,1d3a <schedule_edf_cbs+0xf0>
                next = th;
    1d30:	fb843783          	ld	a5,-72(s0)
    1d34:	faf43023          	sd	a5,-96(s0)
    1d38:	a091                	j	1d7c <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1d3a:	fb843783          	ld	a5,-72(s0)
    1d3e:	4fb8                	lw	a4,88(a5)
    1d40:	fa043783          	ld	a5,-96(s0)
    1d44:	4fbc                	lw	a5,88(a5)
    1d46:	00f75763          	bge	a4,a5,1d54 <schedule_edf_cbs+0x10a>
                next = th;
    1d4a:	fb843783          	ld	a5,-72(s0)
    1d4e:	faf43023          	sd	a5,-96(s0)
    1d52:	a02d                	j	1d7c <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1d54:	fb843783          	ld	a5,-72(s0)
    1d58:	4fb8                	lw	a4,88(a5)
    1d5a:	fa043783          	ld	a5,-96(s0)
    1d5e:	4fbc                	lw	a5,88(a5)
    1d60:	00f71e63          	bne	a4,a5,1d7c <schedule_edf_cbs+0x132>
    1d64:	fb843783          	ld	a5,-72(s0)
    1d68:	5fd8                	lw	a4,60(a5)
    1d6a:	fa043783          	ld	a5,-96(s0)
    1d6e:	5fdc                	lw	a5,60(a5)
    1d70:	00f75663          	bge	a4,a5,1d7c <schedule_edf_cbs+0x132>
                next = th;
    1d74:	fb843783          	ld	a5,-72(s0)
    1d78:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1d7c:	fb843783          	ld	a5,-72(s0)
    1d80:	779c                	ld	a5,40(a5)
    1d82:	f8f43423          	sd	a5,-120(s0)
    1d86:	f8843783          	ld	a5,-120(s0)
    1d8a:	fd878793          	addi	a5,a5,-40
    1d8e:	faf43c23          	sd	a5,-72(s0)
    1d92:	fb843783          	ld	a5,-72(s0)
    1d96:	02878713          	addi	a4,a5,40
    1d9a:	649c                	ld	a5,8(s1)
    1d9c:	f6f717e3          	bne	a4,a5,1d0a <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1da0:	fa043783          	ld	a5,-96(s0)
    1da4:	5fdc                	lw	a5,60(a5)
    1da6:	85be                	mv	a1,a5
    1da8:	00000517          	auipc	a0,0x0
    1dac:	5f850513          	addi	a0,a0,1528 # 23a0 <schedule_edf_cbs+0x756>
    1db0:	fffff097          	auipc	ra,0xfffff
    1db4:	da4080e7          	jalr	-604(ra) # b54 <printf>

    if(next && next->cbs.is_throttled){
    1db8:	fa043783          	ld	a5,-96(s0)
    1dbc:	cb95                	beqz	a5,1df0 <schedule_edf_cbs+0x1a6>
    1dbe:	fa043783          	ld	a5,-96(s0)
    1dc2:	5bbc                	lw	a5,112(a5)
    1dc4:	c795                	beqz	a5,1df0 <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1dc6:	fa043783          	ld	a5,-96(s0)
    1dca:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1dce:	fa043783          	ld	a5,-96(s0)
    1dd2:	02878793          	addi	a5,a5,40
    1dd6:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1dda:	f4042423          	sw	zero,-184(s0)
        return r;
    1dde:	f4043783          	ld	a5,-192(s0)
    1de2:	f4f43823          	sd	a5,-176(s0)
    1de6:	f4843783          	ld	a5,-184(s0)
    1dea:	f4f43c23          	sd	a5,-168(s0)
    1dee:	a611                	j	20f2 <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1df0:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1df4:	689c                	ld	a5,16(s1)
    1df6:	639c                	ld	a5,0(a5)
    1df8:	f8f43023          	sd	a5,-128(s0)
    1dfc:	f8043783          	ld	a5,-128(s0)
    1e00:	17e1                	addi	a5,a5,-8
    1e02:	fcf43023          	sd	a5,-64(s0)
    1e06:	a0b5                	j	1e72 <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1e08:	fa843783          	ld	a5,-88(s0)
    1e0c:	e791                	bnez	a5,1e18 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1e0e:	fc043783          	ld	a5,-64(s0)
    1e12:	faf43423          	sd	a5,-88(s0)
    1e16:	a0a1                	j	1e5e <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1e18:	fa843783          	ld	a5,-88(s0)
    1e1c:	4f98                	lw	a4,24(a5)
    1e1e:	fc043783          	ld	a5,-64(s0)
    1e22:	4f9c                	lw	a5,24(a5)
    1e24:	00e7d763          	bge	a5,a4,1e32 <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1e28:	fc043783          	ld	a5,-64(s0)
    1e2c:	faf43423          	sd	a5,-88(s0)
    1e30:	a03d                	j	1e5e <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1e32:	fa843783          	ld	a5,-88(s0)
    1e36:	4f98                	lw	a4,24(a5)
    1e38:	fc043783          	ld	a5,-64(s0)
    1e3c:	4f9c                	lw	a5,24(a5)
    1e3e:	02f71063          	bne	a4,a5,1e5e <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1e42:	fa843783          	ld	a5,-88(s0)
    1e46:	639c                	ld	a5,0(a5)
    1e48:	4fb8                	lw	a4,88(a5)
    1e4a:	fc043783          	ld	a5,-64(s0)
    1e4e:	639c                	ld	a5,0(a5)
    1e50:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1e52:	00e7d663          	bge	a5,a4,1e5e <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1e56:	fc043783          	ld	a5,-64(s0)
    1e5a:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1e5e:	fc043783          	ld	a5,-64(s0)
    1e62:	679c                	ld	a5,8(a5)
    1e64:	f6f43023          	sd	a5,-160(s0)
    1e68:	f6043783          	ld	a5,-160(s0)
    1e6c:	17e1                	addi	a5,a5,-8
    1e6e:	fcf43023          	sd	a5,-64(s0)
    1e72:	fc043783          	ld	a5,-64(s0)
    1e76:	00878713          	addi	a4,a5,8
    1e7a:	689c                	ld	a5,16(s1)
    1e7c:	f8f716e3          	bne	a4,a5,1e08 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1e80:	689c                	ld	a5,16(s1)
    1e82:	639c                	ld	a5,0(a5)
    1e84:	f6f43c23          	sd	a5,-136(s0)
    1e88:	f7843783          	ld	a5,-136(s0)
    1e8c:	17e1                	addi	a5,a5,-8
    1e8e:	fcf43023          	sd	a5,-64(s0)
    1e92:	a069                	j	1f1c <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1e94:	fb043783          	ld	a5,-80(s0)
    1e98:	eb99                	bnez	a5,1eae <schedule_edf_cbs+0x264>
    1e9a:	fc043783          	ld	a5,-64(s0)
    1e9e:	639c                	ld	a5,0(a5)
    1ea0:	57fc                	lw	a5,108(a5)
    1ea2:	c791                	beqz	a5,1eae <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1ea4:	fc043783          	ld	a5,-64(s0)
    1ea8:	faf43823          	sd	a5,-80(s0)
    1eac:	a8b1                	j	1f08 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1eae:	fc043783          	ld	a5,-64(s0)
    1eb2:	639c                	ld	a5,0(a5)
    1eb4:	57fc                	lw	a5,108(a5)
    1eb6:	cf91                	beqz	a5,1ed2 <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1eb8:	fb043783          	ld	a5,-80(s0)
    1ebc:	4f98                	lw	a4,24(a5)
    1ebe:	fc043783          	ld	a5,-64(s0)
    1ec2:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1ec4:	00e7d763          	bge	a5,a4,1ed2 <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1ec8:	fc043783          	ld	a5,-64(s0)
    1ecc:	faf43823          	sd	a5,-80(s0)
    1ed0:	a825                	j	1f08 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1ed2:	fc043783          	ld	a5,-64(s0)
    1ed6:	639c                	ld	a5,0(a5)
    1ed8:	57fc                	lw	a5,108(a5)
    1eda:	c79d                	beqz	a5,1f08 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1edc:	fb043783          	ld	a5,-80(s0)
    1ee0:	4f98                	lw	a4,24(a5)
    1ee2:	fc043783          	ld	a5,-64(s0)
    1ee6:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1ee8:	02f71063          	bne	a4,a5,1f08 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1eec:	fb043783          	ld	a5,-80(s0)
    1ef0:	639c                	ld	a5,0(a5)
    1ef2:	4fb8                	lw	a4,88(a5)
    1ef4:	fc043783          	ld	a5,-64(s0)
    1ef8:	639c                	ld	a5,0(a5)
    1efa:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1efc:	00e7d663          	bge	a5,a4,1f08 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1f00:	fc043783          	ld	a5,-64(s0)
    1f04:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1f08:	fc043783          	ld	a5,-64(s0)
    1f0c:	679c                	ld	a5,8(a5)
    1f0e:	f6f43423          	sd	a5,-152(s0)
    1f12:	f6843783          	ld	a5,-152(s0)
    1f16:	17e1                	addi	a5,a5,-8
    1f18:	fcf43023          	sd	a5,-64(s0)
    1f1c:	fc043783          	ld	a5,-64(s0)
    1f20:	00878713          	addi	a4,a5,8
    1f24:	689c                	ld	a5,16(s1)
    1f26:	f6f717e3          	bne	a4,a5,1e94 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1f2a:	fa043783          	ld	a5,-96(s0)
    1f2e:	cb89                	beqz	a5,1f40 <schedule_edf_cbs+0x2f6>
    1f30:	fa043783          	ld	a5,-96(s0)
    1f34:	57fc                	lw	a5,108(a5)
    1f36:	c789                	beqz	a5,1f40 <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1f38:	fb043783          	ld	a5,-80(s0)
    1f3c:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1f40:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1f44:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1f48:	fa843783          	ld	a5,-88(s0)
    1f4c:	c3c5                	beqz	a5,1fec <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1f4e:	fa843783          	ld	a5,-88(s0)
    1f52:	639c                	ld	a5,0(a5)
    1f54:	5fdc                	lw	a5,60(a5)
    1f56:	85be                	mv	a1,a5
    1f58:	00000517          	auipc	a0,0x0
    1f5c:	46850513          	addi	a0,a0,1128 # 23c0 <schedule_edf_cbs+0x776>
    1f60:	fffff097          	auipc	ra,0xfffff
    1f64:	bf4080e7          	jalr	-1036(ra) # b54 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    1f68:	fa843783          	ld	a5,-88(s0)
    1f6c:	4f98                	lw	a4,24(a5)
    1f6e:	409c                	lw	a5,0(s1)
    1f70:	40f707bb          	subw	a5,a4,a5
    1f74:	fcf42623          	sw	a5,-52(s0)
        if (next){
    1f78:	fa043783          	ld	a5,-96(s0)
    1f7c:	cba5                	beqz	a5,1fec <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    1f7e:	fa043783          	ld	a5,-96(s0)
    1f82:	4bf8                	lw	a4,84(a5)
    1f84:	fcc42783          	lw	a5,-52(s0)
    1f88:	2781                	sext.w	a5,a5
    1f8a:	06e7d163          	bge	a5,a4,1fec <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    1f8e:	fa043783          	ld	a5,-96(s0)
    1f92:	57fc                	lw	a5,108(a5)
    1f94:	eb91                	bnez	a5,1fa8 <schedule_edf_cbs+0x35e>
    1f96:	fa843783          	ld	a5,-88(s0)
    1f9a:	639c                	ld	a5,0(a5)
    1f9c:	57fc                	lw	a5,108(a5)
    1f9e:	c789                	beqz	a5,1fa8 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    1fa0:	4785                	li	a5,1
    1fa2:	fcf42423          	sw	a5,-56(s0)
    1fa6:	a099                	j	1fec <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    1fa8:	fa043783          	ld	a5,-96(s0)
    1fac:	4fb8                	lw	a4,88(a5)
    1fae:	fa843783          	ld	a5,-88(s0)
    1fb2:	639c                	ld	a5,0(a5)
    1fb4:	4fbc                	lw	a5,88(a5)
    1fb6:	00e7d663          	bge	a5,a4,1fc2 <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    1fba:	4785                	li	a5,1
    1fbc:	fcf42423          	sw	a5,-56(s0)
    1fc0:	a035                	j	1fec <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1fc2:	fa043783          	ld	a5,-96(s0)
    1fc6:	4fb8                	lw	a4,88(a5)
    1fc8:	fa843783          	ld	a5,-88(s0)
    1fcc:	639c                	ld	a5,0(a5)
    1fce:	4fbc                	lw	a5,88(a5)
    1fd0:	00f71e63          	bne	a4,a5,1fec <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    1fd4:	fa043783          	ld	a5,-96(s0)
    1fd8:	5fd8                	lw	a4,60(a5)
    1fda:	fa843783          	ld	a5,-88(s0)
    1fde:	639c                	ld	a5,0(a5)
    1fe0:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1fe2:	00e7d563          	bge	a5,a4,1fec <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    1fe6:	4785                	li	a5,1
    1fe8:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    1fec:	fa043783          	ld	a5,-96(s0)
    1ff0:	cbd1                	beqz	a5,2084 <schedule_edf_cbs+0x43a>
    1ff2:	fa043783          	ld	a5,-96(s0)
    1ff6:	57fc                	lw	a5,108(a5)
    1ff8:	e7d1                	bnez	a5,2084 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    1ffa:	fa043783          	ld	a5,-96(s0)
    1ffe:	4fb8                	lw	a4,88(a5)
    2000:	409c                	lw	a5,0(s1)
    2002:	40f707bb          	subw	a5,a4,a5
    2006:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    200a:	fa043783          	ld	a5,-96(s0)
    200e:	47f8                	lw	a4,76(a5)
    2010:	fa043783          	ld	a5,-96(s0)
    2014:	57bc                	lw	a5,104(a5)
    2016:	02f707bb          	mulw	a5,a4,a5
    201a:	0007869b          	sext.w	a3,a5
    201e:	fa043783          	ld	a5,-96(s0)
    2022:	53fc                	lw	a5,100(a5)
    2024:	f7442703          	lw	a4,-140(s0)
    2028:	02f707bb          	mulw	a5,a4,a5
    202c:	2781                	sext.w	a5,a5
    202e:	8736                	mv	a4,a3
    2030:	02e7d263          	bge	a5,a4,2054 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    2034:	4098                	lw	a4,0(s1)
    2036:	fa043783          	ld	a5,-96(s0)
    203a:	47fc                	lw	a5,76(a5)
    203c:	9fb9                	addw	a5,a5,a4
    203e:	0007871b          	sext.w	a4,a5
    2042:	fa043783          	ld	a5,-96(s0)
    2046:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    2048:	fa043783          	ld	a5,-96(s0)
    204c:	53f8                	lw	a4,100(a5)
    204e:	fa043783          	ld	a5,-96(s0)
    2052:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    2054:	fa043783          	ld	a5,-96(s0)
    2058:	4bf8                	lw	a4,84(a5)
    205a:	fa043783          	ld	a5,-96(s0)
    205e:	57bc                	lw	a5,104(a5)
    2060:	02e7d263          	bge	a5,a4,2084 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    2064:	fa043783          	ld	a5,-96(s0)
    2068:	4705                	li	a4,1
    206a:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    206c:	fa043783          	ld	a5,-96(s0)
    2070:	4fb8                	lw	a4,88(a5)
    2072:	fa043783          	ld	a5,-96(s0)
    2076:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    2078:	fa043783          	ld	a5,-96(s0)
    207c:	4bf8                	lw	a4,84(a5)
    207e:	fa043783          	ld	a5,-96(s0)
    2082:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    2084:	fa043783          	ld	a5,-96(s0)
    2088:	c3a9                	beqz	a5,20ca <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    208a:	fa043783          	ld	a5,-96(s0)
    208e:	02878793          	addi	a5,a5,40
    2092:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    2096:	fa843783          	ld	a5,-88(s0)
    209a:	cb91                	beqz	a5,20ae <schedule_edf_cbs+0x464>
    209c:	fc842783          	lw	a5,-56(s0)
    20a0:	2781                	sext.w	a5,a5
    20a2:	c791                	beqz	a5,20ae <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    20a4:	fcc42783          	lw	a5,-52(s0)
    20a8:	f4f42423          	sw	a5,-184(s0)
    20ac:	a81d                	j	20e2 <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    20ae:	fa043783          	ld	a5,-96(s0)
    20b2:	5bbc                	lw	a5,112(a5)
    20b4:	c789                	beqz	a5,20be <schedule_edf_cbs+0x474>
    20b6:	fa043783          	ld	a5,-96(s0)
    20ba:	57bc                	lw	a5,104(a5)
    20bc:	a021                	j	20c4 <schedule_edf_cbs+0x47a>
    20be:	fa043783          	ld	a5,-96(s0)
    20c2:	4bfc                	lw	a5,84(a5)
    20c4:	f4f42423          	sw	a5,-184(s0)
    20c8:	a829                	j	20e2 <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    20ca:	649c                	ld	a5,8(s1)
    20cc:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    20d0:	fa843783          	ld	a5,-88(s0)
    20d4:	c781                	beqz	a5,20dc <schedule_edf_cbs+0x492>
    20d6:	fcc42783          	lw	a5,-52(s0)
    20da:	a011                	j	20de <schedule_edf_cbs+0x494>
    20dc:	4785                	li	a5,1
    20de:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    20e2:	f4043783          	ld	a5,-192(s0)
    20e6:	f4f43823          	sd	a5,-176(s0)
    20ea:	f4843783          	ld	a5,-184(s0)
    20ee:	f4f43c23          	sd	a5,-168(s0)
    20f2:	4701                	li	a4,0
    20f4:	f5043703          	ld	a4,-176(s0)
    20f8:	4781                	li	a5,0
    20fa:	f5843783          	ld	a5,-168(s0)
    20fe:	893a                	mv	s2,a4
    2100:	89be                	mv	s3,a5
    2102:	874a                	mv	a4,s2
    2104:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    2106:	853a                	mv	a0,a4
    2108:	85be                	mv	a1,a5
    210a:	70ea                	ld	ra,184(sp)
    210c:	744a                	ld	s0,176(sp)
    210e:	74aa                	ld	s1,168(sp)
    2110:	790a                	ld	s2,160(sp)
    2112:	69ea                	ld	s3,152(sp)
    2114:	6129                	addi	sp,sp,192
    2116:	8082                	ret
