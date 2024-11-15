
#include "include/types.h"
#include "include/riscv.h"
#include "include/param.h"
#include "include/memlayout.h"
#include "include/spinlock.h"
#include "include/proc.h"
#include "include/syscall.h"
#include "include/timer.h"
#include "include/kalloc.h"
#include "include/string.h"
#include "include/printf.h"

#include "include/vm.h"
#include "kernel/constants.h"
extern int exec(char *path, char **argv);
extern int cloneproc(uint64 stack);

uint64
sys_exec(void)
{
  char path[FAT32_MAX_PATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || argaddr(1, &uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv)){
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
      goto bad;
    }
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    argv[i] = kalloc();
    if(argv[i] == 0)
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);

  return ret;

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    kfree(argv[i]);
  return -1;
}
uint64
sys_execve(void)
{
  // a simplified implementation ( no envp working )
  return sys_exec();
}
uint64
sys_exit(void)
{
  int n;
  if(argint(0, &n) < 0)
    return -1;
  exit(n);
  return 0;  // not reached
}

uint64
sys_getpid(void)
{
  return myproc()->pid;
}
uint64 
sys_getppid(void)
{
  return myproc()->parent->pid;
}
uint64
sys_clone(void)
{
  int flags;
  uint64 stack;
  int ptid;
  int tls;
  int ctid;
  if(
    argint(0,&flags) < 0 ||  // SIGCHILD=17
    argaddr(1,&stack) < 0 ||  // stack pointer
    argint(2,&ptid) < 0 ||  // 
    argint(3,&tls) < 0 || 
    argint(4,&ctid) < 0 
  )
    return -1;
  if(flags != 17) return -1;

  if(stack == 0){
    return fork();
  }
  // printf("sys_clone(flags=%d,stack=%x,ptid=%d,tls=%d,ctid=%d)\n",flags,stack,ptid,tls,ctid);
  
  return cloneproc(stack);
}

uint64
sys_fork(void)
{
  return fork();
}
uint64
sys_sched_yield(void){
  yield();
  return 0;
}
uint64
sys_wait4(void)
{
  int pid;
  uint64 status;
  int options;
  if(argint(0, &pid) < 0 || 
    argaddr(1,&status)< 0 || 
    argint(2,&options) < 0
  )
    return -1;
  // printf("wait(pid=%d,status=%x,options=%d)\n",pid,status,options);
  if(pid == -1)
    return wait(status);
  else{
    int ret =  waitpid(pid,status,options);

    printf("return=%d\n",ret);
    return ret;
    // return -1;
  }
}
uint64
sys_wait(void)
{
  uint64 p;
  if(argaddr(0, &p) < 0)
    return -1;
  return wait(p);
}

uint64
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

// uintptr_t brk;
// uintptr_t ret = syscall(SYS_brk, brk); brk(0)返回当前堆顶值；其他非零值调用时，调整内存页到该位置
uint64
sys_brk(void)
{

  // return sys_sbrk();
  uint64 addr,prev;
  if(argaddr(0,&addr) < 0)
    return -1;
  prev = myproc()->sz;
  if(addr == 0){ // return curr program break value
    // myproc()->trapframe->a0 = 0;
    return prev;
  }else { // return 
    if(growproc(addr - prev) < 0)
      return -1;
    return 0;
  }
}

/**
 * * 功能：将文件或设备映射到内存中；
* 输入：
    - start: 映射起始位置，
    - len: 长度，
    - prot: 映射的内存保护方式，可取：PROT_EXEC, PROT_READ, PROT_WRITE, PROT_NONE
    - flags: 映射是否与其他进程共享的标志，
    - fd: 文件句柄，
    - off: 文件偏移量；
* 返回值：成功返回已映射区域的指针，失败返回-1;
```
void *start, size_t len, int prot, int flags, int fd, off_t off
long ret = syscall(SYS_mmap, start, len, prot, flags, fd, off);
```
 */
uint64 sys_mmap(void){
  uint64 start_addr;
  int len,prot,flags,fd,off;
  if(argaddr(0,&start_addr) < 0 ||
    argint(1,&len) < 0 ||
    argint(2,&prot) < 0 ||
    argint(3,&flags) < 0 ||
    argint(4,&fd) < 0 ||
    argint(5,&off) < 0
    ){
      return -1;
    }
    // printf("%s(start_addr=%ld,len=%d,prot=%d,flags=%d,fd=%d,off=%d)\n","sys_mmap",start_addr,len,prot,flags,fd,off);
    // struct proc* p = myproc();
    return -1;
}
/*
void *start, size_t len
int ret = syscall(SYS_munmap, start, len);
功能：将文件或设备取消映射到内存中；
输入：映射的指定地址及区间；
返回值：成功返回0，失败返回-1;
*/
uint64 sys_munmap(void){
  uint64 addr;
  int len;
  if(argaddr(0,&addr) < 0 || argint(1,&len) < 0)
    return -1;
  // pagetable_t pgtable = myproc()->pagetable;
  uint64 npage = len / PGSIZE;
  if(len % PGSIZE != 0){
    npage ++;
  }
  // printf("unmap addr @%x,len=%d(npage=%d)\n",addr,len,npage);
  // vmunmap(pgtable,addr,npage,1);
  return 0;
}

uint64
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  // printf("sleep(%d)\n",n);
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
struct timespec {
  uint64 tv_sec;
  uint64 tv_nsec;
};
uint64 
sys_nanosleep(void){
  // return 0;
  uint64 spec_addr,spec_addr2;
  if(argaddr(0,&spec_addr) < 0 || 
    argaddr(1,&spec_addr2) < 0)
    return -1;
  struct timespec spec;//,spec2;
  copyin(myproc()->pagetable,(char*)&spec,spec_addr,sizeof(struct timespec));
  // printf("nanosleep(tv_sec=%d,tv_nsec=%d)\n",spec.tv_sec,spec.tv_nsec);
  myproc()->trapframe->a0 = spec.tv_sec;
  return sys_sleep();
}
uint64
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}

uint64
sys_trace(void)
{
  int mask;
  if(argint(0, &mask) < 0) {
    return -1;
  }
  myproc()->tmask = mask;
  return 0;
}