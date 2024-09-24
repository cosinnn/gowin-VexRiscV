
build/dhrystone.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
.global crtStart
.global main
.global irqCallback

crtStart:
  j crtInit
80000000:	a8ad                	j	8000007a <crtInit>
  nop
80000002:	0001                	nop
  nop
80000004:	0001                	nop
  nop
80000006:	0001                	nop
  nop
80000008:	0001                	nop
  nop
8000000a:	0001                	nop
  nop
8000000c:	0001                	nop
  nop
8000000e:	0001                	nop

80000010 <trap_entry>:

.global  trap_entry
trap_entry:
  sw x1,  - 1*4(sp)
80000010:	fe112e23          	sw	ra,-4(sp)
  sw x5,  - 2*4(sp)
80000014:	fe512c23          	sw	t0,-8(sp)
  sw x6,  - 3*4(sp)
80000018:	fe612a23          	sw	t1,-12(sp)
  sw x7,  - 4*4(sp)
8000001c:	fe712823          	sw	t2,-16(sp)
  sw x10, - 5*4(sp)
80000020:	fea12623          	sw	a0,-20(sp)
  sw x11, - 6*4(sp)
80000024:	feb12423          	sw	a1,-24(sp)
  sw x12, - 7*4(sp)
80000028:	fec12223          	sw	a2,-28(sp)
  sw x13, - 8*4(sp)
8000002c:	fed12023          	sw	a3,-32(sp)
  sw x14, - 9*4(sp)
80000030:	fce12e23          	sw	a4,-36(sp)
  sw x15, -10*4(sp)
80000034:	fcf12c23          	sw	a5,-40(sp)
  sw x16, -11*4(sp)
80000038:	fd012a23          	sw	a6,-44(sp)
  sw x17, -12*4(sp)
8000003c:	fd112823          	sw	a7,-48(sp)
  sw x28, -13*4(sp)
80000040:	fdc12623          	sw	t3,-52(sp)
  sw x29, -14*4(sp)
80000044:	fdd12423          	sw	t4,-56(sp)
  sw x30, -15*4(sp)
80000048:	fde12223          	sw	t5,-60(sp)
  sw x31, -16*4(sp)
8000004c:	fdf12023          	sw	t6,-64(sp)
  addi sp,sp,-16*4
80000050:	7139                	addi	sp,sp,-64
  call irqCallback
80000052:	28ad                	jal	800000cc <irqCallback>
  lw x1 , 15*4(sp)
80000054:	50f2                	lw	ra,60(sp)
  lw x5,  14*4(sp)
80000056:	52e2                	lw	t0,56(sp)
  lw x6,  13*4(sp)
80000058:	5352                	lw	t1,52(sp)
  lw x7,  12*4(sp)
8000005a:	53c2                	lw	t2,48(sp)
  lw x10, 11*4(sp)
8000005c:	5532                	lw	a0,44(sp)
  lw x11, 10*4(sp)
8000005e:	55a2                	lw	a1,40(sp)
  lw x12,  9*4(sp)
80000060:	5612                	lw	a2,36(sp)
  lw x13,  8*4(sp)
80000062:	5682                	lw	a3,32(sp)
  lw x14,  7*4(sp)
80000064:	4772                	lw	a4,28(sp)
  lw x15,  6*4(sp)
80000066:	47e2                	lw	a5,24(sp)
  lw x16,  5*4(sp)
80000068:	4852                	lw	a6,20(sp)
  lw x17,  4*4(sp)
8000006a:	48c2                	lw	a7,16(sp)
  lw x28,  3*4(sp)
8000006c:	4e32                	lw	t3,12(sp)
  lw x29,  2*4(sp)
8000006e:	4ea2                	lw	t4,8(sp)
  lw x30,  1*4(sp)
80000070:	4f12                	lw	t5,4(sp)
  lw x31,  0*4(sp)
80000072:	4f82                	lw	t6,0(sp)
  addi sp,sp,16*4
80000074:	6121                	addi	sp,sp,64
  mret
80000076:	30200073          	mret

8000007a <crtInit>:


crtInit:
  .option push
  .option norelax
  la gp, __global_pointer$
8000007a:	00003197          	auipc	gp,0x3
8000007e:	06618193          	addi	gp,gp,102 # 800030e0 <__global_pointer$>
  .option pop
  la sp, _stack_start
80000082:	00006117          	auipc	sp,0x6
80000086:	88e10113          	addi	sp,sp,-1906 # 80005910 <_stack_start>

8000008a <bss_init>:

bss_init:
  la a0, _bss_start
8000008a:	81c18513          	addi	a0,gp,-2020 # 800028fc <Dhrystones_Per_Second>
  la a1, _bss_end
8000008e:	00005597          	auipc	a1,0x5
80000092:	47658593          	addi	a1,a1,1142 # 80005504 <_bss_end>

80000096 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
80000096:	00b50663          	beq	a0,a1,800000a2 <bss_done>
  sw zero,0(a0)
8000009a:	00052023          	sw	zero,0(a0)
  add a0,a0,4
8000009e:	0511                	addi	a0,a0,4
  j bss_loop
800000a0:	bfdd                	j	80000096 <bss_loop>

800000a2 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000a2:	00003517          	auipc	a0,0x3
800000a6:	83e50513          	addi	a0,a0,-1986 # 800028e0 <_ctors_end>
  addi sp,sp,-4
800000aa:	1171                	addi	sp,sp,-4

800000ac <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000ac:	00003597          	auipc	a1,0x3
800000b0:	83458593          	addi	a1,a1,-1996 # 800028e0 <_ctors_end>
  beq a0,a1,ctors_done
800000b4:	00b50863          	beq	a0,a1,800000c4 <ctors_done>
  lw a3,0(a0)
800000b8:	4114                	lw	a3,0(a0)
  add a0,a0,4
800000ba:	0511                	addi	a0,a0,4
  sw a0,0(sp)
800000bc:	c02a                	sw	a0,0(sp)
  jalr  a3
800000be:	9682                	jalr	a3
  lw a0,0(sp)
800000c0:	4502                	lw	a0,0(sp)
  j ctors_loop
800000c2:	b7ed                	j	800000ac <ctors_loop>

800000c4 <ctors_done>:
ctors_done:
  addi sp,sp,4
800000c4:	0111                	addi	sp,sp,4
  //li a0, 0x880     //880 enable timer + external interrupts
  //csrw mie,a0
  //li a0, 0x1808     //1808 enable interrupts
  //csrw mstatus,a0

  call main
800000c6:	048020ef          	jal	ra,8000210e <end>

800000ca <infinitLoop>:
infinitLoop:
  j infinitLoop
800000ca:	a001                	j	800000ca <infinitLoop>

Disassembly of section .memory:

800000cc <irqCallback>:
}


void irqCallback(int irq){

}
800000cc:	8082                	ret

800000ce <Proc_2>:
  One_Fifty  Int_Loc;  
  Enumeration   Enum_Loc;

  Int_Loc = *Int_Par_Ref + 10;
  do /* executed once */
    if (Ch_1_Glob == 'A')
800000ce:	8351c703          	lbu	a4,-1995(gp) # 80002915 <Ch_1_Glob>
800000d2:	04100793          	li	a5,65
800000d6:	00f70363          	beq	a4,a5,800000dc <Proc_2+0xe>
      Int_Loc -= 1;
      *Int_Par_Ref = Int_Loc - Int_Glob;
      Enum_Loc = Ident_1;
    } /* if */
  while (Enum_Loc != Ident_1); /* true */
} /* Proc_2 */
800000da:	8082                	ret
      Int_Loc -= 1;
800000dc:	411c                	lw	a5,0(a0)
      *Int_Par_Ref = Int_Loc - Int_Glob;
800000de:	83c1a703          	lw	a4,-1988(gp) # 8000291c <Int_Glob>
      Int_Loc -= 1;
800000e2:	07a5                	addi	a5,a5,9
      *Int_Par_Ref = Int_Loc - Int_Glob;
800000e4:	8f99                	sub	a5,a5,a4
800000e6:	c11c                	sw	a5,0(a0)
} /* Proc_2 */
800000e8:	8082                	ret

800000ea <Proc_3>:
    /* Ptr_Ref_Par becomes Ptr_Glob */

Rec_Pointer *Ptr_Ref_Par;

{
  if (Ptr_Glob != Null)
800000ea:	8441a603          	lw	a2,-1980(gp) # 80002924 <Ptr_Glob>
800000ee:	c609                	beqz	a2,800000f8 <Proc_3+0xe>
    /* then, executed */
    *Ptr_Ref_Par = Ptr_Glob->Ptr_Comp;
800000f0:	4218                	lw	a4,0(a2)
800000f2:	c118                	sw	a4,0(a0)
800000f4:	8441a603          	lw	a2,-1980(gp) # 80002924 <Ptr_Glob>
  Proc_7 (10, Int_Glob, &Ptr_Glob->variant.var_1.Int_Comp);
800000f8:	83c1a583          	lw	a1,-1988(gp) # 8000291c <Int_Glob>
800000fc:	0631                	addi	a2,a2,12
800000fe:	4529                	li	a0,10
80000100:	6c80006f          	j	800007c8 <Proc_7>

80000104 <Proc_1>:
{
80000104:	1141                	addi	sp,sp,-16
80000106:	c04a                	sw	s2,0(sp)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
80000108:	8441a783          	lw	a5,-1980(gp) # 80002924 <Ptr_Glob>
{
8000010c:	c422                	sw	s0,8(sp)
  REG Rec_Pointer Next_Record = Ptr_Val_Par->Ptr_Comp;  
8000010e:	4100                	lw	s0,0(a0)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
80000110:	4398                	lw	a4,0(a5)
{
80000112:	c226                	sw	s1,4(sp)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
80000114:	0047ae83          	lw	t4,4(a5)
80000118:	0087ae03          	lw	t3,8(a5)
8000011c:	0107a303          	lw	t1,16(a5)
80000120:	0147a883          	lw	a7,20(a5)
80000124:	0187a803          	lw	a6,24(a5)
80000128:	538c                	lw	a1,32(a5)
8000012a:	53d0                	lw	a2,36(a5)
8000012c:	5794                	lw	a3,40(a5)
{
8000012e:	c606                	sw	ra,12(sp)
80000130:	84aa                	mv	s1,a0
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
80000132:	4fc8                	lw	a0,28(a5)
80000134:	57dc                	lw	a5,44(a5)
80000136:	c018                	sw	a4,0(s0)
  Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
80000138:	4098                	lw	a4,0(s1)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
8000013a:	cc48                	sw	a0,28(s0)
8000013c:	d45c                	sw	a5,44(s0)
8000013e:	01d42223          	sw	t4,4(s0)
  Ptr_Val_Par->variant.var_1.Int_Comp = 5;
80000142:	4795                	li	a5,5
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob); 
80000144:	01c42423          	sw	t3,8(s0)
80000148:	00642823          	sw	t1,16(s0)
8000014c:	01142a23          	sw	a7,20(s0)
80000150:	01042c23          	sw	a6,24(s0)
80000154:	d00c                	sw	a1,32(s0)
80000156:	d050                	sw	a2,36(s0)
80000158:	d414                	sw	a3,40(s0)
  Ptr_Val_Par->variant.var_1.Int_Comp = 5;
8000015a:	c4dc                	sw	a5,12(s1)
        = Ptr_Val_Par->variant.var_1.Int_Comp;
8000015c:	c45c                	sw	a5,12(s0)
  Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
8000015e:	c018                	sw	a4,0(s0)
  Proc_3 (&Next_Record->Ptr_Comp);
80000160:	8522                	mv	a0,s0
80000162:	3761                	jal	800000ea <Proc_3>
  if (Next_Record->Discr == Ident_1)
80000164:	405c                	lw	a5,4(s0)
80000166:	cfb1                	beqz	a5,800001c2 <Proc_1+0xbe>
    structassign (*Ptr_Val_Par, *Ptr_Val_Par->Ptr_Comp);
80000168:	409c                	lw	a5,0(s1)
} /* Proc_1 */
8000016a:	40b2                	lw	ra,12(sp)
8000016c:	4422                	lw	s0,8(sp)
    structassign (*Ptr_Val_Par, *Ptr_Val_Par->Ptr_Comp);
8000016e:	0007af83          	lw	t6,0(a5)
80000172:	0047af03          	lw	t5,4(a5)
80000176:	0087ae83          	lw	t4,8(a5)
8000017a:	00c7ae03          	lw	t3,12(a5)
8000017e:	0107a303          	lw	t1,16(a5)
80000182:	0147a883          	lw	a7,20(a5)
80000186:	0187a803          	lw	a6,24(a5)
8000018a:	4fcc                	lw	a1,28(a5)
8000018c:	5390                	lw	a2,32(a5)
8000018e:	53d4                	lw	a3,36(a5)
80000190:	5798                	lw	a4,40(a5)
80000192:	57dc                	lw	a5,44(a5)
80000194:	01f4a023          	sw	t6,0(s1)
80000198:	01e4a223          	sw	t5,4(s1)
8000019c:	01d4a423          	sw	t4,8(s1)
800001a0:	01c4a623          	sw	t3,12(s1)
800001a4:	0064a823          	sw	t1,16(s1)
800001a8:	0114aa23          	sw	a7,20(s1)
800001ac:	0104ac23          	sw	a6,24(s1)
800001b0:	cccc                	sw	a1,28(s1)
800001b2:	d090                	sw	a2,32(s1)
800001b4:	d0d4                	sw	a3,36(s1)
800001b6:	d498                	sw	a4,40(s1)
800001b8:	d4dc                	sw	a5,44(s1)
} /* Proc_1 */
800001ba:	4902                	lw	s2,0(sp)
800001bc:	4492                	lw	s1,4(sp)
800001be:	0141                	addi	sp,sp,16
800001c0:	8082                	ret
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp, 
800001c2:	4488                	lw	a0,8(s1)
    Next_Record->variant.var_1.Int_Comp = 6;
800001c4:	4799                	li	a5,6
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp, 
800001c6:	00840593          	addi	a1,s0,8
    Next_Record->variant.var_1.Int_Comp = 6;
800001ca:	c45c                	sw	a5,12(s0)
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp, 
800001cc:	69e000ef          	jal	ra,8000086a <Proc_6>
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
800001d0:	8441a783          	lw	a5,-1980(gp) # 80002924 <Ptr_Glob>
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10, 
800001d4:	4448                	lw	a0,12(s0)
800001d6:	00c40613          	addi	a2,s0,12
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
800001da:	439c                	lw	a5,0(a5)
} /* Proc_1 */
800001dc:	40b2                	lw	ra,12(sp)
800001de:	4492                	lw	s1,4(sp)
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
800001e0:	c01c                	sw	a5,0(s0)
} /* Proc_1 */
800001e2:	4422                	lw	s0,8(sp)
800001e4:	4902                	lw	s2,0(sp)
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10, 
800001e6:	45a9                	li	a1,10
} /* Proc_1 */
800001e8:	0141                	addi	sp,sp,16
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10, 
800001ea:	5de0006f          	j	800007c8 <Proc_7>

800001ee <Proc_4>:
/*******/
    /* executed once */
{
  Boolean Bool_Loc;

  Bool_Loc = Ch_1_Glob == 'A';
800001ee:	8351c783          	lbu	a5,-1995(gp) # 80002915 <Ch_1_Glob>
  Bool_Glob = Bool_Loc | Bool_Glob;
800001f2:	8381a683          	lw	a3,-1992(gp) # 80002918 <Bool_Glob>
  Bool_Loc = Ch_1_Glob == 'A';
800001f6:	fbf78793          	addi	a5,a5,-65
800001fa:	0017b793          	seqz	a5,a5
  Bool_Glob = Bool_Loc | Bool_Glob;
800001fe:	8fd5                	or	a5,a5,a3
80000200:	82f1ac23          	sw	a5,-1992(gp) # 80002918 <Bool_Glob>
  Ch_2_Glob = 'B';
80000204:	04200713          	li	a4,66
80000208:	82e18a23          	sb	a4,-1996(gp) # 80002914 <Ch_2_Glob>
} /* Proc_4 */
8000020c:	8082                	ret

8000020e <Proc_5>:

Proc_5 () /* without parameters */
/*******/
    /* executed once */
{
  Ch_1_Glob = 'A';
8000020e:	04100713          	li	a4,65
80000212:	82e18aa3          	sb	a4,-1995(gp) # 80002915 <Ch_1_Glob>
  Bool_Glob = false;
80000216:	8201ac23          	sw	zero,-1992(gp) # 80002918 <Bool_Glob>
} /* Proc_5 */
8000021a:	8082                	ret

8000021c <main2>:
{
8000021c:	7135                	addi	sp,sp,-160
  Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
8000021e:	03000513          	li	a0,48
{
80000222:	cf06                	sw	ra,156(sp)
80000224:	cd22                	sw	s0,152(sp)
80000226:	dae6                	sw	s9,116(sp)
80000228:	d6ee                	sw	s11,108(sp)
8000022a:	cb26                	sw	s1,148(sp)
8000022c:	c94a                	sw	s2,144(sp)
8000022e:	c74e                	sw	s3,140(sp)
80000230:	c552                	sw	s4,136(sp)
80000232:	c356                	sw	s5,132(sp)
80000234:	c15a                	sw	s6,128(sp)
80000236:	dede                	sw	s7,124(sp)
80000238:	dce2                	sw	s8,120(sp)
8000023a:	d8ea                	sw	s10,112(sp)
  Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
8000023c:	714000ef          	jal	ra,80000950 <malloc>
80000240:	84a1a023          	sw	a0,-1984(gp) # 80002920 <Next_Ptr_Glob>
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
80000244:	03000513          	li	a0,48
80000248:	708000ef          	jal	ra,80000950 <malloc>
  Ptr_Glob->Ptr_Comp                    = Next_Ptr_Glob;
8000024c:	8401a783          	lw	a5,-1984(gp) # 80002920 <Next_Ptr_Glob>
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
80000250:	84a1a223          	sw	a0,-1980(gp) # 80002924 <Ptr_Glob>
  Ptr_Glob->Ptr_Comp                    = Next_Ptr_Glob;
80000254:	c11c                	sw	a5,0(a0)
  Ptr_Glob->variant.var_1.Enum_Comp     = Ident_3;
80000256:	4789                	li	a5,2
80000258:	c51c                	sw	a5,8(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp, 
8000025a:	800025b7          	lui	a1,0x80002
  Ptr_Glob->variant.var_1.Int_Comp      = 40;
8000025e:	02800793          	li	a5,40
80000262:	c55c                	sw	a5,12(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp, 
80000264:	467d                	li	a2,31
80000266:	12858593          	addi	a1,a1,296 # 80002128 <_stack_start+0xffffc818>
  Ptr_Glob->Discr                       = Ident_1;
8000026a:	00052223          	sw	zero,4(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp, 
8000026e:	0541                	addi	a0,a0,16
80000270:	7e2000ef          	jal	ra,80000a52 <memcpy>
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
80000274:	80002737          	lui	a4,0x80002
80000278:	69070793          	addi	a5,a4,1680 # 80002690 <_stack_start+0xffffcd80>
8000027c:	69072e03          	lw	t3,1680(a4)
80000280:	0047a303          	lw	t1,4(a5)
80000284:	0087a883          	lw	a7,8(a5)
80000288:	00c7a803          	lw	a6,12(a5)
8000028c:	4b8c                	lw	a1,16(a5)
8000028e:	4bd0                	lw	a2,20(a5)
80000290:	4f94                	lw	a3,24(a5)
80000292:	01c7d703          	lhu	a4,28(a5)
80000296:	01e7c783          	lbu	a5,30(a5)
  Arr_2_Glob [8][7] = 10;
8000029a:	80003db7          	lui	s11,0x80003
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
8000029e:	02e11e23          	sh	a4,60(sp)
800002a2:	02f10f23          	sb	a5,62(sp)
  Arr_2_Glob [8][7] = 10;
800002a6:	9f4d8713          	addi	a4,s11,-1548 # 800029f4 <_stack_start+0xffffd0e4>
800002aa:	47a9                	li	a5,10
  printf ("\n");
800002ac:	4529                	li	a0,10
  Arr_2_Glob [8][7] = 10;
800002ae:	64f72e23          	sw	a5,1628(a4)
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
800002b2:	d072                	sw	t3,32(sp)
800002b4:	d21a                	sw	t1,36(sp)
800002b6:	d446                	sw	a7,40(sp)
800002b8:	d642                	sw	a6,44(sp)
800002ba:	d82e                	sw	a1,48(sp)
800002bc:	da32                	sw	a2,52(sp)
800002be:	dc36                	sw	a3,56(sp)
  printf ("\n");
800002c0:	77e000ef          	jal	ra,80000a3e <putchar>
  printf ("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
800002c4:	80002537          	lui	a0,0x80002
800002c8:	14850513          	addi	a0,a0,328 # 80002148 <_stack_start+0xffffc838>
800002cc:	74c000ef          	jal	ra,80000a18 <puts>
  printf ("\n");
800002d0:	4529                	li	a0,10
800002d2:	76c000ef          	jal	ra,80000a3e <putchar>
  if (Reg)
800002d6:	8301a783          	lw	a5,-2000(gp) # 80002910 <Reg>
800002da:	4a078e63          	beqz	a5,80000796 <main2+0x57a>
    printf ("Program compiled with 'register' attribute\n");
800002de:	80002537          	lui	a0,0x80002
800002e2:	17850513          	addi	a0,a0,376 # 80002178 <_stack_start+0xffffc868>
800002e6:	732000ef          	jal	ra,80000a18 <puts>
    printf ("\n");
800002ea:	4529                	li	a0,10
800002ec:	752000ef          	jal	ra,80000a3e <putchar>
  printf ("Please give the number of runs through the benchmark: ");
800002f0:	80002537          	lui	a0,0x80002
800002f4:	1d450513          	addi	a0,a0,468 # 800021d4 <_stack_start+0xffffc8c4>
800002f8:	67a000ef          	jal	ra,80000972 <printf>
  printf ("\n");
800002fc:	4529                	li	a0,10
800002fe:	740000ef          	jal	ra,80000a3e <putchar>
  printf ("Execution starts, %d runs through Dhrystone\n", Number_Of_Runs);
80000302:	80002537          	lui	a0,0x80002
80000306:	0c800593          	li	a1,200
8000030a:	20c50513          	addi	a0,a0,524 # 8000220c <_stack_start+0xffffc8fc>
8000030e:	664000ef          	jal	ra,80000972 <printf>
  Begin_Time = clock();
80000312:	736000ef          	jal	ra,80000a48 <clock>
80000316:	80002437          	lui	s0,0x80002
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
8000031a:	6b042783          	lw	a5,1712(s0) # 800026b0 <_stack_start+0xffffcda0>
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
8000031e:	80002d37          	lui	s10,0x80002
80000322:	6d0d2c03          	lw	s8,1744(s10) # 800026d0 <_stack_start+0xffffcdc0>
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
80000326:	c63e                	sw	a5,12(sp)
  Begin_Time = clock();
80000328:	82a1a623          	sw	a0,-2004(gp) # 8000290c <Begin_Time>
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
8000032c:	4985                	li	s3,1
8000032e:	6b040413          	addi	s0,s0,1712
    Int_1_Loc = 2;
80000332:	4489                	li	s1,2
    Proc_5();
80000334:	3de9                	jal	8000020e <Proc_5>
    Proc_4();
80000336:	3d65                	jal	800001ee <Proc_4>
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
80000338:	01e44783          	lbu	a5,30(s0)
8000033c:	4850                	lw	a2,20(s0)
8000033e:	00442e03          	lw	t3,4(s0)
80000342:	00842303          	lw	t1,8(s0)
80000346:	00c42883          	lw	a7,12(s0)
8000034a:	01042803          	lw	a6,16(s0)
8000034e:	4c14                	lw	a3,24(s0)
80000350:	01c45703          	lhu	a4,28(s0)
80000354:	4eb2                	lw	t4,12(sp)
80000356:	04f10f23          	sb	a5,94(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
8000035a:	008c                	addi	a1,sp,64
    Enum_Loc = Ident_2;
8000035c:	4785                	li	a5,1
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
8000035e:	1008                	addi	a0,sp,32
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
80000360:	cab2                	sw	a2,84(sp)
    Enum_Loc = Ident_2;
80000362:	ce3e                	sw	a5,28(sp)
    Int_1_Loc = 2;
80000364:	ca26                	sw	s1,20(sp)
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
80000366:	c0f6                	sw	t4,64(sp)
80000368:	c2f2                	sw	t3,68(sp)
8000036a:	c49a                	sw	t1,72(sp)
8000036c:	c6c6                	sw	a7,76(sp)
8000036e:	c8c2                	sw	a6,80(sp)
80000370:	ccb6                	sw	a3,88(sp)
80000372:	04e11e23          	sh	a4,92(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
80000376:	2955                	jal	8000082a <Func_2>
    while (Int_1_Loc < Int_2_Loc)  /* loop body executed once */
80000378:	4652                	lw	a2,20(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
8000037a:	00153513          	seqz	a0,a0
8000037e:	82a1ac23          	sw	a0,-1992(gp) # 80002918 <Bool_Glob>
    while (Int_1_Loc < Int_2_Loc)  /* loop body executed once */
80000382:	02c4c063          	blt	s1,a2,800003a2 <main2+0x186>
      Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
80000386:	00261793          	slli	a5,a2,0x2
8000038a:	97b2                	add	a5,a5,a2
8000038c:	17f5                	addi	a5,a5,-3
      Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
8000038e:	8532                	mv	a0,a2
80000390:	458d                	li	a1,3
80000392:	0830                	addi	a2,sp,24
      Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
80000394:	cc3e                	sw	a5,24(sp)
      Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
80000396:	290d                	jal	800007c8 <Proc_7>
      Int_1_Loc += 1;
80000398:	4652                	lw	a2,20(sp)
8000039a:	0605                	addi	a2,a2,1
8000039c:	ca32                	sw	a2,20(sp)
    while (Int_1_Loc < Int_2_Loc)  /* loop body executed once */
8000039e:	fec4d4e3          	ble	a2,s1,80000386 <main2+0x16a>
    Proc_8 (Arr_1_Glob, Arr_2_Glob, Int_1_Loc, Int_3_Loc);
800003a2:	46e2                	lw	a3,24(sp)
800003a4:	84c18513          	addi	a0,gp,-1972 # 8000292c <Arr_1_Glob>
800003a8:	9f4d8593          	addi	a1,s11,-1548
800003ac:	2115                	jal	800007d0 <Proc_8>
    Proc_1 (Ptr_Glob);
800003ae:	8441a503          	lw	a0,-1980(gp) # 80002924 <Ptr_Glob>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
800003b2:	04100a93          	li	s5,65
    Int_2_Loc = 3;
800003b6:	4a0d                	li	s4,3
    Proc_1 (Ptr_Glob);
800003b8:	33b1                	jal	80000104 <Proc_1>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
800003ba:	8341c703          	lbu	a4,-1996(gp) # 80002914 <Ch_2_Glob>
800003be:	04000793          	li	a5,64
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
800003c2:	6d0d0b13          	addi	s6,s10,1744
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
800003c6:	02e7f163          	bleu	a4,a5,800003e8 <main2+0x1cc>
      if (Enum_Loc == Func_1 (Ch_Index, 'C'))
800003ca:	8556                	mv	a0,s5
800003cc:	04300593          	li	a1,67
800003d0:	2189                	jal	80000812 <Func_1>
800003d2:	47f2                	lw	a5,28(sp)
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
800003d4:	001a8713          	addi	a4,s5,1
      if (Enum_Loc == Func_1 (Ch_Index, 'C'))
800003d8:	36f50663          	beq	a0,a5,80000744 <main2+0x528>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
800003dc:	8341c783          	lbu	a5,-1996(gp) # 80002914 <Ch_2_Glob>
800003e0:	0ff77a93          	andi	s5,a4,255
800003e4:	ff57f3e3          	bleu	s5,a5,800003ca <main2+0x1ae>
    Int_2_Loc = Int_2_Loc * Int_1_Loc;
800003e8:	47d2                	lw	a5,20(sp)
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
800003ea:	4b62                	lw	s6,24(sp)
    Proc_2 (&Int_1_Loc);
800003ec:	0848                	addi	a0,sp,20
    Int_2_Loc = Int_2_Loc * Int_1_Loc;
800003ee:	02fa0a33          	mul	s4,s4,a5
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
800003f2:	0985                	addi	s3,s3,1
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
800003f4:	036a4ab3          	div	s5,s4,s6
800003f8:	ca56                	sw	s5,20(sp)
    Proc_2 (&Int_1_Loc);
800003fa:	39d1                	jal	800000ce <Proc_2>
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
800003fc:	0c900793          	li	a5,201
80000400:	f2f99ae3          	bne	s3,a5,80000334 <main2+0x118>
  End_Time = clock();
80000404:	644000ef          	jal	ra,80000a48 <clock>
80000408:	82a1a423          	sw	a0,-2008(gp) # 80002908 <End_Time>
  printf ("Execution ends\n");
8000040c:	80002537          	lui	a0,0x80002
80000410:	23c50513          	addi	a0,a0,572 # 8000223c <_stack_start+0xffffc92c>
80000414:	604000ef          	jal	ra,80000a18 <puts>
  printf ("\n");
80000418:	4529                	li	a0,10
8000041a:	624000ef          	jal	ra,80000a3e <putchar>
  printf ("Final values of the variables used in the benchmark:\n");
8000041e:	80002537          	lui	a0,0x80002
80000422:	24c50513          	addi	a0,a0,588 # 8000224c <_stack_start+0xffffc93c>
80000426:	5f2000ef          	jal	ra,80000a18 <puts>
  printf ("\n");
8000042a:	4529                	li	a0,10
8000042c:	612000ef          	jal	ra,80000a3e <putchar>
  printf ("Int_Glob:            %d\n", Int_Glob);
80000430:	83c1a583          	lw	a1,-1988(gp) # 8000291c <Int_Glob>
80000434:	80002537          	lui	a0,0x80002
80000438:	28450513          	addi	a0,a0,644 # 80002284 <_stack_start+0xffffc974>
  printf ("        should be:   %d\n", 5);
8000043c:	80002437          	lui	s0,0x80002
  printf ("Int_Glob:            %d\n", Int_Glob);
80000440:	2b0d                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 5);
80000442:	4595                	li	a1,5
80000444:	2a040513          	addi	a0,s0,672 # 800022a0 <_stack_start+0xffffc990>
80000448:	232d                	jal	80000972 <printf>
  printf ("Bool_Glob:           %d\n", Bool_Glob);
8000044a:	8381a583          	lw	a1,-1992(gp) # 80002918 <Bool_Glob>
8000044e:	80002537          	lui	a0,0x80002
80000452:	2bc50513          	addi	a0,a0,700 # 800022bc <_stack_start+0xffffc9ac>
80000456:	2b31                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 1);
80000458:	4585                	li	a1,1
8000045a:	2a040513          	addi	a0,s0,672
8000045e:	2b11                	jal	80000972 <printf>
  printf ("Ch_1_Glob:           %c\n", Ch_1_Glob);
80000460:	8351c583          	lbu	a1,-1995(gp) # 80002915 <Ch_1_Glob>
80000464:	80002537          	lui	a0,0x80002
80000468:	2d850513          	addi	a0,a0,728 # 800022d8 <_stack_start+0xffffc9c8>
8000046c:	2319                	jal	80000972 <printf>
  printf ("        should be:   %c\n", 'A');
8000046e:	800024b7          	lui	s1,0x80002
80000472:	04100593          	li	a1,65
80000476:	2f448513          	addi	a0,s1,756 # 800022f4 <_stack_start+0xffffc9e4>
8000047a:	29e5                	jal	80000972 <printf>
  printf ("Ch_2_Glob:           %c\n", Ch_2_Glob);
8000047c:	8341c583          	lbu	a1,-1996(gp) # 80002914 <Ch_2_Glob>
80000480:	80002537          	lui	a0,0x80002
80000484:	31050513          	addi	a0,a0,784 # 80002310 <_stack_start+0xffffca00>
80000488:	21ed                	jal	80000972 <printf>
  printf ("        should be:   %c\n", 'B');
8000048a:	04200593          	li	a1,66
8000048e:	2f448513          	addi	a0,s1,756
80000492:	21c5                	jal	80000972 <printf>
  printf ("Arr_1_Glob[8]:       %d\n", Arr_1_Glob[8]);
80000494:	84c18793          	addi	a5,gp,-1972 # 8000292c <Arr_1_Glob>
80000498:	538c                	lw	a1,32(a5)
8000049a:	80002537          	lui	a0,0x80002
8000049e:	32c50513          	addi	a0,a0,812 # 8000232c <_stack_start+0xffffca1c>
800004a2:	29c1                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 7);
800004a4:	459d                	li	a1,7
800004a6:	2a040513          	addi	a0,s0,672
800004aa:	21e1                	jal	80000972 <printf>
  printf ("Arr_2_Glob[8][7]:    %d\n", Arr_2_Glob[8][7]);
800004ac:	800037b7          	lui	a5,0x80003
800004b0:	9f478793          	addi	a5,a5,-1548 # 800029f4 <_stack_start+0xffffd0e4>
800004b4:	65c7a583          	lw	a1,1628(a5)
800004b8:	80002537          	lui	a0,0x80002
800004bc:	34850513          	addi	a0,a0,840 # 80002348 <_stack_start+0xffffca38>
800004c0:	294d                	jal	80000972 <printf>
  printf ("        should be:   Number_Of_Runs + 10\n");
800004c2:	80002537          	lui	a0,0x80002
800004c6:	36450513          	addi	a0,a0,868 # 80002364 <_stack_start+0xffffca54>
800004ca:	54e000ef          	jal	ra,80000a18 <puts>
  printf ("Ptr_Glob->\n");
800004ce:	80002537          	lui	a0,0x80002
800004d2:	39050513          	addi	a0,a0,912 # 80002390 <_stack_start+0xffffca80>
800004d6:	542000ef          	jal	ra,80000a18 <puts>
  printf ("  Ptr_Comp:          %d\n", (int) Ptr_Glob->Ptr_Comp);
800004da:	8441a703          	lw	a4,-1980(gp) # 80002924 <Ptr_Glob>
800004de:	800027b7          	lui	a5,0x80002
800004e2:	39c78513          	addi	a0,a5,924 # 8000239c <_stack_start+0xffffca8c>
800004e6:	430c                	lw	a1,0(a4)
800004e8:	c63e                	sw	a5,12(sp)
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
800004ea:	80002d37          	lui	s10,0x80002
  printf ("  Ptr_Comp:          %d\n", (int) Ptr_Glob->Ptr_Comp);
800004ee:	2151                	jal	80000972 <printf>
  printf ("        should be:   (implementation-dependent)\n");
800004f0:	80002537          	lui	a0,0x80002
800004f4:	3b850513          	addi	a0,a0,952 # 800023b8 <_stack_start+0xffffcaa8>
800004f8:	2305                	jal	80000a18 <puts>
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
800004fa:	8441a703          	lw	a4,-1980(gp) # 80002924 <Ptr_Glob>
800004fe:	3e8d0513          	addi	a0,s10,1000 # 800023e8 <_stack_start+0xffffcad8>
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
80000502:	80002c37          	lui	s8,0x80002
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
80000506:	434c                	lw	a1,4(a4)
  printf ("  Int_Comp:          %d\n", Ptr_Glob->variant.var_1.Int_Comp);
80000508:	80002bb7          	lui	s7,0x80002
  printf ("  Str_Comp:          %s\n", Ptr_Glob->variant.var_1.Str_Comp);
8000050c:	800029b7          	lui	s3,0x80002
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
80000510:	218d                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 0);
80000512:	4581                	li	a1,0
80000514:	2a040513          	addi	a0,s0,672
80000518:	29a9                	jal	80000972 <printf>
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
8000051a:	8441a703          	lw	a4,-1980(gp) # 80002924 <Ptr_Glob>
8000051e:	404c0513          	addi	a0,s8,1028 # 80002404 <_stack_start+0xffffcaf4>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
80000522:	80002937          	lui	s2,0x80002
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
80000526:	470c                	lw	a1,8(a4)
    Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
80000528:	416a0a33          	sub	s4,s4,s6
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
8000052c:	2199                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 2);
8000052e:	4589                	li	a1,2
80000530:	2a040513          	addi	a0,s0,672
80000534:	293d                	jal	80000972 <printf>
  printf ("  Int_Comp:          %d\n", Ptr_Glob->variant.var_1.Int_Comp);
80000536:	8441a703          	lw	a4,-1980(gp) # 80002924 <Ptr_Glob>
8000053a:	420b8513          	addi	a0,s7,1056 # 80002420 <_stack_start+0xffffcb10>
8000053e:	474c                	lw	a1,12(a4)
80000540:	290d                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 17);
80000542:	45c5                	li	a1,17
80000544:	2a040513          	addi	a0,s0,672
80000548:	212d                	jal	80000972 <printf>
  printf ("  Str_Comp:          %s\n", Ptr_Glob->variant.var_1.Str_Comp);
8000054a:	8441a583          	lw	a1,-1980(gp) # 80002924 <Ptr_Glob>
8000054e:	43c98513          	addi	a0,s3,1084 # 8000243c <_stack_start+0xffffcb2c>
80000552:	05c1                	addi	a1,a1,16
80000554:	2939                	jal	80000972 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
80000556:	45890513          	addi	a0,s2,1112 # 80002458 <_stack_start+0xffffcb48>
8000055a:	297d                	jal	80000a18 <puts>
  printf ("Next_Ptr_Glob->\n");
8000055c:	80002537          	lui	a0,0x80002
80000560:	48c50513          	addi	a0,a0,1164 # 8000248c <_stack_start+0xffffcb7c>
80000564:	2955                	jal	80000a18 <puts>
  printf ("  Ptr_Comp:          %d\n", (int) Next_Ptr_Glob->Ptr_Comp);
80000566:	8401a703          	lw	a4,-1984(gp) # 80002920 <Next_Ptr_Glob>
8000056a:	47b2                	lw	a5,12(sp)
8000056c:	430c                	lw	a1,0(a4)
8000056e:	39c78513          	addi	a0,a5,924
80000572:	2101                	jal	80000972 <printf>
  printf ("        should be:   (implementation-dependent), same as above\n");
80000574:	80002537          	lui	a0,0x80002
80000578:	49c50513          	addi	a0,a0,1180 # 8000249c <_stack_start+0xffffcb8c>
8000057c:	2971                	jal	80000a18 <puts>
  printf ("  Discr:             %d\n", Next_Ptr_Glob->Discr);
8000057e:	8401a783          	lw	a5,-1984(gp) # 80002920 <Next_Ptr_Glob>
80000582:	3e8d0513          	addi	a0,s10,1000
80000586:	43cc                	lw	a1,4(a5)
80000588:	26ed                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 0);
8000058a:	4581                	li	a1,0
8000058c:	2a040513          	addi	a0,s0,672
80000590:	26cd                	jal	80000972 <printf>
  printf ("  Enum_Comp:         %d\n", Next_Ptr_Glob->variant.var_1.Enum_Comp);
80000592:	8401a783          	lw	a5,-1984(gp) # 80002920 <Next_Ptr_Glob>
80000596:	404c0513          	addi	a0,s8,1028
8000059a:	478c                	lw	a1,8(a5)
8000059c:	2ed9                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 1);
8000059e:	4585                	li	a1,1
800005a0:	2a040513          	addi	a0,s0,672
800005a4:	26f9                	jal	80000972 <printf>
  printf ("  Int_Comp:          %d\n", Next_Ptr_Glob->variant.var_1.Int_Comp);
800005a6:	8401a783          	lw	a5,-1984(gp) # 80002920 <Next_Ptr_Glob>
800005aa:	420b8513          	addi	a0,s7,1056
800005ae:	47cc                	lw	a1,12(a5)
800005b0:	26c9                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 18);
800005b2:	45c9                	li	a1,18
800005b4:	2a040513          	addi	a0,s0,672
800005b8:	2e6d                	jal	80000972 <printf>
  printf ("  Str_Comp:          %s\n",
800005ba:	8401a583          	lw	a1,-1984(gp) # 80002920 <Next_Ptr_Glob>
800005be:	43c98513          	addi	a0,s3,1084
800005c2:	05c1                	addi	a1,a1,16
800005c4:	267d                	jal	80000972 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
800005c6:	45890513          	addi	a0,s2,1112
800005ca:	21b9                	jal	80000a18 <puts>
  printf ("Int_1_Loc:           %d\n", Int_1_Loc);
800005cc:	45d2                	lw	a1,20(sp)
800005ce:	80002537          	lui	a0,0x80002
800005d2:	4dc50513          	addi	a0,a0,1244 # 800024dc <_stack_start+0xffffcbcc>
800005d6:	2e71                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 5);
800005d8:	4595                	li	a1,5
800005da:	2a040513          	addi	a0,s0,672
800005de:	2e51                	jal	80000972 <printf>
    Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
800005e0:	003a1793          	slli	a5,s4,0x3
800005e4:	41478a33          	sub	s4,a5,s4
  printf ("Int_2_Loc:           %d\n", Int_2_Loc);
800005e8:	80002537          	lui	a0,0x80002
800005ec:	415a05b3          	sub	a1,s4,s5
800005f0:	4f850513          	addi	a0,a0,1272 # 800024f8 <_stack_start+0xffffcbe8>
800005f4:	2ebd                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 13);
800005f6:	45b5                	li	a1,13
800005f8:	2a040513          	addi	a0,s0,672
800005fc:	2e9d                	jal	80000972 <printf>
  printf ("Int_3_Loc:           %d\n", Int_3_Loc);
800005fe:	45e2                	lw	a1,24(sp)
80000600:	80002537          	lui	a0,0x80002
80000604:	51450513          	addi	a0,a0,1300 # 80002514 <_stack_start+0xffffcc04>
80000608:	26ad                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 7);
8000060a:	459d                	li	a1,7
8000060c:	2a040513          	addi	a0,s0,672
80000610:	268d                	jal	80000972 <printf>
  printf ("Enum_Loc:            %d\n", Enum_Loc);
80000612:	45f2                	lw	a1,28(sp)
80000614:	80002537          	lui	a0,0x80002
80000618:	53050513          	addi	a0,a0,1328 # 80002530 <_stack_start+0xffffcc20>
8000061c:	2e99                	jal	80000972 <printf>
  printf ("        should be:   %d\n", 1);
8000061e:	4585                	li	a1,1
80000620:	2a040513          	addi	a0,s0,672
80000624:	26b9                	jal	80000972 <printf>
  printf ("Str_1_Loc:           %s\n", Str_1_Loc);
80000626:	80002537          	lui	a0,0x80002
8000062a:	100c                	addi	a1,sp,32
8000062c:	54c50513          	addi	a0,a0,1356 # 8000254c <_stack_start+0xffffcc3c>
80000630:	2689                	jal	80000972 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, 1'ST STRING\n");
80000632:	80002537          	lui	a0,0x80002
80000636:	56850513          	addi	a0,a0,1384 # 80002568 <_stack_start+0xffffcc58>
8000063a:	2ef9                	jal	80000a18 <puts>
  printf ("Str_2_Loc:           %s\n", Str_2_Loc);
8000063c:	80002537          	lui	a0,0x80002
80000640:	008c                	addi	a1,sp,64
80000642:	59c50513          	addi	a0,a0,1436 # 8000259c <_stack_start+0xffffcc8c>
80000646:	2635                	jal	80000972 <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, 2'ND STRING\n");
80000648:	80002537          	lui	a0,0x80002
8000064c:	5b850513          	addi	a0,a0,1464 # 800025b8 <_stack_start+0xffffcca8>
80000650:	26e1                	jal	80000a18 <puts>
  printf ("\n");
80000652:	4529                	li	a0,10
80000654:	26ed                	jal	80000a3e <putchar>
  User_Time = End_Time - Begin_Time;
80000656:	82c1a703          	lw	a4,-2004(gp) # 8000290c <Begin_Time>
8000065a:	8281a583          	lw	a1,-2008(gp) # 80002908 <End_Time>
  if (User_Time < Too_Small_Time)
8000065e:	1f300793          	li	a5,499
  User_Time = End_Time - Begin_Time;
80000662:	8d99                	sub	a1,a1,a4
80000664:	82b1a223          	sw	a1,-2012(gp) # 80002904 <User_Time>
  if (User_Time < Too_Small_Time)
80000668:	12b7df63          	ble	a1,a5,800007a6 <main2+0x58a>
    printf ("Clock cycles=%d \n", User_Time);
8000066c:	80002537          	lui	a0,0x80002
80000670:	64450513          	addi	a0,a0,1604 # 80002644 <_stack_start+0xffffcd34>
80000674:	2cfd                	jal	80000972 <printf>
    Microseconds = (float) User_Time * Mic_secs_Per_Second 
80000676:	8241a503          	lw	a0,-2012(gp) # 80002904 <User_Time>
8000067a:	798010ef          	jal	ra,80001e12 <__floatsisf>
8000067e:	842a                	mv	s0,a0
80000680:	065010ef          	jal	ra,80001ee4 <__extendsfdf2>
80000684:	800037b7          	lui	a5,0x80003
80000688:	8e07a603          	lw	a2,-1824(a5) # 800028e0 <_stack_start+0xffffcfd0>
8000068c:	8e47a683          	lw	a3,-1820(a5)
80000690:	2cf000ef          	jal	ra,8000115e <__muldf3>
                        / ((float) CORE_HZ * ((float) Number_Of_Runs));
80000694:	800037b7          	lui	a5,0x80003
80000698:	8e87a603          	lw	a2,-1816(a5) # 800028e8 <_stack_start+0xffffcfd8>
8000069c:	8ec7a683          	lw	a3,-1812(a5)
800006a0:	58e000ef          	jal	ra,80000c2e <__divdf3>
800006a4:	0fd010ef          	jal	ra,80001fa0 <__truncdfsf2>
800006a8:	82a1a023          	sw	a0,-2016(gp) # 80002900 <Microseconds>
                        / (float) User_Time;
800006ac:	800037b7          	lui	a5,0x80003
800006b0:	8f07a503          	lw	a0,-1808(a5) # 800028f0 <_stack_start+0xffffcfe0>
800006b4:	85a2                	mv	a1,s0
800006b6:	709000ef          	jal	ra,800015be <__divsf3>
    Dhrystones_Per_Second = ((float) CORE_HZ * (float) Number_Of_Runs)
800006ba:	80a1ae23          	sw	a0,-2020(gp) # 800028fc <Dhrystones_Per_Second>
    printf ("DMIPS per Mhz:                              ");
800006be:	80002537          	lui	a0,0x80002
800006c2:	65850513          	addi	a0,a0,1624 # 80002658 <_stack_start+0xffffcd48>
800006c6:	2475                	jal	80000972 <printf>
    float dmips = (1e6f/1757.0f) * Number_Of_Runs / User_Time;
800006c8:	8241a503          	lw	a0,-2012(gp) # 80002904 <User_Time>
800006cc:	746010ef          	jal	ra,80001e12 <__floatsisf>
800006d0:	800037b7          	lui	a5,0x80003
800006d4:	85aa                	mv	a1,a0
800006d6:	8f47a503          	lw	a0,-1804(a5) # 800028f4 <_stack_start+0xffffcfe4>
800006da:	6e5000ef          	jal	ra,800015be <__divsf3>
800006de:	842a                	mv	s0,a0
    int dmipsNatural = dmips;
800006e0:	6d2010ef          	jal	ra,80001db2 <__fixsfsi>
800006e4:	84aa                	mv	s1,a0
    int dmipsReal = (dmips - dmipsNatural)*100.0f;
800006e6:	72c010ef          	jal	ra,80001e12 <__floatsisf>
800006ea:	85aa                	mv	a1,a0
800006ec:	8522                	mv	a0,s0
800006ee:	370010ef          	jal	ra,80001a5e <__subsf3>
800006f2:	800037b7          	lui	a5,0x80003
800006f6:	8f87a583          	lw	a1,-1800(a5) # 800028f8 <_stack_start+0xffffcfe8>
800006fa:	124010ef          	jal	ra,8000181e <__mulsf3>
800006fe:	6b4010ef          	jal	ra,80001db2 <__fixsfsi>
80000702:	842a                	mv	s0,a0
    printf ("%d.", dmipsNatural);
80000704:	80002537          	lui	a0,0x80002
80000708:	85a6                	mv	a1,s1
8000070a:	68850513          	addi	a0,a0,1672 # 80002688 <_stack_start+0xffffcd78>
8000070e:	2495                	jal	80000972 <printf>
    if(dmipsReal < 10) printf("0");
80000710:	47a5                	li	a5,9
80000712:	0a87d763          	ble	s0,a5,800007c0 <main2+0x5a4>
    printf ("%d", dmipsReal);
80000716:	80002537          	lui	a0,0x80002
8000071a:	85a2                	mv	a1,s0
8000071c:	68c50513          	addi	a0,a0,1676 # 8000268c <_stack_start+0xffffcd7c>
80000720:	2c89                	jal	80000972 <printf>
    printf ("\n");
80000722:	4529                	li	a0,10
80000724:	2e29                	jal	80000a3e <putchar>
}
80000726:	40fa                	lw	ra,156(sp)
80000728:	446a                	lw	s0,152(sp)
8000072a:	44da                	lw	s1,148(sp)
8000072c:	494a                	lw	s2,144(sp)
8000072e:	49ba                	lw	s3,140(sp)
80000730:	4a2a                	lw	s4,136(sp)
80000732:	4a9a                	lw	s5,132(sp)
80000734:	4b0a                	lw	s6,128(sp)
80000736:	5bf6                	lw	s7,124(sp)
80000738:	5c66                	lw	s8,120(sp)
8000073a:	5cd6                	lw	s9,116(sp)
8000073c:	5d46                	lw	s10,112(sp)
8000073e:	5db6                	lw	s11,108(sp)
80000740:	610d                	addi	sp,sp,160
80000742:	8082                	ret
        Proc_6 (Ident_1, &Enum_Loc);
80000744:	086c                	addi	a1,sp,28
80000746:	4501                	li	a0,0
80000748:	220d                	jal	8000086a <Proc_6>
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
8000074a:	004b2303          	lw	t1,4(s6)
8000074e:	008b2883          	lw	a7,8(s6)
80000752:	00cb2803          	lw	a6,12(s6)
80000756:	010b2503          	lw	a0,16(s6)
8000075a:	014b2583          	lw	a1,20(s6)
8000075e:	018b2603          	lw	a2,24(s6)
80000762:	01cb5683          	lhu	a3,28(s6)
80000766:	01eb4703          	lbu	a4,30(s6)
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
8000076a:	8341c783          	lbu	a5,-1996(gp) # 80002914 <Ch_2_Glob>
8000076e:	0a85                	addi	s5,s5,1
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
80000770:	c0e2                	sw	s8,64(sp)
80000772:	c29a                	sw	t1,68(sp)
80000774:	c4c6                	sw	a7,72(sp)
80000776:	c6c2                	sw	a6,76(sp)
80000778:	c8aa                	sw	a0,80(sp)
8000077a:	caae                	sw	a1,84(sp)
8000077c:	ccb2                	sw	a2,88(sp)
8000077e:	04d11e23          	sh	a3,92(sp)
80000782:	04e10f23          	sb	a4,94(sp)
        Int_Glob = Run_Index;
80000786:	8331ae23          	sw	s3,-1988(gp) # 8000291c <Int_Glob>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
8000078a:	0ffafa93          	andi	s5,s5,255
8000078e:	8a4e                	mv	s4,s3
80000790:	c357fde3          	bleu	s5,a5,800003ca <main2+0x1ae>
80000794:	b991                	j	800003e8 <main2+0x1cc>
    printf ("Program compiled without 'register' attribute\n");
80000796:	80002537          	lui	a0,0x80002
8000079a:	1a450513          	addi	a0,a0,420 # 800021a4 <_stack_start+0xffffc894>
8000079e:	2cad                	jal	80000a18 <puts>
    printf ("\n");
800007a0:	4529                	li	a0,10
800007a2:	2c71                	jal	80000a3e <putchar>
800007a4:	b6b1                	j	800002f0 <main2+0xd4>
    printf ("Measured time too small to obtain meaningful results\n");
800007a6:	80002537          	lui	a0,0x80002
800007aa:	5ec50513          	addi	a0,a0,1516 # 800025ec <_stack_start+0xffffccdc>
800007ae:	24ad                	jal	80000a18 <puts>
    printf ("Please increase number of runs\n");
800007b0:	80002537          	lui	a0,0x80002
800007b4:	62450513          	addi	a0,a0,1572 # 80002624 <_stack_start+0xffffcd14>
800007b8:	2485                	jal	80000a18 <puts>
    printf ("\n");
800007ba:	4529                	li	a0,10
800007bc:	2449                	jal	80000a3e <putchar>
800007be:	b7a5                	j	80000726 <main2+0x50a>
    if(dmipsReal < 10) printf("0");
800007c0:	03000513          	li	a0,48
800007c4:	2cad                	jal	80000a3e <putchar>
800007c6:	bf81                	j	80000716 <main2+0x4fa>

800007c8 <Proc_7>:
One_Fifty       Int_2_Par_Val;
One_Fifty      *Int_Par_Ref;
{
  One_Fifty Int_Loc;

  Int_Loc = Int_1_Par_Val + 2;
800007c8:	0509                	addi	a0,a0,2
  *Int_Par_Ref = Int_2_Par_Val + Int_Loc;
800007ca:	95aa                	add	a1,a1,a0
800007cc:	c20c                	sw	a1,0(a2)
} /* Proc_7 */
800007ce:	8082                	ret

800007d0 <Proc_8>:
int             Int_2_Par_Val;
{
  REG One_Fifty Int_Index;
  REG One_Fifty Int_Loc;

  Int_Loc = Int_1_Par_Val + 5;
800007d0:	00560713          	addi	a4,a2,5
  Arr_1_Par_Ref [Int_Loc] = Int_2_Par_Val;
  Arr_1_Par_Ref [Int_Loc+1] = Arr_1_Par_Ref [Int_Loc];
  Arr_1_Par_Ref [Int_Loc+30] = Int_Loc;
  for (Int_Index = Int_Loc; Int_Index <= Int_Loc+1; ++Int_Index)
    Arr_2_Par_Ref [Int_Loc] [Int_Index] = Int_Loc;
800007d4:	0c800813          	li	a6,200
800007d8:	03070833          	mul	a6,a4,a6
800007dc:	060a                	slli	a2,a2,0x2
  Arr_1_Par_Ref [Int_Loc] = Int_2_Par_Val;
800007de:	00271793          	slli	a5,a4,0x2
800007e2:	953e                	add	a0,a0,a5
800007e4:	c114                	sw	a3,0(a0)
  Arr_1_Par_Ref [Int_Loc+30] = Int_Loc;
800007e6:	dd38                	sw	a4,120(a0)
  Arr_1_Par_Ref [Int_Loc+1] = Arr_1_Par_Ref [Int_Loc];
800007e8:	c154                	sw	a3,4(a0)
800007ea:	00c807b3          	add	a5,a6,a2
800007ee:	97ae                	add	a5,a5,a1
  Arr_2_Par_Ref [Int_Loc] [Int_Loc-1] += 1;
800007f0:	4b94                	lw	a3,16(a5)
    Arr_2_Par_Ref [Int_Loc] [Int_Index] = Int_Loc;
800007f2:	cbd8                	sw	a4,20(a5)
800007f4:	cf98                	sw	a4,24(a5)
  Arr_2_Par_Ref [Int_Loc] [Int_Loc-1] += 1;
800007f6:	00168713          	addi	a4,a3,1
800007fa:	cb98                	sw	a4,16(a5)
  Arr_2_Par_Ref [Int_Loc+20] [Int_Loc] = Arr_1_Par_Ref [Int_Loc];
800007fc:	411c                	lw	a5,0(a0)
800007fe:	95c2                	add	a1,a1,a6
80000800:	95b2                	add	a1,a1,a2
80000802:	6605                	lui	a2,0x1
80000804:	95b2                	add	a1,a1,a2
80000806:	faf5aa23          	sw	a5,-76(a1)
  Int_Glob = 5;
8000080a:	4715                	li	a4,5
8000080c:	82e1ae23          	sw	a4,-1988(gp) # 8000291c <Int_Glob>
} /* Proc_8 */
80000810:	8082                	ret

80000812 <Func_1>:
    /* second call:     Ch_1_Par_Val == 'A', Ch_2_Par_Val == 'C'    */
    /* third call:      Ch_1_Par_Val == 'B', Ch_2_Par_Val == 'C'    */

Capital_Letter   Ch_1_Par_Val;
Capital_Letter   Ch_2_Par_Val;
{
80000812:	0ff57513          	andi	a0,a0,255
80000816:	0ff5f593          	andi	a1,a1,255
  Capital_Letter        Ch_1_Loc;
  Capital_Letter        Ch_2_Loc;

  Ch_1_Loc = Ch_1_Par_Val;
  Ch_2_Loc = Ch_1_Loc;
  if (Ch_2_Loc != Ch_2_Par_Val)
8000081a:	00b50463          	beq	a0,a1,80000822 <Func_1+0x10>
    /* then, executed */
    return (Ident_1);
8000081e:	4501                	li	a0,0
  else  /* not executed */
  {
    Ch_1_Glob = Ch_1_Loc;
    return (Ident_2);
   }
} /* Func_1 */
80000820:	8082                	ret
    Ch_1_Glob = Ch_1_Loc;
80000822:	82a18aa3          	sb	a0,-1995(gp) # 80002915 <Ch_1_Glob>
    return (Ident_2);
80000826:	4505                	li	a0,1
80000828:	8082                	ret

8000082a <Func_2>:
    /* Str_1_Par_Ref == "DHRYSTONE PROGRAM, 1'ST STRING" */
    /* Str_2_Par_Ref == "DHRYSTONE PROGRAM, 2'ND STRING" */

Str_30  Str_1_Par_Ref;
Str_30  Str_2_Par_Ref;
{
8000082a:	1141                	addi	sp,sp,-16
8000082c:	c422                	sw	s0,8(sp)
8000082e:	c226                	sw	s1,4(sp)
80000830:	c606                	sw	ra,12(sp)
80000832:	842a                	mv	s0,a0
80000834:	84ae                	mv	s1,a1
  REG One_Thirty        Int_Loc;
      Capital_Letter    Ch_Loc;

  Int_Loc = 2;
  while (Int_Loc <= 2) /* loop body executed once */
    if (Func_1 (Str_1_Par_Ref[Int_Loc],
80000836:	0034c583          	lbu	a1,3(s1)
8000083a:	00244503          	lbu	a0,2(s0)
8000083e:	3fd1                	jal	80000812 <Func_1>
80000840:	f97d                	bnez	a0,80000836 <Func_2+0xc>
  if (Ch_Loc == 'R')
    /* then, not executed */
    return (true);
  else /* executed */
  {
    if (strcmp (Str_1_Par_Ref, Str_2_Par_Ref) > 0)
80000842:	85a6                	mv	a1,s1
80000844:	8522                	mv	a0,s0
80000846:	24e9                	jal	80000b10 <strcmp>
      Int_Loc += 7;
      Int_Glob = Int_Loc;
      return (true);
    }
    else /* executed */
      return (false);
80000848:	4781                	li	a5,0
    if (strcmp (Str_1_Par_Ref, Str_2_Par_Ref) > 0)
8000084a:	00a05663          	blez	a0,80000856 <Func_2+0x2c>
      Int_Glob = Int_Loc;
8000084e:	4729                	li	a4,10
80000850:	82e1ae23          	sw	a4,-1988(gp) # 8000291c <Int_Glob>
      return (true);
80000854:	4785                	li	a5,1
  } /* if Ch_Loc */
} /* Func_2 */
80000856:	40b2                	lw	ra,12(sp)
80000858:	4422                	lw	s0,8(sp)
8000085a:	4492                	lw	s1,4(sp)
8000085c:	853e                	mv	a0,a5
8000085e:	0141                	addi	sp,sp,16
80000860:	8082                	ret

80000862 <Func_3>:
Enumeration Enum_Par_Val;
{
  Enumeration Enum_Loc;

  Enum_Loc = Enum_Par_Val;
  if (Enum_Loc == Ident_3)
80000862:	1579                	addi	a0,a0,-2
    /* then, executed */
    return (true);
  else /* not executed */
    return (false);
} /* Func_3 */
80000864:	00153513          	seqz	a0,a0
80000868:	8082                	ret

8000086a <Proc_6>:
{
8000086a:	1141                	addi	sp,sp,-16
8000086c:	c422                	sw	s0,8(sp)
8000086e:	c226                	sw	s1,4(sp)
80000870:	c606                	sw	ra,12(sp)
80000872:	842a                	mv	s0,a0
80000874:	84ae                	mv	s1,a1
  if (! Func_3 (Enum_Val_Par))
80000876:	37f5                	jal	80000862 <Func_3>
80000878:	c115                	beqz	a0,8000089c <Proc_6+0x32>
  *Enum_Ref_Par = Enum_Val_Par;
8000087a:	c080                	sw	s0,0(s1)
  switch (Enum_Val_Par)
8000087c:	4785                	li	a5,1
8000087e:	02f40463          	beq	s0,a5,800008a6 <Proc_6+0x3c>
80000882:	c805                	beqz	s0,800008b2 <Proc_6+0x48>
80000884:	4709                	li	a4,2
80000886:	02e40d63          	beq	s0,a4,800008c0 <Proc_6+0x56>
8000088a:	4791                	li	a5,4
8000088c:	00f41363          	bne	s0,a5,80000892 <Proc_6+0x28>
      *Enum_Ref_Par = Ident_3;
80000890:	c098                	sw	a4,0(s1)
} /* Proc_6 */
80000892:	40b2                	lw	ra,12(sp)
80000894:	4422                	lw	s0,8(sp)
80000896:	4492                	lw	s1,4(sp)
80000898:	0141                	addi	sp,sp,16
8000089a:	8082                	ret
    *Enum_Ref_Par = Ident_4;
8000089c:	478d                	li	a5,3
8000089e:	c09c                	sw	a5,0(s1)
  switch (Enum_Val_Par)
800008a0:	4785                	li	a5,1
800008a2:	fef410e3          	bne	s0,a5,80000882 <Proc_6+0x18>
      if (Int_Glob > 100)
800008a6:	83c1a703          	lw	a4,-1988(gp) # 8000291c <Int_Glob>
800008aa:	06400793          	li	a5,100
800008ae:	00e7df63          	ble	a4,a5,800008cc <Proc_6+0x62>
} /* Proc_6 */
800008b2:	40b2                	lw	ra,12(sp)
800008b4:	4422                	lw	s0,8(sp)
      *Enum_Ref_Par = Ident_1;
800008b6:	0004a023          	sw	zero,0(s1)
} /* Proc_6 */
800008ba:	4492                	lw	s1,4(sp)
800008bc:	0141                	addi	sp,sp,16
800008be:	8082                	ret
800008c0:	40b2                	lw	ra,12(sp)
800008c2:	4422                	lw	s0,8(sp)
      *Enum_Ref_Par = Ident_2;
800008c4:	c09c                	sw	a5,0(s1)
} /* Proc_6 */
800008c6:	4492                	lw	s1,4(sp)
800008c8:	0141                	addi	sp,sp,16
800008ca:	8082                	ret
800008cc:	40b2                	lw	ra,12(sp)
800008ce:	4422                	lw	s0,8(sp)
      else *Enum_Ref_Par = Ident_4;
800008d0:	478d                	li	a5,3
800008d2:	c09c                	sw	a5,0(s1)
} /* Proc_6 */
800008d4:	4492                	lw	s1,4(sp)
800008d6:	0141                	addi	sp,sp,16
800008d8:	8082                	ret

800008da <printf_s>:
{
	putchar(c);
}

static void printf_s(char *p)
{
800008da:	1141                	addi	sp,sp,-16
800008dc:	c422                	sw	s0,8(sp)
800008de:	c606                	sw	ra,12(sp)
800008e0:	842a                	mv	s0,a0
	while (*p)
800008e2:	00054503          	lbu	a0,0(a0)
800008e6:	c511                	beqz	a0,800008f2 <printf_s+0x18>
		putchar(*(p++));
800008e8:	0405                	addi	s0,s0,1
800008ea:	2a91                	jal	80000a3e <putchar>
	while (*p)
800008ec:	00044503          	lbu	a0,0(s0)
800008f0:	fd65                	bnez	a0,800008e8 <printf_s+0xe>
}
800008f2:	40b2                	lw	ra,12(sp)
800008f4:	4422                	lw	s0,8(sp)
800008f6:	0141                	addi	sp,sp,16
800008f8:	8082                	ret

800008fa <printf_c>:
	putchar(c);
800008fa:	a291                	j	80000a3e <putchar>

800008fc <printf_d>:

static void printf_d(int val)
{
800008fc:	7179                	addi	sp,sp,-48
800008fe:	d226                	sw	s1,36(sp)
80000900:	d606                	sw	ra,44(sp)
80000902:	d422                	sw	s0,40(sp)
80000904:	d04a                	sw	s2,32(sp)
80000906:	84aa                	mv	s1,a0
	char buffer[32];
	char *p = buffer;
	if (val < 0) {
80000908:	02054e63          	bltz	a0,80000944 <printf_d+0x48>
{
8000090c:	890a                	mv	s2,sp
8000090e:	844a                	mv	s0,s2
		printf_c('-');
		val = -val;
	}
	while (val || p == buffer) {
		*(p++) = '0' + val % 10;
80000910:	4729                	li	a4,10
	while (val || p == buffer) {
80000912:	e099                	bnez	s1,80000918 <printf_d+0x1c>
80000914:	01241c63          	bne	s0,s2,8000092c <printf_d+0x30>
		*(p++) = '0' + val % 10;
80000918:	02e4e7b3          	rem	a5,s1,a4
8000091c:	0405                	addi	s0,s0,1
8000091e:	03078793          	addi	a5,a5,48
		val = val / 10;
80000922:	02e4c4b3          	div	s1,s1,a4
		*(p++) = '0' + val % 10;
80000926:	fef40fa3          	sb	a5,-1(s0)
8000092a:	b7e5                	j	80000912 <printf_d+0x16>
	}
	while (p != buffer)
		printf_c(*(--p));
8000092c:	147d                	addi	s0,s0,-1
8000092e:	00044503          	lbu	a0,0(s0)
80000932:	37e1                	jal	800008fa <printf_c>
	while (p != buffer)
80000934:	ff241ce3          	bne	s0,s2,8000092c <printf_d+0x30>
}
80000938:	50b2                	lw	ra,44(sp)
8000093a:	5422                	lw	s0,40(sp)
8000093c:	5492                	lw	s1,36(sp)
8000093e:	5902                	lw	s2,32(sp)
80000940:	6145                	addi	sp,sp,48
80000942:	8082                	ret
		printf_c('-');
80000944:	02d00513          	li	a0,45
80000948:	3f4d                	jal	800008fa <printf_c>
		val = -val;
8000094a:	409004b3          	neg	s1,s1
8000094e:	bf7d                	j	8000090c <printf_d+0x10>

80000950 <malloc>:
	char *p = heap_memory + heap_memory_used;
80000950:	8481a703          	lw	a4,-1976(gp) # 80002928 <heap_memory_used>
	heap_memory_used += size;
80000954:	00a707b3          	add	a5,a4,a0
	char *p = heap_memory + heap_memory_used;
80000958:	80005537          	lui	a0,0x80005
	heap_memory_used += size;
8000095c:	84f1a423          	sw	a5,-1976(gp) # 80002928 <heap_memory_used>
	char *p = heap_memory + heap_memory_used;
80000960:	10450513          	addi	a0,a0,260 # 80005104 <_stack_start+0xfffff7f4>
	if (heap_memory_used > 1024)
80000964:	40000693          	li	a3,1024
	char *p = heap_memory + heap_memory_used;
80000968:	953a                	add	a0,a0,a4
	if (heap_memory_used > 1024)
8000096a:	00f6d363          	ble	a5,a3,80000970 <malloc+0x20>
		asm volatile ("ebreak");
8000096e:	9002                	ebreak
}
80000970:	8082                	ret

80000972 <printf>:

int printf(const char *format, ...)
{
80000972:	715d                	addi	sp,sp,-80
80000974:	cc52                	sw	s4,24(sp)
80000976:	d606                	sw	ra,44(sp)
80000978:	d422                	sw	s0,40(sp)
8000097a:	d226                	sw	s1,36(sp)
8000097c:	d04a                	sw	s2,32(sp)
8000097e:	ce4e                	sw	s3,28(sp)
80000980:	ca56                	sw	s5,20(sp)
80000982:	8a2a                	mv	s4,a0
	int i;
	va_list ap;

	va_start(ap, format);

	for (i = 0; format[i]; i++)
80000984:	00054503          	lbu	a0,0(a0)
{
80000988:	c2be                	sw	a5,68(sp)
	va_start(ap, format);
8000098a:	185c                	addi	a5,sp,52
{
8000098c:	da2e                	sw	a1,52(sp)
8000098e:	dc32                	sw	a2,56(sp)
80000990:	de36                	sw	a3,60(sp)
80000992:	c0ba                	sw	a4,64(sp)
80000994:	c4c2                	sw	a6,72(sp)
80000996:	c6c6                	sw	a7,76(sp)
	va_start(ap, format);
80000998:	c63e                	sw	a5,12(sp)
	for (i = 0; format[i]; i++)
8000099a:	c11d                	beqz	a0,800009c0 <printf+0x4e>
8000099c:	4401                	li	s0,0
		if (format[i] == '%') {
8000099e:	02500a93          	li	s5,37
			while (format[++i]) {
				if (format[i] == 'c') {
800009a2:	06300493          	li	s1,99
					printf_c(va_arg(ap,int));
					break;
				}
				if (format[i] == 's') {
800009a6:	07300913          	li	s2,115
					printf_s(va_arg(ap,char*));
					break;
				}
				if (format[i] == 'd') {
800009aa:	06400993          	li	s3,100
		if (format[i] == '%') {
800009ae:	03550263          	beq	a0,s5,800009d2 <printf+0x60>
					printf_d(va_arg(ap,int));
					break;
				}
			}
		} else
			printf_c(format[i]);
800009b2:	37a1                	jal	800008fa <printf_c>
	for (i = 0; format[i]; i++)
800009b4:	0405                	addi	s0,s0,1
800009b6:	008a07b3          	add	a5,s4,s0
800009ba:	0007c503          	lbu	a0,0(a5)
800009be:	f965                	bnez	a0,800009ae <printf+0x3c>

	va_end(ap);
}
800009c0:	50b2                	lw	ra,44(sp)
800009c2:	5422                	lw	s0,40(sp)
800009c4:	5492                	lw	s1,36(sp)
800009c6:	5902                	lw	s2,32(sp)
800009c8:	49f2                	lw	s3,28(sp)
800009ca:	4a62                	lw	s4,24(sp)
800009cc:	4ad2                	lw	s5,20(sp)
800009ce:	6161                	addi	sp,sp,80
800009d0:	8082                	ret
800009d2:	00140693          	addi	a3,s0,1
800009d6:	00da0733          	add	a4,s4,a3
800009da:	a031                	j	800009e6 <printf+0x74>
				if (format[i] == 's') {
800009dc:	03278263          	beq	a5,s2,80000a00 <printf+0x8e>
				if (format[i] == 'd') {
800009e0:	03378663          	beq	a5,s3,80000a0c <printf+0x9a>
800009e4:	0685                	addi	a3,a3,1
			while (format[++i]) {
800009e6:	00074783          	lbu	a5,0(a4)
800009ea:	8436                	mv	s0,a3
800009ec:	0705                	addi	a4,a4,1
800009ee:	d3f9                	beqz	a5,800009b4 <printf+0x42>
				if (format[i] == 'c') {
800009f0:	fe9796e3          	bne	a5,s1,800009dc <printf+0x6a>
					printf_c(va_arg(ap,int));
800009f4:	47b2                	lw	a5,12(sp)
800009f6:	4388                	lw	a0,0(a5)
800009f8:	0791                	addi	a5,a5,4
800009fa:	c63e                	sw	a5,12(sp)
800009fc:	3dfd                	jal	800008fa <printf_c>
					break;
800009fe:	bf5d                	j	800009b4 <printf+0x42>
					printf_s(va_arg(ap,char*));
80000a00:	47b2                	lw	a5,12(sp)
80000a02:	4388                	lw	a0,0(a5)
80000a04:	0791                	addi	a5,a5,4
80000a06:	c63e                	sw	a5,12(sp)
80000a08:	3dc9                	jal	800008da <printf_s>
					break;
80000a0a:	b76d                	j	800009b4 <printf+0x42>
					printf_d(va_arg(ap,int));
80000a0c:	47b2                	lw	a5,12(sp)
80000a0e:	4388                	lw	a0,0(a5)
80000a10:	0791                	addi	a5,a5,4
80000a12:	c63e                	sw	a5,12(sp)
80000a14:	35e5                	jal	800008fc <printf_d>
					break;
80000a16:	bf79                	j	800009b4 <printf+0x42>

80000a18 <puts>:


int puts(char *s){
80000a18:	1141                	addi	sp,sp,-16
80000a1a:	c422                	sw	s0,8(sp)
80000a1c:	c606                	sw	ra,12(sp)
80000a1e:	842a                	mv	s0,a0
  while (*s) {
80000a20:	00054503          	lbu	a0,0(a0)
80000a24:	c511                	beqz	a0,80000a30 <puts+0x18>
    putchar(*s);
    s++;
80000a26:	0405                	addi	s0,s0,1
    putchar(*s);
80000a28:	2819                	jal	80000a3e <putchar>
  while (*s) {
80000a2a:	00044503          	lbu	a0,0(s0)
80000a2e:	fd65                	bnez	a0,80000a26 <puts+0xe>
  }
  putchar('\n');
80000a30:	4529                	li	a0,10
80000a32:	2031                	jal	80000a3e <putchar>
  return 0;
}
80000a34:	40b2                	lw	ra,12(sp)
80000a36:	4422                	lw	s0,8(sp)
80000a38:	4501                	li	a0,0
80000a3a:	0141                	addi	sp,sp,16
80000a3c:	8082                	ret

80000a3e <putchar>:

void putchar(char c){
	TEST_COM_BASE[0] = c;
80000a3e:	f01007b7          	lui	a5,0xf0100
80000a42:	f0a7a023          	sw	a0,-256(a5) # f00fff00 <_stack_start+0x700fa5f0>
}
80000a46:	8082                	ret

80000a48 <clock>:

#include <time.h>
clock_t	clock(){
  return TEST_COM_BASE[4];
80000a48:	f01007b7          	lui	a5,0xf0100
80000a4c:	f107a503          	lw	a0,-240(a5) # f00fff10 <_stack_start+0x700fa600>
}
80000a50:	8082                	ret

80000a52 <memcpy>:
80000a52:	00a5c7b3          	xor	a5,a1,a0
80000a56:	8b8d                	andi	a5,a5,3
80000a58:	00c50733          	add	a4,a0,a2
80000a5c:	e781                	bnez	a5,80000a64 <memcpy+0x12>
80000a5e:	478d                	li	a5,3
80000a60:	00c7ef63          	bltu	a5,a2,80000a7e <memcpy+0x2c>
80000a64:	87aa                	mv	a5,a0
80000a66:	00e56963          	bltu	a0,a4,80000a78 <memcpy+0x26>
80000a6a:	8082                	ret
80000a6c:	0005c683          	lbu	a3,0(a1)
80000a70:	0785                	addi	a5,a5,1
80000a72:	0585                	addi	a1,a1,1
80000a74:	fed78fa3          	sb	a3,-1(a5)
80000a78:	fee7eae3          	bltu	a5,a4,80000a6c <memcpy+0x1a>
80000a7c:	8082                	ret
80000a7e:	00357793          	andi	a5,a0,3
80000a82:	ebbd                	bnez	a5,80000af8 <memcpy+0xa6>
80000a84:	87aa                	mv	a5,a0
80000a86:	ffc77693          	andi	a3,a4,-4
80000a8a:	fe068613          	addi	a2,a3,-32
80000a8e:	06c7fc63          	bleu	a2,a5,80000b06 <memcpy+0xb4>
80000a92:	0005a383          	lw	t2,0(a1)
80000a96:	0045a283          	lw	t0,4(a1)
80000a9a:	0085af83          	lw	t6,8(a1)
80000a9e:	00c5af03          	lw	t5,12(a1)
80000aa2:	0105ae83          	lw	t4,16(a1)
80000aa6:	0145ae03          	lw	t3,20(a1)
80000aaa:	0185a303          	lw	t1,24(a1)
80000aae:	01c5a883          	lw	a7,28(a1)
80000ab2:	02458593          	addi	a1,a1,36
80000ab6:	02478793          	addi	a5,a5,36
80000aba:	ffc5a803          	lw	a6,-4(a1)
80000abe:	fc77ae23          	sw	t2,-36(a5)
80000ac2:	fe57a023          	sw	t0,-32(a5)
80000ac6:	fff7a223          	sw	t6,-28(a5)
80000aca:	ffe7a423          	sw	t5,-24(a5)
80000ace:	ffd7a623          	sw	t4,-20(a5)
80000ad2:	ffc7a823          	sw	t3,-16(a5)
80000ad6:	fe67aa23          	sw	t1,-12(a5)
80000ada:	ff17ac23          	sw	a7,-8(a5)
80000ade:	ff07ae23          	sw	a6,-4(a5)
80000ae2:	b775                	j	80000a8e <memcpy+0x3c>
80000ae4:	0005c683          	lbu	a3,0(a1)
80000ae8:	0785                	addi	a5,a5,1
80000aea:	0585                	addi	a1,a1,1
80000aec:	fed78fa3          	sb	a3,-1(a5)
80000af0:	0037f693          	andi	a3,a5,3
80000af4:	fae5                	bnez	a3,80000ae4 <memcpy+0x92>
80000af6:	bf41                	j	80000a86 <memcpy+0x34>
80000af8:	87aa                	mv	a5,a0
80000afa:	bfdd                	j	80000af0 <memcpy+0x9e>
80000afc:	4190                	lw	a2,0(a1)
80000afe:	0791                	addi	a5,a5,4
80000b00:	0591                	addi	a1,a1,4
80000b02:	fec7ae23          	sw	a2,-4(a5)
80000b06:	fed7ebe3          	bltu	a5,a3,80000afc <memcpy+0xaa>
80000b0a:	f6e7e7e3          	bltu	a5,a4,80000a78 <memcpy+0x26>
80000b0e:	8082                	ret

80000b10 <strcmp>:
80000b10:	00b56733          	or	a4,a0,a1
80000b14:	53fd                	li	t2,-1
80000b16:	8b0d                	andi	a4,a4,3
80000b18:	e779                	bnez	a4,80000be6 <strcmp+0xd6>
80000b1a:	7f7f87b7          	lui	a5,0x7f7f8
80000b1e:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <_stack_size+0x7f7f7b7f>
80000b22:	4110                	lw	a2,0(a0)
80000b24:	4194                	lw	a3,0(a1)
80000b26:	00f672b3          	and	t0,a2,a5
80000b2a:	00f66333          	or	t1,a2,a5
80000b2e:	92be                	add	t0,t0,a5
80000b30:	0062e2b3          	or	t0,t0,t1
80000b34:	0c729763          	bne	t0,t2,80000c02 <strcmp+0xf2>
80000b38:	06d61863          	bne	a2,a3,80000ba8 <strcmp+0x98>
80000b3c:	4150                	lw	a2,4(a0)
80000b3e:	41d4                	lw	a3,4(a1)
80000b40:	00f672b3          	and	t0,a2,a5
80000b44:	00f66333          	or	t1,a2,a5
80000b48:	92be                	add	t0,t0,a5
80000b4a:	0062e2b3          	or	t0,t0,t1
80000b4e:	0a729863          	bne	t0,t2,80000bfe <strcmp+0xee>
80000b52:	04d61b63          	bne	a2,a3,80000ba8 <strcmp+0x98>
80000b56:	4510                	lw	a2,8(a0)
80000b58:	4594                	lw	a3,8(a1)
80000b5a:	00f672b3          	and	t0,a2,a5
80000b5e:	00f66333          	or	t1,a2,a5
80000b62:	92be                	add	t0,t0,a5
80000b64:	0062e2b3          	or	t0,t0,t1
80000b68:	0a729163          	bne	t0,t2,80000c0a <strcmp+0xfa>
80000b6c:	02d61e63          	bne	a2,a3,80000ba8 <strcmp+0x98>
80000b70:	4550                	lw	a2,12(a0)
80000b72:	45d4                	lw	a3,12(a1)
80000b74:	00f672b3          	and	t0,a2,a5
80000b78:	00f66333          	or	t1,a2,a5
80000b7c:	92be                	add	t0,t0,a5
80000b7e:	0062e2b3          	or	t0,t0,t1
80000b82:	08729a63          	bne	t0,t2,80000c16 <strcmp+0x106>
80000b86:	02d61163          	bne	a2,a3,80000ba8 <strcmp+0x98>
80000b8a:	4910                	lw	a2,16(a0)
80000b8c:	4994                	lw	a3,16(a1)
80000b8e:	00f672b3          	and	t0,a2,a5
80000b92:	00f66333          	or	t1,a2,a5
80000b96:	92be                	add	t0,t0,a5
80000b98:	0062e2b3          	or	t0,t0,t1
80000b9c:	08729363          	bne	t0,t2,80000c22 <strcmp+0x112>
80000ba0:	0551                	addi	a0,a0,20
80000ba2:	05d1                	addi	a1,a1,20
80000ba4:	f6d60fe3          	beq	a2,a3,80000b22 <strcmp+0x12>
80000ba8:	01061713          	slli	a4,a2,0x10
80000bac:	01069793          	slli	a5,a3,0x10
80000bb0:	00f71c63          	bne	a4,a5,80000bc8 <strcmp+0xb8>
80000bb4:	01065713          	srli	a4,a2,0x10
80000bb8:	0106d793          	srli	a5,a3,0x10
80000bbc:	40f70533          	sub	a0,a4,a5
80000bc0:	0ff57593          	andi	a1,a0,255
80000bc4:	e991                	bnez	a1,80000bd8 <strcmp+0xc8>
80000bc6:	8082                	ret
80000bc8:	8341                	srli	a4,a4,0x10
80000bca:	83c1                	srli	a5,a5,0x10
80000bcc:	40f70533          	sub	a0,a4,a5
80000bd0:	0ff57593          	andi	a1,a0,255
80000bd4:	e191                	bnez	a1,80000bd8 <strcmp+0xc8>
80000bd6:	8082                	ret
80000bd8:	0ff77713          	andi	a4,a4,255
80000bdc:	0ff7f793          	andi	a5,a5,255
80000be0:	40f70533          	sub	a0,a4,a5
80000be4:	8082                	ret
80000be6:	00054603          	lbu	a2,0(a0)
80000bea:	0005c683          	lbu	a3,0(a1)
80000bee:	0505                	addi	a0,a0,1
80000bf0:	0585                	addi	a1,a1,1
80000bf2:	00d61363          	bne	a2,a3,80000bf8 <strcmp+0xe8>
80000bf6:	fa65                	bnez	a2,80000be6 <strcmp+0xd6>
80000bf8:	40d60533          	sub	a0,a2,a3
80000bfc:	8082                	ret
80000bfe:	0511                	addi	a0,a0,4
80000c00:	0591                	addi	a1,a1,4
80000c02:	fed612e3          	bne	a2,a3,80000be6 <strcmp+0xd6>
80000c06:	4501                	li	a0,0
80000c08:	8082                	ret
80000c0a:	0521                	addi	a0,a0,8
80000c0c:	05a1                	addi	a1,a1,8
80000c0e:	fcd61ce3          	bne	a2,a3,80000be6 <strcmp+0xd6>
80000c12:	4501                	li	a0,0
80000c14:	8082                	ret
80000c16:	0531                	addi	a0,a0,12
80000c18:	05b1                	addi	a1,a1,12
80000c1a:	fcd616e3          	bne	a2,a3,80000be6 <strcmp+0xd6>
80000c1e:	4501                	li	a0,0
80000c20:	8082                	ret
80000c22:	0541                	addi	a0,a0,16
80000c24:	05c1                	addi	a1,a1,16
80000c26:	fcd610e3          	bne	a2,a3,80000be6 <strcmp+0xd6>
80000c2a:	4501                	li	a0,0
80000c2c:	8082                	ret

80000c2e <__divdf3>:
80000c2e:	7179                	addi	sp,sp,-48
80000c30:	d422                	sw	s0,40(sp)
80000c32:	d226                	sw	s1,36(sp)
80000c34:	c85a                	sw	s6,16(sp)
80000c36:	842a                	mv	s0,a0
80000c38:	8b2a                	mv	s6,a0
80000c3a:	001004b7          	lui	s1,0x100
80000c3e:	0145d513          	srli	a0,a1,0x14
80000c42:	d04a                	sw	s2,32(sp)
80000c44:	ce4e                	sw	s3,28(sp)
80000c46:	c65e                	sw	s7,12(sp)
80000c48:	14fd                	addi	s1,s1,-1
80000c4a:	d606                	sw	ra,44(sp)
80000c4c:	cc52                	sw	s4,24(sp)
80000c4e:	ca56                	sw	s5,20(sp)
80000c50:	7ff57513          	andi	a0,a0,2047
80000c54:	8bb2                	mv	s7,a2
80000c56:	89b6                	mv	s3,a3
80000c58:	8ced                	and	s1,s1,a1
80000c5a:	01f5d913          	srli	s2,a1,0x1f
80000c5e:	c159                	beqz	a0,80000ce4 <__divdf3+0xb6>
80000c60:	7ff00793          	li	a5,2047
80000c64:	0cf50b63          	beq	a0,a5,80000d3a <__divdf3+0x10c>
80000c68:	048e                	slli	s1,s1,0x3
80000c6a:	008006b7          	lui	a3,0x800
80000c6e:	8cd5                	or	s1,s1,a3
80000c70:	01db5a93          	srli	s5,s6,0x1d
80000c74:	009aeab3          	or	s5,s5,s1
80000c78:	003b1413          	slli	s0,s6,0x3
80000c7c:	c0150a13          	addi	s4,a0,-1023
80000c80:	4b01                	li	s6,0
80000c82:	0149d513          	srli	a0,s3,0x14
80000c86:	001004b7          	lui	s1,0x100
80000c8a:	14fd                	addi	s1,s1,-1
80000c8c:	7ff57513          	andi	a0,a0,2047
80000c90:	0134f4b3          	and	s1,s1,s3
80000c94:	8fde                	mv	t6,s7
80000c96:	01f9d993          	srli	s3,s3,0x1f
80000c9a:	c171                	beqz	a0,80000d5e <__divdf3+0x130>
80000c9c:	7ff00793          	li	a5,2047
80000ca0:	10f50763          	beq	a0,a5,80000dae <__divdf3+0x180>
80000ca4:	008007b7          	lui	a5,0x800
80000ca8:	048e                	slli	s1,s1,0x3
80000caa:	8cdd                	or	s1,s1,a5
80000cac:	01dbd793          	srli	a5,s7,0x1d
80000cb0:	8fc5                	or	a5,a5,s1
80000cb2:	003b9f93          	slli	t6,s7,0x3
80000cb6:	c0150513          	addi	a0,a0,-1023
80000cba:	4701                	li	a4,0
80000cbc:	002b1693          	slli	a3,s6,0x2
80000cc0:	8ed9                	or	a3,a3,a4
80000cc2:	16fd                	addi	a3,a3,-1
80000cc4:	45b9                	li	a1,14
80000cc6:	01394633          	xor	a2,s2,s3
80000cca:	40aa0533          	sub	a0,s4,a0
80000cce:	10d5e163          	bltu	a1,a3,80000dd0 <__divdf3+0x1a2>
80000cd2:	00002597          	auipc	a1,0x2
80000cd6:	a1e58593          	addi	a1,a1,-1506 # 800026f0 <end+0x5e2>
80000cda:	068a                	slli	a3,a3,0x2
80000cdc:	96ae                	add	a3,a3,a1
80000cde:	4294                	lw	a3,0(a3)
80000ce0:	96ae                	add	a3,a3,a1
80000ce2:	8682                	jr	a3
80000ce4:	0164eab3          	or	s5,s1,s6
80000ce8:	060a8263          	beqz	s5,80000d4c <__divdf3+0x11e>
80000cec:	c89d                	beqz	s1,80000d22 <__divdf3+0xf4>
80000cee:	8526                	mv	a0,s1
80000cf0:	3e2010ef          	jal	ra,800020d2 <__clzsi2>
80000cf4:	ff550793          	addi	a5,a0,-11
80000cf8:	4771                	li	a4,28
80000cfa:	02f74a63          	blt	a4,a5,80000d2e <__divdf3+0x100>
80000cfe:	4af5                	li	s5,29
80000d00:	ff850413          	addi	s0,a0,-8
80000d04:	40fa8ab3          	sub	s5,s5,a5
80000d08:	008494b3          	sll	s1,s1,s0
80000d0c:	015b5ab3          	srl	s5,s6,s5
80000d10:	009aeab3          	or	s5,s5,s1
80000d14:	008b1433          	sll	s0,s6,s0
80000d18:	c0d00a13          	li	s4,-1011
80000d1c:	40aa0a33          	sub	s4,s4,a0
80000d20:	b785                	j	80000c80 <__divdf3+0x52>
80000d22:	855a                	mv	a0,s6
80000d24:	3ae010ef          	jal	ra,800020d2 <__clzsi2>
80000d28:	02050513          	addi	a0,a0,32
80000d2c:	b7e1                	j	80000cf4 <__divdf3+0xc6>
80000d2e:	fd850493          	addi	s1,a0,-40
80000d32:	009b1ab3          	sll	s5,s6,s1
80000d36:	4401                	li	s0,0
80000d38:	b7c5                	j	80000d18 <__divdf3+0xea>
80000d3a:	0164eab3          	or	s5,s1,s6
80000d3e:	000a8b63          	beqz	s5,80000d54 <__divdf3+0x126>
80000d42:	8aa6                	mv	s5,s1
80000d44:	7ff00a13          	li	s4,2047
80000d48:	4b0d                	li	s6,3
80000d4a:	bf25                	j	80000c82 <__divdf3+0x54>
80000d4c:	4401                	li	s0,0
80000d4e:	4a01                	li	s4,0
80000d50:	4b05                	li	s6,1
80000d52:	bf05                	j	80000c82 <__divdf3+0x54>
80000d54:	4401                	li	s0,0
80000d56:	7ff00a13          	li	s4,2047
80000d5a:	4b09                	li	s6,2
80000d5c:	b71d                	j	80000c82 <__divdf3+0x54>
80000d5e:	0174e7b3          	or	a5,s1,s7
80000d62:	cfb1                	beqz	a5,80000dbe <__divdf3+0x190>
80000d64:	c88d                	beqz	s1,80000d96 <__divdf3+0x168>
80000d66:	8526                	mv	a0,s1
80000d68:	36a010ef          	jal	ra,800020d2 <__clzsi2>
80000d6c:	ff550713          	addi	a4,a0,-11
80000d70:	47f1                	li	a5,28
80000d72:	02e7c863          	blt	a5,a4,80000da2 <__divdf3+0x174>
80000d76:	47f5                	li	a5,29
80000d78:	ff850f93          	addi	t6,a0,-8
80000d7c:	8f99                	sub	a5,a5,a4
80000d7e:	01f494b3          	sll	s1,s1,t6
80000d82:	00fbd7b3          	srl	a5,s7,a5
80000d86:	8fc5                	or	a5,a5,s1
80000d88:	01fb9fb3          	sll	t6,s7,t6
80000d8c:	c0d00613          	li	a2,-1011
80000d90:	40a60533          	sub	a0,a2,a0
80000d94:	b71d                	j	80000cba <__divdf3+0x8c>
80000d96:	855e                	mv	a0,s7
80000d98:	33a010ef          	jal	ra,800020d2 <__clzsi2>
80000d9c:	02050513          	addi	a0,a0,32
80000da0:	b7f1                	j	80000d6c <__divdf3+0x13e>
80000da2:	fd850793          	addi	a5,a0,-40
80000da6:	00fb97b3          	sll	a5,s7,a5
80000daa:	4f81                	li	t6,0
80000dac:	b7c5                	j	80000d8c <__divdf3+0x15e>
80000dae:	0174e7b3          	or	a5,s1,s7
80000db2:	cb91                	beqz	a5,80000dc6 <__divdf3+0x198>
80000db4:	87a6                	mv	a5,s1
80000db6:	7ff00513          	li	a0,2047
80000dba:	470d                	li	a4,3
80000dbc:	b701                	j	80000cbc <__divdf3+0x8e>
80000dbe:	4f81                	li	t6,0
80000dc0:	4501                	li	a0,0
80000dc2:	4705                	li	a4,1
80000dc4:	bde5                	j	80000cbc <__divdf3+0x8e>
80000dc6:	4f81                	li	t6,0
80000dc8:	7ff00513          	li	a0,2047
80000dcc:	4709                	li	a4,2
80000dce:	b5fd                	j	80000cbc <__divdf3+0x8e>
80000dd0:	0157e663          	bltu	a5,s5,80000ddc <__divdf3+0x1ae>
80000dd4:	2afa9663          	bne	s5,a5,80001080 <__divdf3+0x452>
80000dd8:	2bf46463          	bltu	s0,t6,80001080 <__divdf3+0x452>
80000ddc:	01fa9593          	slli	a1,s5,0x1f
80000de0:	00145693          	srli	a3,s0,0x1
80000de4:	01f41713          	slli	a4,s0,0x1f
80000de8:	001ada93          	srli	s5,s5,0x1
80000dec:	00d5e433          	or	s0,a1,a3
80000df0:	07a2                	slli	a5,a5,0x8
80000df2:	018fd813          	srli	a6,t6,0x18
80000df6:	00f86833          	or	a6,a6,a5
80000dfa:	01085e93          	srli	t4,a6,0x10
80000dfe:	03dad5b3          	divu	a1,s5,t4
80000e02:	01081e13          	slli	t3,a6,0x10
80000e06:	010e5e13          	srli	t3,t3,0x10
80000e0a:	01045693          	srli	a3,s0,0x10
80000e0e:	008f9893          	slli	a7,t6,0x8
80000e12:	03daf4b3          	remu	s1,s5,t4
80000e16:	8fae                	mv	t6,a1
80000e18:	02be07b3          	mul	a5,t3,a1
80000e1c:	04c2                	slli	s1,s1,0x10
80000e1e:	8ec5                	or	a3,a3,s1
80000e20:	00f6fc63          	bleu	a5,a3,80000e38 <__divdf3+0x20a>
80000e24:	96c2                	add	a3,a3,a6
80000e26:	fff58f93          	addi	t6,a1,-1
80000e2a:	0106e763          	bltu	a3,a6,80000e38 <__divdf3+0x20a>
80000e2e:	00f6f563          	bleu	a5,a3,80000e38 <__divdf3+0x20a>
80000e32:	ffe58f93          	addi	t6,a1,-2
80000e36:	96c2                	add	a3,a3,a6
80000e38:	8e9d                	sub	a3,a3,a5
80000e3a:	03d6d333          	divu	t1,a3,t4
80000e3e:	0442                	slli	s0,s0,0x10
80000e40:	8041                	srli	s0,s0,0x10
80000e42:	03d6f6b3          	remu	a3,a3,t4
80000e46:	879a                	mv	a5,t1
80000e48:	026e05b3          	mul	a1,t3,t1
80000e4c:	06c2                	slli	a3,a3,0x10
80000e4e:	8ec1                	or	a3,a3,s0
80000e50:	00b6fc63          	bleu	a1,a3,80000e68 <__divdf3+0x23a>
80000e54:	96c2                	add	a3,a3,a6
80000e56:	fff30793          	addi	a5,t1,-1
80000e5a:	0106e763          	bltu	a3,a6,80000e68 <__divdf3+0x23a>
80000e5e:	00b6f563          	bleu	a1,a3,80000e68 <__divdf3+0x23a>
80000e62:	ffe30793          	addi	a5,t1,-2
80000e66:	96c2                	add	a3,a3,a6
80000e68:	40b68433          	sub	s0,a3,a1
80000e6c:	0fc2                	slli	t6,t6,0x10
80000e6e:	65c1                	lui	a1,0x10
80000e70:	00ffefb3          	or	t6,t6,a5
80000e74:	fff58313          	addi	t1,a1,-1 # ffff <_stack_size+0xfbff>
80000e78:	010fd693          	srli	a3,t6,0x10
80000e7c:	006ff7b3          	and	a5,t6,t1
80000e80:	0108df13          	srli	t5,a7,0x10
80000e84:	0068f333          	and	t1,a7,t1
80000e88:	026783b3          	mul	t2,a5,t1
80000e8c:	026684b3          	mul	s1,a3,t1
80000e90:	02ff07b3          	mul	a5,t5,a5
80000e94:	03e682b3          	mul	t0,a3,t5
80000e98:	009786b3          	add	a3,a5,s1
80000e9c:	0103d793          	srli	a5,t2,0x10
80000ea0:	97b6                	add	a5,a5,a3
80000ea2:	0097f363          	bleu	s1,a5,80000ea8 <__divdf3+0x27a>
80000ea6:	92ae                	add	t0,t0,a1
80000ea8:	0107d693          	srli	a3,a5,0x10
80000eac:	9696                	add	a3,a3,t0
80000eae:	62c1                	lui	t0,0x10
80000eb0:	12fd                	addi	t0,t0,-1
80000eb2:	0057f5b3          	and	a1,a5,t0
80000eb6:	05c2                	slli	a1,a1,0x10
80000eb8:	0053f3b3          	and	t2,t2,t0
80000ebc:	959e                	add	a1,a1,t2
80000ebe:	00d46763          	bltu	s0,a3,80000ecc <__divdf3+0x29e>
80000ec2:	87fe                	mv	a5,t6
80000ec4:	02d41e63          	bne	s0,a3,80000f00 <__divdf3+0x2d2>
80000ec8:	02b77c63          	bleu	a1,a4,80000f00 <__divdf3+0x2d2>
80000ecc:	9746                	add	a4,a4,a7
80000ece:	011732b3          	sltu	t0,a4,a7
80000ed2:	92c2                	add	t0,t0,a6
80000ed4:	9416                	add	s0,s0,t0
80000ed6:	ffff8793          	addi	a5,t6,-1
80000eda:	00886663          	bltu	a6,s0,80000ee6 <__divdf3+0x2b8>
80000ede:	02881163          	bne	a6,s0,80000f00 <__divdf3+0x2d2>
80000ee2:	01176f63          	bltu	a4,a7,80000f00 <__divdf3+0x2d2>
80000ee6:	00d46663          	bltu	s0,a3,80000ef2 <__divdf3+0x2c4>
80000eea:	00869b63          	bne	a3,s0,80000f00 <__divdf3+0x2d2>
80000eee:	00b77963          	bleu	a1,a4,80000f00 <__divdf3+0x2d2>
80000ef2:	9746                	add	a4,a4,a7
80000ef4:	ffef8793          	addi	a5,t6,-2
80000ef8:	01173fb3          	sltu	t6,a4,a7
80000efc:	9fc2                	add	t6,t6,a6
80000efe:	947e                	add	s0,s0,t6
80000f00:	40b705b3          	sub	a1,a4,a1
80000f04:	8c15                	sub	s0,s0,a3
80000f06:	00b73733          	sltu	a4,a4,a1
80000f0a:	8c19                	sub	s0,s0,a4
80000f0c:	5ffd                	li	t6,-1
80000f0e:	0e880663          	beq	a6,s0,80000ffa <__divdf3+0x3cc>
80000f12:	03d452b3          	divu	t0,s0,t4
80000f16:	0105d693          	srli	a3,a1,0x10
80000f1a:	03d47433          	remu	s0,s0,t4
80000f1e:	8716                	mv	a4,t0
80000f20:	025e0fb3          	mul	t6,t3,t0
80000f24:	0442                	slli	s0,s0,0x10
80000f26:	8c55                	or	s0,s0,a3
80000f28:	01f47c63          	bleu	t6,s0,80000f40 <__divdf3+0x312>
80000f2c:	9442                	add	s0,s0,a6
80000f2e:	fff28713          	addi	a4,t0,-1 # ffff <_stack_size+0xfbff>
80000f32:	01046763          	bltu	s0,a6,80000f40 <__divdf3+0x312>
80000f36:	01f47563          	bleu	t6,s0,80000f40 <__divdf3+0x312>
80000f3a:	ffe28713          	addi	a4,t0,-2
80000f3e:	9442                	add	s0,s0,a6
80000f40:	41f40433          	sub	s0,s0,t6
80000f44:	03d456b3          	divu	a3,s0,t4
80000f48:	05c2                	slli	a1,a1,0x10
80000f4a:	81c1                	srli	a1,a1,0x10
80000f4c:	03d47433          	remu	s0,s0,t4
80000f50:	02de0e33          	mul	t3,t3,a3
80000f54:	0442                	slli	s0,s0,0x10
80000f56:	8c4d                	or	s0,s0,a1
80000f58:	85b6                	mv	a1,a3
80000f5a:	01c47c63          	bleu	t3,s0,80000f72 <__divdf3+0x344>
80000f5e:	9442                	add	s0,s0,a6
80000f60:	fff68593          	addi	a1,a3,-1 # 7fffff <_stack_size+0x7ffbff>
80000f64:	01046763          	bltu	s0,a6,80000f72 <__divdf3+0x344>
80000f68:	01c47563          	bleu	t3,s0,80000f72 <__divdf3+0x344>
80000f6c:	ffe68593          	addi	a1,a3,-2
80000f70:	9442                	add	s0,s0,a6
80000f72:	0742                	slli	a4,a4,0x10
80000f74:	8dd9                	or	a1,a1,a4
80000f76:	01059713          	slli	a4,a1,0x10
80000f7a:	8341                	srli	a4,a4,0x10
80000f7c:	41c40433          	sub	s0,s0,t3
80000f80:	0105de13          	srli	t3,a1,0x10
80000f84:	02670eb3          	mul	t4,a4,t1
80000f88:	026e0333          	mul	t1,t3,t1
80000f8c:	03cf0e33          	mul	t3,t5,t3
80000f90:	02ef0f33          	mul	t5,t5,a4
80000f94:	010ed713          	srli	a4,t4,0x10
80000f98:	9f1a                	add	t5,t5,t1
80000f9a:	977a                	add	a4,a4,t5
80000f9c:	00677463          	bleu	t1,a4,80000fa4 <__divdf3+0x376>
80000fa0:	66c1                	lui	a3,0x10
80000fa2:	9e36                	add	t3,t3,a3
80000fa4:	01075313          	srli	t1,a4,0x10
80000fa8:	9372                	add	t1,t1,t3
80000faa:	6e41                	lui	t3,0x10
80000fac:	1e7d                	addi	t3,t3,-1
80000fae:	01c776b3          	and	a3,a4,t3
80000fb2:	06c2                	slli	a3,a3,0x10
80000fb4:	01cefeb3          	and	t4,t4,t3
80000fb8:	96f6                	add	a3,a3,t4
80000fba:	00646663          	bltu	s0,t1,80000fc6 <__divdf3+0x398>
80000fbe:	8fae                	mv	t6,a1
80000fc0:	02641b63          	bne	s0,t1,80000ff6 <__divdf3+0x3c8>
80000fc4:	ca9d                	beqz	a3,80000ffa <__divdf3+0x3cc>
80000fc6:	9442                	add	s0,s0,a6
80000fc8:	fff58f93          	addi	t6,a1,-1
80000fcc:	03046163          	bltu	s0,a6,80000fee <__divdf3+0x3c0>
80000fd0:	00646663          	bltu	s0,t1,80000fdc <__divdf3+0x3ae>
80000fd4:	02641163          	bne	s0,t1,80000ff6 <__divdf3+0x3c8>
80000fd8:	00d8fd63          	bleu	a3,a7,80000ff2 <__divdf3+0x3c4>
80000fdc:	00189713          	slli	a4,a7,0x1
80000fe0:	011738b3          	sltu	a7,a4,a7
80000fe4:	9846                	add	a6,a6,a7
80000fe6:	ffe58f93          	addi	t6,a1,-2
80000fea:	9442                	add	s0,s0,a6
80000fec:	88ba                	mv	a7,a4
80000fee:	00641463          	bne	s0,t1,80000ff6 <__divdf3+0x3c8>
80000ff2:	01168463          	beq	a3,a7,80000ffa <__divdf3+0x3cc>
80000ff6:	001fef93          	ori	t6,t6,1
80000ffa:	3ff50693          	addi	a3,a0,1023
80000ffe:	0ad05c63          	blez	a3,800010b6 <__divdf3+0x488>
80001002:	007ff713          	andi	a4,t6,7
80001006:	cf01                	beqz	a4,8000101e <__divdf3+0x3f0>
80001008:	00fff713          	andi	a4,t6,15
8000100c:	4591                	li	a1,4
8000100e:	00b70863          	beq	a4,a1,8000101e <__divdf3+0x3f0>
80001012:	004f8593          	addi	a1,t6,4
80001016:	01f5bfb3          	sltu	t6,a1,t6
8000101a:	97fe                	add	a5,a5,t6
8000101c:	8fae                	mv	t6,a1
8000101e:	00779713          	slli	a4,a5,0x7
80001022:	00075863          	bgez	a4,80001032 <__divdf3+0x404>
80001026:	ff000737          	lui	a4,0xff000
8000102a:	177d                	addi	a4,a4,-1
8000102c:	8ff9                	and	a5,a5,a4
8000102e:	40050693          	addi	a3,a0,1024
80001032:	7fe00713          	li	a4,2046
80001036:	10d74b63          	blt	a4,a3,8000114c <__divdf3+0x51e>
8000103a:	01d79713          	slli	a4,a5,0x1d
8000103e:	003fdf93          	srli	t6,t6,0x3
80001042:	01f76733          	or	a4,a4,t6
80001046:	838d                	srli	a5,a5,0x3
80001048:	001005b7          	lui	a1,0x100
8000104c:	15fd                	addi	a1,a1,-1
8000104e:	8fed                	and	a5,a5,a1
80001050:	801005b7          	lui	a1,0x80100
80001054:	15fd                	addi	a1,a1,-1
80001056:	7ff6f693          	andi	a3,a3,2047
8000105a:	06d2                	slli	a3,a3,0x14
8000105c:	8fed                	and	a5,a5,a1
8000105e:	50b2                	lw	ra,44(sp)
80001060:	5422                	lw	s0,40(sp)
80001062:	067e                	slli	a2,a2,0x1f
80001064:	8fd5                	or	a5,a5,a3
80001066:	00c7e6b3          	or	a3,a5,a2
8000106a:	5492                	lw	s1,36(sp)
8000106c:	5902                	lw	s2,32(sp)
8000106e:	49f2                	lw	s3,28(sp)
80001070:	4a62                	lw	s4,24(sp)
80001072:	4ad2                	lw	s5,20(sp)
80001074:	4b42                	lw	s6,16(sp)
80001076:	4bb2                	lw	s7,12(sp)
80001078:	853a                	mv	a0,a4
8000107a:	85b6                	mv	a1,a3
8000107c:	6145                	addi	sp,sp,48
8000107e:	8082                	ret
80001080:	157d                	addi	a0,a0,-1
80001082:	4701                	li	a4,0
80001084:	b3b5                	j	80000df0 <__divdf3+0x1c2>
80001086:	864a                	mv	a2,s2
80001088:	87d6                	mv	a5,s5
8000108a:	8fa2                	mv	t6,s0
8000108c:	875a                	mv	a4,s6
8000108e:	4689                	li	a3,2
80001090:	0ad70e63          	beq	a4,a3,8000114c <__divdf3+0x51e>
80001094:	468d                	li	a3,3
80001096:	0ad70463          	beq	a4,a3,8000113e <__divdf3+0x510>
8000109a:	4685                	li	a3,1
8000109c:	f4d71fe3          	bne	a4,a3,80000ffa <__divdf3+0x3cc>
800010a0:	4781                	li	a5,0
800010a2:	4701                	li	a4,0
800010a4:	a0bd                	j	80001112 <__divdf3+0x4e4>
800010a6:	864e                	mv	a2,s3
800010a8:	b7dd                	j	8000108e <__divdf3+0x460>
800010aa:	000807b7          	lui	a5,0x80
800010ae:	4f81                	li	t6,0
800010b0:	4601                	li	a2,0
800010b2:	470d                	li	a4,3
800010b4:	bfe9                	j	8000108e <__divdf3+0x460>
800010b6:	4585                	li	a1,1
800010b8:	8d95                	sub	a1,a1,a3
800010ba:	03800713          	li	a4,56
800010be:	feb741e3          	blt	a4,a1,800010a0 <__divdf3+0x472>
800010c2:	477d                	li	a4,31
800010c4:	04b74963          	blt	a4,a1,80001116 <__divdf3+0x4e8>
800010c8:	41e50513          	addi	a0,a0,1054
800010cc:	00a79733          	sll	a4,a5,a0
800010d0:	00bfd6b3          	srl	a3,t6,a1
800010d4:	00af9533          	sll	a0,t6,a0
800010d8:	8f55                	or	a4,a4,a3
800010da:	00a03533          	snez	a0,a0
800010de:	8f49                	or	a4,a4,a0
800010e0:	00b7d7b3          	srl	a5,a5,a1
800010e4:	00777693          	andi	a3,a4,7
800010e8:	ce81                	beqz	a3,80001100 <__divdf3+0x4d2>
800010ea:	00f77693          	andi	a3,a4,15
800010ee:	4591                	li	a1,4
800010f0:	00b68863          	beq	a3,a1,80001100 <__divdf3+0x4d2>
800010f4:	00470693          	addi	a3,a4,4 # ff000004 <_stack_start+0x7effa6f4>
800010f8:	00e6b733          	sltu	a4,a3,a4
800010fc:	97ba                	add	a5,a5,a4
800010fe:	8736                	mv	a4,a3
80001100:	00879693          	slli	a3,a5,0x8
80001104:	0406c963          	bltz	a3,80001156 <__divdf3+0x528>
80001108:	01d79693          	slli	a3,a5,0x1d
8000110c:	830d                	srli	a4,a4,0x3
8000110e:	8f55                	or	a4,a4,a3
80001110:	838d                	srli	a5,a5,0x3
80001112:	4681                	li	a3,0
80001114:	bf15                	j	80001048 <__divdf3+0x41a>
80001116:	5705                	li	a4,-31
80001118:	8f15                	sub	a4,a4,a3
8000111a:	02000813          	li	a6,32
8000111e:	00e7d733          	srl	a4,a5,a4
80001122:	4681                	li	a3,0
80001124:	01058663          	beq	a1,a6,80001130 <__divdf3+0x502>
80001128:	43e50513          	addi	a0,a0,1086
8000112c:	00a796b3          	sll	a3,a5,a0
80001130:	01f6e533          	or	a0,a3,t6
80001134:	00a03533          	snez	a0,a0
80001138:	8f49                	or	a4,a4,a0
8000113a:	4781                	li	a5,0
8000113c:	b765                	j	800010e4 <__divdf3+0x4b6>
8000113e:	000807b7          	lui	a5,0x80
80001142:	4701                	li	a4,0
80001144:	7ff00693          	li	a3,2047
80001148:	4601                	li	a2,0
8000114a:	bdfd                	j	80001048 <__divdf3+0x41a>
8000114c:	4781                	li	a5,0
8000114e:	4701                	li	a4,0
80001150:	7ff00693          	li	a3,2047
80001154:	bdd5                	j	80001048 <__divdf3+0x41a>
80001156:	4781                	li	a5,0
80001158:	4701                	li	a4,0
8000115a:	4685                	li	a3,1
8000115c:	b5f5                	j	80001048 <__divdf3+0x41a>

8000115e <__muldf3>:
8000115e:	7179                	addi	sp,sp,-48
80001160:	d04a                	sw	s2,32(sp)
80001162:	ca56                	sw	s5,20(sp)
80001164:	00100937          	lui	s2,0x100
80001168:	0145da93          	srli	s5,a1,0x14
8000116c:	ce4e                	sw	s3,28(sp)
8000116e:	cc52                	sw	s4,24(sp)
80001170:	c85a                	sw	s6,16(sp)
80001172:	c65e                	sw	s7,12(sp)
80001174:	197d                	addi	s2,s2,-1
80001176:	d606                	sw	ra,44(sp)
80001178:	d422                	sw	s0,40(sp)
8000117a:	d226                	sw	s1,36(sp)
8000117c:	7ffafa93          	andi	s5,s5,2047
80001180:	8b2a                	mv	s6,a0
80001182:	8bb2                	mv	s7,a2
80001184:	8a36                	mv	s4,a3
80001186:	00b97933          	and	s2,s2,a1
8000118a:	01f5d993          	srli	s3,a1,0x1f
8000118e:	080a8863          	beqz	s5,8000121e <__muldf3+0xc0>
80001192:	7ff00793          	li	a5,2047
80001196:	0cfa8d63          	beq	s5,a5,80001270 <__muldf3+0x112>
8000119a:	00800437          	lui	s0,0x800
8000119e:	090e                	slli	s2,s2,0x3
800011a0:	00896933          	or	s2,s2,s0
800011a4:	01d55413          	srli	s0,a0,0x1d
800011a8:	01246433          	or	s0,s0,s2
800011ac:	00351493          	slli	s1,a0,0x3
800011b0:	c01a8a93          	addi	s5,s5,-1023
800011b4:	4b01                	li	s6,0
800011b6:	014a5513          	srli	a0,s4,0x14
800011ba:	00100937          	lui	s2,0x100
800011be:	197d                	addi	s2,s2,-1
800011c0:	7ff57513          	andi	a0,a0,2047
800011c4:	01497933          	and	s2,s2,s4
800011c8:	875e                	mv	a4,s7
800011ca:	01fa5a13          	srli	s4,s4,0x1f
800011ce:	c179                	beqz	a0,80001294 <__muldf3+0x136>
800011d0:	7ff00793          	li	a5,2047
800011d4:	10f50a63          	beq	a0,a5,800012e8 <__muldf3+0x18a>
800011d8:	008007b7          	lui	a5,0x800
800011dc:	090e                	slli	s2,s2,0x3
800011de:	00f96933          	or	s2,s2,a5
800011e2:	01dbd793          	srli	a5,s7,0x1d
800011e6:	0127e7b3          	or	a5,a5,s2
800011ea:	003b9713          	slli	a4,s7,0x3
800011ee:	c0150513          	addi	a0,a0,-1023
800011f2:	4681                	li	a3,0
800011f4:	002b1593          	slli	a1,s6,0x2
800011f8:	8dd5                	or	a1,a1,a3
800011fa:	9556                	add	a0,a0,s5
800011fc:	15fd                	addi	a1,a1,-1
800011fe:	48b9                	li	a7,14
80001200:	0149c633          	xor	a2,s3,s4
80001204:	00150813          	addi	a6,a0,1
80001208:	10b8e163          	bltu	a7,a1,8000130a <__muldf3+0x1ac>
8000120c:	00001517          	auipc	a0,0x1
80001210:	52050513          	addi	a0,a0,1312 # 8000272c <end+0x61e>
80001214:	058a                	slli	a1,a1,0x2
80001216:	95aa                	add	a1,a1,a0
80001218:	418c                	lw	a1,0(a1)
8000121a:	95aa                	add	a1,a1,a0
8000121c:	8582                	jr	a1
8000121e:	00a96433          	or	s0,s2,a0
80001222:	c025                	beqz	s0,80001282 <__muldf3+0x124>
80001224:	02090b63          	beqz	s2,8000125a <__muldf3+0xfc>
80001228:	854a                	mv	a0,s2
8000122a:	6a9000ef          	jal	ra,800020d2 <__clzsi2>
8000122e:	ff550793          	addi	a5,a0,-11
80001232:	4771                	li	a4,28
80001234:	02f74863          	blt	a4,a5,80001264 <__muldf3+0x106>
80001238:	4475                	li	s0,29
8000123a:	ff850493          	addi	s1,a0,-8
8000123e:	8c1d                	sub	s0,s0,a5
80001240:	00991933          	sll	s2,s2,s1
80001244:	008b5433          	srl	s0,s6,s0
80001248:	01246433          	or	s0,s0,s2
8000124c:	009b14b3          	sll	s1,s6,s1
80001250:	c0d00a93          	li	s5,-1011
80001254:	40aa8ab3          	sub	s5,s5,a0
80001258:	bfb1                	j	800011b4 <__muldf3+0x56>
8000125a:	679000ef          	jal	ra,800020d2 <__clzsi2>
8000125e:	02050513          	addi	a0,a0,32
80001262:	b7f1                	j	8000122e <__muldf3+0xd0>
80001264:	fd850413          	addi	s0,a0,-40
80001268:	008b1433          	sll	s0,s6,s0
8000126c:	4481                	li	s1,0
8000126e:	b7cd                	j	80001250 <__muldf3+0xf2>
80001270:	00a96433          	or	s0,s2,a0
80001274:	c819                	beqz	s0,8000128a <__muldf3+0x12c>
80001276:	84aa                	mv	s1,a0
80001278:	844a                	mv	s0,s2
8000127a:	7ff00a93          	li	s5,2047
8000127e:	4b0d                	li	s6,3
80001280:	bf1d                	j	800011b6 <__muldf3+0x58>
80001282:	4481                	li	s1,0
80001284:	4a81                	li	s5,0
80001286:	4b05                	li	s6,1
80001288:	b73d                	j	800011b6 <__muldf3+0x58>
8000128a:	4481                	li	s1,0
8000128c:	7ff00a93          	li	s5,2047
80001290:	4b09                	li	s6,2
80001292:	b715                	j	800011b6 <__muldf3+0x58>
80001294:	017967b3          	or	a5,s2,s7
80001298:	c3a5                	beqz	a5,800012f8 <__muldf3+0x19a>
8000129a:	02090b63          	beqz	s2,800012d0 <__muldf3+0x172>
8000129e:	854a                	mv	a0,s2
800012a0:	633000ef          	jal	ra,800020d2 <__clzsi2>
800012a4:	ff550693          	addi	a3,a0,-11
800012a8:	47f1                	li	a5,28
800012aa:	02d7c963          	blt	a5,a3,800012dc <__muldf3+0x17e>
800012ae:	47f5                	li	a5,29
800012b0:	ff850713          	addi	a4,a0,-8
800012b4:	8f95                	sub	a5,a5,a3
800012b6:	00e91933          	sll	s2,s2,a4
800012ba:	00fbd7b3          	srl	a5,s7,a5
800012be:	0127e7b3          	or	a5,a5,s2
800012c2:	00eb9733          	sll	a4,s7,a4
800012c6:	c0d00693          	li	a3,-1011
800012ca:	40a68533          	sub	a0,a3,a0
800012ce:	b715                	j	800011f2 <__muldf3+0x94>
800012d0:	855e                	mv	a0,s7
800012d2:	601000ef          	jal	ra,800020d2 <__clzsi2>
800012d6:	02050513          	addi	a0,a0,32
800012da:	b7e9                	j	800012a4 <__muldf3+0x146>
800012dc:	fd850793          	addi	a5,a0,-40
800012e0:	00fb97b3          	sll	a5,s7,a5
800012e4:	4701                	li	a4,0
800012e6:	b7c5                	j	800012c6 <__muldf3+0x168>
800012e8:	017967b3          	or	a5,s2,s7
800012ec:	cb91                	beqz	a5,80001300 <__muldf3+0x1a2>
800012ee:	87ca                	mv	a5,s2
800012f0:	7ff00513          	li	a0,2047
800012f4:	468d                	li	a3,3
800012f6:	bdfd                	j	800011f4 <__muldf3+0x96>
800012f8:	4701                	li	a4,0
800012fa:	4501                	li	a0,0
800012fc:	4685                	li	a3,1
800012fe:	bddd                	j	800011f4 <__muldf3+0x96>
80001300:	4701                	li	a4,0
80001302:	7ff00513          	li	a0,2047
80001306:	4689                	li	a3,2
80001308:	b5f5                	j	800011f4 <__muldf3+0x96>
8000130a:	6fc1                	lui	t6,0x10
8000130c:	ffff8f13          	addi	t5,t6,-1 # ffff <_stack_size+0xfbff>
80001310:	0104d693          	srli	a3,s1,0x10
80001314:	01075313          	srli	t1,a4,0x10
80001318:	01e4f4b3          	and	s1,s1,t5
8000131c:	01e77733          	and	a4,a4,t5
80001320:	029308b3          	mul	a7,t1,s1
80001324:	029705b3          	mul	a1,a4,s1
80001328:	02e682b3          	mul	t0,a3,a4
8000132c:	00588e33          	add	t3,a7,t0
80001330:	0105d893          	srli	a7,a1,0x10
80001334:	98f2                	add	a7,a7,t3
80001336:	02668eb3          	mul	t4,a3,t1
8000133a:	0058f363          	bleu	t0,a7,80001340 <__muldf3+0x1e2>
8000133e:	9efe                	add	t4,t4,t6
80001340:	0108d913          	srli	s2,a7,0x10
80001344:	01e8f8b3          	and	a7,a7,t5
80001348:	0107df93          	srli	t6,a5,0x10
8000134c:	01e5f5b3          	and	a1,a1,t5
80001350:	01e7f3b3          	and	t2,a5,t5
80001354:	08c2                	slli	a7,a7,0x10
80001356:	98ae                	add	a7,a7,a1
80001358:	027687b3          	mul	a5,a3,t2
8000135c:	029385b3          	mul	a1,t2,s1
80001360:	029f84b3          	mul	s1,t6,s1
80001364:	00f48e33          	add	t3,s1,a5
80001368:	0105d493          	srli	s1,a1,0x10
8000136c:	94f2                	add	s1,s1,t3
8000136e:	03f686b3          	mul	a3,a3,t6
80001372:	00f4f463          	bleu	a5,s1,8000137a <__muldf3+0x21c>
80001376:	67c1                	lui	a5,0x10
80001378:	96be                	add	a3,a3,a5
8000137a:	0104df13          	srli	t5,s1,0x10
8000137e:	69c1                	lui	s3,0x10
80001380:	9f36                	add	t5,t5,a3
80001382:	fff98693          	addi	a3,s3,-1 # ffff <_stack_size+0xfbff>
80001386:	8cf5                	and	s1,s1,a3
80001388:	8df5                	and	a1,a1,a3
8000138a:	01045793          	srli	a5,s0,0x10
8000138e:	04c2                	slli	s1,s1,0x10
80001390:	8c75                	and	s0,s0,a3
80001392:	94ae                	add	s1,s1,a1
80001394:	028706b3          	mul	a3,a4,s0
80001398:	9926                	add	s2,s2,s1
8000139a:	02e78e33          	mul	t3,a5,a4
8000139e:	028305b3          	mul	a1,t1,s0
800013a2:	02f30733          	mul	a4,t1,a5
800013a6:	01c58333          	add	t1,a1,t3
800013aa:	0106d593          	srli	a1,a3,0x10
800013ae:	959a                	add	a1,a1,t1
800013b0:	01c5f363          	bleu	t3,a1,800013b6 <__muldf3+0x258>
800013b4:	974e                	add	a4,a4,s3
800013b6:	0105d313          	srli	t1,a1,0x10
800013ba:	69c1                	lui	s3,0x10
800013bc:	00e302b3          	add	t0,t1,a4
800013c0:	fff98713          	addi	a4,s3,-1 # ffff <_stack_size+0xfbff>
800013c4:	8df9                	and	a1,a1,a4
800013c6:	8ef9                	and	a3,a3,a4
800013c8:	02838333          	mul	t1,t2,s0
800013cc:	05c2                	slli	a1,a1,0x10
800013ce:	95b6                	add	a1,a1,a3
800013d0:	02778733          	mul	a4,a5,t2
800013d4:	028f8433          	mul	s0,t6,s0
800013d8:	02ff8e33          	mul	t3,t6,a5
800013dc:	943a                	add	s0,s0,a4
800013de:	01035793          	srli	a5,t1,0x10
800013e2:	943e                	add	s0,s0,a5
800013e4:	00e47363          	bleu	a4,s0,800013ea <__muldf3+0x28c>
800013e8:	9e4e                	add	t3,t3,s3
800013ea:	67c1                	lui	a5,0x10
800013ec:	17fd                	addi	a5,a5,-1
800013ee:	00f476b3          	and	a3,s0,a5
800013f2:	00f37333          	and	t1,t1,a5
800013f6:	06c2                	slli	a3,a3,0x10
800013f8:	9eca                	add	t4,t4,s2
800013fa:	969a                	add	a3,a3,t1
800013fc:	009eb4b3          	sltu	s1,t4,s1
80001400:	96fa                	add	a3,a3,t5
80001402:	009687b3          	add	a5,a3,s1
80001406:	9eae                	add	t4,t4,a1
80001408:	00beb5b3          	sltu	a1,t4,a1
8000140c:	00578333          	add	t1,a5,t0
80001410:	00b30fb3          	add	t6,t1,a1
80001414:	01e6b6b3          	sltu	a3,a3,t5
80001418:	0097b7b3          	sltu	a5,a5,s1
8000141c:	8fd5                	or	a5,a5,a3
8000141e:	8041                	srli	s0,s0,0x10
80001420:	00533333          	sltu	t1,t1,t0
80001424:	00bfb5b3          	sltu	a1,t6,a1
80001428:	97a2                	add	a5,a5,s0
8000142a:	00b365b3          	or	a1,t1,a1
8000142e:	97ae                	add	a5,a5,a1
80001430:	97f2                	add	a5,a5,t3
80001432:	017fd713          	srli	a4,t6,0x17
80001436:	07a6                	slli	a5,a5,0x9
80001438:	8fd9                	or	a5,a5,a4
8000143a:	009e9713          	slli	a4,t4,0x9
8000143e:	01176733          	or	a4,a4,a7
80001442:	00e03733          	snez	a4,a4
80001446:	017ede93          	srli	t4,t4,0x17
8000144a:	009f9693          	slli	a3,t6,0x9
8000144e:	01d76733          	or	a4,a4,t4
80001452:	8f55                	or	a4,a4,a3
80001454:	00779693          	slli	a3,a5,0x7
80001458:	0a06de63          	bgez	a3,80001514 <__muldf3+0x3b6>
8000145c:	00175693          	srli	a3,a4,0x1
80001460:	8b05                	andi	a4,a4,1
80001462:	8f55                	or	a4,a4,a3
80001464:	01f79693          	slli	a3,a5,0x1f
80001468:	8f55                	or	a4,a4,a3
8000146a:	8385                	srli	a5,a5,0x1
8000146c:	3ff80593          	addi	a1,a6,1023
80001470:	0ab05463          	blez	a1,80001518 <__muldf3+0x3ba>
80001474:	00777693          	andi	a3,a4,7
80001478:	ce81                	beqz	a3,80001490 <__muldf3+0x332>
8000147a:	00f77693          	andi	a3,a4,15
8000147e:	4511                	li	a0,4
80001480:	00a68863          	beq	a3,a0,80001490 <__muldf3+0x332>
80001484:	00470693          	addi	a3,a4,4
80001488:	00e6b733          	sltu	a4,a3,a4
8000148c:	97ba                	add	a5,a5,a4
8000148e:	8736                	mv	a4,a3
80001490:	00779693          	slli	a3,a5,0x7
80001494:	0006d863          	bgez	a3,800014a4 <__muldf3+0x346>
80001498:	ff0006b7          	lui	a3,0xff000
8000149c:	16fd                	addi	a3,a3,-1
8000149e:	8ff5                	and	a5,a5,a3
800014a0:	40080593          	addi	a1,a6,1024
800014a4:	7fe00693          	li	a3,2046
800014a8:	10b6c263          	blt	a3,a1,800015ac <__muldf3+0x44e>
800014ac:	00375693          	srli	a3,a4,0x3
800014b0:	01d79713          	slli	a4,a5,0x1d
800014b4:	8f55                	or	a4,a4,a3
800014b6:	838d                	srli	a5,a5,0x3
800014b8:	001006b7          	lui	a3,0x100
800014bc:	16fd                	addi	a3,a3,-1
800014be:	8ff5                	and	a5,a5,a3
800014c0:	7ff5f693          	andi	a3,a1,2047
800014c4:	801005b7          	lui	a1,0x80100
800014c8:	15fd                	addi	a1,a1,-1
800014ca:	06d2                	slli	a3,a3,0x14
800014cc:	8fed                	and	a5,a5,a1
800014ce:	50b2                	lw	ra,44(sp)
800014d0:	5422                	lw	s0,40(sp)
800014d2:	067e                	slli	a2,a2,0x1f
800014d4:	8fd5                	or	a5,a5,a3
800014d6:	00c7e6b3          	or	a3,a5,a2
800014da:	5492                	lw	s1,36(sp)
800014dc:	5902                	lw	s2,32(sp)
800014de:	49f2                	lw	s3,28(sp)
800014e0:	4a62                	lw	s4,24(sp)
800014e2:	4ad2                	lw	s5,20(sp)
800014e4:	4b42                	lw	s6,16(sp)
800014e6:	4bb2                	lw	s7,12(sp)
800014e8:	853a                	mv	a0,a4
800014ea:	85b6                	mv	a1,a3
800014ec:	6145                	addi	sp,sp,48
800014ee:	8082                	ret
800014f0:	864e                	mv	a2,s3
800014f2:	87a2                	mv	a5,s0
800014f4:	8726                	mv	a4,s1
800014f6:	86da                	mv	a3,s6
800014f8:	4589                	li	a1,2
800014fa:	0ab68963          	beq	a3,a1,800015ac <__muldf3+0x44e>
800014fe:	458d                	li	a1,3
80001500:	08b68f63          	beq	a3,a1,8000159e <__muldf3+0x440>
80001504:	4585                	li	a1,1
80001506:	f6b693e3          	bne	a3,a1,8000146c <__muldf3+0x30e>
8000150a:	4781                	li	a5,0
8000150c:	4701                	li	a4,0
8000150e:	a09d                	j	80001574 <__muldf3+0x416>
80001510:	8652                	mv	a2,s4
80001512:	b7dd                	j	800014f8 <__muldf3+0x39a>
80001514:	882a                	mv	a6,a0
80001516:	bf99                	j	8000146c <__muldf3+0x30e>
80001518:	4505                	li	a0,1
8000151a:	8d0d                	sub	a0,a0,a1
8000151c:	03800693          	li	a3,56
80001520:	fea6c5e3          	blt	a3,a0,8000150a <__muldf3+0x3ac>
80001524:	46fd                	li	a3,31
80001526:	04a6c963          	blt	a3,a0,80001578 <__muldf3+0x41a>
8000152a:	41e80813          	addi	a6,a6,1054
8000152e:	010796b3          	sll	a3,a5,a6
80001532:	00a755b3          	srl	a1,a4,a0
80001536:	01071733          	sll	a4,a4,a6
8000153a:	8ecd                	or	a3,a3,a1
8000153c:	00e03733          	snez	a4,a4
80001540:	8f55                	or	a4,a4,a3
80001542:	00a7d7b3          	srl	a5,a5,a0
80001546:	00777693          	andi	a3,a4,7
8000154a:	ce81                	beqz	a3,80001562 <__muldf3+0x404>
8000154c:	00f77693          	andi	a3,a4,15
80001550:	4591                	li	a1,4
80001552:	00b68863          	beq	a3,a1,80001562 <__muldf3+0x404>
80001556:	00470693          	addi	a3,a4,4
8000155a:	00e6b733          	sltu	a4,a3,a4
8000155e:	97ba                	add	a5,a5,a4
80001560:	8736                	mv	a4,a3
80001562:	00879693          	slli	a3,a5,0x8
80001566:	0406c863          	bltz	a3,800015b6 <__muldf3+0x458>
8000156a:	01d79693          	slli	a3,a5,0x1d
8000156e:	830d                	srli	a4,a4,0x3
80001570:	8f55                	or	a4,a4,a3
80001572:	838d                	srli	a5,a5,0x3
80001574:	4581                	li	a1,0
80001576:	b789                	j	800014b8 <__muldf3+0x35a>
80001578:	5685                	li	a3,-31
8000157a:	8e8d                	sub	a3,a3,a1
8000157c:	02000893          	li	a7,32
80001580:	00d7d6b3          	srl	a3,a5,a3
80001584:	4581                	li	a1,0
80001586:	01150663          	beq	a0,a7,80001592 <__muldf3+0x434>
8000158a:	43e80813          	addi	a6,a6,1086
8000158e:	010795b3          	sll	a1,a5,a6
80001592:	8f4d                	or	a4,a4,a1
80001594:	00e03733          	snez	a4,a4
80001598:	8f55                	or	a4,a4,a3
8000159a:	4781                	li	a5,0
8000159c:	b76d                	j	80001546 <__muldf3+0x3e8>
8000159e:	000807b7          	lui	a5,0x80
800015a2:	4701                	li	a4,0
800015a4:	7ff00593          	li	a1,2047
800015a8:	4601                	li	a2,0
800015aa:	b739                	j	800014b8 <__muldf3+0x35a>
800015ac:	4781                	li	a5,0
800015ae:	4701                	li	a4,0
800015b0:	7ff00593          	li	a1,2047
800015b4:	b711                	j	800014b8 <__muldf3+0x35a>
800015b6:	4781                	li	a5,0
800015b8:	4701                	li	a4,0
800015ba:	4585                	li	a1,1
800015bc:	bdf5                	j	800014b8 <__muldf3+0x35a>

800015be <__divsf3>:
800015be:	1101                	addi	sp,sp,-32
800015c0:	ca26                	sw	s1,20(sp)
800015c2:	c64e                	sw	s3,12(sp)
800015c4:	01755493          	srli	s1,a0,0x17
800015c8:	008009b7          	lui	s3,0x800
800015cc:	c84a                	sw	s2,16(sp)
800015ce:	c452                	sw	s4,8(sp)
800015d0:	19fd                	addi	s3,s3,-1
800015d2:	ce06                	sw	ra,28(sp)
800015d4:	cc22                	sw	s0,24(sp)
800015d6:	c256                	sw	s5,4(sp)
800015d8:	0ff4f493          	andi	s1,s1,255
800015dc:	8a2e                	mv	s4,a1
800015de:	00a9f9b3          	and	s3,s3,a0
800015e2:	01f55913          	srli	s2,a0,0x1f
800015e6:	c8a5                	beqz	s1,80001656 <__divsf3+0x98>
800015e8:	0ff00793          	li	a5,255
800015ec:	08f48263          	beq	s1,a5,80001670 <__divsf3+0xb2>
800015f0:	098e                	slli	s3,s3,0x3
800015f2:	040007b7          	lui	a5,0x4000
800015f6:	00f9e9b3          	or	s3,s3,a5
800015fa:	f8148493          	addi	s1,s1,-127 # fff81 <_stack_size+0xffb81>
800015fe:	4a81                	li	s5,0
80001600:	017a5513          	srli	a0,s4,0x17
80001604:	00800437          	lui	s0,0x800
80001608:	147d                	addi	s0,s0,-1
8000160a:	0ff57513          	andi	a0,a0,255
8000160e:	01447433          	and	s0,s0,s4
80001612:	01fa5a13          	srli	s4,s4,0x1f
80001616:	c53d                	beqz	a0,80001684 <__divsf3+0xc6>
80001618:	0ff00793          	li	a5,255
8000161c:	08f50163          	beq	a0,a5,8000169e <__divsf3+0xe0>
80001620:	040e                	slli	s0,s0,0x3
80001622:	040007b7          	lui	a5,0x4000
80001626:	8c5d                	or	s0,s0,a5
80001628:	f8150513          	addi	a0,a0,-127
8000162c:	4781                	li	a5,0
8000162e:	002a9693          	slli	a3,s5,0x2
80001632:	8edd                	or	a3,a3,a5
80001634:	16fd                	addi	a3,a3,-1
80001636:	4739                	li	a4,14
80001638:	01494633          	xor	a2,s2,s4
8000163c:	40a48533          	sub	a0,s1,a0
80001640:	06d76863          	bltu	a4,a3,800016b0 <__divsf3+0xf2>
80001644:	00001597          	auipc	a1,0x1
80001648:	12458593          	addi	a1,a1,292 # 80002768 <end+0x65a>
8000164c:	068a                	slli	a3,a3,0x2
8000164e:	96ae                	add	a3,a3,a1
80001650:	4298                	lw	a4,0(a3)
80001652:	972e                	add	a4,a4,a1
80001654:	8702                	jr	a4
80001656:	02098463          	beqz	s3,8000167e <__divsf3+0xc0>
8000165a:	854e                	mv	a0,s3
8000165c:	277000ef          	jal	ra,800020d2 <__clzsi2>
80001660:	ffb50793          	addi	a5,a0,-5
80001664:	f8a00493          	li	s1,-118
80001668:	00f999b3          	sll	s3,s3,a5
8000166c:	8c89                	sub	s1,s1,a0
8000166e:	bf41                	j	800015fe <__divsf3+0x40>
80001670:	0ff00493          	li	s1,255
80001674:	4a89                	li	s5,2
80001676:	f80985e3          	beqz	s3,80001600 <__divsf3+0x42>
8000167a:	4a8d                	li	s5,3
8000167c:	b751                	j	80001600 <__divsf3+0x42>
8000167e:	4481                	li	s1,0
80001680:	4a85                	li	s5,1
80001682:	bfbd                	j	80001600 <__divsf3+0x42>
80001684:	c01d                	beqz	s0,800016aa <__divsf3+0xec>
80001686:	8522                	mv	a0,s0
80001688:	24b000ef          	jal	ra,800020d2 <__clzsi2>
8000168c:	ffb50793          	addi	a5,a0,-5
80001690:	00f41433          	sll	s0,s0,a5
80001694:	f8a00793          	li	a5,-118
80001698:	40a78533          	sub	a0,a5,a0
8000169c:	bf41                	j	8000162c <__divsf3+0x6e>
8000169e:	0ff00513          	li	a0,255
800016a2:	4789                	li	a5,2
800016a4:	d449                	beqz	s0,8000162e <__divsf3+0x70>
800016a6:	478d                	li	a5,3
800016a8:	b759                	j	8000162e <__divsf3+0x70>
800016aa:	4501                	li	a0,0
800016ac:	4785                	li	a5,1
800016ae:	b741                	j	8000162e <__divsf3+0x70>
800016b0:	00541813          	slli	a6,s0,0x5
800016b4:	0a89fe63          	bleu	s0,s3,80001770 <__divsf3+0x1b2>
800016b8:	157d                	addi	a0,a0,-1
800016ba:	4681                	li	a3,0
800016bc:	01085413          	srli	s0,a6,0x10
800016c0:	0289d333          	divu	t1,s3,s0
800016c4:	67c1                	lui	a5,0x10
800016c6:	17fd                	addi	a5,a5,-1
800016c8:	00f877b3          	and	a5,a6,a5
800016cc:	82c1                	srli	a3,a3,0x10
800016ce:	0289f733          	remu	a4,s3,s0
800016d2:	859a                	mv	a1,t1
800016d4:	026788b3          	mul	a7,a5,t1
800016d8:	0742                	slli	a4,a4,0x10
800016da:	8f55                	or	a4,a4,a3
800016dc:	01177c63          	bleu	a7,a4,800016f4 <__divsf3+0x136>
800016e0:	9742                	add	a4,a4,a6
800016e2:	fff30593          	addi	a1,t1,-1
800016e6:	01076763          	bltu	a4,a6,800016f4 <__divsf3+0x136>
800016ea:	01177563          	bleu	a7,a4,800016f4 <__divsf3+0x136>
800016ee:	ffe30593          	addi	a1,t1,-2
800016f2:	9742                	add	a4,a4,a6
800016f4:	41170733          	sub	a4,a4,a7
800016f8:	028758b3          	divu	a7,a4,s0
800016fc:	02877733          	remu	a4,a4,s0
80001700:	031786b3          	mul	a3,a5,a7
80001704:	01071793          	slli	a5,a4,0x10
80001708:	8746                	mv	a4,a7
8000170a:	00d7fc63          	bleu	a3,a5,80001722 <__divsf3+0x164>
8000170e:	97c2                	add	a5,a5,a6
80001710:	fff88713          	addi	a4,a7,-1
80001714:	0107e763          	bltu	a5,a6,80001722 <__divsf3+0x164>
80001718:	00d7f563          	bleu	a3,a5,80001722 <__divsf3+0x164>
8000171c:	ffe88713          	addi	a4,a7,-2
80001720:	97c2                	add	a5,a5,a6
80001722:	01059413          	slli	s0,a1,0x10
80001726:	8f95                	sub	a5,a5,a3
80001728:	8c59                	or	s0,s0,a4
8000172a:	00f037b3          	snez	a5,a5
8000172e:	8c5d                	or	s0,s0,a5
80001730:	07f50713          	addi	a4,a0,127
80001734:	06e05963          	blez	a4,800017a6 <__divsf3+0x1e8>
80001738:	00747793          	andi	a5,s0,7
8000173c:	c799                	beqz	a5,8000174a <__divsf3+0x18c>
8000173e:	00f47793          	andi	a5,s0,15
80001742:	4691                	li	a3,4
80001744:	00d78363          	beq	a5,a3,8000174a <__divsf3+0x18c>
80001748:	0411                	addi	s0,s0,4
8000174a:	00441793          	slli	a5,s0,0x4
8000174e:	0007d863          	bgez	a5,8000175e <__divsf3+0x1a0>
80001752:	f80007b7          	lui	a5,0xf8000
80001756:	17fd                	addi	a5,a5,-1
80001758:	8c7d                	and	s0,s0,a5
8000175a:	08050713          	addi	a4,a0,128
8000175e:	0fe00793          	li	a5,254
80001762:	800d                	srli	s0,s0,0x3
80001764:	08e7d563          	ble	a4,a5,800017ee <__divsf3+0x230>
80001768:	4401                	li	s0,0
8000176a:	0ff00713          	li	a4,255
8000176e:	a041                	j	800017ee <__divsf3+0x230>
80001770:	01f99693          	slli	a3,s3,0x1f
80001774:	0019d993          	srli	s3,s3,0x1
80001778:	b791                	j	800016bc <__divsf3+0xfe>
8000177a:	864a                	mv	a2,s2
8000177c:	844e                	mv	s0,s3
8000177e:	87d6                	mv	a5,s5
80001780:	4709                	li	a4,2
80001782:	fee783e3          	beq	a5,a4,80001768 <__divsf3+0x1aa>
80001786:	470d                	li	a4,3
80001788:	04e78e63          	beq	a5,a4,800017e4 <__divsf3+0x226>
8000178c:	4705                	li	a4,1
8000178e:	fae791e3          	bne	a5,a4,80001730 <__divsf3+0x172>
80001792:	4401                	li	s0,0
80001794:	4701                	li	a4,0
80001796:	a8a1                	j	800017ee <__divsf3+0x230>
80001798:	8652                	mv	a2,s4
8000179a:	b7dd                	j	80001780 <__divsf3+0x1c2>
8000179c:	00400437          	lui	s0,0x400
800017a0:	4601                	li	a2,0
800017a2:	478d                	li	a5,3
800017a4:	bff1                	j	80001780 <__divsf3+0x1c2>
800017a6:	4785                	li	a5,1
800017a8:	8f99                	sub	a5,a5,a4
800017aa:	476d                	li	a4,27
800017ac:	fef743e3          	blt	a4,a5,80001792 <__divsf3+0x1d4>
800017b0:	09e50513          	addi	a0,a0,158
800017b4:	00f457b3          	srl	a5,s0,a5
800017b8:	00a41433          	sll	s0,s0,a0
800017bc:	00803433          	snez	s0,s0
800017c0:	8c5d                	or	s0,s0,a5
800017c2:	00747793          	andi	a5,s0,7
800017c6:	c799                	beqz	a5,800017d4 <__divsf3+0x216>
800017c8:	00f47793          	andi	a5,s0,15
800017cc:	4711                	li	a4,4
800017ce:	00e78363          	beq	a5,a4,800017d4 <__divsf3+0x216>
800017d2:	0411                	addi	s0,s0,4
800017d4:	00541793          	slli	a5,s0,0x5
800017d8:	800d                	srli	s0,s0,0x3
800017da:	fa07dde3          	bgez	a5,80001794 <__divsf3+0x1d6>
800017de:	4401                	li	s0,0
800017e0:	4705                	li	a4,1
800017e2:	a031                	j	800017ee <__divsf3+0x230>
800017e4:	00400437          	lui	s0,0x400
800017e8:	0ff00713          	li	a4,255
800017ec:	4601                	li	a2,0
800017ee:	00800537          	lui	a0,0x800
800017f2:	157d                	addi	a0,a0,-1
800017f4:	8c69                	and	s0,s0,a0
800017f6:	80800537          	lui	a0,0x80800
800017fa:	157d                	addi	a0,a0,-1
800017fc:	0ff77713          	andi	a4,a4,255
80001800:	8c69                	and	s0,s0,a0
80001802:	075e                	slli	a4,a4,0x17
80001804:	8c59                	or	s0,s0,a4
80001806:	01f61513          	slli	a0,a2,0x1f
8000180a:	8d41                	or	a0,a0,s0
8000180c:	40f2                	lw	ra,28(sp)
8000180e:	4462                	lw	s0,24(sp)
80001810:	44d2                	lw	s1,20(sp)
80001812:	4942                	lw	s2,16(sp)
80001814:	49b2                	lw	s3,12(sp)
80001816:	4a22                	lw	s4,8(sp)
80001818:	4a92                	lw	s5,4(sp)
8000181a:	6105                	addi	sp,sp,32
8000181c:	8082                	ret

8000181e <__mulsf3>:
8000181e:	1101                	addi	sp,sp,-32
80001820:	ca26                	sw	s1,20(sp)
80001822:	c84a                	sw	s2,16(sp)
80001824:	008004b7          	lui	s1,0x800
80001828:	01755913          	srli	s2,a0,0x17
8000182c:	c64e                	sw	s3,12(sp)
8000182e:	c256                	sw	s5,4(sp)
80001830:	14fd                	addi	s1,s1,-1
80001832:	ce06                	sw	ra,28(sp)
80001834:	cc22                	sw	s0,24(sp)
80001836:	c452                	sw	s4,8(sp)
80001838:	0ff97913          	andi	s2,s2,255
8000183c:	8aae                	mv	s5,a1
8000183e:	8ce9                	and	s1,s1,a0
80001840:	01f55993          	srli	s3,a0,0x1f
80001844:	06090963          	beqz	s2,800018b6 <__mulsf3+0x98>
80001848:	0ff00793          	li	a5,255
8000184c:	08f90263          	beq	s2,a5,800018d0 <__mulsf3+0xb2>
80001850:	048e                	slli	s1,s1,0x3
80001852:	040007b7          	lui	a5,0x4000
80001856:	8cdd                	or	s1,s1,a5
80001858:	f8190913          	addi	s2,s2,-127 # fff81 <_stack_size+0xffb81>
8000185c:	4a01                	li	s4,0
8000185e:	017ad513          	srli	a0,s5,0x17
80001862:	00800437          	lui	s0,0x800
80001866:	147d                	addi	s0,s0,-1
80001868:	0ff57513          	andi	a0,a0,255
8000186c:	01547433          	and	s0,s0,s5
80001870:	01fada93          	srli	s5,s5,0x1f
80001874:	c53d                	beqz	a0,800018e2 <__mulsf3+0xc4>
80001876:	0ff00793          	li	a5,255
8000187a:	08f50163          	beq	a0,a5,800018fc <__mulsf3+0xde>
8000187e:	040e                	slli	s0,s0,0x3
80001880:	040007b7          	lui	a5,0x4000
80001884:	8c5d                	or	s0,s0,a5
80001886:	f8150513          	addi	a0,a0,-127 # 807fff81 <_stack_start+0x7fa671>
8000188a:	4681                	li	a3,0
8000188c:	002a1793          	slli	a5,s4,0x2
80001890:	8fd5                	or	a5,a5,a3
80001892:	954a                	add	a0,a0,s2
80001894:	17fd                	addi	a5,a5,-1
80001896:	4739                	li	a4,14
80001898:	0159c633          	xor	a2,s3,s5
8000189c:	00150813          	addi	a6,a0,1
800018a0:	06f76763          	bltu	a4,a5,8000190e <__mulsf3+0xf0>
800018a4:	00001717          	auipc	a4,0x1
800018a8:	f0070713          	addi	a4,a4,-256 # 800027a4 <end+0x696>
800018ac:	078a                	slli	a5,a5,0x2
800018ae:	97ba                	add	a5,a5,a4
800018b0:	439c                	lw	a5,0(a5)
800018b2:	97ba                	add	a5,a5,a4
800018b4:	8782                	jr	a5
800018b6:	c09d                	beqz	s1,800018dc <__mulsf3+0xbe>
800018b8:	8526                	mv	a0,s1
800018ba:	019000ef          	jal	ra,800020d2 <__clzsi2>
800018be:	ffb50793          	addi	a5,a0,-5
800018c2:	f8a00913          	li	s2,-118
800018c6:	00f494b3          	sll	s1,s1,a5
800018ca:	40a90933          	sub	s2,s2,a0
800018ce:	b779                	j	8000185c <__mulsf3+0x3e>
800018d0:	0ff00913          	li	s2,255
800018d4:	4a09                	li	s4,2
800018d6:	d4c1                	beqz	s1,8000185e <__mulsf3+0x40>
800018d8:	4a0d                	li	s4,3
800018da:	b751                	j	8000185e <__mulsf3+0x40>
800018dc:	4901                	li	s2,0
800018de:	4a05                	li	s4,1
800018e0:	bfbd                	j	8000185e <__mulsf3+0x40>
800018e2:	c01d                	beqz	s0,80001908 <__mulsf3+0xea>
800018e4:	8522                	mv	a0,s0
800018e6:	7ec000ef          	jal	ra,800020d2 <__clzsi2>
800018ea:	ffb50793          	addi	a5,a0,-5
800018ee:	00f41433          	sll	s0,s0,a5
800018f2:	f8a00793          	li	a5,-118
800018f6:	40a78533          	sub	a0,a5,a0
800018fa:	bf41                	j	8000188a <__mulsf3+0x6c>
800018fc:	0ff00513          	li	a0,255
80001900:	4689                	li	a3,2
80001902:	d449                	beqz	s0,8000188c <__mulsf3+0x6e>
80001904:	468d                	li	a3,3
80001906:	b759                	j	8000188c <__mulsf3+0x6e>
80001908:	4501                	li	a0,0
8000190a:	4685                	li	a3,1
8000190c:	b741                	j	8000188c <__mulsf3+0x6e>
8000190e:	67c1                	lui	a5,0x10
80001910:	fff78313          	addi	t1,a5,-1 # ffff <_stack_size+0xfbff>
80001914:	0104d713          	srli	a4,s1,0x10
80001918:	01045693          	srli	a3,s0,0x10
8000191c:	0064f4b3          	and	s1,s1,t1
80001920:	00647433          	and	s0,s0,t1
80001924:	028488b3          	mul	a7,s1,s0
80001928:	028705b3          	mul	a1,a4,s0
8000192c:	02d70433          	mul	s0,a4,a3
80001930:	029686b3          	mul	a3,a3,s1
80001934:	0108d493          	srli	s1,a7,0x10
80001938:	96ae                	add	a3,a3,a1
8000193a:	94b6                	add	s1,s1,a3
8000193c:	00b4f363          	bleu	a1,s1,80001942 <__mulsf3+0x124>
80001940:	943e                	add	s0,s0,a5
80001942:	0064f7b3          	and	a5,s1,t1
80001946:	07c2                	slli	a5,a5,0x10
80001948:	0068f8b3          	and	a7,a7,t1
8000194c:	97c6                	add	a5,a5,a7
8000194e:	00679713          	slli	a4,a5,0x6
80001952:	80c1                	srli	s1,s1,0x10
80001954:	00e03733          	snez	a4,a4
80001958:	83e9                	srli	a5,a5,0x1a
8000195a:	9426                	add	s0,s0,s1
8000195c:	8fd9                	or	a5,a5,a4
8000195e:	041a                	slli	s0,s0,0x6
80001960:	8c5d                	or	s0,s0,a5
80001962:	00441793          	slli	a5,s0,0x4
80001966:	0807dc63          	bgez	a5,800019fe <__mulsf3+0x1e0>
8000196a:	00145793          	srli	a5,s0,0x1
8000196e:	8805                	andi	s0,s0,1
80001970:	8c5d                	or	s0,s0,a5
80001972:	07f80713          	addi	a4,a6,127
80001976:	08e05663          	blez	a4,80001a02 <__mulsf3+0x1e4>
8000197a:	00747793          	andi	a5,s0,7
8000197e:	c799                	beqz	a5,8000198c <__mulsf3+0x16e>
80001980:	00f47793          	andi	a5,s0,15
80001984:	4691                	li	a3,4
80001986:	00d78363          	beq	a5,a3,8000198c <__mulsf3+0x16e>
8000198a:	0411                	addi	s0,s0,4
8000198c:	00441793          	slli	a5,s0,0x4
80001990:	0007d863          	bgez	a5,800019a0 <__mulsf3+0x182>
80001994:	f80007b7          	lui	a5,0xf8000
80001998:	17fd                	addi	a5,a5,-1
8000199a:	8c7d                	and	s0,s0,a5
8000199c:	08080713          	addi	a4,a6,128
800019a0:	0fe00793          	li	a5,254
800019a4:	0ae7c463          	blt	a5,a4,80001a4c <__mulsf3+0x22e>
800019a8:	00345793          	srli	a5,s0,0x3
800019ac:	a839                	j	800019ca <__mulsf3+0x1ac>
800019ae:	864e                	mv	a2,s3
800019b0:	8426                	mv	s0,s1
800019b2:	86d2                	mv	a3,s4
800019b4:	4789                	li	a5,2
800019b6:	08f68b63          	beq	a3,a5,80001a4c <__mulsf3+0x22e>
800019ba:	478d                	li	a5,3
800019bc:	08f68263          	beq	a3,a5,80001a40 <__mulsf3+0x222>
800019c0:	4585                	li	a1,1
800019c2:	4781                	li	a5,0
800019c4:	4701                	li	a4,0
800019c6:	fab696e3          	bne	a3,a1,80001972 <__mulsf3+0x154>
800019ca:	00800437          	lui	s0,0x800
800019ce:	147d                	addi	s0,s0,-1
800019d0:	80800537          	lui	a0,0x80800
800019d4:	8fe1                	and	a5,a5,s0
800019d6:	157d                	addi	a0,a0,-1
800019d8:	40f2                	lw	ra,28(sp)
800019da:	4462                	lw	s0,24(sp)
800019dc:	0ff77713          	andi	a4,a4,255
800019e0:	8fe9                	and	a5,a5,a0
800019e2:	075e                	slli	a4,a4,0x17
800019e4:	01f61513          	slli	a0,a2,0x1f
800019e8:	8fd9                	or	a5,a5,a4
800019ea:	44d2                	lw	s1,20(sp)
800019ec:	4942                	lw	s2,16(sp)
800019ee:	49b2                	lw	s3,12(sp)
800019f0:	4a22                	lw	s4,8(sp)
800019f2:	4a92                	lw	s5,4(sp)
800019f4:	8d5d                	or	a0,a0,a5
800019f6:	6105                	addi	sp,sp,32
800019f8:	8082                	ret
800019fa:	8656                	mv	a2,s5
800019fc:	bf65                	j	800019b4 <__mulsf3+0x196>
800019fe:	882a                	mv	a6,a0
80001a00:	bf8d                	j	80001972 <__mulsf3+0x154>
80001a02:	4785                	li	a5,1
80001a04:	8f99                	sub	a5,a5,a4
80001a06:	476d                	li	a4,27
80001a08:	04f74663          	blt	a4,a5,80001a54 <__mulsf3+0x236>
80001a0c:	09e80813          	addi	a6,a6,158
80001a10:	00f457b3          	srl	a5,s0,a5
80001a14:	01041433          	sll	s0,s0,a6
80001a18:	00803433          	snez	s0,s0
80001a1c:	8c5d                	or	s0,s0,a5
80001a1e:	00747793          	andi	a5,s0,7
80001a22:	c799                	beqz	a5,80001a30 <__mulsf3+0x212>
80001a24:	00f47793          	andi	a5,s0,15
80001a28:	4711                	li	a4,4
80001a2a:	00e78363          	beq	a5,a4,80001a30 <__mulsf3+0x212>
80001a2e:	0411                	addi	s0,s0,4
80001a30:	00541793          	slli	a5,s0,0x5
80001a34:	0207c263          	bltz	a5,80001a58 <__mulsf3+0x23a>
80001a38:	00345793          	srli	a5,s0,0x3
80001a3c:	4701                	li	a4,0
80001a3e:	b771                	j	800019ca <__mulsf3+0x1ac>
80001a40:	004007b7          	lui	a5,0x400
80001a44:	0ff00713          	li	a4,255
80001a48:	4601                	li	a2,0
80001a4a:	b741                	j	800019ca <__mulsf3+0x1ac>
80001a4c:	4781                	li	a5,0
80001a4e:	0ff00713          	li	a4,255
80001a52:	bfa5                	j	800019ca <__mulsf3+0x1ac>
80001a54:	4781                	li	a5,0
80001a56:	b7dd                	j	80001a3c <__mulsf3+0x21e>
80001a58:	4781                	li	a5,0
80001a5a:	4705                	li	a4,1
80001a5c:	b7bd                	j	800019ca <__mulsf3+0x1ac>

80001a5e <__subsf3>:
80001a5e:	008007b7          	lui	a5,0x800
80001a62:	17fd                	addi	a5,a5,-1
80001a64:	1141                	addi	sp,sp,-16
80001a66:	00a7f733          	and	a4,a5,a0
80001a6a:	01755693          	srli	a3,a0,0x17
80001a6e:	0175d613          	srli	a2,a1,0x17
80001a72:	8fed                	and	a5,a5,a1
80001a74:	c226                	sw	s1,4(sp)
80001a76:	c04a                	sw	s2,0(sp)
80001a78:	0ff6f693          	andi	a3,a3,255
80001a7c:	00371813          	slli	a6,a4,0x3
80001a80:	0ff67613          	andi	a2,a2,255
80001a84:	c606                	sw	ra,12(sp)
80001a86:	c422                	sw	s0,8(sp)
80001a88:	0ff00713          	li	a4,255
80001a8c:	01f55493          	srli	s1,a0,0x1f
80001a90:	8936                	mv	s2,a3
80001a92:	8532                	mv	a0,a2
80001a94:	81fd                	srli	a1,a1,0x1f
80001a96:	078e                	slli	a5,a5,0x3
80001a98:	00e61363          	bne	a2,a4,80001a9e <__subsf3+0x40>
80001a9c:	e399                	bnez	a5,80001aa2 <__subsf3+0x44>
80001a9e:	0015c593          	xori	a1,a1,1
80001aa2:	40c68733          	sub	a4,a3,a2
80001aa6:	14959763          	bne	a1,s1,80001bf4 <__subsf3+0x196>
80001aaa:	06e05e63          	blez	a4,80001b26 <__subsf3+0xc8>
80001aae:	e629                	bnez	a2,80001af8 <__subsf3+0x9a>
80001ab0:	eb81                	bnez	a5,80001ac0 <__subsf3+0x62>
80001ab2:	0ff00793          	li	a5,255
80001ab6:	02f68f63          	beq	a3,a5,80001af4 <__subsf3+0x96>
80001aba:	87c2                	mv	a5,a6
80001abc:	8536                	mv	a0,a3
80001abe:	a8f5                	j	80001bba <__subsf3+0x15c>
80001ac0:	177d                	addi	a4,a4,-1
80001ac2:	e70d                	bnez	a4,80001aec <__subsf3+0x8e>
80001ac4:	97c2                	add	a5,a5,a6
80001ac6:	8536                	mv	a0,a3
80001ac8:	00579713          	slli	a4,a5,0x5
80001acc:	0e075763          	bgez	a4,80001bba <__subsf3+0x15c>
80001ad0:	0505                	addi	a0,a0,1
80001ad2:	0ff00713          	li	a4,255
80001ad6:	26e50c63          	beq	a0,a4,80001d4e <__subsf3+0x2f0>
80001ada:	7e000737          	lui	a4,0x7e000
80001ade:	0017f693          	andi	a3,a5,1
80001ae2:	177d                	addi	a4,a4,-1
80001ae4:	8385                	srli	a5,a5,0x1
80001ae6:	8ff9                	and	a5,a5,a4
80001ae8:	8fd5                	or	a5,a5,a3
80001aea:	a8c1                	j	80001bba <__subsf3+0x15c>
80001aec:	0ff00613          	li	a2,255
80001af0:	00c69b63          	bne	a3,a2,80001b06 <__subsf3+0xa8>
80001af4:	87c2                	mv	a5,a6
80001af6:	a8a1                	j	80001b4e <__subsf3+0xf0>
80001af8:	0ff00613          	li	a2,255
80001afc:	fec68ce3          	beq	a3,a2,80001af4 <__subsf3+0x96>
80001b00:	04000637          	lui	a2,0x4000
80001b04:	8fd1                	or	a5,a5,a2
80001b06:	466d                	li	a2,27
80001b08:	00e65463          	ble	a4,a2,80001b10 <__subsf3+0xb2>
80001b0c:	4785                	li	a5,1
80001b0e:	bf5d                	j	80001ac4 <__subsf3+0x66>
80001b10:	02000613          	li	a2,32
80001b14:	8e19                	sub	a2,a2,a4
80001b16:	00e7d5b3          	srl	a1,a5,a4
80001b1a:	00c797b3          	sll	a5,a5,a2
80001b1e:	00f037b3          	snez	a5,a5
80001b22:	8fcd                	or	a5,a5,a1
80001b24:	b745                	j	80001ac4 <__subsf3+0x66>
80001b26:	c33d                	beqz	a4,80001b8c <__subsf3+0x12e>
80001b28:	e695                	bnez	a3,80001b54 <__subsf3+0xf6>
80001b2a:	00081763          	bnez	a6,80001b38 <__subsf3+0xda>
80001b2e:	0ff00713          	li	a4,255
80001b32:	08e61463          	bne	a2,a4,80001bba <__subsf3+0x15c>
80001b36:	a821                	j	80001b4e <__subsf3+0xf0>
80001b38:	56fd                	li	a3,-1
80001b3a:	00d71463          	bne	a4,a3,80001b42 <__subsf3+0xe4>
80001b3e:	97c2                	add	a5,a5,a6
80001b40:	b761                	j	80001ac8 <__subsf3+0x6a>
80001b42:	0ff00693          	li	a3,255
80001b46:	fff74713          	not	a4,a4
80001b4a:	00d61f63          	bne	a2,a3,80001b68 <__subsf3+0x10a>
80001b4e:	0ff00513          	li	a0,255
80001b52:	a0a5                	j	80001bba <__subsf3+0x15c>
80001b54:	0ff00693          	li	a3,255
80001b58:	fed60be3          	beq	a2,a3,80001b4e <__subsf3+0xf0>
80001b5c:	040006b7          	lui	a3,0x4000
80001b60:	40e00733          	neg	a4,a4
80001b64:	00d86833          	or	a6,a6,a3
80001b68:	46ed                	li	a3,27
80001b6a:	00e6d463          	ble	a4,a3,80001b72 <__subsf3+0x114>
80001b6e:	4705                	li	a4,1
80001b70:	a821                	j	80001b88 <__subsf3+0x12a>
80001b72:	02000693          	li	a3,32
80001b76:	00e85633          	srl	a2,a6,a4
80001b7a:	40e68733          	sub	a4,a3,a4
80001b7e:	00e81733          	sll	a4,a6,a4
80001b82:	00e03733          	snez	a4,a4
80001b86:	8f51                	or	a4,a4,a2
80001b88:	97ba                	add	a5,a5,a4
80001b8a:	bf3d                	j	80001ac8 <__subsf3+0x6a>
80001b8c:	00168513          	addi	a0,a3,1 # 4000001 <_stack_size+0x3fffc01>
80001b90:	0ff57613          	andi	a2,a0,255
80001b94:	4705                	li	a4,1
80001b96:	04c74663          	blt	a4,a2,80001be2 <__subsf3+0x184>
80001b9a:	ea9d                	bnez	a3,80001bd0 <__subsf3+0x172>
80001b9c:	4501                	li	a0,0
80001b9e:	00080e63          	beqz	a6,80001bba <__subsf3+0x15c>
80001ba2:	1a078463          	beqz	a5,80001d4a <__subsf3+0x2ec>
80001ba6:	97c2                	add	a5,a5,a6
80001ba8:	00579713          	slli	a4,a5,0x5
80001bac:	00075763          	bgez	a4,80001bba <__subsf3+0x15c>
80001bb0:	fc000737          	lui	a4,0xfc000
80001bb4:	177d                	addi	a4,a4,-1
80001bb6:	8ff9                	and	a5,a5,a4
80001bb8:	4505                	li	a0,1
80001bba:	0077f713          	andi	a4,a5,7
80001bbe:	18070963          	beqz	a4,80001d50 <__subsf3+0x2f2>
80001bc2:	00f7f713          	andi	a4,a5,15
80001bc6:	4691                	li	a3,4
80001bc8:	18d70463          	beq	a4,a3,80001d50 <__subsf3+0x2f2>
80001bcc:	0791                	addi	a5,a5,4
80001bce:	a249                	j	80001d50 <__subsf3+0x2f2>
80001bd0:	f6080fe3          	beqz	a6,80001b4e <__subsf3+0xf0>
80001bd4:	d385                	beqz	a5,80001af4 <__subsf3+0x96>
80001bd6:	020007b7          	lui	a5,0x2000
80001bda:	0ff00513          	li	a0,255
80001bde:	4481                	li	s1,0
80001be0:	aa85                	j	80001d50 <__subsf3+0x2f2>
80001be2:	0ff00713          	li	a4,255
80001be6:	16e50463          	beq	a0,a4,80001d4e <__subsf3+0x2f0>
80001bea:	00f80733          	add	a4,a6,a5
80001bee:	00175793          	srli	a5,a4,0x1
80001bf2:	b7e1                	j	80001bba <__subsf3+0x15c>
80001bf4:	06e05163          	blez	a4,80001c56 <__subsf3+0x1f8>
80001bf8:	ea1d                	bnez	a2,80001c2e <__subsf3+0x1d0>
80001bfa:	ea078ce3          	beqz	a5,80001ab2 <__subsf3+0x54>
80001bfe:	177d                	addi	a4,a4,-1
80001c00:	ef11                	bnez	a4,80001c1c <__subsf3+0x1be>
80001c02:	40f807b3          	sub	a5,a6,a5
80001c06:	8536                	mv	a0,a3
80001c08:	00579713          	slli	a4,a5,0x5
80001c0c:	fa0757e3          	bgez	a4,80001bba <__subsf3+0x15c>
80001c10:	04000437          	lui	s0,0x4000
80001c14:	147d                	addi	s0,s0,-1
80001c16:	8c7d                	and	s0,s0,a5
80001c18:	892a                	mv	s2,a0
80001c1a:	a8c5                	j	80001d0a <__subsf3+0x2ac>
80001c1c:	0ff00613          	li	a2,255
80001c20:	ecc68ae3          	beq	a3,a2,80001af4 <__subsf3+0x96>
80001c24:	466d                	li	a2,27
80001c26:	00e65c63          	ble	a4,a2,80001c3e <__subsf3+0x1e0>
80001c2a:	4785                	li	a5,1
80001c2c:	bfd9                	j	80001c02 <__subsf3+0x1a4>
80001c2e:	0ff00613          	li	a2,255
80001c32:	ecc681e3          	beq	a3,a2,80001af4 <__subsf3+0x96>
80001c36:	04000637          	lui	a2,0x4000
80001c3a:	8fd1                	or	a5,a5,a2
80001c3c:	b7e5                	j	80001c24 <__subsf3+0x1c6>
80001c3e:	02000613          	li	a2,32
80001c42:	00e7d5b3          	srl	a1,a5,a4
80001c46:	40e60733          	sub	a4,a2,a4
80001c4a:	00e797b3          	sll	a5,a5,a4
80001c4e:	00f037b3          	snez	a5,a5
80001c52:	8fcd                	or	a5,a5,a1
80001c54:	b77d                	j	80001c02 <__subsf3+0x1a4>
80001c56:	c33d                	beqz	a4,80001cbc <__subsf3+0x25e>
80001c58:	e695                	bnez	a3,80001c84 <__subsf3+0x226>
80001c5a:	00081663          	bnez	a6,80001c66 <__subsf3+0x208>
80001c5e:	0ff00713          	li	a4,255
80001c62:	84ae                	mv	s1,a1
80001c64:	b5f9                	j	80001b32 <__subsf3+0xd4>
80001c66:	56fd                	li	a3,-1
80001c68:	00d71663          	bne	a4,a3,80001c74 <__subsf3+0x216>
80001c6c:	410787b3          	sub	a5,a5,a6
80001c70:	84ae                	mv	s1,a1
80001c72:	bf59                	j	80001c08 <__subsf3+0x1aa>
80001c74:	0ff00693          	li	a3,255
80001c78:	fff74713          	not	a4,a4
80001c7c:	00d61e63          	bne	a2,a3,80001c98 <__subsf3+0x23a>
80001c80:	84ae                	mv	s1,a1
80001c82:	b5f1                	j	80001b4e <__subsf3+0xf0>
80001c84:	0ff00693          	li	a3,255
80001c88:	fed60ce3          	beq	a2,a3,80001c80 <__subsf3+0x222>
80001c8c:	040006b7          	lui	a3,0x4000
80001c90:	40e00733          	neg	a4,a4
80001c94:	00d86833          	or	a6,a6,a3
80001c98:	46ed                	li	a3,27
80001c9a:	00e6d463          	ble	a4,a3,80001ca2 <__subsf3+0x244>
80001c9e:	4705                	li	a4,1
80001ca0:	a821                	j	80001cb8 <__subsf3+0x25a>
80001ca2:	02000693          	li	a3,32
80001ca6:	00e85633          	srl	a2,a6,a4
80001caa:	40e68733          	sub	a4,a3,a4
80001cae:	00e81733          	sll	a4,a6,a4
80001cb2:	00e03733          	snez	a4,a4
80001cb6:	8f51                	or	a4,a4,a2
80001cb8:	8f99                	sub	a5,a5,a4
80001cba:	bf5d                	j	80001c70 <__subsf3+0x212>
80001cbc:	00168713          	addi	a4,a3,1 # 4000001 <_stack_size+0x3fffc01>
80001cc0:	0ff77713          	andi	a4,a4,255
80001cc4:	4605                	li	a2,1
80001cc6:	02e64963          	blt	a2,a4,80001cf8 <__subsf3+0x29a>
80001cca:	e29d                	bnez	a3,80001cf0 <__subsf3+0x292>
80001ccc:	00081563          	bnez	a6,80001cd6 <__subsf3+0x278>
80001cd0:	ebf9                	bnez	a5,80001da6 <__subsf3+0x348>
80001cd2:	4501                	li	a0,0
80001cd4:	b729                	j	80001bde <__subsf3+0x180>
80001cd6:	cbf1                	beqz	a5,80001daa <__subsf3+0x34c>
80001cd8:	40f80733          	sub	a4,a6,a5
80001cdc:	00571693          	slli	a3,a4,0x5
80001ce0:	410787b3          	sub	a5,a5,a6
80001ce4:	0c06c163          	bltz	a3,80001da6 <__subsf3+0x348>
80001ce8:	87ba                	mv	a5,a4
80001cea:	e729                	bnez	a4,80001d34 <__subsf3+0x2d6>
80001cec:	4781                	li	a5,0
80001cee:	b7d5                	j	80001cd2 <__subsf3+0x274>
80001cf0:	ee0812e3          	bnez	a6,80001bd4 <__subsf3+0x176>
80001cf4:	f7d1                	bnez	a5,80001c80 <__subsf3+0x222>
80001cf6:	b5c5                	j	80001bd6 <__subsf3+0x178>
80001cf8:	40f80433          	sub	s0,a6,a5
80001cfc:	00541713          	slli	a4,s0,0x5
80001d00:	02075c63          	bgez	a4,80001d38 <__subsf3+0x2da>
80001d04:	41078433          	sub	s0,a5,a6
80001d08:	84ae                	mv	s1,a1
80001d0a:	8522                	mv	a0,s0
80001d0c:	26d9                	jal	800020d2 <__clzsi2>
80001d0e:	156d                	addi	a0,a0,-5
80001d10:	00a41433          	sll	s0,s0,a0
80001d14:	03254463          	blt	a0,s2,80001d3c <__subsf3+0x2de>
80001d18:	41250533          	sub	a0,a0,s2
80001d1c:	0505                	addi	a0,a0,1
80001d1e:	02000713          	li	a4,32
80001d22:	00a457b3          	srl	a5,s0,a0
80001d26:	40a70533          	sub	a0,a4,a0
80001d2a:	00a41433          	sll	s0,s0,a0
80001d2e:	00803433          	snez	s0,s0
80001d32:	8fc1                	or	a5,a5,s0
80001d34:	4501                	li	a0,0
80001d36:	b551                	j	80001bba <__subsf3+0x15c>
80001d38:	d855                	beqz	s0,80001cec <__subsf3+0x28e>
80001d3a:	bfc1                	j	80001d0a <__subsf3+0x2ac>
80001d3c:	fc0007b7          	lui	a5,0xfc000
80001d40:	17fd                	addi	a5,a5,-1
80001d42:	40a90533          	sub	a0,s2,a0
80001d46:	8fe1                	and	a5,a5,s0
80001d48:	bd8d                	j	80001bba <__subsf3+0x15c>
80001d4a:	87c2                	mv	a5,a6
80001d4c:	b5bd                	j	80001bba <__subsf3+0x15c>
80001d4e:	4781                	li	a5,0
80001d50:	00579713          	slli	a4,a5,0x5
80001d54:	00075b63          	bgez	a4,80001d6a <__subsf3+0x30c>
80001d58:	0505                	addi	a0,a0,1
80001d5a:	0ff00713          	li	a4,255
80001d5e:	04e50863          	beq	a0,a4,80001dae <__subsf3+0x350>
80001d62:	fc000737          	lui	a4,0xfc000
80001d66:	177d                	addi	a4,a4,-1
80001d68:	8ff9                	and	a5,a5,a4
80001d6a:	0ff00713          	li	a4,255
80001d6e:	838d                	srli	a5,a5,0x3
80001d70:	00e51663          	bne	a0,a4,80001d7c <__subsf3+0x31e>
80001d74:	c781                	beqz	a5,80001d7c <__subsf3+0x31e>
80001d76:	004007b7          	lui	a5,0x400
80001d7a:	4481                	li	s1,0
80001d7c:	00800737          	lui	a4,0x800
80001d80:	177d                	addi	a4,a4,-1
80001d82:	0ff57513          	andi	a0,a0,255
80001d86:	8ff9                	and	a5,a5,a4
80001d88:	01751713          	slli	a4,a0,0x17
80001d8c:	80800537          	lui	a0,0x80800
80001d90:	40b2                	lw	ra,12(sp)
80001d92:	4422                	lw	s0,8(sp)
80001d94:	157d                	addi	a0,a0,-1
80001d96:	8d7d                	and	a0,a0,a5
80001d98:	04fe                	slli	s1,s1,0x1f
80001d9a:	8d59                	or	a0,a0,a4
80001d9c:	8d45                	or	a0,a0,s1
80001d9e:	4902                	lw	s2,0(sp)
80001da0:	4492                	lw	s1,4(sp)
80001da2:	0141                	addi	sp,sp,16
80001da4:	8082                	ret
80001da6:	84ae                	mv	s1,a1
80001da8:	b771                	j	80001d34 <__subsf3+0x2d6>
80001daa:	87c2                	mv	a5,a6
80001dac:	b761                	j	80001d34 <__subsf3+0x2d6>
80001dae:	4781                	li	a5,0
80001db0:	bf6d                	j	80001d6a <__subsf3+0x30c>

80001db2 <__fixsfsi>:
80001db2:	00800637          	lui	a2,0x800
80001db6:	01755713          	srli	a4,a0,0x17
80001dba:	fff60793          	addi	a5,a2,-1 # 7fffff <_stack_size+0x7ffbff>
80001dbe:	0ff77713          	andi	a4,a4,255
80001dc2:	07e00593          	li	a1,126
80001dc6:	8fe9                	and	a5,a5,a0
80001dc8:	01f55693          	srli	a3,a0,0x1f
80001dcc:	04e5f163          	bleu	a4,a1,80001e0e <__fixsfsi+0x5c>
80001dd0:	09d00593          	li	a1,157
80001dd4:	00e5f863          	bleu	a4,a1,80001de4 <__fixsfsi+0x32>
80001dd8:	80000537          	lui	a0,0x80000
80001ddc:	fff54513          	not	a0,a0
80001de0:	9536                	add	a0,a0,a3
80001de2:	8082                	ret
80001de4:	00c7e533          	or	a0,a5,a2
80001de8:	09500793          	li	a5,149
80001dec:	00e7da63          	ble	a4,a5,80001e00 <__fixsfsi+0x4e>
80001df0:	f6a70713          	addi	a4,a4,-150 # 7fff6a <_stack_size+0x7ffb6a>
80001df4:	00e51533          	sll	a0,a0,a4
80001df8:	ce81                	beqz	a3,80001e10 <__fixsfsi+0x5e>
80001dfa:	40a00533          	neg	a0,a0
80001dfe:	8082                	ret
80001e00:	09600793          	li	a5,150
80001e04:	40e78733          	sub	a4,a5,a4
80001e08:	00e55533          	srl	a0,a0,a4
80001e0c:	b7f5                	j	80001df8 <__fixsfsi+0x46>
80001e0e:	4501                	li	a0,0
80001e10:	8082                	ret

80001e12 <__floatsisf>:
80001e12:	1141                	addi	sp,sp,-16
80001e14:	c606                	sw	ra,12(sp)
80001e16:	c422                	sw	s0,8(sp)
80001e18:	c226                	sw	s1,4(sp)
80001e1a:	c169                	beqz	a0,80001edc <__floatsisf+0xca>
80001e1c:	842a                	mv	s0,a0
80001e1e:	01f55493          	srli	s1,a0,0x1f
80001e22:	00055463          	bgez	a0,80001e2a <__floatsisf+0x18>
80001e26:	40a00433          	neg	s0,a0
80001e2a:	8522                	mv	a0,s0
80001e2c:	245d                	jal	800020d2 <__clzsi2>
80001e2e:	09e00793          	li	a5,158
80001e32:	8f89                	sub	a5,a5,a0
80001e34:	09600713          	li	a4,150
80001e38:	04f74263          	blt	a4,a5,80001e7c <__floatsisf+0x6a>
80001e3c:	4721                	li	a4,8
80001e3e:	00a75563          	ble	a0,a4,80001e48 <__floatsisf+0x36>
80001e42:	1561                	addi	a0,a0,-8
80001e44:	00a41433          	sll	s0,s0,a0
80001e48:	00800537          	lui	a0,0x800
80001e4c:	157d                	addi	a0,a0,-1
80001e4e:	0ff7f793          	andi	a5,a5,255
80001e52:	8c69                	and	s0,s0,a0
80001e54:	01779513          	slli	a0,a5,0x17
80001e58:	808007b7          	lui	a5,0x80800
80001e5c:	17fd                	addi	a5,a5,-1
80001e5e:	8c7d                	and	s0,s0,a5
80001e60:	800007b7          	lui	a5,0x80000
80001e64:	8c49                	or	s0,s0,a0
80001e66:	fff7c793          	not	a5,a5
80001e6a:	01f49513          	slli	a0,s1,0x1f
80001e6e:	8c7d                	and	s0,s0,a5
80001e70:	8d41                	or	a0,a0,s0
80001e72:	40b2                	lw	ra,12(sp)
80001e74:	4422                	lw	s0,8(sp)
80001e76:	4492                	lw	s1,4(sp)
80001e78:	0141                	addi	sp,sp,16
80001e7a:	8082                	ret
80001e7c:	09900713          	li	a4,153
80001e80:	00f75d63          	ble	a5,a4,80001e9a <__floatsisf+0x88>
80001e84:	4715                	li	a4,5
80001e86:	8f09                	sub	a4,a4,a0
80001e88:	01b50693          	addi	a3,a0,27 # 80001b <_stack_size+0x7ffc1b>
80001e8c:	00e45733          	srl	a4,s0,a4
80001e90:	00d41433          	sll	s0,s0,a3
80001e94:	00803433          	snez	s0,s0
80001e98:	8c59                	or	s0,s0,a4
80001e9a:	4715                	li	a4,5
80001e9c:	00a75663          	ble	a0,a4,80001ea8 <__floatsisf+0x96>
80001ea0:	ffb50713          	addi	a4,a0,-5
80001ea4:	00e41433          	sll	s0,s0,a4
80001ea8:	fc000737          	lui	a4,0xfc000
80001eac:	177d                	addi	a4,a4,-1
80001eae:	00747693          	andi	a3,s0,7
80001eb2:	8f61                	and	a4,a4,s0
80001eb4:	c691                	beqz	a3,80001ec0 <__floatsisf+0xae>
80001eb6:	883d                	andi	s0,s0,15
80001eb8:	4691                	li	a3,4
80001eba:	00d40363          	beq	s0,a3,80001ec0 <__floatsisf+0xae>
80001ebe:	0711                	addi	a4,a4,4
80001ec0:	00571693          	slli	a3,a4,0x5
80001ec4:	0006d963          	bgez	a3,80001ed6 <__floatsisf+0xc4>
80001ec8:	fc0007b7          	lui	a5,0xfc000
80001ecc:	17fd                	addi	a5,a5,-1
80001ece:	8f7d                	and	a4,a4,a5
80001ed0:	09f00793          	li	a5,159
80001ed4:	8f89                	sub	a5,a5,a0
80001ed6:	00375413          	srli	s0,a4,0x3
80001eda:	b7bd                	j	80001e48 <__floatsisf+0x36>
80001edc:	4401                	li	s0,0
80001ede:	4781                	li	a5,0
80001ee0:	4481                	li	s1,0
80001ee2:	b79d                	j	80001e48 <__floatsisf+0x36>

80001ee4 <__extendsfdf2>:
80001ee4:	01755793          	srli	a5,a0,0x17
80001ee8:	1141                	addi	sp,sp,-16
80001eea:	0ff7f793          	andi	a5,a5,255
80001eee:	c422                	sw	s0,8(sp)
80001ef0:	00178713          	addi	a4,a5,1 # fc000001 <_stack_start+0x7bffa6f1>
80001ef4:	00800437          	lui	s0,0x800
80001ef8:	c226                	sw	s1,4(sp)
80001efa:	147d                	addi	s0,s0,-1
80001efc:	c606                	sw	ra,12(sp)
80001efe:	0ff77713          	andi	a4,a4,255
80001f02:	4685                	li	a3,1
80001f04:	8c69                	and	s0,s0,a0
80001f06:	01f55493          	srli	s1,a0,0x1f
80001f0a:	04e6d363          	ble	a4,a3,80001f50 <__extendsfdf2+0x6c>
80001f0e:	38078513          	addi	a0,a5,896
80001f12:	00345793          	srli	a5,s0,0x3
80001f16:	0476                	slli	s0,s0,0x1d
80001f18:	00100737          	lui	a4,0x100
80001f1c:	177d                	addi	a4,a4,-1
80001f1e:	8ff9                	and	a5,a5,a4
80001f20:	80100737          	lui	a4,0x80100
80001f24:	177d                	addi	a4,a4,-1
80001f26:	7ff57513          	andi	a0,a0,2047
80001f2a:	0552                	slli	a0,a0,0x14
80001f2c:	8ff9                	and	a5,a5,a4
80001f2e:	80000737          	lui	a4,0x80000
80001f32:	8fc9                	or	a5,a5,a0
80001f34:	fff74713          	not	a4,a4
80001f38:	01f49513          	slli	a0,s1,0x1f
80001f3c:	8ff9                	and	a5,a5,a4
80001f3e:	00a7e733          	or	a4,a5,a0
80001f42:	40b2                	lw	ra,12(sp)
80001f44:	8522                	mv	a0,s0
80001f46:	4422                	lw	s0,8(sp)
80001f48:	4492                	lw	s1,4(sp)
80001f4a:	85ba                	mv	a1,a4
80001f4c:	0141                	addi	sp,sp,16
80001f4e:	8082                	ret
80001f50:	eb95                	bnez	a5,80001f84 <__extendsfdf2+0xa0>
80001f52:	c421                	beqz	s0,80001f9a <__extendsfdf2+0xb6>
80001f54:	8522                	mv	a0,s0
80001f56:	2ab5                	jal	800020d2 <__clzsi2>
80001f58:	47a9                	li	a5,10
80001f5a:	00a7cf63          	blt	a5,a0,80001f78 <__extendsfdf2+0x94>
80001f5e:	47ad                	li	a5,11
80001f60:	8f89                	sub	a5,a5,a0
80001f62:	01550713          	addi	a4,a0,21
80001f66:	00f457b3          	srl	a5,s0,a5
80001f6a:	00e41433          	sll	s0,s0,a4
80001f6e:	38900713          	li	a4,905
80001f72:	40a70533          	sub	a0,a4,a0
80001f76:	b74d                	j	80001f18 <__extendsfdf2+0x34>
80001f78:	ff550793          	addi	a5,a0,-11
80001f7c:	00f417b3          	sll	a5,s0,a5
80001f80:	4401                	li	s0,0
80001f82:	b7f5                	j	80001f6e <__extendsfdf2+0x8a>
80001f84:	4781                	li	a5,0
80001f86:	c419                	beqz	s0,80001f94 <__extendsfdf2+0xb0>
80001f88:	00345793          	srli	a5,s0,0x3
80001f8c:	00080737          	lui	a4,0x80
80001f90:	0476                	slli	s0,s0,0x1d
80001f92:	8fd9                	or	a5,a5,a4
80001f94:	7ff00513          	li	a0,2047
80001f98:	b741                	j	80001f18 <__extendsfdf2+0x34>
80001f9a:	4781                	li	a5,0
80001f9c:	4501                	li	a0,0
80001f9e:	bfad                	j	80001f18 <__extendsfdf2+0x34>

80001fa0 <__truncdfsf2>:
80001fa0:	00100637          	lui	a2,0x100
80001fa4:	167d                	addi	a2,a2,-1
80001fa6:	8e6d                	and	a2,a2,a1
80001fa8:	0145d813          	srli	a6,a1,0x14
80001fac:	01d55793          	srli	a5,a0,0x1d
80001fb0:	7ff87813          	andi	a6,a6,2047
80001fb4:	060e                	slli	a2,a2,0x3
80001fb6:	8e5d                	or	a2,a2,a5
80001fb8:	00180793          	addi	a5,a6,1
80001fbc:	7ff7f793          	andi	a5,a5,2047
80001fc0:	4685                	li	a3,1
80001fc2:	81fd                	srli	a1,a1,0x1f
80001fc4:	00351713          	slli	a4,a0,0x3
80001fc8:	08f6d363          	ble	a5,a3,8000204e <__truncdfsf2+0xae>
80001fcc:	c8080693          	addi	a3,a6,-896
80001fd0:	0fe00793          	li	a5,254
80001fd4:	08d7cb63          	blt	a5,a3,8000206a <__truncdfsf2+0xca>
80001fd8:	06d04263          	bgtz	a3,8000203c <__truncdfsf2+0x9c>
80001fdc:	57a5                	li	a5,-23
80001fde:	0cf6cf63          	blt	a3,a5,800020bc <__truncdfsf2+0x11c>
80001fe2:	008007b7          	lui	a5,0x800
80001fe6:	4579                	li	a0,30
80001fe8:	8e5d                	or	a2,a2,a5
80001fea:	8d15                	sub	a0,a0,a3
80001fec:	47fd                	li	a5,31
80001fee:	02a7c363          	blt	a5,a0,80002014 <__truncdfsf2+0x74>
80001ff2:	c8280813          	addi	a6,a6,-894
80001ff6:	010717b3          	sll	a5,a4,a6
80001ffa:	00f037b3          	snez	a5,a5
80001ffe:	01061633          	sll	a2,a2,a6
80002002:	00a75533          	srl	a0,a4,a0
80002006:	8fd1                	or	a5,a5,a2
80002008:	8fc9                	or	a5,a5,a0
8000200a:	4681                	li	a3,0
8000200c:	0077f713          	andi	a4,a5,7
80002010:	c325                	beqz	a4,80002070 <__truncdfsf2+0xd0>
80002012:	a07d                	j	800020c0 <__truncdfsf2+0x120>
80002014:	57f9                	li	a5,-2
80002016:	40d786b3          	sub	a3,a5,a3
8000201a:	02000793          	li	a5,32
8000201e:	00d656b3          	srl	a3,a2,a3
80002022:	4881                	li	a7,0
80002024:	00f50663          	beq	a0,a5,80002030 <__truncdfsf2+0x90>
80002028:	ca280813          	addi	a6,a6,-862
8000202c:	010618b3          	sll	a7,a2,a6
80002030:	00e8e7b3          	or	a5,a7,a4
80002034:	00f037b3          	snez	a5,a5
80002038:	8fd5                	or	a5,a5,a3
8000203a:	bfc1                	j	8000200a <__truncdfsf2+0x6a>
8000203c:	051a                	slli	a0,a0,0x6
8000203e:	00a03533          	snez	a0,a0
80002042:	060e                	slli	a2,a2,0x3
80002044:	01d75793          	srli	a5,a4,0x1d
80002048:	8e49                	or	a2,a2,a0
8000204a:	8fd1                	or	a5,a5,a2
8000204c:	b7c1                	j	8000200c <__truncdfsf2+0x6c>
8000204e:	00e667b3          	or	a5,a2,a4
80002052:	00081563          	bnez	a6,8000205c <__truncdfsf2+0xbc>
80002056:	00f037b3          	snez	a5,a5
8000205a:	bf45                	j	8000200a <__truncdfsf2+0x6a>
8000205c:	0ff00693          	li	a3,255
80002060:	cb81                	beqz	a5,80002070 <__truncdfsf2+0xd0>
80002062:	060e                	slli	a2,a2,0x3
80002064:	020007b7          	lui	a5,0x2000
80002068:	b7cd                	j	8000204a <__truncdfsf2+0xaa>
8000206a:	4781                	li	a5,0
8000206c:	0ff00693          	li	a3,255
80002070:	00579713          	slli	a4,a5,0x5
80002074:	00075b63          	bgez	a4,8000208a <__truncdfsf2+0xea>
80002078:	0685                	addi	a3,a3,1
8000207a:	0ff00713          	li	a4,255
8000207e:	04e68863          	beq	a3,a4,800020ce <__truncdfsf2+0x12e>
80002082:	fc000737          	lui	a4,0xfc000
80002086:	177d                	addi	a4,a4,-1
80002088:	8ff9                	and	a5,a5,a4
8000208a:	0ff00713          	li	a4,255
8000208e:	838d                	srli	a5,a5,0x3
80002090:	00e69663          	bne	a3,a4,8000209c <__truncdfsf2+0xfc>
80002094:	c781                	beqz	a5,8000209c <__truncdfsf2+0xfc>
80002096:	004007b7          	lui	a5,0x400
8000209a:	4581                	li	a1,0
8000209c:	00800537          	lui	a0,0x800
800020a0:	157d                	addi	a0,a0,-1
800020a2:	8fe9                	and	a5,a5,a0
800020a4:	80800537          	lui	a0,0x80800
800020a8:	157d                	addi	a0,a0,-1
800020aa:	0ff6f693          	andi	a3,a3,255
800020ae:	06de                	slli	a3,a3,0x17
800020b0:	8fe9                	and	a5,a5,a0
800020b2:	05fe                	slli	a1,a1,0x1f
800020b4:	8fd5                	or	a5,a5,a3
800020b6:	00b7e533          	or	a0,a5,a1
800020ba:	8082                	ret
800020bc:	4785                	li	a5,1
800020be:	4681                	li	a3,0
800020c0:	00f7f713          	andi	a4,a5,15
800020c4:	4611                	li	a2,4
800020c6:	fac705e3          	beq	a4,a2,80002070 <__truncdfsf2+0xd0>
800020ca:	0791                	addi	a5,a5,4
800020cc:	b755                	j	80002070 <__truncdfsf2+0xd0>
800020ce:	4781                	li	a5,0
800020d0:	bf6d                	j	8000208a <__truncdfsf2+0xea>

800020d2 <__clzsi2>:
800020d2:	67c1                	lui	a5,0x10
800020d4:	02f57663          	bleu	a5,a0,80002100 <__clzsi2+0x2e>
800020d8:	0ff00793          	li	a5,255
800020dc:	00a7b7b3          	sltu	a5,a5,a0
800020e0:	078e                	slli	a5,a5,0x3
800020e2:	02000713          	li	a4,32
800020e6:	8f1d                	sub	a4,a4,a5
800020e8:	00f557b3          	srl	a5,a0,a5
800020ec:	00000517          	auipc	a0,0x0
800020f0:	6f450513          	addi	a0,a0,1780 # 800027e0 <__clz_tab>
800020f4:	97aa                	add	a5,a5,a0
800020f6:	0007c503          	lbu	a0,0(a5) # 10000 <_stack_size+0xfc00>
800020fa:	40a70533          	sub	a0,a4,a0
800020fe:	8082                	ret
80002100:	01000737          	lui	a4,0x1000
80002104:	47c1                	li	a5,16
80002106:	fce56ee3          	bltu	a0,a4,800020e2 <__clzsi2+0x10>
8000210a:	47e1                	li	a5,24
8000210c:	bfd9                	j	800020e2 <__clzsi2+0x10>

Disassembly of section .text.startup:

8000210e <main>:
int main() {
8000210e:	1141                	addi	sp,sp,-16
80002110:	c606                	sw	ra,12(sp)
	main2();
80002112:	90afe0ef          	jal	ra,8000021c <main2>
}
80002116:	40b2                	lw	ra,12(sp)
	TEST_COM_BASE[8] = 0;
80002118:	f01007b7          	lui	a5,0xf0100
8000211c:	f207a023          	sw	zero,-224(a5) # f00fff20 <_stack_start+0x700fa610>
}
80002120:	4501                	li	a0,0
80002122:	0141                	addi	sp,sp,16
80002124:	8082                	ret
