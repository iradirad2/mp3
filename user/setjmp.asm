
user/_setjmp:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <setjmp>:
       0:	e100                	sd	s0,0(a0)
       2:	e504                	sd	s1,8(a0)
       4:	01253823          	sd	s2,16(a0)
       8:	01353c23          	sd	s3,24(a0)
       c:	03453023          	sd	s4,32(a0)
      10:	03553423          	sd	s5,40(a0)
      14:	03653823          	sd	s6,48(a0)
      18:	03753c23          	sd	s7,56(a0)
      1c:	05853023          	sd	s8,64(a0)
      20:	05953423          	sd	s9,72(a0)
      24:	05a53823          	sd	s10,80(a0)
      28:	05b53c23          	sd	s11,88(a0)
      2c:	06153023          	sd	ra,96(a0)
      30:	06253423          	sd	sp,104(a0)
      34:	4501                	li	a0,0
      36:	8082                	ret

0000000000000038 <longjmp>:
      38:	6100                	ld	s0,0(a0)
      3a:	6504                	ld	s1,8(a0)
      3c:	01053903          	ld	s2,16(a0)
      40:	01853983          	ld	s3,24(a0)
      44:	02053a03          	ld	s4,32(a0)
      48:	02853a83          	ld	s5,40(a0)
      4c:	03053b03          	ld	s6,48(a0)
      50:	03853b83          	ld	s7,56(a0)
      54:	04053c03          	ld	s8,64(a0)
      58:	04853c83          	ld	s9,72(a0)
      5c:	05053d03          	ld	s10,80(a0)
      60:	05853d83          	ld	s11,88(a0)
      64:	06053083          	ld	ra,96(a0)
      68:	06853103          	ld	sp,104(a0)
      6c:	c199                	beqz	a1,72 <longjmp_1>
      6e:	852e                	mv	a0,a1
      70:	8082                	ret

0000000000000072 <longjmp_1>:
      72:	4505                	li	a0,1
      74:	8082                	ret

0000000000000076 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
      76:	7179                	addi	sp,sp,-48
      78:	f422                	sd	s0,40(sp)
      7a:	1800                	addi	s0,sp,48
      7c:	fca43c23          	sd	a0,-40(s0)
      80:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
      84:	fd843783          	ld	a5,-40(s0)
      88:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
      8c:	0001                	nop
      8e:	fd043703          	ld	a4,-48(s0)
      92:	00170793          	addi	a5,a4,1
      96:	fcf43823          	sd	a5,-48(s0)
      9a:	fd843783          	ld	a5,-40(s0)
      9e:	00178693          	addi	a3,a5,1
      a2:	fcd43c23          	sd	a3,-40(s0)
      a6:	00074703          	lbu	a4,0(a4)
      aa:	00e78023          	sb	a4,0(a5)
      ae:	0007c783          	lbu	a5,0(a5)
      b2:	fff1                	bnez	a5,8e <strcpy+0x18>
    ;
  return os;
      b4:	fe843783          	ld	a5,-24(s0)
}
      b8:	853e                	mv	a0,a5
      ba:	7422                	ld	s0,40(sp)
      bc:	6145                	addi	sp,sp,48
      be:	8082                	ret

00000000000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      c0:	1101                	addi	sp,sp,-32
      c2:	ec22                	sd	s0,24(sp)
      c4:	1000                	addi	s0,sp,32
      c6:	fea43423          	sd	a0,-24(s0)
      ca:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
      ce:	a819                	j	e4 <strcmp+0x24>
    p++, q++;
      d0:	fe843783          	ld	a5,-24(s0)
      d4:	0785                	addi	a5,a5,1
      d6:	fef43423          	sd	a5,-24(s0)
      da:	fe043783          	ld	a5,-32(s0)
      de:	0785                	addi	a5,a5,1
      e0:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
      e4:	fe843783          	ld	a5,-24(s0)
      e8:	0007c783          	lbu	a5,0(a5)
      ec:	cb99                	beqz	a5,102 <strcmp+0x42>
      ee:	fe843783          	ld	a5,-24(s0)
      f2:	0007c703          	lbu	a4,0(a5)
      f6:	fe043783          	ld	a5,-32(s0)
      fa:	0007c783          	lbu	a5,0(a5)
      fe:	fcf709e3          	beq	a4,a5,d0 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     102:	fe843783          	ld	a5,-24(s0)
     106:	0007c783          	lbu	a5,0(a5)
     10a:	0007871b          	sext.w	a4,a5
     10e:	fe043783          	ld	a5,-32(s0)
     112:	0007c783          	lbu	a5,0(a5)
     116:	2781                	sext.w	a5,a5
     118:	40f707bb          	subw	a5,a4,a5
     11c:	2781                	sext.w	a5,a5
}
     11e:	853e                	mv	a0,a5
     120:	6462                	ld	s0,24(sp)
     122:	6105                	addi	sp,sp,32
     124:	8082                	ret

0000000000000126 <strlen>:

uint
strlen(const char *s)
{
     126:	7179                	addi	sp,sp,-48
     128:	f422                	sd	s0,40(sp)
     12a:	1800                	addi	s0,sp,48
     12c:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     130:	fe042623          	sw	zero,-20(s0)
     134:	a031                	j	140 <strlen+0x1a>
     136:	fec42783          	lw	a5,-20(s0)
     13a:	2785                	addiw	a5,a5,1
     13c:	fef42623          	sw	a5,-20(s0)
     140:	fec42783          	lw	a5,-20(s0)
     144:	fd843703          	ld	a4,-40(s0)
     148:	97ba                	add	a5,a5,a4
     14a:	0007c783          	lbu	a5,0(a5)
     14e:	f7e5                	bnez	a5,136 <strlen+0x10>
    ;
  return n;
     150:	fec42783          	lw	a5,-20(s0)
}
     154:	853e                	mv	a0,a5
     156:	7422                	ld	s0,40(sp)
     158:	6145                	addi	sp,sp,48
     15a:	8082                	ret

000000000000015c <memset>:

void*
memset(void *dst, int c, uint n)
{
     15c:	7179                	addi	sp,sp,-48
     15e:	f422                	sd	s0,40(sp)
     160:	1800                	addi	s0,sp,48
     162:	fca43c23          	sd	a0,-40(s0)
     166:	87ae                	mv	a5,a1
     168:	8732                	mv	a4,a2
     16a:	fcf42a23          	sw	a5,-44(s0)
     16e:	87ba                	mv	a5,a4
     170:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     174:	fd843783          	ld	a5,-40(s0)
     178:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     17c:	fe042623          	sw	zero,-20(s0)
     180:	a00d                	j	1a2 <memset+0x46>
    cdst[i] = c;
     182:	fec42783          	lw	a5,-20(s0)
     186:	fe043703          	ld	a4,-32(s0)
     18a:	97ba                	add	a5,a5,a4
     18c:	fd442703          	lw	a4,-44(s0)
     190:	0ff77713          	andi	a4,a4,255
     194:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     198:	fec42783          	lw	a5,-20(s0)
     19c:	2785                	addiw	a5,a5,1
     19e:	fef42623          	sw	a5,-20(s0)
     1a2:	fec42703          	lw	a4,-20(s0)
     1a6:	fd042783          	lw	a5,-48(s0)
     1aa:	2781                	sext.w	a5,a5
     1ac:	fcf76be3          	bltu	a4,a5,182 <memset+0x26>
  }
  return dst;
     1b0:	fd843783          	ld	a5,-40(s0)
}
     1b4:	853e                	mv	a0,a5
     1b6:	7422                	ld	s0,40(sp)
     1b8:	6145                	addi	sp,sp,48
     1ba:	8082                	ret

00000000000001bc <strchr>:

char*
strchr(const char *s, char c)
{
     1bc:	1101                	addi	sp,sp,-32
     1be:	ec22                	sd	s0,24(sp)
     1c0:	1000                	addi	s0,sp,32
     1c2:	fea43423          	sd	a0,-24(s0)
     1c6:	87ae                	mv	a5,a1
     1c8:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     1cc:	a01d                	j	1f2 <strchr+0x36>
    if(*s == c)
     1ce:	fe843783          	ld	a5,-24(s0)
     1d2:	0007c703          	lbu	a4,0(a5)
     1d6:	fe744783          	lbu	a5,-25(s0)
     1da:	0ff7f793          	andi	a5,a5,255
     1de:	00e79563          	bne	a5,a4,1e8 <strchr+0x2c>
      return (char*)s;
     1e2:	fe843783          	ld	a5,-24(s0)
     1e6:	a821                	j	1fe <strchr+0x42>
  for(; *s; s++)
     1e8:	fe843783          	ld	a5,-24(s0)
     1ec:	0785                	addi	a5,a5,1
     1ee:	fef43423          	sd	a5,-24(s0)
     1f2:	fe843783          	ld	a5,-24(s0)
     1f6:	0007c783          	lbu	a5,0(a5)
     1fa:	fbf1                	bnez	a5,1ce <strchr+0x12>
  return 0;
     1fc:	4781                	li	a5,0
}
     1fe:	853e                	mv	a0,a5
     200:	6462                	ld	s0,24(sp)
     202:	6105                	addi	sp,sp,32
     204:	8082                	ret

0000000000000206 <gets>:

char*
gets(char *buf, int max)
{
     206:	7179                	addi	sp,sp,-48
     208:	f406                	sd	ra,40(sp)
     20a:	f022                	sd	s0,32(sp)
     20c:	1800                	addi	s0,sp,48
     20e:	fca43c23          	sd	a0,-40(s0)
     212:	87ae                	mv	a5,a1
     214:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     218:	fe042623          	sw	zero,-20(s0)
     21c:	a8a1                	j	274 <gets+0x6e>
    cc = read(0, &c, 1);
     21e:	fe740793          	addi	a5,s0,-25
     222:	4605                	li	a2,1
     224:	85be                	mv	a1,a5
     226:	4501                	li	a0,0
     228:	00000097          	auipc	ra,0x0
     22c:	2f6080e7          	jalr	758(ra) # 51e <read>
     230:	87aa                	mv	a5,a0
     232:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     236:	fe842783          	lw	a5,-24(s0)
     23a:	2781                	sext.w	a5,a5
     23c:	04f05763          	blez	a5,28a <gets+0x84>
      break;
    buf[i++] = c;
     240:	fec42783          	lw	a5,-20(s0)
     244:	0017871b          	addiw	a4,a5,1
     248:	fee42623          	sw	a4,-20(s0)
     24c:	873e                	mv	a4,a5
     24e:	fd843783          	ld	a5,-40(s0)
     252:	97ba                	add	a5,a5,a4
     254:	fe744703          	lbu	a4,-25(s0)
     258:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     25c:	fe744783          	lbu	a5,-25(s0)
     260:	873e                	mv	a4,a5
     262:	47a9                	li	a5,10
     264:	02f70463          	beq	a4,a5,28c <gets+0x86>
     268:	fe744783          	lbu	a5,-25(s0)
     26c:	873e                	mv	a4,a5
     26e:	47b5                	li	a5,13
     270:	00f70e63          	beq	a4,a5,28c <gets+0x86>
  for(i=0; i+1 < max; ){
     274:	fec42783          	lw	a5,-20(s0)
     278:	2785                	addiw	a5,a5,1
     27a:	0007871b          	sext.w	a4,a5
     27e:	fd442783          	lw	a5,-44(s0)
     282:	2781                	sext.w	a5,a5
     284:	f8f74de3          	blt	a4,a5,21e <gets+0x18>
     288:	a011                	j	28c <gets+0x86>
      break;
     28a:	0001                	nop
      break;
  }
  buf[i] = '\0';
     28c:	fec42783          	lw	a5,-20(s0)
     290:	fd843703          	ld	a4,-40(s0)
     294:	97ba                	add	a5,a5,a4
     296:	00078023          	sb	zero,0(a5)
  return buf;
     29a:	fd843783          	ld	a5,-40(s0)
}
     29e:	853e                	mv	a0,a5
     2a0:	70a2                	ld	ra,40(sp)
     2a2:	7402                	ld	s0,32(sp)
     2a4:	6145                	addi	sp,sp,48
     2a6:	8082                	ret

00000000000002a8 <stat>:

int
stat(const char *n, struct stat *st)
{
     2a8:	7179                	addi	sp,sp,-48
     2aa:	f406                	sd	ra,40(sp)
     2ac:	f022                	sd	s0,32(sp)
     2ae:	1800                	addi	s0,sp,48
     2b0:	fca43c23          	sd	a0,-40(s0)
     2b4:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2b8:	4581                	li	a1,0
     2ba:	fd843503          	ld	a0,-40(s0)
     2be:	00000097          	auipc	ra,0x0
     2c2:	288080e7          	jalr	648(ra) # 546 <open>
     2c6:	87aa                	mv	a5,a0
     2c8:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     2cc:	fec42783          	lw	a5,-20(s0)
     2d0:	2781                	sext.w	a5,a5
     2d2:	0007d463          	bgez	a5,2da <stat+0x32>
    return -1;
     2d6:	57fd                	li	a5,-1
     2d8:	a035                	j	304 <stat+0x5c>
  r = fstat(fd, st);
     2da:	fec42783          	lw	a5,-20(s0)
     2de:	fd043583          	ld	a1,-48(s0)
     2e2:	853e                	mv	a0,a5
     2e4:	00000097          	auipc	ra,0x0
     2e8:	27a080e7          	jalr	634(ra) # 55e <fstat>
     2ec:	87aa                	mv	a5,a0
     2ee:	fef42423          	sw	a5,-24(s0)
  close(fd);
     2f2:	fec42783          	lw	a5,-20(s0)
     2f6:	853e                	mv	a0,a5
     2f8:	00000097          	auipc	ra,0x0
     2fc:	236080e7          	jalr	566(ra) # 52e <close>
  return r;
     300:	fe842783          	lw	a5,-24(s0)
}
     304:	853e                	mv	a0,a5
     306:	70a2                	ld	ra,40(sp)
     308:	7402                	ld	s0,32(sp)
     30a:	6145                	addi	sp,sp,48
     30c:	8082                	ret

000000000000030e <atoi>:

int
atoi(const char *s)
{
     30e:	7179                	addi	sp,sp,-48
     310:	f422                	sd	s0,40(sp)
     312:	1800                	addi	s0,sp,48
     314:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     318:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     31c:	a815                	j	350 <atoi+0x42>
    n = n*10 + *s++ - '0';
     31e:	fec42703          	lw	a4,-20(s0)
     322:	87ba                	mv	a5,a4
     324:	0027979b          	slliw	a5,a5,0x2
     328:	9fb9                	addw	a5,a5,a4
     32a:	0017979b          	slliw	a5,a5,0x1
     32e:	0007871b          	sext.w	a4,a5
     332:	fd843783          	ld	a5,-40(s0)
     336:	00178693          	addi	a3,a5,1
     33a:	fcd43c23          	sd	a3,-40(s0)
     33e:	0007c783          	lbu	a5,0(a5)
     342:	2781                	sext.w	a5,a5
     344:	9fb9                	addw	a5,a5,a4
     346:	2781                	sext.w	a5,a5
     348:	fd07879b          	addiw	a5,a5,-48
     34c:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     350:	fd843783          	ld	a5,-40(s0)
     354:	0007c783          	lbu	a5,0(a5)
     358:	873e                	mv	a4,a5
     35a:	02f00793          	li	a5,47
     35e:	00e7fb63          	bgeu	a5,a4,374 <atoi+0x66>
     362:	fd843783          	ld	a5,-40(s0)
     366:	0007c783          	lbu	a5,0(a5)
     36a:	873e                	mv	a4,a5
     36c:	03900793          	li	a5,57
     370:	fae7f7e3          	bgeu	a5,a4,31e <atoi+0x10>
  return n;
     374:	fec42783          	lw	a5,-20(s0)
}
     378:	853e                	mv	a0,a5
     37a:	7422                	ld	s0,40(sp)
     37c:	6145                	addi	sp,sp,48
     37e:	8082                	ret

0000000000000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     380:	7139                	addi	sp,sp,-64
     382:	fc22                	sd	s0,56(sp)
     384:	0080                	addi	s0,sp,64
     386:	fca43c23          	sd	a0,-40(s0)
     38a:	fcb43823          	sd	a1,-48(s0)
     38e:	87b2                	mv	a5,a2
     390:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     394:	fd843783          	ld	a5,-40(s0)
     398:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     39c:	fd043783          	ld	a5,-48(s0)
     3a0:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     3a4:	fe043703          	ld	a4,-32(s0)
     3a8:	fe843783          	ld	a5,-24(s0)
     3ac:	02e7fc63          	bgeu	a5,a4,3e4 <memmove+0x64>
    while(n-- > 0)
     3b0:	a00d                	j	3d2 <memmove+0x52>
      *dst++ = *src++;
     3b2:	fe043703          	ld	a4,-32(s0)
     3b6:	00170793          	addi	a5,a4,1
     3ba:	fef43023          	sd	a5,-32(s0)
     3be:	fe843783          	ld	a5,-24(s0)
     3c2:	00178693          	addi	a3,a5,1
     3c6:	fed43423          	sd	a3,-24(s0)
     3ca:	00074703          	lbu	a4,0(a4)
     3ce:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     3d2:	fcc42783          	lw	a5,-52(s0)
     3d6:	fff7871b          	addiw	a4,a5,-1
     3da:	fce42623          	sw	a4,-52(s0)
     3de:	fcf04ae3          	bgtz	a5,3b2 <memmove+0x32>
     3e2:	a891                	j	436 <memmove+0xb6>
  } else {
    dst += n;
     3e4:	fcc42783          	lw	a5,-52(s0)
     3e8:	fe843703          	ld	a4,-24(s0)
     3ec:	97ba                	add	a5,a5,a4
     3ee:	fef43423          	sd	a5,-24(s0)
    src += n;
     3f2:	fcc42783          	lw	a5,-52(s0)
     3f6:	fe043703          	ld	a4,-32(s0)
     3fa:	97ba                	add	a5,a5,a4
     3fc:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     400:	a01d                	j	426 <memmove+0xa6>
      *--dst = *--src;
     402:	fe043783          	ld	a5,-32(s0)
     406:	17fd                	addi	a5,a5,-1
     408:	fef43023          	sd	a5,-32(s0)
     40c:	fe843783          	ld	a5,-24(s0)
     410:	17fd                	addi	a5,a5,-1
     412:	fef43423          	sd	a5,-24(s0)
     416:	fe043783          	ld	a5,-32(s0)
     41a:	0007c703          	lbu	a4,0(a5)
     41e:	fe843783          	ld	a5,-24(s0)
     422:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     426:	fcc42783          	lw	a5,-52(s0)
     42a:	fff7871b          	addiw	a4,a5,-1
     42e:	fce42623          	sw	a4,-52(s0)
     432:	fcf048e3          	bgtz	a5,402 <memmove+0x82>
  }
  return vdst;
     436:	fd843783          	ld	a5,-40(s0)
}
     43a:	853e                	mv	a0,a5
     43c:	7462                	ld	s0,56(sp)
     43e:	6121                	addi	sp,sp,64
     440:	8082                	ret

0000000000000442 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     442:	7139                	addi	sp,sp,-64
     444:	fc22                	sd	s0,56(sp)
     446:	0080                	addi	s0,sp,64
     448:	fca43c23          	sd	a0,-40(s0)
     44c:	fcb43823          	sd	a1,-48(s0)
     450:	87b2                	mv	a5,a2
     452:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     456:	fd843783          	ld	a5,-40(s0)
     45a:	fef43423          	sd	a5,-24(s0)
     45e:	fd043783          	ld	a5,-48(s0)
     462:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     466:	a0a1                	j	4ae <memcmp+0x6c>
    if (*p1 != *p2) {
     468:	fe843783          	ld	a5,-24(s0)
     46c:	0007c703          	lbu	a4,0(a5)
     470:	fe043783          	ld	a5,-32(s0)
     474:	0007c783          	lbu	a5,0(a5)
     478:	02f70163          	beq	a4,a5,49a <memcmp+0x58>
      return *p1 - *p2;
     47c:	fe843783          	ld	a5,-24(s0)
     480:	0007c783          	lbu	a5,0(a5)
     484:	0007871b          	sext.w	a4,a5
     488:	fe043783          	ld	a5,-32(s0)
     48c:	0007c783          	lbu	a5,0(a5)
     490:	2781                	sext.w	a5,a5
     492:	40f707bb          	subw	a5,a4,a5
     496:	2781                	sext.w	a5,a5
     498:	a01d                	j	4be <memcmp+0x7c>
    }
    p1++;
     49a:	fe843783          	ld	a5,-24(s0)
     49e:	0785                	addi	a5,a5,1
     4a0:	fef43423          	sd	a5,-24(s0)
    p2++;
     4a4:	fe043783          	ld	a5,-32(s0)
     4a8:	0785                	addi	a5,a5,1
     4aa:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     4ae:	fcc42783          	lw	a5,-52(s0)
     4b2:	fff7871b          	addiw	a4,a5,-1
     4b6:	fce42623          	sw	a4,-52(s0)
     4ba:	f7dd                	bnez	a5,468 <memcmp+0x26>
  }
  return 0;
     4bc:	4781                	li	a5,0
}
     4be:	853e                	mv	a0,a5
     4c0:	7462                	ld	s0,56(sp)
     4c2:	6121                	addi	sp,sp,64
     4c4:	8082                	ret

00000000000004c6 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     4c6:	7179                	addi	sp,sp,-48
     4c8:	f406                	sd	ra,40(sp)
     4ca:	f022                	sd	s0,32(sp)
     4cc:	1800                	addi	s0,sp,48
     4ce:	fea43423          	sd	a0,-24(s0)
     4d2:	feb43023          	sd	a1,-32(s0)
     4d6:	87b2                	mv	a5,a2
     4d8:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     4dc:	fdc42783          	lw	a5,-36(s0)
     4e0:	863e                	mv	a2,a5
     4e2:	fe043583          	ld	a1,-32(s0)
     4e6:	fe843503          	ld	a0,-24(s0)
     4ea:	00000097          	auipc	ra,0x0
     4ee:	e96080e7          	jalr	-362(ra) # 380 <memmove>
     4f2:	87aa                	mv	a5,a0
}
     4f4:	853e                	mv	a0,a5
     4f6:	70a2                	ld	ra,40(sp)
     4f8:	7402                	ld	s0,32(sp)
     4fa:	6145                	addi	sp,sp,48
     4fc:	8082                	ret

00000000000004fe <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     4fe:	4885                	li	a7,1
 ecall
     500:	00000073          	ecall
 ret
     504:	8082                	ret

0000000000000506 <exit>:
.global exit
exit:
 li a7, SYS_exit
     506:	4889                	li	a7,2
 ecall
     508:	00000073          	ecall
 ret
     50c:	8082                	ret

000000000000050e <wait>:
.global wait
wait:
 li a7, SYS_wait
     50e:	488d                	li	a7,3
 ecall
     510:	00000073          	ecall
 ret
     514:	8082                	ret

0000000000000516 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     516:	4891                	li	a7,4
 ecall
     518:	00000073          	ecall
 ret
     51c:	8082                	ret

000000000000051e <read>:
.global read
read:
 li a7, SYS_read
     51e:	4895                	li	a7,5
 ecall
     520:	00000073          	ecall
 ret
     524:	8082                	ret

0000000000000526 <write>:
.global write
write:
 li a7, SYS_write
     526:	48c1                	li	a7,16
 ecall
     528:	00000073          	ecall
 ret
     52c:	8082                	ret

000000000000052e <close>:
.global close
close:
 li a7, SYS_close
     52e:	48d5                	li	a7,21
 ecall
     530:	00000073          	ecall
 ret
     534:	8082                	ret

0000000000000536 <kill>:
.global kill
kill:
 li a7, SYS_kill
     536:	4899                	li	a7,6
 ecall
     538:	00000073          	ecall
 ret
     53c:	8082                	ret

000000000000053e <exec>:
.global exec
exec:
 li a7, SYS_exec
     53e:	489d                	li	a7,7
 ecall
     540:	00000073          	ecall
 ret
     544:	8082                	ret

0000000000000546 <open>:
.global open
open:
 li a7, SYS_open
     546:	48bd                	li	a7,15
 ecall
     548:	00000073          	ecall
 ret
     54c:	8082                	ret

000000000000054e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     54e:	48c5                	li	a7,17
 ecall
     550:	00000073          	ecall
 ret
     554:	8082                	ret

0000000000000556 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     556:	48c9                	li	a7,18
 ecall
     558:	00000073          	ecall
 ret
     55c:	8082                	ret

000000000000055e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     55e:	48a1                	li	a7,8
 ecall
     560:	00000073          	ecall
 ret
     564:	8082                	ret

0000000000000566 <link>:
.global link
link:
 li a7, SYS_link
     566:	48cd                	li	a7,19
 ecall
     568:	00000073          	ecall
 ret
     56c:	8082                	ret

000000000000056e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     56e:	48d1                	li	a7,20
 ecall
     570:	00000073          	ecall
 ret
     574:	8082                	ret

0000000000000576 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     576:	48a5                	li	a7,9
 ecall
     578:	00000073          	ecall
 ret
     57c:	8082                	ret

000000000000057e <dup>:
.global dup
dup:
 li a7, SYS_dup
     57e:	48a9                	li	a7,10
 ecall
     580:	00000073          	ecall
 ret
     584:	8082                	ret

0000000000000586 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     586:	48ad                	li	a7,11
 ecall
     588:	00000073          	ecall
 ret
     58c:	8082                	ret

000000000000058e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     58e:	48b1                	li	a7,12
 ecall
     590:	00000073          	ecall
 ret
     594:	8082                	ret

0000000000000596 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     596:	48b5                	li	a7,13
 ecall
     598:	00000073          	ecall
 ret
     59c:	8082                	ret

000000000000059e <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     59e:	48b9                	li	a7,14
 ecall
     5a0:	00000073          	ecall
 ret
     5a4:	8082                	ret

00000000000005a6 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     5a6:	48d9                	li	a7,22
 ecall
     5a8:	00000073          	ecall
 ret
     5ac:	8082                	ret

00000000000005ae <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     5ae:	48dd                	li	a7,23
 ecall
     5b0:	00000073          	ecall
 ret
     5b4:	8082                	ret

00000000000005b6 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     5b6:	48e1                	li	a7,24
 ecall
     5b8:	00000073          	ecall
 ret
     5bc:	8082                	ret

00000000000005be <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     5be:	1101                	addi	sp,sp,-32
     5c0:	ec06                	sd	ra,24(sp)
     5c2:	e822                	sd	s0,16(sp)
     5c4:	1000                	addi	s0,sp,32
     5c6:	87aa                	mv	a5,a0
     5c8:	872e                	mv	a4,a1
     5ca:	fef42623          	sw	a5,-20(s0)
     5ce:	87ba                	mv	a5,a4
     5d0:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     5d4:	feb40713          	addi	a4,s0,-21
     5d8:	fec42783          	lw	a5,-20(s0)
     5dc:	4605                	li	a2,1
     5de:	85ba                	mv	a1,a4
     5e0:	853e                	mv	a0,a5
     5e2:	00000097          	auipc	ra,0x0
     5e6:	f44080e7          	jalr	-188(ra) # 526 <write>
}
     5ea:	0001                	nop
     5ec:	60e2                	ld	ra,24(sp)
     5ee:	6442                	ld	s0,16(sp)
     5f0:	6105                	addi	sp,sp,32
     5f2:	8082                	ret

00000000000005f4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     5f4:	7139                	addi	sp,sp,-64
     5f6:	fc06                	sd	ra,56(sp)
     5f8:	f822                	sd	s0,48(sp)
     5fa:	0080                	addi	s0,sp,64
     5fc:	87aa                	mv	a5,a0
     5fe:	8736                	mv	a4,a3
     600:	fcf42623          	sw	a5,-52(s0)
     604:	87ae                	mv	a5,a1
     606:	fcf42423          	sw	a5,-56(s0)
     60a:	87b2                	mv	a5,a2
     60c:	fcf42223          	sw	a5,-60(s0)
     610:	87ba                	mv	a5,a4
     612:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     616:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     61a:	fc042783          	lw	a5,-64(s0)
     61e:	2781                	sext.w	a5,a5
     620:	c38d                	beqz	a5,642 <printint+0x4e>
     622:	fc842783          	lw	a5,-56(s0)
     626:	2781                	sext.w	a5,a5
     628:	0007dd63          	bgez	a5,642 <printint+0x4e>
    neg = 1;
     62c:	4785                	li	a5,1
     62e:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     632:	fc842783          	lw	a5,-56(s0)
     636:	40f007bb          	negw	a5,a5
     63a:	2781                	sext.w	a5,a5
     63c:	fef42223          	sw	a5,-28(s0)
     640:	a029                	j	64a <printint+0x56>
  } else {
    x = xx;
     642:	fc842783          	lw	a5,-56(s0)
     646:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     64a:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     64e:	fc442783          	lw	a5,-60(s0)
     652:	fe442703          	lw	a4,-28(s0)
     656:	02f777bb          	remuw	a5,a4,a5
     65a:	0007861b          	sext.w	a2,a5
     65e:	fec42783          	lw	a5,-20(s0)
     662:	0017871b          	addiw	a4,a5,1
     666:	fee42623          	sw	a4,-20(s0)
     66a:	00002697          	auipc	a3,0x2
     66e:	bb668693          	addi	a3,a3,-1098 # 2220 <digits>
     672:	02061713          	slli	a4,a2,0x20
     676:	9301                	srli	a4,a4,0x20
     678:	9736                	add	a4,a4,a3
     67a:	00074703          	lbu	a4,0(a4)
     67e:	ff040693          	addi	a3,s0,-16
     682:	97b6                	add	a5,a5,a3
     684:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     688:	fc442783          	lw	a5,-60(s0)
     68c:	fe442703          	lw	a4,-28(s0)
     690:	02f757bb          	divuw	a5,a4,a5
     694:	fef42223          	sw	a5,-28(s0)
     698:	fe442783          	lw	a5,-28(s0)
     69c:	2781                	sext.w	a5,a5
     69e:	fbc5                	bnez	a5,64e <printint+0x5a>
  if(neg)
     6a0:	fe842783          	lw	a5,-24(s0)
     6a4:	2781                	sext.w	a5,a5
     6a6:	cf95                	beqz	a5,6e2 <printint+0xee>
    buf[i++] = '-';
     6a8:	fec42783          	lw	a5,-20(s0)
     6ac:	0017871b          	addiw	a4,a5,1
     6b0:	fee42623          	sw	a4,-20(s0)
     6b4:	ff040713          	addi	a4,s0,-16
     6b8:	97ba                	add	a5,a5,a4
     6ba:	02d00713          	li	a4,45
     6be:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     6c2:	a005                	j	6e2 <printint+0xee>
    putc(fd, buf[i]);
     6c4:	fec42783          	lw	a5,-20(s0)
     6c8:	ff040713          	addi	a4,s0,-16
     6cc:	97ba                	add	a5,a5,a4
     6ce:	fe07c703          	lbu	a4,-32(a5)
     6d2:	fcc42783          	lw	a5,-52(s0)
     6d6:	85ba                	mv	a1,a4
     6d8:	853e                	mv	a0,a5
     6da:	00000097          	auipc	ra,0x0
     6de:	ee4080e7          	jalr	-284(ra) # 5be <putc>
  while(--i >= 0)
     6e2:	fec42783          	lw	a5,-20(s0)
     6e6:	37fd                	addiw	a5,a5,-1
     6e8:	fef42623          	sw	a5,-20(s0)
     6ec:	fec42783          	lw	a5,-20(s0)
     6f0:	2781                	sext.w	a5,a5
     6f2:	fc07d9e3          	bgez	a5,6c4 <printint+0xd0>
}
     6f6:	0001                	nop
     6f8:	0001                	nop
     6fa:	70e2                	ld	ra,56(sp)
     6fc:	7442                	ld	s0,48(sp)
     6fe:	6121                	addi	sp,sp,64
     700:	8082                	ret

0000000000000702 <printptr>:

static void
printptr(int fd, uint64 x) {
     702:	7179                	addi	sp,sp,-48
     704:	f406                	sd	ra,40(sp)
     706:	f022                	sd	s0,32(sp)
     708:	1800                	addi	s0,sp,48
     70a:	87aa                	mv	a5,a0
     70c:	fcb43823          	sd	a1,-48(s0)
     710:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     714:	fdc42783          	lw	a5,-36(s0)
     718:	03000593          	li	a1,48
     71c:	853e                	mv	a0,a5
     71e:	00000097          	auipc	ra,0x0
     722:	ea0080e7          	jalr	-352(ra) # 5be <putc>
  putc(fd, 'x');
     726:	fdc42783          	lw	a5,-36(s0)
     72a:	07800593          	li	a1,120
     72e:	853e                	mv	a0,a5
     730:	00000097          	auipc	ra,0x0
     734:	e8e080e7          	jalr	-370(ra) # 5be <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     738:	fe042623          	sw	zero,-20(s0)
     73c:	a82d                	j	776 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     73e:	fd043783          	ld	a5,-48(s0)
     742:	93f1                	srli	a5,a5,0x3c
     744:	00002717          	auipc	a4,0x2
     748:	adc70713          	addi	a4,a4,-1316 # 2220 <digits>
     74c:	97ba                	add	a5,a5,a4
     74e:	0007c703          	lbu	a4,0(a5)
     752:	fdc42783          	lw	a5,-36(s0)
     756:	85ba                	mv	a1,a4
     758:	853e                	mv	a0,a5
     75a:	00000097          	auipc	ra,0x0
     75e:	e64080e7          	jalr	-412(ra) # 5be <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     762:	fec42783          	lw	a5,-20(s0)
     766:	2785                	addiw	a5,a5,1
     768:	fef42623          	sw	a5,-20(s0)
     76c:	fd043783          	ld	a5,-48(s0)
     770:	0792                	slli	a5,a5,0x4
     772:	fcf43823          	sd	a5,-48(s0)
     776:	fec42783          	lw	a5,-20(s0)
     77a:	873e                	mv	a4,a5
     77c:	47bd                	li	a5,15
     77e:	fce7f0e3          	bgeu	a5,a4,73e <printptr+0x3c>
}
     782:	0001                	nop
     784:	0001                	nop
     786:	70a2                	ld	ra,40(sp)
     788:	7402                	ld	s0,32(sp)
     78a:	6145                	addi	sp,sp,48
     78c:	8082                	ret

000000000000078e <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     78e:	715d                	addi	sp,sp,-80
     790:	e486                	sd	ra,72(sp)
     792:	e0a2                	sd	s0,64(sp)
     794:	0880                	addi	s0,sp,80
     796:	87aa                	mv	a5,a0
     798:	fcb43023          	sd	a1,-64(s0)
     79c:	fac43c23          	sd	a2,-72(s0)
     7a0:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     7a4:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     7a8:	fe042223          	sw	zero,-28(s0)
     7ac:	a42d                	j	9d6 <vprintf+0x248>
    c = fmt[i] & 0xff;
     7ae:	fe442783          	lw	a5,-28(s0)
     7b2:	fc043703          	ld	a4,-64(s0)
     7b6:	97ba                	add	a5,a5,a4
     7b8:	0007c783          	lbu	a5,0(a5)
     7bc:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     7c0:	fe042783          	lw	a5,-32(s0)
     7c4:	2781                	sext.w	a5,a5
     7c6:	eb9d                	bnez	a5,7fc <vprintf+0x6e>
      if(c == '%'){
     7c8:	fdc42783          	lw	a5,-36(s0)
     7cc:	0007871b          	sext.w	a4,a5
     7d0:	02500793          	li	a5,37
     7d4:	00f71763          	bne	a4,a5,7e2 <vprintf+0x54>
        state = '%';
     7d8:	02500793          	li	a5,37
     7dc:	fef42023          	sw	a5,-32(s0)
     7e0:	a2f5                	j	9cc <vprintf+0x23e>
      } else {
        putc(fd, c);
     7e2:	fdc42783          	lw	a5,-36(s0)
     7e6:	0ff7f713          	andi	a4,a5,255
     7ea:	fcc42783          	lw	a5,-52(s0)
     7ee:	85ba                	mv	a1,a4
     7f0:	853e                	mv	a0,a5
     7f2:	00000097          	auipc	ra,0x0
     7f6:	dcc080e7          	jalr	-564(ra) # 5be <putc>
     7fa:	aac9                	j	9cc <vprintf+0x23e>
      }
    } else if(state == '%'){
     7fc:	fe042783          	lw	a5,-32(s0)
     800:	0007871b          	sext.w	a4,a5
     804:	02500793          	li	a5,37
     808:	1cf71263          	bne	a4,a5,9cc <vprintf+0x23e>
      if(c == 'd'){
     80c:	fdc42783          	lw	a5,-36(s0)
     810:	0007871b          	sext.w	a4,a5
     814:	06400793          	li	a5,100
     818:	02f71463          	bne	a4,a5,840 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     81c:	fb843783          	ld	a5,-72(s0)
     820:	00878713          	addi	a4,a5,8
     824:	fae43c23          	sd	a4,-72(s0)
     828:	4398                	lw	a4,0(a5)
     82a:	fcc42783          	lw	a5,-52(s0)
     82e:	4685                	li	a3,1
     830:	4629                	li	a2,10
     832:	85ba                	mv	a1,a4
     834:	853e                	mv	a0,a5
     836:	00000097          	auipc	ra,0x0
     83a:	dbe080e7          	jalr	-578(ra) # 5f4 <printint>
     83e:	a269                	j	9c8 <vprintf+0x23a>
      } else if(c == 'l') {
     840:	fdc42783          	lw	a5,-36(s0)
     844:	0007871b          	sext.w	a4,a5
     848:	06c00793          	li	a5,108
     84c:	02f71663          	bne	a4,a5,878 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     850:	fb843783          	ld	a5,-72(s0)
     854:	00878713          	addi	a4,a5,8
     858:	fae43c23          	sd	a4,-72(s0)
     85c:	639c                	ld	a5,0(a5)
     85e:	0007871b          	sext.w	a4,a5
     862:	fcc42783          	lw	a5,-52(s0)
     866:	4681                	li	a3,0
     868:	4629                	li	a2,10
     86a:	85ba                	mv	a1,a4
     86c:	853e                	mv	a0,a5
     86e:	00000097          	auipc	ra,0x0
     872:	d86080e7          	jalr	-634(ra) # 5f4 <printint>
     876:	aa89                	j	9c8 <vprintf+0x23a>
      } else if(c == 'x') {
     878:	fdc42783          	lw	a5,-36(s0)
     87c:	0007871b          	sext.w	a4,a5
     880:	07800793          	li	a5,120
     884:	02f71463          	bne	a4,a5,8ac <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     888:	fb843783          	ld	a5,-72(s0)
     88c:	00878713          	addi	a4,a5,8
     890:	fae43c23          	sd	a4,-72(s0)
     894:	4398                	lw	a4,0(a5)
     896:	fcc42783          	lw	a5,-52(s0)
     89a:	4681                	li	a3,0
     89c:	4641                	li	a2,16
     89e:	85ba                	mv	a1,a4
     8a0:	853e                	mv	a0,a5
     8a2:	00000097          	auipc	ra,0x0
     8a6:	d52080e7          	jalr	-686(ra) # 5f4 <printint>
     8aa:	aa39                	j	9c8 <vprintf+0x23a>
      } else if(c == 'p') {
     8ac:	fdc42783          	lw	a5,-36(s0)
     8b0:	0007871b          	sext.w	a4,a5
     8b4:	07000793          	li	a5,112
     8b8:	02f71263          	bne	a4,a5,8dc <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     8bc:	fb843783          	ld	a5,-72(s0)
     8c0:	00878713          	addi	a4,a5,8
     8c4:	fae43c23          	sd	a4,-72(s0)
     8c8:	6398                	ld	a4,0(a5)
     8ca:	fcc42783          	lw	a5,-52(s0)
     8ce:	85ba                	mv	a1,a4
     8d0:	853e                	mv	a0,a5
     8d2:	00000097          	auipc	ra,0x0
     8d6:	e30080e7          	jalr	-464(ra) # 702 <printptr>
     8da:	a0fd                	j	9c8 <vprintf+0x23a>
      } else if(c == 's'){
     8dc:	fdc42783          	lw	a5,-36(s0)
     8e0:	0007871b          	sext.w	a4,a5
     8e4:	07300793          	li	a5,115
     8e8:	04f71c63          	bne	a4,a5,940 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     8ec:	fb843783          	ld	a5,-72(s0)
     8f0:	00878713          	addi	a4,a5,8
     8f4:	fae43c23          	sd	a4,-72(s0)
     8f8:	639c                	ld	a5,0(a5)
     8fa:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     8fe:	fe843783          	ld	a5,-24(s0)
     902:	eb8d                	bnez	a5,934 <vprintf+0x1a6>
          s = "(null)";
     904:	00001797          	auipc	a5,0x1
     908:	69c78793          	addi	a5,a5,1692 # 1fa0 <schedule_edf_cbs+0x4d4>
     90c:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     910:	a015                	j	934 <vprintf+0x1a6>
          putc(fd, *s);
     912:	fe843783          	ld	a5,-24(s0)
     916:	0007c703          	lbu	a4,0(a5)
     91a:	fcc42783          	lw	a5,-52(s0)
     91e:	85ba                	mv	a1,a4
     920:	853e                	mv	a0,a5
     922:	00000097          	auipc	ra,0x0
     926:	c9c080e7          	jalr	-868(ra) # 5be <putc>
          s++;
     92a:	fe843783          	ld	a5,-24(s0)
     92e:	0785                	addi	a5,a5,1
     930:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     934:	fe843783          	ld	a5,-24(s0)
     938:	0007c783          	lbu	a5,0(a5)
     93c:	fbf9                	bnez	a5,912 <vprintf+0x184>
     93e:	a069                	j	9c8 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     940:	fdc42783          	lw	a5,-36(s0)
     944:	0007871b          	sext.w	a4,a5
     948:	06300793          	li	a5,99
     94c:	02f71463          	bne	a4,a5,974 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     950:	fb843783          	ld	a5,-72(s0)
     954:	00878713          	addi	a4,a5,8
     958:	fae43c23          	sd	a4,-72(s0)
     95c:	439c                	lw	a5,0(a5)
     95e:	0ff7f713          	andi	a4,a5,255
     962:	fcc42783          	lw	a5,-52(s0)
     966:	85ba                	mv	a1,a4
     968:	853e                	mv	a0,a5
     96a:	00000097          	auipc	ra,0x0
     96e:	c54080e7          	jalr	-940(ra) # 5be <putc>
     972:	a899                	j	9c8 <vprintf+0x23a>
      } else if(c == '%'){
     974:	fdc42783          	lw	a5,-36(s0)
     978:	0007871b          	sext.w	a4,a5
     97c:	02500793          	li	a5,37
     980:	00f71f63          	bne	a4,a5,99e <vprintf+0x210>
        putc(fd, c);
     984:	fdc42783          	lw	a5,-36(s0)
     988:	0ff7f713          	andi	a4,a5,255
     98c:	fcc42783          	lw	a5,-52(s0)
     990:	85ba                	mv	a1,a4
     992:	853e                	mv	a0,a5
     994:	00000097          	auipc	ra,0x0
     998:	c2a080e7          	jalr	-982(ra) # 5be <putc>
     99c:	a035                	j	9c8 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     99e:	fcc42783          	lw	a5,-52(s0)
     9a2:	02500593          	li	a1,37
     9a6:	853e                	mv	a0,a5
     9a8:	00000097          	auipc	ra,0x0
     9ac:	c16080e7          	jalr	-1002(ra) # 5be <putc>
        putc(fd, c);
     9b0:	fdc42783          	lw	a5,-36(s0)
     9b4:	0ff7f713          	andi	a4,a5,255
     9b8:	fcc42783          	lw	a5,-52(s0)
     9bc:	85ba                	mv	a1,a4
     9be:	853e                	mv	a0,a5
     9c0:	00000097          	auipc	ra,0x0
     9c4:	bfe080e7          	jalr	-1026(ra) # 5be <putc>
      }
      state = 0;
     9c8:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     9cc:	fe442783          	lw	a5,-28(s0)
     9d0:	2785                	addiw	a5,a5,1
     9d2:	fef42223          	sw	a5,-28(s0)
     9d6:	fe442783          	lw	a5,-28(s0)
     9da:	fc043703          	ld	a4,-64(s0)
     9de:	97ba                	add	a5,a5,a4
     9e0:	0007c783          	lbu	a5,0(a5)
     9e4:	dc0795e3          	bnez	a5,7ae <vprintf+0x20>
    }
  }
}
     9e8:	0001                	nop
     9ea:	0001                	nop
     9ec:	60a6                	ld	ra,72(sp)
     9ee:	6406                	ld	s0,64(sp)
     9f0:	6161                	addi	sp,sp,80
     9f2:	8082                	ret

00000000000009f4 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     9f4:	7159                	addi	sp,sp,-112
     9f6:	fc06                	sd	ra,56(sp)
     9f8:	f822                	sd	s0,48(sp)
     9fa:	0080                	addi	s0,sp,64
     9fc:	fcb43823          	sd	a1,-48(s0)
     a00:	e010                	sd	a2,0(s0)
     a02:	e414                	sd	a3,8(s0)
     a04:	e818                	sd	a4,16(s0)
     a06:	ec1c                	sd	a5,24(s0)
     a08:	03043023          	sd	a6,32(s0)
     a0c:	03143423          	sd	a7,40(s0)
     a10:	87aa                	mv	a5,a0
     a12:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     a16:	03040793          	addi	a5,s0,48
     a1a:	fcf43423          	sd	a5,-56(s0)
     a1e:	fc843783          	ld	a5,-56(s0)
     a22:	fd078793          	addi	a5,a5,-48
     a26:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     a2a:	fe843703          	ld	a4,-24(s0)
     a2e:	fdc42783          	lw	a5,-36(s0)
     a32:	863a                	mv	a2,a4
     a34:	fd043583          	ld	a1,-48(s0)
     a38:	853e                	mv	a0,a5
     a3a:	00000097          	auipc	ra,0x0
     a3e:	d54080e7          	jalr	-684(ra) # 78e <vprintf>
}
     a42:	0001                	nop
     a44:	70e2                	ld	ra,56(sp)
     a46:	7442                	ld	s0,48(sp)
     a48:	6165                	addi	sp,sp,112
     a4a:	8082                	ret

0000000000000a4c <printf>:

void
printf(const char *fmt, ...)
{
     a4c:	7159                	addi	sp,sp,-112
     a4e:	f406                	sd	ra,40(sp)
     a50:	f022                	sd	s0,32(sp)
     a52:	1800                	addi	s0,sp,48
     a54:	fca43c23          	sd	a0,-40(s0)
     a58:	e40c                	sd	a1,8(s0)
     a5a:	e810                	sd	a2,16(s0)
     a5c:	ec14                	sd	a3,24(s0)
     a5e:	f018                	sd	a4,32(s0)
     a60:	f41c                	sd	a5,40(s0)
     a62:	03043823          	sd	a6,48(s0)
     a66:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     a6a:	04040793          	addi	a5,s0,64
     a6e:	fcf43823          	sd	a5,-48(s0)
     a72:	fd043783          	ld	a5,-48(s0)
     a76:	fc878793          	addi	a5,a5,-56
     a7a:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     a7e:	fe843783          	ld	a5,-24(s0)
     a82:	863e                	mv	a2,a5
     a84:	fd843583          	ld	a1,-40(s0)
     a88:	4505                	li	a0,1
     a8a:	00000097          	auipc	ra,0x0
     a8e:	d04080e7          	jalr	-764(ra) # 78e <vprintf>
}
     a92:	0001                	nop
     a94:	70a2                	ld	ra,40(sp)
     a96:	7402                	ld	s0,32(sp)
     a98:	6165                	addi	sp,sp,112
     a9a:	8082                	ret

0000000000000a9c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     a9c:	7179                	addi	sp,sp,-48
     a9e:	f422                	sd	s0,40(sp)
     aa0:	1800                	addi	s0,sp,48
     aa2:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     aa6:	fd843783          	ld	a5,-40(s0)
     aaa:	17c1                	addi	a5,a5,-16
     aac:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ab0:	00001797          	auipc	a5,0x1
     ab4:	7c878793          	addi	a5,a5,1992 # 2278 <freep>
     ab8:	639c                	ld	a5,0(a5)
     aba:	fef43423          	sd	a5,-24(s0)
     abe:	a815                	j	af2 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ac0:	fe843783          	ld	a5,-24(s0)
     ac4:	639c                	ld	a5,0(a5)
     ac6:	fe843703          	ld	a4,-24(s0)
     aca:	00f76f63          	bltu	a4,a5,ae8 <free+0x4c>
     ace:	fe043703          	ld	a4,-32(s0)
     ad2:	fe843783          	ld	a5,-24(s0)
     ad6:	02e7eb63          	bltu	a5,a4,b0c <free+0x70>
     ada:	fe843783          	ld	a5,-24(s0)
     ade:	639c                	ld	a5,0(a5)
     ae0:	fe043703          	ld	a4,-32(s0)
     ae4:	02f76463          	bltu	a4,a5,b0c <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     ae8:	fe843783          	ld	a5,-24(s0)
     aec:	639c                	ld	a5,0(a5)
     aee:	fef43423          	sd	a5,-24(s0)
     af2:	fe043703          	ld	a4,-32(s0)
     af6:	fe843783          	ld	a5,-24(s0)
     afa:	fce7f3e3          	bgeu	a5,a4,ac0 <free+0x24>
     afe:	fe843783          	ld	a5,-24(s0)
     b02:	639c                	ld	a5,0(a5)
     b04:	fe043703          	ld	a4,-32(s0)
     b08:	faf77ce3          	bgeu	a4,a5,ac0 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     b0c:	fe043783          	ld	a5,-32(s0)
     b10:	479c                	lw	a5,8(a5)
     b12:	1782                	slli	a5,a5,0x20
     b14:	9381                	srli	a5,a5,0x20
     b16:	0792                	slli	a5,a5,0x4
     b18:	fe043703          	ld	a4,-32(s0)
     b1c:	973e                	add	a4,a4,a5
     b1e:	fe843783          	ld	a5,-24(s0)
     b22:	639c                	ld	a5,0(a5)
     b24:	02f71763          	bne	a4,a5,b52 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     b28:	fe043783          	ld	a5,-32(s0)
     b2c:	4798                	lw	a4,8(a5)
     b2e:	fe843783          	ld	a5,-24(s0)
     b32:	639c                	ld	a5,0(a5)
     b34:	479c                	lw	a5,8(a5)
     b36:	9fb9                	addw	a5,a5,a4
     b38:	0007871b          	sext.w	a4,a5
     b3c:	fe043783          	ld	a5,-32(s0)
     b40:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     b42:	fe843783          	ld	a5,-24(s0)
     b46:	639c                	ld	a5,0(a5)
     b48:	6398                	ld	a4,0(a5)
     b4a:	fe043783          	ld	a5,-32(s0)
     b4e:	e398                	sd	a4,0(a5)
     b50:	a039                	j	b5e <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     b52:	fe843783          	ld	a5,-24(s0)
     b56:	6398                	ld	a4,0(a5)
     b58:	fe043783          	ld	a5,-32(s0)
     b5c:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     b5e:	fe843783          	ld	a5,-24(s0)
     b62:	479c                	lw	a5,8(a5)
     b64:	1782                	slli	a5,a5,0x20
     b66:	9381                	srli	a5,a5,0x20
     b68:	0792                	slli	a5,a5,0x4
     b6a:	fe843703          	ld	a4,-24(s0)
     b6e:	97ba                	add	a5,a5,a4
     b70:	fe043703          	ld	a4,-32(s0)
     b74:	02f71563          	bne	a4,a5,b9e <free+0x102>
    p->s.size += bp->s.size;
     b78:	fe843783          	ld	a5,-24(s0)
     b7c:	4798                	lw	a4,8(a5)
     b7e:	fe043783          	ld	a5,-32(s0)
     b82:	479c                	lw	a5,8(a5)
     b84:	9fb9                	addw	a5,a5,a4
     b86:	0007871b          	sext.w	a4,a5
     b8a:	fe843783          	ld	a5,-24(s0)
     b8e:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     b90:	fe043783          	ld	a5,-32(s0)
     b94:	6398                	ld	a4,0(a5)
     b96:	fe843783          	ld	a5,-24(s0)
     b9a:	e398                	sd	a4,0(a5)
     b9c:	a031                	j	ba8 <free+0x10c>
  } else
    p->s.ptr = bp;
     b9e:	fe843783          	ld	a5,-24(s0)
     ba2:	fe043703          	ld	a4,-32(s0)
     ba6:	e398                	sd	a4,0(a5)
  freep = p;
     ba8:	00001797          	auipc	a5,0x1
     bac:	6d078793          	addi	a5,a5,1744 # 2278 <freep>
     bb0:	fe843703          	ld	a4,-24(s0)
     bb4:	e398                	sd	a4,0(a5)
}
     bb6:	0001                	nop
     bb8:	7422                	ld	s0,40(sp)
     bba:	6145                	addi	sp,sp,48
     bbc:	8082                	ret

0000000000000bbe <morecore>:

static Header*
morecore(uint nu)
{
     bbe:	7179                	addi	sp,sp,-48
     bc0:	f406                	sd	ra,40(sp)
     bc2:	f022                	sd	s0,32(sp)
     bc4:	1800                	addi	s0,sp,48
     bc6:	87aa                	mv	a5,a0
     bc8:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     bcc:	fdc42783          	lw	a5,-36(s0)
     bd0:	0007871b          	sext.w	a4,a5
     bd4:	6785                	lui	a5,0x1
     bd6:	00f77563          	bgeu	a4,a5,be0 <morecore+0x22>
    nu = 4096;
     bda:	6785                	lui	a5,0x1
     bdc:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     be0:	fdc42783          	lw	a5,-36(s0)
     be4:	0047979b          	slliw	a5,a5,0x4
     be8:	2781                	sext.w	a5,a5
     bea:	2781                	sext.w	a5,a5
     bec:	853e                	mv	a0,a5
     bee:	00000097          	auipc	ra,0x0
     bf2:	9a0080e7          	jalr	-1632(ra) # 58e <sbrk>
     bf6:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     bfa:	fe843703          	ld	a4,-24(s0)
     bfe:	57fd                	li	a5,-1
     c00:	00f71463          	bne	a4,a5,c08 <morecore+0x4a>
    return 0;
     c04:	4781                	li	a5,0
     c06:	a03d                	j	c34 <morecore+0x76>
  hp = (Header*)p;
     c08:	fe843783          	ld	a5,-24(s0)
     c0c:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     c10:	fe043783          	ld	a5,-32(s0)
     c14:	fdc42703          	lw	a4,-36(s0)
     c18:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     c1a:	fe043783          	ld	a5,-32(s0)
     c1e:	07c1                	addi	a5,a5,16
     c20:	853e                	mv	a0,a5
     c22:	00000097          	auipc	ra,0x0
     c26:	e7a080e7          	jalr	-390(ra) # a9c <free>
  return freep;
     c2a:	00001797          	auipc	a5,0x1
     c2e:	64e78793          	addi	a5,a5,1614 # 2278 <freep>
     c32:	639c                	ld	a5,0(a5)
}
     c34:	853e                	mv	a0,a5
     c36:	70a2                	ld	ra,40(sp)
     c38:	7402                	ld	s0,32(sp)
     c3a:	6145                	addi	sp,sp,48
     c3c:	8082                	ret

0000000000000c3e <malloc>:

void*
malloc(uint nbytes)
{
     c3e:	7139                	addi	sp,sp,-64
     c40:	fc06                	sd	ra,56(sp)
     c42:	f822                	sd	s0,48(sp)
     c44:	0080                	addi	s0,sp,64
     c46:	87aa                	mv	a5,a0
     c48:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     c4c:	fcc46783          	lwu	a5,-52(s0)
     c50:	07bd                	addi	a5,a5,15
     c52:	8391                	srli	a5,a5,0x4
     c54:	2781                	sext.w	a5,a5
     c56:	2785                	addiw	a5,a5,1
     c58:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     c5c:	00001797          	auipc	a5,0x1
     c60:	61c78793          	addi	a5,a5,1564 # 2278 <freep>
     c64:	639c                	ld	a5,0(a5)
     c66:	fef43023          	sd	a5,-32(s0)
     c6a:	fe043783          	ld	a5,-32(s0)
     c6e:	ef95                	bnez	a5,caa <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     c70:	00001797          	auipc	a5,0x1
     c74:	5f878793          	addi	a5,a5,1528 # 2268 <base>
     c78:	fef43023          	sd	a5,-32(s0)
     c7c:	00001797          	auipc	a5,0x1
     c80:	5fc78793          	addi	a5,a5,1532 # 2278 <freep>
     c84:	fe043703          	ld	a4,-32(s0)
     c88:	e398                	sd	a4,0(a5)
     c8a:	00001797          	auipc	a5,0x1
     c8e:	5ee78793          	addi	a5,a5,1518 # 2278 <freep>
     c92:	6398                	ld	a4,0(a5)
     c94:	00001797          	auipc	a5,0x1
     c98:	5d478793          	addi	a5,a5,1492 # 2268 <base>
     c9c:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     c9e:	00001797          	auipc	a5,0x1
     ca2:	5ca78793          	addi	a5,a5,1482 # 2268 <base>
     ca6:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     caa:	fe043783          	ld	a5,-32(s0)
     cae:	639c                	ld	a5,0(a5)
     cb0:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     cb4:	fe843783          	ld	a5,-24(s0)
     cb8:	4798                	lw	a4,8(a5)
     cba:	fdc42783          	lw	a5,-36(s0)
     cbe:	2781                	sext.w	a5,a5
     cc0:	06f76863          	bltu	a4,a5,d30 <malloc+0xf2>
      if(p->s.size == nunits)
     cc4:	fe843783          	ld	a5,-24(s0)
     cc8:	4798                	lw	a4,8(a5)
     cca:	fdc42783          	lw	a5,-36(s0)
     cce:	2781                	sext.w	a5,a5
     cd0:	00e79963          	bne	a5,a4,ce2 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     cd4:	fe843783          	ld	a5,-24(s0)
     cd8:	6398                	ld	a4,0(a5)
     cda:	fe043783          	ld	a5,-32(s0)
     cde:	e398                	sd	a4,0(a5)
     ce0:	a82d                	j	d1a <malloc+0xdc>
      else {
        p->s.size -= nunits;
     ce2:	fe843783          	ld	a5,-24(s0)
     ce6:	4798                	lw	a4,8(a5)
     ce8:	fdc42783          	lw	a5,-36(s0)
     cec:	40f707bb          	subw	a5,a4,a5
     cf0:	0007871b          	sext.w	a4,a5
     cf4:	fe843783          	ld	a5,-24(s0)
     cf8:	c798                	sw	a4,8(a5)
        p += p->s.size;
     cfa:	fe843783          	ld	a5,-24(s0)
     cfe:	479c                	lw	a5,8(a5)
     d00:	1782                	slli	a5,a5,0x20
     d02:	9381                	srli	a5,a5,0x20
     d04:	0792                	slli	a5,a5,0x4
     d06:	fe843703          	ld	a4,-24(s0)
     d0a:	97ba                	add	a5,a5,a4
     d0c:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     d10:	fe843783          	ld	a5,-24(s0)
     d14:	fdc42703          	lw	a4,-36(s0)
     d18:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     d1a:	00001797          	auipc	a5,0x1
     d1e:	55e78793          	addi	a5,a5,1374 # 2278 <freep>
     d22:	fe043703          	ld	a4,-32(s0)
     d26:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     d28:	fe843783          	ld	a5,-24(s0)
     d2c:	07c1                	addi	a5,a5,16
     d2e:	a091                	j	d72 <malloc+0x134>
    }
    if(p == freep)
     d30:	00001797          	auipc	a5,0x1
     d34:	54878793          	addi	a5,a5,1352 # 2278 <freep>
     d38:	639c                	ld	a5,0(a5)
     d3a:	fe843703          	ld	a4,-24(s0)
     d3e:	02f71063          	bne	a4,a5,d5e <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     d42:	fdc42783          	lw	a5,-36(s0)
     d46:	853e                	mv	a0,a5
     d48:	00000097          	auipc	ra,0x0
     d4c:	e76080e7          	jalr	-394(ra) # bbe <morecore>
     d50:	fea43423          	sd	a0,-24(s0)
     d54:	fe843783          	ld	a5,-24(s0)
     d58:	e399                	bnez	a5,d5e <malloc+0x120>
        return 0;
     d5a:	4781                	li	a5,0
     d5c:	a819                	j	d72 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d5e:	fe843783          	ld	a5,-24(s0)
     d62:	fef43023          	sd	a5,-32(s0)
     d66:	fe843783          	ld	a5,-24(s0)
     d6a:	639c                	ld	a5,0(a5)
     d6c:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d70:	b791                	j	cb4 <malloc+0x76>
  }
}
     d72:	853e                	mv	a0,a5
     d74:	70e2                	ld	ra,56(sp)
     d76:	7442                	ld	s0,48(sp)
     d78:	6121                	addi	sp,sp,64
     d7a:	8082                	ret

0000000000000d7c <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     d7c:	7179                	addi	sp,sp,-48
     d7e:	f422                	sd	s0,40(sp)
     d80:	1800                	addi	s0,sp,48
     d82:	fea43423          	sd	a0,-24(s0)
     d86:	feb43023          	sd	a1,-32(s0)
     d8a:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     d8e:	fd843783          	ld	a5,-40(s0)
     d92:	fe843703          	ld	a4,-24(s0)
     d96:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     d98:	fe843783          	ld	a5,-24(s0)
     d9c:	fd843703          	ld	a4,-40(s0)
     da0:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     da2:	fe843783          	ld	a5,-24(s0)
     da6:	fe043703          	ld	a4,-32(s0)
     daa:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     dac:	fe043783          	ld	a5,-32(s0)
     db0:	fe843703          	ld	a4,-24(s0)
     db4:	e398                	sd	a4,0(a5)
 }
     db6:	0001                	nop
     db8:	7422                	ld	s0,40(sp)
     dba:	6145                	addi	sp,sp,48
     dbc:	8082                	ret

0000000000000dbe <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     dbe:	1101                	addi	sp,sp,-32
     dc0:	ec06                	sd	ra,24(sp)
     dc2:	e822                	sd	s0,16(sp)
     dc4:	1000                	addi	s0,sp,32
     dc6:	fea43423          	sd	a0,-24(s0)
     dca:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     dce:	fe043783          	ld	a5,-32(s0)
     dd2:	679c                	ld	a5,8(a5)
     dd4:	fe043603          	ld	a2,-32(s0)
     dd8:	85be                	mv	a1,a5
     dda:	fe843503          	ld	a0,-24(s0)
     dde:	00000097          	auipc	ra,0x0
     de2:	f9e080e7          	jalr	-98(ra) # d7c <__list_add>
 }
     de6:	0001                	nop
     de8:	60e2                	ld	ra,24(sp)
     dea:	6442                	ld	s0,16(sp)
     dec:	6105                	addi	sp,sp,32
     dee:	8082                	ret

0000000000000df0 <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     df0:	1101                	addi	sp,sp,-32
     df2:	ec22                	sd	s0,24(sp)
     df4:	1000                	addi	s0,sp,32
     df6:	fea43423          	sd	a0,-24(s0)
     dfa:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
     dfe:	fe043783          	ld	a5,-32(s0)
     e02:	fe843703          	ld	a4,-24(s0)
     e06:	e798                	sd	a4,8(a5)
     prev->next = next;
     e08:	fe843783          	ld	a5,-24(s0)
     e0c:	fe043703          	ld	a4,-32(s0)
     e10:	e398                	sd	a4,0(a5)
 }
     e12:	0001                	nop
     e14:	6462                	ld	s0,24(sp)
     e16:	6105                	addi	sp,sp,32
     e18:	8082                	ret

0000000000000e1a <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     e1a:	1101                	addi	sp,sp,-32
     e1c:	ec06                	sd	ra,24(sp)
     e1e:	e822                	sd	s0,16(sp)
     e20:	1000                	addi	s0,sp,32
     e22:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
     e26:	fe843783          	ld	a5,-24(s0)
     e2a:	6798                	ld	a4,8(a5)
     e2c:	fe843783          	ld	a5,-24(s0)
     e30:	639c                	ld	a5,0(a5)
     e32:	85be                	mv	a1,a5
     e34:	853a                	mv	a0,a4
     e36:	00000097          	auipc	ra,0x0
     e3a:	fba080e7          	jalr	-70(ra) # df0 <__list_del>
     entry->next = LIST_POISON1;
     e3e:	fe843783          	ld	a5,-24(s0)
     e42:	00100737          	lui	a4,0x100
     e46:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd6e0>
     e4a:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
     e4c:	fe843783          	ld	a5,-24(s0)
     e50:	00200737          	lui	a4,0x200
     e54:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd7e0>
     e58:	e798                	sd	a4,8(a5)
 }
     e5a:	0001                	nop
     e5c:	60e2                	ld	ra,24(sp)
     e5e:	6442                	ld	s0,16(sp)
     e60:	6105                	addi	sp,sp,32
     e62:	8082                	ret

0000000000000e64 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
     e64:	1101                	addi	sp,sp,-32
     e66:	ec22                	sd	s0,24(sp)
     e68:	1000                	addi	s0,sp,32
     e6a:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
     e6e:	fe843783          	ld	a5,-24(s0)
     e72:	639c                	ld	a5,0(a5)
     e74:	fe843703          	ld	a4,-24(s0)
     e78:	40f707b3          	sub	a5,a4,a5
     e7c:	0017b793          	seqz	a5,a5
     e80:	0ff7f793          	andi	a5,a5,255
     e84:	2781                	sext.w	a5,a5
 }
     e86:	853e                	mv	a0,a5
     e88:	6462                	ld	s0,24(sp)
     e8a:	6105                	addi	sp,sp,32
     e8c:	8082                	ret

0000000000000e8e <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     e8e:	715d                	addi	sp,sp,-80
     e90:	e486                	sd	ra,72(sp)
     e92:	e0a2                	sd	s0,64(sp)
     e94:	0880                	addi	s0,sp,80
     e96:	fca43423          	sd	a0,-56(s0)
     e9a:	fcb43023          	sd	a1,-64(s0)
     e9e:	85b2                	mv	a1,a2
     ea0:	8636                	mv	a2,a3
     ea2:	86ba                	mv	a3,a4
     ea4:	873e                	mv	a4,a5
     ea6:	87ae                	mv	a5,a1
     ea8:	faf42e23          	sw	a5,-68(s0)
     eac:	87b2                	mv	a5,a2
     eae:	faf42c23          	sw	a5,-72(s0)
     eb2:	87b6                	mv	a5,a3
     eb4:	faf42a23          	sw	a5,-76(s0)
     eb8:	87ba                	mv	a5,a4
     eba:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     ebe:	08000513          	li	a0,128
     ec2:	00000097          	auipc	ra,0x0
     ec6:	d7c080e7          	jalr	-644(ra) # c3e <malloc>
     eca:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     ece:	6505                	lui	a0,0x1
     ed0:	00000097          	auipc	ra,0x0
     ed4:	d6e080e7          	jalr	-658(ra) # c3e <malloc>
     ed8:	87aa                	mv	a5,a0
     eda:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     ede:	fe043703          	ld	a4,-32(s0)
     ee2:	6785                	lui	a5,0x1
     ee4:	17c1                	addi	a5,a5,-16
     ee6:	97ba                	add	a5,a5,a4
     ee8:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     eec:	fe843783          	ld	a5,-24(s0)
     ef0:	fc843703          	ld	a4,-56(s0)
     ef4:	e398                	sd	a4,0(a5)
    t->arg = arg;
     ef6:	fe843783          	ld	a5,-24(s0)
     efa:	fc043703          	ld	a4,-64(s0)
     efe:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     f00:	00001797          	auipc	a5,0x1
     f04:	35c78793          	addi	a5,a5,860 # 225c <_id.1241>
     f08:	439c                	lw	a5,0(a5)
     f0a:	0017871b          	addiw	a4,a5,1
     f0e:	0007069b          	sext.w	a3,a4
     f12:	00001717          	auipc	a4,0x1
     f16:	34a70713          	addi	a4,a4,842 # 225c <_id.1241>
     f1a:	c314                	sw	a3,0(a4)
     f1c:	fe843703          	ld	a4,-24(s0)
     f20:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
     f22:	fe843783          	ld	a5,-24(s0)
     f26:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
     f2a:	fe043703          	ld	a4,-32(s0)
     f2e:	fe843783          	ld	a5,-24(s0)
     f32:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
     f34:	fd843703          	ld	a4,-40(s0)
     f38:	fe843783          	ld	a5,-24(s0)
     f3c:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
     f3e:	fe843783          	ld	a5,-24(s0)
     f42:	fb842703          	lw	a4,-72(s0)
     f46:	c3f8                	sw	a4,68(a5)
    t->period = period;
     f48:	fe843783          	ld	a5,-24(s0)
     f4c:	fb442703          	lw	a4,-76(s0)
     f50:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
     f52:	fe843783          	ld	a5,-24(s0)
     f56:	fb442703          	lw	a4,-76(s0)
     f5a:	c7b8                	sw	a4,72(a5)
    t->n = n;
     f5c:	fe843783          	ld	a5,-24(s0)
     f60:	fb042703          	lw	a4,-80(s0)
     f64:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
     f66:	fe843783          	ld	a5,-24(s0)
     f6a:	fbc42703          	lw	a4,-68(s0)
     f6e:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
     f70:	fe843783          	ld	a5,-24(s0)
     f74:	fb842703          	lw	a4,-72(s0)
     f78:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
     f7a:	fe843783          	ld	a5,-24(s0)
     f7e:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
     f82:	fe843783          	ld	a5,-24(s0)
     f86:	06400713          	li	a4,100
     f8a:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
     f8c:	fe843783          	ld	a5,-24(s0)
     f90:	671d                	lui	a4,0x7
     f92:	5307071b          	addiw	a4,a4,1328
     f96:	d3b8                	sw	a4,96(a5)
    
    return t;
     f98:	fe843783          	ld	a5,-24(s0)
}
     f9c:	853e                	mv	a0,a5
     f9e:	60a6                	ld	ra,72(sp)
     fa0:	6406                	ld	s0,64(sp)
     fa2:	6161                	addi	sp,sp,80
     fa4:	8082                	ret

0000000000000fa6 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
     fa6:	1101                	addi	sp,sp,-32
     fa8:	ec22                	sd	s0,24(sp)
     faa:	1000                	addi	s0,sp,32
     fac:	fea43423          	sd	a0,-24(s0)
     fb0:	87ae                	mv	a5,a1
     fb2:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
     fb6:	fe843783          	ld	a5,-24(s0)
     fba:	fe442703          	lw	a4,-28(s0)
     fbe:	cff8                	sw	a4,92(a5)
}
     fc0:	0001                	nop
     fc2:	6462                	ld	s0,24(sp)
     fc4:	6105                	addi	sp,sp,32
     fc6:	8082                	ret

0000000000000fc8 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
     fc8:	1101                	addi	sp,sp,-32
     fca:	ec22                	sd	s0,24(sp)
     fcc:	1000                	addi	s0,sp,32
     fce:	fea43423          	sd	a0,-24(s0)
     fd2:	87ae                	mv	a5,a1
     fd4:	8732                	mv	a4,a2
     fd6:	fef42223          	sw	a5,-28(s0)
     fda:	87ba                	mv	a5,a4
     fdc:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
     fe0:	fe843783          	ld	a5,-24(s0)
     fe4:	fe442703          	lw	a4,-28(s0)
     fe8:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
     fea:	fe843783          	ld	a5,-24(s0)
     fee:	fe442703          	lw	a4,-28(s0)
     ff2:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
     ff4:	fe843783          	ld	a5,-24(s0)
     ff8:	fe042703          	lw	a4,-32(s0)
     ffc:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
     ffe:	fe843783          	ld	a5,-24(s0)
    1002:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1006:	fe843783          	ld	a5,-24(s0)
    100a:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    100e:	fe843783          	ld	a5,-24(s0)
    1012:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    1016:	fe843783          	ld	a5,-24(s0)
    101a:	0607ae23          	sw	zero,124(a5)
}
    101e:	0001                	nop
    1020:	6462                	ld	s0,24(sp)
    1022:	6105                	addi	sp,sp,32
    1024:	8082                	ret

0000000000001026 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    1026:	7179                	addi	sp,sp,-48
    1028:	f406                	sd	ra,40(sp)
    102a:	f022                	sd	s0,32(sp)
    102c:	1800                	addi	s0,sp,48
    102e:	fca43c23          	sd	a0,-40(s0)
    1032:	87ae                	mv	a5,a1
    1034:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    1038:	02000513          	li	a0,32
    103c:	00000097          	auipc	ra,0x0
    1040:	c02080e7          	jalr	-1022(ra) # c3e <malloc>
    1044:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    1048:	fe843783          	ld	a5,-24(s0)
    104c:	fd843703          	ld	a4,-40(s0)
    1050:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    1052:	fe843783          	ld	a5,-24(s0)
    1056:	fd442703          	lw	a4,-44(s0)
    105a:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    105c:	fd843783          	ld	a5,-40(s0)
    1060:	fd442703          	lw	a4,-44(s0)
    1064:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    1066:	fd843783          	ld	a5,-40(s0)
    106a:	43bc                	lw	a5,64(a5)
    106c:	cf81                	beqz	a5,1084 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    106e:	fd843783          	ld	a5,-40(s0)
    1072:	47bc                	lw	a5,72(a5)
    1074:	fd442703          	lw	a4,-44(s0)
    1078:	9fb9                	addw	a5,a5,a4
    107a:	0007871b          	sext.w	a4,a5
    107e:	fd843783          	ld	a5,-40(s0)
    1082:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1084:	fe843783          	ld	a5,-24(s0)
    1088:	07a1                	addi	a5,a5,8
    108a:	00001597          	auipc	a1,0x1
    108e:	1be58593          	addi	a1,a1,446 # 2248 <release_queue>
    1092:	853e                	mv	a0,a5
    1094:	00000097          	auipc	ra,0x0
    1098:	d2a080e7          	jalr	-726(ra) # dbe <list_add_tail>
}
    109c:	0001                	nop
    109e:	70a2                	ld	ra,40(sp)
    10a0:	7402                	ld	s0,32(sp)
    10a2:	6145                	addi	sp,sp,48
    10a4:	8082                	ret

00000000000010a6 <__release>:

void __release()
{
    10a6:	7139                	addi	sp,sp,-64
    10a8:	fc06                	sd	ra,56(sp)
    10aa:	f822                	sd	s0,48(sp)
    10ac:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    10ae:	00001797          	auipc	a5,0x1
    10b2:	19a78793          	addi	a5,a5,410 # 2248 <release_queue>
    10b6:	639c                	ld	a5,0(a5)
    10b8:	fcf43c23          	sd	a5,-40(s0)
    10bc:	fd843783          	ld	a5,-40(s0)
    10c0:	17e1                	addi	a5,a5,-8
    10c2:	fef43423          	sd	a5,-24(s0)
    10c6:	fe843783          	ld	a5,-24(s0)
    10ca:	679c                	ld	a5,8(a5)
    10cc:	fcf43823          	sd	a5,-48(s0)
    10d0:	fd043783          	ld	a5,-48(s0)
    10d4:	17e1                	addi	a5,a5,-8
    10d6:	fef43023          	sd	a5,-32(s0)
    10da:	a0e9                	j	11a4 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    10dc:	fe843783          	ld	a5,-24(s0)
    10e0:	4f98                	lw	a4,24(a5)
    10e2:	00001797          	auipc	a5,0x1
    10e6:	1a678793          	addi	a5,a5,422 # 2288 <threading_system_time>
    10ea:	439c                	lw	a5,0(a5)
    10ec:	08e7ce63          	blt	a5,a4,1188 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    10f0:	fe843783          	ld	a5,-24(s0)
    10f4:	639c                	ld	a5,0(a5)
    10f6:	5bbc                	lw	a5,112(a5)
    10f8:	c79d                	beqz	a5,1126 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    10fa:	fe843783          	ld	a5,-24(s0)
    10fe:	639c                	ld	a5,0(a5)
    1100:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    1104:	fe843783          	ld	a5,-24(s0)
    1108:	6398                	ld	a4,0(a5)
    110a:	fe843783          	ld	a5,-24(s0)
    110e:	639c                	ld	a5,0(a5)
    1110:	5378                	lw	a4,100(a4)
    1112:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    1114:	fe843783          	ld	a5,-24(s0)
    1118:	6398                	ld	a4,0(a5)
    111a:	fe843783          	ld	a5,-24(s0)
    111e:	639c                	ld	a5,0(a5)
    1120:	5f78                	lw	a4,124(a4)
    1122:	cbf8                	sw	a4,84(a5)
    1124:	a809                	j	1136 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    1126:	fe843783          	ld	a5,-24(s0)
    112a:	6398                	ld	a4,0(a5)
    112c:	fe843783          	ld	a5,-24(s0)
    1130:	639c                	ld	a5,0(a5)
    1132:	4378                	lw	a4,68(a4)
    1134:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    1136:	fe843783          	ld	a5,-24(s0)
    113a:	4f94                	lw	a3,24(a5)
    113c:	fe843783          	ld	a5,-24(s0)
    1140:	639c                	ld	a5,0(a5)
    1142:	47b8                	lw	a4,72(a5)
    1144:	fe843783          	ld	a5,-24(s0)
    1148:	639c                	ld	a5,0(a5)
    114a:	9f35                	addw	a4,a4,a3
    114c:	2701                	sext.w	a4,a4
    114e:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    1150:	fe843783          	ld	a5,-24(s0)
    1154:	639c                	ld	a5,0(a5)
    1156:	02878793          	addi	a5,a5,40
    115a:	00001597          	auipc	a1,0x1
    115e:	0de58593          	addi	a1,a1,222 # 2238 <run_queue>
    1162:	853e                	mv	a0,a5
    1164:	00000097          	auipc	ra,0x0
    1168:	c5a080e7          	jalr	-934(ra) # dbe <list_add_tail>
            list_del(&cur->thread_list);
    116c:	fe843783          	ld	a5,-24(s0)
    1170:	07a1                	addi	a5,a5,8
    1172:	853e                	mv	a0,a5
    1174:	00000097          	auipc	ra,0x0
    1178:	ca6080e7          	jalr	-858(ra) # e1a <list_del>
            free(cur);
    117c:	fe843503          	ld	a0,-24(s0)
    1180:	00000097          	auipc	ra,0x0
    1184:	91c080e7          	jalr	-1764(ra) # a9c <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1188:	fe043783          	ld	a5,-32(s0)
    118c:	fef43423          	sd	a5,-24(s0)
    1190:	fe043783          	ld	a5,-32(s0)
    1194:	679c                	ld	a5,8(a5)
    1196:	fcf43423          	sd	a5,-56(s0)
    119a:	fc843783          	ld	a5,-56(s0)
    119e:	17e1                	addi	a5,a5,-8
    11a0:	fef43023          	sd	a5,-32(s0)
    11a4:	fe843783          	ld	a5,-24(s0)
    11a8:	00878713          	addi	a4,a5,8
    11ac:	00001797          	auipc	a5,0x1
    11b0:	09c78793          	addi	a5,a5,156 # 2248 <release_queue>
    11b4:	f2f714e3          	bne	a4,a5,10dc <__release+0x36>
        }
    }
}
    11b8:	0001                	nop
    11ba:	0001                	nop
    11bc:	70e2                	ld	ra,56(sp)
    11be:	7442                	ld	s0,48(sp)
    11c0:	6121                	addi	sp,sp,64
    11c2:	8082                	ret

00000000000011c4 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    11c4:	1101                	addi	sp,sp,-32
    11c6:	ec06                	sd	ra,24(sp)
    11c8:	e822                	sd	s0,16(sp)
    11ca:	1000                	addi	s0,sp,32
    11cc:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    11d0:	fe843783          	ld	a5,-24(s0)
    11d4:	7b98                	ld	a4,48(a5)
    11d6:	00001797          	auipc	a5,0x1
    11da:	0aa78793          	addi	a5,a5,170 # 2280 <current>
    11de:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    11e0:	fe843783          	ld	a5,-24(s0)
    11e4:	02878793          	addi	a5,a5,40
    11e8:	853e                	mv	a0,a5
    11ea:	00000097          	auipc	ra,0x0
    11ee:	c30080e7          	jalr	-976(ra) # e1a <list_del>

    free(to_remove->stack);
    11f2:	fe843783          	ld	a5,-24(s0)
    11f6:	6b9c                	ld	a5,16(a5)
    11f8:	853e                	mv	a0,a5
    11fa:	00000097          	auipc	ra,0x0
    11fe:	8a2080e7          	jalr	-1886(ra) # a9c <free>
    free(to_remove);
    1202:	fe843503          	ld	a0,-24(s0)
    1206:	00000097          	auipc	ra,0x0
    120a:	896080e7          	jalr	-1898(ra) # a9c <free>

    __schedule();
    120e:	00000097          	auipc	ra,0x0
    1212:	5e8080e7          	jalr	1512(ra) # 17f6 <__schedule>
    __dispatch();
    1216:	00000097          	auipc	ra,0x0
    121a:	416080e7          	jalr	1046(ra) # 162c <__dispatch>
    thrdresume(main_thrd_id);
    121e:	00001797          	auipc	a5,0x1
    1222:	03a78793          	addi	a5,a5,58 # 2258 <main_thrd_id>
    1226:	439c                	lw	a5,0(a5)
    1228:	853e                	mv	a0,a5
    122a:	fffff097          	auipc	ra,0xfffff
    122e:	384080e7          	jalr	900(ra) # 5ae <thrdresume>
}
    1232:	0001                	nop
    1234:	60e2                	ld	ra,24(sp)
    1236:	6442                	ld	s0,16(sp)
    1238:	6105                	addi	sp,sp,32
    123a:	8082                	ret

000000000000123c <thread_exit>:

void thread_exit(void)
{
    123c:	7179                	addi	sp,sp,-48
    123e:	f406                	sd	ra,40(sp)
    1240:	f022                	sd	s0,32(sp)
    1242:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1244:	00001797          	auipc	a5,0x1
    1248:	03c78793          	addi	a5,a5,60 # 2280 <current>
    124c:	6398                	ld	a4,0(a5)
    124e:	00001797          	auipc	a5,0x1
    1252:	fea78793          	addi	a5,a5,-22 # 2238 <run_queue>
    1256:	02f71063          	bne	a4,a5,1276 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    125a:	00001597          	auipc	a1,0x1
    125e:	d4e58593          	addi	a1,a1,-690 # 1fa8 <schedule_edf_cbs+0x4dc>
    1262:	4509                	li	a0,2
    1264:	fffff097          	auipc	ra,0xfffff
    1268:	790080e7          	jalr	1936(ra) # 9f4 <fprintf>
        exit(1);
    126c:	4505                	li	a0,1
    126e:	fffff097          	auipc	ra,0xfffff
    1272:	298080e7          	jalr	664(ra) # 506 <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    1276:	00001797          	auipc	a5,0x1
    127a:	00a78793          	addi	a5,a5,10 # 2280 <current>
    127e:	639c                	ld	a5,0(a5)
    1280:	fef43423          	sd	a5,-24(s0)
    1284:	fe843783          	ld	a5,-24(s0)
    1288:	fd878793          	addi	a5,a5,-40
    128c:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    1290:	fe043783          	ld	a5,-32(s0)
    1294:	5f9c                	lw	a5,56(a5)
    1296:	4585                	li	a1,1
    1298:	853e                	mv	a0,a5
    129a:	fffff097          	auipc	ra,0xfffff
    129e:	31c080e7          	jalr	796(ra) # 5b6 <cancelthrdstop>
    12a2:	87aa                	mv	a5,a0
    12a4:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    12a8:	00001797          	auipc	a5,0x1
    12ac:	fe078793          	addi	a5,a5,-32 # 2288 <threading_system_time>
    12b0:	439c                	lw	a5,0(a5)
    12b2:	fdc42703          	lw	a4,-36(s0)
    12b6:	9fb9                	addw	a5,a5,a4
    12b8:	0007871b          	sext.w	a4,a5
    12bc:	00001797          	auipc	a5,0x1
    12c0:	fcc78793          	addi	a5,a5,-52 # 2288 <threading_system_time>
    12c4:	c398                	sw	a4,0(a5)

    __release();
    12c6:	00000097          	auipc	ra,0x0
    12ca:	de0080e7          	jalr	-544(ra) # 10a6 <__release>
    __thread_exit(to_remove);
    12ce:	fe043503          	ld	a0,-32(s0)
    12d2:	00000097          	auipc	ra,0x0
    12d6:	ef2080e7          	jalr	-270(ra) # 11c4 <__thread_exit>
}
    12da:	0001                	nop
    12dc:	70a2                	ld	ra,40(sp)
    12de:	7402                	ld	s0,32(sp)
    12e0:	6145                	addi	sp,sp,48
    12e2:	8082                	ret

00000000000012e4 <__finish_current>:

void __finish_current()
{
    12e4:	7179                	addi	sp,sp,-48
    12e6:	f406                	sd	ra,40(sp)
    12e8:	f022                	sd	s0,32(sp)
    12ea:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    12ec:	00001797          	auipc	a5,0x1
    12f0:	f9478793          	addi	a5,a5,-108 # 2280 <current>
    12f4:	639c                	ld	a5,0(a5)
    12f6:	fef43423          	sd	a5,-24(s0)
    12fa:	fe843783          	ld	a5,-24(s0)
    12fe:	fd878793          	addi	a5,a5,-40
    1302:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1306:	fe043783          	ld	a5,-32(s0)
    130a:	4bbc                	lw	a5,80(a5)
    130c:	37fd                	addiw	a5,a5,-1
    130e:	0007871b          	sext.w	a4,a5
    1312:	fe043783          	ld	a5,-32(s0)
    1316:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    1318:	fe043783          	ld	a5,-32(s0)
    131c:	5fd8                	lw	a4,60(a5)
    131e:	00001797          	auipc	a5,0x1
    1322:	f6a78793          	addi	a5,a5,-150 # 2288 <threading_system_time>
    1326:	4390                	lw	a2,0(a5)
    1328:	fe043783          	ld	a5,-32(s0)
    132c:	4bbc                	lw	a5,80(a5)
    132e:	86be                	mv	a3,a5
    1330:	85ba                	mv	a1,a4
    1332:	00001517          	auipc	a0,0x1
    1336:	cae50513          	addi	a0,a0,-850 # 1fe0 <schedule_edf_cbs+0x514>
    133a:	fffff097          	auipc	ra,0xfffff
    133e:	712080e7          	jalr	1810(ra) # a4c <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1342:	fe043783          	ld	a5,-32(s0)
    1346:	4bbc                	lw	a5,80(a5)
    1348:	04f05563          	blez	a5,1392 <__finish_current+0xae>
        struct list_head *to_remove = current;
    134c:	00001797          	auipc	a5,0x1
    1350:	f3478793          	addi	a5,a5,-204 # 2280 <current>
    1354:	639c                	ld	a5,0(a5)
    1356:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    135a:	00001797          	auipc	a5,0x1
    135e:	f2678793          	addi	a5,a5,-218 # 2280 <current>
    1362:	639c                	ld	a5,0(a5)
    1364:	6798                	ld	a4,8(a5)
    1366:	00001797          	auipc	a5,0x1
    136a:	f1a78793          	addi	a5,a5,-230 # 2280 <current>
    136e:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1370:	fd843503          	ld	a0,-40(s0)
    1374:	00000097          	auipc	ra,0x0
    1378:	aa6080e7          	jalr	-1370(ra) # e1a <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    137c:	fe043783          	ld	a5,-32(s0)
    1380:	4fbc                	lw	a5,88(a5)
    1382:	85be                	mv	a1,a5
    1384:	fe043503          	ld	a0,-32(s0)
    1388:	00000097          	auipc	ra,0x0
    138c:	c9e080e7          	jalr	-866(ra) # 1026 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    1390:	a039                	j	139e <__finish_current+0xba>
        __thread_exit(current_thread);
    1392:	fe043503          	ld	a0,-32(s0)
    1396:	00000097          	auipc	ra,0x0
    139a:	e2e080e7          	jalr	-466(ra) # 11c4 <__thread_exit>
}
    139e:	0001                	nop
    13a0:	70a2                	ld	ra,40(sp)
    13a2:	7402                	ld	s0,32(sp)
    13a4:	6145                	addi	sp,sp,48
    13a6:	8082                	ret

00000000000013a8 <__rt_finish_current>:
void __rt_finish_current()
{
    13a8:	7179                	addi	sp,sp,-48
    13aa:	f406                	sd	ra,40(sp)
    13ac:	f022                	sd	s0,32(sp)
    13ae:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    13b0:	00001797          	auipc	a5,0x1
    13b4:	ed078793          	addi	a5,a5,-304 # 2280 <current>
    13b8:	639c                	ld	a5,0(a5)
    13ba:	fef43423          	sd	a5,-24(s0)
    13be:	fe843783          	ld	a5,-24(s0)
    13c2:	fd878793          	addi	a5,a5,-40
    13c6:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    13ca:	fe043783          	ld	a5,-32(s0)
    13ce:	4bbc                	lw	a5,80(a5)
    13d0:	37fd                	addiw	a5,a5,-1
    13d2:	0007871b          	sext.w	a4,a5
    13d6:	fe043783          	ld	a5,-32(s0)
    13da:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    13dc:	fe043783          	ld	a5,-32(s0)
    13e0:	5fd8                	lw	a4,60(a5)
    13e2:	00001797          	auipc	a5,0x1
    13e6:	ea678793          	addi	a5,a5,-346 # 2288 <threading_system_time>
    13ea:	4390                	lw	a2,0(a5)
    13ec:	fe043783          	ld	a5,-32(s0)
    13f0:	4bbc                	lw	a5,80(a5)
    13f2:	86be                	mv	a3,a5
    13f4:	85ba                	mv	a1,a4
    13f6:	00001517          	auipc	a0,0x1
    13fa:	c0250513          	addi	a0,a0,-1022 # 1ff8 <schedule_edf_cbs+0x52c>
    13fe:	fffff097          	auipc	ra,0xfffff
    1402:	64e080e7          	jalr	1614(ra) # a4c <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1406:	fe043783          	ld	a5,-32(s0)
    140a:	4bbc                	lw	a5,80(a5)
    140c:	04f05f63          	blez	a5,146a <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    1410:	00001797          	auipc	a5,0x1
    1414:	e7078793          	addi	a5,a5,-400 # 2280 <current>
    1418:	639c                	ld	a5,0(a5)
    141a:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    141e:	00001797          	auipc	a5,0x1
    1422:	e6278793          	addi	a5,a5,-414 # 2280 <current>
    1426:	639c                	ld	a5,0(a5)
    1428:	6798                	ld	a4,8(a5)
    142a:	00001797          	auipc	a5,0x1
    142e:	e5678793          	addi	a5,a5,-426 # 2280 <current>
    1432:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1434:	fd843503          	ld	a0,-40(s0)
    1438:	00000097          	auipc	ra,0x0
    143c:	9e2080e7          	jalr	-1566(ra) # e1a <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    1440:	fe043783          	ld	a5,-32(s0)
    1444:	4fbc                	lw	a5,88(a5)
    1446:	85be                	mv	a1,a5
    1448:	fe043503          	ld	a0,-32(s0)
    144c:	00000097          	auipc	ra,0x0
    1450:	bda080e7          	jalr	-1062(ra) # 1026 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    1454:	fe043783          	ld	a5,-32(s0)
    1458:	57fc                	lw	a5,108(a5)
    145a:	ef91                	bnez	a5,1476 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    145c:	fe043783          	ld	a5,-32(s0)
    1460:	53f8                	lw	a4,100(a5)
    1462:	fe043783          	ld	a5,-32(s0)
    1466:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    1468:	a039                	j	1476 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    146a:	fe043503          	ld	a0,-32(s0)
    146e:	00000097          	auipc	ra,0x0
    1472:	d56080e7          	jalr	-682(ra) # 11c4 <__thread_exit>
}
    1476:	0001                	nop
    1478:	70a2                	ld	ra,40(sp)
    147a:	7402                	ld	s0,32(sp)
    147c:	6145                	addi	sp,sp,48
    147e:	8082                	ret

0000000000001480 <switch_handler>:

void switch_handler(void *arg)
{
    1480:	7139                	addi	sp,sp,-64
    1482:	fc06                	sd	ra,56(sp)
    1484:	f822                	sd	s0,48(sp)
    1486:	0080                	addi	s0,sp,64
    1488:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    148c:	fc843783          	ld	a5,-56(s0)
    1490:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1494:	00001797          	auipc	a5,0x1
    1498:	dec78793          	addi	a5,a5,-532 # 2280 <current>
    149c:	639c                	ld	a5,0(a5)
    149e:	fef43023          	sd	a5,-32(s0)
    14a2:	fe043783          	ld	a5,-32(s0)
    14a6:	fd878793          	addi	a5,a5,-40
    14aa:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    14ae:	fe843783          	ld	a5,-24(s0)
    14b2:	0007871b          	sext.w	a4,a5
    14b6:	00001797          	auipc	a5,0x1
    14ba:	dd278793          	addi	a5,a5,-558 # 2288 <threading_system_time>
    14be:	439c                	lw	a5,0(a5)
    14c0:	2781                	sext.w	a5,a5
    14c2:	9fb9                	addw	a5,a5,a4
    14c4:	2781                	sext.w	a5,a5
    14c6:	0007871b          	sext.w	a4,a5
    14ca:	00001797          	auipc	a5,0x1
    14ce:	dbe78793          	addi	a5,a5,-578 # 2288 <threading_system_time>
    14d2:	c398                	sw	a4,0(a5)
     __release();
    14d4:	00000097          	auipc	ra,0x0
    14d8:	bd2080e7          	jalr	-1070(ra) # 10a6 <__release>
    current_thread->remaining_time -= elapsed_time;
    14dc:	fd843783          	ld	a5,-40(s0)
    14e0:	4bfc                	lw	a5,84(a5)
    14e2:	0007871b          	sext.w	a4,a5
    14e6:	fe843783          	ld	a5,-24(s0)
    14ea:	2781                	sext.w	a5,a5
    14ec:	40f707bb          	subw	a5,a4,a5
    14f0:	2781                	sext.w	a5,a5
    14f2:	0007871b          	sext.w	a4,a5
    14f6:	fd843783          	ld	a5,-40(s0)
    14fa:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    14fc:	fd843783          	ld	a5,-40(s0)
    1500:	57fc                	lw	a5,108(a5)
    1502:	e38d                	bnez	a5,1524 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    1504:	fd843783          	ld	a5,-40(s0)
    1508:	57bc                	lw	a5,104(a5)
    150a:	0007871b          	sext.w	a4,a5
    150e:	fe843783          	ld	a5,-24(s0)
    1512:	2781                	sext.w	a5,a5
    1514:	40f707bb          	subw	a5,a4,a5
    1518:	2781                	sext.w	a5,a5
    151a:	0007871b          	sext.w	a4,a5
    151e:	fd843783          	ld	a5,-40(s0)
    1522:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    1524:	fd843783          	ld	a5,-40(s0)
    1528:	43bc                	lw	a5,64(a5)
    152a:	c3ad                	beqz	a5,158c <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    152c:	fd843783          	ld	a5,-40(s0)
    1530:	4fb8                	lw	a4,88(a5)
    1532:	00001797          	auipc	a5,0x1
    1536:	d5678793          	addi	a5,a5,-682 # 2288 <threading_system_time>
    153a:	439c                	lw	a5,0(a5)
    153c:	02f74163          	blt	a4,a5,155e <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1540:	fd843783          	ld	a5,-40(s0)
    1544:	4fb8                	lw	a4,88(a5)
    1546:	00001797          	auipc	a5,0x1
    154a:	d4278793          	addi	a5,a5,-702 # 2288 <threading_system_time>
    154e:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    1550:	02f71e63          	bne	a4,a5,158c <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1554:	fd843783          	ld	a5,-40(s0)
    1558:	4bfc                	lw	a5,84(a5)
    155a:	02f05963          	blez	a5,158c <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    155e:	fd843783          	ld	a5,-40(s0)
    1562:	5fd8                	lw	a4,60(a5)
    1564:	00001797          	auipc	a5,0x1
    1568:	d2478793          	addi	a5,a5,-732 # 2288 <threading_system_time>
    156c:	439c                	lw	a5,0(a5)
    156e:	863e                	mv	a2,a5
    1570:	85ba                	mv	a1,a4
    1572:	00001517          	auipc	a0,0x1
    1576:	abe50513          	addi	a0,a0,-1346 # 2030 <schedule_edf_cbs+0x564>
    157a:	fffff097          	auipc	ra,0xfffff
    157e:	4d2080e7          	jalr	1234(ra) # a4c <printf>
            exit(0);
    1582:	4501                	li	a0,0
    1584:	fffff097          	auipc	ra,0xfffff
    1588:	f82080e7          	jalr	-126(ra) # 506 <exit>
        }

    if (current_thread->remaining_time <= 0) {
    158c:	fd843783          	ld	a5,-40(s0)
    1590:	4bfc                	lw	a5,84(a5)
    1592:	02f04063          	bgtz	a5,15b2 <switch_handler+0x132>
        if (current_thread->is_real_time)
    1596:	fd843783          	ld	a5,-40(s0)
    159a:	43bc                	lw	a5,64(a5)
    159c:	c791                	beqz	a5,15a8 <switch_handler+0x128>
            __rt_finish_current();
    159e:	00000097          	auipc	ra,0x0
    15a2:	e0a080e7          	jalr	-502(ra) # 13a8 <__rt_finish_current>
    15a6:	a881                	j	15f6 <switch_handler+0x176>
        else
            __finish_current();
    15a8:	00000097          	auipc	ra,0x0
    15ac:	d3c080e7          	jalr	-708(ra) # 12e4 <__finish_current>
    15b0:	a099                	j	15f6 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    15b2:	00001797          	auipc	a5,0x1
    15b6:	cce78793          	addi	a5,a5,-818 # 2280 <current>
    15ba:	639c                	ld	a5,0(a5)
    15bc:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    15c0:	00001797          	auipc	a5,0x1
    15c4:	cc078793          	addi	a5,a5,-832 # 2280 <current>
    15c8:	639c                	ld	a5,0(a5)
    15ca:	6798                	ld	a4,8(a5)
    15cc:	00001797          	auipc	a5,0x1
    15d0:	cb478793          	addi	a5,a5,-844 # 2280 <current>
    15d4:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    15d6:	fd043503          	ld	a0,-48(s0)
    15da:	00000097          	auipc	ra,0x0
    15de:	840080e7          	jalr	-1984(ra) # e1a <list_del>
        list_add_tail(to_remove, &run_queue);
    15e2:	00001597          	auipc	a1,0x1
    15e6:	c5658593          	addi	a1,a1,-938 # 2238 <run_queue>
    15ea:	fd043503          	ld	a0,-48(s0)
    15ee:	fffff097          	auipc	ra,0xfffff
    15f2:	7d0080e7          	jalr	2000(ra) # dbe <list_add_tail>
    }

    __release();
    15f6:	00000097          	auipc	ra,0x0
    15fa:	ab0080e7          	jalr	-1360(ra) # 10a6 <__release>
    __schedule();
    15fe:	00000097          	auipc	ra,0x0
    1602:	1f8080e7          	jalr	504(ra) # 17f6 <__schedule>
    __dispatch();
    1606:	00000097          	auipc	ra,0x0
    160a:	026080e7          	jalr	38(ra) # 162c <__dispatch>
    thrdresume(main_thrd_id);
    160e:	00001797          	auipc	a5,0x1
    1612:	c4a78793          	addi	a5,a5,-950 # 2258 <main_thrd_id>
    1616:	439c                	lw	a5,0(a5)
    1618:	853e                	mv	a0,a5
    161a:	fffff097          	auipc	ra,0xfffff
    161e:	f94080e7          	jalr	-108(ra) # 5ae <thrdresume>
}
    1622:	0001                	nop
    1624:	70e2                	ld	ra,56(sp)
    1626:	7442                	ld	s0,48(sp)
    1628:	6121                	addi	sp,sp,64
    162a:	8082                	ret

000000000000162c <__dispatch>:

void __dispatch()
{
    162c:	7179                	addi	sp,sp,-48
    162e:	f406                	sd	ra,40(sp)
    1630:	f022                	sd	s0,32(sp)
    1632:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1634:	00001797          	auipc	a5,0x1
    1638:	c4c78793          	addi	a5,a5,-948 # 2280 <current>
    163c:	6398                	ld	a4,0(a5)
    163e:	00001797          	auipc	a5,0x1
    1642:	bfa78793          	addi	a5,a5,-1030 # 2238 <run_queue>
    1646:	1af70363          	beq	a4,a5,17ec <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    164a:	00001797          	auipc	a5,0x1
    164e:	c3678793          	addi	a5,a5,-970 # 2280 <current>
    1652:	639c                	ld	a5,0(a5)
    1654:	fef43423          	sd	a5,-24(s0)
    1658:	fe843783          	ld	a5,-24(s0)
    165c:	fd878793          	addi	a5,a5,-40
    1660:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    1664:	fe043783          	ld	a5,-32(s0)
    1668:	5fcc                	lw	a1,60(a5)
    166a:	00001797          	auipc	a5,0x1
    166e:	c1e78793          	addi	a5,a5,-994 # 2288 <threading_system_time>
    1672:	4390                	lw	a2,0(a5)
    1674:	00001797          	auipc	a5,0x1
    1678:	c1c78793          	addi	a5,a5,-996 # 2290 <allocated_time>
    167c:	6394                	ld	a3,0(a5)
    167e:	fe043783          	ld	a5,-32(s0)
    1682:	4bfc                	lw	a5,84(a5)
    1684:	873e                	mv	a4,a5
    1686:	00001517          	auipc	a0,0x1
    168a:	9da50513          	addi	a0,a0,-1574 # 2060 <schedule_edf_cbs+0x594>
    168e:	fffff097          	auipc	ra,0xfffff
    1692:	3be080e7          	jalr	958(ra) # a4c <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    1696:	fe043783          	ld	a5,-32(s0)
    169a:	43bc                	lw	a5,64(a5)
    169c:	c3a1                	beqz	a5,16dc <__dispatch+0xb0>
    169e:	00001797          	auipc	a5,0x1
    16a2:	bf278793          	addi	a5,a5,-1038 # 2290 <allocated_time>
    16a6:	639c                	ld	a5,0(a5)
    16a8:	eb95                	bnez	a5,16dc <__dispatch+0xb0>
    16aa:	fe043783          	ld	a5,-32(s0)
    16ae:	57fc                	lw	a5,108(a5)
    16b0:	c795                	beqz	a5,16dc <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    16b2:	fe043783          	ld	a5,-32(s0)
    16b6:	5fd8                	lw	a4,60(a5)
    16b8:	fe043783          	ld	a5,-32(s0)
    16bc:	4fbc                	lw	a5,88(a5)
    16be:	863e                	mv	a2,a5
    16c0:	85ba                	mv	a1,a4
    16c2:	00001517          	auipc	a0,0x1
    16c6:	9ee50513          	addi	a0,a0,-1554 # 20b0 <schedule_edf_cbs+0x5e4>
    16ca:	fffff097          	auipc	ra,0xfffff
    16ce:	382080e7          	jalr	898(ra) # a4c <printf>
        exit(0);
    16d2:	4501                	li	a0,0
    16d4:	fffff097          	auipc	ra,0xfffff
    16d8:	e32080e7          	jalr	-462(ra) # 506 <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    16dc:	fe043783          	ld	a5,-32(s0)
    16e0:	5fd8                	lw	a4,60(a5)
    16e2:	00001797          	auipc	a5,0x1
    16e6:	ba678793          	addi	a5,a5,-1114 # 2288 <threading_system_time>
    16ea:	4390                	lw	a2,0(a5)
    16ec:	00001797          	auipc	a5,0x1
    16f0:	ba478793          	addi	a5,a5,-1116 # 2290 <allocated_time>
    16f4:	639c                	ld	a5,0(a5)
    16f6:	86be                	mv	a3,a5
    16f8:	85ba                	mv	a1,a4
    16fa:	00001517          	auipc	a0,0x1
    16fe:	9e650513          	addi	a0,a0,-1562 # 20e0 <schedule_edf_cbs+0x614>
    1702:	fffff097          	auipc	ra,0xfffff
    1706:	34a080e7          	jalr	842(ra) # a4c <printf>

    if (current_thread->buf_set) {
    170a:	fe043783          	ld	a5,-32(s0)
    170e:	539c                	lw	a5,32(a5)
    1710:	c7a1                	beqz	a5,1758 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1712:	00001797          	auipc	a5,0x1
    1716:	b7e78793          	addi	a5,a5,-1154 # 2290 <allocated_time>
    171a:	639c                	ld	a5,0(a5)
    171c:	0007871b          	sext.w	a4,a5
    1720:	fe043783          	ld	a5,-32(s0)
    1724:	03878593          	addi	a1,a5,56
    1728:	00001797          	auipc	a5,0x1
    172c:	b6878793          	addi	a5,a5,-1176 # 2290 <allocated_time>
    1730:	639c                	ld	a5,0(a5)
    1732:	86be                	mv	a3,a5
    1734:	00000617          	auipc	a2,0x0
    1738:	d4c60613          	addi	a2,a2,-692 # 1480 <switch_handler>
    173c:	853a                	mv	a0,a4
    173e:	fffff097          	auipc	ra,0xfffff
    1742:	e68080e7          	jalr	-408(ra) # 5a6 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    1746:	fe043783          	ld	a5,-32(s0)
    174a:	5f9c                	lw	a5,56(a5)
    174c:	853e                	mv	a0,a5
    174e:	fffff097          	auipc	ra,0xfffff
    1752:	e60080e7          	jalr	-416(ra) # 5ae <thrdresume>
    1756:	a071                	j	17e2 <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    1758:	fe043783          	ld	a5,-32(s0)
    175c:	4705                	li	a4,1
    175e:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    1760:	fe043783          	ld	a5,-32(s0)
    1764:	6f9c                	ld	a5,24(a5)
    1766:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    176a:	fe043783          	ld	a5,-32(s0)
    176e:	577d                	li	a4,-1
    1770:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1772:	00001797          	auipc	a5,0x1
    1776:	b1e78793          	addi	a5,a5,-1250 # 2290 <allocated_time>
    177a:	639c                	ld	a5,0(a5)
    177c:	0007871b          	sext.w	a4,a5
    1780:	fe043783          	ld	a5,-32(s0)
    1784:	03878593          	addi	a1,a5,56
    1788:	00001797          	auipc	a5,0x1
    178c:	b0878793          	addi	a5,a5,-1272 # 2290 <allocated_time>
    1790:	639c                	ld	a5,0(a5)
    1792:	86be                	mv	a3,a5
    1794:	00000617          	auipc	a2,0x0
    1798:	cec60613          	addi	a2,a2,-788 # 1480 <switch_handler>
    179c:	853a                	mv	a0,a4
    179e:	fffff097          	auipc	ra,0xfffff
    17a2:	e08080e7          	jalr	-504(ra) # 5a6 <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    17a6:	fe043783          	ld	a5,-32(s0)
    17aa:	5f9c                	lw	a5,56(a5)
    17ac:	0207d063          	bgez	a5,17cc <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    17b0:	00001597          	auipc	a1,0x1
    17b4:	96058593          	addi	a1,a1,-1696 # 2110 <schedule_edf_cbs+0x644>
    17b8:	4509                	li	a0,2
    17ba:	fffff097          	auipc	ra,0xfffff
    17be:	23a080e7          	jalr	570(ra) # 9f4 <fprintf>
            exit(1);
    17c2:	4505                	li	a0,1
    17c4:	fffff097          	auipc	ra,0xfffff
    17c8:	d42080e7          	jalr	-702(ra) # 506 <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    17cc:	fd843783          	ld	a5,-40(s0)
    17d0:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    17d2:	fe043783          	ld	a5,-32(s0)
    17d6:	6398                	ld	a4,0(a5)
    17d8:	fe043783          	ld	a5,-32(s0)
    17dc:	679c                	ld	a5,8(a5)
    17de:	853e                	mv	a0,a5
    17e0:	9702                	jalr	a4
    }
    thread_exit();
    17e2:	00000097          	auipc	ra,0x0
    17e6:	a5a080e7          	jalr	-1446(ra) # 123c <thread_exit>
    17ea:	a011                	j	17ee <__dispatch+0x1c2>
        return;
    17ec:	0001                	nop
}
    17ee:	70a2                	ld	ra,40(sp)
    17f0:	7402                	ld	s0,32(sp)
    17f2:	6145                	addi	sp,sp,48
    17f4:	8082                	ret

00000000000017f6 <__schedule>:

void __schedule()
{
    17f6:	711d                	addi	sp,sp,-96
    17f8:	ec86                	sd	ra,88(sp)
    17fa:	e8a2                	sd	s0,80(sp)
    17fc:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    17fe:	00001797          	auipc	a5,0x1
    1802:	a8a78793          	addi	a5,a5,-1398 # 2288 <threading_system_time>
    1806:	439c                	lw	a5,0(a5)
    1808:	fcf42c23          	sw	a5,-40(s0)
    180c:	4789                	li	a5,2
    180e:	fcf42e23          	sw	a5,-36(s0)
    1812:	00001797          	auipc	a5,0x1
    1816:	a2678793          	addi	a5,a5,-1498 # 2238 <run_queue>
    181a:	fef43023          	sd	a5,-32(s0)
    181e:	00001797          	auipc	a5,0x1
    1822:	a2a78793          	addi	a5,a5,-1494 # 2248 <release_queue>
    1826:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    182a:	fd843783          	ld	a5,-40(s0)
    182e:	faf43023          	sd	a5,-96(s0)
    1832:	fe043783          	ld	a5,-32(s0)
    1836:	faf43423          	sd	a5,-88(s0)
    183a:	fe843783          	ld	a5,-24(s0)
    183e:	faf43823          	sd	a5,-80(s0)
    1842:	fa040793          	addi	a5,s0,-96
    1846:	853e                	mv	a0,a5
    1848:	00000097          	auipc	ra,0x0
    184c:	284080e7          	jalr	644(ra) # 1acc <schedule_edf_cbs>
    1850:	872a                	mv	a4,a0
    1852:	87ae                	mv	a5,a1
    1854:	fce43423          	sd	a4,-56(s0)
    1858:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    185c:	fc843703          	ld	a4,-56(s0)
    1860:	00001797          	auipc	a5,0x1
    1864:	a2078793          	addi	a5,a5,-1504 # 2280 <current>
    1868:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    186a:	fd042783          	lw	a5,-48(s0)
    186e:	873e                	mv	a4,a5
    1870:	00001797          	auipc	a5,0x1
    1874:	a2078793          	addi	a5,a5,-1504 # 2290 <allocated_time>
    1878:	e398                	sd	a4,0(a5)
}
    187a:	0001                	nop
    187c:	60e6                	ld	ra,88(sp)
    187e:	6446                	ld	s0,80(sp)
    1880:	6125                	addi	sp,sp,96
    1882:	8082                	ret

0000000000001884 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    1884:	1101                	addi	sp,sp,-32
    1886:	ec06                	sd	ra,24(sp)
    1888:	e822                	sd	s0,16(sp)
    188a:	1000                	addi	s0,sp,32
    188c:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1890:	00001797          	auipc	a5,0x1
    1894:	9fc78793          	addi	a5,a5,-1540 # 228c <sleeping>
    1898:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    189c:	fe843783          	ld	a5,-24(s0)
    18a0:	0007871b          	sext.w	a4,a5
    18a4:	00001797          	auipc	a5,0x1
    18a8:	9e478793          	addi	a5,a5,-1564 # 2288 <threading_system_time>
    18ac:	439c                	lw	a5,0(a5)
    18ae:	2781                	sext.w	a5,a5
    18b0:	9fb9                	addw	a5,a5,a4
    18b2:	2781                	sext.w	a5,a5
    18b4:	0007871b          	sext.w	a4,a5
    18b8:	00001797          	auipc	a5,0x1
    18bc:	9d078793          	addi	a5,a5,-1584 # 2288 <threading_system_time>
    18c0:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    18c2:	00001797          	auipc	a5,0x1
    18c6:	99678793          	addi	a5,a5,-1642 # 2258 <main_thrd_id>
    18ca:	439c                	lw	a5,0(a5)
    18cc:	853e                	mv	a0,a5
    18ce:	fffff097          	auipc	ra,0xfffff
    18d2:	ce0080e7          	jalr	-800(ra) # 5ae <thrdresume>
}
    18d6:	0001                	nop
    18d8:	60e2                	ld	ra,24(sp)
    18da:	6442                	ld	s0,16(sp)
    18dc:	6105                	addi	sp,sp,32
    18de:	8082                	ret

00000000000018e0 <thread_start_threading>:

void thread_start_threading()
{
    18e0:	1141                	addi	sp,sp,-16
    18e2:	e406                	sd	ra,8(sp)
    18e4:	e022                	sd	s0,0(sp)
    18e6:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    18e8:	00001797          	auipc	a5,0x1
    18ec:	9a078793          	addi	a5,a5,-1632 # 2288 <threading_system_time>
    18f0:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    18f4:	00001797          	auipc	a5,0x1
    18f8:	98c78793          	addi	a5,a5,-1652 # 2280 <current>
    18fc:	00001717          	auipc	a4,0x1
    1900:	93c70713          	addi	a4,a4,-1732 # 2238 <run_queue>
    1904:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1906:	4681                	li	a3,0
    1908:	00000617          	auipc	a2,0x0
    190c:	f7c60613          	addi	a2,a2,-132 # 1884 <back_to_main_handler>
    1910:	00001597          	auipc	a1,0x1
    1914:	94858593          	addi	a1,a1,-1720 # 2258 <main_thrd_id>
    1918:	3e800513          	li	a0,1000
    191c:	fffff097          	auipc	ra,0xfffff
    1920:	c8a080e7          	jalr	-886(ra) # 5a6 <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    1924:	00001797          	auipc	a5,0x1
    1928:	93478793          	addi	a5,a5,-1740 # 2258 <main_thrd_id>
    192c:	439c                	lw	a5,0(a5)
    192e:	4581                	li	a1,0
    1930:	853e                	mv	a0,a5
    1932:	fffff097          	auipc	ra,0xfffff
    1936:	c84080e7          	jalr	-892(ra) # 5b6 <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    193a:	a0c9                	j	19fc <thread_start_threading+0x11c>
        __release();
    193c:	fffff097          	auipc	ra,0xfffff
    1940:	76a080e7          	jalr	1898(ra) # 10a6 <__release>
        __schedule();
    1944:	00000097          	auipc	ra,0x0
    1948:	eb2080e7          	jalr	-334(ra) # 17f6 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    194c:	00001797          	auipc	a5,0x1
    1950:	90c78793          	addi	a5,a5,-1780 # 2258 <main_thrd_id>
    1954:	439c                	lw	a5,0(a5)
    1956:	4581                	li	a1,0
    1958:	853e                	mv	a0,a5
    195a:	fffff097          	auipc	ra,0xfffff
    195e:	c5c080e7          	jalr	-932(ra) # 5b6 <cancelthrdstop>
        __dispatch();
    1962:	00000097          	auipc	ra,0x0
    1966:	cca080e7          	jalr	-822(ra) # 162c <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    196a:	00001517          	auipc	a0,0x1
    196e:	8ce50513          	addi	a0,a0,-1842 # 2238 <run_queue>
    1972:	fffff097          	auipc	ra,0xfffff
    1976:	4f2080e7          	jalr	1266(ra) # e64 <list_empty>
    197a:	87aa                	mv	a5,a0
    197c:	cb99                	beqz	a5,1992 <thread_start_threading+0xb2>
    197e:	00001517          	auipc	a0,0x1
    1982:	8ca50513          	addi	a0,a0,-1846 # 2248 <release_queue>
    1986:	fffff097          	auipc	ra,0xfffff
    198a:	4de080e7          	jalr	1246(ra) # e64 <list_empty>
    198e:	87aa                	mv	a5,a0
    1990:	ebd9                	bnez	a5,1a26 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1992:	00001797          	auipc	a5,0x1
    1996:	8fe78793          	addi	a5,a5,-1794 # 2290 <allocated_time>
    199a:	639c                	ld	a5,0(a5)
    199c:	85be                	mv	a1,a5
    199e:	00000517          	auipc	a0,0x0
    19a2:	7aa50513          	addi	a0,a0,1962 # 2148 <schedule_edf_cbs+0x67c>
    19a6:	fffff097          	auipc	ra,0xfffff
    19aa:	0a6080e7          	jalr	166(ra) # a4c <printf>
        sleeping = 1;
    19ae:	00001797          	auipc	a5,0x1
    19b2:	8de78793          	addi	a5,a5,-1826 # 228c <sleeping>
    19b6:	4705                	li	a4,1
    19b8:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    19ba:	00001797          	auipc	a5,0x1
    19be:	8d678793          	addi	a5,a5,-1834 # 2290 <allocated_time>
    19c2:	639c                	ld	a5,0(a5)
    19c4:	0007871b          	sext.w	a4,a5
    19c8:	00001797          	auipc	a5,0x1
    19cc:	8c878793          	addi	a5,a5,-1848 # 2290 <allocated_time>
    19d0:	639c                	ld	a5,0(a5)
    19d2:	86be                	mv	a3,a5
    19d4:	00000617          	auipc	a2,0x0
    19d8:	eb060613          	addi	a2,a2,-336 # 1884 <back_to_main_handler>
    19dc:	00001597          	auipc	a1,0x1
    19e0:	87c58593          	addi	a1,a1,-1924 # 2258 <main_thrd_id>
    19e4:	853a                	mv	a0,a4
    19e6:	fffff097          	auipc	ra,0xfffff
    19ea:	bc0080e7          	jalr	-1088(ra) # 5a6 <thrdstop>
        while (sleeping) {
    19ee:	0001                	nop
    19f0:	00001797          	auipc	a5,0x1
    19f4:	89c78793          	addi	a5,a5,-1892 # 228c <sleeping>
    19f8:	439c                	lw	a5,0(a5)
    19fa:	fbfd                	bnez	a5,19f0 <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    19fc:	00001517          	auipc	a0,0x1
    1a00:	83c50513          	addi	a0,a0,-1988 # 2238 <run_queue>
    1a04:	fffff097          	auipc	ra,0xfffff
    1a08:	460080e7          	jalr	1120(ra) # e64 <list_empty>
    1a0c:	87aa                	mv	a5,a0
    1a0e:	d79d                	beqz	a5,193c <thread_start_threading+0x5c>
    1a10:	00001517          	auipc	a0,0x1
    1a14:	83850513          	addi	a0,a0,-1992 # 2248 <release_queue>
    1a18:	fffff097          	auipc	ra,0xfffff
    1a1c:	44c080e7          	jalr	1100(ra) # e64 <list_empty>
    1a20:	87aa                	mv	a5,a0
    1a22:	df89                	beqz	a5,193c <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1a24:	a011                	j	1a28 <thread_start_threading+0x148>
            break;
    1a26:	0001                	nop
}
    1a28:	0001                	nop
    1a2a:	60a2                	ld	ra,8(sp)
    1a2c:	6402                	ld	s0,0(sp)
    1a2e:	0141                	addi	sp,sp,16
    1a30:	8082                	ret

0000000000001a32 <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1a32:	7139                	addi	sp,sp,-64
    1a34:	fc22                	sd	s0,56(sp)
    1a36:	0080                	addi	s0,sp,64
    1a38:	fca43423          	sd	a0,-56(s0)
    1a3c:	87ae                	mv	a5,a1
    1a3e:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1a42:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1a46:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1a4a:	fc843783          	ld	a5,-56(s0)
    1a4e:	639c                	ld	a5,0(a5)
    1a50:	fcf43c23          	sd	a5,-40(s0)
    1a54:	fd843783          	ld	a5,-40(s0)
    1a58:	fd878793          	addi	a5,a5,-40
    1a5c:	fef43423          	sd	a5,-24(s0)
    1a60:	a881                	j	1ab0 <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1a62:	fe843783          	ld	a5,-24(s0)
    1a66:	4fb8                	lw	a4,88(a5)
    1a68:	fc442783          	lw	a5,-60(s0)
    1a6c:	2781                	sext.w	a5,a5
    1a6e:	02e7c663          	blt	a5,a4,1a9a <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1a72:	fe043783          	ld	a5,-32(s0)
    1a76:	e791                	bnez	a5,1a82 <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1a78:	fe843783          	ld	a5,-24(s0)
    1a7c:	fef43023          	sd	a5,-32(s0)
    1a80:	a829                	j	1a9a <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1a82:	fe843783          	ld	a5,-24(s0)
    1a86:	5fd8                	lw	a4,60(a5)
    1a88:	fe043783          	ld	a5,-32(s0)
    1a8c:	5fdc                	lw	a5,60(a5)
    1a8e:	00f75663          	bge	a4,a5,1a9a <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1a92:	fe843783          	ld	a5,-24(s0)
    1a96:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1a9a:	fe843783          	ld	a5,-24(s0)
    1a9e:	779c                	ld	a5,40(a5)
    1aa0:	fcf43823          	sd	a5,-48(s0)
    1aa4:	fd043783          	ld	a5,-48(s0)
    1aa8:	fd878793          	addi	a5,a5,-40
    1aac:	fef43423          	sd	a5,-24(s0)
    1ab0:	fe843783          	ld	a5,-24(s0)
    1ab4:	02878793          	addi	a5,a5,40
    1ab8:	fc843703          	ld	a4,-56(s0)
    1abc:	faf713e3          	bne	a4,a5,1a62 <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1ac0:	fe043783          	ld	a5,-32(s0)
}
    1ac4:	853e                	mv	a0,a5
    1ac6:	7462                	ld	s0,56(sp)
    1ac8:	6121                	addi	sp,sp,64
    1aca:	8082                	ret

0000000000001acc <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1acc:	7131                	addi	sp,sp,-192
    1ace:	fd06                	sd	ra,184(sp)
    1ad0:	f922                	sd	s0,176(sp)
    1ad2:	f526                	sd	s1,168(sp)
    1ad4:	f14a                	sd	s2,160(sp)
    1ad6:	ed4e                	sd	s3,152(sp)
    1ad8:	0180                	addi	s0,sp,192
    1ada:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1adc:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1ae0:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1ae4:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1ae8:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1aec:	649c                	ld	a5,8(s1)
    1aee:	4098                	lw	a4,0(s1)
    1af0:	85ba                	mv	a1,a4
    1af2:	853e                	mv	a0,a5
    1af4:	00000097          	auipc	ra,0x0
    1af8:	f3e080e7          	jalr	-194(ra) # 1a32 <__check_deadline_miss>
    1afc:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1b00:	f9843783          	ld	a5,-104(s0)
    1b04:	c7b5                	beqz	a5,1b70 <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1b06:	f9843783          	ld	a5,-104(s0)
    1b0a:	5fdc                	lw	a5,60(a5)
    1b0c:	85be                	mv	a1,a5
    1b0e:	00000517          	auipc	a0,0x0
    1b12:	66250513          	addi	a0,a0,1634 # 2170 <schedule_edf_cbs+0x6a4>
    1b16:	fffff097          	auipc	ra,0xfffff
    1b1a:	f36080e7          	jalr	-202(ra) # a4c <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1b1e:	f9843783          	ld	a5,-104(s0)
    1b22:	57fc                	lw	a5,108(a5)
    1b24:	c395                	beqz	a5,1b48 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1b26:	f9843783          	ld	a5,-104(s0)
    1b2a:	02878793          	addi	a5,a5,40
    1b2e:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1b32:	f4042423          	sw	zero,-184(s0)
            return r;
    1b36:	f4043783          	ld	a5,-192(s0)
    1b3a:	f4f43823          	sd	a5,-176(s0)
    1b3e:	f4843783          	ld	a5,-184(s0)
    1b42:	f4f43c23          	sd	a5,-168(s0)
    1b46:	a13d                	j	1f74 <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1b48:	4098                	lw	a4,0(s1)
    1b4a:	f9843783          	ld	a5,-104(s0)
    1b4e:	47fc                	lw	a5,76(a5)
    1b50:	9fb9                	addw	a5,a5,a4
    1b52:	0007871b          	sext.w	a4,a5
    1b56:	f9843783          	ld	a5,-104(s0)
    1b5a:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1b5c:	f9843783          	ld	a5,-104(s0)
    1b60:	53f8                	lw	a4,100(a5)
    1b62:	f9843783          	ld	a5,-104(s0)
    1b66:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1b68:	f9843783          	ld	a5,-104(s0)
    1b6c:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1b70:	fa043783          	ld	a5,-96(s0)
    1b74:	e7dd                	bnez	a5,1c22 <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1b76:	649c                	ld	a5,8(s1)
    1b78:	639c                	ld	a5,0(a5)
    1b7a:	f8f43823          	sd	a5,-112(s0)
    1b7e:	f9043783          	ld	a5,-112(s0)
    1b82:	fd878793          	addi	a5,a5,-40
    1b86:	faf43c23          	sd	a5,-72(s0)
    1b8a:	a069                	j	1c14 <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1b8c:	fb843783          	ld	a5,-72(s0)
    1b90:	5fd8                	lw	a4,60(a5)
    1b92:	fb843783          	ld	a5,-72(s0)
    1b96:	5bbc                	lw	a5,112(a5)
    1b98:	863e                	mv	a2,a5
    1b9a:	85ba                	mv	a1,a4
    1b9c:	00000517          	auipc	a0,0x0
    1ba0:	60c50513          	addi	a0,a0,1548 # 21a8 <schedule_edf_cbs+0x6dc>
    1ba4:	fffff097          	auipc	ra,0xfffff
    1ba8:	ea8080e7          	jalr	-344(ra) # a4c <printf>
            if (next == NULL)
    1bac:	fa043783          	ld	a5,-96(s0)
    1bb0:	e791                	bnez	a5,1bbc <schedule_edf_cbs+0xf0>
                next = th;
    1bb2:	fb843783          	ld	a5,-72(s0)
    1bb6:	faf43023          	sd	a5,-96(s0)
    1bba:	a091                	j	1bfe <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1bbc:	fb843783          	ld	a5,-72(s0)
    1bc0:	4fb8                	lw	a4,88(a5)
    1bc2:	fa043783          	ld	a5,-96(s0)
    1bc6:	4fbc                	lw	a5,88(a5)
    1bc8:	00f75763          	bge	a4,a5,1bd6 <schedule_edf_cbs+0x10a>
                next = th;
    1bcc:	fb843783          	ld	a5,-72(s0)
    1bd0:	faf43023          	sd	a5,-96(s0)
    1bd4:	a02d                	j	1bfe <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1bd6:	fb843783          	ld	a5,-72(s0)
    1bda:	4fb8                	lw	a4,88(a5)
    1bdc:	fa043783          	ld	a5,-96(s0)
    1be0:	4fbc                	lw	a5,88(a5)
    1be2:	00f71e63          	bne	a4,a5,1bfe <schedule_edf_cbs+0x132>
    1be6:	fb843783          	ld	a5,-72(s0)
    1bea:	5fd8                	lw	a4,60(a5)
    1bec:	fa043783          	ld	a5,-96(s0)
    1bf0:	5fdc                	lw	a5,60(a5)
    1bf2:	00f75663          	bge	a4,a5,1bfe <schedule_edf_cbs+0x132>
                next = th;
    1bf6:	fb843783          	ld	a5,-72(s0)
    1bfa:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1bfe:	fb843783          	ld	a5,-72(s0)
    1c02:	779c                	ld	a5,40(a5)
    1c04:	f8f43423          	sd	a5,-120(s0)
    1c08:	f8843783          	ld	a5,-120(s0)
    1c0c:	fd878793          	addi	a5,a5,-40
    1c10:	faf43c23          	sd	a5,-72(s0)
    1c14:	fb843783          	ld	a5,-72(s0)
    1c18:	02878713          	addi	a4,a5,40
    1c1c:	649c                	ld	a5,8(s1)
    1c1e:	f6f717e3          	bne	a4,a5,1b8c <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1c22:	fa043783          	ld	a5,-96(s0)
    1c26:	5fdc                	lw	a5,60(a5)
    1c28:	85be                	mv	a1,a5
    1c2a:	00000517          	auipc	a0,0x0
    1c2e:	5b650513          	addi	a0,a0,1462 # 21e0 <schedule_edf_cbs+0x714>
    1c32:	fffff097          	auipc	ra,0xfffff
    1c36:	e1a080e7          	jalr	-486(ra) # a4c <printf>

    if(next && next->cbs.is_throttled){
    1c3a:	fa043783          	ld	a5,-96(s0)
    1c3e:	cb95                	beqz	a5,1c72 <schedule_edf_cbs+0x1a6>
    1c40:	fa043783          	ld	a5,-96(s0)
    1c44:	5bbc                	lw	a5,112(a5)
    1c46:	c795                	beqz	a5,1c72 <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1c48:	fa043783          	ld	a5,-96(s0)
    1c4c:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1c50:	fa043783          	ld	a5,-96(s0)
    1c54:	02878793          	addi	a5,a5,40
    1c58:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1c5c:	f4042423          	sw	zero,-184(s0)
        return r;
    1c60:	f4043783          	ld	a5,-192(s0)
    1c64:	f4f43823          	sd	a5,-176(s0)
    1c68:	f4843783          	ld	a5,-184(s0)
    1c6c:	f4f43c23          	sd	a5,-168(s0)
    1c70:	a611                	j	1f74 <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1c72:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1c76:	689c                	ld	a5,16(s1)
    1c78:	639c                	ld	a5,0(a5)
    1c7a:	f8f43023          	sd	a5,-128(s0)
    1c7e:	f8043783          	ld	a5,-128(s0)
    1c82:	17e1                	addi	a5,a5,-8
    1c84:	fcf43023          	sd	a5,-64(s0)
    1c88:	a0b5                	j	1cf4 <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1c8a:	fa843783          	ld	a5,-88(s0)
    1c8e:	e791                	bnez	a5,1c9a <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1c90:	fc043783          	ld	a5,-64(s0)
    1c94:	faf43423          	sd	a5,-88(s0)
    1c98:	a0a1                	j	1ce0 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1c9a:	fa843783          	ld	a5,-88(s0)
    1c9e:	4f98                	lw	a4,24(a5)
    1ca0:	fc043783          	ld	a5,-64(s0)
    1ca4:	4f9c                	lw	a5,24(a5)
    1ca6:	00e7d763          	bge	a5,a4,1cb4 <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1caa:	fc043783          	ld	a5,-64(s0)
    1cae:	faf43423          	sd	a5,-88(s0)
    1cb2:	a03d                	j	1ce0 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1cb4:	fa843783          	ld	a5,-88(s0)
    1cb8:	4f98                	lw	a4,24(a5)
    1cba:	fc043783          	ld	a5,-64(s0)
    1cbe:	4f9c                	lw	a5,24(a5)
    1cc0:	02f71063          	bne	a4,a5,1ce0 <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1cc4:	fa843783          	ld	a5,-88(s0)
    1cc8:	639c                	ld	a5,0(a5)
    1cca:	4fb8                	lw	a4,88(a5)
    1ccc:	fc043783          	ld	a5,-64(s0)
    1cd0:	639c                	ld	a5,0(a5)
    1cd2:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1cd4:	00e7d663          	bge	a5,a4,1ce0 <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1cd8:	fc043783          	ld	a5,-64(s0)
    1cdc:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1ce0:	fc043783          	ld	a5,-64(s0)
    1ce4:	679c                	ld	a5,8(a5)
    1ce6:	f6f43023          	sd	a5,-160(s0)
    1cea:	f6043783          	ld	a5,-160(s0)
    1cee:	17e1                	addi	a5,a5,-8
    1cf0:	fcf43023          	sd	a5,-64(s0)
    1cf4:	fc043783          	ld	a5,-64(s0)
    1cf8:	00878713          	addi	a4,a5,8
    1cfc:	689c                	ld	a5,16(s1)
    1cfe:	f8f716e3          	bne	a4,a5,1c8a <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1d02:	689c                	ld	a5,16(s1)
    1d04:	639c                	ld	a5,0(a5)
    1d06:	f6f43c23          	sd	a5,-136(s0)
    1d0a:	f7843783          	ld	a5,-136(s0)
    1d0e:	17e1                	addi	a5,a5,-8
    1d10:	fcf43023          	sd	a5,-64(s0)
    1d14:	a069                	j	1d9e <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1d16:	fb043783          	ld	a5,-80(s0)
    1d1a:	eb99                	bnez	a5,1d30 <schedule_edf_cbs+0x264>
    1d1c:	fc043783          	ld	a5,-64(s0)
    1d20:	639c                	ld	a5,0(a5)
    1d22:	57fc                	lw	a5,108(a5)
    1d24:	c791                	beqz	a5,1d30 <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1d26:	fc043783          	ld	a5,-64(s0)
    1d2a:	faf43823          	sd	a5,-80(s0)
    1d2e:	a8b1                	j	1d8a <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1d30:	fc043783          	ld	a5,-64(s0)
    1d34:	639c                	ld	a5,0(a5)
    1d36:	57fc                	lw	a5,108(a5)
    1d38:	cf91                	beqz	a5,1d54 <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1d3a:	fb043783          	ld	a5,-80(s0)
    1d3e:	4f98                	lw	a4,24(a5)
    1d40:	fc043783          	ld	a5,-64(s0)
    1d44:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1d46:	00e7d763          	bge	a5,a4,1d54 <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1d4a:	fc043783          	ld	a5,-64(s0)
    1d4e:	faf43823          	sd	a5,-80(s0)
    1d52:	a825                	j	1d8a <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1d54:	fc043783          	ld	a5,-64(s0)
    1d58:	639c                	ld	a5,0(a5)
    1d5a:	57fc                	lw	a5,108(a5)
    1d5c:	c79d                	beqz	a5,1d8a <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1d5e:	fb043783          	ld	a5,-80(s0)
    1d62:	4f98                	lw	a4,24(a5)
    1d64:	fc043783          	ld	a5,-64(s0)
    1d68:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1d6a:	02f71063          	bne	a4,a5,1d8a <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1d6e:	fb043783          	ld	a5,-80(s0)
    1d72:	639c                	ld	a5,0(a5)
    1d74:	4fb8                	lw	a4,88(a5)
    1d76:	fc043783          	ld	a5,-64(s0)
    1d7a:	639c                	ld	a5,0(a5)
    1d7c:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1d7e:	00e7d663          	bge	a5,a4,1d8a <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1d82:	fc043783          	ld	a5,-64(s0)
    1d86:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1d8a:	fc043783          	ld	a5,-64(s0)
    1d8e:	679c                	ld	a5,8(a5)
    1d90:	f6f43423          	sd	a5,-152(s0)
    1d94:	f6843783          	ld	a5,-152(s0)
    1d98:	17e1                	addi	a5,a5,-8
    1d9a:	fcf43023          	sd	a5,-64(s0)
    1d9e:	fc043783          	ld	a5,-64(s0)
    1da2:	00878713          	addi	a4,a5,8
    1da6:	689c                	ld	a5,16(s1)
    1da8:	f6f717e3          	bne	a4,a5,1d16 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1dac:	fa043783          	ld	a5,-96(s0)
    1db0:	cb89                	beqz	a5,1dc2 <schedule_edf_cbs+0x2f6>
    1db2:	fa043783          	ld	a5,-96(s0)
    1db6:	57fc                	lw	a5,108(a5)
    1db8:	c789                	beqz	a5,1dc2 <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1dba:	fb043783          	ld	a5,-80(s0)
    1dbe:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1dc2:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1dc6:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1dca:	fa843783          	ld	a5,-88(s0)
    1dce:	c3c5                	beqz	a5,1e6e <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1dd0:	fa843783          	ld	a5,-88(s0)
    1dd4:	639c                	ld	a5,0(a5)
    1dd6:	5fdc                	lw	a5,60(a5)
    1dd8:	85be                	mv	a1,a5
    1dda:	00000517          	auipc	a0,0x0
    1dde:	42650513          	addi	a0,a0,1062 # 2200 <schedule_edf_cbs+0x734>
    1de2:	fffff097          	auipc	ra,0xfffff
    1de6:	c6a080e7          	jalr	-918(ra) # a4c <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    1dea:	fa843783          	ld	a5,-88(s0)
    1dee:	4f98                	lw	a4,24(a5)
    1df0:	409c                	lw	a5,0(s1)
    1df2:	40f707bb          	subw	a5,a4,a5
    1df6:	fcf42623          	sw	a5,-52(s0)
        if (next){
    1dfa:	fa043783          	ld	a5,-96(s0)
    1dfe:	cba5                	beqz	a5,1e6e <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    1e00:	fa043783          	ld	a5,-96(s0)
    1e04:	4bf8                	lw	a4,84(a5)
    1e06:	fcc42783          	lw	a5,-52(s0)
    1e0a:	2781                	sext.w	a5,a5
    1e0c:	06e7d163          	bge	a5,a4,1e6e <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    1e10:	fa043783          	ld	a5,-96(s0)
    1e14:	57fc                	lw	a5,108(a5)
    1e16:	eb91                	bnez	a5,1e2a <schedule_edf_cbs+0x35e>
    1e18:	fa843783          	ld	a5,-88(s0)
    1e1c:	639c                	ld	a5,0(a5)
    1e1e:	57fc                	lw	a5,108(a5)
    1e20:	c789                	beqz	a5,1e2a <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    1e22:	4785                	li	a5,1
    1e24:	fcf42423          	sw	a5,-56(s0)
    1e28:	a099                	j	1e6e <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    1e2a:	fa043783          	ld	a5,-96(s0)
    1e2e:	4fb8                	lw	a4,88(a5)
    1e30:	fa843783          	ld	a5,-88(s0)
    1e34:	639c                	ld	a5,0(a5)
    1e36:	4fbc                	lw	a5,88(a5)
    1e38:	00e7d663          	bge	a5,a4,1e44 <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    1e3c:	4785                	li	a5,1
    1e3e:	fcf42423          	sw	a5,-56(s0)
    1e42:	a035                	j	1e6e <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1e44:	fa043783          	ld	a5,-96(s0)
    1e48:	4fb8                	lw	a4,88(a5)
    1e4a:	fa843783          	ld	a5,-88(s0)
    1e4e:	639c                	ld	a5,0(a5)
    1e50:	4fbc                	lw	a5,88(a5)
    1e52:	00f71e63          	bne	a4,a5,1e6e <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    1e56:	fa043783          	ld	a5,-96(s0)
    1e5a:	5fd8                	lw	a4,60(a5)
    1e5c:	fa843783          	ld	a5,-88(s0)
    1e60:	639c                	ld	a5,0(a5)
    1e62:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1e64:	00e7d563          	bge	a5,a4,1e6e <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    1e68:	4785                	li	a5,1
    1e6a:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    1e6e:	fa043783          	ld	a5,-96(s0)
    1e72:	cbd1                	beqz	a5,1f06 <schedule_edf_cbs+0x43a>
    1e74:	fa043783          	ld	a5,-96(s0)
    1e78:	57fc                	lw	a5,108(a5)
    1e7a:	e7d1                	bnez	a5,1f06 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    1e7c:	fa043783          	ld	a5,-96(s0)
    1e80:	4fb8                	lw	a4,88(a5)
    1e82:	409c                	lw	a5,0(s1)
    1e84:	40f707bb          	subw	a5,a4,a5
    1e88:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    1e8c:	fa043783          	ld	a5,-96(s0)
    1e90:	47f8                	lw	a4,76(a5)
    1e92:	fa043783          	ld	a5,-96(s0)
    1e96:	57bc                	lw	a5,104(a5)
    1e98:	02f707bb          	mulw	a5,a4,a5
    1e9c:	0007869b          	sext.w	a3,a5
    1ea0:	fa043783          	ld	a5,-96(s0)
    1ea4:	53fc                	lw	a5,100(a5)
    1ea6:	f7442703          	lw	a4,-140(s0)
    1eaa:	02f707bb          	mulw	a5,a4,a5
    1eae:	2781                	sext.w	a5,a5
    1eb0:	8736                	mv	a4,a3
    1eb2:	02e7d263          	bge	a5,a4,1ed6 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    1eb6:	4098                	lw	a4,0(s1)
    1eb8:	fa043783          	ld	a5,-96(s0)
    1ebc:	47fc                	lw	a5,76(a5)
    1ebe:	9fb9                	addw	a5,a5,a4
    1ec0:	0007871b          	sext.w	a4,a5
    1ec4:	fa043783          	ld	a5,-96(s0)
    1ec8:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    1eca:	fa043783          	ld	a5,-96(s0)
    1ece:	53f8                	lw	a4,100(a5)
    1ed0:	fa043783          	ld	a5,-96(s0)
    1ed4:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    1ed6:	fa043783          	ld	a5,-96(s0)
    1eda:	4bf8                	lw	a4,84(a5)
    1edc:	fa043783          	ld	a5,-96(s0)
    1ee0:	57bc                	lw	a5,104(a5)
    1ee2:	02e7d263          	bge	a5,a4,1f06 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    1ee6:	fa043783          	ld	a5,-96(s0)
    1eea:	4705                	li	a4,1
    1eec:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    1eee:	fa043783          	ld	a5,-96(s0)
    1ef2:	4fb8                	lw	a4,88(a5)
    1ef4:	fa043783          	ld	a5,-96(s0)
    1ef8:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    1efa:	fa043783          	ld	a5,-96(s0)
    1efe:	4bf8                	lw	a4,84(a5)
    1f00:	fa043783          	ld	a5,-96(s0)
    1f04:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    1f06:	fa043783          	ld	a5,-96(s0)
    1f0a:	c3a9                	beqz	a5,1f4c <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    1f0c:	fa043783          	ld	a5,-96(s0)
    1f10:	02878793          	addi	a5,a5,40
    1f14:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    1f18:	fa843783          	ld	a5,-88(s0)
    1f1c:	cb91                	beqz	a5,1f30 <schedule_edf_cbs+0x464>
    1f1e:	fc842783          	lw	a5,-56(s0)
    1f22:	2781                	sext.w	a5,a5
    1f24:	c791                	beqz	a5,1f30 <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    1f26:	fcc42783          	lw	a5,-52(s0)
    1f2a:	f4f42423          	sw	a5,-184(s0)
    1f2e:	a81d                	j	1f64 <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    1f30:	fa043783          	ld	a5,-96(s0)
    1f34:	5bbc                	lw	a5,112(a5)
    1f36:	c789                	beqz	a5,1f40 <schedule_edf_cbs+0x474>
    1f38:	fa043783          	ld	a5,-96(s0)
    1f3c:	57bc                	lw	a5,104(a5)
    1f3e:	a021                	j	1f46 <schedule_edf_cbs+0x47a>
    1f40:	fa043783          	ld	a5,-96(s0)
    1f44:	4bfc                	lw	a5,84(a5)
    1f46:	f4f42423          	sw	a5,-184(s0)
    1f4a:	a829                	j	1f64 <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    1f4c:	649c                	ld	a5,8(s1)
    1f4e:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    1f52:	fa843783          	ld	a5,-88(s0)
    1f56:	c781                	beqz	a5,1f5e <schedule_edf_cbs+0x492>
    1f58:	fcc42783          	lw	a5,-52(s0)
    1f5c:	a011                	j	1f60 <schedule_edf_cbs+0x494>
    1f5e:	4785                	li	a5,1
    1f60:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    1f64:	f4043783          	ld	a5,-192(s0)
    1f68:	f4f43823          	sd	a5,-176(s0)
    1f6c:	f4843783          	ld	a5,-184(s0)
    1f70:	f4f43c23          	sd	a5,-168(s0)
    1f74:	4701                	li	a4,0
    1f76:	f5043703          	ld	a4,-176(s0)
    1f7a:	4781                	li	a5,0
    1f7c:	f5843783          	ld	a5,-168(s0)
    1f80:	893a                	mv	s2,a4
    1f82:	89be                	mv	s3,a5
    1f84:	874a                	mv	a4,s2
    1f86:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    1f88:	853a                	mv	a0,a4
    1f8a:	85be                	mv	a1,a5
    1f8c:	70ea                	ld	ra,184(sp)
    1f8e:	744a                	ld	s0,176(sp)
    1f90:	74aa                	ld	s1,168(sp)
    1f92:	790a                	ld	s2,160(sp)
    1f94:	69ea                	ld	s3,152(sp)
    1f96:	6129                	addi	sp,sp,192
    1f98:	8082                	ret
