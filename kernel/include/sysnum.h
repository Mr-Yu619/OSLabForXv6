#ifndef __SYSNUM_H
#define __SYSNUM_H

// System call numbers
#define SYS_kill         6
// #define SYS_fstat        8
#define SYS_dev         10
#define SYS_sbrk        12
#define SYS_uptime      14
#define SYS_getcwd      17 // getcwd
#define SYS_trace       18
#define SYS_sysinfo     19
#define SYS_mkdir       20
#define SYS_test_proc   22
#define SYS_dup         23 // dup
#define SYS_dup3        24 // dup3
#define SYS_remove      25
#define SYS_rename      26
#define SYS_mkdirat     34 // mkdirat
#define SYS_unlinkat    35 //unlinkat
#define SYS_linkat      37 // linkat
#define SYS_umount2     39 // umount2
#define SYS_mount       40 // mount
#define SYS_chdir       49 // chdir
#define SYS_open        56
#define SYS_openat      56 // openat
#define SYS_close       57 // close
#define SYS_pipe        59
#define SYS_pipe2       59 // pipe2
#define SYS_getdents64  61 // getdents64   
#define SYS_read        63 // read
#define SYS_write       64 // write
#define SYS_fstat       80 // fstat
#define SYS_exit        93 // exit
#define SYS_nanosleep   101// nanosleep
#define SYS_sleep       101
#define SYS_sched_yield 124 // sched_yield
#define SYS_times       153 // times
#define SYS_uname       160 // uname
#define SYS_gettimeofday 169 // gettimeofday
#define SYS_getpid      172 // getpid
#define SYS_getppid     173 // getppid
#define SYS_brk         214 // brk
#define SYS_munmap      215 // munmap
#define SYS_mmap        222 // mmap
#define SYS_clone       220 // clone
#define SYS_execve      221 // execve
#define SYS_wait4       260 // wait4

#define SYS_fork        222
#define SYS_exec        223
#define SYS_readdir     224

#define SYS_wait        260
#define SYS_shutdown    210

#endif