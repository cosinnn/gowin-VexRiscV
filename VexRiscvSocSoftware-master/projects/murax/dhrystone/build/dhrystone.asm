
build/dhrystone.elf:     file format elf32-littleriscv


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
80000064:	108000ef          	jal	ra,8000016c <irqCallback>
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
  .option push
  .option norelax
  la gp, __global_pointer$
800000b0:	00004197          	auipc	gp,0x4
800000b4:	11818193          	addi	gp,gp,280 # 800041c8 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000b8:	00007117          	auipc	sp,0x7
800000bc:	93810113          	addi	sp,sp,-1736 # 800069f0 <_stack_start>

800000c0 <bss_init>:

bss_init:
  la a0, _bss_start
800000c0:	81c18513          	addi	a0,gp,-2020 # 800039e4 <Dhrystones_Per_Second>
  la a1, _bss_end
800000c4:	00006597          	auipc	a1,0x6
800000c8:	52858593          	addi	a1,a1,1320 # 800065ec <_bss_end>

800000cc <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000cc:	00b50863          	beq	a0,a1,800000dc <bss_done>
  sw zero,0(a0)
800000d0:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000d4:	00450513          	addi	a0,a0,4
  j bss_loop
800000d8:	ff5ff06f          	j	800000cc <bss_loop>

800000dc <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000dc:	00004517          	auipc	a0,0x4
800000e0:	8ec50513          	addi	a0,a0,-1812 # 800039c8 <_ctors_end>
  addi sp,sp,-4
800000e4:	ffc10113          	addi	sp,sp,-4

800000e8 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000e8:	00004597          	auipc	a1,0x4
800000ec:	8e058593          	addi	a1,a1,-1824 # 800039c8 <_ctors_end>
  beq a0,a1,ctors_done
800000f0:	00b50e63          	beq	a0,a1,8000010c <ctors_done>
  lw a3,0(a0)
800000f4:	00052683          	lw	a3,0(a0)
  add a0,a0,4
800000f8:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
800000fc:	00a12023          	sw	a0,0(sp)
  jalr  a3
80000100:	000680e7          	jalr	a3
  lw a0,0(sp)
80000104:	00012503          	lw	a0,0(sp)
  j ctors_loop
80000108:	fe1ff06f          	j	800000e8 <ctors_loop>

8000010c <ctors_done>:
ctors_done:
  addi sp,sp,4
8000010c:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
80000110:	00001537          	lui	a0,0x1
80000114:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x480>
  csrw mie,a0
80000118:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
8000011c:	00002537          	lui	a0,0x2
80000120:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1408>
  csrw mstatus,a0
80000124:	30051073          	csrw	mstatus,a0

  call main
80000128:	084030ef          	jal	ra,800031ac <end>

8000012c <infinitLoop>:
infinitLoop:
  j infinitLoop
8000012c:	0000006f          	j	8000012c <infinitLoop>

Disassembly of section .memory:

80000130 <uart_applyConfig.constprop.1>:
	while(uart_writeAvailability(reg) == 0);
	reg->DATA = data;
}

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
	reg->CLOCK_DIVIDER = config->clockDivider;
80000130:	f00107b7          	lui	a5,0xf0010
80000134:	01300713          	li	a4,19
80000138:	00e7a423          	sw	a4,8(a5) # f0010008 <_stack_start+0x70009618>
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
8000013c:	00700713          	li	a4,7
80000140:	00e7a623          	sw	a4,12(a5)
}
80000144:	00008067          	ret

80000148 <interruptCtrl_init.constprop.2>:
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} InterruptCtrl_Reg;

static void interruptCtrl_init(InterruptCtrl_Reg* reg){
	reg->MASKS = 0;
80000148:	f00207b7          	lui	a5,0xf0020
8000014c:	0007aa23          	sw	zero,20(a5) # f0020014 <_stack_start+0x70019624>
	reg->PENDINGS = 0xFFFFFFFF;
80000150:	fff00713          	li	a4,-1
80000154:	00e7a823          	sw	a4,16(a5)
}
80000158:	00008067          	ret

8000015c <timer_init.constprop.3>:
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

static void timer_init(Timer_Reg *reg){
	reg->CLEARS_TICKS  = 0;
8000015c:	f00207b7          	lui	a5,0xf0020
80000160:	0407a023          	sw	zero,64(a5) # f0020040 <_stack_start+0x70019650>
	reg->VALUE = 0;
80000164:	0407a423          	sw	zero,72(a5)
}
80000168:	00008067          	ret

8000016c <irqCallback>:
}


void irqCallback(){

}
8000016c:	00008067          	ret

80000170 <clock>:

#include <time.h>
clock_t	clock(){
	return TIMER_A->VALUE;
80000170:	f00207b7          	lui	a5,0xf0020
80000174:	0487a503          	lw	a0,72(a5) # f0020048 <_stack_start+0x70019658>
}
80000178:	00008067          	ret

8000017c <Proc_2>:
  One_Fifty  Int_Loc;  
  Enumeration   Enum_Loc;

  Int_Loc = *Int_Par_Ref + 10;
  do /* executed once */
    if (Ch_1_Glob == 'A')
8000017c:	8351c703          	lbu	a4,-1995(gp) # 800039fd <Ch_1_Glob>
80000180:	04100793          	li	a5,65
80000184:	00f70463          	beq	a4,a5,8000018c <Proc_2+0x10>
      Int_Loc -= 1;
      *Int_Par_Ref = Int_Loc - Int_Glob;
      Enum_Loc = Ident_1;
    } /* if */
  while (Enum_Loc != Ident_1); /* true */
} /* Proc_2 */
80000188:	00008067          	ret
      Int_Loc -= 1;
8000018c:	00052783          	lw	a5,0(a0)
      *Int_Par_Ref = Int_Loc - Int_Glob;
80000190:	83c1a703          	lw	a4,-1988(gp) # 80003a04 <Int_Glob>
      Int_Loc -= 1;
80000194:	00978793          	addi	a5,a5,9
      *Int_Par_Ref = Int_Loc - Int_Glob;
80000198:	40e787b3          	sub	a5,a5,a4
8000019c:	00f52023          	sw	a5,0(a0)
} /* Proc_2 */
800001a0:	00008067          	ret

800001a4 <Proc_3>:
    /* Ptr_Ref_Par becomes Ptr_Glob */

Rec_Pointer *Ptr_Ref_Par;

{
  if (Ptr_Glob != Null)
800001a4:	8441a603          	lw	a2,-1980(gp) # 80003a0c <Ptr_Glob>
800001a8:	00060863          	beqz	a2,800001b8 <Proc_3+0x14>
    /* then, executed */
    *Ptr_Ref_Par = Ptr_Glob->Ptr_Comp;
800001ac:	00062703          	lw	a4,0(a2)
800001b0:	00e52023          	sw	a4,0(a0)
800001b4:	8441a603          	lw	a2,-1980(gp) # 80003a0c <Ptr_Glob>
  Proc_7 (10, Int_Glob, &Ptr_Glob->variant.var_1.Int_Comp);
800001b8:	83c1a583          	lw	a1,-1988(gp) # 80003a04 <Int_Glob>
800001bc:	00c60613          	addi	a2,a2,12
800001c0:	00a00513          	li	a0,10
800001c4:	1150006f          	j	80000ad8 <Proc_7>

800001c8 <Proc_1>:
{
800001c8:	ff010113          	addi	sp,sp,-16
800001cc:	01212023          	sw	s2,0(sp)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
800001d0:	8441a783          	lw	a5,-1980(gp) # 80003a0c <Ptr_Glob>
{
800001d4:	00812423          	sw	s0,8(sp)
  REG Rec_Pointer Next_Record = Ptr_Val_Par->Ptr_Comp;  
800001d8:	00052403          	lw	s0,0(a0)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
800001dc:	0007a703          	lw	a4,0(a5)
{
800001e0:	00912223          	sw	s1,4(sp)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
800001e4:	0047ae83          	lw	t4,4(a5)
800001e8:	0087ae03          	lw	t3,8(a5)
800001ec:	0107a303          	lw	t1,16(a5)
800001f0:	0147a883          	lw	a7,20(a5)
800001f4:	0187a803          	lw	a6,24(a5)
800001f8:	0207a583          	lw	a1,32(a5)
800001fc:	0247a603          	lw	a2,36(a5)
80000200:	0287a683          	lw	a3,40(a5)
{
80000204:	00112623          	sw	ra,12(sp)
80000208:	00050493          	mv	s1,a0
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
8000020c:	01c7a503          	lw	a0,28(a5)
80000210:	02c7a783          	lw	a5,44(a5)
80000214:	00e42023          	sw	a4,0(s0)
  Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
80000218:	0004a703          	lw	a4,0(s1)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
8000021c:	00a42e23          	sw	a0,28(s0)
80000220:	02f42623          	sw	a5,44(s0)
80000224:	01d42223          	sw	t4,4(s0)
  Ptr_Val_Par->variant.var_1.Int_Comp = 5;
80000228:	00500793          	li	a5,5
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
8000022c:	01c42423          	sw	t3,8(s0)
80000230:	00642823          	sw	t1,16(s0)
80000234:	01142a23          	sw	a7,20(s0)
80000238:	01042c23          	sw	a6,24(s0)
8000023c:	02b42023          	sw	a1,32(s0)
80000240:	02c42223          	sw	a2,36(s0)
80000244:	02d42423          	sw	a3,40(s0)
  Ptr_Val_Par->variant.var_1.Int_Comp = 5;
80000248:	00f4a623          	sw	a5,12(s1)
        = Ptr_Val_Par->variant.var_1.Int_Comp;
8000024c:	00f42623          	sw	a5,12(s0)
  Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
80000250:	00e42023          	sw	a4,0(s0)
  Proc_3 (&Next_Record->Ptr_Comp);
80000254:	00040513          	mv	a0,s0
80000258:	f4dff0ef          	jal	ra,800001a4 <Proc_3>
  if (Next_Record->Discr == Ident_1)
8000025c:	00442783          	lw	a5,4(s0)
80000260:	08078063          	beqz	a5,800002e0 <Proc_1+0x118>
    structassign (*Ptr_Val_Par, *Ptr_Val_Par->Ptr_Comp);
80000264:	0004a783          	lw	a5,0(s1)
} /* Proc_1 */
80000268:	00c12083          	lw	ra,12(sp)
8000026c:	00812403          	lw	s0,8(sp)
    structassign (*Ptr_Val_Par, *Ptr_Val_Par->Ptr_Comp);
80000270:	0007af83          	lw	t6,0(a5)
80000274:	0047af03          	lw	t5,4(a5)
80000278:	0087ae83          	lw	t4,8(a5)
8000027c:	00c7ae03          	lw	t3,12(a5)
80000280:	0107a303          	lw	t1,16(a5)
80000284:	0147a883          	lw	a7,20(a5)
80000288:	0187a803          	lw	a6,24(a5)
8000028c:	01c7a583          	lw	a1,28(a5)
80000290:	0207a603          	lw	a2,32(a5)
80000294:	0247a683          	lw	a3,36(a5)
80000298:	0287a703          	lw	a4,40(a5)
8000029c:	02c7a783          	lw	a5,44(a5)
800002a0:	01f4a023          	sw	t6,0(s1)
800002a4:	01e4a223          	sw	t5,4(s1)
800002a8:	01d4a423          	sw	t4,8(s1)
800002ac:	01c4a623          	sw	t3,12(s1)
800002b0:	0064a823          	sw	t1,16(s1)
800002b4:	0114aa23          	sw	a7,20(s1)
800002b8:	0104ac23          	sw	a6,24(s1)
800002bc:	00b4ae23          	sw	a1,28(s1)
800002c0:	02c4a023          	sw	a2,32(s1)
800002c4:	02d4a223          	sw	a3,36(s1)
800002c8:	02e4a423          	sw	a4,40(s1)
800002cc:	02f4a623          	sw	a5,44(s1)
} /* Proc_1 */
800002d0:	00012903          	lw	s2,0(sp)
800002d4:	00412483          	lw	s1,4(sp)
800002d8:	01010113          	addi	sp,sp,16
800002dc:	00008067          	ret
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp, 
800002e0:	0084a503          	lw	a0,8(s1)
    Next_Record->variant.var_1.Int_Comp = 6;
800002e4:	00600793          	li	a5,6
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp, 
800002e8:	00840593          	addi	a1,s0,8
    Next_Record->variant.var_1.Int_Comp = 6;
800002ec:	00f42623          	sw	a5,12(s0)
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp, 
800002f0:	125000ef          	jal	ra,80000c14 <Proc_6>
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
800002f4:	8441a783          	lw	a5,-1980(gp) # 80003a0c <Ptr_Glob>
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10, 
800002f8:	00c42503          	lw	a0,12(s0)
800002fc:	00c40613          	addi	a2,s0,12
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
80000300:	0007a783          	lw	a5,0(a5)
} /* Proc_1 */
80000304:	00c12083          	lw	ra,12(sp)
80000308:	00412483          	lw	s1,4(sp)
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
8000030c:	00f42023          	sw	a5,0(s0)
} /* Proc_1 */
80000310:	00812403          	lw	s0,8(sp)
80000314:	00012903          	lw	s2,0(sp)
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10, 
80000318:	00a00593          	li	a1,10
} /* Proc_1 */
8000031c:	01010113          	addi	sp,sp,16
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10, 
80000320:	7b80006f          	j	80000ad8 <Proc_7>

80000324 <Proc_4>:
/*******/
    /* executed once */
{
  Boolean Bool_Loc;

  Bool_Loc = Ch_1_Glob == 'A';
80000324:	8351c783          	lbu	a5,-1995(gp) # 800039fd <Ch_1_Glob>
  Bool_Glob = Bool_Loc | Bool_Glob;
80000328:	8381a683          	lw	a3,-1992(gp) # 80003a00 <Bool_Glob>
  Bool_Loc = Ch_1_Glob == 'A';
8000032c:	fbf78793          	addi	a5,a5,-65
80000330:	0017b793          	seqz	a5,a5
  Bool_Glob = Bool_Loc | Bool_Glob;
80000334:	00d7e7b3          	or	a5,a5,a3
80000338:	82f1ac23          	sw	a5,-1992(gp) # 80003a00 <Bool_Glob>
  Ch_2_Glob = 'B';
8000033c:	04200713          	li	a4,66
80000340:	82e18a23          	sb	a4,-1996(gp) # 800039fc <Ch_2_Glob>
} /* Proc_4 */
80000344:	00008067          	ret

80000348 <Proc_5>:

Proc_5 () /* without parameters */
/*******/
    /* executed once */
{
  Ch_1_Glob = 'A';
80000348:	04100713          	li	a4,65
8000034c:	82e18aa3          	sb	a4,-1995(gp) # 800039fd <Ch_1_Glob>
  Bool_Glob = false;
80000350:	8201ac23          	sw	zero,-1992(gp) # 80003a00 <Bool_Glob>
} /* Proc_5 */
80000354:	00008067          	ret

80000358 <main2>:
{
80000358:	f6010113          	addi	sp,sp,-160
  Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
8000035c:	03000513          	li	a0,48
{
80000360:	08112e23          	sw	ra,156(sp)
80000364:	08812c23          	sw	s0,152(sp)
80000368:	07812c23          	sw	s8,120(sp)
8000036c:	07b12623          	sw	s11,108(sp)
80000370:	08912a23          	sw	s1,148(sp)
80000374:	09212823          	sw	s2,144(sp)
80000378:	09312623          	sw	s3,140(sp)
8000037c:	09412423          	sw	s4,136(sp)
80000380:	09512223          	sw	s5,132(sp)
80000384:	09612023          	sw	s6,128(sp)
80000388:	07712e23          	sw	s7,124(sp)
8000038c:	07912a23          	sw	s9,116(sp)
80000390:	07a12823          	sw	s10,112(sp)
  Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
80000394:	259000ef          	jal	ra,80000dec <malloc>
80000398:	84a1a023          	sw	a0,-1984(gp) # 80003a08 <Next_Ptr_Glob>
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
8000039c:	03000513          	li	a0,48
800003a0:	24d000ef          	jal	ra,80000dec <malloc>
  Ptr_Glob->Ptr_Comp                    = Next_Ptr_Glob;
800003a4:	8401a783          	lw	a5,-1984(gp) # 80003a08 <Next_Ptr_Glob>
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
800003a8:	84a1a223          	sw	a0,-1980(gp) # 80003a0c <Ptr_Glob>
  Ptr_Glob->Ptr_Comp                    = Next_Ptr_Glob;
800003ac:	00f52023          	sw	a5,0(a0)
  Ptr_Glob->variant.var_1.Enum_Comp     = Ident_3;
800003b0:	00200793          	li	a5,2
800003b4:	00f52423          	sw	a5,8(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp, 
800003b8:	800035b7          	lui	a1,0x80003
  Ptr_Glob->variant.var_1.Int_Comp      = 40;
800003bc:	02800793          	li	a5,40
800003c0:	00f52623          	sw	a5,12(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp, 
800003c4:	01f00613          	li	a2,31
800003c8:	21058593          	addi	a1,a1,528 # 80003210 <_stack_start+0xffffc820>
  Ptr_Glob->Discr                       = Ident_1;
800003cc:	00052223          	sw	zero,4(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp, 
800003d0:	01050513          	addi	a0,a0,16
800003d4:	399000ef          	jal	ra,80000f6c <memcpy>
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
800003d8:	80003737          	lui	a4,0x80003
800003dc:	77870793          	addi	a5,a4,1912 # 80003778 <_stack_start+0xffffcd88>
800003e0:	77872e03          	lw	t3,1912(a4)
800003e4:	0047a303          	lw	t1,4(a5)
800003e8:	0087a883          	lw	a7,8(a5)
800003ec:	00c7a803          	lw	a6,12(a5)
800003f0:	0107a583          	lw	a1,16(a5)
800003f4:	0147a603          	lw	a2,20(a5)
800003f8:	0187a683          	lw	a3,24(a5)
800003fc:	01c7d703          	lhu	a4,28(a5)
80000400:	01e7c783          	lbu	a5,30(a5)
  Arr_2_Glob [8][7] = 10;
80000404:	80004db7          	lui	s11,0x80004
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
80000408:	02e11e23          	sh	a4,60(sp)
8000040c:	02f10f23          	sb	a5,62(sp)
  Arr_2_Glob [8][7] = 10;
80000410:	adcd8713          	addi	a4,s11,-1316 # 80003adc <_stack_start+0xffffd0ec>
80000414:	00a00793          	li	a5,10
  printf ("\n");
80000418:	00a00513          	li	a0,10
  Arr_2_Glob [8][7] = 10;
8000041c:	64f72e23          	sw	a5,1628(a4)
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
80000420:	03c12023          	sw	t3,32(sp)
80000424:	02612223          	sw	t1,36(sp)
80000428:	03112423          	sw	a7,40(sp)
8000042c:	03012623          	sw	a6,44(sp)
80000430:	02b12823          	sw	a1,48(sp)
80000434:	02c12a23          	sw	a2,52(sp)
80000438:	02d12c23          	sw	a3,56(sp)
  printf ("\n");
8000043c:	0dd000ef          	jal	ra,80000d18 <putchar>
  printf ("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
80000440:	80003537          	lui	a0,0x80003
80000444:	23050513          	addi	a0,a0,560 # 80003230 <_stack_start+0xffffc840>
80000448:	2e1000ef          	jal	ra,80000f28 <puts>
  printf ("\n");
8000044c:	00a00513          	li	a0,10
80000450:	0c9000ef          	jal	ra,80000d18 <putchar>
  if (Reg)
80000454:	8301a783          	lw	a5,-2000(gp) # 800039f8 <Reg>
80000458:	62078c63          	beqz	a5,80000a90 <main2+0x738>
    printf ("Program compiled with 'register' attribute\n");
8000045c:	80003537          	lui	a0,0x80003
80000460:	26050513          	addi	a0,a0,608 # 80003260 <_stack_start+0xffffc870>
80000464:	2c5000ef          	jal	ra,80000f28 <puts>
    printf ("\n");
80000468:	00a00513          	li	a0,10
8000046c:	0ad000ef          	jal	ra,80000d18 <putchar>
  printf ("Please give the number of runs through the benchmark: ");
80000470:	80003537          	lui	a0,0x80003
80000474:	2bc50513          	addi	a0,a0,700 # 800032bc <_stack_start+0xffffc8cc>
80000478:	19d000ef          	jal	ra,80000e14 <printf>
  printf ("\n");
8000047c:	00a00513          	li	a0,10
80000480:	099000ef          	jal	ra,80000d18 <putchar>
  printf ("Execution starts, %d runs through Dhrystone\n", Number_Of_Runs);
80000484:	80003537          	lui	a0,0x80003
80000488:	0c800593          	li	a1,200
8000048c:	2f450513          	addi	a0,a0,756 # 800032f4 <_stack_start+0xffffc904>
80000490:	185000ef          	jal	ra,80000e14 <printf>
  Begin_Time = clock();
80000494:	cddff0ef          	jal	ra,80000170 <clock>
80000498:	80003437          	lui	s0,0x80003
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
8000049c:	79842783          	lw	a5,1944(s0) # 80003798 <_stack_start+0xffffcda8>
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
800004a0:	80003d37          	lui	s10,0x80003
800004a4:	7b8d2b83          	lw	s7,1976(s10) # 800037b8 <_stack_start+0xffffcdc8>
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
800004a8:	00f12423          	sw	a5,8(sp)
  Begin_Time = clock();
800004ac:	82a1a623          	sw	a0,-2004(gp) # 800039f4 <Begin_Time>
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
800004b0:	00100993          	li	s3,1
800004b4:	79840413          	addi	s0,s0,1944
    Int_1_Loc = 2;
800004b8:	00200493          	li	s1,2
    Proc_5();
800004bc:	e8dff0ef          	jal	ra,80000348 <Proc_5>
    Proc_4();
800004c0:	e65ff0ef          	jal	ra,80000324 <Proc_4>
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
800004c4:	01e44783          	lbu	a5,30(s0)
800004c8:	01442603          	lw	a2,20(s0)
800004cc:	00442e03          	lw	t3,4(s0)
800004d0:	00842303          	lw	t1,8(s0)
800004d4:	00c42883          	lw	a7,12(s0)
800004d8:	01042803          	lw	a6,16(s0)
800004dc:	01842683          	lw	a3,24(s0)
800004e0:	01c45703          	lhu	a4,28(s0)
800004e4:	00812e83          	lw	t4,8(sp)
800004e8:	04f10f23          	sb	a5,94(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
800004ec:	04010593          	addi	a1,sp,64
    Enum_Loc = Ident_2;
800004f0:	00100793          	li	a5,1
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
800004f4:	02010513          	addi	a0,sp,32
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
800004f8:	04c12a23          	sw	a2,84(sp)
    Enum_Loc = Ident_2;
800004fc:	00f12e23          	sw	a5,28(sp)
    Int_1_Loc = 2;
80000500:	00912a23          	sw	s1,20(sp)
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
80000504:	05d12023          	sw	t4,64(sp)
80000508:	05c12223          	sw	t3,68(sp)
8000050c:	04612423          	sw	t1,72(sp)
80000510:	05112623          	sw	a7,76(sp)
80000514:	05012823          	sw	a6,80(sp)
80000518:	04d12c23          	sw	a3,88(sp)
8000051c:	04e11e23          	sh	a4,92(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
80000520:	688000ef          	jal	ra,80000ba8 <Func_2>
    while (Int_1_Loc < Int_2_Loc)  /* loop body executed once */
80000524:	01412603          	lw	a2,20(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
80000528:	00153513          	seqz	a0,a0
8000052c:	82a1ac23          	sw	a0,-1992(gp) # 80003a00 <Bool_Glob>
    while (Int_1_Loc < Int_2_Loc)  /* loop body executed once */
80000530:	02c4ca63          	blt	s1,a2,80000564 <main2+0x20c>
      Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
80000534:	00261793          	slli	a5,a2,0x2
80000538:	00c787b3          	add	a5,a5,a2
8000053c:	ffd78793          	addi	a5,a5,-3
      Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
80000540:	00060513          	mv	a0,a2
80000544:	00300593          	li	a1,3
80000548:	01810613          	addi	a2,sp,24
      Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
8000054c:	00f12c23          	sw	a5,24(sp)
      Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
80000550:	588000ef          	jal	ra,80000ad8 <Proc_7>
      Int_1_Loc += 1;
80000554:	01412603          	lw	a2,20(sp)
80000558:	00160613          	addi	a2,a2,1
8000055c:	00c12a23          	sw	a2,20(sp)
    while (Int_1_Loc < Int_2_Loc)  /* loop body executed once */
80000560:	fcc4dae3          	ble	a2,s1,80000534 <main2+0x1dc>
    Proc_8 (Arr_1_Glob, Arr_2_Glob, Int_1_Loc, Int_3_Loc);
80000564:	01812683          	lw	a3,24(sp)
80000568:	84c18513          	addi	a0,gp,-1972 # 80003a14 <Arr_1_Glob>
8000056c:	adcd8593          	addi	a1,s11,-1316
80000570:	578000ef          	jal	ra,80000ae8 <Proc_8>
    Proc_1 (Ptr_Glob);
80000574:	8441a503          	lw	a0,-1980(gp) # 80003a0c <Ptr_Glob>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
80000578:	04100a93          	li	s5,65
    Int_2_Loc = 3;
8000057c:	00300a13          	li	s4,3
    Proc_1 (Ptr_Glob);
80000580:	c49ff0ef          	jal	ra,800001c8 <Proc_1>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
80000584:	8341c703          	lbu	a4,-1996(gp) # 800039fc <Ch_2_Glob>
80000588:	04000793          	li	a5,64
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
8000058c:	7b8d0c93          	addi	s9,s10,1976
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
80000590:	02e7f463          	bleu	a4,a5,800005b8 <main2+0x260>
      if (Enum_Loc == Func_1 (Ch_Index, 'C'))
80000594:	000a8513          	mv	a0,s5
80000598:	04300593          	li	a1,67
8000059c:	5ec000ef          	jal	ra,80000b88 <Func_1>
800005a0:	01c12783          	lw	a5,28(sp)
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
800005a4:	001a8713          	addi	a4,s5,1
      if (Enum_Loc == Func_1 (Ch_Index, 'C'))
800005a8:	46f50e63          	beq	a0,a5,80000a24 <main2+0x6cc>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
800005ac:	8341c783          	lbu	a5,-1996(gp) # 800039fc <Ch_2_Glob>
800005b0:	0ff77a93          	andi	s5,a4,255
800005b4:	ff57f0e3          	bleu	s5,a5,80000594 <main2+0x23c>
    Int_2_Loc = Int_2_Loc * Int_1_Loc;
800005b8:	01412583          	lw	a1,20(sp)
800005bc:	000a0513          	mv	a0,s4
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
800005c0:	00198993          	addi	s3,s3,1
    Int_2_Loc = Int_2_Loc * Int_1_Loc;
800005c4:	2c5020ef          	jal	ra,80003088 <__mulsi3>
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
800005c8:	01812a83          	lw	s5,24(sp)
    Int_2_Loc = Int_2_Loc * Int_1_Loc;
800005cc:	00a12623          	sw	a0,12(sp)
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
800005d0:	000a8593          	mv	a1,s5
800005d4:	2d9020ef          	jal	ra,800030ac <__divsi3>
800005d8:	00050a13          	mv	s4,a0
    Proc_2 (&Int_1_Loc);
800005dc:	01410513          	addi	a0,sp,20
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
800005e0:	01412a23          	sw	s4,20(sp)
    Proc_2 (&Int_1_Loc);
800005e4:	b99ff0ef          	jal	ra,8000017c <Proc_2>
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
800005e8:	0c900793          	li	a5,201
800005ec:	ecf998e3          	bne	s3,a5,800004bc <main2+0x164>
  End_Time = clock();
800005f0:	b81ff0ef          	jal	ra,80000170 <clock>
  End_Time *= 100;
800005f4:	06400593          	li	a1,100
800005f8:	291020ef          	jal	ra,80003088 <__mulsi3>
800005fc:	82a1a423          	sw	a0,-2008(gp) # 800039f0 <End_Time>
  Begin_Time *= 100;
80000600:	82c1a503          	lw	a0,-2004(gp) # 800039f4 <Begin_Time>
80000604:	06400593          	li	a1,100
  printf ("        should be:   %d\n", 5);
80000608:	80003437          	lui	s0,0x80003
  Begin_Time *= 100;
8000060c:	27d020ef          	jal	ra,80003088 <__mulsi3>
80000610:	82a1a623          	sw	a0,-2004(gp) # 800039f4 <Begin_Time>
  printf ("Execution ends\n");
80000614:	80003537          	lui	a0,0x80003
80000618:	32450513          	addi	a0,a0,804 # 80003324 <_stack_start+0xffffc934>
8000061c:	10d000ef          	jal	ra,80000f28 <puts>
  printf ("\n");
80000620:	00a00513          	li	a0,10
80000624:	6f4000ef          	jal	ra,80000d18 <putchar>
  printf ("Final values of the variables used in the benchmark:\n");
80000628:	80003537          	lui	a0,0x80003
8000062c:	33450513          	addi	a0,a0,820 # 80003334 <_stack_start+0xffffc944>
80000630:	0f9000ef          	jal	ra,80000f28 <puts>
  printf ("\n");
80000634:	00a00513          	li	a0,10
80000638:	6e0000ef          	jal	ra,80000d18 <putchar>
  printf ("Int_Glob:            %d\n", Int_Glob);
8000063c:	83c1a583          	lw	a1,-1988(gp) # 80003a04 <Int_Glob>
80000640:	80003537          	lui	a0,0x80003
80000644:	36c50513          	addi	a0,a0,876 # 8000336c <_stack_start+0xffffc97c>
80000648:	7cc000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 5);
8000064c:	00500593          	li	a1,5
80000650:	38840513          	addi	a0,s0,904 # 80003388 <_stack_start+0xffffc998>
80000654:	7c0000ef          	jal	ra,80000e14 <printf>
  printf ("Bool_Glob:           %d\n", Bool_Glob);
80000658:	8381a583          	lw	a1,-1992(gp) # 80003a00 <Bool_Glob>
8000065c:	80003537          	lui	a0,0x80003
80000660:	3a450513          	addi	a0,a0,932 # 800033a4 <_stack_start+0xffffc9b4>
80000664:	7b0000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 1);
80000668:	00100593          	li	a1,1
8000066c:	38840513          	addi	a0,s0,904
80000670:	7a4000ef          	jal	ra,80000e14 <printf>
  printf ("Ch_1_Glob:           %c\n", Ch_1_Glob);
80000674:	8351c583          	lbu	a1,-1995(gp) # 800039fd <Ch_1_Glob>
80000678:	80003537          	lui	a0,0x80003
8000067c:	3c050513          	addi	a0,a0,960 # 800033c0 <_stack_start+0xffffc9d0>
80000680:	794000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %c\n", 'A');
80000684:	800034b7          	lui	s1,0x80003
80000688:	04100593          	li	a1,65
8000068c:	3dc48513          	addi	a0,s1,988 # 800033dc <_stack_start+0xffffc9ec>
80000690:	784000ef          	jal	ra,80000e14 <printf>
  printf ("Ch_2_Glob:           %c\n", Ch_2_Glob);
80000694:	8341c583          	lbu	a1,-1996(gp) # 800039fc <Ch_2_Glob>
80000698:	80003537          	lui	a0,0x80003
8000069c:	3f850513          	addi	a0,a0,1016 # 800033f8 <_stack_start+0xffffca08>
800006a0:	774000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %c\n", 'B');
800006a4:	04200593          	li	a1,66
800006a8:	3dc48513          	addi	a0,s1,988
800006ac:	768000ef          	jal	ra,80000e14 <printf>
  printf ("Arr_1_Glob[8]:       %d\n", Arr_1_Glob[8]);
800006b0:	84c18793          	addi	a5,gp,-1972 # 80003a14 <Arr_1_Glob>
800006b4:	0207a583          	lw	a1,32(a5)
800006b8:	80003537          	lui	a0,0x80003
800006bc:	41450513          	addi	a0,a0,1044 # 80003414 <_stack_start+0xffffca24>
800006c0:	754000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 7);
800006c4:	00700593          	li	a1,7
800006c8:	38840513          	addi	a0,s0,904
800006cc:	748000ef          	jal	ra,80000e14 <printf>
  printf ("Arr_2_Glob[8][7]:    %d\n", Arr_2_Glob[8][7]);
800006d0:	80004737          	lui	a4,0x80004
800006d4:	adc70713          	addi	a4,a4,-1316 # 80003adc <_stack_start+0xffffd0ec>
800006d8:	65c72583          	lw	a1,1628(a4)
800006dc:	80003537          	lui	a0,0x80003
800006e0:	43050513          	addi	a0,a0,1072 # 80003430 <_stack_start+0xffffca40>
800006e4:	730000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   Number_Of_Runs + 10\n");
800006e8:	80003537          	lui	a0,0x80003
800006ec:	44c50513          	addi	a0,a0,1100 # 8000344c <_stack_start+0xffffca5c>
800006f0:	039000ef          	jal	ra,80000f28 <puts>
  printf ("Ptr_Glob->\n");
800006f4:	80003537          	lui	a0,0x80003
800006f8:	47850513          	addi	a0,a0,1144 # 80003478 <_stack_start+0xffffca88>
800006fc:	02d000ef          	jal	ra,80000f28 <puts>
  printf ("  Ptr_Comp:          %d\n", (int) Ptr_Glob->Ptr_Comp);
80000700:	8441a783          	lw	a5,-1980(gp) # 80003a0c <Ptr_Glob>
80000704:	80003db7          	lui	s11,0x80003
80000708:	484d8513          	addi	a0,s11,1156 # 80003484 <_stack_start+0xffffca94>
8000070c:	0007a583          	lw	a1,0(a5)
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
80000710:	80003bb7          	lui	s7,0x80003
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
80000714:	80003b37          	lui	s6,0x80003
  printf ("  Ptr_Comp:          %d\n", (int) Ptr_Glob->Ptr_Comp);
80000718:	6fc000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   (implementation-dependent)\n");
8000071c:	80003537          	lui	a0,0x80003
80000720:	4a050513          	addi	a0,a0,1184 # 800034a0 <_stack_start+0xffffcab0>
80000724:	005000ef          	jal	ra,80000f28 <puts>
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
80000728:	8441a783          	lw	a5,-1980(gp) # 80003a0c <Ptr_Glob>
8000072c:	4d0b8513          	addi	a0,s7,1232 # 800034d0 <_stack_start+0xffffcae0>
  printf ("  Int_Comp:          %d\n", Ptr_Glob->variant.var_1.Int_Comp);
80000730:	800039b7          	lui	s3,0x80003
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
80000734:	0047a583          	lw	a1,4(a5)
  printf ("  Str_Comp:          %s\n", Ptr_Glob->variant.var_1.Str_Comp);
80000738:	80003937          	lui	s2,0x80003
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
8000073c:	80003cb7          	lui	s9,0x80003
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
80000740:	6d4000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 0);
80000744:	00000593          	li	a1,0
80000748:	38840513          	addi	a0,s0,904
8000074c:	6c8000ef          	jal	ra,80000e14 <printf>
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
80000750:	8441a783          	lw	a5,-1980(gp) # 80003a0c <Ptr_Glob>
80000754:	4ecb0513          	addi	a0,s6,1260 # 800034ec <_stack_start+0xffffcafc>
80000758:	0087a583          	lw	a1,8(a5)
8000075c:	6b8000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 2);
80000760:	00200593          	li	a1,2
80000764:	38840513          	addi	a0,s0,904
80000768:	6ac000ef          	jal	ra,80000e14 <printf>
  printf ("  Int_Comp:          %d\n", Ptr_Glob->variant.var_1.Int_Comp);
8000076c:	8441a783          	lw	a5,-1980(gp) # 80003a0c <Ptr_Glob>
80000770:	50898513          	addi	a0,s3,1288 # 80003508 <_stack_start+0xffffcb18>
80000774:	00c7a583          	lw	a1,12(a5)
80000778:	69c000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 17);
8000077c:	01100593          	li	a1,17
80000780:	38840513          	addi	a0,s0,904
80000784:	690000ef          	jal	ra,80000e14 <printf>
  printf ("  Str_Comp:          %s\n", Ptr_Glob->variant.var_1.Str_Comp);
80000788:	8441a583          	lw	a1,-1980(gp) # 80003a0c <Ptr_Glob>
8000078c:	52490513          	addi	a0,s2,1316 # 80003524 <_stack_start+0xffffcb34>
80000790:	01058593          	addi	a1,a1,16
80000794:	680000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
80000798:	540c8513          	addi	a0,s9,1344 # 80003540 <_stack_start+0xffffcb50>
8000079c:	78c000ef          	jal	ra,80000f28 <puts>
  printf ("Next_Ptr_Glob->\n");
800007a0:	80003537          	lui	a0,0x80003
800007a4:	57450513          	addi	a0,a0,1396 # 80003574 <_stack_start+0xffffcb84>
800007a8:	780000ef          	jal	ra,80000f28 <puts>
  printf ("  Ptr_Comp:          %d\n", (int) Next_Ptr_Glob->Ptr_Comp);
800007ac:	8401a783          	lw	a5,-1984(gp) # 80003a08 <Next_Ptr_Glob>
800007b0:	484d8513          	addi	a0,s11,1156
800007b4:	0007a583          	lw	a1,0(a5)
800007b8:	65c000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   (implementation-dependent), same as above\n");
800007bc:	80003537          	lui	a0,0x80003
800007c0:	58450513          	addi	a0,a0,1412 # 80003584 <_stack_start+0xffffcb94>
800007c4:	764000ef          	jal	ra,80000f28 <puts>
  printf ("  Discr:             %d\n", Next_Ptr_Glob->Discr);
800007c8:	8401a783          	lw	a5,-1984(gp) # 80003a08 <Next_Ptr_Glob>
800007cc:	4d0b8513          	addi	a0,s7,1232
800007d0:	0047a583          	lw	a1,4(a5)
800007d4:	640000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 0);
800007d8:	00000593          	li	a1,0
800007dc:	38840513          	addi	a0,s0,904
800007e0:	634000ef          	jal	ra,80000e14 <printf>
  printf ("  Enum_Comp:         %d\n", Next_Ptr_Glob->variant.var_1.Enum_Comp);
800007e4:	8401a783          	lw	a5,-1984(gp) # 80003a08 <Next_Ptr_Glob>
800007e8:	4ecb0513          	addi	a0,s6,1260
800007ec:	0087a583          	lw	a1,8(a5)
800007f0:	624000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 1);
800007f4:	00100593          	li	a1,1
800007f8:	38840513          	addi	a0,s0,904
800007fc:	618000ef          	jal	ra,80000e14 <printf>
  printf ("  Int_Comp:          %d\n", Next_Ptr_Glob->variant.var_1.Int_Comp);
80000800:	8401a783          	lw	a5,-1984(gp) # 80003a08 <Next_Ptr_Glob>
80000804:	50898513          	addi	a0,s3,1288
80000808:	00c7a583          	lw	a1,12(a5)
8000080c:	608000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 18);
80000810:	01200593          	li	a1,18
80000814:	38840513          	addi	a0,s0,904
80000818:	5fc000ef          	jal	ra,80000e14 <printf>
  printf ("  Str_Comp:          %s\n",
8000081c:	8401a583          	lw	a1,-1984(gp) # 80003a08 <Next_Ptr_Glob>
80000820:	52490513          	addi	a0,s2,1316
80000824:	01058593          	addi	a1,a1,16
80000828:	5ec000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
8000082c:	540c8513          	addi	a0,s9,1344
80000830:	6f8000ef          	jal	ra,80000f28 <puts>
  printf ("Int_1_Loc:           %d\n", Int_1_Loc);
80000834:	01412583          	lw	a1,20(sp)
80000838:	80003537          	lui	a0,0x80003
8000083c:	5c450513          	addi	a0,a0,1476 # 800035c4 <_stack_start+0xffffcbd4>
80000840:	5d4000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 5);
80000844:	00500593          	li	a1,5
80000848:	38840513          	addi	a0,s0,904
8000084c:	5c8000ef          	jal	ra,80000e14 <printf>
    Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
80000850:	00c12703          	lw	a4,12(sp)
  printf ("Int_2_Loc:           %d\n", Int_2_Loc);
80000854:	80003537          	lui	a0,0x80003
80000858:	5e050513          	addi	a0,a0,1504 # 800035e0 <_stack_start+0xffffcbf0>
    Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
8000085c:	41570ab3          	sub	s5,a4,s5
80000860:	003a9793          	slli	a5,s5,0x3
80000864:	41578ab3          	sub	s5,a5,s5
  printf ("Int_2_Loc:           %d\n", Int_2_Loc);
80000868:	414a85b3          	sub	a1,s5,s4
8000086c:	5a8000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 13);
80000870:	00d00593          	li	a1,13
80000874:	38840513          	addi	a0,s0,904
80000878:	59c000ef          	jal	ra,80000e14 <printf>
  printf ("Int_3_Loc:           %d\n", Int_3_Loc);
8000087c:	01812583          	lw	a1,24(sp)
80000880:	80003537          	lui	a0,0x80003
80000884:	5fc50513          	addi	a0,a0,1532 # 800035fc <_stack_start+0xffffcc0c>
80000888:	58c000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 7);
8000088c:	00700593          	li	a1,7
80000890:	38840513          	addi	a0,s0,904
80000894:	580000ef          	jal	ra,80000e14 <printf>
  printf ("Enum_Loc:            %d\n", Enum_Loc);
80000898:	01c12583          	lw	a1,28(sp)
8000089c:	80003537          	lui	a0,0x80003
800008a0:	61850513          	addi	a0,a0,1560 # 80003618 <_stack_start+0xffffcc28>
800008a4:	570000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   %d\n", 1);
800008a8:	00100593          	li	a1,1
800008ac:	38840513          	addi	a0,s0,904
800008b0:	564000ef          	jal	ra,80000e14 <printf>
  printf ("Str_1_Loc:           %s\n", Str_1_Loc);
800008b4:	80003537          	lui	a0,0x80003
800008b8:	02010593          	addi	a1,sp,32
800008bc:	63450513          	addi	a0,a0,1588 # 80003634 <_stack_start+0xffffcc44>
800008c0:	554000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, 1'ST STRING\n");
800008c4:	80003537          	lui	a0,0x80003
800008c8:	65050513          	addi	a0,a0,1616 # 80003650 <_stack_start+0xffffcc60>
800008cc:	65c000ef          	jal	ra,80000f28 <puts>
  printf ("Str_2_Loc:           %s\n", Str_2_Loc);
800008d0:	80003537          	lui	a0,0x80003
800008d4:	04010593          	addi	a1,sp,64
800008d8:	68450513          	addi	a0,a0,1668 # 80003684 <_stack_start+0xffffcc94>
800008dc:	538000ef          	jal	ra,80000e14 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, 2'ND STRING\n");
800008e0:	80003537          	lui	a0,0x80003
800008e4:	6a050513          	addi	a0,a0,1696 # 800036a0 <_stack_start+0xffffccb0>
800008e8:	640000ef          	jal	ra,80000f28 <puts>
  printf ("\n");
800008ec:	00a00513          	li	a0,10
800008f0:	428000ef          	jal	ra,80000d18 <putchar>
  User_Time = End_Time - Begin_Time;
800008f4:	82c1a703          	lw	a4,-2004(gp) # 800039f4 <Begin_Time>
800008f8:	8281a583          	lw	a1,-2008(gp) # 800039f0 <End_Time>
  if (User_Time < Too_Small_Time)
800008fc:	1f300793          	li	a5,499
  User_Time = End_Time - Begin_Time;
80000900:	40e585b3          	sub	a1,a1,a4
80000904:	82b1a223          	sw	a1,-2012(gp) # 800039ec <User_Time>
  if (User_Time < Too_Small_Time)
80000908:	1ab7d063          	ble	a1,a5,80000aa8 <main2+0x750>
	printf ("Clock cycles=%d \n", User_Time);
8000090c:	80003537          	lui	a0,0x80003
80000910:	72c50513          	addi	a0,a0,1836 # 8000372c <_stack_start+0xffffcd3c>
80000914:	500000ef          	jal	ra,80000e14 <printf>
    Microseconds = (float) User_Time * Mic_secs_Per_Second 
80000918:	8241a503          	lw	a0,-2012(gp) # 800039ec <User_Time>
8000091c:	3a4020ef          	jal	ra,80002cc0 <__floatsisf>
80000920:	00050413          	mv	s0,a0
80000924:	4c0020ef          	jal	ra,80002de4 <__extendsfdf2>
80000928:	800047b7          	lui	a5,0x80004
8000092c:	9c87a603          	lw	a2,-1592(a5) # 800039c8 <_stack_start+0xffffcfd8>
80000930:	9cc7a683          	lw	a3,-1588(a5)
80000934:	0ac010ef          	jal	ra,800019e0 <__muldf3>
                        / ((float) CORE_HZ * ((float) Number_Of_Runs));
80000938:	800047b7          	lui	a5,0x80004
8000093c:	9d07a603          	lw	a2,-1584(a5) # 800039d0 <_stack_start+0xffffcfe0>
80000940:	9d47a683          	lw	a3,-1580(a5)
80000944:	08d000ef          	jal	ra,800011d0 <__divdf3>
80000948:	5a8020ef          	jal	ra,80002ef0 <__truncdfsf2>
8000094c:	82a1a023          	sw	a0,-2016(gp) # 800039e8 <Microseconds>
                        / (float) User_Time;
80000950:	800047b7          	lui	a5,0x80004
80000954:	9d87a503          	lw	a0,-1576(a5) # 800039d8 <_stack_start+0xffffcfe8>
80000958:	00040593          	mv	a1,s0
8000095c:	774010ef          	jal	ra,800020d0 <__divsf3>
    Dhrystones_Per_Second = ((float) CORE_HZ * (float) Number_Of_Runs)
80000960:	80a1ae23          	sw	a0,-2020(gp) # 800039e4 <Dhrystones_Per_Second>
    printf ("DMIPS per Mhz:                              ");
80000964:	80003537          	lui	a0,0x80003
80000968:	74050513          	addi	a0,a0,1856 # 80003740 <_stack_start+0xffffcd50>
8000096c:	4a8000ef          	jal	ra,80000e14 <printf>
    float dmips = (1e6f/1757.0f) * Number_Of_Runs / User_Time;
80000970:	8241a503          	lw	a0,-2012(gp) # 800039ec <User_Time>
80000974:	34c020ef          	jal	ra,80002cc0 <__floatsisf>
80000978:	800047b7          	lui	a5,0x80004
8000097c:	00050593          	mv	a1,a0
80000980:	9dc7a503          	lw	a0,-1572(a5) # 800039dc <_stack_start+0xffffcfec>
80000984:	74c010ef          	jal	ra,800020d0 <__divsf3>
80000988:	00050413          	mv	s0,a0
    int dmipsNatural = dmips;
8000098c:	2c4020ef          	jal	ra,80002c50 <__fixsfsi>
80000990:	00050493          	mv	s1,a0
    int dmipsReal = (dmips - dmipsNatural)*100.0f;
80000994:	32c020ef          	jal	ra,80002cc0 <__floatsisf>
80000998:	00050593          	mv	a1,a0
8000099c:	00040513          	mv	a0,s0
800009a0:	639010ef          	jal	ra,800027d8 <__subsf3>
800009a4:	800047b7          	lui	a5,0x80004
800009a8:	9e07a583          	lw	a1,-1568(a5) # 800039e0 <_stack_start+0xffffcff0>
800009ac:	2bd010ef          	jal	ra,80002468 <__mulsf3>
800009b0:	2a0020ef          	jal	ra,80002c50 <__fixsfsi>
800009b4:	00050413          	mv	s0,a0
    printf ("%d.", dmipsNatural);
800009b8:	80003537          	lui	a0,0x80003
800009bc:	00048593          	mv	a1,s1
800009c0:	77050513          	addi	a0,a0,1904 # 80003770 <_stack_start+0xffffcd80>
800009c4:	450000ef          	jal	ra,80000e14 <printf>
    if(dmipsReal < 10) printf("0");
800009c8:	00900793          	li	a5,9
800009cc:	1087d063          	ble	s0,a5,80000acc <main2+0x774>
    printf ("%d", dmipsReal);
800009d0:	80003537          	lui	a0,0x80003
800009d4:	00040593          	mv	a1,s0
800009d8:	77450513          	addi	a0,a0,1908 # 80003774 <_stack_start+0xffffcd84>
800009dc:	438000ef          	jal	ra,80000e14 <printf>
    printf ("\n");
800009e0:	00a00513          	li	a0,10
800009e4:	334000ef          	jal	ra,80000d18 <putchar>
}
800009e8:	09c12083          	lw	ra,156(sp)
800009ec:	09812403          	lw	s0,152(sp)
800009f0:	09412483          	lw	s1,148(sp)
800009f4:	09012903          	lw	s2,144(sp)
800009f8:	08c12983          	lw	s3,140(sp)
800009fc:	08812a03          	lw	s4,136(sp)
80000a00:	08412a83          	lw	s5,132(sp)
80000a04:	08012b03          	lw	s6,128(sp)
80000a08:	07c12b83          	lw	s7,124(sp)
80000a0c:	07812c03          	lw	s8,120(sp)
80000a10:	07412c83          	lw	s9,116(sp)
80000a14:	07012d03          	lw	s10,112(sp)
80000a18:	06c12d83          	lw	s11,108(sp)
80000a1c:	0a010113          	addi	sp,sp,160
80000a20:	00008067          	ret
        Proc_6 (Ident_1, &Enum_Loc);
80000a24:	01c10593          	addi	a1,sp,28
80000a28:	00000513          	li	a0,0
80000a2c:	1e8000ef          	jal	ra,80000c14 <Proc_6>
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
80000a30:	004cae03          	lw	t3,4(s9)
80000a34:	008ca303          	lw	t1,8(s9)
80000a38:	00cca883          	lw	a7,12(s9)
80000a3c:	010ca803          	lw	a6,16(s9)
80000a40:	014ca503          	lw	a0,20(s9)
80000a44:	018ca583          	lw	a1,24(s9)
80000a48:	01ccd603          	lhu	a2,28(s9)
80000a4c:	01ecc703          	lbu	a4,30(s9)
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
80000a50:	8341c783          	lbu	a5,-1996(gp) # 800039fc <Ch_2_Glob>
80000a54:	001a8a93          	addi	s5,s5,1
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
80000a58:	05712023          	sw	s7,64(sp)
80000a5c:	05c12223          	sw	t3,68(sp)
80000a60:	04612423          	sw	t1,72(sp)
80000a64:	05112623          	sw	a7,76(sp)
80000a68:	05012823          	sw	a6,80(sp)
80000a6c:	04a12a23          	sw	a0,84(sp)
80000a70:	04b12c23          	sw	a1,88(sp)
80000a74:	04c11e23          	sh	a2,92(sp)
80000a78:	04e10f23          	sb	a4,94(sp)
        Int_Glob = Run_Index;
80000a7c:	8331ae23          	sw	s3,-1988(gp) # 80003a04 <Int_Glob>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
80000a80:	0ffafa93          	andi	s5,s5,255
80000a84:	00098a13          	mv	s4,s3
80000a88:	b157f6e3          	bleu	s5,a5,80000594 <main2+0x23c>
80000a8c:	b2dff06f          	j	800005b8 <main2+0x260>
    printf ("Program compiled without 'register' attribute\n");
80000a90:	80003537          	lui	a0,0x80003
80000a94:	28c50513          	addi	a0,a0,652 # 8000328c <_stack_start+0xffffc89c>
80000a98:	490000ef          	jal	ra,80000f28 <puts>
    printf ("\n");
80000a9c:	00a00513          	li	a0,10
80000aa0:	278000ef          	jal	ra,80000d18 <putchar>
80000aa4:	9cdff06f          	j	80000470 <main2+0x118>
    printf ("Measured time too small to obtain meaningful results\n");
80000aa8:	80003537          	lui	a0,0x80003
80000aac:	6d450513          	addi	a0,a0,1748 # 800036d4 <_stack_start+0xffffcce4>
80000ab0:	478000ef          	jal	ra,80000f28 <puts>
    printf ("Please increase number of runs\n");
80000ab4:	80003537          	lui	a0,0x80003
80000ab8:	70c50513          	addi	a0,a0,1804 # 8000370c <_stack_start+0xffffcd1c>
80000abc:	46c000ef          	jal	ra,80000f28 <puts>
    printf ("\n");
80000ac0:	00a00513          	li	a0,10
80000ac4:	254000ef          	jal	ra,80000d18 <putchar>
80000ac8:	f21ff06f          	j	800009e8 <main2+0x690>
    if(dmipsReal < 10) printf("0");
80000acc:	03000513          	li	a0,48
80000ad0:	248000ef          	jal	ra,80000d18 <putchar>
80000ad4:	efdff06f          	j	800009d0 <main2+0x678>

80000ad8 <Proc_7>:
One_Fifty       Int_2_Par_Val;
One_Fifty      *Int_Par_Ref;
{
  One_Fifty Int_Loc;

  Int_Loc = Int_1_Par_Val + 2;
80000ad8:	00250513          	addi	a0,a0,2
  *Int_Par_Ref = Int_2_Par_Val + Int_Loc;
80000adc:	00b505b3          	add	a1,a0,a1
80000ae0:	00b62023          	sw	a1,0(a2)
} /* Proc_7 */
80000ae4:	00008067          	ret

80000ae8 <Proc_8>:
    /* Int_Par_Val_2 == 7 */
Arr_1_Dim       Arr_1_Par_Ref;
Arr_2_Dim       Arr_2_Par_Ref;
int             Int_1_Par_Val;
int             Int_2_Par_Val;
{
80000ae8:	fe010113          	addi	sp,sp,-32
80000aec:	01312623          	sw	s3,12(sp)
  REG One_Fifty Int_Index;
  REG One_Fifty Int_Loc;

  Int_Loc = Int_1_Par_Val + 5;
80000af0:	00560993          	addi	s3,a2,5
{
80000af4:	00912a23          	sw	s1,20(sp)
  Arr_1_Par_Ref [Int_Loc] = Int_2_Par_Val;
80000af8:	00299493          	slli	s1,s3,0x2
{
80000afc:	00812c23          	sw	s0,24(sp)
80000b00:	01212823          	sw	s2,16(sp)
80000b04:	00112e23          	sw	ra,28(sp)
  Arr_1_Par_Ref [Int_Loc] = Int_2_Par_Val;
80000b08:	009504b3          	add	s1,a0,s1
{
80000b0c:	00060913          	mv	s2,a2
80000b10:	00058413          	mv	s0,a1
  Arr_1_Par_Ref [Int_Loc+1] = Arr_1_Par_Ref [Int_Loc];
  Arr_1_Par_Ref [Int_Loc+30] = Int_Loc;
80000b14:	0734ac23          	sw	s3,120(s1)
  Arr_1_Par_Ref [Int_Loc] = Int_2_Par_Val;
80000b18:	00d4a023          	sw	a3,0(s1)
  Arr_1_Par_Ref [Int_Loc+1] = Arr_1_Par_Ref [Int_Loc];
80000b1c:	00d4a223          	sw	a3,4(s1)
  for (Int_Index = Int_Loc; Int_Index <= Int_Loc+1; ++Int_Index)
    Arr_2_Par_Ref [Int_Loc] [Int_Index] = Int_Loc;
80000b20:	00098513          	mv	a0,s3
80000b24:	0c800593          	li	a1,200
80000b28:	560020ef          	jal	ra,80003088 <__mulsi3>
80000b2c:	00291913          	slli	s2,s2,0x2
80000b30:	012507b3          	add	a5,a0,s2
80000b34:	00f407b3          	add	a5,s0,a5
  Arr_2_Par_Ref [Int_Loc] [Int_Loc-1] += 1;
80000b38:	0107a703          	lw	a4,16(a5)
    Arr_2_Par_Ref [Int_Loc] [Int_Index] = Int_Loc;
80000b3c:	0137aa23          	sw	s3,20(a5)
80000b40:	0137ac23          	sw	s3,24(a5)
  Arr_2_Par_Ref [Int_Loc] [Int_Loc-1] += 1;
80000b44:	00170713          	addi	a4,a4,1
80000b48:	00e7a823          	sw	a4,16(a5)
  Arr_2_Par_Ref [Int_Loc+20] [Int_Loc] = Arr_1_Par_Ref [Int_Loc];
80000b4c:	0004a783          	lw	a5,0(s1)
80000b50:	00a40433          	add	s0,s0,a0
80000b54:	01240433          	add	s0,s0,s2
80000b58:	00001637          	lui	a2,0x1
80000b5c:	00860433          	add	s0,a2,s0
80000b60:	faf42a23          	sw	a5,-76(s0)
  Int_Glob = 5;
} /* Proc_8 */
80000b64:	01c12083          	lw	ra,28(sp)
80000b68:	01812403          	lw	s0,24(sp)
  Int_Glob = 5;
80000b6c:	00500713          	li	a4,5
80000b70:	82e1ae23          	sw	a4,-1988(gp) # 80003a04 <Int_Glob>
} /* Proc_8 */
80000b74:	01412483          	lw	s1,20(sp)
80000b78:	01012903          	lw	s2,16(sp)
80000b7c:	00c12983          	lw	s3,12(sp)
80000b80:	02010113          	addi	sp,sp,32
80000b84:	00008067          	ret

80000b88 <Func_1>:
    /* second call:     Ch_1_Par_Val == 'A', Ch_2_Par_Val == 'C'    */
    /* third call:      Ch_1_Par_Val == 'B', Ch_2_Par_Val == 'C'    */

Capital_Letter   Ch_1_Par_Val;
Capital_Letter   Ch_2_Par_Val;
{
80000b88:	0ff57513          	andi	a0,a0,255
80000b8c:	0ff5f593          	andi	a1,a1,255
  Capital_Letter        Ch_1_Loc;
  Capital_Letter        Ch_2_Loc;

  Ch_1_Loc = Ch_1_Par_Val;
  Ch_2_Loc = Ch_1_Loc;
  if (Ch_2_Loc != Ch_2_Par_Val)
80000b90:	00b50663          	beq	a0,a1,80000b9c <Func_1+0x14>
    /* then, executed */
    return (Ident_1);
80000b94:	00000513          	li	a0,0
  else  /* not executed */
  {
    Ch_1_Glob = Ch_1_Loc;
    return (Ident_2);
   }
} /* Func_1 */
80000b98:	00008067          	ret
    Ch_1_Glob = Ch_1_Loc;
80000b9c:	82a18aa3          	sb	a0,-1995(gp) # 800039fd <Ch_1_Glob>
    return (Ident_2);
80000ba0:	00100513          	li	a0,1
80000ba4:	00008067          	ret

80000ba8 <Func_2>:
    /* Str_1_Par_Ref == "DHRYSTONE PROGRAM, 1'ST STRING" */
    /* Str_2_Par_Ref == "DHRYSTONE PROGRAM, 2'ND STRING" */

Str_30  Str_1_Par_Ref;
Str_30  Str_2_Par_Ref;
{
80000ba8:	ff010113          	addi	sp,sp,-16
80000bac:	00812423          	sw	s0,8(sp)
80000bb0:	00912223          	sw	s1,4(sp)
80000bb4:	00112623          	sw	ra,12(sp)
80000bb8:	00050413          	mv	s0,a0
80000bbc:	00058493          	mv	s1,a1
  REG One_Thirty        Int_Loc;
      Capital_Letter    Ch_Loc;

  Int_Loc = 2;
  while (Int_Loc <= 2) /* loop body executed once */
    if (Func_1 (Str_1_Par_Ref[Int_Loc],
80000bc0:	0034c583          	lbu	a1,3(s1)
80000bc4:	00244503          	lbu	a0,2(s0)
80000bc8:	fc1ff0ef          	jal	ra,80000b88 <Func_1>
80000bcc:	fe051ae3          	bnez	a0,80000bc0 <Func_2+0x18>
  if (Ch_Loc == 'R')
    /* then, not executed */
    return (true);
  else /* executed */
  {
    if (strcmp (Str_1_Par_Ref, Str_2_Par_Ref) > 0)
80000bd0:	00048593          	mv	a1,s1
80000bd4:	00040513          	mv	a0,s0
80000bd8:	47c000ef          	jal	ra,80001054 <strcmp>
      Int_Loc += 7;
      Int_Glob = Int_Loc;
      return (true);
    }
    else /* executed */
      return (false);
80000bdc:	00000793          	li	a5,0
    if (strcmp (Str_1_Par_Ref, Str_2_Par_Ref) > 0)
80000be0:	00a05863          	blez	a0,80000bf0 <Func_2+0x48>
      Int_Glob = Int_Loc;
80000be4:	00a00713          	li	a4,10
80000be8:	82e1ae23          	sw	a4,-1988(gp) # 80003a04 <Int_Glob>
      return (true);
80000bec:	00100793          	li	a5,1
  } /* if Ch_Loc */
} /* Func_2 */
80000bf0:	00c12083          	lw	ra,12(sp)
80000bf4:	00812403          	lw	s0,8(sp)
80000bf8:	00412483          	lw	s1,4(sp)
80000bfc:	00078513          	mv	a0,a5
80000c00:	01010113          	addi	sp,sp,16
80000c04:	00008067          	ret

80000c08 <Func_3>:
Enumeration Enum_Par_Val;
{
  Enumeration Enum_Loc;

  Enum_Loc = Enum_Par_Val;
  if (Enum_Loc == Ident_3)
80000c08:	ffe50513          	addi	a0,a0,-2
    /* then, executed */
    return (true);
  else /* not executed */
    return (false);
} /* Func_3 */
80000c0c:	00153513          	seqz	a0,a0
80000c10:	00008067          	ret

80000c14 <Proc_6>:
{
80000c14:	ff010113          	addi	sp,sp,-16
80000c18:	00812423          	sw	s0,8(sp)
80000c1c:	00912223          	sw	s1,4(sp)
80000c20:	00112623          	sw	ra,12(sp)
80000c24:	00050413          	mv	s0,a0
80000c28:	00058493          	mv	s1,a1
  if (! Func_3 (Enum_Val_Par))
80000c2c:	fddff0ef          	jal	ra,80000c08 <Func_3>
80000c30:	02050e63          	beqz	a0,80000c6c <Proc_6+0x58>
  *Enum_Ref_Par = Enum_Val_Par;
80000c34:	0084a023          	sw	s0,0(s1)
  switch (Enum_Val_Par)
80000c38:	00100793          	li	a5,1
80000c3c:	04f40063          	beq	s0,a5,80000c7c <Proc_6+0x68>
80000c40:	04040463          	beqz	s0,80000c88 <Proc_6+0x74>
80000c44:	00200713          	li	a4,2
80000c48:	04e40c63          	beq	s0,a4,80000ca0 <Proc_6+0x8c>
80000c4c:	00400793          	li	a5,4
80000c50:	00f41463          	bne	s0,a5,80000c58 <Proc_6+0x44>
      *Enum_Ref_Par = Ident_3;
80000c54:	00e4a023          	sw	a4,0(s1)
} /* Proc_6 */
80000c58:	00c12083          	lw	ra,12(sp)
80000c5c:	00812403          	lw	s0,8(sp)
80000c60:	00412483          	lw	s1,4(sp)
80000c64:	01010113          	addi	sp,sp,16
80000c68:	00008067          	ret
    *Enum_Ref_Par = Ident_4;
80000c6c:	00300793          	li	a5,3
80000c70:	00f4a023          	sw	a5,0(s1)
  switch (Enum_Val_Par)
80000c74:	00100793          	li	a5,1
80000c78:	fcf414e3          	bne	s0,a5,80000c40 <Proc_6+0x2c>
      if (Int_Glob > 100)
80000c7c:	83c1a703          	lw	a4,-1988(gp) # 80003a04 <Int_Glob>
80000c80:	06400793          	li	a5,100
80000c84:	02e7da63          	ble	a4,a5,80000cb8 <Proc_6+0xa4>
} /* Proc_6 */
80000c88:	00c12083          	lw	ra,12(sp)
80000c8c:	00812403          	lw	s0,8(sp)
      *Enum_Ref_Par = Ident_1;
80000c90:	0004a023          	sw	zero,0(s1)
} /* Proc_6 */
80000c94:	00412483          	lw	s1,4(sp)
80000c98:	01010113          	addi	sp,sp,16
80000c9c:	00008067          	ret
80000ca0:	00c12083          	lw	ra,12(sp)
80000ca4:	00812403          	lw	s0,8(sp)
      *Enum_Ref_Par = Ident_2;
80000ca8:	00f4a023          	sw	a5,0(s1)
} /* Proc_6 */
80000cac:	00412483          	lw	s1,4(sp)
80000cb0:	01010113          	addi	sp,sp,16
80000cb4:	00008067          	ret
80000cb8:	00c12083          	lw	ra,12(sp)
80000cbc:	00812403          	lw	s0,8(sp)
      else *Enum_Ref_Par = Ident_4;
80000cc0:	00300793          	li	a5,3
80000cc4:	00f4a023          	sw	a5,0(s1)
} /* Proc_6 */
80000cc8:	00412483          	lw	s1,4(sp)
80000ccc:	01010113          	addi	sp,sp,16
80000cd0:	00008067          	ret

80000cd4 <uart_writeAvailability.constprop.1>:
	return (reg->STATUS >> 16) & 0xFF;
80000cd4:	f00107b7          	lui	a5,0xf0010
80000cd8:	0047a503          	lw	a0,4(a5) # f0010004 <_stack_start+0x70009614>
80000cdc:	01055513          	srli	a0,a0,0x10
}
80000ce0:	0ff57513          	andi	a0,a0,255
80000ce4:	00008067          	ret

80000ce8 <uart_write.constprop.0>:
static void uart_write(Uart_Reg *reg, uint32_t data){
80000ce8:	ff010113          	addi	sp,sp,-16
80000cec:	00812423          	sw	s0,8(sp)
80000cf0:	00112623          	sw	ra,12(sp)
80000cf4:	00050413          	mv	s0,a0
	while(uart_writeAvailability(reg) == 0);
80000cf8:	fddff0ef          	jal	ra,80000cd4 <uart_writeAvailability.constprop.1>
80000cfc:	fe050ee3          	beqz	a0,80000cf8 <uart_write.constprop.0+0x10>
	reg->DATA = data;
80000d00:	f00107b7          	lui	a5,0xf0010
80000d04:	0087a023          	sw	s0,0(a5) # f0010000 <_stack_start+0x70009610>
}
80000d08:	00c12083          	lw	ra,12(sp)
80000d0c:	00812403          	lw	s0,8(sp)
80000d10:	01010113          	addi	sp,sp,16
80000d14:	00008067          	ret

80000d18 <putchar>:
extern char *malloc();
extern int printf(const char *format, ...);
extern void putchar(char c);

void putchar(char c){
	uart_write(UART, c);
80000d18:	fd1ff06f          	j	80000ce8 <uart_write.constprop.0>

80000d1c <printf_s>:
{
	putchar(c);
}

static void printf_s(char *p)
{
80000d1c:	ff010113          	addi	sp,sp,-16
80000d20:	00812423          	sw	s0,8(sp)
80000d24:	00112623          	sw	ra,12(sp)
80000d28:	00050413          	mv	s0,a0
	while (*p)
80000d2c:	00054503          	lbu	a0,0(a0)
80000d30:	00050a63          	beqz	a0,80000d44 <printf_s+0x28>
		putchar(*(p++));
80000d34:	00140413          	addi	s0,s0,1
80000d38:	fe1ff0ef          	jal	ra,80000d18 <putchar>
	while (*p)
80000d3c:	00044503          	lbu	a0,0(s0)
80000d40:	fe051ae3          	bnez	a0,80000d34 <printf_s+0x18>
}
80000d44:	00c12083          	lw	ra,12(sp)
80000d48:	00812403          	lw	s0,8(sp)
80000d4c:	01010113          	addi	sp,sp,16
80000d50:	00008067          	ret

80000d54 <printf_c>:
	putchar(c);
80000d54:	0ff57513          	andi	a0,a0,255
80000d58:	fc1ff06f          	j	80000d18 <putchar>

80000d5c <printf_d>:

static void printf_d(int val)
{
80000d5c:	fd010113          	addi	sp,sp,-48
80000d60:	02912223          	sw	s1,36(sp)
80000d64:	02112623          	sw	ra,44(sp)
80000d68:	02812423          	sw	s0,40(sp)
80000d6c:	03212023          	sw	s2,32(sp)
80000d70:	00050493          	mv	s1,a0
	char buffer[32];
	char *p = buffer;
	if (val < 0) {
80000d74:	06054463          	bltz	a0,80000ddc <printf_d+0x80>
{
80000d78:	00010913          	mv	s2,sp
80000d7c:	00090413          	mv	s0,s2
80000d80:	0240006f          	j	80000da4 <printf_d+0x48>
		printf_c('-');
		val = -val;
	}
	while (val || p == buffer) {
		*(p++) = '0' + val % 10;
80000d84:	3ac020ef          	jal	ra,80003130 <__modsi3>
80000d88:	03050793          	addi	a5,a0,48
80000d8c:	00140413          	addi	s0,s0,1
		val = val / 10;
80000d90:	00048513          	mv	a0,s1
80000d94:	00a00593          	li	a1,10
		*(p++) = '0' + val % 10;
80000d98:	fef40fa3          	sb	a5,-1(s0)
		val = val / 10;
80000d9c:	310020ef          	jal	ra,800030ac <__divsi3>
80000da0:	00050493          	mv	s1,a0
		*(p++) = '0' + val % 10;
80000da4:	00a00593          	li	a1,10
80000da8:	00048513          	mv	a0,s1
	while (val || p == buffer) {
80000dac:	fc049ce3          	bnez	s1,80000d84 <printf_d+0x28>
80000db0:	fd240ae3          	beq	s0,s2,80000d84 <printf_d+0x28>
	}
	while (p != buffer)
		printf_c(*(--p));
80000db4:	fff40413          	addi	s0,s0,-1
80000db8:	00044503          	lbu	a0,0(s0)
80000dbc:	f99ff0ef          	jal	ra,80000d54 <printf_c>
	while (p != buffer)
80000dc0:	ff241ae3          	bne	s0,s2,80000db4 <printf_d+0x58>
}
80000dc4:	02c12083          	lw	ra,44(sp)
80000dc8:	02812403          	lw	s0,40(sp)
80000dcc:	02412483          	lw	s1,36(sp)
80000dd0:	02012903          	lw	s2,32(sp)
80000dd4:	03010113          	addi	sp,sp,48
80000dd8:	00008067          	ret
		printf_c('-');
80000ddc:	02d00513          	li	a0,45
80000de0:	f75ff0ef          	jal	ra,80000d54 <printf_c>
		val = -val;
80000de4:	409004b3          	neg	s1,s1
80000de8:	f91ff06f          	j	80000d78 <printf_d+0x1c>

80000dec <malloc>:
	char *p = heap_memory + heap_memory_used;
80000dec:	8481a703          	lw	a4,-1976(gp) # 80003a10 <heap_memory_used>
	heap_memory_used += size;
80000df0:	00a707b3          	add	a5,a4,a0
	char *p = heap_memory + heap_memory_used;
80000df4:	80006537          	lui	a0,0x80006
	heap_memory_used += size;
80000df8:	84f1a423          	sw	a5,-1976(gp) # 80003a10 <heap_memory_used>
	char *p = heap_memory + heap_memory_used;
80000dfc:	1ec50513          	addi	a0,a0,492 # 800061ec <_stack_start+0xfffff7fc>
	if (heap_memory_used > 1024)
80000e00:	40000693          	li	a3,1024
	char *p = heap_memory + heap_memory_used;
80000e04:	00e50533          	add	a0,a0,a4
	if (heap_memory_used > 1024)
80000e08:	00f6d463          	ble	a5,a3,80000e10 <malloc+0x24>
		asm volatile ("ebreak");
80000e0c:	00100073          	ebreak
}
80000e10:	00008067          	ret

80000e14 <printf>:

int printf(const char *format, ...)
{
80000e14:	fb010113          	addi	sp,sp,-80
80000e18:	01412c23          	sw	s4,24(sp)
80000e1c:	02112623          	sw	ra,44(sp)
80000e20:	02812423          	sw	s0,40(sp)
80000e24:	02912223          	sw	s1,36(sp)
80000e28:	03212023          	sw	s2,32(sp)
80000e2c:	01312e23          	sw	s3,28(sp)
80000e30:	01512a23          	sw	s5,20(sp)
80000e34:	00050a13          	mv	s4,a0
	int i;
	va_list ap;

	va_start(ap, format);

	for (i = 0; format[i]; i++)
80000e38:	00054503          	lbu	a0,0(a0)
{
80000e3c:	04f12223          	sw	a5,68(sp)
	va_start(ap, format);
80000e40:	03410793          	addi	a5,sp,52
{
80000e44:	02b12a23          	sw	a1,52(sp)
80000e48:	02c12c23          	sw	a2,56(sp)
80000e4c:	02d12e23          	sw	a3,60(sp)
80000e50:	04e12023          	sw	a4,64(sp)
80000e54:	05012423          	sw	a6,72(sp)
80000e58:	05112623          	sw	a7,76(sp)
	va_start(ap, format);
80000e5c:	00f12623          	sw	a5,12(sp)
	for (i = 0; format[i]; i++)
80000e60:	02050863          	beqz	a0,80000e90 <printf+0x7c>
80000e64:	00000413          	li	s0,0
		if (format[i] == '%') {
80000e68:	02500a93          	li	s5,37
			while (format[++i]) {
				if (format[i] == 'c') {
80000e6c:	06300493          	li	s1,99
					printf_c(va_arg(ap,int));
					break;
				}
				if (format[i] == 's') {
80000e70:	07300913          	li	s2,115
					printf_s(va_arg(ap,char*));
					break;
				}
				if (format[i] == 'd') {
80000e74:	06400993          	li	s3,100
		if (format[i] == '%') {
80000e78:	03550e63          	beq	a0,s5,80000eb4 <printf+0xa0>
					printf_d(va_arg(ap,int));
					break;
				}
			}
		} else
			printf_c(format[i]);
80000e7c:	ed9ff0ef          	jal	ra,80000d54 <printf_c>
	for (i = 0; format[i]; i++)
80000e80:	00140413          	addi	s0,s0,1
80000e84:	008a07b3          	add	a5,s4,s0
80000e88:	0007c503          	lbu	a0,0(a5)
80000e8c:	fe0516e3          	bnez	a0,80000e78 <printf+0x64>

	va_end(ap);
}
80000e90:	02c12083          	lw	ra,44(sp)
80000e94:	02812403          	lw	s0,40(sp)
80000e98:	02412483          	lw	s1,36(sp)
80000e9c:	02012903          	lw	s2,32(sp)
80000ea0:	01c12983          	lw	s3,28(sp)
80000ea4:	01812a03          	lw	s4,24(sp)
80000ea8:	01412a83          	lw	s5,20(sp)
80000eac:	05010113          	addi	sp,sp,80
80000eb0:	00008067          	ret
80000eb4:	00140693          	addi	a3,s0,1
80000eb8:	00da0733          	add	a4,s4,a3
80000ebc:	0100006f          	j	80000ecc <printf+0xb8>
				if (format[i] == 's') {
80000ec0:	03278c63          	beq	a5,s2,80000ef8 <printf+0xe4>
				if (format[i] == 'd') {
80000ec4:	05378663          	beq	a5,s3,80000f10 <printf+0xfc>
80000ec8:	00168693          	addi	a3,a3,1
			while (format[++i]) {
80000ecc:	00074783          	lbu	a5,0(a4)
80000ed0:	00068413          	mv	s0,a3
80000ed4:	00170713          	addi	a4,a4,1
80000ed8:	fa0784e3          	beqz	a5,80000e80 <printf+0x6c>
				if (format[i] == 'c') {
80000edc:	fe9792e3          	bne	a5,s1,80000ec0 <printf+0xac>
					printf_c(va_arg(ap,int));
80000ee0:	00c12783          	lw	a5,12(sp)
80000ee4:	0007a503          	lw	a0,0(a5)
80000ee8:	00478793          	addi	a5,a5,4
80000eec:	00f12623          	sw	a5,12(sp)
80000ef0:	e65ff0ef          	jal	ra,80000d54 <printf_c>
					break;
80000ef4:	f8dff06f          	j	80000e80 <printf+0x6c>
					printf_s(va_arg(ap,char*));
80000ef8:	00c12783          	lw	a5,12(sp)
80000efc:	0007a503          	lw	a0,0(a5)
80000f00:	00478793          	addi	a5,a5,4
80000f04:	00f12623          	sw	a5,12(sp)
80000f08:	e15ff0ef          	jal	ra,80000d1c <printf_s>
					break;
80000f0c:	f75ff06f          	j	80000e80 <printf+0x6c>
					printf_d(va_arg(ap,int));
80000f10:	00c12783          	lw	a5,12(sp)
80000f14:	0007a503          	lw	a0,0(a5)
80000f18:	00478793          	addi	a5,a5,4
80000f1c:	00f12623          	sw	a5,12(sp)
80000f20:	e3dff0ef          	jal	ra,80000d5c <printf_d>
					break;
80000f24:	f5dff06f          	j	80000e80 <printf+0x6c>

80000f28 <puts>:


int puts(char *s){
80000f28:	ff010113          	addi	sp,sp,-16
80000f2c:	00812423          	sw	s0,8(sp)
80000f30:	00112623          	sw	ra,12(sp)
80000f34:	00050413          	mv	s0,a0
  while (*s) {
80000f38:	00054503          	lbu	a0,0(a0)
80000f3c:	00050a63          	beqz	a0,80000f50 <puts+0x28>
    putchar(*s);
    s++;
80000f40:	00140413          	addi	s0,s0,1
    putchar(*s);
80000f44:	dd5ff0ef          	jal	ra,80000d18 <putchar>
  while (*s) {
80000f48:	00044503          	lbu	a0,0(s0)
80000f4c:	fe051ae3          	bnez	a0,80000f40 <puts+0x18>
  }
  putchar('\n');
80000f50:	00a00513          	li	a0,10
80000f54:	dc5ff0ef          	jal	ra,80000d18 <putchar>
  return 0;
}
80000f58:	00c12083          	lw	ra,12(sp)
80000f5c:	00812403          	lw	s0,8(sp)
80000f60:	00000513          	li	a0,0
80000f64:	01010113          	addi	sp,sp,16
80000f68:	00008067          	ret

80000f6c <memcpy>:
80000f6c:	00a5c7b3          	xor	a5,a1,a0
80000f70:	0037f793          	andi	a5,a5,3
80000f74:	00c50733          	add	a4,a0,a2
80000f78:	00079663          	bnez	a5,80000f84 <memcpy+0x18>
80000f7c:	00300793          	li	a5,3
80000f80:	02c7e463          	bltu	a5,a2,80000fa8 <memcpy+0x3c>
80000f84:	00050793          	mv	a5,a0
80000f88:	00e56c63          	bltu	a0,a4,80000fa0 <memcpy+0x34>
80000f8c:	00008067          	ret
80000f90:	0005c683          	lbu	a3,0(a1)
80000f94:	00178793          	addi	a5,a5,1
80000f98:	00158593          	addi	a1,a1,1
80000f9c:	fed78fa3          	sb	a3,-1(a5)
80000fa0:	fee7e8e3          	bltu	a5,a4,80000f90 <memcpy+0x24>
80000fa4:	00008067          	ret
80000fa8:	00357793          	andi	a5,a0,3
80000fac:	08079263          	bnez	a5,80001030 <memcpy+0xc4>
80000fb0:	00050793          	mv	a5,a0
80000fb4:	ffc77693          	andi	a3,a4,-4
80000fb8:	fe068613          	addi	a2,a3,-32
80000fbc:	08c7f663          	bleu	a2,a5,80001048 <memcpy+0xdc>
80000fc0:	0005a383          	lw	t2,0(a1)
80000fc4:	0045a283          	lw	t0,4(a1)
80000fc8:	0085af83          	lw	t6,8(a1)
80000fcc:	00c5af03          	lw	t5,12(a1)
80000fd0:	0105ae83          	lw	t4,16(a1)
80000fd4:	0145ae03          	lw	t3,20(a1)
80000fd8:	0185a303          	lw	t1,24(a1)
80000fdc:	01c5a883          	lw	a7,28(a1)
80000fe0:	02458593          	addi	a1,a1,36
80000fe4:	02478793          	addi	a5,a5,36
80000fe8:	ffc5a803          	lw	a6,-4(a1)
80000fec:	fc77ae23          	sw	t2,-36(a5)
80000ff0:	fe57a023          	sw	t0,-32(a5)
80000ff4:	fff7a223          	sw	t6,-28(a5)
80000ff8:	ffe7a423          	sw	t5,-24(a5)
80000ffc:	ffd7a623          	sw	t4,-20(a5)
80001000:	ffc7a823          	sw	t3,-16(a5)
80001004:	fe67aa23          	sw	t1,-12(a5)
80001008:	ff17ac23          	sw	a7,-8(a5)
8000100c:	ff07ae23          	sw	a6,-4(a5)
80001010:	fadff06f          	j	80000fbc <memcpy+0x50>
80001014:	0005c683          	lbu	a3,0(a1)
80001018:	00178793          	addi	a5,a5,1
8000101c:	00158593          	addi	a1,a1,1
80001020:	fed78fa3          	sb	a3,-1(a5)
80001024:	0037f693          	andi	a3,a5,3
80001028:	fe0696e3          	bnez	a3,80001014 <memcpy+0xa8>
8000102c:	f89ff06f          	j	80000fb4 <memcpy+0x48>
80001030:	00050793          	mv	a5,a0
80001034:	ff1ff06f          	j	80001024 <memcpy+0xb8>
80001038:	0005a603          	lw	a2,0(a1)
8000103c:	00478793          	addi	a5,a5,4
80001040:	00458593          	addi	a1,a1,4
80001044:	fec7ae23          	sw	a2,-4(a5)
80001048:	fed7e8e3          	bltu	a5,a3,80001038 <memcpy+0xcc>
8000104c:	f4e7eae3          	bltu	a5,a4,80000fa0 <memcpy+0x34>
80001050:	00008067          	ret

80001054 <strcmp>:
80001054:	00b56733          	or	a4,a0,a1
80001058:	fff00393          	li	t2,-1
8000105c:	00377713          	andi	a4,a4,3
80001060:	10071063          	bnez	a4,80001160 <strcmp+0x10c>
80001064:	7f7f87b7          	lui	a5,0x7f7f8
80001068:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <_stack_size+0x7f7f7b7f>
8000106c:	00052603          	lw	a2,0(a0)
80001070:	0005a683          	lw	a3,0(a1)
80001074:	00f672b3          	and	t0,a2,a5
80001078:	00f66333          	or	t1,a2,a5
8000107c:	00f282b3          	add	t0,t0,a5
80001080:	0062e2b3          	or	t0,t0,t1
80001084:	10729263          	bne	t0,t2,80001188 <strcmp+0x134>
80001088:	08d61663          	bne	a2,a3,80001114 <strcmp+0xc0>
8000108c:	00452603          	lw	a2,4(a0)
80001090:	0045a683          	lw	a3,4(a1)
80001094:	00f672b3          	and	t0,a2,a5
80001098:	00f66333          	or	t1,a2,a5
8000109c:	00f282b3          	add	t0,t0,a5
800010a0:	0062e2b3          	or	t0,t0,t1
800010a4:	0c729e63          	bne	t0,t2,80001180 <strcmp+0x12c>
800010a8:	06d61663          	bne	a2,a3,80001114 <strcmp+0xc0>
800010ac:	00852603          	lw	a2,8(a0)
800010b0:	0085a683          	lw	a3,8(a1)
800010b4:	00f672b3          	and	t0,a2,a5
800010b8:	00f66333          	or	t1,a2,a5
800010bc:	00f282b3          	add	t0,t0,a5
800010c0:	0062e2b3          	or	t0,t0,t1
800010c4:	0c729863          	bne	t0,t2,80001194 <strcmp+0x140>
800010c8:	04d61663          	bne	a2,a3,80001114 <strcmp+0xc0>
800010cc:	00c52603          	lw	a2,12(a0)
800010d0:	00c5a683          	lw	a3,12(a1)
800010d4:	00f672b3          	and	t0,a2,a5
800010d8:	00f66333          	or	t1,a2,a5
800010dc:	00f282b3          	add	t0,t0,a5
800010e0:	0062e2b3          	or	t0,t0,t1
800010e4:	0c729263          	bne	t0,t2,800011a8 <strcmp+0x154>
800010e8:	02d61663          	bne	a2,a3,80001114 <strcmp+0xc0>
800010ec:	01052603          	lw	a2,16(a0)
800010f0:	0105a683          	lw	a3,16(a1)
800010f4:	00f672b3          	and	t0,a2,a5
800010f8:	00f66333          	or	t1,a2,a5
800010fc:	00f282b3          	add	t0,t0,a5
80001100:	0062e2b3          	or	t0,t0,t1
80001104:	0a729c63          	bne	t0,t2,800011bc <strcmp+0x168>
80001108:	01450513          	addi	a0,a0,20
8000110c:	01458593          	addi	a1,a1,20
80001110:	f4d60ee3          	beq	a2,a3,8000106c <strcmp+0x18>
80001114:	01061713          	slli	a4,a2,0x10
80001118:	01069793          	slli	a5,a3,0x10
8000111c:	00f71e63          	bne	a4,a5,80001138 <strcmp+0xe4>
80001120:	01065713          	srli	a4,a2,0x10
80001124:	0106d793          	srli	a5,a3,0x10
80001128:	40f70533          	sub	a0,a4,a5
8000112c:	0ff57593          	andi	a1,a0,255
80001130:	02059063          	bnez	a1,80001150 <strcmp+0xfc>
80001134:	00008067          	ret
80001138:	01075713          	srli	a4,a4,0x10
8000113c:	0107d793          	srli	a5,a5,0x10
80001140:	40f70533          	sub	a0,a4,a5
80001144:	0ff57593          	andi	a1,a0,255
80001148:	00059463          	bnez	a1,80001150 <strcmp+0xfc>
8000114c:	00008067          	ret
80001150:	0ff77713          	andi	a4,a4,255
80001154:	0ff7f793          	andi	a5,a5,255
80001158:	40f70533          	sub	a0,a4,a5
8000115c:	00008067          	ret
80001160:	00054603          	lbu	a2,0(a0)
80001164:	0005c683          	lbu	a3,0(a1)
80001168:	00150513          	addi	a0,a0,1
8000116c:	00158593          	addi	a1,a1,1
80001170:	00d61463          	bne	a2,a3,80001178 <strcmp+0x124>
80001174:	fe0616e3          	bnez	a2,80001160 <strcmp+0x10c>
80001178:	40d60533          	sub	a0,a2,a3
8000117c:	00008067          	ret
80001180:	00450513          	addi	a0,a0,4
80001184:	00458593          	addi	a1,a1,4
80001188:	fcd61ce3          	bne	a2,a3,80001160 <strcmp+0x10c>
8000118c:	00000513          	li	a0,0
80001190:	00008067          	ret
80001194:	00850513          	addi	a0,a0,8
80001198:	00858593          	addi	a1,a1,8
8000119c:	fcd612e3          	bne	a2,a3,80001160 <strcmp+0x10c>
800011a0:	00000513          	li	a0,0
800011a4:	00008067          	ret
800011a8:	00c50513          	addi	a0,a0,12
800011ac:	00c58593          	addi	a1,a1,12
800011b0:	fad618e3          	bne	a2,a3,80001160 <strcmp+0x10c>
800011b4:	00000513          	li	a0,0
800011b8:	00008067          	ret
800011bc:	01050513          	addi	a0,a0,16
800011c0:	01058593          	addi	a1,a1,16
800011c4:	f8d61ee3          	bne	a2,a3,80001160 <strcmp+0x10c>
800011c8:	00000513          	li	a0,0
800011cc:	00008067          	ret

800011d0 <__divdf3>:
800011d0:	fb010113          	addi	sp,sp,-80
800011d4:	04812423          	sw	s0,72(sp)
800011d8:	03412c23          	sw	s4,56(sp)
800011dc:	00100437          	lui	s0,0x100
800011e0:	0145da13          	srli	s4,a1,0x14
800011e4:	05212023          	sw	s2,64(sp)
800011e8:	03312e23          	sw	s3,60(sp)
800011ec:	03512a23          	sw	s5,52(sp)
800011f0:	03812423          	sw	s8,40(sp)
800011f4:	fff40413          	addi	s0,s0,-1 # fffff <_stack_size+0xffbff>
800011f8:	04112623          	sw	ra,76(sp)
800011fc:	04912223          	sw	s1,68(sp)
80001200:	03612823          	sw	s6,48(sp)
80001204:	03712623          	sw	s7,44(sp)
80001208:	03912223          	sw	s9,36(sp)
8000120c:	03a12023          	sw	s10,32(sp)
80001210:	01b12e23          	sw	s11,28(sp)
80001214:	7ffa7a13          	andi	s4,s4,2047
80001218:	00050913          	mv	s2,a0
8000121c:	00060c13          	mv	s8,a2
80001220:	00068a93          	mv	s5,a3
80001224:	00b47433          	and	s0,s0,a1
80001228:	01f5d993          	srli	s3,a1,0x1f
8000122c:	0a0a0663          	beqz	s4,800012d8 <__divdf3+0x108>
80001230:	7ff00793          	li	a5,2047
80001234:	10fa0463          	beq	s4,a5,8000133c <__divdf3+0x16c>
80001238:	00341413          	slli	s0,s0,0x3
8000123c:	008007b7          	lui	a5,0x800
80001240:	00f46433          	or	s0,s0,a5
80001244:	01d55b13          	srli	s6,a0,0x1d
80001248:	008b6b33          	or	s6,s6,s0
8000124c:	00351493          	slli	s1,a0,0x3
80001250:	c01a0a13          	addi	s4,s4,-1023
80001254:	00000b93          	li	s7,0
80001258:	014ad513          	srli	a0,s5,0x14
8000125c:	00100937          	lui	s2,0x100
80001260:	fff90913          	addi	s2,s2,-1 # fffff <_stack_size+0xffbff>
80001264:	7ff57513          	andi	a0,a0,2047
80001268:	01597933          	and	s2,s2,s5
8000126c:	000c0593          	mv	a1,s8
80001270:	01fada93          	srli	s5,s5,0x1f
80001274:	10050263          	beqz	a0,80001378 <__divdf3+0x1a8>
80001278:	7ff00793          	li	a5,2047
8000127c:	16f50263          	beq	a0,a5,800013e0 <__divdf3+0x210>
80001280:	00800437          	lui	s0,0x800
80001284:	00391913          	slli	s2,s2,0x3
80001288:	00896933          	or	s2,s2,s0
8000128c:	01dc5413          	srli	s0,s8,0x1d
80001290:	01246433          	or	s0,s0,s2
80001294:	003c1593          	slli	a1,s8,0x3
80001298:	c0150513          	addi	a0,a0,-1023
8000129c:	00000793          	li	a5,0
800012a0:	002b9713          	slli	a4,s7,0x2
800012a4:	00f76733          	or	a4,a4,a5
800012a8:	fff70713          	addi	a4,a4,-1
800012ac:	00e00693          	li	a3,14
800012b0:	0159c933          	xor	s2,s3,s5
800012b4:	40aa0a33          	sub	s4,s4,a0
800012b8:	16e6e063          	bltu	a3,a4,80001418 <__divdf3+0x248>
800012bc:	00002697          	auipc	a3,0x2
800012c0:	51c68693          	addi	a3,a3,1308 # 800037d8 <end+0x62c>
800012c4:	00271713          	slli	a4,a4,0x2
800012c8:	00d70733          	add	a4,a4,a3
800012cc:	00072703          	lw	a4,0(a4)
800012d0:	00d70733          	add	a4,a4,a3
800012d4:	00070067          	jr	a4
800012d8:	00a46b33          	or	s6,s0,a0
800012dc:	060b0e63          	beqz	s6,80001358 <__divdf3+0x188>
800012e0:	04040063          	beqz	s0,80001320 <__divdf3+0x150>
800012e4:	00040513          	mv	a0,s0
800012e8:	679010ef          	jal	ra,80003160 <__clzsi2>
800012ec:	ff550793          	addi	a5,a0,-11
800012f0:	01c00713          	li	a4,28
800012f4:	02f74c63          	blt	a4,a5,8000132c <__divdf3+0x15c>
800012f8:	01d00b13          	li	s6,29
800012fc:	ff850493          	addi	s1,a0,-8
80001300:	40fb0b33          	sub	s6,s6,a5
80001304:	00941433          	sll	s0,s0,s1
80001308:	01695b33          	srl	s6,s2,s6
8000130c:	008b6b33          	or	s6,s6,s0
80001310:	009914b3          	sll	s1,s2,s1
80001314:	c0d00a13          	li	s4,-1011
80001318:	40aa0a33          	sub	s4,s4,a0
8000131c:	f39ff06f          	j	80001254 <__divdf3+0x84>
80001320:	641010ef          	jal	ra,80003160 <__clzsi2>
80001324:	02050513          	addi	a0,a0,32
80001328:	fc5ff06f          	j	800012ec <__divdf3+0x11c>
8000132c:	fd850413          	addi	s0,a0,-40
80001330:	00891b33          	sll	s6,s2,s0
80001334:	00000493          	li	s1,0
80001338:	fddff06f          	j	80001314 <__divdf3+0x144>
8000133c:	00a46b33          	or	s6,s0,a0
80001340:	020b0463          	beqz	s6,80001368 <__divdf3+0x198>
80001344:	00050493          	mv	s1,a0
80001348:	00040b13          	mv	s6,s0
8000134c:	7ff00a13          	li	s4,2047
80001350:	00300b93          	li	s7,3
80001354:	f05ff06f          	j	80001258 <__divdf3+0x88>
80001358:	00000493          	li	s1,0
8000135c:	00000a13          	li	s4,0
80001360:	00100b93          	li	s7,1
80001364:	ef5ff06f          	j	80001258 <__divdf3+0x88>
80001368:	00000493          	li	s1,0
8000136c:	7ff00a13          	li	s4,2047
80001370:	00200b93          	li	s7,2
80001374:	ee5ff06f          	j	80001258 <__divdf3+0x88>
80001378:	01896433          	or	s0,s2,s8
8000137c:	06040e63          	beqz	s0,800013f8 <__divdf3+0x228>
80001380:	04090063          	beqz	s2,800013c0 <__divdf3+0x1f0>
80001384:	00090513          	mv	a0,s2
80001388:	5d9010ef          	jal	ra,80003160 <__clzsi2>
8000138c:	ff550793          	addi	a5,a0,-11
80001390:	01c00713          	li	a4,28
80001394:	02f74e63          	blt	a4,a5,800013d0 <__divdf3+0x200>
80001398:	01d00413          	li	s0,29
8000139c:	ff850593          	addi	a1,a0,-8
800013a0:	40f40433          	sub	s0,s0,a5
800013a4:	00b91933          	sll	s2,s2,a1
800013a8:	008c5433          	srl	s0,s8,s0
800013ac:	01246433          	or	s0,s0,s2
800013b0:	00bc15b3          	sll	a1,s8,a1
800013b4:	c0d00713          	li	a4,-1011
800013b8:	40a70533          	sub	a0,a4,a0
800013bc:	ee1ff06f          	j	8000129c <__divdf3+0xcc>
800013c0:	000c0513          	mv	a0,s8
800013c4:	59d010ef          	jal	ra,80003160 <__clzsi2>
800013c8:	02050513          	addi	a0,a0,32
800013cc:	fc1ff06f          	j	8000138c <__divdf3+0x1bc>
800013d0:	fd850413          	addi	s0,a0,-40
800013d4:	008c1433          	sll	s0,s8,s0
800013d8:	00000593          	li	a1,0
800013dc:	fd9ff06f          	j	800013b4 <__divdf3+0x1e4>
800013e0:	01896433          	or	s0,s2,s8
800013e4:	02040263          	beqz	s0,80001408 <__divdf3+0x238>
800013e8:	00090413          	mv	s0,s2
800013ec:	7ff00513          	li	a0,2047
800013f0:	00300793          	li	a5,3
800013f4:	eadff06f          	j	800012a0 <__divdf3+0xd0>
800013f8:	00000593          	li	a1,0
800013fc:	00000513          	li	a0,0
80001400:	00100793          	li	a5,1
80001404:	e9dff06f          	j	800012a0 <__divdf3+0xd0>
80001408:	00000593          	li	a1,0
8000140c:	7ff00513          	li	a0,2047
80001410:	00200793          	li	a5,2
80001414:	e8dff06f          	j	800012a0 <__divdf3+0xd0>
80001418:	01646663          	bltu	s0,s6,80001424 <__divdf3+0x254>
8000141c:	488b1263          	bne	s6,s0,800018a0 <__divdf3+0x6d0>
80001420:	48b4e063          	bltu	s1,a1,800018a0 <__divdf3+0x6d0>
80001424:	01fb1693          	slli	a3,s6,0x1f
80001428:	0014d713          	srli	a4,s1,0x1
8000142c:	01f49c13          	slli	s8,s1,0x1f
80001430:	001b5b13          	srli	s6,s6,0x1
80001434:	00e6e4b3          	or	s1,a3,a4
80001438:	00841413          	slli	s0,s0,0x8
8000143c:	0185dc93          	srli	s9,a1,0x18
80001440:	008cecb3          	or	s9,s9,s0
80001444:	010cda93          	srli	s5,s9,0x10
80001448:	010c9793          	slli	a5,s9,0x10
8000144c:	0107d793          	srli	a5,a5,0x10
80001450:	00859d13          	slli	s10,a1,0x8
80001454:	000b0513          	mv	a0,s6
80001458:	000a8593          	mv	a1,s5
8000145c:	00f12223          	sw	a5,4(sp)
80001460:	455010ef          	jal	ra,800030b4 <__udivsi3>
80001464:	00050593          	mv	a1,a0
80001468:	00050b93          	mv	s7,a0
8000146c:	010c9513          	slli	a0,s9,0x10
80001470:	01055513          	srli	a0,a0,0x10
80001474:	415010ef          	jal	ra,80003088 <__mulsi3>
80001478:	00050413          	mv	s0,a0
8000147c:	000a8593          	mv	a1,s5
80001480:	000b0513          	mv	a0,s6
80001484:	479010ef          	jal	ra,800030fc <__umodsi3>
80001488:	01051513          	slli	a0,a0,0x10
8000148c:	0104d713          	srli	a4,s1,0x10
80001490:	00a76533          	or	a0,a4,a0
80001494:	000b8993          	mv	s3,s7
80001498:	00857e63          	bleu	s0,a0,800014b4 <__divdf3+0x2e4>
8000149c:	01950533          	add	a0,a0,s9
800014a0:	fffb8993          	addi	s3,s7,-1
800014a4:	01956863          	bltu	a0,s9,800014b4 <__divdf3+0x2e4>
800014a8:	00857663          	bleu	s0,a0,800014b4 <__divdf3+0x2e4>
800014ac:	ffeb8993          	addi	s3,s7,-2
800014b0:	01950533          	add	a0,a0,s9
800014b4:	40850433          	sub	s0,a0,s0
800014b8:	000a8593          	mv	a1,s5
800014bc:	00040513          	mv	a0,s0
800014c0:	3f5010ef          	jal	ra,800030b4 <__udivsi3>
800014c4:	00050593          	mv	a1,a0
800014c8:	00050b93          	mv	s7,a0
800014cc:	010c9513          	slli	a0,s9,0x10
800014d0:	01055513          	srli	a0,a0,0x10
800014d4:	3b5010ef          	jal	ra,80003088 <__mulsi3>
800014d8:	00050b13          	mv	s6,a0
800014dc:	000a8593          	mv	a1,s5
800014e0:	00040513          	mv	a0,s0
800014e4:	419010ef          	jal	ra,800030fc <__umodsi3>
800014e8:	01049d93          	slli	s11,s1,0x10
800014ec:	01051513          	slli	a0,a0,0x10
800014f0:	010ddd93          	srli	s11,s11,0x10
800014f4:	00adedb3          	or	s11,s11,a0
800014f8:	000b8713          	mv	a4,s7
800014fc:	016dfe63          	bleu	s6,s11,80001518 <__divdf3+0x348>
80001500:	019d8db3          	add	s11,s11,s9
80001504:	fffb8713          	addi	a4,s7,-1
80001508:	019de863          	bltu	s11,s9,80001518 <__divdf3+0x348>
8000150c:	016df663          	bleu	s6,s11,80001518 <__divdf3+0x348>
80001510:	ffeb8713          	addi	a4,s7,-2
80001514:	019d8db3          	add	s11,s11,s9
80001518:	01099693          	slli	a3,s3,0x10
8000151c:	000104b7          	lui	s1,0x10
80001520:	00e6e6b3          	or	a3,a3,a4
80001524:	416d8db3          	sub	s11,s11,s6
80001528:	fff48b13          	addi	s6,s1,-1 # ffff <_stack_size+0xfbff>
8000152c:	0166f733          	and	a4,a3,s6
80001530:	016d7b33          	and	s6,s10,s6
80001534:	00070513          	mv	a0,a4
80001538:	000b0593          	mv	a1,s6
8000153c:	0106d413          	srli	s0,a3,0x10
80001540:	00d12623          	sw	a3,12(sp)
80001544:	00e12423          	sw	a4,8(sp)
80001548:	341010ef          	jal	ra,80003088 <__mulsi3>
8000154c:	00a12223          	sw	a0,4(sp)
80001550:	000b0593          	mv	a1,s6
80001554:	00040513          	mv	a0,s0
80001558:	331010ef          	jal	ra,80003088 <__mulsi3>
8000155c:	010d5b93          	srli	s7,s10,0x10
80001560:	00050993          	mv	s3,a0
80001564:	000b8593          	mv	a1,s7
80001568:	00040513          	mv	a0,s0
8000156c:	31d010ef          	jal	ra,80003088 <__mulsi3>
80001570:	00812703          	lw	a4,8(sp)
80001574:	00050413          	mv	s0,a0
80001578:	000b8513          	mv	a0,s7
8000157c:	00070593          	mv	a1,a4
80001580:	309010ef          	jal	ra,80003088 <__mulsi3>
80001584:	00412603          	lw	a2,4(sp)
80001588:	01350533          	add	a0,a0,s3
8000158c:	00c12683          	lw	a3,12(sp)
80001590:	01065713          	srli	a4,a2,0x10
80001594:	00a70733          	add	a4,a4,a0
80001598:	01377463          	bleu	s3,a4,800015a0 <__divdf3+0x3d0>
8000159c:	00940433          	add	s0,s0,s1
800015a0:	00010537          	lui	a0,0x10
800015a4:	fff50513          	addi	a0,a0,-1 # ffff <_stack_size+0xfbff>
800015a8:	01075493          	srli	s1,a4,0x10
800015ac:	00a779b3          	and	s3,a4,a0
800015b0:	01099993          	slli	s3,s3,0x10
800015b4:	00a67633          	and	a2,a2,a0
800015b8:	008484b3          	add	s1,s1,s0
800015bc:	00c989b3          	add	s3,s3,a2
800015c0:	009de863          	bltu	s11,s1,800015d0 <__divdf3+0x400>
800015c4:	00068413          	mv	s0,a3
800015c8:	049d9463          	bne	s11,s1,80001610 <__divdf3+0x440>
800015cc:	053c7263          	bleu	s3,s8,80001610 <__divdf3+0x440>
800015d0:	01ac0c33          	add	s8,s8,s10
800015d4:	01ac3733          	sltu	a4,s8,s10
800015d8:	01970733          	add	a4,a4,s9
800015dc:	00ed8db3          	add	s11,s11,a4
800015e0:	fff68413          	addi	s0,a3,-1
800015e4:	01bce663          	bltu	s9,s11,800015f0 <__divdf3+0x420>
800015e8:	03bc9463          	bne	s9,s11,80001610 <__divdf3+0x440>
800015ec:	03ac6263          	bltu	s8,s10,80001610 <__divdf3+0x440>
800015f0:	009de663          	bltu	s11,s1,800015fc <__divdf3+0x42c>
800015f4:	01b49e63          	bne	s1,s11,80001610 <__divdf3+0x440>
800015f8:	013c7c63          	bleu	s3,s8,80001610 <__divdf3+0x440>
800015fc:	01ac0c33          	add	s8,s8,s10
80001600:	01ac3733          	sltu	a4,s8,s10
80001604:	01970733          	add	a4,a4,s9
80001608:	ffe68413          	addi	s0,a3,-2
8000160c:	00ed8db3          	add	s11,s11,a4
80001610:	413c09b3          	sub	s3,s8,s3
80001614:	409d84b3          	sub	s1,s11,s1
80001618:	013c37b3          	sltu	a5,s8,s3
8000161c:	40f484b3          	sub	s1,s1,a5
80001620:	fff00593          	li	a1,-1
80001624:	1a9c8863          	beq	s9,s1,800017d4 <__divdf3+0x604>
80001628:	000a8593          	mv	a1,s5
8000162c:	00048513          	mv	a0,s1
80001630:	285010ef          	jal	ra,800030b4 <__udivsi3>
80001634:	00050593          	mv	a1,a0
80001638:	00a12423          	sw	a0,8(sp)
8000163c:	010c9513          	slli	a0,s9,0x10
80001640:	01055513          	srli	a0,a0,0x10
80001644:	245010ef          	jal	ra,80003088 <__mulsi3>
80001648:	00a12223          	sw	a0,4(sp)
8000164c:	000a8593          	mv	a1,s5
80001650:	00048513          	mv	a0,s1
80001654:	2a9010ef          	jal	ra,800030fc <__umodsi3>
80001658:	00812683          	lw	a3,8(sp)
8000165c:	00412703          	lw	a4,4(sp)
80001660:	01051513          	slli	a0,a0,0x10
80001664:	0109d793          	srli	a5,s3,0x10
80001668:	00a7e533          	or	a0,a5,a0
8000166c:	00068d93          	mv	s11,a3
80001670:	00e57e63          	bleu	a4,a0,8000168c <__divdf3+0x4bc>
80001674:	01950533          	add	a0,a0,s9
80001678:	fff68d93          	addi	s11,a3,-1
8000167c:	01956863          	bltu	a0,s9,8000168c <__divdf3+0x4bc>
80001680:	00e57663          	bleu	a4,a0,8000168c <__divdf3+0x4bc>
80001684:	ffe68d93          	addi	s11,a3,-2
80001688:	01950533          	add	a0,a0,s9
8000168c:	40e504b3          	sub	s1,a0,a4
80001690:	000a8593          	mv	a1,s5
80001694:	00048513          	mv	a0,s1
80001698:	21d010ef          	jal	ra,800030b4 <__udivsi3>
8000169c:	00050593          	mv	a1,a0
800016a0:	00a12223          	sw	a0,4(sp)
800016a4:	010c9513          	slli	a0,s9,0x10
800016a8:	01055513          	srli	a0,a0,0x10
800016ac:	1dd010ef          	jal	ra,80003088 <__mulsi3>
800016b0:	00050c13          	mv	s8,a0
800016b4:	000a8593          	mv	a1,s5
800016b8:	00048513          	mv	a0,s1
800016bc:	241010ef          	jal	ra,800030fc <__umodsi3>
800016c0:	01099993          	slli	s3,s3,0x10
800016c4:	00412703          	lw	a4,4(sp)
800016c8:	01051513          	slli	a0,a0,0x10
800016cc:	0109d993          	srli	s3,s3,0x10
800016d0:	00a9e533          	or	a0,s3,a0
800016d4:	00070793          	mv	a5,a4
800016d8:	01857e63          	bleu	s8,a0,800016f4 <__divdf3+0x524>
800016dc:	01950533          	add	a0,a0,s9
800016e0:	fff70793          	addi	a5,a4,-1
800016e4:	01956863          	bltu	a0,s9,800016f4 <__divdf3+0x524>
800016e8:	01857663          	bleu	s8,a0,800016f4 <__divdf3+0x524>
800016ec:	ffe70793          	addi	a5,a4,-2
800016f0:	01950533          	add	a0,a0,s9
800016f4:	010d9493          	slli	s1,s11,0x10
800016f8:	00f4e4b3          	or	s1,s1,a5
800016fc:	01049793          	slli	a5,s1,0x10
80001700:	0107d793          	srli	a5,a5,0x10
80001704:	000b0593          	mv	a1,s6
80001708:	418509b3          	sub	s3,a0,s8
8000170c:	00078513          	mv	a0,a5
80001710:	00f12223          	sw	a5,4(sp)
80001714:	0104dd93          	srli	s11,s1,0x10
80001718:	171010ef          	jal	ra,80003088 <__mulsi3>
8000171c:	000b0593          	mv	a1,s6
80001720:	00050a93          	mv	s5,a0
80001724:	000d8513          	mv	a0,s11
80001728:	161010ef          	jal	ra,80003088 <__mulsi3>
8000172c:	00050c13          	mv	s8,a0
80001730:	000d8593          	mv	a1,s11
80001734:	000b8513          	mv	a0,s7
80001738:	151010ef          	jal	ra,80003088 <__mulsi3>
8000173c:	00412783          	lw	a5,4(sp)
80001740:	00050b13          	mv	s6,a0
80001744:	000b8513          	mv	a0,s7
80001748:	00078593          	mv	a1,a5
8000174c:	13d010ef          	jal	ra,80003088 <__mulsi3>
80001750:	01850533          	add	a0,a0,s8
80001754:	010ad793          	srli	a5,s5,0x10
80001758:	00a78533          	add	a0,a5,a0
8000175c:	01857663          	bleu	s8,a0,80001768 <__divdf3+0x598>
80001760:	000107b7          	lui	a5,0x10
80001764:	00fb0b33          	add	s6,s6,a5
80001768:	000106b7          	lui	a3,0x10
8000176c:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xfbff>
80001770:	01055793          	srli	a5,a0,0x10
80001774:	00d57733          	and	a4,a0,a3
80001778:	01071713          	slli	a4,a4,0x10
8000177c:	00dafab3          	and	s5,s5,a3
80001780:	016787b3          	add	a5,a5,s6
80001784:	01570733          	add	a4,a4,s5
80001788:	00f9e863          	bltu	s3,a5,80001798 <__divdf3+0x5c8>
8000178c:	00048593          	mv	a1,s1
80001790:	04f99063          	bne	s3,a5,800017d0 <__divdf3+0x600>
80001794:	04070063          	beqz	a4,800017d4 <__divdf3+0x604>
80001798:	013c8533          	add	a0,s9,s3
8000179c:	fff48593          	addi	a1,s1,-1
800017a0:	03956463          	bltu	a0,s9,800017c8 <__divdf3+0x5f8>
800017a4:	00f56663          	bltu	a0,a5,800017b0 <__divdf3+0x5e0>
800017a8:	02f51463          	bne	a0,a5,800017d0 <__divdf3+0x600>
800017ac:	02ed7063          	bleu	a4,s10,800017cc <__divdf3+0x5fc>
800017b0:	001d1693          	slli	a3,s10,0x1
800017b4:	01a6bd33          	sltu	s10,a3,s10
800017b8:	019d0cb3          	add	s9,s10,s9
800017bc:	ffe48593          	addi	a1,s1,-2
800017c0:	01950533          	add	a0,a0,s9
800017c4:	00068d13          	mv	s10,a3
800017c8:	00f51463          	bne	a0,a5,800017d0 <__divdf3+0x600>
800017cc:	01a70463          	beq	a4,s10,800017d4 <__divdf3+0x604>
800017d0:	0015e593          	ori	a1,a1,1
800017d4:	3ffa0713          	addi	a4,s4,1023
800017d8:	12e05263          	blez	a4,800018fc <__divdf3+0x72c>
800017dc:	0075f793          	andi	a5,a1,7
800017e0:	02078063          	beqz	a5,80001800 <__divdf3+0x630>
800017e4:	00f5f793          	andi	a5,a1,15
800017e8:	00400693          	li	a3,4
800017ec:	00d78a63          	beq	a5,a3,80001800 <__divdf3+0x630>
800017f0:	00458693          	addi	a3,a1,4
800017f4:	00b6b5b3          	sltu	a1,a3,a1
800017f8:	00b40433          	add	s0,s0,a1
800017fc:	00068593          	mv	a1,a3
80001800:	00741793          	slli	a5,s0,0x7
80001804:	0007da63          	bgez	a5,80001818 <__divdf3+0x648>
80001808:	ff0007b7          	lui	a5,0xff000
8000180c:	fff78793          	addi	a5,a5,-1 # feffffff <_stack_start+0x7eff960f>
80001810:	00f47433          	and	s0,s0,a5
80001814:	400a0713          	addi	a4,s4,1024
80001818:	7fe00793          	li	a5,2046
8000181c:	1ae7c263          	blt	a5,a4,800019c0 <__divdf3+0x7f0>
80001820:	01d41793          	slli	a5,s0,0x1d
80001824:	0035d593          	srli	a1,a1,0x3
80001828:	00b7e7b3          	or	a5,a5,a1
8000182c:	00345413          	srli	s0,s0,0x3
80001830:	001006b7          	lui	a3,0x100
80001834:	fff68693          	addi	a3,a3,-1 # fffff <_stack_size+0xffbff>
80001838:	00d47433          	and	s0,s0,a3
8000183c:	801006b7          	lui	a3,0x80100
80001840:	7ff77713          	andi	a4,a4,2047
80001844:	fff68693          	addi	a3,a3,-1 # 800fffff <_stack_start+0xf960f>
80001848:	01471713          	slli	a4,a4,0x14
8000184c:	00d47433          	and	s0,s0,a3
80001850:	01f91913          	slli	s2,s2,0x1f
80001854:	00e46433          	or	s0,s0,a4
80001858:	01246733          	or	a4,s0,s2
8000185c:	04c12083          	lw	ra,76(sp)
80001860:	04812403          	lw	s0,72(sp)
80001864:	04412483          	lw	s1,68(sp)
80001868:	04012903          	lw	s2,64(sp)
8000186c:	03c12983          	lw	s3,60(sp)
80001870:	03812a03          	lw	s4,56(sp)
80001874:	03412a83          	lw	s5,52(sp)
80001878:	03012b03          	lw	s6,48(sp)
8000187c:	02c12b83          	lw	s7,44(sp)
80001880:	02812c03          	lw	s8,40(sp)
80001884:	02412c83          	lw	s9,36(sp)
80001888:	02012d03          	lw	s10,32(sp)
8000188c:	01c12d83          	lw	s11,28(sp)
80001890:	00078513          	mv	a0,a5
80001894:	00070593          	mv	a1,a4
80001898:	05010113          	addi	sp,sp,80
8000189c:	00008067          	ret
800018a0:	fffa0a13          	addi	s4,s4,-1
800018a4:	00000c13          	li	s8,0
800018a8:	b91ff06f          	j	80001438 <__divdf3+0x268>
800018ac:	00098913          	mv	s2,s3
800018b0:	000b0413          	mv	s0,s6
800018b4:	00048593          	mv	a1,s1
800018b8:	000b8793          	mv	a5,s7
800018bc:	00200713          	li	a4,2
800018c0:	10e78063          	beq	a5,a4,800019c0 <__divdf3+0x7f0>
800018c4:	00300713          	li	a4,3
800018c8:	0ee78263          	beq	a5,a4,800019ac <__divdf3+0x7dc>
800018cc:	00100713          	li	a4,1
800018d0:	f0e792e3          	bne	a5,a4,800017d4 <__divdf3+0x604>
800018d4:	00000413          	li	s0,0
800018d8:	00000793          	li	a5,0
800018dc:	0940006f          	j	80001970 <__divdf3+0x7a0>
800018e0:	000a8913          	mv	s2,s5
800018e4:	fd9ff06f          	j	800018bc <__divdf3+0x6ec>
800018e8:	00080437          	lui	s0,0x80
800018ec:	00000593          	li	a1,0
800018f0:	00000913          	li	s2,0
800018f4:	00300793          	li	a5,3
800018f8:	fc5ff06f          	j	800018bc <__divdf3+0x6ec>
800018fc:	00100693          	li	a3,1
80001900:	40e686b3          	sub	a3,a3,a4
80001904:	03800793          	li	a5,56
80001908:	fcd7c6e3          	blt	a5,a3,800018d4 <__divdf3+0x704>
8000190c:	01f00793          	li	a5,31
80001910:	06d7c463          	blt	a5,a3,80001978 <__divdf3+0x7a8>
80001914:	41ea0a13          	addi	s4,s4,1054
80001918:	014417b3          	sll	a5,s0,s4
8000191c:	00d5d733          	srl	a4,a1,a3
80001920:	01459a33          	sll	s4,a1,s4
80001924:	00e7e7b3          	or	a5,a5,a4
80001928:	01403a33          	snez	s4,s4
8000192c:	0147e7b3          	or	a5,a5,s4
80001930:	00d45433          	srl	s0,s0,a3
80001934:	0077f713          	andi	a4,a5,7
80001938:	02070063          	beqz	a4,80001958 <__divdf3+0x788>
8000193c:	00f7f713          	andi	a4,a5,15
80001940:	00400693          	li	a3,4
80001944:	00d70a63          	beq	a4,a3,80001958 <__divdf3+0x788>
80001948:	00478713          	addi	a4,a5,4
8000194c:	00f737b3          	sltu	a5,a4,a5
80001950:	00f40433          	add	s0,s0,a5
80001954:	00070793          	mv	a5,a4
80001958:	00841713          	slli	a4,s0,0x8
8000195c:	06074a63          	bltz	a4,800019d0 <__divdf3+0x800>
80001960:	01d41713          	slli	a4,s0,0x1d
80001964:	0037d793          	srli	a5,a5,0x3
80001968:	00f767b3          	or	a5,a4,a5
8000196c:	00345413          	srli	s0,s0,0x3
80001970:	00000713          	li	a4,0
80001974:	ebdff06f          	j	80001830 <__divdf3+0x660>
80001978:	fe100793          	li	a5,-31
8000197c:	40e787b3          	sub	a5,a5,a4
80001980:	02000713          	li	a4,32
80001984:	00f457b3          	srl	a5,s0,a5
80001988:	00000513          	li	a0,0
8000198c:	00e68663          	beq	a3,a4,80001998 <__divdf3+0x7c8>
80001990:	43ea0a13          	addi	s4,s4,1086
80001994:	01441533          	sll	a0,s0,s4
80001998:	00b56a33          	or	s4,a0,a1
8000199c:	01403a33          	snez	s4,s4
800019a0:	0147e7b3          	or	a5,a5,s4
800019a4:	00000413          	li	s0,0
800019a8:	f8dff06f          	j	80001934 <__divdf3+0x764>
800019ac:	00080437          	lui	s0,0x80
800019b0:	00000793          	li	a5,0
800019b4:	7ff00713          	li	a4,2047
800019b8:	00000913          	li	s2,0
800019bc:	e75ff06f          	j	80001830 <__divdf3+0x660>
800019c0:	00000413          	li	s0,0
800019c4:	00000793          	li	a5,0
800019c8:	7ff00713          	li	a4,2047
800019cc:	e65ff06f          	j	80001830 <__divdf3+0x660>
800019d0:	00000413          	li	s0,0
800019d4:	00000793          	li	a5,0
800019d8:	00100713          	li	a4,1
800019dc:	e55ff06f          	j	80001830 <__divdf3+0x660>

800019e0 <__muldf3>:
800019e0:	fa010113          	addi	sp,sp,-96
800019e4:	04812c23          	sw	s0,88(sp)
800019e8:	05312623          	sw	s3,76(sp)
800019ec:	00100437          	lui	s0,0x100
800019f0:	0145d993          	srli	s3,a1,0x14
800019f4:	04912a23          	sw	s1,84(sp)
800019f8:	05612023          	sw	s6,64(sp)
800019fc:	03712e23          	sw	s7,60(sp)
80001a00:	03812c23          	sw	s8,56(sp)
80001a04:	fff40413          	addi	s0,s0,-1 # fffff <_stack_size+0xffbff>
80001a08:	04112e23          	sw	ra,92(sp)
80001a0c:	05212823          	sw	s2,80(sp)
80001a10:	05412423          	sw	s4,72(sp)
80001a14:	05512223          	sw	s5,68(sp)
80001a18:	03912a23          	sw	s9,52(sp)
80001a1c:	03a12823          	sw	s10,48(sp)
80001a20:	03b12623          	sw	s11,44(sp)
80001a24:	7ff9f993          	andi	s3,s3,2047
80001a28:	00050493          	mv	s1,a0
80001a2c:	00060b93          	mv	s7,a2
80001a30:	00068c13          	mv	s8,a3
80001a34:	00b47433          	and	s0,s0,a1
80001a38:	01f5db13          	srli	s6,a1,0x1f
80001a3c:	0a098863          	beqz	s3,80001aec <__muldf3+0x10c>
80001a40:	7ff00793          	li	a5,2047
80001a44:	10f98663          	beq	s3,a5,80001b50 <__muldf3+0x170>
80001a48:	00800937          	lui	s2,0x800
80001a4c:	00341413          	slli	s0,s0,0x3
80001a50:	01246433          	or	s0,s0,s2
80001a54:	01d55913          	srli	s2,a0,0x1d
80001a58:	00896933          	or	s2,s2,s0
80001a5c:	00351d13          	slli	s10,a0,0x3
80001a60:	c0198993          	addi	s3,s3,-1023
80001a64:	00000c93          	li	s9,0
80001a68:	014c5513          	srli	a0,s8,0x14
80001a6c:	00100a37          	lui	s4,0x100
80001a70:	fffa0a13          	addi	s4,s4,-1 # fffff <_stack_size+0xffbff>
80001a74:	7ff57513          	andi	a0,a0,2047
80001a78:	018a7a33          	and	s4,s4,s8
80001a7c:	000b8493          	mv	s1,s7
80001a80:	01fc5c13          	srli	s8,s8,0x1f
80001a84:	10050463          	beqz	a0,80001b8c <__muldf3+0x1ac>
80001a88:	7ff00793          	li	a5,2047
80001a8c:	16f50463          	beq	a0,a5,80001bf4 <__muldf3+0x214>
80001a90:	00800437          	lui	s0,0x800
80001a94:	003a1a13          	slli	s4,s4,0x3
80001a98:	008a6a33          	or	s4,s4,s0
80001a9c:	01dbd413          	srli	s0,s7,0x1d
80001aa0:	01446433          	or	s0,s0,s4
80001aa4:	003b9493          	slli	s1,s7,0x3
80001aa8:	c0150513          	addi	a0,a0,-1023
80001aac:	00000793          	li	a5,0
80001ab0:	002c9713          	slli	a4,s9,0x2
80001ab4:	00f76733          	or	a4,a4,a5
80001ab8:	00a989b3          	add	s3,s3,a0
80001abc:	fff70713          	addi	a4,a4,-1
80001ac0:	00e00693          	li	a3,14
80001ac4:	018b4bb3          	xor	s7,s6,s8
80001ac8:	00198a93          	addi	s5,s3,1
80001acc:	16e6e063          	bltu	a3,a4,80001c2c <__muldf3+0x24c>
80001ad0:	00002697          	auipc	a3,0x2
80001ad4:	d4468693          	addi	a3,a3,-700 # 80003814 <end+0x668>
80001ad8:	00271713          	slli	a4,a4,0x2
80001adc:	00d70733          	add	a4,a4,a3
80001ae0:	00072703          	lw	a4,0(a4)
80001ae4:	00d70733          	add	a4,a4,a3
80001ae8:	00070067          	jr	a4
80001aec:	00a46933          	or	s2,s0,a0
80001af0:	06090e63          	beqz	s2,80001b6c <__muldf3+0x18c>
80001af4:	04040063          	beqz	s0,80001b34 <__muldf3+0x154>
80001af8:	00040513          	mv	a0,s0
80001afc:	664010ef          	jal	ra,80003160 <__clzsi2>
80001b00:	ff550793          	addi	a5,a0,-11
80001b04:	01c00713          	li	a4,28
80001b08:	02f74c63          	blt	a4,a5,80001b40 <__muldf3+0x160>
80001b0c:	01d00913          	li	s2,29
80001b10:	ff850d13          	addi	s10,a0,-8
80001b14:	40f90933          	sub	s2,s2,a5
80001b18:	01a41433          	sll	s0,s0,s10
80001b1c:	0124d933          	srl	s2,s1,s2
80001b20:	00896933          	or	s2,s2,s0
80001b24:	01a49d33          	sll	s10,s1,s10
80001b28:	c0d00993          	li	s3,-1011
80001b2c:	40a989b3          	sub	s3,s3,a0
80001b30:	f35ff06f          	j	80001a64 <__muldf3+0x84>
80001b34:	62c010ef          	jal	ra,80003160 <__clzsi2>
80001b38:	02050513          	addi	a0,a0,32
80001b3c:	fc5ff06f          	j	80001b00 <__muldf3+0x120>
80001b40:	fd850913          	addi	s2,a0,-40
80001b44:	01249933          	sll	s2,s1,s2
80001b48:	00000d13          	li	s10,0
80001b4c:	fddff06f          	j	80001b28 <__muldf3+0x148>
80001b50:	00a46933          	or	s2,s0,a0
80001b54:	02090463          	beqz	s2,80001b7c <__muldf3+0x19c>
80001b58:	00050d13          	mv	s10,a0
80001b5c:	00040913          	mv	s2,s0
80001b60:	7ff00993          	li	s3,2047
80001b64:	00300c93          	li	s9,3
80001b68:	f01ff06f          	j	80001a68 <__muldf3+0x88>
80001b6c:	00000d13          	li	s10,0
80001b70:	00000993          	li	s3,0
80001b74:	00100c93          	li	s9,1
80001b78:	ef1ff06f          	j	80001a68 <__muldf3+0x88>
80001b7c:	00000d13          	li	s10,0
80001b80:	7ff00993          	li	s3,2047
80001b84:	00200c93          	li	s9,2
80001b88:	ee1ff06f          	j	80001a68 <__muldf3+0x88>
80001b8c:	017a6433          	or	s0,s4,s7
80001b90:	06040e63          	beqz	s0,80001c0c <__muldf3+0x22c>
80001b94:	040a0063          	beqz	s4,80001bd4 <__muldf3+0x1f4>
80001b98:	000a0513          	mv	a0,s4
80001b9c:	5c4010ef          	jal	ra,80003160 <__clzsi2>
80001ba0:	ff550793          	addi	a5,a0,-11
80001ba4:	01c00713          	li	a4,28
80001ba8:	02f74e63          	blt	a4,a5,80001be4 <__muldf3+0x204>
80001bac:	01d00413          	li	s0,29
80001bb0:	ff850493          	addi	s1,a0,-8
80001bb4:	40f40433          	sub	s0,s0,a5
80001bb8:	009a1a33          	sll	s4,s4,s1
80001bbc:	008bd433          	srl	s0,s7,s0
80001bc0:	01446433          	or	s0,s0,s4
80001bc4:	009b94b3          	sll	s1,s7,s1
80001bc8:	c0d00793          	li	a5,-1011
80001bcc:	40a78533          	sub	a0,a5,a0
80001bd0:	eddff06f          	j	80001aac <__muldf3+0xcc>
80001bd4:	000b8513          	mv	a0,s7
80001bd8:	588010ef          	jal	ra,80003160 <__clzsi2>
80001bdc:	02050513          	addi	a0,a0,32
80001be0:	fc1ff06f          	j	80001ba0 <__muldf3+0x1c0>
80001be4:	fd850413          	addi	s0,a0,-40
80001be8:	008b9433          	sll	s0,s7,s0
80001bec:	00000493          	li	s1,0
80001bf0:	fd9ff06f          	j	80001bc8 <__muldf3+0x1e8>
80001bf4:	017a6433          	or	s0,s4,s7
80001bf8:	02040263          	beqz	s0,80001c1c <__muldf3+0x23c>
80001bfc:	000a0413          	mv	s0,s4
80001c00:	7ff00513          	li	a0,2047
80001c04:	00300793          	li	a5,3
80001c08:	ea9ff06f          	j	80001ab0 <__muldf3+0xd0>
80001c0c:	00000493          	li	s1,0
80001c10:	00000513          	li	a0,0
80001c14:	00100793          	li	a5,1
80001c18:	e99ff06f          	j	80001ab0 <__muldf3+0xd0>
80001c1c:	00000493          	li	s1,0
80001c20:	7ff00513          	li	a0,2047
80001c24:	00200793          	li	a5,2
80001c28:	e89ff06f          	j	80001ab0 <__muldf3+0xd0>
80001c2c:	00010737          	lui	a4,0x10
80001c30:	fff70a13          	addi	s4,a4,-1 # ffff <_stack_size+0xfbff>
80001c34:	010d5c13          	srli	s8,s10,0x10
80001c38:	0104dd93          	srli	s11,s1,0x10
80001c3c:	014d7d33          	and	s10,s10,s4
80001c40:	0144f4b3          	and	s1,s1,s4
80001c44:	000d0593          	mv	a1,s10
80001c48:	00048513          	mv	a0,s1
80001c4c:	00e12823          	sw	a4,16(sp)
80001c50:	438010ef          	jal	ra,80003088 <__mulsi3>
80001c54:	00050c93          	mv	s9,a0
80001c58:	00048593          	mv	a1,s1
80001c5c:	000c0513          	mv	a0,s8
80001c60:	428010ef          	jal	ra,80003088 <__mulsi3>
80001c64:	00a12623          	sw	a0,12(sp)
80001c68:	000d8593          	mv	a1,s11
80001c6c:	000c0513          	mv	a0,s8
80001c70:	418010ef          	jal	ra,80003088 <__mulsi3>
80001c74:	00050b13          	mv	s6,a0
80001c78:	000d0593          	mv	a1,s10
80001c7c:	000d8513          	mv	a0,s11
80001c80:	408010ef          	jal	ra,80003088 <__mulsi3>
80001c84:	00c12683          	lw	a3,12(sp)
80001c88:	010cd793          	srli	a5,s9,0x10
80001c8c:	00d50533          	add	a0,a0,a3
80001c90:	00a78533          	add	a0,a5,a0
80001c94:	00d57663          	bleu	a3,a0,80001ca0 <__muldf3+0x2c0>
80001c98:	01012703          	lw	a4,16(sp)
80001c9c:	00eb0b33          	add	s6,s6,a4
80001ca0:	01055693          	srli	a3,a0,0x10
80001ca4:	01457533          	and	a0,a0,s4
80001ca8:	014cfcb3          	and	s9,s9,s4
80001cac:	01051513          	slli	a0,a0,0x10
80001cb0:	019507b3          	add	a5,a0,s9
80001cb4:	01045c93          	srli	s9,s0,0x10
80001cb8:	01447433          	and	s0,s0,s4
80001cbc:	000d0593          	mv	a1,s10
80001cc0:	00040513          	mv	a0,s0
80001cc4:	00d12a23          	sw	a3,20(sp)
80001cc8:	00f12623          	sw	a5,12(sp)
80001ccc:	3bc010ef          	jal	ra,80003088 <__mulsi3>
80001cd0:	00a12823          	sw	a0,16(sp)
80001cd4:	00040593          	mv	a1,s0
80001cd8:	000c0513          	mv	a0,s8
80001cdc:	3ac010ef          	jal	ra,80003088 <__mulsi3>
80001ce0:	00050a13          	mv	s4,a0
80001ce4:	000c8593          	mv	a1,s9
80001ce8:	000c0513          	mv	a0,s8
80001cec:	39c010ef          	jal	ra,80003088 <__mulsi3>
80001cf0:	00050c13          	mv	s8,a0
80001cf4:	000d0593          	mv	a1,s10
80001cf8:	000c8513          	mv	a0,s9
80001cfc:	38c010ef          	jal	ra,80003088 <__mulsi3>
80001d00:	01012703          	lw	a4,16(sp)
80001d04:	01450533          	add	a0,a0,s4
80001d08:	01412683          	lw	a3,20(sp)
80001d0c:	01075793          	srli	a5,a4,0x10
80001d10:	00a78533          	add	a0,a5,a0
80001d14:	01457663          	bleu	s4,a0,80001d20 <__muldf3+0x340>
80001d18:	000107b7          	lui	a5,0x10
80001d1c:	00fc0c33          	add	s8,s8,a5
80001d20:	00010637          	lui	a2,0x10
80001d24:	01055793          	srli	a5,a0,0x10
80001d28:	01878c33          	add	s8,a5,s8
80001d2c:	fff60793          	addi	a5,a2,-1 # ffff <_stack_size+0xfbff>
80001d30:	00f57a33          	and	s4,a0,a5
80001d34:	00f77733          	and	a4,a4,a5
80001d38:	010a1a13          	slli	s4,s4,0x10
80001d3c:	01095d13          	srli	s10,s2,0x10
80001d40:	00ea0a33          	add	s4,s4,a4
80001d44:	00f97933          	and	s2,s2,a5
80001d48:	01468733          	add	a4,a3,s4
80001d4c:	00090593          	mv	a1,s2
80001d50:	00048513          	mv	a0,s1
80001d54:	00e12823          	sw	a4,16(sp)
80001d58:	00c12e23          	sw	a2,28(sp)
80001d5c:	32c010ef          	jal	ra,80003088 <__mulsi3>
80001d60:	00048593          	mv	a1,s1
80001d64:	00a12c23          	sw	a0,24(sp)
80001d68:	000d0513          	mv	a0,s10
80001d6c:	31c010ef          	jal	ra,80003088 <__mulsi3>
80001d70:	00a12a23          	sw	a0,20(sp)
80001d74:	000d0593          	mv	a1,s10
80001d78:	000d8513          	mv	a0,s11
80001d7c:	30c010ef          	jal	ra,80003088 <__mulsi3>
80001d80:	00050493          	mv	s1,a0
80001d84:	00090593          	mv	a1,s2
80001d88:	000d8513          	mv	a0,s11
80001d8c:	2fc010ef          	jal	ra,80003088 <__mulsi3>
80001d90:	01412683          	lw	a3,20(sp)
80001d94:	01812703          	lw	a4,24(sp)
80001d98:	00d50533          	add	a0,a0,a3
80001d9c:	01075793          	srli	a5,a4,0x10
80001da0:	00a78533          	add	a0,a5,a0
80001da4:	00d57663          	bleu	a3,a0,80001db0 <__muldf3+0x3d0>
80001da8:	01c12603          	lw	a2,28(sp)
80001dac:	00c484b3          	add	s1,s1,a2
80001db0:	000106b7          	lui	a3,0x10
80001db4:	fff68793          	addi	a5,a3,-1 # ffff <_stack_size+0xfbff>
80001db8:	01055d93          	srli	s11,a0,0x10
80001dbc:	009d84b3          	add	s1,s11,s1
80001dc0:	00f57db3          	and	s11,a0,a5
80001dc4:	00f77733          	and	a4,a4,a5
80001dc8:	00090593          	mv	a1,s2
80001dcc:	00040513          	mv	a0,s0
80001dd0:	010d9d93          	slli	s11,s11,0x10
80001dd4:	00ed8db3          	add	s11,s11,a4
80001dd8:	00d12c23          	sw	a3,24(sp)
80001ddc:	2ac010ef          	jal	ra,80003088 <__mulsi3>
80001de0:	00040593          	mv	a1,s0
80001de4:	00a12a23          	sw	a0,20(sp)
80001de8:	000d0513          	mv	a0,s10
80001dec:	29c010ef          	jal	ra,80003088 <__mulsi3>
80001df0:	000d0593          	mv	a1,s10
80001df4:	00050413          	mv	s0,a0
80001df8:	000c8513          	mv	a0,s9
80001dfc:	28c010ef          	jal	ra,80003088 <__mulsi3>
80001e00:	00050d13          	mv	s10,a0
80001e04:	00090593          	mv	a1,s2
80001e08:	000c8513          	mv	a0,s9
80001e0c:	27c010ef          	jal	ra,80003088 <__mulsi3>
80001e10:	01412703          	lw	a4,20(sp)
80001e14:	00850533          	add	a0,a0,s0
80001e18:	01075793          	srli	a5,a4,0x10
80001e1c:	00a78533          	add	a0,a5,a0
80001e20:	00857663          	bleu	s0,a0,80001e2c <__muldf3+0x44c>
80001e24:	01812683          	lw	a3,24(sp)
80001e28:	00dd0d33          	add	s10,s10,a3
80001e2c:	01012783          	lw	a5,16(sp)
80001e30:	000106b7          	lui	a3,0x10
80001e34:	fff68693          	addi	a3,a3,-1 # ffff <_stack_size+0xfbff>
80001e38:	00fb0b33          	add	s6,s6,a5
80001e3c:	00d577b3          	and	a5,a0,a3
80001e40:	00d77733          	and	a4,a4,a3
80001e44:	01079793          	slli	a5,a5,0x10
80001e48:	00e787b3          	add	a5,a5,a4
80001e4c:	014b3a33          	sltu	s4,s6,s4
80001e50:	018787b3          	add	a5,a5,s8
80001e54:	01478433          	add	s0,a5,s4
80001e58:	01bb0b33          	add	s6,s6,s11
80001e5c:	00940733          	add	a4,s0,s1
80001e60:	01bb3db3          	sltu	s11,s6,s11
80001e64:	01b706b3          	add	a3,a4,s11
80001e68:	0187bc33          	sltu	s8,a5,s8
80001e6c:	01443433          	sltu	s0,s0,s4
80001e70:	01055793          	srli	a5,a0,0x10
80001e74:	00973733          	sltu	a4,a4,s1
80001e78:	008c6433          	or	s0,s8,s0
80001e7c:	01b6bdb3          	sltu	s11,a3,s11
80001e80:	00f40433          	add	s0,s0,a5
80001e84:	01b76db3          	or	s11,a4,s11
80001e88:	01b40433          	add	s0,s0,s11
80001e8c:	01a40433          	add	s0,s0,s10
80001e90:	0176d793          	srli	a5,a3,0x17
80001e94:	00941413          	slli	s0,s0,0x9
80001e98:	00f46433          	or	s0,s0,a5
80001e9c:	00c12783          	lw	a5,12(sp)
80001ea0:	009b1493          	slli	s1,s6,0x9
80001ea4:	017b5b13          	srli	s6,s6,0x17
80001ea8:	00f4e4b3          	or	s1,s1,a5
80001eac:	009034b3          	snez	s1,s1
80001eb0:	00969793          	slli	a5,a3,0x9
80001eb4:	0164e4b3          	or	s1,s1,s6
80001eb8:	00f4e4b3          	or	s1,s1,a5
80001ebc:	00741793          	slli	a5,s0,0x7
80001ec0:	1207d263          	bgez	a5,80001fe4 <__muldf3+0x604>
80001ec4:	0014d793          	srli	a5,s1,0x1
80001ec8:	0014f493          	andi	s1,s1,1
80001ecc:	0097e4b3          	or	s1,a5,s1
80001ed0:	01f41793          	slli	a5,s0,0x1f
80001ed4:	00f4e4b3          	or	s1,s1,a5
80001ed8:	00145413          	srli	s0,s0,0x1
80001edc:	3ffa8713          	addi	a4,s5,1023
80001ee0:	10e05663          	blez	a4,80001fec <__muldf3+0x60c>
80001ee4:	0074f793          	andi	a5,s1,7
80001ee8:	02078063          	beqz	a5,80001f08 <__muldf3+0x528>
80001eec:	00f4f793          	andi	a5,s1,15
80001ef0:	00400693          	li	a3,4
80001ef4:	00d78a63          	beq	a5,a3,80001f08 <__muldf3+0x528>
80001ef8:	00448793          	addi	a5,s1,4
80001efc:	0097b4b3          	sltu	s1,a5,s1
80001f00:	00940433          	add	s0,s0,s1
80001f04:	00078493          	mv	s1,a5
80001f08:	00741793          	slli	a5,s0,0x7
80001f0c:	0007da63          	bgez	a5,80001f20 <__muldf3+0x540>
80001f10:	ff0007b7          	lui	a5,0xff000
80001f14:	fff78793          	addi	a5,a5,-1 # feffffff <_stack_start+0x7eff960f>
80001f18:	00f47433          	and	s0,s0,a5
80001f1c:	400a8713          	addi	a4,s5,1024
80001f20:	7fe00793          	li	a5,2046
80001f24:	18e7c663          	blt	a5,a4,800020b0 <__muldf3+0x6d0>
80001f28:	0034da93          	srli	s5,s1,0x3
80001f2c:	01d41493          	slli	s1,s0,0x1d
80001f30:	0154e4b3          	or	s1,s1,s5
80001f34:	00345413          	srli	s0,s0,0x3
80001f38:	001007b7          	lui	a5,0x100
80001f3c:	fff78793          	addi	a5,a5,-1 # fffff <_stack_size+0xffbff>
80001f40:	00f47433          	and	s0,s0,a5
80001f44:	7ff77793          	andi	a5,a4,2047
80001f48:	80100737          	lui	a4,0x80100
80001f4c:	fff70713          	addi	a4,a4,-1 # 800fffff <_stack_start+0xf960f>
80001f50:	01479793          	slli	a5,a5,0x14
80001f54:	00e47433          	and	s0,s0,a4
80001f58:	01fb9b93          	slli	s7,s7,0x1f
80001f5c:	00f46433          	or	s0,s0,a5
80001f60:	017467b3          	or	a5,s0,s7
80001f64:	05c12083          	lw	ra,92(sp)
80001f68:	05812403          	lw	s0,88(sp)
80001f6c:	00048513          	mv	a0,s1
80001f70:	05012903          	lw	s2,80(sp)
80001f74:	05412483          	lw	s1,84(sp)
80001f78:	04c12983          	lw	s3,76(sp)
80001f7c:	04812a03          	lw	s4,72(sp)
80001f80:	04412a83          	lw	s5,68(sp)
80001f84:	04012b03          	lw	s6,64(sp)
80001f88:	03c12b83          	lw	s7,60(sp)
80001f8c:	03812c03          	lw	s8,56(sp)
80001f90:	03412c83          	lw	s9,52(sp)
80001f94:	03012d03          	lw	s10,48(sp)
80001f98:	02c12d83          	lw	s11,44(sp)
80001f9c:	00078593          	mv	a1,a5
80001fa0:	06010113          	addi	sp,sp,96
80001fa4:	00008067          	ret
80001fa8:	000b0b93          	mv	s7,s6
80001fac:	00090413          	mv	s0,s2
80001fb0:	000d0493          	mv	s1,s10
80001fb4:	000c8793          	mv	a5,s9
80001fb8:	00200713          	li	a4,2
80001fbc:	0ee78a63          	beq	a5,a4,800020b0 <__muldf3+0x6d0>
80001fc0:	00300713          	li	a4,3
80001fc4:	0ce78c63          	beq	a5,a4,8000209c <__muldf3+0x6bc>
80001fc8:	00100713          	li	a4,1
80001fcc:	f0e798e3          	bne	a5,a4,80001edc <__muldf3+0x4fc>
80001fd0:	00000413          	li	s0,0
80001fd4:	00000493          	li	s1,0
80001fd8:	0880006f          	j	80002060 <__muldf3+0x680>
80001fdc:	000c0b93          	mv	s7,s8
80001fe0:	fd9ff06f          	j	80001fb8 <__muldf3+0x5d8>
80001fe4:	00098a93          	mv	s5,s3
80001fe8:	ef5ff06f          	j	80001edc <__muldf3+0x4fc>
80001fec:	00100693          	li	a3,1
80001ff0:	40e686b3          	sub	a3,a3,a4
80001ff4:	03800793          	li	a5,56
80001ff8:	fcd7cce3          	blt	a5,a3,80001fd0 <__muldf3+0x5f0>
80001ffc:	01f00793          	li	a5,31
80002000:	06d7c463          	blt	a5,a3,80002068 <__muldf3+0x688>
80002004:	41ea8a93          	addi	s5,s5,1054
80002008:	015417b3          	sll	a5,s0,s5
8000200c:	00d4d733          	srl	a4,s1,a3
80002010:	015494b3          	sll	s1,s1,s5
80002014:	00e7e7b3          	or	a5,a5,a4
80002018:	009034b3          	snez	s1,s1
8000201c:	0097e4b3          	or	s1,a5,s1
80002020:	00d45433          	srl	s0,s0,a3
80002024:	0074f793          	andi	a5,s1,7
80002028:	02078063          	beqz	a5,80002048 <__muldf3+0x668>
8000202c:	00f4f793          	andi	a5,s1,15
80002030:	00400713          	li	a4,4
80002034:	00e78a63          	beq	a5,a4,80002048 <__muldf3+0x668>
80002038:	00448793          	addi	a5,s1,4
8000203c:	0097b4b3          	sltu	s1,a5,s1
80002040:	00940433          	add	s0,s0,s1
80002044:	00078493          	mv	s1,a5
80002048:	00841793          	slli	a5,s0,0x8
8000204c:	0607ca63          	bltz	a5,800020c0 <__muldf3+0x6e0>
80002050:	01d41793          	slli	a5,s0,0x1d
80002054:	0034d493          	srli	s1,s1,0x3
80002058:	0097e4b3          	or	s1,a5,s1
8000205c:	00345413          	srli	s0,s0,0x3
80002060:	00000713          	li	a4,0
80002064:	ed5ff06f          	j	80001f38 <__muldf3+0x558>
80002068:	fe100793          	li	a5,-31
8000206c:	40e787b3          	sub	a5,a5,a4
80002070:	02000613          	li	a2,32
80002074:	00f457b3          	srl	a5,s0,a5
80002078:	00000713          	li	a4,0
8000207c:	00c68663          	beq	a3,a2,80002088 <__muldf3+0x6a8>
80002080:	43ea8a93          	addi	s5,s5,1086
80002084:	01541733          	sll	a4,s0,s5
80002088:	009764b3          	or	s1,a4,s1
8000208c:	009034b3          	snez	s1,s1
80002090:	0097e4b3          	or	s1,a5,s1
80002094:	00000413          	li	s0,0
80002098:	f8dff06f          	j	80002024 <__muldf3+0x644>
8000209c:	00080437          	lui	s0,0x80
800020a0:	00000493          	li	s1,0
800020a4:	7ff00713          	li	a4,2047
800020a8:	00000b93          	li	s7,0
800020ac:	e8dff06f          	j	80001f38 <__muldf3+0x558>
800020b0:	00000413          	li	s0,0
800020b4:	00000493          	li	s1,0
800020b8:	7ff00713          	li	a4,2047
800020bc:	e7dff06f          	j	80001f38 <__muldf3+0x558>
800020c0:	00000413          	li	s0,0
800020c4:	00000493          	li	s1,0
800020c8:	00100713          	li	a4,1
800020cc:	e6dff06f          	j	80001f38 <__muldf3+0x558>

800020d0 <__divsf3>:
800020d0:	fd010113          	addi	sp,sp,-48
800020d4:	02912223          	sw	s1,36(sp)
800020d8:	01512a23          	sw	s5,20(sp)
800020dc:	01755493          	srli	s1,a0,0x17
800020e0:	00800ab7          	lui	s5,0x800
800020e4:	03212023          	sw	s2,32(sp)
800020e8:	01612823          	sw	s6,16(sp)
800020ec:	fffa8a93          	addi	s5,s5,-1 # 7fffff <_stack_size+0x7ffbff>
800020f0:	02112623          	sw	ra,44(sp)
800020f4:	02812423          	sw	s0,40(sp)
800020f8:	01312e23          	sw	s3,28(sp)
800020fc:	01412c23          	sw	s4,24(sp)
80002100:	01712623          	sw	s7,12(sp)
80002104:	01812423          	sw	s8,8(sp)
80002108:	0ff4f493          	andi	s1,s1,255
8000210c:	00058b13          	mv	s6,a1
80002110:	00aafab3          	and	s5,s5,a0
80002114:	01f55913          	srli	s2,a0,0x1f
80002118:	08048863          	beqz	s1,800021a8 <__divsf3+0xd8>
8000211c:	0ff00793          	li	a5,255
80002120:	0af48463          	beq	s1,a5,800021c8 <__divsf3+0xf8>
80002124:	003a9a93          	slli	s5,s5,0x3
80002128:	040007b7          	lui	a5,0x4000
8000212c:	00faeab3          	or	s5,s5,a5
80002130:	f8148493          	addi	s1,s1,-127
80002134:	00000b93          	li	s7,0
80002138:	017b5513          	srli	a0,s6,0x17
8000213c:	00800437          	lui	s0,0x800
80002140:	fff40413          	addi	s0,s0,-1 # 7fffff <_stack_size+0x7ffbff>
80002144:	0ff57513          	andi	a0,a0,255
80002148:	01647433          	and	s0,s0,s6
8000214c:	01fb5b13          	srli	s6,s6,0x1f
80002150:	08050c63          	beqz	a0,800021e8 <__divsf3+0x118>
80002154:	0ff00793          	li	a5,255
80002158:	0af50863          	beq	a0,a5,80002208 <__divsf3+0x138>
8000215c:	00341413          	slli	s0,s0,0x3
80002160:	040007b7          	lui	a5,0x4000
80002164:	00f46433          	or	s0,s0,a5
80002168:	f8150513          	addi	a0,a0,-127
8000216c:	00000793          	li	a5,0
80002170:	002b9713          	slli	a4,s7,0x2
80002174:	00f76733          	or	a4,a4,a5
80002178:	fff70713          	addi	a4,a4,-1
8000217c:	00e00693          	li	a3,14
80002180:	016949b3          	xor	s3,s2,s6
80002184:	40a48a33          	sub	s4,s1,a0
80002188:	0ae6e063          	bltu	a3,a4,80002228 <__divsf3+0x158>
8000218c:	00001697          	auipc	a3,0x1
80002190:	6c468693          	addi	a3,a3,1732 # 80003850 <end+0x6a4>
80002194:	00271713          	slli	a4,a4,0x2
80002198:	00d70733          	add	a4,a4,a3
8000219c:	00072703          	lw	a4,0(a4)
800021a0:	00d70733          	add	a4,a4,a3
800021a4:	00070067          	jr	a4
800021a8:	020a8a63          	beqz	s5,800021dc <__divsf3+0x10c>
800021ac:	000a8513          	mv	a0,s5
800021b0:	7b1000ef          	jal	ra,80003160 <__clzsi2>
800021b4:	ffb50793          	addi	a5,a0,-5
800021b8:	f8a00493          	li	s1,-118
800021bc:	00fa9ab3          	sll	s5,s5,a5
800021c0:	40a484b3          	sub	s1,s1,a0
800021c4:	f71ff06f          	j	80002134 <__divsf3+0x64>
800021c8:	0ff00493          	li	s1,255
800021cc:	00200b93          	li	s7,2
800021d0:	f60a84e3          	beqz	s5,80002138 <__divsf3+0x68>
800021d4:	00300b93          	li	s7,3
800021d8:	f61ff06f          	j	80002138 <__divsf3+0x68>
800021dc:	00000493          	li	s1,0
800021e0:	00100b93          	li	s7,1
800021e4:	f55ff06f          	j	80002138 <__divsf3+0x68>
800021e8:	02040a63          	beqz	s0,8000221c <__divsf3+0x14c>
800021ec:	00040513          	mv	a0,s0
800021f0:	771000ef          	jal	ra,80003160 <__clzsi2>
800021f4:	ffb50793          	addi	a5,a0,-5
800021f8:	00f41433          	sll	s0,s0,a5
800021fc:	f8a00793          	li	a5,-118
80002200:	40a78533          	sub	a0,a5,a0
80002204:	f69ff06f          	j	8000216c <__divsf3+0x9c>
80002208:	0ff00513          	li	a0,255
8000220c:	00200793          	li	a5,2
80002210:	f60400e3          	beqz	s0,80002170 <__divsf3+0xa0>
80002214:	00300793          	li	a5,3
80002218:	f59ff06f          	j	80002170 <__divsf3+0xa0>
8000221c:	00000513          	li	a0,0
80002220:	00100793          	li	a5,1
80002224:	f4dff06f          	j	80002170 <__divsf3+0xa0>
80002228:	00541b13          	slli	s6,s0,0x5
8000222c:	128af663          	bleu	s0,s5,80002358 <__divsf3+0x288>
80002230:	fffa0a13          	addi	s4,s4,-1
80002234:	00000913          	li	s2,0
80002238:	010b5b93          	srli	s7,s6,0x10
8000223c:	00010437          	lui	s0,0x10
80002240:	000b8593          	mv	a1,s7
80002244:	fff40413          	addi	s0,s0,-1 # ffff <_stack_size+0xfbff>
80002248:	000a8513          	mv	a0,s5
8000224c:	669000ef          	jal	ra,800030b4 <__udivsi3>
80002250:	008b7433          	and	s0,s6,s0
80002254:	00050593          	mv	a1,a0
80002258:	00050c13          	mv	s8,a0
8000225c:	00040513          	mv	a0,s0
80002260:	629000ef          	jal	ra,80003088 <__mulsi3>
80002264:	00050493          	mv	s1,a0
80002268:	000b8593          	mv	a1,s7
8000226c:	000a8513          	mv	a0,s5
80002270:	68d000ef          	jal	ra,800030fc <__umodsi3>
80002274:	01095913          	srli	s2,s2,0x10
80002278:	01051513          	slli	a0,a0,0x10
8000227c:	00a96533          	or	a0,s2,a0
80002280:	000c0913          	mv	s2,s8
80002284:	00957e63          	bleu	s1,a0,800022a0 <__divsf3+0x1d0>
80002288:	01650533          	add	a0,a0,s6
8000228c:	fffc0913          	addi	s2,s8,-1
80002290:	01656863          	bltu	a0,s6,800022a0 <__divsf3+0x1d0>
80002294:	00957663          	bleu	s1,a0,800022a0 <__divsf3+0x1d0>
80002298:	ffec0913          	addi	s2,s8,-2
8000229c:	01650533          	add	a0,a0,s6
800022a0:	409504b3          	sub	s1,a0,s1
800022a4:	000b8593          	mv	a1,s7
800022a8:	00048513          	mv	a0,s1
800022ac:	609000ef          	jal	ra,800030b4 <__udivsi3>
800022b0:	00050593          	mv	a1,a0
800022b4:	00050c13          	mv	s8,a0
800022b8:	00040513          	mv	a0,s0
800022bc:	5cd000ef          	jal	ra,80003088 <__mulsi3>
800022c0:	00050a93          	mv	s5,a0
800022c4:	000b8593          	mv	a1,s7
800022c8:	00048513          	mv	a0,s1
800022cc:	631000ef          	jal	ra,800030fc <__umodsi3>
800022d0:	01051513          	slli	a0,a0,0x10
800022d4:	000c0413          	mv	s0,s8
800022d8:	01557e63          	bleu	s5,a0,800022f4 <__divsf3+0x224>
800022dc:	01650533          	add	a0,a0,s6
800022e0:	fffc0413          	addi	s0,s8,-1
800022e4:	01656863          	bltu	a0,s6,800022f4 <__divsf3+0x224>
800022e8:	01557663          	bleu	s5,a0,800022f4 <__divsf3+0x224>
800022ec:	ffec0413          	addi	s0,s8,-2
800022f0:	01650533          	add	a0,a0,s6
800022f4:	01091913          	slli	s2,s2,0x10
800022f8:	41550533          	sub	a0,a0,s5
800022fc:	00896933          	or	s2,s2,s0
80002300:	00a03533          	snez	a0,a0
80002304:	00a96433          	or	s0,s2,a0
80002308:	07fa0713          	addi	a4,s4,127
8000230c:	0ae05063          	blez	a4,800023ac <__divsf3+0x2dc>
80002310:	00747793          	andi	a5,s0,7
80002314:	00078a63          	beqz	a5,80002328 <__divsf3+0x258>
80002318:	00f47793          	andi	a5,s0,15
8000231c:	00400693          	li	a3,4
80002320:	00d78463          	beq	a5,a3,80002328 <__divsf3+0x258>
80002324:	00440413          	addi	s0,s0,4
80002328:	00441793          	slli	a5,s0,0x4
8000232c:	0007da63          	bgez	a5,80002340 <__divsf3+0x270>
80002330:	f80007b7          	lui	a5,0xf8000
80002334:	fff78793          	addi	a5,a5,-1 # f7ffffff <_stack_start+0x77ff960f>
80002338:	00f47433          	and	s0,s0,a5
8000233c:	080a0713          	addi	a4,s4,128
80002340:	0fe00793          	li	a5,254
80002344:	00345413          	srli	s0,s0,0x3
80002348:	0ce7d263          	ble	a4,a5,8000240c <__divsf3+0x33c>
8000234c:	00000413          	li	s0,0
80002350:	0ff00713          	li	a4,255
80002354:	0b80006f          	j	8000240c <__divsf3+0x33c>
80002358:	01fa9913          	slli	s2,s5,0x1f
8000235c:	001ada93          	srli	s5,s5,0x1
80002360:	ed9ff06f          	j	80002238 <__divsf3+0x168>
80002364:	00090993          	mv	s3,s2
80002368:	000a8413          	mv	s0,s5
8000236c:	000b8793          	mv	a5,s7
80002370:	00200713          	li	a4,2
80002374:	fce78ce3          	beq	a5,a4,8000234c <__divsf3+0x27c>
80002378:	00300713          	li	a4,3
8000237c:	08e78263          	beq	a5,a4,80002400 <__divsf3+0x330>
80002380:	00100713          	li	a4,1
80002384:	f8e792e3          	bne	a5,a4,80002308 <__divsf3+0x238>
80002388:	00000413          	li	s0,0
8000238c:	00000713          	li	a4,0
80002390:	07c0006f          	j	8000240c <__divsf3+0x33c>
80002394:	000b0993          	mv	s3,s6
80002398:	fd9ff06f          	j	80002370 <__divsf3+0x2a0>
8000239c:	00400437          	lui	s0,0x400
800023a0:	00000993          	li	s3,0
800023a4:	00300793          	li	a5,3
800023a8:	fc9ff06f          	j	80002370 <__divsf3+0x2a0>
800023ac:	00100793          	li	a5,1
800023b0:	40e787b3          	sub	a5,a5,a4
800023b4:	01b00713          	li	a4,27
800023b8:	fcf748e3          	blt	a4,a5,80002388 <__divsf3+0x2b8>
800023bc:	09ea0513          	addi	a0,s4,158
800023c0:	00f457b3          	srl	a5,s0,a5
800023c4:	00a41433          	sll	s0,s0,a0
800023c8:	00803433          	snez	s0,s0
800023cc:	0087e433          	or	s0,a5,s0
800023d0:	00747793          	andi	a5,s0,7
800023d4:	00078a63          	beqz	a5,800023e8 <__divsf3+0x318>
800023d8:	00f47793          	andi	a5,s0,15
800023dc:	00400713          	li	a4,4
800023e0:	00e78463          	beq	a5,a4,800023e8 <__divsf3+0x318>
800023e4:	00440413          	addi	s0,s0,4 # 400004 <_stack_size+0x3ffc04>
800023e8:	00541793          	slli	a5,s0,0x5
800023ec:	00345413          	srli	s0,s0,0x3
800023f0:	f807dee3          	bgez	a5,8000238c <__divsf3+0x2bc>
800023f4:	00000413          	li	s0,0
800023f8:	00100713          	li	a4,1
800023fc:	0100006f          	j	8000240c <__divsf3+0x33c>
80002400:	00400437          	lui	s0,0x400
80002404:	0ff00713          	li	a4,255
80002408:	00000993          	li	s3,0
8000240c:	00800537          	lui	a0,0x800
80002410:	fff50513          	addi	a0,a0,-1 # 7fffff <_stack_size+0x7ffbff>
80002414:	00a47433          	and	s0,s0,a0
80002418:	80800537          	lui	a0,0x80800
8000241c:	fff50513          	addi	a0,a0,-1 # 807fffff <_stack_start+0x7f960f>
80002420:	0ff77713          	andi	a4,a4,255
80002424:	00a47433          	and	s0,s0,a0
80002428:	01771713          	slli	a4,a4,0x17
8000242c:	01f99513          	slli	a0,s3,0x1f
80002430:	00e46433          	or	s0,s0,a4
80002434:	00a46533          	or	a0,s0,a0
80002438:	02c12083          	lw	ra,44(sp)
8000243c:	02812403          	lw	s0,40(sp)
80002440:	02412483          	lw	s1,36(sp)
80002444:	02012903          	lw	s2,32(sp)
80002448:	01c12983          	lw	s3,28(sp)
8000244c:	01812a03          	lw	s4,24(sp)
80002450:	01412a83          	lw	s5,20(sp)
80002454:	01012b03          	lw	s6,16(sp)
80002458:	00c12b83          	lw	s7,12(sp)
8000245c:	00812c03          	lw	s8,8(sp)
80002460:	03010113          	addi	sp,sp,48
80002464:	00008067          	ret

80002468 <__mulsf3>:
80002468:	fd010113          	addi	sp,sp,-48
8000246c:	02912223          	sw	s1,36(sp)
80002470:	03212023          	sw	s2,32(sp)
80002474:	008004b7          	lui	s1,0x800
80002478:	01755913          	srli	s2,a0,0x17
8000247c:	01312e23          	sw	s3,28(sp)
80002480:	01712623          	sw	s7,12(sp)
80002484:	fff48493          	addi	s1,s1,-1 # 7fffff <_stack_size+0x7ffbff>
80002488:	02112623          	sw	ra,44(sp)
8000248c:	02812423          	sw	s0,40(sp)
80002490:	01412c23          	sw	s4,24(sp)
80002494:	01512a23          	sw	s5,20(sp)
80002498:	01612823          	sw	s6,16(sp)
8000249c:	01812423          	sw	s8,8(sp)
800024a0:	01912223          	sw	s9,4(sp)
800024a4:	0ff97913          	andi	s2,s2,255
800024a8:	00058b93          	mv	s7,a1
800024ac:	00a4f4b3          	and	s1,s1,a0
800024b0:	01f55993          	srli	s3,a0,0x1f
800024b4:	08090a63          	beqz	s2,80002548 <__mulsf3+0xe0>
800024b8:	0ff00793          	li	a5,255
800024bc:	0af90663          	beq	s2,a5,80002568 <__mulsf3+0x100>
800024c0:	00349493          	slli	s1,s1,0x3
800024c4:	040007b7          	lui	a5,0x4000
800024c8:	00f4e4b3          	or	s1,s1,a5
800024cc:	f8190913          	addi	s2,s2,-127 # 7fff81 <_stack_size+0x7ffb81>
800024d0:	00000b13          	li	s6,0
800024d4:	017bd513          	srli	a0,s7,0x17
800024d8:	00800437          	lui	s0,0x800
800024dc:	fff40413          	addi	s0,s0,-1 # 7fffff <_stack_size+0x7ffbff>
800024e0:	0ff57513          	andi	a0,a0,255
800024e4:	01747433          	and	s0,s0,s7
800024e8:	01fbdb93          	srli	s7,s7,0x1f
800024ec:	08050e63          	beqz	a0,80002588 <__mulsf3+0x120>
800024f0:	0ff00793          	li	a5,255
800024f4:	0af50a63          	beq	a0,a5,800025a8 <__mulsf3+0x140>
800024f8:	00341413          	slli	s0,s0,0x3
800024fc:	040007b7          	lui	a5,0x4000
80002500:	00f46433          	or	s0,s0,a5
80002504:	f8150513          	addi	a0,a0,-127
80002508:	00000693          	li	a3,0
8000250c:	002b1793          	slli	a5,s6,0x2
80002510:	00d7e7b3          	or	a5,a5,a3
80002514:	00a90933          	add	s2,s2,a0
80002518:	fff78793          	addi	a5,a5,-1 # 3ffffff <_stack_size+0x3fffbff>
8000251c:	00e00713          	li	a4,14
80002520:	0179ca33          	xor	s4,s3,s7
80002524:	00190a93          	addi	s5,s2,1
80002528:	0af76063          	bltu	a4,a5,800025c8 <__mulsf3+0x160>
8000252c:	00001717          	auipc	a4,0x1
80002530:	36070713          	addi	a4,a4,864 # 8000388c <end+0x6e0>
80002534:	00279793          	slli	a5,a5,0x2
80002538:	00e787b3          	add	a5,a5,a4
8000253c:	0007a783          	lw	a5,0(a5)
80002540:	00e787b3          	add	a5,a5,a4
80002544:	00078067          	jr	a5
80002548:	02048a63          	beqz	s1,8000257c <__mulsf3+0x114>
8000254c:	00048513          	mv	a0,s1
80002550:	411000ef          	jal	ra,80003160 <__clzsi2>
80002554:	ffb50793          	addi	a5,a0,-5
80002558:	f8a00913          	li	s2,-118
8000255c:	00f494b3          	sll	s1,s1,a5
80002560:	40a90933          	sub	s2,s2,a0
80002564:	f6dff06f          	j	800024d0 <__mulsf3+0x68>
80002568:	0ff00913          	li	s2,255
8000256c:	00200b13          	li	s6,2
80002570:	f60482e3          	beqz	s1,800024d4 <__mulsf3+0x6c>
80002574:	00300b13          	li	s6,3
80002578:	f5dff06f          	j	800024d4 <__mulsf3+0x6c>
8000257c:	00000913          	li	s2,0
80002580:	00100b13          	li	s6,1
80002584:	f51ff06f          	j	800024d4 <__mulsf3+0x6c>
80002588:	02040a63          	beqz	s0,800025bc <__mulsf3+0x154>
8000258c:	00040513          	mv	a0,s0
80002590:	3d1000ef          	jal	ra,80003160 <__clzsi2>
80002594:	ffb50793          	addi	a5,a0,-5
80002598:	00f41433          	sll	s0,s0,a5
8000259c:	f8a00793          	li	a5,-118
800025a0:	40a78533          	sub	a0,a5,a0
800025a4:	f65ff06f          	j	80002508 <__mulsf3+0xa0>
800025a8:	0ff00513          	li	a0,255
800025ac:	00200693          	li	a3,2
800025b0:	f4040ee3          	beqz	s0,8000250c <__mulsf3+0xa4>
800025b4:	00300693          	li	a3,3
800025b8:	f55ff06f          	j	8000250c <__mulsf3+0xa4>
800025bc:	00000513          	li	a0,0
800025c0:	00100693          	li	a3,1
800025c4:	f49ff06f          	j	8000250c <__mulsf3+0xa4>
800025c8:	00010c37          	lui	s8,0x10
800025cc:	fffc0b13          	addi	s6,s8,-1 # ffff <_stack_size+0xfbff>
800025d0:	0104db93          	srli	s7,s1,0x10
800025d4:	01045c93          	srli	s9,s0,0x10
800025d8:	0164f4b3          	and	s1,s1,s6
800025dc:	01647433          	and	s0,s0,s6
800025e0:	00040593          	mv	a1,s0
800025e4:	00048513          	mv	a0,s1
800025e8:	2a1000ef          	jal	ra,80003088 <__mulsi3>
800025ec:	00040593          	mv	a1,s0
800025f0:	00050993          	mv	s3,a0
800025f4:	000b8513          	mv	a0,s7
800025f8:	291000ef          	jal	ra,80003088 <__mulsi3>
800025fc:	00050413          	mv	s0,a0
80002600:	000c8593          	mv	a1,s9
80002604:	000b8513          	mv	a0,s7
80002608:	281000ef          	jal	ra,80003088 <__mulsi3>
8000260c:	00050b93          	mv	s7,a0
80002610:	00048593          	mv	a1,s1
80002614:	000c8513          	mv	a0,s9
80002618:	271000ef          	jal	ra,80003088 <__mulsi3>
8000261c:	00850533          	add	a0,a0,s0
80002620:	0109d793          	srli	a5,s3,0x10
80002624:	00a78533          	add	a0,a5,a0
80002628:	00857463          	bleu	s0,a0,80002630 <__mulsf3+0x1c8>
8000262c:	018b8bb3          	add	s7,s7,s8
80002630:	016577b3          	and	a5,a0,s6
80002634:	01079793          	slli	a5,a5,0x10
80002638:	0169f9b3          	and	s3,s3,s6
8000263c:	013787b3          	add	a5,a5,s3
80002640:	00679413          	slli	s0,a5,0x6
80002644:	00803433          	snez	s0,s0
80002648:	01a7d793          	srli	a5,a5,0x1a
8000264c:	01055513          	srli	a0,a0,0x10
80002650:	00f467b3          	or	a5,s0,a5
80002654:	01750433          	add	s0,a0,s7
80002658:	00641413          	slli	s0,s0,0x6
8000265c:	00f46433          	or	s0,s0,a5
80002660:	00441793          	slli	a5,s0,0x4
80002664:	0e07d663          	bgez	a5,80002750 <__mulsf3+0x2e8>
80002668:	00145793          	srli	a5,s0,0x1
8000266c:	00147413          	andi	s0,s0,1
80002670:	0087e433          	or	s0,a5,s0
80002674:	07fa8713          	addi	a4,s5,127
80002678:	0ee05063          	blez	a4,80002758 <__mulsf3+0x2f0>
8000267c:	00747793          	andi	a5,s0,7
80002680:	00078a63          	beqz	a5,80002694 <__mulsf3+0x22c>
80002684:	00f47793          	andi	a5,s0,15
80002688:	00400693          	li	a3,4
8000268c:	00d78463          	beq	a5,a3,80002694 <__mulsf3+0x22c>
80002690:	00440413          	addi	s0,s0,4
80002694:	00441793          	slli	a5,s0,0x4
80002698:	0007da63          	bgez	a5,800026ac <__mulsf3+0x244>
8000269c:	f80007b7          	lui	a5,0xf8000
800026a0:	fff78793          	addi	a5,a5,-1 # f7ffffff <_stack_start+0x77ff960f>
800026a4:	00f47433          	and	s0,s0,a5
800026a8:	080a8713          	addi	a4,s5,128
800026ac:	0fe00793          	li	a5,254
800026b0:	10e7c463          	blt	a5,a4,800027b8 <__mulsf3+0x350>
800026b4:	00345793          	srli	a5,s0,0x3
800026b8:	0300006f          	j	800026e8 <__mulsf3+0x280>
800026bc:	00098a13          	mv	s4,s3
800026c0:	00048413          	mv	s0,s1
800026c4:	000b0693          	mv	a3,s6
800026c8:	00200793          	li	a5,2
800026cc:	0ef68663          	beq	a3,a5,800027b8 <__mulsf3+0x350>
800026d0:	00300793          	li	a5,3
800026d4:	0cf68a63          	beq	a3,a5,800027a8 <__mulsf3+0x340>
800026d8:	00100613          	li	a2,1
800026dc:	00000793          	li	a5,0
800026e0:	00000713          	li	a4,0
800026e4:	f8c698e3          	bne	a3,a2,80002674 <__mulsf3+0x20c>
800026e8:	00800437          	lui	s0,0x800
800026ec:	fff40413          	addi	s0,s0,-1 # 7fffff <_stack_size+0x7ffbff>
800026f0:	80800537          	lui	a0,0x80800
800026f4:	0087f7b3          	and	a5,a5,s0
800026f8:	fff50513          	addi	a0,a0,-1 # 807fffff <_stack_start+0x7f960f>
800026fc:	02c12083          	lw	ra,44(sp)
80002700:	02812403          	lw	s0,40(sp)
80002704:	0ff77713          	andi	a4,a4,255
80002708:	00a7f7b3          	and	a5,a5,a0
8000270c:	01771713          	slli	a4,a4,0x17
80002710:	01fa1513          	slli	a0,s4,0x1f
80002714:	00e7e7b3          	or	a5,a5,a4
80002718:	02412483          	lw	s1,36(sp)
8000271c:	02012903          	lw	s2,32(sp)
80002720:	01c12983          	lw	s3,28(sp)
80002724:	01812a03          	lw	s4,24(sp)
80002728:	01412a83          	lw	s5,20(sp)
8000272c:	01012b03          	lw	s6,16(sp)
80002730:	00c12b83          	lw	s7,12(sp)
80002734:	00812c03          	lw	s8,8(sp)
80002738:	00412c83          	lw	s9,4(sp)
8000273c:	00a7e533          	or	a0,a5,a0
80002740:	03010113          	addi	sp,sp,48
80002744:	00008067          	ret
80002748:	000b8a13          	mv	s4,s7
8000274c:	f7dff06f          	j	800026c8 <__mulsf3+0x260>
80002750:	00090a93          	mv	s5,s2
80002754:	f21ff06f          	j	80002674 <__mulsf3+0x20c>
80002758:	00100793          	li	a5,1
8000275c:	40e787b3          	sub	a5,a5,a4
80002760:	01b00713          	li	a4,27
80002764:	06f74063          	blt	a4,a5,800027c4 <__mulsf3+0x35c>
80002768:	09ea8a93          	addi	s5,s5,158
8000276c:	00f457b3          	srl	a5,s0,a5
80002770:	01541433          	sll	s0,s0,s5
80002774:	00803433          	snez	s0,s0
80002778:	0087e433          	or	s0,a5,s0
8000277c:	00747793          	andi	a5,s0,7
80002780:	00078a63          	beqz	a5,80002794 <__mulsf3+0x32c>
80002784:	00f47793          	andi	a5,s0,15
80002788:	00400713          	li	a4,4
8000278c:	00e78463          	beq	a5,a4,80002794 <__mulsf3+0x32c>
80002790:	00440413          	addi	s0,s0,4
80002794:	00541793          	slli	a5,s0,0x5
80002798:	0207ca63          	bltz	a5,800027cc <__mulsf3+0x364>
8000279c:	00345793          	srli	a5,s0,0x3
800027a0:	00000713          	li	a4,0
800027a4:	f45ff06f          	j	800026e8 <__mulsf3+0x280>
800027a8:	004007b7          	lui	a5,0x400
800027ac:	0ff00713          	li	a4,255
800027b0:	00000a13          	li	s4,0
800027b4:	f35ff06f          	j	800026e8 <__mulsf3+0x280>
800027b8:	00000793          	li	a5,0
800027bc:	0ff00713          	li	a4,255
800027c0:	f29ff06f          	j	800026e8 <__mulsf3+0x280>
800027c4:	00000793          	li	a5,0
800027c8:	fd9ff06f          	j	800027a0 <__mulsf3+0x338>
800027cc:	00000793          	li	a5,0
800027d0:	00100713          	li	a4,1
800027d4:	f15ff06f          	j	800026e8 <__mulsf3+0x280>

800027d8 <__subsf3>:
800027d8:	008007b7          	lui	a5,0x800
800027dc:	fff78793          	addi	a5,a5,-1 # 7fffff <_stack_size+0x7ffbff>
800027e0:	ff010113          	addi	sp,sp,-16
800027e4:	00a7f733          	and	a4,a5,a0
800027e8:	01755693          	srli	a3,a0,0x17
800027ec:	0175d613          	srli	a2,a1,0x17
800027f0:	00b7f7b3          	and	a5,a5,a1
800027f4:	00912223          	sw	s1,4(sp)
800027f8:	01212023          	sw	s2,0(sp)
800027fc:	0ff6f693          	andi	a3,a3,255
80002800:	00371813          	slli	a6,a4,0x3
80002804:	0ff67613          	andi	a2,a2,255
80002808:	00112623          	sw	ra,12(sp)
8000280c:	00812423          	sw	s0,8(sp)
80002810:	0ff00713          	li	a4,255
80002814:	01f55493          	srli	s1,a0,0x1f
80002818:	00068913          	mv	s2,a3
8000281c:	00060513          	mv	a0,a2
80002820:	01f5d593          	srli	a1,a1,0x1f
80002824:	00379793          	slli	a5,a5,0x3
80002828:	00e61463          	bne	a2,a4,80002830 <__subsf3+0x58>
8000282c:	00079463          	bnez	a5,80002834 <__subsf3+0x5c>
80002830:	0015c593          	xori	a1,a1,1
80002834:	40c68733          	sub	a4,a3,a2
80002838:	1a959a63          	bne	a1,s1,800029ec <__subsf3+0x214>
8000283c:	0ae05663          	blez	a4,800028e8 <__subsf3+0x110>
80002840:	06061663          	bnez	a2,800028ac <__subsf3+0xd4>
80002844:	00079c63          	bnez	a5,8000285c <__subsf3+0x84>
80002848:	0ff00793          	li	a5,255
8000284c:	04f68c63          	beq	a3,a5,800028a4 <__subsf3+0xcc>
80002850:	00080793          	mv	a5,a6
80002854:	00068513          	mv	a0,a3
80002858:	14c0006f          	j	800029a4 <__subsf3+0x1cc>
8000285c:	fff70713          	addi	a4,a4,-1
80002860:	02071e63          	bnez	a4,8000289c <__subsf3+0xc4>
80002864:	010787b3          	add	a5,a5,a6
80002868:	00068513          	mv	a0,a3
8000286c:	00579713          	slli	a4,a5,0x5
80002870:	12075a63          	bgez	a4,800029a4 <__subsf3+0x1cc>
80002874:	00150513          	addi	a0,a0,1
80002878:	0ff00713          	li	a4,255
8000287c:	32e50e63          	beq	a0,a4,80002bb8 <__subsf3+0x3e0>
80002880:	7e000737          	lui	a4,0x7e000
80002884:	0017f693          	andi	a3,a5,1
80002888:	fff70713          	addi	a4,a4,-1 # 7dffffff <_stack_size+0x7dfffbff>
8000288c:	0017d793          	srli	a5,a5,0x1
80002890:	00e7f7b3          	and	a5,a5,a4
80002894:	00d7e7b3          	or	a5,a5,a3
80002898:	10c0006f          	j	800029a4 <__subsf3+0x1cc>
8000289c:	0ff00613          	li	a2,255
800028a0:	00c69e63          	bne	a3,a2,800028bc <__subsf3+0xe4>
800028a4:	00080793          	mv	a5,a6
800028a8:	0740006f          	j	8000291c <__subsf3+0x144>
800028ac:	0ff00613          	li	a2,255
800028b0:	fec68ae3          	beq	a3,a2,800028a4 <__subsf3+0xcc>
800028b4:	04000637          	lui	a2,0x4000
800028b8:	00c7e7b3          	or	a5,a5,a2
800028bc:	01b00613          	li	a2,27
800028c0:	00e65663          	ble	a4,a2,800028cc <__subsf3+0xf4>
800028c4:	00100793          	li	a5,1
800028c8:	f9dff06f          	j	80002864 <__subsf3+0x8c>
800028cc:	02000613          	li	a2,32
800028d0:	40e60633          	sub	a2,a2,a4
800028d4:	00e7d5b3          	srl	a1,a5,a4
800028d8:	00c797b3          	sll	a5,a5,a2
800028dc:	00f037b3          	snez	a5,a5
800028e0:	00f5e7b3          	or	a5,a1,a5
800028e4:	f81ff06f          	j	80002864 <__subsf3+0x8c>
800028e8:	08070063          	beqz	a4,80002968 <__subsf3+0x190>
800028ec:	02069c63          	bnez	a3,80002924 <__subsf3+0x14c>
800028f0:	00081863          	bnez	a6,80002900 <__subsf3+0x128>
800028f4:	0ff00713          	li	a4,255
800028f8:	0ae61663          	bne	a2,a4,800029a4 <__subsf3+0x1cc>
800028fc:	0200006f          	j	8000291c <__subsf3+0x144>
80002900:	fff00693          	li	a3,-1
80002904:	00d71663          	bne	a4,a3,80002910 <__subsf3+0x138>
80002908:	010787b3          	add	a5,a5,a6
8000290c:	f61ff06f          	j	8000286c <__subsf3+0x94>
80002910:	0ff00693          	li	a3,255
80002914:	fff74713          	not	a4,a4
80002918:	02d61063          	bne	a2,a3,80002938 <__subsf3+0x160>
8000291c:	0ff00513          	li	a0,255
80002920:	0840006f          	j	800029a4 <__subsf3+0x1cc>
80002924:	0ff00693          	li	a3,255
80002928:	fed60ae3          	beq	a2,a3,8000291c <__subsf3+0x144>
8000292c:	040006b7          	lui	a3,0x4000
80002930:	40e00733          	neg	a4,a4
80002934:	00d86833          	or	a6,a6,a3
80002938:	01b00693          	li	a3,27
8000293c:	00e6d663          	ble	a4,a3,80002948 <__subsf3+0x170>
80002940:	00100713          	li	a4,1
80002944:	01c0006f          	j	80002960 <__subsf3+0x188>
80002948:	02000693          	li	a3,32
8000294c:	00e85633          	srl	a2,a6,a4
80002950:	40e68733          	sub	a4,a3,a4
80002954:	00e81733          	sll	a4,a6,a4
80002958:	00e03733          	snez	a4,a4
8000295c:	00e66733          	or	a4,a2,a4
80002960:	00e787b3          	add	a5,a5,a4
80002964:	f09ff06f          	j	8000286c <__subsf3+0x94>
80002968:	00168513          	addi	a0,a3,1 # 4000001 <_stack_size+0x3fffc01>
8000296c:	0ff57613          	andi	a2,a0,255
80002970:	00100713          	li	a4,1
80002974:	06c74263          	blt	a4,a2,800029d8 <__subsf3+0x200>
80002978:	04069463          	bnez	a3,800029c0 <__subsf3+0x1e8>
8000297c:	00000513          	li	a0,0
80002980:	02080263          	beqz	a6,800029a4 <__subsf3+0x1cc>
80002984:	22078663          	beqz	a5,80002bb0 <__subsf3+0x3d8>
80002988:	010787b3          	add	a5,a5,a6
8000298c:	00579713          	slli	a4,a5,0x5
80002990:	00075a63          	bgez	a4,800029a4 <__subsf3+0x1cc>
80002994:	fc000737          	lui	a4,0xfc000
80002998:	fff70713          	addi	a4,a4,-1 # fbffffff <_stack_start+0x7bff960f>
8000299c:	00e7f7b3          	and	a5,a5,a4
800029a0:	00100513          	li	a0,1
800029a4:	0077f713          	andi	a4,a5,7
800029a8:	20070a63          	beqz	a4,80002bbc <__subsf3+0x3e4>
800029ac:	00f7f713          	andi	a4,a5,15
800029b0:	00400693          	li	a3,4
800029b4:	20d70463          	beq	a4,a3,80002bbc <__subsf3+0x3e4>
800029b8:	00478793          	addi	a5,a5,4
800029bc:	2000006f          	j	80002bbc <__subsf3+0x3e4>
800029c0:	f4080ee3          	beqz	a6,8000291c <__subsf3+0x144>
800029c4:	ee0780e3          	beqz	a5,800028a4 <__subsf3+0xcc>
800029c8:	020007b7          	lui	a5,0x2000
800029cc:	0ff00513          	li	a0,255
800029d0:	00000493          	li	s1,0
800029d4:	1e80006f          	j	80002bbc <__subsf3+0x3e4>
800029d8:	0ff00713          	li	a4,255
800029dc:	1ce50e63          	beq	a0,a4,80002bb8 <__subsf3+0x3e0>
800029e0:	00f80733          	add	a4,a6,a5
800029e4:	00175793          	srli	a5,a4,0x1
800029e8:	fbdff06f          	j	800029a4 <__subsf3+0x1cc>
800029ec:	08e05063          	blez	a4,80002a6c <__subsf3+0x294>
800029f0:	04061663          	bnez	a2,80002a3c <__subsf3+0x264>
800029f4:	e4078ae3          	beqz	a5,80002848 <__subsf3+0x70>
800029f8:	fff70713          	addi	a4,a4,-1
800029fc:	02071463          	bnez	a4,80002a24 <__subsf3+0x24c>
80002a00:	40f807b3          	sub	a5,a6,a5
80002a04:	00068513          	mv	a0,a3
80002a08:	00579713          	slli	a4,a5,0x5
80002a0c:	f8075ce3          	bgez	a4,800029a4 <__subsf3+0x1cc>
80002a10:	04000437          	lui	s0,0x4000
80002a14:	fff40413          	addi	s0,s0,-1 # 3ffffff <_stack_size+0x3fffbff>
80002a18:	0087f433          	and	s0,a5,s0
80002a1c:	00050913          	mv	s2,a0
80002a20:	1380006f          	j	80002b58 <__subsf3+0x380>
80002a24:	0ff00613          	li	a2,255
80002a28:	e6c68ee3          	beq	a3,a2,800028a4 <__subsf3+0xcc>
80002a2c:	01b00613          	li	a2,27
80002a30:	02e65063          	ble	a4,a2,80002a50 <__subsf3+0x278>
80002a34:	00100793          	li	a5,1
80002a38:	fc9ff06f          	j	80002a00 <__subsf3+0x228>
80002a3c:	0ff00613          	li	a2,255
80002a40:	e6c682e3          	beq	a3,a2,800028a4 <__subsf3+0xcc>
80002a44:	04000637          	lui	a2,0x4000
80002a48:	00c7e7b3          	or	a5,a5,a2
80002a4c:	fe1ff06f          	j	80002a2c <__subsf3+0x254>
80002a50:	02000613          	li	a2,32
80002a54:	00e7d5b3          	srl	a1,a5,a4
80002a58:	40e60733          	sub	a4,a2,a4
80002a5c:	00e797b3          	sll	a5,a5,a4
80002a60:	00f037b3          	snez	a5,a5
80002a64:	00f5e7b3          	or	a5,a1,a5
80002a68:	f99ff06f          	j	80002a00 <__subsf3+0x228>
80002a6c:	08070263          	beqz	a4,80002af0 <__subsf3+0x318>
80002a70:	02069e63          	bnez	a3,80002aac <__subsf3+0x2d4>
80002a74:	00081863          	bnez	a6,80002a84 <__subsf3+0x2ac>
80002a78:	0ff00713          	li	a4,255
80002a7c:	00058493          	mv	s1,a1
80002a80:	e79ff06f          	j	800028f8 <__subsf3+0x120>
80002a84:	fff00693          	li	a3,-1
80002a88:	00d71863          	bne	a4,a3,80002a98 <__subsf3+0x2c0>
80002a8c:	410787b3          	sub	a5,a5,a6
80002a90:	00058493          	mv	s1,a1
80002a94:	f75ff06f          	j	80002a08 <__subsf3+0x230>
80002a98:	0ff00693          	li	a3,255
80002a9c:	fff74713          	not	a4,a4
80002aa0:	02d61063          	bne	a2,a3,80002ac0 <__subsf3+0x2e8>
80002aa4:	00058493          	mv	s1,a1
80002aa8:	e75ff06f          	j	8000291c <__subsf3+0x144>
80002aac:	0ff00693          	li	a3,255
80002ab0:	fed60ae3          	beq	a2,a3,80002aa4 <__subsf3+0x2cc>
80002ab4:	040006b7          	lui	a3,0x4000
80002ab8:	40e00733          	neg	a4,a4
80002abc:	00d86833          	or	a6,a6,a3
80002ac0:	01b00693          	li	a3,27
80002ac4:	00e6d663          	ble	a4,a3,80002ad0 <__subsf3+0x2f8>
80002ac8:	00100713          	li	a4,1
80002acc:	01c0006f          	j	80002ae8 <__subsf3+0x310>
80002ad0:	02000693          	li	a3,32
80002ad4:	00e85633          	srl	a2,a6,a4
80002ad8:	40e68733          	sub	a4,a3,a4
80002adc:	00e81733          	sll	a4,a6,a4
80002ae0:	00e03733          	snez	a4,a4
80002ae4:	00e66733          	or	a4,a2,a4
80002ae8:	40e787b3          	sub	a5,a5,a4
80002aec:	fa5ff06f          	j	80002a90 <__subsf3+0x2b8>
80002af0:	00168713          	addi	a4,a3,1 # 4000001 <_stack_size+0x3fffc01>
80002af4:	0ff77713          	andi	a4,a4,255
80002af8:	00100613          	li	a2,1
80002afc:	04e64463          	blt	a2,a4,80002b44 <__subsf3+0x36c>
80002b00:	02069c63          	bnez	a3,80002b38 <__subsf3+0x360>
80002b04:	00081863          	bnez	a6,80002b14 <__subsf3+0x33c>
80002b08:	12079863          	bnez	a5,80002c38 <__subsf3+0x460>
80002b0c:	00000513          	li	a0,0
80002b10:	ec1ff06f          	j	800029d0 <__subsf3+0x1f8>
80002b14:	12078663          	beqz	a5,80002c40 <__subsf3+0x468>
80002b18:	40f80733          	sub	a4,a6,a5
80002b1c:	00571693          	slli	a3,a4,0x5
80002b20:	410787b3          	sub	a5,a5,a6
80002b24:	1006ca63          	bltz	a3,80002c38 <__subsf3+0x460>
80002b28:	00070793          	mv	a5,a4
80002b2c:	06071063          	bnez	a4,80002b8c <__subsf3+0x3b4>
80002b30:	00000793          	li	a5,0
80002b34:	fd9ff06f          	j	80002b0c <__subsf3+0x334>
80002b38:	e80816e3          	bnez	a6,800029c4 <__subsf3+0x1ec>
80002b3c:	f60794e3          	bnez	a5,80002aa4 <__subsf3+0x2cc>
80002b40:	e89ff06f          	j	800029c8 <__subsf3+0x1f0>
80002b44:	40f80433          	sub	s0,a6,a5
80002b48:	00541713          	slli	a4,s0,0x5
80002b4c:	04075463          	bgez	a4,80002b94 <__subsf3+0x3bc>
80002b50:	41078433          	sub	s0,a5,a6
80002b54:	00058493          	mv	s1,a1
80002b58:	00040513          	mv	a0,s0
80002b5c:	604000ef          	jal	ra,80003160 <__clzsi2>
80002b60:	ffb50513          	addi	a0,a0,-5
80002b64:	00a41433          	sll	s0,s0,a0
80002b68:	03254a63          	blt	a0,s2,80002b9c <__subsf3+0x3c4>
80002b6c:	41250533          	sub	a0,a0,s2
80002b70:	00150513          	addi	a0,a0,1
80002b74:	02000713          	li	a4,32
80002b78:	00a457b3          	srl	a5,s0,a0
80002b7c:	40a70533          	sub	a0,a4,a0
80002b80:	00a41433          	sll	s0,s0,a0
80002b84:	00803433          	snez	s0,s0
80002b88:	0087e7b3          	or	a5,a5,s0
80002b8c:	00000513          	li	a0,0
80002b90:	e15ff06f          	j	800029a4 <__subsf3+0x1cc>
80002b94:	f8040ee3          	beqz	s0,80002b30 <__subsf3+0x358>
80002b98:	fc1ff06f          	j	80002b58 <__subsf3+0x380>
80002b9c:	fc0007b7          	lui	a5,0xfc000
80002ba0:	fff78793          	addi	a5,a5,-1 # fbffffff <_stack_start+0x7bff960f>
80002ba4:	40a90533          	sub	a0,s2,a0
80002ba8:	00f477b3          	and	a5,s0,a5
80002bac:	df9ff06f          	j	800029a4 <__subsf3+0x1cc>
80002bb0:	00080793          	mv	a5,a6
80002bb4:	df1ff06f          	j	800029a4 <__subsf3+0x1cc>
80002bb8:	00000793          	li	a5,0
80002bbc:	00579713          	slli	a4,a5,0x5
80002bc0:	00075e63          	bgez	a4,80002bdc <__subsf3+0x404>
80002bc4:	00150513          	addi	a0,a0,1
80002bc8:	0ff00713          	li	a4,255
80002bcc:	06e50e63          	beq	a0,a4,80002c48 <__subsf3+0x470>
80002bd0:	fc000737          	lui	a4,0xfc000
80002bd4:	fff70713          	addi	a4,a4,-1 # fbffffff <_stack_start+0x7bff960f>
80002bd8:	00e7f7b3          	and	a5,a5,a4
80002bdc:	0ff00713          	li	a4,255
80002be0:	0037d793          	srli	a5,a5,0x3
80002be4:	00e51863          	bne	a0,a4,80002bf4 <__subsf3+0x41c>
80002be8:	00078663          	beqz	a5,80002bf4 <__subsf3+0x41c>
80002bec:	004007b7          	lui	a5,0x400
80002bf0:	00000493          	li	s1,0
80002bf4:	00800737          	lui	a4,0x800
80002bf8:	fff70713          	addi	a4,a4,-1 # 7fffff <_stack_size+0x7ffbff>
80002bfc:	0ff57513          	andi	a0,a0,255
80002c00:	00e7f7b3          	and	a5,a5,a4
80002c04:	01751713          	slli	a4,a0,0x17
80002c08:	80800537          	lui	a0,0x80800
80002c0c:	00c12083          	lw	ra,12(sp)
80002c10:	00812403          	lw	s0,8(sp)
80002c14:	fff50513          	addi	a0,a0,-1 # 807fffff <_stack_start+0x7f960f>
80002c18:	00a7f533          	and	a0,a5,a0
80002c1c:	01f49493          	slli	s1,s1,0x1f
80002c20:	00e56533          	or	a0,a0,a4
80002c24:	00956533          	or	a0,a0,s1
80002c28:	00012903          	lw	s2,0(sp)
80002c2c:	00412483          	lw	s1,4(sp)
80002c30:	01010113          	addi	sp,sp,16
80002c34:	00008067          	ret
80002c38:	00058493          	mv	s1,a1
80002c3c:	f51ff06f          	j	80002b8c <__subsf3+0x3b4>
80002c40:	00080793          	mv	a5,a6
80002c44:	f49ff06f          	j	80002b8c <__subsf3+0x3b4>
80002c48:	00000793          	li	a5,0
80002c4c:	f91ff06f          	j	80002bdc <__subsf3+0x404>

80002c50 <__fixsfsi>:
80002c50:	00800637          	lui	a2,0x800
80002c54:	01755713          	srli	a4,a0,0x17
80002c58:	fff60793          	addi	a5,a2,-1 # 7fffff <_stack_size+0x7ffbff>
80002c5c:	0ff77713          	andi	a4,a4,255
80002c60:	07e00593          	li	a1,126
80002c64:	00a7f7b3          	and	a5,a5,a0
80002c68:	01f55693          	srli	a3,a0,0x1f
80002c6c:	04e5f663          	bleu	a4,a1,80002cb8 <__fixsfsi+0x68>
80002c70:	09d00593          	li	a1,157
80002c74:	00e5fa63          	bleu	a4,a1,80002c88 <__fixsfsi+0x38>
80002c78:	80000537          	lui	a0,0x80000
80002c7c:	fff54513          	not	a0,a0
80002c80:	00a68533          	add	a0,a3,a0
80002c84:	00008067          	ret
80002c88:	00c7e533          	or	a0,a5,a2
80002c8c:	09500793          	li	a5,149
80002c90:	00e7dc63          	ble	a4,a5,80002ca8 <__fixsfsi+0x58>
80002c94:	f6a70713          	addi	a4,a4,-150
80002c98:	00e51533          	sll	a0,a0,a4
80002c9c:	02068063          	beqz	a3,80002cbc <__fixsfsi+0x6c>
80002ca0:	40a00533          	neg	a0,a0
80002ca4:	00008067          	ret
80002ca8:	09600793          	li	a5,150
80002cac:	40e78733          	sub	a4,a5,a4
80002cb0:	00e55533          	srl	a0,a0,a4
80002cb4:	fe9ff06f          	j	80002c9c <__fixsfsi+0x4c>
80002cb8:	00000513          	li	a0,0
80002cbc:	00008067          	ret

80002cc0 <__floatsisf>:
80002cc0:	ff010113          	addi	sp,sp,-16
80002cc4:	00112623          	sw	ra,12(sp)
80002cc8:	00812423          	sw	s0,8(sp)
80002ccc:	00912223          	sw	s1,4(sp)
80002cd0:	10050263          	beqz	a0,80002dd4 <__floatsisf+0x114>
80002cd4:	00050413          	mv	s0,a0
80002cd8:	01f55493          	srli	s1,a0,0x1f
80002cdc:	00055463          	bgez	a0,80002ce4 <__floatsisf+0x24>
80002ce0:	40a00433          	neg	s0,a0
80002ce4:	00040513          	mv	a0,s0
80002ce8:	478000ef          	jal	ra,80003160 <__clzsi2>
80002cec:	09e00793          	li	a5,158
80002cf0:	40a787b3          	sub	a5,a5,a0
80002cf4:	09600713          	li	a4,150
80002cf8:	06f74063          	blt	a4,a5,80002d58 <__floatsisf+0x98>
80002cfc:	00800713          	li	a4,8
80002d00:	00a75663          	ble	a0,a4,80002d0c <__floatsisf+0x4c>
80002d04:	ff850513          	addi	a0,a0,-8 # 7ffffff8 <_stack_start+0xffff9608>
80002d08:	00a41433          	sll	s0,s0,a0
80002d0c:	00800537          	lui	a0,0x800
80002d10:	fff50513          	addi	a0,a0,-1 # 7fffff <_stack_size+0x7ffbff>
80002d14:	0ff7f793          	andi	a5,a5,255
80002d18:	00a47433          	and	s0,s0,a0
80002d1c:	01779513          	slli	a0,a5,0x17
80002d20:	808007b7          	lui	a5,0x80800
80002d24:	fff78793          	addi	a5,a5,-1 # 807fffff <_stack_start+0x7f960f>
80002d28:	00f47433          	and	s0,s0,a5
80002d2c:	800007b7          	lui	a5,0x80000
80002d30:	00a46433          	or	s0,s0,a0
80002d34:	fff7c793          	not	a5,a5
80002d38:	01f49513          	slli	a0,s1,0x1f
80002d3c:	00f47433          	and	s0,s0,a5
80002d40:	00a46533          	or	a0,s0,a0
80002d44:	00c12083          	lw	ra,12(sp)
80002d48:	00812403          	lw	s0,8(sp)
80002d4c:	00412483          	lw	s1,4(sp)
80002d50:	01010113          	addi	sp,sp,16
80002d54:	00008067          	ret
80002d58:	09900713          	li	a4,153
80002d5c:	02f75063          	ble	a5,a4,80002d7c <__floatsisf+0xbc>
80002d60:	00500713          	li	a4,5
80002d64:	40a70733          	sub	a4,a4,a0
80002d68:	01b50693          	addi	a3,a0,27
80002d6c:	00e45733          	srl	a4,s0,a4
80002d70:	00d41433          	sll	s0,s0,a3
80002d74:	00803433          	snez	s0,s0
80002d78:	00876433          	or	s0,a4,s0
80002d7c:	00500713          	li	a4,5
80002d80:	00a75663          	ble	a0,a4,80002d8c <__floatsisf+0xcc>
80002d84:	ffb50713          	addi	a4,a0,-5
80002d88:	00e41433          	sll	s0,s0,a4
80002d8c:	fc000737          	lui	a4,0xfc000
80002d90:	fff70713          	addi	a4,a4,-1 # fbffffff <_stack_start+0x7bff960f>
80002d94:	00747693          	andi	a3,s0,7
80002d98:	00e47733          	and	a4,s0,a4
80002d9c:	00068a63          	beqz	a3,80002db0 <__floatsisf+0xf0>
80002da0:	00f47413          	andi	s0,s0,15
80002da4:	00400693          	li	a3,4
80002da8:	00d40463          	beq	s0,a3,80002db0 <__floatsisf+0xf0>
80002dac:	00470713          	addi	a4,a4,4
80002db0:	00571693          	slli	a3,a4,0x5
80002db4:	0006dc63          	bgez	a3,80002dcc <__floatsisf+0x10c>
80002db8:	fc0007b7          	lui	a5,0xfc000
80002dbc:	fff78793          	addi	a5,a5,-1 # fbffffff <_stack_start+0x7bff960f>
80002dc0:	00f77733          	and	a4,a4,a5
80002dc4:	09f00793          	li	a5,159
80002dc8:	40a787b3          	sub	a5,a5,a0
80002dcc:	00375413          	srli	s0,a4,0x3
80002dd0:	f3dff06f          	j	80002d0c <__floatsisf+0x4c>
80002dd4:	00000413          	li	s0,0
80002dd8:	00000793          	li	a5,0
80002ddc:	00000493          	li	s1,0
80002de0:	f2dff06f          	j	80002d0c <__floatsisf+0x4c>

80002de4 <__extendsfdf2>:
80002de4:	01755793          	srli	a5,a0,0x17
80002de8:	ff010113          	addi	sp,sp,-16
80002dec:	0ff7f793          	andi	a5,a5,255
80002df0:	00812423          	sw	s0,8(sp)
80002df4:	00178713          	addi	a4,a5,1
80002df8:	00800437          	lui	s0,0x800
80002dfc:	00912223          	sw	s1,4(sp)
80002e00:	fff40413          	addi	s0,s0,-1 # 7fffff <_stack_size+0x7ffbff>
80002e04:	00112623          	sw	ra,12(sp)
80002e08:	0ff77713          	andi	a4,a4,255
80002e0c:	00100693          	li	a3,1
80002e10:	00a47433          	and	s0,s0,a0
80002e14:	01f55493          	srli	s1,a0,0x1f
80002e18:	06e6d263          	ble	a4,a3,80002e7c <__extendsfdf2+0x98>
80002e1c:	38078513          	addi	a0,a5,896
80002e20:	00345793          	srli	a5,s0,0x3
80002e24:	01d41413          	slli	s0,s0,0x1d
80002e28:	00100737          	lui	a4,0x100
80002e2c:	fff70713          	addi	a4,a4,-1 # fffff <_stack_size+0xffbff>
80002e30:	00e7f7b3          	and	a5,a5,a4
80002e34:	80100737          	lui	a4,0x80100
80002e38:	fff70713          	addi	a4,a4,-1 # 800fffff <_stack_start+0xf960f>
80002e3c:	7ff57513          	andi	a0,a0,2047
80002e40:	01451513          	slli	a0,a0,0x14
80002e44:	00e7f7b3          	and	a5,a5,a4
80002e48:	80000737          	lui	a4,0x80000
80002e4c:	00a7e7b3          	or	a5,a5,a0
80002e50:	fff74713          	not	a4,a4
80002e54:	01f49513          	slli	a0,s1,0x1f
80002e58:	00e7f7b3          	and	a5,a5,a4
80002e5c:	00a7e733          	or	a4,a5,a0
80002e60:	00c12083          	lw	ra,12(sp)
80002e64:	00040513          	mv	a0,s0
80002e68:	00812403          	lw	s0,8(sp)
80002e6c:	00412483          	lw	s1,4(sp)
80002e70:	00070593          	mv	a1,a4
80002e74:	01010113          	addi	sp,sp,16
80002e78:	00008067          	ret
80002e7c:	04079463          	bnez	a5,80002ec4 <__extendsfdf2+0xe0>
80002e80:	06040263          	beqz	s0,80002ee4 <__extendsfdf2+0x100>
80002e84:	00040513          	mv	a0,s0
80002e88:	2d8000ef          	jal	ra,80003160 <__clzsi2>
80002e8c:	00a00793          	li	a5,10
80002e90:	02a7c263          	blt	a5,a0,80002eb4 <__extendsfdf2+0xd0>
80002e94:	00b00793          	li	a5,11
80002e98:	40a787b3          	sub	a5,a5,a0
80002e9c:	01550713          	addi	a4,a0,21
80002ea0:	00f457b3          	srl	a5,s0,a5
80002ea4:	00e41433          	sll	s0,s0,a4
80002ea8:	38900713          	li	a4,905
80002eac:	40a70533          	sub	a0,a4,a0
80002eb0:	f79ff06f          	j	80002e28 <__extendsfdf2+0x44>
80002eb4:	ff550793          	addi	a5,a0,-11
80002eb8:	00f417b3          	sll	a5,s0,a5
80002ebc:	00000413          	li	s0,0
80002ec0:	fe9ff06f          	j	80002ea8 <__extendsfdf2+0xc4>
80002ec4:	00000793          	li	a5,0
80002ec8:	00040a63          	beqz	s0,80002edc <__extendsfdf2+0xf8>
80002ecc:	00345793          	srli	a5,s0,0x3
80002ed0:	00080737          	lui	a4,0x80
80002ed4:	01d41413          	slli	s0,s0,0x1d
80002ed8:	00e7e7b3          	or	a5,a5,a4
80002edc:	7ff00513          	li	a0,2047
80002ee0:	f49ff06f          	j	80002e28 <__extendsfdf2+0x44>
80002ee4:	00000793          	li	a5,0
80002ee8:	00000513          	li	a0,0
80002eec:	f3dff06f          	j	80002e28 <__extendsfdf2+0x44>

80002ef0 <__truncdfsf2>:
80002ef0:	00100637          	lui	a2,0x100
80002ef4:	fff60613          	addi	a2,a2,-1 # fffff <_stack_size+0xffbff>
80002ef8:	00b67633          	and	a2,a2,a1
80002efc:	0145d813          	srli	a6,a1,0x14
80002f00:	01d55793          	srli	a5,a0,0x1d
80002f04:	7ff87813          	andi	a6,a6,2047
80002f08:	00361613          	slli	a2,a2,0x3
80002f0c:	00c7e633          	or	a2,a5,a2
80002f10:	00180793          	addi	a5,a6,1
80002f14:	7ff7f793          	andi	a5,a5,2047
80002f18:	00100693          	li	a3,1
80002f1c:	01f5d593          	srli	a1,a1,0x1f
80002f20:	00351713          	slli	a4,a0,0x3
80002f24:	0af6d663          	ble	a5,a3,80002fd0 <__truncdfsf2+0xe0>
80002f28:	c8080693          	addi	a3,a6,-896
80002f2c:	0fe00793          	li	a5,254
80002f30:	0cd7c263          	blt	a5,a3,80002ff4 <__truncdfsf2+0x104>
80002f34:	08d04063          	bgtz	a3,80002fb4 <__truncdfsf2+0xc4>
80002f38:	fe900793          	li	a5,-23
80002f3c:	12f6c463          	blt	a3,a5,80003064 <__truncdfsf2+0x174>
80002f40:	008007b7          	lui	a5,0x800
80002f44:	01e00513          	li	a0,30
80002f48:	00f66633          	or	a2,a2,a5
80002f4c:	40d50533          	sub	a0,a0,a3
80002f50:	01f00793          	li	a5,31
80002f54:	02a7c863          	blt	a5,a0,80002f84 <__truncdfsf2+0x94>
80002f58:	c8280813          	addi	a6,a6,-894
80002f5c:	010717b3          	sll	a5,a4,a6
80002f60:	00f037b3          	snez	a5,a5
80002f64:	01061633          	sll	a2,a2,a6
80002f68:	00a75533          	srl	a0,a4,a0
80002f6c:	00c7e7b3          	or	a5,a5,a2
80002f70:	00f567b3          	or	a5,a0,a5
80002f74:	00000693          	li	a3,0
80002f78:	0077f713          	andi	a4,a5,7
80002f7c:	08070063          	beqz	a4,80002ffc <__truncdfsf2+0x10c>
80002f80:	0ec0006f          	j	8000306c <__truncdfsf2+0x17c>
80002f84:	ffe00793          	li	a5,-2
80002f88:	40d786b3          	sub	a3,a5,a3
80002f8c:	02000793          	li	a5,32
80002f90:	00d656b3          	srl	a3,a2,a3
80002f94:	00000893          	li	a7,0
80002f98:	00f50663          	beq	a0,a5,80002fa4 <__truncdfsf2+0xb4>
80002f9c:	ca280813          	addi	a6,a6,-862
80002fa0:	010618b3          	sll	a7,a2,a6
80002fa4:	00e8e7b3          	or	a5,a7,a4
80002fa8:	00f037b3          	snez	a5,a5
80002fac:	00f6e7b3          	or	a5,a3,a5
80002fb0:	fc5ff06f          	j	80002f74 <__truncdfsf2+0x84>
80002fb4:	00651513          	slli	a0,a0,0x6
80002fb8:	00a03533          	snez	a0,a0
80002fbc:	00361613          	slli	a2,a2,0x3
80002fc0:	01d75793          	srli	a5,a4,0x1d
80002fc4:	00c56633          	or	a2,a0,a2
80002fc8:	00f667b3          	or	a5,a2,a5
80002fcc:	fadff06f          	j	80002f78 <__truncdfsf2+0x88>
80002fd0:	00e667b3          	or	a5,a2,a4
80002fd4:	00081663          	bnez	a6,80002fe0 <__truncdfsf2+0xf0>
80002fd8:	00f037b3          	snez	a5,a5
80002fdc:	f99ff06f          	j	80002f74 <__truncdfsf2+0x84>
80002fe0:	0ff00693          	li	a3,255
80002fe4:	00078c63          	beqz	a5,80002ffc <__truncdfsf2+0x10c>
80002fe8:	00361613          	slli	a2,a2,0x3
80002fec:	020007b7          	lui	a5,0x2000
80002ff0:	fd9ff06f          	j	80002fc8 <__truncdfsf2+0xd8>
80002ff4:	00000793          	li	a5,0
80002ff8:	0ff00693          	li	a3,255
80002ffc:	00579713          	slli	a4,a5,0x5
80003000:	00075e63          	bgez	a4,8000301c <__truncdfsf2+0x12c>
80003004:	00168693          	addi	a3,a3,1
80003008:	0ff00713          	li	a4,255
8000300c:	06e68a63          	beq	a3,a4,80003080 <__truncdfsf2+0x190>
80003010:	fc000737          	lui	a4,0xfc000
80003014:	fff70713          	addi	a4,a4,-1 # fbffffff <_stack_start+0x7bff960f>
80003018:	00e7f7b3          	and	a5,a5,a4
8000301c:	0ff00713          	li	a4,255
80003020:	0037d793          	srli	a5,a5,0x3
80003024:	00e69863          	bne	a3,a4,80003034 <__truncdfsf2+0x144>
80003028:	00078663          	beqz	a5,80003034 <__truncdfsf2+0x144>
8000302c:	004007b7          	lui	a5,0x400
80003030:	00000593          	li	a1,0
80003034:	00800537          	lui	a0,0x800
80003038:	fff50513          	addi	a0,a0,-1 # 7fffff <_stack_size+0x7ffbff>
8000303c:	00a7f7b3          	and	a5,a5,a0
80003040:	80800537          	lui	a0,0x80800
80003044:	fff50513          	addi	a0,a0,-1 # 807fffff <_stack_start+0x7f960f>
80003048:	0ff6f693          	andi	a3,a3,255
8000304c:	01769693          	slli	a3,a3,0x17
80003050:	00a7f7b3          	and	a5,a5,a0
80003054:	01f59593          	slli	a1,a1,0x1f
80003058:	00d7e7b3          	or	a5,a5,a3
8000305c:	00b7e533          	or	a0,a5,a1
80003060:	00008067          	ret
80003064:	00100793          	li	a5,1
80003068:	00000693          	li	a3,0
8000306c:	00f7f713          	andi	a4,a5,15
80003070:	00400613          	li	a2,4
80003074:	f8c704e3          	beq	a4,a2,80002ffc <__truncdfsf2+0x10c>
80003078:	00478793          	addi	a5,a5,4 # 400004 <_stack_size+0x3ffc04>
8000307c:	f81ff06f          	j	80002ffc <__truncdfsf2+0x10c>
80003080:	00000793          	li	a5,0
80003084:	f99ff06f          	j	8000301c <__truncdfsf2+0x12c>

80003088 <__mulsi3>:
80003088:	00050613          	mv	a2,a0
8000308c:	00000513          	li	a0,0
80003090:	0015f693          	andi	a3,a1,1
80003094:	00068463          	beqz	a3,8000309c <__mulsi3+0x14>
80003098:	00c50533          	add	a0,a0,a2
8000309c:	0015d593          	srli	a1,a1,0x1
800030a0:	00161613          	slli	a2,a2,0x1
800030a4:	fe0596e3          	bnez	a1,80003090 <__mulsi3+0x8>
800030a8:	00008067          	ret

800030ac <__divsi3>:
800030ac:	06054063          	bltz	a0,8000310c <__umodsi3+0x10>
800030b0:	0605c663          	bltz	a1,8000311c <__umodsi3+0x20>

800030b4 <__udivsi3>:
800030b4:	00058613          	mv	a2,a1
800030b8:	00050593          	mv	a1,a0
800030bc:	fff00513          	li	a0,-1
800030c0:	02060c63          	beqz	a2,800030f8 <__udivsi3+0x44>
800030c4:	00100693          	li	a3,1
800030c8:	00b67a63          	bleu	a1,a2,800030dc <__udivsi3+0x28>
800030cc:	00c05863          	blez	a2,800030dc <__udivsi3+0x28>
800030d0:	00161613          	slli	a2,a2,0x1
800030d4:	00169693          	slli	a3,a3,0x1
800030d8:	feb66ae3          	bltu	a2,a1,800030cc <__udivsi3+0x18>
800030dc:	00000513          	li	a0,0
800030e0:	00c5e663          	bltu	a1,a2,800030ec <__udivsi3+0x38>
800030e4:	40c585b3          	sub	a1,a1,a2
800030e8:	00d56533          	or	a0,a0,a3
800030ec:	0016d693          	srli	a3,a3,0x1
800030f0:	00165613          	srli	a2,a2,0x1
800030f4:	fe0696e3          	bnez	a3,800030e0 <__udivsi3+0x2c>
800030f8:	00008067          	ret

800030fc <__umodsi3>:
800030fc:	00008293          	mv	t0,ra
80003100:	fb5ff0ef          	jal	ra,800030b4 <__udivsi3>
80003104:	00058513          	mv	a0,a1
80003108:	00028067          	jr	t0
8000310c:	40a00533          	neg	a0,a0
80003110:	0005d863          	bgez	a1,80003120 <__umodsi3+0x24>
80003114:	40b005b3          	neg	a1,a1
80003118:	f9dff06f          	j	800030b4 <__udivsi3>
8000311c:	40b005b3          	neg	a1,a1
80003120:	00008293          	mv	t0,ra
80003124:	f91ff0ef          	jal	ra,800030b4 <__udivsi3>
80003128:	40a00533          	neg	a0,a0
8000312c:	00028067          	jr	t0

80003130 <__modsi3>:
80003130:	00008293          	mv	t0,ra
80003134:	0005ca63          	bltz	a1,80003148 <__modsi3+0x18>
80003138:	00054c63          	bltz	a0,80003150 <__modsi3+0x20>
8000313c:	f79ff0ef          	jal	ra,800030b4 <__udivsi3>
80003140:	00058513          	mv	a0,a1
80003144:	00028067          	jr	t0
80003148:	40b005b3          	neg	a1,a1
8000314c:	fe0558e3          	bgez	a0,8000313c <__modsi3+0xc>
80003150:	40a00533          	neg	a0,a0
80003154:	f61ff0ef          	jal	ra,800030b4 <__udivsi3>
80003158:	40b00533          	neg	a0,a1
8000315c:	00028067          	jr	t0

80003160 <__clzsi2>:
80003160:	000107b7          	lui	a5,0x10
80003164:	02f57a63          	bleu	a5,a0,80003198 <__clzsi2+0x38>
80003168:	0ff00793          	li	a5,255
8000316c:	00a7b7b3          	sltu	a5,a5,a0
80003170:	00379793          	slli	a5,a5,0x3
80003174:	02000713          	li	a4,32
80003178:	40f70733          	sub	a4,a4,a5
8000317c:	00f557b3          	srl	a5,a0,a5
80003180:	00000517          	auipc	a0,0x0
80003184:	74850513          	addi	a0,a0,1864 # 800038c8 <__clz_tab>
80003188:	00f507b3          	add	a5,a0,a5
8000318c:	0007c503          	lbu	a0,0(a5) # 10000 <_stack_size+0xfc00>
80003190:	40a70533          	sub	a0,a4,a0
80003194:	00008067          	ret
80003198:	01000737          	lui	a4,0x1000
8000319c:	01000793          	li	a5,16
800031a0:	fce56ae3          	bltu	a0,a4,80003174 <__clzsi2+0x14>
800031a4:	01800793          	li	a5,24
800031a8:	fcdff06f          	j	80003174 <__clzsi2+0x14>

Disassembly of section .text.startup:

800031ac <main>:
int main() {
800031ac:	fe010113          	addi	sp,sp,-32
	uartConfig.dataLength = 8;
800031b0:	00800793          	li	a5,8
	uart_applyConfig(UART,&uartConfig);
800031b4:	00010513          	mv	a0,sp
	uartConfig.dataLength = 8;
800031b8:	00f12023          	sw	a5,0(sp)
	uartConfig.clockDivider = 12000000/UART_SAMPLE_PER_BAUD/115200-1;
800031bc:	01300793          	li	a5,19
int main() {
800031c0:	00112e23          	sw	ra,28(sp)
	uartConfig.clockDivider = 12000000/UART_SAMPLE_PER_BAUD/115200-1;
800031c4:	00f12623          	sw	a5,12(sp)
	uartConfig.parity = NONE;
800031c8:	00012223          	sw	zero,4(sp)
	uartConfig.stop = ONE;
800031cc:	00012423          	sw	zero,8(sp)
	uart_applyConfig(UART,&uartConfig);
800031d0:	f61fc0ef          	jal	ra,80000130 <uart_applyConfig.constprop.1>
	interruptCtrl_init(TIMER_INTERRUPT);
800031d4:	f75fc0ef          	jal	ra,80000148 <interruptCtrl_init.constprop.2>
	timer_init(TIMER_A);
800031d8:	f85fc0ef          	jal	ra,8000015c <timer_init.constprop.3>
	TIMER_PRESCALER->LIMIT = 99;
800031dc:	f00207b7          	lui	a5,0xf0020
800031e0:	06300713          	li	a4,99
800031e4:	00e7a023          	sw	a4,0(a5) # f0020000 <_stack_start+0x70019610>
	TIMER_A->LIMIT = ~0;
800031e8:	fff00693          	li	a3,-1
	TIMER_A->CLEARS_TICKS = 0x00010002;
800031ec:	00010737          	lui	a4,0x10
	TIMER_A->LIMIT = ~0;
800031f0:	04d7a223          	sw	a3,68(a5)
	TIMER_A->CLEARS_TICKS = 0x00010002;
800031f4:	00270713          	addi	a4,a4,2 # 10002 <_stack_size+0xfc02>
800031f8:	04e7a023          	sw	a4,64(a5)
	main2();
800031fc:	95cfd0ef          	jal	ra,80000358 <main2>
}
80003200:	01c12083          	lw	ra,28(sp)
80003204:	00000513          	li	a0,0
80003208:	02010113          	addi	sp,sp,32
8000320c:	00008067          	ret
