
vmm/guest/obj/user/forktree:     file format elf64-x86-64


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
  80003c:	e8 2e 01 00 00       	callq  80016f <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <forkchild>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80004f:	89 f0                	mov    %esi,%eax
  800051:	88 45 e4             	mov    %al,-0x1c(%rbp)
  800054:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800058:	48 89 c7             	mov    %rax,%rdi
  80005b:	48 b8 61 0e 80 00 00 	movabs $0x800e61,%rax
  800062:	00 00 00 
  800065:	ff d0                	callq  *%rax
  800067:	83 f8 02             	cmp    $0x2,%eax
  80006a:	7f 67                	jg     8000d3 <forkchild+0x90>
  80006c:	0f be 4d e4          	movsbl -0x1c(%rbp),%ecx
  800070:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800074:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
  800078:	41 89 c8             	mov    %ecx,%r8d
  80007b:	48 89 d1             	mov    %rdx,%rcx
  80007e:	48 ba e0 47 80 00 00 	movabs $0x8047e0,%rdx
  800085:	00 00 00 
  800088:	be 04 00 00 00       	mov    $0x4,%esi
  80008d:	48 89 c7             	mov    %rax,%rdi
  800090:	b8 00 00 00 00       	mov    $0x0,%eax
  800095:	49 b9 80 0d 80 00 00 	movabs $0x800d80,%r9
  80009c:	00 00 00 
  80009f:	41 ff d1             	callq  *%r9
  8000a2:	48 b8 9a 1f 80 00 00 	movabs $0x801f9a,%rax
  8000a9:	00 00 00 
  8000ac:	ff d0                	callq  *%rax
  8000ae:	85 c0                	test   %eax,%eax
  8000b0:	75 22                	jne    8000d4 <forkchild+0x91>
  8000b2:	48 8d 45 fc          	lea    -0x4(%rbp),%rax
  8000b6:	48 89 c7             	mov    %rax,%rdi
  8000b9:	48 b8 d6 00 80 00 00 	movabs $0x8000d6,%rax
  8000c0:	00 00 00 
  8000c3:	ff d0                	callq  *%rax
  8000c5:	48 b8 f3 01 80 00 00 	movabs $0x8001f3,%rax
  8000cc:	00 00 00 
  8000cf:	ff d0                	callq  *%rax
  8000d1:	eb 01                	jmp    8000d4 <forkchild+0x91>
  8000d3:	90                   	nop
  8000d4:	c9                   	leaveq 
  8000d5:	c3                   	retq   

00000000008000d6 <forktree>:
  8000d6:	55                   	push   %rbp
  8000d7:	48 89 e5             	mov    %rsp,%rbp
  8000da:	48 83 ec 10          	sub    $0x10,%rsp
  8000de:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8000e2:	48 b8 84 17 80 00 00 	movabs $0x801784,%rax
  8000e9:	00 00 00 
  8000ec:	ff d0                	callq  *%rax
  8000ee:	89 c1                	mov    %eax,%ecx
  8000f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8000f4:	48 89 c2             	mov    %rax,%rdx
  8000f7:	89 ce                	mov    %ecx,%esi
  8000f9:	48 bf e5 47 80 00 00 	movabs $0x8047e5,%rdi
  800100:	00 00 00 
  800103:	b8 00 00 00 00       	mov    $0x0,%eax
  800108:	48 b9 3d 03 80 00 00 	movabs $0x80033d,%rcx
  80010f:	00 00 00 
  800112:	ff d1                	callq  *%rcx
  800114:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800118:	be 30 00 00 00       	mov    $0x30,%esi
  80011d:	48 89 c7             	mov    %rax,%rdi
  800120:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800127:	00 00 00 
  80012a:	ff d0                	callq  *%rax
  80012c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800130:	be 31 00 00 00       	mov    $0x31,%esi
  800135:	48 89 c7             	mov    %rax,%rdi
  800138:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80013f:	00 00 00 
  800142:	ff d0                	callq  *%rax
  800144:	90                   	nop
  800145:	c9                   	leaveq 
  800146:	c3                   	retq   

0000000000800147 <umain>:
  800147:	55                   	push   %rbp
  800148:	48 89 e5             	mov    %rsp,%rbp
  80014b:	48 83 ec 10          	sub    $0x10,%rsp
  80014f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800152:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800156:	48 bf f6 47 80 00 00 	movabs $0x8047f6,%rdi
  80015d:	00 00 00 
  800160:	48 b8 d6 00 80 00 00 	movabs $0x8000d6,%rax
  800167:	00 00 00 
  80016a:	ff d0                	callq  *%rax
  80016c:	90                   	nop
  80016d:	c9                   	leaveq 
  80016e:	c3                   	retq   

000000000080016f <libmain>:
  80016f:	55                   	push   %rbp
  800170:	48 89 e5             	mov    %rsp,%rbp
  800173:	48 83 ec 10          	sub    $0x10,%rsp
  800177:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80017a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80017e:	48 b8 84 17 80 00 00 	movabs $0x801784,%rax
  800185:	00 00 00 
  800188:	ff d0                	callq  *%rax
  80018a:	25 ff 03 00 00       	and    $0x3ff,%eax
  80018f:	48 98                	cltq   
  800191:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800198:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80019f:	00 00 00 
  8001a2:	48 01 c2             	add    %rax,%rdx
  8001a5:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8001ac:	00 00 00 
  8001af:	48 89 10             	mov    %rdx,(%rax)
  8001b2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001b6:	7e 14                	jle    8001cc <libmain+0x5d>
  8001b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001bc:	48 8b 10             	mov    (%rax),%rdx
  8001bf:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8001c6:	00 00 00 
  8001c9:	48 89 10             	mov    %rdx,(%rax)
  8001cc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8001d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001d3:	48 89 d6             	mov    %rdx,%rsi
  8001d6:	89 c7                	mov    %eax,%edi
  8001d8:	48 b8 47 01 80 00 00 	movabs $0x800147,%rax
  8001df:	00 00 00 
  8001e2:	ff d0                	callq  *%rax
  8001e4:	48 b8 f3 01 80 00 00 	movabs $0x8001f3,%rax
  8001eb:	00 00 00 
  8001ee:	ff d0                	callq  *%rax
  8001f0:	90                   	nop
  8001f1:	c9                   	leaveq 
  8001f2:	c3                   	retq   

00000000008001f3 <exit>:
  8001f3:	55                   	push   %rbp
  8001f4:	48 89 e5             	mov    %rsp,%rbp
  8001f7:	48 b8 54 25 80 00 00 	movabs $0x802554,%rax
  8001fe:	00 00 00 
  800201:	ff d0                	callq  *%rax
  800203:	bf 00 00 00 00       	mov    $0x0,%edi
  800208:	48 b8 3e 17 80 00 00 	movabs $0x80173e,%rax
  80020f:	00 00 00 
  800212:	ff d0                	callq  *%rax
  800214:	90                   	nop
  800215:	5d                   	pop    %rbp
  800216:	c3                   	retq   

0000000000800217 <putch>:
  800217:	55                   	push   %rbp
  800218:	48 89 e5             	mov    %rsp,%rbp
  80021b:	48 83 ec 10          	sub    $0x10,%rsp
  80021f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800222:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800226:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80022a:	8b 00                	mov    (%rax),%eax
  80022c:	8d 48 01             	lea    0x1(%rax),%ecx
  80022f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800233:	89 0a                	mov    %ecx,(%rdx)
  800235:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800238:	89 d1                	mov    %edx,%ecx
  80023a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80023e:	48 98                	cltq   
  800240:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800244:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800248:	8b 00                	mov    (%rax),%eax
  80024a:	3d ff 00 00 00       	cmp    $0xff,%eax
  80024f:	75 2c                	jne    80027d <putch+0x66>
  800251:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800255:	8b 00                	mov    (%rax),%eax
  800257:	48 98                	cltq   
  800259:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80025d:	48 83 c2 08          	add    $0x8,%rdx
  800261:	48 89 c6             	mov    %rax,%rsi
  800264:	48 89 d7             	mov    %rdx,%rdi
  800267:	48 b8 b5 16 80 00 00 	movabs $0x8016b5,%rax
  80026e:	00 00 00 
  800271:	ff d0                	callq  *%rax
  800273:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800277:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80027d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800281:	8b 40 04             	mov    0x4(%rax),%eax
  800284:	8d 50 01             	lea    0x1(%rax),%edx
  800287:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80028b:	89 50 04             	mov    %edx,0x4(%rax)
  80028e:	90                   	nop
  80028f:	c9                   	leaveq 
  800290:	c3                   	retq   

0000000000800291 <vcprintf>:
  800291:	55                   	push   %rbp
  800292:	48 89 e5             	mov    %rsp,%rbp
  800295:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80029c:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8002a3:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8002aa:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8002b1:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8002b8:	48 8b 0a             	mov    (%rdx),%rcx
  8002bb:	48 89 08             	mov    %rcx,(%rax)
  8002be:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8002c2:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8002c6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8002ca:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8002ce:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8002d5:	00 00 00 
  8002d8:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8002df:	00 00 00 
  8002e2:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8002e9:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8002f0:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8002f7:	48 89 c6             	mov    %rax,%rsi
  8002fa:	48 bf 17 02 80 00 00 	movabs $0x800217,%rdi
  800301:	00 00 00 
  800304:	48 b8 db 06 80 00 00 	movabs $0x8006db,%rax
  80030b:	00 00 00 
  80030e:	ff d0                	callq  *%rax
  800310:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800316:	48 98                	cltq   
  800318:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80031f:	48 83 c2 08          	add    $0x8,%rdx
  800323:	48 89 c6             	mov    %rax,%rsi
  800326:	48 89 d7             	mov    %rdx,%rdi
  800329:	48 b8 b5 16 80 00 00 	movabs $0x8016b5,%rax
  800330:	00 00 00 
  800333:	ff d0                	callq  *%rax
  800335:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80033b:	c9                   	leaveq 
  80033c:	c3                   	retq   

000000000080033d <cprintf>:
  80033d:	55                   	push   %rbp
  80033e:	48 89 e5             	mov    %rsp,%rbp
  800341:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800348:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80034f:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800356:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80035d:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800364:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80036b:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800372:	84 c0                	test   %al,%al
  800374:	74 20                	je     800396 <cprintf+0x59>
  800376:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80037a:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80037e:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800382:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800386:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80038a:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80038e:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800392:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800396:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80039d:	00 00 00 
  8003a0:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8003a7:	00 00 00 
  8003aa:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8003ae:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8003b5:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8003bc:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8003c3:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8003ca:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8003d1:	48 8b 0a             	mov    (%rdx),%rcx
  8003d4:	48 89 08             	mov    %rcx,(%rax)
  8003d7:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8003db:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8003df:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8003e3:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8003e7:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8003ee:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8003f5:	48 89 d6             	mov    %rdx,%rsi
  8003f8:	48 89 c7             	mov    %rax,%rdi
  8003fb:	48 b8 91 02 80 00 00 	movabs $0x800291,%rax
  800402:	00 00 00 
  800405:	ff d0                	callq  *%rax
  800407:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80040d:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800413:	c9                   	leaveq 
  800414:	c3                   	retq   

0000000000800415 <printnum>:
  800415:	55                   	push   %rbp
  800416:	48 89 e5             	mov    %rsp,%rbp
  800419:	48 83 ec 30          	sub    $0x30,%rsp
  80041d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800421:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800425:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800429:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80042c:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800430:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800434:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800437:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  80043b:	77 54                	ja     800491 <printnum+0x7c>
  80043d:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800440:	8d 78 ff             	lea    -0x1(%rax),%edi
  800443:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800446:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80044a:	ba 00 00 00 00       	mov    $0x0,%edx
  80044f:	48 f7 f6             	div    %rsi
  800452:	49 89 c2             	mov    %rax,%r10
  800455:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800458:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80045b:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80045f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800463:	41 89 c9             	mov    %ecx,%r9d
  800466:	41 89 f8             	mov    %edi,%r8d
  800469:	89 d1                	mov    %edx,%ecx
  80046b:	4c 89 d2             	mov    %r10,%rdx
  80046e:	48 89 c7             	mov    %rax,%rdi
  800471:	48 b8 15 04 80 00 00 	movabs $0x800415,%rax
  800478:	00 00 00 
  80047b:	ff d0                	callq  *%rax
  80047d:	eb 1c                	jmp    80049b <printnum+0x86>
  80047f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800483:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800486:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80048a:	48 89 ce             	mov    %rcx,%rsi
  80048d:	89 d7                	mov    %edx,%edi
  80048f:	ff d0                	callq  *%rax
  800491:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800495:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800499:	7f e4                	jg     80047f <printnum+0x6a>
  80049b:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80049e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004a2:	ba 00 00 00 00       	mov    $0x0,%edx
  8004a7:	48 f7 f1             	div    %rcx
  8004aa:	48 b8 10 4a 80 00 00 	movabs $0x804a10,%rax
  8004b1:	00 00 00 
  8004b4:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8004b8:	0f be d0             	movsbl %al,%edx
  8004bb:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8004bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004c3:	48 89 ce             	mov    %rcx,%rsi
  8004c6:	89 d7                	mov    %edx,%edi
  8004c8:	ff d0                	callq  *%rax
  8004ca:	90                   	nop
  8004cb:	c9                   	leaveq 
  8004cc:	c3                   	retq   

00000000008004cd <getuint>:
  8004cd:	55                   	push   %rbp
  8004ce:	48 89 e5             	mov    %rsp,%rbp
  8004d1:	48 83 ec 20          	sub    $0x20,%rsp
  8004d5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8004d9:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8004dc:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8004e0:	7e 4f                	jle    800531 <getuint+0x64>
  8004e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004e6:	8b 00                	mov    (%rax),%eax
  8004e8:	83 f8 30             	cmp    $0x30,%eax
  8004eb:	73 24                	jae    800511 <getuint+0x44>
  8004ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004f1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8004f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004f9:	8b 00                	mov    (%rax),%eax
  8004fb:	89 c0                	mov    %eax,%eax
  8004fd:	48 01 d0             	add    %rdx,%rax
  800500:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800504:	8b 12                	mov    (%rdx),%edx
  800506:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800509:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80050d:	89 0a                	mov    %ecx,(%rdx)
  80050f:	eb 14                	jmp    800525 <getuint+0x58>
  800511:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800515:	48 8b 40 08          	mov    0x8(%rax),%rax
  800519:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80051d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800521:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800525:	48 8b 00             	mov    (%rax),%rax
  800528:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80052c:	e9 9d 00 00 00       	jmpq   8005ce <getuint+0x101>
  800531:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800535:	74 4c                	je     800583 <getuint+0xb6>
  800537:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80053b:	8b 00                	mov    (%rax),%eax
  80053d:	83 f8 30             	cmp    $0x30,%eax
  800540:	73 24                	jae    800566 <getuint+0x99>
  800542:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800546:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80054a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80054e:	8b 00                	mov    (%rax),%eax
  800550:	89 c0                	mov    %eax,%eax
  800552:	48 01 d0             	add    %rdx,%rax
  800555:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800559:	8b 12                	mov    (%rdx),%edx
  80055b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80055e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800562:	89 0a                	mov    %ecx,(%rdx)
  800564:	eb 14                	jmp    80057a <getuint+0xad>
  800566:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80056a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80056e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800572:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800576:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80057a:	48 8b 00             	mov    (%rax),%rax
  80057d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800581:	eb 4b                	jmp    8005ce <getuint+0x101>
  800583:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800587:	8b 00                	mov    (%rax),%eax
  800589:	83 f8 30             	cmp    $0x30,%eax
  80058c:	73 24                	jae    8005b2 <getuint+0xe5>
  80058e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800592:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800596:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80059a:	8b 00                	mov    (%rax),%eax
  80059c:	89 c0                	mov    %eax,%eax
  80059e:	48 01 d0             	add    %rdx,%rax
  8005a1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005a5:	8b 12                	mov    (%rdx),%edx
  8005a7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005aa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005ae:	89 0a                	mov    %ecx,(%rdx)
  8005b0:	eb 14                	jmp    8005c6 <getuint+0xf9>
  8005b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005b6:	48 8b 40 08          	mov    0x8(%rax),%rax
  8005ba:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8005be:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005c2:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005c6:	8b 00                	mov    (%rax),%eax
  8005c8:	89 c0                	mov    %eax,%eax
  8005ca:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005d2:	c9                   	leaveq 
  8005d3:	c3                   	retq   

00000000008005d4 <getint>:
  8005d4:	55                   	push   %rbp
  8005d5:	48 89 e5             	mov    %rsp,%rbp
  8005d8:	48 83 ec 20          	sub    $0x20,%rsp
  8005dc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8005e0:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8005e3:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8005e7:	7e 4f                	jle    800638 <getint+0x64>
  8005e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ed:	8b 00                	mov    (%rax),%eax
  8005ef:	83 f8 30             	cmp    $0x30,%eax
  8005f2:	73 24                	jae    800618 <getint+0x44>
  8005f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005f8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800600:	8b 00                	mov    (%rax),%eax
  800602:	89 c0                	mov    %eax,%eax
  800604:	48 01 d0             	add    %rdx,%rax
  800607:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80060b:	8b 12                	mov    (%rdx),%edx
  80060d:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800610:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800614:	89 0a                	mov    %ecx,(%rdx)
  800616:	eb 14                	jmp    80062c <getint+0x58>
  800618:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80061c:	48 8b 40 08          	mov    0x8(%rax),%rax
  800620:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800624:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800628:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80062c:	48 8b 00             	mov    (%rax),%rax
  80062f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800633:	e9 9d 00 00 00       	jmpq   8006d5 <getint+0x101>
  800638:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80063c:	74 4c                	je     80068a <getint+0xb6>
  80063e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800642:	8b 00                	mov    (%rax),%eax
  800644:	83 f8 30             	cmp    $0x30,%eax
  800647:	73 24                	jae    80066d <getint+0x99>
  800649:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80064d:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800651:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800655:	8b 00                	mov    (%rax),%eax
  800657:	89 c0                	mov    %eax,%eax
  800659:	48 01 d0             	add    %rdx,%rax
  80065c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800660:	8b 12                	mov    (%rdx),%edx
  800662:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800665:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800669:	89 0a                	mov    %ecx,(%rdx)
  80066b:	eb 14                	jmp    800681 <getint+0xad>
  80066d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800671:	48 8b 40 08          	mov    0x8(%rax),%rax
  800675:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800679:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80067d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800681:	48 8b 00             	mov    (%rax),%rax
  800684:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800688:	eb 4b                	jmp    8006d5 <getint+0x101>
  80068a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80068e:	8b 00                	mov    (%rax),%eax
  800690:	83 f8 30             	cmp    $0x30,%eax
  800693:	73 24                	jae    8006b9 <getint+0xe5>
  800695:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800699:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80069d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a1:	8b 00                	mov    (%rax),%eax
  8006a3:	89 c0                	mov    %eax,%eax
  8006a5:	48 01 d0             	add    %rdx,%rax
  8006a8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ac:	8b 12                	mov    (%rdx),%edx
  8006ae:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006b1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b5:	89 0a                	mov    %ecx,(%rdx)
  8006b7:	eb 14                	jmp    8006cd <getint+0xf9>
  8006b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006bd:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006c1:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8006c5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006c9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006cd:	8b 00                	mov    (%rax),%eax
  8006cf:	48 98                	cltq   
  8006d1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006d9:	c9                   	leaveq 
  8006da:	c3                   	retq   

00000000008006db <vprintfmt>:
  8006db:	55                   	push   %rbp
  8006dc:	48 89 e5             	mov    %rsp,%rbp
  8006df:	41 54                	push   %r12
  8006e1:	53                   	push   %rbx
  8006e2:	48 83 ec 60          	sub    $0x60,%rsp
  8006e6:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8006ea:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8006ee:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8006f2:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8006f6:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8006fa:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8006fe:	48 8b 0a             	mov    (%rdx),%rcx
  800701:	48 89 08             	mov    %rcx,(%rax)
  800704:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800708:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80070c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800710:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800714:	eb 17                	jmp    80072d <vprintfmt+0x52>
  800716:	85 db                	test   %ebx,%ebx
  800718:	0f 84 b9 04 00 00    	je     800bd7 <vprintfmt+0x4fc>
  80071e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800722:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800726:	48 89 d6             	mov    %rdx,%rsi
  800729:	89 df                	mov    %ebx,%edi
  80072b:	ff d0                	callq  *%rax
  80072d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800731:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800735:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800739:	0f b6 00             	movzbl (%rax),%eax
  80073c:	0f b6 d8             	movzbl %al,%ebx
  80073f:	83 fb 25             	cmp    $0x25,%ebx
  800742:	75 d2                	jne    800716 <vprintfmt+0x3b>
  800744:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800748:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  80074f:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800756:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80075d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800764:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800768:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80076c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800770:	0f b6 00             	movzbl (%rax),%eax
  800773:	0f b6 d8             	movzbl %al,%ebx
  800776:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800779:	83 f8 55             	cmp    $0x55,%eax
  80077c:	0f 87 22 04 00 00    	ja     800ba4 <vprintfmt+0x4c9>
  800782:	89 c0                	mov    %eax,%eax
  800784:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80078b:	00 
  80078c:	48 b8 38 4a 80 00 00 	movabs $0x804a38,%rax
  800793:	00 00 00 
  800796:	48 01 d0             	add    %rdx,%rax
  800799:	48 8b 00             	mov    (%rax),%rax
  80079c:	ff e0                	jmpq   *%rax
  80079e:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8007a2:	eb c0                	jmp    800764 <vprintfmt+0x89>
  8007a4:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8007a8:	eb ba                	jmp    800764 <vprintfmt+0x89>
  8007aa:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8007b1:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8007b4:	89 d0                	mov    %edx,%eax
  8007b6:	c1 e0 02             	shl    $0x2,%eax
  8007b9:	01 d0                	add    %edx,%eax
  8007bb:	01 c0                	add    %eax,%eax
  8007bd:	01 d8                	add    %ebx,%eax
  8007bf:	83 e8 30             	sub    $0x30,%eax
  8007c2:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8007c5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8007c9:	0f b6 00             	movzbl (%rax),%eax
  8007cc:	0f be d8             	movsbl %al,%ebx
  8007cf:	83 fb 2f             	cmp    $0x2f,%ebx
  8007d2:	7e 60                	jle    800834 <vprintfmt+0x159>
  8007d4:	83 fb 39             	cmp    $0x39,%ebx
  8007d7:	7f 5b                	jg     800834 <vprintfmt+0x159>
  8007d9:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8007de:	eb d1                	jmp    8007b1 <vprintfmt+0xd6>
  8007e0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007e3:	83 f8 30             	cmp    $0x30,%eax
  8007e6:	73 17                	jae    8007ff <vprintfmt+0x124>
  8007e8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8007ec:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8007ef:	89 d2                	mov    %edx,%edx
  8007f1:	48 01 d0             	add    %rdx,%rax
  8007f4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8007f7:	83 c2 08             	add    $0x8,%edx
  8007fa:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8007fd:	eb 0c                	jmp    80080b <vprintfmt+0x130>
  8007ff:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800803:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800807:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80080b:	8b 00                	mov    (%rax),%eax
  80080d:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800810:	eb 23                	jmp    800835 <vprintfmt+0x15a>
  800812:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800816:	0f 89 48 ff ff ff    	jns    800764 <vprintfmt+0x89>
  80081c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800823:	e9 3c ff ff ff       	jmpq   800764 <vprintfmt+0x89>
  800828:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  80082f:	e9 30 ff ff ff       	jmpq   800764 <vprintfmt+0x89>
  800834:	90                   	nop
  800835:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800839:	0f 89 25 ff ff ff    	jns    800764 <vprintfmt+0x89>
  80083f:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800842:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800845:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80084c:	e9 13 ff ff ff       	jmpq   800764 <vprintfmt+0x89>
  800851:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800855:	e9 0a ff ff ff       	jmpq   800764 <vprintfmt+0x89>
  80085a:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80085d:	83 f8 30             	cmp    $0x30,%eax
  800860:	73 17                	jae    800879 <vprintfmt+0x19e>
  800862:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800866:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800869:	89 d2                	mov    %edx,%edx
  80086b:	48 01 d0             	add    %rdx,%rax
  80086e:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800871:	83 c2 08             	add    $0x8,%edx
  800874:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800877:	eb 0c                	jmp    800885 <vprintfmt+0x1aa>
  800879:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80087d:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800881:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800885:	8b 10                	mov    (%rax),%edx
  800887:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  80088b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80088f:	48 89 ce             	mov    %rcx,%rsi
  800892:	89 d7                	mov    %edx,%edi
  800894:	ff d0                	callq  *%rax
  800896:	e9 37 03 00 00       	jmpq   800bd2 <vprintfmt+0x4f7>
  80089b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80089e:	83 f8 30             	cmp    $0x30,%eax
  8008a1:	73 17                	jae    8008ba <vprintfmt+0x1df>
  8008a3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8008a7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008aa:	89 d2                	mov    %edx,%edx
  8008ac:	48 01 d0             	add    %rdx,%rax
  8008af:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008b2:	83 c2 08             	add    $0x8,%edx
  8008b5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8008b8:	eb 0c                	jmp    8008c6 <vprintfmt+0x1eb>
  8008ba:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8008be:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8008c2:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8008c6:	8b 18                	mov    (%rax),%ebx
  8008c8:	85 db                	test   %ebx,%ebx
  8008ca:	79 02                	jns    8008ce <vprintfmt+0x1f3>
  8008cc:	f7 db                	neg    %ebx
  8008ce:	83 fb 15             	cmp    $0x15,%ebx
  8008d1:	7f 16                	jg     8008e9 <vprintfmt+0x20e>
  8008d3:	48 b8 60 49 80 00 00 	movabs $0x804960,%rax
  8008da:	00 00 00 
  8008dd:	48 63 d3             	movslq %ebx,%rdx
  8008e0:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  8008e4:	4d 85 e4             	test   %r12,%r12
  8008e7:	75 2e                	jne    800917 <vprintfmt+0x23c>
  8008e9:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8008ed:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008f1:	89 d9                	mov    %ebx,%ecx
  8008f3:	48 ba 21 4a 80 00 00 	movabs $0x804a21,%rdx
  8008fa:	00 00 00 
  8008fd:	48 89 c7             	mov    %rax,%rdi
  800900:	b8 00 00 00 00       	mov    $0x0,%eax
  800905:	49 b8 e1 0b 80 00 00 	movabs $0x800be1,%r8
  80090c:	00 00 00 
  80090f:	41 ff d0             	callq  *%r8
  800912:	e9 bb 02 00 00       	jmpq   800bd2 <vprintfmt+0x4f7>
  800917:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80091b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80091f:	4c 89 e1             	mov    %r12,%rcx
  800922:	48 ba 2a 4a 80 00 00 	movabs $0x804a2a,%rdx
  800929:	00 00 00 
  80092c:	48 89 c7             	mov    %rax,%rdi
  80092f:	b8 00 00 00 00       	mov    $0x0,%eax
  800934:	49 b8 e1 0b 80 00 00 	movabs $0x800be1,%r8
  80093b:	00 00 00 
  80093e:	41 ff d0             	callq  *%r8
  800941:	e9 8c 02 00 00       	jmpq   800bd2 <vprintfmt+0x4f7>
  800946:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800949:	83 f8 30             	cmp    $0x30,%eax
  80094c:	73 17                	jae    800965 <vprintfmt+0x28a>
  80094e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800952:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800955:	89 d2                	mov    %edx,%edx
  800957:	48 01 d0             	add    %rdx,%rax
  80095a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80095d:	83 c2 08             	add    $0x8,%edx
  800960:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800963:	eb 0c                	jmp    800971 <vprintfmt+0x296>
  800965:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800969:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80096d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800971:	4c 8b 20             	mov    (%rax),%r12
  800974:	4d 85 e4             	test   %r12,%r12
  800977:	75 0a                	jne    800983 <vprintfmt+0x2a8>
  800979:	49 bc 2d 4a 80 00 00 	movabs $0x804a2d,%r12
  800980:	00 00 00 
  800983:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800987:	7e 78                	jle    800a01 <vprintfmt+0x326>
  800989:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  80098d:	74 72                	je     800a01 <vprintfmt+0x326>
  80098f:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800992:	48 98                	cltq   
  800994:	48 89 c6             	mov    %rax,%rsi
  800997:	4c 89 e7             	mov    %r12,%rdi
  80099a:	48 b8 8f 0e 80 00 00 	movabs $0x800e8f,%rax
  8009a1:	00 00 00 
  8009a4:	ff d0                	callq  *%rax
  8009a6:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8009a9:	eb 17                	jmp    8009c2 <vprintfmt+0x2e7>
  8009ab:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8009af:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8009b3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009b7:	48 89 ce             	mov    %rcx,%rsi
  8009ba:	89 d7                	mov    %edx,%edi
  8009bc:	ff d0                	callq  *%rax
  8009be:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8009c2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009c6:	7f e3                	jg     8009ab <vprintfmt+0x2d0>
  8009c8:	eb 37                	jmp    800a01 <vprintfmt+0x326>
  8009ca:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8009ce:	74 1e                	je     8009ee <vprintfmt+0x313>
  8009d0:	83 fb 1f             	cmp    $0x1f,%ebx
  8009d3:	7e 05                	jle    8009da <vprintfmt+0x2ff>
  8009d5:	83 fb 7e             	cmp    $0x7e,%ebx
  8009d8:	7e 14                	jle    8009ee <vprintfmt+0x313>
  8009da:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009de:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009e2:	48 89 d6             	mov    %rdx,%rsi
  8009e5:	bf 3f 00 00 00       	mov    $0x3f,%edi
  8009ea:	ff d0                	callq  *%rax
  8009ec:	eb 0f                	jmp    8009fd <vprintfmt+0x322>
  8009ee:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8009f2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009f6:	48 89 d6             	mov    %rdx,%rsi
  8009f9:	89 df                	mov    %ebx,%edi
  8009fb:	ff d0                	callq  *%rax
  8009fd:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a01:	4c 89 e0             	mov    %r12,%rax
  800a04:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800a08:	0f b6 00             	movzbl (%rax),%eax
  800a0b:	0f be d8             	movsbl %al,%ebx
  800a0e:	85 db                	test   %ebx,%ebx
  800a10:	74 28                	je     800a3a <vprintfmt+0x35f>
  800a12:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a16:	78 b2                	js     8009ca <vprintfmt+0x2ef>
  800a18:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800a1c:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a20:	79 a8                	jns    8009ca <vprintfmt+0x2ef>
  800a22:	eb 16                	jmp    800a3a <vprintfmt+0x35f>
  800a24:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a28:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a2c:	48 89 d6             	mov    %rdx,%rsi
  800a2f:	bf 20 00 00 00       	mov    $0x20,%edi
  800a34:	ff d0                	callq  *%rax
  800a36:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a3a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a3e:	7f e4                	jg     800a24 <vprintfmt+0x349>
  800a40:	e9 8d 01 00 00       	jmpq   800bd2 <vprintfmt+0x4f7>
  800a45:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a49:	be 03 00 00 00       	mov    $0x3,%esi
  800a4e:	48 89 c7             	mov    %rax,%rdi
  800a51:	48 b8 d4 05 80 00 00 	movabs $0x8005d4,%rax
  800a58:	00 00 00 
  800a5b:	ff d0                	callq  *%rax
  800a5d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a65:	48 85 c0             	test   %rax,%rax
  800a68:	79 1d                	jns    800a87 <vprintfmt+0x3ac>
  800a6a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a6e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a72:	48 89 d6             	mov    %rdx,%rsi
  800a75:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800a7a:	ff d0                	callq  *%rax
  800a7c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a80:	48 f7 d8             	neg    %rax
  800a83:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a87:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800a8e:	e9 d2 00 00 00       	jmpq   800b65 <vprintfmt+0x48a>
  800a93:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a97:	be 03 00 00 00       	mov    $0x3,%esi
  800a9c:	48 89 c7             	mov    %rax,%rdi
  800a9f:	48 b8 cd 04 80 00 00 	movabs $0x8004cd,%rax
  800aa6:	00 00 00 
  800aa9:	ff d0                	callq  *%rax
  800aab:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800aaf:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800ab6:	e9 aa 00 00 00       	jmpq   800b65 <vprintfmt+0x48a>
  800abb:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800abf:	be 03 00 00 00       	mov    $0x3,%esi
  800ac4:	48 89 c7             	mov    %rax,%rdi
  800ac7:	48 b8 cd 04 80 00 00 	movabs $0x8004cd,%rax
  800ace:	00 00 00 
  800ad1:	ff d0                	callq  *%rax
  800ad3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ad7:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800ade:	e9 82 00 00 00       	jmpq   800b65 <vprintfmt+0x48a>
  800ae3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ae7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800aeb:	48 89 d6             	mov    %rdx,%rsi
  800aee:	bf 30 00 00 00       	mov    $0x30,%edi
  800af3:	ff d0                	callq  *%rax
  800af5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800af9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800afd:	48 89 d6             	mov    %rdx,%rsi
  800b00:	bf 78 00 00 00       	mov    $0x78,%edi
  800b05:	ff d0                	callq  *%rax
  800b07:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b0a:	83 f8 30             	cmp    $0x30,%eax
  800b0d:	73 17                	jae    800b26 <vprintfmt+0x44b>
  800b0f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b13:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b16:	89 d2                	mov    %edx,%edx
  800b18:	48 01 d0             	add    %rdx,%rax
  800b1b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b1e:	83 c2 08             	add    $0x8,%edx
  800b21:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b24:	eb 0c                	jmp    800b32 <vprintfmt+0x457>
  800b26:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b2a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b2e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b32:	48 8b 00             	mov    (%rax),%rax
  800b35:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b39:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800b40:	eb 23                	jmp    800b65 <vprintfmt+0x48a>
  800b42:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b46:	be 03 00 00 00       	mov    $0x3,%esi
  800b4b:	48 89 c7             	mov    %rax,%rdi
  800b4e:	48 b8 cd 04 80 00 00 	movabs $0x8004cd,%rax
  800b55:	00 00 00 
  800b58:	ff d0                	callq  *%rax
  800b5a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b5e:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800b65:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800b6a:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800b6d:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800b70:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b74:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b78:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b7c:	45 89 c1             	mov    %r8d,%r9d
  800b7f:	41 89 f8             	mov    %edi,%r8d
  800b82:	48 89 c7             	mov    %rax,%rdi
  800b85:	48 b8 15 04 80 00 00 	movabs $0x800415,%rax
  800b8c:	00 00 00 
  800b8f:	ff d0                	callq  *%rax
  800b91:	eb 3f                	jmp    800bd2 <vprintfmt+0x4f7>
  800b93:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b97:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b9b:	48 89 d6             	mov    %rdx,%rsi
  800b9e:	89 df                	mov    %ebx,%edi
  800ba0:	ff d0                	callq  *%rax
  800ba2:	eb 2e                	jmp    800bd2 <vprintfmt+0x4f7>
  800ba4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ba8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bac:	48 89 d6             	mov    %rdx,%rsi
  800baf:	bf 25 00 00 00       	mov    $0x25,%edi
  800bb4:	ff d0                	callq  *%rax
  800bb6:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800bbb:	eb 05                	jmp    800bc2 <vprintfmt+0x4e7>
  800bbd:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800bc2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800bc6:	48 83 e8 01          	sub    $0x1,%rax
  800bca:	0f b6 00             	movzbl (%rax),%eax
  800bcd:	3c 25                	cmp    $0x25,%al
  800bcf:	75 ec                	jne    800bbd <vprintfmt+0x4e2>
  800bd1:	90                   	nop
  800bd2:	e9 3d fb ff ff       	jmpq   800714 <vprintfmt+0x39>
  800bd7:	90                   	nop
  800bd8:	48 83 c4 60          	add    $0x60,%rsp
  800bdc:	5b                   	pop    %rbx
  800bdd:	41 5c                	pop    %r12
  800bdf:	5d                   	pop    %rbp
  800be0:	c3                   	retq   

0000000000800be1 <printfmt>:
  800be1:	55                   	push   %rbp
  800be2:	48 89 e5             	mov    %rsp,%rbp
  800be5:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800bec:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800bf3:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800bfa:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800c01:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800c08:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800c0f:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800c16:	84 c0                	test   %al,%al
  800c18:	74 20                	je     800c3a <printfmt+0x59>
  800c1a:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800c1e:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800c22:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800c26:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800c2a:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800c2e:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800c32:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800c36:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800c3a:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800c41:	00 00 00 
  800c44:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800c4b:	00 00 00 
  800c4e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800c52:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800c59:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800c60:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800c67:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800c6e:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800c75:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800c7c:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800c83:	48 89 c7             	mov    %rax,%rdi
  800c86:	48 b8 db 06 80 00 00 	movabs $0x8006db,%rax
  800c8d:	00 00 00 
  800c90:	ff d0                	callq  *%rax
  800c92:	90                   	nop
  800c93:	c9                   	leaveq 
  800c94:	c3                   	retq   

0000000000800c95 <sprintputch>:
  800c95:	55                   	push   %rbp
  800c96:	48 89 e5             	mov    %rsp,%rbp
  800c99:	48 83 ec 10          	sub    $0x10,%rsp
  800c9d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800ca0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800ca4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ca8:	8b 40 10             	mov    0x10(%rax),%eax
  800cab:	8d 50 01             	lea    0x1(%rax),%edx
  800cae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cb2:	89 50 10             	mov    %edx,0x10(%rax)
  800cb5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cb9:	48 8b 10             	mov    (%rax),%rdx
  800cbc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cc0:	48 8b 40 08          	mov    0x8(%rax),%rax
  800cc4:	48 39 c2             	cmp    %rax,%rdx
  800cc7:	73 17                	jae    800ce0 <sprintputch+0x4b>
  800cc9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ccd:	48 8b 00             	mov    (%rax),%rax
  800cd0:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800cd4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800cd8:	48 89 0a             	mov    %rcx,(%rdx)
  800cdb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800cde:	88 10                	mov    %dl,(%rax)
  800ce0:	90                   	nop
  800ce1:	c9                   	leaveq 
  800ce2:	c3                   	retq   

0000000000800ce3 <vsnprintf>:
  800ce3:	55                   	push   %rbp
  800ce4:	48 89 e5             	mov    %rsp,%rbp
  800ce7:	48 83 ec 50          	sub    $0x50,%rsp
  800ceb:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800cef:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800cf2:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800cf6:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800cfa:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800cfe:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800d02:	48 8b 0a             	mov    (%rdx),%rcx
  800d05:	48 89 08             	mov    %rcx,(%rax)
  800d08:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d0c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800d10:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800d14:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800d18:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d1c:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800d20:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800d23:	48 98                	cltq   
  800d25:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800d29:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d2d:	48 01 d0             	add    %rdx,%rax
  800d30:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800d34:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800d3b:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800d40:	74 06                	je     800d48 <vsnprintf+0x65>
  800d42:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800d46:	7f 07                	jg     800d4f <vsnprintf+0x6c>
  800d48:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800d4d:	eb 2f                	jmp    800d7e <vsnprintf+0x9b>
  800d4f:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800d53:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800d57:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800d5b:	48 89 c6             	mov    %rax,%rsi
  800d5e:	48 bf 95 0c 80 00 00 	movabs $0x800c95,%rdi
  800d65:	00 00 00 
  800d68:	48 b8 db 06 80 00 00 	movabs $0x8006db,%rax
  800d6f:	00 00 00 
  800d72:	ff d0                	callq  *%rax
  800d74:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800d78:	c6 00 00             	movb   $0x0,(%rax)
  800d7b:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800d7e:	c9                   	leaveq 
  800d7f:	c3                   	retq   

0000000000800d80 <snprintf>:
  800d80:	55                   	push   %rbp
  800d81:	48 89 e5             	mov    %rsp,%rbp
  800d84:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800d8b:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800d92:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800d98:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800d9f:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800da6:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800dad:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800db4:	84 c0                	test   %al,%al
  800db6:	74 20                	je     800dd8 <snprintf+0x58>
  800db8:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800dbc:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800dc0:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800dc4:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800dc8:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800dcc:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800dd0:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800dd4:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800dd8:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800ddf:	00 00 00 
  800de2:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800de9:	00 00 00 
  800dec:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800df0:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800df7:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800dfe:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e05:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800e0c:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800e13:	48 8b 0a             	mov    (%rdx),%rcx
  800e16:	48 89 08             	mov    %rcx,(%rax)
  800e19:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800e1d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800e21:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800e25:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800e29:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800e30:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800e37:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800e3d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800e44:	48 89 c7             	mov    %rax,%rdi
  800e47:	48 b8 e3 0c 80 00 00 	movabs $0x800ce3,%rax
  800e4e:	00 00 00 
  800e51:	ff d0                	callq  *%rax
  800e53:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800e59:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800e5f:	c9                   	leaveq 
  800e60:	c3                   	retq   

0000000000800e61 <strlen>:
  800e61:	55                   	push   %rbp
  800e62:	48 89 e5             	mov    %rsp,%rbp
  800e65:	48 83 ec 18          	sub    $0x18,%rsp
  800e69:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e6d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800e74:	eb 09                	jmp    800e7f <strlen+0x1e>
  800e76:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800e7a:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800e7f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e83:	0f b6 00             	movzbl (%rax),%eax
  800e86:	84 c0                	test   %al,%al
  800e88:	75 ec                	jne    800e76 <strlen+0x15>
  800e8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e8d:	c9                   	leaveq 
  800e8e:	c3                   	retq   

0000000000800e8f <strnlen>:
  800e8f:	55                   	push   %rbp
  800e90:	48 89 e5             	mov    %rsp,%rbp
  800e93:	48 83 ec 20          	sub    $0x20,%rsp
  800e97:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e9b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800e9f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800ea6:	eb 0e                	jmp    800eb6 <strnlen+0x27>
  800ea8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800eac:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800eb1:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800eb6:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800ebb:	74 0b                	je     800ec8 <strnlen+0x39>
  800ebd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ec1:	0f b6 00             	movzbl (%rax),%eax
  800ec4:	84 c0                	test   %al,%al
  800ec6:	75 e0                	jne    800ea8 <strnlen+0x19>
  800ec8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ecb:	c9                   	leaveq 
  800ecc:	c3                   	retq   

0000000000800ecd <strcpy>:
  800ecd:	55                   	push   %rbp
  800ece:	48 89 e5             	mov    %rsp,%rbp
  800ed1:	48 83 ec 20          	sub    $0x20,%rsp
  800ed5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ed9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800edd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ee1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800ee5:	90                   	nop
  800ee6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800eea:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800eee:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800ef2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800ef6:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800efa:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800efe:	0f b6 12             	movzbl (%rdx),%edx
  800f01:	88 10                	mov    %dl,(%rax)
  800f03:	0f b6 00             	movzbl (%rax),%eax
  800f06:	84 c0                	test   %al,%al
  800f08:	75 dc                	jne    800ee6 <strcpy+0x19>
  800f0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f0e:	c9                   	leaveq 
  800f0f:	c3                   	retq   

0000000000800f10 <strcat>:
  800f10:	55                   	push   %rbp
  800f11:	48 89 e5             	mov    %rsp,%rbp
  800f14:	48 83 ec 20          	sub    $0x20,%rsp
  800f18:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f1c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f20:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f24:	48 89 c7             	mov    %rax,%rdi
  800f27:	48 b8 61 0e 80 00 00 	movabs $0x800e61,%rax
  800f2e:	00 00 00 
  800f31:	ff d0                	callq  *%rax
  800f33:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800f36:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f39:	48 63 d0             	movslq %eax,%rdx
  800f3c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f40:	48 01 c2             	add    %rax,%rdx
  800f43:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800f47:	48 89 c6             	mov    %rax,%rsi
  800f4a:	48 89 d7             	mov    %rdx,%rdi
  800f4d:	48 b8 cd 0e 80 00 00 	movabs $0x800ecd,%rax
  800f54:	00 00 00 
  800f57:	ff d0                	callq  *%rax
  800f59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f5d:	c9                   	leaveq 
  800f5e:	c3                   	retq   

0000000000800f5f <strncpy>:
  800f5f:	55                   	push   %rbp
  800f60:	48 89 e5             	mov    %rsp,%rbp
  800f63:	48 83 ec 28          	sub    $0x28,%rsp
  800f67:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f6b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f6f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800f73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f77:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800f7b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  800f82:	00 
  800f83:	eb 2a                	jmp    800faf <strncpy+0x50>
  800f85:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f89:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f8d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800f91:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800f95:	0f b6 12             	movzbl (%rdx),%edx
  800f98:	88 10                	mov    %dl,(%rax)
  800f9a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800f9e:	0f b6 00             	movzbl (%rax),%eax
  800fa1:	84 c0                	test   %al,%al
  800fa3:	74 05                	je     800faa <strncpy+0x4b>
  800fa5:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  800faa:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800faf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fb3:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800fb7:	72 cc                	jb     800f85 <strncpy+0x26>
  800fb9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fbd:	c9                   	leaveq 
  800fbe:	c3                   	retq   

0000000000800fbf <strlcpy>:
  800fbf:	55                   	push   %rbp
  800fc0:	48 89 e5             	mov    %rsp,%rbp
  800fc3:	48 83 ec 28          	sub    $0x28,%rsp
  800fc7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fcb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800fcf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800fd3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fd7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800fdb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800fe0:	74 3d                	je     80101f <strlcpy+0x60>
  800fe2:	eb 1d                	jmp    801001 <strlcpy+0x42>
  800fe4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fe8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800fec:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800ff0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800ff4:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800ff8:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800ffc:	0f b6 12             	movzbl (%rdx),%edx
  800fff:	88 10                	mov    %dl,(%rax)
  801001:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801006:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80100b:	74 0b                	je     801018 <strlcpy+0x59>
  80100d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801011:	0f b6 00             	movzbl (%rax),%eax
  801014:	84 c0                	test   %al,%al
  801016:	75 cc                	jne    800fe4 <strlcpy+0x25>
  801018:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80101c:	c6 00 00             	movb   $0x0,(%rax)
  80101f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801023:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801027:	48 29 c2             	sub    %rax,%rdx
  80102a:	48 89 d0             	mov    %rdx,%rax
  80102d:	c9                   	leaveq 
  80102e:	c3                   	retq   

000000000080102f <strcmp>:
  80102f:	55                   	push   %rbp
  801030:	48 89 e5             	mov    %rsp,%rbp
  801033:	48 83 ec 10          	sub    $0x10,%rsp
  801037:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80103b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80103f:	eb 0a                	jmp    80104b <strcmp+0x1c>
  801041:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801046:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80104b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80104f:	0f b6 00             	movzbl (%rax),%eax
  801052:	84 c0                	test   %al,%al
  801054:	74 12                	je     801068 <strcmp+0x39>
  801056:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80105a:	0f b6 10             	movzbl (%rax),%edx
  80105d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801061:	0f b6 00             	movzbl (%rax),%eax
  801064:	38 c2                	cmp    %al,%dl
  801066:	74 d9                	je     801041 <strcmp+0x12>
  801068:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80106c:	0f b6 00             	movzbl (%rax),%eax
  80106f:	0f b6 d0             	movzbl %al,%edx
  801072:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801076:	0f b6 00             	movzbl (%rax),%eax
  801079:	0f b6 c0             	movzbl %al,%eax
  80107c:	29 c2                	sub    %eax,%edx
  80107e:	89 d0                	mov    %edx,%eax
  801080:	c9                   	leaveq 
  801081:	c3                   	retq   

0000000000801082 <strncmp>:
  801082:	55                   	push   %rbp
  801083:	48 89 e5             	mov    %rsp,%rbp
  801086:	48 83 ec 18          	sub    $0x18,%rsp
  80108a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80108e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801092:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801096:	eb 0f                	jmp    8010a7 <strncmp+0x25>
  801098:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80109d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8010a2:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8010a7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8010ac:	74 1d                	je     8010cb <strncmp+0x49>
  8010ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010b2:	0f b6 00             	movzbl (%rax),%eax
  8010b5:	84 c0                	test   %al,%al
  8010b7:	74 12                	je     8010cb <strncmp+0x49>
  8010b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010bd:	0f b6 10             	movzbl (%rax),%edx
  8010c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010c4:	0f b6 00             	movzbl (%rax),%eax
  8010c7:	38 c2                	cmp    %al,%dl
  8010c9:	74 cd                	je     801098 <strncmp+0x16>
  8010cb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8010d0:	75 07                	jne    8010d9 <strncmp+0x57>
  8010d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8010d7:	eb 18                	jmp    8010f1 <strncmp+0x6f>
  8010d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010dd:	0f b6 00             	movzbl (%rax),%eax
  8010e0:	0f b6 d0             	movzbl %al,%edx
  8010e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010e7:	0f b6 00             	movzbl (%rax),%eax
  8010ea:	0f b6 c0             	movzbl %al,%eax
  8010ed:	29 c2                	sub    %eax,%edx
  8010ef:	89 d0                	mov    %edx,%eax
  8010f1:	c9                   	leaveq 
  8010f2:	c3                   	retq   

00000000008010f3 <strchr>:
  8010f3:	55                   	push   %rbp
  8010f4:	48 89 e5             	mov    %rsp,%rbp
  8010f7:	48 83 ec 10          	sub    $0x10,%rsp
  8010fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010ff:	89 f0                	mov    %esi,%eax
  801101:	88 45 f4             	mov    %al,-0xc(%rbp)
  801104:	eb 17                	jmp    80111d <strchr+0x2a>
  801106:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80110a:	0f b6 00             	movzbl (%rax),%eax
  80110d:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801110:	75 06                	jne    801118 <strchr+0x25>
  801112:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801116:	eb 15                	jmp    80112d <strchr+0x3a>
  801118:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80111d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801121:	0f b6 00             	movzbl (%rax),%eax
  801124:	84 c0                	test   %al,%al
  801126:	75 de                	jne    801106 <strchr+0x13>
  801128:	b8 00 00 00 00       	mov    $0x0,%eax
  80112d:	c9                   	leaveq 
  80112e:	c3                   	retq   

000000000080112f <strfind>:
  80112f:	55                   	push   %rbp
  801130:	48 89 e5             	mov    %rsp,%rbp
  801133:	48 83 ec 10          	sub    $0x10,%rsp
  801137:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80113b:	89 f0                	mov    %esi,%eax
  80113d:	88 45 f4             	mov    %al,-0xc(%rbp)
  801140:	eb 11                	jmp    801153 <strfind+0x24>
  801142:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801146:	0f b6 00             	movzbl (%rax),%eax
  801149:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80114c:	74 12                	je     801160 <strfind+0x31>
  80114e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801153:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801157:	0f b6 00             	movzbl (%rax),%eax
  80115a:	84 c0                	test   %al,%al
  80115c:	75 e4                	jne    801142 <strfind+0x13>
  80115e:	eb 01                	jmp    801161 <strfind+0x32>
  801160:	90                   	nop
  801161:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801165:	c9                   	leaveq 
  801166:	c3                   	retq   

0000000000801167 <memset>:
  801167:	55                   	push   %rbp
  801168:	48 89 e5             	mov    %rsp,%rbp
  80116b:	48 83 ec 18          	sub    $0x18,%rsp
  80116f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801173:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801176:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80117a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80117f:	75 06                	jne    801187 <memset+0x20>
  801181:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801185:	eb 69                	jmp    8011f0 <memset+0x89>
  801187:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80118b:	83 e0 03             	and    $0x3,%eax
  80118e:	48 85 c0             	test   %rax,%rax
  801191:	75 48                	jne    8011db <memset+0x74>
  801193:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801197:	83 e0 03             	and    $0x3,%eax
  80119a:	48 85 c0             	test   %rax,%rax
  80119d:	75 3c                	jne    8011db <memset+0x74>
  80119f:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8011a6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011a9:	c1 e0 18             	shl    $0x18,%eax
  8011ac:	89 c2                	mov    %eax,%edx
  8011ae:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011b1:	c1 e0 10             	shl    $0x10,%eax
  8011b4:	09 c2                	or     %eax,%edx
  8011b6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011b9:	c1 e0 08             	shl    $0x8,%eax
  8011bc:	09 d0                	or     %edx,%eax
  8011be:	09 45 f4             	or     %eax,-0xc(%rbp)
  8011c1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c5:	48 c1 e8 02          	shr    $0x2,%rax
  8011c9:	48 89 c1             	mov    %rax,%rcx
  8011cc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8011d0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011d3:	48 89 d7             	mov    %rdx,%rdi
  8011d6:	fc                   	cld    
  8011d7:	f3 ab                	rep stos %eax,%es:(%rdi)
  8011d9:	eb 11                	jmp    8011ec <memset+0x85>
  8011db:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8011df:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011e2:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8011e6:	48 89 d7             	mov    %rdx,%rdi
  8011e9:	fc                   	cld    
  8011ea:	f3 aa                	rep stos %al,%es:(%rdi)
  8011ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011f0:	c9                   	leaveq 
  8011f1:	c3                   	retq   

00000000008011f2 <memmove>:
  8011f2:	55                   	push   %rbp
  8011f3:	48 89 e5             	mov    %rsp,%rbp
  8011f6:	48 83 ec 28          	sub    $0x28,%rsp
  8011fa:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011fe:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801202:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801206:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80120a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80120e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801212:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801216:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80121a:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80121e:	0f 83 88 00 00 00    	jae    8012ac <memmove+0xba>
  801224:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801228:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80122c:	48 01 d0             	add    %rdx,%rax
  80122f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801233:	76 77                	jbe    8012ac <memmove+0xba>
  801235:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801239:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80123d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801241:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801245:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801249:	83 e0 03             	and    $0x3,%eax
  80124c:	48 85 c0             	test   %rax,%rax
  80124f:	75 3b                	jne    80128c <memmove+0x9a>
  801251:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801255:	83 e0 03             	and    $0x3,%eax
  801258:	48 85 c0             	test   %rax,%rax
  80125b:	75 2f                	jne    80128c <memmove+0x9a>
  80125d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801261:	83 e0 03             	and    $0x3,%eax
  801264:	48 85 c0             	test   %rax,%rax
  801267:	75 23                	jne    80128c <memmove+0x9a>
  801269:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80126d:	48 83 e8 04          	sub    $0x4,%rax
  801271:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801275:	48 83 ea 04          	sub    $0x4,%rdx
  801279:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80127d:	48 c1 e9 02          	shr    $0x2,%rcx
  801281:	48 89 c7             	mov    %rax,%rdi
  801284:	48 89 d6             	mov    %rdx,%rsi
  801287:	fd                   	std    
  801288:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80128a:	eb 1d                	jmp    8012a9 <memmove+0xb7>
  80128c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801290:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801294:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801298:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80129c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012a0:	48 89 d7             	mov    %rdx,%rdi
  8012a3:	48 89 c1             	mov    %rax,%rcx
  8012a6:	fd                   	std    
  8012a7:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8012a9:	fc                   	cld    
  8012aa:	eb 57                	jmp    801303 <memmove+0x111>
  8012ac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b0:	83 e0 03             	and    $0x3,%eax
  8012b3:	48 85 c0             	test   %rax,%rax
  8012b6:	75 36                	jne    8012ee <memmove+0xfc>
  8012b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012bc:	83 e0 03             	and    $0x3,%eax
  8012bf:	48 85 c0             	test   %rax,%rax
  8012c2:	75 2a                	jne    8012ee <memmove+0xfc>
  8012c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012c8:	83 e0 03             	and    $0x3,%eax
  8012cb:	48 85 c0             	test   %rax,%rax
  8012ce:	75 1e                	jne    8012ee <memmove+0xfc>
  8012d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012d4:	48 c1 e8 02          	shr    $0x2,%rax
  8012d8:	48 89 c1             	mov    %rax,%rcx
  8012db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012df:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8012e3:	48 89 c7             	mov    %rax,%rdi
  8012e6:	48 89 d6             	mov    %rdx,%rsi
  8012e9:	fc                   	cld    
  8012ea:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8012ec:	eb 15                	jmp    801303 <memmove+0x111>
  8012ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012f2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8012f6:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8012fa:	48 89 c7             	mov    %rax,%rdi
  8012fd:	48 89 d6             	mov    %rdx,%rsi
  801300:	fc                   	cld    
  801301:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801303:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801307:	c9                   	leaveq 
  801308:	c3                   	retq   

0000000000801309 <memcpy>:
  801309:	55                   	push   %rbp
  80130a:	48 89 e5             	mov    %rsp,%rbp
  80130d:	48 83 ec 18          	sub    $0x18,%rsp
  801311:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801315:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801319:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80131d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801321:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801325:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801329:	48 89 ce             	mov    %rcx,%rsi
  80132c:	48 89 c7             	mov    %rax,%rdi
  80132f:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  801336:	00 00 00 
  801339:	ff d0                	callq  *%rax
  80133b:	c9                   	leaveq 
  80133c:	c3                   	retq   

000000000080133d <memcmp>:
  80133d:	55                   	push   %rbp
  80133e:	48 89 e5             	mov    %rsp,%rbp
  801341:	48 83 ec 28          	sub    $0x28,%rsp
  801345:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801349:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80134d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801351:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801355:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801359:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80135d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801361:	eb 36                	jmp    801399 <memcmp+0x5c>
  801363:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801367:	0f b6 10             	movzbl (%rax),%edx
  80136a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80136e:	0f b6 00             	movzbl (%rax),%eax
  801371:	38 c2                	cmp    %al,%dl
  801373:	74 1a                	je     80138f <memcmp+0x52>
  801375:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801379:	0f b6 00             	movzbl (%rax),%eax
  80137c:	0f b6 d0             	movzbl %al,%edx
  80137f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801383:	0f b6 00             	movzbl (%rax),%eax
  801386:	0f b6 c0             	movzbl %al,%eax
  801389:	29 c2                	sub    %eax,%edx
  80138b:	89 d0                	mov    %edx,%eax
  80138d:	eb 20                	jmp    8013af <memcmp+0x72>
  80138f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801394:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801399:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80139d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8013a1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013a5:	48 85 c0             	test   %rax,%rax
  8013a8:	75 b9                	jne    801363 <memcmp+0x26>
  8013aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8013af:	c9                   	leaveq 
  8013b0:	c3                   	retq   

00000000008013b1 <memfind>:
  8013b1:	55                   	push   %rbp
  8013b2:	48 89 e5             	mov    %rsp,%rbp
  8013b5:	48 83 ec 28          	sub    $0x28,%rsp
  8013b9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013bd:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8013c0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8013c8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013cc:	48 01 d0             	add    %rdx,%rax
  8013cf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013d3:	eb 13                	jmp    8013e8 <memfind+0x37>
  8013d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013d9:	0f b6 00             	movzbl (%rax),%eax
  8013dc:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8013df:	38 d0                	cmp    %dl,%al
  8013e1:	74 11                	je     8013f4 <memfind+0x43>
  8013e3:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8013e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013ec:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8013f0:	72 e3                	jb     8013d5 <memfind+0x24>
  8013f2:	eb 01                	jmp    8013f5 <memfind+0x44>
  8013f4:	90                   	nop
  8013f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013f9:	c9                   	leaveq 
  8013fa:	c3                   	retq   

00000000008013fb <strtol>:
  8013fb:	55                   	push   %rbp
  8013fc:	48 89 e5             	mov    %rsp,%rbp
  8013ff:	48 83 ec 38          	sub    $0x38,%rsp
  801403:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801407:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80140b:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80140e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801415:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80141c:	00 
  80141d:	eb 05                	jmp    801424 <strtol+0x29>
  80141f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801424:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801428:	0f b6 00             	movzbl (%rax),%eax
  80142b:	3c 20                	cmp    $0x20,%al
  80142d:	74 f0                	je     80141f <strtol+0x24>
  80142f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801433:	0f b6 00             	movzbl (%rax),%eax
  801436:	3c 09                	cmp    $0x9,%al
  801438:	74 e5                	je     80141f <strtol+0x24>
  80143a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80143e:	0f b6 00             	movzbl (%rax),%eax
  801441:	3c 2b                	cmp    $0x2b,%al
  801443:	75 07                	jne    80144c <strtol+0x51>
  801445:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80144a:	eb 17                	jmp    801463 <strtol+0x68>
  80144c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801450:	0f b6 00             	movzbl (%rax),%eax
  801453:	3c 2d                	cmp    $0x2d,%al
  801455:	75 0c                	jne    801463 <strtol+0x68>
  801457:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80145c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801463:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801467:	74 06                	je     80146f <strtol+0x74>
  801469:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80146d:	75 28                	jne    801497 <strtol+0x9c>
  80146f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801473:	0f b6 00             	movzbl (%rax),%eax
  801476:	3c 30                	cmp    $0x30,%al
  801478:	75 1d                	jne    801497 <strtol+0x9c>
  80147a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80147e:	48 83 c0 01          	add    $0x1,%rax
  801482:	0f b6 00             	movzbl (%rax),%eax
  801485:	3c 78                	cmp    $0x78,%al
  801487:	75 0e                	jne    801497 <strtol+0x9c>
  801489:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80148e:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801495:	eb 2c                	jmp    8014c3 <strtol+0xc8>
  801497:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80149b:	75 19                	jne    8014b6 <strtol+0xbb>
  80149d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014a1:	0f b6 00             	movzbl (%rax),%eax
  8014a4:	3c 30                	cmp    $0x30,%al
  8014a6:	75 0e                	jne    8014b6 <strtol+0xbb>
  8014a8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014ad:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8014b4:	eb 0d                	jmp    8014c3 <strtol+0xc8>
  8014b6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8014ba:	75 07                	jne    8014c3 <strtol+0xc8>
  8014bc:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8014c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014c7:	0f b6 00             	movzbl (%rax),%eax
  8014ca:	3c 2f                	cmp    $0x2f,%al
  8014cc:	7e 1d                	jle    8014eb <strtol+0xf0>
  8014ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014d2:	0f b6 00             	movzbl (%rax),%eax
  8014d5:	3c 39                	cmp    $0x39,%al
  8014d7:	7f 12                	jg     8014eb <strtol+0xf0>
  8014d9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014dd:	0f b6 00             	movzbl (%rax),%eax
  8014e0:	0f be c0             	movsbl %al,%eax
  8014e3:	83 e8 30             	sub    $0x30,%eax
  8014e6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8014e9:	eb 4e                	jmp    801539 <strtol+0x13e>
  8014eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014ef:	0f b6 00             	movzbl (%rax),%eax
  8014f2:	3c 60                	cmp    $0x60,%al
  8014f4:	7e 1d                	jle    801513 <strtol+0x118>
  8014f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014fa:	0f b6 00             	movzbl (%rax),%eax
  8014fd:	3c 7a                	cmp    $0x7a,%al
  8014ff:	7f 12                	jg     801513 <strtol+0x118>
  801501:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801505:	0f b6 00             	movzbl (%rax),%eax
  801508:	0f be c0             	movsbl %al,%eax
  80150b:	83 e8 57             	sub    $0x57,%eax
  80150e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801511:	eb 26                	jmp    801539 <strtol+0x13e>
  801513:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801517:	0f b6 00             	movzbl (%rax),%eax
  80151a:	3c 40                	cmp    $0x40,%al
  80151c:	7e 47                	jle    801565 <strtol+0x16a>
  80151e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801522:	0f b6 00             	movzbl (%rax),%eax
  801525:	3c 5a                	cmp    $0x5a,%al
  801527:	7f 3c                	jg     801565 <strtol+0x16a>
  801529:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80152d:	0f b6 00             	movzbl (%rax),%eax
  801530:	0f be c0             	movsbl %al,%eax
  801533:	83 e8 37             	sub    $0x37,%eax
  801536:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801539:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80153c:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  80153f:	7d 23                	jge    801564 <strtol+0x169>
  801541:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801546:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801549:	48 98                	cltq   
  80154b:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801550:	48 89 c2             	mov    %rax,%rdx
  801553:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801556:	48 98                	cltq   
  801558:	48 01 d0             	add    %rdx,%rax
  80155b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80155f:	e9 5f ff ff ff       	jmpq   8014c3 <strtol+0xc8>
  801564:	90                   	nop
  801565:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80156a:	74 0b                	je     801577 <strtol+0x17c>
  80156c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801570:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801574:	48 89 10             	mov    %rdx,(%rax)
  801577:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80157b:	74 09                	je     801586 <strtol+0x18b>
  80157d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801581:	48 f7 d8             	neg    %rax
  801584:	eb 04                	jmp    80158a <strtol+0x18f>
  801586:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80158a:	c9                   	leaveq 
  80158b:	c3                   	retq   

000000000080158c <strstr>:
  80158c:	55                   	push   %rbp
  80158d:	48 89 e5             	mov    %rsp,%rbp
  801590:	48 83 ec 30          	sub    $0x30,%rsp
  801594:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801598:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80159c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8015a0:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8015a4:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8015a8:	0f b6 00             	movzbl (%rax),%eax
  8015ab:	88 45 ff             	mov    %al,-0x1(%rbp)
  8015ae:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8015b2:	75 06                	jne    8015ba <strstr+0x2e>
  8015b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015b8:	eb 6b                	jmp    801625 <strstr+0x99>
  8015ba:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8015be:	48 89 c7             	mov    %rax,%rdi
  8015c1:	48 b8 61 0e 80 00 00 	movabs $0x800e61,%rax
  8015c8:	00 00 00 
  8015cb:	ff d0                	callq  *%rax
  8015cd:	48 98                	cltq   
  8015cf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8015db:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015df:	0f b6 00             	movzbl (%rax),%eax
  8015e2:	88 45 ef             	mov    %al,-0x11(%rbp)
  8015e5:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8015e9:	75 07                	jne    8015f2 <strstr+0x66>
  8015eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8015f0:	eb 33                	jmp    801625 <strstr+0x99>
  8015f2:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8015f6:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8015f9:	75 d8                	jne    8015d3 <strstr+0x47>
  8015fb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8015ff:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801603:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801607:	48 89 ce             	mov    %rcx,%rsi
  80160a:	48 89 c7             	mov    %rax,%rdi
  80160d:	48 b8 82 10 80 00 00 	movabs $0x801082,%rax
  801614:	00 00 00 
  801617:	ff d0                	callq  *%rax
  801619:	85 c0                	test   %eax,%eax
  80161b:	75 b6                	jne    8015d3 <strstr+0x47>
  80161d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801621:	48 83 e8 01          	sub    $0x1,%rax
  801625:	c9                   	leaveq 
  801626:	c3                   	retq   

0000000000801627 <syscall>:
  801627:	55                   	push   %rbp
  801628:	48 89 e5             	mov    %rsp,%rbp
  80162b:	53                   	push   %rbx
  80162c:	48 83 ec 48          	sub    $0x48,%rsp
  801630:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801633:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801636:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80163a:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80163e:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801642:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801646:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801649:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80164d:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801651:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801655:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801659:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80165d:	4c 89 c3             	mov    %r8,%rbx
  801660:	cd 30                	int    $0x30
  801662:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801666:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80166a:	74 3e                	je     8016aa <syscall+0x83>
  80166c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801671:	7e 37                	jle    8016aa <syscall+0x83>
  801673:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801677:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80167a:	49 89 d0             	mov    %rdx,%r8
  80167d:	89 c1                	mov    %eax,%ecx
  80167f:	48 ba e8 4c 80 00 00 	movabs $0x804ce8,%rdx
  801686:	00 00 00 
  801689:	be 24 00 00 00       	mov    $0x24,%esi
  80168e:	48 bf 05 4d 80 00 00 	movabs $0x804d05,%rdi
  801695:	00 00 00 
  801698:	b8 00 00 00 00       	mov    $0x0,%eax
  80169d:	49 b9 bf 42 80 00 00 	movabs $0x8042bf,%r9
  8016a4:	00 00 00 
  8016a7:	41 ff d1             	callq  *%r9
  8016aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016ae:	48 83 c4 48          	add    $0x48,%rsp
  8016b2:	5b                   	pop    %rbx
  8016b3:	5d                   	pop    %rbp
  8016b4:	c3                   	retq   

00000000008016b5 <sys_cputs>:
  8016b5:	55                   	push   %rbp
  8016b6:	48 89 e5             	mov    %rsp,%rbp
  8016b9:	48 83 ec 10          	sub    $0x10,%rsp
  8016bd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016c1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8016c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016c9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8016cd:	48 83 ec 08          	sub    $0x8,%rsp
  8016d1:	6a 00                	pushq  $0x0
  8016d3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8016d9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8016df:	48 89 d1             	mov    %rdx,%rcx
  8016e2:	48 89 c2             	mov    %rax,%rdx
  8016e5:	be 00 00 00 00       	mov    $0x0,%esi
  8016ea:	bf 00 00 00 00       	mov    $0x0,%edi
  8016ef:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  8016f6:	00 00 00 
  8016f9:	ff d0                	callq  *%rax
  8016fb:	48 83 c4 10          	add    $0x10,%rsp
  8016ff:	90                   	nop
  801700:	c9                   	leaveq 
  801701:	c3                   	retq   

0000000000801702 <sys_cgetc>:
  801702:	55                   	push   %rbp
  801703:	48 89 e5             	mov    %rsp,%rbp
  801706:	48 83 ec 08          	sub    $0x8,%rsp
  80170a:	6a 00                	pushq  $0x0
  80170c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801712:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801718:	b9 00 00 00 00       	mov    $0x0,%ecx
  80171d:	ba 00 00 00 00       	mov    $0x0,%edx
  801722:	be 00 00 00 00       	mov    $0x0,%esi
  801727:	bf 01 00 00 00       	mov    $0x1,%edi
  80172c:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801733:	00 00 00 
  801736:	ff d0                	callq  *%rax
  801738:	48 83 c4 10          	add    $0x10,%rsp
  80173c:	c9                   	leaveq 
  80173d:	c3                   	retq   

000000000080173e <sys_env_destroy>:
  80173e:	55                   	push   %rbp
  80173f:	48 89 e5             	mov    %rsp,%rbp
  801742:	48 83 ec 10          	sub    $0x10,%rsp
  801746:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801749:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80174c:	48 98                	cltq   
  80174e:	48 83 ec 08          	sub    $0x8,%rsp
  801752:	6a 00                	pushq  $0x0
  801754:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80175a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801760:	b9 00 00 00 00       	mov    $0x0,%ecx
  801765:	48 89 c2             	mov    %rax,%rdx
  801768:	be 01 00 00 00       	mov    $0x1,%esi
  80176d:	bf 03 00 00 00       	mov    $0x3,%edi
  801772:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801779:	00 00 00 
  80177c:	ff d0                	callq  *%rax
  80177e:	48 83 c4 10          	add    $0x10,%rsp
  801782:	c9                   	leaveq 
  801783:	c3                   	retq   

0000000000801784 <sys_getenvid>:
  801784:	55                   	push   %rbp
  801785:	48 89 e5             	mov    %rsp,%rbp
  801788:	48 83 ec 08          	sub    $0x8,%rsp
  80178c:	6a 00                	pushq  $0x0
  80178e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801794:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80179a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80179f:	ba 00 00 00 00       	mov    $0x0,%edx
  8017a4:	be 00 00 00 00       	mov    $0x0,%esi
  8017a9:	bf 02 00 00 00       	mov    $0x2,%edi
  8017ae:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  8017b5:	00 00 00 
  8017b8:	ff d0                	callq  *%rax
  8017ba:	48 83 c4 10          	add    $0x10,%rsp
  8017be:	c9                   	leaveq 
  8017bf:	c3                   	retq   

00000000008017c0 <sys_yield>:
  8017c0:	55                   	push   %rbp
  8017c1:	48 89 e5             	mov    %rsp,%rbp
  8017c4:	48 83 ec 08          	sub    $0x8,%rsp
  8017c8:	6a 00                	pushq  $0x0
  8017ca:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017d0:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017d6:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017db:	ba 00 00 00 00       	mov    $0x0,%edx
  8017e0:	be 00 00 00 00       	mov    $0x0,%esi
  8017e5:	bf 0b 00 00 00       	mov    $0xb,%edi
  8017ea:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  8017f1:	00 00 00 
  8017f4:	ff d0                	callq  *%rax
  8017f6:	48 83 c4 10          	add    $0x10,%rsp
  8017fa:	90                   	nop
  8017fb:	c9                   	leaveq 
  8017fc:	c3                   	retq   

00000000008017fd <sys_page_alloc>:
  8017fd:	55                   	push   %rbp
  8017fe:	48 89 e5             	mov    %rsp,%rbp
  801801:	48 83 ec 10          	sub    $0x10,%rsp
  801805:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801808:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80180c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80180f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801812:	48 63 c8             	movslq %eax,%rcx
  801815:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801819:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80181c:	48 98                	cltq   
  80181e:	48 83 ec 08          	sub    $0x8,%rsp
  801822:	6a 00                	pushq  $0x0
  801824:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80182a:	49 89 c8             	mov    %rcx,%r8
  80182d:	48 89 d1             	mov    %rdx,%rcx
  801830:	48 89 c2             	mov    %rax,%rdx
  801833:	be 01 00 00 00       	mov    $0x1,%esi
  801838:	bf 04 00 00 00       	mov    $0x4,%edi
  80183d:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801844:	00 00 00 
  801847:	ff d0                	callq  *%rax
  801849:	48 83 c4 10          	add    $0x10,%rsp
  80184d:	c9                   	leaveq 
  80184e:	c3                   	retq   

000000000080184f <sys_page_map>:
  80184f:	55                   	push   %rbp
  801850:	48 89 e5             	mov    %rsp,%rbp
  801853:	48 83 ec 20          	sub    $0x20,%rsp
  801857:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80185a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80185e:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801861:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801865:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801869:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80186c:	48 63 c8             	movslq %eax,%rcx
  80186f:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801873:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801876:	48 63 f0             	movslq %eax,%rsi
  801879:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80187d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801880:	48 98                	cltq   
  801882:	48 83 ec 08          	sub    $0x8,%rsp
  801886:	51                   	push   %rcx
  801887:	49 89 f9             	mov    %rdi,%r9
  80188a:	49 89 f0             	mov    %rsi,%r8
  80188d:	48 89 d1             	mov    %rdx,%rcx
  801890:	48 89 c2             	mov    %rax,%rdx
  801893:	be 01 00 00 00       	mov    $0x1,%esi
  801898:	bf 05 00 00 00       	mov    $0x5,%edi
  80189d:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  8018a4:	00 00 00 
  8018a7:	ff d0                	callq  *%rax
  8018a9:	48 83 c4 10          	add    $0x10,%rsp
  8018ad:	c9                   	leaveq 
  8018ae:	c3                   	retq   

00000000008018af <sys_page_unmap>:
  8018af:	55                   	push   %rbp
  8018b0:	48 89 e5             	mov    %rsp,%rbp
  8018b3:	48 83 ec 10          	sub    $0x10,%rsp
  8018b7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018ba:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018be:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018c5:	48 98                	cltq   
  8018c7:	48 83 ec 08          	sub    $0x8,%rsp
  8018cb:	6a 00                	pushq  $0x0
  8018cd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018d3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018d9:	48 89 d1             	mov    %rdx,%rcx
  8018dc:	48 89 c2             	mov    %rax,%rdx
  8018df:	be 01 00 00 00       	mov    $0x1,%esi
  8018e4:	bf 06 00 00 00       	mov    $0x6,%edi
  8018e9:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  8018f0:	00 00 00 
  8018f3:	ff d0                	callq  *%rax
  8018f5:	48 83 c4 10          	add    $0x10,%rsp
  8018f9:	c9                   	leaveq 
  8018fa:	c3                   	retq   

00000000008018fb <sys_env_set_status>:
  8018fb:	55                   	push   %rbp
  8018fc:	48 89 e5             	mov    %rsp,%rbp
  8018ff:	48 83 ec 10          	sub    $0x10,%rsp
  801903:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801906:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801909:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80190c:	48 63 d0             	movslq %eax,%rdx
  80190f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801912:	48 98                	cltq   
  801914:	48 83 ec 08          	sub    $0x8,%rsp
  801918:	6a 00                	pushq  $0x0
  80191a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801920:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801926:	48 89 d1             	mov    %rdx,%rcx
  801929:	48 89 c2             	mov    %rax,%rdx
  80192c:	be 01 00 00 00       	mov    $0x1,%esi
  801931:	bf 08 00 00 00       	mov    $0x8,%edi
  801936:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  80193d:	00 00 00 
  801940:	ff d0                	callq  *%rax
  801942:	48 83 c4 10          	add    $0x10,%rsp
  801946:	c9                   	leaveq 
  801947:	c3                   	retq   

0000000000801948 <sys_env_set_trapframe>:
  801948:	55                   	push   %rbp
  801949:	48 89 e5             	mov    %rsp,%rbp
  80194c:	48 83 ec 10          	sub    $0x10,%rsp
  801950:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801953:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801957:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80195b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80195e:	48 98                	cltq   
  801960:	48 83 ec 08          	sub    $0x8,%rsp
  801964:	6a 00                	pushq  $0x0
  801966:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80196c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801972:	48 89 d1             	mov    %rdx,%rcx
  801975:	48 89 c2             	mov    %rax,%rdx
  801978:	be 01 00 00 00       	mov    $0x1,%esi
  80197d:	bf 09 00 00 00       	mov    $0x9,%edi
  801982:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801989:	00 00 00 
  80198c:	ff d0                	callq  *%rax
  80198e:	48 83 c4 10          	add    $0x10,%rsp
  801992:	c9                   	leaveq 
  801993:	c3                   	retq   

0000000000801994 <sys_env_set_pgfault_upcall>:
  801994:	55                   	push   %rbp
  801995:	48 89 e5             	mov    %rsp,%rbp
  801998:	48 83 ec 10          	sub    $0x10,%rsp
  80199c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80199f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019a3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019aa:	48 98                	cltq   
  8019ac:	48 83 ec 08          	sub    $0x8,%rsp
  8019b0:	6a 00                	pushq  $0x0
  8019b2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019b8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019be:	48 89 d1             	mov    %rdx,%rcx
  8019c1:	48 89 c2             	mov    %rax,%rdx
  8019c4:	be 01 00 00 00       	mov    $0x1,%esi
  8019c9:	bf 0a 00 00 00       	mov    $0xa,%edi
  8019ce:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  8019d5:	00 00 00 
  8019d8:	ff d0                	callq  *%rax
  8019da:	48 83 c4 10          	add    $0x10,%rsp
  8019de:	c9                   	leaveq 
  8019df:	c3                   	retq   

00000000008019e0 <sys_ipc_try_send>:
  8019e0:	55                   	push   %rbp
  8019e1:	48 89 e5             	mov    %rsp,%rbp
  8019e4:	48 83 ec 20          	sub    $0x20,%rsp
  8019e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019eb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019ef:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8019f3:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  8019f6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019f9:	48 63 f0             	movslq %eax,%rsi
  8019fc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801a00:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a03:	48 98                	cltq   
  801a05:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a09:	48 83 ec 08          	sub    $0x8,%rsp
  801a0d:	6a 00                	pushq  $0x0
  801a0f:	49 89 f1             	mov    %rsi,%r9
  801a12:	49 89 c8             	mov    %rcx,%r8
  801a15:	48 89 d1             	mov    %rdx,%rcx
  801a18:	48 89 c2             	mov    %rax,%rdx
  801a1b:	be 00 00 00 00       	mov    $0x0,%esi
  801a20:	bf 0c 00 00 00       	mov    $0xc,%edi
  801a25:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801a2c:	00 00 00 
  801a2f:	ff d0                	callq  *%rax
  801a31:	48 83 c4 10          	add    $0x10,%rsp
  801a35:	c9                   	leaveq 
  801a36:	c3                   	retq   

0000000000801a37 <sys_ipc_recv>:
  801a37:	55                   	push   %rbp
  801a38:	48 89 e5             	mov    %rsp,%rbp
  801a3b:	48 83 ec 10          	sub    $0x10,%rsp
  801a3f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a47:	48 83 ec 08          	sub    $0x8,%rsp
  801a4b:	6a 00                	pushq  $0x0
  801a4d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a53:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a59:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a5e:	48 89 c2             	mov    %rax,%rdx
  801a61:	be 01 00 00 00       	mov    $0x1,%esi
  801a66:	bf 0d 00 00 00       	mov    $0xd,%edi
  801a6b:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801a72:	00 00 00 
  801a75:	ff d0                	callq  *%rax
  801a77:	48 83 c4 10          	add    $0x10,%rsp
  801a7b:	c9                   	leaveq 
  801a7c:	c3                   	retq   

0000000000801a7d <sys_time_msec>:
  801a7d:	55                   	push   %rbp
  801a7e:	48 89 e5             	mov    %rsp,%rbp
  801a81:	48 83 ec 08          	sub    $0x8,%rsp
  801a85:	6a 00                	pushq  $0x0
  801a87:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a8d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a93:	b9 00 00 00 00       	mov    $0x0,%ecx
  801a98:	ba 00 00 00 00       	mov    $0x0,%edx
  801a9d:	be 00 00 00 00       	mov    $0x0,%esi
  801aa2:	bf 0e 00 00 00       	mov    $0xe,%edi
  801aa7:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801aae:	00 00 00 
  801ab1:	ff d0                	callq  *%rax
  801ab3:	48 83 c4 10          	add    $0x10,%rsp
  801ab7:	c9                   	leaveq 
  801ab8:	c3                   	retq   

0000000000801ab9 <sys_net_transmit>:
  801ab9:	55                   	push   %rbp
  801aba:	48 89 e5             	mov    %rsp,%rbp
  801abd:	48 83 ec 10          	sub    $0x10,%rsp
  801ac1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ac5:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801ac8:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801acb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801acf:	48 83 ec 08          	sub    $0x8,%rsp
  801ad3:	6a 00                	pushq  $0x0
  801ad5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801adb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ae1:	48 89 d1             	mov    %rdx,%rcx
  801ae4:	48 89 c2             	mov    %rax,%rdx
  801ae7:	be 00 00 00 00       	mov    $0x0,%esi
  801aec:	bf 0f 00 00 00       	mov    $0xf,%edi
  801af1:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801af8:	00 00 00 
  801afb:	ff d0                	callq  *%rax
  801afd:	48 83 c4 10          	add    $0x10,%rsp
  801b01:	c9                   	leaveq 
  801b02:	c3                   	retq   

0000000000801b03 <sys_net_receive>:
  801b03:	55                   	push   %rbp
  801b04:	48 89 e5             	mov    %rsp,%rbp
  801b07:	48 83 ec 10          	sub    $0x10,%rsp
  801b0b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b0f:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b12:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801b15:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b19:	48 83 ec 08          	sub    $0x8,%rsp
  801b1d:	6a 00                	pushq  $0x0
  801b1f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b25:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b2b:	48 89 d1             	mov    %rdx,%rcx
  801b2e:	48 89 c2             	mov    %rax,%rdx
  801b31:	be 00 00 00 00       	mov    $0x0,%esi
  801b36:	bf 10 00 00 00       	mov    $0x10,%edi
  801b3b:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801b42:	00 00 00 
  801b45:	ff d0                	callq  *%rax
  801b47:	48 83 c4 10          	add    $0x10,%rsp
  801b4b:	c9                   	leaveq 
  801b4c:	c3                   	retq   

0000000000801b4d <sys_ept_map>:
  801b4d:	55                   	push   %rbp
  801b4e:	48 89 e5             	mov    %rsp,%rbp
  801b51:	48 83 ec 20          	sub    $0x20,%rsp
  801b55:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b58:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b5c:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801b5f:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801b63:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801b67:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801b6a:	48 63 c8             	movslq %eax,%rcx
  801b6d:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801b71:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b74:	48 63 f0             	movslq %eax,%rsi
  801b77:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b7b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b7e:	48 98                	cltq   
  801b80:	48 83 ec 08          	sub    $0x8,%rsp
  801b84:	51                   	push   %rcx
  801b85:	49 89 f9             	mov    %rdi,%r9
  801b88:	49 89 f0             	mov    %rsi,%r8
  801b8b:	48 89 d1             	mov    %rdx,%rcx
  801b8e:	48 89 c2             	mov    %rax,%rdx
  801b91:	be 00 00 00 00       	mov    $0x0,%esi
  801b96:	bf 11 00 00 00       	mov    $0x11,%edi
  801b9b:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801ba2:	00 00 00 
  801ba5:	ff d0                	callq  *%rax
  801ba7:	48 83 c4 10          	add    $0x10,%rsp
  801bab:	c9                   	leaveq 
  801bac:	c3                   	retq   

0000000000801bad <sys_env_mkguest>:
  801bad:	55                   	push   %rbp
  801bae:	48 89 e5             	mov    %rsp,%rbp
  801bb1:	48 83 ec 10          	sub    $0x10,%rsp
  801bb5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bb9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bbd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bc1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bc5:	48 83 ec 08          	sub    $0x8,%rsp
  801bc9:	6a 00                	pushq  $0x0
  801bcb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bd1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bd7:	48 89 d1             	mov    %rdx,%rcx
  801bda:	48 89 c2             	mov    %rax,%rdx
  801bdd:	be 00 00 00 00       	mov    $0x0,%esi
  801be2:	bf 12 00 00 00       	mov    $0x12,%edi
  801be7:	48 b8 27 16 80 00 00 	movabs $0x801627,%rax
  801bee:	00 00 00 
  801bf1:	ff d0                	callq  *%rax
  801bf3:	48 83 c4 10          	add    $0x10,%rsp
  801bf7:	c9                   	leaveq 
  801bf8:	c3                   	retq   

0000000000801bf9 <pgfault>:
  801bf9:	55                   	push   %rbp
  801bfa:	48 89 e5             	mov    %rsp,%rbp
  801bfd:	48 83 ec 30          	sub    $0x30,%rsp
  801c01:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801c05:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c09:	48 8b 00             	mov    (%rax),%rax
  801c0c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801c10:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c14:	48 8b 40 08          	mov    0x8(%rax),%rax
  801c18:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801c1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c1e:	83 e0 02             	and    $0x2,%eax
  801c21:	85 c0                	test   %eax,%eax
  801c23:	75 40                	jne    801c65 <pgfault+0x6c>
  801c25:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c29:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801c30:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c34:	49 89 d0             	mov    %rdx,%r8
  801c37:	48 89 c1             	mov    %rax,%rcx
  801c3a:	48 ba 18 4d 80 00 00 	movabs $0x804d18,%rdx
  801c41:	00 00 00 
  801c44:	be 1f 00 00 00       	mov    $0x1f,%esi
  801c49:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  801c50:	00 00 00 
  801c53:	b8 00 00 00 00       	mov    $0x0,%eax
  801c58:	49 b9 bf 42 80 00 00 	movabs $0x8042bf,%r9
  801c5f:	00 00 00 
  801c62:	41 ff d1             	callq  *%r9
  801c65:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c69:	48 c1 e8 0c          	shr    $0xc,%rax
  801c6d:	48 89 c2             	mov    %rax,%rdx
  801c70:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801c77:	01 00 00 
  801c7a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801c7e:	25 07 08 00 00       	and    $0x807,%eax
  801c83:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801c89:	74 4e                	je     801cd9 <pgfault+0xe0>
  801c8b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c8f:	48 c1 e8 0c          	shr    $0xc,%rax
  801c93:	48 89 c2             	mov    %rax,%rdx
  801c96:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801c9d:	01 00 00 
  801ca0:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801ca4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ca8:	49 89 d0             	mov    %rdx,%r8
  801cab:	48 89 c1             	mov    %rax,%rcx
  801cae:	48 ba 40 4d 80 00 00 	movabs $0x804d40,%rdx
  801cb5:	00 00 00 
  801cb8:	be 22 00 00 00       	mov    $0x22,%esi
  801cbd:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  801cc4:	00 00 00 
  801cc7:	b8 00 00 00 00       	mov    $0x0,%eax
  801ccc:	49 b9 bf 42 80 00 00 	movabs $0x8042bf,%r9
  801cd3:	00 00 00 
  801cd6:	41 ff d1             	callq  *%r9
  801cd9:	ba 07 00 00 00       	mov    $0x7,%edx
  801cde:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801ce3:	bf 00 00 00 00       	mov    $0x0,%edi
  801ce8:	48 b8 fd 17 80 00 00 	movabs $0x8017fd,%rax
  801cef:	00 00 00 
  801cf2:	ff d0                	callq  *%rax
  801cf4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801cf7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801cfb:	79 30                	jns    801d2d <pgfault+0x134>
  801cfd:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d00:	89 c1                	mov    %eax,%ecx
  801d02:	48 ba 6b 4d 80 00 00 	movabs $0x804d6b,%rdx
  801d09:	00 00 00 
  801d0c:	be 30 00 00 00       	mov    $0x30,%esi
  801d11:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  801d18:	00 00 00 
  801d1b:	b8 00 00 00 00       	mov    $0x0,%eax
  801d20:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  801d27:	00 00 00 
  801d2a:	41 ff d0             	callq  *%r8
  801d2d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d31:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801d35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801d39:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801d3f:	ba 00 10 00 00       	mov    $0x1000,%edx
  801d44:	48 89 c6             	mov    %rax,%rsi
  801d47:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  801d4c:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  801d53:	00 00 00 
  801d56:	ff d0                	callq  *%rax
  801d58:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801d5c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801d60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d64:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801d6a:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  801d70:	48 89 c1             	mov    %rax,%rcx
  801d73:	ba 00 00 00 00       	mov    $0x0,%edx
  801d78:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801d7d:	bf 00 00 00 00       	mov    $0x0,%edi
  801d82:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801d89:	00 00 00 
  801d8c:	ff d0                	callq  *%rax
  801d8e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801d91:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801d95:	79 30                	jns    801dc7 <pgfault+0x1ce>
  801d97:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d9a:	89 c1                	mov    %eax,%ecx
  801d9c:	48 ba 7e 4d 80 00 00 	movabs $0x804d7e,%rdx
  801da3:	00 00 00 
  801da6:	be 35 00 00 00       	mov    $0x35,%esi
  801dab:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  801db2:	00 00 00 
  801db5:	b8 00 00 00 00       	mov    $0x0,%eax
  801dba:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  801dc1:	00 00 00 
  801dc4:	41 ff d0             	callq  *%r8
  801dc7:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801dcc:	bf 00 00 00 00       	mov    $0x0,%edi
  801dd1:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  801dd8:	00 00 00 
  801ddb:	ff d0                	callq  *%rax
  801ddd:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801de0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801de4:	79 30                	jns    801e16 <pgfault+0x21d>
  801de6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801de9:	89 c1                	mov    %eax,%ecx
  801deb:	48 ba 8f 4d 80 00 00 	movabs $0x804d8f,%rdx
  801df2:	00 00 00 
  801df5:	be 39 00 00 00       	mov    $0x39,%esi
  801dfa:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  801e01:	00 00 00 
  801e04:	b8 00 00 00 00       	mov    $0x0,%eax
  801e09:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  801e10:	00 00 00 
  801e13:	41 ff d0             	callq  *%r8
  801e16:	90                   	nop
  801e17:	c9                   	leaveq 
  801e18:	c3                   	retq   

0000000000801e19 <duppage>:
  801e19:	55                   	push   %rbp
  801e1a:	48 89 e5             	mov    %rsp,%rbp
  801e1d:	48 83 ec 30          	sub    $0x30,%rsp
  801e21:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801e24:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801e27:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801e2a:	c1 e0 0c             	shl    $0xc,%eax
  801e2d:	89 c0                	mov    %eax,%eax
  801e2f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801e33:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801e3a:	01 00 00 
  801e3d:	8b 55 d8             	mov    -0x28(%rbp),%edx
  801e40:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e44:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e48:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e4c:	25 02 08 00 00       	and    $0x802,%eax
  801e51:	48 85 c0             	test   %rax,%rax
  801e54:	74 0e                	je     801e64 <duppage+0x4b>
  801e56:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e5a:	25 00 04 00 00       	and    $0x400,%eax
  801e5f:	48 85 c0             	test   %rax,%rax
  801e62:	74 70                	je     801ed4 <duppage+0xbb>
  801e64:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e68:	25 07 0e 00 00       	and    $0xe07,%eax
  801e6d:	89 c6                	mov    %eax,%esi
  801e6f:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  801e73:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801e76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e7a:	41 89 f0             	mov    %esi,%r8d
  801e7d:	48 89 c6             	mov    %rax,%rsi
  801e80:	bf 00 00 00 00       	mov    $0x0,%edi
  801e85:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801e8c:	00 00 00 
  801e8f:	ff d0                	callq  *%rax
  801e91:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801e94:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801e98:	79 30                	jns    801eca <duppage+0xb1>
  801e9a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801e9d:	89 c1                	mov    %eax,%ecx
  801e9f:	48 ba 7e 4d 80 00 00 	movabs $0x804d7e,%rdx
  801ea6:	00 00 00 
  801ea9:	be 63 00 00 00       	mov    $0x63,%esi
  801eae:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  801eb5:	00 00 00 
  801eb8:	b8 00 00 00 00       	mov    $0x0,%eax
  801ebd:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  801ec4:	00 00 00 
  801ec7:	41 ff d0             	callq  *%r8
  801eca:	b8 00 00 00 00       	mov    $0x0,%eax
  801ecf:	e9 c4 00 00 00       	jmpq   801f98 <duppage+0x17f>
  801ed4:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  801ed8:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801edb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801edf:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  801ee5:	48 89 c6             	mov    %rax,%rsi
  801ee8:	bf 00 00 00 00       	mov    $0x0,%edi
  801eed:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801ef4:	00 00 00 
  801ef7:	ff d0                	callq  *%rax
  801ef9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801efc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801f00:	79 30                	jns    801f32 <duppage+0x119>
  801f02:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f05:	89 c1                	mov    %eax,%ecx
  801f07:	48 ba 7e 4d 80 00 00 	movabs $0x804d7e,%rdx
  801f0e:	00 00 00 
  801f11:	be 7e 00 00 00       	mov    $0x7e,%esi
  801f16:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  801f1d:	00 00 00 
  801f20:	b8 00 00 00 00       	mov    $0x0,%eax
  801f25:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  801f2c:	00 00 00 
  801f2f:	41 ff d0             	callq  *%r8
  801f32:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f36:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f3a:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  801f40:	48 89 d1             	mov    %rdx,%rcx
  801f43:	ba 00 00 00 00       	mov    $0x0,%edx
  801f48:	48 89 c6             	mov    %rax,%rsi
  801f4b:	bf 00 00 00 00       	mov    $0x0,%edi
  801f50:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  801f57:	00 00 00 
  801f5a:	ff d0                	callq  *%rax
  801f5c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801f5f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801f63:	79 30                	jns    801f95 <duppage+0x17c>
  801f65:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f68:	89 c1                	mov    %eax,%ecx
  801f6a:	48 ba 7e 4d 80 00 00 	movabs $0x804d7e,%rdx
  801f71:	00 00 00 
  801f74:	be 80 00 00 00       	mov    $0x80,%esi
  801f79:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  801f80:	00 00 00 
  801f83:	b8 00 00 00 00       	mov    $0x0,%eax
  801f88:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  801f8f:	00 00 00 
  801f92:	41 ff d0             	callq  *%r8
  801f95:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801f98:	c9                   	leaveq 
  801f99:	c3                   	retq   

0000000000801f9a <fork>:
  801f9a:	55                   	push   %rbp
  801f9b:	48 89 e5             	mov    %rsp,%rbp
  801f9e:	48 83 ec 20          	sub    $0x20,%rsp
  801fa2:	48 bf f9 1b 80 00 00 	movabs $0x801bf9,%rdi
  801fa9:	00 00 00 
  801fac:	48 b8 d3 43 80 00 00 	movabs $0x8043d3,%rax
  801fb3:	00 00 00 
  801fb6:	ff d0                	callq  *%rax
  801fb8:	b8 07 00 00 00       	mov    $0x7,%eax
  801fbd:	cd 30                	int    $0x30
  801fbf:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801fc2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801fc5:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801fc8:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801fcc:	79 08                	jns    801fd6 <fork+0x3c>
  801fce:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801fd1:	e9 0b 02 00 00       	jmpq   8021e1 <fork+0x247>
  801fd6:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801fda:	75 3e                	jne    80201a <fork+0x80>
  801fdc:	48 b8 84 17 80 00 00 	movabs $0x801784,%rax
  801fe3:	00 00 00 
  801fe6:	ff d0                	callq  *%rax
  801fe8:	25 ff 03 00 00       	and    $0x3ff,%eax
  801fed:	48 98                	cltq   
  801fef:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  801ff6:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  801ffd:	00 00 00 
  802000:	48 01 c2             	add    %rax,%rdx
  802003:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80200a:	00 00 00 
  80200d:	48 89 10             	mov    %rdx,(%rax)
  802010:	b8 00 00 00 00       	mov    $0x0,%eax
  802015:	e9 c7 01 00 00       	jmpq   8021e1 <fork+0x247>
  80201a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802021:	e9 a6 00 00 00       	jmpq   8020cc <fork+0x132>
  802026:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802029:	c1 f8 12             	sar    $0x12,%eax
  80202c:	89 c2                	mov    %eax,%edx
  80202e:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  802035:	01 00 00 
  802038:	48 63 d2             	movslq %edx,%rdx
  80203b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80203f:	83 e0 01             	and    $0x1,%eax
  802042:	48 85 c0             	test   %rax,%rax
  802045:	74 21                	je     802068 <fork+0xce>
  802047:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80204a:	c1 f8 09             	sar    $0x9,%eax
  80204d:	89 c2                	mov    %eax,%edx
  80204f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802056:	01 00 00 
  802059:	48 63 d2             	movslq %edx,%rdx
  80205c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802060:	83 e0 01             	and    $0x1,%eax
  802063:	48 85 c0             	test   %rax,%rax
  802066:	75 09                	jne    802071 <fork+0xd7>
  802068:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  80206f:	eb 5b                	jmp    8020cc <fork+0x132>
  802071:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802074:	05 00 02 00 00       	add    $0x200,%eax
  802079:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80207c:	eb 46                	jmp    8020c4 <fork+0x12a>
  80207e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802085:	01 00 00 
  802088:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80208b:	48 63 d2             	movslq %edx,%rdx
  80208e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802092:	83 e0 05             	and    $0x5,%eax
  802095:	48 83 f8 05          	cmp    $0x5,%rax
  802099:	75 21                	jne    8020bc <fork+0x122>
  80209b:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  8020a2:	74 1b                	je     8020bf <fork+0x125>
  8020a4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8020a7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020aa:	89 d6                	mov    %edx,%esi
  8020ac:	89 c7                	mov    %eax,%edi
  8020ae:	48 b8 19 1e 80 00 00 	movabs $0x801e19,%rax
  8020b5:	00 00 00 
  8020b8:	ff d0                	callq  *%rax
  8020ba:	eb 04                	jmp    8020c0 <fork+0x126>
  8020bc:	90                   	nop
  8020bd:	eb 01                	jmp    8020c0 <fork+0x126>
  8020bf:	90                   	nop
  8020c0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8020c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020c7:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8020ca:	7c b2                	jl     80207e <fork+0xe4>
  8020cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020cf:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  8020d4:	0f 86 4c ff ff ff    	jbe    802026 <fork+0x8c>
  8020da:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020dd:	ba 07 00 00 00       	mov    $0x7,%edx
  8020e2:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8020e7:	89 c7                	mov    %eax,%edi
  8020e9:	48 b8 fd 17 80 00 00 	movabs $0x8017fd,%rax
  8020f0:	00 00 00 
  8020f3:	ff d0                	callq  *%rax
  8020f5:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8020f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8020fc:	79 30                	jns    80212e <fork+0x194>
  8020fe:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802101:	89 c1                	mov    %eax,%ecx
  802103:	48 ba a8 4d 80 00 00 	movabs $0x804da8,%rdx
  80210a:	00 00 00 
  80210d:	be bc 00 00 00       	mov    $0xbc,%esi
  802112:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  802119:	00 00 00 
  80211c:	b8 00 00 00 00       	mov    $0x0,%eax
  802121:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  802128:	00 00 00 
  80212b:	41 ff d0             	callq  *%r8
  80212e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802135:	00 00 00 
  802138:	48 8b 00             	mov    (%rax),%rax
  80213b:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  802142:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802145:	48 89 d6             	mov    %rdx,%rsi
  802148:	89 c7                	mov    %eax,%edi
  80214a:	48 b8 94 19 80 00 00 	movabs $0x801994,%rax
  802151:	00 00 00 
  802154:	ff d0                	callq  *%rax
  802156:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802159:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80215d:	79 30                	jns    80218f <fork+0x1f5>
  80215f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802162:	89 c1                	mov    %eax,%ecx
  802164:	48 ba c8 4d 80 00 00 	movabs $0x804dc8,%rdx
  80216b:	00 00 00 
  80216e:	be c0 00 00 00       	mov    $0xc0,%esi
  802173:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  80217a:	00 00 00 
  80217d:	b8 00 00 00 00       	mov    $0x0,%eax
  802182:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  802189:	00 00 00 
  80218c:	41 ff d0             	callq  *%r8
  80218f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802192:	be 02 00 00 00       	mov    $0x2,%esi
  802197:	89 c7                	mov    %eax,%edi
  802199:	48 b8 fb 18 80 00 00 	movabs $0x8018fb,%rax
  8021a0:	00 00 00 
  8021a3:	ff d0                	callq  *%rax
  8021a5:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8021a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8021ac:	79 30                	jns    8021de <fork+0x244>
  8021ae:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8021b1:	89 c1                	mov    %eax,%ecx
  8021b3:	48 ba e7 4d 80 00 00 	movabs $0x804de7,%rdx
  8021ba:	00 00 00 
  8021bd:	be c5 00 00 00       	mov    $0xc5,%esi
  8021c2:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  8021c9:	00 00 00 
  8021cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8021d1:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  8021d8:	00 00 00 
  8021db:	41 ff d0             	callq  *%r8
  8021de:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021e1:	c9                   	leaveq 
  8021e2:	c3                   	retq   

00000000008021e3 <sfork>:
  8021e3:	55                   	push   %rbp
  8021e4:	48 89 e5             	mov    %rsp,%rbp
  8021e7:	48 ba fe 4d 80 00 00 	movabs $0x804dfe,%rdx
  8021ee:	00 00 00 
  8021f1:	be d2 00 00 00       	mov    $0xd2,%esi
  8021f6:	48 bf 31 4d 80 00 00 	movabs $0x804d31,%rdi
  8021fd:	00 00 00 
  802200:	b8 00 00 00 00       	mov    $0x0,%eax
  802205:	48 b9 bf 42 80 00 00 	movabs $0x8042bf,%rcx
  80220c:	00 00 00 
  80220f:	ff d1                	callq  *%rcx

0000000000802211 <fd2num>:
  802211:	55                   	push   %rbp
  802212:	48 89 e5             	mov    %rsp,%rbp
  802215:	48 83 ec 08          	sub    $0x8,%rsp
  802219:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80221d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802221:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  802228:	ff ff ff 
  80222b:	48 01 d0             	add    %rdx,%rax
  80222e:	48 c1 e8 0c          	shr    $0xc,%rax
  802232:	c9                   	leaveq 
  802233:	c3                   	retq   

0000000000802234 <fd2data>:
  802234:	55                   	push   %rbp
  802235:	48 89 e5             	mov    %rsp,%rbp
  802238:	48 83 ec 08          	sub    $0x8,%rsp
  80223c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802240:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802244:	48 89 c7             	mov    %rax,%rdi
  802247:	48 b8 11 22 80 00 00 	movabs $0x802211,%rax
  80224e:	00 00 00 
  802251:	ff d0                	callq  *%rax
  802253:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802259:	48 c1 e0 0c          	shl    $0xc,%rax
  80225d:	c9                   	leaveq 
  80225e:	c3                   	retq   

000000000080225f <fd_alloc>:
  80225f:	55                   	push   %rbp
  802260:	48 89 e5             	mov    %rsp,%rbp
  802263:	48 83 ec 18          	sub    $0x18,%rsp
  802267:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80226b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802272:	eb 6b                	jmp    8022df <fd_alloc+0x80>
  802274:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802277:	48 98                	cltq   
  802279:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80227f:	48 c1 e0 0c          	shl    $0xc,%rax
  802283:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802287:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80228b:	48 c1 e8 15          	shr    $0x15,%rax
  80228f:	48 89 c2             	mov    %rax,%rdx
  802292:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802299:	01 00 00 
  80229c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022a0:	83 e0 01             	and    $0x1,%eax
  8022a3:	48 85 c0             	test   %rax,%rax
  8022a6:	74 21                	je     8022c9 <fd_alloc+0x6a>
  8022a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022ac:	48 c1 e8 0c          	shr    $0xc,%rax
  8022b0:	48 89 c2             	mov    %rax,%rdx
  8022b3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022ba:	01 00 00 
  8022bd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022c1:	83 e0 01             	and    $0x1,%eax
  8022c4:	48 85 c0             	test   %rax,%rax
  8022c7:	75 12                	jne    8022db <fd_alloc+0x7c>
  8022c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022cd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8022d1:	48 89 10             	mov    %rdx,(%rax)
  8022d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8022d9:	eb 1a                	jmp    8022f5 <fd_alloc+0x96>
  8022db:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8022df:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8022e3:	7e 8f                	jle    802274 <fd_alloc+0x15>
  8022e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022e9:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8022f0:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8022f5:	c9                   	leaveq 
  8022f6:	c3                   	retq   

00000000008022f7 <fd_lookup>:
  8022f7:	55                   	push   %rbp
  8022f8:	48 89 e5             	mov    %rsp,%rbp
  8022fb:	48 83 ec 20          	sub    $0x20,%rsp
  8022ff:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802302:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802306:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80230a:	78 06                	js     802312 <fd_lookup+0x1b>
  80230c:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802310:	7e 07                	jle    802319 <fd_lookup+0x22>
  802312:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802317:	eb 6c                	jmp    802385 <fd_lookup+0x8e>
  802319:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80231c:	48 98                	cltq   
  80231e:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802324:	48 c1 e0 0c          	shl    $0xc,%rax
  802328:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80232c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802330:	48 c1 e8 15          	shr    $0x15,%rax
  802334:	48 89 c2             	mov    %rax,%rdx
  802337:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80233e:	01 00 00 
  802341:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802345:	83 e0 01             	and    $0x1,%eax
  802348:	48 85 c0             	test   %rax,%rax
  80234b:	74 21                	je     80236e <fd_lookup+0x77>
  80234d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802351:	48 c1 e8 0c          	shr    $0xc,%rax
  802355:	48 89 c2             	mov    %rax,%rdx
  802358:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80235f:	01 00 00 
  802362:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802366:	83 e0 01             	and    $0x1,%eax
  802369:	48 85 c0             	test   %rax,%rax
  80236c:	75 07                	jne    802375 <fd_lookup+0x7e>
  80236e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802373:	eb 10                	jmp    802385 <fd_lookup+0x8e>
  802375:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802379:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80237d:	48 89 10             	mov    %rdx,(%rax)
  802380:	b8 00 00 00 00       	mov    $0x0,%eax
  802385:	c9                   	leaveq 
  802386:	c3                   	retq   

0000000000802387 <fd_close>:
  802387:	55                   	push   %rbp
  802388:	48 89 e5             	mov    %rsp,%rbp
  80238b:	48 83 ec 30          	sub    $0x30,%rsp
  80238f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802393:	89 f0                	mov    %esi,%eax
  802395:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802398:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80239c:	48 89 c7             	mov    %rax,%rdi
  80239f:	48 b8 11 22 80 00 00 	movabs $0x802211,%rax
  8023a6:	00 00 00 
  8023a9:	ff d0                	callq  *%rax
  8023ab:	89 c2                	mov    %eax,%edx
  8023ad:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8023b1:	48 89 c6             	mov    %rax,%rsi
  8023b4:	89 d7                	mov    %edx,%edi
  8023b6:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  8023bd:	00 00 00 
  8023c0:	ff d0                	callq  *%rax
  8023c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023c5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023c9:	78 0a                	js     8023d5 <fd_close+0x4e>
  8023cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023cf:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8023d3:	74 12                	je     8023e7 <fd_close+0x60>
  8023d5:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8023d9:	74 05                	je     8023e0 <fd_close+0x59>
  8023db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023de:	eb 70                	jmp    802450 <fd_close+0xc9>
  8023e0:	b8 00 00 00 00       	mov    $0x0,%eax
  8023e5:	eb 69                	jmp    802450 <fd_close+0xc9>
  8023e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023eb:	8b 00                	mov    (%rax),%eax
  8023ed:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8023f1:	48 89 d6             	mov    %rdx,%rsi
  8023f4:	89 c7                	mov    %eax,%edi
  8023f6:	48 b8 52 24 80 00 00 	movabs $0x802452,%rax
  8023fd:	00 00 00 
  802400:	ff d0                	callq  *%rax
  802402:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802405:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802409:	78 2a                	js     802435 <fd_close+0xae>
  80240b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80240f:	48 8b 40 20          	mov    0x20(%rax),%rax
  802413:	48 85 c0             	test   %rax,%rax
  802416:	74 16                	je     80242e <fd_close+0xa7>
  802418:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80241c:	48 8b 40 20          	mov    0x20(%rax),%rax
  802420:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802424:	48 89 d7             	mov    %rdx,%rdi
  802427:	ff d0                	callq  *%rax
  802429:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80242c:	eb 07                	jmp    802435 <fd_close+0xae>
  80242e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802435:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802439:	48 89 c6             	mov    %rax,%rsi
  80243c:	bf 00 00 00 00       	mov    $0x0,%edi
  802441:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  802448:	00 00 00 
  80244b:	ff d0                	callq  *%rax
  80244d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802450:	c9                   	leaveq 
  802451:	c3                   	retq   

0000000000802452 <dev_lookup>:
  802452:	55                   	push   %rbp
  802453:	48 89 e5             	mov    %rsp,%rbp
  802456:	48 83 ec 20          	sub    $0x20,%rsp
  80245a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80245d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802461:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802468:	eb 41                	jmp    8024ab <dev_lookup+0x59>
  80246a:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802471:	00 00 00 
  802474:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802477:	48 63 d2             	movslq %edx,%rdx
  80247a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80247e:	8b 00                	mov    (%rax),%eax
  802480:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802483:	75 22                	jne    8024a7 <dev_lookup+0x55>
  802485:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80248c:	00 00 00 
  80248f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802492:	48 63 d2             	movslq %edx,%rdx
  802495:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802499:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80249d:	48 89 10             	mov    %rdx,(%rax)
  8024a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8024a5:	eb 60                	jmp    802507 <dev_lookup+0xb5>
  8024a7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8024ab:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8024b2:	00 00 00 
  8024b5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024b8:	48 63 d2             	movslq %edx,%rdx
  8024bb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024bf:	48 85 c0             	test   %rax,%rax
  8024c2:	75 a6                	jne    80246a <dev_lookup+0x18>
  8024c4:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8024cb:	00 00 00 
  8024ce:	48 8b 00             	mov    (%rax),%rax
  8024d1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8024d7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8024da:	89 c6                	mov    %eax,%esi
  8024dc:	48 bf 18 4e 80 00 00 	movabs $0x804e18,%rdi
  8024e3:	00 00 00 
  8024e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8024eb:	48 b9 3d 03 80 00 00 	movabs $0x80033d,%rcx
  8024f2:	00 00 00 
  8024f5:	ff d1                	callq  *%rcx
  8024f7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024fb:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802502:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802507:	c9                   	leaveq 
  802508:	c3                   	retq   

0000000000802509 <close>:
  802509:	55                   	push   %rbp
  80250a:	48 89 e5             	mov    %rsp,%rbp
  80250d:	48 83 ec 20          	sub    $0x20,%rsp
  802511:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802514:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802518:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80251b:	48 89 d6             	mov    %rdx,%rsi
  80251e:	89 c7                	mov    %eax,%edi
  802520:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  802527:	00 00 00 
  80252a:	ff d0                	callq  *%rax
  80252c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80252f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802533:	79 05                	jns    80253a <close+0x31>
  802535:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802538:	eb 18                	jmp    802552 <close+0x49>
  80253a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80253e:	be 01 00 00 00       	mov    $0x1,%esi
  802543:	48 89 c7             	mov    %rax,%rdi
  802546:	48 b8 87 23 80 00 00 	movabs $0x802387,%rax
  80254d:	00 00 00 
  802550:	ff d0                	callq  *%rax
  802552:	c9                   	leaveq 
  802553:	c3                   	retq   

0000000000802554 <close_all>:
  802554:	55                   	push   %rbp
  802555:	48 89 e5             	mov    %rsp,%rbp
  802558:	48 83 ec 10          	sub    $0x10,%rsp
  80255c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802563:	eb 15                	jmp    80257a <close_all+0x26>
  802565:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802568:	89 c7                	mov    %eax,%edi
  80256a:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  802571:	00 00 00 
  802574:	ff d0                	callq  *%rax
  802576:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80257a:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80257e:	7e e5                	jle    802565 <close_all+0x11>
  802580:	90                   	nop
  802581:	c9                   	leaveq 
  802582:	c3                   	retq   

0000000000802583 <dup>:
  802583:	55                   	push   %rbp
  802584:	48 89 e5             	mov    %rsp,%rbp
  802587:	48 83 ec 40          	sub    $0x40,%rsp
  80258b:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80258e:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802591:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802595:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802598:	48 89 d6             	mov    %rdx,%rsi
  80259b:	89 c7                	mov    %eax,%edi
  80259d:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  8025a4:	00 00 00 
  8025a7:	ff d0                	callq  *%rax
  8025a9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025ac:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025b0:	79 08                	jns    8025ba <dup+0x37>
  8025b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025b5:	e9 70 01 00 00       	jmpq   80272a <dup+0x1a7>
  8025ba:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8025bd:	89 c7                	mov    %eax,%edi
  8025bf:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  8025c6:	00 00 00 
  8025c9:	ff d0                	callq  *%rax
  8025cb:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8025ce:	48 98                	cltq   
  8025d0:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8025d6:	48 c1 e0 0c          	shl    $0xc,%rax
  8025da:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8025de:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025e2:	48 89 c7             	mov    %rax,%rdi
  8025e5:	48 b8 34 22 80 00 00 	movabs $0x802234,%rax
  8025ec:	00 00 00 
  8025ef:	ff d0                	callq  *%rax
  8025f1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8025f5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025f9:	48 89 c7             	mov    %rax,%rdi
  8025fc:	48 b8 34 22 80 00 00 	movabs $0x802234,%rax
  802603:	00 00 00 
  802606:	ff d0                	callq  *%rax
  802608:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80260c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802610:	48 c1 e8 15          	shr    $0x15,%rax
  802614:	48 89 c2             	mov    %rax,%rdx
  802617:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80261e:	01 00 00 
  802621:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802625:	83 e0 01             	and    $0x1,%eax
  802628:	48 85 c0             	test   %rax,%rax
  80262b:	74 71                	je     80269e <dup+0x11b>
  80262d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802631:	48 c1 e8 0c          	shr    $0xc,%rax
  802635:	48 89 c2             	mov    %rax,%rdx
  802638:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80263f:	01 00 00 
  802642:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802646:	83 e0 01             	and    $0x1,%eax
  802649:	48 85 c0             	test   %rax,%rax
  80264c:	74 50                	je     80269e <dup+0x11b>
  80264e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802652:	48 c1 e8 0c          	shr    $0xc,%rax
  802656:	48 89 c2             	mov    %rax,%rdx
  802659:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802660:	01 00 00 
  802663:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802667:	25 07 0e 00 00       	and    $0xe07,%eax
  80266c:	89 c1                	mov    %eax,%ecx
  80266e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802672:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802676:	41 89 c8             	mov    %ecx,%r8d
  802679:	48 89 d1             	mov    %rdx,%rcx
  80267c:	ba 00 00 00 00       	mov    $0x0,%edx
  802681:	48 89 c6             	mov    %rax,%rsi
  802684:	bf 00 00 00 00       	mov    $0x0,%edi
  802689:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  802690:	00 00 00 
  802693:	ff d0                	callq  *%rax
  802695:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802698:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80269c:	78 55                	js     8026f3 <dup+0x170>
  80269e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026a2:	48 c1 e8 0c          	shr    $0xc,%rax
  8026a6:	48 89 c2             	mov    %rax,%rdx
  8026a9:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8026b0:	01 00 00 
  8026b3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026b7:	25 07 0e 00 00       	and    $0xe07,%eax
  8026bc:	89 c1                	mov    %eax,%ecx
  8026be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026c2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8026c6:	41 89 c8             	mov    %ecx,%r8d
  8026c9:	48 89 d1             	mov    %rdx,%rcx
  8026cc:	ba 00 00 00 00       	mov    $0x0,%edx
  8026d1:	48 89 c6             	mov    %rax,%rsi
  8026d4:	bf 00 00 00 00       	mov    $0x0,%edi
  8026d9:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  8026e0:	00 00 00 
  8026e3:	ff d0                	callq  *%rax
  8026e5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026e8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026ec:	78 08                	js     8026f6 <dup+0x173>
  8026ee:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8026f1:	eb 37                	jmp    80272a <dup+0x1a7>
  8026f3:	90                   	nop
  8026f4:	eb 01                	jmp    8026f7 <dup+0x174>
  8026f6:	90                   	nop
  8026f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026fb:	48 89 c6             	mov    %rax,%rsi
  8026fe:	bf 00 00 00 00       	mov    $0x0,%edi
  802703:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  80270a:	00 00 00 
  80270d:	ff d0                	callq  *%rax
  80270f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802713:	48 89 c6             	mov    %rax,%rsi
  802716:	bf 00 00 00 00       	mov    $0x0,%edi
  80271b:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  802722:	00 00 00 
  802725:	ff d0                	callq  *%rax
  802727:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80272a:	c9                   	leaveq 
  80272b:	c3                   	retq   

000000000080272c <read>:
  80272c:	55                   	push   %rbp
  80272d:	48 89 e5             	mov    %rsp,%rbp
  802730:	48 83 ec 40          	sub    $0x40,%rsp
  802734:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802737:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80273b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80273f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802743:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802746:	48 89 d6             	mov    %rdx,%rsi
  802749:	89 c7                	mov    %eax,%edi
  80274b:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  802752:	00 00 00 
  802755:	ff d0                	callq  *%rax
  802757:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80275a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80275e:	78 24                	js     802784 <read+0x58>
  802760:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802764:	8b 00                	mov    (%rax),%eax
  802766:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80276a:	48 89 d6             	mov    %rdx,%rsi
  80276d:	89 c7                	mov    %eax,%edi
  80276f:	48 b8 52 24 80 00 00 	movabs $0x802452,%rax
  802776:	00 00 00 
  802779:	ff d0                	callq  *%rax
  80277b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80277e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802782:	79 05                	jns    802789 <read+0x5d>
  802784:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802787:	eb 76                	jmp    8027ff <read+0xd3>
  802789:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80278d:	8b 40 08             	mov    0x8(%rax),%eax
  802790:	83 e0 03             	and    $0x3,%eax
  802793:	83 f8 01             	cmp    $0x1,%eax
  802796:	75 3a                	jne    8027d2 <read+0xa6>
  802798:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80279f:	00 00 00 
  8027a2:	48 8b 00             	mov    (%rax),%rax
  8027a5:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8027ab:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8027ae:	89 c6                	mov    %eax,%esi
  8027b0:	48 bf 37 4e 80 00 00 	movabs $0x804e37,%rdi
  8027b7:	00 00 00 
  8027ba:	b8 00 00 00 00       	mov    $0x0,%eax
  8027bf:	48 b9 3d 03 80 00 00 	movabs $0x80033d,%rcx
  8027c6:	00 00 00 
  8027c9:	ff d1                	callq  *%rcx
  8027cb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8027d0:	eb 2d                	jmp    8027ff <read+0xd3>
  8027d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027d6:	48 8b 40 10          	mov    0x10(%rax),%rax
  8027da:	48 85 c0             	test   %rax,%rax
  8027dd:	75 07                	jne    8027e6 <read+0xba>
  8027df:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8027e4:	eb 19                	jmp    8027ff <read+0xd3>
  8027e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027ea:	48 8b 40 10          	mov    0x10(%rax),%rax
  8027ee:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8027f2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8027f6:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8027fa:	48 89 cf             	mov    %rcx,%rdi
  8027fd:	ff d0                	callq  *%rax
  8027ff:	c9                   	leaveq 
  802800:	c3                   	retq   

0000000000802801 <readn>:
  802801:	55                   	push   %rbp
  802802:	48 89 e5             	mov    %rsp,%rbp
  802805:	48 83 ec 30          	sub    $0x30,%rsp
  802809:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80280c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802810:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802814:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80281b:	eb 47                	jmp    802864 <readn+0x63>
  80281d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802820:	48 98                	cltq   
  802822:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802826:	48 29 c2             	sub    %rax,%rdx
  802829:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80282c:	48 63 c8             	movslq %eax,%rcx
  80282f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802833:	48 01 c1             	add    %rax,%rcx
  802836:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802839:	48 89 ce             	mov    %rcx,%rsi
  80283c:	89 c7                	mov    %eax,%edi
  80283e:	48 b8 2c 27 80 00 00 	movabs $0x80272c,%rax
  802845:	00 00 00 
  802848:	ff d0                	callq  *%rax
  80284a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80284d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802851:	79 05                	jns    802858 <readn+0x57>
  802853:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802856:	eb 1d                	jmp    802875 <readn+0x74>
  802858:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80285c:	74 13                	je     802871 <readn+0x70>
  80285e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802861:	01 45 fc             	add    %eax,-0x4(%rbp)
  802864:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802867:	48 98                	cltq   
  802869:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80286d:	72 ae                	jb     80281d <readn+0x1c>
  80286f:	eb 01                	jmp    802872 <readn+0x71>
  802871:	90                   	nop
  802872:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802875:	c9                   	leaveq 
  802876:	c3                   	retq   

0000000000802877 <write>:
  802877:	55                   	push   %rbp
  802878:	48 89 e5             	mov    %rsp,%rbp
  80287b:	48 83 ec 40          	sub    $0x40,%rsp
  80287f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802882:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802886:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80288a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80288e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802891:	48 89 d6             	mov    %rdx,%rsi
  802894:	89 c7                	mov    %eax,%edi
  802896:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  80289d:	00 00 00 
  8028a0:	ff d0                	callq  *%rax
  8028a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028a5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028a9:	78 24                	js     8028cf <write+0x58>
  8028ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028af:	8b 00                	mov    (%rax),%eax
  8028b1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028b5:	48 89 d6             	mov    %rdx,%rsi
  8028b8:	89 c7                	mov    %eax,%edi
  8028ba:	48 b8 52 24 80 00 00 	movabs $0x802452,%rax
  8028c1:	00 00 00 
  8028c4:	ff d0                	callq  *%rax
  8028c6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028cd:	79 05                	jns    8028d4 <write+0x5d>
  8028cf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028d2:	eb 75                	jmp    802949 <write+0xd2>
  8028d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028d8:	8b 40 08             	mov    0x8(%rax),%eax
  8028db:	83 e0 03             	and    $0x3,%eax
  8028de:	85 c0                	test   %eax,%eax
  8028e0:	75 3a                	jne    80291c <write+0xa5>
  8028e2:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8028e9:	00 00 00 
  8028ec:	48 8b 00             	mov    (%rax),%rax
  8028ef:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8028f5:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8028f8:	89 c6                	mov    %eax,%esi
  8028fa:	48 bf 53 4e 80 00 00 	movabs $0x804e53,%rdi
  802901:	00 00 00 
  802904:	b8 00 00 00 00       	mov    $0x0,%eax
  802909:	48 b9 3d 03 80 00 00 	movabs $0x80033d,%rcx
  802910:	00 00 00 
  802913:	ff d1                	callq  *%rcx
  802915:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80291a:	eb 2d                	jmp    802949 <write+0xd2>
  80291c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802920:	48 8b 40 18          	mov    0x18(%rax),%rax
  802924:	48 85 c0             	test   %rax,%rax
  802927:	75 07                	jne    802930 <write+0xb9>
  802929:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80292e:	eb 19                	jmp    802949 <write+0xd2>
  802930:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802934:	48 8b 40 18          	mov    0x18(%rax),%rax
  802938:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80293c:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802940:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802944:	48 89 cf             	mov    %rcx,%rdi
  802947:	ff d0                	callq  *%rax
  802949:	c9                   	leaveq 
  80294a:	c3                   	retq   

000000000080294b <seek>:
  80294b:	55                   	push   %rbp
  80294c:	48 89 e5             	mov    %rsp,%rbp
  80294f:	48 83 ec 18          	sub    $0x18,%rsp
  802953:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802956:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802959:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80295d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802960:	48 89 d6             	mov    %rdx,%rsi
  802963:	89 c7                	mov    %eax,%edi
  802965:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  80296c:	00 00 00 
  80296f:	ff d0                	callq  *%rax
  802971:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802974:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802978:	79 05                	jns    80297f <seek+0x34>
  80297a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80297d:	eb 0f                	jmp    80298e <seek+0x43>
  80297f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802983:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802986:	89 50 04             	mov    %edx,0x4(%rax)
  802989:	b8 00 00 00 00       	mov    $0x0,%eax
  80298e:	c9                   	leaveq 
  80298f:	c3                   	retq   

0000000000802990 <ftruncate>:
  802990:	55                   	push   %rbp
  802991:	48 89 e5             	mov    %rsp,%rbp
  802994:	48 83 ec 30          	sub    $0x30,%rsp
  802998:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80299b:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80299e:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8029a2:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8029a5:	48 89 d6             	mov    %rdx,%rsi
  8029a8:	89 c7                	mov    %eax,%edi
  8029aa:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  8029b1:	00 00 00 
  8029b4:	ff d0                	callq  *%rax
  8029b6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029b9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029bd:	78 24                	js     8029e3 <ftruncate+0x53>
  8029bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029c3:	8b 00                	mov    (%rax),%eax
  8029c5:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8029c9:	48 89 d6             	mov    %rdx,%rsi
  8029cc:	89 c7                	mov    %eax,%edi
  8029ce:	48 b8 52 24 80 00 00 	movabs $0x802452,%rax
  8029d5:	00 00 00 
  8029d8:	ff d0                	callq  *%rax
  8029da:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029e1:	79 05                	jns    8029e8 <ftruncate+0x58>
  8029e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029e6:	eb 72                	jmp    802a5a <ftruncate+0xca>
  8029e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029ec:	8b 40 08             	mov    0x8(%rax),%eax
  8029ef:	83 e0 03             	and    $0x3,%eax
  8029f2:	85 c0                	test   %eax,%eax
  8029f4:	75 3a                	jne    802a30 <ftruncate+0xa0>
  8029f6:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8029fd:	00 00 00 
  802a00:	48 8b 00             	mov    (%rax),%rax
  802a03:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a09:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802a0c:	89 c6                	mov    %eax,%esi
  802a0e:	48 bf 70 4e 80 00 00 	movabs $0x804e70,%rdi
  802a15:	00 00 00 
  802a18:	b8 00 00 00 00       	mov    $0x0,%eax
  802a1d:	48 b9 3d 03 80 00 00 	movabs $0x80033d,%rcx
  802a24:	00 00 00 
  802a27:	ff d1                	callq  *%rcx
  802a29:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a2e:	eb 2a                	jmp    802a5a <ftruncate+0xca>
  802a30:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a34:	48 8b 40 30          	mov    0x30(%rax),%rax
  802a38:	48 85 c0             	test   %rax,%rax
  802a3b:	75 07                	jne    802a44 <ftruncate+0xb4>
  802a3d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802a42:	eb 16                	jmp    802a5a <ftruncate+0xca>
  802a44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a48:	48 8b 40 30          	mov    0x30(%rax),%rax
  802a4c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802a50:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802a53:	89 ce                	mov    %ecx,%esi
  802a55:	48 89 d7             	mov    %rdx,%rdi
  802a58:	ff d0                	callq  *%rax
  802a5a:	c9                   	leaveq 
  802a5b:	c3                   	retq   

0000000000802a5c <fstat>:
  802a5c:	55                   	push   %rbp
  802a5d:	48 89 e5             	mov    %rsp,%rbp
  802a60:	48 83 ec 30          	sub    $0x30,%rsp
  802a64:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802a67:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a6b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802a6f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802a72:	48 89 d6             	mov    %rdx,%rsi
  802a75:	89 c7                	mov    %eax,%edi
  802a77:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  802a7e:	00 00 00 
  802a81:	ff d0                	callq  *%rax
  802a83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a8a:	78 24                	js     802ab0 <fstat+0x54>
  802a8c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a90:	8b 00                	mov    (%rax),%eax
  802a92:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a96:	48 89 d6             	mov    %rdx,%rsi
  802a99:	89 c7                	mov    %eax,%edi
  802a9b:	48 b8 52 24 80 00 00 	movabs $0x802452,%rax
  802aa2:	00 00 00 
  802aa5:	ff d0                	callq  *%rax
  802aa7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aaa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802aae:	79 05                	jns    802ab5 <fstat+0x59>
  802ab0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ab3:	eb 5e                	jmp    802b13 <fstat+0xb7>
  802ab5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ab9:	48 8b 40 28          	mov    0x28(%rax),%rax
  802abd:	48 85 c0             	test   %rax,%rax
  802ac0:	75 07                	jne    802ac9 <fstat+0x6d>
  802ac2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ac7:	eb 4a                	jmp    802b13 <fstat+0xb7>
  802ac9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802acd:	c6 00 00             	movb   $0x0,(%rax)
  802ad0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ad4:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802adb:	00 00 00 
  802ade:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ae2:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802ae9:	00 00 00 
  802aec:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802af0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802af4:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802afb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802aff:	48 8b 40 28          	mov    0x28(%rax),%rax
  802b03:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802b07:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802b0b:	48 89 ce             	mov    %rcx,%rsi
  802b0e:	48 89 d7             	mov    %rdx,%rdi
  802b11:	ff d0                	callq  *%rax
  802b13:	c9                   	leaveq 
  802b14:	c3                   	retq   

0000000000802b15 <stat>:
  802b15:	55                   	push   %rbp
  802b16:	48 89 e5             	mov    %rsp,%rbp
  802b19:	48 83 ec 20          	sub    $0x20,%rsp
  802b1d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b21:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b29:	be 00 00 00 00       	mov    $0x0,%esi
  802b2e:	48 89 c7             	mov    %rax,%rdi
  802b31:	48 b8 05 2c 80 00 00 	movabs $0x802c05,%rax
  802b38:	00 00 00 
  802b3b:	ff d0                	callq  *%rax
  802b3d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b40:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b44:	79 05                	jns    802b4b <stat+0x36>
  802b46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b49:	eb 2f                	jmp    802b7a <stat+0x65>
  802b4b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802b4f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b52:	48 89 d6             	mov    %rdx,%rsi
  802b55:	89 c7                	mov    %eax,%edi
  802b57:	48 b8 5c 2a 80 00 00 	movabs $0x802a5c,%rax
  802b5e:	00 00 00 
  802b61:	ff d0                	callq  *%rax
  802b63:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802b66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b69:	89 c7                	mov    %eax,%edi
  802b6b:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  802b72:	00 00 00 
  802b75:	ff d0                	callq  *%rax
  802b77:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b7a:	c9                   	leaveq 
  802b7b:	c3                   	retq   

0000000000802b7c <fsipc>:
  802b7c:	55                   	push   %rbp
  802b7d:	48 89 e5             	mov    %rsp,%rbp
  802b80:	48 83 ec 10          	sub    $0x10,%rsp
  802b84:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802b87:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802b8b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b92:	00 00 00 
  802b95:	8b 00                	mov    (%rax),%eax
  802b97:	85 c0                	test   %eax,%eax
  802b99:	75 1f                	jne    802bba <fsipc+0x3e>
  802b9b:	bf 01 00 00 00       	mov    $0x1,%edi
  802ba0:	48 b8 c7 46 80 00 00 	movabs $0x8046c7,%rax
  802ba7:	00 00 00 
  802baa:	ff d0                	callq  *%rax
  802bac:	89 c2                	mov    %eax,%edx
  802bae:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bb5:	00 00 00 
  802bb8:	89 10                	mov    %edx,(%rax)
  802bba:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802bc1:	00 00 00 
  802bc4:	8b 00                	mov    (%rax),%eax
  802bc6:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802bc9:	b9 07 00 00 00       	mov    $0x7,%ecx
  802bce:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802bd5:	00 00 00 
  802bd8:	89 c7                	mov    %eax,%edi
  802bda:	48 b8 bd 45 80 00 00 	movabs $0x8045bd,%rax
  802be1:	00 00 00 
  802be4:	ff d0                	callq  *%rax
  802be6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bea:	ba 00 00 00 00       	mov    $0x0,%edx
  802bef:	48 89 c6             	mov    %rax,%rsi
  802bf2:	bf 00 00 00 00       	mov    $0x0,%edi
  802bf7:	48 b8 fc 44 80 00 00 	movabs $0x8044fc,%rax
  802bfe:	00 00 00 
  802c01:	ff d0                	callq  *%rax
  802c03:	c9                   	leaveq 
  802c04:	c3                   	retq   

0000000000802c05 <open>:
  802c05:	55                   	push   %rbp
  802c06:	48 89 e5             	mov    %rsp,%rbp
  802c09:	48 83 ec 20          	sub    $0x20,%rsp
  802c0d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c11:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802c14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c18:	48 89 c7             	mov    %rax,%rdi
  802c1b:	48 b8 61 0e 80 00 00 	movabs $0x800e61,%rax
  802c22:	00 00 00 
  802c25:	ff d0                	callq  *%rax
  802c27:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802c2c:	7e 0a                	jle    802c38 <open+0x33>
  802c2e:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802c33:	e9 a5 00 00 00       	jmpq   802cdd <open+0xd8>
  802c38:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802c3c:	48 89 c7             	mov    %rax,%rdi
  802c3f:	48 b8 5f 22 80 00 00 	movabs $0x80225f,%rax
  802c46:	00 00 00 
  802c49:	ff d0                	callq  *%rax
  802c4b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c4e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c52:	79 08                	jns    802c5c <open+0x57>
  802c54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c57:	e9 81 00 00 00       	jmpq   802cdd <open+0xd8>
  802c5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c60:	48 89 c6             	mov    %rax,%rsi
  802c63:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802c6a:	00 00 00 
  802c6d:	48 b8 cd 0e 80 00 00 	movabs $0x800ecd,%rax
  802c74:	00 00 00 
  802c77:	ff d0                	callq  *%rax
  802c79:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802c80:	00 00 00 
  802c83:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802c86:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802c8c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c90:	48 89 c6             	mov    %rax,%rsi
  802c93:	bf 01 00 00 00       	mov    $0x1,%edi
  802c98:	48 b8 7c 2b 80 00 00 	movabs $0x802b7c,%rax
  802c9f:	00 00 00 
  802ca2:	ff d0                	callq  *%rax
  802ca4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ca7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cab:	79 1d                	jns    802cca <open+0xc5>
  802cad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cb1:	be 00 00 00 00       	mov    $0x0,%esi
  802cb6:	48 89 c7             	mov    %rax,%rdi
  802cb9:	48 b8 87 23 80 00 00 	movabs $0x802387,%rax
  802cc0:	00 00 00 
  802cc3:	ff d0                	callq  *%rax
  802cc5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cc8:	eb 13                	jmp    802cdd <open+0xd8>
  802cca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cce:	48 89 c7             	mov    %rax,%rdi
  802cd1:	48 b8 11 22 80 00 00 	movabs $0x802211,%rax
  802cd8:	00 00 00 
  802cdb:	ff d0                	callq  *%rax
  802cdd:	c9                   	leaveq 
  802cde:	c3                   	retq   

0000000000802cdf <devfile_flush>:
  802cdf:	55                   	push   %rbp
  802ce0:	48 89 e5             	mov    %rsp,%rbp
  802ce3:	48 83 ec 10          	sub    $0x10,%rsp
  802ce7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ceb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802cef:	8b 50 0c             	mov    0xc(%rax),%edx
  802cf2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802cf9:	00 00 00 
  802cfc:	89 10                	mov    %edx,(%rax)
  802cfe:	be 00 00 00 00       	mov    $0x0,%esi
  802d03:	bf 06 00 00 00       	mov    $0x6,%edi
  802d08:	48 b8 7c 2b 80 00 00 	movabs $0x802b7c,%rax
  802d0f:	00 00 00 
  802d12:	ff d0                	callq  *%rax
  802d14:	c9                   	leaveq 
  802d15:	c3                   	retq   

0000000000802d16 <devfile_read>:
  802d16:	55                   	push   %rbp
  802d17:	48 89 e5             	mov    %rsp,%rbp
  802d1a:	48 83 ec 30          	sub    $0x30,%rsp
  802d1e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d22:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d26:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802d2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d2e:	8b 50 0c             	mov    0xc(%rax),%edx
  802d31:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802d38:	00 00 00 
  802d3b:	89 10                	mov    %edx,(%rax)
  802d3d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802d44:	00 00 00 
  802d47:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802d4b:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802d4f:	be 00 00 00 00       	mov    $0x0,%esi
  802d54:	bf 03 00 00 00       	mov    $0x3,%edi
  802d59:	48 b8 7c 2b 80 00 00 	movabs $0x802b7c,%rax
  802d60:	00 00 00 
  802d63:	ff d0                	callq  *%rax
  802d65:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d68:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d6c:	79 08                	jns    802d76 <devfile_read+0x60>
  802d6e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d71:	e9 a4 00 00 00       	jmpq   802e1a <devfile_read+0x104>
  802d76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d79:	48 98                	cltq   
  802d7b:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802d7f:	76 35                	jbe    802db6 <devfile_read+0xa0>
  802d81:	48 b9 96 4e 80 00 00 	movabs $0x804e96,%rcx
  802d88:	00 00 00 
  802d8b:	48 ba 9d 4e 80 00 00 	movabs $0x804e9d,%rdx
  802d92:	00 00 00 
  802d95:	be 89 00 00 00       	mov    $0x89,%esi
  802d9a:	48 bf b2 4e 80 00 00 	movabs $0x804eb2,%rdi
  802da1:	00 00 00 
  802da4:	b8 00 00 00 00       	mov    $0x0,%eax
  802da9:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  802db0:	00 00 00 
  802db3:	41 ff d0             	callq  *%r8
  802db6:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802dbd:	7e 35                	jle    802df4 <devfile_read+0xde>
  802dbf:	48 b9 c0 4e 80 00 00 	movabs $0x804ec0,%rcx
  802dc6:	00 00 00 
  802dc9:	48 ba 9d 4e 80 00 00 	movabs $0x804e9d,%rdx
  802dd0:	00 00 00 
  802dd3:	be 8a 00 00 00       	mov    $0x8a,%esi
  802dd8:	48 bf b2 4e 80 00 00 	movabs $0x804eb2,%rdi
  802ddf:	00 00 00 
  802de2:	b8 00 00 00 00       	mov    $0x0,%eax
  802de7:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  802dee:	00 00 00 
  802df1:	41 ff d0             	callq  *%r8
  802df4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802df7:	48 63 d0             	movslq %eax,%rdx
  802dfa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802dfe:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802e05:	00 00 00 
  802e08:	48 89 c7             	mov    %rax,%rdi
  802e0b:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  802e12:	00 00 00 
  802e15:	ff d0                	callq  *%rax
  802e17:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e1a:	c9                   	leaveq 
  802e1b:	c3                   	retq   

0000000000802e1c <devfile_write>:
  802e1c:	55                   	push   %rbp
  802e1d:	48 89 e5             	mov    %rsp,%rbp
  802e20:	48 83 ec 40          	sub    $0x40,%rsp
  802e24:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802e28:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e2c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802e30:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802e34:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802e38:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802e3f:	00 
  802e40:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e44:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802e48:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802e4d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802e51:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e55:	8b 50 0c             	mov    0xc(%rax),%edx
  802e58:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802e5f:	00 00 00 
  802e62:	89 10                	mov    %edx,(%rax)
  802e64:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802e6b:	00 00 00 
  802e6e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802e72:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802e76:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802e7a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e7e:	48 89 c6             	mov    %rax,%rsi
  802e81:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  802e88:	00 00 00 
  802e8b:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  802e92:	00 00 00 
  802e95:	ff d0                	callq  *%rax
  802e97:	be 00 00 00 00       	mov    $0x0,%esi
  802e9c:	bf 04 00 00 00       	mov    $0x4,%edi
  802ea1:	48 b8 7c 2b 80 00 00 	movabs $0x802b7c,%rax
  802ea8:	00 00 00 
  802eab:	ff d0                	callq  *%rax
  802ead:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802eb0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802eb4:	79 05                	jns    802ebb <devfile_write+0x9f>
  802eb6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802eb9:	eb 43                	jmp    802efe <devfile_write+0xe2>
  802ebb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ebe:	48 98                	cltq   
  802ec0:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802ec4:	76 35                	jbe    802efb <devfile_write+0xdf>
  802ec6:	48 b9 96 4e 80 00 00 	movabs $0x804e96,%rcx
  802ecd:	00 00 00 
  802ed0:	48 ba 9d 4e 80 00 00 	movabs $0x804e9d,%rdx
  802ed7:	00 00 00 
  802eda:	be a8 00 00 00       	mov    $0xa8,%esi
  802edf:	48 bf b2 4e 80 00 00 	movabs $0x804eb2,%rdi
  802ee6:	00 00 00 
  802ee9:	b8 00 00 00 00       	mov    $0x0,%eax
  802eee:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  802ef5:	00 00 00 
  802ef8:	41 ff d0             	callq  *%r8
  802efb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802efe:	c9                   	leaveq 
  802eff:	c3                   	retq   

0000000000802f00 <devfile_stat>:
  802f00:	55                   	push   %rbp
  802f01:	48 89 e5             	mov    %rsp,%rbp
  802f04:	48 83 ec 20          	sub    $0x20,%rsp
  802f08:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802f0c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f10:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f14:	8b 50 0c             	mov    0xc(%rax),%edx
  802f17:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f1e:	00 00 00 
  802f21:	89 10                	mov    %edx,(%rax)
  802f23:	be 00 00 00 00       	mov    $0x0,%esi
  802f28:	bf 05 00 00 00       	mov    $0x5,%edi
  802f2d:	48 b8 7c 2b 80 00 00 	movabs $0x802b7c,%rax
  802f34:	00 00 00 
  802f37:	ff d0                	callq  *%rax
  802f39:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f3c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f40:	79 05                	jns    802f47 <devfile_stat+0x47>
  802f42:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f45:	eb 56                	jmp    802f9d <devfile_stat+0x9d>
  802f47:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f4b:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802f52:	00 00 00 
  802f55:	48 89 c7             	mov    %rax,%rdi
  802f58:	48 b8 cd 0e 80 00 00 	movabs $0x800ecd,%rax
  802f5f:	00 00 00 
  802f62:	ff d0                	callq  *%rax
  802f64:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f6b:	00 00 00 
  802f6e:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802f74:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f78:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802f7e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802f85:	00 00 00 
  802f88:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802f8e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f92:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802f98:	b8 00 00 00 00       	mov    $0x0,%eax
  802f9d:	c9                   	leaveq 
  802f9e:	c3                   	retq   

0000000000802f9f <devfile_trunc>:
  802f9f:	55                   	push   %rbp
  802fa0:	48 89 e5             	mov    %rsp,%rbp
  802fa3:	48 83 ec 10          	sub    $0x10,%rsp
  802fa7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802fab:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802fae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fb2:	8b 50 0c             	mov    0xc(%rax),%edx
  802fb5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802fbc:	00 00 00 
  802fbf:	89 10                	mov    %edx,(%rax)
  802fc1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802fc8:	00 00 00 
  802fcb:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802fce:	89 50 04             	mov    %edx,0x4(%rax)
  802fd1:	be 00 00 00 00       	mov    $0x0,%esi
  802fd6:	bf 02 00 00 00       	mov    $0x2,%edi
  802fdb:	48 b8 7c 2b 80 00 00 	movabs $0x802b7c,%rax
  802fe2:	00 00 00 
  802fe5:	ff d0                	callq  *%rax
  802fe7:	c9                   	leaveq 
  802fe8:	c3                   	retq   

0000000000802fe9 <remove>:
  802fe9:	55                   	push   %rbp
  802fea:	48 89 e5             	mov    %rsp,%rbp
  802fed:	48 83 ec 10          	sub    $0x10,%rsp
  802ff1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802ff5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ff9:	48 89 c7             	mov    %rax,%rdi
  802ffc:	48 b8 61 0e 80 00 00 	movabs $0x800e61,%rax
  803003:	00 00 00 
  803006:	ff d0                	callq  *%rax
  803008:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  80300d:	7e 07                	jle    803016 <remove+0x2d>
  80300f:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  803014:	eb 33                	jmp    803049 <remove+0x60>
  803016:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80301a:	48 89 c6             	mov    %rax,%rsi
  80301d:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803024:	00 00 00 
  803027:	48 b8 cd 0e 80 00 00 	movabs $0x800ecd,%rax
  80302e:	00 00 00 
  803031:	ff d0                	callq  *%rax
  803033:	be 00 00 00 00       	mov    $0x0,%esi
  803038:	bf 07 00 00 00       	mov    $0x7,%edi
  80303d:	48 b8 7c 2b 80 00 00 	movabs $0x802b7c,%rax
  803044:	00 00 00 
  803047:	ff d0                	callq  *%rax
  803049:	c9                   	leaveq 
  80304a:	c3                   	retq   

000000000080304b <sync>:
  80304b:	55                   	push   %rbp
  80304c:	48 89 e5             	mov    %rsp,%rbp
  80304f:	be 00 00 00 00       	mov    $0x0,%esi
  803054:	bf 08 00 00 00       	mov    $0x8,%edi
  803059:	48 b8 7c 2b 80 00 00 	movabs $0x802b7c,%rax
  803060:	00 00 00 
  803063:	ff d0                	callq  *%rax
  803065:	5d                   	pop    %rbp
  803066:	c3                   	retq   

0000000000803067 <copy>:
  803067:	55                   	push   %rbp
  803068:	48 89 e5             	mov    %rsp,%rbp
  80306b:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  803072:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803079:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803080:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803087:	be 00 00 00 00       	mov    $0x0,%esi
  80308c:	48 89 c7             	mov    %rax,%rdi
  80308f:	48 b8 05 2c 80 00 00 	movabs $0x802c05,%rax
  803096:	00 00 00 
  803099:	ff d0                	callq  *%rax
  80309b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80309e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030a2:	79 28                	jns    8030cc <copy+0x65>
  8030a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030a7:	89 c6                	mov    %eax,%esi
  8030a9:	48 bf cc 4e 80 00 00 	movabs $0x804ecc,%rdi
  8030b0:	00 00 00 
  8030b3:	b8 00 00 00 00       	mov    $0x0,%eax
  8030b8:	48 ba 3d 03 80 00 00 	movabs $0x80033d,%rdx
  8030bf:	00 00 00 
  8030c2:	ff d2                	callq  *%rdx
  8030c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030c7:	e9 76 01 00 00       	jmpq   803242 <copy+0x1db>
  8030cc:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8030d3:	be 01 01 00 00       	mov    $0x101,%esi
  8030d8:	48 89 c7             	mov    %rax,%rdi
  8030db:	48 b8 05 2c 80 00 00 	movabs $0x802c05,%rax
  8030e2:	00 00 00 
  8030e5:	ff d0                	callq  *%rax
  8030e7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8030ea:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8030ee:	0f 89 ad 00 00 00    	jns    8031a1 <copy+0x13a>
  8030f4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8030f7:	89 c6                	mov    %eax,%esi
  8030f9:	48 bf e2 4e 80 00 00 	movabs $0x804ee2,%rdi
  803100:	00 00 00 
  803103:	b8 00 00 00 00       	mov    $0x0,%eax
  803108:	48 ba 3d 03 80 00 00 	movabs $0x80033d,%rdx
  80310f:	00 00 00 
  803112:	ff d2                	callq  *%rdx
  803114:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803117:	89 c7                	mov    %eax,%edi
  803119:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  803120:	00 00 00 
  803123:	ff d0                	callq  *%rax
  803125:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803128:	e9 15 01 00 00       	jmpq   803242 <copy+0x1db>
  80312d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803130:	48 63 d0             	movslq %eax,%rdx
  803133:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  80313a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80313d:	48 89 ce             	mov    %rcx,%rsi
  803140:	89 c7                	mov    %eax,%edi
  803142:	48 b8 77 28 80 00 00 	movabs $0x802877,%rax
  803149:	00 00 00 
  80314c:	ff d0                	callq  *%rax
  80314e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803151:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803155:	79 4a                	jns    8031a1 <copy+0x13a>
  803157:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80315a:	89 c6                	mov    %eax,%esi
  80315c:	48 bf fc 4e 80 00 00 	movabs $0x804efc,%rdi
  803163:	00 00 00 
  803166:	b8 00 00 00 00       	mov    $0x0,%eax
  80316b:	48 ba 3d 03 80 00 00 	movabs $0x80033d,%rdx
  803172:	00 00 00 
  803175:	ff d2                	callq  *%rdx
  803177:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80317a:	89 c7                	mov    %eax,%edi
  80317c:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  803183:	00 00 00 
  803186:	ff d0                	callq  *%rax
  803188:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80318b:	89 c7                	mov    %eax,%edi
  80318d:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  803194:	00 00 00 
  803197:	ff d0                	callq  *%rax
  803199:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80319c:	e9 a1 00 00 00       	jmpq   803242 <copy+0x1db>
  8031a1:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8031a8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031ab:	ba 00 02 00 00       	mov    $0x200,%edx
  8031b0:	48 89 ce             	mov    %rcx,%rsi
  8031b3:	89 c7                	mov    %eax,%edi
  8031b5:	48 b8 2c 27 80 00 00 	movabs $0x80272c,%rax
  8031bc:	00 00 00 
  8031bf:	ff d0                	callq  *%rax
  8031c1:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8031c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8031c8:	0f 8f 5f ff ff ff    	jg     80312d <copy+0xc6>
  8031ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8031d2:	79 47                	jns    80321b <copy+0x1b4>
  8031d4:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8031d7:	89 c6                	mov    %eax,%esi
  8031d9:	48 bf 0f 4f 80 00 00 	movabs $0x804f0f,%rdi
  8031e0:	00 00 00 
  8031e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8031e8:	48 ba 3d 03 80 00 00 	movabs $0x80033d,%rdx
  8031ef:	00 00 00 
  8031f2:	ff d2                	callq  *%rdx
  8031f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031f7:	89 c7                	mov    %eax,%edi
  8031f9:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  803200:	00 00 00 
  803203:	ff d0                	callq  *%rax
  803205:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803208:	89 c7                	mov    %eax,%edi
  80320a:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  803211:	00 00 00 
  803214:	ff d0                	callq  *%rax
  803216:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803219:	eb 27                	jmp    803242 <copy+0x1db>
  80321b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80321e:	89 c7                	mov    %eax,%edi
  803220:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  803227:	00 00 00 
  80322a:	ff d0                	callq  *%rax
  80322c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80322f:	89 c7                	mov    %eax,%edi
  803231:	48 b8 09 25 80 00 00 	movabs $0x802509,%rax
  803238:	00 00 00 
  80323b:	ff d0                	callq  *%rax
  80323d:	b8 00 00 00 00       	mov    $0x0,%eax
  803242:	c9                   	leaveq 
  803243:	c3                   	retq   

0000000000803244 <fd2sockid>:
  803244:	55                   	push   %rbp
  803245:	48 89 e5             	mov    %rsp,%rbp
  803248:	48 83 ec 20          	sub    $0x20,%rsp
  80324c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80324f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803253:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803256:	48 89 d6             	mov    %rdx,%rsi
  803259:	89 c7                	mov    %eax,%edi
  80325b:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  803262:	00 00 00 
  803265:	ff d0                	callq  *%rax
  803267:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80326a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80326e:	79 05                	jns    803275 <fd2sockid+0x31>
  803270:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803273:	eb 24                	jmp    803299 <fd2sockid+0x55>
  803275:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803279:	8b 10                	mov    (%rax),%edx
  80327b:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803282:	00 00 00 
  803285:	8b 00                	mov    (%rax),%eax
  803287:	39 c2                	cmp    %eax,%edx
  803289:	74 07                	je     803292 <fd2sockid+0x4e>
  80328b:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803290:	eb 07                	jmp    803299 <fd2sockid+0x55>
  803292:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803296:	8b 40 0c             	mov    0xc(%rax),%eax
  803299:	c9                   	leaveq 
  80329a:	c3                   	retq   

000000000080329b <alloc_sockfd>:
  80329b:	55                   	push   %rbp
  80329c:	48 89 e5             	mov    %rsp,%rbp
  80329f:	48 83 ec 20          	sub    $0x20,%rsp
  8032a3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032a6:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8032aa:	48 89 c7             	mov    %rax,%rdi
  8032ad:	48 b8 5f 22 80 00 00 	movabs $0x80225f,%rax
  8032b4:	00 00 00 
  8032b7:	ff d0                	callq  *%rax
  8032b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032bc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032c0:	78 26                	js     8032e8 <alloc_sockfd+0x4d>
  8032c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032c6:	ba 07 04 00 00       	mov    $0x407,%edx
  8032cb:	48 89 c6             	mov    %rax,%rsi
  8032ce:	bf 00 00 00 00       	mov    $0x0,%edi
  8032d3:	48 b8 fd 17 80 00 00 	movabs $0x8017fd,%rax
  8032da:	00 00 00 
  8032dd:	ff d0                	callq  *%rax
  8032df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032e6:	79 16                	jns    8032fe <alloc_sockfd+0x63>
  8032e8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032eb:	89 c7                	mov    %eax,%edi
  8032ed:	48 b8 aa 37 80 00 00 	movabs $0x8037aa,%rax
  8032f4:	00 00 00 
  8032f7:	ff d0                	callq  *%rax
  8032f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032fc:	eb 3a                	jmp    803338 <alloc_sockfd+0x9d>
  8032fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803302:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803309:	00 00 00 
  80330c:	8b 12                	mov    (%rdx),%edx
  80330e:	89 10                	mov    %edx,(%rax)
  803310:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803314:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80331b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80331f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803322:	89 50 0c             	mov    %edx,0xc(%rax)
  803325:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803329:	48 89 c7             	mov    %rax,%rdi
  80332c:	48 b8 11 22 80 00 00 	movabs $0x802211,%rax
  803333:	00 00 00 
  803336:	ff d0                	callq  *%rax
  803338:	c9                   	leaveq 
  803339:	c3                   	retq   

000000000080333a <accept>:
  80333a:	55                   	push   %rbp
  80333b:	48 89 e5             	mov    %rsp,%rbp
  80333e:	48 83 ec 30          	sub    $0x30,%rsp
  803342:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803345:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803349:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80334d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803350:	89 c7                	mov    %eax,%edi
  803352:	48 b8 44 32 80 00 00 	movabs $0x803244,%rax
  803359:	00 00 00 
  80335c:	ff d0                	callq  *%rax
  80335e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803361:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803365:	79 05                	jns    80336c <accept+0x32>
  803367:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80336a:	eb 3b                	jmp    8033a7 <accept+0x6d>
  80336c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803370:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803374:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803377:	48 89 ce             	mov    %rcx,%rsi
  80337a:	89 c7                	mov    %eax,%edi
  80337c:	48 b8 87 36 80 00 00 	movabs $0x803687,%rax
  803383:	00 00 00 
  803386:	ff d0                	callq  *%rax
  803388:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80338b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80338f:	79 05                	jns    803396 <accept+0x5c>
  803391:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803394:	eb 11                	jmp    8033a7 <accept+0x6d>
  803396:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803399:	89 c7                	mov    %eax,%edi
  80339b:	48 b8 9b 32 80 00 00 	movabs $0x80329b,%rax
  8033a2:	00 00 00 
  8033a5:	ff d0                	callq  *%rax
  8033a7:	c9                   	leaveq 
  8033a8:	c3                   	retq   

00000000008033a9 <bind>:
  8033a9:	55                   	push   %rbp
  8033aa:	48 89 e5             	mov    %rsp,%rbp
  8033ad:	48 83 ec 20          	sub    $0x20,%rsp
  8033b1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033b4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033b8:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8033bb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033be:	89 c7                	mov    %eax,%edi
  8033c0:	48 b8 44 32 80 00 00 	movabs $0x803244,%rax
  8033c7:	00 00 00 
  8033ca:	ff d0                	callq  *%rax
  8033cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033d3:	79 05                	jns    8033da <bind+0x31>
  8033d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033d8:	eb 1b                	jmp    8033f5 <bind+0x4c>
  8033da:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8033dd:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8033e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033e4:	48 89 ce             	mov    %rcx,%rsi
  8033e7:	89 c7                	mov    %eax,%edi
  8033e9:	48 b8 06 37 80 00 00 	movabs $0x803706,%rax
  8033f0:	00 00 00 
  8033f3:	ff d0                	callq  *%rax
  8033f5:	c9                   	leaveq 
  8033f6:	c3                   	retq   

00000000008033f7 <shutdown>:
  8033f7:	55                   	push   %rbp
  8033f8:	48 89 e5             	mov    %rsp,%rbp
  8033fb:	48 83 ec 20          	sub    $0x20,%rsp
  8033ff:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803402:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803405:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803408:	89 c7                	mov    %eax,%edi
  80340a:	48 b8 44 32 80 00 00 	movabs $0x803244,%rax
  803411:	00 00 00 
  803414:	ff d0                	callq  *%rax
  803416:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803419:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80341d:	79 05                	jns    803424 <shutdown+0x2d>
  80341f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803422:	eb 16                	jmp    80343a <shutdown+0x43>
  803424:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803427:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80342a:	89 d6                	mov    %edx,%esi
  80342c:	89 c7                	mov    %eax,%edi
  80342e:	48 b8 6a 37 80 00 00 	movabs $0x80376a,%rax
  803435:	00 00 00 
  803438:	ff d0                	callq  *%rax
  80343a:	c9                   	leaveq 
  80343b:	c3                   	retq   

000000000080343c <devsock_close>:
  80343c:	55                   	push   %rbp
  80343d:	48 89 e5             	mov    %rsp,%rbp
  803440:	48 83 ec 10          	sub    $0x10,%rsp
  803444:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803448:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80344c:	48 89 c7             	mov    %rax,%rdi
  80344f:	48 b8 38 47 80 00 00 	movabs $0x804738,%rax
  803456:	00 00 00 
  803459:	ff d0                	callq  *%rax
  80345b:	83 f8 01             	cmp    $0x1,%eax
  80345e:	75 17                	jne    803477 <devsock_close+0x3b>
  803460:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803464:	8b 40 0c             	mov    0xc(%rax),%eax
  803467:	89 c7                	mov    %eax,%edi
  803469:	48 b8 aa 37 80 00 00 	movabs $0x8037aa,%rax
  803470:	00 00 00 
  803473:	ff d0                	callq  *%rax
  803475:	eb 05                	jmp    80347c <devsock_close+0x40>
  803477:	b8 00 00 00 00       	mov    $0x0,%eax
  80347c:	c9                   	leaveq 
  80347d:	c3                   	retq   

000000000080347e <connect>:
  80347e:	55                   	push   %rbp
  80347f:	48 89 e5             	mov    %rsp,%rbp
  803482:	48 83 ec 20          	sub    $0x20,%rsp
  803486:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803489:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80348d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803490:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803493:	89 c7                	mov    %eax,%edi
  803495:	48 b8 44 32 80 00 00 	movabs $0x803244,%rax
  80349c:	00 00 00 
  80349f:	ff d0                	callq  *%rax
  8034a1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034a4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034a8:	79 05                	jns    8034af <connect+0x31>
  8034aa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034ad:	eb 1b                	jmp    8034ca <connect+0x4c>
  8034af:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8034b2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8034b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034b9:	48 89 ce             	mov    %rcx,%rsi
  8034bc:	89 c7                	mov    %eax,%edi
  8034be:	48 b8 d7 37 80 00 00 	movabs $0x8037d7,%rax
  8034c5:	00 00 00 
  8034c8:	ff d0                	callq  *%rax
  8034ca:	c9                   	leaveq 
  8034cb:	c3                   	retq   

00000000008034cc <listen>:
  8034cc:	55                   	push   %rbp
  8034cd:	48 89 e5             	mov    %rsp,%rbp
  8034d0:	48 83 ec 20          	sub    $0x20,%rsp
  8034d4:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034d7:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8034da:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034dd:	89 c7                	mov    %eax,%edi
  8034df:	48 b8 44 32 80 00 00 	movabs $0x803244,%rax
  8034e6:	00 00 00 
  8034e9:	ff d0                	callq  *%rax
  8034eb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034ee:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034f2:	79 05                	jns    8034f9 <listen+0x2d>
  8034f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034f7:	eb 16                	jmp    80350f <listen+0x43>
  8034f9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8034fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034ff:	89 d6                	mov    %edx,%esi
  803501:	89 c7                	mov    %eax,%edi
  803503:	48 b8 3b 38 80 00 00 	movabs $0x80383b,%rax
  80350a:	00 00 00 
  80350d:	ff d0                	callq  *%rax
  80350f:	c9                   	leaveq 
  803510:	c3                   	retq   

0000000000803511 <devsock_read>:
  803511:	55                   	push   %rbp
  803512:	48 89 e5             	mov    %rsp,%rbp
  803515:	48 83 ec 20          	sub    $0x20,%rsp
  803519:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80351d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803521:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803525:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803529:	89 c2                	mov    %eax,%edx
  80352b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80352f:	8b 40 0c             	mov    0xc(%rax),%eax
  803532:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803536:	b9 00 00 00 00       	mov    $0x0,%ecx
  80353b:	89 c7                	mov    %eax,%edi
  80353d:	48 b8 7b 38 80 00 00 	movabs $0x80387b,%rax
  803544:	00 00 00 
  803547:	ff d0                	callq  *%rax
  803549:	c9                   	leaveq 
  80354a:	c3                   	retq   

000000000080354b <devsock_write>:
  80354b:	55                   	push   %rbp
  80354c:	48 89 e5             	mov    %rsp,%rbp
  80354f:	48 83 ec 20          	sub    $0x20,%rsp
  803553:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803557:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80355b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80355f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803563:	89 c2                	mov    %eax,%edx
  803565:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803569:	8b 40 0c             	mov    0xc(%rax),%eax
  80356c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803570:	b9 00 00 00 00       	mov    $0x0,%ecx
  803575:	89 c7                	mov    %eax,%edi
  803577:	48 b8 47 39 80 00 00 	movabs $0x803947,%rax
  80357e:	00 00 00 
  803581:	ff d0                	callq  *%rax
  803583:	c9                   	leaveq 
  803584:	c3                   	retq   

0000000000803585 <devsock_stat>:
  803585:	55                   	push   %rbp
  803586:	48 89 e5             	mov    %rsp,%rbp
  803589:	48 83 ec 10          	sub    $0x10,%rsp
  80358d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803591:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803595:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803599:	48 be 2a 4f 80 00 00 	movabs $0x804f2a,%rsi
  8035a0:	00 00 00 
  8035a3:	48 89 c7             	mov    %rax,%rdi
  8035a6:	48 b8 cd 0e 80 00 00 	movabs $0x800ecd,%rax
  8035ad:	00 00 00 
  8035b0:	ff d0                	callq  *%rax
  8035b2:	b8 00 00 00 00       	mov    $0x0,%eax
  8035b7:	c9                   	leaveq 
  8035b8:	c3                   	retq   

00000000008035b9 <socket>:
  8035b9:	55                   	push   %rbp
  8035ba:	48 89 e5             	mov    %rsp,%rbp
  8035bd:	48 83 ec 20          	sub    $0x20,%rsp
  8035c1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035c4:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8035c7:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8035ca:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8035cd:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8035d0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035d3:	89 ce                	mov    %ecx,%esi
  8035d5:	89 c7                	mov    %eax,%edi
  8035d7:	48 b8 ff 39 80 00 00 	movabs $0x8039ff,%rax
  8035de:	00 00 00 
  8035e1:	ff d0                	callq  *%rax
  8035e3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8035e6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8035ea:	79 05                	jns    8035f1 <socket+0x38>
  8035ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035ef:	eb 11                	jmp    803602 <socket+0x49>
  8035f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035f4:	89 c7                	mov    %eax,%edi
  8035f6:	48 b8 9b 32 80 00 00 	movabs $0x80329b,%rax
  8035fd:	00 00 00 
  803600:	ff d0                	callq  *%rax
  803602:	c9                   	leaveq 
  803603:	c3                   	retq   

0000000000803604 <nsipc>:
  803604:	55                   	push   %rbp
  803605:	48 89 e5             	mov    %rsp,%rbp
  803608:	48 83 ec 10          	sub    $0x10,%rsp
  80360c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80360f:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803616:	00 00 00 
  803619:	8b 00                	mov    (%rax),%eax
  80361b:	85 c0                	test   %eax,%eax
  80361d:	75 1f                	jne    80363e <nsipc+0x3a>
  80361f:	bf 02 00 00 00       	mov    $0x2,%edi
  803624:	48 b8 c7 46 80 00 00 	movabs $0x8046c7,%rax
  80362b:	00 00 00 
  80362e:	ff d0                	callq  *%rax
  803630:	89 c2                	mov    %eax,%edx
  803632:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803639:	00 00 00 
  80363c:	89 10                	mov    %edx,(%rax)
  80363e:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803645:	00 00 00 
  803648:	8b 00                	mov    (%rax),%eax
  80364a:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80364d:	b9 07 00 00 00       	mov    $0x7,%ecx
  803652:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803659:	00 00 00 
  80365c:	89 c7                	mov    %eax,%edi
  80365e:	48 b8 bd 45 80 00 00 	movabs $0x8045bd,%rax
  803665:	00 00 00 
  803668:	ff d0                	callq  *%rax
  80366a:	ba 00 00 00 00       	mov    $0x0,%edx
  80366f:	be 00 00 00 00       	mov    $0x0,%esi
  803674:	bf 00 00 00 00       	mov    $0x0,%edi
  803679:	48 b8 fc 44 80 00 00 	movabs $0x8044fc,%rax
  803680:	00 00 00 
  803683:	ff d0                	callq  *%rax
  803685:	c9                   	leaveq 
  803686:	c3                   	retq   

0000000000803687 <nsipc_accept>:
  803687:	55                   	push   %rbp
  803688:	48 89 e5             	mov    %rsp,%rbp
  80368b:	48 83 ec 30          	sub    $0x30,%rsp
  80368f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803692:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803696:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80369a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8036a1:	00 00 00 
  8036a4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8036a7:	89 10                	mov    %edx,(%rax)
  8036a9:	bf 01 00 00 00       	mov    $0x1,%edi
  8036ae:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  8036b5:	00 00 00 
  8036b8:	ff d0                	callq  *%rax
  8036ba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036bd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036c1:	78 3e                	js     803701 <nsipc_accept+0x7a>
  8036c3:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8036ca:	00 00 00 
  8036cd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8036d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036d5:	8b 40 10             	mov    0x10(%rax),%eax
  8036d8:	89 c2                	mov    %eax,%edx
  8036da:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8036de:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036e2:	48 89 ce             	mov    %rcx,%rsi
  8036e5:	48 89 c7             	mov    %rax,%rdi
  8036e8:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  8036ef:	00 00 00 
  8036f2:	ff d0                	callq  *%rax
  8036f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036f8:	8b 50 10             	mov    0x10(%rax),%edx
  8036fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036ff:	89 10                	mov    %edx,(%rax)
  803701:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803704:	c9                   	leaveq 
  803705:	c3                   	retq   

0000000000803706 <nsipc_bind>:
  803706:	55                   	push   %rbp
  803707:	48 89 e5             	mov    %rsp,%rbp
  80370a:	48 83 ec 10          	sub    $0x10,%rsp
  80370e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803711:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803715:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803718:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80371f:	00 00 00 
  803722:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803725:	89 10                	mov    %edx,(%rax)
  803727:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80372a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80372e:	48 89 c6             	mov    %rax,%rsi
  803731:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803738:	00 00 00 
  80373b:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  803742:	00 00 00 
  803745:	ff d0                	callq  *%rax
  803747:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80374e:	00 00 00 
  803751:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803754:	89 50 14             	mov    %edx,0x14(%rax)
  803757:	bf 02 00 00 00       	mov    $0x2,%edi
  80375c:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  803763:	00 00 00 
  803766:	ff d0                	callq  *%rax
  803768:	c9                   	leaveq 
  803769:	c3                   	retq   

000000000080376a <nsipc_shutdown>:
  80376a:	55                   	push   %rbp
  80376b:	48 89 e5             	mov    %rsp,%rbp
  80376e:	48 83 ec 10          	sub    $0x10,%rsp
  803772:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803775:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803778:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80377f:	00 00 00 
  803782:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803785:	89 10                	mov    %edx,(%rax)
  803787:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80378e:	00 00 00 
  803791:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803794:	89 50 04             	mov    %edx,0x4(%rax)
  803797:	bf 03 00 00 00       	mov    $0x3,%edi
  80379c:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  8037a3:	00 00 00 
  8037a6:	ff d0                	callq  *%rax
  8037a8:	c9                   	leaveq 
  8037a9:	c3                   	retq   

00000000008037aa <nsipc_close>:
  8037aa:	55                   	push   %rbp
  8037ab:	48 89 e5             	mov    %rsp,%rbp
  8037ae:	48 83 ec 10          	sub    $0x10,%rsp
  8037b2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8037b5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8037bc:	00 00 00 
  8037bf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8037c2:	89 10                	mov    %edx,(%rax)
  8037c4:	bf 04 00 00 00       	mov    $0x4,%edi
  8037c9:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  8037d0:	00 00 00 
  8037d3:	ff d0                	callq  *%rax
  8037d5:	c9                   	leaveq 
  8037d6:	c3                   	retq   

00000000008037d7 <nsipc_connect>:
  8037d7:	55                   	push   %rbp
  8037d8:	48 89 e5             	mov    %rsp,%rbp
  8037db:	48 83 ec 10          	sub    $0x10,%rsp
  8037df:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8037e2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8037e6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8037e9:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8037f0:	00 00 00 
  8037f3:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8037f6:	89 10                	mov    %edx,(%rax)
  8037f8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8037fb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037ff:	48 89 c6             	mov    %rax,%rsi
  803802:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803809:	00 00 00 
  80380c:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  803813:	00 00 00 
  803816:	ff d0                	callq  *%rax
  803818:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80381f:	00 00 00 
  803822:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803825:	89 50 14             	mov    %edx,0x14(%rax)
  803828:	bf 05 00 00 00       	mov    $0x5,%edi
  80382d:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  803834:	00 00 00 
  803837:	ff d0                	callq  *%rax
  803839:	c9                   	leaveq 
  80383a:	c3                   	retq   

000000000080383b <nsipc_listen>:
  80383b:	55                   	push   %rbp
  80383c:	48 89 e5             	mov    %rsp,%rbp
  80383f:	48 83 ec 10          	sub    $0x10,%rsp
  803843:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803846:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803849:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803850:	00 00 00 
  803853:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803856:	89 10                	mov    %edx,(%rax)
  803858:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  80385f:	00 00 00 
  803862:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803865:	89 50 04             	mov    %edx,0x4(%rax)
  803868:	bf 06 00 00 00       	mov    $0x6,%edi
  80386d:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  803874:	00 00 00 
  803877:	ff d0                	callq  *%rax
  803879:	c9                   	leaveq 
  80387a:	c3                   	retq   

000000000080387b <nsipc_recv>:
  80387b:	55                   	push   %rbp
  80387c:	48 89 e5             	mov    %rsp,%rbp
  80387f:	48 83 ec 30          	sub    $0x30,%rsp
  803883:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803886:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80388a:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80388d:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803890:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803897:	00 00 00 
  80389a:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80389d:	89 10                	mov    %edx,(%rax)
  80389f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8038a6:	00 00 00 
  8038a9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038ac:	89 50 04             	mov    %edx,0x4(%rax)
  8038af:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8038b6:	00 00 00 
  8038b9:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8038bc:	89 50 08             	mov    %edx,0x8(%rax)
  8038bf:	bf 07 00 00 00       	mov    $0x7,%edi
  8038c4:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  8038cb:	00 00 00 
  8038ce:	ff d0                	callq  *%rax
  8038d0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038d3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038d7:	78 69                	js     803942 <nsipc_recv+0xc7>
  8038d9:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8038e0:	7f 08                	jg     8038ea <nsipc_recv+0x6f>
  8038e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038e5:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8038e8:	7e 35                	jle    80391f <nsipc_recv+0xa4>
  8038ea:	48 b9 31 4f 80 00 00 	movabs $0x804f31,%rcx
  8038f1:	00 00 00 
  8038f4:	48 ba 46 4f 80 00 00 	movabs $0x804f46,%rdx
  8038fb:	00 00 00 
  8038fe:	be 62 00 00 00       	mov    $0x62,%esi
  803903:	48 bf 5b 4f 80 00 00 	movabs $0x804f5b,%rdi
  80390a:	00 00 00 
  80390d:	b8 00 00 00 00       	mov    $0x0,%eax
  803912:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  803919:	00 00 00 
  80391c:	41 ff d0             	callq  *%r8
  80391f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803922:	48 63 d0             	movslq %eax,%rdx
  803925:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803929:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803930:	00 00 00 
  803933:	48 89 c7             	mov    %rax,%rdi
  803936:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  80393d:	00 00 00 
  803940:	ff d0                	callq  *%rax
  803942:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803945:	c9                   	leaveq 
  803946:	c3                   	retq   

0000000000803947 <nsipc_send>:
  803947:	55                   	push   %rbp
  803948:	48 89 e5             	mov    %rsp,%rbp
  80394b:	48 83 ec 20          	sub    $0x20,%rsp
  80394f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803952:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803956:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803959:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80395c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803963:	00 00 00 
  803966:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803969:	89 10                	mov    %edx,(%rax)
  80396b:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803972:	7e 35                	jle    8039a9 <nsipc_send+0x62>
  803974:	48 b9 6a 4f 80 00 00 	movabs $0x804f6a,%rcx
  80397b:	00 00 00 
  80397e:	48 ba 46 4f 80 00 00 	movabs $0x804f46,%rdx
  803985:	00 00 00 
  803988:	be 6d 00 00 00       	mov    $0x6d,%esi
  80398d:	48 bf 5b 4f 80 00 00 	movabs $0x804f5b,%rdi
  803994:	00 00 00 
  803997:	b8 00 00 00 00       	mov    $0x0,%eax
  80399c:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  8039a3:	00 00 00 
  8039a6:	41 ff d0             	callq  *%r8
  8039a9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039ac:	48 63 d0             	movslq %eax,%rdx
  8039af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039b3:	48 89 c6             	mov    %rax,%rsi
  8039b6:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  8039bd:	00 00 00 
  8039c0:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  8039c7:	00 00 00 
  8039ca:	ff d0                	callq  *%rax
  8039cc:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8039d3:	00 00 00 
  8039d6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8039d9:	89 50 04             	mov    %edx,0x4(%rax)
  8039dc:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  8039e3:	00 00 00 
  8039e6:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8039e9:	89 50 08             	mov    %edx,0x8(%rax)
  8039ec:	bf 08 00 00 00       	mov    $0x8,%edi
  8039f1:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  8039f8:	00 00 00 
  8039fb:	ff d0                	callq  *%rax
  8039fd:	c9                   	leaveq 
  8039fe:	c3                   	retq   

00000000008039ff <nsipc_socket>:
  8039ff:	55                   	push   %rbp
  803a00:	48 89 e5             	mov    %rsp,%rbp
  803a03:	48 83 ec 10          	sub    $0x10,%rsp
  803a07:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a0a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803a0d:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803a10:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a17:	00 00 00 
  803a1a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a1d:	89 10                	mov    %edx,(%rax)
  803a1f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a26:	00 00 00 
  803a29:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a2c:	89 50 04             	mov    %edx,0x4(%rax)
  803a2f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a36:	00 00 00 
  803a39:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803a3c:	89 50 08             	mov    %edx,0x8(%rax)
  803a3f:	bf 09 00 00 00       	mov    $0x9,%edi
  803a44:	48 b8 04 36 80 00 00 	movabs $0x803604,%rax
  803a4b:	00 00 00 
  803a4e:	ff d0                	callq  *%rax
  803a50:	c9                   	leaveq 
  803a51:	c3                   	retq   

0000000000803a52 <pipe>:
  803a52:	55                   	push   %rbp
  803a53:	48 89 e5             	mov    %rsp,%rbp
  803a56:	53                   	push   %rbx
  803a57:	48 83 ec 38          	sub    $0x38,%rsp
  803a5b:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803a5f:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803a63:	48 89 c7             	mov    %rax,%rdi
  803a66:	48 b8 5f 22 80 00 00 	movabs $0x80225f,%rax
  803a6d:	00 00 00 
  803a70:	ff d0                	callq  *%rax
  803a72:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a75:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a79:	0f 88 bf 01 00 00    	js     803c3e <pipe+0x1ec>
  803a7f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a83:	ba 07 04 00 00       	mov    $0x407,%edx
  803a88:	48 89 c6             	mov    %rax,%rsi
  803a8b:	bf 00 00 00 00       	mov    $0x0,%edi
  803a90:	48 b8 fd 17 80 00 00 	movabs $0x8017fd,%rax
  803a97:	00 00 00 
  803a9a:	ff d0                	callq  *%rax
  803a9c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a9f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803aa3:	0f 88 95 01 00 00    	js     803c3e <pipe+0x1ec>
  803aa9:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803aad:	48 89 c7             	mov    %rax,%rdi
  803ab0:	48 b8 5f 22 80 00 00 	movabs $0x80225f,%rax
  803ab7:	00 00 00 
  803aba:	ff d0                	callq  *%rax
  803abc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803abf:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ac3:	0f 88 5d 01 00 00    	js     803c26 <pipe+0x1d4>
  803ac9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803acd:	ba 07 04 00 00       	mov    $0x407,%edx
  803ad2:	48 89 c6             	mov    %rax,%rsi
  803ad5:	bf 00 00 00 00       	mov    $0x0,%edi
  803ada:	48 b8 fd 17 80 00 00 	movabs $0x8017fd,%rax
  803ae1:	00 00 00 
  803ae4:	ff d0                	callq  *%rax
  803ae6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ae9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803aed:	0f 88 33 01 00 00    	js     803c26 <pipe+0x1d4>
  803af3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803af7:	48 89 c7             	mov    %rax,%rdi
  803afa:	48 b8 34 22 80 00 00 	movabs $0x802234,%rax
  803b01:	00 00 00 
  803b04:	ff d0                	callq  *%rax
  803b06:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803b0a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b0e:	ba 07 04 00 00       	mov    $0x407,%edx
  803b13:	48 89 c6             	mov    %rax,%rsi
  803b16:	bf 00 00 00 00       	mov    $0x0,%edi
  803b1b:	48 b8 fd 17 80 00 00 	movabs $0x8017fd,%rax
  803b22:	00 00 00 
  803b25:	ff d0                	callq  *%rax
  803b27:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b2a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b2e:	0f 88 d9 00 00 00    	js     803c0d <pipe+0x1bb>
  803b34:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b38:	48 89 c7             	mov    %rax,%rdi
  803b3b:	48 b8 34 22 80 00 00 	movabs $0x802234,%rax
  803b42:	00 00 00 
  803b45:	ff d0                	callq  *%rax
  803b47:	48 89 c2             	mov    %rax,%rdx
  803b4a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b4e:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803b54:	48 89 d1             	mov    %rdx,%rcx
  803b57:	ba 00 00 00 00       	mov    $0x0,%edx
  803b5c:	48 89 c6             	mov    %rax,%rsi
  803b5f:	bf 00 00 00 00       	mov    $0x0,%edi
  803b64:	48 b8 4f 18 80 00 00 	movabs $0x80184f,%rax
  803b6b:	00 00 00 
  803b6e:	ff d0                	callq  *%rax
  803b70:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b73:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b77:	78 79                	js     803bf2 <pipe+0x1a0>
  803b79:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b7d:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803b84:	00 00 00 
  803b87:	8b 12                	mov    (%rdx),%edx
  803b89:	89 10                	mov    %edx,(%rax)
  803b8b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b8f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803b96:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b9a:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803ba1:	00 00 00 
  803ba4:	8b 12                	mov    (%rdx),%edx
  803ba6:	89 10                	mov    %edx,(%rax)
  803ba8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bac:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803bb3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bb7:	48 89 c7             	mov    %rax,%rdi
  803bba:	48 b8 11 22 80 00 00 	movabs $0x802211,%rax
  803bc1:	00 00 00 
  803bc4:	ff d0                	callq  *%rax
  803bc6:	89 c2                	mov    %eax,%edx
  803bc8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803bcc:	89 10                	mov    %edx,(%rax)
  803bce:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803bd2:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803bd6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bda:	48 89 c7             	mov    %rax,%rdi
  803bdd:	48 b8 11 22 80 00 00 	movabs $0x802211,%rax
  803be4:	00 00 00 
  803be7:	ff d0                	callq  *%rax
  803be9:	89 03                	mov    %eax,(%rbx)
  803beb:	b8 00 00 00 00       	mov    $0x0,%eax
  803bf0:	eb 4f                	jmp    803c41 <pipe+0x1ef>
  803bf2:	90                   	nop
  803bf3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803bf7:	48 89 c6             	mov    %rax,%rsi
  803bfa:	bf 00 00 00 00       	mov    $0x0,%edi
  803bff:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  803c06:	00 00 00 
  803c09:	ff d0                	callq  *%rax
  803c0b:	eb 01                	jmp    803c0e <pipe+0x1bc>
  803c0d:	90                   	nop
  803c0e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c12:	48 89 c6             	mov    %rax,%rsi
  803c15:	bf 00 00 00 00       	mov    $0x0,%edi
  803c1a:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  803c21:	00 00 00 
  803c24:	ff d0                	callq  *%rax
  803c26:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c2a:	48 89 c6             	mov    %rax,%rsi
  803c2d:	bf 00 00 00 00       	mov    $0x0,%edi
  803c32:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  803c39:	00 00 00 
  803c3c:	ff d0                	callq  *%rax
  803c3e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c41:	48 83 c4 38          	add    $0x38,%rsp
  803c45:	5b                   	pop    %rbx
  803c46:	5d                   	pop    %rbp
  803c47:	c3                   	retq   

0000000000803c48 <_pipeisclosed>:
  803c48:	55                   	push   %rbp
  803c49:	48 89 e5             	mov    %rsp,%rbp
  803c4c:	53                   	push   %rbx
  803c4d:	48 83 ec 28          	sub    $0x28,%rsp
  803c51:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803c55:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803c59:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803c60:	00 00 00 
  803c63:	48 8b 00             	mov    (%rax),%rax
  803c66:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803c6c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c6f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c73:	48 89 c7             	mov    %rax,%rdi
  803c76:	48 b8 38 47 80 00 00 	movabs $0x804738,%rax
  803c7d:	00 00 00 
  803c80:	ff d0                	callq  *%rax
  803c82:	89 c3                	mov    %eax,%ebx
  803c84:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c88:	48 89 c7             	mov    %rax,%rdi
  803c8b:	48 b8 38 47 80 00 00 	movabs $0x804738,%rax
  803c92:	00 00 00 
  803c95:	ff d0                	callq  *%rax
  803c97:	39 c3                	cmp    %eax,%ebx
  803c99:	0f 94 c0             	sete   %al
  803c9c:	0f b6 c0             	movzbl %al,%eax
  803c9f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803ca2:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803ca9:	00 00 00 
  803cac:	48 8b 00             	mov    (%rax),%rax
  803caf:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803cb5:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803cb8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cbb:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803cbe:	75 05                	jne    803cc5 <_pipeisclosed+0x7d>
  803cc0:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803cc3:	eb 4a                	jmp    803d0f <_pipeisclosed+0xc7>
  803cc5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cc8:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803ccb:	74 8c                	je     803c59 <_pipeisclosed+0x11>
  803ccd:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803cd1:	75 86                	jne    803c59 <_pipeisclosed+0x11>
  803cd3:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  803cda:	00 00 00 
  803cdd:	48 8b 00             	mov    (%rax),%rax
  803ce0:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803ce6:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803ce9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cec:	89 c6                	mov    %eax,%esi
  803cee:	48 bf 7b 4f 80 00 00 	movabs $0x804f7b,%rdi
  803cf5:	00 00 00 
  803cf8:	b8 00 00 00 00       	mov    $0x0,%eax
  803cfd:	49 b8 3d 03 80 00 00 	movabs $0x80033d,%r8
  803d04:	00 00 00 
  803d07:	41 ff d0             	callq  *%r8
  803d0a:	e9 4a ff ff ff       	jmpq   803c59 <_pipeisclosed+0x11>
  803d0f:	48 83 c4 28          	add    $0x28,%rsp
  803d13:	5b                   	pop    %rbx
  803d14:	5d                   	pop    %rbp
  803d15:	c3                   	retq   

0000000000803d16 <pipeisclosed>:
  803d16:	55                   	push   %rbp
  803d17:	48 89 e5             	mov    %rsp,%rbp
  803d1a:	48 83 ec 30          	sub    $0x30,%rsp
  803d1e:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803d21:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803d25:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803d28:	48 89 d6             	mov    %rdx,%rsi
  803d2b:	89 c7                	mov    %eax,%edi
  803d2d:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  803d34:	00 00 00 
  803d37:	ff d0                	callq  *%rax
  803d39:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d3c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d40:	79 05                	jns    803d47 <pipeisclosed+0x31>
  803d42:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d45:	eb 31                	jmp    803d78 <pipeisclosed+0x62>
  803d47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d4b:	48 89 c7             	mov    %rax,%rdi
  803d4e:	48 b8 34 22 80 00 00 	movabs $0x802234,%rax
  803d55:	00 00 00 
  803d58:	ff d0                	callq  *%rax
  803d5a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d62:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d66:	48 89 d6             	mov    %rdx,%rsi
  803d69:	48 89 c7             	mov    %rax,%rdi
  803d6c:	48 b8 48 3c 80 00 00 	movabs $0x803c48,%rax
  803d73:	00 00 00 
  803d76:	ff d0                	callq  *%rax
  803d78:	c9                   	leaveq 
  803d79:	c3                   	retq   

0000000000803d7a <devpipe_read>:
  803d7a:	55                   	push   %rbp
  803d7b:	48 89 e5             	mov    %rsp,%rbp
  803d7e:	48 83 ec 40          	sub    $0x40,%rsp
  803d82:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803d86:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803d8a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803d8e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d92:	48 89 c7             	mov    %rax,%rdi
  803d95:	48 b8 34 22 80 00 00 	movabs $0x802234,%rax
  803d9c:	00 00 00 
  803d9f:	ff d0                	callq  *%rax
  803da1:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803da5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803da9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803dad:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803db4:	00 
  803db5:	e9 90 00 00 00       	jmpq   803e4a <devpipe_read+0xd0>
  803dba:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803dbf:	74 09                	je     803dca <devpipe_read+0x50>
  803dc1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dc5:	e9 8e 00 00 00       	jmpq   803e58 <devpipe_read+0xde>
  803dca:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803dce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803dd2:	48 89 d6             	mov    %rdx,%rsi
  803dd5:	48 89 c7             	mov    %rax,%rdi
  803dd8:	48 b8 48 3c 80 00 00 	movabs $0x803c48,%rax
  803ddf:	00 00 00 
  803de2:	ff d0                	callq  *%rax
  803de4:	85 c0                	test   %eax,%eax
  803de6:	74 07                	je     803def <devpipe_read+0x75>
  803de8:	b8 00 00 00 00       	mov    $0x0,%eax
  803ded:	eb 69                	jmp    803e58 <devpipe_read+0xde>
  803def:	48 b8 c0 17 80 00 00 	movabs $0x8017c0,%rax
  803df6:	00 00 00 
  803df9:	ff d0                	callq  *%rax
  803dfb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dff:	8b 10                	mov    (%rax),%edx
  803e01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e05:	8b 40 04             	mov    0x4(%rax),%eax
  803e08:	39 c2                	cmp    %eax,%edx
  803e0a:	74 ae                	je     803dba <devpipe_read+0x40>
  803e0c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803e10:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e14:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803e18:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e1c:	8b 00                	mov    (%rax),%eax
  803e1e:	99                   	cltd   
  803e1f:	c1 ea 1b             	shr    $0x1b,%edx
  803e22:	01 d0                	add    %edx,%eax
  803e24:	83 e0 1f             	and    $0x1f,%eax
  803e27:	29 d0                	sub    %edx,%eax
  803e29:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e2d:	48 98                	cltq   
  803e2f:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803e34:	88 01                	mov    %al,(%rcx)
  803e36:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e3a:	8b 00                	mov    (%rax),%eax
  803e3c:	8d 50 01             	lea    0x1(%rax),%edx
  803e3f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e43:	89 10                	mov    %edx,(%rax)
  803e45:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803e4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e4e:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803e52:	72 a7                	jb     803dfb <devpipe_read+0x81>
  803e54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e58:	c9                   	leaveq 
  803e59:	c3                   	retq   

0000000000803e5a <devpipe_write>:
  803e5a:	55                   	push   %rbp
  803e5b:	48 89 e5             	mov    %rsp,%rbp
  803e5e:	48 83 ec 40          	sub    $0x40,%rsp
  803e62:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803e66:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803e6a:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803e6e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e72:	48 89 c7             	mov    %rax,%rdi
  803e75:	48 b8 34 22 80 00 00 	movabs $0x802234,%rax
  803e7c:	00 00 00 
  803e7f:	ff d0                	callq  *%rax
  803e81:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803e85:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e89:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803e8d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803e94:	00 
  803e95:	e9 8f 00 00 00       	jmpq   803f29 <devpipe_write+0xcf>
  803e9a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e9e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ea2:	48 89 d6             	mov    %rdx,%rsi
  803ea5:	48 89 c7             	mov    %rax,%rdi
  803ea8:	48 b8 48 3c 80 00 00 	movabs $0x803c48,%rax
  803eaf:	00 00 00 
  803eb2:	ff d0                	callq  *%rax
  803eb4:	85 c0                	test   %eax,%eax
  803eb6:	74 07                	je     803ebf <devpipe_write+0x65>
  803eb8:	b8 00 00 00 00       	mov    $0x0,%eax
  803ebd:	eb 78                	jmp    803f37 <devpipe_write+0xdd>
  803ebf:	48 b8 c0 17 80 00 00 	movabs $0x8017c0,%rax
  803ec6:	00 00 00 
  803ec9:	ff d0                	callq  *%rax
  803ecb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ecf:	8b 40 04             	mov    0x4(%rax),%eax
  803ed2:	48 63 d0             	movslq %eax,%rdx
  803ed5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ed9:	8b 00                	mov    (%rax),%eax
  803edb:	48 98                	cltq   
  803edd:	48 83 c0 20          	add    $0x20,%rax
  803ee1:	48 39 c2             	cmp    %rax,%rdx
  803ee4:	73 b4                	jae    803e9a <devpipe_write+0x40>
  803ee6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803eea:	8b 40 04             	mov    0x4(%rax),%eax
  803eed:	99                   	cltd   
  803eee:	c1 ea 1b             	shr    $0x1b,%edx
  803ef1:	01 d0                	add    %edx,%eax
  803ef3:	83 e0 1f             	and    $0x1f,%eax
  803ef6:	29 d0                	sub    %edx,%eax
  803ef8:	89 c6                	mov    %eax,%esi
  803efa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803efe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f02:	48 01 d0             	add    %rdx,%rax
  803f05:	0f b6 08             	movzbl (%rax),%ecx
  803f08:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803f0c:	48 63 c6             	movslq %esi,%rax
  803f0f:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803f13:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f17:	8b 40 04             	mov    0x4(%rax),%eax
  803f1a:	8d 50 01             	lea    0x1(%rax),%edx
  803f1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f21:	89 50 04             	mov    %edx,0x4(%rax)
  803f24:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803f29:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f2d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803f31:	72 98                	jb     803ecb <devpipe_write+0x71>
  803f33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f37:	c9                   	leaveq 
  803f38:	c3                   	retq   

0000000000803f39 <devpipe_stat>:
  803f39:	55                   	push   %rbp
  803f3a:	48 89 e5             	mov    %rsp,%rbp
  803f3d:	48 83 ec 20          	sub    $0x20,%rsp
  803f41:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f45:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f4d:	48 89 c7             	mov    %rax,%rdi
  803f50:	48 b8 34 22 80 00 00 	movabs $0x802234,%rax
  803f57:	00 00 00 
  803f5a:	ff d0                	callq  *%rax
  803f5c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803f60:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f64:	48 be 8e 4f 80 00 00 	movabs $0x804f8e,%rsi
  803f6b:	00 00 00 
  803f6e:	48 89 c7             	mov    %rax,%rdi
  803f71:	48 b8 cd 0e 80 00 00 	movabs $0x800ecd,%rax
  803f78:	00 00 00 
  803f7b:	ff d0                	callq  *%rax
  803f7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f81:	8b 50 04             	mov    0x4(%rax),%edx
  803f84:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f88:	8b 00                	mov    (%rax),%eax
  803f8a:	29 c2                	sub    %eax,%edx
  803f8c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f90:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803f96:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f9a:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803fa1:	00 00 00 
  803fa4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fa8:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  803faf:	00 00 00 
  803fb2:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803fb9:	b8 00 00 00 00       	mov    $0x0,%eax
  803fbe:	c9                   	leaveq 
  803fbf:	c3                   	retq   

0000000000803fc0 <devpipe_close>:
  803fc0:	55                   	push   %rbp
  803fc1:	48 89 e5             	mov    %rsp,%rbp
  803fc4:	48 83 ec 10          	sub    $0x10,%rsp
  803fc8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803fcc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fd0:	48 89 c6             	mov    %rax,%rsi
  803fd3:	bf 00 00 00 00       	mov    $0x0,%edi
  803fd8:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  803fdf:	00 00 00 
  803fe2:	ff d0                	callq  *%rax
  803fe4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fe8:	48 89 c7             	mov    %rax,%rdi
  803feb:	48 b8 34 22 80 00 00 	movabs $0x802234,%rax
  803ff2:	00 00 00 
  803ff5:	ff d0                	callq  *%rax
  803ff7:	48 89 c6             	mov    %rax,%rsi
  803ffa:	bf 00 00 00 00       	mov    $0x0,%edi
  803fff:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  804006:	00 00 00 
  804009:	ff d0                	callq  *%rax
  80400b:	c9                   	leaveq 
  80400c:	c3                   	retq   

000000000080400d <cputchar>:
  80400d:	55                   	push   %rbp
  80400e:	48 89 e5             	mov    %rsp,%rbp
  804011:	48 83 ec 20          	sub    $0x20,%rsp
  804015:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804018:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80401b:	88 45 ff             	mov    %al,-0x1(%rbp)
  80401e:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804022:	be 01 00 00 00       	mov    $0x1,%esi
  804027:	48 89 c7             	mov    %rax,%rdi
  80402a:	48 b8 b5 16 80 00 00 	movabs $0x8016b5,%rax
  804031:	00 00 00 
  804034:	ff d0                	callq  *%rax
  804036:	90                   	nop
  804037:	c9                   	leaveq 
  804038:	c3                   	retq   

0000000000804039 <getchar>:
  804039:	55                   	push   %rbp
  80403a:	48 89 e5             	mov    %rsp,%rbp
  80403d:	48 83 ec 10          	sub    $0x10,%rsp
  804041:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804045:	ba 01 00 00 00       	mov    $0x1,%edx
  80404a:	48 89 c6             	mov    %rax,%rsi
  80404d:	bf 00 00 00 00       	mov    $0x0,%edi
  804052:	48 b8 2c 27 80 00 00 	movabs $0x80272c,%rax
  804059:	00 00 00 
  80405c:	ff d0                	callq  *%rax
  80405e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804061:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804065:	79 05                	jns    80406c <getchar+0x33>
  804067:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80406a:	eb 14                	jmp    804080 <getchar+0x47>
  80406c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804070:	7f 07                	jg     804079 <getchar+0x40>
  804072:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804077:	eb 07                	jmp    804080 <getchar+0x47>
  804079:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  80407d:	0f b6 c0             	movzbl %al,%eax
  804080:	c9                   	leaveq 
  804081:	c3                   	retq   

0000000000804082 <iscons>:
  804082:	55                   	push   %rbp
  804083:	48 89 e5             	mov    %rsp,%rbp
  804086:	48 83 ec 20          	sub    $0x20,%rsp
  80408a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80408d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  804091:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804094:	48 89 d6             	mov    %rdx,%rsi
  804097:	89 c7                	mov    %eax,%edi
  804099:	48 b8 f7 22 80 00 00 	movabs $0x8022f7,%rax
  8040a0:	00 00 00 
  8040a3:	ff d0                	callq  *%rax
  8040a5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040a8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040ac:	79 05                	jns    8040b3 <iscons+0x31>
  8040ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040b1:	eb 1a                	jmp    8040cd <iscons+0x4b>
  8040b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040b7:	8b 10                	mov    (%rax),%edx
  8040b9:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  8040c0:	00 00 00 
  8040c3:	8b 00                	mov    (%rax),%eax
  8040c5:	39 c2                	cmp    %eax,%edx
  8040c7:	0f 94 c0             	sete   %al
  8040ca:	0f b6 c0             	movzbl %al,%eax
  8040cd:	c9                   	leaveq 
  8040ce:	c3                   	retq   

00000000008040cf <opencons>:
  8040cf:	55                   	push   %rbp
  8040d0:	48 89 e5             	mov    %rsp,%rbp
  8040d3:	48 83 ec 10          	sub    $0x10,%rsp
  8040d7:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8040db:	48 89 c7             	mov    %rax,%rdi
  8040de:	48 b8 5f 22 80 00 00 	movabs $0x80225f,%rax
  8040e5:	00 00 00 
  8040e8:	ff d0                	callq  *%rax
  8040ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040f1:	79 05                	jns    8040f8 <opencons+0x29>
  8040f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040f6:	eb 5b                	jmp    804153 <opencons+0x84>
  8040f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040fc:	ba 07 04 00 00       	mov    $0x407,%edx
  804101:	48 89 c6             	mov    %rax,%rsi
  804104:	bf 00 00 00 00       	mov    $0x0,%edi
  804109:	48 b8 fd 17 80 00 00 	movabs $0x8017fd,%rax
  804110:	00 00 00 
  804113:	ff d0                	callq  *%rax
  804115:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804118:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80411c:	79 05                	jns    804123 <opencons+0x54>
  80411e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804121:	eb 30                	jmp    804153 <opencons+0x84>
  804123:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804127:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  80412e:	00 00 00 
  804131:	8b 12                	mov    (%rdx),%edx
  804133:	89 10                	mov    %edx,(%rax)
  804135:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804139:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804140:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804144:	48 89 c7             	mov    %rax,%rdi
  804147:	48 b8 11 22 80 00 00 	movabs $0x802211,%rax
  80414e:	00 00 00 
  804151:	ff d0                	callq  *%rax
  804153:	c9                   	leaveq 
  804154:	c3                   	retq   

0000000000804155 <devcons_read>:
  804155:	55                   	push   %rbp
  804156:	48 89 e5             	mov    %rsp,%rbp
  804159:	48 83 ec 30          	sub    $0x30,%rsp
  80415d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804161:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804165:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804169:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80416e:	75 13                	jne    804183 <devcons_read+0x2e>
  804170:	b8 00 00 00 00       	mov    $0x0,%eax
  804175:	eb 49                	jmp    8041c0 <devcons_read+0x6b>
  804177:	48 b8 c0 17 80 00 00 	movabs $0x8017c0,%rax
  80417e:	00 00 00 
  804181:	ff d0                	callq  *%rax
  804183:	48 b8 02 17 80 00 00 	movabs $0x801702,%rax
  80418a:	00 00 00 
  80418d:	ff d0                	callq  *%rax
  80418f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804192:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804196:	74 df                	je     804177 <devcons_read+0x22>
  804198:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80419c:	79 05                	jns    8041a3 <devcons_read+0x4e>
  80419e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041a1:	eb 1d                	jmp    8041c0 <devcons_read+0x6b>
  8041a3:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8041a7:	75 07                	jne    8041b0 <devcons_read+0x5b>
  8041a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8041ae:	eb 10                	jmp    8041c0 <devcons_read+0x6b>
  8041b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041b3:	89 c2                	mov    %eax,%edx
  8041b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041b9:	88 10                	mov    %dl,(%rax)
  8041bb:	b8 01 00 00 00       	mov    $0x1,%eax
  8041c0:	c9                   	leaveq 
  8041c1:	c3                   	retq   

00000000008041c2 <devcons_write>:
  8041c2:	55                   	push   %rbp
  8041c3:	48 89 e5             	mov    %rsp,%rbp
  8041c6:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8041cd:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8041d4:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8041db:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8041e2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8041e9:	eb 76                	jmp    804261 <devcons_write+0x9f>
  8041eb:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8041f2:	89 c2                	mov    %eax,%edx
  8041f4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041f7:	29 c2                	sub    %eax,%edx
  8041f9:	89 d0                	mov    %edx,%eax
  8041fb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8041fe:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804201:	83 f8 7f             	cmp    $0x7f,%eax
  804204:	76 07                	jbe    80420d <devcons_write+0x4b>
  804206:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80420d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804210:	48 63 d0             	movslq %eax,%rdx
  804213:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804216:	48 63 c8             	movslq %eax,%rcx
  804219:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804220:	48 01 c1             	add    %rax,%rcx
  804223:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80422a:	48 89 ce             	mov    %rcx,%rsi
  80422d:	48 89 c7             	mov    %rax,%rdi
  804230:	48 b8 f2 11 80 00 00 	movabs $0x8011f2,%rax
  804237:	00 00 00 
  80423a:	ff d0                	callq  *%rax
  80423c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80423f:	48 63 d0             	movslq %eax,%rdx
  804242:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804249:	48 89 d6             	mov    %rdx,%rsi
  80424c:	48 89 c7             	mov    %rax,%rdi
  80424f:	48 b8 b5 16 80 00 00 	movabs $0x8016b5,%rax
  804256:	00 00 00 
  804259:	ff d0                	callq  *%rax
  80425b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80425e:	01 45 fc             	add    %eax,-0x4(%rbp)
  804261:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804264:	48 98                	cltq   
  804266:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80426d:	0f 82 78 ff ff ff    	jb     8041eb <devcons_write+0x29>
  804273:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804276:	c9                   	leaveq 
  804277:	c3                   	retq   

0000000000804278 <devcons_close>:
  804278:	55                   	push   %rbp
  804279:	48 89 e5             	mov    %rsp,%rbp
  80427c:	48 83 ec 08          	sub    $0x8,%rsp
  804280:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804284:	b8 00 00 00 00       	mov    $0x0,%eax
  804289:	c9                   	leaveq 
  80428a:	c3                   	retq   

000000000080428b <devcons_stat>:
  80428b:	55                   	push   %rbp
  80428c:	48 89 e5             	mov    %rsp,%rbp
  80428f:	48 83 ec 10          	sub    $0x10,%rsp
  804293:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804297:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80429b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80429f:	48 be 9a 4f 80 00 00 	movabs $0x804f9a,%rsi
  8042a6:	00 00 00 
  8042a9:	48 89 c7             	mov    %rax,%rdi
  8042ac:	48 b8 cd 0e 80 00 00 	movabs $0x800ecd,%rax
  8042b3:	00 00 00 
  8042b6:	ff d0                	callq  *%rax
  8042b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8042bd:	c9                   	leaveq 
  8042be:	c3                   	retq   

00000000008042bf <_panic>:
  8042bf:	55                   	push   %rbp
  8042c0:	48 89 e5             	mov    %rsp,%rbp
  8042c3:	53                   	push   %rbx
  8042c4:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8042cb:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8042d2:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8042d8:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8042df:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8042e6:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8042ed:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8042f4:	84 c0                	test   %al,%al
  8042f6:	74 23                	je     80431b <_panic+0x5c>
  8042f8:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8042ff:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  804303:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  804307:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80430b:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80430f:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  804313:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  804317:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80431b:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  804322:	00 00 00 
  804325:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80432c:	00 00 00 
  80432f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  804333:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80433a:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  804341:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  804348:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80434f:	00 00 00 
  804352:	48 8b 18             	mov    (%rax),%rbx
  804355:	48 b8 84 17 80 00 00 	movabs $0x801784,%rax
  80435c:	00 00 00 
  80435f:	ff d0                	callq  *%rax
  804361:	89 c6                	mov    %eax,%esi
  804363:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  804369:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  804370:	41 89 d0             	mov    %edx,%r8d
  804373:	48 89 c1             	mov    %rax,%rcx
  804376:	48 89 da             	mov    %rbx,%rdx
  804379:	48 bf a8 4f 80 00 00 	movabs $0x804fa8,%rdi
  804380:	00 00 00 
  804383:	b8 00 00 00 00       	mov    $0x0,%eax
  804388:	49 b9 3d 03 80 00 00 	movabs $0x80033d,%r9
  80438f:	00 00 00 
  804392:	41 ff d1             	callq  *%r9
  804395:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80439c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8043a3:	48 89 d6             	mov    %rdx,%rsi
  8043a6:	48 89 c7             	mov    %rax,%rdi
  8043a9:	48 b8 91 02 80 00 00 	movabs $0x800291,%rax
  8043b0:	00 00 00 
  8043b3:	ff d0                	callq  *%rax
  8043b5:	48 bf cb 4f 80 00 00 	movabs $0x804fcb,%rdi
  8043bc:	00 00 00 
  8043bf:	b8 00 00 00 00       	mov    $0x0,%eax
  8043c4:	48 ba 3d 03 80 00 00 	movabs $0x80033d,%rdx
  8043cb:	00 00 00 
  8043ce:	ff d2                	callq  *%rdx
  8043d0:	cc                   	int3   
  8043d1:	eb fd                	jmp    8043d0 <_panic+0x111>

00000000008043d3 <set_pgfault_handler>:
  8043d3:	55                   	push   %rbp
  8043d4:	48 89 e5             	mov    %rsp,%rbp
  8043d7:	48 83 ec 20          	sub    $0x20,%rsp
  8043db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8043df:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8043e6:	00 00 00 
  8043e9:	48 8b 00             	mov    (%rax),%rax
  8043ec:	48 85 c0             	test   %rax,%rax
  8043ef:	75 6f                	jne    804460 <set_pgfault_handler+0x8d>
  8043f1:	ba 07 00 00 00       	mov    $0x7,%edx
  8043f6:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8043fb:	bf 00 00 00 00       	mov    $0x0,%edi
  804400:	48 b8 fd 17 80 00 00 	movabs $0x8017fd,%rax
  804407:	00 00 00 
  80440a:	ff d0                	callq  *%rax
  80440c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80440f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804413:	79 30                	jns    804445 <set_pgfault_handler+0x72>
  804415:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804418:	89 c1                	mov    %eax,%ecx
  80441a:	48 ba d0 4f 80 00 00 	movabs $0x804fd0,%rdx
  804421:	00 00 00 
  804424:	be 22 00 00 00       	mov    $0x22,%esi
  804429:	48 bf ef 4f 80 00 00 	movabs $0x804fef,%rdi
  804430:	00 00 00 
  804433:	b8 00 00 00 00       	mov    $0x0,%eax
  804438:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  80443f:	00 00 00 
  804442:	41 ff d0             	callq  *%r8
  804445:	48 be 74 44 80 00 00 	movabs $0x804474,%rsi
  80444c:	00 00 00 
  80444f:	bf 00 00 00 00       	mov    $0x0,%edi
  804454:	48 b8 94 19 80 00 00 	movabs $0x801994,%rax
  80445b:	00 00 00 
  80445e:	ff d0                	callq  *%rax
  804460:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804467:	00 00 00 
  80446a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80446e:	48 89 10             	mov    %rdx,(%rax)
  804471:	90                   	nop
  804472:	c9                   	leaveq 
  804473:	c3                   	retq   

0000000000804474 <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  804474:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804477:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  80447e:	00 00 00 
call *%rax
  804481:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  804483:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  80448a:	00 08 
    movq 152(%rsp), %rax
  80448c:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  804493:	00 
    movq 136(%rsp), %rbx
  804494:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  80449b:	00 
movq %rbx, (%rax)
  80449c:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  80449f:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  8044a3:	4c 8b 3c 24          	mov    (%rsp),%r15
  8044a7:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  8044ac:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  8044b1:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  8044b6:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  8044bb:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  8044c0:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  8044c5:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  8044ca:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  8044cf:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  8044d4:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  8044d9:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  8044de:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  8044e3:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  8044e8:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  8044ed:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  8044f1:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  8044f5:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  8044f6:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8044fb:	c3                   	retq   

00000000008044fc <ipc_recv>:
  8044fc:	55                   	push   %rbp
  8044fd:	48 89 e5             	mov    %rsp,%rbp
  804500:	48 83 ec 30          	sub    $0x30,%rsp
  804504:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804508:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80450c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804510:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804515:	75 0e                	jne    804525 <ipc_recv+0x29>
  804517:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80451e:	00 00 00 
  804521:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804525:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804529:	48 89 c7             	mov    %rax,%rdi
  80452c:	48 b8 37 1a 80 00 00 	movabs $0x801a37,%rax
  804533:	00 00 00 
  804536:	ff d0                	callq  *%rax
  804538:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80453b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80453f:	79 27                	jns    804568 <ipc_recv+0x6c>
  804541:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804546:	74 0a                	je     804552 <ipc_recv+0x56>
  804548:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80454c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804552:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804557:	74 0a                	je     804563 <ipc_recv+0x67>
  804559:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80455d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804563:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804566:	eb 53                	jmp    8045bb <ipc_recv+0xbf>
  804568:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80456d:	74 19                	je     804588 <ipc_recv+0x8c>
  80456f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804576:	00 00 00 
  804579:	48 8b 00             	mov    (%rax),%rax
  80457c:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804582:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804586:	89 10                	mov    %edx,(%rax)
  804588:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80458d:	74 19                	je     8045a8 <ipc_recv+0xac>
  80458f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804596:	00 00 00 
  804599:	48 8b 00             	mov    (%rax),%rax
  80459c:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8045a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8045a6:	89 10                	mov    %edx,(%rax)
  8045a8:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8045af:	00 00 00 
  8045b2:	48 8b 00             	mov    (%rax),%rax
  8045b5:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8045bb:	c9                   	leaveq 
  8045bc:	c3                   	retq   

00000000008045bd <ipc_send>:
  8045bd:	55                   	push   %rbp
  8045be:	48 89 e5             	mov    %rsp,%rbp
  8045c1:	48 83 ec 30          	sub    $0x30,%rsp
  8045c5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8045c8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8045cb:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8045cf:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8045d2:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8045d7:	75 1c                	jne    8045f5 <ipc_send+0x38>
  8045d9:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8045e0:	00 00 00 
  8045e3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8045e7:	eb 0c                	jmp    8045f5 <ipc_send+0x38>
  8045e9:	48 b8 c0 17 80 00 00 	movabs $0x8017c0,%rax
  8045f0:	00 00 00 
  8045f3:	ff d0                	callq  *%rax
  8045f5:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8045f8:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8045fb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8045ff:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804602:	89 c7                	mov    %eax,%edi
  804604:	48 b8 e0 19 80 00 00 	movabs $0x8019e0,%rax
  80460b:	00 00 00 
  80460e:	ff d0                	callq  *%rax
  804610:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804613:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804617:	74 d0                	je     8045e9 <ipc_send+0x2c>
  804619:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80461d:	79 30                	jns    80464f <ipc_send+0x92>
  80461f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804622:	89 c1                	mov    %eax,%ecx
  804624:	48 ba 00 50 80 00 00 	movabs $0x805000,%rdx
  80462b:	00 00 00 
  80462e:	be 44 00 00 00       	mov    $0x44,%esi
  804633:	48 bf 16 50 80 00 00 	movabs $0x805016,%rdi
  80463a:	00 00 00 
  80463d:	b8 00 00 00 00       	mov    $0x0,%eax
  804642:	49 b8 bf 42 80 00 00 	movabs $0x8042bf,%r8
  804649:	00 00 00 
  80464c:	41 ff d0             	callq  *%r8
  80464f:	90                   	nop
  804650:	c9                   	leaveq 
  804651:	c3                   	retq   

0000000000804652 <ipc_host_recv>:
  804652:	55                   	push   %rbp
  804653:	48 89 e5             	mov    %rsp,%rbp
  804656:	48 83 ec 10          	sub    $0x10,%rsp
  80465a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80465e:	48 ba 28 50 80 00 00 	movabs $0x805028,%rdx
  804665:	00 00 00 
  804668:	be 4e 00 00 00       	mov    $0x4e,%esi
  80466d:	48 bf 16 50 80 00 00 	movabs $0x805016,%rdi
  804674:	00 00 00 
  804677:	b8 00 00 00 00       	mov    $0x0,%eax
  80467c:	48 b9 bf 42 80 00 00 	movabs $0x8042bf,%rcx
  804683:	00 00 00 
  804686:	ff d1                	callq  *%rcx

0000000000804688 <ipc_host_send>:
  804688:	55                   	push   %rbp
  804689:	48 89 e5             	mov    %rsp,%rbp
  80468c:	48 83 ec 20          	sub    $0x20,%rsp
  804690:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804693:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804696:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  80469a:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80469d:	48 ba 48 50 80 00 00 	movabs $0x805048,%rdx
  8046a4:	00 00 00 
  8046a7:	be 58 00 00 00       	mov    $0x58,%esi
  8046ac:	48 bf 16 50 80 00 00 	movabs $0x805016,%rdi
  8046b3:	00 00 00 
  8046b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8046bb:	48 b9 bf 42 80 00 00 	movabs $0x8042bf,%rcx
  8046c2:	00 00 00 
  8046c5:	ff d1                	callq  *%rcx

00000000008046c7 <ipc_find_env>:
  8046c7:	55                   	push   %rbp
  8046c8:	48 89 e5             	mov    %rsp,%rbp
  8046cb:	48 83 ec 18          	sub    $0x18,%rsp
  8046cf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8046d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8046d9:	eb 4d                	jmp    804728 <ipc_find_env+0x61>
  8046db:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8046e2:	00 00 00 
  8046e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046e8:	48 98                	cltq   
  8046ea:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8046f1:	48 01 d0             	add    %rdx,%rax
  8046f4:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8046fa:	8b 00                	mov    (%rax),%eax
  8046fc:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8046ff:	75 23                	jne    804724 <ipc_find_env+0x5d>
  804701:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804708:	00 00 00 
  80470b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80470e:	48 98                	cltq   
  804710:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804717:	48 01 d0             	add    %rdx,%rax
  80471a:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804720:	8b 00                	mov    (%rax),%eax
  804722:	eb 12                	jmp    804736 <ipc_find_env+0x6f>
  804724:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804728:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80472f:	7e aa                	jle    8046db <ipc_find_env+0x14>
  804731:	b8 00 00 00 00       	mov    $0x0,%eax
  804736:	c9                   	leaveq 
  804737:	c3                   	retq   

0000000000804738 <pageref>:
  804738:	55                   	push   %rbp
  804739:	48 89 e5             	mov    %rsp,%rbp
  80473c:	48 83 ec 18          	sub    $0x18,%rsp
  804740:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804744:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804748:	48 c1 e8 15          	shr    $0x15,%rax
  80474c:	48 89 c2             	mov    %rax,%rdx
  80474f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804756:	01 00 00 
  804759:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80475d:	83 e0 01             	and    $0x1,%eax
  804760:	48 85 c0             	test   %rax,%rax
  804763:	75 07                	jne    80476c <pageref+0x34>
  804765:	b8 00 00 00 00       	mov    $0x0,%eax
  80476a:	eb 56                	jmp    8047c2 <pageref+0x8a>
  80476c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804770:	48 c1 e8 0c          	shr    $0xc,%rax
  804774:	48 89 c2             	mov    %rax,%rdx
  804777:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80477e:	01 00 00 
  804781:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804785:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804789:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80478d:	83 e0 01             	and    $0x1,%eax
  804790:	48 85 c0             	test   %rax,%rax
  804793:	75 07                	jne    80479c <pageref+0x64>
  804795:	b8 00 00 00 00       	mov    $0x0,%eax
  80479a:	eb 26                	jmp    8047c2 <pageref+0x8a>
  80479c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047a0:	48 c1 e8 0c          	shr    $0xc,%rax
  8047a4:	48 89 c2             	mov    %rax,%rdx
  8047a7:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8047ae:	00 00 00 
  8047b1:	48 c1 e2 04          	shl    $0x4,%rdx
  8047b5:	48 01 d0             	add    %rdx,%rax
  8047b8:	48 83 c0 08          	add    $0x8,%rax
  8047bc:	0f b7 00             	movzwl (%rax),%eax
  8047bf:	0f b7 c0             	movzwl %ax,%eax
  8047c2:	c9                   	leaveq 
  8047c3:	c3                   	retq   
