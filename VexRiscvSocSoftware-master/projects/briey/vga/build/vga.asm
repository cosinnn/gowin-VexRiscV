
build/vga.elf:     file format elf32-littleriscv


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
80000068:	384080e7          	jalr	900(ra) # 400003e8 <irqCallback>
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
800000b4:	c0001197          	auipc	gp,0xc0001
800000b8:	bb418193          	addi	gp,gp,-1100 # 40000c68 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000bc:	00001117          	auipc	sp,0x1
800000c0:	89410113          	addi	sp,sp,-1900 # 80000950 <_stack_start>

800000c4 <bss_init>:

bss_init:
  la a0, _bss_start
800000c4:	c0000517          	auipc	a0,0xc0000
800000c8:	3a450513          	addi	a0,a0,932 # 40000468 <_bss_end>
  la a1, _bss_end
800000cc:	c0000597          	auipc	a1,0xc0000
800000d0:	39c58593          	addi	a1,a1,924 # 40000468 <_bss_end>

800000d4 <bss_loop>:
bss_loop:
  beq a0,a1,bss_done
800000d4:	00b50863          	beq	a0,a1,800000e4 <bss_done>
  sw zero,0(a0)
800000d8:	00052023          	sw	zero,0(a0)
  add a0,a0,4
800000dc:	00450513          	addi	a0,a0,4
  j bss_loop
800000e0:	ff5ff06f          	j	800000d4 <bss_loop>

800000e4 <bss_done>:
bss_done:

ctors_init:
  la a0, _ctors_start
800000e4:	c0000517          	auipc	a0,0xc0000
800000e8:	38050513          	addi	a0,a0,896 # 40000464 <_ctors_end>
  addi sp,sp,-4
800000ec:	ffc10113          	addi	sp,sp,-4

800000f0 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000f0:	c0000597          	auipc	a1,0xc0000
800000f4:	37458593          	addi	a1,a1,884 # 40000464 <_ctors_end>
  beq a0,a1,ctors_done
800000f8:	00b50e63          	beq	a0,a1,80000114 <ctors_done>
  lw a3,0(a0)
800000fc:	00052683          	lw	a3,0(a0)
  add a0,a0,4
80000100:	00450513          	addi	a0,a0,4
  sw a0,0(sp)
80000104:	00a12023          	sw	a0,0(sp)
  jalr  a3
80000108:	000680e7          	jalr	a3
  lw a0,0(sp)
8000010c:	00012503          	lw	a0,0(sp)
  j ctors_loop
80000110:	fe1ff06f          	j	800000f0 <ctors_loop>

80000114 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000114:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
80000118:	00001537          	lui	a0,0x1
8000011c:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x80>
  csrw mie,a0
80000120:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
80000124:	00002537          	lui	a0,0x2
80000128:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1008>
  csrw mstatus,a0
8000012c:	30051073          	csrw	mstatus,a0

  call main
80000130:	c0000097          	auipc	ra,0xc0000
80000134:	108080e7          	jalr	264(ra) # 40000238 <main>

80000138 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000138:	0000006f          	j	80000138 <infinitLoop>

8000013c <flushDataCache>:

.section .text
.globl flushDataCache
.type flushDataCache, @function
flushDataCache:
  li a0, 4096
8000013c:	00001537          	lui	a0,0x1

80000140 <flushDataCacheLoop>:
flushDataCacheLoop:
  ADDI a0,a0,-32
80000140:	fe050513          	addi	a0,a0,-32 # fe0 <_stack_size+0x7e0>
80000144:	7005500f          	0x7005500f
  dataFlush(a0)
  bnez a0, flushDataCacheLoop
80000148:	fe051ce3          	bnez	a0,80000140 <flushDataCacheLoop>
  ret
8000014c:	00008067          	ret

Disassembly of section .memory:

40000000 <timer_init>:
  volatile uint32_t CLEARS_TICKS;
  volatile uint32_t LIMIT;
  volatile uint32_t VALUE;
} Timer_Reg;

static void timer_init(Timer_Reg *reg){
40000000:	fe010113          	addi	sp,sp,-32
40000004:	00812e23          	sw	s0,28(sp)
40000008:	02010413          	addi	s0,sp,32
4000000c:	fea42623          	sw	a0,-20(s0)
	reg->CLEARS_TICKS  = 0;
40000010:	fec42783          	lw	a5,-20(s0)
40000014:	0007a023          	sw	zero,0(a5)
	reg->VALUE = 0;
40000018:	fec42783          	lw	a5,-20(s0)
4000001c:	0007a423          	sw	zero,8(a5)
}
40000020:	00000013          	nop
40000024:	01c12403          	lw	s0,28(sp)
40000028:	02010113          	addi	sp,sp,32
4000002c:	00008067          	ret

40000030 <prescaler_init>:
typedef struct
{
  volatile uint32_t LIMIT;
} Prescaler_Reg;

static void prescaler_init(Prescaler_Reg* reg){
40000030:	fe010113          	addi	sp,sp,-32
40000034:	00812e23          	sw	s0,28(sp)
40000038:	02010413          	addi	s0,sp,32
4000003c:	fea42623          	sw	a0,-20(s0)

}
40000040:	00000013          	nop
40000044:	01c12403          	lw	s0,28(sp)
40000048:	02010113          	addi	sp,sp,32
4000004c:	00008067          	ret

40000050 <interruptCtrl_init>:
{
  volatile uint32_t PENDINGS;
  volatile uint32_t MASKS;
} InterruptCtrl_Reg;

static void interruptCtrl_init(InterruptCtrl_Reg* reg){
40000050:	fe010113          	addi	sp,sp,-32
40000054:	00812e23          	sw	s0,28(sp)
40000058:	02010413          	addi	s0,sp,32
4000005c:	fea42623          	sw	a0,-20(s0)
	reg->MASKS = 0;
40000060:	fec42783          	lw	a5,-20(s0)
40000064:	0007a223          	sw	zero,4(a5)
	reg->PENDINGS = 0xFFFFFFFF;
40000068:	fec42783          	lw	a5,-20(s0)
4000006c:	fff00713          	li	a4,-1
40000070:	00e7a023          	sw	a4,0(a5)
}
40000074:	00000013          	nop
40000078:	01c12403          	lw	s0,28(sp)
4000007c:	02010113          	addi	sp,sp,32
40000080:	00008067          	ret

40000084 <uart_writeAvailability>:
	enum UartParity parity;
	enum UartStop stop;
	uint32_t clockDivider;
} Uart_Config;

static uint32_t uart_writeAvailability(Uart_Reg *reg){
40000084:	fe010113          	addi	sp,sp,-32
40000088:	00812e23          	sw	s0,28(sp)
4000008c:	02010413          	addi	s0,sp,32
40000090:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS >> 16) & 0xFF;
40000094:	fec42783          	lw	a5,-20(s0)
40000098:	0047a783          	lw	a5,4(a5)
4000009c:	0107d793          	srli	a5,a5,0x10
400000a0:	0ff7f793          	andi	a5,a5,255
}
400000a4:	00078513          	mv	a0,a5
400000a8:	01c12403          	lw	s0,28(sp)
400000ac:	02010113          	addi	sp,sp,32
400000b0:	00008067          	ret

400000b4 <uart_readOccupancy>:
static uint32_t uart_readOccupancy(Uart_Reg *reg){
400000b4:	fe010113          	addi	sp,sp,-32
400000b8:	00812e23          	sw	s0,28(sp)
400000bc:	02010413          	addi	s0,sp,32
400000c0:	fea42623          	sw	a0,-20(s0)
	return reg->STATUS >> 24;
400000c4:	fec42783          	lw	a5,-20(s0)
400000c8:	0047a783          	lw	a5,4(a5)
400000cc:	0187d793          	srli	a5,a5,0x18
}
400000d0:	00078513          	mv	a0,a5
400000d4:	01c12403          	lw	s0,28(sp)
400000d8:	02010113          	addi	sp,sp,32
400000dc:	00008067          	ret

400000e0 <uart_write>:

static void uart_write(Uart_Reg *reg, uint32_t data){
400000e0:	fe010113          	addi	sp,sp,-32
400000e4:	00112e23          	sw	ra,28(sp)
400000e8:	00812c23          	sw	s0,24(sp)
400000ec:	02010413          	addi	s0,sp,32
400000f0:	fea42623          	sw	a0,-20(s0)
400000f4:	feb42423          	sw	a1,-24(s0)
	while(uart_writeAvailability(reg) == 0);
400000f8:	00000013          	nop
400000fc:	fec42503          	lw	a0,-20(s0)
40000100:	f85ff0ef          	jal	ra,40000084 <uart_writeAvailability>
40000104:	00050793          	mv	a5,a0
40000108:	fe078ae3          	beqz	a5,400000fc <uart_write+0x1c>
	reg->DATA = data;
4000010c:	fec42783          	lw	a5,-20(s0)
40000110:	fe842703          	lw	a4,-24(s0)
40000114:	00e7a023          	sw	a4,0(a5)
}
40000118:	00000013          	nop
4000011c:	01c12083          	lw	ra,28(sp)
40000120:	01812403          	lw	s0,24(sp)
40000124:	02010113          	addi	sp,sp,32
40000128:	00008067          	ret

4000012c <uart_applyConfig>:

static void uart_applyConfig(Uart_Reg *reg, Uart_Config *config){
4000012c:	fe010113          	addi	sp,sp,-32
40000130:	00812e23          	sw	s0,28(sp)
40000134:	02010413          	addi	s0,sp,32
40000138:	fea42623          	sw	a0,-20(s0)
4000013c:	feb42423          	sw	a1,-24(s0)
	reg->CLOCK_DIVIDER = config->clockDivider;
40000140:	fe842783          	lw	a5,-24(s0)
40000144:	00c7a703          	lw	a4,12(a5)
40000148:	fec42783          	lw	a5,-20(s0)
4000014c:	00e7a423          	sw	a4,8(a5)
	reg->FRAME_CONFIG = ((config->dataLength-1) << 0) | (config->parity << 8) | (config->stop << 16);
40000150:	fe842783          	lw	a5,-24(s0)
40000154:	0007a783          	lw	a5,0(a5)
40000158:	fff78713          	addi	a4,a5,-1
4000015c:	fe842783          	lw	a5,-24(s0)
40000160:	0047a783          	lw	a5,4(a5)
40000164:	00879793          	slli	a5,a5,0x8
40000168:	00f76733          	or	a4,a4,a5
4000016c:	fe842783          	lw	a5,-24(s0)
40000170:	0087a783          	lw	a5,8(a5)
40000174:	01079793          	slli	a5,a5,0x10
40000178:	00f76733          	or	a4,a4,a5
4000017c:	fec42783          	lw	a5,-20(s0)
40000180:	00e7a623          	sw	a4,12(a5)
}
40000184:	00000013          	nop
40000188:	01c12403          	lw	s0,28(sp)
4000018c:	02010113          	addi	sp,sp,32
40000190:	00008067          	ret

40000194 <vga_isBusy>:
  volatile uint32_t  FRAME_BASE;
  volatile uint32_t  DUMMY0[13];
  volatile Vga_Timing TIMING;
} Vga_Reg;

static uint32_t vga_isBusy(Vga_Reg *reg){
40000194:	fe010113          	addi	sp,sp,-32
40000198:	00812e23          	sw	s0,28(sp)
4000019c:	02010413          	addi	s0,sp,32
400001a0:	fea42623          	sw	a0,-20(s0)
	return (reg->STATUS & 2) != 0;
400001a4:	fec42783          	lw	a5,-20(s0)
400001a8:	0007a783          	lw	a5,0(a5)
400001ac:	0027f793          	andi	a5,a5,2
400001b0:	00f037b3          	snez	a5,a5
400001b4:	0ff7f793          	andi	a5,a5,255
}
400001b8:	00078513          	mv	a0,a5
400001bc:	01c12403          	lw	s0,28(sp)
400001c0:	02010113          	addi	sp,sp,32
400001c4:	00008067          	ret

400001c8 <vga_run>:

static void vga_run(Vga_Reg *reg){
400001c8:	fe010113          	addi	sp,sp,-32
400001cc:	00812e23          	sw	s0,28(sp)
400001d0:	02010413          	addi	s0,sp,32
400001d4:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 1;
400001d8:	fec42783          	lw	a5,-20(s0)
400001dc:	00100713          	li	a4,1
400001e0:	00e7a023          	sw	a4,0(a5)
}
400001e4:	00000013          	nop
400001e8:	01c12403          	lw	s0,28(sp)
400001ec:	02010113          	addi	sp,sp,32
400001f0:	00008067          	ret

400001f4 <vga_stop>:

static void vga_stop(Vga_Reg *reg){
400001f4:	fe010113          	addi	sp,sp,-32
400001f8:	00112e23          	sw	ra,28(sp)
400001fc:	00812c23          	sw	s0,24(sp)
40000200:	02010413          	addi	s0,sp,32
40000204:	fea42623          	sw	a0,-20(s0)
	reg->STATUS  = 0;
40000208:	fec42783          	lw	a5,-20(s0)
4000020c:	0007a023          	sw	zero,0(a5)
	while(vga_isBusy(reg));
40000210:	00000013          	nop
40000214:	fec42503          	lw	a0,-20(s0)
40000218:	f7dff0ef          	jal	ra,40000194 <vga_isBusy>
4000021c:	00050793          	mv	a5,a0
40000220:	fe079ae3          	bnez	a5,40000214 <vga_stop+0x20>
}
40000224:	00000013          	nop
40000228:	01c12083          	lw	ra,28(sp)
4000022c:	01812403          	lw	s0,24(sp)
40000230:	02010113          	addi	sp,sp,32
40000234:	00008067          	ret

40000238 <main>:

__attribute__ ((section (".noinit"))) __attribute__ ((aligned (4*8))) uint16_t vgaFramebuffer[RES_Y][RES_X];

extern void flushDataCache(uint32_t dummy);

int main() {
40000238:	fc010113          	addi	sp,sp,-64
4000023c:	02112e23          	sw	ra,60(sp)
40000240:	02812c23          	sw	s0,56(sp)
40000244:	04010413          	addi	s0,sp,64
	Uart_Config uartConfig;
	uartConfig.dataLength = 8;
40000248:	00800793          	li	a5,8
4000024c:	fcf42623          	sw	a5,-52(s0)
	uartConfig.parity = NONE;
40000250:	fc042823          	sw	zero,-48(s0)
	uartConfig.stop = ONE;
40000254:	fc042a23          	sw	zero,-44(s0)
	uartConfig.clockDivider = 50000000/8/115200-1;
40000258:	03500793          	li	a5,53
4000025c:	fcf42c23          	sw	a5,-40(s0)
	uart_applyConfig(UART,&uartConfig);
40000260:	fcc40793          	addi	a5,s0,-52
40000264:	00078593          	mv	a1,a5
40000268:	f0010537          	lui	a0,0xf0010
4000026c:	ec1ff0ef          	jal	ra,4000012c <uart_applyConfig>


    vga_stop(VGA_BASE);
40000270:	f0030537          	lui	a0,0xf0030
40000274:	f81ff0ef          	jal	ra,400001f4 <vga_stop>
    VGA_BASE->TIMING = vga_h640_v480_r60;  // vga_simRes   vga_h640_v480_r60 vga_simRes_h160_v120
40000278:	f00307b7          	lui	a5,0xf0030
4000027c:	40000737          	lui	a4,0x40000
40000280:	40472303          	lw	t1,1028(a4) # 40000404 <end>
40000284:	40470693          	addi	a3,a4,1028
40000288:	0046a883          	lw	a7,4(a3)
4000028c:	40470693          	addi	a3,a4,1028
40000290:	0086a803          	lw	a6,8(a3)
40000294:	40470693          	addi	a3,a4,1028
40000298:	00c6a503          	lw	a0,12(a3)
4000029c:	40470693          	addi	a3,a4,1028
400002a0:	0106a583          	lw	a1,16(a3)
400002a4:	40470693          	addi	a3,a4,1028
400002a8:	0146a603          	lw	a2,20(a3)
400002ac:	40470693          	addi	a3,a4,1028
400002b0:	0186a683          	lw	a3,24(a3)
400002b4:	40470713          	addi	a4,a4,1028
400002b8:	01c72703          	lw	a4,28(a4)
400002bc:	0467a023          	sw	t1,64(a5) # f0030040 <_stack_start+0x7002f6f0>
400002c0:	0517a223          	sw	a7,68(a5)
400002c4:	0507a423          	sw	a6,72(a5)
400002c8:	04a7a623          	sw	a0,76(a5)
400002cc:	04b7a823          	sw	a1,80(a5)
400002d0:	04c7aa23          	sw	a2,84(a5)
400002d4:	04d7ac23          	sw	a3,88(a5)
400002d8:	04e7ae23          	sw	a4,92(a5)
    VGA_BASE->FRAME_SIZE = RES_X*RES_Y*2-1;
400002dc:	f00307b7          	lui	a5,0xf0030
400002e0:	00096737          	lui	a4,0x96
400002e4:	fff70713          	addi	a4,a4,-1 # 95fff <_stack_size+0x957ff>
400002e8:	00e7a223          	sw	a4,4(a5) # f0030004 <_stack_start+0x7002f6b4>
    VGA_BASE->FRAME_BASE = (uint32_t)vgaFramebuffer;
400002ec:	f00307b7          	lui	a5,0xf0030
400002f0:	40000737          	lui	a4,0x40000
400002f4:	48070713          	addi	a4,a4,1152 # 40000480 <vgaFramebuffer>
400002f8:	00e7a423          	sw	a4,8(a5) # f0030008 <_stack_start+0x7002f6b8>
    vga_run(VGA_BASE);
400002fc:	f0030537          	lui	a0,0xf0030
40000300:	ec9ff0ef          	jal	ra,400001c8 <vga_run>

    uint16_t offset = 0;
40000304:	fe041723          	sh	zero,-18(s0)
    while(1){
    	uint16_t *ptr = &vgaFramebuffer[0][0];
40000308:	400007b7          	lui	a5,0x40000
4000030c:	48078793          	addi	a5,a5,1152 # 40000480 <vgaFramebuffer>
40000310:	fef42423          	sw	a5,-24(s0)
    	for(uint32_t y = 0;y < RES_Y;y++){
40000314:	fe042223          	sw	zero,-28(s0)
40000318:	09c0006f          	j	400003b4 <main+0x17c>
    		uint16_t c = (((y + offset) & 0x1F) << 6);
4000031c:	fe442783          	lw	a5,-28(s0)
40000320:	01079713          	slli	a4,a5,0x10
40000324:	01075713          	srli	a4,a4,0x10
40000328:	fee45783          	lhu	a5,-18(s0)
4000032c:	00f707b3          	add	a5,a4,a5
40000330:	01079793          	slli	a5,a5,0x10
40000334:	0107d793          	srli	a5,a5,0x10
40000338:	00679793          	slli	a5,a5,0x6
4000033c:	01079793          	slli	a5,a5,0x10
40000340:	0107d793          	srli	a5,a5,0x10
40000344:	7c07f793          	andi	a5,a5,1984
40000348:	fcf41f23          	sh	a5,-34(s0)
        	for(uint32_t x = 0;x < RES_X;x++){
4000034c:	fe042023          	sw	zero,-32(s0)
40000350:	04c0006f          	j	4000039c <main+0x164>
        		*ptr = ((uint16_t)(x & 0x1F)) + c;
40000354:	fe042783          	lw	a5,-32(s0)
40000358:	01079793          	slli	a5,a5,0x10
4000035c:	0107d793          	srli	a5,a5,0x10
40000360:	01f7f793          	andi	a5,a5,31
40000364:	01079713          	slli	a4,a5,0x10
40000368:	01075713          	srli	a4,a4,0x10
4000036c:	fde45783          	lhu	a5,-34(s0)
40000370:	00f707b3          	add	a5,a4,a5
40000374:	01079713          	slli	a4,a5,0x10
40000378:	01075713          	srli	a4,a4,0x10
4000037c:	fe842783          	lw	a5,-24(s0)
40000380:	00e79023          	sh	a4,0(a5)
        		ptr++;
40000384:	fe842783          	lw	a5,-24(s0)
40000388:	00278793          	addi	a5,a5,2
4000038c:	fef42423          	sw	a5,-24(s0)
        	for(uint32_t x = 0;x < RES_X;x++){
40000390:	fe042783          	lw	a5,-32(s0)
40000394:	00178793          	addi	a5,a5,1
40000398:	fef42023          	sw	a5,-32(s0)
4000039c:	fe042703          	lw	a4,-32(s0)
400003a0:	27f00793          	li	a5,639
400003a4:	fae7f8e3          	bleu	a4,a5,40000354 <main+0x11c>
    	for(uint32_t y = 0;y < RES_Y;y++){
400003a8:	fe442783          	lw	a5,-28(s0)
400003ac:	00178793          	addi	a5,a5,1
400003b0:	fef42223          	sw	a5,-28(s0)
400003b4:	fe442703          	lw	a4,-28(s0)
400003b8:	1df00793          	li	a5,479
400003bc:	f6e7f0e3          	bleu	a4,a5,4000031c <main+0xe4>
        	}
    	}
    	offset+=4;
400003c0:	fee45783          	lhu	a5,-18(s0)
400003c4:	00478793          	addi	a5,a5,4
400003c8:	fef41723          	sh	a5,-18(s0)
    	flushDataCache(0);
400003cc:	00000513          	li	a0,0
400003d0:	40000097          	auipc	ra,0x40000
400003d4:	d6c080e7          	jalr	-660(ra) # 8000013c <flushDataCache>
    	uart_write(UART, '\n');
400003d8:	00a00593          	li	a1,10
400003dc:	f0010537          	lui	a0,0xf0010
400003e0:	d01ff0ef          	jal	ra,400000e0 <uart_write>
    while(1){
400003e4:	f25ff06f          	j	40000308 <main+0xd0>

400003e8 <irqCallback>:
    }
}


void irqCallback(){
400003e8:	ff010113          	addi	sp,sp,-16
400003ec:	00812623          	sw	s0,12(sp)
400003f0:	01010413          	addi	s0,sp,16

}
400003f4:	00000013          	nop
400003f8:	00c12403          	lw	s0,12(sp)
400003fc:	01010113          	addi	sp,sp,16
40000400:	00008067          	ret
