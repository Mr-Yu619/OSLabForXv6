#include "include/types.h"
#include "include/syscall.h"
#include "include/timer.h"
#include "include/vm.h"
#include "kernel/constants.h"
#include "include/string.h"
// #include "include/defs.h"
struct timespec {
    int tv_sec; // secs
    long tv_nsec; // nanosecs
};
static struct utsname uts = {
    "riscv k210 / lifeisphy",
    "node name",
    "release",
    "version 0.0.0",
    "machine name",
    "domain name"
};
struct tms {
    long tms_utime;  /* user time */
    long tms_stime;  /* system time */
    long tms_cutime; /* user time of children */
    long tms_cstime; /* system time of children */
};
uint64 sys_gettimeofday(void){
    uint64 time_addr,timezone;
    if(argaddr(0,&time_addr) < 0 || argaddr(1, &timezone) < 0)
        return -1;
    struct timespec curr_time;
    curr_time.tv_sec = ticks;
    // curr_time.tv_nsec = *(uint64 *)CLINT_MTIME;
    curr_time.tv_sec = ticks;
    copyout2(time_addr,(char*)&curr_time,sizeof(curr_time));
    return 0;
}
uint64 sys_times(void){
    uint64 tms_addr;
    if(argaddr(0,&tms_addr) < 0) return -1;

    struct tms curr_time;
    curr_time.tms_cstime = curr_time.tms_cutime = curr_time.tms_stime = curr_time.tms_utime = ticks;
    copyout2( tms_addr, (char*)&curr_time, sizeof(struct tms));
    return 0;
}
uint64 sys_uname(void){
    
    uint64 uts_addr;
    if(argaddr(0,&uts_addr) < 0) return -1;

    copyout2( uts_addr, (char*)& uts,sizeof(struct utsname));
    return 0;
}