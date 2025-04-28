#include "kernel/types.h"
#include "user/user.h"
#include "user/list.h"
#include "user/threads.h"
#include "user/threads_sched.h"
#include <limits.h>
#define NULL 0
#define MAX_PRIORITY 4
#define MAX_PERIOD 100
struct thread* last_scheduled=NULL;

/* default scheduling algorithm */
#ifdef THREAD_SCHEDULER_DEFAULT
struct threads_sched_result schedule_default(struct threads_sched_args args)
{
    struct thread *thread_with_smallest_id = NULL;
    struct thread *th = NULL;
    list_for_each_entry(th, args.run_queue, thread_list) {
        if (thread_with_smallest_id == NULL || th->ID < thread_with_smallest_id->ID)
            thread_with_smallest_id = th;
    }

    struct threads_sched_result r;
    if (thread_with_smallest_id != NULL) {
        r.scheduled_thread_list_member = &thread_with_smallest_id->thread_list;
        r.allocated_time = thread_with_smallest_id->remaining_time;
    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
    }

    return r;
}
#endif

/* MP3 Part 1 - Non-Real-Time Scheduling */

// HRRN
#ifdef THREAD_SCHEDULER_HRRN
struct threads_sched_result schedule_hrrn(struct threads_sched_args args)
{
    struct threads_sched_result r;

    struct thread *hrrn_thread= NULL;
    struct thread *th = NULL;

    list_for_each_entry(th, args.run_queue, thread_list) {
        if (hrrn_thread == NULL)  
            hrrn_thread = th;
        else {
            int wt_hrrn=args.current_time - hrrn_thread->arrival_time; // wt == wait time
            int wt_th=args.current_time - th->arrival_time;
            if ((wt_hrrn+hrrn_thread->processing_time)*th->processing_time <
                (wt_th+th->processing_time)*hrrn_thread->processing_time){ // if (w1+b1)*b2<(w2+b2)*b1 => rr2>rr1
                hrrn_thread = th;
            } else if ((wt_hrrn+hrrn_thread->processing_time)*th->processing_time ==
                       (wt_th+th->processing_time)*hrrn_thread->processing_time) {
                        if (hrrn_thread->ID>th->ID)  
                            hrrn_thread = th;
            }
        }
    } 

    if (hrrn_thread != NULL) {
        r.scheduled_thread_list_member = &hrrn_thread->thread_list;
        r.allocated_time = hrrn_thread->remaining_time;
    } 
    else {    
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
    }

    return r;
}
#endif

#ifdef THREAD_SCHEDULER_PRIORITY_RR
// priority Round-Robin(RR)
struct threads_sched_result schedule_priority_rr(struct threads_sched_args args) 
{
    struct threads_sched_result r;
    struct thread *next = NULL;
    int p=0;
    int one_thread_in_priority=0;
    if(last_scheduled){
        p=last_scheduled->priority;
        //printf("ls != null\n");
    }
    for (;p<MAX_PRIORITY;p++){
        struct thread *first = NULL;
        struct thread *pos = NULL;
        

        if (last_scheduled) { //find last_scheduled in list
            list_for_each_entry(pos, args.run_queue, thread_list) {
                if(pos==last_scheduled){
                    break;
                }
            } 
           // printf("ls && ls=p\n");
        }
        //printf("preparing entry \n");
        pos = list_prepare_entry(pos, args.run_queue, thread_list);
        list_for_each_entry_continue(pos, args.run_queue, thread_list) {
            if (pos->priority != p){
                continue;
            }else { //find first thread, if there more than, it will be save to next
                if (first==NULL) first=pos;
                next=pos; 
            }
        }
        //printf("finished first run\n");
       

        if(!next){
            list_for_each_entry(pos, args.run_queue, thread_list) {
                 
                if (pos->priority != p){
                    continue;
                }else {
                    if (first==NULL) first=pos;
                    next=pos; 
                }
            }
            
        }
        one_thread_in_priority = (first==next) ? 1 : 0 ;
        next=first;

        //printf("finished second run\n");

        if(next != NULL) {
            //printf(" next != NULL and we are breking \n");
            break;
        }
        else  last_scheduled=NULL; //used to ensure pos won't point to an elemnt removed from queue

        //printf("p++\n");

    }

    if(next != NULL){
        last_scheduled=next;
        r.scheduled_thread_list_member = &next->thread_list;
        r.allocated_time = (one_thread_in_priority || next->remaining_time<args.time_quantum) ? 
                            next->remaining_time : args.time_quantum;
    } 
    else {    
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = 1;
        
    }      

    return r;
}
#endif



/* MP3 Part 2 - Real-Time Scheduling*/

#if defined(THREAD_SCHEDULER_EDF_CBS) || defined(THREAD_SCHEDULER_DM)
static struct thread *__check_deadline_miss(struct list_head *run_queue, int current_time)
{
    struct thread *th = NULL;
    struct thread *thread_missing_deadline = NULL;
    list_for_each_entry(th, run_queue, thread_list) {
        if (th->current_deadline <= current_time) {
            if (thread_missing_deadline == NULL)
                thread_missing_deadline = th;
            else if (th->ID < thread_missing_deadline->ID)
                thread_missing_deadline = th;
        }
    }
    return thread_missing_deadline;
}
#endif

#ifdef THREAD_SCHEDULER_DM/*
 Deadline-Monotonic Scheduling
static int __dm_thread_cmp(struct thread *a, struct thread *b)
{
    //To DO
}
*/
struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    struct threads_sched_result r;
    struct thread *next = NULL;
    struct release_queue_entry *awating_rqe = NULL;
    struct thread *th = NULL;
    // first check if there is any thread has missed its current deadline
    // TO DO
    
    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    if (thread_missing_deadline){
        //printf("found thread with missing dealind\n");
        r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
        r.allocated_time = 0;     
        return r;
    }
    

    list_for_each_entry(th, args.run_queue, thread_list) {
        if (next == NULL || th->period < next->period || 
            (th->period == next->period && th->ID < next->ID) )
        next = th;
    }

    struct release_queue_entry *ath=NULL;
    list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue with highest priority
        if (awating_rqe == NULL) 
            awating_rqe = ath;  
        else if(awating_rqe->release_time > ath->release_time)
            awating_rqe = ath;
        else if(awating_rqe->release_time == ath->release_time &&
                awating_rqe->thrd->period > ath->thrd->period) 
            awating_rqe = ath;  
    }
   
    
    int time_untill_awaiting_thread = 0;
    int preempt_thread_flag=0;
    if(awating_rqe){
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
        if (next){
            if(time_untill_awaiting_thread < next->remaining_time){    
                if(next->period > awating_rqe->thrd->period) 
                    preempt_thread_flag=1;
                else if(next->period == awating_rqe->thrd->period && 
                        next->ID > awating_rqe->thrd->ID)
                    preempt_thread_flag=1;
                        
            }
        }
    }
        

    if (next != NULL) {
        r.scheduled_thread_list_member = &next->thread_list;
        if(awating_rqe && preempt_thread_flag)
            r.allocated_time = time_untill_awaiting_thread;
        else
            r.allocated_time = next->remaining_time;

    } else {
        r.scheduled_thread_list_member = args.run_queue;
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    }

   
    return r;
}
#endif


#ifdef THREAD_SCHEDULER_EDF_CBS
// EDF with CBS comparation
/*
static int __edf_thread_cmp(struct thread *a, struct thread *b)
{
    // TO DO
}*/
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    __check_deadline_miss(args.run_queue,args.current_time);
    struct threads_sched_result r;
    struct thread *next = NULL;
    struct release_queue_entry *awating_rqe = NULL;
    struct release_queue_entry *h_awating_rqe = NULL;
    struct thread *th = NULL;

    struct thread *thread_missing_deadline = __check_deadline_miss(args.run_queue,args.current_time);
    if(thread_missing_deadline){
        printf("     we are very here \n");
        
            r.scheduled_thread_list_member = &thread_missing_deadline->thread_list;
            r.allocated_time = 0;     
            return r;
        
            //thread_missing_deadline->curr_deadline = args.current_time+thread_missing_deadline->period;
            
        
    }


    list_for_each_entry(th, args.run_queue, thread_list) {
        if (next == NULL || th->current_deadline < next->current_deadline || 
            (th->current_deadline == next->current_deadline && th->ID < next->ID) )
        next = th;
    }


    struct release_queue_entry *ath=NULL;


        list_for_each_entry(ath, args.release_queue, thread_list) {// find thread in release queue witheralist dealine
            if (awating_rqe == NULL) 
                awating_rqe = ath;  
            else if(awating_rqe->release_time > ath->release_time)
                awating_rqe = ath;
            else if(awating_rqe->release_time == ath->release_time &&
                    awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
                awating_rqe = ath;  
        }

        list_for_each_entry(ath, args.release_queue, thread_list) {// find hard thread in release queue with highest priority
            if (h_awating_rqe == NULL && ath->thrd->cbs.is_hard_rt) 
                h_awating_rqe = ath;  
            else if(ath->thrd->cbs.is_hard_rt && 
                    h_awating_rqe->release_time > ath->release_time)
                h_awating_rqe = ath;
            else if(ath->thrd->cbs.is_hard_rt && 
                    h_awating_rqe->release_time == ath->release_time &&
                    h_awating_rqe->thrd->current_deadline > ath->thrd->current_deadline) 
                    h_awating_rqe = ath;  
        }



    if(next && next->cbs.is_hard_rt)
        awating_rqe=h_awating_rqe;
   


    int time_untill_awaiting_thread = 0;
    int preempt_thread_flag=0;
    if(awating_rqe){
        time_untill_awaiting_thread=awating_rqe->release_time-args.current_time; 
        if (next){
            if(time_untill_awaiting_thread < next->remaining_time){
                if(!next->cbs.is_hard_rt && awating_rqe->thrd->cbs.is_hard_rt)
                    preempt_thread_flag=1;    
                else if(next->current_deadline > awating_rqe->thrd->current_deadline)
                    preempt_thread_flag=1;
                else if(next->current_deadline == awating_rqe->thrd->current_deadline && 
                        next->ID > awating_rqe->thrd->ID)
                    preempt_thread_flag=1;
                
            }
        }
    }

    
      

    //CBS mechanism
    if(next && !next->cbs.is_hard_rt){//only applys for soft threads
        printf("    cbs meachnism: curr_deadline is %d, curr_time is %d, cbs dead line is %d\n",
            next->current_deadline,args.current_time,next->cbs.throttle_new_deadline);

        
        int time_until_deadline= next->current_deadline-args.current_time;
        if (time_until_deadline <= 0){  
            //next->current_deadline += next->period;
           //next->cbs.remaining_budget=next->cbs.budget;
            printf("we are here\n");
        }
        if(next->period * next->cbs.remaining_budget > next->cbs.budget * time_until_deadline){
            next->current_deadline = next->current_deadline + next->period;
           // next->cbs.remaining_budget = next->cbs.budget;
           //next->cbs.is_throttled=1;
        }

            
    }

    if (next != NULL) {
        r.scheduled_thread_list_member = &next->thread_list;
        if(awating_rqe && preempt_thread_flag)
            r.allocated_time = time_untill_awaiting_thread;
        else
            r.allocated_time = next->remaining_time;

    } else {
        r.scheduled_thread_list_member = args.run_queue;
        printf("time_untill_awaiting_thread = %d\n",time_untill_awaiting_thread);
        r.allocated_time = (awating_rqe != NULL) ? time_untill_awaiting_thread : 1 ;
    }


    return r;

   




    // notify the throttle task
    // TO DO

    // first check if there is any thread has missed its current deadline
    // TO DO

    // handle the case where run queue is empty
    // TO DO

    return r;
}
#endif

/*    for (int p=0;p<MAX_PRIORITY;p++){
        struct list_head rr;
        INIT_LIST_HEAD(&rr);

        struct thread *th = NULL;
        list_for_each_entry(th, args.run_queue, thread_list) {
        if(th->priority==p)
            list_add(&th->thread_list,&rr);
        }
       // if (list_empty(&rr))
        //    continue;

        
        while(!list_empty(&rr)){
            th = NULL;
            list_for_each_entry(th, &rr, thread_list) {
                
            }
        }
*/

         /*
        awating_thread=awating_rqe->thrd;
        printf("args.current_time is %d, inside loop\n",args.current_time);
        printf("while loop: arr time is %d, period is %d\n",awating_rqe->thrd->arrival_time, awating_rqe->thrd->period) ;
       
        int i=0;
        while(awating_thread->arrival_time + i*awating_thread->period <= args.current_time){
            
            printf("res for loop %d is %d\n", i,awating_thread->arrival_time + i*awating_thread->period);
            i++;
        }
        time_untill_awaiting_thread = args.current_time - awating_thread->arrival_time + (i+1)*awating_thread->period;
        */