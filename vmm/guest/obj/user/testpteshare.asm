
vmm/guest/obj/user/testpteshare:     file format elf64-x86-64


Disassembly of section .text:

0000000000800020 <_start>:
// starts us running when we are initially loaded into a new environment.
.text
.globl _start
_start:
	// See if we were started with arguments on the stack
	movabs $USTACKTOP, %rax
  800020:	48 b8 00 e0 7f ef 00 	movabs $0xef7fe000,%rax
  800027:	00 00 00 
	cmpq %rax,%rsp
  80002a:	48 39 c4             	cmp    %rax,%rsp
	jne args_exist
  80002d:	75 04                	jne    800033 <args_exist>

	// If not, push dummy argc/argv arguments.
	// This happens when we are loaded by the kernel,
	// because the kernel does not know about passing arguments.
	pushq $0
  80002f:	6a 00                	pushq  $0x0
	pushq $0
  800031:	6a 00                	pushq  $0x0

0000000000800033 <args_exist>:

args_exist:
	movq 8(%rsp), %rsi
  800033:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
	movq (%rsp), %rdi
  800038:	48 8b 3c 24          	mov    (%rsp),%rdi
	call libmain
  80003c:	e8 69 02 00 00       	callq  8002aa <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  800056:	74 0c                	je     800064 <umain+0x21>
  800058:	48 b8 76 02 80 00 00 	movabs $0x800276,%rax
  80005f:	00 00 00 
  800062:	ff d0                	callq  *%rax
  800064:	ba 07 04 00 00       	mov    $0x407,%edx
  800069:	be 00 00 00 a0       	mov    $0xa0000000,%esi
  80006e:	bf 00 00 00 00       	mov    $0x0,%edi
  800073:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  80007a:	00 00 00 
  80007d:	ff d0                	callq  *%rax
  80007f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800082:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800086:	79 30                	jns    8000b8 <umain+0x75>
  800088:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80008b:	89 c1                	mov    %eax,%ecx
  80008d:	48 ba 3e 55 80 00 00 	movabs $0x80553e,%rdx
  800094:	00 00 00 
  800097:	be 14 00 00 00       	mov    $0x14,%esi
  80009c:	48 bf 51 55 80 00 00 	movabs $0x805551,%rdi
  8000a3:	00 00 00 
  8000a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ab:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  8000b2:	00 00 00 
  8000b5:	41 ff d0             	callq  *%r8
  8000b8:	48 b8 e9 21 80 00 00 	movabs $0x8021e9,%rax
  8000bf:	00 00 00 
  8000c2:	ff d0                	callq  *%rax
  8000c4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000c7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000cb:	79 30                	jns    8000fd <umain+0xba>
  8000cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000d0:	89 c1                	mov    %eax,%ecx
  8000d2:	48 ba 68 55 80 00 00 	movabs $0x805568,%rdx
  8000d9:	00 00 00 
  8000dc:	be 18 00 00 00       	mov    $0x18,%esi
  8000e1:	48 bf 51 55 80 00 00 	movabs $0x805551,%rdi
  8000e8:	00 00 00 
  8000eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f0:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  8000f7:	00 00 00 
  8000fa:	41 ff d0             	callq  *%r8
  8000fd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800101:	75 2d                	jne    800130 <umain+0xed>
  800103:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80010a:	00 00 00 
  80010d:	48 8b 00             	mov    (%rax),%rax
  800110:	48 89 c6             	mov    %rax,%rsi
  800113:	bf 00 00 00 a0       	mov    $0xa0000000,%edi
  800118:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  80011f:	00 00 00 
  800122:	ff d0                	callq  *%rax
  800124:	48 b8 2e 03 80 00 00 	movabs $0x80032e,%rax
  80012b:	00 00 00 
  80012e:	ff d0                	callq  *%rax
  800130:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800133:	89 c7                	mov    %eax,%edi
  800135:	48 b8 c8 4d 80 00 00 	movabs $0x804dc8,%rax
  80013c:	00 00 00 
  80013f:	ff d0                	callq  *%rax
  800141:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  800148:	00 00 00 
  80014b:	48 8b 00             	mov    (%rax),%rax
  80014e:	48 89 c6             	mov    %rax,%rsi
  800151:	bf 00 00 00 a0       	mov    $0xa0000000,%edi
  800156:	48 b8 7e 12 80 00 00 	movabs $0x80127e,%rax
  80015d:	00 00 00 
  800160:	ff d0                	callq  *%rax
  800162:	85 c0                	test   %eax,%eax
  800164:	75 0c                	jne    800172 <umain+0x12f>
  800166:	48 b8 71 55 80 00 00 	movabs $0x805571,%rax
  80016d:	00 00 00 
  800170:	eb 0a                	jmp    80017c <umain+0x139>
  800172:	48 b8 77 55 80 00 00 	movabs $0x805577,%rax
  800179:	00 00 00 
  80017c:	48 89 c6             	mov    %rax,%rsi
  80017f:	48 bf 7d 55 80 00 00 	movabs $0x80557d,%rdi
  800186:	00 00 00 
  800189:	b8 00 00 00 00       	mov    $0x0,%eax
  80018e:	48 ba 8c 05 80 00 00 	movabs $0x80058c,%rdx
  800195:	00 00 00 
  800198:	ff d2                	callq  *%rdx
  80019a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80019f:	48 ba 98 55 80 00 00 	movabs $0x805598,%rdx
  8001a6:	00 00 00 
  8001a9:	48 be 9c 55 80 00 00 	movabs $0x80559c,%rsi
  8001b0:	00 00 00 
  8001b3:	48 bf a9 55 80 00 00 	movabs $0x8055a9,%rdi
  8001ba:	00 00 00 
  8001bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8001c2:	49 b8 eb 37 80 00 00 	movabs $0x8037eb,%r8
  8001c9:	00 00 00 
  8001cc:	41 ff d0             	callq  *%r8
  8001cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8001d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001d6:	79 30                	jns    800208 <umain+0x1c5>
  8001d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001db:	89 c1                	mov    %eax,%ecx
  8001dd:	48 ba bb 55 80 00 00 	movabs $0x8055bb,%rdx
  8001e4:	00 00 00 
  8001e7:	be 22 00 00 00       	mov    $0x22,%esi
  8001ec:	48 bf 51 55 80 00 00 	movabs $0x805551,%rdi
  8001f3:	00 00 00 
  8001f6:	b8 00 00 00 00       	mov    $0x0,%eax
  8001fb:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  800202:	00 00 00 
  800205:	41 ff d0             	callq  *%r8
  800208:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80020b:	89 c7                	mov    %eax,%edi
  80020d:	48 b8 c8 4d 80 00 00 	movabs $0x804dc8,%rax
  800214:	00 00 00 
  800217:	ff d0                	callq  *%rax
  800219:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800220:	00 00 00 
  800223:	48 8b 00             	mov    (%rax),%rax
  800226:	48 89 c6             	mov    %rax,%rsi
  800229:	bf 00 00 00 a0       	mov    $0xa0000000,%edi
  80022e:	48 b8 7e 12 80 00 00 	movabs $0x80127e,%rax
  800235:	00 00 00 
  800238:	ff d0                	callq  *%rax
  80023a:	85 c0                	test   %eax,%eax
  80023c:	75 0c                	jne    80024a <umain+0x207>
  80023e:	48 b8 71 55 80 00 00 	movabs $0x805571,%rax
  800245:	00 00 00 
  800248:	eb 0a                	jmp    800254 <umain+0x211>
  80024a:	48 b8 77 55 80 00 00 	movabs $0x805577,%rax
  800251:	00 00 00 
  800254:	48 89 c6             	mov    %rax,%rsi
  800257:	48 bf c5 55 80 00 00 	movabs $0x8055c5,%rdi
  80025e:	00 00 00 
  800261:	b8 00 00 00 00       	mov    $0x0,%eax
  800266:	48 ba 8c 05 80 00 00 	movabs $0x80058c,%rdx
  80026d:	00 00 00 
  800270:	ff d2                	callq  *%rdx
static __inline void read_gdtr (uint64_t *gdtbase, uint16_t *gdtlimit) __attribute__((always_inline));

static __inline void
breakpoint(void)
{
	__asm __volatile("int3");
  800272:	cc                   	int3   
  800273:	90                   	nop
  800274:	c9                   	leaveq 
  800275:	c3                   	retq   

0000000000800276 <childofspawn>:
  800276:	55                   	push   %rbp
  800277:	48 89 e5             	mov    %rsp,%rbp
  80027a:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800281:	00 00 00 
  800284:	48 8b 00             	mov    (%rax),%rax
  800287:	48 89 c6             	mov    %rax,%rsi
  80028a:	bf 00 00 00 a0       	mov    $0xa0000000,%edi
  80028f:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  800296:	00 00 00 
  800299:	ff d0                	callq  *%rax
  80029b:	48 b8 2e 03 80 00 00 	movabs $0x80032e,%rax
  8002a2:	00 00 00 
  8002a5:	ff d0                	callq  *%rax
  8002a7:	90                   	nop
  8002a8:	5d                   	pop    %rbp
  8002a9:	c3                   	retq   

00000000008002aa <libmain>:
  8002aa:	55                   	push   %rbp
  8002ab:	48 89 e5             	mov    %rsp,%rbp
  8002ae:	48 83 ec 10          	sub    $0x10,%rsp
  8002b2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8002b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8002b9:	48 b8 d3 19 80 00 00 	movabs $0x8019d3,%rax
  8002c0:	00 00 00 
  8002c3:	ff d0                	callq  *%rax
  8002c5:	25 ff 03 00 00       	and    $0x3ff,%eax
  8002ca:	48 98                	cltq   
  8002cc:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8002d3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8002da:	00 00 00 
  8002dd:	48 01 c2             	add    %rax,%rdx
  8002e0:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8002e7:	00 00 00 
  8002ea:	48 89 10             	mov    %rdx,(%rax)
  8002ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8002f1:	7e 14                	jle    800307 <libmain+0x5d>
  8002f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002f7:	48 8b 10             	mov    (%rax),%rdx
  8002fa:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  800301:	00 00 00 
  800304:	48 89 10             	mov    %rdx,(%rax)
  800307:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80030b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80030e:	48 89 d6             	mov    %rdx,%rsi
  800311:	89 c7                	mov    %eax,%edi
  800313:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80031a:	00 00 00 
  80031d:	ff d0                	callq  *%rax
  80031f:	48 b8 2e 03 80 00 00 	movabs $0x80032e,%rax
  800326:	00 00 00 
  800329:	ff d0                	callq  *%rax
  80032b:	90                   	nop
  80032c:	c9                   	leaveq 
  80032d:	c3                   	retq   

000000000080032e <exit>:
  80032e:	55                   	push   %rbp
  80032f:	48 89 e5             	mov    %rsp,%rbp
  800332:	48 b8 a3 27 80 00 00 	movabs $0x8027a3,%rax
  800339:	00 00 00 
  80033c:	ff d0                	callq  *%rax
  80033e:	bf 00 00 00 00       	mov    $0x0,%edi
  800343:	48 b8 8d 19 80 00 00 	movabs $0x80198d,%rax
  80034a:	00 00 00 
  80034d:	ff d0                	callq  *%rax
  80034f:	90                   	nop
  800350:	5d                   	pop    %rbp
  800351:	c3                   	retq   

0000000000800352 <_panic>:
  800352:	55                   	push   %rbp
  800353:	48 89 e5             	mov    %rsp,%rbp
  800356:	53                   	push   %rbx
  800357:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80035e:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800365:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80036b:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800372:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800379:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800380:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800387:	84 c0                	test   %al,%al
  800389:	74 23                	je     8003ae <_panic+0x5c>
  80038b:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800392:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800396:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80039a:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80039e:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8003a2:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8003a6:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8003aa:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8003ae:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8003b5:	00 00 00 
  8003b8:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8003bf:	00 00 00 
  8003c2:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8003c6:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8003cd:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8003d4:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8003db:	48 b8 10 80 80 00 00 	movabs $0x808010,%rax
  8003e2:	00 00 00 
  8003e5:	48 8b 18             	mov    (%rax),%rbx
  8003e8:	48 b8 d3 19 80 00 00 	movabs $0x8019d3,%rax
  8003ef:	00 00 00 
  8003f2:	ff d0                	callq  *%rax
  8003f4:	89 c6                	mov    %eax,%esi
  8003f6:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8003fc:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800403:	41 89 d0             	mov    %edx,%r8d
  800406:	48 89 c1             	mov    %rax,%rcx
  800409:	48 89 da             	mov    %rbx,%rdx
  80040c:	48 bf f0 55 80 00 00 	movabs $0x8055f0,%rdi
  800413:	00 00 00 
  800416:	b8 00 00 00 00       	mov    $0x0,%eax
  80041b:	49 b9 8c 05 80 00 00 	movabs $0x80058c,%r9
  800422:	00 00 00 
  800425:	41 ff d1             	callq  *%r9
  800428:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80042f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800436:	48 89 d6             	mov    %rdx,%rsi
  800439:	48 89 c7             	mov    %rax,%rdi
  80043c:	48 b8 e0 04 80 00 00 	movabs $0x8004e0,%rax
  800443:	00 00 00 
  800446:	ff d0                	callq  *%rax
  800448:	48 bf 13 56 80 00 00 	movabs $0x805613,%rdi
  80044f:	00 00 00 
  800452:	b8 00 00 00 00       	mov    $0x0,%eax
  800457:	48 ba 8c 05 80 00 00 	movabs $0x80058c,%rdx
  80045e:	00 00 00 
  800461:	ff d2                	callq  *%rdx
  800463:	cc                   	int3   
  800464:	eb fd                	jmp    800463 <_panic+0x111>

0000000000800466 <putch>:
  800466:	55                   	push   %rbp
  800467:	48 89 e5             	mov    %rsp,%rbp
  80046a:	48 83 ec 10          	sub    $0x10,%rsp
  80046e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800471:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800475:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800479:	8b 00                	mov    (%rax),%eax
  80047b:	8d 48 01             	lea    0x1(%rax),%ecx
  80047e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800482:	89 0a                	mov    %ecx,(%rdx)
  800484:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800487:	89 d1                	mov    %edx,%ecx
  800489:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80048d:	48 98                	cltq   
  80048f:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800493:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800497:	8b 00                	mov    (%rax),%eax
  800499:	3d ff 00 00 00       	cmp    $0xff,%eax
  80049e:	75 2c                	jne    8004cc <putch+0x66>
  8004a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004a4:	8b 00                	mov    (%rax),%eax
  8004a6:	48 98                	cltq   
  8004a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004ac:	48 83 c2 08          	add    $0x8,%rdx
  8004b0:	48 89 c6             	mov    %rax,%rsi
  8004b3:	48 89 d7             	mov    %rdx,%rdi
  8004b6:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  8004bd:	00 00 00 
  8004c0:	ff d0                	callq  *%rax
  8004c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004c6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8004cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004d0:	8b 40 04             	mov    0x4(%rax),%eax
  8004d3:	8d 50 01             	lea    0x1(%rax),%edx
  8004d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004da:	89 50 04             	mov    %edx,0x4(%rax)
  8004dd:	90                   	nop
  8004de:	c9                   	leaveq 
  8004df:	c3                   	retq   

00000000008004e0 <vcprintf>:
  8004e0:	55                   	push   %rbp
  8004e1:	48 89 e5             	mov    %rsp,%rbp
  8004e4:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8004eb:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8004f2:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8004f9:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800500:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800507:	48 8b 0a             	mov    (%rdx),%rcx
  80050a:	48 89 08             	mov    %rcx,(%rax)
  80050d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800511:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800515:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800519:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80051d:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800524:	00 00 00 
  800527:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80052e:	00 00 00 
  800531:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800538:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80053f:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800546:	48 89 c6             	mov    %rax,%rsi
  800549:	48 bf 66 04 80 00 00 	movabs $0x800466,%rdi
  800550:	00 00 00 
  800553:	48 b8 2a 09 80 00 00 	movabs $0x80092a,%rax
  80055a:	00 00 00 
  80055d:	ff d0                	callq  *%rax
  80055f:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800565:	48 98                	cltq   
  800567:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80056e:	48 83 c2 08          	add    $0x8,%rdx
  800572:	48 89 c6             	mov    %rax,%rsi
  800575:	48 89 d7             	mov    %rdx,%rdi
  800578:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  80057f:	00 00 00 
  800582:	ff d0                	callq  *%rax
  800584:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80058a:	c9                   	leaveq 
  80058b:	c3                   	retq   

000000000080058c <cprintf>:
  80058c:	55                   	push   %rbp
  80058d:	48 89 e5             	mov    %rsp,%rbp
  800590:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800597:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80059e:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8005a5:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8005ac:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8005b3:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8005ba:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8005c1:	84 c0                	test   %al,%al
  8005c3:	74 20                	je     8005e5 <cprintf+0x59>
  8005c5:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8005c9:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8005cd:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8005d1:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8005d5:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8005d9:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8005dd:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8005e1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8005e5:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8005ec:	00 00 00 
  8005ef:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8005f6:	00 00 00 
  8005f9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8005fd:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800604:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80060b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800612:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800619:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800620:	48 8b 0a             	mov    (%rdx),%rcx
  800623:	48 89 08             	mov    %rcx,(%rax)
  800626:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80062a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80062e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800632:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800636:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80063d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800644:	48 89 d6             	mov    %rdx,%rsi
  800647:	48 89 c7             	mov    %rax,%rdi
  80064a:	48 b8 e0 04 80 00 00 	movabs $0x8004e0,%rax
  800651:	00 00 00 
  800654:	ff d0                	callq  *%rax
  800656:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80065c:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800662:	c9                   	leaveq 
  800663:	c3                   	retq   

0000000000800664 <printnum>:
  800664:	55                   	push   %rbp
  800665:	48 89 e5             	mov    %rsp,%rbp
  800668:	48 83 ec 30          	sub    $0x30,%rsp
  80066c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800670:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800674:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800678:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80067b:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  80067f:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800683:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800686:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  80068a:	77 54                	ja     8006e0 <printnum+0x7c>
  80068c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80068f:	8d 78 ff             	lea    -0x1(%rax),%edi
  800692:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800695:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800699:	ba 00 00 00 00       	mov    $0x0,%edx
  80069e:	48 f7 f6             	div    %rsi
  8006a1:	49 89 c2             	mov    %rax,%r10
  8006a4:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8006a7:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8006aa:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8006ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006b2:	41 89 c9             	mov    %ecx,%r9d
  8006b5:	41 89 f8             	mov    %edi,%r8d
  8006b8:	89 d1                	mov    %edx,%ecx
  8006ba:	4c 89 d2             	mov    %r10,%rdx
  8006bd:	48 89 c7             	mov    %rax,%rdi
  8006c0:	48 b8 64 06 80 00 00 	movabs $0x800664,%rax
  8006c7:	00 00 00 
  8006ca:	ff d0                	callq  *%rax
  8006cc:	eb 1c                	jmp    8006ea <printnum+0x86>
  8006ce:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8006d2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8006d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006d9:	48 89 ce             	mov    %rcx,%rsi
  8006dc:	89 d7                	mov    %edx,%edi
  8006de:	ff d0                	callq  *%rax
  8006e0:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8006e4:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8006e8:	7f e4                	jg     8006ce <printnum+0x6a>
  8006ea:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8006ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f1:	ba 00 00 00 00       	mov    $0x0,%edx
  8006f6:	48 f7 f1             	div    %rcx
  8006f9:	48 b8 10 58 80 00 00 	movabs $0x805810,%rax
  800700:	00 00 00 
  800703:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800707:	0f be d0             	movsbl %al,%edx
  80070a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80070e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800712:	48 89 ce             	mov    %rcx,%rsi
  800715:	89 d7                	mov    %edx,%edi
  800717:	ff d0                	callq  *%rax
  800719:	90                   	nop
  80071a:	c9                   	leaveq 
  80071b:	c3                   	retq   

000000000080071c <getuint>:
  80071c:	55                   	push   %rbp
  80071d:	48 89 e5             	mov    %rsp,%rbp
  800720:	48 83 ec 20          	sub    $0x20,%rsp
  800724:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800728:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80072b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80072f:	7e 4f                	jle    800780 <getuint+0x64>
  800731:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800735:	8b 00                	mov    (%rax),%eax
  800737:	83 f8 30             	cmp    $0x30,%eax
  80073a:	73 24                	jae    800760 <getuint+0x44>
  80073c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800740:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800744:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800748:	8b 00                	mov    (%rax),%eax
  80074a:	89 c0                	mov    %eax,%eax
  80074c:	48 01 d0             	add    %rdx,%rax
  80074f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800753:	8b 12                	mov    (%rdx),%edx
  800755:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800758:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80075c:	89 0a                	mov    %ecx,(%rdx)
  80075e:	eb 14                	jmp    800774 <getuint+0x58>
  800760:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800764:	48 8b 40 08          	mov    0x8(%rax),%rax
  800768:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80076c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800770:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800774:	48 8b 00             	mov    (%rax),%rax
  800777:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80077b:	e9 9d 00 00 00       	jmpq   80081d <getuint+0x101>
  800780:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800784:	74 4c                	je     8007d2 <getuint+0xb6>
  800786:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80078a:	8b 00                	mov    (%rax),%eax
  80078c:	83 f8 30             	cmp    $0x30,%eax
  80078f:	73 24                	jae    8007b5 <getuint+0x99>
  800791:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800795:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800799:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80079d:	8b 00                	mov    (%rax),%eax
  80079f:	89 c0                	mov    %eax,%eax
  8007a1:	48 01 d0             	add    %rdx,%rax
  8007a4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007a8:	8b 12                	mov    (%rdx),%edx
  8007aa:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007ad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007b1:	89 0a                	mov    %ecx,(%rdx)
  8007b3:	eb 14                	jmp    8007c9 <getuint+0xad>
  8007b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007b9:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007bd:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007c1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007c5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007c9:	48 8b 00             	mov    (%rax),%rax
  8007cc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007d0:	eb 4b                	jmp    80081d <getuint+0x101>
  8007d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d6:	8b 00                	mov    (%rax),%eax
  8007d8:	83 f8 30             	cmp    $0x30,%eax
  8007db:	73 24                	jae    800801 <getuint+0xe5>
  8007dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e9:	8b 00                	mov    (%rax),%eax
  8007eb:	89 c0                	mov    %eax,%eax
  8007ed:	48 01 d0             	add    %rdx,%rax
  8007f0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007f4:	8b 12                	mov    (%rdx),%edx
  8007f6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007f9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007fd:	89 0a                	mov    %ecx,(%rdx)
  8007ff:	eb 14                	jmp    800815 <getuint+0xf9>
  800801:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800805:	48 8b 40 08          	mov    0x8(%rax),%rax
  800809:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80080d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800811:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800815:	8b 00                	mov    (%rax),%eax
  800817:	89 c0                	mov    %eax,%eax
  800819:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80081d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800821:	c9                   	leaveq 
  800822:	c3                   	retq   

0000000000800823 <getint>:
  800823:	55                   	push   %rbp
  800824:	48 89 e5             	mov    %rsp,%rbp
  800827:	48 83 ec 20          	sub    $0x20,%rsp
  80082b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80082f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800832:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800836:	7e 4f                	jle    800887 <getint+0x64>
  800838:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083c:	8b 00                	mov    (%rax),%eax
  80083e:	83 f8 30             	cmp    $0x30,%eax
  800841:	73 24                	jae    800867 <getint+0x44>
  800843:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800847:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80084b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80084f:	8b 00                	mov    (%rax),%eax
  800851:	89 c0                	mov    %eax,%eax
  800853:	48 01 d0             	add    %rdx,%rax
  800856:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80085a:	8b 12                	mov    (%rdx),%edx
  80085c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80085f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800863:	89 0a                	mov    %ecx,(%rdx)
  800865:	eb 14                	jmp    80087b <getint+0x58>
  800867:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80086b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80086f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800873:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800877:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80087b:	48 8b 00             	mov    (%rax),%rax
  80087e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800882:	e9 9d 00 00 00       	jmpq   800924 <getint+0x101>
  800887:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80088b:	74 4c                	je     8008d9 <getint+0xb6>
  80088d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800891:	8b 00                	mov    (%rax),%eax
  800893:	83 f8 30             	cmp    $0x30,%eax
  800896:	73 24                	jae    8008bc <getint+0x99>
  800898:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80089c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a4:	8b 00                	mov    (%rax),%eax
  8008a6:	89 c0                	mov    %eax,%eax
  8008a8:	48 01 d0             	add    %rdx,%rax
  8008ab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008af:	8b 12                	mov    (%rdx),%edx
  8008b1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008b4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008b8:	89 0a                	mov    %ecx,(%rdx)
  8008ba:	eb 14                	jmp    8008d0 <getint+0xad>
  8008bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008c0:	48 8b 40 08          	mov    0x8(%rax),%rax
  8008c4:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8008c8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008cc:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008d0:	48 8b 00             	mov    (%rax),%rax
  8008d3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008d7:	eb 4b                	jmp    800924 <getint+0x101>
  8008d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008dd:	8b 00                	mov    (%rax),%eax
  8008df:	83 f8 30             	cmp    $0x30,%eax
  8008e2:	73 24                	jae    800908 <getint+0xe5>
  8008e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008e8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008f0:	8b 00                	mov    (%rax),%eax
  8008f2:	89 c0                	mov    %eax,%eax
  8008f4:	48 01 d0             	add    %rdx,%rax
  8008f7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008fb:	8b 12                	mov    (%rdx),%edx
  8008fd:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800900:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800904:	89 0a                	mov    %ecx,(%rdx)
  800906:	eb 14                	jmp    80091c <getint+0xf9>
  800908:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80090c:	48 8b 40 08          	mov    0x8(%rax),%rax
  800910:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800914:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800918:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80091c:	8b 00                	mov    (%rax),%eax
  80091e:	48 98                	cltq   
  800920:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800924:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800928:	c9                   	leaveq 
  800929:	c3                   	retq   

000000000080092a <vprintfmt>:
  80092a:	55                   	push   %rbp
  80092b:	48 89 e5             	mov    %rsp,%rbp
  80092e:	41 54                	push   %r12
  800930:	53                   	push   %rbx
  800931:	48 83 ec 60          	sub    $0x60,%rsp
  800935:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800939:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80093d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800941:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800945:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800949:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80094d:	48 8b 0a             	mov    (%rdx),%rcx
  800950:	48 89 08             	mov    %rcx,(%rax)
  800953:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800957:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80095b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80095f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800963:	eb 17                	jmp    80097c <vprintfmt+0x52>
  800965:	85 db                	test   %ebx,%ebx
  800967:	0f 84 b9 04 00 00    	je     800e26 <vprintfmt+0x4fc>
  80096d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800971:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800975:	48 89 d6             	mov    %rdx,%rsi
  800978:	89 df                	mov    %ebx,%edi
  80097a:	ff d0                	callq  *%rax
  80097c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800980:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800984:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800988:	0f b6 00             	movzbl (%rax),%eax
  80098b:	0f b6 d8             	movzbl %al,%ebx
  80098e:	83 fb 25             	cmp    $0x25,%ebx
  800991:	75 d2                	jne    800965 <vprintfmt+0x3b>
  800993:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800997:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80099e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009a5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8009ac:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8009b3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009b7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8009bb:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009bf:	0f b6 00             	movzbl (%rax),%eax
  8009c2:	0f b6 d8             	movzbl %al,%ebx
  8009c5:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8009c8:	83 f8 55             	cmp    $0x55,%eax
  8009cb:	0f 87 22 04 00 00    	ja     800df3 <vprintfmt+0x4c9>
  8009d1:	89 c0                	mov    %eax,%eax
  8009d3:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8009da:	00 
  8009db:	48 b8 38 58 80 00 00 	movabs $0x805838,%rax
  8009e2:	00 00 00 
  8009e5:	48 01 d0             	add    %rdx,%rax
  8009e8:	48 8b 00             	mov    (%rax),%rax
  8009eb:	ff e0                	jmpq   *%rax
  8009ed:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8009f1:	eb c0                	jmp    8009b3 <vprintfmt+0x89>
  8009f3:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8009f7:	eb ba                	jmp    8009b3 <vprintfmt+0x89>
  8009f9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800a00:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800a03:	89 d0                	mov    %edx,%eax
  800a05:	c1 e0 02             	shl    $0x2,%eax
  800a08:	01 d0                	add    %edx,%eax
  800a0a:	01 c0                	add    %eax,%eax
  800a0c:	01 d8                	add    %ebx,%eax
  800a0e:	83 e8 30             	sub    $0x30,%eax
  800a11:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a14:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a18:	0f b6 00             	movzbl (%rax),%eax
  800a1b:	0f be d8             	movsbl %al,%ebx
  800a1e:	83 fb 2f             	cmp    $0x2f,%ebx
  800a21:	7e 60                	jle    800a83 <vprintfmt+0x159>
  800a23:	83 fb 39             	cmp    $0x39,%ebx
  800a26:	7f 5b                	jg     800a83 <vprintfmt+0x159>
  800a28:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800a2d:	eb d1                	jmp    800a00 <vprintfmt+0xd6>
  800a2f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a32:	83 f8 30             	cmp    $0x30,%eax
  800a35:	73 17                	jae    800a4e <vprintfmt+0x124>
  800a37:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a3b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a3e:	89 d2                	mov    %edx,%edx
  800a40:	48 01 d0             	add    %rdx,%rax
  800a43:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a46:	83 c2 08             	add    $0x8,%edx
  800a49:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a4c:	eb 0c                	jmp    800a5a <vprintfmt+0x130>
  800a4e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a52:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a56:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a5a:	8b 00                	mov    (%rax),%eax
  800a5c:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a5f:	eb 23                	jmp    800a84 <vprintfmt+0x15a>
  800a61:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a65:	0f 89 48 ff ff ff    	jns    8009b3 <vprintfmt+0x89>
  800a6b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800a72:	e9 3c ff ff ff       	jmpq   8009b3 <vprintfmt+0x89>
  800a77:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800a7e:	e9 30 ff ff ff       	jmpq   8009b3 <vprintfmt+0x89>
  800a83:	90                   	nop
  800a84:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a88:	0f 89 25 ff ff ff    	jns    8009b3 <vprintfmt+0x89>
  800a8e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a91:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800a94:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a9b:	e9 13 ff ff ff       	jmpq   8009b3 <vprintfmt+0x89>
  800aa0:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800aa4:	e9 0a ff ff ff       	jmpq   8009b3 <vprintfmt+0x89>
  800aa9:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800aac:	83 f8 30             	cmp    $0x30,%eax
  800aaf:	73 17                	jae    800ac8 <vprintfmt+0x19e>
  800ab1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ab5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ab8:	89 d2                	mov    %edx,%edx
  800aba:	48 01 d0             	add    %rdx,%rax
  800abd:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ac0:	83 c2 08             	add    $0x8,%edx
  800ac3:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ac6:	eb 0c                	jmp    800ad4 <vprintfmt+0x1aa>
  800ac8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800acc:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800ad0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ad4:	8b 10                	mov    (%rax),%edx
  800ad6:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800ada:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ade:	48 89 ce             	mov    %rcx,%rsi
  800ae1:	89 d7                	mov    %edx,%edi
  800ae3:	ff d0                	callq  *%rax
  800ae5:	e9 37 03 00 00       	jmpq   800e21 <vprintfmt+0x4f7>
  800aea:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800aed:	83 f8 30             	cmp    $0x30,%eax
  800af0:	73 17                	jae    800b09 <vprintfmt+0x1df>
  800af2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800af6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800af9:	89 d2                	mov    %edx,%edx
  800afb:	48 01 d0             	add    %rdx,%rax
  800afe:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b01:	83 c2 08             	add    $0x8,%edx
  800b04:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b07:	eb 0c                	jmp    800b15 <vprintfmt+0x1eb>
  800b09:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b0d:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b11:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b15:	8b 18                	mov    (%rax),%ebx
  800b17:	85 db                	test   %ebx,%ebx
  800b19:	79 02                	jns    800b1d <vprintfmt+0x1f3>
  800b1b:	f7 db                	neg    %ebx
  800b1d:	83 fb 15             	cmp    $0x15,%ebx
  800b20:	7f 16                	jg     800b38 <vprintfmt+0x20e>
  800b22:	48 b8 60 57 80 00 00 	movabs $0x805760,%rax
  800b29:	00 00 00 
  800b2c:	48 63 d3             	movslq %ebx,%rdx
  800b2f:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800b33:	4d 85 e4             	test   %r12,%r12
  800b36:	75 2e                	jne    800b66 <vprintfmt+0x23c>
  800b38:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b3c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b40:	89 d9                	mov    %ebx,%ecx
  800b42:	48 ba 21 58 80 00 00 	movabs $0x805821,%rdx
  800b49:	00 00 00 
  800b4c:	48 89 c7             	mov    %rax,%rdi
  800b4f:	b8 00 00 00 00       	mov    $0x0,%eax
  800b54:	49 b8 30 0e 80 00 00 	movabs $0x800e30,%r8
  800b5b:	00 00 00 
  800b5e:	41 ff d0             	callq  *%r8
  800b61:	e9 bb 02 00 00       	jmpq   800e21 <vprintfmt+0x4f7>
  800b66:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b6a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b6e:	4c 89 e1             	mov    %r12,%rcx
  800b71:	48 ba 2a 58 80 00 00 	movabs $0x80582a,%rdx
  800b78:	00 00 00 
  800b7b:	48 89 c7             	mov    %rax,%rdi
  800b7e:	b8 00 00 00 00       	mov    $0x0,%eax
  800b83:	49 b8 30 0e 80 00 00 	movabs $0x800e30,%r8
  800b8a:	00 00 00 
  800b8d:	41 ff d0             	callq  *%r8
  800b90:	e9 8c 02 00 00       	jmpq   800e21 <vprintfmt+0x4f7>
  800b95:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b98:	83 f8 30             	cmp    $0x30,%eax
  800b9b:	73 17                	jae    800bb4 <vprintfmt+0x28a>
  800b9d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ba1:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ba4:	89 d2                	mov    %edx,%edx
  800ba6:	48 01 d0             	add    %rdx,%rax
  800ba9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bac:	83 c2 08             	add    $0x8,%edx
  800baf:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bb2:	eb 0c                	jmp    800bc0 <vprintfmt+0x296>
  800bb4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800bb8:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800bbc:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bc0:	4c 8b 20             	mov    (%rax),%r12
  800bc3:	4d 85 e4             	test   %r12,%r12
  800bc6:	75 0a                	jne    800bd2 <vprintfmt+0x2a8>
  800bc8:	49 bc 2d 58 80 00 00 	movabs $0x80582d,%r12
  800bcf:	00 00 00 
  800bd2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bd6:	7e 78                	jle    800c50 <vprintfmt+0x326>
  800bd8:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800bdc:	74 72                	je     800c50 <vprintfmt+0x326>
  800bde:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800be1:	48 98                	cltq   
  800be3:	48 89 c6             	mov    %rax,%rsi
  800be6:	4c 89 e7             	mov    %r12,%rdi
  800be9:	48 b8 de 10 80 00 00 	movabs $0x8010de,%rax
  800bf0:	00 00 00 
  800bf3:	ff d0                	callq  *%rax
  800bf5:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800bf8:	eb 17                	jmp    800c11 <vprintfmt+0x2e7>
  800bfa:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800bfe:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c02:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c06:	48 89 ce             	mov    %rcx,%rsi
  800c09:	89 d7                	mov    %edx,%edi
  800c0b:	ff d0                	callq  *%rax
  800c0d:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c11:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c15:	7f e3                	jg     800bfa <vprintfmt+0x2d0>
  800c17:	eb 37                	jmp    800c50 <vprintfmt+0x326>
  800c19:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800c1d:	74 1e                	je     800c3d <vprintfmt+0x313>
  800c1f:	83 fb 1f             	cmp    $0x1f,%ebx
  800c22:	7e 05                	jle    800c29 <vprintfmt+0x2ff>
  800c24:	83 fb 7e             	cmp    $0x7e,%ebx
  800c27:	7e 14                	jle    800c3d <vprintfmt+0x313>
  800c29:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c2d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c31:	48 89 d6             	mov    %rdx,%rsi
  800c34:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800c39:	ff d0                	callq  *%rax
  800c3b:	eb 0f                	jmp    800c4c <vprintfmt+0x322>
  800c3d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c41:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c45:	48 89 d6             	mov    %rdx,%rsi
  800c48:	89 df                	mov    %ebx,%edi
  800c4a:	ff d0                	callq  *%rax
  800c4c:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c50:	4c 89 e0             	mov    %r12,%rax
  800c53:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800c57:	0f b6 00             	movzbl (%rax),%eax
  800c5a:	0f be d8             	movsbl %al,%ebx
  800c5d:	85 db                	test   %ebx,%ebx
  800c5f:	74 28                	je     800c89 <vprintfmt+0x35f>
  800c61:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c65:	78 b2                	js     800c19 <vprintfmt+0x2ef>
  800c67:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800c6b:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c6f:	79 a8                	jns    800c19 <vprintfmt+0x2ef>
  800c71:	eb 16                	jmp    800c89 <vprintfmt+0x35f>
  800c73:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c77:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c7b:	48 89 d6             	mov    %rdx,%rsi
  800c7e:	bf 20 00 00 00       	mov    $0x20,%edi
  800c83:	ff d0                	callq  *%rax
  800c85:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c89:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c8d:	7f e4                	jg     800c73 <vprintfmt+0x349>
  800c8f:	e9 8d 01 00 00       	jmpq   800e21 <vprintfmt+0x4f7>
  800c94:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c98:	be 03 00 00 00       	mov    $0x3,%esi
  800c9d:	48 89 c7             	mov    %rax,%rdi
  800ca0:	48 b8 23 08 80 00 00 	movabs $0x800823,%rax
  800ca7:	00 00 00 
  800caa:	ff d0                	callq  *%rax
  800cac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cb4:	48 85 c0             	test   %rax,%rax
  800cb7:	79 1d                	jns    800cd6 <vprintfmt+0x3ac>
  800cb9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cbd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cc1:	48 89 d6             	mov    %rdx,%rsi
  800cc4:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800cc9:	ff d0                	callq  *%rax
  800ccb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ccf:	48 f7 d8             	neg    %rax
  800cd2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cd6:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800cdd:	e9 d2 00 00 00       	jmpq   800db4 <vprintfmt+0x48a>
  800ce2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ce6:	be 03 00 00 00       	mov    $0x3,%esi
  800ceb:	48 89 c7             	mov    %rax,%rdi
  800cee:	48 b8 1c 07 80 00 00 	movabs $0x80071c,%rax
  800cf5:	00 00 00 
  800cf8:	ff d0                	callq  *%rax
  800cfa:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cfe:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d05:	e9 aa 00 00 00       	jmpq   800db4 <vprintfmt+0x48a>
  800d0a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d0e:	be 03 00 00 00       	mov    $0x3,%esi
  800d13:	48 89 c7             	mov    %rax,%rdi
  800d16:	48 b8 1c 07 80 00 00 	movabs $0x80071c,%rax
  800d1d:	00 00 00 
  800d20:	ff d0                	callq  *%rax
  800d22:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d26:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800d2d:	e9 82 00 00 00       	jmpq   800db4 <vprintfmt+0x48a>
  800d32:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d36:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d3a:	48 89 d6             	mov    %rdx,%rsi
  800d3d:	bf 30 00 00 00       	mov    $0x30,%edi
  800d42:	ff d0                	callq  *%rax
  800d44:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d48:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d4c:	48 89 d6             	mov    %rdx,%rsi
  800d4f:	bf 78 00 00 00       	mov    $0x78,%edi
  800d54:	ff d0                	callq  *%rax
  800d56:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d59:	83 f8 30             	cmp    $0x30,%eax
  800d5c:	73 17                	jae    800d75 <vprintfmt+0x44b>
  800d5e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d62:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d65:	89 d2                	mov    %edx,%edx
  800d67:	48 01 d0             	add    %rdx,%rax
  800d6a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d6d:	83 c2 08             	add    $0x8,%edx
  800d70:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d73:	eb 0c                	jmp    800d81 <vprintfmt+0x457>
  800d75:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d79:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d7d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d81:	48 8b 00             	mov    (%rax),%rax
  800d84:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d88:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d8f:	eb 23                	jmp    800db4 <vprintfmt+0x48a>
  800d91:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d95:	be 03 00 00 00       	mov    $0x3,%esi
  800d9a:	48 89 c7             	mov    %rax,%rdi
  800d9d:	48 b8 1c 07 80 00 00 	movabs $0x80071c,%rax
  800da4:	00 00 00 
  800da7:	ff d0                	callq  *%rax
  800da9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dad:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800db4:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800db9:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800dbc:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800dbf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800dc3:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800dc7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dcb:	45 89 c1             	mov    %r8d,%r9d
  800dce:	41 89 f8             	mov    %edi,%r8d
  800dd1:	48 89 c7             	mov    %rax,%rdi
  800dd4:	48 b8 64 06 80 00 00 	movabs $0x800664,%rax
  800ddb:	00 00 00 
  800dde:	ff d0                	callq  *%rax
  800de0:	eb 3f                	jmp    800e21 <vprintfmt+0x4f7>
  800de2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800de6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dea:	48 89 d6             	mov    %rdx,%rsi
  800ded:	89 df                	mov    %ebx,%edi
  800def:	ff d0                	callq  *%rax
  800df1:	eb 2e                	jmp    800e21 <vprintfmt+0x4f7>
  800df3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800df7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dfb:	48 89 d6             	mov    %rdx,%rsi
  800dfe:	bf 25 00 00 00       	mov    $0x25,%edi
  800e03:	ff d0                	callq  *%rax
  800e05:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e0a:	eb 05                	jmp    800e11 <vprintfmt+0x4e7>
  800e0c:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e11:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800e15:	48 83 e8 01          	sub    $0x1,%rax
  800e19:	0f b6 00             	movzbl (%rax),%eax
  800e1c:	3c 25                	cmp    $0x25,%al
  800e1e:	75 ec                	jne    800e0c <vprintfmt+0x4e2>
  800e20:	90                   	nop
  800e21:	e9 3d fb ff ff       	jmpq   800963 <vprintfmt+0x39>
  800e26:	90                   	nop
  800e27:	48 83 c4 60          	add    $0x60,%rsp
  800e2b:	5b                   	pop    %rbx
  800e2c:	41 5c                	pop    %r12
  800e2e:	5d                   	pop    %rbp
  800e2f:	c3                   	retq   

0000000000800e30 <printfmt>:
  800e30:	55                   	push   %rbp
  800e31:	48 89 e5             	mov    %rsp,%rbp
  800e34:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800e3b:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800e42:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800e49:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800e50:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e57:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e5e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e65:	84 c0                	test   %al,%al
  800e67:	74 20                	je     800e89 <printfmt+0x59>
  800e69:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e6d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e71:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e75:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e79:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e7d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e81:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e85:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e89:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800e90:	00 00 00 
  800e93:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800e9a:	00 00 00 
  800e9d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800ea1:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800ea8:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800eaf:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800eb6:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800ebd:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800ec4:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800ecb:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800ed2:	48 89 c7             	mov    %rax,%rdi
  800ed5:	48 b8 2a 09 80 00 00 	movabs $0x80092a,%rax
  800edc:	00 00 00 
  800edf:	ff d0                	callq  *%rax
  800ee1:	90                   	nop
  800ee2:	c9                   	leaveq 
  800ee3:	c3                   	retq   

0000000000800ee4 <sprintputch>:
  800ee4:	55                   	push   %rbp
  800ee5:	48 89 e5             	mov    %rsp,%rbp
  800ee8:	48 83 ec 10          	sub    $0x10,%rsp
  800eec:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800eef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ef3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ef7:	8b 40 10             	mov    0x10(%rax),%eax
  800efa:	8d 50 01             	lea    0x1(%rax),%edx
  800efd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f01:	89 50 10             	mov    %edx,0x10(%rax)
  800f04:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f08:	48 8b 10             	mov    (%rax),%rdx
  800f0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f0f:	48 8b 40 08          	mov    0x8(%rax),%rax
  800f13:	48 39 c2             	cmp    %rax,%rdx
  800f16:	73 17                	jae    800f2f <sprintputch+0x4b>
  800f18:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f1c:	48 8b 00             	mov    (%rax),%rax
  800f1f:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800f23:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800f27:	48 89 0a             	mov    %rcx,(%rdx)
  800f2a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800f2d:	88 10                	mov    %dl,(%rax)
  800f2f:	90                   	nop
  800f30:	c9                   	leaveq 
  800f31:	c3                   	retq   

0000000000800f32 <vsnprintf>:
  800f32:	55                   	push   %rbp
  800f33:	48 89 e5             	mov    %rsp,%rbp
  800f36:	48 83 ec 50          	sub    $0x50,%rsp
  800f3a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800f3e:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800f41:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800f45:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800f49:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800f4d:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800f51:	48 8b 0a             	mov    (%rdx),%rcx
  800f54:	48 89 08             	mov    %rcx,(%rax)
  800f57:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800f5b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800f5f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800f63:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f67:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f6b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800f6f:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800f72:	48 98                	cltq   
  800f74:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800f78:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f7c:	48 01 d0             	add    %rdx,%rax
  800f7f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800f83:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f8a:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800f8f:	74 06                	je     800f97 <vsnprintf+0x65>
  800f91:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800f95:	7f 07                	jg     800f9e <vsnprintf+0x6c>
  800f97:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800f9c:	eb 2f                	jmp    800fcd <vsnprintf+0x9b>
  800f9e:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800fa2:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800fa6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800faa:	48 89 c6             	mov    %rax,%rsi
  800fad:	48 bf e4 0e 80 00 00 	movabs $0x800ee4,%rdi
  800fb4:	00 00 00 
  800fb7:	48 b8 2a 09 80 00 00 	movabs $0x80092a,%rax
  800fbe:	00 00 00 
  800fc1:	ff d0                	callq  *%rax
  800fc3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800fc7:	c6 00 00             	movb   $0x0,(%rax)
  800fca:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800fcd:	c9                   	leaveq 
  800fce:	c3                   	retq   

0000000000800fcf <snprintf>:
  800fcf:	55                   	push   %rbp
  800fd0:	48 89 e5             	mov    %rsp,%rbp
  800fd3:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800fda:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800fe1:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800fe7:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800fee:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800ff5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800ffc:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801003:	84 c0                	test   %al,%al
  801005:	74 20                	je     801027 <snprintf+0x58>
  801007:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80100b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80100f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801013:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801017:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80101b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80101f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801023:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801027:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80102e:	00 00 00 
  801031:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801038:	00 00 00 
  80103b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80103f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801046:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80104d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801054:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80105b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801062:	48 8b 0a             	mov    (%rdx),%rcx
  801065:	48 89 08             	mov    %rcx,(%rax)
  801068:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80106c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801070:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801074:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801078:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80107f:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801086:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80108c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801093:	48 89 c7             	mov    %rax,%rdi
  801096:	48 b8 32 0f 80 00 00 	movabs $0x800f32,%rax
  80109d:	00 00 00 
  8010a0:	ff d0                	callq  *%rax
  8010a2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8010a8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8010ae:	c9                   	leaveq 
  8010af:	c3                   	retq   

00000000008010b0 <strlen>:
  8010b0:	55                   	push   %rbp
  8010b1:	48 89 e5             	mov    %rsp,%rbp
  8010b4:	48 83 ec 18          	sub    $0x18,%rsp
  8010b8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8010c3:	eb 09                	jmp    8010ce <strlen+0x1e>
  8010c5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8010c9:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8010ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d2:	0f b6 00             	movzbl (%rax),%eax
  8010d5:	84 c0                	test   %al,%al
  8010d7:	75 ec                	jne    8010c5 <strlen+0x15>
  8010d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010dc:	c9                   	leaveq 
  8010dd:	c3                   	retq   

00000000008010de <strnlen>:
  8010de:	55                   	push   %rbp
  8010df:	48 89 e5             	mov    %rsp,%rbp
  8010e2:	48 83 ec 20          	sub    $0x20,%rsp
  8010e6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010ea:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8010f5:	eb 0e                	jmp    801105 <strnlen+0x27>
  8010f7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8010fb:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801100:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801105:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80110a:	74 0b                	je     801117 <strnlen+0x39>
  80110c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801110:	0f b6 00             	movzbl (%rax),%eax
  801113:	84 c0                	test   %al,%al
  801115:	75 e0                	jne    8010f7 <strnlen+0x19>
  801117:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80111a:	c9                   	leaveq 
  80111b:	c3                   	retq   

000000000080111c <strcpy>:
  80111c:	55                   	push   %rbp
  80111d:	48 89 e5             	mov    %rsp,%rbp
  801120:	48 83 ec 20          	sub    $0x20,%rsp
  801124:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801128:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80112c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801130:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801134:	90                   	nop
  801135:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801139:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80113d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801141:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801145:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801149:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80114d:	0f b6 12             	movzbl (%rdx),%edx
  801150:	88 10                	mov    %dl,(%rax)
  801152:	0f b6 00             	movzbl (%rax),%eax
  801155:	84 c0                	test   %al,%al
  801157:	75 dc                	jne    801135 <strcpy+0x19>
  801159:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80115d:	c9                   	leaveq 
  80115e:	c3                   	retq   

000000000080115f <strcat>:
  80115f:	55                   	push   %rbp
  801160:	48 89 e5             	mov    %rsp,%rbp
  801163:	48 83 ec 20          	sub    $0x20,%rsp
  801167:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80116b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80116f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801173:	48 89 c7             	mov    %rax,%rdi
  801176:	48 b8 b0 10 80 00 00 	movabs $0x8010b0,%rax
  80117d:	00 00 00 
  801180:	ff d0                	callq  *%rax
  801182:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801185:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801188:	48 63 d0             	movslq %eax,%rdx
  80118b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80118f:	48 01 c2             	add    %rax,%rdx
  801192:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801196:	48 89 c6             	mov    %rax,%rsi
  801199:	48 89 d7             	mov    %rdx,%rdi
  80119c:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  8011a3:	00 00 00 
  8011a6:	ff d0                	callq  *%rax
  8011a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ac:	c9                   	leaveq 
  8011ad:	c3                   	retq   

00000000008011ae <strncpy>:
  8011ae:	55                   	push   %rbp
  8011af:	48 89 e5             	mov    %rsp,%rbp
  8011b2:	48 83 ec 28          	sub    $0x28,%rsp
  8011b6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011ba:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011be:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8011ca:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8011d1:	00 
  8011d2:	eb 2a                	jmp    8011fe <strncpy+0x50>
  8011d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011d8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011dc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011e0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011e4:	0f b6 12             	movzbl (%rdx),%edx
  8011e7:	88 10                	mov    %dl,(%rax)
  8011e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011ed:	0f b6 00             	movzbl (%rax),%eax
  8011f0:	84 c0                	test   %al,%al
  8011f2:	74 05                	je     8011f9 <strncpy+0x4b>
  8011f4:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8011f9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801202:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801206:	72 cc                	jb     8011d4 <strncpy+0x26>
  801208:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80120c:	c9                   	leaveq 
  80120d:	c3                   	retq   

000000000080120e <strlcpy>:
  80120e:	55                   	push   %rbp
  80120f:	48 89 e5             	mov    %rsp,%rbp
  801212:	48 83 ec 28          	sub    $0x28,%rsp
  801216:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80121a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80121e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801222:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801226:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80122a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80122f:	74 3d                	je     80126e <strlcpy+0x60>
  801231:	eb 1d                	jmp    801250 <strlcpy+0x42>
  801233:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801237:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80123b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80123f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801243:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801247:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80124b:	0f b6 12             	movzbl (%rdx),%edx
  80124e:	88 10                	mov    %dl,(%rax)
  801250:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801255:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80125a:	74 0b                	je     801267 <strlcpy+0x59>
  80125c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801260:	0f b6 00             	movzbl (%rax),%eax
  801263:	84 c0                	test   %al,%al
  801265:	75 cc                	jne    801233 <strlcpy+0x25>
  801267:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80126b:	c6 00 00             	movb   $0x0,(%rax)
  80126e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801272:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801276:	48 29 c2             	sub    %rax,%rdx
  801279:	48 89 d0             	mov    %rdx,%rax
  80127c:	c9                   	leaveq 
  80127d:	c3                   	retq   

000000000080127e <strcmp>:
  80127e:	55                   	push   %rbp
  80127f:	48 89 e5             	mov    %rsp,%rbp
  801282:	48 83 ec 10          	sub    $0x10,%rsp
  801286:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80128a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80128e:	eb 0a                	jmp    80129a <strcmp+0x1c>
  801290:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801295:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80129a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80129e:	0f b6 00             	movzbl (%rax),%eax
  8012a1:	84 c0                	test   %al,%al
  8012a3:	74 12                	je     8012b7 <strcmp+0x39>
  8012a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012a9:	0f b6 10             	movzbl (%rax),%edx
  8012ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012b0:	0f b6 00             	movzbl (%rax),%eax
  8012b3:	38 c2                	cmp    %al,%dl
  8012b5:	74 d9                	je     801290 <strcmp+0x12>
  8012b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012bb:	0f b6 00             	movzbl (%rax),%eax
  8012be:	0f b6 d0             	movzbl %al,%edx
  8012c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012c5:	0f b6 00             	movzbl (%rax),%eax
  8012c8:	0f b6 c0             	movzbl %al,%eax
  8012cb:	29 c2                	sub    %eax,%edx
  8012cd:	89 d0                	mov    %edx,%eax
  8012cf:	c9                   	leaveq 
  8012d0:	c3                   	retq   

00000000008012d1 <strncmp>:
  8012d1:	55                   	push   %rbp
  8012d2:	48 89 e5             	mov    %rsp,%rbp
  8012d5:	48 83 ec 18          	sub    $0x18,%rsp
  8012d9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012dd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8012e1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012e5:	eb 0f                	jmp    8012f6 <strncmp+0x25>
  8012e7:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8012ec:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012f1:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8012f6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012fb:	74 1d                	je     80131a <strncmp+0x49>
  8012fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801301:	0f b6 00             	movzbl (%rax),%eax
  801304:	84 c0                	test   %al,%al
  801306:	74 12                	je     80131a <strncmp+0x49>
  801308:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80130c:	0f b6 10             	movzbl (%rax),%edx
  80130f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801313:	0f b6 00             	movzbl (%rax),%eax
  801316:	38 c2                	cmp    %al,%dl
  801318:	74 cd                	je     8012e7 <strncmp+0x16>
  80131a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80131f:	75 07                	jne    801328 <strncmp+0x57>
  801321:	b8 00 00 00 00       	mov    $0x0,%eax
  801326:	eb 18                	jmp    801340 <strncmp+0x6f>
  801328:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80132c:	0f b6 00             	movzbl (%rax),%eax
  80132f:	0f b6 d0             	movzbl %al,%edx
  801332:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801336:	0f b6 00             	movzbl (%rax),%eax
  801339:	0f b6 c0             	movzbl %al,%eax
  80133c:	29 c2                	sub    %eax,%edx
  80133e:	89 d0                	mov    %edx,%eax
  801340:	c9                   	leaveq 
  801341:	c3                   	retq   

0000000000801342 <strchr>:
  801342:	55                   	push   %rbp
  801343:	48 89 e5             	mov    %rsp,%rbp
  801346:	48 83 ec 10          	sub    $0x10,%rsp
  80134a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80134e:	89 f0                	mov    %esi,%eax
  801350:	88 45 f4             	mov    %al,-0xc(%rbp)
  801353:	eb 17                	jmp    80136c <strchr+0x2a>
  801355:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801359:	0f b6 00             	movzbl (%rax),%eax
  80135c:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80135f:	75 06                	jne    801367 <strchr+0x25>
  801361:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801365:	eb 15                	jmp    80137c <strchr+0x3a>
  801367:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80136c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801370:	0f b6 00             	movzbl (%rax),%eax
  801373:	84 c0                	test   %al,%al
  801375:	75 de                	jne    801355 <strchr+0x13>
  801377:	b8 00 00 00 00       	mov    $0x0,%eax
  80137c:	c9                   	leaveq 
  80137d:	c3                   	retq   

000000000080137e <strfind>:
  80137e:	55                   	push   %rbp
  80137f:	48 89 e5             	mov    %rsp,%rbp
  801382:	48 83 ec 10          	sub    $0x10,%rsp
  801386:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80138a:	89 f0                	mov    %esi,%eax
  80138c:	88 45 f4             	mov    %al,-0xc(%rbp)
  80138f:	eb 11                	jmp    8013a2 <strfind+0x24>
  801391:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801395:	0f b6 00             	movzbl (%rax),%eax
  801398:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80139b:	74 12                	je     8013af <strfind+0x31>
  80139d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013a6:	0f b6 00             	movzbl (%rax),%eax
  8013a9:	84 c0                	test   %al,%al
  8013ab:	75 e4                	jne    801391 <strfind+0x13>
  8013ad:	eb 01                	jmp    8013b0 <strfind+0x32>
  8013af:	90                   	nop
  8013b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013b4:	c9                   	leaveq 
  8013b5:	c3                   	retq   

00000000008013b6 <memset>:
  8013b6:	55                   	push   %rbp
  8013b7:	48 89 e5             	mov    %rsp,%rbp
  8013ba:	48 83 ec 18          	sub    $0x18,%rsp
  8013be:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013c2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8013c5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013c9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013ce:	75 06                	jne    8013d6 <memset+0x20>
  8013d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013d4:	eb 69                	jmp    80143f <memset+0x89>
  8013d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013da:	83 e0 03             	and    $0x3,%eax
  8013dd:	48 85 c0             	test   %rax,%rax
  8013e0:	75 48                	jne    80142a <memset+0x74>
  8013e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013e6:	83 e0 03             	and    $0x3,%eax
  8013e9:	48 85 c0             	test   %rax,%rax
  8013ec:	75 3c                	jne    80142a <memset+0x74>
  8013ee:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8013f5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013f8:	c1 e0 18             	shl    $0x18,%eax
  8013fb:	89 c2                	mov    %eax,%edx
  8013fd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801400:	c1 e0 10             	shl    $0x10,%eax
  801403:	09 c2                	or     %eax,%edx
  801405:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801408:	c1 e0 08             	shl    $0x8,%eax
  80140b:	09 d0                	or     %edx,%eax
  80140d:	09 45 f4             	or     %eax,-0xc(%rbp)
  801410:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801414:	48 c1 e8 02          	shr    $0x2,%rax
  801418:	48 89 c1             	mov    %rax,%rcx
  80141b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80141f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801422:	48 89 d7             	mov    %rdx,%rdi
  801425:	fc                   	cld    
  801426:	f3 ab                	rep stos %eax,%es:(%rdi)
  801428:	eb 11                	jmp    80143b <memset+0x85>
  80142a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80142e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801431:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801435:	48 89 d7             	mov    %rdx,%rdi
  801438:	fc                   	cld    
  801439:	f3 aa                	rep stos %al,%es:(%rdi)
  80143b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80143f:	c9                   	leaveq 
  801440:	c3                   	retq   

0000000000801441 <memmove>:
  801441:	55                   	push   %rbp
  801442:	48 89 e5             	mov    %rsp,%rbp
  801445:	48 83 ec 28          	sub    $0x28,%rsp
  801449:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80144d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801451:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801455:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801459:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80145d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801461:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801465:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801469:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80146d:	0f 83 88 00 00 00    	jae    8014fb <memmove+0xba>
  801473:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801477:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80147b:	48 01 d0             	add    %rdx,%rax
  80147e:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801482:	76 77                	jbe    8014fb <memmove+0xba>
  801484:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801488:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80148c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801490:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801494:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801498:	83 e0 03             	and    $0x3,%eax
  80149b:	48 85 c0             	test   %rax,%rax
  80149e:	75 3b                	jne    8014db <memmove+0x9a>
  8014a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014a4:	83 e0 03             	and    $0x3,%eax
  8014a7:	48 85 c0             	test   %rax,%rax
  8014aa:	75 2f                	jne    8014db <memmove+0x9a>
  8014ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014b0:	83 e0 03             	and    $0x3,%eax
  8014b3:	48 85 c0             	test   %rax,%rax
  8014b6:	75 23                	jne    8014db <memmove+0x9a>
  8014b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014bc:	48 83 e8 04          	sub    $0x4,%rax
  8014c0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014c4:	48 83 ea 04          	sub    $0x4,%rdx
  8014c8:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014cc:	48 c1 e9 02          	shr    $0x2,%rcx
  8014d0:	48 89 c7             	mov    %rax,%rdi
  8014d3:	48 89 d6             	mov    %rdx,%rsi
  8014d6:	fd                   	std    
  8014d7:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8014d9:	eb 1d                	jmp    8014f8 <memmove+0xb7>
  8014db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014df:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8014e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014e7:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8014eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014ef:	48 89 d7             	mov    %rdx,%rdi
  8014f2:	48 89 c1             	mov    %rax,%rcx
  8014f5:	fd                   	std    
  8014f6:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014f8:	fc                   	cld    
  8014f9:	eb 57                	jmp    801552 <memmove+0x111>
  8014fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014ff:	83 e0 03             	and    $0x3,%eax
  801502:	48 85 c0             	test   %rax,%rax
  801505:	75 36                	jne    80153d <memmove+0xfc>
  801507:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80150b:	83 e0 03             	and    $0x3,%eax
  80150e:	48 85 c0             	test   %rax,%rax
  801511:	75 2a                	jne    80153d <memmove+0xfc>
  801513:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801517:	83 e0 03             	and    $0x3,%eax
  80151a:	48 85 c0             	test   %rax,%rax
  80151d:	75 1e                	jne    80153d <memmove+0xfc>
  80151f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801523:	48 c1 e8 02          	shr    $0x2,%rax
  801527:	48 89 c1             	mov    %rax,%rcx
  80152a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80152e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801532:	48 89 c7             	mov    %rax,%rdi
  801535:	48 89 d6             	mov    %rdx,%rsi
  801538:	fc                   	cld    
  801539:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80153b:	eb 15                	jmp    801552 <memmove+0x111>
  80153d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801541:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801545:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801549:	48 89 c7             	mov    %rax,%rdi
  80154c:	48 89 d6             	mov    %rdx,%rsi
  80154f:	fc                   	cld    
  801550:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801552:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801556:	c9                   	leaveq 
  801557:	c3                   	retq   

0000000000801558 <memcpy>:
  801558:	55                   	push   %rbp
  801559:	48 89 e5             	mov    %rsp,%rbp
  80155c:	48 83 ec 18          	sub    $0x18,%rsp
  801560:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801564:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801568:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80156c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801570:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801574:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801578:	48 89 ce             	mov    %rcx,%rsi
  80157b:	48 89 c7             	mov    %rax,%rdi
  80157e:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  801585:	00 00 00 
  801588:	ff d0                	callq  *%rax
  80158a:	c9                   	leaveq 
  80158b:	c3                   	retq   

000000000080158c <memcmp>:
  80158c:	55                   	push   %rbp
  80158d:	48 89 e5             	mov    %rsp,%rbp
  801590:	48 83 ec 28          	sub    $0x28,%rsp
  801594:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801598:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80159c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015a4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015a8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8015ac:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015b0:	eb 36                	jmp    8015e8 <memcmp+0x5c>
  8015b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b6:	0f b6 10             	movzbl (%rax),%edx
  8015b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015bd:	0f b6 00             	movzbl (%rax),%eax
  8015c0:	38 c2                	cmp    %al,%dl
  8015c2:	74 1a                	je     8015de <memcmp+0x52>
  8015c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015c8:	0f b6 00             	movzbl (%rax),%eax
  8015cb:	0f b6 d0             	movzbl %al,%edx
  8015ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015d2:	0f b6 00             	movzbl (%rax),%eax
  8015d5:	0f b6 c0             	movzbl %al,%eax
  8015d8:	29 c2                	sub    %eax,%edx
  8015da:	89 d0                	mov    %edx,%eax
  8015dc:	eb 20                	jmp    8015fe <memcmp+0x72>
  8015de:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015e3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8015e8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ec:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8015f0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015f4:	48 85 c0             	test   %rax,%rax
  8015f7:	75 b9                	jne    8015b2 <memcmp+0x26>
  8015f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8015fe:	c9                   	leaveq 
  8015ff:	c3                   	retq   

0000000000801600 <memfind>:
  801600:	55                   	push   %rbp
  801601:	48 89 e5             	mov    %rsp,%rbp
  801604:	48 83 ec 28          	sub    $0x28,%rsp
  801608:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80160c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80160f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801613:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801617:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161b:	48 01 d0             	add    %rdx,%rax
  80161e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801622:	eb 13                	jmp    801637 <memfind+0x37>
  801624:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801628:	0f b6 00             	movzbl (%rax),%eax
  80162b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80162e:	38 d0                	cmp    %dl,%al
  801630:	74 11                	je     801643 <memfind+0x43>
  801632:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801637:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80163b:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80163f:	72 e3                	jb     801624 <memfind+0x24>
  801641:	eb 01                	jmp    801644 <memfind+0x44>
  801643:	90                   	nop
  801644:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801648:	c9                   	leaveq 
  801649:	c3                   	retq   

000000000080164a <strtol>:
  80164a:	55                   	push   %rbp
  80164b:	48 89 e5             	mov    %rsp,%rbp
  80164e:	48 83 ec 38          	sub    $0x38,%rsp
  801652:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801656:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80165a:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80165d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801664:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80166b:	00 
  80166c:	eb 05                	jmp    801673 <strtol+0x29>
  80166e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801673:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801677:	0f b6 00             	movzbl (%rax),%eax
  80167a:	3c 20                	cmp    $0x20,%al
  80167c:	74 f0                	je     80166e <strtol+0x24>
  80167e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801682:	0f b6 00             	movzbl (%rax),%eax
  801685:	3c 09                	cmp    $0x9,%al
  801687:	74 e5                	je     80166e <strtol+0x24>
  801689:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80168d:	0f b6 00             	movzbl (%rax),%eax
  801690:	3c 2b                	cmp    $0x2b,%al
  801692:	75 07                	jne    80169b <strtol+0x51>
  801694:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801699:	eb 17                	jmp    8016b2 <strtol+0x68>
  80169b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80169f:	0f b6 00             	movzbl (%rax),%eax
  8016a2:	3c 2d                	cmp    $0x2d,%al
  8016a4:	75 0c                	jne    8016b2 <strtol+0x68>
  8016a6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016ab:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8016b2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016b6:	74 06                	je     8016be <strtol+0x74>
  8016b8:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8016bc:	75 28                	jne    8016e6 <strtol+0x9c>
  8016be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c2:	0f b6 00             	movzbl (%rax),%eax
  8016c5:	3c 30                	cmp    $0x30,%al
  8016c7:	75 1d                	jne    8016e6 <strtol+0x9c>
  8016c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016cd:	48 83 c0 01          	add    $0x1,%rax
  8016d1:	0f b6 00             	movzbl (%rax),%eax
  8016d4:	3c 78                	cmp    $0x78,%al
  8016d6:	75 0e                	jne    8016e6 <strtol+0x9c>
  8016d8:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8016dd:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8016e4:	eb 2c                	jmp    801712 <strtol+0xc8>
  8016e6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016ea:	75 19                	jne    801705 <strtol+0xbb>
  8016ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016f0:	0f b6 00             	movzbl (%rax),%eax
  8016f3:	3c 30                	cmp    $0x30,%al
  8016f5:	75 0e                	jne    801705 <strtol+0xbb>
  8016f7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016fc:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801703:	eb 0d                	jmp    801712 <strtol+0xc8>
  801705:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801709:	75 07                	jne    801712 <strtol+0xc8>
  80170b:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801712:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801716:	0f b6 00             	movzbl (%rax),%eax
  801719:	3c 2f                	cmp    $0x2f,%al
  80171b:	7e 1d                	jle    80173a <strtol+0xf0>
  80171d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801721:	0f b6 00             	movzbl (%rax),%eax
  801724:	3c 39                	cmp    $0x39,%al
  801726:	7f 12                	jg     80173a <strtol+0xf0>
  801728:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80172c:	0f b6 00             	movzbl (%rax),%eax
  80172f:	0f be c0             	movsbl %al,%eax
  801732:	83 e8 30             	sub    $0x30,%eax
  801735:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801738:	eb 4e                	jmp    801788 <strtol+0x13e>
  80173a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80173e:	0f b6 00             	movzbl (%rax),%eax
  801741:	3c 60                	cmp    $0x60,%al
  801743:	7e 1d                	jle    801762 <strtol+0x118>
  801745:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801749:	0f b6 00             	movzbl (%rax),%eax
  80174c:	3c 7a                	cmp    $0x7a,%al
  80174e:	7f 12                	jg     801762 <strtol+0x118>
  801750:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801754:	0f b6 00             	movzbl (%rax),%eax
  801757:	0f be c0             	movsbl %al,%eax
  80175a:	83 e8 57             	sub    $0x57,%eax
  80175d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801760:	eb 26                	jmp    801788 <strtol+0x13e>
  801762:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801766:	0f b6 00             	movzbl (%rax),%eax
  801769:	3c 40                	cmp    $0x40,%al
  80176b:	7e 47                	jle    8017b4 <strtol+0x16a>
  80176d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801771:	0f b6 00             	movzbl (%rax),%eax
  801774:	3c 5a                	cmp    $0x5a,%al
  801776:	7f 3c                	jg     8017b4 <strtol+0x16a>
  801778:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177c:	0f b6 00             	movzbl (%rax),%eax
  80177f:	0f be c0             	movsbl %al,%eax
  801782:	83 e8 37             	sub    $0x37,%eax
  801785:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801788:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80178b:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80178e:	7d 23                	jge    8017b3 <strtol+0x169>
  801790:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801795:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801798:	48 98                	cltq   
  80179a:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80179f:	48 89 c2             	mov    %rax,%rdx
  8017a2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8017a5:	48 98                	cltq   
  8017a7:	48 01 d0             	add    %rdx,%rax
  8017aa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017ae:	e9 5f ff ff ff       	jmpq   801712 <strtol+0xc8>
  8017b3:	90                   	nop
  8017b4:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8017b9:	74 0b                	je     8017c6 <strtol+0x17c>
  8017bb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017bf:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8017c3:	48 89 10             	mov    %rdx,(%rax)
  8017c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8017ca:	74 09                	je     8017d5 <strtol+0x18b>
  8017cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017d0:	48 f7 d8             	neg    %rax
  8017d3:	eb 04                	jmp    8017d9 <strtol+0x18f>
  8017d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017d9:	c9                   	leaveq 
  8017da:	c3                   	retq   

00000000008017db <strstr>:
  8017db:	55                   	push   %rbp
  8017dc:	48 89 e5             	mov    %rsp,%rbp
  8017df:	48 83 ec 30          	sub    $0x30,%rsp
  8017e3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8017e7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8017eb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017ef:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017f3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017f7:	0f b6 00             	movzbl (%rax),%eax
  8017fa:	88 45 ff             	mov    %al,-0x1(%rbp)
  8017fd:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801801:	75 06                	jne    801809 <strstr+0x2e>
  801803:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801807:	eb 6b                	jmp    801874 <strstr+0x99>
  801809:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80180d:	48 89 c7             	mov    %rax,%rdi
  801810:	48 b8 b0 10 80 00 00 	movabs $0x8010b0,%rax
  801817:	00 00 00 
  80181a:	ff d0                	callq  *%rax
  80181c:	48 98                	cltq   
  80181e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801822:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801826:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80182a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80182e:	0f b6 00             	movzbl (%rax),%eax
  801831:	88 45 ef             	mov    %al,-0x11(%rbp)
  801834:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801838:	75 07                	jne    801841 <strstr+0x66>
  80183a:	b8 00 00 00 00       	mov    $0x0,%eax
  80183f:	eb 33                	jmp    801874 <strstr+0x99>
  801841:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801845:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801848:	75 d8                	jne    801822 <strstr+0x47>
  80184a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80184e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801852:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801856:	48 89 ce             	mov    %rcx,%rsi
  801859:	48 89 c7             	mov    %rax,%rdi
  80185c:	48 b8 d1 12 80 00 00 	movabs $0x8012d1,%rax
  801863:	00 00 00 
  801866:	ff d0                	callq  *%rax
  801868:	85 c0                	test   %eax,%eax
  80186a:	75 b6                	jne    801822 <strstr+0x47>
  80186c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801870:	48 83 e8 01          	sub    $0x1,%rax
  801874:	c9                   	leaveq 
  801875:	c3                   	retq   

0000000000801876 <syscall>:
  801876:	55                   	push   %rbp
  801877:	48 89 e5             	mov    %rsp,%rbp
  80187a:	53                   	push   %rbx
  80187b:	48 83 ec 48          	sub    $0x48,%rsp
  80187f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801882:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801885:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801889:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80188d:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801891:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801895:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801898:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80189c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8018a0:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8018a4:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8018a8:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8018ac:	4c 89 c3             	mov    %r8,%rbx
  8018af:	cd 30                	int    $0x30
  8018b1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8018b5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8018b9:	74 3e                	je     8018f9 <syscall+0x83>
  8018bb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8018c0:	7e 37                	jle    8018f9 <syscall+0x83>
  8018c2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018c6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8018c9:	49 89 d0             	mov    %rdx,%r8
  8018cc:	89 c1                	mov    %eax,%ecx
  8018ce:	48 ba e8 5a 80 00 00 	movabs $0x805ae8,%rdx
  8018d5:	00 00 00 
  8018d8:	be 24 00 00 00       	mov    $0x24,%esi
  8018dd:	48 bf 05 5b 80 00 00 	movabs $0x805b05,%rdi
  8018e4:	00 00 00 
  8018e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8018ec:	49 b9 52 03 80 00 00 	movabs $0x800352,%r9
  8018f3:	00 00 00 
  8018f6:	41 ff d1             	callq  *%r9
  8018f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018fd:	48 83 c4 48          	add    $0x48,%rsp
  801901:	5b                   	pop    %rbx
  801902:	5d                   	pop    %rbp
  801903:	c3                   	retq   

0000000000801904 <sys_cputs>:
  801904:	55                   	push   %rbp
  801905:	48 89 e5             	mov    %rsp,%rbp
  801908:	48 83 ec 10          	sub    $0x10,%rsp
  80190c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801910:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801914:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801918:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80191c:	48 83 ec 08          	sub    $0x8,%rsp
  801920:	6a 00                	pushq  $0x0
  801922:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801928:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80192e:	48 89 d1             	mov    %rdx,%rcx
  801931:	48 89 c2             	mov    %rax,%rdx
  801934:	be 00 00 00 00       	mov    $0x0,%esi
  801939:	bf 00 00 00 00       	mov    $0x0,%edi
  80193e:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801945:	00 00 00 
  801948:	ff d0                	callq  *%rax
  80194a:	48 83 c4 10          	add    $0x10,%rsp
  80194e:	90                   	nop
  80194f:	c9                   	leaveq 
  801950:	c3                   	retq   

0000000000801951 <sys_cgetc>:
  801951:	55                   	push   %rbp
  801952:	48 89 e5             	mov    %rsp,%rbp
  801955:	48 83 ec 08          	sub    $0x8,%rsp
  801959:	6a 00                	pushq  $0x0
  80195b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801961:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801967:	b9 00 00 00 00       	mov    $0x0,%ecx
  80196c:	ba 00 00 00 00       	mov    $0x0,%edx
  801971:	be 00 00 00 00       	mov    $0x0,%esi
  801976:	bf 01 00 00 00       	mov    $0x1,%edi
  80197b:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801982:	00 00 00 
  801985:	ff d0                	callq  *%rax
  801987:	48 83 c4 10          	add    $0x10,%rsp
  80198b:	c9                   	leaveq 
  80198c:	c3                   	retq   

000000000080198d <sys_env_destroy>:
  80198d:	55                   	push   %rbp
  80198e:	48 89 e5             	mov    %rsp,%rbp
  801991:	48 83 ec 10          	sub    $0x10,%rsp
  801995:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801998:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80199b:	48 98                	cltq   
  80199d:	48 83 ec 08          	sub    $0x8,%rsp
  8019a1:	6a 00                	pushq  $0x0
  8019a3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019a9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019af:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019b4:	48 89 c2             	mov    %rax,%rdx
  8019b7:	be 01 00 00 00       	mov    $0x1,%esi
  8019bc:	bf 03 00 00 00       	mov    $0x3,%edi
  8019c1:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  8019c8:	00 00 00 
  8019cb:	ff d0                	callq  *%rax
  8019cd:	48 83 c4 10          	add    $0x10,%rsp
  8019d1:	c9                   	leaveq 
  8019d2:	c3                   	retq   

00000000008019d3 <sys_getenvid>:
  8019d3:	55                   	push   %rbp
  8019d4:	48 89 e5             	mov    %rsp,%rbp
  8019d7:	48 83 ec 08          	sub    $0x8,%rsp
  8019db:	6a 00                	pushq  $0x0
  8019dd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019e3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019e9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019ee:	ba 00 00 00 00       	mov    $0x0,%edx
  8019f3:	be 00 00 00 00       	mov    $0x0,%esi
  8019f8:	bf 02 00 00 00       	mov    $0x2,%edi
  8019fd:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801a04:	00 00 00 
  801a07:	ff d0                	callq  *%rax
  801a09:	48 83 c4 10          	add    $0x10,%rsp
  801a0d:	c9                   	leaveq 
  801a0e:	c3                   	retq   

0000000000801a0f <sys_yield>:
  801a0f:	55                   	push   %rbp
  801a10:	48 89 e5             	mov    %rsp,%rbp
  801a13:	48 83 ec 08          	sub    $0x8,%rsp
  801a17:	6a 00                	pushq  $0x0
  801a19:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a1f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a25:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a2a:	ba 00 00 00 00       	mov    $0x0,%edx
  801a2f:	be 00 00 00 00       	mov    $0x0,%esi
  801a34:	bf 0b 00 00 00       	mov    $0xb,%edi
  801a39:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801a40:	00 00 00 
  801a43:	ff d0                	callq  *%rax
  801a45:	48 83 c4 10          	add    $0x10,%rsp
  801a49:	90                   	nop
  801a4a:	c9                   	leaveq 
  801a4b:	c3                   	retq   

0000000000801a4c <sys_page_alloc>:
  801a4c:	55                   	push   %rbp
  801a4d:	48 89 e5             	mov    %rsp,%rbp
  801a50:	48 83 ec 10          	sub    $0x10,%rsp
  801a54:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a57:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a5b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a5e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a61:	48 63 c8             	movslq %eax,%rcx
  801a64:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a68:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a6b:	48 98                	cltq   
  801a6d:	48 83 ec 08          	sub    $0x8,%rsp
  801a71:	6a 00                	pushq  $0x0
  801a73:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a79:	49 89 c8             	mov    %rcx,%r8
  801a7c:	48 89 d1             	mov    %rdx,%rcx
  801a7f:	48 89 c2             	mov    %rax,%rdx
  801a82:	be 01 00 00 00       	mov    $0x1,%esi
  801a87:	bf 04 00 00 00       	mov    $0x4,%edi
  801a8c:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801a93:	00 00 00 
  801a96:	ff d0                	callq  *%rax
  801a98:	48 83 c4 10          	add    $0x10,%rsp
  801a9c:	c9                   	leaveq 
  801a9d:	c3                   	retq   

0000000000801a9e <sys_page_map>:
  801a9e:	55                   	push   %rbp
  801a9f:	48 89 e5             	mov    %rsp,%rbp
  801aa2:	48 83 ec 20          	sub    $0x20,%rsp
  801aa6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801aa9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aad:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801ab0:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801ab4:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801ab8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801abb:	48 63 c8             	movslq %eax,%rcx
  801abe:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801ac2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ac5:	48 63 f0             	movslq %eax,%rsi
  801ac8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801acc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801acf:	48 98                	cltq   
  801ad1:	48 83 ec 08          	sub    $0x8,%rsp
  801ad5:	51                   	push   %rcx
  801ad6:	49 89 f9             	mov    %rdi,%r9
  801ad9:	49 89 f0             	mov    %rsi,%r8
  801adc:	48 89 d1             	mov    %rdx,%rcx
  801adf:	48 89 c2             	mov    %rax,%rdx
  801ae2:	be 01 00 00 00       	mov    $0x1,%esi
  801ae7:	bf 05 00 00 00       	mov    $0x5,%edi
  801aec:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801af3:	00 00 00 
  801af6:	ff d0                	callq  *%rax
  801af8:	48 83 c4 10          	add    $0x10,%rsp
  801afc:	c9                   	leaveq 
  801afd:	c3                   	retq   

0000000000801afe <sys_page_unmap>:
  801afe:	55                   	push   %rbp
  801aff:	48 89 e5             	mov    %rsp,%rbp
  801b02:	48 83 ec 10          	sub    $0x10,%rsp
  801b06:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b09:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b0d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b14:	48 98                	cltq   
  801b16:	48 83 ec 08          	sub    $0x8,%rsp
  801b1a:	6a 00                	pushq  $0x0
  801b1c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b22:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b28:	48 89 d1             	mov    %rdx,%rcx
  801b2b:	48 89 c2             	mov    %rax,%rdx
  801b2e:	be 01 00 00 00       	mov    $0x1,%esi
  801b33:	bf 06 00 00 00       	mov    $0x6,%edi
  801b38:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801b3f:	00 00 00 
  801b42:	ff d0                	callq  *%rax
  801b44:	48 83 c4 10          	add    $0x10,%rsp
  801b48:	c9                   	leaveq 
  801b49:	c3                   	retq   

0000000000801b4a <sys_env_set_status>:
  801b4a:	55                   	push   %rbp
  801b4b:	48 89 e5             	mov    %rsp,%rbp
  801b4e:	48 83 ec 10          	sub    $0x10,%rsp
  801b52:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b55:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801b58:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b5b:	48 63 d0             	movslq %eax,%rdx
  801b5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b61:	48 98                	cltq   
  801b63:	48 83 ec 08          	sub    $0x8,%rsp
  801b67:	6a 00                	pushq  $0x0
  801b69:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b6f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b75:	48 89 d1             	mov    %rdx,%rcx
  801b78:	48 89 c2             	mov    %rax,%rdx
  801b7b:	be 01 00 00 00       	mov    $0x1,%esi
  801b80:	bf 08 00 00 00       	mov    $0x8,%edi
  801b85:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801b8c:	00 00 00 
  801b8f:	ff d0                	callq  *%rax
  801b91:	48 83 c4 10          	add    $0x10,%rsp
  801b95:	c9                   	leaveq 
  801b96:	c3                   	retq   

0000000000801b97 <sys_env_set_trapframe>:
  801b97:	55                   	push   %rbp
  801b98:	48 89 e5             	mov    %rsp,%rbp
  801b9b:	48 83 ec 10          	sub    $0x10,%rsp
  801b9f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ba2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ba6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801baa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bad:	48 98                	cltq   
  801baf:	48 83 ec 08          	sub    $0x8,%rsp
  801bb3:	6a 00                	pushq  $0x0
  801bb5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bbb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bc1:	48 89 d1             	mov    %rdx,%rcx
  801bc4:	48 89 c2             	mov    %rax,%rdx
  801bc7:	be 01 00 00 00       	mov    $0x1,%esi
  801bcc:	bf 09 00 00 00       	mov    $0x9,%edi
  801bd1:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801bd8:	00 00 00 
  801bdb:	ff d0                	callq  *%rax
  801bdd:	48 83 c4 10          	add    $0x10,%rsp
  801be1:	c9                   	leaveq 
  801be2:	c3                   	retq   

0000000000801be3 <sys_env_set_pgfault_upcall>:
  801be3:	55                   	push   %rbp
  801be4:	48 89 e5             	mov    %rsp,%rbp
  801be7:	48 83 ec 10          	sub    $0x10,%rsp
  801beb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bf2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bf6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bf9:	48 98                	cltq   
  801bfb:	48 83 ec 08          	sub    $0x8,%rsp
  801bff:	6a 00                	pushq  $0x0
  801c01:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c07:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c0d:	48 89 d1             	mov    %rdx,%rcx
  801c10:	48 89 c2             	mov    %rax,%rdx
  801c13:	be 01 00 00 00       	mov    $0x1,%esi
  801c18:	bf 0a 00 00 00       	mov    $0xa,%edi
  801c1d:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801c24:	00 00 00 
  801c27:	ff d0                	callq  *%rax
  801c29:	48 83 c4 10          	add    $0x10,%rsp
  801c2d:	c9                   	leaveq 
  801c2e:	c3                   	retq   

0000000000801c2f <sys_ipc_try_send>:
  801c2f:	55                   	push   %rbp
  801c30:	48 89 e5             	mov    %rsp,%rbp
  801c33:	48 83 ec 20          	sub    $0x20,%rsp
  801c37:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c3a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c3e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c42:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801c45:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c48:	48 63 f0             	movslq %eax,%rsi
  801c4b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801c4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c52:	48 98                	cltq   
  801c54:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c58:	48 83 ec 08          	sub    $0x8,%rsp
  801c5c:	6a 00                	pushq  $0x0
  801c5e:	49 89 f1             	mov    %rsi,%r9
  801c61:	49 89 c8             	mov    %rcx,%r8
  801c64:	48 89 d1             	mov    %rdx,%rcx
  801c67:	48 89 c2             	mov    %rax,%rdx
  801c6a:	be 00 00 00 00       	mov    $0x0,%esi
  801c6f:	bf 0c 00 00 00       	mov    $0xc,%edi
  801c74:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801c7b:	00 00 00 
  801c7e:	ff d0                	callq  *%rax
  801c80:	48 83 c4 10          	add    $0x10,%rsp
  801c84:	c9                   	leaveq 
  801c85:	c3                   	retq   

0000000000801c86 <sys_ipc_recv>:
  801c86:	55                   	push   %rbp
  801c87:	48 89 e5             	mov    %rsp,%rbp
  801c8a:	48 83 ec 10          	sub    $0x10,%rsp
  801c8e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c96:	48 83 ec 08          	sub    $0x8,%rsp
  801c9a:	6a 00                	pushq  $0x0
  801c9c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ca2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ca8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cad:	48 89 c2             	mov    %rax,%rdx
  801cb0:	be 01 00 00 00       	mov    $0x1,%esi
  801cb5:	bf 0d 00 00 00       	mov    $0xd,%edi
  801cba:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801cc1:	00 00 00 
  801cc4:	ff d0                	callq  *%rax
  801cc6:	48 83 c4 10          	add    $0x10,%rsp
  801cca:	c9                   	leaveq 
  801ccb:	c3                   	retq   

0000000000801ccc <sys_time_msec>:
  801ccc:	55                   	push   %rbp
  801ccd:	48 89 e5             	mov    %rsp,%rbp
  801cd0:	48 83 ec 08          	sub    $0x8,%rsp
  801cd4:	6a 00                	pushq  $0x0
  801cd6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cdc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ce2:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ce7:	ba 00 00 00 00       	mov    $0x0,%edx
  801cec:	be 00 00 00 00       	mov    $0x0,%esi
  801cf1:	bf 0e 00 00 00       	mov    $0xe,%edi
  801cf6:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801cfd:	00 00 00 
  801d00:	ff d0                	callq  *%rax
  801d02:	48 83 c4 10          	add    $0x10,%rsp
  801d06:	c9                   	leaveq 
  801d07:	c3                   	retq   

0000000000801d08 <sys_net_transmit>:
  801d08:	55                   	push   %rbp
  801d09:	48 89 e5             	mov    %rsp,%rbp
  801d0c:	48 83 ec 10          	sub    $0x10,%rsp
  801d10:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d14:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d17:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d1e:	48 83 ec 08          	sub    $0x8,%rsp
  801d22:	6a 00                	pushq  $0x0
  801d24:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d2a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d30:	48 89 d1             	mov    %rdx,%rcx
  801d33:	48 89 c2             	mov    %rax,%rdx
  801d36:	be 00 00 00 00       	mov    $0x0,%esi
  801d3b:	bf 0f 00 00 00       	mov    $0xf,%edi
  801d40:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801d47:	00 00 00 
  801d4a:	ff d0                	callq  *%rax
  801d4c:	48 83 c4 10          	add    $0x10,%rsp
  801d50:	c9                   	leaveq 
  801d51:	c3                   	retq   

0000000000801d52 <sys_net_receive>:
  801d52:	55                   	push   %rbp
  801d53:	48 89 e5             	mov    %rsp,%rbp
  801d56:	48 83 ec 10          	sub    $0x10,%rsp
  801d5a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d5e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d61:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d64:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d68:	48 83 ec 08          	sub    $0x8,%rsp
  801d6c:	6a 00                	pushq  $0x0
  801d6e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d74:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d7a:	48 89 d1             	mov    %rdx,%rcx
  801d7d:	48 89 c2             	mov    %rax,%rdx
  801d80:	be 00 00 00 00       	mov    $0x0,%esi
  801d85:	bf 10 00 00 00       	mov    $0x10,%edi
  801d8a:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801d91:	00 00 00 
  801d94:	ff d0                	callq  *%rax
  801d96:	48 83 c4 10          	add    $0x10,%rsp
  801d9a:	c9                   	leaveq 
  801d9b:	c3                   	retq   

0000000000801d9c <sys_ept_map>:
  801d9c:	55                   	push   %rbp
  801d9d:	48 89 e5             	mov    %rsp,%rbp
  801da0:	48 83 ec 20          	sub    $0x20,%rsp
  801da4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801da7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dab:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801dae:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801db2:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801db6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801db9:	48 63 c8             	movslq %eax,%rcx
  801dbc:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801dc0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801dc3:	48 63 f0             	movslq %eax,%rsi
  801dc6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dcd:	48 98                	cltq   
  801dcf:	48 83 ec 08          	sub    $0x8,%rsp
  801dd3:	51                   	push   %rcx
  801dd4:	49 89 f9             	mov    %rdi,%r9
  801dd7:	49 89 f0             	mov    %rsi,%r8
  801dda:	48 89 d1             	mov    %rdx,%rcx
  801ddd:	48 89 c2             	mov    %rax,%rdx
  801de0:	be 00 00 00 00       	mov    $0x0,%esi
  801de5:	bf 11 00 00 00       	mov    $0x11,%edi
  801dea:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801df1:	00 00 00 
  801df4:	ff d0                	callq  *%rax
  801df6:	48 83 c4 10          	add    $0x10,%rsp
  801dfa:	c9                   	leaveq 
  801dfb:	c3                   	retq   

0000000000801dfc <sys_env_mkguest>:
  801dfc:	55                   	push   %rbp
  801dfd:	48 89 e5             	mov    %rsp,%rbp
  801e00:	48 83 ec 10          	sub    $0x10,%rsp
  801e04:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e08:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e0c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e14:	48 83 ec 08          	sub    $0x8,%rsp
  801e18:	6a 00                	pushq  $0x0
  801e1a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e20:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e26:	48 89 d1             	mov    %rdx,%rcx
  801e29:	48 89 c2             	mov    %rax,%rdx
  801e2c:	be 00 00 00 00       	mov    $0x0,%esi
  801e31:	bf 12 00 00 00       	mov    $0x12,%edi
  801e36:	48 b8 76 18 80 00 00 	movabs $0x801876,%rax
  801e3d:	00 00 00 
  801e40:	ff d0                	callq  *%rax
  801e42:	48 83 c4 10          	add    $0x10,%rsp
  801e46:	c9                   	leaveq 
  801e47:	c3                   	retq   

0000000000801e48 <pgfault>:
  801e48:	55                   	push   %rbp
  801e49:	48 89 e5             	mov    %rsp,%rbp
  801e4c:	48 83 ec 30          	sub    $0x30,%rsp
  801e50:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801e54:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e58:	48 8b 00             	mov    (%rax),%rax
  801e5b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801e5f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e63:	48 8b 40 08          	mov    0x8(%rax),%rax
  801e67:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e6d:	83 e0 02             	and    $0x2,%eax
  801e70:	85 c0                	test   %eax,%eax
  801e72:	75 40                	jne    801eb4 <pgfault+0x6c>
  801e74:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801e78:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801e7f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e83:	49 89 d0             	mov    %rdx,%r8
  801e86:	48 89 c1             	mov    %rax,%rcx
  801e89:	48 ba 18 5b 80 00 00 	movabs $0x805b18,%rdx
  801e90:	00 00 00 
  801e93:	be 1f 00 00 00       	mov    $0x1f,%esi
  801e98:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  801e9f:	00 00 00 
  801ea2:	b8 00 00 00 00       	mov    $0x0,%eax
  801ea7:	49 b9 52 03 80 00 00 	movabs $0x800352,%r9
  801eae:	00 00 00 
  801eb1:	41 ff d1             	callq  *%r9
  801eb4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801eb8:	48 c1 e8 0c          	shr    $0xc,%rax
  801ebc:	48 89 c2             	mov    %rax,%rdx
  801ebf:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801ec6:	01 00 00 
  801ec9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ecd:	25 07 08 00 00       	and    $0x807,%eax
  801ed2:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801ed8:	74 4e                	je     801f28 <pgfault+0xe0>
  801eda:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ede:	48 c1 e8 0c          	shr    $0xc,%rax
  801ee2:	48 89 c2             	mov    %rax,%rdx
  801ee5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801eec:	01 00 00 
  801eef:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801ef3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ef7:	49 89 d0             	mov    %rdx,%r8
  801efa:	48 89 c1             	mov    %rax,%rcx
  801efd:	48 ba 40 5b 80 00 00 	movabs $0x805b40,%rdx
  801f04:	00 00 00 
  801f07:	be 22 00 00 00       	mov    $0x22,%esi
  801f0c:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  801f13:	00 00 00 
  801f16:	b8 00 00 00 00       	mov    $0x0,%eax
  801f1b:	49 b9 52 03 80 00 00 	movabs $0x800352,%r9
  801f22:	00 00 00 
  801f25:	41 ff d1             	callq  *%r9
  801f28:	ba 07 00 00 00       	mov    $0x7,%edx
  801f2d:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801f32:	bf 00 00 00 00       	mov    $0x0,%edi
  801f37:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  801f3e:	00 00 00 
  801f41:	ff d0                	callq  *%rax
  801f43:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801f46:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801f4a:	79 30                	jns    801f7c <pgfault+0x134>
  801f4c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f4f:	89 c1                	mov    %eax,%ecx
  801f51:	48 ba 6b 5b 80 00 00 	movabs $0x805b6b,%rdx
  801f58:	00 00 00 
  801f5b:	be 30 00 00 00       	mov    $0x30,%esi
  801f60:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  801f67:	00 00 00 
  801f6a:	b8 00 00 00 00       	mov    $0x0,%eax
  801f6f:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  801f76:	00 00 00 
  801f79:	41 ff d0             	callq  *%r8
  801f7c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f80:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f84:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f88:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801f8e:	ba 00 10 00 00       	mov    $0x1000,%edx
  801f93:	48 89 c6             	mov    %rax,%rsi
  801f96:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  801f9b:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  801fa2:	00 00 00 
  801fa5:	ff d0                	callq  *%rax
  801fa7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fab:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801faf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fb3:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801fb9:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  801fbf:	48 89 c1             	mov    %rax,%rcx
  801fc2:	ba 00 00 00 00       	mov    $0x0,%edx
  801fc7:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801fcc:	bf 00 00 00 00       	mov    $0x0,%edi
  801fd1:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  801fd8:	00 00 00 
  801fdb:	ff d0                	callq  *%rax
  801fdd:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801fe0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801fe4:	79 30                	jns    802016 <pgfault+0x1ce>
  801fe6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801fe9:	89 c1                	mov    %eax,%ecx
  801feb:	48 ba 7e 5b 80 00 00 	movabs $0x805b7e,%rdx
  801ff2:	00 00 00 
  801ff5:	be 35 00 00 00       	mov    $0x35,%esi
  801ffa:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  802001:	00 00 00 
  802004:	b8 00 00 00 00       	mov    $0x0,%eax
  802009:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  802010:	00 00 00 
  802013:	41 ff d0             	callq  *%r8
  802016:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80201b:	bf 00 00 00 00       	mov    $0x0,%edi
  802020:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  802027:	00 00 00 
  80202a:	ff d0                	callq  *%rax
  80202c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80202f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802033:	79 30                	jns    802065 <pgfault+0x21d>
  802035:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802038:	89 c1                	mov    %eax,%ecx
  80203a:	48 ba 8f 5b 80 00 00 	movabs $0x805b8f,%rdx
  802041:	00 00 00 
  802044:	be 39 00 00 00       	mov    $0x39,%esi
  802049:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  802050:	00 00 00 
  802053:	b8 00 00 00 00       	mov    $0x0,%eax
  802058:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  80205f:	00 00 00 
  802062:	41 ff d0             	callq  *%r8
  802065:	90                   	nop
  802066:	c9                   	leaveq 
  802067:	c3                   	retq   

0000000000802068 <duppage>:
  802068:	55                   	push   %rbp
  802069:	48 89 e5             	mov    %rsp,%rbp
  80206c:	48 83 ec 30          	sub    $0x30,%rsp
  802070:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802073:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802076:	8b 45 d8             	mov    -0x28(%rbp),%eax
  802079:	c1 e0 0c             	shl    $0xc,%eax
  80207c:	89 c0                	mov    %eax,%eax
  80207e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802082:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802089:	01 00 00 
  80208c:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80208f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802093:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802097:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80209b:	25 02 08 00 00       	and    $0x802,%eax
  8020a0:	48 85 c0             	test   %rax,%rax
  8020a3:	74 0e                	je     8020b3 <duppage+0x4b>
  8020a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020a9:	25 00 04 00 00       	and    $0x400,%eax
  8020ae:	48 85 c0             	test   %rax,%rax
  8020b1:	74 70                	je     802123 <duppage+0xbb>
  8020b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020b7:	25 07 0e 00 00       	and    $0xe07,%eax
  8020bc:	89 c6                	mov    %eax,%esi
  8020be:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  8020c2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8020c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020c9:	41 89 f0             	mov    %esi,%r8d
  8020cc:	48 89 c6             	mov    %rax,%rsi
  8020cf:	bf 00 00 00 00       	mov    $0x0,%edi
  8020d4:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  8020db:	00 00 00 
  8020de:	ff d0                	callq  *%rax
  8020e0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8020e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8020e7:	79 30                	jns    802119 <duppage+0xb1>
  8020e9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8020ec:	89 c1                	mov    %eax,%ecx
  8020ee:	48 ba 7e 5b 80 00 00 	movabs $0x805b7e,%rdx
  8020f5:	00 00 00 
  8020f8:	be 63 00 00 00       	mov    $0x63,%esi
  8020fd:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  802104:	00 00 00 
  802107:	b8 00 00 00 00       	mov    $0x0,%eax
  80210c:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  802113:	00 00 00 
  802116:	41 ff d0             	callq  *%r8
  802119:	b8 00 00 00 00       	mov    $0x0,%eax
  80211e:	e9 c4 00 00 00       	jmpq   8021e7 <duppage+0x17f>
  802123:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802127:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80212a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80212e:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802134:	48 89 c6             	mov    %rax,%rsi
  802137:	bf 00 00 00 00       	mov    $0x0,%edi
  80213c:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  802143:	00 00 00 
  802146:	ff d0                	callq  *%rax
  802148:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80214b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80214f:	79 30                	jns    802181 <duppage+0x119>
  802151:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802154:	89 c1                	mov    %eax,%ecx
  802156:	48 ba 7e 5b 80 00 00 	movabs $0x805b7e,%rdx
  80215d:	00 00 00 
  802160:	be 7e 00 00 00       	mov    $0x7e,%esi
  802165:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  80216c:	00 00 00 
  80216f:	b8 00 00 00 00       	mov    $0x0,%eax
  802174:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  80217b:	00 00 00 
  80217e:	41 ff d0             	callq  *%r8
  802181:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802185:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802189:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  80218f:	48 89 d1             	mov    %rdx,%rcx
  802192:	ba 00 00 00 00       	mov    $0x0,%edx
  802197:	48 89 c6             	mov    %rax,%rsi
  80219a:	bf 00 00 00 00       	mov    $0x0,%edi
  80219f:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  8021a6:	00 00 00 
  8021a9:	ff d0                	callq  *%rax
  8021ab:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8021ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8021b2:	79 30                	jns    8021e4 <duppage+0x17c>
  8021b4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021b7:	89 c1                	mov    %eax,%ecx
  8021b9:	48 ba 7e 5b 80 00 00 	movabs $0x805b7e,%rdx
  8021c0:	00 00 00 
  8021c3:	be 80 00 00 00       	mov    $0x80,%esi
  8021c8:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  8021cf:	00 00 00 
  8021d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8021d7:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  8021de:	00 00 00 
  8021e1:	41 ff d0             	callq  *%r8
  8021e4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8021e7:	c9                   	leaveq 
  8021e8:	c3                   	retq   

00000000008021e9 <fork>:
  8021e9:	55                   	push   %rbp
  8021ea:	48 89 e5             	mov    %rsp,%rbp
  8021ed:	48 83 ec 20          	sub    $0x20,%rsp
  8021f1:	48 bf 48 1e 80 00 00 	movabs $0x801e48,%rdi
  8021f8:	00 00 00 
  8021fb:	48 b8 10 51 80 00 00 	movabs $0x805110,%rax
  802202:	00 00 00 
  802205:	ff d0                	callq  *%rax
  802207:	b8 07 00 00 00       	mov    $0x7,%eax
  80220c:	cd 30                	int    $0x30
  80220e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802211:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802214:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802217:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80221b:	79 08                	jns    802225 <fork+0x3c>
  80221d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802220:	e9 0b 02 00 00       	jmpq   802430 <fork+0x247>
  802225:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802229:	75 3e                	jne    802269 <fork+0x80>
  80222b:	48 b8 d3 19 80 00 00 	movabs $0x8019d3,%rax
  802232:	00 00 00 
  802235:	ff d0                	callq  *%rax
  802237:	25 ff 03 00 00       	and    $0x3ff,%eax
  80223c:	48 98                	cltq   
  80223e:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  802245:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80224c:	00 00 00 
  80224f:	48 01 c2             	add    %rax,%rdx
  802252:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802259:	00 00 00 
  80225c:	48 89 10             	mov    %rdx,(%rax)
  80225f:	b8 00 00 00 00       	mov    $0x0,%eax
  802264:	e9 c7 01 00 00       	jmpq   802430 <fork+0x247>
  802269:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802270:	e9 a6 00 00 00       	jmpq   80231b <fork+0x132>
  802275:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802278:	c1 f8 12             	sar    $0x12,%eax
  80227b:	89 c2                	mov    %eax,%edx
  80227d:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802284:	01 00 00 
  802287:	48 63 d2             	movslq %edx,%rdx
  80228a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80228e:	83 e0 01             	and    $0x1,%eax
  802291:	48 85 c0             	test   %rax,%rax
  802294:	74 21                	je     8022b7 <fork+0xce>
  802296:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802299:	c1 f8 09             	sar    $0x9,%eax
  80229c:	89 c2                	mov    %eax,%edx
  80229e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8022a5:	01 00 00 
  8022a8:	48 63 d2             	movslq %edx,%rdx
  8022ab:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022af:	83 e0 01             	and    $0x1,%eax
  8022b2:	48 85 c0             	test   %rax,%rax
  8022b5:	75 09                	jne    8022c0 <fork+0xd7>
  8022b7:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8022be:	eb 5b                	jmp    80231b <fork+0x132>
  8022c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022c3:	05 00 02 00 00       	add    $0x200,%eax
  8022c8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8022cb:	eb 46                	jmp    802313 <fork+0x12a>
  8022cd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022d4:	01 00 00 
  8022d7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8022da:	48 63 d2             	movslq %edx,%rdx
  8022dd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022e1:	83 e0 05             	and    $0x5,%eax
  8022e4:	48 83 f8 05          	cmp    $0x5,%rax
  8022e8:	75 21                	jne    80230b <fork+0x122>
  8022ea:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  8022f1:	74 1b                	je     80230e <fork+0x125>
  8022f3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8022f6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022f9:	89 d6                	mov    %edx,%esi
  8022fb:	89 c7                	mov    %eax,%edi
  8022fd:	48 b8 68 20 80 00 00 	movabs $0x802068,%rax
  802304:	00 00 00 
  802307:	ff d0                	callq  *%rax
  802309:	eb 04                	jmp    80230f <fork+0x126>
  80230b:	90                   	nop
  80230c:	eb 01                	jmp    80230f <fork+0x126>
  80230e:	90                   	nop
  80230f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802313:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802316:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802319:	7c b2                	jl     8022cd <fork+0xe4>
  80231b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80231e:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802323:	0f 86 4c ff ff ff    	jbe    802275 <fork+0x8c>
  802329:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80232c:	ba 07 00 00 00       	mov    $0x7,%edx
  802331:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802336:	89 c7                	mov    %eax,%edi
  802338:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  80233f:	00 00 00 
  802342:	ff d0                	callq  *%rax
  802344:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802347:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80234b:	79 30                	jns    80237d <fork+0x194>
  80234d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802350:	89 c1                	mov    %eax,%ecx
  802352:	48 ba a8 5b 80 00 00 	movabs $0x805ba8,%rdx
  802359:	00 00 00 
  80235c:	be bc 00 00 00       	mov    $0xbc,%esi
  802361:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  802368:	00 00 00 
  80236b:	b8 00 00 00 00       	mov    $0x0,%eax
  802370:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  802377:	00 00 00 
  80237a:	41 ff d0             	callq  *%r8
  80237d:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802384:	00 00 00 
  802387:	48 8b 00             	mov    (%rax),%rax
  80238a:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802391:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802394:	48 89 d6             	mov    %rdx,%rsi
  802397:	89 c7                	mov    %eax,%edi
  802399:	48 b8 e3 1b 80 00 00 	movabs $0x801be3,%rax
  8023a0:	00 00 00 
  8023a3:	ff d0                	callq  *%rax
  8023a5:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8023a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8023ac:	79 30                	jns    8023de <fork+0x1f5>
  8023ae:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8023b1:	89 c1                	mov    %eax,%ecx
  8023b3:	48 ba c8 5b 80 00 00 	movabs $0x805bc8,%rdx
  8023ba:	00 00 00 
  8023bd:	be c0 00 00 00       	mov    $0xc0,%esi
  8023c2:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  8023c9:	00 00 00 
  8023cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8023d1:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  8023d8:	00 00 00 
  8023db:	41 ff d0             	callq  *%r8
  8023de:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023e1:	be 02 00 00 00       	mov    $0x2,%esi
  8023e6:	89 c7                	mov    %eax,%edi
  8023e8:	48 b8 4a 1b 80 00 00 	movabs $0x801b4a,%rax
  8023ef:	00 00 00 
  8023f2:	ff d0                	callq  *%rax
  8023f4:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8023f7:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8023fb:	79 30                	jns    80242d <fork+0x244>
  8023fd:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802400:	89 c1                	mov    %eax,%ecx
  802402:	48 ba e7 5b 80 00 00 	movabs $0x805be7,%rdx
  802409:	00 00 00 
  80240c:	be c5 00 00 00       	mov    $0xc5,%esi
  802411:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  802418:	00 00 00 
  80241b:	b8 00 00 00 00       	mov    $0x0,%eax
  802420:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  802427:	00 00 00 
  80242a:	41 ff d0             	callq  *%r8
  80242d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802430:	c9                   	leaveq 
  802431:	c3                   	retq   

0000000000802432 <sfork>:
  802432:	55                   	push   %rbp
  802433:	48 89 e5             	mov    %rsp,%rbp
  802436:	48 ba fe 5b 80 00 00 	movabs $0x805bfe,%rdx
  80243d:	00 00 00 
  802440:	be d2 00 00 00       	mov    $0xd2,%esi
  802445:	48 bf 31 5b 80 00 00 	movabs $0x805b31,%rdi
  80244c:	00 00 00 
  80244f:	b8 00 00 00 00       	mov    $0x0,%eax
  802454:	48 b9 52 03 80 00 00 	movabs $0x800352,%rcx
  80245b:	00 00 00 
  80245e:	ff d1                	callq  *%rcx

0000000000802460 <fd2num>:
  802460:	55                   	push   %rbp
  802461:	48 89 e5             	mov    %rsp,%rbp
  802464:	48 83 ec 08          	sub    $0x8,%rsp
  802468:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80246c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802470:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802477:	ff ff ff 
  80247a:	48 01 d0             	add    %rdx,%rax
  80247d:	48 c1 e8 0c          	shr    $0xc,%rax
  802481:	c9                   	leaveq 
  802482:	c3                   	retq   

0000000000802483 <fd2data>:
  802483:	55                   	push   %rbp
  802484:	48 89 e5             	mov    %rsp,%rbp
  802487:	48 83 ec 08          	sub    $0x8,%rsp
  80248b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80248f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802493:	48 89 c7             	mov    %rax,%rdi
  802496:	48 b8 60 24 80 00 00 	movabs $0x802460,%rax
  80249d:	00 00 00 
  8024a0:	ff d0                	callq  *%rax
  8024a2:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8024a8:	48 c1 e0 0c          	shl    $0xc,%rax
  8024ac:	c9                   	leaveq 
  8024ad:	c3                   	retq   

00000000008024ae <fd_alloc>:
  8024ae:	55                   	push   %rbp
  8024af:	48 89 e5             	mov    %rsp,%rbp
  8024b2:	48 83 ec 18          	sub    $0x18,%rsp
  8024b6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8024ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8024c1:	eb 6b                	jmp    80252e <fd_alloc+0x80>
  8024c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024c6:	48 98                	cltq   
  8024c8:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8024ce:	48 c1 e0 0c          	shl    $0xc,%rax
  8024d2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8024d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024da:	48 c1 e8 15          	shr    $0x15,%rax
  8024de:	48 89 c2             	mov    %rax,%rdx
  8024e1:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8024e8:	01 00 00 
  8024eb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024ef:	83 e0 01             	and    $0x1,%eax
  8024f2:	48 85 c0             	test   %rax,%rax
  8024f5:	74 21                	je     802518 <fd_alloc+0x6a>
  8024f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024fb:	48 c1 e8 0c          	shr    $0xc,%rax
  8024ff:	48 89 c2             	mov    %rax,%rdx
  802502:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802509:	01 00 00 
  80250c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802510:	83 e0 01             	and    $0x1,%eax
  802513:	48 85 c0             	test   %rax,%rax
  802516:	75 12                	jne    80252a <fd_alloc+0x7c>
  802518:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80251c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802520:	48 89 10             	mov    %rdx,(%rax)
  802523:	b8 00 00 00 00       	mov    $0x0,%eax
  802528:	eb 1a                	jmp    802544 <fd_alloc+0x96>
  80252a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80252e:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802532:	7e 8f                	jle    8024c3 <fd_alloc+0x15>
  802534:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802538:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80253f:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802544:	c9                   	leaveq 
  802545:	c3                   	retq   

0000000000802546 <fd_lookup>:
  802546:	55                   	push   %rbp
  802547:	48 89 e5             	mov    %rsp,%rbp
  80254a:	48 83 ec 20          	sub    $0x20,%rsp
  80254e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802551:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802555:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802559:	78 06                	js     802561 <fd_lookup+0x1b>
  80255b:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  80255f:	7e 07                	jle    802568 <fd_lookup+0x22>
  802561:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802566:	eb 6c                	jmp    8025d4 <fd_lookup+0x8e>
  802568:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80256b:	48 98                	cltq   
  80256d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802573:	48 c1 e0 0c          	shl    $0xc,%rax
  802577:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80257b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80257f:	48 c1 e8 15          	shr    $0x15,%rax
  802583:	48 89 c2             	mov    %rax,%rdx
  802586:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80258d:	01 00 00 
  802590:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802594:	83 e0 01             	and    $0x1,%eax
  802597:	48 85 c0             	test   %rax,%rax
  80259a:	74 21                	je     8025bd <fd_lookup+0x77>
  80259c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025a0:	48 c1 e8 0c          	shr    $0xc,%rax
  8025a4:	48 89 c2             	mov    %rax,%rdx
  8025a7:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8025ae:	01 00 00 
  8025b1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8025b5:	83 e0 01             	and    $0x1,%eax
  8025b8:	48 85 c0             	test   %rax,%rax
  8025bb:	75 07                	jne    8025c4 <fd_lookup+0x7e>
  8025bd:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025c2:	eb 10                	jmp    8025d4 <fd_lookup+0x8e>
  8025c4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8025c8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8025cc:	48 89 10             	mov    %rdx,(%rax)
  8025cf:	b8 00 00 00 00       	mov    $0x0,%eax
  8025d4:	c9                   	leaveq 
  8025d5:	c3                   	retq   

00000000008025d6 <fd_close>:
  8025d6:	55                   	push   %rbp
  8025d7:	48 89 e5             	mov    %rsp,%rbp
  8025da:	48 83 ec 30          	sub    $0x30,%rsp
  8025de:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8025e2:	89 f0                	mov    %esi,%eax
  8025e4:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8025e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025eb:	48 89 c7             	mov    %rax,%rdi
  8025ee:	48 b8 60 24 80 00 00 	movabs $0x802460,%rax
  8025f5:	00 00 00 
  8025f8:	ff d0                	callq  *%rax
  8025fa:	89 c2                	mov    %eax,%edx
  8025fc:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802600:	48 89 c6             	mov    %rax,%rsi
  802603:	89 d7                	mov    %edx,%edi
  802605:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  80260c:	00 00 00 
  80260f:	ff d0                	callq  *%rax
  802611:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802614:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802618:	78 0a                	js     802624 <fd_close+0x4e>
  80261a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80261e:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802622:	74 12                	je     802636 <fd_close+0x60>
  802624:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802628:	74 05                	je     80262f <fd_close+0x59>
  80262a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80262d:	eb 70                	jmp    80269f <fd_close+0xc9>
  80262f:	b8 00 00 00 00       	mov    $0x0,%eax
  802634:	eb 69                	jmp    80269f <fd_close+0xc9>
  802636:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80263a:	8b 00                	mov    (%rax),%eax
  80263c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802640:	48 89 d6             	mov    %rdx,%rsi
  802643:	89 c7                	mov    %eax,%edi
  802645:	48 b8 a1 26 80 00 00 	movabs $0x8026a1,%rax
  80264c:	00 00 00 
  80264f:	ff d0                	callq  *%rax
  802651:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802654:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802658:	78 2a                	js     802684 <fd_close+0xae>
  80265a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80265e:	48 8b 40 20          	mov    0x20(%rax),%rax
  802662:	48 85 c0             	test   %rax,%rax
  802665:	74 16                	je     80267d <fd_close+0xa7>
  802667:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80266b:	48 8b 40 20          	mov    0x20(%rax),%rax
  80266f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802673:	48 89 d7             	mov    %rdx,%rdi
  802676:	ff d0                	callq  *%rax
  802678:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80267b:	eb 07                	jmp    802684 <fd_close+0xae>
  80267d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802684:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802688:	48 89 c6             	mov    %rax,%rsi
  80268b:	bf 00 00 00 00       	mov    $0x0,%edi
  802690:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  802697:	00 00 00 
  80269a:	ff d0                	callq  *%rax
  80269c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80269f:	c9                   	leaveq 
  8026a0:	c3                   	retq   

00000000008026a1 <dev_lookup>:
  8026a1:	55                   	push   %rbp
  8026a2:	48 89 e5             	mov    %rsp,%rbp
  8026a5:	48 83 ec 20          	sub    $0x20,%rsp
  8026a9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8026ac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026b0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8026b7:	eb 41                	jmp    8026fa <dev_lookup+0x59>
  8026b9:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8026c0:	00 00 00 
  8026c3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8026c6:	48 63 d2             	movslq %edx,%rdx
  8026c9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026cd:	8b 00                	mov    (%rax),%eax
  8026cf:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8026d2:	75 22                	jne    8026f6 <dev_lookup+0x55>
  8026d4:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8026db:	00 00 00 
  8026de:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8026e1:	48 63 d2             	movslq %edx,%rdx
  8026e4:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8026e8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8026ec:	48 89 10             	mov    %rdx,(%rax)
  8026ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8026f4:	eb 60                	jmp    802756 <dev_lookup+0xb5>
  8026f6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8026fa:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  802701:	00 00 00 
  802704:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802707:	48 63 d2             	movslq %edx,%rdx
  80270a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80270e:	48 85 c0             	test   %rax,%rax
  802711:	75 a6                	jne    8026b9 <dev_lookup+0x18>
  802713:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  80271a:	00 00 00 
  80271d:	48 8b 00             	mov    (%rax),%rax
  802720:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802726:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802729:	89 c6                	mov    %eax,%esi
  80272b:	48 bf 18 5c 80 00 00 	movabs $0x805c18,%rdi
  802732:	00 00 00 
  802735:	b8 00 00 00 00       	mov    $0x0,%eax
  80273a:	48 b9 8c 05 80 00 00 	movabs $0x80058c,%rcx
  802741:	00 00 00 
  802744:	ff d1                	callq  *%rcx
  802746:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80274a:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802751:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802756:	c9                   	leaveq 
  802757:	c3                   	retq   

0000000000802758 <close>:
  802758:	55                   	push   %rbp
  802759:	48 89 e5             	mov    %rsp,%rbp
  80275c:	48 83 ec 20          	sub    $0x20,%rsp
  802760:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802763:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802767:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80276a:	48 89 d6             	mov    %rdx,%rsi
  80276d:	89 c7                	mov    %eax,%edi
  80276f:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  802776:	00 00 00 
  802779:	ff d0                	callq  *%rax
  80277b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80277e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802782:	79 05                	jns    802789 <close+0x31>
  802784:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802787:	eb 18                	jmp    8027a1 <close+0x49>
  802789:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80278d:	be 01 00 00 00       	mov    $0x1,%esi
  802792:	48 89 c7             	mov    %rax,%rdi
  802795:	48 b8 d6 25 80 00 00 	movabs $0x8025d6,%rax
  80279c:	00 00 00 
  80279f:	ff d0                	callq  *%rax
  8027a1:	c9                   	leaveq 
  8027a2:	c3                   	retq   

00000000008027a3 <close_all>:
  8027a3:	55                   	push   %rbp
  8027a4:	48 89 e5             	mov    %rsp,%rbp
  8027a7:	48 83 ec 10          	sub    $0x10,%rsp
  8027ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027b2:	eb 15                	jmp    8027c9 <close_all+0x26>
  8027b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027b7:	89 c7                	mov    %eax,%edi
  8027b9:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  8027c0:	00 00 00 
  8027c3:	ff d0                	callq  *%rax
  8027c5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8027c9:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8027cd:	7e e5                	jle    8027b4 <close_all+0x11>
  8027cf:	90                   	nop
  8027d0:	c9                   	leaveq 
  8027d1:	c3                   	retq   

00000000008027d2 <dup>:
  8027d2:	55                   	push   %rbp
  8027d3:	48 89 e5             	mov    %rsp,%rbp
  8027d6:	48 83 ec 40          	sub    $0x40,%rsp
  8027da:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8027dd:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8027e0:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8027e4:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8027e7:	48 89 d6             	mov    %rdx,%rsi
  8027ea:	89 c7                	mov    %eax,%edi
  8027ec:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  8027f3:	00 00 00 
  8027f6:	ff d0                	callq  *%rax
  8027f8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027fb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027ff:	79 08                	jns    802809 <dup+0x37>
  802801:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802804:	e9 70 01 00 00       	jmpq   802979 <dup+0x1a7>
  802809:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80280c:	89 c7                	mov    %eax,%edi
  80280e:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  802815:	00 00 00 
  802818:	ff d0                	callq  *%rax
  80281a:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80281d:	48 98                	cltq   
  80281f:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802825:	48 c1 e0 0c          	shl    $0xc,%rax
  802829:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80282d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802831:	48 89 c7             	mov    %rax,%rdi
  802834:	48 b8 83 24 80 00 00 	movabs $0x802483,%rax
  80283b:	00 00 00 
  80283e:	ff d0                	callq  *%rax
  802840:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802844:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802848:	48 89 c7             	mov    %rax,%rdi
  80284b:	48 b8 83 24 80 00 00 	movabs $0x802483,%rax
  802852:	00 00 00 
  802855:	ff d0                	callq  *%rax
  802857:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80285b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80285f:	48 c1 e8 15          	shr    $0x15,%rax
  802863:	48 89 c2             	mov    %rax,%rdx
  802866:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80286d:	01 00 00 
  802870:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802874:	83 e0 01             	and    $0x1,%eax
  802877:	48 85 c0             	test   %rax,%rax
  80287a:	74 71                	je     8028ed <dup+0x11b>
  80287c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802880:	48 c1 e8 0c          	shr    $0xc,%rax
  802884:	48 89 c2             	mov    %rax,%rdx
  802887:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80288e:	01 00 00 
  802891:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802895:	83 e0 01             	and    $0x1,%eax
  802898:	48 85 c0             	test   %rax,%rax
  80289b:	74 50                	je     8028ed <dup+0x11b>
  80289d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028a1:	48 c1 e8 0c          	shr    $0xc,%rax
  8028a5:	48 89 c2             	mov    %rax,%rdx
  8028a8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8028af:	01 00 00 
  8028b2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8028b6:	25 07 0e 00 00       	and    $0xe07,%eax
  8028bb:	89 c1                	mov    %eax,%ecx
  8028bd:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8028c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028c5:	41 89 c8             	mov    %ecx,%r8d
  8028c8:	48 89 d1             	mov    %rdx,%rcx
  8028cb:	ba 00 00 00 00       	mov    $0x0,%edx
  8028d0:	48 89 c6             	mov    %rax,%rsi
  8028d3:	bf 00 00 00 00       	mov    $0x0,%edi
  8028d8:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  8028df:	00 00 00 
  8028e2:	ff d0                	callq  *%rax
  8028e4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028e7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028eb:	78 55                	js     802942 <dup+0x170>
  8028ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8028f1:	48 c1 e8 0c          	shr    $0xc,%rax
  8028f5:	48 89 c2             	mov    %rax,%rdx
  8028f8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8028ff:	01 00 00 
  802902:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802906:	25 07 0e 00 00       	and    $0xe07,%eax
  80290b:	89 c1                	mov    %eax,%ecx
  80290d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802911:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802915:	41 89 c8             	mov    %ecx,%r8d
  802918:	48 89 d1             	mov    %rdx,%rcx
  80291b:	ba 00 00 00 00       	mov    $0x0,%edx
  802920:	48 89 c6             	mov    %rax,%rsi
  802923:	bf 00 00 00 00       	mov    $0x0,%edi
  802928:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  80292f:	00 00 00 
  802932:	ff d0                	callq  *%rax
  802934:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802937:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80293b:	78 08                	js     802945 <dup+0x173>
  80293d:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802940:	eb 37                	jmp    802979 <dup+0x1a7>
  802942:	90                   	nop
  802943:	eb 01                	jmp    802946 <dup+0x174>
  802945:	90                   	nop
  802946:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80294a:	48 89 c6             	mov    %rax,%rsi
  80294d:	bf 00 00 00 00       	mov    $0x0,%edi
  802952:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  802959:	00 00 00 
  80295c:	ff d0                	callq  *%rax
  80295e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802962:	48 89 c6             	mov    %rax,%rsi
  802965:	bf 00 00 00 00       	mov    $0x0,%edi
  80296a:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  802971:	00 00 00 
  802974:	ff d0                	callq  *%rax
  802976:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802979:	c9                   	leaveq 
  80297a:	c3                   	retq   

000000000080297b <read>:
  80297b:	55                   	push   %rbp
  80297c:	48 89 e5             	mov    %rsp,%rbp
  80297f:	48 83 ec 40          	sub    $0x40,%rsp
  802983:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802986:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80298a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80298e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802992:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802995:	48 89 d6             	mov    %rdx,%rsi
  802998:	89 c7                	mov    %eax,%edi
  80299a:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  8029a1:	00 00 00 
  8029a4:	ff d0                	callq  *%rax
  8029a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029ad:	78 24                	js     8029d3 <read+0x58>
  8029af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029b3:	8b 00                	mov    (%rax),%eax
  8029b5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029b9:	48 89 d6             	mov    %rdx,%rsi
  8029bc:	89 c7                	mov    %eax,%edi
  8029be:	48 b8 a1 26 80 00 00 	movabs $0x8026a1,%rax
  8029c5:	00 00 00 
  8029c8:	ff d0                	callq  *%rax
  8029ca:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029cd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029d1:	79 05                	jns    8029d8 <read+0x5d>
  8029d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029d6:	eb 76                	jmp    802a4e <read+0xd3>
  8029d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029dc:	8b 40 08             	mov    0x8(%rax),%eax
  8029df:	83 e0 03             	and    $0x3,%eax
  8029e2:	83 f8 01             	cmp    $0x1,%eax
  8029e5:	75 3a                	jne    802a21 <read+0xa6>
  8029e7:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8029ee:	00 00 00 
  8029f1:	48 8b 00             	mov    (%rax),%rax
  8029f4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8029fa:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8029fd:	89 c6                	mov    %eax,%esi
  8029ff:	48 bf 37 5c 80 00 00 	movabs $0x805c37,%rdi
  802a06:	00 00 00 
  802a09:	b8 00 00 00 00       	mov    $0x0,%eax
  802a0e:	48 b9 8c 05 80 00 00 	movabs $0x80058c,%rcx
  802a15:	00 00 00 
  802a18:	ff d1                	callq  *%rcx
  802a1a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a1f:	eb 2d                	jmp    802a4e <read+0xd3>
  802a21:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a25:	48 8b 40 10          	mov    0x10(%rax),%rax
  802a29:	48 85 c0             	test   %rax,%rax
  802a2c:	75 07                	jne    802a35 <read+0xba>
  802a2e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802a33:	eb 19                	jmp    802a4e <read+0xd3>
  802a35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a39:	48 8b 40 10          	mov    0x10(%rax),%rax
  802a3d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802a41:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a45:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802a49:	48 89 cf             	mov    %rcx,%rdi
  802a4c:	ff d0                	callq  *%rax
  802a4e:	c9                   	leaveq 
  802a4f:	c3                   	retq   

0000000000802a50 <readn>:
  802a50:	55                   	push   %rbp
  802a51:	48 89 e5             	mov    %rsp,%rbp
  802a54:	48 83 ec 30          	sub    $0x30,%rsp
  802a58:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802a5b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a5f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802a63:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802a6a:	eb 47                	jmp    802ab3 <readn+0x63>
  802a6c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a6f:	48 98                	cltq   
  802a71:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802a75:	48 29 c2             	sub    %rax,%rdx
  802a78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a7b:	48 63 c8             	movslq %eax,%rcx
  802a7e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a82:	48 01 c1             	add    %rax,%rcx
  802a85:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a88:	48 89 ce             	mov    %rcx,%rsi
  802a8b:	89 c7                	mov    %eax,%edi
  802a8d:	48 b8 7b 29 80 00 00 	movabs $0x80297b,%rax
  802a94:	00 00 00 
  802a97:	ff d0                	callq  *%rax
  802a99:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802a9c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802aa0:	79 05                	jns    802aa7 <readn+0x57>
  802aa2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802aa5:	eb 1d                	jmp    802ac4 <readn+0x74>
  802aa7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802aab:	74 13                	je     802ac0 <readn+0x70>
  802aad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ab0:	01 45 fc             	add    %eax,-0x4(%rbp)
  802ab3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ab6:	48 98                	cltq   
  802ab8:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802abc:	72 ae                	jb     802a6c <readn+0x1c>
  802abe:	eb 01                	jmp    802ac1 <readn+0x71>
  802ac0:	90                   	nop
  802ac1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ac4:	c9                   	leaveq 
  802ac5:	c3                   	retq   

0000000000802ac6 <write>:
  802ac6:	55                   	push   %rbp
  802ac7:	48 89 e5             	mov    %rsp,%rbp
  802aca:	48 83 ec 40          	sub    $0x40,%rsp
  802ace:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802ad1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802ad5:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802ad9:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802add:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802ae0:	48 89 d6             	mov    %rdx,%rsi
  802ae3:	89 c7                	mov    %eax,%edi
  802ae5:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  802aec:	00 00 00 
  802aef:	ff d0                	callq  *%rax
  802af1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802af4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802af8:	78 24                	js     802b1e <write+0x58>
  802afa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802afe:	8b 00                	mov    (%rax),%eax
  802b00:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b04:	48 89 d6             	mov    %rdx,%rsi
  802b07:	89 c7                	mov    %eax,%edi
  802b09:	48 b8 a1 26 80 00 00 	movabs $0x8026a1,%rax
  802b10:	00 00 00 
  802b13:	ff d0                	callq  *%rax
  802b15:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b18:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b1c:	79 05                	jns    802b23 <write+0x5d>
  802b1e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b21:	eb 75                	jmp    802b98 <write+0xd2>
  802b23:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b27:	8b 40 08             	mov    0x8(%rax),%eax
  802b2a:	83 e0 03             	and    $0x3,%eax
  802b2d:	85 c0                	test   %eax,%eax
  802b2f:	75 3a                	jne    802b6b <write+0xa5>
  802b31:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802b38:	00 00 00 
  802b3b:	48 8b 00             	mov    (%rax),%rax
  802b3e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b44:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802b47:	89 c6                	mov    %eax,%esi
  802b49:	48 bf 53 5c 80 00 00 	movabs $0x805c53,%rdi
  802b50:	00 00 00 
  802b53:	b8 00 00 00 00       	mov    $0x0,%eax
  802b58:	48 b9 8c 05 80 00 00 	movabs $0x80058c,%rcx
  802b5f:	00 00 00 
  802b62:	ff d1                	callq  *%rcx
  802b64:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b69:	eb 2d                	jmp    802b98 <write+0xd2>
  802b6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b6f:	48 8b 40 18          	mov    0x18(%rax),%rax
  802b73:	48 85 c0             	test   %rax,%rax
  802b76:	75 07                	jne    802b7f <write+0xb9>
  802b78:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802b7d:	eb 19                	jmp    802b98 <write+0xd2>
  802b7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b83:	48 8b 40 18          	mov    0x18(%rax),%rax
  802b87:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802b8b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b8f:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802b93:	48 89 cf             	mov    %rcx,%rdi
  802b96:	ff d0                	callq  *%rax
  802b98:	c9                   	leaveq 
  802b99:	c3                   	retq   

0000000000802b9a <seek>:
  802b9a:	55                   	push   %rbp
  802b9b:	48 89 e5             	mov    %rsp,%rbp
  802b9e:	48 83 ec 18          	sub    $0x18,%rsp
  802ba2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ba5:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802ba8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802bac:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802baf:	48 89 d6             	mov    %rdx,%rsi
  802bb2:	89 c7                	mov    %eax,%edi
  802bb4:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  802bbb:	00 00 00 
  802bbe:	ff d0                	callq  *%rax
  802bc0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bc3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bc7:	79 05                	jns    802bce <seek+0x34>
  802bc9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bcc:	eb 0f                	jmp    802bdd <seek+0x43>
  802bce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bd2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802bd5:	89 50 04             	mov    %edx,0x4(%rax)
  802bd8:	b8 00 00 00 00       	mov    $0x0,%eax
  802bdd:	c9                   	leaveq 
  802bde:	c3                   	retq   

0000000000802bdf <ftruncate>:
  802bdf:	55                   	push   %rbp
  802be0:	48 89 e5             	mov    %rsp,%rbp
  802be3:	48 83 ec 30          	sub    $0x30,%rsp
  802be7:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802bea:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802bed:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802bf1:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802bf4:	48 89 d6             	mov    %rdx,%rsi
  802bf7:	89 c7                	mov    %eax,%edi
  802bf9:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  802c00:	00 00 00 
  802c03:	ff d0                	callq  *%rax
  802c05:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c08:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c0c:	78 24                	js     802c32 <ftruncate+0x53>
  802c0e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c12:	8b 00                	mov    (%rax),%eax
  802c14:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c18:	48 89 d6             	mov    %rdx,%rsi
  802c1b:	89 c7                	mov    %eax,%edi
  802c1d:	48 b8 a1 26 80 00 00 	movabs $0x8026a1,%rax
  802c24:	00 00 00 
  802c27:	ff d0                	callq  *%rax
  802c29:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c2c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c30:	79 05                	jns    802c37 <ftruncate+0x58>
  802c32:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c35:	eb 72                	jmp    802ca9 <ftruncate+0xca>
  802c37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c3b:	8b 40 08             	mov    0x8(%rax),%eax
  802c3e:	83 e0 03             	and    $0x3,%eax
  802c41:	85 c0                	test   %eax,%eax
  802c43:	75 3a                	jne    802c7f <ftruncate+0xa0>
  802c45:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  802c4c:	00 00 00 
  802c4f:	48 8b 00             	mov    (%rax),%rax
  802c52:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802c58:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802c5b:	89 c6                	mov    %eax,%esi
  802c5d:	48 bf 70 5c 80 00 00 	movabs $0x805c70,%rdi
  802c64:	00 00 00 
  802c67:	b8 00 00 00 00       	mov    $0x0,%eax
  802c6c:	48 b9 8c 05 80 00 00 	movabs $0x80058c,%rcx
  802c73:	00 00 00 
  802c76:	ff d1                	callq  *%rcx
  802c78:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802c7d:	eb 2a                	jmp    802ca9 <ftruncate+0xca>
  802c7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c83:	48 8b 40 30          	mov    0x30(%rax),%rax
  802c87:	48 85 c0             	test   %rax,%rax
  802c8a:	75 07                	jne    802c93 <ftruncate+0xb4>
  802c8c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802c91:	eb 16                	jmp    802ca9 <ftruncate+0xca>
  802c93:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c97:	48 8b 40 30          	mov    0x30(%rax),%rax
  802c9b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c9f:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802ca2:	89 ce                	mov    %ecx,%esi
  802ca4:	48 89 d7             	mov    %rdx,%rdi
  802ca7:	ff d0                	callq  *%rax
  802ca9:	c9                   	leaveq 
  802caa:	c3                   	retq   

0000000000802cab <fstat>:
  802cab:	55                   	push   %rbp
  802cac:	48 89 e5             	mov    %rsp,%rbp
  802caf:	48 83 ec 30          	sub    $0x30,%rsp
  802cb3:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802cb6:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802cba:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802cbe:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802cc1:	48 89 d6             	mov    %rdx,%rsi
  802cc4:	89 c7                	mov    %eax,%edi
  802cc6:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  802ccd:	00 00 00 
  802cd0:	ff d0                	callq  *%rax
  802cd2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cd5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cd9:	78 24                	js     802cff <fstat+0x54>
  802cdb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cdf:	8b 00                	mov    (%rax),%eax
  802ce1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ce5:	48 89 d6             	mov    %rdx,%rsi
  802ce8:	89 c7                	mov    %eax,%edi
  802cea:	48 b8 a1 26 80 00 00 	movabs $0x8026a1,%rax
  802cf1:	00 00 00 
  802cf4:	ff d0                	callq  *%rax
  802cf6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cf9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cfd:	79 05                	jns    802d04 <fstat+0x59>
  802cff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d02:	eb 5e                	jmp    802d62 <fstat+0xb7>
  802d04:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d08:	48 8b 40 28          	mov    0x28(%rax),%rax
  802d0c:	48 85 c0             	test   %rax,%rax
  802d0f:	75 07                	jne    802d18 <fstat+0x6d>
  802d11:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802d16:	eb 4a                	jmp    802d62 <fstat+0xb7>
  802d18:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d1c:	c6 00 00             	movb   $0x0,(%rax)
  802d1f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d23:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802d2a:	00 00 00 
  802d2d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d31:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802d38:	00 00 00 
  802d3b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802d3f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802d43:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802d4a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d4e:	48 8b 40 28          	mov    0x28(%rax),%rax
  802d52:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802d56:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802d5a:	48 89 ce             	mov    %rcx,%rsi
  802d5d:	48 89 d7             	mov    %rdx,%rdi
  802d60:	ff d0                	callq  *%rax
  802d62:	c9                   	leaveq 
  802d63:	c3                   	retq   

0000000000802d64 <stat>:
  802d64:	55                   	push   %rbp
  802d65:	48 89 e5             	mov    %rsp,%rbp
  802d68:	48 83 ec 20          	sub    $0x20,%rsp
  802d6c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d70:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d74:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d78:	be 00 00 00 00       	mov    $0x0,%esi
  802d7d:	48 89 c7             	mov    %rax,%rdi
  802d80:	48 b8 54 2e 80 00 00 	movabs $0x802e54,%rax
  802d87:	00 00 00 
  802d8a:	ff d0                	callq  *%rax
  802d8c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d8f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d93:	79 05                	jns    802d9a <stat+0x36>
  802d95:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d98:	eb 2f                	jmp    802dc9 <stat+0x65>
  802d9a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802d9e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802da1:	48 89 d6             	mov    %rdx,%rsi
  802da4:	89 c7                	mov    %eax,%edi
  802da6:	48 b8 ab 2c 80 00 00 	movabs $0x802cab,%rax
  802dad:	00 00 00 
  802db0:	ff d0                	callq  *%rax
  802db2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802db5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802db8:	89 c7                	mov    %eax,%edi
  802dba:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  802dc1:	00 00 00 
  802dc4:	ff d0                	callq  *%rax
  802dc6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dc9:	c9                   	leaveq 
  802dca:	c3                   	retq   

0000000000802dcb <fsipc>:
  802dcb:	55                   	push   %rbp
  802dcc:	48 89 e5             	mov    %rsp,%rbp
  802dcf:	48 83 ec 10          	sub    $0x10,%rsp
  802dd3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802dd6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802dda:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802de1:	00 00 00 
  802de4:	8b 00                	mov    (%rax),%eax
  802de6:	85 c0                	test   %eax,%eax
  802de8:	75 1f                	jne    802e09 <fsipc+0x3e>
  802dea:	bf 01 00 00 00       	mov    $0x1,%edi
  802def:	48 b8 04 54 80 00 00 	movabs $0x805404,%rax
  802df6:	00 00 00 
  802df9:	ff d0                	callq  *%rax
  802dfb:	89 c2                	mov    %eax,%edx
  802dfd:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802e04:	00 00 00 
  802e07:	89 10                	mov    %edx,(%rax)
  802e09:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802e10:	00 00 00 
  802e13:	8b 00                	mov    (%rax),%eax
  802e15:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802e18:	b9 07 00 00 00       	mov    $0x7,%ecx
  802e1d:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  802e24:	00 00 00 
  802e27:	89 c7                	mov    %eax,%edi
  802e29:	48 b8 fa 52 80 00 00 	movabs $0x8052fa,%rax
  802e30:	00 00 00 
  802e33:	ff d0                	callq  *%rax
  802e35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e39:	ba 00 00 00 00       	mov    $0x0,%edx
  802e3e:	48 89 c6             	mov    %rax,%rsi
  802e41:	bf 00 00 00 00       	mov    $0x0,%edi
  802e46:	48 b8 39 52 80 00 00 	movabs $0x805239,%rax
  802e4d:	00 00 00 
  802e50:	ff d0                	callq  *%rax
  802e52:	c9                   	leaveq 
  802e53:	c3                   	retq   

0000000000802e54 <open>:
  802e54:	55                   	push   %rbp
  802e55:	48 89 e5             	mov    %rsp,%rbp
  802e58:	48 83 ec 20          	sub    $0x20,%rsp
  802e5c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802e60:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802e63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e67:	48 89 c7             	mov    %rax,%rdi
  802e6a:	48 b8 b0 10 80 00 00 	movabs $0x8010b0,%rax
  802e71:	00 00 00 
  802e74:	ff d0                	callq  *%rax
  802e76:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802e7b:	7e 0a                	jle    802e87 <open+0x33>
  802e7d:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802e82:	e9 a5 00 00 00       	jmpq   802f2c <open+0xd8>
  802e87:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802e8b:	48 89 c7             	mov    %rax,%rdi
  802e8e:	48 b8 ae 24 80 00 00 	movabs $0x8024ae,%rax
  802e95:	00 00 00 
  802e98:	ff d0                	callq  *%rax
  802e9a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ea1:	79 08                	jns    802eab <open+0x57>
  802ea3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ea6:	e9 81 00 00 00       	jmpq   802f2c <open+0xd8>
  802eab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eaf:	48 89 c6             	mov    %rax,%rsi
  802eb2:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  802eb9:	00 00 00 
  802ebc:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  802ec3:	00 00 00 
  802ec6:	ff d0                	callq  *%rax
  802ec8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802ecf:	00 00 00 
  802ed2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802ed5:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802edb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802edf:	48 89 c6             	mov    %rax,%rsi
  802ee2:	bf 01 00 00 00       	mov    $0x1,%edi
  802ee7:	48 b8 cb 2d 80 00 00 	movabs $0x802dcb,%rax
  802eee:	00 00 00 
  802ef1:	ff d0                	callq  *%rax
  802ef3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ef6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802efa:	79 1d                	jns    802f19 <open+0xc5>
  802efc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f00:	be 00 00 00 00       	mov    $0x0,%esi
  802f05:	48 89 c7             	mov    %rax,%rdi
  802f08:	48 b8 d6 25 80 00 00 	movabs $0x8025d6,%rax
  802f0f:	00 00 00 
  802f12:	ff d0                	callq  *%rax
  802f14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f17:	eb 13                	jmp    802f2c <open+0xd8>
  802f19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f1d:	48 89 c7             	mov    %rax,%rdi
  802f20:	48 b8 60 24 80 00 00 	movabs $0x802460,%rax
  802f27:	00 00 00 
  802f2a:	ff d0                	callq  *%rax
  802f2c:	c9                   	leaveq 
  802f2d:	c3                   	retq   

0000000000802f2e <devfile_flush>:
  802f2e:	55                   	push   %rbp
  802f2f:	48 89 e5             	mov    %rsp,%rbp
  802f32:	48 83 ec 10          	sub    $0x10,%rsp
  802f36:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802f3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f3e:	8b 50 0c             	mov    0xc(%rax),%edx
  802f41:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802f48:	00 00 00 
  802f4b:	89 10                	mov    %edx,(%rax)
  802f4d:	be 00 00 00 00       	mov    $0x0,%esi
  802f52:	bf 06 00 00 00       	mov    $0x6,%edi
  802f57:	48 b8 cb 2d 80 00 00 	movabs $0x802dcb,%rax
  802f5e:	00 00 00 
  802f61:	ff d0                	callq  *%rax
  802f63:	c9                   	leaveq 
  802f64:	c3                   	retq   

0000000000802f65 <devfile_read>:
  802f65:	55                   	push   %rbp
  802f66:	48 89 e5             	mov    %rsp,%rbp
  802f69:	48 83 ec 30          	sub    $0x30,%rsp
  802f6d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802f71:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f75:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802f79:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f7d:	8b 50 0c             	mov    0xc(%rax),%edx
  802f80:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802f87:	00 00 00 
  802f8a:	89 10                	mov    %edx,(%rax)
  802f8c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802f93:	00 00 00 
  802f96:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802f9a:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802f9e:	be 00 00 00 00       	mov    $0x0,%esi
  802fa3:	bf 03 00 00 00       	mov    $0x3,%edi
  802fa8:	48 b8 cb 2d 80 00 00 	movabs $0x802dcb,%rax
  802faf:	00 00 00 
  802fb2:	ff d0                	callq  *%rax
  802fb4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fb7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fbb:	79 08                	jns    802fc5 <devfile_read+0x60>
  802fbd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fc0:	e9 a4 00 00 00       	jmpq   803069 <devfile_read+0x104>
  802fc5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fc8:	48 98                	cltq   
  802fca:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802fce:	76 35                	jbe    803005 <devfile_read+0xa0>
  802fd0:	48 b9 96 5c 80 00 00 	movabs $0x805c96,%rcx
  802fd7:	00 00 00 
  802fda:	48 ba 9d 5c 80 00 00 	movabs $0x805c9d,%rdx
  802fe1:	00 00 00 
  802fe4:	be 89 00 00 00       	mov    $0x89,%esi
  802fe9:	48 bf b2 5c 80 00 00 	movabs $0x805cb2,%rdi
  802ff0:	00 00 00 
  802ff3:	b8 00 00 00 00       	mov    $0x0,%eax
  802ff8:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  802fff:	00 00 00 
  803002:	41 ff d0             	callq  *%r8
  803005:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80300c:	7e 35                	jle    803043 <devfile_read+0xde>
  80300e:	48 b9 c0 5c 80 00 00 	movabs $0x805cc0,%rcx
  803015:	00 00 00 
  803018:	48 ba 9d 5c 80 00 00 	movabs $0x805c9d,%rdx
  80301f:	00 00 00 
  803022:	be 8a 00 00 00       	mov    $0x8a,%esi
  803027:	48 bf b2 5c 80 00 00 	movabs $0x805cb2,%rdi
  80302e:	00 00 00 
  803031:	b8 00 00 00 00       	mov    $0x0,%eax
  803036:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  80303d:	00 00 00 
  803040:	41 ff d0             	callq  *%r8
  803043:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803046:	48 63 d0             	movslq %eax,%rdx
  803049:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80304d:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803054:	00 00 00 
  803057:	48 89 c7             	mov    %rax,%rdi
  80305a:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  803061:	00 00 00 
  803064:	ff d0                	callq  *%rax
  803066:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803069:	c9                   	leaveq 
  80306a:	c3                   	retq   

000000000080306b <devfile_write>:
  80306b:	55                   	push   %rbp
  80306c:	48 89 e5             	mov    %rsp,%rbp
  80306f:	48 83 ec 40          	sub    $0x40,%rsp
  803073:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803077:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80307b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80307f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803083:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803087:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  80308e:	00 
  80308f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803093:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803097:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80309c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8030a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8030a4:	8b 50 0c             	mov    0xc(%rax),%edx
  8030a7:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8030ae:	00 00 00 
  8030b1:	89 10                	mov    %edx,(%rax)
  8030b3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8030ba:	00 00 00 
  8030bd:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8030c1:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8030c5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8030c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8030cd:	48 89 c6             	mov    %rax,%rsi
  8030d0:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  8030d7:	00 00 00 
  8030da:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  8030e1:	00 00 00 
  8030e4:	ff d0                	callq  *%rax
  8030e6:	be 00 00 00 00       	mov    $0x0,%esi
  8030eb:	bf 04 00 00 00       	mov    $0x4,%edi
  8030f0:	48 b8 cb 2d 80 00 00 	movabs $0x802dcb,%rax
  8030f7:	00 00 00 
  8030fa:	ff d0                	callq  *%rax
  8030fc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8030ff:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803103:	79 05                	jns    80310a <devfile_write+0x9f>
  803105:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803108:	eb 43                	jmp    80314d <devfile_write+0xe2>
  80310a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80310d:	48 98                	cltq   
  80310f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803113:	76 35                	jbe    80314a <devfile_write+0xdf>
  803115:	48 b9 96 5c 80 00 00 	movabs $0x805c96,%rcx
  80311c:	00 00 00 
  80311f:	48 ba 9d 5c 80 00 00 	movabs $0x805c9d,%rdx
  803126:	00 00 00 
  803129:	be a8 00 00 00       	mov    $0xa8,%esi
  80312e:	48 bf b2 5c 80 00 00 	movabs $0x805cb2,%rdi
  803135:	00 00 00 
  803138:	b8 00 00 00 00       	mov    $0x0,%eax
  80313d:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  803144:	00 00 00 
  803147:	41 ff d0             	callq  *%r8
  80314a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80314d:	c9                   	leaveq 
  80314e:	c3                   	retq   

000000000080314f <devfile_stat>:
  80314f:	55                   	push   %rbp
  803150:	48 89 e5             	mov    %rsp,%rbp
  803153:	48 83 ec 20          	sub    $0x20,%rsp
  803157:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80315b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80315f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803163:	8b 50 0c             	mov    0xc(%rax),%edx
  803166:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80316d:	00 00 00 
  803170:	89 10                	mov    %edx,(%rax)
  803172:	be 00 00 00 00       	mov    $0x0,%esi
  803177:	bf 05 00 00 00       	mov    $0x5,%edi
  80317c:	48 b8 cb 2d 80 00 00 	movabs $0x802dcb,%rax
  803183:	00 00 00 
  803186:	ff d0                	callq  *%rax
  803188:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80318b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80318f:	79 05                	jns    803196 <devfile_stat+0x47>
  803191:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803194:	eb 56                	jmp    8031ec <devfile_stat+0x9d>
  803196:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80319a:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8031a1:	00 00 00 
  8031a4:	48 89 c7             	mov    %rax,%rdi
  8031a7:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  8031ae:	00 00 00 
  8031b1:	ff d0                	callq  *%rax
  8031b3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031ba:	00 00 00 
  8031bd:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8031c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031c7:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8031cd:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031d4:	00 00 00 
  8031d7:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8031dd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031e1:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8031e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8031ec:	c9                   	leaveq 
  8031ed:	c3                   	retq   

00000000008031ee <devfile_trunc>:
  8031ee:	55                   	push   %rbp
  8031ef:	48 89 e5             	mov    %rsp,%rbp
  8031f2:	48 83 ec 10          	sub    $0x10,%rsp
  8031f6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8031fa:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8031fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803201:	8b 50 0c             	mov    0xc(%rax),%edx
  803204:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80320b:	00 00 00 
  80320e:	89 10                	mov    %edx,(%rax)
  803210:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803217:	00 00 00 
  80321a:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80321d:	89 50 04             	mov    %edx,0x4(%rax)
  803220:	be 00 00 00 00       	mov    $0x0,%esi
  803225:	bf 02 00 00 00       	mov    $0x2,%edi
  80322a:	48 b8 cb 2d 80 00 00 	movabs $0x802dcb,%rax
  803231:	00 00 00 
  803234:	ff d0                	callq  *%rax
  803236:	c9                   	leaveq 
  803237:	c3                   	retq   

0000000000803238 <remove>:
  803238:	55                   	push   %rbp
  803239:	48 89 e5             	mov    %rsp,%rbp
  80323c:	48 83 ec 10          	sub    $0x10,%rsp
  803240:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803244:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803248:	48 89 c7             	mov    %rax,%rdi
  80324b:	48 b8 b0 10 80 00 00 	movabs $0x8010b0,%rax
  803252:	00 00 00 
  803255:	ff d0                	callq  *%rax
  803257:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80325c:	7e 07                	jle    803265 <remove+0x2d>
  80325e:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803263:	eb 33                	jmp    803298 <remove+0x60>
  803265:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803269:	48 89 c6             	mov    %rax,%rsi
  80326c:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  803273:	00 00 00 
  803276:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  80327d:	00 00 00 
  803280:	ff d0                	callq  *%rax
  803282:	be 00 00 00 00       	mov    $0x0,%esi
  803287:	bf 07 00 00 00       	mov    $0x7,%edi
  80328c:	48 b8 cb 2d 80 00 00 	movabs $0x802dcb,%rax
  803293:	00 00 00 
  803296:	ff d0                	callq  *%rax
  803298:	c9                   	leaveq 
  803299:	c3                   	retq   

000000000080329a <sync>:
  80329a:	55                   	push   %rbp
  80329b:	48 89 e5             	mov    %rsp,%rbp
  80329e:	be 00 00 00 00       	mov    $0x0,%esi
  8032a3:	bf 08 00 00 00       	mov    $0x8,%edi
  8032a8:	48 b8 cb 2d 80 00 00 	movabs $0x802dcb,%rax
  8032af:	00 00 00 
  8032b2:	ff d0                	callq  *%rax
  8032b4:	5d                   	pop    %rbp
  8032b5:	c3                   	retq   

00000000008032b6 <copy>:
  8032b6:	55                   	push   %rbp
  8032b7:	48 89 e5             	mov    %rsp,%rbp
  8032ba:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8032c1:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8032c8:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8032cf:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8032d6:	be 00 00 00 00       	mov    $0x0,%esi
  8032db:	48 89 c7             	mov    %rax,%rdi
  8032de:	48 b8 54 2e 80 00 00 	movabs $0x802e54,%rax
  8032e5:	00 00 00 
  8032e8:	ff d0                	callq  *%rax
  8032ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032f1:	79 28                	jns    80331b <copy+0x65>
  8032f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032f6:	89 c6                	mov    %eax,%esi
  8032f8:	48 bf cc 5c 80 00 00 	movabs $0x805ccc,%rdi
  8032ff:	00 00 00 
  803302:	b8 00 00 00 00       	mov    $0x0,%eax
  803307:	48 ba 8c 05 80 00 00 	movabs $0x80058c,%rdx
  80330e:	00 00 00 
  803311:	ff d2                	callq  *%rdx
  803313:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803316:	e9 76 01 00 00       	jmpq   803491 <copy+0x1db>
  80331b:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803322:	be 01 01 00 00       	mov    $0x101,%esi
  803327:	48 89 c7             	mov    %rax,%rdi
  80332a:	48 b8 54 2e 80 00 00 	movabs $0x802e54,%rax
  803331:	00 00 00 
  803334:	ff d0                	callq  *%rax
  803336:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803339:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80333d:	0f 89 ad 00 00 00    	jns    8033f0 <copy+0x13a>
  803343:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803346:	89 c6                	mov    %eax,%esi
  803348:	48 bf e2 5c 80 00 00 	movabs $0x805ce2,%rdi
  80334f:	00 00 00 
  803352:	b8 00 00 00 00       	mov    $0x0,%eax
  803357:	48 ba 8c 05 80 00 00 	movabs $0x80058c,%rdx
  80335e:	00 00 00 
  803361:	ff d2                	callq  *%rdx
  803363:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803366:	89 c7                	mov    %eax,%edi
  803368:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  80336f:	00 00 00 
  803372:	ff d0                	callq  *%rax
  803374:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803377:	e9 15 01 00 00       	jmpq   803491 <copy+0x1db>
  80337c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80337f:	48 63 d0             	movslq %eax,%rdx
  803382:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803389:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80338c:	48 89 ce             	mov    %rcx,%rsi
  80338f:	89 c7                	mov    %eax,%edi
  803391:	48 b8 c6 2a 80 00 00 	movabs $0x802ac6,%rax
  803398:	00 00 00 
  80339b:	ff d0                	callq  *%rax
  80339d:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8033a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8033a4:	79 4a                	jns    8033f0 <copy+0x13a>
  8033a6:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8033a9:	89 c6                	mov    %eax,%esi
  8033ab:	48 bf fc 5c 80 00 00 	movabs $0x805cfc,%rdi
  8033b2:	00 00 00 
  8033b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8033ba:	48 ba 8c 05 80 00 00 	movabs $0x80058c,%rdx
  8033c1:	00 00 00 
  8033c4:	ff d2                	callq  *%rdx
  8033c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033c9:	89 c7                	mov    %eax,%edi
  8033cb:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  8033d2:	00 00 00 
  8033d5:	ff d0                	callq  *%rax
  8033d7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8033da:	89 c7                	mov    %eax,%edi
  8033dc:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  8033e3:	00 00 00 
  8033e6:	ff d0                	callq  *%rax
  8033e8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8033eb:	e9 a1 00 00 00       	jmpq   803491 <copy+0x1db>
  8033f0:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8033f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033fa:	ba 00 02 00 00       	mov    $0x200,%edx
  8033ff:	48 89 ce             	mov    %rcx,%rsi
  803402:	89 c7                	mov    %eax,%edi
  803404:	48 b8 7b 29 80 00 00 	movabs $0x80297b,%rax
  80340b:	00 00 00 
  80340e:	ff d0                	callq  *%rax
  803410:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803413:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803417:	0f 8f 5f ff ff ff    	jg     80337c <copy+0xc6>
  80341d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803421:	79 47                	jns    80346a <copy+0x1b4>
  803423:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803426:	89 c6                	mov    %eax,%esi
  803428:	48 bf 0f 5d 80 00 00 	movabs $0x805d0f,%rdi
  80342f:	00 00 00 
  803432:	b8 00 00 00 00       	mov    $0x0,%eax
  803437:	48 ba 8c 05 80 00 00 	movabs $0x80058c,%rdx
  80343e:	00 00 00 
  803441:	ff d2                	callq  *%rdx
  803443:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803446:	89 c7                	mov    %eax,%edi
  803448:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  80344f:	00 00 00 
  803452:	ff d0                	callq  *%rax
  803454:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803457:	89 c7                	mov    %eax,%edi
  803459:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  803460:	00 00 00 
  803463:	ff d0                	callq  *%rax
  803465:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803468:	eb 27                	jmp    803491 <copy+0x1db>
  80346a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80346d:	89 c7                	mov    %eax,%edi
  80346f:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  803476:	00 00 00 
  803479:	ff d0                	callq  *%rax
  80347b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80347e:	89 c7                	mov    %eax,%edi
  803480:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  803487:	00 00 00 
  80348a:	ff d0                	callq  *%rax
  80348c:	b8 00 00 00 00       	mov    $0x0,%eax
  803491:	c9                   	leaveq 
  803492:	c3                   	retq   

0000000000803493 <spawn>:
  803493:	55                   	push   %rbp
  803494:	48 89 e5             	mov    %rsp,%rbp
  803497:	48 81 ec 00 03 00 00 	sub    $0x300,%rsp
  80349e:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  8034a5:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  8034ac:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  8034b3:	be 00 00 00 00       	mov    $0x0,%esi
  8034b8:	48 89 c7             	mov    %rax,%rdi
  8034bb:	48 b8 54 2e 80 00 00 	movabs $0x802e54,%rax
  8034c2:	00 00 00 
  8034c5:	ff d0                	callq  *%rax
  8034c7:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8034ca:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8034ce:	79 08                	jns    8034d8 <spawn+0x45>
  8034d0:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8034d3:	e9 11 03 00 00       	jmpq   8037e9 <spawn+0x356>
  8034d8:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8034db:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8034de:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  8034e5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8034e9:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  8034f0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8034f3:	ba 00 02 00 00       	mov    $0x200,%edx
  8034f8:	48 89 ce             	mov    %rcx,%rsi
  8034fb:	89 c7                	mov    %eax,%edi
  8034fd:	48 b8 50 2a 80 00 00 	movabs $0x802a50,%rax
  803504:	00 00 00 
  803507:	ff d0                	callq  *%rax
  803509:	3d 00 02 00 00       	cmp    $0x200,%eax
  80350e:	75 0d                	jne    80351d <spawn+0x8a>
  803510:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803514:	8b 00                	mov    (%rax),%eax
  803516:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  80351b:	74 43                	je     803560 <spawn+0xcd>
  80351d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803520:	89 c7                	mov    %eax,%edi
  803522:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  803529:	00 00 00 
  80352c:	ff d0                	callq  *%rax
  80352e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803532:	8b 00                	mov    (%rax),%eax
  803534:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  803539:	89 c6                	mov    %eax,%esi
  80353b:	48 bf 28 5d 80 00 00 	movabs $0x805d28,%rdi
  803542:	00 00 00 
  803545:	b8 00 00 00 00       	mov    $0x0,%eax
  80354a:	48 b9 8c 05 80 00 00 	movabs $0x80058c,%rcx
  803551:	00 00 00 
  803554:	ff d1                	callq  *%rcx
  803556:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  80355b:	e9 89 02 00 00       	jmpq   8037e9 <spawn+0x356>
  803560:	b8 07 00 00 00       	mov    $0x7,%eax
  803565:	cd 30                	int    $0x30
  803567:	89 45 d0             	mov    %eax,-0x30(%rbp)
  80356a:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80356d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803570:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803574:	79 08                	jns    80357e <spawn+0xeb>
  803576:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803579:	e9 6b 02 00 00       	jmpq   8037e9 <spawn+0x356>
  80357e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803581:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  803584:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803587:	25 ff 03 00 00       	and    $0x3ff,%eax
  80358c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803593:	00 00 00 
  803596:	48 98                	cltq   
  803598:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80359f:	48 01 c2             	add    %rax,%rdx
  8035a2:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  8035a9:	48 89 d6             	mov    %rdx,%rsi
  8035ac:	ba 18 00 00 00       	mov    $0x18,%edx
  8035b1:	48 89 c7             	mov    %rax,%rdi
  8035b4:	48 89 d1             	mov    %rdx,%rcx
  8035b7:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  8035ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8035be:	48 8b 40 18          	mov    0x18(%rax),%rax
  8035c2:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  8035c9:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  8035d0:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  8035d7:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  8035de:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8035e1:	48 89 ce             	mov    %rcx,%rsi
  8035e4:	89 c7                	mov    %eax,%edi
  8035e6:	48 b8 4d 3a 80 00 00 	movabs $0x803a4d,%rax
  8035ed:	00 00 00 
  8035f0:	ff d0                	callq  *%rax
  8035f2:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8035f5:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8035f9:	79 08                	jns    803603 <spawn+0x170>
  8035fb:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8035fe:	e9 e6 01 00 00       	jmpq   8037e9 <spawn+0x356>
  803603:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803607:	48 8b 40 20          	mov    0x20(%rax),%rax
  80360b:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  803612:	48 01 d0             	add    %rdx,%rax
  803615:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803619:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803620:	e9 80 00 00 00       	jmpq   8036a5 <spawn+0x212>
  803625:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803629:	8b 00                	mov    (%rax),%eax
  80362b:	83 f8 01             	cmp    $0x1,%eax
  80362e:	75 6b                	jne    80369b <spawn+0x208>
  803630:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  803637:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80363b:	8b 40 04             	mov    0x4(%rax),%eax
  80363e:	83 e0 02             	and    $0x2,%eax
  803641:	85 c0                	test   %eax,%eax
  803643:	74 04                	je     803649 <spawn+0x1b6>
  803645:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  803649:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80364d:	48 8b 40 08          	mov    0x8(%rax),%rax
  803651:	41 89 c1             	mov    %eax,%r9d
  803654:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803658:	4c 8b 40 20          	mov    0x20(%rax),%r8
  80365c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803660:	48 8b 50 28          	mov    0x28(%rax),%rdx
  803664:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803668:	48 8b 70 10          	mov    0x10(%rax),%rsi
  80366c:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80366f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803672:	48 83 ec 08          	sub    $0x8,%rsp
  803676:	8b 7d ec             	mov    -0x14(%rbp),%edi
  803679:	57                   	push   %rdi
  80367a:	89 c7                	mov    %eax,%edi
  80367c:	48 b8 f9 3c 80 00 00 	movabs $0x803cf9,%rax
  803683:	00 00 00 
  803686:	ff d0                	callq  *%rax
  803688:	48 83 c4 10          	add    $0x10,%rsp
  80368c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80368f:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803693:	0f 88 2a 01 00 00    	js     8037c3 <spawn+0x330>
  803699:	eb 01                	jmp    80369c <spawn+0x209>
  80369b:	90                   	nop
  80369c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8036a0:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  8036a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036a9:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  8036ad:	0f b7 c0             	movzwl %ax,%eax
  8036b0:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  8036b3:	0f 8f 6c ff ff ff    	jg     803625 <spawn+0x192>
  8036b9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8036bc:	89 c7                	mov    %eax,%edi
  8036be:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  8036c5:	00 00 00 
  8036c8:	ff d0                	callq  *%rax
  8036ca:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  8036d1:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8036d4:	89 c7                	mov    %eax,%edi
  8036d6:	48 b8 e5 3e 80 00 00 	movabs $0x803ee5,%rax
  8036dd:	00 00 00 
  8036e0:	ff d0                	callq  *%rax
  8036e2:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8036e5:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8036e9:	79 30                	jns    80371b <spawn+0x288>
  8036eb:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8036ee:	89 c1                	mov    %eax,%ecx
  8036f0:	48 ba 42 5d 80 00 00 	movabs $0x805d42,%rdx
  8036f7:	00 00 00 
  8036fa:	be 86 00 00 00       	mov    $0x86,%esi
  8036ff:	48 bf 58 5d 80 00 00 	movabs $0x805d58,%rdi
  803706:	00 00 00 
  803709:	b8 00 00 00 00       	mov    $0x0,%eax
  80370e:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  803715:	00 00 00 
  803718:	41 ff d0             	callq  *%r8
  80371b:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  803722:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803725:	48 89 d6             	mov    %rdx,%rsi
  803728:	89 c7                	mov    %eax,%edi
  80372a:	48 b8 97 1b 80 00 00 	movabs $0x801b97,%rax
  803731:	00 00 00 
  803734:	ff d0                	callq  *%rax
  803736:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803739:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80373d:	79 30                	jns    80376f <spawn+0x2dc>
  80373f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803742:	89 c1                	mov    %eax,%ecx
  803744:	48 ba 67 5d 80 00 00 	movabs $0x805d67,%rdx
  80374b:	00 00 00 
  80374e:	be 8a 00 00 00       	mov    $0x8a,%esi
  803753:	48 bf 58 5d 80 00 00 	movabs $0x805d58,%rdi
  80375a:	00 00 00 
  80375d:	b8 00 00 00 00       	mov    $0x0,%eax
  803762:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  803769:	00 00 00 
  80376c:	41 ff d0             	callq  *%r8
  80376f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803772:	be 02 00 00 00       	mov    $0x2,%esi
  803777:	89 c7                	mov    %eax,%edi
  803779:	48 b8 4a 1b 80 00 00 	movabs $0x801b4a,%rax
  803780:	00 00 00 
  803783:	ff d0                	callq  *%rax
  803785:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803788:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80378c:	79 30                	jns    8037be <spawn+0x32b>
  80378e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803791:	89 c1                	mov    %eax,%ecx
  803793:	48 ba 81 5d 80 00 00 	movabs $0x805d81,%rdx
  80379a:	00 00 00 
  80379d:	be 8d 00 00 00       	mov    $0x8d,%esi
  8037a2:	48 bf 58 5d 80 00 00 	movabs $0x805d58,%rdi
  8037a9:	00 00 00 
  8037ac:	b8 00 00 00 00       	mov    $0x0,%eax
  8037b1:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  8037b8:	00 00 00 
  8037bb:	41 ff d0             	callq  *%r8
  8037be:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8037c1:	eb 26                	jmp    8037e9 <spawn+0x356>
  8037c3:	90                   	nop
  8037c4:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8037c7:	89 c7                	mov    %eax,%edi
  8037c9:	48 b8 8d 19 80 00 00 	movabs $0x80198d,%rax
  8037d0:	00 00 00 
  8037d3:	ff d0                	callq  *%rax
  8037d5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8037d8:	89 c7                	mov    %eax,%edi
  8037da:	48 b8 58 27 80 00 00 	movabs $0x802758,%rax
  8037e1:	00 00 00 
  8037e4:	ff d0                	callq  *%rax
  8037e6:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8037e9:	c9                   	leaveq 
  8037ea:	c3                   	retq   

00000000008037eb <spawnl>:
  8037eb:	55                   	push   %rbp
  8037ec:	48 89 e5             	mov    %rsp,%rbp
  8037ef:	41 55                	push   %r13
  8037f1:	41 54                	push   %r12
  8037f3:	53                   	push   %rbx
  8037f4:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8037fb:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  803802:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  803809:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  803810:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  803817:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  80381e:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  803825:	84 c0                	test   %al,%al
  803827:	74 26                	je     80384f <spawnl+0x64>
  803829:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  803830:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  803837:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  80383b:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  80383f:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  803843:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  803847:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  80384b:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  80384f:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  803856:	00 00 00 
  803859:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803860:	00 00 00 
  803863:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  80386a:	00 00 00 
  80386d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803871:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803878:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  80387f:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  803886:	eb 07                	jmp    80388f <spawnl+0xa4>
  803888:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  80388f:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803895:	83 f8 30             	cmp    $0x30,%eax
  803898:	73 23                	jae    8038bd <spawnl+0xd2>
  80389a:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  8038a1:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8038a7:	89 d2                	mov    %edx,%edx
  8038a9:	48 01 d0             	add    %rdx,%rax
  8038ac:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8038b2:	83 c2 08             	add    $0x8,%edx
  8038b5:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8038bb:	eb 12                	jmp    8038cf <spawnl+0xe4>
  8038bd:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8038c4:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8038c8:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8038cf:	48 8b 00             	mov    (%rax),%rax
  8038d2:	48 85 c0             	test   %rax,%rax
  8038d5:	75 b1                	jne    803888 <spawnl+0x9d>
  8038d7:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8038dd:	83 c0 02             	add    $0x2,%eax
  8038e0:	48 89 e2             	mov    %rsp,%rdx
  8038e3:	48 89 d3             	mov    %rdx,%rbx
  8038e6:	48 63 d0             	movslq %eax,%rdx
  8038e9:	48 83 ea 01          	sub    $0x1,%rdx
  8038ed:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  8038f4:	48 63 d0             	movslq %eax,%rdx
  8038f7:	49 89 d4             	mov    %rdx,%r12
  8038fa:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  803900:	48 63 d0             	movslq %eax,%rdx
  803903:	49 89 d2             	mov    %rdx,%r10
  803906:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  80390c:	48 98                	cltq   
  80390e:	48 c1 e0 03          	shl    $0x3,%rax
  803912:	48 8d 50 07          	lea    0x7(%rax),%rdx
  803916:	b8 10 00 00 00       	mov    $0x10,%eax
  80391b:	48 83 e8 01          	sub    $0x1,%rax
  80391f:	48 01 d0             	add    %rdx,%rax
  803922:	be 10 00 00 00       	mov    $0x10,%esi
  803927:	ba 00 00 00 00       	mov    $0x0,%edx
  80392c:	48 f7 f6             	div    %rsi
  80392f:	48 6b c0 10          	imul   $0x10,%rax,%rax
  803933:	48 29 c4             	sub    %rax,%rsp
  803936:	48 89 e0             	mov    %rsp,%rax
  803939:	48 83 c0 07          	add    $0x7,%rax
  80393d:	48 c1 e8 03          	shr    $0x3,%rax
  803941:	48 c1 e0 03          	shl    $0x3,%rax
  803945:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  80394c:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803953:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  80395a:	48 89 10             	mov    %rdx,(%rax)
  80395d:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803963:	8d 50 01             	lea    0x1(%rax),%edx
  803966:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80396d:	48 63 d2             	movslq %edx,%rdx
  803970:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  803977:	00 
  803978:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  80397f:	00 00 00 
  803982:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803989:	00 00 00 
  80398c:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803990:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803997:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  80399e:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  8039a5:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  8039ac:	00 00 00 
  8039af:	eb 60                	jmp    803a11 <spawnl+0x226>
  8039b1:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  8039b7:	8d 48 01             	lea    0x1(%rax),%ecx
  8039ba:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8039c0:	83 f8 30             	cmp    $0x30,%eax
  8039c3:	73 23                	jae    8039e8 <spawnl+0x1fd>
  8039c5:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  8039cc:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8039d2:	89 d2                	mov    %edx,%edx
  8039d4:	48 01 d0             	add    %rdx,%rax
  8039d7:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8039dd:	83 c2 08             	add    $0x8,%edx
  8039e0:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8039e6:	eb 12                	jmp    8039fa <spawnl+0x20f>
  8039e8:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8039ef:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8039f3:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8039fa:	48 8b 10             	mov    (%rax),%rdx
  8039fd:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803a04:	89 c9                	mov    %ecx,%ecx
  803a06:	48 89 14 c8          	mov    %rdx,(%rax,%rcx,8)
  803a0a:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  803a11:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803a17:	39 85 28 ff ff ff    	cmp    %eax,-0xd8(%rbp)
  803a1d:	72 92                	jb     8039b1 <spawnl+0x1c6>
  803a1f:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  803a26:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  803a2d:	48 89 d6             	mov    %rdx,%rsi
  803a30:	48 89 c7             	mov    %rax,%rdi
  803a33:	48 b8 93 34 80 00 00 	movabs $0x803493,%rax
  803a3a:	00 00 00 
  803a3d:	ff d0                	callq  *%rax
  803a3f:	48 89 dc             	mov    %rbx,%rsp
  803a42:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  803a46:	5b                   	pop    %rbx
  803a47:	41 5c                	pop    %r12
  803a49:	41 5d                	pop    %r13
  803a4b:	5d                   	pop    %rbp
  803a4c:	c3                   	retq   

0000000000803a4d <init_stack>:
  803a4d:	55                   	push   %rbp
  803a4e:	48 89 e5             	mov    %rsp,%rbp
  803a51:	48 83 ec 50          	sub    $0x50,%rsp
  803a55:	89 7d cc             	mov    %edi,-0x34(%rbp)
  803a58:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  803a5c:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803a60:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803a67:	00 
  803a68:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  803a6f:	eb 33                	jmp    803aa4 <init_stack+0x57>
  803a71:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803a74:	48 98                	cltq   
  803a76:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803a7d:	00 
  803a7e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803a82:	48 01 d0             	add    %rdx,%rax
  803a85:	48 8b 00             	mov    (%rax),%rax
  803a88:	48 89 c7             	mov    %rax,%rdi
  803a8b:	48 b8 b0 10 80 00 00 	movabs $0x8010b0,%rax
  803a92:	00 00 00 
  803a95:	ff d0                	callq  *%rax
  803a97:	83 c0 01             	add    $0x1,%eax
  803a9a:	48 98                	cltq   
  803a9c:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  803aa0:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  803aa4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803aa7:	48 98                	cltq   
  803aa9:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803ab0:	00 
  803ab1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803ab5:	48 01 d0             	add    %rdx,%rax
  803ab8:	48 8b 00             	mov    (%rax),%rax
  803abb:	48 85 c0             	test   %rax,%rax
  803abe:	75 b1                	jne    803a71 <init_stack+0x24>
  803ac0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ac4:	48 f7 d8             	neg    %rax
  803ac7:	48 05 00 10 40 00    	add    $0x401000,%rax
  803acd:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803ad1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ad5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  803ad9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803add:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  803ae1:	48 89 c2             	mov    %rax,%rdx
  803ae4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803ae7:	83 c0 01             	add    $0x1,%eax
  803aea:	c1 e0 03             	shl    $0x3,%eax
  803aed:	48 98                	cltq   
  803aef:	48 f7 d8             	neg    %rax
  803af2:	48 01 d0             	add    %rdx,%rax
  803af5:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  803af9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803afd:	48 83 e8 10          	sub    $0x10,%rax
  803b01:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  803b07:	77 0a                	ja     803b13 <init_stack+0xc6>
  803b09:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  803b0e:	e9 e4 01 00 00       	jmpq   803cf7 <init_stack+0x2aa>
  803b13:	ba 07 00 00 00       	mov    $0x7,%edx
  803b18:	be 00 00 40 00       	mov    $0x400000,%esi
  803b1d:	bf 00 00 00 00       	mov    $0x0,%edi
  803b22:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  803b29:	00 00 00 
  803b2c:	ff d0                	callq  *%rax
  803b2e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b31:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b35:	79 08                	jns    803b3f <init_stack+0xf2>
  803b37:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b3a:	e9 b8 01 00 00       	jmpq   803cf7 <init_stack+0x2aa>
  803b3f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  803b46:	e9 8a 00 00 00       	jmpq   803bd5 <init_stack+0x188>
  803b4b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803b4e:	48 98                	cltq   
  803b50:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803b57:	00 
  803b58:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b5c:	48 01 d0             	add    %rdx,%rax
  803b5f:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803b64:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803b68:	48 01 ca             	add    %rcx,%rdx
  803b6b:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  803b72:	48 89 10             	mov    %rdx,(%rax)
  803b75:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803b78:	48 98                	cltq   
  803b7a:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803b81:	00 
  803b82:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803b86:	48 01 d0             	add    %rdx,%rax
  803b89:	48 8b 10             	mov    (%rax),%rdx
  803b8c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b90:	48 89 d6             	mov    %rdx,%rsi
  803b93:	48 89 c7             	mov    %rax,%rdi
  803b96:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  803b9d:	00 00 00 
  803ba0:	ff d0                	callq  *%rax
  803ba2:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803ba5:	48 98                	cltq   
  803ba7:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803bae:	00 
  803baf:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  803bb3:	48 01 d0             	add    %rdx,%rax
  803bb6:	48 8b 00             	mov    (%rax),%rax
  803bb9:	48 89 c7             	mov    %rax,%rdi
  803bbc:	48 b8 b0 10 80 00 00 	movabs $0x8010b0,%rax
  803bc3:	00 00 00 
  803bc6:	ff d0                	callq  *%rax
  803bc8:	83 c0 01             	add    $0x1,%eax
  803bcb:	48 98                	cltq   
  803bcd:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  803bd1:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  803bd5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803bd8:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  803bdb:	0f 8c 6a ff ff ff    	jl     803b4b <init_stack+0xfe>
  803be1:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803be4:	48 98                	cltq   
  803be6:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803bed:	00 
  803bee:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bf2:	48 01 d0             	add    %rdx,%rax
  803bf5:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803bfc:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  803c03:	00 
  803c04:	74 35                	je     803c3b <init_stack+0x1ee>
  803c06:	48 b9 98 5d 80 00 00 	movabs $0x805d98,%rcx
  803c0d:	00 00 00 
  803c10:	48 ba be 5d 80 00 00 	movabs $0x805dbe,%rdx
  803c17:	00 00 00 
  803c1a:	be f6 00 00 00       	mov    $0xf6,%esi
  803c1f:	48 bf 58 5d 80 00 00 	movabs $0x805d58,%rdi
  803c26:	00 00 00 
  803c29:	b8 00 00 00 00       	mov    $0x0,%eax
  803c2e:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  803c35:	00 00 00 
  803c38:	41 ff d0             	callq  *%r8
  803c3b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c3f:	48 83 e8 08          	sub    $0x8,%rax
  803c43:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803c48:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  803c4c:	48 01 ca             	add    %rcx,%rdx
  803c4f:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  803c56:	48 89 10             	mov    %rdx,(%rax)
  803c59:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c5d:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  803c61:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803c64:	48 98                	cltq   
  803c66:	48 89 02             	mov    %rax,(%rdx)
  803c69:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  803c6e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c72:	48 01 d0             	add    %rdx,%rax
  803c75:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803c7b:	48 89 c2             	mov    %rax,%rdx
  803c7e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  803c82:	48 89 10             	mov    %rdx,(%rax)
  803c85:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803c88:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  803c8e:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803c93:	89 c2                	mov    %eax,%edx
  803c95:	be 00 00 40 00       	mov    $0x400000,%esi
  803c9a:	bf 00 00 00 00       	mov    $0x0,%edi
  803c9f:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  803ca6:	00 00 00 
  803ca9:	ff d0                	callq  *%rax
  803cab:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803cae:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803cb2:	78 26                	js     803cda <init_stack+0x28d>
  803cb4:	be 00 00 40 00       	mov    $0x400000,%esi
  803cb9:	bf 00 00 00 00       	mov    $0x0,%edi
  803cbe:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  803cc5:	00 00 00 
  803cc8:	ff d0                	callq  *%rax
  803cca:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ccd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803cd1:	78 0a                	js     803cdd <init_stack+0x290>
  803cd3:	b8 00 00 00 00       	mov    $0x0,%eax
  803cd8:	eb 1d                	jmp    803cf7 <init_stack+0x2aa>
  803cda:	90                   	nop
  803cdb:	eb 01                	jmp    803cde <init_stack+0x291>
  803cdd:	90                   	nop
  803cde:	be 00 00 40 00       	mov    $0x400000,%esi
  803ce3:	bf 00 00 00 00       	mov    $0x0,%edi
  803ce8:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  803cef:	00 00 00 
  803cf2:	ff d0                	callq  *%rax
  803cf4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cf7:	c9                   	leaveq 
  803cf8:	c3                   	retq   

0000000000803cf9 <map_segment>:
  803cf9:	55                   	push   %rbp
  803cfa:	48 89 e5             	mov    %rsp,%rbp
  803cfd:	48 83 ec 50          	sub    $0x50,%rsp
  803d01:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803d04:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803d08:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803d0c:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  803d0f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  803d13:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  803d17:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d1b:	25 ff 0f 00 00       	and    $0xfff,%eax
  803d20:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d23:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d27:	74 21                	je     803d4a <map_segment+0x51>
  803d29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d2c:	48 98                	cltq   
  803d2e:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  803d32:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d35:	48 98                	cltq   
  803d37:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  803d3b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d3e:	48 98                	cltq   
  803d40:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  803d44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d47:	29 45 bc             	sub    %eax,-0x44(%rbp)
  803d4a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803d51:	e9 79 01 00 00       	jmpq   803ecf <map_segment+0x1d6>
  803d56:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d59:	48 98                	cltq   
  803d5b:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  803d5f:	72 3c                	jb     803d9d <map_segment+0xa4>
  803d61:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d64:	48 63 d0             	movslq %eax,%rdx
  803d67:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d6b:	48 01 d0             	add    %rdx,%rax
  803d6e:	48 89 c1             	mov    %rax,%rcx
  803d71:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803d74:	8b 55 10             	mov    0x10(%rbp),%edx
  803d77:	48 89 ce             	mov    %rcx,%rsi
  803d7a:	89 c7                	mov    %eax,%edi
  803d7c:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  803d83:	00 00 00 
  803d86:	ff d0                	callq  *%rax
  803d88:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803d8b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803d8f:	0f 89 33 01 00 00    	jns    803ec8 <map_segment+0x1cf>
  803d95:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d98:	e9 46 01 00 00       	jmpq   803ee3 <map_segment+0x1ea>
  803d9d:	ba 07 00 00 00       	mov    $0x7,%edx
  803da2:	be 00 00 40 00       	mov    $0x400000,%esi
  803da7:	bf 00 00 00 00       	mov    $0x0,%edi
  803dac:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  803db3:	00 00 00 
  803db6:	ff d0                	callq  *%rax
  803db8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803dbb:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803dbf:	79 08                	jns    803dc9 <map_segment+0xd0>
  803dc1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803dc4:	e9 1a 01 00 00       	jmpq   803ee3 <map_segment+0x1ea>
  803dc9:	8b 55 bc             	mov    -0x44(%rbp),%edx
  803dcc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dcf:	01 c2                	add    %eax,%edx
  803dd1:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803dd4:	89 d6                	mov    %edx,%esi
  803dd6:	89 c7                	mov    %eax,%edi
  803dd8:	48 b8 9a 2b 80 00 00 	movabs $0x802b9a,%rax
  803ddf:	00 00 00 
  803de2:	ff d0                	callq  *%rax
  803de4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803de7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803deb:	79 08                	jns    803df5 <map_segment+0xfc>
  803ded:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803df0:	e9 ee 00 00 00       	jmpq   803ee3 <map_segment+0x1ea>
  803df5:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  803dfc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dff:	48 98                	cltq   
  803e01:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803e05:	48 29 c2             	sub    %rax,%rdx
  803e08:	48 89 d0             	mov    %rdx,%rax
  803e0b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803e0f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803e12:	48 63 d0             	movslq %eax,%rdx
  803e15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e19:	48 39 c2             	cmp    %rax,%rdx
  803e1c:	48 0f 47 d0          	cmova  %rax,%rdx
  803e20:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803e23:	be 00 00 40 00       	mov    $0x400000,%esi
  803e28:	89 c7                	mov    %eax,%edi
  803e2a:	48 b8 50 2a 80 00 00 	movabs $0x802a50,%rax
  803e31:	00 00 00 
  803e34:	ff d0                	callq  *%rax
  803e36:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803e39:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803e3d:	79 08                	jns    803e47 <map_segment+0x14e>
  803e3f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e42:	e9 9c 00 00 00       	jmpq   803ee3 <map_segment+0x1ea>
  803e47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e4a:	48 63 d0             	movslq %eax,%rdx
  803e4d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e51:	48 01 d0             	add    %rdx,%rax
  803e54:	48 89 c2             	mov    %rax,%rdx
  803e57:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803e5a:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  803e5e:	48 89 d1             	mov    %rdx,%rcx
  803e61:	89 c2                	mov    %eax,%edx
  803e63:	be 00 00 40 00       	mov    $0x400000,%esi
  803e68:	bf 00 00 00 00       	mov    $0x0,%edi
  803e6d:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  803e74:	00 00 00 
  803e77:	ff d0                	callq  *%rax
  803e79:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803e7c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803e80:	79 30                	jns    803eb2 <map_segment+0x1b9>
  803e82:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e85:	89 c1                	mov    %eax,%ecx
  803e87:	48 ba d3 5d 80 00 00 	movabs $0x805dd3,%rdx
  803e8e:	00 00 00 
  803e91:	be 29 01 00 00       	mov    $0x129,%esi
  803e96:	48 bf 58 5d 80 00 00 	movabs $0x805d58,%rdi
  803e9d:	00 00 00 
  803ea0:	b8 00 00 00 00       	mov    $0x0,%eax
  803ea5:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  803eac:	00 00 00 
  803eaf:	41 ff d0             	callq  *%r8
  803eb2:	be 00 00 40 00       	mov    $0x400000,%esi
  803eb7:	bf 00 00 00 00       	mov    $0x0,%edi
  803ebc:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  803ec3:	00 00 00 
  803ec6:	ff d0                	callq  *%rax
  803ec8:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  803ecf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ed2:	48 98                	cltq   
  803ed4:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803ed8:	0f 82 78 fe ff ff    	jb     803d56 <map_segment+0x5d>
  803ede:	b8 00 00 00 00       	mov    $0x0,%eax
  803ee3:	c9                   	leaveq 
  803ee4:	c3                   	retq   

0000000000803ee5 <copy_shared_pages>:
  803ee5:	55                   	push   %rbp
  803ee6:	48 89 e5             	mov    %rsp,%rbp
  803ee9:	48 83 ec 30          	sub    $0x30,%rsp
  803eed:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803ef0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803ef7:	00 
  803ef8:	e9 eb 00 00 00       	jmpq   803fe8 <copy_shared_pages+0x103>
  803efd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f01:	48 c1 f8 12          	sar    $0x12,%rax
  803f05:	48 89 c2             	mov    %rax,%rdx
  803f08:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  803f0f:	01 00 00 
  803f12:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803f16:	83 e0 01             	and    $0x1,%eax
  803f19:	48 85 c0             	test   %rax,%rax
  803f1c:	74 21                	je     803f3f <copy_shared_pages+0x5a>
  803f1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f22:	48 c1 f8 09          	sar    $0x9,%rax
  803f26:	48 89 c2             	mov    %rax,%rdx
  803f29:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803f30:	01 00 00 
  803f33:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803f37:	83 e0 01             	and    $0x1,%eax
  803f3a:	48 85 c0             	test   %rax,%rax
  803f3d:	75 0d                	jne    803f4c <copy_shared_pages+0x67>
  803f3f:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  803f46:	00 
  803f47:	e9 9c 00 00 00       	jmpq   803fe8 <copy_shared_pages+0x103>
  803f4c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f50:	48 05 00 02 00 00    	add    $0x200,%rax
  803f56:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803f5a:	eb 7e                	jmp    803fda <copy_shared_pages+0xf5>
  803f5c:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803f63:	01 00 00 
  803f66:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803f6a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803f6e:	25 01 04 00 00       	and    $0x401,%eax
  803f73:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  803f79:	75 5a                	jne    803fd5 <copy_shared_pages+0xf0>
  803f7b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f7f:	48 c1 e0 0c          	shl    $0xc,%rax
  803f83:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803f87:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803f8e:	01 00 00 
  803f91:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803f95:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803f99:	25 07 0e 00 00       	and    $0xe07,%eax
  803f9e:	89 c6                	mov    %eax,%esi
  803fa0:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803fa4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803fa7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fab:	41 89 f0             	mov    %esi,%r8d
  803fae:	48 89 c6             	mov    %rax,%rsi
  803fb1:	bf 00 00 00 00       	mov    $0x0,%edi
  803fb6:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  803fbd:	00 00 00 
  803fc0:	ff d0                	callq  *%rax
  803fc2:	48 98                	cltq   
  803fc4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803fc8:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803fcd:	79 06                	jns    803fd5 <copy_shared_pages+0xf0>
  803fcf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fd3:	eb 28                	jmp    803ffd <copy_shared_pages+0x118>
  803fd5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803fda:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fde:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  803fe2:	0f 8c 74 ff ff ff    	jl     803f5c <copy_shared_pages+0x77>
  803fe8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fec:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  803ff2:	0f 86 05 ff ff ff    	jbe    803efd <copy_shared_pages+0x18>
  803ff8:	b8 00 00 00 00       	mov    $0x0,%eax
  803ffd:	c9                   	leaveq 
  803ffe:	c3                   	retq   

0000000000803fff <fd2sockid>:
  803fff:	55                   	push   %rbp
  804000:	48 89 e5             	mov    %rsp,%rbp
  804003:	48 83 ec 20          	sub    $0x20,%rsp
  804007:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80400a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80400e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804011:	48 89 d6             	mov    %rdx,%rsi
  804014:	89 c7                	mov    %eax,%edi
  804016:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  80401d:	00 00 00 
  804020:	ff d0                	callq  *%rax
  804022:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804025:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804029:	79 05                	jns    804030 <fd2sockid+0x31>
  80402b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80402e:	eb 24                	jmp    804054 <fd2sockid+0x55>
  804030:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804034:	8b 10                	mov    (%rax),%edx
  804036:	48 b8 a0 80 80 00 00 	movabs $0x8080a0,%rax
  80403d:	00 00 00 
  804040:	8b 00                	mov    (%rax),%eax
  804042:	39 c2                	cmp    %eax,%edx
  804044:	74 07                	je     80404d <fd2sockid+0x4e>
  804046:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80404b:	eb 07                	jmp    804054 <fd2sockid+0x55>
  80404d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804051:	8b 40 0c             	mov    0xc(%rax),%eax
  804054:	c9                   	leaveq 
  804055:	c3                   	retq   

0000000000804056 <alloc_sockfd>:
  804056:	55                   	push   %rbp
  804057:	48 89 e5             	mov    %rsp,%rbp
  80405a:	48 83 ec 20          	sub    $0x20,%rsp
  80405e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804061:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804065:	48 89 c7             	mov    %rax,%rdi
  804068:	48 b8 ae 24 80 00 00 	movabs $0x8024ae,%rax
  80406f:	00 00 00 
  804072:	ff d0                	callq  *%rax
  804074:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804077:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80407b:	78 26                	js     8040a3 <alloc_sockfd+0x4d>
  80407d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804081:	ba 07 04 00 00       	mov    $0x407,%edx
  804086:	48 89 c6             	mov    %rax,%rsi
  804089:	bf 00 00 00 00       	mov    $0x0,%edi
  80408e:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  804095:	00 00 00 
  804098:	ff d0                	callq  *%rax
  80409a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80409d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040a1:	79 16                	jns    8040b9 <alloc_sockfd+0x63>
  8040a3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040a6:	89 c7                	mov    %eax,%edi
  8040a8:	48 b8 65 45 80 00 00 	movabs $0x804565,%rax
  8040af:	00 00 00 
  8040b2:	ff d0                	callq  *%rax
  8040b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040b7:	eb 3a                	jmp    8040f3 <alloc_sockfd+0x9d>
  8040b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040bd:	48 ba a0 80 80 00 00 	movabs $0x8080a0,%rdx
  8040c4:	00 00 00 
  8040c7:	8b 12                	mov    (%rdx),%edx
  8040c9:	89 10                	mov    %edx,(%rax)
  8040cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040cf:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8040d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040da:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8040dd:	89 50 0c             	mov    %edx,0xc(%rax)
  8040e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040e4:	48 89 c7             	mov    %rax,%rdi
  8040e7:	48 b8 60 24 80 00 00 	movabs $0x802460,%rax
  8040ee:	00 00 00 
  8040f1:	ff d0                	callq  *%rax
  8040f3:	c9                   	leaveq 
  8040f4:	c3                   	retq   

00000000008040f5 <accept>:
  8040f5:	55                   	push   %rbp
  8040f6:	48 89 e5             	mov    %rsp,%rbp
  8040f9:	48 83 ec 30          	sub    $0x30,%rsp
  8040fd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804100:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804104:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804108:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80410b:	89 c7                	mov    %eax,%edi
  80410d:	48 b8 ff 3f 80 00 00 	movabs $0x803fff,%rax
  804114:	00 00 00 
  804117:	ff d0                	callq  *%rax
  804119:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80411c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804120:	79 05                	jns    804127 <accept+0x32>
  804122:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804125:	eb 3b                	jmp    804162 <accept+0x6d>
  804127:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80412b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80412f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804132:	48 89 ce             	mov    %rcx,%rsi
  804135:	89 c7                	mov    %eax,%edi
  804137:	48 b8 42 44 80 00 00 	movabs $0x804442,%rax
  80413e:	00 00 00 
  804141:	ff d0                	callq  *%rax
  804143:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804146:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80414a:	79 05                	jns    804151 <accept+0x5c>
  80414c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80414f:	eb 11                	jmp    804162 <accept+0x6d>
  804151:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804154:	89 c7                	mov    %eax,%edi
  804156:	48 b8 56 40 80 00 00 	movabs $0x804056,%rax
  80415d:	00 00 00 
  804160:	ff d0                	callq  *%rax
  804162:	c9                   	leaveq 
  804163:	c3                   	retq   

0000000000804164 <bind>:
  804164:	55                   	push   %rbp
  804165:	48 89 e5             	mov    %rsp,%rbp
  804168:	48 83 ec 20          	sub    $0x20,%rsp
  80416c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80416f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804173:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804176:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804179:	89 c7                	mov    %eax,%edi
  80417b:	48 b8 ff 3f 80 00 00 	movabs $0x803fff,%rax
  804182:	00 00 00 
  804185:	ff d0                	callq  *%rax
  804187:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80418a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80418e:	79 05                	jns    804195 <bind+0x31>
  804190:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804193:	eb 1b                	jmp    8041b0 <bind+0x4c>
  804195:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804198:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80419c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80419f:	48 89 ce             	mov    %rcx,%rsi
  8041a2:	89 c7                	mov    %eax,%edi
  8041a4:	48 b8 c1 44 80 00 00 	movabs $0x8044c1,%rax
  8041ab:	00 00 00 
  8041ae:	ff d0                	callq  *%rax
  8041b0:	c9                   	leaveq 
  8041b1:	c3                   	retq   

00000000008041b2 <shutdown>:
  8041b2:	55                   	push   %rbp
  8041b3:	48 89 e5             	mov    %rsp,%rbp
  8041b6:	48 83 ec 20          	sub    $0x20,%rsp
  8041ba:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8041bd:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8041c0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8041c3:	89 c7                	mov    %eax,%edi
  8041c5:	48 b8 ff 3f 80 00 00 	movabs $0x803fff,%rax
  8041cc:	00 00 00 
  8041cf:	ff d0                	callq  *%rax
  8041d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041d8:	79 05                	jns    8041df <shutdown+0x2d>
  8041da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041dd:	eb 16                	jmp    8041f5 <shutdown+0x43>
  8041df:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8041e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041e5:	89 d6                	mov    %edx,%esi
  8041e7:	89 c7                	mov    %eax,%edi
  8041e9:	48 b8 25 45 80 00 00 	movabs $0x804525,%rax
  8041f0:	00 00 00 
  8041f3:	ff d0                	callq  *%rax
  8041f5:	c9                   	leaveq 
  8041f6:	c3                   	retq   

00000000008041f7 <devsock_close>:
  8041f7:	55                   	push   %rbp
  8041f8:	48 89 e5             	mov    %rsp,%rbp
  8041fb:	48 83 ec 10          	sub    $0x10,%rsp
  8041ff:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804203:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804207:	48 89 c7             	mov    %rax,%rdi
  80420a:	48 b8 75 54 80 00 00 	movabs $0x805475,%rax
  804211:	00 00 00 
  804214:	ff d0                	callq  *%rax
  804216:	83 f8 01             	cmp    $0x1,%eax
  804219:	75 17                	jne    804232 <devsock_close+0x3b>
  80421b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80421f:	8b 40 0c             	mov    0xc(%rax),%eax
  804222:	89 c7                	mov    %eax,%edi
  804224:	48 b8 65 45 80 00 00 	movabs $0x804565,%rax
  80422b:	00 00 00 
  80422e:	ff d0                	callq  *%rax
  804230:	eb 05                	jmp    804237 <devsock_close+0x40>
  804232:	b8 00 00 00 00       	mov    $0x0,%eax
  804237:	c9                   	leaveq 
  804238:	c3                   	retq   

0000000000804239 <connect>:
  804239:	55                   	push   %rbp
  80423a:	48 89 e5             	mov    %rsp,%rbp
  80423d:	48 83 ec 20          	sub    $0x20,%rsp
  804241:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804244:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804248:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80424b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80424e:	89 c7                	mov    %eax,%edi
  804250:	48 b8 ff 3f 80 00 00 	movabs $0x803fff,%rax
  804257:	00 00 00 
  80425a:	ff d0                	callq  *%rax
  80425c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80425f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804263:	79 05                	jns    80426a <connect+0x31>
  804265:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804268:	eb 1b                	jmp    804285 <connect+0x4c>
  80426a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80426d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804271:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804274:	48 89 ce             	mov    %rcx,%rsi
  804277:	89 c7                	mov    %eax,%edi
  804279:	48 b8 92 45 80 00 00 	movabs $0x804592,%rax
  804280:	00 00 00 
  804283:	ff d0                	callq  *%rax
  804285:	c9                   	leaveq 
  804286:	c3                   	retq   

0000000000804287 <listen>:
  804287:	55                   	push   %rbp
  804288:	48 89 e5             	mov    %rsp,%rbp
  80428b:	48 83 ec 20          	sub    $0x20,%rsp
  80428f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804292:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804295:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804298:	89 c7                	mov    %eax,%edi
  80429a:	48 b8 ff 3f 80 00 00 	movabs $0x803fff,%rax
  8042a1:	00 00 00 
  8042a4:	ff d0                	callq  *%rax
  8042a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042ad:	79 05                	jns    8042b4 <listen+0x2d>
  8042af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042b2:	eb 16                	jmp    8042ca <listen+0x43>
  8042b4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8042b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042ba:	89 d6                	mov    %edx,%esi
  8042bc:	89 c7                	mov    %eax,%edi
  8042be:	48 b8 f6 45 80 00 00 	movabs $0x8045f6,%rax
  8042c5:	00 00 00 
  8042c8:	ff d0                	callq  *%rax
  8042ca:	c9                   	leaveq 
  8042cb:	c3                   	retq   

00000000008042cc <devsock_read>:
  8042cc:	55                   	push   %rbp
  8042cd:	48 89 e5             	mov    %rsp,%rbp
  8042d0:	48 83 ec 20          	sub    $0x20,%rsp
  8042d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8042d8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8042dc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8042e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042e4:	89 c2                	mov    %eax,%edx
  8042e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042ea:	8b 40 0c             	mov    0xc(%rax),%eax
  8042ed:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8042f1:	b9 00 00 00 00       	mov    $0x0,%ecx
  8042f6:	89 c7                	mov    %eax,%edi
  8042f8:	48 b8 36 46 80 00 00 	movabs $0x804636,%rax
  8042ff:	00 00 00 
  804302:	ff d0                	callq  *%rax
  804304:	c9                   	leaveq 
  804305:	c3                   	retq   

0000000000804306 <devsock_write>:
  804306:	55                   	push   %rbp
  804307:	48 89 e5             	mov    %rsp,%rbp
  80430a:	48 83 ec 20          	sub    $0x20,%rsp
  80430e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804312:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804316:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80431a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80431e:	89 c2                	mov    %eax,%edx
  804320:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804324:	8b 40 0c             	mov    0xc(%rax),%eax
  804327:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80432b:	b9 00 00 00 00       	mov    $0x0,%ecx
  804330:	89 c7                	mov    %eax,%edi
  804332:	48 b8 02 47 80 00 00 	movabs $0x804702,%rax
  804339:	00 00 00 
  80433c:	ff d0                	callq  *%rax
  80433e:	c9                   	leaveq 
  80433f:	c3                   	retq   

0000000000804340 <devsock_stat>:
  804340:	55                   	push   %rbp
  804341:	48 89 e5             	mov    %rsp,%rbp
  804344:	48 83 ec 10          	sub    $0x10,%rsp
  804348:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80434c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804350:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804354:	48 be f5 5d 80 00 00 	movabs $0x805df5,%rsi
  80435b:	00 00 00 
  80435e:	48 89 c7             	mov    %rax,%rdi
  804361:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  804368:	00 00 00 
  80436b:	ff d0                	callq  *%rax
  80436d:	b8 00 00 00 00       	mov    $0x0,%eax
  804372:	c9                   	leaveq 
  804373:	c3                   	retq   

0000000000804374 <socket>:
  804374:	55                   	push   %rbp
  804375:	48 89 e5             	mov    %rsp,%rbp
  804378:	48 83 ec 20          	sub    $0x20,%rsp
  80437c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80437f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804382:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  804385:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  804388:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80438b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80438e:	89 ce                	mov    %ecx,%esi
  804390:	89 c7                	mov    %eax,%edi
  804392:	48 b8 ba 47 80 00 00 	movabs $0x8047ba,%rax
  804399:	00 00 00 
  80439c:	ff d0                	callq  *%rax
  80439e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8043a1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8043a5:	79 05                	jns    8043ac <socket+0x38>
  8043a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043aa:	eb 11                	jmp    8043bd <socket+0x49>
  8043ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043af:	89 c7                	mov    %eax,%edi
  8043b1:	48 b8 56 40 80 00 00 	movabs $0x804056,%rax
  8043b8:	00 00 00 
  8043bb:	ff d0                	callq  *%rax
  8043bd:	c9                   	leaveq 
  8043be:	c3                   	retq   

00000000008043bf <nsipc>:
  8043bf:	55                   	push   %rbp
  8043c0:	48 89 e5             	mov    %rsp,%rbp
  8043c3:	48 83 ec 10          	sub    $0x10,%rsp
  8043c7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8043ca:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  8043d1:	00 00 00 
  8043d4:	8b 00                	mov    (%rax),%eax
  8043d6:	85 c0                	test   %eax,%eax
  8043d8:	75 1f                	jne    8043f9 <nsipc+0x3a>
  8043da:	bf 02 00 00 00       	mov    $0x2,%edi
  8043df:	48 b8 04 54 80 00 00 	movabs $0x805404,%rax
  8043e6:	00 00 00 
  8043e9:	ff d0                	callq  *%rax
  8043eb:	89 c2                	mov    %eax,%edx
  8043ed:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  8043f4:	00 00 00 
  8043f7:	89 10                	mov    %edx,(%rax)
  8043f9:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  804400:	00 00 00 
  804403:	8b 00                	mov    (%rax),%eax
  804405:	8b 75 fc             	mov    -0x4(%rbp),%esi
  804408:	b9 07 00 00 00       	mov    $0x7,%ecx
  80440d:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  804414:	00 00 00 
  804417:	89 c7                	mov    %eax,%edi
  804419:	48 b8 fa 52 80 00 00 	movabs $0x8052fa,%rax
  804420:	00 00 00 
  804423:	ff d0                	callq  *%rax
  804425:	ba 00 00 00 00       	mov    $0x0,%edx
  80442a:	be 00 00 00 00       	mov    $0x0,%esi
  80442f:	bf 00 00 00 00       	mov    $0x0,%edi
  804434:	48 b8 39 52 80 00 00 	movabs $0x805239,%rax
  80443b:	00 00 00 
  80443e:	ff d0                	callq  *%rax
  804440:	c9                   	leaveq 
  804441:	c3                   	retq   

0000000000804442 <nsipc_accept>:
  804442:	55                   	push   %rbp
  804443:	48 89 e5             	mov    %rsp,%rbp
  804446:	48 83 ec 30          	sub    $0x30,%rsp
  80444a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80444d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804451:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804455:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80445c:	00 00 00 
  80445f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804462:	89 10                	mov    %edx,(%rax)
  804464:	bf 01 00 00 00       	mov    $0x1,%edi
  804469:	48 b8 bf 43 80 00 00 	movabs $0x8043bf,%rax
  804470:	00 00 00 
  804473:	ff d0                	callq  *%rax
  804475:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804478:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80447c:	78 3e                	js     8044bc <nsipc_accept+0x7a>
  80447e:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804485:	00 00 00 
  804488:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80448c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804490:	8b 40 10             	mov    0x10(%rax),%eax
  804493:	89 c2                	mov    %eax,%edx
  804495:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  804499:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80449d:	48 89 ce             	mov    %rcx,%rsi
  8044a0:	48 89 c7             	mov    %rax,%rdi
  8044a3:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  8044aa:	00 00 00 
  8044ad:	ff d0                	callq  *%rax
  8044af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044b3:	8b 50 10             	mov    0x10(%rax),%edx
  8044b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044ba:	89 10                	mov    %edx,(%rax)
  8044bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044bf:	c9                   	leaveq 
  8044c0:	c3                   	retq   

00000000008044c1 <nsipc_bind>:
  8044c1:	55                   	push   %rbp
  8044c2:	48 89 e5             	mov    %rsp,%rbp
  8044c5:	48 83 ec 10          	sub    $0x10,%rsp
  8044c9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8044cc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8044d0:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8044d3:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8044da:	00 00 00 
  8044dd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8044e0:	89 10                	mov    %edx,(%rax)
  8044e2:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8044e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044e9:	48 89 c6             	mov    %rax,%rsi
  8044ec:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8044f3:	00 00 00 
  8044f6:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  8044fd:	00 00 00 
  804500:	ff d0                	callq  *%rax
  804502:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804509:	00 00 00 
  80450c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80450f:	89 50 14             	mov    %edx,0x14(%rax)
  804512:	bf 02 00 00 00       	mov    $0x2,%edi
  804517:	48 b8 bf 43 80 00 00 	movabs $0x8043bf,%rax
  80451e:	00 00 00 
  804521:	ff d0                	callq  *%rax
  804523:	c9                   	leaveq 
  804524:	c3                   	retq   

0000000000804525 <nsipc_shutdown>:
  804525:	55                   	push   %rbp
  804526:	48 89 e5             	mov    %rsp,%rbp
  804529:	48 83 ec 10          	sub    $0x10,%rsp
  80452d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804530:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804533:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80453a:	00 00 00 
  80453d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804540:	89 10                	mov    %edx,(%rax)
  804542:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804549:	00 00 00 
  80454c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80454f:	89 50 04             	mov    %edx,0x4(%rax)
  804552:	bf 03 00 00 00       	mov    $0x3,%edi
  804557:	48 b8 bf 43 80 00 00 	movabs $0x8043bf,%rax
  80455e:	00 00 00 
  804561:	ff d0                	callq  *%rax
  804563:	c9                   	leaveq 
  804564:	c3                   	retq   

0000000000804565 <nsipc_close>:
  804565:	55                   	push   %rbp
  804566:	48 89 e5             	mov    %rsp,%rbp
  804569:	48 83 ec 10          	sub    $0x10,%rsp
  80456d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804570:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804577:	00 00 00 
  80457a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80457d:	89 10                	mov    %edx,(%rax)
  80457f:	bf 04 00 00 00       	mov    $0x4,%edi
  804584:	48 b8 bf 43 80 00 00 	movabs $0x8043bf,%rax
  80458b:	00 00 00 
  80458e:	ff d0                	callq  *%rax
  804590:	c9                   	leaveq 
  804591:	c3                   	retq   

0000000000804592 <nsipc_connect>:
  804592:	55                   	push   %rbp
  804593:	48 89 e5             	mov    %rsp,%rbp
  804596:	48 83 ec 10          	sub    $0x10,%rsp
  80459a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80459d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8045a1:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8045a4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8045ab:	00 00 00 
  8045ae:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8045b1:	89 10                	mov    %edx,(%rax)
  8045b3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8045b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045ba:	48 89 c6             	mov    %rax,%rsi
  8045bd:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8045c4:	00 00 00 
  8045c7:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  8045ce:	00 00 00 
  8045d1:	ff d0                	callq  *%rax
  8045d3:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8045da:	00 00 00 
  8045dd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8045e0:	89 50 14             	mov    %edx,0x14(%rax)
  8045e3:	bf 05 00 00 00       	mov    $0x5,%edi
  8045e8:	48 b8 bf 43 80 00 00 	movabs $0x8043bf,%rax
  8045ef:	00 00 00 
  8045f2:	ff d0                	callq  *%rax
  8045f4:	c9                   	leaveq 
  8045f5:	c3                   	retq   

00000000008045f6 <nsipc_listen>:
  8045f6:	55                   	push   %rbp
  8045f7:	48 89 e5             	mov    %rsp,%rbp
  8045fa:	48 83 ec 10          	sub    $0x10,%rsp
  8045fe:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804601:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804604:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80460b:	00 00 00 
  80460e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804611:	89 10                	mov    %edx,(%rax)
  804613:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80461a:	00 00 00 
  80461d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804620:	89 50 04             	mov    %edx,0x4(%rax)
  804623:	bf 06 00 00 00       	mov    $0x6,%edi
  804628:	48 b8 bf 43 80 00 00 	movabs $0x8043bf,%rax
  80462f:	00 00 00 
  804632:	ff d0                	callq  *%rax
  804634:	c9                   	leaveq 
  804635:	c3                   	retq   

0000000000804636 <nsipc_recv>:
  804636:	55                   	push   %rbp
  804637:	48 89 e5             	mov    %rsp,%rbp
  80463a:	48 83 ec 30          	sub    $0x30,%rsp
  80463e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804641:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804645:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804648:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80464b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804652:	00 00 00 
  804655:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804658:	89 10                	mov    %edx,(%rax)
  80465a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804661:	00 00 00 
  804664:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804667:	89 50 04             	mov    %edx,0x4(%rax)
  80466a:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804671:	00 00 00 
  804674:	8b 55 dc             	mov    -0x24(%rbp),%edx
  804677:	89 50 08             	mov    %edx,0x8(%rax)
  80467a:	bf 07 00 00 00       	mov    $0x7,%edi
  80467f:	48 b8 bf 43 80 00 00 	movabs $0x8043bf,%rax
  804686:	00 00 00 
  804689:	ff d0                	callq  *%rax
  80468b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80468e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804692:	78 69                	js     8046fd <nsipc_recv+0xc7>
  804694:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  80469b:	7f 08                	jg     8046a5 <nsipc_recv+0x6f>
  80469d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046a0:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8046a3:	7e 35                	jle    8046da <nsipc_recv+0xa4>
  8046a5:	48 b9 fc 5d 80 00 00 	movabs $0x805dfc,%rcx
  8046ac:	00 00 00 
  8046af:	48 ba 11 5e 80 00 00 	movabs $0x805e11,%rdx
  8046b6:	00 00 00 
  8046b9:	be 62 00 00 00       	mov    $0x62,%esi
  8046be:	48 bf 26 5e 80 00 00 	movabs $0x805e26,%rdi
  8046c5:	00 00 00 
  8046c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8046cd:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  8046d4:	00 00 00 
  8046d7:	41 ff d0             	callq  *%r8
  8046da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046dd:	48 63 d0             	movslq %eax,%rdx
  8046e0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046e4:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  8046eb:	00 00 00 
  8046ee:	48 89 c7             	mov    %rax,%rdi
  8046f1:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  8046f8:	00 00 00 
  8046fb:	ff d0                	callq  *%rax
  8046fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804700:	c9                   	leaveq 
  804701:	c3                   	retq   

0000000000804702 <nsipc_send>:
  804702:	55                   	push   %rbp
  804703:	48 89 e5             	mov    %rsp,%rbp
  804706:	48 83 ec 20          	sub    $0x20,%rsp
  80470a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80470d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804711:	89 55 f8             	mov    %edx,-0x8(%rbp)
  804714:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804717:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80471e:	00 00 00 
  804721:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804724:	89 10                	mov    %edx,(%rax)
  804726:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  80472d:	7e 35                	jle    804764 <nsipc_send+0x62>
  80472f:	48 b9 35 5e 80 00 00 	movabs $0x805e35,%rcx
  804736:	00 00 00 
  804739:	48 ba 11 5e 80 00 00 	movabs $0x805e11,%rdx
  804740:	00 00 00 
  804743:	be 6d 00 00 00       	mov    $0x6d,%esi
  804748:	48 bf 26 5e 80 00 00 	movabs $0x805e26,%rdi
  80474f:	00 00 00 
  804752:	b8 00 00 00 00       	mov    $0x0,%eax
  804757:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  80475e:	00 00 00 
  804761:	41 ff d0             	callq  *%r8
  804764:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804767:	48 63 d0             	movslq %eax,%rdx
  80476a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80476e:	48 89 c6             	mov    %rax,%rsi
  804771:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  804778:	00 00 00 
  80477b:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  804782:	00 00 00 
  804785:	ff d0                	callq  *%rax
  804787:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80478e:	00 00 00 
  804791:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804794:	89 50 04             	mov    %edx,0x4(%rax)
  804797:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80479e:	00 00 00 
  8047a1:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8047a4:	89 50 08             	mov    %edx,0x8(%rax)
  8047a7:	bf 08 00 00 00       	mov    $0x8,%edi
  8047ac:	48 b8 bf 43 80 00 00 	movabs $0x8043bf,%rax
  8047b3:	00 00 00 
  8047b6:	ff d0                	callq  *%rax
  8047b8:	c9                   	leaveq 
  8047b9:	c3                   	retq   

00000000008047ba <nsipc_socket>:
  8047ba:	55                   	push   %rbp
  8047bb:	48 89 e5             	mov    %rsp,%rbp
  8047be:	48 83 ec 10          	sub    $0x10,%rsp
  8047c2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8047c5:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8047c8:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8047cb:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8047d2:	00 00 00 
  8047d5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8047d8:	89 10                	mov    %edx,(%rax)
  8047da:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8047e1:	00 00 00 
  8047e4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8047e7:	89 50 04             	mov    %edx,0x4(%rax)
  8047ea:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8047f1:	00 00 00 
  8047f4:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8047f7:	89 50 08             	mov    %edx,0x8(%rax)
  8047fa:	bf 09 00 00 00       	mov    $0x9,%edi
  8047ff:	48 b8 bf 43 80 00 00 	movabs $0x8043bf,%rax
  804806:	00 00 00 
  804809:	ff d0                	callq  *%rax
  80480b:	c9                   	leaveq 
  80480c:	c3                   	retq   

000000000080480d <pipe>:
  80480d:	55                   	push   %rbp
  80480e:	48 89 e5             	mov    %rsp,%rbp
  804811:	53                   	push   %rbx
  804812:	48 83 ec 38          	sub    $0x38,%rsp
  804816:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80481a:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80481e:	48 89 c7             	mov    %rax,%rdi
  804821:	48 b8 ae 24 80 00 00 	movabs $0x8024ae,%rax
  804828:	00 00 00 
  80482b:	ff d0                	callq  *%rax
  80482d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804830:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804834:	0f 88 bf 01 00 00    	js     8049f9 <pipe+0x1ec>
  80483a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80483e:	ba 07 04 00 00       	mov    $0x407,%edx
  804843:	48 89 c6             	mov    %rax,%rsi
  804846:	bf 00 00 00 00       	mov    $0x0,%edi
  80484b:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  804852:	00 00 00 
  804855:	ff d0                	callq  *%rax
  804857:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80485a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80485e:	0f 88 95 01 00 00    	js     8049f9 <pipe+0x1ec>
  804864:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804868:	48 89 c7             	mov    %rax,%rdi
  80486b:	48 b8 ae 24 80 00 00 	movabs $0x8024ae,%rax
  804872:	00 00 00 
  804875:	ff d0                	callq  *%rax
  804877:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80487a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80487e:	0f 88 5d 01 00 00    	js     8049e1 <pipe+0x1d4>
  804884:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804888:	ba 07 04 00 00       	mov    $0x407,%edx
  80488d:	48 89 c6             	mov    %rax,%rsi
  804890:	bf 00 00 00 00       	mov    $0x0,%edi
  804895:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  80489c:	00 00 00 
  80489f:	ff d0                	callq  *%rax
  8048a1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8048a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8048a8:	0f 88 33 01 00 00    	js     8049e1 <pipe+0x1d4>
  8048ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8048b2:	48 89 c7             	mov    %rax,%rdi
  8048b5:	48 b8 83 24 80 00 00 	movabs $0x802483,%rax
  8048bc:	00 00 00 
  8048bf:	ff d0                	callq  *%rax
  8048c1:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8048c5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8048c9:	ba 07 04 00 00       	mov    $0x407,%edx
  8048ce:	48 89 c6             	mov    %rax,%rsi
  8048d1:	bf 00 00 00 00       	mov    $0x0,%edi
  8048d6:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  8048dd:	00 00 00 
  8048e0:	ff d0                	callq  *%rax
  8048e2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8048e5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8048e9:	0f 88 d9 00 00 00    	js     8049c8 <pipe+0x1bb>
  8048ef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8048f3:	48 89 c7             	mov    %rax,%rdi
  8048f6:	48 b8 83 24 80 00 00 	movabs $0x802483,%rax
  8048fd:	00 00 00 
  804900:	ff d0                	callq  *%rax
  804902:	48 89 c2             	mov    %rax,%rdx
  804905:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804909:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  80490f:	48 89 d1             	mov    %rdx,%rcx
  804912:	ba 00 00 00 00       	mov    $0x0,%edx
  804917:	48 89 c6             	mov    %rax,%rsi
  80491a:	bf 00 00 00 00       	mov    $0x0,%edi
  80491f:	48 b8 9e 1a 80 00 00 	movabs $0x801a9e,%rax
  804926:	00 00 00 
  804929:	ff d0                	callq  *%rax
  80492b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80492e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804932:	78 79                	js     8049ad <pipe+0x1a0>
  804934:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804938:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  80493f:	00 00 00 
  804942:	8b 12                	mov    (%rdx),%edx
  804944:	89 10                	mov    %edx,(%rax)
  804946:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80494a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804951:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804955:	48 ba e0 80 80 00 00 	movabs $0x8080e0,%rdx
  80495c:	00 00 00 
  80495f:	8b 12                	mov    (%rdx),%edx
  804961:	89 10                	mov    %edx,(%rax)
  804963:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804967:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  80496e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804972:	48 89 c7             	mov    %rax,%rdi
  804975:	48 b8 60 24 80 00 00 	movabs $0x802460,%rax
  80497c:	00 00 00 
  80497f:	ff d0                	callq  *%rax
  804981:	89 c2                	mov    %eax,%edx
  804983:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804987:	89 10                	mov    %edx,(%rax)
  804989:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80498d:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804991:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804995:	48 89 c7             	mov    %rax,%rdi
  804998:	48 b8 60 24 80 00 00 	movabs $0x802460,%rax
  80499f:	00 00 00 
  8049a2:	ff d0                	callq  *%rax
  8049a4:	89 03                	mov    %eax,(%rbx)
  8049a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8049ab:	eb 4f                	jmp    8049fc <pipe+0x1ef>
  8049ad:	90                   	nop
  8049ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8049b2:	48 89 c6             	mov    %rax,%rsi
  8049b5:	bf 00 00 00 00       	mov    $0x0,%edi
  8049ba:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  8049c1:	00 00 00 
  8049c4:	ff d0                	callq  *%rax
  8049c6:	eb 01                	jmp    8049c9 <pipe+0x1bc>
  8049c8:	90                   	nop
  8049c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8049cd:	48 89 c6             	mov    %rax,%rsi
  8049d0:	bf 00 00 00 00       	mov    $0x0,%edi
  8049d5:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  8049dc:	00 00 00 
  8049df:	ff d0                	callq  *%rax
  8049e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8049e5:	48 89 c6             	mov    %rax,%rsi
  8049e8:	bf 00 00 00 00       	mov    $0x0,%edi
  8049ed:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  8049f4:	00 00 00 
  8049f7:	ff d0                	callq  *%rax
  8049f9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8049fc:	48 83 c4 38          	add    $0x38,%rsp
  804a00:	5b                   	pop    %rbx
  804a01:	5d                   	pop    %rbp
  804a02:	c3                   	retq   

0000000000804a03 <_pipeisclosed>:
  804a03:	55                   	push   %rbp
  804a04:	48 89 e5             	mov    %rsp,%rbp
  804a07:	53                   	push   %rbx
  804a08:	48 83 ec 28          	sub    $0x28,%rsp
  804a0c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804a10:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804a14:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804a1b:	00 00 00 
  804a1e:	48 8b 00             	mov    (%rax),%rax
  804a21:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804a27:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804a2a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a2e:	48 89 c7             	mov    %rax,%rdi
  804a31:	48 b8 75 54 80 00 00 	movabs $0x805475,%rax
  804a38:	00 00 00 
  804a3b:	ff d0                	callq  *%rax
  804a3d:	89 c3                	mov    %eax,%ebx
  804a3f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804a43:	48 89 c7             	mov    %rax,%rdi
  804a46:	48 b8 75 54 80 00 00 	movabs $0x805475,%rax
  804a4d:	00 00 00 
  804a50:	ff d0                	callq  *%rax
  804a52:	39 c3                	cmp    %eax,%ebx
  804a54:	0f 94 c0             	sete   %al
  804a57:	0f b6 c0             	movzbl %al,%eax
  804a5a:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804a5d:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804a64:	00 00 00 
  804a67:	48 8b 00             	mov    (%rax),%rax
  804a6a:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804a70:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804a73:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804a76:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804a79:	75 05                	jne    804a80 <_pipeisclosed+0x7d>
  804a7b:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804a7e:	eb 4a                	jmp    804aca <_pipeisclosed+0xc7>
  804a80:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804a83:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804a86:	74 8c                	je     804a14 <_pipeisclosed+0x11>
  804a88:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804a8c:	75 86                	jne    804a14 <_pipeisclosed+0x11>
  804a8e:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  804a95:	00 00 00 
  804a98:	48 8b 00             	mov    (%rax),%rax
  804a9b:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804aa1:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804aa4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804aa7:	89 c6                	mov    %eax,%esi
  804aa9:	48 bf 46 5e 80 00 00 	movabs $0x805e46,%rdi
  804ab0:	00 00 00 
  804ab3:	b8 00 00 00 00       	mov    $0x0,%eax
  804ab8:	49 b8 8c 05 80 00 00 	movabs $0x80058c,%r8
  804abf:	00 00 00 
  804ac2:	41 ff d0             	callq  *%r8
  804ac5:	e9 4a ff ff ff       	jmpq   804a14 <_pipeisclosed+0x11>
  804aca:	48 83 c4 28          	add    $0x28,%rsp
  804ace:	5b                   	pop    %rbx
  804acf:	5d                   	pop    %rbp
  804ad0:	c3                   	retq   

0000000000804ad1 <pipeisclosed>:
  804ad1:	55                   	push   %rbp
  804ad2:	48 89 e5             	mov    %rsp,%rbp
  804ad5:	48 83 ec 30          	sub    $0x30,%rsp
  804ad9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804adc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804ae0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  804ae3:	48 89 d6             	mov    %rdx,%rsi
  804ae6:	89 c7                	mov    %eax,%edi
  804ae8:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  804aef:	00 00 00 
  804af2:	ff d0                	callq  *%rax
  804af4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804af7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804afb:	79 05                	jns    804b02 <pipeisclosed+0x31>
  804afd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b00:	eb 31                	jmp    804b33 <pipeisclosed+0x62>
  804b02:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b06:	48 89 c7             	mov    %rax,%rdi
  804b09:	48 b8 83 24 80 00 00 	movabs $0x802483,%rax
  804b10:	00 00 00 
  804b13:	ff d0                	callq  *%rax
  804b15:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804b19:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804b1d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804b21:	48 89 d6             	mov    %rdx,%rsi
  804b24:	48 89 c7             	mov    %rax,%rdi
  804b27:	48 b8 03 4a 80 00 00 	movabs $0x804a03,%rax
  804b2e:	00 00 00 
  804b31:	ff d0                	callq  *%rax
  804b33:	c9                   	leaveq 
  804b34:	c3                   	retq   

0000000000804b35 <devpipe_read>:
  804b35:	55                   	push   %rbp
  804b36:	48 89 e5             	mov    %rsp,%rbp
  804b39:	48 83 ec 40          	sub    $0x40,%rsp
  804b3d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804b41:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804b45:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804b49:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b4d:	48 89 c7             	mov    %rax,%rdi
  804b50:	48 b8 83 24 80 00 00 	movabs $0x802483,%rax
  804b57:	00 00 00 
  804b5a:	ff d0                	callq  *%rax
  804b5c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804b60:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804b64:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804b68:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804b6f:	00 
  804b70:	e9 90 00 00 00       	jmpq   804c05 <devpipe_read+0xd0>
  804b75:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804b7a:	74 09                	je     804b85 <devpipe_read+0x50>
  804b7c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b80:	e9 8e 00 00 00       	jmpq   804c13 <devpipe_read+0xde>
  804b85:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804b89:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804b8d:	48 89 d6             	mov    %rdx,%rsi
  804b90:	48 89 c7             	mov    %rax,%rdi
  804b93:	48 b8 03 4a 80 00 00 	movabs $0x804a03,%rax
  804b9a:	00 00 00 
  804b9d:	ff d0                	callq  *%rax
  804b9f:	85 c0                	test   %eax,%eax
  804ba1:	74 07                	je     804baa <devpipe_read+0x75>
  804ba3:	b8 00 00 00 00       	mov    $0x0,%eax
  804ba8:	eb 69                	jmp    804c13 <devpipe_read+0xde>
  804baa:	48 b8 0f 1a 80 00 00 	movabs $0x801a0f,%rax
  804bb1:	00 00 00 
  804bb4:	ff d0                	callq  *%rax
  804bb6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804bba:	8b 10                	mov    (%rax),%edx
  804bbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804bc0:	8b 40 04             	mov    0x4(%rax),%eax
  804bc3:	39 c2                	cmp    %eax,%edx
  804bc5:	74 ae                	je     804b75 <devpipe_read+0x40>
  804bc7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804bcb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804bcf:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  804bd3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804bd7:	8b 00                	mov    (%rax),%eax
  804bd9:	99                   	cltd   
  804bda:	c1 ea 1b             	shr    $0x1b,%edx
  804bdd:	01 d0                	add    %edx,%eax
  804bdf:	83 e0 1f             	and    $0x1f,%eax
  804be2:	29 d0                	sub    %edx,%eax
  804be4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804be8:	48 98                	cltq   
  804bea:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804bef:	88 01                	mov    %al,(%rcx)
  804bf1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804bf5:	8b 00                	mov    (%rax),%eax
  804bf7:	8d 50 01             	lea    0x1(%rax),%edx
  804bfa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804bfe:	89 10                	mov    %edx,(%rax)
  804c00:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804c05:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c09:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804c0d:	72 a7                	jb     804bb6 <devpipe_read+0x81>
  804c0f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c13:	c9                   	leaveq 
  804c14:	c3                   	retq   

0000000000804c15 <devpipe_write>:
  804c15:	55                   	push   %rbp
  804c16:	48 89 e5             	mov    %rsp,%rbp
  804c19:	48 83 ec 40          	sub    $0x40,%rsp
  804c1d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804c21:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804c25:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804c29:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804c2d:	48 89 c7             	mov    %rax,%rdi
  804c30:	48 b8 83 24 80 00 00 	movabs $0x802483,%rax
  804c37:	00 00 00 
  804c3a:	ff d0                	callq  *%rax
  804c3c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804c40:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804c44:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804c48:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804c4f:	00 
  804c50:	e9 8f 00 00 00       	jmpq   804ce4 <devpipe_write+0xcf>
  804c55:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804c59:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804c5d:	48 89 d6             	mov    %rdx,%rsi
  804c60:	48 89 c7             	mov    %rax,%rdi
  804c63:	48 b8 03 4a 80 00 00 	movabs $0x804a03,%rax
  804c6a:	00 00 00 
  804c6d:	ff d0                	callq  *%rax
  804c6f:	85 c0                	test   %eax,%eax
  804c71:	74 07                	je     804c7a <devpipe_write+0x65>
  804c73:	b8 00 00 00 00       	mov    $0x0,%eax
  804c78:	eb 78                	jmp    804cf2 <devpipe_write+0xdd>
  804c7a:	48 b8 0f 1a 80 00 00 	movabs $0x801a0f,%rax
  804c81:	00 00 00 
  804c84:	ff d0                	callq  *%rax
  804c86:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c8a:	8b 40 04             	mov    0x4(%rax),%eax
  804c8d:	48 63 d0             	movslq %eax,%rdx
  804c90:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804c94:	8b 00                	mov    (%rax),%eax
  804c96:	48 98                	cltq   
  804c98:	48 83 c0 20          	add    $0x20,%rax
  804c9c:	48 39 c2             	cmp    %rax,%rdx
  804c9f:	73 b4                	jae    804c55 <devpipe_write+0x40>
  804ca1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ca5:	8b 40 04             	mov    0x4(%rax),%eax
  804ca8:	99                   	cltd   
  804ca9:	c1 ea 1b             	shr    $0x1b,%edx
  804cac:	01 d0                	add    %edx,%eax
  804cae:	83 e0 1f             	and    $0x1f,%eax
  804cb1:	29 d0                	sub    %edx,%eax
  804cb3:	89 c6                	mov    %eax,%esi
  804cb5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804cb9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804cbd:	48 01 d0             	add    %rdx,%rax
  804cc0:	0f b6 08             	movzbl (%rax),%ecx
  804cc3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804cc7:	48 63 c6             	movslq %esi,%rax
  804cca:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804cce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cd2:	8b 40 04             	mov    0x4(%rax),%eax
  804cd5:	8d 50 01             	lea    0x1(%rax),%edx
  804cd8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804cdc:	89 50 04             	mov    %edx,0x4(%rax)
  804cdf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804ce4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ce8:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804cec:	72 98                	jb     804c86 <devpipe_write+0x71>
  804cee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804cf2:	c9                   	leaveq 
  804cf3:	c3                   	retq   

0000000000804cf4 <devpipe_stat>:
  804cf4:	55                   	push   %rbp
  804cf5:	48 89 e5             	mov    %rsp,%rbp
  804cf8:	48 83 ec 20          	sub    $0x20,%rsp
  804cfc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804d00:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804d04:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804d08:	48 89 c7             	mov    %rax,%rdi
  804d0b:	48 b8 83 24 80 00 00 	movabs $0x802483,%rax
  804d12:	00 00 00 
  804d15:	ff d0                	callq  *%rax
  804d17:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804d1b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804d1f:	48 be 59 5e 80 00 00 	movabs $0x805e59,%rsi
  804d26:	00 00 00 
  804d29:	48 89 c7             	mov    %rax,%rdi
  804d2c:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  804d33:	00 00 00 
  804d36:	ff d0                	callq  *%rax
  804d38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d3c:	8b 50 04             	mov    0x4(%rax),%edx
  804d3f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d43:	8b 00                	mov    (%rax),%eax
  804d45:	29 c2                	sub    %eax,%edx
  804d47:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804d4b:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804d51:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804d55:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804d5c:	00 00 00 
  804d5f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804d63:	48 b9 e0 80 80 00 00 	movabs $0x8080e0,%rcx
  804d6a:	00 00 00 
  804d6d:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804d74:	b8 00 00 00 00       	mov    $0x0,%eax
  804d79:	c9                   	leaveq 
  804d7a:	c3                   	retq   

0000000000804d7b <devpipe_close>:
  804d7b:	55                   	push   %rbp
  804d7c:	48 89 e5             	mov    %rsp,%rbp
  804d7f:	48 83 ec 10          	sub    $0x10,%rsp
  804d83:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804d87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804d8b:	48 89 c6             	mov    %rax,%rsi
  804d8e:	bf 00 00 00 00       	mov    $0x0,%edi
  804d93:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  804d9a:	00 00 00 
  804d9d:	ff d0                	callq  *%rax
  804d9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804da3:	48 89 c7             	mov    %rax,%rdi
  804da6:	48 b8 83 24 80 00 00 	movabs $0x802483,%rax
  804dad:	00 00 00 
  804db0:	ff d0                	callq  *%rax
  804db2:	48 89 c6             	mov    %rax,%rsi
  804db5:	bf 00 00 00 00       	mov    $0x0,%edi
  804dba:	48 b8 fe 1a 80 00 00 	movabs $0x801afe,%rax
  804dc1:	00 00 00 
  804dc4:	ff d0                	callq  *%rax
  804dc6:	c9                   	leaveq 
  804dc7:	c3                   	retq   

0000000000804dc8 <wait>:
  804dc8:	55                   	push   %rbp
  804dc9:	48 89 e5             	mov    %rsp,%rbp
  804dcc:	48 83 ec 20          	sub    $0x20,%rsp
  804dd0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804dd3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804dd7:	75 35                	jne    804e0e <wait+0x46>
  804dd9:	48 b9 60 5e 80 00 00 	movabs $0x805e60,%rcx
  804de0:	00 00 00 
  804de3:	48 ba 6b 5e 80 00 00 	movabs $0x805e6b,%rdx
  804dea:	00 00 00 
  804ded:	be 0a 00 00 00       	mov    $0xa,%esi
  804df2:	48 bf 80 5e 80 00 00 	movabs $0x805e80,%rdi
  804df9:	00 00 00 
  804dfc:	b8 00 00 00 00       	mov    $0x0,%eax
  804e01:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  804e08:	00 00 00 
  804e0b:	41 ff d0             	callq  *%r8
  804e0e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804e11:	25 ff 03 00 00       	and    $0x3ff,%eax
  804e16:	48 98                	cltq   
  804e18:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  804e1f:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804e26:	00 00 00 
  804e29:	48 01 d0             	add    %rdx,%rax
  804e2c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804e30:	eb 0c                	jmp    804e3e <wait+0x76>
  804e32:	48 b8 0f 1a 80 00 00 	movabs $0x801a0f,%rax
  804e39:	00 00 00 
  804e3c:	ff d0                	callq  *%rax
  804e3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804e42:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804e48:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804e4b:	75 0e                	jne    804e5b <wait+0x93>
  804e4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804e51:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  804e57:	85 c0                	test   %eax,%eax
  804e59:	75 d7                	jne    804e32 <wait+0x6a>
  804e5b:	90                   	nop
  804e5c:	c9                   	leaveq 
  804e5d:	c3                   	retq   

0000000000804e5e <cputchar>:
  804e5e:	55                   	push   %rbp
  804e5f:	48 89 e5             	mov    %rsp,%rbp
  804e62:	48 83 ec 20          	sub    $0x20,%rsp
  804e66:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804e69:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804e6c:	88 45 ff             	mov    %al,-0x1(%rbp)
  804e6f:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804e73:	be 01 00 00 00       	mov    $0x1,%esi
  804e78:	48 89 c7             	mov    %rax,%rdi
  804e7b:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  804e82:	00 00 00 
  804e85:	ff d0                	callq  *%rax
  804e87:	90                   	nop
  804e88:	c9                   	leaveq 
  804e89:	c3                   	retq   

0000000000804e8a <getchar>:
  804e8a:	55                   	push   %rbp
  804e8b:	48 89 e5             	mov    %rsp,%rbp
  804e8e:	48 83 ec 10          	sub    $0x10,%rsp
  804e92:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804e96:	ba 01 00 00 00       	mov    $0x1,%edx
  804e9b:	48 89 c6             	mov    %rax,%rsi
  804e9e:	bf 00 00 00 00       	mov    $0x0,%edi
  804ea3:	48 b8 7b 29 80 00 00 	movabs $0x80297b,%rax
  804eaa:	00 00 00 
  804ead:	ff d0                	callq  *%rax
  804eaf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804eb2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804eb6:	79 05                	jns    804ebd <getchar+0x33>
  804eb8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ebb:	eb 14                	jmp    804ed1 <getchar+0x47>
  804ebd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804ec1:	7f 07                	jg     804eca <getchar+0x40>
  804ec3:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804ec8:	eb 07                	jmp    804ed1 <getchar+0x47>
  804eca:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  804ece:	0f b6 c0             	movzbl %al,%eax
  804ed1:	c9                   	leaveq 
  804ed2:	c3                   	retq   

0000000000804ed3 <iscons>:
  804ed3:	55                   	push   %rbp
  804ed4:	48 89 e5             	mov    %rsp,%rbp
  804ed7:	48 83 ec 20          	sub    $0x20,%rsp
  804edb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804ede:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804ee2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804ee5:	48 89 d6             	mov    %rdx,%rsi
  804ee8:	89 c7                	mov    %eax,%edi
  804eea:	48 b8 46 25 80 00 00 	movabs $0x802546,%rax
  804ef1:	00 00 00 
  804ef4:	ff d0                	callq  *%rax
  804ef6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804ef9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804efd:	79 05                	jns    804f04 <iscons+0x31>
  804eff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f02:	eb 1a                	jmp    804f1e <iscons+0x4b>
  804f04:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804f08:	8b 10                	mov    (%rax),%edx
  804f0a:	48 b8 20 81 80 00 00 	movabs $0x808120,%rax
  804f11:	00 00 00 
  804f14:	8b 00                	mov    (%rax),%eax
  804f16:	39 c2                	cmp    %eax,%edx
  804f18:	0f 94 c0             	sete   %al
  804f1b:	0f b6 c0             	movzbl %al,%eax
  804f1e:	c9                   	leaveq 
  804f1f:	c3                   	retq   

0000000000804f20 <opencons>:
  804f20:	55                   	push   %rbp
  804f21:	48 89 e5             	mov    %rsp,%rbp
  804f24:	48 83 ec 10          	sub    $0x10,%rsp
  804f28:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804f2c:	48 89 c7             	mov    %rax,%rdi
  804f2f:	48 b8 ae 24 80 00 00 	movabs $0x8024ae,%rax
  804f36:	00 00 00 
  804f39:	ff d0                	callq  *%rax
  804f3b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804f3e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804f42:	79 05                	jns    804f49 <opencons+0x29>
  804f44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f47:	eb 5b                	jmp    804fa4 <opencons+0x84>
  804f49:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804f4d:	ba 07 04 00 00       	mov    $0x407,%edx
  804f52:	48 89 c6             	mov    %rax,%rsi
  804f55:	bf 00 00 00 00       	mov    $0x0,%edi
  804f5a:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  804f61:	00 00 00 
  804f64:	ff d0                	callq  *%rax
  804f66:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804f69:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804f6d:	79 05                	jns    804f74 <opencons+0x54>
  804f6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804f72:	eb 30                	jmp    804fa4 <opencons+0x84>
  804f74:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804f78:	48 ba 20 81 80 00 00 	movabs $0x808120,%rdx
  804f7f:	00 00 00 
  804f82:	8b 12                	mov    (%rdx),%edx
  804f84:	89 10                	mov    %edx,(%rax)
  804f86:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804f8a:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804f91:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804f95:	48 89 c7             	mov    %rax,%rdi
  804f98:	48 b8 60 24 80 00 00 	movabs $0x802460,%rax
  804f9f:	00 00 00 
  804fa2:	ff d0                	callq  *%rax
  804fa4:	c9                   	leaveq 
  804fa5:	c3                   	retq   

0000000000804fa6 <devcons_read>:
  804fa6:	55                   	push   %rbp
  804fa7:	48 89 e5             	mov    %rsp,%rbp
  804faa:	48 83 ec 30          	sub    $0x30,%rsp
  804fae:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804fb2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804fb6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804fba:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804fbf:	75 13                	jne    804fd4 <devcons_read+0x2e>
  804fc1:	b8 00 00 00 00       	mov    $0x0,%eax
  804fc6:	eb 49                	jmp    805011 <devcons_read+0x6b>
  804fc8:	48 b8 0f 1a 80 00 00 	movabs $0x801a0f,%rax
  804fcf:	00 00 00 
  804fd2:	ff d0                	callq  *%rax
  804fd4:	48 b8 51 19 80 00 00 	movabs $0x801951,%rax
  804fdb:	00 00 00 
  804fde:	ff d0                	callq  *%rax
  804fe0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804fe3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804fe7:	74 df                	je     804fc8 <devcons_read+0x22>
  804fe9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804fed:	79 05                	jns    804ff4 <devcons_read+0x4e>
  804fef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804ff2:	eb 1d                	jmp    805011 <devcons_read+0x6b>
  804ff4:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804ff8:	75 07                	jne    805001 <devcons_read+0x5b>
  804ffa:	b8 00 00 00 00       	mov    $0x0,%eax
  804fff:	eb 10                	jmp    805011 <devcons_read+0x6b>
  805001:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805004:	89 c2                	mov    %eax,%edx
  805006:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80500a:	88 10                	mov    %dl,(%rax)
  80500c:	b8 01 00 00 00       	mov    $0x1,%eax
  805011:	c9                   	leaveq 
  805012:	c3                   	retq   

0000000000805013 <devcons_write>:
  805013:	55                   	push   %rbp
  805014:	48 89 e5             	mov    %rsp,%rbp
  805017:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80501e:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  805025:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  80502c:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  805033:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80503a:	eb 76                	jmp    8050b2 <devcons_write+0x9f>
  80503c:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  805043:	89 c2                	mov    %eax,%edx
  805045:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805048:	29 c2                	sub    %eax,%edx
  80504a:	89 d0                	mov    %edx,%eax
  80504c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80504f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805052:	83 f8 7f             	cmp    $0x7f,%eax
  805055:	76 07                	jbe    80505e <devcons_write+0x4b>
  805057:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80505e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805061:	48 63 d0             	movslq %eax,%rdx
  805064:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805067:	48 63 c8             	movslq %eax,%rcx
  80506a:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  805071:	48 01 c1             	add    %rax,%rcx
  805074:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80507b:	48 89 ce             	mov    %rcx,%rsi
  80507e:	48 89 c7             	mov    %rax,%rdi
  805081:	48 b8 41 14 80 00 00 	movabs $0x801441,%rax
  805088:	00 00 00 
  80508b:	ff d0                	callq  *%rax
  80508d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  805090:	48 63 d0             	movslq %eax,%rdx
  805093:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80509a:	48 89 d6             	mov    %rdx,%rsi
  80509d:	48 89 c7             	mov    %rax,%rdi
  8050a0:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  8050a7:	00 00 00 
  8050aa:	ff d0                	callq  *%rax
  8050ac:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8050af:	01 45 fc             	add    %eax,-0x4(%rbp)
  8050b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8050b5:	48 98                	cltq   
  8050b7:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8050be:	0f 82 78 ff ff ff    	jb     80503c <devcons_write+0x29>
  8050c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8050c7:	c9                   	leaveq 
  8050c8:	c3                   	retq   

00000000008050c9 <devcons_close>:
  8050c9:	55                   	push   %rbp
  8050ca:	48 89 e5             	mov    %rsp,%rbp
  8050cd:	48 83 ec 08          	sub    $0x8,%rsp
  8050d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8050d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8050da:	c9                   	leaveq 
  8050db:	c3                   	retq   

00000000008050dc <devcons_stat>:
  8050dc:	55                   	push   %rbp
  8050dd:	48 89 e5             	mov    %rsp,%rbp
  8050e0:	48 83 ec 10          	sub    $0x10,%rsp
  8050e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8050e8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8050ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8050f0:	48 be 93 5e 80 00 00 	movabs $0x805e93,%rsi
  8050f7:	00 00 00 
  8050fa:	48 89 c7             	mov    %rax,%rdi
  8050fd:	48 b8 1c 11 80 00 00 	movabs $0x80111c,%rax
  805104:	00 00 00 
  805107:	ff d0                	callq  *%rax
  805109:	b8 00 00 00 00       	mov    $0x0,%eax
  80510e:	c9                   	leaveq 
  80510f:	c3                   	retq   

0000000000805110 <set_pgfault_handler>:
  805110:	55                   	push   %rbp
  805111:	48 89 e5             	mov    %rsp,%rbp
  805114:	48 83 ec 20          	sub    $0x20,%rsp
  805118:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80511c:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  805123:	00 00 00 
  805126:	48 8b 00             	mov    (%rax),%rax
  805129:	48 85 c0             	test   %rax,%rax
  80512c:	75 6f                	jne    80519d <set_pgfault_handler+0x8d>
  80512e:	ba 07 00 00 00       	mov    $0x7,%edx
  805133:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  805138:	bf 00 00 00 00       	mov    $0x0,%edi
  80513d:	48 b8 4c 1a 80 00 00 	movabs $0x801a4c,%rax
  805144:	00 00 00 
  805147:	ff d0                	callq  *%rax
  805149:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80514c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  805150:	79 30                	jns    805182 <set_pgfault_handler+0x72>
  805152:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805155:	89 c1                	mov    %eax,%ecx
  805157:	48 ba a0 5e 80 00 00 	movabs $0x805ea0,%rdx
  80515e:	00 00 00 
  805161:	be 22 00 00 00       	mov    $0x22,%esi
  805166:	48 bf bf 5e 80 00 00 	movabs $0x805ebf,%rdi
  80516d:	00 00 00 
  805170:	b8 00 00 00 00       	mov    $0x0,%eax
  805175:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  80517c:	00 00 00 
  80517f:	41 ff d0             	callq  *%r8
  805182:	48 be b1 51 80 00 00 	movabs $0x8051b1,%rsi
  805189:	00 00 00 
  80518c:	bf 00 00 00 00       	mov    $0x0,%edi
  805191:	48 b8 e3 1b 80 00 00 	movabs $0x801be3,%rax
  805198:	00 00 00 
  80519b:	ff d0                	callq  *%rax
  80519d:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8051a4:	00 00 00 
  8051a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8051ab:	48 89 10             	mov    %rdx,(%rax)
  8051ae:	90                   	nop
  8051af:	c9                   	leaveq 
  8051b0:	c3                   	retq   

00000000008051b1 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  8051b1:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  8051b4:	48 a1 00 d0 80 00 00 	movabs 0x80d000,%rax
  8051bb:	00 00 00 
call *%rax
  8051be:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  8051c0:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  8051c7:	00 08 
    movq 152(%rsp), %rax
  8051c9:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  8051d0:	00 
    movq 136(%rsp), %rbx
  8051d1:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  8051d8:	00 
movq %rbx, (%rax)
  8051d9:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  8051dc:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  8051e0:	4c 8b 3c 24          	mov    (%rsp),%r15
  8051e4:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8051e9:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8051ee:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8051f3:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  8051f8:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  8051fd:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  805202:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  805207:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  80520c:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  805211:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  805216:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  80521b:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  805220:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  805225:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  80522a:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  80522e:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  805232:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  805233:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  805238:	c3                   	retq   

0000000000805239 <ipc_recv>:
  805239:	55                   	push   %rbp
  80523a:	48 89 e5             	mov    %rsp,%rbp
  80523d:	48 83 ec 30          	sub    $0x30,%rsp
  805241:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805245:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  805249:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80524d:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  805252:	75 0e                	jne    805262 <ipc_recv+0x29>
  805254:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80525b:	00 00 00 
  80525e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  805262:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  805266:	48 89 c7             	mov    %rax,%rdi
  805269:	48 b8 86 1c 80 00 00 	movabs $0x801c86,%rax
  805270:	00 00 00 
  805273:	ff d0                	callq  *%rax
  805275:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805278:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80527c:	79 27                	jns    8052a5 <ipc_recv+0x6c>
  80527e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  805283:	74 0a                	je     80528f <ipc_recv+0x56>
  805285:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805289:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80528f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  805294:	74 0a                	je     8052a0 <ipc_recv+0x67>
  805296:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80529a:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8052a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8052a3:	eb 53                	jmp    8052f8 <ipc_recv+0xbf>
  8052a5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8052aa:	74 19                	je     8052c5 <ipc_recv+0x8c>
  8052ac:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8052b3:	00 00 00 
  8052b6:	48 8b 00             	mov    (%rax),%rax
  8052b9:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8052bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8052c3:	89 10                	mov    %edx,(%rax)
  8052c5:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8052ca:	74 19                	je     8052e5 <ipc_recv+0xac>
  8052cc:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8052d3:	00 00 00 
  8052d6:	48 8b 00             	mov    (%rax),%rax
  8052d9:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8052df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8052e3:	89 10                	mov    %edx,(%rax)
  8052e5:	48 b8 08 90 80 00 00 	movabs $0x809008,%rax
  8052ec:	00 00 00 
  8052ef:	48 8b 00             	mov    (%rax),%rax
  8052f2:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8052f8:	c9                   	leaveq 
  8052f9:	c3                   	retq   

00000000008052fa <ipc_send>:
  8052fa:	55                   	push   %rbp
  8052fb:	48 89 e5             	mov    %rsp,%rbp
  8052fe:	48 83 ec 30          	sub    $0x30,%rsp
  805302:	89 7d ec             	mov    %edi,-0x14(%rbp)
  805305:	89 75 e8             	mov    %esi,-0x18(%rbp)
  805308:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80530c:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80530f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  805314:	75 1c                	jne    805332 <ipc_send+0x38>
  805316:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80531d:	00 00 00 
  805320:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  805324:	eb 0c                	jmp    805332 <ipc_send+0x38>
  805326:	48 b8 0f 1a 80 00 00 	movabs $0x801a0f,%rax
  80532d:	00 00 00 
  805330:	ff d0                	callq  *%rax
  805332:	8b 75 e8             	mov    -0x18(%rbp),%esi
  805335:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  805338:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80533c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80533f:	89 c7                	mov    %eax,%edi
  805341:	48 b8 2f 1c 80 00 00 	movabs $0x801c2f,%rax
  805348:	00 00 00 
  80534b:	ff d0                	callq  *%rax
  80534d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  805350:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  805354:	74 d0                	je     805326 <ipc_send+0x2c>
  805356:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80535a:	79 30                	jns    80538c <ipc_send+0x92>
  80535c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80535f:	89 c1                	mov    %eax,%ecx
  805361:	48 ba d0 5e 80 00 00 	movabs $0x805ed0,%rdx
  805368:	00 00 00 
  80536b:	be 44 00 00 00       	mov    $0x44,%esi
  805370:	48 bf e6 5e 80 00 00 	movabs $0x805ee6,%rdi
  805377:	00 00 00 
  80537a:	b8 00 00 00 00       	mov    $0x0,%eax
  80537f:	49 b8 52 03 80 00 00 	movabs $0x800352,%r8
  805386:	00 00 00 
  805389:	41 ff d0             	callq  *%r8
  80538c:	90                   	nop
  80538d:	c9                   	leaveq 
  80538e:	c3                   	retq   

000000000080538f <ipc_host_recv>:
  80538f:	55                   	push   %rbp
  805390:	48 89 e5             	mov    %rsp,%rbp
  805393:	48 83 ec 10          	sub    $0x10,%rsp
  805397:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80539b:	48 ba f8 5e 80 00 00 	movabs $0x805ef8,%rdx
  8053a2:	00 00 00 
  8053a5:	be 4e 00 00 00       	mov    $0x4e,%esi
  8053aa:	48 bf e6 5e 80 00 00 	movabs $0x805ee6,%rdi
  8053b1:	00 00 00 
  8053b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8053b9:	48 b9 52 03 80 00 00 	movabs $0x800352,%rcx
  8053c0:	00 00 00 
  8053c3:	ff d1                	callq  *%rcx

00000000008053c5 <ipc_host_send>:
  8053c5:	55                   	push   %rbp
  8053c6:	48 89 e5             	mov    %rsp,%rbp
  8053c9:	48 83 ec 20          	sub    $0x20,%rsp
  8053cd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8053d0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8053d3:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  8053d7:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8053da:	48 ba 18 5f 80 00 00 	movabs $0x805f18,%rdx
  8053e1:	00 00 00 
  8053e4:	be 58 00 00 00       	mov    $0x58,%esi
  8053e9:	48 bf e6 5e 80 00 00 	movabs $0x805ee6,%rdi
  8053f0:	00 00 00 
  8053f3:	b8 00 00 00 00       	mov    $0x0,%eax
  8053f8:	48 b9 52 03 80 00 00 	movabs $0x800352,%rcx
  8053ff:	00 00 00 
  805402:	ff d1                	callq  *%rcx

0000000000805404 <ipc_find_env>:
  805404:	55                   	push   %rbp
  805405:	48 89 e5             	mov    %rsp,%rbp
  805408:	48 83 ec 18          	sub    $0x18,%rsp
  80540c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80540f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  805416:	eb 4d                	jmp    805465 <ipc_find_env+0x61>
  805418:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80541f:	00 00 00 
  805422:	8b 45 fc             	mov    -0x4(%rbp),%eax
  805425:	48 98                	cltq   
  805427:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80542e:	48 01 d0             	add    %rdx,%rax
  805431:	48 05 d0 00 00 00    	add    $0xd0,%rax
  805437:	8b 00                	mov    (%rax),%eax
  805439:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80543c:	75 23                	jne    805461 <ipc_find_env+0x5d>
  80543e:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  805445:	00 00 00 
  805448:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80544b:	48 98                	cltq   
  80544d:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  805454:	48 01 d0             	add    %rdx,%rax
  805457:	48 05 c8 00 00 00    	add    $0xc8,%rax
  80545d:	8b 00                	mov    (%rax),%eax
  80545f:	eb 12                	jmp    805473 <ipc_find_env+0x6f>
  805461:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  805465:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80546c:	7e aa                	jle    805418 <ipc_find_env+0x14>
  80546e:	b8 00 00 00 00       	mov    $0x0,%eax
  805473:	c9                   	leaveq 
  805474:	c3                   	retq   

0000000000805475 <pageref>:
  805475:	55                   	push   %rbp
  805476:	48 89 e5             	mov    %rsp,%rbp
  805479:	48 83 ec 18          	sub    $0x18,%rsp
  80547d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  805481:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  805485:	48 c1 e8 15          	shr    $0x15,%rax
  805489:	48 89 c2             	mov    %rax,%rdx
  80548c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  805493:	01 00 00 
  805496:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80549a:	83 e0 01             	and    $0x1,%eax
  80549d:	48 85 c0             	test   %rax,%rax
  8054a0:	75 07                	jne    8054a9 <pageref+0x34>
  8054a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8054a7:	eb 56                	jmp    8054ff <pageref+0x8a>
  8054a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8054ad:	48 c1 e8 0c          	shr    $0xc,%rax
  8054b1:	48 89 c2             	mov    %rax,%rdx
  8054b4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8054bb:	01 00 00 
  8054be:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8054c2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8054c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8054ca:	83 e0 01             	and    $0x1,%eax
  8054cd:	48 85 c0             	test   %rax,%rax
  8054d0:	75 07                	jne    8054d9 <pageref+0x64>
  8054d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8054d7:	eb 26                	jmp    8054ff <pageref+0x8a>
  8054d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8054dd:	48 c1 e8 0c          	shr    $0xc,%rax
  8054e1:	48 89 c2             	mov    %rax,%rdx
  8054e4:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8054eb:	00 00 00 
  8054ee:	48 c1 e2 04          	shl    $0x4,%rdx
  8054f2:	48 01 d0             	add    %rdx,%rax
  8054f5:	48 83 c0 08          	add    $0x8,%rax
  8054f9:	0f b7 00             	movzwl (%rax),%eax
  8054fc:	0f b7 c0             	movzwl %ax,%eax
  8054ff:	c9                   	leaveq 
  805500:	c3                   	retq   
