// init: The initial user-level program

#include "kernel/include/types.h"
#include "kernel/include/stat.h"
#include "kernel/include/file.h"
#include "kernel/include/fcntl.h"
#include "xv6-user/user.h"


char *argv[] = { "sh", 0 };
char *tester_list[] = {
    "exit",
    // 添加更多的程序
};
int
main(void)
{
  dev(O_RDWR, CONSOLE, 0);
  dup(0); // stdout
  dup(0); // stderr

  for(int i = 0; i< sizeof(tester_list)/sizeof(tester_list[0]);i++)
  {
    char* tester_i = tester_list[i];
    //1.用fork新建一个线程，在子线程中执行 tester i
    //2.等待子线程结束
    int pid = fork();
    if(pid == 0){
      exec(tester_i, argv);
    }
  }
  int a;
  wait(&a);
  (*(volatile uint32 *) 0x100000) = 0x5555; // write PHYSICAL address
  return 1;
}
