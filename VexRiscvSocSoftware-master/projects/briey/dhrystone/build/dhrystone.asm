
build/dhrystone.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
.global crtStart
.global main
.global irqCallback

crtStart:
  j crtInit
80000000:	0b40006f          	j	800000b4 <crtInit>
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
80000064:	c0000097          	auipc	ra,0xc0000
80000068:	fd8080e7          	jalr	-40(ra) # 4000003c <irqCallback>
  lw x1 , 15*4(sp)
8000006c:	03c12083          	lw	ra,60(sp)
  lw x5,  14*4(sp)
80000070:	03812283          	lw	t0,56(sp)
  lw x6,  13*4(sp)
80000074:	03412303          	lw	t1,52(sp)
  lw x7,  12*4(sp)
80000078:	03012383          	lw	t2,48(sp)
  lw x10, 11*4(sp)
8000007c:	02c12503          	lw	a0,44(sp)
  lw x11, 10*4(sp)
80000080:	02812583          	lw	a1,40(sp)
  lw x12,  9*4(sp)
80000084:	02412603          	lw	a2,36(sp)
  lw x13,  8*4(sp)
80000088:	02012683          	lw	a3,32(sp)
  lw x14,  7*4(sp)
8000008c:	01c12703          	lw	a4,28(sp)
  lw x15,  6*4(sp)
80000090:	01812783          	lw	a5,24(sp)
  lw x16,  5*4(sp)
80000094:	01412803          	lw	a6,20(sp)
  lw x17,  4*4(sp)
80000098:	01012883          	lw	a7,16(sp)
  lw x28,  3*4(sp)
8000009c:	00c12e03          	lw	t3,12(sp)
  lw x29,  2*4(sp)
800000a0:	00812e83          	lw	t4,8(sp)
  lw x30,  1*4(sp)
800000a4:	00412f03          	lw	t5,4(sp)
  lw x31,  0*4(sp)
800000a8:	00012f83          	lw	t6,0(sp)
  addi sp,sp,16*4
800000ac:	04010113          	addi	sp,sp,64
  mret
800000b0:	30200073          	mret

800000b4 <crtInit>:


crtInit:
  .option push
  .option norelax
  la gp, __global_pointer$
800000b4:	c0004197          	auipc	gp,0xc0004
800000b8:	bac18193          	addi	gp,gp,-1108 # 40003c60 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	88410113          	addi	sp,sp,-1916 # 80000940 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	81c18513          	addi	a0,gp,-2020 # 4000347c <Dhrystones_Per_Second>
  la a1, _bss_end
800000c8:	c0006597          	auipc	a1,0xc0006
800000cc:	fbc58593          	addi	a1,a1,-68 # 40006084 <_bss_end>

800000d0 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000d0:	00b50863          	beq	a0,a1,800000e0 <bss_done>
  sw zero,0(a0)
800000d4:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000d8:	00450513          	addi	a0,a0,4
  j bss_loop
800000dc:	ff5ff06f          	j	800000d0 <bss_loop>

800000e0 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000e0:	c0003517          	auipc	a0,0xc0003
800000e4:	38050513          	addi	a0,a0,896 # 40003460 <_ctors_end>
  addi sp,sp,-4
800000e8:	ffc10113          	addi	sp,sp,-4

800000ec <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000ec:	c0003597          	auipc	a1,0xc0003
800000f0:	37458593          	addi	a1,a1,884 # 40003460 <_ctors_end>
  beq a0,a1,ctors_done
800000f4:	00b50e63          	beq	a0,a1,80000110 <ctors_done>
  lw a3,0(a0)
800000f8:	00052683          	lw	a3,0(a0)
  add a0,a0,4
800000fc:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
80000100:	00a12023          	sw	a0,0(sp)
  jalr  a3
80000104:	000680e7          	jalr	a3
  lw a0,0(sp)
80000108:	00012503          	lw	a0,0(sp)
  j ctors_loop
8000010c:	fe1ff06f          	j	800000ec <ctors_loop>

80000110 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000110:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
80000114:	00001537          	lui	a0,0x1
80000118:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x80>
  csrw mie,a0
8000011c:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
80000120:	00002537          	lui	a0,0x2
80000124:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1008>
  csrw mstatus,a0
80000128:	30051073          	csrw	mstatus,a0

  call main
8000012c:	c0003097          	auipc	ra,0xc0003
80000130:	b20080e7          	jalr	-1248(ra) # 40002c4c <end>

80000134 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000134:	0000006f          	j	80000134 <infinitLoop>

Disassembly of section .memory:

40000000 <uart_applyConfig.constprop.1>:
	while(uart_writeAvailability(reg) == 0);
	reg->DATA = data;
}

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
	reg->CLOCK_DIVIDER = config->clockDivider;
40000000:	f00107b7          	lui	a5,0xf0010
40000004:	03500713          	li	a4,53
40000008:	00e7a423          	sw	a4,8(a5) # f0010008 <_stack_start+0x7000f6c8>
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
4000000c:	00700713          	li	a4,7
40000010:	00e7a623          	sw	a4,12(a5)
}
40000014:	00008067          	ret

40000018 <interruptCtrl_init.constprop.2>:
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} InterruptCtrl_Reg;

static void interruptCtrl_init(InterruptCtrl_Reg* reg){
	reg->MASKS = 0;
40000018:	f00207b7          	lui	a5,0xf0020
4000001c:	0007aa23          	sw	zero,20(a5) # f0020014 <_stack_start+0x7001f6d4>
	reg->PENDINGS = 0xFFFFFFFF;
40000020:	fff00713          	li	a4,-1
40000024:	00e7a823          	sw	a4,16(a5)
}
40000028:	00008067          	ret

4000002c <timer_init.constprop.3>:
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

static void timer_init(Timer_Reg *reg){
	reg->CLEARS_TICKS  = 0;
4000002c:	f00207b7          	lui	a5,0xf0020
40000030:	0407a023          	sw	zero,64(a5) # f0020040 <_stack_start+0x7001f700>
	reg->VALUE = 0;
40000034:	0407a423          	sw	zero,72(a5)
}
40000038:	00008067          	ret

4000003c <irqCallback>:
}


void irqCallback(){

}
4000003c:	00008067          	ret

40000040 <clock>:


#include <time.h>
clock_t	clock(){
	return TIMER_A->VALUE;
40000040:	f00207b7          	lui	a5,0xf0020
40000044:	0487a503          	lw	a0,72(a5) # f0020048 <_stack_start+0x7001f708>
}
40000048:	00008067          	ret

4000004c <Proc_2>:
  One_Fifty  Int_Loc;  
  Enumeration   Enum_Loc;

  Int_Loc = *Int_Par_Ref + 10;
  do /* executed once */
    if (Ch_1_Glob == 'A')
4000004c:	8351c703          	lbu	a4,-1995(gp) # 40003495 <Ch_1_Glob>
40000050:	04100793          	li	a5,65
40000054:	00f70463          	beq	a4,a5,4000005c <Proc_2+0x10>
      Int_Loc -= 1;
      *Int_Par_Ref = Int_Loc - Int_Glob;
      Enum_Loc = Ident_1;
    } /* if */
  while (Enum_Loc != Ident_1); /* true */
} /* Proc_2 */
40000058:	00008067          	ret
      Int_Loc -= 1;
4000005c:	00052783          	lw	a5,0(a0)
      *Int_Par_Ref = Int_Loc - Int_Glob;
40000060:	83c1a703          	lw	a4,-1988(gp) # 4000349c <Int_Glob>
      Int_Loc -= 1;
40000064:	00978793          	addi	a5,a5,9
      *Int_Par_Ref = Int_Loc - Int_Glob;
40000068:	40e787b3          	sub	a5,a5,a4
4000006c:	00f52023          	sw	a5,0(a0)
} /* Proc_2 */
40000070:	00008067          	ret

40000074 <Proc_3>:
    /* Ptr_Ref_Par becomes Ptr_Glob */

Rec_Pointer *Ptr_Ref_Par;

{
  if (Ptr_Glob != Null)
40000074:	8441a603          	lw	a2,-1980(gp) # 400034a4 <Ptr_Glob>
40000078:	00060863          	beqz	a2,40000088 <Proc_3+0x14>
    /* then, executed */
    *Ptr_Ref_Par = Ptr_Glob->Ptr_Comp;
4000007c:	00062703          	lw	a4,0(a2)
40000080:	00e52023          	sw	a4,0(a0)
40000084:	8441a603          	lw	a2,-1980(gp) # 400034a4 <Ptr_Glob>
  Proc_7 (10, Int_Glob, &Ptr_Glob->variant.var_1.Int_Comp);
40000088:	83c1a583          	lw	a1,-1988(gp) # 4000349c <Int_Glob>
4000008c:	00c60613          	addi	a2,a2,12
40000090:	00a00513          	li	a0,10
40000094:	0f10006f          	j	40000984 <Proc_7>

40000098 <Proc_1>:
{
40000098:	ff010113          	addi	sp,sp,-16
4000009c:	01212023          	sw	s2,0(sp)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
400000a0:	8441a783          	lw	a5,-1980(gp) # 400034a4 <Ptr_Glob>
{
400000a4:	00812423          	sw	s0,8(sp)
  REG Rec_Pointer Next_Record = Ptr_Val_Par->Ptr_Comp;  
400000a8:	00052403          	lw	s0,0(a0)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
400000ac:	0007a703          	lw	a4,0(a5)
{
400000b0:	00912223          	sw	s1,4(sp)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
400000b4:	0047ae83          	lw	t4,4(a5)
400000b8:	0087ae03          	lw	t3,8(a5)
400000bc:	0107a303          	lw	t1,16(a5)
400000c0:	0147a883          	lw	a7,20(a5)
400000c4:	0187a803          	lw	a6,24(a5)
400000c8:	0207a583          	lw	a1,32(a5)
400000cc:	0247a603          	lw	a2,36(a5)
400000d0:	0287a683          	lw	a3,40(a5)
{
400000d4:	00112623          	sw	ra,12(sp)
400000d8:	00050493          	mv	s1,a0
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
400000dc:	01c7a503          	lw	a0,28(a5)
400000e0:	02c7a783          	lw	a5,44(a5)
400000e4:	00e42023          	sw	a4,0(s0)
  Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
400000e8:	0004a703          	lw	a4,0(s1)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
400000ec:	00a42e23          	sw	a0,28(s0)
400000f0:	02f42623          	sw	a5,44(s0)
400000f4:	01d42223          	sw	t4,4(s0)
  Ptr_Val_Par->variant.var_1.Int_Comp = 5;
400000f8:	00500793          	li	a5,5
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
400000fc:	01c42423          	sw	t3,8(s0)
40000100:	00642823          	sw	t1,16(s0)
40000104:	01142a23          	sw	a7,20(s0)
40000108:	01042c23          	sw	a6,24(s0)
4000010c:	02b42023          	sw	a1,32(s0)
40000110:	02c42223          	sw	a2,36(s0)
40000114:	02d42423          	sw	a3,40(s0)
  Ptr_Val_Par->variant.var_1.Int_Comp = 5;
40000118:	00f4a623          	sw	a5,12(s1)
        = Ptr_Val_Par->variant.var_1.Int_Comp;
4000011c:	00f42623          	sw	a5,12(s0)
  Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
40000120:	00e42023          	sw	a4,0(s0)
  Proc_3 (&Next_Record->Ptr_Comp);
40000124:	00040513          	mv	a0,s0
40000128:	f4dff0ef          	jal	ra,40000074 <Proc_3>
  if (Next_Record->Discr == Ident_1)
4000012c:	00442783          	lw	a5,4(s0)
40000130:	08078063          	beqz	a5,400001b0 <Proc_1+0x118>
    structassign (*Ptr_Val_Par, *Ptr_Val_Par->Ptr_Comp);
40000134:	0004a783          	lw	a5,0(s1)
} /* Proc_1 */
40000138:	00c12083          	lw	ra,12(sp)
4000013c:	00812403          	lw	s0,8(sp)
    structassign (*Ptr_Val_Par, *Ptr_Val_Par->Ptr_Comp);
40000140:	0007af83          	lw	t6,0(a5)
40000144:	0047af03          	lw	t5,4(a5)
40000148:	0087ae83          	lw	t4,8(a5)
4000014c:	00c7ae03          	lw	t3,12(a5)
40000150:	0107a303          	lw	t1,16(a5)
40000154:	0147a883          	lw	a7,20(a5)
40000158:	0187a803          	lw	a6,24(a5)
4000015c:	01c7a583          	lw	a1,28(a5)
40000160:	0207a603          	lw	a2,32(a5)
40000164:	0247a683          	lw	a3,36(a5)
40000168:	0287a703          	lw	a4,40(a5)
4000016c:	02c7a783          	lw	a5,44(a5)
40000170:	01f4a023          	sw	t6,0(s1)
40000174:	01e4a223          	sw	t5,4(s1)
40000178:	01d4a423          	sw	t4,8(s1)
4000017c:	01c4a623          	sw	t3,12(s1)
40000180:	0064a823          	sw	t1,16(s1)
40000184:	0114aa23          	sw	a7,20(s1)
40000188:	0104ac23          	sw	a6,24(s1)
4000018c:	00b4ae23          	sw	a1,28(s1)
40000190:	02c4a023          	sw	a2,32(s1)
40000194:	02d4a223          	sw	a3,36(s1)
40000198:	02e4a423          	sw	a4,40(s1)
4000019c:	02f4a623          	sw	a5,44(s1)
} /* Proc_1 */
400001a0:	00012903          	lw	s2,0(sp)
400001a4:	00412483          	lw	s1,4(sp)
400001a8:	01010113          	addi	sp,sp,16
400001ac:	00008067          	ret
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp, 
400001b0:	0084a503          	lw	a0,8(s1)
    Next_Record->variant.var_1.Int_Comp = 6;
400001b4:	00600793          	li	a5,6
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp, 
400001b8:	00840593          	addi	a1,s0,8
    Next_Record->variant.var_1.Int_Comp = 6;
400001bc:	00f42623          	sw	a5,12(s0)
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp, 
400001c0:	0c5000ef          	jal	ra,40000a84 <Proc_6>
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
400001c4:	8441a783          	lw	a5,-1980(gp) # 400034a4 <Ptr_Glob>
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10, 
400001c8:	00c42503          	lw	a0,12(s0)
400001cc:	00c40613          	addi	a2,s0,12
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
400001d0:	0007a783          	lw	a5,0(a5)
} /* Proc_1 */
400001d4:	00c12083          	lw	ra,12(sp)
400001d8:	00412483          	lw	s1,4(sp)
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
400001dc:	00f42023          	sw	a5,0(s0)
} /* Proc_1 */
400001e0:	00812403          	lw	s0,8(sp)
400001e4:	00012903          	lw	s2,0(sp)
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10, 
400001e8:	00a00593          	li	a1,10
} /* Proc_1 */
400001ec:	01010113          	addi	sp,sp,16
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10, 
400001f0:	7940006f          	j	40000984 <Proc_7>

400001f4 <Proc_4>:
/*******/
    /* executed once */
{
  Boolean Bool_Loc;

  Bool_Loc = Ch_1_Glob == 'A';
400001f4:	8351c783          	lbu	a5,-1995(gp) # 40003495 <Ch_1_Glob>
  Bool_Glob = Bool_Loc | Bool_Glob;
400001f8:	8381a683          	lw	a3,-1992(gp) # 40003498 <Bool_Glob>
  Bool_Loc = Ch_1_Glob == 'A';
400001fc:	fbf78793          	addi	a5,a5,-65
40000200:	0017b793          	seqz	a5,a5
  Bool_Glob = Bool_Loc | Bool_Glob;
40000204:	00d7e7b3          	or	a5,a5,a3
40000208:	82f1ac23          	sw	a5,-1992(gp) # 40003498 <Bool_Glob>
  Ch_2_Glob = 'B';
4000020c:	04200713          	li	a4,66
40000210:	82e18a23          	sb	a4,-1996(gp) # 40003494 <Ch_2_Glob>
} /* Proc_4 */
40000214:	00008067          	ret

40000218 <Proc_5>:

Proc_5 () /* without parameters */
/*******/
    /* executed once */
{
  Ch_1_Glob = 'A';
40000218:	04100713          	li	a4,65
4000021c:	82e18aa3          	sb	a4,-1995(gp) # 40003495 <Ch_1_Glob>
  Bool_Glob = false;
40000220:	8201ac23          	sw	zero,-1992(gp) # 40003498 <Bool_Glob>
} /* Proc_5 */
40000224:	00008067          	ret

40000228 <main2>:
{
40000228:	f6010113          	addi	sp,sp,-160
  Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
4000022c:	03000513          	li	a0,48
{
40000230:	08112e23          	sw	ra,156(sp)
40000234:	08812c23          	sw	s0,152(sp)
40000238:	07912a23          	sw	s9,116(sp)
4000023c:	07b12623          	sw	s11,108(sp)
40000240:	08912a23          	sw	s1,148(sp)
40000244:	09212823          	sw	s2,144(sp)
40000248:	09312623          	sw	s3,140(sp)
4000024c:	09412423          	sw	s4,136(sp)
40000250:	09512223          	sw	s5,132(sp)
40000254:	09612023          	sw	s6,128(sp)
40000258:	07712e23          	sw	s7,124(sp)
4000025c:	07812c23          	sw	s8,120(sp)
40000260:	07a12823          	sw	s10,112(sp)
  Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
40000264:	1e9000ef          	jal	ra,40000c4c <malloc>
40000268:	84a1a023          	sw	a0,-1984(gp) # 400034a0 <Next_Ptr_Glob>
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
4000026c:	03000513          	li	a0,48
40000270:	1dd000ef          	jal	ra,40000c4c <malloc>
  Ptr_Glob->Ptr_Comp                    = Next_Ptr_Glob;
40000274:	8401a783          	lw	a5,-1984(gp) # 400034a0 <Next_Ptr_Glob>
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
40000278:	84a1a223          	sw	a0,-1980(gp) # 400034a4 <Ptr_Glob>
  Ptr_Glob->Ptr_Comp                    = Next_Ptr_Glob;
4000027c:	00f52023          	sw	a5,0(a0)
  Ptr_Glob->variant.var_1.Enum_Comp     = Ident_3;
40000280:	00200793          	li	a5,2
40000284:	00f52423          	sw	a5,8(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp, 
40000288:	400035b7          	lui	a1,0x40003
  Ptr_Glob->variant.var_1.Int_Comp      = 40;
4000028c:	02800793          	li	a5,40
40000290:	00f52623          	sw	a5,12(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp, 
40000294:	01f00613          	li	a2,31
40000298:	ca858593          	addi	a1,a1,-856 # 40002ca8 <end+0x5c>
  Ptr_Glob->Discr                       = Ident_1;
4000029c:	00052223          	sw	zero,4(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp, 
400002a0:	01050513          	addi	a0,a0,16
400002a4:	329000ef          	jal	ra,40000dcc <memcpy>
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
400002a8:	40003737          	lui	a4,0x40003
400002ac:	21070793          	addi	a5,a4,528 # 40003210 <end+0x5c4>
400002b0:	21072e03          	lw	t3,528(a4)
400002b4:	0047a303          	lw	t1,4(a5)
400002b8:	0087a883          	lw	a7,8(a5)
400002bc:	00c7a803          	lw	a6,12(a5)
400002c0:	0107a583          	lw	a1,16(a5)
400002c4:	0147a603          	lw	a2,20(a5)
400002c8:	0187a683          	lw	a3,24(a5)
400002cc:	01c7d703          	lhu	a4,28(a5)
400002d0:	01e7c783          	lbu	a5,30(a5)
  Arr_2_Glob [8][7] = 10;
400002d4:	40003db7          	lui	s11,0x40003
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
400002d8:	02e11e23          	sh	a4,60(sp)
400002dc:	02f10f23          	sb	a5,62(sp)
  Arr_2_Glob [8][7] = 10;
400002e0:	574d8713          	addi	a4,s11,1396 # 40003574 <Arr_2_Glob>
400002e4:	00a00793          	li	a5,10
  printf ("\n");
400002e8:	00a00513          	li	a0,10
  Arr_2_Glob [8][7] = 10;
400002ec:	64f72e23          	sw	a5,1628(a4)
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
400002f0:	03c12023          	sw	t3,32(sp)
400002f4:	02612223          	sw	t1,36(sp)
400002f8:	03112423          	sw	a7,40(sp)
400002fc:	03012623          	sw	a6,44(sp)
40000300:	02b12823          	sw	a1,48(sp)
40000304:	02c12a23          	sw	a2,52(sp)
40000308:	02d12c23          	sw	a3,56(sp)
  printf ("\n");
4000030c:	07d000ef          	jal	ra,40000b88 <putchar>
  printf ("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
40000310:	40003537          	lui	a0,0x40003
40000314:	cc850513          	addi	a0,a0,-824 # 40002cc8 <end+0x7c>
40000318:	271000ef          	jal	ra,40000d88 <puts>
  printf ("\n");
4000031c:	00a00513          	li	a0,10
40000320:	069000ef          	jal	ra,40000b88 <putchar>
  if (Reg)
40000324:	8301a783          	lw	a5,-2000(gp) # 40003490 <Reg>
40000328:	60078a63          	beqz	a5,4000093c <main2+0x714>
    printf ("Program compiled with 'register' attribute\n");
4000032c:	40003537          	lui	a0,0x40003
40000330:	cf850513          	addi	a0,a0,-776 # 40002cf8 <end+0xac>
40000334:	255000ef          	jal	ra,40000d88 <puts>
    printf ("\n");
40000338:	00a00513          	li	a0,10
4000033c:	04d000ef          	jal	ra,40000b88 <putchar>
  printf ("Please give the number of runs through the benchmark: ");
40000340:	40003537          	lui	a0,0x40003
40000344:	d5450513          	addi	a0,a0,-684 # 40002d54 <end+0x108>
40000348:	12d000ef          	jal	ra,40000c74 <printf>
  printf ("\n");
4000034c:	00a00513          	li	a0,10
40000350:	039000ef          	jal	ra,40000b88 <putchar>
  printf ("Execution starts, %d runs through Dhrystone\n", Number_Of_Runs);
40000354:	40003537          	lui	a0,0x40003
40000358:	0c800593          	li	a1,200
4000035c:	d8c50513          	addi	a0,a0,-628 # 40002d8c <end+0x140>
40000360:	115000ef          	jal	ra,40000c74 <printf>
  Begin_Time = clock();
40000364:	cddff0ef          	jal	ra,40000040 <clock>
40000368:	40003437          	lui	s0,0x40003
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
4000036c:	23042783          	lw	a5,560(s0) # 40003230 <end+0x5e4>
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
40000370:	40003d37          	lui	s10,0x40003
40000374:	250d2c03          	lw	s8,592(s10) # 40003250 <end+0x604>
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
40000378:	00f12623          	sw	a5,12(sp)
  Begin_Time = clock();
4000037c:	82a1a623          	sw	a0,-2004(gp) # 4000348c <Begin_Time>
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
40000380:	00100993          	li	s3,1
40000384:	23040413          	addi	s0,s0,560
    Int_1_Loc = 2;
40000388:	00200493          	li	s1,2
    Proc_5();
4000038c:	e8dff0ef          	jal	ra,40000218 <Proc_5>
    Proc_4();
40000390:	e65ff0ef          	jal	ra,400001f4 <Proc_4>
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
40000394:	01e44783          	lbu	a5,30(s0)
40000398:	01442603          	lw	a2,20(s0)
4000039c:	00442e03          	lw	t3,4(s0)
400003a0:	00842303          	lw	t1,8(s0)
400003a4:	00c42883          	lw	a7,12(s0)
400003a8:	01042803          	lw	a6,16(s0)
400003ac:	01842683          	lw	a3,24(s0)
400003b0:	01c45703          	lhu	a4,28(s0)
400003b4:	00c12e83          	lw	t4,12(sp)
400003b8:	04f10f23          	sb	a5,94(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
400003bc:	04010593          	addi	a1,sp,64
    Enum_Loc = Ident_2;
400003c0:	00100793          	li	a5,1
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
400003c4:	02010513          	addi	a0,sp,32
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
400003c8:	04c12a23          	sw	a2,84(sp)
    Enum_Loc = Ident_2;
400003cc:	00f12e23          	sw	a5,28(sp)
    Int_1_Loc = 2;
400003d0:	00912a23          	sw	s1,20(sp)
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
400003d4:	05d12023          	sw	t4,64(sp)
400003d8:	05c12223          	sw	t3,68(sp)
400003dc:	04612423          	sw	t1,72(sp)
400003e0:	05112623          	sw	a7,76(sp)
400003e4:	05012823          	sw	a6,80(sp)
400003e8:	04d12c23          	sw	a3,88(sp)
400003ec:	04e11e23          	sh	a4,92(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
400003f0:	628000ef          	jal	ra,40000a18 <Func_2>
    while (Int_1_Loc < Int_2_Loc)  /* loop body executed once */
400003f4:	01412603          	lw	a2,20(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
400003f8:	00153513          	seqz	a0,a0
400003fc:	82a1ac23          	sw	a0,-1992(gp) # 40003498 <Bool_Glob>
    while (Int_1_Loc < Int_2_Loc)  /* loop body executed once */
40000400:	02c4ca63          	blt	s1,a2,40000434 <main2+0x20c>
      Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
40000404:	00261793          	slli	a5,a2,0x2
40000408:	00c787b3          	add	a5,a5,a2
4000040c:	ffd78793          	addi	a5,a5,-3
      Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
40000410:	00060513          	mv	a0,a2
40000414:	00300593          	li	a1,3
40000418:	01810613          	addi	a2,sp,24
      Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
4000041c:	00f12c23          	sw	a5,24(sp)
      Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
40000420:	564000ef          	jal	ra,40000984 <Proc_7>
      Int_1_Loc += 1;
40000424:	01412603          	lw	a2,20(sp)
40000428:	00160613          	addi	a2,a2,1
4000042c:	00c12a23          	sw	a2,20(sp)
    while (Int_1_Loc < Int_2_Loc)  /* loop body executed once */
40000430:	fcc4dae3          	ble	a2,s1,40000404 <main2+0x1dc>
    Proc_8 (Arr_1_Glob, Arr_2_Glob, Int_1_Loc, Int_3_Loc);
40000434:	01812683          	lw	a3,24(sp)
40000438:	84c18513          	addi	a0,gp,-1972 # 400034ac <Arr_1_Glob>
4000043c:	574d8593          	addi	a1,s11,1396
40000440:	554000ef          	jal	ra,40000994 <Proc_8>
    Proc_1 (Ptr_Glob);
40000444:	8441a503          	lw	a0,-1980(gp) # 400034a4 <Ptr_Glob>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
40000448:	04100a93          	li	s5,65
    Int_2_Loc = 3;
4000044c:	00300a13          	li	s4,3
    Proc_1 (Ptr_Glob);
40000450:	c49ff0ef          	jal	ra,40000098 <Proc_1>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
40000454:	8341c703          	lbu	a4,-1996(gp) # 40003494 <Ch_2_Glob>
40000458:	04000793          	li	a5,64
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
4000045c:	250d0b13          	addi	s6,s10,592
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
40000460:	02e7f463          	bleu	a4,a5,40000488 <main2+0x260>
      if (Enum_Loc == Func_1 (Ch_Index, 'C'))
40000464:	000a8513          	mv	a0,s5
40000468:	04300593          	li	a1,67
4000046c:	58c000ef          	jal	ra,400009f8 <Func_1>
40000470:	01c12783          	lw	a5,28(sp)
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
40000474:	001a8713          	addi	a4,s5,1
      if (Enum_Loc == Func_1 (Ch_Index, 'C'))
40000478:	44f50c63          	beq	a0,a5,400008d0 <main2+0x6a8>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
4000047c:	8341c783          	lbu	a5,-1996(gp) # 40003494 <Ch_2_Glob>
40000480:	0ff77a93          	andi	s5,a4,255
40000484:	ff57f0e3          	bleu	s5,a5,40000464 <main2+0x23c>
    Int_2_Loc = Int_2_Loc * Int_1_Loc;
40000488:	01412783          	lw	a5,20(sp)
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
4000048c:	01812b03          	lw	s6,24(sp)
    Proc_2 (&Int_1_Loc);
40000490:	01410513          	addi	a0,sp,20
    Int_2_Loc = Int_2_Loc * Int_1_Loc;
40000494:	02fa0a33          	mul	s4,s4,a5
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
40000498:	00198993          	addi	s3,s3,1
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
4000049c:	036a4ab3          	div	s5,s4,s6
400004a0:	01512a23          	sw	s5,20(sp)
    Proc_2 (&Int_1_Loc);
400004a4:	ba9ff0ef          	jal	ra,4000004c <Proc_2>
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
400004a8:	0c900793          	li	a5,201
400004ac:	eef990e3          	bne	s3,a5,4000038c <main2+0x164>
  End_Time = clock();
400004b0:	b91ff0ef          	jal	ra,40000040 <clock>
400004b4:	82a1a423          	sw	a0,-2008(gp) # 40003488 <End_Time>
  printf ("Execution ends\n");
400004b8:	40003537          	lui	a0,0x40003
400004bc:	dbc50513          	addi	a0,a0,-580 # 40002dbc <end+0x170>
400004c0:	0c9000ef          	jal	ra,40000d88 <puts>
  printf ("\n");
400004c4:	00a00513          	li	a0,10
400004c8:	6c0000ef          	jal	ra,40000b88 <putchar>
  printf ("Final values of the variables used in the benchmark:\n");
400004cc:	40003537          	lui	a0,0x40003
400004d0:	dcc50513          	addi	a0,a0,-564 # 40002dcc <end+0x180>
400004d4:	0b5000ef          	jal	ra,40000d88 <puts>
  printf ("\n");
400004d8:	00a00513          	li	a0,10
400004dc:	6ac000ef          	jal	ra,40000b88 <putchar>
  printf ("Int_Glob:            %d\n", Int_Glob);
400004e0:	83c1a583          	lw	a1,-1988(gp) # 4000349c <Int_Glob>
400004e4:	40003537          	lui	a0,0x40003
400004e8:	e0450513          	addi	a0,a0,-508 # 40002e04 <end+0x1b8>
  printf ("        should be:   %d\n", 5);
400004ec:	40003437          	lui	s0,0x40003
  printf ("Int_Glob:            %d\n", Int_Glob);
400004f0:	784000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 5);
400004f4:	00500593          	li	a1,5
400004f8:	e2040513          	addi	a0,s0,-480 # 40002e20 <end+0x1d4>
400004fc:	778000ef          	jal	ra,40000c74 <printf>
  printf ("Bool_Glob:           %d\n", Bool_Glob);
40000500:	8381a583          	lw	a1,-1992(gp) # 40003498 <Bool_Glob>
40000504:	40003537          	lui	a0,0x40003
40000508:	e3c50513          	addi	a0,a0,-452 # 40002e3c <end+0x1f0>
4000050c:	768000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 1);
40000510:	00100593          	li	a1,1
40000514:	e2040513          	addi	a0,s0,-480
40000518:	75c000ef          	jal	ra,40000c74 <printf>
  printf ("Ch_1_Glob:           %c\n", Ch_1_Glob);
4000051c:	8351c583          	lbu	a1,-1995(gp) # 40003495 <Ch_1_Glob>
40000520:	40003537          	lui	a0,0x40003
40000524:	e5850513          	addi	a0,a0,-424 # 40002e58 <end+0x20c>
40000528:	74c000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %c\n", 'A');
4000052c:	400034b7          	lui	s1,0x40003
40000530:	04100593          	li	a1,65
40000534:	e7448513          	addi	a0,s1,-396 # 40002e74 <end+0x228>
40000538:	73c000ef          	jal	ra,40000c74 <printf>
  printf ("Ch_2_Glob:           %c\n", Ch_2_Glob);
4000053c:	8341c583          	lbu	a1,-1996(gp) # 40003494 <Ch_2_Glob>
40000540:	40003537          	lui	a0,0x40003
40000544:	e9050513          	addi	a0,a0,-368 # 40002e90 <end+0x244>
40000548:	72c000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %c\n", 'B');
4000054c:	04200593          	li	a1,66
40000550:	e7448513          	addi	a0,s1,-396
40000554:	720000ef          	jal	ra,40000c74 <printf>
  printf ("Arr_1_Glob[8]:       %d\n", Arr_1_Glob[8]);
40000558:	84c18793          	addi	a5,gp,-1972 # 400034ac <Arr_1_Glob>
4000055c:	0207a583          	lw	a1,32(a5)
40000560:	40003537          	lui	a0,0x40003
40000564:	eac50513          	addi	a0,a0,-340 # 40002eac <end+0x260>
40000568:	70c000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 7);
4000056c:	00700593          	li	a1,7
40000570:	e2040513          	addi	a0,s0,-480
40000574:	700000ef          	jal	ra,40000c74 <printf>
  printf ("Arr_2_Glob[8][7]:    %d\n", Arr_2_Glob[8][7]);
40000578:	400037b7          	lui	a5,0x40003
4000057c:	57478793          	addi	a5,a5,1396 # 40003574 <Arr_2_Glob>
40000580:	65c7a583          	lw	a1,1628(a5)
40000584:	40003537          	lui	a0,0x40003
40000588:	ec850513          	addi	a0,a0,-312 # 40002ec8 <end+0x27c>
4000058c:	6e8000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   Number_Of_Runs + 10\n");
40000590:	40003537          	lui	a0,0x40003
40000594:	ee450513          	addi	a0,a0,-284 # 40002ee4 <end+0x298>
40000598:	7f0000ef          	jal	ra,40000d88 <puts>
  printf ("Ptr_Glob->\n");
4000059c:	40003537          	lui	a0,0x40003
400005a0:	f1050513          	addi	a0,a0,-240 # 40002f10 <end+0x2c4>
400005a4:	7e4000ef          	jal	ra,40000d88 <puts>
  printf ("  Ptr_Comp:          %d\n", (int) Ptr_Glob->Ptr_Comp);
400005a8:	8441a703          	lw	a4,-1980(gp) # 400034a4 <Ptr_Glob>
400005ac:	400037b7          	lui	a5,0x40003
400005b0:	f1c78513          	addi	a0,a5,-228 # 40002f1c <end+0x2d0>
400005b4:	00072583          	lw	a1,0(a4)
400005b8:	00f12623          	sw	a5,12(sp)
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
400005bc:	40003d37          	lui	s10,0x40003
  printf ("  Ptr_Comp:          %d\n", (int) Ptr_Glob->Ptr_Comp);
400005c0:	6b4000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   (implementation-dependent)\n");
400005c4:	40003537          	lui	a0,0x40003
400005c8:	f3850513          	addi	a0,a0,-200 # 40002f38 <end+0x2ec>
400005cc:	7bc000ef          	jal	ra,40000d88 <puts>
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
400005d0:	8441a703          	lw	a4,-1980(gp) # 400034a4 <Ptr_Glob>
400005d4:	f68d0513          	addi	a0,s10,-152 # 40002f68 <end+0x31c>
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
400005d8:	40003c37          	lui	s8,0x40003
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
400005dc:	00472583          	lw	a1,4(a4)
  printf ("  Int_Comp:          %d\n", Ptr_Glob->variant.var_1.Int_Comp);
400005e0:	40003bb7          	lui	s7,0x40003
  printf ("  Str_Comp:          %s\n", Ptr_Glob->variant.var_1.Str_Comp);
400005e4:	400039b7          	lui	s3,0x40003
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
400005e8:	68c000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 0);
400005ec:	00000593          	li	a1,0
400005f0:	e2040513          	addi	a0,s0,-480
400005f4:	680000ef          	jal	ra,40000c74 <printf>
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
400005f8:	8441a703          	lw	a4,-1980(gp) # 400034a4 <Ptr_Glob>
400005fc:	f84c0513          	addi	a0,s8,-124 # 40002f84 <end+0x338>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
40000600:	40003937          	lui	s2,0x40003
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
40000604:	00872583          	lw	a1,8(a4)
    Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
40000608:	416a0a33          	sub	s4,s4,s6
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
4000060c:	668000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 2);
40000610:	00200593          	li	a1,2
40000614:	e2040513          	addi	a0,s0,-480
40000618:	65c000ef          	jal	ra,40000c74 <printf>
  printf ("  Int_Comp:          %d\n", Ptr_Glob->variant.var_1.Int_Comp);
4000061c:	8441a703          	lw	a4,-1980(gp) # 400034a4 <Ptr_Glob>
40000620:	fa0b8513          	addi	a0,s7,-96 # 40002fa0 <end+0x354>
40000624:	00c72583          	lw	a1,12(a4)
40000628:	64c000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 17);
4000062c:	01100593          	li	a1,17
40000630:	e2040513          	addi	a0,s0,-480
40000634:	640000ef          	jal	ra,40000c74 <printf>
  printf ("  Str_Comp:          %s\n", Ptr_Glob->variant.var_1.Str_Comp);
40000638:	8441a583          	lw	a1,-1980(gp) # 400034a4 <Ptr_Glob>
4000063c:	fbc98513          	addi	a0,s3,-68 # 40002fbc <end+0x370>
40000640:	01058593          	addi	a1,a1,16
40000644:	630000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
40000648:	fd890513          	addi	a0,s2,-40 # 40002fd8 <end+0x38c>
4000064c:	73c000ef          	jal	ra,40000d88 <puts>
  printf ("Next_Ptr_Glob->\n");
40000650:	40003537          	lui	a0,0x40003
40000654:	00c50513          	addi	a0,a0,12 # 4000300c <end+0x3c0>
40000658:	730000ef          	jal	ra,40000d88 <puts>
  printf ("  Ptr_Comp:          %d\n", (int) Next_Ptr_Glob->Ptr_Comp);
4000065c:	8401a703          	lw	a4,-1984(gp) # 400034a0 <Next_Ptr_Glob>
40000660:	00c12783          	lw	a5,12(sp)
40000664:	00072583          	lw	a1,0(a4)
40000668:	f1c78513          	addi	a0,a5,-228
4000066c:	608000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   (implementation-dependent), same as above\n");
40000670:	40003537          	lui	a0,0x40003
40000674:	01c50513          	addi	a0,a0,28 # 4000301c <end+0x3d0>
40000678:	710000ef          	jal	ra,40000d88 <puts>
  printf ("  Discr:             %d\n", Next_Ptr_Glob->Discr);
4000067c:	8401a783          	lw	a5,-1984(gp) # 400034a0 <Next_Ptr_Glob>
40000680:	f68d0513          	addi	a0,s10,-152
40000684:	0047a583          	lw	a1,4(a5)
40000688:	5ec000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 0);
4000068c:	00000593          	li	a1,0
40000690:	e2040513          	addi	a0,s0,-480
40000694:	5e0000ef          	jal	ra,40000c74 <printf>
  printf ("  Enum_Comp:         %d\n", Next_Ptr_Glob->variant.var_1.Enum_Comp);
40000698:	8401a783          	lw	a5,-1984(gp) # 400034a0 <Next_Ptr_Glob>
4000069c:	f84c0513          	addi	a0,s8,-124
400006a0:	0087a583          	lw	a1,8(a5)
400006a4:	5d0000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 1);
400006a8:	00100593          	li	a1,1
400006ac:	e2040513          	addi	a0,s0,-480
400006b0:	5c4000ef          	jal	ra,40000c74 <printf>
  printf ("  Int_Comp:          %d\n", Next_Ptr_Glob->variant.var_1.Int_Comp);
400006b4:	8401a783          	lw	a5,-1984(gp) # 400034a0 <Next_Ptr_Glob>
400006b8:	fa0b8513          	addi	a0,s7,-96
400006bc:	00c7a583          	lw	a1,12(a5)
400006c0:	5b4000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 18);
400006c4:	01200593          	li	a1,18
400006c8:	e2040513          	addi	a0,s0,-480
400006cc:	5a8000ef          	jal	ra,40000c74 <printf>
  printf ("  Str_Comp:          %s\n",
400006d0:	8401a583          	lw	a1,-1984(gp) # 400034a0 <Next_Ptr_Glob>
400006d4:	fbc98513          	addi	a0,s3,-68
400006d8:	01058593          	addi	a1,a1,16
400006dc:	598000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
400006e0:	fd890513          	addi	a0,s2,-40
400006e4:	6a4000ef          	jal	ra,40000d88 <puts>
  printf ("Int_1_Loc:           %d\n", Int_1_Loc);
400006e8:	01412583          	lw	a1,20(sp)
400006ec:	40003537          	lui	a0,0x40003
400006f0:	05c50513          	addi	a0,a0,92 # 4000305c <end+0x410>
400006f4:	580000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 5);
400006f8:	00500593          	li	a1,5
400006fc:	e2040513          	addi	a0,s0,-480
40000700:	574000ef          	jal	ra,40000c74 <printf>
    Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
40000704:	003a1793          	slli	a5,s4,0x3
40000708:	41478a33          	sub	s4,a5,s4
  printf ("Int_2_Loc:           %d\n", Int_2_Loc);
4000070c:	40003537          	lui	a0,0x40003
40000710:	415a05b3          	sub	a1,s4,s5
40000714:	07850513          	addi	a0,a0,120 # 40003078 <end+0x42c>
40000718:	55c000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 13);
4000071c:	00d00593          	li	a1,13
40000720:	e2040513          	addi	a0,s0,-480
40000724:	550000ef          	jal	ra,40000c74 <printf>
  printf ("Int_3_Loc:           %d\n", Int_3_Loc);
40000728:	01812583          	lw	a1,24(sp)
4000072c:	40003537          	lui	a0,0x40003
40000730:	09450513          	addi	a0,a0,148 # 40003094 <end+0x448>
40000734:	540000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 7);
40000738:	00700593          	li	a1,7
4000073c:	e2040513          	addi	a0,s0,-480
40000740:	534000ef          	jal	ra,40000c74 <printf>
  printf ("Enum_Loc:            %d\n", Enum_Loc);
40000744:	01c12583          	lw	a1,28(sp)
40000748:	40003537          	lui	a0,0x40003
4000074c:	0b050513          	addi	a0,a0,176 # 400030b0 <end+0x464>
40000750:	524000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   %d\n", 1);
40000754:	00100593          	li	a1,1
40000758:	e2040513          	addi	a0,s0,-480
4000075c:	518000ef          	jal	ra,40000c74 <printf>
  printf ("Str_1_Loc:           %s\n", Str_1_Loc);
40000760:	40003537          	lui	a0,0x40003
40000764:	02010593          	addi	a1,sp,32
40000768:	0cc50513          	addi	a0,a0,204 # 400030cc <end+0x480>
4000076c:	508000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, 1'ST STRING\n");
40000770:	40003537          	lui	a0,0x40003
40000774:	0e850513          	addi	a0,a0,232 # 400030e8 <end+0x49c>
40000778:	610000ef          	jal	ra,40000d88 <puts>
  printf ("Str_2_Loc:           %s\n", Str_2_Loc);
4000077c:	40003537          	lui	a0,0x40003
40000780:	04010593          	addi	a1,sp,64
40000784:	11c50513          	addi	a0,a0,284 # 4000311c <end+0x4d0>
40000788:	4ec000ef          	jal	ra,40000c74 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, 2'ND STRING\n");
4000078c:	40003537          	lui	a0,0x40003
40000790:	13850513          	addi	a0,a0,312 # 40003138 <end+0x4ec>
40000794:	5f4000ef          	jal	ra,40000d88 <puts>
  printf ("\n");
40000798:	00a00513          	li	a0,10
4000079c:	3ec000ef          	jal	ra,40000b88 <putchar>
  User_Time = End_Time - Begin_Time;
400007a0:	82c1a703          	lw	a4,-2004(gp) # 4000348c <Begin_Time>
400007a4:	8281a583          	lw	a1,-2008(gp) # 40003488 <End_Time>
  if (User_Time < Too_Small_Time)
400007a8:	1f300793          	li	a5,499
  User_Time = End_Time - Begin_Time;
400007ac:	40e585b3          	sub	a1,a1,a4
400007b0:	82b1a223          	sw	a1,-2012(gp) # 40003484 <User_Time>
  if (User_Time < Too_Small_Time)
400007b4:	1ab7d063          	ble	a1,a5,40000954 <main2+0x72c>
	printf ("Clock cycles=%d \n", User_Time);
400007b8:	40003537          	lui	a0,0x40003
400007bc:	1c450513          	addi	a0,a0,452 # 400031c4 <end+0x578>
400007c0:	4b4000ef          	jal	ra,40000c74 <printf>
    Microseconds = (float) User_Time * Mic_secs_Per_Second 
400007c4:	8241a503          	lw	a0,-2012(gp) # 40003484 <User_Time>
400007c8:	070020ef          	jal	ra,40002838 <__floatsisf>
400007cc:	00050413          	mv	s0,a0
400007d0:	18c020ef          	jal	ra,4000295c <__extendsfdf2>
400007d4:	400037b7          	lui	a5,0x40003
400007d8:	4607a603          	lw	a2,1120(a5) # 40003460 <_ctors_end>
400007dc:	4647a683          	lw	a3,1124(a5)
400007e0:	731000ef          	jal	ra,40001710 <__muldf3>
                        / ((float) CORE_HZ * ((float) Number_Of_Runs));
400007e4:	400037b7          	lui	a5,0x40003
400007e8:	4687a603          	lw	a2,1128(a5) # 40003468 <_ctors_end+0x8>
400007ec:	46c7a683          	lw	a3,1132(a5)
400007f0:	041000ef          	jal	ra,40001030 <__divdf3>
400007f4:	274020ef          	jal	ra,40002a68 <__truncdfsf2>
400007f8:	82a1a023          	sw	a0,-2016(gp) # 40003480 <Microseconds>
                        / (float) User_Time;
400007fc:	400037b7          	lui	a5,0x40003
40000800:	4707a503          	lw	a0,1136(a5) # 40003470 <_ctors_end+0x10>
40000804:	00040593          	mv	a1,s0
40000808:	4e4010ef          	jal	ra,40001cec <__divsf3>
    Dhrystones_Per_Second = ((float) CORE_HZ * (float) Number_Of_Runs)
4000080c:	80a1ae23          	sw	a0,-2020(gp) # 4000347c <Dhrystones_Per_Second>
    printf ("DMIPS per Mhz:                              ");
40000810:	40003537          	lui	a0,0x40003
40000814:	1d850513          	addi	a0,a0,472 # 400031d8 <end+0x58c>
40000818:	45c000ef          	jal	ra,40000c74 <printf>
    float dmips = (1e6f/1757.0f) * Number_Of_Runs / User_Time;
4000081c:	8241a503          	lw	a0,-2012(gp) # 40003484 <User_Time>
40000820:	018020ef          	jal	ra,40002838 <__floatsisf>
40000824:	400037b7          	lui	a5,0x40003
40000828:	00050593          	mv	a1,a0
4000082c:	4747a503          	lw	a0,1140(a5) # 40003474 <_ctors_end+0x14>
40000830:	4bc010ef          	jal	ra,40001cec <__divsf3>
40000834:	00050413          	mv	s0,a0
    int dmipsNatural = dmips;
40000838:	791010ef          	jal	ra,400027c8 <__fixsfsi>
4000083c:	00050493          	mv	s1,a0
    int dmipsReal = (dmips - dmipsNatural)*100.0f;
40000840:	7f9010ef          	jal	ra,40002838 <__floatsisf>
40000844:	00050593          	mv	a1,a0
40000848:	00040513          	mv	a0,s0
4000084c:	305010ef          	jal	ra,40002350 <__subsf3>
40000850:	400037b7          	lui	a5,0x40003
40000854:	4787a583          	lw	a1,1144(a5) # 40003478 <_ctors_end+0x18>
40000858:	7d4010ef          	jal	ra,4000202c <__mulsf3>
4000085c:	76d010ef          	jal	ra,400027c8 <__fixsfsi>
40000860:	00050413          	mv	s0,a0
    printf ("%d.", dmipsNatural);
40000864:	40003537          	lui	a0,0x40003
40000868:	00048593          	mv	a1,s1
4000086c:	20850513          	addi	a0,a0,520 # 40003208 <end+0x5bc>
40000870:	404000ef          	jal	ra,40000c74 <printf>
    if(dmipsReal < 10) printf("0");
40000874:	00900793          	li	a5,9
40000878:	1087d063          	ble	s0,a5,40000978 <main2+0x750>
    printf ("%d", dmipsReal);
4000087c:	40003537          	lui	a0,0x40003
40000880:	00040593          	mv	a1,s0
40000884:	20c50513          	addi	a0,a0,524 # 4000320c <end+0x5c0>
40000888:	3ec000ef          	jal	ra,40000c74 <printf>
    printf ("\n");
4000088c:	00a00513          	li	a0,10
40000890:	2f8000ef          	jal	ra,40000b88 <putchar>
}
40000894:	09c12083          	lw	ra,156(sp)
40000898:	09812403          	lw	s0,152(sp)
4000089c:	09412483          	lw	s1,148(sp)
400008a0:	09012903          	lw	s2,144(sp)
400008a4:	08c12983          	lw	s3,140(sp)
400008a8:	08812a03          	lw	s4,136(sp)
400008ac:	08412a83          	lw	s5,132(sp)
400008b0:	08012b03          	lw	s6,128(sp)
400008b4:	07c12b83          	lw	s7,124(sp)
400008b8:	07812c03          	lw	s8,120(sp)
400008bc:	07412c83          	lw	s9,116(sp)
400008c0:	07012d03          	lw	s10,112(sp)
400008c4:	06c12d83          	lw	s11,108(sp)
400008c8:	0a010113          	addi	sp,sp,160
400008cc:	00008067          	ret
        Proc_6 (Ident_1, &Enum_Loc);
400008d0:	01c10593          	addi	a1,sp,28
400008d4:	00000513          	li	a0,0
400008d8:	1ac000ef          	jal	ra,40000a84 <Proc_6>
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
400008dc:	004b2303          	lw	t1,4(s6)
400008e0:	008b2883          	lw	a7,8(s6)
400008e4:	00cb2803          	lw	a6,12(s6)
400008e8:	010b2503          	lw	a0,16(s6)
400008ec:	014b2583          	lw	a1,20(s6)
400008f0:	018b2603          	lw	a2,24(s6)
400008f4:	01cb5683          	lhu	a3,28(s6)
400008f8:	01eb4703          	lbu	a4,30(s6)
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
400008fc:	8341c783          	lbu	a5,-1996(gp) # 40003494 <Ch_2_Glob>
40000900:	001a8a93          	addi	s5,s5,1
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
40000904:	05812023          	sw	s8,64(sp)
40000908:	04612223          	sw	t1,68(sp)
4000090c:	05112423          	sw	a7,72(sp)
40000910:	05012623          	sw	a6,76(sp)
40000914:	04a12823          	sw	a0,80(sp)
40000918:	04b12a23          	sw	a1,84(sp)
4000091c:	04c12c23          	sw	a2,88(sp)
40000920:	04d11e23          	sh	a3,92(sp)
40000924:	04e10f23          	sb	a4,94(sp)
        Int_Glob = Run_Index;
40000928:	8331ae23          	sw	s3,-1988(gp) # 4000349c <Int_Glob>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
4000092c:	0ffafa93          	andi	s5,s5,255
40000930:	00098a13          	mv	s4,s3
40000934:	b357f8e3          	bleu	s5,a5,40000464 <main2+0x23c>
40000938:	b51ff06f          	j	40000488 <main2+0x260>
    printf ("Program compiled without 'register' attribute\n");
4000093c:	40003537          	lui	a0,0x40003
40000940:	d2450513          	addi	a0,a0,-732 # 40002d24 <end+0xd8>
40000944:	444000ef          	jal	ra,40000d88 <puts>
    printf ("\n");
40000948:	00a00513          	li	a0,10
4000094c:	23c000ef          	jal	ra,40000b88 <putchar>
40000950:	9f1ff06f          	j	40000340 <main2+0x118>
    printf ("Measured time too small to obtain meaningful results\n");
40000954:	40003537          	lui	a0,0x40003
40000958:	16c50513          	addi	a0,a0,364 # 4000316c <end+0x520>
4000095c:	42c000ef          	jal	ra,40000d88 <puts>
    printf ("Please increase number of runs\n");
40000960:	40003537          	lui	a0,0x40003
40000964:	1a450513          	addi	a0,a0,420 # 400031a4 <end+0x558>
40000968:	420000ef          	jal	ra,40000d88 <puts>
    printf ("\n");
4000096c:	00a00513          	li	a0,10
40000970:	218000ef          	jal	ra,40000b88 <putchar>
40000974:	f21ff06f          	j	40000894 <main2+0x66c>
    if(dmipsReal < 10) printf("0");
40000978:	03000513          	li	a0,48
4000097c:	20c000ef          	jal	ra,40000b88 <putchar>
40000980:	efdff06f          	j	4000087c <main2+0x654>

40000984 <Proc_7>:
One_Fifty       Int_2_Par_Val;
One_Fifty      *Int_Par_Ref;
{
  One_Fifty Int_Loc;

  Int_Loc = Int_1_Par_Val + 2;
40000984:	00250513          	addi	a0,a0,2
  *Int_Par_Ref = Int_2_Par_Val + Int_Loc;
40000988:	00b505b3          	add	a1,a0,a1
4000098c:	00b62023          	sw	a1,0(a2)
} /* Proc_7 */
40000990:	00008067          	ret

40000994 <Proc_8>:
int             Int_2_Par_Val;
{
  REG One_Fifty Int_Index;
  REG One_Fifty Int_Loc;

  Int_Loc = Int_1_Par_Val + 5;
40000994:	00560713          	addi	a4,a2,5
  Arr_1_Par_Ref [Int_Loc] = Int_2_Par_Val;
  Arr_1_Par_Ref [Int_Loc+1] = Arr_1_Par_Ref [Int_Loc];
  Arr_1_Par_Ref [Int_Loc+30] = Int_Loc;
  for (Int_Index = Int_Loc; Int_Index <= Int_Loc+1; ++Int_Index)
    Arr_2_Par_Ref [Int_Loc] [Int_Index] = Int_Loc;
40000998:	0c800813          	li	a6,200
4000099c:	03070833          	mul	a6,a4,a6
400009a0:	00261613          	slli	a2,a2,0x2
  Arr_1_Par_Ref [Int_Loc] = Int_2_Par_Val;
400009a4:	00271793          	slli	a5,a4,0x2
400009a8:	00f50533          	add	a0,a0,a5
400009ac:	00d52023          	sw	a3,0(a0)
  Arr_1_Par_Ref [Int_Loc+30] = Int_Loc;
400009b0:	06e52c23          	sw	a4,120(a0)
  Arr_1_Par_Ref [Int_Loc+1] = Arr_1_Par_Ref [Int_Loc];
400009b4:	00d52223          	sw	a3,4(a0)
400009b8:	00c807b3          	add	a5,a6,a2
400009bc:	00f587b3          	add	a5,a1,a5
  Arr_2_Par_Ref [Int_Loc] [Int_Loc-1] += 1;
400009c0:	0107a683          	lw	a3,16(a5)
    Arr_2_Par_Ref [Int_Loc] [Int_Index] = Int_Loc;
400009c4:	00e7aa23          	sw	a4,20(a5)
400009c8:	00e7ac23          	sw	a4,24(a5)
  Arr_2_Par_Ref [Int_Loc] [Int_Loc-1] += 1;
400009cc:	00168713          	addi	a4,a3,1
400009d0:	00e7a823          	sw	a4,16(a5)
  Arr_2_Par_Ref [Int_Loc+20] [Int_Loc] = Arr_1_Par_Ref [Int_Loc];
400009d4:	00052783          	lw	a5,0(a0)
400009d8:	010585b3          	add	a1,a1,a6
400009dc:	00c585b3          	add	a1,a1,a2
400009e0:	00001637          	lui	a2,0x1
400009e4:	00b605b3          	add	a1,a2,a1
400009e8:	faf5aa23          	sw	a5,-76(a1)
  Int_Glob = 5;
400009ec:	00500713          	li	a4,5
400009f0:	82e1ae23          	sw	a4,-1988(gp) # 4000349c <Int_Glob>
} /* Proc_8 */
400009f4:	00008067          	ret

400009f8 <Func_1>:
    /* second call:     Ch_1_Par_Val == 'A', Ch_2_Par_Val == 'C'    */
    /* third call:      Ch_1_Par_Val == 'B', Ch_2_Par_Val == 'C'    */

Capital_Letter   Ch_1_Par_Val;
Capital_Letter   Ch_2_Par_Val;
{
400009f8:	0ff57513          	andi	a0,a0,255
400009fc:	0ff5f593          	andi	a1,a1,255
  Capital_Letter        Ch_1_Loc;
  Capital_Letter        Ch_2_Loc;

  Ch_1_Loc = Ch_1_Par_Val;
  Ch_2_Loc = Ch_1_Loc;
  if (Ch_2_Loc != Ch_2_Par_Val)
40000a00:	00b50663          	beq	a0,a1,40000a0c <Func_1+0x14>
    /* then, executed */
    return (Ident_1);
40000a04:	00000513          	li	a0,0
  else  /* not executed */
  {
    Ch_1_Glob = Ch_1_Loc;
    return (Ident_2);
   }
} /* Func_1 */
40000a08:	00008067          	ret
    Ch_1_Glob = Ch_1_Loc;
40000a0c:	82a18aa3          	sb	a0,-1995(gp) # 40003495 <Ch_1_Glob>
    return (Ident_2);
40000a10:	00100513          	li	a0,1
40000a14:	00008067          	ret

40000a18 <Func_2>:
    /* Str_1_Par_Ref == "DHRYSTONE PROGRAM, 1'ST STRING" */
    /* Str_2_Par_Ref == "DHRYSTONE PROGRAM, 2'ND STRING" */

Str_30  Str_1_Par_Ref;
Str_30  Str_2_Par_Ref;
{
40000a18:	ff010113          	addi	sp,sp,-16
40000a1c:	00812423          	sw	s0,8(sp)
40000a20:	00912223          	sw	s1,4(sp)
40000a24:	00112623          	sw	ra,12(sp)
40000a28:	00050413          	mv	s0,a0
40000a2c:	00058493          	mv	s1,a1
  REG One_Thirty        Int_Loc;
      Capital_Letter    Ch_Loc;

  Int_Loc = 2;
  while (Int_Loc <= 2) /* loop body executed once */
    if (Func_1 (Str_1_Par_Ref[Int_Loc],
40000a30:	0034c583          	lbu	a1,3(s1)
40000a34:	00244503          	lbu	a0,2(s0)
40000a38:	fc1ff0ef          	jal	ra,400009f8 <Func_1>
40000a3c:	fe051ae3          	bnez	a0,40000a30 <Func_2+0x18>
  if (Ch_Loc == 'R')
    /* then, not executed */
    return (true);
  else /* executed */
  {
    if (strcmp (Str_1_Par_Ref, Str_2_Par_Ref) > 0)
40000a40:	00048593          	mv	a1,s1
40000a44:	00040513          	mv	a0,s0
40000a48:	46c000ef          	jal	ra,40000eb4 <strcmp>
      Int_Loc += 7;
      Int_Glob = Int_Loc;
      return (true);
    }
    else /* executed */
      return (false);
40000a4c:	00000793          	li	a5,0
    if (strcmp (Str_1_Par_Ref, Str_2_Par_Ref) > 0)
40000a50:	00a05863          	blez	a0,40000a60 <Func_2+0x48>
      Int_Glob = Int_Loc;
40000a54:	00a00713          	li	a4,10
40000a58:	82e1ae23          	sw	a4,-1988(gp) # 4000349c <Int_Glob>
      return (true);
40000a5c:	00100793          	li	a5,1
  } /* if Ch_Loc */
} /* Func_2 */
40000a60:	00c12083          	lw	ra,12(sp)
40000a64:	00812403          	lw	s0,8(sp)
40000a68:	00412483          	lw	s1,4(sp)
40000a6c:	00078513          	mv	a0,a5
40000a70:	01010113          	addi	sp,sp,16
40000a74:	00008067          	ret

40000a78 <Func_3>:
Enumeration Enum_Par_Val;
{
  Enumeration Enum_Loc;

  Enum_Loc = Enum_Par_Val;
  if (Enum_Loc == Ident_3)
40000a78:	ffe50513          	addi	a0,a0,-2
    /* then, executed */
    return (true);
  else /* not executed */
    return (false);
} /* Func_3 */
40000a7c:	00153513          	seqz	a0,a0
40000a80:	00008067          	ret

40000a84 <Proc_6>:
{
40000a84:	ff010113          	addi	sp,sp,-16
40000a88:	00812423          	sw	s0,8(sp)
40000a8c:	00912223          	sw	s1,4(sp)
40000a90:	00112623          	sw	ra,12(sp)
40000a94:	00050413          	mv	s0,a0
40000a98:	00058493          	mv	s1,a1
  if (! Func_3 (Enum_Val_Par))
40000a9c:	fddff0ef          	jal	ra,40000a78 <Func_3>
40000aa0:	02050e63          	beqz	a0,40000adc <Proc_6+0x58>
  *Enum_Ref_Par = Enum_Val_Par;
40000aa4:	0084a023          	sw	s0,0(s1)
  switch (Enum_Val_Par)
40000aa8:	00100793          	li	a5,1
40000aac:	04f40063          	beq	s0,a5,40000aec <Proc_6+0x68>
40000ab0:	04040463          	beqz	s0,40000af8 <Proc_6+0x74>
40000ab4:	00200713          	li	a4,2
40000ab8:	04e40c63          	beq	s0,a4,40000b10 <Proc_6+0x8c>
40000abc:	00400793          	li	a5,4
40000ac0:	00f41463          	bne	s0,a5,40000ac8 <Proc_6+0x44>
      *Enum_Ref_Par = Ident_3;
40000ac4:	00e4a023          	sw	a4,0(s1)
} /* Proc_6 */
40000ac8:	00c12083          	lw	ra,12(sp)
40000acc:	00812403          	lw	s0,8(sp)
40000ad0:	00412483          	lw	s1,4(sp)
40000ad4:	01010113          	addi	sp,sp,16
40000ad8:	00008067          	ret
    *Enum_Ref_Par = Ident_4;
40000adc:	00300793          	li	a5,3
40000ae0:	00f4a023          	sw	a5,0(s1)
  switch (Enum_Val_Par)
40000ae4:	00100793          	li	a5,1
40000ae8:	fcf414e3          	bne	s0,a5,40000ab0 <Proc_6+0x2c>
      if (Int_Glob > 100)
40000aec:	83c1a703          	lw	a4,-1988(gp) # 4000349c <Int_Glob>
40000af0:	06400793          	li	a5,100
40000af4:	02e7da63          	ble	a4,a5,40000b28 <Proc_6+0xa4>
} /* Proc_6 */
40000af8:	00c12083          	lw	ra,12(sp)
40000afc:	00812403          	lw	s0,8(sp)
      *Enum_Ref_Par = Ident_1;
40000b00:	0004a023          	sw	zero,0(s1)
} /* Proc_6 */
40000b04:	00412483          	lw	s1,4(sp)
40000b08:	01010113          	addi	sp,sp,16
40000b0c:	00008067          	ret
40000b10:	00c12083          	lw	ra,12(sp)
40000b14:	00812403          	lw	s0,8(sp)
      *Enum_Ref_Par = Ident_2;
40000b18:	00f4a023          	sw	a5,0(s1)
} /* Proc_6 */
40000b1c:	00412483          	lw	s1,4(sp)
40000b20:	01010113          	addi	sp,sp,16
40000b24:	00008067          	ret
40000b28:	00c12083          	lw	ra,12(sp)
40000b2c:	00812403          	lw	s0,8(sp)
      else *Enum_Ref_Par = Ident_4;
40000b30:	00300793          	li	a5,3
40000b34:	00f4a023          	sw	a5,0(s1)
} /* Proc_6 */
40000b38:	00412483          	lw	s1,4(sp)
40000b3c:	01010113          	addi	sp,sp,16
40000b40:	00008067          	ret

40000b44 <uart_writeAvailability.constprop.1>:
	return (reg->STATUS >> 16) & 0xFF;
40000b44:	f00107b7          	lui	a5,0xf0010
40000b48:	0047a503          	lw	a0,4(a5) # f0010004 <_stack_start+0x7000f6c4>
40000b4c:	01055513          	srli	a0,a0,0x10
}
40000b50:	0ff57513          	andi	a0,a0,255
40000b54:	00008067          	ret

40000b58 <uart_write.constprop.0>:
static void uart_write(Uart_Reg *reg, uint32_t data){
40000b58:	ff010113          	addi	sp,sp,-16
40000b5c:	00812423          	sw	s0,8(sp)
40000b60:	00112623          	sw	ra,12(sp)
40000b64:	00050413          	mv	s0,a0
	while(uart_writeAvailability(reg) == 0);
40000b68:	fddff0ef          	jal	ra,40000b44 <uart_writeAvailability.constprop.1>
40000b6c:	fe050ee3          	beqz	a0,40000b68 <uart_write.constprop.0+0x10>
	reg->DATA = data;
40000b70:	f00107b7          	lui	a5,0xf0010
40000b74:	0087a023          	sw	s0,0(a5) # f0010000 <_stack_start+0x7000f6c0>
}
40000b78:	00c12083          	lw	ra,12(sp)
40000b7c:	00812403          	lw	s0,8(sp)
40000b80:	01010113          	addi	sp,sp,16
40000b84:	00008067          	ret

40000b88 <putchar>:
extern char *malloc();
extern int printf(const char *format, ...);
extern void putchar(char c);

void putchar(char c){
	uart_write(UART, c);
40000b88:	fd1ff06f          	j	40000b58 <uart_write.constprop.0>

40000b8c <printf_s>:
{
	putchar(c);
}

static void printf_s(char *p)
{
40000b8c:	ff010113          	addi	sp,sp,-16
40000b90:	00812423          	sw	s0,8(sp)
40000b94:	00112623          	sw	ra,12(sp)
40000b98:	00050413          	mv	s0,a0
	while (*p)
40000b9c:	00054503          	lbu	a0,0(a0)
40000ba0:	00050a63          	beqz	a0,40000bb4 <printf_s+0x28>
		putchar(*(p++));
40000ba4:	00140413          	addi	s0,s0,1
40000ba8:	fe1ff0ef          	jal	ra,40000b88 <putchar>
	while (*p)
40000bac:	00044503          	lbu	a0,0(s0)
40000bb0:	fe051ae3          	bnez	a0,40000ba4 <printf_s+0x18>
}
40000bb4:	00c12083          	lw	ra,12(sp)
40000bb8:	00812403          	lw	s0,8(sp)
40000bbc:	01010113          	addi	sp,sp,16
40000bc0:	00008067          	ret

40000bc4 <printf_c>:
	putchar(c);
40000bc4:	0ff57513          	andi	a0,a0,255
40000bc8:	fc1ff06f          	j	40000b88 <putchar>

40000bcc <printf_d>:

static void printf_d(int val)
{
40000bcc:	fd010113          	addi	sp,sp,-48
40000bd0:	02912223          	sw	s1,36(sp)
40000bd4:	02112623          	sw	ra,44(sp)
40000bd8:	02812423          	sw	s0,40(sp)
40000bdc:	03212023          	sw	s2,32(sp)
40000be0:	00050493          	mv	s1,a0
	char buffer[32];
	char *p = buffer;
	if (val < 0) {
40000be4:	04054c63          	bltz	a0,40000c3c <printf_d+0x70>
{
40000be8:	00010913          	mv	s2,sp
40000bec:	00090413          	mv	s0,s2
		printf_c('-');
		val = -val;
	}
	while (val || p == buffer) {
		*(p++) = '0' + val % 10;
40000bf0:	00a00713          	li	a4,10
	while (val || p == buffer) {
40000bf4:	00049463          	bnez	s1,40000bfc <printf_d+0x30>
40000bf8:	01241e63          	bne	s0,s2,40000c14 <printf_d+0x48>
		*(p++) = '0' + val % 10;
40000bfc:	02e4e7b3          	rem	a5,s1,a4
40000c00:	00140413          	addi	s0,s0,1
40000c04:	03078793          	addi	a5,a5,48
		val = val / 10;
40000c08:	02e4c4b3          	div	s1,s1,a4
		*(p++) = '0' + val % 10;
40000c0c:	fef40fa3          	sb	a5,-1(s0)
40000c10:	fe5ff06f          	j	40000bf4 <printf_d+0x28>
	}
	while (p != buffer)
		printf_c(*(--p));
40000c14:	fff40413          	addi	s0,s0,-1
40000c18:	00044503          	lbu	a0,0(s0)
40000c1c:	fa9ff0ef          	jal	ra,40000bc4 <printf_c>
	while (p != buffer)
40000c20:	ff241ae3          	bne	s0,s2,40000c14 <printf_d+0x48>
}
40000c24:	02c12083          	lw	ra,44(sp)
40000c28:	02812403          	lw	s0,40(sp)
40000c2c:	02412483          	lw	s1,36(sp)
40000c30:	02012903          	lw	s2,32(sp)
40000c34:	03010113          	addi	sp,sp,48
40000c38:	00008067          	ret
		printf_c('-');
40000c3c:	02d00513          	li	a0,45
40000c40:	f85ff0ef          	jal	ra,40000bc4 <printf_c>
		val = -val;
40000c44:	409004b3          	neg	s1,s1
40000c48:	fa1ff06f          	j	40000be8 <printf_d+0x1c>

40000c4c <malloc>:
	char *p = heap_memory + heap_memory_used;
40000c4c:	8481a703          	lw	a4,-1976(gp) # 400034a8 <heap_memory_used>
	heap_memory_used += size;
40000c50:	00a707b3          	add	a5,a4,a0
	char *p = heap_memory + heap_memory_used;
40000c54:	40006537          	lui	a0,0x40006
	heap_memory_used += size;
40000c58:	84f1a423          	sw	a5,-1976(gp) # 400034a8 <heap_memory_used>
	char *p = heap_memory + heap_memory_used;
40000c5c:	c8450513          	addi	a0,a0,-892 # 40005c84 <heap_memory>
	if (heap_memory_used > 1024)
40000c60:	40000693          	li	a3,1024
	char *p = heap_memory + heap_memory_used;
40000c64:	00e50533          	add	a0,a0,a4
	if (heap_memory_used > 1024)
40000c68:	00f6d463          	ble	a5,a3,40000c70 <malloc+0x24>
		asm volatile ("ebreak");
40000c6c:	00100073          	ebreak
}
40000c70:	00008067          	ret

40000c74 <printf>:

int printf(const char *format, ...)
{
40000c74:	fb010113          	addi	sp,sp,-80
40000c78:	01412c23          	sw	s4,24(sp)
40000c7c:	02112623          	sw	ra,44(sp)
40000c80:	02812423          	sw	s0,40(sp)
40000c84:	02912223          	sw	s1,36(sp)
40000c88:	03212023          	sw	s2,32(sp)
40000c8c:	01312e23          	sw	s3,28(sp)
40000c90:	01512a23          	sw	s5,20(sp)
40000c94:	00050a13          	mv	s4,a0
	int i;
	va_list ap;

	va_start(ap, format);

	for (i = 0; format[i]; i++)
40000c98:	00054503          	lbu	a0,0(a0)
{
40000c9c:	04f12223          	sw	a5,68(sp)
	va_start(ap, format);
40000ca0:	03410793          	addi	a5,sp,52
{
40000ca4:	02b12a23          	sw	a1,52(sp)
40000ca8:	02c12c23          	sw	a2,56(sp)
40000cac:	02d12e23          	sw	a3,60(sp)
40000cb0:	04e12023          	sw	a4,64(sp)
40000cb4:	05012423          	sw	a6,72(sp)
40000cb8:	05112623          	sw	a7,76(sp)
	va_start(ap, format);
40000cbc:	00f12623          	sw	a5,12(sp)
	for (i = 0; format[i]; i++)
40000cc0:	02050863          	beqz	a0,40000cf0 <printf+0x7c>
40000cc4:	00000413          	li	s0,0
		if (format[i] == '%') {
40000cc8:	02500a93          	li	s5,37
			while (format[++i]) {
				if (format[i] == 'c') {
40000ccc:	06300493          	li	s1,99
					printf_c(va_arg(ap,int));
					break;
				}
				if (format[i] == 's') {
40000cd0:	07300913          	li	s2,115
					printf_s(va_arg(ap,char*));
					break;
				}
				if (format[i] == 'd') {
40000cd4:	06400993          	li	s3,100
		if (format[i] == '%') {
40000cd8:	03550e63          	beq	a0,s5,40000d14 <printf+0xa0>
					printf_d(va_arg(ap,int));
					break;
				}
			}
		} else
			printf_c(format[i]);
40000cdc:	ee9ff0ef          	jal	ra,40000bc4 <printf_c>
	for (i = 0; format[i]; i++)
40000ce0:	00140413          	addi	s0,s0,1
40000ce4:	008a07b3          	add	a5,s4,s0
40000ce8:	0007c503          	lbu	a0,0(a5)
40000cec:	fe0516e3          	bnez	a0,40000cd8 <printf+0x64>

	va_end(ap);
}
40000cf0:	02c12083          	lw	ra,44(sp)
40000cf4:	02812403          	lw	s0,40(sp)
40000cf8:	02412483          	lw	s1,36(sp)
40000cfc:	02012903          	lw	s2,32(sp)
40000d00:	01c12983          	lw	s3,28(sp)
40000d04:	01812a03          	lw	s4,24(sp)
40000d08:	01412a83          	lw	s5,20(sp)
40000d0c:	05010113          	addi	sp,sp,80
40000d10:	00008067          	ret
40000d14:	00140693          	addi	a3,s0,1
40000d18:	00da0733          	add	a4,s4,a3
40000d1c:	0100006f          	j	40000d2c <printf+0xb8>
				if (format[i] == 's') {
40000d20:	03278c63          	beq	a5,s2,40000d58 <printf+0xe4>
				if (format[i] == 'd') {
40000d24:	05378663          	beq	a5,s3,40000d70 <printf+0xfc>
40000d28:	00168693          	addi	a3,a3,1
			while (format[++i]) {
40000d2c:	00074783          	lbu	a5,0(a4)
40000d30:	00068413          	mv	s0,a3
40000d34:	00170713          	addi	a4,a4,1
40000d38:	fa0784e3          	beqz	a5,40000ce0 <printf+0x6c>
				if (format[i] == 'c') {
40000d3c:	fe9792e3          	bne	a5,s1,40000d20 <printf+0xac>
					printf_c(va_arg(ap,int));
40000d40:	00c12783          	lw	a5,12(sp)
40000d44:	0007a503          	lw	a0,0(a5)
40000d48:	00478793          	addi	a5,a5,4
40000d4c:	00f12623          	sw	a5,12(sp)
40000d50:	e75ff0ef          	jal	ra,40000bc4 <printf_c>
					break;
40000d54:	f8dff06f          	j	40000ce0 <printf+0x6c>
					printf_s(va_arg(ap,char*));
40000d58:	00c12783          	lw	a5,12(sp)
40000d5c:	0007a503          	lw	a0,0(a5)
40000d60:	00478793          	addi	a5,a5,4
40000d64:	00f12623          	sw	a5,12(sp)
40000d68:	e25ff0ef          	jal	ra,40000b8c <printf_s>
					break;
40000d6c:	f75ff06f          	j	40000ce0 <printf+0x6c>
					printf_d(va_arg(ap,int));
40000d70:	00c12783          	lw	a5,12(sp)
40000d74:	0007a503          	lw	a0,0(a5)
40000d78:	00478793          	addi	a5,a5,4
40000d7c:	00f12623          	sw	a5,12(sp)
40000d80:	e4dff0ef          	jal	ra,40000bcc <printf_d>
					break;
40000d84:	f5dff06f          	j	40000ce0 <printf+0x6c>

40000d88 <puts>:


int puts(char *s){
40000d88:	ff010113          	addi	sp,sp,-16
40000d8c:	00812423          	sw	s0,8(sp)
40000d90:	00112623          	sw	ra,12(sp)
40000d94:	00050413          	mv	s0,a0
  while (*s) {
40000d98:	00054503          	lbu	a0,0(a0)
40000d9c:	00050a63          	beqz	a0,40000db0 <puts+0x28>
    putchar(*s);
    s++;
40000da0:	00140413          	addi	s0,s0,1
    putchar(*s);
40000da4:	de5ff0ef          	jal	ra,40000b88 <putchar>
  while (*s) {
40000da8:	00044503          	lbu	a0,0(s0)
40000dac:	fe051ae3          	bnez	a0,40000da0 <puts+0x18>
  }
  putchar('\n');
40000db0:	00a00513          	li	a0,10
40000db4:	dd5ff0ef          	jal	ra,40000b88 <putchar>
  return 0;
}
40000db8:	00c12083          	lw	ra,12(sp)
40000dbc:	00812403          	lw	s0,8(sp)
40000dc0:	00000513          	li	a0,0
40000dc4:	01010113          	addi	sp,sp,16
40000dc8:	00008067          	ret

40000dcc <memcpy>:
40000dcc:	00a5c7b3          	xor	a5,a1,a0
40000dd0:	0037f793          	andi	a5,a5,3
40000dd4:	00c50733          	add	a4,a0,a2
40000dd8:	00079663          	bnez	a5,40000de4 <memcpy+0x18>
40000ddc:	00300793          	li	a5,3
40000de0:	02c7e463          	bltu	a5,a2,40000e08 <memcpy+0x3c>
40000de4:	00050793          	mv	a5,a0
40000de8:	00e56c63          	bltu	a0,a4,40000e00 <memcpy+0x34>
40000dec:	00008067          	ret
40000df0:	0005c683          	lbu	a3,0(a1)
40000df4:	00178793          	addi	a5,a5,1
40000df8:	00158593          	addi	a1,a1,1
40000dfc:	fed78fa3          	sb	a3,-1(a5)
40000e00:	fee7e8e3          	bltu	a5,a4,40000df0 <memcpy+0x24>
40000e04:	00008067          	ret
40000e08:	00357793          	andi	a5,a0,3
40000e0c:	08079263          	bnez	a5,40000e90 <memcpy+0xc4>
40000e10:	00050793          	mv	a5,a0
40000e14:	ffc77693          	andi	a3,a4,-4
40000e18:	fe068613          	addi	a2,a3,-32
40000e1c:	08c7f663          	bleu	a2,a5,40000ea8 <memcpy+0xdc>
40000e20:	0005a383          	lw	t2,0(a1)
40000e24:	0045a283          	lw	t0,4(a1)
40000e28:	0085af83          	lw	t6,8(a1)
40000e2c:	00c5af03          	lw	t5,12(a1)
40000e30:	0105ae83          	lw	t4,16(a1)
40000e34:	0145ae03          	lw	t3,20(a1)
40000e38:	0185a303          	lw	t1,24(a1)
40000e3c:	01c5a883          	lw	a7,28(a1)
40000e40:	02458593          	addi	a1,a1,36
40000e44:	02478793          	addi	a5,a5,36
40000e48:	ffc5a803          	lw	a6,-4(a1)
40000e4c:	fc77ae23          	sw	t2,-36(a5)
40000e50:	fe57a023          	sw	t0,-32(a5)
40000e54:	fff7a223          	sw	t6,-28(a5)
40000e58:	ffe7a423          	sw	t5,-24(a5)
40000e5c:	ffd7a623          	sw	t4,-20(a5)
40000e60:	ffc7a823          	sw	t3,-16(a5)
40000e64:	fe67aa23          	sw	t1,-12(a5)
40000e68:	ff17ac23          	sw	a7,-8(a5)
40000e6c:	ff07ae23          	sw	a6,-4(a5)
40000e70:	fadff06f          	j	40000e1c <memcpy+0x50>
40000e74:	0005c683          	lbu	a3,0(a1)
40000e78:	00178793          	addi	a5,a5,1
40000e7c:	00158593          	addi	a1,a1,1
40000e80:	fed78fa3          	sb	a3,-1(a5)
40000e84:	0037f693          	andi	a3,a5,3
40000e88:	fe0696e3          	bnez	a3,40000e74 <memcpy+0xa8>
40000e8c:	f89ff06f          	j	40000e14 <memcpy+0x48>
40000e90:	00050793          	mv	a5,a0
40000e94:	ff1ff06f          	j	40000e84 <memcpy+0xb8>
40000e98:	0005a603          	lw	a2,0(a1)
40000e9c:	00478793          	addi	a5,a5,4
40000ea0:	00458593          	addi	a1,a1,4
40000ea4:	fec7ae23          	sw	a2,-4(a5)
40000ea8:	fed7e8e3          	bltu	a5,a3,40000e98 <memcpy+0xcc>
40000eac:	f4e7eae3          	bltu	a5,a4,40000e00 <memcpy+0x34>
40000eb0:	00008067          	ret

40000eb4 <strcmp>:
40000eb4:	00b56733          	or	a4,a0,a1
40000eb8:	fff00393          	li	t2,-1
40000ebc:	00377713          	andi	a4,a4,3
40000ec0:	10071063          	bnez	a4,40000fc0 <strcmp+0x10c>
40000ec4:	7f7f87b7          	lui	a5,0x7f7f8
40000ec8:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <_bss_end+0x3f7f1efb>
40000ecc:	00052603          	lw	a2,0(a0)
40000ed0:	0005a683          	lw	a3,0(a1)
40000ed4:	00f672b3          	and	t0,a2,a5
40000ed8:	00f66333          	or	t1,a2,a5
40000edc:	00f282b3          	add	t0,t0,a5
40000ee0:	0062e2b3          	or	t0,t0,t1
40000ee4:	10729263          	bne	t0,t2,40000fe8 <strcmp+0x134>
40000ee8:	08d61663          	bne	a2,a3,40000f74 <strcmp+0xc0>
40000eec:	00452603          	lw	a2,4(a0)
40000ef0:	0045a683          	lw	a3,4(a1)
40000ef4:	00f672b3          	and	t0,a2,a5
40000ef8:	00f66333          	or	t1,a2,a5
40000efc:	00f282b3          	add	t0,t0,a5
40000f00:	0062e2b3          	or	t0,t0,t1
40000f04:	0c729e63          	bne	t0,t2,40000fe0 <strcmp+0x12c>
40000f08:	06d61663          	bne	a2,a3,40000f74 <strcmp+0xc0>
40000f0c:	00852603          	lw	a2,8(a0)
40000f10:	0085a683          	lw	a3,8(a1)
40000f14:	00f672b3          	and	t0,a2,a5
40000f18:	00f66333          	or	t1,a2,a5
40000f1c:	00f282b3          	add	t0,t0,a5
40000f20:	0062e2b3          	or	t0,t0,t1
40000f24:	0c729863          	bne	t0,t2,40000ff4 <strcmp+0x140>
40000f28:	04d61663          	bne	a2,a3,40000f74 <strcmp+0xc0>
40000f2c:	00c52603          	lw	a2,12(a0)
40000f30:	00c5a683          	lw	a3,12(a1)
40000f34:	00f672b3          	and	t0,a2,a5
40000f38:	00f66333          	or	t1,a2,a5
40000f3c:	00f282b3          	add	t0,t0,a5
40000f40:	0062e2b3          	or	t0,t0,t1
40000f44:	0c729263          	bne	t0,t2,40001008 <strcmp+0x154>
40000f48:	02d61663          	bne	a2,a3,40000f74 <strcmp+0xc0>
40000f4c:	01052603          	lw	a2,16(a0)
40000f50:	0105a683          	lw	a3,16(a1)
40000f54:	00f672b3          	and	t0,a2,a5
40000f58:	00f66333          	or	t1,a2,a5
40000f5c:	00f282b3          	add	t0,t0,a5
40000f60:	0062e2b3          	or	t0,t0,t1
40000f64:	0a729c63          	bne	t0,t2,4000101c <strcmp+0x168>
40000f68:	01450513          	addi	a0,a0,20
40000f6c:	01458593          	addi	a1,a1,20
40000f70:	f4d60ee3          	beq	a2,a3,40000ecc <strcmp+0x18>
40000f74:	01061713          	slli	a4,a2,0x10
40000f78:	01069793          	slli	a5,a3,0x10
40000f7c:	00f71e63          	bne	a4,a5,40000f98 <strcmp+0xe4>
40000f80:	01065713          	srli	a4,a2,0x10
40000f84:	0106d793          	srli	a5,a3,0x10
40000f88:	40f70533          	sub	a0,a4,a5
40000f8c:	0ff57593          	andi	a1,a0,255
40000f90:	02059063          	bnez	a1,40000fb0 <strcmp+0xfc>
40000f94:	00008067          	ret
40000f98:	01075713          	srli	a4,a4,0x10
40000f9c:	0107d793          	srli	a5,a5,0x10
40000fa0:	40f70533          	sub	a0,a4,a5
40000fa4:	0ff57593          	andi	a1,a0,255
40000fa8:	00059463          	bnez	a1,40000fb0 <strcmp+0xfc>
40000fac:	00008067          	ret
40000fb0:	0ff77713          	andi	a4,a4,255
40000fb4:	0ff7f793          	andi	a5,a5,255
40000fb8:	40f70533          	sub	a0,a4,a5
40000fbc:	00008067          	ret
40000fc0:	00054603          	lbu	a2,0(a0)
40000fc4:	0005c683          	lbu	a3,0(a1)
40000fc8:	00150513          	addi	a0,a0,1
40000fcc:	00158593          	addi	a1,a1,1
40000fd0:	00d61463          	bne	a2,a3,40000fd8 <strcmp+0x124>
40000fd4:	fe0616e3          	bnez	a2,40000fc0 <strcmp+0x10c>
40000fd8:	40d60533          	sub	a0,a2,a3
40000fdc:	00008067          	ret
40000fe0:	00450513          	addi	a0,a0,4
40000fe4:	00458593          	addi	a1,a1,4
40000fe8:	fcd61ce3          	bne	a2,a3,40000fc0 <strcmp+0x10c>
40000fec:	00000513          	li	a0,0
40000ff0:	00008067          	ret
40000ff4:	00850513          	addi	a0,a0,8
40000ff8:	00858593          	addi	a1,a1,8
40000ffc:	fcd612e3          	bne	a2,a3,40000fc0 <strcmp+0x10c>
40001000:	00000513          	li	a0,0
40001004:	00008067          	ret
40001008:	00c50513          	addi	a0,a0,12
4000100c:	00c58593          	addi	a1,a1,12
40001010:	fad618e3          	bne	a2,a3,40000fc0 <strcmp+0x10c>
40001014:	00000513          	li	a0,0
40001018:	00008067          	ret
4000101c:	01050513          	addi	a0,a0,16
40001020:	01058593          	addi	a1,a1,16
40001024:	f8d61ee3          	bne	a2,a3,40000fc0 <strcmp+0x10c>
40001028:	00000513          	li	a0,0
4000102c:	00008067          	ret

40001030 <__divdf3>:
40001030:	fd010113          	addi	sp,sp,-48
40001034:	02812423          	sw	s0,40(sp)
40001038:	02912223          	sw	s1,36(sp)
4000103c:	01612823          	sw	s6,16(sp)
40001040:	00050413          	mv	s0,a0
40001044:	00050b13          	mv	s6,a0
40001048:	001004b7          	lui	s1,0x100
4000104c:	0145d513          	srli	a0,a1,0x14
40001050:	03212023          	sw	s2,32(sp)
40001054:	01312e23          	sw	s3,28(sp)
40001058:	01712623          	sw	s7,12(sp)
4000105c:	fff48493          	addi	s1,s1,-1 # fffff <_stack_size+0xff7ff>
40001060:	02112623          	sw	ra,44(sp)
40001064:	01412c23          	sw	s4,24(sp)
40001068:	01512a23          	sw	s5,20(sp)
4000106c:	7ff57513          	andi	a0,a0,2047
40001070:	00060b93          	mv	s7,a2
40001074:	00068993          	mv	s3,a3
40001078:	00b4f4b3          	and	s1,s1,a1
4000107c:	01f5d913          	srli	s2,a1,0x1f
40001080:	0a050663          	beqz	a0,4000112c <__divdf3+0xfc>
40001084:	7ff00793          	li	a5,2047
40001088:	10f50663          	beq	a0,a5,40001194 <__divdf3+0x164>
4000108c:	00349493          	slli	s1,s1,0x3
40001090:	008006b7          	lui	a3,0x800
40001094:	00d4e4b3          	or	s1,s1,a3
40001098:	01db5a93          	srli	s5,s6,0x1d
4000109c:	009aeab3          	or	s5,s5,s1
400010a0:	003b1413          	slli	s0,s6,0x3
400010a4:	c0150a13          	addi	s4,a0,-1023
400010a8:	00000b13          	li	s6,0
400010ac:	0149d513          	srli	a0,s3,0x14
400010b0:	001004b7          	lui	s1,0x100
400010b4:	fff48493          	addi	s1,s1,-1 # fffff <_stack_size+0xff7ff>
400010b8:	7ff57513          	andi	a0,a0,2047
400010bc:	0134f4b3          	and	s1,s1,s3
400010c0:	000b8f93          	mv	t6,s7
400010c4:	01f9d993          	srli	s3,s3,0x1f
400010c8:	10050263          	beqz	a0,400011cc <__divdf3+0x19c>
400010cc:	7ff00793          	li	a5,2047
400010d0:	16f50263          	beq	a0,a5,40001234 <__divdf3+0x204>
400010d4:	008007b7          	lui	a5,0x800
400010d8:	00349493          	slli	s1,s1,0x3
400010dc:	00f4e4b3          	or	s1,s1,a5
400010e0:	01dbd793          	srli	a5,s7,0x1d
400010e4:	0097e7b3          	or	a5,a5,s1
400010e8:	003b9f93          	slli	t6,s7,0x3
400010ec:	c0150513          	addi	a0,a0,-1023
400010f0:	00000713          	li	a4,0
400010f4:	002b1693          	slli	a3,s6,0x2
400010f8:	00e6e6b3          	or	a3,a3,a4
400010fc:	fff68693          	addi	a3,a3,-1 # 7fffff <_stack_size+0x7ff7ff>
40001100:	00e00593          	li	a1,14
40001104:	01394633          	xor	a2,s2,s3
40001108:	40aa0533          	sub	a0,s4,a0
4000110c:	16d5e063          	bltu	a1,a3,4000126c <__divdf3+0x23c>
40001110:	00002597          	auipc	a1,0x2
40001114:	16058593          	addi	a1,a1,352 # 40003270 <end+0x624>
40001118:	00269693          	slli	a3,a3,0x2
4000111c:	00b686b3          	add	a3,a3,a1
40001120:	0006a683          	lw	a3,0(a3)
40001124:	00b686b3          	add	a3,a3,a1
40001128:	00068067          	jr	a3
4000112c:	0164eab3          	or	s5,s1,s6
40001130:	060a8e63          	beqz	s5,400011ac <__divdf3+0x17c>
40001134:	04048063          	beqz	s1,40001174 <__divdf3+0x144>
40001138:	00048513          	mv	a0,s1
4000113c:	2c5010ef          	jal	ra,40002c00 <__clzsi2>
40001140:	ff550793          	addi	a5,a0,-11
40001144:	01c00713          	li	a4,28
40001148:	02f74e63          	blt	a4,a5,40001184 <__divdf3+0x154>
4000114c:	01d00a93          	li	s5,29
40001150:	ff850413          	addi	s0,a0,-8
40001154:	40fa8ab3          	sub	s5,s5,a5
40001158:	008494b3          	sll	s1,s1,s0
4000115c:	015b5ab3          	srl	s5,s6,s5
40001160:	009aeab3          	or	s5,s5,s1
40001164:	008b1433          	sll	s0,s6,s0
40001168:	c0d00a13          	li	s4,-1011
4000116c:	40aa0a33          	sub	s4,s4,a0
40001170:	f39ff06f          	j	400010a8 <__divdf3+0x78>
40001174:	000b0513          	mv	a0,s6
40001178:	289010ef          	jal	ra,40002c00 <__clzsi2>
4000117c:	02050513          	addi	a0,a0,32
40001180:	fc1ff06f          	j	40001140 <__divdf3+0x110>
40001184:	fd850493          	addi	s1,a0,-40
40001188:	009b1ab3          	sll	s5,s6,s1
4000118c:	00000413          	li	s0,0
40001190:	fd9ff06f          	j	40001168 <__divdf3+0x138>
40001194:	0164eab3          	or	s5,s1,s6
40001198:	020a8263          	beqz	s5,400011bc <__divdf3+0x18c>
4000119c:	00048a93          	mv	s5,s1
400011a0:	7ff00a13          	li	s4,2047
400011a4:	00300b13          	li	s6,3
400011a8:	f05ff06f          	j	400010ac <__divdf3+0x7c>
400011ac:	00000413          	li	s0,0
400011b0:	00000a13          	li	s4,0
400011b4:	00100b13          	li	s6,1
400011b8:	ef5ff06f          	j	400010ac <__divdf3+0x7c>
400011bc:	00000413          	li	s0,0
400011c0:	7ff00a13          	li	s4,2047
400011c4:	00200b13          	li	s6,2
400011c8:	ee5ff06f          	j	400010ac <__divdf3+0x7c>
400011cc:	0174e7b3          	or	a5,s1,s7
400011d0:	06078e63          	beqz	a5,4000124c <__divdf3+0x21c>
400011d4:	04048063          	beqz	s1,40001214 <__divdf3+0x1e4>
400011d8:	00048513          	mv	a0,s1
400011dc:	225010ef          	jal	ra,40002c00 <__clzsi2>
400011e0:	ff550713          	addi	a4,a0,-11
400011e4:	01c00793          	li	a5,28
400011e8:	02e7ce63          	blt	a5,a4,40001224 <__divdf3+0x1f4>
400011ec:	01d00793          	li	a5,29
400011f0:	ff850f93          	addi	t6,a0,-8
400011f4:	40e787b3          	sub	a5,a5,a4
400011f8:	01f494b3          	sll	s1,s1,t6
400011fc:	00fbd7b3          	srl	a5,s7,a5
40001200:	0097e7b3          	or	a5,a5,s1
40001204:	01fb9fb3          	sll	t6,s7,t6
40001208:	c0d00613          	li	a2,-1011
4000120c:	40a60533          	sub	a0,a2,a0
40001210:	ee1ff06f          	j	400010f0 <__divdf3+0xc0>
40001214:	000b8513          	mv	a0,s7
40001218:	1e9010ef          	jal	ra,40002c00 <__clzsi2>
4000121c:	02050513          	addi	a0,a0,32
40001220:	fc1ff06f          	j	400011e0 <__divdf3+0x1b0>
40001224:	fd850793          	addi	a5,a0,-40
40001228:	00fb97b3          	sll	a5,s7,a5
4000122c:	00000f93          	li	t6,0
40001230:	fd9ff06f          	j	40001208 <__divdf3+0x1d8>
40001234:	0174e7b3          	or	a5,s1,s7
40001238:	02078263          	beqz	a5,4000125c <__divdf3+0x22c>
4000123c:	00048793          	mv	a5,s1
40001240:	7ff00513          	li	a0,2047
40001244:	00300713          	li	a4,3
40001248:	eadff06f          	j	400010f4 <__divdf3+0xc4>
4000124c:	00000f93          	li	t6,0
40001250:	00000513          	li	a0,0
40001254:	00100713          	li	a4,1
40001258:	e9dff06f          	j	400010f4 <__divdf3+0xc4>
4000125c:	00000f93          	li	t6,0
40001260:	7ff00513          	li	a0,2047
40001264:	00200713          	li	a4,2
40001268:	e8dff06f          	j	400010f4 <__divdf3+0xc4>
4000126c:	0157e663          	bltu	a5,s5,40001278 <__divdf3+0x248>
40001270:	36fa9063          	bne	s5,a5,400015d0 <__divdf3+0x5a0>
40001274:	35f46e63          	bltu	s0,t6,400015d0 <__divdf3+0x5a0>
40001278:	01fa9593          	slli	a1,s5,0x1f
4000127c:	00145693          	srli	a3,s0,0x1
40001280:	01f41713          	slli	a4,s0,0x1f
40001284:	001ada93          	srli	s5,s5,0x1
40001288:	00d5e433          	or	s0,a1,a3
4000128c:	00879793          	slli	a5,a5,0x8
40001290:	018fd813          	srli	a6,t6,0x18
40001294:	00f86833          	or	a6,a6,a5
40001298:	01085e93          	srli	t4,a6,0x10
4000129c:	03dad5b3          	divu	a1,s5,t4
400012a0:	01081e13          	slli	t3,a6,0x10
400012a4:	010e5e13          	srli	t3,t3,0x10
400012a8:	01045693          	srli	a3,s0,0x10
400012ac:	008f9893          	slli	a7,t6,0x8
400012b0:	03daf4b3          	remu	s1,s5,t4
400012b4:	00058f93          	mv	t6,a1
400012b8:	02be07b3          	mul	a5,t3,a1
400012bc:	01049493          	slli	s1,s1,0x10
400012c0:	0096e6b3          	or	a3,a3,s1
400012c4:	00f6fe63          	bleu	a5,a3,400012e0 <__divdf3+0x2b0>
400012c8:	010686b3          	add	a3,a3,a6
400012cc:	fff58f93          	addi	t6,a1,-1
400012d0:	0106e863          	bltu	a3,a6,400012e0 <__divdf3+0x2b0>
400012d4:	00f6f663          	bleu	a5,a3,400012e0 <__divdf3+0x2b0>
400012d8:	ffe58f93          	addi	t6,a1,-2
400012dc:	010686b3          	add	a3,a3,a6
400012e0:	40f686b3          	sub	a3,a3,a5
400012e4:	03d6d333          	divu	t1,a3,t4
400012e8:	01041413          	slli	s0,s0,0x10
400012ec:	01045413          	srli	s0,s0,0x10
400012f0:	03d6f6b3          	remu	a3,a3,t4
400012f4:	00030793          	mv	a5,t1
400012f8:	026e05b3          	mul	a1,t3,t1
400012fc:	01069693          	slli	a3,a3,0x10
40001300:	00d466b3          	or	a3,s0,a3
40001304:	00b6fe63          	bleu	a1,a3,40001320 <__divdf3+0x2f0>
40001308:	010686b3          	add	a3,a3,a6
4000130c:	fff30793          	addi	a5,t1,-1
40001310:	0106e863          	bltu	a3,a6,40001320 <__divdf3+0x2f0>
40001314:	00b6f663          	bleu	a1,a3,40001320 <__divdf3+0x2f0>
40001318:	ffe30793          	addi	a5,t1,-2
4000131c:	010686b3          	add	a3,a3,a6
40001320:	40b68433          	sub	s0,a3,a1
40001324:	010f9f93          	slli	t6,t6,0x10
40001328:	000105b7          	lui	a1,0x10
4000132c:	00ffefb3          	or	t6,t6,a5
40001330:	fff58313          	addi	t1,a1,-1 # ffff <_stack_size+0xf7ff>
40001334:	010fd693          	srli	a3,t6,0x10
40001338:	006ff7b3          	and	a5,t6,t1
4000133c:	0108df13          	srli	t5,a7,0x10
40001340:	0068f333          	and	t1,a7,t1
40001344:	026783b3          	mul	t2,a5,t1
40001348:	026684b3          	mul	s1,a3,t1
4000134c:	02ff07b3          	mul	a5,t5,a5
40001350:	03e682b3          	mul	t0,a3,t5
40001354:	009786b3          	add	a3,a5,s1
40001358:	0103d793          	srli	a5,t2,0x10
4000135c:	00d787b3          	add	a5,a5,a3
40001360:	0097f463          	bleu	s1,a5,40001368 <__divdf3+0x338>
40001364:	00b282b3          	add	t0,t0,a1
40001368:	0107d693          	srli	a3,a5,0x10
4000136c:	005686b3          	add	a3,a3,t0
40001370:	000102b7          	lui	t0,0x10
40001374:	fff28293          	addi	t0,t0,-1 # ffff <_stack_size+0xf7ff>
40001378:	0057f5b3          	and	a1,a5,t0
4000137c:	01059593          	slli	a1,a1,0x10
40001380:	0053f3b3          	and	t2,t2,t0
40001384:	007585b3          	add	a1,a1,t2
40001388:	00d46863          	bltu	s0,a3,40001398 <__divdf3+0x368>
4000138c:	000f8793          	mv	a5,t6
40001390:	04d41463          	bne	s0,a3,400013d8 <__divdf3+0x3a8>
40001394:	04b77263          	bleu	a1,a4,400013d8 <__divdf3+0x3a8>
40001398:	01170733          	add	a4,a4,a7
4000139c:	011732b3          	sltu	t0,a4,a7
400013a0:	010282b3          	add	t0,t0,a6
400013a4:	00540433          	add	s0,s0,t0
400013a8:	ffff8793          	addi	a5,t6,-1
400013ac:	00886663          	bltu	a6,s0,400013b8 <__divdf3+0x388>
400013b0:	02881463          	bne	a6,s0,400013d8 <__divdf3+0x3a8>
400013b4:	03176263          	bltu	a4,a7,400013d8 <__divdf3+0x3a8>
400013b8:	00d46663          	bltu	s0,a3,400013c4 <__divdf3+0x394>
400013bc:	00869e63          	bne	a3,s0,400013d8 <__divdf3+0x3a8>
400013c0:	00b77c63          	bleu	a1,a4,400013d8 <__divdf3+0x3a8>
400013c4:	01170733          	add	a4,a4,a7
400013c8:	ffef8793          	addi	a5,t6,-2
400013cc:	01173fb3          	sltu	t6,a4,a7
400013d0:	010f8fb3          	add	t6,t6,a6
400013d4:	01f40433          	add	s0,s0,t6
400013d8:	40b705b3          	sub	a1,a4,a1
400013dc:	40d40433          	sub	s0,s0,a3
400013e0:	00b73733          	sltu	a4,a4,a1
400013e4:	40e40433          	sub	s0,s0,a4
400013e8:	fff00f93          	li	t6,-1
400013ec:	12880463          	beq	a6,s0,40001514 <__divdf3+0x4e4>
400013f0:	03d452b3          	divu	t0,s0,t4
400013f4:	0105d693          	srli	a3,a1,0x10
400013f8:	03d47433          	remu	s0,s0,t4
400013fc:	00028713          	mv	a4,t0
40001400:	025e0fb3          	mul	t6,t3,t0
40001404:	01041413          	slli	s0,s0,0x10
40001408:	0086e433          	or	s0,a3,s0
4000140c:	01f47e63          	bleu	t6,s0,40001428 <__divdf3+0x3f8>
40001410:	01040433          	add	s0,s0,a6
40001414:	fff28713          	addi	a4,t0,-1
40001418:	01046863          	bltu	s0,a6,40001428 <__divdf3+0x3f8>
4000141c:	01f47663          	bleu	t6,s0,40001428 <__divdf3+0x3f8>
40001420:	ffe28713          	addi	a4,t0,-2
40001424:	01040433          	add	s0,s0,a6
40001428:	41f40433          	sub	s0,s0,t6
4000142c:	03d456b3          	divu	a3,s0,t4
40001430:	01059593          	slli	a1,a1,0x10
40001434:	0105d593          	srli	a1,a1,0x10
40001438:	03d47433          	remu	s0,s0,t4
4000143c:	02de0e33          	mul	t3,t3,a3
40001440:	01041413          	slli	s0,s0,0x10
40001444:	0085e433          	or	s0,a1,s0
40001448:	00068593          	mv	a1,a3
4000144c:	01c47e63          	bleu	t3,s0,40001468 <__divdf3+0x438>
40001450:	01040433          	add	s0,s0,a6
40001454:	fff68593          	addi	a1,a3,-1
40001458:	01046863          	bltu	s0,a6,40001468 <__divdf3+0x438>
4000145c:	01c47663          	bleu	t3,s0,40001468 <__divdf3+0x438>
40001460:	ffe68593          	addi	a1,a3,-2
40001464:	01040433          	add	s0,s0,a6
40001468:	01071713          	slli	a4,a4,0x10
4000146c:	00b765b3          	or	a1,a4,a1
40001470:	01059713          	slli	a4,a1,0x10
40001474:	01075713          	srli	a4,a4,0x10
40001478:	41c40433          	sub	s0,s0,t3
4000147c:	0105de13          	srli	t3,a1,0x10
40001480:	02670eb3          	mul	t4,a4,t1
40001484:	026e0333          	mul	t1,t3,t1
40001488:	03cf0e33          	mul	t3,t5,t3
4000148c:	02ef0f33          	mul	t5,t5,a4
40001490:	010ed713          	srli	a4,t4,0x10
40001494:	006f0f33          	add	t5,t5,t1
40001498:	01e70733          	add	a4,a4,t5
4000149c:	00677663          	bleu	t1,a4,400014a8 <__divdf3+0x478>
400014a0:	000106b7          	lui	a3,0x10
400014a4:	00de0e33          	add	t3,t3,a3
400014a8:	01075313          	srli	t1,a4,0x10
400014ac:	01c30333          	add	t1,t1,t3
400014b0:	00010e37          	lui	t3,0x10
400014b4:	fffe0e13          	addi	t3,t3,-1 # ffff <_stack_size+0xf7ff>
400014b8:	01c776b3          	and	a3,a4,t3
400014bc:	01069693          	slli	a3,a3,0x10
400014c0:	01cefeb3          	and	t4,t4,t3
400014c4:	01d686b3          	add	a3,a3,t4
400014c8:	00646863          	bltu	s0,t1,400014d8 <__divdf3+0x4a8>
400014cc:	00058f93          	mv	t6,a1
400014d0:	04641063          	bne	s0,t1,40001510 <__divdf3+0x4e0>
400014d4:	04068063          	beqz	a3,40001514 <__divdf3+0x4e4>
400014d8:	00880433          	add	s0,a6,s0
400014dc:	fff58f93          	addi	t6,a1,-1
400014e0:	03046463          	bltu	s0,a6,40001508 <__divdf3+0x4d8>
400014e4:	00646663          	bltu	s0,t1,400014f0 <__divdf3+0x4c0>
400014e8:	02641463          	bne	s0,t1,40001510 <__divdf3+0x4e0>
400014ec:	02d8f063          	bleu	a3,a7,4000150c <__divdf3+0x4dc>
400014f0:	00189713          	slli	a4,a7,0x1
400014f4:	011738b3          	sltu	a7,a4,a7
400014f8:	01088833          	add	a6,a7,a6
400014fc:	ffe58f93          	addi	t6,a1,-2
40001500:	01040433          	add	s0,s0,a6
40001504:	00070893          	mv	a7,a4
40001508:	00641463          	bne	s0,t1,40001510 <__divdf3+0x4e0>
4000150c:	01168463          	beq	a3,a7,40001514 <__divdf3+0x4e4>
40001510:	001fef93          	ori	t6,t6,1
40001514:	3ff50693          	addi	a3,a0,1023
40001518:	10d05a63          	blez	a3,4000162c <__divdf3+0x5fc>
4000151c:	007ff713          	andi	a4,t6,7
40001520:	02070063          	beqz	a4,40001540 <__divdf3+0x510>
40001524:	00fff713          	andi	a4,t6,15
40001528:	00400593          	li	a1,4
4000152c:	00b70a63          	beq	a4,a1,40001540 <__divdf3+0x510>
40001530:	004f8593          	addi	a1,t6,4
40001534:	01f5bfb3          	sltu	t6,a1,t6
40001538:	01f787b3          	add	a5,a5,t6
4000153c:	00058f93          	mv	t6,a1
40001540:	00779713          	slli	a4,a5,0x7
40001544:	00075a63          	bgez	a4,40001558 <__divdf3+0x528>
40001548:	ff000737          	lui	a4,0xff000
4000154c:	fff70713          	addi	a4,a4,-1 # feffffff <_stack_start+0x7efff6bf>
40001550:	00e7f7b3          	and	a5,a5,a4
40001554:	40050693          	addi	a3,a0,1024
40001558:	7fe00713          	li	a4,2046
4000155c:	18d74a63          	blt	a4,a3,400016f0 <__divdf3+0x6c0>
40001560:	01d79713          	slli	a4,a5,0x1d
40001564:	003fdf93          	srli	t6,t6,0x3
40001568:	01f76733          	or	a4,a4,t6
4000156c:	0037d793          	srli	a5,a5,0x3
40001570:	001005b7          	lui	a1,0x100
40001574:	fff58593          	addi	a1,a1,-1 # fffff <_stack_size+0xff7ff>
40001578:	00b7f7b3          	and	a5,a5,a1
4000157c:	801005b7          	lui	a1,0x80100
40001580:	fff58593          	addi	a1,a1,-1 # 800fffff <_stack_start+0xff6bf>
40001584:	7ff6f693          	andi	a3,a3,2047
40001588:	01469693          	slli	a3,a3,0x14
4000158c:	00b7f7b3          	and	a5,a5,a1
40001590:	02c12083          	lw	ra,44(sp)
40001594:	02812403          	lw	s0,40(sp)
40001598:	01f61613          	slli	a2,a2,0x1f
4000159c:	00d7e7b3          	or	a5,a5,a3
400015a0:	00c7e6b3          	or	a3,a5,a2
400015a4:	02412483          	lw	s1,36(sp)
400015a8:	02012903          	lw	s2,32(sp)
400015ac:	01c12983          	lw	s3,28(sp)
400015b0:	01812a03          	lw	s4,24(sp)
400015b4:	01412a83          	lw	s5,20(sp)
400015b8:	01012b03          	lw	s6,16(sp)
400015bc:	00c12b83          	lw	s7,12(sp)
400015c0:	00070513          	mv	a0,a4
400015c4:	00068593          	mv	a1,a3
400015c8:	03010113          	addi	sp,sp,48
400015cc:	00008067          	ret
400015d0:	fff50513          	addi	a0,a0,-1
400015d4:	00000713          	li	a4,0
400015d8:	cb5ff06f          	j	4000128c <__divdf3+0x25c>
400015dc:	00090613          	mv	a2,s2
400015e0:	000a8793          	mv	a5,s5
400015e4:	00040f93          	mv	t6,s0
400015e8:	000b0713          	mv	a4,s6
400015ec:	00200693          	li	a3,2
400015f0:	10d70063          	beq	a4,a3,400016f0 <__divdf3+0x6c0>
400015f4:	00300693          	li	a3,3
400015f8:	0ed70263          	beq	a4,a3,400016dc <__divdf3+0x6ac>
400015fc:	00100693          	li	a3,1
40001600:	f0d71ae3          	bne	a4,a3,40001514 <__divdf3+0x4e4>
40001604:	00000793          	li	a5,0
40001608:	00000713          	li	a4,0
4000160c:	0940006f          	j	400016a0 <__divdf3+0x670>
40001610:	00098613          	mv	a2,s3
40001614:	fd9ff06f          	j	400015ec <__divdf3+0x5bc>
40001618:	000807b7          	lui	a5,0x80
4000161c:	00000f93          	li	t6,0
40001620:	00000613          	li	a2,0
40001624:	00300713          	li	a4,3
40001628:	fc5ff06f          	j	400015ec <__divdf3+0x5bc>
4000162c:	00100593          	li	a1,1
40001630:	40d585b3          	sub	a1,a1,a3
40001634:	03800713          	li	a4,56
40001638:	fcb746e3          	blt	a4,a1,40001604 <__divdf3+0x5d4>
4000163c:	01f00713          	li	a4,31
40001640:	06b74463          	blt	a4,a1,400016a8 <__divdf3+0x678>
40001644:	41e50513          	addi	a0,a0,1054
40001648:	00a79733          	sll	a4,a5,a0
4000164c:	00bfd6b3          	srl	a3,t6,a1
40001650:	00af9533          	sll	a0,t6,a0
40001654:	00d76733          	or	a4,a4,a3
40001658:	00a03533          	snez	a0,a0
4000165c:	00a76733          	or	a4,a4,a0
40001660:	00b7d7b3          	srl	a5,a5,a1
40001664:	00777693          	andi	a3,a4,7
40001668:	02068063          	beqz	a3,40001688 <__divdf3+0x658>
4000166c:	00f77693          	andi	a3,a4,15
40001670:	00400593          	li	a1,4
40001674:	00b68a63          	beq	a3,a1,40001688 <__divdf3+0x658>
40001678:	00470693          	addi	a3,a4,4
4000167c:	00e6b733          	sltu	a4,a3,a4
40001680:	00e787b3          	add	a5,a5,a4
40001684:	00068713          	mv	a4,a3
40001688:	00879693          	slli	a3,a5,0x8
4000168c:	0606ca63          	bltz	a3,40001700 <__divdf3+0x6d0>
40001690:	01d79693          	slli	a3,a5,0x1d
40001694:	00375713          	srli	a4,a4,0x3
40001698:	00e6e733          	or	a4,a3,a4
4000169c:	0037d793          	srli	a5,a5,0x3
400016a0:	00000693          	li	a3,0
400016a4:	ecdff06f          	j	40001570 <__divdf3+0x540>
400016a8:	fe100713          	li	a4,-31
400016ac:	40d70733          	sub	a4,a4,a3
400016b0:	02000813          	li	a6,32
400016b4:	00e7d733          	srl	a4,a5,a4
400016b8:	00000693          	li	a3,0
400016bc:	01058663          	beq	a1,a6,400016c8 <__divdf3+0x698>
400016c0:	43e50513          	addi	a0,a0,1086
400016c4:	00a796b3          	sll	a3,a5,a0
400016c8:	01f6e533          	or	a0,a3,t6
400016cc:	00a03533          	snez	a0,a0
400016d0:	00a76733          	or	a4,a4,a0
400016d4:	00000793          	li	a5,0
400016d8:	f8dff06f          	j	40001664 <__divdf3+0x634>
400016dc:	000807b7          	lui	a5,0x80
400016e0:	00000713          	li	a4,0
400016e4:	7ff00693          	li	a3,2047
400016e8:	00000613          	li	a2,0
400016ec:	e85ff06f          	j	40001570 <__divdf3+0x540>
400016f0:	00000793          	li	a5,0
400016f4:	00000713          	li	a4,0
400016f8:	7ff00693          	li	a3,2047
400016fc:	e75ff06f          	j	40001570 <__divdf3+0x540>
40001700:	00000793          	li	a5,0
40001704:	00000713          	li	a4,0
40001708:	00100693          	li	a3,1
4000170c:	e65ff06f          	j	40001570 <__divdf3+0x540>

40001710 <__muldf3>:
40001710:	fd010113          	addi	sp,sp,-48
40001714:	03212023          	sw	s2,32(sp)
40001718:	01512a23          	sw	s5,20(sp)
4000171c:	00100937          	lui	s2,0x100
40001720:	0145da93          	srli	s5,a1,0x14
40001724:	01312e23          	sw	s3,28(sp)
40001728:	01412c23          	sw	s4,24(sp)
4000172c:	01612823          	sw	s6,16(sp)
40001730:	01712623          	sw	s7,12(sp)
40001734:	fff90913          	addi	s2,s2,-1 # fffff <_stack_size+0xff7ff>
40001738:	02112623          	sw	ra,44(sp)
4000173c:	02812423          	sw	s0,40(sp)
40001740:	02912223          	sw	s1,36(sp)
40001744:	7ffafa93          	andi	s5,s5,2047
40001748:	00050b13          	mv	s6,a0
4000174c:	00060b93          	mv	s7,a2
40001750:	00068a13          	mv	s4,a3
40001754:	00b97933          	and	s2,s2,a1
40001758:	01f5d993          	srli	s3,a1,0x1f
4000175c:	0a0a8863          	beqz	s5,4000180c <__muldf3+0xfc>
40001760:	7ff00793          	li	a5,2047
40001764:	10fa8663          	beq	s5,a5,40001870 <__muldf3+0x160>
40001768:	00800437          	lui	s0,0x800
4000176c:	00391913          	slli	s2,s2,0x3
40001770:	00896933          	or	s2,s2,s0
40001774:	01d55413          	srli	s0,a0,0x1d
40001778:	01246433          	or	s0,s0,s2
4000177c:	00351493          	slli	s1,a0,0x3
40001780:	c01a8a93          	addi	s5,s5,-1023
40001784:	00000b13          	li	s6,0
40001788:	014a5513          	srli	a0,s4,0x14
4000178c:	00100937          	lui	s2,0x100
40001790:	fff90913          	addi	s2,s2,-1 # fffff <_stack_size+0xff7ff>
40001794:	7ff57513          	andi	a0,a0,2047
40001798:	01497933          	and	s2,s2,s4
4000179c:	000b8713          	mv	a4,s7
400017a0:	01fa5a13          	srli	s4,s4,0x1f
400017a4:	10050463          	beqz	a0,400018ac <__muldf3+0x19c>
400017a8:	7ff00793          	li	a5,2047
400017ac:	16f50463          	beq	a0,a5,40001914 <__muldf3+0x204>
400017b0:	008007b7          	lui	a5,0x800
400017b4:	00391913          	slli	s2,s2,0x3
400017b8:	00f96933          	or	s2,s2,a5
400017bc:	01dbd793          	srli	a5,s7,0x1d
400017c0:	0127e7b3          	or	a5,a5,s2
400017c4:	003b9713          	slli	a4,s7,0x3
400017c8:	c0150513          	addi	a0,a0,-1023
400017cc:	00000693          	li	a3,0
400017d0:	002b1593          	slli	a1,s6,0x2
400017d4:	00d5e5b3          	or	a1,a1,a3
400017d8:	00aa8533          	add	a0,s5,a0
400017dc:	fff58593          	addi	a1,a1,-1
400017e0:	00e00893          	li	a7,14
400017e4:	0149c633          	xor	a2,s3,s4
400017e8:	00150813          	addi	a6,a0,1
400017ec:	16b8e063          	bltu	a7,a1,4000194c <__muldf3+0x23c>
400017f0:	00002517          	auipc	a0,0x2
400017f4:	abc50513          	addi	a0,a0,-1348 # 400032ac <end+0x660>
400017f8:	00259593          	slli	a1,a1,0x2
400017fc:	00a585b3          	add	a1,a1,a0
40001800:	0005a583          	lw	a1,0(a1)
40001804:	00a585b3          	add	a1,a1,a0
40001808:	00058067          	jr	a1
4000180c:	00a96433          	or	s0,s2,a0
40001810:	06040e63          	beqz	s0,4000188c <__muldf3+0x17c>
40001814:	04090063          	beqz	s2,40001854 <__muldf3+0x144>
40001818:	00090513          	mv	a0,s2
4000181c:	3e4010ef          	jal	ra,40002c00 <__clzsi2>
40001820:	ff550793          	addi	a5,a0,-11
40001824:	01c00713          	li	a4,28
40001828:	02f74c63          	blt	a4,a5,40001860 <__muldf3+0x150>
4000182c:	01d00413          	li	s0,29
40001830:	ff850493          	addi	s1,a0,-8
40001834:	40f40433          	sub	s0,s0,a5
40001838:	00991933          	sll	s2,s2,s1
4000183c:	008b5433          	srl	s0,s6,s0
40001840:	01246433          	or	s0,s0,s2
40001844:	009b14b3          	sll	s1,s6,s1
40001848:	c0d00a93          	li	s5,-1011
4000184c:	40aa8ab3          	sub	s5,s5,a0
40001850:	f35ff06f          	j	40001784 <__muldf3+0x74>
40001854:	3ac010ef          	jal	ra,40002c00 <__clzsi2>
40001858:	02050513          	addi	a0,a0,32
4000185c:	fc5ff06f          	j	40001820 <__muldf3+0x110>
40001860:	fd850413          	addi	s0,a0,-40
40001864:	008b1433          	sll	s0,s6,s0
40001868:	00000493          	li	s1,0
4000186c:	fddff06f          	j	40001848 <__muldf3+0x138>
40001870:	00a96433          	or	s0,s2,a0
40001874:	02040463          	beqz	s0,4000189c <__muldf3+0x18c>
40001878:	00050493          	mv	s1,a0
4000187c:	00090413          	mv	s0,s2
40001880:	7ff00a93          	li	s5,2047
40001884:	00300b13          	li	s6,3
40001888:	f01ff06f          	j	40001788 <__muldf3+0x78>
4000188c:	00000493          	li	s1,0
40001890:	00000a93          	li	s5,0
40001894:	00100b13          	li	s6,1
40001898:	ef1ff06f          	j	40001788 <__muldf3+0x78>
4000189c:	00000493          	li	s1,0
400018a0:	7ff00a93          	li	s5,2047
400018a4:	00200b13          	li	s6,2
400018a8:	ee1ff06f          	j	40001788 <__muldf3+0x78>
400018ac:	017967b3          	or	a5,s2,s7
400018b0:	06078e63          	beqz	a5,4000192c <__muldf3+0x21c>
400018b4:	04090063          	beqz	s2,400018f4 <__muldf3+0x1e4>
400018b8:	00090513          	mv	a0,s2
400018bc:	344010ef          	jal	ra,40002c00 <__clzsi2>
400018c0:	ff550693          	addi	a3,a0,-11
400018c4:	01c00793          	li	a5,28
400018c8:	02d7ce63          	blt	a5,a3,40001904 <__muldf3+0x1f4>
400018cc:	01d00793          	li	a5,29
400018d0:	ff850713          	addi	a4,a0,-8
400018d4:	40d787b3          	sub	a5,a5,a3
400018d8:	00e91933          	sll	s2,s2,a4
400018dc:	00fbd7b3          	srl	a5,s7,a5
400018e0:	0127e7b3          	or	a5,a5,s2
400018e4:	00eb9733          	sll	a4,s7,a4
400018e8:	c0d00693          	li	a3,-1011
400018ec:	40a68533          	sub	a0,a3,a0
400018f0:	eddff06f          	j	400017cc <__muldf3+0xbc>
400018f4:	000b8513          	mv	a0,s7
400018f8:	308010ef          	jal	ra,40002c00 <__clzsi2>
400018fc:	02050513          	addi	a0,a0,32
40001900:	fc1ff06f          	j	400018c0 <__muldf3+0x1b0>
40001904:	fd850793          	addi	a5,a0,-40
40001908:	00fb97b3          	sll	a5,s7,a5
4000190c:	00000713          	li	a4,0
40001910:	fd9ff06f          	j	400018e8 <__muldf3+0x1d8>
40001914:	017967b3          	or	a5,s2,s7
40001918:	02078263          	beqz	a5,4000193c <__muldf3+0x22c>
4000191c:	00090793          	mv	a5,s2
40001920:	7ff00513          	li	a0,2047
40001924:	00300693          	li	a3,3
40001928:	ea9ff06f          	j	400017d0 <__muldf3+0xc0>
4000192c:	00000713          	li	a4,0
40001930:	00000513          	li	a0,0
40001934:	00100693          	li	a3,1
40001938:	e99ff06f          	j	400017d0 <__muldf3+0xc0>
4000193c:	00000713          	li	a4,0
40001940:	7ff00513          	li	a0,2047
40001944:	00200693          	li	a3,2
40001948:	e89ff06f          	j	400017d0 <__muldf3+0xc0>
4000194c:	00010fb7          	lui	t6,0x10
40001950:	ffff8f13          	addi	t5,t6,-1 # ffff <_stack_size+0xf7ff>
40001954:	0104d693          	srli	a3,s1,0x10
40001958:	01075313          	srli	t1,a4,0x10
4000195c:	01e4f4b3          	and	s1,s1,t5
40001960:	01e77733          	and	a4,a4,t5
40001964:	029308b3          	mul	a7,t1,s1
40001968:	029705b3          	mul	a1,a4,s1
4000196c:	02e682b3          	mul	t0,a3,a4
40001970:	00588e33          	add	t3,a7,t0
40001974:	0105d893          	srli	a7,a1,0x10
40001978:	01c888b3          	add	a7,a7,t3
4000197c:	02668eb3          	mul	t4,a3,t1
40001980:	0058f463          	bleu	t0,a7,40001988 <__muldf3+0x278>
40001984:	01fe8eb3          	add	t4,t4,t6
40001988:	0108d913          	srli	s2,a7,0x10
4000198c:	01e8f8b3          	and	a7,a7,t5
40001990:	0107df93          	srli	t6,a5,0x10
40001994:	01e5f5b3          	and	a1,a1,t5
40001998:	01e7f3b3          	and	t2,a5,t5
4000199c:	01089893          	slli	a7,a7,0x10
400019a0:	00b888b3          	add	a7,a7,a1
400019a4:	027687b3          	mul	a5,a3,t2
400019a8:	029385b3          	mul	a1,t2,s1
400019ac:	029f84b3          	mul	s1,t6,s1
400019b0:	00f48e33          	add	t3,s1,a5
400019b4:	0105d493          	srli	s1,a1,0x10
400019b8:	01c484b3          	add	s1,s1,t3
400019bc:	03f686b3          	mul	a3,a3,t6
400019c0:	00f4f663          	bleu	a5,s1,400019cc <__muldf3+0x2bc>
400019c4:	000107b7          	lui	a5,0x10
400019c8:	00f686b3          	add	a3,a3,a5
400019cc:	0104df13          	srli	t5,s1,0x10
400019d0:	000109b7          	lui	s3,0x10
400019d4:	00df0f33          	add	t5,t5,a3
400019d8:	fff98693          	addi	a3,s3,-1 # ffff <_stack_size+0xf7ff>
400019dc:	00d4f4b3          	and	s1,s1,a3
400019e0:	00d5f5b3          	and	a1,a1,a3
400019e4:	01045793          	srli	a5,s0,0x10
400019e8:	01049493          	slli	s1,s1,0x10
400019ec:	00d47433          	and	s0,s0,a3
400019f0:	00b484b3          	add	s1,s1,a1
400019f4:	028706b3          	mul	a3,a4,s0
400019f8:	00990933          	add	s2,s2,s1
400019fc:	02e78e33          	mul	t3,a5,a4
40001a00:	028305b3          	mul	a1,t1,s0
40001a04:	02f30733          	mul	a4,t1,a5
40001a08:	01c58333          	add	t1,a1,t3
40001a0c:	0106d593          	srli	a1,a3,0x10
40001a10:	006585b3          	add	a1,a1,t1
40001a14:	01c5f463          	bleu	t3,a1,40001a1c <__muldf3+0x30c>
40001a18:	01370733          	add	a4,a4,s3
40001a1c:	0105d313          	srli	t1,a1,0x10
40001a20:	000109b7          	lui	s3,0x10
40001a24:	00e302b3          	add	t0,t1,a4
40001a28:	fff98713          	addi	a4,s3,-1 # ffff <_stack_size+0xf7ff>
40001a2c:	00e5f5b3          	and	a1,a1,a4
40001a30:	00e6f6b3          	and	a3,a3,a4
40001a34:	02838333          	mul	t1,t2,s0
40001a38:	01059593          	slli	a1,a1,0x10
40001a3c:	00d585b3          	add	a1,a1,a3
40001a40:	02778733          	mul	a4,a5,t2
40001a44:	028f8433          	mul	s0,t6,s0
40001a48:	02ff8e33          	mul	t3,t6,a5
40001a4c:	00e40433          	add	s0,s0,a4
40001a50:	01035793          	srli	a5,t1,0x10
40001a54:	00878433          	add	s0,a5,s0
40001a58:	00e47463          	bleu	a4,s0,40001a60 <__muldf3+0x350>
40001a5c:	013e0e33          	add	t3,t3,s3
40001a60:	000107b7          	lui	a5,0x10
40001a64:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
40001a68:	00f476b3          	and	a3,s0,a5
40001a6c:	00f37333          	and	t1,t1,a5
40001a70:	01069693          	slli	a3,a3,0x10
40001a74:	012e8eb3          	add	t4,t4,s2
40001a78:	006686b3          	add	a3,a3,t1
40001a7c:	009eb4b3          	sltu	s1,t4,s1
40001a80:	01e686b3          	add	a3,a3,t5
40001a84:	009687b3          	add	a5,a3,s1
40001a88:	00be8eb3          	add	t4,t4,a1
40001a8c:	00beb5b3          	sltu	a1,t4,a1
40001a90:	00578333          	add	t1,a5,t0
40001a94:	00b30fb3          	add	t6,t1,a1
40001a98:	01e6b6b3          	sltu	a3,a3,t5
40001a9c:	0097b7b3          	sltu	a5,a5,s1
40001aa0:	00f6e7b3          	or	a5,a3,a5
40001aa4:	01045413          	srli	s0,s0,0x10
40001aa8:	00533333          	sltu	t1,t1,t0
40001aac:	00bfb5b3          	sltu	a1,t6,a1
40001ab0:	008787b3          	add	a5,a5,s0
40001ab4:	00b365b3          	or	a1,t1,a1
40001ab8:	00b787b3          	add	a5,a5,a1
40001abc:	01c787b3          	add	a5,a5,t3
40001ac0:	017fd713          	srli	a4,t6,0x17
40001ac4:	00979793          	slli	a5,a5,0x9
40001ac8:	00e7e7b3          	or	a5,a5,a4
40001acc:	009e9713          	slli	a4,t4,0x9
40001ad0:	01176733          	or	a4,a4,a7
40001ad4:	00e03733          	snez	a4,a4
40001ad8:	017ede93          	srli	t4,t4,0x17
40001adc:	009f9693          	slli	a3,t6,0x9
40001ae0:	01d76733          	or	a4,a4,t4
40001ae4:	00d76733          	or	a4,a4,a3
40001ae8:	00779693          	slli	a3,a5,0x7
40001aec:	1006da63          	bgez	a3,40001c00 <__muldf3+0x4f0>
40001af0:	00175693          	srli	a3,a4,0x1
40001af4:	00177713          	andi	a4,a4,1
40001af8:	00e6e733          	or	a4,a3,a4
40001afc:	01f79693          	slli	a3,a5,0x1f
40001b00:	00d76733          	or	a4,a4,a3
40001b04:	0017d793          	srli	a5,a5,0x1
40001b08:	3ff80593          	addi	a1,a6,1023
40001b0c:	0eb05e63          	blez	a1,40001c08 <__muldf3+0x4f8>
40001b10:	00777693          	andi	a3,a4,7
40001b14:	02068063          	beqz	a3,40001b34 <__muldf3+0x424>
40001b18:	00f77693          	andi	a3,a4,15
40001b1c:	00400513          	li	a0,4
40001b20:	00a68a63          	beq	a3,a0,40001b34 <__muldf3+0x424>
40001b24:	00470693          	addi	a3,a4,4
40001b28:	00e6b733          	sltu	a4,a3,a4
40001b2c:	00e787b3          	add	a5,a5,a4
40001b30:	00068713          	mv	a4,a3
40001b34:	00779693          	slli	a3,a5,0x7
40001b38:	0006da63          	bgez	a3,40001b4c <__muldf3+0x43c>
40001b3c:	ff0006b7          	lui	a3,0xff000
40001b40:	fff68693          	addi	a3,a3,-1 # feffffff <_stack_start+0x7efff6bf>
40001b44:	00d7f7b3          	and	a5,a5,a3
40001b48:	40080593          	addi	a1,a6,1024
40001b4c:	7fe00693          	li	a3,2046
40001b50:	16b6ce63          	blt	a3,a1,40001ccc <__muldf3+0x5bc>
40001b54:	00375693          	srli	a3,a4,0x3
40001b58:	01d79713          	slli	a4,a5,0x1d
40001b5c:	00d76733          	or	a4,a4,a3
40001b60:	0037d793          	srli	a5,a5,0x3
40001b64:	001006b7          	lui	a3,0x100
40001b68:	fff68693          	addi	a3,a3,-1 # fffff <_stack_size+0xff7ff>
40001b6c:	00d7f7b3          	and	a5,a5,a3
40001b70:	7ff5f693          	andi	a3,a1,2047
40001b74:	801005b7          	lui	a1,0x80100
40001b78:	fff58593          	addi	a1,a1,-1 # 800fffff <_stack_start+0xff6bf>
40001b7c:	01469693          	slli	a3,a3,0x14
40001b80:	00b7f7b3          	and	a5,a5,a1
40001b84:	02c12083          	lw	ra,44(sp)
40001b88:	02812403          	lw	s0,40(sp)
40001b8c:	01f61613          	slli	a2,a2,0x1f
40001b90:	00d7e7b3          	or	a5,a5,a3
40001b94:	00c7e6b3          	or	a3,a5,a2
40001b98:	02412483          	lw	s1,36(sp)
40001b9c:	02012903          	lw	s2,32(sp)
40001ba0:	01c12983          	lw	s3,28(sp)
40001ba4:	01812a03          	lw	s4,24(sp)
40001ba8:	01412a83          	lw	s5,20(sp)
40001bac:	01012b03          	lw	s6,16(sp)
40001bb0:	00c12b83          	lw	s7,12(sp)
40001bb4:	00070513          	mv	a0,a4
40001bb8:	00068593          	mv	a1,a3
40001bbc:	03010113          	addi	sp,sp,48
40001bc0:	00008067          	ret
40001bc4:	00098613          	mv	a2,s3
40001bc8:	00040793          	mv	a5,s0
40001bcc:	00048713          	mv	a4,s1
40001bd0:	000b0693          	mv	a3,s6
40001bd4:	00200593          	li	a1,2
40001bd8:	0eb68a63          	beq	a3,a1,40001ccc <__muldf3+0x5bc>
40001bdc:	00300593          	li	a1,3
40001be0:	0cb68c63          	beq	a3,a1,40001cb8 <__muldf3+0x5a8>
40001be4:	00100593          	li	a1,1
40001be8:	f2b690e3          	bne	a3,a1,40001b08 <__muldf3+0x3f8>
40001bec:	00000793          	li	a5,0
40001bf0:	00000713          	li	a4,0
40001bf4:	0880006f          	j	40001c7c <__muldf3+0x56c>
40001bf8:	000a0613          	mv	a2,s4
40001bfc:	fd9ff06f          	j	40001bd4 <__muldf3+0x4c4>
40001c00:	00050813          	mv	a6,a0
40001c04:	f05ff06f          	j	40001b08 <__muldf3+0x3f8>
40001c08:	00100513          	li	a0,1
40001c0c:	40b50533          	sub	a0,a0,a1
40001c10:	03800693          	li	a3,56
40001c14:	fca6cce3          	blt	a3,a0,40001bec <__muldf3+0x4dc>
40001c18:	01f00693          	li	a3,31
40001c1c:	06a6c463          	blt	a3,a0,40001c84 <__muldf3+0x574>
40001c20:	41e80813          	addi	a6,a6,1054
40001c24:	010796b3          	sll	a3,a5,a6
40001c28:	00a755b3          	srl	a1,a4,a0
40001c2c:	01071733          	sll	a4,a4,a6
40001c30:	00b6e6b3          	or	a3,a3,a1
40001c34:	00e03733          	snez	a4,a4
40001c38:	00e6e733          	or	a4,a3,a4
40001c3c:	00a7d7b3          	srl	a5,a5,a0
40001c40:	00777693          	andi	a3,a4,7
40001c44:	02068063          	beqz	a3,40001c64 <__muldf3+0x554>
40001c48:	00f77693          	andi	a3,a4,15
40001c4c:	00400593          	li	a1,4
40001c50:	00b68a63          	beq	a3,a1,40001c64 <__muldf3+0x554>
40001c54:	00470693          	addi	a3,a4,4
40001c58:	00e6b733          	sltu	a4,a3,a4
40001c5c:	00e787b3          	add	a5,a5,a4
40001c60:	00068713          	mv	a4,a3
40001c64:	00879693          	slli	a3,a5,0x8
40001c68:	0606ca63          	bltz	a3,40001cdc <__muldf3+0x5cc>
40001c6c:	01d79693          	slli	a3,a5,0x1d
40001c70:	00375713          	srli	a4,a4,0x3
40001c74:	00e6e733          	or	a4,a3,a4
40001c78:	0037d793          	srli	a5,a5,0x3
40001c7c:	00000593          	li	a1,0
40001c80:	ee5ff06f          	j	40001b64 <__muldf3+0x454>
40001c84:	fe100693          	li	a3,-31
40001c88:	40b686b3          	sub	a3,a3,a1
40001c8c:	02000893          	li	a7,32
40001c90:	00d7d6b3          	srl	a3,a5,a3
40001c94:	00000593          	li	a1,0
40001c98:	01150663          	beq	a0,a7,40001ca4 <__muldf3+0x594>
40001c9c:	43e80813          	addi	a6,a6,1086
40001ca0:	010795b3          	sll	a1,a5,a6
40001ca4:	00e5e733          	or	a4,a1,a4
40001ca8:	00e03733          	snez	a4,a4
40001cac:	00e6e733          	or	a4,a3,a4
40001cb0:	00000793          	li	a5,0
40001cb4:	f8dff06f          	j	40001c40 <__muldf3+0x530>
40001cb8:	000807b7          	lui	a5,0x80
40001cbc:	00000713          	li	a4,0
40001cc0:	7ff00593          	li	a1,2047
40001cc4:	00000613          	li	a2,0
40001cc8:	e9dff06f          	j	40001b64 <__muldf3+0x454>
40001ccc:	00000793          	li	a5,0
40001cd0:	00000713          	li	a4,0
40001cd4:	7ff00593          	li	a1,2047
40001cd8:	e8dff06f          	j	40001b64 <__muldf3+0x454>
40001cdc:	00000793          	li	a5,0
40001ce0:	00000713          	li	a4,0
40001ce4:	00100593          	li	a1,1
40001ce8:	e7dff06f          	j	40001b64 <__muldf3+0x454>

40001cec <__divsf3>:
40001cec:	fe010113          	addi	sp,sp,-32
40001cf0:	00912a23          	sw	s1,20(sp)
40001cf4:	01312623          	sw	s3,12(sp)
40001cf8:	01755493          	srli	s1,a0,0x17
40001cfc:	008009b7          	lui	s3,0x800
40001d00:	01212823          	sw	s2,16(sp)
40001d04:	01412423          	sw	s4,8(sp)
40001d08:	fff98993          	addi	s3,s3,-1 # 7fffff <_stack_size+0x7ff7ff>
40001d0c:	00112e23          	sw	ra,28(sp)
40001d10:	00812c23          	sw	s0,24(sp)
40001d14:	01512223          	sw	s5,4(sp)
40001d18:	0ff4f493          	andi	s1,s1,255
40001d1c:	00058a13          	mv	s4,a1
40001d20:	00a9f9b3          	and	s3,s3,a0
40001d24:	01f55913          	srli	s2,a0,0x1f
40001d28:	08048863          	beqz	s1,40001db8 <__divsf3+0xcc>
40001d2c:	0ff00793          	li	a5,255
40001d30:	0af48463          	beq	s1,a5,40001dd8 <__divsf3+0xec>
40001d34:	00399993          	slli	s3,s3,0x3
40001d38:	040007b7          	lui	a5,0x4000
40001d3c:	00f9e9b3          	or	s3,s3,a5
40001d40:	f8148493          	addi	s1,s1,-127
40001d44:	00000a93          	li	s5,0
40001d48:	017a5513          	srli	a0,s4,0x17
40001d4c:	00800437          	lui	s0,0x800
40001d50:	fff40413          	addi	s0,s0,-1 # 7fffff <_stack_size+0x7ff7ff>
40001d54:	0ff57513          	andi	a0,a0,255
40001d58:	01447433          	and	s0,s0,s4
40001d5c:	01fa5a13          	srli	s4,s4,0x1f
40001d60:	08050c63          	beqz	a0,40001df8 <__divsf3+0x10c>
40001d64:	0ff00793          	li	a5,255
40001d68:	0af50863          	beq	a0,a5,40001e18 <__divsf3+0x12c>
40001d6c:	00341413          	slli	s0,s0,0x3
40001d70:	040007b7          	lui	a5,0x4000
40001d74:	00f46433          	or	s0,s0,a5
40001d78:	f8150513          	addi	a0,a0,-127
40001d7c:	00000793          	li	a5,0
40001d80:	002a9693          	slli	a3,s5,0x2
40001d84:	00f6e6b3          	or	a3,a3,a5
40001d88:	fff68693          	addi	a3,a3,-1
40001d8c:	00e00713          	li	a4,14
40001d90:	01494633          	xor	a2,s2,s4
40001d94:	40a48533          	sub	a0,s1,a0
40001d98:	0ad76063          	bltu	a4,a3,40001e38 <__divsf3+0x14c>
40001d9c:	00001597          	auipc	a1,0x1
40001da0:	54c58593          	addi	a1,a1,1356 # 400032e8 <end+0x69c>
40001da4:	00269693          	slli	a3,a3,0x2
40001da8:	00b686b3          	add	a3,a3,a1
40001dac:	0006a703          	lw	a4,0(a3)
40001db0:	00b70733          	add	a4,a4,a1
40001db4:	00070067          	jr	a4
40001db8:	02098a63          	beqz	s3,40001dec <__divsf3+0x100>
40001dbc:	00098513          	mv	a0,s3
40001dc0:	641000ef          	jal	ra,40002c00 <__clzsi2>
40001dc4:	ffb50793          	addi	a5,a0,-5
40001dc8:	f8a00493          	li	s1,-118
40001dcc:	00f999b3          	sll	s3,s3,a5
40001dd0:	40a484b3          	sub	s1,s1,a0
40001dd4:	f71ff06f          	j	40001d44 <__divsf3+0x58>
40001dd8:	0ff00493          	li	s1,255
40001ddc:	00200a93          	li	s5,2
40001de0:	f60984e3          	beqz	s3,40001d48 <__divsf3+0x5c>
40001de4:	00300a93          	li	s5,3
40001de8:	f61ff06f          	j	40001d48 <__divsf3+0x5c>
40001dec:	00000493          	li	s1,0
40001df0:	00100a93          	li	s5,1
40001df4:	f55ff06f          	j	40001d48 <__divsf3+0x5c>
40001df8:	02040a63          	beqz	s0,40001e2c <__divsf3+0x140>
40001dfc:	00040513          	mv	a0,s0
40001e00:	601000ef          	jal	ra,40002c00 <__clzsi2>
40001e04:	ffb50793          	addi	a5,a0,-5
40001e08:	00f41433          	sll	s0,s0,a5
40001e0c:	f8a00793          	li	a5,-118
40001e10:	40a78533          	sub	a0,a5,a0
40001e14:	f69ff06f          	j	40001d7c <__divsf3+0x90>
40001e18:	0ff00513          	li	a0,255
40001e1c:	00200793          	li	a5,2
40001e20:	f60400e3          	beqz	s0,40001d80 <__divsf3+0x94>
40001e24:	00300793          	li	a5,3
40001e28:	f59ff06f          	j	40001d80 <__divsf3+0x94>
40001e2c:	00000513          	li	a0,0
40001e30:	00100793          	li	a5,1
40001e34:	f4dff06f          	j	40001d80 <__divsf3+0x94>
40001e38:	00541813          	slli	a6,s0,0x5
40001e3c:	0e89f663          	bleu	s0,s3,40001f28 <__divsf3+0x23c>
40001e40:	fff50513          	addi	a0,a0,-1
40001e44:	00000693          	li	a3,0
40001e48:	01085413          	srli	s0,a6,0x10
40001e4c:	0289d333          	divu	t1,s3,s0
40001e50:	000107b7          	lui	a5,0x10
40001e54:	fff78793          	addi	a5,a5,-1 # ffff <_stack_size+0xf7ff>
40001e58:	00f877b3          	and	a5,a6,a5
40001e5c:	0106d693          	srli	a3,a3,0x10
40001e60:	0289f733          	remu	a4,s3,s0
40001e64:	00030593          	mv	a1,t1
40001e68:	026788b3          	mul	a7,a5,t1
40001e6c:	01071713          	slli	a4,a4,0x10
40001e70:	00e6e733          	or	a4,a3,a4
40001e74:	01177e63          	bleu	a7,a4,40001e90 <__divsf3+0x1a4>
40001e78:	01070733          	add	a4,a4,a6
40001e7c:	fff30593          	addi	a1,t1,-1
40001e80:	01076863          	bltu	a4,a6,40001e90 <__divsf3+0x1a4>
40001e84:	01177663          	bleu	a7,a4,40001e90 <__divsf3+0x1a4>
40001e88:	ffe30593          	addi	a1,t1,-2
40001e8c:	01070733          	add	a4,a4,a6
40001e90:	41170733          	sub	a4,a4,a7
40001e94:	028758b3          	divu	a7,a4,s0
40001e98:	02877733          	remu	a4,a4,s0
40001e9c:	031786b3          	mul	a3,a5,a7
40001ea0:	01071793          	slli	a5,a4,0x10
40001ea4:	00088713          	mv	a4,a7
40001ea8:	00d7fe63          	bleu	a3,a5,40001ec4 <__divsf3+0x1d8>
40001eac:	010787b3          	add	a5,a5,a6
40001eb0:	fff88713          	addi	a4,a7,-1
40001eb4:	0107e863          	bltu	a5,a6,40001ec4 <__divsf3+0x1d8>
40001eb8:	00d7f663          	bleu	a3,a5,40001ec4 <__divsf3+0x1d8>
40001ebc:	ffe88713          	addi	a4,a7,-2
40001ec0:	010787b3          	add	a5,a5,a6
40001ec4:	01059413          	slli	s0,a1,0x10
40001ec8:	40d787b3          	sub	a5,a5,a3
40001ecc:	00e46433          	or	s0,s0,a4
40001ed0:	00f037b3          	snez	a5,a5
40001ed4:	00f46433          	or	s0,s0,a5
40001ed8:	07f50713          	addi	a4,a0,127
40001edc:	0ae05063          	blez	a4,40001f7c <__divsf3+0x290>
40001ee0:	00747793          	andi	a5,s0,7
40001ee4:	00078a63          	beqz	a5,40001ef8 <__divsf3+0x20c>
40001ee8:	00f47793          	andi	a5,s0,15
40001eec:	00400693          	li	a3,4
40001ef0:	00d78463          	beq	a5,a3,40001ef8 <__divsf3+0x20c>
40001ef4:	00440413          	addi	s0,s0,4
40001ef8:	00441793          	slli	a5,s0,0x4
40001efc:	0007da63          	bgez	a5,40001f10 <__divsf3+0x224>
40001f00:	f80007b7          	lui	a5,0xf8000
40001f04:	fff78793          	addi	a5,a5,-1 # f7ffffff <_stack_start+0x77fff6bf>
40001f08:	00f47433          	and	s0,s0,a5
40001f0c:	08050713          	addi	a4,a0,128
40001f10:	0fe00793          	li	a5,254
40001f14:	00345413          	srli	s0,s0,0x3
40001f18:	0ce7d263          	ble	a4,a5,40001fdc <__divsf3+0x2f0>
40001f1c:	00000413          	li	s0,0
40001f20:	0ff00713          	li	a4,255
40001f24:	0b80006f          	j	40001fdc <__divsf3+0x2f0>
40001f28:	01f99693          	slli	a3,s3,0x1f
40001f2c:	0019d993          	srli	s3,s3,0x1
40001f30:	f19ff06f          	j	40001e48 <__divsf3+0x15c>
40001f34:	00090613          	mv	a2,s2
40001f38:	00098413          	mv	s0,s3
40001f3c:	000a8793          	mv	a5,s5
40001f40:	00200713          	li	a4,2
40001f44:	fce78ce3          	beq	a5,a4,40001f1c <__divsf3+0x230>
40001f48:	00300713          	li	a4,3
40001f4c:	08e78263          	beq	a5,a4,40001fd0 <__divsf3+0x2e4>
40001f50:	00100713          	li	a4,1
40001f54:	f8e792e3          	bne	a5,a4,40001ed8 <__divsf3+0x1ec>
40001f58:	00000413          	li	s0,0
40001f5c:	00000713          	li	a4,0
40001f60:	07c0006f          	j	40001fdc <__divsf3+0x2f0>
40001f64:	000a0613          	mv	a2,s4
40001f68:	fd9ff06f          	j	40001f40 <__divsf3+0x254>
40001f6c:	00400437          	lui	s0,0x400
40001f70:	00000613          	li	a2,0
40001f74:	00300793          	li	a5,3
40001f78:	fc9ff06f          	j	40001f40 <__divsf3+0x254>
40001f7c:	00100793          	li	a5,1
40001f80:	40e787b3          	sub	a5,a5,a4
40001f84:	01b00713          	li	a4,27
40001f88:	fcf748e3          	blt	a4,a5,40001f58 <__divsf3+0x26c>
40001f8c:	09e50513          	addi	a0,a0,158
40001f90:	00f457b3          	srl	a5,s0,a5
40001f94:	00a41433          	sll	s0,s0,a0
40001f98:	00803433          	snez	s0,s0
40001f9c:	0087e433          	or	s0,a5,s0
40001fa0:	00747793          	andi	a5,s0,7
40001fa4:	00078a63          	beqz	a5,40001fb8 <__divsf3+0x2cc>
40001fa8:	00f47793          	andi	a5,s0,15
40001fac:	00400713          	li	a4,4
40001fb0:	00e78463          	beq	a5,a4,40001fb8 <__divsf3+0x2cc>
40001fb4:	00440413          	addi	s0,s0,4 # 400004 <_stack_size+0x3ff804>
40001fb8:	00541793          	slli	a5,s0,0x5
40001fbc:	00345413          	srli	s0,s0,0x3
40001fc0:	f807dee3          	bgez	a5,40001f5c <__divsf3+0x270>
40001fc4:	00000413          	li	s0,0
40001fc8:	00100713          	li	a4,1
40001fcc:	0100006f          	j	40001fdc <__divsf3+0x2f0>
40001fd0:	00400437          	lui	s0,0x400
40001fd4:	0ff00713          	li	a4,255
40001fd8:	00000613          	li	a2,0
40001fdc:	00800537          	lui	a0,0x800
40001fe0:	fff50513          	addi	a0,a0,-1 # 7fffff <_stack_size+0x7ff7ff>
40001fe4:	00a47433          	and	s0,s0,a0
40001fe8:	80800537          	lui	a0,0x80800
40001fec:	fff50513          	addi	a0,a0,-1 # 807fffff <_stack_start+0x7ff6bf>
40001ff0:	0ff77713          	andi	a4,a4,255
40001ff4:	00a47433          	and	s0,s0,a0
40001ff8:	01771713          	slli	a4,a4,0x17
40001ffc:	00e46433          	or	s0,s0,a4
40002000:	01f61513          	slli	a0,a2,0x1f
40002004:	00a46533          	or	a0,s0,a0
40002008:	01c12083          	lw	ra,28(sp)
4000200c:	01812403          	lw	s0,24(sp)
40002010:	01412483          	lw	s1,20(sp)
40002014:	01012903          	lw	s2,16(sp)
40002018:	00c12983          	lw	s3,12(sp)
4000201c:	00812a03          	lw	s4,8(sp)
40002020:	00412a83          	lw	s5,4(sp)
40002024:	02010113          	addi	sp,sp,32
40002028:	00008067          	ret

4000202c <__mulsf3>:
4000202c:	fe010113          	addi	sp,sp,-32
40002030:	00912a23          	sw	s1,20(sp)
40002034:	01212823          	sw	s2,16(sp)
40002038:	008004b7          	lui	s1,0x800
4000203c:	01755913          	srli	s2,a0,0x17
40002040:	01312623          	sw	s3,12(sp)
40002044:	01512223          	sw	s5,4(sp)
40002048:	fff48493          	addi	s1,s1,-1 # 7fffff <_stack_size+0x7ff7ff>
4000204c:	00112e23          	sw	ra,28(sp)
40002050:	00812c23          	sw	s0,24(sp)
40002054:	01412423          	sw	s4,8(sp)
40002058:	0ff97913          	andi	s2,s2,255
4000205c:	00058a93          	mv	s5,a1
40002060:	00a4f4b3          	and	s1,s1,a0
40002064:	01f55993          	srli	s3,a0,0x1f
40002068:	08090a63          	beqz	s2,400020fc <__mulsf3+0xd0>
4000206c:	0ff00793          	li	a5,255
40002070:	0af90663          	beq	s2,a5,4000211c <__mulsf3+0xf0>
40002074:	00349493          	slli	s1,s1,0x3
40002078:	040007b7          	lui	a5,0x4000
4000207c:	00f4e4b3          	or	s1,s1,a5
40002080:	f8190913          	addi	s2,s2,-127
40002084:	00000a13          	li	s4,0
40002088:	017ad513          	srli	a0,s5,0x17
4000208c:	00800437          	lui	s0,0x800
40002090:	fff40413          	addi	s0,s0,-1 # 7fffff <_stack_size+0x7ff7ff>
40002094:	0ff57513          	andi	a0,a0,255
40002098:	01547433          	and	s0,s0,s5
4000209c:	01fada93          	srli	s5,s5,0x1f
400020a0:	08050e63          	beqz	a0,4000213c <__mulsf3+0x110>
400020a4:	0ff00793          	li	a5,255
400020a8:	0af50a63          	beq	a0,a5,4000215c <__mulsf3+0x130>
400020ac:	00341413          	slli	s0,s0,0x3
400020b0:	040007b7          	lui	a5,0x4000
400020b4:	00f46433          	or	s0,s0,a5
400020b8:	f8150513          	addi	a0,a0,-127
400020bc:	00000693          	li	a3,0
400020c0:	002a1793          	slli	a5,s4,0x2
400020c4:	00d7e7b3          	or	a5,a5,a3
400020c8:	00a90533          	add	a0,s2,a0
400020cc:	fff78793          	addi	a5,a5,-1 # 3ffffff <_stack_size+0x3fff7ff>
400020d0:	00e00713          	li	a4,14
400020d4:	0159c633          	xor	a2,s3,s5
400020d8:	00150813          	addi	a6,a0,1
400020dc:	0af76063          	bltu	a4,a5,4000217c <__mulsf3+0x150>
400020e0:	00001717          	auipc	a4,0x1
400020e4:	24470713          	addi	a4,a4,580 # 40003324 <end+0x6d8>
400020e8:	00279793          	slli	a5,a5,0x2
400020ec:	00e787b3          	add	a5,a5,a4
400020f0:	0007a783          	lw	a5,0(a5)
400020f4:	00e787b3          	add	a5,a5,a4
400020f8:	00078067          	jr	a5
400020fc:	02048a63          	beqz	s1,40002130 <__mulsf3+0x104>
40002100:	00048513          	mv	a0,s1
40002104:	2fd000ef          	jal	ra,40002c00 <__clzsi2>
40002108:	ffb50793          	addi	a5,a0,-5
4000210c:	f8a00913          	li	s2,-118
40002110:	00f494b3          	sll	s1,s1,a5
40002114:	40a90933          	sub	s2,s2,a0
40002118:	f6dff06f          	j	40002084 <__mulsf3+0x58>
4000211c:	0ff00913          	li	s2,255
40002120:	00200a13          	li	s4,2
40002124:	f60482e3          	beqz	s1,40002088 <__mulsf3+0x5c>
40002128:	00300a13          	li	s4,3
4000212c:	f5dff06f          	j	40002088 <__mulsf3+0x5c>
40002130:	00000913          	li	s2,0
40002134:	00100a13          	li	s4,1
40002138:	f51ff06f          	j	40002088 <__mulsf3+0x5c>
4000213c:	02040a63          	beqz	s0,40002170 <__mulsf3+0x144>
40002140:	00040513          	mv	a0,s0
40002144:	2bd000ef          	jal	ra,40002c00 <__clzsi2>
40002148:	ffb50793          	addi	a5,a0,-5
4000214c:	00f41433          	sll	s0,s0,a5
40002150:	f8a00793          	li	a5,-118
40002154:	40a78533          	sub	a0,a5,a0
40002158:	f65ff06f          	j	400020bc <__mulsf3+0x90>
4000215c:	0ff00513          	li	a0,255
40002160:	00200693          	li	a3,2
40002164:	f4040ee3          	beqz	s0,400020c0 <__mulsf3+0x94>
40002168:	00300693          	li	a3,3
4000216c:	f55ff06f          	j	400020c0 <__mulsf3+0x94>
40002170:	00000513          	li	a0,0
40002174:	00100693          	li	a3,1
40002178:	f49ff06f          	j	400020c0 <__mulsf3+0x94>
4000217c:	000107b7          	lui	a5,0x10
40002180:	fff78313          	addi	t1,a5,-1 # ffff <_stack_size+0xf7ff>
40002184:	0104d713          	srli	a4,s1,0x10
40002188:	01045693          	srli	a3,s0,0x10
4000218c:	0064f4b3          	and	s1,s1,t1
40002190:	00647433          	and	s0,s0,t1
40002194:	028488b3          	mul	a7,s1,s0
40002198:	028705b3          	mul	a1,a4,s0
4000219c:	02d70433          	mul	s0,a4,a3
400021a0:	029686b3          	mul	a3,a3,s1
400021a4:	0108d493          	srli	s1,a7,0x10
400021a8:	00b686b3          	add	a3,a3,a1
400021ac:	00d484b3          	add	s1,s1,a3
400021b0:	00b4f463          	bleu	a1,s1,400021b8 <__mulsf3+0x18c>
400021b4:	00f40433          	add	s0,s0,a5
400021b8:	0064f7b3          	and	a5,s1,t1
400021bc:	01079793          	slli	a5,a5,0x10
400021c0:	0068f8b3          	and	a7,a7,t1
400021c4:	011787b3          	add	a5,a5,a7
400021c8:	00679713          	slli	a4,a5,0x6
400021cc:	0104d493          	srli	s1,s1,0x10
400021d0:	00e03733          	snez	a4,a4
400021d4:	01a7d793          	srli	a5,a5,0x1a
400021d8:	00848433          	add	s0,s1,s0
400021dc:	00f767b3          	or	a5,a4,a5
400021e0:	00641413          	slli	s0,s0,0x6
400021e4:	00f46433          	or	s0,s0,a5
400021e8:	00441793          	slli	a5,s0,0x4
400021ec:	0c07de63          	bgez	a5,400022c8 <__mulsf3+0x29c>
400021f0:	00145793          	srli	a5,s0,0x1
400021f4:	00147413          	andi	s0,s0,1
400021f8:	0087e433          	or	s0,a5,s0
400021fc:	07f80713          	addi	a4,a6,127
40002200:	0ce05863          	blez	a4,400022d0 <__mulsf3+0x2a4>
40002204:	00747793          	andi	a5,s0,7
40002208:	00078a63          	beqz	a5,4000221c <__mulsf3+0x1f0>
4000220c:	00f47793          	andi	a5,s0,15
40002210:	00400693          	li	a3,4
40002214:	00d78463          	beq	a5,a3,4000221c <__mulsf3+0x1f0>
40002218:	00440413          	addi	s0,s0,4
4000221c:	00441793          	slli	a5,s0,0x4
40002220:	0007da63          	bgez	a5,40002234 <__mulsf3+0x208>
40002224:	f80007b7          	lui	a5,0xf8000
40002228:	fff78793          	addi	a5,a5,-1 # f7ffffff <_stack_start+0x77fff6bf>
4000222c:	00f47433          	and	s0,s0,a5
40002230:	08080713          	addi	a4,a6,128
40002234:	0fe00793          	li	a5,254
40002238:	0ee7cc63          	blt	a5,a4,40002330 <__mulsf3+0x304>
4000223c:	00345793          	srli	a5,s0,0x3
40002240:	0300006f          	j	40002270 <__mulsf3+0x244>
40002244:	00098613          	mv	a2,s3
40002248:	00048413          	mv	s0,s1
4000224c:	000a0693          	mv	a3,s4
40002250:	00200793          	li	a5,2
40002254:	0cf68e63          	beq	a3,a5,40002330 <__mulsf3+0x304>
40002258:	00300793          	li	a5,3
4000225c:	0cf68263          	beq	a3,a5,40002320 <__mulsf3+0x2f4>
40002260:	00100593          	li	a1,1
40002264:	00000793          	li	a5,0
40002268:	00000713          	li	a4,0
4000226c:	f8b698e3          	bne	a3,a1,400021fc <__mulsf3+0x1d0>
40002270:	00800437          	lui	s0,0x800
40002274:	fff40413          	addi	s0,s0,-1 # 7fffff <_stack_size+0x7ff7ff>
40002278:	80800537          	lui	a0,0x80800
4000227c:	0087f7b3          	and	a5,a5,s0
40002280:	fff50513          	addi	a0,a0,-1 # 807fffff <_stack_start+0x7ff6bf>
40002284:	01c12083          	lw	ra,28(sp)
40002288:	01812403          	lw	s0,24(sp)
4000228c:	0ff77713          	andi	a4,a4,255
40002290:	00a7f7b3          	and	a5,a5,a0
40002294:	01771713          	slli	a4,a4,0x17
40002298:	01f61513          	slli	a0,a2,0x1f
4000229c:	00e7e7b3          	or	a5,a5,a4
400022a0:	01412483          	lw	s1,20(sp)
400022a4:	01012903          	lw	s2,16(sp)
400022a8:	00c12983          	lw	s3,12(sp)
400022ac:	00812a03          	lw	s4,8(sp)
400022b0:	00412a83          	lw	s5,4(sp)
400022b4:	00a7e533          	or	a0,a5,a0
400022b8:	02010113          	addi	sp,sp,32
400022bc:	00008067          	ret
400022c0:	000a8613          	mv	a2,s5
400022c4:	f8dff06f          	j	40002250 <__mulsf3+0x224>
400022c8:	00050813          	mv	a6,a0
400022cc:	f31ff06f          	j	400021fc <__mulsf3+0x1d0>
400022d0:	00100793          	li	a5,1
400022d4:	40e787b3          	sub	a5,a5,a4
400022d8:	01b00713          	li	a4,27
400022dc:	06f74063          	blt	a4,a5,4000233c <__mulsf3+0x310>
400022e0:	09e80813          	addi	a6,a6,158
400022e4:	00f457b3          	srl	a5,s0,a5
400022e8:	01041433          	sll	s0,s0,a6
400022ec:	00803433          	snez	s0,s0
400022f0:	0087e433          	or	s0,a5,s0
400022f4:	00747793          	andi	a5,s0,7
400022f8:	00078a63          	beqz	a5,4000230c <__mulsf3+0x2e0>
400022fc:	00f47793          	andi	a5,s0,15
40002300:	00400713          	li	a4,4
40002304:	00e78463          	beq	a5,a4,4000230c <__mulsf3+0x2e0>
40002308:	00440413          	addi	s0,s0,4
4000230c:	00541793          	slli	a5,s0,0x5
40002310:	0207ca63          	bltz	a5,40002344 <__mulsf3+0x318>
40002314:	00345793          	srli	a5,s0,0x3
40002318:	00000713          	li	a4,0
4000231c:	f55ff06f          	j	40002270 <__mulsf3+0x244>
40002320:	004007b7          	lui	a5,0x400
40002324:	0ff00713          	li	a4,255
40002328:	00000613          	li	a2,0
4000232c:	f45ff06f          	j	40002270 <__mulsf3+0x244>
40002330:	00000793          	li	a5,0
40002334:	0ff00713          	li	a4,255
40002338:	f39ff06f          	j	40002270 <__mulsf3+0x244>
4000233c:	00000793          	li	a5,0
40002340:	fd9ff06f          	j	40002318 <__mulsf3+0x2ec>
40002344:	00000793          	li	a5,0
40002348:	00100713          	li	a4,1
4000234c:	f25ff06f          	j	40002270 <__mulsf3+0x244>

40002350 <__subsf3>:
40002350:	008007b7          	lui	a5,0x800
40002354:	fff78793          	addi	a5,a5,-1 # 7fffff <_stack_size+0x7ff7ff>
40002358:	ff010113          	addi	sp,sp,-16
4000235c:	00a7f733          	and	a4,a5,a0
40002360:	01755693          	srli	a3,a0,0x17
40002364:	0175d613          	srli	a2,a1,0x17
40002368:	00b7f7b3          	and	a5,a5,a1
4000236c:	00912223          	sw	s1,4(sp)
40002370:	01212023          	sw	s2,0(sp)
40002374:	0ff6f693          	andi	a3,a3,255
40002378:	00371813          	slli	a6,a4,0x3
4000237c:	0ff67613          	andi	a2,a2,255
40002380:	00112623          	sw	ra,12(sp)
40002384:	00812423          	sw	s0,8(sp)
40002388:	0ff00713          	li	a4,255
4000238c:	01f55493          	srli	s1,a0,0x1f
40002390:	00068913          	mv	s2,a3
40002394:	00060513          	mv	a0,a2
40002398:	01f5d593          	srli	a1,a1,0x1f
4000239c:	00379793          	slli	a5,a5,0x3
400023a0:	00e61463          	bne	a2,a4,400023a8 <__subsf3+0x58>
400023a4:	00079463          	bnez	a5,400023ac <__subsf3+0x5c>
400023a8:	0015c593          	xori	a1,a1,1
400023ac:	40c68733          	sub	a4,a3,a2
400023b0:	1a959a63          	bne	a1,s1,40002564 <__subsf3+0x214>
400023b4:	0ae05663          	blez	a4,40002460 <__subsf3+0x110>
400023b8:	06061663          	bnez	a2,40002424 <__subsf3+0xd4>
400023bc:	00079c63          	bnez	a5,400023d4 <__subsf3+0x84>
400023c0:	0ff00793          	li	a5,255
400023c4:	04f68c63          	beq	a3,a5,4000241c <__subsf3+0xcc>
400023c8:	00080793          	mv	a5,a6
400023cc:	00068513          	mv	a0,a3
400023d0:	14c0006f          	j	4000251c <__subsf3+0x1cc>
400023d4:	fff70713          	addi	a4,a4,-1
400023d8:	02071e63          	bnez	a4,40002414 <__subsf3+0xc4>
400023dc:	010787b3          	add	a5,a5,a6
400023e0:	00068513          	mv	a0,a3
400023e4:	00579713          	slli	a4,a5,0x5
400023e8:	12075a63          	bgez	a4,4000251c <__subsf3+0x1cc>
400023ec:	00150513          	addi	a0,a0,1
400023f0:	0ff00713          	li	a4,255
400023f4:	32e50e63          	beq	a0,a4,40002730 <__subsf3+0x3e0>
400023f8:	7e000737          	lui	a4,0x7e000
400023fc:	0017f693          	andi	a3,a5,1
40002400:	fff70713          	addi	a4,a4,-1 # 7dffffff <_bss_end+0x3dff9f7b>
40002404:	0017d793          	srli	a5,a5,0x1
40002408:	00e7f7b3          	and	a5,a5,a4
4000240c:	00d7e7b3          	or	a5,a5,a3
40002410:	10c0006f          	j	4000251c <__subsf3+0x1cc>
40002414:	0ff00613          	li	a2,255
40002418:	00c69e63          	bne	a3,a2,40002434 <__subsf3+0xe4>
4000241c:	00080793          	mv	a5,a6
40002420:	0740006f          	j	40002494 <__subsf3+0x144>
40002424:	0ff00613          	li	a2,255
40002428:	fec68ae3          	beq	a3,a2,4000241c <__subsf3+0xcc>
4000242c:	04000637          	lui	a2,0x4000
40002430:	00c7e7b3          	or	a5,a5,a2
40002434:	01b00613          	li	a2,27
40002438:	00e65663          	ble	a4,a2,40002444 <__subsf3+0xf4>
4000243c:	00100793          	li	a5,1
40002440:	f9dff06f          	j	400023dc <__subsf3+0x8c>
40002444:	02000613          	li	a2,32
40002448:	40e60633          	sub	a2,a2,a4
4000244c:	00e7d5b3          	srl	a1,a5,a4
40002450:	00c797b3          	sll	a5,a5,a2
40002454:	00f037b3          	snez	a5,a5
40002458:	00f5e7b3          	or	a5,a1,a5
4000245c:	f81ff06f          	j	400023dc <__subsf3+0x8c>
40002460:	08070063          	beqz	a4,400024e0 <__subsf3+0x190>
40002464:	02069c63          	bnez	a3,4000249c <__subsf3+0x14c>
40002468:	00081863          	bnez	a6,40002478 <__subsf3+0x128>
4000246c:	0ff00713          	li	a4,255
40002470:	0ae61663          	bne	a2,a4,4000251c <__subsf3+0x1cc>
40002474:	0200006f          	j	40002494 <__subsf3+0x144>
40002478:	fff00693          	li	a3,-1
4000247c:	00d71663          	bne	a4,a3,40002488 <__subsf3+0x138>
40002480:	010787b3          	add	a5,a5,a6
40002484:	f61ff06f          	j	400023e4 <__subsf3+0x94>
40002488:	0ff00693          	li	a3,255
4000248c:	fff74713          	not	a4,a4
40002490:	02d61063          	bne	a2,a3,400024b0 <__subsf3+0x160>
40002494:	0ff00513          	li	a0,255
40002498:	0840006f          	j	4000251c <__subsf3+0x1cc>
4000249c:	0ff00693          	li	a3,255
400024a0:	fed60ae3          	beq	a2,a3,40002494 <__subsf3+0x144>
400024a4:	040006b7          	lui	a3,0x4000
400024a8:	40e00733          	neg	a4,a4
400024ac:	00d86833          	or	a6,a6,a3
400024b0:	01b00693          	li	a3,27
400024b4:	00e6d663          	ble	a4,a3,400024c0 <__subsf3+0x170>
400024b8:	00100713          	li	a4,1
400024bc:	01c0006f          	j	400024d8 <__subsf3+0x188>
400024c0:	02000693          	li	a3,32
400024c4:	00e85633          	srl	a2,a6,a4
400024c8:	40e68733          	sub	a4,a3,a4
400024cc:	00e81733          	sll	a4,a6,a4
400024d0:	00e03733          	snez	a4,a4
400024d4:	00e66733          	or	a4,a2,a4
400024d8:	00e787b3          	add	a5,a5,a4
400024dc:	f09ff06f          	j	400023e4 <__subsf3+0x94>
400024e0:	00168513          	addi	a0,a3,1 # 4000001 <_stack_size+0x3fff801>
400024e4:	0ff57613          	andi	a2,a0,255
400024e8:	00100713          	li	a4,1
400024ec:	06c74263          	blt	a4,a2,40002550 <__subsf3+0x200>
400024f0:	04069463          	bnez	a3,40002538 <__subsf3+0x1e8>
400024f4:	00000513          	li	a0,0
400024f8:	02080263          	beqz	a6,4000251c <__subsf3+0x1cc>
400024fc:	22078663          	beqz	a5,40002728 <__subsf3+0x3d8>
40002500:	010787b3          	add	a5,a5,a6
40002504:	00579713          	slli	a4,a5,0x5
40002508:	00075a63          	bgez	a4,4000251c <__subsf3+0x1cc>
4000250c:	fc000737          	lui	a4,0xfc000
40002510:	fff70713          	addi	a4,a4,-1 # fbffffff <_stack_start+0x7bfff6bf>
40002514:	00e7f7b3          	and	a5,a5,a4
40002518:	00100513          	li	a0,1
4000251c:	0077f713          	andi	a4,a5,7
40002520:	20070a63          	beqz	a4,40002734 <__subsf3+0x3e4>
40002524:	00f7f713          	andi	a4,a5,15
40002528:	00400693          	li	a3,4
4000252c:	20d70463          	beq	a4,a3,40002734 <__subsf3+0x3e4>
40002530:	00478793          	addi	a5,a5,4
40002534:	2000006f          	j	40002734 <__subsf3+0x3e4>
40002538:	f4080ee3          	beqz	a6,40002494 <__subsf3+0x144>
4000253c:	ee0780e3          	beqz	a5,4000241c <__subsf3+0xcc>
40002540:	020007b7          	lui	a5,0x2000
40002544:	0ff00513          	li	a0,255
40002548:	00000493          	li	s1,0
4000254c:	1e80006f          	j	40002734 <__subsf3+0x3e4>
40002550:	0ff00713          	li	a4,255
40002554:	1ce50e63          	beq	a0,a4,40002730 <__subsf3+0x3e0>
40002558:	00f80733          	add	a4,a6,a5
4000255c:	00175793          	srli	a5,a4,0x1
40002560:	fbdff06f          	j	4000251c <__subsf3+0x1cc>
40002564:	08e05063          	blez	a4,400025e4 <__subsf3+0x294>
40002568:	04061663          	bnez	a2,400025b4 <__subsf3+0x264>
4000256c:	e4078ae3          	beqz	a5,400023c0 <__subsf3+0x70>
40002570:	fff70713          	addi	a4,a4,-1
40002574:	02071463          	bnez	a4,4000259c <__subsf3+0x24c>
40002578:	40f807b3          	sub	a5,a6,a5
4000257c:	00068513          	mv	a0,a3
40002580:	00579713          	slli	a4,a5,0x5
40002584:	f8075ce3          	bgez	a4,4000251c <__subsf3+0x1cc>
40002588:	04000437          	lui	s0,0x4000
4000258c:	fff40413          	addi	s0,s0,-1 # 3ffffff <_stack_size+0x3fff7ff>
40002590:	0087f433          	and	s0,a5,s0
40002594:	00050913          	mv	s2,a0
40002598:	1380006f          	j	400026d0 <__subsf3+0x380>
4000259c:	0ff00613          	li	a2,255
400025a0:	e6c68ee3          	beq	a3,a2,4000241c <__subsf3+0xcc>
400025a4:	01b00613          	li	a2,27
400025a8:	02e65063          	ble	a4,a2,400025c8 <__subsf3+0x278>
400025ac:	00100793          	li	a5,1
400025b0:	fc9ff06f          	j	40002578 <__subsf3+0x228>
400025b4:	0ff00613          	li	a2,255
400025b8:	e6c682e3          	beq	a3,a2,4000241c <__subsf3+0xcc>
400025bc:	04000637          	lui	a2,0x4000
400025c0:	00c7e7b3          	or	a5,a5,a2
400025c4:	fe1ff06f          	j	400025a4 <__subsf3+0x254>
400025c8:	02000613          	li	a2,32
400025cc:	00e7d5b3          	srl	a1,a5,a4
400025d0:	40e60733          	sub	a4,a2,a4
400025d4:	00e797b3          	sll	a5,a5,a4
400025d8:	00f037b3          	snez	a5,a5
400025dc:	00f5e7b3          	or	a5,a1,a5
400025e0:	f99ff06f          	j	40002578 <__subsf3+0x228>
400025e4:	08070263          	beqz	a4,40002668 <__subsf3+0x318>
400025e8:	02069e63          	bnez	a3,40002624 <__subsf3+0x2d4>
400025ec:	00081863          	bnez	a6,400025fc <__subsf3+0x2ac>
400025f0:	0ff00713          	li	a4,255
400025f4:	00058493          	mv	s1,a1
400025f8:	e79ff06f          	j	40002470 <__subsf3+0x120>
400025fc:	fff00693          	li	a3,-1
40002600:	00d71863          	bne	a4,a3,40002610 <__subsf3+0x2c0>
40002604:	410787b3          	sub	a5,a5,a6
40002608:	00058493          	mv	s1,a1
4000260c:	f75ff06f          	j	40002580 <__subsf3+0x230>
40002610:	0ff00693          	li	a3,255
40002614:	fff74713          	not	a4,a4
40002618:	02d61063          	bne	a2,a3,40002638 <__subsf3+0x2e8>
4000261c:	00058493          	mv	s1,a1
40002620:	e75ff06f          	j	40002494 <__subsf3+0x144>
40002624:	0ff00693          	li	a3,255
40002628:	fed60ae3          	beq	a2,a3,4000261c <__subsf3+0x2cc>
4000262c:	040006b7          	lui	a3,0x4000
40002630:	40e00733          	neg	a4,a4
40002634:	00d86833          	or	a6,a6,a3
40002638:	01b00693          	li	a3,27
4000263c:	00e6d663          	ble	a4,a3,40002648 <__subsf3+0x2f8>
40002640:	00100713          	li	a4,1
40002644:	01c0006f          	j	40002660 <__subsf3+0x310>
40002648:	02000693          	li	a3,32
4000264c:	00e85633          	srl	a2,a6,a4
40002650:	40e68733          	sub	a4,a3,a4
40002654:	00e81733          	sll	a4,a6,a4
40002658:	00e03733          	snez	a4,a4
4000265c:	00e66733          	or	a4,a2,a4
40002660:	40e787b3          	sub	a5,a5,a4
40002664:	fa5ff06f          	j	40002608 <__subsf3+0x2b8>
40002668:	00168713          	addi	a4,a3,1 # 4000001 <_stack_size+0x3fff801>
4000266c:	0ff77713          	andi	a4,a4,255
40002670:	00100613          	li	a2,1
40002674:	04e64463          	blt	a2,a4,400026bc <__subsf3+0x36c>
40002678:	02069c63          	bnez	a3,400026b0 <__subsf3+0x360>
4000267c:	00081863          	bnez	a6,4000268c <__subsf3+0x33c>
40002680:	12079863          	bnez	a5,400027b0 <__subsf3+0x460>
40002684:	00000513          	li	a0,0
40002688:	ec1ff06f          	j	40002548 <__subsf3+0x1f8>
4000268c:	12078663          	beqz	a5,400027b8 <__subsf3+0x468>
40002690:	40f80733          	sub	a4,a6,a5
40002694:	00571693          	slli	a3,a4,0x5
40002698:	410787b3          	sub	a5,a5,a6
4000269c:	1006ca63          	bltz	a3,400027b0 <__subsf3+0x460>
400026a0:	00070793          	mv	a5,a4
400026a4:	06071063          	bnez	a4,40002704 <__subsf3+0x3b4>
400026a8:	00000793          	li	a5,0
400026ac:	fd9ff06f          	j	40002684 <__subsf3+0x334>
400026b0:	e80816e3          	bnez	a6,4000253c <__subsf3+0x1ec>
400026b4:	f60794e3          	bnez	a5,4000261c <__subsf3+0x2cc>
400026b8:	e89ff06f          	j	40002540 <__subsf3+0x1f0>
400026bc:	40f80433          	sub	s0,a6,a5
400026c0:	00541713          	slli	a4,s0,0x5
400026c4:	04075463          	bgez	a4,4000270c <__subsf3+0x3bc>
400026c8:	41078433          	sub	s0,a5,a6
400026cc:	00058493          	mv	s1,a1
400026d0:	00040513          	mv	a0,s0
400026d4:	52c000ef          	jal	ra,40002c00 <__clzsi2>
400026d8:	ffb50513          	addi	a0,a0,-5
400026dc:	00a41433          	sll	s0,s0,a0
400026e0:	03254a63          	blt	a0,s2,40002714 <__subsf3+0x3c4>
400026e4:	41250533          	sub	a0,a0,s2
400026e8:	00150513          	addi	a0,a0,1
400026ec:	02000713          	li	a4,32
400026f0:	00a457b3          	srl	a5,s0,a0
400026f4:	40a70533          	sub	a0,a4,a0
400026f8:	00a41433          	sll	s0,s0,a0
400026fc:	00803433          	snez	s0,s0
40002700:	0087e7b3          	or	a5,a5,s0
40002704:	00000513          	li	a0,0
40002708:	e15ff06f          	j	4000251c <__subsf3+0x1cc>
4000270c:	f8040ee3          	beqz	s0,400026a8 <__subsf3+0x358>
40002710:	fc1ff06f          	j	400026d0 <__subsf3+0x380>
40002714:	fc0007b7          	lui	a5,0xfc000
40002718:	fff78793          	addi	a5,a5,-1 # fbffffff <_stack_start+0x7bfff6bf>
4000271c:	40a90533          	sub	a0,s2,a0
40002720:	00f477b3          	and	a5,s0,a5
40002724:	df9ff06f          	j	4000251c <__subsf3+0x1cc>
40002728:	00080793          	mv	a5,a6
4000272c:	df1ff06f          	j	4000251c <__subsf3+0x1cc>
40002730:	00000793          	li	a5,0
40002734:	00579713          	slli	a4,a5,0x5
40002738:	00075e63          	bgez	a4,40002754 <__subsf3+0x404>
4000273c:	00150513          	addi	a0,a0,1
40002740:	0ff00713          	li	a4,255
40002744:	06e50e63          	beq	a0,a4,400027c0 <__subsf3+0x470>
40002748:	fc000737          	lui	a4,0xfc000
4000274c:	fff70713          	addi	a4,a4,-1 # fbffffff <_stack_start+0x7bfff6bf>
40002750:	00e7f7b3          	and	a5,a5,a4
40002754:	0ff00713          	li	a4,255
40002758:	0037d793          	srli	a5,a5,0x3
4000275c:	00e51863          	bne	a0,a4,4000276c <__subsf3+0x41c>
40002760:	00078663          	beqz	a5,4000276c <__subsf3+0x41c>
40002764:	004007b7          	lui	a5,0x400
40002768:	00000493          	li	s1,0
4000276c:	00800737          	lui	a4,0x800
40002770:	fff70713          	addi	a4,a4,-1 # 7fffff <_stack_size+0x7ff7ff>
40002774:	0ff57513          	andi	a0,a0,255
40002778:	00e7f7b3          	and	a5,a5,a4
4000277c:	01751713          	slli	a4,a0,0x17
40002780:	80800537          	lui	a0,0x80800
40002784:	00c12083          	lw	ra,12(sp)
40002788:	00812403          	lw	s0,8(sp)
4000278c:	fff50513          	addi	a0,a0,-1 # 807fffff <_stack_start+0x7ff6bf>
40002790:	00a7f533          	and	a0,a5,a0
40002794:	01f49493          	slli	s1,s1,0x1f
40002798:	00e56533          	or	a0,a0,a4
4000279c:	00956533          	or	a0,a0,s1
400027a0:	00012903          	lw	s2,0(sp)
400027a4:	00412483          	lw	s1,4(sp)
400027a8:	01010113          	addi	sp,sp,16
400027ac:	00008067          	ret
400027b0:	00058493          	mv	s1,a1
400027b4:	f51ff06f          	j	40002704 <__subsf3+0x3b4>
400027b8:	00080793          	mv	a5,a6
400027bc:	f49ff06f          	j	40002704 <__subsf3+0x3b4>
400027c0:	00000793          	li	a5,0
400027c4:	f91ff06f          	j	40002754 <__subsf3+0x404>

400027c8 <__fixsfsi>:
400027c8:	00800637          	lui	a2,0x800
400027cc:	01755713          	srli	a4,a0,0x17
400027d0:	fff60793          	addi	a5,a2,-1 # 7fffff <_stack_size+0x7ff7ff>
400027d4:	0ff77713          	andi	a4,a4,255
400027d8:	07e00593          	li	a1,126
400027dc:	00a7f7b3          	and	a5,a5,a0
400027e0:	01f55693          	srli	a3,a0,0x1f
400027e4:	04e5f663          	bleu	a4,a1,40002830 <__fixsfsi+0x68>
400027e8:	09d00593          	li	a1,157
400027ec:	00e5fa63          	bleu	a4,a1,40002800 <__fixsfsi+0x38>
400027f0:	80000537          	lui	a0,0x80000
400027f4:	fff54513          	not	a0,a0
400027f8:	00a68533          	add	a0,a3,a0
400027fc:	00008067          	ret
40002800:	00c7e533          	or	a0,a5,a2
40002804:	09500793          	li	a5,149
40002808:	00e7dc63          	ble	a4,a5,40002820 <__fixsfsi+0x58>
4000280c:	f6a70713          	addi	a4,a4,-150
40002810:	00e51533          	sll	a0,a0,a4
40002814:	02068063          	beqz	a3,40002834 <__fixsfsi+0x6c>
40002818:	40a00533          	neg	a0,a0
4000281c:	00008067          	ret
40002820:	09600793          	li	a5,150
40002824:	40e78733          	sub	a4,a5,a4
40002828:	00e55533          	srl	a0,a0,a4
4000282c:	fe9ff06f          	j	40002814 <__fixsfsi+0x4c>
40002830:	00000513          	li	a0,0
40002834:	00008067          	ret

40002838 <__floatsisf>:
40002838:	ff010113          	addi	sp,sp,-16
4000283c:	00112623          	sw	ra,12(sp)
40002840:	00812423          	sw	s0,8(sp)
40002844:	00912223          	sw	s1,4(sp)
40002848:	10050263          	beqz	a0,4000294c <__floatsisf+0x114>
4000284c:	00050413          	mv	s0,a0
40002850:	01f55493          	srli	s1,a0,0x1f
40002854:	00055463          	bgez	a0,4000285c <__floatsisf+0x24>
40002858:	40a00433          	neg	s0,a0
4000285c:	00040513          	mv	a0,s0
40002860:	3a0000ef          	jal	ra,40002c00 <__clzsi2>
40002864:	09e00793          	li	a5,158
40002868:	40a787b3          	sub	a5,a5,a0
4000286c:	09600713          	li	a4,150
40002870:	06f74063          	blt	a4,a5,400028d0 <__floatsisf+0x98>
40002874:	00800713          	li	a4,8
40002878:	00a75663          	ble	a0,a4,40002884 <__floatsisf+0x4c>
4000287c:	ff850513          	addi	a0,a0,-8 # 7ffffff8 <_stack_start+0xfffff6b8>
40002880:	00a41433          	sll	s0,s0,a0
40002884:	00800537          	lui	a0,0x800
40002888:	fff50513          	addi	a0,a0,-1 # 7fffff <_stack_size+0x7ff7ff>
4000288c:	0ff7f793          	andi	a5,a5,255
40002890:	00a47433          	and	s0,s0,a0
40002894:	01779513          	slli	a0,a5,0x17
40002898:	808007b7          	lui	a5,0x80800
4000289c:	fff78793          	addi	a5,a5,-1 # 807fffff <_stack_start+0x7ff6bf>
400028a0:	00f47433          	and	s0,s0,a5
400028a4:	800007b7          	lui	a5,0x80000
400028a8:	00a46433          	or	s0,s0,a0
400028ac:	fff7c793          	not	a5,a5
400028b0:	01f49513          	slli	a0,s1,0x1f
400028b4:	00f47433          	and	s0,s0,a5
400028b8:	00a46533          	or	a0,s0,a0
400028bc:	00c12083          	lw	ra,12(sp)
400028c0:	00812403          	lw	s0,8(sp)
400028c4:	00412483          	lw	s1,4(sp)
400028c8:	01010113          	addi	sp,sp,16
400028cc:	00008067          	ret
400028d0:	09900713          	li	a4,153
400028d4:	02f75063          	ble	a5,a4,400028f4 <__floatsisf+0xbc>
400028d8:	00500713          	li	a4,5
400028dc:	40a70733          	sub	a4,a4,a0
400028e0:	01b50693          	addi	a3,a0,27
400028e4:	00e45733          	srl	a4,s0,a4
400028e8:	00d41433          	sll	s0,s0,a3
400028ec:	00803433          	snez	s0,s0
400028f0:	00876433          	or	s0,a4,s0
400028f4:	00500713          	li	a4,5
400028f8:	00a75663          	ble	a0,a4,40002904 <__floatsisf+0xcc>
400028fc:	ffb50713          	addi	a4,a0,-5
40002900:	00e41433          	sll	s0,s0,a4
40002904:	fc000737          	lui	a4,0xfc000
40002908:	fff70713          	addi	a4,a4,-1 # fbffffff <_stack_start+0x7bfff6bf>
4000290c:	00747693          	andi	a3,s0,7
40002910:	00e47733          	and	a4,s0,a4
40002914:	00068a63          	beqz	a3,40002928 <__floatsisf+0xf0>
40002918:	00f47413          	andi	s0,s0,15
4000291c:	00400693          	li	a3,4
40002920:	00d40463          	beq	s0,a3,40002928 <__floatsisf+0xf0>
40002924:	00470713          	addi	a4,a4,4
40002928:	00571693          	slli	a3,a4,0x5
4000292c:	0006dc63          	bgez	a3,40002944 <__floatsisf+0x10c>
40002930:	fc0007b7          	lui	a5,0xfc000
40002934:	fff78793          	addi	a5,a5,-1 # fbffffff <_stack_start+0x7bfff6bf>
40002938:	00f77733          	and	a4,a4,a5
4000293c:	09f00793          	li	a5,159
40002940:	40a787b3          	sub	a5,a5,a0
40002944:	00375413          	srli	s0,a4,0x3
40002948:	f3dff06f          	j	40002884 <__floatsisf+0x4c>
4000294c:	00000413          	li	s0,0
40002950:	00000793          	li	a5,0
40002954:	00000493          	li	s1,0
40002958:	f2dff06f          	j	40002884 <__floatsisf+0x4c>

4000295c <__extendsfdf2>:
4000295c:	01755793          	srli	a5,a0,0x17
40002960:	ff010113          	addi	sp,sp,-16
40002964:	0ff7f793          	andi	a5,a5,255
40002968:	00812423          	sw	s0,8(sp)
4000296c:	00178713          	addi	a4,a5,1
40002970:	00800437          	lui	s0,0x800
40002974:	00912223          	sw	s1,4(sp)
40002978:	fff40413          	addi	s0,s0,-1 # 7fffff <_stack_size+0x7ff7ff>
4000297c:	00112623          	sw	ra,12(sp)
40002980:	0ff77713          	andi	a4,a4,255
40002984:	00100693          	li	a3,1
40002988:	00a47433          	and	s0,s0,a0
4000298c:	01f55493          	srli	s1,a0,0x1f
40002990:	06e6d263          	ble	a4,a3,400029f4 <__extendsfdf2+0x98>
40002994:	38078513          	addi	a0,a5,896
40002998:	00345793          	srli	a5,s0,0x3
4000299c:	01d41413          	slli	s0,s0,0x1d
400029a0:	00100737          	lui	a4,0x100
400029a4:	fff70713          	addi	a4,a4,-1 # fffff <_stack_size+0xff7ff>
400029a8:	00e7f7b3          	and	a5,a5,a4
400029ac:	80100737          	lui	a4,0x80100
400029b0:	fff70713          	addi	a4,a4,-1 # 800fffff <_stack_start+0xff6bf>
400029b4:	7ff57513          	andi	a0,a0,2047
400029b8:	01451513          	slli	a0,a0,0x14
400029bc:	00e7f7b3          	and	a5,a5,a4
400029c0:	80000737          	lui	a4,0x80000
400029c4:	00a7e7b3          	or	a5,a5,a0
400029c8:	fff74713          	not	a4,a4
400029cc:	01f49513          	slli	a0,s1,0x1f
400029d0:	00e7f7b3          	and	a5,a5,a4
400029d4:	00a7e733          	or	a4,a5,a0
400029d8:	00c12083          	lw	ra,12(sp)
400029dc:	00040513          	mv	a0,s0
400029e0:	00812403          	lw	s0,8(sp)
400029e4:	00412483          	lw	s1,4(sp)
400029e8:	00070593          	mv	a1,a4
400029ec:	01010113          	addi	sp,sp,16
400029f0:	00008067          	ret
400029f4:	04079463          	bnez	a5,40002a3c <__extendsfdf2+0xe0>
400029f8:	06040263          	beqz	s0,40002a5c <__extendsfdf2+0x100>
400029fc:	00040513          	mv	a0,s0
40002a00:	200000ef          	jal	ra,40002c00 <__clzsi2>
40002a04:	00a00793          	li	a5,10
40002a08:	02a7c263          	blt	a5,a0,40002a2c <__extendsfdf2+0xd0>
40002a0c:	00b00793          	li	a5,11
40002a10:	40a787b3          	sub	a5,a5,a0
40002a14:	01550713          	addi	a4,a0,21
40002a18:	00f457b3          	srl	a5,s0,a5
40002a1c:	00e41433          	sll	s0,s0,a4
40002a20:	38900713          	li	a4,905
40002a24:	40a70533          	sub	a0,a4,a0
40002a28:	f79ff06f          	j	400029a0 <__extendsfdf2+0x44>
40002a2c:	ff550793          	addi	a5,a0,-11
40002a30:	00f417b3          	sll	a5,s0,a5
40002a34:	00000413          	li	s0,0
40002a38:	fe9ff06f          	j	40002a20 <__extendsfdf2+0xc4>
40002a3c:	00000793          	li	a5,0
40002a40:	00040a63          	beqz	s0,40002a54 <__extendsfdf2+0xf8>
40002a44:	00345793          	srli	a5,s0,0x3
40002a48:	00080737          	lui	a4,0x80
40002a4c:	01d41413          	slli	s0,s0,0x1d
40002a50:	00e7e7b3          	or	a5,a5,a4
40002a54:	7ff00513          	li	a0,2047
40002a58:	f49ff06f          	j	400029a0 <__extendsfdf2+0x44>
40002a5c:	00000793          	li	a5,0
40002a60:	00000513          	li	a0,0
40002a64:	f3dff06f          	j	400029a0 <__extendsfdf2+0x44>

40002a68 <__truncdfsf2>:
40002a68:	00100637          	lui	a2,0x100
40002a6c:	fff60613          	addi	a2,a2,-1 # fffff <_stack_size+0xff7ff>
40002a70:	00b67633          	and	a2,a2,a1
40002a74:	0145d813          	srli	a6,a1,0x14
40002a78:	01d55793          	srli	a5,a0,0x1d
40002a7c:	7ff87813          	andi	a6,a6,2047
40002a80:	00361613          	slli	a2,a2,0x3
40002a84:	00c7e633          	or	a2,a5,a2
40002a88:	00180793          	addi	a5,a6,1
40002a8c:	7ff7f793          	andi	a5,a5,2047
40002a90:	00100693          	li	a3,1
40002a94:	01f5d593          	srli	a1,a1,0x1f
40002a98:	00351713          	slli	a4,a0,0x3
40002a9c:	0af6d663          	ble	a5,a3,40002b48 <__truncdfsf2+0xe0>
40002aa0:	c8080693          	addi	a3,a6,-896
40002aa4:	0fe00793          	li	a5,254
40002aa8:	0cd7c263          	blt	a5,a3,40002b6c <__truncdfsf2+0x104>
40002aac:	08d04063          	bgtz	a3,40002b2c <__truncdfsf2+0xc4>
40002ab0:	fe900793          	li	a5,-23
40002ab4:	12f6c463          	blt	a3,a5,40002bdc <__truncdfsf2+0x174>
40002ab8:	008007b7          	lui	a5,0x800
40002abc:	01e00513          	li	a0,30
40002ac0:	00f66633          	or	a2,a2,a5
40002ac4:	40d50533          	sub	a0,a0,a3
40002ac8:	01f00793          	li	a5,31
40002acc:	02a7c863          	blt	a5,a0,40002afc <__truncdfsf2+0x94>
40002ad0:	c8280813          	addi	a6,a6,-894
40002ad4:	010717b3          	sll	a5,a4,a6
40002ad8:	00f037b3          	snez	a5,a5
40002adc:	01061633          	sll	a2,a2,a6
40002ae0:	00a75533          	srl	a0,a4,a0
40002ae4:	00c7e7b3          	or	a5,a5,a2
40002ae8:	00f567b3          	or	a5,a0,a5
40002aec:	00000693          	li	a3,0
40002af0:	0077f713          	andi	a4,a5,7
40002af4:	08070063          	beqz	a4,40002b74 <__truncdfsf2+0x10c>
40002af8:	0ec0006f          	j	40002be4 <__truncdfsf2+0x17c>
40002afc:	ffe00793          	li	a5,-2
40002b00:	40d786b3          	sub	a3,a5,a3
40002b04:	02000793          	li	a5,32
40002b08:	00d656b3          	srl	a3,a2,a3
40002b0c:	00000893          	li	a7,0
40002b10:	00f50663          	beq	a0,a5,40002b1c <__truncdfsf2+0xb4>
40002b14:	ca280813          	addi	a6,a6,-862
40002b18:	010618b3          	sll	a7,a2,a6
40002b1c:	00e8e7b3          	or	a5,a7,a4
40002b20:	00f037b3          	snez	a5,a5
40002b24:	00f6e7b3          	or	a5,a3,a5
40002b28:	fc5ff06f          	j	40002aec <__truncdfsf2+0x84>
40002b2c:	00651513          	slli	a0,a0,0x6
40002b30:	00a03533          	snez	a0,a0
40002b34:	00361613          	slli	a2,a2,0x3
40002b38:	01d75793          	srli	a5,a4,0x1d
40002b3c:	00c56633          	or	a2,a0,a2
40002b40:	00f667b3          	or	a5,a2,a5
40002b44:	fadff06f          	j	40002af0 <__truncdfsf2+0x88>
40002b48:	00e667b3          	or	a5,a2,a4
40002b4c:	00081663          	bnez	a6,40002b58 <__truncdfsf2+0xf0>
40002b50:	00f037b3          	snez	a5,a5
40002b54:	f99ff06f          	j	40002aec <__truncdfsf2+0x84>
40002b58:	0ff00693          	li	a3,255
40002b5c:	00078c63          	beqz	a5,40002b74 <__truncdfsf2+0x10c>
40002b60:	00361613          	slli	a2,a2,0x3
40002b64:	020007b7          	lui	a5,0x2000
40002b68:	fd9ff06f          	j	40002b40 <__truncdfsf2+0xd8>
40002b6c:	00000793          	li	a5,0
40002b70:	0ff00693          	li	a3,255
40002b74:	00579713          	slli	a4,a5,0x5
40002b78:	00075e63          	bgez	a4,40002b94 <__truncdfsf2+0x12c>
40002b7c:	00168693          	addi	a3,a3,1
40002b80:	0ff00713          	li	a4,255
40002b84:	06e68a63          	beq	a3,a4,40002bf8 <__truncdfsf2+0x190>
40002b88:	fc000737          	lui	a4,0xfc000
40002b8c:	fff70713          	addi	a4,a4,-1 # fbffffff <_stack_start+0x7bfff6bf>
40002b90:	00e7f7b3          	and	a5,a5,a4
40002b94:	0ff00713          	li	a4,255
40002b98:	0037d793          	srli	a5,a5,0x3
40002b9c:	00e69863          	bne	a3,a4,40002bac <__truncdfsf2+0x144>
40002ba0:	00078663          	beqz	a5,40002bac <__truncdfsf2+0x144>
40002ba4:	004007b7          	lui	a5,0x400
40002ba8:	00000593          	li	a1,0
40002bac:	00800537          	lui	a0,0x800
40002bb0:	fff50513          	addi	a0,a0,-1 # 7fffff <_stack_size+0x7ff7ff>
40002bb4:	00a7f7b3          	and	a5,a5,a0
40002bb8:	80800537          	lui	a0,0x80800
40002bbc:	fff50513          	addi	a0,a0,-1 # 807fffff <_stack_start+0x7ff6bf>
40002bc0:	0ff6f693          	andi	a3,a3,255
40002bc4:	01769693          	slli	a3,a3,0x17
40002bc8:	00a7f7b3          	and	a5,a5,a0
40002bcc:	01f59593          	slli	a1,a1,0x1f
40002bd0:	00d7e7b3          	or	a5,a5,a3
40002bd4:	00b7e533          	or	a0,a5,a1
40002bd8:	00008067          	ret
40002bdc:	00100793          	li	a5,1
40002be0:	00000693          	li	a3,0
40002be4:	00f7f713          	andi	a4,a5,15
40002be8:	00400613          	li	a2,4
40002bec:	f8c704e3          	beq	a4,a2,40002b74 <__truncdfsf2+0x10c>
40002bf0:	00478793          	addi	a5,a5,4 # 400004 <_stack_size+0x3ff804>
40002bf4:	f81ff06f          	j	40002b74 <__truncdfsf2+0x10c>
40002bf8:	00000793          	li	a5,0
40002bfc:	f99ff06f          	j	40002b94 <__truncdfsf2+0x12c>

40002c00 <__clzsi2>:
40002c00:	000107b7          	lui	a5,0x10
40002c04:	02f57a63          	bleu	a5,a0,40002c38 <__clzsi2+0x38>
40002c08:	0ff00793          	li	a5,255
40002c0c:	00a7b7b3          	sltu	a5,a5,a0
40002c10:	00379793          	slli	a5,a5,0x3
40002c14:	02000713          	li	a4,32
40002c18:	40f70733          	sub	a4,a4,a5
40002c1c:	00f557b3          	srl	a5,a0,a5
40002c20:	00000517          	auipc	a0,0x0
40002c24:	74050513          	addi	a0,a0,1856 # 40003360 <__clz_tab>
40002c28:	00f507b3          	add	a5,a0,a5
40002c2c:	0007c503          	lbu	a0,0(a5) # 10000 <_stack_size+0xf800>
40002c30:	40a70533          	sub	a0,a4,a0
40002c34:	00008067          	ret
40002c38:	01000737          	lui	a4,0x1000
40002c3c:	01000793          	li	a5,16
40002c40:	fce56ae3          	bltu	a0,a4,40002c14 <__clzsi2+0x14>
40002c44:	01800793          	li	a5,24
40002c48:	fcdff06f          	j	40002c14 <__clzsi2+0x14>

Disassembly of section .text.startup:

40002c4c <main>:
int main() {
40002c4c:	fe010113          	addi	sp,sp,-32
	uartConfig.dataLength = 8;
40002c50:	00800793          	li	a5,8
	uart_applyConfig(UART,&uartConfig);
40002c54:	00010513          	mv	a0,sp
	uartConfig.dataLength = 8;
40002c58:	00f12023          	sw	a5,0(sp)
	uartConfig.clockDivider = 50000000/8/115200-1;
40002c5c:	03500793          	li	a5,53
int main() {
40002c60:	00112e23          	sw	ra,28(sp)
	uartConfig.clockDivider = 50000000/8/115200-1;
40002c64:	00f12623          	sw	a5,12(sp)
	uartConfig.parity = NONE;
40002c68:	00012223          	sw	zero,4(sp)
	uartConfig.stop = ONE;
40002c6c:	00012423          	sw	zero,8(sp)
	uart_applyConfig(UART,&uartConfig);
40002c70:	b90fd0ef          	jal	ra,40000000 <uart_applyConfig.constprop.1>
	interruptCtrl_init(TIMER_INTERRUPT);
40002c74:	ba4fd0ef          	jal	ra,40000018 <interruptCtrl_init.constprop.2>
	timer_init(TIMER_A);
40002c78:	bb4fd0ef          	jal	ra,4000002c <timer_init.constprop.3>
	TIMER_A->LIMIT = ~0;
40002c7c:	f0020737          	lui	a4,0xf0020
40002c80:	fff00693          	li	a3,-1
	TIMER_A->CLEARS_TICKS = 0x00010001;
40002c84:	000107b7          	lui	a5,0x10
	TIMER_A->LIMIT = ~0;
40002c88:	04d72223          	sw	a3,68(a4) # f0020044 <_stack_start+0x7001f704>
	TIMER_A->CLEARS_TICKS = 0x00010001;
40002c8c:	00178793          	addi	a5,a5,1 # 10001 <_stack_size+0xf801>
40002c90:	04f72023          	sw	a5,64(a4)
	main2();
40002c94:	d94fd0ef          	jal	ra,40000228 <main2>
}
40002c98:	01c12083          	lw	ra,28(sp)
40002c9c:	00000513          	li	a0,0
40002ca0:	02010113          	addi	sp,sp,32
40002ca4:	00008067          	ret
