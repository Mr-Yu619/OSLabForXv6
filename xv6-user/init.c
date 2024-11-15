// init: The initial user-level program

#include "kernel/include/types.h"
#include "kernel/include/stat.h"
#include "kernel/include/file.h"
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"
#include "kernel/include/sysnum.h"
#include "kernel/include/syscall.h"
// char *argv[] = { "sh", 0 };
char* argv[] = { 0};
char* tests[] = {
  // "sh",
  "times",
  "execve",
  "dup",
  "read",
  "mkdir_",
  "dup2",
  "uname",
  "gettimeofday",
  "openat",
  "open",
  "write",
  "close",
  "getpid",
  "getppid",
  "clone",
  "exit",
  "fork",
  "chdir",
  "pipe",
  "wait",
  "brk",
  "getcwd",

  "waitpid",
  "getdents",
  "fstat",
  "yield",
  "mmap",
  "munmap",
  "umount",
  "unlink",
  "mount",
  "sleep",
};

int
main(void)
{
  int pid, wpid;
  
  // if(open("console", O_RDWR) < 0){
  //   mknod("console", CONSOLE, 0);
  //   open("console", O_RDWR);
  // }
  dev(O_RDWR, CONSOLE, 0);
  dup(0);  // stdout
  dup(0);  // stderr
  int counts =NELEM(tests);// sizeof(tests)/ sizeof(tests[0]);
  for(int i=0;i< counts;i++){
    printf("init: starting %s\n",tests[i]);
    pid = fork();
    if(pid < 0){
      printf("init: fork failed\n");
      exit(1);
    }
    if(pid == 0){
      // exec("sh", argv);
      // argv[0] = tests[i];
      exec(tests[i],argv);
      printf("init: exec %s failed\n",tests[i]);
      exit(1);
    }

    for(;;){
      // this call to wait() returns if the shell exits,
      // or if a parentless process exits.
      wpid = wait((int *) -1);
      if(wpid == pid){
        // the shell exited; restart it.
        // exit(0);
        break;
      } else if(wpid < 0){
        printf("init: wait returned an error\n");
        exit(1);
      } else {
        // it was a parentless process; do nothing.
      }
    }
  }
  __syscall0(SYS_shutdown);
  return 0;
}
