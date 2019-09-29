
vmm/guest/obj/user/writemotd:     file format elf64-x86-64


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
  80003c:	e8 37 03 00 00       	callq  800378 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80004e:	89 bd ec fd ff ff    	mov    %edi,-0x214(%rbp)
  800054:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80005b:	be 00 00 00 00       	mov    $0x0,%esi
  800060:	48 bf a0 42 80 00 00 	movabs $0x8042a0,%rdi
  800067:	00 00 00 
  80006a:	48 b8 0a 29 80 00 00 	movabs $0x80290a,%rax
  800071:	00 00 00 
  800074:	ff d0                	callq  *%rax
  800076:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800079:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80007d:	79 30                	jns    8000af <umain+0x6c>
  80007f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800082:	89 c1                	mov    %eax,%ecx
  800084:	48 ba a9 42 80 00 00 	movabs $0x8042a9,%rdx
  80008b:	00 00 00 
  80008e:	be 0c 00 00 00       	mov    $0xc,%esi
  800093:	48 bf bb 42 80 00 00 	movabs $0x8042bb,%rdi
  80009a:	00 00 00 
  80009d:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a2:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  8000a9:	00 00 00 
  8000ac:	41 ff d0             	callq  *%r8
  8000af:	be 02 00 00 00       	mov    $0x2,%esi
  8000b4:	48 bf cf 42 80 00 00 	movabs $0x8042cf,%rdi
  8000bb:	00 00 00 
  8000be:	48 b8 0a 29 80 00 00 	movabs $0x80290a,%rax
  8000c5:	00 00 00 
  8000c8:	ff d0                	callq  *%rax
  8000ca:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000cd:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000d1:	79 30                	jns    800103 <umain+0xc0>
  8000d3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000d6:	89 c1                	mov    %eax,%ecx
  8000d8:	48 ba d5 42 80 00 00 	movabs $0x8042d5,%rdx
  8000df:	00 00 00 
  8000e2:	be 0e 00 00 00       	mov    $0xe,%esi
  8000e7:	48 bf bb 42 80 00 00 	movabs $0x8042bb,%rdi
  8000ee:	00 00 00 
  8000f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8000f6:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  8000fd:	00 00 00 
  800100:	41 ff d0             	callq  *%r8
  800103:	8b 55 f8             	mov    -0x8(%rbp),%edx
  800106:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800109:	89 c6                	mov    %eax,%esi
  80010b:	48 bf e4 42 80 00 00 	movabs $0x8042e4,%rdi
  800112:	00 00 00 
  800115:	b8 00 00 00 00       	mov    $0x0,%eax
  80011a:	48 b9 5a 06 80 00 00 	movabs $0x80065a,%rcx
  800121:	00 00 00 
  800124:	ff d1                	callq  *%rcx
  800126:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800129:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  80012c:	75 2a                	jne    800158 <umain+0x115>
  80012e:	48 ba 00 43 80 00 00 	movabs $0x804300,%rdx
  800135:	00 00 00 
  800138:	be 11 00 00 00       	mov    $0x11,%esi
  80013d:	48 bf bb 42 80 00 00 	movabs $0x8042bb,%rdi
  800144:	00 00 00 
  800147:	b8 00 00 00 00       	mov    $0x0,%eax
  80014c:	48 b9 20 04 80 00 00 	movabs $0x800420,%rcx
  800153:	00 00 00 
  800156:	ff d1                	callq  *%rcx
  800158:	48 bf 32 43 80 00 00 	movabs $0x804332,%rdi
  80015f:	00 00 00 
  800162:	b8 00 00 00 00       	mov    $0x0,%eax
  800167:	48 ba 5a 06 80 00 00 	movabs $0x80065a,%rdx
  80016e:	00 00 00 
  800171:	ff d2                	callq  *%rdx
  800173:	eb 1f                	jmp    800194 <umain+0x151>
  800175:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800178:	48 63 d0             	movslq %eax,%rdx
  80017b:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
  800182:	48 89 d6             	mov    %rdx,%rsi
  800185:	48 89 c7             	mov    %rax,%rdi
  800188:	48 b8 d2 19 80 00 00 	movabs $0x8019d2,%rax
  80018f:	00 00 00 
  800192:	ff d0                	callq  *%rax
  800194:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80019b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80019e:	ba ff 01 00 00       	mov    $0x1ff,%edx
  8001a3:	48 89 ce             	mov    %rcx,%rsi
  8001a6:	89 c7                	mov    %eax,%edi
  8001a8:	48 b8 31 24 80 00 00 	movabs $0x802431,%rax
  8001af:	00 00 00 
  8001b2:	ff d0                	callq  *%rax
  8001b4:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8001b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8001bb:	7f b8                	jg     800175 <umain+0x132>
  8001bd:	48 bf 40 43 80 00 00 	movabs $0x804340,%rdi
  8001c4:	00 00 00 
  8001c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8001cc:	48 ba 5a 06 80 00 00 	movabs $0x80065a,%rdx
  8001d3:	00 00 00 
  8001d6:	ff d2                	callq  *%rdx
  8001d8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001db:	be 00 00 00 00       	mov    $0x0,%esi
  8001e0:	89 c7                	mov    %eax,%edi
  8001e2:	48 b8 50 26 80 00 00 	movabs $0x802650,%rax
  8001e9:	00 00 00 
  8001ec:	ff d0                	callq  *%rax
  8001ee:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001f1:	be 00 00 00 00       	mov    $0x0,%esi
  8001f6:	89 c7                	mov    %eax,%edi
  8001f8:	48 b8 95 26 80 00 00 	movabs $0x802695,%rax
  8001ff:	00 00 00 
  800202:	ff d0                	callq  *%rax
  800204:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800207:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80020b:	79 30                	jns    80023d <umain+0x1fa>
  80020d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  800210:	89 c1                	mov    %eax,%ecx
  800212:	48 ba 45 43 80 00 00 	movabs $0x804345,%rdx
  800219:	00 00 00 
  80021c:	be 1a 00 00 00       	mov    $0x1a,%esi
  800221:	48 bf bb 42 80 00 00 	movabs $0x8042bb,%rdi
  800228:	00 00 00 
  80022b:	b8 00 00 00 00       	mov    $0x0,%eax
  800230:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  800237:	00 00 00 
  80023a:	41 ff d0             	callq  *%r8
  80023d:	48 bf 58 43 80 00 00 	movabs $0x804358,%rdi
  800244:	00 00 00 
  800247:	b8 00 00 00 00       	mov    $0x0,%eax
  80024c:	48 ba 5a 06 80 00 00 	movabs $0x80065a,%rdx
  800253:	00 00 00 
  800256:	ff d2                	callq  *%rdx
  800258:	eb 7b                	jmp    8002d5 <umain+0x292>
  80025a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80025d:	48 63 d0             	movslq %eax,%rdx
  800260:	48 8d 85 f0 fd ff ff 	lea    -0x210(%rbp),%rax
  800267:	48 89 d6             	mov    %rdx,%rsi
  80026a:	48 89 c7             	mov    %rax,%rdi
  80026d:	48 b8 d2 19 80 00 00 	movabs $0x8019d2,%rax
  800274:	00 00 00 
  800277:	ff d0                	callq  *%rax
  800279:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80027c:	48 63 d0             	movslq %eax,%rdx
  80027f:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  800286:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800289:	48 89 ce             	mov    %rcx,%rsi
  80028c:	89 c7                	mov    %eax,%edi
  80028e:	48 b8 7c 25 80 00 00 	movabs $0x80257c,%rax
  800295:	00 00 00 
  800298:	ff d0                	callq  *%rax
  80029a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80029d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002a0:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8002a3:	74 30                	je     8002d5 <umain+0x292>
  8002a5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002a8:	89 c1                	mov    %eax,%ecx
  8002aa:	48 ba 66 43 80 00 00 	movabs $0x804366,%rdx
  8002b1:	00 00 00 
  8002b4:	be 20 00 00 00       	mov    $0x20,%esi
  8002b9:	48 bf bb 42 80 00 00 	movabs $0x8042bb,%rdi
  8002c0:	00 00 00 
  8002c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8002c8:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  8002cf:	00 00 00 
  8002d2:	41 ff d0             	callq  *%r8
  8002d5:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8002dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002df:	ba ff 01 00 00       	mov    $0x1ff,%edx
  8002e4:	48 89 ce             	mov    %rcx,%rsi
  8002e7:	89 c7                	mov    %eax,%edi
  8002e9:	48 b8 31 24 80 00 00 	movabs $0x802431,%rax
  8002f0:	00 00 00 
  8002f3:	ff d0                	callq  *%rax
  8002f5:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8002f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8002fc:	0f 8f 58 ff ff ff    	jg     80025a <umain+0x217>
  800302:	48 bf 40 43 80 00 00 	movabs $0x804340,%rdi
  800309:	00 00 00 
  80030c:	b8 00 00 00 00       	mov    $0x0,%eax
  800311:	48 ba 5a 06 80 00 00 	movabs $0x80065a,%rdx
  800318:	00 00 00 
  80031b:	ff d2                	callq  *%rdx
  80031d:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  800321:	79 30                	jns    800353 <umain+0x310>
  800323:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800326:	89 c1                	mov    %eax,%ecx
  800328:	48 ba 76 43 80 00 00 	movabs $0x804376,%rdx
  80032f:	00 00 00 
  800332:	be 25 00 00 00       	mov    $0x25,%esi
  800337:	48 bf bb 42 80 00 00 	movabs $0x8042bb,%rdi
  80033e:	00 00 00 
  800341:	b8 00 00 00 00       	mov    $0x0,%eax
  800346:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  80034d:	00 00 00 
  800350:	41 ff d0             	callq  *%r8
  800353:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800356:	89 c7                	mov    %eax,%edi
  800358:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  80035f:	00 00 00 
  800362:	ff d0                	callq  *%rax
  800364:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800367:	89 c7                	mov    %eax,%edi
  800369:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  800370:	00 00 00 
  800373:	ff d0                	callq  *%rax
  800375:	90                   	nop
  800376:	c9                   	leaveq 
  800377:	c3                   	retq   

0000000000800378 <libmain>:
  800378:	55                   	push   %rbp
  800379:	48 89 e5             	mov    %rsp,%rbp
  80037c:	48 83 ec 10          	sub    $0x10,%rsp
  800380:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800383:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800387:	48 b8 a1 1a 80 00 00 	movabs $0x801aa1,%rax
  80038e:	00 00 00 
  800391:	ff d0                	callq  *%rax
  800393:	25 ff 03 00 00       	and    $0x3ff,%eax
  800398:	48 98                	cltq   
  80039a:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8003a1:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8003a8:	00 00 00 
  8003ab:	48 01 c2             	add    %rax,%rdx
  8003ae:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8003b5:	00 00 00 
  8003b8:	48 89 10             	mov    %rdx,(%rax)
  8003bb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8003bf:	7e 14                	jle    8003d5 <libmain+0x5d>
  8003c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003c5:	48 8b 10             	mov    (%rax),%rdx
  8003c8:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8003cf:	00 00 00 
  8003d2:	48 89 10             	mov    %rdx,(%rax)
  8003d5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8003dc:	48 89 d6             	mov    %rdx,%rsi
  8003df:	89 c7                	mov    %eax,%edi
  8003e1:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8003e8:	00 00 00 
  8003eb:	ff d0                	callq  *%rax
  8003ed:	48 b8 fc 03 80 00 00 	movabs $0x8003fc,%rax
  8003f4:	00 00 00 
  8003f7:	ff d0                	callq  *%rax
  8003f9:	90                   	nop
  8003fa:	c9                   	leaveq 
  8003fb:	c3                   	retq   

00000000008003fc <exit>:
  8003fc:	55                   	push   %rbp
  8003fd:	48 89 e5             	mov    %rsp,%rbp
  800400:	48 b8 59 22 80 00 00 	movabs $0x802259,%rax
  800407:	00 00 00 
  80040a:	ff d0                	callq  *%rax
  80040c:	bf 00 00 00 00       	mov    $0x0,%edi
  800411:	48 b8 5b 1a 80 00 00 	movabs $0x801a5b,%rax
  800418:	00 00 00 
  80041b:	ff d0                	callq  *%rax
  80041d:	90                   	nop
  80041e:	5d                   	pop    %rbp
  80041f:	c3                   	retq   

0000000000800420 <_panic>:
  800420:	55                   	push   %rbp
  800421:	48 89 e5             	mov    %rsp,%rbp
  800424:	53                   	push   %rbx
  800425:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80042c:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800433:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800439:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800440:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800447:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80044e:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800455:	84 c0                	test   %al,%al
  800457:	74 23                	je     80047c <_panic+0x5c>
  800459:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800460:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800464:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800468:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80046c:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800470:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800474:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800478:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80047c:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800483:	00 00 00 
  800486:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80048d:	00 00 00 
  800490:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800494:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80049b:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8004a2:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8004a9:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8004b0:	00 00 00 
  8004b3:	48 8b 18             	mov    (%rax),%rbx
  8004b6:	48 b8 a1 1a 80 00 00 	movabs $0x801aa1,%rax
  8004bd:	00 00 00 
  8004c0:	ff d0                	callq  *%rax
  8004c2:	89 c6                	mov    %eax,%esi
  8004c4:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8004ca:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8004d1:	41 89 d0             	mov    %edx,%r8d
  8004d4:	48 89 c1             	mov    %rax,%rcx
  8004d7:	48 89 da             	mov    %rbx,%rdx
  8004da:	48 bf 98 43 80 00 00 	movabs $0x804398,%rdi
  8004e1:	00 00 00 
  8004e4:	b8 00 00 00 00       	mov    $0x0,%eax
  8004e9:	49 b9 5a 06 80 00 00 	movabs $0x80065a,%r9
  8004f0:	00 00 00 
  8004f3:	41 ff d1             	callq  *%r9
  8004f6:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8004fd:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800504:	48 89 d6             	mov    %rdx,%rsi
  800507:	48 89 c7             	mov    %rax,%rdi
  80050a:	48 b8 ae 05 80 00 00 	movabs $0x8005ae,%rax
  800511:	00 00 00 
  800514:	ff d0                	callq  *%rax
  800516:	48 bf bb 43 80 00 00 	movabs $0x8043bb,%rdi
  80051d:	00 00 00 
  800520:	b8 00 00 00 00       	mov    $0x0,%eax
  800525:	48 ba 5a 06 80 00 00 	movabs $0x80065a,%rdx
  80052c:	00 00 00 
  80052f:	ff d2                	callq  *%rdx
  800531:	cc                   	int3   
  800532:	eb fd                	jmp    800531 <_panic+0x111>

0000000000800534 <putch>:
  800534:	55                   	push   %rbp
  800535:	48 89 e5             	mov    %rsp,%rbp
  800538:	48 83 ec 10          	sub    $0x10,%rsp
  80053c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80053f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800543:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800547:	8b 00                	mov    (%rax),%eax
  800549:	8d 48 01             	lea    0x1(%rax),%ecx
  80054c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800550:	89 0a                	mov    %ecx,(%rdx)
  800552:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800555:	89 d1                	mov    %edx,%ecx
  800557:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80055b:	48 98                	cltq   
  80055d:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800561:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800565:	8b 00                	mov    (%rax),%eax
  800567:	3d ff 00 00 00       	cmp    $0xff,%eax
  80056c:	75 2c                	jne    80059a <putch+0x66>
  80056e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800572:	8b 00                	mov    (%rax),%eax
  800574:	48 98                	cltq   
  800576:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80057a:	48 83 c2 08          	add    $0x8,%rdx
  80057e:	48 89 c6             	mov    %rax,%rsi
  800581:	48 89 d7             	mov    %rdx,%rdi
  800584:	48 b8 d2 19 80 00 00 	movabs $0x8019d2,%rax
  80058b:	00 00 00 
  80058e:	ff d0                	callq  *%rax
  800590:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800594:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80059a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80059e:	8b 40 04             	mov    0x4(%rax),%eax
  8005a1:	8d 50 01             	lea    0x1(%rax),%edx
  8005a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005a8:	89 50 04             	mov    %edx,0x4(%rax)
  8005ab:	90                   	nop
  8005ac:	c9                   	leaveq 
  8005ad:	c3                   	retq   

00000000008005ae <vcprintf>:
  8005ae:	55                   	push   %rbp
  8005af:	48 89 e5             	mov    %rsp,%rbp
  8005b2:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8005b9:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8005c0:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8005c7:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8005ce:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8005d5:	48 8b 0a             	mov    (%rdx),%rcx
  8005d8:	48 89 08             	mov    %rcx,(%rax)
  8005db:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005df:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005e3:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005e7:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005eb:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8005f2:	00 00 00 
  8005f5:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8005fc:	00 00 00 
  8005ff:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800606:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80060d:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800614:	48 89 c6             	mov    %rax,%rsi
  800617:	48 bf 34 05 80 00 00 	movabs $0x800534,%rdi
  80061e:	00 00 00 
  800621:	48 b8 f8 09 80 00 00 	movabs $0x8009f8,%rax
  800628:	00 00 00 
  80062b:	ff d0                	callq  *%rax
  80062d:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800633:	48 98                	cltq   
  800635:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80063c:	48 83 c2 08          	add    $0x8,%rdx
  800640:	48 89 c6             	mov    %rax,%rsi
  800643:	48 89 d7             	mov    %rdx,%rdi
  800646:	48 b8 d2 19 80 00 00 	movabs $0x8019d2,%rax
  80064d:	00 00 00 
  800650:	ff d0                	callq  *%rax
  800652:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800658:	c9                   	leaveq 
  800659:	c3                   	retq   

000000000080065a <cprintf>:
  80065a:	55                   	push   %rbp
  80065b:	48 89 e5             	mov    %rsp,%rbp
  80065e:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800665:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80066c:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800673:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80067a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800681:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800688:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80068f:	84 c0                	test   %al,%al
  800691:	74 20                	je     8006b3 <cprintf+0x59>
  800693:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800697:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80069b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80069f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8006a3:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8006a7:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8006ab:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8006af:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8006b3:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8006ba:	00 00 00 
  8006bd:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8006c4:	00 00 00 
  8006c7:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8006cb:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8006d2:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8006d9:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8006e0:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8006e7:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8006ee:	48 8b 0a             	mov    (%rdx),%rcx
  8006f1:	48 89 08             	mov    %rcx,(%rax)
  8006f4:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8006f8:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8006fc:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800700:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800704:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80070b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800712:	48 89 d6             	mov    %rdx,%rsi
  800715:	48 89 c7             	mov    %rax,%rdi
  800718:	48 b8 ae 05 80 00 00 	movabs $0x8005ae,%rax
  80071f:	00 00 00 
  800722:	ff d0                	callq  *%rax
  800724:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80072a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800730:	c9                   	leaveq 
  800731:	c3                   	retq   

0000000000800732 <printnum>:
  800732:	55                   	push   %rbp
  800733:	48 89 e5             	mov    %rsp,%rbp
  800736:	48 83 ec 30          	sub    $0x30,%rsp
  80073a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80073e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800742:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800746:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  800749:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  80074d:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800751:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800754:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800758:	77 54                	ja     8007ae <printnum+0x7c>
  80075a:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80075d:	8d 78 ff             	lea    -0x1(%rax),%edi
  800760:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800763:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800767:	ba 00 00 00 00       	mov    $0x0,%edx
  80076c:	48 f7 f6             	div    %rsi
  80076f:	49 89 c2             	mov    %rax,%r10
  800772:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800775:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800778:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80077c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800780:	41 89 c9             	mov    %ecx,%r9d
  800783:	41 89 f8             	mov    %edi,%r8d
  800786:	89 d1                	mov    %edx,%ecx
  800788:	4c 89 d2             	mov    %r10,%rdx
  80078b:	48 89 c7             	mov    %rax,%rdi
  80078e:	48 b8 32 07 80 00 00 	movabs $0x800732,%rax
  800795:	00 00 00 
  800798:	ff d0                	callq  *%rax
  80079a:	eb 1c                	jmp    8007b8 <printnum+0x86>
  80079c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8007a0:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8007a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007a7:	48 89 ce             	mov    %rcx,%rsi
  8007aa:	89 d7                	mov    %edx,%edi
  8007ac:	ff d0                	callq  *%rax
  8007ae:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8007b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8007b6:	7f e4                	jg     80079c <printnum+0x6a>
  8007b8:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8007bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007bf:	ba 00 00 00 00       	mov    $0x0,%edx
  8007c4:	48 f7 f1             	div    %rcx
  8007c7:	48 b8 b0 45 80 00 00 	movabs $0x8045b0,%rax
  8007ce:	00 00 00 
  8007d1:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8007d5:	0f be d0             	movsbl %al,%edx
  8007d8:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8007dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007e0:	48 89 ce             	mov    %rcx,%rsi
  8007e3:	89 d7                	mov    %edx,%edi
  8007e5:	ff d0                	callq  *%rax
  8007e7:	90                   	nop
  8007e8:	c9                   	leaveq 
  8007e9:	c3                   	retq   

00000000008007ea <getuint>:
  8007ea:	55                   	push   %rbp
  8007eb:	48 89 e5             	mov    %rsp,%rbp
  8007ee:	48 83 ec 20          	sub    $0x20,%rsp
  8007f2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007f6:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007f9:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007fd:	7e 4f                	jle    80084e <getuint+0x64>
  8007ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800803:	8b 00                	mov    (%rax),%eax
  800805:	83 f8 30             	cmp    $0x30,%eax
  800808:	73 24                	jae    80082e <getuint+0x44>
  80080a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80080e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800812:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800816:	8b 00                	mov    (%rax),%eax
  800818:	89 c0                	mov    %eax,%eax
  80081a:	48 01 d0             	add    %rdx,%rax
  80081d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800821:	8b 12                	mov    (%rdx),%edx
  800823:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800826:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80082a:	89 0a                	mov    %ecx,(%rdx)
  80082c:	eb 14                	jmp    800842 <getuint+0x58>
  80082e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800832:	48 8b 40 08          	mov    0x8(%rax),%rax
  800836:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80083a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80083e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800842:	48 8b 00             	mov    (%rax),%rax
  800845:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800849:	e9 9d 00 00 00       	jmpq   8008eb <getuint+0x101>
  80084e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800852:	74 4c                	je     8008a0 <getuint+0xb6>
  800854:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800858:	8b 00                	mov    (%rax),%eax
  80085a:	83 f8 30             	cmp    $0x30,%eax
  80085d:	73 24                	jae    800883 <getuint+0x99>
  80085f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800863:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800867:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80086b:	8b 00                	mov    (%rax),%eax
  80086d:	89 c0                	mov    %eax,%eax
  80086f:	48 01 d0             	add    %rdx,%rax
  800872:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800876:	8b 12                	mov    (%rdx),%edx
  800878:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80087b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80087f:	89 0a                	mov    %ecx,(%rdx)
  800881:	eb 14                	jmp    800897 <getuint+0xad>
  800883:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800887:	48 8b 40 08          	mov    0x8(%rax),%rax
  80088b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80088f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800893:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800897:	48 8b 00             	mov    (%rax),%rax
  80089a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80089e:	eb 4b                	jmp    8008eb <getuint+0x101>
  8008a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a4:	8b 00                	mov    (%rax),%eax
  8008a6:	83 f8 30             	cmp    $0x30,%eax
  8008a9:	73 24                	jae    8008cf <getuint+0xe5>
  8008ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008af:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b7:	8b 00                	mov    (%rax),%eax
  8008b9:	89 c0                	mov    %eax,%eax
  8008bb:	48 01 d0             	add    %rdx,%rax
  8008be:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008c2:	8b 12                	mov    (%rdx),%edx
  8008c4:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008c7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008cb:	89 0a                	mov    %ecx,(%rdx)
  8008cd:	eb 14                	jmp    8008e3 <getuint+0xf9>
  8008cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008d3:	48 8b 40 08          	mov    0x8(%rax),%rax
  8008d7:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8008db:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008df:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008e3:	8b 00                	mov    (%rax),%eax
  8008e5:	89 c0                	mov    %eax,%eax
  8008e7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008ef:	c9                   	leaveq 
  8008f0:	c3                   	retq   

00000000008008f1 <getint>:
  8008f1:	55                   	push   %rbp
  8008f2:	48 89 e5             	mov    %rsp,%rbp
  8008f5:	48 83 ec 20          	sub    $0x20,%rsp
  8008f9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8008fd:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800900:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800904:	7e 4f                	jle    800955 <getint+0x64>
  800906:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80090a:	8b 00                	mov    (%rax),%eax
  80090c:	83 f8 30             	cmp    $0x30,%eax
  80090f:	73 24                	jae    800935 <getint+0x44>
  800911:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800915:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800919:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80091d:	8b 00                	mov    (%rax),%eax
  80091f:	89 c0                	mov    %eax,%eax
  800921:	48 01 d0             	add    %rdx,%rax
  800924:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800928:	8b 12                	mov    (%rdx),%edx
  80092a:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80092d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800931:	89 0a                	mov    %ecx,(%rdx)
  800933:	eb 14                	jmp    800949 <getint+0x58>
  800935:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800939:	48 8b 40 08          	mov    0x8(%rax),%rax
  80093d:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800941:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800945:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800949:	48 8b 00             	mov    (%rax),%rax
  80094c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800950:	e9 9d 00 00 00       	jmpq   8009f2 <getint+0x101>
  800955:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800959:	74 4c                	je     8009a7 <getint+0xb6>
  80095b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80095f:	8b 00                	mov    (%rax),%eax
  800961:	83 f8 30             	cmp    $0x30,%eax
  800964:	73 24                	jae    80098a <getint+0x99>
  800966:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80096a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80096e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800972:	8b 00                	mov    (%rax),%eax
  800974:	89 c0                	mov    %eax,%eax
  800976:	48 01 d0             	add    %rdx,%rax
  800979:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80097d:	8b 12                	mov    (%rdx),%edx
  80097f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800982:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800986:	89 0a                	mov    %ecx,(%rdx)
  800988:	eb 14                	jmp    80099e <getint+0xad>
  80098a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80098e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800992:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800996:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80099a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80099e:	48 8b 00             	mov    (%rax),%rax
  8009a1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009a5:	eb 4b                	jmp    8009f2 <getint+0x101>
  8009a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009ab:	8b 00                	mov    (%rax),%eax
  8009ad:	83 f8 30             	cmp    $0x30,%eax
  8009b0:	73 24                	jae    8009d6 <getint+0xe5>
  8009b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b6:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009be:	8b 00                	mov    (%rax),%eax
  8009c0:	89 c0                	mov    %eax,%eax
  8009c2:	48 01 d0             	add    %rdx,%rax
  8009c5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009c9:	8b 12                	mov    (%rdx),%edx
  8009cb:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009ce:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009d2:	89 0a                	mov    %ecx,(%rdx)
  8009d4:	eb 14                	jmp    8009ea <getint+0xf9>
  8009d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009da:	48 8b 40 08          	mov    0x8(%rax),%rax
  8009de:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8009e2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009e6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009ea:	8b 00                	mov    (%rax),%eax
  8009ec:	48 98                	cltq   
  8009ee:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8009f6:	c9                   	leaveq 
  8009f7:	c3                   	retq   

00000000008009f8 <vprintfmt>:
  8009f8:	55                   	push   %rbp
  8009f9:	48 89 e5             	mov    %rsp,%rbp
  8009fc:	41 54                	push   %r12
  8009fe:	53                   	push   %rbx
  8009ff:	48 83 ec 60          	sub    $0x60,%rsp
  800a03:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800a07:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800a0b:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a0f:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800a13:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a17:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800a1b:	48 8b 0a             	mov    (%rdx),%rcx
  800a1e:	48 89 08             	mov    %rcx,(%rax)
  800a21:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800a25:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800a29:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800a2d:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800a31:	eb 17                	jmp    800a4a <vprintfmt+0x52>
  800a33:	85 db                	test   %ebx,%ebx
  800a35:	0f 84 b9 04 00 00    	je     800ef4 <vprintfmt+0x4fc>
  800a3b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a3f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a43:	48 89 d6             	mov    %rdx,%rsi
  800a46:	89 df                	mov    %ebx,%edi
  800a48:	ff d0                	callq  *%rax
  800a4a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a4e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a52:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a56:	0f b6 00             	movzbl (%rax),%eax
  800a59:	0f b6 d8             	movzbl %al,%ebx
  800a5c:	83 fb 25             	cmp    $0x25,%ebx
  800a5f:	75 d2                	jne    800a33 <vprintfmt+0x3b>
  800a61:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800a65:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800a6c:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a73:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800a7a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800a81:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800a85:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800a89:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800a8d:	0f b6 00             	movzbl (%rax),%eax
  800a90:	0f b6 d8             	movzbl %al,%ebx
  800a93:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800a96:	83 f8 55             	cmp    $0x55,%eax
  800a99:	0f 87 22 04 00 00    	ja     800ec1 <vprintfmt+0x4c9>
  800a9f:	89 c0                	mov    %eax,%eax
  800aa1:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800aa8:	00 
  800aa9:	48 b8 d8 45 80 00 00 	movabs $0x8045d8,%rax
  800ab0:	00 00 00 
  800ab3:	48 01 d0             	add    %rdx,%rax
  800ab6:	48 8b 00             	mov    (%rax),%rax
  800ab9:	ff e0                	jmpq   *%rax
  800abb:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800abf:	eb c0                	jmp    800a81 <vprintfmt+0x89>
  800ac1:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800ac5:	eb ba                	jmp    800a81 <vprintfmt+0x89>
  800ac7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800ace:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800ad1:	89 d0                	mov    %edx,%eax
  800ad3:	c1 e0 02             	shl    $0x2,%eax
  800ad6:	01 d0                	add    %edx,%eax
  800ad8:	01 c0                	add    %eax,%eax
  800ada:	01 d8                	add    %ebx,%eax
  800adc:	83 e8 30             	sub    $0x30,%eax
  800adf:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800ae2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800ae6:	0f b6 00             	movzbl (%rax),%eax
  800ae9:	0f be d8             	movsbl %al,%ebx
  800aec:	83 fb 2f             	cmp    $0x2f,%ebx
  800aef:	7e 60                	jle    800b51 <vprintfmt+0x159>
  800af1:	83 fb 39             	cmp    $0x39,%ebx
  800af4:	7f 5b                	jg     800b51 <vprintfmt+0x159>
  800af6:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800afb:	eb d1                	jmp    800ace <vprintfmt+0xd6>
  800afd:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b00:	83 f8 30             	cmp    $0x30,%eax
  800b03:	73 17                	jae    800b1c <vprintfmt+0x124>
  800b05:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b09:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b0c:	89 d2                	mov    %edx,%edx
  800b0e:	48 01 d0             	add    %rdx,%rax
  800b11:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b14:	83 c2 08             	add    $0x8,%edx
  800b17:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b1a:	eb 0c                	jmp    800b28 <vprintfmt+0x130>
  800b1c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b20:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b24:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b28:	8b 00                	mov    (%rax),%eax
  800b2a:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b2d:	eb 23                	jmp    800b52 <vprintfmt+0x15a>
  800b2f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b33:	0f 89 48 ff ff ff    	jns    800a81 <vprintfmt+0x89>
  800b39:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800b40:	e9 3c ff ff ff       	jmpq   800a81 <vprintfmt+0x89>
  800b45:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800b4c:	e9 30 ff ff ff       	jmpq   800a81 <vprintfmt+0x89>
  800b51:	90                   	nop
  800b52:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b56:	0f 89 25 ff ff ff    	jns    800a81 <vprintfmt+0x89>
  800b5c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b5f:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800b62:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b69:	e9 13 ff ff ff       	jmpq   800a81 <vprintfmt+0x89>
  800b6e:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800b72:	e9 0a ff ff ff       	jmpq   800a81 <vprintfmt+0x89>
  800b77:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b7a:	83 f8 30             	cmp    $0x30,%eax
  800b7d:	73 17                	jae    800b96 <vprintfmt+0x19e>
  800b7f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b83:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b86:	89 d2                	mov    %edx,%edx
  800b88:	48 01 d0             	add    %rdx,%rax
  800b8b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b8e:	83 c2 08             	add    $0x8,%edx
  800b91:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b94:	eb 0c                	jmp    800ba2 <vprintfmt+0x1aa>
  800b96:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b9a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b9e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ba2:	8b 10                	mov    (%rax),%edx
  800ba4:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800ba8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bac:	48 89 ce             	mov    %rcx,%rsi
  800baf:	89 d7                	mov    %edx,%edi
  800bb1:	ff d0                	callq  *%rax
  800bb3:	e9 37 03 00 00       	jmpq   800eef <vprintfmt+0x4f7>
  800bb8:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800bbb:	83 f8 30             	cmp    $0x30,%eax
  800bbe:	73 17                	jae    800bd7 <vprintfmt+0x1df>
  800bc0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800bc4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bc7:	89 d2                	mov    %edx,%edx
  800bc9:	48 01 d0             	add    %rdx,%rax
  800bcc:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bcf:	83 c2 08             	add    $0x8,%edx
  800bd2:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bd5:	eb 0c                	jmp    800be3 <vprintfmt+0x1eb>
  800bd7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800bdb:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800bdf:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800be3:	8b 18                	mov    (%rax),%ebx
  800be5:	85 db                	test   %ebx,%ebx
  800be7:	79 02                	jns    800beb <vprintfmt+0x1f3>
  800be9:	f7 db                	neg    %ebx
  800beb:	83 fb 15             	cmp    $0x15,%ebx
  800bee:	7f 16                	jg     800c06 <vprintfmt+0x20e>
  800bf0:	48 b8 00 45 80 00 00 	movabs $0x804500,%rax
  800bf7:	00 00 00 
  800bfa:	48 63 d3             	movslq %ebx,%rdx
  800bfd:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800c01:	4d 85 e4             	test   %r12,%r12
  800c04:	75 2e                	jne    800c34 <vprintfmt+0x23c>
  800c06:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c0a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c0e:	89 d9                	mov    %ebx,%ecx
  800c10:	48 ba c1 45 80 00 00 	movabs $0x8045c1,%rdx
  800c17:	00 00 00 
  800c1a:	48 89 c7             	mov    %rax,%rdi
  800c1d:	b8 00 00 00 00       	mov    $0x0,%eax
  800c22:	49 b8 fe 0e 80 00 00 	movabs $0x800efe,%r8
  800c29:	00 00 00 
  800c2c:	41 ff d0             	callq  *%r8
  800c2f:	e9 bb 02 00 00       	jmpq   800eef <vprintfmt+0x4f7>
  800c34:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800c38:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c3c:	4c 89 e1             	mov    %r12,%rcx
  800c3f:	48 ba ca 45 80 00 00 	movabs $0x8045ca,%rdx
  800c46:	00 00 00 
  800c49:	48 89 c7             	mov    %rax,%rdi
  800c4c:	b8 00 00 00 00       	mov    $0x0,%eax
  800c51:	49 b8 fe 0e 80 00 00 	movabs $0x800efe,%r8
  800c58:	00 00 00 
  800c5b:	41 ff d0             	callq  *%r8
  800c5e:	e9 8c 02 00 00       	jmpq   800eef <vprintfmt+0x4f7>
  800c63:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c66:	83 f8 30             	cmp    $0x30,%eax
  800c69:	73 17                	jae    800c82 <vprintfmt+0x28a>
  800c6b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c6f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c72:	89 d2                	mov    %edx,%edx
  800c74:	48 01 d0             	add    %rdx,%rax
  800c77:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c7a:	83 c2 08             	add    $0x8,%edx
  800c7d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c80:	eb 0c                	jmp    800c8e <vprintfmt+0x296>
  800c82:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c86:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c8a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c8e:	4c 8b 20             	mov    (%rax),%r12
  800c91:	4d 85 e4             	test   %r12,%r12
  800c94:	75 0a                	jne    800ca0 <vprintfmt+0x2a8>
  800c96:	49 bc cd 45 80 00 00 	movabs $0x8045cd,%r12
  800c9d:	00 00 00 
  800ca0:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ca4:	7e 78                	jle    800d1e <vprintfmt+0x326>
  800ca6:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800caa:	74 72                	je     800d1e <vprintfmt+0x326>
  800cac:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800caf:	48 98                	cltq   
  800cb1:	48 89 c6             	mov    %rax,%rsi
  800cb4:	4c 89 e7             	mov    %r12,%rdi
  800cb7:	48 b8 ac 11 80 00 00 	movabs $0x8011ac,%rax
  800cbe:	00 00 00 
  800cc1:	ff d0                	callq  *%rax
  800cc3:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800cc6:	eb 17                	jmp    800cdf <vprintfmt+0x2e7>
  800cc8:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800ccc:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800cd0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cd4:	48 89 ce             	mov    %rcx,%rsi
  800cd7:	89 d7                	mov    %edx,%edi
  800cd9:	ff d0                	callq  *%rax
  800cdb:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800cdf:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800ce3:	7f e3                	jg     800cc8 <vprintfmt+0x2d0>
  800ce5:	eb 37                	jmp    800d1e <vprintfmt+0x326>
  800ce7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800ceb:	74 1e                	je     800d0b <vprintfmt+0x313>
  800ced:	83 fb 1f             	cmp    $0x1f,%ebx
  800cf0:	7e 05                	jle    800cf7 <vprintfmt+0x2ff>
  800cf2:	83 fb 7e             	cmp    $0x7e,%ebx
  800cf5:	7e 14                	jle    800d0b <vprintfmt+0x313>
  800cf7:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cfb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cff:	48 89 d6             	mov    %rdx,%rsi
  800d02:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800d07:	ff d0                	callq  *%rax
  800d09:	eb 0f                	jmp    800d1a <vprintfmt+0x322>
  800d0b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d0f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d13:	48 89 d6             	mov    %rdx,%rsi
  800d16:	89 df                	mov    %ebx,%edi
  800d18:	ff d0                	callq  *%rax
  800d1a:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d1e:	4c 89 e0             	mov    %r12,%rax
  800d21:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800d25:	0f b6 00             	movzbl (%rax),%eax
  800d28:	0f be d8             	movsbl %al,%ebx
  800d2b:	85 db                	test   %ebx,%ebx
  800d2d:	74 28                	je     800d57 <vprintfmt+0x35f>
  800d2f:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d33:	78 b2                	js     800ce7 <vprintfmt+0x2ef>
  800d35:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800d39:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800d3d:	79 a8                	jns    800ce7 <vprintfmt+0x2ef>
  800d3f:	eb 16                	jmp    800d57 <vprintfmt+0x35f>
  800d41:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d45:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d49:	48 89 d6             	mov    %rdx,%rsi
  800d4c:	bf 20 00 00 00       	mov    $0x20,%edi
  800d51:	ff d0                	callq  *%rax
  800d53:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d57:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d5b:	7f e4                	jg     800d41 <vprintfmt+0x349>
  800d5d:	e9 8d 01 00 00       	jmpq   800eef <vprintfmt+0x4f7>
  800d62:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d66:	be 03 00 00 00       	mov    $0x3,%esi
  800d6b:	48 89 c7             	mov    %rax,%rdi
  800d6e:	48 b8 f1 08 80 00 00 	movabs $0x8008f1,%rax
  800d75:	00 00 00 
  800d78:	ff d0                	callq  *%rax
  800d7a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d7e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d82:	48 85 c0             	test   %rax,%rax
  800d85:	79 1d                	jns    800da4 <vprintfmt+0x3ac>
  800d87:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d8b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d8f:	48 89 d6             	mov    %rdx,%rsi
  800d92:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800d97:	ff d0                	callq  *%rax
  800d99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d9d:	48 f7 d8             	neg    %rax
  800da0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800da4:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800dab:	e9 d2 00 00 00       	jmpq   800e82 <vprintfmt+0x48a>
  800db0:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800db4:	be 03 00 00 00       	mov    $0x3,%esi
  800db9:	48 89 c7             	mov    %rax,%rdi
  800dbc:	48 b8 ea 07 80 00 00 	movabs $0x8007ea,%rax
  800dc3:	00 00 00 
  800dc6:	ff d0                	callq  *%rax
  800dc8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800dcc:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800dd3:	e9 aa 00 00 00       	jmpq   800e82 <vprintfmt+0x48a>
  800dd8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ddc:	be 03 00 00 00       	mov    $0x3,%esi
  800de1:	48 89 c7             	mov    %rax,%rdi
  800de4:	48 b8 ea 07 80 00 00 	movabs $0x8007ea,%rax
  800deb:	00 00 00 
  800dee:	ff d0                	callq  *%rax
  800df0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800df4:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800dfb:	e9 82 00 00 00       	jmpq   800e82 <vprintfmt+0x48a>
  800e00:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e04:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e08:	48 89 d6             	mov    %rdx,%rsi
  800e0b:	bf 30 00 00 00       	mov    $0x30,%edi
  800e10:	ff d0                	callq  *%rax
  800e12:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e16:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e1a:	48 89 d6             	mov    %rdx,%rsi
  800e1d:	bf 78 00 00 00       	mov    $0x78,%edi
  800e22:	ff d0                	callq  *%rax
  800e24:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e27:	83 f8 30             	cmp    $0x30,%eax
  800e2a:	73 17                	jae    800e43 <vprintfmt+0x44b>
  800e2c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e30:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e33:	89 d2                	mov    %edx,%edx
  800e35:	48 01 d0             	add    %rdx,%rax
  800e38:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e3b:	83 c2 08             	add    $0x8,%edx
  800e3e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e41:	eb 0c                	jmp    800e4f <vprintfmt+0x457>
  800e43:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800e47:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800e4b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e4f:	48 8b 00             	mov    (%rax),%rax
  800e52:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e56:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e5d:	eb 23                	jmp    800e82 <vprintfmt+0x48a>
  800e5f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e63:	be 03 00 00 00       	mov    $0x3,%esi
  800e68:	48 89 c7             	mov    %rax,%rdi
  800e6b:	48 b8 ea 07 80 00 00 	movabs $0x8007ea,%rax
  800e72:	00 00 00 
  800e75:	ff d0                	callq  *%rax
  800e77:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e7b:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800e82:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800e87:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800e8a:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800e8d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800e91:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800e95:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e99:	45 89 c1             	mov    %r8d,%r9d
  800e9c:	41 89 f8             	mov    %edi,%r8d
  800e9f:	48 89 c7             	mov    %rax,%rdi
  800ea2:	48 b8 32 07 80 00 00 	movabs $0x800732,%rax
  800ea9:	00 00 00 
  800eac:	ff d0                	callq  *%rax
  800eae:	eb 3f                	jmp    800eef <vprintfmt+0x4f7>
  800eb0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800eb4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800eb8:	48 89 d6             	mov    %rdx,%rsi
  800ebb:	89 df                	mov    %ebx,%edi
  800ebd:	ff d0                	callq  *%rax
  800ebf:	eb 2e                	jmp    800eef <vprintfmt+0x4f7>
  800ec1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ec5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ec9:	48 89 d6             	mov    %rdx,%rsi
  800ecc:	bf 25 00 00 00       	mov    $0x25,%edi
  800ed1:	ff d0                	callq  *%rax
  800ed3:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800ed8:	eb 05                	jmp    800edf <vprintfmt+0x4e7>
  800eda:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800edf:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800ee3:	48 83 e8 01          	sub    $0x1,%rax
  800ee7:	0f b6 00             	movzbl (%rax),%eax
  800eea:	3c 25                	cmp    $0x25,%al
  800eec:	75 ec                	jne    800eda <vprintfmt+0x4e2>
  800eee:	90                   	nop
  800eef:	e9 3d fb ff ff       	jmpq   800a31 <vprintfmt+0x39>
  800ef4:	90                   	nop
  800ef5:	48 83 c4 60          	add    $0x60,%rsp
  800ef9:	5b                   	pop    %rbx
  800efa:	41 5c                	pop    %r12
  800efc:	5d                   	pop    %rbp
  800efd:	c3                   	retq   

0000000000800efe <printfmt>:
  800efe:	55                   	push   %rbp
  800eff:	48 89 e5             	mov    %rsp,%rbp
  800f02:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800f09:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800f10:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800f17:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800f1e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f25:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f2c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f33:	84 c0                	test   %al,%al
  800f35:	74 20                	je     800f57 <printfmt+0x59>
  800f37:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f3b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f3f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f43:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f47:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f4b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f4f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f53:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f57:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800f5e:	00 00 00 
  800f61:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800f68:	00 00 00 
  800f6b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f6f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f76:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f7d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800f84:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800f8b:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800f92:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800f99:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800fa0:	48 89 c7             	mov    %rax,%rdi
  800fa3:	48 b8 f8 09 80 00 00 	movabs $0x8009f8,%rax
  800faa:	00 00 00 
  800fad:	ff d0                	callq  *%rax
  800faf:	90                   	nop
  800fb0:	c9                   	leaveq 
  800fb1:	c3                   	retq   

0000000000800fb2 <sprintputch>:
  800fb2:	55                   	push   %rbp
  800fb3:	48 89 e5             	mov    %rsp,%rbp
  800fb6:	48 83 ec 10          	sub    $0x10,%rsp
  800fba:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800fbd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800fc1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fc5:	8b 40 10             	mov    0x10(%rax),%eax
  800fc8:	8d 50 01             	lea    0x1(%rax),%edx
  800fcb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fcf:	89 50 10             	mov    %edx,0x10(%rax)
  800fd2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fd6:	48 8b 10             	mov    (%rax),%rdx
  800fd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fdd:	48 8b 40 08          	mov    0x8(%rax),%rax
  800fe1:	48 39 c2             	cmp    %rax,%rdx
  800fe4:	73 17                	jae    800ffd <sprintputch+0x4b>
  800fe6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fea:	48 8b 00             	mov    (%rax),%rax
  800fed:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800ff1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800ff5:	48 89 0a             	mov    %rcx,(%rdx)
  800ff8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800ffb:	88 10                	mov    %dl,(%rax)
  800ffd:	90                   	nop
  800ffe:	c9                   	leaveq 
  800fff:	c3                   	retq   

0000000000801000 <vsnprintf>:
  801000:	55                   	push   %rbp
  801001:	48 89 e5             	mov    %rsp,%rbp
  801004:	48 83 ec 50          	sub    $0x50,%rsp
  801008:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80100c:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  80100f:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801013:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801017:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80101b:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  80101f:	48 8b 0a             	mov    (%rdx),%rcx
  801022:	48 89 08             	mov    %rcx,(%rax)
  801025:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801029:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80102d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801031:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801035:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801039:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80103d:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801040:	48 98                	cltq   
  801042:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801046:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80104a:	48 01 d0             	add    %rdx,%rax
  80104d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801051:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  801058:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80105d:	74 06                	je     801065 <vsnprintf+0x65>
  80105f:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801063:	7f 07                	jg     80106c <vsnprintf+0x6c>
  801065:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80106a:	eb 2f                	jmp    80109b <vsnprintf+0x9b>
  80106c:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801070:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801074:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801078:	48 89 c6             	mov    %rax,%rsi
  80107b:	48 bf b2 0f 80 00 00 	movabs $0x800fb2,%rdi
  801082:	00 00 00 
  801085:	48 b8 f8 09 80 00 00 	movabs $0x8009f8,%rax
  80108c:	00 00 00 
  80108f:	ff d0                	callq  *%rax
  801091:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801095:	c6 00 00             	movb   $0x0,(%rax)
  801098:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80109b:	c9                   	leaveq 
  80109c:	c3                   	retq   

000000000080109d <snprintf>:
  80109d:	55                   	push   %rbp
  80109e:	48 89 e5             	mov    %rsp,%rbp
  8010a1:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8010a8:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8010af:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8010b5:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8010bc:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8010c3:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8010ca:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8010d1:	84 c0                	test   %al,%al
  8010d3:	74 20                	je     8010f5 <snprintf+0x58>
  8010d5:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8010d9:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8010dd:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8010e1:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8010e5:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8010e9:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8010ed:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8010f1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8010f5:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8010fc:	00 00 00 
  8010ff:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801106:	00 00 00 
  801109:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80110d:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801114:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80111b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801122:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  801129:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801130:	48 8b 0a             	mov    (%rdx),%rcx
  801133:	48 89 08             	mov    %rcx,(%rax)
  801136:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80113a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80113e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801142:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801146:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80114d:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801154:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80115a:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801161:	48 89 c7             	mov    %rax,%rdi
  801164:	48 b8 00 10 80 00 00 	movabs $0x801000,%rax
  80116b:	00 00 00 
  80116e:	ff d0                	callq  *%rax
  801170:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801176:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80117c:	c9                   	leaveq 
  80117d:	c3                   	retq   

000000000080117e <strlen>:
  80117e:	55                   	push   %rbp
  80117f:	48 89 e5             	mov    %rsp,%rbp
  801182:	48 83 ec 18          	sub    $0x18,%rsp
  801186:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80118a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801191:	eb 09                	jmp    80119c <strlen+0x1e>
  801193:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801197:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80119c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011a0:	0f b6 00             	movzbl (%rax),%eax
  8011a3:	84 c0                	test   %al,%al
  8011a5:	75 ec                	jne    801193 <strlen+0x15>
  8011a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011aa:	c9                   	leaveq 
  8011ab:	c3                   	retq   

00000000008011ac <strnlen>:
  8011ac:	55                   	push   %rbp
  8011ad:	48 89 e5             	mov    %rsp,%rbp
  8011b0:	48 83 ec 20          	sub    $0x20,%rsp
  8011b4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011b8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8011c3:	eb 0e                	jmp    8011d3 <strnlen+0x27>
  8011c5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8011c9:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8011ce:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8011d3:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8011d8:	74 0b                	je     8011e5 <strnlen+0x39>
  8011da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011de:	0f b6 00             	movzbl (%rax),%eax
  8011e1:	84 c0                	test   %al,%al
  8011e3:	75 e0                	jne    8011c5 <strnlen+0x19>
  8011e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8011e8:	c9                   	leaveq 
  8011e9:	c3                   	retq   

00000000008011ea <strcpy>:
  8011ea:	55                   	push   %rbp
  8011eb:	48 89 e5             	mov    %rsp,%rbp
  8011ee:	48 83 ec 20          	sub    $0x20,%rsp
  8011f2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011f6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011fe:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801202:	90                   	nop
  801203:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801207:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80120b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80120f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801213:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801217:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80121b:	0f b6 12             	movzbl (%rdx),%edx
  80121e:	88 10                	mov    %dl,(%rax)
  801220:	0f b6 00             	movzbl (%rax),%eax
  801223:	84 c0                	test   %al,%al
  801225:	75 dc                	jne    801203 <strcpy+0x19>
  801227:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80122b:	c9                   	leaveq 
  80122c:	c3                   	retq   

000000000080122d <strcat>:
  80122d:	55                   	push   %rbp
  80122e:	48 89 e5             	mov    %rsp,%rbp
  801231:	48 83 ec 20          	sub    $0x20,%rsp
  801235:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801239:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80123d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801241:	48 89 c7             	mov    %rax,%rdi
  801244:	48 b8 7e 11 80 00 00 	movabs $0x80117e,%rax
  80124b:	00 00 00 
  80124e:	ff d0                	callq  *%rax
  801250:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801253:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801256:	48 63 d0             	movslq %eax,%rdx
  801259:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80125d:	48 01 c2             	add    %rax,%rdx
  801260:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801264:	48 89 c6             	mov    %rax,%rsi
  801267:	48 89 d7             	mov    %rdx,%rdi
  80126a:	48 b8 ea 11 80 00 00 	movabs $0x8011ea,%rax
  801271:	00 00 00 
  801274:	ff d0                	callq  *%rax
  801276:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80127a:	c9                   	leaveq 
  80127b:	c3                   	retq   

000000000080127c <strncpy>:
  80127c:	55                   	push   %rbp
  80127d:	48 89 e5             	mov    %rsp,%rbp
  801280:	48 83 ec 28          	sub    $0x28,%rsp
  801284:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801288:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80128c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801290:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801294:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801298:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80129f:	00 
  8012a0:	eb 2a                	jmp    8012cc <strncpy+0x50>
  8012a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012a6:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012aa:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012ae:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012b2:	0f b6 12             	movzbl (%rdx),%edx
  8012b5:	88 10                	mov    %dl,(%rax)
  8012b7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8012bb:	0f b6 00             	movzbl (%rax),%eax
  8012be:	84 c0                	test   %al,%al
  8012c0:	74 05                	je     8012c7 <strncpy+0x4b>
  8012c2:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8012c7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012cc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012d0:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8012d4:	72 cc                	jb     8012a2 <strncpy+0x26>
  8012d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012da:	c9                   	leaveq 
  8012db:	c3                   	retq   

00000000008012dc <strlcpy>:
  8012dc:	55                   	push   %rbp
  8012dd:	48 89 e5             	mov    %rsp,%rbp
  8012e0:	48 83 ec 28          	sub    $0x28,%rsp
  8012e4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012e8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012ec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012f4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012f8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8012fd:	74 3d                	je     80133c <strlcpy+0x60>
  8012ff:	eb 1d                	jmp    80131e <strlcpy+0x42>
  801301:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801305:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801309:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80130d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801311:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801315:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801319:	0f b6 12             	movzbl (%rdx),%edx
  80131c:	88 10                	mov    %dl,(%rax)
  80131e:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801323:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801328:	74 0b                	je     801335 <strlcpy+0x59>
  80132a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80132e:	0f b6 00             	movzbl (%rax),%eax
  801331:	84 c0                	test   %al,%al
  801333:	75 cc                	jne    801301 <strlcpy+0x25>
  801335:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801339:	c6 00 00             	movb   $0x0,(%rax)
  80133c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801340:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801344:	48 29 c2             	sub    %rax,%rdx
  801347:	48 89 d0             	mov    %rdx,%rax
  80134a:	c9                   	leaveq 
  80134b:	c3                   	retq   

000000000080134c <strcmp>:
  80134c:	55                   	push   %rbp
  80134d:	48 89 e5             	mov    %rsp,%rbp
  801350:	48 83 ec 10          	sub    $0x10,%rsp
  801354:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801358:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80135c:	eb 0a                	jmp    801368 <strcmp+0x1c>
  80135e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801363:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801368:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80136c:	0f b6 00             	movzbl (%rax),%eax
  80136f:	84 c0                	test   %al,%al
  801371:	74 12                	je     801385 <strcmp+0x39>
  801373:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801377:	0f b6 10             	movzbl (%rax),%edx
  80137a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80137e:	0f b6 00             	movzbl (%rax),%eax
  801381:	38 c2                	cmp    %al,%dl
  801383:	74 d9                	je     80135e <strcmp+0x12>
  801385:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801389:	0f b6 00             	movzbl (%rax),%eax
  80138c:	0f b6 d0             	movzbl %al,%edx
  80138f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801393:	0f b6 00             	movzbl (%rax),%eax
  801396:	0f b6 c0             	movzbl %al,%eax
  801399:	29 c2                	sub    %eax,%edx
  80139b:	89 d0                	mov    %edx,%eax
  80139d:	c9                   	leaveq 
  80139e:	c3                   	retq   

000000000080139f <strncmp>:
  80139f:	55                   	push   %rbp
  8013a0:	48 89 e5             	mov    %rsp,%rbp
  8013a3:	48 83 ec 18          	sub    $0x18,%rsp
  8013a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8013af:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013b3:	eb 0f                	jmp    8013c4 <strncmp+0x25>
  8013b5:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8013ba:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013bf:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8013c4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013c9:	74 1d                	je     8013e8 <strncmp+0x49>
  8013cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013cf:	0f b6 00             	movzbl (%rax),%eax
  8013d2:	84 c0                	test   %al,%al
  8013d4:	74 12                	je     8013e8 <strncmp+0x49>
  8013d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013da:	0f b6 10             	movzbl (%rax),%edx
  8013dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013e1:	0f b6 00             	movzbl (%rax),%eax
  8013e4:	38 c2                	cmp    %al,%dl
  8013e6:	74 cd                	je     8013b5 <strncmp+0x16>
  8013e8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8013ed:	75 07                	jne    8013f6 <strncmp+0x57>
  8013ef:	b8 00 00 00 00       	mov    $0x0,%eax
  8013f4:	eb 18                	jmp    80140e <strncmp+0x6f>
  8013f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013fa:	0f b6 00             	movzbl (%rax),%eax
  8013fd:	0f b6 d0             	movzbl %al,%edx
  801400:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801404:	0f b6 00             	movzbl (%rax),%eax
  801407:	0f b6 c0             	movzbl %al,%eax
  80140a:	29 c2                	sub    %eax,%edx
  80140c:	89 d0                	mov    %edx,%eax
  80140e:	c9                   	leaveq 
  80140f:	c3                   	retq   

0000000000801410 <strchr>:
  801410:	55                   	push   %rbp
  801411:	48 89 e5             	mov    %rsp,%rbp
  801414:	48 83 ec 10          	sub    $0x10,%rsp
  801418:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80141c:	89 f0                	mov    %esi,%eax
  80141e:	88 45 f4             	mov    %al,-0xc(%rbp)
  801421:	eb 17                	jmp    80143a <strchr+0x2a>
  801423:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801427:	0f b6 00             	movzbl (%rax),%eax
  80142a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80142d:	75 06                	jne    801435 <strchr+0x25>
  80142f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801433:	eb 15                	jmp    80144a <strchr+0x3a>
  801435:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80143a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80143e:	0f b6 00             	movzbl (%rax),%eax
  801441:	84 c0                	test   %al,%al
  801443:	75 de                	jne    801423 <strchr+0x13>
  801445:	b8 00 00 00 00       	mov    $0x0,%eax
  80144a:	c9                   	leaveq 
  80144b:	c3                   	retq   

000000000080144c <strfind>:
  80144c:	55                   	push   %rbp
  80144d:	48 89 e5             	mov    %rsp,%rbp
  801450:	48 83 ec 10          	sub    $0x10,%rsp
  801454:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801458:	89 f0                	mov    %esi,%eax
  80145a:	88 45 f4             	mov    %al,-0xc(%rbp)
  80145d:	eb 11                	jmp    801470 <strfind+0x24>
  80145f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801463:	0f b6 00             	movzbl (%rax),%eax
  801466:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801469:	74 12                	je     80147d <strfind+0x31>
  80146b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801470:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801474:	0f b6 00             	movzbl (%rax),%eax
  801477:	84 c0                	test   %al,%al
  801479:	75 e4                	jne    80145f <strfind+0x13>
  80147b:	eb 01                	jmp    80147e <strfind+0x32>
  80147d:	90                   	nop
  80147e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801482:	c9                   	leaveq 
  801483:	c3                   	retq   

0000000000801484 <memset>:
  801484:	55                   	push   %rbp
  801485:	48 89 e5             	mov    %rsp,%rbp
  801488:	48 83 ec 18          	sub    $0x18,%rsp
  80148c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801490:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801493:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801497:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80149c:	75 06                	jne    8014a4 <memset+0x20>
  80149e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014a2:	eb 69                	jmp    80150d <memset+0x89>
  8014a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014a8:	83 e0 03             	and    $0x3,%eax
  8014ab:	48 85 c0             	test   %rax,%rax
  8014ae:	75 48                	jne    8014f8 <memset+0x74>
  8014b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014b4:	83 e0 03             	and    $0x3,%eax
  8014b7:	48 85 c0             	test   %rax,%rax
  8014ba:	75 3c                	jne    8014f8 <memset+0x74>
  8014bc:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8014c3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014c6:	c1 e0 18             	shl    $0x18,%eax
  8014c9:	89 c2                	mov    %eax,%edx
  8014cb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014ce:	c1 e0 10             	shl    $0x10,%eax
  8014d1:	09 c2                	or     %eax,%edx
  8014d3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014d6:	c1 e0 08             	shl    $0x8,%eax
  8014d9:	09 d0                	or     %edx,%eax
  8014db:	09 45 f4             	or     %eax,-0xc(%rbp)
  8014de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014e2:	48 c1 e8 02          	shr    $0x2,%rax
  8014e6:	48 89 c1             	mov    %rax,%rcx
  8014e9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014ed:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014f0:	48 89 d7             	mov    %rdx,%rdi
  8014f3:	fc                   	cld    
  8014f4:	f3 ab                	rep stos %eax,%es:(%rdi)
  8014f6:	eb 11                	jmp    801509 <memset+0x85>
  8014f8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014fc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8014ff:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801503:	48 89 d7             	mov    %rdx,%rdi
  801506:	fc                   	cld    
  801507:	f3 aa                	rep stos %al,%es:(%rdi)
  801509:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80150d:	c9                   	leaveq 
  80150e:	c3                   	retq   

000000000080150f <memmove>:
  80150f:	55                   	push   %rbp
  801510:	48 89 e5             	mov    %rsp,%rbp
  801513:	48 83 ec 28          	sub    $0x28,%rsp
  801517:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80151b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80151f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801523:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801527:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80152b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80152f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801533:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801537:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80153b:	0f 83 88 00 00 00    	jae    8015c9 <memmove+0xba>
  801541:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801545:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801549:	48 01 d0             	add    %rdx,%rax
  80154c:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801550:	76 77                	jbe    8015c9 <memmove+0xba>
  801552:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801556:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80155a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80155e:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801562:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801566:	83 e0 03             	and    $0x3,%eax
  801569:	48 85 c0             	test   %rax,%rax
  80156c:	75 3b                	jne    8015a9 <memmove+0x9a>
  80156e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801572:	83 e0 03             	and    $0x3,%eax
  801575:	48 85 c0             	test   %rax,%rax
  801578:	75 2f                	jne    8015a9 <memmove+0x9a>
  80157a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80157e:	83 e0 03             	and    $0x3,%eax
  801581:	48 85 c0             	test   %rax,%rax
  801584:	75 23                	jne    8015a9 <memmove+0x9a>
  801586:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80158a:	48 83 e8 04          	sub    $0x4,%rax
  80158e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801592:	48 83 ea 04          	sub    $0x4,%rdx
  801596:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80159a:	48 c1 e9 02          	shr    $0x2,%rcx
  80159e:	48 89 c7             	mov    %rax,%rdi
  8015a1:	48 89 d6             	mov    %rdx,%rsi
  8015a4:	fd                   	std    
  8015a5:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8015a7:	eb 1d                	jmp    8015c6 <memmove+0xb7>
  8015a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015ad:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8015b1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015b5:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8015b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015bd:	48 89 d7             	mov    %rdx,%rdi
  8015c0:	48 89 c1             	mov    %rax,%rcx
  8015c3:	fd                   	std    
  8015c4:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8015c6:	fc                   	cld    
  8015c7:	eb 57                	jmp    801620 <memmove+0x111>
  8015c9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015cd:	83 e0 03             	and    $0x3,%eax
  8015d0:	48 85 c0             	test   %rax,%rax
  8015d3:	75 36                	jne    80160b <memmove+0xfc>
  8015d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015d9:	83 e0 03             	and    $0x3,%eax
  8015dc:	48 85 c0             	test   %rax,%rax
  8015df:	75 2a                	jne    80160b <memmove+0xfc>
  8015e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015e5:	83 e0 03             	and    $0x3,%eax
  8015e8:	48 85 c0             	test   %rax,%rax
  8015eb:	75 1e                	jne    80160b <memmove+0xfc>
  8015ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f1:	48 c1 e8 02          	shr    $0x2,%rax
  8015f5:	48 89 c1             	mov    %rax,%rcx
  8015f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015fc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801600:	48 89 c7             	mov    %rax,%rdi
  801603:	48 89 d6             	mov    %rdx,%rsi
  801606:	fc                   	cld    
  801607:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801609:	eb 15                	jmp    801620 <memmove+0x111>
  80160b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80160f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801613:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801617:	48 89 c7             	mov    %rax,%rdi
  80161a:	48 89 d6             	mov    %rdx,%rsi
  80161d:	fc                   	cld    
  80161e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801620:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801624:	c9                   	leaveq 
  801625:	c3                   	retq   

0000000000801626 <memcpy>:
  801626:	55                   	push   %rbp
  801627:	48 89 e5             	mov    %rsp,%rbp
  80162a:	48 83 ec 18          	sub    $0x18,%rsp
  80162e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801632:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801636:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80163a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80163e:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801642:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801646:	48 89 ce             	mov    %rcx,%rsi
  801649:	48 89 c7             	mov    %rax,%rdi
  80164c:	48 b8 0f 15 80 00 00 	movabs $0x80150f,%rax
  801653:	00 00 00 
  801656:	ff d0                	callq  *%rax
  801658:	c9                   	leaveq 
  801659:	c3                   	retq   

000000000080165a <memcmp>:
  80165a:	55                   	push   %rbp
  80165b:	48 89 e5             	mov    %rsp,%rbp
  80165e:	48 83 ec 28          	sub    $0x28,%rsp
  801662:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801666:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80166a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80166e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801672:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801676:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80167a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80167e:	eb 36                	jmp    8016b6 <memcmp+0x5c>
  801680:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801684:	0f b6 10             	movzbl (%rax),%edx
  801687:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80168b:	0f b6 00             	movzbl (%rax),%eax
  80168e:	38 c2                	cmp    %al,%dl
  801690:	74 1a                	je     8016ac <memcmp+0x52>
  801692:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801696:	0f b6 00             	movzbl (%rax),%eax
  801699:	0f b6 d0             	movzbl %al,%edx
  80169c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016a0:	0f b6 00             	movzbl (%rax),%eax
  8016a3:	0f b6 c0             	movzbl %al,%eax
  8016a6:	29 c2                	sub    %eax,%edx
  8016a8:	89 d0                	mov    %edx,%eax
  8016aa:	eb 20                	jmp    8016cc <memcmp+0x72>
  8016ac:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016b1:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8016b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ba:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8016be:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016c2:	48 85 c0             	test   %rax,%rax
  8016c5:	75 b9                	jne    801680 <memcmp+0x26>
  8016c7:	b8 00 00 00 00       	mov    $0x0,%eax
  8016cc:	c9                   	leaveq 
  8016cd:	c3                   	retq   

00000000008016ce <memfind>:
  8016ce:	55                   	push   %rbp
  8016cf:	48 89 e5             	mov    %rsp,%rbp
  8016d2:	48 83 ec 28          	sub    $0x28,%rsp
  8016d6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016da:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8016dd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016e1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8016e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e9:	48 01 d0             	add    %rdx,%rax
  8016ec:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016f0:	eb 13                	jmp    801705 <memfind+0x37>
  8016f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016f6:	0f b6 00             	movzbl (%rax),%eax
  8016f9:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8016fc:	38 d0                	cmp    %dl,%al
  8016fe:	74 11                	je     801711 <memfind+0x43>
  801700:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801705:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801709:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80170d:	72 e3                	jb     8016f2 <memfind+0x24>
  80170f:	eb 01                	jmp    801712 <memfind+0x44>
  801711:	90                   	nop
  801712:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801716:	c9                   	leaveq 
  801717:	c3                   	retq   

0000000000801718 <strtol>:
  801718:	55                   	push   %rbp
  801719:	48 89 e5             	mov    %rsp,%rbp
  80171c:	48 83 ec 38          	sub    $0x38,%rsp
  801720:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801724:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801728:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80172b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801732:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801739:	00 
  80173a:	eb 05                	jmp    801741 <strtol+0x29>
  80173c:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801741:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801745:	0f b6 00             	movzbl (%rax),%eax
  801748:	3c 20                	cmp    $0x20,%al
  80174a:	74 f0                	je     80173c <strtol+0x24>
  80174c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801750:	0f b6 00             	movzbl (%rax),%eax
  801753:	3c 09                	cmp    $0x9,%al
  801755:	74 e5                	je     80173c <strtol+0x24>
  801757:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80175b:	0f b6 00             	movzbl (%rax),%eax
  80175e:	3c 2b                	cmp    $0x2b,%al
  801760:	75 07                	jne    801769 <strtol+0x51>
  801762:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801767:	eb 17                	jmp    801780 <strtol+0x68>
  801769:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80176d:	0f b6 00             	movzbl (%rax),%eax
  801770:	3c 2d                	cmp    $0x2d,%al
  801772:	75 0c                	jne    801780 <strtol+0x68>
  801774:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801779:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801780:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801784:	74 06                	je     80178c <strtol+0x74>
  801786:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80178a:	75 28                	jne    8017b4 <strtol+0x9c>
  80178c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801790:	0f b6 00             	movzbl (%rax),%eax
  801793:	3c 30                	cmp    $0x30,%al
  801795:	75 1d                	jne    8017b4 <strtol+0x9c>
  801797:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80179b:	48 83 c0 01          	add    $0x1,%rax
  80179f:	0f b6 00             	movzbl (%rax),%eax
  8017a2:	3c 78                	cmp    $0x78,%al
  8017a4:	75 0e                	jne    8017b4 <strtol+0x9c>
  8017a6:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8017ab:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8017b2:	eb 2c                	jmp    8017e0 <strtol+0xc8>
  8017b4:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017b8:	75 19                	jne    8017d3 <strtol+0xbb>
  8017ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017be:	0f b6 00             	movzbl (%rax),%eax
  8017c1:	3c 30                	cmp    $0x30,%al
  8017c3:	75 0e                	jne    8017d3 <strtol+0xbb>
  8017c5:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017ca:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8017d1:	eb 0d                	jmp    8017e0 <strtol+0xc8>
  8017d3:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8017d7:	75 07                	jne    8017e0 <strtol+0xc8>
  8017d9:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8017e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017e4:	0f b6 00             	movzbl (%rax),%eax
  8017e7:	3c 2f                	cmp    $0x2f,%al
  8017e9:	7e 1d                	jle    801808 <strtol+0xf0>
  8017eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ef:	0f b6 00             	movzbl (%rax),%eax
  8017f2:	3c 39                	cmp    $0x39,%al
  8017f4:	7f 12                	jg     801808 <strtol+0xf0>
  8017f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017fa:	0f b6 00             	movzbl (%rax),%eax
  8017fd:	0f be c0             	movsbl %al,%eax
  801800:	83 e8 30             	sub    $0x30,%eax
  801803:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801806:	eb 4e                	jmp    801856 <strtol+0x13e>
  801808:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180c:	0f b6 00             	movzbl (%rax),%eax
  80180f:	3c 60                	cmp    $0x60,%al
  801811:	7e 1d                	jle    801830 <strtol+0x118>
  801813:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801817:	0f b6 00             	movzbl (%rax),%eax
  80181a:	3c 7a                	cmp    $0x7a,%al
  80181c:	7f 12                	jg     801830 <strtol+0x118>
  80181e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801822:	0f b6 00             	movzbl (%rax),%eax
  801825:	0f be c0             	movsbl %al,%eax
  801828:	83 e8 57             	sub    $0x57,%eax
  80182b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80182e:	eb 26                	jmp    801856 <strtol+0x13e>
  801830:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801834:	0f b6 00             	movzbl (%rax),%eax
  801837:	3c 40                	cmp    $0x40,%al
  801839:	7e 47                	jle    801882 <strtol+0x16a>
  80183b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80183f:	0f b6 00             	movzbl (%rax),%eax
  801842:	3c 5a                	cmp    $0x5a,%al
  801844:	7f 3c                	jg     801882 <strtol+0x16a>
  801846:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80184a:	0f b6 00             	movzbl (%rax),%eax
  80184d:	0f be c0             	movsbl %al,%eax
  801850:	83 e8 37             	sub    $0x37,%eax
  801853:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801856:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801859:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80185c:	7d 23                	jge    801881 <strtol+0x169>
  80185e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801863:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801866:	48 98                	cltq   
  801868:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80186d:	48 89 c2             	mov    %rax,%rdx
  801870:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801873:	48 98                	cltq   
  801875:	48 01 d0             	add    %rdx,%rax
  801878:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80187c:	e9 5f ff ff ff       	jmpq   8017e0 <strtol+0xc8>
  801881:	90                   	nop
  801882:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801887:	74 0b                	je     801894 <strtol+0x17c>
  801889:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80188d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801891:	48 89 10             	mov    %rdx,(%rax)
  801894:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801898:	74 09                	je     8018a3 <strtol+0x18b>
  80189a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80189e:	48 f7 d8             	neg    %rax
  8018a1:	eb 04                	jmp    8018a7 <strtol+0x18f>
  8018a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018a7:	c9                   	leaveq 
  8018a8:	c3                   	retq   

00000000008018a9 <strstr>:
  8018a9:	55                   	push   %rbp
  8018aa:	48 89 e5             	mov    %rsp,%rbp
  8018ad:	48 83 ec 30          	sub    $0x30,%rsp
  8018b1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8018b5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8018b9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018bd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018c1:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8018c5:	0f b6 00             	movzbl (%rax),%eax
  8018c8:	88 45 ff             	mov    %al,-0x1(%rbp)
  8018cb:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8018cf:	75 06                	jne    8018d7 <strstr+0x2e>
  8018d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018d5:	eb 6b                	jmp    801942 <strstr+0x99>
  8018d7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8018db:	48 89 c7             	mov    %rax,%rdi
  8018de:	48 b8 7e 11 80 00 00 	movabs $0x80117e,%rax
  8018e5:	00 00 00 
  8018e8:	ff d0                	callq  *%rax
  8018ea:	48 98                	cltq   
  8018ec:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8018f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018f4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8018f8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8018fc:	0f b6 00             	movzbl (%rax),%eax
  8018ff:	88 45 ef             	mov    %al,-0x11(%rbp)
  801902:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801906:	75 07                	jne    80190f <strstr+0x66>
  801908:	b8 00 00 00 00       	mov    $0x0,%eax
  80190d:	eb 33                	jmp    801942 <strstr+0x99>
  80190f:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801913:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801916:	75 d8                	jne    8018f0 <strstr+0x47>
  801918:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80191c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801920:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801924:	48 89 ce             	mov    %rcx,%rsi
  801927:	48 89 c7             	mov    %rax,%rdi
  80192a:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  801931:	00 00 00 
  801934:	ff d0                	callq  *%rax
  801936:	85 c0                	test   %eax,%eax
  801938:	75 b6                	jne    8018f0 <strstr+0x47>
  80193a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80193e:	48 83 e8 01          	sub    $0x1,%rax
  801942:	c9                   	leaveq 
  801943:	c3                   	retq   

0000000000801944 <syscall>:
  801944:	55                   	push   %rbp
  801945:	48 89 e5             	mov    %rsp,%rbp
  801948:	53                   	push   %rbx
  801949:	48 83 ec 48          	sub    $0x48,%rsp
  80194d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801950:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801953:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801957:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80195b:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80195f:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801963:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801966:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80196a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80196e:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801972:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801976:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80197a:	4c 89 c3             	mov    %r8,%rbx
  80197d:	cd 30                	int    $0x30
  80197f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801983:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801987:	74 3e                	je     8019c7 <syscall+0x83>
  801989:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80198e:	7e 37                	jle    8019c7 <syscall+0x83>
  801990:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801994:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801997:	49 89 d0             	mov    %rdx,%r8
  80199a:	89 c1                	mov    %eax,%ecx
  80199c:	48 ba 88 48 80 00 00 	movabs $0x804888,%rdx
  8019a3:	00 00 00 
  8019a6:	be 24 00 00 00       	mov    $0x24,%esi
  8019ab:	48 bf a5 48 80 00 00 	movabs $0x8048a5,%rdi
  8019b2:	00 00 00 
  8019b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8019ba:	49 b9 20 04 80 00 00 	movabs $0x800420,%r9
  8019c1:	00 00 00 
  8019c4:	41 ff d1             	callq  *%r9
  8019c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019cb:	48 83 c4 48          	add    $0x48,%rsp
  8019cf:	5b                   	pop    %rbx
  8019d0:	5d                   	pop    %rbp
  8019d1:	c3                   	retq   

00000000008019d2 <sys_cputs>:
  8019d2:	55                   	push   %rbp
  8019d3:	48 89 e5             	mov    %rsp,%rbp
  8019d6:	48 83 ec 10          	sub    $0x10,%rsp
  8019da:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8019de:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019e6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ea:	48 83 ec 08          	sub    $0x8,%rsp
  8019ee:	6a 00                	pushq  $0x0
  8019f0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019f6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019fc:	48 89 d1             	mov    %rdx,%rcx
  8019ff:	48 89 c2             	mov    %rax,%rdx
  801a02:	be 00 00 00 00       	mov    $0x0,%esi
  801a07:	bf 00 00 00 00       	mov    $0x0,%edi
  801a0c:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801a13:	00 00 00 
  801a16:	ff d0                	callq  *%rax
  801a18:	48 83 c4 10          	add    $0x10,%rsp
  801a1c:	90                   	nop
  801a1d:	c9                   	leaveq 
  801a1e:	c3                   	retq   

0000000000801a1f <sys_cgetc>:
  801a1f:	55                   	push   %rbp
  801a20:	48 89 e5             	mov    %rsp,%rbp
  801a23:	48 83 ec 08          	sub    $0x8,%rsp
  801a27:	6a 00                	pushq  $0x0
  801a29:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a2f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a35:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a3a:	ba 00 00 00 00       	mov    $0x0,%edx
  801a3f:	be 00 00 00 00       	mov    $0x0,%esi
  801a44:	bf 01 00 00 00       	mov    $0x1,%edi
  801a49:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801a50:	00 00 00 
  801a53:	ff d0                	callq  *%rax
  801a55:	48 83 c4 10          	add    $0x10,%rsp
  801a59:	c9                   	leaveq 
  801a5a:	c3                   	retq   

0000000000801a5b <sys_env_destroy>:
  801a5b:	55                   	push   %rbp
  801a5c:	48 89 e5             	mov    %rsp,%rbp
  801a5f:	48 83 ec 10          	sub    $0x10,%rsp
  801a63:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a69:	48 98                	cltq   
  801a6b:	48 83 ec 08          	sub    $0x8,%rsp
  801a6f:	6a 00                	pushq  $0x0
  801a71:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a77:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a7d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a82:	48 89 c2             	mov    %rax,%rdx
  801a85:	be 01 00 00 00       	mov    $0x1,%esi
  801a8a:	bf 03 00 00 00       	mov    $0x3,%edi
  801a8f:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801a96:	00 00 00 
  801a99:	ff d0                	callq  *%rax
  801a9b:	48 83 c4 10          	add    $0x10,%rsp
  801a9f:	c9                   	leaveq 
  801aa0:	c3                   	retq   

0000000000801aa1 <sys_getenvid>:
  801aa1:	55                   	push   %rbp
  801aa2:	48 89 e5             	mov    %rsp,%rbp
  801aa5:	48 83 ec 08          	sub    $0x8,%rsp
  801aa9:	6a 00                	pushq  $0x0
  801aab:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ab1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ab7:	b9 00 00 00 00       	mov    $0x0,%ecx
  801abc:	ba 00 00 00 00       	mov    $0x0,%edx
  801ac1:	be 00 00 00 00       	mov    $0x0,%esi
  801ac6:	bf 02 00 00 00       	mov    $0x2,%edi
  801acb:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801ad2:	00 00 00 
  801ad5:	ff d0                	callq  *%rax
  801ad7:	48 83 c4 10          	add    $0x10,%rsp
  801adb:	c9                   	leaveq 
  801adc:	c3                   	retq   

0000000000801add <sys_yield>:
  801add:	55                   	push   %rbp
  801ade:	48 89 e5             	mov    %rsp,%rbp
  801ae1:	48 83 ec 08          	sub    $0x8,%rsp
  801ae5:	6a 00                	pushq  $0x0
  801ae7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aed:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801af3:	b9 00 00 00 00       	mov    $0x0,%ecx
  801af8:	ba 00 00 00 00       	mov    $0x0,%edx
  801afd:	be 00 00 00 00       	mov    $0x0,%esi
  801b02:	bf 0b 00 00 00       	mov    $0xb,%edi
  801b07:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801b0e:	00 00 00 
  801b11:	ff d0                	callq  *%rax
  801b13:	48 83 c4 10          	add    $0x10,%rsp
  801b17:	90                   	nop
  801b18:	c9                   	leaveq 
  801b19:	c3                   	retq   

0000000000801b1a <sys_page_alloc>:
  801b1a:	55                   	push   %rbp
  801b1b:	48 89 e5             	mov    %rsp,%rbp
  801b1e:	48 83 ec 10          	sub    $0x10,%rsp
  801b22:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b25:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b29:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b2c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b2f:	48 63 c8             	movslq %eax,%rcx
  801b32:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b39:	48 98                	cltq   
  801b3b:	48 83 ec 08          	sub    $0x8,%rsp
  801b3f:	6a 00                	pushq  $0x0
  801b41:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b47:	49 89 c8             	mov    %rcx,%r8
  801b4a:	48 89 d1             	mov    %rdx,%rcx
  801b4d:	48 89 c2             	mov    %rax,%rdx
  801b50:	be 01 00 00 00       	mov    $0x1,%esi
  801b55:	bf 04 00 00 00       	mov    $0x4,%edi
  801b5a:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801b61:	00 00 00 
  801b64:	ff d0                	callq  *%rax
  801b66:	48 83 c4 10          	add    $0x10,%rsp
  801b6a:	c9                   	leaveq 
  801b6b:	c3                   	retq   

0000000000801b6c <sys_page_map>:
  801b6c:	55                   	push   %rbp
  801b6d:	48 89 e5             	mov    %rsp,%rbp
  801b70:	48 83 ec 20          	sub    $0x20,%rsp
  801b74:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b77:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b7b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b7e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801b82:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801b86:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b89:	48 63 c8             	movslq %eax,%rcx
  801b8c:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801b90:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b93:	48 63 f0             	movslq %eax,%rsi
  801b96:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b9a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b9d:	48 98                	cltq   
  801b9f:	48 83 ec 08          	sub    $0x8,%rsp
  801ba3:	51                   	push   %rcx
  801ba4:	49 89 f9             	mov    %rdi,%r9
  801ba7:	49 89 f0             	mov    %rsi,%r8
  801baa:	48 89 d1             	mov    %rdx,%rcx
  801bad:	48 89 c2             	mov    %rax,%rdx
  801bb0:	be 01 00 00 00       	mov    $0x1,%esi
  801bb5:	bf 05 00 00 00       	mov    $0x5,%edi
  801bba:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801bc1:	00 00 00 
  801bc4:	ff d0                	callq  *%rax
  801bc6:	48 83 c4 10          	add    $0x10,%rsp
  801bca:	c9                   	leaveq 
  801bcb:	c3                   	retq   

0000000000801bcc <sys_page_unmap>:
  801bcc:	55                   	push   %rbp
  801bcd:	48 89 e5             	mov    %rsp,%rbp
  801bd0:	48 83 ec 10          	sub    $0x10,%rsp
  801bd4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bd7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bdb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bdf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801be2:	48 98                	cltq   
  801be4:	48 83 ec 08          	sub    $0x8,%rsp
  801be8:	6a 00                	pushq  $0x0
  801bea:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bf0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bf6:	48 89 d1             	mov    %rdx,%rcx
  801bf9:	48 89 c2             	mov    %rax,%rdx
  801bfc:	be 01 00 00 00       	mov    $0x1,%esi
  801c01:	bf 06 00 00 00       	mov    $0x6,%edi
  801c06:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801c0d:	00 00 00 
  801c10:	ff d0                	callq  *%rax
  801c12:	48 83 c4 10          	add    $0x10,%rsp
  801c16:	c9                   	leaveq 
  801c17:	c3                   	retq   

0000000000801c18 <sys_env_set_status>:
  801c18:	55                   	push   %rbp
  801c19:	48 89 e5             	mov    %rsp,%rbp
  801c1c:	48 83 ec 10          	sub    $0x10,%rsp
  801c20:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c23:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801c26:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c29:	48 63 d0             	movslq %eax,%rdx
  801c2c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c2f:	48 98                	cltq   
  801c31:	48 83 ec 08          	sub    $0x8,%rsp
  801c35:	6a 00                	pushq  $0x0
  801c37:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c3d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c43:	48 89 d1             	mov    %rdx,%rcx
  801c46:	48 89 c2             	mov    %rax,%rdx
  801c49:	be 01 00 00 00       	mov    $0x1,%esi
  801c4e:	bf 08 00 00 00       	mov    $0x8,%edi
  801c53:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801c5a:	00 00 00 
  801c5d:	ff d0                	callq  *%rax
  801c5f:	48 83 c4 10          	add    $0x10,%rsp
  801c63:	c9                   	leaveq 
  801c64:	c3                   	retq   

0000000000801c65 <sys_env_set_trapframe>:
  801c65:	55                   	push   %rbp
  801c66:	48 89 e5             	mov    %rsp,%rbp
  801c69:	48 83 ec 10          	sub    $0x10,%rsp
  801c6d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c74:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c7b:	48 98                	cltq   
  801c7d:	48 83 ec 08          	sub    $0x8,%rsp
  801c81:	6a 00                	pushq  $0x0
  801c83:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c89:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c8f:	48 89 d1             	mov    %rdx,%rcx
  801c92:	48 89 c2             	mov    %rax,%rdx
  801c95:	be 01 00 00 00       	mov    $0x1,%esi
  801c9a:	bf 09 00 00 00       	mov    $0x9,%edi
  801c9f:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801ca6:	00 00 00 
  801ca9:	ff d0                	callq  *%rax
  801cab:	48 83 c4 10          	add    $0x10,%rsp
  801caf:	c9                   	leaveq 
  801cb0:	c3                   	retq   

0000000000801cb1 <sys_env_set_pgfault_upcall>:
  801cb1:	55                   	push   %rbp
  801cb2:	48 89 e5             	mov    %rsp,%rbp
  801cb5:	48 83 ec 10          	sub    $0x10,%rsp
  801cb9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cbc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801cc0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cc4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cc7:	48 98                	cltq   
  801cc9:	48 83 ec 08          	sub    $0x8,%rsp
  801ccd:	6a 00                	pushq  $0x0
  801ccf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cd5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cdb:	48 89 d1             	mov    %rdx,%rcx
  801cde:	48 89 c2             	mov    %rax,%rdx
  801ce1:	be 01 00 00 00       	mov    $0x1,%esi
  801ce6:	bf 0a 00 00 00       	mov    $0xa,%edi
  801ceb:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801cf2:	00 00 00 
  801cf5:	ff d0                	callq  *%rax
  801cf7:	48 83 c4 10          	add    $0x10,%rsp
  801cfb:	c9                   	leaveq 
  801cfc:	c3                   	retq   

0000000000801cfd <sys_ipc_try_send>:
  801cfd:	55                   	push   %rbp
  801cfe:	48 89 e5             	mov    %rsp,%rbp
  801d01:	48 83 ec 20          	sub    $0x20,%rsp
  801d05:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d08:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d0c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801d10:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801d13:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d16:	48 63 f0             	movslq %eax,%rsi
  801d19:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801d1d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d20:	48 98                	cltq   
  801d22:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d26:	48 83 ec 08          	sub    $0x8,%rsp
  801d2a:	6a 00                	pushq  $0x0
  801d2c:	49 89 f1             	mov    %rsi,%r9
  801d2f:	49 89 c8             	mov    %rcx,%r8
  801d32:	48 89 d1             	mov    %rdx,%rcx
  801d35:	48 89 c2             	mov    %rax,%rdx
  801d38:	be 00 00 00 00       	mov    $0x0,%esi
  801d3d:	bf 0c 00 00 00       	mov    $0xc,%edi
  801d42:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801d49:	00 00 00 
  801d4c:	ff d0                	callq  *%rax
  801d4e:	48 83 c4 10          	add    $0x10,%rsp
  801d52:	c9                   	leaveq 
  801d53:	c3                   	retq   

0000000000801d54 <sys_ipc_recv>:
  801d54:	55                   	push   %rbp
  801d55:	48 89 e5             	mov    %rsp,%rbp
  801d58:	48 83 ec 10          	sub    $0x10,%rsp
  801d5c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d64:	48 83 ec 08          	sub    $0x8,%rsp
  801d68:	6a 00                	pushq  $0x0
  801d6a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d70:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d76:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d7b:	48 89 c2             	mov    %rax,%rdx
  801d7e:	be 01 00 00 00       	mov    $0x1,%esi
  801d83:	bf 0d 00 00 00       	mov    $0xd,%edi
  801d88:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801d8f:	00 00 00 
  801d92:	ff d0                	callq  *%rax
  801d94:	48 83 c4 10          	add    $0x10,%rsp
  801d98:	c9                   	leaveq 
  801d99:	c3                   	retq   

0000000000801d9a <sys_time_msec>:
  801d9a:	55                   	push   %rbp
  801d9b:	48 89 e5             	mov    %rsp,%rbp
  801d9e:	48 83 ec 08          	sub    $0x8,%rsp
  801da2:	6a 00                	pushq  $0x0
  801da4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801daa:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801db0:	b9 00 00 00 00       	mov    $0x0,%ecx
  801db5:	ba 00 00 00 00       	mov    $0x0,%edx
  801dba:	be 00 00 00 00       	mov    $0x0,%esi
  801dbf:	bf 0e 00 00 00       	mov    $0xe,%edi
  801dc4:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801dcb:	00 00 00 
  801dce:	ff d0                	callq  *%rax
  801dd0:	48 83 c4 10          	add    $0x10,%rsp
  801dd4:	c9                   	leaveq 
  801dd5:	c3                   	retq   

0000000000801dd6 <sys_net_transmit>:
  801dd6:	55                   	push   %rbp
  801dd7:	48 89 e5             	mov    %rsp,%rbp
  801dda:	48 83 ec 10          	sub    $0x10,%rsp
  801dde:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801de2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801de5:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801de8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dec:	48 83 ec 08          	sub    $0x8,%rsp
  801df0:	6a 00                	pushq  $0x0
  801df2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801df8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dfe:	48 89 d1             	mov    %rdx,%rcx
  801e01:	48 89 c2             	mov    %rax,%rdx
  801e04:	be 00 00 00 00       	mov    $0x0,%esi
  801e09:	bf 0f 00 00 00       	mov    $0xf,%edi
  801e0e:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801e15:	00 00 00 
  801e18:	ff d0                	callq  *%rax
  801e1a:	48 83 c4 10          	add    $0x10,%rsp
  801e1e:	c9                   	leaveq 
  801e1f:	c3                   	retq   

0000000000801e20 <sys_net_receive>:
  801e20:	55                   	push   %rbp
  801e21:	48 89 e5             	mov    %rsp,%rbp
  801e24:	48 83 ec 10          	sub    $0x10,%rsp
  801e28:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e2c:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e2f:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e36:	48 83 ec 08          	sub    $0x8,%rsp
  801e3a:	6a 00                	pushq  $0x0
  801e3c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e42:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e48:	48 89 d1             	mov    %rdx,%rcx
  801e4b:	48 89 c2             	mov    %rax,%rdx
  801e4e:	be 00 00 00 00       	mov    $0x0,%esi
  801e53:	bf 10 00 00 00       	mov    $0x10,%edi
  801e58:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801e5f:	00 00 00 
  801e62:	ff d0                	callq  *%rax
  801e64:	48 83 c4 10          	add    $0x10,%rsp
  801e68:	c9                   	leaveq 
  801e69:	c3                   	retq   

0000000000801e6a <sys_ept_map>:
  801e6a:	55                   	push   %rbp
  801e6b:	48 89 e5             	mov    %rsp,%rbp
  801e6e:	48 83 ec 20          	sub    $0x20,%rsp
  801e72:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e75:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e79:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e7c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801e80:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801e84:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801e87:	48 63 c8             	movslq %eax,%rcx
  801e8a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801e8e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e91:	48 63 f0             	movslq %eax,%rsi
  801e94:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e9b:	48 98                	cltq   
  801e9d:	48 83 ec 08          	sub    $0x8,%rsp
  801ea1:	51                   	push   %rcx
  801ea2:	49 89 f9             	mov    %rdi,%r9
  801ea5:	49 89 f0             	mov    %rsi,%r8
  801ea8:	48 89 d1             	mov    %rdx,%rcx
  801eab:	48 89 c2             	mov    %rax,%rdx
  801eae:	be 00 00 00 00       	mov    $0x0,%esi
  801eb3:	bf 11 00 00 00       	mov    $0x11,%edi
  801eb8:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801ebf:	00 00 00 
  801ec2:	ff d0                	callq  *%rax
  801ec4:	48 83 c4 10          	add    $0x10,%rsp
  801ec8:	c9                   	leaveq 
  801ec9:	c3                   	retq   

0000000000801eca <sys_env_mkguest>:
  801eca:	55                   	push   %rbp
  801ecb:	48 89 e5             	mov    %rsp,%rbp
  801ece:	48 83 ec 10          	sub    $0x10,%rsp
  801ed2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ed6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801eda:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ede:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ee2:	48 83 ec 08          	sub    $0x8,%rsp
  801ee6:	6a 00                	pushq  $0x0
  801ee8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801eee:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ef4:	48 89 d1             	mov    %rdx,%rcx
  801ef7:	48 89 c2             	mov    %rax,%rdx
  801efa:	be 00 00 00 00       	mov    $0x0,%esi
  801eff:	bf 12 00 00 00       	mov    $0x12,%edi
  801f04:	48 b8 44 19 80 00 00 	movabs $0x801944,%rax
  801f0b:	00 00 00 
  801f0e:	ff d0                	callq  *%rax
  801f10:	48 83 c4 10          	add    $0x10,%rsp
  801f14:	c9                   	leaveq 
  801f15:	c3                   	retq   

0000000000801f16 <fd2num>:
  801f16:	55                   	push   %rbp
  801f17:	48 89 e5             	mov    %rsp,%rbp
  801f1a:	48 83 ec 08          	sub    $0x8,%rsp
  801f1e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f22:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f26:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801f2d:	ff ff ff 
  801f30:	48 01 d0             	add    %rdx,%rax
  801f33:	48 c1 e8 0c          	shr    $0xc,%rax
  801f37:	c9                   	leaveq 
  801f38:	c3                   	retq   

0000000000801f39 <fd2data>:
  801f39:	55                   	push   %rbp
  801f3a:	48 89 e5             	mov    %rsp,%rbp
  801f3d:	48 83 ec 08          	sub    $0x8,%rsp
  801f41:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f45:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f49:	48 89 c7             	mov    %rax,%rdi
  801f4c:	48 b8 16 1f 80 00 00 	movabs $0x801f16,%rax
  801f53:	00 00 00 
  801f56:	ff d0                	callq  *%rax
  801f58:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801f5e:	48 c1 e0 0c          	shl    $0xc,%rax
  801f62:	c9                   	leaveq 
  801f63:	c3                   	retq   

0000000000801f64 <fd_alloc>:
  801f64:	55                   	push   %rbp
  801f65:	48 89 e5             	mov    %rsp,%rbp
  801f68:	48 83 ec 18          	sub    $0x18,%rsp
  801f6c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f70:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f77:	eb 6b                	jmp    801fe4 <fd_alloc+0x80>
  801f79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f7c:	48 98                	cltq   
  801f7e:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f84:	48 c1 e0 0c          	shl    $0xc,%rax
  801f88:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801f8c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f90:	48 c1 e8 15          	shr    $0x15,%rax
  801f94:	48 89 c2             	mov    %rax,%rdx
  801f97:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f9e:	01 00 00 
  801fa1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fa5:	83 e0 01             	and    $0x1,%eax
  801fa8:	48 85 c0             	test   %rax,%rax
  801fab:	74 21                	je     801fce <fd_alloc+0x6a>
  801fad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fb1:	48 c1 e8 0c          	shr    $0xc,%rax
  801fb5:	48 89 c2             	mov    %rax,%rdx
  801fb8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fbf:	01 00 00 
  801fc2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fc6:	83 e0 01             	and    $0x1,%eax
  801fc9:	48 85 c0             	test   %rax,%rax
  801fcc:	75 12                	jne    801fe0 <fd_alloc+0x7c>
  801fce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fd2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801fd6:	48 89 10             	mov    %rdx,(%rax)
  801fd9:	b8 00 00 00 00       	mov    $0x0,%eax
  801fde:	eb 1a                	jmp    801ffa <fd_alloc+0x96>
  801fe0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801fe4:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801fe8:	7e 8f                	jle    801f79 <fd_alloc+0x15>
  801fea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fee:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801ff5:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801ffa:	c9                   	leaveq 
  801ffb:	c3                   	retq   

0000000000801ffc <fd_lookup>:
  801ffc:	55                   	push   %rbp
  801ffd:	48 89 e5             	mov    %rsp,%rbp
  802000:	48 83 ec 20          	sub    $0x20,%rsp
  802004:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802007:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80200b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80200f:	78 06                	js     802017 <fd_lookup+0x1b>
  802011:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802015:	7e 07                	jle    80201e <fd_lookup+0x22>
  802017:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80201c:	eb 6c                	jmp    80208a <fd_lookup+0x8e>
  80201e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802021:	48 98                	cltq   
  802023:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802029:	48 c1 e0 0c          	shl    $0xc,%rax
  80202d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802031:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802035:	48 c1 e8 15          	shr    $0x15,%rax
  802039:	48 89 c2             	mov    %rax,%rdx
  80203c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802043:	01 00 00 
  802046:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80204a:	83 e0 01             	and    $0x1,%eax
  80204d:	48 85 c0             	test   %rax,%rax
  802050:	74 21                	je     802073 <fd_lookup+0x77>
  802052:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802056:	48 c1 e8 0c          	shr    $0xc,%rax
  80205a:	48 89 c2             	mov    %rax,%rdx
  80205d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802064:	01 00 00 
  802067:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80206b:	83 e0 01             	and    $0x1,%eax
  80206e:	48 85 c0             	test   %rax,%rax
  802071:	75 07                	jne    80207a <fd_lookup+0x7e>
  802073:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802078:	eb 10                	jmp    80208a <fd_lookup+0x8e>
  80207a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80207e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802082:	48 89 10             	mov    %rdx,(%rax)
  802085:	b8 00 00 00 00       	mov    $0x0,%eax
  80208a:	c9                   	leaveq 
  80208b:	c3                   	retq   

000000000080208c <fd_close>:
  80208c:	55                   	push   %rbp
  80208d:	48 89 e5             	mov    %rsp,%rbp
  802090:	48 83 ec 30          	sub    $0x30,%rsp
  802094:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802098:	89 f0                	mov    %esi,%eax
  80209a:	88 45 d4             	mov    %al,-0x2c(%rbp)
  80209d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020a1:	48 89 c7             	mov    %rax,%rdi
  8020a4:	48 b8 16 1f 80 00 00 	movabs $0x801f16,%rax
  8020ab:	00 00 00 
  8020ae:	ff d0                	callq  *%rax
  8020b0:	89 c2                	mov    %eax,%edx
  8020b2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8020b6:	48 89 c6             	mov    %rax,%rsi
  8020b9:	89 d7                	mov    %edx,%edi
  8020bb:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  8020c2:	00 00 00 
  8020c5:	ff d0                	callq  *%rax
  8020c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020ca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020ce:	78 0a                	js     8020da <fd_close+0x4e>
  8020d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020d4:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8020d8:	74 12                	je     8020ec <fd_close+0x60>
  8020da:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8020de:	74 05                	je     8020e5 <fd_close+0x59>
  8020e0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020e3:	eb 70                	jmp    802155 <fd_close+0xc9>
  8020e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8020ea:	eb 69                	jmp    802155 <fd_close+0xc9>
  8020ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020f0:	8b 00                	mov    (%rax),%eax
  8020f2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8020f6:	48 89 d6             	mov    %rdx,%rsi
  8020f9:	89 c7                	mov    %eax,%edi
  8020fb:	48 b8 57 21 80 00 00 	movabs $0x802157,%rax
  802102:	00 00 00 
  802105:	ff d0                	callq  *%rax
  802107:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80210a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80210e:	78 2a                	js     80213a <fd_close+0xae>
  802110:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802114:	48 8b 40 20          	mov    0x20(%rax),%rax
  802118:	48 85 c0             	test   %rax,%rax
  80211b:	74 16                	je     802133 <fd_close+0xa7>
  80211d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802121:	48 8b 40 20          	mov    0x20(%rax),%rax
  802125:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802129:	48 89 d7             	mov    %rdx,%rdi
  80212c:	ff d0                	callq  *%rax
  80212e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802131:	eb 07                	jmp    80213a <fd_close+0xae>
  802133:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80213a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80213e:	48 89 c6             	mov    %rax,%rsi
  802141:	bf 00 00 00 00       	mov    $0x0,%edi
  802146:	48 b8 cc 1b 80 00 00 	movabs $0x801bcc,%rax
  80214d:	00 00 00 
  802150:	ff d0                	callq  *%rax
  802152:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802155:	c9                   	leaveq 
  802156:	c3                   	retq   

0000000000802157 <dev_lookup>:
  802157:	55                   	push   %rbp
  802158:	48 89 e5             	mov    %rsp,%rbp
  80215b:	48 83 ec 20          	sub    $0x20,%rsp
  80215f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802162:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802166:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80216d:	eb 41                	jmp    8021b0 <dev_lookup+0x59>
  80216f:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802176:	00 00 00 
  802179:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80217c:	48 63 d2             	movslq %edx,%rdx
  80217f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802183:	8b 00                	mov    (%rax),%eax
  802185:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802188:	75 22                	jne    8021ac <dev_lookup+0x55>
  80218a:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802191:	00 00 00 
  802194:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802197:	48 63 d2             	movslq %edx,%rdx
  80219a:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80219e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021a2:	48 89 10             	mov    %rdx,(%rax)
  8021a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8021aa:	eb 60                	jmp    80220c <dev_lookup+0xb5>
  8021ac:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8021b0:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8021b7:	00 00 00 
  8021ba:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8021bd:	48 63 d2             	movslq %edx,%rdx
  8021c0:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021c4:	48 85 c0             	test   %rax,%rax
  8021c7:	75 a6                	jne    80216f <dev_lookup+0x18>
  8021c9:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8021d0:	00 00 00 
  8021d3:	48 8b 00             	mov    (%rax),%rax
  8021d6:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8021dc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8021df:	89 c6                	mov    %eax,%esi
  8021e1:	48 bf b8 48 80 00 00 	movabs $0x8048b8,%rdi
  8021e8:	00 00 00 
  8021eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8021f0:	48 b9 5a 06 80 00 00 	movabs $0x80065a,%rcx
  8021f7:	00 00 00 
  8021fa:	ff d1                	callq  *%rcx
  8021fc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802200:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802207:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80220c:	c9                   	leaveq 
  80220d:	c3                   	retq   

000000000080220e <close>:
  80220e:	55                   	push   %rbp
  80220f:	48 89 e5             	mov    %rsp,%rbp
  802212:	48 83 ec 20          	sub    $0x20,%rsp
  802216:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802219:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80221d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802220:	48 89 d6             	mov    %rdx,%rsi
  802223:	89 c7                	mov    %eax,%edi
  802225:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  80222c:	00 00 00 
  80222f:	ff d0                	callq  *%rax
  802231:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802234:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802238:	79 05                	jns    80223f <close+0x31>
  80223a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80223d:	eb 18                	jmp    802257 <close+0x49>
  80223f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802243:	be 01 00 00 00       	mov    $0x1,%esi
  802248:	48 89 c7             	mov    %rax,%rdi
  80224b:	48 b8 8c 20 80 00 00 	movabs $0x80208c,%rax
  802252:	00 00 00 
  802255:	ff d0                	callq  *%rax
  802257:	c9                   	leaveq 
  802258:	c3                   	retq   

0000000000802259 <close_all>:
  802259:	55                   	push   %rbp
  80225a:	48 89 e5             	mov    %rsp,%rbp
  80225d:	48 83 ec 10          	sub    $0x10,%rsp
  802261:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802268:	eb 15                	jmp    80227f <close_all+0x26>
  80226a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80226d:	89 c7                	mov    %eax,%edi
  80226f:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802276:	00 00 00 
  802279:	ff d0                	callq  *%rax
  80227b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80227f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802283:	7e e5                	jle    80226a <close_all+0x11>
  802285:	90                   	nop
  802286:	c9                   	leaveq 
  802287:	c3                   	retq   

0000000000802288 <dup>:
  802288:	55                   	push   %rbp
  802289:	48 89 e5             	mov    %rsp,%rbp
  80228c:	48 83 ec 40          	sub    $0x40,%rsp
  802290:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802293:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802296:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80229a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80229d:	48 89 d6             	mov    %rdx,%rsi
  8022a0:	89 c7                	mov    %eax,%edi
  8022a2:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  8022a9:	00 00 00 
  8022ac:	ff d0                	callq  *%rax
  8022ae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022b1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022b5:	79 08                	jns    8022bf <dup+0x37>
  8022b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022ba:	e9 70 01 00 00       	jmpq   80242f <dup+0x1a7>
  8022bf:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022c2:	89 c7                	mov    %eax,%edi
  8022c4:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  8022cb:	00 00 00 
  8022ce:	ff d0                	callq  *%rax
  8022d0:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022d3:	48 98                	cltq   
  8022d5:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8022db:	48 c1 e0 0c          	shl    $0xc,%rax
  8022df:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8022e3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022e7:	48 89 c7             	mov    %rax,%rdi
  8022ea:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  8022f1:	00 00 00 
  8022f4:	ff d0                	callq  *%rax
  8022f6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8022fa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022fe:	48 89 c7             	mov    %rax,%rdi
  802301:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  802308:	00 00 00 
  80230b:	ff d0                	callq  *%rax
  80230d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802311:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802315:	48 c1 e8 15          	shr    $0x15,%rax
  802319:	48 89 c2             	mov    %rax,%rdx
  80231c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802323:	01 00 00 
  802326:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80232a:	83 e0 01             	and    $0x1,%eax
  80232d:	48 85 c0             	test   %rax,%rax
  802330:	74 71                	je     8023a3 <dup+0x11b>
  802332:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802336:	48 c1 e8 0c          	shr    $0xc,%rax
  80233a:	48 89 c2             	mov    %rax,%rdx
  80233d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802344:	01 00 00 
  802347:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80234b:	83 e0 01             	and    $0x1,%eax
  80234e:	48 85 c0             	test   %rax,%rax
  802351:	74 50                	je     8023a3 <dup+0x11b>
  802353:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802357:	48 c1 e8 0c          	shr    $0xc,%rax
  80235b:	48 89 c2             	mov    %rax,%rdx
  80235e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802365:	01 00 00 
  802368:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80236c:	25 07 0e 00 00       	and    $0xe07,%eax
  802371:	89 c1                	mov    %eax,%ecx
  802373:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802377:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80237b:	41 89 c8             	mov    %ecx,%r8d
  80237e:	48 89 d1             	mov    %rdx,%rcx
  802381:	ba 00 00 00 00       	mov    $0x0,%edx
  802386:	48 89 c6             	mov    %rax,%rsi
  802389:	bf 00 00 00 00       	mov    $0x0,%edi
  80238e:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  802395:	00 00 00 
  802398:	ff d0                	callq  *%rax
  80239a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80239d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023a1:	78 55                	js     8023f8 <dup+0x170>
  8023a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023a7:	48 c1 e8 0c          	shr    $0xc,%rax
  8023ab:	48 89 c2             	mov    %rax,%rdx
  8023ae:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023b5:	01 00 00 
  8023b8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023bc:	25 07 0e 00 00       	and    $0xe07,%eax
  8023c1:	89 c1                	mov    %eax,%ecx
  8023c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023c7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023cb:	41 89 c8             	mov    %ecx,%r8d
  8023ce:	48 89 d1             	mov    %rdx,%rcx
  8023d1:	ba 00 00 00 00       	mov    $0x0,%edx
  8023d6:	48 89 c6             	mov    %rax,%rsi
  8023d9:	bf 00 00 00 00       	mov    $0x0,%edi
  8023de:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  8023e5:	00 00 00 
  8023e8:	ff d0                	callq  *%rax
  8023ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023f1:	78 08                	js     8023fb <dup+0x173>
  8023f3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8023f6:	eb 37                	jmp    80242f <dup+0x1a7>
  8023f8:	90                   	nop
  8023f9:	eb 01                	jmp    8023fc <dup+0x174>
  8023fb:	90                   	nop
  8023fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802400:	48 89 c6             	mov    %rax,%rsi
  802403:	bf 00 00 00 00       	mov    $0x0,%edi
  802408:	48 b8 cc 1b 80 00 00 	movabs $0x801bcc,%rax
  80240f:	00 00 00 
  802412:	ff d0                	callq  *%rax
  802414:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802418:	48 89 c6             	mov    %rax,%rsi
  80241b:	bf 00 00 00 00       	mov    $0x0,%edi
  802420:	48 b8 cc 1b 80 00 00 	movabs $0x801bcc,%rax
  802427:	00 00 00 
  80242a:	ff d0                	callq  *%rax
  80242c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80242f:	c9                   	leaveq 
  802430:	c3                   	retq   

0000000000802431 <read>:
  802431:	55                   	push   %rbp
  802432:	48 89 e5             	mov    %rsp,%rbp
  802435:	48 83 ec 40          	sub    $0x40,%rsp
  802439:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80243c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802440:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802444:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802448:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80244b:	48 89 d6             	mov    %rdx,%rsi
  80244e:	89 c7                	mov    %eax,%edi
  802450:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  802457:	00 00 00 
  80245a:	ff d0                	callq  *%rax
  80245c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80245f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802463:	78 24                	js     802489 <read+0x58>
  802465:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802469:	8b 00                	mov    (%rax),%eax
  80246b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80246f:	48 89 d6             	mov    %rdx,%rsi
  802472:	89 c7                	mov    %eax,%edi
  802474:	48 b8 57 21 80 00 00 	movabs $0x802157,%rax
  80247b:	00 00 00 
  80247e:	ff d0                	callq  *%rax
  802480:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802483:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802487:	79 05                	jns    80248e <read+0x5d>
  802489:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80248c:	eb 76                	jmp    802504 <read+0xd3>
  80248e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802492:	8b 40 08             	mov    0x8(%rax),%eax
  802495:	83 e0 03             	and    $0x3,%eax
  802498:	83 f8 01             	cmp    $0x1,%eax
  80249b:	75 3a                	jne    8024d7 <read+0xa6>
  80249d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8024a4:	00 00 00 
  8024a7:	48 8b 00             	mov    (%rax),%rax
  8024aa:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8024b0:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8024b3:	89 c6                	mov    %eax,%esi
  8024b5:	48 bf d7 48 80 00 00 	movabs $0x8048d7,%rdi
  8024bc:	00 00 00 
  8024bf:	b8 00 00 00 00       	mov    $0x0,%eax
  8024c4:	48 b9 5a 06 80 00 00 	movabs $0x80065a,%rcx
  8024cb:	00 00 00 
  8024ce:	ff d1                	callq  *%rcx
  8024d0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024d5:	eb 2d                	jmp    802504 <read+0xd3>
  8024d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024db:	48 8b 40 10          	mov    0x10(%rax),%rax
  8024df:	48 85 c0             	test   %rax,%rax
  8024e2:	75 07                	jne    8024eb <read+0xba>
  8024e4:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8024e9:	eb 19                	jmp    802504 <read+0xd3>
  8024eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024ef:	48 8b 40 10          	mov    0x10(%rax),%rax
  8024f3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024f7:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8024fb:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8024ff:	48 89 cf             	mov    %rcx,%rdi
  802502:	ff d0                	callq  *%rax
  802504:	c9                   	leaveq 
  802505:	c3                   	retq   

0000000000802506 <readn>:
  802506:	55                   	push   %rbp
  802507:	48 89 e5             	mov    %rsp,%rbp
  80250a:	48 83 ec 30          	sub    $0x30,%rsp
  80250e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802511:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802515:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802519:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802520:	eb 47                	jmp    802569 <readn+0x63>
  802522:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802525:	48 98                	cltq   
  802527:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80252b:	48 29 c2             	sub    %rax,%rdx
  80252e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802531:	48 63 c8             	movslq %eax,%rcx
  802534:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802538:	48 01 c1             	add    %rax,%rcx
  80253b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80253e:	48 89 ce             	mov    %rcx,%rsi
  802541:	89 c7                	mov    %eax,%edi
  802543:	48 b8 31 24 80 00 00 	movabs $0x802431,%rax
  80254a:	00 00 00 
  80254d:	ff d0                	callq  *%rax
  80254f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802552:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802556:	79 05                	jns    80255d <readn+0x57>
  802558:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80255b:	eb 1d                	jmp    80257a <readn+0x74>
  80255d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802561:	74 13                	je     802576 <readn+0x70>
  802563:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802566:	01 45 fc             	add    %eax,-0x4(%rbp)
  802569:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80256c:	48 98                	cltq   
  80256e:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802572:	72 ae                	jb     802522 <readn+0x1c>
  802574:	eb 01                	jmp    802577 <readn+0x71>
  802576:	90                   	nop
  802577:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80257a:	c9                   	leaveq 
  80257b:	c3                   	retq   

000000000080257c <write>:
  80257c:	55                   	push   %rbp
  80257d:	48 89 e5             	mov    %rsp,%rbp
  802580:	48 83 ec 40          	sub    $0x40,%rsp
  802584:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802587:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80258b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80258f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802593:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802596:	48 89 d6             	mov    %rdx,%rsi
  802599:	89 c7                	mov    %eax,%edi
  80259b:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  8025a2:	00 00 00 
  8025a5:	ff d0                	callq  *%rax
  8025a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025aa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025ae:	78 24                	js     8025d4 <write+0x58>
  8025b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025b4:	8b 00                	mov    (%rax),%eax
  8025b6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025ba:	48 89 d6             	mov    %rdx,%rsi
  8025bd:	89 c7                	mov    %eax,%edi
  8025bf:	48 b8 57 21 80 00 00 	movabs $0x802157,%rax
  8025c6:	00 00 00 
  8025c9:	ff d0                	callq  *%rax
  8025cb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025ce:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025d2:	79 05                	jns    8025d9 <write+0x5d>
  8025d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025d7:	eb 75                	jmp    80264e <write+0xd2>
  8025d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025dd:	8b 40 08             	mov    0x8(%rax),%eax
  8025e0:	83 e0 03             	and    $0x3,%eax
  8025e3:	85 c0                	test   %eax,%eax
  8025e5:	75 3a                	jne    802621 <write+0xa5>
  8025e7:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8025ee:	00 00 00 
  8025f1:	48 8b 00             	mov    (%rax),%rax
  8025f4:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025fa:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025fd:	89 c6                	mov    %eax,%esi
  8025ff:	48 bf f3 48 80 00 00 	movabs $0x8048f3,%rdi
  802606:	00 00 00 
  802609:	b8 00 00 00 00       	mov    $0x0,%eax
  80260e:	48 b9 5a 06 80 00 00 	movabs $0x80065a,%rcx
  802615:	00 00 00 
  802618:	ff d1                	callq  *%rcx
  80261a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80261f:	eb 2d                	jmp    80264e <write+0xd2>
  802621:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802625:	48 8b 40 18          	mov    0x18(%rax),%rax
  802629:	48 85 c0             	test   %rax,%rax
  80262c:	75 07                	jne    802635 <write+0xb9>
  80262e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802633:	eb 19                	jmp    80264e <write+0xd2>
  802635:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802639:	48 8b 40 18          	mov    0x18(%rax),%rax
  80263d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802641:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802645:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802649:	48 89 cf             	mov    %rcx,%rdi
  80264c:	ff d0                	callq  *%rax
  80264e:	c9                   	leaveq 
  80264f:	c3                   	retq   

0000000000802650 <seek>:
  802650:	55                   	push   %rbp
  802651:	48 89 e5             	mov    %rsp,%rbp
  802654:	48 83 ec 18          	sub    $0x18,%rsp
  802658:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80265b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80265e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802662:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802665:	48 89 d6             	mov    %rdx,%rsi
  802668:	89 c7                	mov    %eax,%edi
  80266a:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  802671:	00 00 00 
  802674:	ff d0                	callq  *%rax
  802676:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802679:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80267d:	79 05                	jns    802684 <seek+0x34>
  80267f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802682:	eb 0f                	jmp    802693 <seek+0x43>
  802684:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802688:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80268b:	89 50 04             	mov    %edx,0x4(%rax)
  80268e:	b8 00 00 00 00       	mov    $0x0,%eax
  802693:	c9                   	leaveq 
  802694:	c3                   	retq   

0000000000802695 <ftruncate>:
  802695:	55                   	push   %rbp
  802696:	48 89 e5             	mov    %rsp,%rbp
  802699:	48 83 ec 30          	sub    $0x30,%rsp
  80269d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8026a0:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8026a3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8026a7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8026aa:	48 89 d6             	mov    %rdx,%rsi
  8026ad:	89 c7                	mov    %eax,%edi
  8026af:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  8026b6:	00 00 00 
  8026b9:	ff d0                	callq  *%rax
  8026bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026be:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026c2:	78 24                	js     8026e8 <ftruncate+0x53>
  8026c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026c8:	8b 00                	mov    (%rax),%eax
  8026ca:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026ce:	48 89 d6             	mov    %rdx,%rsi
  8026d1:	89 c7                	mov    %eax,%edi
  8026d3:	48 b8 57 21 80 00 00 	movabs $0x802157,%rax
  8026da:	00 00 00 
  8026dd:	ff d0                	callq  *%rax
  8026df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026e6:	79 05                	jns    8026ed <ftruncate+0x58>
  8026e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026eb:	eb 72                	jmp    80275f <ftruncate+0xca>
  8026ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026f1:	8b 40 08             	mov    0x8(%rax),%eax
  8026f4:	83 e0 03             	and    $0x3,%eax
  8026f7:	85 c0                	test   %eax,%eax
  8026f9:	75 3a                	jne    802735 <ftruncate+0xa0>
  8026fb:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802702:	00 00 00 
  802705:	48 8b 00             	mov    (%rax),%rax
  802708:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80270e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802711:	89 c6                	mov    %eax,%esi
  802713:	48 bf 10 49 80 00 00 	movabs $0x804910,%rdi
  80271a:	00 00 00 
  80271d:	b8 00 00 00 00       	mov    $0x0,%eax
  802722:	48 b9 5a 06 80 00 00 	movabs $0x80065a,%rcx
  802729:	00 00 00 
  80272c:	ff d1                	callq  *%rcx
  80272e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802733:	eb 2a                	jmp    80275f <ftruncate+0xca>
  802735:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802739:	48 8b 40 30          	mov    0x30(%rax),%rax
  80273d:	48 85 c0             	test   %rax,%rax
  802740:	75 07                	jne    802749 <ftruncate+0xb4>
  802742:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802747:	eb 16                	jmp    80275f <ftruncate+0xca>
  802749:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80274d:	48 8b 40 30          	mov    0x30(%rax),%rax
  802751:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802755:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802758:	89 ce                	mov    %ecx,%esi
  80275a:	48 89 d7             	mov    %rdx,%rdi
  80275d:	ff d0                	callq  *%rax
  80275f:	c9                   	leaveq 
  802760:	c3                   	retq   

0000000000802761 <fstat>:
  802761:	55                   	push   %rbp
  802762:	48 89 e5             	mov    %rsp,%rbp
  802765:	48 83 ec 30          	sub    $0x30,%rsp
  802769:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80276c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802770:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802774:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802777:	48 89 d6             	mov    %rdx,%rsi
  80277a:	89 c7                	mov    %eax,%edi
  80277c:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  802783:	00 00 00 
  802786:	ff d0                	callq  *%rax
  802788:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80278b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80278f:	78 24                	js     8027b5 <fstat+0x54>
  802791:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802795:	8b 00                	mov    (%rax),%eax
  802797:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80279b:	48 89 d6             	mov    %rdx,%rsi
  80279e:	89 c7                	mov    %eax,%edi
  8027a0:	48 b8 57 21 80 00 00 	movabs $0x802157,%rax
  8027a7:	00 00 00 
  8027aa:	ff d0                	callq  *%rax
  8027ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027b3:	79 05                	jns    8027ba <fstat+0x59>
  8027b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027b8:	eb 5e                	jmp    802818 <fstat+0xb7>
  8027ba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027be:	48 8b 40 28          	mov    0x28(%rax),%rax
  8027c2:	48 85 c0             	test   %rax,%rax
  8027c5:	75 07                	jne    8027ce <fstat+0x6d>
  8027c7:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8027cc:	eb 4a                	jmp    802818 <fstat+0xb7>
  8027ce:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027d2:	c6 00 00             	movb   $0x0,(%rax)
  8027d5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027d9:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8027e0:	00 00 00 
  8027e3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027e7:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8027ee:	00 00 00 
  8027f1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8027f5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027f9:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802800:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802804:	48 8b 40 28          	mov    0x28(%rax),%rax
  802808:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80280c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802810:	48 89 ce             	mov    %rcx,%rsi
  802813:	48 89 d7             	mov    %rdx,%rdi
  802816:	ff d0                	callq  *%rax
  802818:	c9                   	leaveq 
  802819:	c3                   	retq   

000000000080281a <stat>:
  80281a:	55                   	push   %rbp
  80281b:	48 89 e5             	mov    %rsp,%rbp
  80281e:	48 83 ec 20          	sub    $0x20,%rsp
  802822:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802826:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80282a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80282e:	be 00 00 00 00       	mov    $0x0,%esi
  802833:	48 89 c7             	mov    %rax,%rdi
  802836:	48 b8 0a 29 80 00 00 	movabs $0x80290a,%rax
  80283d:	00 00 00 
  802840:	ff d0                	callq  *%rax
  802842:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802845:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802849:	79 05                	jns    802850 <stat+0x36>
  80284b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80284e:	eb 2f                	jmp    80287f <stat+0x65>
  802850:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802854:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802857:	48 89 d6             	mov    %rdx,%rsi
  80285a:	89 c7                	mov    %eax,%edi
  80285c:	48 b8 61 27 80 00 00 	movabs $0x802761,%rax
  802863:	00 00 00 
  802866:	ff d0                	callq  *%rax
  802868:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80286b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80286e:	89 c7                	mov    %eax,%edi
  802870:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802877:	00 00 00 
  80287a:	ff d0                	callq  *%rax
  80287c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80287f:	c9                   	leaveq 
  802880:	c3                   	retq   

0000000000802881 <fsipc>:
  802881:	55                   	push   %rbp
  802882:	48 89 e5             	mov    %rsp,%rbp
  802885:	48 83 ec 10          	sub    $0x10,%rsp
  802889:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80288c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802890:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802897:	00 00 00 
  80289a:	8b 00                	mov    (%rax),%eax
  80289c:	85 c0                	test   %eax,%eax
  80289e:	75 1f                	jne    8028bf <fsipc+0x3e>
  8028a0:	bf 01 00 00 00       	mov    $0x1,%edi
  8028a5:	48 b8 8f 41 80 00 00 	movabs $0x80418f,%rax
  8028ac:	00 00 00 
  8028af:	ff d0                	callq  *%rax
  8028b1:	89 c2                	mov    %eax,%edx
  8028b3:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8028ba:	00 00 00 
  8028bd:	89 10                	mov    %edx,(%rax)
  8028bf:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8028c6:	00 00 00 
  8028c9:	8b 00                	mov    (%rax),%eax
  8028cb:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8028ce:	b9 07 00 00 00       	mov    $0x7,%ecx
  8028d3:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8028da:	00 00 00 
  8028dd:	89 c7                	mov    %eax,%edi
  8028df:	48 b8 85 40 80 00 00 	movabs $0x804085,%rax
  8028e6:	00 00 00 
  8028e9:	ff d0                	callq  *%rax
  8028eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028ef:	ba 00 00 00 00       	mov    $0x0,%edx
  8028f4:	48 89 c6             	mov    %rax,%rsi
  8028f7:	bf 00 00 00 00       	mov    $0x0,%edi
  8028fc:	48 b8 c4 3f 80 00 00 	movabs $0x803fc4,%rax
  802903:	00 00 00 
  802906:	ff d0                	callq  *%rax
  802908:	c9                   	leaveq 
  802909:	c3                   	retq   

000000000080290a <open>:
  80290a:	55                   	push   %rbp
  80290b:	48 89 e5             	mov    %rsp,%rbp
  80290e:	48 83 ec 20          	sub    $0x20,%rsp
  802912:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802916:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802919:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80291d:	48 89 c7             	mov    %rax,%rdi
  802920:	48 b8 7e 11 80 00 00 	movabs $0x80117e,%rax
  802927:	00 00 00 
  80292a:	ff d0                	callq  *%rax
  80292c:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802931:	7e 0a                	jle    80293d <open+0x33>
  802933:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802938:	e9 a5 00 00 00       	jmpq   8029e2 <open+0xd8>
  80293d:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802941:	48 89 c7             	mov    %rax,%rdi
  802944:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  80294b:	00 00 00 
  80294e:	ff d0                	callq  *%rax
  802950:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802953:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802957:	79 08                	jns    802961 <open+0x57>
  802959:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80295c:	e9 81 00 00 00       	jmpq   8029e2 <open+0xd8>
  802961:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802965:	48 89 c6             	mov    %rax,%rsi
  802968:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  80296f:	00 00 00 
  802972:	48 b8 ea 11 80 00 00 	movabs $0x8011ea,%rax
  802979:	00 00 00 
  80297c:	ff d0                	callq  *%rax
  80297e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802985:	00 00 00 
  802988:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80298b:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802991:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802995:	48 89 c6             	mov    %rax,%rsi
  802998:	bf 01 00 00 00       	mov    $0x1,%edi
  80299d:	48 b8 81 28 80 00 00 	movabs $0x802881,%rax
  8029a4:	00 00 00 
  8029a7:	ff d0                	callq  *%rax
  8029a9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029ac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029b0:	79 1d                	jns    8029cf <open+0xc5>
  8029b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029b6:	be 00 00 00 00       	mov    $0x0,%esi
  8029bb:	48 89 c7             	mov    %rax,%rdi
  8029be:	48 b8 8c 20 80 00 00 	movabs $0x80208c,%rax
  8029c5:	00 00 00 
  8029c8:	ff d0                	callq  *%rax
  8029ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029cd:	eb 13                	jmp    8029e2 <open+0xd8>
  8029cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029d3:	48 89 c7             	mov    %rax,%rdi
  8029d6:	48 b8 16 1f 80 00 00 	movabs $0x801f16,%rax
  8029dd:	00 00 00 
  8029e0:	ff d0                	callq  *%rax
  8029e2:	c9                   	leaveq 
  8029e3:	c3                   	retq   

00000000008029e4 <devfile_flush>:
  8029e4:	55                   	push   %rbp
  8029e5:	48 89 e5             	mov    %rsp,%rbp
  8029e8:	48 83 ec 10          	sub    $0x10,%rsp
  8029ec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8029f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8029f4:	8b 50 0c             	mov    0xc(%rax),%edx
  8029f7:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029fe:	00 00 00 
  802a01:	89 10                	mov    %edx,(%rax)
  802a03:	be 00 00 00 00       	mov    $0x0,%esi
  802a08:	bf 06 00 00 00       	mov    $0x6,%edi
  802a0d:	48 b8 81 28 80 00 00 	movabs $0x802881,%rax
  802a14:	00 00 00 
  802a17:	ff d0                	callq  *%rax
  802a19:	c9                   	leaveq 
  802a1a:	c3                   	retq   

0000000000802a1b <devfile_read>:
  802a1b:	55                   	push   %rbp
  802a1c:	48 89 e5             	mov    %rsp,%rbp
  802a1f:	48 83 ec 30          	sub    $0x30,%rsp
  802a23:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a27:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a2b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802a2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a33:	8b 50 0c             	mov    0xc(%rax),%edx
  802a36:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a3d:	00 00 00 
  802a40:	89 10                	mov    %edx,(%rax)
  802a42:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a49:	00 00 00 
  802a4c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802a50:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802a54:	be 00 00 00 00       	mov    $0x0,%esi
  802a59:	bf 03 00 00 00       	mov    $0x3,%edi
  802a5e:	48 b8 81 28 80 00 00 	movabs $0x802881,%rax
  802a65:	00 00 00 
  802a68:	ff d0                	callq  *%rax
  802a6a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a6d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a71:	79 08                	jns    802a7b <devfile_read+0x60>
  802a73:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a76:	e9 a4 00 00 00       	jmpq   802b1f <devfile_read+0x104>
  802a7b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a7e:	48 98                	cltq   
  802a80:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802a84:	76 35                	jbe    802abb <devfile_read+0xa0>
  802a86:	48 b9 36 49 80 00 00 	movabs $0x804936,%rcx
  802a8d:	00 00 00 
  802a90:	48 ba 3d 49 80 00 00 	movabs $0x80493d,%rdx
  802a97:	00 00 00 
  802a9a:	be 89 00 00 00       	mov    $0x89,%esi
  802a9f:	48 bf 52 49 80 00 00 	movabs $0x804952,%rdi
  802aa6:	00 00 00 
  802aa9:	b8 00 00 00 00       	mov    $0x0,%eax
  802aae:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  802ab5:	00 00 00 
  802ab8:	41 ff d0             	callq  *%r8
  802abb:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802ac2:	7e 35                	jle    802af9 <devfile_read+0xde>
  802ac4:	48 b9 60 49 80 00 00 	movabs $0x804960,%rcx
  802acb:	00 00 00 
  802ace:	48 ba 3d 49 80 00 00 	movabs $0x80493d,%rdx
  802ad5:	00 00 00 
  802ad8:	be 8a 00 00 00       	mov    $0x8a,%esi
  802add:	48 bf 52 49 80 00 00 	movabs $0x804952,%rdi
  802ae4:	00 00 00 
  802ae7:	b8 00 00 00 00       	mov    $0x0,%eax
  802aec:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  802af3:	00 00 00 
  802af6:	41 ff d0             	callq  *%r8
  802af9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802afc:	48 63 d0             	movslq %eax,%rdx
  802aff:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b03:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802b0a:	00 00 00 
  802b0d:	48 89 c7             	mov    %rax,%rdi
  802b10:	48 b8 0f 15 80 00 00 	movabs $0x80150f,%rax
  802b17:	00 00 00 
  802b1a:	ff d0                	callq  *%rax
  802b1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b1f:	c9                   	leaveq 
  802b20:	c3                   	retq   

0000000000802b21 <devfile_write>:
  802b21:	55                   	push   %rbp
  802b22:	48 89 e5             	mov    %rsp,%rbp
  802b25:	48 83 ec 40          	sub    $0x40,%rsp
  802b29:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802b2d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b31:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b35:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802b39:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802b3d:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802b44:	00 
  802b45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b49:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802b4d:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802b52:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802b56:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b5a:	8b 50 0c             	mov    0xc(%rax),%edx
  802b5d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b64:	00 00 00 
  802b67:	89 10                	mov    %edx,(%rax)
  802b69:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b70:	00 00 00 
  802b73:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b77:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802b7b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b7f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b83:	48 89 c6             	mov    %rax,%rsi
  802b86:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802b8d:	00 00 00 
  802b90:	48 b8 0f 15 80 00 00 	movabs $0x80150f,%rax
  802b97:	00 00 00 
  802b9a:	ff d0                	callq  *%rax
  802b9c:	be 00 00 00 00       	mov    $0x0,%esi
  802ba1:	bf 04 00 00 00       	mov    $0x4,%edi
  802ba6:	48 b8 81 28 80 00 00 	movabs $0x802881,%rax
  802bad:	00 00 00 
  802bb0:	ff d0                	callq  *%rax
  802bb2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802bb5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802bb9:	79 05                	jns    802bc0 <devfile_write+0x9f>
  802bbb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bbe:	eb 43                	jmp    802c03 <devfile_write+0xe2>
  802bc0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bc3:	48 98                	cltq   
  802bc5:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802bc9:	76 35                	jbe    802c00 <devfile_write+0xdf>
  802bcb:	48 b9 36 49 80 00 00 	movabs $0x804936,%rcx
  802bd2:	00 00 00 
  802bd5:	48 ba 3d 49 80 00 00 	movabs $0x80493d,%rdx
  802bdc:	00 00 00 
  802bdf:	be a8 00 00 00       	mov    $0xa8,%esi
  802be4:	48 bf 52 49 80 00 00 	movabs $0x804952,%rdi
  802beb:	00 00 00 
  802bee:	b8 00 00 00 00       	mov    $0x0,%eax
  802bf3:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  802bfa:	00 00 00 
  802bfd:	41 ff d0             	callq  *%r8
  802c00:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c03:	c9                   	leaveq 
  802c04:	c3                   	retq   

0000000000802c05 <devfile_stat>:
  802c05:	55                   	push   %rbp
  802c06:	48 89 e5             	mov    %rsp,%rbp
  802c09:	48 83 ec 20          	sub    $0x20,%rsp
  802c0d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c11:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c19:	8b 50 0c             	mov    0xc(%rax),%edx
  802c1c:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c23:	00 00 00 
  802c26:	89 10                	mov    %edx,(%rax)
  802c28:	be 00 00 00 00       	mov    $0x0,%esi
  802c2d:	bf 05 00 00 00       	mov    $0x5,%edi
  802c32:	48 b8 81 28 80 00 00 	movabs $0x802881,%rax
  802c39:	00 00 00 
  802c3c:	ff d0                	callq  *%rax
  802c3e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c41:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c45:	79 05                	jns    802c4c <devfile_stat+0x47>
  802c47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c4a:	eb 56                	jmp    802ca2 <devfile_stat+0x9d>
  802c4c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c50:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802c57:	00 00 00 
  802c5a:	48 89 c7             	mov    %rax,%rdi
  802c5d:	48 b8 ea 11 80 00 00 	movabs $0x8011ea,%rax
  802c64:	00 00 00 
  802c67:	ff d0                	callq  *%rax
  802c69:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c70:	00 00 00 
  802c73:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802c79:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c7d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802c83:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c8a:	00 00 00 
  802c8d:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802c93:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c97:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802c9d:	b8 00 00 00 00       	mov    $0x0,%eax
  802ca2:	c9                   	leaveq 
  802ca3:	c3                   	retq   

0000000000802ca4 <devfile_trunc>:
  802ca4:	55                   	push   %rbp
  802ca5:	48 89 e5             	mov    %rsp,%rbp
  802ca8:	48 83 ec 10          	sub    $0x10,%rsp
  802cac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802cb0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802cb3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802cb7:	8b 50 0c             	mov    0xc(%rax),%edx
  802cba:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802cc1:	00 00 00 
  802cc4:	89 10                	mov    %edx,(%rax)
  802cc6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ccd:	00 00 00 
  802cd0:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802cd3:	89 50 04             	mov    %edx,0x4(%rax)
  802cd6:	be 00 00 00 00       	mov    $0x0,%esi
  802cdb:	bf 02 00 00 00       	mov    $0x2,%edi
  802ce0:	48 b8 81 28 80 00 00 	movabs $0x802881,%rax
  802ce7:	00 00 00 
  802cea:	ff d0                	callq  *%rax
  802cec:	c9                   	leaveq 
  802ced:	c3                   	retq   

0000000000802cee <remove>:
  802cee:	55                   	push   %rbp
  802cef:	48 89 e5             	mov    %rsp,%rbp
  802cf2:	48 83 ec 10          	sub    $0x10,%rsp
  802cf6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802cfa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802cfe:	48 89 c7             	mov    %rax,%rdi
  802d01:	48 b8 7e 11 80 00 00 	movabs $0x80117e,%rax
  802d08:	00 00 00 
  802d0b:	ff d0                	callq  *%rax
  802d0d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802d12:	7e 07                	jle    802d1b <remove+0x2d>
  802d14:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802d19:	eb 33                	jmp    802d4e <remove+0x60>
  802d1b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d1f:	48 89 c6             	mov    %rax,%rsi
  802d22:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802d29:	00 00 00 
  802d2c:	48 b8 ea 11 80 00 00 	movabs $0x8011ea,%rax
  802d33:	00 00 00 
  802d36:	ff d0                	callq  *%rax
  802d38:	be 00 00 00 00       	mov    $0x0,%esi
  802d3d:	bf 07 00 00 00       	mov    $0x7,%edi
  802d42:	48 b8 81 28 80 00 00 	movabs $0x802881,%rax
  802d49:	00 00 00 
  802d4c:	ff d0                	callq  *%rax
  802d4e:	c9                   	leaveq 
  802d4f:	c3                   	retq   

0000000000802d50 <sync>:
  802d50:	55                   	push   %rbp
  802d51:	48 89 e5             	mov    %rsp,%rbp
  802d54:	be 00 00 00 00       	mov    $0x0,%esi
  802d59:	bf 08 00 00 00       	mov    $0x8,%edi
  802d5e:	48 b8 81 28 80 00 00 	movabs $0x802881,%rax
  802d65:	00 00 00 
  802d68:	ff d0                	callq  *%rax
  802d6a:	5d                   	pop    %rbp
  802d6b:	c3                   	retq   

0000000000802d6c <copy>:
  802d6c:	55                   	push   %rbp
  802d6d:	48 89 e5             	mov    %rsp,%rbp
  802d70:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802d77:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802d7e:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802d85:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802d8c:	be 00 00 00 00       	mov    $0x0,%esi
  802d91:	48 89 c7             	mov    %rax,%rdi
  802d94:	48 b8 0a 29 80 00 00 	movabs $0x80290a,%rax
  802d9b:	00 00 00 
  802d9e:	ff d0                	callq  *%rax
  802da0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802da3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802da7:	79 28                	jns    802dd1 <copy+0x65>
  802da9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dac:	89 c6                	mov    %eax,%esi
  802dae:	48 bf 6c 49 80 00 00 	movabs $0x80496c,%rdi
  802db5:	00 00 00 
  802db8:	b8 00 00 00 00       	mov    $0x0,%eax
  802dbd:	48 ba 5a 06 80 00 00 	movabs $0x80065a,%rdx
  802dc4:	00 00 00 
  802dc7:	ff d2                	callq  *%rdx
  802dc9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dcc:	e9 76 01 00 00       	jmpq   802f47 <copy+0x1db>
  802dd1:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802dd8:	be 01 01 00 00       	mov    $0x101,%esi
  802ddd:	48 89 c7             	mov    %rax,%rdi
  802de0:	48 b8 0a 29 80 00 00 	movabs $0x80290a,%rax
  802de7:	00 00 00 
  802dea:	ff d0                	callq  *%rax
  802dec:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802def:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802df3:	0f 89 ad 00 00 00    	jns    802ea6 <copy+0x13a>
  802df9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dfc:	89 c6                	mov    %eax,%esi
  802dfe:	48 bf 82 49 80 00 00 	movabs $0x804982,%rdi
  802e05:	00 00 00 
  802e08:	b8 00 00 00 00       	mov    $0x0,%eax
  802e0d:	48 ba 5a 06 80 00 00 	movabs $0x80065a,%rdx
  802e14:	00 00 00 
  802e17:	ff d2                	callq  *%rdx
  802e19:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e1c:	89 c7                	mov    %eax,%edi
  802e1e:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802e25:	00 00 00 
  802e28:	ff d0                	callq  *%rax
  802e2a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e2d:	e9 15 01 00 00       	jmpq   802f47 <copy+0x1db>
  802e32:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e35:	48 63 d0             	movslq %eax,%rdx
  802e38:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e3f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e42:	48 89 ce             	mov    %rcx,%rsi
  802e45:	89 c7                	mov    %eax,%edi
  802e47:	48 b8 7c 25 80 00 00 	movabs $0x80257c,%rax
  802e4e:	00 00 00 
  802e51:	ff d0                	callq  *%rax
  802e53:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802e56:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802e5a:	79 4a                	jns    802ea6 <copy+0x13a>
  802e5c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e5f:	89 c6                	mov    %eax,%esi
  802e61:	48 bf 9c 49 80 00 00 	movabs $0x80499c,%rdi
  802e68:	00 00 00 
  802e6b:	b8 00 00 00 00       	mov    $0x0,%eax
  802e70:	48 ba 5a 06 80 00 00 	movabs $0x80065a,%rdx
  802e77:	00 00 00 
  802e7a:	ff d2                	callq  *%rdx
  802e7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e7f:	89 c7                	mov    %eax,%edi
  802e81:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802e88:	00 00 00 
  802e8b:	ff d0                	callq  *%rax
  802e8d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e90:	89 c7                	mov    %eax,%edi
  802e92:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802e99:	00 00 00 
  802e9c:	ff d0                	callq  *%rax
  802e9e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802ea1:	e9 a1 00 00 00       	jmpq   802f47 <copy+0x1db>
  802ea6:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802ead:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eb0:	ba 00 02 00 00       	mov    $0x200,%edx
  802eb5:	48 89 ce             	mov    %rcx,%rsi
  802eb8:	89 c7                	mov    %eax,%edi
  802eba:	48 b8 31 24 80 00 00 	movabs $0x802431,%rax
  802ec1:	00 00 00 
  802ec4:	ff d0                	callq  *%rax
  802ec6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802ec9:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802ecd:	0f 8f 5f ff ff ff    	jg     802e32 <copy+0xc6>
  802ed3:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802ed7:	79 47                	jns    802f20 <copy+0x1b4>
  802ed9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802edc:	89 c6                	mov    %eax,%esi
  802ede:	48 bf af 49 80 00 00 	movabs $0x8049af,%rdi
  802ee5:	00 00 00 
  802ee8:	b8 00 00 00 00       	mov    $0x0,%eax
  802eed:	48 ba 5a 06 80 00 00 	movabs $0x80065a,%rdx
  802ef4:	00 00 00 
  802ef7:	ff d2                	callq  *%rdx
  802ef9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802efc:	89 c7                	mov    %eax,%edi
  802efe:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802f05:	00 00 00 
  802f08:	ff d0                	callq  *%rax
  802f0a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f0d:	89 c7                	mov    %eax,%edi
  802f0f:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802f16:	00 00 00 
  802f19:	ff d0                	callq  *%rax
  802f1b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802f1e:	eb 27                	jmp    802f47 <copy+0x1db>
  802f20:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f23:	89 c7                	mov    %eax,%edi
  802f25:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802f2c:	00 00 00 
  802f2f:	ff d0                	callq  *%rax
  802f31:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f34:	89 c7                	mov    %eax,%edi
  802f36:	48 b8 0e 22 80 00 00 	movabs $0x80220e,%rax
  802f3d:	00 00 00 
  802f40:	ff d0                	callq  *%rax
  802f42:	b8 00 00 00 00       	mov    $0x0,%eax
  802f47:	c9                   	leaveq 
  802f48:	c3                   	retq   

0000000000802f49 <fd2sockid>:
  802f49:	55                   	push   %rbp
  802f4a:	48 89 e5             	mov    %rsp,%rbp
  802f4d:	48 83 ec 20          	sub    $0x20,%rsp
  802f51:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f54:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802f58:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f5b:	48 89 d6             	mov    %rdx,%rsi
  802f5e:	89 c7                	mov    %eax,%edi
  802f60:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  802f67:	00 00 00 
  802f6a:	ff d0                	callq  *%rax
  802f6c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f6f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f73:	79 05                	jns    802f7a <fd2sockid+0x31>
  802f75:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f78:	eb 24                	jmp    802f9e <fd2sockid+0x55>
  802f7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f7e:	8b 10                	mov    (%rax),%edx
  802f80:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802f87:	00 00 00 
  802f8a:	8b 00                	mov    (%rax),%eax
  802f8c:	39 c2                	cmp    %eax,%edx
  802f8e:	74 07                	je     802f97 <fd2sockid+0x4e>
  802f90:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802f95:	eb 07                	jmp    802f9e <fd2sockid+0x55>
  802f97:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f9b:	8b 40 0c             	mov    0xc(%rax),%eax
  802f9e:	c9                   	leaveq 
  802f9f:	c3                   	retq   

0000000000802fa0 <alloc_sockfd>:
  802fa0:	55                   	push   %rbp
  802fa1:	48 89 e5             	mov    %rsp,%rbp
  802fa4:	48 83 ec 20          	sub    $0x20,%rsp
  802fa8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fab:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802faf:	48 89 c7             	mov    %rax,%rdi
  802fb2:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  802fb9:	00 00 00 
  802fbc:	ff d0                	callq  *%rax
  802fbe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fc1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fc5:	78 26                	js     802fed <alloc_sockfd+0x4d>
  802fc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fcb:	ba 07 04 00 00       	mov    $0x407,%edx
  802fd0:	48 89 c6             	mov    %rax,%rsi
  802fd3:	bf 00 00 00 00       	mov    $0x0,%edi
  802fd8:	48 b8 1a 1b 80 00 00 	movabs $0x801b1a,%rax
  802fdf:	00 00 00 
  802fe2:	ff d0                	callq  *%rax
  802fe4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fe7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802feb:	79 16                	jns    803003 <alloc_sockfd+0x63>
  802fed:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ff0:	89 c7                	mov    %eax,%edi
  802ff2:	48 b8 af 34 80 00 00 	movabs $0x8034af,%rax
  802ff9:	00 00 00 
  802ffc:	ff d0                	callq  *%rax
  802ffe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803001:	eb 3a                	jmp    80303d <alloc_sockfd+0x9d>
  803003:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803007:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  80300e:	00 00 00 
  803011:	8b 12                	mov    (%rdx),%edx
  803013:	89 10                	mov    %edx,(%rax)
  803015:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803019:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803020:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803024:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803027:	89 50 0c             	mov    %edx,0xc(%rax)
  80302a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80302e:	48 89 c7             	mov    %rax,%rdi
  803031:	48 b8 16 1f 80 00 00 	movabs $0x801f16,%rax
  803038:	00 00 00 
  80303b:	ff d0                	callq  *%rax
  80303d:	c9                   	leaveq 
  80303e:	c3                   	retq   

000000000080303f <accept>:
  80303f:	55                   	push   %rbp
  803040:	48 89 e5             	mov    %rsp,%rbp
  803043:	48 83 ec 30          	sub    $0x30,%rsp
  803047:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80304a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80304e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803052:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803055:	89 c7                	mov    %eax,%edi
  803057:	48 b8 49 2f 80 00 00 	movabs $0x802f49,%rax
  80305e:	00 00 00 
  803061:	ff d0                	callq  *%rax
  803063:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803066:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80306a:	79 05                	jns    803071 <accept+0x32>
  80306c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80306f:	eb 3b                	jmp    8030ac <accept+0x6d>
  803071:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803075:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803079:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80307c:	48 89 ce             	mov    %rcx,%rsi
  80307f:	89 c7                	mov    %eax,%edi
  803081:	48 b8 8c 33 80 00 00 	movabs $0x80338c,%rax
  803088:	00 00 00 
  80308b:	ff d0                	callq  *%rax
  80308d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803090:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803094:	79 05                	jns    80309b <accept+0x5c>
  803096:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803099:	eb 11                	jmp    8030ac <accept+0x6d>
  80309b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80309e:	89 c7                	mov    %eax,%edi
  8030a0:	48 b8 a0 2f 80 00 00 	movabs $0x802fa0,%rax
  8030a7:	00 00 00 
  8030aa:	ff d0                	callq  *%rax
  8030ac:	c9                   	leaveq 
  8030ad:	c3                   	retq   

00000000008030ae <bind>:
  8030ae:	55                   	push   %rbp
  8030af:	48 89 e5             	mov    %rsp,%rbp
  8030b2:	48 83 ec 20          	sub    $0x20,%rsp
  8030b6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8030b9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030bd:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8030c0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8030c3:	89 c7                	mov    %eax,%edi
  8030c5:	48 b8 49 2f 80 00 00 	movabs $0x802f49,%rax
  8030cc:	00 00 00 
  8030cf:	ff d0                	callq  *%rax
  8030d1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030d4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030d8:	79 05                	jns    8030df <bind+0x31>
  8030da:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030dd:	eb 1b                	jmp    8030fa <bind+0x4c>
  8030df:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8030e2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8030e6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030e9:	48 89 ce             	mov    %rcx,%rsi
  8030ec:	89 c7                	mov    %eax,%edi
  8030ee:	48 b8 0b 34 80 00 00 	movabs $0x80340b,%rax
  8030f5:	00 00 00 
  8030f8:	ff d0                	callq  *%rax
  8030fa:	c9                   	leaveq 
  8030fb:	c3                   	retq   

00000000008030fc <shutdown>:
  8030fc:	55                   	push   %rbp
  8030fd:	48 89 e5             	mov    %rsp,%rbp
  803100:	48 83 ec 20          	sub    $0x20,%rsp
  803104:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803107:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80310a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80310d:	89 c7                	mov    %eax,%edi
  80310f:	48 b8 49 2f 80 00 00 	movabs $0x802f49,%rax
  803116:	00 00 00 
  803119:	ff d0                	callq  *%rax
  80311b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80311e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803122:	79 05                	jns    803129 <shutdown+0x2d>
  803124:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803127:	eb 16                	jmp    80313f <shutdown+0x43>
  803129:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80312c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80312f:	89 d6                	mov    %edx,%esi
  803131:	89 c7                	mov    %eax,%edi
  803133:	48 b8 6f 34 80 00 00 	movabs $0x80346f,%rax
  80313a:	00 00 00 
  80313d:	ff d0                	callq  *%rax
  80313f:	c9                   	leaveq 
  803140:	c3                   	retq   

0000000000803141 <devsock_close>:
  803141:	55                   	push   %rbp
  803142:	48 89 e5             	mov    %rsp,%rbp
  803145:	48 83 ec 10          	sub    $0x10,%rsp
  803149:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80314d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803151:	48 89 c7             	mov    %rax,%rdi
  803154:	48 b8 00 42 80 00 00 	movabs $0x804200,%rax
  80315b:	00 00 00 
  80315e:	ff d0                	callq  *%rax
  803160:	83 f8 01             	cmp    $0x1,%eax
  803163:	75 17                	jne    80317c <devsock_close+0x3b>
  803165:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803169:	8b 40 0c             	mov    0xc(%rax),%eax
  80316c:	89 c7                	mov    %eax,%edi
  80316e:	48 b8 af 34 80 00 00 	movabs $0x8034af,%rax
  803175:	00 00 00 
  803178:	ff d0                	callq  *%rax
  80317a:	eb 05                	jmp    803181 <devsock_close+0x40>
  80317c:	b8 00 00 00 00       	mov    $0x0,%eax
  803181:	c9                   	leaveq 
  803182:	c3                   	retq   

0000000000803183 <connect>:
  803183:	55                   	push   %rbp
  803184:	48 89 e5             	mov    %rsp,%rbp
  803187:	48 83 ec 20          	sub    $0x20,%rsp
  80318b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80318e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803192:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803195:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803198:	89 c7                	mov    %eax,%edi
  80319a:	48 b8 49 2f 80 00 00 	movabs $0x802f49,%rax
  8031a1:	00 00 00 
  8031a4:	ff d0                	callq  *%rax
  8031a6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031a9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031ad:	79 05                	jns    8031b4 <connect+0x31>
  8031af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031b2:	eb 1b                	jmp    8031cf <connect+0x4c>
  8031b4:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8031b7:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8031bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031be:	48 89 ce             	mov    %rcx,%rsi
  8031c1:	89 c7                	mov    %eax,%edi
  8031c3:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  8031ca:	00 00 00 
  8031cd:	ff d0                	callq  *%rax
  8031cf:	c9                   	leaveq 
  8031d0:	c3                   	retq   

00000000008031d1 <listen>:
  8031d1:	55                   	push   %rbp
  8031d2:	48 89 e5             	mov    %rsp,%rbp
  8031d5:	48 83 ec 20          	sub    $0x20,%rsp
  8031d9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8031dc:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8031df:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8031e2:	89 c7                	mov    %eax,%edi
  8031e4:	48 b8 49 2f 80 00 00 	movabs $0x802f49,%rax
  8031eb:	00 00 00 
  8031ee:	ff d0                	callq  *%rax
  8031f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031f3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031f7:	79 05                	jns    8031fe <listen+0x2d>
  8031f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031fc:	eb 16                	jmp    803214 <listen+0x43>
  8031fe:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803201:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803204:	89 d6                	mov    %edx,%esi
  803206:	89 c7                	mov    %eax,%edi
  803208:	48 b8 40 35 80 00 00 	movabs $0x803540,%rax
  80320f:	00 00 00 
  803212:	ff d0                	callq  *%rax
  803214:	c9                   	leaveq 
  803215:	c3                   	retq   

0000000000803216 <devsock_read>:
  803216:	55                   	push   %rbp
  803217:	48 89 e5             	mov    %rsp,%rbp
  80321a:	48 83 ec 20          	sub    $0x20,%rsp
  80321e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803222:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803226:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80322a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80322e:	89 c2                	mov    %eax,%edx
  803230:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803234:	8b 40 0c             	mov    0xc(%rax),%eax
  803237:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80323b:	b9 00 00 00 00       	mov    $0x0,%ecx
  803240:	89 c7                	mov    %eax,%edi
  803242:	48 b8 80 35 80 00 00 	movabs $0x803580,%rax
  803249:	00 00 00 
  80324c:	ff d0                	callq  *%rax
  80324e:	c9                   	leaveq 
  80324f:	c3                   	retq   

0000000000803250 <devsock_write>:
  803250:	55                   	push   %rbp
  803251:	48 89 e5             	mov    %rsp,%rbp
  803254:	48 83 ec 20          	sub    $0x20,%rsp
  803258:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80325c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803260:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803264:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803268:	89 c2                	mov    %eax,%edx
  80326a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80326e:	8b 40 0c             	mov    0xc(%rax),%eax
  803271:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803275:	b9 00 00 00 00       	mov    $0x0,%ecx
  80327a:	89 c7                	mov    %eax,%edi
  80327c:	48 b8 4c 36 80 00 00 	movabs $0x80364c,%rax
  803283:	00 00 00 
  803286:	ff d0                	callq  *%rax
  803288:	c9                   	leaveq 
  803289:	c3                   	retq   

000000000080328a <devsock_stat>:
  80328a:	55                   	push   %rbp
  80328b:	48 89 e5             	mov    %rsp,%rbp
  80328e:	48 83 ec 10          	sub    $0x10,%rsp
  803292:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803296:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80329a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80329e:	48 be ca 49 80 00 00 	movabs $0x8049ca,%rsi
  8032a5:	00 00 00 
  8032a8:	48 89 c7             	mov    %rax,%rdi
  8032ab:	48 b8 ea 11 80 00 00 	movabs $0x8011ea,%rax
  8032b2:	00 00 00 
  8032b5:	ff d0                	callq  *%rax
  8032b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8032bc:	c9                   	leaveq 
  8032bd:	c3                   	retq   

00000000008032be <socket>:
  8032be:	55                   	push   %rbp
  8032bf:	48 89 e5             	mov    %rsp,%rbp
  8032c2:	48 83 ec 20          	sub    $0x20,%rsp
  8032c6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032c9:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8032cc:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8032cf:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8032d2:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8032d5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032d8:	89 ce                	mov    %ecx,%esi
  8032da:	89 c7                	mov    %eax,%edi
  8032dc:	48 b8 04 37 80 00 00 	movabs $0x803704,%rax
  8032e3:	00 00 00 
  8032e6:	ff d0                	callq  *%rax
  8032e8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032eb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032ef:	79 05                	jns    8032f6 <socket+0x38>
  8032f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032f4:	eb 11                	jmp    803307 <socket+0x49>
  8032f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032f9:	89 c7                	mov    %eax,%edi
  8032fb:	48 b8 a0 2f 80 00 00 	movabs $0x802fa0,%rax
  803302:	00 00 00 
  803305:	ff d0                	callq  *%rax
  803307:	c9                   	leaveq 
  803308:	c3                   	retq   

0000000000803309 <nsipc>:
  803309:	55                   	push   %rbp
  80330a:	48 89 e5             	mov    %rsp,%rbp
  80330d:	48 83 ec 10          	sub    $0x10,%rsp
  803311:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803314:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80331b:	00 00 00 
  80331e:	8b 00                	mov    (%rax),%eax
  803320:	85 c0                	test   %eax,%eax
  803322:	75 1f                	jne    803343 <nsipc+0x3a>
  803324:	bf 02 00 00 00       	mov    $0x2,%edi
  803329:	48 b8 8f 41 80 00 00 	movabs $0x80418f,%rax
  803330:	00 00 00 
  803333:	ff d0                	callq  *%rax
  803335:	89 c2                	mov    %eax,%edx
  803337:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80333e:	00 00 00 
  803341:	89 10                	mov    %edx,(%rax)
  803343:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80334a:	00 00 00 
  80334d:	8b 00                	mov    (%rax),%eax
  80334f:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803352:	b9 07 00 00 00       	mov    $0x7,%ecx
  803357:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  80335e:	00 00 00 
  803361:	89 c7                	mov    %eax,%edi
  803363:	48 b8 85 40 80 00 00 	movabs $0x804085,%rax
  80336a:	00 00 00 
  80336d:	ff d0                	callq  *%rax
  80336f:	ba 00 00 00 00       	mov    $0x0,%edx
  803374:	be 00 00 00 00       	mov    $0x0,%esi
  803379:	bf 00 00 00 00       	mov    $0x0,%edi
  80337e:	48 b8 c4 3f 80 00 00 	movabs $0x803fc4,%rax
  803385:	00 00 00 
  803388:	ff d0                	callq  *%rax
  80338a:	c9                   	leaveq 
  80338b:	c3                   	retq   

000000000080338c <nsipc_accept>:
  80338c:	55                   	push   %rbp
  80338d:	48 89 e5             	mov    %rsp,%rbp
  803390:	48 83 ec 30          	sub    $0x30,%rsp
  803394:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803397:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80339b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80339f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033a6:	00 00 00 
  8033a9:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8033ac:	89 10                	mov    %edx,(%rax)
  8033ae:	bf 01 00 00 00       	mov    $0x1,%edi
  8033b3:	48 b8 09 33 80 00 00 	movabs $0x803309,%rax
  8033ba:	00 00 00 
  8033bd:	ff d0                	callq  *%rax
  8033bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033c6:	78 3e                	js     803406 <nsipc_accept+0x7a>
  8033c8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033cf:	00 00 00 
  8033d2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8033d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033da:	8b 40 10             	mov    0x10(%rax),%eax
  8033dd:	89 c2                	mov    %eax,%edx
  8033df:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8033e3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8033e7:	48 89 ce             	mov    %rcx,%rsi
  8033ea:	48 89 c7             	mov    %rax,%rdi
  8033ed:	48 b8 0f 15 80 00 00 	movabs $0x80150f,%rax
  8033f4:	00 00 00 
  8033f7:	ff d0                	callq  *%rax
  8033f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8033fd:	8b 50 10             	mov    0x10(%rax),%edx
  803400:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803404:	89 10                	mov    %edx,(%rax)
  803406:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803409:	c9                   	leaveq 
  80340a:	c3                   	retq   

000000000080340b <nsipc_bind>:
  80340b:	55                   	push   %rbp
  80340c:	48 89 e5             	mov    %rsp,%rbp
  80340f:	48 83 ec 10          	sub    $0x10,%rsp
  803413:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803416:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80341a:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80341d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803424:	00 00 00 
  803427:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80342a:	89 10                	mov    %edx,(%rax)
  80342c:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80342f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803433:	48 89 c6             	mov    %rax,%rsi
  803436:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80343d:	00 00 00 
  803440:	48 b8 0f 15 80 00 00 	movabs $0x80150f,%rax
  803447:	00 00 00 
  80344a:	ff d0                	callq  *%rax
  80344c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803453:	00 00 00 
  803456:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803459:	89 50 14             	mov    %edx,0x14(%rax)
  80345c:	bf 02 00 00 00       	mov    $0x2,%edi
  803461:	48 b8 09 33 80 00 00 	movabs $0x803309,%rax
  803468:	00 00 00 
  80346b:	ff d0                	callq  *%rax
  80346d:	c9                   	leaveq 
  80346e:	c3                   	retq   

000000000080346f <nsipc_shutdown>:
  80346f:	55                   	push   %rbp
  803470:	48 89 e5             	mov    %rsp,%rbp
  803473:	48 83 ec 10          	sub    $0x10,%rsp
  803477:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80347a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80347d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803484:	00 00 00 
  803487:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80348a:	89 10                	mov    %edx,(%rax)
  80348c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803493:	00 00 00 
  803496:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803499:	89 50 04             	mov    %edx,0x4(%rax)
  80349c:	bf 03 00 00 00       	mov    $0x3,%edi
  8034a1:	48 b8 09 33 80 00 00 	movabs $0x803309,%rax
  8034a8:	00 00 00 
  8034ab:	ff d0                	callq  *%rax
  8034ad:	c9                   	leaveq 
  8034ae:	c3                   	retq   

00000000008034af <nsipc_close>:
  8034af:	55                   	push   %rbp
  8034b0:	48 89 e5             	mov    %rsp,%rbp
  8034b3:	48 83 ec 10          	sub    $0x10,%rsp
  8034b7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8034ba:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034c1:	00 00 00 
  8034c4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8034c7:	89 10                	mov    %edx,(%rax)
  8034c9:	bf 04 00 00 00       	mov    $0x4,%edi
  8034ce:	48 b8 09 33 80 00 00 	movabs $0x803309,%rax
  8034d5:	00 00 00 
  8034d8:	ff d0                	callq  *%rax
  8034da:	c9                   	leaveq 
  8034db:	c3                   	retq   

00000000008034dc <nsipc_connect>:
  8034dc:	55                   	push   %rbp
  8034dd:	48 89 e5             	mov    %rsp,%rbp
  8034e0:	48 83 ec 10          	sub    $0x10,%rsp
  8034e4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8034e7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8034eb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8034ee:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034f5:	00 00 00 
  8034f8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8034fb:	89 10                	mov    %edx,(%rax)
  8034fd:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803500:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803504:	48 89 c6             	mov    %rax,%rsi
  803507:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80350e:	00 00 00 
  803511:	48 b8 0f 15 80 00 00 	movabs $0x80150f,%rax
  803518:	00 00 00 
  80351b:	ff d0                	callq  *%rax
  80351d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803524:	00 00 00 
  803527:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80352a:	89 50 14             	mov    %edx,0x14(%rax)
  80352d:	bf 05 00 00 00       	mov    $0x5,%edi
  803532:	48 b8 09 33 80 00 00 	movabs $0x803309,%rax
  803539:	00 00 00 
  80353c:	ff d0                	callq  *%rax
  80353e:	c9                   	leaveq 
  80353f:	c3                   	retq   

0000000000803540 <nsipc_listen>:
  803540:	55                   	push   %rbp
  803541:	48 89 e5             	mov    %rsp,%rbp
  803544:	48 83 ec 10          	sub    $0x10,%rsp
  803548:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80354b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80354e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803555:	00 00 00 
  803558:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80355b:	89 10                	mov    %edx,(%rax)
  80355d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803564:	00 00 00 
  803567:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80356a:	89 50 04             	mov    %edx,0x4(%rax)
  80356d:	bf 06 00 00 00       	mov    $0x6,%edi
  803572:	48 b8 09 33 80 00 00 	movabs $0x803309,%rax
  803579:	00 00 00 
  80357c:	ff d0                	callq  *%rax
  80357e:	c9                   	leaveq 
  80357f:	c3                   	retq   

0000000000803580 <nsipc_recv>:
  803580:	55                   	push   %rbp
  803581:	48 89 e5             	mov    %rsp,%rbp
  803584:	48 83 ec 30          	sub    $0x30,%rsp
  803588:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80358b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80358f:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803592:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803595:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80359c:	00 00 00 
  80359f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8035a2:	89 10                	mov    %edx,(%rax)
  8035a4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035ab:	00 00 00 
  8035ae:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8035b1:	89 50 04             	mov    %edx,0x4(%rax)
  8035b4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035bb:	00 00 00 
  8035be:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8035c1:	89 50 08             	mov    %edx,0x8(%rax)
  8035c4:	bf 07 00 00 00       	mov    $0x7,%edi
  8035c9:	48 b8 09 33 80 00 00 	movabs $0x803309,%rax
  8035d0:	00 00 00 
  8035d3:	ff d0                	callq  *%rax
  8035d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035d8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035dc:	78 69                	js     803647 <nsipc_recv+0xc7>
  8035de:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8035e5:	7f 08                	jg     8035ef <nsipc_recv+0x6f>
  8035e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035ea:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8035ed:	7e 35                	jle    803624 <nsipc_recv+0xa4>
  8035ef:	48 b9 d1 49 80 00 00 	movabs $0x8049d1,%rcx
  8035f6:	00 00 00 
  8035f9:	48 ba e6 49 80 00 00 	movabs $0x8049e6,%rdx
  803600:	00 00 00 
  803603:	be 62 00 00 00       	mov    $0x62,%esi
  803608:	48 bf fb 49 80 00 00 	movabs $0x8049fb,%rdi
  80360f:	00 00 00 
  803612:	b8 00 00 00 00       	mov    $0x0,%eax
  803617:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  80361e:	00 00 00 
  803621:	41 ff d0             	callq  *%r8
  803624:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803627:	48 63 d0             	movslq %eax,%rdx
  80362a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80362e:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803635:	00 00 00 
  803638:	48 89 c7             	mov    %rax,%rdi
  80363b:	48 b8 0f 15 80 00 00 	movabs $0x80150f,%rax
  803642:	00 00 00 
  803645:	ff d0                	callq  *%rax
  803647:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80364a:	c9                   	leaveq 
  80364b:	c3                   	retq   

000000000080364c <nsipc_send>:
  80364c:	55                   	push   %rbp
  80364d:	48 89 e5             	mov    %rsp,%rbp
  803650:	48 83 ec 20          	sub    $0x20,%rsp
  803654:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803657:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80365b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80365e:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803661:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803668:	00 00 00 
  80366b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80366e:	89 10                	mov    %edx,(%rax)
  803670:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803677:	7e 35                	jle    8036ae <nsipc_send+0x62>
  803679:	48 b9 0a 4a 80 00 00 	movabs $0x804a0a,%rcx
  803680:	00 00 00 
  803683:	48 ba e6 49 80 00 00 	movabs $0x8049e6,%rdx
  80368a:	00 00 00 
  80368d:	be 6d 00 00 00       	mov    $0x6d,%esi
  803692:	48 bf fb 49 80 00 00 	movabs $0x8049fb,%rdi
  803699:	00 00 00 
  80369c:	b8 00 00 00 00       	mov    $0x0,%eax
  8036a1:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  8036a8:	00 00 00 
  8036ab:	41 ff d0             	callq  *%r8
  8036ae:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8036b1:	48 63 d0             	movslq %eax,%rdx
  8036b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036b8:	48 89 c6             	mov    %rax,%rsi
  8036bb:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  8036c2:	00 00 00 
  8036c5:	48 b8 0f 15 80 00 00 	movabs $0x80150f,%rax
  8036cc:	00 00 00 
  8036cf:	ff d0                	callq  *%rax
  8036d1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036d8:	00 00 00 
  8036db:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8036de:	89 50 04             	mov    %edx,0x4(%rax)
  8036e1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036e8:	00 00 00 
  8036eb:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8036ee:	89 50 08             	mov    %edx,0x8(%rax)
  8036f1:	bf 08 00 00 00       	mov    $0x8,%edi
  8036f6:	48 b8 09 33 80 00 00 	movabs $0x803309,%rax
  8036fd:	00 00 00 
  803700:	ff d0                	callq  *%rax
  803702:	c9                   	leaveq 
  803703:	c3                   	retq   

0000000000803704 <nsipc_socket>:
  803704:	55                   	push   %rbp
  803705:	48 89 e5             	mov    %rsp,%rbp
  803708:	48 83 ec 10          	sub    $0x10,%rsp
  80370c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80370f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803712:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803715:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80371c:	00 00 00 
  80371f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803722:	89 10                	mov    %edx,(%rax)
  803724:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80372b:	00 00 00 
  80372e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803731:	89 50 04             	mov    %edx,0x4(%rax)
  803734:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80373b:	00 00 00 
  80373e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803741:	89 50 08             	mov    %edx,0x8(%rax)
  803744:	bf 09 00 00 00       	mov    $0x9,%edi
  803749:	48 b8 09 33 80 00 00 	movabs $0x803309,%rax
  803750:	00 00 00 
  803753:	ff d0                	callq  *%rax
  803755:	c9                   	leaveq 
  803756:	c3                   	retq   

0000000000803757 <pipe>:
  803757:	55                   	push   %rbp
  803758:	48 89 e5             	mov    %rsp,%rbp
  80375b:	53                   	push   %rbx
  80375c:	48 83 ec 38          	sub    $0x38,%rsp
  803760:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803764:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803768:	48 89 c7             	mov    %rax,%rdi
  80376b:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  803772:	00 00 00 
  803775:	ff d0                	callq  *%rax
  803777:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80377a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80377e:	0f 88 bf 01 00 00    	js     803943 <pipe+0x1ec>
  803784:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803788:	ba 07 04 00 00       	mov    $0x407,%edx
  80378d:	48 89 c6             	mov    %rax,%rsi
  803790:	bf 00 00 00 00       	mov    $0x0,%edi
  803795:	48 b8 1a 1b 80 00 00 	movabs $0x801b1a,%rax
  80379c:	00 00 00 
  80379f:	ff d0                	callq  *%rax
  8037a1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8037a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8037a8:	0f 88 95 01 00 00    	js     803943 <pipe+0x1ec>
  8037ae:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8037b2:	48 89 c7             	mov    %rax,%rdi
  8037b5:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  8037bc:	00 00 00 
  8037bf:	ff d0                	callq  *%rax
  8037c1:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8037c4:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8037c8:	0f 88 5d 01 00 00    	js     80392b <pipe+0x1d4>
  8037ce:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037d2:	ba 07 04 00 00       	mov    $0x407,%edx
  8037d7:	48 89 c6             	mov    %rax,%rsi
  8037da:	bf 00 00 00 00       	mov    $0x0,%edi
  8037df:	48 b8 1a 1b 80 00 00 	movabs $0x801b1a,%rax
  8037e6:	00 00 00 
  8037e9:	ff d0                	callq  *%rax
  8037eb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8037ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8037f2:	0f 88 33 01 00 00    	js     80392b <pipe+0x1d4>
  8037f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037fc:	48 89 c7             	mov    %rax,%rdi
  8037ff:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  803806:	00 00 00 
  803809:	ff d0                	callq  *%rax
  80380b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80380f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803813:	ba 07 04 00 00       	mov    $0x407,%edx
  803818:	48 89 c6             	mov    %rax,%rsi
  80381b:	bf 00 00 00 00       	mov    $0x0,%edi
  803820:	48 b8 1a 1b 80 00 00 	movabs $0x801b1a,%rax
  803827:	00 00 00 
  80382a:	ff d0                	callq  *%rax
  80382c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80382f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803833:	0f 88 d9 00 00 00    	js     803912 <pipe+0x1bb>
  803839:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80383d:	48 89 c7             	mov    %rax,%rdi
  803840:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  803847:	00 00 00 
  80384a:	ff d0                	callq  *%rax
  80384c:	48 89 c2             	mov    %rax,%rdx
  80384f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803853:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803859:	48 89 d1             	mov    %rdx,%rcx
  80385c:	ba 00 00 00 00       	mov    $0x0,%edx
  803861:	48 89 c6             	mov    %rax,%rsi
  803864:	bf 00 00 00 00       	mov    $0x0,%edi
  803869:	48 b8 6c 1b 80 00 00 	movabs $0x801b6c,%rax
  803870:	00 00 00 
  803873:	ff d0                	callq  *%rax
  803875:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803878:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80387c:	78 79                	js     8038f7 <pipe+0x1a0>
  80387e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803882:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803889:	00 00 00 
  80388c:	8b 12                	mov    (%rdx),%edx
  80388e:	89 10                	mov    %edx,(%rax)
  803890:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803894:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80389b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80389f:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8038a6:	00 00 00 
  8038a9:	8b 12                	mov    (%rdx),%edx
  8038ab:	89 10                	mov    %edx,(%rax)
  8038ad:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038b1:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8038b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038bc:	48 89 c7             	mov    %rax,%rdi
  8038bf:	48 b8 16 1f 80 00 00 	movabs $0x801f16,%rax
  8038c6:	00 00 00 
  8038c9:	ff d0                	callq  *%rax
  8038cb:	89 c2                	mov    %eax,%edx
  8038cd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8038d1:	89 10                	mov    %edx,(%rax)
  8038d3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8038d7:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8038db:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038df:	48 89 c7             	mov    %rax,%rdi
  8038e2:	48 b8 16 1f 80 00 00 	movabs $0x801f16,%rax
  8038e9:	00 00 00 
  8038ec:	ff d0                	callq  *%rax
  8038ee:	89 03                	mov    %eax,(%rbx)
  8038f0:	b8 00 00 00 00       	mov    $0x0,%eax
  8038f5:	eb 4f                	jmp    803946 <pipe+0x1ef>
  8038f7:	90                   	nop
  8038f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038fc:	48 89 c6             	mov    %rax,%rsi
  8038ff:	bf 00 00 00 00       	mov    $0x0,%edi
  803904:	48 b8 cc 1b 80 00 00 	movabs $0x801bcc,%rax
  80390b:	00 00 00 
  80390e:	ff d0                	callq  *%rax
  803910:	eb 01                	jmp    803913 <pipe+0x1bc>
  803912:	90                   	nop
  803913:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803917:	48 89 c6             	mov    %rax,%rsi
  80391a:	bf 00 00 00 00       	mov    $0x0,%edi
  80391f:	48 b8 cc 1b 80 00 00 	movabs $0x801bcc,%rax
  803926:	00 00 00 
  803929:	ff d0                	callq  *%rax
  80392b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80392f:	48 89 c6             	mov    %rax,%rsi
  803932:	bf 00 00 00 00       	mov    $0x0,%edi
  803937:	48 b8 cc 1b 80 00 00 	movabs $0x801bcc,%rax
  80393e:	00 00 00 
  803941:	ff d0                	callq  *%rax
  803943:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803946:	48 83 c4 38          	add    $0x38,%rsp
  80394a:	5b                   	pop    %rbx
  80394b:	5d                   	pop    %rbp
  80394c:	c3                   	retq   

000000000080394d <_pipeisclosed>:
  80394d:	55                   	push   %rbp
  80394e:	48 89 e5             	mov    %rsp,%rbp
  803951:	53                   	push   %rbx
  803952:	48 83 ec 28          	sub    $0x28,%rsp
  803956:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80395a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80395e:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803965:	00 00 00 
  803968:	48 8b 00             	mov    (%rax),%rax
  80396b:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803971:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803974:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803978:	48 89 c7             	mov    %rax,%rdi
  80397b:	48 b8 00 42 80 00 00 	movabs $0x804200,%rax
  803982:	00 00 00 
  803985:	ff d0                	callq  *%rax
  803987:	89 c3                	mov    %eax,%ebx
  803989:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80398d:	48 89 c7             	mov    %rax,%rdi
  803990:	48 b8 00 42 80 00 00 	movabs $0x804200,%rax
  803997:	00 00 00 
  80399a:	ff d0                	callq  *%rax
  80399c:	39 c3                	cmp    %eax,%ebx
  80399e:	0f 94 c0             	sete   %al
  8039a1:	0f b6 c0             	movzbl %al,%eax
  8039a4:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8039a7:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8039ae:	00 00 00 
  8039b1:	48 8b 00             	mov    (%rax),%rax
  8039b4:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8039ba:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8039bd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039c0:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8039c3:	75 05                	jne    8039ca <_pipeisclosed+0x7d>
  8039c5:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8039c8:	eb 4a                	jmp    803a14 <_pipeisclosed+0xc7>
  8039ca:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039cd:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8039d0:	74 8c                	je     80395e <_pipeisclosed+0x11>
  8039d2:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8039d6:	75 86                	jne    80395e <_pipeisclosed+0x11>
  8039d8:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8039df:	00 00 00 
  8039e2:	48 8b 00             	mov    (%rax),%rax
  8039e5:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8039eb:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8039ee:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039f1:	89 c6                	mov    %eax,%esi
  8039f3:	48 bf 1b 4a 80 00 00 	movabs $0x804a1b,%rdi
  8039fa:	00 00 00 
  8039fd:	b8 00 00 00 00       	mov    $0x0,%eax
  803a02:	49 b8 5a 06 80 00 00 	movabs $0x80065a,%r8
  803a09:	00 00 00 
  803a0c:	41 ff d0             	callq  *%r8
  803a0f:	e9 4a ff ff ff       	jmpq   80395e <_pipeisclosed+0x11>
  803a14:	48 83 c4 28          	add    $0x28,%rsp
  803a18:	5b                   	pop    %rbx
  803a19:	5d                   	pop    %rbp
  803a1a:	c3                   	retq   

0000000000803a1b <pipeisclosed>:
  803a1b:	55                   	push   %rbp
  803a1c:	48 89 e5             	mov    %rsp,%rbp
  803a1f:	48 83 ec 30          	sub    $0x30,%rsp
  803a23:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803a26:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803a2a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803a2d:	48 89 d6             	mov    %rdx,%rsi
  803a30:	89 c7                	mov    %eax,%edi
  803a32:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  803a39:	00 00 00 
  803a3c:	ff d0                	callq  *%rax
  803a3e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a41:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a45:	79 05                	jns    803a4c <pipeisclosed+0x31>
  803a47:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a4a:	eb 31                	jmp    803a7d <pipeisclosed+0x62>
  803a4c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a50:	48 89 c7             	mov    %rax,%rdi
  803a53:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  803a5a:	00 00 00 
  803a5d:	ff d0                	callq  *%rax
  803a5f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a63:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803a67:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a6b:	48 89 d6             	mov    %rdx,%rsi
  803a6e:	48 89 c7             	mov    %rax,%rdi
  803a71:	48 b8 4d 39 80 00 00 	movabs $0x80394d,%rax
  803a78:	00 00 00 
  803a7b:	ff d0                	callq  *%rax
  803a7d:	c9                   	leaveq 
  803a7e:	c3                   	retq   

0000000000803a7f <devpipe_read>:
  803a7f:	55                   	push   %rbp
  803a80:	48 89 e5             	mov    %rsp,%rbp
  803a83:	48 83 ec 40          	sub    $0x40,%rsp
  803a87:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803a8b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803a8f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803a93:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a97:	48 89 c7             	mov    %rax,%rdi
  803a9a:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  803aa1:	00 00 00 
  803aa4:	ff d0                	callq  *%rax
  803aa6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803aaa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803aae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803ab2:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803ab9:	00 
  803aba:	e9 90 00 00 00       	jmpq   803b4f <devpipe_read+0xd0>
  803abf:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803ac4:	74 09                	je     803acf <devpipe_read+0x50>
  803ac6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803aca:	e9 8e 00 00 00       	jmpq   803b5d <devpipe_read+0xde>
  803acf:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ad3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ad7:	48 89 d6             	mov    %rdx,%rsi
  803ada:	48 89 c7             	mov    %rax,%rdi
  803add:	48 b8 4d 39 80 00 00 	movabs $0x80394d,%rax
  803ae4:	00 00 00 
  803ae7:	ff d0                	callq  *%rax
  803ae9:	85 c0                	test   %eax,%eax
  803aeb:	74 07                	je     803af4 <devpipe_read+0x75>
  803aed:	b8 00 00 00 00       	mov    $0x0,%eax
  803af2:	eb 69                	jmp    803b5d <devpipe_read+0xde>
  803af4:	48 b8 dd 1a 80 00 00 	movabs $0x801add,%rax
  803afb:	00 00 00 
  803afe:	ff d0                	callq  *%rax
  803b00:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b04:	8b 10                	mov    (%rax),%edx
  803b06:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b0a:	8b 40 04             	mov    0x4(%rax),%eax
  803b0d:	39 c2                	cmp    %eax,%edx
  803b0f:	74 ae                	je     803abf <devpipe_read+0x40>
  803b11:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803b15:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b19:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803b1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b21:	8b 00                	mov    (%rax),%eax
  803b23:	99                   	cltd   
  803b24:	c1 ea 1b             	shr    $0x1b,%edx
  803b27:	01 d0                	add    %edx,%eax
  803b29:	83 e0 1f             	and    $0x1f,%eax
  803b2c:	29 d0                	sub    %edx,%eax
  803b2e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803b32:	48 98                	cltq   
  803b34:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803b39:	88 01                	mov    %al,(%rcx)
  803b3b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b3f:	8b 00                	mov    (%rax),%eax
  803b41:	8d 50 01             	lea    0x1(%rax),%edx
  803b44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b48:	89 10                	mov    %edx,(%rax)
  803b4a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803b4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b53:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803b57:	72 a7                	jb     803b00 <devpipe_read+0x81>
  803b59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b5d:	c9                   	leaveq 
  803b5e:	c3                   	retq   

0000000000803b5f <devpipe_write>:
  803b5f:	55                   	push   %rbp
  803b60:	48 89 e5             	mov    %rsp,%rbp
  803b63:	48 83 ec 40          	sub    $0x40,%rsp
  803b67:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803b6b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803b6f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803b73:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b77:	48 89 c7             	mov    %rax,%rdi
  803b7a:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  803b81:	00 00 00 
  803b84:	ff d0                	callq  *%rax
  803b86:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803b8a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b8e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803b92:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803b99:	00 
  803b9a:	e9 8f 00 00 00       	jmpq   803c2e <devpipe_write+0xcf>
  803b9f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ba3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ba7:	48 89 d6             	mov    %rdx,%rsi
  803baa:	48 89 c7             	mov    %rax,%rdi
  803bad:	48 b8 4d 39 80 00 00 	movabs $0x80394d,%rax
  803bb4:	00 00 00 
  803bb7:	ff d0                	callq  *%rax
  803bb9:	85 c0                	test   %eax,%eax
  803bbb:	74 07                	je     803bc4 <devpipe_write+0x65>
  803bbd:	b8 00 00 00 00       	mov    $0x0,%eax
  803bc2:	eb 78                	jmp    803c3c <devpipe_write+0xdd>
  803bc4:	48 b8 dd 1a 80 00 00 	movabs $0x801add,%rax
  803bcb:	00 00 00 
  803bce:	ff d0                	callq  *%rax
  803bd0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bd4:	8b 40 04             	mov    0x4(%rax),%eax
  803bd7:	48 63 d0             	movslq %eax,%rdx
  803bda:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bde:	8b 00                	mov    (%rax),%eax
  803be0:	48 98                	cltq   
  803be2:	48 83 c0 20          	add    $0x20,%rax
  803be6:	48 39 c2             	cmp    %rax,%rdx
  803be9:	73 b4                	jae    803b9f <devpipe_write+0x40>
  803beb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bef:	8b 40 04             	mov    0x4(%rax),%eax
  803bf2:	99                   	cltd   
  803bf3:	c1 ea 1b             	shr    $0x1b,%edx
  803bf6:	01 d0                	add    %edx,%eax
  803bf8:	83 e0 1f             	and    $0x1f,%eax
  803bfb:	29 d0                	sub    %edx,%eax
  803bfd:	89 c6                	mov    %eax,%esi
  803bff:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803c03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c07:	48 01 d0             	add    %rdx,%rax
  803c0a:	0f b6 08             	movzbl (%rax),%ecx
  803c0d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803c11:	48 63 c6             	movslq %esi,%rax
  803c14:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803c18:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c1c:	8b 40 04             	mov    0x4(%rax),%eax
  803c1f:	8d 50 01             	lea    0x1(%rax),%edx
  803c22:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c26:	89 50 04             	mov    %edx,0x4(%rax)
  803c29:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803c2e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c32:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803c36:	72 98                	jb     803bd0 <devpipe_write+0x71>
  803c38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c3c:	c9                   	leaveq 
  803c3d:	c3                   	retq   

0000000000803c3e <devpipe_stat>:
  803c3e:	55                   	push   %rbp
  803c3f:	48 89 e5             	mov    %rsp,%rbp
  803c42:	48 83 ec 20          	sub    $0x20,%rsp
  803c46:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803c4a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c4e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c52:	48 89 c7             	mov    %rax,%rdi
  803c55:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  803c5c:	00 00 00 
  803c5f:	ff d0                	callq  *%rax
  803c61:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803c65:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c69:	48 be 2e 4a 80 00 00 	movabs $0x804a2e,%rsi
  803c70:	00 00 00 
  803c73:	48 89 c7             	mov    %rax,%rdi
  803c76:	48 b8 ea 11 80 00 00 	movabs $0x8011ea,%rax
  803c7d:	00 00 00 
  803c80:	ff d0                	callq  *%rax
  803c82:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c86:	8b 50 04             	mov    0x4(%rax),%edx
  803c89:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c8d:	8b 00                	mov    (%rax),%eax
  803c8f:	29 c2                	sub    %eax,%edx
  803c91:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c95:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803c9b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c9f:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803ca6:	00 00 00 
  803ca9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cad:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803cb4:	00 00 00 
  803cb7:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803cbe:	b8 00 00 00 00       	mov    $0x0,%eax
  803cc3:	c9                   	leaveq 
  803cc4:	c3                   	retq   

0000000000803cc5 <devpipe_close>:
  803cc5:	55                   	push   %rbp
  803cc6:	48 89 e5             	mov    %rsp,%rbp
  803cc9:	48 83 ec 10          	sub    $0x10,%rsp
  803ccd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803cd1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803cd5:	48 89 c6             	mov    %rax,%rsi
  803cd8:	bf 00 00 00 00       	mov    $0x0,%edi
  803cdd:	48 b8 cc 1b 80 00 00 	movabs $0x801bcc,%rax
  803ce4:	00 00 00 
  803ce7:	ff d0                	callq  *%rax
  803ce9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ced:	48 89 c7             	mov    %rax,%rdi
  803cf0:	48 b8 39 1f 80 00 00 	movabs $0x801f39,%rax
  803cf7:	00 00 00 
  803cfa:	ff d0                	callq  *%rax
  803cfc:	48 89 c6             	mov    %rax,%rsi
  803cff:	bf 00 00 00 00       	mov    $0x0,%edi
  803d04:	48 b8 cc 1b 80 00 00 	movabs $0x801bcc,%rax
  803d0b:	00 00 00 
  803d0e:	ff d0                	callq  *%rax
  803d10:	c9                   	leaveq 
  803d11:	c3                   	retq   

0000000000803d12 <cputchar>:
  803d12:	55                   	push   %rbp
  803d13:	48 89 e5             	mov    %rsp,%rbp
  803d16:	48 83 ec 20          	sub    $0x20,%rsp
  803d1a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d1d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d20:	88 45 ff             	mov    %al,-0x1(%rbp)
  803d23:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803d27:	be 01 00 00 00       	mov    $0x1,%esi
  803d2c:	48 89 c7             	mov    %rax,%rdi
  803d2f:	48 b8 d2 19 80 00 00 	movabs $0x8019d2,%rax
  803d36:	00 00 00 
  803d39:	ff d0                	callq  *%rax
  803d3b:	90                   	nop
  803d3c:	c9                   	leaveq 
  803d3d:	c3                   	retq   

0000000000803d3e <getchar>:
  803d3e:	55                   	push   %rbp
  803d3f:	48 89 e5             	mov    %rsp,%rbp
  803d42:	48 83 ec 10          	sub    $0x10,%rsp
  803d46:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803d4a:	ba 01 00 00 00       	mov    $0x1,%edx
  803d4f:	48 89 c6             	mov    %rax,%rsi
  803d52:	bf 00 00 00 00       	mov    $0x0,%edi
  803d57:	48 b8 31 24 80 00 00 	movabs $0x802431,%rax
  803d5e:	00 00 00 
  803d61:	ff d0                	callq  *%rax
  803d63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d66:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d6a:	79 05                	jns    803d71 <getchar+0x33>
  803d6c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d6f:	eb 14                	jmp    803d85 <getchar+0x47>
  803d71:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d75:	7f 07                	jg     803d7e <getchar+0x40>
  803d77:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803d7c:	eb 07                	jmp    803d85 <getchar+0x47>
  803d7e:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803d82:	0f b6 c0             	movzbl %al,%eax
  803d85:	c9                   	leaveq 
  803d86:	c3                   	retq   

0000000000803d87 <iscons>:
  803d87:	55                   	push   %rbp
  803d88:	48 89 e5             	mov    %rsp,%rbp
  803d8b:	48 83 ec 20          	sub    $0x20,%rsp
  803d8f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d92:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803d96:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d99:	48 89 d6             	mov    %rdx,%rsi
  803d9c:	89 c7                	mov    %eax,%edi
  803d9e:	48 b8 fc 1f 80 00 00 	movabs $0x801ffc,%rax
  803da5:	00 00 00 
  803da8:	ff d0                	callq  *%rax
  803daa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803dad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803db1:	79 05                	jns    803db8 <iscons+0x31>
  803db3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803db6:	eb 1a                	jmp    803dd2 <iscons+0x4b>
  803db8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dbc:	8b 10                	mov    (%rax),%edx
  803dbe:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803dc5:	00 00 00 
  803dc8:	8b 00                	mov    (%rax),%eax
  803dca:	39 c2                	cmp    %eax,%edx
  803dcc:	0f 94 c0             	sete   %al
  803dcf:	0f b6 c0             	movzbl %al,%eax
  803dd2:	c9                   	leaveq 
  803dd3:	c3                   	retq   

0000000000803dd4 <opencons>:
  803dd4:	55                   	push   %rbp
  803dd5:	48 89 e5             	mov    %rsp,%rbp
  803dd8:	48 83 ec 10          	sub    $0x10,%rsp
  803ddc:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803de0:	48 89 c7             	mov    %rax,%rdi
  803de3:	48 b8 64 1f 80 00 00 	movabs $0x801f64,%rax
  803dea:	00 00 00 
  803ded:	ff d0                	callq  *%rax
  803def:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803df2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803df6:	79 05                	jns    803dfd <opencons+0x29>
  803df8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dfb:	eb 5b                	jmp    803e58 <opencons+0x84>
  803dfd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e01:	ba 07 04 00 00       	mov    $0x407,%edx
  803e06:	48 89 c6             	mov    %rax,%rsi
  803e09:	bf 00 00 00 00       	mov    $0x0,%edi
  803e0e:	48 b8 1a 1b 80 00 00 	movabs $0x801b1a,%rax
  803e15:	00 00 00 
  803e18:	ff d0                	callq  *%rax
  803e1a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e1d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e21:	79 05                	jns    803e28 <opencons+0x54>
  803e23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e26:	eb 30                	jmp    803e58 <opencons+0x84>
  803e28:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e2c:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803e33:	00 00 00 
  803e36:	8b 12                	mov    (%rdx),%edx
  803e38:	89 10                	mov    %edx,(%rax)
  803e3a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e3e:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803e45:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e49:	48 89 c7             	mov    %rax,%rdi
  803e4c:	48 b8 16 1f 80 00 00 	movabs $0x801f16,%rax
  803e53:	00 00 00 
  803e56:	ff d0                	callq  *%rax
  803e58:	c9                   	leaveq 
  803e59:	c3                   	retq   

0000000000803e5a <devcons_read>:
  803e5a:	55                   	push   %rbp
  803e5b:	48 89 e5             	mov    %rsp,%rbp
  803e5e:	48 83 ec 30          	sub    $0x30,%rsp
  803e62:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803e66:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e6a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803e6e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803e73:	75 13                	jne    803e88 <devcons_read+0x2e>
  803e75:	b8 00 00 00 00       	mov    $0x0,%eax
  803e7a:	eb 49                	jmp    803ec5 <devcons_read+0x6b>
  803e7c:	48 b8 dd 1a 80 00 00 	movabs $0x801add,%rax
  803e83:	00 00 00 
  803e86:	ff d0                	callq  *%rax
  803e88:	48 b8 1f 1a 80 00 00 	movabs $0x801a1f,%rax
  803e8f:	00 00 00 
  803e92:	ff d0                	callq  *%rax
  803e94:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e97:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e9b:	74 df                	je     803e7c <devcons_read+0x22>
  803e9d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ea1:	79 05                	jns    803ea8 <devcons_read+0x4e>
  803ea3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ea6:	eb 1d                	jmp    803ec5 <devcons_read+0x6b>
  803ea8:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803eac:	75 07                	jne    803eb5 <devcons_read+0x5b>
  803eae:	b8 00 00 00 00       	mov    $0x0,%eax
  803eb3:	eb 10                	jmp    803ec5 <devcons_read+0x6b>
  803eb5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803eb8:	89 c2                	mov    %eax,%edx
  803eba:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ebe:	88 10                	mov    %dl,(%rax)
  803ec0:	b8 01 00 00 00       	mov    $0x1,%eax
  803ec5:	c9                   	leaveq 
  803ec6:	c3                   	retq   

0000000000803ec7 <devcons_write>:
  803ec7:	55                   	push   %rbp
  803ec8:	48 89 e5             	mov    %rsp,%rbp
  803ecb:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803ed2:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803ed9:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803ee0:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803ee7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803eee:	eb 76                	jmp    803f66 <devcons_write+0x9f>
  803ef0:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803ef7:	89 c2                	mov    %eax,%edx
  803ef9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803efc:	29 c2                	sub    %eax,%edx
  803efe:	89 d0                	mov    %edx,%eax
  803f00:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803f03:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f06:	83 f8 7f             	cmp    $0x7f,%eax
  803f09:	76 07                	jbe    803f12 <devcons_write+0x4b>
  803f0b:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803f12:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f15:	48 63 d0             	movslq %eax,%rdx
  803f18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f1b:	48 63 c8             	movslq %eax,%rcx
  803f1e:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803f25:	48 01 c1             	add    %rax,%rcx
  803f28:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803f2f:	48 89 ce             	mov    %rcx,%rsi
  803f32:	48 89 c7             	mov    %rax,%rdi
  803f35:	48 b8 0f 15 80 00 00 	movabs $0x80150f,%rax
  803f3c:	00 00 00 
  803f3f:	ff d0                	callq  *%rax
  803f41:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f44:	48 63 d0             	movslq %eax,%rdx
  803f47:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803f4e:	48 89 d6             	mov    %rdx,%rsi
  803f51:	48 89 c7             	mov    %rax,%rdi
  803f54:	48 b8 d2 19 80 00 00 	movabs $0x8019d2,%rax
  803f5b:	00 00 00 
  803f5e:	ff d0                	callq  *%rax
  803f60:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803f63:	01 45 fc             	add    %eax,-0x4(%rbp)
  803f66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f69:	48 98                	cltq   
  803f6b:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803f72:	0f 82 78 ff ff ff    	jb     803ef0 <devcons_write+0x29>
  803f78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f7b:	c9                   	leaveq 
  803f7c:	c3                   	retq   

0000000000803f7d <devcons_close>:
  803f7d:	55                   	push   %rbp
  803f7e:	48 89 e5             	mov    %rsp,%rbp
  803f81:	48 83 ec 08          	sub    $0x8,%rsp
  803f85:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f89:	b8 00 00 00 00       	mov    $0x0,%eax
  803f8e:	c9                   	leaveq 
  803f8f:	c3                   	retq   

0000000000803f90 <devcons_stat>:
  803f90:	55                   	push   %rbp
  803f91:	48 89 e5             	mov    %rsp,%rbp
  803f94:	48 83 ec 10          	sub    $0x10,%rsp
  803f98:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803f9c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803fa0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fa4:	48 be 3a 4a 80 00 00 	movabs $0x804a3a,%rsi
  803fab:	00 00 00 
  803fae:	48 89 c7             	mov    %rax,%rdi
  803fb1:	48 b8 ea 11 80 00 00 	movabs $0x8011ea,%rax
  803fb8:	00 00 00 
  803fbb:	ff d0                	callq  *%rax
  803fbd:	b8 00 00 00 00       	mov    $0x0,%eax
  803fc2:	c9                   	leaveq 
  803fc3:	c3                   	retq   

0000000000803fc4 <ipc_recv>:
  803fc4:	55                   	push   %rbp
  803fc5:	48 89 e5             	mov    %rsp,%rbp
  803fc8:	48 83 ec 30          	sub    $0x30,%rsp
  803fcc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803fd0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803fd4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803fd8:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803fdd:	75 0e                	jne    803fed <ipc_recv+0x29>
  803fdf:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803fe6:	00 00 00 
  803fe9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803fed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ff1:	48 89 c7             	mov    %rax,%rdi
  803ff4:	48 b8 54 1d 80 00 00 	movabs $0x801d54,%rax
  803ffb:	00 00 00 
  803ffe:	ff d0                	callq  *%rax
  804000:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804003:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804007:	79 27                	jns    804030 <ipc_recv+0x6c>
  804009:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80400e:	74 0a                	je     80401a <ipc_recv+0x56>
  804010:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804014:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80401a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80401f:	74 0a                	je     80402b <ipc_recv+0x67>
  804021:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804025:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80402b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80402e:	eb 53                	jmp    804083 <ipc_recv+0xbf>
  804030:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804035:	74 19                	je     804050 <ipc_recv+0x8c>
  804037:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80403e:	00 00 00 
  804041:	48 8b 00             	mov    (%rax),%rax
  804044:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80404a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80404e:	89 10                	mov    %edx,(%rax)
  804050:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804055:	74 19                	je     804070 <ipc_recv+0xac>
  804057:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80405e:	00 00 00 
  804061:	48 8b 00             	mov    (%rax),%rax
  804064:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80406a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80406e:	89 10                	mov    %edx,(%rax)
  804070:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  804077:	00 00 00 
  80407a:	48 8b 00             	mov    (%rax),%rax
  80407d:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804083:	c9                   	leaveq 
  804084:	c3                   	retq   

0000000000804085 <ipc_send>:
  804085:	55                   	push   %rbp
  804086:	48 89 e5             	mov    %rsp,%rbp
  804089:	48 83 ec 30          	sub    $0x30,%rsp
  80408d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804090:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804093:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804097:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80409a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80409f:	75 1c                	jne    8040bd <ipc_send+0x38>
  8040a1:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8040a8:	00 00 00 
  8040ab:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8040af:	eb 0c                	jmp    8040bd <ipc_send+0x38>
  8040b1:	48 b8 dd 1a 80 00 00 	movabs $0x801add,%rax
  8040b8:	00 00 00 
  8040bb:	ff d0                	callq  *%rax
  8040bd:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8040c0:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8040c3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8040c7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040ca:	89 c7                	mov    %eax,%edi
  8040cc:	48 b8 fd 1c 80 00 00 	movabs $0x801cfd,%rax
  8040d3:	00 00 00 
  8040d6:	ff d0                	callq  *%rax
  8040d8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040db:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8040df:	74 d0                	je     8040b1 <ipc_send+0x2c>
  8040e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040e5:	79 30                	jns    804117 <ipc_send+0x92>
  8040e7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040ea:	89 c1                	mov    %eax,%ecx
  8040ec:	48 ba 48 4a 80 00 00 	movabs $0x804a48,%rdx
  8040f3:	00 00 00 
  8040f6:	be 44 00 00 00       	mov    $0x44,%esi
  8040fb:	48 bf 5e 4a 80 00 00 	movabs $0x804a5e,%rdi
  804102:	00 00 00 
  804105:	b8 00 00 00 00       	mov    $0x0,%eax
  80410a:	49 b8 20 04 80 00 00 	movabs $0x800420,%r8
  804111:	00 00 00 
  804114:	41 ff d0             	callq  *%r8
  804117:	90                   	nop
  804118:	c9                   	leaveq 
  804119:	c3                   	retq   

000000000080411a <ipc_host_recv>:
  80411a:	55                   	push   %rbp
  80411b:	48 89 e5             	mov    %rsp,%rbp
  80411e:	48 83 ec 10          	sub    $0x10,%rsp
  804122:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804126:	48 ba 70 4a 80 00 00 	movabs $0x804a70,%rdx
  80412d:	00 00 00 
  804130:	be 4e 00 00 00       	mov    $0x4e,%esi
  804135:	48 bf 5e 4a 80 00 00 	movabs $0x804a5e,%rdi
  80413c:	00 00 00 
  80413f:	b8 00 00 00 00       	mov    $0x0,%eax
  804144:	48 b9 20 04 80 00 00 	movabs $0x800420,%rcx
  80414b:	00 00 00 
  80414e:	ff d1                	callq  *%rcx

0000000000804150 <ipc_host_send>:
  804150:	55                   	push   %rbp
  804151:	48 89 e5             	mov    %rsp,%rbp
  804154:	48 83 ec 20          	sub    $0x20,%rsp
  804158:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80415b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80415e:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804162:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804165:	48 ba 90 4a 80 00 00 	movabs $0x804a90,%rdx
  80416c:	00 00 00 
  80416f:	be 58 00 00 00       	mov    $0x58,%esi
  804174:	48 bf 5e 4a 80 00 00 	movabs $0x804a5e,%rdi
  80417b:	00 00 00 
  80417e:	b8 00 00 00 00       	mov    $0x0,%eax
  804183:	48 b9 20 04 80 00 00 	movabs $0x800420,%rcx
  80418a:	00 00 00 
  80418d:	ff d1                	callq  *%rcx

000000000080418f <ipc_find_env>:
  80418f:	55                   	push   %rbp
  804190:	48 89 e5             	mov    %rsp,%rbp
  804193:	48 83 ec 18          	sub    $0x18,%rsp
  804197:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80419a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8041a1:	eb 4d                	jmp    8041f0 <ipc_find_env+0x61>
  8041a3:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8041aa:	00 00 00 
  8041ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041b0:	48 98                	cltq   
  8041b2:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8041b9:	48 01 d0             	add    %rdx,%rax
  8041bc:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8041c2:	8b 00                	mov    (%rax),%eax
  8041c4:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8041c7:	75 23                	jne    8041ec <ipc_find_env+0x5d>
  8041c9:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8041d0:	00 00 00 
  8041d3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041d6:	48 98                	cltq   
  8041d8:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8041df:	48 01 d0             	add    %rdx,%rax
  8041e2:	48 05 c8 00 00 00    	add    $0xc8,%rax
  8041e8:	8b 00                	mov    (%rax),%eax
  8041ea:	eb 12                	jmp    8041fe <ipc_find_env+0x6f>
  8041ec:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8041f0:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8041f7:	7e aa                	jle    8041a3 <ipc_find_env+0x14>
  8041f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8041fe:	c9                   	leaveq 
  8041ff:	c3                   	retq   

0000000000804200 <pageref>:
  804200:	55                   	push   %rbp
  804201:	48 89 e5             	mov    %rsp,%rbp
  804204:	48 83 ec 18          	sub    $0x18,%rsp
  804208:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80420c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804210:	48 c1 e8 15          	shr    $0x15,%rax
  804214:	48 89 c2             	mov    %rax,%rdx
  804217:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80421e:	01 00 00 
  804221:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804225:	83 e0 01             	and    $0x1,%eax
  804228:	48 85 c0             	test   %rax,%rax
  80422b:	75 07                	jne    804234 <pageref+0x34>
  80422d:	b8 00 00 00 00       	mov    $0x0,%eax
  804232:	eb 56                	jmp    80428a <pageref+0x8a>
  804234:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804238:	48 c1 e8 0c          	shr    $0xc,%rax
  80423c:	48 89 c2             	mov    %rax,%rdx
  80423f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804246:	01 00 00 
  804249:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80424d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804251:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804255:	83 e0 01             	and    $0x1,%eax
  804258:	48 85 c0             	test   %rax,%rax
  80425b:	75 07                	jne    804264 <pageref+0x64>
  80425d:	b8 00 00 00 00       	mov    $0x0,%eax
  804262:	eb 26                	jmp    80428a <pageref+0x8a>
  804264:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804268:	48 c1 e8 0c          	shr    $0xc,%rax
  80426c:	48 89 c2             	mov    %rax,%rdx
  80426f:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804276:	00 00 00 
  804279:	48 c1 e2 04          	shl    $0x4,%rdx
  80427d:	48 01 d0             	add    %rdx,%rax
  804280:	48 83 c0 08          	add    $0x8,%rax
  804284:	0f b7 00             	movzwl (%rax),%eax
  804287:	0f b7 c0             	movzwl %ax,%eax
  80428a:	c9                   	leaveq 
  80428b:	c3                   	retq   
