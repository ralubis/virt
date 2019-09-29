
vmm/guest/obj/user/icode:     file format elf64-x86-64


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
  80003c:	e8 19 02 00 00       	callq  80025a <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80004e:	89 bd ec fd ff ff    	mov    %edi,-0x214(%rbp)
  800054:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80005b:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800062:	00 00 00 
  800065:	48 b9 e0 4c 80 00 00 	movabs $0x804ce0,%rcx
  80006c:	00 00 00 
  80006f:	48 89 08             	mov    %rcx,(%rax)
  800072:	48 bf e6 4c 80 00 00 	movabs $0x804ce6,%rdi
  800079:	00 00 00 
  80007c:	b8 00 00 00 00       	mov    $0x0,%eax
  800081:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  800088:	00 00 00 
  80008b:	ff d2                	callq  *%rdx
  80008d:	48 bf f5 4c 80 00 00 	movabs $0x804cf5,%rdi
  800094:	00 00 00 
  800097:	b8 00 00 00 00       	mov    $0x0,%eax
  80009c:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  8000a3:	00 00 00 
  8000a6:	ff d2                	callq  *%rdx
  8000a8:	be 00 00 00 00       	mov    $0x0,%esi
  8000ad:	48 bf 08 4d 80 00 00 	movabs $0x804d08,%rdi
  8000b4:	00 00 00 
  8000b7:	48 b8 ec 27 80 00 00 	movabs $0x8027ec,%rax
  8000be:	00 00 00 
  8000c1:	ff d0                	callq  *%rax
  8000c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000ca:	79 30                	jns    8000fc <umain+0xb9>
  8000cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8000cf:	89 c1                	mov    %eax,%ecx
  8000d1:	48 ba 14 4d 80 00 00 	movabs $0x804d14,%rdx
  8000d8:	00 00 00 
  8000db:	be 1a 00 00 00       	mov    $0x1a,%esi
  8000e0:	48 bf 2a 4d 80 00 00 	movabs $0x804d2a,%rdi
  8000e7:	00 00 00 
  8000ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ef:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  8000f6:	00 00 00 
  8000f9:	41 ff d0             	callq  *%r8
  8000fc:	48 bf 3a 4d 80 00 00 	movabs $0x804d3a,%rdi
  800103:	00 00 00 
  800106:	b8 00 00 00 00       	mov    $0x0,%eax
  80010b:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  800112:	00 00 00 
  800115:	ff d2                	callq  *%rdx
  800117:	eb 3a                	jmp    800153 <umain+0x110>
  800119:	48 bf 4d 4d 80 00 00 	movabs $0x804d4d,%rdi
  800120:	00 00 00 
  800123:	b8 00 00 00 00       	mov    $0x0,%eax
  800128:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  80012f:	00 00 00 
  800132:	ff d2                	callq  *%rdx
  800134:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800137:	48 63 d0             	movslq %eax,%rdx
  80013a:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
  800141:	48 89 d6             	mov    %rdx,%rsi
  800144:	48 89 c7             	mov    %rax,%rdi
  800147:	48 b8 b4 18 80 00 00 	movabs $0x8018b4,%rax
  80014e:	00 00 00 
  800151:	ff d0                	callq  *%rax
  800153:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80015a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80015d:	ba 00 02 00 00       	mov    $0x200,%edx
  800162:	48 89 ce             	mov    %rcx,%rsi
  800165:	89 c7                	mov    %eax,%edi
  800167:	48 b8 13 23 80 00 00 	movabs $0x802313,%rax
  80016e:	00 00 00 
  800171:	ff d0                	callq  *%rax
  800173:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800176:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80017a:	7f 9d                	jg     800119 <umain+0xd6>
  80017c:	48 bf 5b 4d 80 00 00 	movabs $0x804d5b,%rdi
  800183:	00 00 00 
  800186:	b8 00 00 00 00       	mov    $0x0,%eax
  80018b:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  800192:	00 00 00 
  800195:	ff d2                	callq  *%rdx
  800197:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80019a:	89 c7                	mov    %eax,%edi
  80019c:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  8001a3:	00 00 00 
  8001a6:	ff d0                	callq  *%rax
  8001a8:	48 bf 6f 4d 80 00 00 	movabs $0x804d6f,%rdi
  8001af:	00 00 00 
  8001b2:	b8 00 00 00 00       	mov    $0x0,%eax
  8001b7:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  8001be:	00 00 00 
  8001c1:	ff d2                	callq  *%rdx
  8001c3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8001c9:	48 b9 88 4d 80 00 00 	movabs $0x804d88,%rcx
  8001d0:	00 00 00 
  8001d3:	48 ba 91 4d 80 00 00 	movabs $0x804d91,%rdx
  8001da:	00 00 00 
  8001dd:	48 be 9a 4d 80 00 00 	movabs $0x804d9a,%rsi
  8001e4:	00 00 00 
  8001e7:	48 bf 9f 4d 80 00 00 	movabs $0x804d9f,%rdi
  8001ee:	00 00 00 
  8001f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8001f6:	49 b9 83 31 80 00 00 	movabs $0x803183,%r9
  8001fd:	00 00 00 
  800200:	41 ff d1             	callq  *%r9
  800203:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800206:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80020a:	79 30                	jns    80023c <umain+0x1f9>
  80020c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80020f:	89 c1                	mov    %eax,%ecx
  800211:	48 ba aa 4d 80 00 00 	movabs $0x804daa,%rdx
  800218:	00 00 00 
  80021b:	be 28 00 00 00       	mov    $0x28,%esi
  800220:	48 bf 2a 4d 80 00 00 	movabs $0x804d2a,%rdi
  800227:	00 00 00 
  80022a:	b8 00 00 00 00       	mov    $0x0,%eax
  80022f:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  800236:	00 00 00 
  800239:	41 ff d0             	callq  *%r8
  80023c:	48 bf c6 4d 80 00 00 	movabs $0x804dc6,%rdi
  800243:	00 00 00 
  800246:	b8 00 00 00 00       	mov    $0x0,%eax
  80024b:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  800252:	00 00 00 
  800255:	ff d2                	callq  *%rdx
  800257:	90                   	nop
  800258:	c9                   	leaveq 
  800259:	c3                   	retq   

000000000080025a <libmain>:
  80025a:	55                   	push   %rbp
  80025b:	48 89 e5             	mov    %rsp,%rbp
  80025e:	48 83 ec 10          	sub    $0x10,%rsp
  800262:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800265:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800269:	48 b8 83 19 80 00 00 	movabs $0x801983,%rax
  800270:	00 00 00 
  800273:	ff d0                	callq  *%rax
  800275:	25 ff 03 00 00       	and    $0x3ff,%eax
  80027a:	48 98                	cltq   
  80027c:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800283:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80028a:	00 00 00 
  80028d:	48 01 c2             	add    %rax,%rdx
  800290:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800297:	00 00 00 
  80029a:	48 89 10             	mov    %rdx,(%rax)
  80029d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8002a1:	7e 14                	jle    8002b7 <libmain+0x5d>
  8002a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002a7:	48 8b 10             	mov    (%rax),%rdx
  8002aa:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002b1:	00 00 00 
  8002b4:	48 89 10             	mov    %rdx,(%rax)
  8002b7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002be:	48 89 d6             	mov    %rdx,%rsi
  8002c1:	89 c7                	mov    %eax,%edi
  8002c3:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8002ca:	00 00 00 
  8002cd:	ff d0                	callq  *%rax
  8002cf:	48 b8 de 02 80 00 00 	movabs $0x8002de,%rax
  8002d6:	00 00 00 
  8002d9:	ff d0                	callq  *%rax
  8002db:	90                   	nop
  8002dc:	c9                   	leaveq 
  8002dd:	c3                   	retq   

00000000008002de <exit>:
  8002de:	55                   	push   %rbp
  8002df:	48 89 e5             	mov    %rsp,%rbp
  8002e2:	48 b8 3b 21 80 00 00 	movabs $0x80213b,%rax
  8002e9:	00 00 00 
  8002ec:	ff d0                	callq  *%rax
  8002ee:	bf 00 00 00 00       	mov    $0x0,%edi
  8002f3:	48 b8 3d 19 80 00 00 	movabs $0x80193d,%rax
  8002fa:	00 00 00 
  8002fd:	ff d0                	callq  *%rax
  8002ff:	90                   	nop
  800300:	5d                   	pop    %rbp
  800301:	c3                   	retq   

0000000000800302 <_panic>:
  800302:	55                   	push   %rbp
  800303:	48 89 e5             	mov    %rsp,%rbp
  800306:	53                   	push   %rbx
  800307:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80030e:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800315:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80031b:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800322:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800329:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800330:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800337:	84 c0                	test   %al,%al
  800339:	74 23                	je     80035e <_panic+0x5c>
  80033b:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800342:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800346:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80034a:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80034e:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800352:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800356:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80035a:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80035e:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800365:	00 00 00 
  800368:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80036f:	00 00 00 
  800372:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800376:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80037d:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800384:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80038b:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800392:	00 00 00 
  800395:	48 8b 18             	mov    (%rax),%rbx
  800398:	48 b8 83 19 80 00 00 	movabs $0x801983,%rax
  80039f:	00 00 00 
  8003a2:	ff d0                	callq  *%rax
  8003a4:	89 c6                	mov    %eax,%esi
  8003a6:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8003ac:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8003b3:	41 89 d0             	mov    %edx,%r8d
  8003b6:	48 89 c1             	mov    %rax,%rcx
  8003b9:	48 89 da             	mov    %rbx,%rdx
  8003bc:	48 bf e0 4d 80 00 00 	movabs $0x804de0,%rdi
  8003c3:	00 00 00 
  8003c6:	b8 00 00 00 00       	mov    $0x0,%eax
  8003cb:	49 b9 3c 05 80 00 00 	movabs $0x80053c,%r9
  8003d2:	00 00 00 
  8003d5:	41 ff d1             	callq  *%r9
  8003d8:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8003df:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8003e6:	48 89 d6             	mov    %rdx,%rsi
  8003e9:	48 89 c7             	mov    %rax,%rdi
  8003ec:	48 b8 90 04 80 00 00 	movabs $0x800490,%rax
  8003f3:	00 00 00 
  8003f6:	ff d0                	callq  *%rax
  8003f8:	48 bf 03 4e 80 00 00 	movabs $0x804e03,%rdi
  8003ff:	00 00 00 
  800402:	b8 00 00 00 00       	mov    $0x0,%eax
  800407:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  80040e:	00 00 00 
  800411:	ff d2                	callq  *%rdx
  800413:	cc                   	int3   
  800414:	eb fd                	jmp    800413 <_panic+0x111>

0000000000800416 <putch>:
  800416:	55                   	push   %rbp
  800417:	48 89 e5             	mov    %rsp,%rbp
  80041a:	48 83 ec 10          	sub    $0x10,%rsp
  80041e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800421:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800425:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800429:	8b 00                	mov    (%rax),%eax
  80042b:	8d 48 01             	lea    0x1(%rax),%ecx
  80042e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800432:	89 0a                	mov    %ecx,(%rdx)
  800434:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800437:	89 d1                	mov    %edx,%ecx
  800439:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80043d:	48 98                	cltq   
  80043f:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800443:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800447:	8b 00                	mov    (%rax),%eax
  800449:	3d ff 00 00 00       	cmp    $0xff,%eax
  80044e:	75 2c                	jne    80047c <putch+0x66>
  800450:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800454:	8b 00                	mov    (%rax),%eax
  800456:	48 98                	cltq   
  800458:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80045c:	48 83 c2 08          	add    $0x8,%rdx
  800460:	48 89 c6             	mov    %rax,%rsi
  800463:	48 89 d7             	mov    %rdx,%rdi
  800466:	48 b8 b4 18 80 00 00 	movabs $0x8018b4,%rax
  80046d:	00 00 00 
  800470:	ff d0                	callq  *%rax
  800472:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800476:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80047c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800480:	8b 40 04             	mov    0x4(%rax),%eax
  800483:	8d 50 01             	lea    0x1(%rax),%edx
  800486:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80048a:	89 50 04             	mov    %edx,0x4(%rax)
  80048d:	90                   	nop
  80048e:	c9                   	leaveq 
  80048f:	c3                   	retq   

0000000000800490 <vcprintf>:
  800490:	55                   	push   %rbp
  800491:	48 89 e5             	mov    %rsp,%rbp
  800494:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80049b:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8004a2:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8004a9:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8004b0:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8004b7:	48 8b 0a             	mov    (%rdx),%rcx
  8004ba:	48 89 08             	mov    %rcx,(%rax)
  8004bd:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8004c1:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8004c5:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8004c9:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8004cd:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8004d4:	00 00 00 
  8004d7:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8004de:	00 00 00 
  8004e1:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8004e8:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8004ef:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8004f6:	48 89 c6             	mov    %rax,%rsi
  8004f9:	48 bf 16 04 80 00 00 	movabs $0x800416,%rdi
  800500:	00 00 00 
  800503:	48 b8 da 08 80 00 00 	movabs $0x8008da,%rax
  80050a:	00 00 00 
  80050d:	ff d0                	callq  *%rax
  80050f:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800515:	48 98                	cltq   
  800517:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80051e:	48 83 c2 08          	add    $0x8,%rdx
  800522:	48 89 c6             	mov    %rax,%rsi
  800525:	48 89 d7             	mov    %rdx,%rdi
  800528:	48 b8 b4 18 80 00 00 	movabs $0x8018b4,%rax
  80052f:	00 00 00 
  800532:	ff d0                	callq  *%rax
  800534:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80053a:	c9                   	leaveq 
  80053b:	c3                   	retq   

000000000080053c <cprintf>:
  80053c:	55                   	push   %rbp
  80053d:	48 89 e5             	mov    %rsp,%rbp
  800540:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800547:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80054e:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800555:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80055c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800563:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80056a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800571:	84 c0                	test   %al,%al
  800573:	74 20                	je     800595 <cprintf+0x59>
  800575:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800579:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80057d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800581:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800585:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800589:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80058d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800591:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800595:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80059c:	00 00 00 
  80059f:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8005a6:	00 00 00 
  8005a9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8005ad:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8005b4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8005bb:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8005c2:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8005c9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8005d0:	48 8b 0a             	mov    (%rdx),%rcx
  8005d3:	48 89 08             	mov    %rcx,(%rax)
  8005d6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005da:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005de:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005e2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005e6:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8005ed:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005f4:	48 89 d6             	mov    %rdx,%rsi
  8005f7:	48 89 c7             	mov    %rax,%rdi
  8005fa:	48 b8 90 04 80 00 00 	movabs $0x800490,%rax
  800601:	00 00 00 
  800604:	ff d0                	callq  *%rax
  800606:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80060c:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800612:	c9                   	leaveq 
  800613:	c3                   	retq   

0000000000800614 <printnum>:
  800614:	55                   	push   %rbp
  800615:	48 89 e5             	mov    %rsp,%rbp
  800618:	48 83 ec 30          	sub    $0x30,%rsp
  80061c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800620:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800624:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800628:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80062b:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  80062f:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800633:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800636:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  80063a:	77 54                	ja     800690 <printnum+0x7c>
  80063c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80063f:	8d 78 ff             	lea    -0x1(%rax),%edi
  800642:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800645:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800649:	ba 00 00 00 00       	mov    $0x0,%edx
  80064e:	48 f7 f6             	div    %rsi
  800651:	49 89 c2             	mov    %rax,%r10
  800654:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800657:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80065a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80065e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800662:	41 89 c9             	mov    %ecx,%r9d
  800665:	41 89 f8             	mov    %edi,%r8d
  800668:	89 d1                	mov    %edx,%ecx
  80066a:	4c 89 d2             	mov    %r10,%rdx
  80066d:	48 89 c7             	mov    %rax,%rdi
  800670:	48 b8 14 06 80 00 00 	movabs $0x800614,%rax
  800677:	00 00 00 
  80067a:	ff d0                	callq  *%rax
  80067c:	eb 1c                	jmp    80069a <printnum+0x86>
  80067e:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800682:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800685:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800689:	48 89 ce             	mov    %rcx,%rsi
  80068c:	89 d7                	mov    %edx,%edi
  80068e:	ff d0                	callq  *%rax
  800690:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800694:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800698:	7f e4                	jg     80067e <printnum+0x6a>
  80069a:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80069d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a1:	ba 00 00 00 00       	mov    $0x0,%edx
  8006a6:	48 f7 f1             	div    %rcx
  8006a9:	48 b8 10 50 80 00 00 	movabs $0x805010,%rax
  8006b0:	00 00 00 
  8006b3:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8006b7:	0f be d0             	movsbl %al,%edx
  8006ba:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8006be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006c2:	48 89 ce             	mov    %rcx,%rsi
  8006c5:	89 d7                	mov    %edx,%edi
  8006c7:	ff d0                	callq  *%rax
  8006c9:	90                   	nop
  8006ca:	c9                   	leaveq 
  8006cb:	c3                   	retq   

00000000008006cc <getuint>:
  8006cc:	55                   	push   %rbp
  8006cd:	48 89 e5             	mov    %rsp,%rbp
  8006d0:	48 83 ec 20          	sub    $0x20,%rsp
  8006d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006d8:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8006db:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8006df:	7e 4f                	jle    800730 <getuint+0x64>
  8006e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e5:	8b 00                	mov    (%rax),%eax
  8006e7:	83 f8 30             	cmp    $0x30,%eax
  8006ea:	73 24                	jae    800710 <getuint+0x44>
  8006ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f0:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f8:	8b 00                	mov    (%rax),%eax
  8006fa:	89 c0                	mov    %eax,%eax
  8006fc:	48 01 d0             	add    %rdx,%rax
  8006ff:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800703:	8b 12                	mov    (%rdx),%edx
  800705:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800708:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80070c:	89 0a                	mov    %ecx,(%rdx)
  80070e:	eb 14                	jmp    800724 <getuint+0x58>
  800710:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800714:	48 8b 40 08          	mov    0x8(%rax),%rax
  800718:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80071c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800720:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800724:	48 8b 00             	mov    (%rax),%rax
  800727:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80072b:	e9 9d 00 00 00       	jmpq   8007cd <getuint+0x101>
  800730:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800734:	74 4c                	je     800782 <getuint+0xb6>
  800736:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80073a:	8b 00                	mov    (%rax),%eax
  80073c:	83 f8 30             	cmp    $0x30,%eax
  80073f:	73 24                	jae    800765 <getuint+0x99>
  800741:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800745:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800749:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80074d:	8b 00                	mov    (%rax),%eax
  80074f:	89 c0                	mov    %eax,%eax
  800751:	48 01 d0             	add    %rdx,%rax
  800754:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800758:	8b 12                	mov    (%rdx),%edx
  80075a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80075d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800761:	89 0a                	mov    %ecx,(%rdx)
  800763:	eb 14                	jmp    800779 <getuint+0xad>
  800765:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800769:	48 8b 40 08          	mov    0x8(%rax),%rax
  80076d:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800771:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800775:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800779:	48 8b 00             	mov    (%rax),%rax
  80077c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800780:	eb 4b                	jmp    8007cd <getuint+0x101>
  800782:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800786:	8b 00                	mov    (%rax),%eax
  800788:	83 f8 30             	cmp    $0x30,%eax
  80078b:	73 24                	jae    8007b1 <getuint+0xe5>
  80078d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800791:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800795:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800799:	8b 00                	mov    (%rax),%eax
  80079b:	89 c0                	mov    %eax,%eax
  80079d:	48 01 d0             	add    %rdx,%rax
  8007a0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007a4:	8b 12                	mov    (%rdx),%edx
  8007a6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007a9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ad:	89 0a                	mov    %ecx,(%rdx)
  8007af:	eb 14                	jmp    8007c5 <getuint+0xf9>
  8007b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007b5:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007b9:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007bd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007c1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007c5:	8b 00                	mov    (%rax),%eax
  8007c7:	89 c0                	mov    %eax,%eax
  8007c9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007d1:	c9                   	leaveq 
  8007d2:	c3                   	retq   

00000000008007d3 <getint>:
  8007d3:	55                   	push   %rbp
  8007d4:	48 89 e5             	mov    %rsp,%rbp
  8007d7:	48 83 ec 20          	sub    $0x20,%rsp
  8007db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007df:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007e2:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007e6:	7e 4f                	jle    800837 <getint+0x64>
  8007e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ec:	8b 00                	mov    (%rax),%eax
  8007ee:	83 f8 30             	cmp    $0x30,%eax
  8007f1:	73 24                	jae    800817 <getint+0x44>
  8007f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007f7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ff:	8b 00                	mov    (%rax),%eax
  800801:	89 c0                	mov    %eax,%eax
  800803:	48 01 d0             	add    %rdx,%rax
  800806:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80080a:	8b 12                	mov    (%rdx),%edx
  80080c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80080f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800813:	89 0a                	mov    %ecx,(%rdx)
  800815:	eb 14                	jmp    80082b <getint+0x58>
  800817:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80081f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800823:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800827:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80082b:	48 8b 00             	mov    (%rax),%rax
  80082e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800832:	e9 9d 00 00 00       	jmpq   8008d4 <getint+0x101>
  800837:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80083b:	74 4c                	je     800889 <getint+0xb6>
  80083d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800841:	8b 00                	mov    (%rax),%eax
  800843:	83 f8 30             	cmp    $0x30,%eax
  800846:	73 24                	jae    80086c <getint+0x99>
  800848:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80084c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800850:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800854:	8b 00                	mov    (%rax),%eax
  800856:	89 c0                	mov    %eax,%eax
  800858:	48 01 d0             	add    %rdx,%rax
  80085b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80085f:	8b 12                	mov    (%rdx),%edx
  800861:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800864:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800868:	89 0a                	mov    %ecx,(%rdx)
  80086a:	eb 14                	jmp    800880 <getint+0xad>
  80086c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800870:	48 8b 40 08          	mov    0x8(%rax),%rax
  800874:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800878:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80087c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800880:	48 8b 00             	mov    (%rax),%rax
  800883:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800887:	eb 4b                	jmp    8008d4 <getint+0x101>
  800889:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80088d:	8b 00                	mov    (%rax),%eax
  80088f:	83 f8 30             	cmp    $0x30,%eax
  800892:	73 24                	jae    8008b8 <getint+0xe5>
  800894:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800898:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80089c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a0:	8b 00                	mov    (%rax),%eax
  8008a2:	89 c0                	mov    %eax,%eax
  8008a4:	48 01 d0             	add    %rdx,%rax
  8008a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008ab:	8b 12                	mov    (%rdx),%edx
  8008ad:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008b0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008b4:	89 0a                	mov    %ecx,(%rdx)
  8008b6:	eb 14                	jmp    8008cc <getint+0xf9>
  8008b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008bc:	48 8b 40 08          	mov    0x8(%rax),%rax
  8008c0:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8008c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008c8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008cc:	8b 00                	mov    (%rax),%eax
  8008ce:	48 98                	cltq   
  8008d0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008d8:	c9                   	leaveq 
  8008d9:	c3                   	retq   

00000000008008da <vprintfmt>:
  8008da:	55                   	push   %rbp
  8008db:	48 89 e5             	mov    %rsp,%rbp
  8008de:	41 54                	push   %r12
  8008e0:	53                   	push   %rbx
  8008e1:	48 83 ec 60          	sub    $0x60,%rsp
  8008e5:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8008e9:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8008ed:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008f1:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8008f5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8008f9:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8008fd:	48 8b 0a             	mov    (%rdx),%rcx
  800900:	48 89 08             	mov    %rcx,(%rax)
  800903:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800907:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80090b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80090f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800913:	eb 17                	jmp    80092c <vprintfmt+0x52>
  800915:	85 db                	test   %ebx,%ebx
  800917:	0f 84 b9 04 00 00    	je     800dd6 <vprintfmt+0x4fc>
  80091d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800921:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800925:	48 89 d6             	mov    %rdx,%rsi
  800928:	89 df                	mov    %ebx,%edi
  80092a:	ff d0                	callq  *%rax
  80092c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800930:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800934:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800938:	0f b6 00             	movzbl (%rax),%eax
  80093b:	0f b6 d8             	movzbl %al,%ebx
  80093e:	83 fb 25             	cmp    $0x25,%ebx
  800941:	75 d2                	jne    800915 <vprintfmt+0x3b>
  800943:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800947:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80094e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800955:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80095c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800963:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800967:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80096b:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80096f:	0f b6 00             	movzbl (%rax),%eax
  800972:	0f b6 d8             	movzbl %al,%ebx
  800975:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800978:	83 f8 55             	cmp    $0x55,%eax
  80097b:	0f 87 22 04 00 00    	ja     800da3 <vprintfmt+0x4c9>
  800981:	89 c0                	mov    %eax,%eax
  800983:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80098a:	00 
  80098b:	48 b8 38 50 80 00 00 	movabs $0x805038,%rax
  800992:	00 00 00 
  800995:	48 01 d0             	add    %rdx,%rax
  800998:	48 8b 00             	mov    (%rax),%rax
  80099b:	ff e0                	jmpq   *%rax
  80099d:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8009a1:	eb c0                	jmp    800963 <vprintfmt+0x89>
  8009a3:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8009a7:	eb ba                	jmp    800963 <vprintfmt+0x89>
  8009a9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8009b0:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8009b3:	89 d0                	mov    %edx,%eax
  8009b5:	c1 e0 02             	shl    $0x2,%eax
  8009b8:	01 d0                	add    %edx,%eax
  8009ba:	01 c0                	add    %eax,%eax
  8009bc:	01 d8                	add    %ebx,%eax
  8009be:	83 e8 30             	sub    $0x30,%eax
  8009c1:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009c4:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009c8:	0f b6 00             	movzbl (%rax),%eax
  8009cb:	0f be d8             	movsbl %al,%ebx
  8009ce:	83 fb 2f             	cmp    $0x2f,%ebx
  8009d1:	7e 60                	jle    800a33 <vprintfmt+0x159>
  8009d3:	83 fb 39             	cmp    $0x39,%ebx
  8009d6:	7f 5b                	jg     800a33 <vprintfmt+0x159>
  8009d8:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8009dd:	eb d1                	jmp    8009b0 <vprintfmt+0xd6>
  8009df:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009e2:	83 f8 30             	cmp    $0x30,%eax
  8009e5:	73 17                	jae    8009fe <vprintfmt+0x124>
  8009e7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8009eb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009ee:	89 d2                	mov    %edx,%edx
  8009f0:	48 01 d0             	add    %rdx,%rax
  8009f3:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009f6:	83 c2 08             	add    $0x8,%edx
  8009f9:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009fc:	eb 0c                	jmp    800a0a <vprintfmt+0x130>
  8009fe:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a02:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a06:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a0a:	8b 00                	mov    (%rax),%eax
  800a0c:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a0f:	eb 23                	jmp    800a34 <vprintfmt+0x15a>
  800a11:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a15:	0f 89 48 ff ff ff    	jns    800963 <vprintfmt+0x89>
  800a1b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800a22:	e9 3c ff ff ff       	jmpq   800963 <vprintfmt+0x89>
  800a27:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800a2e:	e9 30 ff ff ff       	jmpq   800963 <vprintfmt+0x89>
  800a33:	90                   	nop
  800a34:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a38:	0f 89 25 ff ff ff    	jns    800963 <vprintfmt+0x89>
  800a3e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a41:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800a44:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a4b:	e9 13 ff ff ff       	jmpq   800963 <vprintfmt+0x89>
  800a50:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800a54:	e9 0a ff ff ff       	jmpq   800963 <vprintfmt+0x89>
  800a59:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a5c:	83 f8 30             	cmp    $0x30,%eax
  800a5f:	73 17                	jae    800a78 <vprintfmt+0x19e>
  800a61:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a65:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a68:	89 d2                	mov    %edx,%edx
  800a6a:	48 01 d0             	add    %rdx,%rax
  800a6d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a70:	83 c2 08             	add    $0x8,%edx
  800a73:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a76:	eb 0c                	jmp    800a84 <vprintfmt+0x1aa>
  800a78:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a7c:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a80:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a84:	8b 10                	mov    (%rax),%edx
  800a86:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a8a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a8e:	48 89 ce             	mov    %rcx,%rsi
  800a91:	89 d7                	mov    %edx,%edi
  800a93:	ff d0                	callq  *%rax
  800a95:	e9 37 03 00 00       	jmpq   800dd1 <vprintfmt+0x4f7>
  800a9a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a9d:	83 f8 30             	cmp    $0x30,%eax
  800aa0:	73 17                	jae    800ab9 <vprintfmt+0x1df>
  800aa2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800aa6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800aa9:	89 d2                	mov    %edx,%edx
  800aab:	48 01 d0             	add    %rdx,%rax
  800aae:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ab1:	83 c2 08             	add    $0x8,%edx
  800ab4:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ab7:	eb 0c                	jmp    800ac5 <vprintfmt+0x1eb>
  800ab9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800abd:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800ac1:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ac5:	8b 18                	mov    (%rax),%ebx
  800ac7:	85 db                	test   %ebx,%ebx
  800ac9:	79 02                	jns    800acd <vprintfmt+0x1f3>
  800acb:	f7 db                	neg    %ebx
  800acd:	83 fb 15             	cmp    $0x15,%ebx
  800ad0:	7f 16                	jg     800ae8 <vprintfmt+0x20e>
  800ad2:	48 b8 60 4f 80 00 00 	movabs $0x804f60,%rax
  800ad9:	00 00 00 
  800adc:	48 63 d3             	movslq %ebx,%rdx
  800adf:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800ae3:	4d 85 e4             	test   %r12,%r12
  800ae6:	75 2e                	jne    800b16 <vprintfmt+0x23c>
  800ae8:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800aec:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800af0:	89 d9                	mov    %ebx,%ecx
  800af2:	48 ba 21 50 80 00 00 	movabs $0x805021,%rdx
  800af9:	00 00 00 
  800afc:	48 89 c7             	mov    %rax,%rdi
  800aff:	b8 00 00 00 00       	mov    $0x0,%eax
  800b04:	49 b8 e0 0d 80 00 00 	movabs $0x800de0,%r8
  800b0b:	00 00 00 
  800b0e:	41 ff d0             	callq  *%r8
  800b11:	e9 bb 02 00 00       	jmpq   800dd1 <vprintfmt+0x4f7>
  800b16:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b1a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b1e:	4c 89 e1             	mov    %r12,%rcx
  800b21:	48 ba 2a 50 80 00 00 	movabs $0x80502a,%rdx
  800b28:	00 00 00 
  800b2b:	48 89 c7             	mov    %rax,%rdi
  800b2e:	b8 00 00 00 00       	mov    $0x0,%eax
  800b33:	49 b8 e0 0d 80 00 00 	movabs $0x800de0,%r8
  800b3a:	00 00 00 
  800b3d:	41 ff d0             	callq  *%r8
  800b40:	e9 8c 02 00 00       	jmpq   800dd1 <vprintfmt+0x4f7>
  800b45:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b48:	83 f8 30             	cmp    $0x30,%eax
  800b4b:	73 17                	jae    800b64 <vprintfmt+0x28a>
  800b4d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b51:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b54:	89 d2                	mov    %edx,%edx
  800b56:	48 01 d0             	add    %rdx,%rax
  800b59:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b5c:	83 c2 08             	add    $0x8,%edx
  800b5f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b62:	eb 0c                	jmp    800b70 <vprintfmt+0x296>
  800b64:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b68:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b6c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b70:	4c 8b 20             	mov    (%rax),%r12
  800b73:	4d 85 e4             	test   %r12,%r12
  800b76:	75 0a                	jne    800b82 <vprintfmt+0x2a8>
  800b78:	49 bc 2d 50 80 00 00 	movabs $0x80502d,%r12
  800b7f:	00 00 00 
  800b82:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b86:	7e 78                	jle    800c00 <vprintfmt+0x326>
  800b88:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b8c:	74 72                	je     800c00 <vprintfmt+0x326>
  800b8e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b91:	48 98                	cltq   
  800b93:	48 89 c6             	mov    %rax,%rsi
  800b96:	4c 89 e7             	mov    %r12,%rdi
  800b99:	48 b8 8e 10 80 00 00 	movabs $0x80108e,%rax
  800ba0:	00 00 00 
  800ba3:	ff d0                	callq  *%rax
  800ba5:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800ba8:	eb 17                	jmp    800bc1 <vprintfmt+0x2e7>
  800baa:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800bae:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800bb2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bb6:	48 89 ce             	mov    %rcx,%rsi
  800bb9:	89 d7                	mov    %edx,%edi
  800bbb:	ff d0                	callq  *%rax
  800bbd:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bc1:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bc5:	7f e3                	jg     800baa <vprintfmt+0x2d0>
  800bc7:	eb 37                	jmp    800c00 <vprintfmt+0x326>
  800bc9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800bcd:	74 1e                	je     800bed <vprintfmt+0x313>
  800bcf:	83 fb 1f             	cmp    $0x1f,%ebx
  800bd2:	7e 05                	jle    800bd9 <vprintfmt+0x2ff>
  800bd4:	83 fb 7e             	cmp    $0x7e,%ebx
  800bd7:	7e 14                	jle    800bed <vprintfmt+0x313>
  800bd9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bdd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800be1:	48 89 d6             	mov    %rdx,%rsi
  800be4:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800be9:	ff d0                	callq  *%rax
  800beb:	eb 0f                	jmp    800bfc <vprintfmt+0x322>
  800bed:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bf1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bf5:	48 89 d6             	mov    %rdx,%rsi
  800bf8:	89 df                	mov    %ebx,%edi
  800bfa:	ff d0                	callq  *%rax
  800bfc:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c00:	4c 89 e0             	mov    %r12,%rax
  800c03:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800c07:	0f b6 00             	movzbl (%rax),%eax
  800c0a:	0f be d8             	movsbl %al,%ebx
  800c0d:	85 db                	test   %ebx,%ebx
  800c0f:	74 28                	je     800c39 <vprintfmt+0x35f>
  800c11:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c15:	78 b2                	js     800bc9 <vprintfmt+0x2ef>
  800c17:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800c1b:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c1f:	79 a8                	jns    800bc9 <vprintfmt+0x2ef>
  800c21:	eb 16                	jmp    800c39 <vprintfmt+0x35f>
  800c23:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c27:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c2b:	48 89 d6             	mov    %rdx,%rsi
  800c2e:	bf 20 00 00 00       	mov    $0x20,%edi
  800c33:	ff d0                	callq  *%rax
  800c35:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c39:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c3d:	7f e4                	jg     800c23 <vprintfmt+0x349>
  800c3f:	e9 8d 01 00 00       	jmpq   800dd1 <vprintfmt+0x4f7>
  800c44:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c48:	be 03 00 00 00       	mov    $0x3,%esi
  800c4d:	48 89 c7             	mov    %rax,%rdi
  800c50:	48 b8 d3 07 80 00 00 	movabs $0x8007d3,%rax
  800c57:	00 00 00 
  800c5a:	ff d0                	callq  *%rax
  800c5c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c64:	48 85 c0             	test   %rax,%rax
  800c67:	79 1d                	jns    800c86 <vprintfmt+0x3ac>
  800c69:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c6d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c71:	48 89 d6             	mov    %rdx,%rsi
  800c74:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c79:	ff d0                	callq  *%rax
  800c7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c7f:	48 f7 d8             	neg    %rax
  800c82:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c86:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c8d:	e9 d2 00 00 00       	jmpq   800d64 <vprintfmt+0x48a>
  800c92:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c96:	be 03 00 00 00       	mov    $0x3,%esi
  800c9b:	48 89 c7             	mov    %rax,%rdi
  800c9e:	48 b8 cc 06 80 00 00 	movabs $0x8006cc,%rax
  800ca5:	00 00 00 
  800ca8:	ff d0                	callq  *%rax
  800caa:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cae:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800cb5:	e9 aa 00 00 00       	jmpq   800d64 <vprintfmt+0x48a>
  800cba:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cbe:	be 03 00 00 00       	mov    $0x3,%esi
  800cc3:	48 89 c7             	mov    %rax,%rdi
  800cc6:	48 b8 cc 06 80 00 00 	movabs $0x8006cc,%rax
  800ccd:	00 00 00 
  800cd0:	ff d0                	callq  *%rax
  800cd2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cd6:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800cdd:	e9 82 00 00 00       	jmpq   800d64 <vprintfmt+0x48a>
  800ce2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ce6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cea:	48 89 d6             	mov    %rdx,%rsi
  800ced:	bf 30 00 00 00       	mov    $0x30,%edi
  800cf2:	ff d0                	callq  *%rax
  800cf4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cf8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cfc:	48 89 d6             	mov    %rdx,%rsi
  800cff:	bf 78 00 00 00       	mov    $0x78,%edi
  800d04:	ff d0                	callq  *%rax
  800d06:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d09:	83 f8 30             	cmp    $0x30,%eax
  800d0c:	73 17                	jae    800d25 <vprintfmt+0x44b>
  800d0e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d12:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d15:	89 d2                	mov    %edx,%edx
  800d17:	48 01 d0             	add    %rdx,%rax
  800d1a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d1d:	83 c2 08             	add    $0x8,%edx
  800d20:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d23:	eb 0c                	jmp    800d31 <vprintfmt+0x457>
  800d25:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d29:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d2d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d31:	48 8b 00             	mov    (%rax),%rax
  800d34:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d38:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d3f:	eb 23                	jmp    800d64 <vprintfmt+0x48a>
  800d41:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d45:	be 03 00 00 00       	mov    $0x3,%esi
  800d4a:	48 89 c7             	mov    %rax,%rdi
  800d4d:	48 b8 cc 06 80 00 00 	movabs $0x8006cc,%rax
  800d54:	00 00 00 
  800d57:	ff d0                	callq  *%rax
  800d59:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d5d:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d64:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d69:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d6c:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d6f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d73:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d77:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d7b:	45 89 c1             	mov    %r8d,%r9d
  800d7e:	41 89 f8             	mov    %edi,%r8d
  800d81:	48 89 c7             	mov    %rax,%rdi
  800d84:	48 b8 14 06 80 00 00 	movabs $0x800614,%rax
  800d8b:	00 00 00 
  800d8e:	ff d0                	callq  *%rax
  800d90:	eb 3f                	jmp    800dd1 <vprintfmt+0x4f7>
  800d92:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d96:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d9a:	48 89 d6             	mov    %rdx,%rsi
  800d9d:	89 df                	mov    %ebx,%edi
  800d9f:	ff d0                	callq  *%rax
  800da1:	eb 2e                	jmp    800dd1 <vprintfmt+0x4f7>
  800da3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800da7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800dab:	48 89 d6             	mov    %rdx,%rsi
  800dae:	bf 25 00 00 00       	mov    $0x25,%edi
  800db3:	ff d0                	callq  *%rax
  800db5:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800dba:	eb 05                	jmp    800dc1 <vprintfmt+0x4e7>
  800dbc:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800dc1:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800dc5:	48 83 e8 01          	sub    $0x1,%rax
  800dc9:	0f b6 00             	movzbl (%rax),%eax
  800dcc:	3c 25                	cmp    $0x25,%al
  800dce:	75 ec                	jne    800dbc <vprintfmt+0x4e2>
  800dd0:	90                   	nop
  800dd1:	e9 3d fb ff ff       	jmpq   800913 <vprintfmt+0x39>
  800dd6:	90                   	nop
  800dd7:	48 83 c4 60          	add    $0x60,%rsp
  800ddb:	5b                   	pop    %rbx
  800ddc:	41 5c                	pop    %r12
  800dde:	5d                   	pop    %rbp
  800ddf:	c3                   	retq   

0000000000800de0 <printfmt>:
  800de0:	55                   	push   %rbp
  800de1:	48 89 e5             	mov    %rsp,%rbp
  800de4:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800deb:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800df2:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800df9:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800e00:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e07:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e0e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e15:	84 c0                	test   %al,%al
  800e17:	74 20                	je     800e39 <printfmt+0x59>
  800e19:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e1d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e21:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e25:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e29:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e2d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e31:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e35:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e39:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800e40:	00 00 00 
  800e43:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800e4a:	00 00 00 
  800e4d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e51:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e58:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e5f:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800e66:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e6d:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e74:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e7b:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e82:	48 89 c7             	mov    %rax,%rdi
  800e85:	48 b8 da 08 80 00 00 	movabs $0x8008da,%rax
  800e8c:	00 00 00 
  800e8f:	ff d0                	callq  *%rax
  800e91:	90                   	nop
  800e92:	c9                   	leaveq 
  800e93:	c3                   	retq   

0000000000800e94 <sprintputch>:
  800e94:	55                   	push   %rbp
  800e95:	48 89 e5             	mov    %rsp,%rbp
  800e98:	48 83 ec 10          	sub    $0x10,%rsp
  800e9c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e9f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ea3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ea7:	8b 40 10             	mov    0x10(%rax),%eax
  800eaa:	8d 50 01             	lea    0x1(%rax),%edx
  800ead:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eb1:	89 50 10             	mov    %edx,0x10(%rax)
  800eb4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eb8:	48 8b 10             	mov    (%rax),%rdx
  800ebb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ebf:	48 8b 40 08          	mov    0x8(%rax),%rax
  800ec3:	48 39 c2             	cmp    %rax,%rdx
  800ec6:	73 17                	jae    800edf <sprintputch+0x4b>
  800ec8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ecc:	48 8b 00             	mov    (%rax),%rax
  800ecf:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800ed3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800ed7:	48 89 0a             	mov    %rcx,(%rdx)
  800eda:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800edd:	88 10                	mov    %dl,(%rax)
  800edf:	90                   	nop
  800ee0:	c9                   	leaveq 
  800ee1:	c3                   	retq   

0000000000800ee2 <vsnprintf>:
  800ee2:	55                   	push   %rbp
  800ee3:	48 89 e5             	mov    %rsp,%rbp
  800ee6:	48 83 ec 50          	sub    $0x50,%rsp
  800eea:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800eee:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800ef1:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800ef5:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800ef9:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800efd:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800f01:	48 8b 0a             	mov    (%rdx),%rcx
  800f04:	48 89 08             	mov    %rcx,(%rax)
  800f07:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800f0b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800f0f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800f13:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f17:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f1b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800f1f:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800f22:	48 98                	cltq   
  800f24:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800f28:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f2c:	48 01 d0             	add    %rdx,%rax
  800f2f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800f33:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f3a:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800f3f:	74 06                	je     800f47 <vsnprintf+0x65>
  800f41:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800f45:	7f 07                	jg     800f4e <vsnprintf+0x6c>
  800f47:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800f4c:	eb 2f                	jmp    800f7d <vsnprintf+0x9b>
  800f4e:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800f52:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800f56:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800f5a:	48 89 c6             	mov    %rax,%rsi
  800f5d:	48 bf 94 0e 80 00 00 	movabs $0x800e94,%rdi
  800f64:	00 00 00 
  800f67:	48 b8 da 08 80 00 00 	movabs $0x8008da,%rax
  800f6e:	00 00 00 
  800f71:	ff d0                	callq  *%rax
  800f73:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f77:	c6 00 00             	movb   $0x0,(%rax)
  800f7a:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f7d:	c9                   	leaveq 
  800f7e:	c3                   	retq   

0000000000800f7f <snprintf>:
  800f7f:	55                   	push   %rbp
  800f80:	48 89 e5             	mov    %rsp,%rbp
  800f83:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f8a:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f91:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f97:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800f9e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800fa5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800fac:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800fb3:	84 c0                	test   %al,%al
  800fb5:	74 20                	je     800fd7 <snprintf+0x58>
  800fb7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800fbb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800fbf:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800fc3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800fc7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800fcb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800fcf:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800fd3:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800fd7:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800fde:	00 00 00 
  800fe1:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800fe8:	00 00 00 
  800feb:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800fef:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800ff6:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800ffd:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801004:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80100b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801012:	48 8b 0a             	mov    (%rdx),%rcx
  801015:	48 89 08             	mov    %rcx,(%rax)
  801018:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80101c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801020:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801024:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801028:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80102f:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801036:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80103c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801043:	48 89 c7             	mov    %rax,%rdi
  801046:	48 b8 e2 0e 80 00 00 	movabs $0x800ee2,%rax
  80104d:	00 00 00 
  801050:	ff d0                	callq  *%rax
  801052:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801058:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80105e:	c9                   	leaveq 
  80105f:	c3                   	retq   

0000000000801060 <strlen>:
  801060:	55                   	push   %rbp
  801061:	48 89 e5             	mov    %rsp,%rbp
  801064:	48 83 ec 18          	sub    $0x18,%rsp
  801068:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80106c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801073:	eb 09                	jmp    80107e <strlen+0x1e>
  801075:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801079:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80107e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801082:	0f b6 00             	movzbl (%rax),%eax
  801085:	84 c0                	test   %al,%al
  801087:	75 ec                	jne    801075 <strlen+0x15>
  801089:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80108c:	c9                   	leaveq 
  80108d:	c3                   	retq   

000000000080108e <strnlen>:
  80108e:	55                   	push   %rbp
  80108f:	48 89 e5             	mov    %rsp,%rbp
  801092:	48 83 ec 20          	sub    $0x20,%rsp
  801096:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80109a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80109e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8010a5:	eb 0e                	jmp    8010b5 <strnlen+0x27>
  8010a7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8010ab:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8010b0:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8010b5:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8010ba:	74 0b                	je     8010c7 <strnlen+0x39>
  8010bc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010c0:	0f b6 00             	movzbl (%rax),%eax
  8010c3:	84 c0                	test   %al,%al
  8010c5:	75 e0                	jne    8010a7 <strnlen+0x19>
  8010c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010ca:	c9                   	leaveq 
  8010cb:	c3                   	retq   

00000000008010cc <strcpy>:
  8010cc:	55                   	push   %rbp
  8010cd:	48 89 e5             	mov    %rsp,%rbp
  8010d0:	48 83 ec 20          	sub    $0x20,%rsp
  8010d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010d8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010e4:	90                   	nop
  8010e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8010ed:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010f1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8010f5:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8010f9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8010fd:	0f b6 12             	movzbl (%rdx),%edx
  801100:	88 10                	mov    %dl,(%rax)
  801102:	0f b6 00             	movzbl (%rax),%eax
  801105:	84 c0                	test   %al,%al
  801107:	75 dc                	jne    8010e5 <strcpy+0x19>
  801109:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80110d:	c9                   	leaveq 
  80110e:	c3                   	retq   

000000000080110f <strcat>:
  80110f:	55                   	push   %rbp
  801110:	48 89 e5             	mov    %rsp,%rbp
  801113:	48 83 ec 20          	sub    $0x20,%rsp
  801117:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80111b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80111f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801123:	48 89 c7             	mov    %rax,%rdi
  801126:	48 b8 60 10 80 00 00 	movabs $0x801060,%rax
  80112d:	00 00 00 
  801130:	ff d0                	callq  *%rax
  801132:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801135:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801138:	48 63 d0             	movslq %eax,%rdx
  80113b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80113f:	48 01 c2             	add    %rax,%rdx
  801142:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801146:	48 89 c6             	mov    %rax,%rsi
  801149:	48 89 d7             	mov    %rdx,%rdi
  80114c:	48 b8 cc 10 80 00 00 	movabs $0x8010cc,%rax
  801153:	00 00 00 
  801156:	ff d0                	callq  *%rax
  801158:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80115c:	c9                   	leaveq 
  80115d:	c3                   	retq   

000000000080115e <strncpy>:
  80115e:	55                   	push   %rbp
  80115f:	48 89 e5             	mov    %rsp,%rbp
  801162:	48 83 ec 28          	sub    $0x28,%rsp
  801166:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80116a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80116e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801172:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801176:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80117a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801181:	00 
  801182:	eb 2a                	jmp    8011ae <strncpy+0x50>
  801184:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801188:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80118c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801190:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801194:	0f b6 12             	movzbl (%rdx),%edx
  801197:	88 10                	mov    %dl,(%rax)
  801199:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80119d:	0f b6 00             	movzbl (%rax),%eax
  8011a0:	84 c0                	test   %al,%al
  8011a2:	74 05                	je     8011a9 <strncpy+0x4b>
  8011a4:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8011a9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011b2:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8011b6:	72 cc                	jb     801184 <strncpy+0x26>
  8011b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011bc:	c9                   	leaveq 
  8011bd:	c3                   	retq   

00000000008011be <strlcpy>:
  8011be:	55                   	push   %rbp
  8011bf:	48 89 e5             	mov    %rsp,%rbp
  8011c2:	48 83 ec 28          	sub    $0x28,%rsp
  8011c6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011ca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011ce:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011d6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011da:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011df:	74 3d                	je     80121e <strlcpy+0x60>
  8011e1:	eb 1d                	jmp    801200 <strlcpy+0x42>
  8011e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011e7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011eb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011ef:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011f3:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011f7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011fb:	0f b6 12             	movzbl (%rdx),%edx
  8011fe:	88 10                	mov    %dl,(%rax)
  801200:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801205:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80120a:	74 0b                	je     801217 <strlcpy+0x59>
  80120c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801210:	0f b6 00             	movzbl (%rax),%eax
  801213:	84 c0                	test   %al,%al
  801215:	75 cc                	jne    8011e3 <strlcpy+0x25>
  801217:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80121b:	c6 00 00             	movb   $0x0,(%rax)
  80121e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801222:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801226:	48 29 c2             	sub    %rax,%rdx
  801229:	48 89 d0             	mov    %rdx,%rax
  80122c:	c9                   	leaveq 
  80122d:	c3                   	retq   

000000000080122e <strcmp>:
  80122e:	55                   	push   %rbp
  80122f:	48 89 e5             	mov    %rsp,%rbp
  801232:	48 83 ec 10          	sub    $0x10,%rsp
  801236:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80123a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80123e:	eb 0a                	jmp    80124a <strcmp+0x1c>
  801240:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801245:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80124a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80124e:	0f b6 00             	movzbl (%rax),%eax
  801251:	84 c0                	test   %al,%al
  801253:	74 12                	je     801267 <strcmp+0x39>
  801255:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801259:	0f b6 10             	movzbl (%rax),%edx
  80125c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801260:	0f b6 00             	movzbl (%rax),%eax
  801263:	38 c2                	cmp    %al,%dl
  801265:	74 d9                	je     801240 <strcmp+0x12>
  801267:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80126b:	0f b6 00             	movzbl (%rax),%eax
  80126e:	0f b6 d0             	movzbl %al,%edx
  801271:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801275:	0f b6 00             	movzbl (%rax),%eax
  801278:	0f b6 c0             	movzbl %al,%eax
  80127b:	29 c2                	sub    %eax,%edx
  80127d:	89 d0                	mov    %edx,%eax
  80127f:	c9                   	leaveq 
  801280:	c3                   	retq   

0000000000801281 <strncmp>:
  801281:	55                   	push   %rbp
  801282:	48 89 e5             	mov    %rsp,%rbp
  801285:	48 83 ec 18          	sub    $0x18,%rsp
  801289:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80128d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801291:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801295:	eb 0f                	jmp    8012a6 <strncmp+0x25>
  801297:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80129c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012a1:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8012a6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012ab:	74 1d                	je     8012ca <strncmp+0x49>
  8012ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b1:	0f b6 00             	movzbl (%rax),%eax
  8012b4:	84 c0                	test   %al,%al
  8012b6:	74 12                	je     8012ca <strncmp+0x49>
  8012b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012bc:	0f b6 10             	movzbl (%rax),%edx
  8012bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012c3:	0f b6 00             	movzbl (%rax),%eax
  8012c6:	38 c2                	cmp    %al,%dl
  8012c8:	74 cd                	je     801297 <strncmp+0x16>
  8012ca:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012cf:	75 07                	jne    8012d8 <strncmp+0x57>
  8012d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8012d6:	eb 18                	jmp    8012f0 <strncmp+0x6f>
  8012d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012dc:	0f b6 00             	movzbl (%rax),%eax
  8012df:	0f b6 d0             	movzbl %al,%edx
  8012e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012e6:	0f b6 00             	movzbl (%rax),%eax
  8012e9:	0f b6 c0             	movzbl %al,%eax
  8012ec:	29 c2                	sub    %eax,%edx
  8012ee:	89 d0                	mov    %edx,%eax
  8012f0:	c9                   	leaveq 
  8012f1:	c3                   	retq   

00000000008012f2 <strchr>:
  8012f2:	55                   	push   %rbp
  8012f3:	48 89 e5             	mov    %rsp,%rbp
  8012f6:	48 83 ec 10          	sub    $0x10,%rsp
  8012fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012fe:	89 f0                	mov    %esi,%eax
  801300:	88 45 f4             	mov    %al,-0xc(%rbp)
  801303:	eb 17                	jmp    80131c <strchr+0x2a>
  801305:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801309:	0f b6 00             	movzbl (%rax),%eax
  80130c:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80130f:	75 06                	jne    801317 <strchr+0x25>
  801311:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801315:	eb 15                	jmp    80132c <strchr+0x3a>
  801317:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80131c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801320:	0f b6 00             	movzbl (%rax),%eax
  801323:	84 c0                	test   %al,%al
  801325:	75 de                	jne    801305 <strchr+0x13>
  801327:	b8 00 00 00 00       	mov    $0x0,%eax
  80132c:	c9                   	leaveq 
  80132d:	c3                   	retq   

000000000080132e <strfind>:
  80132e:	55                   	push   %rbp
  80132f:	48 89 e5             	mov    %rsp,%rbp
  801332:	48 83 ec 10          	sub    $0x10,%rsp
  801336:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80133a:	89 f0                	mov    %esi,%eax
  80133c:	88 45 f4             	mov    %al,-0xc(%rbp)
  80133f:	eb 11                	jmp    801352 <strfind+0x24>
  801341:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801345:	0f b6 00             	movzbl (%rax),%eax
  801348:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80134b:	74 12                	je     80135f <strfind+0x31>
  80134d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801352:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801356:	0f b6 00             	movzbl (%rax),%eax
  801359:	84 c0                	test   %al,%al
  80135b:	75 e4                	jne    801341 <strfind+0x13>
  80135d:	eb 01                	jmp    801360 <strfind+0x32>
  80135f:	90                   	nop
  801360:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801364:	c9                   	leaveq 
  801365:	c3                   	retq   

0000000000801366 <memset>:
  801366:	55                   	push   %rbp
  801367:	48 89 e5             	mov    %rsp,%rbp
  80136a:	48 83 ec 18          	sub    $0x18,%rsp
  80136e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801372:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801375:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801379:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80137e:	75 06                	jne    801386 <memset+0x20>
  801380:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801384:	eb 69                	jmp    8013ef <memset+0x89>
  801386:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80138a:	83 e0 03             	and    $0x3,%eax
  80138d:	48 85 c0             	test   %rax,%rax
  801390:	75 48                	jne    8013da <memset+0x74>
  801392:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801396:	83 e0 03             	and    $0x3,%eax
  801399:	48 85 c0             	test   %rax,%rax
  80139c:	75 3c                	jne    8013da <memset+0x74>
  80139e:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8013a5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013a8:	c1 e0 18             	shl    $0x18,%eax
  8013ab:	89 c2                	mov    %eax,%edx
  8013ad:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013b0:	c1 e0 10             	shl    $0x10,%eax
  8013b3:	09 c2                	or     %eax,%edx
  8013b5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013b8:	c1 e0 08             	shl    $0x8,%eax
  8013bb:	09 d0                	or     %edx,%eax
  8013bd:	09 45 f4             	or     %eax,-0xc(%rbp)
  8013c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013c4:	48 c1 e8 02          	shr    $0x2,%rax
  8013c8:	48 89 c1             	mov    %rax,%rcx
  8013cb:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013cf:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013d2:	48 89 d7             	mov    %rdx,%rdi
  8013d5:	fc                   	cld    
  8013d6:	f3 ab                	rep stos %eax,%es:(%rdi)
  8013d8:	eb 11                	jmp    8013eb <memset+0x85>
  8013da:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013de:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013e1:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8013e5:	48 89 d7             	mov    %rdx,%rdi
  8013e8:	fc                   	cld    
  8013e9:	f3 aa                	rep stos %al,%es:(%rdi)
  8013eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ef:	c9                   	leaveq 
  8013f0:	c3                   	retq   

00000000008013f1 <memmove>:
  8013f1:	55                   	push   %rbp
  8013f2:	48 89 e5             	mov    %rsp,%rbp
  8013f5:	48 83 ec 28          	sub    $0x28,%rsp
  8013f9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013fd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801401:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801405:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801409:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80140d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801411:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801415:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801419:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80141d:	0f 83 88 00 00 00    	jae    8014ab <memmove+0xba>
  801423:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801427:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80142b:	48 01 d0             	add    %rdx,%rax
  80142e:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801432:	76 77                	jbe    8014ab <memmove+0xba>
  801434:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801438:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80143c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801440:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801444:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801448:	83 e0 03             	and    $0x3,%eax
  80144b:	48 85 c0             	test   %rax,%rax
  80144e:	75 3b                	jne    80148b <memmove+0x9a>
  801450:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801454:	83 e0 03             	and    $0x3,%eax
  801457:	48 85 c0             	test   %rax,%rax
  80145a:	75 2f                	jne    80148b <memmove+0x9a>
  80145c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801460:	83 e0 03             	and    $0x3,%eax
  801463:	48 85 c0             	test   %rax,%rax
  801466:	75 23                	jne    80148b <memmove+0x9a>
  801468:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80146c:	48 83 e8 04          	sub    $0x4,%rax
  801470:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801474:	48 83 ea 04          	sub    $0x4,%rdx
  801478:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80147c:	48 c1 e9 02          	shr    $0x2,%rcx
  801480:	48 89 c7             	mov    %rax,%rdi
  801483:	48 89 d6             	mov    %rdx,%rsi
  801486:	fd                   	std    
  801487:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801489:	eb 1d                	jmp    8014a8 <memmove+0xb7>
  80148b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80148f:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801493:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801497:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80149b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80149f:	48 89 d7             	mov    %rdx,%rdi
  8014a2:	48 89 c1             	mov    %rax,%rcx
  8014a5:	fd                   	std    
  8014a6:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014a8:	fc                   	cld    
  8014a9:	eb 57                	jmp    801502 <memmove+0x111>
  8014ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014af:	83 e0 03             	and    $0x3,%eax
  8014b2:	48 85 c0             	test   %rax,%rax
  8014b5:	75 36                	jne    8014ed <memmove+0xfc>
  8014b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014bb:	83 e0 03             	and    $0x3,%eax
  8014be:	48 85 c0             	test   %rax,%rax
  8014c1:	75 2a                	jne    8014ed <memmove+0xfc>
  8014c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014c7:	83 e0 03             	and    $0x3,%eax
  8014ca:	48 85 c0             	test   %rax,%rax
  8014cd:	75 1e                	jne    8014ed <memmove+0xfc>
  8014cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014d3:	48 c1 e8 02          	shr    $0x2,%rax
  8014d7:	48 89 c1             	mov    %rax,%rcx
  8014da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014de:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014e2:	48 89 c7             	mov    %rax,%rdi
  8014e5:	48 89 d6             	mov    %rdx,%rsi
  8014e8:	fc                   	cld    
  8014e9:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8014eb:	eb 15                	jmp    801502 <memmove+0x111>
  8014ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014f1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014f5:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014f9:	48 89 c7             	mov    %rax,%rdi
  8014fc:	48 89 d6             	mov    %rdx,%rsi
  8014ff:	fc                   	cld    
  801500:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801502:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801506:	c9                   	leaveq 
  801507:	c3                   	retq   

0000000000801508 <memcpy>:
  801508:	55                   	push   %rbp
  801509:	48 89 e5             	mov    %rsp,%rbp
  80150c:	48 83 ec 18          	sub    $0x18,%rsp
  801510:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801514:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801518:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80151c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801520:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801524:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801528:	48 89 ce             	mov    %rcx,%rsi
  80152b:	48 89 c7             	mov    %rax,%rdi
  80152e:	48 b8 f1 13 80 00 00 	movabs $0x8013f1,%rax
  801535:	00 00 00 
  801538:	ff d0                	callq  *%rax
  80153a:	c9                   	leaveq 
  80153b:	c3                   	retq   

000000000080153c <memcmp>:
  80153c:	55                   	push   %rbp
  80153d:	48 89 e5             	mov    %rsp,%rbp
  801540:	48 83 ec 28          	sub    $0x28,%rsp
  801544:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801548:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80154c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801550:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801554:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801558:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80155c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801560:	eb 36                	jmp    801598 <memcmp+0x5c>
  801562:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801566:	0f b6 10             	movzbl (%rax),%edx
  801569:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80156d:	0f b6 00             	movzbl (%rax),%eax
  801570:	38 c2                	cmp    %al,%dl
  801572:	74 1a                	je     80158e <memcmp+0x52>
  801574:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801578:	0f b6 00             	movzbl (%rax),%eax
  80157b:	0f b6 d0             	movzbl %al,%edx
  80157e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801582:	0f b6 00             	movzbl (%rax),%eax
  801585:	0f b6 c0             	movzbl %al,%eax
  801588:	29 c2                	sub    %eax,%edx
  80158a:	89 d0                	mov    %edx,%eax
  80158c:	eb 20                	jmp    8015ae <memcmp+0x72>
  80158e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801593:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801598:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80159c:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8015a0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015a4:	48 85 c0             	test   %rax,%rax
  8015a7:	75 b9                	jne    801562 <memcmp+0x26>
  8015a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8015ae:	c9                   	leaveq 
  8015af:	c3                   	retq   

00000000008015b0 <memfind>:
  8015b0:	55                   	push   %rbp
  8015b1:	48 89 e5             	mov    %rsp,%rbp
  8015b4:	48 83 ec 28          	sub    $0x28,%rsp
  8015b8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015bc:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8015bf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015c3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015c7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015cb:	48 01 d0             	add    %rdx,%rax
  8015ce:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015d2:	eb 13                	jmp    8015e7 <memfind+0x37>
  8015d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015d8:	0f b6 00             	movzbl (%rax),%eax
  8015db:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8015de:	38 d0                	cmp    %dl,%al
  8015e0:	74 11                	je     8015f3 <memfind+0x43>
  8015e2:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8015e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015eb:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8015ef:	72 e3                	jb     8015d4 <memfind+0x24>
  8015f1:	eb 01                	jmp    8015f4 <memfind+0x44>
  8015f3:	90                   	nop
  8015f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015f8:	c9                   	leaveq 
  8015f9:	c3                   	retq   

00000000008015fa <strtol>:
  8015fa:	55                   	push   %rbp
  8015fb:	48 89 e5             	mov    %rsp,%rbp
  8015fe:	48 83 ec 38          	sub    $0x38,%rsp
  801602:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801606:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80160a:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80160d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801614:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80161b:	00 
  80161c:	eb 05                	jmp    801623 <strtol+0x29>
  80161e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801623:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801627:	0f b6 00             	movzbl (%rax),%eax
  80162a:	3c 20                	cmp    $0x20,%al
  80162c:	74 f0                	je     80161e <strtol+0x24>
  80162e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801632:	0f b6 00             	movzbl (%rax),%eax
  801635:	3c 09                	cmp    $0x9,%al
  801637:	74 e5                	je     80161e <strtol+0x24>
  801639:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80163d:	0f b6 00             	movzbl (%rax),%eax
  801640:	3c 2b                	cmp    $0x2b,%al
  801642:	75 07                	jne    80164b <strtol+0x51>
  801644:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801649:	eb 17                	jmp    801662 <strtol+0x68>
  80164b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80164f:	0f b6 00             	movzbl (%rax),%eax
  801652:	3c 2d                	cmp    $0x2d,%al
  801654:	75 0c                	jne    801662 <strtol+0x68>
  801656:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80165b:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801662:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801666:	74 06                	je     80166e <strtol+0x74>
  801668:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80166c:	75 28                	jne    801696 <strtol+0x9c>
  80166e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801672:	0f b6 00             	movzbl (%rax),%eax
  801675:	3c 30                	cmp    $0x30,%al
  801677:	75 1d                	jne    801696 <strtol+0x9c>
  801679:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80167d:	48 83 c0 01          	add    $0x1,%rax
  801681:	0f b6 00             	movzbl (%rax),%eax
  801684:	3c 78                	cmp    $0x78,%al
  801686:	75 0e                	jne    801696 <strtol+0x9c>
  801688:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80168d:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801694:	eb 2c                	jmp    8016c2 <strtol+0xc8>
  801696:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80169a:	75 19                	jne    8016b5 <strtol+0xbb>
  80169c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016a0:	0f b6 00             	movzbl (%rax),%eax
  8016a3:	3c 30                	cmp    $0x30,%al
  8016a5:	75 0e                	jne    8016b5 <strtol+0xbb>
  8016a7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016ac:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8016b3:	eb 0d                	jmp    8016c2 <strtol+0xc8>
  8016b5:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016b9:	75 07                	jne    8016c2 <strtol+0xc8>
  8016bb:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8016c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c6:	0f b6 00             	movzbl (%rax),%eax
  8016c9:	3c 2f                	cmp    $0x2f,%al
  8016cb:	7e 1d                	jle    8016ea <strtol+0xf0>
  8016cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016d1:	0f b6 00             	movzbl (%rax),%eax
  8016d4:	3c 39                	cmp    $0x39,%al
  8016d6:	7f 12                	jg     8016ea <strtol+0xf0>
  8016d8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016dc:	0f b6 00             	movzbl (%rax),%eax
  8016df:	0f be c0             	movsbl %al,%eax
  8016e2:	83 e8 30             	sub    $0x30,%eax
  8016e5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016e8:	eb 4e                	jmp    801738 <strtol+0x13e>
  8016ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ee:	0f b6 00             	movzbl (%rax),%eax
  8016f1:	3c 60                	cmp    $0x60,%al
  8016f3:	7e 1d                	jle    801712 <strtol+0x118>
  8016f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016f9:	0f b6 00             	movzbl (%rax),%eax
  8016fc:	3c 7a                	cmp    $0x7a,%al
  8016fe:	7f 12                	jg     801712 <strtol+0x118>
  801700:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801704:	0f b6 00             	movzbl (%rax),%eax
  801707:	0f be c0             	movsbl %al,%eax
  80170a:	83 e8 57             	sub    $0x57,%eax
  80170d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801710:	eb 26                	jmp    801738 <strtol+0x13e>
  801712:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801716:	0f b6 00             	movzbl (%rax),%eax
  801719:	3c 40                	cmp    $0x40,%al
  80171b:	7e 47                	jle    801764 <strtol+0x16a>
  80171d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801721:	0f b6 00             	movzbl (%rax),%eax
  801724:	3c 5a                	cmp    $0x5a,%al
  801726:	7f 3c                	jg     801764 <strtol+0x16a>
  801728:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80172c:	0f b6 00             	movzbl (%rax),%eax
  80172f:	0f be c0             	movsbl %al,%eax
  801732:	83 e8 37             	sub    $0x37,%eax
  801735:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801738:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80173b:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80173e:	7d 23                	jge    801763 <strtol+0x169>
  801740:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801745:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801748:	48 98                	cltq   
  80174a:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80174f:	48 89 c2             	mov    %rax,%rdx
  801752:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801755:	48 98                	cltq   
  801757:	48 01 d0             	add    %rdx,%rax
  80175a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80175e:	e9 5f ff ff ff       	jmpq   8016c2 <strtol+0xc8>
  801763:	90                   	nop
  801764:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801769:	74 0b                	je     801776 <strtol+0x17c>
  80176b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80176f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801773:	48 89 10             	mov    %rdx,(%rax)
  801776:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80177a:	74 09                	je     801785 <strtol+0x18b>
  80177c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801780:	48 f7 d8             	neg    %rax
  801783:	eb 04                	jmp    801789 <strtol+0x18f>
  801785:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801789:	c9                   	leaveq 
  80178a:	c3                   	retq   

000000000080178b <strstr>:
  80178b:	55                   	push   %rbp
  80178c:	48 89 e5             	mov    %rsp,%rbp
  80178f:	48 83 ec 30          	sub    $0x30,%rsp
  801793:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801797:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80179b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80179f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017a3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017a7:	0f b6 00             	movzbl (%rax),%eax
  8017aa:	88 45 ff             	mov    %al,-0x1(%rbp)
  8017ad:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8017b1:	75 06                	jne    8017b9 <strstr+0x2e>
  8017b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017b7:	eb 6b                	jmp    801824 <strstr+0x99>
  8017b9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017bd:	48 89 c7             	mov    %rax,%rdi
  8017c0:	48 b8 60 10 80 00 00 	movabs $0x801060,%rax
  8017c7:	00 00 00 
  8017ca:	ff d0                	callq  *%rax
  8017cc:	48 98                	cltq   
  8017ce:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017d2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017d6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017da:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8017de:	0f b6 00             	movzbl (%rax),%eax
  8017e1:	88 45 ef             	mov    %al,-0x11(%rbp)
  8017e4:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8017e8:	75 07                	jne    8017f1 <strstr+0x66>
  8017ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8017ef:	eb 33                	jmp    801824 <strstr+0x99>
  8017f1:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8017f5:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8017f8:	75 d8                	jne    8017d2 <strstr+0x47>
  8017fa:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017fe:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801802:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801806:	48 89 ce             	mov    %rcx,%rsi
  801809:	48 89 c7             	mov    %rax,%rdi
  80180c:	48 b8 81 12 80 00 00 	movabs $0x801281,%rax
  801813:	00 00 00 
  801816:	ff d0                	callq  *%rax
  801818:	85 c0                	test   %eax,%eax
  80181a:	75 b6                	jne    8017d2 <strstr+0x47>
  80181c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801820:	48 83 e8 01          	sub    $0x1,%rax
  801824:	c9                   	leaveq 
  801825:	c3                   	retq   

0000000000801826 <syscall>:
  801826:	55                   	push   %rbp
  801827:	48 89 e5             	mov    %rsp,%rbp
  80182a:	53                   	push   %rbx
  80182b:	48 83 ec 48          	sub    $0x48,%rsp
  80182f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801832:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801835:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801839:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80183d:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801841:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801845:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801848:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80184c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801850:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801854:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801858:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80185c:	4c 89 c3             	mov    %r8,%rbx
  80185f:	cd 30                	int    $0x30
  801861:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801865:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801869:	74 3e                	je     8018a9 <syscall+0x83>
  80186b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801870:	7e 37                	jle    8018a9 <syscall+0x83>
  801872:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801876:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801879:	49 89 d0             	mov    %rdx,%r8
  80187c:	89 c1                	mov    %eax,%ecx
  80187e:	48 ba e8 52 80 00 00 	movabs $0x8052e8,%rdx
  801885:	00 00 00 
  801888:	be 24 00 00 00       	mov    $0x24,%esi
  80188d:	48 bf 05 53 80 00 00 	movabs $0x805305,%rdi
  801894:	00 00 00 
  801897:	b8 00 00 00 00       	mov    $0x0,%eax
  80189c:	49 b9 02 03 80 00 00 	movabs $0x800302,%r9
  8018a3:	00 00 00 
  8018a6:	41 ff d1             	callq  *%r9
  8018a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018ad:	48 83 c4 48          	add    $0x48,%rsp
  8018b1:	5b                   	pop    %rbx
  8018b2:	5d                   	pop    %rbp
  8018b3:	c3                   	retq   

00000000008018b4 <sys_cputs>:
  8018b4:	55                   	push   %rbp
  8018b5:	48 89 e5             	mov    %rsp,%rbp
  8018b8:	48 83 ec 10          	sub    $0x10,%rsp
  8018bc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8018c0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018c8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018cc:	48 83 ec 08          	sub    $0x8,%rsp
  8018d0:	6a 00                	pushq  $0x0
  8018d2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018d8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018de:	48 89 d1             	mov    %rdx,%rcx
  8018e1:	48 89 c2             	mov    %rax,%rdx
  8018e4:	be 00 00 00 00       	mov    $0x0,%esi
  8018e9:	bf 00 00 00 00       	mov    $0x0,%edi
  8018ee:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  8018f5:	00 00 00 
  8018f8:	ff d0                	callq  *%rax
  8018fa:	48 83 c4 10          	add    $0x10,%rsp
  8018fe:	90                   	nop
  8018ff:	c9                   	leaveq 
  801900:	c3                   	retq   

0000000000801901 <sys_cgetc>:
  801901:	55                   	push   %rbp
  801902:	48 89 e5             	mov    %rsp,%rbp
  801905:	48 83 ec 08          	sub    $0x8,%rsp
  801909:	6a 00                	pushq  $0x0
  80190b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801911:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801917:	b9 00 00 00 00       	mov    $0x0,%ecx
  80191c:	ba 00 00 00 00       	mov    $0x0,%edx
  801921:	be 00 00 00 00       	mov    $0x0,%esi
  801926:	bf 01 00 00 00       	mov    $0x1,%edi
  80192b:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801932:	00 00 00 
  801935:	ff d0                	callq  *%rax
  801937:	48 83 c4 10          	add    $0x10,%rsp
  80193b:	c9                   	leaveq 
  80193c:	c3                   	retq   

000000000080193d <sys_env_destroy>:
  80193d:	55                   	push   %rbp
  80193e:	48 89 e5             	mov    %rsp,%rbp
  801941:	48 83 ec 10          	sub    $0x10,%rsp
  801945:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801948:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80194b:	48 98                	cltq   
  80194d:	48 83 ec 08          	sub    $0x8,%rsp
  801951:	6a 00                	pushq  $0x0
  801953:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801959:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80195f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801964:	48 89 c2             	mov    %rax,%rdx
  801967:	be 01 00 00 00       	mov    $0x1,%esi
  80196c:	bf 03 00 00 00       	mov    $0x3,%edi
  801971:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801978:	00 00 00 
  80197b:	ff d0                	callq  *%rax
  80197d:	48 83 c4 10          	add    $0x10,%rsp
  801981:	c9                   	leaveq 
  801982:	c3                   	retq   

0000000000801983 <sys_getenvid>:
  801983:	55                   	push   %rbp
  801984:	48 89 e5             	mov    %rsp,%rbp
  801987:	48 83 ec 08          	sub    $0x8,%rsp
  80198b:	6a 00                	pushq  $0x0
  80198d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801993:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801999:	b9 00 00 00 00       	mov    $0x0,%ecx
  80199e:	ba 00 00 00 00       	mov    $0x0,%edx
  8019a3:	be 00 00 00 00       	mov    $0x0,%esi
  8019a8:	bf 02 00 00 00       	mov    $0x2,%edi
  8019ad:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  8019b4:	00 00 00 
  8019b7:	ff d0                	callq  *%rax
  8019b9:	48 83 c4 10          	add    $0x10,%rsp
  8019bd:	c9                   	leaveq 
  8019be:	c3                   	retq   

00000000008019bf <sys_yield>:
  8019bf:	55                   	push   %rbp
  8019c0:	48 89 e5             	mov    %rsp,%rbp
  8019c3:	48 83 ec 08          	sub    $0x8,%rsp
  8019c7:	6a 00                	pushq  $0x0
  8019c9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019cf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019d5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019da:	ba 00 00 00 00       	mov    $0x0,%edx
  8019df:	be 00 00 00 00       	mov    $0x0,%esi
  8019e4:	bf 0b 00 00 00       	mov    $0xb,%edi
  8019e9:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  8019f0:	00 00 00 
  8019f3:	ff d0                	callq  *%rax
  8019f5:	48 83 c4 10          	add    $0x10,%rsp
  8019f9:	90                   	nop
  8019fa:	c9                   	leaveq 
  8019fb:	c3                   	retq   

00000000008019fc <sys_page_alloc>:
  8019fc:	55                   	push   %rbp
  8019fd:	48 89 e5             	mov    %rsp,%rbp
  801a00:	48 83 ec 10          	sub    $0x10,%rsp
  801a04:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a07:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a0b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a0e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a11:	48 63 c8             	movslq %eax,%rcx
  801a14:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a1b:	48 98                	cltq   
  801a1d:	48 83 ec 08          	sub    $0x8,%rsp
  801a21:	6a 00                	pushq  $0x0
  801a23:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a29:	49 89 c8             	mov    %rcx,%r8
  801a2c:	48 89 d1             	mov    %rdx,%rcx
  801a2f:	48 89 c2             	mov    %rax,%rdx
  801a32:	be 01 00 00 00       	mov    $0x1,%esi
  801a37:	bf 04 00 00 00       	mov    $0x4,%edi
  801a3c:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801a43:	00 00 00 
  801a46:	ff d0                	callq  *%rax
  801a48:	48 83 c4 10          	add    $0x10,%rsp
  801a4c:	c9                   	leaveq 
  801a4d:	c3                   	retq   

0000000000801a4e <sys_page_map>:
  801a4e:	55                   	push   %rbp
  801a4f:	48 89 e5             	mov    %rsp,%rbp
  801a52:	48 83 ec 20          	sub    $0x20,%rsp
  801a56:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a59:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a5d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a60:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a64:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a68:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a6b:	48 63 c8             	movslq %eax,%rcx
  801a6e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a72:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a75:	48 63 f0             	movslq %eax,%rsi
  801a78:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a7f:	48 98                	cltq   
  801a81:	48 83 ec 08          	sub    $0x8,%rsp
  801a85:	51                   	push   %rcx
  801a86:	49 89 f9             	mov    %rdi,%r9
  801a89:	49 89 f0             	mov    %rsi,%r8
  801a8c:	48 89 d1             	mov    %rdx,%rcx
  801a8f:	48 89 c2             	mov    %rax,%rdx
  801a92:	be 01 00 00 00       	mov    $0x1,%esi
  801a97:	bf 05 00 00 00       	mov    $0x5,%edi
  801a9c:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801aa3:	00 00 00 
  801aa6:	ff d0                	callq  *%rax
  801aa8:	48 83 c4 10          	add    $0x10,%rsp
  801aac:	c9                   	leaveq 
  801aad:	c3                   	retq   

0000000000801aae <sys_page_unmap>:
  801aae:	55                   	push   %rbp
  801aaf:	48 89 e5             	mov    %rsp,%rbp
  801ab2:	48 83 ec 10          	sub    $0x10,%rsp
  801ab6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ab9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801abd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ac1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ac4:	48 98                	cltq   
  801ac6:	48 83 ec 08          	sub    $0x8,%rsp
  801aca:	6a 00                	pushq  $0x0
  801acc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ad2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ad8:	48 89 d1             	mov    %rdx,%rcx
  801adb:	48 89 c2             	mov    %rax,%rdx
  801ade:	be 01 00 00 00       	mov    $0x1,%esi
  801ae3:	bf 06 00 00 00       	mov    $0x6,%edi
  801ae8:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801aef:	00 00 00 
  801af2:	ff d0                	callq  *%rax
  801af4:	48 83 c4 10          	add    $0x10,%rsp
  801af8:	c9                   	leaveq 
  801af9:	c3                   	retq   

0000000000801afa <sys_env_set_status>:
  801afa:	55                   	push   %rbp
  801afb:	48 89 e5             	mov    %rsp,%rbp
  801afe:	48 83 ec 10          	sub    $0x10,%rsp
  801b02:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b05:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801b08:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b0b:	48 63 d0             	movslq %eax,%rdx
  801b0e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b11:	48 98                	cltq   
  801b13:	48 83 ec 08          	sub    $0x8,%rsp
  801b17:	6a 00                	pushq  $0x0
  801b19:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b1f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b25:	48 89 d1             	mov    %rdx,%rcx
  801b28:	48 89 c2             	mov    %rax,%rdx
  801b2b:	be 01 00 00 00       	mov    $0x1,%esi
  801b30:	bf 08 00 00 00       	mov    $0x8,%edi
  801b35:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801b3c:	00 00 00 
  801b3f:	ff d0                	callq  *%rax
  801b41:	48 83 c4 10          	add    $0x10,%rsp
  801b45:	c9                   	leaveq 
  801b46:	c3                   	retq   

0000000000801b47 <sys_env_set_trapframe>:
  801b47:	55                   	push   %rbp
  801b48:	48 89 e5             	mov    %rsp,%rbp
  801b4b:	48 83 ec 10          	sub    $0x10,%rsp
  801b4f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b52:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b56:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b5a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b5d:	48 98                	cltq   
  801b5f:	48 83 ec 08          	sub    $0x8,%rsp
  801b63:	6a 00                	pushq  $0x0
  801b65:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b6b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b71:	48 89 d1             	mov    %rdx,%rcx
  801b74:	48 89 c2             	mov    %rax,%rdx
  801b77:	be 01 00 00 00       	mov    $0x1,%esi
  801b7c:	bf 09 00 00 00       	mov    $0x9,%edi
  801b81:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801b88:	00 00 00 
  801b8b:	ff d0                	callq  *%rax
  801b8d:	48 83 c4 10          	add    $0x10,%rsp
  801b91:	c9                   	leaveq 
  801b92:	c3                   	retq   

0000000000801b93 <sys_env_set_pgfault_upcall>:
  801b93:	55                   	push   %rbp
  801b94:	48 89 e5             	mov    %rsp,%rbp
  801b97:	48 83 ec 10          	sub    $0x10,%rsp
  801b9b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b9e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ba2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ba6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ba9:	48 98                	cltq   
  801bab:	48 83 ec 08          	sub    $0x8,%rsp
  801baf:	6a 00                	pushq  $0x0
  801bb1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bb7:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bbd:	48 89 d1             	mov    %rdx,%rcx
  801bc0:	48 89 c2             	mov    %rax,%rdx
  801bc3:	be 01 00 00 00       	mov    $0x1,%esi
  801bc8:	bf 0a 00 00 00       	mov    $0xa,%edi
  801bcd:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801bd4:	00 00 00 
  801bd7:	ff d0                	callq  *%rax
  801bd9:	48 83 c4 10          	add    $0x10,%rsp
  801bdd:	c9                   	leaveq 
  801bde:	c3                   	retq   

0000000000801bdf <sys_ipc_try_send>:
  801bdf:	55                   	push   %rbp
  801be0:	48 89 e5             	mov    %rsp,%rbp
  801be3:	48 83 ec 20          	sub    $0x20,%rsp
  801be7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bee:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801bf2:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801bf5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bf8:	48 63 f0             	movslq %eax,%rsi
  801bfb:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801bff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c02:	48 98                	cltq   
  801c04:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c08:	48 83 ec 08          	sub    $0x8,%rsp
  801c0c:	6a 00                	pushq  $0x0
  801c0e:	49 89 f1             	mov    %rsi,%r9
  801c11:	49 89 c8             	mov    %rcx,%r8
  801c14:	48 89 d1             	mov    %rdx,%rcx
  801c17:	48 89 c2             	mov    %rax,%rdx
  801c1a:	be 00 00 00 00       	mov    $0x0,%esi
  801c1f:	bf 0c 00 00 00       	mov    $0xc,%edi
  801c24:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801c2b:	00 00 00 
  801c2e:	ff d0                	callq  *%rax
  801c30:	48 83 c4 10          	add    $0x10,%rsp
  801c34:	c9                   	leaveq 
  801c35:	c3                   	retq   

0000000000801c36 <sys_ipc_recv>:
  801c36:	55                   	push   %rbp
  801c37:	48 89 e5             	mov    %rsp,%rbp
  801c3a:	48 83 ec 10          	sub    $0x10,%rsp
  801c3e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c42:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c46:	48 83 ec 08          	sub    $0x8,%rsp
  801c4a:	6a 00                	pushq  $0x0
  801c4c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c52:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c58:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c5d:	48 89 c2             	mov    %rax,%rdx
  801c60:	be 01 00 00 00       	mov    $0x1,%esi
  801c65:	bf 0d 00 00 00       	mov    $0xd,%edi
  801c6a:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801c71:	00 00 00 
  801c74:	ff d0                	callq  *%rax
  801c76:	48 83 c4 10          	add    $0x10,%rsp
  801c7a:	c9                   	leaveq 
  801c7b:	c3                   	retq   

0000000000801c7c <sys_time_msec>:
  801c7c:	55                   	push   %rbp
  801c7d:	48 89 e5             	mov    %rsp,%rbp
  801c80:	48 83 ec 08          	sub    $0x8,%rsp
  801c84:	6a 00                	pushq  $0x0
  801c86:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c8c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c92:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c97:	ba 00 00 00 00       	mov    $0x0,%edx
  801c9c:	be 00 00 00 00       	mov    $0x0,%esi
  801ca1:	bf 0e 00 00 00       	mov    $0xe,%edi
  801ca6:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801cad:	00 00 00 
  801cb0:	ff d0                	callq  *%rax
  801cb2:	48 83 c4 10          	add    $0x10,%rsp
  801cb6:	c9                   	leaveq 
  801cb7:	c3                   	retq   

0000000000801cb8 <sys_net_transmit>:
  801cb8:	55                   	push   %rbp
  801cb9:	48 89 e5             	mov    %rsp,%rbp
  801cbc:	48 83 ec 10          	sub    $0x10,%rsp
  801cc0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cc4:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801cc7:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801cca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cce:	48 83 ec 08          	sub    $0x8,%rsp
  801cd2:	6a 00                	pushq  $0x0
  801cd4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cda:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ce0:	48 89 d1             	mov    %rdx,%rcx
  801ce3:	48 89 c2             	mov    %rax,%rdx
  801ce6:	be 00 00 00 00       	mov    $0x0,%esi
  801ceb:	bf 0f 00 00 00       	mov    $0xf,%edi
  801cf0:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801cf7:	00 00 00 
  801cfa:	ff d0                	callq  *%rax
  801cfc:	48 83 c4 10          	add    $0x10,%rsp
  801d00:	c9                   	leaveq 
  801d01:	c3                   	retq   

0000000000801d02 <sys_net_receive>:
  801d02:	55                   	push   %rbp
  801d03:	48 89 e5             	mov    %rsp,%rbp
  801d06:	48 83 ec 10          	sub    $0x10,%rsp
  801d0a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d0e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d11:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d18:	48 83 ec 08          	sub    $0x8,%rsp
  801d1c:	6a 00                	pushq  $0x0
  801d1e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d24:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d2a:	48 89 d1             	mov    %rdx,%rcx
  801d2d:	48 89 c2             	mov    %rax,%rdx
  801d30:	be 00 00 00 00       	mov    $0x0,%esi
  801d35:	bf 10 00 00 00       	mov    $0x10,%edi
  801d3a:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801d41:	00 00 00 
  801d44:	ff d0                	callq  *%rax
  801d46:	48 83 c4 10          	add    $0x10,%rsp
  801d4a:	c9                   	leaveq 
  801d4b:	c3                   	retq   

0000000000801d4c <sys_ept_map>:
  801d4c:	55                   	push   %rbp
  801d4d:	48 89 e5             	mov    %rsp,%rbp
  801d50:	48 83 ec 20          	sub    $0x20,%rsp
  801d54:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d57:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d5b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d5e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d62:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d66:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d69:	48 63 c8             	movslq %eax,%rcx
  801d6c:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d70:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d73:	48 63 f0             	movslq %eax,%rsi
  801d76:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d7d:	48 98                	cltq   
  801d7f:	48 83 ec 08          	sub    $0x8,%rsp
  801d83:	51                   	push   %rcx
  801d84:	49 89 f9             	mov    %rdi,%r9
  801d87:	49 89 f0             	mov    %rsi,%r8
  801d8a:	48 89 d1             	mov    %rdx,%rcx
  801d8d:	48 89 c2             	mov    %rax,%rdx
  801d90:	be 00 00 00 00       	mov    $0x0,%esi
  801d95:	bf 11 00 00 00       	mov    $0x11,%edi
  801d9a:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801da1:	00 00 00 
  801da4:	ff d0                	callq  *%rax
  801da6:	48 83 c4 10          	add    $0x10,%rsp
  801daa:	c9                   	leaveq 
  801dab:	c3                   	retq   

0000000000801dac <sys_env_mkguest>:
  801dac:	55                   	push   %rbp
  801dad:	48 89 e5             	mov    %rsp,%rbp
  801db0:	48 83 ec 10          	sub    $0x10,%rsp
  801db4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801db8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dbc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dc0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dc4:	48 83 ec 08          	sub    $0x8,%rsp
  801dc8:	6a 00                	pushq  $0x0
  801dca:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dd0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dd6:	48 89 d1             	mov    %rdx,%rcx
  801dd9:	48 89 c2             	mov    %rax,%rdx
  801ddc:	be 00 00 00 00       	mov    $0x0,%esi
  801de1:	bf 12 00 00 00       	mov    $0x12,%edi
  801de6:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  801ded:	00 00 00 
  801df0:	ff d0                	callq  *%rax
  801df2:	48 83 c4 10          	add    $0x10,%rsp
  801df6:	c9                   	leaveq 
  801df7:	c3                   	retq   

0000000000801df8 <fd2num>:
  801df8:	55                   	push   %rbp
  801df9:	48 89 e5             	mov    %rsp,%rbp
  801dfc:	48 83 ec 08          	sub    $0x8,%rsp
  801e00:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e04:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e08:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801e0f:	ff ff ff 
  801e12:	48 01 d0             	add    %rdx,%rax
  801e15:	48 c1 e8 0c          	shr    $0xc,%rax
  801e19:	c9                   	leaveq 
  801e1a:	c3                   	retq   

0000000000801e1b <fd2data>:
  801e1b:	55                   	push   %rbp
  801e1c:	48 89 e5             	mov    %rsp,%rbp
  801e1f:	48 83 ec 08          	sub    $0x8,%rsp
  801e23:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e27:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e2b:	48 89 c7             	mov    %rax,%rdi
  801e2e:	48 b8 f8 1d 80 00 00 	movabs $0x801df8,%rax
  801e35:	00 00 00 
  801e38:	ff d0                	callq  *%rax
  801e3a:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801e40:	48 c1 e0 0c          	shl    $0xc,%rax
  801e44:	c9                   	leaveq 
  801e45:	c3                   	retq   

0000000000801e46 <fd_alloc>:
  801e46:	55                   	push   %rbp
  801e47:	48 89 e5             	mov    %rsp,%rbp
  801e4a:	48 83 ec 18          	sub    $0x18,%rsp
  801e4e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e52:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e59:	eb 6b                	jmp    801ec6 <fd_alloc+0x80>
  801e5b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e5e:	48 98                	cltq   
  801e60:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801e66:	48 c1 e0 0c          	shl    $0xc,%rax
  801e6a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e72:	48 c1 e8 15          	shr    $0x15,%rax
  801e76:	48 89 c2             	mov    %rax,%rdx
  801e79:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801e80:	01 00 00 
  801e83:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e87:	83 e0 01             	and    $0x1,%eax
  801e8a:	48 85 c0             	test   %rax,%rax
  801e8d:	74 21                	je     801eb0 <fd_alloc+0x6a>
  801e8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e93:	48 c1 e8 0c          	shr    $0xc,%rax
  801e97:	48 89 c2             	mov    %rax,%rdx
  801e9a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801ea1:	01 00 00 
  801ea4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801ea8:	83 e0 01             	and    $0x1,%eax
  801eab:	48 85 c0             	test   %rax,%rax
  801eae:	75 12                	jne    801ec2 <fd_alloc+0x7c>
  801eb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801eb4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eb8:	48 89 10             	mov    %rdx,(%rax)
  801ebb:	b8 00 00 00 00       	mov    $0x0,%eax
  801ec0:	eb 1a                	jmp    801edc <fd_alloc+0x96>
  801ec2:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801ec6:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801eca:	7e 8f                	jle    801e5b <fd_alloc+0x15>
  801ecc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ed0:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801ed7:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801edc:	c9                   	leaveq 
  801edd:	c3                   	retq   

0000000000801ede <fd_lookup>:
  801ede:	55                   	push   %rbp
  801edf:	48 89 e5             	mov    %rsp,%rbp
  801ee2:	48 83 ec 20          	sub    $0x20,%rsp
  801ee6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801ee9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801eed:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801ef1:	78 06                	js     801ef9 <fd_lookup+0x1b>
  801ef3:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801ef7:	7e 07                	jle    801f00 <fd_lookup+0x22>
  801ef9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801efe:	eb 6c                	jmp    801f6c <fd_lookup+0x8e>
  801f00:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f03:	48 98                	cltq   
  801f05:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f0b:	48 c1 e0 0c          	shl    $0xc,%rax
  801f0f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801f13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f17:	48 c1 e8 15          	shr    $0x15,%rax
  801f1b:	48 89 c2             	mov    %rax,%rdx
  801f1e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f25:	01 00 00 
  801f28:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f2c:	83 e0 01             	and    $0x1,%eax
  801f2f:	48 85 c0             	test   %rax,%rax
  801f32:	74 21                	je     801f55 <fd_lookup+0x77>
  801f34:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f38:	48 c1 e8 0c          	shr    $0xc,%rax
  801f3c:	48 89 c2             	mov    %rax,%rdx
  801f3f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f46:	01 00 00 
  801f49:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f4d:	83 e0 01             	and    $0x1,%eax
  801f50:	48 85 c0             	test   %rax,%rax
  801f53:	75 07                	jne    801f5c <fd_lookup+0x7e>
  801f55:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f5a:	eb 10                	jmp    801f6c <fd_lookup+0x8e>
  801f5c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f60:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f64:	48 89 10             	mov    %rdx,(%rax)
  801f67:	b8 00 00 00 00       	mov    $0x0,%eax
  801f6c:	c9                   	leaveq 
  801f6d:	c3                   	retq   

0000000000801f6e <fd_close>:
  801f6e:	55                   	push   %rbp
  801f6f:	48 89 e5             	mov    %rsp,%rbp
  801f72:	48 83 ec 30          	sub    $0x30,%rsp
  801f76:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f7a:	89 f0                	mov    %esi,%eax
  801f7c:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801f7f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f83:	48 89 c7             	mov    %rax,%rdi
  801f86:	48 b8 f8 1d 80 00 00 	movabs $0x801df8,%rax
  801f8d:	00 00 00 
  801f90:	ff d0                	callq  *%rax
  801f92:	89 c2                	mov    %eax,%edx
  801f94:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801f98:	48 89 c6             	mov    %rax,%rsi
  801f9b:	89 d7                	mov    %edx,%edi
  801f9d:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  801fa4:	00 00 00 
  801fa7:	ff d0                	callq  *%rax
  801fa9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801fb0:	78 0a                	js     801fbc <fd_close+0x4e>
  801fb2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fb6:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801fba:	74 12                	je     801fce <fd_close+0x60>
  801fbc:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801fc0:	74 05                	je     801fc7 <fd_close+0x59>
  801fc2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fc5:	eb 70                	jmp    802037 <fd_close+0xc9>
  801fc7:	b8 00 00 00 00       	mov    $0x0,%eax
  801fcc:	eb 69                	jmp    802037 <fd_close+0xc9>
  801fce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fd2:	8b 00                	mov    (%rax),%eax
  801fd4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801fd8:	48 89 d6             	mov    %rdx,%rsi
  801fdb:	89 c7                	mov    %eax,%edi
  801fdd:	48 b8 39 20 80 00 00 	movabs $0x802039,%rax
  801fe4:	00 00 00 
  801fe7:	ff d0                	callq  *%rax
  801fe9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fec:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801ff0:	78 2a                	js     80201c <fd_close+0xae>
  801ff2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ff6:	48 8b 40 20          	mov    0x20(%rax),%rax
  801ffa:	48 85 c0             	test   %rax,%rax
  801ffd:	74 16                	je     802015 <fd_close+0xa7>
  801fff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802003:	48 8b 40 20          	mov    0x20(%rax),%rax
  802007:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80200b:	48 89 d7             	mov    %rdx,%rdi
  80200e:	ff d0                	callq  *%rax
  802010:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802013:	eb 07                	jmp    80201c <fd_close+0xae>
  802015:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80201c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802020:	48 89 c6             	mov    %rax,%rsi
  802023:	bf 00 00 00 00       	mov    $0x0,%edi
  802028:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  80202f:	00 00 00 
  802032:	ff d0                	callq  *%rax
  802034:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802037:	c9                   	leaveq 
  802038:	c3                   	retq   

0000000000802039 <dev_lookup>:
  802039:	55                   	push   %rbp
  80203a:	48 89 e5             	mov    %rsp,%rbp
  80203d:	48 83 ec 20          	sub    $0x20,%rsp
  802041:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802044:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802048:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80204f:	eb 41                	jmp    802092 <dev_lookup+0x59>
  802051:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802058:	00 00 00 
  80205b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80205e:	48 63 d2             	movslq %edx,%rdx
  802061:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802065:	8b 00                	mov    (%rax),%eax
  802067:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80206a:	75 22                	jne    80208e <dev_lookup+0x55>
  80206c:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802073:	00 00 00 
  802076:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802079:	48 63 d2             	movslq %edx,%rdx
  80207c:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802080:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802084:	48 89 10             	mov    %rdx,(%rax)
  802087:	b8 00 00 00 00       	mov    $0x0,%eax
  80208c:	eb 60                	jmp    8020ee <dev_lookup+0xb5>
  80208e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802092:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802099:	00 00 00 
  80209c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80209f:	48 63 d2             	movslq %edx,%rdx
  8020a2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020a6:	48 85 c0             	test   %rax,%rax
  8020a9:	75 a6                	jne    802051 <dev_lookup+0x18>
  8020ab:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8020b2:	00 00 00 
  8020b5:	48 8b 00             	mov    (%rax),%rax
  8020b8:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8020be:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8020c1:	89 c6                	mov    %eax,%esi
  8020c3:	48 bf 18 53 80 00 00 	movabs $0x805318,%rdi
  8020ca:	00 00 00 
  8020cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8020d2:	48 b9 3c 05 80 00 00 	movabs $0x80053c,%rcx
  8020d9:	00 00 00 
  8020dc:	ff d1                	callq  *%rcx
  8020de:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020e2:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8020e9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8020ee:	c9                   	leaveq 
  8020ef:	c3                   	retq   

00000000008020f0 <close>:
  8020f0:	55                   	push   %rbp
  8020f1:	48 89 e5             	mov    %rsp,%rbp
  8020f4:	48 83 ec 20          	sub    $0x20,%rsp
  8020f8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020fb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8020ff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802102:	48 89 d6             	mov    %rdx,%rsi
  802105:	89 c7                	mov    %eax,%edi
  802107:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  80210e:	00 00 00 
  802111:	ff d0                	callq  *%rax
  802113:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802116:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80211a:	79 05                	jns    802121 <close+0x31>
  80211c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80211f:	eb 18                	jmp    802139 <close+0x49>
  802121:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802125:	be 01 00 00 00       	mov    $0x1,%esi
  80212a:	48 89 c7             	mov    %rax,%rdi
  80212d:	48 b8 6e 1f 80 00 00 	movabs $0x801f6e,%rax
  802134:	00 00 00 
  802137:	ff d0                	callq  *%rax
  802139:	c9                   	leaveq 
  80213a:	c3                   	retq   

000000000080213b <close_all>:
  80213b:	55                   	push   %rbp
  80213c:	48 89 e5             	mov    %rsp,%rbp
  80213f:	48 83 ec 10          	sub    $0x10,%rsp
  802143:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80214a:	eb 15                	jmp    802161 <close_all+0x26>
  80214c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80214f:	89 c7                	mov    %eax,%edi
  802151:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802158:	00 00 00 
  80215b:	ff d0                	callq  *%rax
  80215d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802161:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802165:	7e e5                	jle    80214c <close_all+0x11>
  802167:	90                   	nop
  802168:	c9                   	leaveq 
  802169:	c3                   	retq   

000000000080216a <dup>:
  80216a:	55                   	push   %rbp
  80216b:	48 89 e5             	mov    %rsp,%rbp
  80216e:	48 83 ec 40          	sub    $0x40,%rsp
  802172:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802175:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802178:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80217c:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80217f:	48 89 d6             	mov    %rdx,%rsi
  802182:	89 c7                	mov    %eax,%edi
  802184:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  80218b:	00 00 00 
  80218e:	ff d0                	callq  *%rax
  802190:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802193:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802197:	79 08                	jns    8021a1 <dup+0x37>
  802199:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80219c:	e9 70 01 00 00       	jmpq   802311 <dup+0x1a7>
  8021a1:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8021a4:	89 c7                	mov    %eax,%edi
  8021a6:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  8021ad:	00 00 00 
  8021b0:	ff d0                	callq  *%rax
  8021b2:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8021b5:	48 98                	cltq   
  8021b7:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8021bd:	48 c1 e0 0c          	shl    $0xc,%rax
  8021c1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8021c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021c9:	48 89 c7             	mov    %rax,%rdi
  8021cc:	48 b8 1b 1e 80 00 00 	movabs $0x801e1b,%rax
  8021d3:	00 00 00 
  8021d6:	ff d0                	callq  *%rax
  8021d8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8021dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021e0:	48 89 c7             	mov    %rax,%rdi
  8021e3:	48 b8 1b 1e 80 00 00 	movabs $0x801e1b,%rax
  8021ea:	00 00 00 
  8021ed:	ff d0                	callq  *%rax
  8021ef:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8021f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021f7:	48 c1 e8 15          	shr    $0x15,%rax
  8021fb:	48 89 c2             	mov    %rax,%rdx
  8021fe:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802205:	01 00 00 
  802208:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80220c:	83 e0 01             	and    $0x1,%eax
  80220f:	48 85 c0             	test   %rax,%rax
  802212:	74 71                	je     802285 <dup+0x11b>
  802214:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802218:	48 c1 e8 0c          	shr    $0xc,%rax
  80221c:	48 89 c2             	mov    %rax,%rdx
  80221f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802226:	01 00 00 
  802229:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80222d:	83 e0 01             	and    $0x1,%eax
  802230:	48 85 c0             	test   %rax,%rax
  802233:	74 50                	je     802285 <dup+0x11b>
  802235:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802239:	48 c1 e8 0c          	shr    $0xc,%rax
  80223d:	48 89 c2             	mov    %rax,%rdx
  802240:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802247:	01 00 00 
  80224a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80224e:	25 07 0e 00 00       	and    $0xe07,%eax
  802253:	89 c1                	mov    %eax,%ecx
  802255:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802259:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80225d:	41 89 c8             	mov    %ecx,%r8d
  802260:	48 89 d1             	mov    %rdx,%rcx
  802263:	ba 00 00 00 00       	mov    $0x0,%edx
  802268:	48 89 c6             	mov    %rax,%rsi
  80226b:	bf 00 00 00 00       	mov    $0x0,%edi
  802270:	48 b8 4e 1a 80 00 00 	movabs $0x801a4e,%rax
  802277:	00 00 00 
  80227a:	ff d0                	callq  *%rax
  80227c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80227f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802283:	78 55                	js     8022da <dup+0x170>
  802285:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802289:	48 c1 e8 0c          	shr    $0xc,%rax
  80228d:	48 89 c2             	mov    %rax,%rdx
  802290:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802297:	01 00 00 
  80229a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80229e:	25 07 0e 00 00       	and    $0xe07,%eax
  8022a3:	89 c1                	mov    %eax,%ecx
  8022a5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022a9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8022ad:	41 89 c8             	mov    %ecx,%r8d
  8022b0:	48 89 d1             	mov    %rdx,%rcx
  8022b3:	ba 00 00 00 00       	mov    $0x0,%edx
  8022b8:	48 89 c6             	mov    %rax,%rsi
  8022bb:	bf 00 00 00 00       	mov    $0x0,%edi
  8022c0:	48 b8 4e 1a 80 00 00 	movabs $0x801a4e,%rax
  8022c7:	00 00 00 
  8022ca:	ff d0                	callq  *%rax
  8022cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022d3:	78 08                	js     8022dd <dup+0x173>
  8022d5:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022d8:	eb 37                	jmp    802311 <dup+0x1a7>
  8022da:	90                   	nop
  8022db:	eb 01                	jmp    8022de <dup+0x174>
  8022dd:	90                   	nop
  8022de:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022e2:	48 89 c6             	mov    %rax,%rsi
  8022e5:	bf 00 00 00 00       	mov    $0x0,%edi
  8022ea:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  8022f1:	00 00 00 
  8022f4:	ff d0                	callq  *%rax
  8022f6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022fa:	48 89 c6             	mov    %rax,%rsi
  8022fd:	bf 00 00 00 00       	mov    $0x0,%edi
  802302:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  802309:	00 00 00 
  80230c:	ff d0                	callq  *%rax
  80230e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802311:	c9                   	leaveq 
  802312:	c3                   	retq   

0000000000802313 <read>:
  802313:	55                   	push   %rbp
  802314:	48 89 e5             	mov    %rsp,%rbp
  802317:	48 83 ec 40          	sub    $0x40,%rsp
  80231b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80231e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802322:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802326:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80232a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80232d:	48 89 d6             	mov    %rdx,%rsi
  802330:	89 c7                	mov    %eax,%edi
  802332:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  802339:	00 00 00 
  80233c:	ff d0                	callq  *%rax
  80233e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802341:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802345:	78 24                	js     80236b <read+0x58>
  802347:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80234b:	8b 00                	mov    (%rax),%eax
  80234d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802351:	48 89 d6             	mov    %rdx,%rsi
  802354:	89 c7                	mov    %eax,%edi
  802356:	48 b8 39 20 80 00 00 	movabs $0x802039,%rax
  80235d:	00 00 00 
  802360:	ff d0                	callq  *%rax
  802362:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802365:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802369:	79 05                	jns    802370 <read+0x5d>
  80236b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80236e:	eb 76                	jmp    8023e6 <read+0xd3>
  802370:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802374:	8b 40 08             	mov    0x8(%rax),%eax
  802377:	83 e0 03             	and    $0x3,%eax
  80237a:	83 f8 01             	cmp    $0x1,%eax
  80237d:	75 3a                	jne    8023b9 <read+0xa6>
  80237f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802386:	00 00 00 
  802389:	48 8b 00             	mov    (%rax),%rax
  80238c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802392:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802395:	89 c6                	mov    %eax,%esi
  802397:	48 bf 37 53 80 00 00 	movabs $0x805337,%rdi
  80239e:	00 00 00 
  8023a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8023a6:	48 b9 3c 05 80 00 00 	movabs $0x80053c,%rcx
  8023ad:	00 00 00 
  8023b0:	ff d1                	callq  *%rcx
  8023b2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8023b7:	eb 2d                	jmp    8023e6 <read+0xd3>
  8023b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023bd:	48 8b 40 10          	mov    0x10(%rax),%rax
  8023c1:	48 85 c0             	test   %rax,%rax
  8023c4:	75 07                	jne    8023cd <read+0xba>
  8023c6:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8023cb:	eb 19                	jmp    8023e6 <read+0xd3>
  8023cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023d1:	48 8b 40 10          	mov    0x10(%rax),%rax
  8023d5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8023d9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8023dd:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8023e1:	48 89 cf             	mov    %rcx,%rdi
  8023e4:	ff d0                	callq  *%rax
  8023e6:	c9                   	leaveq 
  8023e7:	c3                   	retq   

00000000008023e8 <readn>:
  8023e8:	55                   	push   %rbp
  8023e9:	48 89 e5             	mov    %rsp,%rbp
  8023ec:	48 83 ec 30          	sub    $0x30,%rsp
  8023f0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8023f3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8023f7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8023fb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802402:	eb 47                	jmp    80244b <readn+0x63>
  802404:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802407:	48 98                	cltq   
  802409:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80240d:	48 29 c2             	sub    %rax,%rdx
  802410:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802413:	48 63 c8             	movslq %eax,%rcx
  802416:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80241a:	48 01 c1             	add    %rax,%rcx
  80241d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802420:	48 89 ce             	mov    %rcx,%rsi
  802423:	89 c7                	mov    %eax,%edi
  802425:	48 b8 13 23 80 00 00 	movabs $0x802313,%rax
  80242c:	00 00 00 
  80242f:	ff d0                	callq  *%rax
  802431:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802434:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802438:	79 05                	jns    80243f <readn+0x57>
  80243a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80243d:	eb 1d                	jmp    80245c <readn+0x74>
  80243f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802443:	74 13                	je     802458 <readn+0x70>
  802445:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802448:	01 45 fc             	add    %eax,-0x4(%rbp)
  80244b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80244e:	48 98                	cltq   
  802450:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802454:	72 ae                	jb     802404 <readn+0x1c>
  802456:	eb 01                	jmp    802459 <readn+0x71>
  802458:	90                   	nop
  802459:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80245c:	c9                   	leaveq 
  80245d:	c3                   	retq   

000000000080245e <write>:
  80245e:	55                   	push   %rbp
  80245f:	48 89 e5             	mov    %rsp,%rbp
  802462:	48 83 ec 40          	sub    $0x40,%rsp
  802466:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802469:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80246d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802471:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802475:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802478:	48 89 d6             	mov    %rdx,%rsi
  80247b:	89 c7                	mov    %eax,%edi
  80247d:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  802484:	00 00 00 
  802487:	ff d0                	callq  *%rax
  802489:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80248c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802490:	78 24                	js     8024b6 <write+0x58>
  802492:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802496:	8b 00                	mov    (%rax),%eax
  802498:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80249c:	48 89 d6             	mov    %rdx,%rsi
  80249f:	89 c7                	mov    %eax,%edi
  8024a1:	48 b8 39 20 80 00 00 	movabs $0x802039,%rax
  8024a8:	00 00 00 
  8024ab:	ff d0                	callq  *%rax
  8024ad:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8024b0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024b4:	79 05                	jns    8024bb <write+0x5d>
  8024b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024b9:	eb 75                	jmp    802530 <write+0xd2>
  8024bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024bf:	8b 40 08             	mov    0x8(%rax),%eax
  8024c2:	83 e0 03             	and    $0x3,%eax
  8024c5:	85 c0                	test   %eax,%eax
  8024c7:	75 3a                	jne    802503 <write+0xa5>
  8024c9:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8024d0:	00 00 00 
  8024d3:	48 8b 00             	mov    (%rax),%rax
  8024d6:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8024dc:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8024df:	89 c6                	mov    %eax,%esi
  8024e1:	48 bf 53 53 80 00 00 	movabs $0x805353,%rdi
  8024e8:	00 00 00 
  8024eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8024f0:	48 b9 3c 05 80 00 00 	movabs $0x80053c,%rcx
  8024f7:	00 00 00 
  8024fa:	ff d1                	callq  *%rcx
  8024fc:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802501:	eb 2d                	jmp    802530 <write+0xd2>
  802503:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802507:	48 8b 40 18          	mov    0x18(%rax),%rax
  80250b:	48 85 c0             	test   %rax,%rax
  80250e:	75 07                	jne    802517 <write+0xb9>
  802510:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802515:	eb 19                	jmp    802530 <write+0xd2>
  802517:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80251b:	48 8b 40 18          	mov    0x18(%rax),%rax
  80251f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802523:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802527:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80252b:	48 89 cf             	mov    %rcx,%rdi
  80252e:	ff d0                	callq  *%rax
  802530:	c9                   	leaveq 
  802531:	c3                   	retq   

0000000000802532 <seek>:
  802532:	55                   	push   %rbp
  802533:	48 89 e5             	mov    %rsp,%rbp
  802536:	48 83 ec 18          	sub    $0x18,%rsp
  80253a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80253d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802540:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802544:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802547:	48 89 d6             	mov    %rdx,%rsi
  80254a:	89 c7                	mov    %eax,%edi
  80254c:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  802553:	00 00 00 
  802556:	ff d0                	callq  *%rax
  802558:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80255b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80255f:	79 05                	jns    802566 <seek+0x34>
  802561:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802564:	eb 0f                	jmp    802575 <seek+0x43>
  802566:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80256a:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80256d:	89 50 04             	mov    %edx,0x4(%rax)
  802570:	b8 00 00 00 00       	mov    $0x0,%eax
  802575:	c9                   	leaveq 
  802576:	c3                   	retq   

0000000000802577 <ftruncate>:
  802577:	55                   	push   %rbp
  802578:	48 89 e5             	mov    %rsp,%rbp
  80257b:	48 83 ec 30          	sub    $0x30,%rsp
  80257f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802582:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802585:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802589:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80258c:	48 89 d6             	mov    %rdx,%rsi
  80258f:	89 c7                	mov    %eax,%edi
  802591:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  802598:	00 00 00 
  80259b:	ff d0                	callq  *%rax
  80259d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025a0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025a4:	78 24                	js     8025ca <ftruncate+0x53>
  8025a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025aa:	8b 00                	mov    (%rax),%eax
  8025ac:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025b0:	48 89 d6             	mov    %rdx,%rsi
  8025b3:	89 c7                	mov    %eax,%edi
  8025b5:	48 b8 39 20 80 00 00 	movabs $0x802039,%rax
  8025bc:	00 00 00 
  8025bf:	ff d0                	callq  *%rax
  8025c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025c8:	79 05                	jns    8025cf <ftruncate+0x58>
  8025ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025cd:	eb 72                	jmp    802641 <ftruncate+0xca>
  8025cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025d3:	8b 40 08             	mov    0x8(%rax),%eax
  8025d6:	83 e0 03             	and    $0x3,%eax
  8025d9:	85 c0                	test   %eax,%eax
  8025db:	75 3a                	jne    802617 <ftruncate+0xa0>
  8025dd:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8025e4:	00 00 00 
  8025e7:	48 8b 00             	mov    (%rax),%rax
  8025ea:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025f0:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025f3:	89 c6                	mov    %eax,%esi
  8025f5:	48 bf 70 53 80 00 00 	movabs $0x805370,%rdi
  8025fc:	00 00 00 
  8025ff:	b8 00 00 00 00       	mov    $0x0,%eax
  802604:	48 b9 3c 05 80 00 00 	movabs $0x80053c,%rcx
  80260b:	00 00 00 
  80260e:	ff d1                	callq  *%rcx
  802610:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802615:	eb 2a                	jmp    802641 <ftruncate+0xca>
  802617:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80261b:	48 8b 40 30          	mov    0x30(%rax),%rax
  80261f:	48 85 c0             	test   %rax,%rax
  802622:	75 07                	jne    80262b <ftruncate+0xb4>
  802624:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802629:	eb 16                	jmp    802641 <ftruncate+0xca>
  80262b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80262f:	48 8b 40 30          	mov    0x30(%rax),%rax
  802633:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802637:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80263a:	89 ce                	mov    %ecx,%esi
  80263c:	48 89 d7             	mov    %rdx,%rdi
  80263f:	ff d0                	callq  *%rax
  802641:	c9                   	leaveq 
  802642:	c3                   	retq   

0000000000802643 <fstat>:
  802643:	55                   	push   %rbp
  802644:	48 89 e5             	mov    %rsp,%rbp
  802647:	48 83 ec 30          	sub    $0x30,%rsp
  80264b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80264e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802652:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802656:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802659:	48 89 d6             	mov    %rdx,%rsi
  80265c:	89 c7                	mov    %eax,%edi
  80265e:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  802665:	00 00 00 
  802668:	ff d0                	callq  *%rax
  80266a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80266d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802671:	78 24                	js     802697 <fstat+0x54>
  802673:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802677:	8b 00                	mov    (%rax),%eax
  802679:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80267d:	48 89 d6             	mov    %rdx,%rsi
  802680:	89 c7                	mov    %eax,%edi
  802682:	48 b8 39 20 80 00 00 	movabs $0x802039,%rax
  802689:	00 00 00 
  80268c:	ff d0                	callq  *%rax
  80268e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802691:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802695:	79 05                	jns    80269c <fstat+0x59>
  802697:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80269a:	eb 5e                	jmp    8026fa <fstat+0xb7>
  80269c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026a0:	48 8b 40 28          	mov    0x28(%rax),%rax
  8026a4:	48 85 c0             	test   %rax,%rax
  8026a7:	75 07                	jne    8026b0 <fstat+0x6d>
  8026a9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8026ae:	eb 4a                	jmp    8026fa <fstat+0xb7>
  8026b0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026b4:	c6 00 00             	movb   $0x0,(%rax)
  8026b7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026bb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8026c2:	00 00 00 
  8026c5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026c9:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8026d0:	00 00 00 
  8026d3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8026d7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026db:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8026e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026e6:	48 8b 40 28          	mov    0x28(%rax),%rax
  8026ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8026ee:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8026f2:	48 89 ce             	mov    %rcx,%rsi
  8026f5:	48 89 d7             	mov    %rdx,%rdi
  8026f8:	ff d0                	callq  *%rax
  8026fa:	c9                   	leaveq 
  8026fb:	c3                   	retq   

00000000008026fc <stat>:
  8026fc:	55                   	push   %rbp
  8026fd:	48 89 e5             	mov    %rsp,%rbp
  802700:	48 83 ec 20          	sub    $0x20,%rsp
  802704:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802708:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80270c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802710:	be 00 00 00 00       	mov    $0x0,%esi
  802715:	48 89 c7             	mov    %rax,%rdi
  802718:	48 b8 ec 27 80 00 00 	movabs $0x8027ec,%rax
  80271f:	00 00 00 
  802722:	ff d0                	callq  *%rax
  802724:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802727:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80272b:	79 05                	jns    802732 <stat+0x36>
  80272d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802730:	eb 2f                	jmp    802761 <stat+0x65>
  802732:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802736:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802739:	48 89 d6             	mov    %rdx,%rsi
  80273c:	89 c7                	mov    %eax,%edi
  80273e:	48 b8 43 26 80 00 00 	movabs $0x802643,%rax
  802745:	00 00 00 
  802748:	ff d0                	callq  *%rax
  80274a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80274d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802750:	89 c7                	mov    %eax,%edi
  802752:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802759:	00 00 00 
  80275c:	ff d0                	callq  *%rax
  80275e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802761:	c9                   	leaveq 
  802762:	c3                   	retq   

0000000000802763 <fsipc>:
  802763:	55                   	push   %rbp
  802764:	48 89 e5             	mov    %rsp,%rbp
  802767:	48 83 ec 10          	sub    $0x10,%rsp
  80276b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80276e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802772:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802779:	00 00 00 
  80277c:	8b 00                	mov    (%rax),%eax
  80277e:	85 c0                	test   %eax,%eax
  802780:	75 1f                	jne    8027a1 <fsipc+0x3e>
  802782:	bf 01 00 00 00       	mov    $0x1,%edi
  802787:	48 b8 dd 4b 80 00 00 	movabs $0x804bdd,%rax
  80278e:	00 00 00 
  802791:	ff d0                	callq  *%rax
  802793:	89 c2                	mov    %eax,%edx
  802795:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80279c:	00 00 00 
  80279f:	89 10                	mov    %edx,(%rax)
  8027a1:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8027a8:	00 00 00 
  8027ab:	8b 00                	mov    (%rax),%eax
  8027ad:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8027b0:	b9 07 00 00 00       	mov    $0x7,%ecx
  8027b5:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  8027bc:	00 00 00 
  8027bf:	89 c7                	mov    %eax,%edi
  8027c1:	48 b8 d3 4a 80 00 00 	movabs $0x804ad3,%rax
  8027c8:	00 00 00 
  8027cb:	ff d0                	callq  *%rax
  8027cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027d1:	ba 00 00 00 00       	mov    $0x0,%edx
  8027d6:	48 89 c6             	mov    %rax,%rsi
  8027d9:	bf 00 00 00 00       	mov    $0x0,%edi
  8027de:	48 b8 12 4a 80 00 00 	movabs $0x804a12,%rax
  8027e5:	00 00 00 
  8027e8:	ff d0                	callq  *%rax
  8027ea:	c9                   	leaveq 
  8027eb:	c3                   	retq   

00000000008027ec <open>:
  8027ec:	55                   	push   %rbp
  8027ed:	48 89 e5             	mov    %rsp,%rbp
  8027f0:	48 83 ec 20          	sub    $0x20,%rsp
  8027f4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8027f8:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8027fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027ff:	48 89 c7             	mov    %rax,%rdi
  802802:	48 b8 60 10 80 00 00 	movabs $0x801060,%rax
  802809:	00 00 00 
  80280c:	ff d0                	callq  *%rax
  80280e:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802813:	7e 0a                	jle    80281f <open+0x33>
  802815:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80281a:	e9 a5 00 00 00       	jmpq   8028c4 <open+0xd8>
  80281f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802823:	48 89 c7             	mov    %rax,%rdi
  802826:	48 b8 46 1e 80 00 00 	movabs $0x801e46,%rax
  80282d:	00 00 00 
  802830:	ff d0                	callq  *%rax
  802832:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802835:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802839:	79 08                	jns    802843 <open+0x57>
  80283b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80283e:	e9 81 00 00 00       	jmpq   8028c4 <open+0xd8>
  802843:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802847:	48 89 c6             	mov    %rax,%rsi
  80284a:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802851:	00 00 00 
  802854:	48 b8 cc 10 80 00 00 	movabs $0x8010cc,%rax
  80285b:	00 00 00 
  80285e:	ff d0                	callq  *%rax
  802860:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802867:	00 00 00 
  80286a:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80286d:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802873:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802877:	48 89 c6             	mov    %rax,%rsi
  80287a:	bf 01 00 00 00       	mov    $0x1,%edi
  80287f:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  802886:	00 00 00 
  802889:	ff d0                	callq  *%rax
  80288b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80288e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802892:	79 1d                	jns    8028b1 <open+0xc5>
  802894:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802898:	be 00 00 00 00       	mov    $0x0,%esi
  80289d:	48 89 c7             	mov    %rax,%rdi
  8028a0:	48 b8 6e 1f 80 00 00 	movabs $0x801f6e,%rax
  8028a7:	00 00 00 
  8028aa:	ff d0                	callq  *%rax
  8028ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028af:	eb 13                	jmp    8028c4 <open+0xd8>
  8028b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028b5:	48 89 c7             	mov    %rax,%rdi
  8028b8:	48 b8 f8 1d 80 00 00 	movabs $0x801df8,%rax
  8028bf:	00 00 00 
  8028c2:	ff d0                	callq  *%rax
  8028c4:	c9                   	leaveq 
  8028c5:	c3                   	retq   

00000000008028c6 <devfile_flush>:
  8028c6:	55                   	push   %rbp
  8028c7:	48 89 e5             	mov    %rsp,%rbp
  8028ca:	48 83 ec 10          	sub    $0x10,%rsp
  8028ce:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8028d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028d6:	8b 50 0c             	mov    0xc(%rax),%edx
  8028d9:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8028e0:	00 00 00 
  8028e3:	89 10                	mov    %edx,(%rax)
  8028e5:	be 00 00 00 00       	mov    $0x0,%esi
  8028ea:	bf 06 00 00 00       	mov    $0x6,%edi
  8028ef:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  8028f6:	00 00 00 
  8028f9:	ff d0                	callq  *%rax
  8028fb:	c9                   	leaveq 
  8028fc:	c3                   	retq   

00000000008028fd <devfile_read>:
  8028fd:	55                   	push   %rbp
  8028fe:	48 89 e5             	mov    %rsp,%rbp
  802901:	48 83 ec 30          	sub    $0x30,%rsp
  802905:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802909:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80290d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802911:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802915:	8b 50 0c             	mov    0xc(%rax),%edx
  802918:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80291f:	00 00 00 
  802922:	89 10                	mov    %edx,(%rax)
  802924:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80292b:	00 00 00 
  80292e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802932:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802936:	be 00 00 00 00       	mov    $0x0,%esi
  80293b:	bf 03 00 00 00       	mov    $0x3,%edi
  802940:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  802947:	00 00 00 
  80294a:	ff d0                	callq  *%rax
  80294c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80294f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802953:	79 08                	jns    80295d <devfile_read+0x60>
  802955:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802958:	e9 a4 00 00 00       	jmpq   802a01 <devfile_read+0x104>
  80295d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802960:	48 98                	cltq   
  802962:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802966:	76 35                	jbe    80299d <devfile_read+0xa0>
  802968:	48 b9 96 53 80 00 00 	movabs $0x805396,%rcx
  80296f:	00 00 00 
  802972:	48 ba 9d 53 80 00 00 	movabs $0x80539d,%rdx
  802979:	00 00 00 
  80297c:	be 89 00 00 00       	mov    $0x89,%esi
  802981:	48 bf b2 53 80 00 00 	movabs $0x8053b2,%rdi
  802988:	00 00 00 
  80298b:	b8 00 00 00 00       	mov    $0x0,%eax
  802990:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  802997:	00 00 00 
  80299a:	41 ff d0             	callq  *%r8
  80299d:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8029a4:	7e 35                	jle    8029db <devfile_read+0xde>
  8029a6:	48 b9 c0 53 80 00 00 	movabs $0x8053c0,%rcx
  8029ad:	00 00 00 
  8029b0:	48 ba 9d 53 80 00 00 	movabs $0x80539d,%rdx
  8029b7:	00 00 00 
  8029ba:	be 8a 00 00 00       	mov    $0x8a,%esi
  8029bf:	48 bf b2 53 80 00 00 	movabs $0x8053b2,%rdi
  8029c6:	00 00 00 
  8029c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8029ce:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  8029d5:	00 00 00 
  8029d8:	41 ff d0             	callq  *%r8
  8029db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029de:	48 63 d0             	movslq %eax,%rdx
  8029e1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029e5:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8029ec:	00 00 00 
  8029ef:	48 89 c7             	mov    %rax,%rdi
  8029f2:	48 b8 f1 13 80 00 00 	movabs $0x8013f1,%rax
  8029f9:	00 00 00 
  8029fc:	ff d0                	callq  *%rax
  8029fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a01:	c9                   	leaveq 
  802a02:	c3                   	retq   

0000000000802a03 <devfile_write>:
  802a03:	55                   	push   %rbp
  802a04:	48 89 e5             	mov    %rsp,%rbp
  802a07:	48 83 ec 40          	sub    $0x40,%rsp
  802a0b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802a0f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a13:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a17:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802a1b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802a1f:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802a26:	00 
  802a27:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a2b:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802a2f:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802a34:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802a38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a3c:	8b 50 0c             	mov    0xc(%rax),%edx
  802a3f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802a46:	00 00 00 
  802a49:	89 10                	mov    %edx,(%rax)
  802a4b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802a52:	00 00 00 
  802a55:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a59:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802a5d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a61:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a65:	48 89 c6             	mov    %rax,%rsi
  802a68:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  802a6f:	00 00 00 
  802a72:	48 b8 f1 13 80 00 00 	movabs $0x8013f1,%rax
  802a79:	00 00 00 
  802a7c:	ff d0                	callq  *%rax
  802a7e:	be 00 00 00 00       	mov    $0x0,%esi
  802a83:	bf 04 00 00 00       	mov    $0x4,%edi
  802a88:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  802a8f:	00 00 00 
  802a92:	ff d0                	callq  *%rax
  802a94:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802a97:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802a9b:	79 05                	jns    802aa2 <devfile_write+0x9f>
  802a9d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802aa0:	eb 43                	jmp    802ae5 <devfile_write+0xe2>
  802aa2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802aa5:	48 98                	cltq   
  802aa7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802aab:	76 35                	jbe    802ae2 <devfile_write+0xdf>
  802aad:	48 b9 96 53 80 00 00 	movabs $0x805396,%rcx
  802ab4:	00 00 00 
  802ab7:	48 ba 9d 53 80 00 00 	movabs $0x80539d,%rdx
  802abe:	00 00 00 
  802ac1:	be a8 00 00 00       	mov    $0xa8,%esi
  802ac6:	48 bf b2 53 80 00 00 	movabs $0x8053b2,%rdi
  802acd:	00 00 00 
  802ad0:	b8 00 00 00 00       	mov    $0x0,%eax
  802ad5:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  802adc:	00 00 00 
  802adf:	41 ff d0             	callq  *%r8
  802ae2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ae5:	c9                   	leaveq 
  802ae6:	c3                   	retq   

0000000000802ae7 <devfile_stat>:
  802ae7:	55                   	push   %rbp
  802ae8:	48 89 e5             	mov    %rsp,%rbp
  802aeb:	48 83 ec 20          	sub    $0x20,%rsp
  802aef:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802af3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802af7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802afb:	8b 50 0c             	mov    0xc(%rax),%edx
  802afe:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802b05:	00 00 00 
  802b08:	89 10                	mov    %edx,(%rax)
  802b0a:	be 00 00 00 00       	mov    $0x0,%esi
  802b0f:	bf 05 00 00 00       	mov    $0x5,%edi
  802b14:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  802b1b:	00 00 00 
  802b1e:	ff d0                	callq  *%rax
  802b20:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b23:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b27:	79 05                	jns    802b2e <devfile_stat+0x47>
  802b29:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b2c:	eb 56                	jmp    802b84 <devfile_stat+0x9d>
  802b2e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b32:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802b39:	00 00 00 
  802b3c:	48 89 c7             	mov    %rax,%rdi
  802b3f:	48 b8 cc 10 80 00 00 	movabs $0x8010cc,%rax
  802b46:	00 00 00 
  802b49:	ff d0                	callq  *%rax
  802b4b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802b52:	00 00 00 
  802b55:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802b5b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b5f:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802b65:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802b6c:	00 00 00 
  802b6f:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802b75:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b79:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802b7f:	b8 00 00 00 00       	mov    $0x0,%eax
  802b84:	c9                   	leaveq 
  802b85:	c3                   	retq   

0000000000802b86 <devfile_trunc>:
  802b86:	55                   	push   %rbp
  802b87:	48 89 e5             	mov    %rsp,%rbp
  802b8a:	48 83 ec 10          	sub    $0x10,%rsp
  802b8e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b92:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802b95:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b99:	8b 50 0c             	mov    0xc(%rax),%edx
  802b9c:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802ba3:	00 00 00 
  802ba6:	89 10                	mov    %edx,(%rax)
  802ba8:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802baf:	00 00 00 
  802bb2:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802bb5:	89 50 04             	mov    %edx,0x4(%rax)
  802bb8:	be 00 00 00 00       	mov    $0x0,%esi
  802bbd:	bf 02 00 00 00       	mov    $0x2,%edi
  802bc2:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  802bc9:	00 00 00 
  802bcc:	ff d0                	callq  *%rax
  802bce:	c9                   	leaveq 
  802bcf:	c3                   	retq   

0000000000802bd0 <remove>:
  802bd0:	55                   	push   %rbp
  802bd1:	48 89 e5             	mov    %rsp,%rbp
  802bd4:	48 83 ec 10          	sub    $0x10,%rsp
  802bd8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802bdc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802be0:	48 89 c7             	mov    %rax,%rdi
  802be3:	48 b8 60 10 80 00 00 	movabs $0x801060,%rax
  802bea:	00 00 00 
  802bed:	ff d0                	callq  *%rax
  802bef:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802bf4:	7e 07                	jle    802bfd <remove+0x2d>
  802bf6:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802bfb:	eb 33                	jmp    802c30 <remove+0x60>
  802bfd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c01:	48 89 c6             	mov    %rax,%rsi
  802c04:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802c0b:	00 00 00 
  802c0e:	48 b8 cc 10 80 00 00 	movabs $0x8010cc,%rax
  802c15:	00 00 00 
  802c18:	ff d0                	callq  *%rax
  802c1a:	be 00 00 00 00       	mov    $0x0,%esi
  802c1f:	bf 07 00 00 00       	mov    $0x7,%edi
  802c24:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  802c2b:	00 00 00 
  802c2e:	ff d0                	callq  *%rax
  802c30:	c9                   	leaveq 
  802c31:	c3                   	retq   

0000000000802c32 <sync>:
  802c32:	55                   	push   %rbp
  802c33:	48 89 e5             	mov    %rsp,%rbp
  802c36:	be 00 00 00 00       	mov    $0x0,%esi
  802c3b:	bf 08 00 00 00       	mov    $0x8,%edi
  802c40:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  802c47:	00 00 00 
  802c4a:	ff d0                	callq  *%rax
  802c4c:	5d                   	pop    %rbp
  802c4d:	c3                   	retq   

0000000000802c4e <copy>:
  802c4e:	55                   	push   %rbp
  802c4f:	48 89 e5             	mov    %rsp,%rbp
  802c52:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802c59:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802c60:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802c67:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802c6e:	be 00 00 00 00       	mov    $0x0,%esi
  802c73:	48 89 c7             	mov    %rax,%rdi
  802c76:	48 b8 ec 27 80 00 00 	movabs $0x8027ec,%rax
  802c7d:	00 00 00 
  802c80:	ff d0                	callq  *%rax
  802c82:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c85:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c89:	79 28                	jns    802cb3 <copy+0x65>
  802c8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c8e:	89 c6                	mov    %eax,%esi
  802c90:	48 bf cc 53 80 00 00 	movabs $0x8053cc,%rdi
  802c97:	00 00 00 
  802c9a:	b8 00 00 00 00       	mov    $0x0,%eax
  802c9f:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  802ca6:	00 00 00 
  802ca9:	ff d2                	callq  *%rdx
  802cab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cae:	e9 76 01 00 00       	jmpq   802e29 <copy+0x1db>
  802cb3:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802cba:	be 01 01 00 00       	mov    $0x101,%esi
  802cbf:	48 89 c7             	mov    %rax,%rdi
  802cc2:	48 b8 ec 27 80 00 00 	movabs $0x8027ec,%rax
  802cc9:	00 00 00 
  802ccc:	ff d0                	callq  *%rax
  802cce:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802cd1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802cd5:	0f 89 ad 00 00 00    	jns    802d88 <copy+0x13a>
  802cdb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cde:	89 c6                	mov    %eax,%esi
  802ce0:	48 bf e2 53 80 00 00 	movabs $0x8053e2,%rdi
  802ce7:	00 00 00 
  802cea:	b8 00 00 00 00       	mov    $0x0,%eax
  802cef:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  802cf6:	00 00 00 
  802cf9:	ff d2                	callq  *%rdx
  802cfb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cfe:	89 c7                	mov    %eax,%edi
  802d00:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802d07:	00 00 00 
  802d0a:	ff d0                	callq  *%rax
  802d0c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d0f:	e9 15 01 00 00       	jmpq   802e29 <copy+0x1db>
  802d14:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d17:	48 63 d0             	movslq %eax,%rdx
  802d1a:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d21:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d24:	48 89 ce             	mov    %rcx,%rsi
  802d27:	89 c7                	mov    %eax,%edi
  802d29:	48 b8 5e 24 80 00 00 	movabs $0x80245e,%rax
  802d30:	00 00 00 
  802d33:	ff d0                	callq  *%rax
  802d35:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802d38:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802d3c:	79 4a                	jns    802d88 <copy+0x13a>
  802d3e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d41:	89 c6                	mov    %eax,%esi
  802d43:	48 bf fc 53 80 00 00 	movabs $0x8053fc,%rdi
  802d4a:	00 00 00 
  802d4d:	b8 00 00 00 00       	mov    $0x0,%eax
  802d52:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  802d59:	00 00 00 
  802d5c:	ff d2                	callq  *%rdx
  802d5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d61:	89 c7                	mov    %eax,%edi
  802d63:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802d6a:	00 00 00 
  802d6d:	ff d0                	callq  *%rax
  802d6f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d72:	89 c7                	mov    %eax,%edi
  802d74:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802d7b:	00 00 00 
  802d7e:	ff d0                	callq  *%rax
  802d80:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d83:	e9 a1 00 00 00       	jmpq   802e29 <copy+0x1db>
  802d88:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d92:	ba 00 02 00 00       	mov    $0x200,%edx
  802d97:	48 89 ce             	mov    %rcx,%rsi
  802d9a:	89 c7                	mov    %eax,%edi
  802d9c:	48 b8 13 23 80 00 00 	movabs $0x802313,%rax
  802da3:	00 00 00 
  802da6:	ff d0                	callq  *%rax
  802da8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802dab:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802daf:	0f 8f 5f ff ff ff    	jg     802d14 <copy+0xc6>
  802db5:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802db9:	79 47                	jns    802e02 <copy+0x1b4>
  802dbb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802dbe:	89 c6                	mov    %eax,%esi
  802dc0:	48 bf 0f 54 80 00 00 	movabs $0x80540f,%rdi
  802dc7:	00 00 00 
  802dca:	b8 00 00 00 00       	mov    $0x0,%eax
  802dcf:	48 ba 3c 05 80 00 00 	movabs $0x80053c,%rdx
  802dd6:	00 00 00 
  802dd9:	ff d2                	callq  *%rdx
  802ddb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dde:	89 c7                	mov    %eax,%edi
  802de0:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802de7:	00 00 00 
  802dea:	ff d0                	callq  *%rax
  802dec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802def:	89 c7                	mov    %eax,%edi
  802df1:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802df8:	00 00 00 
  802dfb:	ff d0                	callq  *%rax
  802dfd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e00:	eb 27                	jmp    802e29 <copy+0x1db>
  802e02:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e05:	89 c7                	mov    %eax,%edi
  802e07:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802e0e:	00 00 00 
  802e11:	ff d0                	callq  *%rax
  802e13:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e16:	89 c7                	mov    %eax,%edi
  802e18:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802e1f:	00 00 00 
  802e22:	ff d0                	callq  *%rax
  802e24:	b8 00 00 00 00       	mov    $0x0,%eax
  802e29:	c9                   	leaveq 
  802e2a:	c3                   	retq   

0000000000802e2b <spawn>:
  802e2b:	55                   	push   %rbp
  802e2c:	48 89 e5             	mov    %rsp,%rbp
  802e2f:	48 81 ec 00 03 00 00 	sub    $0x300,%rsp
  802e36:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  802e3d:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  802e44:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  802e4b:	be 00 00 00 00       	mov    $0x0,%esi
  802e50:	48 89 c7             	mov    %rax,%rdi
  802e53:	48 b8 ec 27 80 00 00 	movabs $0x8027ec,%rax
  802e5a:	00 00 00 
  802e5d:	ff d0                	callq  *%rax
  802e5f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802e62:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802e66:	79 08                	jns    802e70 <spawn+0x45>
  802e68:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802e6b:	e9 11 03 00 00       	jmpq   803181 <spawn+0x356>
  802e70:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802e73:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  802e76:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  802e7d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  802e81:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  802e88:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802e8b:	ba 00 02 00 00       	mov    $0x200,%edx
  802e90:	48 89 ce             	mov    %rcx,%rsi
  802e93:	89 c7                	mov    %eax,%edi
  802e95:	48 b8 e8 23 80 00 00 	movabs $0x8023e8,%rax
  802e9c:	00 00 00 
  802e9f:	ff d0                	callq  *%rax
  802ea1:	3d 00 02 00 00       	cmp    $0x200,%eax
  802ea6:	75 0d                	jne    802eb5 <spawn+0x8a>
  802ea8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802eac:	8b 00                	mov    (%rax),%eax
  802eae:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  802eb3:	74 43                	je     802ef8 <spawn+0xcd>
  802eb5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  802eb8:	89 c7                	mov    %eax,%edi
  802eba:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  802ec1:	00 00 00 
  802ec4:	ff d0                	callq  *%rax
  802ec6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802eca:	8b 00                	mov    (%rax),%eax
  802ecc:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  802ed1:	89 c6                	mov    %eax,%esi
  802ed3:	48 bf 28 54 80 00 00 	movabs $0x805428,%rdi
  802eda:	00 00 00 
  802edd:	b8 00 00 00 00       	mov    $0x0,%eax
  802ee2:	48 b9 3c 05 80 00 00 	movabs $0x80053c,%rcx
  802ee9:	00 00 00 
  802eec:	ff d1                	callq  *%rcx
  802eee:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  802ef3:	e9 89 02 00 00       	jmpq   803181 <spawn+0x356>
  802ef8:	b8 07 00 00 00       	mov    $0x7,%eax
  802efd:	cd 30                	int    $0x30
  802eff:	89 45 d0             	mov    %eax,-0x30(%rbp)
  802f02:	8b 45 d0             	mov    -0x30(%rbp),%eax
  802f05:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802f08:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802f0c:	79 08                	jns    802f16 <spawn+0xeb>
  802f0e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802f11:	e9 6b 02 00 00       	jmpq   803181 <spawn+0x356>
  802f16:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802f19:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  802f1c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802f1f:	25 ff 03 00 00       	and    $0x3ff,%eax
  802f24:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802f2b:	00 00 00 
  802f2e:	48 98                	cltq   
  802f30:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802f37:	48 01 c2             	add    %rax,%rdx
  802f3a:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  802f41:	48 89 d6             	mov    %rdx,%rsi
  802f44:	ba 18 00 00 00       	mov    $0x18,%edx
  802f49:	48 89 c7             	mov    %rax,%rdi
  802f4c:	48 89 d1             	mov    %rdx,%rcx
  802f4f:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  802f52:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f56:	48 8b 40 18          	mov    0x18(%rax),%rax
  802f5a:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  802f61:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  802f68:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  802f6f:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  802f76:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  802f79:	48 89 ce             	mov    %rcx,%rsi
  802f7c:	89 c7                	mov    %eax,%edi
  802f7e:	48 b8 e5 33 80 00 00 	movabs $0x8033e5,%rax
  802f85:	00 00 00 
  802f88:	ff d0                	callq  *%rax
  802f8a:	89 45 e8             	mov    %eax,-0x18(%rbp)
  802f8d:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  802f91:	79 08                	jns    802f9b <spawn+0x170>
  802f93:	8b 45 e8             	mov    -0x18(%rbp),%eax
  802f96:	e9 e6 01 00 00       	jmpq   803181 <spawn+0x356>
  802f9b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802f9f:	48 8b 40 20          	mov    0x20(%rax),%rax
  802fa3:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  802faa:	48 01 d0             	add    %rdx,%rax
  802fad:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802fb1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802fb8:	e9 80 00 00 00       	jmpq   80303d <spawn+0x212>
  802fbd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fc1:	8b 00                	mov    (%rax),%eax
  802fc3:	83 f8 01             	cmp    $0x1,%eax
  802fc6:	75 6b                	jne    803033 <spawn+0x208>
  802fc8:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  802fcf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fd3:	8b 40 04             	mov    0x4(%rax),%eax
  802fd6:	83 e0 02             	and    $0x2,%eax
  802fd9:	85 c0                	test   %eax,%eax
  802fdb:	74 04                	je     802fe1 <spawn+0x1b6>
  802fdd:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  802fe1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fe5:	48 8b 40 08          	mov    0x8(%rax),%rax
  802fe9:	41 89 c1             	mov    %eax,%r9d
  802fec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ff0:	4c 8b 40 20          	mov    0x20(%rax),%r8
  802ff4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ff8:	48 8b 50 28          	mov    0x28(%rax),%rdx
  802ffc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803000:	48 8b 70 10          	mov    0x10(%rax),%rsi
  803004:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803007:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80300a:	48 83 ec 08          	sub    $0x8,%rsp
  80300e:	8b 7d ec             	mov    -0x14(%rbp),%edi
  803011:	57                   	push   %rdi
  803012:	89 c7                	mov    %eax,%edi
  803014:	48 b8 91 36 80 00 00 	movabs $0x803691,%rax
  80301b:	00 00 00 
  80301e:	ff d0                	callq  *%rax
  803020:	48 83 c4 10          	add    $0x10,%rsp
  803024:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803027:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80302b:	0f 88 2a 01 00 00    	js     80315b <spawn+0x330>
  803031:	eb 01                	jmp    803034 <spawn+0x209>
  803033:	90                   	nop
  803034:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803038:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  80303d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803041:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  803045:	0f b7 c0             	movzwl %ax,%eax
  803048:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  80304b:	0f 8f 6c ff ff ff    	jg     802fbd <spawn+0x192>
  803051:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803054:	89 c7                	mov    %eax,%edi
  803056:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  80305d:	00 00 00 
  803060:	ff d0                	callq  *%rax
  803062:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  803069:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80306c:	89 c7                	mov    %eax,%edi
  80306e:	48 b8 7d 38 80 00 00 	movabs $0x80387d,%rax
  803075:	00 00 00 
  803078:	ff d0                	callq  *%rax
  80307a:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80307d:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803081:	79 30                	jns    8030b3 <spawn+0x288>
  803083:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803086:	89 c1                	mov    %eax,%ecx
  803088:	48 ba 42 54 80 00 00 	movabs $0x805442,%rdx
  80308f:	00 00 00 
  803092:	be 86 00 00 00       	mov    $0x86,%esi
  803097:	48 bf 58 54 80 00 00 	movabs $0x805458,%rdi
  80309e:	00 00 00 
  8030a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8030a6:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  8030ad:	00 00 00 
  8030b0:	41 ff d0             	callq  *%r8
  8030b3:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  8030ba:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8030bd:	48 89 d6             	mov    %rdx,%rsi
  8030c0:	89 c7                	mov    %eax,%edi
  8030c2:	48 b8 47 1b 80 00 00 	movabs $0x801b47,%rax
  8030c9:	00 00 00 
  8030cc:	ff d0                	callq  *%rax
  8030ce:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8030d1:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8030d5:	79 30                	jns    803107 <spawn+0x2dc>
  8030d7:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8030da:	89 c1                	mov    %eax,%ecx
  8030dc:	48 ba 67 54 80 00 00 	movabs $0x805467,%rdx
  8030e3:	00 00 00 
  8030e6:	be 8a 00 00 00       	mov    $0x8a,%esi
  8030eb:	48 bf 58 54 80 00 00 	movabs $0x805458,%rdi
  8030f2:	00 00 00 
  8030f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8030fa:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  803101:	00 00 00 
  803104:	41 ff d0             	callq  *%r8
  803107:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80310a:	be 02 00 00 00       	mov    $0x2,%esi
  80310f:	89 c7                	mov    %eax,%edi
  803111:	48 b8 fa 1a 80 00 00 	movabs $0x801afa,%rax
  803118:	00 00 00 
  80311b:	ff d0                	callq  *%rax
  80311d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803120:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803124:	79 30                	jns    803156 <spawn+0x32b>
  803126:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803129:	89 c1                	mov    %eax,%ecx
  80312b:	48 ba 81 54 80 00 00 	movabs $0x805481,%rdx
  803132:	00 00 00 
  803135:	be 8d 00 00 00       	mov    $0x8d,%esi
  80313a:	48 bf 58 54 80 00 00 	movabs $0x805458,%rdi
  803141:	00 00 00 
  803144:	b8 00 00 00 00       	mov    $0x0,%eax
  803149:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  803150:	00 00 00 
  803153:	41 ff d0             	callq  *%r8
  803156:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  803159:	eb 26                	jmp    803181 <spawn+0x356>
  80315b:	90                   	nop
  80315c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80315f:	89 c7                	mov    %eax,%edi
  803161:	48 b8 3d 19 80 00 00 	movabs $0x80193d,%rax
  803168:	00 00 00 
  80316b:	ff d0                	callq  *%rax
  80316d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803170:	89 c7                	mov    %eax,%edi
  803172:	48 b8 f0 20 80 00 00 	movabs $0x8020f0,%rax
  803179:	00 00 00 
  80317c:	ff d0                	callq  *%rax
  80317e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803181:	c9                   	leaveq 
  803182:	c3                   	retq   

0000000000803183 <spawnl>:
  803183:	55                   	push   %rbp
  803184:	48 89 e5             	mov    %rsp,%rbp
  803187:	41 55                	push   %r13
  803189:	41 54                	push   %r12
  80318b:	53                   	push   %rbx
  80318c:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803193:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  80319a:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  8031a1:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  8031a8:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  8031af:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  8031b6:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  8031bd:	84 c0                	test   %al,%al
  8031bf:	74 26                	je     8031e7 <spawnl+0x64>
  8031c1:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  8031c8:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  8031cf:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  8031d3:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  8031d7:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  8031db:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  8031df:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  8031e3:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  8031e7:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  8031ee:	00 00 00 
  8031f1:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  8031f8:	00 00 00 
  8031fb:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803202:	00 00 00 
  803205:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803209:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803210:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803217:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  80321e:	eb 07                	jmp    803227 <spawnl+0xa4>
  803220:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  803227:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  80322d:	83 f8 30             	cmp    $0x30,%eax
  803230:	73 23                	jae    803255 <spawnl+0xd2>
  803232:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  803239:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  80323f:	89 d2                	mov    %edx,%edx
  803241:	48 01 d0             	add    %rdx,%rax
  803244:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  80324a:	83 c2 08             	add    $0x8,%edx
  80324d:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  803253:	eb 12                	jmp    803267 <spawnl+0xe4>
  803255:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80325c:	48 8d 50 08          	lea    0x8(%rax),%rdx
  803260:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803267:	48 8b 00             	mov    (%rax),%rax
  80326a:	48 85 c0             	test   %rax,%rax
  80326d:	75 b1                	jne    803220 <spawnl+0x9d>
  80326f:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803275:	83 c0 02             	add    $0x2,%eax
  803278:	48 89 e2             	mov    %rsp,%rdx
  80327b:	48 89 d3             	mov    %rdx,%rbx
  80327e:	48 63 d0             	movslq %eax,%rdx
  803281:	48 83 ea 01          	sub    $0x1,%rdx
  803285:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  80328c:	48 63 d0             	movslq %eax,%rdx
  80328f:	49 89 d4             	mov    %rdx,%r12
  803292:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  803298:	48 63 d0             	movslq %eax,%rdx
  80329b:	49 89 d2             	mov    %rdx,%r10
  80329e:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  8032a4:	48 98                	cltq   
  8032a6:	48 c1 e0 03          	shl    $0x3,%rax
  8032aa:	48 8d 50 07          	lea    0x7(%rax),%rdx
  8032ae:	b8 10 00 00 00       	mov    $0x10,%eax
  8032b3:	48 83 e8 01          	sub    $0x1,%rax
  8032b7:	48 01 d0             	add    %rdx,%rax
  8032ba:	be 10 00 00 00       	mov    $0x10,%esi
  8032bf:	ba 00 00 00 00       	mov    $0x0,%edx
  8032c4:	48 f7 f6             	div    %rsi
  8032c7:	48 6b c0 10          	imul   $0x10,%rax,%rax
  8032cb:	48 29 c4             	sub    %rax,%rsp
  8032ce:	48 89 e0             	mov    %rsp,%rax
  8032d1:	48 83 c0 07          	add    $0x7,%rax
  8032d5:	48 c1 e8 03          	shr    $0x3,%rax
  8032d9:	48 c1 e0 03          	shl    $0x3,%rax
  8032dd:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  8032e4:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8032eb:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  8032f2:	48 89 10             	mov    %rdx,(%rax)
  8032f5:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8032fb:	8d 50 01             	lea    0x1(%rax),%edx
  8032fe:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803305:	48 63 d2             	movslq %edx,%rdx
  803308:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  80330f:	00 
  803310:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803317:	00 00 00 
  80331a:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803321:	00 00 00 
  803324:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803328:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  80332f:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803336:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  80333d:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  803344:	00 00 00 
  803347:	eb 60                	jmp    8033a9 <spawnl+0x226>
  803349:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  80334f:	8d 48 01             	lea    0x1(%rax),%ecx
  803352:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  803358:	83 f8 30             	cmp    $0x30,%eax
  80335b:	73 23                	jae    803380 <spawnl+0x1fd>
  80335d:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  803364:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  80336a:	89 d2                	mov    %edx,%edx
  80336c:	48 01 d0             	add    %rdx,%rax
  80336f:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  803375:	83 c2 08             	add    $0x8,%edx
  803378:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  80337e:	eb 12                	jmp    803392 <spawnl+0x20f>
  803380:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803387:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80338b:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803392:	48 8b 10             	mov    (%rax),%rdx
  803395:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80339c:	89 c9                	mov    %ecx,%ecx
  80339e:	48 89 14 c8          	mov    %rdx,(%rax,%rcx,8)
  8033a2:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  8033a9:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8033af:	39 85 28 ff ff ff    	cmp    %eax,-0xd8(%rbp)
  8033b5:	72 92                	jb     803349 <spawnl+0x1c6>
  8033b7:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8033be:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  8033c5:	48 89 d6             	mov    %rdx,%rsi
  8033c8:	48 89 c7             	mov    %rax,%rdi
  8033cb:	48 b8 2b 2e 80 00 00 	movabs $0x802e2b,%rax
  8033d2:	00 00 00 
  8033d5:	ff d0                	callq  *%rax
  8033d7:	48 89 dc             	mov    %rbx,%rsp
  8033da:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  8033de:	5b                   	pop    %rbx
  8033df:	41 5c                	pop    %r12
  8033e1:	41 5d                	pop    %r13
  8033e3:	5d                   	pop    %rbp
  8033e4:	c3                   	retq   

00000000008033e5 <init_stack>:
  8033e5:	55                   	push   %rbp
  8033e6:	48 89 e5             	mov    %rsp,%rbp
  8033e9:	48 83 ec 50          	sub    $0x50,%rsp
  8033ed:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8033f0:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  8033f4:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8033f8:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8033ff:	00 
  803400:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  803407:	eb 33                	jmp    80343c <init_stack+0x57>
  803409:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80340c:	48 98                	cltq   
  80340e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803415:	00 
  803416:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80341a:	48 01 d0             	add    %rdx,%rax
  80341d:	48 8b 00             	mov    (%rax),%rax
  803420:	48 89 c7             	mov    %rax,%rdi
  803423:	48 b8 60 10 80 00 00 	movabs $0x801060,%rax
  80342a:	00 00 00 
  80342d:	ff d0                	callq  *%rax
  80342f:	83 c0 01             	add    $0x1,%eax
  803432:	48 98                	cltq   
  803434:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  803438:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  80343c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80343f:	48 98                	cltq   
  803441:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803448:	00 
  803449:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80344d:	48 01 d0             	add    %rdx,%rax
  803450:	48 8b 00             	mov    (%rax),%rax
  803453:	48 85 c0             	test   %rax,%rax
  803456:	75 b1                	jne    803409 <init_stack+0x24>
  803458:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80345c:	48 f7 d8             	neg    %rax
  80345f:	48 05 00 10 40 00    	add    $0x401000,%rax
  803465:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803469:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80346d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  803471:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803475:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  803479:	48 89 c2             	mov    %rax,%rdx
  80347c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80347f:	83 c0 01             	add    $0x1,%eax
  803482:	c1 e0 03             	shl    $0x3,%eax
  803485:	48 98                	cltq   
  803487:	48 f7 d8             	neg    %rax
  80348a:	48 01 d0             	add    %rdx,%rax
  80348d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  803491:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803495:	48 83 e8 10          	sub    $0x10,%rax
  803499:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  80349f:	77 0a                	ja     8034ab <init_stack+0xc6>
  8034a1:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  8034a6:	e9 e4 01 00 00       	jmpq   80368f <init_stack+0x2aa>
  8034ab:	ba 07 00 00 00       	mov    $0x7,%edx
  8034b0:	be 00 00 40 00       	mov    $0x400000,%esi
  8034b5:	bf 00 00 00 00       	mov    $0x0,%edi
  8034ba:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  8034c1:	00 00 00 
  8034c4:	ff d0                	callq  *%rax
  8034c6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8034c9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8034cd:	79 08                	jns    8034d7 <init_stack+0xf2>
  8034cf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034d2:	e9 b8 01 00 00       	jmpq   80368f <init_stack+0x2aa>
  8034d7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  8034de:	e9 8a 00 00 00       	jmpq   80356d <init_stack+0x188>
  8034e3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8034e6:	48 98                	cltq   
  8034e8:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8034ef:	00 
  8034f0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8034f4:	48 01 d0             	add    %rdx,%rax
  8034f7:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8034fc:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803500:	48 01 ca             	add    %rcx,%rdx
  803503:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  80350a:	48 89 10             	mov    %rdx,(%rax)
  80350d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803510:	48 98                	cltq   
  803512:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803519:	00 
  80351a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80351e:	48 01 d0             	add    %rdx,%rax
  803521:	48 8b 10             	mov    (%rax),%rdx
  803524:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803528:	48 89 d6             	mov    %rdx,%rsi
  80352b:	48 89 c7             	mov    %rax,%rdi
  80352e:	48 b8 cc 10 80 00 00 	movabs $0x8010cc,%rax
  803535:	00 00 00 
  803538:	ff d0                	callq  *%rax
  80353a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80353d:	48 98                	cltq   
  80353f:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803546:	00 
  803547:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80354b:	48 01 d0             	add    %rdx,%rax
  80354e:	48 8b 00             	mov    (%rax),%rax
  803551:	48 89 c7             	mov    %rax,%rdi
  803554:	48 b8 60 10 80 00 00 	movabs $0x801060,%rax
  80355b:	00 00 00 
  80355e:	ff d0                	callq  *%rax
  803560:	83 c0 01             	add    $0x1,%eax
  803563:	48 98                	cltq   
  803565:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  803569:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  80356d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803570:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  803573:	0f 8c 6a ff ff ff    	jl     8034e3 <init_stack+0xfe>
  803579:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80357c:	48 98                	cltq   
  80357e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803585:	00 
  803586:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80358a:	48 01 d0             	add    %rdx,%rax
  80358d:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  803594:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  80359b:	00 
  80359c:	74 35                	je     8035d3 <init_stack+0x1ee>
  80359e:	48 b9 98 54 80 00 00 	movabs $0x805498,%rcx
  8035a5:	00 00 00 
  8035a8:	48 ba be 54 80 00 00 	movabs $0x8054be,%rdx
  8035af:	00 00 00 
  8035b2:	be f6 00 00 00       	mov    $0xf6,%esi
  8035b7:	48 bf 58 54 80 00 00 	movabs $0x805458,%rdi
  8035be:	00 00 00 
  8035c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8035c6:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  8035cd:	00 00 00 
  8035d0:	41 ff d0             	callq  *%r8
  8035d3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8035d7:	48 83 e8 08          	sub    $0x8,%rax
  8035db:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  8035e0:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8035e4:	48 01 ca             	add    %rcx,%rdx
  8035e7:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  8035ee:	48 89 10             	mov    %rdx,(%rax)
  8035f1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8035f5:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  8035f9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8035fc:	48 98                	cltq   
  8035fe:	48 89 02             	mov    %rax,(%rdx)
  803601:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  803606:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80360a:	48 01 d0             	add    %rdx,%rax
  80360d:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803613:	48 89 c2             	mov    %rax,%rdx
  803616:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  80361a:	48 89 10             	mov    %rdx,(%rax)
  80361d:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803620:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  803626:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  80362b:	89 c2                	mov    %eax,%edx
  80362d:	be 00 00 40 00       	mov    $0x400000,%esi
  803632:	bf 00 00 00 00       	mov    $0x0,%edi
  803637:	48 b8 4e 1a 80 00 00 	movabs $0x801a4e,%rax
  80363e:	00 00 00 
  803641:	ff d0                	callq  *%rax
  803643:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803646:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80364a:	78 26                	js     803672 <init_stack+0x28d>
  80364c:	be 00 00 40 00       	mov    $0x400000,%esi
  803651:	bf 00 00 00 00       	mov    $0x0,%edi
  803656:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  80365d:	00 00 00 
  803660:	ff d0                	callq  *%rax
  803662:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803665:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803669:	78 0a                	js     803675 <init_stack+0x290>
  80366b:	b8 00 00 00 00       	mov    $0x0,%eax
  803670:	eb 1d                	jmp    80368f <init_stack+0x2aa>
  803672:	90                   	nop
  803673:	eb 01                	jmp    803676 <init_stack+0x291>
  803675:	90                   	nop
  803676:	be 00 00 40 00       	mov    $0x400000,%esi
  80367b:	bf 00 00 00 00       	mov    $0x0,%edi
  803680:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  803687:	00 00 00 
  80368a:	ff d0                	callq  *%rax
  80368c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80368f:	c9                   	leaveq 
  803690:	c3                   	retq   

0000000000803691 <map_segment>:
  803691:	55                   	push   %rbp
  803692:	48 89 e5             	mov    %rsp,%rbp
  803695:	48 83 ec 50          	sub    $0x50,%rsp
  803699:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80369c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8036a0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8036a4:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  8036a7:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8036ab:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  8036af:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036b3:	25 ff 0f 00 00       	and    $0xfff,%eax
  8036b8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036bb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036bf:	74 21                	je     8036e2 <map_segment+0x51>
  8036c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036c4:	48 98                	cltq   
  8036c6:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  8036ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036cd:	48 98                	cltq   
  8036cf:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  8036d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036d6:	48 98                	cltq   
  8036d8:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  8036dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036df:	29 45 bc             	sub    %eax,-0x44(%rbp)
  8036e2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8036e9:	e9 79 01 00 00       	jmpq   803867 <map_segment+0x1d6>
  8036ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036f1:	48 98                	cltq   
  8036f3:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  8036f7:	72 3c                	jb     803735 <map_segment+0xa4>
  8036f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036fc:	48 63 d0             	movslq %eax,%rdx
  8036ff:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803703:	48 01 d0             	add    %rdx,%rax
  803706:	48 89 c1             	mov    %rax,%rcx
  803709:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80370c:	8b 55 10             	mov    0x10(%rbp),%edx
  80370f:	48 89 ce             	mov    %rcx,%rsi
  803712:	89 c7                	mov    %eax,%edi
  803714:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  80371b:	00 00 00 
  80371e:	ff d0                	callq  *%rax
  803720:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803723:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803727:	0f 89 33 01 00 00    	jns    803860 <map_segment+0x1cf>
  80372d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803730:	e9 46 01 00 00       	jmpq   80387b <map_segment+0x1ea>
  803735:	ba 07 00 00 00       	mov    $0x7,%edx
  80373a:	be 00 00 40 00       	mov    $0x400000,%esi
  80373f:	bf 00 00 00 00       	mov    $0x0,%edi
  803744:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  80374b:	00 00 00 
  80374e:	ff d0                	callq  *%rax
  803750:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803753:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803757:	79 08                	jns    803761 <map_segment+0xd0>
  803759:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80375c:	e9 1a 01 00 00       	jmpq   80387b <map_segment+0x1ea>
  803761:	8b 55 bc             	mov    -0x44(%rbp),%edx
  803764:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803767:	01 c2                	add    %eax,%edx
  803769:	8b 45 d8             	mov    -0x28(%rbp),%eax
  80376c:	89 d6                	mov    %edx,%esi
  80376e:	89 c7                	mov    %eax,%edi
  803770:	48 b8 32 25 80 00 00 	movabs $0x802532,%rax
  803777:	00 00 00 
  80377a:	ff d0                	callq  *%rax
  80377c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80377f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803783:	79 08                	jns    80378d <map_segment+0xfc>
  803785:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803788:	e9 ee 00 00 00       	jmpq   80387b <map_segment+0x1ea>
  80378d:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  803794:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803797:	48 98                	cltq   
  803799:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  80379d:	48 29 c2             	sub    %rax,%rdx
  8037a0:	48 89 d0             	mov    %rdx,%rax
  8037a3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8037a7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8037aa:	48 63 d0             	movslq %eax,%rdx
  8037ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8037b1:	48 39 c2             	cmp    %rax,%rdx
  8037b4:	48 0f 47 d0          	cmova  %rax,%rdx
  8037b8:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8037bb:	be 00 00 40 00       	mov    $0x400000,%esi
  8037c0:	89 c7                	mov    %eax,%edi
  8037c2:	48 b8 e8 23 80 00 00 	movabs $0x8023e8,%rax
  8037c9:	00 00 00 
  8037cc:	ff d0                	callq  *%rax
  8037ce:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8037d1:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8037d5:	79 08                	jns    8037df <map_segment+0x14e>
  8037d7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8037da:	e9 9c 00 00 00       	jmpq   80387b <map_segment+0x1ea>
  8037df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037e2:	48 63 d0             	movslq %eax,%rdx
  8037e5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037e9:	48 01 d0             	add    %rdx,%rax
  8037ec:	48 89 c2             	mov    %rax,%rdx
  8037ef:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8037f2:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  8037f6:	48 89 d1             	mov    %rdx,%rcx
  8037f9:	89 c2                	mov    %eax,%edx
  8037fb:	be 00 00 40 00       	mov    $0x400000,%esi
  803800:	bf 00 00 00 00       	mov    $0x0,%edi
  803805:	48 b8 4e 1a 80 00 00 	movabs $0x801a4e,%rax
  80380c:	00 00 00 
  80380f:	ff d0                	callq  *%rax
  803811:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803814:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803818:	79 30                	jns    80384a <map_segment+0x1b9>
  80381a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80381d:	89 c1                	mov    %eax,%ecx
  80381f:	48 ba d3 54 80 00 00 	movabs $0x8054d3,%rdx
  803826:	00 00 00 
  803829:	be 29 01 00 00       	mov    $0x129,%esi
  80382e:	48 bf 58 54 80 00 00 	movabs $0x805458,%rdi
  803835:	00 00 00 
  803838:	b8 00 00 00 00       	mov    $0x0,%eax
  80383d:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  803844:	00 00 00 
  803847:	41 ff d0             	callq  *%r8
  80384a:	be 00 00 40 00       	mov    $0x400000,%esi
  80384f:	bf 00 00 00 00       	mov    $0x0,%edi
  803854:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  80385b:	00 00 00 
  80385e:	ff d0                	callq  *%rax
  803860:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  803867:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80386a:	48 98                	cltq   
  80386c:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803870:	0f 82 78 fe ff ff    	jb     8036ee <map_segment+0x5d>
  803876:	b8 00 00 00 00       	mov    $0x0,%eax
  80387b:	c9                   	leaveq 
  80387c:	c3                   	retq   

000000000080387d <copy_shared_pages>:
  80387d:	55                   	push   %rbp
  80387e:	48 89 e5             	mov    %rsp,%rbp
  803881:	48 83 ec 30          	sub    $0x30,%rsp
  803885:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803888:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80388f:	00 
  803890:	e9 eb 00 00 00       	jmpq   803980 <copy_shared_pages+0x103>
  803895:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803899:	48 c1 f8 12          	sar    $0x12,%rax
  80389d:	48 89 c2             	mov    %rax,%rdx
  8038a0:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8038a7:	01 00 00 
  8038aa:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8038ae:	83 e0 01             	and    $0x1,%eax
  8038b1:	48 85 c0             	test   %rax,%rax
  8038b4:	74 21                	je     8038d7 <copy_shared_pages+0x5a>
  8038b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038ba:	48 c1 f8 09          	sar    $0x9,%rax
  8038be:	48 89 c2             	mov    %rax,%rdx
  8038c1:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8038c8:	01 00 00 
  8038cb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8038cf:	83 e0 01             	and    $0x1,%eax
  8038d2:	48 85 c0             	test   %rax,%rax
  8038d5:	75 0d                	jne    8038e4 <copy_shared_pages+0x67>
  8038d7:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  8038de:	00 
  8038df:	e9 9c 00 00 00       	jmpq   803980 <copy_shared_pages+0x103>
  8038e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038e8:	48 05 00 02 00 00    	add    $0x200,%rax
  8038ee:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8038f2:	eb 7e                	jmp    803972 <copy_shared_pages+0xf5>
  8038f4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8038fb:	01 00 00 
  8038fe:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803902:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803906:	25 01 04 00 00       	and    $0x401,%eax
  80390b:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  803911:	75 5a                	jne    80396d <copy_shared_pages+0xf0>
  803913:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803917:	48 c1 e0 0c          	shl    $0xc,%rax
  80391b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80391f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803926:	01 00 00 
  803929:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80392d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803931:	25 07 0e 00 00       	and    $0xe07,%eax
  803936:	89 c6                	mov    %eax,%esi
  803938:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80393c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80393f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803943:	41 89 f0             	mov    %esi,%r8d
  803946:	48 89 c6             	mov    %rax,%rsi
  803949:	bf 00 00 00 00       	mov    $0x0,%edi
  80394e:	48 b8 4e 1a 80 00 00 	movabs $0x801a4e,%rax
  803955:	00 00 00 
  803958:	ff d0                	callq  *%rax
  80395a:	48 98                	cltq   
  80395c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803960:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803965:	79 06                	jns    80396d <copy_shared_pages+0xf0>
  803967:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80396b:	eb 28                	jmp    803995 <copy_shared_pages+0x118>
  80396d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803972:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803976:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80397a:	0f 8c 74 ff ff ff    	jl     8038f4 <copy_shared_pages+0x77>
  803980:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803984:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  80398a:	0f 86 05 ff ff ff    	jbe    803895 <copy_shared_pages+0x18>
  803990:	b8 00 00 00 00       	mov    $0x0,%eax
  803995:	c9                   	leaveq 
  803996:	c3                   	retq   

0000000000803997 <fd2sockid>:
  803997:	55                   	push   %rbp
  803998:	48 89 e5             	mov    %rsp,%rbp
  80399b:	48 83 ec 20          	sub    $0x20,%rsp
  80399f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039a2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8039a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039a9:	48 89 d6             	mov    %rdx,%rsi
  8039ac:	89 c7                	mov    %eax,%edi
  8039ae:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  8039b5:	00 00 00 
  8039b8:	ff d0                	callq  *%rax
  8039ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039c1:	79 05                	jns    8039c8 <fd2sockid+0x31>
  8039c3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039c6:	eb 24                	jmp    8039ec <fd2sockid+0x55>
  8039c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039cc:	8b 10                	mov    (%rax),%edx
  8039ce:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  8039d5:	00 00 00 
  8039d8:	8b 00                	mov    (%rax),%eax
  8039da:	39 c2                	cmp    %eax,%edx
  8039dc:	74 07                	je     8039e5 <fd2sockid+0x4e>
  8039de:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8039e3:	eb 07                	jmp    8039ec <fd2sockid+0x55>
  8039e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039e9:	8b 40 0c             	mov    0xc(%rax),%eax
  8039ec:	c9                   	leaveq 
  8039ed:	c3                   	retq   

00000000008039ee <alloc_sockfd>:
  8039ee:	55                   	push   %rbp
  8039ef:	48 89 e5             	mov    %rsp,%rbp
  8039f2:	48 83 ec 20          	sub    $0x20,%rsp
  8039f6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039f9:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8039fd:	48 89 c7             	mov    %rax,%rdi
  803a00:	48 b8 46 1e 80 00 00 	movabs $0x801e46,%rax
  803a07:	00 00 00 
  803a0a:	ff d0                	callq  *%rax
  803a0c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a0f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a13:	78 26                	js     803a3b <alloc_sockfd+0x4d>
  803a15:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a19:	ba 07 04 00 00       	mov    $0x407,%edx
  803a1e:	48 89 c6             	mov    %rax,%rsi
  803a21:	bf 00 00 00 00       	mov    $0x0,%edi
  803a26:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  803a2d:	00 00 00 
  803a30:	ff d0                	callq  *%rax
  803a32:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a35:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a39:	79 16                	jns    803a51 <alloc_sockfd+0x63>
  803a3b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a3e:	89 c7                	mov    %eax,%edi
  803a40:	48 b8 fd 3e 80 00 00 	movabs $0x803efd,%rax
  803a47:	00 00 00 
  803a4a:	ff d0                	callq  *%rax
  803a4c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a4f:	eb 3a                	jmp    803a8b <alloc_sockfd+0x9d>
  803a51:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a55:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803a5c:	00 00 00 
  803a5f:	8b 12                	mov    (%rdx),%edx
  803a61:	89 10                	mov    %edx,(%rax)
  803a63:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a67:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803a6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a72:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803a75:	89 50 0c             	mov    %edx,0xc(%rax)
  803a78:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a7c:	48 89 c7             	mov    %rax,%rdi
  803a7f:	48 b8 f8 1d 80 00 00 	movabs $0x801df8,%rax
  803a86:	00 00 00 
  803a89:	ff d0                	callq  *%rax
  803a8b:	c9                   	leaveq 
  803a8c:	c3                   	retq   

0000000000803a8d <accept>:
  803a8d:	55                   	push   %rbp
  803a8e:	48 89 e5             	mov    %rsp,%rbp
  803a91:	48 83 ec 30          	sub    $0x30,%rsp
  803a95:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a98:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a9c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803aa0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803aa3:	89 c7                	mov    %eax,%edi
  803aa5:	48 b8 97 39 80 00 00 	movabs $0x803997,%rax
  803aac:	00 00 00 
  803aaf:	ff d0                	callq  *%rax
  803ab1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ab4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ab8:	79 05                	jns    803abf <accept+0x32>
  803aba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803abd:	eb 3b                	jmp    803afa <accept+0x6d>
  803abf:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803ac3:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803ac7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aca:	48 89 ce             	mov    %rcx,%rsi
  803acd:	89 c7                	mov    %eax,%edi
  803acf:	48 b8 da 3d 80 00 00 	movabs $0x803dda,%rax
  803ad6:	00 00 00 
  803ad9:	ff d0                	callq  *%rax
  803adb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ade:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ae2:	79 05                	jns    803ae9 <accept+0x5c>
  803ae4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ae7:	eb 11                	jmp    803afa <accept+0x6d>
  803ae9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aec:	89 c7                	mov    %eax,%edi
  803aee:	48 b8 ee 39 80 00 00 	movabs $0x8039ee,%rax
  803af5:	00 00 00 
  803af8:	ff d0                	callq  *%rax
  803afa:	c9                   	leaveq 
  803afb:	c3                   	retq   

0000000000803afc <bind>:
  803afc:	55                   	push   %rbp
  803afd:	48 89 e5             	mov    %rsp,%rbp
  803b00:	48 83 ec 20          	sub    $0x20,%rsp
  803b04:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b07:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b0b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803b0e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b11:	89 c7                	mov    %eax,%edi
  803b13:	48 b8 97 39 80 00 00 	movabs $0x803997,%rax
  803b1a:	00 00 00 
  803b1d:	ff d0                	callq  *%rax
  803b1f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b22:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b26:	79 05                	jns    803b2d <bind+0x31>
  803b28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b2b:	eb 1b                	jmp    803b48 <bind+0x4c>
  803b2d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b30:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803b34:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b37:	48 89 ce             	mov    %rcx,%rsi
  803b3a:	89 c7                	mov    %eax,%edi
  803b3c:	48 b8 59 3e 80 00 00 	movabs $0x803e59,%rax
  803b43:	00 00 00 
  803b46:	ff d0                	callq  *%rax
  803b48:	c9                   	leaveq 
  803b49:	c3                   	retq   

0000000000803b4a <shutdown>:
  803b4a:	55                   	push   %rbp
  803b4b:	48 89 e5             	mov    %rsp,%rbp
  803b4e:	48 83 ec 20          	sub    $0x20,%rsp
  803b52:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b55:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803b58:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b5b:	89 c7                	mov    %eax,%edi
  803b5d:	48 b8 97 39 80 00 00 	movabs $0x803997,%rax
  803b64:	00 00 00 
  803b67:	ff d0                	callq  *%rax
  803b69:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b6c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b70:	79 05                	jns    803b77 <shutdown+0x2d>
  803b72:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b75:	eb 16                	jmp    803b8d <shutdown+0x43>
  803b77:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803b7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b7d:	89 d6                	mov    %edx,%esi
  803b7f:	89 c7                	mov    %eax,%edi
  803b81:	48 b8 bd 3e 80 00 00 	movabs $0x803ebd,%rax
  803b88:	00 00 00 
  803b8b:	ff d0                	callq  *%rax
  803b8d:	c9                   	leaveq 
  803b8e:	c3                   	retq   

0000000000803b8f <devsock_close>:
  803b8f:	55                   	push   %rbp
  803b90:	48 89 e5             	mov    %rsp,%rbp
  803b93:	48 83 ec 10          	sub    $0x10,%rsp
  803b97:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b9b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b9f:	48 89 c7             	mov    %rax,%rdi
  803ba2:	48 b8 4e 4c 80 00 00 	movabs $0x804c4e,%rax
  803ba9:	00 00 00 
  803bac:	ff d0                	callq  *%rax
  803bae:	83 f8 01             	cmp    $0x1,%eax
  803bb1:	75 17                	jne    803bca <devsock_close+0x3b>
  803bb3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803bb7:	8b 40 0c             	mov    0xc(%rax),%eax
  803bba:	89 c7                	mov    %eax,%edi
  803bbc:	48 b8 fd 3e 80 00 00 	movabs $0x803efd,%rax
  803bc3:	00 00 00 
  803bc6:	ff d0                	callq  *%rax
  803bc8:	eb 05                	jmp    803bcf <devsock_close+0x40>
  803bca:	b8 00 00 00 00       	mov    $0x0,%eax
  803bcf:	c9                   	leaveq 
  803bd0:	c3                   	retq   

0000000000803bd1 <connect>:
  803bd1:	55                   	push   %rbp
  803bd2:	48 89 e5             	mov    %rsp,%rbp
  803bd5:	48 83 ec 20          	sub    $0x20,%rsp
  803bd9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bdc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803be0:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803be3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803be6:	89 c7                	mov    %eax,%edi
  803be8:	48 b8 97 39 80 00 00 	movabs $0x803997,%rax
  803bef:	00 00 00 
  803bf2:	ff d0                	callq  *%rax
  803bf4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bf7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bfb:	79 05                	jns    803c02 <connect+0x31>
  803bfd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c00:	eb 1b                	jmp    803c1d <connect+0x4c>
  803c02:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c05:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803c09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c0c:	48 89 ce             	mov    %rcx,%rsi
  803c0f:	89 c7                	mov    %eax,%edi
  803c11:	48 b8 2a 3f 80 00 00 	movabs $0x803f2a,%rax
  803c18:	00 00 00 
  803c1b:	ff d0                	callq  *%rax
  803c1d:	c9                   	leaveq 
  803c1e:	c3                   	retq   

0000000000803c1f <listen>:
  803c1f:	55                   	push   %rbp
  803c20:	48 89 e5             	mov    %rsp,%rbp
  803c23:	48 83 ec 20          	sub    $0x20,%rsp
  803c27:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c2a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803c2d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c30:	89 c7                	mov    %eax,%edi
  803c32:	48 b8 97 39 80 00 00 	movabs $0x803997,%rax
  803c39:	00 00 00 
  803c3c:	ff d0                	callq  *%rax
  803c3e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c41:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c45:	79 05                	jns    803c4c <listen+0x2d>
  803c47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c4a:	eb 16                	jmp    803c62 <listen+0x43>
  803c4c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c52:	89 d6                	mov    %edx,%esi
  803c54:	89 c7                	mov    %eax,%edi
  803c56:	48 b8 8e 3f 80 00 00 	movabs $0x803f8e,%rax
  803c5d:	00 00 00 
  803c60:	ff d0                	callq  *%rax
  803c62:	c9                   	leaveq 
  803c63:	c3                   	retq   

0000000000803c64 <devsock_read>:
  803c64:	55                   	push   %rbp
  803c65:	48 89 e5             	mov    %rsp,%rbp
  803c68:	48 83 ec 20          	sub    $0x20,%rsp
  803c6c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803c70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c74:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803c78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c7c:	89 c2                	mov    %eax,%edx
  803c7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c82:	8b 40 0c             	mov    0xc(%rax),%eax
  803c85:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803c89:	b9 00 00 00 00       	mov    $0x0,%ecx
  803c8e:	89 c7                	mov    %eax,%edi
  803c90:	48 b8 ce 3f 80 00 00 	movabs $0x803fce,%rax
  803c97:	00 00 00 
  803c9a:	ff d0                	callq  *%rax
  803c9c:	c9                   	leaveq 
  803c9d:	c3                   	retq   

0000000000803c9e <devsock_write>:
  803c9e:	55                   	push   %rbp
  803c9f:	48 89 e5             	mov    %rsp,%rbp
  803ca2:	48 83 ec 20          	sub    $0x20,%rsp
  803ca6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803caa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803cae:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803cb2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803cb6:	89 c2                	mov    %eax,%edx
  803cb8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803cbc:	8b 40 0c             	mov    0xc(%rax),%eax
  803cbf:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803cc3:	b9 00 00 00 00       	mov    $0x0,%ecx
  803cc8:	89 c7                	mov    %eax,%edi
  803cca:	48 b8 9a 40 80 00 00 	movabs $0x80409a,%rax
  803cd1:	00 00 00 
  803cd4:	ff d0                	callq  *%rax
  803cd6:	c9                   	leaveq 
  803cd7:	c3                   	retq   

0000000000803cd8 <devsock_stat>:
  803cd8:	55                   	push   %rbp
  803cd9:	48 89 e5             	mov    %rsp,%rbp
  803cdc:	48 83 ec 10          	sub    $0x10,%rsp
  803ce0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ce4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ce8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cec:	48 be f5 54 80 00 00 	movabs $0x8054f5,%rsi
  803cf3:	00 00 00 
  803cf6:	48 89 c7             	mov    %rax,%rdi
  803cf9:	48 b8 cc 10 80 00 00 	movabs $0x8010cc,%rax
  803d00:	00 00 00 
  803d03:	ff d0                	callq  *%rax
  803d05:	b8 00 00 00 00       	mov    $0x0,%eax
  803d0a:	c9                   	leaveq 
  803d0b:	c3                   	retq   

0000000000803d0c <socket>:
  803d0c:	55                   	push   %rbp
  803d0d:	48 89 e5             	mov    %rsp,%rbp
  803d10:	48 83 ec 20          	sub    $0x20,%rsp
  803d14:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d17:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803d1a:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803d1d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803d20:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803d23:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d26:	89 ce                	mov    %ecx,%esi
  803d28:	89 c7                	mov    %eax,%edi
  803d2a:	48 b8 52 41 80 00 00 	movabs $0x804152,%rax
  803d31:	00 00 00 
  803d34:	ff d0                	callq  *%rax
  803d36:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d39:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d3d:	79 05                	jns    803d44 <socket+0x38>
  803d3f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d42:	eb 11                	jmp    803d55 <socket+0x49>
  803d44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d47:	89 c7                	mov    %eax,%edi
  803d49:	48 b8 ee 39 80 00 00 	movabs $0x8039ee,%rax
  803d50:	00 00 00 
  803d53:	ff d0                	callq  *%rax
  803d55:	c9                   	leaveq 
  803d56:	c3                   	retq   

0000000000803d57 <nsipc>:
  803d57:	55                   	push   %rbp
  803d58:	48 89 e5             	mov    %rsp,%rbp
  803d5b:	48 83 ec 10          	sub    $0x10,%rsp
  803d5f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d62:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803d69:	00 00 00 
  803d6c:	8b 00                	mov    (%rax),%eax
  803d6e:	85 c0                	test   %eax,%eax
  803d70:	75 1f                	jne    803d91 <nsipc+0x3a>
  803d72:	bf 02 00 00 00       	mov    $0x2,%edi
  803d77:	48 b8 dd 4b 80 00 00 	movabs $0x804bdd,%rax
  803d7e:	00 00 00 
  803d81:	ff d0                	callq  *%rax
  803d83:	89 c2                	mov    %eax,%edx
  803d85:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803d8c:	00 00 00 
  803d8f:	89 10                	mov    %edx,(%rax)
  803d91:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803d98:	00 00 00 
  803d9b:	8b 00                	mov    (%rax),%eax
  803d9d:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803da0:	b9 07 00 00 00       	mov    $0x7,%ecx
  803da5:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803dac:	00 00 00 
  803daf:	89 c7                	mov    %eax,%edi
  803db1:	48 b8 d3 4a 80 00 00 	movabs $0x804ad3,%rax
  803db8:	00 00 00 
  803dbb:	ff d0                	callq  *%rax
  803dbd:	ba 00 00 00 00       	mov    $0x0,%edx
  803dc2:	be 00 00 00 00       	mov    $0x0,%esi
  803dc7:	bf 00 00 00 00       	mov    $0x0,%edi
  803dcc:	48 b8 12 4a 80 00 00 	movabs $0x804a12,%rax
  803dd3:	00 00 00 
  803dd6:	ff d0                	callq  *%rax
  803dd8:	c9                   	leaveq 
  803dd9:	c3                   	retq   

0000000000803dda <nsipc_accept>:
  803dda:	55                   	push   %rbp
  803ddb:	48 89 e5             	mov    %rsp,%rbp
  803dde:	48 83 ec 30          	sub    $0x30,%rsp
  803de2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803de5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803de9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803ded:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803df4:	00 00 00 
  803df7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803dfa:	89 10                	mov    %edx,(%rax)
  803dfc:	bf 01 00 00 00       	mov    $0x1,%edi
  803e01:	48 b8 57 3d 80 00 00 	movabs $0x803d57,%rax
  803e08:	00 00 00 
  803e0b:	ff d0                	callq  *%rax
  803e0d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e10:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e14:	78 3e                	js     803e54 <nsipc_accept+0x7a>
  803e16:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e1d:	00 00 00 
  803e20:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803e24:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e28:	8b 40 10             	mov    0x10(%rax),%eax
  803e2b:	89 c2                	mov    %eax,%edx
  803e2d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803e31:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e35:	48 89 ce             	mov    %rcx,%rsi
  803e38:	48 89 c7             	mov    %rax,%rdi
  803e3b:	48 b8 f1 13 80 00 00 	movabs $0x8013f1,%rax
  803e42:	00 00 00 
  803e45:	ff d0                	callq  *%rax
  803e47:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e4b:	8b 50 10             	mov    0x10(%rax),%edx
  803e4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e52:	89 10                	mov    %edx,(%rax)
  803e54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e57:	c9                   	leaveq 
  803e58:	c3                   	retq   

0000000000803e59 <nsipc_bind>:
  803e59:	55                   	push   %rbp
  803e5a:	48 89 e5             	mov    %rsp,%rbp
  803e5d:	48 83 ec 10          	sub    $0x10,%rsp
  803e61:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e64:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e68:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803e6b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e72:	00 00 00 
  803e75:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803e78:	89 10                	mov    %edx,(%rax)
  803e7a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e81:	48 89 c6             	mov    %rax,%rsi
  803e84:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803e8b:	00 00 00 
  803e8e:	48 b8 f1 13 80 00 00 	movabs $0x8013f1,%rax
  803e95:	00 00 00 
  803e98:	ff d0                	callq  *%rax
  803e9a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ea1:	00 00 00 
  803ea4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ea7:	89 50 14             	mov    %edx,0x14(%rax)
  803eaa:	bf 02 00 00 00       	mov    $0x2,%edi
  803eaf:	48 b8 57 3d 80 00 00 	movabs $0x803d57,%rax
  803eb6:	00 00 00 
  803eb9:	ff d0                	callq  *%rax
  803ebb:	c9                   	leaveq 
  803ebc:	c3                   	retq   

0000000000803ebd <nsipc_shutdown>:
  803ebd:	55                   	push   %rbp
  803ebe:	48 89 e5             	mov    %rsp,%rbp
  803ec1:	48 83 ec 10          	sub    $0x10,%rsp
  803ec5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ec8:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803ecb:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ed2:	00 00 00 
  803ed5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ed8:	89 10                	mov    %edx,(%rax)
  803eda:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ee1:	00 00 00 
  803ee4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ee7:	89 50 04             	mov    %edx,0x4(%rax)
  803eea:	bf 03 00 00 00       	mov    $0x3,%edi
  803eef:	48 b8 57 3d 80 00 00 	movabs $0x803d57,%rax
  803ef6:	00 00 00 
  803ef9:	ff d0                	callq  *%rax
  803efb:	c9                   	leaveq 
  803efc:	c3                   	retq   

0000000000803efd <nsipc_close>:
  803efd:	55                   	push   %rbp
  803efe:	48 89 e5             	mov    %rsp,%rbp
  803f01:	48 83 ec 10          	sub    $0x10,%rsp
  803f05:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f08:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f0f:	00 00 00 
  803f12:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f15:	89 10                	mov    %edx,(%rax)
  803f17:	bf 04 00 00 00       	mov    $0x4,%edi
  803f1c:	48 b8 57 3d 80 00 00 	movabs $0x803d57,%rax
  803f23:	00 00 00 
  803f26:	ff d0                	callq  *%rax
  803f28:	c9                   	leaveq 
  803f29:	c3                   	retq   

0000000000803f2a <nsipc_connect>:
  803f2a:	55                   	push   %rbp
  803f2b:	48 89 e5             	mov    %rsp,%rbp
  803f2e:	48 83 ec 10          	sub    $0x10,%rsp
  803f32:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f35:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803f39:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803f3c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f43:	00 00 00 
  803f46:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803f49:	89 10                	mov    %edx,(%rax)
  803f4b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f52:	48 89 c6             	mov    %rax,%rsi
  803f55:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803f5c:	00 00 00 
  803f5f:	48 b8 f1 13 80 00 00 	movabs $0x8013f1,%rax
  803f66:	00 00 00 
  803f69:	ff d0                	callq  *%rax
  803f6b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803f72:	00 00 00 
  803f75:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803f78:	89 50 14             	mov    %edx,0x14(%rax)
  803f7b:	bf 05 00 00 00       	mov    $0x5,%edi
  803f80:	48 b8 57 3d 80 00 00 	movabs $0x803d57,%rax
  803f87:	00 00 00 
  803f8a:	ff d0                	callq  *%rax
  803f8c:	c9                   	leaveq 
  803f8d:	c3                   	retq   

0000000000803f8e <nsipc_listen>:
  803f8e:	55                   	push   %rbp
  803f8f:	48 89 e5             	mov    %rsp,%rbp
  803f92:	48 83 ec 10          	sub    $0x10,%rsp
  803f96:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803f99:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803f9c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fa3:	00 00 00 
  803fa6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803fa9:	89 10                	mov    %edx,(%rax)
  803fab:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fb2:	00 00 00 
  803fb5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803fb8:	89 50 04             	mov    %edx,0x4(%rax)
  803fbb:	bf 06 00 00 00       	mov    $0x6,%edi
  803fc0:	48 b8 57 3d 80 00 00 	movabs $0x803d57,%rax
  803fc7:	00 00 00 
  803fca:	ff d0                	callq  *%rax
  803fcc:	c9                   	leaveq 
  803fcd:	c3                   	retq   

0000000000803fce <nsipc_recv>:
  803fce:	55                   	push   %rbp
  803fcf:	48 89 e5             	mov    %rsp,%rbp
  803fd2:	48 83 ec 30          	sub    $0x30,%rsp
  803fd6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803fd9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803fdd:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803fe0:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803fe3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803fea:	00 00 00 
  803fed:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803ff0:	89 10                	mov    %edx,(%rax)
  803ff2:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ff9:	00 00 00 
  803ffc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803fff:	89 50 04             	mov    %edx,0x4(%rax)
  804002:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804009:	00 00 00 
  80400c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80400f:	89 50 08             	mov    %edx,0x8(%rax)
  804012:	bf 07 00 00 00       	mov    $0x7,%edi
  804017:	48 b8 57 3d 80 00 00 	movabs $0x803d57,%rax
  80401e:	00 00 00 
  804021:	ff d0                	callq  *%rax
  804023:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804026:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80402a:	78 69                	js     804095 <nsipc_recv+0xc7>
  80402c:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  804033:	7f 08                	jg     80403d <nsipc_recv+0x6f>
  804035:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804038:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80403b:	7e 35                	jle    804072 <nsipc_recv+0xa4>
  80403d:	48 b9 fc 54 80 00 00 	movabs $0x8054fc,%rcx
  804044:	00 00 00 
  804047:	48 ba 11 55 80 00 00 	movabs $0x805511,%rdx
  80404e:	00 00 00 
  804051:	be 62 00 00 00       	mov    $0x62,%esi
  804056:	48 bf 26 55 80 00 00 	movabs $0x805526,%rdi
  80405d:	00 00 00 
  804060:	b8 00 00 00 00       	mov    $0x0,%eax
  804065:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  80406c:	00 00 00 
  80406f:	41 ff d0             	callq  *%r8
  804072:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804075:	48 63 d0             	movslq %eax,%rdx
  804078:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80407c:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  804083:	00 00 00 
  804086:	48 89 c7             	mov    %rax,%rdi
  804089:	48 b8 f1 13 80 00 00 	movabs $0x8013f1,%rax
  804090:	00 00 00 
  804093:	ff d0                	callq  *%rax
  804095:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804098:	c9                   	leaveq 
  804099:	c3                   	retq   

000000000080409a <nsipc_send>:
  80409a:	55                   	push   %rbp
  80409b:	48 89 e5             	mov    %rsp,%rbp
  80409e:	48 83 ec 20          	sub    $0x20,%rsp
  8040a2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8040a5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8040a9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8040ac:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8040af:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8040b6:	00 00 00 
  8040b9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8040bc:	89 10                	mov    %edx,(%rax)
  8040be:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8040c5:	7e 35                	jle    8040fc <nsipc_send+0x62>
  8040c7:	48 b9 35 55 80 00 00 	movabs $0x805535,%rcx
  8040ce:	00 00 00 
  8040d1:	48 ba 11 55 80 00 00 	movabs $0x805511,%rdx
  8040d8:	00 00 00 
  8040db:	be 6d 00 00 00       	mov    $0x6d,%esi
  8040e0:	48 bf 26 55 80 00 00 	movabs $0x805526,%rdi
  8040e7:	00 00 00 
  8040ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8040ef:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  8040f6:	00 00 00 
  8040f9:	41 ff d0             	callq  *%r8
  8040fc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8040ff:	48 63 d0             	movslq %eax,%rdx
  804102:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804106:	48 89 c6             	mov    %rax,%rsi
  804109:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  804110:	00 00 00 
  804113:	48 b8 f1 13 80 00 00 	movabs $0x8013f1,%rax
  80411a:	00 00 00 
  80411d:	ff d0                	callq  *%rax
  80411f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804126:	00 00 00 
  804129:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80412c:	89 50 04             	mov    %edx,0x4(%rax)
  80412f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804136:	00 00 00 
  804139:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80413c:	89 50 08             	mov    %edx,0x8(%rax)
  80413f:	bf 08 00 00 00       	mov    $0x8,%edi
  804144:	48 b8 57 3d 80 00 00 	movabs $0x803d57,%rax
  80414b:	00 00 00 
  80414e:	ff d0                	callq  *%rax
  804150:	c9                   	leaveq 
  804151:	c3                   	retq   

0000000000804152 <nsipc_socket>:
  804152:	55                   	push   %rbp
  804153:	48 89 e5             	mov    %rsp,%rbp
  804156:	48 83 ec 10          	sub    $0x10,%rsp
  80415a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80415d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804160:	89 55 f4             	mov    %edx,-0xc(%rbp)
  804163:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80416a:	00 00 00 
  80416d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804170:	89 10                	mov    %edx,(%rax)
  804172:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804179:	00 00 00 
  80417c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80417f:	89 50 04             	mov    %edx,0x4(%rax)
  804182:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  804189:	00 00 00 
  80418c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80418f:	89 50 08             	mov    %edx,0x8(%rax)
  804192:	bf 09 00 00 00       	mov    $0x9,%edi
  804197:	48 b8 57 3d 80 00 00 	movabs $0x803d57,%rax
  80419e:	00 00 00 
  8041a1:	ff d0                	callq  *%rax
  8041a3:	c9                   	leaveq 
  8041a4:	c3                   	retq   

00000000008041a5 <pipe>:
  8041a5:	55                   	push   %rbp
  8041a6:	48 89 e5             	mov    %rsp,%rbp
  8041a9:	53                   	push   %rbx
  8041aa:	48 83 ec 38          	sub    $0x38,%rsp
  8041ae:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8041b2:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8041b6:	48 89 c7             	mov    %rax,%rdi
  8041b9:	48 b8 46 1e 80 00 00 	movabs $0x801e46,%rax
  8041c0:	00 00 00 
  8041c3:	ff d0                	callq  *%rax
  8041c5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041c8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041cc:	0f 88 bf 01 00 00    	js     804391 <pipe+0x1ec>
  8041d2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041d6:	ba 07 04 00 00       	mov    $0x407,%edx
  8041db:	48 89 c6             	mov    %rax,%rsi
  8041de:	bf 00 00 00 00       	mov    $0x0,%edi
  8041e3:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  8041ea:	00 00 00 
  8041ed:	ff d0                	callq  *%rax
  8041ef:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8041f2:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8041f6:	0f 88 95 01 00 00    	js     804391 <pipe+0x1ec>
  8041fc:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804200:	48 89 c7             	mov    %rax,%rdi
  804203:	48 b8 46 1e 80 00 00 	movabs $0x801e46,%rax
  80420a:	00 00 00 
  80420d:	ff d0                	callq  *%rax
  80420f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804212:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804216:	0f 88 5d 01 00 00    	js     804379 <pipe+0x1d4>
  80421c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804220:	ba 07 04 00 00       	mov    $0x407,%edx
  804225:	48 89 c6             	mov    %rax,%rsi
  804228:	bf 00 00 00 00       	mov    $0x0,%edi
  80422d:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  804234:	00 00 00 
  804237:	ff d0                	callq  *%rax
  804239:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80423c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804240:	0f 88 33 01 00 00    	js     804379 <pipe+0x1d4>
  804246:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80424a:	48 89 c7             	mov    %rax,%rdi
  80424d:	48 b8 1b 1e 80 00 00 	movabs $0x801e1b,%rax
  804254:	00 00 00 
  804257:	ff d0                	callq  *%rax
  804259:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80425d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804261:	ba 07 04 00 00       	mov    $0x407,%edx
  804266:	48 89 c6             	mov    %rax,%rsi
  804269:	bf 00 00 00 00       	mov    $0x0,%edi
  80426e:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  804275:	00 00 00 
  804278:	ff d0                	callq  *%rax
  80427a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80427d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804281:	0f 88 d9 00 00 00    	js     804360 <pipe+0x1bb>
  804287:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80428b:	48 89 c7             	mov    %rax,%rdi
  80428e:	48 b8 1b 1e 80 00 00 	movabs $0x801e1b,%rax
  804295:	00 00 00 
  804298:	ff d0                	callq  *%rax
  80429a:	48 89 c2             	mov    %rax,%rdx
  80429d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8042a1:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8042a7:	48 89 d1             	mov    %rdx,%rcx
  8042aa:	ba 00 00 00 00       	mov    $0x0,%edx
  8042af:	48 89 c6             	mov    %rax,%rsi
  8042b2:	bf 00 00 00 00       	mov    $0x0,%edi
  8042b7:	48 b8 4e 1a 80 00 00 	movabs $0x801a4e,%rax
  8042be:	00 00 00 
  8042c1:	ff d0                	callq  *%rax
  8042c3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8042c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8042ca:	78 79                	js     804345 <pipe+0x1a0>
  8042cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042d0:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  8042d7:	00 00 00 
  8042da:	8b 12                	mov    (%rdx),%edx
  8042dc:	89 10                	mov    %edx,(%rax)
  8042de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042e2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8042e9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042ed:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  8042f4:	00 00 00 
  8042f7:	8b 12                	mov    (%rdx),%edx
  8042f9:	89 10                	mov    %edx,(%rax)
  8042fb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8042ff:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804306:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80430a:	48 89 c7             	mov    %rax,%rdi
  80430d:	48 b8 f8 1d 80 00 00 	movabs $0x801df8,%rax
  804314:	00 00 00 
  804317:	ff d0                	callq  *%rax
  804319:	89 c2                	mov    %eax,%edx
  80431b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80431f:	89 10                	mov    %edx,(%rax)
  804321:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804325:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804329:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80432d:	48 89 c7             	mov    %rax,%rdi
  804330:	48 b8 f8 1d 80 00 00 	movabs $0x801df8,%rax
  804337:	00 00 00 
  80433a:	ff d0                	callq  *%rax
  80433c:	89 03                	mov    %eax,(%rbx)
  80433e:	b8 00 00 00 00       	mov    $0x0,%eax
  804343:	eb 4f                	jmp    804394 <pipe+0x1ef>
  804345:	90                   	nop
  804346:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80434a:	48 89 c6             	mov    %rax,%rsi
  80434d:	bf 00 00 00 00       	mov    $0x0,%edi
  804352:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  804359:	00 00 00 
  80435c:	ff d0                	callq  *%rax
  80435e:	eb 01                	jmp    804361 <pipe+0x1bc>
  804360:	90                   	nop
  804361:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804365:	48 89 c6             	mov    %rax,%rsi
  804368:	bf 00 00 00 00       	mov    $0x0,%edi
  80436d:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  804374:	00 00 00 
  804377:	ff d0                	callq  *%rax
  804379:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80437d:	48 89 c6             	mov    %rax,%rsi
  804380:	bf 00 00 00 00       	mov    $0x0,%edi
  804385:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  80438c:	00 00 00 
  80438f:	ff d0                	callq  *%rax
  804391:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804394:	48 83 c4 38          	add    $0x38,%rsp
  804398:	5b                   	pop    %rbx
  804399:	5d                   	pop    %rbp
  80439a:	c3                   	retq   

000000000080439b <_pipeisclosed>:
  80439b:	55                   	push   %rbp
  80439c:	48 89 e5             	mov    %rsp,%rbp
  80439f:	53                   	push   %rbx
  8043a0:	48 83 ec 28          	sub    $0x28,%rsp
  8043a4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8043a8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8043ac:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8043b3:	00 00 00 
  8043b6:	48 8b 00             	mov    (%rax),%rax
  8043b9:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8043bf:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8043c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8043c6:	48 89 c7             	mov    %rax,%rdi
  8043c9:	48 b8 4e 4c 80 00 00 	movabs $0x804c4e,%rax
  8043d0:	00 00 00 
  8043d3:	ff d0                	callq  *%rax
  8043d5:	89 c3                	mov    %eax,%ebx
  8043d7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8043db:	48 89 c7             	mov    %rax,%rdi
  8043de:	48 b8 4e 4c 80 00 00 	movabs $0x804c4e,%rax
  8043e5:	00 00 00 
  8043e8:	ff d0                	callq  *%rax
  8043ea:	39 c3                	cmp    %eax,%ebx
  8043ec:	0f 94 c0             	sete   %al
  8043ef:	0f b6 c0             	movzbl %al,%eax
  8043f2:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8043f5:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8043fc:	00 00 00 
  8043ff:	48 8b 00             	mov    (%rax),%rax
  804402:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804408:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80440b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80440e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804411:	75 05                	jne    804418 <_pipeisclosed+0x7d>
  804413:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804416:	eb 4a                	jmp    804462 <_pipeisclosed+0xc7>
  804418:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80441b:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80441e:	74 8c                	je     8043ac <_pipeisclosed+0x11>
  804420:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804424:	75 86                	jne    8043ac <_pipeisclosed+0x11>
  804426:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80442d:	00 00 00 
  804430:	48 8b 00             	mov    (%rax),%rax
  804433:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804439:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80443c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80443f:	89 c6                	mov    %eax,%esi
  804441:	48 bf 46 55 80 00 00 	movabs $0x805546,%rdi
  804448:	00 00 00 
  80444b:	b8 00 00 00 00       	mov    $0x0,%eax
  804450:	49 b8 3c 05 80 00 00 	movabs $0x80053c,%r8
  804457:	00 00 00 
  80445a:	41 ff d0             	callq  *%r8
  80445d:	e9 4a ff ff ff       	jmpq   8043ac <_pipeisclosed+0x11>
  804462:	48 83 c4 28          	add    $0x28,%rsp
  804466:	5b                   	pop    %rbx
  804467:	5d                   	pop    %rbp
  804468:	c3                   	retq   

0000000000804469 <pipeisclosed>:
  804469:	55                   	push   %rbp
  80446a:	48 89 e5             	mov    %rsp,%rbp
  80446d:	48 83 ec 30          	sub    $0x30,%rsp
  804471:	89 7d dc             	mov    %edi,-0x24(%rbp)
  804474:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  804478:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80447b:	48 89 d6             	mov    %rdx,%rsi
  80447e:	89 c7                	mov    %eax,%edi
  804480:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  804487:	00 00 00 
  80448a:	ff d0                	callq  *%rax
  80448c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80448f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804493:	79 05                	jns    80449a <pipeisclosed+0x31>
  804495:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804498:	eb 31                	jmp    8044cb <pipeisclosed+0x62>
  80449a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80449e:	48 89 c7             	mov    %rax,%rdi
  8044a1:	48 b8 1b 1e 80 00 00 	movabs $0x801e1b,%rax
  8044a8:	00 00 00 
  8044ab:	ff d0                	callq  *%rax
  8044ad:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8044b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8044b5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8044b9:	48 89 d6             	mov    %rdx,%rsi
  8044bc:	48 89 c7             	mov    %rax,%rdi
  8044bf:	48 b8 9b 43 80 00 00 	movabs $0x80439b,%rax
  8044c6:	00 00 00 
  8044c9:	ff d0                	callq  *%rax
  8044cb:	c9                   	leaveq 
  8044cc:	c3                   	retq   

00000000008044cd <devpipe_read>:
  8044cd:	55                   	push   %rbp
  8044ce:	48 89 e5             	mov    %rsp,%rbp
  8044d1:	48 83 ec 40          	sub    $0x40,%rsp
  8044d5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8044d9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8044dd:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8044e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8044e5:	48 89 c7             	mov    %rax,%rdi
  8044e8:	48 b8 1b 1e 80 00 00 	movabs $0x801e1b,%rax
  8044ef:	00 00 00 
  8044f2:	ff d0                	callq  *%rax
  8044f4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8044f8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8044fc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804500:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804507:	00 
  804508:	e9 90 00 00 00       	jmpq   80459d <devpipe_read+0xd0>
  80450d:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804512:	74 09                	je     80451d <devpipe_read+0x50>
  804514:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804518:	e9 8e 00 00 00       	jmpq   8045ab <devpipe_read+0xde>
  80451d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804521:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804525:	48 89 d6             	mov    %rdx,%rsi
  804528:	48 89 c7             	mov    %rax,%rdi
  80452b:	48 b8 9b 43 80 00 00 	movabs $0x80439b,%rax
  804532:	00 00 00 
  804535:	ff d0                	callq  *%rax
  804537:	85 c0                	test   %eax,%eax
  804539:	74 07                	je     804542 <devpipe_read+0x75>
  80453b:	b8 00 00 00 00       	mov    $0x0,%eax
  804540:	eb 69                	jmp    8045ab <devpipe_read+0xde>
  804542:	48 b8 bf 19 80 00 00 	movabs $0x8019bf,%rax
  804549:	00 00 00 
  80454c:	ff d0                	callq  *%rax
  80454e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804552:	8b 10                	mov    (%rax),%edx
  804554:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804558:	8b 40 04             	mov    0x4(%rax),%eax
  80455b:	39 c2                	cmp    %eax,%edx
  80455d:	74 ae                	je     80450d <devpipe_read+0x40>
  80455f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804563:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804567:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  80456b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80456f:	8b 00                	mov    (%rax),%eax
  804571:	99                   	cltd   
  804572:	c1 ea 1b             	shr    $0x1b,%edx
  804575:	01 d0                	add    %edx,%eax
  804577:	83 e0 1f             	and    $0x1f,%eax
  80457a:	29 d0                	sub    %edx,%eax
  80457c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804580:	48 98                	cltq   
  804582:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  804587:	88 01                	mov    %al,(%rcx)
  804589:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80458d:	8b 00                	mov    (%rax),%eax
  80458f:	8d 50 01             	lea    0x1(%rax),%edx
  804592:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804596:	89 10                	mov    %edx,(%rax)
  804598:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80459d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045a1:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8045a5:	72 a7                	jb     80454e <devpipe_read+0x81>
  8045a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045ab:	c9                   	leaveq 
  8045ac:	c3                   	retq   

00000000008045ad <devpipe_write>:
  8045ad:	55                   	push   %rbp
  8045ae:	48 89 e5             	mov    %rsp,%rbp
  8045b1:	48 83 ec 40          	sub    $0x40,%rsp
  8045b5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8045b9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8045bd:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8045c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045c5:	48 89 c7             	mov    %rax,%rdi
  8045c8:	48 b8 1b 1e 80 00 00 	movabs $0x801e1b,%rax
  8045cf:	00 00 00 
  8045d2:	ff d0                	callq  *%rax
  8045d4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8045d8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8045dc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8045e0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8045e7:	00 
  8045e8:	e9 8f 00 00 00       	jmpq   80467c <devpipe_write+0xcf>
  8045ed:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8045f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045f5:	48 89 d6             	mov    %rdx,%rsi
  8045f8:	48 89 c7             	mov    %rax,%rdi
  8045fb:	48 b8 9b 43 80 00 00 	movabs $0x80439b,%rax
  804602:	00 00 00 
  804605:	ff d0                	callq  *%rax
  804607:	85 c0                	test   %eax,%eax
  804609:	74 07                	je     804612 <devpipe_write+0x65>
  80460b:	b8 00 00 00 00       	mov    $0x0,%eax
  804610:	eb 78                	jmp    80468a <devpipe_write+0xdd>
  804612:	48 b8 bf 19 80 00 00 	movabs $0x8019bf,%rax
  804619:	00 00 00 
  80461c:	ff d0                	callq  *%rax
  80461e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804622:	8b 40 04             	mov    0x4(%rax),%eax
  804625:	48 63 d0             	movslq %eax,%rdx
  804628:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80462c:	8b 00                	mov    (%rax),%eax
  80462e:	48 98                	cltq   
  804630:	48 83 c0 20          	add    $0x20,%rax
  804634:	48 39 c2             	cmp    %rax,%rdx
  804637:	73 b4                	jae    8045ed <devpipe_write+0x40>
  804639:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80463d:	8b 40 04             	mov    0x4(%rax),%eax
  804640:	99                   	cltd   
  804641:	c1 ea 1b             	shr    $0x1b,%edx
  804644:	01 d0                	add    %edx,%eax
  804646:	83 e0 1f             	and    $0x1f,%eax
  804649:	29 d0                	sub    %edx,%eax
  80464b:	89 c6                	mov    %eax,%esi
  80464d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804651:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804655:	48 01 d0             	add    %rdx,%rax
  804658:	0f b6 08             	movzbl (%rax),%ecx
  80465b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80465f:	48 63 c6             	movslq %esi,%rax
  804662:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804666:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80466a:	8b 40 04             	mov    0x4(%rax),%eax
  80466d:	8d 50 01             	lea    0x1(%rax),%edx
  804670:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804674:	89 50 04             	mov    %edx,0x4(%rax)
  804677:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80467c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804680:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804684:	72 98                	jb     80461e <devpipe_write+0x71>
  804686:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80468a:	c9                   	leaveq 
  80468b:	c3                   	retq   

000000000080468c <devpipe_stat>:
  80468c:	55                   	push   %rbp
  80468d:	48 89 e5             	mov    %rsp,%rbp
  804690:	48 83 ec 20          	sub    $0x20,%rsp
  804694:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804698:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80469c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8046a0:	48 89 c7             	mov    %rax,%rdi
  8046a3:	48 b8 1b 1e 80 00 00 	movabs $0x801e1b,%rax
  8046aa:	00 00 00 
  8046ad:	ff d0                	callq  *%rax
  8046af:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8046b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046b7:	48 be 59 55 80 00 00 	movabs $0x805559,%rsi
  8046be:	00 00 00 
  8046c1:	48 89 c7             	mov    %rax,%rdi
  8046c4:	48 b8 cc 10 80 00 00 	movabs $0x8010cc,%rax
  8046cb:	00 00 00 
  8046ce:	ff d0                	callq  *%rax
  8046d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046d4:	8b 50 04             	mov    0x4(%rax),%edx
  8046d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8046db:	8b 00                	mov    (%rax),%eax
  8046dd:	29 c2                	sub    %eax,%edx
  8046df:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046e3:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8046e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046ed:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8046f4:	00 00 00 
  8046f7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046fb:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  804702:	00 00 00 
  804705:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  80470c:	b8 00 00 00 00       	mov    $0x0,%eax
  804711:	c9                   	leaveq 
  804712:	c3                   	retq   

0000000000804713 <devpipe_close>:
  804713:	55                   	push   %rbp
  804714:	48 89 e5             	mov    %rsp,%rbp
  804717:	48 83 ec 10          	sub    $0x10,%rsp
  80471b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80471f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804723:	48 89 c6             	mov    %rax,%rsi
  804726:	bf 00 00 00 00       	mov    $0x0,%edi
  80472b:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  804732:	00 00 00 
  804735:	ff d0                	callq  *%rax
  804737:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80473b:	48 89 c7             	mov    %rax,%rdi
  80473e:	48 b8 1b 1e 80 00 00 	movabs $0x801e1b,%rax
  804745:	00 00 00 
  804748:	ff d0                	callq  *%rax
  80474a:	48 89 c6             	mov    %rax,%rsi
  80474d:	bf 00 00 00 00       	mov    $0x0,%edi
  804752:	48 b8 ae 1a 80 00 00 	movabs $0x801aae,%rax
  804759:	00 00 00 
  80475c:	ff d0                	callq  *%rax
  80475e:	c9                   	leaveq 
  80475f:	c3                   	retq   

0000000000804760 <cputchar>:
  804760:	55                   	push   %rbp
  804761:	48 89 e5             	mov    %rsp,%rbp
  804764:	48 83 ec 20          	sub    $0x20,%rsp
  804768:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80476b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80476e:	88 45 ff             	mov    %al,-0x1(%rbp)
  804771:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804775:	be 01 00 00 00       	mov    $0x1,%esi
  80477a:	48 89 c7             	mov    %rax,%rdi
  80477d:	48 b8 b4 18 80 00 00 	movabs $0x8018b4,%rax
  804784:	00 00 00 
  804787:	ff d0                	callq  *%rax
  804789:	90                   	nop
  80478a:	c9                   	leaveq 
  80478b:	c3                   	retq   

000000000080478c <getchar>:
  80478c:	55                   	push   %rbp
  80478d:	48 89 e5             	mov    %rsp,%rbp
  804790:	48 83 ec 10          	sub    $0x10,%rsp
  804794:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804798:	ba 01 00 00 00       	mov    $0x1,%edx
  80479d:	48 89 c6             	mov    %rax,%rsi
  8047a0:	bf 00 00 00 00       	mov    $0x0,%edi
  8047a5:	48 b8 13 23 80 00 00 	movabs $0x802313,%rax
  8047ac:	00 00 00 
  8047af:	ff d0                	callq  *%rax
  8047b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047b4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047b8:	79 05                	jns    8047bf <getchar+0x33>
  8047ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047bd:	eb 14                	jmp    8047d3 <getchar+0x47>
  8047bf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047c3:	7f 07                	jg     8047cc <getchar+0x40>
  8047c5:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  8047ca:	eb 07                	jmp    8047d3 <getchar+0x47>
  8047cc:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  8047d0:	0f b6 c0             	movzbl %al,%eax
  8047d3:	c9                   	leaveq 
  8047d4:	c3                   	retq   

00000000008047d5 <iscons>:
  8047d5:	55                   	push   %rbp
  8047d6:	48 89 e5             	mov    %rsp,%rbp
  8047d9:	48 83 ec 20          	sub    $0x20,%rsp
  8047dd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8047e0:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8047e4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8047e7:	48 89 d6             	mov    %rdx,%rsi
  8047ea:	89 c7                	mov    %eax,%edi
  8047ec:	48 b8 de 1e 80 00 00 	movabs $0x801ede,%rax
  8047f3:	00 00 00 
  8047f6:	ff d0                	callq  *%rax
  8047f8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047fb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047ff:	79 05                	jns    804806 <iscons+0x31>
  804801:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804804:	eb 1a                	jmp    804820 <iscons+0x4b>
  804806:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80480a:	8b 10                	mov    (%rax),%edx
  80480c:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  804813:	00 00 00 
  804816:	8b 00                	mov    (%rax),%eax
  804818:	39 c2                	cmp    %eax,%edx
  80481a:	0f 94 c0             	sete   %al
  80481d:	0f b6 c0             	movzbl %al,%eax
  804820:	c9                   	leaveq 
  804821:	c3                   	retq   

0000000000804822 <opencons>:
  804822:	55                   	push   %rbp
  804823:	48 89 e5             	mov    %rsp,%rbp
  804826:	48 83 ec 10          	sub    $0x10,%rsp
  80482a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80482e:	48 89 c7             	mov    %rax,%rdi
  804831:	48 b8 46 1e 80 00 00 	movabs $0x801e46,%rax
  804838:	00 00 00 
  80483b:	ff d0                	callq  *%rax
  80483d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804840:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804844:	79 05                	jns    80484b <opencons+0x29>
  804846:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804849:	eb 5b                	jmp    8048a6 <opencons+0x84>
  80484b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80484f:	ba 07 04 00 00       	mov    $0x407,%edx
  804854:	48 89 c6             	mov    %rax,%rsi
  804857:	bf 00 00 00 00       	mov    $0x0,%edi
  80485c:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  804863:	00 00 00 
  804866:	ff d0                	callq  *%rax
  804868:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80486b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80486f:	79 05                	jns    804876 <opencons+0x54>
  804871:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804874:	eb 30                	jmp    8048a6 <opencons+0x84>
  804876:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80487a:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  804881:	00 00 00 
  804884:	8b 12                	mov    (%rdx),%edx
  804886:	89 10                	mov    %edx,(%rax)
  804888:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80488c:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804893:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804897:	48 89 c7             	mov    %rax,%rdi
  80489a:	48 b8 f8 1d 80 00 00 	movabs $0x801df8,%rax
  8048a1:	00 00 00 
  8048a4:	ff d0                	callq  *%rax
  8048a6:	c9                   	leaveq 
  8048a7:	c3                   	retq   

00000000008048a8 <devcons_read>:
  8048a8:	55                   	push   %rbp
  8048a9:	48 89 e5             	mov    %rsp,%rbp
  8048ac:	48 83 ec 30          	sub    $0x30,%rsp
  8048b0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8048b4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8048b8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8048bc:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8048c1:	75 13                	jne    8048d6 <devcons_read+0x2e>
  8048c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8048c8:	eb 49                	jmp    804913 <devcons_read+0x6b>
  8048ca:	48 b8 bf 19 80 00 00 	movabs $0x8019bf,%rax
  8048d1:	00 00 00 
  8048d4:	ff d0                	callq  *%rax
  8048d6:	48 b8 01 19 80 00 00 	movabs $0x801901,%rax
  8048dd:	00 00 00 
  8048e0:	ff d0                	callq  *%rax
  8048e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048e9:	74 df                	je     8048ca <devcons_read+0x22>
  8048eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048ef:	79 05                	jns    8048f6 <devcons_read+0x4e>
  8048f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048f4:	eb 1d                	jmp    804913 <devcons_read+0x6b>
  8048f6:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8048fa:	75 07                	jne    804903 <devcons_read+0x5b>
  8048fc:	b8 00 00 00 00       	mov    $0x0,%eax
  804901:	eb 10                	jmp    804913 <devcons_read+0x6b>
  804903:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804906:	89 c2                	mov    %eax,%edx
  804908:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80490c:	88 10                	mov    %dl,(%rax)
  80490e:	b8 01 00 00 00       	mov    $0x1,%eax
  804913:	c9                   	leaveq 
  804914:	c3                   	retq   

0000000000804915 <devcons_write>:
  804915:	55                   	push   %rbp
  804916:	48 89 e5             	mov    %rsp,%rbp
  804919:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804920:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804927:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  80492e:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804935:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80493c:	eb 76                	jmp    8049b4 <devcons_write+0x9f>
  80493e:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804945:	89 c2                	mov    %eax,%edx
  804947:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80494a:	29 c2                	sub    %eax,%edx
  80494c:	89 d0                	mov    %edx,%eax
  80494e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804951:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804954:	83 f8 7f             	cmp    $0x7f,%eax
  804957:	76 07                	jbe    804960 <devcons_write+0x4b>
  804959:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804960:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804963:	48 63 d0             	movslq %eax,%rdx
  804966:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804969:	48 63 c8             	movslq %eax,%rcx
  80496c:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804973:	48 01 c1             	add    %rax,%rcx
  804976:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80497d:	48 89 ce             	mov    %rcx,%rsi
  804980:	48 89 c7             	mov    %rax,%rdi
  804983:	48 b8 f1 13 80 00 00 	movabs $0x8013f1,%rax
  80498a:	00 00 00 
  80498d:	ff d0                	callq  *%rax
  80498f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804992:	48 63 d0             	movslq %eax,%rdx
  804995:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80499c:	48 89 d6             	mov    %rdx,%rsi
  80499f:	48 89 c7             	mov    %rax,%rdi
  8049a2:	48 b8 b4 18 80 00 00 	movabs $0x8018b4,%rax
  8049a9:	00 00 00 
  8049ac:	ff d0                	callq  *%rax
  8049ae:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8049b1:	01 45 fc             	add    %eax,-0x4(%rbp)
  8049b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049b7:	48 98                	cltq   
  8049b9:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8049c0:	0f 82 78 ff ff ff    	jb     80493e <devcons_write+0x29>
  8049c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049c9:	c9                   	leaveq 
  8049ca:	c3                   	retq   

00000000008049cb <devcons_close>:
  8049cb:	55                   	push   %rbp
  8049cc:	48 89 e5             	mov    %rsp,%rbp
  8049cf:	48 83 ec 08          	sub    $0x8,%rsp
  8049d3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8049d7:	b8 00 00 00 00       	mov    $0x0,%eax
  8049dc:	c9                   	leaveq 
  8049dd:	c3                   	retq   

00000000008049de <devcons_stat>:
  8049de:	55                   	push   %rbp
  8049df:	48 89 e5             	mov    %rsp,%rbp
  8049e2:	48 83 ec 10          	sub    $0x10,%rsp
  8049e6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8049ea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8049ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049f2:	48 be 65 55 80 00 00 	movabs $0x805565,%rsi
  8049f9:	00 00 00 
  8049fc:	48 89 c7             	mov    %rax,%rdi
  8049ff:	48 b8 cc 10 80 00 00 	movabs $0x8010cc,%rax
  804a06:	00 00 00 
  804a09:	ff d0                	callq  *%rax
  804a0b:	b8 00 00 00 00       	mov    $0x0,%eax
  804a10:	c9                   	leaveq 
  804a11:	c3                   	retq   

0000000000804a12 <ipc_recv>:
  804a12:	55                   	push   %rbp
  804a13:	48 89 e5             	mov    %rsp,%rbp
  804a16:	48 83 ec 30          	sub    $0x30,%rsp
  804a1a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804a1e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804a22:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804a26:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804a2b:	75 0e                	jne    804a3b <ipc_recv+0x29>
  804a2d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804a34:	00 00 00 
  804a37:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804a3b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804a3f:	48 89 c7             	mov    %rax,%rdi
  804a42:	48 b8 36 1c 80 00 00 	movabs $0x801c36,%rax
  804a49:	00 00 00 
  804a4c:	ff d0                	callq  *%rax
  804a4e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804a51:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804a55:	79 27                	jns    804a7e <ipc_recv+0x6c>
  804a57:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804a5c:	74 0a                	je     804a68 <ipc_recv+0x56>
  804a5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a62:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804a68:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804a6d:	74 0a                	je     804a79 <ipc_recv+0x67>
  804a6f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a73:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804a79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804a7c:	eb 53                	jmp    804ad1 <ipc_recv+0xbf>
  804a7e:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804a83:	74 19                	je     804a9e <ipc_recv+0x8c>
  804a85:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804a8c:	00 00 00 
  804a8f:	48 8b 00             	mov    (%rax),%rax
  804a92:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804a98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a9c:	89 10                	mov    %edx,(%rax)
  804a9e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804aa3:	74 19                	je     804abe <ipc_recv+0xac>
  804aa5:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804aac:	00 00 00 
  804aaf:	48 8b 00             	mov    (%rax),%rax
  804ab2:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804ab8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804abc:	89 10                	mov    %edx,(%rax)
  804abe:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804ac5:	00 00 00 
  804ac8:	48 8b 00             	mov    (%rax),%rax
  804acb:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804ad1:	c9                   	leaveq 
  804ad2:	c3                   	retq   

0000000000804ad3 <ipc_send>:
  804ad3:	55                   	push   %rbp
  804ad4:	48 89 e5             	mov    %rsp,%rbp
  804ad7:	48 83 ec 30          	sub    $0x30,%rsp
  804adb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804ade:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804ae1:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804ae5:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804ae8:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804aed:	75 1c                	jne    804b0b <ipc_send+0x38>
  804aef:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804af6:	00 00 00 
  804af9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804afd:	eb 0c                	jmp    804b0b <ipc_send+0x38>
  804aff:	48 b8 bf 19 80 00 00 	movabs $0x8019bf,%rax
  804b06:	00 00 00 
  804b09:	ff d0                	callq  *%rax
  804b0b:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804b0e:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804b11:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804b15:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804b18:	89 c7                	mov    %eax,%edi
  804b1a:	48 b8 df 1b 80 00 00 	movabs $0x801bdf,%rax
  804b21:	00 00 00 
  804b24:	ff d0                	callq  *%rax
  804b26:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804b29:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804b2d:	74 d0                	je     804aff <ipc_send+0x2c>
  804b2f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804b33:	79 30                	jns    804b65 <ipc_send+0x92>
  804b35:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804b38:	89 c1                	mov    %eax,%ecx
  804b3a:	48 ba 70 55 80 00 00 	movabs $0x805570,%rdx
  804b41:	00 00 00 
  804b44:	be 44 00 00 00       	mov    $0x44,%esi
  804b49:	48 bf 86 55 80 00 00 	movabs $0x805586,%rdi
  804b50:	00 00 00 
  804b53:	b8 00 00 00 00       	mov    $0x0,%eax
  804b58:	49 b8 02 03 80 00 00 	movabs $0x800302,%r8
  804b5f:	00 00 00 
  804b62:	41 ff d0             	callq  *%r8
  804b65:	90                   	nop
  804b66:	c9                   	leaveq 
  804b67:	c3                   	retq   

0000000000804b68 <ipc_host_recv>:
  804b68:	55                   	push   %rbp
  804b69:	48 89 e5             	mov    %rsp,%rbp
  804b6c:	48 83 ec 10          	sub    $0x10,%rsp
  804b70:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804b74:	48 ba 98 55 80 00 00 	movabs $0x805598,%rdx
  804b7b:	00 00 00 
  804b7e:	be 4e 00 00 00       	mov    $0x4e,%esi
  804b83:	48 bf 86 55 80 00 00 	movabs $0x805586,%rdi
  804b8a:	00 00 00 
  804b8d:	b8 00 00 00 00       	mov    $0x0,%eax
  804b92:	48 b9 02 03 80 00 00 	movabs $0x800302,%rcx
  804b99:	00 00 00 
  804b9c:	ff d1                	callq  *%rcx

0000000000804b9e <ipc_host_send>:
  804b9e:	55                   	push   %rbp
  804b9f:	48 89 e5             	mov    %rsp,%rbp
  804ba2:	48 83 ec 20          	sub    $0x20,%rsp
  804ba6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804ba9:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804bac:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804bb0:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804bb3:	48 ba b8 55 80 00 00 	movabs $0x8055b8,%rdx
  804bba:	00 00 00 
  804bbd:	be 58 00 00 00       	mov    $0x58,%esi
  804bc2:	48 bf 86 55 80 00 00 	movabs $0x805586,%rdi
  804bc9:	00 00 00 
  804bcc:	b8 00 00 00 00       	mov    $0x0,%eax
  804bd1:	48 b9 02 03 80 00 00 	movabs $0x800302,%rcx
  804bd8:	00 00 00 
  804bdb:	ff d1                	callq  *%rcx

0000000000804bdd <ipc_find_env>:
  804bdd:	55                   	push   %rbp
  804bde:	48 89 e5             	mov    %rsp,%rbp
  804be1:	48 83 ec 18          	sub    $0x18,%rsp
  804be5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804be8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804bef:	eb 4d                	jmp    804c3e <ipc_find_env+0x61>
  804bf1:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804bf8:	00 00 00 
  804bfb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804bfe:	48 98                	cltq   
  804c00:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804c07:	48 01 d0             	add    %rdx,%rax
  804c0a:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804c10:	8b 00                	mov    (%rax),%eax
  804c12:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804c15:	75 23                	jne    804c3a <ipc_find_env+0x5d>
  804c17:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804c1e:	00 00 00 
  804c21:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804c24:	48 98                	cltq   
  804c26:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804c2d:	48 01 d0             	add    %rdx,%rax
  804c30:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804c36:	8b 00                	mov    (%rax),%eax
  804c38:	eb 12                	jmp    804c4c <ipc_find_env+0x6f>
  804c3a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804c3e:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804c45:	7e aa                	jle    804bf1 <ipc_find_env+0x14>
  804c47:	b8 00 00 00 00       	mov    $0x0,%eax
  804c4c:	c9                   	leaveq 
  804c4d:	c3                   	retq   

0000000000804c4e <pageref>:
  804c4e:	55                   	push   %rbp
  804c4f:	48 89 e5             	mov    %rsp,%rbp
  804c52:	48 83 ec 18          	sub    $0x18,%rsp
  804c56:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804c5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c5e:	48 c1 e8 15          	shr    $0x15,%rax
  804c62:	48 89 c2             	mov    %rax,%rdx
  804c65:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804c6c:	01 00 00 
  804c6f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804c73:	83 e0 01             	and    $0x1,%eax
  804c76:	48 85 c0             	test   %rax,%rax
  804c79:	75 07                	jne    804c82 <pageref+0x34>
  804c7b:	b8 00 00 00 00       	mov    $0x0,%eax
  804c80:	eb 56                	jmp    804cd8 <pageref+0x8a>
  804c82:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c86:	48 c1 e8 0c          	shr    $0xc,%rax
  804c8a:	48 89 c2             	mov    %rax,%rdx
  804c8d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804c94:	01 00 00 
  804c97:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804c9b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804c9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ca3:	83 e0 01             	and    $0x1,%eax
  804ca6:	48 85 c0             	test   %rax,%rax
  804ca9:	75 07                	jne    804cb2 <pageref+0x64>
  804cab:	b8 00 00 00 00       	mov    $0x0,%eax
  804cb0:	eb 26                	jmp    804cd8 <pageref+0x8a>
  804cb2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804cb6:	48 c1 e8 0c          	shr    $0xc,%rax
  804cba:	48 89 c2             	mov    %rax,%rdx
  804cbd:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804cc4:	00 00 00 
  804cc7:	48 c1 e2 04          	shl    $0x4,%rdx
  804ccb:	48 01 d0             	add    %rdx,%rax
  804cce:	48 83 c0 08          	add    $0x8,%rax
  804cd2:	0f b7 00             	movzwl (%rax),%eax
  804cd5:	0f b7 c0             	movzwl %ax,%eax
  804cd8:	c9                   	leaveq 
  804cd9:	c3                   	retq   
