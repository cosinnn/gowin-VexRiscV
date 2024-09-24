
build/democ.elf:     file format elf32-littleriscv


Disassembly of section .vector:

80000000 <crtStart>:
  (unsigned int *) crtStart,    // code entry
  (unsigned int *) trapEntry,   // trap entry
};

void crtStart()
{
80000000:	ff010113          	addi	sp,sp,-16
80000004:	00112623          	sw	ra,12(sp)
80000008:	00812423          	sw	s0,8(sp)
8000000c:	01010413          	addi	s0,sp,16
  /* Initialize sp and gp registers */
  asm volatile (
80000010:	00018193          	mv	gp,gp
80000014:	a2018113          	addi	sp,gp,-1504 # 800006b0 <_stack_start>
    "la gp, %0\n\t"
    "la sp, %1\n\t"
    :: "i"(&__global_pointer$), "i"(&_stack_start)
  );

  bssInit();
80000018:	04c000ef          	jal	ra,80000064 <bssInit>
  ctorsInit();
8000001c:	094000ef          	jal	ra,800000b0 <ctorsInit>
  main();
80000020:	2b4000ef          	jal	ra,800002d4 <main>
  asm volatile("j .");
80000024:	0000006f          	j	80000024 <crtStart+0x24>
}
80000028:	00000013          	nop
8000002c:	00c12083          	lw	ra,12(sp)
80000030:	00812403          	lw	s0,8(sp)
80000034:	01010113          	addi	sp,sp,16
80000038:	00008067          	ret

8000003c <trapEntry>:

static void trapEntry()
{
8000003c:	ff010113          	addi	sp,sp,-16
80000040:	00112623          	sw	ra,12(sp)
80000044:	00812423          	sw	s0,8(sp)
80000048:	01010413          	addi	s0,sp,16
  irqCallback();
8000004c:	3c4000ef          	jal	ra,80000410 <irqCallback>
}
80000050:	00000013          	nop
80000054:	00c12083          	lw	ra,12(sp)
80000058:	00812403          	lw	s0,8(sp)
8000005c:	01010113          	addi	sp,sp,16
80000060:	00008067          	ret

80000064 <bssInit>:

static void bssInit()
{
80000064:	fe010113          	addi	sp,sp,-32
80000068:	00812e23          	sw	s0,28(sp)
8000006c:	02010413          	addi	s0,sp,32
  unsigned int * bss_start_p = &_bss_start; 
80000070:	80818793          	addi	a5,gp,-2040 # 80000498 <b>
80000074:	fef42623          	sw	a5,-20(s0)
  unsigned int * bss_end_p = &_bss_end;
80000078:	81418793          	addi	a5,gp,-2028 # 800004a4 <_bss_end>
8000007c:	fef42423          	sw	a5,-24(s0)
  while(bss_start_p != bss_end_p) {
80000080:	0140006f          	j	80000094 <bssInit+0x30>
    *bss_start_p++ = 0;
80000084:	fec42783          	lw	a5,-20(s0)
80000088:	00478713          	addi	a4,a5,4
8000008c:	fee42623          	sw	a4,-20(s0)
80000090:	0007a023          	sw	zero,0(a5)
  while(bss_start_p != bss_end_p) {
80000094:	fec42703          	lw	a4,-20(s0)
80000098:	fe842783          	lw	a5,-24(s0)
8000009c:	fef714e3          	bne	a4,a5,80000084 <bssInit+0x20>
  }
}
800000a0:	00000013          	nop
800000a4:	01c12403          	lw	s0,28(sp)
800000a8:	02010113          	addi	sp,sp,32
800000ac:	00008067          	ret

800000b0 <ctorsInit>:

static void ctorsInit()
{
800000b0:	fe010113          	addi	sp,sp,-32
800000b4:	00112e23          	sw	ra,28(sp)
800000b8:	00812c23          	sw	s0,24(sp)
800000bc:	02010413          	addi	s0,sp,32
  unsigned int * ctors_start_p = &_ctors_start;
800000c0:	800007b7          	lui	a5,0x80000
800000c4:	48c78793          	addi	a5,a5,1164 # 8000048c <__global_pointer$+0xfffff7fc>
800000c8:	fef42623          	sw	a5,-20(s0)
  unsigned int * ctors_end_p = &_ctors_end;
800000cc:	800007b7          	lui	a5,0x80000
800000d0:	49078793          	addi	a5,a5,1168 # 80000490 <__global_pointer$+0xfffff800>
800000d4:	fef42423          	sw	a5,-24(s0)
  void(*ctor)(); 
  while(ctors_start_p != ctors_end_p) {
800000d8:	0200006f          	j	800000f8 <ctorsInit+0x48>
    ctor = (void *)*ctors_start_p++;
800000dc:	fec42783          	lw	a5,-20(s0)
800000e0:	00478713          	addi	a4,a5,4
800000e4:	fee42623          	sw	a4,-20(s0)
800000e8:	0007a783          	lw	a5,0(a5)
800000ec:	fef42223          	sw	a5,-28(s0)
    ctor();
800000f0:	fe442783          	lw	a5,-28(s0)
800000f4:	000780e7          	jalr	a5
  while(ctors_start_p != ctors_end_p) {
800000f8:	fec42703          	lw	a4,-20(s0)
800000fc:	fe842783          	lw	a5,-24(s0)
80000100:	fcf71ee3          	bne	a4,a5,800000dc <ctorsInit+0x2c>
  }
}
80000104:	00000013          	nop
80000108:	01c12083          	lw	ra,28(sp)
8000010c:	01812403          	lw	s0,24(sp)
80000110:	02010113          	addi	sp,sp,32
80000114:	00008067          	ret

Disassembly of section .memory:

80000118 <timer_init>:
  volatile uint32_t CLEARS_TICKS;
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

static void timer_init(Timer_Reg *reg){
80000118:	fe010113          	addi	sp,sp,-32
8000011c:	00812e23          	sw	s0,28(sp)
80000120:	02010413          	addi	s0,sp,32
80000124:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
80000128:	fec42783          	lw	a5,-20(s0)
8000012c:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
80000130:	fec42783          	lw	a5,-20(s0)
80000134:	0007a423          	sw	zero,8(a5)
}
80000138:	00000013          	nop
8000013c:	01c12403          	lw	s0,28(sp)
80000140:	02010113          	addi	sp,sp,32
80000144:	00008067          	ret

80000148 <prescaler_init>:
typedef struct
{
  volatile uint32_t LIMIT;
} Prescaler_Reg;

static void prescaler_init(Prescaler_Reg* reg){
80000148:	fe010113          	addi	sp,sp,-32
8000014c:	00812e23          	sw	s0,28(sp)
80000150:	02010413          	addi	s0,sp,32
80000154:	fea42623          	sw	a0,-20(s0)

}
80000158:	00000013          	nop
8000015c:	01c12403          	lw	s0,28(sp)
80000160:	02010113          	addi	sp,sp,32
80000164:	00008067          	ret

80000168 <interruptCtrl_init>:
{
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} InterruptCtrl_Reg;

static void interruptCtrl_init(InterruptCtrl_Reg* reg){
80000168:	fe010113          	addi	sp,sp,-32
8000016c:	00812e23          	sw	s0,28(sp)
80000170:	02010413          	addi	s0,sp,32
80000174:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
80000178:	fec42783          	lw	a5,-20(s0)
8000017c:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
80000180:	fec42783          	lw	a5,-20(s0)
80000184:	fff00713          	li	a4,-1
80000188:	00e7a023          	sw	a4,0(a5)
}
8000018c:	00000013          	nop
80000190:	01c12403          	lw	s0,28(sp)
80000194:	02010113          	addi	sp,sp,32
80000198:	00008067          	ret

8000019c <uart_writeAvailability>:
	enum UartParity parity;
	enum UartStop stop;
	uint32_t clockDivider;
} Uart_Config;

static uint32_t uart_writeAvailability(Uart_Reg *reg){
8000019c:	fe010113          	addi	sp,sp,-32
800001a0:	00812e23          	sw	s0,28(sp)
800001a4:	02010413          	addi	s0,sp,32
800001a8:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
800001ac:	fec42783          	lw	a5,-20(s0)
800001b0:	0047a783          	lw	a5,4(a5)
800001b4:	0107d793          	srli	a5,a5,0x10
800001b8:	0ff7f793          	andi	a5,a5,255
}
800001bc:	00078513          	mv	a0,a5
800001c0:	01c12403          	lw	s0,28(sp)
800001c4:	02010113          	addi	sp,sp,32
800001c8:	00008067          	ret

800001cc <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
800001cc:	fe010113          	addi	sp,sp,-32
800001d0:	00812e23          	sw	s0,28(sp)
800001d4:	02010413          	addi	s0,sp,32
800001d8:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
800001dc:	fec42783          	lw	a5,-20(s0)
800001e0:	0047a783          	lw	a5,4(a5)
800001e4:	0187d793          	srli	a5,a5,0x18
}
800001e8:	00078513          	mv	a0,a5
800001ec:	01c12403          	lw	s0,28(sp)
800001f0:	02010113          	addi	sp,sp,32
800001f4:	00008067          	ret

800001f8 <uart_write>:

static void uart_write(Uart_Reg *reg, uint32_t data){
800001f8:	fe010113          	addi	sp,sp,-32
800001fc:	00112e23          	sw	ra,28(sp)
80000200:	00812c23          	sw	s0,24(sp)
80000204:	02010413          	addi	s0,sp,32
80000208:	fea42623          	sw	a0,-20(s0)
8000020c:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
80000210:	00000013          	nop
80000214:	fec42503          	lw	a0,-20(s0)
80000218:	f85ff0ef          	jal	ra,8000019c <uart_writeAvailability>
8000021c:	00050793          	mv	a5,a0
80000220:	fe078ae3          	beqz	a5,80000214 <uart_write+0x1c>
	reg->DATA = data;
80000224:	fec42783          	lw	a5,-20(s0)
80000228:	fe842703          	lw	a4,-24(s0)
8000022c:	00e7a023          	sw	a4,0(a5)
}
80000230:	00000013          	nop
80000234:	01c12083          	lw	ra,28(sp)
80000238:	01812403          	lw	s0,24(sp)
8000023c:	02010113          	addi	sp,sp,32
80000240:	00008067          	ret

80000244 <uart_applyConfig>:

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
80000244:	fe010113          	addi	sp,sp,-32
80000248:	00812e23          	sw	s0,28(sp)
8000024c:	02010413          	addi	s0,sp,32
80000250:	fea42623          	sw	a0,-20(s0)
80000254:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
80000258:	fe842783          	lw	a5,-24(s0)
8000025c:	00c7a703          	lw	a4,12(a5)
80000260:	fec42783          	lw	a5,-20(s0)
80000264:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
80000268:	fe842783          	lw	a5,-24(s0)
8000026c:	0007a783          	lw	a5,0(a5)
80000270:	fff78713          	addi	a4,a5,-1
80000274:	fe842783          	lw	a5,-24(s0)
80000278:	0047a783          	lw	a5,4(a5)
8000027c:	00879793          	slli	a5,a5,0x8
80000280:	00f76733          	or	a4,a4,a5
80000284:	fe842783          	lw	a5,-24(s0)
80000288:	0087a783          	lw	a5,8(a5)
8000028c:	01079793          	slli	a5,a5,0x10
80000290:	00f76733          	or	a4,a4,a5
80000294:	fec42783          	lw	a5,-20(s0)
80000298:	00e7a623          	sw	a4,12(a5)
}
8000029c:	00000013          	nop
800002a0:	01c12403          	lw	s0,28(sp)
800002a4:	02010113          	addi	sp,sp,32
800002a8:	00008067          	ret

800002ac <defaultConstructor>:
/* bss section */
uint32_t a, b, c;

/* ctor section */
void __attribute__ ((constructor)) defaultConstructor() 
{
800002ac:	ff010113          	addi	sp,sp,-16
800002b0:	00812623          	sw	s0,12(sp)
800002b4:	01010413          	addi	s0,sp,16
	c += 3;
800002b8:	80c1a783          	lw	a5,-2036(gp) # 8000049c <c>
800002bc:	00378713          	addi	a4,a5,3
800002c0:	80e1a623          	sw	a4,-2036(gp) # 8000049c <c>
} 
800002c4:	00000013          	nop
800002c8:	00c12403          	lw	s0,12(sp)
800002cc:	01010113          	addi	sp,sp,16
800002d0:	00008067          	ret

800002d4 <main>:

/* text section */
void main()
{
800002d4:	fe010113          	addi	sp,sp,-32
800002d8:	00112e23          	sw	ra,28(sp)
800002dc:	00812c23          	sw	s0,24(sp)
800002e0:	02010413          	addi	s0,sp,32
	uint32_t result;

	interruptCtrl_init(TIMER_INTERRUPT);
800002e4:	f00207b7          	lui	a5,0xf0020
800002e8:	01078513          	addi	a0,a5,16 # f0020010 <__global_pointer$+0x7001f380>
800002ec:	e7dff0ef          	jal	ra,80000168 <interruptCtrl_init>
	prescaler_init(TIMER_PRESCALER);
800002f0:	f0020537          	lui	a0,0xf0020
800002f4:	e55ff0ef          	jal	ra,80000148 <prescaler_init>
	timer_init(TIMER_A);
800002f8:	f00207b7          	lui	a5,0xf0020
800002fc:	04078513          	addi	a0,a5,64 # f0020040 <__global_pointer$+0x7001f3b0>
80000300:	e19ff0ef          	jal	ra,80000118 <timer_init>

	TIMER_PRESCALER->LIMIT = 12000-1; //1 ms rate
80000304:	f00207b7          	lui	a5,0xf0020
80000308:	00003737          	lui	a4,0x3
8000030c:	edf70713          	addi	a4,a4,-289 # 2edf <_stack_size+0x2cdf>
80000310:	00e7a023          	sw	a4,0(a5) # f0020000 <__global_pointer$+0x7001f370>

	TIMER_A->LIMIT = 1000-1;  //1 second rate
80000314:	f00207b7          	lui	a5,0xf0020
80000318:	04078793          	addi	a5,a5,64 # f0020040 <__global_pointer$+0x7001f3b0>
8000031c:	3e700713          	li	a4,999
80000320:	00e7a223          	sw	a4,4(a5)
	TIMER_A->CLEARS_TICKS = 0x00010002;
80000324:	f00207b7          	lui	a5,0xf0020
80000328:	04078793          	addi	a5,a5,64 # f0020040 <__global_pointer$+0x7001f3b0>
8000032c:	00010737          	lui	a4,0x10
80000330:	00270713          	addi	a4,a4,2 # 10002 <_stack_size+0xfe02>
80000334:	00e7a023          	sw	a4,0(a5)

	TIMER_INTERRUPT->PENDINGS = 0xF;
80000338:	f00207b7          	lui	a5,0xf0020
8000033c:	01078793          	addi	a5,a5,16 # f0020010 <__global_pointer$+0x7001f380>
80000340:	00f00713          	li	a4,15
80000344:	00e7a023          	sw	a4,0(a5)
	TIMER_INTERRUPT->MASKS = 0x1;
80000348:	f00207b7          	lui	a5,0xf0020
8000034c:	01078793          	addi	a5,a5,16 # f0020010 <__global_pointer$+0x7001f380>
80000350:	00100713          	li	a4,1
80000354:	00e7a223          	sw	a4,4(a5)

	GPIO_A->OUTPUT_ENABLE = 0x000000FF;
80000358:	f00007b7          	lui	a5,0xf0000
8000035c:	0ff00713          	li	a4,255
80000360:	00e7a423          	sw	a4,8(a5) # f0000008 <__global_pointer$+0x6ffff378>
	GPIO_A->OUTPUT = 0x00000000;
80000364:	f00007b7          	lui	a5,0xf0000
80000368:	0007a223          	sw	zero,4(a5) # f0000004 <__global_pointer$+0x6ffff374>

	UART->STATUS = 2; //Enable RX interrupts
8000036c:	f00107b7          	lui	a5,0xf0010
80000370:	00200713          	li	a4,2
80000374:	00e7a223          	sw	a4,4(a5) # f0010004 <__global_pointer$+0x7000f374>
	UART->DATA = 'A';
80000378:	f00107b7          	lui	a5,0xf0010
8000037c:	04100713          	li	a4,65
80000380:	00e7a023          	sw	a4,0(a5) # f0010000 <__global_pointer$+0x7000f370>

	result = 0;
80000384:	fe042623          	sw	zero,-20(s0)
	a = 1, b = 2;
80000388:	00100713          	li	a4,1
8000038c:	80e1a823          	sw	a4,-2032(gp) # 800004a0 <a>
80000390:	00200713          	li	a4,2
80000394:	80e1a423          	sw	a4,-2040(gp) # 80000498 <b>
	while(1){
		result += a;
80000398:	8101a783          	lw	a5,-2032(gp) # 800004a0 <a>
8000039c:	fec42703          	lw	a4,-20(s0)
800003a0:	00f707b3          	add	a5,a4,a5
800003a4:	fef42623          	sw	a5,-20(s0)
		result += b + c;
800003a8:	8081a703          	lw	a4,-2040(gp) # 80000498 <b>
800003ac:	80c1a783          	lw	a5,-2036(gp) # 8000049c <c>
800003b0:	00f707b3          	add	a5,a4,a5
800003b4:	fec42703          	lw	a4,-20(s0)
800003b8:	00f707b3          	add	a5,a4,a5
800003bc:	fef42623          	sw	a5,-20(s0)
		for(uint32_t idx = 0;idx < 50000;idx++) asm volatile("");
800003c0:	fe042423          	sw	zero,-24(s0)
800003c4:	0100006f          	j	800003d4 <main+0x100>
800003c8:	fe842783          	lw	a5,-24(s0)
800003cc:	00178793          	addi	a5,a5,1
800003d0:	fef42423          	sw	a5,-24(s0)
800003d4:	fe842703          	lw	a4,-24(s0)
800003d8:	0000c7b7          	lui	a5,0xc
800003dc:	34f78793          	addi	a5,a5,847 # c34f <_stack_size+0xc14f>
800003e0:	fee7f4e3          	bleu	a4,a5,800003c8 <main+0xf4>
		GPIO_A->OUTPUT = (GPIO_A->OUTPUT & ~0x3F) | ((GPIO_A->OUTPUT + 1) & 0x3F);  //Counter on LED[5:0]
800003e4:	f00007b7          	lui	a5,0xf0000
800003e8:	0047a783          	lw	a5,4(a5) # f0000004 <__global_pointer$+0x6ffff374>
800003ec:	fc07f693          	andi	a3,a5,-64
800003f0:	f00007b7          	lui	a5,0xf0000
800003f4:	0047a783          	lw	a5,4(a5) # f0000004 <__global_pointer$+0x6ffff374>
800003f8:	00178793          	addi	a5,a5,1
800003fc:	03f7f713          	andi	a4,a5,63
80000400:	f00007b7          	lui	a5,0xf0000
80000404:	00e6e733          	or	a4,a3,a4
80000408:	00e7a223          	sw	a4,4(a5) # f0000004 <__global_pointer$+0x6ffff374>
		result += a;
8000040c:	f8dff06f          	j	80000398 <main+0xc4>

80000410 <irqCallback>:
	}
}

void irqCallback()
{
80000410:	ff010113          	addi	sp,sp,-16
80000414:	00812623          	sw	s0,12(sp)
80000418:	01010413          	addi	s0,sp,16
	if(TIMER_INTERRUPT->PENDINGS & 1){  //Timer A interrupt
8000041c:	f00207b7          	lui	a5,0xf0020
80000420:	01078793          	addi	a5,a5,16 # f0020010 <__global_pointer$+0x7001f380>
80000424:	0007a783          	lw	a5,0(a5)
80000428:	0017f793          	andi	a5,a5,1
8000042c:	04078063          	beqz	a5,8000046c <irqCallback+0x5c>
		GPIO_A->OUTPUT ^= 0x80; //Toogle led 7
80000430:	f00007b7          	lui	a5,0xf0000
80000434:	0047a703          	lw	a4,4(a5) # f0000004 <__global_pointer$+0x6ffff374>
80000438:	f00007b7          	lui	a5,0xf0000
8000043c:	08074713          	xori	a4,a4,128
80000440:	00e7a223          	sw	a4,4(a5) # f0000004 <__global_pointer$+0x6ffff374>
		TIMER_INTERRUPT->PENDINGS = 1;
80000444:	f00207b7          	lui	a5,0xf0020
80000448:	01078793          	addi	a5,a5,16 # f0020010 <__global_pointer$+0x7001f380>
8000044c:	00100713          	li	a4,1
80000450:	00e7a023          	sw	a4,0(a5)
	}
	while(UART->STATUS & (1 << 9)){ //UART RX interrupt
80000454:	0180006f          	j	8000046c <irqCallback+0x5c>
		UART->DATA = (UART->DATA) & 0xFF;
80000458:	f00107b7          	lui	a5,0xf0010
8000045c:	0007a703          	lw	a4,0(a5) # f0010000 <__global_pointer$+0x7000f370>
80000460:	f00107b7          	lui	a5,0xf0010
80000464:	0ff77713          	andi	a4,a4,255
80000468:	00e7a023          	sw	a4,0(a5) # f0010000 <__global_pointer$+0x7000f370>
	while(UART->STATUS & (1 << 9)){ //UART RX interrupt
8000046c:	f00107b7          	lui	a5,0xf0010
80000470:	0047a783          	lw	a5,4(a5) # f0010004 <__global_pointer$+0x7000f374>
80000474:	2007f793          	andi	a5,a5,512
80000478:	fe0790e3          	bnez	a5,80000458 <irqCallback+0x48>
	}
}
8000047c:	00000013          	nop
80000480:	00c12403          	lw	s0,12(sp)
80000484:	01010113          	addi	sp,sp,16
80000488:	00008067          	ret
