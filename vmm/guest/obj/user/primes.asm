
vmm/guest/obj/user/primes:     file format elf64-x86-64


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
  80003c:	e8 8b 01 00 00       	callq  8001cc <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <primeproc>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80004f:	ba 00 00 00 00       	mov    $0x0,%edx
  800054:	be 00 00 00 00       	mov    $0x0,%esi
  800059:	48 89 c7             	mov    %rax,%rdi
  80005c:	48 b8 82 23 80 00 00 	movabs $0x802382,%rax
  800063:	00 00 00 
  800066:	ff d0                	callq  *%rax
  800068:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80006b:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800072:	00 00 00 
  800075:	48 8b 00             	mov    (%rax),%rax
  800078:	8b 80 dc 00 00 00    	mov    0xdc(%rax),%eax
  80007e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800081:	89 c6                	mov    %eax,%esi
  800083:	48 bf 40 48 80 00 00 	movabs $0x804840,%rdi
  80008a:	00 00 00 
  80008d:	b8 00 00 00 00       	mov    $0x0,%eax
  800092:	48 b9 ae 04 80 00 00 	movabs $0x8004ae,%rcx
  800099:	00 00 00 
  80009c:	ff d1                	callq  *%rcx
  80009e:	48 b8 0b 21 80 00 00 	movabs $0x80210b,%rax
  8000a5:	00 00 00 
  8000a8:	ff d0                	callq  *%rax
  8000aa:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8000ad:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000b1:	79 30                	jns    8000e3 <primeproc+0xa0>
  8000b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8000b6:	89 c1                	mov    %eax,%ecx
  8000b8:	48 ba 4c 48 80 00 00 	movabs $0x80484c,%rdx
  8000bf:	00 00 00 
  8000c2:	be 1b 00 00 00       	mov    $0x1b,%esi
  8000c7:	48 bf 55 48 80 00 00 	movabs $0x804855,%rdi
  8000ce:	00 00 00 
  8000d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8000d6:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8000dd:	00 00 00 
  8000e0:	41 ff d0             	callq  *%r8
  8000e3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8000e7:	75 05                	jne    8000ee <primeproc+0xab>
  8000e9:	e9 5d ff ff ff       	jmpq   80004b <primeproc+0x8>
  8000ee:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8000f2:	ba 00 00 00 00       	mov    $0x0,%edx
  8000f7:	be 00 00 00 00       	mov    $0x0,%esi
  8000fc:	48 89 c7             	mov    %rax,%rdi
  8000ff:	48 b8 82 23 80 00 00 	movabs $0x802382,%rax
  800106:	00 00 00 
  800109:	ff d0                	callq  *%rax
  80010b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80010e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800111:	99                   	cltd   
  800112:	f7 7d fc             	idivl  -0x4(%rbp)
  800115:	89 d0                	mov    %edx,%eax
  800117:	85 c0                	test   %eax,%eax
  800119:	74 d3                	je     8000ee <primeproc+0xab>
  80011b:	8b 75 f4             	mov    -0xc(%rbp),%esi
  80011e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800121:	b9 00 00 00 00       	mov    $0x0,%ecx
  800126:	ba 00 00 00 00       	mov    $0x0,%edx
  80012b:	89 c7                	mov    %eax,%edi
  80012d:	48 b8 43 24 80 00 00 	movabs $0x802443,%rax
  800134:	00 00 00 
  800137:	ff d0                	callq  *%rax
  800139:	eb b3                	jmp    8000ee <primeproc+0xab>

000000000080013b <umain>:
  80013b:	55                   	push   %rbp
  80013c:	48 89 e5             	mov    %rsp,%rbp
  80013f:	48 83 ec 20          	sub    $0x20,%rsp
  800143:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800146:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80014a:	48 b8 0b 21 80 00 00 	movabs $0x80210b,%rax
  800151:	00 00 00 
  800154:	ff d0                	callq  *%rax
  800156:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800159:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80015d:	79 30                	jns    80018f <umain+0x54>
  80015f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800162:	89 c1                	mov    %eax,%ecx
  800164:	48 ba 4c 48 80 00 00 	movabs $0x80484c,%rdx
  80016b:	00 00 00 
  80016e:	be 2e 00 00 00       	mov    $0x2e,%esi
  800173:	48 bf 55 48 80 00 00 	movabs $0x804855,%rdi
  80017a:	00 00 00 
  80017d:	b8 00 00 00 00       	mov    $0x0,%eax
  800182:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  800189:	00 00 00 
  80018c:	41 ff d0             	callq  *%r8
  80018f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800193:	75 0c                	jne    8001a1 <umain+0x66>
  800195:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80019c:	00 00 00 
  80019f:	ff d0                	callq  *%rax
  8001a1:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%rbp)
  8001a8:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8001ab:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001ae:	b9 00 00 00 00       	mov    $0x0,%ecx
  8001b3:	ba 00 00 00 00       	mov    $0x0,%edx
  8001b8:	89 c7                	mov    %eax,%edi
  8001ba:	48 b8 43 24 80 00 00 	movabs $0x802443,%rax
  8001c1:	00 00 00 
  8001c4:	ff d0                	callq  *%rax
  8001c6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8001ca:	eb dc                	jmp    8001a8 <umain+0x6d>

00000000008001cc <libmain>:
  8001cc:	55                   	push   %rbp
  8001cd:	48 89 e5             	mov    %rsp,%rbp
  8001d0:	48 83 ec 10          	sub    $0x10,%rsp
  8001d4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8001d7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001db:	48 b8 f5 18 80 00 00 	movabs $0x8018f5,%rax
  8001e2:	00 00 00 
  8001e5:	ff d0                	callq  *%rax
  8001e7:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001ec:	48 98                	cltq   
  8001ee:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001f5:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001fc:	00 00 00 
  8001ff:	48 01 c2             	add    %rax,%rdx
  800202:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  800209:	00 00 00 
  80020c:	48 89 10             	mov    %rdx,(%rax)
  80020f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800213:	7e 14                	jle    800229 <libmain+0x5d>
  800215:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800219:	48 8b 10             	mov    (%rax),%rdx
  80021c:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800223:	00 00 00 
  800226:	48 89 10             	mov    %rdx,(%rax)
  800229:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80022d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800230:	48 89 d6             	mov    %rdx,%rsi
  800233:	89 c7                	mov    %eax,%edi
  800235:	48 b8 3b 01 80 00 00 	movabs $0x80013b,%rax
  80023c:	00 00 00 
  80023f:	ff d0                	callq  *%rax
  800241:	48 b8 50 02 80 00 00 	movabs $0x800250,%rax
  800248:	00 00 00 
  80024b:	ff d0                	callq  *%rax
  80024d:	90                   	nop
  80024e:	c9                   	leaveq 
  80024f:	c3                   	retq   

0000000000800250 <exit>:
  800250:	55                   	push   %rbp
  800251:	48 89 e5             	mov    %rsp,%rbp
  800254:	48 b8 01 29 80 00 00 	movabs $0x802901,%rax
  80025b:	00 00 00 
  80025e:	ff d0                	callq  *%rax
  800260:	bf 00 00 00 00       	mov    $0x0,%edi
  800265:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  80026c:	00 00 00 
  80026f:	ff d0                	callq  *%rax
  800271:	90                   	nop
  800272:	5d                   	pop    %rbp
  800273:	c3                   	retq   

0000000000800274 <_panic>:
  800274:	55                   	push   %rbp
  800275:	48 89 e5             	mov    %rsp,%rbp
  800278:	53                   	push   %rbx
  800279:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  800280:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800287:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80028d:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800294:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  80029b:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8002a2:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8002a9:	84 c0                	test   %al,%al
  8002ab:	74 23                	je     8002d0 <_panic+0x5c>
  8002ad:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  8002b4:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  8002b8:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  8002bc:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  8002c0:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8002c4:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8002c8:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8002cc:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8002d0:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8002d7:	00 00 00 
  8002da:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8002e1:	00 00 00 
  8002e4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8002e8:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8002ef:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8002f6:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8002fd:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800304:	00 00 00 
  800307:	48 8b 18             	mov    (%rax),%rbx
  80030a:	48 b8 f5 18 80 00 00 	movabs $0x8018f5,%rax
  800311:	00 00 00 
  800314:	ff d0                	callq  *%rax
  800316:	89 c6                	mov    %eax,%esi
  800318:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  80031e:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800325:	41 89 d0             	mov    %edx,%r8d
  800328:	48 89 c1             	mov    %rax,%rcx
  80032b:	48 89 da             	mov    %rbx,%rdx
  80032e:	48 bf 70 48 80 00 00 	movabs $0x804870,%rdi
  800335:	00 00 00 
  800338:	b8 00 00 00 00       	mov    $0x0,%eax
  80033d:	49 b9 ae 04 80 00 00 	movabs $0x8004ae,%r9
  800344:	00 00 00 
  800347:	41 ff d1             	callq  *%r9
  80034a:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  800351:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800358:	48 89 d6             	mov    %rdx,%rsi
  80035b:	48 89 c7             	mov    %rax,%rdi
  80035e:	48 b8 02 04 80 00 00 	movabs $0x800402,%rax
  800365:	00 00 00 
  800368:	ff d0                	callq  *%rax
  80036a:	48 bf 93 48 80 00 00 	movabs $0x804893,%rdi
  800371:	00 00 00 
  800374:	b8 00 00 00 00       	mov    $0x0,%eax
  800379:	48 ba ae 04 80 00 00 	movabs $0x8004ae,%rdx
  800380:	00 00 00 
  800383:	ff d2                	callq  *%rdx
  800385:	cc                   	int3   
  800386:	eb fd                	jmp    800385 <_panic+0x111>

0000000000800388 <putch>:
  800388:	55                   	push   %rbp
  800389:	48 89 e5             	mov    %rsp,%rbp
  80038c:	48 83 ec 10          	sub    $0x10,%rsp
  800390:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800393:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800397:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80039b:	8b 00                	mov    (%rax),%eax
  80039d:	8d 48 01             	lea    0x1(%rax),%ecx
  8003a0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003a4:	89 0a                	mov    %ecx,(%rdx)
  8003a6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8003a9:	89 d1                	mov    %edx,%ecx
  8003ab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003af:	48 98                	cltq   
  8003b1:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8003b5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003b9:	8b 00                	mov    (%rax),%eax
  8003bb:	3d ff 00 00 00       	cmp    $0xff,%eax
  8003c0:	75 2c                	jne    8003ee <putch+0x66>
  8003c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003c6:	8b 00                	mov    (%rax),%eax
  8003c8:	48 98                	cltq   
  8003ca:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003ce:	48 83 c2 08          	add    $0x8,%rdx
  8003d2:	48 89 c6             	mov    %rax,%rsi
  8003d5:	48 89 d7             	mov    %rdx,%rdi
  8003d8:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  8003df:	00 00 00 
  8003e2:	ff d0                	callq  *%rax
  8003e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003e8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8003ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003f2:	8b 40 04             	mov    0x4(%rax),%eax
  8003f5:	8d 50 01             	lea    0x1(%rax),%edx
  8003f8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003fc:	89 50 04             	mov    %edx,0x4(%rax)
  8003ff:	90                   	nop
  800400:	c9                   	leaveq 
  800401:	c3                   	retq   

0000000000800402 <vcprintf>:
  800402:	55                   	push   %rbp
  800403:	48 89 e5             	mov    %rsp,%rbp
  800406:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80040d:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800414:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80041b:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800422:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800429:	48 8b 0a             	mov    (%rdx),%rcx
  80042c:	48 89 08             	mov    %rcx,(%rax)
  80042f:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800433:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800437:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80043b:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80043f:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800446:	00 00 00 
  800449:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800450:	00 00 00 
  800453:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  80045a:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800461:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800468:	48 89 c6             	mov    %rax,%rsi
  80046b:	48 bf 88 03 80 00 00 	movabs $0x800388,%rdi
  800472:	00 00 00 
  800475:	48 b8 4c 08 80 00 00 	movabs $0x80084c,%rax
  80047c:	00 00 00 
  80047f:	ff d0                	callq  *%rax
  800481:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800487:	48 98                	cltq   
  800489:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800490:	48 83 c2 08          	add    $0x8,%rdx
  800494:	48 89 c6             	mov    %rax,%rsi
  800497:	48 89 d7             	mov    %rdx,%rdi
  80049a:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  8004a1:	00 00 00 
  8004a4:	ff d0                	callq  *%rax
  8004a6:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8004ac:	c9                   	leaveq 
  8004ad:	c3                   	retq   

00000000008004ae <cprintf>:
  8004ae:	55                   	push   %rbp
  8004af:	48 89 e5             	mov    %rsp,%rbp
  8004b2:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8004b9:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8004c0:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8004c7:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8004ce:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8004d5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8004dc:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8004e3:	84 c0                	test   %al,%al
  8004e5:	74 20                	je     800507 <cprintf+0x59>
  8004e7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8004eb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8004ef:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8004f3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8004f7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8004fb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8004ff:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800503:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800507:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80050e:	00 00 00 
  800511:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800518:	00 00 00 
  80051b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80051f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800526:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80052d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800534:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80053b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800542:	48 8b 0a             	mov    (%rdx),%rcx
  800545:	48 89 08             	mov    %rcx,(%rax)
  800548:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80054c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800550:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800554:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800558:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80055f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800566:	48 89 d6             	mov    %rdx,%rsi
  800569:	48 89 c7             	mov    %rax,%rdi
  80056c:	48 b8 02 04 80 00 00 	movabs $0x800402,%rax
  800573:	00 00 00 
  800576:	ff d0                	callq  *%rax
  800578:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80057e:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800584:	c9                   	leaveq 
  800585:	c3                   	retq   

0000000000800586 <printnum>:
  800586:	55                   	push   %rbp
  800587:	48 89 e5             	mov    %rsp,%rbp
  80058a:	48 83 ec 30          	sub    $0x30,%rsp
  80058e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800592:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800596:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80059a:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80059d:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8005a1:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  8005a5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8005a8:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8005ac:	77 54                	ja     800602 <printnum+0x7c>
  8005ae:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8005b1:	8d 78 ff             	lea    -0x1(%rax),%edi
  8005b4:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  8005b7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005bb:	ba 00 00 00 00       	mov    $0x0,%edx
  8005c0:	48 f7 f6             	div    %rsi
  8005c3:	49 89 c2             	mov    %rax,%r10
  8005c6:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8005c9:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8005cc:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8005d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005d4:	41 89 c9             	mov    %ecx,%r9d
  8005d7:	41 89 f8             	mov    %edi,%r8d
  8005da:	89 d1                	mov    %edx,%ecx
  8005dc:	4c 89 d2             	mov    %r10,%rdx
  8005df:	48 89 c7             	mov    %rax,%rdi
  8005e2:	48 b8 86 05 80 00 00 	movabs $0x800586,%rax
  8005e9:	00 00 00 
  8005ec:	ff d0                	callq  *%rax
  8005ee:	eb 1c                	jmp    80060c <printnum+0x86>
  8005f0:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8005f4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8005f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8005fb:	48 89 ce             	mov    %rcx,%rsi
  8005fe:	89 d7                	mov    %edx,%edi
  800600:	ff d0                	callq  *%rax
  800602:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800606:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  80060a:	7f e4                	jg     8005f0 <printnum+0x6a>
  80060c:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80060f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800613:	ba 00 00 00 00       	mov    $0x0,%edx
  800618:	48 f7 f1             	div    %rcx
  80061b:	48 b8 90 4a 80 00 00 	movabs $0x804a90,%rax
  800622:	00 00 00 
  800625:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800629:	0f be d0             	movsbl %al,%edx
  80062c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800630:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800634:	48 89 ce             	mov    %rcx,%rsi
  800637:	89 d7                	mov    %edx,%edi
  800639:	ff d0                	callq  *%rax
  80063b:	90                   	nop
  80063c:	c9                   	leaveq 
  80063d:	c3                   	retq   

000000000080063e <getuint>:
  80063e:	55                   	push   %rbp
  80063f:	48 89 e5             	mov    %rsp,%rbp
  800642:	48 83 ec 20          	sub    $0x20,%rsp
  800646:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80064a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80064d:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800651:	7e 4f                	jle    8006a2 <getuint+0x64>
  800653:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800657:	8b 00                	mov    (%rax),%eax
  800659:	83 f8 30             	cmp    $0x30,%eax
  80065c:	73 24                	jae    800682 <getuint+0x44>
  80065e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800662:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800666:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80066a:	8b 00                	mov    (%rax),%eax
  80066c:	89 c0                	mov    %eax,%eax
  80066e:	48 01 d0             	add    %rdx,%rax
  800671:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800675:	8b 12                	mov    (%rdx),%edx
  800677:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80067a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80067e:	89 0a                	mov    %ecx,(%rdx)
  800680:	eb 14                	jmp    800696 <getuint+0x58>
  800682:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800686:	48 8b 40 08          	mov    0x8(%rax),%rax
  80068a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80068e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800692:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800696:	48 8b 00             	mov    (%rax),%rax
  800699:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80069d:	e9 9d 00 00 00       	jmpq   80073f <getuint+0x101>
  8006a2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8006a6:	74 4c                	je     8006f4 <getuint+0xb6>
  8006a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ac:	8b 00                	mov    (%rax),%eax
  8006ae:	83 f8 30             	cmp    $0x30,%eax
  8006b1:	73 24                	jae    8006d7 <getuint+0x99>
  8006b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006b7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006bf:	8b 00                	mov    (%rax),%eax
  8006c1:	89 c0                	mov    %eax,%eax
  8006c3:	48 01 d0             	add    %rdx,%rax
  8006c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ca:	8b 12                	mov    (%rdx),%edx
  8006cc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006cf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006d3:	89 0a                	mov    %ecx,(%rdx)
  8006d5:	eb 14                	jmp    8006eb <getuint+0xad>
  8006d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006db:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006df:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8006e3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006e7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006eb:	48 8b 00             	mov    (%rax),%rax
  8006ee:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006f2:	eb 4b                	jmp    80073f <getuint+0x101>
  8006f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f8:	8b 00                	mov    (%rax),%eax
  8006fa:	83 f8 30             	cmp    $0x30,%eax
  8006fd:	73 24                	jae    800723 <getuint+0xe5>
  8006ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800703:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800707:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80070b:	8b 00                	mov    (%rax),%eax
  80070d:	89 c0                	mov    %eax,%eax
  80070f:	48 01 d0             	add    %rdx,%rax
  800712:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800716:	8b 12                	mov    (%rdx),%edx
  800718:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80071b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80071f:	89 0a                	mov    %ecx,(%rdx)
  800721:	eb 14                	jmp    800737 <getuint+0xf9>
  800723:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800727:	48 8b 40 08          	mov    0x8(%rax),%rax
  80072b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80072f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800733:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800737:	8b 00                	mov    (%rax),%eax
  800739:	89 c0                	mov    %eax,%eax
  80073b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80073f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800743:	c9                   	leaveq 
  800744:	c3                   	retq   

0000000000800745 <getint>:
  800745:	55                   	push   %rbp
  800746:	48 89 e5             	mov    %rsp,%rbp
  800749:	48 83 ec 20          	sub    $0x20,%rsp
  80074d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800751:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800754:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800758:	7e 4f                	jle    8007a9 <getint+0x64>
  80075a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80075e:	8b 00                	mov    (%rax),%eax
  800760:	83 f8 30             	cmp    $0x30,%eax
  800763:	73 24                	jae    800789 <getint+0x44>
  800765:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800769:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80076d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800771:	8b 00                	mov    (%rax),%eax
  800773:	89 c0                	mov    %eax,%eax
  800775:	48 01 d0             	add    %rdx,%rax
  800778:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80077c:	8b 12                	mov    (%rdx),%edx
  80077e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800781:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800785:	89 0a                	mov    %ecx,(%rdx)
  800787:	eb 14                	jmp    80079d <getint+0x58>
  800789:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80078d:	48 8b 40 08          	mov    0x8(%rax),%rax
  800791:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800795:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800799:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80079d:	48 8b 00             	mov    (%rax),%rax
  8007a0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007a4:	e9 9d 00 00 00       	jmpq   800846 <getint+0x101>
  8007a9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007ad:	74 4c                	je     8007fb <getint+0xb6>
  8007af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007b3:	8b 00                	mov    (%rax),%eax
  8007b5:	83 f8 30             	cmp    $0x30,%eax
  8007b8:	73 24                	jae    8007de <getint+0x99>
  8007ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007be:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c6:	8b 00                	mov    (%rax),%eax
  8007c8:	89 c0                	mov    %eax,%eax
  8007ca:	48 01 d0             	add    %rdx,%rax
  8007cd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007d1:	8b 12                	mov    (%rdx),%edx
  8007d3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007d6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007da:	89 0a                	mov    %ecx,(%rdx)
  8007dc:	eb 14                	jmp    8007f2 <getint+0xad>
  8007de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e2:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007e6:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ee:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007f2:	48 8b 00             	mov    (%rax),%rax
  8007f5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007f9:	eb 4b                	jmp    800846 <getint+0x101>
  8007fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ff:	8b 00                	mov    (%rax),%eax
  800801:	83 f8 30             	cmp    $0x30,%eax
  800804:	73 24                	jae    80082a <getint+0xe5>
  800806:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80080a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80080e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800812:	8b 00                	mov    (%rax),%eax
  800814:	89 c0                	mov    %eax,%eax
  800816:	48 01 d0             	add    %rdx,%rax
  800819:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80081d:	8b 12                	mov    (%rdx),%edx
  80081f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800822:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800826:	89 0a                	mov    %ecx,(%rdx)
  800828:	eb 14                	jmp    80083e <getint+0xf9>
  80082a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80082e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800832:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800836:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80083a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80083e:	8b 00                	mov    (%rax),%eax
  800840:	48 98                	cltq   
  800842:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800846:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80084a:	c9                   	leaveq 
  80084b:	c3                   	retq   

000000000080084c <vprintfmt>:
  80084c:	55                   	push   %rbp
  80084d:	48 89 e5             	mov    %rsp,%rbp
  800850:	41 54                	push   %r12
  800852:	53                   	push   %rbx
  800853:	48 83 ec 60          	sub    $0x60,%rsp
  800857:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80085b:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80085f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800863:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800867:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80086b:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80086f:	48 8b 0a             	mov    (%rdx),%rcx
  800872:	48 89 08             	mov    %rcx,(%rax)
  800875:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800879:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80087d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800881:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800885:	eb 17                	jmp    80089e <vprintfmt+0x52>
  800887:	85 db                	test   %ebx,%ebx
  800889:	0f 84 b9 04 00 00    	je     800d48 <vprintfmt+0x4fc>
  80088f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800893:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800897:	48 89 d6             	mov    %rdx,%rsi
  80089a:	89 df                	mov    %ebx,%edi
  80089c:	ff d0                	callq  *%rax
  80089e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008a2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008a6:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008aa:	0f b6 00             	movzbl (%rax),%eax
  8008ad:	0f b6 d8             	movzbl %al,%ebx
  8008b0:	83 fb 25             	cmp    $0x25,%ebx
  8008b3:	75 d2                	jne    800887 <vprintfmt+0x3b>
  8008b5:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8008b9:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8008c0:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008c7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8008ce:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8008d5:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008d9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008dd:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008e1:	0f b6 00             	movzbl (%rax),%eax
  8008e4:	0f b6 d8             	movzbl %al,%ebx
  8008e7:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8008ea:	83 f8 55             	cmp    $0x55,%eax
  8008ed:	0f 87 22 04 00 00    	ja     800d15 <vprintfmt+0x4c9>
  8008f3:	89 c0                	mov    %eax,%eax
  8008f5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8008fc:	00 
  8008fd:	48 b8 b8 4a 80 00 00 	movabs $0x804ab8,%rax
  800904:	00 00 00 
  800907:	48 01 d0             	add    %rdx,%rax
  80090a:	48 8b 00             	mov    (%rax),%rax
  80090d:	ff e0                	jmpq   *%rax
  80090f:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800913:	eb c0                	jmp    8008d5 <vprintfmt+0x89>
  800915:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800919:	eb ba                	jmp    8008d5 <vprintfmt+0x89>
  80091b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800922:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800925:	89 d0                	mov    %edx,%eax
  800927:	c1 e0 02             	shl    $0x2,%eax
  80092a:	01 d0                	add    %edx,%eax
  80092c:	01 c0                	add    %eax,%eax
  80092e:	01 d8                	add    %ebx,%eax
  800930:	83 e8 30             	sub    $0x30,%eax
  800933:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800936:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80093a:	0f b6 00             	movzbl (%rax),%eax
  80093d:	0f be d8             	movsbl %al,%ebx
  800940:	83 fb 2f             	cmp    $0x2f,%ebx
  800943:	7e 60                	jle    8009a5 <vprintfmt+0x159>
  800945:	83 fb 39             	cmp    $0x39,%ebx
  800948:	7f 5b                	jg     8009a5 <vprintfmt+0x159>
  80094a:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80094f:	eb d1                	jmp    800922 <vprintfmt+0xd6>
  800951:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800954:	83 f8 30             	cmp    $0x30,%eax
  800957:	73 17                	jae    800970 <vprintfmt+0x124>
  800959:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80095d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800960:	89 d2                	mov    %edx,%edx
  800962:	48 01 d0             	add    %rdx,%rax
  800965:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800968:	83 c2 08             	add    $0x8,%edx
  80096b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80096e:	eb 0c                	jmp    80097c <vprintfmt+0x130>
  800970:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800974:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800978:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80097c:	8b 00                	mov    (%rax),%eax
  80097e:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800981:	eb 23                	jmp    8009a6 <vprintfmt+0x15a>
  800983:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800987:	0f 89 48 ff ff ff    	jns    8008d5 <vprintfmt+0x89>
  80098d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800994:	e9 3c ff ff ff       	jmpq   8008d5 <vprintfmt+0x89>
  800999:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8009a0:	e9 30 ff ff ff       	jmpq   8008d5 <vprintfmt+0x89>
  8009a5:	90                   	nop
  8009a6:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009aa:	0f 89 25 ff ff ff    	jns    8008d5 <vprintfmt+0x89>
  8009b0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8009b3:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8009b6:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009bd:	e9 13 ff ff ff       	jmpq   8008d5 <vprintfmt+0x89>
  8009c2:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8009c6:	e9 0a ff ff ff       	jmpq   8008d5 <vprintfmt+0x89>
  8009cb:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009ce:	83 f8 30             	cmp    $0x30,%eax
  8009d1:	73 17                	jae    8009ea <vprintfmt+0x19e>
  8009d3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8009d7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009da:	89 d2                	mov    %edx,%edx
  8009dc:	48 01 d0             	add    %rdx,%rax
  8009df:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009e2:	83 c2 08             	add    $0x8,%edx
  8009e5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009e8:	eb 0c                	jmp    8009f6 <vprintfmt+0x1aa>
  8009ea:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8009ee:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8009f2:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009f6:	8b 10                	mov    (%rax),%edx
  8009f8:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8009fc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a00:	48 89 ce             	mov    %rcx,%rsi
  800a03:	89 d7                	mov    %edx,%edi
  800a05:	ff d0                	callq  *%rax
  800a07:	e9 37 03 00 00       	jmpq   800d43 <vprintfmt+0x4f7>
  800a0c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a0f:	83 f8 30             	cmp    $0x30,%eax
  800a12:	73 17                	jae    800a2b <vprintfmt+0x1df>
  800a14:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a18:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a1b:	89 d2                	mov    %edx,%edx
  800a1d:	48 01 d0             	add    %rdx,%rax
  800a20:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a23:	83 c2 08             	add    $0x8,%edx
  800a26:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a29:	eb 0c                	jmp    800a37 <vprintfmt+0x1eb>
  800a2b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a2f:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a33:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a37:	8b 18                	mov    (%rax),%ebx
  800a39:	85 db                	test   %ebx,%ebx
  800a3b:	79 02                	jns    800a3f <vprintfmt+0x1f3>
  800a3d:	f7 db                	neg    %ebx
  800a3f:	83 fb 15             	cmp    $0x15,%ebx
  800a42:	7f 16                	jg     800a5a <vprintfmt+0x20e>
  800a44:	48 b8 e0 49 80 00 00 	movabs $0x8049e0,%rax
  800a4b:	00 00 00 
  800a4e:	48 63 d3             	movslq %ebx,%rdx
  800a51:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800a55:	4d 85 e4             	test   %r12,%r12
  800a58:	75 2e                	jne    800a88 <vprintfmt+0x23c>
  800a5a:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a5e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a62:	89 d9                	mov    %ebx,%ecx
  800a64:	48 ba a1 4a 80 00 00 	movabs $0x804aa1,%rdx
  800a6b:	00 00 00 
  800a6e:	48 89 c7             	mov    %rax,%rdi
  800a71:	b8 00 00 00 00       	mov    $0x0,%eax
  800a76:	49 b8 52 0d 80 00 00 	movabs $0x800d52,%r8
  800a7d:	00 00 00 
  800a80:	41 ff d0             	callq  *%r8
  800a83:	e9 bb 02 00 00       	jmpq   800d43 <vprintfmt+0x4f7>
  800a88:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a8c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a90:	4c 89 e1             	mov    %r12,%rcx
  800a93:	48 ba aa 4a 80 00 00 	movabs $0x804aaa,%rdx
  800a9a:	00 00 00 
  800a9d:	48 89 c7             	mov    %rax,%rdi
  800aa0:	b8 00 00 00 00       	mov    $0x0,%eax
  800aa5:	49 b8 52 0d 80 00 00 	movabs $0x800d52,%r8
  800aac:	00 00 00 
  800aaf:	41 ff d0             	callq  *%r8
  800ab2:	e9 8c 02 00 00       	jmpq   800d43 <vprintfmt+0x4f7>
  800ab7:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800aba:	83 f8 30             	cmp    $0x30,%eax
  800abd:	73 17                	jae    800ad6 <vprintfmt+0x28a>
  800abf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ac3:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ac6:	89 d2                	mov    %edx,%edx
  800ac8:	48 01 d0             	add    %rdx,%rax
  800acb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ace:	83 c2 08             	add    $0x8,%edx
  800ad1:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ad4:	eb 0c                	jmp    800ae2 <vprintfmt+0x296>
  800ad6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800ada:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800ade:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ae2:	4c 8b 20             	mov    (%rax),%r12
  800ae5:	4d 85 e4             	test   %r12,%r12
  800ae8:	75 0a                	jne    800af4 <vprintfmt+0x2a8>
  800aea:	49 bc ad 4a 80 00 00 	movabs $0x804aad,%r12
  800af1:	00 00 00 
  800af4:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800af8:	7e 78                	jle    800b72 <vprintfmt+0x326>
  800afa:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800afe:	74 72                	je     800b72 <vprintfmt+0x326>
  800b00:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b03:	48 98                	cltq   
  800b05:	48 89 c6             	mov    %rax,%rsi
  800b08:	4c 89 e7             	mov    %r12,%rdi
  800b0b:	48 b8 00 10 80 00 00 	movabs $0x801000,%rax
  800b12:	00 00 00 
  800b15:	ff d0                	callq  *%rax
  800b17:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b1a:	eb 17                	jmp    800b33 <vprintfmt+0x2e7>
  800b1c:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b20:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b24:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b28:	48 89 ce             	mov    %rcx,%rsi
  800b2b:	89 d7                	mov    %edx,%edi
  800b2d:	ff d0                	callq  *%rax
  800b2f:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b33:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b37:	7f e3                	jg     800b1c <vprintfmt+0x2d0>
  800b39:	eb 37                	jmp    800b72 <vprintfmt+0x326>
  800b3b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800b3f:	74 1e                	je     800b5f <vprintfmt+0x313>
  800b41:	83 fb 1f             	cmp    $0x1f,%ebx
  800b44:	7e 05                	jle    800b4b <vprintfmt+0x2ff>
  800b46:	83 fb 7e             	cmp    $0x7e,%ebx
  800b49:	7e 14                	jle    800b5f <vprintfmt+0x313>
  800b4b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b4f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b53:	48 89 d6             	mov    %rdx,%rsi
  800b56:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800b5b:	ff d0                	callq  *%rax
  800b5d:	eb 0f                	jmp    800b6e <vprintfmt+0x322>
  800b5f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b63:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b67:	48 89 d6             	mov    %rdx,%rsi
  800b6a:	89 df                	mov    %ebx,%edi
  800b6c:	ff d0                	callq  *%rax
  800b6e:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b72:	4c 89 e0             	mov    %r12,%rax
  800b75:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800b79:	0f b6 00             	movzbl (%rax),%eax
  800b7c:	0f be d8             	movsbl %al,%ebx
  800b7f:	85 db                	test   %ebx,%ebx
  800b81:	74 28                	je     800bab <vprintfmt+0x35f>
  800b83:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800b87:	78 b2                	js     800b3b <vprintfmt+0x2ef>
  800b89:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800b8d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800b91:	79 a8                	jns    800b3b <vprintfmt+0x2ef>
  800b93:	eb 16                	jmp    800bab <vprintfmt+0x35f>
  800b95:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b99:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b9d:	48 89 d6             	mov    %rdx,%rsi
  800ba0:	bf 20 00 00 00       	mov    $0x20,%edi
  800ba5:	ff d0                	callq  *%rax
  800ba7:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bab:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800baf:	7f e4                	jg     800b95 <vprintfmt+0x349>
  800bb1:	e9 8d 01 00 00       	jmpq   800d43 <vprintfmt+0x4f7>
  800bb6:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bba:	be 03 00 00 00       	mov    $0x3,%esi
  800bbf:	48 89 c7             	mov    %rax,%rdi
  800bc2:	48 b8 45 07 80 00 00 	movabs $0x800745,%rax
  800bc9:	00 00 00 
  800bcc:	ff d0                	callq  *%rax
  800bce:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bd2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bd6:	48 85 c0             	test   %rax,%rax
  800bd9:	79 1d                	jns    800bf8 <vprintfmt+0x3ac>
  800bdb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bdf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800be3:	48 89 d6             	mov    %rdx,%rsi
  800be6:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800beb:	ff d0                	callq  *%rax
  800bed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bf1:	48 f7 d8             	neg    %rax
  800bf4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bf8:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800bff:	e9 d2 00 00 00       	jmpq   800cd6 <vprintfmt+0x48a>
  800c04:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c08:	be 03 00 00 00       	mov    $0x3,%esi
  800c0d:	48 89 c7             	mov    %rax,%rdi
  800c10:	48 b8 3e 06 80 00 00 	movabs $0x80063e,%rax
  800c17:	00 00 00 
  800c1a:	ff d0                	callq  *%rax
  800c1c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c20:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c27:	e9 aa 00 00 00       	jmpq   800cd6 <vprintfmt+0x48a>
  800c2c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c30:	be 03 00 00 00       	mov    $0x3,%esi
  800c35:	48 89 c7             	mov    %rax,%rdi
  800c38:	48 b8 3e 06 80 00 00 	movabs $0x80063e,%rax
  800c3f:	00 00 00 
  800c42:	ff d0                	callq  *%rax
  800c44:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c48:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800c4f:	e9 82 00 00 00       	jmpq   800cd6 <vprintfmt+0x48a>
  800c54:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c58:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c5c:	48 89 d6             	mov    %rdx,%rsi
  800c5f:	bf 30 00 00 00       	mov    $0x30,%edi
  800c64:	ff d0                	callq  *%rax
  800c66:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c6a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c6e:	48 89 d6             	mov    %rdx,%rsi
  800c71:	bf 78 00 00 00       	mov    $0x78,%edi
  800c76:	ff d0                	callq  *%rax
  800c78:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800c7b:	83 f8 30             	cmp    $0x30,%eax
  800c7e:	73 17                	jae    800c97 <vprintfmt+0x44b>
  800c80:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c84:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c87:	89 d2                	mov    %edx,%edx
  800c89:	48 01 d0             	add    %rdx,%rax
  800c8c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800c8f:	83 c2 08             	add    $0x8,%edx
  800c92:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800c95:	eb 0c                	jmp    800ca3 <vprintfmt+0x457>
  800c97:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800c9b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800c9f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ca3:	48 8b 00             	mov    (%rax),%rax
  800ca6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800caa:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800cb1:	eb 23                	jmp    800cd6 <vprintfmt+0x48a>
  800cb3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cb7:	be 03 00 00 00       	mov    $0x3,%esi
  800cbc:	48 89 c7             	mov    %rax,%rdi
  800cbf:	48 b8 3e 06 80 00 00 	movabs $0x80063e,%rax
  800cc6:	00 00 00 
  800cc9:	ff d0                	callq  *%rax
  800ccb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ccf:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800cd6:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800cdb:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800cde:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800ce1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ce5:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ce9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ced:	45 89 c1             	mov    %r8d,%r9d
  800cf0:	41 89 f8             	mov    %edi,%r8d
  800cf3:	48 89 c7             	mov    %rax,%rdi
  800cf6:	48 b8 86 05 80 00 00 	movabs $0x800586,%rax
  800cfd:	00 00 00 
  800d00:	ff d0                	callq  *%rax
  800d02:	eb 3f                	jmp    800d43 <vprintfmt+0x4f7>
  800d04:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d08:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d0c:	48 89 d6             	mov    %rdx,%rsi
  800d0f:	89 df                	mov    %ebx,%edi
  800d11:	ff d0                	callq  *%rax
  800d13:	eb 2e                	jmp    800d43 <vprintfmt+0x4f7>
  800d15:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d19:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d1d:	48 89 d6             	mov    %rdx,%rsi
  800d20:	bf 25 00 00 00       	mov    $0x25,%edi
  800d25:	ff d0                	callq  *%rax
  800d27:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d2c:	eb 05                	jmp    800d33 <vprintfmt+0x4e7>
  800d2e:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d33:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d37:	48 83 e8 01          	sub    $0x1,%rax
  800d3b:	0f b6 00             	movzbl (%rax),%eax
  800d3e:	3c 25                	cmp    $0x25,%al
  800d40:	75 ec                	jne    800d2e <vprintfmt+0x4e2>
  800d42:	90                   	nop
  800d43:	e9 3d fb ff ff       	jmpq   800885 <vprintfmt+0x39>
  800d48:	90                   	nop
  800d49:	48 83 c4 60          	add    $0x60,%rsp
  800d4d:	5b                   	pop    %rbx
  800d4e:	41 5c                	pop    %r12
  800d50:	5d                   	pop    %rbp
  800d51:	c3                   	retq   

0000000000800d52 <printfmt>:
  800d52:	55                   	push   %rbp
  800d53:	48 89 e5             	mov    %rsp,%rbp
  800d56:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800d5d:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800d64:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800d6b:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800d72:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800d79:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800d80:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800d87:	84 c0                	test   %al,%al
  800d89:	74 20                	je     800dab <printfmt+0x59>
  800d8b:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800d8f:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800d93:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800d97:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800d9b:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800d9f:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800da3:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800da7:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800dab:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800db2:	00 00 00 
  800db5:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800dbc:	00 00 00 
  800dbf:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800dc3:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800dca:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800dd1:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800dd8:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800ddf:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800de6:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800ded:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800df4:	48 89 c7             	mov    %rax,%rdi
  800df7:	48 b8 4c 08 80 00 00 	movabs $0x80084c,%rax
  800dfe:	00 00 00 
  800e01:	ff d0                	callq  *%rax
  800e03:	90                   	nop
  800e04:	c9                   	leaveq 
  800e05:	c3                   	retq   

0000000000800e06 <sprintputch>:
  800e06:	55                   	push   %rbp
  800e07:	48 89 e5             	mov    %rsp,%rbp
  800e0a:	48 83 ec 10          	sub    $0x10,%rsp
  800e0e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e11:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e15:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e19:	8b 40 10             	mov    0x10(%rax),%eax
  800e1c:	8d 50 01             	lea    0x1(%rax),%edx
  800e1f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e23:	89 50 10             	mov    %edx,0x10(%rax)
  800e26:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e2a:	48 8b 10             	mov    (%rax),%rdx
  800e2d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e31:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e35:	48 39 c2             	cmp    %rax,%rdx
  800e38:	73 17                	jae    800e51 <sprintputch+0x4b>
  800e3a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e3e:	48 8b 00             	mov    (%rax),%rax
  800e41:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800e45:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e49:	48 89 0a             	mov    %rcx,(%rdx)
  800e4c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e4f:	88 10                	mov    %dl,(%rax)
  800e51:	90                   	nop
  800e52:	c9                   	leaveq 
  800e53:	c3                   	retq   

0000000000800e54 <vsnprintf>:
  800e54:	55                   	push   %rbp
  800e55:	48 89 e5             	mov    %rsp,%rbp
  800e58:	48 83 ec 50          	sub    $0x50,%rsp
  800e5c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800e60:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800e63:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800e67:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800e6b:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800e6f:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800e73:	48 8b 0a             	mov    (%rdx),%rcx
  800e76:	48 89 08             	mov    %rcx,(%rax)
  800e79:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800e7d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800e81:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800e85:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800e89:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e8d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800e91:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800e94:	48 98                	cltq   
  800e96:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800e9a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e9e:	48 01 d0             	add    %rdx,%rax
  800ea1:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800ea5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800eac:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800eb1:	74 06                	je     800eb9 <vsnprintf+0x65>
  800eb3:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800eb7:	7f 07                	jg     800ec0 <vsnprintf+0x6c>
  800eb9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800ebe:	eb 2f                	jmp    800eef <vsnprintf+0x9b>
  800ec0:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800ec4:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800ec8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800ecc:	48 89 c6             	mov    %rax,%rsi
  800ecf:	48 bf 06 0e 80 00 00 	movabs $0x800e06,%rdi
  800ed6:	00 00 00 
  800ed9:	48 b8 4c 08 80 00 00 	movabs $0x80084c,%rax
  800ee0:	00 00 00 
  800ee3:	ff d0                	callq  *%rax
  800ee5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800ee9:	c6 00 00             	movb   $0x0,(%rax)
  800eec:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800eef:	c9                   	leaveq 
  800ef0:	c3                   	retq   

0000000000800ef1 <snprintf>:
  800ef1:	55                   	push   %rbp
  800ef2:	48 89 e5             	mov    %rsp,%rbp
  800ef5:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800efc:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f03:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f09:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800f10:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f17:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f1e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f25:	84 c0                	test   %al,%al
  800f27:	74 20                	je     800f49 <snprintf+0x58>
  800f29:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f2d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f31:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f35:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f39:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f3d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f41:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f45:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f49:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800f50:	00 00 00 
  800f53:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800f5a:	00 00 00 
  800f5d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f61:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800f68:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800f6f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800f76:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800f7d:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800f84:	48 8b 0a             	mov    (%rdx),%rcx
  800f87:	48 89 08             	mov    %rcx,(%rax)
  800f8a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800f8e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800f92:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800f96:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f9a:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800fa1:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800fa8:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800fae:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800fb5:	48 89 c7             	mov    %rax,%rdi
  800fb8:	48 b8 54 0e 80 00 00 	movabs $0x800e54,%rax
  800fbf:	00 00 00 
  800fc2:	ff d0                	callq  *%rax
  800fc4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800fca:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800fd0:	c9                   	leaveq 
  800fd1:	c3                   	retq   

0000000000800fd2 <strlen>:
  800fd2:	55                   	push   %rbp
  800fd3:	48 89 e5             	mov    %rsp,%rbp
  800fd6:	48 83 ec 18          	sub    $0x18,%rsp
  800fda:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fde:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800fe5:	eb 09                	jmp    800ff0 <strlen+0x1e>
  800fe7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800feb:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800ff0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ff4:	0f b6 00             	movzbl (%rax),%eax
  800ff7:	84 c0                	test   %al,%al
  800ff9:	75 ec                	jne    800fe7 <strlen+0x15>
  800ffb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ffe:	c9                   	leaveq 
  800fff:	c3                   	retq   

0000000000801000 <strnlen>:
  801000:	55                   	push   %rbp
  801001:	48 89 e5             	mov    %rsp,%rbp
  801004:	48 83 ec 20          	sub    $0x20,%rsp
  801008:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80100c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801010:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801017:	eb 0e                	jmp    801027 <strnlen+0x27>
  801019:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80101d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801022:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801027:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80102c:	74 0b                	je     801039 <strnlen+0x39>
  80102e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801032:	0f b6 00             	movzbl (%rax),%eax
  801035:	84 c0                	test   %al,%al
  801037:	75 e0                	jne    801019 <strnlen+0x19>
  801039:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80103c:	c9                   	leaveq 
  80103d:	c3                   	retq   

000000000080103e <strcpy>:
  80103e:	55                   	push   %rbp
  80103f:	48 89 e5             	mov    %rsp,%rbp
  801042:	48 83 ec 20          	sub    $0x20,%rsp
  801046:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80104a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80104e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801052:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801056:	90                   	nop
  801057:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80105b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80105f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801063:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801067:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80106b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80106f:	0f b6 12             	movzbl (%rdx),%edx
  801072:	88 10                	mov    %dl,(%rax)
  801074:	0f b6 00             	movzbl (%rax),%eax
  801077:	84 c0                	test   %al,%al
  801079:	75 dc                	jne    801057 <strcpy+0x19>
  80107b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80107f:	c9                   	leaveq 
  801080:	c3                   	retq   

0000000000801081 <strcat>:
  801081:	55                   	push   %rbp
  801082:	48 89 e5             	mov    %rsp,%rbp
  801085:	48 83 ec 20          	sub    $0x20,%rsp
  801089:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80108d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801091:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801095:	48 89 c7             	mov    %rax,%rdi
  801098:	48 b8 d2 0f 80 00 00 	movabs $0x800fd2,%rax
  80109f:	00 00 00 
  8010a2:	ff d0                	callq  *%rax
  8010a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010aa:	48 63 d0             	movslq %eax,%rdx
  8010ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010b1:	48 01 c2             	add    %rax,%rdx
  8010b4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010b8:	48 89 c6             	mov    %rax,%rsi
  8010bb:	48 89 d7             	mov    %rdx,%rdi
  8010be:	48 b8 3e 10 80 00 00 	movabs $0x80103e,%rax
  8010c5:	00 00 00 
  8010c8:	ff d0                	callq  *%rax
  8010ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010ce:	c9                   	leaveq 
  8010cf:	c3                   	retq   

00000000008010d0 <strncpy>:
  8010d0:	55                   	push   %rbp
  8010d1:	48 89 e5             	mov    %rsp,%rbp
  8010d4:	48 83 ec 28          	sub    $0x28,%rsp
  8010d8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010dc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010e0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8010e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010e8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8010ec:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8010f3:	00 
  8010f4:	eb 2a                	jmp    801120 <strncpy+0x50>
  8010f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010fa:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8010fe:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801102:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801106:	0f b6 12             	movzbl (%rdx),%edx
  801109:	88 10                	mov    %dl,(%rax)
  80110b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80110f:	0f b6 00             	movzbl (%rax),%eax
  801112:	84 c0                	test   %al,%al
  801114:	74 05                	je     80111b <strncpy+0x4b>
  801116:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80111b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801120:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801124:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801128:	72 cc                	jb     8010f6 <strncpy+0x26>
  80112a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80112e:	c9                   	leaveq 
  80112f:	c3                   	retq   

0000000000801130 <strlcpy>:
  801130:	55                   	push   %rbp
  801131:	48 89 e5             	mov    %rsp,%rbp
  801134:	48 83 ec 28          	sub    $0x28,%rsp
  801138:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80113c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801140:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801144:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801148:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80114c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801151:	74 3d                	je     801190 <strlcpy+0x60>
  801153:	eb 1d                	jmp    801172 <strlcpy+0x42>
  801155:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801159:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80115d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801161:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801165:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801169:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80116d:	0f b6 12             	movzbl (%rdx),%edx
  801170:	88 10                	mov    %dl,(%rax)
  801172:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801177:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80117c:	74 0b                	je     801189 <strlcpy+0x59>
  80117e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801182:	0f b6 00             	movzbl (%rax),%eax
  801185:	84 c0                	test   %al,%al
  801187:	75 cc                	jne    801155 <strlcpy+0x25>
  801189:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80118d:	c6 00 00             	movb   $0x0,(%rax)
  801190:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801194:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801198:	48 29 c2             	sub    %rax,%rdx
  80119b:	48 89 d0             	mov    %rdx,%rax
  80119e:	c9                   	leaveq 
  80119f:	c3                   	retq   

00000000008011a0 <strcmp>:
  8011a0:	55                   	push   %rbp
  8011a1:	48 89 e5             	mov    %rsp,%rbp
  8011a4:	48 83 ec 10          	sub    $0x10,%rsp
  8011a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011ac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011b0:	eb 0a                	jmp    8011bc <strcmp+0x1c>
  8011b2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011b7:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8011bc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011c0:	0f b6 00             	movzbl (%rax),%eax
  8011c3:	84 c0                	test   %al,%al
  8011c5:	74 12                	je     8011d9 <strcmp+0x39>
  8011c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011cb:	0f b6 10             	movzbl (%rax),%edx
  8011ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011d2:	0f b6 00             	movzbl (%rax),%eax
  8011d5:	38 c2                	cmp    %al,%dl
  8011d7:	74 d9                	je     8011b2 <strcmp+0x12>
  8011d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011dd:	0f b6 00             	movzbl (%rax),%eax
  8011e0:	0f b6 d0             	movzbl %al,%edx
  8011e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011e7:	0f b6 00             	movzbl (%rax),%eax
  8011ea:	0f b6 c0             	movzbl %al,%eax
  8011ed:	29 c2                	sub    %eax,%edx
  8011ef:	89 d0                	mov    %edx,%eax
  8011f1:	c9                   	leaveq 
  8011f2:	c3                   	retq   

00000000008011f3 <strncmp>:
  8011f3:	55                   	push   %rbp
  8011f4:	48 89 e5             	mov    %rsp,%rbp
  8011f7:	48 83 ec 18          	sub    $0x18,%rsp
  8011fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801203:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801207:	eb 0f                	jmp    801218 <strncmp+0x25>
  801209:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80120e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801213:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801218:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80121d:	74 1d                	je     80123c <strncmp+0x49>
  80121f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801223:	0f b6 00             	movzbl (%rax),%eax
  801226:	84 c0                	test   %al,%al
  801228:	74 12                	je     80123c <strncmp+0x49>
  80122a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80122e:	0f b6 10             	movzbl (%rax),%edx
  801231:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801235:	0f b6 00             	movzbl (%rax),%eax
  801238:	38 c2                	cmp    %al,%dl
  80123a:	74 cd                	je     801209 <strncmp+0x16>
  80123c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801241:	75 07                	jne    80124a <strncmp+0x57>
  801243:	b8 00 00 00 00       	mov    $0x0,%eax
  801248:	eb 18                	jmp    801262 <strncmp+0x6f>
  80124a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80124e:	0f b6 00             	movzbl (%rax),%eax
  801251:	0f b6 d0             	movzbl %al,%edx
  801254:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801258:	0f b6 00             	movzbl (%rax),%eax
  80125b:	0f b6 c0             	movzbl %al,%eax
  80125e:	29 c2                	sub    %eax,%edx
  801260:	89 d0                	mov    %edx,%eax
  801262:	c9                   	leaveq 
  801263:	c3                   	retq   

0000000000801264 <strchr>:
  801264:	55                   	push   %rbp
  801265:	48 89 e5             	mov    %rsp,%rbp
  801268:	48 83 ec 10          	sub    $0x10,%rsp
  80126c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801270:	89 f0                	mov    %esi,%eax
  801272:	88 45 f4             	mov    %al,-0xc(%rbp)
  801275:	eb 17                	jmp    80128e <strchr+0x2a>
  801277:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80127b:	0f b6 00             	movzbl (%rax),%eax
  80127e:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801281:	75 06                	jne    801289 <strchr+0x25>
  801283:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801287:	eb 15                	jmp    80129e <strchr+0x3a>
  801289:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80128e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801292:	0f b6 00             	movzbl (%rax),%eax
  801295:	84 c0                	test   %al,%al
  801297:	75 de                	jne    801277 <strchr+0x13>
  801299:	b8 00 00 00 00       	mov    $0x0,%eax
  80129e:	c9                   	leaveq 
  80129f:	c3                   	retq   

00000000008012a0 <strfind>:
  8012a0:	55                   	push   %rbp
  8012a1:	48 89 e5             	mov    %rsp,%rbp
  8012a4:	48 83 ec 10          	sub    $0x10,%rsp
  8012a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012ac:	89 f0                	mov    %esi,%eax
  8012ae:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012b1:	eb 11                	jmp    8012c4 <strfind+0x24>
  8012b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b7:	0f b6 00             	movzbl (%rax),%eax
  8012ba:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012bd:	74 12                	je     8012d1 <strfind+0x31>
  8012bf:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c8:	0f b6 00             	movzbl (%rax),%eax
  8012cb:	84 c0                	test   %al,%al
  8012cd:	75 e4                	jne    8012b3 <strfind+0x13>
  8012cf:	eb 01                	jmp    8012d2 <strfind+0x32>
  8012d1:	90                   	nop
  8012d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012d6:	c9                   	leaveq 
  8012d7:	c3                   	retq   

00000000008012d8 <memset>:
  8012d8:	55                   	push   %rbp
  8012d9:	48 89 e5             	mov    %rsp,%rbp
  8012dc:	48 83 ec 18          	sub    $0x18,%rsp
  8012e0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012e4:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8012e7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8012eb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012f0:	75 06                	jne    8012f8 <memset+0x20>
  8012f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f6:	eb 69                	jmp    801361 <memset+0x89>
  8012f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012fc:	83 e0 03             	and    $0x3,%eax
  8012ff:	48 85 c0             	test   %rax,%rax
  801302:	75 48                	jne    80134c <memset+0x74>
  801304:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801308:	83 e0 03             	and    $0x3,%eax
  80130b:	48 85 c0             	test   %rax,%rax
  80130e:	75 3c                	jne    80134c <memset+0x74>
  801310:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801317:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80131a:	c1 e0 18             	shl    $0x18,%eax
  80131d:	89 c2                	mov    %eax,%edx
  80131f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801322:	c1 e0 10             	shl    $0x10,%eax
  801325:	09 c2                	or     %eax,%edx
  801327:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80132a:	c1 e0 08             	shl    $0x8,%eax
  80132d:	09 d0                	or     %edx,%eax
  80132f:	09 45 f4             	or     %eax,-0xc(%rbp)
  801332:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801336:	48 c1 e8 02          	shr    $0x2,%rax
  80133a:	48 89 c1             	mov    %rax,%rcx
  80133d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801341:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801344:	48 89 d7             	mov    %rdx,%rdi
  801347:	fc                   	cld    
  801348:	f3 ab                	rep stos %eax,%es:(%rdi)
  80134a:	eb 11                	jmp    80135d <memset+0x85>
  80134c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801350:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801353:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801357:	48 89 d7             	mov    %rdx,%rdi
  80135a:	fc                   	cld    
  80135b:	f3 aa                	rep stos %al,%es:(%rdi)
  80135d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801361:	c9                   	leaveq 
  801362:	c3                   	retq   

0000000000801363 <memmove>:
  801363:	55                   	push   %rbp
  801364:	48 89 e5             	mov    %rsp,%rbp
  801367:	48 83 ec 28          	sub    $0x28,%rsp
  80136b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80136f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801373:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801377:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80137b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80137f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801383:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801387:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80138b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80138f:	0f 83 88 00 00 00    	jae    80141d <memmove+0xba>
  801395:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801399:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80139d:	48 01 d0             	add    %rdx,%rax
  8013a0:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013a4:	76 77                	jbe    80141d <memmove+0xba>
  8013a6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013aa:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8013ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013b2:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8013b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ba:	83 e0 03             	and    $0x3,%eax
  8013bd:	48 85 c0             	test   %rax,%rax
  8013c0:	75 3b                	jne    8013fd <memmove+0x9a>
  8013c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013c6:	83 e0 03             	and    $0x3,%eax
  8013c9:	48 85 c0             	test   %rax,%rax
  8013cc:	75 2f                	jne    8013fd <memmove+0x9a>
  8013ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013d2:	83 e0 03             	and    $0x3,%eax
  8013d5:	48 85 c0             	test   %rax,%rax
  8013d8:	75 23                	jne    8013fd <memmove+0x9a>
  8013da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013de:	48 83 e8 04          	sub    $0x4,%rax
  8013e2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013e6:	48 83 ea 04          	sub    $0x4,%rdx
  8013ea:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8013ee:	48 c1 e9 02          	shr    $0x2,%rcx
  8013f2:	48 89 c7             	mov    %rax,%rdi
  8013f5:	48 89 d6             	mov    %rdx,%rsi
  8013f8:	fd                   	std    
  8013f9:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8013fb:	eb 1d                	jmp    80141a <memmove+0xb7>
  8013fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801401:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801405:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801409:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80140d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801411:	48 89 d7             	mov    %rdx,%rdi
  801414:	48 89 c1             	mov    %rax,%rcx
  801417:	fd                   	std    
  801418:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80141a:	fc                   	cld    
  80141b:	eb 57                	jmp    801474 <memmove+0x111>
  80141d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801421:	83 e0 03             	and    $0x3,%eax
  801424:	48 85 c0             	test   %rax,%rax
  801427:	75 36                	jne    80145f <memmove+0xfc>
  801429:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80142d:	83 e0 03             	and    $0x3,%eax
  801430:	48 85 c0             	test   %rax,%rax
  801433:	75 2a                	jne    80145f <memmove+0xfc>
  801435:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801439:	83 e0 03             	and    $0x3,%eax
  80143c:	48 85 c0             	test   %rax,%rax
  80143f:	75 1e                	jne    80145f <memmove+0xfc>
  801441:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801445:	48 c1 e8 02          	shr    $0x2,%rax
  801449:	48 89 c1             	mov    %rax,%rcx
  80144c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801450:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801454:	48 89 c7             	mov    %rax,%rdi
  801457:	48 89 d6             	mov    %rdx,%rsi
  80145a:	fc                   	cld    
  80145b:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80145d:	eb 15                	jmp    801474 <memmove+0x111>
  80145f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801463:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801467:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80146b:	48 89 c7             	mov    %rax,%rdi
  80146e:	48 89 d6             	mov    %rdx,%rsi
  801471:	fc                   	cld    
  801472:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801474:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801478:	c9                   	leaveq 
  801479:	c3                   	retq   

000000000080147a <memcpy>:
  80147a:	55                   	push   %rbp
  80147b:	48 89 e5             	mov    %rsp,%rbp
  80147e:	48 83 ec 18          	sub    $0x18,%rsp
  801482:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801486:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80148a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80148e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801492:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801496:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80149a:	48 89 ce             	mov    %rcx,%rsi
  80149d:	48 89 c7             	mov    %rax,%rdi
  8014a0:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  8014a7:	00 00 00 
  8014aa:	ff d0                	callq  *%rax
  8014ac:	c9                   	leaveq 
  8014ad:	c3                   	retq   

00000000008014ae <memcmp>:
  8014ae:	55                   	push   %rbp
  8014af:	48 89 e5             	mov    %rsp,%rbp
  8014b2:	48 83 ec 28          	sub    $0x28,%rsp
  8014b6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014ba:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014be:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014c6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8014ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014ce:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8014d2:	eb 36                	jmp    80150a <memcmp+0x5c>
  8014d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d8:	0f b6 10             	movzbl (%rax),%edx
  8014db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014df:	0f b6 00             	movzbl (%rax),%eax
  8014e2:	38 c2                	cmp    %al,%dl
  8014e4:	74 1a                	je     801500 <memcmp+0x52>
  8014e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014ea:	0f b6 00             	movzbl (%rax),%eax
  8014ed:	0f b6 d0             	movzbl %al,%edx
  8014f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014f4:	0f b6 00             	movzbl (%rax),%eax
  8014f7:	0f b6 c0             	movzbl %al,%eax
  8014fa:	29 c2                	sub    %eax,%edx
  8014fc:	89 d0                	mov    %edx,%eax
  8014fe:	eb 20                	jmp    801520 <memcmp+0x72>
  801500:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801505:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80150a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80150e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801512:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801516:	48 85 c0             	test   %rax,%rax
  801519:	75 b9                	jne    8014d4 <memcmp+0x26>
  80151b:	b8 00 00 00 00       	mov    $0x0,%eax
  801520:	c9                   	leaveq 
  801521:	c3                   	retq   

0000000000801522 <memfind>:
  801522:	55                   	push   %rbp
  801523:	48 89 e5             	mov    %rsp,%rbp
  801526:	48 83 ec 28          	sub    $0x28,%rsp
  80152a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80152e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801531:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801535:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801539:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80153d:	48 01 d0             	add    %rdx,%rax
  801540:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801544:	eb 13                	jmp    801559 <memfind+0x37>
  801546:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80154a:	0f b6 00             	movzbl (%rax),%eax
  80154d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801550:	38 d0                	cmp    %dl,%al
  801552:	74 11                	je     801565 <memfind+0x43>
  801554:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801559:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80155d:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801561:	72 e3                	jb     801546 <memfind+0x24>
  801563:	eb 01                	jmp    801566 <memfind+0x44>
  801565:	90                   	nop
  801566:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80156a:	c9                   	leaveq 
  80156b:	c3                   	retq   

000000000080156c <strtol>:
  80156c:	55                   	push   %rbp
  80156d:	48 89 e5             	mov    %rsp,%rbp
  801570:	48 83 ec 38          	sub    $0x38,%rsp
  801574:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801578:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80157c:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80157f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801586:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80158d:	00 
  80158e:	eb 05                	jmp    801595 <strtol+0x29>
  801590:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801595:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801599:	0f b6 00             	movzbl (%rax),%eax
  80159c:	3c 20                	cmp    $0x20,%al
  80159e:	74 f0                	je     801590 <strtol+0x24>
  8015a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015a4:	0f b6 00             	movzbl (%rax),%eax
  8015a7:	3c 09                	cmp    $0x9,%al
  8015a9:	74 e5                	je     801590 <strtol+0x24>
  8015ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015af:	0f b6 00             	movzbl (%rax),%eax
  8015b2:	3c 2b                	cmp    $0x2b,%al
  8015b4:	75 07                	jne    8015bd <strtol+0x51>
  8015b6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015bb:	eb 17                	jmp    8015d4 <strtol+0x68>
  8015bd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015c1:	0f b6 00             	movzbl (%rax),%eax
  8015c4:	3c 2d                	cmp    $0x2d,%al
  8015c6:	75 0c                	jne    8015d4 <strtol+0x68>
  8015c8:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015cd:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8015d4:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8015d8:	74 06                	je     8015e0 <strtol+0x74>
  8015da:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8015de:	75 28                	jne    801608 <strtol+0x9c>
  8015e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015e4:	0f b6 00             	movzbl (%rax),%eax
  8015e7:	3c 30                	cmp    $0x30,%al
  8015e9:	75 1d                	jne    801608 <strtol+0x9c>
  8015eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015ef:	48 83 c0 01          	add    $0x1,%rax
  8015f3:	0f b6 00             	movzbl (%rax),%eax
  8015f6:	3c 78                	cmp    $0x78,%al
  8015f8:	75 0e                	jne    801608 <strtol+0x9c>
  8015fa:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8015ff:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801606:	eb 2c                	jmp    801634 <strtol+0xc8>
  801608:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80160c:	75 19                	jne    801627 <strtol+0xbb>
  80160e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801612:	0f b6 00             	movzbl (%rax),%eax
  801615:	3c 30                	cmp    $0x30,%al
  801617:	75 0e                	jne    801627 <strtol+0xbb>
  801619:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80161e:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801625:	eb 0d                	jmp    801634 <strtol+0xc8>
  801627:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80162b:	75 07                	jne    801634 <strtol+0xc8>
  80162d:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801634:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801638:	0f b6 00             	movzbl (%rax),%eax
  80163b:	3c 2f                	cmp    $0x2f,%al
  80163d:	7e 1d                	jle    80165c <strtol+0xf0>
  80163f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801643:	0f b6 00             	movzbl (%rax),%eax
  801646:	3c 39                	cmp    $0x39,%al
  801648:	7f 12                	jg     80165c <strtol+0xf0>
  80164a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80164e:	0f b6 00             	movzbl (%rax),%eax
  801651:	0f be c0             	movsbl %al,%eax
  801654:	83 e8 30             	sub    $0x30,%eax
  801657:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80165a:	eb 4e                	jmp    8016aa <strtol+0x13e>
  80165c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801660:	0f b6 00             	movzbl (%rax),%eax
  801663:	3c 60                	cmp    $0x60,%al
  801665:	7e 1d                	jle    801684 <strtol+0x118>
  801667:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80166b:	0f b6 00             	movzbl (%rax),%eax
  80166e:	3c 7a                	cmp    $0x7a,%al
  801670:	7f 12                	jg     801684 <strtol+0x118>
  801672:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801676:	0f b6 00             	movzbl (%rax),%eax
  801679:	0f be c0             	movsbl %al,%eax
  80167c:	83 e8 57             	sub    $0x57,%eax
  80167f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801682:	eb 26                	jmp    8016aa <strtol+0x13e>
  801684:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801688:	0f b6 00             	movzbl (%rax),%eax
  80168b:	3c 40                	cmp    $0x40,%al
  80168d:	7e 47                	jle    8016d6 <strtol+0x16a>
  80168f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801693:	0f b6 00             	movzbl (%rax),%eax
  801696:	3c 5a                	cmp    $0x5a,%al
  801698:	7f 3c                	jg     8016d6 <strtol+0x16a>
  80169a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80169e:	0f b6 00             	movzbl (%rax),%eax
  8016a1:	0f be c0             	movsbl %al,%eax
  8016a4:	83 e8 37             	sub    $0x37,%eax
  8016a7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016ad:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8016b0:	7d 23                	jge    8016d5 <strtol+0x169>
  8016b2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016b7:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8016ba:	48 98                	cltq   
  8016bc:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8016c1:	48 89 c2             	mov    %rax,%rdx
  8016c4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016c7:	48 98                	cltq   
  8016c9:	48 01 d0             	add    %rdx,%rax
  8016cc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016d0:	e9 5f ff ff ff       	jmpq   801634 <strtol+0xc8>
  8016d5:	90                   	nop
  8016d6:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8016db:	74 0b                	je     8016e8 <strtol+0x17c>
  8016dd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8016e1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8016e5:	48 89 10             	mov    %rdx,(%rax)
  8016e8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8016ec:	74 09                	je     8016f7 <strtol+0x18b>
  8016ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016f2:	48 f7 d8             	neg    %rax
  8016f5:	eb 04                	jmp    8016fb <strtol+0x18f>
  8016f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016fb:	c9                   	leaveq 
  8016fc:	c3                   	retq   

00000000008016fd <strstr>:
  8016fd:	55                   	push   %rbp
  8016fe:	48 89 e5             	mov    %rsp,%rbp
  801701:	48 83 ec 30          	sub    $0x30,%rsp
  801705:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801709:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80170d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801711:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801715:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801719:	0f b6 00             	movzbl (%rax),%eax
  80171c:	88 45 ff             	mov    %al,-0x1(%rbp)
  80171f:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801723:	75 06                	jne    80172b <strstr+0x2e>
  801725:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801729:	eb 6b                	jmp    801796 <strstr+0x99>
  80172b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80172f:	48 89 c7             	mov    %rax,%rdi
  801732:	48 b8 d2 0f 80 00 00 	movabs $0x800fd2,%rax
  801739:	00 00 00 
  80173c:	ff d0                	callq  *%rax
  80173e:	48 98                	cltq   
  801740:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801744:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801748:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80174c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801750:	0f b6 00             	movzbl (%rax),%eax
  801753:	88 45 ef             	mov    %al,-0x11(%rbp)
  801756:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80175a:	75 07                	jne    801763 <strstr+0x66>
  80175c:	b8 00 00 00 00       	mov    $0x0,%eax
  801761:	eb 33                	jmp    801796 <strstr+0x99>
  801763:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801767:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80176a:	75 d8                	jne    801744 <strstr+0x47>
  80176c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801770:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801774:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801778:	48 89 ce             	mov    %rcx,%rsi
  80177b:	48 89 c7             	mov    %rax,%rdi
  80177e:	48 b8 f3 11 80 00 00 	movabs $0x8011f3,%rax
  801785:	00 00 00 
  801788:	ff d0                	callq  *%rax
  80178a:	85 c0                	test   %eax,%eax
  80178c:	75 b6                	jne    801744 <strstr+0x47>
  80178e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801792:	48 83 e8 01          	sub    $0x1,%rax
  801796:	c9                   	leaveq 
  801797:	c3                   	retq   

0000000000801798 <syscall>:
  801798:	55                   	push   %rbp
  801799:	48 89 e5             	mov    %rsp,%rbp
  80179c:	53                   	push   %rbx
  80179d:	48 83 ec 48          	sub    $0x48,%rsp
  8017a1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8017a4:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8017a7:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017ab:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8017af:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8017b3:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8017b7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017ba:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8017be:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8017c2:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8017c6:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8017ca:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8017ce:	4c 89 c3             	mov    %r8,%rbx
  8017d1:	cd 30                	int    $0x30
  8017d3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8017d7:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8017db:	74 3e                	je     80181b <syscall+0x83>
  8017dd:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8017e2:	7e 37                	jle    80181b <syscall+0x83>
  8017e4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017e8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017eb:	49 89 d0             	mov    %rdx,%r8
  8017ee:	89 c1                	mov    %eax,%ecx
  8017f0:	48 ba 68 4d 80 00 00 	movabs $0x804d68,%rdx
  8017f7:	00 00 00 
  8017fa:	be 24 00 00 00       	mov    $0x24,%esi
  8017ff:	48 bf 85 4d 80 00 00 	movabs $0x804d85,%rdi
  801806:	00 00 00 
  801809:	b8 00 00 00 00       	mov    $0x0,%eax
  80180e:	49 b9 74 02 80 00 00 	movabs $0x800274,%r9
  801815:	00 00 00 
  801818:	41 ff d1             	callq  *%r9
  80181b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80181f:	48 83 c4 48          	add    $0x48,%rsp
  801823:	5b                   	pop    %rbx
  801824:	5d                   	pop    %rbp
  801825:	c3                   	retq   

0000000000801826 <sys_cputs>:
  801826:	55                   	push   %rbp
  801827:	48 89 e5             	mov    %rsp,%rbp
  80182a:	48 83 ec 10          	sub    $0x10,%rsp
  80182e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801832:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801836:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80183a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80183e:	48 83 ec 08          	sub    $0x8,%rsp
  801842:	6a 00                	pushq  $0x0
  801844:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80184a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801850:	48 89 d1             	mov    %rdx,%rcx
  801853:	48 89 c2             	mov    %rax,%rdx
  801856:	be 00 00 00 00       	mov    $0x0,%esi
  80185b:	bf 00 00 00 00       	mov    $0x0,%edi
  801860:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801867:	00 00 00 
  80186a:	ff d0                	callq  *%rax
  80186c:	48 83 c4 10          	add    $0x10,%rsp
  801870:	90                   	nop
  801871:	c9                   	leaveq 
  801872:	c3                   	retq   

0000000000801873 <sys_cgetc>:
  801873:	55                   	push   %rbp
  801874:	48 89 e5             	mov    %rsp,%rbp
  801877:	48 83 ec 08          	sub    $0x8,%rsp
  80187b:	6a 00                	pushq  $0x0
  80187d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801883:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801889:	b9 00 00 00 00       	mov    $0x0,%ecx
  80188e:	ba 00 00 00 00       	mov    $0x0,%edx
  801893:	be 00 00 00 00       	mov    $0x0,%esi
  801898:	bf 01 00 00 00       	mov    $0x1,%edi
  80189d:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  8018a4:	00 00 00 
  8018a7:	ff d0                	callq  *%rax
  8018a9:	48 83 c4 10          	add    $0x10,%rsp
  8018ad:	c9                   	leaveq 
  8018ae:	c3                   	retq   

00000000008018af <sys_env_destroy>:
  8018af:	55                   	push   %rbp
  8018b0:	48 89 e5             	mov    %rsp,%rbp
  8018b3:	48 83 ec 10          	sub    $0x10,%rsp
  8018b7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018bd:	48 98                	cltq   
  8018bf:	48 83 ec 08          	sub    $0x8,%rsp
  8018c3:	6a 00                	pushq  $0x0
  8018c5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018cb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018d1:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018d6:	48 89 c2             	mov    %rax,%rdx
  8018d9:	be 01 00 00 00       	mov    $0x1,%esi
  8018de:	bf 03 00 00 00       	mov    $0x3,%edi
  8018e3:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  8018ea:	00 00 00 
  8018ed:	ff d0                	callq  *%rax
  8018ef:	48 83 c4 10          	add    $0x10,%rsp
  8018f3:	c9                   	leaveq 
  8018f4:	c3                   	retq   

00000000008018f5 <sys_getenvid>:
  8018f5:	55                   	push   %rbp
  8018f6:	48 89 e5             	mov    %rsp,%rbp
  8018f9:	48 83 ec 08          	sub    $0x8,%rsp
  8018fd:	6a 00                	pushq  $0x0
  8018ff:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801905:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80190b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801910:	ba 00 00 00 00       	mov    $0x0,%edx
  801915:	be 00 00 00 00       	mov    $0x0,%esi
  80191a:	bf 02 00 00 00       	mov    $0x2,%edi
  80191f:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801926:	00 00 00 
  801929:	ff d0                	callq  *%rax
  80192b:	48 83 c4 10          	add    $0x10,%rsp
  80192f:	c9                   	leaveq 
  801930:	c3                   	retq   

0000000000801931 <sys_yield>:
  801931:	55                   	push   %rbp
  801932:	48 89 e5             	mov    %rsp,%rbp
  801935:	48 83 ec 08          	sub    $0x8,%rsp
  801939:	6a 00                	pushq  $0x0
  80193b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801941:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801947:	b9 00 00 00 00       	mov    $0x0,%ecx
  80194c:	ba 00 00 00 00       	mov    $0x0,%edx
  801951:	be 00 00 00 00       	mov    $0x0,%esi
  801956:	bf 0b 00 00 00       	mov    $0xb,%edi
  80195b:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801962:	00 00 00 
  801965:	ff d0                	callq  *%rax
  801967:	48 83 c4 10          	add    $0x10,%rsp
  80196b:	90                   	nop
  80196c:	c9                   	leaveq 
  80196d:	c3                   	retq   

000000000080196e <sys_page_alloc>:
  80196e:	55                   	push   %rbp
  80196f:	48 89 e5             	mov    %rsp,%rbp
  801972:	48 83 ec 10          	sub    $0x10,%rsp
  801976:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801979:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80197d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801980:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801983:	48 63 c8             	movslq %eax,%rcx
  801986:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80198a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80198d:	48 98                	cltq   
  80198f:	48 83 ec 08          	sub    $0x8,%rsp
  801993:	6a 00                	pushq  $0x0
  801995:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80199b:	49 89 c8             	mov    %rcx,%r8
  80199e:	48 89 d1             	mov    %rdx,%rcx
  8019a1:	48 89 c2             	mov    %rax,%rdx
  8019a4:	be 01 00 00 00       	mov    $0x1,%esi
  8019a9:	bf 04 00 00 00       	mov    $0x4,%edi
  8019ae:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  8019b5:	00 00 00 
  8019b8:	ff d0                	callq  *%rax
  8019ba:	48 83 c4 10          	add    $0x10,%rsp
  8019be:	c9                   	leaveq 
  8019bf:	c3                   	retq   

00000000008019c0 <sys_page_map>:
  8019c0:	55                   	push   %rbp
  8019c1:	48 89 e5             	mov    %rsp,%rbp
  8019c4:	48 83 ec 20          	sub    $0x20,%rsp
  8019c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019cb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019cf:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019d2:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8019d6:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8019da:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8019dd:	48 63 c8             	movslq %eax,%rcx
  8019e0:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8019e4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019e7:	48 63 f0             	movslq %eax,%rsi
  8019ea:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019ee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019f1:	48 98                	cltq   
  8019f3:	48 83 ec 08          	sub    $0x8,%rsp
  8019f7:	51                   	push   %rcx
  8019f8:	49 89 f9             	mov    %rdi,%r9
  8019fb:	49 89 f0             	mov    %rsi,%r8
  8019fe:	48 89 d1             	mov    %rdx,%rcx
  801a01:	48 89 c2             	mov    %rax,%rdx
  801a04:	be 01 00 00 00       	mov    $0x1,%esi
  801a09:	bf 05 00 00 00       	mov    $0x5,%edi
  801a0e:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801a15:	00 00 00 
  801a18:	ff d0                	callq  *%rax
  801a1a:	48 83 c4 10          	add    $0x10,%rsp
  801a1e:	c9                   	leaveq 
  801a1f:	c3                   	retq   

0000000000801a20 <sys_page_unmap>:
  801a20:	55                   	push   %rbp
  801a21:	48 89 e5             	mov    %rsp,%rbp
  801a24:	48 83 ec 10          	sub    $0x10,%rsp
  801a28:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a2b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a2f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a36:	48 98                	cltq   
  801a38:	48 83 ec 08          	sub    $0x8,%rsp
  801a3c:	6a 00                	pushq  $0x0
  801a3e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a44:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a4a:	48 89 d1             	mov    %rdx,%rcx
  801a4d:	48 89 c2             	mov    %rax,%rdx
  801a50:	be 01 00 00 00       	mov    $0x1,%esi
  801a55:	bf 06 00 00 00       	mov    $0x6,%edi
  801a5a:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801a61:	00 00 00 
  801a64:	ff d0                	callq  *%rax
  801a66:	48 83 c4 10          	add    $0x10,%rsp
  801a6a:	c9                   	leaveq 
  801a6b:	c3                   	retq   

0000000000801a6c <sys_env_set_status>:
  801a6c:	55                   	push   %rbp
  801a6d:	48 89 e5             	mov    %rsp,%rbp
  801a70:	48 83 ec 10          	sub    $0x10,%rsp
  801a74:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a77:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801a7a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a7d:	48 63 d0             	movslq %eax,%rdx
  801a80:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a83:	48 98                	cltq   
  801a85:	48 83 ec 08          	sub    $0x8,%rsp
  801a89:	6a 00                	pushq  $0x0
  801a8b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a91:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a97:	48 89 d1             	mov    %rdx,%rcx
  801a9a:	48 89 c2             	mov    %rax,%rdx
  801a9d:	be 01 00 00 00       	mov    $0x1,%esi
  801aa2:	bf 08 00 00 00       	mov    $0x8,%edi
  801aa7:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801aae:	00 00 00 
  801ab1:	ff d0                	callq  *%rax
  801ab3:	48 83 c4 10          	add    $0x10,%rsp
  801ab7:	c9                   	leaveq 
  801ab8:	c3                   	retq   

0000000000801ab9 <sys_env_set_trapframe>:
  801ab9:	55                   	push   %rbp
  801aba:	48 89 e5             	mov    %rsp,%rbp
  801abd:	48 83 ec 10          	sub    $0x10,%rsp
  801ac1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ac4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ac8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801acc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801acf:	48 98                	cltq   
  801ad1:	48 83 ec 08          	sub    $0x8,%rsp
  801ad5:	6a 00                	pushq  $0x0
  801ad7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801add:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ae3:	48 89 d1             	mov    %rdx,%rcx
  801ae6:	48 89 c2             	mov    %rax,%rdx
  801ae9:	be 01 00 00 00       	mov    $0x1,%esi
  801aee:	bf 09 00 00 00       	mov    $0x9,%edi
  801af3:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801afa:	00 00 00 
  801afd:	ff d0                	callq  *%rax
  801aff:	48 83 c4 10          	add    $0x10,%rsp
  801b03:	c9                   	leaveq 
  801b04:	c3                   	retq   

0000000000801b05 <sys_env_set_pgfault_upcall>:
  801b05:	55                   	push   %rbp
  801b06:	48 89 e5             	mov    %rsp,%rbp
  801b09:	48 83 ec 10          	sub    $0x10,%rsp
  801b0d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b10:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b14:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b18:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b1b:	48 98                	cltq   
  801b1d:	48 83 ec 08          	sub    $0x8,%rsp
  801b21:	6a 00                	pushq  $0x0
  801b23:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b29:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b2f:	48 89 d1             	mov    %rdx,%rcx
  801b32:	48 89 c2             	mov    %rax,%rdx
  801b35:	be 01 00 00 00       	mov    $0x1,%esi
  801b3a:	bf 0a 00 00 00       	mov    $0xa,%edi
  801b3f:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801b46:	00 00 00 
  801b49:	ff d0                	callq  *%rax
  801b4b:	48 83 c4 10          	add    $0x10,%rsp
  801b4f:	c9                   	leaveq 
  801b50:	c3                   	retq   

0000000000801b51 <sys_ipc_try_send>:
  801b51:	55                   	push   %rbp
  801b52:	48 89 e5             	mov    %rsp,%rbp
  801b55:	48 83 ec 20          	sub    $0x20,%rsp
  801b59:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b5c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b60:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801b64:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801b67:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801b6a:	48 63 f0             	movslq %eax,%rsi
  801b6d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801b71:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b74:	48 98                	cltq   
  801b76:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b7a:	48 83 ec 08          	sub    $0x8,%rsp
  801b7e:	6a 00                	pushq  $0x0
  801b80:	49 89 f1             	mov    %rsi,%r9
  801b83:	49 89 c8             	mov    %rcx,%r8
  801b86:	48 89 d1             	mov    %rdx,%rcx
  801b89:	48 89 c2             	mov    %rax,%rdx
  801b8c:	be 00 00 00 00       	mov    $0x0,%esi
  801b91:	bf 0c 00 00 00       	mov    $0xc,%edi
  801b96:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801b9d:	00 00 00 
  801ba0:	ff d0                	callq  *%rax
  801ba2:	48 83 c4 10          	add    $0x10,%rsp
  801ba6:	c9                   	leaveq 
  801ba7:	c3                   	retq   

0000000000801ba8 <sys_ipc_recv>:
  801ba8:	55                   	push   %rbp
  801ba9:	48 89 e5             	mov    %rsp,%rbp
  801bac:	48 83 ec 10          	sub    $0x10,%rsp
  801bb0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bb4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bb8:	48 83 ec 08          	sub    $0x8,%rsp
  801bbc:	6a 00                	pushq  $0x0
  801bbe:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bc4:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bca:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bcf:	48 89 c2             	mov    %rax,%rdx
  801bd2:	be 01 00 00 00       	mov    $0x1,%esi
  801bd7:	bf 0d 00 00 00       	mov    $0xd,%edi
  801bdc:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801be3:	00 00 00 
  801be6:	ff d0                	callq  *%rax
  801be8:	48 83 c4 10          	add    $0x10,%rsp
  801bec:	c9                   	leaveq 
  801bed:	c3                   	retq   

0000000000801bee <sys_time_msec>:
  801bee:	55                   	push   %rbp
  801bef:	48 89 e5             	mov    %rsp,%rbp
  801bf2:	48 83 ec 08          	sub    $0x8,%rsp
  801bf6:	6a 00                	pushq  $0x0
  801bf8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bfe:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c04:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c09:	ba 00 00 00 00       	mov    $0x0,%edx
  801c0e:	be 00 00 00 00       	mov    $0x0,%esi
  801c13:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c18:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801c1f:	00 00 00 
  801c22:	ff d0                	callq  *%rax
  801c24:	48 83 c4 10          	add    $0x10,%rsp
  801c28:	c9                   	leaveq 
  801c29:	c3                   	retq   

0000000000801c2a <sys_net_transmit>:
  801c2a:	55                   	push   %rbp
  801c2b:	48 89 e5             	mov    %rsp,%rbp
  801c2e:	48 83 ec 10          	sub    $0x10,%rsp
  801c32:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c36:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c39:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c3c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c40:	48 83 ec 08          	sub    $0x8,%rsp
  801c44:	6a 00                	pushq  $0x0
  801c46:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c4c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c52:	48 89 d1             	mov    %rdx,%rcx
  801c55:	48 89 c2             	mov    %rax,%rdx
  801c58:	be 00 00 00 00       	mov    $0x0,%esi
  801c5d:	bf 0f 00 00 00       	mov    $0xf,%edi
  801c62:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801c69:	00 00 00 
  801c6c:	ff d0                	callq  *%rax
  801c6e:	48 83 c4 10          	add    $0x10,%rsp
  801c72:	c9                   	leaveq 
  801c73:	c3                   	retq   

0000000000801c74 <sys_net_receive>:
  801c74:	55                   	push   %rbp
  801c75:	48 89 e5             	mov    %rsp,%rbp
  801c78:	48 83 ec 10          	sub    $0x10,%rsp
  801c7c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c80:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c83:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c86:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c8a:	48 83 ec 08          	sub    $0x8,%rsp
  801c8e:	6a 00                	pushq  $0x0
  801c90:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c96:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c9c:	48 89 d1             	mov    %rdx,%rcx
  801c9f:	48 89 c2             	mov    %rax,%rdx
  801ca2:	be 00 00 00 00       	mov    $0x0,%esi
  801ca7:	bf 10 00 00 00       	mov    $0x10,%edi
  801cac:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801cb3:	00 00 00 
  801cb6:	ff d0                	callq  *%rax
  801cb8:	48 83 c4 10          	add    $0x10,%rsp
  801cbc:	c9                   	leaveq 
  801cbd:	c3                   	retq   

0000000000801cbe <sys_ept_map>:
  801cbe:	55                   	push   %rbp
  801cbf:	48 89 e5             	mov    %rsp,%rbp
  801cc2:	48 83 ec 20          	sub    $0x20,%rsp
  801cc6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cc9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ccd:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cd0:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801cd4:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801cd8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801cdb:	48 63 c8             	movslq %eax,%rcx
  801cde:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801ce2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ce5:	48 63 f0             	movslq %eax,%rsi
  801ce8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cef:	48 98                	cltq   
  801cf1:	48 83 ec 08          	sub    $0x8,%rsp
  801cf5:	51                   	push   %rcx
  801cf6:	49 89 f9             	mov    %rdi,%r9
  801cf9:	49 89 f0             	mov    %rsi,%r8
  801cfc:	48 89 d1             	mov    %rdx,%rcx
  801cff:	48 89 c2             	mov    %rax,%rdx
  801d02:	be 00 00 00 00       	mov    $0x0,%esi
  801d07:	bf 11 00 00 00       	mov    $0x11,%edi
  801d0c:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801d13:	00 00 00 
  801d16:	ff d0                	callq  *%rax
  801d18:	48 83 c4 10          	add    $0x10,%rsp
  801d1c:	c9                   	leaveq 
  801d1d:	c3                   	retq   

0000000000801d1e <sys_env_mkguest>:
  801d1e:	55                   	push   %rbp
  801d1f:	48 89 e5             	mov    %rsp,%rbp
  801d22:	48 83 ec 10          	sub    $0x10,%rsp
  801d26:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d2a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d2e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d36:	48 83 ec 08          	sub    $0x8,%rsp
  801d3a:	6a 00                	pushq  $0x0
  801d3c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d42:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d48:	48 89 d1             	mov    %rdx,%rcx
  801d4b:	48 89 c2             	mov    %rax,%rdx
  801d4e:	be 00 00 00 00       	mov    $0x0,%esi
  801d53:	bf 12 00 00 00       	mov    $0x12,%edi
  801d58:	48 b8 98 17 80 00 00 	movabs $0x801798,%rax
  801d5f:	00 00 00 
  801d62:	ff d0                	callq  *%rax
  801d64:	48 83 c4 10          	add    $0x10,%rsp
  801d68:	c9                   	leaveq 
  801d69:	c3                   	retq   

0000000000801d6a <pgfault>:
  801d6a:	55                   	push   %rbp
  801d6b:	48 89 e5             	mov    %rsp,%rbp
  801d6e:	48 83 ec 30          	sub    $0x30,%rsp
  801d72:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801d76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d7a:	48 8b 00             	mov    (%rax),%rax
  801d7d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801d81:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d85:	48 8b 40 08          	mov    0x8(%rax),%rax
  801d89:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801d8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d8f:	83 e0 02             	and    $0x2,%eax
  801d92:	85 c0                	test   %eax,%eax
  801d94:	75 40                	jne    801dd6 <pgfault+0x6c>
  801d96:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d9a:	48 8b 90 88 00 00 00 	mov    0x88(%rax),%rdx
  801da1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801da5:	49 89 d0             	mov    %rdx,%r8
  801da8:	48 89 c1             	mov    %rax,%rcx
  801dab:	48 ba 98 4d 80 00 00 	movabs $0x804d98,%rdx
  801db2:	00 00 00 
  801db5:	be 1f 00 00 00       	mov    $0x1f,%esi
  801dba:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801dc1:	00 00 00 
  801dc4:	b8 00 00 00 00       	mov    $0x0,%eax
  801dc9:	49 b9 74 02 80 00 00 	movabs $0x800274,%r9
  801dd0:	00 00 00 
  801dd3:	41 ff d1             	callq  *%r9
  801dd6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801dda:	48 c1 e8 0c          	shr    $0xc,%rax
  801dde:	48 89 c2             	mov    %rax,%rdx
  801de1:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801de8:	01 00 00 
  801deb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801def:	25 07 08 00 00       	and    $0x807,%eax
  801df4:	48 3d 05 08 00 00    	cmp    $0x805,%rax
  801dfa:	74 4e                	je     801e4a <pgfault+0xe0>
  801dfc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e00:	48 c1 e8 0c          	shr    $0xc,%rax
  801e04:	48 89 c2             	mov    %rax,%rdx
  801e07:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801e0e:	01 00 00 
  801e11:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801e15:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e19:	49 89 d0             	mov    %rdx,%r8
  801e1c:	48 89 c1             	mov    %rax,%rcx
  801e1f:	48 ba c0 4d 80 00 00 	movabs $0x804dc0,%rdx
  801e26:	00 00 00 
  801e29:	be 22 00 00 00       	mov    $0x22,%esi
  801e2e:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801e35:	00 00 00 
  801e38:	b8 00 00 00 00       	mov    $0x0,%eax
  801e3d:	49 b9 74 02 80 00 00 	movabs $0x800274,%r9
  801e44:	00 00 00 
  801e47:	41 ff d1             	callq  *%r9
  801e4a:	ba 07 00 00 00       	mov    $0x7,%edx
  801e4f:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801e54:	bf 00 00 00 00       	mov    $0x0,%edi
  801e59:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  801e60:	00 00 00 
  801e63:	ff d0                	callq  *%rax
  801e65:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801e68:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801e6c:	79 30                	jns    801e9e <pgfault+0x134>
  801e6e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e71:	89 c1                	mov    %eax,%ecx
  801e73:	48 ba eb 4d 80 00 00 	movabs $0x804deb,%rdx
  801e7a:	00 00 00 
  801e7d:	be 30 00 00 00       	mov    $0x30,%esi
  801e82:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801e89:	00 00 00 
  801e8c:	b8 00 00 00 00       	mov    $0x0,%eax
  801e91:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  801e98:	00 00 00 
  801e9b:	41 ff d0             	callq  *%r8
  801e9e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ea2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ea6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801eaa:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801eb0:	ba 00 10 00 00       	mov    $0x1000,%edx
  801eb5:	48 89 c6             	mov    %rax,%rsi
  801eb8:	bf 00 f0 5f 00       	mov    $0x5ff000,%edi
  801ebd:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  801ec4:	00 00 00 
  801ec7:	ff d0                	callq  *%rax
  801ec9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801ecd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801ed1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ed5:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  801edb:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  801ee1:	48 89 c1             	mov    %rax,%rcx
  801ee4:	ba 00 00 00 00       	mov    $0x0,%edx
  801ee9:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801eee:	bf 00 00 00 00       	mov    $0x0,%edi
  801ef3:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  801efa:	00 00 00 
  801efd:	ff d0                	callq  *%rax
  801eff:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801f02:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801f06:	79 30                	jns    801f38 <pgfault+0x1ce>
  801f08:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f0b:	89 c1                	mov    %eax,%ecx
  801f0d:	48 ba fe 4d 80 00 00 	movabs $0x804dfe,%rdx
  801f14:	00 00 00 
  801f17:	be 35 00 00 00       	mov    $0x35,%esi
  801f1c:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801f23:	00 00 00 
  801f26:	b8 00 00 00 00       	mov    $0x0,%eax
  801f2b:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  801f32:	00 00 00 
  801f35:	41 ff d0             	callq  *%r8
  801f38:	be 00 f0 5f 00       	mov    $0x5ff000,%esi
  801f3d:	bf 00 00 00 00       	mov    $0x0,%edi
  801f42:	48 b8 20 1a 80 00 00 	movabs $0x801a20,%rax
  801f49:	00 00 00 
  801f4c:	ff d0                	callq  *%rax
  801f4e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  801f51:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  801f55:	79 30                	jns    801f87 <pgfault+0x21d>
  801f57:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f5a:	89 c1                	mov    %eax,%ecx
  801f5c:	48 ba 0f 4e 80 00 00 	movabs $0x804e0f,%rdx
  801f63:	00 00 00 
  801f66:	be 39 00 00 00       	mov    $0x39,%esi
  801f6b:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  801f72:	00 00 00 
  801f75:	b8 00 00 00 00       	mov    $0x0,%eax
  801f7a:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  801f81:	00 00 00 
  801f84:	41 ff d0             	callq  *%r8
  801f87:	90                   	nop
  801f88:	c9                   	leaveq 
  801f89:	c3                   	retq   

0000000000801f8a <duppage>:
  801f8a:	55                   	push   %rbp
  801f8b:	48 89 e5             	mov    %rsp,%rbp
  801f8e:	48 83 ec 30          	sub    $0x30,%rsp
  801f92:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801f95:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801f98:	8b 45 d8             	mov    -0x28(%rbp),%eax
  801f9b:	c1 e0 0c             	shl    $0xc,%eax
  801f9e:	89 c0                	mov    %eax,%eax
  801fa0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801fa4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fab:	01 00 00 
  801fae:	8b 55 d8             	mov    -0x28(%rbp),%edx
  801fb1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fb5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fb9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fbd:	25 02 08 00 00       	and    $0x802,%eax
  801fc2:	48 85 c0             	test   %rax,%rax
  801fc5:	74 0e                	je     801fd5 <duppage+0x4b>
  801fc7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fcb:	25 00 04 00 00       	and    $0x400,%eax
  801fd0:	48 85 c0             	test   %rax,%rax
  801fd3:	74 70                	je     802045 <duppage+0xbb>
  801fd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fd9:	25 07 0e 00 00       	and    $0xe07,%eax
  801fde:	89 c6                	mov    %eax,%esi
  801fe0:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  801fe4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  801fe7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801feb:	41 89 f0             	mov    %esi,%r8d
  801fee:	48 89 c6             	mov    %rax,%rsi
  801ff1:	bf 00 00 00 00       	mov    $0x0,%edi
  801ff6:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  801ffd:	00 00 00 
  802000:	ff d0                	callq  *%rax
  802002:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802005:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802009:	79 30                	jns    80203b <duppage+0xb1>
  80200b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80200e:	89 c1                	mov    %eax,%ecx
  802010:	48 ba fe 4d 80 00 00 	movabs $0x804dfe,%rdx
  802017:	00 00 00 
  80201a:	be 63 00 00 00       	mov    $0x63,%esi
  80201f:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  802026:	00 00 00 
  802029:	b8 00 00 00 00       	mov    $0x0,%eax
  80202e:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  802035:	00 00 00 
  802038:	41 ff d0             	callq  *%r8
  80203b:	b8 00 00 00 00       	mov    $0x0,%eax
  802040:	e9 c4 00 00 00       	jmpq   802109 <duppage+0x17f>
  802045:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  802049:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80204c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802050:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  802056:	48 89 c6             	mov    %rax,%rsi
  802059:	bf 00 00 00 00       	mov    $0x0,%edi
  80205e:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  802065:	00 00 00 
  802068:	ff d0                	callq  *%rax
  80206a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80206d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802071:	79 30                	jns    8020a3 <duppage+0x119>
  802073:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802076:	89 c1                	mov    %eax,%ecx
  802078:	48 ba fe 4d 80 00 00 	movabs $0x804dfe,%rdx
  80207f:	00 00 00 
  802082:	be 7e 00 00 00       	mov    $0x7e,%esi
  802087:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  80208e:	00 00 00 
  802091:	b8 00 00 00 00       	mov    $0x0,%eax
  802096:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80209d:	00 00 00 
  8020a0:	41 ff d0             	callq  *%r8
  8020a3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8020a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020ab:	41 b8 05 08 00 00    	mov    $0x805,%r8d
  8020b1:	48 89 d1             	mov    %rdx,%rcx
  8020b4:	ba 00 00 00 00       	mov    $0x0,%edx
  8020b9:	48 89 c6             	mov    %rax,%rsi
  8020bc:	bf 00 00 00 00       	mov    $0x0,%edi
  8020c1:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  8020c8:	00 00 00 
  8020cb:	ff d0                	callq  *%rax
  8020cd:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8020d0:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8020d4:	79 30                	jns    802106 <duppage+0x17c>
  8020d6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8020d9:	89 c1                	mov    %eax,%ecx
  8020db:	48 ba fe 4d 80 00 00 	movabs $0x804dfe,%rdx
  8020e2:	00 00 00 
  8020e5:	be 80 00 00 00       	mov    $0x80,%esi
  8020ea:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  8020f1:	00 00 00 
  8020f4:	b8 00 00 00 00       	mov    $0x0,%eax
  8020f9:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  802100:	00 00 00 
  802103:	41 ff d0             	callq  *%r8
  802106:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802109:	c9                   	leaveq 
  80210a:	c3                   	retq   

000000000080210b <fork>:
  80210b:	55                   	push   %rbp
  80210c:	48 89 e5             	mov    %rsp,%rbp
  80210f:	48 83 ec 20          	sub    $0x20,%rsp
  802113:	48 bf 6a 1d 80 00 00 	movabs $0x801d6a,%rdi
  80211a:	00 00 00 
  80211d:	48 b8 6c 46 80 00 00 	movabs $0x80466c,%rax
  802124:	00 00 00 
  802127:	ff d0                	callq  *%rax
  802129:	b8 07 00 00 00       	mov    $0x7,%eax
  80212e:	cd 30                	int    $0x30
  802130:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802133:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802136:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802139:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80213d:	79 08                	jns    802147 <fork+0x3c>
  80213f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802142:	e9 0b 02 00 00       	jmpq   802352 <fork+0x247>
  802147:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80214b:	75 3e                	jne    80218b <fork+0x80>
  80214d:	48 b8 f5 18 80 00 00 	movabs $0x8018f5,%rax
  802154:	00 00 00 
  802157:	ff d0                	callq  *%rax
  802159:	25 ff 03 00 00       	and    $0x3ff,%eax
  80215e:	48 98                	cltq   
  802160:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  802167:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80216e:	00 00 00 
  802171:	48 01 c2             	add    %rax,%rdx
  802174:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80217b:	00 00 00 
  80217e:	48 89 10             	mov    %rdx,(%rax)
  802181:	b8 00 00 00 00       	mov    $0x0,%eax
  802186:	e9 c7 01 00 00       	jmpq   802352 <fork+0x247>
  80218b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802192:	e9 a6 00 00 00       	jmpq   80223d <fork+0x132>
  802197:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80219a:	c1 f8 12             	sar    $0x12,%eax
  80219d:	89 c2                	mov    %eax,%edx
  80219f:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  8021a6:	01 00 00 
  8021a9:	48 63 d2             	movslq %edx,%rdx
  8021ac:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021b0:	83 e0 01             	and    $0x1,%eax
  8021b3:	48 85 c0             	test   %rax,%rax
  8021b6:	74 21                	je     8021d9 <fork+0xce>
  8021b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021bb:	c1 f8 09             	sar    $0x9,%eax
  8021be:	89 c2                	mov    %eax,%edx
  8021c0:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8021c7:	01 00 00 
  8021ca:	48 63 d2             	movslq %edx,%rdx
  8021cd:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021d1:	83 e0 01             	and    $0x1,%eax
  8021d4:	48 85 c0             	test   %rax,%rax
  8021d7:	75 09                	jne    8021e2 <fork+0xd7>
  8021d9:	81 45 fc 00 02 00 00 	addl   $0x200,-0x4(%rbp)
  8021e0:	eb 5b                	jmp    80223d <fork+0x132>
  8021e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021e5:	05 00 02 00 00       	add    $0x200,%eax
  8021ea:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8021ed:	eb 46                	jmp    802235 <fork+0x12a>
  8021ef:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021f6:	01 00 00 
  8021f9:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8021fc:	48 63 d2             	movslq %edx,%rdx
  8021ff:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802203:	83 e0 05             	and    $0x5,%eax
  802206:	48 83 f8 05          	cmp    $0x5,%rax
  80220a:	75 21                	jne    80222d <fork+0x122>
  80220c:	81 7d fc ff f7 0e 00 	cmpl   $0xef7ff,-0x4(%rbp)
  802213:	74 1b                	je     802230 <fork+0x125>
  802215:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802218:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80221b:	89 d6                	mov    %edx,%esi
  80221d:	89 c7                	mov    %eax,%edi
  80221f:	48 b8 8a 1f 80 00 00 	movabs $0x801f8a,%rax
  802226:	00 00 00 
  802229:	ff d0                	callq  *%rax
  80222b:	eb 04                	jmp    802231 <fork+0x126>
  80222d:	90                   	nop
  80222e:	eb 01                	jmp    802231 <fork+0x126>
  802230:	90                   	nop
  802231:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802235:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802238:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  80223b:	7c b2                	jl     8021ef <fork+0xe4>
  80223d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802240:	3d ff 07 00 08       	cmp    $0x80007ff,%eax
  802245:	0f 86 4c ff ff ff    	jbe    802197 <fork+0x8c>
  80224b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80224e:	ba 07 00 00 00       	mov    $0x7,%edx
  802253:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  802258:	89 c7                	mov    %eax,%edi
  80225a:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  802261:	00 00 00 
  802264:	ff d0                	callq  *%rax
  802266:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802269:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80226d:	79 30                	jns    80229f <fork+0x194>
  80226f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802272:	89 c1                	mov    %eax,%ecx
  802274:	48 ba 28 4e 80 00 00 	movabs $0x804e28,%rdx
  80227b:	00 00 00 
  80227e:	be bc 00 00 00       	mov    $0xbc,%esi
  802283:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  80228a:	00 00 00 
  80228d:	b8 00 00 00 00       	mov    $0x0,%eax
  802292:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  802299:	00 00 00 
  80229c:	41 ff d0             	callq  *%r8
  80229f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8022a6:	00 00 00 
  8022a9:	48 8b 00             	mov    (%rax),%rax
  8022ac:	48 8b 90 f0 00 00 00 	mov    0xf0(%rax),%rdx
  8022b3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8022b6:	48 89 d6             	mov    %rdx,%rsi
  8022b9:	89 c7                	mov    %eax,%edi
  8022bb:	48 b8 05 1b 80 00 00 	movabs $0x801b05,%rax
  8022c2:	00 00 00 
  8022c5:	ff d0                	callq  *%rax
  8022c7:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8022ca:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8022ce:	79 30                	jns    802300 <fork+0x1f5>
  8022d0:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8022d3:	89 c1                	mov    %eax,%ecx
  8022d5:	48 ba 48 4e 80 00 00 	movabs $0x804e48,%rdx
  8022dc:	00 00 00 
  8022df:	be c0 00 00 00       	mov    $0xc0,%esi
  8022e4:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  8022eb:	00 00 00 
  8022ee:	b8 00 00 00 00       	mov    $0x0,%eax
  8022f3:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8022fa:	00 00 00 
  8022fd:	41 ff d0             	callq  *%r8
  802300:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802303:	be 02 00 00 00       	mov    $0x2,%esi
  802308:	89 c7                	mov    %eax,%edi
  80230a:	48 b8 6c 1a 80 00 00 	movabs $0x801a6c,%rax
  802311:	00 00 00 
  802314:	ff d0                	callq  *%rax
  802316:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802319:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80231d:	79 30                	jns    80234f <fork+0x244>
  80231f:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802322:	89 c1                	mov    %eax,%ecx
  802324:	48 ba 67 4e 80 00 00 	movabs $0x804e67,%rdx
  80232b:	00 00 00 
  80232e:	be c5 00 00 00       	mov    $0xc5,%esi
  802333:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  80233a:	00 00 00 
  80233d:	b8 00 00 00 00       	mov    $0x0,%eax
  802342:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  802349:	00 00 00 
  80234c:	41 ff d0             	callq  *%r8
  80234f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802352:	c9                   	leaveq 
  802353:	c3                   	retq   

0000000000802354 <sfork>:
  802354:	55                   	push   %rbp
  802355:	48 89 e5             	mov    %rsp,%rbp
  802358:	48 ba 7e 4e 80 00 00 	movabs $0x804e7e,%rdx
  80235f:	00 00 00 
  802362:	be d2 00 00 00       	mov    $0xd2,%esi
  802367:	48 bf b1 4d 80 00 00 	movabs $0x804db1,%rdi
  80236e:	00 00 00 
  802371:	b8 00 00 00 00       	mov    $0x0,%eax
  802376:	48 b9 74 02 80 00 00 	movabs $0x800274,%rcx
  80237d:	00 00 00 
  802380:	ff d1                	callq  *%rcx

0000000000802382 <ipc_recv>:
  802382:	55                   	push   %rbp
  802383:	48 89 e5             	mov    %rsp,%rbp
  802386:	48 83 ec 30          	sub    $0x30,%rsp
  80238a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80238e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802392:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802396:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80239b:	75 0e                	jne    8023ab <ipc_recv+0x29>
  80239d:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8023a4:	00 00 00 
  8023a7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8023ab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023af:	48 89 c7             	mov    %rax,%rdi
  8023b2:	48 b8 a8 1b 80 00 00 	movabs $0x801ba8,%rax
  8023b9:	00 00 00 
  8023bc:	ff d0                	callq  *%rax
  8023be:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023c1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023c5:	79 27                	jns    8023ee <ipc_recv+0x6c>
  8023c7:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8023cc:	74 0a                	je     8023d8 <ipc_recv+0x56>
  8023ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023d2:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8023d8:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8023dd:	74 0a                	je     8023e9 <ipc_recv+0x67>
  8023df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023e3:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8023e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023ec:	eb 53                	jmp    802441 <ipc_recv+0xbf>
  8023ee:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8023f3:	74 19                	je     80240e <ipc_recv+0x8c>
  8023f5:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  8023fc:	00 00 00 
  8023ff:	48 8b 00             	mov    (%rax),%rax
  802402:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  802408:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80240c:	89 10                	mov    %edx,(%rax)
  80240e:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  802413:	74 19                	je     80242e <ipc_recv+0xac>
  802415:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80241c:	00 00 00 
  80241f:	48 8b 00             	mov    (%rax),%rax
  802422:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  802428:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80242c:	89 10                	mov    %edx,(%rax)
  80242e:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802435:	00 00 00 
  802438:	48 8b 00             	mov    (%rax),%rax
  80243b:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  802441:	c9                   	leaveq 
  802442:	c3                   	retq   

0000000000802443 <ipc_send>:
  802443:	55                   	push   %rbp
  802444:	48 89 e5             	mov    %rsp,%rbp
  802447:	48 83 ec 30          	sub    $0x30,%rsp
  80244b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80244e:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802451:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  802455:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  802458:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80245d:	75 1c                	jne    80247b <ipc_send+0x38>
  80245f:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  802466:	00 00 00 
  802469:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80246d:	eb 0c                	jmp    80247b <ipc_send+0x38>
  80246f:	48 b8 31 19 80 00 00 	movabs $0x801931,%rax
  802476:	00 00 00 
  802479:	ff d0                	callq  *%rax
  80247b:	8b 75 e8             	mov    -0x18(%rbp),%esi
  80247e:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  802481:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802485:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802488:	89 c7                	mov    %eax,%edi
  80248a:	48 b8 51 1b 80 00 00 	movabs $0x801b51,%rax
  802491:	00 00 00 
  802494:	ff d0                	callq  *%rax
  802496:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802499:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  80249d:	74 d0                	je     80246f <ipc_send+0x2c>
  80249f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8024a3:	79 30                	jns    8024d5 <ipc_send+0x92>
  8024a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024a8:	89 c1                	mov    %eax,%ecx
  8024aa:	48 ba 98 4e 80 00 00 	movabs $0x804e98,%rdx
  8024b1:	00 00 00 
  8024b4:	be 44 00 00 00       	mov    $0x44,%esi
  8024b9:	48 bf ae 4e 80 00 00 	movabs $0x804eae,%rdi
  8024c0:	00 00 00 
  8024c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8024c8:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8024cf:	00 00 00 
  8024d2:	41 ff d0             	callq  *%r8
  8024d5:	90                   	nop
  8024d6:	c9                   	leaveq 
  8024d7:	c3                   	retq   

00000000008024d8 <ipc_host_recv>:
  8024d8:	55                   	push   %rbp
  8024d9:	48 89 e5             	mov    %rsp,%rbp
  8024dc:	48 83 ec 10          	sub    $0x10,%rsp
  8024e0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8024e4:	48 ba c0 4e 80 00 00 	movabs $0x804ec0,%rdx
  8024eb:	00 00 00 
  8024ee:	be 4e 00 00 00       	mov    $0x4e,%esi
  8024f3:	48 bf ae 4e 80 00 00 	movabs $0x804eae,%rdi
  8024fa:	00 00 00 
  8024fd:	b8 00 00 00 00       	mov    $0x0,%eax
  802502:	48 b9 74 02 80 00 00 	movabs $0x800274,%rcx
  802509:	00 00 00 
  80250c:	ff d1                	callq  *%rcx

000000000080250e <ipc_host_send>:
  80250e:	55                   	push   %rbp
  80250f:	48 89 e5             	mov    %rsp,%rbp
  802512:	48 83 ec 20          	sub    $0x20,%rsp
  802516:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802519:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80251c:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  802520:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  802523:	48 ba e0 4e 80 00 00 	movabs $0x804ee0,%rdx
  80252a:	00 00 00 
  80252d:	be 58 00 00 00       	mov    $0x58,%esi
  802532:	48 bf ae 4e 80 00 00 	movabs $0x804eae,%rdi
  802539:	00 00 00 
  80253c:	b8 00 00 00 00       	mov    $0x0,%eax
  802541:	48 b9 74 02 80 00 00 	movabs $0x800274,%rcx
  802548:	00 00 00 
  80254b:	ff d1                	callq  *%rcx

000000000080254d <ipc_find_env>:
  80254d:	55                   	push   %rbp
  80254e:	48 89 e5             	mov    %rsp,%rbp
  802551:	48 83 ec 18          	sub    $0x18,%rsp
  802555:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802558:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80255f:	eb 4d                	jmp    8025ae <ipc_find_env+0x61>
  802561:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  802568:	00 00 00 
  80256b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80256e:	48 98                	cltq   
  802570:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  802577:	48 01 d0             	add    %rdx,%rax
  80257a:	48 05 d0 00 00 00    	add    $0xd0,%rax
  802580:	8b 00                	mov    (%rax),%eax
  802582:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802585:	75 23                	jne    8025aa <ipc_find_env+0x5d>
  802587:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80258e:	00 00 00 
  802591:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802594:	48 98                	cltq   
  802596:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80259d:	48 01 d0             	add    %rdx,%rax
  8025a0:	48 05 c8 00 00 00    	add    $0xc8,%rax
  8025a6:	8b 00                	mov    (%rax),%eax
  8025a8:	eb 12                	jmp    8025bc <ipc_find_env+0x6f>
  8025aa:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8025ae:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8025b5:	7e aa                	jle    802561 <ipc_find_env+0x14>
  8025b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8025bc:	c9                   	leaveq 
  8025bd:	c3                   	retq   

00000000008025be <fd2num>:
  8025be:	55                   	push   %rbp
  8025bf:	48 89 e5             	mov    %rsp,%rbp
  8025c2:	48 83 ec 08          	sub    $0x8,%rsp
  8025c6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025ca:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8025ce:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8025d5:	ff ff ff 
  8025d8:	48 01 d0             	add    %rdx,%rax
  8025db:	48 c1 e8 0c          	shr    $0xc,%rax
  8025df:	c9                   	leaveq 
  8025e0:	c3                   	retq   

00000000008025e1 <fd2data>:
  8025e1:	55                   	push   %rbp
  8025e2:	48 89 e5             	mov    %rsp,%rbp
  8025e5:	48 83 ec 08          	sub    $0x8,%rsp
  8025e9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8025ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8025f1:	48 89 c7             	mov    %rax,%rdi
  8025f4:	48 b8 be 25 80 00 00 	movabs $0x8025be,%rax
  8025fb:	00 00 00 
  8025fe:	ff d0                	callq  *%rax
  802600:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802606:	48 c1 e0 0c          	shl    $0xc,%rax
  80260a:	c9                   	leaveq 
  80260b:	c3                   	retq   

000000000080260c <fd_alloc>:
  80260c:	55                   	push   %rbp
  80260d:	48 89 e5             	mov    %rsp,%rbp
  802610:	48 83 ec 18          	sub    $0x18,%rsp
  802614:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802618:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80261f:	eb 6b                	jmp    80268c <fd_alloc+0x80>
  802621:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802624:	48 98                	cltq   
  802626:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80262c:	48 c1 e0 0c          	shl    $0xc,%rax
  802630:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802634:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802638:	48 c1 e8 15          	shr    $0x15,%rax
  80263c:	48 89 c2             	mov    %rax,%rdx
  80263f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802646:	01 00 00 
  802649:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80264d:	83 e0 01             	and    $0x1,%eax
  802650:	48 85 c0             	test   %rax,%rax
  802653:	74 21                	je     802676 <fd_alloc+0x6a>
  802655:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802659:	48 c1 e8 0c          	shr    $0xc,%rax
  80265d:	48 89 c2             	mov    %rax,%rdx
  802660:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802667:	01 00 00 
  80266a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80266e:	83 e0 01             	and    $0x1,%eax
  802671:	48 85 c0             	test   %rax,%rax
  802674:	75 12                	jne    802688 <fd_alloc+0x7c>
  802676:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80267a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80267e:	48 89 10             	mov    %rdx,(%rax)
  802681:	b8 00 00 00 00       	mov    $0x0,%eax
  802686:	eb 1a                	jmp    8026a2 <fd_alloc+0x96>
  802688:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80268c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802690:	7e 8f                	jle    802621 <fd_alloc+0x15>
  802692:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802696:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80269d:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  8026a2:	c9                   	leaveq 
  8026a3:	c3                   	retq   

00000000008026a4 <fd_lookup>:
  8026a4:	55                   	push   %rbp
  8026a5:	48 89 e5             	mov    %rsp,%rbp
  8026a8:	48 83 ec 20          	sub    $0x20,%rsp
  8026ac:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8026af:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026b3:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8026b7:	78 06                	js     8026bf <fd_lookup+0x1b>
  8026b9:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  8026bd:	7e 07                	jle    8026c6 <fd_lookup+0x22>
  8026bf:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8026c4:	eb 6c                	jmp    802732 <fd_lookup+0x8e>
  8026c6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8026c9:	48 98                	cltq   
  8026cb:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8026d1:	48 c1 e0 0c          	shl    $0xc,%rax
  8026d5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8026d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026dd:	48 c1 e8 15          	shr    $0x15,%rax
  8026e1:	48 89 c2             	mov    %rax,%rdx
  8026e4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8026eb:	01 00 00 
  8026ee:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026f2:	83 e0 01             	and    $0x1,%eax
  8026f5:	48 85 c0             	test   %rax,%rax
  8026f8:	74 21                	je     80271b <fd_lookup+0x77>
  8026fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8026fe:	48 c1 e8 0c          	shr    $0xc,%rax
  802702:	48 89 c2             	mov    %rax,%rdx
  802705:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80270c:	01 00 00 
  80270f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802713:	83 e0 01             	and    $0x1,%eax
  802716:	48 85 c0             	test   %rax,%rax
  802719:	75 07                	jne    802722 <fd_lookup+0x7e>
  80271b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802720:	eb 10                	jmp    802732 <fd_lookup+0x8e>
  802722:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802726:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80272a:	48 89 10             	mov    %rdx,(%rax)
  80272d:	b8 00 00 00 00       	mov    $0x0,%eax
  802732:	c9                   	leaveq 
  802733:	c3                   	retq   

0000000000802734 <fd_close>:
  802734:	55                   	push   %rbp
  802735:	48 89 e5             	mov    %rsp,%rbp
  802738:	48 83 ec 30          	sub    $0x30,%rsp
  80273c:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802740:	89 f0                	mov    %esi,%eax
  802742:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802745:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802749:	48 89 c7             	mov    %rax,%rdi
  80274c:	48 b8 be 25 80 00 00 	movabs $0x8025be,%rax
  802753:	00 00 00 
  802756:	ff d0                	callq  *%rax
  802758:	89 c2                	mov    %eax,%edx
  80275a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80275e:	48 89 c6             	mov    %rax,%rsi
  802761:	89 d7                	mov    %edx,%edi
  802763:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  80276a:	00 00 00 
  80276d:	ff d0                	callq  *%rax
  80276f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802772:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802776:	78 0a                	js     802782 <fd_close+0x4e>
  802778:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80277c:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  802780:	74 12                	je     802794 <fd_close+0x60>
  802782:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802786:	74 05                	je     80278d <fd_close+0x59>
  802788:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80278b:	eb 70                	jmp    8027fd <fd_close+0xc9>
  80278d:	b8 00 00 00 00       	mov    $0x0,%eax
  802792:	eb 69                	jmp    8027fd <fd_close+0xc9>
  802794:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802798:	8b 00                	mov    (%rax),%eax
  80279a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80279e:	48 89 d6             	mov    %rdx,%rsi
  8027a1:	89 c7                	mov    %eax,%edi
  8027a3:	48 b8 ff 27 80 00 00 	movabs $0x8027ff,%rax
  8027aa:	00 00 00 
  8027ad:	ff d0                	callq  *%rax
  8027af:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027b2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027b6:	78 2a                	js     8027e2 <fd_close+0xae>
  8027b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027bc:	48 8b 40 20          	mov    0x20(%rax),%rax
  8027c0:	48 85 c0             	test   %rax,%rax
  8027c3:	74 16                	je     8027db <fd_close+0xa7>
  8027c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027c9:	48 8b 40 20          	mov    0x20(%rax),%rax
  8027cd:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8027d1:	48 89 d7             	mov    %rdx,%rdi
  8027d4:	ff d0                	callq  *%rax
  8027d6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027d9:	eb 07                	jmp    8027e2 <fd_close+0xae>
  8027db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8027e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8027e6:	48 89 c6             	mov    %rax,%rsi
  8027e9:	bf 00 00 00 00       	mov    $0x0,%edi
  8027ee:	48 b8 20 1a 80 00 00 	movabs $0x801a20,%rax
  8027f5:	00 00 00 
  8027f8:	ff d0                	callq  *%rax
  8027fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027fd:	c9                   	leaveq 
  8027fe:	c3                   	retq   

00000000008027ff <dev_lookup>:
  8027ff:	55                   	push   %rbp
  802800:	48 89 e5             	mov    %rsp,%rbp
  802803:	48 83 ec 20          	sub    $0x20,%rsp
  802807:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80280a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80280e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802815:	eb 41                	jmp    802858 <dev_lookup+0x59>
  802817:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80281e:	00 00 00 
  802821:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802824:	48 63 d2             	movslq %edx,%rdx
  802827:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80282b:	8b 00                	mov    (%rax),%eax
  80282d:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802830:	75 22                	jne    802854 <dev_lookup+0x55>
  802832:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802839:	00 00 00 
  80283c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80283f:	48 63 d2             	movslq %edx,%rdx
  802842:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802846:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80284a:	48 89 10             	mov    %rdx,(%rax)
  80284d:	b8 00 00 00 00       	mov    $0x0,%eax
  802852:	eb 60                	jmp    8028b4 <dev_lookup+0xb5>
  802854:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802858:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80285f:	00 00 00 
  802862:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802865:	48 63 d2             	movslq %edx,%rdx
  802868:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80286c:	48 85 c0             	test   %rax,%rax
  80286f:	75 a6                	jne    802817 <dev_lookup+0x18>
  802871:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802878:	00 00 00 
  80287b:	48 8b 00             	mov    (%rax),%rax
  80287e:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802884:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802887:	89 c6                	mov    %eax,%esi
  802889:	48 bf 00 4f 80 00 00 	movabs $0x804f00,%rdi
  802890:	00 00 00 
  802893:	b8 00 00 00 00       	mov    $0x0,%eax
  802898:	48 b9 ae 04 80 00 00 	movabs $0x8004ae,%rcx
  80289f:	00 00 00 
  8028a2:	ff d1                	callq  *%rcx
  8028a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8028a8:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8028af:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8028b4:	c9                   	leaveq 
  8028b5:	c3                   	retq   

00000000008028b6 <close>:
  8028b6:	55                   	push   %rbp
  8028b7:	48 89 e5             	mov    %rsp,%rbp
  8028ba:	48 83 ec 20          	sub    $0x20,%rsp
  8028be:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8028c1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028c5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8028c8:	48 89 d6             	mov    %rdx,%rsi
  8028cb:	89 c7                	mov    %eax,%edi
  8028cd:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  8028d4:	00 00 00 
  8028d7:	ff d0                	callq  *%rax
  8028d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028e0:	79 05                	jns    8028e7 <close+0x31>
  8028e2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028e5:	eb 18                	jmp    8028ff <close+0x49>
  8028e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028eb:	be 01 00 00 00       	mov    $0x1,%esi
  8028f0:	48 89 c7             	mov    %rax,%rdi
  8028f3:	48 b8 34 27 80 00 00 	movabs $0x802734,%rax
  8028fa:	00 00 00 
  8028fd:	ff d0                	callq  *%rax
  8028ff:	c9                   	leaveq 
  802900:	c3                   	retq   

0000000000802901 <close_all>:
  802901:	55                   	push   %rbp
  802902:	48 89 e5             	mov    %rsp,%rbp
  802905:	48 83 ec 10          	sub    $0x10,%rsp
  802909:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802910:	eb 15                	jmp    802927 <close_all+0x26>
  802912:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802915:	89 c7                	mov    %eax,%edi
  802917:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  80291e:	00 00 00 
  802921:	ff d0                	callq  *%rax
  802923:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802927:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80292b:	7e e5                	jle    802912 <close_all+0x11>
  80292d:	90                   	nop
  80292e:	c9                   	leaveq 
  80292f:	c3                   	retq   

0000000000802930 <dup>:
  802930:	55                   	push   %rbp
  802931:	48 89 e5             	mov    %rsp,%rbp
  802934:	48 83 ec 40          	sub    $0x40,%rsp
  802938:	89 7d cc             	mov    %edi,-0x34(%rbp)
  80293b:	89 75 c8             	mov    %esi,-0x38(%rbp)
  80293e:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802942:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802945:	48 89 d6             	mov    %rdx,%rsi
  802948:	89 c7                	mov    %eax,%edi
  80294a:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  802951:	00 00 00 
  802954:	ff d0                	callq  *%rax
  802956:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802959:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80295d:	79 08                	jns    802967 <dup+0x37>
  80295f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802962:	e9 70 01 00 00       	jmpq   802ad7 <dup+0x1a7>
  802967:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80296a:	89 c7                	mov    %eax,%edi
  80296c:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  802973:	00 00 00 
  802976:	ff d0                	callq  *%rax
  802978:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80297b:	48 98                	cltq   
  80297d:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802983:	48 c1 e0 0c          	shl    $0xc,%rax
  802987:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80298b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80298f:	48 89 c7             	mov    %rax,%rdi
  802992:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  802999:	00 00 00 
  80299c:	ff d0                	callq  *%rax
  80299e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8029a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029a6:	48 89 c7             	mov    %rax,%rdi
  8029a9:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  8029b0:	00 00 00 
  8029b3:	ff d0                	callq  *%rax
  8029b5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8029b9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029bd:	48 c1 e8 15          	shr    $0x15,%rax
  8029c1:	48 89 c2             	mov    %rax,%rdx
  8029c4:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8029cb:	01 00 00 
  8029ce:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8029d2:	83 e0 01             	and    $0x1,%eax
  8029d5:	48 85 c0             	test   %rax,%rax
  8029d8:	74 71                	je     802a4b <dup+0x11b>
  8029da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029de:	48 c1 e8 0c          	shr    $0xc,%rax
  8029e2:	48 89 c2             	mov    %rax,%rdx
  8029e5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8029ec:	01 00 00 
  8029ef:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8029f3:	83 e0 01             	and    $0x1,%eax
  8029f6:	48 85 c0             	test   %rax,%rax
  8029f9:	74 50                	je     802a4b <dup+0x11b>
  8029fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029ff:	48 c1 e8 0c          	shr    $0xc,%rax
  802a03:	48 89 c2             	mov    %rax,%rdx
  802a06:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a0d:	01 00 00 
  802a10:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a14:	25 07 0e 00 00       	and    $0xe07,%eax
  802a19:	89 c1                	mov    %eax,%ecx
  802a1b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802a1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a23:	41 89 c8             	mov    %ecx,%r8d
  802a26:	48 89 d1             	mov    %rdx,%rcx
  802a29:	ba 00 00 00 00       	mov    $0x0,%edx
  802a2e:	48 89 c6             	mov    %rax,%rsi
  802a31:	bf 00 00 00 00       	mov    $0x0,%edi
  802a36:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  802a3d:	00 00 00 
  802a40:	ff d0                	callq  *%rax
  802a42:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a45:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a49:	78 55                	js     802aa0 <dup+0x170>
  802a4b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a4f:	48 c1 e8 0c          	shr    $0xc,%rax
  802a53:	48 89 c2             	mov    %rax,%rdx
  802a56:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802a5d:	01 00 00 
  802a60:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802a64:	25 07 0e 00 00       	and    $0xe07,%eax
  802a69:	89 c1                	mov    %eax,%ecx
  802a6b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a6f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802a73:	41 89 c8             	mov    %ecx,%r8d
  802a76:	48 89 d1             	mov    %rdx,%rcx
  802a79:	ba 00 00 00 00       	mov    $0x0,%edx
  802a7e:	48 89 c6             	mov    %rax,%rsi
  802a81:	bf 00 00 00 00       	mov    $0x0,%edi
  802a86:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  802a8d:	00 00 00 
  802a90:	ff d0                	callq  *%rax
  802a92:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a95:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a99:	78 08                	js     802aa3 <dup+0x173>
  802a9b:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802a9e:	eb 37                	jmp    802ad7 <dup+0x1a7>
  802aa0:	90                   	nop
  802aa1:	eb 01                	jmp    802aa4 <dup+0x174>
  802aa3:	90                   	nop
  802aa4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802aa8:	48 89 c6             	mov    %rax,%rsi
  802aab:	bf 00 00 00 00       	mov    $0x0,%edi
  802ab0:	48 b8 20 1a 80 00 00 	movabs $0x801a20,%rax
  802ab7:	00 00 00 
  802aba:	ff d0                	callq  *%rax
  802abc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ac0:	48 89 c6             	mov    %rax,%rsi
  802ac3:	bf 00 00 00 00       	mov    $0x0,%edi
  802ac8:	48 b8 20 1a 80 00 00 	movabs $0x801a20,%rax
  802acf:	00 00 00 
  802ad2:	ff d0                	callq  *%rax
  802ad4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ad7:	c9                   	leaveq 
  802ad8:	c3                   	retq   

0000000000802ad9 <read>:
  802ad9:	55                   	push   %rbp
  802ada:	48 89 e5             	mov    %rsp,%rbp
  802add:	48 83 ec 40          	sub    $0x40,%rsp
  802ae1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802ae4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802ae8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802aec:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802af0:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802af3:	48 89 d6             	mov    %rdx,%rsi
  802af6:	89 c7                	mov    %eax,%edi
  802af8:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  802aff:	00 00 00 
  802b02:	ff d0                	callq  *%rax
  802b04:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b07:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b0b:	78 24                	js     802b31 <read+0x58>
  802b0d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b11:	8b 00                	mov    (%rax),%eax
  802b13:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b17:	48 89 d6             	mov    %rdx,%rsi
  802b1a:	89 c7                	mov    %eax,%edi
  802b1c:	48 b8 ff 27 80 00 00 	movabs $0x8027ff,%rax
  802b23:	00 00 00 
  802b26:	ff d0                	callq  *%rax
  802b28:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b2b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b2f:	79 05                	jns    802b36 <read+0x5d>
  802b31:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b34:	eb 76                	jmp    802bac <read+0xd3>
  802b36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b3a:	8b 40 08             	mov    0x8(%rax),%eax
  802b3d:	83 e0 03             	and    $0x3,%eax
  802b40:	83 f8 01             	cmp    $0x1,%eax
  802b43:	75 3a                	jne    802b7f <read+0xa6>
  802b45:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802b4c:	00 00 00 
  802b4f:	48 8b 00             	mov    (%rax),%rax
  802b52:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b58:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802b5b:	89 c6                	mov    %eax,%esi
  802b5d:	48 bf 1f 4f 80 00 00 	movabs $0x804f1f,%rdi
  802b64:	00 00 00 
  802b67:	b8 00 00 00 00       	mov    $0x0,%eax
  802b6c:	48 b9 ae 04 80 00 00 	movabs $0x8004ae,%rcx
  802b73:	00 00 00 
  802b76:	ff d1                	callq  *%rcx
  802b78:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802b7d:	eb 2d                	jmp    802bac <read+0xd3>
  802b7f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b83:	48 8b 40 10          	mov    0x10(%rax),%rax
  802b87:	48 85 c0             	test   %rax,%rax
  802b8a:	75 07                	jne    802b93 <read+0xba>
  802b8c:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802b91:	eb 19                	jmp    802bac <read+0xd3>
  802b93:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b97:	48 8b 40 10          	mov    0x10(%rax),%rax
  802b9b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802b9f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ba3:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802ba7:	48 89 cf             	mov    %rcx,%rdi
  802baa:	ff d0                	callq  *%rax
  802bac:	c9                   	leaveq 
  802bad:	c3                   	retq   

0000000000802bae <readn>:
  802bae:	55                   	push   %rbp
  802baf:	48 89 e5             	mov    %rsp,%rbp
  802bb2:	48 83 ec 30          	sub    $0x30,%rsp
  802bb6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802bb9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802bbd:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802bc1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802bc8:	eb 47                	jmp    802c11 <readn+0x63>
  802bca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bcd:	48 98                	cltq   
  802bcf:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802bd3:	48 29 c2             	sub    %rax,%rdx
  802bd6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802bd9:	48 63 c8             	movslq %eax,%rcx
  802bdc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802be0:	48 01 c1             	add    %rax,%rcx
  802be3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802be6:	48 89 ce             	mov    %rcx,%rsi
  802be9:	89 c7                	mov    %eax,%edi
  802beb:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  802bf2:	00 00 00 
  802bf5:	ff d0                	callq  *%rax
  802bf7:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802bfa:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802bfe:	79 05                	jns    802c05 <readn+0x57>
  802c00:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c03:	eb 1d                	jmp    802c22 <readn+0x74>
  802c05:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c09:	74 13                	je     802c1e <readn+0x70>
  802c0b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c0e:	01 45 fc             	add    %eax,-0x4(%rbp)
  802c11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c14:	48 98                	cltq   
  802c16:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802c1a:	72 ae                	jb     802bca <readn+0x1c>
  802c1c:	eb 01                	jmp    802c1f <readn+0x71>
  802c1e:	90                   	nop
  802c1f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c22:	c9                   	leaveq 
  802c23:	c3                   	retq   

0000000000802c24 <write>:
  802c24:	55                   	push   %rbp
  802c25:	48 89 e5             	mov    %rsp,%rbp
  802c28:	48 83 ec 40          	sub    $0x40,%rsp
  802c2c:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802c2f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802c33:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802c37:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802c3b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802c3e:	48 89 d6             	mov    %rdx,%rsi
  802c41:	89 c7                	mov    %eax,%edi
  802c43:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  802c4a:	00 00 00 
  802c4d:	ff d0                	callq  *%rax
  802c4f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c52:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c56:	78 24                	js     802c7c <write+0x58>
  802c58:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c5c:	8b 00                	mov    (%rax),%eax
  802c5e:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c62:	48 89 d6             	mov    %rdx,%rsi
  802c65:	89 c7                	mov    %eax,%edi
  802c67:	48 b8 ff 27 80 00 00 	movabs $0x8027ff,%rax
  802c6e:	00 00 00 
  802c71:	ff d0                	callq  *%rax
  802c73:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c76:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c7a:	79 05                	jns    802c81 <write+0x5d>
  802c7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c7f:	eb 75                	jmp    802cf6 <write+0xd2>
  802c81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c85:	8b 40 08             	mov    0x8(%rax),%eax
  802c88:	83 e0 03             	and    $0x3,%eax
  802c8b:	85 c0                	test   %eax,%eax
  802c8d:	75 3a                	jne    802cc9 <write+0xa5>
  802c8f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802c96:	00 00 00 
  802c99:	48 8b 00             	mov    (%rax),%rax
  802c9c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802ca2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802ca5:	89 c6                	mov    %eax,%esi
  802ca7:	48 bf 3b 4f 80 00 00 	movabs $0x804f3b,%rdi
  802cae:	00 00 00 
  802cb1:	b8 00 00 00 00       	mov    $0x0,%eax
  802cb6:	48 b9 ae 04 80 00 00 	movabs $0x8004ae,%rcx
  802cbd:	00 00 00 
  802cc0:	ff d1                	callq  *%rcx
  802cc2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802cc7:	eb 2d                	jmp    802cf6 <write+0xd2>
  802cc9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ccd:	48 8b 40 18          	mov    0x18(%rax),%rax
  802cd1:	48 85 c0             	test   %rax,%rax
  802cd4:	75 07                	jne    802cdd <write+0xb9>
  802cd6:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802cdb:	eb 19                	jmp    802cf6 <write+0xd2>
  802cdd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ce1:	48 8b 40 18          	mov    0x18(%rax),%rax
  802ce5:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802ce9:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ced:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802cf1:	48 89 cf             	mov    %rcx,%rdi
  802cf4:	ff d0                	callq  *%rax
  802cf6:	c9                   	leaveq 
  802cf7:	c3                   	retq   

0000000000802cf8 <seek>:
  802cf8:	55                   	push   %rbp
  802cf9:	48 89 e5             	mov    %rsp,%rbp
  802cfc:	48 83 ec 18          	sub    $0x18,%rsp
  802d00:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d03:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802d06:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d0a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d0d:	48 89 d6             	mov    %rdx,%rsi
  802d10:	89 c7                	mov    %eax,%edi
  802d12:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  802d19:	00 00 00 
  802d1c:	ff d0                	callq  *%rax
  802d1e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d21:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d25:	79 05                	jns    802d2c <seek+0x34>
  802d27:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d2a:	eb 0f                	jmp    802d3b <seek+0x43>
  802d2c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d30:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802d33:	89 50 04             	mov    %edx,0x4(%rax)
  802d36:	b8 00 00 00 00       	mov    $0x0,%eax
  802d3b:	c9                   	leaveq 
  802d3c:	c3                   	retq   

0000000000802d3d <ftruncate>:
  802d3d:	55                   	push   %rbp
  802d3e:	48 89 e5             	mov    %rsp,%rbp
  802d41:	48 83 ec 30          	sub    $0x30,%rsp
  802d45:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802d48:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802d4b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802d4f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802d52:	48 89 d6             	mov    %rdx,%rsi
  802d55:	89 c7                	mov    %eax,%edi
  802d57:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  802d5e:	00 00 00 
  802d61:	ff d0                	callq  *%rax
  802d63:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d66:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d6a:	78 24                	js     802d90 <ftruncate+0x53>
  802d6c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d70:	8b 00                	mov    (%rax),%eax
  802d72:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802d76:	48 89 d6             	mov    %rdx,%rsi
  802d79:	89 c7                	mov    %eax,%edi
  802d7b:	48 b8 ff 27 80 00 00 	movabs $0x8027ff,%rax
  802d82:	00 00 00 
  802d85:	ff d0                	callq  *%rax
  802d87:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d8a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d8e:	79 05                	jns    802d95 <ftruncate+0x58>
  802d90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d93:	eb 72                	jmp    802e07 <ftruncate+0xca>
  802d95:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d99:	8b 40 08             	mov    0x8(%rax),%eax
  802d9c:	83 e0 03             	and    $0x3,%eax
  802d9f:	85 c0                	test   %eax,%eax
  802da1:	75 3a                	jne    802ddd <ftruncate+0xa0>
  802da3:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  802daa:	00 00 00 
  802dad:	48 8b 00             	mov    (%rax),%rax
  802db0:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802db6:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802db9:	89 c6                	mov    %eax,%esi
  802dbb:	48 bf 58 4f 80 00 00 	movabs $0x804f58,%rdi
  802dc2:	00 00 00 
  802dc5:	b8 00 00 00 00       	mov    $0x0,%eax
  802dca:	48 b9 ae 04 80 00 00 	movabs $0x8004ae,%rcx
  802dd1:	00 00 00 
  802dd4:	ff d1                	callq  *%rcx
  802dd6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802ddb:	eb 2a                	jmp    802e07 <ftruncate+0xca>
  802ddd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802de1:	48 8b 40 30          	mov    0x30(%rax),%rax
  802de5:	48 85 c0             	test   %rax,%rax
  802de8:	75 07                	jne    802df1 <ftruncate+0xb4>
  802dea:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802def:	eb 16                	jmp    802e07 <ftruncate+0xca>
  802df1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802df5:	48 8b 40 30          	mov    0x30(%rax),%rax
  802df9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802dfd:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802e00:	89 ce                	mov    %ecx,%esi
  802e02:	48 89 d7             	mov    %rdx,%rdi
  802e05:	ff d0                	callq  *%rax
  802e07:	c9                   	leaveq 
  802e08:	c3                   	retq   

0000000000802e09 <fstat>:
  802e09:	55                   	push   %rbp
  802e0a:	48 89 e5             	mov    %rsp,%rbp
  802e0d:	48 83 ec 30          	sub    $0x30,%rsp
  802e11:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802e14:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e18:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802e1c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802e1f:	48 89 d6             	mov    %rdx,%rsi
  802e22:	89 c7                	mov    %eax,%edi
  802e24:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  802e2b:	00 00 00 
  802e2e:	ff d0                	callq  *%rax
  802e30:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e33:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e37:	78 24                	js     802e5d <fstat+0x54>
  802e39:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e3d:	8b 00                	mov    (%rax),%eax
  802e3f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802e43:	48 89 d6             	mov    %rdx,%rsi
  802e46:	89 c7                	mov    %eax,%edi
  802e48:	48 b8 ff 27 80 00 00 	movabs $0x8027ff,%rax
  802e4f:	00 00 00 
  802e52:	ff d0                	callq  *%rax
  802e54:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e57:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e5b:	79 05                	jns    802e62 <fstat+0x59>
  802e5d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e60:	eb 5e                	jmp    802ec0 <fstat+0xb7>
  802e62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e66:	48 8b 40 28          	mov    0x28(%rax),%rax
  802e6a:	48 85 c0             	test   %rax,%rax
  802e6d:	75 07                	jne    802e76 <fstat+0x6d>
  802e6f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e74:	eb 4a                	jmp    802ec0 <fstat+0xb7>
  802e76:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e7a:	c6 00 00             	movb   $0x0,(%rax)
  802e7d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e81:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802e88:	00 00 00 
  802e8b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802e8f:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802e96:	00 00 00 
  802e99:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802e9d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802ea1:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802ea8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802eac:	48 8b 40 28          	mov    0x28(%rax),%rax
  802eb0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802eb4:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802eb8:	48 89 ce             	mov    %rcx,%rsi
  802ebb:	48 89 d7             	mov    %rdx,%rdi
  802ebe:	ff d0                	callq  *%rax
  802ec0:	c9                   	leaveq 
  802ec1:	c3                   	retq   

0000000000802ec2 <stat>:
  802ec2:	55                   	push   %rbp
  802ec3:	48 89 e5             	mov    %rsp,%rbp
  802ec6:	48 83 ec 20          	sub    $0x20,%rsp
  802eca:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ece:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ed2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ed6:	be 00 00 00 00       	mov    $0x0,%esi
  802edb:	48 89 c7             	mov    %rax,%rdi
  802ede:	48 b8 b2 2f 80 00 00 	movabs $0x802fb2,%rax
  802ee5:	00 00 00 
  802ee8:	ff d0                	callq  *%rax
  802eea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802eed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ef1:	79 05                	jns    802ef8 <stat+0x36>
  802ef3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ef6:	eb 2f                	jmp    802f27 <stat+0x65>
  802ef8:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802efc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eff:	48 89 d6             	mov    %rdx,%rsi
  802f02:	89 c7                	mov    %eax,%edi
  802f04:	48 b8 09 2e 80 00 00 	movabs $0x802e09,%rax
  802f0b:	00 00 00 
  802f0e:	ff d0                	callq  *%rax
  802f10:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802f13:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f16:	89 c7                	mov    %eax,%edi
  802f18:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  802f1f:	00 00 00 
  802f22:	ff d0                	callq  *%rax
  802f24:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f27:	c9                   	leaveq 
  802f28:	c3                   	retq   

0000000000802f29 <fsipc>:
  802f29:	55                   	push   %rbp
  802f2a:	48 89 e5             	mov    %rsp,%rbp
  802f2d:	48 83 ec 10          	sub    $0x10,%rsp
  802f31:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802f34:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802f38:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f3f:	00 00 00 
  802f42:	8b 00                	mov    (%rax),%eax
  802f44:	85 c0                	test   %eax,%eax
  802f46:	75 1f                	jne    802f67 <fsipc+0x3e>
  802f48:	bf 01 00 00 00       	mov    $0x1,%edi
  802f4d:	48 b8 4d 25 80 00 00 	movabs $0x80254d,%rax
  802f54:	00 00 00 
  802f57:	ff d0                	callq  *%rax
  802f59:	89 c2                	mov    %eax,%edx
  802f5b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f62:	00 00 00 
  802f65:	89 10                	mov    %edx,(%rax)
  802f67:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802f6e:	00 00 00 
  802f71:	8b 00                	mov    (%rax),%eax
  802f73:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802f76:	b9 07 00 00 00       	mov    $0x7,%ecx
  802f7b:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802f82:	00 00 00 
  802f85:	89 c7                	mov    %eax,%edi
  802f87:	48 b8 43 24 80 00 00 	movabs $0x802443,%rax
  802f8e:	00 00 00 
  802f91:	ff d0                	callq  *%rax
  802f93:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802f97:	ba 00 00 00 00       	mov    $0x0,%edx
  802f9c:	48 89 c6             	mov    %rax,%rsi
  802f9f:	bf 00 00 00 00       	mov    $0x0,%edi
  802fa4:	48 b8 82 23 80 00 00 	movabs $0x802382,%rax
  802fab:	00 00 00 
  802fae:	ff d0                	callq  *%rax
  802fb0:	c9                   	leaveq 
  802fb1:	c3                   	retq   

0000000000802fb2 <open>:
  802fb2:	55                   	push   %rbp
  802fb3:	48 89 e5             	mov    %rsp,%rbp
  802fb6:	48 83 ec 20          	sub    $0x20,%rsp
  802fba:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802fbe:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802fc1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fc5:	48 89 c7             	mov    %rax,%rdi
  802fc8:	48 b8 d2 0f 80 00 00 	movabs $0x800fd2,%rax
  802fcf:	00 00 00 
  802fd2:	ff d0                	callq  *%rax
  802fd4:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802fd9:	7e 0a                	jle    802fe5 <open+0x33>
  802fdb:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802fe0:	e9 a5 00 00 00       	jmpq   80308a <open+0xd8>
  802fe5:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802fe9:	48 89 c7             	mov    %rax,%rdi
  802fec:	48 b8 0c 26 80 00 00 	movabs $0x80260c,%rax
  802ff3:	00 00 00 
  802ff6:	ff d0                	callq  *%rax
  802ff8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ffb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fff:	79 08                	jns    803009 <open+0x57>
  803001:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803004:	e9 81 00 00 00       	jmpq   80308a <open+0xd8>
  803009:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80300d:	48 89 c6             	mov    %rax,%rsi
  803010:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  803017:	00 00 00 
  80301a:	48 b8 3e 10 80 00 00 	movabs $0x80103e,%rax
  803021:	00 00 00 
  803024:	ff d0                	callq  *%rax
  803026:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80302d:	00 00 00 
  803030:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803033:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  803039:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80303d:	48 89 c6             	mov    %rax,%rsi
  803040:	bf 01 00 00 00       	mov    $0x1,%edi
  803045:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  80304c:	00 00 00 
  80304f:	ff d0                	callq  *%rax
  803051:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803054:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803058:	79 1d                	jns    803077 <open+0xc5>
  80305a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80305e:	be 00 00 00 00       	mov    $0x0,%esi
  803063:	48 89 c7             	mov    %rax,%rdi
  803066:	48 b8 34 27 80 00 00 	movabs $0x802734,%rax
  80306d:	00 00 00 
  803070:	ff d0                	callq  *%rax
  803072:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803075:	eb 13                	jmp    80308a <open+0xd8>
  803077:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80307b:	48 89 c7             	mov    %rax,%rdi
  80307e:	48 b8 be 25 80 00 00 	movabs $0x8025be,%rax
  803085:	00 00 00 
  803088:	ff d0                	callq  *%rax
  80308a:	c9                   	leaveq 
  80308b:	c3                   	retq   

000000000080308c <devfile_flush>:
  80308c:	55                   	push   %rbp
  80308d:	48 89 e5             	mov    %rsp,%rbp
  803090:	48 83 ec 10          	sub    $0x10,%rsp
  803094:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803098:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80309c:	8b 50 0c             	mov    0xc(%rax),%edx
  80309f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030a6:	00 00 00 
  8030a9:	89 10                	mov    %edx,(%rax)
  8030ab:	be 00 00 00 00       	mov    $0x0,%esi
  8030b0:	bf 06 00 00 00       	mov    $0x6,%edi
  8030b5:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  8030bc:	00 00 00 
  8030bf:	ff d0                	callq  *%rax
  8030c1:	c9                   	leaveq 
  8030c2:	c3                   	retq   

00000000008030c3 <devfile_read>:
  8030c3:	55                   	push   %rbp
  8030c4:	48 89 e5             	mov    %rsp,%rbp
  8030c7:	48 83 ec 30          	sub    $0x30,%rsp
  8030cb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8030cf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8030d3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8030d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030db:	8b 50 0c             	mov    0xc(%rax),%edx
  8030de:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030e5:	00 00 00 
  8030e8:	89 10                	mov    %edx,(%rax)
  8030ea:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030f1:	00 00 00 
  8030f4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8030f8:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8030fc:	be 00 00 00 00       	mov    $0x0,%esi
  803101:	bf 03 00 00 00       	mov    $0x3,%edi
  803106:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  80310d:	00 00 00 
  803110:	ff d0                	callq  *%rax
  803112:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803115:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803119:	79 08                	jns    803123 <devfile_read+0x60>
  80311b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80311e:	e9 a4 00 00 00       	jmpq   8031c7 <devfile_read+0x104>
  803123:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803126:	48 98                	cltq   
  803128:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80312c:	76 35                	jbe    803163 <devfile_read+0xa0>
  80312e:	48 b9 7e 4f 80 00 00 	movabs $0x804f7e,%rcx
  803135:	00 00 00 
  803138:	48 ba 85 4f 80 00 00 	movabs $0x804f85,%rdx
  80313f:	00 00 00 
  803142:	be 89 00 00 00       	mov    $0x89,%esi
  803147:	48 bf 9a 4f 80 00 00 	movabs $0x804f9a,%rdi
  80314e:	00 00 00 
  803151:	b8 00 00 00 00       	mov    $0x0,%eax
  803156:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80315d:	00 00 00 
  803160:	41 ff d0             	callq  *%r8
  803163:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80316a:	7e 35                	jle    8031a1 <devfile_read+0xde>
  80316c:	48 b9 a8 4f 80 00 00 	movabs $0x804fa8,%rcx
  803173:	00 00 00 
  803176:	48 ba 85 4f 80 00 00 	movabs $0x804f85,%rdx
  80317d:	00 00 00 
  803180:	be 8a 00 00 00       	mov    $0x8a,%esi
  803185:	48 bf 9a 4f 80 00 00 	movabs $0x804f9a,%rdi
  80318c:	00 00 00 
  80318f:	b8 00 00 00 00       	mov    $0x0,%eax
  803194:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  80319b:	00 00 00 
  80319e:	41 ff d0             	callq  *%r8
  8031a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031a4:	48 63 d0             	movslq %eax,%rdx
  8031a7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8031ab:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8031b2:	00 00 00 
  8031b5:	48 89 c7             	mov    %rax,%rdi
  8031b8:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  8031bf:	00 00 00 
  8031c2:	ff d0                	callq  *%rax
  8031c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031c7:	c9                   	leaveq 
  8031c8:	c3                   	retq   

00000000008031c9 <devfile_write>:
  8031c9:	55                   	push   %rbp
  8031ca:	48 89 e5             	mov    %rsp,%rbp
  8031cd:	48 83 ec 40          	sub    $0x40,%rsp
  8031d1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8031d5:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8031d9:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8031dd:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8031e1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8031e5:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8031ec:	00 
  8031ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031f1:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8031f5:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8031fa:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8031fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803202:	8b 50 0c             	mov    0xc(%rax),%edx
  803205:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80320c:	00 00 00 
  80320f:	89 10                	mov    %edx,(%rax)
  803211:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803218:	00 00 00 
  80321b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80321f:	48 89 50 08          	mov    %rdx,0x8(%rax)
  803223:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803227:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80322b:	48 89 c6             	mov    %rax,%rsi
  80322e:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803235:	00 00 00 
  803238:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  80323f:	00 00 00 
  803242:	ff d0                	callq  *%rax
  803244:	be 00 00 00 00       	mov    $0x0,%esi
  803249:	bf 04 00 00 00       	mov    $0x4,%edi
  80324e:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  803255:	00 00 00 
  803258:	ff d0                	callq  *%rax
  80325a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80325d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803261:	79 05                	jns    803268 <devfile_write+0x9f>
  803263:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803266:	eb 43                	jmp    8032ab <devfile_write+0xe2>
  803268:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80326b:	48 98                	cltq   
  80326d:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803271:	76 35                	jbe    8032a8 <devfile_write+0xdf>
  803273:	48 b9 7e 4f 80 00 00 	movabs $0x804f7e,%rcx
  80327a:	00 00 00 
  80327d:	48 ba 85 4f 80 00 00 	movabs $0x804f85,%rdx
  803284:	00 00 00 
  803287:	be a8 00 00 00       	mov    $0xa8,%esi
  80328c:	48 bf 9a 4f 80 00 00 	movabs $0x804f9a,%rdi
  803293:	00 00 00 
  803296:	b8 00 00 00 00       	mov    $0x0,%eax
  80329b:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8032a2:	00 00 00 
  8032a5:	41 ff d0             	callq  *%r8
  8032a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032ab:	c9                   	leaveq 
  8032ac:	c3                   	retq   

00000000008032ad <devfile_stat>:
  8032ad:	55                   	push   %rbp
  8032ae:	48 89 e5             	mov    %rsp,%rbp
  8032b1:	48 83 ec 20          	sub    $0x20,%rsp
  8032b5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8032b9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8032bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8032c1:	8b 50 0c             	mov    0xc(%rax),%edx
  8032c4:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8032cb:	00 00 00 
  8032ce:	89 10                	mov    %edx,(%rax)
  8032d0:	be 00 00 00 00       	mov    $0x0,%esi
  8032d5:	bf 05 00 00 00       	mov    $0x5,%edi
  8032da:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  8032e1:	00 00 00 
  8032e4:	ff d0                	callq  *%rax
  8032e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032e9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032ed:	79 05                	jns    8032f4 <devfile_stat+0x47>
  8032ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032f2:	eb 56                	jmp    80334a <devfile_stat+0x9d>
  8032f4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8032f8:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8032ff:	00 00 00 
  803302:	48 89 c7             	mov    %rax,%rdi
  803305:	48 b8 3e 10 80 00 00 	movabs $0x80103e,%rax
  80330c:	00 00 00 
  80330f:	ff d0                	callq  *%rax
  803311:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803318:	00 00 00 
  80331b:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  803321:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803325:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  80332b:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803332:	00 00 00 
  803335:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  80333b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80333f:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803345:	b8 00 00 00 00       	mov    $0x0,%eax
  80334a:	c9                   	leaveq 
  80334b:	c3                   	retq   

000000000080334c <devfile_trunc>:
  80334c:	55                   	push   %rbp
  80334d:	48 89 e5             	mov    %rsp,%rbp
  803350:	48 83 ec 10          	sub    $0x10,%rsp
  803354:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803358:	89 75 f4             	mov    %esi,-0xc(%rbp)
  80335b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80335f:	8b 50 0c             	mov    0xc(%rax),%edx
  803362:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803369:	00 00 00 
  80336c:	89 10                	mov    %edx,(%rax)
  80336e:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803375:	00 00 00 
  803378:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80337b:	89 50 04             	mov    %edx,0x4(%rax)
  80337e:	be 00 00 00 00       	mov    $0x0,%esi
  803383:	bf 02 00 00 00       	mov    $0x2,%edi
  803388:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  80338f:	00 00 00 
  803392:	ff d0                	callq  *%rax
  803394:	c9                   	leaveq 
  803395:	c3                   	retq   

0000000000803396 <remove>:
  803396:	55                   	push   %rbp
  803397:	48 89 e5             	mov    %rsp,%rbp
  80339a:	48 83 ec 10          	sub    $0x10,%rsp
  80339e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8033a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033a6:	48 89 c7             	mov    %rax,%rdi
  8033a9:	48 b8 d2 0f 80 00 00 	movabs $0x800fd2,%rax
  8033b0:	00 00 00 
  8033b3:	ff d0                	callq  *%rax
  8033b5:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8033ba:	7e 07                	jle    8033c3 <remove+0x2d>
  8033bc:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8033c1:	eb 33                	jmp    8033f6 <remove+0x60>
  8033c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8033c7:	48 89 c6             	mov    %rax,%rsi
  8033ca:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8033d1:	00 00 00 
  8033d4:	48 b8 3e 10 80 00 00 	movabs $0x80103e,%rax
  8033db:	00 00 00 
  8033de:	ff d0                	callq  *%rax
  8033e0:	be 00 00 00 00       	mov    $0x0,%esi
  8033e5:	bf 07 00 00 00       	mov    $0x7,%edi
  8033ea:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  8033f1:	00 00 00 
  8033f4:	ff d0                	callq  *%rax
  8033f6:	c9                   	leaveq 
  8033f7:	c3                   	retq   

00000000008033f8 <sync>:
  8033f8:	55                   	push   %rbp
  8033f9:	48 89 e5             	mov    %rsp,%rbp
  8033fc:	be 00 00 00 00       	mov    $0x0,%esi
  803401:	bf 08 00 00 00       	mov    $0x8,%edi
  803406:	48 b8 29 2f 80 00 00 	movabs $0x802f29,%rax
  80340d:	00 00 00 
  803410:	ff d0                	callq  *%rax
  803412:	5d                   	pop    %rbp
  803413:	c3                   	retq   

0000000000803414 <copy>:
  803414:	55                   	push   %rbp
  803415:	48 89 e5             	mov    %rsp,%rbp
  803418:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80341f:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803426:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  80342d:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  803434:	be 00 00 00 00       	mov    $0x0,%esi
  803439:	48 89 c7             	mov    %rax,%rdi
  80343c:	48 b8 b2 2f 80 00 00 	movabs $0x802fb2,%rax
  803443:	00 00 00 
  803446:	ff d0                	callq  *%rax
  803448:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80344b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80344f:	79 28                	jns    803479 <copy+0x65>
  803451:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803454:	89 c6                	mov    %eax,%esi
  803456:	48 bf b4 4f 80 00 00 	movabs $0x804fb4,%rdi
  80345d:	00 00 00 
  803460:	b8 00 00 00 00       	mov    $0x0,%eax
  803465:	48 ba ae 04 80 00 00 	movabs $0x8004ae,%rdx
  80346c:	00 00 00 
  80346f:	ff d2                	callq  *%rdx
  803471:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803474:	e9 76 01 00 00       	jmpq   8035ef <copy+0x1db>
  803479:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  803480:	be 01 01 00 00       	mov    $0x101,%esi
  803485:	48 89 c7             	mov    %rax,%rdi
  803488:	48 b8 b2 2f 80 00 00 	movabs $0x802fb2,%rax
  80348f:	00 00 00 
  803492:	ff d0                	callq  *%rax
  803494:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803497:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80349b:	0f 89 ad 00 00 00    	jns    80354e <copy+0x13a>
  8034a1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034a4:	89 c6                	mov    %eax,%esi
  8034a6:	48 bf ca 4f 80 00 00 	movabs $0x804fca,%rdi
  8034ad:	00 00 00 
  8034b0:	b8 00 00 00 00       	mov    $0x0,%eax
  8034b5:	48 ba ae 04 80 00 00 	movabs $0x8004ae,%rdx
  8034bc:	00 00 00 
  8034bf:	ff d2                	callq  *%rdx
  8034c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034c4:	89 c7                	mov    %eax,%edi
  8034c6:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  8034cd:	00 00 00 
  8034d0:	ff d0                	callq  *%rax
  8034d2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034d5:	e9 15 01 00 00       	jmpq   8035ef <copy+0x1db>
  8034da:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8034dd:	48 63 d0             	movslq %eax,%rdx
  8034e0:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8034e7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8034ea:	48 89 ce             	mov    %rcx,%rsi
  8034ed:	89 c7                	mov    %eax,%edi
  8034ef:	48 b8 24 2c 80 00 00 	movabs $0x802c24,%rax
  8034f6:	00 00 00 
  8034f9:	ff d0                	callq  *%rax
  8034fb:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8034fe:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  803502:	79 4a                	jns    80354e <copy+0x13a>
  803504:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803507:	89 c6                	mov    %eax,%esi
  803509:	48 bf e4 4f 80 00 00 	movabs $0x804fe4,%rdi
  803510:	00 00 00 
  803513:	b8 00 00 00 00       	mov    $0x0,%eax
  803518:	48 ba ae 04 80 00 00 	movabs $0x8004ae,%rdx
  80351f:	00 00 00 
  803522:	ff d2                	callq  *%rdx
  803524:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803527:	89 c7                	mov    %eax,%edi
  803529:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  803530:	00 00 00 
  803533:	ff d0                	callq  *%rax
  803535:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803538:	89 c7                	mov    %eax,%edi
  80353a:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  803541:	00 00 00 
  803544:	ff d0                	callq  *%rax
  803546:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803549:	e9 a1 00 00 00       	jmpq   8035ef <copy+0x1db>
  80354e:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803555:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803558:	ba 00 02 00 00       	mov    $0x200,%edx
  80355d:	48 89 ce             	mov    %rcx,%rsi
  803560:	89 c7                	mov    %eax,%edi
  803562:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  803569:	00 00 00 
  80356c:	ff d0                	callq  *%rax
  80356e:	89 45 f4             	mov    %eax,-0xc(%rbp)
  803571:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803575:	0f 8f 5f ff ff ff    	jg     8034da <copy+0xc6>
  80357b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80357f:	79 47                	jns    8035c8 <copy+0x1b4>
  803581:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803584:	89 c6                	mov    %eax,%esi
  803586:	48 bf f7 4f 80 00 00 	movabs $0x804ff7,%rdi
  80358d:	00 00 00 
  803590:	b8 00 00 00 00       	mov    $0x0,%eax
  803595:	48 ba ae 04 80 00 00 	movabs $0x8004ae,%rdx
  80359c:	00 00 00 
  80359f:	ff d2                	callq  *%rdx
  8035a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035a4:	89 c7                	mov    %eax,%edi
  8035a6:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  8035ad:	00 00 00 
  8035b0:	ff d0                	callq  *%rax
  8035b2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035b5:	89 c7                	mov    %eax,%edi
  8035b7:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  8035be:	00 00 00 
  8035c1:	ff d0                	callq  *%rax
  8035c3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8035c6:	eb 27                	jmp    8035ef <copy+0x1db>
  8035c8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035cb:	89 c7                	mov    %eax,%edi
  8035cd:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  8035d4:	00 00 00 
  8035d7:	ff d0                	callq  *%rax
  8035d9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8035dc:	89 c7                	mov    %eax,%edi
  8035de:	48 b8 b6 28 80 00 00 	movabs $0x8028b6,%rax
  8035e5:	00 00 00 
  8035e8:	ff d0                	callq  *%rax
  8035ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8035ef:	c9                   	leaveq 
  8035f0:	c3                   	retq   

00000000008035f1 <fd2sockid>:
  8035f1:	55                   	push   %rbp
  8035f2:	48 89 e5             	mov    %rsp,%rbp
  8035f5:	48 83 ec 20          	sub    $0x20,%rsp
  8035f9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035fc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803600:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803603:	48 89 d6             	mov    %rdx,%rsi
  803606:	89 c7                	mov    %eax,%edi
  803608:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  80360f:	00 00 00 
  803612:	ff d0                	callq  *%rax
  803614:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803617:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80361b:	79 05                	jns    803622 <fd2sockid+0x31>
  80361d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803620:	eb 24                	jmp    803646 <fd2sockid+0x55>
  803622:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803626:	8b 10                	mov    (%rax),%edx
  803628:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  80362f:	00 00 00 
  803632:	8b 00                	mov    (%rax),%eax
  803634:	39 c2                	cmp    %eax,%edx
  803636:	74 07                	je     80363f <fd2sockid+0x4e>
  803638:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80363d:	eb 07                	jmp    803646 <fd2sockid+0x55>
  80363f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803643:	8b 40 0c             	mov    0xc(%rax),%eax
  803646:	c9                   	leaveq 
  803647:	c3                   	retq   

0000000000803648 <alloc_sockfd>:
  803648:	55                   	push   %rbp
  803649:	48 89 e5             	mov    %rsp,%rbp
  80364c:	48 83 ec 20          	sub    $0x20,%rsp
  803650:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803653:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803657:	48 89 c7             	mov    %rax,%rdi
  80365a:	48 b8 0c 26 80 00 00 	movabs $0x80260c,%rax
  803661:	00 00 00 
  803664:	ff d0                	callq  *%rax
  803666:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803669:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80366d:	78 26                	js     803695 <alloc_sockfd+0x4d>
  80366f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803673:	ba 07 04 00 00       	mov    $0x407,%edx
  803678:	48 89 c6             	mov    %rax,%rsi
  80367b:	bf 00 00 00 00       	mov    $0x0,%edi
  803680:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  803687:	00 00 00 
  80368a:	ff d0                	callq  *%rax
  80368c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80368f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803693:	79 16                	jns    8036ab <alloc_sockfd+0x63>
  803695:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803698:	89 c7                	mov    %eax,%edi
  80369a:	48 b8 57 3b 80 00 00 	movabs $0x803b57,%rax
  8036a1:	00 00 00 
  8036a4:	ff d0                	callq  *%rax
  8036a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8036a9:	eb 3a                	jmp    8036e5 <alloc_sockfd+0x9d>
  8036ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036af:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  8036b6:	00 00 00 
  8036b9:	8b 12                	mov    (%rdx),%edx
  8036bb:	89 10                	mov    %edx,(%rax)
  8036bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036c1:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8036c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036cc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8036cf:	89 50 0c             	mov    %edx,0xc(%rax)
  8036d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036d6:	48 89 c7             	mov    %rax,%rdi
  8036d9:	48 b8 be 25 80 00 00 	movabs $0x8025be,%rax
  8036e0:	00 00 00 
  8036e3:	ff d0                	callq  *%rax
  8036e5:	c9                   	leaveq 
  8036e6:	c3                   	retq   

00000000008036e7 <accept>:
  8036e7:	55                   	push   %rbp
  8036e8:	48 89 e5             	mov    %rsp,%rbp
  8036eb:	48 83 ec 30          	sub    $0x30,%rsp
  8036ef:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036f2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8036f6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8036fa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036fd:	89 c7                	mov    %eax,%edi
  8036ff:	48 b8 f1 35 80 00 00 	movabs $0x8035f1,%rax
  803706:	00 00 00 
  803709:	ff d0                	callq  *%rax
  80370b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80370e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803712:	79 05                	jns    803719 <accept+0x32>
  803714:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803717:	eb 3b                	jmp    803754 <accept+0x6d>
  803719:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80371d:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803721:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803724:	48 89 ce             	mov    %rcx,%rsi
  803727:	89 c7                	mov    %eax,%edi
  803729:	48 b8 34 3a 80 00 00 	movabs $0x803a34,%rax
  803730:	00 00 00 
  803733:	ff d0                	callq  *%rax
  803735:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803738:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80373c:	79 05                	jns    803743 <accept+0x5c>
  80373e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803741:	eb 11                	jmp    803754 <accept+0x6d>
  803743:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803746:	89 c7                	mov    %eax,%edi
  803748:	48 b8 48 36 80 00 00 	movabs $0x803648,%rax
  80374f:	00 00 00 
  803752:	ff d0                	callq  *%rax
  803754:	c9                   	leaveq 
  803755:	c3                   	retq   

0000000000803756 <bind>:
  803756:	55                   	push   %rbp
  803757:	48 89 e5             	mov    %rsp,%rbp
  80375a:	48 83 ec 20          	sub    $0x20,%rsp
  80375e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803761:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803765:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803768:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80376b:	89 c7                	mov    %eax,%edi
  80376d:	48 b8 f1 35 80 00 00 	movabs $0x8035f1,%rax
  803774:	00 00 00 
  803777:	ff d0                	callq  *%rax
  803779:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80377c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803780:	79 05                	jns    803787 <bind+0x31>
  803782:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803785:	eb 1b                	jmp    8037a2 <bind+0x4c>
  803787:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80378a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80378e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803791:	48 89 ce             	mov    %rcx,%rsi
  803794:	89 c7                	mov    %eax,%edi
  803796:	48 b8 b3 3a 80 00 00 	movabs $0x803ab3,%rax
  80379d:	00 00 00 
  8037a0:	ff d0                	callq  *%rax
  8037a2:	c9                   	leaveq 
  8037a3:	c3                   	retq   

00000000008037a4 <shutdown>:
  8037a4:	55                   	push   %rbp
  8037a5:	48 89 e5             	mov    %rsp,%rbp
  8037a8:	48 83 ec 20          	sub    $0x20,%rsp
  8037ac:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037af:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8037b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037b5:	89 c7                	mov    %eax,%edi
  8037b7:	48 b8 f1 35 80 00 00 	movabs $0x8035f1,%rax
  8037be:	00 00 00 
  8037c1:	ff d0                	callq  *%rax
  8037c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037ca:	79 05                	jns    8037d1 <shutdown+0x2d>
  8037cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037cf:	eb 16                	jmp    8037e7 <shutdown+0x43>
  8037d1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8037d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037d7:	89 d6                	mov    %edx,%esi
  8037d9:	89 c7                	mov    %eax,%edi
  8037db:	48 b8 17 3b 80 00 00 	movabs $0x803b17,%rax
  8037e2:	00 00 00 
  8037e5:	ff d0                	callq  *%rax
  8037e7:	c9                   	leaveq 
  8037e8:	c3                   	retq   

00000000008037e9 <devsock_close>:
  8037e9:	55                   	push   %rbp
  8037ea:	48 89 e5             	mov    %rsp,%rbp
  8037ed:	48 83 ec 10          	sub    $0x10,%rsp
  8037f1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8037f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8037f9:	48 89 c7             	mov    %rax,%rdi
  8037fc:	48 b8 95 47 80 00 00 	movabs $0x804795,%rax
  803803:	00 00 00 
  803806:	ff d0                	callq  *%rax
  803808:	83 f8 01             	cmp    $0x1,%eax
  80380b:	75 17                	jne    803824 <devsock_close+0x3b>
  80380d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803811:	8b 40 0c             	mov    0xc(%rax),%eax
  803814:	89 c7                	mov    %eax,%edi
  803816:	48 b8 57 3b 80 00 00 	movabs $0x803b57,%rax
  80381d:	00 00 00 
  803820:	ff d0                	callq  *%rax
  803822:	eb 05                	jmp    803829 <devsock_close+0x40>
  803824:	b8 00 00 00 00       	mov    $0x0,%eax
  803829:	c9                   	leaveq 
  80382a:	c3                   	retq   

000000000080382b <connect>:
  80382b:	55                   	push   %rbp
  80382c:	48 89 e5             	mov    %rsp,%rbp
  80382f:	48 83 ec 20          	sub    $0x20,%rsp
  803833:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803836:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80383a:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80383d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803840:	89 c7                	mov    %eax,%edi
  803842:	48 b8 f1 35 80 00 00 	movabs $0x8035f1,%rax
  803849:	00 00 00 
  80384c:	ff d0                	callq  *%rax
  80384e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803851:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803855:	79 05                	jns    80385c <connect+0x31>
  803857:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80385a:	eb 1b                	jmp    803877 <connect+0x4c>
  80385c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80385f:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803863:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803866:	48 89 ce             	mov    %rcx,%rsi
  803869:	89 c7                	mov    %eax,%edi
  80386b:	48 b8 84 3b 80 00 00 	movabs $0x803b84,%rax
  803872:	00 00 00 
  803875:	ff d0                	callq  *%rax
  803877:	c9                   	leaveq 
  803878:	c3                   	retq   

0000000000803879 <listen>:
  803879:	55                   	push   %rbp
  80387a:	48 89 e5             	mov    %rsp,%rbp
  80387d:	48 83 ec 20          	sub    $0x20,%rsp
  803881:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803884:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803887:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80388a:	89 c7                	mov    %eax,%edi
  80388c:	48 b8 f1 35 80 00 00 	movabs $0x8035f1,%rax
  803893:	00 00 00 
  803896:	ff d0                	callq  *%rax
  803898:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80389b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80389f:	79 05                	jns    8038a6 <listen+0x2d>
  8038a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038a4:	eb 16                	jmp    8038bc <listen+0x43>
  8038a6:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038ac:	89 d6                	mov    %edx,%esi
  8038ae:	89 c7                	mov    %eax,%edi
  8038b0:	48 b8 e8 3b 80 00 00 	movabs $0x803be8,%rax
  8038b7:	00 00 00 
  8038ba:	ff d0                	callq  *%rax
  8038bc:	c9                   	leaveq 
  8038bd:	c3                   	retq   

00000000008038be <devsock_read>:
  8038be:	55                   	push   %rbp
  8038bf:	48 89 e5             	mov    %rsp,%rbp
  8038c2:	48 83 ec 20          	sub    $0x20,%rsp
  8038c6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038ca:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8038ce:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8038d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038d6:	89 c2                	mov    %eax,%edx
  8038d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038dc:	8b 40 0c             	mov    0xc(%rax),%eax
  8038df:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8038e3:	b9 00 00 00 00       	mov    $0x0,%ecx
  8038e8:	89 c7                	mov    %eax,%edi
  8038ea:	48 b8 28 3c 80 00 00 	movabs $0x803c28,%rax
  8038f1:	00 00 00 
  8038f4:	ff d0                	callq  *%rax
  8038f6:	c9                   	leaveq 
  8038f7:	c3                   	retq   

00000000008038f8 <devsock_write>:
  8038f8:	55                   	push   %rbp
  8038f9:	48 89 e5             	mov    %rsp,%rbp
  8038fc:	48 83 ec 20          	sub    $0x20,%rsp
  803900:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803904:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803908:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80390c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803910:	89 c2                	mov    %eax,%edx
  803912:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803916:	8b 40 0c             	mov    0xc(%rax),%eax
  803919:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80391d:	b9 00 00 00 00       	mov    $0x0,%ecx
  803922:	89 c7                	mov    %eax,%edi
  803924:	48 b8 f4 3c 80 00 00 	movabs $0x803cf4,%rax
  80392b:	00 00 00 
  80392e:	ff d0                	callq  *%rax
  803930:	c9                   	leaveq 
  803931:	c3                   	retq   

0000000000803932 <devsock_stat>:
  803932:	55                   	push   %rbp
  803933:	48 89 e5             	mov    %rsp,%rbp
  803936:	48 83 ec 10          	sub    $0x10,%rsp
  80393a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80393e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803942:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803946:	48 be 12 50 80 00 00 	movabs $0x805012,%rsi
  80394d:	00 00 00 
  803950:	48 89 c7             	mov    %rax,%rdi
  803953:	48 b8 3e 10 80 00 00 	movabs $0x80103e,%rax
  80395a:	00 00 00 
  80395d:	ff d0                	callq  *%rax
  80395f:	b8 00 00 00 00       	mov    $0x0,%eax
  803964:	c9                   	leaveq 
  803965:	c3                   	retq   

0000000000803966 <socket>:
  803966:	55                   	push   %rbp
  803967:	48 89 e5             	mov    %rsp,%rbp
  80396a:	48 83 ec 20          	sub    $0x20,%rsp
  80396e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803971:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803974:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803977:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80397a:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80397d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803980:	89 ce                	mov    %ecx,%esi
  803982:	89 c7                	mov    %eax,%edi
  803984:	48 b8 ac 3d 80 00 00 	movabs $0x803dac,%rax
  80398b:	00 00 00 
  80398e:	ff d0                	callq  *%rax
  803990:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803993:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803997:	79 05                	jns    80399e <socket+0x38>
  803999:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80399c:	eb 11                	jmp    8039af <socket+0x49>
  80399e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039a1:	89 c7                	mov    %eax,%edi
  8039a3:	48 b8 48 36 80 00 00 	movabs $0x803648,%rax
  8039aa:	00 00 00 
  8039ad:	ff d0                	callq  *%rax
  8039af:	c9                   	leaveq 
  8039b0:	c3                   	retq   

00000000008039b1 <nsipc>:
  8039b1:	55                   	push   %rbp
  8039b2:	48 89 e5             	mov    %rsp,%rbp
  8039b5:	48 83 ec 10          	sub    $0x10,%rsp
  8039b9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8039bc:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8039c3:	00 00 00 
  8039c6:	8b 00                	mov    (%rax),%eax
  8039c8:	85 c0                	test   %eax,%eax
  8039ca:	75 1f                	jne    8039eb <nsipc+0x3a>
  8039cc:	bf 02 00 00 00       	mov    $0x2,%edi
  8039d1:	48 b8 4d 25 80 00 00 	movabs $0x80254d,%rax
  8039d8:	00 00 00 
  8039db:	ff d0                	callq  *%rax
  8039dd:	89 c2                	mov    %eax,%edx
  8039df:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8039e6:	00 00 00 
  8039e9:	89 10                	mov    %edx,(%rax)
  8039eb:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  8039f2:	00 00 00 
  8039f5:	8b 00                	mov    (%rax),%eax
  8039f7:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8039fa:	b9 07 00 00 00       	mov    $0x7,%ecx
  8039ff:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803a06:	00 00 00 
  803a09:	89 c7                	mov    %eax,%edi
  803a0b:	48 b8 43 24 80 00 00 	movabs $0x802443,%rax
  803a12:	00 00 00 
  803a15:	ff d0                	callq  *%rax
  803a17:	ba 00 00 00 00       	mov    $0x0,%edx
  803a1c:	be 00 00 00 00       	mov    $0x0,%esi
  803a21:	bf 00 00 00 00       	mov    $0x0,%edi
  803a26:	48 b8 82 23 80 00 00 	movabs $0x802382,%rax
  803a2d:	00 00 00 
  803a30:	ff d0                	callq  *%rax
  803a32:	c9                   	leaveq 
  803a33:	c3                   	retq   

0000000000803a34 <nsipc_accept>:
  803a34:	55                   	push   %rbp
  803a35:	48 89 e5             	mov    %rsp,%rbp
  803a38:	48 83 ec 30          	sub    $0x30,%rsp
  803a3c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a3f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a43:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a47:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a4e:	00 00 00 
  803a51:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803a54:	89 10                	mov    %edx,(%rax)
  803a56:	bf 01 00 00 00       	mov    $0x1,%edi
  803a5b:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803a62:	00 00 00 
  803a65:	ff d0                	callq  *%rax
  803a67:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a6a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a6e:	78 3e                	js     803aae <nsipc_accept+0x7a>
  803a70:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803a77:	00 00 00 
  803a7a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a7e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a82:	8b 40 10             	mov    0x10(%rax),%eax
  803a85:	89 c2                	mov    %eax,%edx
  803a87:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803a8b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a8f:	48 89 ce             	mov    %rcx,%rsi
  803a92:	48 89 c7             	mov    %rax,%rdi
  803a95:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  803a9c:	00 00 00 
  803a9f:	ff d0                	callq  *%rax
  803aa1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aa5:	8b 50 10             	mov    0x10(%rax),%edx
  803aa8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803aac:	89 10                	mov    %edx,(%rax)
  803aae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ab1:	c9                   	leaveq 
  803ab2:	c3                   	retq   

0000000000803ab3 <nsipc_bind>:
  803ab3:	55                   	push   %rbp
  803ab4:	48 89 e5             	mov    %rsp,%rbp
  803ab7:	48 83 ec 10          	sub    $0x10,%rsp
  803abb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803abe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803ac2:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803ac5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803acc:	00 00 00 
  803acf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ad2:	89 10                	mov    %edx,(%rax)
  803ad4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ad7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803adb:	48 89 c6             	mov    %rax,%rsi
  803ade:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803ae5:	00 00 00 
  803ae8:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  803aef:	00 00 00 
  803af2:	ff d0                	callq  *%rax
  803af4:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803afb:	00 00 00 
  803afe:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b01:	89 50 14             	mov    %edx,0x14(%rax)
  803b04:	bf 02 00 00 00       	mov    $0x2,%edi
  803b09:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803b10:	00 00 00 
  803b13:	ff d0                	callq  *%rax
  803b15:	c9                   	leaveq 
  803b16:	c3                   	retq   

0000000000803b17 <nsipc_shutdown>:
  803b17:	55                   	push   %rbp
  803b18:	48 89 e5             	mov    %rsp,%rbp
  803b1b:	48 83 ec 10          	sub    $0x10,%rsp
  803b1f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b22:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803b25:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b2c:	00 00 00 
  803b2f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b32:	89 10                	mov    %edx,(%rax)
  803b34:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b3b:	00 00 00 
  803b3e:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803b41:	89 50 04             	mov    %edx,0x4(%rax)
  803b44:	bf 03 00 00 00       	mov    $0x3,%edi
  803b49:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803b50:	00 00 00 
  803b53:	ff d0                	callq  *%rax
  803b55:	c9                   	leaveq 
  803b56:	c3                   	retq   

0000000000803b57 <nsipc_close>:
  803b57:	55                   	push   %rbp
  803b58:	48 89 e5             	mov    %rsp,%rbp
  803b5b:	48 83 ec 10          	sub    $0x10,%rsp
  803b5f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b62:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b69:	00 00 00 
  803b6c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803b6f:	89 10                	mov    %edx,(%rax)
  803b71:	bf 04 00 00 00       	mov    $0x4,%edi
  803b76:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803b7d:	00 00 00 
  803b80:	ff d0                	callq  *%rax
  803b82:	c9                   	leaveq 
  803b83:	c3                   	retq   

0000000000803b84 <nsipc_connect>:
  803b84:	55                   	push   %rbp
  803b85:	48 89 e5             	mov    %rsp,%rbp
  803b88:	48 83 ec 10          	sub    $0x10,%rsp
  803b8c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803b8f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803b93:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803b96:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b9d:	00 00 00 
  803ba0:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ba3:	89 10                	mov    %edx,(%rax)
  803ba5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803ba8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bac:	48 89 c6             	mov    %rax,%rsi
  803baf:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803bb6:	00 00 00 
  803bb9:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  803bc0:	00 00 00 
  803bc3:	ff d0                	callq  *%rax
  803bc5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bcc:	00 00 00 
  803bcf:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803bd2:	89 50 14             	mov    %edx,0x14(%rax)
  803bd5:	bf 05 00 00 00       	mov    $0x5,%edi
  803bda:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803be1:	00 00 00 
  803be4:	ff d0                	callq  *%rax
  803be6:	c9                   	leaveq 
  803be7:	c3                   	retq   

0000000000803be8 <nsipc_listen>:
  803be8:	55                   	push   %rbp
  803be9:	48 89 e5             	mov    %rsp,%rbp
  803bec:	48 83 ec 10          	sub    $0x10,%rsp
  803bf0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803bf3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803bf6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bfd:	00 00 00 
  803c00:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c03:	89 10                	mov    %edx,(%rax)
  803c05:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c0c:	00 00 00 
  803c0f:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c12:	89 50 04             	mov    %edx,0x4(%rax)
  803c15:	bf 06 00 00 00       	mov    $0x6,%edi
  803c1a:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803c21:	00 00 00 
  803c24:	ff d0                	callq  *%rax
  803c26:	c9                   	leaveq 
  803c27:	c3                   	retq   

0000000000803c28 <nsipc_recv>:
  803c28:	55                   	push   %rbp
  803c29:	48 89 e5             	mov    %rsp,%rbp
  803c2c:	48 83 ec 30          	sub    $0x30,%rsp
  803c30:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c33:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803c37:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803c3a:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803c3d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c44:	00 00 00 
  803c47:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803c4a:	89 10                	mov    %edx,(%rax)
  803c4c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c53:	00 00 00 
  803c56:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803c59:	89 50 04             	mov    %edx,0x4(%rax)
  803c5c:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c63:	00 00 00 
  803c66:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803c69:	89 50 08             	mov    %edx,0x8(%rax)
  803c6c:	bf 07 00 00 00       	mov    $0x7,%edi
  803c71:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803c78:	00 00 00 
  803c7b:	ff d0                	callq  *%rax
  803c7d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c80:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c84:	78 69                	js     803cef <nsipc_recv+0xc7>
  803c86:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803c8d:	7f 08                	jg     803c97 <nsipc_recv+0x6f>
  803c8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c92:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803c95:	7e 35                	jle    803ccc <nsipc_recv+0xa4>
  803c97:	48 b9 19 50 80 00 00 	movabs $0x805019,%rcx
  803c9e:	00 00 00 
  803ca1:	48 ba 2e 50 80 00 00 	movabs $0x80502e,%rdx
  803ca8:	00 00 00 
  803cab:	be 62 00 00 00       	mov    $0x62,%esi
  803cb0:	48 bf 43 50 80 00 00 	movabs $0x805043,%rdi
  803cb7:	00 00 00 
  803cba:	b8 00 00 00 00       	mov    $0x0,%eax
  803cbf:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  803cc6:	00 00 00 
  803cc9:	41 ff d0             	callq  *%r8
  803ccc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ccf:	48 63 d0             	movslq %eax,%rdx
  803cd2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803cd6:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803cdd:	00 00 00 
  803ce0:	48 89 c7             	mov    %rax,%rdi
  803ce3:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  803cea:	00 00 00 
  803ced:	ff d0                	callq  *%rax
  803cef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cf2:	c9                   	leaveq 
  803cf3:	c3                   	retq   

0000000000803cf4 <nsipc_send>:
  803cf4:	55                   	push   %rbp
  803cf5:	48 89 e5             	mov    %rsp,%rbp
  803cf8:	48 83 ec 20          	sub    $0x20,%rsp
  803cfc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803d03:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803d06:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803d09:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d10:	00 00 00 
  803d13:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803d16:	89 10                	mov    %edx,(%rax)
  803d18:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803d1f:	7e 35                	jle    803d56 <nsipc_send+0x62>
  803d21:	48 b9 52 50 80 00 00 	movabs $0x805052,%rcx
  803d28:	00 00 00 
  803d2b:	48 ba 2e 50 80 00 00 	movabs $0x80502e,%rdx
  803d32:	00 00 00 
  803d35:	be 6d 00 00 00       	mov    $0x6d,%esi
  803d3a:	48 bf 43 50 80 00 00 	movabs $0x805043,%rdi
  803d41:	00 00 00 
  803d44:	b8 00 00 00 00       	mov    $0x0,%eax
  803d49:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  803d50:	00 00 00 
  803d53:	41 ff d0             	callq  *%r8
  803d56:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d59:	48 63 d0             	movslq %eax,%rdx
  803d5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d60:	48 89 c6             	mov    %rax,%rsi
  803d63:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803d6a:	00 00 00 
  803d6d:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  803d74:	00 00 00 
  803d77:	ff d0                	callq  *%rax
  803d79:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d80:	00 00 00 
  803d83:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803d86:	89 50 04             	mov    %edx,0x4(%rax)
  803d89:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d90:	00 00 00 
  803d93:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803d96:	89 50 08             	mov    %edx,0x8(%rax)
  803d99:	bf 08 00 00 00       	mov    $0x8,%edi
  803d9e:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803da5:	00 00 00 
  803da8:	ff d0                	callq  *%rax
  803daa:	c9                   	leaveq 
  803dab:	c3                   	retq   

0000000000803dac <nsipc_socket>:
  803dac:	55                   	push   %rbp
  803dad:	48 89 e5             	mov    %rsp,%rbp
  803db0:	48 83 ec 10          	sub    $0x10,%rsp
  803db4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803db7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803dba:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803dbd:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dc4:	00 00 00 
  803dc7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803dca:	89 10                	mov    %edx,(%rax)
  803dcc:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803dd3:	00 00 00 
  803dd6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803dd9:	89 50 04             	mov    %edx,0x4(%rax)
  803ddc:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803de3:	00 00 00 
  803de6:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803de9:	89 50 08             	mov    %edx,0x8(%rax)
  803dec:	bf 09 00 00 00       	mov    $0x9,%edi
  803df1:	48 b8 b1 39 80 00 00 	movabs $0x8039b1,%rax
  803df8:	00 00 00 
  803dfb:	ff d0                	callq  *%rax
  803dfd:	c9                   	leaveq 
  803dfe:	c3                   	retq   

0000000000803dff <pipe>:
  803dff:	55                   	push   %rbp
  803e00:	48 89 e5             	mov    %rsp,%rbp
  803e03:	53                   	push   %rbx
  803e04:	48 83 ec 38          	sub    $0x38,%rsp
  803e08:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803e0c:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803e10:	48 89 c7             	mov    %rax,%rdi
  803e13:	48 b8 0c 26 80 00 00 	movabs $0x80260c,%rax
  803e1a:	00 00 00 
  803e1d:	ff d0                	callq  *%rax
  803e1f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e22:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e26:	0f 88 bf 01 00 00    	js     803feb <pipe+0x1ec>
  803e2c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e30:	ba 07 04 00 00       	mov    $0x407,%edx
  803e35:	48 89 c6             	mov    %rax,%rsi
  803e38:	bf 00 00 00 00       	mov    $0x0,%edi
  803e3d:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  803e44:	00 00 00 
  803e47:	ff d0                	callq  *%rax
  803e49:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e4c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e50:	0f 88 95 01 00 00    	js     803feb <pipe+0x1ec>
  803e56:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803e5a:	48 89 c7             	mov    %rax,%rdi
  803e5d:	48 b8 0c 26 80 00 00 	movabs $0x80260c,%rax
  803e64:	00 00 00 
  803e67:	ff d0                	callq  *%rax
  803e69:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e6c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e70:	0f 88 5d 01 00 00    	js     803fd3 <pipe+0x1d4>
  803e76:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803e7a:	ba 07 04 00 00       	mov    $0x407,%edx
  803e7f:	48 89 c6             	mov    %rax,%rsi
  803e82:	bf 00 00 00 00       	mov    $0x0,%edi
  803e87:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  803e8e:	00 00 00 
  803e91:	ff d0                	callq  *%rax
  803e93:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803e96:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803e9a:	0f 88 33 01 00 00    	js     803fd3 <pipe+0x1d4>
  803ea0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ea4:	48 89 c7             	mov    %rax,%rdi
  803ea7:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  803eae:	00 00 00 
  803eb1:	ff d0                	callq  *%rax
  803eb3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803eb7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ebb:	ba 07 04 00 00       	mov    $0x407,%edx
  803ec0:	48 89 c6             	mov    %rax,%rsi
  803ec3:	bf 00 00 00 00       	mov    $0x0,%edi
  803ec8:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  803ecf:	00 00 00 
  803ed2:	ff d0                	callq  *%rax
  803ed4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ed7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803edb:	0f 88 d9 00 00 00    	js     803fba <pipe+0x1bb>
  803ee1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ee5:	48 89 c7             	mov    %rax,%rdi
  803ee8:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  803eef:	00 00 00 
  803ef2:	ff d0                	callq  *%rax
  803ef4:	48 89 c2             	mov    %rax,%rdx
  803ef7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803efb:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803f01:	48 89 d1             	mov    %rdx,%rcx
  803f04:	ba 00 00 00 00       	mov    $0x0,%edx
  803f09:	48 89 c6             	mov    %rax,%rsi
  803f0c:	bf 00 00 00 00       	mov    $0x0,%edi
  803f11:	48 b8 c0 19 80 00 00 	movabs $0x8019c0,%rax
  803f18:	00 00 00 
  803f1b:	ff d0                	callq  *%rax
  803f1d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f20:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f24:	78 79                	js     803f9f <pipe+0x1a0>
  803f26:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f2a:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803f31:	00 00 00 
  803f34:	8b 12                	mov    (%rdx),%edx
  803f36:	89 10                	mov    %edx,(%rax)
  803f38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f3c:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803f43:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f47:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  803f4e:	00 00 00 
  803f51:	8b 12                	mov    (%rdx),%edx
  803f53:	89 10                	mov    %edx,(%rax)
  803f55:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f59:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803f60:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f64:	48 89 c7             	mov    %rax,%rdi
  803f67:	48 b8 be 25 80 00 00 	movabs $0x8025be,%rax
  803f6e:	00 00 00 
  803f71:	ff d0                	callq  *%rax
  803f73:	89 c2                	mov    %eax,%edx
  803f75:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803f79:	89 10                	mov    %edx,(%rax)
  803f7b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803f7f:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803f83:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f87:	48 89 c7             	mov    %rax,%rdi
  803f8a:	48 b8 be 25 80 00 00 	movabs $0x8025be,%rax
  803f91:	00 00 00 
  803f94:	ff d0                	callq  *%rax
  803f96:	89 03                	mov    %eax,(%rbx)
  803f98:	b8 00 00 00 00       	mov    $0x0,%eax
  803f9d:	eb 4f                	jmp    803fee <pipe+0x1ef>
  803f9f:	90                   	nop
  803fa0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fa4:	48 89 c6             	mov    %rax,%rsi
  803fa7:	bf 00 00 00 00       	mov    $0x0,%edi
  803fac:	48 b8 20 1a 80 00 00 	movabs $0x801a20,%rax
  803fb3:	00 00 00 
  803fb6:	ff d0                	callq  *%rax
  803fb8:	eb 01                	jmp    803fbb <pipe+0x1bc>
  803fba:	90                   	nop
  803fbb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fbf:	48 89 c6             	mov    %rax,%rsi
  803fc2:	bf 00 00 00 00       	mov    $0x0,%edi
  803fc7:	48 b8 20 1a 80 00 00 	movabs $0x801a20,%rax
  803fce:	00 00 00 
  803fd1:	ff d0                	callq  *%rax
  803fd3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fd7:	48 89 c6             	mov    %rax,%rsi
  803fda:	bf 00 00 00 00       	mov    $0x0,%edi
  803fdf:	48 b8 20 1a 80 00 00 	movabs $0x801a20,%rax
  803fe6:	00 00 00 
  803fe9:	ff d0                	callq  *%rax
  803feb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fee:	48 83 c4 38          	add    $0x38,%rsp
  803ff2:	5b                   	pop    %rbx
  803ff3:	5d                   	pop    %rbp
  803ff4:	c3                   	retq   

0000000000803ff5 <_pipeisclosed>:
  803ff5:	55                   	push   %rbp
  803ff6:	48 89 e5             	mov    %rsp,%rbp
  803ff9:	53                   	push   %rbx
  803ffa:	48 83 ec 28          	sub    $0x28,%rsp
  803ffe:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804002:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804006:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  80400d:	00 00 00 
  804010:	48 8b 00             	mov    (%rax),%rax
  804013:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804019:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80401c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804020:	48 89 c7             	mov    %rax,%rdi
  804023:	48 b8 95 47 80 00 00 	movabs $0x804795,%rax
  80402a:	00 00 00 
  80402d:	ff d0                	callq  *%rax
  80402f:	89 c3                	mov    %eax,%ebx
  804031:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804035:	48 89 c7             	mov    %rax,%rdi
  804038:	48 b8 95 47 80 00 00 	movabs $0x804795,%rax
  80403f:	00 00 00 
  804042:	ff d0                	callq  *%rax
  804044:	39 c3                	cmp    %eax,%ebx
  804046:	0f 94 c0             	sete   %al
  804049:	0f b6 c0             	movzbl %al,%eax
  80404c:	89 45 e8             	mov    %eax,-0x18(%rbp)
  80404f:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804056:	00 00 00 
  804059:	48 8b 00             	mov    (%rax),%rax
  80405c:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804062:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804065:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804068:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80406b:	75 05                	jne    804072 <_pipeisclosed+0x7d>
  80406d:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804070:	eb 4a                	jmp    8040bc <_pipeisclosed+0xc7>
  804072:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804075:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804078:	74 8c                	je     804006 <_pipeisclosed+0x11>
  80407a:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80407e:	75 86                	jne    804006 <_pipeisclosed+0x11>
  804080:	48 b8 08 80 80 00 00 	movabs $0x808008,%rax
  804087:	00 00 00 
  80408a:	48 8b 00             	mov    (%rax),%rax
  80408d:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804093:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804096:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804099:	89 c6                	mov    %eax,%esi
  80409b:	48 bf 63 50 80 00 00 	movabs $0x805063,%rdi
  8040a2:	00 00 00 
  8040a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8040aa:	49 b8 ae 04 80 00 00 	movabs $0x8004ae,%r8
  8040b1:	00 00 00 
  8040b4:	41 ff d0             	callq  *%r8
  8040b7:	e9 4a ff ff ff       	jmpq   804006 <_pipeisclosed+0x11>
  8040bc:	48 83 c4 28          	add    $0x28,%rsp
  8040c0:	5b                   	pop    %rbx
  8040c1:	5d                   	pop    %rbp
  8040c2:	c3                   	retq   

00000000008040c3 <pipeisclosed>:
  8040c3:	55                   	push   %rbp
  8040c4:	48 89 e5             	mov    %rsp,%rbp
  8040c7:	48 83 ec 30          	sub    $0x30,%rsp
  8040cb:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8040ce:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8040d2:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8040d5:	48 89 d6             	mov    %rdx,%rsi
  8040d8:	89 c7                	mov    %eax,%edi
  8040da:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  8040e1:	00 00 00 
  8040e4:	ff d0                	callq  *%rax
  8040e6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040e9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040ed:	79 05                	jns    8040f4 <pipeisclosed+0x31>
  8040ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040f2:	eb 31                	jmp    804125 <pipeisclosed+0x62>
  8040f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8040f8:	48 89 c7             	mov    %rax,%rdi
  8040fb:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  804102:	00 00 00 
  804105:	ff d0                	callq  *%rax
  804107:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80410b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80410f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804113:	48 89 d6             	mov    %rdx,%rsi
  804116:	48 89 c7             	mov    %rax,%rdi
  804119:	48 b8 f5 3f 80 00 00 	movabs $0x803ff5,%rax
  804120:	00 00 00 
  804123:	ff d0                	callq  *%rax
  804125:	c9                   	leaveq 
  804126:	c3                   	retq   

0000000000804127 <devpipe_read>:
  804127:	55                   	push   %rbp
  804128:	48 89 e5             	mov    %rsp,%rbp
  80412b:	48 83 ec 40          	sub    $0x40,%rsp
  80412f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804133:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804137:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80413b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80413f:	48 89 c7             	mov    %rax,%rdi
  804142:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  804149:	00 00 00 
  80414c:	ff d0                	callq  *%rax
  80414e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804152:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804156:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80415a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804161:	00 
  804162:	e9 90 00 00 00       	jmpq   8041f7 <devpipe_read+0xd0>
  804167:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80416c:	74 09                	je     804177 <devpipe_read+0x50>
  80416e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804172:	e9 8e 00 00 00       	jmpq   804205 <devpipe_read+0xde>
  804177:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80417b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80417f:	48 89 d6             	mov    %rdx,%rsi
  804182:	48 89 c7             	mov    %rax,%rdi
  804185:	48 b8 f5 3f 80 00 00 	movabs $0x803ff5,%rax
  80418c:	00 00 00 
  80418f:	ff d0                	callq  *%rax
  804191:	85 c0                	test   %eax,%eax
  804193:	74 07                	je     80419c <devpipe_read+0x75>
  804195:	b8 00 00 00 00       	mov    $0x0,%eax
  80419a:	eb 69                	jmp    804205 <devpipe_read+0xde>
  80419c:	48 b8 31 19 80 00 00 	movabs $0x801931,%rax
  8041a3:	00 00 00 
  8041a6:	ff d0                	callq  *%rax
  8041a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041ac:	8b 10                	mov    (%rax),%edx
  8041ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041b2:	8b 40 04             	mov    0x4(%rax),%eax
  8041b5:	39 c2                	cmp    %eax,%edx
  8041b7:	74 ae                	je     804167 <devpipe_read+0x40>
  8041b9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8041bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041c1:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8041c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041c9:	8b 00                	mov    (%rax),%eax
  8041cb:	99                   	cltd   
  8041cc:	c1 ea 1b             	shr    $0x1b,%edx
  8041cf:	01 d0                	add    %edx,%eax
  8041d1:	83 e0 1f             	and    $0x1f,%eax
  8041d4:	29 d0                	sub    %edx,%eax
  8041d6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8041da:	48 98                	cltq   
  8041dc:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8041e1:	88 01                	mov    %al,(%rcx)
  8041e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041e7:	8b 00                	mov    (%rax),%eax
  8041e9:	8d 50 01             	lea    0x1(%rax),%edx
  8041ec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8041f0:	89 10                	mov    %edx,(%rax)
  8041f2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8041f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041fb:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8041ff:	72 a7                	jb     8041a8 <devpipe_read+0x81>
  804201:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804205:	c9                   	leaveq 
  804206:	c3                   	retq   

0000000000804207 <devpipe_write>:
  804207:	55                   	push   %rbp
  804208:	48 89 e5             	mov    %rsp,%rbp
  80420b:	48 83 ec 40          	sub    $0x40,%rsp
  80420f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804213:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804217:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80421b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80421f:	48 89 c7             	mov    %rax,%rdi
  804222:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  804229:	00 00 00 
  80422c:	ff d0                	callq  *%rax
  80422e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804232:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804236:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80423a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804241:	00 
  804242:	e9 8f 00 00 00       	jmpq   8042d6 <devpipe_write+0xcf>
  804247:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80424b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80424f:	48 89 d6             	mov    %rdx,%rsi
  804252:	48 89 c7             	mov    %rax,%rdi
  804255:	48 b8 f5 3f 80 00 00 	movabs $0x803ff5,%rax
  80425c:	00 00 00 
  80425f:	ff d0                	callq  *%rax
  804261:	85 c0                	test   %eax,%eax
  804263:	74 07                	je     80426c <devpipe_write+0x65>
  804265:	b8 00 00 00 00       	mov    $0x0,%eax
  80426a:	eb 78                	jmp    8042e4 <devpipe_write+0xdd>
  80426c:	48 b8 31 19 80 00 00 	movabs $0x801931,%rax
  804273:	00 00 00 
  804276:	ff d0                	callq  *%rax
  804278:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80427c:	8b 40 04             	mov    0x4(%rax),%eax
  80427f:	48 63 d0             	movslq %eax,%rdx
  804282:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804286:	8b 00                	mov    (%rax),%eax
  804288:	48 98                	cltq   
  80428a:	48 83 c0 20          	add    $0x20,%rax
  80428e:	48 39 c2             	cmp    %rax,%rdx
  804291:	73 b4                	jae    804247 <devpipe_write+0x40>
  804293:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804297:	8b 40 04             	mov    0x4(%rax),%eax
  80429a:	99                   	cltd   
  80429b:	c1 ea 1b             	shr    $0x1b,%edx
  80429e:	01 d0                	add    %edx,%eax
  8042a0:	83 e0 1f             	and    $0x1f,%eax
  8042a3:	29 d0                	sub    %edx,%eax
  8042a5:	89 c6                	mov    %eax,%esi
  8042a7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8042ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042af:	48 01 d0             	add    %rdx,%rax
  8042b2:	0f b6 08             	movzbl (%rax),%ecx
  8042b5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042b9:	48 63 c6             	movslq %esi,%rax
  8042bc:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8042c0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042c4:	8b 40 04             	mov    0x4(%rax),%eax
  8042c7:	8d 50 01             	lea    0x1(%rax),%edx
  8042ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042ce:	89 50 04             	mov    %edx,0x4(%rax)
  8042d1:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8042d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042da:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8042de:	72 98                	jb     804278 <devpipe_write+0x71>
  8042e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042e4:	c9                   	leaveq 
  8042e5:	c3                   	retq   

00000000008042e6 <devpipe_stat>:
  8042e6:	55                   	push   %rbp
  8042e7:	48 89 e5             	mov    %rsp,%rbp
  8042ea:	48 83 ec 20          	sub    $0x20,%rsp
  8042ee:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8042f2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8042f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8042fa:	48 89 c7             	mov    %rax,%rdi
  8042fd:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  804304:	00 00 00 
  804307:	ff d0                	callq  *%rax
  804309:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80430d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804311:	48 be 76 50 80 00 00 	movabs $0x805076,%rsi
  804318:	00 00 00 
  80431b:	48 89 c7             	mov    %rax,%rdi
  80431e:	48 b8 3e 10 80 00 00 	movabs $0x80103e,%rax
  804325:	00 00 00 
  804328:	ff d0                	callq  *%rax
  80432a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80432e:	8b 50 04             	mov    0x4(%rax),%edx
  804331:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804335:	8b 00                	mov    (%rax),%eax
  804337:	29 c2                	sub    %eax,%edx
  804339:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80433d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804343:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804347:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80434e:	00 00 00 
  804351:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804355:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  80435c:	00 00 00 
  80435f:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804366:	b8 00 00 00 00       	mov    $0x0,%eax
  80436b:	c9                   	leaveq 
  80436c:	c3                   	retq   

000000000080436d <devpipe_close>:
  80436d:	55                   	push   %rbp
  80436e:	48 89 e5             	mov    %rsp,%rbp
  804371:	48 83 ec 10          	sub    $0x10,%rsp
  804375:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804379:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80437d:	48 89 c6             	mov    %rax,%rsi
  804380:	bf 00 00 00 00       	mov    $0x0,%edi
  804385:	48 b8 20 1a 80 00 00 	movabs $0x801a20,%rax
  80438c:	00 00 00 
  80438f:	ff d0                	callq  *%rax
  804391:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804395:	48 89 c7             	mov    %rax,%rdi
  804398:	48 b8 e1 25 80 00 00 	movabs $0x8025e1,%rax
  80439f:	00 00 00 
  8043a2:	ff d0                	callq  *%rax
  8043a4:	48 89 c6             	mov    %rax,%rsi
  8043a7:	bf 00 00 00 00       	mov    $0x0,%edi
  8043ac:	48 b8 20 1a 80 00 00 	movabs $0x801a20,%rax
  8043b3:	00 00 00 
  8043b6:	ff d0                	callq  *%rax
  8043b8:	c9                   	leaveq 
  8043b9:	c3                   	retq   

00000000008043ba <cputchar>:
  8043ba:	55                   	push   %rbp
  8043bb:	48 89 e5             	mov    %rsp,%rbp
  8043be:	48 83 ec 20          	sub    $0x20,%rsp
  8043c2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8043c5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8043c8:	88 45 ff             	mov    %al,-0x1(%rbp)
  8043cb:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8043cf:	be 01 00 00 00       	mov    $0x1,%esi
  8043d4:	48 89 c7             	mov    %rax,%rdi
  8043d7:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  8043de:	00 00 00 
  8043e1:	ff d0                	callq  *%rax
  8043e3:	90                   	nop
  8043e4:	c9                   	leaveq 
  8043e5:	c3                   	retq   

00000000008043e6 <getchar>:
  8043e6:	55                   	push   %rbp
  8043e7:	48 89 e5             	mov    %rsp,%rbp
  8043ea:	48 83 ec 10          	sub    $0x10,%rsp
  8043ee:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8043f2:	ba 01 00 00 00       	mov    $0x1,%edx
  8043f7:	48 89 c6             	mov    %rax,%rsi
  8043fa:	bf 00 00 00 00       	mov    $0x0,%edi
  8043ff:	48 b8 d9 2a 80 00 00 	movabs $0x802ad9,%rax
  804406:	00 00 00 
  804409:	ff d0                	callq  *%rax
  80440b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80440e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804412:	79 05                	jns    804419 <getchar+0x33>
  804414:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804417:	eb 14                	jmp    80442d <getchar+0x47>
  804419:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80441d:	7f 07                	jg     804426 <getchar+0x40>
  80441f:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804424:	eb 07                	jmp    80442d <getchar+0x47>
  804426:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  80442a:	0f b6 c0             	movzbl %al,%eax
  80442d:	c9                   	leaveq 
  80442e:	c3                   	retq   

000000000080442f <iscons>:
  80442f:	55                   	push   %rbp
  804430:	48 89 e5             	mov    %rsp,%rbp
  804433:	48 83 ec 20          	sub    $0x20,%rsp
  804437:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80443a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80443e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804441:	48 89 d6             	mov    %rdx,%rsi
  804444:	89 c7                	mov    %eax,%edi
  804446:	48 b8 a4 26 80 00 00 	movabs $0x8026a4,%rax
  80444d:	00 00 00 
  804450:	ff d0                	callq  *%rax
  804452:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804455:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804459:	79 05                	jns    804460 <iscons+0x31>
  80445b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80445e:	eb 1a                	jmp    80447a <iscons+0x4b>
  804460:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804464:	8b 10                	mov    (%rax),%edx
  804466:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  80446d:	00 00 00 
  804470:	8b 00                	mov    (%rax),%eax
  804472:	39 c2                	cmp    %eax,%edx
  804474:	0f 94 c0             	sete   %al
  804477:	0f b6 c0             	movzbl %al,%eax
  80447a:	c9                   	leaveq 
  80447b:	c3                   	retq   

000000000080447c <opencons>:
  80447c:	55                   	push   %rbp
  80447d:	48 89 e5             	mov    %rsp,%rbp
  804480:	48 83 ec 10          	sub    $0x10,%rsp
  804484:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804488:	48 89 c7             	mov    %rax,%rdi
  80448b:	48 b8 0c 26 80 00 00 	movabs $0x80260c,%rax
  804492:	00 00 00 
  804495:	ff d0                	callq  *%rax
  804497:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80449a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80449e:	79 05                	jns    8044a5 <opencons+0x29>
  8044a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044a3:	eb 5b                	jmp    804500 <opencons+0x84>
  8044a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044a9:	ba 07 04 00 00       	mov    $0x407,%edx
  8044ae:	48 89 c6             	mov    %rax,%rsi
  8044b1:	bf 00 00 00 00       	mov    $0x0,%edi
  8044b6:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  8044bd:	00 00 00 
  8044c0:	ff d0                	callq  *%rax
  8044c2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044c5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044c9:	79 05                	jns    8044d0 <opencons+0x54>
  8044cb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044ce:	eb 30                	jmp    804500 <opencons+0x84>
  8044d0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044d4:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8044db:	00 00 00 
  8044de:	8b 12                	mov    (%rdx),%edx
  8044e0:	89 10                	mov    %edx,(%rax)
  8044e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044e6:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8044ed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8044f1:	48 89 c7             	mov    %rax,%rdi
  8044f4:	48 b8 be 25 80 00 00 	movabs $0x8025be,%rax
  8044fb:	00 00 00 
  8044fe:	ff d0                	callq  *%rax
  804500:	c9                   	leaveq 
  804501:	c3                   	retq   

0000000000804502 <devcons_read>:
  804502:	55                   	push   %rbp
  804503:	48 89 e5             	mov    %rsp,%rbp
  804506:	48 83 ec 30          	sub    $0x30,%rsp
  80450a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80450e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804512:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804516:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80451b:	75 13                	jne    804530 <devcons_read+0x2e>
  80451d:	b8 00 00 00 00       	mov    $0x0,%eax
  804522:	eb 49                	jmp    80456d <devcons_read+0x6b>
  804524:	48 b8 31 19 80 00 00 	movabs $0x801931,%rax
  80452b:	00 00 00 
  80452e:	ff d0                	callq  *%rax
  804530:	48 b8 73 18 80 00 00 	movabs $0x801873,%rax
  804537:	00 00 00 
  80453a:	ff d0                	callq  *%rax
  80453c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80453f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804543:	74 df                	je     804524 <devcons_read+0x22>
  804545:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804549:	79 05                	jns    804550 <devcons_read+0x4e>
  80454b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80454e:	eb 1d                	jmp    80456d <devcons_read+0x6b>
  804550:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804554:	75 07                	jne    80455d <devcons_read+0x5b>
  804556:	b8 00 00 00 00       	mov    $0x0,%eax
  80455b:	eb 10                	jmp    80456d <devcons_read+0x6b>
  80455d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804560:	89 c2                	mov    %eax,%edx
  804562:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804566:	88 10                	mov    %dl,(%rax)
  804568:	b8 01 00 00 00       	mov    $0x1,%eax
  80456d:	c9                   	leaveq 
  80456e:	c3                   	retq   

000000000080456f <devcons_write>:
  80456f:	55                   	push   %rbp
  804570:	48 89 e5             	mov    %rsp,%rbp
  804573:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80457a:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804581:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804588:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  80458f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804596:	eb 76                	jmp    80460e <devcons_write+0x9f>
  804598:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80459f:	89 c2                	mov    %eax,%edx
  8045a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045a4:	29 c2                	sub    %eax,%edx
  8045a6:	89 d0                	mov    %edx,%eax
  8045a8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8045ab:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045ae:	83 f8 7f             	cmp    $0x7f,%eax
  8045b1:	76 07                	jbe    8045ba <devcons_write+0x4b>
  8045b3:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8045ba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045bd:	48 63 d0             	movslq %eax,%rdx
  8045c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045c3:	48 63 c8             	movslq %eax,%rcx
  8045c6:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8045cd:	48 01 c1             	add    %rax,%rcx
  8045d0:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8045d7:	48 89 ce             	mov    %rcx,%rsi
  8045da:	48 89 c7             	mov    %rax,%rdi
  8045dd:	48 b8 63 13 80 00 00 	movabs $0x801363,%rax
  8045e4:	00 00 00 
  8045e7:	ff d0                	callq  *%rax
  8045e9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8045ec:	48 63 d0             	movslq %eax,%rdx
  8045ef:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8045f6:	48 89 d6             	mov    %rdx,%rsi
  8045f9:	48 89 c7             	mov    %rax,%rdi
  8045fc:	48 b8 26 18 80 00 00 	movabs $0x801826,%rax
  804603:	00 00 00 
  804606:	ff d0                	callq  *%rax
  804608:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80460b:	01 45 fc             	add    %eax,-0x4(%rbp)
  80460e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804611:	48 98                	cltq   
  804613:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80461a:	0f 82 78 ff ff ff    	jb     804598 <devcons_write+0x29>
  804620:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804623:	c9                   	leaveq 
  804624:	c3                   	retq   

0000000000804625 <devcons_close>:
  804625:	55                   	push   %rbp
  804626:	48 89 e5             	mov    %rsp,%rbp
  804629:	48 83 ec 08          	sub    $0x8,%rsp
  80462d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804631:	b8 00 00 00 00       	mov    $0x0,%eax
  804636:	c9                   	leaveq 
  804637:	c3                   	retq   

0000000000804638 <devcons_stat>:
  804638:	55                   	push   %rbp
  804639:	48 89 e5             	mov    %rsp,%rbp
  80463c:	48 83 ec 10          	sub    $0x10,%rsp
  804640:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804644:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804648:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80464c:	48 be 82 50 80 00 00 	movabs $0x805082,%rsi
  804653:	00 00 00 
  804656:	48 89 c7             	mov    %rax,%rdi
  804659:	48 b8 3e 10 80 00 00 	movabs $0x80103e,%rax
  804660:	00 00 00 
  804663:	ff d0                	callq  *%rax
  804665:	b8 00 00 00 00       	mov    $0x0,%eax
  80466a:	c9                   	leaveq 
  80466b:	c3                   	retq   

000000000080466c <set_pgfault_handler>:
  80466c:	55                   	push   %rbp
  80466d:	48 89 e5             	mov    %rsp,%rbp
  804670:	48 83 ec 20          	sub    $0x20,%rsp
  804674:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804678:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80467f:	00 00 00 
  804682:	48 8b 00             	mov    (%rax),%rax
  804685:	48 85 c0             	test   %rax,%rax
  804688:	75 6f                	jne    8046f9 <set_pgfault_handler+0x8d>
  80468a:	ba 07 00 00 00       	mov    $0x7,%edx
  80468f:	be 00 f0 7f ef       	mov    $0xef7ff000,%esi
  804694:	bf 00 00 00 00       	mov    $0x0,%edi
  804699:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  8046a0:	00 00 00 
  8046a3:	ff d0                	callq  *%rax
  8046a5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8046a8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8046ac:	79 30                	jns    8046de <set_pgfault_handler+0x72>
  8046ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046b1:	89 c1                	mov    %eax,%ecx
  8046b3:	48 ba 90 50 80 00 00 	movabs $0x805090,%rdx
  8046ba:	00 00 00 
  8046bd:	be 22 00 00 00       	mov    $0x22,%esi
  8046c2:	48 bf af 50 80 00 00 	movabs $0x8050af,%rdi
  8046c9:	00 00 00 
  8046cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8046d1:	49 b8 74 02 80 00 00 	movabs $0x800274,%r8
  8046d8:	00 00 00 
  8046db:	41 ff d0             	callq  *%r8
  8046de:	48 be 0d 47 80 00 00 	movabs $0x80470d,%rsi
  8046e5:	00 00 00 
  8046e8:	bf 00 00 00 00       	mov    $0x0,%edi
  8046ed:	48 b8 05 1b 80 00 00 	movabs $0x801b05,%rax
  8046f4:	00 00 00 
  8046f7:	ff d0                	callq  *%rax
  8046f9:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  804700:	00 00 00 
  804703:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804707:	48 89 10             	mov    %rdx,(%rax)
  80470a:	90                   	nop
  80470b:	c9                   	leaveq 
  80470c:	c3                   	retq   

000000000080470d <_pgfault_upcall>:
.globl _pgfault_upcall
_pgfault_upcall:
// Call the C page fault handler.
// function argument: pointer to UTF

movq  %rsp,%rdi                // passing the function argument in rdi
  80470d:	48 89 e7             	mov    %rsp,%rdi
movabs _pgfault_handler, %rax
  804710:	48 a1 00 c0 80 00 00 	movabs 0x80c000,%rax
  804717:	00 00 00 
call *%rax
  80471a:	ff d0                	callq  *%rax
// registers are available for intermediate calculations.  You
// may find that you have to rearrange your code in non-obvious
// ways as registers become unavailable as scratch space.
//
// LAB 4: Your code here.
subq $8, 152(%rsp)
  80471c:	48 83 ac 24 98 00 00 	subq   $0x8,0x98(%rsp)
  804723:	00 08 
    movq 152(%rsp), %rax
  804725:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  80472c:	00 
    movq 136(%rsp), %rbx
  80472d:	48 8b 9c 24 88 00 00 	mov    0x88(%rsp),%rbx
  804734:	00 
movq %rbx, (%rax)
  804735:	48 89 18             	mov    %rbx,(%rax)

    // Restore the trap-time registers.  After you do this, you
    // can no longer modify any general-purpose registers.
    // LAB 4: Your code here.
    addq $16, %rsp
  804738:	48 83 c4 10          	add    $0x10,%rsp
    POPA_
  80473c:	4c 8b 3c 24          	mov    (%rsp),%r15
  804740:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
  804745:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
  80474a:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  80474f:	4c 8b 5c 24 20       	mov    0x20(%rsp),%r11
  804754:	4c 8b 54 24 28       	mov    0x28(%rsp),%r10
  804759:	4c 8b 4c 24 30       	mov    0x30(%rsp),%r9
  80475e:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
  804763:	48 8b 74 24 40       	mov    0x40(%rsp),%rsi
  804768:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
  80476d:	48 8b 6c 24 50       	mov    0x50(%rsp),%rbp
  804772:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
  804777:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
  80477c:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
  804781:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
  804786:	48 83 c4 78          	add    $0x78,%rsp

    // Restore eflags from the stack.  After you do this, you can
    // no longer use arithmetic operations or anything else that
    // modifies eflags.
    // LAB 4: Your code here.
pushq 8(%rsp)
  80478a:	ff 74 24 08          	pushq  0x8(%rsp)
    popfq
  80478e:	9d                   	popfq  

    // Switch back to the adjusted trap-time stack.
    // LAB 4: Your code here.
    movq 16(%rsp), %rsp
  80478f:	48 8b 64 24 10       	mov    0x10(%rsp),%rsp

    // Return to re-execute the instruction that faulted.
    // LAB 4: Your code here.
    retq
  804794:	c3                   	retq   

0000000000804795 <pageref>:
  804795:	55                   	push   %rbp
  804796:	48 89 e5             	mov    %rsp,%rbp
  804799:	48 83 ec 18          	sub    $0x18,%rsp
  80479d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8047a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047a5:	48 c1 e8 15          	shr    $0x15,%rax
  8047a9:	48 89 c2             	mov    %rax,%rdx
  8047ac:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8047b3:	01 00 00 
  8047b6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8047ba:	83 e0 01             	and    $0x1,%eax
  8047bd:	48 85 c0             	test   %rax,%rax
  8047c0:	75 07                	jne    8047c9 <pageref+0x34>
  8047c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8047c7:	eb 56                	jmp    80481f <pageref+0x8a>
  8047c9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047cd:	48 c1 e8 0c          	shr    $0xc,%rax
  8047d1:	48 89 c2             	mov    %rax,%rdx
  8047d4:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8047db:	01 00 00 
  8047de:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8047e2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8047e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047ea:	83 e0 01             	and    $0x1,%eax
  8047ed:	48 85 c0             	test   %rax,%rax
  8047f0:	75 07                	jne    8047f9 <pageref+0x64>
  8047f2:	b8 00 00 00 00       	mov    $0x0,%eax
  8047f7:	eb 26                	jmp    80481f <pageref+0x8a>
  8047f9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8047fd:	48 c1 e8 0c          	shr    $0xc,%rax
  804801:	48 89 c2             	mov    %rax,%rdx
  804804:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80480b:	00 00 00 
  80480e:	48 c1 e2 04          	shl    $0x4,%rdx
  804812:	48 01 d0             	add    %rdx,%rax
  804815:	48 83 c0 08          	add    $0x8,%rax
  804819:	0f b7 00             	movzwl (%rax),%eax
  80481c:	0f b7 c0             	movzwl %ax,%eax
  80481f:	c9                   	leaveq 
  804820:	c3                   	retq   
