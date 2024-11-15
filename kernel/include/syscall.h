#ifndef __SYSCALL_H
#define __SYSCALL_H

#include "types.h"
#include "sysnum.h"
#define __asm_syscall(...)  \
    __asm__ __volatile__("ecall\n\t" \
                    :"=r"(a0)       \
                    :__VA_ARGS__    \
                    :"memory");     \
                return a0;
static inline long __syscall0(long n){
    register long a7 __asm__("a7") = n;
    register long a0 __asm__("a0");
    __asm_syscall("r"(a7))
}
int fetchaddr(uint64 addr, uint64 *ip);
int fetchstr(uint64 addr, char *buf, int max);
int argint(int n, int *ip);
int argaddr(int n, uint64 *ip);
int argstr(int n, char *buf, int max);
void syscall(void);

#endif