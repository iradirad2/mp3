/**
 *
 * I grub it from linux kernel source code and fix it for user space
 * program. Of course, this is a GPL licensed header file.
 *
 * Here is a recipe to cook list.h for user space program
 *
 * 1. copy list.h from linux/include/list.h
 * 2. remove
 *     - #ifdef __KERNE__ and its #endif
 *     - all #include line
 *     - prefetch() and rcu related functions
 * 3. add macro offsetof() and container_of
 *
 * - kazutomo@mcs.anl.gov
 */
 #ifndef _LINUX_LIST_H
 #define _LINUX_LIST_H
 
 #ifndef NULL
 #define NULL 0
 #endif
 
 typedef unsigned long size_t;
 /**
  * @name from other kernel headers
  */
 /*@{*/
 
 /**
  * Get offset of a member
  */
 #define offsetof(TYPE, MEMBER) ((size_t) & ((TYPE *)0)->MEMBER)
 
 /**
  * Casts a member of a structure out to the containing structure
  * @param ptr        the pointer to the member.
  * @param type       the type of the container struct this is embedded in.
  * @param member     the name of the member within the struct.
  *
  */
 #define container_of(ptr, type, member) ({                      \
         const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
         (type *)( (char *)__mptr - offsetof(type,member) ); })
 /*@}*/
 
 /**
  * Simple doubly linked list implementation.
  *
  * Some of the internal functions ("__xxx") are useful when
  * manipulating whole lists rather than single entries, as
  * sometimes we already know the next/prev entries and we can
  * generate better code by using them directly rather than
  * using the generic single-entry routines.
  */
 struct list_head
 {
     struct list_head *next, *prev;
 };
 
 /*
  * These are non-NULL pointers that will result in page faults
  * under normal circumstances, used to verify that nobody uses
  * non-initialized list entries.
  */
 #define LIST_POISON1 ((struct list_head *)0x00100100)
 #define LIST_POISON2 ((struct list_head *)0x00200200)
 
 #define LIST_HEAD_INIT(name) \
     {                        \
         &(name), &(name)     \
     }
 
 #define LIST_HEAD(name) \
     struct list_head name = LIST_HEAD_INIT(name)
 
 #define INIT_LIST_HEAD(ptr)  \
     do                       \
     {                        \
         (ptr)->next = (ptr); \
         (ptr)->prev = (ptr); \
     } while (0)
 
 /*
  * Insert a new entry between two known consecutive entries.
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_add(struct list_head *new_entry,
                               struct list_head *prev,
                               struct list_head *next)
 {
     next->prev = new_entry;
     new_entry->next = next;
     new_entry->prev = prev;
     prev->next = new_entry;
 }
 
 /**
  * list_add - add a new entry
  * @new_entry: new entry to be added
  * @head: list head to add it after
  *
  * Insert a new entry after the specified head.
  * This is good for implementing stacks.
  */
 static inline void list_add(struct list_head *new_entry, struct list_head *head)
 {
     __list_add(new_entry, head, head->next);
 }
 
 /**
  * list_add_tail - add a new entry
  * @new_entry: new entry to be added
  * @head: list head to add it before
  *
  * Insert a new entry before the specified head.
  * This is useful for implementing queues.
  */
 static inline void list_add_tail(struct list_head *new_entry, struct list_head *head)
 {
     __list_add(new_entry, head->prev, head);
 }
 
 /*
  * Delete a list entry by making the prev/next entries
  * point to each other.
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
  */
 static inline void __list_del(struct list_head *prev, struct list_head *next)
 {
     next->prev = prev;
     prev->next = next;
 }
 
 /**
  * list_del - deletes entry from list.
  * @entry: the element to delete from the list.
  * Note: list_empty on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
     __list_del(entry->prev, entry->next);
     entry->next = LIST_POISON1;
     entry->prev = LIST_POISON2;
 }
 
 /**
  * list_del_init - deletes entry from list and reinitialize it.
  * @entry: the element to delete from the list.
  */
 static inline void list_del_init(struct list_head *entry)
 {
     __list_del(entry->prev, entry->next);
     INIT_LIST_HEAD(entry);
 }
 
 /**
  * list_move - delete from one list and add as another's head
  * @list: the entry to move
  * @head: the head that will precede our entry
  */
 static inline void list_move(struct list_head *list, struct list_head *head)
 {
     __list_del(list->prev, list->next);
     list_add(list, head);
 }
 
 /**
  * list_move_tail - delete from one list and add as another's tail
  * @list: the entry to move
  * @head: the head that will follow our entry
  */
 static inline void list_move_tail(struct list_head *list,
                                   struct list_head *head)
 {
     __list_del(list->prev, list->next);
     list_add_tail(list, head);
 }
 
 /**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
 static inline int list_empty(const struct list_head *head)
 {
     return head->next == head;
 }
 
 static inline void __list_splice(struct list_head *list,
                                  struct list_head *head)
 {
     struct list_head *first = list->next;
     struct list_head *last = list->prev;
     struct list_head *at = head->next;
 
     first->prev = head;
     head->next = first;
 
     last->next = at;
     at->prev = last;
 }
 
 /**
  * list_splice - join two lists
  * @list: the new list to add.
  * @head: the place to add it in the first list.
  */
 static inline void list_splice(struct list_head *list, struct list_head *head)
 {
     if (!list_empty(list))
         __list_splice(list, head);
 }
 
 /**
  * list_splice_init - join two lists and reinitialise the emptied list.
  * @list: the new list to add.
  * @head: the place to add it in the first list.
  *
  * The list at @list is reinitialised
  */
 static inline void list_splice_init(struct list_head *list,
                                     struct list_head *head)
 {
     if (!list_empty(list))
     {
         __list_splice(list, head);
         INIT_LIST_HEAD(list);
     }
 }
 
 /**
  * list_entry - get the struct for this entry
  * @ptr:	the &struct list_head pointer.
  * @type:	the type of the struct this is embedded in.
  * @member:	the name of the list_struct within the struct.
  */
 #define list_entry(ptr, type, member) \
     container_of(ptr, type, member)
 
 /**
  * list_for_each	-	iterate over a list
  * @pos:	the &struct list_head to use as a loop counter.
  * @head:	the head for your list.
  */
 
 #define list_for_each(pos, head)            \
     for (pos = (head)->next; pos != (head); \
          pos = pos->next)
 
 /**
  * __list_for_each	-	iterate over a list
  * @pos:	the &struct list_head to use as a loop counter.
  * @head:	the head for your list.
  *
  * This variant differs from list_for_each() in that it's the
  * simplest possible list iteration code, no prefetching is done.
  * Use this for code that knows the list to be very short (empty
  * or 1 entry) most of the time.
  */
 #define __list_for_each(pos, head) \
     for (pos = (head)->next; pos != (head); pos = pos->next)
 
 /**
  * list_for_each_prev	-	iterate over a list backwards
  * @pos:	the &struct list_head to use as a loop counter.
  * @head:	the head for your list.
  */
 #define list_for_each_prev(pos, head)                            \
     for (pos = (head)->prev; prefetch(pos->prev), pos != (head); \
          pos = pos->prev)
 
 /**
  * list_for_each_safe	-	iterate over a list safe against removal of list entry
  * @pos:	the &struct list_head to use as a loop counter.
  * @n:		another &struct list_head to use as temporary storage
  * @head:	the head for your list.
  */
 #define list_for_each_safe(pos, n, head)                   \
     for (pos = (head)->next, n = pos->next; pos != (head); \
          pos = n, n = pos->next)
 
 /**
  * list_for_each_entry	-	iterate over list of given type
  * @pos:	the type * to use as a loop counter.
  * @head:	the head for your list.
  * @member:	the name of the list_struct within the struct.
  */
 #define list_for_each_entry(pos, head, member)                 \
     for (pos = list_entry((head)->next, typeof(*pos), member); \
          &pos->member != (head);                               \
          pos = list_entry(pos->member.next, typeof(*pos), member))
 
 /**
  * list_for_each_entry_reverse - iterate backwards over list of given type.
  * @pos:	the type * to use as a loop counter.
  * @head:	the head for your list.
  * @member:	the name of the list_struct within the struct.
  */
 #define list_for_each_entry_reverse(pos, head, member)         \
     for (pos = list_entry((head)->prev, typeof(*pos), member); \
          &pos->member != (head);                               \
          pos = list_entry(pos->member.prev, typeof(*pos), member))
 
 /**
  * list_prepare_entry - prepare a pos entry for use as a start point in
  *			list_for_each_entry_continue
  * @pos:	the type * to use as a start point
  * @head:	the head of the list
  * @member:	the name of the list_struct within the struct.
  */
 #define list_prepare_entry(pos, head, member) \
     ((pos) ?: list_entry(head, typeof(*pos), member))
 
 /**
  * list_for_each_entry_continue -	iterate over list of given type
  *			continuing after existing point
  * @pos:	the type * to use as a loop counter.
  * @head:	the head for your list.
  * @member:	the name of the list_struct within the struct.
  */
 #define list_for_each_entry_continue(pos, head, member)            \
     for (pos = list_entry(pos->member.next, typeof(*pos), member); \
          &pos->member != (head);                                   \
          pos = list_entry(pos->member.next, typeof(*pos), member))
 
 /**
  * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
  * @pos:	the type * to use as a loop counter.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
  * @member:	the name of the list_struct within the struct.
  */
 #define list_for_each_entry_safe(pos, n, head, member)          \
     for (pos = list_entry((head)->next, typeof(*pos), member),  \
         n = list_entry(pos->member.next, typeof(*pos), member); \
          &pos->member != (head);                                \
          pos = n, n = list_entry(n->member.next, typeof(*n), member))
 
 /**
  * list_for_each_entry_safe_continue -	iterate over list of given type
  *			continuing after existing point safe against removal of list entry
  * @pos:	the type * to use as a loop counter.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
  * @member:	the name of the list_struct within the struct.
  */
 #define list_for_each_entry_safe_continue(pos, n, head, member)    \
     for (pos = list_entry(pos->member.next, typeof(*pos), member), \
         n = list_entry(pos->member.next, typeof(*pos), member);    \
          &pos->member != (head);                                   \
          pos = n, n = list_entry(n->member.next, typeof(*n), member))
 
 /**
  * list_for_each_entry_safe_reverse - iterate backwards over list of given type safe against
  *				      removal of list entry
  * @pos:	the type * to use as a loop counter.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
  * @member:	the name of the list_struct within the struct.
  */
 #define list_for_each_entry_safe_reverse(pos, n, head, member)  \
     for (pos = list_entry((head)->prev, typeof(*pos), member),  \
         n = list_entry(pos->member.prev, typeof(*pos), member); \
          &pos->member != (head);                                \
          pos = n, n = list_entry(n->member.prev, typeof(*n), member))
 
 #endif