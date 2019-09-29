
vmm/guest/obj/user/num:     file format elf64-x86-64


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
  80003c:	e8 93 02 00 00       	callq  8002d4 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <num>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	e9 da 00 00 00       	jmpq   800131 <num+0xee>
  800057:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80005e:	00 00 00 
  800061:	8b 00                	mov    (%rax),%eax
  800063:	85 c0                	test   %eax,%eax
  800065:	74 54                	je     8000bb <num+0x78>
  800067:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80006e:	00 00 00 
  800071:	8b 00                	mov    (%rax),%eax
  800073:	8d 50 01             	lea    0x1(%rax),%edx
  800076:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80007d:	00 00 00 
  800080:	89 10                	mov    %edx,(%rax)
  800082:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800089:	00 00 00 
  80008c:	8b 00                	mov    (%rax),%eax
  80008e:	89 c6                	mov    %eax,%esi
  800090:	48 bf 00 45 80 00 00 	movabs $0x804500,%rdi
  800097:	00 00 00 
  80009a:	b8 00 00 00 00       	mov    $0x0,%eax
  80009f:	48 ba f5 30 80 00 00 	movabs $0x8030f5,%rdx
  8000a6:	00 00 00 
  8000a9:	ff d2                	callq  *%rdx
  8000ab:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8000b2:	00 00 00 
  8000b5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8000bb:	48 8d 45 f3          	lea    -0xd(%rbp),%rax
  8000bf:	ba 01 00 00 00       	mov    $0x1,%edx
  8000c4:	48 89 c6             	mov    %rax,%rsi
  8000c7:	bf 01 00 00 00       	mov    $0x1,%edi
  8000cc:	48 b8 d8 24 80 00 00 	movabs $0x8024d8,%rax
  8000d3:	00 00 00 
  8000d6:	ff d0                	callq  *%rax
  8000d8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8000db:	83 7d f4 01          	cmpl   $0x1,-0xc(%rbp)
  8000df:	74 38                	je     800119 <num+0xd6>
  8000e1:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8000e4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8000e8:	41 89 d0             	mov    %edx,%r8d
  8000eb:	48 89 c1             	mov    %rax,%rcx
  8000ee:	48 ba 05 45 80 00 00 	movabs $0x804505,%rdx
  8000f5:	00 00 00 
  8000f8:	be 14 00 00 00       	mov    $0x14,%esi
  8000fd:	48 bf 20 45 80 00 00 	movabs $0x804520,%rdi
  800104:	00 00 00 
  800107:	b8 00 00 00 00       	mov    $0x0,%eax
  80010c:	49 b9 7c 03 80 00 00 	movabs $0x80037c,%r9
  800113:	00 00 00 
  800116:	41 ff d1             	callq  *%r9
  800119:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
  80011d:	3c 0a                	cmp    $0xa,%al
  80011f:	75 10                	jne    800131 <num+0xee>
  800121:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800128:	00 00 00 
  80012b:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  800131:	48 8d 4d f3          	lea    -0xd(%rbp),%rcx
  800135:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800138:	ba 01 00 00 00       	mov    $0x1,%edx
  80013d:	48 89 ce             	mov    %rcx,%rsi
  800140:	89 c7                	mov    %eax,%edi
  800142:	48 b8 8d 23 80 00 00 	movabs $0x80238d,%rax
  800149:	00 00 00 
  80014c:	ff d0                	callq  *%rax
  80014e:	48 98                	cltq   
  800150:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800154:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  800159:	0f 8f f8 fe ff ff    	jg     800057 <num+0x14>
  80015f:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  800164:	79 39                	jns    80019f <num+0x15c>
  800166:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80016a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80016e:	49 89 d0             	mov    %rdx,%r8
  800171:	48 89 c1             	mov    %rax,%rcx
  800174:	48 ba 2e 45 80 00 00 	movabs $0x80452e,%rdx
  80017b:	00 00 00 
  80017e:	be 19 00 00 00       	mov    $0x19,%esi
  800183:	48 bf 20 45 80 00 00 	movabs $0x804520,%rdi
  80018a:	00 00 00 
  80018d:	b8 00 00 00 00       	mov    $0x0,%eax
  800192:	49 b9 7c 03 80 00 00 	movabs $0x80037c,%r9
  800199:	00 00 00 
  80019c:	41 ff d1             	callq  *%r9
  80019f:	90                   	nop
  8001a0:	c9                   	leaveq 
  8001a1:	c3                   	retq   

00000000008001a2 <umain>:
  8001a2:	55                   	push   %rbp
  8001a3:	48 89 e5             	mov    %rsp,%rbp
  8001a6:	48 83 ec 20          	sub    $0x20,%rsp
  8001aa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8001ad:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8001b1:	48 b8 08 60 80 00 00 	movabs $0x806008,%rax
  8001b8:	00 00 00 
  8001bb:	48 b9 43 45 80 00 00 	movabs $0x804543,%rcx
  8001c2:	00 00 00 
  8001c5:	48 89 08             	mov    %rcx,(%rax)
  8001c8:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
  8001cc:	75 20                	jne    8001ee <umain+0x4c>
  8001ce:	48 be 47 45 80 00 00 	movabs $0x804547,%rsi
  8001d5:	00 00 00 
  8001d8:	bf 00 00 00 00       	mov    $0x0,%edi
  8001dd:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001e4:	00 00 00 
  8001e7:	ff d0                	callq  *%rax
  8001e9:	e9 d7 00 00 00       	jmpq   8002c5 <umain+0x123>
  8001ee:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8001f5:	e9 bf 00 00 00       	jmpq   8002b9 <umain+0x117>
  8001fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001fd:	48 98                	cltq   
  8001ff:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800206:	00 
  800207:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80020b:	48 01 d0             	add    %rdx,%rax
  80020e:	48 8b 00             	mov    (%rax),%rax
  800211:	be 00 00 00 00       	mov    $0x0,%esi
  800216:	48 89 c7             	mov    %rax,%rdi
  800219:	48 b8 66 28 80 00 00 	movabs $0x802866,%rax
  800220:	00 00 00 
  800223:	ff d0                	callq  *%rax
  800225:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800228:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80022c:	79 4b                	jns    800279 <umain+0xd7>
  80022e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800231:	48 98                	cltq   
  800233:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80023a:	00 
  80023b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80023f:	48 01 d0             	add    %rdx,%rax
  800242:	48 8b 00             	mov    (%rax),%rax
  800245:	8b 55 f8             	mov    -0x8(%rbp),%edx
  800248:	41 89 d0             	mov    %edx,%r8d
  80024b:	48 89 c1             	mov    %rax,%rcx
  80024e:	48 ba 4f 45 80 00 00 	movabs $0x80454f,%rdx
  800255:	00 00 00 
  800258:	be 28 00 00 00       	mov    $0x28,%esi
  80025d:	48 bf 20 45 80 00 00 	movabs $0x804520,%rdi
  800264:	00 00 00 
  800267:	b8 00 00 00 00       	mov    $0x0,%eax
  80026c:	49 b9 7c 03 80 00 00 	movabs $0x80037c,%r9
  800273:	00 00 00 
  800276:	41 ff d1             	callq  *%r9
  800279:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80027c:	48 98                	cltq   
  80027e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800285:	00 
  800286:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80028a:	48 01 d0             	add    %rdx,%rax
  80028d:	48 8b 10             	mov    (%rax),%rdx
  800290:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800293:	48 89 d6             	mov    %rdx,%rsi
  800296:	89 c7                	mov    %eax,%edi
  800298:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80029f:	00 00 00 
  8002a2:	ff d0                	callq  *%rax
  8002a4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8002a7:	89 c7                	mov    %eax,%edi
  8002a9:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  8002b0:	00 00 00 
  8002b3:	ff d0                	callq  *%rax
  8002b5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8002b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002bc:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8002bf:	0f 8c 35 ff ff ff    	jl     8001fa <umain+0x58>
  8002c5:	48 b8 58 03 80 00 00 	movabs $0x800358,%rax
  8002cc:	00 00 00 
  8002cf:	ff d0                	callq  *%rax
  8002d1:	90                   	nop
  8002d2:	c9                   	leaveq 
  8002d3:	c3                   	retq   

00000000008002d4 <libmain>:
  8002d4:	55                   	push   %rbp
  8002d5:	48 89 e5             	mov    %rsp,%rbp
  8002d8:	48 83 ec 10          	sub    $0x10,%rsp
  8002dc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8002df:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8002e3:	48 b8 fd 19 80 00 00 	movabs $0x8019fd,%rax
  8002ea:	00 00 00 
  8002ed:	ff d0                	callq  *%rax
  8002ef:	25 ff 03 00 00       	and    $0x3ff,%eax
  8002f4:	48 98                	cltq   
  8002f6:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8002fd:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800304:	00 00 00 
  800307:	48 01 c2             	add    %rax,%rdx
  80030a:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  800311:	00 00 00 
  800314:	48 89 10             	mov    %rdx,(%rax)
  800317:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80031b:	7e 14                	jle    800331 <libmain+0x5d>
  80031d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800321:	48 8b 10             	mov    (%rax),%rdx
  800324:	48 b8 08 60 80 00 00 	movabs $0x806008,%rax
  80032b:	00 00 00 
  80032e:	48 89 10             	mov    %rdx,(%rax)
  800331:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800335:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800338:	48 89 d6             	mov    %rdx,%rsi
  80033b:	89 c7                	mov    %eax,%edi
  80033d:	48 b8 a2 01 80 00 00 	movabs $0x8001a2,%rax
  800344:	00 00 00 
  800347:	ff d0                	callq  *%rax
  800349:	48 b8 58 03 80 00 00 	movabs $0x800358,%rax
  800350:	00 00 00 
  800353:	ff d0                	callq  *%rax
  800355:	90                   	nop
  800356:	c9                   	leaveq 
  800357:	c3                   	retq   

0000000000800358 <exit>:
  800358:	55                   	push   %rbp
  800359:	48 89 e5             	mov    %rsp,%rbp
  80035c:	48 b8 b5 21 80 00 00 	movabs $0x8021b5,%rax
  800363:	00 00 00 
  800366:	ff d0                	callq  *%rax
  800368:	bf 00 00 00 00       	mov    $0x0,%edi
  80036d:	48 b8 b7 19 80 00 00 	movabs $0x8019b7,%rax
  800374:	00 00 00 
  800377:	ff d0                	callq  *%rax
  800379:	90                   	nop
  80037a:	5d                   	pop    %rbp
  80037b:	c3                   	retq   

000000000080037c <_panic>:
  80037c:	55                   	push   %rbp
  80037d:	48 89 e5             	mov    %rsp,%rbp
  800380:	53                   	push   %rbx
  800381:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800388:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  80038f:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800395:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80039c:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8003a3:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8003aa:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8003b1:	84 c0                	test   %al,%al
  8003b3:	74 23                	je     8003d8 <_panic+0x5c>
  8003b5:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8003bc:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8003c0:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8003c4:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8003c8:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8003cc:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8003d0:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8003d4:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8003d8:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8003df:	00 00 00 
  8003e2:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8003e9:	00 00 00 
  8003ec:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8003f0:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8003f7:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8003fe:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800405:	48 b8 08 60 80 00 00 	movabs $0x806008,%rax
  80040c:	00 00 00 
  80040f:	48 8b 18             	mov    (%rax),%rbx
  800412:	48 b8 fd 19 80 00 00 	movabs $0x8019fd,%rax
  800419:	00 00 00 
  80041c:	ff d0                	callq  *%rax
  80041e:	89 c6                	mov    %eax,%esi
  800420:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  800426:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80042d:	41 89 d0             	mov    %edx,%r8d
  800430:	48 89 c1             	mov    %rax,%rcx
  800433:	48 89 da             	mov    %rbx,%rdx
  800436:	48 bf 70 45 80 00 00 	movabs $0x804570,%rdi
  80043d:	00 00 00 
  800440:	b8 00 00 00 00       	mov    $0x0,%eax
  800445:	49 b9 b6 05 80 00 00 	movabs $0x8005b6,%r9
  80044c:	00 00 00 
  80044f:	41 ff d1             	callq  *%r9
  800452:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800459:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800460:	48 89 d6             	mov    %rdx,%rsi
  800463:	48 89 c7             	mov    %rax,%rdi
  800466:	48 b8 0a 05 80 00 00 	movabs $0x80050a,%rax
  80046d:	00 00 00 
  800470:	ff d0                	callq  *%rax
  800472:	48 bf 93 45 80 00 00 	movabs $0x804593,%rdi
  800479:	00 00 00 
  80047c:	b8 00 00 00 00       	mov    $0x0,%eax
  800481:	48 ba b6 05 80 00 00 	movabs $0x8005b6,%rdx
  800488:	00 00 00 
  80048b:	ff d2                	callq  *%rdx
  80048d:	cc                   	int3   
  80048e:	eb fd                	jmp    80048d <_panic+0x111>

0000000000800490 <putch>:
  800490:	55                   	push   %rbp
  800491:	48 89 e5             	mov    %rsp,%rbp
  800494:	48 83 ec 10          	sub    $0x10,%rsp
  800498:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80049b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80049f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004a3:	8b 00                	mov    (%rax),%eax
  8004a5:	8d 48 01             	lea    0x1(%rax),%ecx
  8004a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004ac:	89 0a                	mov    %ecx,(%rdx)
  8004ae:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8004b1:	89 d1                	mov    %edx,%ecx
  8004b3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004b7:	48 98                	cltq   
  8004b9:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8004bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004c1:	8b 00                	mov    (%rax),%eax
  8004c3:	3d ff 00 00 00       	cmp    $0xff,%eax
  8004c8:	75 2c                	jne    8004f6 <putch+0x66>
  8004ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004ce:	8b 00                	mov    (%rax),%eax
  8004d0:	48 98                	cltq   
  8004d2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8004d6:	48 83 c2 08          	add    $0x8,%rdx
  8004da:	48 89 c6             	mov    %rax,%rsi
  8004dd:	48 89 d7             	mov    %rdx,%rdi
  8004e0:	48 b8 2e 19 80 00 00 	movabs $0x80192e,%rax
  8004e7:	00 00 00 
  8004ea:	ff d0                	callq  *%rax
  8004ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004f0:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8004f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004fa:	8b 40 04             	mov    0x4(%rax),%eax
  8004fd:	8d 50 01             	lea    0x1(%rax),%edx
  800500:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800504:	89 50 04             	mov    %edx,0x4(%rax)
  800507:	90                   	nop
  800508:	c9                   	leaveq 
  800509:	c3                   	retq   

000000000080050a <vcprintf>:
  80050a:	55                   	push   %rbp
  80050b:	48 89 e5             	mov    %rsp,%rbp
  80050e:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800515:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80051c:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800523:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80052a:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800531:	48 8b 0a             	mov    (%rdx),%rcx
  800534:	48 89 08             	mov    %rcx,(%rax)
  800537:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80053b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80053f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800543:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800547:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80054e:	00 00 00 
  800551:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800558:	00 00 00 
  80055b:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800562:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800569:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800570:	48 89 c6             	mov    %rax,%rsi
  800573:	48 bf 90 04 80 00 00 	movabs $0x800490,%rdi
  80057a:	00 00 00 
  80057d:	48 b8 54 09 80 00 00 	movabs $0x800954,%rax
  800584:	00 00 00 
  800587:	ff d0                	callq  *%rax
  800589:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  80058f:	48 98                	cltq   
  800591:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800598:	48 83 c2 08          	add    $0x8,%rdx
  80059c:	48 89 c6             	mov    %rax,%rsi
  80059f:	48 89 d7             	mov    %rdx,%rdi
  8005a2:	48 b8 2e 19 80 00 00 	movabs $0x80192e,%rax
  8005a9:	00 00 00 
  8005ac:	ff d0                	callq  *%rax
  8005ae:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8005b4:	c9                   	leaveq 
  8005b5:	c3                   	retq   

00000000008005b6 <cprintf>:
  8005b6:	55                   	push   %rbp
  8005b7:	48 89 e5             	mov    %rsp,%rbp
  8005ba:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8005c1:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8005c8:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8005cf:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8005d6:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8005dd:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8005e4:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8005eb:	84 c0                	test   %al,%al
  8005ed:	74 20                	je     80060f <cprintf+0x59>
  8005ef:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8005f3:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8005f7:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8005fb:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8005ff:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800603:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800607:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80060b:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80060f:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800616:	00 00 00 
  800619:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800620:	00 00 00 
  800623:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800627:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80062e:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800635:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80063c:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800643:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80064a:	48 8b 0a             	mov    (%rdx),%rcx
  80064d:	48 89 08             	mov    %rcx,(%rax)
  800650:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800654:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800658:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80065c:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800660:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800667:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80066e:	48 89 d6             	mov    %rdx,%rsi
  800671:	48 89 c7             	mov    %rax,%rdi
  800674:	48 b8 0a 05 80 00 00 	movabs $0x80050a,%rax
  80067b:	00 00 00 
  80067e:	ff d0                	callq  *%rax
  800680:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800686:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80068c:	c9                   	leaveq 
  80068d:	c3                   	retq   

000000000080068e <printnum>:
  80068e:	55                   	push   %rbp
  80068f:	48 89 e5             	mov    %rsp,%rbp
  800692:	48 83 ec 30          	sub    $0x30,%rsp
  800696:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80069a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80069e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8006a2:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  8006a5:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8006a9:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  8006ad:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8006b0:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8006b4:	77 54                	ja     80070a <printnum+0x7c>
  8006b6:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8006b9:	8d 78 ff             	lea    -0x1(%rax),%edi
  8006bc:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  8006bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c3:	ba 00 00 00 00       	mov    $0x0,%edx
  8006c8:	48 f7 f6             	div    %rsi
  8006cb:	49 89 c2             	mov    %rax,%r10
  8006ce:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8006d1:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8006d4:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8006d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006dc:	41 89 c9             	mov    %ecx,%r9d
  8006df:	41 89 f8             	mov    %edi,%r8d
  8006e2:	89 d1                	mov    %edx,%ecx
  8006e4:	4c 89 d2             	mov    %r10,%rdx
  8006e7:	48 89 c7             	mov    %rax,%rdi
  8006ea:	48 b8 8e 06 80 00 00 	movabs $0x80068e,%rax
  8006f1:	00 00 00 
  8006f4:	ff d0                	callq  *%rax
  8006f6:	eb 1c                	jmp    800714 <printnum+0x86>
  8006f8:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8006fc:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8006ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800703:	48 89 ce             	mov    %rcx,%rsi
  800706:	89 d7                	mov    %edx,%edi
  800708:	ff d0                	callq  *%rax
  80070a:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  80070e:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800712:	7f e4                	jg     8006f8 <printnum+0x6a>
  800714:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800717:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80071b:	ba 00 00 00 00       	mov    $0x0,%edx
  800720:	48 f7 f1             	div    %rcx
  800723:	48 b8 90 47 80 00 00 	movabs $0x804790,%rax
  80072a:	00 00 00 
  80072d:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800731:	0f be d0             	movsbl %al,%edx
  800734:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800738:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80073c:	48 89 ce             	mov    %rcx,%rsi
  80073f:	89 d7                	mov    %edx,%edi
  800741:	ff d0                	callq  *%rax
  800743:	90                   	nop
  800744:	c9                   	leaveq 
  800745:	c3                   	retq   

0000000000800746 <getuint>:
  800746:	55                   	push   %rbp
  800747:	48 89 e5             	mov    %rsp,%rbp
  80074a:	48 83 ec 20          	sub    $0x20,%rsp
  80074e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800752:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800755:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800759:	7e 4f                	jle    8007aa <getuint+0x64>
  80075b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80075f:	8b 00                	mov    (%rax),%eax
  800761:	83 f8 30             	cmp    $0x30,%eax
  800764:	73 24                	jae    80078a <getuint+0x44>
  800766:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80076a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80076e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800772:	8b 00                	mov    (%rax),%eax
  800774:	89 c0                	mov    %eax,%eax
  800776:	48 01 d0             	add    %rdx,%rax
  800779:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80077d:	8b 12                	mov    (%rdx),%edx
  80077f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800782:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800786:	89 0a                	mov    %ecx,(%rdx)
  800788:	eb 14                	jmp    80079e <getuint+0x58>
  80078a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80078e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800792:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800796:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80079a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80079e:	48 8b 00             	mov    (%rax),%rax
  8007a1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007a5:	e9 9d 00 00 00       	jmpq   800847 <getuint+0x101>
  8007aa:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007ae:	74 4c                	je     8007fc <getuint+0xb6>
  8007b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007b4:	8b 00                	mov    (%rax),%eax
  8007b6:	83 f8 30             	cmp    $0x30,%eax
  8007b9:	73 24                	jae    8007df <getuint+0x99>
  8007bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007bf:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c7:	8b 00                	mov    (%rax),%eax
  8007c9:	89 c0                	mov    %eax,%eax
  8007cb:	48 01 d0             	add    %rdx,%rax
  8007ce:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007d2:	8b 12                	mov    (%rdx),%edx
  8007d4:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007d7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007db:	89 0a                	mov    %ecx,(%rdx)
  8007dd:	eb 14                	jmp    8007f3 <getuint+0xad>
  8007df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e3:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007e7:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007eb:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ef:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007f3:	48 8b 00             	mov    (%rax),%rax
  8007f6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007fa:	eb 4b                	jmp    800847 <getuint+0x101>
  8007fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800800:	8b 00                	mov    (%rax),%eax
  800802:	83 f8 30             	cmp    $0x30,%eax
  800805:	73 24                	jae    80082b <getuint+0xe5>
  800807:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80080b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80080f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800813:	8b 00                	mov    (%rax),%eax
  800815:	89 c0                	mov    %eax,%eax
  800817:	48 01 d0             	add    %rdx,%rax
  80081a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80081e:	8b 12                	mov    (%rdx),%edx
  800820:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800823:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800827:	89 0a                	mov    %ecx,(%rdx)
  800829:	eb 14                	jmp    80083f <getuint+0xf9>
  80082b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80082f:	48 8b 40 08          	mov    0x8(%rax),%rax
  800833:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800837:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80083b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80083f:	8b 00                	mov    (%rax),%eax
  800841:	89 c0                	mov    %eax,%eax
  800843:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800847:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80084b:	c9                   	leaveq 
  80084c:	c3                   	retq   

000000000080084d <getint>:
  80084d:	55                   	push   %rbp
  80084e:	48 89 e5             	mov    %rsp,%rbp
  800851:	48 83 ec 20          	sub    $0x20,%rsp
  800855:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800859:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80085c:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800860:	7e 4f                	jle    8008b1 <getint+0x64>
  800862:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800866:	8b 00                	mov    (%rax),%eax
  800868:	83 f8 30             	cmp    $0x30,%eax
  80086b:	73 24                	jae    800891 <getint+0x44>
  80086d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800871:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800875:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800879:	8b 00                	mov    (%rax),%eax
  80087b:	89 c0                	mov    %eax,%eax
  80087d:	48 01 d0             	add    %rdx,%rax
  800880:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800884:	8b 12                	mov    (%rdx),%edx
  800886:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800889:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80088d:	89 0a                	mov    %ecx,(%rdx)
  80088f:	eb 14                	jmp    8008a5 <getint+0x58>
  800891:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800895:	48 8b 40 08          	mov    0x8(%rax),%rax
  800899:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80089d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008a1:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008a5:	48 8b 00             	mov    (%rax),%rax
  8008a8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008ac:	e9 9d 00 00 00       	jmpq   80094e <getint+0x101>
  8008b1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8008b5:	74 4c                	je     800903 <getint+0xb6>
  8008b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008bb:	8b 00                	mov    (%rax),%eax
  8008bd:	83 f8 30             	cmp    $0x30,%eax
  8008c0:	73 24                	jae    8008e6 <getint+0x99>
  8008c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008c6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ce:	8b 00                	mov    (%rax),%eax
  8008d0:	89 c0                	mov    %eax,%eax
  8008d2:	48 01 d0             	add    %rdx,%rax
  8008d5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008d9:	8b 12                	mov    (%rdx),%edx
  8008db:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008de:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008e2:	89 0a                	mov    %ecx,(%rdx)
  8008e4:	eb 14                	jmp    8008fa <getint+0xad>
  8008e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ea:	48 8b 40 08          	mov    0x8(%rax),%rax
  8008ee:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8008f2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008f6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008fa:	48 8b 00             	mov    (%rax),%rax
  8008fd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800901:	eb 4b                	jmp    80094e <getint+0x101>
  800903:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800907:	8b 00                	mov    (%rax),%eax
  800909:	83 f8 30             	cmp    $0x30,%eax
  80090c:	73 24                	jae    800932 <getint+0xe5>
  80090e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800912:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800916:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80091a:	8b 00                	mov    (%rax),%eax
  80091c:	89 c0                	mov    %eax,%eax
  80091e:	48 01 d0             	add    %rdx,%rax
  800921:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800925:	8b 12                	mov    (%rdx),%edx
  800927:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80092a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80092e:	89 0a                	mov    %ecx,(%rdx)
  800930:	eb 14                	jmp    800946 <getint+0xf9>
  800932:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800936:	48 8b 40 08          	mov    0x8(%rax),%rax
  80093a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80093e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800942:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800946:	8b 00                	mov    (%rax),%eax
  800948:	48 98                	cltq   
  80094a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80094e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800952:	c9                   	leaveq 
  800953:	c3                   	retq   

0000000000800954 <vprintfmt>:
  800954:	55                   	push   %rbp
  800955:	48 89 e5             	mov    %rsp,%rbp
  800958:	41 54                	push   %r12
  80095a:	53                   	push   %rbx
  80095b:	48 83 ec 60          	sub    $0x60,%rsp
  80095f:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800963:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800967:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80096b:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  80096f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800973:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800977:	48 8b 0a             	mov    (%rdx),%rcx
  80097a:	48 89 08             	mov    %rcx,(%rax)
  80097d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800981:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800985:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800989:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80098d:	eb 17                	jmp    8009a6 <vprintfmt+0x52>
  80098f:	85 db                	test   %ebx,%ebx
  800991:	0f 84 b9 04 00 00    	je     800e50 <vprintfmt+0x4fc>
  800997:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80099b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80099f:	48 89 d6             	mov    %rdx,%rsi
  8009a2:	89 df                	mov    %ebx,%edi
  8009a4:	ff d0                	callq  *%rax
  8009a6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009aa:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8009ae:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009b2:	0f b6 00             	movzbl (%rax),%eax
  8009b5:	0f b6 d8             	movzbl %al,%ebx
  8009b8:	83 fb 25             	cmp    $0x25,%ebx
  8009bb:	75 d2                	jne    80098f <vprintfmt+0x3b>
  8009bd:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8009c1:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8009c8:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009cf:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8009d6:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8009dd:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009e1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8009e5:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8009e9:	0f b6 00             	movzbl (%rax),%eax
  8009ec:	0f b6 d8             	movzbl %al,%ebx
  8009ef:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8009f2:	83 f8 55             	cmp    $0x55,%eax
  8009f5:	0f 87 22 04 00 00    	ja     800e1d <vprintfmt+0x4c9>
  8009fb:	89 c0                	mov    %eax,%eax
  8009fd:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800a04:	00 
  800a05:	48 b8 b8 47 80 00 00 	movabs $0x8047b8,%rax
  800a0c:	00 00 00 
  800a0f:	48 01 d0             	add    %rdx,%rax
  800a12:	48 8b 00             	mov    (%rax),%rax
  800a15:	ff e0                	jmpq   *%rax
  800a17:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800a1b:	eb c0                	jmp    8009dd <vprintfmt+0x89>
  800a1d:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800a21:	eb ba                	jmp    8009dd <vprintfmt+0x89>
  800a23:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800a2a:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800a2d:	89 d0                	mov    %edx,%eax
  800a2f:	c1 e0 02             	shl    $0x2,%eax
  800a32:	01 d0                	add    %edx,%eax
  800a34:	01 c0                	add    %eax,%eax
  800a36:	01 d8                	add    %ebx,%eax
  800a38:	83 e8 30             	sub    $0x30,%eax
  800a3b:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a3e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a42:	0f b6 00             	movzbl (%rax),%eax
  800a45:	0f be d8             	movsbl %al,%ebx
  800a48:	83 fb 2f             	cmp    $0x2f,%ebx
  800a4b:	7e 60                	jle    800aad <vprintfmt+0x159>
  800a4d:	83 fb 39             	cmp    $0x39,%ebx
  800a50:	7f 5b                	jg     800aad <vprintfmt+0x159>
  800a52:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800a57:	eb d1                	jmp    800a2a <vprintfmt+0xd6>
  800a59:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a5c:	83 f8 30             	cmp    $0x30,%eax
  800a5f:	73 17                	jae    800a78 <vprintfmt+0x124>
  800a61:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a65:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a68:	89 d2                	mov    %edx,%edx
  800a6a:	48 01 d0             	add    %rdx,%rax
  800a6d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a70:	83 c2 08             	add    $0x8,%edx
  800a73:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a76:	eb 0c                	jmp    800a84 <vprintfmt+0x130>
  800a78:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a7c:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a80:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a84:	8b 00                	mov    (%rax),%eax
  800a86:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800a89:	eb 23                	jmp    800aae <vprintfmt+0x15a>
  800a8b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a8f:	0f 89 48 ff ff ff    	jns    8009dd <vprintfmt+0x89>
  800a95:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800a9c:	e9 3c ff ff ff       	jmpq   8009dd <vprintfmt+0x89>
  800aa1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800aa8:	e9 30 ff ff ff       	jmpq   8009dd <vprintfmt+0x89>
  800aad:	90                   	nop
  800aae:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ab2:	0f 89 25 ff ff ff    	jns    8009dd <vprintfmt+0x89>
  800ab8:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800abb:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800abe:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800ac5:	e9 13 ff ff ff       	jmpq   8009dd <vprintfmt+0x89>
  800aca:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800ace:	e9 0a ff ff ff       	jmpq   8009dd <vprintfmt+0x89>
  800ad3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ad6:	83 f8 30             	cmp    $0x30,%eax
  800ad9:	73 17                	jae    800af2 <vprintfmt+0x19e>
  800adb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800adf:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ae2:	89 d2                	mov    %edx,%edx
  800ae4:	48 01 d0             	add    %rdx,%rax
  800ae7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800aea:	83 c2 08             	add    $0x8,%edx
  800aed:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800af0:	eb 0c                	jmp    800afe <vprintfmt+0x1aa>
  800af2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800af6:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800afa:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800afe:	8b 10                	mov    (%rax),%edx
  800b00:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b04:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b08:	48 89 ce             	mov    %rcx,%rsi
  800b0b:	89 d7                	mov    %edx,%edi
  800b0d:	ff d0                	callq  *%rax
  800b0f:	e9 37 03 00 00       	jmpq   800e4b <vprintfmt+0x4f7>
  800b14:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b17:	83 f8 30             	cmp    $0x30,%eax
  800b1a:	73 17                	jae    800b33 <vprintfmt+0x1df>
  800b1c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b20:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b23:	89 d2                	mov    %edx,%edx
  800b25:	48 01 d0             	add    %rdx,%rax
  800b28:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b2b:	83 c2 08             	add    $0x8,%edx
  800b2e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b31:	eb 0c                	jmp    800b3f <vprintfmt+0x1eb>
  800b33:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b37:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b3b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b3f:	8b 18                	mov    (%rax),%ebx
  800b41:	85 db                	test   %ebx,%ebx
  800b43:	79 02                	jns    800b47 <vprintfmt+0x1f3>
  800b45:	f7 db                	neg    %ebx
  800b47:	83 fb 15             	cmp    $0x15,%ebx
  800b4a:	7f 16                	jg     800b62 <vprintfmt+0x20e>
  800b4c:	48 b8 e0 46 80 00 00 	movabs $0x8046e0,%rax
  800b53:	00 00 00 
  800b56:	48 63 d3             	movslq %ebx,%rdx
  800b59:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800b5d:	4d 85 e4             	test   %r12,%r12
  800b60:	75 2e                	jne    800b90 <vprintfmt+0x23c>
  800b62:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b66:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b6a:	89 d9                	mov    %ebx,%ecx
  800b6c:	48 ba a1 47 80 00 00 	movabs $0x8047a1,%rdx
  800b73:	00 00 00 
  800b76:	48 89 c7             	mov    %rax,%rdi
  800b79:	b8 00 00 00 00       	mov    $0x0,%eax
  800b7e:	49 b8 5a 0e 80 00 00 	movabs $0x800e5a,%r8
  800b85:	00 00 00 
  800b88:	41 ff d0             	callq  *%r8
  800b8b:	e9 bb 02 00 00       	jmpq   800e4b <vprintfmt+0x4f7>
  800b90:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b94:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b98:	4c 89 e1             	mov    %r12,%rcx
  800b9b:	48 ba aa 47 80 00 00 	movabs $0x8047aa,%rdx
  800ba2:	00 00 00 
  800ba5:	48 89 c7             	mov    %rax,%rdi
  800ba8:	b8 00 00 00 00       	mov    $0x0,%eax
  800bad:	49 b8 5a 0e 80 00 00 	movabs $0x800e5a,%r8
  800bb4:	00 00 00 
  800bb7:	41 ff d0             	callq  *%r8
  800bba:	e9 8c 02 00 00       	jmpq   800e4b <vprintfmt+0x4f7>
  800bbf:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bc2:	83 f8 30             	cmp    $0x30,%eax
  800bc5:	73 17                	jae    800bde <vprintfmt+0x28a>
  800bc7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800bcb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bce:	89 d2                	mov    %edx,%edx
  800bd0:	48 01 d0             	add    %rdx,%rax
  800bd3:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bd6:	83 c2 08             	add    $0x8,%edx
  800bd9:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bdc:	eb 0c                	jmp    800bea <vprintfmt+0x296>
  800bde:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800be2:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800be6:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bea:	4c 8b 20             	mov    (%rax),%r12
  800bed:	4d 85 e4             	test   %r12,%r12
  800bf0:	75 0a                	jne    800bfc <vprintfmt+0x2a8>
  800bf2:	49 bc ad 47 80 00 00 	movabs $0x8047ad,%r12
  800bf9:	00 00 00 
  800bfc:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c00:	7e 78                	jle    800c7a <vprintfmt+0x326>
  800c02:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800c06:	74 72                	je     800c7a <vprintfmt+0x326>
  800c08:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800c0b:	48 98                	cltq   
  800c0d:	48 89 c6             	mov    %rax,%rsi
  800c10:	4c 89 e7             	mov    %r12,%rdi
  800c13:	48 b8 08 11 80 00 00 	movabs $0x801108,%rax
  800c1a:	00 00 00 
  800c1d:	ff d0                	callq  *%rax
  800c1f:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800c22:	eb 17                	jmp    800c3b <vprintfmt+0x2e7>
  800c24:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800c28:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c2c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c30:	48 89 ce             	mov    %rcx,%rsi
  800c33:	89 d7                	mov    %edx,%edi
  800c35:	ff d0                	callq  *%rax
  800c37:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c3b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c3f:	7f e3                	jg     800c24 <vprintfmt+0x2d0>
  800c41:	eb 37                	jmp    800c7a <vprintfmt+0x326>
  800c43:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800c47:	74 1e                	je     800c67 <vprintfmt+0x313>
  800c49:	83 fb 1f             	cmp    $0x1f,%ebx
  800c4c:	7e 05                	jle    800c53 <vprintfmt+0x2ff>
  800c4e:	83 fb 7e             	cmp    $0x7e,%ebx
  800c51:	7e 14                	jle    800c67 <vprintfmt+0x313>
  800c53:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c57:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c5b:	48 89 d6             	mov    %rdx,%rsi
  800c5e:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800c63:	ff d0                	callq  *%rax
  800c65:	eb 0f                	jmp    800c76 <vprintfmt+0x322>
  800c67:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c6b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c6f:	48 89 d6             	mov    %rdx,%rsi
  800c72:	89 df                	mov    %ebx,%edi
  800c74:	ff d0                	callq  *%rax
  800c76:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c7a:	4c 89 e0             	mov    %r12,%rax
  800c7d:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800c81:	0f b6 00             	movzbl (%rax),%eax
  800c84:	0f be d8             	movsbl %al,%ebx
  800c87:	85 db                	test   %ebx,%ebx
  800c89:	74 28                	je     800cb3 <vprintfmt+0x35f>
  800c8b:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c8f:	78 b2                	js     800c43 <vprintfmt+0x2ef>
  800c91:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800c95:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c99:	79 a8                	jns    800c43 <vprintfmt+0x2ef>
  800c9b:	eb 16                	jmp    800cb3 <vprintfmt+0x35f>
  800c9d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ca1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ca5:	48 89 d6             	mov    %rdx,%rsi
  800ca8:	bf 20 00 00 00       	mov    $0x20,%edi
  800cad:	ff d0                	callq  *%rax
  800caf:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800cb3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cb7:	7f e4                	jg     800c9d <vprintfmt+0x349>
  800cb9:	e9 8d 01 00 00       	jmpq   800e4b <vprintfmt+0x4f7>
  800cbe:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cc2:	be 03 00 00 00       	mov    $0x3,%esi
  800cc7:	48 89 c7             	mov    %rax,%rdi
  800cca:	48 b8 4d 08 80 00 00 	movabs $0x80084d,%rax
  800cd1:	00 00 00 
  800cd4:	ff d0                	callq  *%rax
  800cd6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cde:	48 85 c0             	test   %rax,%rax
  800ce1:	79 1d                	jns    800d00 <vprintfmt+0x3ac>
  800ce3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ce7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ceb:	48 89 d6             	mov    %rdx,%rsi
  800cee:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800cf3:	ff d0                	callq  *%rax
  800cf5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cf9:	48 f7 d8             	neg    %rax
  800cfc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d00:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d07:	e9 d2 00 00 00       	jmpq   800dde <vprintfmt+0x48a>
  800d0c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d10:	be 03 00 00 00       	mov    $0x3,%esi
  800d15:	48 89 c7             	mov    %rax,%rdi
  800d18:	48 b8 46 07 80 00 00 	movabs $0x800746,%rax
  800d1f:	00 00 00 
  800d22:	ff d0                	callq  *%rax
  800d24:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d28:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800d2f:	e9 aa 00 00 00       	jmpq   800dde <vprintfmt+0x48a>
  800d34:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d38:	be 03 00 00 00       	mov    $0x3,%esi
  800d3d:	48 89 c7             	mov    %rax,%rdi
  800d40:	48 b8 46 07 80 00 00 	movabs $0x800746,%rax
  800d47:	00 00 00 
  800d4a:	ff d0                	callq  *%rax
  800d4c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d50:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800d57:	e9 82 00 00 00       	jmpq   800dde <vprintfmt+0x48a>
  800d5c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d60:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d64:	48 89 d6             	mov    %rdx,%rsi
  800d67:	bf 30 00 00 00       	mov    $0x30,%edi
  800d6c:	ff d0                	callq  *%rax
  800d6e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d72:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d76:	48 89 d6             	mov    %rdx,%rsi
  800d79:	bf 78 00 00 00       	mov    $0x78,%edi
  800d7e:	ff d0                	callq  *%rax
  800d80:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d83:	83 f8 30             	cmp    $0x30,%eax
  800d86:	73 17                	jae    800d9f <vprintfmt+0x44b>
  800d88:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d8c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d8f:	89 d2                	mov    %edx,%edx
  800d91:	48 01 d0             	add    %rdx,%rax
  800d94:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d97:	83 c2 08             	add    $0x8,%edx
  800d9a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d9d:	eb 0c                	jmp    800dab <vprintfmt+0x457>
  800d9f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800da3:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800da7:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800dab:	48 8b 00             	mov    (%rax),%rax
  800dae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800db2:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800db9:	eb 23                	jmp    800dde <vprintfmt+0x48a>
  800dbb:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800dbf:	be 03 00 00 00       	mov    $0x3,%esi
  800dc4:	48 89 c7             	mov    %rax,%rdi
  800dc7:	48 b8 46 07 80 00 00 	movabs $0x800746,%rax
  800dce:	00 00 00 
  800dd1:	ff d0                	callq  *%rax
  800dd3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dd7:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800dde:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800de3:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800de6:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800de9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ded:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800df1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800df5:	45 89 c1             	mov    %r8d,%r9d
  800df8:	41 89 f8             	mov    %edi,%r8d
  800dfb:	48 89 c7             	mov    %rax,%rdi
  800dfe:	48 b8 8e 06 80 00 00 	movabs $0x80068e,%rax
  800e05:	00 00 00 
  800e08:	ff d0                	callq  *%rax
  800e0a:	eb 3f                	jmp    800e4b <vprintfmt+0x4f7>
  800e0c:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e10:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e14:	48 89 d6             	mov    %rdx,%rsi
  800e17:	89 df                	mov    %ebx,%edi
  800e19:	ff d0                	callq  *%rax
  800e1b:	eb 2e                	jmp    800e4b <vprintfmt+0x4f7>
  800e1d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e21:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e25:	48 89 d6             	mov    %rdx,%rsi
  800e28:	bf 25 00 00 00       	mov    $0x25,%edi
  800e2d:	ff d0                	callq  *%rax
  800e2f:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e34:	eb 05                	jmp    800e3b <vprintfmt+0x4e7>
  800e36:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800e3b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800e3f:	48 83 e8 01          	sub    $0x1,%rax
  800e43:	0f b6 00             	movzbl (%rax),%eax
  800e46:	3c 25                	cmp    $0x25,%al
  800e48:	75 ec                	jne    800e36 <vprintfmt+0x4e2>
  800e4a:	90                   	nop
  800e4b:	e9 3d fb ff ff       	jmpq   80098d <vprintfmt+0x39>
  800e50:	90                   	nop
  800e51:	48 83 c4 60          	add    $0x60,%rsp
  800e55:	5b                   	pop    %rbx
  800e56:	41 5c                	pop    %r12
  800e58:	5d                   	pop    %rbp
  800e59:	c3                   	retq   

0000000000800e5a <printfmt>:
  800e5a:	55                   	push   %rbp
  800e5b:	48 89 e5             	mov    %rsp,%rbp
  800e5e:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800e65:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800e6c:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800e73:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800e7a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800e81:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e88:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e8f:	84 c0                	test   %al,%al
  800e91:	74 20                	je     800eb3 <printfmt+0x59>
  800e93:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e97:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e9b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e9f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800ea3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800ea7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800eab:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800eaf:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800eb3:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800eba:	00 00 00 
  800ebd:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800ec4:	00 00 00 
  800ec7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800ecb:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800ed2:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800ed9:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800ee0:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800ee7:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800eee:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800ef5:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800efc:	48 89 c7             	mov    %rax,%rdi
  800eff:	48 b8 54 09 80 00 00 	movabs $0x800954,%rax
  800f06:	00 00 00 
  800f09:	ff d0                	callq  *%rax
  800f0b:	90                   	nop
  800f0c:	c9                   	leaveq 
  800f0d:	c3                   	retq   

0000000000800f0e <sprintputch>:
  800f0e:	55                   	push   %rbp
  800f0f:	48 89 e5             	mov    %rsp,%rbp
  800f12:	48 83 ec 10          	sub    $0x10,%rsp
  800f16:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800f19:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f21:	8b 40 10             	mov    0x10(%rax),%eax
  800f24:	8d 50 01             	lea    0x1(%rax),%edx
  800f27:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f2b:	89 50 10             	mov    %edx,0x10(%rax)
  800f2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f32:	48 8b 10             	mov    (%rax),%rdx
  800f35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f39:	48 8b 40 08          	mov    0x8(%rax),%rax
  800f3d:	48 39 c2             	cmp    %rax,%rdx
  800f40:	73 17                	jae    800f59 <sprintputch+0x4b>
  800f42:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f46:	48 8b 00             	mov    (%rax),%rax
  800f49:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800f4d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800f51:	48 89 0a             	mov    %rcx,(%rdx)
  800f54:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800f57:	88 10                	mov    %dl,(%rax)
  800f59:	90                   	nop
  800f5a:	c9                   	leaveq 
  800f5b:	c3                   	retq   

0000000000800f5c <vsnprintf>:
  800f5c:	55                   	push   %rbp
  800f5d:	48 89 e5             	mov    %rsp,%rbp
  800f60:	48 83 ec 50          	sub    $0x50,%rsp
  800f64:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800f68:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800f6b:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800f6f:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800f73:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800f77:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800f7b:	48 8b 0a             	mov    (%rdx),%rcx
  800f7e:	48 89 08             	mov    %rcx,(%rax)
  800f81:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800f85:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800f89:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800f8d:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f91:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f95:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800f99:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800f9c:	48 98                	cltq   
  800f9e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800fa2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800fa6:	48 01 d0             	add    %rdx,%rax
  800fa9:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800fad:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800fb4:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800fb9:	74 06                	je     800fc1 <vsnprintf+0x65>
  800fbb:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800fbf:	7f 07                	jg     800fc8 <vsnprintf+0x6c>
  800fc1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800fc6:	eb 2f                	jmp    800ff7 <vsnprintf+0x9b>
  800fc8:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800fcc:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800fd0:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800fd4:	48 89 c6             	mov    %rax,%rsi
  800fd7:	48 bf 0e 0f 80 00 00 	movabs $0x800f0e,%rdi
  800fde:	00 00 00 
  800fe1:	48 b8 54 09 80 00 00 	movabs $0x800954,%rax
  800fe8:	00 00 00 
  800feb:	ff d0                	callq  *%rax
  800fed:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800ff1:	c6 00 00             	movb   $0x0,(%rax)
  800ff4:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800ff7:	c9                   	leaveq 
  800ff8:	c3                   	retq   

0000000000800ff9 <snprintf>:
  800ff9:	55                   	push   %rbp
  800ffa:	48 89 e5             	mov    %rsp,%rbp
  800ffd:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801004:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80100b:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801011:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801018:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80101f:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  801026:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80102d:	84 c0                	test   %al,%al
  80102f:	74 20                	je     801051 <snprintf+0x58>
  801031:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801035:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801039:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80103d:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801041:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801045:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801049:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80104d:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801051:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  801058:	00 00 00 
  80105b:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801062:	00 00 00 
  801065:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801069:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801070:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801077:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80107e:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801085:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80108c:	48 8b 0a             	mov    (%rdx),%rcx
  80108f:	48 89 08             	mov    %rcx,(%rax)
  801092:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801096:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80109a:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80109e:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8010a2:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  8010a9:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  8010b0:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  8010b6:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8010bd:	48 89 c7             	mov    %rax,%rdi
  8010c0:	48 b8 5c 0f 80 00 00 	movabs $0x800f5c,%rax
  8010c7:	00 00 00 
  8010ca:	ff d0                	callq  *%rax
  8010cc:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8010d2:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8010d8:	c9                   	leaveq 
  8010d9:	c3                   	retq   

00000000008010da <strlen>:
  8010da:	55                   	push   %rbp
  8010db:	48 89 e5             	mov    %rsp,%rbp
  8010de:	48 83 ec 18          	sub    $0x18,%rsp
  8010e2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010e6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8010ed:	eb 09                	jmp    8010f8 <strlen+0x1e>
  8010ef:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8010f3:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8010f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010fc:	0f b6 00             	movzbl (%rax),%eax
  8010ff:	84 c0                	test   %al,%al
  801101:	75 ec                	jne    8010ef <strlen+0x15>
  801103:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801106:	c9                   	leaveq 
  801107:	c3                   	retq   

0000000000801108 <strnlen>:
  801108:	55                   	push   %rbp
  801109:	48 89 e5             	mov    %rsp,%rbp
  80110c:	48 83 ec 20          	sub    $0x20,%rsp
  801110:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801114:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801118:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80111f:	eb 0e                	jmp    80112f <strnlen+0x27>
  801121:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801125:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80112a:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  80112f:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801134:	74 0b                	je     801141 <strnlen+0x39>
  801136:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80113a:	0f b6 00             	movzbl (%rax),%eax
  80113d:	84 c0                	test   %al,%al
  80113f:	75 e0                	jne    801121 <strnlen+0x19>
  801141:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801144:	c9                   	leaveq 
  801145:	c3                   	retq   

0000000000801146 <strcpy>:
  801146:	55                   	push   %rbp
  801147:	48 89 e5             	mov    %rsp,%rbp
  80114a:	48 83 ec 20          	sub    $0x20,%rsp
  80114e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801152:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801156:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80115a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80115e:	90                   	nop
  80115f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801163:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801167:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80116b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80116f:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801173:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801177:	0f b6 12             	movzbl (%rdx),%edx
  80117a:	88 10                	mov    %dl,(%rax)
  80117c:	0f b6 00             	movzbl (%rax),%eax
  80117f:	84 c0                	test   %al,%al
  801181:	75 dc                	jne    80115f <strcpy+0x19>
  801183:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801187:	c9                   	leaveq 
  801188:	c3                   	retq   

0000000000801189 <strcat>:
  801189:	55                   	push   %rbp
  80118a:	48 89 e5             	mov    %rsp,%rbp
  80118d:	48 83 ec 20          	sub    $0x20,%rsp
  801191:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801195:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801199:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80119d:	48 89 c7             	mov    %rax,%rdi
  8011a0:	48 b8 da 10 80 00 00 	movabs $0x8010da,%rax
  8011a7:	00 00 00 
  8011aa:	ff d0                	callq  *%rax
  8011ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8011af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011b2:	48 63 d0             	movslq %eax,%rdx
  8011b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011b9:	48 01 c2             	add    %rax,%rdx
  8011bc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011c0:	48 89 c6             	mov    %rax,%rsi
  8011c3:	48 89 d7             	mov    %rdx,%rdi
  8011c6:	48 b8 46 11 80 00 00 	movabs $0x801146,%rax
  8011cd:	00 00 00 
  8011d0:	ff d0                	callq  *%rax
  8011d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011d6:	c9                   	leaveq 
  8011d7:	c3                   	retq   

00000000008011d8 <strncpy>:
  8011d8:	55                   	push   %rbp
  8011d9:	48 89 e5             	mov    %rsp,%rbp
  8011dc:	48 83 ec 28          	sub    $0x28,%rsp
  8011e0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011e4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011e8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011f0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8011f4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8011fb:	00 
  8011fc:	eb 2a                	jmp    801228 <strncpy+0x50>
  8011fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801202:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801206:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80120a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80120e:	0f b6 12             	movzbl (%rdx),%edx
  801211:	88 10                	mov    %dl,(%rax)
  801213:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801217:	0f b6 00             	movzbl (%rax),%eax
  80121a:	84 c0                	test   %al,%al
  80121c:	74 05                	je     801223 <strncpy+0x4b>
  80121e:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801223:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801228:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80122c:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801230:	72 cc                	jb     8011fe <strncpy+0x26>
  801232:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801236:	c9                   	leaveq 
  801237:	c3                   	retq   

0000000000801238 <strlcpy>:
  801238:	55                   	push   %rbp
  801239:	48 89 e5             	mov    %rsp,%rbp
  80123c:	48 83 ec 28          	sub    $0x28,%rsp
  801240:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801244:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801248:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80124c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801250:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801254:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801259:	74 3d                	je     801298 <strlcpy+0x60>
  80125b:	eb 1d                	jmp    80127a <strlcpy+0x42>
  80125d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801261:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801265:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801269:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80126d:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801271:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801275:	0f b6 12             	movzbl (%rdx),%edx
  801278:	88 10                	mov    %dl,(%rax)
  80127a:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80127f:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801284:	74 0b                	je     801291 <strlcpy+0x59>
  801286:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80128a:	0f b6 00             	movzbl (%rax),%eax
  80128d:	84 c0                	test   %al,%al
  80128f:	75 cc                	jne    80125d <strlcpy+0x25>
  801291:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801295:	c6 00 00             	movb   $0x0,(%rax)
  801298:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80129c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012a0:	48 29 c2             	sub    %rax,%rdx
  8012a3:	48 89 d0             	mov    %rdx,%rax
  8012a6:	c9                   	leaveq 
  8012a7:	c3                   	retq   

00000000008012a8 <strcmp>:
  8012a8:	55                   	push   %rbp
  8012a9:	48 89 e5             	mov    %rsp,%rbp
  8012ac:	48 83 ec 10          	sub    $0x10,%rsp
  8012b0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012b4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8012b8:	eb 0a                	jmp    8012c4 <strcmp+0x1c>
  8012ba:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012bf:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8012c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c8:	0f b6 00             	movzbl (%rax),%eax
  8012cb:	84 c0                	test   %al,%al
  8012cd:	74 12                	je     8012e1 <strcmp+0x39>
  8012cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012d3:	0f b6 10             	movzbl (%rax),%edx
  8012d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012da:	0f b6 00             	movzbl (%rax),%eax
  8012dd:	38 c2                	cmp    %al,%dl
  8012df:	74 d9                	je     8012ba <strcmp+0x12>
  8012e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012e5:	0f b6 00             	movzbl (%rax),%eax
  8012e8:	0f b6 d0             	movzbl %al,%edx
  8012eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012ef:	0f b6 00             	movzbl (%rax),%eax
  8012f2:	0f b6 c0             	movzbl %al,%eax
  8012f5:	29 c2                	sub    %eax,%edx
  8012f7:	89 d0                	mov    %edx,%eax
  8012f9:	c9                   	leaveq 
  8012fa:	c3                   	retq   

00000000008012fb <strncmp>:
  8012fb:	55                   	push   %rbp
  8012fc:	48 89 e5             	mov    %rsp,%rbp
  8012ff:	48 83 ec 18          	sub    $0x18,%rsp
  801303:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801307:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80130b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80130f:	eb 0f                	jmp    801320 <strncmp+0x25>
  801311:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801316:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80131b:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801320:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801325:	74 1d                	je     801344 <strncmp+0x49>
  801327:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80132b:	0f b6 00             	movzbl (%rax),%eax
  80132e:	84 c0                	test   %al,%al
  801330:	74 12                	je     801344 <strncmp+0x49>
  801332:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801336:	0f b6 10             	movzbl (%rax),%edx
  801339:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80133d:	0f b6 00             	movzbl (%rax),%eax
  801340:	38 c2                	cmp    %al,%dl
  801342:	74 cd                	je     801311 <strncmp+0x16>
  801344:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801349:	75 07                	jne    801352 <strncmp+0x57>
  80134b:	b8 00 00 00 00       	mov    $0x0,%eax
  801350:	eb 18                	jmp    80136a <strncmp+0x6f>
  801352:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801356:	0f b6 00             	movzbl (%rax),%eax
  801359:	0f b6 d0             	movzbl %al,%edx
  80135c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801360:	0f b6 00             	movzbl (%rax),%eax
  801363:	0f b6 c0             	movzbl %al,%eax
  801366:	29 c2                	sub    %eax,%edx
  801368:	89 d0                	mov    %edx,%eax
  80136a:	c9                   	leaveq 
  80136b:	c3                   	retq   

000000000080136c <strchr>:
  80136c:	55                   	push   %rbp
  80136d:	48 89 e5             	mov    %rsp,%rbp
  801370:	48 83 ec 10          	sub    $0x10,%rsp
  801374:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801378:	89 f0                	mov    %esi,%eax
  80137a:	88 45 f4             	mov    %al,-0xc(%rbp)
  80137d:	eb 17                	jmp    801396 <strchr+0x2a>
  80137f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801383:	0f b6 00             	movzbl (%rax),%eax
  801386:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801389:	75 06                	jne    801391 <strchr+0x25>
  80138b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80138f:	eb 15                	jmp    8013a6 <strchr+0x3a>
  801391:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801396:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80139a:	0f b6 00             	movzbl (%rax),%eax
  80139d:	84 c0                	test   %al,%al
  80139f:	75 de                	jne    80137f <strchr+0x13>
  8013a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8013a6:	c9                   	leaveq 
  8013a7:	c3                   	retq   

00000000008013a8 <strfind>:
  8013a8:	55                   	push   %rbp
  8013a9:	48 89 e5             	mov    %rsp,%rbp
  8013ac:	48 83 ec 10          	sub    $0x10,%rsp
  8013b0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013b4:	89 f0                	mov    %esi,%eax
  8013b6:	88 45 f4             	mov    %al,-0xc(%rbp)
  8013b9:	eb 11                	jmp    8013cc <strfind+0x24>
  8013bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013bf:	0f b6 00             	movzbl (%rax),%eax
  8013c2:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8013c5:	74 12                	je     8013d9 <strfind+0x31>
  8013c7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013d0:	0f b6 00             	movzbl (%rax),%eax
  8013d3:	84 c0                	test   %al,%al
  8013d5:	75 e4                	jne    8013bb <strfind+0x13>
  8013d7:	eb 01                	jmp    8013da <strfind+0x32>
  8013d9:	90                   	nop
  8013da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013de:	c9                   	leaveq 
  8013df:	c3                   	retq   

00000000008013e0 <memset>:
  8013e0:	55                   	push   %rbp
  8013e1:	48 89 e5             	mov    %rsp,%rbp
  8013e4:	48 83 ec 18          	sub    $0x18,%rsp
  8013e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013ec:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8013ef:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013f3:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013f8:	75 06                	jne    801400 <memset+0x20>
  8013fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013fe:	eb 69                	jmp    801469 <memset+0x89>
  801400:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801404:	83 e0 03             	and    $0x3,%eax
  801407:	48 85 c0             	test   %rax,%rax
  80140a:	75 48                	jne    801454 <memset+0x74>
  80140c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801410:	83 e0 03             	and    $0x3,%eax
  801413:	48 85 c0             	test   %rax,%rax
  801416:	75 3c                	jne    801454 <memset+0x74>
  801418:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  80141f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801422:	c1 e0 18             	shl    $0x18,%eax
  801425:	89 c2                	mov    %eax,%edx
  801427:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80142a:	c1 e0 10             	shl    $0x10,%eax
  80142d:	09 c2                	or     %eax,%edx
  80142f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801432:	c1 e0 08             	shl    $0x8,%eax
  801435:	09 d0                	or     %edx,%eax
  801437:	09 45 f4             	or     %eax,-0xc(%rbp)
  80143a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80143e:	48 c1 e8 02          	shr    $0x2,%rax
  801442:	48 89 c1             	mov    %rax,%rcx
  801445:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801449:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80144c:	48 89 d7             	mov    %rdx,%rdi
  80144f:	fc                   	cld    
  801450:	f3 ab                	rep stos %eax,%es:(%rdi)
  801452:	eb 11                	jmp    801465 <memset+0x85>
  801454:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801458:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80145b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80145f:	48 89 d7             	mov    %rdx,%rdi
  801462:	fc                   	cld    
  801463:	f3 aa                	rep stos %al,%es:(%rdi)
  801465:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801469:	c9                   	leaveq 
  80146a:	c3                   	retq   

000000000080146b <memmove>:
  80146b:	55                   	push   %rbp
  80146c:	48 89 e5             	mov    %rsp,%rbp
  80146f:	48 83 ec 28          	sub    $0x28,%rsp
  801473:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801477:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80147b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80147f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801483:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801487:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80148b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80148f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801493:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801497:	0f 83 88 00 00 00    	jae    801525 <memmove+0xba>
  80149d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014a5:	48 01 d0             	add    %rdx,%rax
  8014a8:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8014ac:	76 77                	jbe    801525 <memmove+0xba>
  8014ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014b2:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8014b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014ba:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8014be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014c2:	83 e0 03             	and    $0x3,%eax
  8014c5:	48 85 c0             	test   %rax,%rax
  8014c8:	75 3b                	jne    801505 <memmove+0x9a>
  8014ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014ce:	83 e0 03             	and    $0x3,%eax
  8014d1:	48 85 c0             	test   %rax,%rax
  8014d4:	75 2f                	jne    801505 <memmove+0x9a>
  8014d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014da:	83 e0 03             	and    $0x3,%eax
  8014dd:	48 85 c0             	test   %rax,%rax
  8014e0:	75 23                	jne    801505 <memmove+0x9a>
  8014e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014e6:	48 83 e8 04          	sub    $0x4,%rax
  8014ea:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014ee:	48 83 ea 04          	sub    $0x4,%rdx
  8014f2:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014f6:	48 c1 e9 02          	shr    $0x2,%rcx
  8014fa:	48 89 c7             	mov    %rax,%rdi
  8014fd:	48 89 d6             	mov    %rdx,%rsi
  801500:	fd                   	std    
  801501:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801503:	eb 1d                	jmp    801522 <memmove+0xb7>
  801505:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801509:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80150d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801511:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801515:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801519:	48 89 d7             	mov    %rdx,%rdi
  80151c:	48 89 c1             	mov    %rax,%rcx
  80151f:	fd                   	std    
  801520:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801522:	fc                   	cld    
  801523:	eb 57                	jmp    80157c <memmove+0x111>
  801525:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801529:	83 e0 03             	and    $0x3,%eax
  80152c:	48 85 c0             	test   %rax,%rax
  80152f:	75 36                	jne    801567 <memmove+0xfc>
  801531:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801535:	83 e0 03             	and    $0x3,%eax
  801538:	48 85 c0             	test   %rax,%rax
  80153b:	75 2a                	jne    801567 <memmove+0xfc>
  80153d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801541:	83 e0 03             	and    $0x3,%eax
  801544:	48 85 c0             	test   %rax,%rax
  801547:	75 1e                	jne    801567 <memmove+0xfc>
  801549:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80154d:	48 c1 e8 02          	shr    $0x2,%rax
  801551:	48 89 c1             	mov    %rax,%rcx
  801554:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801558:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80155c:	48 89 c7             	mov    %rax,%rdi
  80155f:	48 89 d6             	mov    %rdx,%rsi
  801562:	fc                   	cld    
  801563:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801565:	eb 15                	jmp    80157c <memmove+0x111>
  801567:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80156b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80156f:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801573:	48 89 c7             	mov    %rax,%rdi
  801576:	48 89 d6             	mov    %rdx,%rsi
  801579:	fc                   	cld    
  80157a:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80157c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801580:	c9                   	leaveq 
  801581:	c3                   	retq   

0000000000801582 <memcpy>:
  801582:	55                   	push   %rbp
  801583:	48 89 e5             	mov    %rsp,%rbp
  801586:	48 83 ec 18          	sub    $0x18,%rsp
  80158a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80158e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801592:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801596:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80159a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80159e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015a2:	48 89 ce             	mov    %rcx,%rsi
  8015a5:	48 89 c7             	mov    %rax,%rdi
  8015a8:	48 b8 6b 14 80 00 00 	movabs $0x80146b,%rax
  8015af:	00 00 00 
  8015b2:	ff d0                	callq  *%rax
  8015b4:	c9                   	leaveq 
  8015b5:	c3                   	retq   

00000000008015b6 <memcmp>:
  8015b6:	55                   	push   %rbp
  8015b7:	48 89 e5             	mov    %rsp,%rbp
  8015ba:	48 83 ec 28          	sub    $0x28,%rsp
  8015be:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015c2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8015c6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015ce:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015d2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8015d6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015da:	eb 36                	jmp    801612 <memcmp+0x5c>
  8015dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015e0:	0f b6 10             	movzbl (%rax),%edx
  8015e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015e7:	0f b6 00             	movzbl (%rax),%eax
  8015ea:	38 c2                	cmp    %al,%dl
  8015ec:	74 1a                	je     801608 <memcmp+0x52>
  8015ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015f2:	0f b6 00             	movzbl (%rax),%eax
  8015f5:	0f b6 d0             	movzbl %al,%edx
  8015f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015fc:	0f b6 00             	movzbl (%rax),%eax
  8015ff:	0f b6 c0             	movzbl %al,%eax
  801602:	29 c2                	sub    %eax,%edx
  801604:	89 d0                	mov    %edx,%eax
  801606:	eb 20                	jmp    801628 <memcmp+0x72>
  801608:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80160d:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801612:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801616:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80161a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80161e:	48 85 c0             	test   %rax,%rax
  801621:	75 b9                	jne    8015dc <memcmp+0x26>
  801623:	b8 00 00 00 00       	mov    $0x0,%eax
  801628:	c9                   	leaveq 
  801629:	c3                   	retq   

000000000080162a <memfind>:
  80162a:	55                   	push   %rbp
  80162b:	48 89 e5             	mov    %rsp,%rbp
  80162e:	48 83 ec 28          	sub    $0x28,%rsp
  801632:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801636:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801639:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80163d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801641:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801645:	48 01 d0             	add    %rdx,%rax
  801648:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80164c:	eb 13                	jmp    801661 <memfind+0x37>
  80164e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801652:	0f b6 00             	movzbl (%rax),%eax
  801655:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801658:	38 d0                	cmp    %dl,%al
  80165a:	74 11                	je     80166d <memfind+0x43>
  80165c:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801661:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801665:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801669:	72 e3                	jb     80164e <memfind+0x24>
  80166b:	eb 01                	jmp    80166e <memfind+0x44>
  80166d:	90                   	nop
  80166e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801672:	c9                   	leaveq 
  801673:	c3                   	retq   

0000000000801674 <strtol>:
  801674:	55                   	push   %rbp
  801675:	48 89 e5             	mov    %rsp,%rbp
  801678:	48 83 ec 38          	sub    $0x38,%rsp
  80167c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801680:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801684:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801687:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80168e:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801695:	00 
  801696:	eb 05                	jmp    80169d <strtol+0x29>
  801698:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80169d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016a1:	0f b6 00             	movzbl (%rax),%eax
  8016a4:	3c 20                	cmp    $0x20,%al
  8016a6:	74 f0                	je     801698 <strtol+0x24>
  8016a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ac:	0f b6 00             	movzbl (%rax),%eax
  8016af:	3c 09                	cmp    $0x9,%al
  8016b1:	74 e5                	je     801698 <strtol+0x24>
  8016b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016b7:	0f b6 00             	movzbl (%rax),%eax
  8016ba:	3c 2b                	cmp    $0x2b,%al
  8016bc:	75 07                	jne    8016c5 <strtol+0x51>
  8016be:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016c3:	eb 17                	jmp    8016dc <strtol+0x68>
  8016c5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c9:	0f b6 00             	movzbl (%rax),%eax
  8016cc:	3c 2d                	cmp    $0x2d,%al
  8016ce:	75 0c                	jne    8016dc <strtol+0x68>
  8016d0:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016d5:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8016dc:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016e0:	74 06                	je     8016e8 <strtol+0x74>
  8016e2:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8016e6:	75 28                	jne    801710 <strtol+0x9c>
  8016e8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ec:	0f b6 00             	movzbl (%rax),%eax
  8016ef:	3c 30                	cmp    $0x30,%al
  8016f1:	75 1d                	jne    801710 <strtol+0x9c>
  8016f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016f7:	48 83 c0 01          	add    $0x1,%rax
  8016fb:	0f b6 00             	movzbl (%rax),%eax
  8016fe:	3c 78                	cmp    $0x78,%al
  801700:	75 0e                	jne    801710 <strtol+0x9c>
  801702:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801707:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  80170e:	eb 2c                	jmp    80173c <strtol+0xc8>
  801710:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801714:	75 19                	jne    80172f <strtol+0xbb>
  801716:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80171a:	0f b6 00             	movzbl (%rax),%eax
  80171d:	3c 30                	cmp    $0x30,%al
  80171f:	75 0e                	jne    80172f <strtol+0xbb>
  801721:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801726:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80172d:	eb 0d                	jmp    80173c <strtol+0xc8>
  80172f:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801733:	75 07                	jne    80173c <strtol+0xc8>
  801735:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  80173c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801740:	0f b6 00             	movzbl (%rax),%eax
  801743:	3c 2f                	cmp    $0x2f,%al
  801745:	7e 1d                	jle    801764 <strtol+0xf0>
  801747:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80174b:	0f b6 00             	movzbl (%rax),%eax
  80174e:	3c 39                	cmp    $0x39,%al
  801750:	7f 12                	jg     801764 <strtol+0xf0>
  801752:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801756:	0f b6 00             	movzbl (%rax),%eax
  801759:	0f be c0             	movsbl %al,%eax
  80175c:	83 e8 30             	sub    $0x30,%eax
  80175f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801762:	eb 4e                	jmp    8017b2 <strtol+0x13e>
  801764:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801768:	0f b6 00             	movzbl (%rax),%eax
  80176b:	3c 60                	cmp    $0x60,%al
  80176d:	7e 1d                	jle    80178c <strtol+0x118>
  80176f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801773:	0f b6 00             	movzbl (%rax),%eax
  801776:	3c 7a                	cmp    $0x7a,%al
  801778:	7f 12                	jg     80178c <strtol+0x118>
  80177a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80177e:	0f b6 00             	movzbl (%rax),%eax
  801781:	0f be c0             	movsbl %al,%eax
  801784:	83 e8 57             	sub    $0x57,%eax
  801787:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80178a:	eb 26                	jmp    8017b2 <strtol+0x13e>
  80178c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801790:	0f b6 00             	movzbl (%rax),%eax
  801793:	3c 40                	cmp    $0x40,%al
  801795:	7e 47                	jle    8017de <strtol+0x16a>
  801797:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80179b:	0f b6 00             	movzbl (%rax),%eax
  80179e:	3c 5a                	cmp    $0x5a,%al
  8017a0:	7f 3c                	jg     8017de <strtol+0x16a>
  8017a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a6:	0f b6 00             	movzbl (%rax),%eax
  8017a9:	0f be c0             	movsbl %al,%eax
  8017ac:	83 e8 37             	sub    $0x37,%eax
  8017af:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8017b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8017b5:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8017b8:	7d 23                	jge    8017dd <strtol+0x169>
  8017ba:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017bf:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8017c2:	48 98                	cltq   
  8017c4:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8017c9:	48 89 c2             	mov    %rax,%rdx
  8017cc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8017cf:	48 98                	cltq   
  8017d1:	48 01 d0             	add    %rdx,%rax
  8017d4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017d8:	e9 5f ff ff ff       	jmpq   80173c <strtol+0xc8>
  8017dd:	90                   	nop
  8017de:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8017e3:	74 0b                	je     8017f0 <strtol+0x17c>
  8017e5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017e9:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8017ed:	48 89 10             	mov    %rdx,(%rax)
  8017f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8017f4:	74 09                	je     8017ff <strtol+0x18b>
  8017f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017fa:	48 f7 d8             	neg    %rax
  8017fd:	eb 04                	jmp    801803 <strtol+0x18f>
  8017ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801803:	c9                   	leaveq 
  801804:	c3                   	retq   

0000000000801805 <strstr>:
  801805:	55                   	push   %rbp
  801806:	48 89 e5             	mov    %rsp,%rbp
  801809:	48 83 ec 30          	sub    $0x30,%rsp
  80180d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801811:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801815:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801819:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80181d:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801821:	0f b6 00             	movzbl (%rax),%eax
  801824:	88 45 ff             	mov    %al,-0x1(%rbp)
  801827:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80182b:	75 06                	jne    801833 <strstr+0x2e>
  80182d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801831:	eb 6b                	jmp    80189e <strstr+0x99>
  801833:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801837:	48 89 c7             	mov    %rax,%rdi
  80183a:	48 b8 da 10 80 00 00 	movabs $0x8010da,%rax
  801841:	00 00 00 
  801844:	ff d0                	callq  *%rax
  801846:	48 98                	cltq   
  801848:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80184c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801850:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801854:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801858:	0f b6 00             	movzbl (%rax),%eax
  80185b:	88 45 ef             	mov    %al,-0x11(%rbp)
  80185e:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801862:	75 07                	jne    80186b <strstr+0x66>
  801864:	b8 00 00 00 00       	mov    $0x0,%eax
  801869:	eb 33                	jmp    80189e <strstr+0x99>
  80186b:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  80186f:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801872:	75 d8                	jne    80184c <strstr+0x47>
  801874:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801878:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80187c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801880:	48 89 ce             	mov    %rcx,%rsi
  801883:	48 89 c7             	mov    %rax,%rdi
  801886:	48 b8 fb 12 80 00 00 	movabs $0x8012fb,%rax
  80188d:	00 00 00 
  801890:	ff d0                	callq  *%rax
  801892:	85 c0                	test   %eax,%eax
  801894:	75 b6                	jne    80184c <strstr+0x47>
  801896:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80189a:	48 83 e8 01          	sub    $0x1,%rax
  80189e:	c9                   	leaveq 
  80189f:	c3                   	retq   

00000000008018a0 <syscall>:
  8018a0:	55                   	push   %rbp
  8018a1:	48 89 e5             	mov    %rsp,%rbp
  8018a4:	53                   	push   %rbx
  8018a5:	48 83 ec 48          	sub    $0x48,%rsp
  8018a9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8018ac:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8018af:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8018b3:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8018b7:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8018bb:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8018bf:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8018c2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8018c6:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8018ca:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8018ce:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8018d2:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8018d6:	4c 89 c3             	mov    %r8,%rbx
  8018d9:	cd 30                	int    $0x30
  8018db:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8018df:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8018e3:	74 3e                	je     801923 <syscall+0x83>
  8018e5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8018ea:	7e 37                	jle    801923 <syscall+0x83>
  8018ec:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8018f0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8018f3:	49 89 d0             	mov    %rdx,%r8
  8018f6:	89 c1                	mov    %eax,%ecx
  8018f8:	48 ba 68 4a 80 00 00 	movabs $0x804a68,%rdx
  8018ff:	00 00 00 
  801902:	be 24 00 00 00       	mov    $0x24,%esi
  801907:	48 bf 85 4a 80 00 00 	movabs $0x804a85,%rdi
  80190e:	00 00 00 
  801911:	b8 00 00 00 00       	mov    $0x0,%eax
  801916:	49 b9 7c 03 80 00 00 	movabs $0x80037c,%r9
  80191d:	00 00 00 
  801920:	41 ff d1             	callq  *%r9
  801923:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801927:	48 83 c4 48          	add    $0x48,%rsp
  80192b:	5b                   	pop    %rbx
  80192c:	5d                   	pop    %rbp
  80192d:	c3                   	retq   

000000000080192e <sys_cputs>:
  80192e:	55                   	push   %rbp
  80192f:	48 89 e5             	mov    %rsp,%rbp
  801932:	48 83 ec 10          	sub    $0x10,%rsp
  801936:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80193a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80193e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801942:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801946:	48 83 ec 08          	sub    $0x8,%rsp
  80194a:	6a 00                	pushq  $0x0
  80194c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801952:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801958:	48 89 d1             	mov    %rdx,%rcx
  80195b:	48 89 c2             	mov    %rax,%rdx
  80195e:	be 00 00 00 00       	mov    $0x0,%esi
  801963:	bf 00 00 00 00       	mov    $0x0,%edi
  801968:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  80196f:	00 00 00 
  801972:	ff d0                	callq  *%rax
  801974:	48 83 c4 10          	add    $0x10,%rsp
  801978:	90                   	nop
  801979:	c9                   	leaveq 
  80197a:	c3                   	retq   

000000000080197b <sys_cgetc>:
  80197b:	55                   	push   %rbp
  80197c:	48 89 e5             	mov    %rsp,%rbp
  80197f:	48 83 ec 08          	sub    $0x8,%rsp
  801983:	6a 00                	pushq  $0x0
  801985:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80198b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801991:	b9 00 00 00 00       	mov    $0x0,%ecx
  801996:	ba 00 00 00 00       	mov    $0x0,%edx
  80199b:	be 00 00 00 00       	mov    $0x0,%esi
  8019a0:	bf 01 00 00 00       	mov    $0x1,%edi
  8019a5:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  8019ac:	00 00 00 
  8019af:	ff d0                	callq  *%rax
  8019b1:	48 83 c4 10          	add    $0x10,%rsp
  8019b5:	c9                   	leaveq 
  8019b6:	c3                   	retq   

00000000008019b7 <sys_env_destroy>:
  8019b7:	55                   	push   %rbp
  8019b8:	48 89 e5             	mov    %rsp,%rbp
  8019bb:	48 83 ec 10          	sub    $0x10,%rsp
  8019bf:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019c5:	48 98                	cltq   
  8019c7:	48 83 ec 08          	sub    $0x8,%rsp
  8019cb:	6a 00                	pushq  $0x0
  8019cd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019d3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019d9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019de:	48 89 c2             	mov    %rax,%rdx
  8019e1:	be 01 00 00 00       	mov    $0x1,%esi
  8019e6:	bf 03 00 00 00       	mov    $0x3,%edi
  8019eb:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  8019f2:	00 00 00 
  8019f5:	ff d0                	callq  *%rax
  8019f7:	48 83 c4 10          	add    $0x10,%rsp
  8019fb:	c9                   	leaveq 
  8019fc:	c3                   	retq   

00000000008019fd <sys_getenvid>:
  8019fd:	55                   	push   %rbp
  8019fe:	48 89 e5             	mov    %rsp,%rbp
  801a01:	48 83 ec 08          	sub    $0x8,%rsp
  801a05:	6a 00                	pushq  $0x0
  801a07:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a0d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a13:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a18:	ba 00 00 00 00       	mov    $0x0,%edx
  801a1d:	be 00 00 00 00       	mov    $0x0,%esi
  801a22:	bf 02 00 00 00       	mov    $0x2,%edi
  801a27:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801a2e:	00 00 00 
  801a31:	ff d0                	callq  *%rax
  801a33:	48 83 c4 10          	add    $0x10,%rsp
  801a37:	c9                   	leaveq 
  801a38:	c3                   	retq   

0000000000801a39 <sys_yield>:
  801a39:	55                   	push   %rbp
  801a3a:	48 89 e5             	mov    %rsp,%rbp
  801a3d:	48 83 ec 08          	sub    $0x8,%rsp
  801a41:	6a 00                	pushq  $0x0
  801a43:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a49:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a4f:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a54:	ba 00 00 00 00       	mov    $0x0,%edx
  801a59:	be 00 00 00 00       	mov    $0x0,%esi
  801a5e:	bf 0b 00 00 00       	mov    $0xb,%edi
  801a63:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801a6a:	00 00 00 
  801a6d:	ff d0                	callq  *%rax
  801a6f:	48 83 c4 10          	add    $0x10,%rsp
  801a73:	90                   	nop
  801a74:	c9                   	leaveq 
  801a75:	c3                   	retq   

0000000000801a76 <sys_page_alloc>:
  801a76:	55                   	push   %rbp
  801a77:	48 89 e5             	mov    %rsp,%rbp
  801a7a:	48 83 ec 10          	sub    $0x10,%rsp
  801a7e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a81:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a85:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a88:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a8b:	48 63 c8             	movslq %eax,%rcx
  801a8e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a92:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a95:	48 98                	cltq   
  801a97:	48 83 ec 08          	sub    $0x8,%rsp
  801a9b:	6a 00                	pushq  $0x0
  801a9d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aa3:	49 89 c8             	mov    %rcx,%r8
  801aa6:	48 89 d1             	mov    %rdx,%rcx
  801aa9:	48 89 c2             	mov    %rax,%rdx
  801aac:	be 01 00 00 00       	mov    $0x1,%esi
  801ab1:	bf 04 00 00 00       	mov    $0x4,%edi
  801ab6:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801abd:	00 00 00 
  801ac0:	ff d0                	callq  *%rax
  801ac2:	48 83 c4 10          	add    $0x10,%rsp
  801ac6:	c9                   	leaveq 
  801ac7:	c3                   	retq   

0000000000801ac8 <sys_page_map>:
  801ac8:	55                   	push   %rbp
  801ac9:	48 89 e5             	mov    %rsp,%rbp
  801acc:	48 83 ec 20          	sub    $0x20,%rsp
  801ad0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ad3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ad7:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801ada:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801ade:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801ae2:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801ae5:	48 63 c8             	movslq %eax,%rcx
  801ae8:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801aec:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801aef:	48 63 f0             	movslq %eax,%rsi
  801af2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801af6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801af9:	48 98                	cltq   
  801afb:	48 83 ec 08          	sub    $0x8,%rsp
  801aff:	51                   	push   %rcx
  801b00:	49 89 f9             	mov    %rdi,%r9
  801b03:	49 89 f0             	mov    %rsi,%r8
  801b06:	48 89 d1             	mov    %rdx,%rcx
  801b09:	48 89 c2             	mov    %rax,%rdx
  801b0c:	be 01 00 00 00       	mov    $0x1,%esi
  801b11:	bf 05 00 00 00       	mov    $0x5,%edi
  801b16:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801b1d:	00 00 00 
  801b20:	ff d0                	callq  *%rax
  801b22:	48 83 c4 10          	add    $0x10,%rsp
  801b26:	c9                   	leaveq 
  801b27:	c3                   	retq   

0000000000801b28 <sys_page_unmap>:
  801b28:	55                   	push   %rbp
  801b29:	48 89 e5             	mov    %rsp,%rbp
  801b2c:	48 83 ec 10          	sub    $0x10,%rsp
  801b30:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b33:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b37:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b3b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b3e:	48 98                	cltq   
  801b40:	48 83 ec 08          	sub    $0x8,%rsp
  801b44:	6a 00                	pushq  $0x0
  801b46:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b4c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b52:	48 89 d1             	mov    %rdx,%rcx
  801b55:	48 89 c2             	mov    %rax,%rdx
  801b58:	be 01 00 00 00       	mov    $0x1,%esi
  801b5d:	bf 06 00 00 00       	mov    $0x6,%edi
  801b62:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801b69:	00 00 00 
  801b6c:	ff d0                	callq  *%rax
  801b6e:	48 83 c4 10          	add    $0x10,%rsp
  801b72:	c9                   	leaveq 
  801b73:	c3                   	retq   

0000000000801b74 <sys_env_set_status>:
  801b74:	55                   	push   %rbp
  801b75:	48 89 e5             	mov    %rsp,%rbp
  801b78:	48 83 ec 10          	sub    $0x10,%rsp
  801b7c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b7f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801b82:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b85:	48 63 d0             	movslq %eax,%rdx
  801b88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b8b:	48 98                	cltq   
  801b8d:	48 83 ec 08          	sub    $0x8,%rsp
  801b91:	6a 00                	pushq  $0x0
  801b93:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b99:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b9f:	48 89 d1             	mov    %rdx,%rcx
  801ba2:	48 89 c2             	mov    %rax,%rdx
  801ba5:	be 01 00 00 00       	mov    $0x1,%esi
  801baa:	bf 08 00 00 00       	mov    $0x8,%edi
  801baf:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801bb6:	00 00 00 
  801bb9:	ff d0                	callq  *%rax
  801bbb:	48 83 c4 10          	add    $0x10,%rsp
  801bbf:	c9                   	leaveq 
  801bc0:	c3                   	retq   

0000000000801bc1 <sys_env_set_trapframe>:
  801bc1:	55                   	push   %rbp
  801bc2:	48 89 e5             	mov    %rsp,%rbp
  801bc5:	48 83 ec 10          	sub    $0x10,%rsp
  801bc9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bcc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bd0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bd4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bd7:	48 98                	cltq   
  801bd9:	48 83 ec 08          	sub    $0x8,%rsp
  801bdd:	6a 00                	pushq  $0x0
  801bdf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801be5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801beb:	48 89 d1             	mov    %rdx,%rcx
  801bee:	48 89 c2             	mov    %rax,%rdx
  801bf1:	be 01 00 00 00       	mov    $0x1,%esi
  801bf6:	bf 09 00 00 00       	mov    $0x9,%edi
  801bfb:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801c02:	00 00 00 
  801c05:	ff d0                	callq  *%rax
  801c07:	48 83 c4 10          	add    $0x10,%rsp
  801c0b:	c9                   	leaveq 
  801c0c:	c3                   	retq   

0000000000801c0d <sys_env_set_pgfault_upcall>:
  801c0d:	55                   	push   %rbp
  801c0e:	48 89 e5             	mov    %rsp,%rbp
  801c11:	48 83 ec 10          	sub    $0x10,%rsp
  801c15:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c18:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c1c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c20:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c23:	48 98                	cltq   
  801c25:	48 83 ec 08          	sub    $0x8,%rsp
  801c29:	6a 00                	pushq  $0x0
  801c2b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c31:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c37:	48 89 d1             	mov    %rdx,%rcx
  801c3a:	48 89 c2             	mov    %rax,%rdx
  801c3d:	be 01 00 00 00       	mov    $0x1,%esi
  801c42:	bf 0a 00 00 00       	mov    $0xa,%edi
  801c47:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801c4e:	00 00 00 
  801c51:	ff d0                	callq  *%rax
  801c53:	48 83 c4 10          	add    $0x10,%rsp
  801c57:	c9                   	leaveq 
  801c58:	c3                   	retq   

0000000000801c59 <sys_ipc_try_send>:
  801c59:	55                   	push   %rbp
  801c5a:	48 89 e5             	mov    %rsp,%rbp
  801c5d:	48 83 ec 20          	sub    $0x20,%rsp
  801c61:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c64:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c68:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c6c:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801c6f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c72:	48 63 f0             	movslq %eax,%rsi
  801c75:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801c79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c7c:	48 98                	cltq   
  801c7e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c82:	48 83 ec 08          	sub    $0x8,%rsp
  801c86:	6a 00                	pushq  $0x0
  801c88:	49 89 f1             	mov    %rsi,%r9
  801c8b:	49 89 c8             	mov    %rcx,%r8
  801c8e:	48 89 d1             	mov    %rdx,%rcx
  801c91:	48 89 c2             	mov    %rax,%rdx
  801c94:	be 00 00 00 00       	mov    $0x0,%esi
  801c99:	bf 0c 00 00 00       	mov    $0xc,%edi
  801c9e:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801ca5:	00 00 00 
  801ca8:	ff d0                	callq  *%rax
  801caa:	48 83 c4 10          	add    $0x10,%rsp
  801cae:	c9                   	leaveq 
  801caf:	c3                   	retq   

0000000000801cb0 <sys_ipc_recv>:
  801cb0:	55                   	push   %rbp
  801cb1:	48 89 e5             	mov    %rsp,%rbp
  801cb4:	48 83 ec 10          	sub    $0x10,%rsp
  801cb8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cbc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cc0:	48 83 ec 08          	sub    $0x8,%rsp
  801cc4:	6a 00                	pushq  $0x0
  801cc6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ccc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cd2:	b9 00 00 00 00       	mov    $0x0,%ecx
  801cd7:	48 89 c2             	mov    %rax,%rdx
  801cda:	be 01 00 00 00       	mov    $0x1,%esi
  801cdf:	bf 0d 00 00 00       	mov    $0xd,%edi
  801ce4:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801ceb:	00 00 00 
  801cee:	ff d0                	callq  *%rax
  801cf0:	48 83 c4 10          	add    $0x10,%rsp
  801cf4:	c9                   	leaveq 
  801cf5:	c3                   	retq   

0000000000801cf6 <sys_time_msec>:
  801cf6:	55                   	push   %rbp
  801cf7:	48 89 e5             	mov    %rsp,%rbp
  801cfa:	48 83 ec 08          	sub    $0x8,%rsp
  801cfe:	6a 00                	pushq  $0x0
  801d00:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d06:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d0c:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d11:	ba 00 00 00 00       	mov    $0x0,%edx
  801d16:	be 00 00 00 00       	mov    $0x0,%esi
  801d1b:	bf 0e 00 00 00       	mov    $0xe,%edi
  801d20:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801d27:	00 00 00 
  801d2a:	ff d0                	callq  *%rax
  801d2c:	48 83 c4 10          	add    $0x10,%rsp
  801d30:	c9                   	leaveq 
  801d31:	c3                   	retq   

0000000000801d32 <sys_net_transmit>:
  801d32:	55                   	push   %rbp
  801d33:	48 89 e5             	mov    %rsp,%rbp
  801d36:	48 83 ec 10          	sub    $0x10,%rsp
  801d3a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d3e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d41:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d44:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d48:	48 83 ec 08          	sub    $0x8,%rsp
  801d4c:	6a 00                	pushq  $0x0
  801d4e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d54:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d5a:	48 89 d1             	mov    %rdx,%rcx
  801d5d:	48 89 c2             	mov    %rax,%rdx
  801d60:	be 00 00 00 00       	mov    $0x0,%esi
  801d65:	bf 0f 00 00 00       	mov    $0xf,%edi
  801d6a:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801d71:	00 00 00 
  801d74:	ff d0                	callq  *%rax
  801d76:	48 83 c4 10          	add    $0x10,%rsp
  801d7a:	c9                   	leaveq 
  801d7b:	c3                   	retq   

0000000000801d7c <sys_net_receive>:
  801d7c:	55                   	push   %rbp
  801d7d:	48 89 e5             	mov    %rsp,%rbp
  801d80:	48 83 ec 10          	sub    $0x10,%rsp
  801d84:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d88:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801d8b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801d8e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d92:	48 83 ec 08          	sub    $0x8,%rsp
  801d96:	6a 00                	pushq  $0x0
  801d98:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d9e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801da4:	48 89 d1             	mov    %rdx,%rcx
  801da7:	48 89 c2             	mov    %rax,%rdx
  801daa:	be 00 00 00 00       	mov    $0x0,%esi
  801daf:	bf 10 00 00 00       	mov    $0x10,%edi
  801db4:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801dbb:	00 00 00 
  801dbe:	ff d0                	callq  *%rax
  801dc0:	48 83 c4 10          	add    $0x10,%rsp
  801dc4:	c9                   	leaveq 
  801dc5:	c3                   	retq   

0000000000801dc6 <sys_ept_map>:
  801dc6:	55                   	push   %rbp
  801dc7:	48 89 e5             	mov    %rsp,%rbp
  801dca:	48 83 ec 20          	sub    $0x20,%rsp
  801dce:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dd1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dd5:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801dd8:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801ddc:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801de0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801de3:	48 63 c8             	movslq %eax,%rcx
  801de6:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801dea:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ded:	48 63 f0             	movslq %eax,%rsi
  801df0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801df4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801df7:	48 98                	cltq   
  801df9:	48 83 ec 08          	sub    $0x8,%rsp
  801dfd:	51                   	push   %rcx
  801dfe:	49 89 f9             	mov    %rdi,%r9
  801e01:	49 89 f0             	mov    %rsi,%r8
  801e04:	48 89 d1             	mov    %rdx,%rcx
  801e07:	48 89 c2             	mov    %rax,%rdx
  801e0a:	be 00 00 00 00       	mov    $0x0,%esi
  801e0f:	bf 11 00 00 00       	mov    $0x11,%edi
  801e14:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801e1b:	00 00 00 
  801e1e:	ff d0                	callq  *%rax
  801e20:	48 83 c4 10          	add    $0x10,%rsp
  801e24:	c9                   	leaveq 
  801e25:	c3                   	retq   

0000000000801e26 <sys_env_mkguest>:
  801e26:	55                   	push   %rbp
  801e27:	48 89 e5             	mov    %rsp,%rbp
  801e2a:	48 83 ec 10          	sub    $0x10,%rsp
  801e2e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e32:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e36:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e3e:	48 83 ec 08          	sub    $0x8,%rsp
  801e42:	6a 00                	pushq  $0x0
  801e44:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e4a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e50:	48 89 d1             	mov    %rdx,%rcx
  801e53:	48 89 c2             	mov    %rax,%rdx
  801e56:	be 00 00 00 00       	mov    $0x0,%esi
  801e5b:	bf 12 00 00 00       	mov    $0x12,%edi
  801e60:	48 b8 a0 18 80 00 00 	movabs $0x8018a0,%rax
  801e67:	00 00 00 
  801e6a:	ff d0                	callq  *%rax
  801e6c:	48 83 c4 10          	add    $0x10,%rsp
  801e70:	c9                   	leaveq 
  801e71:	c3                   	retq   

0000000000801e72 <fd2num>:
  801e72:	55                   	push   %rbp
  801e73:	48 89 e5             	mov    %rsp,%rbp
  801e76:	48 83 ec 08          	sub    $0x8,%rsp
  801e7a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e7e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801e82:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801e89:	ff ff ff 
  801e8c:	48 01 d0             	add    %rdx,%rax
  801e8f:	48 c1 e8 0c          	shr    $0xc,%rax
  801e93:	c9                   	leaveq 
  801e94:	c3                   	retq   

0000000000801e95 <fd2data>:
  801e95:	55                   	push   %rbp
  801e96:	48 89 e5             	mov    %rsp,%rbp
  801e99:	48 83 ec 08          	sub    $0x8,%rsp
  801e9d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ea1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ea5:	48 89 c7             	mov    %rax,%rdi
  801ea8:	48 b8 72 1e 80 00 00 	movabs $0x801e72,%rax
  801eaf:	00 00 00 
  801eb2:	ff d0                	callq  *%rax
  801eb4:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801eba:	48 c1 e0 0c          	shl    $0xc,%rax
  801ebe:	c9                   	leaveq 
  801ebf:	c3                   	retq   

0000000000801ec0 <fd_alloc>:
  801ec0:	55                   	push   %rbp
  801ec1:	48 89 e5             	mov    %rsp,%rbp
  801ec4:	48 83 ec 18          	sub    $0x18,%rsp
  801ec8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801ecc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801ed3:	eb 6b                	jmp    801f40 <fd_alloc+0x80>
  801ed5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ed8:	48 98                	cltq   
  801eda:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801ee0:	48 c1 e0 0c          	shl    $0xc,%rax
  801ee4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ee8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801eec:	48 c1 e8 15          	shr    $0x15,%rax
  801ef0:	48 89 c2             	mov    %rax,%rdx
  801ef3:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801efa:	01 00 00 
  801efd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f01:	83 e0 01             	and    $0x1,%eax
  801f04:	48 85 c0             	test   %rax,%rax
  801f07:	74 21                	je     801f2a <fd_alloc+0x6a>
  801f09:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f0d:	48 c1 e8 0c          	shr    $0xc,%rax
  801f11:	48 89 c2             	mov    %rax,%rdx
  801f14:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f1b:	01 00 00 
  801f1e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f22:	83 e0 01             	and    $0x1,%eax
  801f25:	48 85 c0             	test   %rax,%rax
  801f28:	75 12                	jne    801f3c <fd_alloc+0x7c>
  801f2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f2e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f32:	48 89 10             	mov    %rdx,(%rax)
  801f35:	b8 00 00 00 00       	mov    $0x0,%eax
  801f3a:	eb 1a                	jmp    801f56 <fd_alloc+0x96>
  801f3c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801f40:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801f44:	7e 8f                	jle    801ed5 <fd_alloc+0x15>
  801f46:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f4a:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801f51:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801f56:	c9                   	leaveq 
  801f57:	c3                   	retq   

0000000000801f58 <fd_lookup>:
  801f58:	55                   	push   %rbp
  801f59:	48 89 e5             	mov    %rsp,%rbp
  801f5c:	48 83 ec 20          	sub    $0x20,%rsp
  801f60:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801f63:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801f67:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801f6b:	78 06                	js     801f73 <fd_lookup+0x1b>
  801f6d:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801f71:	7e 07                	jle    801f7a <fd_lookup+0x22>
  801f73:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f78:	eb 6c                	jmp    801fe6 <fd_lookup+0x8e>
  801f7a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f7d:	48 98                	cltq   
  801f7f:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f85:	48 c1 e0 0c          	shl    $0xc,%rax
  801f89:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801f8d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f91:	48 c1 e8 15          	shr    $0x15,%rax
  801f95:	48 89 c2             	mov    %rax,%rdx
  801f98:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f9f:	01 00 00 
  801fa2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fa6:	83 e0 01             	and    $0x1,%eax
  801fa9:	48 85 c0             	test   %rax,%rax
  801fac:	74 21                	je     801fcf <fd_lookup+0x77>
  801fae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fb2:	48 c1 e8 0c          	shr    $0xc,%rax
  801fb6:	48 89 c2             	mov    %rax,%rdx
  801fb9:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fc0:	01 00 00 
  801fc3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fc7:	83 e0 01             	and    $0x1,%eax
  801fca:	48 85 c0             	test   %rax,%rax
  801fcd:	75 07                	jne    801fd6 <fd_lookup+0x7e>
  801fcf:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801fd4:	eb 10                	jmp    801fe6 <fd_lookup+0x8e>
  801fd6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801fda:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801fde:	48 89 10             	mov    %rdx,(%rax)
  801fe1:	b8 00 00 00 00       	mov    $0x0,%eax
  801fe6:	c9                   	leaveq 
  801fe7:	c3                   	retq   

0000000000801fe8 <fd_close>:
  801fe8:	55                   	push   %rbp
  801fe9:	48 89 e5             	mov    %rsp,%rbp
  801fec:	48 83 ec 30          	sub    $0x30,%rsp
  801ff0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801ff4:	89 f0                	mov    %esi,%eax
  801ff6:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801ff9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ffd:	48 89 c7             	mov    %rax,%rdi
  802000:	48 b8 72 1e 80 00 00 	movabs $0x801e72,%rax
  802007:	00 00 00 
  80200a:	ff d0                	callq  *%rax
  80200c:	89 c2                	mov    %eax,%edx
  80200e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802012:	48 89 c6             	mov    %rax,%rsi
  802015:	89 d7                	mov    %edx,%edi
  802017:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  80201e:	00 00 00 
  802021:	ff d0                	callq  *%rax
  802023:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802026:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80202a:	78 0a                	js     802036 <fd_close+0x4e>
  80202c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802030:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802034:	74 12                	je     802048 <fd_close+0x60>
  802036:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  80203a:	74 05                	je     802041 <fd_close+0x59>
  80203c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80203f:	eb 70                	jmp    8020b1 <fd_close+0xc9>
  802041:	b8 00 00 00 00       	mov    $0x0,%eax
  802046:	eb 69                	jmp    8020b1 <fd_close+0xc9>
  802048:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80204c:	8b 00                	mov    (%rax),%eax
  80204e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802052:	48 89 d6             	mov    %rdx,%rsi
  802055:	89 c7                	mov    %eax,%edi
  802057:	48 b8 b3 20 80 00 00 	movabs $0x8020b3,%rax
  80205e:	00 00 00 
  802061:	ff d0                	callq  *%rax
  802063:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802066:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80206a:	78 2a                	js     802096 <fd_close+0xae>
  80206c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802070:	48 8b 40 20          	mov    0x20(%rax),%rax
  802074:	48 85 c0             	test   %rax,%rax
  802077:	74 16                	je     80208f <fd_close+0xa7>
  802079:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80207d:	48 8b 40 20          	mov    0x20(%rax),%rax
  802081:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802085:	48 89 d7             	mov    %rdx,%rdi
  802088:	ff d0                	callq  *%rax
  80208a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80208d:	eb 07                	jmp    802096 <fd_close+0xae>
  80208f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802096:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80209a:	48 89 c6             	mov    %rax,%rsi
  80209d:	bf 00 00 00 00       	mov    $0x0,%edi
  8020a2:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  8020a9:	00 00 00 
  8020ac:	ff d0                	callq  *%rax
  8020ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020b1:	c9                   	leaveq 
  8020b2:	c3                   	retq   

00000000008020b3 <dev_lookup>:
  8020b3:	55                   	push   %rbp
  8020b4:	48 89 e5             	mov    %rsp,%rbp
  8020b7:	48 83 ec 20          	sub    $0x20,%rsp
  8020bb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020be:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8020c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020c9:	eb 41                	jmp    80210c <dev_lookup+0x59>
  8020cb:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8020d2:	00 00 00 
  8020d5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8020d8:	48 63 d2             	movslq %edx,%rdx
  8020db:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8020df:	8b 00                	mov    (%rax),%eax
  8020e1:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8020e4:	75 22                	jne    802108 <dev_lookup+0x55>
  8020e6:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8020ed:	00 00 00 
  8020f0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8020f3:	48 63 d2             	movslq %edx,%rdx
  8020f6:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8020fa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020fe:	48 89 10             	mov    %rdx,(%rax)
  802101:	b8 00 00 00 00       	mov    $0x0,%eax
  802106:	eb 60                	jmp    802168 <dev_lookup+0xb5>
  802108:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80210c:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802113:	00 00 00 
  802116:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802119:	48 63 d2             	movslq %edx,%rdx
  80211c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802120:	48 85 c0             	test   %rax,%rax
  802123:	75 a6                	jne    8020cb <dev_lookup+0x18>
  802125:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  80212c:	00 00 00 
  80212f:	48 8b 00             	mov    (%rax),%rax
  802132:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802138:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80213b:	89 c6                	mov    %eax,%esi
  80213d:	48 bf 98 4a 80 00 00 	movabs $0x804a98,%rdi
  802144:	00 00 00 
  802147:	b8 00 00 00 00       	mov    $0x0,%eax
  80214c:	48 b9 b6 05 80 00 00 	movabs $0x8005b6,%rcx
  802153:	00 00 00 
  802156:	ff d1                	callq  *%rcx
  802158:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80215c:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802163:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802168:	c9                   	leaveq 
  802169:	c3                   	retq   

000000000080216a <close>:
  80216a:	55                   	push   %rbp
  80216b:	48 89 e5             	mov    %rsp,%rbp
  80216e:	48 83 ec 20          	sub    $0x20,%rsp
  802172:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802175:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802179:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80217c:	48 89 d6             	mov    %rdx,%rsi
  80217f:	89 c7                	mov    %eax,%edi
  802181:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  802188:	00 00 00 
  80218b:	ff d0                	callq  *%rax
  80218d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802190:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802194:	79 05                	jns    80219b <close+0x31>
  802196:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802199:	eb 18                	jmp    8021b3 <close+0x49>
  80219b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80219f:	be 01 00 00 00       	mov    $0x1,%esi
  8021a4:	48 89 c7             	mov    %rax,%rdi
  8021a7:	48 b8 e8 1f 80 00 00 	movabs $0x801fe8,%rax
  8021ae:	00 00 00 
  8021b1:	ff d0                	callq  *%rax
  8021b3:	c9                   	leaveq 
  8021b4:	c3                   	retq   

00000000008021b5 <close_all>:
  8021b5:	55                   	push   %rbp
  8021b6:	48 89 e5             	mov    %rsp,%rbp
  8021b9:	48 83 ec 10          	sub    $0x10,%rsp
  8021bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8021c4:	eb 15                	jmp    8021db <close_all+0x26>
  8021c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021c9:	89 c7                	mov    %eax,%edi
  8021cb:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  8021d2:	00 00 00 
  8021d5:	ff d0                	callq  *%rax
  8021d7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8021db:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8021df:	7e e5                	jle    8021c6 <close_all+0x11>
  8021e1:	90                   	nop
  8021e2:	c9                   	leaveq 
  8021e3:	c3                   	retq   

00000000008021e4 <dup>:
  8021e4:	55                   	push   %rbp
  8021e5:	48 89 e5             	mov    %rsp,%rbp
  8021e8:	48 83 ec 40          	sub    $0x40,%rsp
  8021ec:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8021ef:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8021f2:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8021f6:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8021f9:	48 89 d6             	mov    %rdx,%rsi
  8021fc:	89 c7                	mov    %eax,%edi
  8021fe:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  802205:	00 00 00 
  802208:	ff d0                	callq  *%rax
  80220a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80220d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802211:	79 08                	jns    80221b <dup+0x37>
  802213:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802216:	e9 70 01 00 00       	jmpq   80238b <dup+0x1a7>
  80221b:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80221e:	89 c7                	mov    %eax,%edi
  802220:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  802227:	00 00 00 
  80222a:	ff d0                	callq  *%rax
  80222c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80222f:	48 98                	cltq   
  802231:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802237:	48 c1 e0 0c          	shl    $0xc,%rax
  80223b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80223f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802243:	48 89 c7             	mov    %rax,%rdi
  802246:	48 b8 95 1e 80 00 00 	movabs $0x801e95,%rax
  80224d:	00 00 00 
  802250:	ff d0                	callq  *%rax
  802252:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802256:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80225a:	48 89 c7             	mov    %rax,%rdi
  80225d:	48 b8 95 1e 80 00 00 	movabs $0x801e95,%rax
  802264:	00 00 00 
  802267:	ff d0                	callq  *%rax
  802269:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80226d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802271:	48 c1 e8 15          	shr    $0x15,%rax
  802275:	48 89 c2             	mov    %rax,%rdx
  802278:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80227f:	01 00 00 
  802282:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802286:	83 e0 01             	and    $0x1,%eax
  802289:	48 85 c0             	test   %rax,%rax
  80228c:	74 71                	je     8022ff <dup+0x11b>
  80228e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802292:	48 c1 e8 0c          	shr    $0xc,%rax
  802296:	48 89 c2             	mov    %rax,%rdx
  802299:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022a0:	01 00 00 
  8022a3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022a7:	83 e0 01             	and    $0x1,%eax
  8022aa:	48 85 c0             	test   %rax,%rax
  8022ad:	74 50                	je     8022ff <dup+0x11b>
  8022af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022b3:	48 c1 e8 0c          	shr    $0xc,%rax
  8022b7:	48 89 c2             	mov    %rax,%rdx
  8022ba:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022c1:	01 00 00 
  8022c4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022c8:	25 07 0e 00 00       	and    $0xe07,%eax
  8022cd:	89 c1                	mov    %eax,%ecx
  8022cf:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8022d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022d7:	41 89 c8             	mov    %ecx,%r8d
  8022da:	48 89 d1             	mov    %rdx,%rcx
  8022dd:	ba 00 00 00 00       	mov    $0x0,%edx
  8022e2:	48 89 c6             	mov    %rax,%rsi
  8022e5:	bf 00 00 00 00       	mov    $0x0,%edi
  8022ea:	48 b8 c8 1a 80 00 00 	movabs $0x801ac8,%rax
  8022f1:	00 00 00 
  8022f4:	ff d0                	callq  *%rax
  8022f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022fd:	78 55                	js     802354 <dup+0x170>
  8022ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802303:	48 c1 e8 0c          	shr    $0xc,%rax
  802307:	48 89 c2             	mov    %rax,%rdx
  80230a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802311:	01 00 00 
  802314:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802318:	25 07 0e 00 00       	and    $0xe07,%eax
  80231d:	89 c1                	mov    %eax,%ecx
  80231f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802323:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802327:	41 89 c8             	mov    %ecx,%r8d
  80232a:	48 89 d1             	mov    %rdx,%rcx
  80232d:	ba 00 00 00 00       	mov    $0x0,%edx
  802332:	48 89 c6             	mov    %rax,%rsi
  802335:	bf 00 00 00 00       	mov    $0x0,%edi
  80233a:	48 b8 c8 1a 80 00 00 	movabs $0x801ac8,%rax
  802341:	00 00 00 
  802344:	ff d0                	callq  *%rax
  802346:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802349:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80234d:	78 08                	js     802357 <dup+0x173>
  80234f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802352:	eb 37                	jmp    80238b <dup+0x1a7>
  802354:	90                   	nop
  802355:	eb 01                	jmp    802358 <dup+0x174>
  802357:	90                   	nop
  802358:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80235c:	48 89 c6             	mov    %rax,%rsi
  80235f:	bf 00 00 00 00       	mov    $0x0,%edi
  802364:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  80236b:	00 00 00 
  80236e:	ff d0                	callq  *%rax
  802370:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802374:	48 89 c6             	mov    %rax,%rsi
  802377:	bf 00 00 00 00       	mov    $0x0,%edi
  80237c:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  802383:	00 00 00 
  802386:	ff d0                	callq  *%rax
  802388:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80238b:	c9                   	leaveq 
  80238c:	c3                   	retq   

000000000080238d <read>:
  80238d:	55                   	push   %rbp
  80238e:	48 89 e5             	mov    %rsp,%rbp
  802391:	48 83 ec 40          	sub    $0x40,%rsp
  802395:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802398:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80239c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8023a0:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8023a4:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8023a7:	48 89 d6             	mov    %rdx,%rsi
  8023aa:	89 c7                	mov    %eax,%edi
  8023ac:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  8023b3:	00 00 00 
  8023b6:	ff d0                	callq  *%rax
  8023b8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023bb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023bf:	78 24                	js     8023e5 <read+0x58>
  8023c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023c5:	8b 00                	mov    (%rax),%eax
  8023c7:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8023cb:	48 89 d6             	mov    %rdx,%rsi
  8023ce:	89 c7                	mov    %eax,%edi
  8023d0:	48 b8 b3 20 80 00 00 	movabs $0x8020b3,%rax
  8023d7:	00 00 00 
  8023da:	ff d0                	callq  *%rax
  8023dc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023df:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023e3:	79 05                	jns    8023ea <read+0x5d>
  8023e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023e8:	eb 76                	jmp    802460 <read+0xd3>
  8023ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023ee:	8b 40 08             	mov    0x8(%rax),%eax
  8023f1:	83 e0 03             	and    $0x3,%eax
  8023f4:	83 f8 01             	cmp    $0x1,%eax
  8023f7:	75 3a                	jne    802433 <read+0xa6>
  8023f9:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  802400:	00 00 00 
  802403:	48 8b 00             	mov    (%rax),%rax
  802406:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80240c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80240f:	89 c6                	mov    %eax,%esi
  802411:	48 bf b7 4a 80 00 00 	movabs $0x804ab7,%rdi
  802418:	00 00 00 
  80241b:	b8 00 00 00 00       	mov    $0x0,%eax
  802420:	48 b9 b6 05 80 00 00 	movabs $0x8005b6,%rcx
  802427:	00 00 00 
  80242a:	ff d1                	callq  *%rcx
  80242c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802431:	eb 2d                	jmp    802460 <read+0xd3>
  802433:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802437:	48 8b 40 10          	mov    0x10(%rax),%rax
  80243b:	48 85 c0             	test   %rax,%rax
  80243e:	75 07                	jne    802447 <read+0xba>
  802440:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802445:	eb 19                	jmp    802460 <read+0xd3>
  802447:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80244b:	48 8b 40 10          	mov    0x10(%rax),%rax
  80244f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802453:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802457:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80245b:	48 89 cf             	mov    %rcx,%rdi
  80245e:	ff d0                	callq  *%rax
  802460:	c9                   	leaveq 
  802461:	c3                   	retq   

0000000000802462 <readn>:
  802462:	55                   	push   %rbp
  802463:	48 89 e5             	mov    %rsp,%rbp
  802466:	48 83 ec 30          	sub    $0x30,%rsp
  80246a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80246d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802471:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802475:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80247c:	eb 47                	jmp    8024c5 <readn+0x63>
  80247e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802481:	48 98                	cltq   
  802483:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802487:	48 29 c2             	sub    %rax,%rdx
  80248a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80248d:	48 63 c8             	movslq %eax,%rcx
  802490:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802494:	48 01 c1             	add    %rax,%rcx
  802497:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80249a:	48 89 ce             	mov    %rcx,%rsi
  80249d:	89 c7                	mov    %eax,%edi
  80249f:	48 b8 8d 23 80 00 00 	movabs $0x80238d,%rax
  8024a6:	00 00 00 
  8024a9:	ff d0                	callq  *%rax
  8024ab:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8024ae:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8024b2:	79 05                	jns    8024b9 <readn+0x57>
  8024b4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024b7:	eb 1d                	jmp    8024d6 <readn+0x74>
  8024b9:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8024bd:	74 13                	je     8024d2 <readn+0x70>
  8024bf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8024c2:	01 45 fc             	add    %eax,-0x4(%rbp)
  8024c5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024c8:	48 98                	cltq   
  8024ca:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8024ce:	72 ae                	jb     80247e <readn+0x1c>
  8024d0:	eb 01                	jmp    8024d3 <readn+0x71>
  8024d2:	90                   	nop
  8024d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024d6:	c9                   	leaveq 
  8024d7:	c3                   	retq   

00000000008024d8 <write>:
  8024d8:	55                   	push   %rbp
  8024d9:	48 89 e5             	mov    %rsp,%rbp
  8024dc:	48 83 ec 40          	sub    $0x40,%rsp
  8024e0:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8024e3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8024e7:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8024eb:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8024ef:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8024f2:	48 89 d6             	mov    %rdx,%rsi
  8024f5:	89 c7                	mov    %eax,%edi
  8024f7:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  8024fe:	00 00 00 
  802501:	ff d0                	callq  *%rax
  802503:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802506:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80250a:	78 24                	js     802530 <write+0x58>
  80250c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802510:	8b 00                	mov    (%rax),%eax
  802512:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802516:	48 89 d6             	mov    %rdx,%rsi
  802519:	89 c7                	mov    %eax,%edi
  80251b:	48 b8 b3 20 80 00 00 	movabs $0x8020b3,%rax
  802522:	00 00 00 
  802525:	ff d0                	callq  *%rax
  802527:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80252a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80252e:	79 05                	jns    802535 <write+0x5d>
  802530:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802533:	eb 75                	jmp    8025aa <write+0xd2>
  802535:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802539:	8b 40 08             	mov    0x8(%rax),%eax
  80253c:	83 e0 03             	and    $0x3,%eax
  80253f:	85 c0                	test   %eax,%eax
  802541:	75 3a                	jne    80257d <write+0xa5>
  802543:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  80254a:	00 00 00 
  80254d:	48 8b 00             	mov    (%rax),%rax
  802550:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802556:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802559:	89 c6                	mov    %eax,%esi
  80255b:	48 bf d3 4a 80 00 00 	movabs $0x804ad3,%rdi
  802562:	00 00 00 
  802565:	b8 00 00 00 00       	mov    $0x0,%eax
  80256a:	48 b9 b6 05 80 00 00 	movabs $0x8005b6,%rcx
  802571:	00 00 00 
  802574:	ff d1                	callq  *%rcx
  802576:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80257b:	eb 2d                	jmp    8025aa <write+0xd2>
  80257d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802581:	48 8b 40 18          	mov    0x18(%rax),%rax
  802585:	48 85 c0             	test   %rax,%rax
  802588:	75 07                	jne    802591 <write+0xb9>
  80258a:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80258f:	eb 19                	jmp    8025aa <write+0xd2>
  802591:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802595:	48 8b 40 18          	mov    0x18(%rax),%rax
  802599:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80259d:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8025a1:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8025a5:	48 89 cf             	mov    %rcx,%rdi
  8025a8:	ff d0                	callq  *%rax
  8025aa:	c9                   	leaveq 
  8025ab:	c3                   	retq   

00000000008025ac <seek>:
  8025ac:	55                   	push   %rbp
  8025ad:	48 89 e5             	mov    %rsp,%rbp
  8025b0:	48 83 ec 18          	sub    $0x18,%rsp
  8025b4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8025b7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8025ba:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025be:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8025c1:	48 89 d6             	mov    %rdx,%rsi
  8025c4:	89 c7                	mov    %eax,%edi
  8025c6:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  8025cd:	00 00 00 
  8025d0:	ff d0                	callq  *%rax
  8025d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025d9:	79 05                	jns    8025e0 <seek+0x34>
  8025db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025de:	eb 0f                	jmp    8025ef <seek+0x43>
  8025e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025e4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8025e7:	89 50 04             	mov    %edx,0x4(%rax)
  8025ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8025ef:	c9                   	leaveq 
  8025f0:	c3                   	retq   

00000000008025f1 <ftruncate>:
  8025f1:	55                   	push   %rbp
  8025f2:	48 89 e5             	mov    %rsp,%rbp
  8025f5:	48 83 ec 30          	sub    $0x30,%rsp
  8025f9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8025fc:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8025ff:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802603:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802606:	48 89 d6             	mov    %rdx,%rsi
  802609:	89 c7                	mov    %eax,%edi
  80260b:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  802612:	00 00 00 
  802615:	ff d0                	callq  *%rax
  802617:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80261a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80261e:	78 24                	js     802644 <ftruncate+0x53>
  802620:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802624:	8b 00                	mov    (%rax),%eax
  802626:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80262a:	48 89 d6             	mov    %rdx,%rsi
  80262d:	89 c7                	mov    %eax,%edi
  80262f:	48 b8 b3 20 80 00 00 	movabs $0x8020b3,%rax
  802636:	00 00 00 
  802639:	ff d0                	callq  *%rax
  80263b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80263e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802642:	79 05                	jns    802649 <ftruncate+0x58>
  802644:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802647:	eb 72                	jmp    8026bb <ftruncate+0xca>
  802649:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80264d:	8b 40 08             	mov    0x8(%rax),%eax
  802650:	83 e0 03             	and    $0x3,%eax
  802653:	85 c0                	test   %eax,%eax
  802655:	75 3a                	jne    802691 <ftruncate+0xa0>
  802657:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  80265e:	00 00 00 
  802661:	48 8b 00             	mov    (%rax),%rax
  802664:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80266a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80266d:	89 c6                	mov    %eax,%esi
  80266f:	48 bf f0 4a 80 00 00 	movabs $0x804af0,%rdi
  802676:	00 00 00 
  802679:	b8 00 00 00 00       	mov    $0x0,%eax
  80267e:	48 b9 b6 05 80 00 00 	movabs $0x8005b6,%rcx
  802685:	00 00 00 
  802688:	ff d1                	callq  *%rcx
  80268a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80268f:	eb 2a                	jmp    8026bb <ftruncate+0xca>
  802691:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802695:	48 8b 40 30          	mov    0x30(%rax),%rax
  802699:	48 85 c0             	test   %rax,%rax
  80269c:	75 07                	jne    8026a5 <ftruncate+0xb4>
  80269e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8026a3:	eb 16                	jmp    8026bb <ftruncate+0xca>
  8026a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026a9:	48 8b 40 30          	mov    0x30(%rax),%rax
  8026ad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8026b1:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8026b4:	89 ce                	mov    %ecx,%esi
  8026b6:	48 89 d7             	mov    %rdx,%rdi
  8026b9:	ff d0                	callq  *%rax
  8026bb:	c9                   	leaveq 
  8026bc:	c3                   	retq   

00000000008026bd <fstat>:
  8026bd:	55                   	push   %rbp
  8026be:	48 89 e5             	mov    %rsp,%rbp
  8026c1:	48 83 ec 30          	sub    $0x30,%rsp
  8026c5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8026c8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8026cc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8026d0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8026d3:	48 89 d6             	mov    %rdx,%rsi
  8026d6:	89 c7                	mov    %eax,%edi
  8026d8:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  8026df:	00 00 00 
  8026e2:	ff d0                	callq  *%rax
  8026e4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026e7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026eb:	78 24                	js     802711 <fstat+0x54>
  8026ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026f1:	8b 00                	mov    (%rax),%eax
  8026f3:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026f7:	48 89 d6             	mov    %rdx,%rsi
  8026fa:	89 c7                	mov    %eax,%edi
  8026fc:	48 b8 b3 20 80 00 00 	movabs $0x8020b3,%rax
  802703:	00 00 00 
  802706:	ff d0                	callq  *%rax
  802708:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80270b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80270f:	79 05                	jns    802716 <fstat+0x59>
  802711:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802714:	eb 5e                	jmp    802774 <fstat+0xb7>
  802716:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80271a:	48 8b 40 28          	mov    0x28(%rax),%rax
  80271e:	48 85 c0             	test   %rax,%rax
  802721:	75 07                	jne    80272a <fstat+0x6d>
  802723:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802728:	eb 4a                	jmp    802774 <fstat+0xb7>
  80272a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80272e:	c6 00 00             	movb   $0x0,(%rax)
  802731:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802735:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  80273c:	00 00 00 
  80273f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802743:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80274a:	00 00 00 
  80274d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802751:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802755:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  80275c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802760:	48 8b 40 28          	mov    0x28(%rax),%rax
  802764:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802768:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  80276c:	48 89 ce             	mov    %rcx,%rsi
  80276f:	48 89 d7             	mov    %rdx,%rdi
  802772:	ff d0                	callq  *%rax
  802774:	c9                   	leaveq 
  802775:	c3                   	retq   

0000000000802776 <stat>:
  802776:	55                   	push   %rbp
  802777:	48 89 e5             	mov    %rsp,%rbp
  80277a:	48 83 ec 20          	sub    $0x20,%rsp
  80277e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802782:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802786:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80278a:	be 00 00 00 00       	mov    $0x0,%esi
  80278f:	48 89 c7             	mov    %rax,%rdi
  802792:	48 b8 66 28 80 00 00 	movabs $0x802866,%rax
  802799:	00 00 00 
  80279c:	ff d0                	callq  *%rax
  80279e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027a1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027a5:	79 05                	jns    8027ac <stat+0x36>
  8027a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027aa:	eb 2f                	jmp    8027db <stat+0x65>
  8027ac:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8027b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027b3:	48 89 d6             	mov    %rdx,%rsi
  8027b6:	89 c7                	mov    %eax,%edi
  8027b8:	48 b8 bd 26 80 00 00 	movabs $0x8026bd,%rax
  8027bf:	00 00 00 
  8027c2:	ff d0                	callq  *%rax
  8027c4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8027c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027ca:	89 c7                	mov    %eax,%edi
  8027cc:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  8027d3:	00 00 00 
  8027d6:	ff d0                	callq  *%rax
  8027d8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8027db:	c9                   	leaveq 
  8027dc:	c3                   	retq   

00000000008027dd <fsipc>:
  8027dd:	55                   	push   %rbp
  8027de:	48 89 e5             	mov    %rsp,%rbp
  8027e1:	48 83 ec 10          	sub    $0x10,%rsp
  8027e5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8027e8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8027ec:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8027f3:	00 00 00 
  8027f6:	8b 00                	mov    (%rax),%eax
  8027f8:	85 c0                	test   %eax,%eax
  8027fa:	75 1f                	jne    80281b <fsipc+0x3e>
  8027fc:	bf 01 00 00 00       	mov    $0x1,%edi
  802801:	48 b8 f1 43 80 00 00 	movabs $0x8043f1,%rax
  802808:	00 00 00 
  80280b:	ff d0                	callq  *%rax
  80280d:	89 c2                	mov    %eax,%edx
  80280f:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  802816:	00 00 00 
  802819:	89 10                	mov    %edx,(%rax)
  80281b:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  802822:	00 00 00 
  802825:	8b 00                	mov    (%rax),%eax
  802827:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80282a:	b9 07 00 00 00       	mov    $0x7,%ecx
  80282f:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  802836:	00 00 00 
  802839:	89 c7                	mov    %eax,%edi
  80283b:	48 b8 e7 42 80 00 00 	movabs $0x8042e7,%rax
  802842:	00 00 00 
  802845:	ff d0                	callq  *%rax
  802847:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80284b:	ba 00 00 00 00       	mov    $0x0,%edx
  802850:	48 89 c6             	mov    %rax,%rsi
  802853:	bf 00 00 00 00       	mov    $0x0,%edi
  802858:	48 b8 26 42 80 00 00 	movabs $0x804226,%rax
  80285f:	00 00 00 
  802862:	ff d0                	callq  *%rax
  802864:	c9                   	leaveq 
  802865:	c3                   	retq   

0000000000802866 <open>:
  802866:	55                   	push   %rbp
  802867:	48 89 e5             	mov    %rsp,%rbp
  80286a:	48 83 ec 20          	sub    $0x20,%rsp
  80286e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802872:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802875:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802879:	48 89 c7             	mov    %rax,%rdi
  80287c:	48 b8 da 10 80 00 00 	movabs $0x8010da,%rax
  802883:	00 00 00 
  802886:	ff d0                	callq  *%rax
  802888:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80288d:	7e 0a                	jle    802899 <open+0x33>
  80288f:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802894:	e9 a5 00 00 00       	jmpq   80293e <open+0xd8>
  802899:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80289d:	48 89 c7             	mov    %rax,%rdi
  8028a0:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  8028a7:	00 00 00 
  8028aa:	ff d0                	callq  *%rax
  8028ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028b3:	79 08                	jns    8028bd <open+0x57>
  8028b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028b8:	e9 81 00 00 00       	jmpq   80293e <open+0xd8>
  8028bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028c1:	48 89 c6             	mov    %rax,%rsi
  8028c4:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  8028cb:	00 00 00 
  8028ce:	48 b8 46 11 80 00 00 	movabs $0x801146,%rax
  8028d5:	00 00 00 
  8028d8:	ff d0                	callq  *%rax
  8028da:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028e1:	00 00 00 
  8028e4:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8028e7:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8028ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028f1:	48 89 c6             	mov    %rax,%rsi
  8028f4:	bf 01 00 00 00       	mov    $0x1,%edi
  8028f9:	48 b8 dd 27 80 00 00 	movabs $0x8027dd,%rax
  802900:	00 00 00 
  802903:	ff d0                	callq  *%rax
  802905:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802908:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80290c:	79 1d                	jns    80292b <open+0xc5>
  80290e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802912:	be 00 00 00 00       	mov    $0x0,%esi
  802917:	48 89 c7             	mov    %rax,%rdi
  80291a:	48 b8 e8 1f 80 00 00 	movabs $0x801fe8,%rax
  802921:	00 00 00 
  802924:	ff d0                	callq  *%rax
  802926:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802929:	eb 13                	jmp    80293e <open+0xd8>
  80292b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80292f:	48 89 c7             	mov    %rax,%rdi
  802932:	48 b8 72 1e 80 00 00 	movabs $0x801e72,%rax
  802939:	00 00 00 
  80293c:	ff d0                	callq  *%rax
  80293e:	c9                   	leaveq 
  80293f:	c3                   	retq   

0000000000802940 <devfile_flush>:
  802940:	55                   	push   %rbp
  802941:	48 89 e5             	mov    %rsp,%rbp
  802944:	48 83 ec 10          	sub    $0x10,%rsp
  802948:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80294c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802950:	8b 50 0c             	mov    0xc(%rax),%edx
  802953:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80295a:	00 00 00 
  80295d:	89 10                	mov    %edx,(%rax)
  80295f:	be 00 00 00 00       	mov    $0x0,%esi
  802964:	bf 06 00 00 00       	mov    $0x6,%edi
  802969:	48 b8 dd 27 80 00 00 	movabs $0x8027dd,%rax
  802970:	00 00 00 
  802973:	ff d0                	callq  *%rax
  802975:	c9                   	leaveq 
  802976:	c3                   	retq   

0000000000802977 <devfile_read>:
  802977:	55                   	push   %rbp
  802978:	48 89 e5             	mov    %rsp,%rbp
  80297b:	48 83 ec 30          	sub    $0x30,%rsp
  80297f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802983:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802987:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80298b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80298f:	8b 50 0c             	mov    0xc(%rax),%edx
  802992:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802999:	00 00 00 
  80299c:	89 10                	mov    %edx,(%rax)
  80299e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029a5:	00 00 00 
  8029a8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8029ac:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8029b0:	be 00 00 00 00       	mov    $0x0,%esi
  8029b5:	bf 03 00 00 00       	mov    $0x3,%edi
  8029ba:	48 b8 dd 27 80 00 00 	movabs $0x8027dd,%rax
  8029c1:	00 00 00 
  8029c4:	ff d0                	callq  *%rax
  8029c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029cd:	79 08                	jns    8029d7 <devfile_read+0x60>
  8029cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029d2:	e9 a4 00 00 00       	jmpq   802a7b <devfile_read+0x104>
  8029d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029da:	48 98                	cltq   
  8029dc:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8029e0:	76 35                	jbe    802a17 <devfile_read+0xa0>
  8029e2:	48 b9 16 4b 80 00 00 	movabs $0x804b16,%rcx
  8029e9:	00 00 00 
  8029ec:	48 ba 1d 4b 80 00 00 	movabs $0x804b1d,%rdx
  8029f3:	00 00 00 
  8029f6:	be 89 00 00 00       	mov    $0x89,%esi
  8029fb:	48 bf 32 4b 80 00 00 	movabs $0x804b32,%rdi
  802a02:	00 00 00 
  802a05:	b8 00 00 00 00       	mov    $0x0,%eax
  802a0a:	49 b8 7c 03 80 00 00 	movabs $0x80037c,%r8
  802a11:	00 00 00 
  802a14:	41 ff d0             	callq  *%r8
  802a17:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802a1e:	7e 35                	jle    802a55 <devfile_read+0xde>
  802a20:	48 b9 40 4b 80 00 00 	movabs $0x804b40,%rcx
  802a27:	00 00 00 
  802a2a:	48 ba 1d 4b 80 00 00 	movabs $0x804b1d,%rdx
  802a31:	00 00 00 
  802a34:	be 8a 00 00 00       	mov    $0x8a,%esi
  802a39:	48 bf 32 4b 80 00 00 	movabs $0x804b32,%rdi
  802a40:	00 00 00 
  802a43:	b8 00 00 00 00       	mov    $0x0,%eax
  802a48:	49 b8 7c 03 80 00 00 	movabs $0x80037c,%r8
  802a4f:	00 00 00 
  802a52:	41 ff d0             	callq  *%r8
  802a55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a58:	48 63 d0             	movslq %eax,%rdx
  802a5b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802a5f:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802a66:	00 00 00 
  802a69:	48 89 c7             	mov    %rax,%rdi
  802a6c:	48 b8 6b 14 80 00 00 	movabs $0x80146b,%rax
  802a73:	00 00 00 
  802a76:	ff d0                	callq  *%rax
  802a78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a7b:	c9                   	leaveq 
  802a7c:	c3                   	retq   

0000000000802a7d <devfile_write>:
  802a7d:	55                   	push   %rbp
  802a7e:	48 89 e5             	mov    %rsp,%rbp
  802a81:	48 83 ec 40          	sub    $0x40,%rsp
  802a85:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802a89:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a8d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a91:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802a95:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802a99:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802aa0:	00 
  802aa1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802aa5:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802aa9:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802aae:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802ab2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802ab6:	8b 50 0c             	mov    0xc(%rax),%edx
  802ab9:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ac0:	00 00 00 
  802ac3:	89 10                	mov    %edx,(%rax)
  802ac5:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802acc:	00 00 00 
  802acf:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ad3:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802ad7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802adb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802adf:	48 89 c6             	mov    %rax,%rsi
  802ae2:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802ae9:	00 00 00 
  802aec:	48 b8 6b 14 80 00 00 	movabs $0x80146b,%rax
  802af3:	00 00 00 
  802af6:	ff d0                	callq  *%rax
  802af8:	be 00 00 00 00       	mov    $0x0,%esi
  802afd:	bf 04 00 00 00       	mov    $0x4,%edi
  802b02:	48 b8 dd 27 80 00 00 	movabs $0x8027dd,%rax
  802b09:	00 00 00 
  802b0c:	ff d0                	callq  *%rax
  802b0e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802b11:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802b15:	79 05                	jns    802b1c <devfile_write+0x9f>
  802b17:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b1a:	eb 43                	jmp    802b5f <devfile_write+0xe2>
  802b1c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b1f:	48 98                	cltq   
  802b21:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802b25:	76 35                	jbe    802b5c <devfile_write+0xdf>
  802b27:	48 b9 16 4b 80 00 00 	movabs $0x804b16,%rcx
  802b2e:	00 00 00 
  802b31:	48 ba 1d 4b 80 00 00 	movabs $0x804b1d,%rdx
  802b38:	00 00 00 
  802b3b:	be a8 00 00 00       	mov    $0xa8,%esi
  802b40:	48 bf 32 4b 80 00 00 	movabs $0x804b32,%rdi
  802b47:	00 00 00 
  802b4a:	b8 00 00 00 00       	mov    $0x0,%eax
  802b4f:	49 b8 7c 03 80 00 00 	movabs $0x80037c,%r8
  802b56:	00 00 00 
  802b59:	41 ff d0             	callq  *%r8
  802b5c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b5f:	c9                   	leaveq 
  802b60:	c3                   	retq   

0000000000802b61 <devfile_stat>:
  802b61:	55                   	push   %rbp
  802b62:	48 89 e5             	mov    %rsp,%rbp
  802b65:	48 83 ec 20          	sub    $0x20,%rsp
  802b69:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b6d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b71:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b75:	8b 50 0c             	mov    0xc(%rax),%edx
  802b78:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b7f:	00 00 00 
  802b82:	89 10                	mov    %edx,(%rax)
  802b84:	be 00 00 00 00       	mov    $0x0,%esi
  802b89:	bf 05 00 00 00       	mov    $0x5,%edi
  802b8e:	48 b8 dd 27 80 00 00 	movabs $0x8027dd,%rax
  802b95:	00 00 00 
  802b98:	ff d0                	callq  *%rax
  802b9a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ba1:	79 05                	jns    802ba8 <devfile_stat+0x47>
  802ba3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ba6:	eb 56                	jmp    802bfe <devfile_stat+0x9d>
  802ba8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bac:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802bb3:	00 00 00 
  802bb6:	48 89 c7             	mov    %rax,%rdi
  802bb9:	48 b8 46 11 80 00 00 	movabs $0x801146,%rax
  802bc0:	00 00 00 
  802bc3:	ff d0                	callq  *%rax
  802bc5:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bcc:	00 00 00 
  802bcf:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802bd5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bd9:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802bdf:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802be6:	00 00 00 
  802be9:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802bef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bf3:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802bf9:	b8 00 00 00 00       	mov    $0x0,%eax
  802bfe:	c9                   	leaveq 
  802bff:	c3                   	retq   

0000000000802c00 <devfile_trunc>:
  802c00:	55                   	push   %rbp
  802c01:	48 89 e5             	mov    %rsp,%rbp
  802c04:	48 83 ec 10          	sub    $0x10,%rsp
  802c08:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c0c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802c0f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c13:	8b 50 0c             	mov    0xc(%rax),%edx
  802c16:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c1d:	00 00 00 
  802c20:	89 10                	mov    %edx,(%rax)
  802c22:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c29:	00 00 00 
  802c2c:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802c2f:	89 50 04             	mov    %edx,0x4(%rax)
  802c32:	be 00 00 00 00       	mov    $0x0,%esi
  802c37:	bf 02 00 00 00       	mov    $0x2,%edi
  802c3c:	48 b8 dd 27 80 00 00 	movabs $0x8027dd,%rax
  802c43:	00 00 00 
  802c46:	ff d0                	callq  *%rax
  802c48:	c9                   	leaveq 
  802c49:	c3                   	retq   

0000000000802c4a <remove>:
  802c4a:	55                   	push   %rbp
  802c4b:	48 89 e5             	mov    %rsp,%rbp
  802c4e:	48 83 ec 10          	sub    $0x10,%rsp
  802c52:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802c56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c5a:	48 89 c7             	mov    %rax,%rdi
  802c5d:	48 b8 da 10 80 00 00 	movabs $0x8010da,%rax
  802c64:	00 00 00 
  802c67:	ff d0                	callq  *%rax
  802c69:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802c6e:	7e 07                	jle    802c77 <remove+0x2d>
  802c70:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802c75:	eb 33                	jmp    802caa <remove+0x60>
  802c77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802c7b:	48 89 c6             	mov    %rax,%rsi
  802c7e:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802c85:	00 00 00 
  802c88:	48 b8 46 11 80 00 00 	movabs $0x801146,%rax
  802c8f:	00 00 00 
  802c92:	ff d0                	callq  *%rax
  802c94:	be 00 00 00 00       	mov    $0x0,%esi
  802c99:	bf 07 00 00 00       	mov    $0x7,%edi
  802c9e:	48 b8 dd 27 80 00 00 	movabs $0x8027dd,%rax
  802ca5:	00 00 00 
  802ca8:	ff d0                	callq  *%rax
  802caa:	c9                   	leaveq 
  802cab:	c3                   	retq   

0000000000802cac <sync>:
  802cac:	55                   	push   %rbp
  802cad:	48 89 e5             	mov    %rsp,%rbp
  802cb0:	be 00 00 00 00       	mov    $0x0,%esi
  802cb5:	bf 08 00 00 00       	mov    $0x8,%edi
  802cba:	48 b8 dd 27 80 00 00 	movabs $0x8027dd,%rax
  802cc1:	00 00 00 
  802cc4:	ff d0                	callq  *%rax
  802cc6:	5d                   	pop    %rbp
  802cc7:	c3                   	retq   

0000000000802cc8 <copy>:
  802cc8:	55                   	push   %rbp
  802cc9:	48 89 e5             	mov    %rsp,%rbp
  802ccc:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802cd3:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802cda:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802ce1:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802ce8:	be 00 00 00 00       	mov    $0x0,%esi
  802ced:	48 89 c7             	mov    %rax,%rdi
  802cf0:	48 b8 66 28 80 00 00 	movabs $0x802866,%rax
  802cf7:	00 00 00 
  802cfa:	ff d0                	callq  *%rax
  802cfc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d03:	79 28                	jns    802d2d <copy+0x65>
  802d05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d08:	89 c6                	mov    %eax,%esi
  802d0a:	48 bf 4c 4b 80 00 00 	movabs $0x804b4c,%rdi
  802d11:	00 00 00 
  802d14:	b8 00 00 00 00       	mov    $0x0,%eax
  802d19:	48 ba b6 05 80 00 00 	movabs $0x8005b6,%rdx
  802d20:	00 00 00 
  802d23:	ff d2                	callq  *%rdx
  802d25:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d28:	e9 76 01 00 00       	jmpq   802ea3 <copy+0x1db>
  802d2d:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802d34:	be 01 01 00 00       	mov    $0x101,%esi
  802d39:	48 89 c7             	mov    %rax,%rdi
  802d3c:	48 b8 66 28 80 00 00 	movabs $0x802866,%rax
  802d43:	00 00 00 
  802d46:	ff d0                	callq  *%rax
  802d48:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802d4b:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802d4f:	0f 89 ad 00 00 00    	jns    802e02 <copy+0x13a>
  802d55:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d58:	89 c6                	mov    %eax,%esi
  802d5a:	48 bf 62 4b 80 00 00 	movabs $0x804b62,%rdi
  802d61:	00 00 00 
  802d64:	b8 00 00 00 00       	mov    $0x0,%eax
  802d69:	48 ba b6 05 80 00 00 	movabs $0x8005b6,%rdx
  802d70:	00 00 00 
  802d73:	ff d2                	callq  *%rdx
  802d75:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d78:	89 c7                	mov    %eax,%edi
  802d7a:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  802d81:	00 00 00 
  802d84:	ff d0                	callq  *%rax
  802d86:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d89:	e9 15 01 00 00       	jmpq   802ea3 <copy+0x1db>
  802d8e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d91:	48 63 d0             	movslq %eax,%rdx
  802d94:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d9b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d9e:	48 89 ce             	mov    %rcx,%rsi
  802da1:	89 c7                	mov    %eax,%edi
  802da3:	48 b8 d8 24 80 00 00 	movabs $0x8024d8,%rax
  802daa:	00 00 00 
  802dad:	ff d0                	callq  *%rax
  802daf:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802db2:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802db6:	79 4a                	jns    802e02 <copy+0x13a>
  802db8:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802dbb:	89 c6                	mov    %eax,%esi
  802dbd:	48 bf 7c 4b 80 00 00 	movabs $0x804b7c,%rdi
  802dc4:	00 00 00 
  802dc7:	b8 00 00 00 00       	mov    $0x0,%eax
  802dcc:	48 ba b6 05 80 00 00 	movabs $0x8005b6,%rdx
  802dd3:	00 00 00 
  802dd6:	ff d2                	callq  *%rdx
  802dd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ddb:	89 c7                	mov    %eax,%edi
  802ddd:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  802de4:	00 00 00 
  802de7:	ff d0                	callq  *%rax
  802de9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dec:	89 c7                	mov    %eax,%edi
  802dee:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  802df5:	00 00 00 
  802df8:	ff d0                	callq  *%rax
  802dfa:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802dfd:	e9 a1 00 00 00       	jmpq   802ea3 <copy+0x1db>
  802e02:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e0c:	ba 00 02 00 00       	mov    $0x200,%edx
  802e11:	48 89 ce             	mov    %rcx,%rsi
  802e14:	89 c7                	mov    %eax,%edi
  802e16:	48 b8 8d 23 80 00 00 	movabs $0x80238d,%rax
  802e1d:	00 00 00 
  802e20:	ff d0                	callq  *%rax
  802e22:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802e25:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e29:	0f 8f 5f ff ff ff    	jg     802d8e <copy+0xc6>
  802e2f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802e33:	79 47                	jns    802e7c <copy+0x1b4>
  802e35:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e38:	89 c6                	mov    %eax,%esi
  802e3a:	48 bf 8f 4b 80 00 00 	movabs $0x804b8f,%rdi
  802e41:	00 00 00 
  802e44:	b8 00 00 00 00       	mov    $0x0,%eax
  802e49:	48 ba b6 05 80 00 00 	movabs $0x8005b6,%rdx
  802e50:	00 00 00 
  802e53:	ff d2                	callq  *%rdx
  802e55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e58:	89 c7                	mov    %eax,%edi
  802e5a:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  802e61:	00 00 00 
  802e64:	ff d0                	callq  *%rax
  802e66:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e69:	89 c7                	mov    %eax,%edi
  802e6b:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  802e72:	00 00 00 
  802e75:	ff d0                	callq  *%rax
  802e77:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e7a:	eb 27                	jmp    802ea3 <copy+0x1db>
  802e7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e7f:	89 c7                	mov    %eax,%edi
  802e81:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  802e88:	00 00 00 
  802e8b:	ff d0                	callq  *%rax
  802e8d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e90:	89 c7                	mov    %eax,%edi
  802e92:	48 b8 6a 21 80 00 00 	movabs $0x80216a,%rax
  802e99:	00 00 00 
  802e9c:	ff d0                	callq  *%rax
  802e9e:	b8 00 00 00 00       	mov    $0x0,%eax
  802ea3:	c9                   	leaveq 
  802ea4:	c3                   	retq   

0000000000802ea5 <writebuf>:
  802ea5:	55                   	push   %rbp
  802ea6:	48 89 e5             	mov    %rsp,%rbp
  802ea9:	48 83 ec 20          	sub    $0x20,%rsp
  802ead:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802eb1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eb5:	8b 40 0c             	mov    0xc(%rax),%eax
  802eb8:	85 c0                	test   %eax,%eax
  802eba:	7e 67                	jle    802f23 <writebuf+0x7e>
  802ebc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ec0:	8b 40 04             	mov    0x4(%rax),%eax
  802ec3:	48 63 d0             	movslq %eax,%rdx
  802ec6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eca:	48 8d 48 10          	lea    0x10(%rax),%rcx
  802ece:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ed2:	8b 00                	mov    (%rax),%eax
  802ed4:	48 89 ce             	mov    %rcx,%rsi
  802ed7:	89 c7                	mov    %eax,%edi
  802ed9:	48 b8 d8 24 80 00 00 	movabs $0x8024d8,%rax
  802ee0:	00 00 00 
  802ee3:	ff d0                	callq  *%rax
  802ee5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ee8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802eec:	7e 13                	jle    802f01 <writebuf+0x5c>
  802eee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ef2:	8b 50 08             	mov    0x8(%rax),%edx
  802ef5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ef8:	01 c2                	add    %eax,%edx
  802efa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802efe:	89 50 08             	mov    %edx,0x8(%rax)
  802f01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f05:	8b 40 04             	mov    0x4(%rax),%eax
  802f08:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  802f0b:	74 16                	je     802f23 <writebuf+0x7e>
  802f0d:	b8 00 00 00 00       	mov    $0x0,%eax
  802f12:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f16:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  802f1a:	89 c2                	mov    %eax,%edx
  802f1c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f20:	89 50 0c             	mov    %edx,0xc(%rax)
  802f23:	90                   	nop
  802f24:	c9                   	leaveq 
  802f25:	c3                   	retq   

0000000000802f26 <putch>:
  802f26:	55                   	push   %rbp
  802f27:	48 89 e5             	mov    %rsp,%rbp
  802f2a:	48 83 ec 20          	sub    $0x20,%rsp
  802f2e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f31:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f35:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f39:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802f3d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f41:	8b 40 04             	mov    0x4(%rax),%eax
  802f44:	8d 48 01             	lea    0x1(%rax),%ecx
  802f47:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802f4b:	89 4a 04             	mov    %ecx,0x4(%rdx)
  802f4e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802f51:	89 d1                	mov    %edx,%ecx
  802f53:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802f57:	48 98                	cltq   
  802f59:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  802f5d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f61:	8b 40 04             	mov    0x4(%rax),%eax
  802f64:	3d 00 01 00 00       	cmp    $0x100,%eax
  802f69:	75 1e                	jne    802f89 <putch+0x63>
  802f6b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f6f:	48 89 c7             	mov    %rax,%rdi
  802f72:	48 b8 a5 2e 80 00 00 	movabs $0x802ea5,%rax
  802f79:	00 00 00 
  802f7c:	ff d0                	callq  *%rax
  802f7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802f82:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  802f89:	90                   	nop
  802f8a:	c9                   	leaveq 
  802f8b:	c3                   	retq   

0000000000802f8c <vfprintf>:
  802f8c:	55                   	push   %rbp
  802f8d:	48 89 e5             	mov    %rsp,%rbp
  802f90:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  802f97:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  802f9d:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  802fa4:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  802fab:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  802fb1:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  802fb7:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  802fbe:	00 00 00 
  802fc1:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  802fc8:	00 00 00 
  802fcb:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  802fd2:	00 00 00 
  802fd5:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  802fdc:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  802fe3:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  802fea:	48 89 c6             	mov    %rax,%rsi
  802fed:	48 bf 26 2f 80 00 00 	movabs $0x802f26,%rdi
  802ff4:	00 00 00 
  802ff7:	48 b8 54 09 80 00 00 	movabs $0x800954,%rax
  802ffe:	00 00 00 
  803001:	ff d0                	callq  *%rax
  803003:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  803009:	85 c0                	test   %eax,%eax
  80300b:	7e 16                	jle    803023 <vfprintf+0x97>
  80300d:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  803014:	48 89 c7             	mov    %rax,%rdi
  803017:	48 b8 a5 2e 80 00 00 	movabs $0x802ea5,%rax
  80301e:	00 00 00 
  803021:	ff d0                	callq  *%rax
  803023:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  803029:	85 c0                	test   %eax,%eax
  80302b:	74 08                	je     803035 <vfprintf+0xa9>
  80302d:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  803033:	eb 06                	jmp    80303b <vfprintf+0xaf>
  803035:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  80303b:	c9                   	leaveq 
  80303c:	c3                   	retq   

000000000080303d <fprintf>:
  80303d:	55                   	push   %rbp
  80303e:	48 89 e5             	mov    %rsp,%rbp
  803041:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  803048:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  80304e:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803055:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80305c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803063:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80306a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803071:	84 c0                	test   %al,%al
  803073:	74 20                	je     803095 <fprintf+0x58>
  803075:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803079:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80307d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803081:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803085:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803089:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80308d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803091:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803095:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  80309c:	00 00 00 
  80309f:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8030a6:	00 00 00 
  8030a9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8030ad:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8030b4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8030bb:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8030c2:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8030c9:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  8030d0:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8030d6:	48 89 ce             	mov    %rcx,%rsi
  8030d9:	89 c7                	mov    %eax,%edi
  8030db:	48 b8 8c 2f 80 00 00 	movabs $0x802f8c,%rax
  8030e2:	00 00 00 
  8030e5:	ff d0                	callq  *%rax
  8030e7:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8030ed:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8030f3:	c9                   	leaveq 
  8030f4:	c3                   	retq   

00000000008030f5 <printf>:
  8030f5:	55                   	push   %rbp
  8030f6:	48 89 e5             	mov    %rsp,%rbp
  8030f9:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  803100:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  803107:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80310e:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803115:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80311c:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803123:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80312a:	84 c0                	test   %al,%al
  80312c:	74 20                	je     80314e <printf+0x59>
  80312e:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803132:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803136:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80313a:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  80313e:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803142:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803146:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80314a:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  80314e:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  803155:	00 00 00 
  803158:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80315f:	00 00 00 
  803162:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803166:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80316d:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803174:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80317b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803182:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  803189:	48 89 c6             	mov    %rax,%rsi
  80318c:	bf 01 00 00 00       	mov    $0x1,%edi
  803191:	48 b8 8c 2f 80 00 00 	movabs $0x802f8c,%rax
  803198:	00 00 00 
  80319b:	ff d0                	callq  *%rax
  80319d:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8031a3:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8031a9:	c9                   	leaveq 
  8031aa:	c3                   	retq   

00000000008031ab <fd2sockid>:
  8031ab:	55                   	push   %rbp
  8031ac:	48 89 e5             	mov    %rsp,%rbp
  8031af:	48 83 ec 20          	sub    $0x20,%rsp
  8031b3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8031b6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8031ba:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8031bd:	48 89 d6             	mov    %rdx,%rsi
  8031c0:	89 c7                	mov    %eax,%edi
  8031c2:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  8031c9:	00 00 00 
  8031cc:	ff d0                	callq  *%rax
  8031ce:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031d1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031d5:	79 05                	jns    8031dc <fd2sockid+0x31>
  8031d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031da:	eb 24                	jmp    803200 <fd2sockid+0x55>
  8031dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031e0:	8b 10                	mov    (%rax),%edx
  8031e2:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  8031e9:	00 00 00 
  8031ec:	8b 00                	mov    (%rax),%eax
  8031ee:	39 c2                	cmp    %eax,%edx
  8031f0:	74 07                	je     8031f9 <fd2sockid+0x4e>
  8031f2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8031f7:	eb 07                	jmp    803200 <fd2sockid+0x55>
  8031f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031fd:	8b 40 0c             	mov    0xc(%rax),%eax
  803200:	c9                   	leaveq 
  803201:	c3                   	retq   

0000000000803202 <alloc_sockfd>:
  803202:	55                   	push   %rbp
  803203:	48 89 e5             	mov    %rsp,%rbp
  803206:	48 83 ec 20          	sub    $0x20,%rsp
  80320a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80320d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803211:	48 89 c7             	mov    %rax,%rdi
  803214:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  80321b:	00 00 00 
  80321e:	ff d0                	callq  *%rax
  803220:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803223:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803227:	78 26                	js     80324f <alloc_sockfd+0x4d>
  803229:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80322d:	ba 07 04 00 00       	mov    $0x407,%edx
  803232:	48 89 c6             	mov    %rax,%rsi
  803235:	bf 00 00 00 00       	mov    $0x0,%edi
  80323a:	48 b8 76 1a 80 00 00 	movabs $0x801a76,%rax
  803241:	00 00 00 
  803244:	ff d0                	callq  *%rax
  803246:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803249:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80324d:	79 16                	jns    803265 <alloc_sockfd+0x63>
  80324f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803252:	89 c7                	mov    %eax,%edi
  803254:	48 b8 11 37 80 00 00 	movabs $0x803711,%rax
  80325b:	00 00 00 
  80325e:	ff d0                	callq  *%rax
  803260:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803263:	eb 3a                	jmp    80329f <alloc_sockfd+0x9d>
  803265:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803269:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  803270:	00 00 00 
  803273:	8b 12                	mov    (%rdx),%edx
  803275:	89 10                	mov    %edx,(%rax)
  803277:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80327b:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803282:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803286:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803289:	89 50 0c             	mov    %edx,0xc(%rax)
  80328c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803290:	48 89 c7             	mov    %rax,%rdi
  803293:	48 b8 72 1e 80 00 00 	movabs $0x801e72,%rax
  80329a:	00 00 00 
  80329d:	ff d0                	callq  *%rax
  80329f:	c9                   	leaveq 
  8032a0:	c3                   	retq   

00000000008032a1 <accept>:
  8032a1:	55                   	push   %rbp
  8032a2:	48 89 e5             	mov    %rsp,%rbp
  8032a5:	48 83 ec 30          	sub    $0x30,%rsp
  8032a9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032ac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032b0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8032b4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032b7:	89 c7                	mov    %eax,%edi
  8032b9:	48 b8 ab 31 80 00 00 	movabs $0x8031ab,%rax
  8032c0:	00 00 00 
  8032c3:	ff d0                	callq  *%rax
  8032c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032cc:	79 05                	jns    8032d3 <accept+0x32>
  8032ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032d1:	eb 3b                	jmp    80330e <accept+0x6d>
  8032d3:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8032d7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8032db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032de:	48 89 ce             	mov    %rcx,%rsi
  8032e1:	89 c7                	mov    %eax,%edi
  8032e3:	48 b8 ee 35 80 00 00 	movabs $0x8035ee,%rax
  8032ea:	00 00 00 
  8032ed:	ff d0                	callq  *%rax
  8032ef:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032f2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032f6:	79 05                	jns    8032fd <accept+0x5c>
  8032f8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032fb:	eb 11                	jmp    80330e <accept+0x6d>
  8032fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803300:	89 c7                	mov    %eax,%edi
  803302:	48 b8 02 32 80 00 00 	movabs $0x803202,%rax
  803309:	00 00 00 
  80330c:	ff d0                	callq  *%rax
  80330e:	c9                   	leaveq 
  80330f:	c3                   	retq   

0000000000803310 <bind>:
  803310:	55                   	push   %rbp
  803311:	48 89 e5             	mov    %rsp,%rbp
  803314:	48 83 ec 20          	sub    $0x20,%rsp
  803318:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80331b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80331f:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803322:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803325:	89 c7                	mov    %eax,%edi
  803327:	48 b8 ab 31 80 00 00 	movabs $0x8031ab,%rax
  80332e:	00 00 00 
  803331:	ff d0                	callq  *%rax
  803333:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803336:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80333a:	79 05                	jns    803341 <bind+0x31>
  80333c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80333f:	eb 1b                	jmp    80335c <bind+0x4c>
  803341:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803344:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803348:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80334b:	48 89 ce             	mov    %rcx,%rsi
  80334e:	89 c7                	mov    %eax,%edi
  803350:	48 b8 6d 36 80 00 00 	movabs $0x80366d,%rax
  803357:	00 00 00 
  80335a:	ff d0                	callq  *%rax
  80335c:	c9                   	leaveq 
  80335d:	c3                   	retq   

000000000080335e <shutdown>:
  80335e:	55                   	push   %rbp
  80335f:	48 89 e5             	mov    %rsp,%rbp
  803362:	48 83 ec 20          	sub    $0x20,%rsp
  803366:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803369:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80336c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80336f:	89 c7                	mov    %eax,%edi
  803371:	48 b8 ab 31 80 00 00 	movabs $0x8031ab,%rax
  803378:	00 00 00 
  80337b:	ff d0                	callq  *%rax
  80337d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803380:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803384:	79 05                	jns    80338b <shutdown+0x2d>
  803386:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803389:	eb 16                	jmp    8033a1 <shutdown+0x43>
  80338b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80338e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803391:	89 d6                	mov    %edx,%esi
  803393:	89 c7                	mov    %eax,%edi
  803395:	48 b8 d1 36 80 00 00 	movabs $0x8036d1,%rax
  80339c:	00 00 00 
  80339f:	ff d0                	callq  *%rax
  8033a1:	c9                   	leaveq 
  8033a2:	c3                   	retq   

00000000008033a3 <devsock_close>:
  8033a3:	55                   	push   %rbp
  8033a4:	48 89 e5             	mov    %rsp,%rbp
  8033a7:	48 83 ec 10          	sub    $0x10,%rsp
  8033ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8033af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033b3:	48 89 c7             	mov    %rax,%rdi
  8033b6:	48 b8 62 44 80 00 00 	movabs $0x804462,%rax
  8033bd:	00 00 00 
  8033c0:	ff d0                	callq  *%rax
  8033c2:	83 f8 01             	cmp    $0x1,%eax
  8033c5:	75 17                	jne    8033de <devsock_close+0x3b>
  8033c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033cb:	8b 40 0c             	mov    0xc(%rax),%eax
  8033ce:	89 c7                	mov    %eax,%edi
  8033d0:	48 b8 11 37 80 00 00 	movabs $0x803711,%rax
  8033d7:	00 00 00 
  8033da:	ff d0                	callq  *%rax
  8033dc:	eb 05                	jmp    8033e3 <devsock_close+0x40>
  8033de:	b8 00 00 00 00       	mov    $0x0,%eax
  8033e3:	c9                   	leaveq 
  8033e4:	c3                   	retq   

00000000008033e5 <connect>:
  8033e5:	55                   	push   %rbp
  8033e6:	48 89 e5             	mov    %rsp,%rbp
  8033e9:	48 83 ec 20          	sub    $0x20,%rsp
  8033ed:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033f0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033f4:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8033f7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033fa:	89 c7                	mov    %eax,%edi
  8033fc:	48 b8 ab 31 80 00 00 	movabs $0x8031ab,%rax
  803403:	00 00 00 
  803406:	ff d0                	callq  *%rax
  803408:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80340b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80340f:	79 05                	jns    803416 <connect+0x31>
  803411:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803414:	eb 1b                	jmp    803431 <connect+0x4c>
  803416:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803419:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80341d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803420:	48 89 ce             	mov    %rcx,%rsi
  803423:	89 c7                	mov    %eax,%edi
  803425:	48 b8 3e 37 80 00 00 	movabs $0x80373e,%rax
  80342c:	00 00 00 
  80342f:	ff d0                	callq  *%rax
  803431:	c9                   	leaveq 
  803432:	c3                   	retq   

0000000000803433 <listen>:
  803433:	55                   	push   %rbp
  803434:	48 89 e5             	mov    %rsp,%rbp
  803437:	48 83 ec 20          	sub    $0x20,%rsp
  80343b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80343e:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803441:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803444:	89 c7                	mov    %eax,%edi
  803446:	48 b8 ab 31 80 00 00 	movabs $0x8031ab,%rax
  80344d:	00 00 00 
  803450:	ff d0                	callq  *%rax
  803452:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803455:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803459:	79 05                	jns    803460 <listen+0x2d>
  80345b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80345e:	eb 16                	jmp    803476 <listen+0x43>
  803460:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803463:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803466:	89 d6                	mov    %edx,%esi
  803468:	89 c7                	mov    %eax,%edi
  80346a:	48 b8 a2 37 80 00 00 	movabs $0x8037a2,%rax
  803471:	00 00 00 
  803474:	ff d0                	callq  *%rax
  803476:	c9                   	leaveq 
  803477:	c3                   	retq   

0000000000803478 <devsock_read>:
  803478:	55                   	push   %rbp
  803479:	48 89 e5             	mov    %rsp,%rbp
  80347c:	48 83 ec 20          	sub    $0x20,%rsp
  803480:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803484:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803488:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80348c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803490:	89 c2                	mov    %eax,%edx
  803492:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803496:	8b 40 0c             	mov    0xc(%rax),%eax
  803499:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80349d:	b9 00 00 00 00       	mov    $0x0,%ecx
  8034a2:	89 c7                	mov    %eax,%edi
  8034a4:	48 b8 e2 37 80 00 00 	movabs $0x8037e2,%rax
  8034ab:	00 00 00 
  8034ae:	ff d0                	callq  *%rax
  8034b0:	c9                   	leaveq 
  8034b1:	c3                   	retq   

00000000008034b2 <devsock_write>:
  8034b2:	55                   	push   %rbp
  8034b3:	48 89 e5             	mov    %rsp,%rbp
  8034b6:	48 83 ec 20          	sub    $0x20,%rsp
  8034ba:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8034be:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8034c2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8034c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8034ca:	89 c2                	mov    %eax,%edx
  8034cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034d0:	8b 40 0c             	mov    0xc(%rax),%eax
  8034d3:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8034d7:	b9 00 00 00 00       	mov    $0x0,%ecx
  8034dc:	89 c7                	mov    %eax,%edi
  8034de:	48 b8 ae 38 80 00 00 	movabs $0x8038ae,%rax
  8034e5:	00 00 00 
  8034e8:	ff d0                	callq  *%rax
  8034ea:	c9                   	leaveq 
  8034eb:	c3                   	retq   

00000000008034ec <devsock_stat>:
  8034ec:	55                   	push   %rbp
  8034ed:	48 89 e5             	mov    %rsp,%rbp
  8034f0:	48 83 ec 10          	sub    $0x10,%rsp
  8034f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8034f8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8034fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803500:	48 be aa 4b 80 00 00 	movabs $0x804baa,%rsi
  803507:	00 00 00 
  80350a:	48 89 c7             	mov    %rax,%rdi
  80350d:	48 b8 46 11 80 00 00 	movabs $0x801146,%rax
  803514:	00 00 00 
  803517:	ff d0                	callq  *%rax
  803519:	b8 00 00 00 00       	mov    $0x0,%eax
  80351e:	c9                   	leaveq 
  80351f:	c3                   	retq   

0000000000803520 <socket>:
  803520:	55                   	push   %rbp
  803521:	48 89 e5             	mov    %rsp,%rbp
  803524:	48 83 ec 20          	sub    $0x20,%rsp
  803528:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80352b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80352e:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803531:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803534:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803537:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80353a:	89 ce                	mov    %ecx,%esi
  80353c:	89 c7                	mov    %eax,%edi
  80353e:	48 b8 66 39 80 00 00 	movabs $0x803966,%rax
  803545:	00 00 00 
  803548:	ff d0                	callq  *%rax
  80354a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80354d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803551:	79 05                	jns    803558 <socket+0x38>
  803553:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803556:	eb 11                	jmp    803569 <socket+0x49>
  803558:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80355b:	89 c7                	mov    %eax,%edi
  80355d:	48 b8 02 32 80 00 00 	movabs $0x803202,%rax
  803564:	00 00 00 
  803567:	ff d0                	callq  *%rax
  803569:	c9                   	leaveq 
  80356a:	c3                   	retq   

000000000080356b <nsipc>:
  80356b:	55                   	push   %rbp
  80356c:	48 89 e5             	mov    %rsp,%rbp
  80356f:	48 83 ec 10          	sub    $0x10,%rsp
  803573:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803576:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80357d:	00 00 00 
  803580:	8b 00                	mov    (%rax),%eax
  803582:	85 c0                	test   %eax,%eax
  803584:	75 1f                	jne    8035a5 <nsipc+0x3a>
  803586:	bf 02 00 00 00       	mov    $0x2,%edi
  80358b:	48 b8 f1 43 80 00 00 	movabs $0x8043f1,%rax
  803592:	00 00 00 
  803595:	ff d0                	callq  *%rax
  803597:	89 c2                	mov    %eax,%edx
  803599:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8035a0:	00 00 00 
  8035a3:	89 10                	mov    %edx,(%rax)
  8035a5:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8035ac:	00 00 00 
  8035af:	8b 00                	mov    (%rax),%eax
  8035b1:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8035b4:	b9 07 00 00 00       	mov    $0x7,%ecx
  8035b9:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8035c0:	00 00 00 
  8035c3:	89 c7                	mov    %eax,%edi
  8035c5:	48 b8 e7 42 80 00 00 	movabs $0x8042e7,%rax
  8035cc:	00 00 00 
  8035cf:	ff d0                	callq  *%rax
  8035d1:	ba 00 00 00 00       	mov    $0x0,%edx
  8035d6:	be 00 00 00 00       	mov    $0x0,%esi
  8035db:	bf 00 00 00 00       	mov    $0x0,%edi
  8035e0:	48 b8 26 42 80 00 00 	movabs $0x804226,%rax
  8035e7:	00 00 00 
  8035ea:	ff d0                	callq  *%rax
  8035ec:	c9                   	leaveq 
  8035ed:	c3                   	retq   

00000000008035ee <nsipc_accept>:
  8035ee:	55                   	push   %rbp
  8035ef:	48 89 e5             	mov    %rsp,%rbp
  8035f2:	48 83 ec 30          	sub    $0x30,%rsp
  8035f6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035f9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8035fd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803601:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803608:	00 00 00 
  80360b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80360e:	89 10                	mov    %edx,(%rax)
  803610:	bf 01 00 00 00       	mov    $0x1,%edi
  803615:	48 b8 6b 35 80 00 00 	movabs $0x80356b,%rax
  80361c:	00 00 00 
  80361f:	ff d0                	callq  *%rax
  803621:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803624:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803628:	78 3e                	js     803668 <nsipc_accept+0x7a>
  80362a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803631:	00 00 00 
  803634:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803638:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80363c:	8b 40 10             	mov    0x10(%rax),%eax
  80363f:	89 c2                	mov    %eax,%edx
  803641:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803645:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803649:	48 89 ce             	mov    %rcx,%rsi
  80364c:	48 89 c7             	mov    %rax,%rdi
  80364f:	48 b8 6b 14 80 00 00 	movabs $0x80146b,%rax
  803656:	00 00 00 
  803659:	ff d0                	callq  *%rax
  80365b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80365f:	8b 50 10             	mov    0x10(%rax),%edx
  803662:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803666:	89 10                	mov    %edx,(%rax)
  803668:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80366b:	c9                   	leaveq 
  80366c:	c3                   	retq   

000000000080366d <nsipc_bind>:
  80366d:	55                   	push   %rbp
  80366e:	48 89 e5             	mov    %rsp,%rbp
  803671:	48 83 ec 10          	sub    $0x10,%rsp
  803675:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803678:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80367c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80367f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803686:	00 00 00 
  803689:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80368c:	89 10                	mov    %edx,(%rax)
  80368e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803691:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803695:	48 89 c6             	mov    %rax,%rsi
  803698:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80369f:	00 00 00 
  8036a2:	48 b8 6b 14 80 00 00 	movabs $0x80146b,%rax
  8036a9:	00 00 00 
  8036ac:	ff d0                	callq  *%rax
  8036ae:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036b5:	00 00 00 
  8036b8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8036bb:	89 50 14             	mov    %edx,0x14(%rax)
  8036be:	bf 02 00 00 00       	mov    $0x2,%edi
  8036c3:	48 b8 6b 35 80 00 00 	movabs $0x80356b,%rax
  8036ca:	00 00 00 
  8036cd:	ff d0                	callq  *%rax
  8036cf:	c9                   	leaveq 
  8036d0:	c3                   	retq   

00000000008036d1 <nsipc_shutdown>:
  8036d1:	55                   	push   %rbp
  8036d2:	48 89 e5             	mov    %rsp,%rbp
  8036d5:	48 83 ec 10          	sub    $0x10,%rsp
  8036d9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8036dc:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8036df:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036e6:	00 00 00 
  8036e9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8036ec:	89 10                	mov    %edx,(%rax)
  8036ee:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036f5:	00 00 00 
  8036f8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8036fb:	89 50 04             	mov    %edx,0x4(%rax)
  8036fe:	bf 03 00 00 00       	mov    $0x3,%edi
  803703:	48 b8 6b 35 80 00 00 	movabs $0x80356b,%rax
  80370a:	00 00 00 
  80370d:	ff d0                	callq  *%rax
  80370f:	c9                   	leaveq 
  803710:	c3                   	retq   

0000000000803711 <nsipc_close>:
  803711:	55                   	push   %rbp
  803712:	48 89 e5             	mov    %rsp,%rbp
  803715:	48 83 ec 10          	sub    $0x10,%rsp
  803719:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80371c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803723:	00 00 00 
  803726:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803729:	89 10                	mov    %edx,(%rax)
  80372b:	bf 04 00 00 00       	mov    $0x4,%edi
  803730:	48 b8 6b 35 80 00 00 	movabs $0x80356b,%rax
  803737:	00 00 00 
  80373a:	ff d0                	callq  *%rax
  80373c:	c9                   	leaveq 
  80373d:	c3                   	retq   

000000000080373e <nsipc_connect>:
  80373e:	55                   	push   %rbp
  80373f:	48 89 e5             	mov    %rsp,%rbp
  803742:	48 83 ec 10          	sub    $0x10,%rsp
  803746:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803749:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80374d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803750:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803757:	00 00 00 
  80375a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80375d:	89 10                	mov    %edx,(%rax)
  80375f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803762:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803766:	48 89 c6             	mov    %rax,%rsi
  803769:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803770:	00 00 00 
  803773:	48 b8 6b 14 80 00 00 	movabs $0x80146b,%rax
  80377a:	00 00 00 
  80377d:	ff d0                	callq  *%rax
  80377f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803786:	00 00 00 
  803789:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80378c:	89 50 14             	mov    %edx,0x14(%rax)
  80378f:	bf 05 00 00 00       	mov    $0x5,%edi
  803794:	48 b8 6b 35 80 00 00 	movabs $0x80356b,%rax
  80379b:	00 00 00 
  80379e:	ff d0                	callq  *%rax
  8037a0:	c9                   	leaveq 
  8037a1:	c3                   	retq   

00000000008037a2 <nsipc_listen>:
  8037a2:	55                   	push   %rbp
  8037a3:	48 89 e5             	mov    %rsp,%rbp
  8037a6:	48 83 ec 10          	sub    $0x10,%rsp
  8037aa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8037ad:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8037b0:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037b7:	00 00 00 
  8037ba:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8037bd:	89 10                	mov    %edx,(%rax)
  8037bf:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037c6:	00 00 00 
  8037c9:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8037cc:	89 50 04             	mov    %edx,0x4(%rax)
  8037cf:	bf 06 00 00 00       	mov    $0x6,%edi
  8037d4:	48 b8 6b 35 80 00 00 	movabs $0x80356b,%rax
  8037db:	00 00 00 
  8037de:	ff d0                	callq  *%rax
  8037e0:	c9                   	leaveq 
  8037e1:	c3                   	retq   

00000000008037e2 <nsipc_recv>:
  8037e2:	55                   	push   %rbp
  8037e3:	48 89 e5             	mov    %rsp,%rbp
  8037e6:	48 83 ec 30          	sub    $0x30,%rsp
  8037ea:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037ed:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037f1:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8037f4:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8037f7:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037fe:	00 00 00 
  803801:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803804:	89 10                	mov    %edx,(%rax)
  803806:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80380d:	00 00 00 
  803810:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803813:	89 50 04             	mov    %edx,0x4(%rax)
  803816:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80381d:	00 00 00 
  803820:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803823:	89 50 08             	mov    %edx,0x8(%rax)
  803826:	bf 07 00 00 00       	mov    $0x7,%edi
  80382b:	48 b8 6b 35 80 00 00 	movabs $0x80356b,%rax
  803832:	00 00 00 
  803835:	ff d0                	callq  *%rax
  803837:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80383a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80383e:	78 69                	js     8038a9 <nsipc_recv+0xc7>
  803840:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803847:	7f 08                	jg     803851 <nsipc_recv+0x6f>
  803849:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80384c:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80384f:	7e 35                	jle    803886 <nsipc_recv+0xa4>
  803851:	48 b9 b1 4b 80 00 00 	movabs $0x804bb1,%rcx
  803858:	00 00 00 
  80385b:	48 ba c6 4b 80 00 00 	movabs $0x804bc6,%rdx
  803862:	00 00 00 
  803865:	be 62 00 00 00       	mov    $0x62,%esi
  80386a:	48 bf db 4b 80 00 00 	movabs $0x804bdb,%rdi
  803871:	00 00 00 
  803874:	b8 00 00 00 00       	mov    $0x0,%eax
  803879:	49 b8 7c 03 80 00 00 	movabs $0x80037c,%r8
  803880:	00 00 00 
  803883:	41 ff d0             	callq  *%r8
  803886:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803889:	48 63 d0             	movslq %eax,%rdx
  80388c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803890:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803897:	00 00 00 
  80389a:	48 89 c7             	mov    %rax,%rdi
  80389d:	48 b8 6b 14 80 00 00 	movabs $0x80146b,%rax
  8038a4:	00 00 00 
  8038a7:	ff d0                	callq  *%rax
  8038a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038ac:	c9                   	leaveq 
  8038ad:	c3                   	retq   

00000000008038ae <nsipc_send>:
  8038ae:	55                   	push   %rbp
  8038af:	48 89 e5             	mov    %rsp,%rbp
  8038b2:	48 83 ec 20          	sub    $0x20,%rsp
  8038b6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038b9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038bd:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8038c0:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8038c3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038ca:	00 00 00 
  8038cd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8038d0:	89 10                	mov    %edx,(%rax)
  8038d2:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  8038d9:	7e 35                	jle    803910 <nsipc_send+0x62>
  8038db:	48 b9 ea 4b 80 00 00 	movabs $0x804bea,%rcx
  8038e2:	00 00 00 
  8038e5:	48 ba c6 4b 80 00 00 	movabs $0x804bc6,%rdx
  8038ec:	00 00 00 
  8038ef:	be 6d 00 00 00       	mov    $0x6d,%esi
  8038f4:	48 bf db 4b 80 00 00 	movabs $0x804bdb,%rdi
  8038fb:	00 00 00 
  8038fe:	b8 00 00 00 00       	mov    $0x0,%eax
  803903:	49 b8 7c 03 80 00 00 	movabs $0x80037c,%r8
  80390a:	00 00 00 
  80390d:	41 ff d0             	callq  *%r8
  803910:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803913:	48 63 d0             	movslq %eax,%rdx
  803916:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80391a:	48 89 c6             	mov    %rax,%rsi
  80391d:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  803924:	00 00 00 
  803927:	48 b8 6b 14 80 00 00 	movabs $0x80146b,%rax
  80392e:	00 00 00 
  803931:	ff d0                	callq  *%rax
  803933:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80393a:	00 00 00 
  80393d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803940:	89 50 04             	mov    %edx,0x4(%rax)
  803943:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80394a:	00 00 00 
  80394d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803950:	89 50 08             	mov    %edx,0x8(%rax)
  803953:	bf 08 00 00 00       	mov    $0x8,%edi
  803958:	48 b8 6b 35 80 00 00 	movabs $0x80356b,%rax
  80395f:	00 00 00 
  803962:	ff d0                	callq  *%rax
  803964:	c9                   	leaveq 
  803965:	c3                   	retq   

0000000000803966 <nsipc_socket>:
  803966:	55                   	push   %rbp
  803967:	48 89 e5             	mov    %rsp,%rbp
  80396a:	48 83 ec 10          	sub    $0x10,%rsp
  80396e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803971:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803974:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803977:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80397e:	00 00 00 
  803981:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803984:	89 10                	mov    %edx,(%rax)
  803986:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80398d:	00 00 00 
  803990:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803993:	89 50 04             	mov    %edx,0x4(%rax)
  803996:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80399d:	00 00 00 
  8039a0:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8039a3:	89 50 08             	mov    %edx,0x8(%rax)
  8039a6:	bf 09 00 00 00       	mov    $0x9,%edi
  8039ab:	48 b8 6b 35 80 00 00 	movabs $0x80356b,%rax
  8039b2:	00 00 00 
  8039b5:	ff d0                	callq  *%rax
  8039b7:	c9                   	leaveq 
  8039b8:	c3                   	retq   

00000000008039b9 <pipe>:
  8039b9:	55                   	push   %rbp
  8039ba:	48 89 e5             	mov    %rsp,%rbp
  8039bd:	53                   	push   %rbx
  8039be:	48 83 ec 38          	sub    $0x38,%rsp
  8039c2:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8039c6:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8039ca:	48 89 c7             	mov    %rax,%rdi
  8039cd:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  8039d4:	00 00 00 
  8039d7:	ff d0                	callq  *%rax
  8039d9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8039dc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8039e0:	0f 88 bf 01 00 00    	js     803ba5 <pipe+0x1ec>
  8039e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039ea:	ba 07 04 00 00       	mov    $0x407,%edx
  8039ef:	48 89 c6             	mov    %rax,%rsi
  8039f2:	bf 00 00 00 00       	mov    $0x0,%edi
  8039f7:	48 b8 76 1a 80 00 00 	movabs $0x801a76,%rax
  8039fe:	00 00 00 
  803a01:	ff d0                	callq  *%rax
  803a03:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a06:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a0a:	0f 88 95 01 00 00    	js     803ba5 <pipe+0x1ec>
  803a10:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803a14:	48 89 c7             	mov    %rax,%rdi
  803a17:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  803a1e:	00 00 00 
  803a21:	ff d0                	callq  *%rax
  803a23:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a26:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a2a:	0f 88 5d 01 00 00    	js     803b8d <pipe+0x1d4>
  803a30:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a34:	ba 07 04 00 00       	mov    $0x407,%edx
  803a39:	48 89 c6             	mov    %rax,%rsi
  803a3c:	bf 00 00 00 00       	mov    $0x0,%edi
  803a41:	48 b8 76 1a 80 00 00 	movabs $0x801a76,%rax
  803a48:	00 00 00 
  803a4b:	ff d0                	callq  *%rax
  803a4d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a50:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a54:	0f 88 33 01 00 00    	js     803b8d <pipe+0x1d4>
  803a5a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a5e:	48 89 c7             	mov    %rax,%rdi
  803a61:	48 b8 95 1e 80 00 00 	movabs $0x801e95,%rax
  803a68:	00 00 00 
  803a6b:	ff d0                	callq  *%rax
  803a6d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803a71:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a75:	ba 07 04 00 00       	mov    $0x407,%edx
  803a7a:	48 89 c6             	mov    %rax,%rsi
  803a7d:	bf 00 00 00 00       	mov    $0x0,%edi
  803a82:	48 b8 76 1a 80 00 00 	movabs $0x801a76,%rax
  803a89:	00 00 00 
  803a8c:	ff d0                	callq  *%rax
  803a8e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a91:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a95:	0f 88 d9 00 00 00    	js     803b74 <pipe+0x1bb>
  803a9b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a9f:	48 89 c7             	mov    %rax,%rdi
  803aa2:	48 b8 95 1e 80 00 00 	movabs $0x801e95,%rax
  803aa9:	00 00 00 
  803aac:	ff d0                	callq  *%rax
  803aae:	48 89 c2             	mov    %rax,%rdx
  803ab1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ab5:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803abb:	48 89 d1             	mov    %rdx,%rcx
  803abe:	ba 00 00 00 00       	mov    $0x0,%edx
  803ac3:	48 89 c6             	mov    %rax,%rsi
  803ac6:	bf 00 00 00 00       	mov    $0x0,%edi
  803acb:	48 b8 c8 1a 80 00 00 	movabs $0x801ac8,%rax
  803ad2:	00 00 00 
  803ad5:	ff d0                	callq  *%rax
  803ad7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ada:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ade:	78 79                	js     803b59 <pipe+0x1a0>
  803ae0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ae4:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803aeb:	00 00 00 
  803aee:	8b 12                	mov    (%rdx),%edx
  803af0:	89 10                	mov    %edx,(%rax)
  803af2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803af6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803afd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b01:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803b08:	00 00 00 
  803b0b:	8b 12                	mov    (%rdx),%edx
  803b0d:	89 10                	mov    %edx,(%rax)
  803b0f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b13:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803b1a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b1e:	48 89 c7             	mov    %rax,%rdi
  803b21:	48 b8 72 1e 80 00 00 	movabs $0x801e72,%rax
  803b28:	00 00 00 
  803b2b:	ff d0                	callq  *%rax
  803b2d:	89 c2                	mov    %eax,%edx
  803b2f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803b33:	89 10                	mov    %edx,(%rax)
  803b35:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803b39:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803b3d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b41:	48 89 c7             	mov    %rax,%rdi
  803b44:	48 b8 72 1e 80 00 00 	movabs $0x801e72,%rax
  803b4b:	00 00 00 
  803b4e:	ff d0                	callq  *%rax
  803b50:	89 03                	mov    %eax,(%rbx)
  803b52:	b8 00 00 00 00       	mov    $0x0,%eax
  803b57:	eb 4f                	jmp    803ba8 <pipe+0x1ef>
  803b59:	90                   	nop
  803b5a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b5e:	48 89 c6             	mov    %rax,%rsi
  803b61:	bf 00 00 00 00       	mov    $0x0,%edi
  803b66:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  803b6d:	00 00 00 
  803b70:	ff d0                	callq  *%rax
  803b72:	eb 01                	jmp    803b75 <pipe+0x1bc>
  803b74:	90                   	nop
  803b75:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b79:	48 89 c6             	mov    %rax,%rsi
  803b7c:	bf 00 00 00 00       	mov    $0x0,%edi
  803b81:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  803b88:	00 00 00 
  803b8b:	ff d0                	callq  *%rax
  803b8d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b91:	48 89 c6             	mov    %rax,%rsi
  803b94:	bf 00 00 00 00       	mov    $0x0,%edi
  803b99:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  803ba0:	00 00 00 
  803ba3:	ff d0                	callq  *%rax
  803ba5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ba8:	48 83 c4 38          	add    $0x38,%rsp
  803bac:	5b                   	pop    %rbx
  803bad:	5d                   	pop    %rbp
  803bae:	c3                   	retq   

0000000000803baf <_pipeisclosed>:
  803baf:	55                   	push   %rbp
  803bb0:	48 89 e5             	mov    %rsp,%rbp
  803bb3:	53                   	push   %rbx
  803bb4:	48 83 ec 28          	sub    $0x28,%rsp
  803bb8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803bbc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803bc0:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  803bc7:	00 00 00 
  803bca:	48 8b 00             	mov    (%rax),%rax
  803bcd:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803bd3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803bd6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bda:	48 89 c7             	mov    %rax,%rdi
  803bdd:	48 b8 62 44 80 00 00 	movabs $0x804462,%rax
  803be4:	00 00 00 
  803be7:	ff d0                	callq  *%rax
  803be9:	89 c3                	mov    %eax,%ebx
  803beb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bef:	48 89 c7             	mov    %rax,%rdi
  803bf2:	48 b8 62 44 80 00 00 	movabs $0x804462,%rax
  803bf9:	00 00 00 
  803bfc:	ff d0                	callq  *%rax
  803bfe:	39 c3                	cmp    %eax,%ebx
  803c00:	0f 94 c0             	sete   %al
  803c03:	0f b6 c0             	movzbl %al,%eax
  803c06:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803c09:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  803c10:	00 00 00 
  803c13:	48 8b 00             	mov    (%rax),%rax
  803c16:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803c1c:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803c1f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c22:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803c25:	75 05                	jne    803c2c <_pipeisclosed+0x7d>
  803c27:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803c2a:	eb 4a                	jmp    803c76 <_pipeisclosed+0xc7>
  803c2c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c2f:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803c32:	74 8c                	je     803bc0 <_pipeisclosed+0x11>
  803c34:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803c38:	75 86                	jne    803bc0 <_pipeisclosed+0x11>
  803c3a:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  803c41:	00 00 00 
  803c44:	48 8b 00             	mov    (%rax),%rax
  803c47:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803c4d:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803c50:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c53:	89 c6                	mov    %eax,%esi
  803c55:	48 bf fb 4b 80 00 00 	movabs $0x804bfb,%rdi
  803c5c:	00 00 00 
  803c5f:	b8 00 00 00 00       	mov    $0x0,%eax
  803c64:	49 b8 b6 05 80 00 00 	movabs $0x8005b6,%r8
  803c6b:	00 00 00 
  803c6e:	41 ff d0             	callq  *%r8
  803c71:	e9 4a ff ff ff       	jmpq   803bc0 <_pipeisclosed+0x11>
  803c76:	48 83 c4 28          	add    $0x28,%rsp
  803c7a:	5b                   	pop    %rbx
  803c7b:	5d                   	pop    %rbp
  803c7c:	c3                   	retq   

0000000000803c7d <pipeisclosed>:
  803c7d:	55                   	push   %rbp
  803c7e:	48 89 e5             	mov    %rsp,%rbp
  803c81:	48 83 ec 30          	sub    $0x30,%rsp
  803c85:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803c88:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803c8c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803c8f:	48 89 d6             	mov    %rdx,%rsi
  803c92:	89 c7                	mov    %eax,%edi
  803c94:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  803c9b:	00 00 00 
  803c9e:	ff d0                	callq  *%rax
  803ca0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ca3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ca7:	79 05                	jns    803cae <pipeisclosed+0x31>
  803ca9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cac:	eb 31                	jmp    803cdf <pipeisclosed+0x62>
  803cae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803cb2:	48 89 c7             	mov    %rax,%rdi
  803cb5:	48 b8 95 1e 80 00 00 	movabs $0x801e95,%rax
  803cbc:	00 00 00 
  803cbf:	ff d0                	callq  *%rax
  803cc1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803cc5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803cc9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ccd:	48 89 d6             	mov    %rdx,%rsi
  803cd0:	48 89 c7             	mov    %rax,%rdi
  803cd3:	48 b8 af 3b 80 00 00 	movabs $0x803baf,%rax
  803cda:	00 00 00 
  803cdd:	ff d0                	callq  *%rax
  803cdf:	c9                   	leaveq 
  803ce0:	c3                   	retq   

0000000000803ce1 <devpipe_read>:
  803ce1:	55                   	push   %rbp
  803ce2:	48 89 e5             	mov    %rsp,%rbp
  803ce5:	48 83 ec 40          	sub    $0x40,%rsp
  803ce9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803ced:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803cf1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803cf5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803cf9:	48 89 c7             	mov    %rax,%rdi
  803cfc:	48 b8 95 1e 80 00 00 	movabs $0x801e95,%rax
  803d03:	00 00 00 
  803d06:	ff d0                	callq  *%rax
  803d08:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d0c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d10:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803d14:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803d1b:	00 
  803d1c:	e9 90 00 00 00       	jmpq   803db1 <devpipe_read+0xd0>
  803d21:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803d26:	74 09                	je     803d31 <devpipe_read+0x50>
  803d28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d2c:	e9 8e 00 00 00       	jmpq   803dbf <devpipe_read+0xde>
  803d31:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d35:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d39:	48 89 d6             	mov    %rdx,%rsi
  803d3c:	48 89 c7             	mov    %rax,%rdi
  803d3f:	48 b8 af 3b 80 00 00 	movabs $0x803baf,%rax
  803d46:	00 00 00 
  803d49:	ff d0                	callq  *%rax
  803d4b:	85 c0                	test   %eax,%eax
  803d4d:	74 07                	je     803d56 <devpipe_read+0x75>
  803d4f:	b8 00 00 00 00       	mov    $0x0,%eax
  803d54:	eb 69                	jmp    803dbf <devpipe_read+0xde>
  803d56:	48 b8 39 1a 80 00 00 	movabs $0x801a39,%rax
  803d5d:	00 00 00 
  803d60:	ff d0                	callq  *%rax
  803d62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d66:	8b 10                	mov    (%rax),%edx
  803d68:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d6c:	8b 40 04             	mov    0x4(%rax),%eax
  803d6f:	39 c2                	cmp    %eax,%edx
  803d71:	74 ae                	je     803d21 <devpipe_read+0x40>
  803d73:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803d77:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d7b:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803d7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d83:	8b 00                	mov    (%rax),%eax
  803d85:	99                   	cltd   
  803d86:	c1 ea 1b             	shr    $0x1b,%edx
  803d89:	01 d0                	add    %edx,%eax
  803d8b:	83 e0 1f             	and    $0x1f,%eax
  803d8e:	29 d0                	sub    %edx,%eax
  803d90:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d94:	48 98                	cltq   
  803d96:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803d9b:	88 01                	mov    %al,(%rcx)
  803d9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803da1:	8b 00                	mov    (%rax),%eax
  803da3:	8d 50 01             	lea    0x1(%rax),%edx
  803da6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803daa:	89 10                	mov    %edx,(%rax)
  803dac:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803db1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803db5:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803db9:	72 a7                	jb     803d62 <devpipe_read+0x81>
  803dbb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dbf:	c9                   	leaveq 
  803dc0:	c3                   	retq   

0000000000803dc1 <devpipe_write>:
  803dc1:	55                   	push   %rbp
  803dc2:	48 89 e5             	mov    %rsp,%rbp
  803dc5:	48 83 ec 40          	sub    $0x40,%rsp
  803dc9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803dcd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803dd1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803dd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dd9:	48 89 c7             	mov    %rax,%rdi
  803ddc:	48 b8 95 1e 80 00 00 	movabs $0x801e95,%rax
  803de3:	00 00 00 
  803de6:	ff d0                	callq  *%rax
  803de8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803dec:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803df0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803df4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803dfb:	00 
  803dfc:	e9 8f 00 00 00       	jmpq   803e90 <devpipe_write+0xcf>
  803e01:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e05:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e09:	48 89 d6             	mov    %rdx,%rsi
  803e0c:	48 89 c7             	mov    %rax,%rdi
  803e0f:	48 b8 af 3b 80 00 00 	movabs $0x803baf,%rax
  803e16:	00 00 00 
  803e19:	ff d0                	callq  *%rax
  803e1b:	85 c0                	test   %eax,%eax
  803e1d:	74 07                	je     803e26 <devpipe_write+0x65>
  803e1f:	b8 00 00 00 00       	mov    $0x0,%eax
  803e24:	eb 78                	jmp    803e9e <devpipe_write+0xdd>
  803e26:	48 b8 39 1a 80 00 00 	movabs $0x801a39,%rax
  803e2d:	00 00 00 
  803e30:	ff d0                	callq  *%rax
  803e32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e36:	8b 40 04             	mov    0x4(%rax),%eax
  803e39:	48 63 d0             	movslq %eax,%rdx
  803e3c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e40:	8b 00                	mov    (%rax),%eax
  803e42:	48 98                	cltq   
  803e44:	48 83 c0 20          	add    $0x20,%rax
  803e48:	48 39 c2             	cmp    %rax,%rdx
  803e4b:	73 b4                	jae    803e01 <devpipe_write+0x40>
  803e4d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e51:	8b 40 04             	mov    0x4(%rax),%eax
  803e54:	99                   	cltd   
  803e55:	c1 ea 1b             	shr    $0x1b,%edx
  803e58:	01 d0                	add    %edx,%eax
  803e5a:	83 e0 1f             	and    $0x1f,%eax
  803e5d:	29 d0                	sub    %edx,%eax
  803e5f:	89 c6                	mov    %eax,%esi
  803e61:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803e65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e69:	48 01 d0             	add    %rdx,%rax
  803e6c:	0f b6 08             	movzbl (%rax),%ecx
  803e6f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e73:	48 63 c6             	movslq %esi,%rax
  803e76:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803e7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e7e:	8b 40 04             	mov    0x4(%rax),%eax
  803e81:	8d 50 01             	lea    0x1(%rax),%edx
  803e84:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e88:	89 50 04             	mov    %edx,0x4(%rax)
  803e8b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803e90:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e94:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803e98:	72 98                	jb     803e32 <devpipe_write+0x71>
  803e9a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e9e:	c9                   	leaveq 
  803e9f:	c3                   	retq   

0000000000803ea0 <devpipe_stat>:
  803ea0:	55                   	push   %rbp
  803ea1:	48 89 e5             	mov    %rsp,%rbp
  803ea4:	48 83 ec 20          	sub    $0x20,%rsp
  803ea8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803eac:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803eb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803eb4:	48 89 c7             	mov    %rax,%rdi
  803eb7:	48 b8 95 1e 80 00 00 	movabs $0x801e95,%rax
  803ebe:	00 00 00 
  803ec1:	ff d0                	callq  *%rax
  803ec3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803ec7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ecb:	48 be 0e 4c 80 00 00 	movabs $0x804c0e,%rsi
  803ed2:	00 00 00 
  803ed5:	48 89 c7             	mov    %rax,%rdi
  803ed8:	48 b8 46 11 80 00 00 	movabs $0x801146,%rax
  803edf:	00 00 00 
  803ee2:	ff d0                	callq  *%rax
  803ee4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ee8:	8b 50 04             	mov    0x4(%rax),%edx
  803eeb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803eef:	8b 00                	mov    (%rax),%eax
  803ef1:	29 c2                	sub    %eax,%edx
  803ef3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ef7:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803efd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f01:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803f08:	00 00 00 
  803f0b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f0f:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803f16:	00 00 00 
  803f19:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803f20:	b8 00 00 00 00       	mov    $0x0,%eax
  803f25:	c9                   	leaveq 
  803f26:	c3                   	retq   

0000000000803f27 <devpipe_close>:
  803f27:	55                   	push   %rbp
  803f28:	48 89 e5             	mov    %rsp,%rbp
  803f2b:	48 83 ec 10          	sub    $0x10,%rsp
  803f2f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f37:	48 89 c6             	mov    %rax,%rsi
  803f3a:	bf 00 00 00 00       	mov    $0x0,%edi
  803f3f:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  803f46:	00 00 00 
  803f49:	ff d0                	callq  *%rax
  803f4b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f4f:	48 89 c7             	mov    %rax,%rdi
  803f52:	48 b8 95 1e 80 00 00 	movabs $0x801e95,%rax
  803f59:	00 00 00 
  803f5c:	ff d0                	callq  *%rax
  803f5e:	48 89 c6             	mov    %rax,%rsi
  803f61:	bf 00 00 00 00       	mov    $0x0,%edi
  803f66:	48 b8 28 1b 80 00 00 	movabs $0x801b28,%rax
  803f6d:	00 00 00 
  803f70:	ff d0                	callq  *%rax
  803f72:	c9                   	leaveq 
  803f73:	c3                   	retq   

0000000000803f74 <cputchar>:
  803f74:	55                   	push   %rbp
  803f75:	48 89 e5             	mov    %rsp,%rbp
  803f78:	48 83 ec 20          	sub    $0x20,%rsp
  803f7c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f7f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f82:	88 45 ff             	mov    %al,-0x1(%rbp)
  803f85:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803f89:	be 01 00 00 00       	mov    $0x1,%esi
  803f8e:	48 89 c7             	mov    %rax,%rdi
  803f91:	48 b8 2e 19 80 00 00 	movabs $0x80192e,%rax
  803f98:	00 00 00 
  803f9b:	ff d0                	callq  *%rax
  803f9d:	90                   	nop
  803f9e:	c9                   	leaveq 
  803f9f:	c3                   	retq   

0000000000803fa0 <getchar>:
  803fa0:	55                   	push   %rbp
  803fa1:	48 89 e5             	mov    %rsp,%rbp
  803fa4:	48 83 ec 10          	sub    $0x10,%rsp
  803fa8:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803fac:	ba 01 00 00 00       	mov    $0x1,%edx
  803fb1:	48 89 c6             	mov    %rax,%rsi
  803fb4:	bf 00 00 00 00       	mov    $0x0,%edi
  803fb9:	48 b8 8d 23 80 00 00 	movabs $0x80238d,%rax
  803fc0:	00 00 00 
  803fc3:	ff d0                	callq  *%rax
  803fc5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fc8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fcc:	79 05                	jns    803fd3 <getchar+0x33>
  803fce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fd1:	eb 14                	jmp    803fe7 <getchar+0x47>
  803fd3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fd7:	7f 07                	jg     803fe0 <getchar+0x40>
  803fd9:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803fde:	eb 07                	jmp    803fe7 <getchar+0x47>
  803fe0:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803fe4:	0f b6 c0             	movzbl %al,%eax
  803fe7:	c9                   	leaveq 
  803fe8:	c3                   	retq   

0000000000803fe9 <iscons>:
  803fe9:	55                   	push   %rbp
  803fea:	48 89 e5             	mov    %rsp,%rbp
  803fed:	48 83 ec 20          	sub    $0x20,%rsp
  803ff1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ff4:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803ff8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ffb:	48 89 d6             	mov    %rdx,%rsi
  803ffe:	89 c7                	mov    %eax,%edi
  804000:	48 b8 58 1f 80 00 00 	movabs $0x801f58,%rax
  804007:	00 00 00 
  80400a:	ff d0                	callq  *%rax
  80400c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80400f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804013:	79 05                	jns    80401a <iscons+0x31>
  804015:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804018:	eb 1a                	jmp    804034 <iscons+0x4b>
  80401a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80401e:	8b 10                	mov    (%rax),%edx
  804020:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  804027:	00 00 00 
  80402a:	8b 00                	mov    (%rax),%eax
  80402c:	39 c2                	cmp    %eax,%edx
  80402e:	0f 94 c0             	sete   %al
  804031:	0f b6 c0             	movzbl %al,%eax
  804034:	c9                   	leaveq 
  804035:	c3                   	retq   

0000000000804036 <opencons>:
  804036:	55                   	push   %rbp
  804037:	48 89 e5             	mov    %rsp,%rbp
  80403a:	48 83 ec 10          	sub    $0x10,%rsp
  80403e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804042:	48 89 c7             	mov    %rax,%rdi
  804045:	48 b8 c0 1e 80 00 00 	movabs $0x801ec0,%rax
  80404c:	00 00 00 
  80404f:	ff d0                	callq  *%rax
  804051:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804054:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804058:	79 05                	jns    80405f <opencons+0x29>
  80405a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80405d:	eb 5b                	jmp    8040ba <opencons+0x84>
  80405f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804063:	ba 07 04 00 00       	mov    $0x407,%edx
  804068:	48 89 c6             	mov    %rax,%rsi
  80406b:	bf 00 00 00 00       	mov    $0x0,%edi
  804070:	48 b8 76 1a 80 00 00 	movabs $0x801a76,%rax
  804077:	00 00 00 
  80407a:	ff d0                	callq  *%rax
  80407c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80407f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804083:	79 05                	jns    80408a <opencons+0x54>
  804085:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804088:	eb 30                	jmp    8040ba <opencons+0x84>
  80408a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80408e:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  804095:	00 00 00 
  804098:	8b 12                	mov    (%rdx),%edx
  80409a:	89 10                	mov    %edx,(%rax)
  80409c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040a0:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8040a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040ab:	48 89 c7             	mov    %rax,%rdi
  8040ae:	48 b8 72 1e 80 00 00 	movabs $0x801e72,%rax
  8040b5:	00 00 00 
  8040b8:	ff d0                	callq  *%rax
  8040ba:	c9                   	leaveq 
  8040bb:	c3                   	retq   

00000000008040bc <devcons_read>:
  8040bc:	55                   	push   %rbp
  8040bd:	48 89 e5             	mov    %rsp,%rbp
  8040c0:	48 83 ec 30          	sub    $0x30,%rsp
  8040c4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8040c8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8040cc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8040d0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8040d5:	75 13                	jne    8040ea <devcons_read+0x2e>
  8040d7:	b8 00 00 00 00       	mov    $0x0,%eax
  8040dc:	eb 49                	jmp    804127 <devcons_read+0x6b>
  8040de:	48 b8 39 1a 80 00 00 	movabs $0x801a39,%rax
  8040e5:	00 00 00 
  8040e8:	ff d0                	callq  *%rax
  8040ea:	48 b8 7b 19 80 00 00 	movabs $0x80197b,%rax
  8040f1:	00 00 00 
  8040f4:	ff d0                	callq  *%rax
  8040f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040fd:	74 df                	je     8040de <devcons_read+0x22>
  8040ff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804103:	79 05                	jns    80410a <devcons_read+0x4e>
  804105:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804108:	eb 1d                	jmp    804127 <devcons_read+0x6b>
  80410a:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80410e:	75 07                	jne    804117 <devcons_read+0x5b>
  804110:	b8 00 00 00 00       	mov    $0x0,%eax
  804115:	eb 10                	jmp    804127 <devcons_read+0x6b>
  804117:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80411a:	89 c2                	mov    %eax,%edx
  80411c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804120:	88 10                	mov    %dl,(%rax)
  804122:	b8 01 00 00 00       	mov    $0x1,%eax
  804127:	c9                   	leaveq 
  804128:	c3                   	retq   

0000000000804129 <devcons_write>:
  804129:	55                   	push   %rbp
  80412a:	48 89 e5             	mov    %rsp,%rbp
  80412d:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  804134:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  80413b:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804142:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804149:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804150:	eb 76                	jmp    8041c8 <devcons_write+0x9f>
  804152:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804159:	89 c2                	mov    %eax,%edx
  80415b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80415e:	29 c2                	sub    %eax,%edx
  804160:	89 d0                	mov    %edx,%eax
  804162:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804165:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804168:	83 f8 7f             	cmp    $0x7f,%eax
  80416b:	76 07                	jbe    804174 <devcons_write+0x4b>
  80416d:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  804174:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804177:	48 63 d0             	movslq %eax,%rdx
  80417a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80417d:	48 63 c8             	movslq %eax,%rcx
  804180:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804187:	48 01 c1             	add    %rax,%rcx
  80418a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804191:	48 89 ce             	mov    %rcx,%rsi
  804194:	48 89 c7             	mov    %rax,%rdi
  804197:	48 b8 6b 14 80 00 00 	movabs $0x80146b,%rax
  80419e:	00 00 00 
  8041a1:	ff d0                	callq  *%rax
  8041a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8041a6:	48 63 d0             	movslq %eax,%rdx
  8041a9:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8041b0:	48 89 d6             	mov    %rdx,%rsi
  8041b3:	48 89 c7             	mov    %rax,%rdi
  8041b6:	48 b8 2e 19 80 00 00 	movabs $0x80192e,%rax
  8041bd:	00 00 00 
  8041c0:	ff d0                	callq  *%rax
  8041c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8041c5:	01 45 fc             	add    %eax,-0x4(%rbp)
  8041c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041cb:	48 98                	cltq   
  8041cd:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8041d4:	0f 82 78 ff ff ff    	jb     804152 <devcons_write+0x29>
  8041da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041dd:	c9                   	leaveq 
  8041de:	c3                   	retq   

00000000008041df <devcons_close>:
  8041df:	55                   	push   %rbp
  8041e0:	48 89 e5             	mov    %rsp,%rbp
  8041e3:	48 83 ec 08          	sub    $0x8,%rsp
  8041e7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8041eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8041f0:	c9                   	leaveq 
  8041f1:	c3                   	retq   

00000000008041f2 <devcons_stat>:
  8041f2:	55                   	push   %rbp
  8041f3:	48 89 e5             	mov    %rsp,%rbp
  8041f6:	48 83 ec 10          	sub    $0x10,%rsp
  8041fa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8041fe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804202:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804206:	48 be 1a 4c 80 00 00 	movabs $0x804c1a,%rsi
  80420d:	00 00 00 
  804210:	48 89 c7             	mov    %rax,%rdi
  804213:	48 b8 46 11 80 00 00 	movabs $0x801146,%rax
  80421a:	00 00 00 
  80421d:	ff d0                	callq  *%rax
  80421f:	b8 00 00 00 00       	mov    $0x0,%eax
  804224:	c9                   	leaveq 
  804225:	c3                   	retq   

0000000000804226 <ipc_recv>:
  804226:	55                   	push   %rbp
  804227:	48 89 e5             	mov    %rsp,%rbp
  80422a:	48 83 ec 30          	sub    $0x30,%rsp
  80422e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804232:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804236:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80423a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80423f:	75 0e                	jne    80424f <ipc_recv+0x29>
  804241:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804248:	00 00 00 
  80424b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80424f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804253:	48 89 c7             	mov    %rax,%rdi
  804256:	48 b8 b0 1c 80 00 00 	movabs $0x801cb0,%rax
  80425d:	00 00 00 
  804260:	ff d0                	callq  *%rax
  804262:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804265:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804269:	79 27                	jns    804292 <ipc_recv+0x6c>
  80426b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804270:	74 0a                	je     80427c <ipc_recv+0x56>
  804272:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804276:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80427c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804281:	74 0a                	je     80428d <ipc_recv+0x67>
  804283:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804287:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80428d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804290:	eb 53                	jmp    8042e5 <ipc_recv+0xbf>
  804292:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804297:	74 19                	je     8042b2 <ipc_recv+0x8c>
  804299:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  8042a0:	00 00 00 
  8042a3:	48 8b 00             	mov    (%rax),%rax
  8042a6:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8042ac:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042b0:	89 10                	mov    %edx,(%rax)
  8042b2:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8042b7:	74 19                	je     8042d2 <ipc_recv+0xac>
  8042b9:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  8042c0:	00 00 00 
  8042c3:	48 8b 00             	mov    (%rax),%rax
  8042c6:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8042cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042d0:	89 10                	mov    %edx,(%rax)
  8042d2:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  8042d9:	00 00 00 
  8042dc:	48 8b 00             	mov    (%rax),%rax
  8042df:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8042e5:	c9                   	leaveq 
  8042e6:	c3                   	retq   

00000000008042e7 <ipc_send>:
  8042e7:	55                   	push   %rbp
  8042e8:	48 89 e5             	mov    %rsp,%rbp
  8042eb:	48 83 ec 30          	sub    $0x30,%rsp
  8042ef:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8042f2:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8042f5:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8042f9:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8042fc:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804301:	75 1c                	jne    80431f <ipc_send+0x38>
  804303:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80430a:	00 00 00 
  80430d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804311:	eb 0c                	jmp    80431f <ipc_send+0x38>
  804313:	48 b8 39 1a 80 00 00 	movabs $0x801a39,%rax
  80431a:	00 00 00 
  80431d:	ff d0                	callq  *%rax
  80431f:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804322:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804325:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804329:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80432c:	89 c7                	mov    %eax,%edi
  80432e:	48 b8 59 1c 80 00 00 	movabs $0x801c59,%rax
  804335:	00 00 00 
  804338:	ff d0                	callq  *%rax
  80433a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80433d:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804341:	74 d0                	je     804313 <ipc_send+0x2c>
  804343:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804347:	79 30                	jns    804379 <ipc_send+0x92>
  804349:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80434c:	89 c1                	mov    %eax,%ecx
  80434e:	48 ba 28 4c 80 00 00 	movabs $0x804c28,%rdx
  804355:	00 00 00 
  804358:	be 44 00 00 00       	mov    $0x44,%esi
  80435d:	48 bf 3e 4c 80 00 00 	movabs $0x804c3e,%rdi
  804364:	00 00 00 
  804367:	b8 00 00 00 00       	mov    $0x0,%eax
  80436c:	49 b8 7c 03 80 00 00 	movabs $0x80037c,%r8
  804373:	00 00 00 
  804376:	41 ff d0             	callq  *%r8
  804379:	90                   	nop
  80437a:	c9                   	leaveq 
  80437b:	c3                   	retq   

000000000080437c <ipc_host_recv>:
  80437c:	55                   	push   %rbp
  80437d:	48 89 e5             	mov    %rsp,%rbp
  804380:	48 83 ec 10          	sub    $0x10,%rsp
  804384:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804388:	48 ba 50 4c 80 00 00 	movabs $0x804c50,%rdx
  80438f:	00 00 00 
  804392:	be 4e 00 00 00       	mov    $0x4e,%esi
  804397:	48 bf 3e 4c 80 00 00 	movabs $0x804c3e,%rdi
  80439e:	00 00 00 
  8043a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8043a6:	48 b9 7c 03 80 00 00 	movabs $0x80037c,%rcx
  8043ad:	00 00 00 
  8043b0:	ff d1                	callq  *%rcx

00000000008043b2 <ipc_host_send>:
  8043b2:	55                   	push   %rbp
  8043b3:	48 89 e5             	mov    %rsp,%rbp
  8043b6:	48 83 ec 20          	sub    $0x20,%rsp
  8043ba:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8043bd:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8043c0:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  8043c4:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8043c7:	48 ba 70 4c 80 00 00 	movabs $0x804c70,%rdx
  8043ce:	00 00 00 
  8043d1:	be 58 00 00 00       	mov    $0x58,%esi
  8043d6:	48 bf 3e 4c 80 00 00 	movabs $0x804c3e,%rdi
  8043dd:	00 00 00 
  8043e0:	b8 00 00 00 00       	mov    $0x0,%eax
  8043e5:	48 b9 7c 03 80 00 00 	movabs $0x80037c,%rcx
  8043ec:	00 00 00 
  8043ef:	ff d1                	callq  *%rcx

00000000008043f1 <ipc_find_env>:
  8043f1:	55                   	push   %rbp
  8043f2:	48 89 e5             	mov    %rsp,%rbp
  8043f5:	48 83 ec 18          	sub    $0x18,%rsp
  8043f9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8043fc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804403:	eb 4d                	jmp    804452 <ipc_find_env+0x61>
  804405:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80440c:	00 00 00 
  80440f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804412:	48 98                	cltq   
  804414:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80441b:	48 01 d0             	add    %rdx,%rax
  80441e:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804424:	8b 00                	mov    (%rax),%eax
  804426:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804429:	75 23                	jne    80444e <ipc_find_env+0x5d>
  80442b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804432:	00 00 00 
  804435:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804438:	48 98                	cltq   
  80443a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804441:	48 01 d0             	add    %rdx,%rax
  804444:	48 05 c8 00 00 00    	add    $0xc8,%rax
  80444a:	8b 00                	mov    (%rax),%eax
  80444c:	eb 12                	jmp    804460 <ipc_find_env+0x6f>
  80444e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804452:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804459:	7e aa                	jle    804405 <ipc_find_env+0x14>
  80445b:	b8 00 00 00 00       	mov    $0x0,%eax
  804460:	c9                   	leaveq 
  804461:	c3                   	retq   

0000000000804462 <pageref>:
  804462:	55                   	push   %rbp
  804463:	48 89 e5             	mov    %rsp,%rbp
  804466:	48 83 ec 18          	sub    $0x18,%rsp
  80446a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80446e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804472:	48 c1 e8 15          	shr    $0x15,%rax
  804476:	48 89 c2             	mov    %rax,%rdx
  804479:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804480:	01 00 00 
  804483:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804487:	83 e0 01             	and    $0x1,%eax
  80448a:	48 85 c0             	test   %rax,%rax
  80448d:	75 07                	jne    804496 <pageref+0x34>
  80448f:	b8 00 00 00 00       	mov    $0x0,%eax
  804494:	eb 56                	jmp    8044ec <pageref+0x8a>
  804496:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80449a:	48 c1 e8 0c          	shr    $0xc,%rax
  80449e:	48 89 c2             	mov    %rax,%rdx
  8044a1:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8044a8:	01 00 00 
  8044ab:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8044af:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8044b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044b7:	83 e0 01             	and    $0x1,%eax
  8044ba:	48 85 c0             	test   %rax,%rax
  8044bd:	75 07                	jne    8044c6 <pageref+0x64>
  8044bf:	b8 00 00 00 00       	mov    $0x0,%eax
  8044c4:	eb 26                	jmp    8044ec <pageref+0x8a>
  8044c6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8044ca:	48 c1 e8 0c          	shr    $0xc,%rax
  8044ce:	48 89 c2             	mov    %rax,%rdx
  8044d1:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8044d8:	00 00 00 
  8044db:	48 c1 e2 04          	shl    $0x4,%rdx
  8044df:	48 01 d0             	add    %rdx,%rax
  8044e2:	48 83 c0 08          	add    $0x8,%rax
  8044e6:	0f b7 00             	movzwl (%rax),%eax
  8044e9:	0f b7 c0             	movzwl %ax,%eax
  8044ec:	c9                   	leaveq 
  8044ed:	c3                   	retq   
