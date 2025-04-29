
user/_init:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
       0:	1101                	addi	sp,sp,-32
       2:	ec06                	sd	ra,24(sp)
       4:	e822                	sd	s0,16(sp)
       6:	1000                	addi	s0,sp,32
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
       8:	4589                	li	a1,2
       a:	00002517          	auipc	a0,0x2
       e:	0b650513          	addi	a0,a0,182 # 20c0 <schedule_edf_cbs+0x4d6>
      12:	00000097          	auipc	ra,0x0
      16:	5dc080e7          	jalr	1500(ra) # 5ee <open>
      1a:	87aa                	mv	a5,a0
      1c:	0207d563          	bgez	a5,46 <main+0x46>
    mknod("console", CONSOLE, 0);
      20:	4601                	li	a2,0
      22:	4585                	li	a1,1
      24:	00002517          	auipc	a0,0x2
      28:	09c50513          	addi	a0,a0,156 # 20c0 <schedule_edf_cbs+0x4d6>
      2c:	00000097          	auipc	ra,0x0
      30:	5ca080e7          	jalr	1482(ra) # 5f6 <mknod>
    open("console", O_RDWR);
      34:	4589                	li	a1,2
      36:	00002517          	auipc	a0,0x2
      3a:	08a50513          	addi	a0,a0,138 # 20c0 <schedule_edf_cbs+0x4d6>
      3e:	00000097          	auipc	ra,0x0
      42:	5b0080e7          	jalr	1456(ra) # 5ee <open>
  }
  dup(0);  // stdout
      46:	4501                	li	a0,0
      48:	00000097          	auipc	ra,0x0
      4c:	5de080e7          	jalr	1502(ra) # 626 <dup>
  dup(0);  // stderr
      50:	4501                	li	a0,0
      52:	00000097          	auipc	ra,0x0
      56:	5d4080e7          	jalr	1492(ra) # 626 <dup>

  for(;;){
    printf("init: starting sh\n");
      5a:	00002517          	auipc	a0,0x2
      5e:	06e50513          	addi	a0,a0,110 # 20c8 <schedule_edf_cbs+0x4de>
      62:	00001097          	auipc	ra,0x1
      66:	a92080e7          	jalr	-1390(ra) # af4 <printf>
    pid = fork();
      6a:	00000097          	auipc	ra,0x0
      6e:	53c080e7          	jalr	1340(ra) # 5a6 <fork>
      72:	87aa                	mv	a5,a0
      74:	fef42623          	sw	a5,-20(s0)
    if(pid < 0){
      78:	fec42783          	lw	a5,-20(s0)
      7c:	2781                	sext.w	a5,a5
      7e:	0007df63          	bgez	a5,9c <main+0x9c>
      printf("init: fork failed\n");
      82:	00002517          	auipc	a0,0x2
      86:	05e50513          	addi	a0,a0,94 # 20e0 <schedule_edf_cbs+0x4f6>
      8a:	00001097          	auipc	ra,0x1
      8e:	a6a080e7          	jalr	-1430(ra) # af4 <printf>
      exit(1);
      92:	4505                	li	a0,1
      94:	00000097          	auipc	ra,0x0
      98:	51a080e7          	jalr	1306(ra) # 5ae <exit>
    }
    if(pid == 0){
      9c:	fec42783          	lw	a5,-20(s0)
      a0:	2781                	sext.w	a5,a5
      a2:	eb95                	bnez	a5,d6 <main+0xd6>
      exec("sh", argv);
      a4:	00002597          	auipc	a1,0x2
      a8:	30c58593          	addi	a1,a1,780 # 23b0 <argv>
      ac:	00002517          	auipc	a0,0x2
      b0:	00c50513          	addi	a0,a0,12 # 20b8 <schedule_edf_cbs+0x4ce>
      b4:	00000097          	auipc	ra,0x0
      b8:	532080e7          	jalr	1330(ra) # 5e6 <exec>
      printf("init: exec sh failed\n");
      bc:	00002517          	auipc	a0,0x2
      c0:	03c50513          	addi	a0,a0,60 # 20f8 <schedule_edf_cbs+0x50e>
      c4:	00001097          	auipc	ra,0x1
      c8:	a30080e7          	jalr	-1488(ra) # af4 <printf>
      exit(1);
      cc:	4505                	li	a0,1
      ce:	00000097          	auipc	ra,0x0
      d2:	4e0080e7          	jalr	1248(ra) # 5ae <exit>
    }

    for(;;){
      // this call to wait() returns if the shell exits,
      // or if a parentless process exits.
      wpid = wait((int *) 0);
      d6:	4501                	li	a0,0
      d8:	00000097          	auipc	ra,0x0
      dc:	4de080e7          	jalr	1246(ra) # 5b6 <wait>
      e0:	87aa                	mv	a5,a0
      e2:	fef42423          	sw	a5,-24(s0)
      if(wpid == pid){
      e6:	fe842703          	lw	a4,-24(s0)
      ea:	fec42783          	lw	a5,-20(s0)
      ee:	2701                	sext.w	a4,a4
      f0:	2781                	sext.w	a5,a5
      f2:	02f70463          	beq	a4,a5,11a <main+0x11a>
        // the shell exited; restart it.
        break;
      } else if(wpid < 0){
      f6:	fe842783          	lw	a5,-24(s0)
      fa:	2781                	sext.w	a5,a5
      fc:	fc07dde3          	bgez	a5,d6 <main+0xd6>
        printf("init: wait returned an error\n");
     100:	00002517          	auipc	a0,0x2
     104:	01050513          	addi	a0,a0,16 # 2110 <schedule_edf_cbs+0x526>
     108:	00001097          	auipc	ra,0x1
     10c:	9ec080e7          	jalr	-1556(ra) # af4 <printf>
        exit(1);
     110:	4505                	li	a0,1
     112:	00000097          	auipc	ra,0x0
     116:	49c080e7          	jalr	1180(ra) # 5ae <exit>
        break;
     11a:	0001                	nop
    printf("init: starting sh\n");
     11c:	bf3d                	j	5a <main+0x5a>

000000000000011e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     11e:	7179                	addi	sp,sp,-48
     120:	f422                	sd	s0,40(sp)
     122:	1800                	addi	s0,sp,48
     124:	fca43c23          	sd	a0,-40(s0)
     128:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     12c:	fd843783          	ld	a5,-40(s0)
     130:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     134:	0001                	nop
     136:	fd043703          	ld	a4,-48(s0)
     13a:	00170793          	addi	a5,a4,1
     13e:	fcf43823          	sd	a5,-48(s0)
     142:	fd843783          	ld	a5,-40(s0)
     146:	00178693          	addi	a3,a5,1
     14a:	fcd43c23          	sd	a3,-40(s0)
     14e:	00074703          	lbu	a4,0(a4)
     152:	00e78023          	sb	a4,0(a5)
     156:	0007c783          	lbu	a5,0(a5)
     15a:	fff1                	bnez	a5,136 <strcpy+0x18>
    ;
  return os;
     15c:	fe843783          	ld	a5,-24(s0)
}
     160:	853e                	mv	a0,a5
     162:	7422                	ld	s0,40(sp)
     164:	6145                	addi	sp,sp,48
     166:	8082                	ret

0000000000000168 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     168:	1101                	addi	sp,sp,-32
     16a:	ec22                	sd	s0,24(sp)
     16c:	1000                	addi	s0,sp,32
     16e:	fea43423          	sd	a0,-24(s0)
     172:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     176:	a819                	j	18c <strcmp+0x24>
    p++, q++;
     178:	fe843783          	ld	a5,-24(s0)
     17c:	0785                	addi	a5,a5,1
     17e:	fef43423          	sd	a5,-24(s0)
     182:	fe043783          	ld	a5,-32(s0)
     186:	0785                	addi	a5,a5,1
     188:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     18c:	fe843783          	ld	a5,-24(s0)
     190:	0007c783          	lbu	a5,0(a5)
     194:	cb99                	beqz	a5,1aa <strcmp+0x42>
     196:	fe843783          	ld	a5,-24(s0)
     19a:	0007c703          	lbu	a4,0(a5)
     19e:	fe043783          	ld	a5,-32(s0)
     1a2:	0007c783          	lbu	a5,0(a5)
     1a6:	fcf709e3          	beq	a4,a5,178 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     1aa:	fe843783          	ld	a5,-24(s0)
     1ae:	0007c783          	lbu	a5,0(a5)
     1b2:	0007871b          	sext.w	a4,a5
     1b6:	fe043783          	ld	a5,-32(s0)
     1ba:	0007c783          	lbu	a5,0(a5)
     1be:	2781                	sext.w	a5,a5
     1c0:	40f707bb          	subw	a5,a4,a5
     1c4:	2781                	sext.w	a5,a5
}
     1c6:	853e                	mv	a0,a5
     1c8:	6462                	ld	s0,24(sp)
     1ca:	6105                	addi	sp,sp,32
     1cc:	8082                	ret

00000000000001ce <strlen>:

uint
strlen(const char *s)
{
     1ce:	7179                	addi	sp,sp,-48
     1d0:	f422                	sd	s0,40(sp)
     1d2:	1800                	addi	s0,sp,48
     1d4:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     1d8:	fe042623          	sw	zero,-20(s0)
     1dc:	a031                	j	1e8 <strlen+0x1a>
     1de:	fec42783          	lw	a5,-20(s0)
     1e2:	2785                	addiw	a5,a5,1
     1e4:	fef42623          	sw	a5,-20(s0)
     1e8:	fec42783          	lw	a5,-20(s0)
     1ec:	fd843703          	ld	a4,-40(s0)
     1f0:	97ba                	add	a5,a5,a4
     1f2:	0007c783          	lbu	a5,0(a5)
     1f6:	f7e5                	bnez	a5,1de <strlen+0x10>
    ;
  return n;
     1f8:	fec42783          	lw	a5,-20(s0)
}
     1fc:	853e                	mv	a0,a5
     1fe:	7422                	ld	s0,40(sp)
     200:	6145                	addi	sp,sp,48
     202:	8082                	ret

0000000000000204 <memset>:

void*
memset(void *dst, int c, uint n)
{
     204:	7179                	addi	sp,sp,-48
     206:	f422                	sd	s0,40(sp)
     208:	1800                	addi	s0,sp,48
     20a:	fca43c23          	sd	a0,-40(s0)
     20e:	87ae                	mv	a5,a1
     210:	8732                	mv	a4,a2
     212:	fcf42a23          	sw	a5,-44(s0)
     216:	87ba                	mv	a5,a4
     218:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     21c:	fd843783          	ld	a5,-40(s0)
     220:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     224:	fe042623          	sw	zero,-20(s0)
     228:	a00d                	j	24a <memset+0x46>
    cdst[i] = c;
     22a:	fec42783          	lw	a5,-20(s0)
     22e:	fe043703          	ld	a4,-32(s0)
     232:	97ba                	add	a5,a5,a4
     234:	fd442703          	lw	a4,-44(s0)
     238:	0ff77713          	andi	a4,a4,255
     23c:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     240:	fec42783          	lw	a5,-20(s0)
     244:	2785                	addiw	a5,a5,1
     246:	fef42623          	sw	a5,-20(s0)
     24a:	fec42703          	lw	a4,-20(s0)
     24e:	fd042783          	lw	a5,-48(s0)
     252:	2781                	sext.w	a5,a5
     254:	fcf76be3          	bltu	a4,a5,22a <memset+0x26>
  }
  return dst;
     258:	fd843783          	ld	a5,-40(s0)
}
     25c:	853e                	mv	a0,a5
     25e:	7422                	ld	s0,40(sp)
     260:	6145                	addi	sp,sp,48
     262:	8082                	ret

0000000000000264 <strchr>:

char*
strchr(const char *s, char c)
{
     264:	1101                	addi	sp,sp,-32
     266:	ec22                	sd	s0,24(sp)
     268:	1000                	addi	s0,sp,32
     26a:	fea43423          	sd	a0,-24(s0)
     26e:	87ae                	mv	a5,a1
     270:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     274:	a01d                	j	29a <strchr+0x36>
    if(*s == c)
     276:	fe843783          	ld	a5,-24(s0)
     27a:	0007c703          	lbu	a4,0(a5)
     27e:	fe744783          	lbu	a5,-25(s0)
     282:	0ff7f793          	andi	a5,a5,255
     286:	00e79563          	bne	a5,a4,290 <strchr+0x2c>
      return (char*)s;
     28a:	fe843783          	ld	a5,-24(s0)
     28e:	a821                	j	2a6 <strchr+0x42>
  for(; *s; s++)
     290:	fe843783          	ld	a5,-24(s0)
     294:	0785                	addi	a5,a5,1
     296:	fef43423          	sd	a5,-24(s0)
     29a:	fe843783          	ld	a5,-24(s0)
     29e:	0007c783          	lbu	a5,0(a5)
     2a2:	fbf1                	bnez	a5,276 <strchr+0x12>
  return 0;
     2a4:	4781                	li	a5,0
}
     2a6:	853e                	mv	a0,a5
     2a8:	6462                	ld	s0,24(sp)
     2aa:	6105                	addi	sp,sp,32
     2ac:	8082                	ret

00000000000002ae <gets>:

char*
gets(char *buf, int max)
{
     2ae:	7179                	addi	sp,sp,-48
     2b0:	f406                	sd	ra,40(sp)
     2b2:	f022                	sd	s0,32(sp)
     2b4:	1800                	addi	s0,sp,48
     2b6:	fca43c23          	sd	a0,-40(s0)
     2ba:	87ae                	mv	a5,a1
     2bc:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2c0:	fe042623          	sw	zero,-20(s0)
     2c4:	a8a1                	j	31c <gets+0x6e>
    cc = read(0, &c, 1);
     2c6:	fe740793          	addi	a5,s0,-25
     2ca:	4605                	li	a2,1
     2cc:	85be                	mv	a1,a5
     2ce:	4501                	li	a0,0
     2d0:	00000097          	auipc	ra,0x0
     2d4:	2f6080e7          	jalr	758(ra) # 5c6 <read>
     2d8:	87aa                	mv	a5,a0
     2da:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     2de:	fe842783          	lw	a5,-24(s0)
     2e2:	2781                	sext.w	a5,a5
     2e4:	04f05763          	blez	a5,332 <gets+0x84>
      break;
    buf[i++] = c;
     2e8:	fec42783          	lw	a5,-20(s0)
     2ec:	0017871b          	addiw	a4,a5,1
     2f0:	fee42623          	sw	a4,-20(s0)
     2f4:	873e                	mv	a4,a5
     2f6:	fd843783          	ld	a5,-40(s0)
     2fa:	97ba                	add	a5,a5,a4
     2fc:	fe744703          	lbu	a4,-25(s0)
     300:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     304:	fe744783          	lbu	a5,-25(s0)
     308:	873e                	mv	a4,a5
     30a:	47a9                	li	a5,10
     30c:	02f70463          	beq	a4,a5,334 <gets+0x86>
     310:	fe744783          	lbu	a5,-25(s0)
     314:	873e                	mv	a4,a5
     316:	47b5                	li	a5,13
     318:	00f70e63          	beq	a4,a5,334 <gets+0x86>
  for(i=0; i+1 < max; ){
     31c:	fec42783          	lw	a5,-20(s0)
     320:	2785                	addiw	a5,a5,1
     322:	0007871b          	sext.w	a4,a5
     326:	fd442783          	lw	a5,-44(s0)
     32a:	2781                	sext.w	a5,a5
     32c:	f8f74de3          	blt	a4,a5,2c6 <gets+0x18>
     330:	a011                	j	334 <gets+0x86>
      break;
     332:	0001                	nop
      break;
  }
  buf[i] = '\0';
     334:	fec42783          	lw	a5,-20(s0)
     338:	fd843703          	ld	a4,-40(s0)
     33c:	97ba                	add	a5,a5,a4
     33e:	00078023          	sb	zero,0(a5)
  return buf;
     342:	fd843783          	ld	a5,-40(s0)
}
     346:	853e                	mv	a0,a5
     348:	70a2                	ld	ra,40(sp)
     34a:	7402                	ld	s0,32(sp)
     34c:	6145                	addi	sp,sp,48
     34e:	8082                	ret

0000000000000350 <stat>:

int
stat(const char *n, struct stat *st)
{
     350:	7179                	addi	sp,sp,-48
     352:	f406                	sd	ra,40(sp)
     354:	f022                	sd	s0,32(sp)
     356:	1800                	addi	s0,sp,48
     358:	fca43c23          	sd	a0,-40(s0)
     35c:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     360:	4581                	li	a1,0
     362:	fd843503          	ld	a0,-40(s0)
     366:	00000097          	auipc	ra,0x0
     36a:	288080e7          	jalr	648(ra) # 5ee <open>
     36e:	87aa                	mv	a5,a0
     370:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     374:	fec42783          	lw	a5,-20(s0)
     378:	2781                	sext.w	a5,a5
     37a:	0007d463          	bgez	a5,382 <stat+0x32>
    return -1;
     37e:	57fd                	li	a5,-1
     380:	a035                	j	3ac <stat+0x5c>
  r = fstat(fd, st);
     382:	fec42783          	lw	a5,-20(s0)
     386:	fd043583          	ld	a1,-48(s0)
     38a:	853e                	mv	a0,a5
     38c:	00000097          	auipc	ra,0x0
     390:	27a080e7          	jalr	634(ra) # 606 <fstat>
     394:	87aa                	mv	a5,a0
     396:	fef42423          	sw	a5,-24(s0)
  close(fd);
     39a:	fec42783          	lw	a5,-20(s0)
     39e:	853e                	mv	a0,a5
     3a0:	00000097          	auipc	ra,0x0
     3a4:	236080e7          	jalr	566(ra) # 5d6 <close>
  return r;
     3a8:	fe842783          	lw	a5,-24(s0)
}
     3ac:	853e                	mv	a0,a5
     3ae:	70a2                	ld	ra,40(sp)
     3b0:	7402                	ld	s0,32(sp)
     3b2:	6145                	addi	sp,sp,48
     3b4:	8082                	ret

00000000000003b6 <atoi>:

int
atoi(const char *s)
{
     3b6:	7179                	addi	sp,sp,-48
     3b8:	f422                	sd	s0,40(sp)
     3ba:	1800                	addi	s0,sp,48
     3bc:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     3c0:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     3c4:	a815                	j	3f8 <atoi+0x42>
    n = n*10 + *s++ - '0';
     3c6:	fec42703          	lw	a4,-20(s0)
     3ca:	87ba                	mv	a5,a4
     3cc:	0027979b          	slliw	a5,a5,0x2
     3d0:	9fb9                	addw	a5,a5,a4
     3d2:	0017979b          	slliw	a5,a5,0x1
     3d6:	0007871b          	sext.w	a4,a5
     3da:	fd843783          	ld	a5,-40(s0)
     3de:	00178693          	addi	a3,a5,1
     3e2:	fcd43c23          	sd	a3,-40(s0)
     3e6:	0007c783          	lbu	a5,0(a5)
     3ea:	2781                	sext.w	a5,a5
     3ec:	9fb9                	addw	a5,a5,a4
     3ee:	2781                	sext.w	a5,a5
     3f0:	fd07879b          	addiw	a5,a5,-48
     3f4:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     3f8:	fd843783          	ld	a5,-40(s0)
     3fc:	0007c783          	lbu	a5,0(a5)
     400:	873e                	mv	a4,a5
     402:	02f00793          	li	a5,47
     406:	00e7fb63          	bgeu	a5,a4,41c <atoi+0x66>
     40a:	fd843783          	ld	a5,-40(s0)
     40e:	0007c783          	lbu	a5,0(a5)
     412:	873e                	mv	a4,a5
     414:	03900793          	li	a5,57
     418:	fae7f7e3          	bgeu	a5,a4,3c6 <atoi+0x10>
  return n;
     41c:	fec42783          	lw	a5,-20(s0)
}
     420:	853e                	mv	a0,a5
     422:	7422                	ld	s0,40(sp)
     424:	6145                	addi	sp,sp,48
     426:	8082                	ret

0000000000000428 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     428:	7139                	addi	sp,sp,-64
     42a:	fc22                	sd	s0,56(sp)
     42c:	0080                	addi	s0,sp,64
     42e:	fca43c23          	sd	a0,-40(s0)
     432:	fcb43823          	sd	a1,-48(s0)
     436:	87b2                	mv	a5,a2
     438:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     43c:	fd843783          	ld	a5,-40(s0)
     440:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     444:	fd043783          	ld	a5,-48(s0)
     448:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     44c:	fe043703          	ld	a4,-32(s0)
     450:	fe843783          	ld	a5,-24(s0)
     454:	02e7fc63          	bgeu	a5,a4,48c <memmove+0x64>
    while(n-- > 0)
     458:	a00d                	j	47a <memmove+0x52>
      *dst++ = *src++;
     45a:	fe043703          	ld	a4,-32(s0)
     45e:	00170793          	addi	a5,a4,1
     462:	fef43023          	sd	a5,-32(s0)
     466:	fe843783          	ld	a5,-24(s0)
     46a:	00178693          	addi	a3,a5,1
     46e:	fed43423          	sd	a3,-24(s0)
     472:	00074703          	lbu	a4,0(a4)
     476:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     47a:	fcc42783          	lw	a5,-52(s0)
     47e:	fff7871b          	addiw	a4,a5,-1
     482:	fce42623          	sw	a4,-52(s0)
     486:	fcf04ae3          	bgtz	a5,45a <memmove+0x32>
     48a:	a891                	j	4de <memmove+0xb6>
  } else {
    dst += n;
     48c:	fcc42783          	lw	a5,-52(s0)
     490:	fe843703          	ld	a4,-24(s0)
     494:	97ba                	add	a5,a5,a4
     496:	fef43423          	sd	a5,-24(s0)
    src += n;
     49a:	fcc42783          	lw	a5,-52(s0)
     49e:	fe043703          	ld	a4,-32(s0)
     4a2:	97ba                	add	a5,a5,a4
     4a4:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     4a8:	a01d                	j	4ce <memmove+0xa6>
      *--dst = *--src;
     4aa:	fe043783          	ld	a5,-32(s0)
     4ae:	17fd                	addi	a5,a5,-1
     4b0:	fef43023          	sd	a5,-32(s0)
     4b4:	fe843783          	ld	a5,-24(s0)
     4b8:	17fd                	addi	a5,a5,-1
     4ba:	fef43423          	sd	a5,-24(s0)
     4be:	fe043783          	ld	a5,-32(s0)
     4c2:	0007c703          	lbu	a4,0(a5)
     4c6:	fe843783          	ld	a5,-24(s0)
     4ca:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     4ce:	fcc42783          	lw	a5,-52(s0)
     4d2:	fff7871b          	addiw	a4,a5,-1
     4d6:	fce42623          	sw	a4,-52(s0)
     4da:	fcf048e3          	bgtz	a5,4aa <memmove+0x82>
  }
  return vdst;
     4de:	fd843783          	ld	a5,-40(s0)
}
     4e2:	853e                	mv	a0,a5
     4e4:	7462                	ld	s0,56(sp)
     4e6:	6121                	addi	sp,sp,64
     4e8:	8082                	ret

00000000000004ea <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     4ea:	7139                	addi	sp,sp,-64
     4ec:	fc22                	sd	s0,56(sp)
     4ee:	0080                	addi	s0,sp,64
     4f0:	fca43c23          	sd	a0,-40(s0)
     4f4:	fcb43823          	sd	a1,-48(s0)
     4f8:	87b2                	mv	a5,a2
     4fa:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     4fe:	fd843783          	ld	a5,-40(s0)
     502:	fef43423          	sd	a5,-24(s0)
     506:	fd043783          	ld	a5,-48(s0)
     50a:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     50e:	a0a1                	j	556 <memcmp+0x6c>
    if (*p1 != *p2) {
     510:	fe843783          	ld	a5,-24(s0)
     514:	0007c703          	lbu	a4,0(a5)
     518:	fe043783          	ld	a5,-32(s0)
     51c:	0007c783          	lbu	a5,0(a5)
     520:	02f70163          	beq	a4,a5,542 <memcmp+0x58>
      return *p1 - *p2;
     524:	fe843783          	ld	a5,-24(s0)
     528:	0007c783          	lbu	a5,0(a5)
     52c:	0007871b          	sext.w	a4,a5
     530:	fe043783          	ld	a5,-32(s0)
     534:	0007c783          	lbu	a5,0(a5)
     538:	2781                	sext.w	a5,a5
     53a:	40f707bb          	subw	a5,a4,a5
     53e:	2781                	sext.w	a5,a5
     540:	a01d                	j	566 <memcmp+0x7c>
    }
    p1++;
     542:	fe843783          	ld	a5,-24(s0)
     546:	0785                	addi	a5,a5,1
     548:	fef43423          	sd	a5,-24(s0)
    p2++;
     54c:	fe043783          	ld	a5,-32(s0)
     550:	0785                	addi	a5,a5,1
     552:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     556:	fcc42783          	lw	a5,-52(s0)
     55a:	fff7871b          	addiw	a4,a5,-1
     55e:	fce42623          	sw	a4,-52(s0)
     562:	f7dd                	bnez	a5,510 <memcmp+0x26>
  }
  return 0;
     564:	4781                	li	a5,0
}
     566:	853e                	mv	a0,a5
     568:	7462                	ld	s0,56(sp)
     56a:	6121                	addi	sp,sp,64
     56c:	8082                	ret

000000000000056e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     56e:	7179                	addi	sp,sp,-48
     570:	f406                	sd	ra,40(sp)
     572:	f022                	sd	s0,32(sp)
     574:	1800                	addi	s0,sp,48
     576:	fea43423          	sd	a0,-24(s0)
     57a:	feb43023          	sd	a1,-32(s0)
     57e:	87b2                	mv	a5,a2
     580:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     584:	fdc42783          	lw	a5,-36(s0)
     588:	863e                	mv	a2,a5
     58a:	fe043583          	ld	a1,-32(s0)
     58e:	fe843503          	ld	a0,-24(s0)
     592:	00000097          	auipc	ra,0x0
     596:	e96080e7          	jalr	-362(ra) # 428 <memmove>
     59a:	87aa                	mv	a5,a0
}
     59c:	853e                	mv	a0,a5
     59e:	70a2                	ld	ra,40(sp)
     5a0:	7402                	ld	s0,32(sp)
     5a2:	6145                	addi	sp,sp,48
     5a4:	8082                	ret

00000000000005a6 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     5a6:	4885                	li	a7,1
 ecall
     5a8:	00000073          	ecall
 ret
     5ac:	8082                	ret

00000000000005ae <exit>:
.global exit
exit:
 li a7, SYS_exit
     5ae:	4889                	li	a7,2
 ecall
     5b0:	00000073          	ecall
 ret
     5b4:	8082                	ret

00000000000005b6 <wait>:
.global wait
wait:
 li a7, SYS_wait
     5b6:	488d                	li	a7,3
 ecall
     5b8:	00000073          	ecall
 ret
     5bc:	8082                	ret

00000000000005be <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     5be:	4891                	li	a7,4
 ecall
     5c0:	00000073          	ecall
 ret
     5c4:	8082                	ret

00000000000005c6 <read>:
.global read
read:
 li a7, SYS_read
     5c6:	4895                	li	a7,5
 ecall
     5c8:	00000073          	ecall
 ret
     5cc:	8082                	ret

00000000000005ce <write>:
.global write
write:
 li a7, SYS_write
     5ce:	48c1                	li	a7,16
 ecall
     5d0:	00000073          	ecall
 ret
     5d4:	8082                	ret

00000000000005d6 <close>:
.global close
close:
 li a7, SYS_close
     5d6:	48d5                	li	a7,21
 ecall
     5d8:	00000073          	ecall
 ret
     5dc:	8082                	ret

00000000000005de <kill>:
.global kill
kill:
 li a7, SYS_kill
     5de:	4899                	li	a7,6
 ecall
     5e0:	00000073          	ecall
 ret
     5e4:	8082                	ret

00000000000005e6 <exec>:
.global exec
exec:
 li a7, SYS_exec
     5e6:	489d                	li	a7,7
 ecall
     5e8:	00000073          	ecall
 ret
     5ec:	8082                	ret

00000000000005ee <open>:
.global open
open:
 li a7, SYS_open
     5ee:	48bd                	li	a7,15
 ecall
     5f0:	00000073          	ecall
 ret
     5f4:	8082                	ret

00000000000005f6 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     5f6:	48c5                	li	a7,17
 ecall
     5f8:	00000073          	ecall
 ret
     5fc:	8082                	ret

00000000000005fe <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     5fe:	48c9                	li	a7,18
 ecall
     600:	00000073          	ecall
 ret
     604:	8082                	ret

0000000000000606 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     606:	48a1                	li	a7,8
 ecall
     608:	00000073          	ecall
 ret
     60c:	8082                	ret

000000000000060e <link>:
.global link
link:
 li a7, SYS_link
     60e:	48cd                	li	a7,19
 ecall
     610:	00000073          	ecall
 ret
     614:	8082                	ret

0000000000000616 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     616:	48d1                	li	a7,20
 ecall
     618:	00000073          	ecall
 ret
     61c:	8082                	ret

000000000000061e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     61e:	48a5                	li	a7,9
 ecall
     620:	00000073          	ecall
 ret
     624:	8082                	ret

0000000000000626 <dup>:
.global dup
dup:
 li a7, SYS_dup
     626:	48a9                	li	a7,10
 ecall
     628:	00000073          	ecall
 ret
     62c:	8082                	ret

000000000000062e <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     62e:	48ad                	li	a7,11
 ecall
     630:	00000073          	ecall
 ret
     634:	8082                	ret

0000000000000636 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     636:	48b1                	li	a7,12
 ecall
     638:	00000073          	ecall
 ret
     63c:	8082                	ret

000000000000063e <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     63e:	48b5                	li	a7,13
 ecall
     640:	00000073          	ecall
 ret
     644:	8082                	ret

0000000000000646 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     646:	48b9                	li	a7,14
 ecall
     648:	00000073          	ecall
 ret
     64c:	8082                	ret

000000000000064e <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     64e:	48d9                	li	a7,22
 ecall
     650:	00000073          	ecall
 ret
     654:	8082                	ret

0000000000000656 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     656:	48dd                	li	a7,23
 ecall
     658:	00000073          	ecall
 ret
     65c:	8082                	ret

000000000000065e <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     65e:	48e1                	li	a7,24
 ecall
     660:	00000073          	ecall
 ret
     664:	8082                	ret

0000000000000666 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     666:	1101                	addi	sp,sp,-32
     668:	ec06                	sd	ra,24(sp)
     66a:	e822                	sd	s0,16(sp)
     66c:	1000                	addi	s0,sp,32
     66e:	87aa                	mv	a5,a0
     670:	872e                	mv	a4,a1
     672:	fef42623          	sw	a5,-20(s0)
     676:	87ba                	mv	a5,a4
     678:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     67c:	feb40713          	addi	a4,s0,-21
     680:	fec42783          	lw	a5,-20(s0)
     684:	4605                	li	a2,1
     686:	85ba                	mv	a1,a4
     688:	853e                	mv	a0,a5
     68a:	00000097          	auipc	ra,0x0
     68e:	f44080e7          	jalr	-188(ra) # 5ce <write>
}
     692:	0001                	nop
     694:	60e2                	ld	ra,24(sp)
     696:	6442                	ld	s0,16(sp)
     698:	6105                	addi	sp,sp,32
     69a:	8082                	ret

000000000000069c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     69c:	7139                	addi	sp,sp,-64
     69e:	fc06                	sd	ra,56(sp)
     6a0:	f822                	sd	s0,48(sp)
     6a2:	0080                	addi	s0,sp,64
     6a4:	87aa                	mv	a5,a0
     6a6:	8736                	mv	a4,a3
     6a8:	fcf42623          	sw	a5,-52(s0)
     6ac:	87ae                	mv	a5,a1
     6ae:	fcf42423          	sw	a5,-56(s0)
     6b2:	87b2                	mv	a5,a2
     6b4:	fcf42223          	sw	a5,-60(s0)
     6b8:	87ba                	mv	a5,a4
     6ba:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     6be:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     6c2:	fc042783          	lw	a5,-64(s0)
     6c6:	2781                	sext.w	a5,a5
     6c8:	c38d                	beqz	a5,6ea <printint+0x4e>
     6ca:	fc842783          	lw	a5,-56(s0)
     6ce:	2781                	sext.w	a5,a5
     6d0:	0007dd63          	bgez	a5,6ea <printint+0x4e>
    neg = 1;
     6d4:	4785                	li	a5,1
     6d6:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     6da:	fc842783          	lw	a5,-56(s0)
     6de:	40f007bb          	negw	a5,a5
     6e2:	2781                	sext.w	a5,a5
     6e4:	fef42223          	sw	a5,-28(s0)
     6e8:	a029                	j	6f2 <printint+0x56>
  } else {
    x = xx;
     6ea:	fc842783          	lw	a5,-56(s0)
     6ee:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     6f2:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     6f6:	fc442783          	lw	a5,-60(s0)
     6fa:	fe442703          	lw	a4,-28(s0)
     6fe:	02f777bb          	remuw	a5,a4,a5
     702:	0007861b          	sext.w	a2,a5
     706:	fec42783          	lw	a5,-20(s0)
     70a:	0017871b          	addiw	a4,a5,1
     70e:	fee42623          	sw	a4,-20(s0)
     712:	00002697          	auipc	a3,0x2
     716:	cae68693          	addi	a3,a3,-850 # 23c0 <digits>
     71a:	02061713          	slli	a4,a2,0x20
     71e:	9301                	srli	a4,a4,0x20
     720:	9736                	add	a4,a4,a3
     722:	00074703          	lbu	a4,0(a4)
     726:	ff040693          	addi	a3,s0,-16
     72a:	97b6                	add	a5,a5,a3
     72c:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     730:	fc442783          	lw	a5,-60(s0)
     734:	fe442703          	lw	a4,-28(s0)
     738:	02f757bb          	divuw	a5,a4,a5
     73c:	fef42223          	sw	a5,-28(s0)
     740:	fe442783          	lw	a5,-28(s0)
     744:	2781                	sext.w	a5,a5
     746:	fbc5                	bnez	a5,6f6 <printint+0x5a>
  if(neg)
     748:	fe842783          	lw	a5,-24(s0)
     74c:	2781                	sext.w	a5,a5
     74e:	cf95                	beqz	a5,78a <printint+0xee>
    buf[i++] = '-';
     750:	fec42783          	lw	a5,-20(s0)
     754:	0017871b          	addiw	a4,a5,1
     758:	fee42623          	sw	a4,-20(s0)
     75c:	ff040713          	addi	a4,s0,-16
     760:	97ba                	add	a5,a5,a4
     762:	02d00713          	li	a4,45
     766:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     76a:	a005                	j	78a <printint+0xee>
    putc(fd, buf[i]);
     76c:	fec42783          	lw	a5,-20(s0)
     770:	ff040713          	addi	a4,s0,-16
     774:	97ba                	add	a5,a5,a4
     776:	fe07c703          	lbu	a4,-32(a5)
     77a:	fcc42783          	lw	a5,-52(s0)
     77e:	85ba                	mv	a1,a4
     780:	853e                	mv	a0,a5
     782:	00000097          	auipc	ra,0x0
     786:	ee4080e7          	jalr	-284(ra) # 666 <putc>
  while(--i >= 0)
     78a:	fec42783          	lw	a5,-20(s0)
     78e:	37fd                	addiw	a5,a5,-1
     790:	fef42623          	sw	a5,-20(s0)
     794:	fec42783          	lw	a5,-20(s0)
     798:	2781                	sext.w	a5,a5
     79a:	fc07d9e3          	bgez	a5,76c <printint+0xd0>
}
     79e:	0001                	nop
     7a0:	0001                	nop
     7a2:	70e2                	ld	ra,56(sp)
     7a4:	7442                	ld	s0,48(sp)
     7a6:	6121                	addi	sp,sp,64
     7a8:	8082                	ret

00000000000007aa <printptr>:

static void
printptr(int fd, uint64 x) {
     7aa:	7179                	addi	sp,sp,-48
     7ac:	f406                	sd	ra,40(sp)
     7ae:	f022                	sd	s0,32(sp)
     7b0:	1800                	addi	s0,sp,48
     7b2:	87aa                	mv	a5,a0
     7b4:	fcb43823          	sd	a1,-48(s0)
     7b8:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     7bc:	fdc42783          	lw	a5,-36(s0)
     7c0:	03000593          	li	a1,48
     7c4:	853e                	mv	a0,a5
     7c6:	00000097          	auipc	ra,0x0
     7ca:	ea0080e7          	jalr	-352(ra) # 666 <putc>
  putc(fd, 'x');
     7ce:	fdc42783          	lw	a5,-36(s0)
     7d2:	07800593          	li	a1,120
     7d6:	853e                	mv	a0,a5
     7d8:	00000097          	auipc	ra,0x0
     7dc:	e8e080e7          	jalr	-370(ra) # 666 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     7e0:	fe042623          	sw	zero,-20(s0)
     7e4:	a82d                	j	81e <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     7e6:	fd043783          	ld	a5,-48(s0)
     7ea:	93f1                	srli	a5,a5,0x3c
     7ec:	00002717          	auipc	a4,0x2
     7f0:	bd470713          	addi	a4,a4,-1068 # 23c0 <digits>
     7f4:	97ba                	add	a5,a5,a4
     7f6:	0007c703          	lbu	a4,0(a5)
     7fa:	fdc42783          	lw	a5,-36(s0)
     7fe:	85ba                	mv	a1,a4
     800:	853e                	mv	a0,a5
     802:	00000097          	auipc	ra,0x0
     806:	e64080e7          	jalr	-412(ra) # 666 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     80a:	fec42783          	lw	a5,-20(s0)
     80e:	2785                	addiw	a5,a5,1
     810:	fef42623          	sw	a5,-20(s0)
     814:	fd043783          	ld	a5,-48(s0)
     818:	0792                	slli	a5,a5,0x4
     81a:	fcf43823          	sd	a5,-48(s0)
     81e:	fec42783          	lw	a5,-20(s0)
     822:	873e                	mv	a4,a5
     824:	47bd                	li	a5,15
     826:	fce7f0e3          	bgeu	a5,a4,7e6 <printptr+0x3c>
}
     82a:	0001                	nop
     82c:	0001                	nop
     82e:	70a2                	ld	ra,40(sp)
     830:	7402                	ld	s0,32(sp)
     832:	6145                	addi	sp,sp,48
     834:	8082                	ret

0000000000000836 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     836:	715d                	addi	sp,sp,-80
     838:	e486                	sd	ra,72(sp)
     83a:	e0a2                	sd	s0,64(sp)
     83c:	0880                	addi	s0,sp,80
     83e:	87aa                	mv	a5,a0
     840:	fcb43023          	sd	a1,-64(s0)
     844:	fac43c23          	sd	a2,-72(s0)
     848:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     84c:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     850:	fe042223          	sw	zero,-28(s0)
     854:	a42d                	j	a7e <vprintf+0x248>
    c = fmt[i] & 0xff;
     856:	fe442783          	lw	a5,-28(s0)
     85a:	fc043703          	ld	a4,-64(s0)
     85e:	97ba                	add	a5,a5,a4
     860:	0007c783          	lbu	a5,0(a5)
     864:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     868:	fe042783          	lw	a5,-32(s0)
     86c:	2781                	sext.w	a5,a5
     86e:	eb9d                	bnez	a5,8a4 <vprintf+0x6e>
      if(c == '%'){
     870:	fdc42783          	lw	a5,-36(s0)
     874:	0007871b          	sext.w	a4,a5
     878:	02500793          	li	a5,37
     87c:	00f71763          	bne	a4,a5,88a <vprintf+0x54>
        state = '%';
     880:	02500793          	li	a5,37
     884:	fef42023          	sw	a5,-32(s0)
     888:	a2f5                	j	a74 <vprintf+0x23e>
      } else {
        putc(fd, c);
     88a:	fdc42783          	lw	a5,-36(s0)
     88e:	0ff7f713          	andi	a4,a5,255
     892:	fcc42783          	lw	a5,-52(s0)
     896:	85ba                	mv	a1,a4
     898:	853e                	mv	a0,a5
     89a:	00000097          	auipc	ra,0x0
     89e:	dcc080e7          	jalr	-564(ra) # 666 <putc>
     8a2:	aac9                	j	a74 <vprintf+0x23e>
      }
    } else if(state == '%'){
     8a4:	fe042783          	lw	a5,-32(s0)
     8a8:	0007871b          	sext.w	a4,a5
     8ac:	02500793          	li	a5,37
     8b0:	1cf71263          	bne	a4,a5,a74 <vprintf+0x23e>
      if(c == 'd'){
     8b4:	fdc42783          	lw	a5,-36(s0)
     8b8:	0007871b          	sext.w	a4,a5
     8bc:	06400793          	li	a5,100
     8c0:	02f71463          	bne	a4,a5,8e8 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     8c4:	fb843783          	ld	a5,-72(s0)
     8c8:	00878713          	addi	a4,a5,8
     8cc:	fae43c23          	sd	a4,-72(s0)
     8d0:	4398                	lw	a4,0(a5)
     8d2:	fcc42783          	lw	a5,-52(s0)
     8d6:	4685                	li	a3,1
     8d8:	4629                	li	a2,10
     8da:	85ba                	mv	a1,a4
     8dc:	853e                	mv	a0,a5
     8de:	00000097          	auipc	ra,0x0
     8e2:	dbe080e7          	jalr	-578(ra) # 69c <printint>
     8e6:	a269                	j	a70 <vprintf+0x23a>
      } else if(c == 'l') {
     8e8:	fdc42783          	lw	a5,-36(s0)
     8ec:	0007871b          	sext.w	a4,a5
     8f0:	06c00793          	li	a5,108
     8f4:	02f71663          	bne	a4,a5,920 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     8f8:	fb843783          	ld	a5,-72(s0)
     8fc:	00878713          	addi	a4,a5,8
     900:	fae43c23          	sd	a4,-72(s0)
     904:	639c                	ld	a5,0(a5)
     906:	0007871b          	sext.w	a4,a5
     90a:	fcc42783          	lw	a5,-52(s0)
     90e:	4681                	li	a3,0
     910:	4629                	li	a2,10
     912:	85ba                	mv	a1,a4
     914:	853e                	mv	a0,a5
     916:	00000097          	auipc	ra,0x0
     91a:	d86080e7          	jalr	-634(ra) # 69c <printint>
     91e:	aa89                	j	a70 <vprintf+0x23a>
      } else if(c == 'x') {
     920:	fdc42783          	lw	a5,-36(s0)
     924:	0007871b          	sext.w	a4,a5
     928:	07800793          	li	a5,120
     92c:	02f71463          	bne	a4,a5,954 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     930:	fb843783          	ld	a5,-72(s0)
     934:	00878713          	addi	a4,a5,8
     938:	fae43c23          	sd	a4,-72(s0)
     93c:	4398                	lw	a4,0(a5)
     93e:	fcc42783          	lw	a5,-52(s0)
     942:	4681                	li	a3,0
     944:	4641                	li	a2,16
     946:	85ba                	mv	a1,a4
     948:	853e                	mv	a0,a5
     94a:	00000097          	auipc	ra,0x0
     94e:	d52080e7          	jalr	-686(ra) # 69c <printint>
     952:	aa39                	j	a70 <vprintf+0x23a>
      } else if(c == 'p') {
     954:	fdc42783          	lw	a5,-36(s0)
     958:	0007871b          	sext.w	a4,a5
     95c:	07000793          	li	a5,112
     960:	02f71263          	bne	a4,a5,984 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     964:	fb843783          	ld	a5,-72(s0)
     968:	00878713          	addi	a4,a5,8
     96c:	fae43c23          	sd	a4,-72(s0)
     970:	6398                	ld	a4,0(a5)
     972:	fcc42783          	lw	a5,-52(s0)
     976:	85ba                	mv	a1,a4
     978:	853e                	mv	a0,a5
     97a:	00000097          	auipc	ra,0x0
     97e:	e30080e7          	jalr	-464(ra) # 7aa <printptr>
     982:	a0fd                	j	a70 <vprintf+0x23a>
      } else if(c == 's'){
     984:	fdc42783          	lw	a5,-36(s0)
     988:	0007871b          	sext.w	a4,a5
     98c:	07300793          	li	a5,115
     990:	04f71c63          	bne	a4,a5,9e8 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     994:	fb843783          	ld	a5,-72(s0)
     998:	00878713          	addi	a4,a5,8
     99c:	fae43c23          	sd	a4,-72(s0)
     9a0:	639c                	ld	a5,0(a5)
     9a2:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     9a6:	fe843783          	ld	a5,-24(s0)
     9aa:	eb8d                	bnez	a5,9dc <vprintf+0x1a6>
          s = "(null)";
     9ac:	00001797          	auipc	a5,0x1
     9b0:	78478793          	addi	a5,a5,1924 # 2130 <schedule_edf_cbs+0x546>
     9b4:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     9b8:	a015                	j	9dc <vprintf+0x1a6>
          putc(fd, *s);
     9ba:	fe843783          	ld	a5,-24(s0)
     9be:	0007c703          	lbu	a4,0(a5)
     9c2:	fcc42783          	lw	a5,-52(s0)
     9c6:	85ba                	mv	a1,a4
     9c8:	853e                	mv	a0,a5
     9ca:	00000097          	auipc	ra,0x0
     9ce:	c9c080e7          	jalr	-868(ra) # 666 <putc>
          s++;
     9d2:	fe843783          	ld	a5,-24(s0)
     9d6:	0785                	addi	a5,a5,1
     9d8:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     9dc:	fe843783          	ld	a5,-24(s0)
     9e0:	0007c783          	lbu	a5,0(a5)
     9e4:	fbf9                	bnez	a5,9ba <vprintf+0x184>
     9e6:	a069                	j	a70 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     9e8:	fdc42783          	lw	a5,-36(s0)
     9ec:	0007871b          	sext.w	a4,a5
     9f0:	06300793          	li	a5,99
     9f4:	02f71463          	bne	a4,a5,a1c <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     9f8:	fb843783          	ld	a5,-72(s0)
     9fc:	00878713          	addi	a4,a5,8
     a00:	fae43c23          	sd	a4,-72(s0)
     a04:	439c                	lw	a5,0(a5)
     a06:	0ff7f713          	andi	a4,a5,255
     a0a:	fcc42783          	lw	a5,-52(s0)
     a0e:	85ba                	mv	a1,a4
     a10:	853e                	mv	a0,a5
     a12:	00000097          	auipc	ra,0x0
     a16:	c54080e7          	jalr	-940(ra) # 666 <putc>
     a1a:	a899                	j	a70 <vprintf+0x23a>
      } else if(c == '%'){
     a1c:	fdc42783          	lw	a5,-36(s0)
     a20:	0007871b          	sext.w	a4,a5
     a24:	02500793          	li	a5,37
     a28:	00f71f63          	bne	a4,a5,a46 <vprintf+0x210>
        putc(fd, c);
     a2c:	fdc42783          	lw	a5,-36(s0)
     a30:	0ff7f713          	andi	a4,a5,255
     a34:	fcc42783          	lw	a5,-52(s0)
     a38:	85ba                	mv	a1,a4
     a3a:	853e                	mv	a0,a5
     a3c:	00000097          	auipc	ra,0x0
     a40:	c2a080e7          	jalr	-982(ra) # 666 <putc>
     a44:	a035                	j	a70 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     a46:	fcc42783          	lw	a5,-52(s0)
     a4a:	02500593          	li	a1,37
     a4e:	853e                	mv	a0,a5
     a50:	00000097          	auipc	ra,0x0
     a54:	c16080e7          	jalr	-1002(ra) # 666 <putc>
        putc(fd, c);
     a58:	fdc42783          	lw	a5,-36(s0)
     a5c:	0ff7f713          	andi	a4,a5,255
     a60:	fcc42783          	lw	a5,-52(s0)
     a64:	85ba                	mv	a1,a4
     a66:	853e                	mv	a0,a5
     a68:	00000097          	auipc	ra,0x0
     a6c:	bfe080e7          	jalr	-1026(ra) # 666 <putc>
      }
      state = 0;
     a70:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     a74:	fe442783          	lw	a5,-28(s0)
     a78:	2785                	addiw	a5,a5,1
     a7a:	fef42223          	sw	a5,-28(s0)
     a7e:	fe442783          	lw	a5,-28(s0)
     a82:	fc043703          	ld	a4,-64(s0)
     a86:	97ba                	add	a5,a5,a4
     a88:	0007c783          	lbu	a5,0(a5)
     a8c:	dc0795e3          	bnez	a5,856 <vprintf+0x20>
    }
  }
}
     a90:	0001                	nop
     a92:	0001                	nop
     a94:	60a6                	ld	ra,72(sp)
     a96:	6406                	ld	s0,64(sp)
     a98:	6161                	addi	sp,sp,80
     a9a:	8082                	ret

0000000000000a9c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     a9c:	7159                	addi	sp,sp,-112
     a9e:	fc06                	sd	ra,56(sp)
     aa0:	f822                	sd	s0,48(sp)
     aa2:	0080                	addi	s0,sp,64
     aa4:	fcb43823          	sd	a1,-48(s0)
     aa8:	e010                	sd	a2,0(s0)
     aaa:	e414                	sd	a3,8(s0)
     aac:	e818                	sd	a4,16(s0)
     aae:	ec1c                	sd	a5,24(s0)
     ab0:	03043023          	sd	a6,32(s0)
     ab4:	03143423          	sd	a7,40(s0)
     ab8:	87aa                	mv	a5,a0
     aba:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     abe:	03040793          	addi	a5,s0,48
     ac2:	fcf43423          	sd	a5,-56(s0)
     ac6:	fc843783          	ld	a5,-56(s0)
     aca:	fd078793          	addi	a5,a5,-48
     ace:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     ad2:	fe843703          	ld	a4,-24(s0)
     ad6:	fdc42783          	lw	a5,-36(s0)
     ada:	863a                	mv	a2,a4
     adc:	fd043583          	ld	a1,-48(s0)
     ae0:	853e                	mv	a0,a5
     ae2:	00000097          	auipc	ra,0x0
     ae6:	d54080e7          	jalr	-684(ra) # 836 <vprintf>
}
     aea:	0001                	nop
     aec:	70e2                	ld	ra,56(sp)
     aee:	7442                	ld	s0,48(sp)
     af0:	6165                	addi	sp,sp,112
     af2:	8082                	ret

0000000000000af4 <printf>:

void
printf(const char *fmt, ...)
{
     af4:	7159                	addi	sp,sp,-112
     af6:	f406                	sd	ra,40(sp)
     af8:	f022                	sd	s0,32(sp)
     afa:	1800                	addi	s0,sp,48
     afc:	fca43c23          	sd	a0,-40(s0)
     b00:	e40c                	sd	a1,8(s0)
     b02:	e810                	sd	a2,16(s0)
     b04:	ec14                	sd	a3,24(s0)
     b06:	f018                	sd	a4,32(s0)
     b08:	f41c                	sd	a5,40(s0)
     b0a:	03043823          	sd	a6,48(s0)
     b0e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     b12:	04040793          	addi	a5,s0,64
     b16:	fcf43823          	sd	a5,-48(s0)
     b1a:	fd043783          	ld	a5,-48(s0)
     b1e:	fc878793          	addi	a5,a5,-56
     b22:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     b26:	fe843783          	ld	a5,-24(s0)
     b2a:	863e                	mv	a2,a5
     b2c:	fd843583          	ld	a1,-40(s0)
     b30:	4505                	li	a0,1
     b32:	00000097          	auipc	ra,0x0
     b36:	d04080e7          	jalr	-764(ra) # 836 <vprintf>
}
     b3a:	0001                	nop
     b3c:	70a2                	ld	ra,40(sp)
     b3e:	7402                	ld	s0,32(sp)
     b40:	6165                	addi	sp,sp,112
     b42:	8082                	ret

0000000000000b44 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     b44:	7179                	addi	sp,sp,-48
     b46:	f422                	sd	s0,40(sp)
     b48:	1800                	addi	s0,sp,48
     b4a:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     b4e:	fd843783          	ld	a5,-40(s0)
     b52:	17c1                	addi	a5,a5,-16
     b54:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b58:	00002797          	auipc	a5,0x2
     b5c:	8c078793          	addi	a5,a5,-1856 # 2418 <freep>
     b60:	639c                	ld	a5,0(a5)
     b62:	fef43423          	sd	a5,-24(s0)
     b66:	a815                	j	b9a <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     b68:	fe843783          	ld	a5,-24(s0)
     b6c:	639c                	ld	a5,0(a5)
     b6e:	fe843703          	ld	a4,-24(s0)
     b72:	00f76f63          	bltu	a4,a5,b90 <free+0x4c>
     b76:	fe043703          	ld	a4,-32(s0)
     b7a:	fe843783          	ld	a5,-24(s0)
     b7e:	02e7eb63          	bltu	a5,a4,bb4 <free+0x70>
     b82:	fe843783          	ld	a5,-24(s0)
     b86:	639c                	ld	a5,0(a5)
     b88:	fe043703          	ld	a4,-32(s0)
     b8c:	02f76463          	bltu	a4,a5,bb4 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     b90:	fe843783          	ld	a5,-24(s0)
     b94:	639c                	ld	a5,0(a5)
     b96:	fef43423          	sd	a5,-24(s0)
     b9a:	fe043703          	ld	a4,-32(s0)
     b9e:	fe843783          	ld	a5,-24(s0)
     ba2:	fce7f3e3          	bgeu	a5,a4,b68 <free+0x24>
     ba6:	fe843783          	ld	a5,-24(s0)
     baa:	639c                	ld	a5,0(a5)
     bac:	fe043703          	ld	a4,-32(s0)
     bb0:	faf77ce3          	bgeu	a4,a5,b68 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     bb4:	fe043783          	ld	a5,-32(s0)
     bb8:	479c                	lw	a5,8(a5)
     bba:	1782                	slli	a5,a5,0x20
     bbc:	9381                	srli	a5,a5,0x20
     bbe:	0792                	slli	a5,a5,0x4
     bc0:	fe043703          	ld	a4,-32(s0)
     bc4:	973e                	add	a4,a4,a5
     bc6:	fe843783          	ld	a5,-24(s0)
     bca:	639c                	ld	a5,0(a5)
     bcc:	02f71763          	bne	a4,a5,bfa <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     bd0:	fe043783          	ld	a5,-32(s0)
     bd4:	4798                	lw	a4,8(a5)
     bd6:	fe843783          	ld	a5,-24(s0)
     bda:	639c                	ld	a5,0(a5)
     bdc:	479c                	lw	a5,8(a5)
     bde:	9fb9                	addw	a5,a5,a4
     be0:	0007871b          	sext.w	a4,a5
     be4:	fe043783          	ld	a5,-32(s0)
     be8:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     bea:	fe843783          	ld	a5,-24(s0)
     bee:	639c                	ld	a5,0(a5)
     bf0:	6398                	ld	a4,0(a5)
     bf2:	fe043783          	ld	a5,-32(s0)
     bf6:	e398                	sd	a4,0(a5)
     bf8:	a039                	j	c06 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     bfa:	fe843783          	ld	a5,-24(s0)
     bfe:	6398                	ld	a4,0(a5)
     c00:	fe043783          	ld	a5,-32(s0)
     c04:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     c06:	fe843783          	ld	a5,-24(s0)
     c0a:	479c                	lw	a5,8(a5)
     c0c:	1782                	slli	a5,a5,0x20
     c0e:	9381                	srli	a5,a5,0x20
     c10:	0792                	slli	a5,a5,0x4
     c12:	fe843703          	ld	a4,-24(s0)
     c16:	97ba                	add	a5,a5,a4
     c18:	fe043703          	ld	a4,-32(s0)
     c1c:	02f71563          	bne	a4,a5,c46 <free+0x102>
    p->s.size += bp->s.size;
     c20:	fe843783          	ld	a5,-24(s0)
     c24:	4798                	lw	a4,8(a5)
     c26:	fe043783          	ld	a5,-32(s0)
     c2a:	479c                	lw	a5,8(a5)
     c2c:	9fb9                	addw	a5,a5,a4
     c2e:	0007871b          	sext.w	a4,a5
     c32:	fe843783          	ld	a5,-24(s0)
     c36:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     c38:	fe043783          	ld	a5,-32(s0)
     c3c:	6398                	ld	a4,0(a5)
     c3e:	fe843783          	ld	a5,-24(s0)
     c42:	e398                	sd	a4,0(a5)
     c44:	a031                	j	c50 <free+0x10c>
  } else
    p->s.ptr = bp;
     c46:	fe843783          	ld	a5,-24(s0)
     c4a:	fe043703          	ld	a4,-32(s0)
     c4e:	e398                	sd	a4,0(a5)
  freep = p;
     c50:	00001797          	auipc	a5,0x1
     c54:	7c878793          	addi	a5,a5,1992 # 2418 <freep>
     c58:	fe843703          	ld	a4,-24(s0)
     c5c:	e398                	sd	a4,0(a5)
}
     c5e:	0001                	nop
     c60:	7422                	ld	s0,40(sp)
     c62:	6145                	addi	sp,sp,48
     c64:	8082                	ret

0000000000000c66 <morecore>:

static Header*
morecore(uint nu)
{
     c66:	7179                	addi	sp,sp,-48
     c68:	f406                	sd	ra,40(sp)
     c6a:	f022                	sd	s0,32(sp)
     c6c:	1800                	addi	s0,sp,48
     c6e:	87aa                	mv	a5,a0
     c70:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     c74:	fdc42783          	lw	a5,-36(s0)
     c78:	0007871b          	sext.w	a4,a5
     c7c:	6785                	lui	a5,0x1
     c7e:	00f77563          	bgeu	a4,a5,c88 <morecore+0x22>
    nu = 4096;
     c82:	6785                	lui	a5,0x1
     c84:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     c88:	fdc42783          	lw	a5,-36(s0)
     c8c:	0047979b          	slliw	a5,a5,0x4
     c90:	2781                	sext.w	a5,a5
     c92:	2781                	sext.w	a5,a5
     c94:	853e                	mv	a0,a5
     c96:	00000097          	auipc	ra,0x0
     c9a:	9a0080e7          	jalr	-1632(ra) # 636 <sbrk>
     c9e:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     ca2:	fe843703          	ld	a4,-24(s0)
     ca6:	57fd                	li	a5,-1
     ca8:	00f71463          	bne	a4,a5,cb0 <morecore+0x4a>
    return 0;
     cac:	4781                	li	a5,0
     cae:	a03d                	j	cdc <morecore+0x76>
  hp = (Header*)p;
     cb0:	fe843783          	ld	a5,-24(s0)
     cb4:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     cb8:	fe043783          	ld	a5,-32(s0)
     cbc:	fdc42703          	lw	a4,-36(s0)
     cc0:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     cc2:	fe043783          	ld	a5,-32(s0)
     cc6:	07c1                	addi	a5,a5,16
     cc8:	853e                	mv	a0,a5
     cca:	00000097          	auipc	ra,0x0
     cce:	e7a080e7          	jalr	-390(ra) # b44 <free>
  return freep;
     cd2:	00001797          	auipc	a5,0x1
     cd6:	74678793          	addi	a5,a5,1862 # 2418 <freep>
     cda:	639c                	ld	a5,0(a5)
}
     cdc:	853e                	mv	a0,a5
     cde:	70a2                	ld	ra,40(sp)
     ce0:	7402                	ld	s0,32(sp)
     ce2:	6145                	addi	sp,sp,48
     ce4:	8082                	ret

0000000000000ce6 <malloc>:

void*
malloc(uint nbytes)
{
     ce6:	7139                	addi	sp,sp,-64
     ce8:	fc06                	sd	ra,56(sp)
     cea:	f822                	sd	s0,48(sp)
     cec:	0080                	addi	s0,sp,64
     cee:	87aa                	mv	a5,a0
     cf0:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     cf4:	fcc46783          	lwu	a5,-52(s0)
     cf8:	07bd                	addi	a5,a5,15
     cfa:	8391                	srli	a5,a5,0x4
     cfc:	2781                	sext.w	a5,a5
     cfe:	2785                	addiw	a5,a5,1
     d00:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     d04:	00001797          	auipc	a5,0x1
     d08:	71478793          	addi	a5,a5,1812 # 2418 <freep>
     d0c:	639c                	ld	a5,0(a5)
     d0e:	fef43023          	sd	a5,-32(s0)
     d12:	fe043783          	ld	a5,-32(s0)
     d16:	ef95                	bnez	a5,d52 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     d18:	00001797          	auipc	a5,0x1
     d1c:	6f078793          	addi	a5,a5,1776 # 2408 <base>
     d20:	fef43023          	sd	a5,-32(s0)
     d24:	00001797          	auipc	a5,0x1
     d28:	6f478793          	addi	a5,a5,1780 # 2418 <freep>
     d2c:	fe043703          	ld	a4,-32(s0)
     d30:	e398                	sd	a4,0(a5)
     d32:	00001797          	auipc	a5,0x1
     d36:	6e678793          	addi	a5,a5,1766 # 2418 <freep>
     d3a:	6398                	ld	a4,0(a5)
     d3c:	00001797          	auipc	a5,0x1
     d40:	6cc78793          	addi	a5,a5,1740 # 2408 <base>
     d44:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     d46:	00001797          	auipc	a5,0x1
     d4a:	6c278793          	addi	a5,a5,1730 # 2408 <base>
     d4e:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d52:	fe043783          	ld	a5,-32(s0)
     d56:	639c                	ld	a5,0(a5)
     d58:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     d5c:	fe843783          	ld	a5,-24(s0)
     d60:	4798                	lw	a4,8(a5)
     d62:	fdc42783          	lw	a5,-36(s0)
     d66:	2781                	sext.w	a5,a5
     d68:	06f76863          	bltu	a4,a5,dd8 <malloc+0xf2>
      if(p->s.size == nunits)
     d6c:	fe843783          	ld	a5,-24(s0)
     d70:	4798                	lw	a4,8(a5)
     d72:	fdc42783          	lw	a5,-36(s0)
     d76:	2781                	sext.w	a5,a5
     d78:	00e79963          	bne	a5,a4,d8a <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     d7c:	fe843783          	ld	a5,-24(s0)
     d80:	6398                	ld	a4,0(a5)
     d82:	fe043783          	ld	a5,-32(s0)
     d86:	e398                	sd	a4,0(a5)
     d88:	a82d                	j	dc2 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     d8a:	fe843783          	ld	a5,-24(s0)
     d8e:	4798                	lw	a4,8(a5)
     d90:	fdc42783          	lw	a5,-36(s0)
     d94:	40f707bb          	subw	a5,a4,a5
     d98:	0007871b          	sext.w	a4,a5
     d9c:	fe843783          	ld	a5,-24(s0)
     da0:	c798                	sw	a4,8(a5)
        p += p->s.size;
     da2:	fe843783          	ld	a5,-24(s0)
     da6:	479c                	lw	a5,8(a5)
     da8:	1782                	slli	a5,a5,0x20
     daa:	9381                	srli	a5,a5,0x20
     dac:	0792                	slli	a5,a5,0x4
     dae:	fe843703          	ld	a4,-24(s0)
     db2:	97ba                	add	a5,a5,a4
     db4:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     db8:	fe843783          	ld	a5,-24(s0)
     dbc:	fdc42703          	lw	a4,-36(s0)
     dc0:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     dc2:	00001797          	auipc	a5,0x1
     dc6:	65678793          	addi	a5,a5,1622 # 2418 <freep>
     dca:	fe043703          	ld	a4,-32(s0)
     dce:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     dd0:	fe843783          	ld	a5,-24(s0)
     dd4:	07c1                	addi	a5,a5,16
     dd6:	a091                	j	e1a <malloc+0x134>
    }
    if(p == freep)
     dd8:	00001797          	auipc	a5,0x1
     ddc:	64078793          	addi	a5,a5,1600 # 2418 <freep>
     de0:	639c                	ld	a5,0(a5)
     de2:	fe843703          	ld	a4,-24(s0)
     de6:	02f71063          	bne	a4,a5,e06 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     dea:	fdc42783          	lw	a5,-36(s0)
     dee:	853e                	mv	a0,a5
     df0:	00000097          	auipc	ra,0x0
     df4:	e76080e7          	jalr	-394(ra) # c66 <morecore>
     df8:	fea43423          	sd	a0,-24(s0)
     dfc:	fe843783          	ld	a5,-24(s0)
     e00:	e399                	bnez	a5,e06 <malloc+0x120>
        return 0;
     e02:	4781                	li	a5,0
     e04:	a819                	j	e1a <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     e06:	fe843783          	ld	a5,-24(s0)
     e0a:	fef43023          	sd	a5,-32(s0)
     e0e:	fe843783          	ld	a5,-24(s0)
     e12:	639c                	ld	a5,0(a5)
     e14:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     e18:	b791                	j	d5c <malloc+0x76>
  }
}
     e1a:	853e                	mv	a0,a5
     e1c:	70e2                	ld	ra,56(sp)
     e1e:	7442                	ld	s0,48(sp)
     e20:	6121                	addi	sp,sp,64
     e22:	8082                	ret

0000000000000e24 <setjmp>:
     e24:	e100                	sd	s0,0(a0)
     e26:	e504                	sd	s1,8(a0)
     e28:	01253823          	sd	s2,16(a0)
     e2c:	01353c23          	sd	s3,24(a0)
     e30:	03453023          	sd	s4,32(a0)
     e34:	03553423          	sd	s5,40(a0)
     e38:	03653823          	sd	s6,48(a0)
     e3c:	03753c23          	sd	s7,56(a0)
     e40:	05853023          	sd	s8,64(a0)
     e44:	05953423          	sd	s9,72(a0)
     e48:	05a53823          	sd	s10,80(a0)
     e4c:	05b53c23          	sd	s11,88(a0)
     e50:	06153023          	sd	ra,96(a0)
     e54:	06253423          	sd	sp,104(a0)
     e58:	4501                	li	a0,0
     e5a:	8082                	ret

0000000000000e5c <longjmp>:
     e5c:	6100                	ld	s0,0(a0)
     e5e:	6504                	ld	s1,8(a0)
     e60:	01053903          	ld	s2,16(a0)
     e64:	01853983          	ld	s3,24(a0)
     e68:	02053a03          	ld	s4,32(a0)
     e6c:	02853a83          	ld	s5,40(a0)
     e70:	03053b03          	ld	s6,48(a0)
     e74:	03853b83          	ld	s7,56(a0)
     e78:	04053c03          	ld	s8,64(a0)
     e7c:	04853c83          	ld	s9,72(a0)
     e80:	05053d03          	ld	s10,80(a0)
     e84:	05853d83          	ld	s11,88(a0)
     e88:	06053083          	ld	ra,96(a0)
     e8c:	06853103          	ld	sp,104(a0)
     e90:	c199                	beqz	a1,e96 <longjmp_1>
     e92:	852e                	mv	a0,a1
     e94:	8082                	ret

0000000000000e96 <longjmp_1>:
     e96:	4505                	li	a0,1
     e98:	8082                	ret

0000000000000e9a <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     e9a:	7179                	addi	sp,sp,-48
     e9c:	f422                	sd	s0,40(sp)
     e9e:	1800                	addi	s0,sp,48
     ea0:	fea43423          	sd	a0,-24(s0)
     ea4:	feb43023          	sd	a1,-32(s0)
     ea8:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     eac:	fd843783          	ld	a5,-40(s0)
     eb0:	fe843703          	ld	a4,-24(s0)
     eb4:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     eb6:	fe843783          	ld	a5,-24(s0)
     eba:	fd843703          	ld	a4,-40(s0)
     ebe:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     ec0:	fe843783          	ld	a5,-24(s0)
     ec4:	fe043703          	ld	a4,-32(s0)
     ec8:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     eca:	fe043783          	ld	a5,-32(s0)
     ece:	fe843703          	ld	a4,-24(s0)
     ed2:	e398                	sd	a4,0(a5)
 }
     ed4:	0001                	nop
     ed6:	7422                	ld	s0,40(sp)
     ed8:	6145                	addi	sp,sp,48
     eda:	8082                	ret

0000000000000edc <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     edc:	1101                	addi	sp,sp,-32
     ede:	ec06                	sd	ra,24(sp)
     ee0:	e822                	sd	s0,16(sp)
     ee2:	1000                	addi	s0,sp,32
     ee4:	fea43423          	sd	a0,-24(s0)
     ee8:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     eec:	fe043783          	ld	a5,-32(s0)
     ef0:	679c                	ld	a5,8(a5)
     ef2:	fe043603          	ld	a2,-32(s0)
     ef6:	85be                	mv	a1,a5
     ef8:	fe843503          	ld	a0,-24(s0)
     efc:	00000097          	auipc	ra,0x0
     f00:	f9e080e7          	jalr	-98(ra) # e9a <__list_add>
 }
     f04:	0001                	nop
     f06:	60e2                	ld	ra,24(sp)
     f08:	6442                	ld	s0,16(sp)
     f0a:	6105                	addi	sp,sp,32
     f0c:	8082                	ret

0000000000000f0e <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     f0e:	1101                	addi	sp,sp,-32
     f10:	ec22                	sd	s0,24(sp)
     f12:	1000                	addi	s0,sp,32
     f14:	fea43423          	sd	a0,-24(s0)
     f18:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
     f1c:	fe043783          	ld	a5,-32(s0)
     f20:	fe843703          	ld	a4,-24(s0)
     f24:	e798                	sd	a4,8(a5)
     prev->next = next;
     f26:	fe843783          	ld	a5,-24(s0)
     f2a:	fe043703          	ld	a4,-32(s0)
     f2e:	e398                	sd	a4,0(a5)
 }
     f30:	0001                	nop
     f32:	6462                	ld	s0,24(sp)
     f34:	6105                	addi	sp,sp,32
     f36:	8082                	ret

0000000000000f38 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     f38:	1101                	addi	sp,sp,-32
     f3a:	ec06                	sd	ra,24(sp)
     f3c:	e822                	sd	s0,16(sp)
     f3e:	1000                	addi	s0,sp,32
     f40:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
     f44:	fe843783          	ld	a5,-24(s0)
     f48:	6798                	ld	a4,8(a5)
     f4a:	fe843783          	ld	a5,-24(s0)
     f4e:	639c                	ld	a5,0(a5)
     f50:	85be                	mv	a1,a5
     f52:	853a                	mv	a0,a4
     f54:	00000097          	auipc	ra,0x0
     f58:	fba080e7          	jalr	-70(ra) # f0e <__list_del>
     entry->next = LIST_POISON1;
     f5c:	fe843783          	ld	a5,-24(s0)
     f60:	00100737          	lui	a4,0x100
     f64:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd550>
     f68:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
     f6a:	fe843783          	ld	a5,-24(s0)
     f6e:	00200737          	lui	a4,0x200
     f72:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd650>
     f76:	e798                	sd	a4,8(a5)
 }
     f78:	0001                	nop
     f7a:	60e2                	ld	ra,24(sp)
     f7c:	6442                	ld	s0,16(sp)
     f7e:	6105                	addi	sp,sp,32
     f80:	8082                	ret

0000000000000f82 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
     f82:	1101                	addi	sp,sp,-32
     f84:	ec22                	sd	s0,24(sp)
     f86:	1000                	addi	s0,sp,32
     f88:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
     f8c:	fe843783          	ld	a5,-24(s0)
     f90:	639c                	ld	a5,0(a5)
     f92:	fe843703          	ld	a4,-24(s0)
     f96:	40f707b3          	sub	a5,a4,a5
     f9a:	0017b793          	seqz	a5,a5
     f9e:	0ff7f793          	andi	a5,a5,255
     fa2:	2781                	sext.w	a5,a5
 }
     fa4:	853e                	mv	a0,a5
     fa6:	6462                	ld	s0,24(sp)
     fa8:	6105                	addi	sp,sp,32
     faa:	8082                	ret

0000000000000fac <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     fac:	715d                	addi	sp,sp,-80
     fae:	e486                	sd	ra,72(sp)
     fb0:	e0a2                	sd	s0,64(sp)
     fb2:	0880                	addi	s0,sp,80
     fb4:	fca43423          	sd	a0,-56(s0)
     fb8:	fcb43023          	sd	a1,-64(s0)
     fbc:	85b2                	mv	a1,a2
     fbe:	8636                	mv	a2,a3
     fc0:	86ba                	mv	a3,a4
     fc2:	873e                	mv	a4,a5
     fc4:	87ae                	mv	a5,a1
     fc6:	faf42e23          	sw	a5,-68(s0)
     fca:	87b2                	mv	a5,a2
     fcc:	faf42c23          	sw	a5,-72(s0)
     fd0:	87b6                	mv	a5,a3
     fd2:	faf42a23          	sw	a5,-76(s0)
     fd6:	87ba                	mv	a5,a4
     fd8:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     fdc:	08000513          	li	a0,128
     fe0:	00000097          	auipc	ra,0x0
     fe4:	d06080e7          	jalr	-762(ra) # ce6 <malloc>
     fe8:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     fec:	6505                	lui	a0,0x1
     fee:	00000097          	auipc	ra,0x0
     ff2:	cf8080e7          	jalr	-776(ra) # ce6 <malloc>
     ff6:	87aa                	mv	a5,a0
     ff8:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     ffc:	fe043703          	ld	a4,-32(s0)
    1000:	6785                	lui	a5,0x1
    1002:	17c1                	addi	a5,a5,-16
    1004:	97ba                	add	a5,a5,a4
    1006:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
    100a:	fe843783          	ld	a5,-24(s0)
    100e:	fc843703          	ld	a4,-56(s0)
    1012:	e398                	sd	a4,0(a5)
    t->arg = arg;
    1014:	fe843783          	ld	a5,-24(s0)
    1018:	fc043703          	ld	a4,-64(s0)
    101c:	e798                	sd	a4,8(a5)
    t->ID = _id++;
    101e:	00001797          	auipc	a5,0x1
    1022:	3de78793          	addi	a5,a5,990 # 23fc <_id.1241>
    1026:	439c                	lw	a5,0(a5)
    1028:	0017871b          	addiw	a4,a5,1
    102c:	0007069b          	sext.w	a3,a4
    1030:	00001717          	auipc	a4,0x1
    1034:	3cc70713          	addi	a4,a4,972 # 23fc <_id.1241>
    1038:	c314                	sw	a3,0(a4)
    103a:	fe843703          	ld	a4,-24(s0)
    103e:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    1040:	fe843783          	ld	a5,-24(s0)
    1044:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    1048:	fe043703          	ld	a4,-32(s0)
    104c:	fe843783          	ld	a5,-24(s0)
    1050:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    1052:	fd843703          	ld	a4,-40(s0)
    1056:	fe843783          	ld	a5,-24(s0)
    105a:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    105c:	fe843783          	ld	a5,-24(s0)
    1060:	fb842703          	lw	a4,-72(s0)
    1064:	c3f8                	sw	a4,68(a5)
    t->period = period;
    1066:	fe843783          	ld	a5,-24(s0)
    106a:	fb442703          	lw	a4,-76(s0)
    106e:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
    1070:	fe843783          	ld	a5,-24(s0)
    1074:	fb442703          	lw	a4,-76(s0)
    1078:	c7b8                	sw	a4,72(a5)
    t->n = n;
    107a:	fe843783          	ld	a5,-24(s0)
    107e:	fb042703          	lw	a4,-80(s0)
    1082:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    1084:	fe843783          	ld	a5,-24(s0)
    1088:	fbc42703          	lw	a4,-68(s0)
    108c:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    108e:	fe843783          	ld	a5,-24(s0)
    1092:	fb842703          	lw	a4,-72(s0)
    1096:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    1098:	fe843783          	ld	a5,-24(s0)
    109c:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    10a0:	fe843783          	ld	a5,-24(s0)
    10a4:	06400713          	li	a4,100
    10a8:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    10aa:	fe843783          	ld	a5,-24(s0)
    10ae:	671d                	lui	a4,0x7
    10b0:	5307071b          	addiw	a4,a4,1328
    10b4:	d3b8                	sw	a4,96(a5)
    
    return t;
    10b6:	fe843783          	ld	a5,-24(s0)
}
    10ba:	853e                	mv	a0,a5
    10bc:	60a6                	ld	ra,72(sp)
    10be:	6406                	ld	s0,64(sp)
    10c0:	6161                	addi	sp,sp,80
    10c2:	8082                	ret

00000000000010c4 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    10c4:	1101                	addi	sp,sp,-32
    10c6:	ec22                	sd	s0,24(sp)
    10c8:	1000                	addi	s0,sp,32
    10ca:	fea43423          	sd	a0,-24(s0)
    10ce:	87ae                	mv	a5,a1
    10d0:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    10d4:	fe843783          	ld	a5,-24(s0)
    10d8:	fe442703          	lw	a4,-28(s0)
    10dc:	cff8                	sw	a4,92(a5)
}
    10de:	0001                	nop
    10e0:	6462                	ld	s0,24(sp)
    10e2:	6105                	addi	sp,sp,32
    10e4:	8082                	ret

00000000000010e6 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    10e6:	1101                	addi	sp,sp,-32
    10e8:	ec22                	sd	s0,24(sp)
    10ea:	1000                	addi	s0,sp,32
    10ec:	fea43423          	sd	a0,-24(s0)
    10f0:	87ae                	mv	a5,a1
    10f2:	8732                	mv	a4,a2
    10f4:	fef42223          	sw	a5,-28(s0)
    10f8:	87ba                	mv	a5,a4
    10fa:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    10fe:	fe843783          	ld	a5,-24(s0)
    1102:	fe442703          	lw	a4,-28(s0)
    1106:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    1108:	fe843783          	ld	a5,-24(s0)
    110c:	fe442703          	lw	a4,-28(s0)
    1110:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    1112:	fe843783          	ld	a5,-24(s0)
    1116:	fe042703          	lw	a4,-32(s0)
    111a:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    111c:	fe843783          	ld	a5,-24(s0)
    1120:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1124:	fe843783          	ld	a5,-24(s0)
    1128:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    112c:	fe843783          	ld	a5,-24(s0)
    1130:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    1134:	fe843783          	ld	a5,-24(s0)
    1138:	0607ae23          	sw	zero,124(a5)
}
    113c:	0001                	nop
    113e:	6462                	ld	s0,24(sp)
    1140:	6105                	addi	sp,sp,32
    1142:	8082                	ret

0000000000001144 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    1144:	7179                	addi	sp,sp,-48
    1146:	f406                	sd	ra,40(sp)
    1148:	f022                	sd	s0,32(sp)
    114a:	1800                	addi	s0,sp,48
    114c:	fca43c23          	sd	a0,-40(s0)
    1150:	87ae                	mv	a5,a1
    1152:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    1156:	02000513          	li	a0,32
    115a:	00000097          	auipc	ra,0x0
    115e:	b8c080e7          	jalr	-1140(ra) # ce6 <malloc>
    1162:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    1166:	fe843783          	ld	a5,-24(s0)
    116a:	fd843703          	ld	a4,-40(s0)
    116e:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    1170:	fe843783          	ld	a5,-24(s0)
    1174:	fd442703          	lw	a4,-44(s0)
    1178:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    117a:	fd843783          	ld	a5,-40(s0)
    117e:	fd442703          	lw	a4,-44(s0)
    1182:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    1184:	fd843783          	ld	a5,-40(s0)
    1188:	43bc                	lw	a5,64(a5)
    118a:	cf81                	beqz	a5,11a2 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    118c:	fd843783          	ld	a5,-40(s0)
    1190:	47bc                	lw	a5,72(a5)
    1192:	fd442703          	lw	a4,-44(s0)
    1196:	9fb9                	addw	a5,a5,a4
    1198:	0007871b          	sext.w	a4,a5
    119c:	fd843783          	ld	a5,-40(s0)
    11a0:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    11a2:	fe843783          	ld	a5,-24(s0)
    11a6:	07a1                	addi	a5,a5,8
    11a8:	00001597          	auipc	a1,0x1
    11ac:	24058593          	addi	a1,a1,576 # 23e8 <release_queue>
    11b0:	853e                	mv	a0,a5
    11b2:	00000097          	auipc	ra,0x0
    11b6:	d2a080e7          	jalr	-726(ra) # edc <list_add_tail>
}
    11ba:	0001                	nop
    11bc:	70a2                	ld	ra,40(sp)
    11be:	7402                	ld	s0,32(sp)
    11c0:	6145                	addi	sp,sp,48
    11c2:	8082                	ret

00000000000011c4 <__release>:

void __release()
{
    11c4:	7139                	addi	sp,sp,-64
    11c6:	fc06                	sd	ra,56(sp)
    11c8:	f822                	sd	s0,48(sp)
    11ca:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    11cc:	00001797          	auipc	a5,0x1
    11d0:	21c78793          	addi	a5,a5,540 # 23e8 <release_queue>
    11d4:	639c                	ld	a5,0(a5)
    11d6:	fcf43c23          	sd	a5,-40(s0)
    11da:	fd843783          	ld	a5,-40(s0)
    11de:	17e1                	addi	a5,a5,-8
    11e0:	fef43423          	sd	a5,-24(s0)
    11e4:	fe843783          	ld	a5,-24(s0)
    11e8:	679c                	ld	a5,8(a5)
    11ea:	fcf43823          	sd	a5,-48(s0)
    11ee:	fd043783          	ld	a5,-48(s0)
    11f2:	17e1                	addi	a5,a5,-8
    11f4:	fef43023          	sd	a5,-32(s0)
    11f8:	a0e9                	j	12c2 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    11fa:	fe843783          	ld	a5,-24(s0)
    11fe:	4f98                	lw	a4,24(a5)
    1200:	00001797          	auipc	a5,0x1
    1204:	22878793          	addi	a5,a5,552 # 2428 <threading_system_time>
    1208:	439c                	lw	a5,0(a5)
    120a:	08e7ce63          	blt	a5,a4,12a6 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    120e:	fe843783          	ld	a5,-24(s0)
    1212:	639c                	ld	a5,0(a5)
    1214:	5bbc                	lw	a5,112(a5)
    1216:	c79d                	beqz	a5,1244 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    1218:	fe843783          	ld	a5,-24(s0)
    121c:	639c                	ld	a5,0(a5)
    121e:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    1222:	fe843783          	ld	a5,-24(s0)
    1226:	6398                	ld	a4,0(a5)
    1228:	fe843783          	ld	a5,-24(s0)
    122c:	639c                	ld	a5,0(a5)
    122e:	5378                	lw	a4,100(a4)
    1230:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    1232:	fe843783          	ld	a5,-24(s0)
    1236:	6398                	ld	a4,0(a5)
    1238:	fe843783          	ld	a5,-24(s0)
    123c:	639c                	ld	a5,0(a5)
    123e:	5f78                	lw	a4,124(a4)
    1240:	cbf8                	sw	a4,84(a5)
    1242:	a809                	j	1254 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    1244:	fe843783          	ld	a5,-24(s0)
    1248:	6398                	ld	a4,0(a5)
    124a:	fe843783          	ld	a5,-24(s0)
    124e:	639c                	ld	a5,0(a5)
    1250:	4378                	lw	a4,68(a4)
    1252:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    1254:	fe843783          	ld	a5,-24(s0)
    1258:	4f94                	lw	a3,24(a5)
    125a:	fe843783          	ld	a5,-24(s0)
    125e:	639c                	ld	a5,0(a5)
    1260:	47b8                	lw	a4,72(a5)
    1262:	fe843783          	ld	a5,-24(s0)
    1266:	639c                	ld	a5,0(a5)
    1268:	9f35                	addw	a4,a4,a3
    126a:	2701                	sext.w	a4,a4
    126c:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    126e:	fe843783          	ld	a5,-24(s0)
    1272:	639c                	ld	a5,0(a5)
    1274:	02878793          	addi	a5,a5,40
    1278:	00001597          	auipc	a1,0x1
    127c:	16058593          	addi	a1,a1,352 # 23d8 <run_queue>
    1280:	853e                	mv	a0,a5
    1282:	00000097          	auipc	ra,0x0
    1286:	c5a080e7          	jalr	-934(ra) # edc <list_add_tail>
            list_del(&cur->thread_list);
    128a:	fe843783          	ld	a5,-24(s0)
    128e:	07a1                	addi	a5,a5,8
    1290:	853e                	mv	a0,a5
    1292:	00000097          	auipc	ra,0x0
    1296:	ca6080e7          	jalr	-858(ra) # f38 <list_del>
            free(cur);
    129a:	fe843503          	ld	a0,-24(s0)
    129e:	00000097          	auipc	ra,0x0
    12a2:	8a6080e7          	jalr	-1882(ra) # b44 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    12a6:	fe043783          	ld	a5,-32(s0)
    12aa:	fef43423          	sd	a5,-24(s0)
    12ae:	fe043783          	ld	a5,-32(s0)
    12b2:	679c                	ld	a5,8(a5)
    12b4:	fcf43423          	sd	a5,-56(s0)
    12b8:	fc843783          	ld	a5,-56(s0)
    12bc:	17e1                	addi	a5,a5,-8
    12be:	fef43023          	sd	a5,-32(s0)
    12c2:	fe843783          	ld	a5,-24(s0)
    12c6:	00878713          	addi	a4,a5,8
    12ca:	00001797          	auipc	a5,0x1
    12ce:	11e78793          	addi	a5,a5,286 # 23e8 <release_queue>
    12d2:	f2f714e3          	bne	a4,a5,11fa <__release+0x36>
        }
    }
}
    12d6:	0001                	nop
    12d8:	0001                	nop
    12da:	70e2                	ld	ra,56(sp)
    12dc:	7442                	ld	s0,48(sp)
    12de:	6121                	addi	sp,sp,64
    12e0:	8082                	ret

00000000000012e2 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    12e2:	1101                	addi	sp,sp,-32
    12e4:	ec06                	sd	ra,24(sp)
    12e6:	e822                	sd	s0,16(sp)
    12e8:	1000                	addi	s0,sp,32
    12ea:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    12ee:	fe843783          	ld	a5,-24(s0)
    12f2:	7b98                	ld	a4,48(a5)
    12f4:	00001797          	auipc	a5,0x1
    12f8:	12c78793          	addi	a5,a5,300 # 2420 <current>
    12fc:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    12fe:	fe843783          	ld	a5,-24(s0)
    1302:	02878793          	addi	a5,a5,40
    1306:	853e                	mv	a0,a5
    1308:	00000097          	auipc	ra,0x0
    130c:	c30080e7          	jalr	-976(ra) # f38 <list_del>

    free(to_remove->stack);
    1310:	fe843783          	ld	a5,-24(s0)
    1314:	6b9c                	ld	a5,16(a5)
    1316:	853e                	mv	a0,a5
    1318:	00000097          	auipc	ra,0x0
    131c:	82c080e7          	jalr	-2004(ra) # b44 <free>
    free(to_remove);
    1320:	fe843503          	ld	a0,-24(s0)
    1324:	00000097          	auipc	ra,0x0
    1328:	820080e7          	jalr	-2016(ra) # b44 <free>

    __schedule();
    132c:	00000097          	auipc	ra,0x0
    1330:	5e8080e7          	jalr	1512(ra) # 1914 <__schedule>
    __dispatch();
    1334:	00000097          	auipc	ra,0x0
    1338:	416080e7          	jalr	1046(ra) # 174a <__dispatch>
    thrdresume(main_thrd_id);
    133c:	00001797          	auipc	a5,0x1
    1340:	0bc78793          	addi	a5,a5,188 # 23f8 <main_thrd_id>
    1344:	439c                	lw	a5,0(a5)
    1346:	853e                	mv	a0,a5
    1348:	fffff097          	auipc	ra,0xfffff
    134c:	30e080e7          	jalr	782(ra) # 656 <thrdresume>
}
    1350:	0001                	nop
    1352:	60e2                	ld	ra,24(sp)
    1354:	6442                	ld	s0,16(sp)
    1356:	6105                	addi	sp,sp,32
    1358:	8082                	ret

000000000000135a <thread_exit>:

void thread_exit(void)
{
    135a:	7179                	addi	sp,sp,-48
    135c:	f406                	sd	ra,40(sp)
    135e:	f022                	sd	s0,32(sp)
    1360:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1362:	00001797          	auipc	a5,0x1
    1366:	0be78793          	addi	a5,a5,190 # 2420 <current>
    136a:	6398                	ld	a4,0(a5)
    136c:	00001797          	auipc	a5,0x1
    1370:	06c78793          	addi	a5,a5,108 # 23d8 <run_queue>
    1374:	02f71063          	bne	a4,a5,1394 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    1378:	00001597          	auipc	a1,0x1
    137c:	dc058593          	addi	a1,a1,-576 # 2138 <schedule_edf_cbs+0x54e>
    1380:	4509                	li	a0,2
    1382:	fffff097          	auipc	ra,0xfffff
    1386:	71a080e7          	jalr	1818(ra) # a9c <fprintf>
        exit(1);
    138a:	4505                	li	a0,1
    138c:	fffff097          	auipc	ra,0xfffff
    1390:	222080e7          	jalr	546(ra) # 5ae <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    1394:	00001797          	auipc	a5,0x1
    1398:	08c78793          	addi	a5,a5,140 # 2420 <current>
    139c:	639c                	ld	a5,0(a5)
    139e:	fef43423          	sd	a5,-24(s0)
    13a2:	fe843783          	ld	a5,-24(s0)
    13a6:	fd878793          	addi	a5,a5,-40
    13aa:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    13ae:	fe043783          	ld	a5,-32(s0)
    13b2:	5f9c                	lw	a5,56(a5)
    13b4:	4585                	li	a1,1
    13b6:	853e                	mv	a0,a5
    13b8:	fffff097          	auipc	ra,0xfffff
    13bc:	2a6080e7          	jalr	678(ra) # 65e <cancelthrdstop>
    13c0:	87aa                	mv	a5,a0
    13c2:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    13c6:	00001797          	auipc	a5,0x1
    13ca:	06278793          	addi	a5,a5,98 # 2428 <threading_system_time>
    13ce:	439c                	lw	a5,0(a5)
    13d0:	fdc42703          	lw	a4,-36(s0)
    13d4:	9fb9                	addw	a5,a5,a4
    13d6:	0007871b          	sext.w	a4,a5
    13da:	00001797          	auipc	a5,0x1
    13de:	04e78793          	addi	a5,a5,78 # 2428 <threading_system_time>
    13e2:	c398                	sw	a4,0(a5)

    __release();
    13e4:	00000097          	auipc	ra,0x0
    13e8:	de0080e7          	jalr	-544(ra) # 11c4 <__release>
    __thread_exit(to_remove);
    13ec:	fe043503          	ld	a0,-32(s0)
    13f0:	00000097          	auipc	ra,0x0
    13f4:	ef2080e7          	jalr	-270(ra) # 12e2 <__thread_exit>
}
    13f8:	0001                	nop
    13fa:	70a2                	ld	ra,40(sp)
    13fc:	7402                	ld	s0,32(sp)
    13fe:	6145                	addi	sp,sp,48
    1400:	8082                	ret

0000000000001402 <__finish_current>:

void __finish_current()
{
    1402:	7179                	addi	sp,sp,-48
    1404:	f406                	sd	ra,40(sp)
    1406:	f022                	sd	s0,32(sp)
    1408:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    140a:	00001797          	auipc	a5,0x1
    140e:	01678793          	addi	a5,a5,22 # 2420 <current>
    1412:	639c                	ld	a5,0(a5)
    1414:	fef43423          	sd	a5,-24(s0)
    1418:	fe843783          	ld	a5,-24(s0)
    141c:	fd878793          	addi	a5,a5,-40
    1420:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1424:	fe043783          	ld	a5,-32(s0)
    1428:	4bbc                	lw	a5,80(a5)
    142a:	37fd                	addiw	a5,a5,-1
    142c:	0007871b          	sext.w	a4,a5
    1430:	fe043783          	ld	a5,-32(s0)
    1434:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    1436:	fe043783          	ld	a5,-32(s0)
    143a:	5fd8                	lw	a4,60(a5)
    143c:	00001797          	auipc	a5,0x1
    1440:	fec78793          	addi	a5,a5,-20 # 2428 <threading_system_time>
    1444:	4390                	lw	a2,0(a5)
    1446:	fe043783          	ld	a5,-32(s0)
    144a:	4bbc                	lw	a5,80(a5)
    144c:	86be                	mv	a3,a5
    144e:	85ba                	mv	a1,a4
    1450:	00001517          	auipc	a0,0x1
    1454:	d2050513          	addi	a0,a0,-736 # 2170 <schedule_edf_cbs+0x586>
    1458:	fffff097          	auipc	ra,0xfffff
    145c:	69c080e7          	jalr	1692(ra) # af4 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1460:	fe043783          	ld	a5,-32(s0)
    1464:	4bbc                	lw	a5,80(a5)
    1466:	04f05563          	blez	a5,14b0 <__finish_current+0xae>
        struct list_head *to_remove = current;
    146a:	00001797          	auipc	a5,0x1
    146e:	fb678793          	addi	a5,a5,-74 # 2420 <current>
    1472:	639c                	ld	a5,0(a5)
    1474:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1478:	00001797          	auipc	a5,0x1
    147c:	fa878793          	addi	a5,a5,-88 # 2420 <current>
    1480:	639c                	ld	a5,0(a5)
    1482:	6798                	ld	a4,8(a5)
    1484:	00001797          	auipc	a5,0x1
    1488:	f9c78793          	addi	a5,a5,-100 # 2420 <current>
    148c:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    148e:	fd843503          	ld	a0,-40(s0)
    1492:	00000097          	auipc	ra,0x0
    1496:	aa6080e7          	jalr	-1370(ra) # f38 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    149a:	fe043783          	ld	a5,-32(s0)
    149e:	4fbc                	lw	a5,88(a5)
    14a0:	85be                	mv	a1,a5
    14a2:	fe043503          	ld	a0,-32(s0)
    14a6:	00000097          	auipc	ra,0x0
    14aa:	c9e080e7          	jalr	-866(ra) # 1144 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    14ae:	a039                	j	14bc <__finish_current+0xba>
        __thread_exit(current_thread);
    14b0:	fe043503          	ld	a0,-32(s0)
    14b4:	00000097          	auipc	ra,0x0
    14b8:	e2e080e7          	jalr	-466(ra) # 12e2 <__thread_exit>
}
    14bc:	0001                	nop
    14be:	70a2                	ld	ra,40(sp)
    14c0:	7402                	ld	s0,32(sp)
    14c2:	6145                	addi	sp,sp,48
    14c4:	8082                	ret

00000000000014c6 <__rt_finish_current>:
void __rt_finish_current()
{
    14c6:	7179                	addi	sp,sp,-48
    14c8:	f406                	sd	ra,40(sp)
    14ca:	f022                	sd	s0,32(sp)
    14cc:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    14ce:	00001797          	auipc	a5,0x1
    14d2:	f5278793          	addi	a5,a5,-174 # 2420 <current>
    14d6:	639c                	ld	a5,0(a5)
    14d8:	fef43423          	sd	a5,-24(s0)
    14dc:	fe843783          	ld	a5,-24(s0)
    14e0:	fd878793          	addi	a5,a5,-40
    14e4:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    14e8:	fe043783          	ld	a5,-32(s0)
    14ec:	4bbc                	lw	a5,80(a5)
    14ee:	37fd                	addiw	a5,a5,-1
    14f0:	0007871b          	sext.w	a4,a5
    14f4:	fe043783          	ld	a5,-32(s0)
    14f8:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    14fa:	fe043783          	ld	a5,-32(s0)
    14fe:	5fd8                	lw	a4,60(a5)
    1500:	00001797          	auipc	a5,0x1
    1504:	f2878793          	addi	a5,a5,-216 # 2428 <threading_system_time>
    1508:	4390                	lw	a2,0(a5)
    150a:	fe043783          	ld	a5,-32(s0)
    150e:	4bbc                	lw	a5,80(a5)
    1510:	86be                	mv	a3,a5
    1512:	85ba                	mv	a1,a4
    1514:	00001517          	auipc	a0,0x1
    1518:	c7450513          	addi	a0,a0,-908 # 2188 <schedule_edf_cbs+0x59e>
    151c:	fffff097          	auipc	ra,0xfffff
    1520:	5d8080e7          	jalr	1496(ra) # af4 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1524:	fe043783          	ld	a5,-32(s0)
    1528:	4bbc                	lw	a5,80(a5)
    152a:	04f05f63          	blez	a5,1588 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    152e:	00001797          	auipc	a5,0x1
    1532:	ef278793          	addi	a5,a5,-270 # 2420 <current>
    1536:	639c                	ld	a5,0(a5)
    1538:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    153c:	00001797          	auipc	a5,0x1
    1540:	ee478793          	addi	a5,a5,-284 # 2420 <current>
    1544:	639c                	ld	a5,0(a5)
    1546:	6798                	ld	a4,8(a5)
    1548:	00001797          	auipc	a5,0x1
    154c:	ed878793          	addi	a5,a5,-296 # 2420 <current>
    1550:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1552:	fd843503          	ld	a0,-40(s0)
    1556:	00000097          	auipc	ra,0x0
    155a:	9e2080e7          	jalr	-1566(ra) # f38 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    155e:	fe043783          	ld	a5,-32(s0)
    1562:	4fbc                	lw	a5,88(a5)
    1564:	85be                	mv	a1,a5
    1566:	fe043503          	ld	a0,-32(s0)
    156a:	00000097          	auipc	ra,0x0
    156e:	bda080e7          	jalr	-1062(ra) # 1144 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    1572:	fe043783          	ld	a5,-32(s0)
    1576:	57fc                	lw	a5,108(a5)
    1578:	ef91                	bnez	a5,1594 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    157a:	fe043783          	ld	a5,-32(s0)
    157e:	53f8                	lw	a4,100(a5)
    1580:	fe043783          	ld	a5,-32(s0)
    1584:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    1586:	a039                	j	1594 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    1588:	fe043503          	ld	a0,-32(s0)
    158c:	00000097          	auipc	ra,0x0
    1590:	d56080e7          	jalr	-682(ra) # 12e2 <__thread_exit>
}
    1594:	0001                	nop
    1596:	70a2                	ld	ra,40(sp)
    1598:	7402                	ld	s0,32(sp)
    159a:	6145                	addi	sp,sp,48
    159c:	8082                	ret

000000000000159e <switch_handler>:

void switch_handler(void *arg)
{
    159e:	7139                	addi	sp,sp,-64
    15a0:	fc06                	sd	ra,56(sp)
    15a2:	f822                	sd	s0,48(sp)
    15a4:	0080                	addi	s0,sp,64
    15a6:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    15aa:	fc843783          	ld	a5,-56(s0)
    15ae:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    15b2:	00001797          	auipc	a5,0x1
    15b6:	e6e78793          	addi	a5,a5,-402 # 2420 <current>
    15ba:	639c                	ld	a5,0(a5)
    15bc:	fef43023          	sd	a5,-32(s0)
    15c0:	fe043783          	ld	a5,-32(s0)
    15c4:	fd878793          	addi	a5,a5,-40
    15c8:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    15cc:	fe843783          	ld	a5,-24(s0)
    15d0:	0007871b          	sext.w	a4,a5
    15d4:	00001797          	auipc	a5,0x1
    15d8:	e5478793          	addi	a5,a5,-428 # 2428 <threading_system_time>
    15dc:	439c                	lw	a5,0(a5)
    15de:	2781                	sext.w	a5,a5
    15e0:	9fb9                	addw	a5,a5,a4
    15e2:	2781                	sext.w	a5,a5
    15e4:	0007871b          	sext.w	a4,a5
    15e8:	00001797          	auipc	a5,0x1
    15ec:	e4078793          	addi	a5,a5,-448 # 2428 <threading_system_time>
    15f0:	c398                	sw	a4,0(a5)
     __release();
    15f2:	00000097          	auipc	ra,0x0
    15f6:	bd2080e7          	jalr	-1070(ra) # 11c4 <__release>
    current_thread->remaining_time -= elapsed_time;
    15fa:	fd843783          	ld	a5,-40(s0)
    15fe:	4bfc                	lw	a5,84(a5)
    1600:	0007871b          	sext.w	a4,a5
    1604:	fe843783          	ld	a5,-24(s0)
    1608:	2781                	sext.w	a5,a5
    160a:	40f707bb          	subw	a5,a4,a5
    160e:	2781                	sext.w	a5,a5
    1610:	0007871b          	sext.w	a4,a5
    1614:	fd843783          	ld	a5,-40(s0)
    1618:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    161a:	fd843783          	ld	a5,-40(s0)
    161e:	57fc                	lw	a5,108(a5)
    1620:	e38d                	bnez	a5,1642 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    1622:	fd843783          	ld	a5,-40(s0)
    1626:	57bc                	lw	a5,104(a5)
    1628:	0007871b          	sext.w	a4,a5
    162c:	fe843783          	ld	a5,-24(s0)
    1630:	2781                	sext.w	a5,a5
    1632:	40f707bb          	subw	a5,a4,a5
    1636:	2781                	sext.w	a5,a5
    1638:	0007871b          	sext.w	a4,a5
    163c:	fd843783          	ld	a5,-40(s0)
    1640:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    1642:	fd843783          	ld	a5,-40(s0)
    1646:	43bc                	lw	a5,64(a5)
    1648:	c3ad                	beqz	a5,16aa <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    164a:	fd843783          	ld	a5,-40(s0)
    164e:	4fb8                	lw	a4,88(a5)
    1650:	00001797          	auipc	a5,0x1
    1654:	dd878793          	addi	a5,a5,-552 # 2428 <threading_system_time>
    1658:	439c                	lw	a5,0(a5)
    165a:	02f74163          	blt	a4,a5,167c <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    165e:	fd843783          	ld	a5,-40(s0)
    1662:	4fb8                	lw	a4,88(a5)
    1664:	00001797          	auipc	a5,0x1
    1668:	dc478793          	addi	a5,a5,-572 # 2428 <threading_system_time>
    166c:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    166e:	02f71e63          	bne	a4,a5,16aa <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1672:	fd843783          	ld	a5,-40(s0)
    1676:	4bfc                	lw	a5,84(a5)
    1678:	02f05963          	blez	a5,16aa <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    167c:	fd843783          	ld	a5,-40(s0)
    1680:	5fd8                	lw	a4,60(a5)
    1682:	00001797          	auipc	a5,0x1
    1686:	da678793          	addi	a5,a5,-602 # 2428 <threading_system_time>
    168a:	439c                	lw	a5,0(a5)
    168c:	863e                	mv	a2,a5
    168e:	85ba                	mv	a1,a4
    1690:	00001517          	auipc	a0,0x1
    1694:	b3050513          	addi	a0,a0,-1232 # 21c0 <schedule_edf_cbs+0x5d6>
    1698:	fffff097          	auipc	ra,0xfffff
    169c:	45c080e7          	jalr	1116(ra) # af4 <printf>
            exit(0);
    16a0:	4501                	li	a0,0
    16a2:	fffff097          	auipc	ra,0xfffff
    16a6:	f0c080e7          	jalr	-244(ra) # 5ae <exit>
        }

    if (current_thread->remaining_time <= 0) {
    16aa:	fd843783          	ld	a5,-40(s0)
    16ae:	4bfc                	lw	a5,84(a5)
    16b0:	02f04063          	bgtz	a5,16d0 <switch_handler+0x132>
        if (current_thread->is_real_time)
    16b4:	fd843783          	ld	a5,-40(s0)
    16b8:	43bc                	lw	a5,64(a5)
    16ba:	c791                	beqz	a5,16c6 <switch_handler+0x128>
            __rt_finish_current();
    16bc:	00000097          	auipc	ra,0x0
    16c0:	e0a080e7          	jalr	-502(ra) # 14c6 <__rt_finish_current>
    16c4:	a881                	j	1714 <switch_handler+0x176>
        else
            __finish_current();
    16c6:	00000097          	auipc	ra,0x0
    16ca:	d3c080e7          	jalr	-708(ra) # 1402 <__finish_current>
    16ce:	a099                	j	1714 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    16d0:	00001797          	auipc	a5,0x1
    16d4:	d5078793          	addi	a5,a5,-688 # 2420 <current>
    16d8:	639c                	ld	a5,0(a5)
    16da:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    16de:	00001797          	auipc	a5,0x1
    16e2:	d4278793          	addi	a5,a5,-702 # 2420 <current>
    16e6:	639c                	ld	a5,0(a5)
    16e8:	6798                	ld	a4,8(a5)
    16ea:	00001797          	auipc	a5,0x1
    16ee:	d3678793          	addi	a5,a5,-714 # 2420 <current>
    16f2:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    16f4:	fd043503          	ld	a0,-48(s0)
    16f8:	00000097          	auipc	ra,0x0
    16fc:	840080e7          	jalr	-1984(ra) # f38 <list_del>
        list_add_tail(to_remove, &run_queue);
    1700:	00001597          	auipc	a1,0x1
    1704:	cd858593          	addi	a1,a1,-808 # 23d8 <run_queue>
    1708:	fd043503          	ld	a0,-48(s0)
    170c:	fffff097          	auipc	ra,0xfffff
    1710:	7d0080e7          	jalr	2000(ra) # edc <list_add_tail>
    }

    __release();
    1714:	00000097          	auipc	ra,0x0
    1718:	ab0080e7          	jalr	-1360(ra) # 11c4 <__release>
    __schedule();
    171c:	00000097          	auipc	ra,0x0
    1720:	1f8080e7          	jalr	504(ra) # 1914 <__schedule>
    __dispatch();
    1724:	00000097          	auipc	ra,0x0
    1728:	026080e7          	jalr	38(ra) # 174a <__dispatch>
    thrdresume(main_thrd_id);
    172c:	00001797          	auipc	a5,0x1
    1730:	ccc78793          	addi	a5,a5,-820 # 23f8 <main_thrd_id>
    1734:	439c                	lw	a5,0(a5)
    1736:	853e                	mv	a0,a5
    1738:	fffff097          	auipc	ra,0xfffff
    173c:	f1e080e7          	jalr	-226(ra) # 656 <thrdresume>
}
    1740:	0001                	nop
    1742:	70e2                	ld	ra,56(sp)
    1744:	7442                	ld	s0,48(sp)
    1746:	6121                	addi	sp,sp,64
    1748:	8082                	ret

000000000000174a <__dispatch>:

void __dispatch()
{
    174a:	7179                	addi	sp,sp,-48
    174c:	f406                	sd	ra,40(sp)
    174e:	f022                	sd	s0,32(sp)
    1750:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1752:	00001797          	auipc	a5,0x1
    1756:	cce78793          	addi	a5,a5,-818 # 2420 <current>
    175a:	6398                	ld	a4,0(a5)
    175c:	00001797          	auipc	a5,0x1
    1760:	c7c78793          	addi	a5,a5,-900 # 23d8 <run_queue>
    1764:	1af70363          	beq	a4,a5,190a <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1768:	00001797          	auipc	a5,0x1
    176c:	cb878793          	addi	a5,a5,-840 # 2420 <current>
    1770:	639c                	ld	a5,0(a5)
    1772:	fef43423          	sd	a5,-24(s0)
    1776:	fe843783          	ld	a5,-24(s0)
    177a:	fd878793          	addi	a5,a5,-40
    177e:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    1782:	fe043783          	ld	a5,-32(s0)
    1786:	5fcc                	lw	a1,60(a5)
    1788:	00001797          	auipc	a5,0x1
    178c:	ca078793          	addi	a5,a5,-864 # 2428 <threading_system_time>
    1790:	4390                	lw	a2,0(a5)
    1792:	00001797          	auipc	a5,0x1
    1796:	c9e78793          	addi	a5,a5,-866 # 2430 <allocated_time>
    179a:	6394                	ld	a3,0(a5)
    179c:	fe043783          	ld	a5,-32(s0)
    17a0:	4bfc                	lw	a5,84(a5)
    17a2:	873e                	mv	a4,a5
    17a4:	00001517          	auipc	a0,0x1
    17a8:	a4c50513          	addi	a0,a0,-1460 # 21f0 <schedule_edf_cbs+0x606>
    17ac:	fffff097          	auipc	ra,0xfffff
    17b0:	348080e7          	jalr	840(ra) # af4 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    17b4:	fe043783          	ld	a5,-32(s0)
    17b8:	43bc                	lw	a5,64(a5)
    17ba:	c3a1                	beqz	a5,17fa <__dispatch+0xb0>
    17bc:	00001797          	auipc	a5,0x1
    17c0:	c7478793          	addi	a5,a5,-908 # 2430 <allocated_time>
    17c4:	639c                	ld	a5,0(a5)
    17c6:	eb95                	bnez	a5,17fa <__dispatch+0xb0>
    17c8:	fe043783          	ld	a5,-32(s0)
    17cc:	57fc                	lw	a5,108(a5)
    17ce:	c795                	beqz	a5,17fa <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    17d0:	fe043783          	ld	a5,-32(s0)
    17d4:	5fd8                	lw	a4,60(a5)
    17d6:	fe043783          	ld	a5,-32(s0)
    17da:	4fbc                	lw	a5,88(a5)
    17dc:	863e                	mv	a2,a5
    17de:	85ba                	mv	a1,a4
    17e0:	00001517          	auipc	a0,0x1
    17e4:	a6050513          	addi	a0,a0,-1440 # 2240 <schedule_edf_cbs+0x656>
    17e8:	fffff097          	auipc	ra,0xfffff
    17ec:	30c080e7          	jalr	780(ra) # af4 <printf>
        exit(0);
    17f0:	4501                	li	a0,0
    17f2:	fffff097          	auipc	ra,0xfffff
    17f6:	dbc080e7          	jalr	-580(ra) # 5ae <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    17fa:	fe043783          	ld	a5,-32(s0)
    17fe:	5fd8                	lw	a4,60(a5)
    1800:	00001797          	auipc	a5,0x1
    1804:	c2878793          	addi	a5,a5,-984 # 2428 <threading_system_time>
    1808:	4390                	lw	a2,0(a5)
    180a:	00001797          	auipc	a5,0x1
    180e:	c2678793          	addi	a5,a5,-986 # 2430 <allocated_time>
    1812:	639c                	ld	a5,0(a5)
    1814:	86be                	mv	a3,a5
    1816:	85ba                	mv	a1,a4
    1818:	00001517          	auipc	a0,0x1
    181c:	a5850513          	addi	a0,a0,-1448 # 2270 <schedule_edf_cbs+0x686>
    1820:	fffff097          	auipc	ra,0xfffff
    1824:	2d4080e7          	jalr	724(ra) # af4 <printf>

    if (current_thread->buf_set) {
    1828:	fe043783          	ld	a5,-32(s0)
    182c:	539c                	lw	a5,32(a5)
    182e:	c7a1                	beqz	a5,1876 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1830:	00001797          	auipc	a5,0x1
    1834:	c0078793          	addi	a5,a5,-1024 # 2430 <allocated_time>
    1838:	639c                	ld	a5,0(a5)
    183a:	0007871b          	sext.w	a4,a5
    183e:	fe043783          	ld	a5,-32(s0)
    1842:	03878593          	addi	a1,a5,56
    1846:	00001797          	auipc	a5,0x1
    184a:	bea78793          	addi	a5,a5,-1046 # 2430 <allocated_time>
    184e:	639c                	ld	a5,0(a5)
    1850:	86be                	mv	a3,a5
    1852:	00000617          	auipc	a2,0x0
    1856:	d4c60613          	addi	a2,a2,-692 # 159e <switch_handler>
    185a:	853a                	mv	a0,a4
    185c:	fffff097          	auipc	ra,0xfffff
    1860:	df2080e7          	jalr	-526(ra) # 64e <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    1864:	fe043783          	ld	a5,-32(s0)
    1868:	5f9c                	lw	a5,56(a5)
    186a:	853e                	mv	a0,a5
    186c:	fffff097          	auipc	ra,0xfffff
    1870:	dea080e7          	jalr	-534(ra) # 656 <thrdresume>
    1874:	a071                	j	1900 <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    1876:	fe043783          	ld	a5,-32(s0)
    187a:	4705                	li	a4,1
    187c:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    187e:	fe043783          	ld	a5,-32(s0)
    1882:	6f9c                	ld	a5,24(a5)
    1884:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1888:	fe043783          	ld	a5,-32(s0)
    188c:	577d                	li	a4,-1
    188e:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1890:	00001797          	auipc	a5,0x1
    1894:	ba078793          	addi	a5,a5,-1120 # 2430 <allocated_time>
    1898:	639c                	ld	a5,0(a5)
    189a:	0007871b          	sext.w	a4,a5
    189e:	fe043783          	ld	a5,-32(s0)
    18a2:	03878593          	addi	a1,a5,56
    18a6:	00001797          	auipc	a5,0x1
    18aa:	b8a78793          	addi	a5,a5,-1142 # 2430 <allocated_time>
    18ae:	639c                	ld	a5,0(a5)
    18b0:	86be                	mv	a3,a5
    18b2:	00000617          	auipc	a2,0x0
    18b6:	cec60613          	addi	a2,a2,-788 # 159e <switch_handler>
    18ba:	853a                	mv	a0,a4
    18bc:	fffff097          	auipc	ra,0xfffff
    18c0:	d92080e7          	jalr	-622(ra) # 64e <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    18c4:	fe043783          	ld	a5,-32(s0)
    18c8:	5f9c                	lw	a5,56(a5)
    18ca:	0207d063          	bgez	a5,18ea <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    18ce:	00001597          	auipc	a1,0x1
    18d2:	9d258593          	addi	a1,a1,-1582 # 22a0 <schedule_edf_cbs+0x6b6>
    18d6:	4509                	li	a0,2
    18d8:	fffff097          	auipc	ra,0xfffff
    18dc:	1c4080e7          	jalr	452(ra) # a9c <fprintf>
            exit(1);
    18e0:	4505                	li	a0,1
    18e2:	fffff097          	auipc	ra,0xfffff
    18e6:	ccc080e7          	jalr	-820(ra) # 5ae <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    18ea:	fd843783          	ld	a5,-40(s0)
    18ee:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    18f0:	fe043783          	ld	a5,-32(s0)
    18f4:	6398                	ld	a4,0(a5)
    18f6:	fe043783          	ld	a5,-32(s0)
    18fa:	679c                	ld	a5,8(a5)
    18fc:	853e                	mv	a0,a5
    18fe:	9702                	jalr	a4
    }
    thread_exit();
    1900:	00000097          	auipc	ra,0x0
    1904:	a5a080e7          	jalr	-1446(ra) # 135a <thread_exit>
    1908:	a011                	j	190c <__dispatch+0x1c2>
        return;
    190a:	0001                	nop
}
    190c:	70a2                	ld	ra,40(sp)
    190e:	7402                	ld	s0,32(sp)
    1910:	6145                	addi	sp,sp,48
    1912:	8082                	ret

0000000000001914 <__schedule>:

void __schedule()
{
    1914:	711d                	addi	sp,sp,-96
    1916:	ec86                	sd	ra,88(sp)
    1918:	e8a2                	sd	s0,80(sp)
    191a:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    191c:	00001797          	auipc	a5,0x1
    1920:	b0c78793          	addi	a5,a5,-1268 # 2428 <threading_system_time>
    1924:	439c                	lw	a5,0(a5)
    1926:	fcf42c23          	sw	a5,-40(s0)
    192a:	4789                	li	a5,2
    192c:	fcf42e23          	sw	a5,-36(s0)
    1930:	00001797          	auipc	a5,0x1
    1934:	aa878793          	addi	a5,a5,-1368 # 23d8 <run_queue>
    1938:	fef43023          	sd	a5,-32(s0)
    193c:	00001797          	auipc	a5,0x1
    1940:	aac78793          	addi	a5,a5,-1364 # 23e8 <release_queue>
    1944:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    1948:	fd843783          	ld	a5,-40(s0)
    194c:	faf43023          	sd	a5,-96(s0)
    1950:	fe043783          	ld	a5,-32(s0)
    1954:	faf43423          	sd	a5,-88(s0)
    1958:	fe843783          	ld	a5,-24(s0)
    195c:	faf43823          	sd	a5,-80(s0)
    1960:	fa040793          	addi	a5,s0,-96
    1964:	853e                	mv	a0,a5
    1966:	00000097          	auipc	ra,0x0
    196a:	284080e7          	jalr	644(ra) # 1bea <schedule_edf_cbs>
    196e:	872a                	mv	a4,a0
    1970:	87ae                	mv	a5,a1
    1972:	fce43423          	sd	a4,-56(s0)
    1976:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    197a:	fc843703          	ld	a4,-56(s0)
    197e:	00001797          	auipc	a5,0x1
    1982:	aa278793          	addi	a5,a5,-1374 # 2420 <current>
    1986:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1988:	fd042783          	lw	a5,-48(s0)
    198c:	873e                	mv	a4,a5
    198e:	00001797          	auipc	a5,0x1
    1992:	aa278793          	addi	a5,a5,-1374 # 2430 <allocated_time>
    1996:	e398                	sd	a4,0(a5)
}
    1998:	0001                	nop
    199a:	60e6                	ld	ra,88(sp)
    199c:	6446                	ld	s0,80(sp)
    199e:	6125                	addi	sp,sp,96
    19a0:	8082                	ret

00000000000019a2 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    19a2:	1101                	addi	sp,sp,-32
    19a4:	ec06                	sd	ra,24(sp)
    19a6:	e822                	sd	s0,16(sp)
    19a8:	1000                	addi	s0,sp,32
    19aa:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    19ae:	00001797          	auipc	a5,0x1
    19b2:	a7e78793          	addi	a5,a5,-1410 # 242c <sleeping>
    19b6:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    19ba:	fe843783          	ld	a5,-24(s0)
    19be:	0007871b          	sext.w	a4,a5
    19c2:	00001797          	auipc	a5,0x1
    19c6:	a6678793          	addi	a5,a5,-1434 # 2428 <threading_system_time>
    19ca:	439c                	lw	a5,0(a5)
    19cc:	2781                	sext.w	a5,a5
    19ce:	9fb9                	addw	a5,a5,a4
    19d0:	2781                	sext.w	a5,a5
    19d2:	0007871b          	sext.w	a4,a5
    19d6:	00001797          	auipc	a5,0x1
    19da:	a5278793          	addi	a5,a5,-1454 # 2428 <threading_system_time>
    19de:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    19e0:	00001797          	auipc	a5,0x1
    19e4:	a1878793          	addi	a5,a5,-1512 # 23f8 <main_thrd_id>
    19e8:	439c                	lw	a5,0(a5)
    19ea:	853e                	mv	a0,a5
    19ec:	fffff097          	auipc	ra,0xfffff
    19f0:	c6a080e7          	jalr	-918(ra) # 656 <thrdresume>
}
    19f4:	0001                	nop
    19f6:	60e2                	ld	ra,24(sp)
    19f8:	6442                	ld	s0,16(sp)
    19fa:	6105                	addi	sp,sp,32
    19fc:	8082                	ret

00000000000019fe <thread_start_threading>:

void thread_start_threading()
{
    19fe:	1141                	addi	sp,sp,-16
    1a00:	e406                	sd	ra,8(sp)
    1a02:	e022                	sd	s0,0(sp)
    1a04:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1a06:	00001797          	auipc	a5,0x1
    1a0a:	a2278793          	addi	a5,a5,-1502 # 2428 <threading_system_time>
    1a0e:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    1a12:	00001797          	auipc	a5,0x1
    1a16:	a0e78793          	addi	a5,a5,-1522 # 2420 <current>
    1a1a:	00001717          	auipc	a4,0x1
    1a1e:	9be70713          	addi	a4,a4,-1602 # 23d8 <run_queue>
    1a22:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1a24:	4681                	li	a3,0
    1a26:	00000617          	auipc	a2,0x0
    1a2a:	f7c60613          	addi	a2,a2,-132 # 19a2 <back_to_main_handler>
    1a2e:	00001597          	auipc	a1,0x1
    1a32:	9ca58593          	addi	a1,a1,-1590 # 23f8 <main_thrd_id>
    1a36:	3e800513          	li	a0,1000
    1a3a:	fffff097          	auipc	ra,0xfffff
    1a3e:	c14080e7          	jalr	-1004(ra) # 64e <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    1a42:	00001797          	auipc	a5,0x1
    1a46:	9b678793          	addi	a5,a5,-1610 # 23f8 <main_thrd_id>
    1a4a:	439c                	lw	a5,0(a5)
    1a4c:	4581                	li	a1,0
    1a4e:	853e                	mv	a0,a5
    1a50:	fffff097          	auipc	ra,0xfffff
    1a54:	c0e080e7          	jalr	-1010(ra) # 65e <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1a58:	a0c9                	j	1b1a <thread_start_threading+0x11c>
        __release();
    1a5a:	fffff097          	auipc	ra,0xfffff
    1a5e:	76a080e7          	jalr	1898(ra) # 11c4 <__release>
        __schedule();
    1a62:	00000097          	auipc	ra,0x0
    1a66:	eb2080e7          	jalr	-334(ra) # 1914 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1a6a:	00001797          	auipc	a5,0x1
    1a6e:	98e78793          	addi	a5,a5,-1650 # 23f8 <main_thrd_id>
    1a72:	439c                	lw	a5,0(a5)
    1a74:	4581                	li	a1,0
    1a76:	853e                	mv	a0,a5
    1a78:	fffff097          	auipc	ra,0xfffff
    1a7c:	be6080e7          	jalr	-1050(ra) # 65e <cancelthrdstop>
        __dispatch();
    1a80:	00000097          	auipc	ra,0x0
    1a84:	cca080e7          	jalr	-822(ra) # 174a <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1a88:	00001517          	auipc	a0,0x1
    1a8c:	95050513          	addi	a0,a0,-1712 # 23d8 <run_queue>
    1a90:	fffff097          	auipc	ra,0xfffff
    1a94:	4f2080e7          	jalr	1266(ra) # f82 <list_empty>
    1a98:	87aa                	mv	a5,a0
    1a9a:	cb99                	beqz	a5,1ab0 <thread_start_threading+0xb2>
    1a9c:	00001517          	auipc	a0,0x1
    1aa0:	94c50513          	addi	a0,a0,-1716 # 23e8 <release_queue>
    1aa4:	fffff097          	auipc	ra,0xfffff
    1aa8:	4de080e7          	jalr	1246(ra) # f82 <list_empty>
    1aac:	87aa                	mv	a5,a0
    1aae:	ebd9                	bnez	a5,1b44 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1ab0:	00001797          	auipc	a5,0x1
    1ab4:	98078793          	addi	a5,a5,-1664 # 2430 <allocated_time>
    1ab8:	639c                	ld	a5,0(a5)
    1aba:	85be                	mv	a1,a5
    1abc:	00001517          	auipc	a0,0x1
    1ac0:	81c50513          	addi	a0,a0,-2020 # 22d8 <schedule_edf_cbs+0x6ee>
    1ac4:	fffff097          	auipc	ra,0xfffff
    1ac8:	030080e7          	jalr	48(ra) # af4 <printf>
        sleeping = 1;
    1acc:	00001797          	auipc	a5,0x1
    1ad0:	96078793          	addi	a5,a5,-1696 # 242c <sleeping>
    1ad4:	4705                	li	a4,1
    1ad6:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1ad8:	00001797          	auipc	a5,0x1
    1adc:	95878793          	addi	a5,a5,-1704 # 2430 <allocated_time>
    1ae0:	639c                	ld	a5,0(a5)
    1ae2:	0007871b          	sext.w	a4,a5
    1ae6:	00001797          	auipc	a5,0x1
    1aea:	94a78793          	addi	a5,a5,-1718 # 2430 <allocated_time>
    1aee:	639c                	ld	a5,0(a5)
    1af0:	86be                	mv	a3,a5
    1af2:	00000617          	auipc	a2,0x0
    1af6:	eb060613          	addi	a2,a2,-336 # 19a2 <back_to_main_handler>
    1afa:	00001597          	auipc	a1,0x1
    1afe:	8fe58593          	addi	a1,a1,-1794 # 23f8 <main_thrd_id>
    1b02:	853a                	mv	a0,a4
    1b04:	fffff097          	auipc	ra,0xfffff
    1b08:	b4a080e7          	jalr	-1206(ra) # 64e <thrdstop>
        while (sleeping) {
    1b0c:	0001                	nop
    1b0e:	00001797          	auipc	a5,0x1
    1b12:	91e78793          	addi	a5,a5,-1762 # 242c <sleeping>
    1b16:	439c                	lw	a5,0(a5)
    1b18:	fbfd                	bnez	a5,1b0e <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1b1a:	00001517          	auipc	a0,0x1
    1b1e:	8be50513          	addi	a0,a0,-1858 # 23d8 <run_queue>
    1b22:	fffff097          	auipc	ra,0xfffff
    1b26:	460080e7          	jalr	1120(ra) # f82 <list_empty>
    1b2a:	87aa                	mv	a5,a0
    1b2c:	d79d                	beqz	a5,1a5a <thread_start_threading+0x5c>
    1b2e:	00001517          	auipc	a0,0x1
    1b32:	8ba50513          	addi	a0,a0,-1862 # 23e8 <release_queue>
    1b36:	fffff097          	auipc	ra,0xfffff
    1b3a:	44c080e7          	jalr	1100(ra) # f82 <list_empty>
    1b3e:	87aa                	mv	a5,a0
    1b40:	df89                	beqz	a5,1a5a <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1b42:	a011                	j	1b46 <thread_start_threading+0x148>
            break;
    1b44:	0001                	nop
}
    1b46:	0001                	nop
    1b48:	60a2                	ld	ra,8(sp)
    1b4a:	6402                	ld	s0,0(sp)
    1b4c:	0141                	addi	sp,sp,16
    1b4e:	8082                	ret

0000000000001b50 <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1b50:	7139                	addi	sp,sp,-64
    1b52:	fc22                	sd	s0,56(sp)
    1b54:	0080                	addi	s0,sp,64
    1b56:	fca43423          	sd	a0,-56(s0)
    1b5a:	87ae                	mv	a5,a1
    1b5c:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1b60:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1b64:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1b68:	fc843783          	ld	a5,-56(s0)
    1b6c:	639c                	ld	a5,0(a5)
    1b6e:	fcf43c23          	sd	a5,-40(s0)
    1b72:	fd843783          	ld	a5,-40(s0)
    1b76:	fd878793          	addi	a5,a5,-40
    1b7a:	fef43423          	sd	a5,-24(s0)
    1b7e:	a881                	j	1bce <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1b80:	fe843783          	ld	a5,-24(s0)
    1b84:	4fb8                	lw	a4,88(a5)
    1b86:	fc442783          	lw	a5,-60(s0)
    1b8a:	2781                	sext.w	a5,a5
    1b8c:	02e7c663          	blt	a5,a4,1bb8 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1b90:	fe043783          	ld	a5,-32(s0)
    1b94:	e791                	bnez	a5,1ba0 <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1b96:	fe843783          	ld	a5,-24(s0)
    1b9a:	fef43023          	sd	a5,-32(s0)
    1b9e:	a829                	j	1bb8 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1ba0:	fe843783          	ld	a5,-24(s0)
    1ba4:	5fd8                	lw	a4,60(a5)
    1ba6:	fe043783          	ld	a5,-32(s0)
    1baa:	5fdc                	lw	a5,60(a5)
    1bac:	00f75663          	bge	a4,a5,1bb8 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1bb0:	fe843783          	ld	a5,-24(s0)
    1bb4:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1bb8:	fe843783          	ld	a5,-24(s0)
    1bbc:	779c                	ld	a5,40(a5)
    1bbe:	fcf43823          	sd	a5,-48(s0)
    1bc2:	fd043783          	ld	a5,-48(s0)
    1bc6:	fd878793          	addi	a5,a5,-40
    1bca:	fef43423          	sd	a5,-24(s0)
    1bce:	fe843783          	ld	a5,-24(s0)
    1bd2:	02878793          	addi	a5,a5,40
    1bd6:	fc843703          	ld	a4,-56(s0)
    1bda:	faf713e3          	bne	a4,a5,1b80 <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1bde:	fe043783          	ld	a5,-32(s0)
}
    1be2:	853e                	mv	a0,a5
    1be4:	7462                	ld	s0,56(sp)
    1be6:	6121                	addi	sp,sp,64
    1be8:	8082                	ret

0000000000001bea <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1bea:	7131                	addi	sp,sp,-192
    1bec:	fd06                	sd	ra,184(sp)
    1bee:	f922                	sd	s0,176(sp)
    1bf0:	f526                	sd	s1,168(sp)
    1bf2:	f14a                	sd	s2,160(sp)
    1bf4:	ed4e                	sd	s3,152(sp)
    1bf6:	0180                	addi	s0,sp,192
    1bf8:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1bfa:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1bfe:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1c02:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1c06:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1c0a:	649c                	ld	a5,8(s1)
    1c0c:	4098                	lw	a4,0(s1)
    1c0e:	85ba                	mv	a1,a4
    1c10:	853e                	mv	a0,a5
    1c12:	00000097          	auipc	ra,0x0
    1c16:	f3e080e7          	jalr	-194(ra) # 1b50 <__check_deadline_miss>
    1c1a:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1c1e:	f9843783          	ld	a5,-104(s0)
    1c22:	c7b5                	beqz	a5,1c8e <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1c24:	f9843783          	ld	a5,-104(s0)
    1c28:	5fdc                	lw	a5,60(a5)
    1c2a:	85be                	mv	a1,a5
    1c2c:	00000517          	auipc	a0,0x0
    1c30:	6d450513          	addi	a0,a0,1748 # 2300 <schedule_edf_cbs+0x716>
    1c34:	fffff097          	auipc	ra,0xfffff
    1c38:	ec0080e7          	jalr	-320(ra) # af4 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1c3c:	f9843783          	ld	a5,-104(s0)
    1c40:	57fc                	lw	a5,108(a5)
    1c42:	c395                	beqz	a5,1c66 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1c44:	f9843783          	ld	a5,-104(s0)
    1c48:	02878793          	addi	a5,a5,40
    1c4c:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1c50:	f4042423          	sw	zero,-184(s0)
            return r;
    1c54:	f4043783          	ld	a5,-192(s0)
    1c58:	f4f43823          	sd	a5,-176(s0)
    1c5c:	f4843783          	ld	a5,-184(s0)
    1c60:	f4f43c23          	sd	a5,-168(s0)
    1c64:	a13d                	j	2092 <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1c66:	4098                	lw	a4,0(s1)
    1c68:	f9843783          	ld	a5,-104(s0)
    1c6c:	47fc                	lw	a5,76(a5)
    1c6e:	9fb9                	addw	a5,a5,a4
    1c70:	0007871b          	sext.w	a4,a5
    1c74:	f9843783          	ld	a5,-104(s0)
    1c78:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1c7a:	f9843783          	ld	a5,-104(s0)
    1c7e:	53f8                	lw	a4,100(a5)
    1c80:	f9843783          	ld	a5,-104(s0)
    1c84:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1c86:	f9843783          	ld	a5,-104(s0)
    1c8a:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1c8e:	fa043783          	ld	a5,-96(s0)
    1c92:	e7dd                	bnez	a5,1d40 <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1c94:	649c                	ld	a5,8(s1)
    1c96:	639c                	ld	a5,0(a5)
    1c98:	f8f43823          	sd	a5,-112(s0)
    1c9c:	f9043783          	ld	a5,-112(s0)
    1ca0:	fd878793          	addi	a5,a5,-40
    1ca4:	faf43c23          	sd	a5,-72(s0)
    1ca8:	a069                	j	1d32 <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1caa:	fb843783          	ld	a5,-72(s0)
    1cae:	5fd8                	lw	a4,60(a5)
    1cb0:	fb843783          	ld	a5,-72(s0)
    1cb4:	5bbc                	lw	a5,112(a5)
    1cb6:	863e                	mv	a2,a5
    1cb8:	85ba                	mv	a1,a4
    1cba:	00000517          	auipc	a0,0x0
    1cbe:	67e50513          	addi	a0,a0,1662 # 2338 <schedule_edf_cbs+0x74e>
    1cc2:	fffff097          	auipc	ra,0xfffff
    1cc6:	e32080e7          	jalr	-462(ra) # af4 <printf>
            if (next == NULL)
    1cca:	fa043783          	ld	a5,-96(s0)
    1cce:	e791                	bnez	a5,1cda <schedule_edf_cbs+0xf0>
                next = th;
    1cd0:	fb843783          	ld	a5,-72(s0)
    1cd4:	faf43023          	sd	a5,-96(s0)
    1cd8:	a091                	j	1d1c <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1cda:	fb843783          	ld	a5,-72(s0)
    1cde:	4fb8                	lw	a4,88(a5)
    1ce0:	fa043783          	ld	a5,-96(s0)
    1ce4:	4fbc                	lw	a5,88(a5)
    1ce6:	00f75763          	bge	a4,a5,1cf4 <schedule_edf_cbs+0x10a>
                next = th;
    1cea:	fb843783          	ld	a5,-72(s0)
    1cee:	faf43023          	sd	a5,-96(s0)
    1cf2:	a02d                	j	1d1c <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1cf4:	fb843783          	ld	a5,-72(s0)
    1cf8:	4fb8                	lw	a4,88(a5)
    1cfa:	fa043783          	ld	a5,-96(s0)
    1cfe:	4fbc                	lw	a5,88(a5)
    1d00:	00f71e63          	bne	a4,a5,1d1c <schedule_edf_cbs+0x132>
    1d04:	fb843783          	ld	a5,-72(s0)
    1d08:	5fd8                	lw	a4,60(a5)
    1d0a:	fa043783          	ld	a5,-96(s0)
    1d0e:	5fdc                	lw	a5,60(a5)
    1d10:	00f75663          	bge	a4,a5,1d1c <schedule_edf_cbs+0x132>
                next = th;
    1d14:	fb843783          	ld	a5,-72(s0)
    1d18:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1d1c:	fb843783          	ld	a5,-72(s0)
    1d20:	779c                	ld	a5,40(a5)
    1d22:	f8f43423          	sd	a5,-120(s0)
    1d26:	f8843783          	ld	a5,-120(s0)
    1d2a:	fd878793          	addi	a5,a5,-40
    1d2e:	faf43c23          	sd	a5,-72(s0)
    1d32:	fb843783          	ld	a5,-72(s0)
    1d36:	02878713          	addi	a4,a5,40
    1d3a:	649c                	ld	a5,8(s1)
    1d3c:	f6f717e3          	bne	a4,a5,1caa <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1d40:	fa043783          	ld	a5,-96(s0)
    1d44:	5fdc                	lw	a5,60(a5)
    1d46:	85be                	mv	a1,a5
    1d48:	00000517          	auipc	a0,0x0
    1d4c:	62850513          	addi	a0,a0,1576 # 2370 <schedule_edf_cbs+0x786>
    1d50:	fffff097          	auipc	ra,0xfffff
    1d54:	da4080e7          	jalr	-604(ra) # af4 <printf>

    if(next && next->cbs.is_throttled){
    1d58:	fa043783          	ld	a5,-96(s0)
    1d5c:	cb95                	beqz	a5,1d90 <schedule_edf_cbs+0x1a6>
    1d5e:	fa043783          	ld	a5,-96(s0)
    1d62:	5bbc                	lw	a5,112(a5)
    1d64:	c795                	beqz	a5,1d90 <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1d66:	fa043783          	ld	a5,-96(s0)
    1d6a:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1d6e:	fa043783          	ld	a5,-96(s0)
    1d72:	02878793          	addi	a5,a5,40
    1d76:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1d7a:	f4042423          	sw	zero,-184(s0)
        return r;
    1d7e:	f4043783          	ld	a5,-192(s0)
    1d82:	f4f43823          	sd	a5,-176(s0)
    1d86:	f4843783          	ld	a5,-184(s0)
    1d8a:	f4f43c23          	sd	a5,-168(s0)
    1d8e:	a611                	j	2092 <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1d90:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1d94:	689c                	ld	a5,16(s1)
    1d96:	639c                	ld	a5,0(a5)
    1d98:	f8f43023          	sd	a5,-128(s0)
    1d9c:	f8043783          	ld	a5,-128(s0)
    1da0:	17e1                	addi	a5,a5,-8
    1da2:	fcf43023          	sd	a5,-64(s0)
    1da6:	a0b5                	j	1e12 <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1da8:	fa843783          	ld	a5,-88(s0)
    1dac:	e791                	bnez	a5,1db8 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1dae:	fc043783          	ld	a5,-64(s0)
    1db2:	faf43423          	sd	a5,-88(s0)
    1db6:	a0a1                	j	1dfe <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1db8:	fa843783          	ld	a5,-88(s0)
    1dbc:	4f98                	lw	a4,24(a5)
    1dbe:	fc043783          	ld	a5,-64(s0)
    1dc2:	4f9c                	lw	a5,24(a5)
    1dc4:	00e7d763          	bge	a5,a4,1dd2 <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1dc8:	fc043783          	ld	a5,-64(s0)
    1dcc:	faf43423          	sd	a5,-88(s0)
    1dd0:	a03d                	j	1dfe <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1dd2:	fa843783          	ld	a5,-88(s0)
    1dd6:	4f98                	lw	a4,24(a5)
    1dd8:	fc043783          	ld	a5,-64(s0)
    1ddc:	4f9c                	lw	a5,24(a5)
    1dde:	02f71063          	bne	a4,a5,1dfe <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1de2:	fa843783          	ld	a5,-88(s0)
    1de6:	639c                	ld	a5,0(a5)
    1de8:	4fb8                	lw	a4,88(a5)
    1dea:	fc043783          	ld	a5,-64(s0)
    1dee:	639c                	ld	a5,0(a5)
    1df0:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1df2:	00e7d663          	bge	a5,a4,1dfe <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1df6:	fc043783          	ld	a5,-64(s0)
    1dfa:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1dfe:	fc043783          	ld	a5,-64(s0)
    1e02:	679c                	ld	a5,8(a5)
    1e04:	f6f43023          	sd	a5,-160(s0)
    1e08:	f6043783          	ld	a5,-160(s0)
    1e0c:	17e1                	addi	a5,a5,-8
    1e0e:	fcf43023          	sd	a5,-64(s0)
    1e12:	fc043783          	ld	a5,-64(s0)
    1e16:	00878713          	addi	a4,a5,8
    1e1a:	689c                	ld	a5,16(s1)
    1e1c:	f8f716e3          	bne	a4,a5,1da8 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1e20:	689c                	ld	a5,16(s1)
    1e22:	639c                	ld	a5,0(a5)
    1e24:	f6f43c23          	sd	a5,-136(s0)
    1e28:	f7843783          	ld	a5,-136(s0)
    1e2c:	17e1                	addi	a5,a5,-8
    1e2e:	fcf43023          	sd	a5,-64(s0)
    1e32:	a069                	j	1ebc <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1e34:	fb043783          	ld	a5,-80(s0)
    1e38:	eb99                	bnez	a5,1e4e <schedule_edf_cbs+0x264>
    1e3a:	fc043783          	ld	a5,-64(s0)
    1e3e:	639c                	ld	a5,0(a5)
    1e40:	57fc                	lw	a5,108(a5)
    1e42:	c791                	beqz	a5,1e4e <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1e44:	fc043783          	ld	a5,-64(s0)
    1e48:	faf43823          	sd	a5,-80(s0)
    1e4c:	a8b1                	j	1ea8 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1e4e:	fc043783          	ld	a5,-64(s0)
    1e52:	639c                	ld	a5,0(a5)
    1e54:	57fc                	lw	a5,108(a5)
    1e56:	cf91                	beqz	a5,1e72 <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1e58:	fb043783          	ld	a5,-80(s0)
    1e5c:	4f98                	lw	a4,24(a5)
    1e5e:	fc043783          	ld	a5,-64(s0)
    1e62:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1e64:	00e7d763          	bge	a5,a4,1e72 <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1e68:	fc043783          	ld	a5,-64(s0)
    1e6c:	faf43823          	sd	a5,-80(s0)
    1e70:	a825                	j	1ea8 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1e72:	fc043783          	ld	a5,-64(s0)
    1e76:	639c                	ld	a5,0(a5)
    1e78:	57fc                	lw	a5,108(a5)
    1e7a:	c79d                	beqz	a5,1ea8 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1e7c:	fb043783          	ld	a5,-80(s0)
    1e80:	4f98                	lw	a4,24(a5)
    1e82:	fc043783          	ld	a5,-64(s0)
    1e86:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1e88:	02f71063          	bne	a4,a5,1ea8 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1e8c:	fb043783          	ld	a5,-80(s0)
    1e90:	639c                	ld	a5,0(a5)
    1e92:	4fb8                	lw	a4,88(a5)
    1e94:	fc043783          	ld	a5,-64(s0)
    1e98:	639c                	ld	a5,0(a5)
    1e9a:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1e9c:	00e7d663          	bge	a5,a4,1ea8 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1ea0:	fc043783          	ld	a5,-64(s0)
    1ea4:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1ea8:	fc043783          	ld	a5,-64(s0)
    1eac:	679c                	ld	a5,8(a5)
    1eae:	f6f43423          	sd	a5,-152(s0)
    1eb2:	f6843783          	ld	a5,-152(s0)
    1eb6:	17e1                	addi	a5,a5,-8
    1eb8:	fcf43023          	sd	a5,-64(s0)
    1ebc:	fc043783          	ld	a5,-64(s0)
    1ec0:	00878713          	addi	a4,a5,8
    1ec4:	689c                	ld	a5,16(s1)
    1ec6:	f6f717e3          	bne	a4,a5,1e34 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1eca:	fa043783          	ld	a5,-96(s0)
    1ece:	cb89                	beqz	a5,1ee0 <schedule_edf_cbs+0x2f6>
    1ed0:	fa043783          	ld	a5,-96(s0)
    1ed4:	57fc                	lw	a5,108(a5)
    1ed6:	c789                	beqz	a5,1ee0 <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1ed8:	fb043783          	ld	a5,-80(s0)
    1edc:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1ee0:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1ee4:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1ee8:	fa843783          	ld	a5,-88(s0)
    1eec:	c3c5                	beqz	a5,1f8c <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1eee:	fa843783          	ld	a5,-88(s0)
    1ef2:	639c                	ld	a5,0(a5)
    1ef4:	5fdc                	lw	a5,60(a5)
    1ef6:	85be                	mv	a1,a5
    1ef8:	00000517          	auipc	a0,0x0
    1efc:	49850513          	addi	a0,a0,1176 # 2390 <schedule_edf_cbs+0x7a6>
    1f00:	fffff097          	auipc	ra,0xfffff
    1f04:	bf4080e7          	jalr	-1036(ra) # af4 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    1f08:	fa843783          	ld	a5,-88(s0)
    1f0c:	4f98                	lw	a4,24(a5)
    1f0e:	409c                	lw	a5,0(s1)
    1f10:	40f707bb          	subw	a5,a4,a5
    1f14:	fcf42623          	sw	a5,-52(s0)
        if (next){
    1f18:	fa043783          	ld	a5,-96(s0)
    1f1c:	cba5                	beqz	a5,1f8c <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    1f1e:	fa043783          	ld	a5,-96(s0)
    1f22:	4bf8                	lw	a4,84(a5)
    1f24:	fcc42783          	lw	a5,-52(s0)
    1f28:	2781                	sext.w	a5,a5
    1f2a:	06e7d163          	bge	a5,a4,1f8c <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    1f2e:	fa043783          	ld	a5,-96(s0)
    1f32:	57fc                	lw	a5,108(a5)
    1f34:	eb91                	bnez	a5,1f48 <schedule_edf_cbs+0x35e>
    1f36:	fa843783          	ld	a5,-88(s0)
    1f3a:	639c                	ld	a5,0(a5)
    1f3c:	57fc                	lw	a5,108(a5)
    1f3e:	c789                	beqz	a5,1f48 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    1f40:	4785                	li	a5,1
    1f42:	fcf42423          	sw	a5,-56(s0)
    1f46:	a099                	j	1f8c <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    1f48:	fa043783          	ld	a5,-96(s0)
    1f4c:	4fb8                	lw	a4,88(a5)
    1f4e:	fa843783          	ld	a5,-88(s0)
    1f52:	639c                	ld	a5,0(a5)
    1f54:	4fbc                	lw	a5,88(a5)
    1f56:	00e7d663          	bge	a5,a4,1f62 <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    1f5a:	4785                	li	a5,1
    1f5c:	fcf42423          	sw	a5,-56(s0)
    1f60:	a035                	j	1f8c <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1f62:	fa043783          	ld	a5,-96(s0)
    1f66:	4fb8                	lw	a4,88(a5)
    1f68:	fa843783          	ld	a5,-88(s0)
    1f6c:	639c                	ld	a5,0(a5)
    1f6e:	4fbc                	lw	a5,88(a5)
    1f70:	00f71e63          	bne	a4,a5,1f8c <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    1f74:	fa043783          	ld	a5,-96(s0)
    1f78:	5fd8                	lw	a4,60(a5)
    1f7a:	fa843783          	ld	a5,-88(s0)
    1f7e:	639c                	ld	a5,0(a5)
    1f80:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    1f82:	00e7d563          	bge	a5,a4,1f8c <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    1f86:	4785                	li	a5,1
    1f88:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    1f8c:	fa043783          	ld	a5,-96(s0)
    1f90:	cbd1                	beqz	a5,2024 <schedule_edf_cbs+0x43a>
    1f92:	fa043783          	ld	a5,-96(s0)
    1f96:	57fc                	lw	a5,108(a5)
    1f98:	e7d1                	bnez	a5,2024 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    1f9a:	fa043783          	ld	a5,-96(s0)
    1f9e:	4fb8                	lw	a4,88(a5)
    1fa0:	409c                	lw	a5,0(s1)
    1fa2:	40f707bb          	subw	a5,a4,a5
    1fa6:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    1faa:	fa043783          	ld	a5,-96(s0)
    1fae:	47f8                	lw	a4,76(a5)
    1fb0:	fa043783          	ld	a5,-96(s0)
    1fb4:	57bc                	lw	a5,104(a5)
    1fb6:	02f707bb          	mulw	a5,a4,a5
    1fba:	0007869b          	sext.w	a3,a5
    1fbe:	fa043783          	ld	a5,-96(s0)
    1fc2:	53fc                	lw	a5,100(a5)
    1fc4:	f7442703          	lw	a4,-140(s0)
    1fc8:	02f707bb          	mulw	a5,a4,a5
    1fcc:	2781                	sext.w	a5,a5
    1fce:	8736                	mv	a4,a3
    1fd0:	02e7d263          	bge	a5,a4,1ff4 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    1fd4:	4098                	lw	a4,0(s1)
    1fd6:	fa043783          	ld	a5,-96(s0)
    1fda:	47fc                	lw	a5,76(a5)
    1fdc:	9fb9                	addw	a5,a5,a4
    1fde:	0007871b          	sext.w	a4,a5
    1fe2:	fa043783          	ld	a5,-96(s0)
    1fe6:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    1fe8:	fa043783          	ld	a5,-96(s0)
    1fec:	53f8                	lw	a4,100(a5)
    1fee:	fa043783          	ld	a5,-96(s0)
    1ff2:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    1ff4:	fa043783          	ld	a5,-96(s0)
    1ff8:	4bf8                	lw	a4,84(a5)
    1ffa:	fa043783          	ld	a5,-96(s0)
    1ffe:	57bc                	lw	a5,104(a5)
    2000:	02e7d263          	bge	a5,a4,2024 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    2004:	fa043783          	ld	a5,-96(s0)
    2008:	4705                	li	a4,1
    200a:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    200c:	fa043783          	ld	a5,-96(s0)
    2010:	4fb8                	lw	a4,88(a5)
    2012:	fa043783          	ld	a5,-96(s0)
    2016:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    2018:	fa043783          	ld	a5,-96(s0)
    201c:	4bf8                	lw	a4,84(a5)
    201e:	fa043783          	ld	a5,-96(s0)
    2022:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    2024:	fa043783          	ld	a5,-96(s0)
    2028:	c3a9                	beqz	a5,206a <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    202a:	fa043783          	ld	a5,-96(s0)
    202e:	02878793          	addi	a5,a5,40
    2032:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    2036:	fa843783          	ld	a5,-88(s0)
    203a:	cb91                	beqz	a5,204e <schedule_edf_cbs+0x464>
    203c:	fc842783          	lw	a5,-56(s0)
    2040:	2781                	sext.w	a5,a5
    2042:	c791                	beqz	a5,204e <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    2044:	fcc42783          	lw	a5,-52(s0)
    2048:	f4f42423          	sw	a5,-184(s0)
    204c:	a81d                	j	2082 <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    204e:	fa043783          	ld	a5,-96(s0)
    2052:	5bbc                	lw	a5,112(a5)
    2054:	c789                	beqz	a5,205e <schedule_edf_cbs+0x474>
    2056:	fa043783          	ld	a5,-96(s0)
    205a:	57bc                	lw	a5,104(a5)
    205c:	a021                	j	2064 <schedule_edf_cbs+0x47a>
    205e:	fa043783          	ld	a5,-96(s0)
    2062:	4bfc                	lw	a5,84(a5)
    2064:	f4f42423          	sw	a5,-184(s0)
    2068:	a829                	j	2082 <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    206a:	649c                	ld	a5,8(s1)
    206c:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    2070:	fa843783          	ld	a5,-88(s0)
    2074:	c781                	beqz	a5,207c <schedule_edf_cbs+0x492>
    2076:	fcc42783          	lw	a5,-52(s0)
    207a:	a011                	j	207e <schedule_edf_cbs+0x494>
    207c:	4785                	li	a5,1
    207e:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    2082:	f4043783          	ld	a5,-192(s0)
    2086:	f4f43823          	sd	a5,-176(s0)
    208a:	f4843783          	ld	a5,-184(s0)
    208e:	f4f43c23          	sd	a5,-168(s0)
    2092:	4701                	li	a4,0
    2094:	f5043703          	ld	a4,-176(s0)
    2098:	4781                	li	a5,0
    209a:	f5843783          	ld	a5,-168(s0)
    209e:	893a                	mv	s2,a4
    20a0:	89be                	mv	s3,a5
    20a2:	874a                	mv	a4,s2
    20a4:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    20a6:	853a                	mv	a0,a4
    20a8:	85be                	mv	a1,a5
    20aa:	70ea                	ld	ra,184(sp)
    20ac:	744a                	ld	s0,176(sp)
    20ae:	74aa                	ld	s1,168(sp)
    20b0:	790a                	ld	s2,160(sp)
    20b2:	69ea                	ld	s3,152(sp)
    20b4:	6129                	addi	sp,sp,192
    20b6:	8082                	ret
