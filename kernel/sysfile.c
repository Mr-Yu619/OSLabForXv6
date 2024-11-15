//
// File-system system calls.
// Mostly argument checking, since we don't trust
// user code, and calls into file.c and fs.c.
//


#include "include/types.h"
#include "include/riscv.h"
#include "include/param.h"
#include "include/stat.h"
#include "include/spinlock.h"
#include "include/proc.h"
#include "include/sleeplock.h"
#include "include/file.h"
#include "include/pipe.h"
#include "include/fcntl.h"
#include "include/fat32.h"
#include "include/syscall.h"
#include "include/string.h"
#include "include/printf.h"
#include "include/vm.h"
#include "include/memlayout.h"
#include "kernel/constants.h"
// #define TEST
// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == NULL)
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *p = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(p->ofile[fd] == 0){
      p->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
}

uint64
sys_dup3(void)
{
  int fd1,fd2,fd3;
  struct file* f1;
  if(argfd(0,&fd1,&f1) < 0 ||
    argint(1,&fd2) < 0 || 
    argint(2,&fd3) < 0) 
      return -1;
  if(fd3 != 0){ // fd3非零时行为没有定义
    printf("fd3!=0,undefined!\n");
    return -1;
  }
  struct proc* p = myproc();

  if(fd2 >= 0 && fd2 < NFILE && p->ofile[fd2] != NULL){
    fileclose(p->ofile[fd2]);
  }

  if(!f1){ // 没有复制的目标！
  printf("f1 is null,undefined!\n");
    return -1;
  }
  struct file* fp = filedup(f1);
  p->ofile[fd2] = fp;
  return fd2;
}
uint64
sys_dup(void)
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}

uint64
sys_read(void)
{
  #ifdef TEST
  printf("called sys_read");
  #endif
  struct file *f;
  int n;
  uint64 p;

  if(
    argfd(0, 0, &f) < 0 || 
    argint(2, &n) < 0 || 
    argaddr(1, &p) < 0
    ){
    return -1;
    }
  return fileread(f, p, n);
}

uint64
sys_write(void)
{
  #ifdef TEST
  printf("called sys_write");
  #endif
  struct file *f;
  int n;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argaddr(1, &p) < 0){
    return -1;
  }

  return filewrite(f, p, n);
}

uint64
sys_close(void)
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}

uint64
sys_fstat(void)
{
  struct file *f;
  uint64 st; // user pointer to struct stat

  if(argfd(0, 0, &f) < 0 || argaddr(1, &st) < 0)
    return -1;
  return filestat(f, st);
}
static struct dirent* 
create_at(struct dirent* dp,char* filename,short type, int mode){
  // 在目录dp下创建文件filename
  if(!(dp->attribute & ATTR_DIRECTORY)){
    // printf("ep not directory!\n");
    return NULL;
  }
  struct dirent *ep;
  elock(dp);
  if((ep = ealloc(dp,filename,mode)) == NULL){
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    eunlock(dp);
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
  eput(dp);

  elock(ep);
  return ep;
}
static struct dirent*
create(char *path, short type, int mode)
{
  // create the file at path(full filename + path)
  struct dirent *ep, *dp;
  char name[FAT32_MAX_FILENAME + 1];

  if((dp = enameparent(path, name)) == NULL)
    return NULL;

  if (type == T_DIR) {
    mode = ATTR_DIRECTORY;
  } else if (mode & O_RDONLY) {
    mode = ATTR_READ_ONLY;
  } else {
    mode = 0;  
  }

  elock(dp);
  if ((ep = ealloc(dp, name, mode)) == NULL) {
    eunlock(dp);
    eput(dp);
    return NULL;
  }
  
  if ((type == T_DIR && !(ep->attribute & ATTR_DIRECTORY)) ||
      (type == T_FILE && (ep->attribute & ATTR_DIRECTORY))) {
    eunlock(dp);
    eput(ep);
    eput(dp);
    return NULL;
  }

  eunlock(dp);
  eput(dp);

  elock(ep);
  return ep;
}

uint64
sys_open(void)
{
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep;

  if(
    argstr(0, path, FAT32_MAX_PATH) < 0 || 
    argint(1, &omode) < 0
  )// path包括路径+文件名
    return -1;
  // printf("calling sys_open(path=%s,omode=%x)\n",path,omode);
  if(omode & O_CREATE){// create new file in path
    ep = create(path, T_FILE, omode);
    if(ep == NULL){
      return -1;
    }
  } else {
    if((ep = ename(path)) == NULL){ // if file not found in path
      // printf("err1");
      return -1;
    }
    elock(ep);
    // 如果打开的是dir,omode没有dir flag
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_DIRECTORY){
      eunlock(ep);
      eput(ep);
      // printf("err2");
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    if (f) {
      fileclose(f);
    }
    eunlock(ep);
    eput(ep);
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    etrunc(ep);
  }

  f->type = FD_ENTRY;
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
  f->ep = ep;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);

  eunlock(ep);

  return fd;
}

uint64
sys_mkdir(void)
{
  char path[FAT32_MAX_PATH];
  struct dirent *ep;

  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = create(path, T_DIR, 0)) == 0){
    return -1;
  }
  eunlock(ep);
  eput(ep);
  return 0;
}

// unfinished
uint64 sys_mkdirat(void){
  // sys_mkdir(int dirfd, char* path, mode_t mode);
  char path[FAT32_MAX_PATH];
  struct dirent *at;
  int dirfd;
  int mode;
  // printf("in %s:",__func__);
  if(argint(0,&dirfd) < 0 || 
    argstr(1, path, FAT32_MAX_PATH) < 0 || 
    argint(2, &mode) < 0)
    return -1;
  if(dirfd == AT_FDCWD){
    myproc()->trapframe->a0 = myproc()->trapframe->a1;
    return sys_mkdir();
    // at = myproc()->cwd;
  }else if(dirfd >= 0){
    at = myproc()->ofile[dirfd]->ep;
  }else return -1;
  // printf("calling sys_mkdirat(dirfd=%d,path=%s,mode=%x)\n",dirfd,path,mode);
  
  elock(at);
  struct dirent* ep;
  if((ep = ealloc(at,path,mode)) == 0){
    eunlock(at);
    // eput(ep);
    eput(at);
    return -1;
  }
  if (!(ep->attribute & ATTR_DIRECTORY)) {
    eunlock(at);
    eput(ep);
    eput(at);
    return -1;
  }
  eunlock(at);
  eput(ep);
  eput(at);
  // printf("sys_mkdirat ret 0\n");
  return 0;
}
uint64
sys_mount(void){return 0;}
uint64
sys_umount(void){return 0;}
uint64
sys_unlinkat(void){return 0;}
uint64 sys_openat(void){
  // #ifdef TEST
  // printf("called sys_openat");
  // return 1;
  // #endif
  // open(int fd,const char* filename,int flags,mode_t mode);
  char path[FAT32_MAX_PATH];
  int fd, omode;
  struct file *f;
  struct dirent *ep, *at;

  int flags;
  // int fd;
  if(
    argint(0,&fd) < 0 ||
    argstr(1, path, FAT32_MAX_PATH) < 0 || 
    argint(2, &flags) < 0 ||
    argint(3, &omode) < 0 
  )
    return -1;
  // printf("called sys_openat(fd=%d,path=%s,flags=%x,mode=%x)",fd,path,flags,omode);
  if(fd == AT_FDCWD){
    struct proc* p = myproc();
    p->trapframe->a0 = p->trapframe -> a1;
    p->trapframe->a1 = p->trapframe->a2;
    // p->trapframe->a1 = omode;
    uint64 ret = sys_open();
    // printf("return:%d\n",ret);
    return ret;
  }else{
    if(!(myproc()->ofile[fd]->ep->attribute & ATTR_DIRECTORY)){
      // printf("not directory!");
      return -1;
    }
    at = myproc()->ofile[fd]->ep;
    if(at == NULL) {
      // printf("err0");
      return -1;
    }
  }
  if(flags & O_CREATE){
    // 新建文件
    ep = create_at(at, path, T_FILE, omode);
    if(ep == NULL){
      // printf("err2");
      return -1;
    }
  } else {
    // 打开已有文件
    elock(at);
    ep = dirlookup(at,path,0);
    eunlock(at);
    if(ep == NULL){
      // printf("err1");
      return -1;
    }
    elock(ep);
    if((ep->attribute & ATTR_DIRECTORY) && omode != O_RDONLY){
      eunlock(ep);
      eput(ep);
      // printf("err4");
      return -1;
    }
  }

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    if (f) {
      fileclose(f);
    }
    eunlock(ep);
    eput(ep);
    // printf("err5");
    return -1;
  }

  if(!(ep->attribute & ATTR_DIRECTORY) && (omode & O_TRUNC)){
    etrunc(ep);
  }

  f->type = FD_ENTRY;
  f->off = (omode & O_APPEND) ? ep->file_size : 0;
  f->ep = ep;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);

  eunlock(ep);

  return fd;
}

struct dirent_tmp {
    uint64 d_ino;
    int64 d_off;
    unsigned short d_reclen;
    unsigned char d_type;
    char d_name[];
};
uint64
sys_getdents(void)
{
  int fd;
  uint64 buf_addr;
  int len;
  if(
    argint(0,&fd) < 0 ||
    argaddr(1,&buf_addr) < 0 || 
    argint(2,&len) < 0
  ){
    return -1;
  }
  if(myproc()->ofile[fd]->type != FD_ENTRY){
    printf("err: not entry!\n");
    return -1;
  }
  // struct dirent* dp = myproc()->ofile[fd]->ep;
  return 0;
}

uint64
sys_chdir(void)
{
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  struct proc *p = myproc();
  
  if(argstr(0, path, FAT32_MAX_PATH) < 0 || (ep = ename(path)) == NULL){
    return -1;
  }
  elock(ep);
  if(!(ep->attribute & ATTR_DIRECTORY)){
    eunlock(ep);
    eput(ep);
    return -1;
  }
  eunlock(ep);
  eput(p->cwd);
  p->cwd = ep;
  return 0;
}

uint64
sys_pipe(void)
{
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();

  if(argaddr(0, &fdarray) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      p->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  // if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
  //    copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
  if(copyout2(fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
     copyout2(fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    p->ofile[fd0] = 0;
    p->ofile[fd1] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  return 0;
}

// To open console device.
uint64
sys_dev(void)
{
  int fd, omode;
  int major, minor;
  struct file *f;

  if(argint(0, &omode) < 0 || argint(1, &major) < 0 || argint(2, &minor) < 0){
    return -1;
  }

  if(omode & O_CREATE){
    panic("dev file on FAT");
  }

  if(major < 0 || major >= NDEV)
    return -1;

  if((f = filealloc()) == NULL || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    return -1;
  }

  f->type = FD_DEVICE;
  f->off = 0;
  f->ep = 0;
  f->major = major;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);

  return fd;
}

// To support ls command
uint64
sys_readdir(void)
{
  struct file *f;
  uint64 p;

  if(argfd(0, 0, &f) < 0 || argaddr(1, &p) < 0)
    return -1;
  return dirnext(f, p);
}

// get absolute cwd string
uint64
sys_getcwd(void)
{
  uint64 addr;
  if (argaddr(0, &addr) < 0)
    return NULL;
  int size;
  if(argint(1,&size) < 0) return NULL;

  struct dirent *de = myproc()->cwd;
  char path[FAT32_MAX_PATH];
  char *s;
  int len;

  if (de->parent == NULL) {
    s = "/";
  } else {
    s = path + FAT32_MAX_PATH - 1;
    *s = '\0';
    while (de->parent) {
      len = strlen(de->filename);
      s -= len;
      if (s <= path)          // can't reach root "/"
        return NULL;
      strncpy(s, de->filename, len);
      *--s = '/';
      de = de->parent;
    }
  }
  if(addr == 0){// TODO:系统分配缓存区
    return NULL;
  }
  // if (copyout(myproc()->pagetable, addr, s, strlen(s) + 1) < 0)
  int str_size = strlen(s) + 1 ;
  if (copyout2(addr, s, str_size < size ? str_size : size) < 0)
    return NULL;
  
  return addr;

}

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct dirent *dp)
{
  struct dirent ep;
  int count;
  int ret;
  ep.valid = 0;
  ret = enext(dp, &ep, 2 * 32, &count);   // skip the "." and ".."
  return ret == -1;
}

uint64
sys_remove(void)
{
  char path[FAT32_MAX_PATH];
  struct dirent *ep;
  int len;
  if((len = argstr(0, path, FAT32_MAX_PATH)) <= 0)
    return -1;

  char *s = path + len - 1;
  while (s >= path && *s == '/') {
    s--;
  }
  if (s >= path && *s == '.' && (s == path || *--s == '/')) {
    return -1;
  }
  
  if((ep = ename(path)) == NULL){
    return -1;
  }
  elock(ep);
  if((ep->attribute & ATTR_DIRECTORY) && !isdirempty(ep)){
      eunlock(ep);
      eput(ep);
      return -1;
  }
  elock(ep->parent);      // Will this lead to deadlock?
  eremove(ep);
  eunlock(ep->parent);
  eunlock(ep);
  eput(ep);

  return 0;
}

// Must hold too many locks at a time! It's possible to raise a deadlock.
// Because this op takes some steps, we can't promise
uint64
sys_rename(void)
{
  char old[FAT32_MAX_PATH], new[FAT32_MAX_PATH];
  if (argstr(0, old, FAT32_MAX_PATH) < 0 || argstr(1, new, FAT32_MAX_PATH) < 0) {
      return -1;
  }

  struct dirent *src = NULL, *dst = NULL, *pdst = NULL;
  int srclock = 0;
  char *name;
  if ((src = ename(old)) == NULL || (pdst = enameparent(new, old)) == NULL
      || (name = formatname(old)) == NULL) {
    goto fail;          // src doesn't exist || dst parent doesn't exist || illegal new name
  }
  for (struct dirent *ep = pdst; ep != NULL; ep = ep->parent) {
    if (ep == src) {    // In what universe can we move a directory into its child?
      goto fail;
    }
  }

  uint off;
  elock(src);     // must hold child's lock before acquiring parent's, because we do so in other similar cases
  srclock = 1;
  elock(pdst);
  dst = dirlookup(pdst, name, &off);
  if (dst != NULL) {
    eunlock(pdst);
    if (src == dst) {
      goto fail;
    } else if (src->attribute & dst->attribute & ATTR_DIRECTORY) {
      elock(dst);
      if (!isdirempty(dst)) {    // it's ok to overwrite an empty dir
        eunlock(dst);
        goto fail;
      }
      elock(pdst);
    } else {                    // src is not a dir || dst exists and is not an dir
      goto fail;
    }
  }

  if (dst) {
    eremove(dst);
    eunlock(dst);
  }
  memmove(src->filename, name, FAT32_MAX_FILENAME);
  emake(pdst, src, off);
  if (src->parent != pdst) {
    eunlock(pdst);
    elock(src->parent);
  }
  eremove(src);
  eunlock(src->parent);
  struct dirent *psrc = src->parent;  // src must not be root, or it won't pass the for-loop test
  src->parent = edup(pdst);
  src->off = off;
  src->valid = 1;
  eunlock(src);

  eput(psrc);
  if (dst) {
    eput(dst);
  }
  eput(pdst);
  eput(src);

  return 0;

fail:
  if (srclock)
    eunlock(src);
  if (dst)
    eput(dst);
  if (pdst)
    eput(pdst);
  if (src)
    eput(src);
  return -1;
}
uint64 sys_shutdown(void){

  printf("shutting down...\n");
  #ifdef QEMU
  printf("writing %p into %p...",0x5555,VIRT_SHUTDOWN_V);
  (*(volatile uint32 *) VIRT_SHUTDOWN_V) = 0x5555;
  #else
  printf("I dont know how to shutdown...\n");
  #endif
  return 0;
}