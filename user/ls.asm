
user/_ls:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <fmtname>:
#include "user/user.h"
#include "kernel/fs.h"

char*
fmtname(char *path)
{
       0:	7139                	addi	sp,sp,-64
       2:	fc06                	sd	ra,56(sp)
       4:	f822                	sd	s0,48(sp)
       6:	f426                	sd	s1,40(sp)
       8:	0080                	addi	s0,sp,64
       a:	fca43423          	sd	a0,-56(s0)
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
       e:	fc843503          	ld	a0,-56(s0)
      12:	00000097          	auipc	ra,0x0
      16:	42e080e7          	jalr	1070(ra) # 440 <strlen>
      1a:	87aa                	mv	a5,a0
      1c:	2781                	sext.w	a5,a5
      1e:	1782                	slli	a5,a5,0x20
      20:	9381                	srli	a5,a5,0x20
      22:	fc843703          	ld	a4,-56(s0)
      26:	97ba                	add	a5,a5,a4
      28:	fcf43c23          	sd	a5,-40(s0)
      2c:	a031                	j	38 <fmtname+0x38>
      2e:	fd843783          	ld	a5,-40(s0)
      32:	17fd                	addi	a5,a5,-1
      34:	fcf43c23          	sd	a5,-40(s0)
      38:	fd843703          	ld	a4,-40(s0)
      3c:	fc843783          	ld	a5,-56(s0)
      40:	00f76b63          	bltu	a4,a5,56 <fmtname+0x56>
      44:	fd843783          	ld	a5,-40(s0)
      48:	0007c783          	lbu	a5,0(a5)
      4c:	873e                	mv	a4,a5
      4e:	02f00793          	li	a5,47
      52:	fcf71ee3          	bne	a4,a5,2e <fmtname+0x2e>
    ;
  p++;
      56:	fd843783          	ld	a5,-40(s0)
      5a:	0785                	addi	a5,a5,1
      5c:	fcf43c23          	sd	a5,-40(s0)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
      60:	fd843503          	ld	a0,-40(s0)
      64:	00000097          	auipc	ra,0x0
      68:	3dc080e7          	jalr	988(ra) # 440 <strlen>
      6c:	87aa                	mv	a5,a0
      6e:	2781                	sext.w	a5,a5
      70:	873e                	mv	a4,a5
      72:	47b5                	li	a5,13
      74:	00e7f563          	bgeu	a5,a4,7e <fmtname+0x7e>
    return p;
      78:	fd843783          	ld	a5,-40(s0)
      7c:	a8b5                	j	f8 <fmtname+0xf8>
  memmove(buf, p, strlen(p));
      7e:	fd843503          	ld	a0,-40(s0)
      82:	00000097          	auipc	ra,0x0
      86:	3be080e7          	jalr	958(ra) # 440 <strlen>
      8a:	87aa                	mv	a5,a0
      8c:	2781                	sext.w	a5,a5
      8e:	2781                	sext.w	a5,a5
      90:	863e                	mv	a2,a5
      92:	fd843583          	ld	a1,-40(s0)
      96:	00002517          	auipc	a0,0x2
      9a:	5d250513          	addi	a0,a0,1490 # 2668 <buf.1118>
      9e:	00000097          	auipc	ra,0x0
      a2:	5fc080e7          	jalr	1532(ra) # 69a <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      a6:	fd843503          	ld	a0,-40(s0)
      aa:	00000097          	auipc	ra,0x0
      ae:	396080e7          	jalr	918(ra) # 440 <strlen>
      b2:	87aa                	mv	a5,a0
      b4:	2781                	sext.w	a5,a5
      b6:	02079713          	slli	a4,a5,0x20
      ba:	9301                	srli	a4,a4,0x20
      bc:	00002797          	auipc	a5,0x2
      c0:	5ac78793          	addi	a5,a5,1452 # 2668 <buf.1118>
      c4:	00f704b3          	add	s1,a4,a5
      c8:	fd843503          	ld	a0,-40(s0)
      cc:	00000097          	auipc	ra,0x0
      d0:	374080e7          	jalr	884(ra) # 440 <strlen>
      d4:	87aa                	mv	a5,a0
      d6:	2781                	sext.w	a5,a5
      d8:	4739                	li	a4,14
      da:	40f707bb          	subw	a5,a4,a5
      de:	2781                	sext.w	a5,a5
      e0:	863e                	mv	a2,a5
      e2:	02000593          	li	a1,32
      e6:	8526                	mv	a0,s1
      e8:	00000097          	auipc	ra,0x0
      ec:	38e080e7          	jalr	910(ra) # 476 <memset>
  return buf;
      f0:	00002797          	auipc	a5,0x2
      f4:	57878793          	addi	a5,a5,1400 # 2668 <buf.1118>
}
      f8:	853e                	mv	a0,a5
      fa:	70e2                	ld	ra,56(sp)
      fc:	7442                	ld	s0,48(sp)
      fe:	74a2                	ld	s1,40(sp)
     100:	6121                	addi	sp,sp,64
     102:	8082                	ret

0000000000000104 <ls>:

void
ls(char *path)
{
     104:	da010113          	addi	sp,sp,-608
     108:	24113c23          	sd	ra,600(sp)
     10c:	24813823          	sd	s0,592(sp)
     110:	1480                	addi	s0,sp,608
     112:	daa43423          	sd	a0,-600(s0)
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
     116:	4581                	li	a1,0
     118:	da843503          	ld	a0,-600(s0)
     11c:	00000097          	auipc	ra,0x0
     120:	744080e7          	jalr	1860(ra) # 860 <open>
     124:	87aa                	mv	a5,a0
     126:	fef42623          	sw	a5,-20(s0)
     12a:	fec42783          	lw	a5,-20(s0)
     12e:	2781                	sext.w	a5,a5
     130:	0007de63          	bgez	a5,14c <ls+0x48>
    fprintf(2, "ls: cannot open %s\n", path);
     134:	da843603          	ld	a2,-600(s0)
     138:	00002597          	auipc	a1,0x2
     13c:	1f858593          	addi	a1,a1,504 # 2330 <schedule_edf_cbs+0x4d4>
     140:	4509                	li	a0,2
     142:	00001097          	auipc	ra,0x1
     146:	bcc080e7          	jalr	-1076(ra) # d0e <fprintf>
    return;
     14a:	aa6d                	j	304 <ls+0x200>
  }

  if(fstat(fd, &st) < 0){
     14c:	db840713          	addi	a4,s0,-584
     150:	fec42783          	lw	a5,-20(s0)
     154:	85ba                	mv	a1,a4
     156:	853e                	mv	a0,a5
     158:	00000097          	auipc	ra,0x0
     15c:	720080e7          	jalr	1824(ra) # 878 <fstat>
     160:	87aa                	mv	a5,a0
     162:	0207d563          	bgez	a5,18c <ls+0x88>
    fprintf(2, "ls: cannot stat %s\n", path);
     166:	da843603          	ld	a2,-600(s0)
     16a:	00002597          	auipc	a1,0x2
     16e:	1de58593          	addi	a1,a1,478 # 2348 <schedule_edf_cbs+0x4ec>
     172:	4509                	li	a0,2
     174:	00001097          	auipc	ra,0x1
     178:	b9a080e7          	jalr	-1126(ra) # d0e <fprintf>
    close(fd);
     17c:	fec42783          	lw	a5,-20(s0)
     180:	853e                	mv	a0,a5
     182:	00000097          	auipc	ra,0x0
     186:	6c6080e7          	jalr	1734(ra) # 848 <close>
    return;
     18a:	aaad                	j	304 <ls+0x200>
  }

  switch(st.type){
     18c:	dc041783          	lh	a5,-576(s0)
     190:	0007871b          	sext.w	a4,a5
     194:	86ba                	mv	a3,a4
     196:	4785                	li	a5,1
     198:	02f68d63          	beq	a3,a5,1d2 <ls+0xce>
     19c:	4789                	li	a5,2
     19e:	14f71c63          	bne	a4,a5,2f6 <ls+0x1f2>
  case T_FILE:
    printf("%s %d %d %l\n", fmtname(path), st.type, st.ino, st.size);
     1a2:	da843503          	ld	a0,-600(s0)
     1a6:	00000097          	auipc	ra,0x0
     1aa:	e5a080e7          	jalr	-422(ra) # 0 <fmtname>
     1ae:	85aa                	mv	a1,a0
     1b0:	dc041783          	lh	a5,-576(s0)
     1b4:	2781                	sext.w	a5,a5
     1b6:	dbc42683          	lw	a3,-580(s0)
     1ba:	dc843703          	ld	a4,-568(s0)
     1be:	863e                	mv	a2,a5
     1c0:	00002517          	auipc	a0,0x2
     1c4:	1a050513          	addi	a0,a0,416 # 2360 <schedule_edf_cbs+0x504>
     1c8:	00001097          	auipc	ra,0x1
     1cc:	b9e080e7          	jalr	-1122(ra) # d66 <printf>
    break;
     1d0:	a21d                	j	2f6 <ls+0x1f2>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     1d2:	da843503          	ld	a0,-600(s0)
     1d6:	00000097          	auipc	ra,0x0
     1da:	26a080e7          	jalr	618(ra) # 440 <strlen>
     1de:	87aa                	mv	a5,a0
     1e0:	2781                	sext.w	a5,a5
     1e2:	27c1                	addiw	a5,a5,16
     1e4:	2781                	sext.w	a5,a5
     1e6:	873e                	mv	a4,a5
     1e8:	20000793          	li	a5,512
     1ec:	00e7fb63          	bgeu	a5,a4,202 <ls+0xfe>
      printf("ls: path too long\n");
     1f0:	00002517          	auipc	a0,0x2
     1f4:	18050513          	addi	a0,a0,384 # 2370 <schedule_edf_cbs+0x514>
     1f8:	00001097          	auipc	ra,0x1
     1fc:	b6e080e7          	jalr	-1170(ra) # d66 <printf>
      break;
     200:	a8dd                	j	2f6 <ls+0x1f2>
    }
    strcpy(buf, path);
     202:	de040793          	addi	a5,s0,-544
     206:	da843583          	ld	a1,-600(s0)
     20a:	853e                	mv	a0,a5
     20c:	00000097          	auipc	ra,0x0
     210:	184080e7          	jalr	388(ra) # 390 <strcpy>
    p = buf+strlen(buf);
     214:	de040793          	addi	a5,s0,-544
     218:	853e                	mv	a0,a5
     21a:	00000097          	auipc	ra,0x0
     21e:	226080e7          	jalr	550(ra) # 440 <strlen>
     222:	87aa                	mv	a5,a0
     224:	2781                	sext.w	a5,a5
     226:	1782                	slli	a5,a5,0x20
     228:	9381                	srli	a5,a5,0x20
     22a:	de040713          	addi	a4,s0,-544
     22e:	97ba                	add	a5,a5,a4
     230:	fef43023          	sd	a5,-32(s0)
    *p++ = '/';
     234:	fe043783          	ld	a5,-32(s0)
     238:	00178713          	addi	a4,a5,1
     23c:	fee43023          	sd	a4,-32(s0)
     240:	02f00713          	li	a4,47
     244:	00e78023          	sb	a4,0(a5)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     248:	a071                	j	2d4 <ls+0x1d0>
      if(de.inum == 0)
     24a:	dd045783          	lhu	a5,-560(s0)
     24e:	e391                	bnez	a5,252 <ls+0x14e>
        continue;
     250:	a051                	j	2d4 <ls+0x1d0>
      memmove(p, de.name, DIRSIZ);
     252:	dd040793          	addi	a5,s0,-560
     256:	0789                	addi	a5,a5,2
     258:	4639                	li	a2,14
     25a:	85be                	mv	a1,a5
     25c:	fe043503          	ld	a0,-32(s0)
     260:	00000097          	auipc	ra,0x0
     264:	43a080e7          	jalr	1082(ra) # 69a <memmove>
      p[DIRSIZ] = 0;
     268:	fe043783          	ld	a5,-32(s0)
     26c:	07b9                	addi	a5,a5,14
     26e:	00078023          	sb	zero,0(a5)
      if(stat(buf, &st) < 0){
     272:	db840713          	addi	a4,s0,-584
     276:	de040793          	addi	a5,s0,-544
     27a:	85ba                	mv	a1,a4
     27c:	853e                	mv	a0,a5
     27e:	00000097          	auipc	ra,0x0
     282:	344080e7          	jalr	836(ra) # 5c2 <stat>
     286:	87aa                	mv	a5,a0
     288:	0007de63          	bgez	a5,2a4 <ls+0x1a0>
        printf("ls: cannot stat %s\n", buf);
     28c:	de040793          	addi	a5,s0,-544
     290:	85be                	mv	a1,a5
     292:	00002517          	auipc	a0,0x2
     296:	0b650513          	addi	a0,a0,182 # 2348 <schedule_edf_cbs+0x4ec>
     29a:	00001097          	auipc	ra,0x1
     29e:	acc080e7          	jalr	-1332(ra) # d66 <printf>
        continue;
     2a2:	a80d                	j	2d4 <ls+0x1d0>
      }
      printf("%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     2a4:	de040793          	addi	a5,s0,-544
     2a8:	853e                	mv	a0,a5
     2aa:	00000097          	auipc	ra,0x0
     2ae:	d56080e7          	jalr	-682(ra) # 0 <fmtname>
     2b2:	85aa                	mv	a1,a0
     2b4:	dc041783          	lh	a5,-576(s0)
     2b8:	2781                	sext.w	a5,a5
     2ba:	dbc42683          	lw	a3,-580(s0)
     2be:	dc843703          	ld	a4,-568(s0)
     2c2:	863e                	mv	a2,a5
     2c4:	00002517          	auipc	a0,0x2
     2c8:	0c450513          	addi	a0,a0,196 # 2388 <schedule_edf_cbs+0x52c>
     2cc:	00001097          	auipc	ra,0x1
     2d0:	a9a080e7          	jalr	-1382(ra) # d66 <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     2d4:	dd040713          	addi	a4,s0,-560
     2d8:	fec42783          	lw	a5,-20(s0)
     2dc:	4641                	li	a2,16
     2de:	85ba                	mv	a1,a4
     2e0:	853e                	mv	a0,a5
     2e2:	00000097          	auipc	ra,0x0
     2e6:	556080e7          	jalr	1366(ra) # 838 <read>
     2ea:	87aa                	mv	a5,a0
     2ec:	873e                	mv	a4,a5
     2ee:	47c1                	li	a5,16
     2f0:	f4f70de3          	beq	a4,a5,24a <ls+0x146>
    }
    break;
     2f4:	0001                	nop
  }
  close(fd);
     2f6:	fec42783          	lw	a5,-20(s0)
     2fa:	853e                	mv	a0,a5
     2fc:	00000097          	auipc	ra,0x0
     300:	54c080e7          	jalr	1356(ra) # 848 <close>
}
     304:	25813083          	ld	ra,600(sp)
     308:	25013403          	ld	s0,592(sp)
     30c:	26010113          	addi	sp,sp,608
     310:	8082                	ret

0000000000000312 <main>:

int
main(int argc, char *argv[])
{
     312:	7179                	addi	sp,sp,-48
     314:	f406                	sd	ra,40(sp)
     316:	f022                	sd	s0,32(sp)
     318:	1800                	addi	s0,sp,48
     31a:	87aa                	mv	a5,a0
     31c:	fcb43823          	sd	a1,-48(s0)
     320:	fcf42e23          	sw	a5,-36(s0)
  int i;

  if(argc < 2){
     324:	fdc42783          	lw	a5,-36(s0)
     328:	0007871b          	sext.w	a4,a5
     32c:	4785                	li	a5,1
     32e:	00e7cf63          	blt	a5,a4,34c <main+0x3a>
    ls(".");
     332:	00002517          	auipc	a0,0x2
     336:	06650513          	addi	a0,a0,102 # 2398 <schedule_edf_cbs+0x53c>
     33a:	00000097          	auipc	ra,0x0
     33e:	dca080e7          	jalr	-566(ra) # 104 <ls>
    exit(0);
     342:	4501                	li	a0,0
     344:	00000097          	auipc	ra,0x0
     348:	4dc080e7          	jalr	1244(ra) # 820 <exit>
  }
  for(i=1; i<argc; i++)
     34c:	4785                	li	a5,1
     34e:	fef42623          	sw	a5,-20(s0)
     352:	a015                	j	376 <main+0x64>
    ls(argv[i]);
     354:	fec42783          	lw	a5,-20(s0)
     358:	078e                	slli	a5,a5,0x3
     35a:	fd043703          	ld	a4,-48(s0)
     35e:	97ba                	add	a5,a5,a4
     360:	639c                	ld	a5,0(a5)
     362:	853e                	mv	a0,a5
     364:	00000097          	auipc	ra,0x0
     368:	da0080e7          	jalr	-608(ra) # 104 <ls>
  for(i=1; i<argc; i++)
     36c:	fec42783          	lw	a5,-20(s0)
     370:	2785                	addiw	a5,a5,1
     372:	fef42623          	sw	a5,-20(s0)
     376:	fec42703          	lw	a4,-20(s0)
     37a:	fdc42783          	lw	a5,-36(s0)
     37e:	2701                	sext.w	a4,a4
     380:	2781                	sext.w	a5,a5
     382:	fcf749e3          	blt	a4,a5,354 <main+0x42>
  exit(0);
     386:	4501                	li	a0,0
     388:	00000097          	auipc	ra,0x0
     38c:	498080e7          	jalr	1176(ra) # 820 <exit>

0000000000000390 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     390:	7179                	addi	sp,sp,-48
     392:	f422                	sd	s0,40(sp)
     394:	1800                	addi	s0,sp,48
     396:	fca43c23          	sd	a0,-40(s0)
     39a:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     39e:	fd843783          	ld	a5,-40(s0)
     3a2:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     3a6:	0001                	nop
     3a8:	fd043703          	ld	a4,-48(s0)
     3ac:	00170793          	addi	a5,a4,1
     3b0:	fcf43823          	sd	a5,-48(s0)
     3b4:	fd843783          	ld	a5,-40(s0)
     3b8:	00178693          	addi	a3,a5,1
     3bc:	fcd43c23          	sd	a3,-40(s0)
     3c0:	00074703          	lbu	a4,0(a4)
     3c4:	00e78023          	sb	a4,0(a5)
     3c8:	0007c783          	lbu	a5,0(a5)
     3cc:	fff1                	bnez	a5,3a8 <strcpy+0x18>
    ;
  return os;
     3ce:	fe843783          	ld	a5,-24(s0)
}
     3d2:	853e                	mv	a0,a5
     3d4:	7422                	ld	s0,40(sp)
     3d6:	6145                	addi	sp,sp,48
     3d8:	8082                	ret

00000000000003da <strcmp>:

int
strcmp(const char *p, const char *q)
{
     3da:	1101                	addi	sp,sp,-32
     3dc:	ec22                	sd	s0,24(sp)
     3de:	1000                	addi	s0,sp,32
     3e0:	fea43423          	sd	a0,-24(s0)
     3e4:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     3e8:	a819                	j	3fe <strcmp+0x24>
    p++, q++;
     3ea:	fe843783          	ld	a5,-24(s0)
     3ee:	0785                	addi	a5,a5,1
     3f0:	fef43423          	sd	a5,-24(s0)
     3f4:	fe043783          	ld	a5,-32(s0)
     3f8:	0785                	addi	a5,a5,1
     3fa:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     3fe:	fe843783          	ld	a5,-24(s0)
     402:	0007c783          	lbu	a5,0(a5)
     406:	cb99                	beqz	a5,41c <strcmp+0x42>
     408:	fe843783          	ld	a5,-24(s0)
     40c:	0007c703          	lbu	a4,0(a5)
     410:	fe043783          	ld	a5,-32(s0)
     414:	0007c783          	lbu	a5,0(a5)
     418:	fcf709e3          	beq	a4,a5,3ea <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     41c:	fe843783          	ld	a5,-24(s0)
     420:	0007c783          	lbu	a5,0(a5)
     424:	0007871b          	sext.w	a4,a5
     428:	fe043783          	ld	a5,-32(s0)
     42c:	0007c783          	lbu	a5,0(a5)
     430:	2781                	sext.w	a5,a5
     432:	40f707bb          	subw	a5,a4,a5
     436:	2781                	sext.w	a5,a5
}
     438:	853e                	mv	a0,a5
     43a:	6462                	ld	s0,24(sp)
     43c:	6105                	addi	sp,sp,32
     43e:	8082                	ret

0000000000000440 <strlen>:

uint
strlen(const char *s)
{
     440:	7179                	addi	sp,sp,-48
     442:	f422                	sd	s0,40(sp)
     444:	1800                	addi	s0,sp,48
     446:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     44a:	fe042623          	sw	zero,-20(s0)
     44e:	a031                	j	45a <strlen+0x1a>
     450:	fec42783          	lw	a5,-20(s0)
     454:	2785                	addiw	a5,a5,1
     456:	fef42623          	sw	a5,-20(s0)
     45a:	fec42783          	lw	a5,-20(s0)
     45e:	fd843703          	ld	a4,-40(s0)
     462:	97ba                	add	a5,a5,a4
     464:	0007c783          	lbu	a5,0(a5)
     468:	f7e5                	bnez	a5,450 <strlen+0x10>
    ;
  return n;
     46a:	fec42783          	lw	a5,-20(s0)
}
     46e:	853e                	mv	a0,a5
     470:	7422                	ld	s0,40(sp)
     472:	6145                	addi	sp,sp,48
     474:	8082                	ret

0000000000000476 <memset>:

void*
memset(void *dst, int c, uint n)
{
     476:	7179                	addi	sp,sp,-48
     478:	f422                	sd	s0,40(sp)
     47a:	1800                	addi	s0,sp,48
     47c:	fca43c23          	sd	a0,-40(s0)
     480:	87ae                	mv	a5,a1
     482:	8732                	mv	a4,a2
     484:	fcf42a23          	sw	a5,-44(s0)
     488:	87ba                	mv	a5,a4
     48a:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     48e:	fd843783          	ld	a5,-40(s0)
     492:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     496:	fe042623          	sw	zero,-20(s0)
     49a:	a00d                	j	4bc <memset+0x46>
    cdst[i] = c;
     49c:	fec42783          	lw	a5,-20(s0)
     4a0:	fe043703          	ld	a4,-32(s0)
     4a4:	97ba                	add	a5,a5,a4
     4a6:	fd442703          	lw	a4,-44(s0)
     4aa:	0ff77713          	andi	a4,a4,255
     4ae:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     4b2:	fec42783          	lw	a5,-20(s0)
     4b6:	2785                	addiw	a5,a5,1
     4b8:	fef42623          	sw	a5,-20(s0)
     4bc:	fec42703          	lw	a4,-20(s0)
     4c0:	fd042783          	lw	a5,-48(s0)
     4c4:	2781                	sext.w	a5,a5
     4c6:	fcf76be3          	bltu	a4,a5,49c <memset+0x26>
  }
  return dst;
     4ca:	fd843783          	ld	a5,-40(s0)
}
     4ce:	853e                	mv	a0,a5
     4d0:	7422                	ld	s0,40(sp)
     4d2:	6145                	addi	sp,sp,48
     4d4:	8082                	ret

00000000000004d6 <strchr>:

char*
strchr(const char *s, char c)
{
     4d6:	1101                	addi	sp,sp,-32
     4d8:	ec22                	sd	s0,24(sp)
     4da:	1000                	addi	s0,sp,32
     4dc:	fea43423          	sd	a0,-24(s0)
     4e0:	87ae                	mv	a5,a1
     4e2:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     4e6:	a01d                	j	50c <strchr+0x36>
    if(*s == c)
     4e8:	fe843783          	ld	a5,-24(s0)
     4ec:	0007c703          	lbu	a4,0(a5)
     4f0:	fe744783          	lbu	a5,-25(s0)
     4f4:	0ff7f793          	andi	a5,a5,255
     4f8:	00e79563          	bne	a5,a4,502 <strchr+0x2c>
      return (char*)s;
     4fc:	fe843783          	ld	a5,-24(s0)
     500:	a821                	j	518 <strchr+0x42>
  for(; *s; s++)
     502:	fe843783          	ld	a5,-24(s0)
     506:	0785                	addi	a5,a5,1
     508:	fef43423          	sd	a5,-24(s0)
     50c:	fe843783          	ld	a5,-24(s0)
     510:	0007c783          	lbu	a5,0(a5)
     514:	fbf1                	bnez	a5,4e8 <strchr+0x12>
  return 0;
     516:	4781                	li	a5,0
}
     518:	853e                	mv	a0,a5
     51a:	6462                	ld	s0,24(sp)
     51c:	6105                	addi	sp,sp,32
     51e:	8082                	ret

0000000000000520 <gets>:

char*
gets(char *buf, int max)
{
     520:	7179                	addi	sp,sp,-48
     522:	f406                	sd	ra,40(sp)
     524:	f022                	sd	s0,32(sp)
     526:	1800                	addi	s0,sp,48
     528:	fca43c23          	sd	a0,-40(s0)
     52c:	87ae                	mv	a5,a1
     52e:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     532:	fe042623          	sw	zero,-20(s0)
     536:	a8a1                	j	58e <gets+0x6e>
    cc = read(0, &c, 1);
     538:	fe740793          	addi	a5,s0,-25
     53c:	4605                	li	a2,1
     53e:	85be                	mv	a1,a5
     540:	4501                	li	a0,0
     542:	00000097          	auipc	ra,0x0
     546:	2f6080e7          	jalr	758(ra) # 838 <read>
     54a:	87aa                	mv	a5,a0
     54c:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     550:	fe842783          	lw	a5,-24(s0)
     554:	2781                	sext.w	a5,a5
     556:	04f05763          	blez	a5,5a4 <gets+0x84>
      break;
    buf[i++] = c;
     55a:	fec42783          	lw	a5,-20(s0)
     55e:	0017871b          	addiw	a4,a5,1
     562:	fee42623          	sw	a4,-20(s0)
     566:	873e                	mv	a4,a5
     568:	fd843783          	ld	a5,-40(s0)
     56c:	97ba                	add	a5,a5,a4
     56e:	fe744703          	lbu	a4,-25(s0)
     572:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     576:	fe744783          	lbu	a5,-25(s0)
     57a:	873e                	mv	a4,a5
     57c:	47a9                	li	a5,10
     57e:	02f70463          	beq	a4,a5,5a6 <gets+0x86>
     582:	fe744783          	lbu	a5,-25(s0)
     586:	873e                	mv	a4,a5
     588:	47b5                	li	a5,13
     58a:	00f70e63          	beq	a4,a5,5a6 <gets+0x86>
  for(i=0; i+1 < max; ){
     58e:	fec42783          	lw	a5,-20(s0)
     592:	2785                	addiw	a5,a5,1
     594:	0007871b          	sext.w	a4,a5
     598:	fd442783          	lw	a5,-44(s0)
     59c:	2781                	sext.w	a5,a5
     59e:	f8f74de3          	blt	a4,a5,538 <gets+0x18>
     5a2:	a011                	j	5a6 <gets+0x86>
      break;
     5a4:	0001                	nop
      break;
  }
  buf[i] = '\0';
     5a6:	fec42783          	lw	a5,-20(s0)
     5aa:	fd843703          	ld	a4,-40(s0)
     5ae:	97ba                	add	a5,a5,a4
     5b0:	00078023          	sb	zero,0(a5)
  return buf;
     5b4:	fd843783          	ld	a5,-40(s0)
}
     5b8:	853e                	mv	a0,a5
     5ba:	70a2                	ld	ra,40(sp)
     5bc:	7402                	ld	s0,32(sp)
     5be:	6145                	addi	sp,sp,48
     5c0:	8082                	ret

00000000000005c2 <stat>:

int
stat(const char *n, struct stat *st)
{
     5c2:	7179                	addi	sp,sp,-48
     5c4:	f406                	sd	ra,40(sp)
     5c6:	f022                	sd	s0,32(sp)
     5c8:	1800                	addi	s0,sp,48
     5ca:	fca43c23          	sd	a0,-40(s0)
     5ce:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     5d2:	4581                	li	a1,0
     5d4:	fd843503          	ld	a0,-40(s0)
     5d8:	00000097          	auipc	ra,0x0
     5dc:	288080e7          	jalr	648(ra) # 860 <open>
     5e0:	87aa                	mv	a5,a0
     5e2:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     5e6:	fec42783          	lw	a5,-20(s0)
     5ea:	2781                	sext.w	a5,a5
     5ec:	0007d463          	bgez	a5,5f4 <stat+0x32>
    return -1;
     5f0:	57fd                	li	a5,-1
     5f2:	a035                	j	61e <stat+0x5c>
  r = fstat(fd, st);
     5f4:	fec42783          	lw	a5,-20(s0)
     5f8:	fd043583          	ld	a1,-48(s0)
     5fc:	853e                	mv	a0,a5
     5fe:	00000097          	auipc	ra,0x0
     602:	27a080e7          	jalr	634(ra) # 878 <fstat>
     606:	87aa                	mv	a5,a0
     608:	fef42423          	sw	a5,-24(s0)
  close(fd);
     60c:	fec42783          	lw	a5,-20(s0)
     610:	853e                	mv	a0,a5
     612:	00000097          	auipc	ra,0x0
     616:	236080e7          	jalr	566(ra) # 848 <close>
  return r;
     61a:	fe842783          	lw	a5,-24(s0)
}
     61e:	853e                	mv	a0,a5
     620:	70a2                	ld	ra,40(sp)
     622:	7402                	ld	s0,32(sp)
     624:	6145                	addi	sp,sp,48
     626:	8082                	ret

0000000000000628 <atoi>:

int
atoi(const char *s)
{
     628:	7179                	addi	sp,sp,-48
     62a:	f422                	sd	s0,40(sp)
     62c:	1800                	addi	s0,sp,48
     62e:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     632:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     636:	a815                	j	66a <atoi+0x42>
    n = n*10 + *s++ - '0';
     638:	fec42703          	lw	a4,-20(s0)
     63c:	87ba                	mv	a5,a4
     63e:	0027979b          	slliw	a5,a5,0x2
     642:	9fb9                	addw	a5,a5,a4
     644:	0017979b          	slliw	a5,a5,0x1
     648:	0007871b          	sext.w	a4,a5
     64c:	fd843783          	ld	a5,-40(s0)
     650:	00178693          	addi	a3,a5,1
     654:	fcd43c23          	sd	a3,-40(s0)
     658:	0007c783          	lbu	a5,0(a5)
     65c:	2781                	sext.w	a5,a5
     65e:	9fb9                	addw	a5,a5,a4
     660:	2781                	sext.w	a5,a5
     662:	fd07879b          	addiw	a5,a5,-48
     666:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     66a:	fd843783          	ld	a5,-40(s0)
     66e:	0007c783          	lbu	a5,0(a5)
     672:	873e                	mv	a4,a5
     674:	02f00793          	li	a5,47
     678:	00e7fb63          	bgeu	a5,a4,68e <atoi+0x66>
     67c:	fd843783          	ld	a5,-40(s0)
     680:	0007c783          	lbu	a5,0(a5)
     684:	873e                	mv	a4,a5
     686:	03900793          	li	a5,57
     68a:	fae7f7e3          	bgeu	a5,a4,638 <atoi+0x10>
  return n;
     68e:	fec42783          	lw	a5,-20(s0)
}
     692:	853e                	mv	a0,a5
     694:	7422                	ld	s0,40(sp)
     696:	6145                	addi	sp,sp,48
     698:	8082                	ret

000000000000069a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     69a:	7139                	addi	sp,sp,-64
     69c:	fc22                	sd	s0,56(sp)
     69e:	0080                	addi	s0,sp,64
     6a0:	fca43c23          	sd	a0,-40(s0)
     6a4:	fcb43823          	sd	a1,-48(s0)
     6a8:	87b2                	mv	a5,a2
     6aa:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     6ae:	fd843783          	ld	a5,-40(s0)
     6b2:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     6b6:	fd043783          	ld	a5,-48(s0)
     6ba:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     6be:	fe043703          	ld	a4,-32(s0)
     6c2:	fe843783          	ld	a5,-24(s0)
     6c6:	02e7fc63          	bgeu	a5,a4,6fe <memmove+0x64>
    while(n-- > 0)
     6ca:	a00d                	j	6ec <memmove+0x52>
      *dst++ = *src++;
     6cc:	fe043703          	ld	a4,-32(s0)
     6d0:	00170793          	addi	a5,a4,1
     6d4:	fef43023          	sd	a5,-32(s0)
     6d8:	fe843783          	ld	a5,-24(s0)
     6dc:	00178693          	addi	a3,a5,1
     6e0:	fed43423          	sd	a3,-24(s0)
     6e4:	00074703          	lbu	a4,0(a4)
     6e8:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     6ec:	fcc42783          	lw	a5,-52(s0)
     6f0:	fff7871b          	addiw	a4,a5,-1
     6f4:	fce42623          	sw	a4,-52(s0)
     6f8:	fcf04ae3          	bgtz	a5,6cc <memmove+0x32>
     6fc:	a891                	j	750 <memmove+0xb6>
  } else {
    dst += n;
     6fe:	fcc42783          	lw	a5,-52(s0)
     702:	fe843703          	ld	a4,-24(s0)
     706:	97ba                	add	a5,a5,a4
     708:	fef43423          	sd	a5,-24(s0)
    src += n;
     70c:	fcc42783          	lw	a5,-52(s0)
     710:	fe043703          	ld	a4,-32(s0)
     714:	97ba                	add	a5,a5,a4
     716:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     71a:	a01d                	j	740 <memmove+0xa6>
      *--dst = *--src;
     71c:	fe043783          	ld	a5,-32(s0)
     720:	17fd                	addi	a5,a5,-1
     722:	fef43023          	sd	a5,-32(s0)
     726:	fe843783          	ld	a5,-24(s0)
     72a:	17fd                	addi	a5,a5,-1
     72c:	fef43423          	sd	a5,-24(s0)
     730:	fe043783          	ld	a5,-32(s0)
     734:	0007c703          	lbu	a4,0(a5)
     738:	fe843783          	ld	a5,-24(s0)
     73c:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     740:	fcc42783          	lw	a5,-52(s0)
     744:	fff7871b          	addiw	a4,a5,-1
     748:	fce42623          	sw	a4,-52(s0)
     74c:	fcf048e3          	bgtz	a5,71c <memmove+0x82>
  }
  return vdst;
     750:	fd843783          	ld	a5,-40(s0)
}
     754:	853e                	mv	a0,a5
     756:	7462                	ld	s0,56(sp)
     758:	6121                	addi	sp,sp,64
     75a:	8082                	ret

000000000000075c <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     75c:	7139                	addi	sp,sp,-64
     75e:	fc22                	sd	s0,56(sp)
     760:	0080                	addi	s0,sp,64
     762:	fca43c23          	sd	a0,-40(s0)
     766:	fcb43823          	sd	a1,-48(s0)
     76a:	87b2                	mv	a5,a2
     76c:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     770:	fd843783          	ld	a5,-40(s0)
     774:	fef43423          	sd	a5,-24(s0)
     778:	fd043783          	ld	a5,-48(s0)
     77c:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     780:	a0a1                	j	7c8 <memcmp+0x6c>
    if (*p1 != *p2) {
     782:	fe843783          	ld	a5,-24(s0)
     786:	0007c703          	lbu	a4,0(a5)
     78a:	fe043783          	ld	a5,-32(s0)
     78e:	0007c783          	lbu	a5,0(a5)
     792:	02f70163          	beq	a4,a5,7b4 <memcmp+0x58>
      return *p1 - *p2;
     796:	fe843783          	ld	a5,-24(s0)
     79a:	0007c783          	lbu	a5,0(a5)
     79e:	0007871b          	sext.w	a4,a5
     7a2:	fe043783          	ld	a5,-32(s0)
     7a6:	0007c783          	lbu	a5,0(a5)
     7aa:	2781                	sext.w	a5,a5
     7ac:	40f707bb          	subw	a5,a4,a5
     7b0:	2781                	sext.w	a5,a5
     7b2:	a01d                	j	7d8 <memcmp+0x7c>
    }
    p1++;
     7b4:	fe843783          	ld	a5,-24(s0)
     7b8:	0785                	addi	a5,a5,1
     7ba:	fef43423          	sd	a5,-24(s0)
    p2++;
     7be:	fe043783          	ld	a5,-32(s0)
     7c2:	0785                	addi	a5,a5,1
     7c4:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     7c8:	fcc42783          	lw	a5,-52(s0)
     7cc:	fff7871b          	addiw	a4,a5,-1
     7d0:	fce42623          	sw	a4,-52(s0)
     7d4:	f7dd                	bnez	a5,782 <memcmp+0x26>
  }
  return 0;
     7d6:	4781                	li	a5,0
}
     7d8:	853e                	mv	a0,a5
     7da:	7462                	ld	s0,56(sp)
     7dc:	6121                	addi	sp,sp,64
     7de:	8082                	ret

00000000000007e0 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     7e0:	7179                	addi	sp,sp,-48
     7e2:	f406                	sd	ra,40(sp)
     7e4:	f022                	sd	s0,32(sp)
     7e6:	1800                	addi	s0,sp,48
     7e8:	fea43423          	sd	a0,-24(s0)
     7ec:	feb43023          	sd	a1,-32(s0)
     7f0:	87b2                	mv	a5,a2
     7f2:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     7f6:	fdc42783          	lw	a5,-36(s0)
     7fa:	863e                	mv	a2,a5
     7fc:	fe043583          	ld	a1,-32(s0)
     800:	fe843503          	ld	a0,-24(s0)
     804:	00000097          	auipc	ra,0x0
     808:	e96080e7          	jalr	-362(ra) # 69a <memmove>
     80c:	87aa                	mv	a5,a0
}
     80e:	853e                	mv	a0,a5
     810:	70a2                	ld	ra,40(sp)
     812:	7402                	ld	s0,32(sp)
     814:	6145                	addi	sp,sp,48
     816:	8082                	ret

0000000000000818 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     818:	4885                	li	a7,1
 ecall
     81a:	00000073          	ecall
 ret
     81e:	8082                	ret

0000000000000820 <exit>:
.global exit
exit:
 li a7, SYS_exit
     820:	4889                	li	a7,2
 ecall
     822:	00000073          	ecall
 ret
     826:	8082                	ret

0000000000000828 <wait>:
.global wait
wait:
 li a7, SYS_wait
     828:	488d                	li	a7,3
 ecall
     82a:	00000073          	ecall
 ret
     82e:	8082                	ret

0000000000000830 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     830:	4891                	li	a7,4
 ecall
     832:	00000073          	ecall
 ret
     836:	8082                	ret

0000000000000838 <read>:
.global read
read:
 li a7, SYS_read
     838:	4895                	li	a7,5
 ecall
     83a:	00000073          	ecall
 ret
     83e:	8082                	ret

0000000000000840 <write>:
.global write
write:
 li a7, SYS_write
     840:	48c1                	li	a7,16
 ecall
     842:	00000073          	ecall
 ret
     846:	8082                	ret

0000000000000848 <close>:
.global close
close:
 li a7, SYS_close
     848:	48d5                	li	a7,21
 ecall
     84a:	00000073          	ecall
 ret
     84e:	8082                	ret

0000000000000850 <kill>:
.global kill
kill:
 li a7, SYS_kill
     850:	4899                	li	a7,6
 ecall
     852:	00000073          	ecall
 ret
     856:	8082                	ret

0000000000000858 <exec>:
.global exec
exec:
 li a7, SYS_exec
     858:	489d                	li	a7,7
 ecall
     85a:	00000073          	ecall
 ret
     85e:	8082                	ret

0000000000000860 <open>:
.global open
open:
 li a7, SYS_open
     860:	48bd                	li	a7,15
 ecall
     862:	00000073          	ecall
 ret
     866:	8082                	ret

0000000000000868 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     868:	48c5                	li	a7,17
 ecall
     86a:	00000073          	ecall
 ret
     86e:	8082                	ret

0000000000000870 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     870:	48c9                	li	a7,18
 ecall
     872:	00000073          	ecall
 ret
     876:	8082                	ret

0000000000000878 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     878:	48a1                	li	a7,8
 ecall
     87a:	00000073          	ecall
 ret
     87e:	8082                	ret

0000000000000880 <link>:
.global link
link:
 li a7, SYS_link
     880:	48cd                	li	a7,19
 ecall
     882:	00000073          	ecall
 ret
     886:	8082                	ret

0000000000000888 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     888:	48d1                	li	a7,20
 ecall
     88a:	00000073          	ecall
 ret
     88e:	8082                	ret

0000000000000890 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     890:	48a5                	li	a7,9
 ecall
     892:	00000073          	ecall
 ret
     896:	8082                	ret

0000000000000898 <dup>:
.global dup
dup:
 li a7, SYS_dup
     898:	48a9                	li	a7,10
 ecall
     89a:	00000073          	ecall
 ret
     89e:	8082                	ret

00000000000008a0 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     8a0:	48ad                	li	a7,11
 ecall
     8a2:	00000073          	ecall
 ret
     8a6:	8082                	ret

00000000000008a8 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     8a8:	48b1                	li	a7,12
 ecall
     8aa:	00000073          	ecall
 ret
     8ae:	8082                	ret

00000000000008b0 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     8b0:	48b5                	li	a7,13
 ecall
     8b2:	00000073          	ecall
 ret
     8b6:	8082                	ret

00000000000008b8 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     8b8:	48b9                	li	a7,14
 ecall
     8ba:	00000073          	ecall
 ret
     8be:	8082                	ret

00000000000008c0 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     8c0:	48d9                	li	a7,22
 ecall
     8c2:	00000073          	ecall
 ret
     8c6:	8082                	ret

00000000000008c8 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     8c8:	48dd                	li	a7,23
 ecall
     8ca:	00000073          	ecall
 ret
     8ce:	8082                	ret

00000000000008d0 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     8d0:	48e1                	li	a7,24
 ecall
     8d2:	00000073          	ecall
 ret
     8d6:	8082                	ret

00000000000008d8 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     8d8:	1101                	addi	sp,sp,-32
     8da:	ec06                	sd	ra,24(sp)
     8dc:	e822                	sd	s0,16(sp)
     8de:	1000                	addi	s0,sp,32
     8e0:	87aa                	mv	a5,a0
     8e2:	872e                	mv	a4,a1
     8e4:	fef42623          	sw	a5,-20(s0)
     8e8:	87ba                	mv	a5,a4
     8ea:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     8ee:	feb40713          	addi	a4,s0,-21
     8f2:	fec42783          	lw	a5,-20(s0)
     8f6:	4605                	li	a2,1
     8f8:	85ba                	mv	a1,a4
     8fa:	853e                	mv	a0,a5
     8fc:	00000097          	auipc	ra,0x0
     900:	f44080e7          	jalr	-188(ra) # 840 <write>
}
     904:	0001                	nop
     906:	60e2                	ld	ra,24(sp)
     908:	6442                	ld	s0,16(sp)
     90a:	6105                	addi	sp,sp,32
     90c:	8082                	ret

000000000000090e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     90e:	7139                	addi	sp,sp,-64
     910:	fc06                	sd	ra,56(sp)
     912:	f822                	sd	s0,48(sp)
     914:	0080                	addi	s0,sp,64
     916:	87aa                	mv	a5,a0
     918:	8736                	mv	a4,a3
     91a:	fcf42623          	sw	a5,-52(s0)
     91e:	87ae                	mv	a5,a1
     920:	fcf42423          	sw	a5,-56(s0)
     924:	87b2                	mv	a5,a2
     926:	fcf42223          	sw	a5,-60(s0)
     92a:	87ba                	mv	a5,a4
     92c:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     930:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     934:	fc042783          	lw	a5,-64(s0)
     938:	2781                	sext.w	a5,a5
     93a:	c38d                	beqz	a5,95c <printint+0x4e>
     93c:	fc842783          	lw	a5,-56(s0)
     940:	2781                	sext.w	a5,a5
     942:	0007dd63          	bgez	a5,95c <printint+0x4e>
    neg = 1;
     946:	4785                	li	a5,1
     948:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     94c:	fc842783          	lw	a5,-56(s0)
     950:	40f007bb          	negw	a5,a5
     954:	2781                	sext.w	a5,a5
     956:	fef42223          	sw	a5,-28(s0)
     95a:	a029                	j	964 <printint+0x56>
  } else {
    x = xx;
     95c:	fc842783          	lw	a5,-56(s0)
     960:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     964:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     968:	fc442783          	lw	a5,-60(s0)
     96c:	fe442703          	lw	a4,-28(s0)
     970:	02f777bb          	remuw	a5,a4,a5
     974:	0007861b          	sext.w	a2,a5
     978:	fec42783          	lw	a5,-20(s0)
     97c:	0017871b          	addiw	a4,a5,1
     980:	fee42623          	sw	a4,-20(s0)
     984:	00002697          	auipc	a3,0x2
     988:	c9c68693          	addi	a3,a3,-868 # 2620 <digits>
     98c:	02061713          	slli	a4,a2,0x20
     990:	9301                	srli	a4,a4,0x20
     992:	9736                	add	a4,a4,a3
     994:	00074703          	lbu	a4,0(a4)
     998:	ff040693          	addi	a3,s0,-16
     99c:	97b6                	add	a5,a5,a3
     99e:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     9a2:	fc442783          	lw	a5,-60(s0)
     9a6:	fe442703          	lw	a4,-28(s0)
     9aa:	02f757bb          	divuw	a5,a4,a5
     9ae:	fef42223          	sw	a5,-28(s0)
     9b2:	fe442783          	lw	a5,-28(s0)
     9b6:	2781                	sext.w	a5,a5
     9b8:	fbc5                	bnez	a5,968 <printint+0x5a>
  if(neg)
     9ba:	fe842783          	lw	a5,-24(s0)
     9be:	2781                	sext.w	a5,a5
     9c0:	cf95                	beqz	a5,9fc <printint+0xee>
    buf[i++] = '-';
     9c2:	fec42783          	lw	a5,-20(s0)
     9c6:	0017871b          	addiw	a4,a5,1
     9ca:	fee42623          	sw	a4,-20(s0)
     9ce:	ff040713          	addi	a4,s0,-16
     9d2:	97ba                	add	a5,a5,a4
     9d4:	02d00713          	li	a4,45
     9d8:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     9dc:	a005                	j	9fc <printint+0xee>
    putc(fd, buf[i]);
     9de:	fec42783          	lw	a5,-20(s0)
     9e2:	ff040713          	addi	a4,s0,-16
     9e6:	97ba                	add	a5,a5,a4
     9e8:	fe07c703          	lbu	a4,-32(a5)
     9ec:	fcc42783          	lw	a5,-52(s0)
     9f0:	85ba                	mv	a1,a4
     9f2:	853e                	mv	a0,a5
     9f4:	00000097          	auipc	ra,0x0
     9f8:	ee4080e7          	jalr	-284(ra) # 8d8 <putc>
  while(--i >= 0)
     9fc:	fec42783          	lw	a5,-20(s0)
     a00:	37fd                	addiw	a5,a5,-1
     a02:	fef42623          	sw	a5,-20(s0)
     a06:	fec42783          	lw	a5,-20(s0)
     a0a:	2781                	sext.w	a5,a5
     a0c:	fc07d9e3          	bgez	a5,9de <printint+0xd0>
}
     a10:	0001                	nop
     a12:	0001                	nop
     a14:	70e2                	ld	ra,56(sp)
     a16:	7442                	ld	s0,48(sp)
     a18:	6121                	addi	sp,sp,64
     a1a:	8082                	ret

0000000000000a1c <printptr>:

static void
printptr(int fd, uint64 x) {
     a1c:	7179                	addi	sp,sp,-48
     a1e:	f406                	sd	ra,40(sp)
     a20:	f022                	sd	s0,32(sp)
     a22:	1800                	addi	s0,sp,48
     a24:	87aa                	mv	a5,a0
     a26:	fcb43823          	sd	a1,-48(s0)
     a2a:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     a2e:	fdc42783          	lw	a5,-36(s0)
     a32:	03000593          	li	a1,48
     a36:	853e                	mv	a0,a5
     a38:	00000097          	auipc	ra,0x0
     a3c:	ea0080e7          	jalr	-352(ra) # 8d8 <putc>
  putc(fd, 'x');
     a40:	fdc42783          	lw	a5,-36(s0)
     a44:	07800593          	li	a1,120
     a48:	853e                	mv	a0,a5
     a4a:	00000097          	auipc	ra,0x0
     a4e:	e8e080e7          	jalr	-370(ra) # 8d8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a52:	fe042623          	sw	zero,-20(s0)
     a56:	a82d                	j	a90 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     a58:	fd043783          	ld	a5,-48(s0)
     a5c:	93f1                	srli	a5,a5,0x3c
     a5e:	00002717          	auipc	a4,0x2
     a62:	bc270713          	addi	a4,a4,-1086 # 2620 <digits>
     a66:	97ba                	add	a5,a5,a4
     a68:	0007c703          	lbu	a4,0(a5)
     a6c:	fdc42783          	lw	a5,-36(s0)
     a70:	85ba                	mv	a1,a4
     a72:	853e                	mv	a0,a5
     a74:	00000097          	auipc	ra,0x0
     a78:	e64080e7          	jalr	-412(ra) # 8d8 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     a7c:	fec42783          	lw	a5,-20(s0)
     a80:	2785                	addiw	a5,a5,1
     a82:	fef42623          	sw	a5,-20(s0)
     a86:	fd043783          	ld	a5,-48(s0)
     a8a:	0792                	slli	a5,a5,0x4
     a8c:	fcf43823          	sd	a5,-48(s0)
     a90:	fec42783          	lw	a5,-20(s0)
     a94:	873e                	mv	a4,a5
     a96:	47bd                	li	a5,15
     a98:	fce7f0e3          	bgeu	a5,a4,a58 <printptr+0x3c>
}
     a9c:	0001                	nop
     a9e:	0001                	nop
     aa0:	70a2                	ld	ra,40(sp)
     aa2:	7402                	ld	s0,32(sp)
     aa4:	6145                	addi	sp,sp,48
     aa6:	8082                	ret

0000000000000aa8 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     aa8:	715d                	addi	sp,sp,-80
     aaa:	e486                	sd	ra,72(sp)
     aac:	e0a2                	sd	s0,64(sp)
     aae:	0880                	addi	s0,sp,80
     ab0:	87aa                	mv	a5,a0
     ab2:	fcb43023          	sd	a1,-64(s0)
     ab6:	fac43c23          	sd	a2,-72(s0)
     aba:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     abe:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     ac2:	fe042223          	sw	zero,-28(s0)
     ac6:	a42d                	j	cf0 <vprintf+0x248>
    c = fmt[i] & 0xff;
     ac8:	fe442783          	lw	a5,-28(s0)
     acc:	fc043703          	ld	a4,-64(s0)
     ad0:	97ba                	add	a5,a5,a4
     ad2:	0007c783          	lbu	a5,0(a5)
     ad6:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     ada:	fe042783          	lw	a5,-32(s0)
     ade:	2781                	sext.w	a5,a5
     ae0:	eb9d                	bnez	a5,b16 <vprintf+0x6e>
      if(c == '%'){
     ae2:	fdc42783          	lw	a5,-36(s0)
     ae6:	0007871b          	sext.w	a4,a5
     aea:	02500793          	li	a5,37
     aee:	00f71763          	bne	a4,a5,afc <vprintf+0x54>
        state = '%';
     af2:	02500793          	li	a5,37
     af6:	fef42023          	sw	a5,-32(s0)
     afa:	a2f5                	j	ce6 <vprintf+0x23e>
      } else {
        putc(fd, c);
     afc:	fdc42783          	lw	a5,-36(s0)
     b00:	0ff7f713          	andi	a4,a5,255
     b04:	fcc42783          	lw	a5,-52(s0)
     b08:	85ba                	mv	a1,a4
     b0a:	853e                	mv	a0,a5
     b0c:	00000097          	auipc	ra,0x0
     b10:	dcc080e7          	jalr	-564(ra) # 8d8 <putc>
     b14:	aac9                	j	ce6 <vprintf+0x23e>
      }
    } else if(state == '%'){
     b16:	fe042783          	lw	a5,-32(s0)
     b1a:	0007871b          	sext.w	a4,a5
     b1e:	02500793          	li	a5,37
     b22:	1cf71263          	bne	a4,a5,ce6 <vprintf+0x23e>
      if(c == 'd'){
     b26:	fdc42783          	lw	a5,-36(s0)
     b2a:	0007871b          	sext.w	a4,a5
     b2e:	06400793          	li	a5,100
     b32:	02f71463          	bne	a4,a5,b5a <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     b36:	fb843783          	ld	a5,-72(s0)
     b3a:	00878713          	addi	a4,a5,8
     b3e:	fae43c23          	sd	a4,-72(s0)
     b42:	4398                	lw	a4,0(a5)
     b44:	fcc42783          	lw	a5,-52(s0)
     b48:	4685                	li	a3,1
     b4a:	4629                	li	a2,10
     b4c:	85ba                	mv	a1,a4
     b4e:	853e                	mv	a0,a5
     b50:	00000097          	auipc	ra,0x0
     b54:	dbe080e7          	jalr	-578(ra) # 90e <printint>
     b58:	a269                	j	ce2 <vprintf+0x23a>
      } else if(c == 'l') {
     b5a:	fdc42783          	lw	a5,-36(s0)
     b5e:	0007871b          	sext.w	a4,a5
     b62:	06c00793          	li	a5,108
     b66:	02f71663          	bne	a4,a5,b92 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     b6a:	fb843783          	ld	a5,-72(s0)
     b6e:	00878713          	addi	a4,a5,8
     b72:	fae43c23          	sd	a4,-72(s0)
     b76:	639c                	ld	a5,0(a5)
     b78:	0007871b          	sext.w	a4,a5
     b7c:	fcc42783          	lw	a5,-52(s0)
     b80:	4681                	li	a3,0
     b82:	4629                	li	a2,10
     b84:	85ba                	mv	a1,a4
     b86:	853e                	mv	a0,a5
     b88:	00000097          	auipc	ra,0x0
     b8c:	d86080e7          	jalr	-634(ra) # 90e <printint>
     b90:	aa89                	j	ce2 <vprintf+0x23a>
      } else if(c == 'x') {
     b92:	fdc42783          	lw	a5,-36(s0)
     b96:	0007871b          	sext.w	a4,a5
     b9a:	07800793          	li	a5,120
     b9e:	02f71463          	bne	a4,a5,bc6 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     ba2:	fb843783          	ld	a5,-72(s0)
     ba6:	00878713          	addi	a4,a5,8
     baa:	fae43c23          	sd	a4,-72(s0)
     bae:	4398                	lw	a4,0(a5)
     bb0:	fcc42783          	lw	a5,-52(s0)
     bb4:	4681                	li	a3,0
     bb6:	4641                	li	a2,16
     bb8:	85ba                	mv	a1,a4
     bba:	853e                	mv	a0,a5
     bbc:	00000097          	auipc	ra,0x0
     bc0:	d52080e7          	jalr	-686(ra) # 90e <printint>
     bc4:	aa39                	j	ce2 <vprintf+0x23a>
      } else if(c == 'p') {
     bc6:	fdc42783          	lw	a5,-36(s0)
     bca:	0007871b          	sext.w	a4,a5
     bce:	07000793          	li	a5,112
     bd2:	02f71263          	bne	a4,a5,bf6 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     bd6:	fb843783          	ld	a5,-72(s0)
     bda:	00878713          	addi	a4,a5,8
     bde:	fae43c23          	sd	a4,-72(s0)
     be2:	6398                	ld	a4,0(a5)
     be4:	fcc42783          	lw	a5,-52(s0)
     be8:	85ba                	mv	a1,a4
     bea:	853e                	mv	a0,a5
     bec:	00000097          	auipc	ra,0x0
     bf0:	e30080e7          	jalr	-464(ra) # a1c <printptr>
     bf4:	a0fd                	j	ce2 <vprintf+0x23a>
      } else if(c == 's'){
     bf6:	fdc42783          	lw	a5,-36(s0)
     bfa:	0007871b          	sext.w	a4,a5
     bfe:	07300793          	li	a5,115
     c02:	04f71c63          	bne	a4,a5,c5a <vprintf+0x1b2>
        s = va_arg(ap, char*);
     c06:	fb843783          	ld	a5,-72(s0)
     c0a:	00878713          	addi	a4,a5,8
     c0e:	fae43c23          	sd	a4,-72(s0)
     c12:	639c                	ld	a5,0(a5)
     c14:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     c18:	fe843783          	ld	a5,-24(s0)
     c1c:	eb8d                	bnez	a5,c4e <vprintf+0x1a6>
          s = "(null)";
     c1e:	00001797          	auipc	a5,0x1
     c22:	78278793          	addi	a5,a5,1922 # 23a0 <schedule_edf_cbs+0x544>
     c26:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c2a:	a015                	j	c4e <vprintf+0x1a6>
          putc(fd, *s);
     c2c:	fe843783          	ld	a5,-24(s0)
     c30:	0007c703          	lbu	a4,0(a5)
     c34:	fcc42783          	lw	a5,-52(s0)
     c38:	85ba                	mv	a1,a4
     c3a:	853e                	mv	a0,a5
     c3c:	00000097          	auipc	ra,0x0
     c40:	c9c080e7          	jalr	-868(ra) # 8d8 <putc>
          s++;
     c44:	fe843783          	ld	a5,-24(s0)
     c48:	0785                	addi	a5,a5,1
     c4a:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     c4e:	fe843783          	ld	a5,-24(s0)
     c52:	0007c783          	lbu	a5,0(a5)
     c56:	fbf9                	bnez	a5,c2c <vprintf+0x184>
     c58:	a069                	j	ce2 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     c5a:	fdc42783          	lw	a5,-36(s0)
     c5e:	0007871b          	sext.w	a4,a5
     c62:	06300793          	li	a5,99
     c66:	02f71463          	bne	a4,a5,c8e <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     c6a:	fb843783          	ld	a5,-72(s0)
     c6e:	00878713          	addi	a4,a5,8
     c72:	fae43c23          	sd	a4,-72(s0)
     c76:	439c                	lw	a5,0(a5)
     c78:	0ff7f713          	andi	a4,a5,255
     c7c:	fcc42783          	lw	a5,-52(s0)
     c80:	85ba                	mv	a1,a4
     c82:	853e                	mv	a0,a5
     c84:	00000097          	auipc	ra,0x0
     c88:	c54080e7          	jalr	-940(ra) # 8d8 <putc>
     c8c:	a899                	j	ce2 <vprintf+0x23a>
      } else if(c == '%'){
     c8e:	fdc42783          	lw	a5,-36(s0)
     c92:	0007871b          	sext.w	a4,a5
     c96:	02500793          	li	a5,37
     c9a:	00f71f63          	bne	a4,a5,cb8 <vprintf+0x210>
        putc(fd, c);
     c9e:	fdc42783          	lw	a5,-36(s0)
     ca2:	0ff7f713          	andi	a4,a5,255
     ca6:	fcc42783          	lw	a5,-52(s0)
     caa:	85ba                	mv	a1,a4
     cac:	853e                	mv	a0,a5
     cae:	00000097          	auipc	ra,0x0
     cb2:	c2a080e7          	jalr	-982(ra) # 8d8 <putc>
     cb6:	a035                	j	ce2 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     cb8:	fcc42783          	lw	a5,-52(s0)
     cbc:	02500593          	li	a1,37
     cc0:	853e                	mv	a0,a5
     cc2:	00000097          	auipc	ra,0x0
     cc6:	c16080e7          	jalr	-1002(ra) # 8d8 <putc>
        putc(fd, c);
     cca:	fdc42783          	lw	a5,-36(s0)
     cce:	0ff7f713          	andi	a4,a5,255
     cd2:	fcc42783          	lw	a5,-52(s0)
     cd6:	85ba                	mv	a1,a4
     cd8:	853e                	mv	a0,a5
     cda:	00000097          	auipc	ra,0x0
     cde:	bfe080e7          	jalr	-1026(ra) # 8d8 <putc>
      }
      state = 0;
     ce2:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     ce6:	fe442783          	lw	a5,-28(s0)
     cea:	2785                	addiw	a5,a5,1
     cec:	fef42223          	sw	a5,-28(s0)
     cf0:	fe442783          	lw	a5,-28(s0)
     cf4:	fc043703          	ld	a4,-64(s0)
     cf8:	97ba                	add	a5,a5,a4
     cfa:	0007c783          	lbu	a5,0(a5)
     cfe:	dc0795e3          	bnez	a5,ac8 <vprintf+0x20>
    }
  }
}
     d02:	0001                	nop
     d04:	0001                	nop
     d06:	60a6                	ld	ra,72(sp)
     d08:	6406                	ld	s0,64(sp)
     d0a:	6161                	addi	sp,sp,80
     d0c:	8082                	ret

0000000000000d0e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     d0e:	7159                	addi	sp,sp,-112
     d10:	fc06                	sd	ra,56(sp)
     d12:	f822                	sd	s0,48(sp)
     d14:	0080                	addi	s0,sp,64
     d16:	fcb43823          	sd	a1,-48(s0)
     d1a:	e010                	sd	a2,0(s0)
     d1c:	e414                	sd	a3,8(s0)
     d1e:	e818                	sd	a4,16(s0)
     d20:	ec1c                	sd	a5,24(s0)
     d22:	03043023          	sd	a6,32(s0)
     d26:	03143423          	sd	a7,40(s0)
     d2a:	87aa                	mv	a5,a0
     d2c:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     d30:	03040793          	addi	a5,s0,48
     d34:	fcf43423          	sd	a5,-56(s0)
     d38:	fc843783          	ld	a5,-56(s0)
     d3c:	fd078793          	addi	a5,a5,-48
     d40:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     d44:	fe843703          	ld	a4,-24(s0)
     d48:	fdc42783          	lw	a5,-36(s0)
     d4c:	863a                	mv	a2,a4
     d4e:	fd043583          	ld	a1,-48(s0)
     d52:	853e                	mv	a0,a5
     d54:	00000097          	auipc	ra,0x0
     d58:	d54080e7          	jalr	-684(ra) # aa8 <vprintf>
}
     d5c:	0001                	nop
     d5e:	70e2                	ld	ra,56(sp)
     d60:	7442                	ld	s0,48(sp)
     d62:	6165                	addi	sp,sp,112
     d64:	8082                	ret

0000000000000d66 <printf>:

void
printf(const char *fmt, ...)
{
     d66:	7159                	addi	sp,sp,-112
     d68:	f406                	sd	ra,40(sp)
     d6a:	f022                	sd	s0,32(sp)
     d6c:	1800                	addi	s0,sp,48
     d6e:	fca43c23          	sd	a0,-40(s0)
     d72:	e40c                	sd	a1,8(s0)
     d74:	e810                	sd	a2,16(s0)
     d76:	ec14                	sd	a3,24(s0)
     d78:	f018                	sd	a4,32(s0)
     d7a:	f41c                	sd	a5,40(s0)
     d7c:	03043823          	sd	a6,48(s0)
     d80:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     d84:	04040793          	addi	a5,s0,64
     d88:	fcf43823          	sd	a5,-48(s0)
     d8c:	fd043783          	ld	a5,-48(s0)
     d90:	fc878793          	addi	a5,a5,-56
     d94:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     d98:	fe843783          	ld	a5,-24(s0)
     d9c:	863e                	mv	a2,a5
     d9e:	fd843583          	ld	a1,-40(s0)
     da2:	4505                	li	a0,1
     da4:	00000097          	auipc	ra,0x0
     da8:	d04080e7          	jalr	-764(ra) # aa8 <vprintf>
}
     dac:	0001                	nop
     dae:	70a2                	ld	ra,40(sp)
     db0:	7402                	ld	s0,32(sp)
     db2:	6165                	addi	sp,sp,112
     db4:	8082                	ret

0000000000000db6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     db6:	7179                	addi	sp,sp,-48
     db8:	f422                	sd	s0,40(sp)
     dba:	1800                	addi	s0,sp,48
     dbc:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     dc0:	fd843783          	ld	a5,-40(s0)
     dc4:	17c1                	addi	a5,a5,-16
     dc6:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     dca:	00002797          	auipc	a5,0x2
     dce:	8be78793          	addi	a5,a5,-1858 # 2688 <freep>
     dd2:	639c                	ld	a5,0(a5)
     dd4:	fef43423          	sd	a5,-24(s0)
     dd8:	a815                	j	e0c <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     dda:	fe843783          	ld	a5,-24(s0)
     dde:	639c                	ld	a5,0(a5)
     de0:	fe843703          	ld	a4,-24(s0)
     de4:	00f76f63          	bltu	a4,a5,e02 <free+0x4c>
     de8:	fe043703          	ld	a4,-32(s0)
     dec:	fe843783          	ld	a5,-24(s0)
     df0:	02e7eb63          	bltu	a5,a4,e26 <free+0x70>
     df4:	fe843783          	ld	a5,-24(s0)
     df8:	639c                	ld	a5,0(a5)
     dfa:	fe043703          	ld	a4,-32(s0)
     dfe:	02f76463          	bltu	a4,a5,e26 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     e02:	fe843783          	ld	a5,-24(s0)
     e06:	639c                	ld	a5,0(a5)
     e08:	fef43423          	sd	a5,-24(s0)
     e0c:	fe043703          	ld	a4,-32(s0)
     e10:	fe843783          	ld	a5,-24(s0)
     e14:	fce7f3e3          	bgeu	a5,a4,dda <free+0x24>
     e18:	fe843783          	ld	a5,-24(s0)
     e1c:	639c                	ld	a5,0(a5)
     e1e:	fe043703          	ld	a4,-32(s0)
     e22:	faf77ce3          	bgeu	a4,a5,dda <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     e26:	fe043783          	ld	a5,-32(s0)
     e2a:	479c                	lw	a5,8(a5)
     e2c:	1782                	slli	a5,a5,0x20
     e2e:	9381                	srli	a5,a5,0x20
     e30:	0792                	slli	a5,a5,0x4
     e32:	fe043703          	ld	a4,-32(s0)
     e36:	973e                	add	a4,a4,a5
     e38:	fe843783          	ld	a5,-24(s0)
     e3c:	639c                	ld	a5,0(a5)
     e3e:	02f71763          	bne	a4,a5,e6c <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     e42:	fe043783          	ld	a5,-32(s0)
     e46:	4798                	lw	a4,8(a5)
     e48:	fe843783          	ld	a5,-24(s0)
     e4c:	639c                	ld	a5,0(a5)
     e4e:	479c                	lw	a5,8(a5)
     e50:	9fb9                	addw	a5,a5,a4
     e52:	0007871b          	sext.w	a4,a5
     e56:	fe043783          	ld	a5,-32(s0)
     e5a:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     e5c:	fe843783          	ld	a5,-24(s0)
     e60:	639c                	ld	a5,0(a5)
     e62:	6398                	ld	a4,0(a5)
     e64:	fe043783          	ld	a5,-32(s0)
     e68:	e398                	sd	a4,0(a5)
     e6a:	a039                	j	e78 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     e6c:	fe843783          	ld	a5,-24(s0)
     e70:	6398                	ld	a4,0(a5)
     e72:	fe043783          	ld	a5,-32(s0)
     e76:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     e78:	fe843783          	ld	a5,-24(s0)
     e7c:	479c                	lw	a5,8(a5)
     e7e:	1782                	slli	a5,a5,0x20
     e80:	9381                	srli	a5,a5,0x20
     e82:	0792                	slli	a5,a5,0x4
     e84:	fe843703          	ld	a4,-24(s0)
     e88:	97ba                	add	a5,a5,a4
     e8a:	fe043703          	ld	a4,-32(s0)
     e8e:	02f71563          	bne	a4,a5,eb8 <free+0x102>
    p->s.size += bp->s.size;
     e92:	fe843783          	ld	a5,-24(s0)
     e96:	4798                	lw	a4,8(a5)
     e98:	fe043783          	ld	a5,-32(s0)
     e9c:	479c                	lw	a5,8(a5)
     e9e:	9fb9                	addw	a5,a5,a4
     ea0:	0007871b          	sext.w	a4,a5
     ea4:	fe843783          	ld	a5,-24(s0)
     ea8:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     eaa:	fe043783          	ld	a5,-32(s0)
     eae:	6398                	ld	a4,0(a5)
     eb0:	fe843783          	ld	a5,-24(s0)
     eb4:	e398                	sd	a4,0(a5)
     eb6:	a031                	j	ec2 <free+0x10c>
  } else
    p->s.ptr = bp;
     eb8:	fe843783          	ld	a5,-24(s0)
     ebc:	fe043703          	ld	a4,-32(s0)
     ec0:	e398                	sd	a4,0(a5)
  freep = p;
     ec2:	00001797          	auipc	a5,0x1
     ec6:	7c678793          	addi	a5,a5,1990 # 2688 <freep>
     eca:	fe843703          	ld	a4,-24(s0)
     ece:	e398                	sd	a4,0(a5)
}
     ed0:	0001                	nop
     ed2:	7422                	ld	s0,40(sp)
     ed4:	6145                	addi	sp,sp,48
     ed6:	8082                	ret

0000000000000ed8 <morecore>:

static Header*
morecore(uint nu)
{
     ed8:	7179                	addi	sp,sp,-48
     eda:	f406                	sd	ra,40(sp)
     edc:	f022                	sd	s0,32(sp)
     ede:	1800                	addi	s0,sp,48
     ee0:	87aa                	mv	a5,a0
     ee2:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     ee6:	fdc42783          	lw	a5,-36(s0)
     eea:	0007871b          	sext.w	a4,a5
     eee:	6785                	lui	a5,0x1
     ef0:	00f77563          	bgeu	a4,a5,efa <morecore+0x22>
    nu = 4096;
     ef4:	6785                	lui	a5,0x1
     ef6:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     efa:	fdc42783          	lw	a5,-36(s0)
     efe:	0047979b          	slliw	a5,a5,0x4
     f02:	2781                	sext.w	a5,a5
     f04:	2781                	sext.w	a5,a5
     f06:	853e                	mv	a0,a5
     f08:	00000097          	auipc	ra,0x0
     f0c:	9a0080e7          	jalr	-1632(ra) # 8a8 <sbrk>
     f10:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     f14:	fe843703          	ld	a4,-24(s0)
     f18:	57fd                	li	a5,-1
     f1a:	00f71463          	bne	a4,a5,f22 <morecore+0x4a>
    return 0;
     f1e:	4781                	li	a5,0
     f20:	a03d                	j	f4e <morecore+0x76>
  hp = (Header*)p;
     f22:	fe843783          	ld	a5,-24(s0)
     f26:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     f2a:	fe043783          	ld	a5,-32(s0)
     f2e:	fdc42703          	lw	a4,-36(s0)
     f32:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     f34:	fe043783          	ld	a5,-32(s0)
     f38:	07c1                	addi	a5,a5,16
     f3a:	853e                	mv	a0,a5
     f3c:	00000097          	auipc	ra,0x0
     f40:	e7a080e7          	jalr	-390(ra) # db6 <free>
  return freep;
     f44:	00001797          	auipc	a5,0x1
     f48:	74478793          	addi	a5,a5,1860 # 2688 <freep>
     f4c:	639c                	ld	a5,0(a5)
}
     f4e:	853e                	mv	a0,a5
     f50:	70a2                	ld	ra,40(sp)
     f52:	7402                	ld	s0,32(sp)
     f54:	6145                	addi	sp,sp,48
     f56:	8082                	ret

0000000000000f58 <malloc>:

void*
malloc(uint nbytes)
{
     f58:	7139                	addi	sp,sp,-64
     f5a:	fc06                	sd	ra,56(sp)
     f5c:	f822                	sd	s0,48(sp)
     f5e:	0080                	addi	s0,sp,64
     f60:	87aa                	mv	a5,a0
     f62:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     f66:	fcc46783          	lwu	a5,-52(s0)
     f6a:	07bd                	addi	a5,a5,15
     f6c:	8391                	srli	a5,a5,0x4
     f6e:	2781                	sext.w	a5,a5
     f70:	2785                	addiw	a5,a5,1
     f72:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     f76:	00001797          	auipc	a5,0x1
     f7a:	71278793          	addi	a5,a5,1810 # 2688 <freep>
     f7e:	639c                	ld	a5,0(a5)
     f80:	fef43023          	sd	a5,-32(s0)
     f84:	fe043783          	ld	a5,-32(s0)
     f88:	ef95                	bnez	a5,fc4 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     f8a:	00001797          	auipc	a5,0x1
     f8e:	6ee78793          	addi	a5,a5,1774 # 2678 <base>
     f92:	fef43023          	sd	a5,-32(s0)
     f96:	00001797          	auipc	a5,0x1
     f9a:	6f278793          	addi	a5,a5,1778 # 2688 <freep>
     f9e:	fe043703          	ld	a4,-32(s0)
     fa2:	e398                	sd	a4,0(a5)
     fa4:	00001797          	auipc	a5,0x1
     fa8:	6e478793          	addi	a5,a5,1764 # 2688 <freep>
     fac:	6398                	ld	a4,0(a5)
     fae:	00001797          	auipc	a5,0x1
     fb2:	6ca78793          	addi	a5,a5,1738 # 2678 <base>
     fb6:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     fb8:	00001797          	auipc	a5,0x1
     fbc:	6c078793          	addi	a5,a5,1728 # 2678 <base>
     fc0:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     fc4:	fe043783          	ld	a5,-32(s0)
     fc8:	639c                	ld	a5,0(a5)
     fca:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     fce:	fe843783          	ld	a5,-24(s0)
     fd2:	4798                	lw	a4,8(a5)
     fd4:	fdc42783          	lw	a5,-36(s0)
     fd8:	2781                	sext.w	a5,a5
     fda:	06f76863          	bltu	a4,a5,104a <malloc+0xf2>
      if(p->s.size == nunits)
     fde:	fe843783          	ld	a5,-24(s0)
     fe2:	4798                	lw	a4,8(a5)
     fe4:	fdc42783          	lw	a5,-36(s0)
     fe8:	2781                	sext.w	a5,a5
     fea:	00e79963          	bne	a5,a4,ffc <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     fee:	fe843783          	ld	a5,-24(s0)
     ff2:	6398                	ld	a4,0(a5)
     ff4:	fe043783          	ld	a5,-32(s0)
     ff8:	e398                	sd	a4,0(a5)
     ffa:	a82d                	j	1034 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     ffc:	fe843783          	ld	a5,-24(s0)
    1000:	4798                	lw	a4,8(a5)
    1002:	fdc42783          	lw	a5,-36(s0)
    1006:	40f707bb          	subw	a5,a4,a5
    100a:	0007871b          	sext.w	a4,a5
    100e:	fe843783          	ld	a5,-24(s0)
    1012:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1014:	fe843783          	ld	a5,-24(s0)
    1018:	479c                	lw	a5,8(a5)
    101a:	1782                	slli	a5,a5,0x20
    101c:	9381                	srli	a5,a5,0x20
    101e:	0792                	slli	a5,a5,0x4
    1020:	fe843703          	ld	a4,-24(s0)
    1024:	97ba                	add	a5,a5,a4
    1026:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    102a:	fe843783          	ld	a5,-24(s0)
    102e:	fdc42703          	lw	a4,-36(s0)
    1032:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    1034:	00001797          	auipc	a5,0x1
    1038:	65478793          	addi	a5,a5,1620 # 2688 <freep>
    103c:	fe043703          	ld	a4,-32(s0)
    1040:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    1042:	fe843783          	ld	a5,-24(s0)
    1046:	07c1                	addi	a5,a5,16
    1048:	a091                	j	108c <malloc+0x134>
    }
    if(p == freep)
    104a:	00001797          	auipc	a5,0x1
    104e:	63e78793          	addi	a5,a5,1598 # 2688 <freep>
    1052:	639c                	ld	a5,0(a5)
    1054:	fe843703          	ld	a4,-24(s0)
    1058:	02f71063          	bne	a4,a5,1078 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    105c:	fdc42783          	lw	a5,-36(s0)
    1060:	853e                	mv	a0,a5
    1062:	00000097          	auipc	ra,0x0
    1066:	e76080e7          	jalr	-394(ra) # ed8 <morecore>
    106a:	fea43423          	sd	a0,-24(s0)
    106e:	fe843783          	ld	a5,-24(s0)
    1072:	e399                	bnez	a5,1078 <malloc+0x120>
        return 0;
    1074:	4781                	li	a5,0
    1076:	a819                	j	108c <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1078:	fe843783          	ld	a5,-24(s0)
    107c:	fef43023          	sd	a5,-32(s0)
    1080:	fe843783          	ld	a5,-24(s0)
    1084:	639c                	ld	a5,0(a5)
    1086:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    108a:	b791                	j	fce <malloc+0x76>
  }
}
    108c:	853e                	mv	a0,a5
    108e:	70e2                	ld	ra,56(sp)
    1090:	7442                	ld	s0,48(sp)
    1092:	6121                	addi	sp,sp,64
    1094:	8082                	ret

0000000000001096 <setjmp>:
    1096:	e100                	sd	s0,0(a0)
    1098:	e504                	sd	s1,8(a0)
    109a:	01253823          	sd	s2,16(a0)
    109e:	01353c23          	sd	s3,24(a0)
    10a2:	03453023          	sd	s4,32(a0)
    10a6:	03553423          	sd	s5,40(a0)
    10aa:	03653823          	sd	s6,48(a0)
    10ae:	03753c23          	sd	s7,56(a0)
    10b2:	05853023          	sd	s8,64(a0)
    10b6:	05953423          	sd	s9,72(a0)
    10ba:	05a53823          	sd	s10,80(a0)
    10be:	05b53c23          	sd	s11,88(a0)
    10c2:	06153023          	sd	ra,96(a0)
    10c6:	06253423          	sd	sp,104(a0)
    10ca:	4501                	li	a0,0
    10cc:	8082                	ret

00000000000010ce <longjmp>:
    10ce:	6100                	ld	s0,0(a0)
    10d0:	6504                	ld	s1,8(a0)
    10d2:	01053903          	ld	s2,16(a0)
    10d6:	01853983          	ld	s3,24(a0)
    10da:	02053a03          	ld	s4,32(a0)
    10de:	02853a83          	ld	s5,40(a0)
    10e2:	03053b03          	ld	s6,48(a0)
    10e6:	03853b83          	ld	s7,56(a0)
    10ea:	04053c03          	ld	s8,64(a0)
    10ee:	04853c83          	ld	s9,72(a0)
    10f2:	05053d03          	ld	s10,80(a0)
    10f6:	05853d83          	ld	s11,88(a0)
    10fa:	06053083          	ld	ra,96(a0)
    10fe:	06853103          	ld	sp,104(a0)
    1102:	c199                	beqz	a1,1108 <longjmp_1>
    1104:	852e                	mv	a0,a1
    1106:	8082                	ret

0000000000001108 <longjmp_1>:
    1108:	4505                	li	a0,1
    110a:	8082                	ret

000000000000110c <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
    110c:	7179                	addi	sp,sp,-48
    110e:	f422                	sd	s0,40(sp)
    1110:	1800                	addi	s0,sp,48
    1112:	fea43423          	sd	a0,-24(s0)
    1116:	feb43023          	sd	a1,-32(s0)
    111a:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
    111e:	fd843783          	ld	a5,-40(s0)
    1122:	fe843703          	ld	a4,-24(s0)
    1126:	e798                	sd	a4,8(a5)
     new_entry->next = next;
    1128:	fe843783          	ld	a5,-24(s0)
    112c:	fd843703          	ld	a4,-40(s0)
    1130:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
    1132:	fe843783          	ld	a5,-24(s0)
    1136:	fe043703          	ld	a4,-32(s0)
    113a:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
    113c:	fe043783          	ld	a5,-32(s0)
    1140:	fe843703          	ld	a4,-24(s0)
    1144:	e398                	sd	a4,0(a5)
 }
    1146:	0001                	nop
    1148:	7422                	ld	s0,40(sp)
    114a:	6145                	addi	sp,sp,48
    114c:	8082                	ret

000000000000114e <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
    114e:	1101                	addi	sp,sp,-32
    1150:	ec06                	sd	ra,24(sp)
    1152:	e822                	sd	s0,16(sp)
    1154:	1000                	addi	s0,sp,32
    1156:	fea43423          	sd	a0,-24(s0)
    115a:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
    115e:	fe043783          	ld	a5,-32(s0)
    1162:	679c                	ld	a5,8(a5)
    1164:	fe043603          	ld	a2,-32(s0)
    1168:	85be                	mv	a1,a5
    116a:	fe843503          	ld	a0,-24(s0)
    116e:	00000097          	auipc	ra,0x0
    1172:	f9e080e7          	jalr	-98(ra) # 110c <__list_add>
 }
    1176:	0001                	nop
    1178:	60e2                	ld	ra,24(sp)
    117a:	6442                	ld	s0,16(sp)
    117c:	6105                	addi	sp,sp,32
    117e:	8082                	ret

0000000000001180 <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
    1180:	1101                	addi	sp,sp,-32
    1182:	ec22                	sd	s0,24(sp)
    1184:	1000                	addi	s0,sp,32
    1186:	fea43423          	sd	a0,-24(s0)
    118a:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
    118e:	fe043783          	ld	a5,-32(s0)
    1192:	fe843703          	ld	a4,-24(s0)
    1196:	e798                	sd	a4,8(a5)
     prev->next = next;
    1198:	fe843783          	ld	a5,-24(s0)
    119c:	fe043703          	ld	a4,-32(s0)
    11a0:	e398                	sd	a4,0(a5)
 }
    11a2:	0001                	nop
    11a4:	6462                	ld	s0,24(sp)
    11a6:	6105                	addi	sp,sp,32
    11a8:	8082                	ret

00000000000011aa <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
    11aa:	1101                	addi	sp,sp,-32
    11ac:	ec06                	sd	ra,24(sp)
    11ae:	e822                	sd	s0,16(sp)
    11b0:	1000                	addi	s0,sp,32
    11b2:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
    11b6:	fe843783          	ld	a5,-24(s0)
    11ba:	6798                	ld	a4,8(a5)
    11bc:	fe843783          	ld	a5,-24(s0)
    11c0:	639c                	ld	a5,0(a5)
    11c2:	85be                	mv	a1,a5
    11c4:	853a                	mv	a0,a4
    11c6:	00000097          	auipc	ra,0x0
    11ca:	fba080e7          	jalr	-70(ra) # 1180 <__list_del>
     entry->next = LIST_POISON1;
    11ce:	fe843783          	ld	a5,-24(s0)
    11d2:	00100737          	lui	a4,0x100
    11d6:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd2e0>
    11da:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
    11dc:	fe843783          	ld	a5,-24(s0)
    11e0:	00200737          	lui	a4,0x200
    11e4:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd3e0>
    11e8:	e798                	sd	a4,8(a5)
 }
    11ea:	0001                	nop
    11ec:	60e2                	ld	ra,24(sp)
    11ee:	6442                	ld	s0,16(sp)
    11f0:	6105                	addi	sp,sp,32
    11f2:	8082                	ret

00000000000011f4 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
    11f4:	1101                	addi	sp,sp,-32
    11f6:	ec22                	sd	s0,24(sp)
    11f8:	1000                	addi	s0,sp,32
    11fa:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
    11fe:	fe843783          	ld	a5,-24(s0)
    1202:	639c                	ld	a5,0(a5)
    1204:	fe843703          	ld	a4,-24(s0)
    1208:	40f707b3          	sub	a5,a4,a5
    120c:	0017b793          	seqz	a5,a5
    1210:	0ff7f793          	andi	a5,a5,255
    1214:	2781                	sext.w	a5,a5
 }
    1216:	853e                	mv	a0,a5
    1218:	6462                	ld	s0,24(sp)
    121a:	6105                	addi	sp,sp,32
    121c:	8082                	ret

000000000000121e <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
    121e:	715d                	addi	sp,sp,-80
    1220:	e486                	sd	ra,72(sp)
    1222:	e0a2                	sd	s0,64(sp)
    1224:	0880                	addi	s0,sp,80
    1226:	fca43423          	sd	a0,-56(s0)
    122a:	fcb43023          	sd	a1,-64(s0)
    122e:	85b2                	mv	a1,a2
    1230:	8636                	mv	a2,a3
    1232:	86ba                	mv	a3,a4
    1234:	873e                	mv	a4,a5
    1236:	87ae                	mv	a5,a1
    1238:	faf42e23          	sw	a5,-68(s0)
    123c:	87b2                	mv	a5,a2
    123e:	faf42c23          	sw	a5,-72(s0)
    1242:	87b6                	mv	a5,a3
    1244:	faf42a23          	sw	a5,-76(s0)
    1248:	87ba                	mv	a5,a4
    124a:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
    124e:	08000513          	li	a0,128
    1252:	00000097          	auipc	ra,0x0
    1256:	d06080e7          	jalr	-762(ra) # f58 <malloc>
    125a:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
    125e:	6505                	lui	a0,0x1
    1260:	00000097          	auipc	ra,0x0
    1264:	cf8080e7          	jalr	-776(ra) # f58 <malloc>
    1268:	87aa                	mv	a5,a0
    126a:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
    126e:	fe043703          	ld	a4,-32(s0)
    1272:	6785                	lui	a5,0x1
    1274:	17c1                	addi	a5,a5,-16
    1276:	97ba                	add	a5,a5,a4
    1278:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
    127c:	fe843783          	ld	a5,-24(s0)
    1280:	fc843703          	ld	a4,-56(s0)
    1284:	e398                	sd	a4,0(a5)
    t->arg = arg;
    1286:	fe843783          	ld	a5,-24(s0)
    128a:	fc043703          	ld	a4,-64(s0)
    128e:	e798                	sd	a4,8(a5)
    t->ID = _id++;
    1290:	00001797          	auipc	a5,0x1
    1294:	3cc78793          	addi	a5,a5,972 # 265c <_id.1241>
    1298:	439c                	lw	a5,0(a5)
    129a:	0017871b          	addiw	a4,a5,1
    129e:	0007069b          	sext.w	a3,a4
    12a2:	00001717          	auipc	a4,0x1
    12a6:	3ba70713          	addi	a4,a4,954 # 265c <_id.1241>
    12aa:	c314                	sw	a3,0(a4)
    12ac:	fe843703          	ld	a4,-24(s0)
    12b0:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    12b2:	fe843783          	ld	a5,-24(s0)
    12b6:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    12ba:	fe043703          	ld	a4,-32(s0)
    12be:	fe843783          	ld	a5,-24(s0)
    12c2:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    12c4:	fd843703          	ld	a4,-40(s0)
    12c8:	fe843783          	ld	a5,-24(s0)
    12cc:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    12ce:	fe843783          	ld	a5,-24(s0)
    12d2:	fb842703          	lw	a4,-72(s0)
    12d6:	c3f8                	sw	a4,68(a5)
    t->period = period;
    12d8:	fe843783          	ld	a5,-24(s0)
    12dc:	fb442703          	lw	a4,-76(s0)
    12e0:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
    12e2:	fe843783          	ld	a5,-24(s0)
    12e6:	fb442703          	lw	a4,-76(s0)
    12ea:	c7b8                	sw	a4,72(a5)
    t->n = n;
    12ec:	fe843783          	ld	a5,-24(s0)
    12f0:	fb042703          	lw	a4,-80(s0)
    12f4:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    12f6:	fe843783          	ld	a5,-24(s0)
    12fa:	fbc42703          	lw	a4,-68(s0)
    12fe:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    1300:	fe843783          	ld	a5,-24(s0)
    1304:	fb842703          	lw	a4,-72(s0)
    1308:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    130a:	fe843783          	ld	a5,-24(s0)
    130e:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    1312:	fe843783          	ld	a5,-24(s0)
    1316:	06400713          	li	a4,100
    131a:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    131c:	fe843783          	ld	a5,-24(s0)
    1320:	671d                	lui	a4,0x7
    1322:	5307071b          	addiw	a4,a4,1328
    1326:	d3b8                	sw	a4,96(a5)
    
    return t;
    1328:	fe843783          	ld	a5,-24(s0)
}
    132c:	853e                	mv	a0,a5
    132e:	60a6                	ld	ra,72(sp)
    1330:	6406                	ld	s0,64(sp)
    1332:	6161                	addi	sp,sp,80
    1334:	8082                	ret

0000000000001336 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    1336:	1101                	addi	sp,sp,-32
    1338:	ec22                	sd	s0,24(sp)
    133a:	1000                	addi	s0,sp,32
    133c:	fea43423          	sd	a0,-24(s0)
    1340:	87ae                	mv	a5,a1
    1342:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    1346:	fe843783          	ld	a5,-24(s0)
    134a:	fe442703          	lw	a4,-28(s0)
    134e:	cff8                	sw	a4,92(a5)
}
    1350:	0001                	nop
    1352:	6462                	ld	s0,24(sp)
    1354:	6105                	addi	sp,sp,32
    1356:	8082                	ret

0000000000001358 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    1358:	1101                	addi	sp,sp,-32
    135a:	ec22                	sd	s0,24(sp)
    135c:	1000                	addi	s0,sp,32
    135e:	fea43423          	sd	a0,-24(s0)
    1362:	87ae                	mv	a5,a1
    1364:	8732                	mv	a4,a2
    1366:	fef42223          	sw	a5,-28(s0)
    136a:	87ba                	mv	a5,a4
    136c:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    1370:	fe843783          	ld	a5,-24(s0)
    1374:	fe442703          	lw	a4,-28(s0)
    1378:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    137a:	fe843783          	ld	a5,-24(s0)
    137e:	fe442703          	lw	a4,-28(s0)
    1382:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    1384:	fe843783          	ld	a5,-24(s0)
    1388:	fe042703          	lw	a4,-32(s0)
    138c:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    138e:	fe843783          	ld	a5,-24(s0)
    1392:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1396:	fe843783          	ld	a5,-24(s0)
    139a:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    139e:	fe843783          	ld	a5,-24(s0)
    13a2:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    13a6:	fe843783          	ld	a5,-24(s0)
    13aa:	0607ae23          	sw	zero,124(a5)
}
    13ae:	0001                	nop
    13b0:	6462                	ld	s0,24(sp)
    13b2:	6105                	addi	sp,sp,32
    13b4:	8082                	ret

00000000000013b6 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    13b6:	7179                	addi	sp,sp,-48
    13b8:	f406                	sd	ra,40(sp)
    13ba:	f022                	sd	s0,32(sp)
    13bc:	1800                	addi	s0,sp,48
    13be:	fca43c23          	sd	a0,-40(s0)
    13c2:	87ae                	mv	a5,a1
    13c4:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    13c8:	02000513          	li	a0,32
    13cc:	00000097          	auipc	ra,0x0
    13d0:	b8c080e7          	jalr	-1140(ra) # f58 <malloc>
    13d4:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    13d8:	fe843783          	ld	a5,-24(s0)
    13dc:	fd843703          	ld	a4,-40(s0)
    13e0:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    13e2:	fe843783          	ld	a5,-24(s0)
    13e6:	fd442703          	lw	a4,-44(s0)
    13ea:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    13ec:	fd843783          	ld	a5,-40(s0)
    13f0:	fd442703          	lw	a4,-44(s0)
    13f4:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    13f6:	fd843783          	ld	a5,-40(s0)
    13fa:	43bc                	lw	a5,64(a5)
    13fc:	cf81                	beqz	a5,1414 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    13fe:	fd843783          	ld	a5,-40(s0)
    1402:	47bc                	lw	a5,72(a5)
    1404:	fd442703          	lw	a4,-44(s0)
    1408:	9fb9                	addw	a5,a5,a4
    140a:	0007871b          	sext.w	a4,a5
    140e:	fd843783          	ld	a5,-40(s0)
    1412:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1414:	fe843783          	ld	a5,-24(s0)
    1418:	07a1                	addi	a5,a5,8
    141a:	00001597          	auipc	a1,0x1
    141e:	22e58593          	addi	a1,a1,558 # 2648 <release_queue>
    1422:	853e                	mv	a0,a5
    1424:	00000097          	auipc	ra,0x0
    1428:	d2a080e7          	jalr	-726(ra) # 114e <list_add_tail>
}
    142c:	0001                	nop
    142e:	70a2                	ld	ra,40(sp)
    1430:	7402                	ld	s0,32(sp)
    1432:	6145                	addi	sp,sp,48
    1434:	8082                	ret

0000000000001436 <__release>:

void __release()
{
    1436:	7139                	addi	sp,sp,-64
    1438:	fc06                	sd	ra,56(sp)
    143a:	f822                	sd	s0,48(sp)
    143c:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    143e:	00001797          	auipc	a5,0x1
    1442:	20a78793          	addi	a5,a5,522 # 2648 <release_queue>
    1446:	639c                	ld	a5,0(a5)
    1448:	fcf43c23          	sd	a5,-40(s0)
    144c:	fd843783          	ld	a5,-40(s0)
    1450:	17e1                	addi	a5,a5,-8
    1452:	fef43423          	sd	a5,-24(s0)
    1456:	fe843783          	ld	a5,-24(s0)
    145a:	679c                	ld	a5,8(a5)
    145c:	fcf43823          	sd	a5,-48(s0)
    1460:	fd043783          	ld	a5,-48(s0)
    1464:	17e1                	addi	a5,a5,-8
    1466:	fef43023          	sd	a5,-32(s0)
    146a:	a0e9                	j	1534 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    146c:	fe843783          	ld	a5,-24(s0)
    1470:	4f98                	lw	a4,24(a5)
    1472:	00001797          	auipc	a5,0x1
    1476:	22678793          	addi	a5,a5,550 # 2698 <threading_system_time>
    147a:	439c                	lw	a5,0(a5)
    147c:	08e7ce63          	blt	a5,a4,1518 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    1480:	fe843783          	ld	a5,-24(s0)
    1484:	639c                	ld	a5,0(a5)
    1486:	5bbc                	lw	a5,112(a5)
    1488:	c79d                	beqz	a5,14b6 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    148a:	fe843783          	ld	a5,-24(s0)
    148e:	639c                	ld	a5,0(a5)
    1490:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    1494:	fe843783          	ld	a5,-24(s0)
    1498:	6398                	ld	a4,0(a5)
    149a:	fe843783          	ld	a5,-24(s0)
    149e:	639c                	ld	a5,0(a5)
    14a0:	5378                	lw	a4,100(a4)
    14a2:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    14a4:	fe843783          	ld	a5,-24(s0)
    14a8:	6398                	ld	a4,0(a5)
    14aa:	fe843783          	ld	a5,-24(s0)
    14ae:	639c                	ld	a5,0(a5)
    14b0:	5f78                	lw	a4,124(a4)
    14b2:	cbf8                	sw	a4,84(a5)
    14b4:	a809                	j	14c6 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    14b6:	fe843783          	ld	a5,-24(s0)
    14ba:	6398                	ld	a4,0(a5)
    14bc:	fe843783          	ld	a5,-24(s0)
    14c0:	639c                	ld	a5,0(a5)
    14c2:	4378                	lw	a4,68(a4)
    14c4:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    14c6:	fe843783          	ld	a5,-24(s0)
    14ca:	4f94                	lw	a3,24(a5)
    14cc:	fe843783          	ld	a5,-24(s0)
    14d0:	639c                	ld	a5,0(a5)
    14d2:	47b8                	lw	a4,72(a5)
    14d4:	fe843783          	ld	a5,-24(s0)
    14d8:	639c                	ld	a5,0(a5)
    14da:	9f35                	addw	a4,a4,a3
    14dc:	2701                	sext.w	a4,a4
    14de:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    14e0:	fe843783          	ld	a5,-24(s0)
    14e4:	639c                	ld	a5,0(a5)
    14e6:	02878793          	addi	a5,a5,40
    14ea:	00001597          	auipc	a1,0x1
    14ee:	14e58593          	addi	a1,a1,334 # 2638 <run_queue>
    14f2:	853e                	mv	a0,a5
    14f4:	00000097          	auipc	ra,0x0
    14f8:	c5a080e7          	jalr	-934(ra) # 114e <list_add_tail>
            list_del(&cur->thread_list);
    14fc:	fe843783          	ld	a5,-24(s0)
    1500:	07a1                	addi	a5,a5,8
    1502:	853e                	mv	a0,a5
    1504:	00000097          	auipc	ra,0x0
    1508:	ca6080e7          	jalr	-858(ra) # 11aa <list_del>
            free(cur);
    150c:	fe843503          	ld	a0,-24(s0)
    1510:	00000097          	auipc	ra,0x0
    1514:	8a6080e7          	jalr	-1882(ra) # db6 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1518:	fe043783          	ld	a5,-32(s0)
    151c:	fef43423          	sd	a5,-24(s0)
    1520:	fe043783          	ld	a5,-32(s0)
    1524:	679c                	ld	a5,8(a5)
    1526:	fcf43423          	sd	a5,-56(s0)
    152a:	fc843783          	ld	a5,-56(s0)
    152e:	17e1                	addi	a5,a5,-8
    1530:	fef43023          	sd	a5,-32(s0)
    1534:	fe843783          	ld	a5,-24(s0)
    1538:	00878713          	addi	a4,a5,8
    153c:	00001797          	auipc	a5,0x1
    1540:	10c78793          	addi	a5,a5,268 # 2648 <release_queue>
    1544:	f2f714e3          	bne	a4,a5,146c <__release+0x36>
        }
    }
}
    1548:	0001                	nop
    154a:	0001                	nop
    154c:	70e2                	ld	ra,56(sp)
    154e:	7442                	ld	s0,48(sp)
    1550:	6121                	addi	sp,sp,64
    1552:	8082                	ret

0000000000001554 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    1554:	1101                	addi	sp,sp,-32
    1556:	ec06                	sd	ra,24(sp)
    1558:	e822                	sd	s0,16(sp)
    155a:	1000                	addi	s0,sp,32
    155c:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    1560:	fe843783          	ld	a5,-24(s0)
    1564:	7b98                	ld	a4,48(a5)
    1566:	00001797          	auipc	a5,0x1
    156a:	12a78793          	addi	a5,a5,298 # 2690 <current>
    156e:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    1570:	fe843783          	ld	a5,-24(s0)
    1574:	02878793          	addi	a5,a5,40
    1578:	853e                	mv	a0,a5
    157a:	00000097          	auipc	ra,0x0
    157e:	c30080e7          	jalr	-976(ra) # 11aa <list_del>

    free(to_remove->stack);
    1582:	fe843783          	ld	a5,-24(s0)
    1586:	6b9c                	ld	a5,16(a5)
    1588:	853e                	mv	a0,a5
    158a:	00000097          	auipc	ra,0x0
    158e:	82c080e7          	jalr	-2004(ra) # db6 <free>
    free(to_remove);
    1592:	fe843503          	ld	a0,-24(s0)
    1596:	00000097          	auipc	ra,0x0
    159a:	820080e7          	jalr	-2016(ra) # db6 <free>

    __schedule();
    159e:	00000097          	auipc	ra,0x0
    15a2:	5e8080e7          	jalr	1512(ra) # 1b86 <__schedule>
    __dispatch();
    15a6:	00000097          	auipc	ra,0x0
    15aa:	416080e7          	jalr	1046(ra) # 19bc <__dispatch>
    thrdresume(main_thrd_id);
    15ae:	00001797          	auipc	a5,0x1
    15b2:	0aa78793          	addi	a5,a5,170 # 2658 <main_thrd_id>
    15b6:	439c                	lw	a5,0(a5)
    15b8:	853e                	mv	a0,a5
    15ba:	fffff097          	auipc	ra,0xfffff
    15be:	30e080e7          	jalr	782(ra) # 8c8 <thrdresume>
}
    15c2:	0001                	nop
    15c4:	60e2                	ld	ra,24(sp)
    15c6:	6442                	ld	s0,16(sp)
    15c8:	6105                	addi	sp,sp,32
    15ca:	8082                	ret

00000000000015cc <thread_exit>:

void thread_exit(void)
{
    15cc:	7179                	addi	sp,sp,-48
    15ce:	f406                	sd	ra,40(sp)
    15d0:	f022                	sd	s0,32(sp)
    15d2:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    15d4:	00001797          	auipc	a5,0x1
    15d8:	0bc78793          	addi	a5,a5,188 # 2690 <current>
    15dc:	6398                	ld	a4,0(a5)
    15de:	00001797          	auipc	a5,0x1
    15e2:	05a78793          	addi	a5,a5,90 # 2638 <run_queue>
    15e6:	02f71063          	bne	a4,a5,1606 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    15ea:	00001597          	auipc	a1,0x1
    15ee:	dbe58593          	addi	a1,a1,-578 # 23a8 <schedule_edf_cbs+0x54c>
    15f2:	4509                	li	a0,2
    15f4:	fffff097          	auipc	ra,0xfffff
    15f8:	71a080e7          	jalr	1818(ra) # d0e <fprintf>
        exit(1);
    15fc:	4505                	li	a0,1
    15fe:	fffff097          	auipc	ra,0xfffff
    1602:	222080e7          	jalr	546(ra) # 820 <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    1606:	00001797          	auipc	a5,0x1
    160a:	08a78793          	addi	a5,a5,138 # 2690 <current>
    160e:	639c                	ld	a5,0(a5)
    1610:	fef43423          	sd	a5,-24(s0)
    1614:	fe843783          	ld	a5,-24(s0)
    1618:	fd878793          	addi	a5,a5,-40
    161c:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    1620:	fe043783          	ld	a5,-32(s0)
    1624:	5f9c                	lw	a5,56(a5)
    1626:	4585                	li	a1,1
    1628:	853e                	mv	a0,a5
    162a:	fffff097          	auipc	ra,0xfffff
    162e:	2a6080e7          	jalr	678(ra) # 8d0 <cancelthrdstop>
    1632:	87aa                	mv	a5,a0
    1634:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    1638:	00001797          	auipc	a5,0x1
    163c:	06078793          	addi	a5,a5,96 # 2698 <threading_system_time>
    1640:	439c                	lw	a5,0(a5)
    1642:	fdc42703          	lw	a4,-36(s0)
    1646:	9fb9                	addw	a5,a5,a4
    1648:	0007871b          	sext.w	a4,a5
    164c:	00001797          	auipc	a5,0x1
    1650:	04c78793          	addi	a5,a5,76 # 2698 <threading_system_time>
    1654:	c398                	sw	a4,0(a5)

    __release();
    1656:	00000097          	auipc	ra,0x0
    165a:	de0080e7          	jalr	-544(ra) # 1436 <__release>
    __thread_exit(to_remove);
    165e:	fe043503          	ld	a0,-32(s0)
    1662:	00000097          	auipc	ra,0x0
    1666:	ef2080e7          	jalr	-270(ra) # 1554 <__thread_exit>
}
    166a:	0001                	nop
    166c:	70a2                	ld	ra,40(sp)
    166e:	7402                	ld	s0,32(sp)
    1670:	6145                	addi	sp,sp,48
    1672:	8082                	ret

0000000000001674 <__finish_current>:

void __finish_current()
{
    1674:	7179                	addi	sp,sp,-48
    1676:	f406                	sd	ra,40(sp)
    1678:	f022                	sd	s0,32(sp)
    167a:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    167c:	00001797          	auipc	a5,0x1
    1680:	01478793          	addi	a5,a5,20 # 2690 <current>
    1684:	639c                	ld	a5,0(a5)
    1686:	fef43423          	sd	a5,-24(s0)
    168a:	fe843783          	ld	a5,-24(s0)
    168e:	fd878793          	addi	a5,a5,-40
    1692:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1696:	fe043783          	ld	a5,-32(s0)
    169a:	4bbc                	lw	a5,80(a5)
    169c:	37fd                	addiw	a5,a5,-1
    169e:	0007871b          	sext.w	a4,a5
    16a2:	fe043783          	ld	a5,-32(s0)
    16a6:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    16a8:	fe043783          	ld	a5,-32(s0)
    16ac:	5fd8                	lw	a4,60(a5)
    16ae:	00001797          	auipc	a5,0x1
    16b2:	fea78793          	addi	a5,a5,-22 # 2698 <threading_system_time>
    16b6:	4390                	lw	a2,0(a5)
    16b8:	fe043783          	ld	a5,-32(s0)
    16bc:	4bbc                	lw	a5,80(a5)
    16be:	86be                	mv	a3,a5
    16c0:	85ba                	mv	a1,a4
    16c2:	00001517          	auipc	a0,0x1
    16c6:	d1e50513          	addi	a0,a0,-738 # 23e0 <schedule_edf_cbs+0x584>
    16ca:	fffff097          	auipc	ra,0xfffff
    16ce:	69c080e7          	jalr	1692(ra) # d66 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    16d2:	fe043783          	ld	a5,-32(s0)
    16d6:	4bbc                	lw	a5,80(a5)
    16d8:	04f05563          	blez	a5,1722 <__finish_current+0xae>
        struct list_head *to_remove = current;
    16dc:	00001797          	auipc	a5,0x1
    16e0:	fb478793          	addi	a5,a5,-76 # 2690 <current>
    16e4:	639c                	ld	a5,0(a5)
    16e6:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    16ea:	00001797          	auipc	a5,0x1
    16ee:	fa678793          	addi	a5,a5,-90 # 2690 <current>
    16f2:	639c                	ld	a5,0(a5)
    16f4:	6798                	ld	a4,8(a5)
    16f6:	00001797          	auipc	a5,0x1
    16fa:	f9a78793          	addi	a5,a5,-102 # 2690 <current>
    16fe:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1700:	fd843503          	ld	a0,-40(s0)
    1704:	00000097          	auipc	ra,0x0
    1708:	aa6080e7          	jalr	-1370(ra) # 11aa <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    170c:	fe043783          	ld	a5,-32(s0)
    1710:	4fbc                	lw	a5,88(a5)
    1712:	85be                	mv	a1,a5
    1714:	fe043503          	ld	a0,-32(s0)
    1718:	00000097          	auipc	ra,0x0
    171c:	c9e080e7          	jalr	-866(ra) # 13b6 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    1720:	a039                	j	172e <__finish_current+0xba>
        __thread_exit(current_thread);
    1722:	fe043503          	ld	a0,-32(s0)
    1726:	00000097          	auipc	ra,0x0
    172a:	e2e080e7          	jalr	-466(ra) # 1554 <__thread_exit>
}
    172e:	0001                	nop
    1730:	70a2                	ld	ra,40(sp)
    1732:	7402                	ld	s0,32(sp)
    1734:	6145                	addi	sp,sp,48
    1736:	8082                	ret

0000000000001738 <__rt_finish_current>:
void __rt_finish_current()
{
    1738:	7179                	addi	sp,sp,-48
    173a:	f406                	sd	ra,40(sp)
    173c:	f022                	sd	s0,32(sp)
    173e:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1740:	00001797          	auipc	a5,0x1
    1744:	f5078793          	addi	a5,a5,-176 # 2690 <current>
    1748:	639c                	ld	a5,0(a5)
    174a:	fef43423          	sd	a5,-24(s0)
    174e:	fe843783          	ld	a5,-24(s0)
    1752:	fd878793          	addi	a5,a5,-40
    1756:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    175a:	fe043783          	ld	a5,-32(s0)
    175e:	4bbc                	lw	a5,80(a5)
    1760:	37fd                	addiw	a5,a5,-1
    1762:	0007871b          	sext.w	a4,a5
    1766:	fe043783          	ld	a5,-32(s0)
    176a:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    176c:	fe043783          	ld	a5,-32(s0)
    1770:	5fd8                	lw	a4,60(a5)
    1772:	00001797          	auipc	a5,0x1
    1776:	f2678793          	addi	a5,a5,-218 # 2698 <threading_system_time>
    177a:	4390                	lw	a2,0(a5)
    177c:	fe043783          	ld	a5,-32(s0)
    1780:	4bbc                	lw	a5,80(a5)
    1782:	86be                	mv	a3,a5
    1784:	85ba                	mv	a1,a4
    1786:	00001517          	auipc	a0,0x1
    178a:	c7250513          	addi	a0,a0,-910 # 23f8 <schedule_edf_cbs+0x59c>
    178e:	fffff097          	auipc	ra,0xfffff
    1792:	5d8080e7          	jalr	1496(ra) # d66 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1796:	fe043783          	ld	a5,-32(s0)
    179a:	4bbc                	lw	a5,80(a5)
    179c:	04f05f63          	blez	a5,17fa <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    17a0:	00001797          	auipc	a5,0x1
    17a4:	ef078793          	addi	a5,a5,-272 # 2690 <current>
    17a8:	639c                	ld	a5,0(a5)
    17aa:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    17ae:	00001797          	auipc	a5,0x1
    17b2:	ee278793          	addi	a5,a5,-286 # 2690 <current>
    17b6:	639c                	ld	a5,0(a5)
    17b8:	6798                	ld	a4,8(a5)
    17ba:	00001797          	auipc	a5,0x1
    17be:	ed678793          	addi	a5,a5,-298 # 2690 <current>
    17c2:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    17c4:	fd843503          	ld	a0,-40(s0)
    17c8:	00000097          	auipc	ra,0x0
    17cc:	9e2080e7          	jalr	-1566(ra) # 11aa <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    17d0:	fe043783          	ld	a5,-32(s0)
    17d4:	4fbc                	lw	a5,88(a5)
    17d6:	85be                	mv	a1,a5
    17d8:	fe043503          	ld	a0,-32(s0)
    17dc:	00000097          	auipc	ra,0x0
    17e0:	bda080e7          	jalr	-1062(ra) # 13b6 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    17e4:	fe043783          	ld	a5,-32(s0)
    17e8:	57fc                	lw	a5,108(a5)
    17ea:	ef91                	bnez	a5,1806 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    17ec:	fe043783          	ld	a5,-32(s0)
    17f0:	53f8                	lw	a4,100(a5)
    17f2:	fe043783          	ld	a5,-32(s0)
    17f6:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    17f8:	a039                	j	1806 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    17fa:	fe043503          	ld	a0,-32(s0)
    17fe:	00000097          	auipc	ra,0x0
    1802:	d56080e7          	jalr	-682(ra) # 1554 <__thread_exit>
}
    1806:	0001                	nop
    1808:	70a2                	ld	ra,40(sp)
    180a:	7402                	ld	s0,32(sp)
    180c:	6145                	addi	sp,sp,48
    180e:	8082                	ret

0000000000001810 <switch_handler>:

void switch_handler(void *arg)
{
    1810:	7139                	addi	sp,sp,-64
    1812:	fc06                	sd	ra,56(sp)
    1814:	f822                	sd	s0,48(sp)
    1816:	0080                	addi	s0,sp,64
    1818:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    181c:	fc843783          	ld	a5,-56(s0)
    1820:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1824:	00001797          	auipc	a5,0x1
    1828:	e6c78793          	addi	a5,a5,-404 # 2690 <current>
    182c:	639c                	ld	a5,0(a5)
    182e:	fef43023          	sd	a5,-32(s0)
    1832:	fe043783          	ld	a5,-32(s0)
    1836:	fd878793          	addi	a5,a5,-40
    183a:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    183e:	fe843783          	ld	a5,-24(s0)
    1842:	0007871b          	sext.w	a4,a5
    1846:	00001797          	auipc	a5,0x1
    184a:	e5278793          	addi	a5,a5,-430 # 2698 <threading_system_time>
    184e:	439c                	lw	a5,0(a5)
    1850:	2781                	sext.w	a5,a5
    1852:	9fb9                	addw	a5,a5,a4
    1854:	2781                	sext.w	a5,a5
    1856:	0007871b          	sext.w	a4,a5
    185a:	00001797          	auipc	a5,0x1
    185e:	e3e78793          	addi	a5,a5,-450 # 2698 <threading_system_time>
    1862:	c398                	sw	a4,0(a5)
     __release();
    1864:	00000097          	auipc	ra,0x0
    1868:	bd2080e7          	jalr	-1070(ra) # 1436 <__release>
    current_thread->remaining_time -= elapsed_time;
    186c:	fd843783          	ld	a5,-40(s0)
    1870:	4bfc                	lw	a5,84(a5)
    1872:	0007871b          	sext.w	a4,a5
    1876:	fe843783          	ld	a5,-24(s0)
    187a:	2781                	sext.w	a5,a5
    187c:	40f707bb          	subw	a5,a4,a5
    1880:	2781                	sext.w	a5,a5
    1882:	0007871b          	sext.w	a4,a5
    1886:	fd843783          	ld	a5,-40(s0)
    188a:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    188c:	fd843783          	ld	a5,-40(s0)
    1890:	57fc                	lw	a5,108(a5)
    1892:	e38d                	bnez	a5,18b4 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    1894:	fd843783          	ld	a5,-40(s0)
    1898:	57bc                	lw	a5,104(a5)
    189a:	0007871b          	sext.w	a4,a5
    189e:	fe843783          	ld	a5,-24(s0)
    18a2:	2781                	sext.w	a5,a5
    18a4:	40f707bb          	subw	a5,a4,a5
    18a8:	2781                	sext.w	a5,a5
    18aa:	0007871b          	sext.w	a4,a5
    18ae:	fd843783          	ld	a5,-40(s0)
    18b2:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    18b4:	fd843783          	ld	a5,-40(s0)
    18b8:	43bc                	lw	a5,64(a5)
    18ba:	c3ad                	beqz	a5,191c <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    18bc:	fd843783          	ld	a5,-40(s0)
    18c0:	4fb8                	lw	a4,88(a5)
    18c2:	00001797          	auipc	a5,0x1
    18c6:	dd678793          	addi	a5,a5,-554 # 2698 <threading_system_time>
    18ca:	439c                	lw	a5,0(a5)
    18cc:	02f74163          	blt	a4,a5,18ee <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    18d0:	fd843783          	ld	a5,-40(s0)
    18d4:	4fb8                	lw	a4,88(a5)
    18d6:	00001797          	auipc	a5,0x1
    18da:	dc278793          	addi	a5,a5,-574 # 2698 <threading_system_time>
    18de:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    18e0:	02f71e63          	bne	a4,a5,191c <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    18e4:	fd843783          	ld	a5,-40(s0)
    18e8:	4bfc                	lw	a5,84(a5)
    18ea:	02f05963          	blez	a5,191c <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    18ee:	fd843783          	ld	a5,-40(s0)
    18f2:	5fd8                	lw	a4,60(a5)
    18f4:	00001797          	auipc	a5,0x1
    18f8:	da478793          	addi	a5,a5,-604 # 2698 <threading_system_time>
    18fc:	439c                	lw	a5,0(a5)
    18fe:	863e                	mv	a2,a5
    1900:	85ba                	mv	a1,a4
    1902:	00001517          	auipc	a0,0x1
    1906:	b2e50513          	addi	a0,a0,-1234 # 2430 <schedule_edf_cbs+0x5d4>
    190a:	fffff097          	auipc	ra,0xfffff
    190e:	45c080e7          	jalr	1116(ra) # d66 <printf>
            exit(0);
    1912:	4501                	li	a0,0
    1914:	fffff097          	auipc	ra,0xfffff
    1918:	f0c080e7          	jalr	-244(ra) # 820 <exit>
        }

    if (current_thread->remaining_time <= 0) {
    191c:	fd843783          	ld	a5,-40(s0)
    1920:	4bfc                	lw	a5,84(a5)
    1922:	02f04063          	bgtz	a5,1942 <switch_handler+0x132>
        if (current_thread->is_real_time)
    1926:	fd843783          	ld	a5,-40(s0)
    192a:	43bc                	lw	a5,64(a5)
    192c:	c791                	beqz	a5,1938 <switch_handler+0x128>
            __rt_finish_current();
    192e:	00000097          	auipc	ra,0x0
    1932:	e0a080e7          	jalr	-502(ra) # 1738 <__rt_finish_current>
    1936:	a881                	j	1986 <switch_handler+0x176>
        else
            __finish_current();
    1938:	00000097          	auipc	ra,0x0
    193c:	d3c080e7          	jalr	-708(ra) # 1674 <__finish_current>
    1940:	a099                	j	1986 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    1942:	00001797          	auipc	a5,0x1
    1946:	d4e78793          	addi	a5,a5,-690 # 2690 <current>
    194a:	639c                	ld	a5,0(a5)
    194c:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    1950:	00001797          	auipc	a5,0x1
    1954:	d4078793          	addi	a5,a5,-704 # 2690 <current>
    1958:	639c                	ld	a5,0(a5)
    195a:	6798                	ld	a4,8(a5)
    195c:	00001797          	auipc	a5,0x1
    1960:	d3478793          	addi	a5,a5,-716 # 2690 <current>
    1964:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1966:	fd043503          	ld	a0,-48(s0)
    196a:	00000097          	auipc	ra,0x0
    196e:	840080e7          	jalr	-1984(ra) # 11aa <list_del>
        list_add_tail(to_remove, &run_queue);
    1972:	00001597          	auipc	a1,0x1
    1976:	cc658593          	addi	a1,a1,-826 # 2638 <run_queue>
    197a:	fd043503          	ld	a0,-48(s0)
    197e:	fffff097          	auipc	ra,0xfffff
    1982:	7d0080e7          	jalr	2000(ra) # 114e <list_add_tail>
    }

    __release();
    1986:	00000097          	auipc	ra,0x0
    198a:	ab0080e7          	jalr	-1360(ra) # 1436 <__release>
    __schedule();
    198e:	00000097          	auipc	ra,0x0
    1992:	1f8080e7          	jalr	504(ra) # 1b86 <__schedule>
    __dispatch();
    1996:	00000097          	auipc	ra,0x0
    199a:	026080e7          	jalr	38(ra) # 19bc <__dispatch>
    thrdresume(main_thrd_id);
    199e:	00001797          	auipc	a5,0x1
    19a2:	cba78793          	addi	a5,a5,-838 # 2658 <main_thrd_id>
    19a6:	439c                	lw	a5,0(a5)
    19a8:	853e                	mv	a0,a5
    19aa:	fffff097          	auipc	ra,0xfffff
    19ae:	f1e080e7          	jalr	-226(ra) # 8c8 <thrdresume>
}
    19b2:	0001                	nop
    19b4:	70e2                	ld	ra,56(sp)
    19b6:	7442                	ld	s0,48(sp)
    19b8:	6121                	addi	sp,sp,64
    19ba:	8082                	ret

00000000000019bc <__dispatch>:

void __dispatch()
{
    19bc:	7179                	addi	sp,sp,-48
    19be:	f406                	sd	ra,40(sp)
    19c0:	f022                	sd	s0,32(sp)
    19c2:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    19c4:	00001797          	auipc	a5,0x1
    19c8:	ccc78793          	addi	a5,a5,-820 # 2690 <current>
    19cc:	6398                	ld	a4,0(a5)
    19ce:	00001797          	auipc	a5,0x1
    19d2:	c6a78793          	addi	a5,a5,-918 # 2638 <run_queue>
    19d6:	1af70363          	beq	a4,a5,1b7c <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    19da:	00001797          	auipc	a5,0x1
    19de:	cb678793          	addi	a5,a5,-842 # 2690 <current>
    19e2:	639c                	ld	a5,0(a5)
    19e4:	fef43423          	sd	a5,-24(s0)
    19e8:	fe843783          	ld	a5,-24(s0)
    19ec:	fd878793          	addi	a5,a5,-40
    19f0:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    19f4:	fe043783          	ld	a5,-32(s0)
    19f8:	5fcc                	lw	a1,60(a5)
    19fa:	00001797          	auipc	a5,0x1
    19fe:	c9e78793          	addi	a5,a5,-866 # 2698 <threading_system_time>
    1a02:	4390                	lw	a2,0(a5)
    1a04:	00001797          	auipc	a5,0x1
    1a08:	c9c78793          	addi	a5,a5,-868 # 26a0 <allocated_time>
    1a0c:	6394                	ld	a3,0(a5)
    1a0e:	fe043783          	ld	a5,-32(s0)
    1a12:	4bfc                	lw	a5,84(a5)
    1a14:	873e                	mv	a4,a5
    1a16:	00001517          	auipc	a0,0x1
    1a1a:	a4a50513          	addi	a0,a0,-1462 # 2460 <schedule_edf_cbs+0x604>
    1a1e:	fffff097          	auipc	ra,0xfffff
    1a22:	348080e7          	jalr	840(ra) # d66 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    1a26:	fe043783          	ld	a5,-32(s0)
    1a2a:	43bc                	lw	a5,64(a5)
    1a2c:	c3a1                	beqz	a5,1a6c <__dispatch+0xb0>
    1a2e:	00001797          	auipc	a5,0x1
    1a32:	c7278793          	addi	a5,a5,-910 # 26a0 <allocated_time>
    1a36:	639c                	ld	a5,0(a5)
    1a38:	eb95                	bnez	a5,1a6c <__dispatch+0xb0>
    1a3a:	fe043783          	ld	a5,-32(s0)
    1a3e:	57fc                	lw	a5,108(a5)
    1a40:	c795                	beqz	a5,1a6c <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    1a42:	fe043783          	ld	a5,-32(s0)
    1a46:	5fd8                	lw	a4,60(a5)
    1a48:	fe043783          	ld	a5,-32(s0)
    1a4c:	4fbc                	lw	a5,88(a5)
    1a4e:	863e                	mv	a2,a5
    1a50:	85ba                	mv	a1,a4
    1a52:	00001517          	auipc	a0,0x1
    1a56:	a5e50513          	addi	a0,a0,-1442 # 24b0 <schedule_edf_cbs+0x654>
    1a5a:	fffff097          	auipc	ra,0xfffff
    1a5e:	30c080e7          	jalr	780(ra) # d66 <printf>
        exit(0);
    1a62:	4501                	li	a0,0
    1a64:	fffff097          	auipc	ra,0xfffff
    1a68:	dbc080e7          	jalr	-580(ra) # 820 <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    1a6c:	fe043783          	ld	a5,-32(s0)
    1a70:	5fd8                	lw	a4,60(a5)
    1a72:	00001797          	auipc	a5,0x1
    1a76:	c2678793          	addi	a5,a5,-986 # 2698 <threading_system_time>
    1a7a:	4390                	lw	a2,0(a5)
    1a7c:	00001797          	auipc	a5,0x1
    1a80:	c2478793          	addi	a5,a5,-988 # 26a0 <allocated_time>
    1a84:	639c                	ld	a5,0(a5)
    1a86:	86be                	mv	a3,a5
    1a88:	85ba                	mv	a1,a4
    1a8a:	00001517          	auipc	a0,0x1
    1a8e:	a5650513          	addi	a0,a0,-1450 # 24e0 <schedule_edf_cbs+0x684>
    1a92:	fffff097          	auipc	ra,0xfffff
    1a96:	2d4080e7          	jalr	724(ra) # d66 <printf>

    if (current_thread->buf_set) {
    1a9a:	fe043783          	ld	a5,-32(s0)
    1a9e:	539c                	lw	a5,32(a5)
    1aa0:	c7a1                	beqz	a5,1ae8 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1aa2:	00001797          	auipc	a5,0x1
    1aa6:	bfe78793          	addi	a5,a5,-1026 # 26a0 <allocated_time>
    1aaa:	639c                	ld	a5,0(a5)
    1aac:	0007871b          	sext.w	a4,a5
    1ab0:	fe043783          	ld	a5,-32(s0)
    1ab4:	03878593          	addi	a1,a5,56
    1ab8:	00001797          	auipc	a5,0x1
    1abc:	be878793          	addi	a5,a5,-1048 # 26a0 <allocated_time>
    1ac0:	639c                	ld	a5,0(a5)
    1ac2:	86be                	mv	a3,a5
    1ac4:	00000617          	auipc	a2,0x0
    1ac8:	d4c60613          	addi	a2,a2,-692 # 1810 <switch_handler>
    1acc:	853a                	mv	a0,a4
    1ace:	fffff097          	auipc	ra,0xfffff
    1ad2:	df2080e7          	jalr	-526(ra) # 8c0 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    1ad6:	fe043783          	ld	a5,-32(s0)
    1ada:	5f9c                	lw	a5,56(a5)
    1adc:	853e                	mv	a0,a5
    1ade:	fffff097          	auipc	ra,0xfffff
    1ae2:	dea080e7          	jalr	-534(ra) # 8c8 <thrdresume>
    1ae6:	a071                	j	1b72 <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    1ae8:	fe043783          	ld	a5,-32(s0)
    1aec:	4705                	li	a4,1
    1aee:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    1af0:	fe043783          	ld	a5,-32(s0)
    1af4:	6f9c                	ld	a5,24(a5)
    1af6:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1afa:	fe043783          	ld	a5,-32(s0)
    1afe:	577d                	li	a4,-1
    1b00:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1b02:	00001797          	auipc	a5,0x1
    1b06:	b9e78793          	addi	a5,a5,-1122 # 26a0 <allocated_time>
    1b0a:	639c                	ld	a5,0(a5)
    1b0c:	0007871b          	sext.w	a4,a5
    1b10:	fe043783          	ld	a5,-32(s0)
    1b14:	03878593          	addi	a1,a5,56
    1b18:	00001797          	auipc	a5,0x1
    1b1c:	b8878793          	addi	a5,a5,-1144 # 26a0 <allocated_time>
    1b20:	639c                	ld	a5,0(a5)
    1b22:	86be                	mv	a3,a5
    1b24:	00000617          	auipc	a2,0x0
    1b28:	cec60613          	addi	a2,a2,-788 # 1810 <switch_handler>
    1b2c:	853a                	mv	a0,a4
    1b2e:	fffff097          	auipc	ra,0xfffff
    1b32:	d92080e7          	jalr	-622(ra) # 8c0 <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    1b36:	fe043783          	ld	a5,-32(s0)
    1b3a:	5f9c                	lw	a5,56(a5)
    1b3c:	0207d063          	bgez	a5,1b5c <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    1b40:	00001597          	auipc	a1,0x1
    1b44:	9d058593          	addi	a1,a1,-1584 # 2510 <schedule_edf_cbs+0x6b4>
    1b48:	4509                	li	a0,2
    1b4a:	fffff097          	auipc	ra,0xfffff
    1b4e:	1c4080e7          	jalr	452(ra) # d0e <fprintf>
            exit(1);
    1b52:	4505                	li	a0,1
    1b54:	fffff097          	auipc	ra,0xfffff
    1b58:	ccc080e7          	jalr	-820(ra) # 820 <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    1b5c:	fd843783          	ld	a5,-40(s0)
    1b60:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    1b62:	fe043783          	ld	a5,-32(s0)
    1b66:	6398                	ld	a4,0(a5)
    1b68:	fe043783          	ld	a5,-32(s0)
    1b6c:	679c                	ld	a5,8(a5)
    1b6e:	853e                	mv	a0,a5
    1b70:	9702                	jalr	a4
    }
    thread_exit();
    1b72:	00000097          	auipc	ra,0x0
    1b76:	a5a080e7          	jalr	-1446(ra) # 15cc <thread_exit>
    1b7a:	a011                	j	1b7e <__dispatch+0x1c2>
        return;
    1b7c:	0001                	nop
}
    1b7e:	70a2                	ld	ra,40(sp)
    1b80:	7402                	ld	s0,32(sp)
    1b82:	6145                	addi	sp,sp,48
    1b84:	8082                	ret

0000000000001b86 <__schedule>:

void __schedule()
{
    1b86:	711d                	addi	sp,sp,-96
    1b88:	ec86                	sd	ra,88(sp)
    1b8a:	e8a2                	sd	s0,80(sp)
    1b8c:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    1b8e:	00001797          	auipc	a5,0x1
    1b92:	b0a78793          	addi	a5,a5,-1270 # 2698 <threading_system_time>
    1b96:	439c                	lw	a5,0(a5)
    1b98:	fcf42c23          	sw	a5,-40(s0)
    1b9c:	4789                	li	a5,2
    1b9e:	fcf42e23          	sw	a5,-36(s0)
    1ba2:	00001797          	auipc	a5,0x1
    1ba6:	a9678793          	addi	a5,a5,-1386 # 2638 <run_queue>
    1baa:	fef43023          	sd	a5,-32(s0)
    1bae:	00001797          	auipc	a5,0x1
    1bb2:	a9a78793          	addi	a5,a5,-1382 # 2648 <release_queue>
    1bb6:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    1bba:	fd843783          	ld	a5,-40(s0)
    1bbe:	faf43023          	sd	a5,-96(s0)
    1bc2:	fe043783          	ld	a5,-32(s0)
    1bc6:	faf43423          	sd	a5,-88(s0)
    1bca:	fe843783          	ld	a5,-24(s0)
    1bce:	faf43823          	sd	a5,-80(s0)
    1bd2:	fa040793          	addi	a5,s0,-96
    1bd6:	853e                	mv	a0,a5
    1bd8:	00000097          	auipc	ra,0x0
    1bdc:	284080e7          	jalr	644(ra) # 1e5c <schedule_edf_cbs>
    1be0:	872a                	mv	a4,a0
    1be2:	87ae                	mv	a5,a1
    1be4:	fce43423          	sd	a4,-56(s0)
    1be8:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    1bec:	fc843703          	ld	a4,-56(s0)
    1bf0:	00001797          	auipc	a5,0x1
    1bf4:	aa078793          	addi	a5,a5,-1376 # 2690 <current>
    1bf8:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1bfa:	fd042783          	lw	a5,-48(s0)
    1bfe:	873e                	mv	a4,a5
    1c00:	00001797          	auipc	a5,0x1
    1c04:	aa078793          	addi	a5,a5,-1376 # 26a0 <allocated_time>
    1c08:	e398                	sd	a4,0(a5)
}
    1c0a:	0001                	nop
    1c0c:	60e6                	ld	ra,88(sp)
    1c0e:	6446                	ld	s0,80(sp)
    1c10:	6125                	addi	sp,sp,96
    1c12:	8082                	ret

0000000000001c14 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    1c14:	1101                	addi	sp,sp,-32
    1c16:	ec06                	sd	ra,24(sp)
    1c18:	e822                	sd	s0,16(sp)
    1c1a:	1000                	addi	s0,sp,32
    1c1c:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1c20:	00001797          	auipc	a5,0x1
    1c24:	a7c78793          	addi	a5,a5,-1412 # 269c <sleeping>
    1c28:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1c2c:	fe843783          	ld	a5,-24(s0)
    1c30:	0007871b          	sext.w	a4,a5
    1c34:	00001797          	auipc	a5,0x1
    1c38:	a6478793          	addi	a5,a5,-1436 # 2698 <threading_system_time>
    1c3c:	439c                	lw	a5,0(a5)
    1c3e:	2781                	sext.w	a5,a5
    1c40:	9fb9                	addw	a5,a5,a4
    1c42:	2781                	sext.w	a5,a5
    1c44:	0007871b          	sext.w	a4,a5
    1c48:	00001797          	auipc	a5,0x1
    1c4c:	a5078793          	addi	a5,a5,-1456 # 2698 <threading_system_time>
    1c50:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    1c52:	00001797          	auipc	a5,0x1
    1c56:	a0678793          	addi	a5,a5,-1530 # 2658 <main_thrd_id>
    1c5a:	439c                	lw	a5,0(a5)
    1c5c:	853e                	mv	a0,a5
    1c5e:	fffff097          	auipc	ra,0xfffff
    1c62:	c6a080e7          	jalr	-918(ra) # 8c8 <thrdresume>
}
    1c66:	0001                	nop
    1c68:	60e2                	ld	ra,24(sp)
    1c6a:	6442                	ld	s0,16(sp)
    1c6c:	6105                	addi	sp,sp,32
    1c6e:	8082                	ret

0000000000001c70 <thread_start_threading>:

void thread_start_threading()
{
    1c70:	1141                	addi	sp,sp,-16
    1c72:	e406                	sd	ra,8(sp)
    1c74:	e022                	sd	s0,0(sp)
    1c76:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1c78:	00001797          	auipc	a5,0x1
    1c7c:	a2078793          	addi	a5,a5,-1504 # 2698 <threading_system_time>
    1c80:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    1c84:	00001797          	auipc	a5,0x1
    1c88:	a0c78793          	addi	a5,a5,-1524 # 2690 <current>
    1c8c:	00001717          	auipc	a4,0x1
    1c90:	9ac70713          	addi	a4,a4,-1620 # 2638 <run_queue>
    1c94:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1c96:	4681                	li	a3,0
    1c98:	00000617          	auipc	a2,0x0
    1c9c:	f7c60613          	addi	a2,a2,-132 # 1c14 <back_to_main_handler>
    1ca0:	00001597          	auipc	a1,0x1
    1ca4:	9b858593          	addi	a1,a1,-1608 # 2658 <main_thrd_id>
    1ca8:	3e800513          	li	a0,1000
    1cac:	fffff097          	auipc	ra,0xfffff
    1cb0:	c14080e7          	jalr	-1004(ra) # 8c0 <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    1cb4:	00001797          	auipc	a5,0x1
    1cb8:	9a478793          	addi	a5,a5,-1628 # 2658 <main_thrd_id>
    1cbc:	439c                	lw	a5,0(a5)
    1cbe:	4581                	li	a1,0
    1cc0:	853e                	mv	a0,a5
    1cc2:	fffff097          	auipc	ra,0xfffff
    1cc6:	c0e080e7          	jalr	-1010(ra) # 8d0 <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1cca:	a0c9                	j	1d8c <thread_start_threading+0x11c>
        __release();
    1ccc:	fffff097          	auipc	ra,0xfffff
    1cd0:	76a080e7          	jalr	1898(ra) # 1436 <__release>
        __schedule();
    1cd4:	00000097          	auipc	ra,0x0
    1cd8:	eb2080e7          	jalr	-334(ra) # 1b86 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1cdc:	00001797          	auipc	a5,0x1
    1ce0:	97c78793          	addi	a5,a5,-1668 # 2658 <main_thrd_id>
    1ce4:	439c                	lw	a5,0(a5)
    1ce6:	4581                	li	a1,0
    1ce8:	853e                	mv	a0,a5
    1cea:	fffff097          	auipc	ra,0xfffff
    1cee:	be6080e7          	jalr	-1050(ra) # 8d0 <cancelthrdstop>
        __dispatch();
    1cf2:	00000097          	auipc	ra,0x0
    1cf6:	cca080e7          	jalr	-822(ra) # 19bc <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1cfa:	00001517          	auipc	a0,0x1
    1cfe:	93e50513          	addi	a0,a0,-1730 # 2638 <run_queue>
    1d02:	fffff097          	auipc	ra,0xfffff
    1d06:	4f2080e7          	jalr	1266(ra) # 11f4 <list_empty>
    1d0a:	87aa                	mv	a5,a0
    1d0c:	cb99                	beqz	a5,1d22 <thread_start_threading+0xb2>
    1d0e:	00001517          	auipc	a0,0x1
    1d12:	93a50513          	addi	a0,a0,-1734 # 2648 <release_queue>
    1d16:	fffff097          	auipc	ra,0xfffff
    1d1a:	4de080e7          	jalr	1246(ra) # 11f4 <list_empty>
    1d1e:	87aa                	mv	a5,a0
    1d20:	ebd9                	bnez	a5,1db6 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1d22:	00001797          	auipc	a5,0x1
    1d26:	97e78793          	addi	a5,a5,-1666 # 26a0 <allocated_time>
    1d2a:	639c                	ld	a5,0(a5)
    1d2c:	85be                	mv	a1,a5
    1d2e:	00001517          	auipc	a0,0x1
    1d32:	81a50513          	addi	a0,a0,-2022 # 2548 <schedule_edf_cbs+0x6ec>
    1d36:	fffff097          	auipc	ra,0xfffff
    1d3a:	030080e7          	jalr	48(ra) # d66 <printf>
        sleeping = 1;
    1d3e:	00001797          	auipc	a5,0x1
    1d42:	95e78793          	addi	a5,a5,-1698 # 269c <sleeping>
    1d46:	4705                	li	a4,1
    1d48:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1d4a:	00001797          	auipc	a5,0x1
    1d4e:	95678793          	addi	a5,a5,-1706 # 26a0 <allocated_time>
    1d52:	639c                	ld	a5,0(a5)
    1d54:	0007871b          	sext.w	a4,a5
    1d58:	00001797          	auipc	a5,0x1
    1d5c:	94878793          	addi	a5,a5,-1720 # 26a0 <allocated_time>
    1d60:	639c                	ld	a5,0(a5)
    1d62:	86be                	mv	a3,a5
    1d64:	00000617          	auipc	a2,0x0
    1d68:	eb060613          	addi	a2,a2,-336 # 1c14 <back_to_main_handler>
    1d6c:	00001597          	auipc	a1,0x1
    1d70:	8ec58593          	addi	a1,a1,-1812 # 2658 <main_thrd_id>
    1d74:	853a                	mv	a0,a4
    1d76:	fffff097          	auipc	ra,0xfffff
    1d7a:	b4a080e7          	jalr	-1206(ra) # 8c0 <thrdstop>
        while (sleeping) {
    1d7e:	0001                	nop
    1d80:	00001797          	auipc	a5,0x1
    1d84:	91c78793          	addi	a5,a5,-1764 # 269c <sleeping>
    1d88:	439c                	lw	a5,0(a5)
    1d8a:	fbfd                	bnez	a5,1d80 <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1d8c:	00001517          	auipc	a0,0x1
    1d90:	8ac50513          	addi	a0,a0,-1876 # 2638 <run_queue>
    1d94:	fffff097          	auipc	ra,0xfffff
    1d98:	460080e7          	jalr	1120(ra) # 11f4 <list_empty>
    1d9c:	87aa                	mv	a5,a0
    1d9e:	d79d                	beqz	a5,1ccc <thread_start_threading+0x5c>
    1da0:	00001517          	auipc	a0,0x1
    1da4:	8a850513          	addi	a0,a0,-1880 # 2648 <release_queue>
    1da8:	fffff097          	auipc	ra,0xfffff
    1dac:	44c080e7          	jalr	1100(ra) # 11f4 <list_empty>
    1db0:	87aa                	mv	a5,a0
    1db2:	df89                	beqz	a5,1ccc <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1db4:	a011                	j	1db8 <thread_start_threading+0x148>
            break;
    1db6:	0001                	nop
}
    1db8:	0001                	nop
    1dba:	60a2                	ld	ra,8(sp)
    1dbc:	6402                	ld	s0,0(sp)
    1dbe:	0141                	addi	sp,sp,16
    1dc0:	8082                	ret

0000000000001dc2 <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1dc2:	7139                	addi	sp,sp,-64
    1dc4:	fc22                	sd	s0,56(sp)
    1dc6:	0080                	addi	s0,sp,64
    1dc8:	fca43423          	sd	a0,-56(s0)
    1dcc:	87ae                	mv	a5,a1
    1dce:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1dd2:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1dd6:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1dda:	fc843783          	ld	a5,-56(s0)
    1dde:	639c                	ld	a5,0(a5)
    1de0:	fcf43c23          	sd	a5,-40(s0)
    1de4:	fd843783          	ld	a5,-40(s0)
    1de8:	fd878793          	addi	a5,a5,-40
    1dec:	fef43423          	sd	a5,-24(s0)
    1df0:	a881                	j	1e40 <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1df2:	fe843783          	ld	a5,-24(s0)
    1df6:	4fb8                	lw	a4,88(a5)
    1df8:	fc442783          	lw	a5,-60(s0)
    1dfc:	2781                	sext.w	a5,a5
    1dfe:	02e7c663          	blt	a5,a4,1e2a <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1e02:	fe043783          	ld	a5,-32(s0)
    1e06:	e791                	bnez	a5,1e12 <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1e08:	fe843783          	ld	a5,-24(s0)
    1e0c:	fef43023          	sd	a5,-32(s0)
    1e10:	a829                	j	1e2a <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1e12:	fe843783          	ld	a5,-24(s0)
    1e16:	5fd8                	lw	a4,60(a5)
    1e18:	fe043783          	ld	a5,-32(s0)
    1e1c:	5fdc                	lw	a5,60(a5)
    1e1e:	00f75663          	bge	a4,a5,1e2a <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1e22:	fe843783          	ld	a5,-24(s0)
    1e26:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1e2a:	fe843783          	ld	a5,-24(s0)
    1e2e:	779c                	ld	a5,40(a5)
    1e30:	fcf43823          	sd	a5,-48(s0)
    1e34:	fd043783          	ld	a5,-48(s0)
    1e38:	fd878793          	addi	a5,a5,-40
    1e3c:	fef43423          	sd	a5,-24(s0)
    1e40:	fe843783          	ld	a5,-24(s0)
    1e44:	02878793          	addi	a5,a5,40
    1e48:	fc843703          	ld	a4,-56(s0)
    1e4c:	faf713e3          	bne	a4,a5,1df2 <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1e50:	fe043783          	ld	a5,-32(s0)
}
    1e54:	853e                	mv	a0,a5
    1e56:	7462                	ld	s0,56(sp)
    1e58:	6121                	addi	sp,sp,64
    1e5a:	8082                	ret

0000000000001e5c <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1e5c:	7131                	addi	sp,sp,-192
    1e5e:	fd06                	sd	ra,184(sp)
    1e60:	f922                	sd	s0,176(sp)
    1e62:	f526                	sd	s1,168(sp)
    1e64:	f14a                	sd	s2,160(sp)
    1e66:	ed4e                	sd	s3,152(sp)
    1e68:	0180                	addi	s0,sp,192
    1e6a:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1e6c:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1e70:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1e74:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1e78:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1e7c:	649c                	ld	a5,8(s1)
    1e7e:	4098                	lw	a4,0(s1)
    1e80:	85ba                	mv	a1,a4
    1e82:	853e                	mv	a0,a5
    1e84:	00000097          	auipc	ra,0x0
    1e88:	f3e080e7          	jalr	-194(ra) # 1dc2 <__check_deadline_miss>
    1e8c:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1e90:	f9843783          	ld	a5,-104(s0)
    1e94:	c7b5                	beqz	a5,1f00 <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1e96:	f9843783          	ld	a5,-104(s0)
    1e9a:	5fdc                	lw	a5,60(a5)
    1e9c:	85be                	mv	a1,a5
    1e9e:	00000517          	auipc	a0,0x0
    1ea2:	6d250513          	addi	a0,a0,1746 # 2570 <schedule_edf_cbs+0x714>
    1ea6:	fffff097          	auipc	ra,0xfffff
    1eaa:	ec0080e7          	jalr	-320(ra) # d66 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1eae:	f9843783          	ld	a5,-104(s0)
    1eb2:	57fc                	lw	a5,108(a5)
    1eb4:	c395                	beqz	a5,1ed8 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1eb6:	f9843783          	ld	a5,-104(s0)
    1eba:	02878793          	addi	a5,a5,40
    1ebe:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1ec2:	f4042423          	sw	zero,-184(s0)
            return r;
    1ec6:	f4043783          	ld	a5,-192(s0)
    1eca:	f4f43823          	sd	a5,-176(s0)
    1ece:	f4843783          	ld	a5,-184(s0)
    1ed2:	f4f43c23          	sd	a5,-168(s0)
    1ed6:	a13d                	j	2304 <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1ed8:	4098                	lw	a4,0(s1)
    1eda:	f9843783          	ld	a5,-104(s0)
    1ede:	47fc                	lw	a5,76(a5)
    1ee0:	9fb9                	addw	a5,a5,a4
    1ee2:	0007871b          	sext.w	a4,a5
    1ee6:	f9843783          	ld	a5,-104(s0)
    1eea:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1eec:	f9843783          	ld	a5,-104(s0)
    1ef0:	53f8                	lw	a4,100(a5)
    1ef2:	f9843783          	ld	a5,-104(s0)
    1ef6:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1ef8:	f9843783          	ld	a5,-104(s0)
    1efc:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1f00:	fa043783          	ld	a5,-96(s0)
    1f04:	e7dd                	bnez	a5,1fb2 <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1f06:	649c                	ld	a5,8(s1)
    1f08:	639c                	ld	a5,0(a5)
    1f0a:	f8f43823          	sd	a5,-112(s0)
    1f0e:	f9043783          	ld	a5,-112(s0)
    1f12:	fd878793          	addi	a5,a5,-40
    1f16:	faf43c23          	sd	a5,-72(s0)
    1f1a:	a069                	j	1fa4 <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1f1c:	fb843783          	ld	a5,-72(s0)
    1f20:	5fd8                	lw	a4,60(a5)
    1f22:	fb843783          	ld	a5,-72(s0)
    1f26:	5bbc                	lw	a5,112(a5)
    1f28:	863e                	mv	a2,a5
    1f2a:	85ba                	mv	a1,a4
    1f2c:	00000517          	auipc	a0,0x0
    1f30:	67c50513          	addi	a0,a0,1660 # 25a8 <schedule_edf_cbs+0x74c>
    1f34:	fffff097          	auipc	ra,0xfffff
    1f38:	e32080e7          	jalr	-462(ra) # d66 <printf>
            if (next == NULL)
    1f3c:	fa043783          	ld	a5,-96(s0)
    1f40:	e791                	bnez	a5,1f4c <schedule_edf_cbs+0xf0>
                next = th;
    1f42:	fb843783          	ld	a5,-72(s0)
    1f46:	faf43023          	sd	a5,-96(s0)
    1f4a:	a091                	j	1f8e <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1f4c:	fb843783          	ld	a5,-72(s0)
    1f50:	4fb8                	lw	a4,88(a5)
    1f52:	fa043783          	ld	a5,-96(s0)
    1f56:	4fbc                	lw	a5,88(a5)
    1f58:	00f75763          	bge	a4,a5,1f66 <schedule_edf_cbs+0x10a>
                next = th;
    1f5c:	fb843783          	ld	a5,-72(s0)
    1f60:	faf43023          	sd	a5,-96(s0)
    1f64:	a02d                	j	1f8e <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1f66:	fb843783          	ld	a5,-72(s0)
    1f6a:	4fb8                	lw	a4,88(a5)
    1f6c:	fa043783          	ld	a5,-96(s0)
    1f70:	4fbc                	lw	a5,88(a5)
    1f72:	00f71e63          	bne	a4,a5,1f8e <schedule_edf_cbs+0x132>
    1f76:	fb843783          	ld	a5,-72(s0)
    1f7a:	5fd8                	lw	a4,60(a5)
    1f7c:	fa043783          	ld	a5,-96(s0)
    1f80:	5fdc                	lw	a5,60(a5)
    1f82:	00f75663          	bge	a4,a5,1f8e <schedule_edf_cbs+0x132>
                next = th;
    1f86:	fb843783          	ld	a5,-72(s0)
    1f8a:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1f8e:	fb843783          	ld	a5,-72(s0)
    1f92:	779c                	ld	a5,40(a5)
    1f94:	f8f43423          	sd	a5,-120(s0)
    1f98:	f8843783          	ld	a5,-120(s0)
    1f9c:	fd878793          	addi	a5,a5,-40
    1fa0:	faf43c23          	sd	a5,-72(s0)
    1fa4:	fb843783          	ld	a5,-72(s0)
    1fa8:	02878713          	addi	a4,a5,40
    1fac:	649c                	ld	a5,8(s1)
    1fae:	f6f717e3          	bne	a4,a5,1f1c <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1fb2:	fa043783          	ld	a5,-96(s0)
    1fb6:	5fdc                	lw	a5,60(a5)
    1fb8:	85be                	mv	a1,a5
    1fba:	00000517          	auipc	a0,0x0
    1fbe:	62650513          	addi	a0,a0,1574 # 25e0 <schedule_edf_cbs+0x784>
    1fc2:	fffff097          	auipc	ra,0xfffff
    1fc6:	da4080e7          	jalr	-604(ra) # d66 <printf>

    if(next && next->cbs.is_throttled){
    1fca:	fa043783          	ld	a5,-96(s0)
    1fce:	cb95                	beqz	a5,2002 <schedule_edf_cbs+0x1a6>
    1fd0:	fa043783          	ld	a5,-96(s0)
    1fd4:	5bbc                	lw	a5,112(a5)
    1fd6:	c795                	beqz	a5,2002 <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1fd8:	fa043783          	ld	a5,-96(s0)
    1fdc:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1fe0:	fa043783          	ld	a5,-96(s0)
    1fe4:	02878793          	addi	a5,a5,40
    1fe8:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1fec:	f4042423          	sw	zero,-184(s0)
        return r;
    1ff0:	f4043783          	ld	a5,-192(s0)
    1ff4:	f4f43823          	sd	a5,-176(s0)
    1ff8:	f4843783          	ld	a5,-184(s0)
    1ffc:	f4f43c23          	sd	a5,-168(s0)
    2000:	a611                	j	2304 <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    2002:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    2006:	689c                	ld	a5,16(s1)
    2008:	639c                	ld	a5,0(a5)
    200a:	f8f43023          	sd	a5,-128(s0)
    200e:	f8043783          	ld	a5,-128(s0)
    2012:	17e1                	addi	a5,a5,-8
    2014:	fcf43023          	sd	a5,-64(s0)
    2018:	a0b5                	j	2084 <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    201a:	fa843783          	ld	a5,-88(s0)
    201e:	e791                	bnez	a5,202a <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    2020:	fc043783          	ld	a5,-64(s0)
    2024:	faf43423          	sd	a5,-88(s0)
    2028:	a0a1                	j	2070 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    202a:	fa843783          	ld	a5,-88(s0)
    202e:	4f98                	lw	a4,24(a5)
    2030:	fc043783          	ld	a5,-64(s0)
    2034:	4f9c                	lw	a5,24(a5)
    2036:	00e7d763          	bge	a5,a4,2044 <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    203a:	fc043783          	ld	a5,-64(s0)
    203e:	faf43423          	sd	a5,-88(s0)
    2042:	a03d                	j	2070 <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    2044:	fa843783          	ld	a5,-88(s0)
    2048:	4f98                	lw	a4,24(a5)
    204a:	fc043783          	ld	a5,-64(s0)
    204e:	4f9c                	lw	a5,24(a5)
    2050:	02f71063          	bne	a4,a5,2070 <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    2054:	fa843783          	ld	a5,-88(s0)
    2058:	639c                	ld	a5,0(a5)
    205a:	4fb8                	lw	a4,88(a5)
    205c:	fc043783          	ld	a5,-64(s0)
    2060:	639c                	ld	a5,0(a5)
    2062:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    2064:	00e7d663          	bge	a5,a4,2070 <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    2068:	fc043783          	ld	a5,-64(s0)
    206c:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    2070:	fc043783          	ld	a5,-64(s0)
    2074:	679c                	ld	a5,8(a5)
    2076:	f6f43023          	sd	a5,-160(s0)
    207a:	f6043783          	ld	a5,-160(s0)
    207e:	17e1                	addi	a5,a5,-8
    2080:	fcf43023          	sd	a5,-64(s0)
    2084:	fc043783          	ld	a5,-64(s0)
    2088:	00878713          	addi	a4,a5,8
    208c:	689c                	ld	a5,16(s1)
    208e:	f8f716e3          	bne	a4,a5,201a <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    2092:	689c                	ld	a5,16(s1)
    2094:	639c                	ld	a5,0(a5)
    2096:	f6f43c23          	sd	a5,-136(s0)
    209a:	f7843783          	ld	a5,-136(s0)
    209e:	17e1                	addi	a5,a5,-8
    20a0:	fcf43023          	sd	a5,-64(s0)
    20a4:	a069                	j	212e <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    20a6:	fb043783          	ld	a5,-80(s0)
    20aa:	eb99                	bnez	a5,20c0 <schedule_edf_cbs+0x264>
    20ac:	fc043783          	ld	a5,-64(s0)
    20b0:	639c                	ld	a5,0(a5)
    20b2:	57fc                	lw	a5,108(a5)
    20b4:	c791                	beqz	a5,20c0 <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    20b6:	fc043783          	ld	a5,-64(s0)
    20ba:	faf43823          	sd	a5,-80(s0)
    20be:	a8b1                	j	211a <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    20c0:	fc043783          	ld	a5,-64(s0)
    20c4:	639c                	ld	a5,0(a5)
    20c6:	57fc                	lw	a5,108(a5)
    20c8:	cf91                	beqz	a5,20e4 <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    20ca:	fb043783          	ld	a5,-80(s0)
    20ce:	4f98                	lw	a4,24(a5)
    20d0:	fc043783          	ld	a5,-64(s0)
    20d4:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    20d6:	00e7d763          	bge	a5,a4,20e4 <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    20da:	fc043783          	ld	a5,-64(s0)
    20de:	faf43823          	sd	a5,-80(s0)
    20e2:	a825                	j	211a <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    20e4:	fc043783          	ld	a5,-64(s0)
    20e8:	639c                	ld	a5,0(a5)
    20ea:	57fc                	lw	a5,108(a5)
    20ec:	c79d                	beqz	a5,211a <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    20ee:	fb043783          	ld	a5,-80(s0)
    20f2:	4f98                	lw	a4,24(a5)
    20f4:	fc043783          	ld	a5,-64(s0)
    20f8:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    20fa:	02f71063          	bne	a4,a5,211a <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    20fe:	fb043783          	ld	a5,-80(s0)
    2102:	639c                	ld	a5,0(a5)
    2104:	4fb8                	lw	a4,88(a5)
    2106:	fc043783          	ld	a5,-64(s0)
    210a:	639c                	ld	a5,0(a5)
    210c:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    210e:	00e7d663          	bge	a5,a4,211a <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    2112:	fc043783          	ld	a5,-64(s0)
    2116:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    211a:	fc043783          	ld	a5,-64(s0)
    211e:	679c                	ld	a5,8(a5)
    2120:	f6f43423          	sd	a5,-152(s0)
    2124:	f6843783          	ld	a5,-152(s0)
    2128:	17e1                	addi	a5,a5,-8
    212a:	fcf43023          	sd	a5,-64(s0)
    212e:	fc043783          	ld	a5,-64(s0)
    2132:	00878713          	addi	a4,a5,8
    2136:	689c                	ld	a5,16(s1)
    2138:	f6f717e3          	bne	a4,a5,20a6 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    213c:	fa043783          	ld	a5,-96(s0)
    2140:	cb89                	beqz	a5,2152 <schedule_edf_cbs+0x2f6>
    2142:	fa043783          	ld	a5,-96(s0)
    2146:	57fc                	lw	a5,108(a5)
    2148:	c789                	beqz	a5,2152 <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    214a:	fb043783          	ld	a5,-80(s0)
    214e:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    2152:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    2156:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    215a:	fa843783          	ld	a5,-88(s0)
    215e:	c3c5                	beqz	a5,21fe <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    2160:	fa843783          	ld	a5,-88(s0)
    2164:	639c                	ld	a5,0(a5)
    2166:	5fdc                	lw	a5,60(a5)
    2168:	85be                	mv	a1,a5
    216a:	00000517          	auipc	a0,0x0
    216e:	49650513          	addi	a0,a0,1174 # 2600 <schedule_edf_cbs+0x7a4>
    2172:	fffff097          	auipc	ra,0xfffff
    2176:	bf4080e7          	jalr	-1036(ra) # d66 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    217a:	fa843783          	ld	a5,-88(s0)
    217e:	4f98                	lw	a4,24(a5)
    2180:	409c                	lw	a5,0(s1)
    2182:	40f707bb          	subw	a5,a4,a5
    2186:	fcf42623          	sw	a5,-52(s0)
        if (next){
    218a:	fa043783          	ld	a5,-96(s0)
    218e:	cba5                	beqz	a5,21fe <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    2190:	fa043783          	ld	a5,-96(s0)
    2194:	4bf8                	lw	a4,84(a5)
    2196:	fcc42783          	lw	a5,-52(s0)
    219a:	2781                	sext.w	a5,a5
    219c:	06e7d163          	bge	a5,a4,21fe <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    21a0:	fa043783          	ld	a5,-96(s0)
    21a4:	57fc                	lw	a5,108(a5)
    21a6:	eb91                	bnez	a5,21ba <schedule_edf_cbs+0x35e>
    21a8:	fa843783          	ld	a5,-88(s0)
    21ac:	639c                	ld	a5,0(a5)
    21ae:	57fc                	lw	a5,108(a5)
    21b0:	c789                	beqz	a5,21ba <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    21b2:	4785                	li	a5,1
    21b4:	fcf42423          	sw	a5,-56(s0)
    21b8:	a099                	j	21fe <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    21ba:	fa043783          	ld	a5,-96(s0)
    21be:	4fb8                	lw	a4,88(a5)
    21c0:	fa843783          	ld	a5,-88(s0)
    21c4:	639c                	ld	a5,0(a5)
    21c6:	4fbc                	lw	a5,88(a5)
    21c8:	00e7d663          	bge	a5,a4,21d4 <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    21cc:	4785                	li	a5,1
    21ce:	fcf42423          	sw	a5,-56(s0)
    21d2:	a035                	j	21fe <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    21d4:	fa043783          	ld	a5,-96(s0)
    21d8:	4fb8                	lw	a4,88(a5)
    21da:	fa843783          	ld	a5,-88(s0)
    21de:	639c                	ld	a5,0(a5)
    21e0:	4fbc                	lw	a5,88(a5)
    21e2:	00f71e63          	bne	a4,a5,21fe <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    21e6:	fa043783          	ld	a5,-96(s0)
    21ea:	5fd8                	lw	a4,60(a5)
    21ec:	fa843783          	ld	a5,-88(s0)
    21f0:	639c                	ld	a5,0(a5)
    21f2:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    21f4:	00e7d563          	bge	a5,a4,21fe <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    21f8:	4785                	li	a5,1
    21fa:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    21fe:	fa043783          	ld	a5,-96(s0)
    2202:	cbd1                	beqz	a5,2296 <schedule_edf_cbs+0x43a>
    2204:	fa043783          	ld	a5,-96(s0)
    2208:	57fc                	lw	a5,108(a5)
    220a:	e7d1                	bnez	a5,2296 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    220c:	fa043783          	ld	a5,-96(s0)
    2210:	4fb8                	lw	a4,88(a5)
    2212:	409c                	lw	a5,0(s1)
    2214:	40f707bb          	subw	a5,a4,a5
    2218:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    221c:	fa043783          	ld	a5,-96(s0)
    2220:	47f8                	lw	a4,76(a5)
    2222:	fa043783          	ld	a5,-96(s0)
    2226:	57bc                	lw	a5,104(a5)
    2228:	02f707bb          	mulw	a5,a4,a5
    222c:	0007869b          	sext.w	a3,a5
    2230:	fa043783          	ld	a5,-96(s0)
    2234:	53fc                	lw	a5,100(a5)
    2236:	f7442703          	lw	a4,-140(s0)
    223a:	02f707bb          	mulw	a5,a4,a5
    223e:	2781                	sext.w	a5,a5
    2240:	8736                	mv	a4,a3
    2242:	02e7d263          	bge	a5,a4,2266 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    2246:	4098                	lw	a4,0(s1)
    2248:	fa043783          	ld	a5,-96(s0)
    224c:	47fc                	lw	a5,76(a5)
    224e:	9fb9                	addw	a5,a5,a4
    2250:	0007871b          	sext.w	a4,a5
    2254:	fa043783          	ld	a5,-96(s0)
    2258:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    225a:	fa043783          	ld	a5,-96(s0)
    225e:	53f8                	lw	a4,100(a5)
    2260:	fa043783          	ld	a5,-96(s0)
    2264:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    2266:	fa043783          	ld	a5,-96(s0)
    226a:	4bf8                	lw	a4,84(a5)
    226c:	fa043783          	ld	a5,-96(s0)
    2270:	57bc                	lw	a5,104(a5)
    2272:	02e7d263          	bge	a5,a4,2296 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    2276:	fa043783          	ld	a5,-96(s0)
    227a:	4705                	li	a4,1
    227c:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    227e:	fa043783          	ld	a5,-96(s0)
    2282:	4fb8                	lw	a4,88(a5)
    2284:	fa043783          	ld	a5,-96(s0)
    2288:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    228a:	fa043783          	ld	a5,-96(s0)
    228e:	4bf8                	lw	a4,84(a5)
    2290:	fa043783          	ld	a5,-96(s0)
    2294:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    2296:	fa043783          	ld	a5,-96(s0)
    229a:	c3a9                	beqz	a5,22dc <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    229c:	fa043783          	ld	a5,-96(s0)
    22a0:	02878793          	addi	a5,a5,40
    22a4:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    22a8:	fa843783          	ld	a5,-88(s0)
    22ac:	cb91                	beqz	a5,22c0 <schedule_edf_cbs+0x464>
    22ae:	fc842783          	lw	a5,-56(s0)
    22b2:	2781                	sext.w	a5,a5
    22b4:	c791                	beqz	a5,22c0 <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    22b6:	fcc42783          	lw	a5,-52(s0)
    22ba:	f4f42423          	sw	a5,-184(s0)
    22be:	a81d                	j	22f4 <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    22c0:	fa043783          	ld	a5,-96(s0)
    22c4:	5bbc                	lw	a5,112(a5)
    22c6:	c789                	beqz	a5,22d0 <schedule_edf_cbs+0x474>
    22c8:	fa043783          	ld	a5,-96(s0)
    22cc:	57bc                	lw	a5,104(a5)
    22ce:	a021                	j	22d6 <schedule_edf_cbs+0x47a>
    22d0:	fa043783          	ld	a5,-96(s0)
    22d4:	4bfc                	lw	a5,84(a5)
    22d6:	f4f42423          	sw	a5,-184(s0)
    22da:	a829                	j	22f4 <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    22dc:	649c                	ld	a5,8(s1)
    22de:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    22e2:	fa843783          	ld	a5,-88(s0)
    22e6:	c781                	beqz	a5,22ee <schedule_edf_cbs+0x492>
    22e8:	fcc42783          	lw	a5,-52(s0)
    22ec:	a011                	j	22f0 <schedule_edf_cbs+0x494>
    22ee:	4785                	li	a5,1
    22f0:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    22f4:	f4043783          	ld	a5,-192(s0)
    22f8:	f4f43823          	sd	a5,-176(s0)
    22fc:	f4843783          	ld	a5,-184(s0)
    2300:	f4f43c23          	sd	a5,-168(s0)
    2304:	4701                	li	a4,0
    2306:	f5043703          	ld	a4,-176(s0)
    230a:	4781                	li	a5,0
    230c:	f5843783          	ld	a5,-168(s0)
    2310:	893a                	mv	s2,a4
    2312:	89be                	mv	s3,a5
    2314:	874a                	mv	a4,s2
    2316:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    2318:	853a                	mv	a0,a4
    231a:	85be                	mv	a1,a5
    231c:	70ea                	ld	ra,184(sp)
    231e:	744a                	ld	s0,176(sp)
    2320:	74aa                	ld	s1,168(sp)
    2322:	790a                	ld	s2,160(sp)
    2324:	69ea                	ld	s3,152(sp)
    2326:	6129                	addi	sp,sp,192
    2328:	8082                	ret
