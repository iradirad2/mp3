
user/_grep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	0080                	addi	s0,sp,64
       8:	fca43423          	sd	a0,-56(s0)
       c:	87ae                	mv	a5,a1
       e:	fcf42223          	sw	a5,-60(s0)
  int n, m;
  char *p, *q;

  m = 0;
      12:	fe042623          	sw	zero,-20(s0)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
      16:	a8f9                	j	f4 <grep+0xf4>
    m += n;
      18:	fec42703          	lw	a4,-20(s0)
      1c:	fdc42783          	lw	a5,-36(s0)
      20:	9fb9                	addw	a5,a5,a4
      22:	fef42623          	sw	a5,-20(s0)
    buf[m] = '\0';
      26:	00002717          	auipc	a4,0x2
      2a:	69270713          	addi	a4,a4,1682 # 26b8 <buf>
      2e:	fec42783          	lw	a5,-20(s0)
      32:	97ba                	add	a5,a5,a4
      34:	00078023          	sb	zero,0(a5)
    p = buf;
      38:	00002797          	auipc	a5,0x2
      3c:	68078793          	addi	a5,a5,1664 # 26b8 <buf>
      40:	fef43023          	sd	a5,-32(s0)
    while((q = strchr(p, '\n')) != 0){
      44:	a891                	j	98 <grep+0x98>
      *q = 0;
      46:	fd043783          	ld	a5,-48(s0)
      4a:	00078023          	sb	zero,0(a5)
      if(match(pattern, p)){
      4e:	fe043583          	ld	a1,-32(s0)
      52:	fc843503          	ld	a0,-56(s0)
      56:	00000097          	auipc	ra,0x0
      5a:	1fa080e7          	jalr	506(ra) # 250 <match>
      5e:	87aa                	mv	a5,a0
      60:	c79d                	beqz	a5,8e <grep+0x8e>
        *q = '\n';
      62:	fd043783          	ld	a5,-48(s0)
      66:	4729                	li	a4,10
      68:	00e78023          	sb	a4,0(a5)
        write(1, p, q+1 - p);
      6c:	fd043783          	ld	a5,-48(s0)
      70:	00178713          	addi	a4,a5,1
      74:	fe043783          	ld	a5,-32(s0)
      78:	40f707b3          	sub	a5,a4,a5
      7c:	2781                	sext.w	a5,a5
      7e:	863e                	mv	a2,a5
      80:	fe043583          	ld	a1,-32(s0)
      84:	4505                	li	a0,1
      86:	00001097          	auipc	ra,0x1
      8a:	842080e7          	jalr	-1982(ra) # 8c8 <write>
      }
      p = q+1;
      8e:	fd043783          	ld	a5,-48(s0)
      92:	0785                	addi	a5,a5,1
      94:	fef43023          	sd	a5,-32(s0)
    while((q = strchr(p, '\n')) != 0){
      98:	45a9                	li	a1,10
      9a:	fe043503          	ld	a0,-32(s0)
      9e:	00000097          	auipc	ra,0x0
      a2:	4c0080e7          	jalr	1216(ra) # 55e <strchr>
      a6:	fca43823          	sd	a0,-48(s0)
      aa:	fd043783          	ld	a5,-48(s0)
      ae:	ffc1                	bnez	a5,46 <grep+0x46>
    }
    if(m > 0){
      b0:	fec42783          	lw	a5,-20(s0)
      b4:	2781                	sext.w	a5,a5
      b6:	02f05f63          	blez	a5,f4 <grep+0xf4>
      m -= p - buf;
      ba:	fec42703          	lw	a4,-20(s0)
      be:	fe043683          	ld	a3,-32(s0)
      c2:	00002797          	auipc	a5,0x2
      c6:	5f678793          	addi	a5,a5,1526 # 26b8 <buf>
      ca:	40f687b3          	sub	a5,a3,a5
      ce:	2781                	sext.w	a5,a5
      d0:	40f707bb          	subw	a5,a4,a5
      d4:	2781                	sext.w	a5,a5
      d6:	fef42623          	sw	a5,-20(s0)
      memmove(buf, p, m);
      da:	fec42783          	lw	a5,-20(s0)
      de:	863e                	mv	a2,a5
      e0:	fe043583          	ld	a1,-32(s0)
      e4:	00002517          	auipc	a0,0x2
      e8:	5d450513          	addi	a0,a0,1492 # 26b8 <buf>
      ec:	00000097          	auipc	ra,0x0
      f0:	636080e7          	jalr	1590(ra) # 722 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
      f4:	fec42703          	lw	a4,-20(s0)
      f8:	00002797          	auipc	a5,0x2
      fc:	5c078793          	addi	a5,a5,1472 # 26b8 <buf>
     100:	00f706b3          	add	a3,a4,a5
     104:	fec42783          	lw	a5,-20(s0)
     108:	3ff00713          	li	a4,1023
     10c:	40f707bb          	subw	a5,a4,a5
     110:	2781                	sext.w	a5,a5
     112:	0007871b          	sext.w	a4,a5
     116:	fc442783          	lw	a5,-60(s0)
     11a:	863a                	mv	a2,a4
     11c:	85b6                	mv	a1,a3
     11e:	853e                	mv	a0,a5
     120:	00000097          	auipc	ra,0x0
     124:	7a0080e7          	jalr	1952(ra) # 8c0 <read>
     128:	87aa                	mv	a5,a0
     12a:	fcf42e23          	sw	a5,-36(s0)
     12e:	fdc42783          	lw	a5,-36(s0)
     132:	2781                	sext.w	a5,a5
     134:	eef042e3          	bgtz	a5,18 <grep+0x18>
    }
  }
}
     138:	0001                	nop
     13a:	0001                	nop
     13c:	70e2                	ld	ra,56(sp)
     13e:	7442                	ld	s0,48(sp)
     140:	6121                	addi	sp,sp,64
     142:	8082                	ret

0000000000000144 <main>:

int
main(int argc, char *argv[])
{
     144:	7139                	addi	sp,sp,-64
     146:	fc06                	sd	ra,56(sp)
     148:	f822                	sd	s0,48(sp)
     14a:	0080                	addi	s0,sp,64
     14c:	87aa                	mv	a5,a0
     14e:	fcb43023          	sd	a1,-64(s0)
     152:	fcf42623          	sw	a5,-52(s0)
  int fd, i;
  char *pattern;

  if(argc <= 1){
     156:	fcc42783          	lw	a5,-52(s0)
     15a:	0007871b          	sext.w	a4,a5
     15e:	4785                	li	a5,1
     160:	02e7c063          	blt	a5,a4,180 <main+0x3c>
    fprintf(2, "usage: grep pattern [file ...]\n");
     164:	00002597          	auipc	a1,0x2
     168:	25458593          	addi	a1,a1,596 # 23b8 <schedule_edf_cbs+0x4d4>
     16c:	4509                	li	a0,2
     16e:	00001097          	auipc	ra,0x1
     172:	c28080e7          	jalr	-984(ra) # d96 <fprintf>
    exit(1);
     176:	4505                	li	a0,1
     178:	00000097          	auipc	ra,0x0
     17c:	730080e7          	jalr	1840(ra) # 8a8 <exit>
  }
  pattern = argv[1];
     180:	fc043783          	ld	a5,-64(s0)
     184:	679c                	ld	a5,8(a5)
     186:	fef43023          	sd	a5,-32(s0)

  if(argc <= 2){
     18a:	fcc42783          	lw	a5,-52(s0)
     18e:	0007871b          	sext.w	a4,a5
     192:	4789                	li	a5,2
     194:	00e7ce63          	blt	a5,a4,1b0 <main+0x6c>
    grep(pattern, 0);
     198:	4581                	li	a1,0
     19a:	fe043503          	ld	a0,-32(s0)
     19e:	00000097          	auipc	ra,0x0
     1a2:	e62080e7          	jalr	-414(ra) # 0 <grep>
    exit(0);
     1a6:	4501                	li	a0,0
     1a8:	00000097          	auipc	ra,0x0
     1ac:	700080e7          	jalr	1792(ra) # 8a8 <exit>
  }

  for(i = 2; i < argc; i++){
     1b0:	4789                	li	a5,2
     1b2:	fef42623          	sw	a5,-20(s0)
     1b6:	a041                	j	236 <main+0xf2>
    if((fd = open(argv[i], 0)) < 0){
     1b8:	fec42783          	lw	a5,-20(s0)
     1bc:	078e                	slli	a5,a5,0x3
     1be:	fc043703          	ld	a4,-64(s0)
     1c2:	97ba                	add	a5,a5,a4
     1c4:	639c                	ld	a5,0(a5)
     1c6:	4581                	li	a1,0
     1c8:	853e                	mv	a0,a5
     1ca:	00000097          	auipc	ra,0x0
     1ce:	71e080e7          	jalr	1822(ra) # 8e8 <open>
     1d2:	87aa                	mv	a5,a0
     1d4:	fcf42e23          	sw	a5,-36(s0)
     1d8:	fdc42783          	lw	a5,-36(s0)
     1dc:	2781                	sext.w	a5,a5
     1de:	0207d763          	bgez	a5,20c <main+0xc8>
      printf("grep: cannot open %s\n", argv[i]);
     1e2:	fec42783          	lw	a5,-20(s0)
     1e6:	078e                	slli	a5,a5,0x3
     1e8:	fc043703          	ld	a4,-64(s0)
     1ec:	97ba                	add	a5,a5,a4
     1ee:	639c                	ld	a5,0(a5)
     1f0:	85be                	mv	a1,a5
     1f2:	00002517          	auipc	a0,0x2
     1f6:	1e650513          	addi	a0,a0,486 # 23d8 <schedule_edf_cbs+0x4f4>
     1fa:	00001097          	auipc	ra,0x1
     1fe:	bf4080e7          	jalr	-1036(ra) # dee <printf>
      exit(1);
     202:	4505                	li	a0,1
     204:	00000097          	auipc	ra,0x0
     208:	6a4080e7          	jalr	1700(ra) # 8a8 <exit>
    }
    grep(pattern, fd);
     20c:	fdc42783          	lw	a5,-36(s0)
     210:	85be                	mv	a1,a5
     212:	fe043503          	ld	a0,-32(s0)
     216:	00000097          	auipc	ra,0x0
     21a:	dea080e7          	jalr	-534(ra) # 0 <grep>
    close(fd);
     21e:	fdc42783          	lw	a5,-36(s0)
     222:	853e                	mv	a0,a5
     224:	00000097          	auipc	ra,0x0
     228:	6ac080e7          	jalr	1708(ra) # 8d0 <close>
  for(i = 2; i < argc; i++){
     22c:	fec42783          	lw	a5,-20(s0)
     230:	2785                	addiw	a5,a5,1
     232:	fef42623          	sw	a5,-20(s0)
     236:	fec42703          	lw	a4,-20(s0)
     23a:	fcc42783          	lw	a5,-52(s0)
     23e:	2701                	sext.w	a4,a4
     240:	2781                	sext.w	a5,a5
     242:	f6f74be3          	blt	a4,a5,1b8 <main+0x74>
  }
  exit(0);
     246:	4501                	li	a0,0
     248:	00000097          	auipc	ra,0x0
     24c:	660080e7          	jalr	1632(ra) # 8a8 <exit>

0000000000000250 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
     250:	1101                	addi	sp,sp,-32
     252:	ec06                	sd	ra,24(sp)
     254:	e822                	sd	s0,16(sp)
     256:	1000                	addi	s0,sp,32
     258:	fea43423          	sd	a0,-24(s0)
     25c:	feb43023          	sd	a1,-32(s0)
  if(re[0] == '^')
     260:	fe843783          	ld	a5,-24(s0)
     264:	0007c783          	lbu	a5,0(a5)
     268:	873e                	mv	a4,a5
     26a:	05e00793          	li	a5,94
     26e:	00f71e63          	bne	a4,a5,28a <match+0x3a>
    return matchhere(re+1, text);
     272:	fe843783          	ld	a5,-24(s0)
     276:	0785                	addi	a5,a5,1
     278:	fe043583          	ld	a1,-32(s0)
     27c:	853e                	mv	a0,a5
     27e:	00000097          	auipc	ra,0x0
     282:	042080e7          	jalr	66(ra) # 2c0 <matchhere>
     286:	87aa                	mv	a5,a0
     288:	a03d                	j	2b6 <match+0x66>
  do{  // must look at empty string
    if(matchhere(re, text))
     28a:	fe043583          	ld	a1,-32(s0)
     28e:	fe843503          	ld	a0,-24(s0)
     292:	00000097          	auipc	ra,0x0
     296:	02e080e7          	jalr	46(ra) # 2c0 <matchhere>
     29a:	87aa                	mv	a5,a0
     29c:	c399                	beqz	a5,2a2 <match+0x52>
      return 1;
     29e:	4785                	li	a5,1
     2a0:	a819                	j	2b6 <match+0x66>
  }while(*text++ != '\0');
     2a2:	fe043783          	ld	a5,-32(s0)
     2a6:	00178713          	addi	a4,a5,1
     2aa:	fee43023          	sd	a4,-32(s0)
     2ae:	0007c783          	lbu	a5,0(a5)
     2b2:	ffe1                	bnez	a5,28a <match+0x3a>
  return 0;
     2b4:	4781                	li	a5,0
}
     2b6:	853e                	mv	a0,a5
     2b8:	60e2                	ld	ra,24(sp)
     2ba:	6442                	ld	s0,16(sp)
     2bc:	6105                	addi	sp,sp,32
     2be:	8082                	ret

00000000000002c0 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
     2c0:	1101                	addi	sp,sp,-32
     2c2:	ec06                	sd	ra,24(sp)
     2c4:	e822                	sd	s0,16(sp)
     2c6:	1000                	addi	s0,sp,32
     2c8:	fea43423          	sd	a0,-24(s0)
     2cc:	feb43023          	sd	a1,-32(s0)
  if(re[0] == '\0')
     2d0:	fe843783          	ld	a5,-24(s0)
     2d4:	0007c783          	lbu	a5,0(a5)
     2d8:	e399                	bnez	a5,2de <matchhere+0x1e>
    return 1;
     2da:	4785                	li	a5,1
     2dc:	a0c1                	j	39c <matchhere+0xdc>
  if(re[1] == '*')
     2de:	fe843783          	ld	a5,-24(s0)
     2e2:	0785                	addi	a5,a5,1
     2e4:	0007c783          	lbu	a5,0(a5)
     2e8:	873e                	mv	a4,a5
     2ea:	02a00793          	li	a5,42
     2ee:	02f71563          	bne	a4,a5,318 <matchhere+0x58>
    return matchstar(re[0], re+2, text);
     2f2:	fe843783          	ld	a5,-24(s0)
     2f6:	0007c783          	lbu	a5,0(a5)
     2fa:	0007871b          	sext.w	a4,a5
     2fe:	fe843783          	ld	a5,-24(s0)
     302:	0789                	addi	a5,a5,2
     304:	fe043603          	ld	a2,-32(s0)
     308:	85be                	mv	a1,a5
     30a:	853a                	mv	a0,a4
     30c:	00000097          	auipc	ra,0x0
     310:	09a080e7          	jalr	154(ra) # 3a6 <matchstar>
     314:	87aa                	mv	a5,a0
     316:	a059                	j	39c <matchhere+0xdc>
  if(re[0] == '$' && re[1] == '\0')
     318:	fe843783          	ld	a5,-24(s0)
     31c:	0007c783          	lbu	a5,0(a5)
     320:	873e                	mv	a4,a5
     322:	02400793          	li	a5,36
     326:	02f71363          	bne	a4,a5,34c <matchhere+0x8c>
     32a:	fe843783          	ld	a5,-24(s0)
     32e:	0785                	addi	a5,a5,1
     330:	0007c783          	lbu	a5,0(a5)
     334:	ef81                	bnez	a5,34c <matchhere+0x8c>
    return *text == '\0';
     336:	fe043783          	ld	a5,-32(s0)
     33a:	0007c783          	lbu	a5,0(a5)
     33e:	2781                	sext.w	a5,a5
     340:	0017b793          	seqz	a5,a5
     344:	0ff7f793          	andi	a5,a5,255
     348:	2781                	sext.w	a5,a5
     34a:	a889                	j	39c <matchhere+0xdc>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     34c:	fe043783          	ld	a5,-32(s0)
     350:	0007c783          	lbu	a5,0(a5)
     354:	c3b9                	beqz	a5,39a <matchhere+0xda>
     356:	fe843783          	ld	a5,-24(s0)
     35a:	0007c783          	lbu	a5,0(a5)
     35e:	873e                	mv	a4,a5
     360:	02e00793          	li	a5,46
     364:	00f70c63          	beq	a4,a5,37c <matchhere+0xbc>
     368:	fe843783          	ld	a5,-24(s0)
     36c:	0007c703          	lbu	a4,0(a5)
     370:	fe043783          	ld	a5,-32(s0)
     374:	0007c783          	lbu	a5,0(a5)
     378:	02f71163          	bne	a4,a5,39a <matchhere+0xda>
    return matchhere(re+1, text+1);
     37c:	fe843783          	ld	a5,-24(s0)
     380:	00178713          	addi	a4,a5,1
     384:	fe043783          	ld	a5,-32(s0)
     388:	0785                	addi	a5,a5,1
     38a:	85be                	mv	a1,a5
     38c:	853a                	mv	a0,a4
     38e:	00000097          	auipc	ra,0x0
     392:	f32080e7          	jalr	-206(ra) # 2c0 <matchhere>
     396:	87aa                	mv	a5,a0
     398:	a011                	j	39c <matchhere+0xdc>
  return 0;
     39a:	4781                	li	a5,0
}
     39c:	853e                	mv	a0,a5
     39e:	60e2                	ld	ra,24(sp)
     3a0:	6442                	ld	s0,16(sp)
     3a2:	6105                	addi	sp,sp,32
     3a4:	8082                	ret

00000000000003a6 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
     3a6:	7179                	addi	sp,sp,-48
     3a8:	f406                	sd	ra,40(sp)
     3aa:	f022                	sd	s0,32(sp)
     3ac:	1800                	addi	s0,sp,48
     3ae:	87aa                	mv	a5,a0
     3b0:	feb43023          	sd	a1,-32(s0)
     3b4:	fcc43c23          	sd	a2,-40(s0)
     3b8:	fef42623          	sw	a5,-20(s0)
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
     3bc:	fd843583          	ld	a1,-40(s0)
     3c0:	fe043503          	ld	a0,-32(s0)
     3c4:	00000097          	auipc	ra,0x0
     3c8:	efc080e7          	jalr	-260(ra) # 2c0 <matchhere>
     3cc:	87aa                	mv	a5,a0
     3ce:	c399                	beqz	a5,3d4 <matchstar+0x2e>
      return 1;
     3d0:	4785                	li	a5,1
     3d2:	a835                	j	40e <matchstar+0x68>
  }while(*text!='\0' && (*text++==c || c=='.'));
     3d4:	fd843783          	ld	a5,-40(s0)
     3d8:	0007c783          	lbu	a5,0(a5)
     3dc:	cb85                	beqz	a5,40c <matchstar+0x66>
     3de:	fd843783          	ld	a5,-40(s0)
     3e2:	00178713          	addi	a4,a5,1
     3e6:	fce43c23          	sd	a4,-40(s0)
     3ea:	0007c783          	lbu	a5,0(a5)
     3ee:	0007871b          	sext.w	a4,a5
     3f2:	fec42783          	lw	a5,-20(s0)
     3f6:	2781                	sext.w	a5,a5
     3f8:	fce782e3          	beq	a5,a4,3bc <matchstar+0x16>
     3fc:	fec42783          	lw	a5,-20(s0)
     400:	0007871b          	sext.w	a4,a5
     404:	02e00793          	li	a5,46
     408:	faf70ae3          	beq	a4,a5,3bc <matchstar+0x16>
  return 0;
     40c:	4781                	li	a5,0
}
     40e:	853e                	mv	a0,a5
     410:	70a2                	ld	ra,40(sp)
     412:	7402                	ld	s0,32(sp)
     414:	6145                	addi	sp,sp,48
     416:	8082                	ret

0000000000000418 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     418:	7179                	addi	sp,sp,-48
     41a:	f422                	sd	s0,40(sp)
     41c:	1800                	addi	s0,sp,48
     41e:	fca43c23          	sd	a0,-40(s0)
     422:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     426:	fd843783          	ld	a5,-40(s0)
     42a:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     42e:	0001                	nop
     430:	fd043703          	ld	a4,-48(s0)
     434:	00170793          	addi	a5,a4,1
     438:	fcf43823          	sd	a5,-48(s0)
     43c:	fd843783          	ld	a5,-40(s0)
     440:	00178693          	addi	a3,a5,1
     444:	fcd43c23          	sd	a3,-40(s0)
     448:	00074703          	lbu	a4,0(a4)
     44c:	00e78023          	sb	a4,0(a5)
     450:	0007c783          	lbu	a5,0(a5)
     454:	fff1                	bnez	a5,430 <strcpy+0x18>
    ;
  return os;
     456:	fe843783          	ld	a5,-24(s0)
}
     45a:	853e                	mv	a0,a5
     45c:	7422                	ld	s0,40(sp)
     45e:	6145                	addi	sp,sp,48
     460:	8082                	ret

0000000000000462 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     462:	1101                	addi	sp,sp,-32
     464:	ec22                	sd	s0,24(sp)
     466:	1000                	addi	s0,sp,32
     468:	fea43423          	sd	a0,-24(s0)
     46c:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     470:	a819                	j	486 <strcmp+0x24>
    p++, q++;
     472:	fe843783          	ld	a5,-24(s0)
     476:	0785                	addi	a5,a5,1
     478:	fef43423          	sd	a5,-24(s0)
     47c:	fe043783          	ld	a5,-32(s0)
     480:	0785                	addi	a5,a5,1
     482:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     486:	fe843783          	ld	a5,-24(s0)
     48a:	0007c783          	lbu	a5,0(a5)
     48e:	cb99                	beqz	a5,4a4 <strcmp+0x42>
     490:	fe843783          	ld	a5,-24(s0)
     494:	0007c703          	lbu	a4,0(a5)
     498:	fe043783          	ld	a5,-32(s0)
     49c:	0007c783          	lbu	a5,0(a5)
     4a0:	fcf709e3          	beq	a4,a5,472 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     4a4:	fe843783          	ld	a5,-24(s0)
     4a8:	0007c783          	lbu	a5,0(a5)
     4ac:	0007871b          	sext.w	a4,a5
     4b0:	fe043783          	ld	a5,-32(s0)
     4b4:	0007c783          	lbu	a5,0(a5)
     4b8:	2781                	sext.w	a5,a5
     4ba:	40f707bb          	subw	a5,a4,a5
     4be:	2781                	sext.w	a5,a5
}
     4c0:	853e                	mv	a0,a5
     4c2:	6462                	ld	s0,24(sp)
     4c4:	6105                	addi	sp,sp,32
     4c6:	8082                	ret

00000000000004c8 <strlen>:

uint
strlen(const char *s)
{
     4c8:	7179                	addi	sp,sp,-48
     4ca:	f422                	sd	s0,40(sp)
     4cc:	1800                	addi	s0,sp,48
     4ce:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     4d2:	fe042623          	sw	zero,-20(s0)
     4d6:	a031                	j	4e2 <strlen+0x1a>
     4d8:	fec42783          	lw	a5,-20(s0)
     4dc:	2785                	addiw	a5,a5,1
     4de:	fef42623          	sw	a5,-20(s0)
     4e2:	fec42783          	lw	a5,-20(s0)
     4e6:	fd843703          	ld	a4,-40(s0)
     4ea:	97ba                	add	a5,a5,a4
     4ec:	0007c783          	lbu	a5,0(a5)
     4f0:	f7e5                	bnez	a5,4d8 <strlen+0x10>
    ;
  return n;
     4f2:	fec42783          	lw	a5,-20(s0)
}
     4f6:	853e                	mv	a0,a5
     4f8:	7422                	ld	s0,40(sp)
     4fa:	6145                	addi	sp,sp,48
     4fc:	8082                	ret

00000000000004fe <memset>:

void*
memset(void *dst, int c, uint n)
{
     4fe:	7179                	addi	sp,sp,-48
     500:	f422                	sd	s0,40(sp)
     502:	1800                	addi	s0,sp,48
     504:	fca43c23          	sd	a0,-40(s0)
     508:	87ae                	mv	a5,a1
     50a:	8732                	mv	a4,a2
     50c:	fcf42a23          	sw	a5,-44(s0)
     510:	87ba                	mv	a5,a4
     512:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     516:	fd843783          	ld	a5,-40(s0)
     51a:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     51e:	fe042623          	sw	zero,-20(s0)
     522:	a00d                	j	544 <memset+0x46>
    cdst[i] = c;
     524:	fec42783          	lw	a5,-20(s0)
     528:	fe043703          	ld	a4,-32(s0)
     52c:	97ba                	add	a5,a5,a4
     52e:	fd442703          	lw	a4,-44(s0)
     532:	0ff77713          	andi	a4,a4,255
     536:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     53a:	fec42783          	lw	a5,-20(s0)
     53e:	2785                	addiw	a5,a5,1
     540:	fef42623          	sw	a5,-20(s0)
     544:	fec42703          	lw	a4,-20(s0)
     548:	fd042783          	lw	a5,-48(s0)
     54c:	2781                	sext.w	a5,a5
     54e:	fcf76be3          	bltu	a4,a5,524 <memset+0x26>
  }
  return dst;
     552:	fd843783          	ld	a5,-40(s0)
}
     556:	853e                	mv	a0,a5
     558:	7422                	ld	s0,40(sp)
     55a:	6145                	addi	sp,sp,48
     55c:	8082                	ret

000000000000055e <strchr>:

char*
strchr(const char *s, char c)
{
     55e:	1101                	addi	sp,sp,-32
     560:	ec22                	sd	s0,24(sp)
     562:	1000                	addi	s0,sp,32
     564:	fea43423          	sd	a0,-24(s0)
     568:	87ae                	mv	a5,a1
     56a:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     56e:	a01d                	j	594 <strchr+0x36>
    if(*s == c)
     570:	fe843783          	ld	a5,-24(s0)
     574:	0007c703          	lbu	a4,0(a5)
     578:	fe744783          	lbu	a5,-25(s0)
     57c:	0ff7f793          	andi	a5,a5,255
     580:	00e79563          	bne	a5,a4,58a <strchr+0x2c>
      return (char*)s;
     584:	fe843783          	ld	a5,-24(s0)
     588:	a821                	j	5a0 <strchr+0x42>
  for(; *s; s++)
     58a:	fe843783          	ld	a5,-24(s0)
     58e:	0785                	addi	a5,a5,1
     590:	fef43423          	sd	a5,-24(s0)
     594:	fe843783          	ld	a5,-24(s0)
     598:	0007c783          	lbu	a5,0(a5)
     59c:	fbf1                	bnez	a5,570 <strchr+0x12>
  return 0;
     59e:	4781                	li	a5,0
}
     5a0:	853e                	mv	a0,a5
     5a2:	6462                	ld	s0,24(sp)
     5a4:	6105                	addi	sp,sp,32
     5a6:	8082                	ret

00000000000005a8 <gets>:

char*
gets(char *buf, int max)
{
     5a8:	7179                	addi	sp,sp,-48
     5aa:	f406                	sd	ra,40(sp)
     5ac:	f022                	sd	s0,32(sp)
     5ae:	1800                	addi	s0,sp,48
     5b0:	fca43c23          	sd	a0,-40(s0)
     5b4:	87ae                	mv	a5,a1
     5b6:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     5ba:	fe042623          	sw	zero,-20(s0)
     5be:	a8a1                	j	616 <gets+0x6e>
    cc = read(0, &c, 1);
     5c0:	fe740793          	addi	a5,s0,-25
     5c4:	4605                	li	a2,1
     5c6:	85be                	mv	a1,a5
     5c8:	4501                	li	a0,0
     5ca:	00000097          	auipc	ra,0x0
     5ce:	2f6080e7          	jalr	758(ra) # 8c0 <read>
     5d2:	87aa                	mv	a5,a0
     5d4:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     5d8:	fe842783          	lw	a5,-24(s0)
     5dc:	2781                	sext.w	a5,a5
     5de:	04f05763          	blez	a5,62c <gets+0x84>
      break;
    buf[i++] = c;
     5e2:	fec42783          	lw	a5,-20(s0)
     5e6:	0017871b          	addiw	a4,a5,1
     5ea:	fee42623          	sw	a4,-20(s0)
     5ee:	873e                	mv	a4,a5
     5f0:	fd843783          	ld	a5,-40(s0)
     5f4:	97ba                	add	a5,a5,a4
     5f6:	fe744703          	lbu	a4,-25(s0)
     5fa:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     5fe:	fe744783          	lbu	a5,-25(s0)
     602:	873e                	mv	a4,a5
     604:	47a9                	li	a5,10
     606:	02f70463          	beq	a4,a5,62e <gets+0x86>
     60a:	fe744783          	lbu	a5,-25(s0)
     60e:	873e                	mv	a4,a5
     610:	47b5                	li	a5,13
     612:	00f70e63          	beq	a4,a5,62e <gets+0x86>
  for(i=0; i+1 < max; ){
     616:	fec42783          	lw	a5,-20(s0)
     61a:	2785                	addiw	a5,a5,1
     61c:	0007871b          	sext.w	a4,a5
     620:	fd442783          	lw	a5,-44(s0)
     624:	2781                	sext.w	a5,a5
     626:	f8f74de3          	blt	a4,a5,5c0 <gets+0x18>
     62a:	a011                	j	62e <gets+0x86>
      break;
     62c:	0001                	nop
      break;
  }
  buf[i] = '\0';
     62e:	fec42783          	lw	a5,-20(s0)
     632:	fd843703          	ld	a4,-40(s0)
     636:	97ba                	add	a5,a5,a4
     638:	00078023          	sb	zero,0(a5)
  return buf;
     63c:	fd843783          	ld	a5,-40(s0)
}
     640:	853e                	mv	a0,a5
     642:	70a2                	ld	ra,40(sp)
     644:	7402                	ld	s0,32(sp)
     646:	6145                	addi	sp,sp,48
     648:	8082                	ret

000000000000064a <stat>:

int
stat(const char *n, struct stat *st)
{
     64a:	7179                	addi	sp,sp,-48
     64c:	f406                	sd	ra,40(sp)
     64e:	f022                	sd	s0,32(sp)
     650:	1800                	addi	s0,sp,48
     652:	fca43c23          	sd	a0,-40(s0)
     656:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     65a:	4581                	li	a1,0
     65c:	fd843503          	ld	a0,-40(s0)
     660:	00000097          	auipc	ra,0x0
     664:	288080e7          	jalr	648(ra) # 8e8 <open>
     668:	87aa                	mv	a5,a0
     66a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     66e:	fec42783          	lw	a5,-20(s0)
     672:	2781                	sext.w	a5,a5
     674:	0007d463          	bgez	a5,67c <stat+0x32>
    return -1;
     678:	57fd                	li	a5,-1
     67a:	a035                	j	6a6 <stat+0x5c>
  r = fstat(fd, st);
     67c:	fec42783          	lw	a5,-20(s0)
     680:	fd043583          	ld	a1,-48(s0)
     684:	853e                	mv	a0,a5
     686:	00000097          	auipc	ra,0x0
     68a:	27a080e7          	jalr	634(ra) # 900 <fstat>
     68e:	87aa                	mv	a5,a0
     690:	fef42423          	sw	a5,-24(s0)
  close(fd);
     694:	fec42783          	lw	a5,-20(s0)
     698:	853e                	mv	a0,a5
     69a:	00000097          	auipc	ra,0x0
     69e:	236080e7          	jalr	566(ra) # 8d0 <close>
  return r;
     6a2:	fe842783          	lw	a5,-24(s0)
}
     6a6:	853e                	mv	a0,a5
     6a8:	70a2                	ld	ra,40(sp)
     6aa:	7402                	ld	s0,32(sp)
     6ac:	6145                	addi	sp,sp,48
     6ae:	8082                	ret

00000000000006b0 <atoi>:

int
atoi(const char *s)
{
     6b0:	7179                	addi	sp,sp,-48
     6b2:	f422                	sd	s0,40(sp)
     6b4:	1800                	addi	s0,sp,48
     6b6:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     6ba:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     6be:	a815                	j	6f2 <atoi+0x42>
    n = n*10 + *s++ - '0';
     6c0:	fec42703          	lw	a4,-20(s0)
     6c4:	87ba                	mv	a5,a4
     6c6:	0027979b          	slliw	a5,a5,0x2
     6ca:	9fb9                	addw	a5,a5,a4
     6cc:	0017979b          	slliw	a5,a5,0x1
     6d0:	0007871b          	sext.w	a4,a5
     6d4:	fd843783          	ld	a5,-40(s0)
     6d8:	00178693          	addi	a3,a5,1
     6dc:	fcd43c23          	sd	a3,-40(s0)
     6e0:	0007c783          	lbu	a5,0(a5)
     6e4:	2781                	sext.w	a5,a5
     6e6:	9fb9                	addw	a5,a5,a4
     6e8:	2781                	sext.w	a5,a5
     6ea:	fd07879b          	addiw	a5,a5,-48
     6ee:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     6f2:	fd843783          	ld	a5,-40(s0)
     6f6:	0007c783          	lbu	a5,0(a5)
     6fa:	873e                	mv	a4,a5
     6fc:	02f00793          	li	a5,47
     700:	00e7fb63          	bgeu	a5,a4,716 <atoi+0x66>
     704:	fd843783          	ld	a5,-40(s0)
     708:	0007c783          	lbu	a5,0(a5)
     70c:	873e                	mv	a4,a5
     70e:	03900793          	li	a5,57
     712:	fae7f7e3          	bgeu	a5,a4,6c0 <atoi+0x10>
  return n;
     716:	fec42783          	lw	a5,-20(s0)
}
     71a:	853e                	mv	a0,a5
     71c:	7422                	ld	s0,40(sp)
     71e:	6145                	addi	sp,sp,48
     720:	8082                	ret

0000000000000722 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     722:	7139                	addi	sp,sp,-64
     724:	fc22                	sd	s0,56(sp)
     726:	0080                	addi	s0,sp,64
     728:	fca43c23          	sd	a0,-40(s0)
     72c:	fcb43823          	sd	a1,-48(s0)
     730:	87b2                	mv	a5,a2
     732:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     736:	fd843783          	ld	a5,-40(s0)
     73a:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     73e:	fd043783          	ld	a5,-48(s0)
     742:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     746:	fe043703          	ld	a4,-32(s0)
     74a:	fe843783          	ld	a5,-24(s0)
     74e:	02e7fc63          	bgeu	a5,a4,786 <memmove+0x64>
    while(n-- > 0)
     752:	a00d                	j	774 <memmove+0x52>
      *dst++ = *src++;
     754:	fe043703          	ld	a4,-32(s0)
     758:	00170793          	addi	a5,a4,1
     75c:	fef43023          	sd	a5,-32(s0)
     760:	fe843783          	ld	a5,-24(s0)
     764:	00178693          	addi	a3,a5,1
     768:	fed43423          	sd	a3,-24(s0)
     76c:	00074703          	lbu	a4,0(a4)
     770:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     774:	fcc42783          	lw	a5,-52(s0)
     778:	fff7871b          	addiw	a4,a5,-1
     77c:	fce42623          	sw	a4,-52(s0)
     780:	fcf04ae3          	bgtz	a5,754 <memmove+0x32>
     784:	a891                	j	7d8 <memmove+0xb6>
  } else {
    dst += n;
     786:	fcc42783          	lw	a5,-52(s0)
     78a:	fe843703          	ld	a4,-24(s0)
     78e:	97ba                	add	a5,a5,a4
     790:	fef43423          	sd	a5,-24(s0)
    src += n;
     794:	fcc42783          	lw	a5,-52(s0)
     798:	fe043703          	ld	a4,-32(s0)
     79c:	97ba                	add	a5,a5,a4
     79e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     7a2:	a01d                	j	7c8 <memmove+0xa6>
      *--dst = *--src;
     7a4:	fe043783          	ld	a5,-32(s0)
     7a8:	17fd                	addi	a5,a5,-1
     7aa:	fef43023          	sd	a5,-32(s0)
     7ae:	fe843783          	ld	a5,-24(s0)
     7b2:	17fd                	addi	a5,a5,-1
     7b4:	fef43423          	sd	a5,-24(s0)
     7b8:	fe043783          	ld	a5,-32(s0)
     7bc:	0007c703          	lbu	a4,0(a5)
     7c0:	fe843783          	ld	a5,-24(s0)
     7c4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     7c8:	fcc42783          	lw	a5,-52(s0)
     7cc:	fff7871b          	addiw	a4,a5,-1
     7d0:	fce42623          	sw	a4,-52(s0)
     7d4:	fcf048e3          	bgtz	a5,7a4 <memmove+0x82>
  }
  return vdst;
     7d8:	fd843783          	ld	a5,-40(s0)
}
     7dc:	853e                	mv	a0,a5
     7de:	7462                	ld	s0,56(sp)
     7e0:	6121                	addi	sp,sp,64
     7e2:	8082                	ret

00000000000007e4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     7e4:	7139                	addi	sp,sp,-64
     7e6:	fc22                	sd	s0,56(sp)
     7e8:	0080                	addi	s0,sp,64
     7ea:	fca43c23          	sd	a0,-40(s0)
     7ee:	fcb43823          	sd	a1,-48(s0)
     7f2:	87b2                	mv	a5,a2
     7f4:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     7f8:	fd843783          	ld	a5,-40(s0)
     7fc:	fef43423          	sd	a5,-24(s0)
     800:	fd043783          	ld	a5,-48(s0)
     804:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     808:	a0a1                	j	850 <memcmp+0x6c>
    if (*p1 != *p2) {
     80a:	fe843783          	ld	a5,-24(s0)
     80e:	0007c703          	lbu	a4,0(a5)
     812:	fe043783          	ld	a5,-32(s0)
     816:	0007c783          	lbu	a5,0(a5)
     81a:	02f70163          	beq	a4,a5,83c <memcmp+0x58>
      return *p1 - *p2;
     81e:	fe843783          	ld	a5,-24(s0)
     822:	0007c783          	lbu	a5,0(a5)
     826:	0007871b          	sext.w	a4,a5
     82a:	fe043783          	ld	a5,-32(s0)
     82e:	0007c783          	lbu	a5,0(a5)
     832:	2781                	sext.w	a5,a5
     834:	40f707bb          	subw	a5,a4,a5
     838:	2781                	sext.w	a5,a5
     83a:	a01d                	j	860 <memcmp+0x7c>
    }
    p1++;
     83c:	fe843783          	ld	a5,-24(s0)
     840:	0785                	addi	a5,a5,1
     842:	fef43423          	sd	a5,-24(s0)
    p2++;
     846:	fe043783          	ld	a5,-32(s0)
     84a:	0785                	addi	a5,a5,1
     84c:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     850:	fcc42783          	lw	a5,-52(s0)
     854:	fff7871b          	addiw	a4,a5,-1
     858:	fce42623          	sw	a4,-52(s0)
     85c:	f7dd                	bnez	a5,80a <memcmp+0x26>
  }
  return 0;
     85e:	4781                	li	a5,0
}
     860:	853e                	mv	a0,a5
     862:	7462                	ld	s0,56(sp)
     864:	6121                	addi	sp,sp,64
     866:	8082                	ret

0000000000000868 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     868:	7179                	addi	sp,sp,-48
     86a:	f406                	sd	ra,40(sp)
     86c:	f022                	sd	s0,32(sp)
     86e:	1800                	addi	s0,sp,48
     870:	fea43423          	sd	a0,-24(s0)
     874:	feb43023          	sd	a1,-32(s0)
     878:	87b2                	mv	a5,a2
     87a:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     87e:	fdc42783          	lw	a5,-36(s0)
     882:	863e                	mv	a2,a5
     884:	fe043583          	ld	a1,-32(s0)
     888:	fe843503          	ld	a0,-24(s0)
     88c:	00000097          	auipc	ra,0x0
     890:	e96080e7          	jalr	-362(ra) # 722 <memmove>
     894:	87aa                	mv	a5,a0
}
     896:	853e                	mv	a0,a5
     898:	70a2                	ld	ra,40(sp)
     89a:	7402                	ld	s0,32(sp)
     89c:	6145                	addi	sp,sp,48
     89e:	8082                	ret

00000000000008a0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     8a0:	4885                	li	a7,1
 ecall
     8a2:	00000073          	ecall
 ret
     8a6:	8082                	ret

00000000000008a8 <exit>:
.global exit
exit:
 li a7, SYS_exit
     8a8:	4889                	li	a7,2
 ecall
     8aa:	00000073          	ecall
 ret
     8ae:	8082                	ret

00000000000008b0 <wait>:
.global wait
wait:
 li a7, SYS_wait
     8b0:	488d                	li	a7,3
 ecall
     8b2:	00000073          	ecall
 ret
     8b6:	8082                	ret

00000000000008b8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     8b8:	4891                	li	a7,4
 ecall
     8ba:	00000073          	ecall
 ret
     8be:	8082                	ret

00000000000008c0 <read>:
.global read
read:
 li a7, SYS_read
     8c0:	4895                	li	a7,5
 ecall
     8c2:	00000073          	ecall
 ret
     8c6:	8082                	ret

00000000000008c8 <write>:
.global write
write:
 li a7, SYS_write
     8c8:	48c1                	li	a7,16
 ecall
     8ca:	00000073          	ecall
 ret
     8ce:	8082                	ret

00000000000008d0 <close>:
.global close
close:
 li a7, SYS_close
     8d0:	48d5                	li	a7,21
 ecall
     8d2:	00000073          	ecall
 ret
     8d6:	8082                	ret

00000000000008d8 <kill>:
.global kill
kill:
 li a7, SYS_kill
     8d8:	4899                	li	a7,6
 ecall
     8da:	00000073          	ecall
 ret
     8de:	8082                	ret

00000000000008e0 <exec>:
.global exec
exec:
 li a7, SYS_exec
     8e0:	489d                	li	a7,7
 ecall
     8e2:	00000073          	ecall
 ret
     8e6:	8082                	ret

00000000000008e8 <open>:
.global open
open:
 li a7, SYS_open
     8e8:	48bd                	li	a7,15
 ecall
     8ea:	00000073          	ecall
 ret
     8ee:	8082                	ret

00000000000008f0 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     8f0:	48c5                	li	a7,17
 ecall
     8f2:	00000073          	ecall
 ret
     8f6:	8082                	ret

00000000000008f8 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     8f8:	48c9                	li	a7,18
 ecall
     8fa:	00000073          	ecall
 ret
     8fe:	8082                	ret

0000000000000900 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     900:	48a1                	li	a7,8
 ecall
     902:	00000073          	ecall
 ret
     906:	8082                	ret

0000000000000908 <link>:
.global link
link:
 li a7, SYS_link
     908:	48cd                	li	a7,19
 ecall
     90a:	00000073          	ecall
 ret
     90e:	8082                	ret

0000000000000910 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     910:	48d1                	li	a7,20
 ecall
     912:	00000073          	ecall
 ret
     916:	8082                	ret

0000000000000918 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     918:	48a5                	li	a7,9
 ecall
     91a:	00000073          	ecall
 ret
     91e:	8082                	ret

0000000000000920 <dup>:
.global dup
dup:
 li a7, SYS_dup
     920:	48a9                	li	a7,10
 ecall
     922:	00000073          	ecall
 ret
     926:	8082                	ret

0000000000000928 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     928:	48ad                	li	a7,11
 ecall
     92a:	00000073          	ecall
 ret
     92e:	8082                	ret

0000000000000930 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     930:	48b1                	li	a7,12
 ecall
     932:	00000073          	ecall
 ret
     936:	8082                	ret

0000000000000938 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     938:	48b5                	li	a7,13
 ecall
     93a:	00000073          	ecall
 ret
     93e:	8082                	ret

0000000000000940 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     940:	48b9                	li	a7,14
 ecall
     942:	00000073          	ecall
 ret
     946:	8082                	ret

0000000000000948 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     948:	48d9                	li	a7,22
 ecall
     94a:	00000073          	ecall
 ret
     94e:	8082                	ret

0000000000000950 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     950:	48dd                	li	a7,23
 ecall
     952:	00000073          	ecall
 ret
     956:	8082                	ret

0000000000000958 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     958:	48e1                	li	a7,24
 ecall
     95a:	00000073          	ecall
 ret
     95e:	8082                	ret

0000000000000960 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     960:	1101                	addi	sp,sp,-32
     962:	ec06                	sd	ra,24(sp)
     964:	e822                	sd	s0,16(sp)
     966:	1000                	addi	s0,sp,32
     968:	87aa                	mv	a5,a0
     96a:	872e                	mv	a4,a1
     96c:	fef42623          	sw	a5,-20(s0)
     970:	87ba                	mv	a5,a4
     972:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     976:	feb40713          	addi	a4,s0,-21
     97a:	fec42783          	lw	a5,-20(s0)
     97e:	4605                	li	a2,1
     980:	85ba                	mv	a1,a4
     982:	853e                	mv	a0,a5
     984:	00000097          	auipc	ra,0x0
     988:	f44080e7          	jalr	-188(ra) # 8c8 <write>
}
     98c:	0001                	nop
     98e:	60e2                	ld	ra,24(sp)
     990:	6442                	ld	s0,16(sp)
     992:	6105                	addi	sp,sp,32
     994:	8082                	ret

0000000000000996 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     996:	7139                	addi	sp,sp,-64
     998:	fc06                	sd	ra,56(sp)
     99a:	f822                	sd	s0,48(sp)
     99c:	0080                	addi	s0,sp,64
     99e:	87aa                	mv	a5,a0
     9a0:	8736                	mv	a4,a3
     9a2:	fcf42623          	sw	a5,-52(s0)
     9a6:	87ae                	mv	a5,a1
     9a8:	fcf42423          	sw	a5,-56(s0)
     9ac:	87b2                	mv	a5,a2
     9ae:	fcf42223          	sw	a5,-60(s0)
     9b2:	87ba                	mv	a5,a4
     9b4:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     9b8:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     9bc:	fc042783          	lw	a5,-64(s0)
     9c0:	2781                	sext.w	a5,a5
     9c2:	c38d                	beqz	a5,9e4 <printint+0x4e>
     9c4:	fc842783          	lw	a5,-56(s0)
     9c8:	2781                	sext.w	a5,a5
     9ca:	0007dd63          	bgez	a5,9e4 <printint+0x4e>
    neg = 1;
     9ce:	4785                	li	a5,1
     9d0:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     9d4:	fc842783          	lw	a5,-56(s0)
     9d8:	40f007bb          	negw	a5,a5
     9dc:	2781                	sext.w	a5,a5
     9de:	fef42223          	sw	a5,-28(s0)
     9e2:	a029                	j	9ec <printint+0x56>
  } else {
    x = xx;
     9e4:	fc842783          	lw	a5,-56(s0)
     9e8:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     9ec:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     9f0:	fc442783          	lw	a5,-60(s0)
     9f4:	fe442703          	lw	a4,-28(s0)
     9f8:	02f777bb          	remuw	a5,a4,a5
     9fc:	0007861b          	sext.w	a2,a5
     a00:	fec42783          	lw	a5,-20(s0)
     a04:	0017871b          	addiw	a4,a5,1
     a08:	fee42623          	sw	a4,-20(s0)
     a0c:	00002697          	auipc	a3,0x2
     a10:	c6468693          	addi	a3,a3,-924 # 2670 <digits>
     a14:	02061713          	slli	a4,a2,0x20
     a18:	9301                	srli	a4,a4,0x20
     a1a:	9736                	add	a4,a4,a3
     a1c:	00074703          	lbu	a4,0(a4)
     a20:	ff040693          	addi	a3,s0,-16
     a24:	97b6                	add	a5,a5,a3
     a26:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     a2a:	fc442783          	lw	a5,-60(s0)
     a2e:	fe442703          	lw	a4,-28(s0)
     a32:	02f757bb          	divuw	a5,a4,a5
     a36:	fef42223          	sw	a5,-28(s0)
     a3a:	fe442783          	lw	a5,-28(s0)
     a3e:	2781                	sext.w	a5,a5
     a40:	fbc5                	bnez	a5,9f0 <printint+0x5a>
  if(neg)
     a42:	fe842783          	lw	a5,-24(s0)
     a46:	2781                	sext.w	a5,a5
     a48:	cf95                	beqz	a5,a84 <printint+0xee>
    buf[i++] = '-';
     a4a:	fec42783          	lw	a5,-20(s0)
     a4e:	0017871b          	addiw	a4,a5,1
     a52:	fee42623          	sw	a4,-20(s0)
     a56:	ff040713          	addi	a4,s0,-16
     a5a:	97ba                	add	a5,a5,a4
     a5c:	02d00713          	li	a4,45
     a60:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     a64:	a005                	j	a84 <printint+0xee>
    putc(fd, buf[i]);
     a66:	fec42783          	lw	a5,-20(s0)
     a6a:	ff040713          	addi	a4,s0,-16
     a6e:	97ba                	add	a5,a5,a4
     a70:	fe07c703          	lbu	a4,-32(a5)
     a74:	fcc42783          	lw	a5,-52(s0)
     a78:	85ba                	mv	a1,a4
     a7a:	853e                	mv	a0,a5
     a7c:	00000097          	auipc	ra,0x0
     a80:	ee4080e7          	jalr	-284(ra) # 960 <putc>
  while(--i >= 0)
     a84:	fec42783          	lw	a5,-20(s0)
     a88:	37fd                	addiw	a5,a5,-1
     a8a:	fef42623          	sw	a5,-20(s0)
     a8e:	fec42783          	lw	a5,-20(s0)
     a92:	2781                	sext.w	a5,a5
     a94:	fc07d9e3          	bgez	a5,a66 <printint+0xd0>
}
     a98:	0001                	nop
     a9a:	0001                	nop
     a9c:	70e2                	ld	ra,56(sp)
     a9e:	7442                	ld	s0,48(sp)
     aa0:	6121                	addi	sp,sp,64
     aa2:	8082                	ret

0000000000000aa4 <printptr>:

static void
printptr(int fd, uint64 x) {
     aa4:	7179                	addi	sp,sp,-48
     aa6:	f406                	sd	ra,40(sp)
     aa8:	f022                	sd	s0,32(sp)
     aaa:	1800                	addi	s0,sp,48
     aac:	87aa                	mv	a5,a0
     aae:	fcb43823          	sd	a1,-48(s0)
     ab2:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     ab6:	fdc42783          	lw	a5,-36(s0)
     aba:	03000593          	li	a1,48
     abe:	853e                	mv	a0,a5
     ac0:	00000097          	auipc	ra,0x0
     ac4:	ea0080e7          	jalr	-352(ra) # 960 <putc>
  putc(fd, 'x');
     ac8:	fdc42783          	lw	a5,-36(s0)
     acc:	07800593          	li	a1,120
     ad0:	853e                	mv	a0,a5
     ad2:	00000097          	auipc	ra,0x0
     ad6:	e8e080e7          	jalr	-370(ra) # 960 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     ada:	fe042623          	sw	zero,-20(s0)
     ade:	a82d                	j	b18 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     ae0:	fd043783          	ld	a5,-48(s0)
     ae4:	93f1                	srli	a5,a5,0x3c
     ae6:	00002717          	auipc	a4,0x2
     aea:	b8a70713          	addi	a4,a4,-1142 # 2670 <digits>
     aee:	97ba                	add	a5,a5,a4
     af0:	0007c703          	lbu	a4,0(a5)
     af4:	fdc42783          	lw	a5,-36(s0)
     af8:	85ba                	mv	a1,a4
     afa:	853e                	mv	a0,a5
     afc:	00000097          	auipc	ra,0x0
     b00:	e64080e7          	jalr	-412(ra) # 960 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     b04:	fec42783          	lw	a5,-20(s0)
     b08:	2785                	addiw	a5,a5,1
     b0a:	fef42623          	sw	a5,-20(s0)
     b0e:	fd043783          	ld	a5,-48(s0)
     b12:	0792                	slli	a5,a5,0x4
     b14:	fcf43823          	sd	a5,-48(s0)
     b18:	fec42783          	lw	a5,-20(s0)
     b1c:	873e                	mv	a4,a5
     b1e:	47bd                	li	a5,15
     b20:	fce7f0e3          	bgeu	a5,a4,ae0 <printptr+0x3c>
}
     b24:	0001                	nop
     b26:	0001                	nop
     b28:	70a2                	ld	ra,40(sp)
     b2a:	7402                	ld	s0,32(sp)
     b2c:	6145                	addi	sp,sp,48
     b2e:	8082                	ret

0000000000000b30 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     b30:	715d                	addi	sp,sp,-80
     b32:	e486                	sd	ra,72(sp)
     b34:	e0a2                	sd	s0,64(sp)
     b36:	0880                	addi	s0,sp,80
     b38:	87aa                	mv	a5,a0
     b3a:	fcb43023          	sd	a1,-64(s0)
     b3e:	fac43c23          	sd	a2,-72(s0)
     b42:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     b46:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     b4a:	fe042223          	sw	zero,-28(s0)
     b4e:	a42d                	j	d78 <vprintf+0x248>
    c = fmt[i] & 0xff;
     b50:	fe442783          	lw	a5,-28(s0)
     b54:	fc043703          	ld	a4,-64(s0)
     b58:	97ba                	add	a5,a5,a4
     b5a:	0007c783          	lbu	a5,0(a5)
     b5e:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     b62:	fe042783          	lw	a5,-32(s0)
     b66:	2781                	sext.w	a5,a5
     b68:	eb9d                	bnez	a5,b9e <vprintf+0x6e>
      if(c == '%'){
     b6a:	fdc42783          	lw	a5,-36(s0)
     b6e:	0007871b          	sext.w	a4,a5
     b72:	02500793          	li	a5,37
     b76:	00f71763          	bne	a4,a5,b84 <vprintf+0x54>
        state = '%';
     b7a:	02500793          	li	a5,37
     b7e:	fef42023          	sw	a5,-32(s0)
     b82:	a2f5                	j	d6e <vprintf+0x23e>
      } else {
        putc(fd, c);
     b84:	fdc42783          	lw	a5,-36(s0)
     b88:	0ff7f713          	andi	a4,a5,255
     b8c:	fcc42783          	lw	a5,-52(s0)
     b90:	85ba                	mv	a1,a4
     b92:	853e                	mv	a0,a5
     b94:	00000097          	auipc	ra,0x0
     b98:	dcc080e7          	jalr	-564(ra) # 960 <putc>
     b9c:	aac9                	j	d6e <vprintf+0x23e>
      }
    } else if(state == '%'){
     b9e:	fe042783          	lw	a5,-32(s0)
     ba2:	0007871b          	sext.w	a4,a5
     ba6:	02500793          	li	a5,37
     baa:	1cf71263          	bne	a4,a5,d6e <vprintf+0x23e>
      if(c == 'd'){
     bae:	fdc42783          	lw	a5,-36(s0)
     bb2:	0007871b          	sext.w	a4,a5
     bb6:	06400793          	li	a5,100
     bba:	02f71463          	bne	a4,a5,be2 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     bbe:	fb843783          	ld	a5,-72(s0)
     bc2:	00878713          	addi	a4,a5,8
     bc6:	fae43c23          	sd	a4,-72(s0)
     bca:	4398                	lw	a4,0(a5)
     bcc:	fcc42783          	lw	a5,-52(s0)
     bd0:	4685                	li	a3,1
     bd2:	4629                	li	a2,10
     bd4:	85ba                	mv	a1,a4
     bd6:	853e                	mv	a0,a5
     bd8:	00000097          	auipc	ra,0x0
     bdc:	dbe080e7          	jalr	-578(ra) # 996 <printint>
     be0:	a269                	j	d6a <vprintf+0x23a>
      } else if(c == 'l') {
     be2:	fdc42783          	lw	a5,-36(s0)
     be6:	0007871b          	sext.w	a4,a5
     bea:	06c00793          	li	a5,108
     bee:	02f71663          	bne	a4,a5,c1a <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     bf2:	fb843783          	ld	a5,-72(s0)
     bf6:	00878713          	addi	a4,a5,8
     bfa:	fae43c23          	sd	a4,-72(s0)
     bfe:	639c                	ld	a5,0(a5)
     c00:	0007871b          	sext.w	a4,a5
     c04:	fcc42783          	lw	a5,-52(s0)
     c08:	4681                	li	a3,0
     c0a:	4629                	li	a2,10
     c0c:	85ba                	mv	a1,a4
     c0e:	853e                	mv	a0,a5
     c10:	00000097          	auipc	ra,0x0
     c14:	d86080e7          	jalr	-634(ra) # 996 <printint>
     c18:	aa89                	j	d6a <vprintf+0x23a>
      } else if(c == 'x') {
     c1a:	fdc42783          	lw	a5,-36(s0)
     c1e:	0007871b          	sext.w	a4,a5
     c22:	07800793          	li	a5,120
     c26:	02f71463          	bne	a4,a5,c4e <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     c2a:	fb843783          	ld	a5,-72(s0)
     c2e:	00878713          	addi	a4,a5,8
     c32:	fae43c23          	sd	a4,-72(s0)
     c36:	4398                	lw	a4,0(a5)
     c38:	fcc42783          	lw	a5,-52(s0)
     c3c:	4681                	li	a3,0
     c3e:	4641                	li	a2,16
     c40:	85ba                	mv	a1,a4
     c42:	853e                	mv	a0,a5
     c44:	00000097          	auipc	ra,0x0
     c48:	d52080e7          	jalr	-686(ra) # 996 <printint>
     c4c:	aa39                	j	d6a <vprintf+0x23a>
      } else if(c == 'p') {
     c4e:	fdc42783          	lw	a5,-36(s0)
     c52:	0007871b          	sext.w	a4,a5
     c56:	07000793          	li	a5,112
     c5a:	02f71263          	bne	a4,a5,c7e <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     c5e:	fb843783          	ld	a5,-72(s0)
     c62:	00878713          	addi	a4,a5,8
     c66:	fae43c23          	sd	a4,-72(s0)
     c6a:	6398                	ld	a4,0(a5)
     c6c:	fcc42783          	lw	a5,-52(s0)
     c70:	85ba                	mv	a1,a4
     c72:	853e                	mv	a0,a5
     c74:	00000097          	auipc	ra,0x0
     c78:	e30080e7          	jalr	-464(ra) # aa4 <printptr>
     c7c:	a0fd                	j	d6a <vprintf+0x23a>
      } else if(c == 's'){
     c7e:	fdc42783          	lw	a5,-36(s0)
     c82:	0007871b          	sext.w	a4,a5
     c86:	07300793          	li	a5,115
     c8a:	04f71c63          	bne	a4,a5,ce2 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     c8e:	fb843783          	ld	a5,-72(s0)
     c92:	00878713          	addi	a4,a5,8
     c96:	fae43c23          	sd	a4,-72(s0)
     c9a:	639c                	ld	a5,0(a5)
     c9c:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     ca0:	fe843783          	ld	a5,-24(s0)
     ca4:	eb8d                	bnez	a5,cd6 <vprintf+0x1a6>
          s = "(null)";
     ca6:	00001797          	auipc	a5,0x1
     caa:	74a78793          	addi	a5,a5,1866 # 23f0 <schedule_edf_cbs+0x50c>
     cae:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     cb2:	a015                	j	cd6 <vprintf+0x1a6>
          putc(fd, *s);
     cb4:	fe843783          	ld	a5,-24(s0)
     cb8:	0007c703          	lbu	a4,0(a5)
     cbc:	fcc42783          	lw	a5,-52(s0)
     cc0:	85ba                	mv	a1,a4
     cc2:	853e                	mv	a0,a5
     cc4:	00000097          	auipc	ra,0x0
     cc8:	c9c080e7          	jalr	-868(ra) # 960 <putc>
          s++;
     ccc:	fe843783          	ld	a5,-24(s0)
     cd0:	0785                	addi	a5,a5,1
     cd2:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     cd6:	fe843783          	ld	a5,-24(s0)
     cda:	0007c783          	lbu	a5,0(a5)
     cde:	fbf9                	bnez	a5,cb4 <vprintf+0x184>
     ce0:	a069                	j	d6a <vprintf+0x23a>
        }
      } else if(c == 'c'){
     ce2:	fdc42783          	lw	a5,-36(s0)
     ce6:	0007871b          	sext.w	a4,a5
     cea:	06300793          	li	a5,99
     cee:	02f71463          	bne	a4,a5,d16 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     cf2:	fb843783          	ld	a5,-72(s0)
     cf6:	00878713          	addi	a4,a5,8
     cfa:	fae43c23          	sd	a4,-72(s0)
     cfe:	439c                	lw	a5,0(a5)
     d00:	0ff7f713          	andi	a4,a5,255
     d04:	fcc42783          	lw	a5,-52(s0)
     d08:	85ba                	mv	a1,a4
     d0a:	853e                	mv	a0,a5
     d0c:	00000097          	auipc	ra,0x0
     d10:	c54080e7          	jalr	-940(ra) # 960 <putc>
     d14:	a899                	j	d6a <vprintf+0x23a>
      } else if(c == '%'){
     d16:	fdc42783          	lw	a5,-36(s0)
     d1a:	0007871b          	sext.w	a4,a5
     d1e:	02500793          	li	a5,37
     d22:	00f71f63          	bne	a4,a5,d40 <vprintf+0x210>
        putc(fd, c);
     d26:	fdc42783          	lw	a5,-36(s0)
     d2a:	0ff7f713          	andi	a4,a5,255
     d2e:	fcc42783          	lw	a5,-52(s0)
     d32:	85ba                	mv	a1,a4
     d34:	853e                	mv	a0,a5
     d36:	00000097          	auipc	ra,0x0
     d3a:	c2a080e7          	jalr	-982(ra) # 960 <putc>
     d3e:	a035                	j	d6a <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     d40:	fcc42783          	lw	a5,-52(s0)
     d44:	02500593          	li	a1,37
     d48:	853e                	mv	a0,a5
     d4a:	00000097          	auipc	ra,0x0
     d4e:	c16080e7          	jalr	-1002(ra) # 960 <putc>
        putc(fd, c);
     d52:	fdc42783          	lw	a5,-36(s0)
     d56:	0ff7f713          	andi	a4,a5,255
     d5a:	fcc42783          	lw	a5,-52(s0)
     d5e:	85ba                	mv	a1,a4
     d60:	853e                	mv	a0,a5
     d62:	00000097          	auipc	ra,0x0
     d66:	bfe080e7          	jalr	-1026(ra) # 960 <putc>
      }
      state = 0;
     d6a:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     d6e:	fe442783          	lw	a5,-28(s0)
     d72:	2785                	addiw	a5,a5,1
     d74:	fef42223          	sw	a5,-28(s0)
     d78:	fe442783          	lw	a5,-28(s0)
     d7c:	fc043703          	ld	a4,-64(s0)
     d80:	97ba                	add	a5,a5,a4
     d82:	0007c783          	lbu	a5,0(a5)
     d86:	dc0795e3          	bnez	a5,b50 <vprintf+0x20>
    }
  }
}
     d8a:	0001                	nop
     d8c:	0001                	nop
     d8e:	60a6                	ld	ra,72(sp)
     d90:	6406                	ld	s0,64(sp)
     d92:	6161                	addi	sp,sp,80
     d94:	8082                	ret

0000000000000d96 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     d96:	7159                	addi	sp,sp,-112
     d98:	fc06                	sd	ra,56(sp)
     d9a:	f822                	sd	s0,48(sp)
     d9c:	0080                	addi	s0,sp,64
     d9e:	fcb43823          	sd	a1,-48(s0)
     da2:	e010                	sd	a2,0(s0)
     da4:	e414                	sd	a3,8(s0)
     da6:	e818                	sd	a4,16(s0)
     da8:	ec1c                	sd	a5,24(s0)
     daa:	03043023          	sd	a6,32(s0)
     dae:	03143423          	sd	a7,40(s0)
     db2:	87aa                	mv	a5,a0
     db4:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     db8:	03040793          	addi	a5,s0,48
     dbc:	fcf43423          	sd	a5,-56(s0)
     dc0:	fc843783          	ld	a5,-56(s0)
     dc4:	fd078793          	addi	a5,a5,-48
     dc8:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     dcc:	fe843703          	ld	a4,-24(s0)
     dd0:	fdc42783          	lw	a5,-36(s0)
     dd4:	863a                	mv	a2,a4
     dd6:	fd043583          	ld	a1,-48(s0)
     dda:	853e                	mv	a0,a5
     ddc:	00000097          	auipc	ra,0x0
     de0:	d54080e7          	jalr	-684(ra) # b30 <vprintf>
}
     de4:	0001                	nop
     de6:	70e2                	ld	ra,56(sp)
     de8:	7442                	ld	s0,48(sp)
     dea:	6165                	addi	sp,sp,112
     dec:	8082                	ret

0000000000000dee <printf>:

void
printf(const char *fmt, ...)
{
     dee:	7159                	addi	sp,sp,-112
     df0:	f406                	sd	ra,40(sp)
     df2:	f022                	sd	s0,32(sp)
     df4:	1800                	addi	s0,sp,48
     df6:	fca43c23          	sd	a0,-40(s0)
     dfa:	e40c                	sd	a1,8(s0)
     dfc:	e810                	sd	a2,16(s0)
     dfe:	ec14                	sd	a3,24(s0)
     e00:	f018                	sd	a4,32(s0)
     e02:	f41c                	sd	a5,40(s0)
     e04:	03043823          	sd	a6,48(s0)
     e08:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     e0c:	04040793          	addi	a5,s0,64
     e10:	fcf43823          	sd	a5,-48(s0)
     e14:	fd043783          	ld	a5,-48(s0)
     e18:	fc878793          	addi	a5,a5,-56
     e1c:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     e20:	fe843783          	ld	a5,-24(s0)
     e24:	863e                	mv	a2,a5
     e26:	fd843583          	ld	a1,-40(s0)
     e2a:	4505                	li	a0,1
     e2c:	00000097          	auipc	ra,0x0
     e30:	d04080e7          	jalr	-764(ra) # b30 <vprintf>
}
     e34:	0001                	nop
     e36:	70a2                	ld	ra,40(sp)
     e38:	7402                	ld	s0,32(sp)
     e3a:	6165                	addi	sp,sp,112
     e3c:	8082                	ret

0000000000000e3e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     e3e:	7179                	addi	sp,sp,-48
     e40:	f422                	sd	s0,40(sp)
     e42:	1800                	addi	s0,sp,48
     e44:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     e48:	fd843783          	ld	a5,-40(s0)
     e4c:	17c1                	addi	a5,a5,-16
     e4e:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e52:	00002797          	auipc	a5,0x2
     e56:	c7678793          	addi	a5,a5,-906 # 2ac8 <freep>
     e5a:	639c                	ld	a5,0(a5)
     e5c:	fef43423          	sd	a5,-24(s0)
     e60:	a815                	j	e94 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     e62:	fe843783          	ld	a5,-24(s0)
     e66:	639c                	ld	a5,0(a5)
     e68:	fe843703          	ld	a4,-24(s0)
     e6c:	00f76f63          	bltu	a4,a5,e8a <free+0x4c>
     e70:	fe043703          	ld	a4,-32(s0)
     e74:	fe843783          	ld	a5,-24(s0)
     e78:	02e7eb63          	bltu	a5,a4,eae <free+0x70>
     e7c:	fe843783          	ld	a5,-24(s0)
     e80:	639c                	ld	a5,0(a5)
     e82:	fe043703          	ld	a4,-32(s0)
     e86:	02f76463          	bltu	a4,a5,eae <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e8a:	fe843783          	ld	a5,-24(s0)
     e8e:	639c                	ld	a5,0(a5)
     e90:	fef43423          	sd	a5,-24(s0)
     e94:	fe043703          	ld	a4,-32(s0)
     e98:	fe843783          	ld	a5,-24(s0)
     e9c:	fce7f3e3          	bgeu	a5,a4,e62 <free+0x24>
     ea0:	fe843783          	ld	a5,-24(s0)
     ea4:	639c                	ld	a5,0(a5)
     ea6:	fe043703          	ld	a4,-32(s0)
     eaa:	faf77ce3          	bgeu	a4,a5,e62 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     eae:	fe043783          	ld	a5,-32(s0)
     eb2:	479c                	lw	a5,8(a5)
     eb4:	1782                	slli	a5,a5,0x20
     eb6:	9381                	srli	a5,a5,0x20
     eb8:	0792                	slli	a5,a5,0x4
     eba:	fe043703          	ld	a4,-32(s0)
     ebe:	973e                	add	a4,a4,a5
     ec0:	fe843783          	ld	a5,-24(s0)
     ec4:	639c                	ld	a5,0(a5)
     ec6:	02f71763          	bne	a4,a5,ef4 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     eca:	fe043783          	ld	a5,-32(s0)
     ece:	4798                	lw	a4,8(a5)
     ed0:	fe843783          	ld	a5,-24(s0)
     ed4:	639c                	ld	a5,0(a5)
     ed6:	479c                	lw	a5,8(a5)
     ed8:	9fb9                	addw	a5,a5,a4
     eda:	0007871b          	sext.w	a4,a5
     ede:	fe043783          	ld	a5,-32(s0)
     ee2:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     ee4:	fe843783          	ld	a5,-24(s0)
     ee8:	639c                	ld	a5,0(a5)
     eea:	6398                	ld	a4,0(a5)
     eec:	fe043783          	ld	a5,-32(s0)
     ef0:	e398                	sd	a4,0(a5)
     ef2:	a039                	j	f00 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     ef4:	fe843783          	ld	a5,-24(s0)
     ef8:	6398                	ld	a4,0(a5)
     efa:	fe043783          	ld	a5,-32(s0)
     efe:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     f00:	fe843783          	ld	a5,-24(s0)
     f04:	479c                	lw	a5,8(a5)
     f06:	1782                	slli	a5,a5,0x20
     f08:	9381                	srli	a5,a5,0x20
     f0a:	0792                	slli	a5,a5,0x4
     f0c:	fe843703          	ld	a4,-24(s0)
     f10:	97ba                	add	a5,a5,a4
     f12:	fe043703          	ld	a4,-32(s0)
     f16:	02f71563          	bne	a4,a5,f40 <free+0x102>
    p->s.size += bp->s.size;
     f1a:	fe843783          	ld	a5,-24(s0)
     f1e:	4798                	lw	a4,8(a5)
     f20:	fe043783          	ld	a5,-32(s0)
     f24:	479c                	lw	a5,8(a5)
     f26:	9fb9                	addw	a5,a5,a4
     f28:	0007871b          	sext.w	a4,a5
     f2c:	fe843783          	ld	a5,-24(s0)
     f30:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     f32:	fe043783          	ld	a5,-32(s0)
     f36:	6398                	ld	a4,0(a5)
     f38:	fe843783          	ld	a5,-24(s0)
     f3c:	e398                	sd	a4,0(a5)
     f3e:	a031                	j	f4a <free+0x10c>
  } else
    p->s.ptr = bp;
     f40:	fe843783          	ld	a5,-24(s0)
     f44:	fe043703          	ld	a4,-32(s0)
     f48:	e398                	sd	a4,0(a5)
  freep = p;
     f4a:	00002797          	auipc	a5,0x2
     f4e:	b7e78793          	addi	a5,a5,-1154 # 2ac8 <freep>
     f52:	fe843703          	ld	a4,-24(s0)
     f56:	e398                	sd	a4,0(a5)
}
     f58:	0001                	nop
     f5a:	7422                	ld	s0,40(sp)
     f5c:	6145                	addi	sp,sp,48
     f5e:	8082                	ret

0000000000000f60 <morecore>:

static Header*
morecore(uint nu)
{
     f60:	7179                	addi	sp,sp,-48
     f62:	f406                	sd	ra,40(sp)
     f64:	f022                	sd	s0,32(sp)
     f66:	1800                	addi	s0,sp,48
     f68:	87aa                	mv	a5,a0
     f6a:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     f6e:	fdc42783          	lw	a5,-36(s0)
     f72:	0007871b          	sext.w	a4,a5
     f76:	6785                	lui	a5,0x1
     f78:	00f77563          	bgeu	a4,a5,f82 <morecore+0x22>
    nu = 4096;
     f7c:	6785                	lui	a5,0x1
     f7e:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     f82:	fdc42783          	lw	a5,-36(s0)
     f86:	0047979b          	slliw	a5,a5,0x4
     f8a:	2781                	sext.w	a5,a5
     f8c:	2781                	sext.w	a5,a5
     f8e:	853e                	mv	a0,a5
     f90:	00000097          	auipc	ra,0x0
     f94:	9a0080e7          	jalr	-1632(ra) # 930 <sbrk>
     f98:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     f9c:	fe843703          	ld	a4,-24(s0)
     fa0:	57fd                	li	a5,-1
     fa2:	00f71463          	bne	a4,a5,faa <morecore+0x4a>
    return 0;
     fa6:	4781                	li	a5,0
     fa8:	a03d                	j	fd6 <morecore+0x76>
  hp = (Header*)p;
     faa:	fe843783          	ld	a5,-24(s0)
     fae:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     fb2:	fe043783          	ld	a5,-32(s0)
     fb6:	fdc42703          	lw	a4,-36(s0)
     fba:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     fbc:	fe043783          	ld	a5,-32(s0)
     fc0:	07c1                	addi	a5,a5,16
     fc2:	853e                	mv	a0,a5
     fc4:	00000097          	auipc	ra,0x0
     fc8:	e7a080e7          	jalr	-390(ra) # e3e <free>
  return freep;
     fcc:	00002797          	auipc	a5,0x2
     fd0:	afc78793          	addi	a5,a5,-1284 # 2ac8 <freep>
     fd4:	639c                	ld	a5,0(a5)
}
     fd6:	853e                	mv	a0,a5
     fd8:	70a2                	ld	ra,40(sp)
     fda:	7402                	ld	s0,32(sp)
     fdc:	6145                	addi	sp,sp,48
     fde:	8082                	ret

0000000000000fe0 <malloc>:

void*
malloc(uint nbytes)
{
     fe0:	7139                	addi	sp,sp,-64
     fe2:	fc06                	sd	ra,56(sp)
     fe4:	f822                	sd	s0,48(sp)
     fe6:	0080                	addi	s0,sp,64
     fe8:	87aa                	mv	a5,a0
     fea:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fee:	fcc46783          	lwu	a5,-52(s0)
     ff2:	07bd                	addi	a5,a5,15
     ff4:	8391                	srli	a5,a5,0x4
     ff6:	2781                	sext.w	a5,a5
     ff8:	2785                	addiw	a5,a5,1
     ffa:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     ffe:	00002797          	auipc	a5,0x2
    1002:	aca78793          	addi	a5,a5,-1334 # 2ac8 <freep>
    1006:	639c                	ld	a5,0(a5)
    1008:	fef43023          	sd	a5,-32(s0)
    100c:	fe043783          	ld	a5,-32(s0)
    1010:	ef95                	bnez	a5,104c <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    1012:	00002797          	auipc	a5,0x2
    1016:	aa678793          	addi	a5,a5,-1370 # 2ab8 <base>
    101a:	fef43023          	sd	a5,-32(s0)
    101e:	00002797          	auipc	a5,0x2
    1022:	aaa78793          	addi	a5,a5,-1366 # 2ac8 <freep>
    1026:	fe043703          	ld	a4,-32(s0)
    102a:	e398                	sd	a4,0(a5)
    102c:	00002797          	auipc	a5,0x2
    1030:	a9c78793          	addi	a5,a5,-1380 # 2ac8 <freep>
    1034:	6398                	ld	a4,0(a5)
    1036:	00002797          	auipc	a5,0x2
    103a:	a8278793          	addi	a5,a5,-1406 # 2ab8 <base>
    103e:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    1040:	00002797          	auipc	a5,0x2
    1044:	a7878793          	addi	a5,a5,-1416 # 2ab8 <base>
    1048:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    104c:	fe043783          	ld	a5,-32(s0)
    1050:	639c                	ld	a5,0(a5)
    1052:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1056:	fe843783          	ld	a5,-24(s0)
    105a:	4798                	lw	a4,8(a5)
    105c:	fdc42783          	lw	a5,-36(s0)
    1060:	2781                	sext.w	a5,a5
    1062:	06f76863          	bltu	a4,a5,10d2 <malloc+0xf2>
      if(p->s.size == nunits)
    1066:	fe843783          	ld	a5,-24(s0)
    106a:	4798                	lw	a4,8(a5)
    106c:	fdc42783          	lw	a5,-36(s0)
    1070:	2781                	sext.w	a5,a5
    1072:	00e79963          	bne	a5,a4,1084 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    1076:	fe843783          	ld	a5,-24(s0)
    107a:	6398                	ld	a4,0(a5)
    107c:	fe043783          	ld	a5,-32(s0)
    1080:	e398                	sd	a4,0(a5)
    1082:	a82d                	j	10bc <malloc+0xdc>
      else {
        p->s.size -= nunits;
    1084:	fe843783          	ld	a5,-24(s0)
    1088:	4798                	lw	a4,8(a5)
    108a:	fdc42783          	lw	a5,-36(s0)
    108e:	40f707bb          	subw	a5,a4,a5
    1092:	0007871b          	sext.w	a4,a5
    1096:	fe843783          	ld	a5,-24(s0)
    109a:	c798                	sw	a4,8(a5)
        p += p->s.size;
    109c:	fe843783          	ld	a5,-24(s0)
    10a0:	479c                	lw	a5,8(a5)
    10a2:	1782                	slli	a5,a5,0x20
    10a4:	9381                	srli	a5,a5,0x20
    10a6:	0792                	slli	a5,a5,0x4
    10a8:	fe843703          	ld	a4,-24(s0)
    10ac:	97ba                	add	a5,a5,a4
    10ae:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    10b2:	fe843783          	ld	a5,-24(s0)
    10b6:	fdc42703          	lw	a4,-36(s0)
    10ba:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    10bc:	00002797          	auipc	a5,0x2
    10c0:	a0c78793          	addi	a5,a5,-1524 # 2ac8 <freep>
    10c4:	fe043703          	ld	a4,-32(s0)
    10c8:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    10ca:	fe843783          	ld	a5,-24(s0)
    10ce:	07c1                	addi	a5,a5,16
    10d0:	a091                	j	1114 <malloc+0x134>
    }
    if(p == freep)
    10d2:	00002797          	auipc	a5,0x2
    10d6:	9f678793          	addi	a5,a5,-1546 # 2ac8 <freep>
    10da:	639c                	ld	a5,0(a5)
    10dc:	fe843703          	ld	a4,-24(s0)
    10e0:	02f71063          	bne	a4,a5,1100 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    10e4:	fdc42783          	lw	a5,-36(s0)
    10e8:	853e                	mv	a0,a5
    10ea:	00000097          	auipc	ra,0x0
    10ee:	e76080e7          	jalr	-394(ra) # f60 <morecore>
    10f2:	fea43423          	sd	a0,-24(s0)
    10f6:	fe843783          	ld	a5,-24(s0)
    10fa:	e399                	bnez	a5,1100 <malloc+0x120>
        return 0;
    10fc:	4781                	li	a5,0
    10fe:	a819                	j	1114 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1100:	fe843783          	ld	a5,-24(s0)
    1104:	fef43023          	sd	a5,-32(s0)
    1108:	fe843783          	ld	a5,-24(s0)
    110c:	639c                	ld	a5,0(a5)
    110e:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1112:	b791                	j	1056 <malloc+0x76>
  }
}
    1114:	853e                	mv	a0,a5
    1116:	70e2                	ld	ra,56(sp)
    1118:	7442                	ld	s0,48(sp)
    111a:	6121                	addi	sp,sp,64
    111c:	8082                	ret

000000000000111e <setjmp>:
    111e:	e100                	sd	s0,0(a0)
    1120:	e504                	sd	s1,8(a0)
    1122:	01253823          	sd	s2,16(a0)
    1126:	01353c23          	sd	s3,24(a0)
    112a:	03453023          	sd	s4,32(a0)
    112e:	03553423          	sd	s5,40(a0)
    1132:	03653823          	sd	s6,48(a0)
    1136:	03753c23          	sd	s7,56(a0)
    113a:	05853023          	sd	s8,64(a0)
    113e:	05953423          	sd	s9,72(a0)
    1142:	05a53823          	sd	s10,80(a0)
    1146:	05b53c23          	sd	s11,88(a0)
    114a:	06153023          	sd	ra,96(a0)
    114e:	06253423          	sd	sp,104(a0)
    1152:	4501                	li	a0,0
    1154:	8082                	ret

0000000000001156 <longjmp>:
    1156:	6100                	ld	s0,0(a0)
    1158:	6504                	ld	s1,8(a0)
    115a:	01053903          	ld	s2,16(a0)
    115e:	01853983          	ld	s3,24(a0)
    1162:	02053a03          	ld	s4,32(a0)
    1166:	02853a83          	ld	s5,40(a0)
    116a:	03053b03          	ld	s6,48(a0)
    116e:	03853b83          	ld	s7,56(a0)
    1172:	04053c03          	ld	s8,64(a0)
    1176:	04853c83          	ld	s9,72(a0)
    117a:	05053d03          	ld	s10,80(a0)
    117e:	05853d83          	ld	s11,88(a0)
    1182:	06053083          	ld	ra,96(a0)
    1186:	06853103          	ld	sp,104(a0)
    118a:	c199                	beqz	a1,1190 <longjmp_1>
    118c:	852e                	mv	a0,a1
    118e:	8082                	ret

0000000000001190 <longjmp_1>:
    1190:	4505                	li	a0,1
    1192:	8082                	ret

0000000000001194 <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
    1194:	7179                	addi	sp,sp,-48
    1196:	f422                	sd	s0,40(sp)
    1198:	1800                	addi	s0,sp,48
    119a:	fea43423          	sd	a0,-24(s0)
    119e:	feb43023          	sd	a1,-32(s0)
    11a2:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
    11a6:	fd843783          	ld	a5,-40(s0)
    11aa:	fe843703          	ld	a4,-24(s0)
    11ae:	e798                	sd	a4,8(a5)
     new_entry->next = next;
    11b0:	fe843783          	ld	a5,-24(s0)
    11b4:	fd843703          	ld	a4,-40(s0)
    11b8:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
    11ba:	fe843783          	ld	a5,-24(s0)
    11be:	fe043703          	ld	a4,-32(s0)
    11c2:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
    11c4:	fe043783          	ld	a5,-32(s0)
    11c8:	fe843703          	ld	a4,-24(s0)
    11cc:	e398                	sd	a4,0(a5)
 }
    11ce:	0001                	nop
    11d0:	7422                	ld	s0,40(sp)
    11d2:	6145                	addi	sp,sp,48
    11d4:	8082                	ret

00000000000011d6 <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
    11d6:	1101                	addi	sp,sp,-32
    11d8:	ec06                	sd	ra,24(sp)
    11da:	e822                	sd	s0,16(sp)
    11dc:	1000                	addi	s0,sp,32
    11de:	fea43423          	sd	a0,-24(s0)
    11e2:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
    11e6:	fe043783          	ld	a5,-32(s0)
    11ea:	679c                	ld	a5,8(a5)
    11ec:	fe043603          	ld	a2,-32(s0)
    11f0:	85be                	mv	a1,a5
    11f2:	fe843503          	ld	a0,-24(s0)
    11f6:	00000097          	auipc	ra,0x0
    11fa:	f9e080e7          	jalr	-98(ra) # 1194 <__list_add>
 }
    11fe:	0001                	nop
    1200:	60e2                	ld	ra,24(sp)
    1202:	6442                	ld	s0,16(sp)
    1204:	6105                	addi	sp,sp,32
    1206:	8082                	ret

0000000000001208 <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
    1208:	1101                	addi	sp,sp,-32
    120a:	ec22                	sd	s0,24(sp)
    120c:	1000                	addi	s0,sp,32
    120e:	fea43423          	sd	a0,-24(s0)
    1212:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
    1216:	fe043783          	ld	a5,-32(s0)
    121a:	fe843703          	ld	a4,-24(s0)
    121e:	e798                	sd	a4,8(a5)
     prev->next = next;
    1220:	fe843783          	ld	a5,-24(s0)
    1224:	fe043703          	ld	a4,-32(s0)
    1228:	e398                	sd	a4,0(a5)
 }
    122a:	0001                	nop
    122c:	6462                	ld	s0,24(sp)
    122e:	6105                	addi	sp,sp,32
    1230:	8082                	ret

0000000000001232 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
    1232:	1101                	addi	sp,sp,-32
    1234:	ec06                	sd	ra,24(sp)
    1236:	e822                	sd	s0,16(sp)
    1238:	1000                	addi	s0,sp,32
    123a:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
    123e:	fe843783          	ld	a5,-24(s0)
    1242:	6798                	ld	a4,8(a5)
    1244:	fe843783          	ld	a5,-24(s0)
    1248:	639c                	ld	a5,0(a5)
    124a:	85be                	mv	a1,a5
    124c:	853a                	mv	a0,a4
    124e:	00000097          	auipc	ra,0x0
    1252:	fba080e7          	jalr	-70(ra) # 1208 <__list_del>
     entry->next = LIST_POISON1;
    1256:	fe843783          	ld	a5,-24(s0)
    125a:	00100737          	lui	a4,0x100
    125e:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd290>
    1262:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
    1264:	fe843783          	ld	a5,-24(s0)
    1268:	00200737          	lui	a4,0x200
    126c:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd390>
    1270:	e798                	sd	a4,8(a5)
 }
    1272:	0001                	nop
    1274:	60e2                	ld	ra,24(sp)
    1276:	6442                	ld	s0,16(sp)
    1278:	6105                	addi	sp,sp,32
    127a:	8082                	ret

000000000000127c <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
    127c:	1101                	addi	sp,sp,-32
    127e:	ec22                	sd	s0,24(sp)
    1280:	1000                	addi	s0,sp,32
    1282:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
    1286:	fe843783          	ld	a5,-24(s0)
    128a:	639c                	ld	a5,0(a5)
    128c:	fe843703          	ld	a4,-24(s0)
    1290:	40f707b3          	sub	a5,a4,a5
    1294:	0017b793          	seqz	a5,a5
    1298:	0ff7f793          	andi	a5,a5,255
    129c:	2781                	sext.w	a5,a5
 }
    129e:	853e                	mv	a0,a5
    12a0:	6462                	ld	s0,24(sp)
    12a2:	6105                	addi	sp,sp,32
    12a4:	8082                	ret

00000000000012a6 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
    12a6:	715d                	addi	sp,sp,-80
    12a8:	e486                	sd	ra,72(sp)
    12aa:	e0a2                	sd	s0,64(sp)
    12ac:	0880                	addi	s0,sp,80
    12ae:	fca43423          	sd	a0,-56(s0)
    12b2:	fcb43023          	sd	a1,-64(s0)
    12b6:	85b2                	mv	a1,a2
    12b8:	8636                	mv	a2,a3
    12ba:	86ba                	mv	a3,a4
    12bc:	873e                	mv	a4,a5
    12be:	87ae                	mv	a5,a1
    12c0:	faf42e23          	sw	a5,-68(s0)
    12c4:	87b2                	mv	a5,a2
    12c6:	faf42c23          	sw	a5,-72(s0)
    12ca:	87b6                	mv	a5,a3
    12cc:	faf42a23          	sw	a5,-76(s0)
    12d0:	87ba                	mv	a5,a4
    12d2:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
    12d6:	08000513          	li	a0,128
    12da:	00000097          	auipc	ra,0x0
    12de:	d06080e7          	jalr	-762(ra) # fe0 <malloc>
    12e2:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
    12e6:	6505                	lui	a0,0x1
    12e8:	00000097          	auipc	ra,0x0
    12ec:	cf8080e7          	jalr	-776(ra) # fe0 <malloc>
    12f0:	87aa                	mv	a5,a0
    12f2:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
    12f6:	fe043703          	ld	a4,-32(s0)
    12fa:	6785                	lui	a5,0x1
    12fc:	17c1                	addi	a5,a5,-16
    12fe:	97ba                	add	a5,a5,a4
    1300:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
    1304:	fe843783          	ld	a5,-24(s0)
    1308:	fc843703          	ld	a4,-56(s0)
    130c:	e398                	sd	a4,0(a5)
    t->arg = arg;
    130e:	fe843783          	ld	a5,-24(s0)
    1312:	fc043703          	ld	a4,-64(s0)
    1316:	e798                	sd	a4,8(a5)
    t->ID = _id++;
    1318:	00001797          	auipc	a5,0x1
    131c:	39478793          	addi	a5,a5,916 # 26ac <_id.1241>
    1320:	439c                	lw	a5,0(a5)
    1322:	0017871b          	addiw	a4,a5,1
    1326:	0007069b          	sext.w	a3,a4
    132a:	00001717          	auipc	a4,0x1
    132e:	38270713          	addi	a4,a4,898 # 26ac <_id.1241>
    1332:	c314                	sw	a3,0(a4)
    1334:	fe843703          	ld	a4,-24(s0)
    1338:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    133a:	fe843783          	ld	a5,-24(s0)
    133e:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    1342:	fe043703          	ld	a4,-32(s0)
    1346:	fe843783          	ld	a5,-24(s0)
    134a:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    134c:	fd843703          	ld	a4,-40(s0)
    1350:	fe843783          	ld	a5,-24(s0)
    1354:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    1356:	fe843783          	ld	a5,-24(s0)
    135a:	fb842703          	lw	a4,-72(s0)
    135e:	c3f8                	sw	a4,68(a5)
    t->period = period;
    1360:	fe843783          	ld	a5,-24(s0)
    1364:	fb442703          	lw	a4,-76(s0)
    1368:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
    136a:	fe843783          	ld	a5,-24(s0)
    136e:	fb442703          	lw	a4,-76(s0)
    1372:	c7b8                	sw	a4,72(a5)
    t->n = n;
    1374:	fe843783          	ld	a5,-24(s0)
    1378:	fb042703          	lw	a4,-80(s0)
    137c:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    137e:	fe843783          	ld	a5,-24(s0)
    1382:	fbc42703          	lw	a4,-68(s0)
    1386:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    1388:	fe843783          	ld	a5,-24(s0)
    138c:	fb842703          	lw	a4,-72(s0)
    1390:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    1392:	fe843783          	ld	a5,-24(s0)
    1396:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    139a:	fe843783          	ld	a5,-24(s0)
    139e:	06400713          	li	a4,100
    13a2:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    13a4:	fe843783          	ld	a5,-24(s0)
    13a8:	671d                	lui	a4,0x7
    13aa:	5307071b          	addiw	a4,a4,1328
    13ae:	d3b8                	sw	a4,96(a5)
    
    return t;
    13b0:	fe843783          	ld	a5,-24(s0)
}
    13b4:	853e                	mv	a0,a5
    13b6:	60a6                	ld	ra,72(sp)
    13b8:	6406                	ld	s0,64(sp)
    13ba:	6161                	addi	sp,sp,80
    13bc:	8082                	ret

00000000000013be <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    13be:	1101                	addi	sp,sp,-32
    13c0:	ec22                	sd	s0,24(sp)
    13c2:	1000                	addi	s0,sp,32
    13c4:	fea43423          	sd	a0,-24(s0)
    13c8:	87ae                	mv	a5,a1
    13ca:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    13ce:	fe843783          	ld	a5,-24(s0)
    13d2:	fe442703          	lw	a4,-28(s0)
    13d6:	cff8                	sw	a4,92(a5)
}
    13d8:	0001                	nop
    13da:	6462                	ld	s0,24(sp)
    13dc:	6105                	addi	sp,sp,32
    13de:	8082                	ret

00000000000013e0 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    13e0:	1101                	addi	sp,sp,-32
    13e2:	ec22                	sd	s0,24(sp)
    13e4:	1000                	addi	s0,sp,32
    13e6:	fea43423          	sd	a0,-24(s0)
    13ea:	87ae                	mv	a5,a1
    13ec:	8732                	mv	a4,a2
    13ee:	fef42223          	sw	a5,-28(s0)
    13f2:	87ba                	mv	a5,a4
    13f4:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    13f8:	fe843783          	ld	a5,-24(s0)
    13fc:	fe442703          	lw	a4,-28(s0)
    1400:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    1402:	fe843783          	ld	a5,-24(s0)
    1406:	fe442703          	lw	a4,-28(s0)
    140a:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    140c:	fe843783          	ld	a5,-24(s0)
    1410:	fe042703          	lw	a4,-32(s0)
    1414:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    1416:	fe843783          	ld	a5,-24(s0)
    141a:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    141e:	fe843783          	ld	a5,-24(s0)
    1422:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    1426:	fe843783          	ld	a5,-24(s0)
    142a:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    142e:	fe843783          	ld	a5,-24(s0)
    1432:	0607ae23          	sw	zero,124(a5)
}
    1436:	0001                	nop
    1438:	6462                	ld	s0,24(sp)
    143a:	6105                	addi	sp,sp,32
    143c:	8082                	ret

000000000000143e <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    143e:	7179                	addi	sp,sp,-48
    1440:	f406                	sd	ra,40(sp)
    1442:	f022                	sd	s0,32(sp)
    1444:	1800                	addi	s0,sp,48
    1446:	fca43c23          	sd	a0,-40(s0)
    144a:	87ae                	mv	a5,a1
    144c:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    1450:	02000513          	li	a0,32
    1454:	00000097          	auipc	ra,0x0
    1458:	b8c080e7          	jalr	-1140(ra) # fe0 <malloc>
    145c:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    1460:	fe843783          	ld	a5,-24(s0)
    1464:	fd843703          	ld	a4,-40(s0)
    1468:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    146a:	fe843783          	ld	a5,-24(s0)
    146e:	fd442703          	lw	a4,-44(s0)
    1472:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    1474:	fd843783          	ld	a5,-40(s0)
    1478:	fd442703          	lw	a4,-44(s0)
    147c:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    147e:	fd843783          	ld	a5,-40(s0)
    1482:	43bc                	lw	a5,64(a5)
    1484:	cf81                	beqz	a5,149c <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    1486:	fd843783          	ld	a5,-40(s0)
    148a:	47bc                	lw	a5,72(a5)
    148c:	fd442703          	lw	a4,-44(s0)
    1490:	9fb9                	addw	a5,a5,a4
    1492:	0007871b          	sext.w	a4,a5
    1496:	fd843783          	ld	a5,-40(s0)
    149a:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    149c:	fe843783          	ld	a5,-24(s0)
    14a0:	07a1                	addi	a5,a5,8
    14a2:	00001597          	auipc	a1,0x1
    14a6:	1f658593          	addi	a1,a1,502 # 2698 <release_queue>
    14aa:	853e                	mv	a0,a5
    14ac:	00000097          	auipc	ra,0x0
    14b0:	d2a080e7          	jalr	-726(ra) # 11d6 <list_add_tail>
}
    14b4:	0001                	nop
    14b6:	70a2                	ld	ra,40(sp)
    14b8:	7402                	ld	s0,32(sp)
    14ba:	6145                	addi	sp,sp,48
    14bc:	8082                	ret

00000000000014be <__release>:

void __release()
{
    14be:	7139                	addi	sp,sp,-64
    14c0:	fc06                	sd	ra,56(sp)
    14c2:	f822                	sd	s0,48(sp)
    14c4:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    14c6:	00001797          	auipc	a5,0x1
    14ca:	1d278793          	addi	a5,a5,466 # 2698 <release_queue>
    14ce:	639c                	ld	a5,0(a5)
    14d0:	fcf43c23          	sd	a5,-40(s0)
    14d4:	fd843783          	ld	a5,-40(s0)
    14d8:	17e1                	addi	a5,a5,-8
    14da:	fef43423          	sd	a5,-24(s0)
    14de:	fe843783          	ld	a5,-24(s0)
    14e2:	679c                	ld	a5,8(a5)
    14e4:	fcf43823          	sd	a5,-48(s0)
    14e8:	fd043783          	ld	a5,-48(s0)
    14ec:	17e1                	addi	a5,a5,-8
    14ee:	fef43023          	sd	a5,-32(s0)
    14f2:	a0e9                	j	15bc <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    14f4:	fe843783          	ld	a5,-24(s0)
    14f8:	4f98                	lw	a4,24(a5)
    14fa:	00001797          	auipc	a5,0x1
    14fe:	5de78793          	addi	a5,a5,1502 # 2ad8 <threading_system_time>
    1502:	439c                	lw	a5,0(a5)
    1504:	08e7ce63          	blt	a5,a4,15a0 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    1508:	fe843783          	ld	a5,-24(s0)
    150c:	639c                	ld	a5,0(a5)
    150e:	5bbc                	lw	a5,112(a5)
    1510:	c79d                	beqz	a5,153e <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    1512:	fe843783          	ld	a5,-24(s0)
    1516:	639c                	ld	a5,0(a5)
    1518:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    151c:	fe843783          	ld	a5,-24(s0)
    1520:	6398                	ld	a4,0(a5)
    1522:	fe843783          	ld	a5,-24(s0)
    1526:	639c                	ld	a5,0(a5)
    1528:	5378                	lw	a4,100(a4)
    152a:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    152c:	fe843783          	ld	a5,-24(s0)
    1530:	6398                	ld	a4,0(a5)
    1532:	fe843783          	ld	a5,-24(s0)
    1536:	639c                	ld	a5,0(a5)
    1538:	5f78                	lw	a4,124(a4)
    153a:	cbf8                	sw	a4,84(a5)
    153c:	a809                	j	154e <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    153e:	fe843783          	ld	a5,-24(s0)
    1542:	6398                	ld	a4,0(a5)
    1544:	fe843783          	ld	a5,-24(s0)
    1548:	639c                	ld	a5,0(a5)
    154a:	4378                	lw	a4,68(a4)
    154c:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    154e:	fe843783          	ld	a5,-24(s0)
    1552:	4f94                	lw	a3,24(a5)
    1554:	fe843783          	ld	a5,-24(s0)
    1558:	639c                	ld	a5,0(a5)
    155a:	47b8                	lw	a4,72(a5)
    155c:	fe843783          	ld	a5,-24(s0)
    1560:	639c                	ld	a5,0(a5)
    1562:	9f35                	addw	a4,a4,a3
    1564:	2701                	sext.w	a4,a4
    1566:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    1568:	fe843783          	ld	a5,-24(s0)
    156c:	639c                	ld	a5,0(a5)
    156e:	02878793          	addi	a5,a5,40
    1572:	00001597          	auipc	a1,0x1
    1576:	11658593          	addi	a1,a1,278 # 2688 <run_queue>
    157a:	853e                	mv	a0,a5
    157c:	00000097          	auipc	ra,0x0
    1580:	c5a080e7          	jalr	-934(ra) # 11d6 <list_add_tail>
            list_del(&cur->thread_list);
    1584:	fe843783          	ld	a5,-24(s0)
    1588:	07a1                	addi	a5,a5,8
    158a:	853e                	mv	a0,a5
    158c:	00000097          	auipc	ra,0x0
    1590:	ca6080e7          	jalr	-858(ra) # 1232 <list_del>
            free(cur);
    1594:	fe843503          	ld	a0,-24(s0)
    1598:	00000097          	auipc	ra,0x0
    159c:	8a6080e7          	jalr	-1882(ra) # e3e <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    15a0:	fe043783          	ld	a5,-32(s0)
    15a4:	fef43423          	sd	a5,-24(s0)
    15a8:	fe043783          	ld	a5,-32(s0)
    15ac:	679c                	ld	a5,8(a5)
    15ae:	fcf43423          	sd	a5,-56(s0)
    15b2:	fc843783          	ld	a5,-56(s0)
    15b6:	17e1                	addi	a5,a5,-8
    15b8:	fef43023          	sd	a5,-32(s0)
    15bc:	fe843783          	ld	a5,-24(s0)
    15c0:	00878713          	addi	a4,a5,8
    15c4:	00001797          	auipc	a5,0x1
    15c8:	0d478793          	addi	a5,a5,212 # 2698 <release_queue>
    15cc:	f2f714e3          	bne	a4,a5,14f4 <__release+0x36>
        }
    }
}
    15d0:	0001                	nop
    15d2:	0001                	nop
    15d4:	70e2                	ld	ra,56(sp)
    15d6:	7442                	ld	s0,48(sp)
    15d8:	6121                	addi	sp,sp,64
    15da:	8082                	ret

00000000000015dc <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    15dc:	1101                	addi	sp,sp,-32
    15de:	ec06                	sd	ra,24(sp)
    15e0:	e822                	sd	s0,16(sp)
    15e2:	1000                	addi	s0,sp,32
    15e4:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    15e8:	fe843783          	ld	a5,-24(s0)
    15ec:	7b98                	ld	a4,48(a5)
    15ee:	00001797          	auipc	a5,0x1
    15f2:	4e278793          	addi	a5,a5,1250 # 2ad0 <current>
    15f6:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    15f8:	fe843783          	ld	a5,-24(s0)
    15fc:	02878793          	addi	a5,a5,40
    1600:	853e                	mv	a0,a5
    1602:	00000097          	auipc	ra,0x0
    1606:	c30080e7          	jalr	-976(ra) # 1232 <list_del>

    free(to_remove->stack);
    160a:	fe843783          	ld	a5,-24(s0)
    160e:	6b9c                	ld	a5,16(a5)
    1610:	853e                	mv	a0,a5
    1612:	00000097          	auipc	ra,0x0
    1616:	82c080e7          	jalr	-2004(ra) # e3e <free>
    free(to_remove);
    161a:	fe843503          	ld	a0,-24(s0)
    161e:	00000097          	auipc	ra,0x0
    1622:	820080e7          	jalr	-2016(ra) # e3e <free>

    __schedule();
    1626:	00000097          	auipc	ra,0x0
    162a:	5e8080e7          	jalr	1512(ra) # 1c0e <__schedule>
    __dispatch();
    162e:	00000097          	auipc	ra,0x0
    1632:	416080e7          	jalr	1046(ra) # 1a44 <__dispatch>
    thrdresume(main_thrd_id);
    1636:	00001797          	auipc	a5,0x1
    163a:	07278793          	addi	a5,a5,114 # 26a8 <main_thrd_id>
    163e:	439c                	lw	a5,0(a5)
    1640:	853e                	mv	a0,a5
    1642:	fffff097          	auipc	ra,0xfffff
    1646:	30e080e7          	jalr	782(ra) # 950 <thrdresume>
}
    164a:	0001                	nop
    164c:	60e2                	ld	ra,24(sp)
    164e:	6442                	ld	s0,16(sp)
    1650:	6105                	addi	sp,sp,32
    1652:	8082                	ret

0000000000001654 <thread_exit>:

void thread_exit(void)
{
    1654:	7179                	addi	sp,sp,-48
    1656:	f406                	sd	ra,40(sp)
    1658:	f022                	sd	s0,32(sp)
    165a:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    165c:	00001797          	auipc	a5,0x1
    1660:	47478793          	addi	a5,a5,1140 # 2ad0 <current>
    1664:	6398                	ld	a4,0(a5)
    1666:	00001797          	auipc	a5,0x1
    166a:	02278793          	addi	a5,a5,34 # 2688 <run_queue>
    166e:	02f71063          	bne	a4,a5,168e <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    1672:	00001597          	auipc	a1,0x1
    1676:	d8658593          	addi	a1,a1,-634 # 23f8 <schedule_edf_cbs+0x514>
    167a:	4509                	li	a0,2
    167c:	fffff097          	auipc	ra,0xfffff
    1680:	71a080e7          	jalr	1818(ra) # d96 <fprintf>
        exit(1);
    1684:	4505                	li	a0,1
    1686:	fffff097          	auipc	ra,0xfffff
    168a:	222080e7          	jalr	546(ra) # 8a8 <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    168e:	00001797          	auipc	a5,0x1
    1692:	44278793          	addi	a5,a5,1090 # 2ad0 <current>
    1696:	639c                	ld	a5,0(a5)
    1698:	fef43423          	sd	a5,-24(s0)
    169c:	fe843783          	ld	a5,-24(s0)
    16a0:	fd878793          	addi	a5,a5,-40
    16a4:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    16a8:	fe043783          	ld	a5,-32(s0)
    16ac:	5f9c                	lw	a5,56(a5)
    16ae:	4585                	li	a1,1
    16b0:	853e                	mv	a0,a5
    16b2:	fffff097          	auipc	ra,0xfffff
    16b6:	2a6080e7          	jalr	678(ra) # 958 <cancelthrdstop>
    16ba:	87aa                	mv	a5,a0
    16bc:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    16c0:	00001797          	auipc	a5,0x1
    16c4:	41878793          	addi	a5,a5,1048 # 2ad8 <threading_system_time>
    16c8:	439c                	lw	a5,0(a5)
    16ca:	fdc42703          	lw	a4,-36(s0)
    16ce:	9fb9                	addw	a5,a5,a4
    16d0:	0007871b          	sext.w	a4,a5
    16d4:	00001797          	auipc	a5,0x1
    16d8:	40478793          	addi	a5,a5,1028 # 2ad8 <threading_system_time>
    16dc:	c398                	sw	a4,0(a5)

    __release();
    16de:	00000097          	auipc	ra,0x0
    16e2:	de0080e7          	jalr	-544(ra) # 14be <__release>
    __thread_exit(to_remove);
    16e6:	fe043503          	ld	a0,-32(s0)
    16ea:	00000097          	auipc	ra,0x0
    16ee:	ef2080e7          	jalr	-270(ra) # 15dc <__thread_exit>
}
    16f2:	0001                	nop
    16f4:	70a2                	ld	ra,40(sp)
    16f6:	7402                	ld	s0,32(sp)
    16f8:	6145                	addi	sp,sp,48
    16fa:	8082                	ret

00000000000016fc <__finish_current>:

void __finish_current()
{
    16fc:	7179                	addi	sp,sp,-48
    16fe:	f406                	sd	ra,40(sp)
    1700:	f022                	sd	s0,32(sp)
    1702:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1704:	00001797          	auipc	a5,0x1
    1708:	3cc78793          	addi	a5,a5,972 # 2ad0 <current>
    170c:	639c                	ld	a5,0(a5)
    170e:	fef43423          	sd	a5,-24(s0)
    1712:	fe843783          	ld	a5,-24(s0)
    1716:	fd878793          	addi	a5,a5,-40
    171a:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    171e:	fe043783          	ld	a5,-32(s0)
    1722:	4bbc                	lw	a5,80(a5)
    1724:	37fd                	addiw	a5,a5,-1
    1726:	0007871b          	sext.w	a4,a5
    172a:	fe043783          	ld	a5,-32(s0)
    172e:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    1730:	fe043783          	ld	a5,-32(s0)
    1734:	5fd8                	lw	a4,60(a5)
    1736:	00001797          	auipc	a5,0x1
    173a:	3a278793          	addi	a5,a5,930 # 2ad8 <threading_system_time>
    173e:	4390                	lw	a2,0(a5)
    1740:	fe043783          	ld	a5,-32(s0)
    1744:	4bbc                	lw	a5,80(a5)
    1746:	86be                	mv	a3,a5
    1748:	85ba                	mv	a1,a4
    174a:	00001517          	auipc	a0,0x1
    174e:	ce650513          	addi	a0,a0,-794 # 2430 <schedule_edf_cbs+0x54c>
    1752:	fffff097          	auipc	ra,0xfffff
    1756:	69c080e7          	jalr	1692(ra) # dee <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    175a:	fe043783          	ld	a5,-32(s0)
    175e:	4bbc                	lw	a5,80(a5)
    1760:	04f05563          	blez	a5,17aa <__finish_current+0xae>
        struct list_head *to_remove = current;
    1764:	00001797          	auipc	a5,0x1
    1768:	36c78793          	addi	a5,a5,876 # 2ad0 <current>
    176c:	639c                	ld	a5,0(a5)
    176e:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1772:	00001797          	auipc	a5,0x1
    1776:	35e78793          	addi	a5,a5,862 # 2ad0 <current>
    177a:	639c                	ld	a5,0(a5)
    177c:	6798                	ld	a4,8(a5)
    177e:	00001797          	auipc	a5,0x1
    1782:	35278793          	addi	a5,a5,850 # 2ad0 <current>
    1786:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1788:	fd843503          	ld	a0,-40(s0)
    178c:	00000097          	auipc	ra,0x0
    1790:	aa6080e7          	jalr	-1370(ra) # 1232 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    1794:	fe043783          	ld	a5,-32(s0)
    1798:	4fbc                	lw	a5,88(a5)
    179a:	85be                	mv	a1,a5
    179c:	fe043503          	ld	a0,-32(s0)
    17a0:	00000097          	auipc	ra,0x0
    17a4:	c9e080e7          	jalr	-866(ra) # 143e <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    17a8:	a039                	j	17b6 <__finish_current+0xba>
        __thread_exit(current_thread);
    17aa:	fe043503          	ld	a0,-32(s0)
    17ae:	00000097          	auipc	ra,0x0
    17b2:	e2e080e7          	jalr	-466(ra) # 15dc <__thread_exit>
}
    17b6:	0001                	nop
    17b8:	70a2                	ld	ra,40(sp)
    17ba:	7402                	ld	s0,32(sp)
    17bc:	6145                	addi	sp,sp,48
    17be:	8082                	ret

00000000000017c0 <__rt_finish_current>:
void __rt_finish_current()
{
    17c0:	7179                	addi	sp,sp,-48
    17c2:	f406                	sd	ra,40(sp)
    17c4:	f022                	sd	s0,32(sp)
    17c6:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    17c8:	00001797          	auipc	a5,0x1
    17cc:	30878793          	addi	a5,a5,776 # 2ad0 <current>
    17d0:	639c                	ld	a5,0(a5)
    17d2:	fef43423          	sd	a5,-24(s0)
    17d6:	fe843783          	ld	a5,-24(s0)
    17da:	fd878793          	addi	a5,a5,-40
    17de:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    17e2:	fe043783          	ld	a5,-32(s0)
    17e6:	4bbc                	lw	a5,80(a5)
    17e8:	37fd                	addiw	a5,a5,-1
    17ea:	0007871b          	sext.w	a4,a5
    17ee:	fe043783          	ld	a5,-32(s0)
    17f2:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    17f4:	fe043783          	ld	a5,-32(s0)
    17f8:	5fd8                	lw	a4,60(a5)
    17fa:	00001797          	auipc	a5,0x1
    17fe:	2de78793          	addi	a5,a5,734 # 2ad8 <threading_system_time>
    1802:	4390                	lw	a2,0(a5)
    1804:	fe043783          	ld	a5,-32(s0)
    1808:	4bbc                	lw	a5,80(a5)
    180a:	86be                	mv	a3,a5
    180c:	85ba                	mv	a1,a4
    180e:	00001517          	auipc	a0,0x1
    1812:	c3a50513          	addi	a0,a0,-966 # 2448 <schedule_edf_cbs+0x564>
    1816:	fffff097          	auipc	ra,0xfffff
    181a:	5d8080e7          	jalr	1496(ra) # dee <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    181e:	fe043783          	ld	a5,-32(s0)
    1822:	4bbc                	lw	a5,80(a5)
    1824:	04f05f63          	blez	a5,1882 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    1828:	00001797          	auipc	a5,0x1
    182c:	2a878793          	addi	a5,a5,680 # 2ad0 <current>
    1830:	639c                	ld	a5,0(a5)
    1832:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1836:	00001797          	auipc	a5,0x1
    183a:	29a78793          	addi	a5,a5,666 # 2ad0 <current>
    183e:	639c                	ld	a5,0(a5)
    1840:	6798                	ld	a4,8(a5)
    1842:	00001797          	auipc	a5,0x1
    1846:	28e78793          	addi	a5,a5,654 # 2ad0 <current>
    184a:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    184c:	fd843503          	ld	a0,-40(s0)
    1850:	00000097          	auipc	ra,0x0
    1854:	9e2080e7          	jalr	-1566(ra) # 1232 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    1858:	fe043783          	ld	a5,-32(s0)
    185c:	4fbc                	lw	a5,88(a5)
    185e:	85be                	mv	a1,a5
    1860:	fe043503          	ld	a0,-32(s0)
    1864:	00000097          	auipc	ra,0x0
    1868:	bda080e7          	jalr	-1062(ra) # 143e <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    186c:	fe043783          	ld	a5,-32(s0)
    1870:	57fc                	lw	a5,108(a5)
    1872:	ef91                	bnez	a5,188e <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    1874:	fe043783          	ld	a5,-32(s0)
    1878:	53f8                	lw	a4,100(a5)
    187a:	fe043783          	ld	a5,-32(s0)
    187e:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    1880:	a039                	j	188e <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    1882:	fe043503          	ld	a0,-32(s0)
    1886:	00000097          	auipc	ra,0x0
    188a:	d56080e7          	jalr	-682(ra) # 15dc <__thread_exit>
}
    188e:	0001                	nop
    1890:	70a2                	ld	ra,40(sp)
    1892:	7402                	ld	s0,32(sp)
    1894:	6145                	addi	sp,sp,48
    1896:	8082                	ret

0000000000001898 <switch_handler>:

void switch_handler(void *arg)
{
    1898:	7139                	addi	sp,sp,-64
    189a:	fc06                	sd	ra,56(sp)
    189c:	f822                	sd	s0,48(sp)
    189e:	0080                	addi	s0,sp,64
    18a0:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    18a4:	fc843783          	ld	a5,-56(s0)
    18a8:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    18ac:	00001797          	auipc	a5,0x1
    18b0:	22478793          	addi	a5,a5,548 # 2ad0 <current>
    18b4:	639c                	ld	a5,0(a5)
    18b6:	fef43023          	sd	a5,-32(s0)
    18ba:	fe043783          	ld	a5,-32(s0)
    18be:	fd878793          	addi	a5,a5,-40
    18c2:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    18c6:	fe843783          	ld	a5,-24(s0)
    18ca:	0007871b          	sext.w	a4,a5
    18ce:	00001797          	auipc	a5,0x1
    18d2:	20a78793          	addi	a5,a5,522 # 2ad8 <threading_system_time>
    18d6:	439c                	lw	a5,0(a5)
    18d8:	2781                	sext.w	a5,a5
    18da:	9fb9                	addw	a5,a5,a4
    18dc:	2781                	sext.w	a5,a5
    18de:	0007871b          	sext.w	a4,a5
    18e2:	00001797          	auipc	a5,0x1
    18e6:	1f678793          	addi	a5,a5,502 # 2ad8 <threading_system_time>
    18ea:	c398                	sw	a4,0(a5)
     __release();
    18ec:	00000097          	auipc	ra,0x0
    18f0:	bd2080e7          	jalr	-1070(ra) # 14be <__release>
    current_thread->remaining_time -= elapsed_time;
    18f4:	fd843783          	ld	a5,-40(s0)
    18f8:	4bfc                	lw	a5,84(a5)
    18fa:	0007871b          	sext.w	a4,a5
    18fe:	fe843783          	ld	a5,-24(s0)
    1902:	2781                	sext.w	a5,a5
    1904:	40f707bb          	subw	a5,a4,a5
    1908:	2781                	sext.w	a5,a5
    190a:	0007871b          	sext.w	a4,a5
    190e:	fd843783          	ld	a5,-40(s0)
    1912:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    1914:	fd843783          	ld	a5,-40(s0)
    1918:	57fc                	lw	a5,108(a5)
    191a:	e38d                	bnez	a5,193c <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    191c:	fd843783          	ld	a5,-40(s0)
    1920:	57bc                	lw	a5,104(a5)
    1922:	0007871b          	sext.w	a4,a5
    1926:	fe843783          	ld	a5,-24(s0)
    192a:	2781                	sext.w	a5,a5
    192c:	40f707bb          	subw	a5,a4,a5
    1930:	2781                	sext.w	a5,a5
    1932:	0007871b          	sext.w	a4,a5
    1936:	fd843783          	ld	a5,-40(s0)
    193a:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    193c:	fd843783          	ld	a5,-40(s0)
    1940:	43bc                	lw	a5,64(a5)
    1942:	c3ad                	beqz	a5,19a4 <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    1944:	fd843783          	ld	a5,-40(s0)
    1948:	4fb8                	lw	a4,88(a5)
    194a:	00001797          	auipc	a5,0x1
    194e:	18e78793          	addi	a5,a5,398 # 2ad8 <threading_system_time>
    1952:	439c                	lw	a5,0(a5)
    1954:	02f74163          	blt	a4,a5,1976 <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1958:	fd843783          	ld	a5,-40(s0)
    195c:	4fb8                	lw	a4,88(a5)
    195e:	00001797          	auipc	a5,0x1
    1962:	17a78793          	addi	a5,a5,378 # 2ad8 <threading_system_time>
    1966:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    1968:	02f71e63          	bne	a4,a5,19a4 <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    196c:	fd843783          	ld	a5,-40(s0)
    1970:	4bfc                	lw	a5,84(a5)
    1972:	02f05963          	blez	a5,19a4 <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    1976:	fd843783          	ld	a5,-40(s0)
    197a:	5fd8                	lw	a4,60(a5)
    197c:	00001797          	auipc	a5,0x1
    1980:	15c78793          	addi	a5,a5,348 # 2ad8 <threading_system_time>
    1984:	439c                	lw	a5,0(a5)
    1986:	863e                	mv	a2,a5
    1988:	85ba                	mv	a1,a4
    198a:	00001517          	auipc	a0,0x1
    198e:	af650513          	addi	a0,a0,-1290 # 2480 <schedule_edf_cbs+0x59c>
    1992:	fffff097          	auipc	ra,0xfffff
    1996:	45c080e7          	jalr	1116(ra) # dee <printf>
            exit(0);
    199a:	4501                	li	a0,0
    199c:	fffff097          	auipc	ra,0xfffff
    19a0:	f0c080e7          	jalr	-244(ra) # 8a8 <exit>
        }

    if (current_thread->remaining_time <= 0) {
    19a4:	fd843783          	ld	a5,-40(s0)
    19a8:	4bfc                	lw	a5,84(a5)
    19aa:	02f04063          	bgtz	a5,19ca <switch_handler+0x132>
        if (current_thread->is_real_time)
    19ae:	fd843783          	ld	a5,-40(s0)
    19b2:	43bc                	lw	a5,64(a5)
    19b4:	c791                	beqz	a5,19c0 <switch_handler+0x128>
            __rt_finish_current();
    19b6:	00000097          	auipc	ra,0x0
    19ba:	e0a080e7          	jalr	-502(ra) # 17c0 <__rt_finish_current>
    19be:	a881                	j	1a0e <switch_handler+0x176>
        else
            __finish_current();
    19c0:	00000097          	auipc	ra,0x0
    19c4:	d3c080e7          	jalr	-708(ra) # 16fc <__finish_current>
    19c8:	a099                	j	1a0e <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    19ca:	00001797          	auipc	a5,0x1
    19ce:	10678793          	addi	a5,a5,262 # 2ad0 <current>
    19d2:	639c                	ld	a5,0(a5)
    19d4:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    19d8:	00001797          	auipc	a5,0x1
    19dc:	0f878793          	addi	a5,a5,248 # 2ad0 <current>
    19e0:	639c                	ld	a5,0(a5)
    19e2:	6798                	ld	a4,8(a5)
    19e4:	00001797          	auipc	a5,0x1
    19e8:	0ec78793          	addi	a5,a5,236 # 2ad0 <current>
    19ec:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    19ee:	fd043503          	ld	a0,-48(s0)
    19f2:	00000097          	auipc	ra,0x0
    19f6:	840080e7          	jalr	-1984(ra) # 1232 <list_del>
        list_add_tail(to_remove, &run_queue);
    19fa:	00001597          	auipc	a1,0x1
    19fe:	c8e58593          	addi	a1,a1,-882 # 2688 <run_queue>
    1a02:	fd043503          	ld	a0,-48(s0)
    1a06:	fffff097          	auipc	ra,0xfffff
    1a0a:	7d0080e7          	jalr	2000(ra) # 11d6 <list_add_tail>
    }

    __release();
    1a0e:	00000097          	auipc	ra,0x0
    1a12:	ab0080e7          	jalr	-1360(ra) # 14be <__release>
    __schedule();
    1a16:	00000097          	auipc	ra,0x0
    1a1a:	1f8080e7          	jalr	504(ra) # 1c0e <__schedule>
    __dispatch();
    1a1e:	00000097          	auipc	ra,0x0
    1a22:	026080e7          	jalr	38(ra) # 1a44 <__dispatch>
    thrdresume(main_thrd_id);
    1a26:	00001797          	auipc	a5,0x1
    1a2a:	c8278793          	addi	a5,a5,-894 # 26a8 <main_thrd_id>
    1a2e:	439c                	lw	a5,0(a5)
    1a30:	853e                	mv	a0,a5
    1a32:	fffff097          	auipc	ra,0xfffff
    1a36:	f1e080e7          	jalr	-226(ra) # 950 <thrdresume>
}
    1a3a:	0001                	nop
    1a3c:	70e2                	ld	ra,56(sp)
    1a3e:	7442                	ld	s0,48(sp)
    1a40:	6121                	addi	sp,sp,64
    1a42:	8082                	ret

0000000000001a44 <__dispatch>:

void __dispatch()
{
    1a44:	7179                	addi	sp,sp,-48
    1a46:	f406                	sd	ra,40(sp)
    1a48:	f022                	sd	s0,32(sp)
    1a4a:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1a4c:	00001797          	auipc	a5,0x1
    1a50:	08478793          	addi	a5,a5,132 # 2ad0 <current>
    1a54:	6398                	ld	a4,0(a5)
    1a56:	00001797          	auipc	a5,0x1
    1a5a:	c3278793          	addi	a5,a5,-974 # 2688 <run_queue>
    1a5e:	1af70363          	beq	a4,a5,1c04 <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1a62:	00001797          	auipc	a5,0x1
    1a66:	06e78793          	addi	a5,a5,110 # 2ad0 <current>
    1a6a:	639c                	ld	a5,0(a5)
    1a6c:	fef43423          	sd	a5,-24(s0)
    1a70:	fe843783          	ld	a5,-24(s0)
    1a74:	fd878793          	addi	a5,a5,-40
    1a78:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    1a7c:	fe043783          	ld	a5,-32(s0)
    1a80:	5fcc                	lw	a1,60(a5)
    1a82:	00001797          	auipc	a5,0x1
    1a86:	05678793          	addi	a5,a5,86 # 2ad8 <threading_system_time>
    1a8a:	4390                	lw	a2,0(a5)
    1a8c:	00001797          	auipc	a5,0x1
    1a90:	05478793          	addi	a5,a5,84 # 2ae0 <allocated_time>
    1a94:	6394                	ld	a3,0(a5)
    1a96:	fe043783          	ld	a5,-32(s0)
    1a9a:	4bfc                	lw	a5,84(a5)
    1a9c:	873e                	mv	a4,a5
    1a9e:	00001517          	auipc	a0,0x1
    1aa2:	a1250513          	addi	a0,a0,-1518 # 24b0 <schedule_edf_cbs+0x5cc>
    1aa6:	fffff097          	auipc	ra,0xfffff
    1aaa:	348080e7          	jalr	840(ra) # dee <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    1aae:	fe043783          	ld	a5,-32(s0)
    1ab2:	43bc                	lw	a5,64(a5)
    1ab4:	c3a1                	beqz	a5,1af4 <__dispatch+0xb0>
    1ab6:	00001797          	auipc	a5,0x1
    1aba:	02a78793          	addi	a5,a5,42 # 2ae0 <allocated_time>
    1abe:	639c                	ld	a5,0(a5)
    1ac0:	eb95                	bnez	a5,1af4 <__dispatch+0xb0>
    1ac2:	fe043783          	ld	a5,-32(s0)
    1ac6:	57fc                	lw	a5,108(a5)
    1ac8:	c795                	beqz	a5,1af4 <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    1aca:	fe043783          	ld	a5,-32(s0)
    1ace:	5fd8                	lw	a4,60(a5)
    1ad0:	fe043783          	ld	a5,-32(s0)
    1ad4:	4fbc                	lw	a5,88(a5)
    1ad6:	863e                	mv	a2,a5
    1ad8:	85ba                	mv	a1,a4
    1ada:	00001517          	auipc	a0,0x1
    1ade:	a2650513          	addi	a0,a0,-1498 # 2500 <schedule_edf_cbs+0x61c>
    1ae2:	fffff097          	auipc	ra,0xfffff
    1ae6:	30c080e7          	jalr	780(ra) # dee <printf>
        exit(0);
    1aea:	4501                	li	a0,0
    1aec:	fffff097          	auipc	ra,0xfffff
    1af0:	dbc080e7          	jalr	-580(ra) # 8a8 <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    1af4:	fe043783          	ld	a5,-32(s0)
    1af8:	5fd8                	lw	a4,60(a5)
    1afa:	00001797          	auipc	a5,0x1
    1afe:	fde78793          	addi	a5,a5,-34 # 2ad8 <threading_system_time>
    1b02:	4390                	lw	a2,0(a5)
    1b04:	00001797          	auipc	a5,0x1
    1b08:	fdc78793          	addi	a5,a5,-36 # 2ae0 <allocated_time>
    1b0c:	639c                	ld	a5,0(a5)
    1b0e:	86be                	mv	a3,a5
    1b10:	85ba                	mv	a1,a4
    1b12:	00001517          	auipc	a0,0x1
    1b16:	a1e50513          	addi	a0,a0,-1506 # 2530 <schedule_edf_cbs+0x64c>
    1b1a:	fffff097          	auipc	ra,0xfffff
    1b1e:	2d4080e7          	jalr	724(ra) # dee <printf>

    if (current_thread->buf_set) {
    1b22:	fe043783          	ld	a5,-32(s0)
    1b26:	539c                	lw	a5,32(a5)
    1b28:	c7a1                	beqz	a5,1b70 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1b2a:	00001797          	auipc	a5,0x1
    1b2e:	fb678793          	addi	a5,a5,-74 # 2ae0 <allocated_time>
    1b32:	639c                	ld	a5,0(a5)
    1b34:	0007871b          	sext.w	a4,a5
    1b38:	fe043783          	ld	a5,-32(s0)
    1b3c:	03878593          	addi	a1,a5,56
    1b40:	00001797          	auipc	a5,0x1
    1b44:	fa078793          	addi	a5,a5,-96 # 2ae0 <allocated_time>
    1b48:	639c                	ld	a5,0(a5)
    1b4a:	86be                	mv	a3,a5
    1b4c:	00000617          	auipc	a2,0x0
    1b50:	d4c60613          	addi	a2,a2,-692 # 1898 <switch_handler>
    1b54:	853a                	mv	a0,a4
    1b56:	fffff097          	auipc	ra,0xfffff
    1b5a:	df2080e7          	jalr	-526(ra) # 948 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    1b5e:	fe043783          	ld	a5,-32(s0)
    1b62:	5f9c                	lw	a5,56(a5)
    1b64:	853e                	mv	a0,a5
    1b66:	fffff097          	auipc	ra,0xfffff
    1b6a:	dea080e7          	jalr	-534(ra) # 950 <thrdresume>
    1b6e:	a071                	j	1bfa <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    1b70:	fe043783          	ld	a5,-32(s0)
    1b74:	4705                	li	a4,1
    1b76:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    1b78:	fe043783          	ld	a5,-32(s0)
    1b7c:	6f9c                	ld	a5,24(a5)
    1b7e:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1b82:	fe043783          	ld	a5,-32(s0)
    1b86:	577d                	li	a4,-1
    1b88:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1b8a:	00001797          	auipc	a5,0x1
    1b8e:	f5678793          	addi	a5,a5,-170 # 2ae0 <allocated_time>
    1b92:	639c                	ld	a5,0(a5)
    1b94:	0007871b          	sext.w	a4,a5
    1b98:	fe043783          	ld	a5,-32(s0)
    1b9c:	03878593          	addi	a1,a5,56
    1ba0:	00001797          	auipc	a5,0x1
    1ba4:	f4078793          	addi	a5,a5,-192 # 2ae0 <allocated_time>
    1ba8:	639c                	ld	a5,0(a5)
    1baa:	86be                	mv	a3,a5
    1bac:	00000617          	auipc	a2,0x0
    1bb0:	cec60613          	addi	a2,a2,-788 # 1898 <switch_handler>
    1bb4:	853a                	mv	a0,a4
    1bb6:	fffff097          	auipc	ra,0xfffff
    1bba:	d92080e7          	jalr	-622(ra) # 948 <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    1bbe:	fe043783          	ld	a5,-32(s0)
    1bc2:	5f9c                	lw	a5,56(a5)
    1bc4:	0207d063          	bgez	a5,1be4 <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    1bc8:	00001597          	auipc	a1,0x1
    1bcc:	99858593          	addi	a1,a1,-1640 # 2560 <schedule_edf_cbs+0x67c>
    1bd0:	4509                	li	a0,2
    1bd2:	fffff097          	auipc	ra,0xfffff
    1bd6:	1c4080e7          	jalr	452(ra) # d96 <fprintf>
            exit(1);
    1bda:	4505                	li	a0,1
    1bdc:	fffff097          	auipc	ra,0xfffff
    1be0:	ccc080e7          	jalr	-820(ra) # 8a8 <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    1be4:	fd843783          	ld	a5,-40(s0)
    1be8:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    1bea:	fe043783          	ld	a5,-32(s0)
    1bee:	6398                	ld	a4,0(a5)
    1bf0:	fe043783          	ld	a5,-32(s0)
    1bf4:	679c                	ld	a5,8(a5)
    1bf6:	853e                	mv	a0,a5
    1bf8:	9702                	jalr	a4
    }
    thread_exit();
    1bfa:	00000097          	auipc	ra,0x0
    1bfe:	a5a080e7          	jalr	-1446(ra) # 1654 <thread_exit>
    1c02:	a011                	j	1c06 <__dispatch+0x1c2>
        return;
    1c04:	0001                	nop
}
    1c06:	70a2                	ld	ra,40(sp)
    1c08:	7402                	ld	s0,32(sp)
    1c0a:	6145                	addi	sp,sp,48
    1c0c:	8082                	ret

0000000000001c0e <__schedule>:

void __schedule()
{
    1c0e:	711d                	addi	sp,sp,-96
    1c10:	ec86                	sd	ra,88(sp)
    1c12:	e8a2                	sd	s0,80(sp)
    1c14:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    1c16:	00001797          	auipc	a5,0x1
    1c1a:	ec278793          	addi	a5,a5,-318 # 2ad8 <threading_system_time>
    1c1e:	439c                	lw	a5,0(a5)
    1c20:	fcf42c23          	sw	a5,-40(s0)
    1c24:	4789                	li	a5,2
    1c26:	fcf42e23          	sw	a5,-36(s0)
    1c2a:	00001797          	auipc	a5,0x1
    1c2e:	a5e78793          	addi	a5,a5,-1442 # 2688 <run_queue>
    1c32:	fef43023          	sd	a5,-32(s0)
    1c36:	00001797          	auipc	a5,0x1
    1c3a:	a6278793          	addi	a5,a5,-1438 # 2698 <release_queue>
    1c3e:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    1c42:	fd843783          	ld	a5,-40(s0)
    1c46:	faf43023          	sd	a5,-96(s0)
    1c4a:	fe043783          	ld	a5,-32(s0)
    1c4e:	faf43423          	sd	a5,-88(s0)
    1c52:	fe843783          	ld	a5,-24(s0)
    1c56:	faf43823          	sd	a5,-80(s0)
    1c5a:	fa040793          	addi	a5,s0,-96
    1c5e:	853e                	mv	a0,a5
    1c60:	00000097          	auipc	ra,0x0
    1c64:	284080e7          	jalr	644(ra) # 1ee4 <schedule_edf_cbs>
    1c68:	872a                	mv	a4,a0
    1c6a:	87ae                	mv	a5,a1
    1c6c:	fce43423          	sd	a4,-56(s0)
    1c70:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    1c74:	fc843703          	ld	a4,-56(s0)
    1c78:	00001797          	auipc	a5,0x1
    1c7c:	e5878793          	addi	a5,a5,-424 # 2ad0 <current>
    1c80:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1c82:	fd042783          	lw	a5,-48(s0)
    1c86:	873e                	mv	a4,a5
    1c88:	00001797          	auipc	a5,0x1
    1c8c:	e5878793          	addi	a5,a5,-424 # 2ae0 <allocated_time>
    1c90:	e398                	sd	a4,0(a5)
}
    1c92:	0001                	nop
    1c94:	60e6                	ld	ra,88(sp)
    1c96:	6446                	ld	s0,80(sp)
    1c98:	6125                	addi	sp,sp,96
    1c9a:	8082                	ret

0000000000001c9c <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    1c9c:	1101                	addi	sp,sp,-32
    1c9e:	ec06                	sd	ra,24(sp)
    1ca0:	e822                	sd	s0,16(sp)
    1ca2:	1000                	addi	s0,sp,32
    1ca4:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1ca8:	00001797          	auipc	a5,0x1
    1cac:	e3478793          	addi	a5,a5,-460 # 2adc <sleeping>
    1cb0:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1cb4:	fe843783          	ld	a5,-24(s0)
    1cb8:	0007871b          	sext.w	a4,a5
    1cbc:	00001797          	auipc	a5,0x1
    1cc0:	e1c78793          	addi	a5,a5,-484 # 2ad8 <threading_system_time>
    1cc4:	439c                	lw	a5,0(a5)
    1cc6:	2781                	sext.w	a5,a5
    1cc8:	9fb9                	addw	a5,a5,a4
    1cca:	2781                	sext.w	a5,a5
    1ccc:	0007871b          	sext.w	a4,a5
    1cd0:	00001797          	auipc	a5,0x1
    1cd4:	e0878793          	addi	a5,a5,-504 # 2ad8 <threading_system_time>
    1cd8:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    1cda:	00001797          	auipc	a5,0x1
    1cde:	9ce78793          	addi	a5,a5,-1586 # 26a8 <main_thrd_id>
    1ce2:	439c                	lw	a5,0(a5)
    1ce4:	853e                	mv	a0,a5
    1ce6:	fffff097          	auipc	ra,0xfffff
    1cea:	c6a080e7          	jalr	-918(ra) # 950 <thrdresume>
}
    1cee:	0001                	nop
    1cf0:	60e2                	ld	ra,24(sp)
    1cf2:	6442                	ld	s0,16(sp)
    1cf4:	6105                	addi	sp,sp,32
    1cf6:	8082                	ret

0000000000001cf8 <thread_start_threading>:

void thread_start_threading()
{
    1cf8:	1141                	addi	sp,sp,-16
    1cfa:	e406                	sd	ra,8(sp)
    1cfc:	e022                	sd	s0,0(sp)
    1cfe:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1d00:	00001797          	auipc	a5,0x1
    1d04:	dd878793          	addi	a5,a5,-552 # 2ad8 <threading_system_time>
    1d08:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    1d0c:	00001797          	auipc	a5,0x1
    1d10:	dc478793          	addi	a5,a5,-572 # 2ad0 <current>
    1d14:	00001717          	auipc	a4,0x1
    1d18:	97470713          	addi	a4,a4,-1676 # 2688 <run_queue>
    1d1c:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1d1e:	4681                	li	a3,0
    1d20:	00000617          	auipc	a2,0x0
    1d24:	f7c60613          	addi	a2,a2,-132 # 1c9c <back_to_main_handler>
    1d28:	00001597          	auipc	a1,0x1
    1d2c:	98058593          	addi	a1,a1,-1664 # 26a8 <main_thrd_id>
    1d30:	3e800513          	li	a0,1000
    1d34:	fffff097          	auipc	ra,0xfffff
    1d38:	c14080e7          	jalr	-1004(ra) # 948 <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    1d3c:	00001797          	auipc	a5,0x1
    1d40:	96c78793          	addi	a5,a5,-1684 # 26a8 <main_thrd_id>
    1d44:	439c                	lw	a5,0(a5)
    1d46:	4581                	li	a1,0
    1d48:	853e                	mv	a0,a5
    1d4a:	fffff097          	auipc	ra,0xfffff
    1d4e:	c0e080e7          	jalr	-1010(ra) # 958 <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1d52:	a0c9                	j	1e14 <thread_start_threading+0x11c>
        __release();
    1d54:	fffff097          	auipc	ra,0xfffff
    1d58:	76a080e7          	jalr	1898(ra) # 14be <__release>
        __schedule();
    1d5c:	00000097          	auipc	ra,0x0
    1d60:	eb2080e7          	jalr	-334(ra) # 1c0e <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1d64:	00001797          	auipc	a5,0x1
    1d68:	94478793          	addi	a5,a5,-1724 # 26a8 <main_thrd_id>
    1d6c:	439c                	lw	a5,0(a5)
    1d6e:	4581                	li	a1,0
    1d70:	853e                	mv	a0,a5
    1d72:	fffff097          	auipc	ra,0xfffff
    1d76:	be6080e7          	jalr	-1050(ra) # 958 <cancelthrdstop>
        __dispatch();
    1d7a:	00000097          	auipc	ra,0x0
    1d7e:	cca080e7          	jalr	-822(ra) # 1a44 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1d82:	00001517          	auipc	a0,0x1
    1d86:	90650513          	addi	a0,a0,-1786 # 2688 <run_queue>
    1d8a:	fffff097          	auipc	ra,0xfffff
    1d8e:	4f2080e7          	jalr	1266(ra) # 127c <list_empty>
    1d92:	87aa                	mv	a5,a0
    1d94:	cb99                	beqz	a5,1daa <thread_start_threading+0xb2>
    1d96:	00001517          	auipc	a0,0x1
    1d9a:	90250513          	addi	a0,a0,-1790 # 2698 <release_queue>
    1d9e:	fffff097          	auipc	ra,0xfffff
    1da2:	4de080e7          	jalr	1246(ra) # 127c <list_empty>
    1da6:	87aa                	mv	a5,a0
    1da8:	ebd9                	bnez	a5,1e3e <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1daa:	00001797          	auipc	a5,0x1
    1dae:	d3678793          	addi	a5,a5,-714 # 2ae0 <allocated_time>
    1db2:	639c                	ld	a5,0(a5)
    1db4:	85be                	mv	a1,a5
    1db6:	00000517          	auipc	a0,0x0
    1dba:	7e250513          	addi	a0,a0,2018 # 2598 <schedule_edf_cbs+0x6b4>
    1dbe:	fffff097          	auipc	ra,0xfffff
    1dc2:	030080e7          	jalr	48(ra) # dee <printf>
        sleeping = 1;
    1dc6:	00001797          	auipc	a5,0x1
    1dca:	d1678793          	addi	a5,a5,-746 # 2adc <sleeping>
    1dce:	4705                	li	a4,1
    1dd0:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1dd2:	00001797          	auipc	a5,0x1
    1dd6:	d0e78793          	addi	a5,a5,-754 # 2ae0 <allocated_time>
    1dda:	639c                	ld	a5,0(a5)
    1ddc:	0007871b          	sext.w	a4,a5
    1de0:	00001797          	auipc	a5,0x1
    1de4:	d0078793          	addi	a5,a5,-768 # 2ae0 <allocated_time>
    1de8:	639c                	ld	a5,0(a5)
    1dea:	86be                	mv	a3,a5
    1dec:	00000617          	auipc	a2,0x0
    1df0:	eb060613          	addi	a2,a2,-336 # 1c9c <back_to_main_handler>
    1df4:	00001597          	auipc	a1,0x1
    1df8:	8b458593          	addi	a1,a1,-1868 # 26a8 <main_thrd_id>
    1dfc:	853a                	mv	a0,a4
    1dfe:	fffff097          	auipc	ra,0xfffff
    1e02:	b4a080e7          	jalr	-1206(ra) # 948 <thrdstop>
        while (sleeping) {
    1e06:	0001                	nop
    1e08:	00001797          	auipc	a5,0x1
    1e0c:	cd478793          	addi	a5,a5,-812 # 2adc <sleeping>
    1e10:	439c                	lw	a5,0(a5)
    1e12:	fbfd                	bnez	a5,1e08 <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1e14:	00001517          	auipc	a0,0x1
    1e18:	87450513          	addi	a0,a0,-1932 # 2688 <run_queue>
    1e1c:	fffff097          	auipc	ra,0xfffff
    1e20:	460080e7          	jalr	1120(ra) # 127c <list_empty>
    1e24:	87aa                	mv	a5,a0
    1e26:	d79d                	beqz	a5,1d54 <thread_start_threading+0x5c>
    1e28:	00001517          	auipc	a0,0x1
    1e2c:	87050513          	addi	a0,a0,-1936 # 2698 <release_queue>
    1e30:	fffff097          	auipc	ra,0xfffff
    1e34:	44c080e7          	jalr	1100(ra) # 127c <list_empty>
    1e38:	87aa                	mv	a5,a0
    1e3a:	df89                	beqz	a5,1d54 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1e3c:	a011                	j	1e40 <thread_start_threading+0x148>
            break;
    1e3e:	0001                	nop
}
    1e40:	0001                	nop
    1e42:	60a2                	ld	ra,8(sp)
    1e44:	6402                	ld	s0,0(sp)
    1e46:	0141                	addi	sp,sp,16
    1e48:	8082                	ret

0000000000001e4a <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1e4a:	7139                	addi	sp,sp,-64
    1e4c:	fc22                	sd	s0,56(sp)
    1e4e:	0080                	addi	s0,sp,64
    1e50:	fca43423          	sd	a0,-56(s0)
    1e54:	87ae                	mv	a5,a1
    1e56:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1e5a:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1e5e:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1e62:	fc843783          	ld	a5,-56(s0)
    1e66:	639c                	ld	a5,0(a5)
    1e68:	fcf43c23          	sd	a5,-40(s0)
    1e6c:	fd843783          	ld	a5,-40(s0)
    1e70:	fd878793          	addi	a5,a5,-40
    1e74:	fef43423          	sd	a5,-24(s0)
    1e78:	a881                	j	1ec8 <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1e7a:	fe843783          	ld	a5,-24(s0)
    1e7e:	4fb8                	lw	a4,88(a5)
    1e80:	fc442783          	lw	a5,-60(s0)
    1e84:	2781                	sext.w	a5,a5
    1e86:	02e7c663          	blt	a5,a4,1eb2 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1e8a:	fe043783          	ld	a5,-32(s0)
    1e8e:	e791                	bnez	a5,1e9a <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1e90:	fe843783          	ld	a5,-24(s0)
    1e94:	fef43023          	sd	a5,-32(s0)
    1e98:	a829                	j	1eb2 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1e9a:	fe843783          	ld	a5,-24(s0)
    1e9e:	5fd8                	lw	a4,60(a5)
    1ea0:	fe043783          	ld	a5,-32(s0)
    1ea4:	5fdc                	lw	a5,60(a5)
    1ea6:	00f75663          	bge	a4,a5,1eb2 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1eaa:	fe843783          	ld	a5,-24(s0)
    1eae:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1eb2:	fe843783          	ld	a5,-24(s0)
    1eb6:	779c                	ld	a5,40(a5)
    1eb8:	fcf43823          	sd	a5,-48(s0)
    1ebc:	fd043783          	ld	a5,-48(s0)
    1ec0:	fd878793          	addi	a5,a5,-40
    1ec4:	fef43423          	sd	a5,-24(s0)
    1ec8:	fe843783          	ld	a5,-24(s0)
    1ecc:	02878793          	addi	a5,a5,40
    1ed0:	fc843703          	ld	a4,-56(s0)
    1ed4:	faf713e3          	bne	a4,a5,1e7a <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1ed8:	fe043783          	ld	a5,-32(s0)
}
    1edc:	853e                	mv	a0,a5
    1ede:	7462                	ld	s0,56(sp)
    1ee0:	6121                	addi	sp,sp,64
    1ee2:	8082                	ret

0000000000001ee4 <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1ee4:	7131                	addi	sp,sp,-192
    1ee6:	fd06                	sd	ra,184(sp)
    1ee8:	f922                	sd	s0,176(sp)
    1eea:	f526                	sd	s1,168(sp)
    1eec:	f14a                	sd	s2,160(sp)
    1eee:	ed4e                	sd	s3,152(sp)
    1ef0:	0180                	addi	s0,sp,192
    1ef2:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1ef4:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1ef8:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1efc:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1f00:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1f04:	649c                	ld	a5,8(s1)
    1f06:	4098                	lw	a4,0(s1)
    1f08:	85ba                	mv	a1,a4
    1f0a:	853e                	mv	a0,a5
    1f0c:	00000097          	auipc	ra,0x0
    1f10:	f3e080e7          	jalr	-194(ra) # 1e4a <__check_deadline_miss>
    1f14:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1f18:	f9843783          	ld	a5,-104(s0)
    1f1c:	c7b5                	beqz	a5,1f88 <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1f1e:	f9843783          	ld	a5,-104(s0)
    1f22:	5fdc                	lw	a5,60(a5)
    1f24:	85be                	mv	a1,a5
    1f26:	00000517          	auipc	a0,0x0
    1f2a:	69a50513          	addi	a0,a0,1690 # 25c0 <schedule_edf_cbs+0x6dc>
    1f2e:	fffff097          	auipc	ra,0xfffff
    1f32:	ec0080e7          	jalr	-320(ra) # dee <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1f36:	f9843783          	ld	a5,-104(s0)
    1f3a:	57fc                	lw	a5,108(a5)
    1f3c:	c395                	beqz	a5,1f60 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1f3e:	f9843783          	ld	a5,-104(s0)
    1f42:	02878793          	addi	a5,a5,40
    1f46:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1f4a:	f4042423          	sw	zero,-184(s0)
            return r;
    1f4e:	f4043783          	ld	a5,-192(s0)
    1f52:	f4f43823          	sd	a5,-176(s0)
    1f56:	f4843783          	ld	a5,-184(s0)
    1f5a:	f4f43c23          	sd	a5,-168(s0)
    1f5e:	a13d                	j	238c <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1f60:	4098                	lw	a4,0(s1)
    1f62:	f9843783          	ld	a5,-104(s0)
    1f66:	47fc                	lw	a5,76(a5)
    1f68:	9fb9                	addw	a5,a5,a4
    1f6a:	0007871b          	sext.w	a4,a5
    1f6e:	f9843783          	ld	a5,-104(s0)
    1f72:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1f74:	f9843783          	ld	a5,-104(s0)
    1f78:	53f8                	lw	a4,100(a5)
    1f7a:	f9843783          	ld	a5,-104(s0)
    1f7e:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1f80:	f9843783          	ld	a5,-104(s0)
    1f84:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1f88:	fa043783          	ld	a5,-96(s0)
    1f8c:	e7dd                	bnez	a5,203a <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1f8e:	649c                	ld	a5,8(s1)
    1f90:	639c                	ld	a5,0(a5)
    1f92:	f8f43823          	sd	a5,-112(s0)
    1f96:	f9043783          	ld	a5,-112(s0)
    1f9a:	fd878793          	addi	a5,a5,-40
    1f9e:	faf43c23          	sd	a5,-72(s0)
    1fa2:	a069                	j	202c <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1fa4:	fb843783          	ld	a5,-72(s0)
    1fa8:	5fd8                	lw	a4,60(a5)
    1faa:	fb843783          	ld	a5,-72(s0)
    1fae:	5bbc                	lw	a5,112(a5)
    1fb0:	863e                	mv	a2,a5
    1fb2:	85ba                	mv	a1,a4
    1fb4:	00000517          	auipc	a0,0x0
    1fb8:	64450513          	addi	a0,a0,1604 # 25f8 <schedule_edf_cbs+0x714>
    1fbc:	fffff097          	auipc	ra,0xfffff
    1fc0:	e32080e7          	jalr	-462(ra) # dee <printf>
            if (next == NULL)
    1fc4:	fa043783          	ld	a5,-96(s0)
    1fc8:	e791                	bnez	a5,1fd4 <schedule_edf_cbs+0xf0>
                next = th;
    1fca:	fb843783          	ld	a5,-72(s0)
    1fce:	faf43023          	sd	a5,-96(s0)
    1fd2:	a091                	j	2016 <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1fd4:	fb843783          	ld	a5,-72(s0)
    1fd8:	4fb8                	lw	a4,88(a5)
    1fda:	fa043783          	ld	a5,-96(s0)
    1fde:	4fbc                	lw	a5,88(a5)
    1fe0:	00f75763          	bge	a4,a5,1fee <schedule_edf_cbs+0x10a>
                next = th;
    1fe4:	fb843783          	ld	a5,-72(s0)
    1fe8:	faf43023          	sd	a5,-96(s0)
    1fec:	a02d                	j	2016 <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1fee:	fb843783          	ld	a5,-72(s0)
    1ff2:	4fb8                	lw	a4,88(a5)
    1ff4:	fa043783          	ld	a5,-96(s0)
    1ff8:	4fbc                	lw	a5,88(a5)
    1ffa:	00f71e63          	bne	a4,a5,2016 <schedule_edf_cbs+0x132>
    1ffe:	fb843783          	ld	a5,-72(s0)
    2002:	5fd8                	lw	a4,60(a5)
    2004:	fa043783          	ld	a5,-96(s0)
    2008:	5fdc                	lw	a5,60(a5)
    200a:	00f75663          	bge	a4,a5,2016 <schedule_edf_cbs+0x132>
                next = th;
    200e:	fb843783          	ld	a5,-72(s0)
    2012:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    2016:	fb843783          	ld	a5,-72(s0)
    201a:	779c                	ld	a5,40(a5)
    201c:	f8f43423          	sd	a5,-120(s0)
    2020:	f8843783          	ld	a5,-120(s0)
    2024:	fd878793          	addi	a5,a5,-40
    2028:	faf43c23          	sd	a5,-72(s0)
    202c:	fb843783          	ld	a5,-72(s0)
    2030:	02878713          	addi	a4,a5,40
    2034:	649c                	ld	a5,8(s1)
    2036:	f6f717e3          	bne	a4,a5,1fa4 <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    203a:	fa043783          	ld	a5,-96(s0)
    203e:	5fdc                	lw	a5,60(a5)
    2040:	85be                	mv	a1,a5
    2042:	00000517          	auipc	a0,0x0
    2046:	5ee50513          	addi	a0,a0,1518 # 2630 <schedule_edf_cbs+0x74c>
    204a:	fffff097          	auipc	ra,0xfffff
    204e:	da4080e7          	jalr	-604(ra) # dee <printf>

    if(next && next->cbs.is_throttled){
    2052:	fa043783          	ld	a5,-96(s0)
    2056:	cb95                	beqz	a5,208a <schedule_edf_cbs+0x1a6>
    2058:	fa043783          	ld	a5,-96(s0)
    205c:	5bbc                	lw	a5,112(a5)
    205e:	c795                	beqz	a5,208a <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    2060:	fa043783          	ld	a5,-96(s0)
    2064:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    2068:	fa043783          	ld	a5,-96(s0)
    206c:	02878793          	addi	a5,a5,40
    2070:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    2074:	f4042423          	sw	zero,-184(s0)
        return r;
    2078:	f4043783          	ld	a5,-192(s0)
    207c:	f4f43823          	sd	a5,-176(s0)
    2080:	f4843783          	ld	a5,-184(s0)
    2084:	f4f43c23          	sd	a5,-168(s0)
    2088:	a611                	j	238c <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    208a:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    208e:	689c                	ld	a5,16(s1)
    2090:	639c                	ld	a5,0(a5)
    2092:	f8f43023          	sd	a5,-128(s0)
    2096:	f8043783          	ld	a5,-128(s0)
    209a:	17e1                	addi	a5,a5,-8
    209c:	fcf43023          	sd	a5,-64(s0)
    20a0:	a0b5                	j	210c <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    20a2:	fa843783          	ld	a5,-88(s0)
    20a6:	e791                	bnez	a5,20b2 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    20a8:	fc043783          	ld	a5,-64(s0)
    20ac:	faf43423          	sd	a5,-88(s0)
    20b0:	a0a1                	j	20f8 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    20b2:	fa843783          	ld	a5,-88(s0)
    20b6:	4f98                	lw	a4,24(a5)
    20b8:	fc043783          	ld	a5,-64(s0)
    20bc:	4f9c                	lw	a5,24(a5)
    20be:	00e7d763          	bge	a5,a4,20cc <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    20c2:	fc043783          	ld	a5,-64(s0)
    20c6:	faf43423          	sd	a5,-88(s0)
    20ca:	a03d                	j	20f8 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    20cc:	fa843783          	ld	a5,-88(s0)
    20d0:	4f98                	lw	a4,24(a5)
    20d2:	fc043783          	ld	a5,-64(s0)
    20d6:	4f9c                	lw	a5,24(a5)
    20d8:	02f71063          	bne	a4,a5,20f8 <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    20dc:	fa843783          	ld	a5,-88(s0)
    20e0:	639c                	ld	a5,0(a5)
    20e2:	4fb8                	lw	a4,88(a5)
    20e4:	fc043783          	ld	a5,-64(s0)
    20e8:	639c                	ld	a5,0(a5)
    20ea:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    20ec:	00e7d663          	bge	a5,a4,20f8 <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    20f0:	fc043783          	ld	a5,-64(s0)
    20f4:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    20f8:	fc043783          	ld	a5,-64(s0)
    20fc:	679c                	ld	a5,8(a5)
    20fe:	f6f43023          	sd	a5,-160(s0)
    2102:	f6043783          	ld	a5,-160(s0)
    2106:	17e1                	addi	a5,a5,-8
    2108:	fcf43023          	sd	a5,-64(s0)
    210c:	fc043783          	ld	a5,-64(s0)
    2110:	00878713          	addi	a4,a5,8
    2114:	689c                	ld	a5,16(s1)
    2116:	f8f716e3          	bne	a4,a5,20a2 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    211a:	689c                	ld	a5,16(s1)
    211c:	639c                	ld	a5,0(a5)
    211e:	f6f43c23          	sd	a5,-136(s0)
    2122:	f7843783          	ld	a5,-136(s0)
    2126:	17e1                	addi	a5,a5,-8
    2128:	fcf43023          	sd	a5,-64(s0)
    212c:	a069                	j	21b6 <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    212e:	fb043783          	ld	a5,-80(s0)
    2132:	eb99                	bnez	a5,2148 <schedule_edf_cbs+0x264>
    2134:	fc043783          	ld	a5,-64(s0)
    2138:	639c                	ld	a5,0(a5)
    213a:	57fc                	lw	a5,108(a5)
    213c:	c791                	beqz	a5,2148 <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    213e:	fc043783          	ld	a5,-64(s0)
    2142:	faf43823          	sd	a5,-80(s0)
    2146:	a8b1                	j	21a2 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    2148:	fc043783          	ld	a5,-64(s0)
    214c:	639c                	ld	a5,0(a5)
    214e:	57fc                	lw	a5,108(a5)
    2150:	cf91                	beqz	a5,216c <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    2152:	fb043783          	ld	a5,-80(s0)
    2156:	4f98                	lw	a4,24(a5)
    2158:	fc043783          	ld	a5,-64(s0)
    215c:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    215e:	00e7d763          	bge	a5,a4,216c <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    2162:	fc043783          	ld	a5,-64(s0)
    2166:	faf43823          	sd	a5,-80(s0)
    216a:	a825                	j	21a2 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    216c:	fc043783          	ld	a5,-64(s0)
    2170:	639c                	ld	a5,0(a5)
    2172:	57fc                	lw	a5,108(a5)
    2174:	c79d                	beqz	a5,21a2 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    2176:	fb043783          	ld	a5,-80(s0)
    217a:	4f98                	lw	a4,24(a5)
    217c:	fc043783          	ld	a5,-64(s0)
    2180:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    2182:	02f71063          	bne	a4,a5,21a2 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    2186:	fb043783          	ld	a5,-80(s0)
    218a:	639c                	ld	a5,0(a5)
    218c:	4fb8                	lw	a4,88(a5)
    218e:	fc043783          	ld	a5,-64(s0)
    2192:	639c                	ld	a5,0(a5)
    2194:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    2196:	00e7d663          	bge	a5,a4,21a2 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    219a:	fc043783          	ld	a5,-64(s0)
    219e:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    21a2:	fc043783          	ld	a5,-64(s0)
    21a6:	679c                	ld	a5,8(a5)
    21a8:	f6f43423          	sd	a5,-152(s0)
    21ac:	f6843783          	ld	a5,-152(s0)
    21b0:	17e1                	addi	a5,a5,-8
    21b2:	fcf43023          	sd	a5,-64(s0)
    21b6:	fc043783          	ld	a5,-64(s0)
    21ba:	00878713          	addi	a4,a5,8
    21be:	689c                	ld	a5,16(s1)
    21c0:	f6f717e3          	bne	a4,a5,212e <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    21c4:	fa043783          	ld	a5,-96(s0)
    21c8:	cb89                	beqz	a5,21da <schedule_edf_cbs+0x2f6>
    21ca:	fa043783          	ld	a5,-96(s0)
    21ce:	57fc                	lw	a5,108(a5)
    21d0:	c789                	beqz	a5,21da <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    21d2:	fb043783          	ld	a5,-80(s0)
    21d6:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    21da:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    21de:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    21e2:	fa843783          	ld	a5,-88(s0)
    21e6:	c3c5                	beqz	a5,2286 <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    21e8:	fa843783          	ld	a5,-88(s0)
    21ec:	639c                	ld	a5,0(a5)
    21ee:	5fdc                	lw	a5,60(a5)
    21f0:	85be                	mv	a1,a5
    21f2:	00000517          	auipc	a0,0x0
    21f6:	45e50513          	addi	a0,a0,1118 # 2650 <schedule_edf_cbs+0x76c>
    21fa:	fffff097          	auipc	ra,0xfffff
    21fe:	bf4080e7          	jalr	-1036(ra) # dee <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    2202:	fa843783          	ld	a5,-88(s0)
    2206:	4f98                	lw	a4,24(a5)
    2208:	409c                	lw	a5,0(s1)
    220a:	40f707bb          	subw	a5,a4,a5
    220e:	fcf42623          	sw	a5,-52(s0)
        if (next){
    2212:	fa043783          	ld	a5,-96(s0)
    2216:	cba5                	beqz	a5,2286 <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    2218:	fa043783          	ld	a5,-96(s0)
    221c:	4bf8                	lw	a4,84(a5)
    221e:	fcc42783          	lw	a5,-52(s0)
    2222:	2781                	sext.w	a5,a5
    2224:	06e7d163          	bge	a5,a4,2286 <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    2228:	fa043783          	ld	a5,-96(s0)
    222c:	57fc                	lw	a5,108(a5)
    222e:	eb91                	bnez	a5,2242 <schedule_edf_cbs+0x35e>
    2230:	fa843783          	ld	a5,-88(s0)
    2234:	639c                	ld	a5,0(a5)
    2236:	57fc                	lw	a5,108(a5)
    2238:	c789                	beqz	a5,2242 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    223a:	4785                	li	a5,1
    223c:	fcf42423          	sw	a5,-56(s0)
    2240:	a099                	j	2286 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    2242:	fa043783          	ld	a5,-96(s0)
    2246:	4fb8                	lw	a4,88(a5)
    2248:	fa843783          	ld	a5,-88(s0)
    224c:	639c                	ld	a5,0(a5)
    224e:	4fbc                	lw	a5,88(a5)
    2250:	00e7d663          	bge	a5,a4,225c <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    2254:	4785                	li	a5,1
    2256:	fcf42423          	sw	a5,-56(s0)
    225a:	a035                	j	2286 <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    225c:	fa043783          	ld	a5,-96(s0)
    2260:	4fb8                	lw	a4,88(a5)
    2262:	fa843783          	ld	a5,-88(s0)
    2266:	639c                	ld	a5,0(a5)
    2268:	4fbc                	lw	a5,88(a5)
    226a:	00f71e63          	bne	a4,a5,2286 <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    226e:	fa043783          	ld	a5,-96(s0)
    2272:	5fd8                	lw	a4,60(a5)
    2274:	fa843783          	ld	a5,-88(s0)
    2278:	639c                	ld	a5,0(a5)
    227a:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    227c:	00e7d563          	bge	a5,a4,2286 <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    2280:	4785                	li	a5,1
    2282:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    2286:	fa043783          	ld	a5,-96(s0)
    228a:	cbd1                	beqz	a5,231e <schedule_edf_cbs+0x43a>
    228c:	fa043783          	ld	a5,-96(s0)
    2290:	57fc                	lw	a5,108(a5)
    2292:	e7d1                	bnez	a5,231e <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    2294:	fa043783          	ld	a5,-96(s0)
    2298:	4fb8                	lw	a4,88(a5)
    229a:	409c                	lw	a5,0(s1)
    229c:	40f707bb          	subw	a5,a4,a5
    22a0:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    22a4:	fa043783          	ld	a5,-96(s0)
    22a8:	47f8                	lw	a4,76(a5)
    22aa:	fa043783          	ld	a5,-96(s0)
    22ae:	57bc                	lw	a5,104(a5)
    22b0:	02f707bb          	mulw	a5,a4,a5
    22b4:	0007869b          	sext.w	a3,a5
    22b8:	fa043783          	ld	a5,-96(s0)
    22bc:	53fc                	lw	a5,100(a5)
    22be:	f7442703          	lw	a4,-140(s0)
    22c2:	02f707bb          	mulw	a5,a4,a5
    22c6:	2781                	sext.w	a5,a5
    22c8:	8736                	mv	a4,a3
    22ca:	02e7d263          	bge	a5,a4,22ee <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    22ce:	4098                	lw	a4,0(s1)
    22d0:	fa043783          	ld	a5,-96(s0)
    22d4:	47fc                	lw	a5,76(a5)
    22d6:	9fb9                	addw	a5,a5,a4
    22d8:	0007871b          	sext.w	a4,a5
    22dc:	fa043783          	ld	a5,-96(s0)
    22e0:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    22e2:	fa043783          	ld	a5,-96(s0)
    22e6:	53f8                	lw	a4,100(a5)
    22e8:	fa043783          	ld	a5,-96(s0)
    22ec:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    22ee:	fa043783          	ld	a5,-96(s0)
    22f2:	4bf8                	lw	a4,84(a5)
    22f4:	fa043783          	ld	a5,-96(s0)
    22f8:	57bc                	lw	a5,104(a5)
    22fa:	02e7d263          	bge	a5,a4,231e <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    22fe:	fa043783          	ld	a5,-96(s0)
    2302:	4705                	li	a4,1
    2304:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    2306:	fa043783          	ld	a5,-96(s0)
    230a:	4fb8                	lw	a4,88(a5)
    230c:	fa043783          	ld	a5,-96(s0)
    2310:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    2312:	fa043783          	ld	a5,-96(s0)
    2316:	4bf8                	lw	a4,84(a5)
    2318:	fa043783          	ld	a5,-96(s0)
    231c:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    231e:	fa043783          	ld	a5,-96(s0)
    2322:	c3a9                	beqz	a5,2364 <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    2324:	fa043783          	ld	a5,-96(s0)
    2328:	02878793          	addi	a5,a5,40
    232c:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    2330:	fa843783          	ld	a5,-88(s0)
    2334:	cb91                	beqz	a5,2348 <schedule_edf_cbs+0x464>
    2336:	fc842783          	lw	a5,-56(s0)
    233a:	2781                	sext.w	a5,a5
    233c:	c791                	beqz	a5,2348 <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    233e:	fcc42783          	lw	a5,-52(s0)
    2342:	f4f42423          	sw	a5,-184(s0)
    2346:	a81d                	j	237c <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    2348:	fa043783          	ld	a5,-96(s0)
    234c:	5bbc                	lw	a5,112(a5)
    234e:	c789                	beqz	a5,2358 <schedule_edf_cbs+0x474>
    2350:	fa043783          	ld	a5,-96(s0)
    2354:	57bc                	lw	a5,104(a5)
    2356:	a021                	j	235e <schedule_edf_cbs+0x47a>
    2358:	fa043783          	ld	a5,-96(s0)
    235c:	4bfc                	lw	a5,84(a5)
    235e:	f4f42423          	sw	a5,-184(s0)
    2362:	a829                	j	237c <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    2364:	649c                	ld	a5,8(s1)
    2366:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    236a:	fa843783          	ld	a5,-88(s0)
    236e:	c781                	beqz	a5,2376 <schedule_edf_cbs+0x492>
    2370:	fcc42783          	lw	a5,-52(s0)
    2374:	a011                	j	2378 <schedule_edf_cbs+0x494>
    2376:	4785                	li	a5,1
    2378:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    237c:	f4043783          	ld	a5,-192(s0)
    2380:	f4f43823          	sd	a5,-176(s0)
    2384:	f4843783          	ld	a5,-184(s0)
    2388:	f4f43c23          	sd	a5,-168(s0)
    238c:	4701                	li	a4,0
    238e:	f5043703          	ld	a4,-176(s0)
    2392:	4781                	li	a5,0
    2394:	f5843783          	ld	a5,-168(s0)
    2398:	893a                	mv	s2,a4
    239a:	89be                	mv	s3,a5
    239c:	874a                	mv	a4,s2
    239e:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    23a0:	853a                	mv	a0,a4
    23a2:	85be                	mv	a1,a5
    23a4:	70ea                	ld	ra,184(sp)
    23a6:	744a                	ld	s0,176(sp)
    23a8:	74aa                	ld	s1,168(sp)
    23aa:	790a                	ld	s2,160(sp)
    23ac:	69ea                	ld	s3,152(sp)
    23ae:	6129                	addi	sp,sp,192
    23b0:	8082                	ret
