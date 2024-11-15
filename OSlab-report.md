# 操作系统lab实验报告

## 实现
本组实验基于xv6-k210项目实现，也参考了xv6-riscv项目中的makefile代码


## 实现描述

### 1.对评测平台的适配

- 测评平台运行的指令为
```bash
qemu-system-riscv64 -machine virt -kernel kernel-qemu -m 128M -nographic -smp 2 -bios sbi-qemu -drive file=sdcard.img,if=none,format=raw,id=x0  -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0 -device virtio-net-device,netdev=net -netdev user,id=net -initrd initrd.img
``

关于makefile和项目设置的改动：
- 修改本地qemu运行时内存大小为32M：`-m 32M`

- 在`./tools/`下添加`run_test.sh`，当`xv6-user/init.c`编译完成后可以利用该脚本实现将`_init`这个ELF文件的代码和数据段以十六进制表示，写入`initcode.h`,之后会被`kernel/proc.c:287` include进代码里，以用户程序执行。

为了进行测试，`xv6-user/init.c`一一读取根目录下的可执行文件进行执行；一般对于操作系统而言，`init.c`应该打开shell程序，之后交由用户输入指令。

- 更新rustsbi
```bash
apt install unzip # 安装解压zip的软件
wget https://github.com/rustsbi/rustsbi-qemu/releases/download/v0.2.0-alpha.2/rustsbi-qemu-release.zip
unzip rustsbi-qemu-release.zip
mv rustsbi-qemu bootloader/SBI/sbi-qemu
rm -rf rustsbi-qemu-release.zip rustsbi-qemu.bin
```

- 在调试时出现过动态链接库无法找到的情形，
riscv64-unknown-elf-gdb运行时加载共享库失败：
https://stackoverflow.com/questions/20842732/libpython2-7-so-1-0-cannot-open-shared-object-file-no-such-file-or-directory
```bash
apt-get install libncurses5
apt-get install libpython2.7
apt-get install libatlas3-base
```



### 2.调试设置(gdb)：

- 添加了挂载sdcard.img的功能，方便debug等操作：
```makefile
dst=/mnt
mount:
	mount sdcard.img $(dst)
umount: 
	umount $(dst)
```


.gdbinit设置：打开xv6-riscv工程把makefile里对应调试部分给copy下来
```makefile
GDBPORT = $(shell expr `id -u` % 5000 + 25000)
.gdbinit: .gdbinit.tmpl-riscv
	sed "s/:1234/:$(GDBPORT)/" < $^ > $@
QEMUGDB = $(shell if $(QEMU) -help | grep -q '^-gdb'; \
	then echo "-gdb tcp::$(GDBPORT)"; \
	else echo "-s -p $(GDBPORT)"; fi)

qemu-gdb: kernel-qemu .gdbinit sdcard.img
	@echo "*** Now run 'gdb' in another window." 1>&2
	$(QEMU) $(QEMUOPTS) -S $(QEMUGDB)
```

仿照`xv6-riscv`，在工程根目录新建`.gdbinit.tmpl-riscv`，这是一个生成`.gdbinit`，也就是gdb启动脚本的模板，生成方式是在makefile中指定的。
```
set confirm off
set architecture riscv:rv64
target remote 127.0.0.1:1234
symbol-file kernel-qemu
```
此外还要在`~/.config/gdb/gdbinit`设置`auto-load safe-path`(不设置应该也可以?):

```bash
root@1d551102c7d0:~# cat ~/.config/gdb/gdbinit 
add-auto-load-safe-path /path/to/project/.gdbinit
```

针对riscv指令集的调试需要安装`gdb-multiarch`。运行`gdb-multiarch`后程序会读取cwd下`.gdbinit`中的命令（也可以通过加参数`-x .gdbinit`），和运行的qemu通过通信来调试。

一些常用的指令（这些也是可以放进.gdbinit自动执行的）：
```
layout asm :查看汇编 
layout src :查看源码
layout regs:显示寄存器
ctrl-x o: 改变活跃窗口
info win: 显示窗口信息
target :port :连接远程调试(默认127.0.0.1)
target host:port : 连接远程调试
set disassemble-next-line auto : 设置自动显示下一行汇编
b main :给main符号设断点
c :运行到断点
s :下一行代码（有函数调用会step in）
n : 下一行代码（跳过函数调用）
# 汇编
si :下一行指令（有函数调用会step in）
ni :下一行指令（跳过jalr等指令调用）
```

### 3.docker与git等基础设置
```bash
docker pull docker.educg.net/cg/os-contest:2024p6
docker image ls #找到image id
docker run -it --privileged=true [imgage-id] /bin/bash
```
run这个命令相当于挂着一个不用的bash，exit之后容器也会停止。只要重新打开容器，容器就不会自行关闭，这时候就可以通过docker desktop来控制容器的开关了，也可以将vscode附加到这个容器上完成实验。
```bash
git clone https://github.com/HUST-OS/xv6-k210.git
git clone https://github.com/riscv/riscv-gnu-toolchain.git
./configure --prefix=/opt/riscv --with-arch=rv32gc --with-abi=ilp32d
# 或./configure --prefix=/opt/riscv 安装rv64工具链
make linux
```
### 4.测试样例配置
实验所用的测试样例全部公开，可以找到测试样例的仓库clone下来，将bin和src目录链接到`./tests/bin`,`./tests/src`。
```bash
cd ./tests
git clone https://github.com/oscomp/testsuits-for-oskernel.git
root@1d551102c7d0:~/xv6-k210/xv6-k210# ls -l
total 1068
lrwxrwxrwx 1 root root      68 May 29 17:36 bin -> ../tests/testsuits-for-oskernel/riscv-syscalls-testing/user/riscv64/
-rw-r--r-- 1 root root   12462 Jun 17 04:56 oscomp_syscalls.md
lrwxrwxrwx 1 root root      71 May 29 17:37 src -> ../tests/testsuits-for-oskernel/riscv-syscalls-testing/user/src/oscomp/
drwxr-xr-x 5 root root    4096 Jun 15 15:25 testsuits-for-oskernel
```
这个project提供了makefile，可以编译后将所有测试样例放到文件镜像中运行:
```bash
mount sdcard.img /mnt/
dir_='./tests/bin/'
for file in `ls $dir_`; do
    # echo $dir_
    # echo $file
    cp "$dir_$file" /mnt/
done
umount /mnt/
```
### 利用设备树理解系统底层

我们可以将qemu在测试qemu环境的这种setting下的设备树信息打印出来，然后将二进制设备树(dtb)文件转化为人可读的dts格式：
qemu exposes a simple way to dump info about a machine in dtb(device tree table format)
```bash
qemu-system-riscv64 -machine virt -m 128M -nographic -smp 2 -drive file=sdcard.img,if=none,format=raw,id=x0  -device virtio-blk-device,drive=x0,bus=virtio-mmio-bus.0 -device virtio-net-device,netdev=net -netdev user,id=net -machine dumpdtb=riscv64-virt.dtb
```
use the dtc(device tree compiler)
```bash
apt-get install device-tree-compiler #安装dtc
dtc -I dtb -O dts -o riscv64-virt.dts riscv64-virt.dtb
```
This gives us a file `called riscv64-virt.dts`, which has lots of interesting information about virt such as the number of available CPU cores, the memory location of various peripherals such as the UART, and the memory location of the onboard memory (RAM).
之后可以看到该设备的许多有用的内存映射信息，例如每项设备都用一个大括号表示，大括号之间的层级表示设备间的层级。关于其中的项，`address-cells`表示用几个cell表示一个地址，`size-cells`表示用几个cell表示一个大小。定义了这两个数值后后面的子树中都会默认采用这两个参数，因此
```
/ {
	#address-cells = <0x02>;
	#size-cells = <0x02>;
	memory@80000000 {
		device_type = "memory";
		reg = <0x00 0x80000000 0x00 0x8000000>;
	};
}
```
表示内存位置从`0x80000000`开始，长度`0x8000000=2^27`个字节(128M)，这和上面的设置`-m 128M`对应。

再比如，`compatible`字段表示的一般是类似于型号这种，也唯一确定了该设备应该如何操作，可以将此字段在网络上查询得到更多信息。


### references

gcc inline assembly:
http://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html#s1

gdb cheatsheet:
https://cs.brown.edu/courses/cs033/docs/guides/gdb.pdf

riscv manual:
https://riscv.org/wp-content/uploads/2019/12/riscv-spec-20191213.pdf

