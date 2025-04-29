
user/_threads:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <__list_add>:
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
       0:	7179                	addi	sp,sp,-48
       2:	f422                	sd	s0,40(sp)
       4:	1800                	addi	s0,sp,48
       6:	fea43423          	sd	a0,-24(s0)
       a:	feb43023          	sd	a1,-32(s0)
       e:	fcc43c23          	sd	a2,-40(s0)
     next->prev = new_entry;
      12:	fd843783          	ld	a5,-40(s0)
      16:	fe843703          	ld	a4,-24(s0)
      1a:	e798                	sd	a4,8(a5)
     new_entry->next = next;
      1c:	fe843783          	ld	a5,-24(s0)
      20:	fd843703          	ld	a4,-40(s0)
      24:	e398                	sd	a4,0(a5)
     new_entry->prev = prev;
      26:	fe843783          	ld	a5,-24(s0)
      2a:	fe043703          	ld	a4,-32(s0)
      2e:	e798                	sd	a4,8(a5)
     prev->next = new_entry;
      30:	fe043783          	ld	a5,-32(s0)
      34:	fe843703          	ld	a4,-24(s0)
      38:	e398                	sd	a4,0(a5)
 }
      3a:	0001                	nop
      3c:	7422                	ld	s0,40(sp)
      3e:	6145                	addi	sp,sp,48
      40:	8082                	ret

0000000000000042 <list_add_tail>:
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
      42:	1101                	addi	sp,sp,-32
      44:	ec06                	sd	ra,24(sp)
      46:	e822                	sd	s0,16(sp)
      48:	1000                	addi	s0,sp,32
      4a:	fea43423          	sd	a0,-24(s0)
      4e:	feb43023          	sd	a1,-32(s0)
     __list_add(new_entry, head->prev, head);
      52:	fe043783          	ld	a5,-32(s0)
      56:	679c                	ld	a5,8(a5)
      58:	fe043603          	ld	a2,-32(s0)
      5c:	85be                	mv	a1,a5
      5e:	fe843503          	ld	a0,-24(s0)
      62:	00000097          	auipc	ra,0x0
      66:	f9e080e7          	jalr	-98(ra) # 0 <__list_add>
 }
      6a:	0001                	nop
      6c:	60e2                	ld	ra,24(sp)
      6e:	6442                	ld	s0,16(sp)
      70:	6105                	addi	sp,sp,32
      72:	8082                	ret

0000000000000074 <__list_del>:
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
      74:	1101                	addi	sp,sp,-32
      76:	ec22                	sd	s0,24(sp)
      78:	1000                	addi	s0,sp,32
      7a:	fea43423          	sd	a0,-24(s0)
      7e:	feb43023          	sd	a1,-32(s0)
     next->prev = prev;
      82:	fe043783          	ld	a5,-32(s0)
      86:	fe843703          	ld	a4,-24(s0)
      8a:	e798                	sd	a4,8(a5)
     prev->next = next;
      8c:	fe843783          	ld	a5,-24(s0)
      90:	fe043703          	ld	a4,-32(s0)
      94:	e398                	sd	a4,0(a5)
 }
      96:	0001                	nop
      98:	6462                	ld	s0,24(sp)
      9a:	6105                	addi	sp,sp,32
      9c:	8082                	ret

000000000000009e <list_del>:
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
      9e:	1101                	addi	sp,sp,-32
      a0:	ec06                	sd	ra,24(sp)
      a2:	e822                	sd	s0,16(sp)
      a4:	1000                	addi	s0,sp,32
      a6:	fea43423          	sd	a0,-24(s0)
     __list_del(entry->prev, entry->next);
      aa:	fe843783          	ld	a5,-24(s0)
      ae:	6798                	ld	a4,8(a5)
      b0:	fe843783          	ld	a5,-24(s0)
      b4:	639c                	ld	a5,0(a5)
      b6:	85be                	mv	a1,a5
      b8:	853a                	mv	a0,a4
      ba:	00000097          	auipc	ra,0x0
      be:	fba080e7          	jalr	-70(ra) # 74 <__list_del>
     entry->next = LIST_POISON1;
      c2:	fe843783          	ld	a5,-24(s0)
      c6:	00100737          	lui	a4,0x100
      ca:	10070713          	addi	a4,a4,256 # 100100 <__global_pointer$+0xfd6e0>
      ce:	e398                	sd	a4,0(a5)
     entry->prev = LIST_POISON2;
      d0:	fe843783          	ld	a5,-24(s0)
      d4:	00200737          	lui	a4,0x200
      d8:	20070713          	addi	a4,a4,512 # 200200 <__global_pointer$+0x1fd7e0>
      dc:	e798                	sd	a4,8(a5)
 }
      de:	0001                	nop
      e0:	60e2                	ld	ra,24(sp)
      e2:	6442                	ld	s0,16(sp)
      e4:	6105                	addi	sp,sp,32
      e6:	8082                	ret

00000000000000e8 <list_empty>:
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
      e8:	1101                	addi	sp,sp,-32
      ea:	ec22                	sd	s0,24(sp)
      ec:	1000                	addi	s0,sp,32
      ee:	fea43423          	sd	a0,-24(s0)
     return head->next == head;
      f2:	fe843783          	ld	a5,-24(s0)
      f6:	639c                	ld	a5,0(a5)
      f8:	fe843703          	ld	a4,-24(s0)
      fc:	40f707b3          	sub	a5,a4,a5
     100:	0017b793          	seqz	a5,a5
     104:	0ff7f793          	andi	a5,a5,255
     108:	2781                	sext.w	a5,a5
 }
     10a:	853e                	mv	a0,a5
     10c:	6462                	ld	s0,24(sp)
     10e:	6105                	addi	sp,sp,32
     110:	8082                	ret

0000000000000112 <thread_create>:

void __dispatch(void);
void __schedule(void);

struct thread *thread_create(void (*f)(void *), void *arg, int is_real_time, int processing_time, int period, int n)
{
     112:	715d                	addi	sp,sp,-80
     114:	e486                	sd	ra,72(sp)
     116:	e0a2                	sd	s0,64(sp)
     118:	0880                	addi	s0,sp,80
     11a:	fca43423          	sd	a0,-56(s0)
     11e:	fcb43023          	sd	a1,-64(s0)
     122:	85b2                	mv	a1,a2
     124:	8636                	mv	a2,a3
     126:	86ba                	mv	a3,a4
     128:	873e                	mv	a4,a5
     12a:	87ae                	mv	a5,a1
     12c:	faf42e23          	sw	a5,-68(s0)
     130:	87b2                	mv	a5,a2
     132:	faf42c23          	sw	a5,-72(s0)
     136:	87b6                	mv	a5,a3
     138:	faf42a23          	sw	a5,-76(s0)
     13c:	87ba                	mv	a5,a4
     13e:	faf42823          	sw	a5,-80(s0)
    static int _id = 1;
    struct thread *t = (struct thread *)malloc(sizeof(struct thread));
     142:	08000513          	li	a0,128
     146:	00001097          	auipc	ra,0x1
     14a:	738080e7          	jalr	1848(ra) # 187e <malloc>
     14e:	fea43423          	sd	a0,-24(s0)
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long)malloc(sizeof(unsigned long) * 0x200);
     152:	6505                	lui	a0,0x1
     154:	00001097          	auipc	ra,0x1
     158:	72a080e7          	jalr	1834(ra) # 187e <malloc>
     15c:	87aa                	mv	a5,a0
     15e:	fef43023          	sd	a5,-32(s0)
    new_stack_p = new_stack + 0x200 * 8 - 0x2 * 8;
     162:	fe043703          	ld	a4,-32(s0)
     166:	6785                	lui	a5,0x1
     168:	17c1                	addi	a5,a5,-16
     16a:	97ba                	add	a5,a5,a4
     16c:	fcf43c23          	sd	a5,-40(s0)
    t->fp = f;
     170:	fe843783          	ld	a5,-24(s0)
     174:	fc843703          	ld	a4,-56(s0)
     178:	e398                	sd	a4,0(a5)
    t->arg = arg;
     17a:	fe843783          	ld	a5,-24(s0)
     17e:	fc043703          	ld	a4,-64(s0)
     182:	e798                	sd	a4,8(a5)
    t->ID = _id++;
     184:	00002797          	auipc	a5,0x2
     188:	0d478793          	addi	a5,a5,212 # 2258 <_id.1241>
     18c:	439c                	lw	a5,0(a5)
     18e:	0017871b          	addiw	a4,a5,1
     192:	0007069b          	sext.w	a3,a4
     196:	00002717          	auipc	a4,0x2
     19a:	0c270713          	addi	a4,a4,194 # 2258 <_id.1241>
     19e:	c314                	sw	a3,0(a4)
     1a0:	fe843703          	ld	a4,-24(s0)
     1a4:	df5c                	sw	a5,60(a4)
    t->buf_set = 0;
     1a6:	fe843783          	ld	a5,-24(s0)
     1aa:	0207a023          	sw	zero,32(a5)
    t->stack = (void *)new_stack;
     1ae:	fe043703          	ld	a4,-32(s0)
     1b2:	fe843783          	ld	a5,-24(s0)
     1b6:	eb98                	sd	a4,16(a5)
    t->stack_p = (void *)new_stack_p;
     1b8:	fd843703          	ld	a4,-40(s0)
     1bc:	fe843783          	ld	a5,-24(s0)
     1c0:	ef98                	sd	a4,24(a5)

    t->processing_time = processing_time;
     1c2:	fe843783          	ld	a5,-24(s0)
     1c6:	fb842703          	lw	a4,-72(s0)
     1ca:	c3f8                	sw	a4,68(a5)
    t->period = period;
     1cc:	fe843783          	ld	a5,-24(s0)
     1d0:	fb442703          	lw	a4,-76(s0)
     1d4:	c7f8                	sw	a4,76(a5)
    t->deadline = period;
     1d6:	fe843783          	ld	a5,-24(s0)
     1da:	fb442703          	lw	a4,-76(s0)
     1de:	c7b8                	sw	a4,72(a5)
    t->n = n;
     1e0:	fe843783          	ld	a5,-24(s0)
     1e4:	fb042703          	lw	a4,-80(s0)
     1e8:	cbb8                	sw	a4,80(a5)
    t->is_real_time = is_real_time;
     1ea:	fe843783          	ld	a5,-24(s0)
     1ee:	fbc42703          	lw	a4,-68(s0)
     1f2:	c3b8                	sw	a4,64(a5)
    t->remaining_time = processing_time;
     1f4:	fe843783          	ld	a5,-24(s0)
     1f8:	fb842703          	lw	a4,-72(s0)
     1fc:	cbf8                	sw	a4,84(a5)
    t->current_deadline = 0;
     1fe:	fe843783          	ld	a5,-24(s0)
     202:	0407ac23          	sw	zero,88(a5)
    t->priority = 100;
     206:	fe843783          	ld	a5,-24(s0)
     20a:	06400713          	li	a4,100
     20e:	cff8                	sw	a4,92(a5)
    t->arrival_time = 30000;
     210:	fe843783          	ld	a5,-24(s0)
     214:	671d                	lui	a4,0x7
     216:	5307071b          	addiw	a4,a4,1328
     21a:	d3b8                	sw	a4,96(a5)
    
    return t;
     21c:	fe843783          	ld	a5,-24(s0)
}
     220:	853e                	mv	a0,a5
     222:	60a6                	ld	ra,72(sp)
     224:	6406                	ld	s0,64(sp)
     226:	6161                	addi	sp,sp,80
     228:	8082                	ret

000000000000022a <thread_set_priority>:

void thread_set_priority(struct thread *t, int priority)
{
     22a:	1101                	addi	sp,sp,-32
     22c:	ec22                	sd	s0,24(sp)
     22e:	1000                	addi	s0,sp,32
     230:	fea43423          	sd	a0,-24(s0)
     234:	87ae                	mv	a5,a1
     236:	fef42223          	sw	a5,-28(s0)
    t->priority = priority;
     23a:	fe843783          	ld	a5,-24(s0)
     23e:	fe442703          	lw	a4,-28(s0)
     242:	cff8                	sw	a4,92(a5)
}
     244:	0001                	nop
     246:	6462                	ld	s0,24(sp)
     248:	6105                	addi	sp,sp,32
     24a:	8082                	ret

000000000000024c <init_thread_cbs>:
void init_thread_cbs(struct thread *t, int budget, int is_hard_rt)
{
     24c:	1101                	addi	sp,sp,-32
     24e:	ec22                	sd	s0,24(sp)
     250:	1000                	addi	s0,sp,32
     252:	fea43423          	sd	a0,-24(s0)
     256:	87ae                	mv	a5,a1
     258:	8732                	mv	a4,a2
     25a:	fef42223          	sw	a5,-28(s0)
     25e:	87ba                	mv	a5,a4
     260:	fef42023          	sw	a5,-32(s0)
    t->cbs.budget = budget;
     264:	fe843783          	ld	a5,-24(s0)
     268:	fe442703          	lw	a4,-28(s0)
     26c:	d3f8                	sw	a4,100(a5)
    t->cbs.remaining_budget = budget; 
     26e:	fe843783          	ld	a5,-24(s0)
     272:	fe442703          	lw	a4,-28(s0)
     276:	d7b8                	sw	a4,104(a5)
    t->cbs.is_hard_rt = is_hard_rt;
     278:	fe843783          	ld	a5,-24(s0)
     27c:	fe042703          	lw	a4,-32(s0)
     280:	d7f8                	sw	a4,108(a5)
    t->cbs.is_throttled = 0;
     282:	fe843783          	ld	a5,-24(s0)
     286:	0607a823          	sw	zero,112(a5)
    t->cbs.throttled_arrived_time = 0;
     28a:	fe843783          	ld	a5,-24(s0)
     28e:	0607aa23          	sw	zero,116(a5)
    t->cbs.throttle_new_deadline = 0;
     292:	fe843783          	ld	a5,-24(s0)
     296:	0607ac23          	sw	zero,120(a5)
    t->cbs.remaining_time_at_throttle = 0;
     29a:	fe843783          	ld	a5,-24(s0)
     29e:	0607ae23          	sw	zero,124(a5)
}
     2a2:	0001                	nop
     2a4:	6462                	ld	s0,24(sp)
     2a6:	6105                	addi	sp,sp,32
     2a8:	8082                	ret

00000000000002aa <thread_add_at>:
void thread_add_at(struct thread *t, int arrival_time)
{
     2aa:	7179                	addi	sp,sp,-48
     2ac:	f406                	sd	ra,40(sp)
     2ae:	f022                	sd	s0,32(sp)
     2b0:	1800                	addi	s0,sp,48
     2b2:	fca43c23          	sd	a0,-40(s0)
     2b6:	87ae                	mv	a5,a1
     2b8:	fcf42a23          	sw	a5,-44(s0)
    struct release_queue_entry *new_entry = (struct release_queue_entry *)malloc(sizeof(struct release_queue_entry));
     2bc:	02000513          	li	a0,32
     2c0:	00001097          	auipc	ra,0x1
     2c4:	5be080e7          	jalr	1470(ra) # 187e <malloc>
     2c8:	fea43423          	sd	a0,-24(s0)
    new_entry->thrd = t;
     2cc:	fe843783          	ld	a5,-24(s0)
     2d0:	fd843703          	ld	a4,-40(s0)
     2d4:	e398                	sd	a4,0(a5)
    new_entry->release_time = arrival_time;
     2d6:	fe843783          	ld	a5,-24(s0)
     2da:	fd442703          	lw	a4,-44(s0)
     2de:	cf98                	sw	a4,24(a5)
    t->arrival_time = arrival_time;
     2e0:	fd843783          	ld	a5,-40(s0)
     2e4:	fd442703          	lw	a4,-44(s0)
     2e8:	d3b8                	sw	a4,96(a5)

    // t->remaining_time = t->processing_time;
    if (t->is_real_time) {
     2ea:	fd843783          	ld	a5,-40(s0)
     2ee:	43bc                	lw	a5,64(a5)
     2f0:	cf81                	beqz	a5,308 <thread_add_at+0x5e>
        t->current_deadline = arrival_time + t->deadline;
     2f2:	fd843783          	ld	a5,-40(s0)
     2f6:	47bc                	lw	a5,72(a5)
     2f8:	fd442703          	lw	a4,-44(s0)
     2fc:	9fb9                	addw	a5,a5,a4
     2fe:	0007871b          	sext.w	a4,a5
     302:	fd843783          	ld	a5,-40(s0)
     306:	cfb8                	sw	a4,88(a5)
    }
    list_add_tail(&new_entry->thread_list, &release_queue);
     308:	fe843783          	ld	a5,-24(s0)
     30c:	07a1                	addi	a5,a5,8
     30e:	00002597          	auipc	a1,0x2
     312:	f2258593          	addi	a1,a1,-222 # 2230 <release_queue>
     316:	853e                	mv	a0,a5
     318:	00000097          	auipc	ra,0x0
     31c:	d2a080e7          	jalr	-726(ra) # 42 <list_add_tail>
}
     320:	0001                	nop
     322:	70a2                	ld	ra,40(sp)
     324:	7402                	ld	s0,32(sp)
     326:	6145                	addi	sp,sp,48
     328:	8082                	ret

000000000000032a <__release>:

void __release()
{
     32a:	7139                	addi	sp,sp,-64
     32c:	fc06                	sd	ra,56(sp)
     32e:	f822                	sd	s0,48(sp)
     330:	0080                	addi	s0,sp,64
    struct release_queue_entry *cur, *nxt;
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
     332:	00002797          	auipc	a5,0x2
     336:	efe78793          	addi	a5,a5,-258 # 2230 <release_queue>
     33a:	639c                	ld	a5,0(a5)
     33c:	fcf43c23          	sd	a5,-40(s0)
     340:	fd843783          	ld	a5,-40(s0)
     344:	17e1                	addi	a5,a5,-8
     346:	fef43423          	sd	a5,-24(s0)
     34a:	fe843783          	ld	a5,-24(s0)
     34e:	679c                	ld	a5,8(a5)
     350:	fcf43823          	sd	a5,-48(s0)
     354:	fd043783          	ld	a5,-48(s0)
     358:	17e1                	addi	a5,a5,-8
     35a:	fef43023          	sd	a5,-32(s0)
     35e:	a0e9                	j	428 <__release+0xfe>
        if (threading_system_time >= cur->release_time) {
     360:	fe843783          	ld	a5,-24(s0)
     364:	4f98                	lw	a4,24(a5)
     366:	00002797          	auipc	a5,0x2
     36a:	f0a78793          	addi	a5,a5,-246 # 2270 <threading_system_time>
     36e:	439c                	lw	a5,0(a5)
     370:	08e7ce63          	blt	a5,a4,40c <__release+0xe2>
            if(cur->thrd->cbs.is_throttled){
     374:	fe843783          	ld	a5,-24(s0)
     378:	639c                	ld	a5,0(a5)
     37a:	5bbc                	lw	a5,112(a5)
     37c:	c79d                	beqz	a5,3aa <__release+0x80>
                cur->thrd->cbs.is_throttled = 0;
     37e:	fe843783          	ld	a5,-24(s0)
     382:	639c                	ld	a5,0(a5)
     384:	0607a823          	sw	zero,112(a5)
                cur->thrd->cbs.remaining_budget = cur->thrd->cbs.budget;
     388:	fe843783          	ld	a5,-24(s0)
     38c:	6398                	ld	a4,0(a5)
     38e:	fe843783          	ld	a5,-24(s0)
     392:	639c                	ld	a5,0(a5)
     394:	5378                	lw	a4,100(a4)
     396:	d7b8                	sw	a4,104(a5)
                cur->thrd->remaining_time = cur->thrd->cbs.remaining_time_at_throttle;
     398:	fe843783          	ld	a5,-24(s0)
     39c:	6398                	ld	a4,0(a5)
     39e:	fe843783          	ld	a5,-24(s0)
     3a2:	639c                	ld	a5,0(a5)
     3a4:	5f78                	lw	a4,124(a4)
     3a6:	cbf8                	sw	a4,84(a5)
     3a8:	a809                	j	3ba <__release+0x90>
            }else{
                cur->thrd->remaining_time = cur->thrd->processing_time;
     3aa:	fe843783          	ld	a5,-24(s0)
     3ae:	6398                	ld	a4,0(a5)
     3b0:	fe843783          	ld	a5,-24(s0)
     3b4:	639c                	ld	a5,0(a5)
     3b6:	4378                	lw	a4,68(a4)
     3b8:	cbf8                	sw	a4,84(a5)
            }
            cur->thrd->current_deadline = cur->release_time + cur->thrd->deadline;
     3ba:	fe843783          	ld	a5,-24(s0)
     3be:	4f94                	lw	a3,24(a5)
     3c0:	fe843783          	ld	a5,-24(s0)
     3c4:	639c                	ld	a5,0(a5)
     3c6:	47b8                	lw	a4,72(a5)
     3c8:	fe843783          	ld	a5,-24(s0)
     3cc:	639c                	ld	a5,0(a5)
     3ce:	9f35                	addw	a4,a4,a3
     3d0:	2701                	sext.w	a4,a4
     3d2:	cfb8                	sw	a4,88(a5)
            list_add_tail(&cur->thrd->thread_list, &run_queue);
     3d4:	fe843783          	ld	a5,-24(s0)
     3d8:	639c                	ld	a5,0(a5)
     3da:	02878793          	addi	a5,a5,40
     3de:	00002597          	auipc	a1,0x2
     3e2:	e4258593          	addi	a1,a1,-446 # 2220 <run_queue>
     3e6:	853e                	mv	a0,a5
     3e8:	00000097          	auipc	ra,0x0
     3ec:	c5a080e7          	jalr	-934(ra) # 42 <list_add_tail>
            list_del(&cur->thread_list);
     3f0:	fe843783          	ld	a5,-24(s0)
     3f4:	07a1                	addi	a5,a5,8
     3f6:	853e                	mv	a0,a5
     3f8:	00000097          	auipc	ra,0x0
     3fc:	ca6080e7          	jalr	-858(ra) # 9e <list_del>
            free(cur);
     400:	fe843503          	ld	a0,-24(s0)
     404:	00001097          	auipc	ra,0x1
     408:	2d8080e7          	jalr	728(ra) # 16dc <free>
    list_for_each_entry_safe(cur, nxt, &release_queue, thread_list) {
     40c:	fe043783          	ld	a5,-32(s0)
     410:	fef43423          	sd	a5,-24(s0)
     414:	fe043783          	ld	a5,-32(s0)
     418:	679c                	ld	a5,8(a5)
     41a:	fcf43423          	sd	a5,-56(s0)
     41e:	fc843783          	ld	a5,-56(s0)
     422:	17e1                	addi	a5,a5,-8
     424:	fef43023          	sd	a5,-32(s0)
     428:	fe843783          	ld	a5,-24(s0)
     42c:	00878713          	addi	a4,a5,8
     430:	00002797          	auipc	a5,0x2
     434:	e0078793          	addi	a5,a5,-512 # 2230 <release_queue>
     438:	f2f714e3          	bne	a4,a5,360 <__release+0x36>
        }
    }
}
     43c:	0001                	nop
     43e:	0001                	nop
     440:	70e2                	ld	ra,56(sp)
     442:	7442                	ld	s0,48(sp)
     444:	6121                	addi	sp,sp,64
     446:	8082                	ret

0000000000000448 <__thread_exit>:

void __thread_exit(struct thread *to_remove)
{
     448:	1101                	addi	sp,sp,-32
     44a:	ec06                	sd	ra,24(sp)
     44c:	e822                	sd	s0,16(sp)
     44e:	1000                	addi	s0,sp,32
     450:	fea43423          	sd	a0,-24(s0)
    current = to_remove->thread_list.prev;
     454:	fe843783          	ld	a5,-24(s0)
     458:	7b98                	ld	a4,48(a5)
     45a:	00002797          	auipc	a5,0x2
     45e:	e0e78793          	addi	a5,a5,-498 # 2268 <current>
     462:	e398                	sd	a4,0(a5)
    list_del(&to_remove->thread_list);
     464:	fe843783          	ld	a5,-24(s0)
     468:	02878793          	addi	a5,a5,40
     46c:	853e                	mv	a0,a5
     46e:	00000097          	auipc	ra,0x0
     472:	c30080e7          	jalr	-976(ra) # 9e <list_del>

    free(to_remove->stack);
     476:	fe843783          	ld	a5,-24(s0)
     47a:	6b9c                	ld	a5,16(a5)
     47c:	853e                	mv	a0,a5
     47e:	00001097          	auipc	ra,0x1
     482:	25e080e7          	jalr	606(ra) # 16dc <free>
    free(to_remove);
     486:	fe843503          	ld	a0,-24(s0)
     48a:	00001097          	auipc	ra,0x1
     48e:	252080e7          	jalr	594(ra) # 16dc <free>

    __schedule();
     492:	00000097          	auipc	ra,0x0
     496:	5e8080e7          	jalr	1512(ra) # a7a <__schedule>
    __dispatch();
     49a:	00000097          	auipc	ra,0x0
     49e:	416080e7          	jalr	1046(ra) # 8b0 <__dispatch>
    thrdresume(main_thrd_id);
     4a2:	00002797          	auipc	a5,0x2
     4a6:	db278793          	addi	a5,a5,-590 # 2254 <main_thrd_id>
     4aa:	439c                	lw	a5,0(a5)
     4ac:	853e                	mv	a0,a5
     4ae:	00001097          	auipc	ra,0x1
     4b2:	d40080e7          	jalr	-704(ra) # 11ee <thrdresume>
}
     4b6:	0001                	nop
     4b8:	60e2                	ld	ra,24(sp)
     4ba:	6442                	ld	s0,16(sp)
     4bc:	6105                	addi	sp,sp,32
     4be:	8082                	ret

00000000000004c0 <thread_exit>:

void thread_exit(void)
{
     4c0:	7179                	addi	sp,sp,-48
     4c2:	f406                	sd	ra,40(sp)
     4c4:	f022                	sd	s0,32(sp)
     4c6:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
     4c8:	00002797          	auipc	a5,0x2
     4cc:	da078793          	addi	a5,a5,-608 # 2268 <current>
     4d0:	6398                	ld	a4,0(a5)
     4d2:	00002797          	auipc	a5,0x2
     4d6:	d4e78793          	addi	a5,a5,-690 # 2220 <run_queue>
     4da:	02f71063          	bne	a4,a5,4fa <thread_exit+0x3a>
        fprintf(2, "[FATAL] thread_exit is called on a nonexistent thread\n");
     4de:	00002597          	auipc	a1,0x2
     4e2:	ac258593          	addi	a1,a1,-1342 # 1fa0 <schedule_edf_cbs+0x4d4>
     4e6:	4509                	li	a0,2
     4e8:	00001097          	auipc	ra,0x1
     4ec:	14c080e7          	jalr	332(ra) # 1634 <fprintf>
        exit(1);
     4f0:	4505                	li	a0,1
     4f2:	00001097          	auipc	ra,0x1
     4f6:	c54080e7          	jalr	-940(ra) # 1146 <exit>
    }

    struct thread *to_remove = list_entry(current, struct thread, thread_list);
     4fa:	00002797          	auipc	a5,0x2
     4fe:	d6e78793          	addi	a5,a5,-658 # 2268 <current>
     502:	639c                	ld	a5,0(a5)
     504:	fef43423          	sd	a5,-24(s0)
     508:	fe843783          	ld	a5,-24(s0)
     50c:	fd878793          	addi	a5,a5,-40
     510:	fef43023          	sd	a5,-32(s0)
    int consume_ticks = cancelthrdstop(to_remove->thrdstop_context_id, 1);
     514:	fe043783          	ld	a5,-32(s0)
     518:	5f9c                	lw	a5,56(a5)
     51a:	4585                	li	a1,1
     51c:	853e                	mv	a0,a5
     51e:	00001097          	auipc	ra,0x1
     522:	cd8080e7          	jalr	-808(ra) # 11f6 <cancelthrdstop>
     526:	87aa                	mv	a5,a0
     528:	fcf42e23          	sw	a5,-36(s0)
    threading_system_time += consume_ticks;
     52c:	00002797          	auipc	a5,0x2
     530:	d4478793          	addi	a5,a5,-700 # 2270 <threading_system_time>
     534:	439c                	lw	a5,0(a5)
     536:	fdc42703          	lw	a4,-36(s0)
     53a:	9fb9                	addw	a5,a5,a4
     53c:	0007871b          	sext.w	a4,a5
     540:	00002797          	auipc	a5,0x2
     544:	d3078793          	addi	a5,a5,-720 # 2270 <threading_system_time>
     548:	c398                	sw	a4,0(a5)

    __release();
     54a:	00000097          	auipc	ra,0x0
     54e:	de0080e7          	jalr	-544(ra) # 32a <__release>
    __thread_exit(to_remove);
     552:	fe043503          	ld	a0,-32(s0)
     556:	00000097          	auipc	ra,0x0
     55a:	ef2080e7          	jalr	-270(ra) # 448 <__thread_exit>
}
     55e:	0001                	nop
     560:	70a2                	ld	ra,40(sp)
     562:	7402                	ld	s0,32(sp)
     564:	6145                	addi	sp,sp,48
     566:	8082                	ret

0000000000000568 <__finish_current>:

void __finish_current()
{
     568:	7179                	addi	sp,sp,-48
     56a:	f406                	sd	ra,40(sp)
     56c:	f022                	sd	s0,32(sp)
     56e:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     570:	00002797          	auipc	a5,0x2
     574:	cf878793          	addi	a5,a5,-776 # 2268 <current>
     578:	639c                	ld	a5,0(a5)
     57a:	fef43423          	sd	a5,-24(s0)
     57e:	fe843783          	ld	a5,-24(s0)
     582:	fd878793          	addi	a5,a5,-40
     586:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
     58a:	fe043783          	ld	a5,-32(s0)
     58e:	4bbc                	lw	a5,80(a5)
     590:	37fd                	addiw	a5,a5,-1
     592:	0007871b          	sext.w	a4,a5
     596:	fe043783          	ld	a5,-32(s0)
     59a:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish at %d\n",
     59c:	fe043783          	ld	a5,-32(s0)
     5a0:	5fd8                	lw	a4,60(a5)
     5a2:	00002797          	auipc	a5,0x2
     5a6:	cce78793          	addi	a5,a5,-818 # 2270 <threading_system_time>
     5aa:	4390                	lw	a2,0(a5)
     5ac:	fe043783          	ld	a5,-32(s0)
     5b0:	4bbc                	lw	a5,80(a5)
     5b2:	86be                	mv	a3,a5
     5b4:	85ba                	mv	a1,a4
     5b6:	00002517          	auipc	a0,0x2
     5ba:	a2250513          	addi	a0,a0,-1502 # 1fd8 <schedule_edf_cbs+0x50c>
     5be:	00001097          	auipc	ra,0x1
     5c2:	0ce080e7          	jalr	206(ra) # 168c <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
     5c6:	fe043783          	ld	a5,-32(s0)
     5ca:	4bbc                	lw	a5,80(a5)
     5cc:	04f05563          	blez	a5,616 <__finish_current+0xae>
        struct list_head *to_remove = current;
     5d0:	00002797          	auipc	a5,0x2
     5d4:	c9878793          	addi	a5,a5,-872 # 2268 <current>
     5d8:	639c                	ld	a5,0(a5)
     5da:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
     5de:	00002797          	auipc	a5,0x2
     5e2:	c8a78793          	addi	a5,a5,-886 # 2268 <current>
     5e6:	639c                	ld	a5,0(a5)
     5e8:	6798                	ld	a4,8(a5)
     5ea:	00002797          	auipc	a5,0x2
     5ee:	c7e78793          	addi	a5,a5,-898 # 2268 <current>
     5f2:	e398                	sd	a4,0(a5)
        list_del(to_remove);
     5f4:	fd843503          	ld	a0,-40(s0)
     5f8:	00000097          	auipc	ra,0x0
     5fc:	aa6080e7          	jalr	-1370(ra) # 9e <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
     600:	fe043783          	ld	a5,-32(s0)
     604:	4fbc                	lw	a5,88(a5)
     606:	85be                	mv	a1,a5
     608:	fe043503          	ld	a0,-32(s0)
     60c:	00000097          	auipc	ra,0x0
     610:	c9e080e7          	jalr	-866(ra) # 2aa <thread_add_at>
    } else {
        __thread_exit(current_thread);
    }
}
     614:	a039                	j	622 <__finish_current+0xba>
        __thread_exit(current_thread);
     616:	fe043503          	ld	a0,-32(s0)
     61a:	00000097          	auipc	ra,0x0
     61e:	e2e080e7          	jalr	-466(ra) # 448 <__thread_exit>
}
     622:	0001                	nop
     624:	70a2                	ld	ra,40(sp)
     626:	7402                	ld	s0,32(sp)
     628:	6145                	addi	sp,sp,48
     62a:	8082                	ret

000000000000062c <__rt_finish_current>:
void __rt_finish_current()
{
     62c:	7179                	addi	sp,sp,-48
     62e:	f406                	sd	ra,40(sp)
     630:	f022                	sd	s0,32(sp)
     632:	1800                	addi	s0,sp,48
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     634:	00002797          	auipc	a5,0x2
     638:	c3478793          	addi	a5,a5,-972 # 2268 <current>
     63c:	639c                	ld	a5,0(a5)
     63e:	fef43423          	sd	a5,-24(s0)
     642:	fe843783          	ld	a5,-24(s0)
     646:	fd878793          	addi	a5,a5,-40
     64a:	fef43023          	sd	a5,-32(s0)
    --current_thread->n;
     64e:	fe043783          	ld	a5,-32(s0)
     652:	4bbc                	lw	a5,80(a5)
     654:	37fd                	addiw	a5,a5,-1
     656:	0007871b          	sext.w	a4,a5
     65a:	fe043783          	ld	a5,-32(s0)
     65e:	cbb8                	sw	a4,80(a5)

    printf("thread#%d finish one cycle at %d: %d cycles left\n",
     660:	fe043783          	ld	a5,-32(s0)
     664:	5fd8                	lw	a4,60(a5)
     666:	00002797          	auipc	a5,0x2
     66a:	c0a78793          	addi	a5,a5,-1014 # 2270 <threading_system_time>
     66e:	4390                	lw	a2,0(a5)
     670:	fe043783          	ld	a5,-32(s0)
     674:	4bbc                	lw	a5,80(a5)
     676:	86be                	mv	a3,a5
     678:	85ba                	mv	a1,a4
     67a:	00002517          	auipc	a0,0x2
     67e:	97650513          	addi	a0,a0,-1674 # 1ff0 <schedule_edf_cbs+0x524>
     682:	00001097          	auipc	ra,0x1
     686:	00a080e7          	jalr	10(ra) # 168c <printf>
           current_thread->ID, threading_system_time, current_thread->n);

    if (current_thread->n > 0) {
     68a:	fe043783          	ld	a5,-32(s0)
     68e:	4bbc                	lw	a5,80(a5)
     690:	04f05f63          	blez	a5,6ee <__rt_finish_current+0xc2>
        struct list_head *to_remove = current;
     694:	00002797          	auipc	a5,0x2
     698:	bd478793          	addi	a5,a5,-1068 # 2268 <current>
     69c:	639c                	ld	a5,0(a5)
     69e:	fcf43c23          	sd	a5,-40(s0)
        current = current->prev;
     6a2:	00002797          	auipc	a5,0x2
     6a6:	bc678793          	addi	a5,a5,-1082 # 2268 <current>
     6aa:	639c                	ld	a5,0(a5)
     6ac:	6798                	ld	a4,8(a5)
     6ae:	00002797          	auipc	a5,0x2
     6b2:	bba78793          	addi	a5,a5,-1094 # 2268 <current>
     6b6:	e398                	sd	a4,0(a5)
        list_del(to_remove);
     6b8:	fd843503          	ld	a0,-40(s0)
     6bc:	00000097          	auipc	ra,0x0
     6c0:	9e2080e7          	jalr	-1566(ra) # 9e <list_del>
        thread_add_at(current_thread, current_thread->current_deadline);
     6c4:	fe043783          	ld	a5,-32(s0)
     6c8:	4fbc                	lw	a5,88(a5)
     6ca:	85be                	mv	a1,a5
     6cc:	fe043503          	ld	a0,-32(s0)
     6d0:	00000097          	auipc	ra,0x0
     6d4:	bda080e7          	jalr	-1062(ra) # 2aa <thread_add_at>
        if (!current_thread->cbs.is_hard_rt) {
     6d8:	fe043783          	ld	a5,-32(s0)
     6dc:	57fc                	lw	a5,108(a5)
     6de:	ef91                	bnez	a5,6fa <__rt_finish_current+0xce>
            current_thread->cbs.remaining_budget = current_thread->cbs.budget;
     6e0:	fe043783          	ld	a5,-32(s0)
     6e4:	53f8                	lw	a4,100(a5)
     6e6:	fe043783          	ld	a5,-32(s0)
     6ea:	d7b8                	sw	a4,104(a5)
        }
    } else {
        __thread_exit(current_thread);
    }
}
     6ec:	a039                	j	6fa <__rt_finish_current+0xce>
        __thread_exit(current_thread);
     6ee:	fe043503          	ld	a0,-32(s0)
     6f2:	00000097          	auipc	ra,0x0
     6f6:	d56080e7          	jalr	-682(ra) # 448 <__thread_exit>
}
     6fa:	0001                	nop
     6fc:	70a2                	ld	ra,40(sp)
     6fe:	7402                	ld	s0,32(sp)
     700:	6145                	addi	sp,sp,48
     702:	8082                	ret

0000000000000704 <switch_handler>:

void switch_handler(void *arg)
{
     704:	7139                	addi	sp,sp,-64
     706:	fc06                	sd	ra,56(sp)
     708:	f822                	sd	s0,48(sp)
     70a:	0080                	addi	s0,sp,64
     70c:	fca43423          	sd	a0,-56(s0)
    uint64 elapsed_time = (uint64)arg;
     710:	fc843783          	ld	a5,-56(s0)
     714:	fef43423          	sd	a5,-24(s0)
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     718:	00002797          	auipc	a5,0x2
     71c:	b5078793          	addi	a5,a5,-1200 # 2268 <current>
     720:	639c                	ld	a5,0(a5)
     722:	fef43023          	sd	a5,-32(s0)
     726:	fe043783          	ld	a5,-32(s0)
     72a:	fd878793          	addi	a5,a5,-40
     72e:	fcf43c23          	sd	a5,-40(s0)

    threading_system_time += elapsed_time;
     732:	fe843783          	ld	a5,-24(s0)
     736:	0007871b          	sext.w	a4,a5
     73a:	00002797          	auipc	a5,0x2
     73e:	b3678793          	addi	a5,a5,-1226 # 2270 <threading_system_time>
     742:	439c                	lw	a5,0(a5)
     744:	2781                	sext.w	a5,a5
     746:	9fb9                	addw	a5,a5,a4
     748:	2781                	sext.w	a5,a5
     74a:	0007871b          	sext.w	a4,a5
     74e:	00002797          	auipc	a5,0x2
     752:	b2278793          	addi	a5,a5,-1246 # 2270 <threading_system_time>
     756:	c398                	sw	a4,0(a5)
     __release();
     758:	00000097          	auipc	ra,0x0
     75c:	bd2080e7          	jalr	-1070(ra) # 32a <__release>
    current_thread->remaining_time -= elapsed_time;
     760:	fd843783          	ld	a5,-40(s0)
     764:	4bfc                	lw	a5,84(a5)
     766:	0007871b          	sext.w	a4,a5
     76a:	fe843783          	ld	a5,-24(s0)
     76e:	2781                	sext.w	a5,a5
     770:	40f707bb          	subw	a5,a4,a5
     774:	2781                	sext.w	a5,a5
     776:	0007871b          	sext.w	a4,a5
     77a:	fd843783          	ld	a5,-40(s0)
     77e:	cbf8                	sw	a4,84(a5)
    if (!current_thread->cbs.is_hard_rt) {
     780:	fd843783          	ld	a5,-40(s0)
     784:	57fc                	lw	a5,108(a5)
     786:	e38d                	bnez	a5,7a8 <switch_handler+0xa4>
        current_thread->cbs.remaining_budget -= elapsed_time;
     788:	fd843783          	ld	a5,-40(s0)
     78c:	57bc                	lw	a5,104(a5)
     78e:	0007871b          	sext.w	a4,a5
     792:	fe843783          	ld	a5,-24(s0)
     796:	2781                	sext.w	a5,a5
     798:	40f707bb          	subw	a5,a4,a5
     79c:	2781                	sext.w	a5,a5
     79e:	0007871b          	sext.w	a4,a5
     7a2:	fd843783          	ld	a5,-40(s0)
     7a6:	d7b8                	sw	a4,104(a5)
    }
    if (current_thread->is_real_time)
     7a8:	fd843783          	ld	a5,-40(s0)
     7ac:	43bc                	lw	a5,64(a5)
     7ae:	c3ad                	beqz	a5,810 <switch_handler+0x10c>
        if (threading_system_time > current_thread->current_deadline || 
     7b0:	fd843783          	ld	a5,-40(s0)
     7b4:	4fb8                	lw	a4,88(a5)
     7b6:	00002797          	auipc	a5,0x2
     7ba:	aba78793          	addi	a5,a5,-1350 # 2270 <threading_system_time>
     7be:	439c                	lw	a5,0(a5)
     7c0:	02f74163          	blt	a4,a5,7e2 <switch_handler+0xde>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
     7c4:	fd843783          	ld	a5,-40(s0)
     7c8:	4fb8                	lw	a4,88(a5)
     7ca:	00002797          	auipc	a5,0x2
     7ce:	aa678793          	addi	a5,a5,-1370 # 2270 <threading_system_time>
     7d2:	439c                	lw	a5,0(a5)
        if (threading_system_time > current_thread->current_deadline || 
     7d4:	02f71e63          	bne	a4,a5,810 <switch_handler+0x10c>
            (threading_system_time == current_thread->current_deadline && current_thread->remaining_time > 0)) {
     7d8:	fd843783          	ld	a5,-40(s0)
     7dc:	4bfc                	lw	a5,84(a5)
     7de:	02f05963          	blez	a5,810 <switch_handler+0x10c>
            printf("thread#%d misses a deadline at %d in swicth\n", current_thread->ID, threading_system_time);
     7e2:	fd843783          	ld	a5,-40(s0)
     7e6:	5fd8                	lw	a4,60(a5)
     7e8:	00002797          	auipc	a5,0x2
     7ec:	a8878793          	addi	a5,a5,-1400 # 2270 <threading_system_time>
     7f0:	439c                	lw	a5,0(a5)
     7f2:	863e                	mv	a2,a5
     7f4:	85ba                	mv	a1,a4
     7f6:	00002517          	auipc	a0,0x2
     7fa:	83250513          	addi	a0,a0,-1998 # 2028 <schedule_edf_cbs+0x55c>
     7fe:	00001097          	auipc	ra,0x1
     802:	e8e080e7          	jalr	-370(ra) # 168c <printf>
            exit(0);
     806:	4501                	li	a0,0
     808:	00001097          	auipc	ra,0x1
     80c:	93e080e7          	jalr	-1730(ra) # 1146 <exit>
        }

    if (current_thread->remaining_time <= 0) {
     810:	fd843783          	ld	a5,-40(s0)
     814:	4bfc                	lw	a5,84(a5)
     816:	02f04063          	bgtz	a5,836 <switch_handler+0x132>
        if (current_thread->is_real_time)
     81a:	fd843783          	ld	a5,-40(s0)
     81e:	43bc                	lw	a5,64(a5)
     820:	c791                	beqz	a5,82c <switch_handler+0x128>
            __rt_finish_current();
     822:	00000097          	auipc	ra,0x0
     826:	e0a080e7          	jalr	-502(ra) # 62c <__rt_finish_current>
     82a:	a881                	j	87a <switch_handler+0x176>
        else
            __finish_current();
     82c:	00000097          	auipc	ra,0x0
     830:	d3c080e7          	jalr	-708(ra) # 568 <__finish_current>
     834:	a099                	j	87a <switch_handler+0x176>
    } else {
        // move the current thread to the end of the run_queue
        struct list_head *to_remove = current;
     836:	00002797          	auipc	a5,0x2
     83a:	a3278793          	addi	a5,a5,-1486 # 2268 <current>
     83e:	639c                	ld	a5,0(a5)
     840:	fcf43823          	sd	a5,-48(s0)
        current = current->prev;
     844:	00002797          	auipc	a5,0x2
     848:	a2478793          	addi	a5,a5,-1500 # 2268 <current>
     84c:	639c                	ld	a5,0(a5)
     84e:	6798                	ld	a4,8(a5)
     850:	00002797          	auipc	a5,0x2
     854:	a1878793          	addi	a5,a5,-1512 # 2268 <current>
     858:	e398                	sd	a4,0(a5)
        list_del(to_remove);
     85a:	fd043503          	ld	a0,-48(s0)
     85e:	00000097          	auipc	ra,0x0
     862:	840080e7          	jalr	-1984(ra) # 9e <list_del>
        list_add_tail(to_remove, &run_queue);
     866:	00002597          	auipc	a1,0x2
     86a:	9ba58593          	addi	a1,a1,-1606 # 2220 <run_queue>
     86e:	fd043503          	ld	a0,-48(s0)
     872:	fffff097          	auipc	ra,0xfffff
     876:	7d0080e7          	jalr	2000(ra) # 42 <list_add_tail>
    }

    __release();
     87a:	00000097          	auipc	ra,0x0
     87e:	ab0080e7          	jalr	-1360(ra) # 32a <__release>
    __schedule();
     882:	00000097          	auipc	ra,0x0
     886:	1f8080e7          	jalr	504(ra) # a7a <__schedule>
    __dispatch();
     88a:	00000097          	auipc	ra,0x0
     88e:	026080e7          	jalr	38(ra) # 8b0 <__dispatch>
    thrdresume(main_thrd_id);
     892:	00002797          	auipc	a5,0x2
     896:	9c278793          	addi	a5,a5,-1598 # 2254 <main_thrd_id>
     89a:	439c                	lw	a5,0(a5)
     89c:	853e                	mv	a0,a5
     89e:	00001097          	auipc	ra,0x1
     8a2:	950080e7          	jalr	-1712(ra) # 11ee <thrdresume>
}
     8a6:	0001                	nop
     8a8:	70e2                	ld	ra,56(sp)
     8aa:	7442                	ld	s0,48(sp)
     8ac:	6121                	addi	sp,sp,64
     8ae:	8082                	ret

00000000000008b0 <__dispatch>:

void __dispatch()
{
     8b0:	7179                	addi	sp,sp,-48
     8b2:	f406                	sd	ra,40(sp)
     8b4:	f022                	sd	s0,32(sp)
     8b6:	1800                	addi	s0,sp,48
    if (current == &run_queue) {
     8b8:	00002797          	auipc	a5,0x2
     8bc:	9b078793          	addi	a5,a5,-1616 # 2268 <current>
     8c0:	6398                	ld	a4,0(a5)
     8c2:	00002797          	auipc	a5,0x2
     8c6:	95e78793          	addi	a5,a5,-1698 # 2220 <run_queue>
     8ca:	1af70363          	beq	a4,a5,a70 <__dispatch+0x1c0>
    if (allocated_time < 0) {
        fprintf(2, "[FATAL] allocated_time is negative\n");
        exit(1);
    }
    
    struct thread *current_thread = list_entry(current, struct thread, thread_list);
     8ce:	00002797          	auipc	a5,0x2
     8d2:	99a78793          	addi	a5,a5,-1638 # 2268 <current>
     8d6:	639c                	ld	a5,0(a5)
     8d8:	fef43423          	sd	a5,-24(s0)
     8dc:	fe843783          	ld	a5,-24(s0)
     8e0:	fd878793          	addi	a5,a5,-40
     8e4:	fef43023          	sd	a5,-32(s0)
    printf("    my print:dispatch thread#%d at %d: allocated_time=%d, remaining_time= %d \n", current_thread->ID, threading_system_time, allocated_time,current_thread->remaining_time);
     8e8:	fe043783          	ld	a5,-32(s0)
     8ec:	5fcc                	lw	a1,60(a5)
     8ee:	00002797          	auipc	a5,0x2
     8f2:	98278793          	addi	a5,a5,-1662 # 2270 <threading_system_time>
     8f6:	4390                	lw	a2,0(a5)
     8f8:	00002797          	auipc	a5,0x2
     8fc:	98078793          	addi	a5,a5,-1664 # 2278 <allocated_time>
     900:	6394                	ld	a3,0(a5)
     902:	fe043783          	ld	a5,-32(s0)
     906:	4bfc                	lw	a5,84(a5)
     908:	873e                	mv	a4,a5
     90a:	00001517          	auipc	a0,0x1
     90e:	74e50513          	addi	a0,a0,1870 # 2058 <schedule_edf_cbs+0x58c>
     912:	00001097          	auipc	ra,0x1
     916:	d7a080e7          	jalr	-646(ra) # 168c <printf>

    if (current_thread->is_real_time && allocated_time == 0 && current_thread->cbs.is_hard_rt) {
     91a:	fe043783          	ld	a5,-32(s0)
     91e:	43bc                	lw	a5,64(a5)
     920:	c3a1                	beqz	a5,960 <__dispatch+0xb0>
     922:	00002797          	auipc	a5,0x2
     926:	95678793          	addi	a5,a5,-1706 # 2278 <allocated_time>
     92a:	639c                	ld	a5,0(a5)
     92c:	eb95                	bnez	a5,960 <__dispatch+0xb0>
     92e:	fe043783          	ld	a5,-32(s0)
     932:	57fc                	lw	a5,108(a5)
     934:	c795                	beqz	a5,960 <__dispatch+0xb0>
        printf("thread#%d misses a deadline at %d in dispatch\n", current_thread->ID, current_thread->current_deadline);
     936:	fe043783          	ld	a5,-32(s0)
     93a:	5fd8                	lw	a4,60(a5)
     93c:	fe043783          	ld	a5,-32(s0)
     940:	4fbc                	lw	a5,88(a5)
     942:	863e                	mv	a2,a5
     944:	85ba                	mv	a1,a4
     946:	00001517          	auipc	a0,0x1
     94a:	76250513          	addi	a0,a0,1890 # 20a8 <schedule_edf_cbs+0x5dc>
     94e:	00001097          	auipc	ra,0x1
     952:	d3e080e7          	jalr	-706(ra) # 168c <printf>
        exit(0);
     956:	4501                	li	a0,0
     958:	00000097          	auipc	ra,0x0
     95c:	7ee080e7          	jalr	2030(ra) # 1146 <exit>
    }

    printf("dispatch thread#%d at %d: allocated_time=%d\n", current_thread->ID, threading_system_time, allocated_time);
     960:	fe043783          	ld	a5,-32(s0)
     964:	5fd8                	lw	a4,60(a5)
     966:	00002797          	auipc	a5,0x2
     96a:	90a78793          	addi	a5,a5,-1782 # 2270 <threading_system_time>
     96e:	4390                	lw	a2,0(a5)
     970:	00002797          	auipc	a5,0x2
     974:	90878793          	addi	a5,a5,-1784 # 2278 <allocated_time>
     978:	639c                	ld	a5,0(a5)
     97a:	86be                	mv	a3,a5
     97c:	85ba                	mv	a1,a4
     97e:	00001517          	auipc	a0,0x1
     982:	75a50513          	addi	a0,a0,1882 # 20d8 <schedule_edf_cbs+0x60c>
     986:	00001097          	auipc	ra,0x1
     98a:	d06080e7          	jalr	-762(ra) # 168c <printf>

    if (current_thread->buf_set) {
     98e:	fe043783          	ld	a5,-32(s0)
     992:	539c                	lw	a5,32(a5)
     994:	c7a1                	beqz	a5,9dc <__dispatch+0x12c>
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
     996:	00002797          	auipc	a5,0x2
     99a:	8e278793          	addi	a5,a5,-1822 # 2278 <allocated_time>
     99e:	639c                	ld	a5,0(a5)
     9a0:	0007871b          	sext.w	a4,a5
     9a4:	fe043783          	ld	a5,-32(s0)
     9a8:	03878593          	addi	a1,a5,56
     9ac:	00002797          	auipc	a5,0x2
     9b0:	8cc78793          	addi	a5,a5,-1844 # 2278 <allocated_time>
     9b4:	639c                	ld	a5,0(a5)
     9b6:	86be                	mv	a3,a5
     9b8:	00000617          	auipc	a2,0x0
     9bc:	d4c60613          	addi	a2,a2,-692 # 704 <switch_handler>
     9c0:	853a                	mv	a0,a4
     9c2:	00001097          	auipc	ra,0x1
     9c6:	824080e7          	jalr	-2012(ra) # 11e6 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id);
     9ca:	fe043783          	ld	a5,-32(s0)
     9ce:	5f9c                	lw	a5,56(a5)
     9d0:	853e                	mv	a0,a5
     9d2:	00001097          	auipc	ra,0x1
     9d6:	81c080e7          	jalr	-2020(ra) # 11ee <thrdresume>
     9da:	a071                	j	a66 <__dispatch+0x1b6>
    } else {
        current_thread->buf_set = 1;
     9dc:	fe043783          	ld	a5,-32(s0)
     9e0:	4705                	li	a4,1
     9e2:	d398                	sw	a4,32(a5)
        unsigned long new_stack_p = (unsigned long)current_thread->stack_p;
     9e4:	fe043783          	ld	a5,-32(s0)
     9e8:	6f9c                	ld	a5,24(a5)
     9ea:	fcf43c23          	sd	a5,-40(s0)
        current_thread->thrdstop_context_id = -1;
     9ee:	fe043783          	ld	a5,-32(s0)
     9f2:	577d                	li	a4,-1
     9f4:	df98                	sw	a4,56(a5)
        thrdstop(allocated_time, &(current_thread->thrdstop_context_id), switch_handler, (void *)allocated_time);
     9f6:	00002797          	auipc	a5,0x2
     9fa:	88278793          	addi	a5,a5,-1918 # 2278 <allocated_time>
     9fe:	639c                	ld	a5,0(a5)
     a00:	0007871b          	sext.w	a4,a5
     a04:	fe043783          	ld	a5,-32(s0)
     a08:	03878593          	addi	a1,a5,56
     a0c:	00002797          	auipc	a5,0x2
     a10:	86c78793          	addi	a5,a5,-1940 # 2278 <allocated_time>
     a14:	639c                	ld	a5,0(a5)
     a16:	86be                	mv	a3,a5
     a18:	00000617          	auipc	a2,0x0
     a1c:	cec60613          	addi	a2,a2,-788 # 704 <switch_handler>
     a20:	853a                	mv	a0,a4
     a22:	00000097          	auipc	ra,0x0
     a26:	7c4080e7          	jalr	1988(ra) # 11e6 <thrdstop>
        if (current_thread->thrdstop_context_id < 0) {
     a2a:	fe043783          	ld	a5,-32(s0)
     a2e:	5f9c                	lw	a5,56(a5)
     a30:	0207d063          	bgez	a5,a50 <__dispatch+0x1a0>
            fprintf(2, "[ERROR] number of threads may exceed MAX_THRD_NUM\n");
     a34:	00001597          	auipc	a1,0x1
     a38:	6d458593          	addi	a1,a1,1748 # 2108 <schedule_edf_cbs+0x63c>
     a3c:	4509                	li	a0,2
     a3e:	00001097          	auipc	ra,0x1
     a42:	bf6080e7          	jalr	-1034(ra) # 1634 <fprintf>
            exit(1);
     a46:	4505                	li	a0,1
     a48:	00000097          	auipc	ra,0x0
     a4c:	6fe080e7          	jalr	1790(ra) # 1146 <exit>
        }

        // set sp to stack pointer of current thread.
        asm volatile("mv sp, %0"
     a50:	fd843783          	ld	a5,-40(s0)
     a54:	813e                	mv	sp,a5
                     :
                     : "r"(new_stack_p));
        current_thread->fp(current_thread->arg);
     a56:	fe043783          	ld	a5,-32(s0)
     a5a:	6398                	ld	a4,0(a5)
     a5c:	fe043783          	ld	a5,-32(s0)
     a60:	679c                	ld	a5,8(a5)
     a62:	853e                	mv	a0,a5
     a64:	9702                	jalr	a4
    }
    thread_exit();
     a66:	00000097          	auipc	ra,0x0
     a6a:	a5a080e7          	jalr	-1446(ra) # 4c0 <thread_exit>
     a6e:	a011                	j	a72 <__dispatch+0x1c2>
        return;
     a70:	0001                	nop
}
     a72:	70a2                	ld	ra,40(sp)
     a74:	7402                	ld	s0,32(sp)
     a76:	6145                	addi	sp,sp,48
     a78:	8082                	ret

0000000000000a7a <__schedule>:

void __schedule()
{
     a7a:	711d                	addi	sp,sp,-96
     a7c:	ec86                	sd	ra,88(sp)
     a7e:	e8a2                	sd	s0,80(sp)
     a80:	1080                	addi	s0,sp,96
    struct threads_sched_args args = {
     a82:	00001797          	auipc	a5,0x1
     a86:	7ee78793          	addi	a5,a5,2030 # 2270 <threading_system_time>
     a8a:	439c                	lw	a5,0(a5)
     a8c:	fcf42c23          	sw	a5,-40(s0)
     a90:	4789                	li	a5,2
     a92:	fcf42e23          	sw	a5,-36(s0)
     a96:	00001797          	auipc	a5,0x1
     a9a:	78a78793          	addi	a5,a5,1930 # 2220 <run_queue>
     a9e:	fef43023          	sd	a5,-32(s0)
     aa2:	00001797          	auipc	a5,0x1
     aa6:	78e78793          	addi	a5,a5,1934 # 2230 <release_queue>
     aaa:	fef43423          	sd	a5,-24(s0)
#ifdef THREAD_SCHEDULER_PRIORITY_RR
    r = schedule_priority_rr(args);
#endif

#ifdef THREAD_SCHEDULER_EDF_CBS
    r = schedule_edf_cbs(args);
     aae:	fd843783          	ld	a5,-40(s0)
     ab2:	faf43023          	sd	a5,-96(s0)
     ab6:	fe043783          	ld	a5,-32(s0)
     aba:	faf43423          	sd	a5,-88(s0)
     abe:	fe843783          	ld	a5,-24(s0)
     ac2:	faf43823          	sd	a5,-80(s0)
     ac6:	fa040793          	addi	a5,s0,-96
     aca:	853e                	mv	a0,a5
     acc:	00001097          	auipc	ra,0x1
     ad0:	000080e7          	jalr	ra # 1acc <schedule_edf_cbs>
     ad4:	872a                	mv	a4,a0
     ad6:	87ae                	mv	a5,a1
     ad8:	fce43423          	sd	a4,-56(s0)
     adc:	fcf43823          	sd	a5,-48(s0)
//     r = schedule_edf_cbs(args);
// #else
//     r = schedule_default(args);
// #endif

    current = r.scheduled_thread_list_member;
     ae0:	fc843703          	ld	a4,-56(s0)
     ae4:	00001797          	auipc	a5,0x1
     ae8:	78478793          	addi	a5,a5,1924 # 2268 <current>
     aec:	e398                	sd	a4,0(a5)
    allocated_time = r.allocated_time;
     aee:	fd042783          	lw	a5,-48(s0)
     af2:	873e                	mv	a4,a5
     af4:	00001797          	auipc	a5,0x1
     af8:	78478793          	addi	a5,a5,1924 # 2278 <allocated_time>
     afc:	e398                	sd	a4,0(a5)
}
     afe:	0001                	nop
     b00:	60e6                	ld	ra,88(sp)
     b02:	6446                	ld	s0,80(sp)
     b04:	6125                	addi	sp,sp,96
     b06:	8082                	ret

0000000000000b08 <back_to_main_handler>:

void back_to_main_handler(void *arg)
{
     b08:	1101                	addi	sp,sp,-32
     b0a:	ec06                	sd	ra,24(sp)
     b0c:	e822                	sd	s0,16(sp)
     b0e:	1000                	addi	s0,sp,32
     b10:	fea43423          	sd	a0,-24(s0)
    sleeping = 0;
     b14:	00001797          	auipc	a5,0x1
     b18:	76078793          	addi	a5,a5,1888 # 2274 <sleeping>
     b1c:	0007a023          	sw	zero,0(a5)
    threading_system_time += (uint64)arg;
     b20:	fe843783          	ld	a5,-24(s0)
     b24:	0007871b          	sext.w	a4,a5
     b28:	00001797          	auipc	a5,0x1
     b2c:	74878793          	addi	a5,a5,1864 # 2270 <threading_system_time>
     b30:	439c                	lw	a5,0(a5)
     b32:	2781                	sext.w	a5,a5
     b34:	9fb9                	addw	a5,a5,a4
     b36:	2781                	sext.w	a5,a5
     b38:	0007871b          	sext.w	a4,a5
     b3c:	00001797          	auipc	a5,0x1
     b40:	73478793          	addi	a5,a5,1844 # 2270 <threading_system_time>
     b44:	c398                	sw	a4,0(a5)
    thrdresume(main_thrd_id);
     b46:	00001797          	auipc	a5,0x1
     b4a:	70e78793          	addi	a5,a5,1806 # 2254 <main_thrd_id>
     b4e:	439c                	lw	a5,0(a5)
     b50:	853e                	mv	a0,a5
     b52:	00000097          	auipc	ra,0x0
     b56:	69c080e7          	jalr	1692(ra) # 11ee <thrdresume>
}
     b5a:	0001                	nop
     b5c:	60e2                	ld	ra,24(sp)
     b5e:	6442                	ld	s0,16(sp)
     b60:	6105                	addi	sp,sp,32
     b62:	8082                	ret

0000000000000b64 <thread_start_threading>:

void thread_start_threading()
{
     b64:	1141                	addi	sp,sp,-16
     b66:	e406                	sd	ra,8(sp)
     b68:	e022                	sd	s0,0(sp)
     b6a:	0800                	addi	s0,sp,16
    threading_system_time = 0;
     b6c:	00001797          	auipc	a5,0x1
     b70:	70478793          	addi	a5,a5,1796 # 2270 <threading_system_time>
     b74:	0007a023          	sw	zero,0(a5)
    current = &run_queue;
     b78:	00001797          	auipc	a5,0x1
     b7c:	6f078793          	addi	a5,a5,1776 # 2268 <current>
     b80:	00001717          	auipc	a4,0x1
     b84:	6a070713          	addi	a4,a4,1696 # 2220 <run_queue>
     b88:	e398                	sd	a4,0(a5)

    // call thrdstop just for obtain an ID
    thrdstop(1000, &main_thrd_id, back_to_main_handler, (void *)0);
     b8a:	4681                	li	a3,0
     b8c:	00000617          	auipc	a2,0x0
     b90:	f7c60613          	addi	a2,a2,-132 # b08 <back_to_main_handler>
     b94:	00001597          	auipc	a1,0x1
     b98:	6c058593          	addi	a1,a1,1728 # 2254 <main_thrd_id>
     b9c:	3e800513          	li	a0,1000
     ba0:	00000097          	auipc	ra,0x0
     ba4:	646080e7          	jalr	1606(ra) # 11e6 <thrdstop>
    cancelthrdstop(main_thrd_id, 0);
     ba8:	00001797          	auipc	a5,0x1
     bac:	6ac78793          	addi	a5,a5,1708 # 2254 <main_thrd_id>
     bb0:	439c                	lw	a5,0(a5)
     bb2:	4581                	li	a1,0
     bb4:	853e                	mv	a0,a5
     bb6:	00000097          	auipc	ra,0x0
     bba:	640080e7          	jalr	1600(ra) # 11f6 <cancelthrdstop>

    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
     bbe:	a0c9                	j	c80 <thread_start_threading+0x11c>
        __release();
     bc0:	fffff097          	auipc	ra,0xfffff
     bc4:	76a080e7          	jalr	1898(ra) # 32a <__release>
        __schedule();
     bc8:	00000097          	auipc	ra,0x0
     bcc:	eb2080e7          	jalr	-334(ra) # a7a <__schedule>
        cancelthrdstop(main_thrd_id, 0);
     bd0:	00001797          	auipc	a5,0x1
     bd4:	68478793          	addi	a5,a5,1668 # 2254 <main_thrd_id>
     bd8:	439c                	lw	a5,0(a5)
     bda:	4581                	li	a1,0
     bdc:	853e                	mv	a0,a5
     bde:	00000097          	auipc	ra,0x0
     be2:	618080e7          	jalr	1560(ra) # 11f6 <cancelthrdstop>
        __dispatch();
     be6:	00000097          	auipc	ra,0x0
     bea:	cca080e7          	jalr	-822(ra) # 8b0 <__dispatch>

        if (list_empty(&run_queue) && list_empty(&release_queue)) {
     bee:	00001517          	auipc	a0,0x1
     bf2:	63250513          	addi	a0,a0,1586 # 2220 <run_queue>
     bf6:	fffff097          	auipc	ra,0xfffff
     bfa:	4f2080e7          	jalr	1266(ra) # e8 <list_empty>
     bfe:	87aa                	mv	a5,a0
     c00:	cb99                	beqz	a5,c16 <thread_start_threading+0xb2>
     c02:	00001517          	auipc	a0,0x1
     c06:	62e50513          	addi	a0,a0,1582 # 2230 <release_queue>
     c0a:	fffff097          	auipc	ra,0xfffff
     c0e:	4de080e7          	jalr	1246(ra) # e8 <list_empty>
     c12:	87aa                	mv	a5,a0
     c14:	ebd9                	bnez	a5,caa <thread_start_threading+0x146>
            break;
        }

        // no thread in run_queue, release_queue not empty
        printf("run_queue is empty, sleep for %d ticks\n", allocated_time);
     c16:	00001797          	auipc	a5,0x1
     c1a:	66278793          	addi	a5,a5,1634 # 2278 <allocated_time>
     c1e:	639c                	ld	a5,0(a5)
     c20:	85be                	mv	a1,a5
     c22:	00001517          	auipc	a0,0x1
     c26:	51e50513          	addi	a0,a0,1310 # 2140 <schedule_edf_cbs+0x674>
     c2a:	00001097          	auipc	ra,0x1
     c2e:	a62080e7          	jalr	-1438(ra) # 168c <printf>
        sleeping = 1;
     c32:	00001797          	auipc	a5,0x1
     c36:	64278793          	addi	a5,a5,1602 # 2274 <sleeping>
     c3a:	4705                	li	a4,1
     c3c:	c398                	sw	a4,0(a5)
        thrdstop(allocated_time, &main_thrd_id, back_to_main_handler, (void *)allocated_time);
     c3e:	00001797          	auipc	a5,0x1
     c42:	63a78793          	addi	a5,a5,1594 # 2278 <allocated_time>
     c46:	639c                	ld	a5,0(a5)
     c48:	0007871b          	sext.w	a4,a5
     c4c:	00001797          	auipc	a5,0x1
     c50:	62c78793          	addi	a5,a5,1580 # 2278 <allocated_time>
     c54:	639c                	ld	a5,0(a5)
     c56:	86be                	mv	a3,a5
     c58:	00000617          	auipc	a2,0x0
     c5c:	eb060613          	addi	a2,a2,-336 # b08 <back_to_main_handler>
     c60:	00001597          	auipc	a1,0x1
     c64:	5f458593          	addi	a1,a1,1524 # 2254 <main_thrd_id>
     c68:	853a                	mv	a0,a4
     c6a:	00000097          	auipc	ra,0x0
     c6e:	57c080e7          	jalr	1404(ra) # 11e6 <thrdstop>
        while (sleeping) {
     c72:	0001                	nop
     c74:	00001797          	auipc	a5,0x1
     c78:	60078793          	addi	a5,a5,1536 # 2274 <sleeping>
     c7c:	439c                	lw	a5,0(a5)
     c7e:	fbfd                	bnez	a5,c74 <thread_start_threading+0x110>
    while (!list_empty(&run_queue) || !list_empty(&release_queue)) {
     c80:	00001517          	auipc	a0,0x1
     c84:	5a050513          	addi	a0,a0,1440 # 2220 <run_queue>
     c88:	fffff097          	auipc	ra,0xfffff
     c8c:	460080e7          	jalr	1120(ra) # e8 <list_empty>
     c90:	87aa                	mv	a5,a0
     c92:	d79d                	beqz	a5,bc0 <thread_start_threading+0x5c>
     c94:	00001517          	auipc	a0,0x1
     c98:	59c50513          	addi	a0,a0,1436 # 2230 <release_queue>
     c9c:	fffff097          	auipc	ra,0xfffff
     ca0:	44c080e7          	jalr	1100(ra) # e8 <list_empty>
     ca4:	87aa                	mv	a5,a0
     ca6:	df89                	beqz	a5,bc0 <thread_start_threading+0x5c>
            // zzz...
        }
    }
}
     ca8:	a011                	j	cac <thread_start_threading+0x148>
            break;
     caa:	0001                	nop
}
     cac:	0001                	nop
     cae:	60a2                	ld	ra,8(sp)
     cb0:	6402                	ld	s0,0(sp)
     cb2:	0141                	addi	sp,sp,16
     cb4:	8082                	ret

0000000000000cb6 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     cb6:	7179                	addi	sp,sp,-48
     cb8:	f422                	sd	s0,40(sp)
     cba:	1800                	addi	s0,sp,48
     cbc:	fca43c23          	sd	a0,-40(s0)
     cc0:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     cc4:	fd843783          	ld	a5,-40(s0)
     cc8:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     ccc:	0001                	nop
     cce:	fd043703          	ld	a4,-48(s0)
     cd2:	00170793          	addi	a5,a4,1
     cd6:	fcf43823          	sd	a5,-48(s0)
     cda:	fd843783          	ld	a5,-40(s0)
     cde:	00178693          	addi	a3,a5,1
     ce2:	fcd43c23          	sd	a3,-40(s0)
     ce6:	00074703          	lbu	a4,0(a4)
     cea:	00e78023          	sb	a4,0(a5)
     cee:	0007c783          	lbu	a5,0(a5)
     cf2:	fff1                	bnez	a5,cce <strcpy+0x18>
    ;
  return os;
     cf4:	fe843783          	ld	a5,-24(s0)
}
     cf8:	853e                	mv	a0,a5
     cfa:	7422                	ld	s0,40(sp)
     cfc:	6145                	addi	sp,sp,48
     cfe:	8082                	ret

0000000000000d00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     d00:	1101                	addi	sp,sp,-32
     d02:	ec22                	sd	s0,24(sp)
     d04:	1000                	addi	s0,sp,32
     d06:	fea43423          	sd	a0,-24(s0)
     d0a:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     d0e:	a819                	j	d24 <strcmp+0x24>
    p++, q++;
     d10:	fe843783          	ld	a5,-24(s0)
     d14:	0785                	addi	a5,a5,1
     d16:	fef43423          	sd	a5,-24(s0)
     d1a:	fe043783          	ld	a5,-32(s0)
     d1e:	0785                	addi	a5,a5,1
     d20:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     d24:	fe843783          	ld	a5,-24(s0)
     d28:	0007c783          	lbu	a5,0(a5)
     d2c:	cb99                	beqz	a5,d42 <strcmp+0x42>
     d2e:	fe843783          	ld	a5,-24(s0)
     d32:	0007c703          	lbu	a4,0(a5)
     d36:	fe043783          	ld	a5,-32(s0)
     d3a:	0007c783          	lbu	a5,0(a5)
     d3e:	fcf709e3          	beq	a4,a5,d10 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
     d42:	fe843783          	ld	a5,-24(s0)
     d46:	0007c783          	lbu	a5,0(a5)
     d4a:	0007871b          	sext.w	a4,a5
     d4e:	fe043783          	ld	a5,-32(s0)
     d52:	0007c783          	lbu	a5,0(a5)
     d56:	2781                	sext.w	a5,a5
     d58:	40f707bb          	subw	a5,a4,a5
     d5c:	2781                	sext.w	a5,a5
}
     d5e:	853e                	mv	a0,a5
     d60:	6462                	ld	s0,24(sp)
     d62:	6105                	addi	sp,sp,32
     d64:	8082                	ret

0000000000000d66 <strlen>:

uint
strlen(const char *s)
{
     d66:	7179                	addi	sp,sp,-48
     d68:	f422                	sd	s0,40(sp)
     d6a:	1800                	addi	s0,sp,48
     d6c:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
     d70:	fe042623          	sw	zero,-20(s0)
     d74:	a031                	j	d80 <strlen+0x1a>
     d76:	fec42783          	lw	a5,-20(s0)
     d7a:	2785                	addiw	a5,a5,1
     d7c:	fef42623          	sw	a5,-20(s0)
     d80:	fec42783          	lw	a5,-20(s0)
     d84:	fd843703          	ld	a4,-40(s0)
     d88:	97ba                	add	a5,a5,a4
     d8a:	0007c783          	lbu	a5,0(a5)
     d8e:	f7e5                	bnez	a5,d76 <strlen+0x10>
    ;
  return n;
     d90:	fec42783          	lw	a5,-20(s0)
}
     d94:	853e                	mv	a0,a5
     d96:	7422                	ld	s0,40(sp)
     d98:	6145                	addi	sp,sp,48
     d9a:	8082                	ret

0000000000000d9c <memset>:

void*
memset(void *dst, int c, uint n)
{
     d9c:	7179                	addi	sp,sp,-48
     d9e:	f422                	sd	s0,40(sp)
     da0:	1800                	addi	s0,sp,48
     da2:	fca43c23          	sd	a0,-40(s0)
     da6:	87ae                	mv	a5,a1
     da8:	8732                	mv	a4,a2
     daa:	fcf42a23          	sw	a5,-44(s0)
     dae:	87ba                	mv	a5,a4
     db0:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
     db4:	fd843783          	ld	a5,-40(s0)
     db8:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
     dbc:	fe042623          	sw	zero,-20(s0)
     dc0:	a00d                	j	de2 <memset+0x46>
    cdst[i] = c;
     dc2:	fec42783          	lw	a5,-20(s0)
     dc6:	fe043703          	ld	a4,-32(s0)
     dca:	97ba                	add	a5,a5,a4
     dcc:	fd442703          	lw	a4,-44(s0)
     dd0:	0ff77713          	andi	a4,a4,255
     dd4:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
     dd8:	fec42783          	lw	a5,-20(s0)
     ddc:	2785                	addiw	a5,a5,1
     dde:	fef42623          	sw	a5,-20(s0)
     de2:	fec42703          	lw	a4,-20(s0)
     de6:	fd042783          	lw	a5,-48(s0)
     dea:	2781                	sext.w	a5,a5
     dec:	fcf76be3          	bltu	a4,a5,dc2 <memset+0x26>
  }
  return dst;
     df0:	fd843783          	ld	a5,-40(s0)
}
     df4:	853e                	mv	a0,a5
     df6:	7422                	ld	s0,40(sp)
     df8:	6145                	addi	sp,sp,48
     dfa:	8082                	ret

0000000000000dfc <strchr>:

char*
strchr(const char *s, char c)
{
     dfc:	1101                	addi	sp,sp,-32
     dfe:	ec22                	sd	s0,24(sp)
     e00:	1000                	addi	s0,sp,32
     e02:	fea43423          	sd	a0,-24(s0)
     e06:	87ae                	mv	a5,a1
     e08:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
     e0c:	a01d                	j	e32 <strchr+0x36>
    if(*s == c)
     e0e:	fe843783          	ld	a5,-24(s0)
     e12:	0007c703          	lbu	a4,0(a5)
     e16:	fe744783          	lbu	a5,-25(s0)
     e1a:	0ff7f793          	andi	a5,a5,255
     e1e:	00e79563          	bne	a5,a4,e28 <strchr+0x2c>
      return (char*)s;
     e22:	fe843783          	ld	a5,-24(s0)
     e26:	a821                	j	e3e <strchr+0x42>
  for(; *s; s++)
     e28:	fe843783          	ld	a5,-24(s0)
     e2c:	0785                	addi	a5,a5,1
     e2e:	fef43423          	sd	a5,-24(s0)
     e32:	fe843783          	ld	a5,-24(s0)
     e36:	0007c783          	lbu	a5,0(a5)
     e3a:	fbf1                	bnez	a5,e0e <strchr+0x12>
  return 0;
     e3c:	4781                	li	a5,0
}
     e3e:	853e                	mv	a0,a5
     e40:	6462                	ld	s0,24(sp)
     e42:	6105                	addi	sp,sp,32
     e44:	8082                	ret

0000000000000e46 <gets>:

char*
gets(char *buf, int max)
{
     e46:	7179                	addi	sp,sp,-48
     e48:	f406                	sd	ra,40(sp)
     e4a:	f022                	sd	s0,32(sp)
     e4c:	1800                	addi	s0,sp,48
     e4e:	fca43c23          	sd	a0,-40(s0)
     e52:	87ae                	mv	a5,a1
     e54:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e58:	fe042623          	sw	zero,-20(s0)
     e5c:	a8a1                	j	eb4 <gets+0x6e>
    cc = read(0, &c, 1);
     e5e:	fe740793          	addi	a5,s0,-25
     e62:	4605                	li	a2,1
     e64:	85be                	mv	a1,a5
     e66:	4501                	li	a0,0
     e68:	00000097          	auipc	ra,0x0
     e6c:	2f6080e7          	jalr	758(ra) # 115e <read>
     e70:	87aa                	mv	a5,a0
     e72:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
     e76:	fe842783          	lw	a5,-24(s0)
     e7a:	2781                	sext.w	a5,a5
     e7c:	04f05763          	blez	a5,eca <gets+0x84>
      break;
    buf[i++] = c;
     e80:	fec42783          	lw	a5,-20(s0)
     e84:	0017871b          	addiw	a4,a5,1
     e88:	fee42623          	sw	a4,-20(s0)
     e8c:	873e                	mv	a4,a5
     e8e:	fd843783          	ld	a5,-40(s0)
     e92:	97ba                	add	a5,a5,a4
     e94:	fe744703          	lbu	a4,-25(s0)
     e98:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
     e9c:	fe744783          	lbu	a5,-25(s0)
     ea0:	873e                	mv	a4,a5
     ea2:	47a9                	li	a5,10
     ea4:	02f70463          	beq	a4,a5,ecc <gets+0x86>
     ea8:	fe744783          	lbu	a5,-25(s0)
     eac:	873e                	mv	a4,a5
     eae:	47b5                	li	a5,13
     eb0:	00f70e63          	beq	a4,a5,ecc <gets+0x86>
  for(i=0; i+1 < max; ){
     eb4:	fec42783          	lw	a5,-20(s0)
     eb8:	2785                	addiw	a5,a5,1
     eba:	0007871b          	sext.w	a4,a5
     ebe:	fd442783          	lw	a5,-44(s0)
     ec2:	2781                	sext.w	a5,a5
     ec4:	f8f74de3          	blt	a4,a5,e5e <gets+0x18>
     ec8:	a011                	j	ecc <gets+0x86>
      break;
     eca:	0001                	nop
      break;
  }
  buf[i] = '\0';
     ecc:	fec42783          	lw	a5,-20(s0)
     ed0:	fd843703          	ld	a4,-40(s0)
     ed4:	97ba                	add	a5,a5,a4
     ed6:	00078023          	sb	zero,0(a5)
  return buf;
     eda:	fd843783          	ld	a5,-40(s0)
}
     ede:	853e                	mv	a0,a5
     ee0:	70a2                	ld	ra,40(sp)
     ee2:	7402                	ld	s0,32(sp)
     ee4:	6145                	addi	sp,sp,48
     ee6:	8082                	ret

0000000000000ee8 <stat>:

int
stat(const char *n, struct stat *st)
{
     ee8:	7179                	addi	sp,sp,-48
     eea:	f406                	sd	ra,40(sp)
     eec:	f022                	sd	s0,32(sp)
     eee:	1800                	addi	s0,sp,48
     ef0:	fca43c23          	sd	a0,-40(s0)
     ef4:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ef8:	4581                	li	a1,0
     efa:	fd843503          	ld	a0,-40(s0)
     efe:	00000097          	auipc	ra,0x0
     f02:	288080e7          	jalr	648(ra) # 1186 <open>
     f06:	87aa                	mv	a5,a0
     f08:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
     f0c:	fec42783          	lw	a5,-20(s0)
     f10:	2781                	sext.w	a5,a5
     f12:	0007d463          	bgez	a5,f1a <stat+0x32>
    return -1;
     f16:	57fd                	li	a5,-1
     f18:	a035                	j	f44 <stat+0x5c>
  r = fstat(fd, st);
     f1a:	fec42783          	lw	a5,-20(s0)
     f1e:	fd043583          	ld	a1,-48(s0)
     f22:	853e                	mv	a0,a5
     f24:	00000097          	auipc	ra,0x0
     f28:	27a080e7          	jalr	634(ra) # 119e <fstat>
     f2c:	87aa                	mv	a5,a0
     f2e:	fef42423          	sw	a5,-24(s0)
  close(fd);
     f32:	fec42783          	lw	a5,-20(s0)
     f36:	853e                	mv	a0,a5
     f38:	00000097          	auipc	ra,0x0
     f3c:	236080e7          	jalr	566(ra) # 116e <close>
  return r;
     f40:	fe842783          	lw	a5,-24(s0)
}
     f44:	853e                	mv	a0,a5
     f46:	70a2                	ld	ra,40(sp)
     f48:	7402                	ld	s0,32(sp)
     f4a:	6145                	addi	sp,sp,48
     f4c:	8082                	ret

0000000000000f4e <atoi>:

int
atoi(const char *s)
{
     f4e:	7179                	addi	sp,sp,-48
     f50:	f422                	sd	s0,40(sp)
     f52:	1800                	addi	s0,sp,48
     f54:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
     f58:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
     f5c:	a815                	j	f90 <atoi+0x42>
    n = n*10 + *s++ - '0';
     f5e:	fec42703          	lw	a4,-20(s0)
     f62:	87ba                	mv	a5,a4
     f64:	0027979b          	slliw	a5,a5,0x2
     f68:	9fb9                	addw	a5,a5,a4
     f6a:	0017979b          	slliw	a5,a5,0x1
     f6e:	0007871b          	sext.w	a4,a5
     f72:	fd843783          	ld	a5,-40(s0)
     f76:	00178693          	addi	a3,a5,1
     f7a:	fcd43c23          	sd	a3,-40(s0)
     f7e:	0007c783          	lbu	a5,0(a5)
     f82:	2781                	sext.w	a5,a5
     f84:	9fb9                	addw	a5,a5,a4
     f86:	2781                	sext.w	a5,a5
     f88:	fd07879b          	addiw	a5,a5,-48
     f8c:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
     f90:	fd843783          	ld	a5,-40(s0)
     f94:	0007c783          	lbu	a5,0(a5)
     f98:	873e                	mv	a4,a5
     f9a:	02f00793          	li	a5,47
     f9e:	00e7fb63          	bgeu	a5,a4,fb4 <atoi+0x66>
     fa2:	fd843783          	ld	a5,-40(s0)
     fa6:	0007c783          	lbu	a5,0(a5)
     faa:	873e                	mv	a4,a5
     fac:	03900793          	li	a5,57
     fb0:	fae7f7e3          	bgeu	a5,a4,f5e <atoi+0x10>
  return n;
     fb4:	fec42783          	lw	a5,-20(s0)
}
     fb8:	853e                	mv	a0,a5
     fba:	7422                	ld	s0,40(sp)
     fbc:	6145                	addi	sp,sp,48
     fbe:	8082                	ret

0000000000000fc0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     fc0:	7139                	addi	sp,sp,-64
     fc2:	fc22                	sd	s0,56(sp)
     fc4:	0080                	addi	s0,sp,64
     fc6:	fca43c23          	sd	a0,-40(s0)
     fca:	fcb43823          	sd	a1,-48(s0)
     fce:	87b2                	mv	a5,a2
     fd0:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
     fd4:	fd843783          	ld	a5,-40(s0)
     fd8:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
     fdc:	fd043783          	ld	a5,-48(s0)
     fe0:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
     fe4:	fe043703          	ld	a4,-32(s0)
     fe8:	fe843783          	ld	a5,-24(s0)
     fec:	02e7fc63          	bgeu	a5,a4,1024 <memmove+0x64>
    while(n-- > 0)
     ff0:	a00d                	j	1012 <memmove+0x52>
      *dst++ = *src++;
     ff2:	fe043703          	ld	a4,-32(s0)
     ff6:	00170793          	addi	a5,a4,1
     ffa:	fef43023          	sd	a5,-32(s0)
     ffe:	fe843783          	ld	a5,-24(s0)
    1002:	00178693          	addi	a3,a5,1
    1006:	fed43423          	sd	a3,-24(s0)
    100a:	00074703          	lbu	a4,0(a4)
    100e:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    1012:	fcc42783          	lw	a5,-52(s0)
    1016:	fff7871b          	addiw	a4,a5,-1
    101a:	fce42623          	sw	a4,-52(s0)
    101e:	fcf04ae3          	bgtz	a5,ff2 <memmove+0x32>
    1022:	a891                	j	1076 <memmove+0xb6>
  } else {
    dst += n;
    1024:	fcc42783          	lw	a5,-52(s0)
    1028:	fe843703          	ld	a4,-24(s0)
    102c:	97ba                	add	a5,a5,a4
    102e:	fef43423          	sd	a5,-24(s0)
    src += n;
    1032:	fcc42783          	lw	a5,-52(s0)
    1036:	fe043703          	ld	a4,-32(s0)
    103a:	97ba                	add	a5,a5,a4
    103c:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    1040:	a01d                	j	1066 <memmove+0xa6>
      *--dst = *--src;
    1042:	fe043783          	ld	a5,-32(s0)
    1046:	17fd                	addi	a5,a5,-1
    1048:	fef43023          	sd	a5,-32(s0)
    104c:	fe843783          	ld	a5,-24(s0)
    1050:	17fd                	addi	a5,a5,-1
    1052:	fef43423          	sd	a5,-24(s0)
    1056:	fe043783          	ld	a5,-32(s0)
    105a:	0007c703          	lbu	a4,0(a5)
    105e:	fe843783          	ld	a5,-24(s0)
    1062:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    1066:	fcc42783          	lw	a5,-52(s0)
    106a:	fff7871b          	addiw	a4,a5,-1
    106e:	fce42623          	sw	a4,-52(s0)
    1072:	fcf048e3          	bgtz	a5,1042 <memmove+0x82>
  }
  return vdst;
    1076:	fd843783          	ld	a5,-40(s0)
}
    107a:	853e                	mv	a0,a5
    107c:	7462                	ld	s0,56(sp)
    107e:	6121                	addi	sp,sp,64
    1080:	8082                	ret

0000000000001082 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    1082:	7139                	addi	sp,sp,-64
    1084:	fc22                	sd	s0,56(sp)
    1086:	0080                	addi	s0,sp,64
    1088:	fca43c23          	sd	a0,-40(s0)
    108c:	fcb43823          	sd	a1,-48(s0)
    1090:	87b2                	mv	a5,a2
    1092:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
    1096:	fd843783          	ld	a5,-40(s0)
    109a:	fef43423          	sd	a5,-24(s0)
    109e:	fd043783          	ld	a5,-48(s0)
    10a2:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    10a6:	a0a1                	j	10ee <memcmp+0x6c>
    if (*p1 != *p2) {
    10a8:	fe843783          	ld	a5,-24(s0)
    10ac:	0007c703          	lbu	a4,0(a5)
    10b0:	fe043783          	ld	a5,-32(s0)
    10b4:	0007c783          	lbu	a5,0(a5)
    10b8:	02f70163          	beq	a4,a5,10da <memcmp+0x58>
      return *p1 - *p2;
    10bc:	fe843783          	ld	a5,-24(s0)
    10c0:	0007c783          	lbu	a5,0(a5)
    10c4:	0007871b          	sext.w	a4,a5
    10c8:	fe043783          	ld	a5,-32(s0)
    10cc:	0007c783          	lbu	a5,0(a5)
    10d0:	2781                	sext.w	a5,a5
    10d2:	40f707bb          	subw	a5,a4,a5
    10d6:	2781                	sext.w	a5,a5
    10d8:	a01d                	j	10fe <memcmp+0x7c>
    }
    p1++;
    10da:	fe843783          	ld	a5,-24(s0)
    10de:	0785                	addi	a5,a5,1
    10e0:	fef43423          	sd	a5,-24(s0)
    p2++;
    10e4:	fe043783          	ld	a5,-32(s0)
    10e8:	0785                	addi	a5,a5,1
    10ea:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    10ee:	fcc42783          	lw	a5,-52(s0)
    10f2:	fff7871b          	addiw	a4,a5,-1
    10f6:	fce42623          	sw	a4,-52(s0)
    10fa:	f7dd                	bnez	a5,10a8 <memcmp+0x26>
  }
  return 0;
    10fc:	4781                	li	a5,0
}
    10fe:	853e                	mv	a0,a5
    1100:	7462                	ld	s0,56(sp)
    1102:	6121                	addi	sp,sp,64
    1104:	8082                	ret

0000000000001106 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    1106:	7179                	addi	sp,sp,-48
    1108:	f406                	sd	ra,40(sp)
    110a:	f022                	sd	s0,32(sp)
    110c:	1800                	addi	s0,sp,48
    110e:	fea43423          	sd	a0,-24(s0)
    1112:	feb43023          	sd	a1,-32(s0)
    1116:	87b2                	mv	a5,a2
    1118:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    111c:	fdc42783          	lw	a5,-36(s0)
    1120:	863e                	mv	a2,a5
    1122:	fe043583          	ld	a1,-32(s0)
    1126:	fe843503          	ld	a0,-24(s0)
    112a:	00000097          	auipc	ra,0x0
    112e:	e96080e7          	jalr	-362(ra) # fc0 <memmove>
    1132:	87aa                	mv	a5,a0
}
    1134:	853e                	mv	a0,a5
    1136:	70a2                	ld	ra,40(sp)
    1138:	7402                	ld	s0,32(sp)
    113a:	6145                	addi	sp,sp,48
    113c:	8082                	ret

000000000000113e <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    113e:	4885                	li	a7,1
 ecall
    1140:	00000073          	ecall
 ret
    1144:	8082                	ret

0000000000001146 <exit>:
.global exit
exit:
 li a7, SYS_exit
    1146:	4889                	li	a7,2
 ecall
    1148:	00000073          	ecall
 ret
    114c:	8082                	ret

000000000000114e <wait>:
.global wait
wait:
 li a7, SYS_wait
    114e:	488d                	li	a7,3
 ecall
    1150:	00000073          	ecall
 ret
    1154:	8082                	ret

0000000000001156 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    1156:	4891                	li	a7,4
 ecall
    1158:	00000073          	ecall
 ret
    115c:	8082                	ret

000000000000115e <read>:
.global read
read:
 li a7, SYS_read
    115e:	4895                	li	a7,5
 ecall
    1160:	00000073          	ecall
 ret
    1164:	8082                	ret

0000000000001166 <write>:
.global write
write:
 li a7, SYS_write
    1166:	48c1                	li	a7,16
 ecall
    1168:	00000073          	ecall
 ret
    116c:	8082                	ret

000000000000116e <close>:
.global close
close:
 li a7, SYS_close
    116e:	48d5                	li	a7,21
 ecall
    1170:	00000073          	ecall
 ret
    1174:	8082                	ret

0000000000001176 <kill>:
.global kill
kill:
 li a7, SYS_kill
    1176:	4899                	li	a7,6
 ecall
    1178:	00000073          	ecall
 ret
    117c:	8082                	ret

000000000000117e <exec>:
.global exec
exec:
 li a7, SYS_exec
    117e:	489d                	li	a7,7
 ecall
    1180:	00000073          	ecall
 ret
    1184:	8082                	ret

0000000000001186 <open>:
.global open
open:
 li a7, SYS_open
    1186:	48bd                	li	a7,15
 ecall
    1188:	00000073          	ecall
 ret
    118c:	8082                	ret

000000000000118e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    118e:	48c5                	li	a7,17
 ecall
    1190:	00000073          	ecall
 ret
    1194:	8082                	ret

0000000000001196 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    1196:	48c9                	li	a7,18
 ecall
    1198:	00000073          	ecall
 ret
    119c:	8082                	ret

000000000000119e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    119e:	48a1                	li	a7,8
 ecall
    11a0:	00000073          	ecall
 ret
    11a4:	8082                	ret

00000000000011a6 <link>:
.global link
link:
 li a7, SYS_link
    11a6:	48cd                	li	a7,19
 ecall
    11a8:	00000073          	ecall
 ret
    11ac:	8082                	ret

00000000000011ae <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    11ae:	48d1                	li	a7,20
 ecall
    11b0:	00000073          	ecall
 ret
    11b4:	8082                	ret

00000000000011b6 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    11b6:	48a5                	li	a7,9
 ecall
    11b8:	00000073          	ecall
 ret
    11bc:	8082                	ret

00000000000011be <dup>:
.global dup
dup:
 li a7, SYS_dup
    11be:	48a9                	li	a7,10
 ecall
    11c0:	00000073          	ecall
 ret
    11c4:	8082                	ret

00000000000011c6 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    11c6:	48ad                	li	a7,11
 ecall
    11c8:	00000073          	ecall
 ret
    11cc:	8082                	ret

00000000000011ce <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    11ce:	48b1                	li	a7,12
 ecall
    11d0:	00000073          	ecall
 ret
    11d4:	8082                	ret

00000000000011d6 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    11d6:	48b5                	li	a7,13
 ecall
    11d8:	00000073          	ecall
 ret
    11dc:	8082                	ret

00000000000011de <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    11de:	48b9                	li	a7,14
 ecall
    11e0:	00000073          	ecall
 ret
    11e4:	8082                	ret

00000000000011e6 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
    11e6:	48d9                	li	a7,22
 ecall
    11e8:	00000073          	ecall
 ret
    11ec:	8082                	ret

00000000000011ee <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
    11ee:	48dd                	li	a7,23
 ecall
    11f0:	00000073          	ecall
 ret
    11f4:	8082                	ret

00000000000011f6 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
    11f6:	48e1                	li	a7,24
 ecall
    11f8:	00000073          	ecall
 ret
    11fc:	8082                	ret

00000000000011fe <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    11fe:	1101                	addi	sp,sp,-32
    1200:	ec06                	sd	ra,24(sp)
    1202:	e822                	sd	s0,16(sp)
    1204:	1000                	addi	s0,sp,32
    1206:	87aa                	mv	a5,a0
    1208:	872e                	mv	a4,a1
    120a:	fef42623          	sw	a5,-20(s0)
    120e:	87ba                	mv	a5,a4
    1210:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
    1214:	feb40713          	addi	a4,s0,-21
    1218:	fec42783          	lw	a5,-20(s0)
    121c:	4605                	li	a2,1
    121e:	85ba                	mv	a1,a4
    1220:	853e                	mv	a0,a5
    1222:	00000097          	auipc	ra,0x0
    1226:	f44080e7          	jalr	-188(ra) # 1166 <write>
}
    122a:	0001                	nop
    122c:	60e2                	ld	ra,24(sp)
    122e:	6442                	ld	s0,16(sp)
    1230:	6105                	addi	sp,sp,32
    1232:	8082                	ret

0000000000001234 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    1234:	7139                	addi	sp,sp,-64
    1236:	fc06                	sd	ra,56(sp)
    1238:	f822                	sd	s0,48(sp)
    123a:	0080                	addi	s0,sp,64
    123c:	87aa                	mv	a5,a0
    123e:	8736                	mv	a4,a3
    1240:	fcf42623          	sw	a5,-52(s0)
    1244:	87ae                	mv	a5,a1
    1246:	fcf42423          	sw	a5,-56(s0)
    124a:	87b2                	mv	a5,a2
    124c:	fcf42223          	sw	a5,-60(s0)
    1250:	87ba                	mv	a5,a4
    1252:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    1256:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
    125a:	fc042783          	lw	a5,-64(s0)
    125e:	2781                	sext.w	a5,a5
    1260:	c38d                	beqz	a5,1282 <printint+0x4e>
    1262:	fc842783          	lw	a5,-56(s0)
    1266:	2781                	sext.w	a5,a5
    1268:	0007dd63          	bgez	a5,1282 <printint+0x4e>
    neg = 1;
    126c:	4785                	li	a5,1
    126e:	fef42423          	sw	a5,-24(s0)
    x = -xx;
    1272:	fc842783          	lw	a5,-56(s0)
    1276:	40f007bb          	negw	a5,a5
    127a:	2781                	sext.w	a5,a5
    127c:	fef42223          	sw	a5,-28(s0)
    1280:	a029                	j	128a <printint+0x56>
  } else {
    x = xx;
    1282:	fc842783          	lw	a5,-56(s0)
    1286:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
    128a:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
    128e:	fc442783          	lw	a5,-60(s0)
    1292:	fe442703          	lw	a4,-28(s0)
    1296:	02f777bb          	remuw	a5,a4,a5
    129a:	0007861b          	sext.w	a2,a5
    129e:	fec42783          	lw	a5,-20(s0)
    12a2:	0017871b          	addiw	a4,a5,1
    12a6:	fee42623          	sw	a4,-20(s0)
    12aa:	00001697          	auipc	a3,0x1
    12ae:	f9668693          	addi	a3,a3,-106 # 2240 <digits>
    12b2:	02061713          	slli	a4,a2,0x20
    12b6:	9301                	srli	a4,a4,0x20
    12b8:	9736                	add	a4,a4,a3
    12ba:	00074703          	lbu	a4,0(a4)
    12be:	ff040693          	addi	a3,s0,-16
    12c2:	97b6                	add	a5,a5,a3
    12c4:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
    12c8:	fc442783          	lw	a5,-60(s0)
    12cc:	fe442703          	lw	a4,-28(s0)
    12d0:	02f757bb          	divuw	a5,a4,a5
    12d4:	fef42223          	sw	a5,-28(s0)
    12d8:	fe442783          	lw	a5,-28(s0)
    12dc:	2781                	sext.w	a5,a5
    12de:	fbc5                	bnez	a5,128e <printint+0x5a>
  if(neg)
    12e0:	fe842783          	lw	a5,-24(s0)
    12e4:	2781                	sext.w	a5,a5
    12e6:	cf95                	beqz	a5,1322 <printint+0xee>
    buf[i++] = '-';
    12e8:	fec42783          	lw	a5,-20(s0)
    12ec:	0017871b          	addiw	a4,a5,1
    12f0:	fee42623          	sw	a4,-20(s0)
    12f4:	ff040713          	addi	a4,s0,-16
    12f8:	97ba                	add	a5,a5,a4
    12fa:	02d00713          	li	a4,45
    12fe:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
    1302:	a005                	j	1322 <printint+0xee>
    putc(fd, buf[i]);
    1304:	fec42783          	lw	a5,-20(s0)
    1308:	ff040713          	addi	a4,s0,-16
    130c:	97ba                	add	a5,a5,a4
    130e:	fe07c703          	lbu	a4,-32(a5)
    1312:	fcc42783          	lw	a5,-52(s0)
    1316:	85ba                	mv	a1,a4
    1318:	853e                	mv	a0,a5
    131a:	00000097          	auipc	ra,0x0
    131e:	ee4080e7          	jalr	-284(ra) # 11fe <putc>
  while(--i >= 0)
    1322:	fec42783          	lw	a5,-20(s0)
    1326:	37fd                	addiw	a5,a5,-1
    1328:	fef42623          	sw	a5,-20(s0)
    132c:	fec42783          	lw	a5,-20(s0)
    1330:	2781                	sext.w	a5,a5
    1332:	fc07d9e3          	bgez	a5,1304 <printint+0xd0>
}
    1336:	0001                	nop
    1338:	0001                	nop
    133a:	70e2                	ld	ra,56(sp)
    133c:	7442                	ld	s0,48(sp)
    133e:	6121                	addi	sp,sp,64
    1340:	8082                	ret

0000000000001342 <printptr>:

static void
printptr(int fd, uint64 x) {
    1342:	7179                	addi	sp,sp,-48
    1344:	f406                	sd	ra,40(sp)
    1346:	f022                	sd	s0,32(sp)
    1348:	1800                	addi	s0,sp,48
    134a:	87aa                	mv	a5,a0
    134c:	fcb43823          	sd	a1,-48(s0)
    1350:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
    1354:	fdc42783          	lw	a5,-36(s0)
    1358:	03000593          	li	a1,48
    135c:	853e                	mv	a0,a5
    135e:	00000097          	auipc	ra,0x0
    1362:	ea0080e7          	jalr	-352(ra) # 11fe <putc>
  putc(fd, 'x');
    1366:	fdc42783          	lw	a5,-36(s0)
    136a:	07800593          	li	a1,120
    136e:	853e                	mv	a0,a5
    1370:	00000097          	auipc	ra,0x0
    1374:	e8e080e7          	jalr	-370(ra) # 11fe <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    1378:	fe042623          	sw	zero,-20(s0)
    137c:	a82d                	j	13b6 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    137e:	fd043783          	ld	a5,-48(s0)
    1382:	93f1                	srli	a5,a5,0x3c
    1384:	00001717          	auipc	a4,0x1
    1388:	ebc70713          	addi	a4,a4,-324 # 2240 <digits>
    138c:	97ba                	add	a5,a5,a4
    138e:	0007c703          	lbu	a4,0(a5)
    1392:	fdc42783          	lw	a5,-36(s0)
    1396:	85ba                	mv	a1,a4
    1398:	853e                	mv	a0,a5
    139a:	00000097          	auipc	ra,0x0
    139e:	e64080e7          	jalr	-412(ra) # 11fe <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    13a2:	fec42783          	lw	a5,-20(s0)
    13a6:	2785                	addiw	a5,a5,1
    13a8:	fef42623          	sw	a5,-20(s0)
    13ac:	fd043783          	ld	a5,-48(s0)
    13b0:	0792                	slli	a5,a5,0x4
    13b2:	fcf43823          	sd	a5,-48(s0)
    13b6:	fec42783          	lw	a5,-20(s0)
    13ba:	873e                	mv	a4,a5
    13bc:	47bd                	li	a5,15
    13be:	fce7f0e3          	bgeu	a5,a4,137e <printptr+0x3c>
}
    13c2:	0001                	nop
    13c4:	0001                	nop
    13c6:	70a2                	ld	ra,40(sp)
    13c8:	7402                	ld	s0,32(sp)
    13ca:	6145                	addi	sp,sp,48
    13cc:	8082                	ret

00000000000013ce <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    13ce:	715d                	addi	sp,sp,-80
    13d0:	e486                	sd	ra,72(sp)
    13d2:	e0a2                	sd	s0,64(sp)
    13d4:	0880                	addi	s0,sp,80
    13d6:	87aa                	mv	a5,a0
    13d8:	fcb43023          	sd	a1,-64(s0)
    13dc:	fac43c23          	sd	a2,-72(s0)
    13e0:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
    13e4:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    13e8:	fe042223          	sw	zero,-28(s0)
    13ec:	a42d                	j	1616 <vprintf+0x248>
    c = fmt[i] & 0xff;
    13ee:	fe442783          	lw	a5,-28(s0)
    13f2:	fc043703          	ld	a4,-64(s0)
    13f6:	97ba                	add	a5,a5,a4
    13f8:	0007c783          	lbu	a5,0(a5)
    13fc:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
    1400:	fe042783          	lw	a5,-32(s0)
    1404:	2781                	sext.w	a5,a5
    1406:	eb9d                	bnez	a5,143c <vprintf+0x6e>
      if(c == '%'){
    1408:	fdc42783          	lw	a5,-36(s0)
    140c:	0007871b          	sext.w	a4,a5
    1410:	02500793          	li	a5,37
    1414:	00f71763          	bne	a4,a5,1422 <vprintf+0x54>
        state = '%';
    1418:	02500793          	li	a5,37
    141c:	fef42023          	sw	a5,-32(s0)
    1420:	a2f5                	j	160c <vprintf+0x23e>
      } else {
        putc(fd, c);
    1422:	fdc42783          	lw	a5,-36(s0)
    1426:	0ff7f713          	andi	a4,a5,255
    142a:	fcc42783          	lw	a5,-52(s0)
    142e:	85ba                	mv	a1,a4
    1430:	853e                	mv	a0,a5
    1432:	00000097          	auipc	ra,0x0
    1436:	dcc080e7          	jalr	-564(ra) # 11fe <putc>
    143a:	aac9                	j	160c <vprintf+0x23e>
      }
    } else if(state == '%'){
    143c:	fe042783          	lw	a5,-32(s0)
    1440:	0007871b          	sext.w	a4,a5
    1444:	02500793          	li	a5,37
    1448:	1cf71263          	bne	a4,a5,160c <vprintf+0x23e>
      if(c == 'd'){
    144c:	fdc42783          	lw	a5,-36(s0)
    1450:	0007871b          	sext.w	a4,a5
    1454:	06400793          	li	a5,100
    1458:	02f71463          	bne	a4,a5,1480 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
    145c:	fb843783          	ld	a5,-72(s0)
    1460:	00878713          	addi	a4,a5,8
    1464:	fae43c23          	sd	a4,-72(s0)
    1468:	4398                	lw	a4,0(a5)
    146a:	fcc42783          	lw	a5,-52(s0)
    146e:	4685                	li	a3,1
    1470:	4629                	li	a2,10
    1472:	85ba                	mv	a1,a4
    1474:	853e                	mv	a0,a5
    1476:	00000097          	auipc	ra,0x0
    147a:	dbe080e7          	jalr	-578(ra) # 1234 <printint>
    147e:	a269                	j	1608 <vprintf+0x23a>
      } else if(c == 'l') {
    1480:	fdc42783          	lw	a5,-36(s0)
    1484:	0007871b          	sext.w	a4,a5
    1488:	06c00793          	li	a5,108
    148c:	02f71663          	bne	a4,a5,14b8 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
    1490:	fb843783          	ld	a5,-72(s0)
    1494:	00878713          	addi	a4,a5,8
    1498:	fae43c23          	sd	a4,-72(s0)
    149c:	639c                	ld	a5,0(a5)
    149e:	0007871b          	sext.w	a4,a5
    14a2:	fcc42783          	lw	a5,-52(s0)
    14a6:	4681                	li	a3,0
    14a8:	4629                	li	a2,10
    14aa:	85ba                	mv	a1,a4
    14ac:	853e                	mv	a0,a5
    14ae:	00000097          	auipc	ra,0x0
    14b2:	d86080e7          	jalr	-634(ra) # 1234 <printint>
    14b6:	aa89                	j	1608 <vprintf+0x23a>
      } else if(c == 'x') {
    14b8:	fdc42783          	lw	a5,-36(s0)
    14bc:	0007871b          	sext.w	a4,a5
    14c0:	07800793          	li	a5,120
    14c4:	02f71463          	bne	a4,a5,14ec <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
    14c8:	fb843783          	ld	a5,-72(s0)
    14cc:	00878713          	addi	a4,a5,8
    14d0:	fae43c23          	sd	a4,-72(s0)
    14d4:	4398                	lw	a4,0(a5)
    14d6:	fcc42783          	lw	a5,-52(s0)
    14da:	4681                	li	a3,0
    14dc:	4641                	li	a2,16
    14de:	85ba                	mv	a1,a4
    14e0:	853e                	mv	a0,a5
    14e2:	00000097          	auipc	ra,0x0
    14e6:	d52080e7          	jalr	-686(ra) # 1234 <printint>
    14ea:	aa39                	j	1608 <vprintf+0x23a>
      } else if(c == 'p') {
    14ec:	fdc42783          	lw	a5,-36(s0)
    14f0:	0007871b          	sext.w	a4,a5
    14f4:	07000793          	li	a5,112
    14f8:	02f71263          	bne	a4,a5,151c <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
    14fc:	fb843783          	ld	a5,-72(s0)
    1500:	00878713          	addi	a4,a5,8
    1504:	fae43c23          	sd	a4,-72(s0)
    1508:	6398                	ld	a4,0(a5)
    150a:	fcc42783          	lw	a5,-52(s0)
    150e:	85ba                	mv	a1,a4
    1510:	853e                	mv	a0,a5
    1512:	00000097          	auipc	ra,0x0
    1516:	e30080e7          	jalr	-464(ra) # 1342 <printptr>
    151a:	a0fd                	j	1608 <vprintf+0x23a>
      } else if(c == 's'){
    151c:	fdc42783          	lw	a5,-36(s0)
    1520:	0007871b          	sext.w	a4,a5
    1524:	07300793          	li	a5,115
    1528:	04f71c63          	bne	a4,a5,1580 <vprintf+0x1b2>
        s = va_arg(ap, char*);
    152c:	fb843783          	ld	a5,-72(s0)
    1530:	00878713          	addi	a4,a5,8
    1534:	fae43c23          	sd	a4,-72(s0)
    1538:	639c                	ld	a5,0(a5)
    153a:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
    153e:	fe843783          	ld	a5,-24(s0)
    1542:	eb8d                	bnez	a5,1574 <vprintf+0x1a6>
          s = "(null)";
    1544:	00001797          	auipc	a5,0x1
    1548:	c2478793          	addi	a5,a5,-988 # 2168 <schedule_edf_cbs+0x69c>
    154c:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    1550:	a015                	j	1574 <vprintf+0x1a6>
          putc(fd, *s);
    1552:	fe843783          	ld	a5,-24(s0)
    1556:	0007c703          	lbu	a4,0(a5)
    155a:	fcc42783          	lw	a5,-52(s0)
    155e:	85ba                	mv	a1,a4
    1560:	853e                	mv	a0,a5
    1562:	00000097          	auipc	ra,0x0
    1566:	c9c080e7          	jalr	-868(ra) # 11fe <putc>
          s++;
    156a:	fe843783          	ld	a5,-24(s0)
    156e:	0785                	addi	a5,a5,1
    1570:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    1574:	fe843783          	ld	a5,-24(s0)
    1578:	0007c783          	lbu	a5,0(a5)
    157c:	fbf9                	bnez	a5,1552 <vprintf+0x184>
    157e:	a069                	j	1608 <vprintf+0x23a>
        }
      } else if(c == 'c'){
    1580:	fdc42783          	lw	a5,-36(s0)
    1584:	0007871b          	sext.w	a4,a5
    1588:	06300793          	li	a5,99
    158c:	02f71463          	bne	a4,a5,15b4 <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
    1590:	fb843783          	ld	a5,-72(s0)
    1594:	00878713          	addi	a4,a5,8
    1598:	fae43c23          	sd	a4,-72(s0)
    159c:	439c                	lw	a5,0(a5)
    159e:	0ff7f713          	andi	a4,a5,255
    15a2:	fcc42783          	lw	a5,-52(s0)
    15a6:	85ba                	mv	a1,a4
    15a8:	853e                	mv	a0,a5
    15aa:	00000097          	auipc	ra,0x0
    15ae:	c54080e7          	jalr	-940(ra) # 11fe <putc>
    15b2:	a899                	j	1608 <vprintf+0x23a>
      } else if(c == '%'){
    15b4:	fdc42783          	lw	a5,-36(s0)
    15b8:	0007871b          	sext.w	a4,a5
    15bc:	02500793          	li	a5,37
    15c0:	00f71f63          	bne	a4,a5,15de <vprintf+0x210>
        putc(fd, c);
    15c4:	fdc42783          	lw	a5,-36(s0)
    15c8:	0ff7f713          	andi	a4,a5,255
    15cc:	fcc42783          	lw	a5,-52(s0)
    15d0:	85ba                	mv	a1,a4
    15d2:	853e                	mv	a0,a5
    15d4:	00000097          	auipc	ra,0x0
    15d8:	c2a080e7          	jalr	-982(ra) # 11fe <putc>
    15dc:	a035                	j	1608 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    15de:	fcc42783          	lw	a5,-52(s0)
    15e2:	02500593          	li	a1,37
    15e6:	853e                	mv	a0,a5
    15e8:	00000097          	auipc	ra,0x0
    15ec:	c16080e7          	jalr	-1002(ra) # 11fe <putc>
        putc(fd, c);
    15f0:	fdc42783          	lw	a5,-36(s0)
    15f4:	0ff7f713          	andi	a4,a5,255
    15f8:	fcc42783          	lw	a5,-52(s0)
    15fc:	85ba                	mv	a1,a4
    15fe:	853e                	mv	a0,a5
    1600:	00000097          	auipc	ra,0x0
    1604:	bfe080e7          	jalr	-1026(ra) # 11fe <putc>
      }
      state = 0;
    1608:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    160c:	fe442783          	lw	a5,-28(s0)
    1610:	2785                	addiw	a5,a5,1
    1612:	fef42223          	sw	a5,-28(s0)
    1616:	fe442783          	lw	a5,-28(s0)
    161a:	fc043703          	ld	a4,-64(s0)
    161e:	97ba                	add	a5,a5,a4
    1620:	0007c783          	lbu	a5,0(a5)
    1624:	dc0795e3          	bnez	a5,13ee <vprintf+0x20>
    }
  }
}
    1628:	0001                	nop
    162a:	0001                	nop
    162c:	60a6                	ld	ra,72(sp)
    162e:	6406                	ld	s0,64(sp)
    1630:	6161                	addi	sp,sp,80
    1632:	8082                	ret

0000000000001634 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    1634:	7159                	addi	sp,sp,-112
    1636:	fc06                	sd	ra,56(sp)
    1638:	f822                	sd	s0,48(sp)
    163a:	0080                	addi	s0,sp,64
    163c:	fcb43823          	sd	a1,-48(s0)
    1640:	e010                	sd	a2,0(s0)
    1642:	e414                	sd	a3,8(s0)
    1644:	e818                	sd	a4,16(s0)
    1646:	ec1c                	sd	a5,24(s0)
    1648:	03043023          	sd	a6,32(s0)
    164c:	03143423          	sd	a7,40(s0)
    1650:	87aa                	mv	a5,a0
    1652:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
    1656:	03040793          	addi	a5,s0,48
    165a:	fcf43423          	sd	a5,-56(s0)
    165e:	fc843783          	ld	a5,-56(s0)
    1662:	fd078793          	addi	a5,a5,-48
    1666:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
    166a:	fe843703          	ld	a4,-24(s0)
    166e:	fdc42783          	lw	a5,-36(s0)
    1672:	863a                	mv	a2,a4
    1674:	fd043583          	ld	a1,-48(s0)
    1678:	853e                	mv	a0,a5
    167a:	00000097          	auipc	ra,0x0
    167e:	d54080e7          	jalr	-684(ra) # 13ce <vprintf>
}
    1682:	0001                	nop
    1684:	70e2                	ld	ra,56(sp)
    1686:	7442                	ld	s0,48(sp)
    1688:	6165                	addi	sp,sp,112
    168a:	8082                	ret

000000000000168c <printf>:

void
printf(const char *fmt, ...)
{
    168c:	7159                	addi	sp,sp,-112
    168e:	f406                	sd	ra,40(sp)
    1690:	f022                	sd	s0,32(sp)
    1692:	1800                	addi	s0,sp,48
    1694:	fca43c23          	sd	a0,-40(s0)
    1698:	e40c                	sd	a1,8(s0)
    169a:	e810                	sd	a2,16(s0)
    169c:	ec14                	sd	a3,24(s0)
    169e:	f018                	sd	a4,32(s0)
    16a0:	f41c                	sd	a5,40(s0)
    16a2:	03043823          	sd	a6,48(s0)
    16a6:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    16aa:	04040793          	addi	a5,s0,64
    16ae:	fcf43823          	sd	a5,-48(s0)
    16b2:	fd043783          	ld	a5,-48(s0)
    16b6:	fc878793          	addi	a5,a5,-56
    16ba:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
    16be:	fe843783          	ld	a5,-24(s0)
    16c2:	863e                	mv	a2,a5
    16c4:	fd843583          	ld	a1,-40(s0)
    16c8:	4505                	li	a0,1
    16ca:	00000097          	auipc	ra,0x0
    16ce:	d04080e7          	jalr	-764(ra) # 13ce <vprintf>
}
    16d2:	0001                	nop
    16d4:	70a2                	ld	ra,40(sp)
    16d6:	7402                	ld	s0,32(sp)
    16d8:	6165                	addi	sp,sp,112
    16da:	8082                	ret

00000000000016dc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    16dc:	7179                	addi	sp,sp,-48
    16de:	f422                	sd	s0,40(sp)
    16e0:	1800                	addi	s0,sp,48
    16e2:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    16e6:	fd843783          	ld	a5,-40(s0)
    16ea:	17c1                	addi	a5,a5,-16
    16ec:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    16f0:	00001797          	auipc	a5,0x1
    16f4:	ba078793          	addi	a5,a5,-1120 # 2290 <freep>
    16f8:	639c                	ld	a5,0(a5)
    16fa:	fef43423          	sd	a5,-24(s0)
    16fe:	a815                	j	1732 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1700:	fe843783          	ld	a5,-24(s0)
    1704:	639c                	ld	a5,0(a5)
    1706:	fe843703          	ld	a4,-24(s0)
    170a:	00f76f63          	bltu	a4,a5,1728 <free+0x4c>
    170e:	fe043703          	ld	a4,-32(s0)
    1712:	fe843783          	ld	a5,-24(s0)
    1716:	02e7eb63          	bltu	a5,a4,174c <free+0x70>
    171a:	fe843783          	ld	a5,-24(s0)
    171e:	639c                	ld	a5,0(a5)
    1720:	fe043703          	ld	a4,-32(s0)
    1724:	02f76463          	bltu	a4,a5,174c <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1728:	fe843783          	ld	a5,-24(s0)
    172c:	639c                	ld	a5,0(a5)
    172e:	fef43423          	sd	a5,-24(s0)
    1732:	fe043703          	ld	a4,-32(s0)
    1736:	fe843783          	ld	a5,-24(s0)
    173a:	fce7f3e3          	bgeu	a5,a4,1700 <free+0x24>
    173e:	fe843783          	ld	a5,-24(s0)
    1742:	639c                	ld	a5,0(a5)
    1744:	fe043703          	ld	a4,-32(s0)
    1748:	faf77ce3          	bgeu	a4,a5,1700 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
    174c:	fe043783          	ld	a5,-32(s0)
    1750:	479c                	lw	a5,8(a5)
    1752:	1782                	slli	a5,a5,0x20
    1754:	9381                	srli	a5,a5,0x20
    1756:	0792                	slli	a5,a5,0x4
    1758:	fe043703          	ld	a4,-32(s0)
    175c:	973e                	add	a4,a4,a5
    175e:	fe843783          	ld	a5,-24(s0)
    1762:	639c                	ld	a5,0(a5)
    1764:	02f71763          	bne	a4,a5,1792 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
    1768:	fe043783          	ld	a5,-32(s0)
    176c:	4798                	lw	a4,8(a5)
    176e:	fe843783          	ld	a5,-24(s0)
    1772:	639c                	ld	a5,0(a5)
    1774:	479c                	lw	a5,8(a5)
    1776:	9fb9                	addw	a5,a5,a4
    1778:	0007871b          	sext.w	a4,a5
    177c:	fe043783          	ld	a5,-32(s0)
    1780:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
    1782:	fe843783          	ld	a5,-24(s0)
    1786:	639c                	ld	a5,0(a5)
    1788:	6398                	ld	a4,0(a5)
    178a:	fe043783          	ld	a5,-32(s0)
    178e:	e398                	sd	a4,0(a5)
    1790:	a039                	j	179e <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
    1792:	fe843783          	ld	a5,-24(s0)
    1796:	6398                	ld	a4,0(a5)
    1798:	fe043783          	ld	a5,-32(s0)
    179c:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
    179e:	fe843783          	ld	a5,-24(s0)
    17a2:	479c                	lw	a5,8(a5)
    17a4:	1782                	slli	a5,a5,0x20
    17a6:	9381                	srli	a5,a5,0x20
    17a8:	0792                	slli	a5,a5,0x4
    17aa:	fe843703          	ld	a4,-24(s0)
    17ae:	97ba                	add	a5,a5,a4
    17b0:	fe043703          	ld	a4,-32(s0)
    17b4:	02f71563          	bne	a4,a5,17de <free+0x102>
    p->s.size += bp->s.size;
    17b8:	fe843783          	ld	a5,-24(s0)
    17bc:	4798                	lw	a4,8(a5)
    17be:	fe043783          	ld	a5,-32(s0)
    17c2:	479c                	lw	a5,8(a5)
    17c4:	9fb9                	addw	a5,a5,a4
    17c6:	0007871b          	sext.w	a4,a5
    17ca:	fe843783          	ld	a5,-24(s0)
    17ce:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    17d0:	fe043783          	ld	a5,-32(s0)
    17d4:	6398                	ld	a4,0(a5)
    17d6:	fe843783          	ld	a5,-24(s0)
    17da:	e398                	sd	a4,0(a5)
    17dc:	a031                	j	17e8 <free+0x10c>
  } else
    p->s.ptr = bp;
    17de:	fe843783          	ld	a5,-24(s0)
    17e2:	fe043703          	ld	a4,-32(s0)
    17e6:	e398                	sd	a4,0(a5)
  freep = p;
    17e8:	00001797          	auipc	a5,0x1
    17ec:	aa878793          	addi	a5,a5,-1368 # 2290 <freep>
    17f0:	fe843703          	ld	a4,-24(s0)
    17f4:	e398                	sd	a4,0(a5)
}
    17f6:	0001                	nop
    17f8:	7422                	ld	s0,40(sp)
    17fa:	6145                	addi	sp,sp,48
    17fc:	8082                	ret

00000000000017fe <morecore>:

static Header*
morecore(uint nu)
{
    17fe:	7179                	addi	sp,sp,-48
    1800:	f406                	sd	ra,40(sp)
    1802:	f022                	sd	s0,32(sp)
    1804:	1800                	addi	s0,sp,48
    1806:	87aa                	mv	a5,a0
    1808:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
    180c:	fdc42783          	lw	a5,-36(s0)
    1810:	0007871b          	sext.w	a4,a5
    1814:	6785                	lui	a5,0x1
    1816:	00f77563          	bgeu	a4,a5,1820 <morecore+0x22>
    nu = 4096;
    181a:	6785                	lui	a5,0x1
    181c:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
    1820:	fdc42783          	lw	a5,-36(s0)
    1824:	0047979b          	slliw	a5,a5,0x4
    1828:	2781                	sext.w	a5,a5
    182a:	2781                	sext.w	a5,a5
    182c:	853e                	mv	a0,a5
    182e:	00000097          	auipc	ra,0x0
    1832:	9a0080e7          	jalr	-1632(ra) # 11ce <sbrk>
    1836:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
    183a:	fe843703          	ld	a4,-24(s0)
    183e:	57fd                	li	a5,-1
    1840:	00f71463          	bne	a4,a5,1848 <morecore+0x4a>
    return 0;
    1844:	4781                	li	a5,0
    1846:	a03d                	j	1874 <morecore+0x76>
  hp = (Header*)p;
    1848:	fe843783          	ld	a5,-24(s0)
    184c:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
    1850:	fe043783          	ld	a5,-32(s0)
    1854:	fdc42703          	lw	a4,-36(s0)
    1858:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
    185a:	fe043783          	ld	a5,-32(s0)
    185e:	07c1                	addi	a5,a5,16
    1860:	853e                	mv	a0,a5
    1862:	00000097          	auipc	ra,0x0
    1866:	e7a080e7          	jalr	-390(ra) # 16dc <free>
  return freep;
    186a:	00001797          	auipc	a5,0x1
    186e:	a2678793          	addi	a5,a5,-1498 # 2290 <freep>
    1872:	639c                	ld	a5,0(a5)
}
    1874:	853e                	mv	a0,a5
    1876:	70a2                	ld	ra,40(sp)
    1878:	7402                	ld	s0,32(sp)
    187a:	6145                	addi	sp,sp,48
    187c:	8082                	ret

000000000000187e <malloc>:

void*
malloc(uint nbytes)
{
    187e:	7139                	addi	sp,sp,-64
    1880:	fc06                	sd	ra,56(sp)
    1882:	f822                	sd	s0,48(sp)
    1884:	0080                	addi	s0,sp,64
    1886:	87aa                	mv	a5,a0
    1888:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    188c:	fcc46783          	lwu	a5,-52(s0)
    1890:	07bd                	addi	a5,a5,15
    1892:	8391                	srli	a5,a5,0x4
    1894:	2781                	sext.w	a5,a5
    1896:	2785                	addiw	a5,a5,1
    1898:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
    189c:	00001797          	auipc	a5,0x1
    18a0:	9f478793          	addi	a5,a5,-1548 # 2290 <freep>
    18a4:	639c                	ld	a5,0(a5)
    18a6:	fef43023          	sd	a5,-32(s0)
    18aa:	fe043783          	ld	a5,-32(s0)
    18ae:	ef95                	bnez	a5,18ea <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    18b0:	00001797          	auipc	a5,0x1
    18b4:	9d078793          	addi	a5,a5,-1584 # 2280 <base>
    18b8:	fef43023          	sd	a5,-32(s0)
    18bc:	00001797          	auipc	a5,0x1
    18c0:	9d478793          	addi	a5,a5,-1580 # 2290 <freep>
    18c4:	fe043703          	ld	a4,-32(s0)
    18c8:	e398                	sd	a4,0(a5)
    18ca:	00001797          	auipc	a5,0x1
    18ce:	9c678793          	addi	a5,a5,-1594 # 2290 <freep>
    18d2:	6398                	ld	a4,0(a5)
    18d4:	00001797          	auipc	a5,0x1
    18d8:	9ac78793          	addi	a5,a5,-1620 # 2280 <base>
    18dc:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    18de:	00001797          	auipc	a5,0x1
    18e2:	9a278793          	addi	a5,a5,-1630 # 2280 <base>
    18e6:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    18ea:	fe043783          	ld	a5,-32(s0)
    18ee:	639c                	ld	a5,0(a5)
    18f0:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    18f4:	fe843783          	ld	a5,-24(s0)
    18f8:	4798                	lw	a4,8(a5)
    18fa:	fdc42783          	lw	a5,-36(s0)
    18fe:	2781                	sext.w	a5,a5
    1900:	06f76863          	bltu	a4,a5,1970 <malloc+0xf2>
      if(p->s.size == nunits)
    1904:	fe843783          	ld	a5,-24(s0)
    1908:	4798                	lw	a4,8(a5)
    190a:	fdc42783          	lw	a5,-36(s0)
    190e:	2781                	sext.w	a5,a5
    1910:	00e79963          	bne	a5,a4,1922 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    1914:	fe843783          	ld	a5,-24(s0)
    1918:	6398                	ld	a4,0(a5)
    191a:	fe043783          	ld	a5,-32(s0)
    191e:	e398                	sd	a4,0(a5)
    1920:	a82d                	j	195a <malloc+0xdc>
      else {
        p->s.size -= nunits;
    1922:	fe843783          	ld	a5,-24(s0)
    1926:	4798                	lw	a4,8(a5)
    1928:	fdc42783          	lw	a5,-36(s0)
    192c:	40f707bb          	subw	a5,a4,a5
    1930:	0007871b          	sext.w	a4,a5
    1934:	fe843783          	ld	a5,-24(s0)
    1938:	c798                	sw	a4,8(a5)
        p += p->s.size;
    193a:	fe843783          	ld	a5,-24(s0)
    193e:	479c                	lw	a5,8(a5)
    1940:	1782                	slli	a5,a5,0x20
    1942:	9381                	srli	a5,a5,0x20
    1944:	0792                	slli	a5,a5,0x4
    1946:	fe843703          	ld	a4,-24(s0)
    194a:	97ba                	add	a5,a5,a4
    194c:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    1950:	fe843783          	ld	a5,-24(s0)
    1954:	fdc42703          	lw	a4,-36(s0)
    1958:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    195a:	00001797          	auipc	a5,0x1
    195e:	93678793          	addi	a5,a5,-1738 # 2290 <freep>
    1962:	fe043703          	ld	a4,-32(s0)
    1966:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    1968:	fe843783          	ld	a5,-24(s0)
    196c:	07c1                	addi	a5,a5,16
    196e:	a091                	j	19b2 <malloc+0x134>
    }
    if(p == freep)
    1970:	00001797          	auipc	a5,0x1
    1974:	92078793          	addi	a5,a5,-1760 # 2290 <freep>
    1978:	639c                	ld	a5,0(a5)
    197a:	fe843703          	ld	a4,-24(s0)
    197e:	02f71063          	bne	a4,a5,199e <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    1982:	fdc42783          	lw	a5,-36(s0)
    1986:	853e                	mv	a0,a5
    1988:	00000097          	auipc	ra,0x0
    198c:	e76080e7          	jalr	-394(ra) # 17fe <morecore>
    1990:	fea43423          	sd	a0,-24(s0)
    1994:	fe843783          	ld	a5,-24(s0)
    1998:	e399                	bnez	a5,199e <malloc+0x120>
        return 0;
    199a:	4781                	li	a5,0
    199c:	a819                	j	19b2 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    199e:	fe843783          	ld	a5,-24(s0)
    19a2:	fef43023          	sd	a5,-32(s0)
    19a6:	fe843783          	ld	a5,-24(s0)
    19aa:	639c                	ld	a5,0(a5)
    19ac:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    19b0:	b791                	j	18f4 <malloc+0x76>
  }
}
    19b2:	853e                	mv	a0,a5
    19b4:	70e2                	ld	ra,56(sp)
    19b6:	7442                	ld	s0,48(sp)
    19b8:	6121                	addi	sp,sp,64
    19ba:	8082                	ret

00000000000019bc <setjmp>:
    19bc:	e100                	sd	s0,0(a0)
    19be:	e504                	sd	s1,8(a0)
    19c0:	01253823          	sd	s2,16(a0)
    19c4:	01353c23          	sd	s3,24(a0)
    19c8:	03453023          	sd	s4,32(a0)
    19cc:	03553423          	sd	s5,40(a0)
    19d0:	03653823          	sd	s6,48(a0)
    19d4:	03753c23          	sd	s7,56(a0)
    19d8:	05853023          	sd	s8,64(a0)
    19dc:	05953423          	sd	s9,72(a0)
    19e0:	05a53823          	sd	s10,80(a0)
    19e4:	05b53c23          	sd	s11,88(a0)
    19e8:	06153023          	sd	ra,96(a0)
    19ec:	06253423          	sd	sp,104(a0)
    19f0:	4501                	li	a0,0
    19f2:	8082                	ret

00000000000019f4 <longjmp>:
    19f4:	6100                	ld	s0,0(a0)
    19f6:	6504                	ld	s1,8(a0)
    19f8:	01053903          	ld	s2,16(a0)
    19fc:	01853983          	ld	s3,24(a0)
    1a00:	02053a03          	ld	s4,32(a0)
    1a04:	02853a83          	ld	s5,40(a0)
    1a08:	03053b03          	ld	s6,48(a0)
    1a0c:	03853b83          	ld	s7,56(a0)
    1a10:	04053c03          	ld	s8,64(a0)
    1a14:	04853c83          	ld	s9,72(a0)
    1a18:	05053d03          	ld	s10,80(a0)
    1a1c:	05853d83          	ld	s11,88(a0)
    1a20:	06053083          	ld	ra,96(a0)
    1a24:	06853103          	ld	sp,104(a0)
    1a28:	c199                	beqz	a1,1a2e <longjmp_1>
    1a2a:	852e                	mv	a0,a1
    1a2c:	8082                	ret

0000000000001a2e <longjmp_1>:
    1a2e:	4505                	li	a0,1
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
    1b16:	00000097          	auipc	ra,0x0
    1b1a:	b76080e7          	jalr	-1162(ra) # 168c <printf>
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
    1ba4:	00000097          	auipc	ra,0x0
    1ba8:	ae8080e7          	jalr	-1304(ra) # 168c <printf>
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
    1c32:	00000097          	auipc	ra,0x0
    1c36:	a5a080e7          	jalr	-1446(ra) # 168c <printf>

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
    1de2:	00000097          	auipc	ra,0x0
    1de6:	8aa080e7          	jalr	-1878(ra) # 168c <printf>
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
