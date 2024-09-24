
build/simple.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
.global crtStart
.global main
.global irqCallback

crtStart:
  j crtInit
80000000:	0b00006f          	j	800000b0 <crtInit>
  nop
80000004:	00000013          	nop
  nop
80000008:	00000013          	nop
  nop
8000000c:	00000013          	nop
  nop
80000010:	00000013          	nop
  nop
80000014:	00000013          	nop
  nop
80000018:	00000013          	nop
  nop
8000001c:	00000013          	nop

80000020 <trap_entry>:

.global  trap_entry
trap_entry:
  sw x1,  - 1*4(sp)
80000020:	fe112e23          	sw	ra,-4(sp)
  sw x5,  - 2*4(sp)
80000024:	fe512c23          	sw	t0,-8(sp)
  sw x6,  - 3*4(sp)
80000028:	fe612a23          	sw	t1,-12(sp)
  sw x7,  - 4*4(sp)
8000002c:	fe712823          	sw	t2,-16(sp)
  sw x10, - 5*4(sp)
80000030:	fea12623          	sw	a0,-20(sp)
  sw x11, - 6*4(sp)
80000034:	feb12423          	sw	a1,-24(sp)
  sw x12, - 7*4(sp)
80000038:	fec12223          	sw	a2,-28(sp)
  sw x13, - 8*4(sp)
8000003c:	fed12023          	sw	a3,-32(sp)
  sw x14, - 9*4(sp)
80000040:	fce12e23          	sw	a4,-36(sp)
  sw x15, -10*4(sp)
80000044:	fcf12c23          	sw	a5,-40(sp)
  sw x16, -11*4(sp)
80000048:	fd012a23          	sw	a6,-44(sp)
  sw x17, -12*4(sp)
8000004c:	fd112823          	sw	a7,-48(sp)
  sw x28, -13*4(sp)
80000050:	fdc12623          	sw	t3,-52(sp)
  sw x29, -14*4(sp)
80000054:	fdd12423          	sw	t4,-56(sp)
  sw x30, -15*4(sp)
80000058:	fde12223          	sw	t5,-60(sp)
  sw x31, -16*4(sp)
8000005c:	fdf12023          	sw	t6,-64(sp)
  addi sp,sp,-16*4
80000060:	fc010113          	addi	sp,sp,-64
  call irqCallback
80000064:	0c8000ef          	jal	ra,8000012c <irqCallback>
  lw x1 , 15*4(sp)
80000068:	03c12083          	lw	ra,60(sp)
  lw x5,  14*4(sp)
8000006c:	03812283          	lw	t0,56(sp)
  lw x6,  13*4(sp)
80000070:	03412303          	lw	t1,52(sp)
  lw x7,  12*4(sp)
80000074:	03012383          	lw	t2,48(sp)
  lw x10, 11*4(sp)
80000078:	02c12503          	lw	a0,44(sp)
  lw x11, 10*4(sp)
8000007c:	02812583          	lw	a1,40(sp)
  lw x12,  9*4(sp)
80000080:	02412603          	lw	a2,36(sp)
  lw x13,  8*4(sp)
80000084:	02012683          	lw	a3,32(sp)
  lw x14,  7*4(sp)
80000088:	01c12703          	lw	a4,28(sp)
  lw x15,  6*4(sp)
8000008c:	01812783          	lw	a5,24(sp)
  lw x16,  5*4(sp)
80000090:	01412803          	lw	a6,20(sp)
  lw x17,  4*4(sp)
80000094:	01012883          	lw	a7,16(sp)
  lw x28,  3*4(sp)
80000098:	00c12e03          	lw	t3,12(sp)
  lw x29,  2*4(sp)
8000009c:	00812e83          	lw	t4,8(sp)
  lw x30,  1*4(sp)
800000a0:	00412f03          	lw	t5,4(sp)
  lw x31,  0*4(sp)
800000a4:	00012f83          	lw	t6,0(sp)
  addi sp,sp,16*4
800000a8:	04010113          	addi	sp,sp,64
  mret
800000ac:	30200073          	mret

800000b0 <crtInit>:
crtInit:
 /* .option push
  .option norelax
  la gp, __global_pointer$
  .option pop*/
  la sp, _stack_start
800000b0:	00000117          	auipc	sp,0x0
800000b4:	4e010113          	addi	sp,sp,1248 # 80000590 <_stack_start>

800000b8 <bss_init>:

bss_init:
  la a0, _bss_start
800000b8:	00000517          	auipc	a0,0x0
800000bc:	0c850513          	addi	a0,a0,200 # 80000180 <var3>
  la a1, _bss_end
800000c0:	00000597          	auipc	a1,0x0
800000c4:	0c858593          	addi	a1,a1,200 # 80000188 <_bss_end>

800000c8 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000c8:	00b50863          	beq	a0,a1,800000d8 <bss_done>
  sw zero,0(a0)
800000cc:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000d0:	00450513          	addi	a0,a0,4
  j bss_loop
800000d4:	ff5ff06f          	j	800000c8 <bss_loop>

800000d8 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000d8:	00000517          	auipc	a0,0x0
800000dc:	09c50513          	addi	a0,a0,156 # 80000174 <_ctors_end>
  addi sp,sp,-4
800000e0:	ffc10113          	addi	sp,sp,-4

800000e4 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000e4:	00000597          	auipc	a1,0x0
800000e8:	09058593          	addi	a1,a1,144 # 80000174 <_ctors_end>
  beq a0,a1,ctors_done
800000ec:	00b50e63          	beq	a0,a1,80000108 <ctors_done>
  lw a3,0(a0)
800000f0:	00052683          	lw	a3,0(a0)
  add a0,a0,4
800000f4:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
800000f8:	00a12023          	sw	a0,0(sp)
  jalr  a3
800000fc:	000680e7          	jalr	a3
  lw a0,0(sp)
80000100:	00012503          	lw	a0,0(sp)
  j ctors_loop
80000104:	fe1ff06f          	j	800000e4 <ctors_loop>

80000108 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000108:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
8000010c:	00001537          	lui	a0,0x1
80000110:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x480>
  csrw mie,a0
80000114:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
80000118:	00002537          	lui	a0,0x2
8000011c:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1408>
  csrw mstatus,a0
80000120:	30051073          	csrw	mstatus,a0

  call main
80000124:	014000ef          	jal	ra,80000138 <end>

80000128 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000128:	0000006f          	j	80000128 <infinitLoop>

Disassembly of section .memory:

8000012c <irqCallback>:
}


void irqCallback(int irq){

}
8000012c:	00008067          	ret

80000130 <miaou>:

int miaou(){
	return 2;
}
80000130:	00200513          	li	a0,2
80000134:	00008067          	ret

Disassembly of section .text.startup:

80000138 <main>:
	TEST_COM_BASE[0] = var1 + var2 + var3;
80000138:	80000737          	lui	a4,0x80000
8000013c:	800006b7          	lui	a3,0x80000
80000140:	17872783          	lw	a5,376(a4) # 80000178 <_stack_start+0xfffffbe8>
80000144:	1846a603          	lw	a2,388(a3) # 80000184 <_stack_start+0xfffffbf4>
80000148:	800006b7          	lui	a3,0x80000
8000014c:	1806a683          	lw	a3,384(a3) # 80000180 <_stack_start+0xfffffbf0>
80000150:	00c787b3          	add	a5,a5,a2
}
80000154:	00000513          	li	a0,0
	TEST_COM_BASE[0] = var1 + var2 + var3;
80000158:	00d787b3          	add	a5,a5,a3
8000015c:	f01006b7          	lui	a3,0xf0100
80000160:	f0f6a023          	sw	a5,-256(a3) # f00fff00 <_stack_start+0x700ff970>
	var1 += 1;
80000164:	17872783          	lw	a5,376(a4)
80000168:	00178793          	addi	a5,a5,1
8000016c:	16f72c23          	sw	a5,376(a4)
}
80000170:	00008067          	ret
