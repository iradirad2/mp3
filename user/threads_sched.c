#include "kernel/types.h"
#include "user/user.h"
#include "user/list.h"
#include "user/threads.h"
#include "user/threads_sched.h"
#include <limits.h>
#define NULL 0

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
    // TO DO
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

#ifdef THREAD_SCHEDULER_DM
/* Deadline-Monotonic Scheduling */
static int __dm_thread_cmp(struct thread *a, struct thread *b)
{
    //To DO
}

struct threads_sched_result schedule_dm(struct threads_sched_args args)
{
    struct threads_sched_result r;

    // first check if there is any thread has missed its current deadline
    // TO DO

    // handle the case where run queue is empty
    // TO DO

    return r;
}
#endif


#ifdef THREAD_SCHEDULER_EDF_CBS
// EDF with CBS comparation
static int __edf_thread_cmp(struct thread *a, struct thread *b)
{
    // TO DO
}
//  EDF_CBS scheduler
struct threads_sched_result schedule_edf_cbs(struct threads_sched_args args)
{
    struct threads_sched_result r;

    // notify the throttle task
    // TO DO

    // first check if there is any thread has missed its current deadline
    // TO DO

    // handle the case where run queue is empty
    // TO DO

    return r;
}
#endif