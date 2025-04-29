
user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	715d                	addi	sp,sp,-80
       2:	e486                	sd	ra,72(sp)
       4:	e0a2                	sd	s0,64(sp)
       6:	0880                	addi	s0,sp,80
       8:	faa43c23          	sd	a0,-72(s0)
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       c:	fb843783          	ld	a5,-72(s0)
      10:	e791                	bnez	a5,1c <runcmd+0x1c>
    exit(1);
      12:	4505                	li	a0,1
      14:	00001097          	auipc	ra,0x1
      18:	3d8080e7          	jalr	984(ra) # 13ec <exit>

  switch(cmd->type){
      1c:	fb843783          	ld	a5,-72(s0)
      20:	439c                	lw	a5,0(a5)
      22:	86be                	mv	a3,a5
      24:	4715                	li	a4,5
      26:	02d76263          	bltu	a4,a3,4a <runcmd+0x4a>
      2a:	00279713          	slli	a4,a5,0x2
      2e:	00003797          	auipc	a5,0x3
      32:	efa78793          	addi	a5,a5,-262 # 2f28 <schedule_edf_cbs+0x500>
      36:	97ba                	add	a5,a5,a4
      38:	439c                	lw	a5,0(a5)
      3a:	0007871b          	sext.w	a4,a5
      3e:	00003797          	auipc	a5,0x3
      42:	eea78793          	addi	a5,a5,-278 # 2f28 <schedule_edf_cbs+0x500>
      46:	97ba                	add	a5,a5,a4
      48:	8782                	jr	a5
  default:
    panic("runcmd");
      4a:	00003517          	auipc	a0,0x3
      4e:	eae50513          	addi	a0,a0,-338 # 2ef8 <schedule_edf_cbs+0x4d0>
      52:	00000097          	auipc	ra,0x0
      56:	3d8080e7          	jalr	984(ra) # 42a <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      5a:	fb843783          	ld	a5,-72(s0)
      5e:	fcf43423          	sd	a5,-56(s0)
    if(ecmd->argv[0] == 0)
      62:	fc843783          	ld	a5,-56(s0)
      66:	679c                	ld	a5,8(a5)
      68:	e791                	bnez	a5,74 <runcmd+0x74>
      exit(1);
      6a:	4505                	li	a0,1
      6c:	00001097          	auipc	ra,0x1
      70:	380080e7          	jalr	896(ra) # 13ec <exit>
    exec(ecmd->argv[0], ecmd->argv);
      74:	fc843783          	ld	a5,-56(s0)
      78:	6798                	ld	a4,8(a5)
      7a:	fc843783          	ld	a5,-56(s0)
      7e:	07a1                	addi	a5,a5,8
      80:	85be                	mv	a1,a5
      82:	853a                	mv	a0,a4
      84:	00001097          	auipc	ra,0x1
      88:	3a0080e7          	jalr	928(ra) # 1424 <exec>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
      8c:	fc843783          	ld	a5,-56(s0)
      90:	679c                	ld	a5,8(a5)
      92:	863e                	mv	a2,a5
      94:	00003597          	auipc	a1,0x3
      98:	e6c58593          	addi	a1,a1,-404 # 2f00 <schedule_edf_cbs+0x4d8>
      9c:	4509                	li	a0,2
      9e:	00002097          	auipc	ra,0x2
      a2:	83c080e7          	jalr	-1988(ra) # 18da <fprintf>
    break;
      a6:	aac9                	j	278 <runcmd+0x278>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      a8:	fb843783          	ld	a5,-72(s0)
      ac:	fcf43823          	sd	a5,-48(s0)
    close(rcmd->fd);
      b0:	fd043783          	ld	a5,-48(s0)
      b4:	53dc                	lw	a5,36(a5)
      b6:	853e                	mv	a0,a5
      b8:	00001097          	auipc	ra,0x1
      bc:	35c080e7          	jalr	860(ra) # 1414 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      c0:	fd043783          	ld	a5,-48(s0)
      c4:	6b98                	ld	a4,16(a5)
      c6:	fd043783          	ld	a5,-48(s0)
      ca:	539c                	lw	a5,32(a5)
      cc:	85be                	mv	a1,a5
      ce:	853a                	mv	a0,a4
      d0:	00001097          	auipc	ra,0x1
      d4:	35c080e7          	jalr	860(ra) # 142c <open>
      d8:	87aa                	mv	a5,a0
      da:	0207d463          	bgez	a5,102 <runcmd+0x102>
      fprintf(2, "open %s failed\n", rcmd->file);
      de:	fd043783          	ld	a5,-48(s0)
      e2:	6b9c                	ld	a5,16(a5)
      e4:	863e                	mv	a2,a5
      e6:	00003597          	auipc	a1,0x3
      ea:	e2a58593          	addi	a1,a1,-470 # 2f10 <schedule_edf_cbs+0x4e8>
      ee:	4509                	li	a0,2
      f0:	00001097          	auipc	ra,0x1
      f4:	7ea080e7          	jalr	2026(ra) # 18da <fprintf>
      exit(1);
      f8:	4505                	li	a0,1
      fa:	00001097          	auipc	ra,0x1
      fe:	2f2080e7          	jalr	754(ra) # 13ec <exit>
    }
    runcmd(rcmd->cmd);
     102:	fd043783          	ld	a5,-48(s0)
     106:	679c                	ld	a5,8(a5)
     108:	853e                	mv	a0,a5
     10a:	00000097          	auipc	ra,0x0
     10e:	ef6080e7          	jalr	-266(ra) # 0 <runcmd>
    break;
     112:	a29d                	j	278 <runcmd+0x278>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     114:	fb843783          	ld	a5,-72(s0)
     118:	fef43023          	sd	a5,-32(s0)
    if(fork1() == 0)
     11c:	00000097          	auipc	ra,0x0
     120:	33a080e7          	jalr	826(ra) # 456 <fork1>
     124:	87aa                	mv	a5,a0
     126:	eb89                	bnez	a5,138 <runcmd+0x138>
      runcmd(lcmd->left);
     128:	fe043783          	ld	a5,-32(s0)
     12c:	679c                	ld	a5,8(a5)
     12e:	853e                	mv	a0,a5
     130:	00000097          	auipc	ra,0x0
     134:	ed0080e7          	jalr	-304(ra) # 0 <runcmd>
    wait(0);
     138:	4501                	li	a0,0
     13a:	00001097          	auipc	ra,0x1
     13e:	2ba080e7          	jalr	698(ra) # 13f4 <wait>
    runcmd(lcmd->right);
     142:	fe043783          	ld	a5,-32(s0)
     146:	6b9c                	ld	a5,16(a5)
     148:	853e                	mv	a0,a5
     14a:	00000097          	auipc	ra,0x0
     14e:	eb6080e7          	jalr	-330(ra) # 0 <runcmd>
    break;
     152:	a21d                	j	278 <runcmd+0x278>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     154:	fb843783          	ld	a5,-72(s0)
     158:	fcf43c23          	sd	a5,-40(s0)
    if(pipe(p) < 0)
     15c:	fc040793          	addi	a5,s0,-64
     160:	853e                	mv	a0,a5
     162:	00001097          	auipc	ra,0x1
     166:	29a080e7          	jalr	666(ra) # 13fc <pipe>
     16a:	87aa                	mv	a5,a0
     16c:	0007da63          	bgez	a5,180 <runcmd+0x180>
      panic("pipe");
     170:	00003517          	auipc	a0,0x3
     174:	db050513          	addi	a0,a0,-592 # 2f20 <schedule_edf_cbs+0x4f8>
     178:	00000097          	auipc	ra,0x0
     17c:	2b2080e7          	jalr	690(ra) # 42a <panic>
    if(fork1() == 0){
     180:	00000097          	auipc	ra,0x0
     184:	2d6080e7          	jalr	726(ra) # 456 <fork1>
     188:	87aa                	mv	a5,a0
     18a:	e3b9                	bnez	a5,1d0 <runcmd+0x1d0>
      close(1);
     18c:	4505                	li	a0,1
     18e:	00001097          	auipc	ra,0x1
     192:	286080e7          	jalr	646(ra) # 1414 <close>
      dup(p[1]);
     196:	fc442783          	lw	a5,-60(s0)
     19a:	853e                	mv	a0,a5
     19c:	00001097          	auipc	ra,0x1
     1a0:	2c8080e7          	jalr	712(ra) # 1464 <dup>
      close(p[0]);
     1a4:	fc042783          	lw	a5,-64(s0)
     1a8:	853e                	mv	a0,a5
     1aa:	00001097          	auipc	ra,0x1
     1ae:	26a080e7          	jalr	618(ra) # 1414 <close>
      close(p[1]);
     1b2:	fc442783          	lw	a5,-60(s0)
     1b6:	853e                	mv	a0,a5
     1b8:	00001097          	auipc	ra,0x1
     1bc:	25c080e7          	jalr	604(ra) # 1414 <close>
      runcmd(pcmd->left);
     1c0:	fd843783          	ld	a5,-40(s0)
     1c4:	679c                	ld	a5,8(a5)
     1c6:	853e                	mv	a0,a5
     1c8:	00000097          	auipc	ra,0x0
     1cc:	e38080e7          	jalr	-456(ra) # 0 <runcmd>
    }
    if(fork1() == 0){
     1d0:	00000097          	auipc	ra,0x0
     1d4:	286080e7          	jalr	646(ra) # 456 <fork1>
     1d8:	87aa                	mv	a5,a0
     1da:	e3b9                	bnez	a5,220 <runcmd+0x220>
      close(0);
     1dc:	4501                	li	a0,0
     1de:	00001097          	auipc	ra,0x1
     1e2:	236080e7          	jalr	566(ra) # 1414 <close>
      dup(p[0]);
     1e6:	fc042783          	lw	a5,-64(s0)
     1ea:	853e                	mv	a0,a5
     1ec:	00001097          	auipc	ra,0x1
     1f0:	278080e7          	jalr	632(ra) # 1464 <dup>
      close(p[0]);
     1f4:	fc042783          	lw	a5,-64(s0)
     1f8:	853e                	mv	a0,a5
     1fa:	00001097          	auipc	ra,0x1
     1fe:	21a080e7          	jalr	538(ra) # 1414 <close>
      close(p[1]);
     202:	fc442783          	lw	a5,-60(s0)
     206:	853e                	mv	a0,a5
     208:	00001097          	auipc	ra,0x1
     20c:	20c080e7          	jalr	524(ra) # 1414 <close>
      runcmd(pcmd->right);
     210:	fd843783          	ld	a5,-40(s0)
     214:	6b9c                	ld	a5,16(a5)
     216:	853e                	mv	a0,a5
     218:	00000097          	auipc	ra,0x0
     21c:	de8080e7          	jalr	-536(ra) # 0 <runcmd>
    }
    close(p[0]);
     220:	fc042783          	lw	a5,-64(s0)
     224:	853e                	mv	a0,a5
     226:	00001097          	auipc	ra,0x1
     22a:	1ee080e7          	jalr	494(ra) # 1414 <close>
    close(p[1]);
     22e:	fc442783          	lw	a5,-60(s0)
     232:	853e                	mv	a0,a5
     234:	00001097          	auipc	ra,0x1
     238:	1e0080e7          	jalr	480(ra) # 1414 <close>
    wait(0);
     23c:	4501                	li	a0,0
     23e:	00001097          	auipc	ra,0x1
     242:	1b6080e7          	jalr	438(ra) # 13f4 <wait>
    wait(0);
     246:	4501                	li	a0,0
     248:	00001097          	auipc	ra,0x1
     24c:	1ac080e7          	jalr	428(ra) # 13f4 <wait>
    break;
     250:	a025                	j	278 <runcmd+0x278>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     252:	fb843783          	ld	a5,-72(s0)
     256:	fef43423          	sd	a5,-24(s0)
    if(fork1() == 0)
     25a:	00000097          	auipc	ra,0x0
     25e:	1fc080e7          	jalr	508(ra) # 456 <fork1>
     262:	87aa                	mv	a5,a0
     264:	eb89                	bnez	a5,276 <runcmd+0x276>
      runcmd(bcmd->cmd);
     266:	fe843783          	ld	a5,-24(s0)
     26a:	679c                	ld	a5,8(a5)
     26c:	853e                	mv	a0,a5
     26e:	00000097          	auipc	ra,0x0
     272:	d92080e7          	jalr	-622(ra) # 0 <runcmd>
    break;
     276:	0001                	nop
  }
  exit(0);
     278:	4501                	li	a0,0
     27a:	00001097          	auipc	ra,0x1
     27e:	172080e7          	jalr	370(ra) # 13ec <exit>

0000000000000282 <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     282:	1101                	addi	sp,sp,-32
     284:	ec06                	sd	ra,24(sp)
     286:	e822                	sd	s0,16(sp)
     288:	1000                	addi	s0,sp,32
     28a:	fea43423          	sd	a0,-24(s0)
     28e:	87ae                	mv	a5,a1
     290:	fef42223          	sw	a5,-28(s0)
  fprintf(2, "$ ");
     294:	00003597          	auipc	a1,0x3
     298:	cac58593          	addi	a1,a1,-852 # 2f40 <schedule_edf_cbs+0x518>
     29c:	4509                	li	a0,2
     29e:	00001097          	auipc	ra,0x1
     2a2:	63c080e7          	jalr	1596(ra) # 18da <fprintf>
  memset(buf, 0, nbuf);
     2a6:	fe442783          	lw	a5,-28(s0)
     2aa:	863e                	mv	a2,a5
     2ac:	4581                	li	a1,0
     2ae:	fe843503          	ld	a0,-24(s0)
     2b2:	00001097          	auipc	ra,0x1
     2b6:	d90080e7          	jalr	-624(ra) # 1042 <memset>
  gets(buf, nbuf);
     2ba:	fe442783          	lw	a5,-28(s0)
     2be:	85be                	mv	a1,a5
     2c0:	fe843503          	ld	a0,-24(s0)
     2c4:	00001097          	auipc	ra,0x1
     2c8:	e28080e7          	jalr	-472(ra) # 10ec <gets>
  if(buf[0] == 0) // EOF
     2cc:	fe843783          	ld	a5,-24(s0)
     2d0:	0007c783          	lbu	a5,0(a5)
     2d4:	e399                	bnez	a5,2da <getcmd+0x58>
    return -1;
     2d6:	57fd                	li	a5,-1
     2d8:	a011                	j	2dc <getcmd+0x5a>
  return 0;
     2da:	4781                	li	a5,0
}
     2dc:	853e                	mv	a0,a5
     2de:	60e2                	ld	ra,24(sp)
     2e0:	6442                	ld	s0,16(sp)
     2e2:	6105                	addi	sp,sp,32
     2e4:	8082                	ret

00000000000002e6 <main>:

int
main(void)
{
     2e6:	1101                	addi	sp,sp,-32
     2e8:	ec06                	sd	ra,24(sp)
     2ea:	e822                	sd	s0,16(sp)
     2ec:	1000                	addi	s0,sp,32
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
     2ee:	a005                	j	30e <main+0x28>
    if(fd >= 3){
     2f0:	fec42783          	lw	a5,-20(s0)
     2f4:	0007871b          	sext.w	a4,a5
     2f8:	4789                	li	a5,2
     2fa:	00e7da63          	bge	a5,a4,30e <main+0x28>
      close(fd);
     2fe:	fec42783          	lw	a5,-20(s0)
     302:	853e                	mv	a0,a5
     304:	00001097          	auipc	ra,0x1
     308:	110080e7          	jalr	272(ra) # 1414 <close>
      break;
     30c:	a015                	j	330 <main+0x4a>
  while((fd = open("console", O_RDWR)) >= 0){
     30e:	4589                	li	a1,2
     310:	00003517          	auipc	a0,0x3
     314:	c3850513          	addi	a0,a0,-968 # 2f48 <schedule_edf_cbs+0x520>
     318:	00001097          	auipc	ra,0x1
     31c:	114080e7          	jalr	276(ra) # 142c <open>
     320:	87aa                	mv	a5,a0
     322:	fef42623          	sw	a5,-20(s0)
     326:	fec42783          	lw	a5,-20(s0)
     32a:	2781                	sext.w	a5,a5
     32c:	fc07d2e3          	bgez	a5,2f0 <main+0xa>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     330:	a8d9                	j	406 <main+0x120>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     332:	00003797          	auipc	a5,0x3
     336:	fde78793          	addi	a5,a5,-34 # 3310 <buf.1144>
     33a:	0007c783          	lbu	a5,0(a5)
     33e:	873e                	mv	a4,a5
     340:	06300793          	li	a5,99
     344:	08f71863          	bne	a4,a5,3d4 <main+0xee>
     348:	00003797          	auipc	a5,0x3
     34c:	fc878793          	addi	a5,a5,-56 # 3310 <buf.1144>
     350:	0017c783          	lbu	a5,1(a5)
     354:	873e                	mv	a4,a5
     356:	06400793          	li	a5,100
     35a:	06f71d63          	bne	a4,a5,3d4 <main+0xee>
     35e:	00003797          	auipc	a5,0x3
     362:	fb278793          	addi	a5,a5,-78 # 3310 <buf.1144>
     366:	0027c783          	lbu	a5,2(a5)
     36a:	873e                	mv	a4,a5
     36c:	02000793          	li	a5,32
     370:	06f71263          	bne	a4,a5,3d4 <main+0xee>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     374:	00003517          	auipc	a0,0x3
     378:	f9c50513          	addi	a0,a0,-100 # 3310 <buf.1144>
     37c:	00001097          	auipc	ra,0x1
     380:	c90080e7          	jalr	-880(ra) # 100c <strlen>
     384:	87aa                	mv	a5,a0
     386:	2781                	sext.w	a5,a5
     388:	37fd                	addiw	a5,a5,-1
     38a:	2781                	sext.w	a5,a5
     38c:	00003717          	auipc	a4,0x3
     390:	f8470713          	addi	a4,a4,-124 # 3310 <buf.1144>
     394:	1782                	slli	a5,a5,0x20
     396:	9381                	srli	a5,a5,0x20
     398:	97ba                	add	a5,a5,a4
     39a:	00078023          	sb	zero,0(a5)
      if(chdir(buf+3) < 0)
     39e:	00003797          	auipc	a5,0x3
     3a2:	f7578793          	addi	a5,a5,-139 # 3313 <buf.1144+0x3>
     3a6:	853e                	mv	a0,a5
     3a8:	00001097          	auipc	ra,0x1
     3ac:	0b4080e7          	jalr	180(ra) # 145c <chdir>
     3b0:	87aa                	mv	a5,a0
     3b2:	0407da63          	bgez	a5,406 <main+0x120>
        fprintf(2, "cannot cd %s\n", buf+3);
     3b6:	00003797          	auipc	a5,0x3
     3ba:	f5d78793          	addi	a5,a5,-163 # 3313 <buf.1144+0x3>
     3be:	863e                	mv	a2,a5
     3c0:	00003597          	auipc	a1,0x3
     3c4:	b9058593          	addi	a1,a1,-1136 # 2f50 <schedule_edf_cbs+0x528>
     3c8:	4509                	li	a0,2
     3ca:	00001097          	auipc	ra,0x1
     3ce:	510080e7          	jalr	1296(ra) # 18da <fprintf>
      continue;
     3d2:	a815                	j	406 <main+0x120>
    }
    if(fork1() == 0)
     3d4:	00000097          	auipc	ra,0x0
     3d8:	082080e7          	jalr	130(ra) # 456 <fork1>
     3dc:	87aa                	mv	a5,a0
     3de:	ef99                	bnez	a5,3fc <main+0x116>
      runcmd(parsecmd(buf));
     3e0:	00003517          	auipc	a0,0x3
     3e4:	f3050513          	addi	a0,a0,-208 # 3310 <buf.1144>
     3e8:	00000097          	auipc	ra,0x0
     3ec:	4e2080e7          	jalr	1250(ra) # 8ca <parsecmd>
     3f0:	87aa                	mv	a5,a0
     3f2:	853e                	mv	a0,a5
     3f4:	00000097          	auipc	ra,0x0
     3f8:	c0c080e7          	jalr	-1012(ra) # 0 <runcmd>
    wait(0);
     3fc:	4501                	li	a0,0
     3fe:	00001097          	auipc	ra,0x1
     402:	ff6080e7          	jalr	-10(ra) # 13f4 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     406:	06400593          	li	a1,100
     40a:	00003517          	auipc	a0,0x3
     40e:	f0650513          	addi	a0,a0,-250 # 3310 <buf.1144>
     412:	00000097          	auipc	ra,0x0
     416:	e70080e7          	jalr	-400(ra) # 282 <getcmd>
     41a:	87aa                	mv	a5,a0
     41c:	f007dbe3          	bgez	a5,332 <main+0x4c>
  }
  exit(0);
     420:	4501                	li	a0,0
     422:	00001097          	auipc	ra,0x1
     426:	fca080e7          	jalr	-54(ra) # 13ec <exit>

000000000000042a <panic>:
}

void
panic(char *s)
{
     42a:	1101                	addi	sp,sp,-32
     42c:	ec06                	sd	ra,24(sp)
     42e:	e822                	sd	s0,16(sp)
     430:	1000                	addi	s0,sp,32
     432:	fea43423          	sd	a0,-24(s0)
  fprintf(2, "%s\n", s);
     436:	fe843603          	ld	a2,-24(s0)
     43a:	00003597          	auipc	a1,0x3
     43e:	b2658593          	addi	a1,a1,-1242 # 2f60 <schedule_edf_cbs+0x538>
     442:	4509                	li	a0,2
     444:	00001097          	auipc	ra,0x1
     448:	496080e7          	jalr	1174(ra) # 18da <fprintf>
  exit(1);
     44c:	4505                	li	a0,1
     44e:	00001097          	auipc	ra,0x1
     452:	f9e080e7          	jalr	-98(ra) # 13ec <exit>

0000000000000456 <fork1>:
}

int
fork1(void)
{
     456:	1101                	addi	sp,sp,-32
     458:	ec06                	sd	ra,24(sp)
     45a:	e822                	sd	s0,16(sp)
     45c:	1000                	addi	s0,sp,32
  int pid;

  pid = fork();
     45e:	00001097          	auipc	ra,0x1
     462:	f86080e7          	jalr	-122(ra) # 13e4 <fork>
     466:	87aa                	mv	a5,a0
     468:	fef42623          	sw	a5,-20(s0)
  if(pid == -1)
     46c:	fec42783          	lw	a5,-20(s0)
     470:	0007871b          	sext.w	a4,a5
     474:	57fd                	li	a5,-1
     476:	00f71a63          	bne	a4,a5,48a <fork1+0x34>
    panic("fork");
     47a:	00003517          	auipc	a0,0x3
     47e:	aee50513          	addi	a0,a0,-1298 # 2f68 <schedule_edf_cbs+0x540>
     482:	00000097          	auipc	ra,0x0
     486:	fa8080e7          	jalr	-88(ra) # 42a <panic>
  return pid;
     48a:	fec42783          	lw	a5,-20(s0)
}
     48e:	853e                	mv	a0,a5
     490:	60e2                	ld	ra,24(sp)
     492:	6442                	ld	s0,16(sp)
     494:	6105                	addi	sp,sp,32
     496:	8082                	ret

0000000000000498 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     498:	1101                	addi	sp,sp,-32
     49a:	ec06                	sd	ra,24(sp)
     49c:	e822                	sd	s0,16(sp)
     49e:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4a0:	0a800513          	li	a0,168
     4a4:	00001097          	auipc	ra,0x1
     4a8:	680080e7          	jalr	1664(ra) # 1b24 <malloc>
     4ac:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     4b0:	0a800613          	li	a2,168
     4b4:	4581                	li	a1,0
     4b6:	fe843503          	ld	a0,-24(s0)
     4ba:	00001097          	auipc	ra,0x1
     4be:	b88080e7          	jalr	-1144(ra) # 1042 <memset>
  cmd->type = EXEC;
     4c2:	fe843783          	ld	a5,-24(s0)
     4c6:	4705                	li	a4,1
     4c8:	c398                	sw	a4,0(a5)
  return (struct cmd*)cmd;
     4ca:	fe843783          	ld	a5,-24(s0)
}
     4ce:	853e                	mv	a0,a5
     4d0:	60e2                	ld	ra,24(sp)
     4d2:	6442                	ld	s0,16(sp)
     4d4:	6105                	addi	sp,sp,32
     4d6:	8082                	ret

00000000000004d8 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     4d8:	7139                	addi	sp,sp,-64
     4da:	fc06                	sd	ra,56(sp)
     4dc:	f822                	sd	s0,48(sp)
     4de:	0080                	addi	s0,sp,64
     4e0:	fca43c23          	sd	a0,-40(s0)
     4e4:	fcb43823          	sd	a1,-48(s0)
     4e8:	fcc43423          	sd	a2,-56(s0)
     4ec:	87b6                	mv	a5,a3
     4ee:	fcf42223          	sw	a5,-60(s0)
     4f2:	87ba                	mv	a5,a4
     4f4:	fcf42023          	sw	a5,-64(s0)
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4f8:	02800513          	li	a0,40
     4fc:	00001097          	auipc	ra,0x1
     500:	628080e7          	jalr	1576(ra) # 1b24 <malloc>
     504:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     508:	02800613          	li	a2,40
     50c:	4581                	li	a1,0
     50e:	fe843503          	ld	a0,-24(s0)
     512:	00001097          	auipc	ra,0x1
     516:	b30080e7          	jalr	-1232(ra) # 1042 <memset>
  cmd->type = REDIR;
     51a:	fe843783          	ld	a5,-24(s0)
     51e:	4709                	li	a4,2
     520:	c398                	sw	a4,0(a5)
  cmd->cmd = subcmd;
     522:	fe843783          	ld	a5,-24(s0)
     526:	fd843703          	ld	a4,-40(s0)
     52a:	e798                	sd	a4,8(a5)
  cmd->file = file;
     52c:	fe843783          	ld	a5,-24(s0)
     530:	fd043703          	ld	a4,-48(s0)
     534:	eb98                	sd	a4,16(a5)
  cmd->efile = efile;
     536:	fe843783          	ld	a5,-24(s0)
     53a:	fc843703          	ld	a4,-56(s0)
     53e:	ef98                	sd	a4,24(a5)
  cmd->mode = mode;
     540:	fe843783          	ld	a5,-24(s0)
     544:	fc442703          	lw	a4,-60(s0)
     548:	d398                	sw	a4,32(a5)
  cmd->fd = fd;
     54a:	fe843783          	ld	a5,-24(s0)
     54e:	fc042703          	lw	a4,-64(s0)
     552:	d3d8                	sw	a4,36(a5)
  return (struct cmd*)cmd;
     554:	fe843783          	ld	a5,-24(s0)
}
     558:	853e                	mv	a0,a5
     55a:	70e2                	ld	ra,56(sp)
     55c:	7442                	ld	s0,48(sp)
     55e:	6121                	addi	sp,sp,64
     560:	8082                	ret

0000000000000562 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     562:	7179                	addi	sp,sp,-48
     564:	f406                	sd	ra,40(sp)
     566:	f022                	sd	s0,32(sp)
     568:	1800                	addi	s0,sp,48
     56a:	fca43c23          	sd	a0,-40(s0)
     56e:	fcb43823          	sd	a1,-48(s0)
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     572:	4561                	li	a0,24
     574:	00001097          	auipc	ra,0x1
     578:	5b0080e7          	jalr	1456(ra) # 1b24 <malloc>
     57c:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     580:	4661                	li	a2,24
     582:	4581                	li	a1,0
     584:	fe843503          	ld	a0,-24(s0)
     588:	00001097          	auipc	ra,0x1
     58c:	aba080e7          	jalr	-1350(ra) # 1042 <memset>
  cmd->type = PIPE;
     590:	fe843783          	ld	a5,-24(s0)
     594:	470d                	li	a4,3
     596:	c398                	sw	a4,0(a5)
  cmd->left = left;
     598:	fe843783          	ld	a5,-24(s0)
     59c:	fd843703          	ld	a4,-40(s0)
     5a0:	e798                	sd	a4,8(a5)
  cmd->right = right;
     5a2:	fe843783          	ld	a5,-24(s0)
     5a6:	fd043703          	ld	a4,-48(s0)
     5aa:	eb98                	sd	a4,16(a5)
  return (struct cmd*)cmd;
     5ac:	fe843783          	ld	a5,-24(s0)
}
     5b0:	853e                	mv	a0,a5
     5b2:	70a2                	ld	ra,40(sp)
     5b4:	7402                	ld	s0,32(sp)
     5b6:	6145                	addi	sp,sp,48
     5b8:	8082                	ret

00000000000005ba <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     5ba:	7179                	addi	sp,sp,-48
     5bc:	f406                	sd	ra,40(sp)
     5be:	f022                	sd	s0,32(sp)
     5c0:	1800                	addi	s0,sp,48
     5c2:	fca43c23          	sd	a0,-40(s0)
     5c6:	fcb43823          	sd	a1,-48(s0)
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5ca:	4561                	li	a0,24
     5cc:	00001097          	auipc	ra,0x1
     5d0:	558080e7          	jalr	1368(ra) # 1b24 <malloc>
     5d4:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     5d8:	4661                	li	a2,24
     5da:	4581                	li	a1,0
     5dc:	fe843503          	ld	a0,-24(s0)
     5e0:	00001097          	auipc	ra,0x1
     5e4:	a62080e7          	jalr	-1438(ra) # 1042 <memset>
  cmd->type = LIST;
     5e8:	fe843783          	ld	a5,-24(s0)
     5ec:	4711                	li	a4,4
     5ee:	c398                	sw	a4,0(a5)
  cmd->left = left;
     5f0:	fe843783          	ld	a5,-24(s0)
     5f4:	fd843703          	ld	a4,-40(s0)
     5f8:	e798                	sd	a4,8(a5)
  cmd->right = right;
     5fa:	fe843783          	ld	a5,-24(s0)
     5fe:	fd043703          	ld	a4,-48(s0)
     602:	eb98                	sd	a4,16(a5)
  return (struct cmd*)cmd;
     604:	fe843783          	ld	a5,-24(s0)
}
     608:	853e                	mv	a0,a5
     60a:	70a2                	ld	ra,40(sp)
     60c:	7402                	ld	s0,32(sp)
     60e:	6145                	addi	sp,sp,48
     610:	8082                	ret

0000000000000612 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     612:	7179                	addi	sp,sp,-48
     614:	f406                	sd	ra,40(sp)
     616:	f022                	sd	s0,32(sp)
     618:	1800                	addi	s0,sp,48
     61a:	fca43c23          	sd	a0,-40(s0)
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     61e:	4541                	li	a0,16
     620:	00001097          	auipc	ra,0x1
     624:	504080e7          	jalr	1284(ra) # 1b24 <malloc>
     628:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     62c:	4641                	li	a2,16
     62e:	4581                	li	a1,0
     630:	fe843503          	ld	a0,-24(s0)
     634:	00001097          	auipc	ra,0x1
     638:	a0e080e7          	jalr	-1522(ra) # 1042 <memset>
  cmd->type = BACK;
     63c:	fe843783          	ld	a5,-24(s0)
     640:	4715                	li	a4,5
     642:	c398                	sw	a4,0(a5)
  cmd->cmd = subcmd;
     644:	fe843783          	ld	a5,-24(s0)
     648:	fd843703          	ld	a4,-40(s0)
     64c:	e798                	sd	a4,8(a5)
  return (struct cmd*)cmd;
     64e:	fe843783          	ld	a5,-24(s0)
}
     652:	853e                	mv	a0,a5
     654:	70a2                	ld	ra,40(sp)
     656:	7402                	ld	s0,32(sp)
     658:	6145                	addi	sp,sp,48
     65a:	8082                	ret

000000000000065c <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     65c:	7139                	addi	sp,sp,-64
     65e:	fc06                	sd	ra,56(sp)
     660:	f822                	sd	s0,48(sp)
     662:	0080                	addi	s0,sp,64
     664:	fca43c23          	sd	a0,-40(s0)
     668:	fcb43823          	sd	a1,-48(s0)
     66c:	fcc43423          	sd	a2,-56(s0)
     670:	fcd43023          	sd	a3,-64(s0)
  char *s;
  int ret;

  s = *ps;
     674:	fd843783          	ld	a5,-40(s0)
     678:	639c                	ld	a5,0(a5)
     67a:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     67e:	a031                	j	68a <gettoken+0x2e>
    s++;
     680:	fe843783          	ld	a5,-24(s0)
     684:	0785                	addi	a5,a5,1
     686:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     68a:	fe843703          	ld	a4,-24(s0)
     68e:	fd043783          	ld	a5,-48(s0)
     692:	02f77163          	bgeu	a4,a5,6b4 <gettoken+0x58>
     696:	fe843783          	ld	a5,-24(s0)
     69a:	0007c783          	lbu	a5,0(a5)
     69e:	85be                	mv	a1,a5
     6a0:	00003517          	auipc	a0,0x3
     6a4:	c5050513          	addi	a0,a0,-944 # 32f0 <whitespace>
     6a8:	00001097          	auipc	ra,0x1
     6ac:	9fa080e7          	jalr	-1542(ra) # 10a2 <strchr>
     6b0:	87aa                	mv	a5,a0
     6b2:	f7f9                	bnez	a5,680 <gettoken+0x24>
  if(q)
     6b4:	fc843783          	ld	a5,-56(s0)
     6b8:	c791                	beqz	a5,6c4 <gettoken+0x68>
    *q = s;
     6ba:	fc843783          	ld	a5,-56(s0)
     6be:	fe843703          	ld	a4,-24(s0)
     6c2:	e398                	sd	a4,0(a5)
  ret = *s;
     6c4:	fe843783          	ld	a5,-24(s0)
     6c8:	0007c783          	lbu	a5,0(a5)
     6cc:	fef42223          	sw	a5,-28(s0)
  switch(*s){
     6d0:	fe843783          	ld	a5,-24(s0)
     6d4:	0007c783          	lbu	a5,0(a5)
     6d8:	2781                	sext.w	a5,a5
     6da:	86be                	mv	a3,a5
     6dc:	07c00713          	li	a4,124
     6e0:	04e68b63          	beq	a3,a4,736 <gettoken+0xda>
     6e4:	86be                	mv	a3,a5
     6e6:	07c00713          	li	a4,124
     6ea:	08d74463          	blt	a4,a3,772 <gettoken+0x116>
     6ee:	86be                	mv	a3,a5
     6f0:	03e00713          	li	a4,62
     6f4:	04e68763          	beq	a3,a4,742 <gettoken+0xe6>
     6f8:	86be                	mv	a3,a5
     6fa:	03e00713          	li	a4,62
     6fe:	06d74a63          	blt	a4,a3,772 <gettoken+0x116>
     702:	86be                	mv	a3,a5
     704:	03c00713          	li	a4,60
     708:	06d74563          	blt	a4,a3,772 <gettoken+0x116>
     70c:	86be                	mv	a3,a5
     70e:	03b00713          	li	a4,59
     712:	02e6d263          	bge	a3,a4,736 <gettoken+0xda>
     716:	86be                	mv	a3,a5
     718:	02900713          	li	a4,41
     71c:	04d74b63          	blt	a4,a3,772 <gettoken+0x116>
     720:	86be                	mv	a3,a5
     722:	02800713          	li	a4,40
     726:	00e6d863          	bge	a3,a4,736 <gettoken+0xda>
     72a:	c3dd                	beqz	a5,7d0 <gettoken+0x174>
     72c:	873e                	mv	a4,a5
     72e:	02600793          	li	a5,38
     732:	04f71063          	bne	a4,a5,772 <gettoken+0x116>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     736:	fe843783          	ld	a5,-24(s0)
     73a:	0785                	addi	a5,a5,1
     73c:	fef43423          	sd	a5,-24(s0)
    break;
     740:	a869                	j	7da <gettoken+0x17e>
  case '>':
    s++;
     742:	fe843783          	ld	a5,-24(s0)
     746:	0785                	addi	a5,a5,1
     748:	fef43423          	sd	a5,-24(s0)
    if(*s == '>'){
     74c:	fe843783          	ld	a5,-24(s0)
     750:	0007c783          	lbu	a5,0(a5)
     754:	873e                	mv	a4,a5
     756:	03e00793          	li	a5,62
     75a:	06f71d63          	bne	a4,a5,7d4 <gettoken+0x178>
      ret = '+';
     75e:	02b00793          	li	a5,43
     762:	fef42223          	sw	a5,-28(s0)
      s++;
     766:	fe843783          	ld	a5,-24(s0)
     76a:	0785                	addi	a5,a5,1
     76c:	fef43423          	sd	a5,-24(s0)
    }
    break;
     770:	a095                	j	7d4 <gettoken+0x178>
  default:
    ret = 'a';
     772:	06100793          	li	a5,97
     776:	fef42223          	sw	a5,-28(s0)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     77a:	a031                	j	786 <gettoken+0x12a>
      s++;
     77c:	fe843783          	ld	a5,-24(s0)
     780:	0785                	addi	a5,a5,1
     782:	fef43423          	sd	a5,-24(s0)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     786:	fe843703          	ld	a4,-24(s0)
     78a:	fd043783          	ld	a5,-48(s0)
     78e:	04f77563          	bgeu	a4,a5,7d8 <gettoken+0x17c>
     792:	fe843783          	ld	a5,-24(s0)
     796:	0007c783          	lbu	a5,0(a5)
     79a:	85be                	mv	a1,a5
     79c:	00003517          	auipc	a0,0x3
     7a0:	b5450513          	addi	a0,a0,-1196 # 32f0 <whitespace>
     7a4:	00001097          	auipc	ra,0x1
     7a8:	8fe080e7          	jalr	-1794(ra) # 10a2 <strchr>
     7ac:	87aa                	mv	a5,a0
     7ae:	e78d                	bnez	a5,7d8 <gettoken+0x17c>
     7b0:	fe843783          	ld	a5,-24(s0)
     7b4:	0007c783          	lbu	a5,0(a5)
     7b8:	85be                	mv	a1,a5
     7ba:	00003517          	auipc	a0,0x3
     7be:	b3e50513          	addi	a0,a0,-1218 # 32f8 <symbols>
     7c2:	00001097          	auipc	ra,0x1
     7c6:	8e0080e7          	jalr	-1824(ra) # 10a2 <strchr>
     7ca:	87aa                	mv	a5,a0
     7cc:	dbc5                	beqz	a5,77c <gettoken+0x120>
    break;
     7ce:	a029                	j	7d8 <gettoken+0x17c>
    break;
     7d0:	0001                	nop
     7d2:	a021                	j	7da <gettoken+0x17e>
    break;
     7d4:	0001                	nop
     7d6:	a011                	j	7da <gettoken+0x17e>
    break;
     7d8:	0001                	nop
  }
  if(eq)
     7da:	fc043783          	ld	a5,-64(s0)
     7de:	cf81                	beqz	a5,7f6 <gettoken+0x19a>
    *eq = s;
     7e0:	fc043783          	ld	a5,-64(s0)
     7e4:	fe843703          	ld	a4,-24(s0)
     7e8:	e398                	sd	a4,0(a5)

  while(s < es && strchr(whitespace, *s))
     7ea:	a031                	j	7f6 <gettoken+0x19a>
    s++;
     7ec:	fe843783          	ld	a5,-24(s0)
     7f0:	0785                	addi	a5,a5,1
     7f2:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     7f6:	fe843703          	ld	a4,-24(s0)
     7fa:	fd043783          	ld	a5,-48(s0)
     7fe:	02f77163          	bgeu	a4,a5,820 <gettoken+0x1c4>
     802:	fe843783          	ld	a5,-24(s0)
     806:	0007c783          	lbu	a5,0(a5)
     80a:	85be                	mv	a1,a5
     80c:	00003517          	auipc	a0,0x3
     810:	ae450513          	addi	a0,a0,-1308 # 32f0 <whitespace>
     814:	00001097          	auipc	ra,0x1
     818:	88e080e7          	jalr	-1906(ra) # 10a2 <strchr>
     81c:	87aa                	mv	a5,a0
     81e:	f7f9                	bnez	a5,7ec <gettoken+0x190>
  *ps = s;
     820:	fd843783          	ld	a5,-40(s0)
     824:	fe843703          	ld	a4,-24(s0)
     828:	e398                	sd	a4,0(a5)
  return ret;
     82a:	fe442783          	lw	a5,-28(s0)
}
     82e:	853e                	mv	a0,a5
     830:	70e2                	ld	ra,56(sp)
     832:	7442                	ld	s0,48(sp)
     834:	6121                	addi	sp,sp,64
     836:	8082                	ret

0000000000000838 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     838:	7139                	addi	sp,sp,-64
     83a:	fc06                	sd	ra,56(sp)
     83c:	f822                	sd	s0,48(sp)
     83e:	0080                	addi	s0,sp,64
     840:	fca43c23          	sd	a0,-40(s0)
     844:	fcb43823          	sd	a1,-48(s0)
     848:	fcc43423          	sd	a2,-56(s0)
  char *s;

  s = *ps;
     84c:	fd843783          	ld	a5,-40(s0)
     850:	639c                	ld	a5,0(a5)
     852:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     856:	a031                	j	862 <peek+0x2a>
    s++;
     858:	fe843783          	ld	a5,-24(s0)
     85c:	0785                	addi	a5,a5,1
     85e:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     862:	fe843703          	ld	a4,-24(s0)
     866:	fd043783          	ld	a5,-48(s0)
     86a:	02f77163          	bgeu	a4,a5,88c <peek+0x54>
     86e:	fe843783          	ld	a5,-24(s0)
     872:	0007c783          	lbu	a5,0(a5)
     876:	85be                	mv	a1,a5
     878:	00003517          	auipc	a0,0x3
     87c:	a7850513          	addi	a0,a0,-1416 # 32f0 <whitespace>
     880:	00001097          	auipc	ra,0x1
     884:	822080e7          	jalr	-2014(ra) # 10a2 <strchr>
     888:	87aa                	mv	a5,a0
     88a:	f7f9                	bnez	a5,858 <peek+0x20>
  *ps = s;
     88c:	fd843783          	ld	a5,-40(s0)
     890:	fe843703          	ld	a4,-24(s0)
     894:	e398                	sd	a4,0(a5)
  return *s && strchr(toks, *s);
     896:	fe843783          	ld	a5,-24(s0)
     89a:	0007c783          	lbu	a5,0(a5)
     89e:	c385                	beqz	a5,8be <peek+0x86>
     8a0:	fe843783          	ld	a5,-24(s0)
     8a4:	0007c783          	lbu	a5,0(a5)
     8a8:	85be                	mv	a1,a5
     8aa:	fc843503          	ld	a0,-56(s0)
     8ae:	00000097          	auipc	ra,0x0
     8b2:	7f4080e7          	jalr	2036(ra) # 10a2 <strchr>
     8b6:	87aa                	mv	a5,a0
     8b8:	c399                	beqz	a5,8be <peek+0x86>
     8ba:	4785                	li	a5,1
     8bc:	a011                	j	8c0 <peek+0x88>
     8be:	4781                	li	a5,0
}
     8c0:	853e                	mv	a0,a5
     8c2:	70e2                	ld	ra,56(sp)
     8c4:	7442                	ld	s0,48(sp)
     8c6:	6121                	addi	sp,sp,64
     8c8:	8082                	ret

00000000000008ca <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     8ca:	7139                	addi	sp,sp,-64
     8cc:	fc06                	sd	ra,56(sp)
     8ce:	f822                	sd	s0,48(sp)
     8d0:	f426                	sd	s1,40(sp)
     8d2:	0080                	addi	s0,sp,64
     8d4:	fca43423          	sd	a0,-56(s0)
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     8d8:	fc843483          	ld	s1,-56(s0)
     8dc:	fc843783          	ld	a5,-56(s0)
     8e0:	853e                	mv	a0,a5
     8e2:	00000097          	auipc	ra,0x0
     8e6:	72a080e7          	jalr	1834(ra) # 100c <strlen>
     8ea:	87aa                	mv	a5,a0
     8ec:	2781                	sext.w	a5,a5
     8ee:	1782                	slli	a5,a5,0x20
     8f0:	9381                	srli	a5,a5,0x20
     8f2:	97a6                	add	a5,a5,s1
     8f4:	fcf43c23          	sd	a5,-40(s0)
  cmd = parseline(&s, es);
     8f8:	fc840793          	addi	a5,s0,-56
     8fc:	fd843583          	ld	a1,-40(s0)
     900:	853e                	mv	a0,a5
     902:	00000097          	auipc	ra,0x0
     906:	076080e7          	jalr	118(ra) # 978 <parseline>
     90a:	fca43823          	sd	a0,-48(s0)
  peek(&s, es, "");
     90e:	fc840793          	addi	a5,s0,-56
     912:	00002617          	auipc	a2,0x2
     916:	65e60613          	addi	a2,a2,1630 # 2f70 <schedule_edf_cbs+0x548>
     91a:	fd843583          	ld	a1,-40(s0)
     91e:	853e                	mv	a0,a5
     920:	00000097          	auipc	ra,0x0
     924:	f18080e7          	jalr	-232(ra) # 838 <peek>
  if(s != es){
     928:	fc843783          	ld	a5,-56(s0)
     92c:	fd843703          	ld	a4,-40(s0)
     930:	02f70663          	beq	a4,a5,95c <parsecmd+0x92>
    fprintf(2, "leftovers: %s\n", s);
     934:	fc843783          	ld	a5,-56(s0)
     938:	863e                	mv	a2,a5
     93a:	00002597          	auipc	a1,0x2
     93e:	63e58593          	addi	a1,a1,1598 # 2f78 <schedule_edf_cbs+0x550>
     942:	4509                	li	a0,2
     944:	00001097          	auipc	ra,0x1
     948:	f96080e7          	jalr	-106(ra) # 18da <fprintf>
    panic("syntax");
     94c:	00002517          	auipc	a0,0x2
     950:	63c50513          	addi	a0,a0,1596 # 2f88 <schedule_edf_cbs+0x560>
     954:	00000097          	auipc	ra,0x0
     958:	ad6080e7          	jalr	-1322(ra) # 42a <panic>
  }
  nulterminate(cmd);
     95c:	fd043503          	ld	a0,-48(s0)
     960:	00000097          	auipc	ra,0x0
     964:	4da080e7          	jalr	1242(ra) # e3a <nulterminate>
  return cmd;
     968:	fd043783          	ld	a5,-48(s0)
}
     96c:	853e                	mv	a0,a5
     96e:	70e2                	ld	ra,56(sp)
     970:	7442                	ld	s0,48(sp)
     972:	74a2                	ld	s1,40(sp)
     974:	6121                	addi	sp,sp,64
     976:	8082                	ret

0000000000000978 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     978:	7179                	addi	sp,sp,-48
     97a:	f406                	sd	ra,40(sp)
     97c:	f022                	sd	s0,32(sp)
     97e:	1800                	addi	s0,sp,48
     980:	fca43c23          	sd	a0,-40(s0)
     984:	fcb43823          	sd	a1,-48(s0)
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     988:	fd043583          	ld	a1,-48(s0)
     98c:	fd843503          	ld	a0,-40(s0)
     990:	00000097          	auipc	ra,0x0
     994:	0b0080e7          	jalr	176(ra) # a40 <parsepipe>
     998:	fea43423          	sd	a0,-24(s0)
  while(peek(ps, es, "&")){
     99c:	a01d                	j	9c2 <parseline+0x4a>
    gettoken(ps, es, 0, 0);
     99e:	4681                	li	a3,0
     9a0:	4601                	li	a2,0
     9a2:	fd043583          	ld	a1,-48(s0)
     9a6:	fd843503          	ld	a0,-40(s0)
     9aa:	00000097          	auipc	ra,0x0
     9ae:	cb2080e7          	jalr	-846(ra) # 65c <gettoken>
    cmd = backcmd(cmd);
     9b2:	fe843503          	ld	a0,-24(s0)
     9b6:	00000097          	auipc	ra,0x0
     9ba:	c5c080e7          	jalr	-932(ra) # 612 <backcmd>
     9be:	fea43423          	sd	a0,-24(s0)
  while(peek(ps, es, "&")){
     9c2:	00002617          	auipc	a2,0x2
     9c6:	5ce60613          	addi	a2,a2,1486 # 2f90 <schedule_edf_cbs+0x568>
     9ca:	fd043583          	ld	a1,-48(s0)
     9ce:	fd843503          	ld	a0,-40(s0)
     9d2:	00000097          	auipc	ra,0x0
     9d6:	e66080e7          	jalr	-410(ra) # 838 <peek>
     9da:	87aa                	mv	a5,a0
     9dc:	f3e9                	bnez	a5,99e <parseline+0x26>
  }
  if(peek(ps, es, ";")){
     9de:	00002617          	auipc	a2,0x2
     9e2:	5ba60613          	addi	a2,a2,1466 # 2f98 <schedule_edf_cbs+0x570>
     9e6:	fd043583          	ld	a1,-48(s0)
     9ea:	fd843503          	ld	a0,-40(s0)
     9ee:	00000097          	auipc	ra,0x0
     9f2:	e4a080e7          	jalr	-438(ra) # 838 <peek>
     9f6:	87aa                	mv	a5,a0
     9f8:	cf8d                	beqz	a5,a32 <parseline+0xba>
    gettoken(ps, es, 0, 0);
     9fa:	4681                	li	a3,0
     9fc:	4601                	li	a2,0
     9fe:	fd043583          	ld	a1,-48(s0)
     a02:	fd843503          	ld	a0,-40(s0)
     a06:	00000097          	auipc	ra,0x0
     a0a:	c56080e7          	jalr	-938(ra) # 65c <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     a0e:	fd043583          	ld	a1,-48(s0)
     a12:	fd843503          	ld	a0,-40(s0)
     a16:	00000097          	auipc	ra,0x0
     a1a:	f62080e7          	jalr	-158(ra) # 978 <parseline>
     a1e:	87aa                	mv	a5,a0
     a20:	85be                	mv	a1,a5
     a22:	fe843503          	ld	a0,-24(s0)
     a26:	00000097          	auipc	ra,0x0
     a2a:	b94080e7          	jalr	-1132(ra) # 5ba <listcmd>
     a2e:	fea43423          	sd	a0,-24(s0)
  }
  return cmd;
     a32:	fe843783          	ld	a5,-24(s0)
}
     a36:	853e                	mv	a0,a5
     a38:	70a2                	ld	ra,40(sp)
     a3a:	7402                	ld	s0,32(sp)
     a3c:	6145                	addi	sp,sp,48
     a3e:	8082                	ret

0000000000000a40 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     a40:	7179                	addi	sp,sp,-48
     a42:	f406                	sd	ra,40(sp)
     a44:	f022                	sd	s0,32(sp)
     a46:	1800                	addi	s0,sp,48
     a48:	fca43c23          	sd	a0,-40(s0)
     a4c:	fcb43823          	sd	a1,-48(s0)
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     a50:	fd043583          	ld	a1,-48(s0)
     a54:	fd843503          	ld	a0,-40(s0)
     a58:	00000097          	auipc	ra,0x0
     a5c:	270080e7          	jalr	624(ra) # cc8 <parseexec>
     a60:	fea43423          	sd	a0,-24(s0)
  if(peek(ps, es, "|")){
     a64:	00002617          	auipc	a2,0x2
     a68:	53c60613          	addi	a2,a2,1340 # 2fa0 <schedule_edf_cbs+0x578>
     a6c:	fd043583          	ld	a1,-48(s0)
     a70:	fd843503          	ld	a0,-40(s0)
     a74:	00000097          	auipc	ra,0x0
     a78:	dc4080e7          	jalr	-572(ra) # 838 <peek>
     a7c:	87aa                	mv	a5,a0
     a7e:	cf8d                	beqz	a5,ab8 <parsepipe+0x78>
    gettoken(ps, es, 0, 0);
     a80:	4681                	li	a3,0
     a82:	4601                	li	a2,0
     a84:	fd043583          	ld	a1,-48(s0)
     a88:	fd843503          	ld	a0,-40(s0)
     a8c:	00000097          	auipc	ra,0x0
     a90:	bd0080e7          	jalr	-1072(ra) # 65c <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a94:	fd043583          	ld	a1,-48(s0)
     a98:	fd843503          	ld	a0,-40(s0)
     a9c:	00000097          	auipc	ra,0x0
     aa0:	fa4080e7          	jalr	-92(ra) # a40 <parsepipe>
     aa4:	87aa                	mv	a5,a0
     aa6:	85be                	mv	a1,a5
     aa8:	fe843503          	ld	a0,-24(s0)
     aac:	00000097          	auipc	ra,0x0
     ab0:	ab6080e7          	jalr	-1354(ra) # 562 <pipecmd>
     ab4:	fea43423          	sd	a0,-24(s0)
  }
  return cmd;
     ab8:	fe843783          	ld	a5,-24(s0)
}
     abc:	853e                	mv	a0,a5
     abe:	70a2                	ld	ra,40(sp)
     ac0:	7402                	ld	s0,32(sp)
     ac2:	6145                	addi	sp,sp,48
     ac4:	8082                	ret

0000000000000ac6 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     ac6:	715d                	addi	sp,sp,-80
     ac8:	e486                	sd	ra,72(sp)
     aca:	e0a2                	sd	s0,64(sp)
     acc:	0880                	addi	s0,sp,80
     ace:	fca43423          	sd	a0,-56(s0)
     ad2:	fcb43023          	sd	a1,-64(s0)
     ad6:	fac43c23          	sd	a2,-72(s0)
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     ada:	a8e5                	j	bd2 <parseredirs+0x10c>
    tok = gettoken(ps, es, 0, 0);
     adc:	4681                	li	a3,0
     ade:	4601                	li	a2,0
     ae0:	fb843583          	ld	a1,-72(s0)
     ae4:	fc043503          	ld	a0,-64(s0)
     ae8:	00000097          	auipc	ra,0x0
     aec:	b74080e7          	jalr	-1164(ra) # 65c <gettoken>
     af0:	87aa                	mv	a5,a0
     af2:	fef42623          	sw	a5,-20(s0)
    if(gettoken(ps, es, &q, &eq) != 'a')
     af6:	fd840713          	addi	a4,s0,-40
     afa:	fe040793          	addi	a5,s0,-32
     afe:	86ba                	mv	a3,a4
     b00:	863e                	mv	a2,a5
     b02:	fb843583          	ld	a1,-72(s0)
     b06:	fc043503          	ld	a0,-64(s0)
     b0a:	00000097          	auipc	ra,0x0
     b0e:	b52080e7          	jalr	-1198(ra) # 65c <gettoken>
     b12:	87aa                	mv	a5,a0
     b14:	873e                	mv	a4,a5
     b16:	06100793          	li	a5,97
     b1a:	00f70a63          	beq	a4,a5,b2e <parseredirs+0x68>
      panic("missing file for redirection");
     b1e:	00002517          	auipc	a0,0x2
     b22:	48a50513          	addi	a0,a0,1162 # 2fa8 <schedule_edf_cbs+0x580>
     b26:	00000097          	auipc	ra,0x0
     b2a:	904080e7          	jalr	-1788(ra) # 42a <panic>
    switch(tok){
     b2e:	fec42783          	lw	a5,-20(s0)
     b32:	0007871b          	sext.w	a4,a5
     b36:	03e00793          	li	a5,62
     b3a:	04f70a63          	beq	a4,a5,b8e <parseredirs+0xc8>
     b3e:	fec42783          	lw	a5,-20(s0)
     b42:	0007871b          	sext.w	a4,a5
     b46:	03e00793          	li	a5,62
     b4a:	08e7c463          	blt	a5,a4,bd2 <parseredirs+0x10c>
     b4e:	fec42783          	lw	a5,-20(s0)
     b52:	0007871b          	sext.w	a4,a5
     b56:	02b00793          	li	a5,43
     b5a:	04f70b63          	beq	a4,a5,bb0 <parseredirs+0xea>
     b5e:	fec42783          	lw	a5,-20(s0)
     b62:	0007871b          	sext.w	a4,a5
     b66:	03c00793          	li	a5,60
     b6a:	06f71463          	bne	a4,a5,bd2 <parseredirs+0x10c>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     b6e:	fe043783          	ld	a5,-32(s0)
     b72:	fd843603          	ld	a2,-40(s0)
     b76:	4701                	li	a4,0
     b78:	4681                	li	a3,0
     b7a:	85be                	mv	a1,a5
     b7c:	fc843503          	ld	a0,-56(s0)
     b80:	00000097          	auipc	ra,0x0
     b84:	958080e7          	jalr	-1704(ra) # 4d8 <redircmd>
     b88:	fca43423          	sd	a0,-56(s0)
      break;
     b8c:	a099                	j	bd2 <parseredirs+0x10c>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
     b8e:	fe043783          	ld	a5,-32(s0)
     b92:	fd843603          	ld	a2,-40(s0)
     b96:	4705                	li	a4,1
     b98:	60100693          	li	a3,1537
     b9c:	85be                	mv	a1,a5
     b9e:	fc843503          	ld	a0,-56(s0)
     ba2:	00000097          	auipc	ra,0x0
     ba6:	936080e7          	jalr	-1738(ra) # 4d8 <redircmd>
     baa:	fca43423          	sd	a0,-56(s0)
      break;
     bae:	a015                	j	bd2 <parseredirs+0x10c>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     bb0:	fe043783          	ld	a5,-32(s0)
     bb4:	fd843603          	ld	a2,-40(s0)
     bb8:	4705                	li	a4,1
     bba:	20100693          	li	a3,513
     bbe:	85be                	mv	a1,a5
     bc0:	fc843503          	ld	a0,-56(s0)
     bc4:	00000097          	auipc	ra,0x0
     bc8:	914080e7          	jalr	-1772(ra) # 4d8 <redircmd>
     bcc:	fca43423          	sd	a0,-56(s0)
      break;
     bd0:	0001                	nop
  while(peek(ps, es, "<>")){
     bd2:	00002617          	auipc	a2,0x2
     bd6:	3f660613          	addi	a2,a2,1014 # 2fc8 <schedule_edf_cbs+0x5a0>
     bda:	fb843583          	ld	a1,-72(s0)
     bde:	fc043503          	ld	a0,-64(s0)
     be2:	00000097          	auipc	ra,0x0
     be6:	c56080e7          	jalr	-938(ra) # 838 <peek>
     bea:	87aa                	mv	a5,a0
     bec:	ee0798e3          	bnez	a5,adc <parseredirs+0x16>
    }
  }
  return cmd;
     bf0:	fc843783          	ld	a5,-56(s0)
}
     bf4:	853e                	mv	a0,a5
     bf6:	60a6                	ld	ra,72(sp)
     bf8:	6406                	ld	s0,64(sp)
     bfa:	6161                	addi	sp,sp,80
     bfc:	8082                	ret

0000000000000bfe <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     bfe:	7179                	addi	sp,sp,-48
     c00:	f406                	sd	ra,40(sp)
     c02:	f022                	sd	s0,32(sp)
     c04:	1800                	addi	s0,sp,48
     c06:	fca43c23          	sd	a0,-40(s0)
     c0a:	fcb43823          	sd	a1,-48(s0)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     c0e:	00002617          	auipc	a2,0x2
     c12:	3c260613          	addi	a2,a2,962 # 2fd0 <schedule_edf_cbs+0x5a8>
     c16:	fd043583          	ld	a1,-48(s0)
     c1a:	fd843503          	ld	a0,-40(s0)
     c1e:	00000097          	auipc	ra,0x0
     c22:	c1a080e7          	jalr	-998(ra) # 838 <peek>
     c26:	87aa                	mv	a5,a0
     c28:	eb89                	bnez	a5,c3a <parseblock+0x3c>
    panic("parseblock");
     c2a:	00002517          	auipc	a0,0x2
     c2e:	3ae50513          	addi	a0,a0,942 # 2fd8 <schedule_edf_cbs+0x5b0>
     c32:	fffff097          	auipc	ra,0xfffff
     c36:	7f8080e7          	jalr	2040(ra) # 42a <panic>
  gettoken(ps, es, 0, 0);
     c3a:	4681                	li	a3,0
     c3c:	4601                	li	a2,0
     c3e:	fd043583          	ld	a1,-48(s0)
     c42:	fd843503          	ld	a0,-40(s0)
     c46:	00000097          	auipc	ra,0x0
     c4a:	a16080e7          	jalr	-1514(ra) # 65c <gettoken>
  cmd = parseline(ps, es);
     c4e:	fd043583          	ld	a1,-48(s0)
     c52:	fd843503          	ld	a0,-40(s0)
     c56:	00000097          	auipc	ra,0x0
     c5a:	d22080e7          	jalr	-734(ra) # 978 <parseline>
     c5e:	fea43423          	sd	a0,-24(s0)
  if(!peek(ps, es, ")"))
     c62:	00002617          	auipc	a2,0x2
     c66:	38660613          	addi	a2,a2,902 # 2fe8 <schedule_edf_cbs+0x5c0>
     c6a:	fd043583          	ld	a1,-48(s0)
     c6e:	fd843503          	ld	a0,-40(s0)
     c72:	00000097          	auipc	ra,0x0
     c76:	bc6080e7          	jalr	-1082(ra) # 838 <peek>
     c7a:	87aa                	mv	a5,a0
     c7c:	eb89                	bnez	a5,c8e <parseblock+0x90>
    panic("syntax - missing )");
     c7e:	00002517          	auipc	a0,0x2
     c82:	37250513          	addi	a0,a0,882 # 2ff0 <schedule_edf_cbs+0x5c8>
     c86:	fffff097          	auipc	ra,0xfffff
     c8a:	7a4080e7          	jalr	1956(ra) # 42a <panic>
  gettoken(ps, es, 0, 0);
     c8e:	4681                	li	a3,0
     c90:	4601                	li	a2,0
     c92:	fd043583          	ld	a1,-48(s0)
     c96:	fd843503          	ld	a0,-40(s0)
     c9a:	00000097          	auipc	ra,0x0
     c9e:	9c2080e7          	jalr	-1598(ra) # 65c <gettoken>
  cmd = parseredirs(cmd, ps, es);
     ca2:	fd043603          	ld	a2,-48(s0)
     ca6:	fd843583          	ld	a1,-40(s0)
     caa:	fe843503          	ld	a0,-24(s0)
     cae:	00000097          	auipc	ra,0x0
     cb2:	e18080e7          	jalr	-488(ra) # ac6 <parseredirs>
     cb6:	fea43423          	sd	a0,-24(s0)
  return cmd;
     cba:	fe843783          	ld	a5,-24(s0)
}
     cbe:	853e                	mv	a0,a5
     cc0:	70a2                	ld	ra,40(sp)
     cc2:	7402                	ld	s0,32(sp)
     cc4:	6145                	addi	sp,sp,48
     cc6:	8082                	ret

0000000000000cc8 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     cc8:	715d                	addi	sp,sp,-80
     cca:	e486                	sd	ra,72(sp)
     ccc:	e0a2                	sd	s0,64(sp)
     cce:	0880                	addi	s0,sp,80
     cd0:	faa43c23          	sd	a0,-72(s0)
     cd4:	fab43823          	sd	a1,-80(s0)
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     cd8:	00002617          	auipc	a2,0x2
     cdc:	2f860613          	addi	a2,a2,760 # 2fd0 <schedule_edf_cbs+0x5a8>
     ce0:	fb043583          	ld	a1,-80(s0)
     ce4:	fb843503          	ld	a0,-72(s0)
     ce8:	00000097          	auipc	ra,0x0
     cec:	b50080e7          	jalr	-1200(ra) # 838 <peek>
     cf0:	87aa                	mv	a5,a0
     cf2:	cb99                	beqz	a5,d08 <parseexec+0x40>
    return parseblock(ps, es);
     cf4:	fb043583          	ld	a1,-80(s0)
     cf8:	fb843503          	ld	a0,-72(s0)
     cfc:	00000097          	auipc	ra,0x0
     d00:	f02080e7          	jalr	-254(ra) # bfe <parseblock>
     d04:	87aa                	mv	a5,a0
     d06:	a22d                	j	e30 <parseexec+0x168>

  ret = execcmd();
     d08:	fffff097          	auipc	ra,0xfffff
     d0c:	790080e7          	jalr	1936(ra) # 498 <execcmd>
     d10:	fea43023          	sd	a0,-32(s0)
  cmd = (struct execcmd*)ret;
     d14:	fe043783          	ld	a5,-32(s0)
     d18:	fcf43c23          	sd	a5,-40(s0)

  argc = 0;
     d1c:	fe042623          	sw	zero,-20(s0)
  ret = parseredirs(ret, ps, es);
     d20:	fb043603          	ld	a2,-80(s0)
     d24:	fb843583          	ld	a1,-72(s0)
     d28:	fe043503          	ld	a0,-32(s0)
     d2c:	00000097          	auipc	ra,0x0
     d30:	d9a080e7          	jalr	-614(ra) # ac6 <parseredirs>
     d34:	fea43023          	sd	a0,-32(s0)
  while(!peek(ps, es, "|)&;")){
     d38:	a84d                	j	dea <parseexec+0x122>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     d3a:	fc040713          	addi	a4,s0,-64
     d3e:	fc840793          	addi	a5,s0,-56
     d42:	86ba                	mv	a3,a4
     d44:	863e                	mv	a2,a5
     d46:	fb043583          	ld	a1,-80(s0)
     d4a:	fb843503          	ld	a0,-72(s0)
     d4e:	00000097          	auipc	ra,0x0
     d52:	90e080e7          	jalr	-1778(ra) # 65c <gettoken>
     d56:	87aa                	mv	a5,a0
     d58:	fcf42a23          	sw	a5,-44(s0)
     d5c:	fd442783          	lw	a5,-44(s0)
     d60:	2781                	sext.w	a5,a5
     d62:	c3dd                	beqz	a5,e08 <parseexec+0x140>
      break;
    if(tok != 'a')
     d64:	fd442783          	lw	a5,-44(s0)
     d68:	0007871b          	sext.w	a4,a5
     d6c:	06100793          	li	a5,97
     d70:	00f70a63          	beq	a4,a5,d84 <parseexec+0xbc>
      panic("syntax");
     d74:	00002517          	auipc	a0,0x2
     d78:	21450513          	addi	a0,a0,532 # 2f88 <schedule_edf_cbs+0x560>
     d7c:	fffff097          	auipc	ra,0xfffff
     d80:	6ae080e7          	jalr	1710(ra) # 42a <panic>
    cmd->argv[argc] = q;
     d84:	fc843703          	ld	a4,-56(s0)
     d88:	fd843683          	ld	a3,-40(s0)
     d8c:	fec42783          	lw	a5,-20(s0)
     d90:	078e                	slli	a5,a5,0x3
     d92:	97b6                	add	a5,a5,a3
     d94:	e798                	sd	a4,8(a5)
    cmd->eargv[argc] = eq;
     d96:	fc043703          	ld	a4,-64(s0)
     d9a:	fd843683          	ld	a3,-40(s0)
     d9e:	fec42783          	lw	a5,-20(s0)
     da2:	07a9                	addi	a5,a5,10
     da4:	078e                	slli	a5,a5,0x3
     da6:	97b6                	add	a5,a5,a3
     da8:	e798                	sd	a4,8(a5)
    argc++;
     daa:	fec42783          	lw	a5,-20(s0)
     dae:	2785                	addiw	a5,a5,1
     db0:	fef42623          	sw	a5,-20(s0)
    if(argc >= MAXARGS)
     db4:	fec42783          	lw	a5,-20(s0)
     db8:	0007871b          	sext.w	a4,a5
     dbc:	47a5                	li	a5,9
     dbe:	00e7da63          	bge	a5,a4,dd2 <parseexec+0x10a>
      panic("too many args");
     dc2:	00002517          	auipc	a0,0x2
     dc6:	24650513          	addi	a0,a0,582 # 3008 <schedule_edf_cbs+0x5e0>
     dca:	fffff097          	auipc	ra,0xfffff
     dce:	660080e7          	jalr	1632(ra) # 42a <panic>
    ret = parseredirs(ret, ps, es);
     dd2:	fb043603          	ld	a2,-80(s0)
     dd6:	fb843583          	ld	a1,-72(s0)
     dda:	fe043503          	ld	a0,-32(s0)
     dde:	00000097          	auipc	ra,0x0
     de2:	ce8080e7          	jalr	-792(ra) # ac6 <parseredirs>
     de6:	fea43023          	sd	a0,-32(s0)
  while(!peek(ps, es, "|)&;")){
     dea:	00002617          	auipc	a2,0x2
     dee:	22e60613          	addi	a2,a2,558 # 3018 <schedule_edf_cbs+0x5f0>
     df2:	fb043583          	ld	a1,-80(s0)
     df6:	fb843503          	ld	a0,-72(s0)
     dfa:	00000097          	auipc	ra,0x0
     dfe:	a3e080e7          	jalr	-1474(ra) # 838 <peek>
     e02:	87aa                	mv	a5,a0
     e04:	db9d                	beqz	a5,d3a <parseexec+0x72>
     e06:	a011                	j	e0a <parseexec+0x142>
      break;
     e08:	0001                	nop
  }
  cmd->argv[argc] = 0;
     e0a:	fd843703          	ld	a4,-40(s0)
     e0e:	fec42783          	lw	a5,-20(s0)
     e12:	078e                	slli	a5,a5,0x3
     e14:	97ba                	add	a5,a5,a4
     e16:	0007b423          	sd	zero,8(a5)
  cmd->eargv[argc] = 0;
     e1a:	fd843703          	ld	a4,-40(s0)
     e1e:	fec42783          	lw	a5,-20(s0)
     e22:	07a9                	addi	a5,a5,10
     e24:	078e                	slli	a5,a5,0x3
     e26:	97ba                	add	a5,a5,a4
     e28:	0007b423          	sd	zero,8(a5)
  return ret;
     e2c:	fe043783          	ld	a5,-32(s0)
}
     e30:	853e                	mv	a0,a5
     e32:	60a6                	ld	ra,72(sp)
     e34:	6406                	ld	s0,64(sp)
     e36:	6161                	addi	sp,sp,80
     e38:	8082                	ret

0000000000000e3a <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     e3a:	715d                	addi	sp,sp,-80
     e3c:	e486                	sd	ra,72(sp)
     e3e:	e0a2                	sd	s0,64(sp)
     e40:	0880                	addi	s0,sp,80
     e42:	faa43c23          	sd	a0,-72(s0)
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     e46:	fb843783          	ld	a5,-72(s0)
     e4a:	e399                	bnez	a5,e50 <nulterminate+0x16>
    return 0;
     e4c:	4781                	li	a5,0
     e4e:	a211                	j	f52 <nulterminate+0x118>

  switch(cmd->type){
     e50:	fb843783          	ld	a5,-72(s0)
     e54:	439c                	lw	a5,0(a5)
     e56:	86be                	mv	a3,a5
     e58:	4715                	li	a4,5
     e5a:	0ed76a63          	bltu	a4,a3,f4e <nulterminate+0x114>
     e5e:	00279713          	slli	a4,a5,0x2
     e62:	00002797          	auipc	a5,0x2
     e66:	1be78793          	addi	a5,a5,446 # 3020 <schedule_edf_cbs+0x5f8>
     e6a:	97ba                	add	a5,a5,a4
     e6c:	439c                	lw	a5,0(a5)
     e6e:	0007871b          	sext.w	a4,a5
     e72:	00002797          	auipc	a5,0x2
     e76:	1ae78793          	addi	a5,a5,430 # 3020 <schedule_edf_cbs+0x5f8>
     e7a:	97ba                	add	a5,a5,a4
     e7c:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     e7e:	fb843783          	ld	a5,-72(s0)
     e82:	fcf43023          	sd	a5,-64(s0)
    for(i=0; ecmd->argv[i]; i++)
     e86:	fe042623          	sw	zero,-20(s0)
     e8a:	a005                	j	eaa <nulterminate+0x70>
      *ecmd->eargv[i] = 0;
     e8c:	fc043703          	ld	a4,-64(s0)
     e90:	fec42783          	lw	a5,-20(s0)
     e94:	07a9                	addi	a5,a5,10
     e96:	078e                	slli	a5,a5,0x3
     e98:	97ba                	add	a5,a5,a4
     e9a:	679c                	ld	a5,8(a5)
     e9c:	00078023          	sb	zero,0(a5)
    for(i=0; ecmd->argv[i]; i++)
     ea0:	fec42783          	lw	a5,-20(s0)
     ea4:	2785                	addiw	a5,a5,1
     ea6:	fef42623          	sw	a5,-20(s0)
     eaa:	fc043703          	ld	a4,-64(s0)
     eae:	fec42783          	lw	a5,-20(s0)
     eb2:	078e                	slli	a5,a5,0x3
     eb4:	97ba                	add	a5,a5,a4
     eb6:	679c                	ld	a5,8(a5)
     eb8:	fbf1                	bnez	a5,e8c <nulterminate+0x52>
    break;
     eba:	a851                	j	f4e <nulterminate+0x114>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     ebc:	fb843783          	ld	a5,-72(s0)
     ec0:	fcf43423          	sd	a5,-56(s0)
    nulterminate(rcmd->cmd);
     ec4:	fc843783          	ld	a5,-56(s0)
     ec8:	679c                	ld	a5,8(a5)
     eca:	853e                	mv	a0,a5
     ecc:	00000097          	auipc	ra,0x0
     ed0:	f6e080e7          	jalr	-146(ra) # e3a <nulterminate>
    *rcmd->efile = 0;
     ed4:	fc843783          	ld	a5,-56(s0)
     ed8:	6f9c                	ld	a5,24(a5)
     eda:	00078023          	sb	zero,0(a5)
    break;
     ede:	a885                	j	f4e <nulterminate+0x114>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     ee0:	fb843783          	ld	a5,-72(s0)
     ee4:	fcf43823          	sd	a5,-48(s0)
    nulterminate(pcmd->left);
     ee8:	fd043783          	ld	a5,-48(s0)
     eec:	679c                	ld	a5,8(a5)
     eee:	853e                	mv	a0,a5
     ef0:	00000097          	auipc	ra,0x0
     ef4:	f4a080e7          	jalr	-182(ra) # e3a <nulterminate>
    nulterminate(pcmd->right);
     ef8:	fd043783          	ld	a5,-48(s0)
     efc:	6b9c                	ld	a5,16(a5)
     efe:	853e                	mv	a0,a5
     f00:	00000097          	auipc	ra,0x0
     f04:	f3a080e7          	jalr	-198(ra) # e3a <nulterminate>
    break;
     f08:	a099                	j	f4e <nulterminate+0x114>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     f0a:	fb843783          	ld	a5,-72(s0)
     f0e:	fcf43c23          	sd	a5,-40(s0)
    nulterminate(lcmd->left);
     f12:	fd843783          	ld	a5,-40(s0)
     f16:	679c                	ld	a5,8(a5)
     f18:	853e                	mv	a0,a5
     f1a:	00000097          	auipc	ra,0x0
     f1e:	f20080e7          	jalr	-224(ra) # e3a <nulterminate>
    nulterminate(lcmd->right);
     f22:	fd843783          	ld	a5,-40(s0)
     f26:	6b9c                	ld	a5,16(a5)
     f28:	853e                	mv	a0,a5
     f2a:	00000097          	auipc	ra,0x0
     f2e:	f10080e7          	jalr	-240(ra) # e3a <nulterminate>
    break;
     f32:	a831                	j	f4e <nulterminate+0x114>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     f34:	fb843783          	ld	a5,-72(s0)
     f38:	fef43023          	sd	a5,-32(s0)
    nulterminate(bcmd->cmd);
     f3c:	fe043783          	ld	a5,-32(s0)
     f40:	679c                	ld	a5,8(a5)
     f42:	853e                	mv	a0,a5
     f44:	00000097          	auipc	ra,0x0
     f48:	ef6080e7          	jalr	-266(ra) # e3a <nulterminate>
    break;
     f4c:	0001                	nop
  }
  return cmd;
     f4e:	fb843783          	ld	a5,-72(s0)
}
     f52:	853e                	mv	a0,a5
     f54:	60a6                	ld	ra,72(sp)
     f56:	6406                	ld	s0,64(sp)
     f58:	6161                	addi	sp,sp,80
     f5a:	8082                	ret

0000000000000f5c <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     f5c:	7179                	addi	sp,sp,-48
     f5e:	f422                	sd	s0,40(sp)
     f60:	1800                	addi	s0,sp,48
     f62:	fca43c23          	sd	a0,-40(s0)
     f66:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     f6a:	fd843783          	ld	a5,-40(s0)
     f6e:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     f72:	0001                	nop
     f74:	fd043703          	ld	a4,-48(s0)
     f78:	00170793          	addi	a5,a4,1
     f7c:	fcf43823          	sd	a5,-48(s0)
     f80:	fd843783          	ld	a5,-40(s0)
     f84:	00178693          	addi	a3,a5,1
     f88:	fcd43c23          	sd	a3,-40(s0)
     f8c:	00074703          	lbu	a4,0(a4)
     f90:	00e78023          	sb	a4,0(a5)
     f94:	0007c783          	lbu	a5,0(a5)
     f98:	fff1                	bnez	a5,f74 <strcpy+0x18>
    ;
  return os;
     f9a:	fe843783          	ld	a5,-24(s0)
}
     f9e:	853e                	mv	a0,a5
     fa0:	7422                	ld	s0,40(sp)
     fa2:	6145                	addi	sp,sp,48
     fa4:	8082                	ret

0000000000000fa6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     fa6:	1101                	addi	sp,sp,-32
     fa8:	ec22                	sd	s0,24(sp)
     faa:	1000                	addi	s0,sp,32
     fac:	fea43423          	sd	a0,-24(s0)
     fb0:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     fb4:	a819                	j	fca <strcmp+0x24>
    p++, q++;
     fb6:	fe843783          	ld	a5,-24(s0)
     fba:	0785                	addi	a5,a5,1
     fbc:	fef43423          	sd	a5,-24(s0)
     fc0:	fe043783          	ld	a5,-32(s0)
     fc4:	0785                	addi	a5,a5,1
     fc6:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     fca:	fe843783          	ld	a5,-24(s0)
     fce:	0007c783          	lbu	a5,0(a5)
     fd2:	cb99                	beqz	a5,fe8 <strcmp+0x42>
     fd4:	fe843783          	ld	a5,-24(s0)
     fd8:	0007c703          	lbu	a4,0(a5)
     fdc:	fe043783          	ld	a5,-32(s0)
     fe0:	0007c783          	lbu	a5,0(a5)
     fe4:	fcf709e3          	beq	a4,a5,fb6 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     fe8:	fe843783          	ld	a5,-24(s0)
     fec:	0007c783          	lbu	a5,0(a5)
     ff0:	0007871b          	sext.w	a4,a5
     ff4:	fe043783          	ld	a5,-32(s0)
     ff8:	0007c783          	lbu	a5,0(a5)
     ffc:	2781                	sext.w	a5,a5
     ffe:	40f707bb          	subw	a5,a4,a5
    1002:	2781                	sext.w	a5,a5
}
    1004:	853e                	mv	a0,a5
    1006:	6462                	ld	s0,24(sp)
    1008:	6105                	addi	sp,sp,32
    100a:	8082                	ret

000000000000100c <strlen>:

uint
strlen(const char *s)
{
    100c:	7179                	addi	sp,sp,-48
    100e:	f422                	sd	s0,40(sp)
    1010:	1800                	addi	s0,sp,48
    1012:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    1016:	fe042623          	sw	zero,-20(s0)
    101a:	a031                	j	1026 <strlen+0x1a>
    101c:	fec42783          	lw	a5,-20(s0)
    1020:	2785                	addiw	a5,a5,1
    1022:	fef42623          	sw	a5,-20(s0)
    1026:	fec42783          	lw	a5,-20(s0)
    102a:	fd843703          	ld	a4,-40(s0)
    102e:	97ba                	add	a5,a5,a4
    1030:	0007c783          	lbu	a5,0(a5)
    1034:	f7e5                	bnez	a5,101c <strlen+0x10>
    ;
  return n;
    1036:	fec42783          	lw	a5,-20(s0)
}
    103a:	853e                	mv	a0,a5
    103c:	7422                	ld	s0,40(sp)
    103e:	6145                	addi	sp,sp,48
    1040:	8082                	ret

0000000000001042 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1042:	7179                	addi	sp,sp,-48
    1044:	f422                	sd	s0,40(sp)
    1046:	1800                	addi	s0,sp,48
    1048:	fca43c23          	sd	a0,-40(s0)
    104c:	87ae                	mv	a5,a1
    104e:	8732                	mv	a4,a2
    1050:	fcf42a23          	sw	a5,-44(s0)
    1054:	87ba                	mv	a5,a4
    1056:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    105a:	fd843783          	ld	a5,-40(s0)
    105e:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    1062:	fe042623          	sw	zero,-20(s0)
    1066:	a00d                	j	1088 <memset+0x46>
    cdst[i] = c;
    1068:	fec42783          	lw	a5,-20(s0)
    106c:	fe043703          	ld	a4,-32(s0)
    1070:	97ba                	add	a5,a5,a4
    1072:	fd442703          	lw	a4,-44(s0)
    1076:	0ff77713          	andi	a4,a4,255
    107a:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    107e:	fec42783          	lw	a5,-20(s0)
    1082:	2785                	addiw	a5,a5,1
    1084:	fef42623          	sw	a5,-20(s0)
    1088:	fec42703          	lw	a4,-20(s0)
    108c:	fd042783          	lw	a5,-48(s0)
    1090:	2781                	sext.w	a5,a5
    1092:	fcf76be3          	bltu	a4,a5,1068 <memset+0x26>
  }
  return dst;
    1096:	fd843783          	ld	a5,-40(s0)
}
    109a:	853e                	mv	a0,a5
    109c:	7422                	ld	s0,40(sp)
    109e:	6145                	addi	sp,sp,48
    10a0:	8082                	ret

00000000000010a2 <strchr>:

char*
strchr(const char *s, char c)
{
    10a2:	1101                	addi	sp,sp,-32
    10a4:	ec22                	sd	s0,24(sp)
    10a6:	1000                	addi	s0,sp,32
    10a8:	fea43423          	sd	a0,-24(s0)
    10ac:	87ae                	mv	a5,a1
    10ae:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
    10b2:	a01d                	j	10d8 <strchr+0x36>
    if(*s == c)
    10b4:	fe843783          	ld	a5,-24(s0)
    10b8:	0007c703          	lbu	a4,0(a5)
    10bc:	fe744783          	lbu	a5,-25(s0)
    10c0:	0ff7f793          	andi	a5,a5,255
    10c4:	00e79563          	bne	a5,a4,10ce <strchr+0x2c>
      return (char*)s;
    10c8:	fe843783          	ld	a5,-24(s0)
    10cc:	a821                	j	10e4 <strchr+0x42>
  for(; *s; s++)
    10ce:	fe843783          	ld	a5,-24(s0)
    10d2:	0785                	addi	a5,a5,1
    10d4:	fef43423          	sd	a5,-24(s0)
    10d8:	fe843783          	ld	a5,-24(s0)
    10dc:	0007c783          	lbu	a5,0(a5)
    10e0:	fbf1                	bnez	a5,10b4 <strchr+0x12>
  return 0;
    10e2:	4781                	li	a5,0
}
    10e4:	853e                	mv	a0,a5
    10e6:	6462                	ld	s0,24(sp)
    10e8:	6105                	addi	sp,sp,32
    10ea:	8082                	ret

00000000000010ec <gets>:

char*
gets(char *buf, int max)
{
    10ec:	7179                	addi	sp,sp,-48
    10ee:	f406                	sd	ra,40(sp)
    10f0:	f022                	sd	s0,32(sp)
    10f2:	1800                	addi	s0,sp,48
    10f4:	fca43c23          	sd	a0,-40(s0)
    10f8:	87ae                	mv	a5,a1
    10fa:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    10fe:	fe042623          	sw	zero,-20(s0)
    1102:	a8a1                	j	115a <gets+0x6e>
    cc = read(0, &c, 1);
    1104:	fe740793          	addi	a5,s0,-25
    1108:	4605                	li	a2,1
    110a:	85be                	mv	a1,a5
    110c:	4501                	li	a0,0
    110e:	00000097          	auipc	ra,0x0
    1112:	2f6080e7          	jalr	758(ra) # 1404 <read>
    1116:	87aa                	mv	a5,a0
    1118:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
    111c:	fe842783          	lw	a5,-24(s0)
    1120:	2781                	sext.w	a5,a5
    1122:	04f05763          	blez	a5,1170 <gets+0x84>
      break;
    buf[i++] = c;
    1126:	fec42783          	lw	a5,-20(s0)
    112a:	0017871b          	addiw	a4,a5,1
    112e:	fee42623          	sw	a4,-20(s0)
    1132:	873e                	mv	a4,a5
    1134:	fd843783          	ld	a5,-40(s0)
    1138:	97ba                	add	a5,a5,a4
    113a:	fe744703          	lbu	a4,-25(s0)
    113e:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
    1142:	fe744783          	lbu	a5,-25(s0)
    1146:	873e                	mv	a4,a5
    1148:	47a9                	li	a5,10
    114a:	02f70463          	beq	a4,a5,1172 <gets+0x86>
    114e:	fe744783          	lbu	a5,-25(s0)
    1152:	873e                	mv	a4,a5
    1154:	47b5                	li	a5,13
    1156:	00f70e63          	beq	a4,a5,1172 <gets+0x86>
  for(i=0; i+1 < max; ){
    115a:	fec42783          	lw	a5,-20(s0)
    115e:	2785                	addiw	a5,a5,1
    1160:	0007871b          	sext.w	a4,a5
    1164:	fd442783          	lw	a5,-44(s0)
    1168:	2781                	sext.w	a5,a5
    116a:	f8f74de3          	blt	a4,a5,1104 <gets+0x18>
    116e:	a011                	j	1172 <gets+0x86>
      break;
    1170:	0001                	nop
      break;
  }
  buf[i] = '\0';
    1172:	fec42783          	lw	a5,-20(s0)
    1176:	fd843703          	ld	a4,-40(s0)
    117a:	97ba                	add	a5,a5,a4
    117c:	00078023          	sb	zero,0(a5)
  return buf;
    1180:	fd843783          	ld	a5,-40(s0)
}
    1184:	853e                	mv	a0,a5
    1186:	70a2                	ld	ra,40(sp)
    1188:	7402                	ld	s0,32(sp)
    118a:	6145                	addi	sp,sp,48
    118c:	8082                	ret

000000000000118e <stat>:

int
stat(const char *n, struct stat *st)
{
    118e:	7179                	addi	sp,sp,-48
    1190:	f406                	sd	ra,40(sp)
    1192:	f022                	sd	s0,32(sp)
    1194:	1800                	addi	s0,sp,48
    1196:	fca43c23          	sd	a0,-40(s0)
    119a:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    119e:	4581                	li	a1,0
    11a0:	fd843503          	ld	a0,-40(s0)
    11a4:	00000097          	auipc	ra,0x0
    11a8:	288080e7          	jalr	648(ra) # 142c <open>
    11ac:	87aa                	mv	a5,a0
    11ae:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
    11b2:	fec42783          	lw	a5,-20(s0)
    11b6:	2781                	sext.w	a5,a5
    11b8:	0007d463          	bgez	a5,11c0 <stat+0x32>
    return -1;
    11bc:	57fd                	li	a5,-1
    11be:	a035                	j	11ea <stat+0x5c>
  r = fstat(fd, st);
    11c0:	fec42783          	lw	a5,-20(s0)
    11c4:	fd043583          	ld	a1,-48(s0)
    11c8:	853e                	mv	a0,a5
    11ca:	00000097          	auipc	ra,0x0
    11ce:	27a080e7          	jalr	634(ra) # 1444 <fstat>
    11d2:	87aa                	mv	a5,a0
    11d4:	fef42423          	sw	a5,-24(s0)
  close(fd);
    11d8:	fec42783          	lw	a5,-20(s0)
    11dc:	853e                	mv	a0,a5
    11de:	00000097          	auipc	ra,0x0
    11e2:	236080e7          	jalr	566(ra) # 1414 <close>
  return r;
    11e6:	fe842783          	lw	a5,-24(s0)
}
    11ea:	853e                	mv	a0,a5
    11ec:	70a2                	ld	ra,40(sp)
    11ee:	7402                	ld	s0,32(sp)
    11f0:	6145                	addi	sp,sp,48
    11f2:	8082                	ret

00000000000011f4 <atoi>:

int
atoi(const char *s)
{
    11f4:	7179                	addi	sp,sp,-48
    11f6:	f422                	sd	s0,40(sp)
    11f8:	1800                	addi	s0,sp,48
    11fa:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
    11fe:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
    1202:	a815                	j	1236 <atoi+0x42>
    n = n*10 + *s++ - '0';
    1204:	fec42703          	lw	a4,-20(s0)
    1208:	87ba                	mv	a5,a4
    120a:	0027979b          	slliw	a5,a5,0x2
    120e:	9fb9                	addw	a5,a5,a4
    1210:	0017979b          	slliw	a5,a5,0x1
    1214:	0007871b          	sext.w	a4,a5
    1218:	fd843783          	ld	a5,-40(s0)
    121c:	00178693          	addi	a3,a5,1
    1220:	fcd43c23          	sd	a3,-40(s0)
    1224:	0007c783          	lbu	a5,0(a5)
    1228:	2781                	sext.w	a5,a5
    122a:	9fb9                	addw	a5,a5,a4
    122c:	2781                	sext.w	a5,a5
    122e:	fd07879b          	addiw	a5,a5,-48
    1232:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
    1236:	fd843783          	ld	a5,-40(s0)
    123a:	0007c783          	lbu	a5,0(a5)
    123e:	873e                	mv	a4,a5
    1240:	02f00793          	li	a5,47
    1244:	00e7fb63          	bgeu	a5,a4,125a <atoi+0x66>
    1248:	fd843783          	ld	a5,-40(s0)
    124c:	0007c783          	lbu	a5,0(a5)
    1250:	873e                	mv	a4,a5
    1252:	03900793          	li	a5,57
    1256:	fae7f7e3          	bgeu	a5,a4,1204 <atoi+0x10>
  return n;
    125a:	fec42783          	lw	a5,-20(s0)
}
    125e:	853e                	mv	a0,a5
    1260:	7422                	ld	s0,40(sp)
    1262:	6145                	addi	sp,sp,48
    1264:	8082                	ret

0000000000001266 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1266:	7139                	addi	sp,sp,-64
    1268:	fc22                	sd	s0,56(sp)
    126a:	0080                	addi	s0,sp,64
    126c:	fca43c23          	sd	a0,-40(s0)
    1270:	fcb43823          	sd	a1,-48(s0)
    1274:	87b2                	mv	a5,a2
    1276:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
    127a:	fd843783          	ld	a5,-40(s0)
    127e:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
    1282:	fd043783          	ld	a5,-48(s0)
    1286:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
    128a:	fe043703          	ld	a4,-32(s0)
    128e:	fe843783          	ld	a5,-24(s0)
    1292:	02e7fc63          	bgeu	a5,a4,12ca <memmove+0x64>
    while(n-- > 0)
    1296:	a00d                	j	12b8 <memmove+0x52>
      *dst++ = *src++;
    1298:	fe043703          	ld	a4,-32(s0)
    129c:	00170793          	addi	a5,a4,1
    12a0:	fef43023          	sd	a5,-32(s0)
    12a4:	fe843783          	ld	a5,-24(s0)
    12a8:	00178693          	addi	a3,a5,1
    12ac:	fed43423          	sd	a3,-24(s0)
    12b0:	00074703          	lbu	a4,0(a4)
    12b4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    12b8:	fcc42783          	lw	a5,-52(s0)
    12bc:	fff7871b          	addiw	a4,a5,-1
    12c0:	fce42623          	sw	a4,-52(s0)
    12c4:	fcf04ae3          	bgtz	a5,1298 <memmove+0x32>
    12c8:	a891                	j	131c <memmove+0xb6>
  } else {
    dst += n;
    12ca:	fcc42783          	lw	a5,-52(s0)
    12ce:	fe843703          	ld	a4,-24(s0)
    12d2:	97ba                	add	a5,a5,a4
    12d4:	fef43423          	sd	a5,-24(s0)
    src += n;
    12d8:	fcc42783          	lw	a5,-52(s0)
    12dc:	fe043703          	ld	a4,-32(s0)
    12e0:	97ba                	add	a5,a5,a4
    12e2:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    12e6:	a01d                	j	130c <memmove+0xa6>
      *--dst = *--src;
    12e8:	fe043783          	ld	a5,-32(s0)
    12ec:	17fd                	addi	a5,a5,-1
    12ee:	fef43023          	sd	a5,-32(s0)
    12f2:	fe843783          	ld	a5,-24(s0)
    12f6:	17fd                	addi	a5,a5,-1
    12f8:	fef43423          	sd	a5,-24(s0)
    12fc:	fe043783          	ld	a5,-32(s0)
    1300:	0007c703          	lbu	a4,0(a5)
    1304:	fe843783          	ld	a5,-24(s0)
    1308:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    130c:	fcc42783          	lw	a5,-52(s0)
    1310:	fff7871b          	addiw	a4,a5,-1
    1314:	fce42623          	sw	a4,-52(s0)
    1318:	fcf048e3          	bgtz	a5,12e8 <memmove+0x82>
  }
  return vdst;
    131c:	fd843783          	ld	a5,-40(s0)
}
    1320:	853e                	mv	a0,a5
    1322:	7462                	ld	s0,56(sp)
    1324:	6121                	addi	sp,sp,64
    1326:	8082                	ret

0000000000001328 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    1328:	7139                	addi	sp,sp,-64
    132a:	fc22                	sd	s0,56(sp)
    132c:	0080                	addi	s0,sp,64
    132e:	fca43c23          	sd	a0,-40(s0)
    1332:	fcb43823          	sd	a1,-48(s0)
    1336:	87b2                	mv	a5,a2
    1338:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
    133c:	fd843783          	ld	a5,-40(s0)
    1340:	fef43423          	sd	a5,-24(s0)
    1344:	fd043783          	ld	a5,-48(s0)
    1348:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    134c:	a0a1                	j	1394 <memcmp+0x6c>
    if (*p1 != *p2) {
    134e:	fe843783          	ld	a5,-24(s0)
    1352:	0007c703          	lbu	a4,0(a5)
    1356:	fe043783          	ld	a5,-32(s0)
    135a:	0007c783          	lbu	a5,0(a5)
    135e:	02f70163          	beq	a4,a5,1380 <memcmp+0x58>
      return *p1 - *p2;
    1362:	fe843783          	ld	a5,-24(s0)
    1366:	0007c783          	lbu	a5,0(a5)
    136a:	0007871b          	sext.w	a4,a5
    136e:	fe043783          	ld	a5,-32(s0)
    1372:	0007c783          	lbu	a5,0(a5)
    1376:	2781                	sext.w	a5,a5
    1378:	40f707bb          	subw	a5,a4,a5
    137c:	2781                	sext.w	a5,a5
    137e:	a01d                	j	13a4 <memcmp+0x7c>
    }
    p1++;
    1380:	fe843783          	ld	a5,-24(s0)
    1384:	0785                	addi	a5,a5,1
    1386:	fef43423          	sd	a5,-24(s0)
    p2++;
    138a:	fe043783          	ld	a5,-32(s0)
    138e:	0785                	addi	a5,a5,1
    1390:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    1394:	fcc42783          	lw	a5,-52(s0)
    1398:	fff7871b          	addiw	a4,a5,-1
    139c:	fce42623          	sw	a4,-52(s0)
    13a0:	f7dd                	bnez	a5,134e <memcmp+0x26>
  }
  return 0;
    13a2:	4781                	li	a5,0
}
    13a4:	853e                	mv	a0,a5
    13a6:	7462                	ld	s0,56(sp)
    13a8:	6121                	addi	sp,sp,64
    13aa:	8082                	ret

00000000000013ac <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    13ac:	7179                	addi	sp,sp,-48
    13ae:	f406                	sd	ra,40(sp)
    13b0:	f022                	sd	s0,32(sp)
    13b2:	1800                	addi	s0,sp,48
    13b4:	fea43423          	sd	a0,-24(s0)
    13b8:	feb43023          	sd	a1,-32(s0)
    13bc:	87b2                	mv	a5,a2
    13be:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    13c2:	fdc42783          	lw	a5,-36(s0)
    13c6:	863e                	mv	a2,a5
    13c8:	fe043583          	ld	a1,-32(s0)
    13cc:	fe843503          	ld	a0,-24(s0)
    13d0:	00000097          	auipc	ra,0x0
    13d4:	e96080e7          	jalr	-362(ra) # 1266 <memmove>
    13d8:	87aa                	mv	a5,a0
}
    13da:	853e                	mv	a0,a5
    13dc:	70a2                	ld	ra,40(sp)
    13de:	7402                	ld	s0,32(sp)
    13e0:	6145                	addi	sp,sp,48
    13e2:	8082                	ret

00000000000013e4 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    13e4:	4885                	li	a7,1
 ecall
    13e6:	00000073          	ecall
 ret
    13ea:	8082                	ret

00000000000013ec <exit>:
.global exit
exit:
 li a7, SYS_exit
    13ec:	4889                	li	a7,2
 ecall
    13ee:	00000073          	ecall
 ret
    13f2:	8082                	ret

00000000000013f4 <wait>:
.global wait
wait:
 li a7, SYS_wait
    13f4:	488d                	li	a7,3
 ecall
    13f6:	00000073          	ecall
 ret
    13fa:	8082                	ret

00000000000013fc <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    13fc:	4891                	li	a7,4
 ecall
    13fe:	00000073          	ecall
 ret
    1402:	8082                	ret

0000000000001404 <read>:
.global read
read:
 li a7, SYS_read
    1404:	4895                	li	a7,5
 ecall
    1406:	00000073          	ecall
 ret
    140a:	8082                	ret

000000000000140c <write>:
.global write
write:
 li a7, SYS_write
    140c:	48c1                	li	a7,16
 ecall
    140e:	00000073          	ecall
 ret
    1412:	8082                	ret

0000000000001414 <close>:
.global close
close:
 li a7, SYS_close
    1414:	48d5                	li	a7,21
 ecall
    1416:	00000073          	ecall
 ret
    141a:	8082                	ret

000000000000141c <kill>:
.global kill
kill:
 li a7, SYS_kill
    141c:	4899                	li	a7,6
 ecall
    141e:	00000073          	ecall
 ret
    1422:	8082                	ret

0000000000001424 <exec>:
.global exec
exec:
 li a7, SYS_exec
    1424:	489d                	li	a7,7
 ecall
    1426:	00000073          	ecall
 ret
    142a:	8082                	ret

000000000000142c <open>:
.global open
open:
 li a7, SYS_open
    142c:	48bd                	li	a7,15
 ecall
    142e:	00000073          	ecall
 ret
    1432:	8082                	ret

0000000000001434 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    1434:	48c5                	li	a7,17
 ecall
    1436:	00000073          	ecall
 ret
    143a:	8082                	ret

000000000000143c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    143c:	48c9                	li	a7,18
 ecall
    143e:	00000073          	ecall
 ret
    1442:	8082                	ret

0000000000001444 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    1444:	48a1                	li	a7,8
 ecall
    1446:	00000073          	ecall
 ret
    144a:	8082                	ret

000000000000144c <link>:
.global link
link:
 li a7, SYS_link
    144c:	48cd                	li	a7,19
 ecall
    144e:	00000073          	ecall
 ret
    1452:	8082                	ret

0000000000001454 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    1454:	48d1                	li	a7,20
 ecall
    1456:	00000073          	ecall
 ret
    145a:	8082                	ret

000000000000145c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    145c:	48a5                	li	a7,9
 ecall
    145e:	00000073          	ecall
 ret
    1462:	8082                	ret

0000000000001464 <dup>:
.global dup
dup:
 li a7, SYS_dup
    1464:	48a9                	li	a7,10
 ecall
    1466:	00000073          	ecall
 ret
    146a:	8082                	ret

000000000000146c <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    146c:	48ad                	li	a7,11
 ecall
    146e:	00000073          	ecall
 ret
    1472:	8082                	ret

0000000000001474 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    1474:	48b1                	li	a7,12
 ecall
    1476:	00000073          	ecall
 ret
    147a:	8082                	ret

000000000000147c <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    147c:	48b5                	li	a7,13
 ecall
    147e:	00000073          	ecall
 ret
    1482:	8082                	ret

0000000000001484 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    1484:	48b9                	li	a7,14
 ecall
    1486:	00000073          	ecall
 ret
    148a:	8082                	ret

000000000000148c <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
    148c:	48d9                	li	a7,22
 ecall
    148e:	00000073          	ecall
 ret
    1492:	8082                	ret

0000000000001494 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
    1494:	48dd                	li	a7,23
 ecall
    1496:	00000073          	ecall
 ret
    149a:	8082                	ret

000000000000149c <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
    149c:	48e1                	li	a7,24
 ecall
    149e:	00000073          	ecall
 ret
    14a2:	8082                	ret

00000000000014a4 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    14a4:	1101                	addi	sp,sp,-32
    14a6:	ec06                	sd	ra,24(sp)
    14a8:	e822                	sd	s0,16(sp)
    14aa:	1000                	addi	s0,sp,32
    14ac:	87aa                	mv	a5,a0
    14ae:	872e                	mv	a4,a1
    14b0:	fef42623          	sw	a5,-20(s0)
    14b4:	87ba                	mv	a5,a4
    14b6:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
    14ba:	feb40713          	addi	a4,s0,-21
    14be:	fec42783          	lw	a5,-20(s0)
    14c2:	4605                	li	a2,1
    14c4:	85ba                	mv	a1,a4
    14c6:	853e                	mv	a0,a5
    14c8:	00000097          	auipc	ra,0x0
    14cc:	f44080e7          	jalr	-188(ra) # 140c <write>
}
    14d0:	0001                	nop
    14d2:	60e2                	ld	ra,24(sp)
    14d4:	6442                	ld	s0,16(sp)
    14d6:	6105                	addi	sp,sp,32
    14d8:	8082                	ret

00000000000014da <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    14da:	7139                	addi	sp,sp,-64
    14dc:	fc06                	sd	ra,56(sp)
    14de:	f822                	sd	s0,48(sp)
    14e0:	0080                	addi	s0,sp,64
    14e2:	87aa                	mv	a5,a0
    14e4:	8736                	mv	a4,a3
    14e6:	fcf42623          	sw	a5,-52(s0)
    14ea:	87ae                	mv	a5,a1
    14ec:	fcf42423          	sw	a5,-56(s0)
    14f0:	87b2                	mv	a5,a2
    14f2:	fcf42223          	sw	a5,-60(s0)
    14f6:	87ba                	mv	a5,a4
    14f8:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    14fc:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
    1500:	fc042783          	lw	a5,-64(s0)
    1504:	2781                	sext.w	a5,a5
    1506:	c38d                	beqz	a5,1528 <printint+0x4e>
    1508:	fc842783          	lw	a5,-56(s0)
    150c:	2781                	sext.w	a5,a5
    150e:	0007dd63          	bgez	a5,1528 <printint+0x4e>
    neg = 1;
    1512:	4785                	li	a5,1
    1514:	fef42423          	sw	a5,-24(s0)
    x = -xx;
    1518:	fc842783          	lw	a5,-56(s0)
    151c:	40f007bb          	negw	a5,a5
    1520:	2781                	sext.w	a5,a5
    1522:	fef42223          	sw	a5,-28(s0)
    1526:	a029                	j	1530 <printint+0x56>
  } else {
    x = xx;
    1528:	fc842783          	lw	a5,-56(s0)
    152c:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
    1530:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
    1534:	fc442783          	lw	a5,-60(s0)
    1538:	fe442703          	lw	a4,-28(s0)
    153c:	02f777bb          	remuw	a5,a4,a5
    1540:	0007861b          	sext.w	a2,a5
    1544:	fec42783          	lw	a5,-20(s0)
    1548:	0017871b          	addiw	a4,a5,1
    154c:	fee42623          	sw	a4,-20(s0)
    1550:	00002697          	auipc	a3,0x2
    1554:	d6868693          	addi	a3,a3,-664 # 32b8 <digits>
    1558:	02061713          	slli	a4,a2,0x20
    155c:	9301                	srli	a4,a4,0x20
    155e:	9736                	add	a4,a4,a3
    1560:	00074703          	lbu	a4,0(a4)
    1564:	ff040693          	addi	a3,s0,-16
    1568:	97b6                	add	a5,a5,a3
    156a:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
    156e:	fc442783          	lw	a5,-60(s0)
    1572:	fe442703          	lw	a4,-28(s0)
    1576:	02f757bb          	divuw	a5,a4,a5
    157a:	fef42223          	sw	a5,-28(s0)
    157e:	fe442783          	lw	a5,-28(s0)
    1582:	2781                	sext.w	a5,a5
    1584:	fbc5                	bnez	a5,1534 <printint+0x5a>
  if(neg)
    1586:	fe842783          	lw	a5,-24(s0)
    158a:	2781                	sext.w	a5,a5
    158c:	cf95                	beqz	a5,15c8 <printint+0xee>
    buf[i++] = '-';
    158e:	fec42783          	lw	a5,-20(s0)
    1592:	0017871b          	addiw	a4,a5,1
    1596:	fee42623          	sw	a4,-20(s0)
    159a:	ff040713          	addi	a4,s0,-16
    159e:	97ba                	add	a5,a5,a4
    15a0:	02d00713          	li	a4,45
    15a4:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
    15a8:	a005                	j	15c8 <printint+0xee>
    putc(fd, buf[i]);
    15aa:	fec42783          	lw	a5,-20(s0)
    15ae:	ff040713          	addi	a4,s0,-16
    15b2:	97ba                	add	a5,a5,a4
    15b4:	fe07c703          	lbu	a4,-32(a5)
    15b8:	fcc42783          	lw	a5,-52(s0)
    15bc:	85ba                	mv	a1,a4
    15be:	853e                	mv	a0,a5
    15c0:	00000097          	auipc	ra,0x0
    15c4:	ee4080e7          	jalr	-284(ra) # 14a4 <putc>
  while(--i >= 0)
    15c8:	fec42783          	lw	a5,-20(s0)
    15cc:	37fd                	addiw	a5,a5,-1
    15ce:	fef42623          	sw	a5,-20(s0)
    15d2:	fec42783          	lw	a5,-20(s0)
    15d6:	2781                	sext.w	a5,a5
    15d8:	fc07d9e3          	bgez	a5,15aa <printint+0xd0>
}
    15dc:	0001                	nop
    15de:	0001                	nop
    15e0:	70e2                	ld	ra,56(sp)
    15e2:	7442                	ld	s0,48(sp)
    15e4:	6121                	addi	sp,sp,64
    15e6:	8082                	ret

00000000000015e8 <printptr>:

static void
printptr(int fd, uint64 x) {
    15e8:	7179                	addi	sp,sp,-48
    15ea:	f406                	sd	ra,40(sp)
    15ec:	f022                	sd	s0,32(sp)
    15ee:	1800                	addi	s0,sp,48
    15f0:	87aa                	mv	a5,a0
    15f2:	fcb43823          	sd	a1,-48(s0)
    15f6:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
    15fa:	fdc42783          	lw	a5,-36(s0)
    15fe:	03000593          	li	a1,48
    1602:	853e                	mv	a0,a5
    1604:	00000097          	auipc	ra,0x0
    1608:	ea0080e7          	jalr	-352(ra) # 14a4 <putc>
  putc(fd, 'x');
    160c:	fdc42783          	lw	a5,-36(s0)
    1610:	07800593          	li	a1,120
    1614:	853e                	mv	a0,a5
    1616:	00000097          	auipc	ra,0x0
    161a:	e8e080e7          	jalr	-370(ra) # 14a4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    161e:	fe042623          	sw	zero,-20(s0)
    1622:	a82d                	j	165c <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    1624:	fd043783          	ld	a5,-48(s0)
    1628:	93f1                	srli	a5,a5,0x3c
    162a:	00002717          	auipc	a4,0x2
    162e:	c8e70713          	addi	a4,a4,-882 # 32b8 <digits>
    1632:	97ba                	add	a5,a5,a4
    1634:	0007c703          	lbu	a4,0(a5)
    1638:	fdc42783          	lw	a5,-36(s0)
    163c:	85ba                	mv	a1,a4
    163e:	853e                	mv	a0,a5
    1640:	00000097          	auipc	ra,0x0
    1644:	e64080e7          	jalr	-412(ra) # 14a4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    1648:	fec42783          	lw	a5,-20(s0)
    164c:	2785                	addiw	a5,a5,1
    164e:	fef42623          	sw	a5,-20(s0)
    1652:	fd043783          	ld	a5,-48(s0)
    1656:	0792                	slli	a5,a5,0x4
    1658:	fcf43823          	sd	a5,-48(s0)
    165c:	fec42783          	lw	a5,-20(s0)
    1660:	873e                	mv	a4,a5
    1662:	47bd                	li	a5,15
    1664:	fce7f0e3          	bgeu	a5,a4,1624 <printptr+0x3c>
}
    1668:	0001                	nop
    166a:	0001                	nop
    166c:	70a2                	ld	ra,40(sp)
    166e:	7402                	ld	s0,32(sp)
    1670:	6145                	addi	sp,sp,48
    1672:	8082                	ret

0000000000001674 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    1674:	715d                	addi	sp,sp,-80
    1676:	e486                	sd	ra,72(sp)
    1678:	e0a2                	sd	s0,64(sp)
    167a:	0880                	addi	s0,sp,80
    167c:	87aa                	mv	a5,a0
    167e:	fcb43023          	sd	a1,-64(s0)
    1682:	fac43c23          	sd	a2,-72(s0)
    1686:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
    168a:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    168e:	fe042223          	sw	zero,-28(s0)
    1692:	a42d                	j	18bc <vprintf+0x248>
    c = fmt[i] & 0xff;
    1694:	fe442783          	lw	a5,-28(s0)
    1698:	fc043703          	ld	a4,-64(s0)
    169c:	97ba                	add	a5,a5,a4
    169e:	0007c783          	lbu	a5,0(a5)
    16a2:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
    16a6:	fe042783          	lw	a5,-32(s0)
    16aa:	2781                	sext.w	a5,a5
    16ac:	eb9d                	bnez	a5,16e2 <vprintf+0x6e>
      if(c == '%'){
    16ae:	fdc42783          	lw	a5,-36(s0)
    16b2:	0007871b          	sext.w	a4,a5
    16b6:	02500793          	li	a5,37
    16ba:	00f71763          	bne	a4,a5,16c8 <vprintf+0x54>
        state = '%';
    16be:	02500793          	li	a5,37
    16c2:	fef42023          	sw	a5,-32(s0)
    16c6:	a2f5                	j	18b2 <vprintf+0x23e>
      } else {
        putc(fd, c);
    16c8:	fdc42783          	lw	a5,-36(s0)
    16cc:	0ff7f713          	andi	a4,a5,255
    16d0:	fcc42783          	lw	a5,-52(s0)
    16d4:	85ba                	mv	a1,a4
    16d6:	853e                	mv	a0,a5
    16d8:	00000097          	auipc	ra,0x0
    16dc:	dcc080e7          	jalr	-564(ra) # 14a4 <putc>
    16e0:	aac9                	j	18b2 <vprintf+0x23e>
      }
    } else if(state == '%'){
    16e2:	fe042783          	lw	a5,-32(s0)
    16e6:	0007871b          	sext.w	a4,a5
    16ea:	02500793          	li	a5,37
    16ee:	1cf71263          	bne	a4,a5,18b2 <vprintf+0x23e>
      if(c == 'd'){
    16f2:	fdc42783          	lw	a5,-36(s0)
    16f6:	0007871b          	sext.w	a4,a5
    16fa:	06400793          	li	a5,100
    16fe:	02f71463          	bne	a4,a5,1726 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
    1702:	fb843783          	ld	a5,-72(s0)
    1706:	00878713          	addi	a4,a5,8
    170a:	fae43c23          	sd	a4,-72(s0)
    170e:	4398                	lw	a4,0(a5)
    1710:	fcc42783          	lw	a5,-52(s0)
    1714:	4685                	li	a3,1
    1716:	4629                	li	a2,10
    1718:	85ba                	mv	a1,a4
    171a:	853e                	mv	a0,a5
    171c:	00000097          	auipc	ra,0x0
    1720:	dbe080e7          	jalr	-578(ra) # 14da <printint>
    1724:	a269                	j	18ae <vprintf+0x23a>
      } else if(c == 'l') {
    1726:	fdc42783          	lw	a5,-36(s0)
    172a:	0007871b          	sext.w	a4,a5
    172e:	06c00793          	li	a5,108
    1732:	02f71663          	bne	a4,a5,175e <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
    1736:	fb843783          	ld	a5,-72(s0)
    173a:	00878713          	addi	a4,a5,8
    173e:	fae43c23          	sd	a4,-72(s0)
    1742:	639c                	ld	a5,0(a5)
    1744:	0007871b          	sext.w	a4,a5
    1748:	fcc42783          	lw	a5,-52(s0)
    174c:	4681                	li	a3,0
    174e:	4629                	li	a2,10
    1750:	85ba                	mv	a1,a4
    1752:	853e                	mv	a0,a5
    1754:	00000097          	auipc	ra,0x0
    1758:	d86080e7          	jalr	-634(ra) # 14da <printint>
    175c:	aa89                	j	18ae <vprintf+0x23a>
      } else if(c == 'x') {
    175e:	fdc42783          	lw	a5,-36(s0)
    1762:	0007871b          	sext.w	a4,a5
    1766:	07800793          	li	a5,120
    176a:	02f71463          	bne	a4,a5,1792 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
    176e:	fb843783          	ld	a5,-72(s0)
    1772:	00878713          	addi	a4,a5,8
    1776:	fae43c23          	sd	a4,-72(s0)
    177a:	4398                	lw	a4,0(a5)
    177c:	fcc42783          	lw	a5,-52(s0)
    1780:	4681                	li	a3,0
    1782:	4641                	li	a2,16
    1784:	85ba                	mv	a1,a4
    1786:	853e                	mv	a0,a5
    1788:	00000097          	auipc	ra,0x0
    178c:	d52080e7          	jalr	-686(ra) # 14da <printint>
    1790:	aa39                	j	18ae <vprintf+0x23a>
      } else if(c == 'p') {
    1792:	fdc42783          	lw	a5,-36(s0)
    1796:	0007871b          	sext.w	a4,a5
    179a:	07000793          	li	a5,112
    179e:	02f71263          	bne	a4,a5,17c2 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
    17a2:	fb843783          	ld	a5,-72(s0)
    17a6:	00878713          	addi	a4,a5,8
    17aa:	fae43c23          	sd	a4,-72(s0)
    17ae:	6398                	ld	a4,0(a5)
    17b0:	fcc42783          	lw	a5,-52(s0)
    17b4:	85ba                	mv	a1,a4
    17b6:	853e                	mv	a0,a5
    17b8:	00000097          	auipc	ra,0x0
    17bc:	e30080e7          	jalr	-464(ra) # 15e8 <printptr>
    17c0:	a0fd                	j	18ae <vprintf+0x23a>
      } else if(c == 's'){
    17c2:	fdc42783          	lw	a5,-36(s0)
    17c6:	0007871b          	sext.w	a4,a5
    17ca:	07300793          	li	a5,115
    17ce:	04f71c63          	bne	a4,a5,1826 <vprintf+0x1b2>
        s = va_arg(ap, char*);
    17d2:	fb843783          	ld	a5,-72(s0)
    17d6:	00878713          	addi	a4,a5,8
    17da:	fae43c23          	sd	a4,-72(s0)
    17de:	639c                	ld	a5,0(a5)
    17e0:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
    17e4:	fe843783          	ld	a5,-24(s0)
    17e8:	eb8d                	bnez	a5,181a <vprintf+0x1a6>
          s = "(null)";
    17ea:	00002797          	auipc	a5,0x2
    17ee:	84e78793          	addi	a5,a5,-1970 # 3038 <schedule_edf_cbs+0x610>
    17f2:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    17f6:	a015                	j	181a <vprintf+0x1a6>
          putc(fd, *s);
    17f8:	fe843783          	ld	a5,-24(s0)
    17fc:	0007c703          	lbu	a4,0(a5)
    1800:	fcc42783          	lw	a5,-52(s0)
    1804:	85ba                	mv	a1,a4
    1806:	853e                	mv	a0,a5
    1808:	00000097          	auipc	ra,0x0
    180c:	c9c080e7          	jalr	-868(ra) # 14a4 <putc>
          s++;
    1810:	fe843783          	ld	a5,-24(s0)
    1814:	0785                	addi	a5,a5,1
    1816:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    181a:	fe843783          	ld	a5,-24(s0)
    181e:	0007c783          	lbu	a5,0(a5)
    1822:	fbf9                	bnez	a5,17f8 <vprintf+0x184>
    1824:	a069                	j	18ae <vprintf+0x23a>
        }
      } else if(c == 'c'){
    1826:	fdc42783          	lw	a5,-36(s0)
    182a:	0007871b          	sext.w	a4,a5
    182e:	06300793          	li	a5,99
    1832:	02f71463          	bne	a4,a5,185a <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
    1836:	fb843783          	ld	a5,-72(s0)
    183a:	00878713          	addi	a4,a5,8
    183e:	fae43c23          	sd	a4,-72(s0)
    1842:	439c                	lw	a5,0(a5)
    1844:	0ff7f713          	andi	a4,a5,255
    1848:	fcc42783          	lw	a5,-52(s0)
    184c:	85ba                	mv	a1,a4
    184e:	853e                	mv	a0,a5
    1850:	00000097          	auipc	ra,0x0
    1854:	c54080e7          	jalr	-940(ra) # 14a4 <putc>
    1858:	a899                	j	18ae <vprintf+0x23a>
      } else if(c == '%'){
    185a:	fdc42783          	lw	a5,-36(s0)
    185e:	0007871b          	sext.w	a4,a5
    1862:	02500793          	li	a5,37
    1866:	00f71f63          	bne	a4,a5,1884 <vprintf+0x210>
        putc(fd, c);
    186a:	fdc42783          	lw	a5,-36(s0)
    186e:	0ff7f713          	andi	a4,a5,255
    1872:	fcc42783          	lw	a5,-52(s0)
    1876:	85ba                	mv	a1,a4
    1878:	853e                	mv	a0,a5
    187a:	00000097          	auipc	ra,0x0
    187e:	c2a080e7          	jalr	-982(ra) # 14a4 <putc>
    1882:	a035                	j	18ae <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1884:	fcc42783          	lw	a5,-52(s0)
    1888:	02500593          	li	a1,37
    188c:	853e                	mv	a0,a5
    188e:	00000097          	auipc	ra,0x0
    1892:	c16080e7          	jalr	-1002(ra) # 14a4 <putc>
        putc(fd, c);
    1896:	fdc42783          	lw	a5,-36(s0)
    189a:	0ff7f713          	andi	a4,a5,255
    189e:	fcc42783          	lw	a5,-52(s0)
    18a2:	85ba                	mv	a1,a4
    18a4:	853e                	mv	a0,a5
    18a6:	00000097          	auipc	ra,0x0
    18aa:	bfe080e7          	jalr	-1026(ra) # 14a4 <putc>
      }
      state = 0;
    18ae:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    18b2:	fe442783          	lw	a5,-28(s0)
    18b6:	2785                	addiw	a5,a5,1
    18b8:	fef42223          	sw	a5,-28(s0)
    18bc:	fe442783          	lw	a5,-28(s0)
    18c0:	fc043703          	ld	a4,-64(s0)
    18c4:	97ba                	add	a5,a5,a4
    18c6:	0007c783          	lbu	a5,0(a5)
    18ca:	dc0795e3          	bnez	a5,1694 <vprintf+0x20>
    }
  }
}
    18ce:	0001                	nop
    18d0:	0001                	nop
    18d2:	60a6                	ld	ra,72(sp)
    18d4:	6406                	ld	s0,64(sp)
    18d6:	6161                	addi	sp,sp,80
    18d8:	8082                	ret

00000000000018da <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    18da:	7159                	addi	sp,sp,-112
    18dc:	fc06                	sd	ra,56(sp)
    18de:	f822                	sd	s0,48(sp)
    18e0:	0080                	addi	s0,sp,64
    18e2:	fcb43823          	sd	a1,-48(s0)
    18e6:	e010                	sd	a2,0(s0)
    18e8:	e414                	sd	a3,8(s0)
    18ea:	e818                	sd	a4,16(s0)
    18ec:	ec1c                	sd	a5,24(s0)
    18ee:	03043023          	sd	a6,32(s0)
    18f2:	03143423          	sd	a7,40(s0)
    18f6:	87aa                	mv	a5,a0
    18f8:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
    18fc:	03040793          	addi	a5,s0,48
    1900:	fcf43423          	sd	a5,-56(s0)
    1904:	fc843783          	ld	a5,-56(s0)
    1908:	fd078793          	addi	a5,a5,-48
    190c:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
    1910:	fe843703          	ld	a4,-24(s0)
    1914:	fdc42783          	lw	a5,-36(s0)
    1918:	863a                	mv	a2,a4
    191a:	fd043583          	ld	a1,-48(s0)
    191e:	853e                	mv	a0,a5
    1920:	00000097          	auipc	ra,0x0
    1924:	d54080e7          	jalr	-684(ra) # 1674 <vprintf>
}
    1928:	0001                	nop
    192a:	70e2                	ld	ra,56(sp)
    192c:	7442                	ld	s0,48(sp)
    192e:	6165                	addi	sp,sp,112
    1930:	8082                	ret

0000000000001932 <printf>:

void
printf(const char *fmt, ...)
{
    1932:	7159                	addi	sp,sp,-112
    1934:	f406                	sd	ra,40(sp)
    1936:	f022                	sd	s0,32(sp)
    1938:	1800                	addi	s0,sp,48
    193a:	fca43c23          	sd	a0,-40(s0)
    193e:	e40c                	sd	a1,8(s0)
    1940:	e810                	sd	a2,16(s0)
    1942:	ec14                	sd	a3,24(s0)
    1944:	f018                	sd	a4,32(s0)
    1946:	f41c                	sd	a5,40(s0)
    1948:	03043823          	sd	a6,48(s0)
    194c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    1950:	04040793          	addi	a5,s0,64
    1954:	fcf43823          	sd	a5,-48(s0)
    1958:	fd043783          	ld	a5,-48(s0)
    195c:	fc878793          	addi	a5,a5,-56
    1960:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
    1964:	fe843783          	ld	a5,-24(s0)
    1968:	863e                	mv	a2,a5
    196a:	fd843583          	ld	a1,-40(s0)
    196e:	4505                	li	a0,1
    1970:	00000097          	auipc	ra,0x0
    1974:	d04080e7          	jalr	-764(ra) # 1674 <vprintf>
}
    1978:	0001                	nop
    197a:	70a2                	ld	ra,40(sp)
    197c:	7402                	ld	s0,32(sp)
    197e:	6165                	addi	sp,sp,112
    1980:	8082                	ret

0000000000001982 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1982:	7179                	addi	sp,sp,-48
    1984:	f422                	sd	s0,40(sp)
    1986:	1800                	addi	s0,sp,48
    1988:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    198c:	fd843783          	ld	a5,-40(s0)
    1990:	17c1                	addi	a5,a5,-16
    1992:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1996:	00002797          	auipc	a5,0x2
    199a:	9f278793          	addi	a5,a5,-1550 # 3388 <freep>
    199e:	639c                	ld	a5,0(a5)
    19a0:	fef43423          	sd	a5,-24(s0)
    19a4:	a815                	j	19d8 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    19a6:	fe843783          	ld	a5,-24(s0)
    19aa:	639c                	ld	a5,0(a5)
    19ac:	fe843703          	ld	a4,-24(s0)
    19b0:	00f76f63          	bltu	a4,a5,19ce <free+0x4c>
    19b4:	fe043703          	ld	a4,-32(s0)
    19b8:	fe843783          	ld	a5,-24(s0)
    19bc:	02e7eb63          	bltu	a5,a4,19f2 <free+0x70>
    19c0:	fe843783          	ld	a5,-24(s0)
    19c4:	639c                	ld	a5,0(a5)
    19c6:	fe043703          	ld	a4,-32(s0)
    19ca:	02f76463          	bltu	a4,a5,19f2 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    19ce:	fe843783          	ld	a5,-24(s0)
    19d2:	639c                	ld	a5,0(a5)
    19d4:	fef43423          	sd	a5,-24(s0)
    19d8:	fe043703          	ld	a4,-32(s0)
    19dc:	fe843783          	ld	a5,-24(s0)
    19e0:	fce7f3e3          	bgeu	a5,a4,19a6 <free+0x24>
    19e4:	fe843783          	ld	a5,-24(s0)
    19e8:	639c                	ld	a5,0(a5)
    19ea:	fe043703          	ld	a4,-32(s0)
    19ee:	faf77ce3          	bgeu	a4,a5,19a6 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
    19f2:	fe043783          	ld	a5,-32(s0)
    19f6:	479c                	lw	a5,8(a5)
    19f8:	1782                	slli	a5,a5,0x20
    19fa:	9381                	srli	a5,a5,0x20
    19fc:	0792                	slli	a5,a5,0x4
    19fe:	fe043703          	ld	a4,-32(s0)
    1a02:	973e                	add	a4,a4,a5
    1a04:	fe843783          	ld	a5,-24(s0)
    1a08:	639c                	ld	a5,0(a5)
    1a0a:	02f71763          	bne	a4,a5,1a38 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
    1a0e:	fe043783          	ld	a5,-32(s0)
    1a12:	4798                	lw	a4,8(a5)
    1a14:	fe843783          	ld	a5,-24(s0)
    1a18:	639c                	ld	a5,0(a5)
    1a1a:	479c                	lw	a5,8(a5)
    1a1c:	9fb9                	addw	a5,a5,a4
    1a1e:	0007871b          	sext.w	a4,a5
    1a22:	fe043783          	ld	a5,-32(s0)
    1a26:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
    1a28:	fe843783          	ld	a5,-24(s0)
    1a2c:	639c                	ld	a5,0(a5)
    1a2e:	6398                	ld	a4,0(a5)
    1a30:	fe043783          	ld	a5,-32(s0)
    1a34:	e398                	sd	a4,0(a5)
    1a36:	a039                	j	1a44 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
    1a38:	fe843783          	ld	a5,-24(s0)
    1a3c:	6398                	ld	a4,0(a5)
    1a3e:	fe043783          	ld	a5,-32(s0)
    1a42:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
    1a44:	fe843783          	ld	a5,-24(s0)
    1a48:	479c                	lw	a5,8(a5)
    1a4a:	1782                	slli	a5,a5,0x20
    1a4c:	9381                	srli	a5,a5,0x20
    1a4e:	0792                	slli	a5,a5,0x4
    1a50:	fe843703          	ld	a4,-24(s0)
    1a54:	97ba                	add	a5,a5,a4
    1a56:	fe043703          	ld	a4,-32(s0)
    1a5a:	02f71563          	bne	a4,a5,1a84 <free+0x102>
    p->s.size += bp->s.size;
    1a5e:	fe843783          	ld	a5,-24(s0)
    1a62:	4798                	lw	a4,8(a5)
    1a64:	fe043783          	ld	a5,-32(s0)
    1a68:	479c                	lw	a5,8(a5)
    1a6a:	9fb9                	addw	a5,a5,a4
    1a6c:	0007871b          	sext.w	a4,a5
    1a70:	fe843783          	ld	a5,-24(s0)
    1a74:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    1a76:	fe043783          	ld	a5,-32(s0)
    1a7a:	6398                	ld	a4,0(a5)
    1a7c:	fe843783          	ld	a5,-24(s0)
    1a80:	e398                	sd	a4,0(a5)
    1a82:	a031                	j	1a8e <free+0x10c>
  } else
    p->s.ptr = bp;
    1a84:	fe843783          	ld	a5,-24(s0)
    1a88:	fe043703          	ld	a4,-32(s0)
    1a8c:	e398                	sd	a4,0(a5)
  freep = p;
    1a8e:	00002797          	auipc	a5,0x2
    1a92:	8fa78793          	addi	a5,a5,-1798 # 3388 <freep>
    1a96:	fe843703          	ld	a4,-24(s0)
    1a9a:	e398                	sd	a4,0(a5)
}
    1a9c:	0001                	nop
    1a9e:	7422                	ld	s0,40(sp)
    1aa0:	6145                	addi	sp,sp,48
    1aa2:	8082                	ret

0000000000001aa4 <morecore>:

static Header*
morecore(uint nu)
{
    1aa4:	7179                	addi	sp,sp,-48
    1aa6:	f406                	sd	ra,40(sp)
    1aa8:	f022                	sd	s0,32(sp)
    1aaa:	1800                	addi	s0,sp,48
    1aac:	87aa                	mv	a5,a0
    1aae:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
    1ab2:	fdc42783          	lw	a5,-36(s0)
    1ab6:	0007871b          	sext.w	a4,a5
    1aba:	6785                	lui	a5,0x1
    1abc:	00f77563          	bgeu	a4,a5,1ac6 <morecore+0x22>
    nu = 4096;
    1ac0:	6785                	lui	a5,0x1
    1ac2:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
    1ac6:	fdc42783          	lw	a5,-36(s0)
    1aca:	0047979b          	slliw	a5,a5,0x4
    1ace:	2781                	sext.w	a5,a5
    1ad0:	2781                	sext.w	a5,a5
    1ad2:	853e                	mv	a0,a5
    1ad4:	00000097          	auipc	ra,0x0
    1ad8:	9a0080e7          	jalr	-1632(ra) # 1474 <sbrk>
    1adc:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
    1ae0:	fe843703          	ld	a4,-24(s0)
    1ae4:	57fd                	li	a5,-1
    1ae6:	00f71463          	bne	a4,a5,1aee <morecore+0x4a>
    return 0;
    1aea:	4781                	li	a5,0
    1aec:	a03d                	j	1b1a <morecore+0x76>
  hp = (Header*)p;
    1aee:	fe843783          	ld	a5,-24(s0)
    1af2:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
    1af6:	fe043783          	ld	a5,-32(s0)
    1afa:	fdc42703          	lw	a4,-36(s0)
    1afe:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
    1b00:	fe043783          	ld	a5,-32(s0)
    1b04:	07c1                	addi	a5,a5,16
    1b06:	853e                	mv	a0,a5
    1b08:	00000097          	auipc	ra,0x0
    1b0c:	e7a080e7          	jalr	-390(ra) # 1982 <free>
  return freep;
    1b10:	00002797          	auipc	a5,0x2
    1b14:	87878793          	addi	a5,a5,-1928 # 3388 <freep>
    1b18:	639c                	ld	a5,0(a5)
}
    1b1a:	853e                	mv	a0,a5
    1b1c:	70a2                	ld	ra,40(sp)
    1b1e:	7402                	ld	s0,32(sp)
    1b20:	6145                	addi	sp,sp,48
    1b22:	8082                	ret

0000000000001b24 <malloc>:

void*
malloc(uint nbytes)
{
    1b24:	7139                	addi	sp,sp,-64
    1b26:	fc06                	sd	ra,56(sp)
    1b28:	f822                	sd	s0,48(sp)
    1b2a:	0080                	addi	s0,sp,64
    1b2c:	87aa                	mv	a5,a0
    1b2e:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1b32:	fcc46783          	lwu	a5,-52(s0)
    1b36:	07bd                	addi	a5,a5,15
    1b38:	8391                	srli	a5,a5,0x4
    1b3a:	2781                	sext.w	a5,a5
    1b3c:	2785                	addiw	a5,a5,1
    1b3e:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
    1b42:	00002797          	auipc	a5,0x2
    1b46:	84678793          	addi	a5,a5,-1978 # 3388 <freep>
    1b4a:	639c                	ld	a5,0(a5)
    1b4c:	fef43023          	sd	a5,-32(s0)
    1b50:	fe043783          	ld	a5,-32(s0)
    1b54:	ef95                	bnez	a5,1b90 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    1b56:	00002797          	auipc	a5,0x2
    1b5a:	82278793          	addi	a5,a5,-2014 # 3378 <base>
    1b5e:	fef43023          	sd	a5,-32(s0)
    1b62:	00002797          	auipc	a5,0x2
    1b66:	82678793          	addi	a5,a5,-2010 # 3388 <freep>
    1b6a:	fe043703          	ld	a4,-32(s0)
    1b6e:	e398                	sd	a4,0(a5)
    1b70:	00002797          	auipc	a5,0x2
    1b74:	81878793          	addi	a5,a5,-2024 # 3388 <freep>
    1b78:	6398                	ld	a4,0(a5)
    1b7a:	00001797          	auipc	a5,0x1
    1b7e:	7fe78793          	addi	a5,a5,2046 # 3378 <base>
    1b82:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    1b84:	00001797          	auipc	a5,0x1
    1b88:	7f478793          	addi	a5,a5,2036 # 3378 <base>
    1b8c:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b90:	fe043783          	ld	a5,-32(s0)
    1b94:	639c                	ld	a5,0(a5)
    1b96:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1b9a:	fe843783          	ld	a5,-24(s0)
    1b9e:	4798                	lw	a4,8(a5)
    1ba0:	fdc42783          	lw	a5,-36(s0)
    1ba4:	2781                	sext.w	a5,a5
    1ba6:	06f76863          	bltu	a4,a5,1c16 <malloc+0xf2>
      if(p->s.size == nunits)
    1baa:	fe843783          	ld	a5,-24(s0)
    1bae:	4798                	lw	a4,8(a5)
    1bb0:	fdc42783          	lw	a5,-36(s0)
    1bb4:	2781                	sext.w	a5,a5
    1bb6:	00e79963          	bne	a5,a4,1bc8 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    1bba:	fe843783          	ld	a5,-24(s0)
    1bbe:	6398                	ld	a4,0(a5)
    1bc0:	fe043783          	ld	a5,-32(s0)
    1bc4:	e398                	sd	a4,0(a5)
    1bc6:	a82d                	j	1c00 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    1bc8:	fe843783          	ld	a5,-24(s0)
    1bcc:	4798                	lw	a4,8(a5)
    1bce:	fdc42783          	lw	a5,-36(s0)
    1bd2:	40f707bb          	subw	a5,a4,a5
    1bd6:	0007871b          	sext.w	a4,a5
    1bda:	fe843783          	ld	a5,-24(s0)
    1bde:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1be0:	fe843783          	ld	a5,-24(s0)
    1be4:	479c                	lw	a5,8(a5)
    1be6:	1782                	slli	a5,a5,0x20
    1be8:	9381                	srli	a5,a5,0x20
    1bea:	0792                	slli	a5,a5,0x4
    1bec:	fe843703          	ld	a4,-24(s0)
    1bf0:	97ba                	add	a5,a5,a4
    1bf2:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    1bf6:	fe843783          	ld	a5,-24(s0)
    1bfa:	fdc42703          	lw	a4,-36(s0)
    1bfe:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    1c00:	00001797          	auipc	a5,0x1
    1c04:	78878793          	addi	a5,a5,1928 # 3388 <freep>
    1c08:	fe043703          	ld	a4,-32(s0)
    1c0c:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    1c0e:	fe843783          	ld	a5,-24(s0)
    1c12:	07c1                	addi	a5,a5,16
    1c14:	a091                	j	1c58 <malloc+0x134>
    }
    if(p == freep)
    1c16:	00001797          	auipc	a5,0x1
    1c1a:	77278793          	addi	a5,a5,1906 # 3388 <freep>
    1c1e:	639c                	ld	a5,0(a5)
    1c20:	fe843703          	ld	a4,-24(s0)
    1c24:	02f71063          	bne	a4,a5,1c44 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    1c28:	fdc42783          	lw	a5,-36(s0)
    1c2c:	853e                	mv	a0,a5
    1c2e:	00000097          	auipc	ra,0x0
    1c32:	e76080e7          	jalr	-394(ra) # 1aa4 <morecore>
    1c36:	fea43423          	sd	a0,-24(s0)
    1c3a:	fe843783          	ld	a5,-24(s0)
    1c3e:	e399                	bnez	a5,1c44 <malloc+0x120>
        return 0;
    1c40:	4781                	li	a5,0
    1c42:	a819                	j	1c58 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1c44:	fe843783          	ld	a5,-24(s0)
    1c48:	fef43023          	sd	a5,-32(s0)
    1c4c:	fe843783          	ld	a5,-24(s0)
    1c50:	639c                	ld	a5,0(a5)
    1c52:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1c56:	b791                	j	1b9a <malloc+0x76>
  }
}
    1c58:	853e                	mv	a0,a5
    1c5a:	70e2                	ld	ra,56(sp)
    1c5c:	7442                	ld	s0,48(sp)
    1c5e:	6121                	addi	sp,sp,64
    1c60:	8082                	ret

0000000000001c62 <setjmp>:
    1c62:	e100                	sd	s0,0(a0)
    1c64:	e504                	sd	s1,8(a0)
    1c66:	01253823          	sd	s2,16(a0)
    1c6a:	01353c23          	sd	s3,24(a0)
    1c6e:	03453023          	sd	s4,32(a0)
    1c72:	03553423          	sd	s5,40(a0)
    1c76:	03653823          	sd	s6,48(a0)
    1c7a:	03753c23          	sd	s7,56(a0)
    1c7e:	05853023          	sd	s8,64(a0)
    1c82:	05953423          	sd	s9,72(a0)
    1c86:	05a53823          	sd	s10,80(a0)
    1c8a:	05b53c23          	sd	s11,88(a0)
    1c8e:	06153023          	sd	ra,96(a0)
    1c92:	06253423          	sd	sp,104(a0)
    1c96:	4501                	li	a0,0
    1c98:	8082                	ret

0000000000001c9a <longjmp>:
    1c9a:	6100                	ld	s0,0(a0)
    1c9c:	6504                	ld	s1,8(a0)
    1c9e:	01053903          	ld	s2,16(a0)
    1ca2:	01853983          	ld	s3,24(a0)
    1ca6:	02053a03          	ld	s4,32(a0)
    1caa:	02853a83          	ld	s5,40(a0)
    1cae:	03053b03          	ld	s6,48(a0)
    1cb2:	03853b83          	ld	s7,56(a0)
    1cb6:	04053c03          	ld	s8,64(a0)
    1cba:	04853c83          	ld	s9,72(a0)
    1cbe:	05053d03          	ld	s10,80(a0)
    1cc2:	05853d83          	ld	s11,88(a0)
    1cc6:	06053083          	ld	ra,96(a0)
    1cca:	06853103          	ld	sp,104(a0)
    1cce:	c199                	beqz	a1,1cd4 <longjmp_1>
    1cd0:	852e                	mv	a0,a1
    1cd2:	8082                	ret

0000000000001cd4 <longjmp_1>:
    1cd4:	4505                	li	a0,1
    1cd6:	8082                	ret

0000000000001cd8 <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
    1cd8:	7179                	addi	sp,sp,-48
    1cda:	f422                	sd	s0,40(sp)
    1cdc:	1800                	addi	s0,sp,48
    1cde:	fea43423          	sd	a0,-24(s0)
    1ce2:	feb43023          	sd	a1,-32(s0)
    1ce6:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
    1cea:	fd843783          	ld	a5,-40(s0)
    1cee:	fe843703          	ld	a4,-24(s0)
    1cf2:	e798                	sd	a4,8(a5)
     new_entry->next = next;
    1cf4:	fe843783          	ld	a5,-24(s0)
    1cf8:	fd843703          	ld	a4,-40(s0)
    1cfc:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
    1cfe:	fe843783          	ld	a5,-24(s0)
    1d02:	fe043703          	ld	a4,-32(s0)
    1d06:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
    1d08:	fe043783          	ld	a5,-32(s0)
    1d0c:	fe843703          	ld	a4,-24(s0)
    1d10:	e398                	sd	a4,0(a5)
 }
    1d12:	0001                	nop
    1d14:	7422                	ld	s0,40(sp)
    1d16:	6145                	addi	sp,sp,48
    1d18:	8082                	ret

0000000000001d1a <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
    1d1a:	1101                	addi	sp,sp,-32
    1d1c:	ec06                	sd	ra,24(sp)
    1d1e:	e822                	sd	s0,16(sp)
    1d20:	1000                	addi	s0,sp,32
    1d22:	fea43423          	sd	a0,-24(s0)
    1d26:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
    1d2a:	fe043783          	ld	a5,-32(s0)
    1d2e:	679c                	ld	a5,8(a5)
    1d30:	fe043603          	ld	a2,-32(s0)
    1d34:	85be                	mv	a1,a5
    1d36:	fe843503          	ld	a0,-24(s0)
    1d3a:	00000097          	auipc	ra,0x0
    1d3e:	f9e080e7          	jalr	-98(ra) # 1cd8 <__list_add>
 }
    1d42:	0001                	nop
    1d44:	60e2                	ld	ra,24(sp)
    1d46:	6442                	ld	s0,16(sp)
    1d48:	6105                	addi	sp,sp,32
    1d4a:	8082                	ret

0000000000001d4c <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
    1d4c:	1101                	addi	sp,sp,-32
    1d4e:	ec22                	sd	s0,24(sp)
    1d50:	1000                	addi	s0,sp,32
    1d52:	fea43423          	sd	a0,-24(s0)
    1d56:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
    1d5a:	fe043783          	ld	a5,-32(s0)
    1d5e:	fe843703          	ld	a4,-24(s0)
    1d62:	e798                	sd	a4,8(a5)
     prev->next = next;
    1d64:	fe843783          	ld	a5,-24(s0)
    1d68:	fe043703          	ld	a4,-32(s0)
    1d6c:	e398                	sd	a4,0(a5)
 }
    1d6e:	0001                	nop
    1d70:	6462                	ld	s0,24(sp)
    1d72:	6105                	addi	sp,sp,32
    1d74:	8082                	ret

0000000000001d76 <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
    1d76:	1101                	addi	sp,sp,-32
    1d78:	ec06                	sd	ra,24(sp)
    1d7a:	e822                	sd	s0,16(sp)
    1d7c:	1000                	addi	s0,sp,32
    1d7e:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
    1d82:	fe843783          	ld	a5,-24(s0)
    1d86:	6798                	ld	a4,8(a5)
    1d88:	fe843783          	ld	a5,-24(s0)
    1d8c:	639c                	ld	a5,0(a5)
    1d8e:	85be                	mv	a1,a5
    1d90:	853a                	mv	a0,a4
    1d92:	00000097          	auipc	ra,0x0
    1d96:	fba080e7          	jalr	-70(ra) # 1d4c <__list_del>
     entry->next = LIST_POISON1;
    1d9a:	fe843783          	ld	a5,-24(s0)
    1d9e:	00100737          	lui	a4,0x100
    1da2:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfc648>
    1da6:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
    1da8:	fe843783          	ld	a5,-24(s0)
    1dac:	00200737          	lui	a4,0x200
    1db0:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fc748>
    1db4:	e798                	sd	a4,8(a5)
 }
    1db6:	0001                	nop
    1db8:	60e2                	ld	ra,24(sp)
    1dba:	6442                	ld	s0,16(sp)
    1dbc:	6105                	addi	sp,sp,32
    1dbe:	8082                	ret

0000000000001dc0 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
    1dc0:	1101                	addi	sp,sp,-32
    1dc2:	ec22                	sd	s0,24(sp)
    1dc4:	1000                	addi	s0,sp,32
    1dc6:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
    1dca:	fe843783          	ld	a5,-24(s0)
    1dce:	639c                	ld	a5,0(a5)
    1dd0:	fe843703          	ld	a4,-24(s0)
    1dd4:	40f707b3          	sub	a5,a4,a5
    1dd8:	0017b793          	seqz	a5,a5
    1ddc:	0ff7f793          	andi	a5,a5,255
    1de0:	2781                	sext.w	a5,a5
 }
    1de2:	853e                	mv	a0,a5
    1de4:	6462                	ld	s0,24(sp)
    1de6:	6105                	addi	sp,sp,32
    1de8:	8082                	ret

0000000000001dea <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
    1dea:	715d                	addi	sp,sp,-80
    1dec:	e486                	sd	ra,72(sp)
    1dee:	e0a2                	sd	s0,64(sp)
    1df0:	0880                	addi	s0,sp,80
    1df2:	fca43423          	sd	a0,-56(s0)
    1df6:	fcb43023          	sd	a1,-64(s0)
    1dfa:	85b2                	mv	a1,a2
    1dfc:	8636                	mv	a2,a3
    1dfe:	86ba                	mv	a3,a4
    1e00:	873e                	mv	a4,a5
    1e02:	87ae                	mv	a5,a1
    1e04:	faf42e23          	sw	a5,-68(s0)
    1e08:	87b2                	mv	a5,a2
    1e0a:	faf42c23          	sw	a5,-72(s0)
    1e0e:	87b6                	mv	a5,a3
    1e10:	faf42a23          	sw	a5,-76(s0)
    1e14:	87ba                	mv	a5,a4
    1e16:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
    1e1a:	08000513          	li	a0,128
    1e1e:	00000097          	auipc	ra,0x0
    1e22:	d06080e7          	jalr	-762(ra) # 1b24 <malloc>
    1e26:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
    1e2a:	6505                	lui	a0,0x1
    1e2c:	00000097          	auipc	ra,0x0
    1e30:	cf8080e7          	jalr	-776(ra) # 1b24 <malloc>
    1e34:	87aa                	mv	a5,a0
    1e36:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
    1e3a:	fe043703          	ld	a4,-32(s0)
    1e3e:	6785                	lui	a5,0x1
    1e40:	17c1                	addi	a5,a5,-16
    1e42:	97ba                	add	a5,a5,a4
    1e44:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
    1e48:	fe843783          	ld	a5,-24(s0)
    1e4c:	fc843703          	ld	a4,-56(s0)
    1e50:	e398                	sd	a4,0(a5)
    t->arg = arg;
    1e52:	fe843783          	ld	a5,-24(s0)
    1e56:	fc043703          	ld	a4,-64(s0)
    1e5a:	e798                	sd	a4,8(a5)
    t->ID = _id++;
    1e5c:	00001797          	auipc	a5,0x1
    1e60:	4a878793          	addi	a5,a5,1192 # 3304 <_id.1241>
    1e64:	439c                	lw	a5,0(a5)
    1e66:	0017871b          	addiw	a4,a5,1
    1e6a:	0007069b          	sext.w	a3,a4
    1e6e:	00001717          	auipc	a4,0x1
    1e72:	49670713          	addi	a4,a4,1174 # 3304 <_id.1241>
    1e76:	c314                	sw	a3,0(a4)
    1e78:	fe843703          	ld	a4,-24(s0)
    1e7c:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
    1e7e:	fe843783          	ld	a5,-24(s0)
    1e82:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
    1e86:	fe043703          	ld	a4,-32(s0)
    1e8a:	fe843783          	ld	a5,-24(s0)
    1e8e:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
    1e90:	fd843703          	ld	a4,-40(s0)
    1e94:	fe843783          	ld	a5,-24(s0)
    1e98:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
    1e9a:	fe843783          	ld	a5,-24(s0)
    1e9e:	fb842703          	lw	a4,-72(s0)
    1ea2:	c3f8                	sw	a4,68(a5)
    t->period = period;
    1ea4:	fe843783          	ld	a5,-24(s0)
    1ea8:	fb442703          	lw	a4,-76(s0)
    1eac:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
    1eae:	fe843783          	ld	a5,-24(s0)
    1eb2:	fb442703          	lw	a4,-76(s0)
    1eb6:	c7b8                	sw	a4,72(a5)
    t->n = n;
    1eb8:	fe843783          	ld	a5,-24(s0)
    1ebc:	fb042703          	lw	a4,-80(s0)
    1ec0:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
    1ec2:	fe843783          	ld	a5,-24(s0)
    1ec6:	fbc42703          	lw	a4,-68(s0)
    1eca:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
    1ecc:	fe843783          	ld	a5,-24(s0)
    1ed0:	fb842703          	lw	a4,-72(s0)
    1ed4:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
    1ed6:	fe843783          	ld	a5,-24(s0)
    1eda:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
    1ede:	fe843783          	ld	a5,-24(s0)
    1ee2:	06400713          	li	a4,100
    1ee6:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
    1ee8:	fe843783          	ld	a5,-24(s0)
    1eec:	671d                	lui	a4,0x7
    1eee:	5307071b          	addiw	a4,a4,1328
    1ef2:	d3b8                	sw	a4,96(a5)
    
    return t;
    1ef4:	fe843783          	ld	a5,-24(s0)
}
    1ef8:	853e                	mv	a0,a5
    1efa:	60a6                	ld	ra,72(sp)
    1efc:	6406                	ld	s0,64(sp)
    1efe:	6161                	addi	sp,sp,80
    1f00:	8082                	ret

0000000000001f02 <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
    1f02:	1101                	addi	sp,sp,-32
    1f04:	ec22                	sd	s0,24(sp)
    1f06:	1000                	addi	s0,sp,32
    1f08:	fea43423          	sd	a0,-24(s0)
    1f0c:	87ae                	mv	a5,a1
    1f0e:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
    1f12:	fe843783          	ld	a5,-24(s0)
    1f16:	fe442703          	lw	a4,-28(s0)
    1f1a:	cff8                	sw	a4,92(a5)
}
    1f1c:	0001                	nop
    1f1e:	6462                	ld	s0,24(sp)
    1f20:	6105                	addi	sp,sp,32
    1f22:	8082                	ret

0000000000001f24 <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
    1f24:	1101                	addi	sp,sp,-32
    1f26:	ec22                	sd	s0,24(sp)
    1f28:	1000                	addi	s0,sp,32
    1f2a:	fea43423          	sd	a0,-24(s0)
    1f2e:	87ae                	mv	a5,a1
    1f30:	8732                	mv	a4,a2
    1f32:	fef42223          	sw	a5,-28(s0)
    1f36:	87ba                	mv	a5,a4
    1f38:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
    1f3c:	fe843783          	ld	a5,-24(s0)
    1f40:	fe442703          	lw	a4,-28(s0)
    1f44:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
    1f46:	fe843783          	ld	a5,-24(s0)
    1f4a:	fe442703          	lw	a4,-28(s0)
    1f4e:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
    1f50:	fe843783          	ld	a5,-24(s0)
    1f54:	fe042703          	lw	a4,-32(s0)
    1f58:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
    1f5a:	fe843783          	ld	a5,-24(s0)
    1f5e:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
    1f62:	fe843783          	ld	a5,-24(s0)
    1f66:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
    1f6a:	fe843783          	ld	a5,-24(s0)
    1f6e:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
    1f72:	fe843783          	ld	a5,-24(s0)
    1f76:	0607ae23          	sw	zero,124(a5)
}
    1f7a:	0001                	nop
    1f7c:	6462                	ld	s0,24(sp)
    1f7e:	6105                	addi	sp,sp,32
    1f80:	8082                	ret

0000000000001f82 <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
    1f82:	7179                	addi	sp,sp,-48
    1f84:	f406                	sd	ra,40(sp)
    1f86:	f022                	sd	s0,32(sp)
    1f88:	1800                	addi	s0,sp,48
    1f8a:	fca43c23          	sd	a0,-40(s0)
    1f8e:	87ae                	mv	a5,a1
    1f90:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
    1f94:	02000513          	li	a0,32
    1f98:	00000097          	auipc	ra,0x0
    1f9c:	b8c080e7          	jalr	-1140(ra) # 1b24 <malloc>
    1fa0:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
    1fa4:	fe843783          	ld	a5,-24(s0)
    1fa8:	fd843703          	ld	a4,-40(s0)
    1fac:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
    1fae:	fe843783          	ld	a5,-24(s0)
    1fb2:	fd442703          	lw	a4,-44(s0)
    1fb6:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
    1fb8:	fd843783          	ld	a5,-40(s0)
    1fbc:	fd442703          	lw	a4,-44(s0)
    1fc0:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
    1fc2:	fd843783          	ld	a5,-40(s0)
    1fc6:	43bc                	lw	a5,64(a5)
    1fc8:	cf81                	beqz	a5,1fe0 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
    1fca:	fd843783          	ld	a5,-40(s0)
    1fce:	47bc                	lw	a5,72(a5)
    1fd0:	fd442703          	lw	a4,-44(s0)
    1fd4:	9fb9                	addw	a5,a5,a4
    1fd6:	0007871b          	sext.w	a4,a5
    1fda:	fd843783          	ld	a5,-40(s0)
    1fde:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
    1fe0:	fe843783          	ld	a5,-24(s0)
    1fe4:	07a1                	addi	a5,a5,8
    1fe6:	00001597          	auipc	a1,0x1
    1fea:	2fa58593          	addi	a1,a1,762 # 32e0 <release_queue>
    1fee:	853e                	mv	a0,a5
    1ff0:	00000097          	auipc	ra,0x0
    1ff4:	d2a080e7          	jalr	-726(ra) # 1d1a <list_add_tail>
}
    1ff8:	0001                	nop
    1ffa:	70a2                	ld	ra,40(sp)
    1ffc:	7402                	ld	s0,32(sp)
    1ffe:	6145                	addi	sp,sp,48
    2000:	8082                	ret

0000000000002002 <__release>:

void __release()
{
    2002:	7139                	addi	sp,sp,-64
    2004:	fc06                	sd	ra,56(sp)
    2006:	f822                	sd	s0,48(sp)
    2008:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    200a:	00001797          	auipc	a5,0x1
    200e:	2d678793          	addi	a5,a5,726 # 32e0 <release_queue>
    2012:	639c                	ld	a5,0(a5)
    2014:	fcf43c23          	sd	a5,-40(s0)
    2018:	fd843783          	ld	a5,-40(s0)
    201c:	17e1                	addi	a5,a5,-8
    201e:	fef43423          	sd	a5,-24(s0)
    2022:	fe843783          	ld	a5,-24(s0)
    2026:	679c                	ld	a5,8(a5)
    2028:	fcf43823          	sd	a5,-48(s0)
    202c:	fd043783          	ld	a5,-48(s0)
    2030:	17e1                	addi	a5,a5,-8
    2032:	fef43023          	sd	a5,-32(s0)
    2036:	a0e9                	j	2100 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
    2038:	fe843783          	ld	a5,-24(s0)
    203c:	4f98                	lw	a4,24(a5)
    203e:	00001797          	auipc	a5,0x1
    2042:	35a78793          	addi	a5,a5,858 # 3398 <threading_system_time>
    2046:	439c                	lw	a5,0(a5)
    2048:	08e7ce63          	blt	a5,a4,20e4 <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
    204c:	fe843783          	ld	a5,-24(s0)
    2050:	639c                	ld	a5,0(a5)
    2052:	5bbc                	lw	a5,112(a5)
    2054:	c79d                	beqz	a5,2082 <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
    2056:	fe843783          	ld	a5,-24(s0)
    205a:	639c                	ld	a5,0(a5)
    205c:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
    2060:	fe843783          	ld	a5,-24(s0)
    2064:	6398                	ld	a4,0(a5)
    2066:	fe843783          	ld	a5,-24(s0)
    206a:	639c                	ld	a5,0(a5)
    206c:	5378                	lw	a4,100(a4)
    206e:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
    2070:	fe843783          	ld	a5,-24(s0)
    2074:	6398                	ld	a4,0(a5)
    2076:	fe843783          	ld	a5,-24(s0)
    207a:	639c                	ld	a5,0(a5)
    207c:	5f78                	lw	a4,124(a4)
    207e:	cbf8                	sw	a4,84(a5)
    2080:	a809                	j	2092 <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
    2082:	fe843783          	ld	a5,-24(s0)
    2086:	6398                	ld	a4,0(a5)
    2088:	fe843783          	ld	a5,-24(s0)
    208c:	639c                	ld	a5,0(a5)
    208e:	4378                	lw	a4,68(a4)
    2090:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
    2092:	fe843783          	ld	a5,-24(s0)
    2096:	4f94                	lw	a3,24(a5)
    2098:	fe843783          	ld	a5,-24(s0)
    209c:	639c                	ld	a5,0(a5)
    209e:	47b8                	lw	a4,72(a5)
    20a0:	fe843783          	ld	a5,-24(s0)
    20a4:	639c                	ld	a5,0(a5)
    20a6:	9f35                	addw	a4,a4,a3
    20a8:	2701                	sext.w	a4,a4
    20aa:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
    20ac:	fe843783          	ld	a5,-24(s0)
    20b0:	639c                	ld	a5,0(a5)
    20b2:	02878793          	addi	a5,a5,40
    20b6:	00001597          	auipc	a1,0x1
    20ba:	21a58593          	addi	a1,a1,538 # 32d0 <run_queue>
    20be:	853e                	mv	a0,a5
    20c0:	00000097          	auipc	ra,0x0
    20c4:	c5a080e7          	jalr	-934(ra) # 1d1a <list_add_tail>
            list_del(&cur->thread_list);
    20c8:	fe843783          	ld	a5,-24(s0)
    20cc:	07a1                	addi	a5,a5,8
    20ce:	853e                	mv	a0,a5
    20d0:	00000097          	auipc	ra,0x0
    20d4:	ca6080e7          	jalr	-858(ra) # 1d76 <list_del>
            free(cur);
    20d8:	fe843503          	ld	a0,-24(s0)
    20dc:	00000097          	auipc	ra,0x0
    20e0:	8a6080e7          	jalr	-1882(ra) # 1982 <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
    20e4:	fe043783          	ld	a5,-32(s0)
    20e8:	fef43423          	sd	a5,-24(s0)
    20ec:	fe043783          	ld	a5,-32(s0)
    20f0:	679c                	ld	a5,8(a5)
    20f2:	fcf43423          	sd	a5,-56(s0)
    20f6:	fc843783          	ld	a5,-56(s0)
    20fa:	17e1                	addi	a5,a5,-8
    20fc:	fef43023          	sd	a5,-32(s0)
    2100:	fe843783          	ld	a5,-24(s0)
    2104:	00878713          	addi	a4,a5,8
    2108:	00001797          	auipc	a5,0x1
    210c:	1d878793          	addi	a5,a5,472 # 32e0 <release_queue>
    2110:	f2f714e3          	bne	a4,a5,2038 <__release+0x36>
        }
    }
}
    2114:	0001                	nop
    2116:	0001                	nop
    2118:	70e2                	ld	ra,56(sp)
    211a:	7442                	ld	s0,48(sp)
    211c:	6121                	addi	sp,sp,64
    211e:	8082                	ret

0000000000002120 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
    2120:	1101                	addi	sp,sp,-32
    2122:	ec06                	sd	ra,24(sp)
    2124:	e822                	sd	s0,16(sp)
    2126:	1000                	addi	s0,sp,32
    2128:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
    212c:	fe843783          	ld	a5,-24(s0)
    2130:	7b98                	ld	a4,48(a5)
    2132:	00001797          	auipc	a5,0x1
    2136:	25e78793          	addi	a5,a5,606 # 3390 <current>
    213a:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
    213c:	fe843783          	ld	a5,-24(s0)
    2140:	02878793          	addi	a5,a5,40
    2144:	853e                	mv	a0,a5
    2146:	00000097          	auipc	ra,0x0
    214a:	c30080e7          	jalr	-976(ra) # 1d76 <list_del>

    free(to_remove->stack);
    214e:	fe843783          	ld	a5,-24(s0)
    2152:	6b9c                	ld	a5,16(a5)
    2154:	853e                	mv	a0,a5
    2156:	00000097          	auipc	ra,0x0
    215a:	82c080e7          	jalr	-2004(ra) # 1982 <free>
    free(to_remove);
    215e:	fe843503          	ld	a0,-24(s0)
    2162:	00000097          	auipc	ra,0x0
    2166:	820080e7          	jalr	-2016(ra) # 1982 <free>

    __schedule();
    216a:	00000097          	auipc	ra,0x0
    216e:	5e8080e7          	jalr	1512(ra) # 2752 <__schedule>
    __dispatch();
    2172:	00000097          	auipc	ra,0x0
    2176:	416080e7          	jalr	1046(ra) # 2588 <__dispatch>
    thrdresume(main_thrd_id);
    217a:	00001797          	auipc	a5,0x1
    217e:	18678793          	addi	a5,a5,390 # 3300 <main_thrd_id>
    2182:	439c                	lw	a5,0(a5)
    2184:	853e                	mv	a0,a5
    2186:	fffff097          	auipc	ra,0xfffff
    218a:	30e080e7          	jalr	782(ra) # 1494 <thrdresume>
}
    218e:	0001                	nop
    2190:	60e2                	ld	ra,24(sp)
    2192:	6442                	ld	s0,16(sp)
    2194:	6105                	addi	sp,sp,32
    2196:	8082                	ret

0000000000002198 <thread_exit>:

void thread_exit(void)
{
    2198:	7179                	addi	sp,sp,-48
    219a:	f406                	sd	ra,40(sp)
    219c:	f022                	sd	s0,32(sp)
    219e:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    21a0:	00001797          	auipc	a5,0x1
    21a4:	1f078793          	addi	a5,a5,496 # 3390 <current>
    21a8:	6398                	ld	a4,0(a5)
    21aa:	00001797          	auipc	a5,0x1
    21ae:	12678793          	addi	a5,a5,294 # 32d0 <run_queue>
    21b2:	02f71063          	bne	a4,a5,21d2 <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
    21b6:	00001597          	auipc	a1,0x1
    21ba:	e8a58593          	addi	a1,a1,-374 # 3040 <schedule_edf_cbs+0x618>
    21be:	4509                	li	a0,2
    21c0:	fffff097          	auipc	ra,0xfffff
    21c4:	71a080e7          	jalr	1818(ra) # 18da <fprintf>
        exit(1);
    21c8:	4505                	li	a0,1
    21ca:	fffff097          	auipc	ra,0xfffff
    21ce:	222080e7          	jalr	546(ra) # 13ec <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
    21d2:	00001797          	auipc	a5,0x1
    21d6:	1be78793          	addi	a5,a5,446 # 3390 <current>
    21da:	639c                	ld	a5,0(a5)
    21dc:	fef43423          	sd	a5,-24(s0)
    21e0:	fe843783          	ld	a5,-24(s0)
    21e4:	fd878793          	addi	a5,a5,-40
    21e8:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
    21ec:	fe043783          	ld	a5,-32(s0)
    21f0:	5f9c                	lw	a5,56(a5)
    21f2:	4585                	li	a1,1
    21f4:	853e                	mv	a0,a5
    21f6:	fffff097          	auipc	ra,0xfffff
    21fa:	2a6080e7          	jalr	678(ra) # 149c <cancelthrdstop>
    21fe:	87aa                	mv	a5,a0
    2200:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
    2204:	00001797          	auipc	a5,0x1
    2208:	19478793          	addi	a5,a5,404 # 3398 <threading_system_time>
    220c:	439c                	lw	a5,0(a5)
    220e:	fdc42703          	lw	a4,-36(s0)
    2212:	9fb9                	addw	a5,a5,a4
    2214:	0007871b          	sext.w	a4,a5
    2218:	00001797          	auipc	a5,0x1
    221c:	18078793          	addi	a5,a5,384 # 3398 <threading_system_time>
    2220:	c398                	sw	a4,0(a5)

    __release();
    2222:	00000097          	auipc	ra,0x0
    2226:	de0080e7          	jalr	-544(ra) # 2002 <__release>
    __thread_exit(to_remove);
    222a:	fe043503          	ld	a0,-32(s0)
    222e:	00000097          	auipc	ra,0x0
    2232:	ef2080e7          	jalr	-270(ra) # 2120 <__thread_exit>
}
    2236:	0001                	nop
    2238:	70a2                	ld	ra,40(sp)
    223a:	7402                	ld	s0,32(sp)
    223c:	6145                	addi	sp,sp,48
    223e:	8082                	ret

0000000000002240 <__finish_current>:

void __finish_current()
{
    2240:	7179                	addi	sp,sp,-48
    2242:	f406                	sd	ra,40(sp)
    2244:	f022                	sd	s0,32(sp)
    2246:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    2248:	00001797          	auipc	a5,0x1
    224c:	14878793          	addi	a5,a5,328 # 3390 <current>
    2250:	639c                	ld	a5,0(a5)
    2252:	fef43423          	sd	a5,-24(s0)
    2256:	fe843783          	ld	a5,-24(s0)
    225a:	fd878793          	addi	a5,a5,-40
    225e:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    2262:	fe043783          	ld	a5,-32(s0)
    2266:	4bbc                	lw	a5,80(a5)
    2268:	37fd                	addiw	a5,a5,-1
    226a:	0007871b          	sext.w	a4,a5
    226e:	fe043783          	ld	a5,-32(s0)
    2272:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
    2274:	fe043783          	ld	a5,-32(s0)
    2278:	5fd8                	lw	a4,60(a5)
    227a:	00001797          	auipc	a5,0x1
    227e:	11e78793          	addi	a5,a5,286 # 3398 <threading_system_time>
    2282:	4390                	lw	a2,0(a5)
    2284:	fe043783          	ld	a5,-32(s0)
    2288:	4bbc                	lw	a5,80(a5)
    228a:	86be                	mv	a3,a5
    228c:	85ba                	mv	a1,a4
    228e:	00001517          	auipc	a0,0x1
    2292:	dea50513          	addi	a0,a0,-534 # 3078 <schedule_edf_cbs+0x650>
    2296:	fffff097          	auipc	ra,0xfffff
    229a:	69c080e7          	jalr	1692(ra) # 1932 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    229e:	fe043783          	ld	a5,-32(s0)
    22a2:	4bbc                	lw	a5,80(a5)
    22a4:	04f05563          	blez	a5,22ee <__finish_current+0xae>
        struct list_head *to_remove = current;
    22a8:	00001797          	auipc	a5,0x1
    22ac:	0e878793          	addi	a5,a5,232 # 3390 <current>
    22b0:	639c                	ld	a5,0(a5)
    22b2:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    22b6:	00001797          	auipc	a5,0x1
    22ba:	0da78793          	addi	a5,a5,218 # 3390 <current>
    22be:	639c                	ld	a5,0(a5)
    22c0:	6798                	ld	a4,8(a5)
    22c2:	00001797          	auipc	a5,0x1
    22c6:	0ce78793          	addi	a5,a5,206 # 3390 <current>
    22ca:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    22cc:	fd843503          	ld	a0,-40(s0)
    22d0:	00000097          	auipc	ra,0x0
    22d4:	aa6080e7          	jalr	-1370(ra) # 1d76 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    22d8:	fe043783          	ld	a5,-32(s0)
    22dc:	4fbc                	lw	a5,88(a5)
    22de:	85be                	mv	a1,a5
    22e0:	fe043503          	ld	a0,-32(s0)
    22e4:	00000097          	auipc	ra,0x0
    22e8:	c9e080e7          	jalr	-866(ra) # 1f82 <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
    22ec:	a039                	j	22fa <__finish_current+0xba>
        __thread_exit(current_thread);
    22ee:	fe043503          	ld	a0,-32(s0)
    22f2:	00000097          	auipc	ra,0x0
    22f6:	e2e080e7          	jalr	-466(ra) # 2120 <__thread_exit>
}
    22fa:	0001                	nop
    22fc:	70a2                	ld	ra,40(sp)
    22fe:	7402                	ld	s0,32(sp)
    2300:	6145                	addi	sp,sp,48
    2302:	8082                	ret

0000000000002304 <__rt_finish_current>:
void __rt_finish_current()
{
    2304:	7179                	addi	sp,sp,-48
    2306:	f406                	sd	ra,40(sp)
    2308:	f022                	sd	s0,32(sp)
    230a:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    230c:	00001797          	auipc	a5,0x1
    2310:	08478793          	addi	a5,a5,132 # 3390 <current>
    2314:	639c                	ld	a5,0(a5)
    2316:	fef43423          	sd	a5,-24(s0)
    231a:	fe843783          	ld	a5,-24(s0)
    231e:	fd878793          	addi	a5,a5,-40
    2322:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
    2326:	fe043783          	ld	a5,-32(s0)
    232a:	4bbc                	lw	a5,80(a5)
    232c:	37fd                	addiw	a5,a5,-1
    232e:	0007871b          	sext.w	a4,a5
    2332:	fe043783          	ld	a5,-32(s0)
    2336:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
    2338:	fe043783          	ld	a5,-32(s0)
    233c:	5fd8                	lw	a4,60(a5)
    233e:	00001797          	auipc	a5,0x1
    2342:	05a78793          	addi	a5,a5,90 # 3398 <threading_system_time>
    2346:	4390                	lw	a2,0(a5)
    2348:	fe043783          	ld	a5,-32(s0)
    234c:	4bbc                	lw	a5,80(a5)
    234e:	86be                	mv	a3,a5
    2350:	85ba                	mv	a1,a4
    2352:	00001517          	auipc	a0,0x1
    2356:	d3e50513          	addi	a0,a0,-706 # 3090 <schedule_edf_cbs+0x668>
    235a:	fffff097          	auipc	ra,0xfffff
    235e:	5d8080e7          	jalr	1496(ra) # 1932 <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
    2362:	fe043783          	ld	a5,-32(s0)
    2366:	4bbc                	lw	a5,80(a5)
    2368:	04f05f63          	blez	a5,23c6 <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
    236c:	00001797          	auipc	a5,0x1
    2370:	02478793          	addi	a5,a5,36 # 3390 <current>
    2374:	639c                	ld	a5,0(a5)
    2376:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
    237a:	00001797          	auipc	a5,0x1
    237e:	01678793          	addi	a5,a5,22 # 3390 <current>
    2382:	639c                	ld	a5,0(a5)
    2384:	6798                	ld	a4,8(a5)
    2386:	00001797          	auipc	a5,0x1
    238a:	00a78793          	addi	a5,a5,10 # 3390 <current>
    238e:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    2390:	fd843503          	ld	a0,-40(s0)
    2394:	00000097          	auipc	ra,0x0
    2398:	9e2080e7          	jalr	-1566(ra) # 1d76 <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
    239c:	fe043783          	ld	a5,-32(s0)
    23a0:	4fbc                	lw	a5,88(a5)
    23a2:	85be                	mv	a1,a5
    23a4:	fe043503          	ld	a0,-32(s0)
    23a8:	00000097          	auipc	ra,0x0
    23ac:	bda080e7          	jalr	-1062(ra) # 1f82 <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
    23b0:	fe043783          	ld	a5,-32(s0)
    23b4:	57fc                	lw	a5,108(a5)
    23b6:	ef91                	bnez	a5,23d2 <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
    23b8:	fe043783          	ld	a5,-32(s0)
    23bc:	53f8                	lw	a4,100(a5)
    23be:	fe043783          	ld	a5,-32(s0)
    23c2:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
    23c4:	a039                	j	23d2 <__rt_finish_current+0xce>
        __thread_exit(current_thread);
    23c6:	fe043503          	ld	a0,-32(s0)
    23ca:	00000097          	auipc	ra,0x0
    23ce:	d56080e7          	jalr	-682(ra) # 2120 <__thread_exit>
}
    23d2:	0001                	nop
    23d4:	70a2                	ld	ra,40(sp)
    23d6:	7402                	ld	s0,32(sp)
    23d8:	6145                	addi	sp,sp,48
    23da:	8082                	ret

00000000000023dc <switch_handler>:

void switch_handler(void *arg)
{
    23dc:	7139                	addi	sp,sp,-64
    23de:	fc06                	sd	ra,56(sp)
    23e0:	f822                	sd	s0,48(sp)
    23e2:	0080                	addi	s0,sp,64
    23e4:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
    23e8:	fc843783          	ld	a5,-56(s0)
    23ec:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    23f0:	00001797          	auipc	a5,0x1
    23f4:	fa078793          	addi	a5,a5,-96 # 3390 <current>
    23f8:	639c                	ld	a5,0(a5)
    23fa:	fef43023          	sd	a5,-32(s0)
    23fe:	fe043783          	ld	a5,-32(s0)
    2402:	fd878793          	addi	a5,a5,-40
    2406:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
    240a:	fe843783          	ld	a5,-24(s0)
    240e:	0007871b          	sext.w	a4,a5
    2412:	00001797          	auipc	a5,0x1
    2416:	f8678793          	addi	a5,a5,-122 # 3398 <threading_system_time>
    241a:	439c                	lw	a5,0(a5)
    241c:	2781                	sext.w	a5,a5
    241e:	9fb9                	addw	a5,a5,a4
    2420:	2781                	sext.w	a5,a5
    2422:	0007871b          	sext.w	a4,a5
    2426:	00001797          	auipc	a5,0x1
    242a:	f7278793          	addi	a5,a5,-142 # 3398 <threading_system_time>
    242e:	c398                	sw	a4,0(a5)
     __release();
    2430:	00000097          	auipc	ra,0x0
    2434:	bd2080e7          	jalr	-1070(ra) # 2002 <__release>
    current_thread->remaining_time -= elapsed_time;
    2438:	fd843783          	ld	a5,-40(s0)
    243c:	4bfc                	lw	a5,84(a5)
    243e:	0007871b          	sext.w	a4,a5
    2442:	fe843783          	ld	a5,-24(s0)
    2446:	2781                	sext.w	a5,a5
    2448:	40f707bb          	subw	a5,a4,a5
    244c:	2781                	sext.w	a5,a5
    244e:	0007871b          	sext.w	a4,a5
    2452:	fd843783          	ld	a5,-40(s0)
    2456:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
    2458:	fd843783          	ld	a5,-40(s0)
    245c:	57fc                	lw	a5,108(a5)
    245e:	e38d                	bnez	a5,2480 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
    2460:	fd843783          	ld	a5,-40(s0)
    2464:	57bc                	lw	a5,104(a5)
    2466:	0007871b          	sext.w	a4,a5
    246a:	fe843783          	ld	a5,-24(s0)
    246e:	2781                	sext.w	a5,a5
    2470:	40f707bb          	subw	a5,a4,a5
    2474:	2781                	sext.w	a5,a5
    2476:	0007871b          	sext.w	a4,a5
    247a:	fd843783          	ld	a5,-40(s0)
    247e:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
    2480:	fd843783          	ld	a5,-40(s0)
    2484:	43bc                	lw	a5,64(a5)
    2486:	c3ad                	beqz	a5,24e8 <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
    2488:	fd843783          	ld	a5,-40(s0)
    248c:	4fb8                	lw	a4,88(a5)
    248e:	00001797          	auipc	a5,0x1
    2492:	f0a78793          	addi	a5,a5,-246 # 3398 <threading_system_time>
    2496:	439c                	lw	a5,0(a5)
    2498:	02f74163          	blt	a4,a5,24ba <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    249c:	fd843783          	ld	a5,-40(s0)
    24a0:	4fb8                	lw	a4,88(a5)
    24a2:	00001797          	auipc	a5,0x1
    24a6:	ef678793          	addi	a5,a5,-266 # 3398 <threading_system_time>
    24aa:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
    24ac:	02f71e63          	bne	a4,a5,24e8 <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
    24b0:	fd843783          	ld	a5,-40(s0)
    24b4:	4bfc                	lw	a5,84(a5)
    24b6:	02f05963          	blez	a5,24e8 <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
    24ba:	fd843783          	ld	a5,-40(s0)
    24be:	5fd8                	lw	a4,60(a5)
    24c0:	00001797          	auipc	a5,0x1
    24c4:	ed878793          	addi	a5,a5,-296 # 3398 <threading_system_time>
    24c8:	439c                	lw	a5,0(a5)
    24ca:	863e                	mv	a2,a5
    24cc:	85ba                	mv	a1,a4
    24ce:	00001517          	auipc	a0,0x1
    24d2:	bfa50513          	addi	a0,a0,-1030 # 30c8 <schedule_edf_cbs+0x6a0>
    24d6:	fffff097          	auipc	ra,0xfffff
    24da:	45c080e7          	jalr	1116(ra) # 1932 <printf>
            exit(0);
    24de:	4501                	li	a0,0
    24e0:	fffff097          	auipc	ra,0xfffff
    24e4:	f0c080e7          	jalr	-244(ra) # 13ec <exit>
        }

    if (current_thread->remaining_time <= 0) {
    24e8:	fd843783          	ld	a5,-40(s0)
    24ec:	4bfc                	lw	a5,84(a5)
    24ee:	02f04063          	bgtz	a5,250e <switch_handler+0x132>
        if (current_thread->is_real_time)
    24f2:	fd843783          	ld	a5,-40(s0)
    24f6:	43bc                	lw	a5,64(a5)
    24f8:	c791                	beqz	a5,2504 <switch_handler+0x128>
            __rt_finish_current();
    24fa:	00000097          	auipc	ra,0x0
    24fe:	e0a080e7          	jalr	-502(ra) # 2304 <__rt_finish_current>
    2502:	a881                	j	2552 <switch_handler+0x176>
        else
            __finish_current();
    2504:	00000097          	auipc	ra,0x0
    2508:	d3c080e7          	jalr	-708(ra) # 2240 <__finish_current>
    250c:	a099                	j	2552 <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
    250e:	00001797          	auipc	a5,0x1
    2512:	e8278793          	addi	a5,a5,-382 # 3390 <current>
    2516:	639c                	ld	a5,0(a5)
    2518:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
    251c:	00001797          	auipc	a5,0x1
    2520:	e7478793          	addi	a5,a5,-396 # 3390 <current>
    2524:	639c                	ld	a5,0(a5)
    2526:	6798                	ld	a4,8(a5)
    2528:	00001797          	auipc	a5,0x1
    252c:	e6878793          	addi	a5,a5,-408 # 3390 <current>
    2530:	e398                	sd	a4,0(a5)
        list_del(to_remove);
    2532:	fd043503          	ld	a0,-48(s0)
    2536:	00000097          	auipc	ra,0x0
    253a:	840080e7          	jalr	-1984(ra) # 1d76 <list_del>
        list_add_tail(to_remove, &run_queue);
    253e:	00001597          	auipc	a1,0x1
    2542:	d9258593          	addi	a1,a1,-622 # 32d0 <run_queue>
    2546:	fd043503          	ld	a0,-48(s0)
    254a:	fffff097          	auipc	ra,0xfffff
    254e:	7d0080e7          	jalr	2000(ra) # 1d1a <list_add_tail>
    }

    __release();
    2552:	00000097          	auipc	ra,0x0
    2556:	ab0080e7          	jalr	-1360(ra) # 2002 <__release>
    __schedule();
    255a:	00000097          	auipc	ra,0x0
    255e:	1f8080e7          	jalr	504(ra) # 2752 <__schedule>
    __dispatch();
    2562:	00000097          	auipc	ra,0x0
    2566:	026080e7          	jalr	38(ra) # 2588 <__dispatch>
    thrdresume(main_thrd_id);
    256a:	00001797          	auipc	a5,0x1
    256e:	d9678793          	addi	a5,a5,-618 # 3300 <main_thrd_id>
    2572:	439c                	lw	a5,0(a5)
    2574:	853e                	mv	a0,a5
    2576:	fffff097          	auipc	ra,0xfffff
    257a:	f1e080e7          	jalr	-226(ra) # 1494 <thrdresume>
}
    257e:	0001                	nop
    2580:	70e2                	ld	ra,56(sp)
    2582:	7442                	ld	s0,48(sp)
    2584:	6121                	addi	sp,sp,64
    2586:	8082                	ret

0000000000002588 <__dispatch>:

void __dispatch()
{
    2588:	7179                	addi	sp,sp,-48
    258a:	f406                	sd	ra,40(sp)
    258c:	f022                	sd	s0,32(sp)
    258e:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
    2590:	00001797          	auipc	a5,0x1
    2594:	e0078793          	addi	a5,a5,-512 # 3390 <current>
    2598:	6398                	ld	a4,0(a5)
    259a:	00001797          	auipc	a5,0x1
    259e:	d3678793          	addi	a5,a5,-714 # 32d0 <run_queue>
    25a2:	1af70363          	beq	a4,a5,2748 <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
    25a6:	00001797          	auipc	a5,0x1
    25aa:	dea78793          	addi	a5,a5,-534 # 3390 <current>
    25ae:	639c                	ld	a5,0(a5)
    25b0:	fef43423          	sd	a5,-24(s0)
    25b4:	fe843783          	ld	a5,-24(s0)
    25b8:	fd878793          	addi	a5,a5,-40
    25bc:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
    25c0:	fe043783          	ld	a5,-32(s0)
    25c4:	5fcc                	lw	a1,60(a5)
    25c6:	00001797          	auipc	a5,0x1
    25ca:	dd278793          	addi	a5,a5,-558 # 3398 <threading_system_time>
    25ce:	4390                	lw	a2,0(a5)
    25d0:	00001797          	auipc	a5,0x1
    25d4:	dd078793          	addi	a5,a5,-560 # 33a0 <allocated_time>
    25d8:	6394                	ld	a3,0(a5)
    25da:	fe043783          	ld	a5,-32(s0)
    25de:	4bfc                	lw	a5,84(a5)
    25e0:	873e                	mv	a4,a5
    25e2:	00001517          	auipc	a0,0x1
    25e6:	b1650513          	addi	a0,a0,-1258 # 30f8 <schedule_edf_cbs+0x6d0>
    25ea:	fffff097          	auipc	ra,0xfffff
    25ee:	348080e7          	jalr	840(ra) # 1932 <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
    25f2:	fe043783          	ld	a5,-32(s0)
    25f6:	43bc                	lw	a5,64(a5)
    25f8:	c3a1                	beqz	a5,2638 <__dispatch+0xb0>
    25fa:	00001797          	auipc	a5,0x1
    25fe:	da678793          	addi	a5,a5,-602 # 33a0 <allocated_time>
    2602:	639c                	ld	a5,0(a5)
    2604:	eb95                	bnez	a5,2638 <__dispatch+0xb0>
    2606:	fe043783          	ld	a5,-32(s0)
    260a:	57fc                	lw	a5,108(a5)
    260c:	c795                	beqz	a5,2638 <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
    260e:	fe043783          	ld	a5,-32(s0)
    2612:	5fd8                	lw	a4,60(a5)
    2614:	fe043783          	ld	a5,-32(s0)
    2618:	4fbc                	lw	a5,88(a5)
    261a:	863e                	mv	a2,a5
    261c:	85ba                	mv	a1,a4
    261e:	00001517          	auipc	a0,0x1
    2622:	b2a50513          	addi	a0,a0,-1238 # 3148 <schedule_edf_cbs+0x720>
    2626:	fffff097          	auipc	ra,0xfffff
    262a:	30c080e7          	jalr	780(ra) # 1932 <printf>
        exit(0);
    262e:	4501                	li	a0,0
    2630:	fffff097          	auipc	ra,0xfffff
    2634:	dbc080e7          	jalr	-580(ra) # 13ec <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
    2638:	fe043783          	ld	a5,-32(s0)
    263c:	5fd8                	lw	a4,60(a5)
    263e:	00001797          	auipc	a5,0x1
    2642:	d5a78793          	addi	a5,a5,-678 # 3398 <threading_system_time>
    2646:	4390                	lw	a2,0(a5)
    2648:	00001797          	auipc	a5,0x1
    264c:	d5878793          	addi	a5,a5,-680 # 33a0 <allocated_time>
    2650:	639c                	ld	a5,0(a5)
    2652:	86be                	mv	a3,a5
    2654:	85ba                	mv	a1,a4
    2656:	00001517          	auipc	a0,0x1
    265a:	b2250513          	addi	a0,a0,-1246 # 3178 <schedule_edf_cbs+0x750>
    265e:	fffff097          	auipc	ra,0xfffff
    2662:	2d4080e7          	jalr	724(ra) # 1932 <printf>

    if (current_thread->buf_set) {
    2666:	fe043783          	ld	a5,-32(s0)
    266a:	539c                	lw	a5,32(a5)
    266c:	c7a1                	beqz	a5,26b4 <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    266e:	00001797          	auipc	a5,0x1
    2672:	d3278793          	addi	a5,a5,-718 # 33a0 <allocated_time>
    2676:	639c                	ld	a5,0(a5)
    2678:	0007871b          	sext.w	a4,a5
    267c:	fe043783          	ld	a5,-32(s0)
    2680:	03878593          	addi	a1,a5,56
    2684:	00001797          	auipc	a5,0x1
    2688:	d1c78793          	addi	a5,a5,-740 # 33a0 <allocated_time>
    268c:	639c                	ld	a5,0(a5)
    268e:	86be                	mv	a3,a5
    2690:	00000617          	auipc	a2,0x0
    2694:	d4c60613          	addi	a2,a2,-692 # 23dc <switch_handler>
    2698:	853a                	mv	a0,a4
    269a:	fffff097          	auipc	ra,0xfffff
    269e:	df2080e7          	jalr	-526(ra) # 148c <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
    26a2:	fe043783          	ld	a5,-32(s0)
    26a6:	5f9c                	lw	a5,56(a5)
    26a8:	853e                	mv	a0,a5
    26aa:	fffff097          	auipc	ra,0xfffff
    26ae:	dea080e7          	jalr	-534(ra) # 1494 <thrdresume>
    26b2:	a071                	j	273e <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
    26b4:	fe043783          	ld	a5,-32(s0)
    26b8:	4705                	li	a4,1
    26ba:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
    26bc:	fe043783          	ld	a5,-32(s0)
    26c0:	6f9c                	ld	a5,24(a5)
    26c2:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
    26c6:	fe043783          	ld	a5,-32(s0)
    26ca:	577d                	li	a4,-1
    26cc:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
    26ce:	00001797          	auipc	a5,0x1
    26d2:	cd278793          	addi	a5,a5,-814 # 33a0 <allocated_time>
    26d6:	639c                	ld	a5,0(a5)
    26d8:	0007871b          	sext.w	a4,a5
    26dc:	fe043783          	ld	a5,-32(s0)
    26e0:	03878593          	addi	a1,a5,56
    26e4:	00001797          	auipc	a5,0x1
    26e8:	cbc78793          	addi	a5,a5,-836 # 33a0 <allocated_time>
    26ec:	639c                	ld	a5,0(a5)
    26ee:	86be                	mv	a3,a5
    26f0:	00000617          	auipc	a2,0x0
    26f4:	cec60613          	addi	a2,a2,-788 # 23dc <switch_handler>
    26f8:	853a                	mv	a0,a4
    26fa:	fffff097          	auipc	ra,0xfffff
    26fe:	d92080e7          	jalr	-622(ra) # 148c <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
    2702:	fe043783          	ld	a5,-32(s0)
    2706:	5f9c                	lw	a5,56(a5)
    2708:	0207d063          	bgez	a5,2728 <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
    270c:	00001597          	auipc	a1,0x1
    2710:	a9c58593          	addi	a1,a1,-1380 # 31a8 <schedule_edf_cbs+0x780>
    2714:	4509                	li	a0,2
    2716:	fffff097          	auipc	ra,0xfffff
    271a:	1c4080e7          	jalr	452(ra) # 18da <fprintf>
            exit(1);
    271e:	4505                	li	a0,1
    2720:	fffff097          	auipc	ra,0xfffff
    2724:	ccc080e7          	jalr	-820(ra) # 13ec <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
    2728:	fd843783          	ld	a5,-40(s0)
    272c:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
    272e:	fe043783          	ld	a5,-32(s0)
    2732:	6398                	ld	a4,0(a5)
    2734:	fe043783          	ld	a5,-32(s0)
    2738:	679c                	ld	a5,8(a5)
    273a:	853e                	mv	a0,a5
    273c:	9702                	jalr	a4
    }
    thread_exit();
    273e:	00000097          	auipc	ra,0x0
    2742:	a5a080e7          	jalr	-1446(ra) # 2198 <thread_exit>
    2746:	a011                	j	274a <__dispatch+0x1c2>
        return;
    2748:	0001                	nop
}
    274a:	70a2                	ld	ra,40(sp)
    274c:	7402                	ld	s0,32(sp)
    274e:	6145                	addi	sp,sp,48
    2750:	8082                	ret

0000000000002752 <__schedule>:

void __schedule()
{
    2752:	711d                	addi	sp,sp,-96
    2754:	ec86                	sd	ra,88(sp)
    2756:	e8a2                	sd	s0,80(sp)
    2758:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
    275a:	00001797          	auipc	a5,0x1
    275e:	c3e78793          	addi	a5,a5,-962 # 3398 <threading_system_time>
    2762:	439c                	lw	a5,0(a5)
    2764:	fcf42c23          	sw	a5,-40(s0)
    2768:	4789                	li	a5,2
    276a:	fcf42e23          	sw	a5,-36(s0)
    276e:	00001797          	auipc	a5,0x1
    2772:	b6278793          	addi	a5,a5,-1182 # 32d0 <run_queue>
    2776:	fef43023          	sd	a5,-32(s0)
    277a:	00001797          	auipc	a5,0x1
    277e:	b6678793          	addi	a5,a5,-1178 # 32e0 <release_queue>
    2782:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
    2786:	fd843783          	ld	a5,-40(s0)
    278a:	faf43023          	sd	a5,-96(s0)
    278e:	fe043783          	ld	a5,-32(s0)
    2792:	faf43423          	sd	a5,-88(s0)
    2796:	fe843783          	ld	a5,-24(s0)
    279a:	faf43823          	sd	a5,-80(s0)
    279e:	fa040793          	addi	a5,s0,-96
    27a2:	853e                	mv	a0,a5
    27a4:	00000097          	auipc	ra,0x0
    27a8:	284080e7          	jalr	644(ra) # 2a28 <schedule_edf_cbs>
    27ac:	872a                	mv	a4,a0
    27ae:	87ae                	mv	a5,a1
    27b0:	fce43423          	sd	a4,-56(s0)
    27b4:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
    27b8:	fc843703          	ld	a4,-56(s0)
    27bc:	00001797          	auipc	a5,0x1
    27c0:	bd478793          	addi	a5,a5,-1068 # 3390 <current>
    27c4:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
    27c6:	fd042783          	lw	a5,-48(s0)
    27ca:	873e                	mv	a4,a5
    27cc:	00001797          	auipc	a5,0x1
    27d0:	bd478793          	addi	a5,a5,-1068 # 33a0 <allocated_time>
    27d4:	e398                	sd	a4,0(a5)
}
    27d6:	0001                	nop
    27d8:	60e6                	ld	ra,88(sp)
    27da:	6446                	ld	s0,80(sp)
    27dc:	6125                	addi	sp,sp,96
    27de:	8082                	ret

00000000000027e0 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
    27e0:	1101                	addi	sp,sp,-32
    27e2:	ec06                	sd	ra,24(sp)
    27e4:	e822                	sd	s0,16(sp)
    27e6:	1000                	addi	s0,sp,32
    27e8:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
    27ec:	00001797          	auipc	a5,0x1
    27f0:	bb078793          	addi	a5,a5,-1104 # 339c <sleeping>
    27f4:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
    27f8:	fe843783          	ld	a5,-24(s0)
    27fc:	0007871b          	sext.w	a4,a5
    2800:	00001797          	auipc	a5,0x1
    2804:	b9878793          	addi	a5,a5,-1128 # 3398 <threading_system_time>
    2808:	439c                	lw	a5,0(a5)
    280a:	2781                	sext.w	a5,a5
    280c:	9fb9                	addw	a5,a5,a4
    280e:	2781                	sext.w	a5,a5
    2810:	0007871b          	sext.w	a4,a5
    2814:	00001797          	auipc	a5,0x1
    2818:	b8478793          	addi	a5,a5,-1148 # 3398 <threading_system_time>
    281c:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
    281e:	00001797          	auipc	a5,0x1
    2822:	ae278793          	addi	a5,a5,-1310 # 3300 <main_thrd_id>
    2826:	439c                	lw	a5,0(a5)
    2828:	853e                	mv	a0,a5
    282a:	fffff097          	auipc	ra,0xfffff
    282e:	c6a080e7          	jalr	-918(ra) # 1494 <thrdresume>
}
    2832:	0001                	nop
    2834:	60e2                	ld	ra,24(sp)
    2836:	6442                	ld	s0,16(sp)
    2838:	6105                	addi	sp,sp,32
    283a:	8082                	ret

000000000000283c <thread_start_threading>:

void thread_start_threading()
{
    283c:	1141                	addi	sp,sp,-16
    283e:	e406                	sd	ra,8(sp)
    2840:	e022                	sd	s0,0(sp)
    2842:	0800                	addi	s0,sp,16
    threading_system_time = 0;
    2844:	00001797          	auipc	a5,0x1
    2848:	b5478793          	addi	a5,a5,-1196 # 3398 <threading_system_time>
    284c:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
    2850:	00001797          	auipc	a5,0x1
    2854:	b4078793          	addi	a5,a5,-1216 # 3390 <current>
    2858:	00001717          	auipc	a4,0x1
    285c:	a7870713          	addi	a4,a4,-1416 # 32d0 <run_queue>
    2860:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
    2862:	4681                	li	a3,0
    2864:	00000617          	auipc	a2,0x0
    2868:	f7c60613          	addi	a2,a2,-132 # 27e0 <back_to_main_handler>
    286c:	00001597          	auipc	a1,0x1
    2870:	a9458593          	addi	a1,a1,-1388 # 3300 <main_thrd_id>
    2874:	3e800513          	li	a0,1000
    2878:	fffff097          	auipc	ra,0xfffff
    287c:	c14080e7          	jalr	-1004(ra) # 148c <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
    2880:	00001797          	auipc	a5,0x1
    2884:	a8078793          	addi	a5,a5,-1408 # 3300 <main_thrd_id>
    2888:	439c                	lw	a5,0(a5)
    288a:	4581                	li	a1,0
    288c:	853e                	mv	a0,a5
    288e:	fffff097          	auipc	ra,0xfffff
    2892:	c0e080e7          	jalr	-1010(ra) # 149c <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    2896:	a0c9                	j	2958 <thread_start_threading+0x11c>
        __release();
    2898:	fffff097          	auipc	ra,0xfffff
    289c:	76a080e7          	jalr	1898(ra) # 2002 <__release>
        __schedule();
    28a0:	00000097          	auipc	ra,0x0
    28a4:	eb2080e7          	jalr	-334(ra) # 2752 <__schedule>
        cancelthrdstop(main_thrd_id, 0);
    28a8:	00001797          	auipc	a5,0x1
    28ac:	a5878793          	addi	a5,a5,-1448 # 3300 <main_thrd_id>
    28b0:	439c                	lw	a5,0(a5)
    28b2:	4581                	li	a1,0
    28b4:	853e                	mv	a0,a5
    28b6:	fffff097          	auipc	ra,0xfffff
    28ba:	be6080e7          	jalr	-1050(ra) # 149c <cancelthrdstop>
        __dispatch();
    28be:	00000097          	auipc	ra,0x0
    28c2:	cca080e7          	jalr	-822(ra) # 2588 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
    28c6:	00001517          	auipc	a0,0x1
    28ca:	a0a50513          	addi	a0,a0,-1526 # 32d0 <run_queue>
    28ce:	fffff097          	auipc	ra,0xfffff
    28d2:	4f2080e7          	jalr	1266(ra) # 1dc0 <list_empty>
    28d6:	87aa                	mv	a5,a0
    28d8:	cb99                	beqz	a5,28ee <thread_start_threading+0xb2>
    28da:	00001517          	auipc	a0,0x1
    28de:	a0650513          	addi	a0,a0,-1530 # 32e0 <release_queue>
    28e2:	fffff097          	auipc	ra,0xfffff
    28e6:	4de080e7          	jalr	1246(ra) # 1dc0 <list_empty>
    28ea:	87aa                	mv	a5,a0
    28ec:	ebd9                	bnez	a5,2982 <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
    28ee:	00001797          	auipc	a5,0x1
    28f2:	ab278793          	addi	a5,a5,-1358 # 33a0 <allocated_time>
    28f6:	639c                	ld	a5,0(a5)
    28f8:	85be                	mv	a1,a5
    28fa:	00001517          	auipc	a0,0x1
    28fe:	8e650513          	addi	a0,a0,-1818 # 31e0 <schedule_edf_cbs+0x7b8>
    2902:	fffff097          	auipc	ra,0xfffff
    2906:	030080e7          	jalr	48(ra) # 1932 <printf>
        sleeping = 1;
    290a:	00001797          	auipc	a5,0x1
    290e:	a9278793          	addi	a5,a5,-1390 # 339c <sleeping>
    2912:	4705                	li	a4,1
    2914:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
    2916:	00001797          	auipc	a5,0x1
    291a:	a8a78793          	addi	a5,a5,-1398 # 33a0 <allocated_time>
    291e:	639c                	ld	a5,0(a5)
    2920:	0007871b          	sext.w	a4,a5
    2924:	00001797          	auipc	a5,0x1
    2928:	a7c78793          	addi	a5,a5,-1412 # 33a0 <allocated_time>
    292c:	639c                	ld	a5,0(a5)
    292e:	86be                	mv	a3,a5
    2930:	00000617          	auipc	a2,0x0
    2934:	eb060613          	addi	a2,a2,-336 # 27e0 <back_to_main_handler>
    2938:	00001597          	auipc	a1,0x1
    293c:	9c858593          	addi	a1,a1,-1592 # 3300 <main_thrd_id>
    2940:	853a                	mv	a0,a4
    2942:	fffff097          	auipc	ra,0xfffff
    2946:	b4a080e7          	jalr	-1206(ra) # 148c <thrdstop>
        while (sleeping) {
    294a:	0001                	nop
    294c:	00001797          	auipc	a5,0x1
    2950:	a5078793          	addi	a5,a5,-1456 # 339c <sleeping>
    2954:	439c                	lw	a5,0(a5)
    2956:	fbfd                	bnez	a5,294c <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
    2958:	00001517          	auipc	a0,0x1
    295c:	97850513          	addi	a0,a0,-1672 # 32d0 <run_queue>
    2960:	fffff097          	auipc	ra,0xfffff
    2964:	460080e7          	jalr	1120(ra) # 1dc0 <list_empty>
    2968:	87aa                	mv	a5,a0
    296a:	d79d                	beqz	a5,2898 <thread_start_threading+0x5c>
    296c:	00001517          	auipc	a0,0x1
    2970:	97450513          	addi	a0,a0,-1676 # 32e0 <release_queue>
    2974:	fffff097          	auipc	ra,0xfffff
    2978:	44c080e7          	jalr	1100(ra) # 1dc0 <list_empty>
    297c:	87aa                	mv	a5,a0
    297e:	df89                	beqz	a5,2898 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
    2980:	a011                	j	2984 <thread_start_threading+0x148>
            break;
    2982:	0001                	nop
}
    2984:	0001                	nop
    2986:	60a2                	ld	ra,8(sp)
    2988:	6402                	ld	s0,0(sp)
    298a:	0141                	addi	sp,sp,16
    298c:	8082                	ret

000000000000298e <__check_deadline_miss>:

/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{   
    298e:	7139                	addi	sp,sp,-64
    2990:	fc22                	sd	s0,56(sp)
    2992:	0080                	addi	s0,sp,64
    2994:	fca43423          	sd	a0,-56(s0)
    2998:	87ae                	mv	a5,a1
    299a:	fcf42223          	sw	a5,-60(s0)
    
    struct thread *th = NULL;
    299e:	fe043423          	sd	zero,-24(s0)
    struct thread *thread_missing_deadline = NULL;
    29a2:	fe043023          	sd	zero,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    29a6:	fc843783          	ld	a5,-56(s0)
    29aa:	639c                	ld	a5,0(a5)
    29ac:	fcf43c23          	sd	a5,-40(s0)
    29b0:	fd843783          	ld	a5,-40(s0)
    29b4:	fd878793          	addi	a5,a5,-40
    29b8:	fef43423          	sd	a5,-24(s0)
    29bc:	a881                	j	2a0c <__check_deadline_miss+0x7e>
       // printf("    checking thread %d, its current deadline at time %d is %d\n", th->ID,current_time, th->current_deadline);
        if (th->current_deadline <= current_time) {
    29be:	fe843783          	ld	a5,-24(s0)
    29c2:	4fb8                	lw	a4,88(a5)
    29c4:	fc442783          	lw	a5,-60(s0)
    29c8:	2781                	sext.w	a5,a5
    29ca:	02e7c663          	blt	a5,a4,29f6 <__check_deadline_miss+0x68>
            if (thread_missing_deadline == NULL)
    29ce:	fe043783          	ld	a5,-32(s0)
    29d2:	e791                	bnez	a5,29de <__check_deadline_miss+0x50>
                thread_missing_deadline = th;
    29d4:	fe843783          	ld	a5,-24(s0)
    29d8:	fef43023          	sd	a5,-32(s0)
    29dc:	a829                	j	29f6 <__check_deadline_miss+0x68>
            else if (th->ID < thread_missing_deadline->ID)
    29de:	fe843783          	ld	a5,-24(s0)
    29e2:	5fd8                	lw	a4,60(a5)
    29e4:	fe043783          	ld	a5,-32(s0)
    29e8:	5fdc                	lw	a5,60(a5)
    29ea:	00f75663          	bge	a4,a5,29f6 <__check_deadline_miss+0x68>
                thread_missing_deadline = th;
    29ee:	fe843783          	ld	a5,-24(s0)
    29f2:	fef43023          	sd	a5,-32(s0)
    list_for_each_entry(th, run_queue, thread_list) {
    29f6:	fe843783          	ld	a5,-24(s0)
    29fa:	779c                	ld	a5,40(a5)
    29fc:	fcf43823          	sd	a5,-48(s0)
    2a00:	fd043783          	ld	a5,-48(s0)
    2a04:	fd878793          	addi	a5,a5,-40
    2a08:	fef43423          	sd	a5,-24(s0)
    2a0c:	fe843783          	ld	a5,-24(s0)
    2a10:	02878793          	addi	a5,a5,40
    2a14:	fc843703          	ld	a4,-56(s0)
    2a18:	faf713e3          	bne	a4,a5,29be <__check_deadline_miss+0x30>
        }
    }
    return thread_missing_deadline;
    2a1c:	fe043783          	ld	a5,-32(s0)
}
    2a20:	853e                	mv	a0,a5
    2a22:	7462                	ld	s0,56(sp)
    2a24:	6121                	addi	sp,sp,64
    2a26:	8082                	ret

0000000000002a28 <schedule_edf_cbs>:
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    2a28:	7131                	addi	sp,sp,-192
    2a2a:	fd06                	sd	ra,184(sp)
    2a2c:	f922                	sd	s0,176(sp)
    2a2e:	f526                	sd	s1,168(sp)
    2a30:	f14a                	sd	s2,160(sp)
    2a32:	ed4e                	sd	s3,152(sp)
    2a34:	0180                	addi	s0,sp,192
    2a36:	84aa                	mv	s1,a0
   
   
    struct threads_sched_result r;
    struct thread *next = NULL;
    2a38:	fa043023          	sd	zero,-96(s0)
    struct release_queue_entry *awating_rqe = NULL;
    2a3c:	fa043423          	sd	zero,-88(s0)
    struct release_queue_entry *h_awating_rqe = NULL;
    2a40:	fa043823          	sd	zero,-80(s0)
    struct thread *th = NULL;
    2a44:	fa043c23          	sd	zero,-72(s0)

    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    2a48:	649c                	ld	a5,8(s1)
    2a4a:	4098                	lw	a4,0(s1)
    2a4c:	85ba                	mv	a1,a4
    2a4e:	853e                	mv	a0,a5
    2a50:	00000097          	auipc	ra,0x0
    2a54:	f3e080e7          	jalr	-194(ra) # 298e <__check_deadline_miss>
    2a58:	f8a43c23          	sd	a0,-104(s0)
    if(thread_missing_deadline){
    2a5c:	f9843783          	ld	a5,-104(s0)
    2a60:	c7b5                	beqz	a5,2acc <schedule_edf_cbs+0xa4>
        printf("     we have found a missing thread and its thread %d \n", thread_missing_deadline->ID);
    2a62:	f9843783          	ld	a5,-104(s0)
    2a66:	5fdc                	lw	a5,60(a5)
    2a68:	85be                	mv	a1,a5
    2a6a:	00000517          	auipc	a0,0x0
    2a6e:	79e50513          	addi	a0,a0,1950 # 3208 <schedule_edf_cbs+0x7e0>
    2a72:	fffff097          	auipc	ra,0xfffff
    2a76:	ec0080e7          	jalr	-320(ra) # 1932 <printf>
        if(thread_missing_deadline->cbs.is_hard_rt){
    2a7a:	f9843783          	ld	a5,-104(s0)
    2a7e:	57fc                	lw	a5,108(a5)
    2a80:	c395                	beqz	a5,2aa4 <schedule_edf_cbs+0x7c>
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
    2a82:	f9843783          	ld	a5,-104(s0)
    2a86:	02878793          	addi	a5,a5,40
    2a8a:	f4f43023          	sd	a5,-192(s0)
            r.allocated_time = 0;     
    2a8e:	f4042423          	sw	zero,-184(s0)
            return r;
    2a92:	f4043783          	ld	a5,-192(s0)
    2a96:	f4f43823          	sd	a5,-176(s0)
    2a9a:	f4843783          	ld	a5,-184(s0)
    2a9e:	f4f43c23          	sd	a5,-168(s0)
    2aa2:	a13d                	j	2ed0 <schedule_edf_cbs+0x4a8>
        }else{
            thread_missing_deadline->current_deadline = args.current_time + thread_missing_deadline->period;
    2aa4:	4098                	lw	a4,0(s1)
    2aa6:	f9843783          	ld	a5,-104(s0)
    2aaa:	47fc                	lw	a5,76(a5)
    2aac:	9fb9                	addw	a5,a5,a4
    2aae:	0007871b          	sext.w	a4,a5
    2ab2:	f9843783          	ld	a5,-104(s0)
    2ab6:	cfb8                	sw	a4,88(a5)
            thread_missing_deadline->cbs.remaining_budget = thread_missing_deadline->cbs.budget;
    2ab8:	f9843783          	ld	a5,-104(s0)
    2abc:	53f8                	lw	a4,100(a5)
    2abe:	f9843783          	ld	a5,-104(s0)
    2ac2:	d7b8                	sw	a4,104(a5)
            thread_missing_deadline->cbs.is_throttled=0;
    2ac4:	f9843783          	ld	a5,-104(s0)
    2ac8:	0607a823          	sw	zero,112(a5)
        else if (th->cbs.is_hard_rt && th->current_deadline == next->current_deadline && th->ID < next->ID)
            next = th;
    }
*/
    // if no hard th, find soft th
    if(!next){
    2acc:	fa043783          	ld	a5,-96(s0)
    2ad0:	e7dd                	bnez	a5,2b7e <schedule_edf_cbs+0x156>
        list_for_each_entry(th, args.run_queue, thread_list) {
    2ad2:	649c                	ld	a5,8(s1)
    2ad4:	639c                	ld	a5,0(a5)
    2ad6:	f8f43823          	sd	a5,-112(s0)
    2ada:	f9043783          	ld	a5,-112(s0)
    2ade:	fd878793          	addi	a5,a5,-40
    2ae2:	faf43c23          	sd	a5,-72(s0)
    2ae6:	a069                	j	2b70 <schedule_edf_cbs+0x148>
            printf("     we're looking at thread %d and is_throt is %d\n", th->ID, th->cbs.is_throttled);
    2ae8:	fb843783          	ld	a5,-72(s0)
    2aec:	5fd8                	lw	a4,60(a5)
    2aee:	fb843783          	ld	a5,-72(s0)
    2af2:	5bbc                	lw	a5,112(a5)
    2af4:	863e                	mv	a2,a5
    2af6:	85ba                	mv	a1,a4
    2af8:	00000517          	auipc	a0,0x0
    2afc:	74850513          	addi	a0,a0,1864 # 3240 <schedule_edf_cbs+0x818>
    2b00:	fffff097          	auipc	ra,0xfffff
    2b04:	e32080e7          	jalr	-462(ra) # 1932 <printf>
            if (next == NULL)
    2b08:	fa043783          	ld	a5,-96(s0)
    2b0c:	e791                	bnez	a5,2b18 <schedule_edf_cbs+0xf0>
                next = th;
    2b0e:	fb843783          	ld	a5,-72(s0)
    2b12:	faf43023          	sd	a5,-96(s0)
    2b16:	a091                	j	2b5a <schedule_edf_cbs+0x132>
            else if(th->current_deadline < next->current_deadline)
    2b18:	fb843783          	ld	a5,-72(s0)
    2b1c:	4fb8                	lw	a4,88(a5)
    2b1e:	fa043783          	ld	a5,-96(s0)
    2b22:	4fbc                	lw	a5,88(a5)
    2b24:	00f75763          	bge	a4,a5,2b32 <schedule_edf_cbs+0x10a>
                next = th;
    2b28:	fb843783          	ld	a5,-72(s0)
    2b2c:	faf43023          	sd	a5,-96(s0)
    2b30:	a02d                	j	2b5a <schedule_edf_cbs+0x132>
            else if (th->current_deadline == next->current_deadline && th->ID < next->ID)
    2b32:	fb843783          	ld	a5,-72(s0)
    2b36:	4fb8                	lw	a4,88(a5)
    2b38:	fa043783          	ld	a5,-96(s0)
    2b3c:	4fbc                	lw	a5,88(a5)
    2b3e:	00f71e63          	bne	a4,a5,2b5a <schedule_edf_cbs+0x132>
    2b42:	fb843783          	ld	a5,-72(s0)
    2b46:	5fd8                	lw	a4,60(a5)
    2b48:	fa043783          	ld	a5,-96(s0)
    2b4c:	5fdc                	lw	a5,60(a5)
    2b4e:	00f75663          	bge	a4,a5,2b5a <schedule_edf_cbs+0x132>
                next = th;
    2b52:	fb843783          	ld	a5,-72(s0)
    2b56:	faf43023          	sd	a5,-96(s0)
        list_for_each_entry(th, args.run_queue, thread_list) {
    2b5a:	fb843783          	ld	a5,-72(s0)
    2b5e:	779c                	ld	a5,40(a5)
    2b60:	f8f43423          	sd	a5,-120(s0)
    2b64:	f8843783          	ld	a5,-120(s0)
    2b68:	fd878793          	addi	a5,a5,-40
    2b6c:	faf43c23          	sd	a5,-72(s0)
    2b70:	fb843783          	ld	a5,-72(s0)
    2b74:	02878713          	addi	a4,a5,40
    2b78:	649c                	ld	a5,8(s1)
    2b7a:	f6f717e3          	bne	a4,a5,2ae8 <schedule_edf_cbs+0xc0>
        }
    }
    printf("    next thread will be no.%d\n", next->ID);
    2b7e:	fa043783          	ld	a5,-96(s0)
    2b82:	5fdc                	lw	a5,60(a5)
    2b84:	85be                	mv	a1,a5
    2b86:	00000517          	auipc	a0,0x0
    2b8a:	6f250513          	addi	a0,a0,1778 # 3278 <schedule_edf_cbs+0x850>
    2b8e:	fffff097          	auipc	ra,0xfffff
    2b92:	da4080e7          	jalr	-604(ra) # 1932 <printf>

    if(next && next->cbs.is_throttled){
    2b96:	fa043783          	ld	a5,-96(s0)
    2b9a:	cb95                	beqz	a5,2bce <schedule_edf_cbs+0x1a6>
    2b9c:	fa043783          	ld	a5,-96(s0)
    2ba0:	5bbc                	lw	a5,112(a5)
    2ba2:	c795                	beqz	a5,2bce <schedule_edf_cbs+0x1a6>
        // return throttled thread to release queue

        next->remaining_time=0;
    2ba4:	fa043783          	ld	a5,-96(s0)
    2ba8:	0407aa23          	sw	zero,84(a5)

        //__rt_finish_current();
        r.scheduled_thread_list_member = &next->thread_list;
    2bac:	fa043783          	ld	a5,-96(s0)
    2bb0:	02878793          	addi	a5,a5,40
    2bb4:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = 0;     
    2bb8:	f4042423          	sw	zero,-184(s0)
        return r;
    2bbc:	f4043783          	ld	a5,-192(s0)
    2bc0:	f4f43823          	sd	a5,-176(s0)
    2bc4:	f4843783          	ld	a5,-184(s0)
    2bc8:	f4f43c23          	sd	a5,-168(s0)
    2bcc:	a611                	j	2ed0 <schedule_edf_cbs+0x4a8>
        } 
    }      
    


    struct release_queue_entry *ath=NULL;
    2bce:	fc043023          	sd	zero,-64(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    2bd2:	689c                	ld	a5,16(s1)
    2bd4:	639c                	ld	a5,0(a5)
    2bd6:	f8f43023          	sd	a5,-128(s0)
    2bda:	f8043783          	ld	a5,-128(s0)
    2bde:	17e1                	addi	a5,a5,-8
    2be0:	fcf43023          	sd	a5,-64(s0)
    2be4:	a0b5                	j	2c50 <schedule_edf_cbs+0x228>
        if (awating_rqe == NULL) 
    2be6:	fa843783          	ld	a5,-88(s0)
    2bea:	e791                	bnez	a5,2bf6 <schedule_edf_cbs+0x1ce>
            awating_rqe = ath;  
    2bec:	fc043783          	ld	a5,-64(s0)
    2bf0:	faf43423          	sd	a5,-88(s0)
    2bf4:	a0a1                	j	2c3c <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time > ath->release_time)
    2bf6:	fa843783          	ld	a5,-88(s0)
    2bfa:	4f98                	lw	a4,24(a5)
    2bfc:	fc043783          	ld	a5,-64(s0)
    2c00:	4f9c                	lw	a5,24(a5)
    2c02:	00e7d763          	bge	a5,a4,2c10 <schedule_edf_cbs+0x1e8>
            awating_rqe = ath;
    2c06:	fc043783          	ld	a5,-64(s0)
    2c0a:	faf43423          	sd	a5,-88(s0)
    2c0e:	a03d                	j	2c3c <schedule_edf_cbs+0x214>
        else if(awating_rqe->release_time == ath->release_time &&
    2c10:	fa843783          	ld	a5,-88(s0)
    2c14:	4f98                	lw	a4,24(a5)
    2c16:	fc043783          	ld	a5,-64(s0)
    2c1a:	4f9c                	lw	a5,24(a5)
    2c1c:	02f71063          	bne	a4,a5,2c3c <schedule_edf_cbs+0x214>
                awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    2c20:	fa843783          	ld	a5,-88(s0)
    2c24:	639c                	ld	a5,0(a5)
    2c26:	4fb8                	lw	a4,88(a5)
    2c28:	fc043783          	ld	a5,-64(s0)
    2c2c:	639c                	ld	a5,0(a5)
    2c2e:	4fbc                	lw	a5,88(a5)
        else if(awating_rqe->release_time == ath->release_time &&
    2c30:	00e7d663          	bge	a5,a4,2c3c <schedule_edf_cbs+0x214>
            awating_rqe = ath;  
    2c34:	fc043783          	ld	a5,-64(s0)
    2c38:	faf43423          	sd	a5,-88(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
    2c3c:	fc043783          	ld	a5,-64(s0)
    2c40:	679c                	ld	a5,8(a5)
    2c42:	f6f43023          	sd	a5,-160(s0)
    2c46:	f6043783          	ld	a5,-160(s0)
    2c4a:	17e1                	addi	a5,a5,-8
    2c4c:	fcf43023          	sd	a5,-64(s0)
    2c50:	fc043783          	ld	a5,-64(s0)
    2c54:	00878713          	addi	a4,a5,8
    2c58:	689c                	ld	a5,16(s1)
    2c5a:	f8f716e3          	bne	a4,a5,2be6 <schedule_edf_cbs+0x1be>
    }

    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    2c5e:	689c                	ld	a5,16(s1)
    2c60:	639c                	ld	a5,0(a5)
    2c62:	f6f43c23          	sd	a5,-136(s0)
    2c66:	f7843783          	ld	a5,-136(s0)
    2c6a:	17e1                	addi	a5,a5,-8
    2c6c:	fcf43023          	sd	a5,-64(s0)
    2c70:	a069                	j	2cfa <schedule_edf_cbs+0x2d2>
        if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
    2c72:	fb043783          	ld	a5,-80(s0)
    2c76:	eb99                	bnez	a5,2c8c <schedule_edf_cbs+0x264>
    2c78:	fc043783          	ld	a5,-64(s0)
    2c7c:	639c                	ld	a5,0(a5)
    2c7e:	57fc                	lw	a5,108(a5)
    2c80:	c791                	beqz	a5,2c8c <schedule_edf_cbs+0x264>
            h_awating_rqe = ath;  
    2c82:	fc043783          	ld	a5,-64(s0)
    2c86:	faf43823          	sd	a5,-80(s0)
    2c8a:	a8b1                	j	2ce6 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    2c8c:	fc043783          	ld	a5,-64(s0)
    2c90:	639c                	ld	a5,0(a5)
    2c92:	57fc                	lw	a5,108(a5)
    2c94:	cf91                	beqz	a5,2cb0 <schedule_edf_cbs+0x288>
                h_awating_rqe->release_time > ath->release_time)
    2c96:	fb043783          	ld	a5,-80(s0)
    2c9a:	4f98                	lw	a4,24(a5)
    2c9c:	fc043783          	ld	a5,-64(s0)
    2ca0:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    2ca2:	00e7d763          	bge	a5,a4,2cb0 <schedule_edf_cbs+0x288>
            h_awating_rqe = ath;
    2ca6:	fc043783          	ld	a5,-64(s0)
    2caa:	faf43823          	sd	a5,-80(s0)
    2cae:	a825                	j	2ce6 <schedule_edf_cbs+0x2be>
        else if(ath->thrd->cbs.is_hard_rt && 
    2cb0:	fc043783          	ld	a5,-64(s0)
    2cb4:	639c                	ld	a5,0(a5)
    2cb6:	57fc                	lw	a5,108(a5)
    2cb8:	c79d                	beqz	a5,2ce6 <schedule_edf_cbs+0x2be>
                h_awating_rqe->release_time == ath->release_time &&
    2cba:	fb043783          	ld	a5,-80(s0)
    2cbe:	4f98                	lw	a4,24(a5)
    2cc0:	fc043783          	ld	a5,-64(s0)
    2cc4:	4f9c                	lw	a5,24(a5)
        else if(ath->thrd->cbs.is_hard_rt && 
    2cc6:	02f71063          	bne	a4,a5,2ce6 <schedule_edf_cbs+0x2be>
                h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
    2cca:	fb043783          	ld	a5,-80(s0)
    2cce:	639c                	ld	a5,0(a5)
    2cd0:	4fb8                	lw	a4,88(a5)
    2cd2:	fc043783          	ld	a5,-64(s0)
    2cd6:	639c                	ld	a5,0(a5)
    2cd8:	4fbc                	lw	a5,88(a5)
                h_awating_rqe->release_time == ath->release_time &&
    2cda:	00e7d663          	bge	a5,a4,2ce6 <schedule_edf_cbs+0x2be>
                h_awating_rqe = ath;  
    2cde:	fc043783          	ld	a5,-64(s0)
    2ce2:	faf43823          	sd	a5,-80(s0)
    list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
    2ce6:	fc043783          	ld	a5,-64(s0)
    2cea:	679c                	ld	a5,8(a5)
    2cec:	f6f43423          	sd	a5,-152(s0)
    2cf0:	f6843783          	ld	a5,-152(s0)
    2cf4:	17e1                	addi	a5,a5,-8
    2cf6:	fcf43023          	sd	a5,-64(s0)
    2cfa:	fc043783          	ld	a5,-64(s0)
    2cfe:	00878713          	addi	a4,a5,8
    2d02:	689c                	ld	a5,16(s1)
    2d04:	f6f717e3          	bne	a4,a5,2c72 <schedule_edf_cbs+0x24a>
    }



    if(next && next->cbs.is_hard_rt)
    2d08:	fa043783          	ld	a5,-96(s0)
    2d0c:	cb89                	beqz	a5,2d1e <schedule_edf_cbs+0x2f6>
    2d0e:	fa043783          	ld	a5,-96(s0)
    2d12:	57fc                	lw	a5,108(a5)
    2d14:	c789                	beqz	a5,2d1e <schedule_edf_cbs+0x2f6>
        awating_rqe=h_awating_rqe;
    2d16:	fb043783          	ld	a5,-80(s0)
    2d1a:	faf43423          	sd	a5,-88(s0)
   


    int time_untill_awaiting_thread = 0;
    2d1e:	fc042623          	sw	zero,-52(s0)
    int preempt_thread_flag=0;
    2d22:	fc042423          	sw	zero,-56(s0)
    if(awating_rqe){
    2d26:	fa843783          	ld	a5,-88(s0)
    2d2a:	c3c5                	beqz	a5,2dca <schedule_edf_cbs+0x3a2>
        printf("    awating_rqe->thrd->ID is %d",awating_rqe->thrd->ID );
    2d2c:	fa843783          	ld	a5,-88(s0)
    2d30:	639c                	ld	a5,0(a5)
    2d32:	5fdc                	lw	a5,60(a5)
    2d34:	85be                	mv	a1,a5
    2d36:	00000517          	auipc	a0,0x0
    2d3a:	56250513          	addi	a0,a0,1378 # 3298 <schedule_edf_cbs+0x870>
    2d3e:	fffff097          	auipc	ra,0xfffff
    2d42:	bf4080e7          	jalr	-1036(ra) # 1932 <printf>
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
    2d46:	fa843783          	ld	a5,-88(s0)
    2d4a:	4f98                	lw	a4,24(a5)
    2d4c:	409c                	lw	a5,0(s1)
    2d4e:	40f707bb          	subw	a5,a4,a5
    2d52:	fcf42623          	sw	a5,-52(s0)
        if (next){
    2d56:	fa043783          	ld	a5,-96(s0)
    2d5a:	cba5                	beqz	a5,2dca <schedule_edf_cbs+0x3a2>
            if(time_untill_awaiting_thread < next->remaining_time){
    2d5c:	fa043783          	ld	a5,-96(s0)
    2d60:	4bf8                	lw	a4,84(a5)
    2d62:	fcc42783          	lw	a5,-52(s0)
    2d66:	2781                	sext.w	a5,a5
    2d68:	06e7d163          	bge	a5,a4,2dca <schedule_edf_cbs+0x3a2>
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
    2d6c:	fa043783          	ld	a5,-96(s0)
    2d70:	57fc                	lw	a5,108(a5)
    2d72:	eb91                	bnez	a5,2d86 <schedule_edf_cbs+0x35e>
    2d74:	fa843783          	ld	a5,-88(s0)
    2d78:	639c                	ld	a5,0(a5)
    2d7a:	57fc                	lw	a5,108(a5)
    2d7c:	c789                	beqz	a5,2d86 <schedule_edf_cbs+0x35e>
                    preempt_thread_flag=1;    
    2d7e:	4785                	li	a5,1
    2d80:	fcf42423          	sw	a5,-56(s0)
    2d84:	a099                	j	2dca <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
    2d86:	fa043783          	ld	a5,-96(s0)
    2d8a:	4fb8                	lw	a4,88(a5)
    2d8c:	fa843783          	ld	a5,-88(s0)
    2d90:	639c                	ld	a5,0(a5)
    2d92:	4fbc                	lw	a5,88(a5)
    2d94:	00e7d663          	bge	a5,a4,2da0 <schedule_edf_cbs+0x378>
                    preempt_thread_flag=1;
    2d98:	4785                	li	a5,1
    2d9a:	fcf42423          	sw	a5,-56(s0)
    2d9e:	a035                	j	2dca <schedule_edf_cbs+0x3a2>
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    2da0:	fa043783          	ld	a5,-96(s0)
    2da4:	4fb8                	lw	a4,88(a5)
    2da6:	fa843783          	ld	a5,-88(s0)
    2daa:	639c                	ld	a5,0(a5)
    2dac:	4fbc                	lw	a5,88(a5)
    2dae:	00f71e63          	bne	a4,a5,2dca <schedule_edf_cbs+0x3a2>
                        next->ID > awating_rqe->thrd->ID)
    2db2:	fa043783          	ld	a5,-96(s0)
    2db6:	5fd8                	lw	a4,60(a5)
    2db8:	fa843783          	ld	a5,-88(s0)
    2dbc:	639c                	ld	a5,0(a5)
    2dbe:	5fdc                	lw	a5,60(a5)
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
    2dc0:	00e7d563          	bge	a5,a4,2dca <schedule_edf_cbs+0x3a2>
                    preempt_thread_flag=1;
    2dc4:	4785                	li	a5,1
    2dc6:	fcf42423          	sw	a5,-56(s0)

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){
    2dca:	fa043783          	ld	a5,-96(s0)
    2dce:	cbd1                	beqz	a5,2e62 <schedule_edf_cbs+0x43a>
    2dd0:	fa043783          	ld	a5,-96(s0)
    2dd4:	57fc                	lw	a5,108(a5)
    2dd6:	e7d1                	bnez	a5,2e62 <schedule_edf_cbs+0x43a>
        int time_until_deadline= next->current_deadline-args.current_time;
    2dd8:	fa043783          	ld	a5,-96(s0)
    2ddc:	4fb8                	lw	a4,88(a5)
    2dde:	409c                	lw	a5,0(s1)
    2de0:	40f707bb          	subw	a5,a4,a5
    2de4:	f6f42a23          	sw	a5,-140(s0)

        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
    2de8:	fa043783          	ld	a5,-96(s0)
    2dec:	47f8                	lw	a4,76(a5)
    2dee:	fa043783          	ld	a5,-96(s0)
    2df2:	57bc                	lw	a5,104(a5)
    2df4:	02f707bb          	mulw	a5,a4,a5
    2df8:	0007869b          	sext.w	a3,a5
    2dfc:	fa043783          	ld	a5,-96(s0)
    2e00:	53fc                	lw	a5,100(a5)
    2e02:	f7442703          	lw	a4,-140(s0)
    2e06:	02f707bb          	mulw	a5,a4,a5
    2e0a:	2781                	sext.w	a5,a5
    2e0c:	8736                	mv	a4,a3
    2e0e:	02e7d263          	bge	a5,a4,2e32 <schedule_edf_cbs+0x40a>
            next->current_deadline = args.current_time + next->period;
    2e12:	4098                	lw	a4,0(s1)
    2e14:	fa043783          	ld	a5,-96(s0)
    2e18:	47fc                	lw	a5,76(a5)
    2e1a:	9fb9                	addw	a5,a5,a4
    2e1c:	0007871b          	sext.w	a4,a5
    2e20:	fa043783          	ld	a5,-96(s0)
    2e24:	cfb8                	sw	a4,88(a5)
            next->cbs.remaining_budget = next->cbs.budget;
    2e26:	fa043783          	ld	a5,-96(s0)
    2e2a:	53f8                	lw	a4,100(a5)
    2e2c:	fa043783          	ld	a5,-96(s0)
    2e30:	d7b8                	sw	a4,104(a5)
        }

        if(next->remaining_time > next->cbs.remaining_budget){
    2e32:	fa043783          	ld	a5,-96(s0)
    2e36:	4bf8                	lw	a4,84(a5)
    2e38:	fa043783          	ld	a5,-96(s0)
    2e3c:	57bc                	lw	a5,104(a5)
    2e3e:	02e7d263          	bge	a5,a4,2e62 <schedule_edf_cbs+0x43a>
            next->cbs.is_throttled=1;
    2e42:	fa043783          	ld	a5,-96(s0)
    2e46:	4705                	li	a4,1
    2e48:	dbb8                	sw	a4,112(a5)
            next->cbs.throttle_new_deadline=next->current_deadline;
    2e4a:	fa043783          	ld	a5,-96(s0)
    2e4e:	4fb8                	lw	a4,88(a5)
    2e50:	fa043783          	ld	a5,-96(s0)
    2e54:	dfb8                	sw	a4,120(a5)
            next->cbs.remaining_time_at_throttle = next->remaining_time;
    2e56:	fa043783          	ld	a5,-96(s0)
    2e5a:	4bf8                	lw	a4,84(a5)
    2e5c:	fa043783          	ld	a5,-96(s0)
    2e60:	dff8                	sw	a4,124(a5)
        }
      
    }

    if (next != NULL) {
    2e62:	fa043783          	ld	a5,-96(s0)
    2e66:	c3a9                	beqz	a5,2ea8 <schedule_edf_cbs+0x480>
        r.scheduled_thread_list_member = &next->thread_list;
    2e68:	fa043783          	ld	a5,-96(s0)
    2e6c:	02878793          	addi	a5,a5,40
    2e70:	f4f43023          	sd	a5,-192(s0)
        if(awating_rqe && preempt_thread_flag)
    2e74:	fa843783          	ld	a5,-88(s0)
    2e78:	cb91                	beqz	a5,2e8c <schedule_edf_cbs+0x464>
    2e7a:	fc842783          	lw	a5,-56(s0)
    2e7e:	2781                	sext.w	a5,a5
    2e80:	c791                	beqz	a5,2e8c <schedule_edf_cbs+0x464>
            r.allocated_time = time_untill_awaiting_thread;
    2e82:	fcc42783          	lw	a5,-52(s0)
    2e86:	f4f42423          	sw	a5,-184(s0)
    2e8a:	a81d                	j	2ec0 <schedule_edf_cbs+0x498>
        else{
            // if we're here and next is throttled, the task will be throttled after this dispatch
            r.allocated_time = (next->cbs.is_throttled) ? next->cbs.remaining_budget : next->remaining_time;
    2e8c:	fa043783          	ld	a5,-96(s0)
    2e90:	5bbc                	lw	a5,112(a5)
    2e92:	c789                	beqz	a5,2e9c <schedule_edf_cbs+0x474>
    2e94:	fa043783          	ld	a5,-96(s0)
    2e98:	57bc                	lw	a5,104(a5)
    2e9a:	a021                	j	2ea2 <schedule_edf_cbs+0x47a>
    2e9c:	fa043783          	ld	a5,-96(s0)
    2ea0:	4bfc                	lw	a5,84(a5)
    2ea2:	f4f42423          	sw	a5,-184(s0)
    2ea6:	a829                	j	2ec0 <schedule_edf_cbs+0x498>
            }

    } else {
        r.scheduled_thread_list_member = args.run_queue;
    2ea8:	649c                	ld	a5,8(s1)
    2eaa:	f4f43023          	sd	a5,-192(s0)
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    2eae:	fa843783          	ld	a5,-88(s0)
    2eb2:	c781                	beqz	a5,2eba <schedule_edf_cbs+0x492>
    2eb4:	fcc42783          	lw	a5,-52(s0)
    2eb8:	a011                	j	2ebc <schedule_edf_cbs+0x494>
    2eba:	4785                	li	a5,1
    2ebc:	f4f42423          	sw	a5,-184(s0)

    }

   // printf("    second run\n");
   // __check_deadline_miss(args.run_queue,args.current_time+8);
    return r;
    2ec0:	f4043783          	ld	a5,-192(s0)
    2ec4:	f4f43823          	sd	a5,-176(s0)
    2ec8:	f4843783          	ld	a5,-184(s0)
    2ecc:	f4f43c23          	sd	a5,-168(s0)
    2ed0:	4701                	li	a4,0
    2ed2:	f5043703          	ld	a4,-176(s0)
    2ed6:	4781                	li	a5,0
    2ed8:	f5843783          	ld	a5,-168(s0)
    2edc:	893a                	mv	s2,a4
    2ede:	89be                	mv	s3,a5
    2ee0:	874a                	mv	a4,s2
    2ee2:	87ce                	mv	a5,s3

    // handle the case where run queue is empty
    // TO DO

    return r;
}
    2ee4:	853a                	mv	a0,a4
    2ee6:	85be                	mv	a1,a5
    2ee8:	70ea                	ld	ra,184(sp)
    2eea:	744a                	ld	s0,176(sp)
    2eec:	74aa                	ld	s1,168(sp)
    2eee:	790a                	ld	s2,160(sp)
    2ef0:	69ea                	ld	s3,152(sp)
    2ef2:	6129                	addi	sp,sp,192
    2ef4:	8082                	ret
