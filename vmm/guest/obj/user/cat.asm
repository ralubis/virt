
vmm/guest/obj/user/cat:     file format elf64-x86-64


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
  80003c:	e8 04 02 00 00       	callq  800245 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <cat>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80004e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800052:	eb 68                	jmp    8000bc <cat+0x79>
  800054:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800058:	48 89 c2             	mov    %rax,%rdx
  80005b:	48 be 20 70 80 00 00 	movabs $0x807020,%rsi
  800062:	00 00 00 
  800065:	bf 01 00 00 00       	mov    $0x1,%edi
  80006a:	48 b8 49 24 80 00 00 	movabs $0x802449,%rax
  800071:	00 00 00 
  800074:	ff d0                	callq  *%rax
  800076:	89 45 f4             	mov    %eax,-0xc(%rbp)
  800079:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80007c:	48 98                	cltq   
  80007e:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  800082:	74 38                	je     8000bc <cat+0x79>
  800084:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800087:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80008b:	41 89 d0             	mov    %edx,%r8d
  80008e:	48 89 c1             	mov    %rax,%rcx
  800091:	48 ba 60 44 80 00 00 	movabs $0x804460,%rdx
  800098:	00 00 00 
  80009b:	be 0e 00 00 00       	mov    $0xe,%esi
  8000a0:	48 bf 7b 44 80 00 00 	movabs $0x80447b,%rdi
  8000a7:	00 00 00 
  8000aa:	b8 00 00 00 00       	mov    $0x0,%eax
  8000af:	49 b9 ed 02 80 00 00 	movabs $0x8002ed,%r9
  8000b6:	00 00 00 
  8000b9:	41 ff d1             	callq  *%r9
  8000bc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8000bf:	ba 00 20 00 00       	mov    $0x2000,%edx
  8000c4:	48 be 20 70 80 00 00 	movabs $0x807020,%rsi
  8000cb:	00 00 00 
  8000ce:	89 c7                	mov    %eax,%edi
  8000d0:	48 b8 fe 22 80 00 00 	movabs $0x8022fe,%rax
  8000d7:	00 00 00 
  8000da:	ff d0                	callq  *%rax
  8000dc:	48 98                	cltq   
  8000de:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8000e2:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8000e7:	0f 8f 67 ff ff ff    	jg     800054 <cat+0x11>
  8000ed:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8000f2:	79 39                	jns    80012d <cat+0xea>
  8000f4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8000f8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8000fc:	49 89 d0             	mov    %rdx,%r8
  8000ff:	48 89 c1             	mov    %rax,%rcx
  800102:	48 ba 89 44 80 00 00 	movabs $0x804489,%rdx
  800109:	00 00 00 
  80010c:	be 10 00 00 00       	mov    $0x10,%esi
  800111:	48 bf 7b 44 80 00 00 	movabs $0x80447b,%rdi
  800118:	00 00 00 
  80011b:	b8 00 00 00 00       	mov    $0x0,%eax
  800120:	49 b9 ed 02 80 00 00 	movabs $0x8002ed,%r9
  800127:	00 00 00 
  80012a:	41 ff d1             	callq  *%r9
  80012d:	90                   	nop
  80012e:	c9                   	leaveq 
  80012f:	c3                   	retq   

0000000000800130 <umain>:
  800130:	55                   	push   %rbp
  800131:	48 89 e5             	mov    %rsp,%rbp
  800134:	48 83 ec 20          	sub    $0x20,%rsp
  800138:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80013b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80013f:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800146:	00 00 00 
  800149:	48 b9 9e 44 80 00 00 	movabs $0x80449e,%rcx
  800150:	00 00 00 
  800153:	48 89 08             	mov    %rcx,(%rax)
  800156:	83 7d ec 01          	cmpl   $0x1,-0x14(%rbp)
  80015a:	75 20                	jne    80017c <umain+0x4c>
  80015c:	48 be a2 44 80 00 00 	movabs $0x8044a2,%rsi
  800163:	00 00 00 
  800166:	bf 00 00 00 00       	mov    $0x0,%edi
  80016b:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800172:	00 00 00 
  800175:	ff d0                	callq  *%rax
  800177:	e9 c6 00 00 00       	jmpq   800242 <umain+0x112>
  80017c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  800183:	e9 ae 00 00 00       	jmpq   800236 <umain+0x106>
  800188:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80018b:	48 98                	cltq   
  80018d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800194:	00 
  800195:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800199:	48 01 d0             	add    %rdx,%rax
  80019c:	48 8b 00             	mov    (%rax),%rax
  80019f:	be 00 00 00 00       	mov    $0x0,%esi
  8001a4:	48 89 c7             	mov    %rax,%rdi
  8001a7:	48 b8 d7 27 80 00 00 	movabs $0x8027d7,%rax
  8001ae:	00 00 00 
  8001b1:	ff d0                	callq  *%rax
  8001b3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8001b6:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8001ba:	79 3a                	jns    8001f6 <umain+0xc6>
  8001bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001bf:	48 98                	cltq   
  8001c1:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8001c8:	00 
  8001c9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8001cd:	48 01 d0             	add    %rdx,%rax
  8001d0:	48 8b 00             	mov    (%rax),%rax
  8001d3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8001d6:	48 89 c6             	mov    %rax,%rsi
  8001d9:	48 bf aa 44 80 00 00 	movabs $0x8044aa,%rdi
  8001e0:	00 00 00 
  8001e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8001e8:	48 b9 66 30 80 00 00 	movabs $0x803066,%rcx
  8001ef:	00 00 00 
  8001f2:	ff d1                	callq  *%rcx
  8001f4:	eb 3c                	jmp    800232 <umain+0x102>
  8001f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001f9:	48 98                	cltq   
  8001fb:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800202:	00 
  800203:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800207:	48 01 d0             	add    %rdx,%rax
  80020a:	48 8b 10             	mov    (%rax),%rdx
  80020d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800210:	48 89 d6             	mov    %rdx,%rsi
  800213:	89 c7                	mov    %eax,%edi
  800215:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  80021c:	00 00 00 
  80021f:	ff d0                	callq  *%rax
  800221:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800224:	89 c7                	mov    %eax,%edi
  800226:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  80022d:	00 00 00 
  800230:	ff d0                	callq  *%rax
  800232:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800236:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800239:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80023c:	0f 8c 46 ff ff ff    	jl     800188 <umain+0x58>
  800242:	90                   	nop
  800243:	c9                   	leaveq 
  800244:	c3                   	retq   

0000000000800245 <libmain>:
  800245:	55                   	push   %rbp
  800246:	48 89 e5             	mov    %rsp,%rbp
  800249:	48 83 ec 10          	sub    $0x10,%rsp
  80024d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800250:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800254:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  80025b:	00 00 00 
  80025e:	ff d0                	callq  *%rax
  800260:	25 ff 03 00 00       	and    $0x3ff,%eax
  800265:	48 98                	cltq   
  800267:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  80026e:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  800275:	00 00 00 
  800278:	48 01 c2             	add    %rax,%rdx
  80027b:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  800282:	00 00 00 
  800285:	48 89 10             	mov    %rdx,(%rax)
  800288:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80028c:	7e 14                	jle    8002a2 <libmain+0x5d>
  80028e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800292:	48 8b 10             	mov    (%rax),%rdx
  800295:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80029c:	00 00 00 
  80029f:	48 89 10             	mov    %rdx,(%rax)
  8002a2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002a9:	48 89 d6             	mov    %rdx,%rsi
  8002ac:	89 c7                	mov    %eax,%edi
  8002ae:	48 b8 30 01 80 00 00 	movabs $0x800130,%rax
  8002b5:	00 00 00 
  8002b8:	ff d0                	callq  *%rax
  8002ba:	48 b8 c9 02 80 00 00 	movabs $0x8002c9,%rax
  8002c1:	00 00 00 
  8002c4:	ff d0                	callq  *%rax
  8002c6:	90                   	nop
  8002c7:	c9                   	leaveq 
  8002c8:	c3                   	retq   

00000000008002c9 <exit>:
  8002c9:	55                   	push   %rbp
  8002ca:	48 89 e5             	mov    %rsp,%rbp
  8002cd:	48 b8 26 21 80 00 00 	movabs $0x802126,%rax
  8002d4:	00 00 00 
  8002d7:	ff d0                	callq  *%rax
  8002d9:	bf 00 00 00 00       	mov    $0x0,%edi
  8002de:	48 b8 28 19 80 00 00 	movabs $0x801928,%rax
  8002e5:	00 00 00 
  8002e8:	ff d0                	callq  *%rax
  8002ea:	90                   	nop
  8002eb:	5d                   	pop    %rbp
  8002ec:	c3                   	retq   

00000000008002ed <_panic>:
  8002ed:	55                   	push   %rbp
  8002ee:	48 89 e5             	mov    %rsp,%rbp
  8002f1:	53                   	push   %rbx
  8002f2:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8002f9:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800300:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  800306:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  80030d:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800314:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80031b:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800322:	84 c0                	test   %al,%al
  800324:	74 23                	je     800349 <_panic+0x5c>
  800326:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  80032d:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800331:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  800335:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800339:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  80033d:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800341:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  800345:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800349:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800350:	00 00 00 
  800353:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80035a:	00 00 00 
  80035d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800361:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  800368:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  80036f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800376:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80037d:	00 00 00 
  800380:	48 8b 18             	mov    (%rax),%rbx
  800383:	48 b8 6e 19 80 00 00 	movabs $0x80196e,%rax
  80038a:	00 00 00 
  80038d:	ff d0                	callq  *%rax
  80038f:	89 c6                	mov    %eax,%esi
  800391:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  800397:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80039e:	41 89 d0             	mov    %edx,%r8d
  8003a1:	48 89 c1             	mov    %rax,%rcx
  8003a4:	48 89 da             	mov    %rbx,%rdx
  8003a7:	48 bf c8 44 80 00 00 	movabs $0x8044c8,%rdi
  8003ae:	00 00 00 
  8003b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8003b6:	49 b9 27 05 80 00 00 	movabs $0x800527,%r9
  8003bd:	00 00 00 
  8003c0:	41 ff d1             	callq  *%r9
  8003c3:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8003ca:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8003d1:	48 89 d6             	mov    %rdx,%rsi
  8003d4:	48 89 c7             	mov    %rax,%rdi
  8003d7:	48 b8 7b 04 80 00 00 	movabs $0x80047b,%rax
  8003de:	00 00 00 
  8003e1:	ff d0                	callq  *%rax
  8003e3:	48 bf eb 44 80 00 00 	movabs $0x8044eb,%rdi
  8003ea:	00 00 00 
  8003ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8003f2:	48 ba 27 05 80 00 00 	movabs $0x800527,%rdx
  8003f9:	00 00 00 
  8003fc:	ff d2                	callq  *%rdx
  8003fe:	cc                   	int3   
  8003ff:	eb fd                	jmp    8003fe <_panic+0x111>

0000000000800401 <putch>:
  800401:	55                   	push   %rbp
  800402:	48 89 e5             	mov    %rsp,%rbp
  800405:	48 83 ec 10          	sub    $0x10,%rsp
  800409:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80040c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800410:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800414:	8b 00                	mov    (%rax),%eax
  800416:	8d 48 01             	lea    0x1(%rax),%ecx
  800419:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80041d:	89 0a                	mov    %ecx,(%rdx)
  80041f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800422:	89 d1                	mov    %edx,%ecx
  800424:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800428:	48 98                	cltq   
  80042a:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80042e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800432:	8b 00                	mov    (%rax),%eax
  800434:	3d ff 00 00 00       	cmp    $0xff,%eax
  800439:	75 2c                	jne    800467 <putch+0x66>
  80043b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80043f:	8b 00                	mov    (%rax),%eax
  800441:	48 98                	cltq   
  800443:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800447:	48 83 c2 08          	add    $0x8,%rdx
  80044b:	48 89 c6             	mov    %rax,%rsi
  80044e:	48 89 d7             	mov    %rdx,%rdi
  800451:	48 b8 9f 18 80 00 00 	movabs $0x80189f,%rax
  800458:	00 00 00 
  80045b:	ff d0                	callq  *%rax
  80045d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800461:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  800467:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80046b:	8b 40 04             	mov    0x4(%rax),%eax
  80046e:	8d 50 01             	lea    0x1(%rax),%edx
  800471:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800475:	89 50 04             	mov    %edx,0x4(%rax)
  800478:	90                   	nop
  800479:	c9                   	leaveq 
  80047a:	c3                   	retq   

000000000080047b <vcprintf>:
  80047b:	55                   	push   %rbp
  80047c:	48 89 e5             	mov    %rsp,%rbp
  80047f:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800486:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  80048d:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800494:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80049b:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8004a2:	48 8b 0a             	mov    (%rdx),%rcx
  8004a5:	48 89 08             	mov    %rcx,(%rax)
  8004a8:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8004ac:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8004b0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8004b4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8004b8:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  8004bf:	00 00 00 
  8004c2:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8004c9:	00 00 00 
  8004cc:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8004d3:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8004da:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8004e1:	48 89 c6             	mov    %rax,%rsi
  8004e4:	48 bf 01 04 80 00 00 	movabs $0x800401,%rdi
  8004eb:	00 00 00 
  8004ee:	48 b8 c5 08 80 00 00 	movabs $0x8008c5,%rax
  8004f5:	00 00 00 
  8004f8:	ff d0                	callq  *%rax
  8004fa:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800500:	48 98                	cltq   
  800502:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800509:	48 83 c2 08          	add    $0x8,%rdx
  80050d:	48 89 c6             	mov    %rax,%rsi
  800510:	48 89 d7             	mov    %rdx,%rdi
  800513:	48 b8 9f 18 80 00 00 	movabs $0x80189f,%rax
  80051a:	00 00 00 
  80051d:	ff d0                	callq  *%rax
  80051f:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800525:	c9                   	leaveq 
  800526:	c3                   	retq   

0000000000800527 <cprintf>:
  800527:	55                   	push   %rbp
  800528:	48 89 e5             	mov    %rsp,%rbp
  80052b:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800532:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800539:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800540:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  800547:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80054e:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800555:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80055c:	84 c0                	test   %al,%al
  80055e:	74 20                	je     800580 <cprintf+0x59>
  800560:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800564:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800568:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80056c:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800570:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800574:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800578:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80057c:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800580:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  800587:	00 00 00 
  80058a:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800591:	00 00 00 
  800594:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800598:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80059f:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8005a6:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8005ad:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8005b4:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8005bb:	48 8b 0a             	mov    (%rdx),%rcx
  8005be:	48 89 08             	mov    %rcx,(%rax)
  8005c1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8005c5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8005c9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8005cd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8005d1:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8005d8:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005df:	48 89 d6             	mov    %rdx,%rsi
  8005e2:	48 89 c7             	mov    %rax,%rdi
  8005e5:	48 b8 7b 04 80 00 00 	movabs $0x80047b,%rax
  8005ec:	00 00 00 
  8005ef:	ff d0                	callq  *%rax
  8005f1:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8005f7:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8005fd:	c9                   	leaveq 
  8005fe:	c3                   	retq   

00000000008005ff <printnum>:
  8005ff:	55                   	push   %rbp
  800600:	48 89 e5             	mov    %rsp,%rbp
  800603:	48 83 ec 30          	sub    $0x30,%rsp
  800607:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80060b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80060f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800613:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  800616:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  80061a:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  80061e:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800621:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800625:	77 54                	ja     80067b <printnum+0x7c>
  800627:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80062a:	8d 78 ff             	lea    -0x1(%rax),%edi
  80062d:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800630:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800634:	ba 00 00 00 00       	mov    $0x0,%edx
  800639:	48 f7 f6             	div    %rsi
  80063c:	49 89 c2             	mov    %rax,%r10
  80063f:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800642:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800645:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800649:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80064d:	41 89 c9             	mov    %ecx,%r9d
  800650:	41 89 f8             	mov    %edi,%r8d
  800653:	89 d1                	mov    %edx,%ecx
  800655:	4c 89 d2             	mov    %r10,%rdx
  800658:	48 89 c7             	mov    %rax,%rdi
  80065b:	48 b8 ff 05 80 00 00 	movabs $0x8005ff,%rax
  800662:	00 00 00 
  800665:	ff d0                	callq  *%rax
  800667:	eb 1c                	jmp    800685 <printnum+0x86>
  800669:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80066d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800670:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800674:	48 89 ce             	mov    %rcx,%rsi
  800677:	89 d7                	mov    %edx,%edi
  800679:	ff d0                	callq  *%rax
  80067b:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  80067f:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800683:	7f e4                	jg     800669 <printnum+0x6a>
  800685:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800688:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80068c:	ba 00 00 00 00       	mov    $0x0,%edx
  800691:	48 f7 f1             	div    %rcx
  800694:	48 b8 f0 46 80 00 00 	movabs $0x8046f0,%rax
  80069b:	00 00 00 
  80069e:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8006a2:	0f be d0             	movsbl %al,%edx
  8006a5:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8006a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8006ad:	48 89 ce             	mov    %rcx,%rsi
  8006b0:	89 d7                	mov    %edx,%edi
  8006b2:	ff d0                	callq  *%rax
  8006b4:	90                   	nop
  8006b5:	c9                   	leaveq 
  8006b6:	c3                   	retq   

00000000008006b7 <getuint>:
  8006b7:	55                   	push   %rbp
  8006b8:	48 89 e5             	mov    %rsp,%rbp
  8006bb:	48 83 ec 20          	sub    $0x20,%rsp
  8006bf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8006c3:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8006c6:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8006ca:	7e 4f                	jle    80071b <getuint+0x64>
  8006cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006d0:	8b 00                	mov    (%rax),%eax
  8006d2:	83 f8 30             	cmp    $0x30,%eax
  8006d5:	73 24                	jae    8006fb <getuint+0x44>
  8006d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006db:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e3:	8b 00                	mov    (%rax),%eax
  8006e5:	89 c0                	mov    %eax,%eax
  8006e7:	48 01 d0             	add    %rdx,%rax
  8006ea:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ee:	8b 12                	mov    (%rdx),%edx
  8006f0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006f3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006f7:	89 0a                	mov    %ecx,(%rdx)
  8006f9:	eb 14                	jmp    80070f <getuint+0x58>
  8006fb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ff:	48 8b 40 08          	mov    0x8(%rax),%rax
  800703:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800707:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80070b:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80070f:	48 8b 00             	mov    (%rax),%rax
  800712:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800716:	e9 9d 00 00 00       	jmpq   8007b8 <getuint+0x101>
  80071b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80071f:	74 4c                	je     80076d <getuint+0xb6>
  800721:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800725:	8b 00                	mov    (%rax),%eax
  800727:	83 f8 30             	cmp    $0x30,%eax
  80072a:	73 24                	jae    800750 <getuint+0x99>
  80072c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800730:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800734:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800738:	8b 00                	mov    (%rax),%eax
  80073a:	89 c0                	mov    %eax,%eax
  80073c:	48 01 d0             	add    %rdx,%rax
  80073f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800743:	8b 12                	mov    (%rdx),%edx
  800745:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800748:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80074c:	89 0a                	mov    %ecx,(%rdx)
  80074e:	eb 14                	jmp    800764 <getuint+0xad>
  800750:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800754:	48 8b 40 08          	mov    0x8(%rax),%rax
  800758:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80075c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800760:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800764:	48 8b 00             	mov    (%rax),%rax
  800767:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80076b:	eb 4b                	jmp    8007b8 <getuint+0x101>
  80076d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800771:	8b 00                	mov    (%rax),%eax
  800773:	83 f8 30             	cmp    $0x30,%eax
  800776:	73 24                	jae    80079c <getuint+0xe5>
  800778:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80077c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800780:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800784:	8b 00                	mov    (%rax),%eax
  800786:	89 c0                	mov    %eax,%eax
  800788:	48 01 d0             	add    %rdx,%rax
  80078b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80078f:	8b 12                	mov    (%rdx),%edx
  800791:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800794:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800798:	89 0a                	mov    %ecx,(%rdx)
  80079a:	eb 14                	jmp    8007b0 <getuint+0xf9>
  80079c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007a0:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007a4:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007a8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007ac:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007b0:	8b 00                	mov    (%rax),%eax
  8007b2:	89 c0                	mov    %eax,%eax
  8007b4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8007bc:	c9                   	leaveq 
  8007bd:	c3                   	retq   

00000000008007be <getint>:
  8007be:	55                   	push   %rbp
  8007bf:	48 89 e5             	mov    %rsp,%rbp
  8007c2:	48 83 ec 20          	sub    $0x20,%rsp
  8007c6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8007ca:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8007cd:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8007d1:	7e 4f                	jle    800822 <getint+0x64>
  8007d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007d7:	8b 00                	mov    (%rax),%eax
  8007d9:	83 f8 30             	cmp    $0x30,%eax
  8007dc:	73 24                	jae    800802 <getint+0x44>
  8007de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007e2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ea:	8b 00                	mov    (%rax),%eax
  8007ec:	89 c0                	mov    %eax,%eax
  8007ee:	48 01 d0             	add    %rdx,%rax
  8007f1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007f5:	8b 12                	mov    (%rdx),%edx
  8007f7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007fa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007fe:	89 0a                	mov    %ecx,(%rdx)
  800800:	eb 14                	jmp    800816 <getint+0x58>
  800802:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800806:	48 8b 40 08          	mov    0x8(%rax),%rax
  80080a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80080e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800812:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800816:	48 8b 00             	mov    (%rax),%rax
  800819:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80081d:	e9 9d 00 00 00       	jmpq   8008bf <getint+0x101>
  800822:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800826:	74 4c                	je     800874 <getint+0xb6>
  800828:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80082c:	8b 00                	mov    (%rax),%eax
  80082e:	83 f8 30             	cmp    $0x30,%eax
  800831:	73 24                	jae    800857 <getint+0x99>
  800833:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800837:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80083b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083f:	8b 00                	mov    (%rax),%eax
  800841:	89 c0                	mov    %eax,%eax
  800843:	48 01 d0             	add    %rdx,%rax
  800846:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80084a:	8b 12                	mov    (%rdx),%edx
  80084c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80084f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800853:	89 0a                	mov    %ecx,(%rdx)
  800855:	eb 14                	jmp    80086b <getint+0xad>
  800857:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80085b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80085f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800863:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800867:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80086b:	48 8b 00             	mov    (%rax),%rax
  80086e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800872:	eb 4b                	jmp    8008bf <getint+0x101>
  800874:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800878:	8b 00                	mov    (%rax),%eax
  80087a:	83 f8 30             	cmp    $0x30,%eax
  80087d:	73 24                	jae    8008a3 <getint+0xe5>
  80087f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800883:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800887:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80088b:	8b 00                	mov    (%rax),%eax
  80088d:	89 c0                	mov    %eax,%eax
  80088f:	48 01 d0             	add    %rdx,%rax
  800892:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800896:	8b 12                	mov    (%rdx),%edx
  800898:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80089b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80089f:	89 0a                	mov    %ecx,(%rdx)
  8008a1:	eb 14                	jmp    8008b7 <getint+0xf9>
  8008a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8008a7:	48 8b 40 08          	mov    0x8(%rax),%rax
  8008ab:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8008af:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8008b3:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8008b7:	8b 00                	mov    (%rax),%eax
  8008b9:	48 98                	cltq   
  8008bb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8008bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8008c3:	c9                   	leaveq 
  8008c4:	c3                   	retq   

00000000008008c5 <vprintfmt>:
  8008c5:	55                   	push   %rbp
  8008c6:	48 89 e5             	mov    %rsp,%rbp
  8008c9:	41 54                	push   %r12
  8008cb:	53                   	push   %rbx
  8008cc:	48 83 ec 60          	sub    $0x60,%rsp
  8008d0:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  8008d4:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  8008d8:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008dc:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8008e0:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8008e4:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8008e8:	48 8b 0a             	mov    (%rdx),%rcx
  8008eb:	48 89 08             	mov    %rcx,(%rax)
  8008ee:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8008f2:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8008f6:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8008fa:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8008fe:	eb 17                	jmp    800917 <vprintfmt+0x52>
  800900:	85 db                	test   %ebx,%ebx
  800902:	0f 84 b9 04 00 00    	je     800dc1 <vprintfmt+0x4fc>
  800908:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80090c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800910:	48 89 d6             	mov    %rdx,%rsi
  800913:	89 df                	mov    %ebx,%edi
  800915:	ff d0                	callq  *%rax
  800917:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80091b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80091f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800923:	0f b6 00             	movzbl (%rax),%eax
  800926:	0f b6 d8             	movzbl %al,%ebx
  800929:	83 fb 25             	cmp    $0x25,%ebx
  80092c:	75 d2                	jne    800900 <vprintfmt+0x3b>
  80092e:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800932:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800939:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800940:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800947:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  80094e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800952:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800956:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80095a:	0f b6 00             	movzbl (%rax),%eax
  80095d:	0f b6 d8             	movzbl %al,%ebx
  800960:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800963:	83 f8 55             	cmp    $0x55,%eax
  800966:	0f 87 22 04 00 00    	ja     800d8e <vprintfmt+0x4c9>
  80096c:	89 c0                	mov    %eax,%eax
  80096e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800975:	00 
  800976:	48 b8 18 47 80 00 00 	movabs $0x804718,%rax
  80097d:	00 00 00 
  800980:	48 01 d0             	add    %rdx,%rax
  800983:	48 8b 00             	mov    (%rax),%rax
  800986:	ff e0                	jmpq   *%rax
  800988:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  80098c:	eb c0                	jmp    80094e <vprintfmt+0x89>
  80098e:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800992:	eb ba                	jmp    80094e <vprintfmt+0x89>
  800994:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  80099b:	8b 55 d8             	mov    -0x28(%rbp),%edx
  80099e:	89 d0                	mov    %edx,%eax
  8009a0:	c1 e0 02             	shl    $0x2,%eax
  8009a3:	01 d0                	add    %edx,%eax
  8009a5:	01 c0                	add    %eax,%eax
  8009a7:	01 d8                	add    %ebx,%eax
  8009a9:	83 e8 30             	sub    $0x30,%eax
  8009ac:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009af:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8009b3:	0f b6 00             	movzbl (%rax),%eax
  8009b6:	0f be d8             	movsbl %al,%ebx
  8009b9:	83 fb 2f             	cmp    $0x2f,%ebx
  8009bc:	7e 60                	jle    800a1e <vprintfmt+0x159>
  8009be:	83 fb 39             	cmp    $0x39,%ebx
  8009c1:	7f 5b                	jg     800a1e <vprintfmt+0x159>
  8009c3:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  8009c8:	eb d1                	jmp    80099b <vprintfmt+0xd6>
  8009ca:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8009cd:	83 f8 30             	cmp    $0x30,%eax
  8009d0:	73 17                	jae    8009e9 <vprintfmt+0x124>
  8009d2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8009d6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009d9:	89 d2                	mov    %edx,%edx
  8009db:	48 01 d0             	add    %rdx,%rax
  8009de:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009e1:	83 c2 08             	add    $0x8,%edx
  8009e4:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009e7:	eb 0c                	jmp    8009f5 <vprintfmt+0x130>
  8009e9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8009ed:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8009f1:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009f5:	8b 00                	mov    (%rax),%eax
  8009f7:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009fa:	eb 23                	jmp    800a1f <vprintfmt+0x15a>
  8009fc:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a00:	0f 89 48 ff ff ff    	jns    80094e <vprintfmt+0x89>
  800a06:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800a0d:	e9 3c ff ff ff       	jmpq   80094e <vprintfmt+0x89>
  800a12:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800a19:	e9 30 ff ff ff       	jmpq   80094e <vprintfmt+0x89>
  800a1e:	90                   	nop
  800a1f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a23:	0f 89 25 ff ff ff    	jns    80094e <vprintfmt+0x89>
  800a29:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800a2c:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800a2f:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800a36:	e9 13 ff ff ff       	jmpq   80094e <vprintfmt+0x89>
  800a3b:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800a3f:	e9 0a ff ff ff       	jmpq   80094e <vprintfmt+0x89>
  800a44:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a47:	83 f8 30             	cmp    $0x30,%eax
  800a4a:	73 17                	jae    800a63 <vprintfmt+0x19e>
  800a4c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a50:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a53:	89 d2                	mov    %edx,%edx
  800a55:	48 01 d0             	add    %rdx,%rax
  800a58:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a5b:	83 c2 08             	add    $0x8,%edx
  800a5e:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a61:	eb 0c                	jmp    800a6f <vprintfmt+0x1aa>
  800a63:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a67:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a6b:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a6f:	8b 10                	mov    (%rax),%edx
  800a71:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a75:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a79:	48 89 ce             	mov    %rcx,%rsi
  800a7c:	89 d7                	mov    %edx,%edi
  800a7e:	ff d0                	callq  *%rax
  800a80:	e9 37 03 00 00       	jmpq   800dbc <vprintfmt+0x4f7>
  800a85:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a88:	83 f8 30             	cmp    $0x30,%eax
  800a8b:	73 17                	jae    800aa4 <vprintfmt+0x1df>
  800a8d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a91:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a94:	89 d2                	mov    %edx,%edx
  800a96:	48 01 d0             	add    %rdx,%rax
  800a99:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a9c:	83 c2 08             	add    $0x8,%edx
  800a9f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800aa2:	eb 0c                	jmp    800ab0 <vprintfmt+0x1eb>
  800aa4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800aa8:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800aac:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ab0:	8b 18                	mov    (%rax),%ebx
  800ab2:	85 db                	test   %ebx,%ebx
  800ab4:	79 02                	jns    800ab8 <vprintfmt+0x1f3>
  800ab6:	f7 db                	neg    %ebx
  800ab8:	83 fb 15             	cmp    $0x15,%ebx
  800abb:	7f 16                	jg     800ad3 <vprintfmt+0x20e>
  800abd:	48 b8 40 46 80 00 00 	movabs $0x804640,%rax
  800ac4:	00 00 00 
  800ac7:	48 63 d3             	movslq %ebx,%rdx
  800aca:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800ace:	4d 85 e4             	test   %r12,%r12
  800ad1:	75 2e                	jne    800b01 <vprintfmt+0x23c>
  800ad3:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ad7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800adb:	89 d9                	mov    %ebx,%ecx
  800add:	48 ba 01 47 80 00 00 	movabs $0x804701,%rdx
  800ae4:	00 00 00 
  800ae7:	48 89 c7             	mov    %rax,%rdi
  800aea:	b8 00 00 00 00       	mov    $0x0,%eax
  800aef:	49 b8 cb 0d 80 00 00 	movabs $0x800dcb,%r8
  800af6:	00 00 00 
  800af9:	41 ff d0             	callq  *%r8
  800afc:	e9 bb 02 00 00       	jmpq   800dbc <vprintfmt+0x4f7>
  800b01:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800b05:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b09:	4c 89 e1             	mov    %r12,%rcx
  800b0c:	48 ba 0a 47 80 00 00 	movabs $0x80470a,%rdx
  800b13:	00 00 00 
  800b16:	48 89 c7             	mov    %rax,%rdi
  800b19:	b8 00 00 00 00       	mov    $0x0,%eax
  800b1e:	49 b8 cb 0d 80 00 00 	movabs $0x800dcb,%r8
  800b25:	00 00 00 
  800b28:	41 ff d0             	callq  *%r8
  800b2b:	e9 8c 02 00 00       	jmpq   800dbc <vprintfmt+0x4f7>
  800b30:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b33:	83 f8 30             	cmp    $0x30,%eax
  800b36:	73 17                	jae    800b4f <vprintfmt+0x28a>
  800b38:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b3c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b3f:	89 d2                	mov    %edx,%edx
  800b41:	48 01 d0             	add    %rdx,%rax
  800b44:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b47:	83 c2 08             	add    $0x8,%edx
  800b4a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b4d:	eb 0c                	jmp    800b5b <vprintfmt+0x296>
  800b4f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b53:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b57:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b5b:	4c 8b 20             	mov    (%rax),%r12
  800b5e:	4d 85 e4             	test   %r12,%r12
  800b61:	75 0a                	jne    800b6d <vprintfmt+0x2a8>
  800b63:	49 bc 0d 47 80 00 00 	movabs $0x80470d,%r12
  800b6a:	00 00 00 
  800b6d:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b71:	7e 78                	jle    800beb <vprintfmt+0x326>
  800b73:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b77:	74 72                	je     800beb <vprintfmt+0x326>
  800b79:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b7c:	48 98                	cltq   
  800b7e:	48 89 c6             	mov    %rax,%rsi
  800b81:	4c 89 e7             	mov    %r12,%rdi
  800b84:	48 b8 79 10 80 00 00 	movabs $0x801079,%rax
  800b8b:	00 00 00 
  800b8e:	ff d0                	callq  *%rax
  800b90:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b93:	eb 17                	jmp    800bac <vprintfmt+0x2e7>
  800b95:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b99:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b9d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ba1:	48 89 ce             	mov    %rcx,%rsi
  800ba4:	89 d7                	mov    %edx,%edi
  800ba6:	ff d0                	callq  *%rax
  800ba8:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bac:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800bb0:	7f e3                	jg     800b95 <vprintfmt+0x2d0>
  800bb2:	eb 37                	jmp    800beb <vprintfmt+0x326>
  800bb4:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800bb8:	74 1e                	je     800bd8 <vprintfmt+0x313>
  800bba:	83 fb 1f             	cmp    $0x1f,%ebx
  800bbd:	7e 05                	jle    800bc4 <vprintfmt+0x2ff>
  800bbf:	83 fb 7e             	cmp    $0x7e,%ebx
  800bc2:	7e 14                	jle    800bd8 <vprintfmt+0x313>
  800bc4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bc8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bcc:	48 89 d6             	mov    %rdx,%rsi
  800bcf:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800bd4:	ff d0                	callq  *%rax
  800bd6:	eb 0f                	jmp    800be7 <vprintfmt+0x322>
  800bd8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bdc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800be0:	48 89 d6             	mov    %rdx,%rsi
  800be3:	89 df                	mov    %ebx,%edi
  800be5:	ff d0                	callq  *%rax
  800be7:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800beb:	4c 89 e0             	mov    %r12,%rax
  800bee:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800bf2:	0f b6 00             	movzbl (%rax),%eax
  800bf5:	0f be d8             	movsbl %al,%ebx
  800bf8:	85 db                	test   %ebx,%ebx
  800bfa:	74 28                	je     800c24 <vprintfmt+0x35f>
  800bfc:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c00:	78 b2                	js     800bb4 <vprintfmt+0x2ef>
  800c02:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800c06:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800c0a:	79 a8                	jns    800bb4 <vprintfmt+0x2ef>
  800c0c:	eb 16                	jmp    800c24 <vprintfmt+0x35f>
  800c0e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c12:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c16:	48 89 d6             	mov    %rdx,%rsi
  800c19:	bf 20 00 00 00       	mov    $0x20,%edi
  800c1e:	ff d0                	callq  *%rax
  800c20:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800c24:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800c28:	7f e4                	jg     800c0e <vprintfmt+0x349>
  800c2a:	e9 8d 01 00 00       	jmpq   800dbc <vprintfmt+0x4f7>
  800c2f:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c33:	be 03 00 00 00       	mov    $0x3,%esi
  800c38:	48 89 c7             	mov    %rax,%rdi
  800c3b:	48 b8 be 07 80 00 00 	movabs $0x8007be,%rax
  800c42:	00 00 00 
  800c45:	ff d0                	callq  *%rax
  800c47:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c4f:	48 85 c0             	test   %rax,%rax
  800c52:	79 1d                	jns    800c71 <vprintfmt+0x3ac>
  800c54:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c58:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c5c:	48 89 d6             	mov    %rdx,%rsi
  800c5f:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c64:	ff d0                	callq  *%rax
  800c66:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c6a:	48 f7 d8             	neg    %rax
  800c6d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c71:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c78:	e9 d2 00 00 00       	jmpq   800d4f <vprintfmt+0x48a>
  800c7d:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c81:	be 03 00 00 00       	mov    $0x3,%esi
  800c86:	48 89 c7             	mov    %rax,%rdi
  800c89:	48 b8 b7 06 80 00 00 	movabs $0x8006b7,%rax
  800c90:	00 00 00 
  800c93:	ff d0                	callq  *%rax
  800c95:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c99:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800ca0:	e9 aa 00 00 00       	jmpq   800d4f <vprintfmt+0x48a>
  800ca5:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800ca9:	be 03 00 00 00       	mov    $0x3,%esi
  800cae:	48 89 c7             	mov    %rax,%rdi
  800cb1:	48 b8 b7 06 80 00 00 	movabs $0x8006b7,%rax
  800cb8:	00 00 00 
  800cbb:	ff d0                	callq  *%rax
  800cbd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800cc1:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800cc8:	e9 82 00 00 00       	jmpq   800d4f <vprintfmt+0x48a>
  800ccd:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800cd1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800cd5:	48 89 d6             	mov    %rdx,%rsi
  800cd8:	bf 30 00 00 00       	mov    $0x30,%edi
  800cdd:	ff d0                	callq  *%rax
  800cdf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ce3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ce7:	48 89 d6             	mov    %rdx,%rsi
  800cea:	bf 78 00 00 00       	mov    $0x78,%edi
  800cef:	ff d0                	callq  *%rax
  800cf1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cf4:	83 f8 30             	cmp    $0x30,%eax
  800cf7:	73 17                	jae    800d10 <vprintfmt+0x44b>
  800cf9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800cfd:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d00:	89 d2                	mov    %edx,%edx
  800d02:	48 01 d0             	add    %rdx,%rax
  800d05:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d08:	83 c2 08             	add    $0x8,%edx
  800d0b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d0e:	eb 0c                	jmp    800d1c <vprintfmt+0x457>
  800d10:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d14:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d18:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d1c:	48 8b 00             	mov    (%rax),%rax
  800d1f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d23:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d2a:	eb 23                	jmp    800d4f <vprintfmt+0x48a>
  800d2c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d30:	be 03 00 00 00       	mov    $0x3,%esi
  800d35:	48 89 c7             	mov    %rax,%rdi
  800d38:	48 b8 b7 06 80 00 00 	movabs $0x8006b7,%rax
  800d3f:	00 00 00 
  800d42:	ff d0                	callq  *%rax
  800d44:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d48:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d4f:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d54:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d57:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d5a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d5e:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d62:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d66:	45 89 c1             	mov    %r8d,%r9d
  800d69:	41 89 f8             	mov    %edi,%r8d
  800d6c:	48 89 c7             	mov    %rax,%rdi
  800d6f:	48 b8 ff 05 80 00 00 	movabs $0x8005ff,%rax
  800d76:	00 00 00 
  800d79:	ff d0                	callq  *%rax
  800d7b:	eb 3f                	jmp    800dbc <vprintfmt+0x4f7>
  800d7d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d81:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d85:	48 89 d6             	mov    %rdx,%rsi
  800d88:	89 df                	mov    %ebx,%edi
  800d8a:	ff d0                	callq  *%rax
  800d8c:	eb 2e                	jmp    800dbc <vprintfmt+0x4f7>
  800d8e:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d92:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d96:	48 89 d6             	mov    %rdx,%rsi
  800d99:	bf 25 00 00 00       	mov    $0x25,%edi
  800d9e:	ff d0                	callq  *%rax
  800da0:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800da5:	eb 05                	jmp    800dac <vprintfmt+0x4e7>
  800da7:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800dac:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800db0:	48 83 e8 01          	sub    $0x1,%rax
  800db4:	0f b6 00             	movzbl (%rax),%eax
  800db7:	3c 25                	cmp    $0x25,%al
  800db9:	75 ec                	jne    800da7 <vprintfmt+0x4e2>
  800dbb:	90                   	nop
  800dbc:	e9 3d fb ff ff       	jmpq   8008fe <vprintfmt+0x39>
  800dc1:	90                   	nop
  800dc2:	48 83 c4 60          	add    $0x60,%rsp
  800dc6:	5b                   	pop    %rbx
  800dc7:	41 5c                	pop    %r12
  800dc9:	5d                   	pop    %rbp
  800dca:	c3                   	retq   

0000000000800dcb <printfmt>:
  800dcb:	55                   	push   %rbp
  800dcc:	48 89 e5             	mov    %rsp,%rbp
  800dcf:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800dd6:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800ddd:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800de4:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800deb:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800df2:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800df9:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e00:	84 c0                	test   %al,%al
  800e02:	74 20                	je     800e24 <printfmt+0x59>
  800e04:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e08:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e0c:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e10:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e14:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e18:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e1c:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e20:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e24:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800e2b:	00 00 00 
  800e2e:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800e35:	00 00 00 
  800e38:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e3c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e43:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e4a:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800e51:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e58:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e5f:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e66:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e6d:	48 89 c7             	mov    %rax,%rdi
  800e70:	48 b8 c5 08 80 00 00 	movabs $0x8008c5,%rax
  800e77:	00 00 00 
  800e7a:	ff d0                	callq  *%rax
  800e7c:	90                   	nop
  800e7d:	c9                   	leaveq 
  800e7e:	c3                   	retq   

0000000000800e7f <sprintputch>:
  800e7f:	55                   	push   %rbp
  800e80:	48 89 e5             	mov    %rsp,%rbp
  800e83:	48 83 ec 10          	sub    $0x10,%rsp
  800e87:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e8a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e92:	8b 40 10             	mov    0x10(%rax),%eax
  800e95:	8d 50 01             	lea    0x1(%rax),%edx
  800e98:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e9c:	89 50 10             	mov    %edx,0x10(%rax)
  800e9f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ea3:	48 8b 10             	mov    (%rax),%rdx
  800ea6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eaa:	48 8b 40 08          	mov    0x8(%rax),%rax
  800eae:	48 39 c2             	cmp    %rax,%rdx
  800eb1:	73 17                	jae    800eca <sprintputch+0x4b>
  800eb3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eb7:	48 8b 00             	mov    (%rax),%rax
  800eba:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800ebe:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800ec2:	48 89 0a             	mov    %rcx,(%rdx)
  800ec5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800ec8:	88 10                	mov    %dl,(%rax)
  800eca:	90                   	nop
  800ecb:	c9                   	leaveq 
  800ecc:	c3                   	retq   

0000000000800ecd <vsnprintf>:
  800ecd:	55                   	push   %rbp
  800ece:	48 89 e5             	mov    %rsp,%rbp
  800ed1:	48 83 ec 50          	sub    $0x50,%rsp
  800ed5:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800ed9:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800edc:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800ee0:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800ee4:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800ee8:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800eec:	48 8b 0a             	mov    (%rdx),%rcx
  800eef:	48 89 08             	mov    %rcx,(%rax)
  800ef2:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800ef6:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800efa:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800efe:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800f02:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f06:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800f0a:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800f0d:	48 98                	cltq   
  800f0f:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800f13:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800f17:	48 01 d0             	add    %rdx,%rax
  800f1a:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800f1e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800f25:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800f2a:	74 06                	je     800f32 <vsnprintf+0x65>
  800f2c:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800f30:	7f 07                	jg     800f39 <vsnprintf+0x6c>
  800f32:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800f37:	eb 2f                	jmp    800f68 <vsnprintf+0x9b>
  800f39:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800f3d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800f41:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800f45:	48 89 c6             	mov    %rax,%rsi
  800f48:	48 bf 7f 0e 80 00 00 	movabs $0x800e7f,%rdi
  800f4f:	00 00 00 
  800f52:	48 b8 c5 08 80 00 00 	movabs $0x8008c5,%rax
  800f59:	00 00 00 
  800f5c:	ff d0                	callq  *%rax
  800f5e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f62:	c6 00 00             	movb   $0x0,(%rax)
  800f65:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f68:	c9                   	leaveq 
  800f69:	c3                   	retq   

0000000000800f6a <snprintf>:
  800f6a:	55                   	push   %rbp
  800f6b:	48 89 e5             	mov    %rsp,%rbp
  800f6e:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f75:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f7c:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f82:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800f89:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f90:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f97:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f9e:	84 c0                	test   %al,%al
  800fa0:	74 20                	je     800fc2 <snprintf+0x58>
  800fa2:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800fa6:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800faa:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800fae:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800fb2:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800fb6:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800fba:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800fbe:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800fc2:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800fc9:	00 00 00 
  800fcc:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800fd3:	00 00 00 
  800fd6:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800fda:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800fe1:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fe8:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fef:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800ff6:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800ffd:	48 8b 0a             	mov    (%rdx),%rcx
  801000:	48 89 08             	mov    %rcx,(%rax)
  801003:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  801007:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80100b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80100f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801013:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80101a:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801021:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  801027:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80102e:	48 89 c7             	mov    %rax,%rdi
  801031:	48 b8 cd 0e 80 00 00 	movabs $0x800ecd,%rax
  801038:	00 00 00 
  80103b:	ff d0                	callq  *%rax
  80103d:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801043:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801049:	c9                   	leaveq 
  80104a:	c3                   	retq   

000000000080104b <strlen>:
  80104b:	55                   	push   %rbp
  80104c:	48 89 e5             	mov    %rsp,%rbp
  80104f:	48 83 ec 18          	sub    $0x18,%rsp
  801053:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801057:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80105e:	eb 09                	jmp    801069 <strlen+0x1e>
  801060:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801064:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801069:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80106d:	0f b6 00             	movzbl (%rax),%eax
  801070:	84 c0                	test   %al,%al
  801072:	75 ec                	jne    801060 <strlen+0x15>
  801074:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801077:	c9                   	leaveq 
  801078:	c3                   	retq   

0000000000801079 <strnlen>:
  801079:	55                   	push   %rbp
  80107a:	48 89 e5             	mov    %rsp,%rbp
  80107d:	48 83 ec 20          	sub    $0x20,%rsp
  801081:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801085:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801089:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801090:	eb 0e                	jmp    8010a0 <strnlen+0x27>
  801092:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801096:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80109b:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  8010a0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8010a5:	74 0b                	je     8010b2 <strnlen+0x39>
  8010a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010ab:	0f b6 00             	movzbl (%rax),%eax
  8010ae:	84 c0                	test   %al,%al
  8010b0:	75 e0                	jne    801092 <strnlen+0x19>
  8010b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010b5:	c9                   	leaveq 
  8010b6:	c3                   	retq   

00000000008010b7 <strcpy>:
  8010b7:	55                   	push   %rbp
  8010b8:	48 89 e5             	mov    %rsp,%rbp
  8010bb:	48 83 ec 20          	sub    $0x20,%rsp
  8010bf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010c3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010cb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8010cf:	90                   	nop
  8010d0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d4:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8010d8:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010dc:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8010e0:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8010e4:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8010e8:	0f b6 12             	movzbl (%rdx),%edx
  8010eb:	88 10                	mov    %dl,(%rax)
  8010ed:	0f b6 00             	movzbl (%rax),%eax
  8010f0:	84 c0                	test   %al,%al
  8010f2:	75 dc                	jne    8010d0 <strcpy+0x19>
  8010f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010f8:	c9                   	leaveq 
  8010f9:	c3                   	retq   

00000000008010fa <strcat>:
  8010fa:	55                   	push   %rbp
  8010fb:	48 89 e5             	mov    %rsp,%rbp
  8010fe:	48 83 ec 20          	sub    $0x20,%rsp
  801102:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801106:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80110a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80110e:	48 89 c7             	mov    %rax,%rdi
  801111:	48 b8 4b 10 80 00 00 	movabs $0x80104b,%rax
  801118:	00 00 00 
  80111b:	ff d0                	callq  *%rax
  80111d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801120:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801123:	48 63 d0             	movslq %eax,%rdx
  801126:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80112a:	48 01 c2             	add    %rax,%rdx
  80112d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801131:	48 89 c6             	mov    %rax,%rsi
  801134:	48 89 d7             	mov    %rdx,%rdi
  801137:	48 b8 b7 10 80 00 00 	movabs $0x8010b7,%rax
  80113e:	00 00 00 
  801141:	ff d0                	callq  *%rax
  801143:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801147:	c9                   	leaveq 
  801148:	c3                   	retq   

0000000000801149 <strncpy>:
  801149:	55                   	push   %rbp
  80114a:	48 89 e5             	mov    %rsp,%rbp
  80114d:	48 83 ec 28          	sub    $0x28,%rsp
  801151:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801155:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801159:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80115d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801161:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801165:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80116c:	00 
  80116d:	eb 2a                	jmp    801199 <strncpy+0x50>
  80116f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801173:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801177:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80117b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80117f:	0f b6 12             	movzbl (%rdx),%edx
  801182:	88 10                	mov    %dl,(%rax)
  801184:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801188:	0f b6 00             	movzbl (%rax),%eax
  80118b:	84 c0                	test   %al,%al
  80118d:	74 05                	je     801194 <strncpy+0x4b>
  80118f:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801194:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801199:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80119d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8011a1:	72 cc                	jb     80116f <strncpy+0x26>
  8011a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011a7:	c9                   	leaveq 
  8011a8:	c3                   	retq   

00000000008011a9 <strlcpy>:
  8011a9:	55                   	push   %rbp
  8011aa:	48 89 e5             	mov    %rsp,%rbp
  8011ad:	48 83 ec 28          	sub    $0x28,%rsp
  8011b1:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8011b5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8011b9:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8011bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8011c5:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011ca:	74 3d                	je     801209 <strlcpy+0x60>
  8011cc:	eb 1d                	jmp    8011eb <strlcpy+0x42>
  8011ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011d2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8011d6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011da:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011de:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011e2:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011e6:	0f b6 12             	movzbl (%rdx),%edx
  8011e9:	88 10                	mov    %dl,(%rax)
  8011eb:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8011f0:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011f5:	74 0b                	je     801202 <strlcpy+0x59>
  8011f7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011fb:	0f b6 00             	movzbl (%rax),%eax
  8011fe:	84 c0                	test   %al,%al
  801200:	75 cc                	jne    8011ce <strlcpy+0x25>
  801202:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801206:	c6 00 00             	movb   $0x0,(%rax)
  801209:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80120d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801211:	48 29 c2             	sub    %rax,%rdx
  801214:	48 89 d0             	mov    %rdx,%rax
  801217:	c9                   	leaveq 
  801218:	c3                   	retq   

0000000000801219 <strcmp>:
  801219:	55                   	push   %rbp
  80121a:	48 89 e5             	mov    %rsp,%rbp
  80121d:	48 83 ec 10          	sub    $0x10,%rsp
  801221:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801225:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801229:	eb 0a                	jmp    801235 <strcmp+0x1c>
  80122b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801230:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801235:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801239:	0f b6 00             	movzbl (%rax),%eax
  80123c:	84 c0                	test   %al,%al
  80123e:	74 12                	je     801252 <strcmp+0x39>
  801240:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801244:	0f b6 10             	movzbl (%rax),%edx
  801247:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80124b:	0f b6 00             	movzbl (%rax),%eax
  80124e:	38 c2                	cmp    %al,%dl
  801250:	74 d9                	je     80122b <strcmp+0x12>
  801252:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801256:	0f b6 00             	movzbl (%rax),%eax
  801259:	0f b6 d0             	movzbl %al,%edx
  80125c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801260:	0f b6 00             	movzbl (%rax),%eax
  801263:	0f b6 c0             	movzbl %al,%eax
  801266:	29 c2                	sub    %eax,%edx
  801268:	89 d0                	mov    %edx,%eax
  80126a:	c9                   	leaveq 
  80126b:	c3                   	retq   

000000000080126c <strncmp>:
  80126c:	55                   	push   %rbp
  80126d:	48 89 e5             	mov    %rsp,%rbp
  801270:	48 83 ec 18          	sub    $0x18,%rsp
  801274:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801278:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80127c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801280:	eb 0f                	jmp    801291 <strncmp+0x25>
  801282:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  801287:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80128c:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801291:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801296:	74 1d                	je     8012b5 <strncmp+0x49>
  801298:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80129c:	0f b6 00             	movzbl (%rax),%eax
  80129f:	84 c0                	test   %al,%al
  8012a1:	74 12                	je     8012b5 <strncmp+0x49>
  8012a3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012a7:	0f b6 10             	movzbl (%rax),%edx
  8012aa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012ae:	0f b6 00             	movzbl (%rax),%eax
  8012b1:	38 c2                	cmp    %al,%dl
  8012b3:	74 cd                	je     801282 <strncmp+0x16>
  8012b5:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8012ba:	75 07                	jne    8012c3 <strncmp+0x57>
  8012bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8012c1:	eb 18                	jmp    8012db <strncmp+0x6f>
  8012c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c7:	0f b6 00             	movzbl (%rax),%eax
  8012ca:	0f b6 d0             	movzbl %al,%edx
  8012cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012d1:	0f b6 00             	movzbl (%rax),%eax
  8012d4:	0f b6 c0             	movzbl %al,%eax
  8012d7:	29 c2                	sub    %eax,%edx
  8012d9:	89 d0                	mov    %edx,%eax
  8012db:	c9                   	leaveq 
  8012dc:	c3                   	retq   

00000000008012dd <strchr>:
  8012dd:	55                   	push   %rbp
  8012de:	48 89 e5             	mov    %rsp,%rbp
  8012e1:	48 83 ec 10          	sub    $0x10,%rsp
  8012e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012e9:	89 f0                	mov    %esi,%eax
  8012eb:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012ee:	eb 17                	jmp    801307 <strchr+0x2a>
  8012f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f4:	0f b6 00             	movzbl (%rax),%eax
  8012f7:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012fa:	75 06                	jne    801302 <strchr+0x25>
  8012fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801300:	eb 15                	jmp    801317 <strchr+0x3a>
  801302:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801307:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80130b:	0f b6 00             	movzbl (%rax),%eax
  80130e:	84 c0                	test   %al,%al
  801310:	75 de                	jne    8012f0 <strchr+0x13>
  801312:	b8 00 00 00 00       	mov    $0x0,%eax
  801317:	c9                   	leaveq 
  801318:	c3                   	retq   

0000000000801319 <strfind>:
  801319:	55                   	push   %rbp
  80131a:	48 89 e5             	mov    %rsp,%rbp
  80131d:	48 83 ec 10          	sub    $0x10,%rsp
  801321:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801325:	89 f0                	mov    %esi,%eax
  801327:	88 45 f4             	mov    %al,-0xc(%rbp)
  80132a:	eb 11                	jmp    80133d <strfind+0x24>
  80132c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801330:	0f b6 00             	movzbl (%rax),%eax
  801333:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801336:	74 12                	je     80134a <strfind+0x31>
  801338:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80133d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801341:	0f b6 00             	movzbl (%rax),%eax
  801344:	84 c0                	test   %al,%al
  801346:	75 e4                	jne    80132c <strfind+0x13>
  801348:	eb 01                	jmp    80134b <strfind+0x32>
  80134a:	90                   	nop
  80134b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80134f:	c9                   	leaveq 
  801350:	c3                   	retq   

0000000000801351 <memset>:
  801351:	55                   	push   %rbp
  801352:	48 89 e5             	mov    %rsp,%rbp
  801355:	48 83 ec 18          	sub    $0x18,%rsp
  801359:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80135d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801360:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801364:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801369:	75 06                	jne    801371 <memset+0x20>
  80136b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80136f:	eb 69                	jmp    8013da <memset+0x89>
  801371:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801375:	83 e0 03             	and    $0x3,%eax
  801378:	48 85 c0             	test   %rax,%rax
  80137b:	75 48                	jne    8013c5 <memset+0x74>
  80137d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801381:	83 e0 03             	and    $0x3,%eax
  801384:	48 85 c0             	test   %rax,%rax
  801387:	75 3c                	jne    8013c5 <memset+0x74>
  801389:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801390:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801393:	c1 e0 18             	shl    $0x18,%eax
  801396:	89 c2                	mov    %eax,%edx
  801398:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80139b:	c1 e0 10             	shl    $0x10,%eax
  80139e:	09 c2                	or     %eax,%edx
  8013a0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013a3:	c1 e0 08             	shl    $0x8,%eax
  8013a6:	09 d0                	or     %edx,%eax
  8013a8:	09 45 f4             	or     %eax,-0xc(%rbp)
  8013ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013af:	48 c1 e8 02          	shr    $0x2,%rax
  8013b3:	48 89 c1             	mov    %rax,%rcx
  8013b6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013ba:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013bd:	48 89 d7             	mov    %rdx,%rdi
  8013c0:	fc                   	cld    
  8013c1:	f3 ab                	rep stos %eax,%es:(%rdi)
  8013c3:	eb 11                	jmp    8013d6 <memset+0x85>
  8013c5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013c9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8013cc:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8013d0:	48 89 d7             	mov    %rdx,%rdi
  8013d3:	fc                   	cld    
  8013d4:	f3 aa                	rep stos %al,%es:(%rdi)
  8013d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013da:	c9                   	leaveq 
  8013db:	c3                   	retq   

00000000008013dc <memmove>:
  8013dc:	55                   	push   %rbp
  8013dd:	48 89 e5             	mov    %rsp,%rbp
  8013e0:	48 83 ec 28          	sub    $0x28,%rsp
  8013e4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013e8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013ec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013f4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013fc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801400:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801404:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801408:	0f 83 88 00 00 00    	jae    801496 <memmove+0xba>
  80140e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801412:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801416:	48 01 d0             	add    %rdx,%rax
  801419:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80141d:	76 77                	jbe    801496 <memmove+0xba>
  80141f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801423:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801427:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80142b:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80142f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801433:	83 e0 03             	and    $0x3,%eax
  801436:	48 85 c0             	test   %rax,%rax
  801439:	75 3b                	jne    801476 <memmove+0x9a>
  80143b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80143f:	83 e0 03             	and    $0x3,%eax
  801442:	48 85 c0             	test   %rax,%rax
  801445:	75 2f                	jne    801476 <memmove+0x9a>
  801447:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80144b:	83 e0 03             	and    $0x3,%eax
  80144e:	48 85 c0             	test   %rax,%rax
  801451:	75 23                	jne    801476 <memmove+0x9a>
  801453:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801457:	48 83 e8 04          	sub    $0x4,%rax
  80145b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80145f:	48 83 ea 04          	sub    $0x4,%rdx
  801463:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801467:	48 c1 e9 02          	shr    $0x2,%rcx
  80146b:	48 89 c7             	mov    %rax,%rdi
  80146e:	48 89 d6             	mov    %rdx,%rsi
  801471:	fd                   	std    
  801472:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801474:	eb 1d                	jmp    801493 <memmove+0xb7>
  801476:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80147a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80147e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801482:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801486:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80148a:	48 89 d7             	mov    %rdx,%rdi
  80148d:	48 89 c1             	mov    %rax,%rcx
  801490:	fd                   	std    
  801491:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801493:	fc                   	cld    
  801494:	eb 57                	jmp    8014ed <memmove+0x111>
  801496:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80149a:	83 e0 03             	and    $0x3,%eax
  80149d:	48 85 c0             	test   %rax,%rax
  8014a0:	75 36                	jne    8014d8 <memmove+0xfc>
  8014a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014a6:	83 e0 03             	and    $0x3,%eax
  8014a9:	48 85 c0             	test   %rax,%rax
  8014ac:	75 2a                	jne    8014d8 <memmove+0xfc>
  8014ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014b2:	83 e0 03             	and    $0x3,%eax
  8014b5:	48 85 c0             	test   %rax,%rax
  8014b8:	75 1e                	jne    8014d8 <memmove+0xfc>
  8014ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014be:	48 c1 e8 02          	shr    $0x2,%rax
  8014c2:	48 89 c1             	mov    %rax,%rcx
  8014c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014c9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014cd:	48 89 c7             	mov    %rax,%rdi
  8014d0:	48 89 d6             	mov    %rdx,%rsi
  8014d3:	fc                   	cld    
  8014d4:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8014d6:	eb 15                	jmp    8014ed <memmove+0x111>
  8014d8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014dc:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014e0:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014e4:	48 89 c7             	mov    %rax,%rdi
  8014e7:	48 89 d6             	mov    %rdx,%rsi
  8014ea:	fc                   	cld    
  8014eb:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014f1:	c9                   	leaveq 
  8014f2:	c3                   	retq   

00000000008014f3 <memcpy>:
  8014f3:	55                   	push   %rbp
  8014f4:	48 89 e5             	mov    %rsp,%rbp
  8014f7:	48 83 ec 18          	sub    $0x18,%rsp
  8014fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801503:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801507:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80150b:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80150f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801513:	48 89 ce             	mov    %rcx,%rsi
  801516:	48 89 c7             	mov    %rax,%rdi
  801519:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  801520:	00 00 00 
  801523:	ff d0                	callq  *%rax
  801525:	c9                   	leaveq 
  801526:	c3                   	retq   

0000000000801527 <memcmp>:
  801527:	55                   	push   %rbp
  801528:	48 89 e5             	mov    %rsp,%rbp
  80152b:	48 83 ec 28          	sub    $0x28,%rsp
  80152f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801533:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801537:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80153b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80153f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801543:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801547:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80154b:	eb 36                	jmp    801583 <memcmp+0x5c>
  80154d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801551:	0f b6 10             	movzbl (%rax),%edx
  801554:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801558:	0f b6 00             	movzbl (%rax),%eax
  80155b:	38 c2                	cmp    %al,%dl
  80155d:	74 1a                	je     801579 <memcmp+0x52>
  80155f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801563:	0f b6 00             	movzbl (%rax),%eax
  801566:	0f b6 d0             	movzbl %al,%edx
  801569:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80156d:	0f b6 00             	movzbl (%rax),%eax
  801570:	0f b6 c0             	movzbl %al,%eax
  801573:	29 c2                	sub    %eax,%edx
  801575:	89 d0                	mov    %edx,%eax
  801577:	eb 20                	jmp    801599 <memcmp+0x72>
  801579:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80157e:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801583:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801587:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80158b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80158f:	48 85 c0             	test   %rax,%rax
  801592:	75 b9                	jne    80154d <memcmp+0x26>
  801594:	b8 00 00 00 00       	mov    $0x0,%eax
  801599:	c9                   	leaveq 
  80159a:	c3                   	retq   

000000000080159b <memfind>:
  80159b:	55                   	push   %rbp
  80159c:	48 89 e5             	mov    %rsp,%rbp
  80159f:	48 83 ec 28          	sub    $0x28,%rsp
  8015a3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015a7:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8015aa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015ae:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015b2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015b6:	48 01 d0             	add    %rdx,%rax
  8015b9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8015bd:	eb 13                	jmp    8015d2 <memfind+0x37>
  8015bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015c3:	0f b6 00             	movzbl (%rax),%eax
  8015c6:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8015c9:	38 d0                	cmp    %dl,%al
  8015cb:	74 11                	je     8015de <memfind+0x43>
  8015cd:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8015d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015d6:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8015da:	72 e3                	jb     8015bf <memfind+0x24>
  8015dc:	eb 01                	jmp    8015df <memfind+0x44>
  8015de:	90                   	nop
  8015df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015e3:	c9                   	leaveq 
  8015e4:	c3                   	retq   

00000000008015e5 <strtol>:
  8015e5:	55                   	push   %rbp
  8015e6:	48 89 e5             	mov    %rsp,%rbp
  8015e9:	48 83 ec 38          	sub    $0x38,%rsp
  8015ed:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8015f1:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8015f5:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8015f8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8015ff:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801606:	00 
  801607:	eb 05                	jmp    80160e <strtol+0x29>
  801609:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80160e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801612:	0f b6 00             	movzbl (%rax),%eax
  801615:	3c 20                	cmp    $0x20,%al
  801617:	74 f0                	je     801609 <strtol+0x24>
  801619:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80161d:	0f b6 00             	movzbl (%rax),%eax
  801620:	3c 09                	cmp    $0x9,%al
  801622:	74 e5                	je     801609 <strtol+0x24>
  801624:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801628:	0f b6 00             	movzbl (%rax),%eax
  80162b:	3c 2b                	cmp    $0x2b,%al
  80162d:	75 07                	jne    801636 <strtol+0x51>
  80162f:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801634:	eb 17                	jmp    80164d <strtol+0x68>
  801636:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80163a:	0f b6 00             	movzbl (%rax),%eax
  80163d:	3c 2d                	cmp    $0x2d,%al
  80163f:	75 0c                	jne    80164d <strtol+0x68>
  801641:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801646:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  80164d:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801651:	74 06                	je     801659 <strtol+0x74>
  801653:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801657:	75 28                	jne    801681 <strtol+0x9c>
  801659:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165d:	0f b6 00             	movzbl (%rax),%eax
  801660:	3c 30                	cmp    $0x30,%al
  801662:	75 1d                	jne    801681 <strtol+0x9c>
  801664:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801668:	48 83 c0 01          	add    $0x1,%rax
  80166c:	0f b6 00             	movzbl (%rax),%eax
  80166f:	3c 78                	cmp    $0x78,%al
  801671:	75 0e                	jne    801681 <strtol+0x9c>
  801673:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801678:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  80167f:	eb 2c                	jmp    8016ad <strtol+0xc8>
  801681:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801685:	75 19                	jne    8016a0 <strtol+0xbb>
  801687:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80168b:	0f b6 00             	movzbl (%rax),%eax
  80168e:	3c 30                	cmp    $0x30,%al
  801690:	75 0e                	jne    8016a0 <strtol+0xbb>
  801692:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801697:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  80169e:	eb 0d                	jmp    8016ad <strtol+0xc8>
  8016a0:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8016a4:	75 07                	jne    8016ad <strtol+0xc8>
  8016a6:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8016ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016b1:	0f b6 00             	movzbl (%rax),%eax
  8016b4:	3c 2f                	cmp    $0x2f,%al
  8016b6:	7e 1d                	jle    8016d5 <strtol+0xf0>
  8016b8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016bc:	0f b6 00             	movzbl (%rax),%eax
  8016bf:	3c 39                	cmp    $0x39,%al
  8016c1:	7f 12                	jg     8016d5 <strtol+0xf0>
  8016c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c7:	0f b6 00             	movzbl (%rax),%eax
  8016ca:	0f be c0             	movsbl %al,%eax
  8016cd:	83 e8 30             	sub    $0x30,%eax
  8016d0:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016d3:	eb 4e                	jmp    801723 <strtol+0x13e>
  8016d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016d9:	0f b6 00             	movzbl (%rax),%eax
  8016dc:	3c 60                	cmp    $0x60,%al
  8016de:	7e 1d                	jle    8016fd <strtol+0x118>
  8016e0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016e4:	0f b6 00             	movzbl (%rax),%eax
  8016e7:	3c 7a                	cmp    $0x7a,%al
  8016e9:	7f 12                	jg     8016fd <strtol+0x118>
  8016eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ef:	0f b6 00             	movzbl (%rax),%eax
  8016f2:	0f be c0             	movsbl %al,%eax
  8016f5:	83 e8 57             	sub    $0x57,%eax
  8016f8:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016fb:	eb 26                	jmp    801723 <strtol+0x13e>
  8016fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801701:	0f b6 00             	movzbl (%rax),%eax
  801704:	3c 40                	cmp    $0x40,%al
  801706:	7e 47                	jle    80174f <strtol+0x16a>
  801708:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80170c:	0f b6 00             	movzbl (%rax),%eax
  80170f:	3c 5a                	cmp    $0x5a,%al
  801711:	7f 3c                	jg     80174f <strtol+0x16a>
  801713:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801717:	0f b6 00             	movzbl (%rax),%eax
  80171a:	0f be c0             	movsbl %al,%eax
  80171d:	83 e8 37             	sub    $0x37,%eax
  801720:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801723:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801726:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801729:	7d 23                	jge    80174e <strtol+0x169>
  80172b:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801730:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801733:	48 98                	cltq   
  801735:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  80173a:	48 89 c2             	mov    %rax,%rdx
  80173d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801740:	48 98                	cltq   
  801742:	48 01 d0             	add    %rdx,%rax
  801745:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801749:	e9 5f ff ff ff       	jmpq   8016ad <strtol+0xc8>
  80174e:	90                   	nop
  80174f:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801754:	74 0b                	je     801761 <strtol+0x17c>
  801756:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80175a:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80175e:	48 89 10             	mov    %rdx,(%rax)
  801761:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801765:	74 09                	je     801770 <strtol+0x18b>
  801767:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80176b:	48 f7 d8             	neg    %rax
  80176e:	eb 04                	jmp    801774 <strtol+0x18f>
  801770:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801774:	c9                   	leaveq 
  801775:	c3                   	retq   

0000000000801776 <strstr>:
  801776:	55                   	push   %rbp
  801777:	48 89 e5             	mov    %rsp,%rbp
  80177a:	48 83 ec 30          	sub    $0x30,%rsp
  80177e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801782:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801786:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80178a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80178e:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801792:	0f b6 00             	movzbl (%rax),%eax
  801795:	88 45 ff             	mov    %al,-0x1(%rbp)
  801798:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80179c:	75 06                	jne    8017a4 <strstr+0x2e>
  80179e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017a2:	eb 6b                	jmp    80180f <strstr+0x99>
  8017a4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8017a8:	48 89 c7             	mov    %rax,%rdi
  8017ab:	48 b8 4b 10 80 00 00 	movabs $0x80104b,%rax
  8017b2:	00 00 00 
  8017b5:	ff d0                	callq  *%rax
  8017b7:	48 98                	cltq   
  8017b9:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8017bd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017c1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8017c5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8017c9:	0f b6 00             	movzbl (%rax),%eax
  8017cc:	88 45 ef             	mov    %al,-0x11(%rbp)
  8017cf:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  8017d3:	75 07                	jne    8017dc <strstr+0x66>
  8017d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8017da:	eb 33                	jmp    80180f <strstr+0x99>
  8017dc:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8017e0:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8017e3:	75 d8                	jne    8017bd <strstr+0x47>
  8017e5:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017e9:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8017ed:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017f1:	48 89 ce             	mov    %rcx,%rsi
  8017f4:	48 89 c7             	mov    %rax,%rdi
  8017f7:	48 b8 6c 12 80 00 00 	movabs $0x80126c,%rax
  8017fe:	00 00 00 
  801801:	ff d0                	callq  *%rax
  801803:	85 c0                	test   %eax,%eax
  801805:	75 b6                	jne    8017bd <strstr+0x47>
  801807:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80180b:	48 83 e8 01          	sub    $0x1,%rax
  80180f:	c9                   	leaveq 
  801810:	c3                   	retq   

0000000000801811 <syscall>:
  801811:	55                   	push   %rbp
  801812:	48 89 e5             	mov    %rsp,%rbp
  801815:	53                   	push   %rbx
  801816:	48 83 ec 48          	sub    $0x48,%rsp
  80181a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80181d:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801820:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801824:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801828:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  80182c:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801830:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801833:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801837:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  80183b:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  80183f:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801843:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801847:	4c 89 c3             	mov    %r8,%rbx
  80184a:	cd 30                	int    $0x30
  80184c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801850:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801854:	74 3e                	je     801894 <syscall+0x83>
  801856:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80185b:	7e 37                	jle    801894 <syscall+0x83>
  80185d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801861:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801864:	49 89 d0             	mov    %rdx,%r8
  801867:	89 c1                	mov    %eax,%ecx
  801869:	48 ba c8 49 80 00 00 	movabs $0x8049c8,%rdx
  801870:	00 00 00 
  801873:	be 24 00 00 00       	mov    $0x24,%esi
  801878:	48 bf e5 49 80 00 00 	movabs $0x8049e5,%rdi
  80187f:	00 00 00 
  801882:	b8 00 00 00 00       	mov    $0x0,%eax
  801887:	49 b9 ed 02 80 00 00 	movabs $0x8002ed,%r9
  80188e:	00 00 00 
  801891:	41 ff d1             	callq  *%r9
  801894:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801898:	48 83 c4 48          	add    $0x48,%rsp
  80189c:	5b                   	pop    %rbx
  80189d:	5d                   	pop    %rbp
  80189e:	c3                   	retq   

000000000080189f <sys_cputs>:
  80189f:	55                   	push   %rbp
  8018a0:	48 89 e5             	mov    %rsp,%rbp
  8018a3:	48 83 ec 10          	sub    $0x10,%rsp
  8018a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8018ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018b3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018b7:	48 83 ec 08          	sub    $0x8,%rsp
  8018bb:	6a 00                	pushq  $0x0
  8018bd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018c3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018c9:	48 89 d1             	mov    %rdx,%rcx
  8018cc:	48 89 c2             	mov    %rax,%rdx
  8018cf:	be 00 00 00 00       	mov    $0x0,%esi
  8018d4:	bf 00 00 00 00       	mov    $0x0,%edi
  8018d9:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  8018e0:	00 00 00 
  8018e3:	ff d0                	callq  *%rax
  8018e5:	48 83 c4 10          	add    $0x10,%rsp
  8018e9:	90                   	nop
  8018ea:	c9                   	leaveq 
  8018eb:	c3                   	retq   

00000000008018ec <sys_cgetc>:
  8018ec:	55                   	push   %rbp
  8018ed:	48 89 e5             	mov    %rsp,%rbp
  8018f0:	48 83 ec 08          	sub    $0x8,%rsp
  8018f4:	6a 00                	pushq  $0x0
  8018f6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018fc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801902:	b9 00 00 00 00       	mov    $0x0,%ecx
  801907:	ba 00 00 00 00       	mov    $0x0,%edx
  80190c:	be 00 00 00 00       	mov    $0x0,%esi
  801911:	bf 01 00 00 00       	mov    $0x1,%edi
  801916:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  80191d:	00 00 00 
  801920:	ff d0                	callq  *%rax
  801922:	48 83 c4 10          	add    $0x10,%rsp
  801926:	c9                   	leaveq 
  801927:	c3                   	retq   

0000000000801928 <sys_env_destroy>:
  801928:	55                   	push   %rbp
  801929:	48 89 e5             	mov    %rsp,%rbp
  80192c:	48 83 ec 10          	sub    $0x10,%rsp
  801930:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801933:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801936:	48 98                	cltq   
  801938:	48 83 ec 08          	sub    $0x8,%rsp
  80193c:	6a 00                	pushq  $0x0
  80193e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801944:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80194a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80194f:	48 89 c2             	mov    %rax,%rdx
  801952:	be 01 00 00 00       	mov    $0x1,%esi
  801957:	bf 03 00 00 00       	mov    $0x3,%edi
  80195c:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801963:	00 00 00 
  801966:	ff d0                	callq  *%rax
  801968:	48 83 c4 10          	add    $0x10,%rsp
  80196c:	c9                   	leaveq 
  80196d:	c3                   	retq   

000000000080196e <sys_getenvid>:
  80196e:	55                   	push   %rbp
  80196f:	48 89 e5             	mov    %rsp,%rbp
  801972:	48 83 ec 08          	sub    $0x8,%rsp
  801976:	6a 00                	pushq  $0x0
  801978:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80197e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801984:	b9 00 00 00 00       	mov    $0x0,%ecx
  801989:	ba 00 00 00 00       	mov    $0x0,%edx
  80198e:	be 00 00 00 00       	mov    $0x0,%esi
  801993:	bf 02 00 00 00       	mov    $0x2,%edi
  801998:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  80199f:	00 00 00 
  8019a2:	ff d0                	callq  *%rax
  8019a4:	48 83 c4 10          	add    $0x10,%rsp
  8019a8:	c9                   	leaveq 
  8019a9:	c3                   	retq   

00000000008019aa <sys_yield>:
  8019aa:	55                   	push   %rbp
  8019ab:	48 89 e5             	mov    %rsp,%rbp
  8019ae:	48 83 ec 08          	sub    $0x8,%rsp
  8019b2:	6a 00                	pushq  $0x0
  8019b4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019ba:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019c0:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019c5:	ba 00 00 00 00       	mov    $0x0,%edx
  8019ca:	be 00 00 00 00       	mov    $0x0,%esi
  8019cf:	bf 0b 00 00 00       	mov    $0xb,%edi
  8019d4:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  8019db:	00 00 00 
  8019de:	ff d0                	callq  *%rax
  8019e0:	48 83 c4 10          	add    $0x10,%rsp
  8019e4:	90                   	nop
  8019e5:	c9                   	leaveq 
  8019e6:	c3                   	retq   

00000000008019e7 <sys_page_alloc>:
  8019e7:	55                   	push   %rbp
  8019e8:	48 89 e5             	mov    %rsp,%rbp
  8019eb:	48 83 ec 10          	sub    $0x10,%rsp
  8019ef:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019f6:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019f9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019fc:	48 63 c8             	movslq %eax,%rcx
  8019ff:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a03:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a06:	48 98                	cltq   
  801a08:	48 83 ec 08          	sub    $0x8,%rsp
  801a0c:	6a 00                	pushq  $0x0
  801a0e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a14:	49 89 c8             	mov    %rcx,%r8
  801a17:	48 89 d1             	mov    %rdx,%rcx
  801a1a:	48 89 c2             	mov    %rax,%rdx
  801a1d:	be 01 00 00 00       	mov    $0x1,%esi
  801a22:	bf 04 00 00 00       	mov    $0x4,%edi
  801a27:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801a2e:	00 00 00 
  801a31:	ff d0                	callq  *%rax
  801a33:	48 83 c4 10          	add    $0x10,%rsp
  801a37:	c9                   	leaveq 
  801a38:	c3                   	retq   

0000000000801a39 <sys_page_map>:
  801a39:	55                   	push   %rbp
  801a3a:	48 89 e5             	mov    %rsp,%rbp
  801a3d:	48 83 ec 20          	sub    $0x20,%rsp
  801a41:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a44:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a48:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a4b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a4f:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a53:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a56:	48 63 c8             	movslq %eax,%rcx
  801a59:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a5d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a60:	48 63 f0             	movslq %eax,%rsi
  801a63:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a6a:	48 98                	cltq   
  801a6c:	48 83 ec 08          	sub    $0x8,%rsp
  801a70:	51                   	push   %rcx
  801a71:	49 89 f9             	mov    %rdi,%r9
  801a74:	49 89 f0             	mov    %rsi,%r8
  801a77:	48 89 d1             	mov    %rdx,%rcx
  801a7a:	48 89 c2             	mov    %rax,%rdx
  801a7d:	be 01 00 00 00       	mov    $0x1,%esi
  801a82:	bf 05 00 00 00       	mov    $0x5,%edi
  801a87:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801a8e:	00 00 00 
  801a91:	ff d0                	callq  *%rax
  801a93:	48 83 c4 10          	add    $0x10,%rsp
  801a97:	c9                   	leaveq 
  801a98:	c3                   	retq   

0000000000801a99 <sys_page_unmap>:
  801a99:	55                   	push   %rbp
  801a9a:	48 89 e5             	mov    %rsp,%rbp
  801a9d:	48 83 ec 10          	sub    $0x10,%rsp
  801aa1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801aa4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aa8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aaf:	48 98                	cltq   
  801ab1:	48 83 ec 08          	sub    $0x8,%rsp
  801ab5:	6a 00                	pushq  $0x0
  801ab7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801abd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ac3:	48 89 d1             	mov    %rdx,%rcx
  801ac6:	48 89 c2             	mov    %rax,%rdx
  801ac9:	be 01 00 00 00       	mov    $0x1,%esi
  801ace:	bf 06 00 00 00       	mov    $0x6,%edi
  801ad3:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801ada:	00 00 00 
  801add:	ff d0                	callq  *%rax
  801adf:	48 83 c4 10          	add    $0x10,%rsp
  801ae3:	c9                   	leaveq 
  801ae4:	c3                   	retq   

0000000000801ae5 <sys_env_set_status>:
  801ae5:	55                   	push   %rbp
  801ae6:	48 89 e5             	mov    %rsp,%rbp
  801ae9:	48 83 ec 10          	sub    $0x10,%rsp
  801aed:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801af0:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801af3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801af6:	48 63 d0             	movslq %eax,%rdx
  801af9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801afc:	48 98                	cltq   
  801afe:	48 83 ec 08          	sub    $0x8,%rsp
  801b02:	6a 00                	pushq  $0x0
  801b04:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b0a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b10:	48 89 d1             	mov    %rdx,%rcx
  801b13:	48 89 c2             	mov    %rax,%rdx
  801b16:	be 01 00 00 00       	mov    $0x1,%esi
  801b1b:	bf 08 00 00 00       	mov    $0x8,%edi
  801b20:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801b27:	00 00 00 
  801b2a:	ff d0                	callq  *%rax
  801b2c:	48 83 c4 10          	add    $0x10,%rsp
  801b30:	c9                   	leaveq 
  801b31:	c3                   	retq   

0000000000801b32 <sys_env_set_trapframe>:
  801b32:	55                   	push   %rbp
  801b33:	48 89 e5             	mov    %rsp,%rbp
  801b36:	48 83 ec 10          	sub    $0x10,%rsp
  801b3a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b3d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b41:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b48:	48 98                	cltq   
  801b4a:	48 83 ec 08          	sub    $0x8,%rsp
  801b4e:	6a 00                	pushq  $0x0
  801b50:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b56:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b5c:	48 89 d1             	mov    %rdx,%rcx
  801b5f:	48 89 c2             	mov    %rax,%rdx
  801b62:	be 01 00 00 00       	mov    $0x1,%esi
  801b67:	bf 09 00 00 00       	mov    $0x9,%edi
  801b6c:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801b73:	00 00 00 
  801b76:	ff d0                	callq  *%rax
  801b78:	48 83 c4 10          	add    $0x10,%rsp
  801b7c:	c9                   	leaveq 
  801b7d:	c3                   	retq   

0000000000801b7e <sys_env_set_pgfault_upcall>:
  801b7e:	55                   	push   %rbp
  801b7f:	48 89 e5             	mov    %rsp,%rbp
  801b82:	48 83 ec 10          	sub    $0x10,%rsp
  801b86:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b89:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b8d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b91:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b94:	48 98                	cltq   
  801b96:	48 83 ec 08          	sub    $0x8,%rsp
  801b9a:	6a 00                	pushq  $0x0
  801b9c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ba2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ba8:	48 89 d1             	mov    %rdx,%rcx
  801bab:	48 89 c2             	mov    %rax,%rdx
  801bae:	be 01 00 00 00       	mov    $0x1,%esi
  801bb3:	bf 0a 00 00 00       	mov    $0xa,%edi
  801bb8:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801bbf:	00 00 00 
  801bc2:	ff d0                	callq  *%rax
  801bc4:	48 83 c4 10          	add    $0x10,%rsp
  801bc8:	c9                   	leaveq 
  801bc9:	c3                   	retq   

0000000000801bca <sys_ipc_try_send>:
  801bca:	55                   	push   %rbp
  801bcb:	48 89 e5             	mov    %rsp,%rbp
  801bce:	48 83 ec 20          	sub    $0x20,%rsp
  801bd2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bd5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bd9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801bdd:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801be0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801be3:	48 63 f0             	movslq %eax,%rsi
  801be6:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801bea:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bed:	48 98                	cltq   
  801bef:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bf3:	48 83 ec 08          	sub    $0x8,%rsp
  801bf7:	6a 00                	pushq  $0x0
  801bf9:	49 89 f1             	mov    %rsi,%r9
  801bfc:	49 89 c8             	mov    %rcx,%r8
  801bff:	48 89 d1             	mov    %rdx,%rcx
  801c02:	48 89 c2             	mov    %rax,%rdx
  801c05:	be 00 00 00 00       	mov    $0x0,%esi
  801c0a:	bf 0c 00 00 00       	mov    $0xc,%edi
  801c0f:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801c16:	00 00 00 
  801c19:	ff d0                	callq  *%rax
  801c1b:	48 83 c4 10          	add    $0x10,%rsp
  801c1f:	c9                   	leaveq 
  801c20:	c3                   	retq   

0000000000801c21 <sys_ipc_recv>:
  801c21:	55                   	push   %rbp
  801c22:	48 89 e5             	mov    %rsp,%rbp
  801c25:	48 83 ec 10          	sub    $0x10,%rsp
  801c29:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c2d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c31:	48 83 ec 08          	sub    $0x8,%rsp
  801c35:	6a 00                	pushq  $0x0
  801c37:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c3d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c43:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c48:	48 89 c2             	mov    %rax,%rdx
  801c4b:	be 01 00 00 00       	mov    $0x1,%esi
  801c50:	bf 0d 00 00 00       	mov    $0xd,%edi
  801c55:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801c5c:	00 00 00 
  801c5f:	ff d0                	callq  *%rax
  801c61:	48 83 c4 10          	add    $0x10,%rsp
  801c65:	c9                   	leaveq 
  801c66:	c3                   	retq   

0000000000801c67 <sys_time_msec>:
  801c67:	55                   	push   %rbp
  801c68:	48 89 e5             	mov    %rsp,%rbp
  801c6b:	48 83 ec 08          	sub    $0x8,%rsp
  801c6f:	6a 00                	pushq  $0x0
  801c71:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c77:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c7d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c82:	ba 00 00 00 00       	mov    $0x0,%edx
  801c87:	be 00 00 00 00       	mov    $0x0,%esi
  801c8c:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c91:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801c98:	00 00 00 
  801c9b:	ff d0                	callq  *%rax
  801c9d:	48 83 c4 10          	add    $0x10,%rsp
  801ca1:	c9                   	leaveq 
  801ca2:	c3                   	retq   

0000000000801ca3 <sys_net_transmit>:
  801ca3:	55                   	push   %rbp
  801ca4:	48 89 e5             	mov    %rsp,%rbp
  801ca7:	48 83 ec 10          	sub    $0x10,%rsp
  801cab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801caf:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801cb2:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801cb5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cb9:	48 83 ec 08          	sub    $0x8,%rsp
  801cbd:	6a 00                	pushq  $0x0
  801cbf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cc5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ccb:	48 89 d1             	mov    %rdx,%rcx
  801cce:	48 89 c2             	mov    %rax,%rdx
  801cd1:	be 00 00 00 00       	mov    $0x0,%esi
  801cd6:	bf 0f 00 00 00       	mov    $0xf,%edi
  801cdb:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801ce2:	00 00 00 
  801ce5:	ff d0                	callq  *%rax
  801ce7:	48 83 c4 10          	add    $0x10,%rsp
  801ceb:	c9                   	leaveq 
  801cec:	c3                   	retq   

0000000000801ced <sys_net_receive>:
  801ced:	55                   	push   %rbp
  801cee:	48 89 e5             	mov    %rsp,%rbp
  801cf1:	48 83 ec 10          	sub    $0x10,%rsp
  801cf5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cf9:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801cfc:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801cff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d03:	48 83 ec 08          	sub    $0x8,%rsp
  801d07:	6a 00                	pushq  $0x0
  801d09:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d0f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d15:	48 89 d1             	mov    %rdx,%rcx
  801d18:	48 89 c2             	mov    %rax,%rdx
  801d1b:	be 00 00 00 00       	mov    $0x0,%esi
  801d20:	bf 10 00 00 00       	mov    $0x10,%edi
  801d25:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801d2c:	00 00 00 
  801d2f:	ff d0                	callq  *%rax
  801d31:	48 83 c4 10          	add    $0x10,%rsp
  801d35:	c9                   	leaveq 
  801d36:	c3                   	retq   

0000000000801d37 <sys_ept_map>:
  801d37:	55                   	push   %rbp
  801d38:	48 89 e5             	mov    %rsp,%rbp
  801d3b:	48 83 ec 20          	sub    $0x20,%rsp
  801d3f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d42:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d46:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d49:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d4d:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d51:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d54:	48 63 c8             	movslq %eax,%rcx
  801d57:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d5b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d5e:	48 63 f0             	movslq %eax,%rsi
  801d61:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d65:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d68:	48 98                	cltq   
  801d6a:	48 83 ec 08          	sub    $0x8,%rsp
  801d6e:	51                   	push   %rcx
  801d6f:	49 89 f9             	mov    %rdi,%r9
  801d72:	49 89 f0             	mov    %rsi,%r8
  801d75:	48 89 d1             	mov    %rdx,%rcx
  801d78:	48 89 c2             	mov    %rax,%rdx
  801d7b:	be 00 00 00 00       	mov    $0x0,%esi
  801d80:	bf 11 00 00 00       	mov    $0x11,%edi
  801d85:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801d8c:	00 00 00 
  801d8f:	ff d0                	callq  *%rax
  801d91:	48 83 c4 10          	add    $0x10,%rsp
  801d95:	c9                   	leaveq 
  801d96:	c3                   	retq   

0000000000801d97 <sys_env_mkguest>:
  801d97:	55                   	push   %rbp
  801d98:	48 89 e5             	mov    %rsp,%rbp
  801d9b:	48 83 ec 10          	sub    $0x10,%rsp
  801d9f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801da3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801da7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801dab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801daf:	48 83 ec 08          	sub    $0x8,%rsp
  801db3:	6a 00                	pushq  $0x0
  801db5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801dbb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801dc1:	48 89 d1             	mov    %rdx,%rcx
  801dc4:	48 89 c2             	mov    %rax,%rdx
  801dc7:	be 00 00 00 00       	mov    $0x0,%esi
  801dcc:	bf 12 00 00 00       	mov    $0x12,%edi
  801dd1:	48 b8 11 18 80 00 00 	movabs $0x801811,%rax
  801dd8:	00 00 00 
  801ddb:	ff d0                	callq  *%rax
  801ddd:	48 83 c4 10          	add    $0x10,%rsp
  801de1:	c9                   	leaveq 
  801de2:	c3                   	retq   

0000000000801de3 <fd2num>:
  801de3:	55                   	push   %rbp
  801de4:	48 89 e5             	mov    %rsp,%rbp
  801de7:	48 83 ec 08          	sub    $0x8,%rsp
  801deb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801def:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801df3:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801dfa:	ff ff ff 
  801dfd:	48 01 d0             	add    %rdx,%rax
  801e00:	48 c1 e8 0c          	shr    $0xc,%rax
  801e04:	c9                   	leaveq 
  801e05:	c3                   	retq   

0000000000801e06 <fd2data>:
  801e06:	55                   	push   %rbp
  801e07:	48 89 e5             	mov    %rsp,%rbp
  801e0a:	48 83 ec 08          	sub    $0x8,%rsp
  801e0e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e12:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e16:	48 89 c7             	mov    %rax,%rdi
  801e19:	48 b8 e3 1d 80 00 00 	movabs $0x801de3,%rax
  801e20:	00 00 00 
  801e23:	ff d0                	callq  *%rax
  801e25:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801e2b:	48 c1 e0 0c          	shl    $0xc,%rax
  801e2f:	c9                   	leaveq 
  801e30:	c3                   	retq   

0000000000801e31 <fd_alloc>:
  801e31:	55                   	push   %rbp
  801e32:	48 89 e5             	mov    %rsp,%rbp
  801e35:	48 83 ec 18          	sub    $0x18,%rsp
  801e39:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e3d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e44:	eb 6b                	jmp    801eb1 <fd_alloc+0x80>
  801e46:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e49:	48 98                	cltq   
  801e4b:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801e51:	48 c1 e0 0c          	shl    $0xc,%rax
  801e55:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e59:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e5d:	48 c1 e8 15          	shr    $0x15,%rax
  801e61:	48 89 c2             	mov    %rax,%rdx
  801e64:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801e6b:	01 00 00 
  801e6e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e72:	83 e0 01             	and    $0x1,%eax
  801e75:	48 85 c0             	test   %rax,%rax
  801e78:	74 21                	je     801e9b <fd_alloc+0x6a>
  801e7a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e7e:	48 c1 e8 0c          	shr    $0xc,%rax
  801e82:	48 89 c2             	mov    %rax,%rdx
  801e85:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801e8c:	01 00 00 
  801e8f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e93:	83 e0 01             	and    $0x1,%eax
  801e96:	48 85 c0             	test   %rax,%rax
  801e99:	75 12                	jne    801ead <fd_alloc+0x7c>
  801e9b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e9f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ea3:	48 89 10             	mov    %rdx,(%rax)
  801ea6:	b8 00 00 00 00       	mov    $0x0,%eax
  801eab:	eb 1a                	jmp    801ec7 <fd_alloc+0x96>
  801ead:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801eb1:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801eb5:	7e 8f                	jle    801e46 <fd_alloc+0x15>
  801eb7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ebb:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801ec2:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801ec7:	c9                   	leaveq 
  801ec8:	c3                   	retq   

0000000000801ec9 <fd_lookup>:
  801ec9:	55                   	push   %rbp
  801eca:	48 89 e5             	mov    %rsp,%rbp
  801ecd:	48 83 ec 20          	sub    $0x20,%rsp
  801ed1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801ed4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801ed8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801edc:	78 06                	js     801ee4 <fd_lookup+0x1b>
  801ede:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801ee2:	7e 07                	jle    801eeb <fd_lookup+0x22>
  801ee4:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801ee9:	eb 6c                	jmp    801f57 <fd_lookup+0x8e>
  801eeb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801eee:	48 98                	cltq   
  801ef0:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801ef6:	48 c1 e0 0c          	shl    $0xc,%rax
  801efa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801efe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f02:	48 c1 e8 15          	shr    $0x15,%rax
  801f06:	48 89 c2             	mov    %rax,%rdx
  801f09:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f10:	01 00 00 
  801f13:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f17:	83 e0 01             	and    $0x1,%eax
  801f1a:	48 85 c0             	test   %rax,%rax
  801f1d:	74 21                	je     801f40 <fd_lookup+0x77>
  801f1f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f23:	48 c1 e8 0c          	shr    $0xc,%rax
  801f27:	48 89 c2             	mov    %rax,%rdx
  801f2a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f31:	01 00 00 
  801f34:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f38:	83 e0 01             	and    $0x1,%eax
  801f3b:	48 85 c0             	test   %rax,%rax
  801f3e:	75 07                	jne    801f47 <fd_lookup+0x7e>
  801f40:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f45:	eb 10                	jmp    801f57 <fd_lookup+0x8e>
  801f47:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f4b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f4f:	48 89 10             	mov    %rdx,(%rax)
  801f52:	b8 00 00 00 00       	mov    $0x0,%eax
  801f57:	c9                   	leaveq 
  801f58:	c3                   	retq   

0000000000801f59 <fd_close>:
  801f59:	55                   	push   %rbp
  801f5a:	48 89 e5             	mov    %rsp,%rbp
  801f5d:	48 83 ec 30          	sub    $0x30,%rsp
  801f61:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f65:	89 f0                	mov    %esi,%eax
  801f67:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801f6a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f6e:	48 89 c7             	mov    %rax,%rdi
  801f71:	48 b8 e3 1d 80 00 00 	movabs $0x801de3,%rax
  801f78:	00 00 00 
  801f7b:	ff d0                	callq  *%rax
  801f7d:	89 c2                	mov    %eax,%edx
  801f7f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801f83:	48 89 c6             	mov    %rax,%rsi
  801f86:	89 d7                	mov    %edx,%edi
  801f88:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  801f8f:	00 00 00 
  801f92:	ff d0                	callq  *%rax
  801f94:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f97:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f9b:	78 0a                	js     801fa7 <fd_close+0x4e>
  801f9d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fa1:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801fa5:	74 12                	je     801fb9 <fd_close+0x60>
  801fa7:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801fab:	74 05                	je     801fb2 <fd_close+0x59>
  801fad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fb0:	eb 70                	jmp    802022 <fd_close+0xc9>
  801fb2:	b8 00 00 00 00       	mov    $0x0,%eax
  801fb7:	eb 69                	jmp    802022 <fd_close+0xc9>
  801fb9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fbd:	8b 00                	mov    (%rax),%eax
  801fbf:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801fc3:	48 89 d6             	mov    %rdx,%rsi
  801fc6:	89 c7                	mov    %eax,%edi
  801fc8:	48 b8 24 20 80 00 00 	movabs $0x802024,%rax
  801fcf:	00 00 00 
  801fd2:	ff d0                	callq  *%rax
  801fd4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fd7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801fdb:	78 2a                	js     802007 <fd_close+0xae>
  801fdd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fe1:	48 8b 40 20          	mov    0x20(%rax),%rax
  801fe5:	48 85 c0             	test   %rax,%rax
  801fe8:	74 16                	je     802000 <fd_close+0xa7>
  801fea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fee:	48 8b 40 20          	mov    0x20(%rax),%rax
  801ff2:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801ff6:	48 89 d7             	mov    %rdx,%rdi
  801ff9:	ff d0                	callq  *%rax
  801ffb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ffe:	eb 07                	jmp    802007 <fd_close+0xae>
  802000:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802007:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80200b:	48 89 c6             	mov    %rax,%rsi
  80200e:	bf 00 00 00 00       	mov    $0x0,%edi
  802013:	48 b8 99 1a 80 00 00 	movabs $0x801a99,%rax
  80201a:	00 00 00 
  80201d:	ff d0                	callq  *%rax
  80201f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802022:	c9                   	leaveq 
  802023:	c3                   	retq   

0000000000802024 <dev_lookup>:
  802024:	55                   	push   %rbp
  802025:	48 89 e5             	mov    %rsp,%rbp
  802028:	48 83 ec 20          	sub    $0x20,%rsp
  80202c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80202f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802033:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80203a:	eb 41                	jmp    80207d <dev_lookup+0x59>
  80203c:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802043:	00 00 00 
  802046:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802049:	48 63 d2             	movslq %edx,%rdx
  80204c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802050:	8b 00                	mov    (%rax),%eax
  802052:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802055:	75 22                	jne    802079 <dev_lookup+0x55>
  802057:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  80205e:	00 00 00 
  802061:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802064:	48 63 d2             	movslq %edx,%rdx
  802067:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80206b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80206f:	48 89 10             	mov    %rdx,(%rax)
  802072:	b8 00 00 00 00       	mov    $0x0,%eax
  802077:	eb 60                	jmp    8020d9 <dev_lookup+0xb5>
  802079:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80207d:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802084:	00 00 00 
  802087:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80208a:	48 63 d2             	movslq %edx,%rdx
  80208d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802091:	48 85 c0             	test   %rax,%rax
  802094:	75 a6                	jne    80203c <dev_lookup+0x18>
  802096:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80209d:	00 00 00 
  8020a0:	48 8b 00             	mov    (%rax),%rax
  8020a3:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8020a9:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8020ac:	89 c6                	mov    %eax,%esi
  8020ae:	48 bf f8 49 80 00 00 	movabs $0x8049f8,%rdi
  8020b5:	00 00 00 
  8020b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8020bd:	48 b9 27 05 80 00 00 	movabs $0x800527,%rcx
  8020c4:	00 00 00 
  8020c7:	ff d1                	callq  *%rcx
  8020c9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8020cd:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8020d4:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8020d9:	c9                   	leaveq 
  8020da:	c3                   	retq   

00000000008020db <close>:
  8020db:	55                   	push   %rbp
  8020dc:	48 89 e5             	mov    %rsp,%rbp
  8020df:	48 83 ec 20          	sub    $0x20,%rsp
  8020e3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020e6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8020ea:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8020ed:	48 89 d6             	mov    %rdx,%rsi
  8020f0:	89 c7                	mov    %eax,%edi
  8020f2:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  8020f9:	00 00 00 
  8020fc:	ff d0                	callq  *%rax
  8020fe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802101:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802105:	79 05                	jns    80210c <close+0x31>
  802107:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80210a:	eb 18                	jmp    802124 <close+0x49>
  80210c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802110:	be 01 00 00 00       	mov    $0x1,%esi
  802115:	48 89 c7             	mov    %rax,%rdi
  802118:	48 b8 59 1f 80 00 00 	movabs $0x801f59,%rax
  80211f:	00 00 00 
  802122:	ff d0                	callq  *%rax
  802124:	c9                   	leaveq 
  802125:	c3                   	retq   

0000000000802126 <close_all>:
  802126:	55                   	push   %rbp
  802127:	48 89 e5             	mov    %rsp,%rbp
  80212a:	48 83 ec 10          	sub    $0x10,%rsp
  80212e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802135:	eb 15                	jmp    80214c <close_all+0x26>
  802137:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80213a:	89 c7                	mov    %eax,%edi
  80213c:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802143:	00 00 00 
  802146:	ff d0                	callq  *%rax
  802148:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80214c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802150:	7e e5                	jle    802137 <close_all+0x11>
  802152:	90                   	nop
  802153:	c9                   	leaveq 
  802154:	c3                   	retq   

0000000000802155 <dup>:
  802155:	55                   	push   %rbp
  802156:	48 89 e5             	mov    %rsp,%rbp
  802159:	48 83 ec 40          	sub    $0x40,%rsp
  80215d:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802160:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802163:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  802167:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80216a:	48 89 d6             	mov    %rdx,%rsi
  80216d:	89 c7                	mov    %eax,%edi
  80216f:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  802176:	00 00 00 
  802179:	ff d0                	callq  *%rax
  80217b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80217e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802182:	79 08                	jns    80218c <dup+0x37>
  802184:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802187:	e9 70 01 00 00       	jmpq   8022fc <dup+0x1a7>
  80218c:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80218f:	89 c7                	mov    %eax,%edi
  802191:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802198:	00 00 00 
  80219b:	ff d0                	callq  *%rax
  80219d:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8021a0:	48 98                	cltq   
  8021a2:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8021a8:	48 c1 e0 0c          	shl    $0xc,%rax
  8021ac:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8021b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8021b4:	48 89 c7             	mov    %rax,%rdi
  8021b7:	48 b8 06 1e 80 00 00 	movabs $0x801e06,%rax
  8021be:	00 00 00 
  8021c1:	ff d0                	callq  *%rax
  8021c3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8021c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8021cb:	48 89 c7             	mov    %rax,%rdi
  8021ce:	48 b8 06 1e 80 00 00 	movabs $0x801e06,%rax
  8021d5:	00 00 00 
  8021d8:	ff d0                	callq  *%rax
  8021da:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8021de:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021e2:	48 c1 e8 15          	shr    $0x15,%rax
  8021e6:	48 89 c2             	mov    %rax,%rdx
  8021e9:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8021f0:	01 00 00 
  8021f3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021f7:	83 e0 01             	and    $0x1,%eax
  8021fa:	48 85 c0             	test   %rax,%rax
  8021fd:	74 71                	je     802270 <dup+0x11b>
  8021ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802203:	48 c1 e8 0c          	shr    $0xc,%rax
  802207:	48 89 c2             	mov    %rax,%rdx
  80220a:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802211:	01 00 00 
  802214:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802218:	83 e0 01             	and    $0x1,%eax
  80221b:	48 85 c0             	test   %rax,%rax
  80221e:	74 50                	je     802270 <dup+0x11b>
  802220:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802224:	48 c1 e8 0c          	shr    $0xc,%rax
  802228:	48 89 c2             	mov    %rax,%rdx
  80222b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802232:	01 00 00 
  802235:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802239:	25 07 0e 00 00       	and    $0xe07,%eax
  80223e:	89 c1                	mov    %eax,%ecx
  802240:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802244:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802248:	41 89 c8             	mov    %ecx,%r8d
  80224b:	48 89 d1             	mov    %rdx,%rcx
  80224e:	ba 00 00 00 00       	mov    $0x0,%edx
  802253:	48 89 c6             	mov    %rax,%rsi
  802256:	bf 00 00 00 00       	mov    $0x0,%edi
  80225b:	48 b8 39 1a 80 00 00 	movabs $0x801a39,%rax
  802262:	00 00 00 
  802265:	ff d0                	callq  *%rax
  802267:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80226a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80226e:	78 55                	js     8022c5 <dup+0x170>
  802270:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802274:	48 c1 e8 0c          	shr    $0xc,%rax
  802278:	48 89 c2             	mov    %rax,%rdx
  80227b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802282:	01 00 00 
  802285:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802289:	25 07 0e 00 00       	and    $0xe07,%eax
  80228e:	89 c1                	mov    %eax,%ecx
  802290:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802294:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802298:	41 89 c8             	mov    %ecx,%r8d
  80229b:	48 89 d1             	mov    %rdx,%rcx
  80229e:	ba 00 00 00 00       	mov    $0x0,%edx
  8022a3:	48 89 c6             	mov    %rax,%rsi
  8022a6:	bf 00 00 00 00       	mov    $0x0,%edi
  8022ab:	48 b8 39 1a 80 00 00 	movabs $0x801a39,%rax
  8022b2:	00 00 00 
  8022b5:	ff d0                	callq  *%rax
  8022b7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022be:	78 08                	js     8022c8 <dup+0x173>
  8022c0:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022c3:	eb 37                	jmp    8022fc <dup+0x1a7>
  8022c5:	90                   	nop
  8022c6:	eb 01                	jmp    8022c9 <dup+0x174>
  8022c8:	90                   	nop
  8022c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022cd:	48 89 c6             	mov    %rax,%rsi
  8022d0:	bf 00 00 00 00       	mov    $0x0,%edi
  8022d5:	48 b8 99 1a 80 00 00 	movabs $0x801a99,%rax
  8022dc:	00 00 00 
  8022df:	ff d0                	callq  *%rax
  8022e1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022e5:	48 89 c6             	mov    %rax,%rsi
  8022e8:	bf 00 00 00 00       	mov    $0x0,%edi
  8022ed:	48 b8 99 1a 80 00 00 	movabs $0x801a99,%rax
  8022f4:	00 00 00 
  8022f7:	ff d0                	callq  *%rax
  8022f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022fc:	c9                   	leaveq 
  8022fd:	c3                   	retq   

00000000008022fe <read>:
  8022fe:	55                   	push   %rbp
  8022ff:	48 89 e5             	mov    %rsp,%rbp
  802302:	48 83 ec 40          	sub    $0x40,%rsp
  802306:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802309:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80230d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802311:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802315:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802318:	48 89 d6             	mov    %rdx,%rsi
  80231b:	89 c7                	mov    %eax,%edi
  80231d:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  802324:	00 00 00 
  802327:	ff d0                	callq  *%rax
  802329:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80232c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802330:	78 24                	js     802356 <read+0x58>
  802332:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802336:	8b 00                	mov    (%rax),%eax
  802338:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80233c:	48 89 d6             	mov    %rdx,%rsi
  80233f:	89 c7                	mov    %eax,%edi
  802341:	48 b8 24 20 80 00 00 	movabs $0x802024,%rax
  802348:	00 00 00 
  80234b:	ff d0                	callq  *%rax
  80234d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802350:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802354:	79 05                	jns    80235b <read+0x5d>
  802356:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802359:	eb 76                	jmp    8023d1 <read+0xd3>
  80235b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80235f:	8b 40 08             	mov    0x8(%rax),%eax
  802362:	83 e0 03             	and    $0x3,%eax
  802365:	83 f8 01             	cmp    $0x1,%eax
  802368:	75 3a                	jne    8023a4 <read+0xa6>
  80236a:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  802371:	00 00 00 
  802374:	48 8b 00             	mov    (%rax),%rax
  802377:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80237d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802380:	89 c6                	mov    %eax,%esi
  802382:	48 bf 17 4a 80 00 00 	movabs $0x804a17,%rdi
  802389:	00 00 00 
  80238c:	b8 00 00 00 00       	mov    $0x0,%eax
  802391:	48 b9 27 05 80 00 00 	movabs $0x800527,%rcx
  802398:	00 00 00 
  80239b:	ff d1                	callq  *%rcx
  80239d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8023a2:	eb 2d                	jmp    8023d1 <read+0xd3>
  8023a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023a8:	48 8b 40 10          	mov    0x10(%rax),%rax
  8023ac:	48 85 c0             	test   %rax,%rax
  8023af:	75 07                	jne    8023b8 <read+0xba>
  8023b1:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8023b6:	eb 19                	jmp    8023d1 <read+0xd3>
  8023b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023bc:	48 8b 40 10          	mov    0x10(%rax),%rax
  8023c0:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8023c4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8023c8:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8023cc:	48 89 cf             	mov    %rcx,%rdi
  8023cf:	ff d0                	callq  *%rax
  8023d1:	c9                   	leaveq 
  8023d2:	c3                   	retq   

00000000008023d3 <readn>:
  8023d3:	55                   	push   %rbp
  8023d4:	48 89 e5             	mov    %rsp,%rbp
  8023d7:	48 83 ec 30          	sub    $0x30,%rsp
  8023db:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8023de:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8023e2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8023e6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8023ed:	eb 47                	jmp    802436 <readn+0x63>
  8023ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023f2:	48 98                	cltq   
  8023f4:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8023f8:	48 29 c2             	sub    %rax,%rdx
  8023fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023fe:	48 63 c8             	movslq %eax,%rcx
  802401:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802405:	48 01 c1             	add    %rax,%rcx
  802408:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80240b:	48 89 ce             	mov    %rcx,%rsi
  80240e:	89 c7                	mov    %eax,%edi
  802410:	48 b8 fe 22 80 00 00 	movabs $0x8022fe,%rax
  802417:	00 00 00 
  80241a:	ff d0                	callq  *%rax
  80241c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80241f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802423:	79 05                	jns    80242a <readn+0x57>
  802425:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802428:	eb 1d                	jmp    802447 <readn+0x74>
  80242a:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80242e:	74 13                	je     802443 <readn+0x70>
  802430:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802433:	01 45 fc             	add    %eax,-0x4(%rbp)
  802436:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802439:	48 98                	cltq   
  80243b:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80243f:	72 ae                	jb     8023ef <readn+0x1c>
  802441:	eb 01                	jmp    802444 <readn+0x71>
  802443:	90                   	nop
  802444:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802447:	c9                   	leaveq 
  802448:	c3                   	retq   

0000000000802449 <write>:
  802449:	55                   	push   %rbp
  80244a:	48 89 e5             	mov    %rsp,%rbp
  80244d:	48 83 ec 40          	sub    $0x40,%rsp
  802451:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802454:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802458:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80245c:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802460:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802463:	48 89 d6             	mov    %rdx,%rsi
  802466:	89 c7                	mov    %eax,%edi
  802468:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  80246f:	00 00 00 
  802472:	ff d0                	callq  *%rax
  802474:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802477:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80247b:	78 24                	js     8024a1 <write+0x58>
  80247d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802481:	8b 00                	mov    (%rax),%eax
  802483:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802487:	48 89 d6             	mov    %rdx,%rsi
  80248a:	89 c7                	mov    %eax,%edi
  80248c:	48 b8 24 20 80 00 00 	movabs $0x802024,%rax
  802493:	00 00 00 
  802496:	ff d0                	callq  *%rax
  802498:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80249b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80249f:	79 05                	jns    8024a6 <write+0x5d>
  8024a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024a4:	eb 75                	jmp    80251b <write+0xd2>
  8024a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024aa:	8b 40 08             	mov    0x8(%rax),%eax
  8024ad:	83 e0 03             	and    $0x3,%eax
  8024b0:	85 c0                	test   %eax,%eax
  8024b2:	75 3a                	jne    8024ee <write+0xa5>
  8024b4:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8024bb:	00 00 00 
  8024be:	48 8b 00             	mov    (%rax),%rax
  8024c1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8024c7:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8024ca:	89 c6                	mov    %eax,%esi
  8024cc:	48 bf 33 4a 80 00 00 	movabs $0x804a33,%rdi
  8024d3:	00 00 00 
  8024d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8024db:	48 b9 27 05 80 00 00 	movabs $0x800527,%rcx
  8024e2:	00 00 00 
  8024e5:	ff d1                	callq  *%rcx
  8024e7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024ec:	eb 2d                	jmp    80251b <write+0xd2>
  8024ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024f2:	48 8b 40 18          	mov    0x18(%rax),%rax
  8024f6:	48 85 c0             	test   %rax,%rax
  8024f9:	75 07                	jne    802502 <write+0xb9>
  8024fb:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802500:	eb 19                	jmp    80251b <write+0xd2>
  802502:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802506:	48 8b 40 18          	mov    0x18(%rax),%rax
  80250a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80250e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802512:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802516:	48 89 cf             	mov    %rcx,%rdi
  802519:	ff d0                	callq  *%rax
  80251b:	c9                   	leaveq 
  80251c:	c3                   	retq   

000000000080251d <seek>:
  80251d:	55                   	push   %rbp
  80251e:	48 89 e5             	mov    %rsp,%rbp
  802521:	48 83 ec 18          	sub    $0x18,%rsp
  802525:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802528:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80252b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80252f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802532:	48 89 d6             	mov    %rdx,%rsi
  802535:	89 c7                	mov    %eax,%edi
  802537:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  80253e:	00 00 00 
  802541:	ff d0                	callq  *%rax
  802543:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802546:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80254a:	79 05                	jns    802551 <seek+0x34>
  80254c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80254f:	eb 0f                	jmp    802560 <seek+0x43>
  802551:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802555:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802558:	89 50 04             	mov    %edx,0x4(%rax)
  80255b:	b8 00 00 00 00       	mov    $0x0,%eax
  802560:	c9                   	leaveq 
  802561:	c3                   	retq   

0000000000802562 <ftruncate>:
  802562:	55                   	push   %rbp
  802563:	48 89 e5             	mov    %rsp,%rbp
  802566:	48 83 ec 30          	sub    $0x30,%rsp
  80256a:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80256d:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802570:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802574:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802577:	48 89 d6             	mov    %rdx,%rsi
  80257a:	89 c7                	mov    %eax,%edi
  80257c:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  802583:	00 00 00 
  802586:	ff d0                	callq  *%rax
  802588:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80258b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80258f:	78 24                	js     8025b5 <ftruncate+0x53>
  802591:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802595:	8b 00                	mov    (%rax),%eax
  802597:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80259b:	48 89 d6             	mov    %rdx,%rsi
  80259e:	89 c7                	mov    %eax,%edi
  8025a0:	48 b8 24 20 80 00 00 	movabs $0x802024,%rax
  8025a7:	00 00 00 
  8025aa:	ff d0                	callq  *%rax
  8025ac:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025af:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025b3:	79 05                	jns    8025ba <ftruncate+0x58>
  8025b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025b8:	eb 72                	jmp    80262c <ftruncate+0xca>
  8025ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025be:	8b 40 08             	mov    0x8(%rax),%eax
  8025c1:	83 e0 03             	and    $0x3,%eax
  8025c4:	85 c0                	test   %eax,%eax
  8025c6:	75 3a                	jne    802602 <ftruncate+0xa0>
  8025c8:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  8025cf:	00 00 00 
  8025d2:	48 8b 00             	mov    (%rax),%rax
  8025d5:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8025db:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025de:	89 c6                	mov    %eax,%esi
  8025e0:	48 bf 50 4a 80 00 00 	movabs $0x804a50,%rdi
  8025e7:	00 00 00 
  8025ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8025ef:	48 b9 27 05 80 00 00 	movabs $0x800527,%rcx
  8025f6:	00 00 00 
  8025f9:	ff d1                	callq  *%rcx
  8025fb:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802600:	eb 2a                	jmp    80262c <ftruncate+0xca>
  802602:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802606:	48 8b 40 30          	mov    0x30(%rax),%rax
  80260a:	48 85 c0             	test   %rax,%rax
  80260d:	75 07                	jne    802616 <ftruncate+0xb4>
  80260f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802614:	eb 16                	jmp    80262c <ftruncate+0xca>
  802616:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80261a:	48 8b 40 30          	mov    0x30(%rax),%rax
  80261e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802622:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802625:	89 ce                	mov    %ecx,%esi
  802627:	48 89 d7             	mov    %rdx,%rdi
  80262a:	ff d0                	callq  *%rax
  80262c:	c9                   	leaveq 
  80262d:	c3                   	retq   

000000000080262e <fstat>:
  80262e:	55                   	push   %rbp
  80262f:	48 89 e5             	mov    %rsp,%rbp
  802632:	48 83 ec 30          	sub    $0x30,%rsp
  802636:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802639:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80263d:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802641:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802644:	48 89 d6             	mov    %rdx,%rsi
  802647:	89 c7                	mov    %eax,%edi
  802649:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  802650:	00 00 00 
  802653:	ff d0                	callq  *%rax
  802655:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802658:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80265c:	78 24                	js     802682 <fstat+0x54>
  80265e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802662:	8b 00                	mov    (%rax),%eax
  802664:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802668:	48 89 d6             	mov    %rdx,%rsi
  80266b:	89 c7                	mov    %eax,%edi
  80266d:	48 b8 24 20 80 00 00 	movabs $0x802024,%rax
  802674:	00 00 00 
  802677:	ff d0                	callq  *%rax
  802679:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80267c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802680:	79 05                	jns    802687 <fstat+0x59>
  802682:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802685:	eb 5e                	jmp    8026e5 <fstat+0xb7>
  802687:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80268b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80268f:	48 85 c0             	test   %rax,%rax
  802692:	75 07                	jne    80269b <fstat+0x6d>
  802694:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802699:	eb 4a                	jmp    8026e5 <fstat+0xb7>
  80269b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80269f:	c6 00 00             	movb   $0x0,(%rax)
  8026a2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026a6:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8026ad:	00 00 00 
  8026b0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026b4:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8026bb:	00 00 00 
  8026be:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8026c2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8026c6:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  8026cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026d1:	48 8b 40 28          	mov    0x28(%rax),%rax
  8026d5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8026d9:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8026dd:	48 89 ce             	mov    %rcx,%rsi
  8026e0:	48 89 d7             	mov    %rdx,%rdi
  8026e3:	ff d0                	callq  *%rax
  8026e5:	c9                   	leaveq 
  8026e6:	c3                   	retq   

00000000008026e7 <stat>:
  8026e7:	55                   	push   %rbp
  8026e8:	48 89 e5             	mov    %rsp,%rbp
  8026eb:	48 83 ec 20          	sub    $0x20,%rsp
  8026ef:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8026f3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026fb:	be 00 00 00 00       	mov    $0x0,%esi
  802700:	48 89 c7             	mov    %rax,%rdi
  802703:	48 b8 d7 27 80 00 00 	movabs $0x8027d7,%rax
  80270a:	00 00 00 
  80270d:	ff d0                	callq  *%rax
  80270f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802712:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802716:	79 05                	jns    80271d <stat+0x36>
  802718:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80271b:	eb 2f                	jmp    80274c <stat+0x65>
  80271d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802721:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802724:	48 89 d6             	mov    %rdx,%rsi
  802727:	89 c7                	mov    %eax,%edi
  802729:	48 b8 2e 26 80 00 00 	movabs $0x80262e,%rax
  802730:	00 00 00 
  802733:	ff d0                	callq  *%rax
  802735:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802738:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80273b:	89 c7                	mov    %eax,%edi
  80273d:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802744:	00 00 00 
  802747:	ff d0                	callq  *%rax
  802749:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80274c:	c9                   	leaveq 
  80274d:	c3                   	retq   

000000000080274e <fsipc>:
  80274e:	55                   	push   %rbp
  80274f:	48 89 e5             	mov    %rsp,%rbp
  802752:	48 83 ec 10          	sub    $0x10,%rsp
  802756:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802759:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80275d:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802764:	00 00 00 
  802767:	8b 00                	mov    (%rax),%eax
  802769:	85 c0                	test   %eax,%eax
  80276b:	75 1f                	jne    80278c <fsipc+0x3e>
  80276d:	bf 01 00 00 00       	mov    $0x1,%edi
  802772:	48 b8 62 43 80 00 00 	movabs $0x804362,%rax
  802779:	00 00 00 
  80277c:	ff d0                	callq  *%rax
  80277e:	89 c2                	mov    %eax,%edx
  802780:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802787:	00 00 00 
  80278a:	89 10                	mov    %edx,(%rax)
  80278c:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802793:	00 00 00 
  802796:	8b 00                	mov    (%rax),%eax
  802798:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80279b:	b9 07 00 00 00       	mov    $0x7,%ecx
  8027a0:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8027a7:	00 00 00 
  8027aa:	89 c7                	mov    %eax,%edi
  8027ac:	48 b8 58 42 80 00 00 	movabs $0x804258,%rax
  8027b3:	00 00 00 
  8027b6:	ff d0                	callq  *%rax
  8027b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027bc:	ba 00 00 00 00       	mov    $0x0,%edx
  8027c1:	48 89 c6             	mov    %rax,%rsi
  8027c4:	bf 00 00 00 00       	mov    $0x0,%edi
  8027c9:	48 b8 97 41 80 00 00 	movabs $0x804197,%rax
  8027d0:	00 00 00 
  8027d3:	ff d0                	callq  *%rax
  8027d5:	c9                   	leaveq 
  8027d6:	c3                   	retq   

00000000008027d7 <open>:
  8027d7:	55                   	push   %rbp
  8027d8:	48 89 e5             	mov    %rsp,%rbp
  8027db:	48 83 ec 20          	sub    $0x20,%rsp
  8027df:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8027e3:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8027e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027ea:	48 89 c7             	mov    %rax,%rdi
  8027ed:	48 b8 4b 10 80 00 00 	movabs $0x80104b,%rax
  8027f4:	00 00 00 
  8027f7:	ff d0                	callq  *%rax
  8027f9:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8027fe:	7e 0a                	jle    80280a <open+0x33>
  802800:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802805:	e9 a5 00 00 00       	jmpq   8028af <open+0xd8>
  80280a:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  80280e:	48 89 c7             	mov    %rax,%rdi
  802811:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  802818:	00 00 00 
  80281b:	ff d0                	callq  *%rax
  80281d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802820:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802824:	79 08                	jns    80282e <open+0x57>
  802826:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802829:	e9 81 00 00 00       	jmpq   8028af <open+0xd8>
  80282e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802832:	48 89 c6             	mov    %rax,%rsi
  802835:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  80283c:	00 00 00 
  80283f:	48 b8 b7 10 80 00 00 	movabs $0x8010b7,%rax
  802846:	00 00 00 
  802849:	ff d0                	callq  *%rax
  80284b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802852:	00 00 00 
  802855:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802858:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  80285e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802862:	48 89 c6             	mov    %rax,%rsi
  802865:	bf 01 00 00 00       	mov    $0x1,%edi
  80286a:	48 b8 4e 27 80 00 00 	movabs $0x80274e,%rax
  802871:	00 00 00 
  802874:	ff d0                	callq  *%rax
  802876:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802879:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80287d:	79 1d                	jns    80289c <open+0xc5>
  80287f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802883:	be 00 00 00 00       	mov    $0x0,%esi
  802888:	48 89 c7             	mov    %rax,%rdi
  80288b:	48 b8 59 1f 80 00 00 	movabs $0x801f59,%rax
  802892:	00 00 00 
  802895:	ff d0                	callq  *%rax
  802897:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80289a:	eb 13                	jmp    8028af <open+0xd8>
  80289c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8028a0:	48 89 c7             	mov    %rax,%rdi
  8028a3:	48 b8 e3 1d 80 00 00 	movabs $0x801de3,%rax
  8028aa:	00 00 00 
  8028ad:	ff d0                	callq  *%rax
  8028af:	c9                   	leaveq 
  8028b0:	c3                   	retq   

00000000008028b1 <devfile_flush>:
  8028b1:	55                   	push   %rbp
  8028b2:	48 89 e5             	mov    %rsp,%rbp
  8028b5:	48 83 ec 10          	sub    $0x10,%rsp
  8028b9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8028bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028c1:	8b 50 0c             	mov    0xc(%rax),%edx
  8028c4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8028cb:	00 00 00 
  8028ce:	89 10                	mov    %edx,(%rax)
  8028d0:	be 00 00 00 00       	mov    $0x0,%esi
  8028d5:	bf 06 00 00 00       	mov    $0x6,%edi
  8028da:	48 b8 4e 27 80 00 00 	movabs $0x80274e,%rax
  8028e1:	00 00 00 
  8028e4:	ff d0                	callq  *%rax
  8028e6:	c9                   	leaveq 
  8028e7:	c3                   	retq   

00000000008028e8 <devfile_read>:
  8028e8:	55                   	push   %rbp
  8028e9:	48 89 e5             	mov    %rsp,%rbp
  8028ec:	48 83 ec 30          	sub    $0x30,%rsp
  8028f0:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8028f4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8028f8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8028fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802900:	8b 50 0c             	mov    0xc(%rax),%edx
  802903:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80290a:	00 00 00 
  80290d:	89 10                	mov    %edx,(%rax)
  80290f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802916:	00 00 00 
  802919:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80291d:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802921:	be 00 00 00 00       	mov    $0x0,%esi
  802926:	bf 03 00 00 00       	mov    $0x3,%edi
  80292b:	48 b8 4e 27 80 00 00 	movabs $0x80274e,%rax
  802932:	00 00 00 
  802935:	ff d0                	callq  *%rax
  802937:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80293a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80293e:	79 08                	jns    802948 <devfile_read+0x60>
  802940:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802943:	e9 a4 00 00 00       	jmpq   8029ec <devfile_read+0x104>
  802948:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80294b:	48 98                	cltq   
  80294d:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802951:	76 35                	jbe    802988 <devfile_read+0xa0>
  802953:	48 b9 76 4a 80 00 00 	movabs $0x804a76,%rcx
  80295a:	00 00 00 
  80295d:	48 ba 7d 4a 80 00 00 	movabs $0x804a7d,%rdx
  802964:	00 00 00 
  802967:	be 89 00 00 00       	mov    $0x89,%esi
  80296c:	48 bf 92 4a 80 00 00 	movabs $0x804a92,%rdi
  802973:	00 00 00 
  802976:	b8 00 00 00 00       	mov    $0x0,%eax
  80297b:	49 b8 ed 02 80 00 00 	movabs $0x8002ed,%r8
  802982:	00 00 00 
  802985:	41 ff d0             	callq  *%r8
  802988:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  80298f:	7e 35                	jle    8029c6 <devfile_read+0xde>
  802991:	48 b9 a0 4a 80 00 00 	movabs $0x804aa0,%rcx
  802998:	00 00 00 
  80299b:	48 ba 7d 4a 80 00 00 	movabs $0x804a7d,%rdx
  8029a2:	00 00 00 
  8029a5:	be 8a 00 00 00       	mov    $0x8a,%esi
  8029aa:	48 bf 92 4a 80 00 00 	movabs $0x804a92,%rdi
  8029b1:	00 00 00 
  8029b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8029b9:	49 b8 ed 02 80 00 00 	movabs $0x8002ed,%r8
  8029c0:	00 00 00 
  8029c3:	41 ff d0             	callq  *%r8
  8029c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029c9:	48 63 d0             	movslq %eax,%rdx
  8029cc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029d0:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8029d7:	00 00 00 
  8029da:	48 89 c7             	mov    %rax,%rdi
  8029dd:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  8029e4:	00 00 00 
  8029e7:	ff d0                	callq  *%rax
  8029e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ec:	c9                   	leaveq 
  8029ed:	c3                   	retq   

00000000008029ee <devfile_write>:
  8029ee:	55                   	push   %rbp
  8029ef:	48 89 e5             	mov    %rsp,%rbp
  8029f2:	48 83 ec 40          	sub    $0x40,%rsp
  8029f6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8029fa:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8029fe:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a02:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802a06:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802a0a:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802a11:	00 
  802a12:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a16:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802a1a:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802a1f:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802a23:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802a27:	8b 50 0c             	mov    0xc(%rax),%edx
  802a2a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802a31:	00 00 00 
  802a34:	89 10                	mov    %edx,(%rax)
  802a36:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802a3d:	00 00 00 
  802a40:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a44:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802a48:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a4c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a50:	48 89 c6             	mov    %rax,%rsi
  802a53:	48 bf 10 a0 80 00 00 	movabs $0x80a010,%rdi
  802a5a:	00 00 00 
  802a5d:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  802a64:	00 00 00 
  802a67:	ff d0                	callq  *%rax
  802a69:	be 00 00 00 00       	mov    $0x0,%esi
  802a6e:	bf 04 00 00 00       	mov    $0x4,%edi
  802a73:	48 b8 4e 27 80 00 00 	movabs $0x80274e,%rax
  802a7a:	00 00 00 
  802a7d:	ff d0                	callq  *%rax
  802a7f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802a82:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802a86:	79 05                	jns    802a8d <devfile_write+0x9f>
  802a88:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a8b:	eb 43                	jmp    802ad0 <devfile_write+0xe2>
  802a8d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a90:	48 98                	cltq   
  802a92:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802a96:	76 35                	jbe    802acd <devfile_write+0xdf>
  802a98:	48 b9 76 4a 80 00 00 	movabs $0x804a76,%rcx
  802a9f:	00 00 00 
  802aa2:	48 ba 7d 4a 80 00 00 	movabs $0x804a7d,%rdx
  802aa9:	00 00 00 
  802aac:	be a8 00 00 00       	mov    $0xa8,%esi
  802ab1:	48 bf 92 4a 80 00 00 	movabs $0x804a92,%rdi
  802ab8:	00 00 00 
  802abb:	b8 00 00 00 00       	mov    $0x0,%eax
  802ac0:	49 b8 ed 02 80 00 00 	movabs $0x8002ed,%r8
  802ac7:	00 00 00 
  802aca:	41 ff d0             	callq  *%r8
  802acd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ad0:	c9                   	leaveq 
  802ad1:	c3                   	retq   

0000000000802ad2 <devfile_stat>:
  802ad2:	55                   	push   %rbp
  802ad3:	48 89 e5             	mov    %rsp,%rbp
  802ad6:	48 83 ec 20          	sub    $0x20,%rsp
  802ada:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ade:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ae2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ae6:	8b 50 0c             	mov    0xc(%rax),%edx
  802ae9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802af0:	00 00 00 
  802af3:	89 10                	mov    %edx,(%rax)
  802af5:	be 00 00 00 00       	mov    $0x0,%esi
  802afa:	bf 05 00 00 00       	mov    $0x5,%edi
  802aff:	48 b8 4e 27 80 00 00 	movabs $0x80274e,%rax
  802b06:	00 00 00 
  802b09:	ff d0                	callq  *%rax
  802b0b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b0e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b12:	79 05                	jns    802b19 <devfile_stat+0x47>
  802b14:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b17:	eb 56                	jmp    802b6f <devfile_stat+0x9d>
  802b19:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b1d:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  802b24:	00 00 00 
  802b27:	48 89 c7             	mov    %rax,%rdi
  802b2a:	48 b8 b7 10 80 00 00 	movabs $0x8010b7,%rax
  802b31:	00 00 00 
  802b34:	ff d0                	callq  *%rax
  802b36:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802b3d:	00 00 00 
  802b40:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802b46:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b4a:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802b50:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802b57:	00 00 00 
  802b5a:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802b60:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b64:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802b6a:	b8 00 00 00 00       	mov    $0x0,%eax
  802b6f:	c9                   	leaveq 
  802b70:	c3                   	retq   

0000000000802b71 <devfile_trunc>:
  802b71:	55                   	push   %rbp
  802b72:	48 89 e5             	mov    %rsp,%rbp
  802b75:	48 83 ec 10          	sub    $0x10,%rsp
  802b79:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b7d:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802b80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b84:	8b 50 0c             	mov    0xc(%rax),%edx
  802b87:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802b8e:	00 00 00 
  802b91:	89 10                	mov    %edx,(%rax)
  802b93:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802b9a:	00 00 00 
  802b9d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802ba0:	89 50 04             	mov    %edx,0x4(%rax)
  802ba3:	be 00 00 00 00       	mov    $0x0,%esi
  802ba8:	bf 02 00 00 00       	mov    $0x2,%edi
  802bad:	48 b8 4e 27 80 00 00 	movabs $0x80274e,%rax
  802bb4:	00 00 00 
  802bb7:	ff d0                	callq  *%rax
  802bb9:	c9                   	leaveq 
  802bba:	c3                   	retq   

0000000000802bbb <remove>:
  802bbb:	55                   	push   %rbp
  802bbc:	48 89 e5             	mov    %rsp,%rbp
  802bbf:	48 83 ec 10          	sub    $0x10,%rsp
  802bc3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802bc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bcb:	48 89 c7             	mov    %rax,%rdi
  802bce:	48 b8 4b 10 80 00 00 	movabs $0x80104b,%rax
  802bd5:	00 00 00 
  802bd8:	ff d0                	callq  *%rax
  802bda:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802bdf:	7e 07                	jle    802be8 <remove+0x2d>
  802be1:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802be6:	eb 33                	jmp    802c1b <remove+0x60>
  802be8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802bec:	48 89 c6             	mov    %rax,%rsi
  802bef:	48 bf 00 a0 80 00 00 	movabs $0x80a000,%rdi
  802bf6:	00 00 00 
  802bf9:	48 b8 b7 10 80 00 00 	movabs $0x8010b7,%rax
  802c00:	00 00 00 
  802c03:	ff d0                	callq  *%rax
  802c05:	be 00 00 00 00       	mov    $0x0,%esi
  802c0a:	bf 07 00 00 00       	mov    $0x7,%edi
  802c0f:	48 b8 4e 27 80 00 00 	movabs $0x80274e,%rax
  802c16:	00 00 00 
  802c19:	ff d0                	callq  *%rax
  802c1b:	c9                   	leaveq 
  802c1c:	c3                   	retq   

0000000000802c1d <sync>:
  802c1d:	55                   	push   %rbp
  802c1e:	48 89 e5             	mov    %rsp,%rbp
  802c21:	be 00 00 00 00       	mov    $0x0,%esi
  802c26:	bf 08 00 00 00       	mov    $0x8,%edi
  802c2b:	48 b8 4e 27 80 00 00 	movabs $0x80274e,%rax
  802c32:	00 00 00 
  802c35:	ff d0                	callq  *%rax
  802c37:	5d                   	pop    %rbp
  802c38:	c3                   	retq   

0000000000802c39 <copy>:
  802c39:	55                   	push   %rbp
  802c3a:	48 89 e5             	mov    %rsp,%rbp
  802c3d:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802c44:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802c4b:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802c52:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802c59:	be 00 00 00 00       	mov    $0x0,%esi
  802c5e:	48 89 c7             	mov    %rax,%rdi
  802c61:	48 b8 d7 27 80 00 00 	movabs $0x8027d7,%rax
  802c68:	00 00 00 
  802c6b:	ff d0                	callq  *%rax
  802c6d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c70:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c74:	79 28                	jns    802c9e <copy+0x65>
  802c76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c79:	89 c6                	mov    %eax,%esi
  802c7b:	48 bf ac 4a 80 00 00 	movabs $0x804aac,%rdi
  802c82:	00 00 00 
  802c85:	b8 00 00 00 00       	mov    $0x0,%eax
  802c8a:	48 ba 27 05 80 00 00 	movabs $0x800527,%rdx
  802c91:	00 00 00 
  802c94:	ff d2                	callq  *%rdx
  802c96:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c99:	e9 76 01 00 00       	jmpq   802e14 <copy+0x1db>
  802c9e:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802ca5:	be 01 01 00 00       	mov    $0x101,%esi
  802caa:	48 89 c7             	mov    %rax,%rdi
  802cad:	48 b8 d7 27 80 00 00 	movabs $0x8027d7,%rax
  802cb4:	00 00 00 
  802cb7:	ff d0                	callq  *%rax
  802cb9:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802cbc:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802cc0:	0f 89 ad 00 00 00    	jns    802d73 <copy+0x13a>
  802cc6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cc9:	89 c6                	mov    %eax,%esi
  802ccb:	48 bf c2 4a 80 00 00 	movabs $0x804ac2,%rdi
  802cd2:	00 00 00 
  802cd5:	b8 00 00 00 00       	mov    $0x0,%eax
  802cda:	48 ba 27 05 80 00 00 	movabs $0x800527,%rdx
  802ce1:	00 00 00 
  802ce4:	ff d2                	callq  *%rdx
  802ce6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ce9:	89 c7                	mov    %eax,%edi
  802ceb:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802cf2:	00 00 00 
  802cf5:	ff d0                	callq  *%rax
  802cf7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cfa:	e9 15 01 00 00       	jmpq   802e14 <copy+0x1db>
  802cff:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d02:	48 63 d0             	movslq %eax,%rdx
  802d05:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d0c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d0f:	48 89 ce             	mov    %rcx,%rsi
  802d12:	89 c7                	mov    %eax,%edi
  802d14:	48 b8 49 24 80 00 00 	movabs $0x802449,%rax
  802d1b:	00 00 00 
  802d1e:	ff d0                	callq  *%rax
  802d20:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802d23:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802d27:	79 4a                	jns    802d73 <copy+0x13a>
  802d29:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d2c:	89 c6                	mov    %eax,%esi
  802d2e:	48 bf dc 4a 80 00 00 	movabs $0x804adc,%rdi
  802d35:	00 00 00 
  802d38:	b8 00 00 00 00       	mov    $0x0,%eax
  802d3d:	48 ba 27 05 80 00 00 	movabs $0x800527,%rdx
  802d44:	00 00 00 
  802d47:	ff d2                	callq  *%rdx
  802d49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d4c:	89 c7                	mov    %eax,%edi
  802d4e:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802d55:	00 00 00 
  802d58:	ff d0                	callq  *%rax
  802d5a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d5d:	89 c7                	mov    %eax,%edi
  802d5f:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802d66:	00 00 00 
  802d69:	ff d0                	callq  *%rax
  802d6b:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d6e:	e9 a1 00 00 00       	jmpq   802e14 <copy+0x1db>
  802d73:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d7d:	ba 00 02 00 00       	mov    $0x200,%edx
  802d82:	48 89 ce             	mov    %rcx,%rsi
  802d85:	89 c7                	mov    %eax,%edi
  802d87:	48 b8 fe 22 80 00 00 	movabs $0x8022fe,%rax
  802d8e:	00 00 00 
  802d91:	ff d0                	callq  *%rax
  802d93:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802d96:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802d9a:	0f 8f 5f ff ff ff    	jg     802cff <copy+0xc6>
  802da0:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802da4:	79 47                	jns    802ded <copy+0x1b4>
  802da6:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802da9:	89 c6                	mov    %eax,%esi
  802dab:	48 bf ef 4a 80 00 00 	movabs $0x804aef,%rdi
  802db2:	00 00 00 
  802db5:	b8 00 00 00 00       	mov    $0x0,%eax
  802dba:	48 ba 27 05 80 00 00 	movabs $0x800527,%rdx
  802dc1:	00 00 00 
  802dc4:	ff d2                	callq  *%rdx
  802dc6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dc9:	89 c7                	mov    %eax,%edi
  802dcb:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802dd2:	00 00 00 
  802dd5:	ff d0                	callq  *%rax
  802dd7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dda:	89 c7                	mov    %eax,%edi
  802ddc:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802de3:	00 00 00 
  802de6:	ff d0                	callq  *%rax
  802de8:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802deb:	eb 27                	jmp    802e14 <copy+0x1db>
  802ded:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802df0:	89 c7                	mov    %eax,%edi
  802df2:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802df9:	00 00 00 
  802dfc:	ff d0                	callq  *%rax
  802dfe:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e01:	89 c7                	mov    %eax,%edi
  802e03:	48 b8 db 20 80 00 00 	movabs $0x8020db,%rax
  802e0a:	00 00 00 
  802e0d:	ff d0                	callq  *%rax
  802e0f:	b8 00 00 00 00       	mov    $0x0,%eax
  802e14:	c9                   	leaveq 
  802e15:	c3                   	retq   

0000000000802e16 <writebuf>:
  802e16:	55                   	push   %rbp
  802e17:	48 89 e5             	mov    %rsp,%rbp
  802e1a:	48 83 ec 20          	sub    $0x20,%rsp
  802e1e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802e22:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e26:	8b 40 0c             	mov    0xc(%rax),%eax
  802e29:	85 c0                	test   %eax,%eax
  802e2b:	7e 67                	jle    802e94 <writebuf+0x7e>
  802e2d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e31:	8b 40 04             	mov    0x4(%rax),%eax
  802e34:	48 63 d0             	movslq %eax,%rdx
  802e37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e3b:	48 8d 48 10          	lea    0x10(%rax),%rcx
  802e3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e43:	8b 00                	mov    (%rax),%eax
  802e45:	48 89 ce             	mov    %rcx,%rsi
  802e48:	89 c7                	mov    %eax,%edi
  802e4a:	48 b8 49 24 80 00 00 	movabs $0x802449,%rax
  802e51:	00 00 00 
  802e54:	ff d0                	callq  *%rax
  802e56:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e59:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e5d:	7e 13                	jle    802e72 <writebuf+0x5c>
  802e5f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e63:	8b 50 08             	mov    0x8(%rax),%edx
  802e66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e69:	01 c2                	add    %eax,%edx
  802e6b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e6f:	89 50 08             	mov    %edx,0x8(%rax)
  802e72:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e76:	8b 40 04             	mov    0x4(%rax),%eax
  802e79:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  802e7c:	74 16                	je     802e94 <writebuf+0x7e>
  802e7e:	b8 00 00 00 00       	mov    $0x0,%eax
  802e83:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e87:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  802e8b:	89 c2                	mov    %eax,%edx
  802e8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e91:	89 50 0c             	mov    %edx,0xc(%rax)
  802e94:	90                   	nop
  802e95:	c9                   	leaveq 
  802e96:	c3                   	retq   

0000000000802e97 <putch>:
  802e97:	55                   	push   %rbp
  802e98:	48 89 e5             	mov    %rsp,%rbp
  802e9b:	48 83 ec 20          	sub    $0x20,%rsp
  802e9f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ea2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ea6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802eaa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802eae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802eb2:	8b 40 04             	mov    0x4(%rax),%eax
  802eb5:	8d 48 01             	lea    0x1(%rax),%ecx
  802eb8:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802ebc:	89 4a 04             	mov    %ecx,0x4(%rdx)
  802ebf:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802ec2:	89 d1                	mov    %edx,%ecx
  802ec4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802ec8:	48 98                	cltq   
  802eca:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  802ece:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ed2:	8b 40 04             	mov    0x4(%rax),%eax
  802ed5:	3d 00 01 00 00       	cmp    $0x100,%eax
  802eda:	75 1e                	jne    802efa <putch+0x63>
  802edc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ee0:	48 89 c7             	mov    %rax,%rdi
  802ee3:	48 b8 16 2e 80 00 00 	movabs $0x802e16,%rax
  802eea:	00 00 00 
  802eed:	ff d0                	callq  *%rax
  802eef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ef3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  802efa:	90                   	nop
  802efb:	c9                   	leaveq 
  802efc:	c3                   	retq   

0000000000802efd <vfprintf>:
  802efd:	55                   	push   %rbp
  802efe:	48 89 e5             	mov    %rsp,%rbp
  802f01:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  802f08:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  802f0e:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  802f15:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  802f1c:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  802f22:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  802f28:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  802f2f:	00 00 00 
  802f32:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  802f39:	00 00 00 
  802f3c:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  802f43:	00 00 00 
  802f46:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  802f4d:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  802f54:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  802f5b:	48 89 c6             	mov    %rax,%rsi
  802f5e:	48 bf 97 2e 80 00 00 	movabs $0x802e97,%rdi
  802f65:	00 00 00 
  802f68:	48 b8 c5 08 80 00 00 	movabs $0x8008c5,%rax
  802f6f:	00 00 00 
  802f72:	ff d0                	callq  *%rax
  802f74:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  802f7a:	85 c0                	test   %eax,%eax
  802f7c:	7e 16                	jle    802f94 <vfprintf+0x97>
  802f7e:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  802f85:	48 89 c7             	mov    %rax,%rdi
  802f88:	48 b8 16 2e 80 00 00 	movabs $0x802e16,%rax
  802f8f:	00 00 00 
  802f92:	ff d0                	callq  *%rax
  802f94:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  802f9a:	85 c0                	test   %eax,%eax
  802f9c:	74 08                	je     802fa6 <vfprintf+0xa9>
  802f9e:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  802fa4:	eb 06                	jmp    802fac <vfprintf+0xaf>
  802fa6:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  802fac:	c9                   	leaveq 
  802fad:	c3                   	retq   

0000000000802fae <fprintf>:
  802fae:	55                   	push   %rbp
  802faf:	48 89 e5             	mov    %rsp,%rbp
  802fb2:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  802fb9:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  802fbf:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  802fc6:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  802fcd:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  802fd4:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  802fdb:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  802fe2:	84 c0                	test   %al,%al
  802fe4:	74 20                	je     803006 <fprintf+0x58>
  802fe6:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  802fea:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  802fee:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  802ff2:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  802ff6:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  802ffa:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  802ffe:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803002:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803006:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  80300d:	00 00 00 
  803010:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803017:	00 00 00 
  80301a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80301e:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803025:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80302c:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803033:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80303a:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  803041:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803047:	48 89 ce             	mov    %rcx,%rsi
  80304a:	89 c7                	mov    %eax,%edi
  80304c:	48 b8 fd 2e 80 00 00 	movabs $0x802efd,%rax
  803053:	00 00 00 
  803056:	ff d0                	callq  *%rax
  803058:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80305e:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803064:	c9                   	leaveq 
  803065:	c3                   	retq   

0000000000803066 <printf>:
  803066:	55                   	push   %rbp
  803067:	48 89 e5             	mov    %rsp,%rbp
  80306a:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  803071:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  803078:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  80307f:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803086:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80308d:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803094:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80309b:	84 c0                	test   %al,%al
  80309d:	74 20                	je     8030bf <printf+0x59>
  80309f:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8030a3:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8030a7:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8030ab:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8030af:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8030b3:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8030b7:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8030bb:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8030bf:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8030c6:	00 00 00 
  8030c9:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8030d0:	00 00 00 
  8030d3:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8030d7:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8030de:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8030e5:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8030ec:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8030f3:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8030fa:	48 89 c6             	mov    %rax,%rsi
  8030fd:	bf 01 00 00 00       	mov    $0x1,%edi
  803102:	48 b8 fd 2e 80 00 00 	movabs $0x802efd,%rax
  803109:	00 00 00 
  80310c:	ff d0                	callq  *%rax
  80310e:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803114:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80311a:	c9                   	leaveq 
  80311b:	c3                   	retq   

000000000080311c <fd2sockid>:
  80311c:	55                   	push   %rbp
  80311d:	48 89 e5             	mov    %rsp,%rbp
  803120:	48 83 ec 20          	sub    $0x20,%rsp
  803124:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803127:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80312b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80312e:	48 89 d6             	mov    %rdx,%rsi
  803131:	89 c7                	mov    %eax,%edi
  803133:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  80313a:	00 00 00 
  80313d:	ff d0                	callq  *%rax
  80313f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803142:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803146:	79 05                	jns    80314d <fd2sockid+0x31>
  803148:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80314b:	eb 24                	jmp    803171 <fd2sockid+0x55>
  80314d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803151:	8b 10                	mov    (%rax),%edx
  803153:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  80315a:	00 00 00 
  80315d:	8b 00                	mov    (%rax),%eax
  80315f:	39 c2                	cmp    %eax,%edx
  803161:	74 07                	je     80316a <fd2sockid+0x4e>
  803163:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803168:	eb 07                	jmp    803171 <fd2sockid+0x55>
  80316a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80316e:	8b 40 0c             	mov    0xc(%rax),%eax
  803171:	c9                   	leaveq 
  803172:	c3                   	retq   

0000000000803173 <alloc_sockfd>:
  803173:	55                   	push   %rbp
  803174:	48 89 e5             	mov    %rsp,%rbp
  803177:	48 83 ec 20          	sub    $0x20,%rsp
  80317b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80317e:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803182:	48 89 c7             	mov    %rax,%rdi
  803185:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  80318c:	00 00 00 
  80318f:	ff d0                	callq  *%rax
  803191:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803194:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803198:	78 26                	js     8031c0 <alloc_sockfd+0x4d>
  80319a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80319e:	ba 07 04 00 00       	mov    $0x407,%edx
  8031a3:	48 89 c6             	mov    %rax,%rsi
  8031a6:	bf 00 00 00 00       	mov    $0x0,%edi
  8031ab:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  8031b2:	00 00 00 
  8031b5:	ff d0                	callq  *%rax
  8031b7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031be:	79 16                	jns    8031d6 <alloc_sockfd+0x63>
  8031c0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8031c3:	89 c7                	mov    %eax,%edi
  8031c5:	48 b8 82 36 80 00 00 	movabs $0x803682,%rax
  8031cc:	00 00 00 
  8031cf:	ff d0                	callq  *%rax
  8031d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031d4:	eb 3a                	jmp    803210 <alloc_sockfd+0x9d>
  8031d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031da:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  8031e1:	00 00 00 
  8031e4:	8b 12                	mov    (%rdx),%edx
  8031e6:	89 10                	mov    %edx,(%rax)
  8031e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031ec:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8031f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8031f7:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8031fa:	89 50 0c             	mov    %edx,0xc(%rax)
  8031fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803201:	48 89 c7             	mov    %rax,%rdi
  803204:	48 b8 e3 1d 80 00 00 	movabs $0x801de3,%rax
  80320b:	00 00 00 
  80320e:	ff d0                	callq  *%rax
  803210:	c9                   	leaveq 
  803211:	c3                   	retq   

0000000000803212 <accept>:
  803212:	55                   	push   %rbp
  803213:	48 89 e5             	mov    %rsp,%rbp
  803216:	48 83 ec 30          	sub    $0x30,%rsp
  80321a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80321d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803221:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803225:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803228:	89 c7                	mov    %eax,%edi
  80322a:	48 b8 1c 31 80 00 00 	movabs $0x80311c,%rax
  803231:	00 00 00 
  803234:	ff d0                	callq  *%rax
  803236:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803239:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80323d:	79 05                	jns    803244 <accept+0x32>
  80323f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803242:	eb 3b                	jmp    80327f <accept+0x6d>
  803244:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803248:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80324c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80324f:	48 89 ce             	mov    %rcx,%rsi
  803252:	89 c7                	mov    %eax,%edi
  803254:	48 b8 5f 35 80 00 00 	movabs $0x80355f,%rax
  80325b:	00 00 00 
  80325e:	ff d0                	callq  *%rax
  803260:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803263:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803267:	79 05                	jns    80326e <accept+0x5c>
  803269:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80326c:	eb 11                	jmp    80327f <accept+0x6d>
  80326e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803271:	89 c7                	mov    %eax,%edi
  803273:	48 b8 73 31 80 00 00 	movabs $0x803173,%rax
  80327a:	00 00 00 
  80327d:	ff d0                	callq  *%rax
  80327f:	c9                   	leaveq 
  803280:	c3                   	retq   

0000000000803281 <bind>:
  803281:	55                   	push   %rbp
  803282:	48 89 e5             	mov    %rsp,%rbp
  803285:	48 83 ec 20          	sub    $0x20,%rsp
  803289:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80328c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803290:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803293:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803296:	89 c7                	mov    %eax,%edi
  803298:	48 b8 1c 31 80 00 00 	movabs $0x80311c,%rax
  80329f:	00 00 00 
  8032a2:	ff d0                	callq  *%rax
  8032a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032ab:	79 05                	jns    8032b2 <bind+0x31>
  8032ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032b0:	eb 1b                	jmp    8032cd <bind+0x4c>
  8032b2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8032b5:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8032b9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032bc:	48 89 ce             	mov    %rcx,%rsi
  8032bf:	89 c7                	mov    %eax,%edi
  8032c1:	48 b8 de 35 80 00 00 	movabs $0x8035de,%rax
  8032c8:	00 00 00 
  8032cb:	ff d0                	callq  *%rax
  8032cd:	c9                   	leaveq 
  8032ce:	c3                   	retq   

00000000008032cf <shutdown>:
  8032cf:	55                   	push   %rbp
  8032d0:	48 89 e5             	mov    %rsp,%rbp
  8032d3:	48 83 ec 20          	sub    $0x20,%rsp
  8032d7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032da:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8032dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8032e0:	89 c7                	mov    %eax,%edi
  8032e2:	48 b8 1c 31 80 00 00 	movabs $0x80311c,%rax
  8032e9:	00 00 00 
  8032ec:	ff d0                	callq  *%rax
  8032ee:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032f1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032f5:	79 05                	jns    8032fc <shutdown+0x2d>
  8032f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8032fa:	eb 16                	jmp    803312 <shutdown+0x43>
  8032fc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8032ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803302:	89 d6                	mov    %edx,%esi
  803304:	89 c7                	mov    %eax,%edi
  803306:	48 b8 42 36 80 00 00 	movabs $0x803642,%rax
  80330d:	00 00 00 
  803310:	ff d0                	callq  *%rax
  803312:	c9                   	leaveq 
  803313:	c3                   	retq   

0000000000803314 <devsock_close>:
  803314:	55                   	push   %rbp
  803315:	48 89 e5             	mov    %rsp,%rbp
  803318:	48 83 ec 10          	sub    $0x10,%rsp
  80331c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803320:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803324:	48 89 c7             	mov    %rax,%rdi
  803327:	48 b8 d3 43 80 00 00 	movabs $0x8043d3,%rax
  80332e:	00 00 00 
  803331:	ff d0                	callq  *%rax
  803333:	83 f8 01             	cmp    $0x1,%eax
  803336:	75 17                	jne    80334f <devsock_close+0x3b>
  803338:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80333c:	8b 40 0c             	mov    0xc(%rax),%eax
  80333f:	89 c7                	mov    %eax,%edi
  803341:	48 b8 82 36 80 00 00 	movabs $0x803682,%rax
  803348:	00 00 00 
  80334b:	ff d0                	callq  *%rax
  80334d:	eb 05                	jmp    803354 <devsock_close+0x40>
  80334f:	b8 00 00 00 00       	mov    $0x0,%eax
  803354:	c9                   	leaveq 
  803355:	c3                   	retq   

0000000000803356 <connect>:
  803356:	55                   	push   %rbp
  803357:	48 89 e5             	mov    %rsp,%rbp
  80335a:	48 83 ec 20          	sub    $0x20,%rsp
  80335e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803361:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803365:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803368:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80336b:	89 c7                	mov    %eax,%edi
  80336d:	48 b8 1c 31 80 00 00 	movabs $0x80311c,%rax
  803374:	00 00 00 
  803377:	ff d0                	callq  *%rax
  803379:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80337c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803380:	79 05                	jns    803387 <connect+0x31>
  803382:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803385:	eb 1b                	jmp    8033a2 <connect+0x4c>
  803387:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80338a:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80338e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803391:	48 89 ce             	mov    %rcx,%rsi
  803394:	89 c7                	mov    %eax,%edi
  803396:	48 b8 af 36 80 00 00 	movabs $0x8036af,%rax
  80339d:	00 00 00 
  8033a0:	ff d0                	callq  *%rax
  8033a2:	c9                   	leaveq 
  8033a3:	c3                   	retq   

00000000008033a4 <listen>:
  8033a4:	55                   	push   %rbp
  8033a5:	48 89 e5             	mov    %rsp,%rbp
  8033a8:	48 83 ec 20          	sub    $0x20,%rsp
  8033ac:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033af:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8033b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033b5:	89 c7                	mov    %eax,%edi
  8033b7:	48 b8 1c 31 80 00 00 	movabs $0x80311c,%rax
  8033be:	00 00 00 
  8033c1:	ff d0                	callq  *%rax
  8033c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033ca:	79 05                	jns    8033d1 <listen+0x2d>
  8033cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033cf:	eb 16                	jmp    8033e7 <listen+0x43>
  8033d1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8033d4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033d7:	89 d6                	mov    %edx,%esi
  8033d9:	89 c7                	mov    %eax,%edi
  8033db:	48 b8 13 37 80 00 00 	movabs $0x803713,%rax
  8033e2:	00 00 00 
  8033e5:	ff d0                	callq  *%rax
  8033e7:	c9                   	leaveq 
  8033e8:	c3                   	retq   

00000000008033e9 <devsock_read>:
  8033e9:	55                   	push   %rbp
  8033ea:	48 89 e5             	mov    %rsp,%rbp
  8033ed:	48 83 ec 20          	sub    $0x20,%rsp
  8033f1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8033f5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8033f9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8033fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803401:	89 c2                	mov    %eax,%edx
  803403:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803407:	8b 40 0c             	mov    0xc(%rax),%eax
  80340a:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80340e:	b9 00 00 00 00       	mov    $0x0,%ecx
  803413:	89 c7                	mov    %eax,%edi
  803415:	48 b8 53 37 80 00 00 	movabs $0x803753,%rax
  80341c:	00 00 00 
  80341f:	ff d0                	callq  *%rax
  803421:	c9                   	leaveq 
  803422:	c3                   	retq   

0000000000803423 <devsock_write>:
  803423:	55                   	push   %rbp
  803424:	48 89 e5             	mov    %rsp,%rbp
  803427:	48 83 ec 20          	sub    $0x20,%rsp
  80342b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80342f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803433:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803437:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80343b:	89 c2                	mov    %eax,%edx
  80343d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803441:	8b 40 0c             	mov    0xc(%rax),%eax
  803444:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803448:	b9 00 00 00 00       	mov    $0x0,%ecx
  80344d:	89 c7                	mov    %eax,%edi
  80344f:	48 b8 1f 38 80 00 00 	movabs $0x80381f,%rax
  803456:	00 00 00 
  803459:	ff d0                	callq  *%rax
  80345b:	c9                   	leaveq 
  80345c:	c3                   	retq   

000000000080345d <devsock_stat>:
  80345d:	55                   	push   %rbp
  80345e:	48 89 e5             	mov    %rsp,%rbp
  803461:	48 83 ec 10          	sub    $0x10,%rsp
  803465:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803469:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80346d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803471:	48 be 0a 4b 80 00 00 	movabs $0x804b0a,%rsi
  803478:	00 00 00 
  80347b:	48 89 c7             	mov    %rax,%rdi
  80347e:	48 b8 b7 10 80 00 00 	movabs $0x8010b7,%rax
  803485:	00 00 00 
  803488:	ff d0                	callq  *%rax
  80348a:	b8 00 00 00 00       	mov    $0x0,%eax
  80348f:	c9                   	leaveq 
  803490:	c3                   	retq   

0000000000803491 <socket>:
  803491:	55                   	push   %rbp
  803492:	48 89 e5             	mov    %rsp,%rbp
  803495:	48 83 ec 20          	sub    $0x20,%rsp
  803499:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80349c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80349f:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8034a2:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8034a5:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8034a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034ab:	89 ce                	mov    %ecx,%esi
  8034ad:	89 c7                	mov    %eax,%edi
  8034af:	48 b8 d7 38 80 00 00 	movabs $0x8038d7,%rax
  8034b6:	00 00 00 
  8034b9:	ff d0                	callq  *%rax
  8034bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034be:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034c2:	79 05                	jns    8034c9 <socket+0x38>
  8034c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034c7:	eb 11                	jmp    8034da <socket+0x49>
  8034c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034cc:	89 c7                	mov    %eax,%edi
  8034ce:	48 b8 73 31 80 00 00 	movabs $0x803173,%rax
  8034d5:	00 00 00 
  8034d8:	ff d0                	callq  *%rax
  8034da:	c9                   	leaveq 
  8034db:	c3                   	retq   

00000000008034dc <nsipc>:
  8034dc:	55                   	push   %rbp
  8034dd:	48 89 e5             	mov    %rsp,%rbp
  8034e0:	48 83 ec 10          	sub    $0x10,%rsp
  8034e4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8034e7:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8034ee:	00 00 00 
  8034f1:	8b 00                	mov    (%rax),%eax
  8034f3:	85 c0                	test   %eax,%eax
  8034f5:	75 1f                	jne    803516 <nsipc+0x3a>
  8034f7:	bf 02 00 00 00       	mov    $0x2,%edi
  8034fc:	48 b8 62 43 80 00 00 	movabs $0x804362,%rax
  803503:	00 00 00 
  803506:	ff d0                	callq  *%rax
  803508:	89 c2                	mov    %eax,%edx
  80350a:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803511:	00 00 00 
  803514:	89 10                	mov    %edx,(%rax)
  803516:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80351d:	00 00 00 
  803520:	8b 00                	mov    (%rax),%eax
  803522:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803525:	b9 07 00 00 00       	mov    $0x7,%ecx
  80352a:	48 ba 00 c0 80 00 00 	movabs $0x80c000,%rdx
  803531:	00 00 00 
  803534:	89 c7                	mov    %eax,%edi
  803536:	48 b8 58 42 80 00 00 	movabs $0x804258,%rax
  80353d:	00 00 00 
  803540:	ff d0                	callq  *%rax
  803542:	ba 00 00 00 00       	mov    $0x0,%edx
  803547:	be 00 00 00 00       	mov    $0x0,%esi
  80354c:	bf 00 00 00 00       	mov    $0x0,%edi
  803551:	48 b8 97 41 80 00 00 	movabs $0x804197,%rax
  803558:	00 00 00 
  80355b:	ff d0                	callq  *%rax
  80355d:	c9                   	leaveq 
  80355e:	c3                   	retq   

000000000080355f <nsipc_accept>:
  80355f:	55                   	push   %rbp
  803560:	48 89 e5             	mov    %rsp,%rbp
  803563:	48 83 ec 30          	sub    $0x30,%rsp
  803567:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80356a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80356e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803572:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803579:	00 00 00 
  80357c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80357f:	89 10                	mov    %edx,(%rax)
  803581:	bf 01 00 00 00       	mov    $0x1,%edi
  803586:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  80358d:	00 00 00 
  803590:	ff d0                	callq  *%rax
  803592:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803595:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803599:	78 3e                	js     8035d9 <nsipc_accept+0x7a>
  80359b:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8035a2:	00 00 00 
  8035a5:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8035a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035ad:	8b 40 10             	mov    0x10(%rax),%eax
  8035b0:	89 c2                	mov    %eax,%edx
  8035b2:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8035b6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8035ba:	48 89 ce             	mov    %rcx,%rsi
  8035bd:	48 89 c7             	mov    %rax,%rdi
  8035c0:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  8035c7:	00 00 00 
  8035ca:	ff d0                	callq  *%rax
  8035cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035d0:	8b 50 10             	mov    0x10(%rax),%edx
  8035d3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8035d7:	89 10                	mov    %edx,(%rax)
  8035d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8035dc:	c9                   	leaveq 
  8035dd:	c3                   	retq   

00000000008035de <nsipc_bind>:
  8035de:	55                   	push   %rbp
  8035df:	48 89 e5             	mov    %rsp,%rbp
  8035e2:	48 83 ec 10          	sub    $0x10,%rsp
  8035e6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8035e9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8035ed:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8035f0:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8035f7:	00 00 00 
  8035fa:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8035fd:	89 10                	mov    %edx,(%rax)
  8035ff:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803602:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803606:	48 89 c6             	mov    %rax,%rsi
  803609:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  803610:	00 00 00 
  803613:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  80361a:	00 00 00 
  80361d:	ff d0                	callq  *%rax
  80361f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803626:	00 00 00 
  803629:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80362c:	89 50 14             	mov    %edx,0x14(%rax)
  80362f:	bf 02 00 00 00       	mov    $0x2,%edi
  803634:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  80363b:	00 00 00 
  80363e:	ff d0                	callq  *%rax
  803640:	c9                   	leaveq 
  803641:	c3                   	retq   

0000000000803642 <nsipc_shutdown>:
  803642:	55                   	push   %rbp
  803643:	48 89 e5             	mov    %rsp,%rbp
  803646:	48 83 ec 10          	sub    $0x10,%rsp
  80364a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80364d:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803650:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803657:	00 00 00 
  80365a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80365d:	89 10                	mov    %edx,(%rax)
  80365f:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803666:	00 00 00 
  803669:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80366c:	89 50 04             	mov    %edx,0x4(%rax)
  80366f:	bf 03 00 00 00       	mov    $0x3,%edi
  803674:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  80367b:	00 00 00 
  80367e:	ff d0                	callq  *%rax
  803680:	c9                   	leaveq 
  803681:	c3                   	retq   

0000000000803682 <nsipc_close>:
  803682:	55                   	push   %rbp
  803683:	48 89 e5             	mov    %rsp,%rbp
  803686:	48 83 ec 10          	sub    $0x10,%rsp
  80368a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80368d:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803694:	00 00 00 
  803697:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80369a:	89 10                	mov    %edx,(%rax)
  80369c:	bf 04 00 00 00       	mov    $0x4,%edi
  8036a1:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  8036a8:	00 00 00 
  8036ab:	ff d0                	callq  *%rax
  8036ad:	c9                   	leaveq 
  8036ae:	c3                   	retq   

00000000008036af <nsipc_connect>:
  8036af:	55                   	push   %rbp
  8036b0:	48 89 e5             	mov    %rsp,%rbp
  8036b3:	48 83 ec 10          	sub    $0x10,%rsp
  8036b7:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8036ba:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8036be:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8036c1:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8036c8:	00 00 00 
  8036cb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8036ce:	89 10                	mov    %edx,(%rax)
  8036d0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8036d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036d7:	48 89 c6             	mov    %rax,%rsi
  8036da:	48 bf 04 c0 80 00 00 	movabs $0x80c004,%rdi
  8036e1:	00 00 00 
  8036e4:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  8036eb:	00 00 00 
  8036ee:	ff d0                	callq  *%rax
  8036f0:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8036f7:	00 00 00 
  8036fa:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8036fd:	89 50 14             	mov    %edx,0x14(%rax)
  803700:	bf 05 00 00 00       	mov    $0x5,%edi
  803705:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  80370c:	00 00 00 
  80370f:	ff d0                	callq  *%rax
  803711:	c9                   	leaveq 
  803712:	c3                   	retq   

0000000000803713 <nsipc_listen>:
  803713:	55                   	push   %rbp
  803714:	48 89 e5             	mov    %rsp,%rbp
  803717:	48 83 ec 10          	sub    $0x10,%rsp
  80371b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80371e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803721:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803728:	00 00 00 
  80372b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80372e:	89 10                	mov    %edx,(%rax)
  803730:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  803737:	00 00 00 
  80373a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80373d:	89 50 04             	mov    %edx,0x4(%rax)
  803740:	bf 06 00 00 00       	mov    $0x6,%edi
  803745:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  80374c:	00 00 00 
  80374f:	ff d0                	callq  *%rax
  803751:	c9                   	leaveq 
  803752:	c3                   	retq   

0000000000803753 <nsipc_recv>:
  803753:	55                   	push   %rbp
  803754:	48 89 e5             	mov    %rsp,%rbp
  803757:	48 83 ec 30          	sub    $0x30,%rsp
  80375b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80375e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803762:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803765:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803768:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80376f:	00 00 00 
  803772:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803775:	89 10                	mov    %edx,(%rax)
  803777:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80377e:	00 00 00 
  803781:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803784:	89 50 04             	mov    %edx,0x4(%rax)
  803787:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80378e:	00 00 00 
  803791:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803794:	89 50 08             	mov    %edx,0x8(%rax)
  803797:	bf 07 00 00 00       	mov    $0x7,%edi
  80379c:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  8037a3:	00 00 00 
  8037a6:	ff d0                	callq  *%rax
  8037a8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037ab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037af:	78 69                	js     80381a <nsipc_recv+0xc7>
  8037b1:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8037b8:	7f 08                	jg     8037c2 <nsipc_recv+0x6f>
  8037ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037bd:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  8037c0:	7e 35                	jle    8037f7 <nsipc_recv+0xa4>
  8037c2:	48 b9 11 4b 80 00 00 	movabs $0x804b11,%rcx
  8037c9:	00 00 00 
  8037cc:	48 ba 26 4b 80 00 00 	movabs $0x804b26,%rdx
  8037d3:	00 00 00 
  8037d6:	be 62 00 00 00       	mov    $0x62,%esi
  8037db:	48 bf 3b 4b 80 00 00 	movabs $0x804b3b,%rdi
  8037e2:	00 00 00 
  8037e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8037ea:	49 b8 ed 02 80 00 00 	movabs $0x8002ed,%r8
  8037f1:	00 00 00 
  8037f4:	41 ff d0             	callq  *%r8
  8037f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037fa:	48 63 d0             	movslq %eax,%rdx
  8037fd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803801:	48 be 00 c0 80 00 00 	movabs $0x80c000,%rsi
  803808:	00 00 00 
  80380b:	48 89 c7             	mov    %rax,%rdi
  80380e:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  803815:	00 00 00 
  803818:	ff d0                	callq  *%rax
  80381a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80381d:	c9                   	leaveq 
  80381e:	c3                   	retq   

000000000080381f <nsipc_send>:
  80381f:	55                   	push   %rbp
  803820:	48 89 e5             	mov    %rsp,%rbp
  803823:	48 83 ec 20          	sub    $0x20,%rsp
  803827:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80382a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80382e:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803831:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803834:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80383b:	00 00 00 
  80383e:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803841:	89 10                	mov    %edx,(%rax)
  803843:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  80384a:	7e 35                	jle    803881 <nsipc_send+0x62>
  80384c:	48 b9 4a 4b 80 00 00 	movabs $0x804b4a,%rcx
  803853:	00 00 00 
  803856:	48 ba 26 4b 80 00 00 	movabs $0x804b26,%rdx
  80385d:	00 00 00 
  803860:	be 6d 00 00 00       	mov    $0x6d,%esi
  803865:	48 bf 3b 4b 80 00 00 	movabs $0x804b3b,%rdi
  80386c:	00 00 00 
  80386f:	b8 00 00 00 00       	mov    $0x0,%eax
  803874:	49 b8 ed 02 80 00 00 	movabs $0x8002ed,%r8
  80387b:	00 00 00 
  80387e:	41 ff d0             	callq  *%r8
  803881:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803884:	48 63 d0             	movslq %eax,%rdx
  803887:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80388b:	48 89 c6             	mov    %rax,%rsi
  80388e:	48 bf 0c c0 80 00 00 	movabs $0x80c00c,%rdi
  803895:	00 00 00 
  803898:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  80389f:	00 00 00 
  8038a2:	ff d0                	callq  *%rax
  8038a4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8038ab:	00 00 00 
  8038ae:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8038b1:	89 50 04             	mov    %edx,0x4(%rax)
  8038b4:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8038bb:	00 00 00 
  8038be:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8038c1:	89 50 08             	mov    %edx,0x8(%rax)
  8038c4:	bf 08 00 00 00       	mov    $0x8,%edi
  8038c9:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  8038d0:	00 00 00 
  8038d3:	ff d0                	callq  *%rax
  8038d5:	c9                   	leaveq 
  8038d6:	c3                   	retq   

00000000008038d7 <nsipc_socket>:
  8038d7:	55                   	push   %rbp
  8038d8:	48 89 e5             	mov    %rsp,%rbp
  8038db:	48 83 ec 10          	sub    $0x10,%rsp
  8038df:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8038e2:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8038e5:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8038e8:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8038ef:	00 00 00 
  8038f2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8038f5:	89 10                	mov    %edx,(%rax)
  8038f7:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  8038fe:	00 00 00 
  803901:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803904:	89 50 04             	mov    %edx,0x4(%rax)
  803907:	48 b8 00 c0 80 00 00 	movabs $0x80c000,%rax
  80390e:	00 00 00 
  803911:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803914:	89 50 08             	mov    %edx,0x8(%rax)
  803917:	bf 09 00 00 00       	mov    $0x9,%edi
  80391c:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  803923:	00 00 00 
  803926:	ff d0                	callq  *%rax
  803928:	c9                   	leaveq 
  803929:	c3                   	retq   

000000000080392a <pipe>:
  80392a:	55                   	push   %rbp
  80392b:	48 89 e5             	mov    %rsp,%rbp
  80392e:	53                   	push   %rbx
  80392f:	48 83 ec 38          	sub    $0x38,%rsp
  803933:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803937:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80393b:	48 89 c7             	mov    %rax,%rdi
  80393e:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  803945:	00 00 00 
  803948:	ff d0                	callq  *%rax
  80394a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80394d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803951:	0f 88 bf 01 00 00    	js     803b16 <pipe+0x1ec>
  803957:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80395b:	ba 07 04 00 00       	mov    $0x407,%edx
  803960:	48 89 c6             	mov    %rax,%rsi
  803963:	bf 00 00 00 00       	mov    $0x0,%edi
  803968:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  80396f:	00 00 00 
  803972:	ff d0                	callq  *%rax
  803974:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803977:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80397b:	0f 88 95 01 00 00    	js     803b16 <pipe+0x1ec>
  803981:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803985:	48 89 c7             	mov    %rax,%rdi
  803988:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  80398f:	00 00 00 
  803992:	ff d0                	callq  *%rax
  803994:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803997:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80399b:	0f 88 5d 01 00 00    	js     803afe <pipe+0x1d4>
  8039a1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8039a5:	ba 07 04 00 00       	mov    $0x407,%edx
  8039aa:	48 89 c6             	mov    %rax,%rsi
  8039ad:	bf 00 00 00 00       	mov    $0x0,%edi
  8039b2:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  8039b9:	00 00 00 
  8039bc:	ff d0                	callq  *%rax
  8039be:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8039c1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8039c5:	0f 88 33 01 00 00    	js     803afe <pipe+0x1d4>
  8039cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8039cf:	48 89 c7             	mov    %rax,%rdi
  8039d2:	48 b8 06 1e 80 00 00 	movabs $0x801e06,%rax
  8039d9:	00 00 00 
  8039dc:	ff d0                	callq  *%rax
  8039de:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8039e2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8039e6:	ba 07 04 00 00       	mov    $0x407,%edx
  8039eb:	48 89 c6             	mov    %rax,%rsi
  8039ee:	bf 00 00 00 00       	mov    $0x0,%edi
  8039f3:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  8039fa:	00 00 00 
  8039fd:	ff d0                	callq  *%rax
  8039ff:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a02:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a06:	0f 88 d9 00 00 00    	js     803ae5 <pipe+0x1bb>
  803a0c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a10:	48 89 c7             	mov    %rax,%rdi
  803a13:	48 b8 06 1e 80 00 00 	movabs $0x801e06,%rax
  803a1a:	00 00 00 
  803a1d:	ff d0                	callq  *%rax
  803a1f:	48 89 c2             	mov    %rax,%rdx
  803a22:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803a26:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803a2c:	48 89 d1             	mov    %rdx,%rcx
  803a2f:	ba 00 00 00 00       	mov    $0x0,%edx
  803a34:	48 89 c6             	mov    %rax,%rsi
  803a37:	bf 00 00 00 00       	mov    $0x0,%edi
  803a3c:	48 b8 39 1a 80 00 00 	movabs $0x801a39,%rax
  803a43:	00 00 00 
  803a46:	ff d0                	callq  *%rax
  803a48:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a4b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a4f:	78 79                	js     803aca <pipe+0x1a0>
  803a51:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a55:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803a5c:	00 00 00 
  803a5f:	8b 12                	mov    (%rdx),%edx
  803a61:	89 10                	mov    %edx,(%rax)
  803a63:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a67:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803a6e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a72:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803a79:	00 00 00 
  803a7c:	8b 12                	mov    (%rdx),%edx
  803a7e:	89 10                	mov    %edx,(%rax)
  803a80:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a84:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803a8b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a8f:	48 89 c7             	mov    %rax,%rdi
  803a92:	48 b8 e3 1d 80 00 00 	movabs $0x801de3,%rax
  803a99:	00 00 00 
  803a9c:	ff d0                	callq  *%rax
  803a9e:	89 c2                	mov    %eax,%edx
  803aa0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803aa4:	89 10                	mov    %edx,(%rax)
  803aa6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803aaa:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803aae:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803ab2:	48 89 c7             	mov    %rax,%rdi
  803ab5:	48 b8 e3 1d 80 00 00 	movabs $0x801de3,%rax
  803abc:	00 00 00 
  803abf:	ff d0                	callq  *%rax
  803ac1:	89 03                	mov    %eax,(%rbx)
  803ac3:	b8 00 00 00 00       	mov    $0x0,%eax
  803ac8:	eb 4f                	jmp    803b19 <pipe+0x1ef>
  803aca:	90                   	nop
  803acb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803acf:	48 89 c6             	mov    %rax,%rsi
  803ad2:	bf 00 00 00 00       	mov    $0x0,%edi
  803ad7:	48 b8 99 1a 80 00 00 	movabs $0x801a99,%rax
  803ade:	00 00 00 
  803ae1:	ff d0                	callq  *%rax
  803ae3:	eb 01                	jmp    803ae6 <pipe+0x1bc>
  803ae5:	90                   	nop
  803ae6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803aea:	48 89 c6             	mov    %rax,%rsi
  803aed:	bf 00 00 00 00       	mov    $0x0,%edi
  803af2:	48 b8 99 1a 80 00 00 	movabs $0x801a99,%rax
  803af9:	00 00 00 
  803afc:	ff d0                	callq  *%rax
  803afe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b02:	48 89 c6             	mov    %rax,%rsi
  803b05:	bf 00 00 00 00       	mov    $0x0,%edi
  803b0a:	48 b8 99 1a 80 00 00 	movabs $0x801a99,%rax
  803b11:	00 00 00 
  803b14:	ff d0                	callq  *%rax
  803b16:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b19:	48 83 c4 38          	add    $0x38,%rsp
  803b1d:	5b                   	pop    %rbx
  803b1e:	5d                   	pop    %rbp
  803b1f:	c3                   	retq   

0000000000803b20 <_pipeisclosed>:
  803b20:	55                   	push   %rbp
  803b21:	48 89 e5             	mov    %rsp,%rbp
  803b24:	53                   	push   %rbx
  803b25:	48 83 ec 28          	sub    $0x28,%rsp
  803b29:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803b2d:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803b31:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803b38:	00 00 00 
  803b3b:	48 8b 00             	mov    (%rax),%rax
  803b3e:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803b44:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b47:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b4b:	48 89 c7             	mov    %rax,%rdi
  803b4e:	48 b8 d3 43 80 00 00 	movabs $0x8043d3,%rax
  803b55:	00 00 00 
  803b58:	ff d0                	callq  *%rax
  803b5a:	89 c3                	mov    %eax,%ebx
  803b5c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b60:	48 89 c7             	mov    %rax,%rdi
  803b63:	48 b8 d3 43 80 00 00 	movabs $0x8043d3,%rax
  803b6a:	00 00 00 
  803b6d:	ff d0                	callq  *%rax
  803b6f:	39 c3                	cmp    %eax,%ebx
  803b71:	0f 94 c0             	sete   %al
  803b74:	0f b6 c0             	movzbl %al,%eax
  803b77:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803b7a:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803b81:	00 00 00 
  803b84:	48 8b 00             	mov    (%rax),%rax
  803b87:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803b8d:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803b90:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803b93:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803b96:	75 05                	jne    803b9d <_pipeisclosed+0x7d>
  803b98:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803b9b:	eb 4a                	jmp    803be7 <_pipeisclosed+0xc7>
  803b9d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ba0:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803ba3:	74 8c                	je     803b31 <_pipeisclosed+0x11>
  803ba5:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803ba9:	75 86                	jne    803b31 <_pipeisclosed+0x11>
  803bab:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  803bb2:	00 00 00 
  803bb5:	48 8b 00             	mov    (%rax),%rax
  803bb8:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803bbe:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803bc1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bc4:	89 c6                	mov    %eax,%esi
  803bc6:	48 bf 5b 4b 80 00 00 	movabs $0x804b5b,%rdi
  803bcd:	00 00 00 
  803bd0:	b8 00 00 00 00       	mov    $0x0,%eax
  803bd5:	49 b8 27 05 80 00 00 	movabs $0x800527,%r8
  803bdc:	00 00 00 
  803bdf:	41 ff d0             	callq  *%r8
  803be2:	e9 4a ff ff ff       	jmpq   803b31 <_pipeisclosed+0x11>
  803be7:	48 83 c4 28          	add    $0x28,%rsp
  803beb:	5b                   	pop    %rbx
  803bec:	5d                   	pop    %rbp
  803bed:	c3                   	retq   

0000000000803bee <pipeisclosed>:
  803bee:	55                   	push   %rbp
  803bef:	48 89 e5             	mov    %rsp,%rbp
  803bf2:	48 83 ec 30          	sub    $0x30,%rsp
  803bf6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803bf9:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803bfd:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803c00:	48 89 d6             	mov    %rdx,%rsi
  803c03:	89 c7                	mov    %eax,%edi
  803c05:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  803c0c:	00 00 00 
  803c0f:	ff d0                	callq  *%rax
  803c11:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c14:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c18:	79 05                	jns    803c1f <pipeisclosed+0x31>
  803c1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c1d:	eb 31                	jmp    803c50 <pipeisclosed+0x62>
  803c1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c23:	48 89 c7             	mov    %rax,%rdi
  803c26:	48 b8 06 1e 80 00 00 	movabs $0x801e06,%rax
  803c2d:	00 00 00 
  803c30:	ff d0                	callq  *%rax
  803c32:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c36:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c3a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803c3e:	48 89 d6             	mov    %rdx,%rsi
  803c41:	48 89 c7             	mov    %rax,%rdi
  803c44:	48 b8 20 3b 80 00 00 	movabs $0x803b20,%rax
  803c4b:	00 00 00 
  803c4e:	ff d0                	callq  *%rax
  803c50:	c9                   	leaveq 
  803c51:	c3                   	retq   

0000000000803c52 <devpipe_read>:
  803c52:	55                   	push   %rbp
  803c53:	48 89 e5             	mov    %rsp,%rbp
  803c56:	48 83 ec 40          	sub    $0x40,%rsp
  803c5a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803c5e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803c62:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803c66:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c6a:	48 89 c7             	mov    %rax,%rdi
  803c6d:	48 b8 06 1e 80 00 00 	movabs $0x801e06,%rax
  803c74:	00 00 00 
  803c77:	ff d0                	callq  *%rax
  803c79:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803c7d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c81:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803c85:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803c8c:	00 
  803c8d:	e9 90 00 00 00       	jmpq   803d22 <devpipe_read+0xd0>
  803c92:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803c97:	74 09                	je     803ca2 <devpipe_read+0x50>
  803c99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803c9d:	e9 8e 00 00 00       	jmpq   803d30 <devpipe_read+0xde>
  803ca2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ca6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803caa:	48 89 d6             	mov    %rdx,%rsi
  803cad:	48 89 c7             	mov    %rax,%rdi
  803cb0:	48 b8 20 3b 80 00 00 	movabs $0x803b20,%rax
  803cb7:	00 00 00 
  803cba:	ff d0                	callq  *%rax
  803cbc:	85 c0                	test   %eax,%eax
  803cbe:	74 07                	je     803cc7 <devpipe_read+0x75>
  803cc0:	b8 00 00 00 00       	mov    $0x0,%eax
  803cc5:	eb 69                	jmp    803d30 <devpipe_read+0xde>
  803cc7:	48 b8 aa 19 80 00 00 	movabs $0x8019aa,%rax
  803cce:	00 00 00 
  803cd1:	ff d0                	callq  *%rax
  803cd3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cd7:	8b 10                	mov    (%rax),%edx
  803cd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cdd:	8b 40 04             	mov    0x4(%rax),%eax
  803ce0:	39 c2                	cmp    %eax,%edx
  803ce2:	74 ae                	je     803c92 <devpipe_read+0x40>
  803ce4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803ce8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803cec:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803cf0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cf4:	8b 00                	mov    (%rax),%eax
  803cf6:	99                   	cltd   
  803cf7:	c1 ea 1b             	shr    $0x1b,%edx
  803cfa:	01 d0                	add    %edx,%eax
  803cfc:	83 e0 1f             	and    $0x1f,%eax
  803cff:	29 d0                	sub    %edx,%eax
  803d01:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d05:	48 98                	cltq   
  803d07:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803d0c:	88 01                	mov    %al,(%rcx)
  803d0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d12:	8b 00                	mov    (%rax),%eax
  803d14:	8d 50 01             	lea    0x1(%rax),%edx
  803d17:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803d1b:	89 10                	mov    %edx,(%rax)
  803d1d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803d22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d26:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803d2a:	72 a7                	jb     803cd3 <devpipe_read+0x81>
  803d2c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d30:	c9                   	leaveq 
  803d31:	c3                   	retq   

0000000000803d32 <devpipe_write>:
  803d32:	55                   	push   %rbp
  803d33:	48 89 e5             	mov    %rsp,%rbp
  803d36:	48 83 ec 40          	sub    $0x40,%rsp
  803d3a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803d3e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803d42:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803d46:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d4a:	48 89 c7             	mov    %rax,%rdi
  803d4d:	48 b8 06 1e 80 00 00 	movabs $0x801e06,%rax
  803d54:	00 00 00 
  803d57:	ff d0                	callq  *%rax
  803d59:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d5d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803d61:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803d65:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803d6c:	00 
  803d6d:	e9 8f 00 00 00       	jmpq   803e01 <devpipe_write+0xcf>
  803d72:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d76:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d7a:	48 89 d6             	mov    %rdx,%rsi
  803d7d:	48 89 c7             	mov    %rax,%rdi
  803d80:	48 b8 20 3b 80 00 00 	movabs $0x803b20,%rax
  803d87:	00 00 00 
  803d8a:	ff d0                	callq  *%rax
  803d8c:	85 c0                	test   %eax,%eax
  803d8e:	74 07                	je     803d97 <devpipe_write+0x65>
  803d90:	b8 00 00 00 00       	mov    $0x0,%eax
  803d95:	eb 78                	jmp    803e0f <devpipe_write+0xdd>
  803d97:	48 b8 aa 19 80 00 00 	movabs $0x8019aa,%rax
  803d9e:	00 00 00 
  803da1:	ff d0                	callq  *%rax
  803da3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803da7:	8b 40 04             	mov    0x4(%rax),%eax
  803daa:	48 63 d0             	movslq %eax,%rdx
  803dad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803db1:	8b 00                	mov    (%rax),%eax
  803db3:	48 98                	cltq   
  803db5:	48 83 c0 20          	add    $0x20,%rax
  803db9:	48 39 c2             	cmp    %rax,%rdx
  803dbc:	73 b4                	jae    803d72 <devpipe_write+0x40>
  803dbe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803dc2:	8b 40 04             	mov    0x4(%rax),%eax
  803dc5:	99                   	cltd   
  803dc6:	c1 ea 1b             	shr    $0x1b,%edx
  803dc9:	01 d0                	add    %edx,%eax
  803dcb:	83 e0 1f             	and    $0x1f,%eax
  803dce:	29 d0                	sub    %edx,%eax
  803dd0:	89 c6                	mov    %eax,%esi
  803dd2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803dd6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dda:	48 01 d0             	add    %rdx,%rax
  803ddd:	0f b6 08             	movzbl (%rax),%ecx
  803de0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803de4:	48 63 c6             	movslq %esi,%rax
  803de7:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803deb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803def:	8b 40 04             	mov    0x4(%rax),%eax
  803df2:	8d 50 01             	lea    0x1(%rax),%edx
  803df5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803df9:	89 50 04             	mov    %edx,0x4(%rax)
  803dfc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803e01:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e05:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803e09:	72 98                	jb     803da3 <devpipe_write+0x71>
  803e0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e0f:	c9                   	leaveq 
  803e10:	c3                   	retq   

0000000000803e11 <devpipe_stat>:
  803e11:	55                   	push   %rbp
  803e12:	48 89 e5             	mov    %rsp,%rbp
  803e15:	48 83 ec 20          	sub    $0x20,%rsp
  803e19:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803e1d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803e21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803e25:	48 89 c7             	mov    %rax,%rdi
  803e28:	48 b8 06 1e 80 00 00 	movabs $0x801e06,%rax
  803e2f:	00 00 00 
  803e32:	ff d0                	callq  *%rax
  803e34:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803e38:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e3c:	48 be 6e 4b 80 00 00 	movabs $0x804b6e,%rsi
  803e43:	00 00 00 
  803e46:	48 89 c7             	mov    %rax,%rdi
  803e49:	48 b8 b7 10 80 00 00 	movabs $0x8010b7,%rax
  803e50:	00 00 00 
  803e53:	ff d0                	callq  *%rax
  803e55:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e59:	8b 50 04             	mov    0x4(%rax),%edx
  803e5c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e60:	8b 00                	mov    (%rax),%eax
  803e62:	29 c2                	sub    %eax,%edx
  803e64:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e68:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803e6e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e72:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803e79:	00 00 00 
  803e7c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803e80:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803e87:	00 00 00 
  803e8a:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803e91:	b8 00 00 00 00       	mov    $0x0,%eax
  803e96:	c9                   	leaveq 
  803e97:	c3                   	retq   

0000000000803e98 <devpipe_close>:
  803e98:	55                   	push   %rbp
  803e99:	48 89 e5             	mov    %rsp,%rbp
  803e9c:	48 83 ec 10          	sub    $0x10,%rsp
  803ea0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803ea4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ea8:	48 89 c6             	mov    %rax,%rsi
  803eab:	bf 00 00 00 00       	mov    $0x0,%edi
  803eb0:	48 b8 99 1a 80 00 00 	movabs $0x801a99,%rax
  803eb7:	00 00 00 
  803eba:	ff d0                	callq  *%rax
  803ebc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ec0:	48 89 c7             	mov    %rax,%rdi
  803ec3:	48 b8 06 1e 80 00 00 	movabs $0x801e06,%rax
  803eca:	00 00 00 
  803ecd:	ff d0                	callq  *%rax
  803ecf:	48 89 c6             	mov    %rax,%rsi
  803ed2:	bf 00 00 00 00       	mov    $0x0,%edi
  803ed7:	48 b8 99 1a 80 00 00 	movabs $0x801a99,%rax
  803ede:	00 00 00 
  803ee1:	ff d0                	callq  *%rax
  803ee3:	c9                   	leaveq 
  803ee4:	c3                   	retq   

0000000000803ee5 <cputchar>:
  803ee5:	55                   	push   %rbp
  803ee6:	48 89 e5             	mov    %rsp,%rbp
  803ee9:	48 83 ec 20          	sub    $0x20,%rsp
  803eed:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ef0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ef3:	88 45 ff             	mov    %al,-0x1(%rbp)
  803ef6:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803efa:	be 01 00 00 00       	mov    $0x1,%esi
  803eff:	48 89 c7             	mov    %rax,%rdi
  803f02:	48 b8 9f 18 80 00 00 	movabs $0x80189f,%rax
  803f09:	00 00 00 
  803f0c:	ff d0                	callq  *%rax
  803f0e:	90                   	nop
  803f0f:	c9                   	leaveq 
  803f10:	c3                   	retq   

0000000000803f11 <getchar>:
  803f11:	55                   	push   %rbp
  803f12:	48 89 e5             	mov    %rsp,%rbp
  803f15:	48 83 ec 10          	sub    $0x10,%rsp
  803f19:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803f1d:	ba 01 00 00 00       	mov    $0x1,%edx
  803f22:	48 89 c6             	mov    %rax,%rsi
  803f25:	bf 00 00 00 00       	mov    $0x0,%edi
  803f2a:	48 b8 fe 22 80 00 00 	movabs $0x8022fe,%rax
  803f31:	00 00 00 
  803f34:	ff d0                	callq  *%rax
  803f36:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f39:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f3d:	79 05                	jns    803f44 <getchar+0x33>
  803f3f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f42:	eb 14                	jmp    803f58 <getchar+0x47>
  803f44:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f48:	7f 07                	jg     803f51 <getchar+0x40>
  803f4a:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803f4f:	eb 07                	jmp    803f58 <getchar+0x47>
  803f51:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803f55:	0f b6 c0             	movzbl %al,%eax
  803f58:	c9                   	leaveq 
  803f59:	c3                   	retq   

0000000000803f5a <iscons>:
  803f5a:	55                   	push   %rbp
  803f5b:	48 89 e5             	mov    %rsp,%rbp
  803f5e:	48 83 ec 20          	sub    $0x20,%rsp
  803f62:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f65:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803f69:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f6c:	48 89 d6             	mov    %rdx,%rsi
  803f6f:	89 c7                	mov    %eax,%edi
  803f71:	48 b8 c9 1e 80 00 00 	movabs $0x801ec9,%rax
  803f78:	00 00 00 
  803f7b:	ff d0                	callq  *%rax
  803f7d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f80:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f84:	79 05                	jns    803f8b <iscons+0x31>
  803f86:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f89:	eb 1a                	jmp    803fa5 <iscons+0x4b>
  803f8b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f8f:	8b 10                	mov    (%rax),%edx
  803f91:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803f98:	00 00 00 
  803f9b:	8b 00                	mov    (%rax),%eax
  803f9d:	39 c2                	cmp    %eax,%edx
  803f9f:	0f 94 c0             	sete   %al
  803fa2:	0f b6 c0             	movzbl %al,%eax
  803fa5:	c9                   	leaveq 
  803fa6:	c3                   	retq   

0000000000803fa7 <opencons>:
  803fa7:	55                   	push   %rbp
  803fa8:	48 89 e5             	mov    %rsp,%rbp
  803fab:	48 83 ec 10          	sub    $0x10,%rsp
  803faf:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803fb3:	48 89 c7             	mov    %rax,%rdi
  803fb6:	48 b8 31 1e 80 00 00 	movabs $0x801e31,%rax
  803fbd:	00 00 00 
  803fc0:	ff d0                	callq  *%rax
  803fc2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fc5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fc9:	79 05                	jns    803fd0 <opencons+0x29>
  803fcb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fce:	eb 5b                	jmp    80402b <opencons+0x84>
  803fd0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fd4:	ba 07 04 00 00       	mov    $0x407,%edx
  803fd9:	48 89 c6             	mov    %rax,%rsi
  803fdc:	bf 00 00 00 00       	mov    $0x0,%edi
  803fe1:	48 b8 e7 19 80 00 00 	movabs $0x8019e7,%rax
  803fe8:	00 00 00 
  803feb:	ff d0                	callq  *%rax
  803fed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803ff0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ff4:	79 05                	jns    803ffb <opencons+0x54>
  803ff6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ff9:	eb 30                	jmp    80402b <opencons+0x84>
  803ffb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803fff:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  804006:	00 00 00 
  804009:	8b 12                	mov    (%rdx),%edx
  80400b:	89 10                	mov    %edx,(%rax)
  80400d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804011:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804018:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80401c:	48 89 c7             	mov    %rax,%rdi
  80401f:	48 b8 e3 1d 80 00 00 	movabs $0x801de3,%rax
  804026:	00 00 00 
  804029:	ff d0                	callq  *%rax
  80402b:	c9                   	leaveq 
  80402c:	c3                   	retq   

000000000080402d <devcons_read>:
  80402d:	55                   	push   %rbp
  80402e:	48 89 e5             	mov    %rsp,%rbp
  804031:	48 83 ec 30          	sub    $0x30,%rsp
  804035:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804039:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80403d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804041:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804046:	75 13                	jne    80405b <devcons_read+0x2e>
  804048:	b8 00 00 00 00       	mov    $0x0,%eax
  80404d:	eb 49                	jmp    804098 <devcons_read+0x6b>
  80404f:	48 b8 aa 19 80 00 00 	movabs $0x8019aa,%rax
  804056:	00 00 00 
  804059:	ff d0                	callq  *%rax
  80405b:	48 b8 ec 18 80 00 00 	movabs $0x8018ec,%rax
  804062:	00 00 00 
  804065:	ff d0                	callq  *%rax
  804067:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80406a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80406e:	74 df                	je     80404f <devcons_read+0x22>
  804070:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804074:	79 05                	jns    80407b <devcons_read+0x4e>
  804076:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804079:	eb 1d                	jmp    804098 <devcons_read+0x6b>
  80407b:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  80407f:	75 07                	jne    804088 <devcons_read+0x5b>
  804081:	b8 00 00 00 00       	mov    $0x0,%eax
  804086:	eb 10                	jmp    804098 <devcons_read+0x6b>
  804088:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80408b:	89 c2                	mov    %eax,%edx
  80408d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804091:	88 10                	mov    %dl,(%rax)
  804093:	b8 01 00 00 00       	mov    $0x1,%eax
  804098:	c9                   	leaveq 
  804099:	c3                   	retq   

000000000080409a <devcons_write>:
  80409a:	55                   	push   %rbp
  80409b:	48 89 e5             	mov    %rsp,%rbp
  80409e:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8040a5:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8040ac:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8040b3:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8040ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8040c1:	eb 76                	jmp    804139 <devcons_write+0x9f>
  8040c3:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8040ca:	89 c2                	mov    %eax,%edx
  8040cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040cf:	29 c2                	sub    %eax,%edx
  8040d1:	89 d0                	mov    %edx,%eax
  8040d3:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8040d6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8040d9:	83 f8 7f             	cmp    $0x7f,%eax
  8040dc:	76 07                	jbe    8040e5 <devcons_write+0x4b>
  8040de:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8040e5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8040e8:	48 63 d0             	movslq %eax,%rdx
  8040eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040ee:	48 63 c8             	movslq %eax,%rcx
  8040f1:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8040f8:	48 01 c1             	add    %rax,%rcx
  8040fb:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804102:	48 89 ce             	mov    %rcx,%rsi
  804105:	48 89 c7             	mov    %rax,%rdi
  804108:	48 b8 dc 13 80 00 00 	movabs $0x8013dc,%rax
  80410f:	00 00 00 
  804112:	ff d0                	callq  *%rax
  804114:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804117:	48 63 d0             	movslq %eax,%rdx
  80411a:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  804121:	48 89 d6             	mov    %rdx,%rsi
  804124:	48 89 c7             	mov    %rax,%rdi
  804127:	48 b8 9f 18 80 00 00 	movabs $0x80189f,%rax
  80412e:	00 00 00 
  804131:	ff d0                	callq  *%rax
  804133:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804136:	01 45 fc             	add    %eax,-0x4(%rbp)
  804139:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80413c:	48 98                	cltq   
  80413e:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  804145:	0f 82 78 ff ff ff    	jb     8040c3 <devcons_write+0x29>
  80414b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80414e:	c9                   	leaveq 
  80414f:	c3                   	retq   

0000000000804150 <devcons_close>:
  804150:	55                   	push   %rbp
  804151:	48 89 e5             	mov    %rsp,%rbp
  804154:	48 83 ec 08          	sub    $0x8,%rsp
  804158:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80415c:	b8 00 00 00 00       	mov    $0x0,%eax
  804161:	c9                   	leaveq 
  804162:	c3                   	retq   

0000000000804163 <devcons_stat>:
  804163:	55                   	push   %rbp
  804164:	48 89 e5             	mov    %rsp,%rbp
  804167:	48 83 ec 10          	sub    $0x10,%rsp
  80416b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80416f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804173:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804177:	48 be 7a 4b 80 00 00 	movabs $0x804b7a,%rsi
  80417e:	00 00 00 
  804181:	48 89 c7             	mov    %rax,%rdi
  804184:	48 b8 b7 10 80 00 00 	movabs $0x8010b7,%rax
  80418b:	00 00 00 
  80418e:	ff d0                	callq  *%rax
  804190:	b8 00 00 00 00       	mov    $0x0,%eax
  804195:	c9                   	leaveq 
  804196:	c3                   	retq   

0000000000804197 <ipc_recv>:
  804197:	55                   	push   %rbp
  804198:	48 89 e5             	mov    %rsp,%rbp
  80419b:	48 83 ec 30          	sub    $0x30,%rsp
  80419f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8041a3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8041a7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8041ab:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8041b0:	75 0e                	jne    8041c0 <ipc_recv+0x29>
  8041b2:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8041b9:	00 00 00 
  8041bc:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8041c0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041c4:	48 89 c7             	mov    %rax,%rdi
  8041c7:	48 b8 21 1c 80 00 00 	movabs $0x801c21,%rax
  8041ce:	00 00 00 
  8041d1:	ff d0                	callq  *%rax
  8041d3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041d6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041da:	79 27                	jns    804203 <ipc_recv+0x6c>
  8041dc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8041e1:	74 0a                	je     8041ed <ipc_recv+0x56>
  8041e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041e7:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8041ed:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8041f2:	74 0a                	je     8041fe <ipc_recv+0x67>
  8041f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8041f8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8041fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804201:	eb 53                	jmp    804256 <ipc_recv+0xbf>
  804203:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804208:	74 19                	je     804223 <ipc_recv+0x8c>
  80420a:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804211:	00 00 00 
  804214:	48 8b 00             	mov    (%rax),%rax
  804217:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80421d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804221:	89 10                	mov    %edx,(%rax)
  804223:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804228:	74 19                	je     804243 <ipc_recv+0xac>
  80422a:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  804231:	00 00 00 
  804234:	48 8b 00             	mov    (%rax),%rax
  804237:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80423d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804241:	89 10                	mov    %edx,(%rax)
  804243:	48 b8 20 90 80 00 00 	movabs $0x809020,%rax
  80424a:	00 00 00 
  80424d:	48 8b 00             	mov    (%rax),%rax
  804250:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804256:	c9                   	leaveq 
  804257:	c3                   	retq   

0000000000804258 <ipc_send>:
  804258:	55                   	push   %rbp
  804259:	48 89 e5             	mov    %rsp,%rbp
  80425c:	48 83 ec 30          	sub    $0x30,%rsp
  804260:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804263:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804266:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80426a:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80426d:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804272:	75 1c                	jne    804290 <ipc_send+0x38>
  804274:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80427b:	00 00 00 
  80427e:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804282:	eb 0c                	jmp    804290 <ipc_send+0x38>
  804284:	48 b8 aa 19 80 00 00 	movabs $0x8019aa,%rax
  80428b:	00 00 00 
  80428e:	ff d0                	callq  *%rax
  804290:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804293:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804296:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80429a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80429d:	89 c7                	mov    %eax,%edi
  80429f:	48 b8 ca 1b 80 00 00 	movabs $0x801bca,%rax
  8042a6:	00 00 00 
  8042a9:	ff d0                	callq  *%rax
  8042ab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8042ae:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  8042b2:	74 d0                	je     804284 <ipc_send+0x2c>
  8042b4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8042b8:	79 30                	jns    8042ea <ipc_send+0x92>
  8042ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042bd:	89 c1                	mov    %eax,%ecx
  8042bf:	48 ba 88 4b 80 00 00 	movabs $0x804b88,%rdx
  8042c6:	00 00 00 
  8042c9:	be 44 00 00 00       	mov    $0x44,%esi
  8042ce:	48 bf 9e 4b 80 00 00 	movabs $0x804b9e,%rdi
  8042d5:	00 00 00 
  8042d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8042dd:	49 b8 ed 02 80 00 00 	movabs $0x8002ed,%r8
  8042e4:	00 00 00 
  8042e7:	41 ff d0             	callq  *%r8
  8042ea:	90                   	nop
  8042eb:	c9                   	leaveq 
  8042ec:	c3                   	retq   

00000000008042ed <ipc_host_recv>:
  8042ed:	55                   	push   %rbp
  8042ee:	48 89 e5             	mov    %rsp,%rbp
  8042f1:	48 83 ec 10          	sub    $0x10,%rsp
  8042f5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8042f9:	48 ba b0 4b 80 00 00 	movabs $0x804bb0,%rdx
  804300:	00 00 00 
  804303:	be 4e 00 00 00       	mov    $0x4e,%esi
  804308:	48 bf 9e 4b 80 00 00 	movabs $0x804b9e,%rdi
  80430f:	00 00 00 
  804312:	b8 00 00 00 00       	mov    $0x0,%eax
  804317:	48 b9 ed 02 80 00 00 	movabs $0x8002ed,%rcx
  80431e:	00 00 00 
  804321:	ff d1                	callq  *%rcx

0000000000804323 <ipc_host_send>:
  804323:	55                   	push   %rbp
  804324:	48 89 e5             	mov    %rsp,%rbp
  804327:	48 83 ec 20          	sub    $0x20,%rsp
  80432b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80432e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804331:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804335:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804338:	48 ba d0 4b 80 00 00 	movabs $0x804bd0,%rdx
  80433f:	00 00 00 
  804342:	be 58 00 00 00       	mov    $0x58,%esi
  804347:	48 bf 9e 4b 80 00 00 	movabs $0x804b9e,%rdi
  80434e:	00 00 00 
  804351:	b8 00 00 00 00       	mov    $0x0,%eax
  804356:	48 b9 ed 02 80 00 00 	movabs $0x8002ed,%rcx
  80435d:	00 00 00 
  804360:	ff d1                	callq  *%rcx

0000000000804362 <ipc_find_env>:
  804362:	55                   	push   %rbp
  804363:	48 89 e5             	mov    %rsp,%rbp
  804366:	48 83 ec 18          	sub    $0x18,%rsp
  80436a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80436d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804374:	eb 4d                	jmp    8043c3 <ipc_find_env+0x61>
  804376:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80437d:	00 00 00 
  804380:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804383:	48 98                	cltq   
  804385:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80438c:	48 01 d0             	add    %rdx,%rax
  80438f:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804395:	8b 00                	mov    (%rax),%eax
  804397:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80439a:	75 23                	jne    8043bf <ipc_find_env+0x5d>
  80439c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8043a3:	00 00 00 
  8043a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8043a9:	48 98                	cltq   
  8043ab:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8043b2:	48 01 d0             	add    %rdx,%rax
  8043b5:	48 05 c8 00 00 00    	add    $0xc8,%rax
  8043bb:	8b 00                	mov    (%rax),%eax
  8043bd:	eb 12                	jmp    8043d1 <ipc_find_env+0x6f>
  8043bf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8043c3:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  8043ca:	7e aa                	jle    804376 <ipc_find_env+0x14>
  8043cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8043d1:	c9                   	leaveq 
  8043d2:	c3                   	retq   

00000000008043d3 <pageref>:
  8043d3:	55                   	push   %rbp
  8043d4:	48 89 e5             	mov    %rsp,%rbp
  8043d7:	48 83 ec 18          	sub    $0x18,%rsp
  8043db:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8043df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043e3:	48 c1 e8 15          	shr    $0x15,%rax
  8043e7:	48 89 c2             	mov    %rax,%rdx
  8043ea:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8043f1:	01 00 00 
  8043f4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8043f8:	83 e0 01             	and    $0x1,%eax
  8043fb:	48 85 c0             	test   %rax,%rax
  8043fe:	75 07                	jne    804407 <pageref+0x34>
  804400:	b8 00 00 00 00       	mov    $0x0,%eax
  804405:	eb 56                	jmp    80445d <pageref+0x8a>
  804407:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80440b:	48 c1 e8 0c          	shr    $0xc,%rax
  80440f:	48 89 c2             	mov    %rax,%rdx
  804412:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804419:	01 00 00 
  80441c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804420:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804424:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804428:	83 e0 01             	and    $0x1,%eax
  80442b:	48 85 c0             	test   %rax,%rax
  80442e:	75 07                	jne    804437 <pageref+0x64>
  804430:	b8 00 00 00 00       	mov    $0x0,%eax
  804435:	eb 26                	jmp    80445d <pageref+0x8a>
  804437:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80443b:	48 c1 e8 0c          	shr    $0xc,%rax
  80443f:	48 89 c2             	mov    %rax,%rdx
  804442:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804449:	00 00 00 
  80444c:	48 c1 e2 04          	shl    $0x4,%rdx
  804450:	48 01 d0             	add    %rdx,%rax
  804453:	48 83 c0 08          	add    $0x8,%rax
  804457:	0f b7 00             	movzwl (%rax),%eax
  80445a:	0f b7 c0             	movzwl %ax,%eax
  80445d:	c9                   	leaveq 
  80445e:	c3                   	retq   
