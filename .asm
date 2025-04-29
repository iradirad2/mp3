
user/_rttask5:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f>:
#define NULL 0

int k = 0;

void f(void *arg)
{
       0:	1101                	addi	sp,sp,-32
       2:	ec22                	sd	s0,24(sp)
       4:	1000                	addi	s0,sp,32
       6:	fea43423          	sd	a0,-24(s0)
    while (1) {
        k++;
       a:	00002797          	auipc	a5,0x2
       e:	44e78793          	addi	a5,a5,1102 # 2458 <k>
      12:	439c                	lw	a5,0(a5)
      14:	2785                	addiw	a5,a5,1
      16:	0007871b          	sext.w	a4,a5
      1a:	00002797          	auipc	a5,0x2
      1e:	43e78793          	addi	a5,a5,1086 # 2458 <k>
      22:	c398                	sw	a4,0(a5)
      24:	b7dd                	j	a <f+0xa>

0000000000000026 <main>:
    }
}

int main(int argc, char **argv)
{
      26:	715d                	addi	sp,sp,-80
      28:	e486                	sd	ra,72(sp)
      2a:	e0a2                	sd	s0,64(sp)
      2c:	0880                	addi	s0,sp,80
      2e:	87aa                	mv	a5,a0
      30:	fab43823          	sd	a1,-80(s0)
      34:	faf42e23          	sw	a5,-68(s0)
    if (argc < 2) {
      38:	fbc42783          	lw	a5,-68(s0)
      3c:	0007871b          	sext.w	a4,a5
      40:	4785                	li	a5,1
      42:	02e7c063          	blt	a5,a4,62 <main+0x3c>
        fprintf(2, "Usage: rttask1 [EDF_CBS|DM]\n");
      46:	00002597          	auipc	a1,0x2
      4a:	11258593          	addi	a1,a1,274 # 2158 <schedule_edf_cbs+0x4ce>
      4e:	4509                	li	a0,2
      50:	00001097          	auipc	ra,0x1
      54:	aec080e7          	jalr	-1300(ra) # b3c <fprintf>
        exit(1);
      58:	4505                	li	a0,1
      5a:	00000097          	auipc	ra,0x0
      5e:	5f4080e7          	jalr	1524(ra) # 64e <exit>
    }

    if (strcmp(argv[1], "EDF_CBS") == 0) {
      62:	fb043783          	ld	a5,-80(s0)
      66:	07a1                	addi	a5,a5,8
      68:	639c                	ld	a5,0(a5)
      6a:	00002597          	auipc	a1,0x2
      6e:	10e58593          	addi	a1,a1,270 # 2178 <schedule_edf_cbs+0x4ee>
      72:	853e                	mv	a0,a5
      74:	00000097          	auipc	ra,0x0
      78:	194080e7          	jalr	404(ra) # 208 <strcmp>
      7c:	87aa                	mv	a5,a0
      7e:	efb5                	bnez	a5,fa <main+0xd4>
        struct thread *t1 = thread_create(f, NULL, 1, 7, 22, 2);
      80:	4789                	li	a5,2
      82:	4759                	li	a4,22
      84:	469d                	li	a3,7
      86:	4605                	li	a2,1
      88:	4581                	li	a1,0
      8a:	00000517          	auipc	a0,0x0
      8e:	f7650513          	addi	a0,a0,-138 # 0 <f>
      92:	00001097          	auipc	ra,0x1
      96:	fba080e7          	jalr	-70(ra) # 104c <thread_create>
      9a:	fca43823          	sd	a0,-48(s0)
        init_thread_cbs(t1, 7, 1);
      9e:	4605                	li	a2,1
      a0:	459d                	li	a1,7
      a2:	fd043503          	ld	a0,-48(s0)
      a6:	00001097          	auipc	ra,0x1
      aa:	0e0080e7          	jalr	224(ra) # 1186 <init_thread_cbs>
        thread_add_at(t1, 0);
      ae:	4581                	li	a1,0
      b0:	fd043503          	ld	a0,-48(s0)
      b4:	00001097          	auipc	ra,0x1
      b8:	130080e7          	jalr	304(ra) # 11e4 <thread_add_at>

        struct thread *t4 = thread_create(f, NULL, 1, 8, 10, 2);
      bc:	4789                	li	a5,2
      be:	4729                	li	a4,10
      c0:	46a1                	li	a3,8
      c2:	4605                	li	a2,1
      c4:	4581                	li	a1,0
      c6:	00000517          	auipc	a0,0x0
      ca:	f3a50513          	addi	a0,a0,-198 # 0 <f>
      ce:	00001097          	auipc	ra,0x1
      d2:	f7e080e7          	jalr	-130(ra) # 104c <thread_create>
      d6:	fca43423          	sd	a0,-56(s0)
        init_thread_cbs(t4, 5, 0);
      da:	4601                	li	a2,0
      dc:	4595                	li	a1,5
      de:	fc843503          	ld	a0,-56(s0)
      e2:	00001097          	auipc	ra,0x1
      e6:	0a4080e7          	jalr	164(ra) # 1186 <init_thread_cbs>
        thread_add_at(t4, 0);
      ea:	4581                	li	a1,0
      ec:	fc843503          	ld	a0,-56(s0)
      f0:	00001097          	auipc	ra,0x1
      f4:	0f4080e7          	jalr	244(ra) # 11e4 <thread_add_at>
      f8:	a055                	j	19c <main+0x176>

    } else if (strcmp(argv[1], "DM") == 0) {
      fa:	fb043783          	ld	a5,-80(s0)
      fe:	07a1                	addi	a5,a5,8
     100:	639c                	ld	a5,0(a5)
     102:	00002597          	auipc	a1,0x2
     106:	07e58593          	addi	a1,a1,126 # 2180 <schedule_edf_cbs+0x4f6>
     10a:	853e                	mv	a0,a5
     10c:	00000097          	auipc	ra,0x0
     110:	0fc080e7          	jalr	252(ra) # 208 <strcmp>
     114:	87aa                	mv	a5,a0
     116:	e3d9                	bnez	a5,19c <main+0x176>
        struct thread *t1 = thread_create(f, NULL, 1, 3, 9, 2);
     118:	4789                	li	a5,2
     11a:	4725                	li	a4,9
     11c:	468d                	li	a3,3
     11e:	4605                	li	a2,1
     120:	4581                	li	a1,0
     122:	00000517          	auipc	a0,0x0
     126:	ede50513          	addi	a0,a0,-290 # 0 <f>
     12a:	00001097          	auipc	ra,0x1
     12e:	f22080e7          	jalr	-222(ra) # 104c <thread_create>
     132:	fea43423          	sd	a0,-24(s0)
        thread_add_at(t1, 2);
     136:	4589                	li	a1,2
     138:	fe843503          	ld	a0,-24(s0)
     13c:	00001097          	auipc	ra,0x1
     140:	0a8080e7          	jalr	168(ra) # 11e4 <thread_add_at>

        struct thread *t2 = thread_create(f, NULL, 1, 5, 15, 2);
     144:	4789                	li	a5,2
     146:	473d                	li	a4,15
     148:	4695                	li	a3,5
     14a:	4605                	li	a2,1
     14c:	4581                	li	a1,0
     14e:	00000517          	auipc	a0,0x0
     152:	eb250513          	addi	a0,a0,-334 # 0 <f>
     156:	00001097          	auipc	ra,0x1
     15a:	ef6080e7          	jalr	-266(ra) # 104c <thread_create>
     15e:	fea43023          	sd	a0,-32(s0)
        thread_add_at(t2, 0);
     162:	4581                	li	a1,0
     164:	fe043503          	ld	a0,-32(s0)
     168:	00001097          	auipc	ra,0x1
     16c:	07c080e7          	jalr	124(ra) # 11e4 <thread_add_at>

        struct thread *t3 = thread_create(f, NULL, 1, 3, 9, 2);
     170:	4789                	li	a5,2
     172:	4725                	li	a4,9
     174:	468d                	li	a3,3
     176:	4605                	li	a2,1
     178:	4581                	li	a1,0
     17a:	00000517          	auipc	a0,0x0
     17e:	e8650513          	addi	a0,a0,-378 # 0 <f>
     182:	00001097          	auipc	ra,0x1
     186:	eca080e7          	jalr	-310(ra) # 104c <thread_create>
     18a:	fca43c23          	sd	a0,-40(s0)
        thread_add_at(t3, 1);
     18e:	4585                	li	a1,1
     190:	fd843503          	ld	a0,-40(s0)
     194:	00001097          	auipc	ra,0x1
     198:	050080e7          	jalr	80(ra) # 11e4 <thread_add_at>
        }

    thread_start_threading();
     19c:	00002097          	auipc	ra,0x2
     1a0:	902080e7          	jalr	-1790(ra) # 1a9e <thread_start_threading>
    printf("\nexited\n");
     1a4:	00002517          	auipc	a0,0x2
     1a8:	fe450513          	addi	a0,a0,-28 # 2188 <schedule_edf_cbs+0x4fe>
     1ac:	00001097          	auipc	ra,0x1
     1b0:	9e8080e7          	jalr	-1560(ra) # b94 <printf>
    exit(0);
     1b4:	4501                	li	a0,0
     1b6:	00000097          	auipc	ra,0x0
     1ba:	498080e7          	jalr	1176(ra) # 64e <exit>

00000000000001be <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     1be:	7179                	addi	sp,sp,-48
     1c0:	f422                	sd	s0,40(sp)
     1c2:	1800                	addi	s0,sp,48
     1c4:	fca43c23          	sd	a0,-40(s0)
     1c8:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     1cc:	fd843783          	ld	a5,-40(s0)
     1d0:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     1d4:	0001                	nop
     1d6:	fd043703          	ld	a4,-48(s0)
     1da:	00170793          	addi	a5,a4,1
     1de:	fcf43823          	sd	a5,-48(s0)
     1e2:	fd843783          	ld	a5,-40(s0)
     1e6:	00178693          	addi	a3,a5,1
     1ea:	fcd43c23          	sd	a3,-40(s0)
     1ee:	00074703          	lbu	a4,0(a4)
     1f2:	00e78023          	sb	a4,0(a5)
     1f6:	0007c783          	lbu	a5,0(a5)
     1fa:	fff1                	bnez	a5,1d6 <strcpy+0x18>
    ;
  return os;
     1fc:	fe843783          	ld	a5,-24(s0)
}
     200:	853e                	mv	a0,a5
     202:	7422                	ld	s0,40(sp)
     204:	6145                	addi	sp,sp,48
     206:	8082                	ret

0000000000000208 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     208:	1101                	addi	sp,sp,-32
     20a:	ec22                	sd	s0,24(sp)
     20c:	1000                	addi	s0,sp,32
     20e:	fea43423          	sd	a0,-24(s0)
     212:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     216:	a819                	j	22c <strcmp+0x24>
    p++, q++;
     218:	fe843783          	ld	a5,-24(s0)
     21c:	0785                	addi	a5,a5,1
     21e:	fef43423          	sd	a5,-24(s0)
     222:	fe043783          	ld	a5,-32(s0)
     226:	0785                	addi	a5,a5,1
     228:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     22c:	fe843783          	ld	a5,-24(s0)
     230:	0007c783          	lbu	a5,0(a5)
     234:	cb99                	beqz	a5,24a <strcmp+0x42>
     236:	fe843783          	ld	a5,-24(s0)
     23a:	0007c703          	lbu	a4,0(a5)
     23e:	fe043783          	ld	a5,-32(s0)
     242:	0007c783          	lbu	a5,0(a5)
     246:	fcf709e3          	beq	a4,a5,218 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     24a:	fe843783          	ld	a5,-24(s0)
     24e:	0007c783          	lbu	a5,0(a5)
     252:	0007871b          	sext.w	a4,a5
     256:	fe043783          	ld	a5,-32(s0)
     25a:	0007c783          	lbu	a5,0(a5)
     25e:	2781                	sext.w	a5,a5
     260:	40f707bb          	subw	a5,a4,a5
     264:	2781                	sext.w	a5,a5
}
     266:	853e                	mv	a0,a5
     268:	6462                	ld	s0,24(sp)
     26a:	6105                	addi	sp,sp,32
     26c:	8082                	ret

000000000000026e <strlen>:

uint
strlen(const char *s)
{
     26e:	7179                	addi	sp,sp,-48
     270:	f422                	sd	s0,40(sp)
     272:	1800                	addi	s0,sp,48
     274:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     278:	fe042623          	sw	zero,-20(s0)
     27c:	a031                	j	288 <strlen+0x1a>
     27e:	fec42783          	lw	a5,-20(s0)
     282:	2785                	addiw	a5,a5,1
     284:	fef42623          	sw	a5,-20(s0)
     288:	fec42783          	lw	a5,-20(s0)
     28c:	fd843703          	ld	a4,-40(s0)
     290:	97ba                	add	a5,a5,a4
     292:	0007c783          	lbu	a5,0(a5)
     296:	f7e5                	bnez	a5,27e <strlen+0x10>
    ;
  return n;
     298:	fec42783          	lw	a5,-20(s0)
}
     29c:	853e                	mv	a0,a5
     29e:	7422                	ld	s0,40(sp)
     2a0:	6145                	addi	sp,sp,48
     2a2:	8082                	ret

00000000000002a4 <memset>:

void*
memset(void *dst, int c, uint n)
{
     2a4:	7179                	addi	sp,sp,-48
     2a6:	f422                	sd	s0,40(sp)
     2a8:	1800                	addi	s0,sp,48
     2aa:	fca43c23          	sd	a0,-40(s0)
     2ae:	87ae                	mv	a5,a1
     2b0:	8732                	mv	a4,a2
     2b2:	fcf42a23          	sw	a5,-44(s0)
     2b6:	87ba                	mv	a5,a4
     2b8:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     2bc:	fd843783          	ld	a5,-40(s0)
     2c0:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     2c4:	fe042623          	sw	zero,-20(s0)
     2c8:	a00d                	j	2ea <memset+0x46>
    cdst[i] = c;
     2ca:	fec42783          	lw	a5,-20(s0)
     2ce:	fe043703          	ld	a4,-32(s0)
     2d2:	97ba                	add	a5,a5,a4
     2d4:	fd442703          	lw	a4,-44(s0)
     2d8:	0ff77713          	andi	a4,a4,255
     2dc:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     2e0:	fec42783          	lw	a5,-20(s0)
     2e4:	2785                	addiw	a5,a5,1
     2e6:	fef42623          	sw	a5,-20(s0)
     2ea:	fec42703          	lw	a4,-20(s0)
     2ee:	fd042783          	lw	a5,-48(s0)
     2f2:	2781                	sext.w	a5,a5
     2f4:	fcf76be3          	bltu	a4,a5,2ca <memset+0x26>
  }
  return dst;
     2f8:	fd843783          	ld	a5,-40(s0)
}
     2fc:	853e                	mv	a0,a5
     2fe:	7422                	ld	s0,40(sp)
     300:	6145                	addi	sp,sp,48
     302:	8082                	ret

0000000000000304 <strchr>:

char*
strchr(const char *s, char c)
{
     304:	1101                	addi	sp,sp,-32
     306:	ec22                	sd	s0,24(sp)
     308:	1000                	addi	s0,sp,32
     30a:	fea43423          	sd	a0,-24(s0)
     30e:	87ae                	mv	a5,a1
     310:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     314:	a01d                	j	33a <strchr+0x36>
    if(*s == c)
     316:	fe843783          	ld	a5,-24(s0)
     31a:	0007c703          	lbu	a4,0(a5)
     31e:	fe744783          	lbu	a5,-25(s0)
     322:	0ff7f793          	andi	a5,a5,255
     326:	00e79563          	bne	a5,a4,330 <strchr+0x2c>
      return (char*)s;
     32a:	fe843783          	ld	a5,-24(s0)
     32e:	a821                	j	346 <strchr+0x42>
  for(; *s; s++)
     330:	fe843783          	ld	a5,-24(s0)
     334:	0785                	addi	a5,a5,1
     336:	fef43423          	sd	a5,-24(s0)
     33a:	fe843783          	ld	a5,-24(s0)
     33e:	0007c783          	lbu	a5,0(a5)
     342:	fbf1                	bnez	a5,316 <strchr+0x12>
  return 0;
     344:	4781                	li	a5,0
}
     346:	853e                	mv	a0,a5
     348:	6462                	ld	s0,24(sp)
     34a:	6105                	addi	sp,sp,32
     34c:	8082                	ret

000000000000034e <gets>:

char*
gets(char *buf, int max)
{
     34e:	7179                	addi	sp,sp,-48
     350:	f406                	sd	ra,40(sp)
     352:	f022                	sd	s0,32(sp)
     354:	1800                	addi	s0,sp,48
     356:	fca43c23          	sd	a0,-40(s0)
     35a:	87ae                	mv	a5,a1
     35c:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     360:	fe042623          	sw	zero,-20(s0)
     364:	a8a1                	j	3bc <gets+0x6e>
    cc = read(0, &c, 1);
     366:	fe740793          	addi	a5,s0,-25
     36a:	4605                	li	a2,1
     36c:	85be                	mv	a1,a5
     36e:	4501                	li	a0,0
     370:	00000097          	auipc	ra,0x0
     374:	2f6080e7          	jalr	758(ra) # 666 <read>
     378:	87aa                	mv	a5,a0
     37a:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     37e:	fe842783          	lw	a5,-24(s0)
     382:	2781                	sext.w	a5,a5
     384:	04f05763          	blez	a5,3d2 <gets+0x84>
      break;
    buf[i++] = c;
     388:	fec42783          	lw	a5,-20(s0)
     38c:	0017871b          	addiw	a4,a5,1
     390:	fee42623          	sw	a4,-20(s0)
     394:	873e                	mv	a4,a5
     396:	fd843783          	ld	a5,-40(s0)
     39a:	97ba                	add	a5,a5,a4
     39c:	fe744703          	lbu	a4,-25(s0)
     3a0:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     3a4:	fe744783          	lbu	a5,-25(s0)
     3a8:	873e                	mv	a4,a5
     3aa:	47a9                	li	a5,10
     3ac:	02f70463          	beq	a4,a5,3d4 <gets+0x86>
     3b0:	fe744783          	lbu	a5,-25(s0)
     3b4:	873e                	mv	a4,a5
     3b6:	47b5                	li	a5,13
     3b8:	00f70e63          	beq	a4,a5,3d4 <gets+0x86>
  for(i=0; i+1 < max; ){
     3bc:	fec42783          	lw	a5,-20(s0)
     3c0:	2785                	addiw	a5,a5,1
     3c2:	0007871b          	sext.w	a4,a5
     3c6:	fd442783          	lw	a5,-44(s0)
     3ca:	2781                	sext.w	a5,a5
     3cc:	f8f74de3          	blt	a4,a5,366 <gets+0x18>
     3d0:	a011                	j	3d4 <gets+0x86>
      break;
     3d2:	0001                	nop
      break;
  }
  buf[i] = '\0';
     3d4:	fec42783          	lw	a5,-20(s0)
     3d8:	fd843703          	ld	a4,-40(s0)
     3dc:	97ba                	add	a5,a5,a4
     3de:	00078023          	sb	zero,0(a5)
  return buf;
     3e2:	fd843783          	ld	a5,-40(s0)
}
     3e6:	853e                	mv	a0,a5
     3e8:	70a2                	ld	ra,40(sp)
     3ea:	7402                	ld	s0,32(sp)
     3ec:	6145                	addi	sp,sp,48
     3ee:	8082                	ret

00000000000003f0 <stat>:

int
stat(const char *n, struct stat *st)
{
     3f0:	7179                	addi	sp,sp,-48
     3f2:	f406                	sd	ra,40(sp)
     3f4:	f022                	sd	s0,32(sp)
     3f6:	1800                	addi	s0,sp,48
     3f8:	fca43c23          	sd	a0,-40(s0)
     3fc:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     400:	4581                	li	a1,0
     402:	fd843503          	ld	a0,-40(s0)
     406:	00000097          	auipc	ra,0x0
     40a:	288080e7          	jalr	648(ra) # 68e <open>
     40e:	87aa                	mv	a5,a0
     410:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     414:	fec42783          	lw	a5,-20(s0)
     418:	2781                	sext.w	a5,a5
     41a:	0007d463          	bgez	a5,422 <stat+0x32>
    return -1;
     41e:	57fd                	li	a5,-1
     420:	a035                	j	44c <stat+0x5c>
  r = fstat(fd, st);
     422:	fec42783          	lw	a5,-20(s0)
     426:	fd043583          	ld	a1,-48(s0)
     42a:	853e                	mv	a0,a5
     42c:	00000097          	auipc	ra,0x0
     430:	27a080e7          	jalr	634(ra) # 6a6 <fstat>
     434:	87aa                	mv	a5,a0
     436:	fef42423          	sw	a5,-24(s0)
  close(fd);
     43a:	fec42783          	lw	a5,-20(s0)
     43e:	853e                	mv	a0,a5
     440:	00000097          	auipc	ra,0x0
     444:	236080e7          	jalr	566(ra) # 676 <close>
  return r;
     448:	fe842783          	lw	a5,-24(s0)
}
     44c:	853e                	mv	a0,a5
     44e:	70a2                	ld	ra,40(sp)
     450:	7402                	ld	s0,32(sp)
     452:	6145                	addi	sp,sp,48
     454:	8082                	ret

0000000000000456 <atoi>:

int
atoi(const char *s)
{
     456:	7179                	addi	sp,sp,-48
     458:	f422                	sd	s0,40(sp)
     45a:	1800                	addi	s0,sp,48
     45c:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     460:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     464:	a815                	j	498 <atoi+0x42>
    n = n*10 + *s++ - '0';
     466:	fec42703          	lw	a4,-20(s0)
     46a:	87ba                	mv	a5,a4
     46c:	0027979b          	slliw	a5,a5,0x2
     470:	9fb9                	addw	a5,a5,a4
     472:	0017979b          	slliw	a5,a5,0x1
     476:	0007871b          	sext.w	a4,a5
     47a:	fd843783          	ld	a5,-40(s0)
     47e:	00178693          	addi	a3,a5,1
     482:	fcd43c23          	sd	a3,-40(s0)
     486:	0007c783          	lbu	a5,0(a5)
     48a:	2781                	sext.w	a5,a5
     48c:	9fb9                	addw	a5,a5,a4
     48e:	2781                	sext.w	a5,a5
     490:	fd07879b          	addiw	a5,a5,-48
     494:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     498:	fd843783          	ld	a5,-40(s0)
     49c:	0007c783          	lbu	a5,0(a5)
     4a0:	873e                	mv	a4,a5
     4a2:	02f00793          	li	a5,47
     4a6:	00e7fb63          	bgeu	a5,a4,4bc <atoi+0x66>
     4aa:	fd843783          	ld	a5,-40(s0)
     4ae:	0007c783          	lbu	a5,0(a5)
     4b2:	873e                	mv	a4,a5
     4b4:	03900793          	li	a5,57
     4b8:	fae7f7e3          	bgeu	a5,a4,466 <atoi+0x10>
  return n;
     4bc:	fec42783          	lw	a5,-20(s0)
}
     4c0:	853e                	mv	a0,a5
     4c2:	7422                	ld	s0,40(sp)
     4c4:	6145                	addi	sp,sp,48
     4c6:	8082                	ret

00000000000004c8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     4c8:	7139                	addi	sp,sp,-64
     4ca:	fc22                	sd	s0,56(sp)
     4cc:	0080                	addi	s0,sp,64
     4ce:	fca43c23          	sd	a0,-40(s0)
     4d2:	fcb43823          	sd	a1,-48(s0)
     4d6:	87b2                	mv	a5,a2
     4d8:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     4dc:	fd843783          	ld	a5,-40(s0)
     4e0:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     4e4:	fd043783          	ld	a5,-48(s0)
     4e8:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     4ec:	fe043703          	ld	a4,-32(s0)
     4f0:	fe843783          	ld	a5,-24(s0)
     4f4:	02e7fc63          	bgeu	a5,a4,52c <memmove+0x64>
    while(n-- > 0)
     4f8:	a00d                	j	51a <memmove+0x52>
      *dst++ = *src++;
     4fa:	fe043703          	ld	a4,-32(s0)
     4fe:	00170793          	addi	a5,a4,1
     502:	fef43023          	sd	a5,-32(s0)
     506:	fe843783          	ld	a5,-24(s0)
     50a:	00178693          	addi	a3,a5,1
     50e:	fed43423          	sd	a3,-24(s0)
     512:	00074703          	lbu	a4,0(a4)
     516:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     51a:	fcc42783          	lw	a5,-52(s0)
     51e:	fff7871b          	addiw	a4,a5,-1
     522:	fce42623          	sw	a4,-52(s0)
     526:	fcf04ae3          	bgtz	a5,4fa <memmove+0x32>
     52a:	a891                	j	57e <memmove+0xb6>
  } else {
    dst += n;
     52c:	fcc42783          	lw	a5,-52(s0)
     530:	fe843703          	ld	a4,-24(s0)
     534:	97ba                	add	a5,a5,a4
     536:	fef43423          	sd	a5,-24(s0)
    src += n;
     53a:	fcc42783          	lw	a5,-52(s0)
     53e:	fe043703          	ld	a4,-32(s0)
     542:	97ba                	add	a5,a5,a4
     544:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
     548:	a01d                	j	56e <memmove+0xa6>
      *--dst = *--src;
     54a:	fe043783          	ld	a5,-32(s0)
     54e:	17fd                	addi	a5,a5,-1
     550:	fef43023          	sd	a5,-32(s0)
     554:	fe843783          	ld	a5,-24(s0)
     558:	17fd                	addi	a5,a5,-1
     55a:	fef43423          	sd	a5,-24(s0)
     55e:	fe043783          	ld	a5,-32(s0)
     562:	0007c703          	lbu	a4,0(a5)
     566:	fe843783          	ld	a5,-24(s0)
     56a:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
     56e:	fcc42783          	lw	a5,-52(s0)
     572:	fff7871b          	addiw	a4,a5,-1
     576:	fce42623          	sw	a4,-52(s0)
     57a:	fcf048e3          	bgtz	a5,54a <memmove+0x82>
  }
  return vdst;
     57e:	fd843783          	ld	a5,-40(s0)
}
     582:	853e                	mv	a0,a5
     584:	7462                	ld	s0,56(sp)
     586:	6121                	addi	sp,sp,64
     588:	8082                	ret

000000000000058a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     58a:	7139                	addi	sp,sp,-64
     58c:	fc22                	sd	s0,56(sp)
     58e:	0080                	addi	s0,sp,64
     590:	fca43c23          	sd	a0,-40(s0)
     594:	fcb43823          	sd	a1,-48(s0)
     598:	87b2                	mv	a5,a2
     59a:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
     59e:	fd843783          	ld	a5,-40(s0)
     5a2:	fef43423          	sd	a5,-24(s0)
     5a6:	fd043783          	ld	a5,-48(s0)
     5aa:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     5ae:	a0a1                	j	5f6 <memcmp+0x6c>
    if (*p1 != *p2) {
     5b0:	fe843783          	ld	a5,-24(s0)
     5b4:	0007c703          	lbu	a4,0(a5)
     5b8:	fe043783          	ld	a5,-32(s0)
     5bc:	0007c783          	lbu	a5,0(a5)
     5c0:	02f70163          	beq	a4,a5,5e2 <memcmp+0x58>
      return *p1 - *p2;
     5c4:	fe843783          	ld	a5,-24(s0)
     5c8:	0007c783          	lbu	a5,0(a5)
     5cc:	0007871b          	sext.w	a4,a5
     5d0:	fe043783          	ld	a5,-32(s0)
     5d4:	0007c783          	lbu	a5,0(a5)
     5d8:	2781                	sext.w	a5,a5
     5da:	40f707bb          	subw	a5,a4,a5
     5de:	2781                	sext.w	a5,a5
     5e0:	a01d                	j	606 <memcmp+0x7c>
    }
    p1++;
     5e2:	fe843783          	ld	a5,-24(s0)
     5e6:	0785                	addi	a5,a5,1
     5e8:	fef43423          	sd	a5,-24(s0)
    p2++;
     5ec:	fe043783          	ld	a5,-32(s0)
     5f0:	0785                	addi	a5,a5,1
     5f2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
     5f6:	fcc42783          	lw	a5,-52(s0)
     5fa:	fff7871b          	addiw	a4,a5,-1
     5fe:	fce42623          	sw	a4,-52(s0)
     602:	f7dd                	bnez	a5,5b0 <memcmp+0x26>
  }
  return 0;
     604:	4781                	li	a5,0
}
     606:	853e                	mv	a0,a5
     608:	7462                	ld	s0,56(sp)
     60a:	6121                	addi	sp,sp,64
     60c:	8082                	ret

000000000000060e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     60e:	7179                	addi	sp,sp,-48
     610:	f406                	sd	ra,40(sp)
     612:	f022                	sd	s0,32(sp)
     614:	1800                	addi	s0,sp,48
     616:	fea43423          	sd	a0,-24(s0)
     61a:	feb43023          	sd	a1,-32(s0)
     61e:	87b2                	mv	a5,a2
     620:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
     624:	fdc42783          	lw	a5,-36(s0)
     628:	863e                	mv	a2,a5
     62a:	fe043583          	ld	a1,-32(s0)
     62e:	fe843503          	ld	a0,-24(s0)
     632:	00000097          	auipc	ra,0x0
     636:	e96080e7          	jalr	-362(ra) # 4c8 <memmove>
     63a:	87aa                	mv	a5,a0
}
     63c:	853e                	mv	a0,a5
     63e:	70a2                	ld	ra,40(sp)
     640:	7402                	ld	s0,32(sp)
     642:	6145                	addi	sp,sp,48
     644:	8082                	ret

0000000000000646 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     646:	4885                	li	a7,1
 ecall
     648:	00000073          	ecall
 ret
     64c:	8082                	ret

000000000000064e <exit>:
.global exit
exit:
 li a7, SYS_exit
     64e:	4889                	li	a7,2
 ecall
     650:	00000073          	ecall
 ret
     654:	8082                	ret

0000000000000656 <wait>:
.global wait
wait:
 li a7, SYS_wait
     656:	488d                	li	a7,3
 ecall
     658:	00000073          	ecall
 ret
     65c:	8082                	ret

000000000000065e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     65e:	4891                	li	a7,4
 ecall
     660:	00000073          	ecall
 ret
     664:	8082                	ret

0000000000000666 <read>:
.global read
read:
 li a7, SYS_read
     666:	4895                	li	a7,5
 ecall
     668:	00000073          	ecall
 ret
     66c:	8082                	ret

000000000000066e <write>:
.global write
write:
 li a7, SYS_write
     66e:	48c1                	li	a7,16
 ecall
     670:	00000073          	ecall
 ret
     674:	8082                	ret

0000000000000676 <close>:
.global close
close:
 li a7, SYS_close
     676:	48d5                	li	a7,21
 ecall
     678:	00000073          	ecall
 ret
     67c:	8082                	ret

000000000000067e <kill>:
.global kill
kill:
 li a7, SYS_kill
     67e:	4899                	li	a7,6
 ecall
     680:	00000073          	ecall
 ret
     684:	8082                	ret

0000000000000686 <exec>:
.global exec
exec:
 li a7, SYS_exec
     686:	489d                	li	a7,7
 ecall
     688:	00000073          	ecall
 ret
     68c:	8082                	ret

000000000000068e <open>:
.global open
open:
 li a7, SYS_open
     68e:	48bd                	li	a7,15
 ecall
     690:	00000073          	ecall
 ret
     694:	8082                	ret

0000000000000696 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     696:	48c5                	li	a7,17
 ecall
     698:	00000073          	ecall
 ret
     69c:	8082                	ret

000000000000069e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     69e:	48c9                	li	a7,18
 ecall
     6a0:	00000073          	ecall
 ret
     6a4:	8082                	ret

00000000000006a6 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     6a6:	48a1                	li	a7,8
 ecall
     6a8:	00000073          	ecall
 ret
     6ac:	8082                	ret

00000000000006ae <link>:
.global link
link:
 li a7, SYS_link
     6ae:	48cd                	li	a7,19
 ecall
     6b0:	00000073          	ecall
 ret
     6b4:	8082                	ret

00000000000006b6 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     6b6:	48d1                	li	a7,20
 ecall
     6b8:	00000073          	ecall
 ret
     6bc:	8082                	ret

00000000000006be <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     6be:	48a5                	li	a7,9
 ecall
     6c0:	00000073          	ecall
 ret
     6c4:	8082                	ret

00000000000006c6 <dup>:
.global dup
dup:
 li a7, SYS_dup
     6c6:	48a9                	li	a7,10
 ecall
     6c8:	00000073          	ecall
 ret
     6cc:	8082                	ret

00000000000006ce <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     6ce:	48ad                	li	a7,11
 ecall
     6d0:	00000073          	ecall
 ret
     6d4:	8082                	ret

00000000000006d6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     6d6:	48b1                	li	a7,12
 ecall
     6d8:	00000073          	ecall
 ret
     6dc:	8082                	ret

00000000000006de <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     6de:	48b5                	li	a7,13
 ecall
     6e0:	00000073          	ecall
 ret
     6e4:	8082                	ret

00000000000006e6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     6e6:	48b9                	li	a7,14
 ecall
     6e8:	00000073          	ecall
 ret
     6ec:	8082                	ret

00000000000006ee <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     6ee:	48d9                	li	a7,22
 ecall
     6f0:	00000073          	ecall
 ret
     6f4:	8082                	ret

00000000000006f6 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     6f6:	48dd                	li	a7,23
 ecall
     6f8:	00000073          	ecall
 ret
     6fc:	8082                	ret

00000000000006fe <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     6fe:	48e1                	li	a7,24
 ecall
     700:	00000073          	ecall
 ret
     704:	8082                	ret

0000000000000706 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     706:	1101                	addi	sp,sp,-32
     708:	ec06                	sd	ra,24(sp)
     70a:	e822                	sd	s0,16(sp)
     70c:	1000                	addi	s0,sp,32
     70e:	87aa                	mv	a5,a0
     710:	872e                	mv	a4,a1
     712:	fef42623          	sw	a5,-20(s0)
     716:	87ba                	mv	a5,a4
     718:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
     71c:	feb40713          	addi	a4,s0,-21
     720:	fec42783          	lw	a5,-20(s0)
     724:	4605                	li	a2,1
     726:	85ba                	mv	a1,a4
     728:	853e                	mv	a0,a5
     72a:	00000097          	auipc	ra,0x0
     72e:	f44080e7          	jalr	-188(ra) # 66e <write>
}
     732:	0001                	nop
     734:	60e2                	ld	ra,24(sp)
     736:	6442                	ld	s0,16(sp)
     738:	6105                	addi	sp,sp,32
     73a:	8082                	ret

000000000000073c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     73c:	7139                	addi	sp,sp,-64
     73e:	fc06                	sd	ra,56(sp)
     740:	f822                	sd	s0,48(sp)
     742:	0080                	addi	s0,sp,64
     744:	87aa                	mv	a5,a0
     746:	8736                	mv	a4,a3
     748:	fcf42623          	sw	a5,-52(s0)
     74c:	87ae                	mv	a5,a1
     74e:	fcf42423          	sw	a5,-56(s0)
     752:	87b2                	mv	a5,a2
     754:	fcf42223          	sw	a5,-60(s0)
     758:	87ba                	mv	a5,a4
     75a:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     75e:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
     762:	fc042783          	lw	a5,-64(s0)
     766:	2781                	sext.w	a5,a5
     768:	c38d                	beqz	a5,78a <printint+0x4e>
     76a:	fc842783          	lw	a5,-56(s0)
     76e:	2781                	sext.w	a5,a5
     770:	0007dd63          	bgez	a5,78a <printint+0x4e>
    neg = 1;
     774:	4785                	li	a5,1
     776:	fef42423          	sw	a5,-24(s0)
    x = -xx;
     77a:	fc842783          	lw	a5,-56(s0)
     77e:	40f007bb          	negw	a5,a5
     782:	2781                	sext.w	a5,a5
     784:	fef42223          	sw	a5,-28(s0)
     788:	a029                	j	792 <printint+0x56>
  } else {
    x = xx;
     78a:	fc842783          	lw	a5,-56(s0)
     78e:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
     792:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
     796:	fc442783          	lw	a5,-60(s0)
     79a:	fe442703          	lw	a4,-28(s0)
     79e:	02f777bb          	remuw	a5,a4,a5
     7a2:	0007861b          	sext.w	a2,a5
     7a6:	fec42783          	lw	a5,-20(s0)
     7aa:	0017871b          	addiw	a4,a5,1
     7ae:	fee42623          	sw	a4,-20(s0)
     7b2:	00002697          	auipc	a3,0x2
     7b6:	c6668693          	addi	a3,a3,-922 # 2418 <digits>
     7ba:	02061713          	slli	a4,a2,0x20
     7be:	9301                	srli	a4,a4,0x20
     7c0:	9736                	add	a4,a4,a3
     7c2:	00074703          	lbu	a4,0(a4)
     7c6:	ff040693          	addi	a3,s0,-16
     7ca:	97b6                	add	a5,a5,a3
     7cc:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
     7d0:	fc442783          	lw	a5,-60(s0)
     7d4:	fe442703          	lw	a4,-28(s0)
     7d8:	02f757bb          	divuw	a5,a4,a5
     7dc:	fef42223          	sw	a5,-28(s0)
     7e0:	fe442783          	lw	a5,-28(s0)
     7e4:	2781                	sext.w	a5,a5
     7e6:	fbc5                	bnez	a5,796 <printint+0x5a>
  if(neg)
     7e8:	fe842783          	lw	a5,-24(s0)
     7ec:	2781                	sext.w	a5,a5
     7ee:	cf95                	beqz	a5,82a <printint+0xee>
    buf[i++] = '-';
     7f0:	fec42783          	lw	a5,-20(s0)
     7f4:	0017871b          	addiw	a4,a5,1
     7f8:	fee42623          	sw	a4,-20(s0)
     7fc:	ff040713          	addi	a4,s0,-16
     800:	97ba                	add	a5,a5,a4
     802:	02d00713          	li	a4,45
     806:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
     80a:	a005                	j	82a <printint+0xee>
    putc(fd, buf[i]);
     80c:	fec42783          	lw	a5,-20(s0)
     810:	ff040713          	addi	a4,s0,-16
     814:	97ba                	add	a5,a5,a4
     816:	fe07c703          	lbu	a4,-32(a5)
     81a:	fcc42783          	lw	a5,-52(s0)
     81e:	85ba                	mv	a1,a4
     820:	853e                	mv	a0,a5
     822:	00000097          	auipc	ra,0x0
     826:	ee4080e7          	jalr	-284(ra) # 706 <putc>
  while(--i >= 0)
     82a:	fec42783          	lw	a5,-20(s0)
     82e:	37fd                	addiw	a5,a5,-1
     830:	fef42623          	sw	a5,-20(s0)
     834:	fec42783          	lw	a5,-20(s0)
     838:	2781                	sext.w	a5,a5
     83a:	fc07d9e3          	bgez	a5,80c <printint+0xd0>
}
     83e:	0001                	nop
     840:	0001                	nop
     842:	70e2                	ld	ra,56(sp)
     844:	7442                	ld	s0,48(sp)
     846:	6121                	addi	sp,sp,64
     848:	8082                	ret

000000000000084a <printptr>:

static void
printptr(int fd, uint64 x) {
     84a:	7179                	addi	sp,sp,-48
     84c:	f406                	sd	ra,40(sp)
     84e:	f022                	sd	s0,32(sp)
     850:	1800                	addi	s0,sp,48
     852:	87aa                	mv	a5,a0
     854:	fcb43823          	sd	a1,-48(s0)
     858:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
     85c:	fdc42783          	lw	a5,-36(s0)
     860:	03000593          	li	a1,48
     864:	853e                	mv	a0,a5
     866:	00000097          	auipc	ra,0x0
     86a:	ea0080e7          	jalr	-352(ra) # 706 <putc>
  putc(fd, 'x');
     86e:	fdc42783          	lw	a5,-36(s0)
     872:	07800593          	li	a1,120
     876:	853e                	mv	a0,a5
     878:	00000097          	auipc	ra,0x0
     87c:	e8e080e7          	jalr	-370(ra) # 706 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     880:	fe042623          	sw	zero,-20(s0)
     884:	a82d                	j	8be <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     886:	fd043783          	ld	a5,-48(s0)
     88a:	93f1                	srli	a5,a5,0x3c
     88c:	00002717          	auipc	a4,0x2
     890:	b8c70713          	addi	a4,a4,-1140 # 2418 <digits>
     894:	97ba                	add	a5,a5,a4
     896:	0007c703          	lbu	a4,0(a5)
     89a:	fdc42783          	lw	a5,-36(s0)
     89e:	85ba                	mv	a1,a4
     8a0:	853e                	mv	a0,a5
     8a2:	00000097          	auipc	ra,0x0
     8a6:	e64080e7          	jalr	-412(ra) # 706 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     8aa:	fec42783          	lw	a5,-20(s0)
     8ae:	2785                	addiw	a5,a5,1
     8b0:	fef42623          	sw	a5,-20(s0)
     8b4:	fd043783          	ld	a5,-48(s0)
     8b8:	0792                	slli	a5,a5,0x4
     8ba:	fcf43823          	sd	a5,-48(s0)
     8be:	fec42783          	lw	a5,-20(s0)
     8c2:	873e                	mv	a4,a5
     8c4:	47bd                	li	a5,15
     8c6:	fce7f0e3          	bgeu	a5,a4,886 <printptr+0x3c>
}
     8ca:	0001                	nop
     8cc:	0001                	nop
     8ce:	70a2                	ld	ra,40(sp)
     8d0:	7402                	ld	s0,32(sp)
     8d2:	6145                	addi	sp,sp,48
     8d4:	8082                	ret

00000000000008d6 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     8d6:	715d                	addi	sp,sp,-80
     8d8:	e486                	sd	ra,72(sp)
     8da:	e0a2                	sd	s0,64(sp)
     8dc:	0880                	addi	s0,sp,80
     8de:	87aa                	mv	a5,a0
     8e0:	fcb43023          	sd	a1,-64(s0)
     8e4:	fac43c23          	sd	a2,-72(s0)
     8e8:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
     8ec:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     8f0:	fe042223          	sw	zero,-28(s0)
     8f4:	a42d                	j	b1e <vprintf+0x248>
    c = fmt[i] & 0xff;
     8f6:	fe442783          	lw	a5,-28(s0)
     8fa:	fc043703          	ld	a4,-64(s0)
     8fe:	97ba                	add	a5,a5,a4
     900:	0007c783          	lbu	a5,0(a5)
     904:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
     908:	fe042783          	lw	a5,-32(s0)
     90c:	2781                	sext.w	a5,a5
     90e:	eb9d                	bnez	a5,944 <vprintf+0x6e>
      if(c == '%'){
     910:	fdc42783          	lw	a5,-36(s0)
     914:	0007871b          	sext.w	a4,a5
     918:	02500793          	li	a5,37
     91c:	00f71763          	bne	a4,a5,92a <vprintf+0x54>
        state = '%';
     920:	02500793          	li	a5,37
     924:	fef42023          	sw	a5,-32(s0)
     928:	a2f5                	j	b14 <vprintf+0x23e>
      } else {
        putc(fd, c);
     92a:	fdc42783          	lw	a5,-36(s0)
     92e:	0ff7f713          	andi	a4,a5,255
     932:	fcc42783          	lw	a5,-52(s0)
     936:	85ba                	mv	a1,a4
     938:	853e                	mv	a0,a5
     93a:	00000097          	auipc	ra,0x0
     93e:	dcc080e7          	jalr	-564(ra) # 706 <putc>
     942:	aac9                	j	b14 <vprintf+0x23e>
      }
    } else if(state == '%'){
     944:	fe042783          	lw	a5,-32(s0)
     948:	0007871b          	sext.w	a4,a5
     94c:	02500793          	li	a5,37
     950:	1cf71263          	bne	a4,a5,b14 <vprintf+0x23e>
      if(c == 'd'){
     954:	fdc42783          	lw	a5,-36(s0)
     958:	0007871b          	sext.w	a4,a5
     95c:	06400793          	li	a5,100
     960:	02f71463          	bne	a4,a5,988 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
     964:	fb843783          	ld	a5,-72(s0)
     968:	00878713          	addi	a4,a5,8
     96c:	fae43c23          	sd	a4,-72(s0)
     970:	4398                	lw	a4,0(a5)
     972:	fcc42783          	lw	a5,-52(s0)
     976:	4685                	li	a3,1
     978:	4629                	li	a2,10
     97a:	85ba                	mv	a1,a4
     97c:	853e                	mv	a0,a5
     97e:	00000097          	auipc	ra,0x0
     982:	dbe080e7          	jalr	-578(ra) # 73c <printint>
     986:	a269                	j	b10 <vprintf+0x23a>
      } else if(c == 'l') {
     988:	fdc42783          	lw	a5,-36(s0)
     98c:	0007871b          	sext.w	a4,a5
     990:	06c00793          	li	a5,108
     994:	02f71663          	bne	a4,a5,9c0 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
     998:	fb843783          	ld	a5,-72(s0)
     99c:	00878713          	addi	a4,a5,8
     9a0:	fae43c23          	sd	a4,-72(s0)
     9a4:	639c                	ld	a5,0(a5)
     9a6:	0007871b          	sext.w	a4,a5
     9aa:	fcc42783          	lw	a5,-52(s0)
     9ae:	4681                	li	a3,0
     9b0:	4629                	li	a2,10
     9b2:	85ba                	mv	a1,a4
     9b4:	853e                	mv	a0,a5
     9b6:	00000097          	auipc	ra,0x0
     9ba:	d86080e7          	jalr	-634(ra) # 73c <printint>
     9be:	aa89                	j	b10 <vprintf+0x23a>
      } else if(c == 'x') {
     9c0:	fdc42783          	lw	a5,-36(s0)
     9c4:	0007871b          	sext.w	a4,a5
     9c8:	07800793          	li	a5,120
     9cc:	02f71463          	bne	a4,a5,9f4 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
     9d0:	fb843783          	ld	a5,-72(s0)
     9d4:	00878713          	addi	a4,a5,8
     9d8:	fae43c23          	sd	a4,-72(s0)
     9dc:	4398                	lw	a4,0(a5)
     9de:	fcc42783          	lw	a5,-52(s0)
     9e2:	4681                	li	a3,0
     9e4:	4641                	li	a2,16
     9e6:	85ba                	mv	a1,a4
     9e8:	853e                	mv	a0,a5
     9ea:	00000097          	auipc	ra,0x0
     9ee:	d52080e7          	jalr	-686(ra) # 73c <printint>
     9f2:	aa39                	j	b10 <vprintf+0x23a>
      } else if(c == 'p') {
     9f4:	fdc42783          	lw	a5,-36(s0)
     9f8:	0007871b          	sext.w	a4,a5
     9fc:	07000793          	li	a5,112
     a00:	02f71263          	bne	a4,a5,a24 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
     a04:	fb843783          	ld	a5,-72(s0)
     a08:	00878713          	addi	a4,a5,8
     a0c:	fae43c23          	sd	a4,-72(s0)
     a10:	6398                	ld	a4,0(a5)
     a12:	fcc42783          	lw	a5,-52(s0)
     a16:	85ba                	mv	a1,a4
     a18:	853e                	mv	a0,a5
     a1a:	00000097          	auipc	ra,0x0
     a1e:	e30080e7          	jalr	-464(ra) # 84a <printptr>
     a22:	a0fd                	j	b10 <vprintf+0x23a>
      } else if(c == 's'){
     a24:	fdc42783          	lw	a5,-36(s0)
     a28:	0007871b          	sext.w	a4,a5
     a2c:	07300793          	li	a5,115
     a30:	04f71c63          	bne	a4,a5,a88 <vprintf+0x1b2>
        s = va_arg(ap, char*);
     a34:	fb843783          	ld	a5,-72(s0)
     a38:	00878713          	addi	a4,a5,8
     a3c:	fae43c23          	sd	a4,-72(s0)
     a40:	639c                	ld	a5,0(a5)
     a42:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
     a46:	fe843783          	ld	a5,-24(s0)
     a4a:	eb8d                	bnez	a5,a7c <vprintf+0x1a6>
          s = "(null)";
     a4c:	00001797          	auipc	a5,0x1
     a50:	74c78793          	addi	a5,a5,1868 # 2198 <schedule_edf_cbs+0x50e>
     a54:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     a58:	a015                	j	a7c <vprintf+0x1a6>
          putc(fd, *s);
     a5a:	fe843783          	ld	a5,-24(s0)
     a5e:	0007c703          	lbu	a4,0(a5)
     a62:	fcc42783          	lw	a5,-52(s0)
     a66:	85ba                	mv	a1,a4
     a68:	853e                	mv	a0,a5
     a6a:	00000097          	auipc	ra,0x0
     a6e:	c9c080e7          	jalr	-868(ra) # 706 <putc>
          s++;
     a72:	fe843783          	ld	a5,-24(s0)
     a76:	0785                	addi	a5,a5,1
     a78:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
     a7c:	fe843783          	ld	a5,-24(s0)
     a80:	0007c783          	lbu	a5,0(a5)
     a84:	fbf9                	bnez	a5,a5a <vprintf+0x184>
     a86:	a069                	j	b10 <vprintf+0x23a>
        }
      } else if(c == 'c'){
     a88:	fdc42783          	lw	a5,-36(s0)
     a8c:	0007871b          	sext.w	a4,a5
     a90:	06300793          	li	a5,99
     a94:	02f71463          	bne	a4,a5,abc <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
     a98:	fb843783          	ld	a5,-72(s0)
     a9c:	00878713          	addi	a4,a5,8
     aa0:	fae43c23          	sd	a4,-72(s0)
     aa4:	439c                	lw	a5,0(a5)
     aa6:	0ff7f713          	andi	a4,a5,255
     aaa:	fcc42783          	lw	a5,-52(s0)
     aae:	85ba                	mv	a1,a4
     ab0:	853e                	mv	a0,a5
     ab2:	00000097          	auipc	ra,0x0
     ab6:	c54080e7          	jalr	-940(ra) # 706 <putc>
     aba:	a899                	j	b10 <vprintf+0x23a>
      } else if(c == '%'){
     abc:	fdc42783          	lw	a5,-36(s0)
     ac0:	0007871b          	sext.w	a4,a5
     ac4:	02500793          	li	a5,37
     ac8:	00f71f63          	bne	a4,a5,ae6 <vprintf+0x210>
        putc(fd, c);
     acc:	fdc42783          	lw	a5,-36(s0)
     ad0:	0ff7f713          	andi	a4,a5,255
     ad4:	fcc42783          	lw	a5,-52(s0)
     ad8:	85ba                	mv	a1,a4
     ada:	853e                	mv	a0,a5
     adc:	00000097          	auipc	ra,0x0
     ae0:	c2a080e7          	jalr	-982(ra) # 706 <putc>
     ae4:	a035                	j	b10 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ae6:	fcc42783          	lw	a5,-52(s0)
     aea:	02500593          	li	a1,37
     aee:	853e                	mv	a0,a5
     af0:	00000097          	auipc	ra,0x0
     af4:	c16080e7          	jalr	-1002(ra) # 706 <putc>
        putc(fd, c);
     af8:	fdc42783          	lw	a5,-36(s0)
     afc:	0ff7f713          	andi	a4,a5,255
     b00:	fcc42783          	lw	a5,-52(s0)
     b04:	85ba                	mv	a1,a4
     b06:	853e                	mv	a0,a5
     b08:	00000097          	auipc	ra,0x0
     b0c:	bfe080e7          	jalr	-1026(ra) # 706 <putc>
      }
      state = 0;
     b10:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
     b14:	fe442783          	lw	a5,-28(s0)
     b18:	2785                	addiw	a5,a5,1
     b1a:	fef42223          	sw	a5,-28(s0)
     b1e:	fe442783          	lw	a5,-28(s0)
     b22:	fc043703          	ld	a4,-64(s0)
     b26:	97ba                	add	a5,a5,a4
     b28:	0007c783          	lbu	a5,0(a5)
     b2c:	dc0795e3          	bnez	a5,8f6 <vprintf+0x20>
    }
  }
}
     b30:	0001                	nop
     b32:	0001                	nop
     b34:	60a6                	ld	ra,72(sp)
     b36:	6406                	ld	s0,64(sp)
     b38:	6161                	addi	sp,sp,80
     b3a:	8082                	ret

0000000000000b3c <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     b3c:	7159                	addi	sp,sp,-112
     b3e:	fc06                	sd	ra,56(sp)
     b40:	f822                	sd	s0,48(sp)
     b42:	0080                	addi	s0,sp,64
     b44:	fcb43823          	sd	a1,-48(s0)
     b48:	e010                	sd	a2,0(s0)
     b4a:	e414                	sd	a3,8(s0)
     b4c:	e818                	sd	a4,16(s0)
     b4e:	ec1c                	sd	a5,24(s0)
     b50:	03043023          	sd	a6,32(s0)
     b54:	03143423          	sd	a7,40(s0)
     b58:	87aa                	mv	a5,a0
     b5a:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
     b5e:	03040793          	addi	a5,s0,48
     b62:	fcf43423          	sd	a5,-56(s0)
     b66:	fc843783          	ld	a5,-56(s0)
     b6a:	fd078793          	addi	a5,a5,-48
     b6e:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
     b72:	fe843703          	ld	a4,-24(s0)
     b76:	fdc42783          	lw	a5,-36(s0)
     b7a:	863a                	mv	a2,a4
     b7c:	fd043583          	ld	a1,-48(s0)
     b80:	853e                	mv	a0,a5
     b82:	00000097          	auipc	ra,0x0
     b86:	d54080e7          	jalr	-684(ra) # 8d6 <vprintf>
}
     b8a:	0001                	nop
     b8c:	70e2                	ld	ra,56(sp)
     b8e:	7442                	ld	s0,48(sp)
     b90:	6165                	addi	sp,sp,112
     b92:	8082                	ret

0000000000000b94 <printf>:

void
printf(const char *fmt, ...)
{
     b94:	7159                	addi	sp,sp,-112
     b96:	f406                	sd	ra,40(sp)
     b98:	f022                	sd	s0,32(sp)
     b9a:	1800                	addi	s0,sp,48
     b9c:	fca43c23          	sd	a0,-40(s0)
     ba0:	e40c                	sd	a1,8(s0)
     ba2:	e810                	sd	a2,16(s0)
     ba4:	ec14                	sd	a3,24(s0)
     ba6:	f018                	sd	a4,32(s0)
     ba8:	f41c                	sd	a5,40(s0)
     baa:	03043823          	sd	a6,48(s0)
     bae:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     bb2:	04040793          	addi	a5,s0,64
     bb6:	fcf43823          	sd	a5,-48(s0)
     bba:	fd043783          	ld	a5,-48(s0)
     bbe:	fc878793          	addi	a5,a5,-56
     bc2:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
     bc6:	fe843783          	ld	a5,-24(s0)
     bca:	863e                	mv	a2,a5
     bcc:	fd843583          	ld	a1,-40(s0)
     bd0:	4505                	li	a0,1
     bd2:	00000097          	auipc	ra,0x0
     bd6:	d04080e7          	jalr	-764(ra) # 8d6 <vprintf>
}
     bda:	0001                	nop
     bdc:	70a2                	ld	ra,40(sp)
     bde:	7402                	ld	s0,32(sp)
     be0:	6165                	addi	sp,sp,112
     be2:	8082                	ret

0000000000000be4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     be4:	7179                	addi	sp,sp,-48
     be6:	f422                	sd	s0,40(sp)
     be8:	1800                	addi	s0,sp,48
     bea:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
     bee:	fd843783          	ld	a5,-40(s0)
     bf2:	17c1                	addi	a5,a5,-16
     bf4:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     bf8:	00002797          	auipc	a5,0x2
     bfc:	88078793          	addi	a5,a5,-1920 # 2478 <freep>
     c00:	639c                	ld	a5,0(a5)
     c02:	fef43423          	sd	a5,-24(s0)
     c06:	a815                	j	c3a <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     c08:	fe843783          	ld	a5,-24(s0)
     c0c:	639c                	ld	a5,0(a5)
     c0e:	fe843703          	ld	a4,-24(s0)
     c12:	00f76f63          	bltu	a4,a5,c30 <free+0x4c>
     c16:	fe043703          	ld	a4,-32(s0)
     c1a:	fe843783          	ld	a5,-24(s0)
     c1e:	02e7eb63          	bltu	a5,a4,c54 <free+0x70>
     c22:	fe843783          	ld	a5,-24(s0)
     c26:	639c                	ld	a5,0(a5)
     c28:	fe043703          	ld	a4,-32(s0)
     c2c:	02f76463          	bltu	a4,a5,c54 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c30:	fe843783          	ld	a5,-24(s0)
     c34:	639c                	ld	a5,0(a5)
     c36:	fef43423          	sd	a5,-24(s0)
     c3a:	fe043703          	ld	a4,-32(s0)
     c3e:	fe843783          	ld	a5,-24(s0)
     c42:	fce7f3e3          	bgeu	a5,a4,c08 <free+0x24>
     c46:	fe843783          	ld	a5,-24(s0)
     c4a:	639c                	ld	a5,0(a5)
     c4c:	fe043703          	ld	a4,-32(s0)
     c50:	faf77ce3          	bgeu	a4,a5,c08 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
     c54:	fe043783          	ld	a5,-32(s0)
     c58:	479c                	lw	a5,8(a5)
     c5a:	1782                	slli	a5,a5,0x20
     c5c:	9381                	srli	a5,a5,0x20
     c5e:	0792                	slli	a5,a5,0x4
     c60:	fe043703          	ld	a4,-32(s0)
     c64:	973e                	add	a4,a4,a5
     c66:	fe843783          	ld	a5,-24(s0)
     c6a:	639c                	ld	a5,0(a5)
     c6c:	02f71763          	bne	a4,a5,c9a <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
     c70:	fe043783          	ld	a5,-32(s0)
     c74:	4798                	lw	a4,8(a5)
     c76:	fe843783          	ld	a5,-24(s0)
     c7a:	639c                	ld	a5,0(a5)
     c7c:	479c                	lw	a5,8(a5)
     c7e:	9fb9                	addw	a5,a5,a4
     c80:	0007871b          	sext.w	a4,a5
     c84:	fe043783          	ld	a5,-32(s0)
     c88:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
     c8a:	fe843783          	ld	a5,-24(s0)
     c8e:	639c                	ld	a5,0(a5)
     c90:	6398                	ld	a4,0(a5)
     c92:	fe043783          	ld	a5,-32(s0)
     c96:	e398                	sd	a4,0(a5)
     c98:	a039                	j	ca6 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
     c9a:	fe843783          	ld	a5,-24(s0)
     c9e:	6398                	ld	a4,0(a5)
     ca0:	fe043783          	ld	a5,-32(s0)
     ca4:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
     ca6:	fe843783          	ld	a5,-24(s0)
     caa:	479c                	lw	a5,8(a5)
     cac:	1782                	slli	a5,a5,0x20
     cae:	9381                	srli	a5,a5,0x20
     cb0:	0792                	slli	a5,a5,0x4
     cb2:	fe843703          	ld	a4,-24(s0)
     cb6:	97ba                	add	a5,a5,a4
     cb8:	fe043703          	ld	a4,-32(s0)
     cbc:	02f71563          	bne	a4,a5,ce6 <free+0x102>
    p->s.size += bp->s.size;
     cc0:	fe843783          	ld	a5,-24(s0)
     cc4:	4798                	lw	a4,8(a5)
     cc6:	fe043783          	ld	a5,-32(s0)
     cca:	479c                	lw	a5,8(a5)
     ccc:	9fb9                	addw	a5,a5,a4
     cce:	0007871b          	sext.w	a4,a5
     cd2:	fe843783          	ld	a5,-24(s0)
     cd6:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
     cd8:	fe043783          	ld	a5,-32(s0)
     cdc:	6398                	ld	a4,0(a5)
     cde:	fe843783          	ld	a5,-24(s0)
     ce2:	e398                	sd	a4,0(a5)
     ce4:	a031                	j	cf0 <free+0x10c>
  } else
    p->s.ptr = bp;
     ce6:	fe843783          	ld	a5,-24(s0)
     cea:	fe043703          	ld	a4,-32(s0)
     cee:	e398                	sd	a4,0(a5)
  freep = p;
     cf0:	00001797          	auipc	a5,0x1
     cf4:	78878793          	addi	a5,a5,1928 # 2478 <freep>
     cf8:	fe843703          	ld	a4,-24(s0)
     cfc:	e398                	sd	a4,0(a5)
}
     cfe:	0001                	nop
     d00:	7422                	ld	s0,40(sp)
     d02:	6145                	addi	sp,sp,48
     d04:	8082                	ret

0000000000000d06 <morecore>:

static Header*
morecore(uint nu)
{
     d06:	7179                	addi	sp,sp,-48
     d08:	f406                	sd	ra,40(sp)
     d0a:	f022                	sd	s0,32(sp)
     d0c:	1800                	addi	s0,sp,48
     d0e:	87aa                	mv	a5,a0
     d10:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
     d14:	fdc42783          	lw	a5,-36(s0)
     d18:	0007871b          	sext.w	a4,a5
     d1c:	6785                	lui	a5,0x1
     d1e:	00f77563          	bgeu	a4,a5,d28 <morecore+0x22>
    nu = 4096;
     d22:	6785                	lui	a5,0x1
     d24:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
     d28:	fdc42783          	lw	a5,-36(s0)
     d2c:	0047979b          	slliw	a5,a5,0x4
     d30:	2781                	sext.w	a5,a5
     d32:	2781                	sext.w	a5,a5
     d34:	853e                	mv	a0,a5
     d36:	00000097          	auipc	ra,0x0
     d3a:	9a0080e7          	jalr	-1632(ra) # 6d6 <sbrk>
     d3e:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
     d42:	fe843703          	ld	a4,-24(s0)
     d46:	57fd                	li	a5,-1
     d48:	00f71463          	bne	a4,a5,d50 <morecore+0x4a>
    return 0;
     d4c:	4781                	li	a5,0
     d4e:	a03d                	j	d7c <morecore+0x76>
  hp = (Header*)p;
     d50:	fe843783          	ld	a5,-24(s0)
     d54:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
     d58:	fe043783          	ld	a5,-32(s0)
     d5c:	fdc42703          	lw	a4,-36(s0)
     d60:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
     d62:	fe043783          	ld	a5,-32(s0)
     d66:	07c1                	addi	a5,a5,16
     d68:	853e                	mv	a0,a5
     d6a:	00000097          	auipc	ra,0x0
     d6e:	e7a080e7          	jalr	-390(ra) # be4 <free>
  return freep;
     d72:	00001797          	auipc	a5,0x1
     d76:	70678793          	addi	a5,a5,1798 # 2478 <freep>
     d7a:	639c                	ld	a5,0(a5)
}
     d7c:	853e                	mv	a0,a5
     d7e:	70a2                	ld	ra,40(sp)
     d80:	7402                	ld	s0,32(sp)
     d82:	6145                	addi	sp,sp,48
     d84:	8082                	ret

0000000000000d86 <malloc>:

void*
malloc(uint nbytes)
{
     d86:	7139                	addi	sp,sp,-64
     d88:	fc06                	sd	ra,56(sp)
     d8a:	f822                	sd	s0,48(sp)
     d8c:	0080                	addi	s0,sp,64
     d8e:	87aa                	mv	a5,a0
     d90:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     d94:	fcc46783          	lwu	a5,-52(s0)
     d98:	07bd                	addi	a5,a5,15
     d9a:	8391                	srli	a5,a5,0x4
     d9c:	2781                	sext.w	a5,a5
     d9e:	2785                	addiw	a5,a5,1
     da0:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
     da4:	00001797          	auipc	a5,0x1
     da8:	6d478793          	addi	a5,a5,1748 # 2478 <freep>
     dac:	639c                	ld	a5,0(a5)
     dae:	fef43023          	sd	a5,-32(s0)
     db2:	fe043783          	ld	a5,-32(s0)
     db6:	ef95                	bnez	a5,df2 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
     db8:	00001797          	auipc	a5,0x1
     dbc:	6b078793          	addi	a5,a5,1712 # 2468 <base>
     dc0:	fef43023          	sd	a5,-32(s0)
     dc4:	00001797          	auipc	a5,0x1
     dc8:	6b478793          	addi	a5,a5,1716 # 2478 <freep>
     dcc:	fe043703          	ld	a4,-32(s0)
     dd0:	e398                	sd	a4,0(a5)
     dd2:	00001797          	auipc	a5,0x1
     dd6:	6a678793          	addi	a5,a5,1702 # 2478 <freep>
     dda:	6398                	ld	a4,0(a5)
     ddc:	00001797          	auipc	a5,0x1
     de0:	68c78793          	addi	a5,a5,1676 # 2468 <base>
     de4:	e398                	sd	a4,0(a5)
    base.s.size = 0;
     de6:	00001797          	auipc	a5,0x1
     dea:	68278793          	addi	a5,a5,1666 # 2468 <base>
     dee:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     df2:	fe043783          	ld	a5,-32(s0)
     df6:	639c                	ld	a5,0(a5)
     df8:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     dfc:	fe843783          	ld	a5,-24(s0)
     e00:	4798                	lw	a4,8(a5)
     e02:	fdc42783          	lw	a5,-36(s0)
     e06:	2781                	sext.w	a5,a5
     e08:	06f76863          	bltu	a4,a5,e78 <malloc+0xf2>
      if(p->s.size == nunits)
     e0c:	fe843783          	ld	a5,-24(s0)
     e10:	4798                	lw	a4,8(a5)
     e12:	fdc42783          	lw	a5,-36(s0)
     e16:	2781                	sext.w	a5,a5
     e18:	00e79963          	bne	a5,a4,e2a <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
     e1c:	fe843783          	ld	a5,-24(s0)
     e20:	6398                	ld	a4,0(a5)
     e22:	fe043783          	ld	a5,-32(s0)
     e26:	e398                	sd	a4,0(a5)
     e28:	a82d                	j	e62 <malloc+0xdc>
      else {
        p->s.size -= nunits;
     e2a:	fe843783          	ld	a5,-24(s0)
     e2e:	4798                	lw	a4,8(a5)
     e30:	fdc42783          	lw	a5,-36(s0)
     e34:	40f707bb          	subw	a5,a4,a5
     e38:	0007871b          	sext.w	a4,a5
     e3c:	fe843783          	ld	a5,-24(s0)
     e40:	c798                	sw	a4,8(a5)
        p += p->s.size;
     e42:	fe843783          	ld	a5,-24(s0)
     e46:	479c                	lw	a5,8(a5)
     e48:	1782                	slli	a5,a5,0x20
     e4a:	9381                	srli	a5,a5,0x20
     e4c:	0792                	slli	a5,a5,0x4
     e4e:	fe843703          	ld	a4,-24(s0)
     e52:	97ba                	add	a5,a5,a4
     e54:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
     e58:	fe843783          	ld	a5,-24(s0)
     e5c:	fdc42703          	lw	a4,-36(s0)
     e60:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
     e62:	00001797          	auipc	a5,0x1
     e66:	61678793          	addi	a5,a5,1558 # 2478 <freep>
     e6a:	fe043703          	ld	a4,-32(s0)
     e6e:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
     e70:	fe843783          	ld	a5,-24(s0)
     e74:	07c1                	addi	a5,a5,16
     e76:	a091                	j	eba <malloc+0x134>
    }
    if(p == freep)
     e78:	00001797          	auipc	a5,0x1
     e7c:	60078793          	addi	a5,a5,1536 # 2478 <freep>
     e80:	639c                	ld	a5,0(a5)
     e82:	fe843703          	ld	a4,-24(s0)
     e86:	02f71063          	bne	a4,a5,ea6 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
     e8a:	fdc42783          	lw	a5,-36(s0)
     e8e:	853e                	mv	a0,a5
     e90:	00000097          	auipc	ra,0x0
     e94:	e76080e7          	jalr	-394(ra) # d06 <morecore>
     e98:	fea43423          	sd	a0,-24(s0)
     e9c:	fe843783          	ld	a5,-24(s0)
     ea0:	e399                	bnez	a5,ea6 <malloc+0x120>
        return 0;
     ea2:	4781                	li	a5,0
     ea4:	a819                	j	eba <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     ea6:	fe843783          	ld	a5,-24(s0)
     eaa:	fef43023          	sd	a5,-32(s0)
     eae:	fe843783          	ld	a5,-24(s0)
     eb2:	639c                	ld	a5,0(a5)
     eb4:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
     eb8:	b791                	j	dfc <malloc+0x76>
  }
}
     eba:	853e                	mv	a0,a5
     ebc:	70e2                	ld	ra,56(sp)
     ebe:	7442                	ld	s0,48(sp)
     ec0:	6121                	addi	sp,sp,64
     ec2:	8082                	ret

0000000000000ec4 <setjmp>:
     ec4:	e100                	sd	s0,0(a0)
     ec6:	e504                	sd	s1,8(a0)
     ec8:	01253823          	sd	s2,16(a0)
     ecc:	01353c23          	sd	s3,24(a0)
     ed0:	03453023          	sd	s4,32(a0)
     ed4:	03553423          	sd	s5,40(a0)
     ed8:	03653823          	sd	s6,48(a0)
     edc:	03753c23          	sd	s7,56(a0)
     ee0:	05853023          	sd	s8,64(a0)
     ee4:	05953423          	sd	s9,72(a0)
     ee8:	05a53823          	sd	s10,80(a0)
     eec:	05b53c23          	sd	s11,88(a0)
     ef0:	06153023          	sd	ra,96(a0)
     ef4:	06253423          	sd	sp,104(a0)
     ef8:	4501                	li	a0,0
     efa:	8082                	ret

0000000000000efc <longjmp>:
     efc:	6100                	ld	s0,0(a0)
     efe:	6504                	ld	s1,8(a0)
     f00:	01053903          	ld	s2,16(a0)
     f04:	01853983          	ld	s3,24(a0)
     f08:	02053a03          	ld	s4,32(a0)
     f0c:	02853a83          	ld	s5,40(a0)
     f10:	03053b03          	ld	s6,48(a0)
     f14:	03853b83          	ld	s7,56(a0)
     f18:	04053c03          	ld	s8,64(a0)
     f1c:	04853c83          	ld	s9,72(a0)
     f20:	05053d03          	ld	s10,80(a0)
     f24:	05853d83          	ld	s11,88(a0)
     f28:	06053083          	ld	ra,96(a0)
     f2c:	06853103          	ld	sp,104(a0)
     f30:	c199                	beqz	a1,f36 <longjmp_1>
     f32:	852e                	mv	a0,a1
     f34:	8082                	ret

0000000000000f36 <longjmp_1>:
     f36:	4505                	li	a0,1
     f38:	8082                	ret

0000000000000f3a <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     f3a:	7179                	addi	sp,sp,-48
     f3c:	f422                	sd	s0,40(sp)
     f3e:	1800                	addi	s0,sp,48
     f40:	fea43423          	sd	a0,-24(s0)
     f44:	feb43023          	sd	a1,-32(s0)
     f48:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
     f4c:	fd843783          	ld	a5,-40(s0)
     f50:	fe843703          	ld	a4,-24(s0)
     f54:	e798                	sd	a4,8(a5)
     new_entry->next = next;
     f56:	fe843783          	ld	a5,-24(s0)
     f5a:	fd843703          	ld	a4,-40(s0)
     f5e:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
     f60:	fe843783          	ld	a5,-24(s0)
     f64:	fe043703          	ld	a4,-32(s0)
     f68:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
     f6a:	fe043783          	ld	a5,-32(s0)
     f6e:	fe843703          	ld	a4,-24(s0)
     f72:	e398                	sd	a4,0(a5)
 }
     f74:	0001                	nop
     f76:	7422                	ld	s0,40(sp)
     f78:	6145                	addi	sp,sp,48
     f7a:	8082                	ret

0000000000000f7c <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     f7c:	1101                	addi	sp,sp,-32
     f7e:	ec06                	sd	ra,24(sp)
     f80:	e822                	sd	s0,16(sp)
     f82:	1000                	addi	s0,sp,32
     f84:	fea43423          	sd	a0,-24(s0)
     f88:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
     f8c:	fe043783          	ld	a5,-32(s0)
     f90:	679c                	ld	a5,8(a5)
     f92:	fe043603          	ld	a2,-32(s0)
     f96:	85be                	mv	a1,a5
     f98:	fe843503          	ld	a0,-24(s0)
     f9c:	00000097          	auipc	ra,0x0
     fa0:	f9e080e7          	jalr	-98(ra) # f3a <__list_add>
 }
     fa4:	0001                	nop
     fa6:	60e2                	ld	ra,24(sp)
     fa8:	6442                	ld	s0,16(sp)
     faa:	6105                	addi	sp,sp,32
     fac:	8082                	ret

0000000000000fae <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     fae:	1101                	addi	sp,sp,-32
     fb0:	ec22                	sd	s0,24(sp)
     fb2:	1000                	addi	s0,sp,32
     fb4:	fea43423          	sd	a0,-24(s0)
     fb8:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
     fbc:	fe043783          	ld	a5,-32(s0)
     fc0:	fe843703          	ld	a4,-24(s0)
     fc4:	e798                	sd	a4,8(a5)
     prev->next = next;
     fc6:	fe843783          	ld	a5,-24(s0)
     fca:	fe043703          	ld	a4,-32(s0)
     fce:	e398                	sd	a4,0(a5)
 }
     fd0:	0001                	nop
     fd2:	6462                	ld	s0,24(sp)
     fd4:	6105                	addi	sp,sp,32
     fd6:	8082                	ret

0000000000000fd8 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     fd8:	1101                	addi	sp,sp,-32
     fda:	ec06                	sd	ra,24(sp)
     fdc:	e822                	sd	s0,16(sp)
     fde:	1000                	addi	s0,sp,32
     fe0:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
     fe4:	fe843783          	ld	a5,-24(s0)
     fe8:	6798                	ld	a4,8(a5)
     fea:	fe843783          	ld	a5,-24(s0)
     fee:	639c                	ld	a5,0(a5)
     ff0:	85be                	mv	a1,a5
     ff2:	853a                	mv	a0,a4
     ff4:	00000097          	auipc	ra,0x0
     ff8:	fba080e7          	jalr	-70(ra) # fae <__list_del>
     entry->next = LIST_POISON1;
     ffc:	fe843783          	ld	a5,-24(s0)
    1000:	00100737          	lui	a4,0x100
    1004:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd4e8>
    1008:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
    100a:	fe843783          	ld	a5,-24(s0)
    100e:	00200737          	lui	a4,0x200
    1012:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd5e8>
    1016:	e798                	sd	a4,8(a5)
 }
    1018:	0001                	nop
    101a:	60e2                	ld	ra,24(sp)
    101c:	6442                	ld	s0,16(sp)
    101e:	6105                	addi	sp,sp,32
    1020:	8082                	ret

0000000000001022 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
    1022:	1101                	addi	sp,sp,-32
    1024:	ec22                	sd	s0,24(sp)
    1026:	1000                	addi	s0,sp,32
    1028:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
    102c:	fe843783          	ld	a5,-24(s0)
    1030:	639c                	ld	a5,0(a5)
    1032:	fe843703          	ld	a4,-24(s0)
    1036:	40f707b3          	sub	a5,a4,a5
    103a:	0017b793          	seqz	a5,a5
    103e:	0ff7f793          	andi	a5,a5,255
    1042:	2781                	sext.w	a5,a5
 }
    1044:	853e                	mv	a0,a5
    1046:	6462                	ld	s0,24(sp)
    1048:	6105                	addi	sp,sp,32
    104a:	8082                	ret

000000000000104c <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
    104c:	715d                	addi	sp,sp,-80
    104e:	e486                	sd	ra,72(sp)
    1050:	e0a2                	sd	s0,64(sp)
    1052:	0880                	addi	s0,sp,80
    1054:	fca43423          	sd	a0,-56(s0)
    1058:	fcb43023          	sd	a1,-64(s0)
    105c:	85b2                	mv	a1,a2
    105e:	8636                	mv	a2,a3
    1060:	86ba                	mv	a3,a4
    1062:	873e                	mv	a4,a5
    1064:	87ae                	mv	a5,a1
    1066:	faf42e23          	sw	a5,-68(s0)
    106a:	87b2                	mv	a5,a2
    106c:	faf42c23          	sw	a5,-72(s0)
    1070:	87b6                	mv	a5,a3
    1072:	faf42a23          	sw	a5,-76(s0)
    1076:	87ba                	mv	a5,a4
    1078:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
    107c:	08000513          	li	a0,128
    1080:	00000097          	auipc	ra,0x0
    1084:	d06080e7          	jalr	-762(ra) # d86 <malloc>
    1088:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
    108c:	6505                	lui	a0,0x1
    108e:	00000097          	auipc	ra,0x0
    1092:	cf8080e7          	jalr	-776(ra) # d86 <malloc>
    1096:	87aa                	mv	a5,a0
    1098:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
    109c:	fe043703          	ld	a4,-32(s0)
    10a0:	6785                	lui	a5,0x1
    10a2:	17c1                	addi	a5,a5,-16
    10a4:	97ba                	add	a5,a5,a4
    10a6:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
    10aa:	fe843783          	ld	a5,-24(s0)
    10ae:	fc843703          	ld	a4,-56(s0)
    10b2:	e398                	sd	a4,0(a5)
    t->arg = arg;
    10b4:	fe843783          	ld	a5,-24(s0)
    10b8:	fc043703          	ld	a4,-64(s0)
    10bc:	e798                	sd	a4,8(a5)
    t->ID = _id++;
    10be:	00001797          	auipc	a5,0x1
    10c2:	39678793          	addi	a5,a5,918 # 2454 <_id.1241>
    10c6:	439c                	lw	a5,0(a5)
    10c8:	0017871b          	addiw	a4,a5,1
    10cc:	0007069b          	sext.w	a3,a4
    10d0:	00001717          	auipc	a4,0x1
    10d4:	38470713          	addi	a4,a4,900 # 2454 <_id.1241>
    10d8:	c314                	sw	a3,0(a4)
    10da:	fe843703          	ld	a4,-24(s0)
    10de:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    10e0:	fe843783          	ld	a5,-24(s0)
    10e4:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    10e8:	fe043703          	ld	a4,-32(s0)
    10ec:	fe843783          	ld	a5,-24(s0)
    10f0:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    10f2:	fd843703          	ld	a4,-40(s0)
    10f6:	fe843783          	ld	a5,-24(s0)
    10fa:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    10fc:	fe843783          	ld	a5,-24(s0)
    1100:	fb842703          	lw	a4,-72(s0)
    1104:	c3f8                	sw	a4,68(a5)
    t->period = period;
    1106:	fe843783          	ld	a5,-24(s0)
    110a:	fb442703          	lw	a4,-76(s0)
    110e:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
    1110:	fe843783          	ld	a5,-24(s0)
    1114:	fb442703          	lw	a4,-76(s0)
    1118:	c7b8                	sw	a4,72(a5)
    t->n = n;
    111a:	fe843783          	ld	a5,-24(s0)
    111e:	fb042703          	lw	a4,-80(s0)
    1122:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    1124:	fe843783          	ld	a5,-24(s0)
    1128:	fbc42703          	lw	a4,-68(s0)
    112c:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    112e:	fe843783          	ld	a5,-24(s0)
    1132:	fb842703          	lw	a4,-72(s0)
    1136:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    1138:	fe843783          	ld	a5,-24(s0)
    113c:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    1140:	fe843783          	ld	a5,-24(s0)
    1144:	06400713          	li	a4,100
    1148:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    114a:	fe843783          	ld	a5,-24(s0)
    114e:	671d                	lui	a4,0x7
    1150:	5307071b          	addiw	a4,a4,1328
    1154:	d3b8                	sw	a4,96(a5)
    
    return t;
    1156:	fe843783          	ld	a5,-24(s0)
}
    115a:	853e                	mv	a0,a5
    115c:	60a6                	ld	ra,72(sp)
    115e:	6406                	ld	s0,64(sp)
    1160:	6161                	addi	sp,sp,80
    1162:	8082                	ret

0000000000001164 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    1164:	1101                	addi	sp,sp,-32
    1166:	ec22                	sd	s0,24(sp)
    1168:	1000                	addi	s0,sp,32
    116a:	fea43423          	sd	a0,-24(s0)
    116e:	87ae                	mv	a5,a1
    1170:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    1174:	fe843783          	ld	a5,-24(s0)
    1178:	fe442703          	lw	a4,-28(s0)
    117c:	cff8                	sw	a4,92(a5)
}
    117e:	0001                	nop
    1180:	6462                	ld	s0,24(sp)
    1182:	6105                	addi	sp,sp,32
    1184:	8082                	ret

0000000000001186 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    1186:	1101                	addi	sp,sp,-32
    1188:	ec22                	sd	s0,24(sp)
    118a:	1000                	addi	s0,sp,32
    118c:	fea43423          	sd	a0,-24(s0)
    1190:	87ae                	mv	a5,a1
    1192:	8732                	mv	a4,a2
    1194:	fef42223          	sw	a5,-28(s0)
    1198:	87ba                	mv	a5,a4
    119a:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    119e:	fe843783          	ld	a5,-24(s0)
    11a2:	fe442703          	lw	a4,-28(s0)
    11a6:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    11a8:	fe843783          	ld	a5,-24(s0)
    11ac:	fe442703          	lw	a4,-28(s0)
    11b0:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    11b2:	fe843783          	ld	a5,-24(s0)
    11b6:	fe042703          	lw	a4,-32(s0)
    11ba:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    11bc:	fe843783          	ld	a5,-24(s0)
    11c0:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    11c4:	fe843783          	ld	a5,-24(s0)
    11c8:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    11cc:	fe843783          	ld	a5,-24(s0)
    11d0:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    11d4:	fe843783          	ld	a5,-24(s0)
    11d8:	0607ae23          	sw	zero,124(a5)
}
    11dc:	0001                	nop
    11de:	6462                	ld	s0,24(sp)
    11e0:	6105                	addi	sp,sp,32
    11e2:	8082                	ret

00000000000011e4 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    11e4:	7179                	addi	sp,sp,-48
    11e6:	f406                	sd	ra,40(sp)
    11e8:	f022                	sd	s0,32(sp)
    11ea:	1800                	addi	s0,sp,48
    11ec:	fca43c23          	sd	a0,-40(s0)
    11f0:	87ae                	mv	a5,a1
    11f2:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    11f6:	02000513          	li	a0,32
    11fa:	00000097          	auipc	ra,0x0
    11fe:	b8c080e7          	jalr	-1140(ra) # d86 <malloc>
    1202:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    1206:	fe843783          	ld	a5,-24(s0)
    120a:	fd843703          	ld	a4,-40(s0)
    120e:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    1210:	fe843783          	ld	a5,-24(s0)
    1214:	fd442703          	lw	a4,-44(s0)
    1218:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    121a:	fd843783          	ld	a5,-40(s0)
    121e:	fd442703          	lw	a4,-44(s0)
    1222:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    1224:	fd843783          	ld	a5,-40(s0)
    1228:	43bc                	lw	a5,64(a5)
    122a:	cf81                	beqz	a5,1242 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    122c:	fd843783          	ld	a5,-40(s0)
    1230:	47bc                	lw	a5,72(a5)
    1232:	fd442703          	lw	a4,-44(s0)
    1236:	9fb9                	addw	a5,a5,a4
    1238:	0007871b          	sext.w	a4,a5
    123c:	fd843783          	ld	a5,-40(s0)
    1240:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1242:	fe843783          	ld	a5,-24(s0)
    1246:	07a1                	addi	a5,a5,8
    1248:	00001597          	auipc	a1,0x1
    124c:	1f858593          	addi	a1,a1,504 # 2440 <release_queue>
    1250:	853e                	mv	a0,a5
    1252:	00000097          	auipc	ra,0x0
    1256:	d2a080e7          	jalr	-726(ra) # f7c <list_add_tail>
}
    125a:	0001                	nop
    125c:	70a2                	ld	ra,40(sp)
    125e:	7402                	ld	s0,32(sp)
    1260:	6145                	addi	sp,sp,48
    1262:	8082                	ret

0000000000001264 <__release>:

void __release()
{
    1264:	7139                	addi	sp,sp,-64
    1266:	fc06                	sd	ra,56(sp)
    1268:	f822                	sd	s0,48(sp)
    126a:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    126c:	00001797          	auipc	a5,0x1
    1270:	1d478793          	addi	a5,a5,468 # 2440 <release_queue>
    1274:	639c                	ld	a5,0(a5)
    1276:	fcf43c23          	sd	a5,-40(s0)
    127a:	fd843783          	ld	a5,-40(s0)
    127e:	17e1                	addi	a5,a5,-8
    1280:	fef43423          	sd	a5,-24(s0)
    1284:	fe843783          	ld	a5,-24(s0)
    1288:	679c                	ld	a5,8(a5)
    128a:	fcf43823          	sd	a5,-48(s0)
    128e:	fd043783          	ld	a5,-48(s0)
    1292:	17e1                	addi	a5,a5,-8
    1294:	fef43023          	sd	a5,-32(s0)
    1298:	a0e9                	j	1362 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    129a:	fe843783          	ld	a5,-24(s0)
    129e:	4f98                	lw	a4,24(a5)
    12a0:	00001797          	auipc	a5,0x1
    12a4:	1e878793          	addi	a5,a5,488 # 2488 <threading_system_time>
    12a8:	439c                	lw	a5,0(a5)
    12aa:	08e7ce63          	blt	a5,a4,1346 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    12ae:	fe843783          	ld	a5,-24(s0)
    12b2:	639c                	ld	a5,0(a5)
    12b4:	5bbc                	lw	a5,112(a5)
    12b6:	c79d                	beqz	a5,12e4 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    12b8:	fe843783          	ld	a5,-24(s0)
    12bc:	639c                	ld	a5,0(a5)
    12be:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    12c2:	fe843783          	ld	a5,-24(s0)
    12c6:	6398                	ld	a4,0(a5)
    12c8:	fe843783          	ld	a5,-24(s0)
    12cc:	639c                	ld	a5,0(a5)
    12ce:	5378                	lw	a4,100(a4)
    12d0:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    12d2:	fe843783          	ld	a5,-24(s0)
    12d6:	6398                	ld	a4,0(a5)
    12d8:	fe843783          	ld	a5,-24(s0)
    12dc:	639c                	ld	a5,0(a5)
    12de:	5f78                	lw	a4,124(a4)
    12e0:	cbf8                	sw	a4,84(a5)
    12e2:	a809                	j	12f4 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    12e4:	fe843783          	ld	a5,-24(s0)
    12e8:	6398                	ld	a4,0(a5)
    12ea:	fe843783          	ld	a5,-24(s0)
    12ee:	639c                	ld	a5,0(a5)
    12f0:	4378                	lw	a4,68(a4)
    12f2:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    12f4:	fe843783          	ld	a5,-24(s0)
    12f8:	4f94                	lw	a3,24(a5)
    12fa:	fe843783          	ld	a5,-24(s0)
    12fe:	639c                	ld	a5,0(a5)
    1300:	47b8                	lw	a4,72(a5)
    1302:	fe843783          	ld	a5,-24(s0)
    1306:	639c                	ld	a5,0(a5)
    1308:	9f35                	addw	a4,a4,a3
    130a:	2701                	sext.w	a4,a4
    130c:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    130e:	fe843783          	ld	a5,-24(s0)
    1312:	639c                	ld	a5,0(a5)
    1314:	02878793          	addi	a5,a5,40
    1318:	00001597          	auipc	a1,0x1
    131c:	11858593          	addi	a1,a1,280 # 2430 <run_queue>
    1320:	853e                	mv	a0,a5
    1322:	00000097          	auipc	ra,0x0
    1326:	c5a080e7          	jalr	-934(ra) # f7c <list_add_tail>
            list_del(&cur->thread_list);
    132a:	fe843783          	ld	a5,-24(s0)
    132e:	07a1                	addi	a5,a5,8
    1330:	853e                	mv	a0,a5
    1332:	00000097          	auipc	ra,0x0
    1336:	ca6080e7          	jalr	-858(ra) # fd8 <list_del>
            free(cur);
    133a:	fe843503          	ld	a0,-24(s0)
    133e:	00000097          	auipc	ra,0x0
    1342:	8a6080e7          	jalr	-1882(ra) # be4 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    1346:	fe043783          	ld	a5,-32(s0)
    134a:	fef43423          	sd	a5,-24(s0)
    134e:	fe043783          	ld	a5,-32(s0)
    1352:	679c                	ld	a5,8(a5)
    1354:	fcf43423          	sd	a5,-56(s0)
    1358:	fc843783          	ld	a5,-56(s0)
    135c:	17e1                	addi	a5,a5,-8
    135e:	fef43023          	sd	a5,-32(s0)
    1362:	fe843783          	ld	a5,-24(s0)
    1366:	00878713          	addi	a4,a5,8
    136a:	00001797          	auipc	a5,0x1
    136e:	0d678793          	addi	a5,a5,214 # 2440 <release_queue>
    1372:	f2f714e3          	bne	a4,a5,129a <__release+0x36>
        }
    }
}
    1376:	0001                	nop
    1378:	0001                	nop
    137a:	70e2                	ld	ra,56(sp)
    137c:	7442                	ld	s0,48(sp)
    137e:	6121                	addi	sp,sp,64
    1380:	8082                	ret

0000000000001382 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    1382:	1101                	addi	sp,sp,-32
    1384:	ec06                	sd	ra,24(sp)
    1386:	e822                	sd	s0,16(sp)
    1388:	1000                	addi	s0,sp,32
    138a:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    138e:	fe843783          	ld	a5,-24(s0)
    1392:	7b98                	ld	a4,48(a5)
    1394:	00001797          	auipc	a5,0x1
    1398:	0ec78793          	addi	a5,a5,236 # 2480 <current>
    139c:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    139e:	fe843783          	ld	a5,-24(s0)
    13a2:	02878793          	addi	a5,a5,40
    13a6:	853e                	mv	a0,a5
    13a8:	00000097          	auipc	ra,0x0
    13ac:	c30080e7          	jalr	-976(ra) # fd8 <list_del>

    free(to_remove->stack);
    13b0:	fe843783          	ld	a5,-24(s0)
    13b4:	6b9c                	ld	a5,16(a5)
    13b6:	853e                	mv	a0,a5
    13b8:	00000097          	auipc	ra,0x0
    13bc:	82c080e7          	jalr	-2004(ra) # be4 <free>
    free(to_remove);
    13c0:	fe843503          	ld	a0,-24(s0)
    13c4:	00000097          	auipc	ra,0x0
    13c8:	820080e7          	jalr	-2016(ra) # be4 <free>

    __schedule();
    13cc:	00000097          	auipc	ra,0x0
    13d0:	5e8080e7          	jalr	1512(ra) # 19b4 <__schedule>
    __dispatch();
    13d4:	00000097          	auipc	ra,0x0
    13d8:	416080e7          	jalr	1046(ra) # 17ea <__dispatch>
    thrdresume(main_thrd_id);
    13dc:	00001797          	auipc	a5,0x1
    13e0:	07478793          	addi	a5,a5,116 # 2450 <main_thrd_id>
    13e4:	439c                	lw	a5,0(a5)
    13e6:	853e                	mv	a0,a5
    13e8:	fffff097          	auipc	ra,0xfffff
    13ec:	30e080e7          	jalr	782(ra) # 6f6 <thrdresume>
}
    13f0:	0001                	nop
    13f2:	60e2                	ld	ra,24(sp)
    13f4:	6442                	ld	s0,16(sp)
    13f6:	6105                	addi	sp,sp,32
    13f8:	8082                	ret

00000000000013fa <thread_exit>:

void thread_exit(void)
{
    13fa:	7179                	addi	sp,sp,-48
    13fc:	f406                	sd	ra,40(sp)
    13fe:	f022                	sd	s0,32(sp)
    1400:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    1402:	00001797          	auipc	a5,0x1
    1406:	07e78793          	addi	a5,a5,126 # 2480 <current>
    140a:	6398                	ld	a4,0(a5)
    140c:	00001797          	auipc	a5,0x1
    1410:	02478793          	addi	a5,a5,36 # 2430 <run_queue>
    1414:	02f71063          	bne	a4,a5,1434 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    1418:	00001597          	auipc	a1,0x1
    141c:	d8858593          	addi	a1,a1,-632 # 21a0 <schedule_edf_cbs+0x516>
    1420:	4509                	li	a0,2
    1422:	fffff097          	auipc	ra,0xfffff
    1426:	71a080e7          	jalr	1818(ra) # b3c <fprintf>
        exit(1);
    142a:	4505                	li	a0,1
    142c:	fffff097          	auipc	ra,0xfffff
    1430:	222080e7          	jalr	546(ra) # 64e <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    1434:	00001797          	auipc	a5,0x1
    1438:	04c78793          	addi	a5,a5,76 # 2480 <current>
    143c:	639c                	ld	a5,0(a5)
    143e:	fef43423          	sd	a5,-24(s0)
    1442:	fe843783          	ld	a5,-24(s0)
    1446:	fd878793          	addi	a5,a5,-40
    144a:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    144e:	fe043783          	ld	a5,-32(s0)
    1452:	5f9c                	lw	a5,56(a5)
    1454:	4585                	li	a1,1
    1456:	853e                	mv	a0,a5
    1458:	fffff097          	auipc	ra,0xfffff
    145c:	2a6080e7          	jalr	678(ra) # 6fe <cancelthrdstop>
    1460:	87aa                	mv	a5,a0
    1462:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    1466:	00001797          	auipc	a5,0x1
    146a:	02278793          	addi	a5,a5,34 # 2488 <threading_system_time>
    146e:	439c                	lw	a5,0(a5)
    1470:	fdc42703          	lw	a4,-36(s0)
    1474:	9fb9                	addw	a5,a5,a4
    1476:	0007871b          	sext.w	a4,a5
    147a:	00001797          	auipc	a5,0x1
    147e:	00e78793          	addi	a5,a5,14 # 2488 <threading_system_time>
    1482:	c398                	sw	a4,0(a5)

    __release();
    1484:	00000097          	auipc	ra,0x0
    1488:	de0080e7          	jalr	-544(ra) # 1264 <__release>
    __thread_exit(to_remove);
    148c:	fe043503          	ld	a0,-32(s0)
    1490:	00000097          	auipc	ra,0x0
    1494:	ef2080e7          	jalr	-270(ra) # 1382 <__thread_exit>
}
    1498:	0001                	nop
    149a:	70a2                	ld	ra,40(sp)
    149c:	7402                	ld	s0,32(sp)
    149e:	6145                	addi	sp,sp,48
    14a0:	8082                	ret

00000000000014a2 <__finish_current>:

void __finish_current()
{
    14a2:	7179                	addi	sp,sp,-48
    14a4:	f406                	sd	ra,40(sp)
    14a6:	f022                	sd	s0,32(sp)
    14a8:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    14aa:	00001797          	auipc	a5,0x1
    14ae:	fd678793          	addi	a5,a5,-42 # 2480 <current>
    14b2:	639c                	ld	a5,0(a5)
    14b4:	fef43423          	sd	a5,-24(s0)
    14b8:	fe843783          	ld	a5,-24(s0)
    14bc:	fd878793          	addi	a5,a5,-40
    14c0:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    14c4:	fe043783          	ld	a5,-32(s0)
    14c8:	4bbc                	lw	a5,80(a5)
    14ca:	37fd                	addiw	a5,a5,-1
    14cc:	0007871b          	sext.w	a4,a5
    14d0:	fe043783          	ld	a5,-32(s0)
    14d4:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    14d6:	fe043783          	ld	a5,-32(s0)
    14da:	5fd8                	lw	a4,60(a5)
    14dc:	00001797          	auipc	a5,0x1
    14e0:	fac78793          	addi	a5,a5,-84 # 2488 <threading_system_time>
    14e4:	4390                	lw	a2,0(a5)
    14e6:	fe043783          	ld	a5,-32(s0)
    14ea:	4bbc                	lw	a5,80(a5)
    14ec:	86be                	mv	a3,a5
    14ee:	85ba                	mv	a1,a4
    14f0:	00001517          	auipc	a0,0x1
    14f4:	ce850513          	addi	a0,a0,-792 # 21d8 <schedule_edf_cbs+0x54e>
    14f8:	fffff097          	auipc	ra,0xfffff
    14fc:	69c080e7          	jalr	1692(ra) # b94 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    1500:	fe043783          	ld	a5,-32(s0)
    1504:	4bbc                	lw	a5,80(a5)
    1506:	04f05563          	blez	a5,1550 <__finish_current+0xae>
        struct list_head *to_remove = current;
    150a:	00001797          	auipc	a5,0x1
    150e:	f7678793          	addi	a5,a5,-138 # 2480 <current>
    1512:	639c                	ld	a5,0(a5)
    1514:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    1518:	00001797          	auipc	a5,0x1
    151c:	f6878793          	addi	a5,a5,-152 # 2480 <current>
    1520:	639c                	ld	a5,0(a5)
    1522:	6798                	ld	a4,8(a5)
    1524:	00001797          	auipc	a5,0x1
    1528:	f5c78793          	addi	a5,a5,-164 # 2480 <current>
    152c:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    152e:	fd843503          	ld	a0,-40(s0)
    1532:	00000097          	auipc	ra,0x0
    1536:	aa6080e7          	jalr	-1370(ra) # fd8 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    153a:	fe043783          	ld	a5,-32(s0)
    153e:	4fbc                	lw	a5,88(a5)
    1540:	85be                	mv	a1,a5
    1542:	fe043503          	ld	a0,-32(s0)
    1546:	00000097          	auipc	ra,0x0
    154a:	c9e080e7          	jalr	-866(ra) # 11e4 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    154e:	a039                	j	155c <__finish_current+0xba>
        __thread_exit(current_thread);
    1550:	fe043503          	ld	a0,-32(s0)
    1554:	00000097          	auipc	ra,0x0
    1558:	e2e080e7          	jalr	-466(ra) # 1382 <__thread_exit>
}
    155c:	0001                	nop
    155e:	70a2                	ld	ra,40(sp)
    1560:	7402                	ld	s0,32(sp)
    1562:	6145                	addi	sp,sp,48
    1564:	8082                	ret

0000000000001566 <__rt_finish_current>:
void __rt_finish_current()
{
    1566:	7179                	addi	sp,sp,-48
    1568:	f406                	sd	ra,40(sp)
    156a:	f022                	sd	s0,32(sp)
    156c:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    156e:	00001797          	auipc	a5,0x1
    1572:	f1278793          	addi	a5,a5,-238 # 2480 <current>
    1576:	639c                	ld	a5,0(a5)
    1578:	fef43423          	sd	a5,-24(s0)
    157c:	fe843783          	ld	a5,-24(s0)
    1580:	fd878793          	addi	a5,a5,-40
    1584:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    1588:	fe043783          	ld	a5,-32(s0)
    158c:	4bbc                	lw	a5,80(a5)
    158e:	37fd                	addiw	a5,a5,-1
    1590:	0007871b          	sext.w	a4,a5
    1594:	fe043783          	ld	a5,-32(s0)
    1598:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    159a:	fe043783          	ld	a5,-32(s0)
    159e:	5fd8                	lw	a4,60(a5)
    15a0:	00001797          	auipc	a5,0x1
    15a4:	ee878793          	addi	a5,a5,-280 # 2488 <threading_system_time>
    15a8:	4390                	lw	a2,0(a5)
    15aa:	fe043783          	ld	a5,-32(s0)
    15ae:	4bbc                	lw	a5,80(a5)
    15b0:	86be                	mv	a3,a5
    15b2:	85ba                	mv	a1,a4
    15b4:	00001517          	auipc	a0,0x1
    15b8:	c3c50513          	addi	a0,a0,-964 # 21f0 <schedule_edf_cbs+0x566>
    15bc:	fffff097          	auipc	ra,0xfffff
    15c0:	5d8080e7          	jalr	1496(ra) # b94 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    15c4:	fe043783          	ld	a5,-32(s0)
    15c8:	4bbc                	lw	a5,80(a5)
    15ca:	04f05f63          	blez	a5,1628 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    15ce:	00001797          	auipc	a5,0x1
    15d2:	eb278793          	addi	a5,a5,-334 # 2480 <current>
    15d6:	639c                	ld	a5,0(a5)
    15d8:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    15dc:	00001797          	auipc	a5,0x1
    15e0:	ea478793          	addi	a5,a5,-348 # 2480 <current>
    15e4:	639c                	ld	a5,0(a5)
    15e6:	6798                	ld	a4,8(a5)
    15e8:	00001797          	auipc	a5,0x1
    15ec:	e9878793          	addi	a5,a5,-360 # 2480 <current>
    15f0:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    15f2:	fd843503          	ld	a0,-40(s0)
    15f6:	00000097          	auipc	ra,0x0
    15fa:	9e2080e7          	jalr	-1566(ra) # fd8 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    15fe:	fe043783          	ld	a5,-32(s0)
    1602:	4fbc                	lw	a5,88(a5)
    1604:	85be                	mv	a1,a5
    1606:	fe043503          	ld	a0,-32(s0)
    160a:	00000097          	auipc	ra,0x0
    160e:	bda080e7          	jalr	-1062(ra) # 11e4 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    1612:	fe043783          	ld	a5,-32(s0)
    1616:	57fc                	lw	a5,108(a5)
    1618:	ef91                	bnez	a5,1634 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    161a:	fe043783          	ld	a5,-32(s0)
    161e:	53f8                	lw	a4,100(a5)
    1620:	fe043783          	ld	a5,-32(s0)
    1624:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    1626:	a039                	j	1634 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    1628:	fe043503          	ld	a0,-32(s0)
    162c:	00000097          	auipc	ra,0x0
    1630:	d56080e7          	jalr	-682(ra) # 1382 <__thread_exit>
}
    1634:	0001                	nop
    1636:	70a2                	ld	ra,40(sp)
    1638:	7402                	ld	s0,32(sp)
    163a:	6145                	addi	sp,sp,48
    163c:	8082                	ret

000000000000163e <switch_handler>:

void switch_handler(void *arg)
{
    163e:	7139                	addi	sp,sp,-64
    1640:	fc06                	sd	ra,56(sp)
    1642:	f822                	sd	s0,48(sp)
    1644:	0080                	addi	s0,sp,64
    1646:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    164a:	fc843783          	ld	a5,-56(s0)
    164e:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1652:	00001797          	auipc	a5,0x1
    1656:	e2e78793          	addi	a5,a5,-466 # 2480 <current>
    165a:	639c                	ld	a5,0(a5)
    165c:	fef43023          	sd	a5,-32(s0)
    1660:	fe043783          	ld	a5,-32(s0)
    1664:	fd878793          	addi	a5,a5,-40
    1668:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    166c:	fe843783          	ld	a5,-24(s0)
    1670:	0007871b          	sext.w	a4,a5
    1674:	00001797          	auipc	a5,0x1
    1678:	e1478793          	addi	a5,a5,-492 # 2488 <threading_system_time>
    167c:	439c                	lw	a5,0(a5)
    167e:	2781                	sext.w	a5,a5
    1680:	9fb9                	addw	a5,a5,a4
    1682:	2781                	sext.w	a5,a5
    1684:	0007871b          	sext.w	a4,a5
    1688:	00001797          	auipc	a5,0x1
    168c:	e0078793          	addi	a5,a5,-512 # 2488 <threading_system_time>
    1690:	c398                	sw	a4,0(a5)
     __release();
    1692:	00000097          	auipc	ra,0x0
    1696:	bd2080e7          	jalr	-1070(ra) # 1264 <__release>
    current_thread->remaining_time -= elapsed_time;
    169a:	fd843783          	ld	a5,-40(s0)
    169e:	4bfc                	lw	a5,84(a5)
    16a0:	0007871b          	sext.w	a4,a5
    16a4:	fe843783          	ld	a5,-24(s0)
    16a8:	2781                	sext.w	a5,a5
    16aa:	40f707bb          	subw	a5,a4,a5
    16ae:	2781                	sext.w	a5,a5
    16b0:	0007871b          	sext.w	a4,a5
    16b4:	fd843783          	ld	a5,-40(s0)
    16b8:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    16ba:	fd843783          	ld	a5,-40(s0)
    16be:	57fc                	lw	a5,108(a5)
    16c0:	e38d                	bnez	a5,16e2 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    16c2:	fd843783          	ld	a5,-40(s0)
    16c6:	57bc                	lw	a5,104(a5)
    16c8:	0007871b          	sext.w	a4,a5
    16cc:	fe843783          	ld	a5,-24(s0)
    16d0:	2781                	sext.w	a5,a5
    16d2:	40f707bb          	subw	a5,a4,a5
    16d6:	2781                	sext.w	a5,a5
    16d8:	0007871b          	sext.w	a4,a5
    16dc:	fd843783          	ld	a5,-40(s0)
    16e0:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    16e2:	fd843783          	ld	a5,-40(s0)
    16e6:	43bc                	lw	a5,64(a5)
    16e8:	c3ad                	beqz	a5,174a <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    16ea:	fd843783          	ld	a5,-40(s0)
    16ee:	4fb8                	lw	a4,88(a5)
    16f0:	00001797          	auipc	a5,0x1
    16f4:	d9878793          	addi	a5,a5,-616 # 2488 <threading_system_time>
    16f8:	439c                	lw	a5,0(a5)
    16fa:	02f74163          	blt	a4,a5,171c <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    16fe:	fd843783          	ld	a5,-40(s0)
    1702:	4fb8                	lw	a4,88(a5)
    1704:	00001797          	auipc	a5,0x1
    1708:	d8478793          	addi	a5,a5,-636 # 2488 <threading_system_time>
    170c:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    170e:	02f71e63          	bne	a4,a5,174a <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    1712:	fd843783          	ld	a5,-40(s0)
    1716:	4bfc                	lw	a5,84(a5)
    1718:	02f05963          	blez	a5,174a <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    171c:	fd843783          	ld	a5,-40(s0)
    1720:	5fd8                	lw	a4,60(a5)
    1722:	00001797          	auipc	a5,0x1
    1726:	d6678793          	addi	a5,a5,-666 # 2488 <threading_system_time>
    172a:	439c                	lw	a5,0(a5)
    172c:	863e                	mv	a2,a5
    172e:	85ba                	mv	a1,a4
    1730:	00001517          	auipc	a0,0x1
    1734:	af850513          	addi	a0,a0,-1288 # 2228 <schedule_edf_cbs+0x59e>
    1738:	fffff097          	auipc	ra,0xfffff
    173c:	45c080e7          	jalr	1116(ra) # b94 <printf>
            exit(0);
    1740:	4501                	li	a0,0
    1742:	fffff097          	auipc	ra,0xfffff
    1746:	f0c080e7          	jalr	-244(ra) # 64e <exit>
        }

    if (current_thread->remaining_time <= 0) {
    174a:	fd843783          	ld	a5,-40(s0)
    174e:	4bfc                	lw	a5,84(a5)
    1750:	02f04063          	bgtz	a5,1770 <switch_handler+0x132>
        if (current_thread->is_real_time)
    1754:	fd843783          	ld	a5,-40(s0)
    1758:	43bc                	lw	a5,64(a5)
    175a:	c791                	beqz	a5,1766 <switch_handler+0x128>
            __rt_finish_current();
    175c:	00000097          	auipc	ra,0x0
    1760:	e0a080e7          	jalr	-502(ra) # 1566 <__rt_finish_current>
    1764:	a881                	j	17b4 <switch_handler+0x176>
        else
            __finish_current();
    1766:	00000097          	auipc	ra,0x0
    176a:	d3c080e7          	jalr	-708(ra) # 14a2 <__finish_current>
    176e:	a099                	j	17b4 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    1770:	00001797          	auipc	a5,0x1
    1774:	d1078793          	addi	a5,a5,-752 # 2480 <current>
    1778:	639c                	ld	a5,0(a5)
    177a:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    177e:	00001797          	auipc	a5,0x1
    1782:	d0278793          	addi	a5,a5,-766 # 2480 <current>
    1786:	639c                	ld	a5,0(a5)
    1788:	6798                	ld	a4,8(a5)
    178a:	00001797          	auipc	a5,0x1
    178e:	cf678793          	addi	a5,a5,-778 # 2480 <current>
    1792:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    1794:	fd043503          	ld	a0,-48(s0)
    1798:	00000097          	auipc	ra,0x0
    179c:	840080e7          	jalr	-1984(ra) # fd8 <list_del>
        list_add_tail(to_remove, &run_queue);
    17a0:	00001597          	auipc	a1,0x1
    17a4:	c9058593          	addi	a1,a1,-880 # 2430 <run_queue>
    17a8:	fd043503          	ld	a0,-48(s0)
    17ac:	fffff097          	auipc	ra,0xfffff
    17b0:	7d0080e7          	jalr	2000(ra) # f7c <list_add_tail>
    }

    __release();
    17b4:	00000097          	auipc	ra,0x0
    17b8:	ab0080e7          	jalr	-1360(ra) # 1264 <__release>
    __schedule();
    17bc:	00000097          	auipc	ra,0x0
    17c0:	1f8080e7          	jalr	504(ra) # 19b4 <__schedule>
    __dispatch();
    17c4:	00000097          	auipc	ra,0x0
    17c8:	026080e7          	jalr	38(ra) # 17ea <__dispatch>
    thrdresume(main_thrd_id);
    17cc:	00001797          	auipc	a5,0x1
    17d0:	c8478793          	addi	a5,a5,-892 # 2450 <main_thrd_id>
    17d4:	439c                	lw	a5,0(a5)
    17d6:	853e                	mv	a0,a5
    17d8:	fffff097          	auipc	ra,0xfffff
    17dc:	f1e080e7          	jalr	-226(ra) # 6f6 <thrdresume>
}
    17e0:	0001                	nop
    17e2:	70e2                	ld	ra,56(sp)
    17e4:	7442                	ld	s0,48(sp)
    17e6:	6121                	addi	sp,sp,64
    17e8:	8082                	ret

00000000000017ea <__dispatch>:

void __dispatch()
{
    17ea:	7179                	addi	sp,sp,-48
    17ec:	f406                	sd	ra,40(sp)
    17ee:	f022                	sd	s0,32(sp)
    17f0:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    17f2:	00001797          	auipc	a5,0x1
    17f6:	c8e78793          	addi	a5,a5,-882 # 2480 <current>
    17fa:	6398                	ld	a4,0(a5)
    17fc:	00001797          	auipc	a5,0x1
    1800:	c3478793          	addi	a5,a5,-972 # 2430 <run_queue>
    1804:	1af70363          	beq	a4,a5,19aa <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    1808:	00001797          	auipc	a5,0x1
    180c:	c7878793          	addi	a5,a5,-904 # 2480 <current>
    1810:	639c                	ld	a5,0(a5)
    1812:	fef43423          	sd	a5,-24(s0)
    1816:	fe843783          	ld	a5,-24(s0)
    181a:	fd878793          	addi	a5,a5,-40
    181e:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    1822:	fe043783          	ld	a5,-32(s0)
    1826:	5fcc                	lw	a1,60(a5)
    1828:	00001797          	auipc	a5,0x1
    182c:	c6078793          	addi	a5,a5,-928 # 2488 <threading_system_time>
    1830:	4390                	lw	a2,0(a5)
    1832:	00001797          	auipc	a5,0x1
    1836:	c5e78793          	addi	a5,a5,-930 # 2490 <allocated_time>
    183a:	6394                	ld	a3,0(a5)
    183c:	fe043783          	ld	a5,-32(s0)
    1840:	4bfc                	lw	a5,84(a5)
    1842:	873e                	mv	a4,a5
    1844:	00001517          	auipc	a0,0x1
    1848:	a1450513          	addi	a0,a0,-1516 # 2258 <schedule_edf_cbs+0x5ce>
    184c:	fffff097          	auipc	ra,0xfffff
    1850:	348080e7          	jalr	840(ra) # b94 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    1854:	fe043783          	ld	a5,-32(s0)
    1858:	43bc                	lw	a5,64(a5)
    185a:	c3a1                	beqz	a5,189a <__dispatch+0xb0>
    185c:	00001797          	auipc	a5,0x1
    1860:	c3478793          	addi	a5,a5,-972 # 2490 <allocated_time>
    1864:	639c                	ld	a5,0(a5)
    1866:	eb95                	bnez	a5,189a <__dispatch+0xb0>
    1868:	fe043783          	ld	a5,-32(s0)
    186c:	57fc                	lw	a5,108(a5)
    186e:	c795                	beqz	a5,189a <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    1870:	fe043783          	ld	a5,-32(s0)
    1874:	5fd8                	lw	a4,60(a5)
    1876:	fe043783          	ld	a5,-32(s0)
    187a:	4fbc                	lw	a5,88(a5)
    187c:	863e                	mv	a2,a5
    187e:	85ba                	mv	a1,a4
    1880:	00001517          	auipc	a0,0x1
    1884:	a2850513          	addi	a0,a0,-1496 # 22a8 <schedule_edf_cbs+0x61e>
    1888:	fffff097          	auipc	ra,0xfffff
    188c:	30c080e7          	jalr	780(ra) # b94 <printf>
        exit(0);
    1890:	4501                	li	a0,0
    1892:	fffff097          	auipc	ra,0xfffff
    1896:	dbc080e7          	jalr	-580(ra) # 64e <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    189a:	fe043783          	ld	a5,-32(s0)
    189e:	5fd8                	lw	a4,60(a5)
    18a0:	00001797          	auipc	a5,0x1
    18a4:	be878793          	addi	a5,a5,-1048 # 2488 <threading_system_time>
    18a8:	4390                	lw	a2,0(a5)
    18aa:	00001797          	auipc	a5,0x1
    18ae:	be678793          	addi	a5,a5,-1050 # 2490 <allocated_time>
    18b2:	639c                	ld	a5,0(a5)
    18b4:	86be                	mv	a3,a5
    18b6:	85ba                	mv	a1,a4
    18b8:	00001517          	auipc	a0,0x1
    18bc:	a2050513          	addi	a0,a0,-1504 # 22d8 <schedule_edf_cbs+0x64e>
    18c0:	fffff097          	auipc	ra,0xfffff
    18c4:	2d4080e7          	jalr	724(ra) # b94 <printf>

    if (current_thread->buf_set) {
    18c8:	fe043783          	ld	a5,-32(s0)
    18cc:	539c                	lw	a5,32(a5)
    18ce:	c7a1                	beqz	a5,1916 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    18d0:	00001797          	auipc	a5,0x1
    18d4:	bc078793          	addi	a5,a5,-1088 # 2490 <allocated_time>
    18d8:	639c                	ld	a5,0(a5)
    18da:	0007871b          	sext.w	a4,a5
    18de:	fe043783          	ld	a5,-32(s0)
    18e2:	03878593          	addi	a1,a5,56
    18e6:	00001797          	auipc	a5,0x1
    18ea:	baa78793          	addi	a5,a5,-1110 # 2490 <allocated_time>
    18ee:	639c                	ld	a5,0(a5)
    18f0:	86be                	mv	a3,a5
    18f2:	00000617          	auipc	a2,0x0
    18f6:	d4c60613          	addi	a2,a2,-692 # 163e <switch_handler>
    18fa:	853a                	mv	a0,a4
    18fc:	fffff097          	auipc	ra,0xfffff
    1900:	df2080e7          	jalr	-526(ra) # 6ee <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    1904:	fe043783          	ld	a5,-32(s0)
    1908:	5f9c                	lw	a5,56(a5)
    190a:	853e                	mv	a0,a5
    190c:	fffff097          	auipc	ra,0xfffff
    1910:	dea080e7          	jalr	-534(ra) # 6f6 <thrdresume>
    1914:	a071                	j	19a0 <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    1916:	fe043783          	ld	a5,-32(s0)
    191a:	4705                	li	a4,1
    191c:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    191e:	fe043783          	ld	a5,-32(s0)
    1922:	6f9c                	ld	a5,24(a5)
    1924:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    1928:	fe043783          	ld	a5,-32(s0)
    192c:	577d                	li	a4,-1
    192e:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    1930:	00001797          	auipc	a5,0x1
    1934:	b6078793          	addi	a5,a5,-1184 # 2490 <allocated_time>
    1938:	639c                	ld	a5,0(a5)
    193a:	0007871b          	sext.w	a4,a5
    193e:	fe043783          	ld	a5,-32(s0)
    1942:	03878593          	addi	a1,a5,56
    1946:	00001797          	auipc	a5,0x1
    194a:	b4a78793          	addi	a5,a5,-1206 # 2490 <allocated_time>
    194e:	639c                	ld	a5,0(a5)
    1950:	86be                	mv	a3,a5
    1952:	00000617          	auipc	a2,0x0
    1956:	cec60613          	addi	a2,a2,-788 # 163e <switch_handler>
    195a:	853a                	mv	a0,a4
    195c:	fffff097          	auipc	ra,0xfffff
    1960:	d92080e7          	jalr	-622(ra) # 6ee <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    1964:	fe043783          	ld	a5,-32(s0)
    1968:	5f9c                	lw	a5,56(a5)
    196a:	0207d063          	bgez	a5,198a <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    196e:	00001597          	auipc	a1,0x1
    1972:	99a58593          	addi	a1,a1,-1638 # 2308 <schedule_edf_cbs+0x67e>
    1976:	4509                	li	a0,2
    1978:	fffff097          	auipc	ra,0xfffff
    197c:	1c4080e7          	jalr	452(ra) # b3c <fprintf>
            exit(1);
    1980:	4505                	li	a0,1
    1982:	fffff097          	auipc	ra,0xfffff
    1986:	ccc080e7          	jalr	-820(ra) # 64e <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    198a:	fd843783          	ld	a5,-40(s0)
    198e:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    1990:	fe043783          	ld	a5,-32(s0)
    1994:	6398                	ld	a4,0(a5)
    1996:	fe043783          	ld	a5,-32(s0)
    199a:	679c                	ld	a5,8(a5)
    199c:	853e                	mv	a0,a5
    199e:	9702                	jalr	a4
    }
    thread_exit();
    19a0:	00000097          	auipc	ra,0x0
    19a4:	a5a080e7          	jalr	-1446(ra) # 13fa <thread_exit>
    19a8:	a011                	j	19ac <__dispatch+0x1c2>
        return;
    19aa:	0001                	nop
}
    19ac:	70a2                	ld	ra,40(sp)
    19ae:	7402                	ld	s0,32(sp)
    19b0:	6145                	addi	sp,sp,48
    19b2:	8082                	ret

00000000000019b4 <__schedule>:

void __schedule()
{
    19b4:	711d                	addi	sp,sp,-96
    19b6:	ec86                	sd	ra,88(sp)
    19b8:	e8a2                	sd	s0,80(sp)
    19ba:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    19bc:	00001797          	auipc	a5,0x1
    19c0:	acc78793          	addi	a5,a5,-1332 # 2488 <threading_system_time>
    19c4:	439c                	lw	a5,0(a5)
    19c6:	fcf42c23          	sw	a5,-40(s0)
    19ca:	4789                	li	a5,2
    19cc:	fcf42e23          	sw	a5,-36(s0)
    19d0:	00001797          	auipc	a5,0x1
    19d4:	a6078793          	addi	a5,a5,-1440 # 2430 <run_queue>
    19d8:	fef43023          	sd	a5,-32(s0)
    19dc:	00001797          	auipc	a5,0x1
    19e0:	a6478793          	addi	a5,a5,-1436 # 2440 <release_queue>
    19e4:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    19e8:	fd843783          	ld	a5,-40(s0)
    19ec:	faf43023          	sd	a5,-96(s0)
    19f0:	fe043783          	ld	a5,-32(s0)
    19f4:	faf43423          	sd	a5,-88(s0)
    19f8:	fe843783          	ld	a5,-24(s0)
    19fc:	faf43823          	sd	a5,-80(s0)
    1a00:	fa040793          	addi	a5,s0,-96
    1a04:	853e                	mv	a0,a5
    1a06:	00000097          	auipc	ra,0x0
    1a0a:	284080e7          	jalr	644(ra) # 1c8a <schedule_edf_cbs>
    1a0e:	872a                	mv	a4,a0
    1a10:	87ae                	mv	a5,a1
    1a12:	fce43423          	sd	a4,-56(s0)
    1a16:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    1a1a:	fc843703          	ld	a4,-56(s0)
    1a1e:	00001797          	auipc	a5,0x1
    1a22:	a6278793          	addi	a5,a5,-1438 # 2480 <current>
    1a26:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    1a28:	fd042783          	lw	a5,-48(s0)
    1a2c:	873e                	mv	a4,a5
    1a2e:	00001797          	auipc	a5,0x1
    1a32:	a6278793          	addi	a5,a5,-1438 # 2490 <allocated_time>
    1a36:	e398                	sd	a4,0(a5)
}
    1a38:	0001                	nop
    1a3a:	60e6                	ld	ra,88(sp)
    1a3c:	6446                	ld	s0,80(sp)
    1a3e:	6125                	addi	sp,sp,96
    1a40:	8082                	ret

0000000000001a42 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    1a42:	1101                	addi	sp,sp,-32
    1a44:	ec06                	sd	ra,24(sp)
    1a46:	e822                	sd	s0,16(sp)
    1a48:	1000                	addi	s0,sp,32
    1a4a:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    1a4e:	00001797          	auipc	a5,0x1
    1a52:	a3e78793          	addi	a5,a5,-1474 # 248c <sleeping>
    1a56:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    1a5a:	fe843783          	ld	a5,-24(s0)
    1a5e:	0007871b          	sext.w	a4,a5
    1a62:	00001797          	auipc	a5,0x1
    1a66:	a2678793          	addi	a5,a5,-1498 # 2488 <threading_system_time>
    1a6a:	439c                	lw	a5,0(a5)
    1a6c:	2781                	sext.w	a5,a5
    1a6e:	9fb9                	addw	a5,a5,a4
    1a70:	2781                	sext.w	a5,a5
    1a72:	0007871b          	sext.w	a4,a5
    1a76:	00001797          	auipc	a5,0x1
    1a7a:	a1278793          	addi	a5,a5,-1518 # 2488 <threading_system_time>
    1a7e:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    1a80:	00001797          	auipc	a5,0x1
    1a84:	9d078793          	addi	a5,a5,-1584 # 2450 <main_thrd_id>
    1a88:	439c                	lw	a5,0(a5)
    1a8a:	853e                	mv	a0,a5
    1a8c:	fffff097          	auipc	ra,0xfffff
    1a90:	c6a080e7          	jalr	-918(ra) # 6f6 <thrdresume>
}
    1a94:	0001                	nop
    1a96:	60e2                	ld	ra,24(sp)
    1a98:	6442                	ld	s0,16(sp)
    1a9a:	6105                	addi	sp,sp,32
    1a9c:	8082                	ret

0000000000001a9e <thread_start_threading>:

void thread_start_threading()
{
    1a9e:	1141                	addi	sp,sp,-16
    1aa0:	e406                	sd	ra,8(sp)
    1aa2:	e022                	sd	s0,0(sp)
    1aa4:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    1aa6:	00001797          	auipc	a5,0x1
    1aaa:	9e278793          	addi	a5,a5,-1566 # 2488 <threading_system_time>
    1aae:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    1ab2:	00001797          	auipc	a5,0x1
    1ab6:	9ce78793          	addi	a5,a5,-1586 # 2480 <current>
    1aba:	00001717          	auipc	a4,0x1
    1abe:	97670713          	addi	a4,a4,-1674 # 2430 <run_queue>
    1ac2:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    1ac4:	4681                	li	a3,0
    1ac6:	00000617          	auipc	a2,0x0
    1aca:	f7c60613          	addi	a2,a2,-132 # 1a42 <back_to_main_handler>
    1ace:	00001597          	auipc	a1,0x1
    1ad2:	98258593          	addi	a1,a1,-1662 # 2450 <main_thrd_id>
    1ad6:	3e800513          	li	a0,1000
    1ada:	fffff097          	auipc	ra,0xfffff
    1ade:	c14080e7          	jalr	-1004(ra) # 6ee <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    1ae2:	00001797          	auipc	a5,0x1
    1ae6:	96e78793          	addi	a5,a5,-1682 # 2450 <main_thrd_id>
    1aea:	439c                	lw	a5,0(a5)
    1aec:	4581                	li	a1,0
    1aee:	853e                	mv	a0,a5
    1af0:	fffff097          	auipc	ra,0xfffff
    1af4:	c0e080e7          	jalr	-1010(ra) # 6fe <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1af8:	a0c9                	j	1bba <thread_start_threading+0x11c>
        __release();
    1afa:	fffff097          	auipc	ra,0xfffff
    1afe:	76a080e7          	jalr	1898(ra) # 1264 <__release>
        __schedule();
    1b02:	00000097          	auipc	ra,0x0
    1b06:	eb2080e7          	jalr	-334(ra) # 19b4 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    1b0a:	00001797          	auipc	a5,0x1
    1b0e:	94678793          	addi	a5,a5,-1722 # 2450 <main_thrd_id>
    1b12:	439c                	lw	a5,0(a5)
    1b14:	4581                	li	a1,0
    1b16:	853e                	mv	a0,a5
    1b18:	fffff097          	auipc	ra,0xfffff
    1b1c:	be6080e7          	jalr	-1050(ra) # 6fe <cancelthrdstop>
        __dispatch();
    1b20:	00000097          	auipc	ra,0x0
    1b24:	cca080e7          	jalr	-822(ra) # 17ea <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    1b28:	00001517          	auipc	a0,0x1
    1b2c:	90850513          	addi	a0,a0,-1784 # 2430 <run_queue>
    1b30:	fffff097          	auipc	ra,0xfffff
    1b34:	4f2080e7          	jalr	1266(ra) # 1022 <list_empty>
    1b38:	87aa                	mv	a5,a0
    1b3a:	cb99                	beqz	a5,1b50 <thread_start_threading+0xb2>
    1b3c:	00001517          	auipc	a0,0x1
    1b40:	90450513          	addi	a0,a0,-1788 # 2440 <release_queue>
    1b44:	fffff097          	auipc	ra,0xfffff
    1b48:	4de080e7          	jalr	1246(ra) # 1022 <list_empty>
    1b4c:	87aa                	mv	a5,a0
    1b4e:	ebd9                	bnez	a5,1be4 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    1b50:	00001797          	auipc	a5,0x1
    1b54:	94078793          	addi	a5,a5,-1728 # 2490 <allocated_time>
    1b58:	639c                	ld	a5,0(a5)
    1b5a:	85be                	mv	a1,a5
    1b5c:	00000517          	auipc	a0,0x0
    1b60:	7e450513          	addi	a0,a0,2020 # 2340 <schedule_edf_cbs+0x6b6>
    1b64:	fffff097          	auipc	ra,0xfffff
    1b68:	030080e7          	jalr	48(ra) # b94 <printf>
        sleeping = 1;
    1b6c:	00001797          	auipc	a5,0x1
    1b70:	92078793          	addi	a5,a5,-1760 # 248c <sleeping>
    1b74:	4705                	li	a4,1
    1b76:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    1b78:	00001797          	auipc	a5,0x1
    1b7c:	91878793          	addi	a5,a5,-1768 # 2490 <allocated_time>
    1b80:	639c                	ld	a5,0(a5)
    1b82:	0007871b          	sext.w	a4,a5
    1b86:	00001797          	auipc	a5,0x1
    1b8a:	90a78793          	addi	a5,a5,-1782 # 2490 <allocated_time>
    1b8e:	639c                	ld	a5,0(a5)
    1b90:	86be                	mv	a3,a5
    1b92:	00000617          	auipc	a2,0x0
    1b96:	eb060613          	addi	a2,a2,-336 # 1a42 <back_to_main_handler>
    1b9a:	00001597          	auipc	a1,0x1
    1b9e:	8b658593          	addi	a1,a1,-1866 # 2450 <main_thrd_id>
    1ba2:	853a                	mv	a0,a4
    1ba4:	fffff097          	auipc	ra,0xfffff
    1ba8:	b4a080e7          	jalr	-1206(ra) # 6ee <thrdstop>
        while (sleeping) {
    1bac:	0001                	nop
    1bae:	00001797          	auipc	a5,0x1
    1bb2:	8de78793          	addi	a5,a5,-1826 # 248c <sleeping>
    1bb6:	439c                	lw	a5,0(a5)
    1bb8:	fbfd                	bnez	a5,1bae <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    1bba:	00001517          	auipc	a0,0x1
    1bbe:	87650513          	addi	a0,a0,-1930 # 2430 <run_queue>
    1bc2:	fffff097          	auipc	ra,0xfffff
    1bc6:	460080e7          	jalr	1120(ra) # 1022 <list_empty>
    1bca:	87aa                	mv	a5,a0
    1bcc:	d79d                	beqz	a5,1afa <thread_start_threading+0x5c>
    1bce:	00001517          	auipc	a0,0x1
    1bd2:	87250513          	addi	a0,a0,-1934 # 2440 <release_queue>
    1bd6:	fffff097          	auipc	ra,0xfffff
    1bda:	44c080e7          	jalr	1100(ra) # 1022 <list_empty>
    1bde:	87aa                	mv	a5,a0
    1be0:	df89                	beqz	a5,1afa <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    1be2:	a011                	j	1be6 <thread_start_threading+0x148>
            break;
    1be4:	0001                	nop
}
    1be6:	0001                	nop
    1be8:	60a2                	ld	ra,8(sp)
    1bea:	6402                	ld	s0,0(sp)
    1bec:	0141                	addi	sp,sp,16
    1bee:	8082                	ret

0000000000001bf0 <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    1bf0:	7139                	addi	sp,sp,-64
    1bf2:	fc22                	sd	s0,56(sp)
    1bf4:	0080                	addi	s0,sp,64
    1bf6:	fca43423          	sd	a0,-56(s0)
    1bfa:	87ae                	mv	a5,a1
    1bfc:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    1c00:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    1c04:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1c08:	fc843783          	ld	a5,-56(s0)
    1c0c:	639c                	ld	a5,0(a5)
    1c0e:	fcf43c23          	sd	a5,-40(s0)
    1c12:	fd843783          	ld	a5,-40(s0)
    1c16:	fd878793          	addi	a5,a5,-40
    1c1a:	fef43423          	sd	a5,-24(s0)
    1c1e:	a881                	j	1c6e <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    1c20:	fe843783          	ld	a5,-24(s0)
    1c24:	4fb8                	lw	a4,88(a5)
    1c26:	fc442783          	lw	a5,-60(s0)
    1c2a:	2781                	sext.w	a5,a5
    1c2c:	02e7c663          	blt	a5,a4,1c58 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    1c30:	fe043783          	ld	a5,-32(s0)
    1c34:	e791                	bnez	a5,1c40 <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    1c36:	fe843783          	ld	a5,-24(s0)
    1c3a:	fef43023          	sd	a5,-32(s0)
    1c3e:	a829                	j	1c58 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    1c40:	fe843783          	ld	a5,-24(s0)
    1c44:	5fd8                	lw	a4,60(a5)
    1c46:	fe043783          	ld	a5,-32(s0)
    1c4a:	5fdc                	lw	a5,60(a5)
    1c4c:	00f75663          	bge	a4,a5,1c58 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    1c50:	fe843783          	ld	a5,-24(s0)
    1c54:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    1c58:	fe843783          	ld	a5,-24(s0)
    1c5c:	779c                	ld	a5,40(a5)
    1c5e:	fcf43823          	sd	a5,-48(s0)
    1c62:	fd043783          	ld	a5,-48(s0)
    1c66:	fd878793          	addi	a5,a5,-40
    1c6a:	fef43423          	sd	a5,-24(s0)
    1c6e:	fe843783          	ld	a5,-24(s0)
    1c72:	02878793          	addi	a5,a5,40
    1c76:	fc843703          	ld	a4,-56(s0)
    1c7a:	faf713e3          	bne	a4,a5,1c20 <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    1c7e:	fe043783          	ld	a5,-32(s0)
}
    1c82:	853e                	mv	a0,a5
    1c84:	7462                	ld	s0,56(sp)
    1c86:	6121                	addi	sp,sp,64
    1c88:	8082                	ret

0000000000001c8a <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    1c8a:	7131                	addi	sp,sp,-192
    1c8c:	fd06                	sd	ra,184(sp)
    1c8e:	f922                	sd	s0,176(sp)
    1c90:	f526                	sd	s1,168(sp)
    1c92:	f14a                	sd	s2,160(sp)
    1c94:	ed4e                	sd	s3,152(sp)
    1c96:	0180                	addi	s0,sp,192
    1c98:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    1c9a:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    1c9e:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    1ca2:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    1ca6:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    1caa:	649c                	ld	a5,8(s1)
    1cac:	4098                	lw	a4,0(s1)
    1cae:	85ba                	mv	a1,a4
    1cb0:	853e                	mv	a0,a5
    1cb2:	00000097          	auipc	ra,0x0
    1cb6:	f3e080e7          	jalr	-194(ra) # 1bf0 <__check_deadline_miss>
    1cba:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    1cbe:	f9843783          	ld	a5,-104(s0)
    1cc2:	c7b5                	beqz	a5,1d2e <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    1cc4:	f9843783          	ld	a5,-104(s0)
    1cc8:	5fdc                	lw	a5,60(a5)
    1cca:	85be                	mv	a1,a5
    1ccc:	00000517          	auipc	a0,0x0
    1cd0:	69c50513          	addi	a0,a0,1692 # 2368 <schedule_edf_cbs+0x6de>
    1cd4:	fffff097          	auipc	ra,0xfffff
    1cd8:	ec0080e7          	jalr	-320(ra) # b94 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    1cdc:	f9843783          	ld	a5,-104(s0)
    1ce0:	57fc                	lw	a5,108(a5)
    1ce2:	c395                	beqz	a5,1d06 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    1ce4:	f9843783          	ld	a5,-104(s0)
    1ce8:	02878793          	addi	a5,a5,40
    1cec:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    1cf0:	f4042423          	sw	zero,-184(s0)
            return r;
    1cf4:	f4043783          	ld	a5,-192(s0)
    1cf8:	f4f43823          	sd	a5,-176(s0)
    1cfc:	f4843783          	ld	a5,-184(s0)
    1d00:	f4f43c23          	sd	a5,-168(s0)
    1d04:	a13d                	j	2132 <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    1d06:	4098                	lw	a4,0(s1)
    1d08:	f9843783          	ld	a5,-104(s0)
    1d0c:	47fc                	lw	a5,76(a5)
    1d0e:	9fb9                	addw	a5,a5,a4
    1d10:	0007871b          	sext.w	a4,a5
    1d14:	f9843783          	ld	a5,-104(s0)
    1d18:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    1d1a:	f9843783          	ld	a5,-104(s0)
    1d1e:	53f8                	lw	a4,100(a5)
    1d20:	f9843783          	ld	a5,-104(s0)
    1d24:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    1d26:	f9843783          	ld	a5,-104(s0)
    1d2a:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    1d2e:	fa043783          	ld	a5,-96(s0)
    1d32:	e7dd                	bnez	a5,1de0 <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    1d34:	649c                	ld	a5,8(s1)
    1d36:	639c                	ld	a5,0(a5)
    1d38:	f8f43823          	sd	a5,-112(s0)
    1d3c:	f9043783          	ld	a5,-112(s0)
    1d40:	fd878793          	addi	a5,a5,-40
    1d44:	faf43c23          	sd	a5,-72(s0)
    1d48:	a069                	j	1dd2 <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    1d4a:	fb843783          	ld	a5,-72(s0)
    1d4e:	5fd8                	lw	a4,60(a5)
    1d50:	fb843783          	ld	a5,-72(s0)
    1d54:	5bbc                	lw	a5,112(a5)
    1d56:	863e                	mv	a2,a5
    1d58:	85ba                	mv	a1,a4
    1d5a:	00000517          	auipc	a0,0x0
    1d5e:	64650513          	addi	a0,a0,1606 # 23a0 <schedule_edf_cbs+0x716>
    1d62:	fffff097          	auipc	ra,0xfffff
    1d66:	e32080e7          	jalr	-462(ra) # b94 <printf>
            if (next == NULL)
    1d6a:	fa043783          	ld	a5,-96(s0)
    1d6e:	e791                	bnez	a5,1d7a <schedule_edf_cbs+0xf0>
                next = th;
    1d70:	fb843783          	ld	a5,-72(s0)
    1d74:	faf43023          	sd	a5,-96(s0)
    1d78:	a091                	j	1dbc <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    1d7a:	fb843783          	ld	a5,-72(s0)
    1d7e:	4fb8                	lw	a4,88(a5)
    1d80:	fa043783          	ld	a5,-96(s0)
    1d84:	4fbc                	lw	a5,88(a5)
    1d86:	00f75763          	bge	a4,a5,1d94 <schedule_edf_cbs+0x10a>
                next = th;
    1d8a:	fb843783          	ld	a5,-72(s0)
    1d8e:	faf43023          	sd	a5,-96(s0)
    1d92:	a02d                	j	1dbc <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    1d94:	fb843783          	ld	a5,-72(s0)
    1d98:	4fb8                	lw	a4,88(a5)
    1d9a:	fa043783          	ld	a5,-96(s0)
    1d9e:	4fbc                	lw	a5,88(a5)
    1da0:	00f71e63          	bne	a4,a5,1dbc <schedule_edf_cbs+0x132>
    1da4:	fb843783          	ld	a5,-72(s0)
    1da8:	5fd8                	lw	a4,60(a5)
    1daa:	fa043783          	ld	a5,-96(s0)
    1dae:	5fdc                	lw	a5,60(a5)
    1db0:	00f75663          	bge	a4,a5,1dbc <schedule_edf_cbs+0x132>
                next = th;
    1db4:	fb843783          	ld	a5,-72(s0)
    1db8:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    1dbc:	fb843783          	ld	a5,-72(s0)
    1dc0:	779c                	ld	a5,40(a5)
    1dc2:	f8f43423          	sd	a5,-120(s0)
    1dc6:	f8843783          	ld	a5,-120(s0)
    1dca:	fd878793          	addi	a5,a5,-40
    1dce:	faf43c23          	sd	a5,-72(s0)
    1dd2:	fb843783          	ld	a5,-72(s0)
    1dd6:	02878713          	addi	a4,a5,40
    1dda:	649c                	ld	a5,8(s1)
    1ddc:	f6f717e3          	bne	a4,a5,1d4a <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    1de0:	fa043783          	ld	a5,-96(s0)
    1de4:	5fdc                	lw	a5,60(a5)
    1de6:	85be                	mv	a1,a5
    1de8:	00000517          	auipc	a0,0x0
    1dec:	5f050513          	addi	a0,a0,1520 # 23d8 <schedule_edf_cbs+0x74e>
    1df0:	fffff097          	auipc	ra,0xfffff
    1df4:	da4080e7          	jalr	-604(ra) # b94 <printf>

    if(next && next->cbs.is_throttled){
    1df8:	fa043783          	ld	a5,-96(s0)
    1dfc:	cb95                	beqz	a5,1e30 <schedule_edf_cbs+0x1a6>
    1dfe:	fa043783          	ld	a5,-96(s0)
    1e02:	5bbc                	lw	a5,112(a5)
    1e04:	c795                	beqz	a5,1e30 <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    1e06:	fa043783          	ld	a5,-96(s0)
    1e0a:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    1e0e:	fa043783          	ld	a5,-96(s0)
    1e12:	02878793          	addi	a5,a5,40
    1e16:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    1e1a:	f4042423          	sw	zero,-184(s0)
        return r;
    1e1e:	f4043783          	ld	a5,-192(s0)
    1e22:	f4f43823          	sd	a5,-176(s0)
    1e26:	f4843783          	ld	a5,-184(s0)
    1e2a:	f4f43c23          	sd	a5,-168(s0)
    1e2e:	a611                	j	2132 <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    1e30:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1e34:	689c                	ld	a5,16(s1)
    1e36:	639c                	ld	a5,0(a5)
    1e38:	f8f43023          	sd	a5,-128(s0)
    1e3c:	f8043783          	ld	a5,-128(s0)
    1e40:	17e1                	addi	a5,a5,-8
    1e42:	fcf43023          	sd	a5,-64(s0)
    1e46:	a0b5                	j	1eb2 <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    1e48:	fa843783          	ld	a5,-88(s0)
    1e4c:	e791                	bnez	a5,1e58 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    1e4e:	fc043783          	ld	a5,-64(s0)
    1e52:	faf43423          	sd	a5,-88(s0)
    1e56:	a0a1                	j	1e9e <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    1e58:	fa843783          	ld	a5,-88(s0)
    1e5c:	4f98                	lw	a4,24(a5)
    1e5e:	fc043783          	ld	a5,-64(s0)
    1e62:	4f9c                	lw	a5,24(a5)
    1e64:	00e7d763          	bge	a5,a4,1e72 <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    1e68:	fc043783          	ld	a5,-64(s0)
    1e6c:	faf43423          	sd	a5,-88(s0)
    1e70:	a03d                	j	1e9e <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    1e72:	fa843783          	ld	a5,-88(s0)
    1e76:	4f98                	lw	a4,24(a5)
    1e78:	fc043783          	ld	a5,-64(s0)
    1e7c:	4f9c                	lw	a5,24(a5)
    1e7e:	02f71063          	bne	a4,a5,1e9e <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1e82:	fa843783          	ld	a5,-88(s0)
    1e86:	639c                	ld	a5,0(a5)
    1e88:	4fb8                	lw	a4,88(a5)
    1e8a:	fc043783          	ld	a5,-64(s0)
    1e8e:	639c                	ld	a5,0(a5)
    1e90:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    1e92:	00e7d663          	bge	a5,a4,1e9e <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    1e96:	fc043783          	ld	a5,-64(s0)
    1e9a:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    1e9e:	fc043783          	ld	a5,-64(s0)
    1ea2:	679c                	ld	a5,8(a5)
    1ea4:	f6f43023          	sd	a5,-160(s0)
    1ea8:	f6043783          	ld	a5,-160(s0)
    1eac:	17e1                	addi	a5,a5,-8
    1eae:	fcf43023          	sd	a5,-64(s0)
    1eb2:	fc043783          	ld	a5,-64(s0)
    1eb6:	00878713          	addi	a4,a5,8
    1eba:	689c                	ld	a5,16(s1)
    1ebc:	f8f716e3          	bne	a4,a5,1e48 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1ec0:	689c                	ld	a5,16(s1)
    1ec2:	639c                	ld	a5,0(a5)
    1ec4:	f6f43c23          	sd	a5,-136(s0)
    1ec8:	f7843783          	ld	a5,-136(s0)
    1ecc:	17e1                	addi	a5,a5,-8
    1ece:	fcf43023          	sd	a5,-64(s0)
    1ed2:	a069                	j	1f5c <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    1ed4:	fb043783          	ld	a5,-80(s0)
    1ed8:	eb99                	bnez	a5,1eee <schedule_edf_cbs+0x264>
    1eda:	fc043783          	ld	a5,-64(s0)
    1ede:	639c                	ld	a5,0(a5)
    1ee0:	57fc                	lw	a5,108(a5)
    1ee2:	c791                	beqz	a5,1eee <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    1ee4:	fc043783          	ld	a5,-64(s0)
    1ee8:	faf43823          	sd	a5,-80(s0)
    1eec:	a8b1                	j	1f48 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1eee:	fc043783          	ld	a5,-64(s0)
    1ef2:	639c                	ld	a5,0(a5)
    1ef4:	57fc                	lw	a5,108(a5)
    1ef6:	cf91                	beqz	a5,1f12 <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    1ef8:	fb043783          	ld	a5,-80(s0)
    1efc:	4f98                	lw	a4,24(a5)
    1efe:	fc043783          	ld	a5,-64(s0)
    1f02:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1f04:	00e7d763          	bge	a5,a4,1f12 <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    1f08:	fc043783          	ld	a5,-64(s0)
    1f0c:	faf43823          	sd	a5,-80(s0)
    1f10:	a825                	j	1f48 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    1f12:	fc043783          	ld	a5,-64(s0)
    1f16:	639c                	ld	a5,0(a5)
    1f18:	57fc                	lw	a5,108(a5)
    1f1a:	c79d                	beqz	a5,1f48 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    1f1c:	fb043783          	ld	a5,-80(s0)
    1f20:	4f98                	lw	a4,24(a5)
    1f22:	fc043783          	ld	a5,-64(s0)
    1f26:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    1f28:	02f71063          	bne	a4,a5,1f48 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    1f2c:	fb043783          	ld	a5,-80(s0)
    1f30:	639c                	ld	a5,0(a5)
    1f32:	4fb8                	lw	a4,88(a5)
    1f34:	fc043783          	ld	a5,-64(s0)
    1f38:	639c                	ld	a5,0(a5)
    1f3a:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    1f3c:	00e7d663          	bge	a5,a4,1f48 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    1f40:	fc043783          	ld	a5,-64(s0)
    1f44:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    1f48:	fc043783          	ld	a5,-64(s0)
    1f4c:	679c                	ld	a5,8(a5)
    1f4e:	f6f43423          	sd	a5,-152(s0)
    1f52:	f6843783          	ld	a5,-152(s0)
    1f56:	17e1                	addi	a5,a5,-8
    1f58:	fcf43023          	sd	a5,-64(s0)
    1f5c:	fc043783          	ld	a5,-64(s0)
    1f60:	00878713          	addi	a4,a5,8
    1f64:	689c                	ld	a5,16(s1)
    1f66:	f6f717e3          	bne	a4,a5,1ed4 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    1f6a:	fa043783          	ld	a5,-96(s0)
    1f6e:	cb89                	beqz	a5,1f80 <schedule_edf_cbs+0x2f6>
    1f70:	fa043783          	ld	a5,-96(s0)
    1f74:	57fc                	lw	a5,108(a5)
    1f76:	c789                	beqz	a5,1f80 <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    1f78:	fb043783          	ld	a5,-80(s0)
    1f7c:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    1f80:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    1f84:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    1f88:	fa843783          	ld	a5,-88(s0)
    1f8c:	c3c5                	beqz	a5,202c <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    1f8e:	fa843783          	ld	a5,-88(s0)
    1f92:	639c                	ld	a5,0(a5)
    1f94:	5fdc                	lw	a5,60(a5)
    1f96:	85be                	mv	a1,a5
    1f98:	00000517          	auipc	a0,0x0
    1f9c:	46050513          	addi	a0,a0,1120 # 23f8 <schedule_edf_cbs+0x76e>
    1fa0:	fffff097          	auipc	ra,0xfffff
    1fa4:	bf4080e7          	jalr	-1036(ra) # b94 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    1fa8:	fa843783          	ld	a5,-88(s0)
    1fac:	4f98                	lw	a4,24(a5)
    1fae:	409c                	lw	a5,0(s1)
    1fb0:	40f707bb          	subw	a5,a4,a5
    1fb4:	fcf42623          	sw	a5,-52(s0)
        if (next){
    1fb8:	fa043783          	ld	a5,-96(s0)
    1fbc:	cba5                	beqz	a5,202c <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    1fbe:	fa043783          	ld	a5,-96(s0)
    1fc2:	4bf8                	lw	a4,84(a5)
    1fc4:	fcc42783          	lw	a5,-52(s0)
    1fc8:	2781                	sext.w	a5,a5
    1fca:	06e7d163          	bge	a5,a4,202c <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    1fce:	fa043783          	ld	a5,-96(s0)
    1fd2:	57fc                	lw	a5,108(a5)
    1fd4:	eb91                	bnez	a5,1fe8 <schedule_edf_cbs+0x35e>
    1fd6:	fa843783          	ld	a5,-88(s0)
    1fda:	639c                	ld	a5,0(a5)
    1fdc:	57fc                	lw	a5,108(a5)
    1fde:	c789                	beqz	a5,1fe8 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    1fe0:	4785                	li	a5,1
    1fe2:	fcf42423          	sw	a5,-56(s0)
    1fe6:	a099                	j	202c <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    1fe8:	fa043783          	ld	a5,-96(s0)
    1fec:	4fb8                	lw	a4,88(a5)
    1fee:	fa843783          	ld	a5,-88(s0)
    1ff2:	639c                	ld	a5,0(a5)
    1ff4:	4fbc                	lw	a5,88(a5)
    1ff6:	00e7d663          	bge	a5,a4,2002 <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    1ffa:	4785                	li	a5,1
    1ffc:	fcf42423          	sw	a5,-56(s0)
    2000:	a035                	j	202c <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    2002:	fa043783          	ld	a5,-96(s0)
    2006:	4fb8                	lw	a4,88(a5)
    2008:	fa843783          	ld	a5,-88(s0)
    200c:	639c                	ld	a5,0(a5)
    200e:	4fbc                	lw	a5,88(a5)
    2010:	00f71e63          	bne	a4,a5,202c <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    2014:	fa043783          	ld	a5,-96(s0)
    2018:	5fd8                	lw	a4,60(a5)
    201a:	fa843783          	ld	a5,-88(s0)
    201e:	639c                	ld	a5,0(a5)
    2020:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    2022:	00e7d563          	bge	a5,a4,202c <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    2026:	4785                	li	a5,1
    2028:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    202c:	fa043783          	ld	a5,-96(s0)
    2030:	cbd1                	beqz	a5,20c4 <schedule_edf_cbs+0x43a>
    2032:	fa043783          	ld	a5,-96(s0)
    2036:	57fc                	lw	a5,108(a5)
    2038:	e7d1                	bnez	a5,20c4 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    203a:	fa043783          	ld	a5,-96(s0)
    203e:	4fb8                	lw	a4,88(a5)
    2040:	409c                	lw	a5,0(s1)
    2042:	40f707bb          	subw	a5,a4,a5
    2046:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    204a:	fa043783          	ld	a5,-96(s0)
    204e:	47f8                	lw	a4,76(a5)
    2050:	fa043783          	ld	a5,-96(s0)
    2054:	57bc                	lw	a5,104(a5)
    2056:	02f707bb          	mulw	a5,a4,a5
    205a:	0007869b          	sext.w	a3,a5
    205e:	fa043783          	ld	a5,-96(s0)
    2062:	53fc                	lw	a5,100(a5)
    2064:	f7442703          	lw	a4,-140(s0)
    2068:	02f707bb          	mulw	a5,a4,a5
    206c:	2781                	sext.w	a5,a5
    206e:	8736                	mv	a4,a3
    2070:	02e7d263          	bge	a5,a4,2094 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    2074:	4098                	lw	a4,0(s1)
    2076:	fa043783          	ld	a5,-96(s0)
    207a:	47fc                	lw	a5,76(a5)
    207c:	9fb9                	addw	a5,a5,a4
    207e:	0007871b          	sext.w	a4,a5
    2082:	fa043783          	ld	a5,-96(s0)
    2086:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    2088:	fa043783          	ld	a5,-96(s0)
    208c:	53f8                	lw	a4,100(a5)
    208e:	fa043783          	ld	a5,-96(s0)
    2092:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    2094:	fa043783          	ld	a5,-96(s0)
    2098:	4bf8                	lw	a4,84(a5)
    209a:	fa043783          	ld	a5,-96(s0)
    209e:	57bc                	lw	a5,104(a5)
    20a0:	02e7d263          	bge	a5,a4,20c4 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    20a4:	fa043783          	ld	a5,-96(s0)
    20a8:	4705                	li	a4,1
    20aa:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    20ac:	fa043783          	ld	a5,-96(s0)
    20b0:	4fb8                	lw	a4,88(a5)
    20b2:	fa043783          	ld	a5,-96(s0)
    20b6:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    20b8:	fa043783          	ld	a5,-96(s0)
    20bc:	4bf8                	lw	a4,84(a5)
    20be:	fa043783          	ld	a5,-96(s0)
    20c2:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    20c4:	fa043783          	ld	a5,-96(s0)
    20c8:	c3a9                	beqz	a5,210a <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    20ca:	fa043783          	ld	a5,-96(s0)
    20ce:	02878793          	addi	a5,a5,40
    20d2:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    20d6:	fa843783          	ld	a5,-88(s0)
    20da:	cb91                	beqz	a5,20ee <schedule_edf_cbs+0x464>
    20dc:	fc842783          	lw	a5,-56(s0)
    20e0:	2781                	sext.w	a5,a5
    20e2:	c791                	beqz	a5,20ee <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    20e4:	fcc42783          	lw	a5,-52(s0)
    20e8:	f4f42423          	sw	a5,-184(s0)
    20ec:	a81d                	j	2122 <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    20ee:	fa043783          	ld	a5,-96(s0)
    20f2:	5bbc                	lw	a5,112(a5)
    20f4:	c789                	beqz	a5,20fe <schedule_edf_cbs+0x474>
    20f6:	fa043783          	ld	a5,-96(s0)
    20fa:	57bc                	lw	a5,104(a5)
    20fc:	a021                	j	2104 <schedule_edf_cbs+0x47a>
    20fe:	fa043783          	ld	a5,-96(s0)
    2102:	4bfc                	lw	a5,84(a5)
    2104:	f4f42423          	sw	a5,-184(s0)
    2108:	a829                	j	2122 <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    210a:	649c                	ld	a5,8(s1)
    210c:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    2110:	fa843783          	ld	a5,-88(s0)
    2114:	c781                	beqz	a5,211c <schedule_edf_cbs+0x492>
    2116:	fcc42783          	lw	a5,-52(s0)
    211a:	a011                	j	211e <schedule_edf_cbs+0x494>
    211c:	4785                	li	a5,1
    211e:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    2122:	f4043783          	ld	a5,-192(s0)
    2126:	f4f43823          	sd	a5,-176(s0)
    212a:	f4843783          	ld	a5,-184(s0)
    212e:	f4f43c23          	sd	a5,-168(s0)
    2132:	4701                	li	a4,0
    2134:	f5043703          	ld	a4,-176(s0)
    2138:	4781                	li	a5,0
    213a:	f5843783          	ld	a5,-168(s0)
    213e:	893a                	mv	s2,a4
    2140:	89be                	mv	s3,a5
    2142:	874a                	mv	a4,s2
    2144:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    2146:	853a                	mv	a0,a4
    2148:	85be                	mv	a1,a5
    214a:	70ea                	ld	ra,184(sp)
    214c:	744a                	ld	s0,176(sp)
    214e:	74aa                	ld	s1,168(sp)
    2150:	790a                	ld	s2,160(sp)
    2152:	69ea                	ld	s3,152(sp)
    2154:	6129                	addi	sp,sp,192
    2156:	8082                	ret
