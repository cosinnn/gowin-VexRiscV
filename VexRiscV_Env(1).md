//--------------------------------------------------
//配置VPN
//--------------------------------------------------

//--------------------------------------------------
//换源,更新软件(非必要步骤)
//--------------------------------------------------
sudo apt-get update
//!!!!
sudo apt-get upgrade  //!!!!非必要步骤.运行前,确保知道这条命令的含义,更新可能会破坏你原先的稳定环境.!!!!
//!!!!


//--------------------------------------------------
//--------------------------------------------------
//环境搭建
//--------------------------------------------------
//--------------------------------------------------

//--------------------------------------------------
//安装JDK
//--------------------------------------------------
sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jdk -y
sudo update-alternatives --config java     //命令无效果时可忽略
sudo update-alternatives --config javac    //命令无效果时可忽略

//--------------------------------------------------
//安装SBT(方法一可能失效)
//--------------------------------------------------
//方法一
echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | sudo tee /etc/apt/sources.list.d/sbt.list
echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt_old.list
sudo apt-get install curl
curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
sudo apt-get update
sudo apt-get install sbt
//--------------------------------------------------
//方法二
//从GitHub上下载sbt的发布包,并解压到指定位置。
wget https://github.com/sbt/sbt/releases/download/v1.8.2/sbt-1.8.2.tgz
sudo tar -zxvf sbt-1.8.2.tgz -C /usr/local/
sudo chmod 777 -R /usr/local/sbt/
//创建可执行文件,并写入内容
sudo gedit sbt
//内容
#!/bin/bash
SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
java $SBT_OPTS -jar /usr/local/sbt/bin/sbt-launch.jar "$@"  # 注意对应路径
//
//修改权限
sudo chmod 777 sbt
//换镜像源
cd ~
mkdir .sbt
cd .sbt
gedit repositories
//写入如下内容
[repositories]
local
huaweicloud-maven: https://repo.huaweicloud.com/repository/maven/
maven-central: https://repo1.maven.org/maven2/
huaweicloud-ivy: https://repo.huaweicloud.com/repository/ivy/, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]
//
//配置环境变量
sudo gedit ~/.bashrc
//最后一行加入以下内容
export PATH=$PATH:/usr/local/sbt

//--------------------------------------------------
//安装Verilator
//--------------------------------------------------
sudo apt-get install git make autoconf g++ flex bison libz-dev
sudo git clone http://git.veripool.org/git/verilator //或使用{git clone https://github.com/verilator/verilator}
sudo chmod 777 -R verilator/
unsetenv VERILATOR_ROOT //命令无效果时可忽略
unset VERILATOR_ROOT
cd verilator
sudo git pull 
sudo git checkout v4.216
autoconf
./configure
make
sudo make install

//--------------------------------------------------
//安装OpenOCD,配置使其支持DapLink.
//--------------------------------------------------
sudo apt install libtool automake pkg-config libusb-1.0-0-dev libz-dev
sudo apt-get install libtool automake libusb-1.0.0-dev texinfo libusb-dev libyaml-dev pkg-config
sudo git clone https://github.com/SpinalHDL/openocd_riscv.git
cd openocd_riscv/
sudo git submodule update --init --recursive
sudo chmod 777 -R ../openocd_riscv
sudo ./bootstrap
sudo apt-get install libhidapi*
./configure --enable-maintainer-mode --enable-usb_blaster_libftdi --enable-ftdi --enable-dummy
make
sudo make install

//--------------------------------------------------
//安装RiscV GCC编译链(方法一可能由于网络原因无法正常下载)
//--------------------------------------------------
//方法一
wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz
cp riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz /opt/
cd /opt/
sudo tar -xvf riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14.tar.gz 
export PATH=$PATH:$PWD/riscv64-unknown-elf-gcc-10.1.0-2020.08.2-x86_64-linux-ubuntu14/bin/
//方法二
从GitHub上下载对应Ubuntu版本的文件 https://github.com/sifive/freedom-tools/releases
//拷贝到/opt/,并解压
sudo cp riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz /opt/
cd /opt
sudo tar -xzvf riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14.tar.gz
//重命名文件夹
sudo mv riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14 Riscv-toolchain
sudo chmod 777 -R Riscv-toolchain/
//添加到环境变量
echo 'export PATH=/opt/Riscv-toolchain/bin:$PATH' >> ~/.bashrc


//--------------------------------------------------
//--------------------------------------------------
//仿真
//--------------------------------------------------
//--------------------------------------------------

git clone https://github.com/SpinalHDL/VexRiscv.git

//--------------------------------------------------
//编译CPU,生成仿真文件和Verilog文件
//--------------------------------------------------
cd VexRiscv/
//三选一(这里先使用GenFull)
sbt "runMain vexriscv.demo.GenFull"
//sbt "runMain vexriscv.demo.GenSmallest"
//sbt "runMain vexriscv.demo.LinuxGen"
//--------------------------------------------------
//可对生成文件进行测试
cd src/test/cpp/regression/
//GenFull:
make clean run
//GenSmallest:
//make clean run IBUS=SIMPLE DBUS=SIMPLE CSR=no MMU=no DEBUG_PLUGIN=no MUL=no DIV=no
//LinuxGen:
//make clean run IBUS=CACHED DBUS=CACHED DEBUG_PLUGIN=STD DHRYSTONE=yes SUPERVISOR=yes MMU=yes CSR=yes DEBUG_PLUGIN=no COMPRESSED=no MUL=yes DIV=yes LRSC=yes AMO=yes REDO=10 TRACE=no COREMARK=yes LINUX_REGRESSION=yes

//--------------------------------------------------
//运行Verilator进行仿真
//--------------------------------------------------
cd src/test/cpp/regression/
make clean run DEBUG_PLUGIN_EXTERNAL=yes
//运行后不需要关闭终端或退出当前进程

//--------------------------------------------------
//运行OpenOCD，并连接到Verilator仿真
//--------------------------------------------------
//另外打开一个终端
src/openocd -c "set VEXRISCV_YAML /home/z/FPGA/VexRiscv/cpu0.yaml" -f /usr/local/openocd_riscv/tcl/target/vexriscv_sim.cfg

//--------------------------------------------------
//运行GDB,并将程序下载到Verilator仿真CPU中
//--------------------------------------------------
//在VexRiscv文件夹中打开终端
/opt/Riscv-toolchain/bin/riscv64-unknown-elf-gdb src/test/resources/elf/uart.elf 
target extended-remote localhost:3333
monitor reset halt
load
continue 
//运行成功后会在Verilator仿真的那个终端看见不断输出字符


//--------------------------------------------------
//--------------------------------------------------
//Briey仿真
//--------------------------------------------------
//--------------------------------------------------

//--------------------------------------------------
//下载软件Demo,并进行编译
//--------------------------------------------------
git clone https://github.com/SpinalHDL/VexRiscvSocSoftware.git
cd VexRiscvSocSoftware/resources
gedit gcc.mk //将其中的 RISCV_PATH ?= /opt/riscv/修改为自己的Riscv工具链路径
cd ../projects/briey/vga
make
cd build //能看见生成的vag.elf
//之后会拿来对Briey进行测试

//--------------------------------------------------
//仿真环境中测试Briey SoC
//--------------------------------------------------
//编译并运行Verilator仿真
sudo apt-get install libsdl2-dev
cd VexRiscv/
sbt "runMain vexriscv.demo.Briey"
sbt "runMain vexriscv.demo.BrieyWithMemoryInit"
cd src/test/cpp/briey/
make clean run
//运行OpenOCD，并连接到Verilator仿真
src/openocd -f tcl/interface/jtag_tcp.cfg -c "set BRIEY_CPU0_YAML /home/z/FPGA/VexRiscv/cpu0.yaml" -f /usr/local/openocd_riscv/tcl/target/briey.cfg
//运行GDB,并将程序下载到Verilator仿真CPU中 
/opt/Riscv-toolchain/bin/riscv64-unknown-elf-gdb VexRiscvSocSoftware/projects/briey/vga/build/vga.elf
target extended-remote localhost:3333
monitor reset halt
load
continue 


//--------------------------------------------------
//--------------------------------------------------
//Eclipse 编译和调试
//--------------------------------------------------
//--------------------------------------------------
https://github.com/eclipse-embed-cdt/org.eclipse.epp.packages/releases

sudo cp eclipse-embedcdt-2020-09-R-linux.gtk.x86_64.tar.gz /usr/local/
cd /usr/local/
sudo tar -xzvf eclipse-embedcdt-2020-09-R-linux.gtk.x86_64.tar.gz
sudo chmod 777 -R eclipse
cd eclipse/
sudo ./eclipse
//Debug配置参考
https://drive.google.com/drive/folders/1c46tyEV0xLwOsk76b0y2qqs8CYy7Zq3f