
build/hello_world.elf:     file format elf32-littleriscv


Disassembly of section ._vector:

80000000 <crtStart>:

    .section	.start_jump,"ax",@progbits
crtStart:
  //long jump to allow crtInit to be anywhere
  //do it always in 12 bytes
  lui x2,       %hi(crtInit)
80000000:	80000137          	lui	sp,0x80000
  addi x2, x2,  %lo(crtInit)
80000004:	0b010113          	addi	sp,sp,176 # 800000b0 <__global_pointer$+0xfffff658>
  jalr x1,x2
80000008:	000100e7          	jalr	sp
  nop
8000000c:	00000013          	nop
	...

80000020 <trap_entry>:
.section .text

.global  trap_entry
.align 5
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
80000064:	270000ef          	jal	ra,800002d4 <irqCallback>
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
800000b0:	00001197          	auipc	gp,0x1
800000b4:	9a818193          	addi	gp,gp,-1624 # 80000a58 <__global_pointer$>
  .option pop
  la sp, _stack_start
800000b8:	00000117          	auipc	sp,0x0
800000bc:	18810113          	addi	sp,sp,392 # 80000240 <_stack_start>

800000c0 <bss_init>:

bss_init:
  la a0, _bss_start
800000c0:	00000517          	auipc	a0,0x0
800000c4:	19850513          	addi	a0,a0,408 # 80000258 <_bss_end>
  la a1, _bss_end
800000c8:	00000597          	auipc	a1,0x0
800000cc:	19058593          	addi	a1,a1,400 # 80000258 <_bss_end>

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
800000e0:	92818513          	addi	a0,gp,-1752 # 80000380 <_ctors_end>
  addi sp,sp,-4
800000e4:	ffc10113          	addi	sp,sp,-4

800000e8 <ctors_loop>:
ctors_loop:
  la a1, _ctors_end
800000e8:	92818593          	addi	a1,gp,-1752 # 80000380 <_ctors_end>
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
80000104:	fe5ff06f          	j	800000e8 <ctors_loop>

80000108 <ctors_done>:
ctors_done:
  addi sp,sp,4
80000108:	00410113          	addi	sp,sp,4


  li a0, 0x880     //880 enable timer + external interrupts
8000010c:	00001537          	lui	a0,0x1
80000110:	88050513          	addi	a0,a0,-1920 # 880 <_stack_size+0x780>
  csrw mie,a0
80000114:	30451073          	csrw	mie,a0
  li a0, 0x1808     //1808 enable interrupts
80000118:	00002537          	lui	a0,0x2
8000011c:	80850513          	addi	a0,a0,-2040 # 1808 <_stack_size+0x1708>
  csrw mstatus,a0
80000120:	30051073          	csrw	mstatus,a0

  call main
80000124:	1b4000ef          	jal	ra,800002d8 <end>

80000128 <infinitLoop>:
infinitLoop:
  j infinitLoop
80000128:	0000006f          	j	80000128 <infinitLoop>
	...

Disassembly of section .memory:

80000258 <print>:
	enum UartStop stop;
	uint32_t clockDivider;
} Uart_Config;

static uint32_t uart_writeAvailability(Uart_Reg *reg){
	return (reg->STATUS >> 16) & 0xFF;
80000258:	f00106b7          	lui	a3,0xf0010
#include <stdint.h>

#include "murax.h"

void print(const char*str){
	while(*str){
8000025c:	00054703          	lbu	a4,0(a0)
80000260:	00071463          	bnez	a4,80000268 <print+0x10>
		uart_write(UART,*str);
		str++;
	}
}
80000264:	00008067          	ret
80000268:	0046a783          	lw	a5,4(a3) # f0010004 <__global_pointer$+0x7000f5ac>
8000026c:	0107d793          	srli	a5,a5,0x10
80000270:	0ff7f793          	andi	a5,a5,255
static uint32_t uart_readOccupancy(Uart_Reg *reg){
	return reg->STATUS >> 24;
}

static void uart_write(Uart_Reg *reg, uint32_t data){
	while(uart_writeAvailability(reg) == 0);
80000274:	fe078ae3          	beqz	a5,80000268 <print+0x10>
	reg->DATA = data;
80000278:	00e6a023          	sw	a4,0(a3)
		str++;
8000027c:	00150513          	addi	a0,a0,1
80000280:	fddff06f          	j	8000025c <print+0x4>

80000284 <println>:
void println(const char*str){
80000284:	ff010113          	addi	sp,sp,-16
80000288:	00112623          	sw	ra,12(sp)
	print(str);
8000028c:	fcdff0ef          	jal	ra,80000258 <print>
	return (reg->STATUS >> 16) & 0xFF;
80000290:	f0010737          	lui	a4,0xf0010
80000294:	00472783          	lw	a5,4(a4) # f0010004 <__global_pointer$+0x7000f5ac>
80000298:	0107d793          	srli	a5,a5,0x10
8000029c:	0ff7f793          	andi	a5,a5,255
	while(uart_writeAvailability(reg) == 0);
800002a0:	fe078ae3          	beqz	a5,80000294 <println+0x10>
	reg->DATA = data;
800002a4:	00a00793          	li	a5,10
800002a8:	00f72023          	sw	a5,0(a4)
	uart_write(UART,'\n');
}
800002ac:	00c12083          	lw	ra,12(sp)
800002b0:	01010113          	addi	sp,sp,16
800002b4:	00008067          	ret

800002b8 <delay>:

void delay(uint32_t loops){
	for(int i=0;i<loops;i++){
800002b8:	00000793          	li	a5,0
		int tmp = GPIO_A->OUTPUT;
800002bc:	f0000737          	lui	a4,0xf0000
	for(int i=0;i<loops;i++){
800002c0:	00a79463          	bne	a5,a0,800002c8 <delay+0x10>
	}
}
800002c4:	00008067          	ret
		int tmp = GPIO_A->OUTPUT;
800002c8:	00472683          	lw	a3,4(a4) # f0000004 <__global_pointer$+0x6ffff5ac>
	for(int i=0;i<loops;i++){
800002cc:	00178793          	addi	a5,a5,1
800002d0:	ff1ff06f          	j	800002c0 <delay+0x8>

800002d4 <irqCallback>:
		}
    }
}

void irqCallback(){
}
800002d4:	00008067          	ret

Disassembly of section .text.startup:

800002d8 <main>:
void main() {
800002d8:	fe010113          	addi	sp,sp,-32
800002dc:	00812c23          	sw	s0,24(sp)
800002e0:	00912a23          	sw	s1,20(sp)
800002e4:	01212823          	sw	s2,16(sp)
800002e8:	01312623          	sw	s3,12(sp)
800002ec:	01412423          	sw	s4,8(sp)
800002f0:	01512223          	sw	s5,4(sp)
800002f4:	00112e23          	sw	ra,28(sp)
    GPIO_A->OUTPUT_ENABLE = 0x0000000F;
800002f8:	f00007b7          	lui	a5,0xf0000
800002fc:	00f00713          	li	a4,15
80000300:	00e7a423          	sw	a4,8(a5) # f0000008 <__global_pointer$+0x6ffff5b0>
    println("hello world arty a7 v1");
80000304:	80000537          	lui	a0,0x80000
	GPIO_A->OUTPUT = 0x00000001;
80000308:	00100713          	li	a4,1
8000030c:	00e7a223          	sw	a4,4(a5)
    println("hello world arty a7 v1");
80000310:	24050513          	addi	a0,a0,576 # 80000240 <__global_pointer$+0xfffff7e8>
    		delay(nloops);
80000314:	001e8437          	lui	s0,0x1e8
    println("hello world arty a7 v1");
80000318:	f6dff0ef          	jal	ra,80000284 <println>
    		GPIO_A->OUTPUT = 1<<i;
8000031c:	f00004b7          	lui	s1,0xf0000
80000320:	00100a93          	li	s5,1
    		delay(nloops);
80000324:	48040413          	addi	s0,s0,1152 # 1e8480 <_stack_size+0x1e8380>
    		GPIO_A->OUTPUT = 1<<i;
80000328:	00200913          	li	s2,2
8000032c:	00400993          	li	s3,4
			GPIO_A->OUTPUT = (1<<(nleds-1))>>i;
80000330:	00800a13          	li	s4,8
    		delay(nloops);
80000334:	00040513          	mv	a0,s0
    		GPIO_A->OUTPUT = 1<<i;
80000338:	0154a223          	sw	s5,4(s1) # f0000004 <__global_pointer$+0x6ffff5ac>
    		delay(nloops);
8000033c:	f7dff0ef          	jal	ra,800002b8 <delay>
80000340:	00040513          	mv	a0,s0
    		GPIO_A->OUTPUT = 1<<i;
80000344:	0124a223          	sw	s2,4(s1)
    		delay(nloops);
80000348:	f71ff0ef          	jal	ra,800002b8 <delay>
8000034c:	00040513          	mv	a0,s0
    		GPIO_A->OUTPUT = 1<<i;
80000350:	0134a223          	sw	s3,4(s1)
    		delay(nloops);
80000354:	f65ff0ef          	jal	ra,800002b8 <delay>
			delay(nloops);
80000358:	00040513          	mv	a0,s0
			GPIO_A->OUTPUT = (1<<(nleds-1))>>i;
8000035c:	0144a223          	sw	s4,4(s1)
			delay(nloops);
80000360:	f59ff0ef          	jal	ra,800002b8 <delay>
80000364:	00040513          	mv	a0,s0
			GPIO_A->OUTPUT = (1<<(nleds-1))>>i;
80000368:	0134a223          	sw	s3,4(s1)
			delay(nloops);
8000036c:	f4dff0ef          	jal	ra,800002b8 <delay>
80000370:	00040513          	mv	a0,s0
			GPIO_A->OUTPUT = (1<<(nleds-1))>>i;
80000374:	0124a223          	sw	s2,4(s1)
			delay(nloops);
80000378:	f41ff0ef          	jal	ra,800002b8 <delay>
8000037c:	fb9ff06f          	j	80000334 <main+0x5c>
