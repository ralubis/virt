
vmm/guest/obj/user/primespipe:     file format elf64-x86-64


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
  80003c:	e8 d7 03 00 00       	callq  800418 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <primeproc>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 30          	sub    $0x30,%rsp
  80004b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80004e:	48 8d 4d ec          	lea    -0x14(%rbp),%rcx
  800052:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800055:	ba 04 00 00 00       	mov    $0x4,%edx
  80005a:	48 89 ce             	mov    %rcx,%rsi
  80005d:	89 c7                	mov    %eax,%edi
  80005f:	48 b8 be 2b 80 00 00 	movabs $0x802bbe,%rax
  800066:	00 00 00 
  800069:	ff d0                	callq  *%rax
  80006b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80006e:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  800072:	74 42                	je     8000b6 <primeproc+0x73>
  800074:	b8 00 00 00 00       	mov    $0x0,%eax
  800079:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80007d:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  800081:	89 c2                	mov    %eax,%edx
  800083:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800086:	41 89 d0             	mov    %edx,%r8d
  800089:	89 c1                	mov    %eax,%ecx
  80008b:	48 ba 80 4a 80 00 00 	movabs $0x804a80,%rdx
  800092:	00 00 00 
  800095:	be 16 00 00 00       	mov    $0x16,%esi
  80009a:	48 bf af 4a 80 00 00 	movabs $0x804aaf,%rdi
  8000a1:	00 00 00 
  8000a4:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a9:	49 b9 c0 04 80 00 00 	movabs $0x8004c0,%r9
  8000b0:	00 00 00 
  8000b3:	41 ff d1             	callq  *%r9
  8000b6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8000b9:	89 c6                	mov    %eax,%esi
  8000bb:	48 bf c4 4a 80 00 00 	movabs $0x804ac4,%rdi
  8000c2:	00 00 00 
  8000c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8000ca:	48 ba fa 06 80 00 00 	movabs $0x8006fa,%rdx
  8000d1:	00 00 00 
  8000d4:	ff d2                	callq  *%rdx
  8000d6:	48 8d 45 e4          	lea    -0x1c(%rbp),%rax
  8000da:	48 89 c7             	mov    %rax,%rdi
  8000dd:	48 b8 0f 3e 80 00 00 	movabs $0x803e0f,%rax
  8000e4:	00 00 00 
  8000e7:	ff d0                	callq  *%rax
  8000e9:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8000ec:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8000ef:	85 c0                	test   %eax,%eax
  8000f1:	79 30                	jns    800123 <primeproc+0xe0>
  8000f3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8000f6:	89 c1                	mov    %eax,%ecx
  8000f8:	48 ba c8 4a 80 00 00 	movabs $0x804ac8,%rdx
  8000ff:	00 00 00 
  800102:	be 1c 00 00 00       	mov    $0x1c,%esi
  800107:	48 bf af 4a 80 00 00 	movabs $0x804aaf,%rdi
  80010e:	00 00 00 
  800111:	b8 00 00 00 00       	mov    $0x0,%eax
  800116:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  80011d:	00 00 00 
  800120:	41 ff d0             	callq  *%r8
  800123:	48 b8 57 23 80 00 00 	movabs $0x802357,%rax
  80012a:	00 00 00 
  80012d:	ff d0                	callq  *%rax
  80012f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800132:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800136:	79 30                	jns    800168 <primeproc+0x125>
  800138:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80013b:	89 c1                	mov    %eax,%ecx
  80013d:	48 ba d1 4a 80 00 00 	movabs $0x804ad1,%rdx
  800144:	00 00 00 
  800147:	be 1e 00 00 00       	mov    $0x1e,%esi
  80014c:	48 bf af 4a 80 00 00 	movabs $0x804aaf,%rdi
  800153:	00 00 00 
  800156:	b8 00 00 00 00       	mov    $0x0,%eax
  80015b:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  800162:	00 00 00 
  800165:	41 ff d0             	callq  *%r8
  800168:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80016c:	75 2d                	jne    80019b <primeproc+0x158>
  80016e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  800171:	89 c7                	mov    %eax,%edi
  800173:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  80017a:	00 00 00 
  80017d:	ff d0                	callq  *%rax
  80017f:	8b 45 e8             	mov    -0x18(%rbp),%eax
  800182:	89 c7                	mov    %eax,%edi
  800184:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  80018b:	00 00 00 
  80018e:	ff d0                	callq  *%rax
  800190:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800193:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800196:	e9 b3 fe ff ff       	jmpq   80004e <primeproc+0xb>
  80019b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80019e:	89 c7                	mov    %eax,%edi
  8001a0:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  8001a7:	00 00 00 
  8001aa:	ff d0                	callq  *%rax
  8001ac:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8001af:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8001b2:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
  8001b6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8001b9:	ba 04 00 00 00       	mov    $0x4,%edx
  8001be:	48 89 ce             	mov    %rcx,%rsi
  8001c1:	89 c7                	mov    %eax,%edi
  8001c3:	48 b8 be 2b 80 00 00 	movabs $0x802bbe,%rax
  8001ca:	00 00 00 
  8001cd:	ff d0                	callq  *%rax
  8001cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8001d2:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8001d6:	74 50                	je     800228 <primeproc+0x1e5>
  8001d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8001dd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8001e1:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  8001e5:	89 c2                	mov    %eax,%edx
  8001e7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8001ea:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8001ed:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8001f0:	48 83 ec 08          	sub    $0x8,%rsp
  8001f4:	52                   	push   %rdx
  8001f5:	41 89 f1             	mov    %esi,%r9d
  8001f8:	41 89 c8             	mov    %ecx,%r8d
  8001fb:	89 c1                	mov    %eax,%ecx
  8001fd:	48 ba da 4a 80 00 00 	movabs $0x804ada,%rdx
  800204:	00 00 00 
  800207:	be 2c 00 00 00       	mov    $0x2c,%esi
  80020c:	48 bf af 4a 80 00 00 	movabs $0x804aaf,%rdi
  800213:	00 00 00 
  800216:	b8 00 00 00 00       	mov    $0x0,%eax
  80021b:	49 ba c0 04 80 00 00 	movabs $0x8004c0,%r10
  800222:	00 00 00 
  800225:	41 ff d2             	callq  *%r10
  800228:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80022b:	8b 4d ec             	mov    -0x14(%rbp),%ecx
  80022e:	99                   	cltd   
  80022f:	f7 f9                	idiv   %ecx
  800231:	89 d0                	mov    %edx,%eax
  800233:	85 c0                	test   %eax,%eax
  800235:	0f 84 77 ff ff ff    	je     8001b2 <primeproc+0x16f>
  80023b:	48 8d 4d f0          	lea    -0x10(%rbp),%rcx
  80023f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800242:	ba 04 00 00 00       	mov    $0x4,%edx
  800247:	48 89 ce             	mov    %rcx,%rsi
  80024a:	89 c7                	mov    %eax,%edi
  80024c:	48 b8 34 2c 80 00 00 	movabs $0x802c34,%rax
  800253:	00 00 00 
  800256:	ff d0                	callq  *%rax
  800258:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80025b:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80025f:	0f 84 4d ff ff ff    	je     8001b2 <primeproc+0x16f>
  800265:	b8 00 00 00 00       	mov    $0x0,%eax
  80026a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80026e:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  800272:	89 c1                	mov    %eax,%ecx
  800274:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800277:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80027a:	41 89 c9             	mov    %ecx,%r9d
  80027d:	41 89 d0             	mov    %edx,%r8d
  800280:	89 c1                	mov    %eax,%ecx
  800282:	48 ba f6 4a 80 00 00 	movabs $0x804af6,%rdx
  800289:	00 00 00 
  80028c:	be 2f 00 00 00       	mov    $0x2f,%esi
  800291:	48 bf af 4a 80 00 00 	movabs $0x804aaf,%rdi
  800298:	00 00 00 
  80029b:	b8 00 00 00 00       	mov    $0x0,%eax
  8002a0:	49 ba c0 04 80 00 00 	movabs $0x8004c0,%r10
  8002a7:	00 00 00 
  8002aa:	41 ff d2             	callq  *%r10

00000000008002ad <umain>:
  8002ad:	55                   	push   %rbp
  8002ae:	48 89 e5             	mov    %rsp,%rbp
  8002b1:	48 83 ec 30          	sub    $0x30,%rsp
  8002b5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8002b8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8002bc:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8002c3:	00 00 00 
  8002c6:	48 b9 10 4b 80 00 00 	movabs $0x804b10,%rcx
  8002cd:	00 00 00 
  8002d0:	48 89 08             	mov    %rcx,(%rax)
  8002d3:	48 8d 45 ec          	lea    -0x14(%rbp),%rax
  8002d7:	48 89 c7             	mov    %rax,%rdi
  8002da:	48 b8 0f 3e 80 00 00 	movabs $0x803e0f,%rax
  8002e1:	00 00 00 
  8002e4:	ff d0                	callq  *%rax
  8002e6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8002e9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8002ec:	85 c0                	test   %eax,%eax
  8002ee:	79 30                	jns    800320 <umain+0x73>
  8002f0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8002f3:	89 c1                	mov    %eax,%ecx
  8002f5:	48 ba c8 4a 80 00 00 	movabs $0x804ac8,%rdx
  8002fc:	00 00 00 
  8002ff:	be 3b 00 00 00       	mov    $0x3b,%esi
  800304:	48 bf af 4a 80 00 00 	movabs $0x804aaf,%rdi
  80030b:	00 00 00 
  80030e:	b8 00 00 00 00       	mov    $0x0,%eax
  800313:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  80031a:	00 00 00 
  80031d:	41 ff d0             	callq  *%r8
  800320:	48 b8 57 23 80 00 00 	movabs $0x802357,%rax
  800327:	00 00 00 
  80032a:	ff d0                	callq  *%rax
  80032c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80032f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800333:	79 30                	jns    800365 <umain+0xb8>
  800335:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800338:	89 c1                	mov    %eax,%ecx
  80033a:	48 ba d1 4a 80 00 00 	movabs $0x804ad1,%rdx
  800341:	00 00 00 
  800344:	be 3f 00 00 00       	mov    $0x3f,%esi
  800349:	48 bf af 4a 80 00 00 	movabs $0x804aaf,%rdi
  800350:	00 00 00 
  800353:	b8 00 00 00 00       	mov    $0x0,%eax
  800358:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  80035f:	00 00 00 
  800362:	41 ff d0             	callq  *%r8
  800365:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800369:	75 22                	jne    80038d <umain+0xe0>
  80036b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80036e:	89 c7                	mov    %eax,%edi
  800370:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  800377:	00 00 00 
  80037a:	ff d0                	callq  *%rax
  80037c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80037f:	89 c7                	mov    %eax,%edi
  800381:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800388:	00 00 00 
  80038b:	ff d0                	callq  *%rax
  80038d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800390:	89 c7                	mov    %eax,%edi
  800392:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  800399:	00 00 00 
  80039c:	ff d0                	callq  *%rax
  80039e:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%rbp)
  8003a5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8003a8:	48 8d 4d f4          	lea    -0xc(%rbp),%rcx
  8003ac:	ba 04 00 00 00       	mov    $0x4,%edx
  8003b1:	48 89 ce             	mov    %rcx,%rsi
  8003b4:	89 c7                	mov    %eax,%edi
  8003b6:	48 b8 34 2c 80 00 00 	movabs $0x802c34,%rax
  8003bd:	00 00 00 
  8003c0:	ff d0                	callq  *%rax
  8003c2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8003c5:	83 7d f8 04          	cmpl   $0x4,-0x8(%rbp)
  8003c9:	74 42                	je     80040d <umain+0x160>
  8003cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8003d4:	0f 4e 45 f8          	cmovle -0x8(%rbp),%eax
  8003d8:	89 c2                	mov    %eax,%edx
  8003da:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8003dd:	41 89 d0             	mov    %edx,%r8d
  8003e0:	89 c1                	mov    %eax,%ecx
  8003e2:	48 ba 1b 4b 80 00 00 	movabs $0x804b1b,%rdx
  8003e9:	00 00 00 
  8003ec:	be 4b 00 00 00       	mov    $0x4b,%esi
  8003f1:	48 bf af 4a 80 00 00 	movabs $0x804aaf,%rdi
  8003f8:	00 00 00 
  8003fb:	b8 00 00 00 00       	mov    $0x0,%eax
  800400:	49 b9 c0 04 80 00 00 	movabs $0x8004c0,%r9
  800407:	00 00 00 
  80040a:	41 ff d1             	callq  *%r9
  80040d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800410:	83 c0 01             	add    $0x1,%eax
  800413:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800416:	eb 8d                	jmp    8003a5 <umain+0xf8>

0000000000800418 <libmain>:
  800418:	55                   	push   %rbp
  800419:	48 89 e5             	mov    %rsp,%rbp
  80041c:	48 83 ec 10          	sub    $0x10,%rsp
  800420:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800423:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800427:	48 b8 41 1b 80 00 00 	movabs $0x801b41,%rax
  80042e:	00 00 00 
  800431:	ff d0                	callq  *%rax
  800433:	25 ff 03 00 00       	and    $0x3ff,%eax
  800438:	48 98                	cltq   
  80043a:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800441:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800448:	00 00 00 
  80044b:	48 01 c2             	add    %rax,%rdx
  80044e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800455:	00 00 00 
  800458:	48 89 10             	mov    %rdx,(%rax)
  80045b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80045f:	7e 14                	jle    800475 <libmain+0x5d>
  800461:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800465:	48 8b 10             	mov    (%rax),%rdx
  800468:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80046f:	00 00 00 
  800472:	48 89 10             	mov    %rdx,(%rax)
  800475:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800479:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80047c:	48 89 d6             	mov    %rdx,%rsi
  80047f:	89 c7                	mov    %eax,%edi
  800481:	48 b8 ad 02 80 00 00 	movabs $0x8002ad,%rax
  800488:	00 00 00 
  80048b:	ff d0                	callq  *%rax
  80048d:	48 b8 9c 04 80 00 00 	movabs $0x80049c,%rax
  800494:	00 00 00 
  800497:	ff d0                	callq  *%rax
  800499:	90                   	nop
  80049a:	c9                   	leaveq 
  80049b:	c3                   	retq   

000000000080049c <exit>:
  80049c:	55                   	push   %rbp
  80049d:	48 89 e5             	mov    %rsp,%rbp
  8004a0:	48 b8 11 29 80 00 00 	movabs $0x802911,%rax
  8004a7:	00 00 00 
  8004aa:	ff d0                	callq  *%rax
  8004ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8004b1:	48 b8 fb 1a 80 00 00 	movabs $0x801afb,%rax
  8004b8:	00 00 00 
  8004bb:	ff d0                	callq  *%rax
  8004bd:	90                   	nop
  8004be:	5d                   	pop    %rbp
  8004bf:	c3                   	retq   

00000000008004c0 <_panic>:
  8004c0:	55                   	push   %rbp
  8004c1:	48 89 e5             	mov    %rsp,%rbp
  8004c4:	53                   	push   %rbx
  8004c5:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8004cc:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8004d3:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8004d9:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8004e0:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8004e7:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8004ee:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8004f5:	84 c0                	test   %al,%al
  8004f7:	74 23                	je     80051c <_panic+0x5c>
  8004f9:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800500:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800504:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800508:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80050c:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800510:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800514:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800518:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80051c:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800523:	00 00 00 
  800526:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80052d:	00 00 00 
  800530:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800534:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80053b:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800542:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800549:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800550:	00 00 00 
  800553:	48 8b 18             	mov    (%rax),%rbx
  800556:	48 b8 41 1b 80 00 00 	movabs $0x801b41,%rax
  80055d:	00 00 00 
  800560:	ff d0                	callq  *%rax
  800562:	89 c6                	mov    %eax,%esi
  800564:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  80056a:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800571:	41 89 d0             	mov    %edx,%r8d
  800574:	48 89 c1             	mov    %rax,%rcx
  800577:	48 89 da             	mov    %rbx,%rdx
  80057a:	48 bf 40 4b 80 00 00 	movabs $0x804b40,%rdi
  800581:	00 00 00 
  800584:	b8 00 00 00 00       	mov    $0x0,%eax
  800589:	49 b9 fa 06 80 00 00 	movabs $0x8006fa,%r9
  800590:	00 00 00 
  800593:	41 ff d1             	callq  *%r9
  800596:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80059d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005a4:	48 89 d6             	mov    %rdx,%rsi
  8005a7:	48 89 c7             	mov    %rax,%rdi
  8005aa:	48 b8 4e 06 80 00 00 	movabs $0x80064e,%rax
  8005b1:	00 00 00 
  8005b4:	ff d0                	callq  *%rax
  8005b6:	48 bf 63 4b 80 00 00 	movabs $0x804b63,%rdi
  8005bd:	00 00 00 
  8005c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8005c5:	48 ba fa 06 80 00 00 	movabs $0x8006fa,%rdx
  8005cc:	00 00 00 
  8005cf:	ff d2                	callq  *%rdx
  8005d1:	cc                   	int3   
  8005d2:	eb fd                	jmp    8005d1 <_panic+0x111>

00000000008005d4 <putch>:
  8005d4:	55                   	push   %rbp
  8005d5:	48 89 e5             	mov    %rsp,%rbp
  8005d8:	48 83 ec 10          	sub    $0x10,%rsp
  8005dc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8005df:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8005e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8005e7:	8b 00                	mov    (%rax),%eax
  8005e9:	8d 48 01             	lea    0x1(%rax),%ecx
  8005ec:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8005f0:	89 0a                	mov    %ecx,(%rdx)
  8005f2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8005f5:	89 d1                	mov    %edx,%ecx
  8005f7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8005fb:	48 98                	cltq   
  8005fd:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800601:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800605:	8b 00                	mov    (%rax),%eax
  800607:	3d ff 00 00 00       	cmp    $0xff,%eax
  80060c:	75 2c                	jne    80063a <putch+0x66>
  80060e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800612:	8b 00                	mov    (%rax),%eax
  800614:	48 98                	cltq   
  800616:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80061a:	48 83 c2 08          	add    $0x8,%rdx
  80061e:	48 89 c6             	mov    %rax,%rsi
  800621:	48 89 d7             	mov    %rdx,%rdi
  800624:	48 b8 72 1a 80 00 00 	movabs $0x801a72,%rax
  80062b:	00 00 00 
  80062e:	ff d0                	callq  *%rax
  800630:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800634:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80063a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80063e:	8b 40 04             	mov    0x4(%rax),%eax
  800641:	8d 50 01             	lea    0x1(%rax),%edx
  800644:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800648:	89 50 04             	mov    %edx,0x4(%rax)
  80064b:	90                   	nop
  80064c:	c9                   	leaveq 
  80064d:	c3                   	retq   

000000000080064e <vcprintf>:
  80064e:	55                   	push   %rbp
  80064f:	48 89 e5             	mov    %rsp,%rbp
  800652:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800659:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800660:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800667:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80066e:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800675:	48 8b 0a             	mov    (%rdx),%rcx
  800678:	48 89 08             	mov    %rcx,(%rax)
  80067b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80067f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800683:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800687:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80068b:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800692:	00 00 00 
  800695:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80069c:	00 00 00 
  80069f:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8006a6:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8006ad:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8006b4:	48 89 c6             	mov    %rax,%rsi
  8006b7:	48 bf d4 05 80 00 00 	movabs $0x8005d4,%rdi
  8006be:	00 00 00 
  8006c1:	48 b8 98 0a 80 00 00 	movabs $0x800a98,%rax
  8006c8:	00 00 00 
  8006cb:	ff d0                	callq  *%rax
  8006cd:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8006d3:	48 98                	cltq   
  8006d5:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8006dc:	48 83 c2 08          	add    $0x8,%rdx
  8006e0:	48 89 c6             	mov    %rax,%rsi
  8006e3:	48 89 d7             	mov    %rdx,%rdi
  8006e6:	48 b8 72 1a 80 00 00 	movabs $0x801a72,%rax
  8006ed:	00 00 00 
  8006f0:	ff d0                	callq  *%rax
  8006f2:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8006f8:	c9                   	leaveq 
  8006f9:	c3                   	retq   

00000000008006fa <cprintf>:
  8006fa:	55                   	push   %rbp
  8006fb:	48 89 e5             	mov    %rsp,%rbp
  8006fe:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800705:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80070c:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800713:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80071a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800721:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800728:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80072f:	84 c0                	test   %al,%al
  800731:	74 20                	je     800753 <cprintf+0x59>
  800733:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800737:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80073b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80073f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800743:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800747:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80074b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80074f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800753:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80075a:	00 00 00 
  80075d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800764:	00 00 00 
  800767:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80076b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800772:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800779:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800780:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800787:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80078e:	48 8b 0a             	mov    (%rdx),%rcx
  800791:	48 89 08             	mov    %rcx,(%rax)
  800794:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800798:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80079c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8007a0:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8007a4:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8007ab:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8007b2:	48 89 d6             	mov    %rdx,%rsi
  8007b5:	48 89 c7             	mov    %rax,%rdi
  8007b8:	48 b8 4e 06 80 00 00 	movabs $0x80064e,%rax
  8007bf:	00 00 00 
  8007c2:	ff d0                	callq  *%rax
  8007c4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8007ca:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8007d0:	c9                   	leaveq 
  8007d1:	c3                   	retq   

00000000008007d2 <printnum>:
  8007d2:	55                   	push   %rbp
  8007d3:	48 89 e5             	mov    %rsp,%rbp
  8007d6:	48 83 ec 30          	sub    $0x30,%rsp
  8007da:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8007de:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8007e2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8007e6:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  8007e9:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8007ed:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  8007f1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8007f4:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8007f8:	77 54                	ja     80084e <printnum+0x7c>
  8007fa:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8007fd:	8d 78 ff             	lea    -0x1(%rax),%edi
  800800:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800803:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800807:	ba 00 00 00 00       	mov    $0x0,%edx
  80080c:	48 f7 f6             	div    %rsi
  80080f:	49 89 c2             	mov    %rax,%r10
  800812:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800815:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800818:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80081c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800820:	41 89 c9             	mov    %ecx,%r9d
  800823:	41 89 f8             	mov    %edi,%r8d
  800826:	89 d1                	mov    %edx,%ecx
  800828:	4c 89 d2             	mov    %r10,%rdx
  80082b:	48 89 c7             	mov    %rax,%rdi
  80082e:	48 b8 d2 07 80 00 00 	movabs $0x8007d2,%rax
  800835:	00 00 00 
  800838:	ff d0                	callq  *%rax
  80083a:	eb 1c                	jmp    800858 <printnum+0x86>
  80083c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800840:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800843:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800847:	48 89 ce             	mov    %rcx,%rsi
  80084a:	89 d7                	mov    %edx,%edi
  80084c:	ff d0                	callq  *%rax
  80084e:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800852:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800856:	7f e4                	jg     80083c <printnum+0x6a>
  800858:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80085b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80085f:	ba 00 00 00 00       	mov    $0x0,%edx
  800864:	48 f7 f1             	div    %rcx
  800867:	48 b8 70 4d 80 00 00 	movabs $0x804d70,%rax
  80086e:	00 00 00 
  800871:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800875:	0f be d0             	movsbl %al,%edx
  800878:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80087c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800880:	48 89 ce             	mov    %rcx,%rsi
  800883:	89 d7                	mov    %edx,%edi
  800885:	ff d0                	callq  *%rax
  800887:	90                   	nop
  800888:	c9                   	leaveq 
  800889:	c3                   	retq   

000000000080088a <getuint>:
  80088a:	55                   	push   %rbp
  80088b:	48 89 e5             	mov    %rsp,%rbp
  80088e:	48 83 ec 20          	sub    $0x20,%rsp
  800892:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800896:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800899:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80089d:	7e 4f                	jle    8008ee <getuint+0x64>
  80089f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a3:	8b 00                	mov    (%rax),%eax
  8008a5:	83 f8 30             	cmp    $0x30,%eax
  8008a8:	73 24                	jae    8008ce <getuint+0x44>
  8008aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008ae:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8008b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008b6:	8b 00                	mov    (%rax),%eax
  8008b8:	89 c0                	mov    %eax,%eax
  8008ba:	48 01 d0             	add    %rdx,%rax
  8008bd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008c1:	8b 12                	mov    (%rdx),%edx
  8008c3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8008c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008ca:	89 0a                	mov    %ecx,(%rdx)
  8008cc:	eb 14                	jmp    8008e2 <getuint+0x58>
  8008ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008d2:	48 8b 40 08          	mov    0x8(%rax),%rax
  8008d6:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8008da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008de:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008e2:	48 8b 00             	mov    (%rax),%rax
  8008e5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008e9:	e9 9d 00 00 00       	jmpq   80098b <getuint+0x101>
  8008ee:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8008f2:	74 4c                	je     800940 <getuint+0xb6>
  8008f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008f8:	8b 00                	mov    (%rax),%eax
  8008fa:	83 f8 30             	cmp    $0x30,%eax
  8008fd:	73 24                	jae    800923 <getuint+0x99>
  8008ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800903:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800907:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80090b:	8b 00                	mov    (%rax),%eax
  80090d:	89 c0                	mov    %eax,%eax
  80090f:	48 01 d0             	add    %rdx,%rax
  800912:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800916:	8b 12                	mov    (%rdx),%edx
  800918:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80091b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80091f:	89 0a                	mov    %ecx,(%rdx)
  800921:	eb 14                	jmp    800937 <getuint+0xad>
  800923:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800927:	48 8b 40 08          	mov    0x8(%rax),%rax
  80092b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80092f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800933:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800937:	48 8b 00             	mov    (%rax),%rax
  80093a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80093e:	eb 4b                	jmp    80098b <getuint+0x101>
  800940:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800944:	8b 00                	mov    (%rax),%eax
  800946:	83 f8 30             	cmp    $0x30,%eax
  800949:	73 24                	jae    80096f <getuint+0xe5>
  80094b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80094f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800953:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800957:	8b 00                	mov    (%rax),%eax
  800959:	89 c0                	mov    %eax,%eax
  80095b:	48 01 d0             	add    %rdx,%rax
  80095e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800962:	8b 12                	mov    (%rdx),%edx
  800964:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800967:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80096b:	89 0a                	mov    %ecx,(%rdx)
  80096d:	eb 14                	jmp    800983 <getuint+0xf9>
  80096f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800973:	48 8b 40 08          	mov    0x8(%rax),%rax
  800977:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80097b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80097f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800983:	8b 00                	mov    (%rax),%eax
  800985:	89 c0                	mov    %eax,%eax
  800987:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80098b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80098f:	c9                   	leaveq 
  800990:	c3                   	retq   

0000000000800991 <getint>:
  800991:	55                   	push   %rbp
  800992:	48 89 e5             	mov    %rsp,%rbp
  800995:	48 83 ec 20          	sub    $0x20,%rsp
  800999:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80099d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8009a0:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8009a4:	7e 4f                	jle    8009f5 <getint+0x64>
  8009a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009aa:	8b 00                	mov    (%rax),%eax
  8009ac:	83 f8 30             	cmp    $0x30,%eax
  8009af:	73 24                	jae    8009d5 <getint+0x44>
  8009b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009bd:	8b 00                	mov    (%rax),%eax
  8009bf:	89 c0                	mov    %eax,%eax
  8009c1:	48 01 d0             	add    %rdx,%rax
  8009c4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009c8:	8b 12                	mov    (%rdx),%edx
  8009ca:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009d1:	89 0a                	mov    %ecx,(%rdx)
  8009d3:	eb 14                	jmp    8009e9 <getint+0x58>
  8009d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009d9:	48 8b 40 08          	mov    0x8(%rax),%rax
  8009dd:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8009e1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009e5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009e9:	48 8b 00             	mov    (%rax),%rax
  8009ec:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009f0:	e9 9d 00 00 00       	jmpq   800a92 <getint+0x101>
  8009f5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8009f9:	74 4c                	je     800a47 <getint+0xb6>
  8009fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009ff:	8b 00                	mov    (%rax),%eax
  800a01:	83 f8 30             	cmp    $0x30,%eax
  800a04:	73 24                	jae    800a2a <getint+0x99>
  800a06:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a0a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a0e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a12:	8b 00                	mov    (%rax),%eax
  800a14:	89 c0                	mov    %eax,%eax
  800a16:	48 01 d0             	add    %rdx,%rax
  800a19:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a1d:	8b 12                	mov    (%rdx),%edx
  800a1f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a22:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a26:	89 0a                	mov    %ecx,(%rdx)
  800a28:	eb 14                	jmp    800a3e <getint+0xad>
  800a2a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a2e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800a32:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800a36:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a3a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a3e:	48 8b 00             	mov    (%rax),%rax
  800a41:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a45:	eb 4b                	jmp    800a92 <getint+0x101>
  800a47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a4b:	8b 00                	mov    (%rax),%eax
  800a4d:	83 f8 30             	cmp    $0x30,%eax
  800a50:	73 24                	jae    800a76 <getint+0xe5>
  800a52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a56:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a5e:	8b 00                	mov    (%rax),%eax
  800a60:	89 c0                	mov    %eax,%eax
  800a62:	48 01 d0             	add    %rdx,%rax
  800a65:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a69:	8b 12                	mov    (%rdx),%edx
  800a6b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a6e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a72:	89 0a                	mov    %ecx,(%rdx)
  800a74:	eb 14                	jmp    800a8a <getint+0xf9>
  800a76:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a7a:	48 8b 40 08          	mov    0x8(%rax),%rax
  800a7e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800a82:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a86:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a8a:	8b 00                	mov    (%rax),%eax
  800a8c:	48 98                	cltq   
  800a8e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a92:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a96:	c9                   	leaveq 
  800a97:	c3                   	retq   

0000000000800a98 <vprintfmt>:
  800a98:	55                   	push   %rbp
  800a99:	48 89 e5             	mov    %rsp,%rbp
  800a9c:	41 54                	push   %r12
  800a9e:	53                   	push   %rbx
  800a9f:	48 83 ec 60          	sub    $0x60,%rsp
  800aa3:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800aa7:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800aab:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800aaf:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800ab3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ab7:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800abb:	48 8b 0a             	mov    (%rdx),%rcx
  800abe:	48 89 08             	mov    %rcx,(%rax)
  800ac1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ac5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ac9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800acd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ad1:	eb 17                	jmp    800aea <vprintfmt+0x52>
  800ad3:	85 db                	test   %ebx,%ebx
  800ad5:	0f 84 b9 04 00 00    	je     800f94 <vprintfmt+0x4fc>
  800adb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800adf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ae3:	48 89 d6             	mov    %rdx,%rsi
  800ae6:	89 df                	mov    %ebx,%edi
  800ae8:	ff d0                	callq  *%rax
  800aea:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800aee:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800af2:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800af6:	0f b6 00             	movzbl (%rax),%eax
  800af9:	0f b6 d8             	movzbl %al,%ebx
  800afc:	83 fb 25             	cmp    $0x25,%ebx
  800aff:	75 d2                	jne    800ad3 <vprintfmt+0x3b>
  800b01:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800b05:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800b0c:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800b13:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800b1a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800b21:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b25:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800b29:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800b2d:	0f b6 00             	movzbl (%rax),%eax
  800b30:	0f b6 d8             	movzbl %al,%ebx
  800b33:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800b36:	83 f8 55             	cmp    $0x55,%eax
  800b39:	0f 87 22 04 00 00    	ja     800f61 <vprintfmt+0x4c9>
  800b3f:	89 c0                	mov    %eax,%eax
  800b41:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800b48:	00 
  800b49:	48 b8 98 4d 80 00 00 	movabs $0x804d98,%rax
  800b50:	00 00 00 
  800b53:	48 01 d0             	add    %rdx,%rax
  800b56:	48 8b 00             	mov    (%rax),%rax
  800b59:	ff e0                	jmpq   *%rax
  800b5b:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800b5f:	eb c0                	jmp    800b21 <vprintfmt+0x89>
  800b61:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800b65:	eb ba                	jmp    800b21 <vprintfmt+0x89>
  800b67:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800b6e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800b71:	89 d0                	mov    %edx,%eax
  800b73:	c1 e0 02             	shl    $0x2,%eax
  800b76:	01 d0                	add    %edx,%eax
  800b78:	01 c0                	add    %eax,%eax
  800b7a:	01 d8                	add    %ebx,%eax
  800b7c:	83 e8 30             	sub    $0x30,%eax
  800b7f:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800b82:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800b86:	0f b6 00             	movzbl (%rax),%eax
  800b89:	0f be d8             	movsbl %al,%ebx
  800b8c:	83 fb 2f             	cmp    $0x2f,%ebx
  800b8f:	7e 60                	jle    800bf1 <vprintfmt+0x159>
  800b91:	83 fb 39             	cmp    $0x39,%ebx
  800b94:	7f 5b                	jg     800bf1 <vprintfmt+0x159>
  800b96:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800b9b:	eb d1                	jmp    800b6e <vprintfmt+0xd6>
  800b9d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ba0:	83 f8 30             	cmp    $0x30,%eax
  800ba3:	73 17                	jae    800bbc <vprintfmt+0x124>
  800ba5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ba9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bac:	89 d2                	mov    %edx,%edx
  800bae:	48 01 d0             	add    %rdx,%rax
  800bb1:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800bb4:	83 c2 08             	add    $0x8,%edx
  800bb7:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800bba:	eb 0c                	jmp    800bc8 <vprintfmt+0x130>
  800bbc:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800bc0:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800bc4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800bc8:	8b 00                	mov    (%rax),%eax
  800bca:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800bcd:	eb 23                	jmp    800bf2 <vprintfmt+0x15a>
  800bcf:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bd3:	0f 89 48 ff ff ff    	jns    800b21 <vprintfmt+0x89>
  800bd9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800be0:	e9 3c ff ff ff       	jmpq   800b21 <vprintfmt+0x89>
  800be5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800bec:	e9 30 ff ff ff       	jmpq   800b21 <vprintfmt+0x89>
  800bf1:	90                   	nop
  800bf2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bf6:	0f 89 25 ff ff ff    	jns    800b21 <vprintfmt+0x89>
  800bfc:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800bff:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800c02:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800c09:	e9 13 ff ff ff       	jmpq   800b21 <vprintfmt+0x89>
  800c0e:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800c12:	e9 0a ff ff ff       	jmpq   800b21 <vprintfmt+0x89>
  800c17:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c1a:	83 f8 30             	cmp    $0x30,%eax
  800c1d:	73 17                	jae    800c36 <vprintfmt+0x19e>
  800c1f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c23:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c26:	89 d2                	mov    %edx,%edx
  800c28:	48 01 d0             	add    %rdx,%rax
  800c2b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c2e:	83 c2 08             	add    $0x8,%edx
  800c31:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c34:	eb 0c                	jmp    800c42 <vprintfmt+0x1aa>
  800c36:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c3a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c3e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c42:	8b 10                	mov    (%rax),%edx
  800c44:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800c48:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c4c:	48 89 ce             	mov    %rcx,%rsi
  800c4f:	89 d7                	mov    %edx,%edi
  800c51:	ff d0                	callq  *%rax
  800c53:	e9 37 03 00 00       	jmpq   800f8f <vprintfmt+0x4f7>
  800c58:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c5b:	83 f8 30             	cmp    $0x30,%eax
  800c5e:	73 17                	jae    800c77 <vprintfmt+0x1df>
  800c60:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c64:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c67:	89 d2                	mov    %edx,%edx
  800c69:	48 01 d0             	add    %rdx,%rax
  800c6c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c6f:	83 c2 08             	add    $0x8,%edx
  800c72:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c75:	eb 0c                	jmp    800c83 <vprintfmt+0x1eb>
  800c77:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c7b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c7f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800c83:	8b 18                	mov    (%rax),%ebx
  800c85:	85 db                	test   %ebx,%ebx
  800c87:	79 02                	jns    800c8b <vprintfmt+0x1f3>
  800c89:	f7 db                	neg    %ebx
  800c8b:	83 fb 15             	cmp    $0x15,%ebx
  800c8e:	7f 16                	jg     800ca6 <vprintfmt+0x20e>
  800c90:	48 b8 c0 4c 80 00 00 	movabs $0x804cc0,%rax
  800c97:	00 00 00 
  800c9a:	48 63 d3             	movslq %ebx,%rdx
  800c9d:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800ca1:	4d 85 e4             	test   %r12,%r12
  800ca4:	75 2e                	jne    800cd4 <vprintfmt+0x23c>
  800ca6:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800caa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cae:	89 d9                	mov    %ebx,%ecx
  800cb0:	48 ba 81 4d 80 00 00 	movabs $0x804d81,%rdx
  800cb7:	00 00 00 
  800cba:	48 89 c7             	mov    %rax,%rdi
  800cbd:	b8 00 00 00 00       	mov    $0x0,%eax
  800cc2:	49 b8 9e 0f 80 00 00 	movabs $0x800f9e,%r8
  800cc9:	00 00 00 
  800ccc:	41 ff d0             	callq  *%r8
  800ccf:	e9 bb 02 00 00       	jmpq   800f8f <vprintfmt+0x4f7>
  800cd4:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800cd8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cdc:	4c 89 e1             	mov    %r12,%rcx
  800cdf:	48 ba 8a 4d 80 00 00 	movabs $0x804d8a,%rdx
  800ce6:	00 00 00 
  800ce9:	48 89 c7             	mov    %rax,%rdi
  800cec:	b8 00 00 00 00       	mov    $0x0,%eax
  800cf1:	49 b8 9e 0f 80 00 00 	movabs $0x800f9e,%r8
  800cf8:	00 00 00 
  800cfb:	41 ff d0             	callq  *%r8
  800cfe:	e9 8c 02 00 00       	jmpq   800f8f <vprintfmt+0x4f7>
  800d03:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d06:	83 f8 30             	cmp    $0x30,%eax
  800d09:	73 17                	jae    800d22 <vprintfmt+0x28a>
  800d0b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d0f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d12:	89 d2                	mov    %edx,%edx
  800d14:	48 01 d0             	add    %rdx,%rax
  800d17:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d1a:	83 c2 08             	add    $0x8,%edx
  800d1d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d20:	eb 0c                	jmp    800d2e <vprintfmt+0x296>
  800d22:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d26:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d2a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d2e:	4c 8b 20             	mov    (%rax),%r12
  800d31:	4d 85 e4             	test   %r12,%r12
  800d34:	75 0a                	jne    800d40 <vprintfmt+0x2a8>
  800d36:	49 bc 8d 4d 80 00 00 	movabs $0x804d8d,%r12
  800d3d:	00 00 00 
  800d40:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d44:	7e 78                	jle    800dbe <vprintfmt+0x326>
  800d46:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800d4a:	74 72                	je     800dbe <vprintfmt+0x326>
  800d4c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800d4f:	48 98                	cltq   
  800d51:	48 89 c6             	mov    %rax,%rsi
  800d54:	4c 89 e7             	mov    %r12,%rdi
  800d57:	48 b8 4c 12 80 00 00 	movabs $0x80124c,%rax
  800d5e:	00 00 00 
  800d61:	ff d0                	callq  *%rax
  800d63:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800d66:	eb 17                	jmp    800d7f <vprintfmt+0x2e7>
  800d68:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800d6c:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800d70:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d74:	48 89 ce             	mov    %rcx,%rsi
  800d77:	89 d7                	mov    %edx,%edi
  800d79:	ff d0                	callq  *%rax
  800d7b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800d7f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800d83:	7f e3                	jg     800d68 <vprintfmt+0x2d0>
  800d85:	eb 37                	jmp    800dbe <vprintfmt+0x326>
  800d87:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800d8b:	74 1e                	je     800dab <vprintfmt+0x313>
  800d8d:	83 fb 1f             	cmp    $0x1f,%ebx
  800d90:	7e 05                	jle    800d97 <vprintfmt+0x2ff>
  800d92:	83 fb 7e             	cmp    $0x7e,%ebx
  800d95:	7e 14                	jle    800dab <vprintfmt+0x313>
  800d97:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d9b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d9f:	48 89 d6             	mov    %rdx,%rsi
  800da2:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800da7:	ff d0                	callq  *%rax
  800da9:	eb 0f                	jmp    800dba <vprintfmt+0x322>
  800dab:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800daf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800db3:	48 89 d6             	mov    %rdx,%rsi
  800db6:	89 df                	mov    %ebx,%edi
  800db8:	ff d0                	callq  *%rax
  800dba:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800dbe:	4c 89 e0             	mov    %r12,%rax
  800dc1:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800dc5:	0f b6 00             	movzbl (%rax),%eax
  800dc8:	0f be d8             	movsbl %al,%ebx
  800dcb:	85 db                	test   %ebx,%ebx
  800dcd:	74 28                	je     800df7 <vprintfmt+0x35f>
  800dcf:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800dd3:	78 b2                	js     800d87 <vprintfmt+0x2ef>
  800dd5:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800dd9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800ddd:	79 a8                	jns    800d87 <vprintfmt+0x2ef>
  800ddf:	eb 16                	jmp    800df7 <vprintfmt+0x35f>
  800de1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800de5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800de9:	48 89 d6             	mov    %rdx,%rsi
  800dec:	bf 20 00 00 00       	mov    $0x20,%edi
  800df1:	ff d0                	callq  *%rax
  800df3:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800df7:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800dfb:	7f e4                	jg     800de1 <vprintfmt+0x349>
  800dfd:	e9 8d 01 00 00       	jmpq   800f8f <vprintfmt+0x4f7>
  800e02:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e06:	be 03 00 00 00       	mov    $0x3,%esi
  800e0b:	48 89 c7             	mov    %rax,%rdi
  800e0e:	48 b8 91 09 80 00 00 	movabs $0x800991,%rax
  800e15:	00 00 00 
  800e18:	ff d0                	callq  *%rax
  800e1a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e1e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e22:	48 85 c0             	test   %rax,%rax
  800e25:	79 1d                	jns    800e44 <vprintfmt+0x3ac>
  800e27:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e2b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e2f:	48 89 d6             	mov    %rdx,%rsi
  800e32:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800e37:	ff d0                	callq  *%rax
  800e39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e3d:	48 f7 d8             	neg    %rax
  800e40:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e44:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800e4b:	e9 d2 00 00 00       	jmpq   800f22 <vprintfmt+0x48a>
  800e50:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e54:	be 03 00 00 00       	mov    $0x3,%esi
  800e59:	48 89 c7             	mov    %rax,%rdi
  800e5c:	48 b8 8a 08 80 00 00 	movabs $0x80088a,%rax
  800e63:	00 00 00 
  800e66:	ff d0                	callq  *%rax
  800e68:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e6c:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800e73:	e9 aa 00 00 00       	jmpq   800f22 <vprintfmt+0x48a>
  800e78:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800e7c:	be 03 00 00 00       	mov    $0x3,%esi
  800e81:	48 89 c7             	mov    %rax,%rdi
  800e84:	48 b8 8a 08 80 00 00 	movabs $0x80088a,%rax
  800e8b:	00 00 00 
  800e8e:	ff d0                	callq  *%rax
  800e90:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800e94:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800e9b:	e9 82 00 00 00       	jmpq   800f22 <vprintfmt+0x48a>
  800ea0:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ea4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ea8:	48 89 d6             	mov    %rdx,%rsi
  800eab:	bf 30 00 00 00       	mov    $0x30,%edi
  800eb0:	ff d0                	callq  *%rax
  800eb2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800eb6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800eba:	48 89 d6             	mov    %rdx,%rsi
  800ebd:	bf 78 00 00 00       	mov    $0x78,%edi
  800ec2:	ff d0                	callq  *%rax
  800ec4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ec7:	83 f8 30             	cmp    $0x30,%eax
  800eca:	73 17                	jae    800ee3 <vprintfmt+0x44b>
  800ecc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ed0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ed3:	89 d2                	mov    %edx,%edx
  800ed5:	48 01 d0             	add    %rdx,%rax
  800ed8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800edb:	83 c2 08             	add    $0x8,%edx
  800ede:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ee1:	eb 0c                	jmp    800eef <vprintfmt+0x457>
  800ee3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800ee7:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800eeb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800eef:	48 8b 00             	mov    (%rax),%rax
  800ef2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ef6:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800efd:	eb 23                	jmp    800f22 <vprintfmt+0x48a>
  800eff:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f03:	be 03 00 00 00       	mov    $0x3,%esi
  800f08:	48 89 c7             	mov    %rax,%rdi
  800f0b:	48 b8 8a 08 80 00 00 	movabs $0x80088a,%rax
  800f12:	00 00 00 
  800f15:	ff d0                	callq  *%rax
  800f17:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f1b:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800f22:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800f27:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800f2a:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800f2d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f31:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800f35:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f39:	45 89 c1             	mov    %r8d,%r9d
  800f3c:	41 89 f8             	mov    %edi,%r8d
  800f3f:	48 89 c7             	mov    %rax,%rdi
  800f42:	48 b8 d2 07 80 00 00 	movabs $0x8007d2,%rax
  800f49:	00 00 00 
  800f4c:	ff d0                	callq  *%rax
  800f4e:	eb 3f                	jmp    800f8f <vprintfmt+0x4f7>
  800f50:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f54:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f58:	48 89 d6             	mov    %rdx,%rsi
  800f5b:	89 df                	mov    %ebx,%edi
  800f5d:	ff d0                	callq  *%rax
  800f5f:	eb 2e                	jmp    800f8f <vprintfmt+0x4f7>
  800f61:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f65:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f69:	48 89 d6             	mov    %rdx,%rsi
  800f6c:	bf 25 00 00 00       	mov    $0x25,%edi
  800f71:	ff d0                	callq  *%rax
  800f73:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800f78:	eb 05                	jmp    800f7f <vprintfmt+0x4e7>
  800f7a:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800f7f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800f83:	48 83 e8 01          	sub    $0x1,%rax
  800f87:	0f b6 00             	movzbl (%rax),%eax
  800f8a:	3c 25                	cmp    $0x25,%al
  800f8c:	75 ec                	jne    800f7a <vprintfmt+0x4e2>
  800f8e:	90                   	nop
  800f8f:	e9 3d fb ff ff       	jmpq   800ad1 <vprintfmt+0x39>
  800f94:	90                   	nop
  800f95:	48 83 c4 60          	add    $0x60,%rsp
  800f99:	5b                   	pop    %rbx
  800f9a:	41 5c                	pop    %r12
  800f9c:	5d                   	pop    %rbp
  800f9d:	c3                   	retq   

0000000000800f9e <printfmt>:
  800f9e:	55                   	push   %rbp
  800f9f:	48 89 e5             	mov    %rsp,%rbp
  800fa2:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800fa9:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800fb0:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800fb7:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800fbe:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800fc5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800fcc:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800fd3:	84 c0                	test   %al,%al
  800fd5:	74 20                	je     800ff7 <printfmt+0x59>
  800fd7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800fdb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800fdf:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800fe3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800fe7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800feb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800fef:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800ff3:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800ff7:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800ffe:	00 00 00 
  801001:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  801008:	00 00 00 
  80100b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80100f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801016:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80101d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801024:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80102b:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801032:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  801039:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801040:	48 89 c7             	mov    %rax,%rdi
  801043:	48 b8 98 0a 80 00 00 	movabs $0x800a98,%rax
  80104a:	00 00 00 
  80104d:	ff d0                	callq  *%rax
  80104f:	90                   	nop
  801050:	c9                   	leaveq 
  801051:	c3                   	retq   

0000000000801052 <sprintputch>:
  801052:	55                   	push   %rbp
  801053:	48 89 e5             	mov    %rsp,%rbp
  801056:	48 83 ec 10          	sub    $0x10,%rsp
  80105a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80105d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801061:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801065:	8b 40 10             	mov    0x10(%rax),%eax
  801068:	8d 50 01             	lea    0x1(%rax),%edx
  80106b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80106f:	89 50 10             	mov    %edx,0x10(%rax)
  801072:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801076:	48 8b 10             	mov    (%rax),%rdx
  801079:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80107d:	48 8b 40 08          	mov    0x8(%rax),%rax
  801081:	48 39 c2             	cmp    %rax,%rdx
  801084:	73 17                	jae    80109d <sprintputch+0x4b>
  801086:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80108a:	48 8b 00             	mov    (%rax),%rax
  80108d:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801091:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801095:	48 89 0a             	mov    %rcx,(%rdx)
  801098:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80109b:	88 10                	mov    %dl,(%rax)
  80109d:	90                   	nop
  80109e:	c9                   	leaveq 
  80109f:	c3                   	retq   

00000000008010a0 <vsnprintf>:
  8010a0:	55                   	push   %rbp
  8010a1:	48 89 e5             	mov    %rsp,%rbp
  8010a4:	48 83 ec 50          	sub    $0x50,%rsp
  8010a8:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8010ac:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8010af:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8010b3:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8010b7:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8010bb:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8010bf:	48 8b 0a             	mov    (%rdx),%rcx
  8010c2:	48 89 08             	mov    %rcx,(%rax)
  8010c5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8010c9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8010cd:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8010d1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8010d5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8010d9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8010dd:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  8010e0:	48 98                	cltq   
  8010e2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8010e6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8010ea:	48 01 d0             	add    %rdx,%rax
  8010ed:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8010f1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8010f8:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  8010fd:	74 06                	je     801105 <vsnprintf+0x65>
  8010ff:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801103:	7f 07                	jg     80110c <vsnprintf+0x6c>
  801105:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80110a:	eb 2f                	jmp    80113b <vsnprintf+0x9b>
  80110c:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801110:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801114:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  801118:	48 89 c6             	mov    %rax,%rsi
  80111b:	48 bf 52 10 80 00 00 	movabs $0x801052,%rdi
  801122:	00 00 00 
  801125:	48 b8 98 0a 80 00 00 	movabs $0x800a98,%rax
  80112c:	00 00 00 
  80112f:	ff d0                	callq  *%rax
  801131:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801135:	c6 00 00             	movb   $0x0,(%rax)
  801138:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80113b:	c9                   	leaveq 
  80113c:	c3                   	retq   

000000000080113d <snprintf>:
  80113d:	55                   	push   %rbp
  80113e:	48 89 e5             	mov    %rsp,%rbp
  801141:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  801148:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80114f:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801155:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  80115c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801163:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80116a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801171:	84 c0                	test   %al,%al
  801173:	74 20                	je     801195 <snprintf+0x58>
  801175:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  801179:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80117d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801181:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801185:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  801189:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80118d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801191:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801195:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80119c:	00 00 00 
  80119f:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8011a6:	00 00 00 
  8011a9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8011ad:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8011b4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8011bb:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8011c2:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8011c9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8011d0:	48 8b 0a             	mov    (%rdx),%rcx
  8011d3:	48 89 08             	mov    %rcx,(%rax)
  8011d6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8011da:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8011de:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8011e2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8011e6:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  8011ed:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  8011f4:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  8011fa:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801201:	48 89 c7             	mov    %rax,%rdi
  801204:	48 b8 a0 10 80 00 00 	movabs $0x8010a0,%rax
  80120b:	00 00 00 
  80120e:	ff d0                	callq  *%rax
  801210:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801216:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80121c:	c9                   	leaveq 
  80121d:	c3                   	retq   

000000000080121e <strlen>:
  80121e:	55                   	push   %rbp
  80121f:	48 89 e5             	mov    %rsp,%rbp
  801222:	48 83 ec 18          	sub    $0x18,%rsp
  801226:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80122a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801231:	eb 09                	jmp    80123c <strlen+0x1e>
  801233:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801237:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80123c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801240:	0f b6 00             	movzbl (%rax),%eax
  801243:	84 c0                	test   %al,%al
  801245:	75 ec                	jne    801233 <strlen+0x15>
  801247:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80124a:	c9                   	leaveq 
  80124b:	c3                   	retq   

000000000080124c <strnlen>:
  80124c:	55                   	push   %rbp
  80124d:	48 89 e5             	mov    %rsp,%rbp
  801250:	48 83 ec 20          	sub    $0x20,%rsp
  801254:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801258:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80125c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801263:	eb 0e                	jmp    801273 <strnlen+0x27>
  801265:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801269:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80126e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801273:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801278:	74 0b                	je     801285 <strnlen+0x39>
  80127a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80127e:	0f b6 00             	movzbl (%rax),%eax
  801281:	84 c0                	test   %al,%al
  801283:	75 e0                	jne    801265 <strnlen+0x19>
  801285:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801288:	c9                   	leaveq 
  801289:	c3                   	retq   

000000000080128a <strcpy>:
  80128a:	55                   	push   %rbp
  80128b:	48 89 e5             	mov    %rsp,%rbp
  80128e:	48 83 ec 20          	sub    $0x20,%rsp
  801292:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801296:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80129a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80129e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8012a2:	90                   	nop
  8012a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012a7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8012ab:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012af:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8012b3:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8012b7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8012bb:	0f b6 12             	movzbl (%rdx),%edx
  8012be:	88 10                	mov    %dl,(%rax)
  8012c0:	0f b6 00             	movzbl (%rax),%eax
  8012c3:	84 c0                	test   %al,%al
  8012c5:	75 dc                	jne    8012a3 <strcpy+0x19>
  8012c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012cb:	c9                   	leaveq 
  8012cc:	c3                   	retq   

00000000008012cd <strcat>:
  8012cd:	55                   	push   %rbp
  8012ce:	48 89 e5             	mov    %rsp,%rbp
  8012d1:	48 83 ec 20          	sub    $0x20,%rsp
  8012d5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012d9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8012dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012e1:	48 89 c7             	mov    %rax,%rdi
  8012e4:	48 b8 1e 12 80 00 00 	movabs $0x80121e,%rax
  8012eb:	00 00 00 
  8012ee:	ff d0                	callq  *%rax
  8012f0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8012f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8012f6:	48 63 d0             	movslq %eax,%rdx
  8012f9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8012fd:	48 01 c2             	add    %rax,%rdx
  801300:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801304:	48 89 c6             	mov    %rax,%rsi
  801307:	48 89 d7             	mov    %rdx,%rdi
  80130a:	48 b8 8a 12 80 00 00 	movabs $0x80128a,%rax
  801311:	00 00 00 
  801314:	ff d0                	callq  *%rax
  801316:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80131a:	c9                   	leaveq 
  80131b:	c3                   	retq   

000000000080131c <strncpy>:
  80131c:	55                   	push   %rbp
  80131d:	48 89 e5             	mov    %rsp,%rbp
  801320:	48 83 ec 28          	sub    $0x28,%rsp
  801324:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801328:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80132c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801330:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801334:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801338:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80133f:	00 
  801340:	eb 2a                	jmp    80136c <strncpy+0x50>
  801342:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801346:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80134a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80134e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801352:	0f b6 12             	movzbl (%rdx),%edx
  801355:	88 10                	mov    %dl,(%rax)
  801357:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80135b:	0f b6 00             	movzbl (%rax),%eax
  80135e:	84 c0                	test   %al,%al
  801360:	74 05                	je     801367 <strncpy+0x4b>
  801362:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801367:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80136c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801370:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801374:	72 cc                	jb     801342 <strncpy+0x26>
  801376:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80137a:	c9                   	leaveq 
  80137b:	c3                   	retq   

000000000080137c <strlcpy>:
  80137c:	55                   	push   %rbp
  80137d:	48 89 e5             	mov    %rsp,%rbp
  801380:	48 83 ec 28          	sub    $0x28,%rsp
  801384:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801388:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80138c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801390:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801394:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801398:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80139d:	74 3d                	je     8013dc <strlcpy+0x60>
  80139f:	eb 1d                	jmp    8013be <strlcpy+0x42>
  8013a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013a5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8013a9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013ad:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8013b1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8013b5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8013b9:	0f b6 12             	movzbl (%rdx),%edx
  8013bc:	88 10                	mov    %dl,(%rax)
  8013be:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8013c3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8013c8:	74 0b                	je     8013d5 <strlcpy+0x59>
  8013ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013ce:	0f b6 00             	movzbl (%rax),%eax
  8013d1:	84 c0                	test   %al,%al
  8013d3:	75 cc                	jne    8013a1 <strlcpy+0x25>
  8013d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013d9:	c6 00 00             	movb   $0x0,(%rax)
  8013dc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8013e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013e4:	48 29 c2             	sub    %rax,%rdx
  8013e7:	48 89 d0             	mov    %rdx,%rax
  8013ea:	c9                   	leaveq 
  8013eb:	c3                   	retq   

00000000008013ec <strcmp>:
  8013ec:	55                   	push   %rbp
  8013ed:	48 89 e5             	mov    %rsp,%rbp
  8013f0:	48 83 ec 10          	sub    $0x10,%rsp
  8013f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8013f8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8013fc:	eb 0a                	jmp    801408 <strcmp+0x1c>
  8013fe:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801403:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801408:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80140c:	0f b6 00             	movzbl (%rax),%eax
  80140f:	84 c0                	test   %al,%al
  801411:	74 12                	je     801425 <strcmp+0x39>
  801413:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801417:	0f b6 10             	movzbl (%rax),%edx
  80141a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80141e:	0f b6 00             	movzbl (%rax),%eax
  801421:	38 c2                	cmp    %al,%dl
  801423:	74 d9                	je     8013fe <strcmp+0x12>
  801425:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801429:	0f b6 00             	movzbl (%rax),%eax
  80142c:	0f b6 d0             	movzbl %al,%edx
  80142f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801433:	0f b6 00             	movzbl (%rax),%eax
  801436:	0f b6 c0             	movzbl %al,%eax
  801439:	29 c2                	sub    %eax,%edx
  80143b:	89 d0                	mov    %edx,%eax
  80143d:	c9                   	leaveq 
  80143e:	c3                   	retq   

000000000080143f <strncmp>:
  80143f:	55                   	push   %rbp
  801440:	48 89 e5             	mov    %rsp,%rbp
  801443:	48 83 ec 18          	sub    $0x18,%rsp
  801447:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80144b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80144f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801453:	eb 0f                	jmp    801464 <strncmp+0x25>
  801455:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80145a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80145f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801464:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801469:	74 1d                	je     801488 <strncmp+0x49>
  80146b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80146f:	0f b6 00             	movzbl (%rax),%eax
  801472:	84 c0                	test   %al,%al
  801474:	74 12                	je     801488 <strncmp+0x49>
  801476:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80147a:	0f b6 10             	movzbl (%rax),%edx
  80147d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801481:	0f b6 00             	movzbl (%rax),%eax
  801484:	38 c2                	cmp    %al,%dl
  801486:	74 cd                	je     801455 <strncmp+0x16>
  801488:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80148d:	75 07                	jne    801496 <strncmp+0x57>
  80148f:	b8 00 00 00 00       	mov    $0x0,%eax
  801494:	eb 18                	jmp    8014ae <strncmp+0x6f>
  801496:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80149a:	0f b6 00             	movzbl (%rax),%eax
  80149d:	0f b6 d0             	movzbl %al,%edx
  8014a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014a4:	0f b6 00             	movzbl (%rax),%eax
  8014a7:	0f b6 c0             	movzbl %al,%eax
  8014aa:	29 c2                	sub    %eax,%edx
  8014ac:	89 d0                	mov    %edx,%eax
  8014ae:	c9                   	leaveq 
  8014af:	c3                   	retq   

00000000008014b0 <strchr>:
  8014b0:	55                   	push   %rbp
  8014b1:	48 89 e5             	mov    %rsp,%rbp
  8014b4:	48 83 ec 10          	sub    $0x10,%rsp
  8014b8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014bc:	89 f0                	mov    %esi,%eax
  8014be:	88 45 f4             	mov    %al,-0xc(%rbp)
  8014c1:	eb 17                	jmp    8014da <strchr+0x2a>
  8014c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014c7:	0f b6 00             	movzbl (%rax),%eax
  8014ca:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8014cd:	75 06                	jne    8014d5 <strchr+0x25>
  8014cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d3:	eb 15                	jmp    8014ea <strchr+0x3a>
  8014d5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8014da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014de:	0f b6 00             	movzbl (%rax),%eax
  8014e1:	84 c0                	test   %al,%al
  8014e3:	75 de                	jne    8014c3 <strchr+0x13>
  8014e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8014ea:	c9                   	leaveq 
  8014eb:	c3                   	retq   

00000000008014ec <strfind>:
  8014ec:	55                   	push   %rbp
  8014ed:	48 89 e5             	mov    %rsp,%rbp
  8014f0:	48 83 ec 10          	sub    $0x10,%rsp
  8014f4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014f8:	89 f0                	mov    %esi,%eax
  8014fa:	88 45 f4             	mov    %al,-0xc(%rbp)
  8014fd:	eb 11                	jmp    801510 <strfind+0x24>
  8014ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801503:	0f b6 00             	movzbl (%rax),%eax
  801506:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801509:	74 12                	je     80151d <strfind+0x31>
  80150b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801510:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801514:	0f b6 00             	movzbl (%rax),%eax
  801517:	84 c0                	test   %al,%al
  801519:	75 e4                	jne    8014ff <strfind+0x13>
  80151b:	eb 01                	jmp    80151e <strfind+0x32>
  80151d:	90                   	nop
  80151e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801522:	c9                   	leaveq 
  801523:	c3                   	retq   

0000000000801524 <memset>:
  801524:	55                   	push   %rbp
  801525:	48 89 e5             	mov    %rsp,%rbp
  801528:	48 83 ec 18          	sub    $0x18,%rsp
  80152c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801530:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801533:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801537:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80153c:	75 06                	jne    801544 <memset+0x20>
  80153e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801542:	eb 69                	jmp    8015ad <memset+0x89>
  801544:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801548:	83 e0 03             	and    $0x3,%eax
  80154b:	48 85 c0             	test   %rax,%rax
  80154e:	75 48                	jne    801598 <memset+0x74>
  801550:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801554:	83 e0 03             	and    $0x3,%eax
  801557:	48 85 c0             	test   %rax,%rax
  80155a:	75 3c                	jne    801598 <memset+0x74>
  80155c:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801563:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801566:	c1 e0 18             	shl    $0x18,%eax
  801569:	89 c2                	mov    %eax,%edx
  80156b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80156e:	c1 e0 10             	shl    $0x10,%eax
  801571:	09 c2                	or     %eax,%edx
  801573:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801576:	c1 e0 08             	shl    $0x8,%eax
  801579:	09 d0                	or     %edx,%eax
  80157b:	09 45 f4             	or     %eax,-0xc(%rbp)
  80157e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801582:	48 c1 e8 02          	shr    $0x2,%rax
  801586:	48 89 c1             	mov    %rax,%rcx
  801589:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80158d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801590:	48 89 d7             	mov    %rdx,%rdi
  801593:	fc                   	cld    
  801594:	f3 ab                	rep stos %eax,%es:(%rdi)
  801596:	eb 11                	jmp    8015a9 <memset+0x85>
  801598:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80159c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80159f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8015a3:	48 89 d7             	mov    %rdx,%rdi
  8015a6:	fc                   	cld    
  8015a7:	f3 aa                	rep stos %al,%es:(%rdi)
  8015a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015ad:	c9                   	leaveq 
  8015ae:	c3                   	retq   

00000000008015af <memmove>:
  8015af:	55                   	push   %rbp
  8015b0:	48 89 e5             	mov    %rsp,%rbp
  8015b3:	48 83 ec 28          	sub    $0x28,%rsp
  8015b7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015bb:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8015bf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015c3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8015c7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015cf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015d7:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8015db:	0f 83 88 00 00 00    	jae    801669 <memmove+0xba>
  8015e1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8015e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015e9:	48 01 d0             	add    %rdx,%rax
  8015ec:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8015f0:	76 77                	jbe    801669 <memmove+0xba>
  8015f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015f6:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8015fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015fe:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801602:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801606:	83 e0 03             	and    $0x3,%eax
  801609:	48 85 c0             	test   %rax,%rax
  80160c:	75 3b                	jne    801649 <memmove+0x9a>
  80160e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801612:	83 e0 03             	and    $0x3,%eax
  801615:	48 85 c0             	test   %rax,%rax
  801618:	75 2f                	jne    801649 <memmove+0x9a>
  80161a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161e:	83 e0 03             	and    $0x3,%eax
  801621:	48 85 c0             	test   %rax,%rax
  801624:	75 23                	jne    801649 <memmove+0x9a>
  801626:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80162a:	48 83 e8 04          	sub    $0x4,%rax
  80162e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801632:	48 83 ea 04          	sub    $0x4,%rdx
  801636:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80163a:	48 c1 e9 02          	shr    $0x2,%rcx
  80163e:	48 89 c7             	mov    %rax,%rdi
  801641:	48 89 d6             	mov    %rdx,%rsi
  801644:	fd                   	std    
  801645:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801647:	eb 1d                	jmp    801666 <memmove+0xb7>
  801649:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80164d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801651:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801655:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801659:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165d:	48 89 d7             	mov    %rdx,%rdi
  801660:	48 89 c1             	mov    %rax,%rcx
  801663:	fd                   	std    
  801664:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801666:	fc                   	cld    
  801667:	eb 57                	jmp    8016c0 <memmove+0x111>
  801669:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80166d:	83 e0 03             	and    $0x3,%eax
  801670:	48 85 c0             	test   %rax,%rax
  801673:	75 36                	jne    8016ab <memmove+0xfc>
  801675:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801679:	83 e0 03             	and    $0x3,%eax
  80167c:	48 85 c0             	test   %rax,%rax
  80167f:	75 2a                	jne    8016ab <memmove+0xfc>
  801681:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801685:	83 e0 03             	and    $0x3,%eax
  801688:	48 85 c0             	test   %rax,%rax
  80168b:	75 1e                	jne    8016ab <memmove+0xfc>
  80168d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801691:	48 c1 e8 02          	shr    $0x2,%rax
  801695:	48 89 c1             	mov    %rax,%rcx
  801698:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80169c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016a0:	48 89 c7             	mov    %rax,%rdi
  8016a3:	48 89 d6             	mov    %rdx,%rsi
  8016a6:	fc                   	cld    
  8016a7:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8016a9:	eb 15                	jmp    8016c0 <memmove+0x111>
  8016ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016af:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016b3:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8016b7:	48 89 c7             	mov    %rax,%rdi
  8016ba:	48 89 d6             	mov    %rdx,%rsi
  8016bd:	fc                   	cld    
  8016be:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8016c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016c4:	c9                   	leaveq 
  8016c5:	c3                   	retq   

00000000008016c6 <memcpy>:
  8016c6:	55                   	push   %rbp
  8016c7:	48 89 e5             	mov    %rsp,%rbp
  8016ca:	48 83 ec 18          	sub    $0x18,%rsp
  8016ce:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016d2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8016d6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8016da:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8016de:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8016e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016e6:	48 89 ce             	mov    %rcx,%rsi
  8016e9:	48 89 c7             	mov    %rax,%rdi
  8016ec:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  8016f3:	00 00 00 
  8016f6:	ff d0                	callq  *%rax
  8016f8:	c9                   	leaveq 
  8016f9:	c3                   	retq   

00000000008016fa <memcmp>:
  8016fa:	55                   	push   %rbp
  8016fb:	48 89 e5             	mov    %rsp,%rbp
  8016fe:	48 83 ec 28          	sub    $0x28,%rsp
  801702:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801706:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80170a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80170e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801712:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801716:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80171a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80171e:	eb 36                	jmp    801756 <memcmp+0x5c>
  801720:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801724:	0f b6 10             	movzbl (%rax),%edx
  801727:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80172b:	0f b6 00             	movzbl (%rax),%eax
  80172e:	38 c2                	cmp    %al,%dl
  801730:	74 1a                	je     80174c <memcmp+0x52>
  801732:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801736:	0f b6 00             	movzbl (%rax),%eax
  801739:	0f b6 d0             	movzbl %al,%edx
  80173c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801740:	0f b6 00             	movzbl (%rax),%eax
  801743:	0f b6 c0             	movzbl %al,%eax
  801746:	29 c2                	sub    %eax,%edx
  801748:	89 d0                	mov    %edx,%eax
  80174a:	eb 20                	jmp    80176c <memcmp+0x72>
  80174c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801751:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801756:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80175a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80175e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801762:	48 85 c0             	test   %rax,%rax
  801765:	75 b9                	jne    801720 <memcmp+0x26>
  801767:	b8 00 00 00 00       	mov    $0x0,%eax
  80176c:	c9                   	leaveq 
  80176d:	c3                   	retq   

000000000080176e <memfind>:
  80176e:	55                   	push   %rbp
  80176f:	48 89 e5             	mov    %rsp,%rbp
  801772:	48 83 ec 28          	sub    $0x28,%rsp
  801776:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80177a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80177d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801781:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801785:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801789:	48 01 d0             	add    %rdx,%rax
  80178c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801790:	eb 13                	jmp    8017a5 <memfind+0x37>
  801792:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801796:	0f b6 00             	movzbl (%rax),%eax
  801799:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80179c:	38 d0                	cmp    %dl,%al
  80179e:	74 11                	je     8017b1 <memfind+0x43>
  8017a0:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8017a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017a9:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8017ad:	72 e3                	jb     801792 <memfind+0x24>
  8017af:	eb 01                	jmp    8017b2 <memfind+0x44>
  8017b1:	90                   	nop
  8017b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017b6:	c9                   	leaveq 
  8017b7:	c3                   	retq   

00000000008017b8 <strtol>:
  8017b8:	55                   	push   %rbp
  8017b9:	48 89 e5             	mov    %rsp,%rbp
  8017bc:	48 83 ec 38          	sub    $0x38,%rsp
  8017c0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8017c4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8017c8:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8017cb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8017d2:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8017d9:	00 
  8017da:	eb 05                	jmp    8017e1 <strtol+0x29>
  8017dc:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8017e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017e5:	0f b6 00             	movzbl (%rax),%eax
  8017e8:	3c 20                	cmp    $0x20,%al
  8017ea:	74 f0                	je     8017dc <strtol+0x24>
  8017ec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017f0:	0f b6 00             	movzbl (%rax),%eax
  8017f3:	3c 09                	cmp    $0x9,%al
  8017f5:	74 e5                	je     8017dc <strtol+0x24>
  8017f7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017fb:	0f b6 00             	movzbl (%rax),%eax
  8017fe:	3c 2b                	cmp    $0x2b,%al
  801800:	75 07                	jne    801809 <strtol+0x51>
  801802:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801807:	eb 17                	jmp    801820 <strtol+0x68>
  801809:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180d:	0f b6 00             	movzbl (%rax),%eax
  801810:	3c 2d                	cmp    $0x2d,%al
  801812:	75 0c                	jne    801820 <strtol+0x68>
  801814:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801819:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801820:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801824:	74 06                	je     80182c <strtol+0x74>
  801826:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80182a:	75 28                	jne    801854 <strtol+0x9c>
  80182c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801830:	0f b6 00             	movzbl (%rax),%eax
  801833:	3c 30                	cmp    $0x30,%al
  801835:	75 1d                	jne    801854 <strtol+0x9c>
  801837:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80183b:	48 83 c0 01          	add    $0x1,%rax
  80183f:	0f b6 00             	movzbl (%rax),%eax
  801842:	3c 78                	cmp    $0x78,%al
  801844:	75 0e                	jne    801854 <strtol+0x9c>
  801846:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80184b:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801852:	eb 2c                	jmp    801880 <strtol+0xc8>
  801854:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801858:	75 19                	jne    801873 <strtol+0xbb>
  80185a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80185e:	0f b6 00             	movzbl (%rax),%eax
  801861:	3c 30                	cmp    $0x30,%al
  801863:	75 0e                	jne    801873 <strtol+0xbb>
  801865:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80186a:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801871:	eb 0d                	jmp    801880 <strtol+0xc8>
  801873:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801877:	75 07                	jne    801880 <strtol+0xc8>
  801879:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801880:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801884:	0f b6 00             	movzbl (%rax),%eax
  801887:	3c 2f                	cmp    $0x2f,%al
  801889:	7e 1d                	jle    8018a8 <strtol+0xf0>
  80188b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80188f:	0f b6 00             	movzbl (%rax),%eax
  801892:	3c 39                	cmp    $0x39,%al
  801894:	7f 12                	jg     8018a8 <strtol+0xf0>
  801896:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80189a:	0f b6 00             	movzbl (%rax),%eax
  80189d:	0f be c0             	movsbl %al,%eax
  8018a0:	83 e8 30             	sub    $0x30,%eax
  8018a3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8018a6:	eb 4e                	jmp    8018f6 <strtol+0x13e>
  8018a8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018ac:	0f b6 00             	movzbl (%rax),%eax
  8018af:	3c 60                	cmp    $0x60,%al
  8018b1:	7e 1d                	jle    8018d0 <strtol+0x118>
  8018b3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018b7:	0f b6 00             	movzbl (%rax),%eax
  8018ba:	3c 7a                	cmp    $0x7a,%al
  8018bc:	7f 12                	jg     8018d0 <strtol+0x118>
  8018be:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018c2:	0f b6 00             	movzbl (%rax),%eax
  8018c5:	0f be c0             	movsbl %al,%eax
  8018c8:	83 e8 57             	sub    $0x57,%eax
  8018cb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8018ce:	eb 26                	jmp    8018f6 <strtol+0x13e>
  8018d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018d4:	0f b6 00             	movzbl (%rax),%eax
  8018d7:	3c 40                	cmp    $0x40,%al
  8018d9:	7e 47                	jle    801922 <strtol+0x16a>
  8018db:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018df:	0f b6 00             	movzbl (%rax),%eax
  8018e2:	3c 5a                	cmp    $0x5a,%al
  8018e4:	7f 3c                	jg     801922 <strtol+0x16a>
  8018e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018ea:	0f b6 00             	movzbl (%rax),%eax
  8018ed:	0f be c0             	movsbl %al,%eax
  8018f0:	83 e8 37             	sub    $0x37,%eax
  8018f3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8018f6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8018f9:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8018fc:	7d 23                	jge    801921 <strtol+0x169>
  8018fe:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801903:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801906:	48 98                	cltq   
  801908:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80190d:	48 89 c2             	mov    %rax,%rdx
  801910:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801913:	48 98                	cltq   
  801915:	48 01 d0             	add    %rdx,%rax
  801918:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80191c:	e9 5f ff ff ff       	jmpq   801880 <strtol+0xc8>
  801921:	90                   	nop
  801922:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801927:	74 0b                	je     801934 <strtol+0x17c>
  801929:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80192d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801931:	48 89 10             	mov    %rdx,(%rax)
  801934:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801938:	74 09                	je     801943 <strtol+0x18b>
  80193a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80193e:	48 f7 d8             	neg    %rax
  801941:	eb 04                	jmp    801947 <strtol+0x18f>
  801943:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801947:	c9                   	leaveq 
  801948:	c3                   	retq   

0000000000801949 <strstr>:
  801949:	55                   	push   %rbp
  80194a:	48 89 e5             	mov    %rsp,%rbp
  80194d:	48 83 ec 30          	sub    $0x30,%rsp
  801951:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801955:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801959:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80195d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801961:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801965:	0f b6 00             	movzbl (%rax),%eax
  801968:	88 45 ff             	mov    %al,-0x1(%rbp)
  80196b:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80196f:	75 06                	jne    801977 <strstr+0x2e>
  801971:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801975:	eb 6b                	jmp    8019e2 <strstr+0x99>
  801977:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80197b:	48 89 c7             	mov    %rax,%rdi
  80197e:	48 b8 1e 12 80 00 00 	movabs $0x80121e,%rax
  801985:	00 00 00 
  801988:	ff d0                	callq  *%rax
  80198a:	48 98                	cltq   
  80198c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801990:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801994:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801998:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80199c:	0f b6 00             	movzbl (%rax),%eax
  80199f:	88 45 ef             	mov    %al,-0x11(%rbp)
  8019a2:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8019a6:	75 07                	jne    8019af <strstr+0x66>
  8019a8:	b8 00 00 00 00       	mov    $0x0,%eax
  8019ad:	eb 33                	jmp    8019e2 <strstr+0x99>
  8019af:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8019b3:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8019b6:	75 d8                	jne    801990 <strstr+0x47>
  8019b8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019bc:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8019c0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019c4:	48 89 ce             	mov    %rcx,%rsi
  8019c7:	48 89 c7             	mov    %rax,%rdi
  8019ca:	48 b8 3f 14 80 00 00 	movabs $0x80143f,%rax
  8019d1:	00 00 00 
  8019d4:	ff d0                	callq  *%rax
  8019d6:	85 c0                	test   %eax,%eax
  8019d8:	75 b6                	jne    801990 <strstr+0x47>
  8019da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019de:	48 83 e8 01          	sub    $0x1,%rax
  8019e2:	c9                   	leaveq 
  8019e3:	c3                   	retq   

00000000008019e4 <syscall>:
  8019e4:	55                   	push   %rbp
  8019e5:	48 89 e5             	mov    %rsp,%rbp
  8019e8:	53                   	push   %rbx
  8019e9:	48 83 ec 48          	sub    $0x48,%rsp
  8019ed:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8019f0:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8019f3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8019f7:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8019fb:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8019ff:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801a03:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801a06:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801a0a:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801a0e:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801a12:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801a16:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801a1a:	4c 89 c3             	mov    %r8,%rbx
  801a1d:	cd 30                	int    $0x30
  801a1f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801a23:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801a27:	74 3e                	je     801a67 <syscall+0x83>
  801a29:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801a2e:	7e 37                	jle    801a67 <syscall+0x83>
  801a30:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801a34:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801a37:	49 89 d0             	mov    %rdx,%r8
  801a3a:	89 c1                	mov    %eax,%ecx
  801a3c:	48 ba 48 50 80 00 00 	movabs $0x805048,%rdx
  801a43:	00 00 00 
  801a46:	be 24 00 00 00       	mov    $0x24,%esi
  801a4b:	48 bf 65 50 80 00 00 	movabs $0x805065,%rdi
  801a52:	00 00 00 
  801a55:	b8 00 00 00 00       	mov    $0x0,%eax
  801a5a:	49 b9 c0 04 80 00 00 	movabs $0x8004c0,%r9
  801a61:	00 00 00 
  801a64:	41 ff d1             	callq  *%r9
  801a67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a6b:	48 83 c4 48          	add    $0x48,%rsp
  801a6f:	5b                   	pop    %rbx
  801a70:	5d                   	pop    %rbp
  801a71:	c3                   	retq   

0000000000801a72 <sys_cputs>:
  801a72:	55                   	push   %rbp
  801a73:	48 89 e5             	mov    %rsp,%rbp
  801a76:	48 83 ec 10          	sub    $0x10,%rsp
  801a7a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a7e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a82:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a86:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a8a:	48 83 ec 08          	sub    $0x8,%rsp
  801a8e:	6a 00                	pushq  $0x0
  801a90:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a96:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a9c:	48 89 d1             	mov    %rdx,%rcx
  801a9f:	48 89 c2             	mov    %rax,%rdx
  801aa2:	be 00 00 00 00       	mov    $0x0,%esi
  801aa7:	bf 00 00 00 00       	mov    $0x0,%edi
  801aac:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801ab3:	00 00 00 
  801ab6:	ff d0                	callq  *%rax
  801ab8:	48 83 c4 10          	add    $0x10,%rsp
  801abc:	90                   	nop
  801abd:	c9                   	leaveq 
  801abe:	c3                   	retq   

0000000000801abf <sys_cgetc>:
  801abf:	55                   	push   %rbp
  801ac0:	48 89 e5             	mov    %rsp,%rbp
  801ac3:	48 83 ec 08          	sub    $0x8,%rsp
  801ac7:	6a 00                	pushq  $0x0
  801ac9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801acf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ad5:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ada:	ba 00 00 00 00       	mov    $0x0,%edx
  801adf:	be 00 00 00 00       	mov    $0x0,%esi
  801ae4:	bf 01 00 00 00       	mov    $0x1,%edi
  801ae9:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801af0:	00 00 00 
  801af3:	ff d0                	callq  *%rax
  801af5:	48 83 c4 10          	add    $0x10,%rsp
  801af9:	c9                   	leaveq 
  801afa:	c3                   	retq   

0000000000801afb <sys_env_destroy>:
  801afb:	55                   	push   %rbp
  801afc:	48 89 e5             	mov    %rsp,%rbp
  801aff:	48 83 ec 10          	sub    $0x10,%rsp
  801b03:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b06:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b09:	48 98                	cltq   
  801b0b:	48 83 ec 08          	sub    $0x8,%rsp
  801b0f:	6a 00                	pushq  $0x0
  801b11:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b17:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b1d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b22:	48 89 c2             	mov    %rax,%rdx
  801b25:	be 01 00 00 00       	mov    $0x1,%esi
  801b2a:	bf 03 00 00 00       	mov    $0x3,%edi
  801b2f:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801b36:	00 00 00 
  801b39:	ff d0                	callq  *%rax
  801b3b:	48 83 c4 10          	add    $0x10,%rsp
  801b3f:	c9                   	leaveq 
  801b40:	c3                   	retq   

0000000000801b41 <sys_getenvid>:
  801b41:	55                   	push   %rbp
  801b42:	48 89 e5             	mov    %rsp,%rbp
  801b45:	48 83 ec 08          	sub    $0x8,%rsp
  801b49:	6a 00                	pushq  $0x0
  801b4b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b51:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b57:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b5c:	ba 00 00 00 00       	mov    $0x0,%edx
  801b61:	be 00 00 00 00       	mov    $0x0,%esi
  801b66:	bf 02 00 00 00       	mov    $0x2,%edi
  801b6b:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801b72:	00 00 00 
  801b75:	ff d0                	callq  *%rax
  801b77:	48 83 c4 10          	add    $0x10,%rsp
  801b7b:	c9                   	leaveq 
  801b7c:	c3                   	retq   

0000000000801b7d <sys_yield>:
  801b7d:	55                   	push   %rbp
  801b7e:	48 89 e5             	mov    %rsp,%rbp
  801b81:	48 83 ec 08          	sub    $0x8,%rsp
  801b85:	6a 00                	pushq  $0x0
  801b87:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b8d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b93:	b9 00 00 00 00       	mov    $0x0,%ecx
  801b98:	ba 00 00 00 00       	mov    $0x0,%edx
  801b9d:	be 00 00 00 00       	mov    $0x0,%esi
  801ba2:	bf 0b 00 00 00       	mov    $0xb,%edi
  801ba7:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801bae:	00 00 00 
  801bb1:	ff d0                	callq  *%rax
  801bb3:	48 83 c4 10          	add    $0x10,%rsp
  801bb7:	90                   	nop
  801bb8:	c9                   	leaveq 
  801bb9:	c3                   	retq   

0000000000801bba <sys_page_alloc>:
  801bba:	55                   	push   %rbp
  801bbb:	48 89 e5             	mov    %rsp,%rbp
  801bbe:	48 83 ec 10          	sub    $0x10,%rsp
  801bc2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bc5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bc9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801bcc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bcf:	48 63 c8             	movslq %eax,%rcx
  801bd2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bd6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bd9:	48 98                	cltq   
  801bdb:	48 83 ec 08          	sub    $0x8,%rsp
  801bdf:	6a 00                	pushq  $0x0
  801be1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801be7:	49 89 c8             	mov    %rcx,%r8
  801bea:	48 89 d1             	mov    %rdx,%rcx
  801bed:	48 89 c2             	mov    %rax,%rdx
  801bf0:	be 01 00 00 00       	mov    $0x1,%esi
  801bf5:	bf 04 00 00 00       	mov    $0x4,%edi
  801bfa:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801c01:	00 00 00 
  801c04:	ff d0                	callq  *%rax
  801c06:	48 83 c4 10          	add    $0x10,%rsp
  801c0a:	c9                   	leaveq 
  801c0b:	c3                   	retq   

0000000000801c0c <sys_page_map>:
  801c0c:	55                   	push   %rbp
  801c0d:	48 89 e5             	mov    %rsp,%rbp
  801c10:	48 83 ec 20          	sub    $0x20,%rsp
  801c14:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c17:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c1b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801c1e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801c22:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801c26:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801c29:	48 63 c8             	movslq %eax,%rcx
  801c2c:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801c30:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801c33:	48 63 f0             	movslq %eax,%rsi
  801c36:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c3a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c3d:	48 98                	cltq   
  801c3f:	48 83 ec 08          	sub    $0x8,%rsp
  801c43:	51                   	push   %rcx
  801c44:	49 89 f9             	mov    %rdi,%r9
  801c47:	49 89 f0             	mov    %rsi,%r8
  801c4a:	48 89 d1             	mov    %rdx,%rcx
  801c4d:	48 89 c2             	mov    %rax,%rdx
  801c50:	be 01 00 00 00       	mov    $0x1,%esi
  801c55:	bf 05 00 00 00       	mov    $0x5,%edi
  801c5a:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801c61:	00 00 00 
  801c64:	ff d0                	callq  *%rax
  801c66:	48 83 c4 10          	add    $0x10,%rsp
  801c6a:	c9                   	leaveq 
  801c6b:	c3                   	retq   

0000000000801c6c <sys_page_unmap>:
  801c6c:	55                   	push   %rbp
  801c6d:	48 89 e5             	mov    %rsp,%rbp
  801c70:	48 83 ec 10          	sub    $0x10,%rsp
  801c74:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c77:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c7b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c7f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c82:	48 98                	cltq   
  801c84:	48 83 ec 08          	sub    $0x8,%rsp
  801c88:	6a 00                	pushq  $0x0
  801c8a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c90:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c96:	48 89 d1             	mov    %rdx,%rcx
  801c99:	48 89 c2             	mov    %rax,%rdx
  801c9c:	be 01 00 00 00       	mov    $0x1,%esi
  801ca1:	bf 06 00 00 00       	mov    $0x6,%edi
  801ca6:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801cad:	00 00 00 
  801cb0:	ff d0                	callq  *%rax
  801cb2:	48 83 c4 10          	add    $0x10,%rsp
  801cb6:	c9                   	leaveq 
  801cb7:	c3                   	retq   

0000000000801cb8 <sys_env_set_status>:
  801cb8:	55                   	push   %rbp
  801cb9:	48 89 e5             	mov    %rsp,%rbp
  801cbc:	48 83 ec 10          	sub    $0x10,%rsp
  801cc0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cc3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801cc6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cc9:	48 63 d0             	movslq %eax,%rdx
  801ccc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ccf:	48 98                	cltq   
  801cd1:	48 83 ec 08          	sub    $0x8,%rsp
  801cd5:	6a 00                	pushq  $0x0
  801cd7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cdd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ce3:	48 89 d1             	mov    %rdx,%rcx
  801ce6:	48 89 c2             	mov    %rax,%rdx
  801ce9:	be 01 00 00 00       	mov    $0x1,%esi
  801cee:	bf 08 00 00 00       	mov    $0x8,%edi
  801cf3:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801cfa:	00 00 00 
  801cfd:	ff d0                	callq  *%rax
  801cff:	48 83 c4 10          	add    $0x10,%rsp
  801d03:	c9                   	leaveq 
  801d04:	c3                   	retq   

0000000000801d05 <sys_env_set_trapframe>:
  801d05:	55                   	push   %rbp
  801d06:	48 89 e5             	mov    %rsp,%rbp
  801d09:	48 83 ec 10          	sub    $0x10,%rsp
  801d0d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d10:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d14:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d1b:	48 98                	cltq   
  801d1d:	48 83 ec 08          	sub    $0x8,%rsp
  801d21:	6a 00                	pushq  $0x0
  801d23:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d29:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d2f:	48 89 d1             	mov    %rdx,%rcx
  801d32:	48 89 c2             	mov    %rax,%rdx
  801d35:	be 01 00 00 00       	mov    $0x1,%esi
  801d3a:	bf 09 00 00 00       	mov    $0x9,%edi
  801d3f:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801d46:	00 00 00 
  801d49:	ff d0                	callq  *%rax
  801d4b:	48 83 c4 10          	add    $0x10,%rsp
  801d4f:	c9                   	leaveq 
  801d50:	c3                   	retq   

0000000000801d51 <sys_env_set_pgfault_upcall>:
  801d51:	55                   	push   %rbp
  801d52:	48 89 e5             	mov    %rsp,%rbp
  801d55:	48 83 ec 10          	sub    $0x10,%rsp
  801d59:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d5c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d60:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d64:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d67:	48 98                	cltq   
  801d69:	48 83 ec 08          	sub    $0x8,%rsp
  801d6d:	6a 00                	pushq  $0x0
  801d6f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d75:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d7b:	48 89 d1             	mov    %rdx,%rcx
  801d7e:	48 89 c2             	mov    %rax,%rdx
  801d81:	be 01 00 00 00       	mov    $0x1,%esi
  801d86:	bf 0a 00 00 00       	mov    $0xa,%edi
  801d8b:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801d92:	00 00 00 
  801d95:	ff d0                	callq  *%rax
  801d97:	48 83 c4 10          	add    $0x10,%rsp
  801d9b:	c9                   	leaveq 
  801d9c:	c3                   	retq   

0000000000801d9d <sys_ipc_try_send>:
  801d9d:	55                   	push   %rbp
  801d9e:	48 89 e5             	mov    %rsp,%rbp
  801da1:	48 83 ec 20          	sub    $0x20,%rsp
  801da5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801da8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801dac:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801db0:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801db3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801db6:	48 63 f0             	movslq %eax,%rsi
  801db9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801dbd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dc0:	48 98                	cltq   
  801dc2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dc6:	48 83 ec 08          	sub    $0x8,%rsp
  801dca:	6a 00                	pushq  $0x0
  801dcc:	49 89 f1             	mov    %rsi,%r9
  801dcf:	49 89 c8             	mov    %rcx,%r8
  801dd2:	48 89 d1             	mov    %rdx,%rcx
  801dd5:	48 89 c2             	mov    %rax,%rdx
  801dd8:	be 00 00 00 00       	mov    $0x0,%esi
  801ddd:	bf 0c 00 00 00       	mov    $0xc,%edi
  801de2:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801de9:	00 00 00 
  801dec:	ff d0                	callq  *%rax
  801dee:	48 83 c4 10          	add    $0x10,%rsp
  801df2:	c9                   	leaveq 
  801df3:	c3                   	retq   

0000000000801df4 <sys_ipc_recv>:
  801df4:	55                   	push   %rbp
  801df5:	48 89 e5             	mov    %rsp,%rbp
  801df8:	48 83 ec 10          	sub    $0x10,%rsp
  801dfc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e00:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e04:	48 83 ec 08          	sub    $0x8,%rsp
  801e08:	6a 00                	pushq  $0x0
  801e0a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e10:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e16:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e1b:	48 89 c2             	mov    %rax,%rdx
  801e1e:	be 01 00 00 00       	mov    $0x1,%esi
  801e23:	bf 0d 00 00 00       	mov    $0xd,%edi
  801e28:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801e2f:	00 00 00 
  801e32:	ff d0                	callq  *%rax
  801e34:	48 83 c4 10          	add    $0x10,%rsp
  801e38:	c9                   	leaveq 
  801e39:	c3                   	retq   

0000000000801e3a <sys_time_msec>:
  801e3a:	55                   	push   %rbp
  801e3b:	48 89 e5             	mov    %rsp,%rbp
  801e3e:	48 83 ec 08          	sub    $0x8,%rsp
  801e42:	6a 00                	pushq  $0x0
  801e44:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e4a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e50:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e55:	ba 00 00 00 00       	mov    $0x0,%edx
  801e5a:	be 00 00 00 00       	mov    $0x0,%esi
  801e5f:	bf 0e 00 00 00       	mov    $0xe,%edi
  801e64:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801e6b:	00 00 00 
  801e6e:	ff d0                	callq  *%rax
  801e70:	48 83 c4 10          	add    $0x10,%rsp
  801e74:	c9                   	leaveq 
  801e75:	c3                   	retq   

0000000000801e76 <sys_net_transmit>:
  801e76:	55                   	push   %rbp
  801e77:	48 89 e5             	mov    %rsp,%rbp
  801e7a:	48 83 ec 10          	sub    $0x10,%rsp
  801e7e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e82:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801e85:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801e88:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e8c:	48 83 ec 08          	sub    $0x8,%rsp
  801e90:	6a 00                	pushq  $0x0
  801e92:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e98:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e9e:	48 89 d1             	mov    %rdx,%rcx
  801ea1:	48 89 c2             	mov    %rax,%rdx
  801ea4:	be 00 00 00 00       	mov    $0x0,%esi
  801ea9:	bf 0f 00 00 00       	mov    $0xf,%edi
  801eae:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801eb5:	00 00 00 
  801eb8:	ff d0                	callq  *%rax
  801eba:	48 83 c4 10          	add    $0x10,%rsp
  801ebe:	c9                   	leaveq 
  801ebf:	c3                   	retq   

0000000000801ec0 <sys_net_receive>:
  801ec0:	55                   	push   %rbp
  801ec1:	48 89 e5             	mov    %rsp,%rbp
  801ec4:	48 83 ec 10          	sub    $0x10,%rsp
  801ec8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801ecc:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801ecf:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801ed2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ed6:	48 83 ec 08          	sub    $0x8,%rsp
  801eda:	6a 00                	pushq  $0x0
  801edc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ee2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ee8:	48 89 d1             	mov    %rdx,%rcx
  801eeb:	48 89 c2             	mov    %rax,%rdx
  801eee:	be 00 00 00 00       	mov    $0x0,%esi
  801ef3:	bf 10 00 00 00       	mov    $0x10,%edi
  801ef8:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801eff:	00 00 00 
  801f02:	ff d0                	callq  *%rax
  801f04:	48 83 c4 10          	add    $0x10,%rsp
  801f08:	c9                   	leaveq 
  801f09:	c3                   	retq   

0000000000801f0a <sys_ept_map>:
  801f0a:	55                   	push   %rbp
  801f0b:	48 89 e5             	mov    %rsp,%rbp
  801f0e:	48 83 ec 20          	sub    $0x20,%rsp
  801f12:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f15:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f19:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801f1c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801f20:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801f24:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801f27:	48 63 c8             	movslq %eax,%rcx
  801f2a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801f2e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f31:	48 63 f0             	movslq %eax,%rsi
  801f34:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f3b:	48 98                	cltq   
  801f3d:	48 83 ec 08          	sub    $0x8,%rsp
  801f41:	51                   	push   %rcx
  801f42:	49 89 f9             	mov    %rdi,%r9
  801f45:	49 89 f0             	mov    %rsi,%r8
  801f48:	48 89 d1             	mov    %rdx,%rcx
  801f4b:	48 89 c2             	mov    %rax,%rdx
  801f4e:	be 00 00 00 00       	mov    $0x0,%esi
  801f53:	bf 11 00 00 00       	mov    $0x11,%edi
  801f58:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801f5f:	00 00 00 
  801f62:	ff d0                	callq  *%rax
  801f64:	48 83 c4 10          	add    $0x10,%rsp
  801f68:	c9                   	leaveq 
  801f69:	c3                   	retq   

0000000000801f6a <sys_env_mkguest>:
  801f6a:	55                   	push   %rbp
  801f6b:	48 89 e5             	mov    %rsp,%rbp
  801f6e:	48 83 ec 10          	sub    $0x10,%rsp
  801f72:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f76:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f7a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f82:	48 83 ec 08          	sub    $0x8,%rsp
  801f86:	6a 00                	pushq  $0x0
  801f88:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f8e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f94:	48 89 d1             	mov    %rdx,%rcx
  801f97:	48 89 c2             	mov    %rax,%rdx
  801f9a:	be 00 00 00 00       	mov    $0x0,%esi
  801f9f:	bf 12 00 00 00       	mov    $0x12,%edi
  801fa4:	48 b8 e4 19 80 00 00 	movabs $0x8019e4,%rax
  801fab:	00 00 00 
  801fae:	ff d0                	callq  *%rax
  801fb0:	48 83 c4 10          	add    $0x10,%rsp
  801fb4:	c9                   	leaveq 
  801fb5:	c3                   	retq   

0000000000801fb6 <pgfault>:
  801fb6:	55                   	push   %rbp
  801fb7:	48 89 e5             	mov    %rsp,%rbp
  801fba:	48 83 ec 30          	sub    $0x30,%rsp
  801fbe:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801fc2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fc6:	48 8b 00             	mov    (%rax),%rax
  801fc9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801fcd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fd1:	48 8b 40 08          	mov    0x8(%rax),%rax
  801fd5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fd8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fdb:	83 e0 02             	and    $0x2,%eax
  801fde:	85 c0                	test   %eax,%eax
  801fe0:	75 40                	jne    802022 <pgfault+0x6c>
  801fe2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fe6:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801fed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ff1:	49 89 d0             	mov    %rdx,%r8
  801ff4:	48 89 c1             	mov    %rax,%rcx
  801ff7:	48 ba 78 50 80 00 00 	movabs $0x805078,%rdx
  801ffe:	00 00 00 
  802001:	be 1f 00 00 00       	mov    $0x1f,%esi
  802006:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  80200d:	00 00 00 
  802010:	b8 00 00 00 00       	mov    $0x0,%eax
  802015:	49 b9 c0 04 80 00 00 	movabs $0x8004c0,%r9
  80201c:	00 00 00 
  80201f:	41 ff d1             	callq  *%r9
  802022:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802026:	48 c1 e8 0c          	shr    $0xc,%rax
  80202a:	48 89 c2             	mov    %rax,%rdx
  80202d:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802034:	01 00 00 
  802037:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80203b:	25 07 08 00 00       	and    $0x807,%eax
  802040:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  802046:	74 4e                	je     802096 <pgfault+0xe0>
  802048:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80204c:	48 c1 e8 0c          	shr    $0xc,%rax
  802050:	48 89 c2             	mov    %rax,%rdx
  802053:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80205a:	01 00 00 
  80205d:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802061:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802065:	49 89 d0             	mov    %rdx,%r8
  802068:	48 89 c1             	mov    %rax,%rcx
  80206b:	48 ba a0 50 80 00 00 	movabs $0x8050a0,%rdx
  802072:	00 00 00 
  802075:	be 22 00 00 00       	mov    $0x22,%esi
  80207a:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  802081:	00 00 00 
  802084:	b8 00 00 00 00       	mov    $0x0,%eax
  802089:	49 b9 c0 04 80 00 00 	movabs $0x8004c0,%r9
  802090:	00 00 00 
  802093:	41 ff d1             	callq  *%r9
  802096:	ba 07 00 00 00       	mov    $0x7,%edx
  80209b:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  8020a0:	bf 00 00 00 00       	mov    $0x0,%edi
  8020a5:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  8020ac:	00 00 00 
  8020af:	ff d0                	callq  *%rax
  8020b1:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8020b4:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8020b8:	79 30                	jns    8020ea <pgfault+0x134>
  8020ba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8020bd:	89 c1                	mov    %eax,%ecx
  8020bf:	48 ba cb 50 80 00 00 	movabs $0x8050cb,%rdx
  8020c6:	00 00 00 
  8020c9:	be 30 00 00 00       	mov    $0x30,%esi
  8020ce:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  8020d5:	00 00 00 
  8020d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8020dd:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  8020e4:	00 00 00 
  8020e7:	41 ff d0             	callq  *%r8
  8020ea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020ee:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8020f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020f6:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  8020fc:	ba 00 10 00 00       	mov    $0x1000,%edx
  802101:	48 89 c6             	mov    %rax,%rsi
  802104:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  802109:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  802110:	00 00 00 
  802113:	ff d0                	callq  *%rax
  802115:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802119:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80211d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802121:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  802127:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  80212d:	48 89 c1             	mov    %rax,%rcx
  802130:	ba 00 00 00 00       	mov    $0x0,%edx
  802135:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  80213a:	bf 00 00 00 00       	mov    $0x0,%edi
  80213f:	48 b8 0c 1c 80 00 00 	movabs $0x801c0c,%rax
  802146:	00 00 00 
  802149:	ff d0                	callq  *%rax
  80214b:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80214e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802152:	79 30                	jns    802184 <pgfault+0x1ce>
  802154:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802157:	89 c1                	mov    %eax,%ecx
  802159:	48 ba de 50 80 00 00 	movabs $0x8050de,%rdx
  802160:	00 00 00 
  802163:	be 35 00 00 00       	mov    $0x35,%esi
  802168:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  80216f:	00 00 00 
  802172:	b8 00 00 00 00       	mov    $0x0,%eax
  802177:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  80217e:	00 00 00 
  802181:	41 ff d0             	callq  *%r8
  802184:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  802189:	bf 00 00 00 00       	mov    $0x0,%edi
  80218e:	48 b8 6c 1c 80 00 00 	movabs $0x801c6c,%rax
  802195:	00 00 00 
  802198:	ff d0                	callq  *%rax
  80219a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80219d:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8021a1:	79 30                	jns    8021d3 <pgfault+0x21d>
  8021a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021a6:	89 c1                	mov    %eax,%ecx
  8021a8:	48 ba ef 50 80 00 00 	movabs $0x8050ef,%rdx
  8021af:	00 00 00 
  8021b2:	be 39 00 00 00       	mov    $0x39,%esi
  8021b7:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  8021be:	00 00 00 
  8021c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8021c6:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  8021cd:	00 00 00 
  8021d0:	41 ff d0             	callq  *%r8
  8021d3:	90                   	nop
  8021d4:	c9                   	leaveq 
  8021d5:	c3                   	retq   

00000000008021d6 <duppage>:
  8021d6:	55                   	push   %rbp
  8021d7:	48 89 e5             	mov    %rsp,%rbp
  8021da:	48 83 ec 30          	sub    $0x30,%rsp
  8021de:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8021e1:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8021e4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8021e7:	c1 e0 0c             	shl    $0xc,%eax
  8021ea:	89 c0                	mov    %eax,%eax
  8021ec:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8021f0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021f7:	01 00 00 
  8021fa:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8021fd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802201:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802205:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802209:	25 02 08 00 00       	and    $0x802,%eax
  80220e:	48 85 c0             	test   %rax,%rax
  802211:	74 0e                	je     802221 <duppage+0x4b>
  802213:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802217:	25 00 04 00 00       	and    $0x400,%eax
  80221c:	48 85 c0             	test   %rax,%rax
  80221f:	74 70                	je     802291 <duppage+0xbb>
  802221:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802225:	25 07 0e 00 00       	and    $0xe07,%eax
  80222a:	89 c6                	mov    %eax,%esi
  80222c:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802230:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802233:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802237:	41 89 f0             	mov    %esi,%r8d
  80223a:	48 89 c6             	mov    %rax,%rsi
  80223d:	bf 00 00 00 00       	mov    $0x0,%edi
  802242:	48 b8 0c 1c 80 00 00 	movabs $0x801c0c,%rax
  802249:	00 00 00 
  80224c:	ff d0                	callq  *%rax
  80224e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802251:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802255:	79 30                	jns    802287 <duppage+0xb1>
  802257:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80225a:	89 c1                	mov    %eax,%ecx
  80225c:	48 ba de 50 80 00 00 	movabs $0x8050de,%rdx
  802263:	00 00 00 
  802266:	be 63 00 00 00       	mov    $0x63,%esi
  80226b:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  802272:	00 00 00 
  802275:	b8 00 00 00 00       	mov    $0x0,%eax
  80227a:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  802281:	00 00 00 
  802284:	41 ff d0             	callq  *%r8
  802287:	b8 00 00 00 00       	mov    $0x0,%eax
  80228c:	e9 c4 00 00 00       	jmpq   802355 <duppage+0x17f>
  802291:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802295:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802298:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80229c:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8022a2:	48 89 c6             	mov    %rax,%rsi
  8022a5:	bf 00 00 00 00       	mov    $0x0,%edi
  8022aa:	48 b8 0c 1c 80 00 00 	movabs $0x801c0c,%rax
  8022b1:	00 00 00 
  8022b4:	ff d0                	callq  *%rax
  8022b6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8022b9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8022bd:	79 30                	jns    8022ef <duppage+0x119>
  8022bf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8022c2:	89 c1                	mov    %eax,%ecx
  8022c4:	48 ba de 50 80 00 00 	movabs $0x8050de,%rdx
  8022cb:	00 00 00 
  8022ce:	be 7e 00 00 00       	mov    $0x7e,%esi
  8022d3:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  8022da:	00 00 00 
  8022dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8022e2:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  8022e9:	00 00 00 
  8022ec:	41 ff d0             	callq  *%r8
  8022ef:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8022f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022f7:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8022fd:	48 89 d1             	mov    %rdx,%rcx
  802300:	ba 00 00 00 00       	mov    $0x0,%edx
  802305:	48 89 c6             	mov    %rax,%rsi
  802308:	bf 00 00 00 00       	mov    $0x0,%edi
  80230d:	48 b8 0c 1c 80 00 00 	movabs $0x801c0c,%rax
  802314:	00 00 00 
  802317:	ff d0                	callq  *%rax
  802319:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80231c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802320:	79 30                	jns    802352 <duppage+0x17c>
  802322:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802325:	89 c1                	mov    %eax,%ecx
  802327:	48 ba de 50 80 00 00 	movabs $0x8050de,%rdx
  80232e:	00 00 00 
  802331:	be 80 00 00 00       	mov    $0x80,%esi
  802336:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  80233d:	00 00 00 
  802340:	b8 00 00 00 00       	mov    $0x0,%eax
  802345:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  80234c:	00 00 00 
  80234f:	41 ff d0             	callq  *%r8
  802352:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802355:	c9                   	leaveq 
  802356:	c3                   	retq   

0000000000802357 <fork>:
  802357:	55                   	push   %rbp
  802358:	48 89 e5             	mov    %rsp,%rbp
  80235b:	48 83 ec 20          	sub    $0x20,%rsp
  80235f:	48 bf b6 1f 80 00 00 	movabs $0x801fb6,%rdi
  802366:	00 00 00 
  802369:	48 b8 7c 46 80 00 00 	movabs $0x80467c,%rax
  802370:	00 00 00 
  802373:	ff d0                	callq  *%rax
  802375:	b8 07 00 00 00       	mov    $0x7,%eax
  80237a:	cd 30                	int    $0x30
  80237c:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80237f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802382:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802385:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802389:	79 08                	jns    802393 <fork+0x3c>
  80238b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80238e:	e9 0b 02 00 00       	jmpq   80259e <fork+0x247>
  802393:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802397:	75 3e                	jne    8023d7 <fork+0x80>
  802399:	48 b8 41 1b 80 00 00 	movabs $0x801b41,%rax
  8023a0:	00 00 00 
  8023a3:	ff d0                	callq  *%rax
  8023a5:	25 ff 03 00 00       	and    $0x3ff,%eax
  8023aa:	48 98                	cltq   
  8023ac:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8023b3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8023ba:	00 00 00 
  8023bd:	48 01 c2             	add    %rax,%rdx
  8023c0:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8023c7:	00 00 00 
  8023ca:	48 89 10             	mov    %rdx,(%rax)
  8023cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8023d2:	e9 c7 01 00 00       	jmpq   80259e <fork+0x247>
  8023d7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8023de:	e9 a6 00 00 00       	jmpq   802489 <fork+0x132>
  8023e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023e6:	c1 f8 12             	sar    $0x12,%eax
  8023e9:	89 c2                	mov    %eax,%edx
  8023eb:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8023f2:	01 00 00 
  8023f5:	48 63 d2             	movslq %edx,%rdx
  8023f8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023fc:	83 e0 01             	and    $0x1,%eax
  8023ff:	48 85 c0             	test   %rax,%rax
  802402:	74 21                	je     802425 <fork+0xce>
  802404:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802407:	c1 f8 09             	sar    $0x9,%eax
  80240a:	89 c2                	mov    %eax,%edx
  80240c:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802413:	01 00 00 
  802416:	48 63 d2             	movslq %edx,%rdx
  802419:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80241d:	83 e0 01             	and    $0x1,%eax
  802420:	48 85 c0             	test   %rax,%rax
  802423:	75 09                	jne    80242e <fork+0xd7>
  802425:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  80242c:	eb 5b                	jmp    802489 <fork+0x132>
  80242e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802431:	05 00 02 00 00       	add    $0x200,%eax
  802436:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802439:	eb 46                	jmp    802481 <fork+0x12a>
  80243b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802442:	01 00 00 
  802445:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802448:	48 63 d2             	movslq %edx,%rdx
  80244b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80244f:	83 e0 05             	and    $0x5,%eax
  802452:	48 83 f8 05          	cmp    $0x5,%rax
  802456:	75 21                	jne    802479 <fork+0x122>
  802458:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  80245f:	74 1b                	je     80247c <fork+0x125>
  802461:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802464:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802467:	89 d6                	mov    %edx,%esi
  802469:	89 c7                	mov    %eax,%edi
  80246b:	48 b8 d6 21 80 00 00 	movabs $0x8021d6,%rax
  802472:	00 00 00 
  802475:	ff d0                	callq  *%rax
  802477:	eb 04                	jmp    80247d <fork+0x126>
  802479:	90                   	nop
  80247a:	eb 01                	jmp    80247d <fork+0x126>
  80247c:	90                   	nop
  80247d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802481:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802484:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  802487:	7c b2                	jl     80243b <fork+0xe4>
  802489:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80248c:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802491:	0f 86 4c ff ff ff    	jbe    8023e3 <fork+0x8c>
  802497:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80249a:	ba 07 00 00 00       	mov    $0x7,%edx
  80249f:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8024a4:	89 c7                	mov    %eax,%edi
  8024a6:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  8024ad:	00 00 00 
  8024b0:	ff d0                	callq  *%rax
  8024b2:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8024b5:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8024b9:	79 30                	jns    8024eb <fork+0x194>
  8024bb:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8024be:	89 c1                	mov    %eax,%ecx
  8024c0:	48 ba 08 51 80 00 00 	movabs $0x805108,%rdx
  8024c7:	00 00 00 
  8024ca:	be bc 00 00 00       	mov    $0xbc,%esi
  8024cf:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  8024d6:	00 00 00 
  8024d9:	b8 00 00 00 00       	mov    $0x0,%eax
  8024de:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  8024e5:	00 00 00 
  8024e8:	41 ff d0             	callq  *%r8
  8024eb:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8024f2:	00 00 00 
  8024f5:	48 8b 00             	mov    (%rax),%rax
  8024f8:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  8024ff:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802502:	48 89 d6             	mov    %rdx,%rsi
  802505:	89 c7                	mov    %eax,%edi
  802507:	48 b8 51 1d 80 00 00 	movabs $0x801d51,%rax
  80250e:	00 00 00 
  802511:	ff d0                	callq  *%rax
  802513:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802516:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80251a:	79 30                	jns    80254c <fork+0x1f5>
  80251c:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80251f:	89 c1                	mov    %eax,%ecx
  802521:	48 ba 28 51 80 00 00 	movabs $0x805128,%rdx
  802528:	00 00 00 
  80252b:	be c0 00 00 00       	mov    $0xc0,%esi
  802530:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  802537:	00 00 00 
  80253a:	b8 00 00 00 00       	mov    $0x0,%eax
  80253f:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  802546:	00 00 00 
  802549:	41 ff d0             	callq  *%r8
  80254c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80254f:	be 02 00 00 00       	mov    $0x2,%esi
  802554:	89 c7                	mov    %eax,%edi
  802556:	48 b8 b8 1c 80 00 00 	movabs $0x801cb8,%rax
  80255d:	00 00 00 
  802560:	ff d0                	callq  *%rax
  802562:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802565:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802569:	79 30                	jns    80259b <fork+0x244>
  80256b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80256e:	89 c1                	mov    %eax,%ecx
  802570:	48 ba 47 51 80 00 00 	movabs $0x805147,%rdx
  802577:	00 00 00 
  80257a:	be c5 00 00 00       	mov    $0xc5,%esi
  80257f:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  802586:	00 00 00 
  802589:	b8 00 00 00 00       	mov    $0x0,%eax
  80258e:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  802595:	00 00 00 
  802598:	41 ff d0             	callq  *%r8
  80259b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80259e:	c9                   	leaveq 
  80259f:	c3                   	retq   

00000000008025a0 <sfork>:
  8025a0:	55                   	push   %rbp
  8025a1:	48 89 e5             	mov    %rsp,%rbp
  8025a4:	48 ba 5e 51 80 00 00 	movabs $0x80515e,%rdx
  8025ab:	00 00 00 
  8025ae:	be d2 00 00 00       	mov    $0xd2,%esi
  8025b3:	48 bf 91 50 80 00 00 	movabs $0x805091,%rdi
  8025ba:	00 00 00 
  8025bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8025c2:	48 b9 c0 04 80 00 00 	movabs $0x8004c0,%rcx
  8025c9:	00 00 00 
  8025cc:	ff d1                	callq  *%rcx

00000000008025ce <fd2num>:
  8025ce:	55                   	push   %rbp
  8025cf:	48 89 e5             	mov    %rsp,%rbp
  8025d2:	48 83 ec 08          	sub    $0x8,%rsp
  8025d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025da:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8025de:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8025e5:	ff ff ff 
  8025e8:	48 01 d0             	add    %rdx,%rax
  8025eb:	48 c1 e8 0c          	shr    $0xc,%rax
  8025ef:	c9                   	leaveq 
  8025f0:	c3                   	retq   

00000000008025f1 <fd2data>:
  8025f1:	55                   	push   %rbp
  8025f2:	48 89 e5             	mov    %rsp,%rbp
  8025f5:	48 83 ec 08          	sub    $0x8,%rsp
  8025f9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802601:	48 89 c7             	mov    %rax,%rdi
  802604:	48 b8 ce 25 80 00 00 	movabs $0x8025ce,%rax
  80260b:	00 00 00 
  80260e:	ff d0                	callq  *%rax
  802610:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802616:	48 c1 e0 0c          	shl    $0xc,%rax
  80261a:	c9                   	leaveq 
  80261b:	c3                   	retq   

000000000080261c <fd_alloc>:
  80261c:	55                   	push   %rbp
  80261d:	48 89 e5             	mov    %rsp,%rbp
  802620:	48 83 ec 18          	sub    $0x18,%rsp
  802624:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802628:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80262f:	eb 6b                	jmp    80269c <fd_alloc+0x80>
  802631:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802634:	48 98                	cltq   
  802636:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80263c:	48 c1 e0 0c          	shl    $0xc,%rax
  802640:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802644:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802648:	48 c1 e8 15          	shr    $0x15,%rax
  80264c:	48 89 c2             	mov    %rax,%rdx
  80264f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802656:	01 00 00 
  802659:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80265d:	83 e0 01             	and    $0x1,%eax
  802660:	48 85 c0             	test   %rax,%rax
  802663:	74 21                	je     802686 <fd_alloc+0x6a>
  802665:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802669:	48 c1 e8 0c          	shr    $0xc,%rax
  80266d:	48 89 c2             	mov    %rax,%rdx
  802670:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802677:	01 00 00 
  80267a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80267e:	83 e0 01             	and    $0x1,%eax
  802681:	48 85 c0             	test   %rax,%rax
  802684:	75 12                	jne    802698 <fd_alloc+0x7c>
  802686:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80268a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80268e:	48 89 10             	mov    %rdx,(%rax)
  802691:	b8 00 00 00 00       	mov    $0x0,%eax
  802696:	eb 1a                	jmp    8026b2 <fd_alloc+0x96>
  802698:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80269c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8026a0:	7e 8f                	jle    802631 <fd_alloc+0x15>
  8026a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026a6:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8026ad:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8026b2:	c9                   	leaveq 
  8026b3:	c3                   	retq   

00000000008026b4 <fd_lookup>:
  8026b4:	55                   	push   %rbp
  8026b5:	48 89 e5             	mov    %rsp,%rbp
  8026b8:	48 83 ec 20          	sub    $0x20,%rsp
  8026bc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8026bf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026c3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8026c7:	78 06                	js     8026cf <fd_lookup+0x1b>
  8026c9:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8026cd:	7e 07                	jle    8026d6 <fd_lookup+0x22>
  8026cf:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8026d4:	eb 6c                	jmp    802742 <fd_lookup+0x8e>
  8026d6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8026d9:	48 98                	cltq   
  8026db:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8026e1:	48 c1 e0 0c          	shl    $0xc,%rax
  8026e5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8026e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026ed:	48 c1 e8 15          	shr    $0x15,%rax
  8026f1:	48 89 c2             	mov    %rax,%rdx
  8026f4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8026fb:	01 00 00 
  8026fe:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802702:	83 e0 01             	and    $0x1,%eax
  802705:	48 85 c0             	test   %rax,%rax
  802708:	74 21                	je     80272b <fd_lookup+0x77>
  80270a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80270e:	48 c1 e8 0c          	shr    $0xc,%rax
  802712:	48 89 c2             	mov    %rax,%rdx
  802715:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80271c:	01 00 00 
  80271f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802723:	83 e0 01             	and    $0x1,%eax
  802726:	48 85 c0             	test   %rax,%rax
  802729:	75 07                	jne    802732 <fd_lookup+0x7e>
  80272b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802730:	eb 10                	jmp    802742 <fd_lookup+0x8e>
  802732:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802736:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80273a:	48 89 10             	mov    %rdx,(%rax)
  80273d:	b8 00 00 00 00       	mov    $0x0,%eax
  802742:	c9                   	leaveq 
  802743:	c3                   	retq   

0000000000802744 <fd_close>:
  802744:	55                   	push   %rbp
  802745:	48 89 e5             	mov    %rsp,%rbp
  802748:	48 83 ec 30          	sub    $0x30,%rsp
  80274c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802750:	89 f0                	mov    %esi,%eax
  802752:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802755:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802759:	48 89 c7             	mov    %rax,%rdi
  80275c:	48 b8 ce 25 80 00 00 	movabs $0x8025ce,%rax
  802763:	00 00 00 
  802766:	ff d0                	callq  *%rax
  802768:	89 c2                	mov    %eax,%edx
  80276a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80276e:	48 89 c6             	mov    %rax,%rsi
  802771:	89 d7                	mov    %edx,%edi
  802773:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  80277a:	00 00 00 
  80277d:	ff d0                	callq  *%rax
  80277f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802782:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802786:	78 0a                	js     802792 <fd_close+0x4e>
  802788:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80278c:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802790:	74 12                	je     8027a4 <fd_close+0x60>
  802792:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802796:	74 05                	je     80279d <fd_close+0x59>
  802798:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80279b:	eb 70                	jmp    80280d <fd_close+0xc9>
  80279d:	b8 00 00 00 00       	mov    $0x0,%eax
  8027a2:	eb 69                	jmp    80280d <fd_close+0xc9>
  8027a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027a8:	8b 00                	mov    (%rax),%eax
  8027aa:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8027ae:	48 89 d6             	mov    %rdx,%rsi
  8027b1:	89 c7                	mov    %eax,%edi
  8027b3:	48 b8 0f 28 80 00 00 	movabs $0x80280f,%rax
  8027ba:	00 00 00 
  8027bd:	ff d0                	callq  *%rax
  8027bf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027c6:	78 2a                	js     8027f2 <fd_close+0xae>
  8027c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027cc:	48 8b 40 20          	mov    0x20(%rax),%rax
  8027d0:	48 85 c0             	test   %rax,%rax
  8027d3:	74 16                	je     8027eb <fd_close+0xa7>
  8027d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027d9:	48 8b 40 20          	mov    0x20(%rax),%rax
  8027dd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8027e1:	48 89 d7             	mov    %rdx,%rdi
  8027e4:	ff d0                	callq  *%rax
  8027e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027e9:	eb 07                	jmp    8027f2 <fd_close+0xae>
  8027eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027f6:	48 89 c6             	mov    %rax,%rsi
  8027f9:	bf 00 00 00 00       	mov    $0x0,%edi
  8027fe:	48 b8 6c 1c 80 00 00 	movabs $0x801c6c,%rax
  802805:	00 00 00 
  802808:	ff d0                	callq  *%rax
  80280a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80280d:	c9                   	leaveq 
  80280e:	c3                   	retq   

000000000080280f <dev_lookup>:
  80280f:	55                   	push   %rbp
  802810:	48 89 e5             	mov    %rsp,%rbp
  802813:	48 83 ec 20          	sub    $0x20,%rsp
  802817:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80281a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80281e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802825:	eb 41                	jmp    802868 <dev_lookup+0x59>
  802827:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80282e:	00 00 00 
  802831:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802834:	48 63 d2             	movslq %edx,%rdx
  802837:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80283b:	8b 00                	mov    (%rax),%eax
  80283d:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802840:	75 22                	jne    802864 <dev_lookup+0x55>
  802842:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802849:	00 00 00 
  80284c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80284f:	48 63 d2             	movslq %edx,%rdx
  802852:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802856:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80285a:	48 89 10             	mov    %rdx,(%rax)
  80285d:	b8 00 00 00 00       	mov    $0x0,%eax
  802862:	eb 60                	jmp    8028c4 <dev_lookup+0xb5>
  802864:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802868:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80286f:	00 00 00 
  802872:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802875:	48 63 d2             	movslq %edx,%rdx
  802878:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80287c:	48 85 c0             	test   %rax,%rax
  80287f:	75 a6                	jne    802827 <dev_lookup+0x18>
  802881:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802888:	00 00 00 
  80288b:	48 8b 00             	mov    (%rax),%rax
  80288e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802894:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802897:	89 c6                	mov    %eax,%esi
  802899:	48 bf 78 51 80 00 00 	movabs $0x805178,%rdi
  8028a0:	00 00 00 
  8028a3:	b8 00 00 00 00       	mov    $0x0,%eax
  8028a8:	48 b9 fa 06 80 00 00 	movabs $0x8006fa,%rcx
  8028af:	00 00 00 
  8028b2:	ff d1                	callq  *%rcx
  8028b4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8028b8:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8028bf:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8028c4:	c9                   	leaveq 
  8028c5:	c3                   	retq   

00000000008028c6 <close>:
  8028c6:	55                   	push   %rbp
  8028c7:	48 89 e5             	mov    %rsp,%rbp
  8028ca:	48 83 ec 20          	sub    $0x20,%rsp
  8028ce:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028d1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028d5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028d8:	48 89 d6             	mov    %rdx,%rsi
  8028db:	89 c7                	mov    %eax,%edi
  8028dd:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  8028e4:	00 00 00 
  8028e7:	ff d0                	callq  *%rax
  8028e9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028ec:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028f0:	79 05                	jns    8028f7 <close+0x31>
  8028f2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028f5:	eb 18                	jmp    80290f <close+0x49>
  8028f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028fb:	be 01 00 00 00       	mov    $0x1,%esi
  802900:	48 89 c7             	mov    %rax,%rdi
  802903:	48 b8 44 27 80 00 00 	movabs $0x802744,%rax
  80290a:	00 00 00 
  80290d:	ff d0                	callq  *%rax
  80290f:	c9                   	leaveq 
  802910:	c3                   	retq   

0000000000802911 <close_all>:
  802911:	55                   	push   %rbp
  802912:	48 89 e5             	mov    %rsp,%rbp
  802915:	48 83 ec 10          	sub    $0x10,%rsp
  802919:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802920:	eb 15                	jmp    802937 <close_all+0x26>
  802922:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802925:	89 c7                	mov    %eax,%edi
  802927:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  80292e:	00 00 00 
  802931:	ff d0                	callq  *%rax
  802933:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802937:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80293b:	7e e5                	jle    802922 <close_all+0x11>
  80293d:	90                   	nop
  80293e:	c9                   	leaveq 
  80293f:	c3                   	retq   

0000000000802940 <dup>:
  802940:	55                   	push   %rbp
  802941:	48 89 e5             	mov    %rsp,%rbp
  802944:	48 83 ec 40          	sub    $0x40,%rsp
  802948:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80294b:	89 75 c8             	mov    %esi,-0x38(%rbp)
  80294e:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802952:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802955:	48 89 d6             	mov    %rdx,%rsi
  802958:	89 c7                	mov    %eax,%edi
  80295a:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  802961:	00 00 00 
  802964:	ff d0                	callq  *%rax
  802966:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802969:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80296d:	79 08                	jns    802977 <dup+0x37>
  80296f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802972:	e9 70 01 00 00       	jmpq   802ae7 <dup+0x1a7>
  802977:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80297a:	89 c7                	mov    %eax,%edi
  80297c:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  802983:	00 00 00 
  802986:	ff d0                	callq  *%rax
  802988:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80298b:	48 98                	cltq   
  80298d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802993:	48 c1 e0 0c          	shl    $0xc,%rax
  802997:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80299b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80299f:	48 89 c7             	mov    %rax,%rdi
  8029a2:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  8029a9:	00 00 00 
  8029ac:	ff d0                	callq  *%rax
  8029ae:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8029b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029b6:	48 89 c7             	mov    %rax,%rdi
  8029b9:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  8029c0:	00 00 00 
  8029c3:	ff d0                	callq  *%rax
  8029c5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8029c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029cd:	48 c1 e8 15          	shr    $0x15,%rax
  8029d1:	48 89 c2             	mov    %rax,%rdx
  8029d4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8029db:	01 00 00 
  8029de:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8029e2:	83 e0 01             	and    $0x1,%eax
  8029e5:	48 85 c0             	test   %rax,%rax
  8029e8:	74 71                	je     802a5b <dup+0x11b>
  8029ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029ee:	48 c1 e8 0c          	shr    $0xc,%rax
  8029f2:	48 89 c2             	mov    %rax,%rdx
  8029f5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8029fc:	01 00 00 
  8029ff:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a03:	83 e0 01             	and    $0x1,%eax
  802a06:	48 85 c0             	test   %rax,%rax
  802a09:	74 50                	je     802a5b <dup+0x11b>
  802a0b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a0f:	48 c1 e8 0c          	shr    $0xc,%rax
  802a13:	48 89 c2             	mov    %rax,%rdx
  802a16:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a1d:	01 00 00 
  802a20:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a24:	25 07 0e 00 00       	and    $0xe07,%eax
  802a29:	89 c1                	mov    %eax,%ecx
  802a2b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802a2f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a33:	41 89 c8             	mov    %ecx,%r8d
  802a36:	48 89 d1             	mov    %rdx,%rcx
  802a39:	ba 00 00 00 00       	mov    $0x0,%edx
  802a3e:	48 89 c6             	mov    %rax,%rsi
  802a41:	bf 00 00 00 00       	mov    $0x0,%edi
  802a46:	48 b8 0c 1c 80 00 00 	movabs $0x801c0c,%rax
  802a4d:	00 00 00 
  802a50:	ff d0                	callq  *%rax
  802a52:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a55:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a59:	78 55                	js     802ab0 <dup+0x170>
  802a5b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a5f:	48 c1 e8 0c          	shr    $0xc,%rax
  802a63:	48 89 c2             	mov    %rax,%rdx
  802a66:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a6d:	01 00 00 
  802a70:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a74:	25 07 0e 00 00       	and    $0xe07,%eax
  802a79:	89 c1                	mov    %eax,%ecx
  802a7b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a7f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802a83:	41 89 c8             	mov    %ecx,%r8d
  802a86:	48 89 d1             	mov    %rdx,%rcx
  802a89:	ba 00 00 00 00       	mov    $0x0,%edx
  802a8e:	48 89 c6             	mov    %rax,%rsi
  802a91:	bf 00 00 00 00       	mov    $0x0,%edi
  802a96:	48 b8 0c 1c 80 00 00 	movabs $0x801c0c,%rax
  802a9d:	00 00 00 
  802aa0:	ff d0                	callq  *%rax
  802aa2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802aa5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802aa9:	78 08                	js     802ab3 <dup+0x173>
  802aab:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802aae:	eb 37                	jmp    802ae7 <dup+0x1a7>
  802ab0:	90                   	nop
  802ab1:	eb 01                	jmp    802ab4 <dup+0x174>
  802ab3:	90                   	nop
  802ab4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ab8:	48 89 c6             	mov    %rax,%rsi
  802abb:	bf 00 00 00 00       	mov    $0x0,%edi
  802ac0:	48 b8 6c 1c 80 00 00 	movabs $0x801c6c,%rax
  802ac7:	00 00 00 
  802aca:	ff d0                	callq  *%rax
  802acc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ad0:	48 89 c6             	mov    %rax,%rsi
  802ad3:	bf 00 00 00 00       	mov    $0x0,%edi
  802ad8:	48 b8 6c 1c 80 00 00 	movabs $0x801c6c,%rax
  802adf:	00 00 00 
  802ae2:	ff d0                	callq  *%rax
  802ae4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ae7:	c9                   	leaveq 
  802ae8:	c3                   	retq   

0000000000802ae9 <read>:
  802ae9:	55                   	push   %rbp
  802aea:	48 89 e5             	mov    %rsp,%rbp
  802aed:	48 83 ec 40          	sub    $0x40,%rsp
  802af1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802af4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802af8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802afc:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b00:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b03:	48 89 d6             	mov    %rdx,%rsi
  802b06:	89 c7                	mov    %eax,%edi
  802b08:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  802b0f:	00 00 00 
  802b12:	ff d0                	callq  *%rax
  802b14:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b17:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b1b:	78 24                	js     802b41 <read+0x58>
  802b1d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b21:	8b 00                	mov    (%rax),%eax
  802b23:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b27:	48 89 d6             	mov    %rdx,%rsi
  802b2a:	89 c7                	mov    %eax,%edi
  802b2c:	48 b8 0f 28 80 00 00 	movabs $0x80280f,%rax
  802b33:	00 00 00 
  802b36:	ff d0                	callq  *%rax
  802b38:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b3b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b3f:	79 05                	jns    802b46 <read+0x5d>
  802b41:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b44:	eb 76                	jmp    802bbc <read+0xd3>
  802b46:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b4a:	8b 40 08             	mov    0x8(%rax),%eax
  802b4d:	83 e0 03             	and    $0x3,%eax
  802b50:	83 f8 01             	cmp    $0x1,%eax
  802b53:	75 3a                	jne    802b8f <read+0xa6>
  802b55:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802b5c:	00 00 00 
  802b5f:	48 8b 00             	mov    (%rax),%rax
  802b62:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b68:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802b6b:	89 c6                	mov    %eax,%esi
  802b6d:	48 bf 97 51 80 00 00 	movabs $0x805197,%rdi
  802b74:	00 00 00 
  802b77:	b8 00 00 00 00       	mov    $0x0,%eax
  802b7c:	48 b9 fa 06 80 00 00 	movabs $0x8006fa,%rcx
  802b83:	00 00 00 
  802b86:	ff d1                	callq  *%rcx
  802b88:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b8d:	eb 2d                	jmp    802bbc <read+0xd3>
  802b8f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b93:	48 8b 40 10          	mov    0x10(%rax),%rax
  802b97:	48 85 c0             	test   %rax,%rax
  802b9a:	75 07                	jne    802ba3 <read+0xba>
  802b9c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ba1:	eb 19                	jmp    802bbc <read+0xd3>
  802ba3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ba7:	48 8b 40 10          	mov    0x10(%rax),%rax
  802bab:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802baf:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802bb3:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802bb7:	48 89 cf             	mov    %rcx,%rdi
  802bba:	ff d0                	callq  *%rax
  802bbc:	c9                   	leaveq 
  802bbd:	c3                   	retq   

0000000000802bbe <readn>:
  802bbe:	55                   	push   %rbp
  802bbf:	48 89 e5             	mov    %rsp,%rbp
  802bc2:	48 83 ec 30          	sub    $0x30,%rsp
  802bc6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802bc9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802bcd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802bd1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802bd8:	eb 47                	jmp    802c21 <readn+0x63>
  802bda:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bdd:	48 98                	cltq   
  802bdf:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802be3:	48 29 c2             	sub    %rax,%rdx
  802be6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802be9:	48 63 c8             	movslq %eax,%rcx
  802bec:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802bf0:	48 01 c1             	add    %rax,%rcx
  802bf3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bf6:	48 89 ce             	mov    %rcx,%rsi
  802bf9:	89 c7                	mov    %eax,%edi
  802bfb:	48 b8 e9 2a 80 00 00 	movabs $0x802ae9,%rax
  802c02:	00 00 00 
  802c05:	ff d0                	callq  *%rax
  802c07:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c0a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c0e:	79 05                	jns    802c15 <readn+0x57>
  802c10:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c13:	eb 1d                	jmp    802c32 <readn+0x74>
  802c15:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c19:	74 13                	je     802c2e <readn+0x70>
  802c1b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c1e:	01 45 fc             	add    %eax,-0x4(%rbp)
  802c21:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c24:	48 98                	cltq   
  802c26:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802c2a:	72 ae                	jb     802bda <readn+0x1c>
  802c2c:	eb 01                	jmp    802c2f <readn+0x71>
  802c2e:	90                   	nop
  802c2f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c32:	c9                   	leaveq 
  802c33:	c3                   	retq   

0000000000802c34 <write>:
  802c34:	55                   	push   %rbp
  802c35:	48 89 e5             	mov    %rsp,%rbp
  802c38:	48 83 ec 40          	sub    $0x40,%rsp
  802c3c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c3f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802c43:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802c47:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c4b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802c4e:	48 89 d6             	mov    %rdx,%rsi
  802c51:	89 c7                	mov    %eax,%edi
  802c53:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  802c5a:	00 00 00 
  802c5d:	ff d0                	callq  *%rax
  802c5f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c62:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c66:	78 24                	js     802c8c <write+0x58>
  802c68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c6c:	8b 00                	mov    (%rax),%eax
  802c6e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c72:	48 89 d6             	mov    %rdx,%rsi
  802c75:	89 c7                	mov    %eax,%edi
  802c77:	48 b8 0f 28 80 00 00 	movabs $0x80280f,%rax
  802c7e:	00 00 00 
  802c81:	ff d0                	callq  *%rax
  802c83:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c86:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c8a:	79 05                	jns    802c91 <write+0x5d>
  802c8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c8f:	eb 75                	jmp    802d06 <write+0xd2>
  802c91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c95:	8b 40 08             	mov    0x8(%rax),%eax
  802c98:	83 e0 03             	and    $0x3,%eax
  802c9b:	85 c0                	test   %eax,%eax
  802c9d:	75 3a                	jne    802cd9 <write+0xa5>
  802c9f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802ca6:	00 00 00 
  802ca9:	48 8b 00             	mov    (%rax),%rax
  802cac:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802cb2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802cb5:	89 c6                	mov    %eax,%esi
  802cb7:	48 bf b3 51 80 00 00 	movabs $0x8051b3,%rdi
  802cbe:	00 00 00 
  802cc1:	b8 00 00 00 00       	mov    $0x0,%eax
  802cc6:	48 b9 fa 06 80 00 00 	movabs $0x8006fa,%rcx
  802ccd:	00 00 00 
  802cd0:	ff d1                	callq  *%rcx
  802cd2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802cd7:	eb 2d                	jmp    802d06 <write+0xd2>
  802cd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cdd:	48 8b 40 18          	mov    0x18(%rax),%rax
  802ce1:	48 85 c0             	test   %rax,%rax
  802ce4:	75 07                	jne    802ced <write+0xb9>
  802ce6:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ceb:	eb 19                	jmp    802d06 <write+0xd2>
  802ced:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cf1:	48 8b 40 18          	mov    0x18(%rax),%rax
  802cf5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802cf9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802cfd:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802d01:	48 89 cf             	mov    %rcx,%rdi
  802d04:	ff d0                	callq  *%rax
  802d06:	c9                   	leaveq 
  802d07:	c3                   	retq   

0000000000802d08 <seek>:
  802d08:	55                   	push   %rbp
  802d09:	48 89 e5             	mov    %rsp,%rbp
  802d0c:	48 83 ec 18          	sub    $0x18,%rsp
  802d10:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d13:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802d16:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d1a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d1d:	48 89 d6             	mov    %rdx,%rsi
  802d20:	89 c7                	mov    %eax,%edi
  802d22:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  802d29:	00 00 00 
  802d2c:	ff d0                	callq  *%rax
  802d2e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d31:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d35:	79 05                	jns    802d3c <seek+0x34>
  802d37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d3a:	eb 0f                	jmp    802d4b <seek+0x43>
  802d3c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d40:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802d43:	89 50 04             	mov    %edx,0x4(%rax)
  802d46:	b8 00 00 00 00       	mov    $0x0,%eax
  802d4b:	c9                   	leaveq 
  802d4c:	c3                   	retq   

0000000000802d4d <ftruncate>:
  802d4d:	55                   	push   %rbp
  802d4e:	48 89 e5             	mov    %rsp,%rbp
  802d51:	48 83 ec 30          	sub    $0x30,%rsp
  802d55:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d58:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802d5b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d5f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d62:	48 89 d6             	mov    %rdx,%rsi
  802d65:	89 c7                	mov    %eax,%edi
  802d67:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  802d6e:	00 00 00 
  802d71:	ff d0                	callq  *%rax
  802d73:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d76:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d7a:	78 24                	js     802da0 <ftruncate+0x53>
  802d7c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d80:	8b 00                	mov    (%rax),%eax
  802d82:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d86:	48 89 d6             	mov    %rdx,%rsi
  802d89:	89 c7                	mov    %eax,%edi
  802d8b:	48 b8 0f 28 80 00 00 	movabs $0x80280f,%rax
  802d92:	00 00 00 
  802d95:	ff d0                	callq  *%rax
  802d97:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d9a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d9e:	79 05                	jns    802da5 <ftruncate+0x58>
  802da0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802da3:	eb 72                	jmp    802e17 <ftruncate+0xca>
  802da5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802da9:	8b 40 08             	mov    0x8(%rax),%eax
  802dac:	83 e0 03             	and    $0x3,%eax
  802daf:	85 c0                	test   %eax,%eax
  802db1:	75 3a                	jne    802ded <ftruncate+0xa0>
  802db3:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802dba:	00 00 00 
  802dbd:	48 8b 00             	mov    (%rax),%rax
  802dc0:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802dc6:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802dc9:	89 c6                	mov    %eax,%esi
  802dcb:	48 bf d0 51 80 00 00 	movabs $0x8051d0,%rdi
  802dd2:	00 00 00 
  802dd5:	b8 00 00 00 00       	mov    $0x0,%eax
  802dda:	48 b9 fa 06 80 00 00 	movabs $0x8006fa,%rcx
  802de1:	00 00 00 
  802de4:	ff d1                	callq  *%rcx
  802de6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802deb:	eb 2a                	jmp    802e17 <ftruncate+0xca>
  802ded:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802df1:	48 8b 40 30          	mov    0x30(%rax),%rax
  802df5:	48 85 c0             	test   %rax,%rax
  802df8:	75 07                	jne    802e01 <ftruncate+0xb4>
  802dfa:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802dff:	eb 16                	jmp    802e17 <ftruncate+0xca>
  802e01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e05:	48 8b 40 30          	mov    0x30(%rax),%rax
  802e09:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802e0d:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802e10:	89 ce                	mov    %ecx,%esi
  802e12:	48 89 d7             	mov    %rdx,%rdi
  802e15:	ff d0                	callq  *%rax
  802e17:	c9                   	leaveq 
  802e18:	c3                   	retq   

0000000000802e19 <fstat>:
  802e19:	55                   	push   %rbp
  802e1a:	48 89 e5             	mov    %rsp,%rbp
  802e1d:	48 83 ec 30          	sub    $0x30,%rsp
  802e21:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e24:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e28:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e2c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e2f:	48 89 d6             	mov    %rdx,%rsi
  802e32:	89 c7                	mov    %eax,%edi
  802e34:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  802e3b:	00 00 00 
  802e3e:	ff d0                	callq  *%rax
  802e40:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e43:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e47:	78 24                	js     802e6d <fstat+0x54>
  802e49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e4d:	8b 00                	mov    (%rax),%eax
  802e4f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e53:	48 89 d6             	mov    %rdx,%rsi
  802e56:	89 c7                	mov    %eax,%edi
  802e58:	48 b8 0f 28 80 00 00 	movabs $0x80280f,%rax
  802e5f:	00 00 00 
  802e62:	ff d0                	callq  *%rax
  802e64:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e67:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e6b:	79 05                	jns    802e72 <fstat+0x59>
  802e6d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e70:	eb 5e                	jmp    802ed0 <fstat+0xb7>
  802e72:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e76:	48 8b 40 28          	mov    0x28(%rax),%rax
  802e7a:	48 85 c0             	test   %rax,%rax
  802e7d:	75 07                	jne    802e86 <fstat+0x6d>
  802e7f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e84:	eb 4a                	jmp    802ed0 <fstat+0xb7>
  802e86:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e8a:	c6 00 00             	movb   $0x0,(%rax)
  802e8d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e91:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802e98:	00 00 00 
  802e9b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e9f:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802ea6:	00 00 00 
  802ea9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802ead:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802eb1:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802eb8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ebc:	48 8b 40 28          	mov    0x28(%rax),%rax
  802ec0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802ec4:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802ec8:	48 89 ce             	mov    %rcx,%rsi
  802ecb:	48 89 d7             	mov    %rdx,%rdi
  802ece:	ff d0                	callq  *%rax
  802ed0:	c9                   	leaveq 
  802ed1:	c3                   	retq   

0000000000802ed2 <stat>:
  802ed2:	55                   	push   %rbp
  802ed3:	48 89 e5             	mov    %rsp,%rbp
  802ed6:	48 83 ec 20          	sub    $0x20,%rsp
  802eda:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ede:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ee2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ee6:	be 00 00 00 00       	mov    $0x0,%esi
  802eeb:	48 89 c7             	mov    %rax,%rdi
  802eee:	48 b8 c2 2f 80 00 00 	movabs $0x802fc2,%rax
  802ef5:	00 00 00 
  802ef8:	ff d0                	callq  *%rax
  802efa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802efd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f01:	79 05                	jns    802f08 <stat+0x36>
  802f03:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f06:	eb 2f                	jmp    802f37 <stat+0x65>
  802f08:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802f0c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f0f:	48 89 d6             	mov    %rdx,%rsi
  802f12:	89 c7                	mov    %eax,%edi
  802f14:	48 b8 19 2e 80 00 00 	movabs $0x802e19,%rax
  802f1b:	00 00 00 
  802f1e:	ff d0                	callq  *%rax
  802f20:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802f23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f26:	89 c7                	mov    %eax,%edi
  802f28:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  802f2f:	00 00 00 
  802f32:	ff d0                	callq  *%rax
  802f34:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f37:	c9                   	leaveq 
  802f38:	c3                   	retq   

0000000000802f39 <fsipc>:
  802f39:	55                   	push   %rbp
  802f3a:	48 89 e5             	mov    %rsp,%rbp
  802f3d:	48 83 ec 10          	sub    $0x10,%rsp
  802f41:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802f44:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802f48:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f4f:	00 00 00 
  802f52:	8b 00                	mov    (%rax),%eax
  802f54:	85 c0                	test   %eax,%eax
  802f56:	75 1f                	jne    802f77 <fsipc+0x3e>
  802f58:	bf 01 00 00 00       	mov    $0x1,%edi
  802f5d:	48 b8 70 49 80 00 00 	movabs $0x804970,%rax
  802f64:	00 00 00 
  802f67:	ff d0                	callq  *%rax
  802f69:	89 c2                	mov    %eax,%edx
  802f6b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f72:	00 00 00 
  802f75:	89 10                	mov    %edx,(%rax)
  802f77:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f7e:	00 00 00 
  802f81:	8b 00                	mov    (%rax),%eax
  802f83:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802f86:	b9 07 00 00 00       	mov    $0x7,%ecx
  802f8b:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802f92:	00 00 00 
  802f95:	89 c7                	mov    %eax,%edi
  802f97:	48 b8 66 48 80 00 00 	movabs $0x804866,%rax
  802f9e:	00 00 00 
  802fa1:	ff d0                	callq  *%rax
  802fa3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fa7:	ba 00 00 00 00       	mov    $0x0,%edx
  802fac:	48 89 c6             	mov    %rax,%rsi
  802faf:	bf 00 00 00 00       	mov    $0x0,%edi
  802fb4:	48 b8 a5 47 80 00 00 	movabs $0x8047a5,%rax
  802fbb:	00 00 00 
  802fbe:	ff d0                	callq  *%rax
  802fc0:	c9                   	leaveq 
  802fc1:	c3                   	retq   

0000000000802fc2 <open>:
  802fc2:	55                   	push   %rbp
  802fc3:	48 89 e5             	mov    %rsp,%rbp
  802fc6:	48 83 ec 20          	sub    $0x20,%rsp
  802fca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802fce:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802fd1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fd5:	48 89 c7             	mov    %rax,%rdi
  802fd8:	48 b8 1e 12 80 00 00 	movabs $0x80121e,%rax
  802fdf:	00 00 00 
  802fe2:	ff d0                	callq  *%rax
  802fe4:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802fe9:	7e 0a                	jle    802ff5 <open+0x33>
  802feb:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802ff0:	e9 a5 00 00 00       	jmpq   80309a <open+0xd8>
  802ff5:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802ff9:	48 89 c7             	mov    %rax,%rdi
  802ffc:	48 b8 1c 26 80 00 00 	movabs $0x80261c,%rax
  803003:	00 00 00 
  803006:	ff d0                	callq  *%rax
  803008:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80300b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80300f:	79 08                	jns    803019 <open+0x57>
  803011:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803014:	e9 81 00 00 00       	jmpq   80309a <open+0xd8>
  803019:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80301d:	48 89 c6             	mov    %rax,%rsi
  803020:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803027:	00 00 00 
  80302a:	48 b8 8a 12 80 00 00 	movabs $0x80128a,%rax
  803031:	00 00 00 
  803034:	ff d0                	callq  *%rax
  803036:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80303d:	00 00 00 
  803040:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803043:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803049:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80304d:	48 89 c6             	mov    %rax,%rsi
  803050:	bf 01 00 00 00       	mov    $0x1,%edi
  803055:	48 b8 39 2f 80 00 00 	movabs $0x802f39,%rax
  80305c:	00 00 00 
  80305f:	ff d0                	callq  *%rax
  803061:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803064:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803068:	79 1d                	jns    803087 <open+0xc5>
  80306a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80306e:	be 00 00 00 00       	mov    $0x0,%esi
  803073:	48 89 c7             	mov    %rax,%rdi
  803076:	48 b8 44 27 80 00 00 	movabs $0x802744,%rax
  80307d:	00 00 00 
  803080:	ff d0                	callq  *%rax
  803082:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803085:	eb 13                	jmp    80309a <open+0xd8>
  803087:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80308b:	48 89 c7             	mov    %rax,%rdi
  80308e:	48 b8 ce 25 80 00 00 	movabs $0x8025ce,%rax
  803095:	00 00 00 
  803098:	ff d0                	callq  *%rax
  80309a:	c9                   	leaveq 
  80309b:	c3                   	retq   

000000000080309c <devfile_flush>:
  80309c:	55                   	push   %rbp
  80309d:	48 89 e5             	mov    %rsp,%rbp
  8030a0:	48 83 ec 10          	sub    $0x10,%rsp
  8030a4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030ac:	8b 50 0c             	mov    0xc(%rax),%edx
  8030af:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030b6:	00 00 00 
  8030b9:	89 10                	mov    %edx,(%rax)
  8030bb:	be 00 00 00 00       	mov    $0x0,%esi
  8030c0:	bf 06 00 00 00       	mov    $0x6,%edi
  8030c5:	48 b8 39 2f 80 00 00 	movabs $0x802f39,%rax
  8030cc:	00 00 00 
  8030cf:	ff d0                	callq  *%rax
  8030d1:	c9                   	leaveq 
  8030d2:	c3                   	retq   

00000000008030d3 <devfile_read>:
  8030d3:	55                   	push   %rbp
  8030d4:	48 89 e5             	mov    %rsp,%rbp
  8030d7:	48 83 ec 30          	sub    $0x30,%rsp
  8030db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8030df:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030e3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8030e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030eb:	8b 50 0c             	mov    0xc(%rax),%edx
  8030ee:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030f5:	00 00 00 
  8030f8:	89 10                	mov    %edx,(%rax)
  8030fa:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803101:	00 00 00 
  803104:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803108:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80310c:	be 00 00 00 00       	mov    $0x0,%esi
  803111:	bf 03 00 00 00       	mov    $0x3,%edi
  803116:	48 b8 39 2f 80 00 00 	movabs $0x802f39,%rax
  80311d:	00 00 00 
  803120:	ff d0                	callq  *%rax
  803122:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803125:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803129:	79 08                	jns    803133 <devfile_read+0x60>
  80312b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80312e:	e9 a4 00 00 00       	jmpq   8031d7 <devfile_read+0x104>
  803133:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803136:	48 98                	cltq   
  803138:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80313c:	76 35                	jbe    803173 <devfile_read+0xa0>
  80313e:	48 b9 f6 51 80 00 00 	movabs $0x8051f6,%rcx
  803145:	00 00 00 
  803148:	48 ba fd 51 80 00 00 	movabs $0x8051fd,%rdx
  80314f:	00 00 00 
  803152:	be 89 00 00 00       	mov    $0x89,%esi
  803157:	48 bf 12 52 80 00 00 	movabs $0x805212,%rdi
  80315e:	00 00 00 
  803161:	b8 00 00 00 00       	mov    $0x0,%eax
  803166:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  80316d:	00 00 00 
  803170:	41 ff d0             	callq  *%r8
  803173:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80317a:	7e 35                	jle    8031b1 <devfile_read+0xde>
  80317c:	48 b9 20 52 80 00 00 	movabs $0x805220,%rcx
  803183:	00 00 00 
  803186:	48 ba fd 51 80 00 00 	movabs $0x8051fd,%rdx
  80318d:	00 00 00 
  803190:	be 8a 00 00 00       	mov    $0x8a,%esi
  803195:	48 bf 12 52 80 00 00 	movabs $0x805212,%rdi
  80319c:	00 00 00 
  80319f:	b8 00 00 00 00       	mov    $0x0,%eax
  8031a4:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  8031ab:	00 00 00 
  8031ae:	41 ff d0             	callq  *%r8
  8031b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031b4:	48 63 d0             	movslq %eax,%rdx
  8031b7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031bb:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8031c2:	00 00 00 
  8031c5:	48 89 c7             	mov    %rax,%rdi
  8031c8:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  8031cf:	00 00 00 
  8031d2:	ff d0                	callq  *%rax
  8031d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031d7:	c9                   	leaveq 
  8031d8:	c3                   	retq   

00000000008031d9 <devfile_write>:
  8031d9:	55                   	push   %rbp
  8031da:	48 89 e5             	mov    %rsp,%rbp
  8031dd:	48 83 ec 40          	sub    $0x40,%rsp
  8031e1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8031e5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8031e9:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8031ed:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8031f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8031f5:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8031fc:	00 
  8031fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803201:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  803205:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  80320a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80320e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803212:	8b 50 0c             	mov    0xc(%rax),%edx
  803215:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80321c:	00 00 00 
  80321f:	89 10                	mov    %edx,(%rax)
  803221:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803228:	00 00 00 
  80322b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80322f:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803233:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803237:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80323b:	48 89 c6             	mov    %rax,%rsi
  80323e:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803245:	00 00 00 
  803248:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  80324f:	00 00 00 
  803252:	ff d0                	callq  *%rax
  803254:	be 00 00 00 00       	mov    $0x0,%esi
  803259:	bf 04 00 00 00       	mov    $0x4,%edi
  80325e:	48 b8 39 2f 80 00 00 	movabs $0x802f39,%rax
  803265:	00 00 00 
  803268:	ff d0                	callq  *%rax
  80326a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80326d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803271:	79 05                	jns    803278 <devfile_write+0x9f>
  803273:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803276:	eb 43                	jmp    8032bb <devfile_write+0xe2>
  803278:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80327b:	48 98                	cltq   
  80327d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803281:	76 35                	jbe    8032b8 <devfile_write+0xdf>
  803283:	48 b9 f6 51 80 00 00 	movabs $0x8051f6,%rcx
  80328a:	00 00 00 
  80328d:	48 ba fd 51 80 00 00 	movabs $0x8051fd,%rdx
  803294:	00 00 00 
  803297:	be a8 00 00 00       	mov    $0xa8,%esi
  80329c:	48 bf 12 52 80 00 00 	movabs $0x805212,%rdi
  8032a3:	00 00 00 
  8032a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8032ab:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  8032b2:	00 00 00 
  8032b5:	41 ff d0             	callq  *%r8
  8032b8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032bb:	c9                   	leaveq 
  8032bc:	c3                   	retq   

00000000008032bd <devfile_stat>:
  8032bd:	55                   	push   %rbp
  8032be:	48 89 e5             	mov    %rsp,%rbp
  8032c1:	48 83 ec 20          	sub    $0x20,%rsp
  8032c5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8032c9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032d1:	8b 50 0c             	mov    0xc(%rax),%edx
  8032d4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8032db:	00 00 00 
  8032de:	89 10                	mov    %edx,(%rax)
  8032e0:	be 00 00 00 00       	mov    $0x0,%esi
  8032e5:	bf 05 00 00 00       	mov    $0x5,%edi
  8032ea:	48 b8 39 2f 80 00 00 	movabs $0x802f39,%rax
  8032f1:	00 00 00 
  8032f4:	ff d0                	callq  *%rax
  8032f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032fd:	79 05                	jns    803304 <devfile_stat+0x47>
  8032ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803302:	eb 56                	jmp    80335a <devfile_stat+0x9d>
  803304:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803308:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  80330f:	00 00 00 
  803312:	48 89 c7             	mov    %rax,%rdi
  803315:	48 b8 8a 12 80 00 00 	movabs $0x80128a,%rax
  80331c:	00 00 00 
  80331f:	ff d0                	callq  *%rax
  803321:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803328:	00 00 00 
  80332b:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803331:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803335:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80333b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803342:	00 00 00 
  803345:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80334b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80334f:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803355:	b8 00 00 00 00       	mov    $0x0,%eax
  80335a:	c9                   	leaveq 
  80335b:	c3                   	retq   

000000000080335c <devfile_trunc>:
  80335c:	55                   	push   %rbp
  80335d:	48 89 e5             	mov    %rsp,%rbp
  803360:	48 83 ec 10          	sub    $0x10,%rsp
  803364:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803368:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80336b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80336f:	8b 50 0c             	mov    0xc(%rax),%edx
  803372:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803379:	00 00 00 
  80337c:	89 10                	mov    %edx,(%rax)
  80337e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803385:	00 00 00 
  803388:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80338b:	89 50 04             	mov    %edx,0x4(%rax)
  80338e:	be 00 00 00 00       	mov    $0x0,%esi
  803393:	bf 02 00 00 00       	mov    $0x2,%edi
  803398:	48 b8 39 2f 80 00 00 	movabs $0x802f39,%rax
  80339f:	00 00 00 
  8033a2:	ff d0                	callq  *%rax
  8033a4:	c9                   	leaveq 
  8033a5:	c3                   	retq   

00000000008033a6 <remove>:
  8033a6:	55                   	push   %rbp
  8033a7:	48 89 e5             	mov    %rsp,%rbp
  8033aa:	48 83 ec 10          	sub    $0x10,%rsp
  8033ae:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8033b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033b6:	48 89 c7             	mov    %rax,%rdi
  8033b9:	48 b8 1e 12 80 00 00 	movabs $0x80121e,%rax
  8033c0:	00 00 00 
  8033c3:	ff d0                	callq  *%rax
  8033c5:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8033ca:	7e 07                	jle    8033d3 <remove+0x2d>
  8033cc:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8033d1:	eb 33                	jmp    803406 <remove+0x60>
  8033d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033d7:	48 89 c6             	mov    %rax,%rsi
  8033da:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8033e1:	00 00 00 
  8033e4:	48 b8 8a 12 80 00 00 	movabs $0x80128a,%rax
  8033eb:	00 00 00 
  8033ee:	ff d0                	callq  *%rax
  8033f0:	be 00 00 00 00       	mov    $0x0,%esi
  8033f5:	bf 07 00 00 00       	mov    $0x7,%edi
  8033fa:	48 b8 39 2f 80 00 00 	movabs $0x802f39,%rax
  803401:	00 00 00 
  803404:	ff d0                	callq  *%rax
  803406:	c9                   	leaveq 
  803407:	c3                   	retq   

0000000000803408 <sync>:
  803408:	55                   	push   %rbp
  803409:	48 89 e5             	mov    %rsp,%rbp
  80340c:	be 00 00 00 00       	mov    $0x0,%esi
  803411:	bf 08 00 00 00       	mov    $0x8,%edi
  803416:	48 b8 39 2f 80 00 00 	movabs $0x802f39,%rax
  80341d:	00 00 00 
  803420:	ff d0                	callq  *%rax
  803422:	5d                   	pop    %rbp
  803423:	c3                   	retq   

0000000000803424 <copy>:
  803424:	55                   	push   %rbp
  803425:	48 89 e5             	mov    %rsp,%rbp
  803428:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80342f:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803436:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80343d:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803444:	be 00 00 00 00       	mov    $0x0,%esi
  803449:	48 89 c7             	mov    %rax,%rdi
  80344c:	48 b8 c2 2f 80 00 00 	movabs $0x802fc2,%rax
  803453:	00 00 00 
  803456:	ff d0                	callq  *%rax
  803458:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80345b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80345f:	79 28                	jns    803489 <copy+0x65>
  803461:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803464:	89 c6                	mov    %eax,%esi
  803466:	48 bf 2c 52 80 00 00 	movabs $0x80522c,%rdi
  80346d:	00 00 00 
  803470:	b8 00 00 00 00       	mov    $0x0,%eax
  803475:	48 ba fa 06 80 00 00 	movabs $0x8006fa,%rdx
  80347c:	00 00 00 
  80347f:	ff d2                	callq  *%rdx
  803481:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803484:	e9 76 01 00 00       	jmpq   8035ff <copy+0x1db>
  803489:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803490:	be 01 01 00 00       	mov    $0x101,%esi
  803495:	48 89 c7             	mov    %rax,%rdi
  803498:	48 b8 c2 2f 80 00 00 	movabs $0x802fc2,%rax
  80349f:	00 00 00 
  8034a2:	ff d0                	callq  *%rax
  8034a4:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8034a7:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8034ab:	0f 89 ad 00 00 00    	jns    80355e <copy+0x13a>
  8034b1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034b4:	89 c6                	mov    %eax,%esi
  8034b6:	48 bf 42 52 80 00 00 	movabs $0x805242,%rdi
  8034bd:	00 00 00 
  8034c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8034c5:	48 ba fa 06 80 00 00 	movabs $0x8006fa,%rdx
  8034cc:	00 00 00 
  8034cf:	ff d2                	callq  *%rdx
  8034d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034d4:	89 c7                	mov    %eax,%edi
  8034d6:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  8034dd:	00 00 00 
  8034e0:	ff d0                	callq  *%rax
  8034e2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034e5:	e9 15 01 00 00       	jmpq   8035ff <copy+0x1db>
  8034ea:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8034ed:	48 63 d0             	movslq %eax,%rdx
  8034f0:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8034f7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034fa:	48 89 ce             	mov    %rcx,%rsi
  8034fd:	89 c7                	mov    %eax,%edi
  8034ff:	48 b8 34 2c 80 00 00 	movabs $0x802c34,%rax
  803506:	00 00 00 
  803509:	ff d0                	callq  *%rax
  80350b:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80350e:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803512:	79 4a                	jns    80355e <copy+0x13a>
  803514:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803517:	89 c6                	mov    %eax,%esi
  803519:	48 bf 5c 52 80 00 00 	movabs $0x80525c,%rdi
  803520:	00 00 00 
  803523:	b8 00 00 00 00       	mov    $0x0,%eax
  803528:	48 ba fa 06 80 00 00 	movabs $0x8006fa,%rdx
  80352f:	00 00 00 
  803532:	ff d2                	callq  *%rdx
  803534:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803537:	89 c7                	mov    %eax,%edi
  803539:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  803540:	00 00 00 
  803543:	ff d0                	callq  *%rax
  803545:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803548:	89 c7                	mov    %eax,%edi
  80354a:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  803551:	00 00 00 
  803554:	ff d0                	callq  *%rax
  803556:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803559:	e9 a1 00 00 00       	jmpq   8035ff <copy+0x1db>
  80355e:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803565:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803568:	ba 00 02 00 00       	mov    $0x200,%edx
  80356d:	48 89 ce             	mov    %rcx,%rsi
  803570:	89 c7                	mov    %eax,%edi
  803572:	48 b8 e9 2a 80 00 00 	movabs $0x802ae9,%rax
  803579:	00 00 00 
  80357c:	ff d0                	callq  *%rax
  80357e:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803581:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803585:	0f 8f 5f ff ff ff    	jg     8034ea <copy+0xc6>
  80358b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80358f:	79 47                	jns    8035d8 <copy+0x1b4>
  803591:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803594:	89 c6                	mov    %eax,%esi
  803596:	48 bf 6f 52 80 00 00 	movabs $0x80526f,%rdi
  80359d:	00 00 00 
  8035a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8035a5:	48 ba fa 06 80 00 00 	movabs $0x8006fa,%rdx
  8035ac:	00 00 00 
  8035af:	ff d2                	callq  *%rdx
  8035b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035b4:	89 c7                	mov    %eax,%edi
  8035b6:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  8035bd:	00 00 00 
  8035c0:	ff d0                	callq  *%rax
  8035c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035c5:	89 c7                	mov    %eax,%edi
  8035c7:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  8035ce:	00 00 00 
  8035d1:	ff d0                	callq  *%rax
  8035d3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8035d6:	eb 27                	jmp    8035ff <copy+0x1db>
  8035d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035db:	89 c7                	mov    %eax,%edi
  8035dd:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  8035e4:	00 00 00 
  8035e7:	ff d0                	callq  *%rax
  8035e9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035ec:	89 c7                	mov    %eax,%edi
  8035ee:	48 b8 c6 28 80 00 00 	movabs $0x8028c6,%rax
  8035f5:	00 00 00 
  8035f8:	ff d0                	callq  *%rax
  8035fa:	b8 00 00 00 00       	mov    $0x0,%eax
  8035ff:	c9                   	leaveq 
  803600:	c3                   	retq   

0000000000803601 <fd2sockid>:
  803601:	55                   	push   %rbp
  803602:	48 89 e5             	mov    %rsp,%rbp
  803605:	48 83 ec 20          	sub    $0x20,%rsp
  803609:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80360c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803610:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803613:	48 89 d6             	mov    %rdx,%rsi
  803616:	89 c7                	mov    %eax,%edi
  803618:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  80361f:	00 00 00 
  803622:	ff d0                	callq  *%rax
  803624:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803627:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80362b:	79 05                	jns    803632 <fd2sockid+0x31>
  80362d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803630:	eb 24                	jmp    803656 <fd2sockid+0x55>
  803632:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803636:	8b 10                	mov    (%rax),%edx
  803638:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  80363f:	00 00 00 
  803642:	8b 00                	mov    (%rax),%eax
  803644:	39 c2                	cmp    %eax,%edx
  803646:	74 07                	je     80364f <fd2sockid+0x4e>
  803648:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80364d:	eb 07                	jmp    803656 <fd2sockid+0x55>
  80364f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803653:	8b 40 0c             	mov    0xc(%rax),%eax
  803656:	c9                   	leaveq 
  803657:	c3                   	retq   

0000000000803658 <alloc_sockfd>:
  803658:	55                   	push   %rbp
  803659:	48 89 e5             	mov    %rsp,%rbp
  80365c:	48 83 ec 20          	sub    $0x20,%rsp
  803660:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803663:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803667:	48 89 c7             	mov    %rax,%rdi
  80366a:	48 b8 1c 26 80 00 00 	movabs $0x80261c,%rax
  803671:	00 00 00 
  803674:	ff d0                	callq  *%rax
  803676:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803679:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80367d:	78 26                	js     8036a5 <alloc_sockfd+0x4d>
  80367f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803683:	ba 07 04 00 00       	mov    $0x407,%edx
  803688:	48 89 c6             	mov    %rax,%rsi
  80368b:	bf 00 00 00 00       	mov    $0x0,%edi
  803690:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  803697:	00 00 00 
  80369a:	ff d0                	callq  *%rax
  80369c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80369f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036a3:	79 16                	jns    8036bb <alloc_sockfd+0x63>
  8036a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036a8:	89 c7                	mov    %eax,%edi
  8036aa:	48 b8 67 3b 80 00 00 	movabs $0x803b67,%rax
  8036b1:	00 00 00 
  8036b4:	ff d0                	callq  *%rax
  8036b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036b9:	eb 3a                	jmp    8036f5 <alloc_sockfd+0x9d>
  8036bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036bf:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8036c6:	00 00 00 
  8036c9:	8b 12                	mov    (%rdx),%edx
  8036cb:	89 10                	mov    %edx,(%rax)
  8036cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036d1:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8036d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036dc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8036df:	89 50 0c             	mov    %edx,0xc(%rax)
  8036e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036e6:	48 89 c7             	mov    %rax,%rdi
  8036e9:	48 b8 ce 25 80 00 00 	movabs $0x8025ce,%rax
  8036f0:	00 00 00 
  8036f3:	ff d0                	callq  *%rax
  8036f5:	c9                   	leaveq 
  8036f6:	c3                   	retq   

00000000008036f7 <accept>:
  8036f7:	55                   	push   %rbp
  8036f8:	48 89 e5             	mov    %rsp,%rbp
  8036fb:	48 83 ec 30          	sub    $0x30,%rsp
  8036ff:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803702:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803706:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80370a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80370d:	89 c7                	mov    %eax,%edi
  80370f:	48 b8 01 36 80 00 00 	movabs $0x803601,%rax
  803716:	00 00 00 
  803719:	ff d0                	callq  *%rax
  80371b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80371e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803722:	79 05                	jns    803729 <accept+0x32>
  803724:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803727:	eb 3b                	jmp    803764 <accept+0x6d>
  803729:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80372d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803731:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803734:	48 89 ce             	mov    %rcx,%rsi
  803737:	89 c7                	mov    %eax,%edi
  803739:	48 b8 44 3a 80 00 00 	movabs $0x803a44,%rax
  803740:	00 00 00 
  803743:	ff d0                	callq  *%rax
  803745:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803748:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80374c:	79 05                	jns    803753 <accept+0x5c>
  80374e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803751:	eb 11                	jmp    803764 <accept+0x6d>
  803753:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803756:	89 c7                	mov    %eax,%edi
  803758:	48 b8 58 36 80 00 00 	movabs $0x803658,%rax
  80375f:	00 00 00 
  803762:	ff d0                	callq  *%rax
  803764:	c9                   	leaveq 
  803765:	c3                   	retq   

0000000000803766 <bind>:
  803766:	55                   	push   %rbp
  803767:	48 89 e5             	mov    %rsp,%rbp
  80376a:	48 83 ec 20          	sub    $0x20,%rsp
  80376e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803771:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803775:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803778:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80377b:	89 c7                	mov    %eax,%edi
  80377d:	48 b8 01 36 80 00 00 	movabs $0x803601,%rax
  803784:	00 00 00 
  803787:	ff d0                	callq  *%rax
  803789:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80378c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803790:	79 05                	jns    803797 <bind+0x31>
  803792:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803795:	eb 1b                	jmp    8037b2 <bind+0x4c>
  803797:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80379a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80379e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037a1:	48 89 ce             	mov    %rcx,%rsi
  8037a4:	89 c7                	mov    %eax,%edi
  8037a6:	48 b8 c3 3a 80 00 00 	movabs $0x803ac3,%rax
  8037ad:	00 00 00 
  8037b0:	ff d0                	callq  *%rax
  8037b2:	c9                   	leaveq 
  8037b3:	c3                   	retq   

00000000008037b4 <shutdown>:
  8037b4:	55                   	push   %rbp
  8037b5:	48 89 e5             	mov    %rsp,%rbp
  8037b8:	48 83 ec 20          	sub    $0x20,%rsp
  8037bc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037bf:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8037c2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037c5:	89 c7                	mov    %eax,%edi
  8037c7:	48 b8 01 36 80 00 00 	movabs $0x803601,%rax
  8037ce:	00 00 00 
  8037d1:	ff d0                	callq  *%rax
  8037d3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037d6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037da:	79 05                	jns    8037e1 <shutdown+0x2d>
  8037dc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037df:	eb 16                	jmp    8037f7 <shutdown+0x43>
  8037e1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8037e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037e7:	89 d6                	mov    %edx,%esi
  8037e9:	89 c7                	mov    %eax,%edi
  8037eb:	48 b8 27 3b 80 00 00 	movabs $0x803b27,%rax
  8037f2:	00 00 00 
  8037f5:	ff d0                	callq  *%rax
  8037f7:	c9                   	leaveq 
  8037f8:	c3                   	retq   

00000000008037f9 <devsock_close>:
  8037f9:	55                   	push   %rbp
  8037fa:	48 89 e5             	mov    %rsp,%rbp
  8037fd:	48 83 ec 10          	sub    $0x10,%rsp
  803801:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803805:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803809:	48 89 c7             	mov    %rax,%rdi
  80380c:	48 b8 e1 49 80 00 00 	movabs $0x8049e1,%rax
  803813:	00 00 00 
  803816:	ff d0                	callq  *%rax
  803818:	83 f8 01             	cmp    $0x1,%eax
  80381b:	75 17                	jne    803834 <devsock_close+0x3b>
  80381d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803821:	8b 40 0c             	mov    0xc(%rax),%eax
  803824:	89 c7                	mov    %eax,%edi
  803826:	48 b8 67 3b 80 00 00 	movabs $0x803b67,%rax
  80382d:	00 00 00 
  803830:	ff d0                	callq  *%rax
  803832:	eb 05                	jmp    803839 <devsock_close+0x40>
  803834:	b8 00 00 00 00       	mov    $0x0,%eax
  803839:	c9                   	leaveq 
  80383a:	c3                   	retq   

000000000080383b <connect>:
  80383b:	55                   	push   %rbp
  80383c:	48 89 e5             	mov    %rsp,%rbp
  80383f:	48 83 ec 20          	sub    $0x20,%rsp
  803843:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803846:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80384a:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80384d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803850:	89 c7                	mov    %eax,%edi
  803852:	48 b8 01 36 80 00 00 	movabs $0x803601,%rax
  803859:	00 00 00 
  80385c:	ff d0                	callq  *%rax
  80385e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803861:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803865:	79 05                	jns    80386c <connect+0x31>
  803867:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80386a:	eb 1b                	jmp    803887 <connect+0x4c>
  80386c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80386f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803873:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803876:	48 89 ce             	mov    %rcx,%rsi
  803879:	89 c7                	mov    %eax,%edi
  80387b:	48 b8 94 3b 80 00 00 	movabs $0x803b94,%rax
  803882:	00 00 00 
  803885:	ff d0                	callq  *%rax
  803887:	c9                   	leaveq 
  803888:	c3                   	retq   

0000000000803889 <listen>:
  803889:	55                   	push   %rbp
  80388a:	48 89 e5             	mov    %rsp,%rbp
  80388d:	48 83 ec 20          	sub    $0x20,%rsp
  803891:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803894:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803897:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80389a:	89 c7                	mov    %eax,%edi
  80389c:	48 b8 01 36 80 00 00 	movabs $0x803601,%rax
  8038a3:	00 00 00 
  8038a6:	ff d0                	callq  *%rax
  8038a8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038ab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038af:	79 05                	jns    8038b6 <listen+0x2d>
  8038b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038b4:	eb 16                	jmp    8038cc <listen+0x43>
  8038b6:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038bc:	89 d6                	mov    %edx,%esi
  8038be:	89 c7                	mov    %eax,%edi
  8038c0:	48 b8 f8 3b 80 00 00 	movabs $0x803bf8,%rax
  8038c7:	00 00 00 
  8038ca:	ff d0                	callq  *%rax
  8038cc:	c9                   	leaveq 
  8038cd:	c3                   	retq   

00000000008038ce <devsock_read>:
  8038ce:	55                   	push   %rbp
  8038cf:	48 89 e5             	mov    %rsp,%rbp
  8038d2:	48 83 ec 20          	sub    $0x20,%rsp
  8038d6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038da:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038de:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8038e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038e6:	89 c2                	mov    %eax,%edx
  8038e8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038ec:	8b 40 0c             	mov    0xc(%rax),%eax
  8038ef:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8038f3:	b9 00 00 00 00       	mov    $0x0,%ecx
  8038f8:	89 c7                	mov    %eax,%edi
  8038fa:	48 b8 38 3c 80 00 00 	movabs $0x803c38,%rax
  803901:	00 00 00 
  803904:	ff d0                	callq  *%rax
  803906:	c9                   	leaveq 
  803907:	c3                   	retq   

0000000000803908 <devsock_write>:
  803908:	55                   	push   %rbp
  803909:	48 89 e5             	mov    %rsp,%rbp
  80390c:	48 83 ec 20          	sub    $0x20,%rsp
  803910:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803914:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803918:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80391c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803920:	89 c2                	mov    %eax,%edx
  803922:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803926:	8b 40 0c             	mov    0xc(%rax),%eax
  803929:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80392d:	b9 00 00 00 00       	mov    $0x0,%ecx
  803932:	89 c7                	mov    %eax,%edi
  803934:	48 b8 04 3d 80 00 00 	movabs $0x803d04,%rax
  80393b:	00 00 00 
  80393e:	ff d0                	callq  *%rax
  803940:	c9                   	leaveq 
  803941:	c3                   	retq   

0000000000803942 <devsock_stat>:
  803942:	55                   	push   %rbp
  803943:	48 89 e5             	mov    %rsp,%rbp
  803946:	48 83 ec 10          	sub    $0x10,%rsp
  80394a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80394e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803952:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803956:	48 be 8a 52 80 00 00 	movabs $0x80528a,%rsi
  80395d:	00 00 00 
  803960:	48 89 c7             	mov    %rax,%rdi
  803963:	48 b8 8a 12 80 00 00 	movabs $0x80128a,%rax
  80396a:	00 00 00 
  80396d:	ff d0                	callq  *%rax
  80396f:	b8 00 00 00 00       	mov    $0x0,%eax
  803974:	c9                   	leaveq 
  803975:	c3                   	retq   

0000000000803976 <socket>:
  803976:	55                   	push   %rbp
  803977:	48 89 e5             	mov    %rsp,%rbp
  80397a:	48 83 ec 20          	sub    $0x20,%rsp
  80397e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803981:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803984:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803987:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80398a:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80398d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803990:	89 ce                	mov    %ecx,%esi
  803992:	89 c7                	mov    %eax,%edi
  803994:	48 b8 bc 3d 80 00 00 	movabs $0x803dbc,%rax
  80399b:	00 00 00 
  80399e:	ff d0                	callq  *%rax
  8039a0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039a3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039a7:	79 05                	jns    8039ae <socket+0x38>
  8039a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039ac:	eb 11                	jmp    8039bf <socket+0x49>
  8039ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039b1:	89 c7                	mov    %eax,%edi
  8039b3:	48 b8 58 36 80 00 00 	movabs $0x803658,%rax
  8039ba:	00 00 00 
  8039bd:	ff d0                	callq  *%rax
  8039bf:	c9                   	leaveq 
  8039c0:	c3                   	retq   

00000000008039c1 <nsipc>:
  8039c1:	55                   	push   %rbp
  8039c2:	48 89 e5             	mov    %rsp,%rbp
  8039c5:	48 83 ec 10          	sub    $0x10,%rsp
  8039c9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8039cc:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8039d3:	00 00 00 
  8039d6:	8b 00                	mov    (%rax),%eax
  8039d8:	85 c0                	test   %eax,%eax
  8039da:	75 1f                	jne    8039fb <nsipc+0x3a>
  8039dc:	bf 02 00 00 00       	mov    $0x2,%edi
  8039e1:	48 b8 70 49 80 00 00 	movabs $0x804970,%rax
  8039e8:	00 00 00 
  8039eb:	ff d0                	callq  *%rax
  8039ed:	89 c2                	mov    %eax,%edx
  8039ef:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8039f6:	00 00 00 
  8039f9:	89 10                	mov    %edx,(%rax)
  8039fb:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803a02:	00 00 00 
  803a05:	8b 00                	mov    (%rax),%eax
  803a07:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803a0a:	b9 07 00 00 00       	mov    $0x7,%ecx
  803a0f:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803a16:	00 00 00 
  803a19:	89 c7                	mov    %eax,%edi
  803a1b:	48 b8 66 48 80 00 00 	movabs $0x804866,%rax
  803a22:	00 00 00 
  803a25:	ff d0                	callq  *%rax
  803a27:	ba 00 00 00 00       	mov    $0x0,%edx
  803a2c:	be 00 00 00 00       	mov    $0x0,%esi
  803a31:	bf 00 00 00 00       	mov    $0x0,%edi
  803a36:	48 b8 a5 47 80 00 00 	movabs $0x8047a5,%rax
  803a3d:	00 00 00 
  803a40:	ff d0                	callq  *%rax
  803a42:	c9                   	leaveq 
  803a43:	c3                   	retq   

0000000000803a44 <nsipc_accept>:
  803a44:	55                   	push   %rbp
  803a45:	48 89 e5             	mov    %rsp,%rbp
  803a48:	48 83 ec 30          	sub    $0x30,%rsp
  803a4c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a4f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a53:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a57:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a5e:	00 00 00 
  803a61:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803a64:	89 10                	mov    %edx,(%rax)
  803a66:	bf 01 00 00 00       	mov    $0x1,%edi
  803a6b:	48 b8 c1 39 80 00 00 	movabs $0x8039c1,%rax
  803a72:	00 00 00 
  803a75:	ff d0                	callq  *%rax
  803a77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a7e:	78 3e                	js     803abe <nsipc_accept+0x7a>
  803a80:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a87:	00 00 00 
  803a8a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a92:	8b 40 10             	mov    0x10(%rax),%eax
  803a95:	89 c2                	mov    %eax,%edx
  803a97:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803a9b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a9f:	48 89 ce             	mov    %rcx,%rsi
  803aa2:	48 89 c7             	mov    %rax,%rdi
  803aa5:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  803aac:	00 00 00 
  803aaf:	ff d0                	callq  *%rax
  803ab1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ab5:	8b 50 10             	mov    0x10(%rax),%edx
  803ab8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803abc:	89 10                	mov    %edx,(%rax)
  803abe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ac1:	c9                   	leaveq 
  803ac2:	c3                   	retq   

0000000000803ac3 <nsipc_bind>:
  803ac3:	55                   	push   %rbp
  803ac4:	48 89 e5             	mov    %rsp,%rbp
  803ac7:	48 83 ec 10          	sub    $0x10,%rsp
  803acb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803ace:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ad2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ad5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803adc:	00 00 00 
  803adf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ae2:	89 10                	mov    %edx,(%rax)
  803ae4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ae7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aeb:	48 89 c6             	mov    %rax,%rsi
  803aee:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803af5:	00 00 00 
  803af8:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  803aff:	00 00 00 
  803b02:	ff d0                	callq  *%rax
  803b04:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b0b:	00 00 00 
  803b0e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b11:	89 50 14             	mov    %edx,0x14(%rax)
  803b14:	bf 02 00 00 00       	mov    $0x2,%edi
  803b19:	48 b8 c1 39 80 00 00 	movabs $0x8039c1,%rax
  803b20:	00 00 00 
  803b23:	ff d0                	callq  *%rax
  803b25:	c9                   	leaveq 
  803b26:	c3                   	retq   

0000000000803b27 <nsipc_shutdown>:
  803b27:	55                   	push   %rbp
  803b28:	48 89 e5             	mov    %rsp,%rbp
  803b2b:	48 83 ec 10          	sub    $0x10,%rsp
  803b2f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b32:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803b35:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b3c:	00 00 00 
  803b3f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b42:	89 10                	mov    %edx,(%rax)
  803b44:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b4b:	00 00 00 
  803b4e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b51:	89 50 04             	mov    %edx,0x4(%rax)
  803b54:	bf 03 00 00 00       	mov    $0x3,%edi
  803b59:	48 b8 c1 39 80 00 00 	movabs $0x8039c1,%rax
  803b60:	00 00 00 
  803b63:	ff d0                	callq  *%rax
  803b65:	c9                   	leaveq 
  803b66:	c3                   	retq   

0000000000803b67 <nsipc_close>:
  803b67:	55                   	push   %rbp
  803b68:	48 89 e5             	mov    %rsp,%rbp
  803b6b:	48 83 ec 10          	sub    $0x10,%rsp
  803b6f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b72:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b79:	00 00 00 
  803b7c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b7f:	89 10                	mov    %edx,(%rax)
  803b81:	bf 04 00 00 00       	mov    $0x4,%edi
  803b86:	48 b8 c1 39 80 00 00 	movabs $0x8039c1,%rax
  803b8d:	00 00 00 
  803b90:	ff d0                	callq  *%rax
  803b92:	c9                   	leaveq 
  803b93:	c3                   	retq   

0000000000803b94 <nsipc_connect>:
  803b94:	55                   	push   %rbp
  803b95:	48 89 e5             	mov    %rsp,%rbp
  803b98:	48 83 ec 10          	sub    $0x10,%rsp
  803b9c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b9f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ba3:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ba6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bad:	00 00 00 
  803bb0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803bb3:	89 10                	mov    %edx,(%rax)
  803bb5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bb8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bbc:	48 89 c6             	mov    %rax,%rsi
  803bbf:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803bc6:	00 00 00 
  803bc9:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  803bd0:	00 00 00 
  803bd3:	ff d0                	callq  *%rax
  803bd5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bdc:	00 00 00 
  803bdf:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803be2:	89 50 14             	mov    %edx,0x14(%rax)
  803be5:	bf 05 00 00 00       	mov    $0x5,%edi
  803bea:	48 b8 c1 39 80 00 00 	movabs $0x8039c1,%rax
  803bf1:	00 00 00 
  803bf4:	ff d0                	callq  *%rax
  803bf6:	c9                   	leaveq 
  803bf7:	c3                   	retq   

0000000000803bf8 <nsipc_listen>:
  803bf8:	55                   	push   %rbp
  803bf9:	48 89 e5             	mov    %rsp,%rbp
  803bfc:	48 83 ec 10          	sub    $0x10,%rsp
  803c00:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c03:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803c06:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c0d:	00 00 00 
  803c10:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c13:	89 10                	mov    %edx,(%rax)
  803c15:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c1c:	00 00 00 
  803c1f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c22:	89 50 04             	mov    %edx,0x4(%rax)
  803c25:	bf 06 00 00 00       	mov    $0x6,%edi
  803c2a:	48 b8 c1 39 80 00 00 	movabs $0x8039c1,%rax
  803c31:	00 00 00 
  803c34:	ff d0                	callq  *%rax
  803c36:	c9                   	leaveq 
  803c37:	c3                   	retq   

0000000000803c38 <nsipc_recv>:
  803c38:	55                   	push   %rbp
  803c39:	48 89 e5             	mov    %rsp,%rbp
  803c3c:	48 83 ec 30          	sub    $0x30,%rsp
  803c40:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c43:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c47:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803c4a:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803c4d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c54:	00 00 00 
  803c57:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c5a:	89 10                	mov    %edx,(%rax)
  803c5c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c63:	00 00 00 
  803c66:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c69:	89 50 04             	mov    %edx,0x4(%rax)
  803c6c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c73:	00 00 00 
  803c76:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803c79:	89 50 08             	mov    %edx,0x8(%rax)
  803c7c:	bf 07 00 00 00       	mov    $0x7,%edi
  803c81:	48 b8 c1 39 80 00 00 	movabs $0x8039c1,%rax
  803c88:	00 00 00 
  803c8b:	ff d0                	callq  *%rax
  803c8d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c90:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c94:	78 69                	js     803cff <nsipc_recv+0xc7>
  803c96:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803c9d:	7f 08                	jg     803ca7 <nsipc_recv+0x6f>
  803c9f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ca2:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803ca5:	7e 35                	jle    803cdc <nsipc_recv+0xa4>
  803ca7:	48 b9 91 52 80 00 00 	movabs $0x805291,%rcx
  803cae:	00 00 00 
  803cb1:	48 ba a6 52 80 00 00 	movabs $0x8052a6,%rdx
  803cb8:	00 00 00 
  803cbb:	be 62 00 00 00       	mov    $0x62,%esi
  803cc0:	48 bf bb 52 80 00 00 	movabs $0x8052bb,%rdi
  803cc7:	00 00 00 
  803cca:	b8 00 00 00 00       	mov    $0x0,%eax
  803ccf:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  803cd6:	00 00 00 
  803cd9:	41 ff d0             	callq  *%r8
  803cdc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cdf:	48 63 d0             	movslq %eax,%rdx
  803ce2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ce6:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803ced:	00 00 00 
  803cf0:	48 89 c7             	mov    %rax,%rdi
  803cf3:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  803cfa:	00 00 00 
  803cfd:	ff d0                	callq  *%rax
  803cff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d02:	c9                   	leaveq 
  803d03:	c3                   	retq   

0000000000803d04 <nsipc_send>:
  803d04:	55                   	push   %rbp
  803d05:	48 89 e5             	mov    %rsp,%rbp
  803d08:	48 83 ec 20          	sub    $0x20,%rsp
  803d0c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803d0f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d13:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803d16:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803d19:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d20:	00 00 00 
  803d23:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d26:	89 10                	mov    %edx,(%rax)
  803d28:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803d2f:	7e 35                	jle    803d66 <nsipc_send+0x62>
  803d31:	48 b9 ca 52 80 00 00 	movabs $0x8052ca,%rcx
  803d38:	00 00 00 
  803d3b:	48 ba a6 52 80 00 00 	movabs $0x8052a6,%rdx
  803d42:	00 00 00 
  803d45:	be 6d 00 00 00       	mov    $0x6d,%esi
  803d4a:	48 bf bb 52 80 00 00 	movabs $0x8052bb,%rdi
  803d51:	00 00 00 
  803d54:	b8 00 00 00 00       	mov    $0x0,%eax
  803d59:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  803d60:	00 00 00 
  803d63:	41 ff d0             	callq  *%r8
  803d66:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d69:	48 63 d0             	movslq %eax,%rdx
  803d6c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d70:	48 89 c6             	mov    %rax,%rsi
  803d73:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803d7a:	00 00 00 
  803d7d:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  803d84:	00 00 00 
  803d87:	ff d0                	callq  *%rax
  803d89:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d90:	00 00 00 
  803d93:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d96:	89 50 04             	mov    %edx,0x4(%rax)
  803d99:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803da0:	00 00 00 
  803da3:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803da6:	89 50 08             	mov    %edx,0x8(%rax)
  803da9:	bf 08 00 00 00       	mov    $0x8,%edi
  803dae:	48 b8 c1 39 80 00 00 	movabs $0x8039c1,%rax
  803db5:	00 00 00 
  803db8:	ff d0                	callq  *%rax
  803dba:	c9                   	leaveq 
  803dbb:	c3                   	retq   

0000000000803dbc <nsipc_socket>:
  803dbc:	55                   	push   %rbp
  803dbd:	48 89 e5             	mov    %rsp,%rbp
  803dc0:	48 83 ec 10          	sub    $0x10,%rsp
  803dc4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803dc7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803dca:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803dcd:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dd4:	00 00 00 
  803dd7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803dda:	89 10                	mov    %edx,(%rax)
  803ddc:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803de3:	00 00 00 
  803de6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803de9:	89 50 04             	mov    %edx,0x4(%rax)
  803dec:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803df3:	00 00 00 
  803df6:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803df9:	89 50 08             	mov    %edx,0x8(%rax)
  803dfc:	bf 09 00 00 00       	mov    $0x9,%edi
  803e01:	48 b8 c1 39 80 00 00 	movabs $0x8039c1,%rax
  803e08:	00 00 00 
  803e0b:	ff d0                	callq  *%rax
  803e0d:	c9                   	leaveq 
  803e0e:	c3                   	retq   

0000000000803e0f <pipe>:
  803e0f:	55                   	push   %rbp
  803e10:	48 89 e5             	mov    %rsp,%rbp
  803e13:	53                   	push   %rbx
  803e14:	48 83 ec 38          	sub    $0x38,%rsp
  803e18:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803e1c:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803e20:	48 89 c7             	mov    %rax,%rdi
  803e23:	48 b8 1c 26 80 00 00 	movabs $0x80261c,%rax
  803e2a:	00 00 00 
  803e2d:	ff d0                	callq  *%rax
  803e2f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e32:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e36:	0f 88 bf 01 00 00    	js     803ffb <pipe+0x1ec>
  803e3c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e40:	ba 07 04 00 00       	mov    $0x407,%edx
  803e45:	48 89 c6             	mov    %rax,%rsi
  803e48:	bf 00 00 00 00       	mov    $0x0,%edi
  803e4d:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  803e54:	00 00 00 
  803e57:	ff d0                	callq  *%rax
  803e59:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e5c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e60:	0f 88 95 01 00 00    	js     803ffb <pipe+0x1ec>
  803e66:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803e6a:	48 89 c7             	mov    %rax,%rdi
  803e6d:	48 b8 1c 26 80 00 00 	movabs $0x80261c,%rax
  803e74:	00 00 00 
  803e77:	ff d0                	callq  *%rax
  803e79:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e7c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e80:	0f 88 5d 01 00 00    	js     803fe3 <pipe+0x1d4>
  803e86:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e8a:	ba 07 04 00 00       	mov    $0x407,%edx
  803e8f:	48 89 c6             	mov    %rax,%rsi
  803e92:	bf 00 00 00 00       	mov    $0x0,%edi
  803e97:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  803e9e:	00 00 00 
  803ea1:	ff d0                	callq  *%rax
  803ea3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ea6:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803eaa:	0f 88 33 01 00 00    	js     803fe3 <pipe+0x1d4>
  803eb0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803eb4:	48 89 c7             	mov    %rax,%rdi
  803eb7:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  803ebe:	00 00 00 
  803ec1:	ff d0                	callq  *%rax
  803ec3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803ec7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ecb:	ba 07 04 00 00       	mov    $0x407,%edx
  803ed0:	48 89 c6             	mov    %rax,%rsi
  803ed3:	bf 00 00 00 00       	mov    $0x0,%edi
  803ed8:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  803edf:	00 00 00 
  803ee2:	ff d0                	callq  *%rax
  803ee4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ee7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803eeb:	0f 88 d9 00 00 00    	js     803fca <pipe+0x1bb>
  803ef1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ef5:	48 89 c7             	mov    %rax,%rdi
  803ef8:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  803eff:	00 00 00 
  803f02:	ff d0                	callq  *%rax
  803f04:	48 89 c2             	mov    %rax,%rdx
  803f07:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f0b:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803f11:	48 89 d1             	mov    %rdx,%rcx
  803f14:	ba 00 00 00 00       	mov    $0x0,%edx
  803f19:	48 89 c6             	mov    %rax,%rsi
  803f1c:	bf 00 00 00 00       	mov    $0x0,%edi
  803f21:	48 b8 0c 1c 80 00 00 	movabs $0x801c0c,%rax
  803f28:	00 00 00 
  803f2b:	ff d0                	callq  *%rax
  803f2d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f30:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f34:	78 79                	js     803faf <pipe+0x1a0>
  803f36:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f3a:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803f41:	00 00 00 
  803f44:	8b 12                	mov    (%rdx),%edx
  803f46:	89 10                	mov    %edx,(%rax)
  803f48:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f4c:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803f53:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f57:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803f5e:	00 00 00 
  803f61:	8b 12                	mov    (%rdx),%edx
  803f63:	89 10                	mov    %edx,(%rax)
  803f65:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f69:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803f70:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f74:	48 89 c7             	mov    %rax,%rdi
  803f77:	48 b8 ce 25 80 00 00 	movabs $0x8025ce,%rax
  803f7e:	00 00 00 
  803f81:	ff d0                	callq  *%rax
  803f83:	89 c2                	mov    %eax,%edx
  803f85:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803f89:	89 10                	mov    %edx,(%rax)
  803f8b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803f8f:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803f93:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f97:	48 89 c7             	mov    %rax,%rdi
  803f9a:	48 b8 ce 25 80 00 00 	movabs $0x8025ce,%rax
  803fa1:	00 00 00 
  803fa4:	ff d0                	callq  *%rax
  803fa6:	89 03                	mov    %eax,(%rbx)
  803fa8:	b8 00 00 00 00       	mov    $0x0,%eax
  803fad:	eb 4f                	jmp    803ffe <pipe+0x1ef>
  803faf:	90                   	nop
  803fb0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fb4:	48 89 c6             	mov    %rax,%rsi
  803fb7:	bf 00 00 00 00       	mov    $0x0,%edi
  803fbc:	48 b8 6c 1c 80 00 00 	movabs $0x801c6c,%rax
  803fc3:	00 00 00 
  803fc6:	ff d0                	callq  *%rax
  803fc8:	eb 01                	jmp    803fcb <pipe+0x1bc>
  803fca:	90                   	nop
  803fcb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fcf:	48 89 c6             	mov    %rax,%rsi
  803fd2:	bf 00 00 00 00       	mov    $0x0,%edi
  803fd7:	48 b8 6c 1c 80 00 00 	movabs $0x801c6c,%rax
  803fde:	00 00 00 
  803fe1:	ff d0                	callq  *%rax
  803fe3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fe7:	48 89 c6             	mov    %rax,%rsi
  803fea:	bf 00 00 00 00       	mov    $0x0,%edi
  803fef:	48 b8 6c 1c 80 00 00 	movabs $0x801c6c,%rax
  803ff6:	00 00 00 
  803ff9:	ff d0                	callq  *%rax
  803ffb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ffe:	48 83 c4 38          	add    $0x38,%rsp
  804002:	5b                   	pop    %rbx
  804003:	5d                   	pop    %rbp
  804004:	c3                   	retq   

0000000000804005 <_pipeisclosed>:
  804005:	55                   	push   %rbp
  804006:	48 89 e5             	mov    %rsp,%rbp
  804009:	53                   	push   %rbx
  80400a:	48 83 ec 28          	sub    $0x28,%rsp
  80400e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804012:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804016:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80401d:	00 00 00 
  804020:	48 8b 00             	mov    (%rax),%rax
  804023:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804029:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80402c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804030:	48 89 c7             	mov    %rax,%rdi
  804033:	48 b8 e1 49 80 00 00 	movabs $0x8049e1,%rax
  80403a:	00 00 00 
  80403d:	ff d0                	callq  *%rax
  80403f:	89 c3                	mov    %eax,%ebx
  804041:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804045:	48 89 c7             	mov    %rax,%rdi
  804048:	48 b8 e1 49 80 00 00 	movabs $0x8049e1,%rax
  80404f:	00 00 00 
  804052:	ff d0                	callq  *%rax
  804054:	39 c3                	cmp    %eax,%ebx
  804056:	0f 94 c0             	sete   %al
  804059:	0f b6 c0             	movzbl %al,%eax
  80405c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80405f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804066:	00 00 00 
  804069:	48 8b 00             	mov    (%rax),%rax
  80406c:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804072:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804075:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804078:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80407b:	75 05                	jne    804082 <_pipeisclosed+0x7d>
  80407d:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804080:	eb 4a                	jmp    8040cc <_pipeisclosed+0xc7>
  804082:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804085:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804088:	74 8c                	je     804016 <_pipeisclosed+0x11>
  80408a:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80408e:	75 86                	jne    804016 <_pipeisclosed+0x11>
  804090:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804097:	00 00 00 
  80409a:	48 8b 00             	mov    (%rax),%rax
  80409d:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8040a3:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8040a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040a9:	89 c6                	mov    %eax,%esi
  8040ab:	48 bf db 52 80 00 00 	movabs $0x8052db,%rdi
  8040b2:	00 00 00 
  8040b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8040ba:	49 b8 fa 06 80 00 00 	movabs $0x8006fa,%r8
  8040c1:	00 00 00 
  8040c4:	41 ff d0             	callq  *%r8
  8040c7:	e9 4a ff ff ff       	jmpq   804016 <_pipeisclosed+0x11>
  8040cc:	48 83 c4 28          	add    $0x28,%rsp
  8040d0:	5b                   	pop    %rbx
  8040d1:	5d                   	pop    %rbp
  8040d2:	c3                   	retq   

00000000008040d3 <pipeisclosed>:
  8040d3:	55                   	push   %rbp
  8040d4:	48 89 e5             	mov    %rsp,%rbp
  8040d7:	48 83 ec 30          	sub    $0x30,%rsp
  8040db:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8040de:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8040e2:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8040e5:	48 89 d6             	mov    %rdx,%rsi
  8040e8:	89 c7                	mov    %eax,%edi
  8040ea:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  8040f1:	00 00 00 
  8040f4:	ff d0                	callq  *%rax
  8040f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040fd:	79 05                	jns    804104 <pipeisclosed+0x31>
  8040ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804102:	eb 31                	jmp    804135 <pipeisclosed+0x62>
  804104:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804108:	48 89 c7             	mov    %rax,%rdi
  80410b:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  804112:	00 00 00 
  804115:	ff d0                	callq  *%rax
  804117:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80411b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80411f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804123:	48 89 d6             	mov    %rdx,%rsi
  804126:	48 89 c7             	mov    %rax,%rdi
  804129:	48 b8 05 40 80 00 00 	movabs $0x804005,%rax
  804130:	00 00 00 
  804133:	ff d0                	callq  *%rax
  804135:	c9                   	leaveq 
  804136:	c3                   	retq   

0000000000804137 <devpipe_read>:
  804137:	55                   	push   %rbp
  804138:	48 89 e5             	mov    %rsp,%rbp
  80413b:	48 83 ec 40          	sub    $0x40,%rsp
  80413f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804143:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804147:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80414b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80414f:	48 89 c7             	mov    %rax,%rdi
  804152:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  804159:	00 00 00 
  80415c:	ff d0                	callq  *%rax
  80415e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804162:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804166:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80416a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804171:	00 
  804172:	e9 90 00 00 00       	jmpq   804207 <devpipe_read+0xd0>
  804177:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80417c:	74 09                	je     804187 <devpipe_read+0x50>
  80417e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804182:	e9 8e 00 00 00       	jmpq   804215 <devpipe_read+0xde>
  804187:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80418b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80418f:	48 89 d6             	mov    %rdx,%rsi
  804192:	48 89 c7             	mov    %rax,%rdi
  804195:	48 b8 05 40 80 00 00 	movabs $0x804005,%rax
  80419c:	00 00 00 
  80419f:	ff d0                	callq  *%rax
  8041a1:	85 c0                	test   %eax,%eax
  8041a3:	74 07                	je     8041ac <devpipe_read+0x75>
  8041a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8041aa:	eb 69                	jmp    804215 <devpipe_read+0xde>
  8041ac:	48 b8 7d 1b 80 00 00 	movabs $0x801b7d,%rax
  8041b3:	00 00 00 
  8041b6:	ff d0                	callq  *%rax
  8041b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041bc:	8b 10                	mov    (%rax),%edx
  8041be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041c2:	8b 40 04             	mov    0x4(%rax),%eax
  8041c5:	39 c2                	cmp    %eax,%edx
  8041c7:	74 ae                	je     804177 <devpipe_read+0x40>
  8041c9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8041cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041d1:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8041d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041d9:	8b 00                	mov    (%rax),%eax
  8041db:	99                   	cltd   
  8041dc:	c1 ea 1b             	shr    $0x1b,%edx
  8041df:	01 d0                	add    %edx,%eax
  8041e1:	83 e0 1f             	and    $0x1f,%eax
  8041e4:	29 d0                	sub    %edx,%eax
  8041e6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8041ea:	48 98                	cltq   
  8041ec:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8041f1:	88 01                	mov    %al,(%rcx)
  8041f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041f7:	8b 00                	mov    (%rax),%eax
  8041f9:	8d 50 01             	lea    0x1(%rax),%edx
  8041fc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804200:	89 10                	mov    %edx,(%rax)
  804202:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804207:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80420b:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80420f:	72 a7                	jb     8041b8 <devpipe_read+0x81>
  804211:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804215:	c9                   	leaveq 
  804216:	c3                   	retq   

0000000000804217 <devpipe_write>:
  804217:	55                   	push   %rbp
  804218:	48 89 e5             	mov    %rsp,%rbp
  80421b:	48 83 ec 40          	sub    $0x40,%rsp
  80421f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804223:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804227:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80422b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80422f:	48 89 c7             	mov    %rax,%rdi
  804232:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  804239:	00 00 00 
  80423c:	ff d0                	callq  *%rax
  80423e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804242:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804246:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80424a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804251:	00 
  804252:	e9 8f 00 00 00       	jmpq   8042e6 <devpipe_write+0xcf>
  804257:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80425b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80425f:	48 89 d6             	mov    %rdx,%rsi
  804262:	48 89 c7             	mov    %rax,%rdi
  804265:	48 b8 05 40 80 00 00 	movabs $0x804005,%rax
  80426c:	00 00 00 
  80426f:	ff d0                	callq  *%rax
  804271:	85 c0                	test   %eax,%eax
  804273:	74 07                	je     80427c <devpipe_write+0x65>
  804275:	b8 00 00 00 00       	mov    $0x0,%eax
  80427a:	eb 78                	jmp    8042f4 <devpipe_write+0xdd>
  80427c:	48 b8 7d 1b 80 00 00 	movabs $0x801b7d,%rax
  804283:	00 00 00 
  804286:	ff d0                	callq  *%rax
  804288:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80428c:	8b 40 04             	mov    0x4(%rax),%eax
  80428f:	48 63 d0             	movslq %eax,%rdx
  804292:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804296:	8b 00                	mov    (%rax),%eax
  804298:	48 98                	cltq   
  80429a:	48 83 c0 20          	add    $0x20,%rax
  80429e:	48 39 c2             	cmp    %rax,%rdx
  8042a1:	73 b4                	jae    804257 <devpipe_write+0x40>
  8042a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042a7:	8b 40 04             	mov    0x4(%rax),%eax
  8042aa:	99                   	cltd   
  8042ab:	c1 ea 1b             	shr    $0x1b,%edx
  8042ae:	01 d0                	add    %edx,%eax
  8042b0:	83 e0 1f             	and    $0x1f,%eax
  8042b3:	29 d0                	sub    %edx,%eax
  8042b5:	89 c6                	mov    %eax,%esi
  8042b7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8042bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042bf:	48 01 d0             	add    %rdx,%rax
  8042c2:	0f b6 08             	movzbl (%rax),%ecx
  8042c5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042c9:	48 63 c6             	movslq %esi,%rax
  8042cc:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8042d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042d4:	8b 40 04             	mov    0x4(%rax),%eax
  8042d7:	8d 50 01             	lea    0x1(%rax),%edx
  8042da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042de:	89 50 04             	mov    %edx,0x4(%rax)
  8042e1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8042e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042ea:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8042ee:	72 98                	jb     804288 <devpipe_write+0x71>
  8042f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042f4:	c9                   	leaveq 
  8042f5:	c3                   	retq   

00000000008042f6 <devpipe_stat>:
  8042f6:	55                   	push   %rbp
  8042f7:	48 89 e5             	mov    %rsp,%rbp
  8042fa:	48 83 ec 20          	sub    $0x20,%rsp
  8042fe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804302:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804306:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80430a:	48 89 c7             	mov    %rax,%rdi
  80430d:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  804314:	00 00 00 
  804317:	ff d0                	callq  *%rax
  804319:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80431d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804321:	48 be ee 52 80 00 00 	movabs $0x8052ee,%rsi
  804328:	00 00 00 
  80432b:	48 89 c7             	mov    %rax,%rdi
  80432e:	48 b8 8a 12 80 00 00 	movabs $0x80128a,%rax
  804335:	00 00 00 
  804338:	ff d0                	callq  *%rax
  80433a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80433e:	8b 50 04             	mov    0x4(%rax),%edx
  804341:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804345:	8b 00                	mov    (%rax),%eax
  804347:	29 c2                	sub    %eax,%edx
  804349:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80434d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804353:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804357:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80435e:	00 00 00 
  804361:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804365:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  80436c:	00 00 00 
  80436f:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804376:	b8 00 00 00 00       	mov    $0x0,%eax
  80437b:	c9                   	leaveq 
  80437c:	c3                   	retq   

000000000080437d <devpipe_close>:
  80437d:	55                   	push   %rbp
  80437e:	48 89 e5             	mov    %rsp,%rbp
  804381:	48 83 ec 10          	sub    $0x10,%rsp
  804385:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804389:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80438d:	48 89 c6             	mov    %rax,%rsi
  804390:	bf 00 00 00 00       	mov    $0x0,%edi
  804395:	48 b8 6c 1c 80 00 00 	movabs $0x801c6c,%rax
  80439c:	00 00 00 
  80439f:	ff d0                	callq  *%rax
  8043a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043a5:	48 89 c7             	mov    %rax,%rdi
  8043a8:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  8043af:	00 00 00 
  8043b2:	ff d0                	callq  *%rax
  8043b4:	48 89 c6             	mov    %rax,%rsi
  8043b7:	bf 00 00 00 00       	mov    $0x0,%edi
  8043bc:	48 b8 6c 1c 80 00 00 	movabs $0x801c6c,%rax
  8043c3:	00 00 00 
  8043c6:	ff d0                	callq  *%rax
  8043c8:	c9                   	leaveq 
  8043c9:	c3                   	retq   

00000000008043ca <cputchar>:
  8043ca:	55                   	push   %rbp
  8043cb:	48 89 e5             	mov    %rsp,%rbp
  8043ce:	48 83 ec 20          	sub    $0x20,%rsp
  8043d2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8043d5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043d8:	88 45 ff             	mov    %al,-0x1(%rbp)
  8043db:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8043df:	be 01 00 00 00       	mov    $0x1,%esi
  8043e4:	48 89 c7             	mov    %rax,%rdi
  8043e7:	48 b8 72 1a 80 00 00 	movabs $0x801a72,%rax
  8043ee:	00 00 00 
  8043f1:	ff d0                	callq  *%rax
  8043f3:	90                   	nop
  8043f4:	c9                   	leaveq 
  8043f5:	c3                   	retq   

00000000008043f6 <getchar>:
  8043f6:	55                   	push   %rbp
  8043f7:	48 89 e5             	mov    %rsp,%rbp
  8043fa:	48 83 ec 10          	sub    $0x10,%rsp
  8043fe:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804402:	ba 01 00 00 00       	mov    $0x1,%edx
  804407:	48 89 c6             	mov    %rax,%rsi
  80440a:	bf 00 00 00 00       	mov    $0x0,%edi
  80440f:	48 b8 e9 2a 80 00 00 	movabs $0x802ae9,%rax
  804416:	00 00 00 
  804419:	ff d0                	callq  *%rax
  80441b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80441e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804422:	79 05                	jns    804429 <getchar+0x33>
  804424:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804427:	eb 14                	jmp    80443d <getchar+0x47>
  804429:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80442d:	7f 07                	jg     804436 <getchar+0x40>
  80442f:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804434:	eb 07                	jmp    80443d <getchar+0x47>
  804436:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  80443a:	0f b6 c0             	movzbl %al,%eax
  80443d:	c9                   	leaveq 
  80443e:	c3                   	retq   

000000000080443f <iscons>:
  80443f:	55                   	push   %rbp
  804440:	48 89 e5             	mov    %rsp,%rbp
  804443:	48 83 ec 20          	sub    $0x20,%rsp
  804447:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80444a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80444e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804451:	48 89 d6             	mov    %rdx,%rsi
  804454:	89 c7                	mov    %eax,%edi
  804456:	48 b8 b4 26 80 00 00 	movabs $0x8026b4,%rax
  80445d:	00 00 00 
  804460:	ff d0                	callq  *%rax
  804462:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804465:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804469:	79 05                	jns    804470 <iscons+0x31>
  80446b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80446e:	eb 1a                	jmp    80448a <iscons+0x4b>
  804470:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804474:	8b 10                	mov    (%rax),%edx
  804476:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  80447d:	00 00 00 
  804480:	8b 00                	mov    (%rax),%eax
  804482:	39 c2                	cmp    %eax,%edx
  804484:	0f 94 c0             	sete   %al
  804487:	0f b6 c0             	movzbl %al,%eax
  80448a:	c9                   	leaveq 
  80448b:	c3                   	retq   

000000000080448c <opencons>:
  80448c:	55                   	push   %rbp
  80448d:	48 89 e5             	mov    %rsp,%rbp
  804490:	48 83 ec 10          	sub    $0x10,%rsp
  804494:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804498:	48 89 c7             	mov    %rax,%rdi
  80449b:	48 b8 1c 26 80 00 00 	movabs $0x80261c,%rax
  8044a2:	00 00 00 
  8044a5:	ff d0                	callq  *%rax
  8044a7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044aa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044ae:	79 05                	jns    8044b5 <opencons+0x29>
  8044b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044b3:	eb 5b                	jmp    804510 <opencons+0x84>
  8044b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044b9:	ba 07 04 00 00       	mov    $0x407,%edx
  8044be:	48 89 c6             	mov    %rax,%rsi
  8044c1:	bf 00 00 00 00       	mov    $0x0,%edi
  8044c6:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  8044cd:	00 00 00 
  8044d0:	ff d0                	callq  *%rax
  8044d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044d9:	79 05                	jns    8044e0 <opencons+0x54>
  8044db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044de:	eb 30                	jmp    804510 <opencons+0x84>
  8044e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044e4:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8044eb:	00 00 00 
  8044ee:	8b 12                	mov    (%rdx),%edx
  8044f0:	89 10                	mov    %edx,(%rax)
  8044f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044f6:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8044fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804501:	48 89 c7             	mov    %rax,%rdi
  804504:	48 b8 ce 25 80 00 00 	movabs $0x8025ce,%rax
  80450b:	00 00 00 
  80450e:	ff d0                	callq  *%rax
  804510:	c9                   	leaveq 
  804511:	c3                   	retq   

0000000000804512 <devcons_read>:
  804512:	55                   	push   %rbp
  804513:	48 89 e5             	mov    %rsp,%rbp
  804516:	48 83 ec 30          	sub    $0x30,%rsp
  80451a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80451e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804522:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804526:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80452b:	75 13                	jne    804540 <devcons_read+0x2e>
  80452d:	b8 00 00 00 00       	mov    $0x0,%eax
  804532:	eb 49                	jmp    80457d <devcons_read+0x6b>
  804534:	48 b8 7d 1b 80 00 00 	movabs $0x801b7d,%rax
  80453b:	00 00 00 
  80453e:	ff d0                	callq  *%rax
  804540:	48 b8 bf 1a 80 00 00 	movabs $0x801abf,%rax
  804547:	00 00 00 
  80454a:	ff d0                	callq  *%rax
  80454c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80454f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804553:	74 df                	je     804534 <devcons_read+0x22>
  804555:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804559:	79 05                	jns    804560 <devcons_read+0x4e>
  80455b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80455e:	eb 1d                	jmp    80457d <devcons_read+0x6b>
  804560:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804564:	75 07                	jne    80456d <devcons_read+0x5b>
  804566:	b8 00 00 00 00       	mov    $0x0,%eax
  80456b:	eb 10                	jmp    80457d <devcons_read+0x6b>
  80456d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804570:	89 c2                	mov    %eax,%edx
  804572:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804576:	88 10                	mov    %dl,(%rax)
  804578:	b8 01 00 00 00       	mov    $0x1,%eax
  80457d:	c9                   	leaveq 
  80457e:	c3                   	retq   

000000000080457f <devcons_write>:
  80457f:	55                   	push   %rbp
  804580:	48 89 e5             	mov    %rsp,%rbp
  804583:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80458a:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804591:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804598:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  80459f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8045a6:	eb 76                	jmp    80461e <devcons_write+0x9f>
  8045a8:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8045af:	89 c2                	mov    %eax,%edx
  8045b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045b4:	29 c2                	sub    %eax,%edx
  8045b6:	89 d0                	mov    %edx,%eax
  8045b8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8045bb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045be:	83 f8 7f             	cmp    $0x7f,%eax
  8045c1:	76 07                	jbe    8045ca <devcons_write+0x4b>
  8045c3:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8045ca:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045cd:	48 63 d0             	movslq %eax,%rdx
  8045d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045d3:	48 63 c8             	movslq %eax,%rcx
  8045d6:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8045dd:	48 01 c1             	add    %rax,%rcx
  8045e0:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8045e7:	48 89 ce             	mov    %rcx,%rsi
  8045ea:	48 89 c7             	mov    %rax,%rdi
  8045ed:	48 b8 af 15 80 00 00 	movabs $0x8015af,%rax
  8045f4:	00 00 00 
  8045f7:	ff d0                	callq  *%rax
  8045f9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045fc:	48 63 d0             	movslq %eax,%rdx
  8045ff:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804606:	48 89 d6             	mov    %rdx,%rsi
  804609:	48 89 c7             	mov    %rax,%rdi
  80460c:	48 b8 72 1a 80 00 00 	movabs $0x801a72,%rax
  804613:	00 00 00 
  804616:	ff d0                	callq  *%rax
  804618:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80461b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80461e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804621:	48 98                	cltq   
  804623:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80462a:	0f 82 78 ff ff ff    	jb     8045a8 <devcons_write+0x29>
  804630:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804633:	c9                   	leaveq 
  804634:	c3                   	retq   

0000000000804635 <devcons_close>:
  804635:	55                   	push   %rbp
  804636:	48 89 e5             	mov    %rsp,%rbp
  804639:	48 83 ec 08          	sub    $0x8,%rsp
  80463d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804641:	b8 00 00 00 00       	mov    $0x0,%eax
  804646:	c9                   	leaveq 
  804647:	c3                   	retq   

0000000000804648 <devcons_stat>:
  804648:	55                   	push   %rbp
  804649:	48 89 e5             	mov    %rsp,%rbp
  80464c:	48 83 ec 10          	sub    $0x10,%rsp
  804650:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804654:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804658:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80465c:	48 be fa 52 80 00 00 	movabs $0x8052fa,%rsi
  804663:	00 00 00 
  804666:	48 89 c7             	mov    %rax,%rdi
  804669:	48 b8 8a 12 80 00 00 	movabs $0x80128a,%rax
  804670:	00 00 00 
  804673:	ff d0                	callq  *%rax
  804675:	b8 00 00 00 00       	mov    $0x0,%eax
  80467a:	c9                   	leaveq 
  80467b:	c3                   	retq   

000000000080467c <set_pgfault_handler>:
  80467c:	55                   	push   %rbp
  80467d:	48 89 e5             	mov    %rsp,%rbp
  804680:	48 83 ec 20          	sub    $0x20,%rsp
  804684:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804688:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80468f:	00 00 00 
  804692:	48 8b 00             	mov    (%rax),%rax
  804695:	48 85 c0             	test   %rax,%rax
  804698:	75 6f                	jne    804709 <set_pgfault_handler+0x8d>
  80469a:	ba 07 00 00 00       	mov    $0x7,%edx
  80469f:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  8046a4:	bf 00 00 00 00       	mov    $0x0,%edi
  8046a9:	48 b8 ba 1b 80 00 00 	movabs $0x801bba,%rax
  8046b0:	00 00 00 
  8046b3:	ff d0                	callq  *%rax
  8046b5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046b8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046bc:	79 30                	jns    8046ee <set_pgfault_handler+0x72>
  8046be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046c1:	89 c1                	mov    %eax,%ecx
  8046c3:	48 ba 08 53 80 00 00 	movabs $0x805308,%rdx
  8046ca:	00 00 00 
  8046cd:	be 22 00 00 00       	mov    $0x22,%esi
  8046d2:	48 bf 27 53 80 00 00 	movabs $0x805327,%rdi
  8046d9:	00 00 00 
  8046dc:	b8 00 00 00 00       	mov    $0x0,%eax
  8046e1:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  8046e8:	00 00 00 
  8046eb:	41 ff d0             	callq  *%r8
  8046ee:	48 be 1d 47 80 00 00 	movabs $0x80471d,%rsi
  8046f5:	00 00 00 
  8046f8:	bf 00 00 00 00       	mov    $0x0,%edi
  8046fd:	48 b8 51 1d 80 00 00 	movabs $0x801d51,%rax
  804704:	00 00 00 
  804707:	ff d0                	callq  *%rax
  804709:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804710:	00 00 00 
  804713:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804717:	48 89 10             	mov    %rdx,(%rax)
  80471a:	90                   	nop
  80471b:	c9                   	leaveq 
  80471c:	c3                   	retq   

000000000080471d <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80471d:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804720:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804727:	00 00 00 
call *%rax
  80472a:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  80472c:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804733:	00 08 
    movq 152(%rsp), %rax
  804735:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  80473c:	00 
    movq 136(%rsp), %rbx
  80473d:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804744:	00 
movq %rbx, (%rax)
  804745:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804748:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  80474c:	4c 8b 3c 24          	mov    (%rsp),%r15
  804750:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804755:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  80475a:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  80475f:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804764:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804769:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  80476e:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804773:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804778:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  80477d:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804782:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804787:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  80478c:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804791:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804796:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  80479a:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  80479e:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  80479f:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  8047a4:	c3                   	retq   

00000000008047a5 <ipc_recv>:
  8047a5:	55                   	push   %rbp
  8047a6:	48 89 e5             	mov    %rsp,%rbp
  8047a9:	48 83 ec 30          	sub    $0x30,%rsp
  8047ad:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8047b1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8047b5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8047b9:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8047be:	75 0e                	jne    8047ce <ipc_recv+0x29>
  8047c0:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8047c7:	00 00 00 
  8047ca:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8047ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8047d2:	48 89 c7             	mov    %rax,%rdi
  8047d5:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  8047dc:	00 00 00 
  8047df:	ff d0                	callq  *%rax
  8047e1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8047e4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8047e8:	79 27                	jns    804811 <ipc_recv+0x6c>
  8047ea:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8047ef:	74 0a                	je     8047fb <ipc_recv+0x56>
  8047f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047f5:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8047fb:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804800:	74 0a                	je     80480c <ipc_recv+0x67>
  804802:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804806:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80480c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80480f:	eb 53                	jmp    804864 <ipc_recv+0xbf>
  804811:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804816:	74 19                	je     804831 <ipc_recv+0x8c>
  804818:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80481f:	00 00 00 
  804822:	48 8b 00             	mov    (%rax),%rax
  804825:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80482b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80482f:	89 10                	mov    %edx,(%rax)
  804831:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804836:	74 19                	je     804851 <ipc_recv+0xac>
  804838:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80483f:	00 00 00 
  804842:	48 8b 00             	mov    (%rax),%rax
  804845:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80484b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80484f:	89 10                	mov    %edx,(%rax)
  804851:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804858:	00 00 00 
  80485b:	48 8b 00             	mov    (%rax),%rax
  80485e:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804864:	c9                   	leaveq 
  804865:	c3                   	retq   

0000000000804866 <ipc_send>:
  804866:	55                   	push   %rbp
  804867:	48 89 e5             	mov    %rsp,%rbp
  80486a:	48 83 ec 30          	sub    $0x30,%rsp
  80486e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804871:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804874:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804878:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80487b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804880:	75 1c                	jne    80489e <ipc_send+0x38>
  804882:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804889:	00 00 00 
  80488c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804890:	eb 0c                	jmp    80489e <ipc_send+0x38>
  804892:	48 b8 7d 1b 80 00 00 	movabs $0x801b7d,%rax
  804899:	00 00 00 
  80489c:	ff d0                	callq  *%rax
  80489e:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8048a1:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8048a4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8048a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8048ab:	89 c7                	mov    %eax,%edi
  8048ad:	48 b8 9d 1d 80 00 00 	movabs $0x801d9d,%rax
  8048b4:	00 00 00 
  8048b7:	ff d0                	callq  *%rax
  8048b9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048bc:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8048c0:	74 d0                	je     804892 <ipc_send+0x2c>
  8048c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048c6:	79 30                	jns    8048f8 <ipc_send+0x92>
  8048c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048cb:	89 c1                	mov    %eax,%ecx
  8048cd:	48 ba 38 53 80 00 00 	movabs $0x805338,%rdx
  8048d4:	00 00 00 
  8048d7:	be 44 00 00 00       	mov    $0x44,%esi
  8048dc:	48 bf 4e 53 80 00 00 	movabs $0x80534e,%rdi
  8048e3:	00 00 00 
  8048e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8048eb:	49 b8 c0 04 80 00 00 	movabs $0x8004c0,%r8
  8048f2:	00 00 00 
  8048f5:	41 ff d0             	callq  *%r8
  8048f8:	90                   	nop
  8048f9:	c9                   	leaveq 
  8048fa:	c3                   	retq   

00000000008048fb <ipc_host_recv>:
  8048fb:	55                   	push   %rbp
  8048fc:	48 89 e5             	mov    %rsp,%rbp
  8048ff:	48 83 ec 10          	sub    $0x10,%rsp
  804903:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804907:	48 ba 60 53 80 00 00 	movabs $0x805360,%rdx
  80490e:	00 00 00 
  804911:	be 4e 00 00 00       	mov    $0x4e,%esi
  804916:	48 bf 4e 53 80 00 00 	movabs $0x80534e,%rdi
  80491d:	00 00 00 
  804920:	b8 00 00 00 00       	mov    $0x0,%eax
  804925:	48 b9 c0 04 80 00 00 	movabs $0x8004c0,%rcx
  80492c:	00 00 00 
  80492f:	ff d1                	callq  *%rcx

0000000000804931 <ipc_host_send>:
  804931:	55                   	push   %rbp
  804932:	48 89 e5             	mov    %rsp,%rbp
  804935:	48 83 ec 20          	sub    $0x20,%rsp
  804939:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80493c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80493f:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804943:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804946:	48 ba 80 53 80 00 00 	movabs $0x805380,%rdx
  80494d:	00 00 00 
  804950:	be 58 00 00 00       	mov    $0x58,%esi
  804955:	48 bf 4e 53 80 00 00 	movabs $0x80534e,%rdi
  80495c:	00 00 00 
  80495f:	b8 00 00 00 00       	mov    $0x0,%eax
  804964:	48 b9 c0 04 80 00 00 	movabs $0x8004c0,%rcx
  80496b:	00 00 00 
  80496e:	ff d1                	callq  *%rcx

0000000000804970 <ipc_find_env>:
  804970:	55                   	push   %rbp
  804971:	48 89 e5             	mov    %rsp,%rbp
  804974:	48 83 ec 18          	sub    $0x18,%rsp
  804978:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80497b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804982:	eb 4d                	jmp    8049d1 <ipc_find_env+0x61>
  804984:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80498b:	00 00 00 
  80498e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804991:	48 98                	cltq   
  804993:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80499a:	48 01 d0             	add    %rdx,%rax
  80499d:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8049a3:	8b 00                	mov    (%rax),%eax
  8049a5:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8049a8:	75 23                	jne    8049cd <ipc_find_env+0x5d>
  8049aa:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8049b1:	00 00 00 
  8049b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8049b7:	48 98                	cltq   
  8049b9:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8049c0:	48 01 d0             	add    %rdx,%rax
  8049c3:	48 05 c8 00 00 00    	add    $0xc8,%rax
  8049c9:	8b 00                	mov    (%rax),%eax
  8049cb:	eb 12                	jmp    8049df <ipc_find_env+0x6f>
  8049cd:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8049d1:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8049d8:	7e aa                	jle    804984 <ipc_find_env+0x14>
  8049da:	b8 00 00 00 00       	mov    $0x0,%eax
  8049df:	c9                   	leaveq 
  8049e0:	c3                   	retq   

00000000008049e1 <pageref>:
  8049e1:	55                   	push   %rbp
  8049e2:	48 89 e5             	mov    %rsp,%rbp
  8049e5:	48 83 ec 18          	sub    $0x18,%rsp
  8049e9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8049ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049f1:	48 c1 e8 15          	shr    $0x15,%rax
  8049f5:	48 89 c2             	mov    %rax,%rdx
  8049f8:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8049ff:	01 00 00 
  804a02:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804a06:	83 e0 01             	and    $0x1,%eax
  804a09:	48 85 c0             	test   %rax,%rax
  804a0c:	75 07                	jne    804a15 <pageref+0x34>
  804a0e:	b8 00 00 00 00       	mov    $0x0,%eax
  804a13:	eb 56                	jmp    804a6b <pageref+0x8a>
  804a15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804a19:	48 c1 e8 0c          	shr    $0xc,%rax
  804a1d:	48 89 c2             	mov    %rax,%rdx
  804a20:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804a27:	01 00 00 
  804a2a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804a2e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804a32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a36:	83 e0 01             	and    $0x1,%eax
  804a39:	48 85 c0             	test   %rax,%rax
  804a3c:	75 07                	jne    804a45 <pageref+0x64>
  804a3e:	b8 00 00 00 00       	mov    $0x0,%eax
  804a43:	eb 26                	jmp    804a6b <pageref+0x8a>
  804a45:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804a49:	48 c1 e8 0c          	shr    $0xc,%rax
  804a4d:	48 89 c2             	mov    %rax,%rdx
  804a50:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804a57:	00 00 00 
  804a5a:	48 c1 e2 04          	shl    $0x4,%rdx
  804a5e:	48 01 d0             	add    %rdx,%rax
  804a61:	48 83 c0 08          	add    $0x8,%rax
  804a65:	0f b7 00             	movzwl (%rax),%eax
  804a68:	0f b7 c0             	movzwl %ax,%eax
  804a6b:	c9                   	leaveq 
  804a6c:	c3                   	retq   
