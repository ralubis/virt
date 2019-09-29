
vmm/guest/obj/user/hello:     file format elf64-x86-64


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
  80003c:	e8 5f 00 00 00       	callq  8000a0 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <umain>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80004e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800052:	48 bf c0 3f 80 00 00 	movabs $0x803fc0,%rdi
  800059:	00 00 00 
  80005c:	b8 00 00 00 00       	mov    $0x0,%eax
  800061:	48 ba 6e 02 80 00 00 	movabs $0x80026e,%rdx
  800068:	00 00 00 
  80006b:	ff d2                	callq  *%rdx
  80006d:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800074:	00 00 00 
  800077:	48 8b 00             	mov    (%rax),%rax
  80007a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  800080:	89 c6                	mov    %eax,%esi
  800082:	48 bf ce 3f 80 00 00 	movabs $0x803fce,%rdi
  800089:	00 00 00 
  80008c:	b8 00 00 00 00       	mov    $0x0,%eax
  800091:	48 ba 6e 02 80 00 00 	movabs $0x80026e,%rdx
  800098:	00 00 00 
  80009b:	ff d2                	callq  *%rdx
  80009d:	90                   	nop
  80009e:	c9                   	leaveq 
  80009f:	c3                   	retq   

00000000008000a0 <libmain>:
  8000a0:	55                   	push   %rbp
  8000a1:	48 89 e5             	mov    %rsp,%rbp
  8000a4:	48 83 ec 10          	sub    $0x10,%rsp
  8000a8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8000ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8000af:	48 b8 b5 16 80 00 00 	movabs $0x8016b5,%rax
  8000b6:	00 00 00 
  8000b9:	ff d0                	callq  *%rax
  8000bb:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000c0:	48 98                	cltq   
  8000c2:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8000c9:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8000d0:	00 00 00 
  8000d3:	48 01 c2             	add    %rax,%rdx
  8000d6:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8000dd:	00 00 00 
  8000e0:	48 89 10             	mov    %rdx,(%rax)
  8000e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000e7:	7e 14                	jle    8000fd <libmain+0x5d>
  8000e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8000ed:	48 8b 10             	mov    (%rax),%rdx
  8000f0:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  8000f7:	00 00 00 
  8000fa:	48 89 10             	mov    %rdx,(%rax)
  8000fd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800101:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800104:	48 89 d6             	mov    %rdx,%rsi
  800107:	89 c7                	mov    %eax,%edi
  800109:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800110:	00 00 00 
  800113:	ff d0                	callq  *%rax
  800115:	48 b8 24 01 80 00 00 	movabs $0x800124,%rax
  80011c:	00 00 00 
  80011f:	ff d0                	callq  *%rax
  800121:	90                   	nop
  800122:	c9                   	leaveq 
  800123:	c3                   	retq   

0000000000800124 <exit>:
  800124:	55                   	push   %rbp
  800125:	48 89 e5             	mov    %rsp,%rbp
  800128:	48 b8 6d 1e 80 00 00 	movabs $0x801e6d,%rax
  80012f:	00 00 00 
  800132:	ff d0                	callq  *%rax
  800134:	bf 00 00 00 00       	mov    $0x0,%edi
  800139:	48 b8 6f 16 80 00 00 	movabs $0x80166f,%rax
  800140:	00 00 00 
  800143:	ff d0                	callq  *%rax
  800145:	90                   	nop
  800146:	5d                   	pop    %rbp
  800147:	c3                   	retq   

0000000000800148 <putch>:
  800148:	55                   	push   %rbp
  800149:	48 89 e5             	mov    %rsp,%rbp
  80014c:	48 83 ec 10          	sub    $0x10,%rsp
  800150:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800153:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800157:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80015b:	8b 00                	mov    (%rax),%eax
  80015d:	8d 48 01             	lea    0x1(%rax),%ecx
  800160:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800164:	89 0a                	mov    %ecx,(%rdx)
  800166:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800169:	89 d1                	mov    %edx,%ecx
  80016b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80016f:	48 98                	cltq   
  800171:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800175:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800179:	8b 00                	mov    (%rax),%eax
  80017b:	3d ff 00 00 00       	cmp    $0xff,%eax
  800180:	75 2c                	jne    8001ae <putch+0x66>
  800182:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800186:	8b 00                	mov    (%rax),%eax
  800188:	48 98                	cltq   
  80018a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80018e:	48 83 c2 08          	add    $0x8,%rdx
  800192:	48 89 c6             	mov    %rax,%rsi
  800195:	48 89 d7             	mov    %rdx,%rdi
  800198:	48 b8 e6 15 80 00 00 	movabs $0x8015e6,%rax
  80019f:	00 00 00 
  8001a2:	ff d0                	callq  *%rax
  8001a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001a8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8001ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001b2:	8b 40 04             	mov    0x4(%rax),%eax
  8001b5:	8d 50 01             	lea    0x1(%rax),%edx
  8001b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8001bc:	89 50 04             	mov    %edx,0x4(%rax)
  8001bf:	90                   	nop
  8001c0:	c9                   	leaveq 
  8001c1:	c3                   	retq   

00000000008001c2 <vcprintf>:
  8001c2:	55                   	push   %rbp
  8001c3:	48 89 e5             	mov    %rsp,%rbp
  8001c6:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8001cd:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8001d4:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8001db:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  8001e2:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  8001e9:	48 8b 0a             	mov    (%rdx),%rcx
  8001ec:	48 89 08             	mov    %rcx,(%rax)
  8001ef:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8001f3:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8001f7:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8001fb:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8001ff:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800206:	00 00 00 
  800209:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800210:	00 00 00 
  800213:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  80021a:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800221:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800228:	48 89 c6             	mov    %rax,%rsi
  80022b:	48 bf 48 01 80 00 00 	movabs $0x800148,%rdi
  800232:	00 00 00 
  800235:	48 b8 0c 06 80 00 00 	movabs $0x80060c,%rax
  80023c:	00 00 00 
  80023f:	ff d0                	callq  *%rax
  800241:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800247:	48 98                	cltq   
  800249:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800250:	48 83 c2 08          	add    $0x8,%rdx
  800254:	48 89 c6             	mov    %rax,%rsi
  800257:	48 89 d7             	mov    %rdx,%rdi
  80025a:	48 b8 e6 15 80 00 00 	movabs $0x8015e6,%rax
  800261:	00 00 00 
  800264:	ff d0                	callq  *%rax
  800266:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80026c:	c9                   	leaveq 
  80026d:	c3                   	retq   

000000000080026e <cprintf>:
  80026e:	55                   	push   %rbp
  80026f:	48 89 e5             	mov    %rsp,%rbp
  800272:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800279:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800280:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800287:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80028e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800295:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80029c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8002a3:	84 c0                	test   %al,%al
  8002a5:	74 20                	je     8002c7 <cprintf+0x59>
  8002a7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8002ab:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8002af:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8002b3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8002b7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8002bb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8002bf:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8002c3:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8002c7:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8002ce:	00 00 00 
  8002d1:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8002d8:	00 00 00 
  8002db:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8002df:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8002e6:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8002ed:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8002f4:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8002fb:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800302:	48 8b 0a             	mov    (%rdx),%rcx
  800305:	48 89 08             	mov    %rcx,(%rax)
  800308:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80030c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800310:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800314:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800318:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80031f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800326:	48 89 d6             	mov    %rdx,%rsi
  800329:	48 89 c7             	mov    %rax,%rdi
  80032c:	48 b8 c2 01 80 00 00 	movabs $0x8001c2,%rax
  800333:	00 00 00 
  800336:	ff d0                	callq  *%rax
  800338:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80033e:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800344:	c9                   	leaveq 
  800345:	c3                   	retq   

0000000000800346 <printnum>:
  800346:	55                   	push   %rbp
  800347:	48 89 e5             	mov    %rsp,%rbp
  80034a:	48 83 ec 30          	sub    $0x30,%rsp
  80034e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800352:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800356:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80035a:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  80035d:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800361:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800365:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800368:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  80036c:	77 54                	ja     8003c2 <printnum+0x7c>
  80036e:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800371:	8d 78 ff             	lea    -0x1(%rax),%edi
  800374:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800377:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80037b:	ba 00 00 00 00       	mov    $0x0,%edx
  800380:	48 f7 f6             	div    %rsi
  800383:	49 89 c2             	mov    %rax,%r10
  800386:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800389:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80038c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800390:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800394:	41 89 c9             	mov    %ecx,%r9d
  800397:	41 89 f8             	mov    %edi,%r8d
  80039a:	89 d1                	mov    %edx,%ecx
  80039c:	4c 89 d2             	mov    %r10,%rdx
  80039f:	48 89 c7             	mov    %rax,%rdi
  8003a2:	48 b8 46 03 80 00 00 	movabs $0x800346,%rax
  8003a9:	00 00 00 
  8003ac:	ff d0                	callq  *%rax
  8003ae:	eb 1c                	jmp    8003cc <printnum+0x86>
  8003b0:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8003b4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8003b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003bb:	48 89 ce             	mov    %rcx,%rsi
  8003be:	89 d7                	mov    %edx,%edi
  8003c0:	ff d0                	callq  *%rax
  8003c2:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8003c6:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8003ca:	7f e4                	jg     8003b0 <printnum+0x6a>
  8003cc:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8003cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8003d3:	ba 00 00 00 00       	mov    $0x0,%edx
  8003d8:	48 f7 f1             	div    %rcx
  8003db:	48 b8 f0 41 80 00 00 	movabs $0x8041f0,%rax
  8003e2:	00 00 00 
  8003e5:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  8003e9:	0f be d0             	movsbl %al,%edx
  8003ec:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8003f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8003f4:	48 89 ce             	mov    %rcx,%rsi
  8003f7:	89 d7                	mov    %edx,%edi
  8003f9:	ff d0                	callq  *%rax
  8003fb:	90                   	nop
  8003fc:	c9                   	leaveq 
  8003fd:	c3                   	retq   

00000000008003fe <getuint>:
  8003fe:	55                   	push   %rbp
  8003ff:	48 89 e5             	mov    %rsp,%rbp
  800402:	48 83 ec 20          	sub    $0x20,%rsp
  800406:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80040a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80040d:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800411:	7e 4f                	jle    800462 <getuint+0x64>
  800413:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800417:	8b 00                	mov    (%rax),%eax
  800419:	83 f8 30             	cmp    $0x30,%eax
  80041c:	73 24                	jae    800442 <getuint+0x44>
  80041e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800422:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800426:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80042a:	8b 00                	mov    (%rax),%eax
  80042c:	89 c0                	mov    %eax,%eax
  80042e:	48 01 d0             	add    %rdx,%rax
  800431:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800435:	8b 12                	mov    (%rdx),%edx
  800437:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80043a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80043e:	89 0a                	mov    %ecx,(%rdx)
  800440:	eb 14                	jmp    800456 <getuint+0x58>
  800442:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800446:	48 8b 40 08          	mov    0x8(%rax),%rax
  80044a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80044e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800452:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800456:	48 8b 00             	mov    (%rax),%rax
  800459:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80045d:	e9 9d 00 00 00       	jmpq   8004ff <getuint+0x101>
  800462:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800466:	74 4c                	je     8004b4 <getuint+0xb6>
  800468:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80046c:	8b 00                	mov    (%rax),%eax
  80046e:	83 f8 30             	cmp    $0x30,%eax
  800471:	73 24                	jae    800497 <getuint+0x99>
  800473:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800477:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80047b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80047f:	8b 00                	mov    (%rax),%eax
  800481:	89 c0                	mov    %eax,%eax
  800483:	48 01 d0             	add    %rdx,%rax
  800486:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80048a:	8b 12                	mov    (%rdx),%edx
  80048c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80048f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800493:	89 0a                	mov    %ecx,(%rdx)
  800495:	eb 14                	jmp    8004ab <getuint+0xad>
  800497:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80049b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80049f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8004a3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004a7:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8004ab:	48 8b 00             	mov    (%rax),%rax
  8004ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8004b2:	eb 4b                	jmp    8004ff <getuint+0x101>
  8004b4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004b8:	8b 00                	mov    (%rax),%eax
  8004ba:	83 f8 30             	cmp    $0x30,%eax
  8004bd:	73 24                	jae    8004e3 <getuint+0xe5>
  8004bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004c3:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8004c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004cb:	8b 00                	mov    (%rax),%eax
  8004cd:	89 c0                	mov    %eax,%eax
  8004cf:	48 01 d0             	add    %rdx,%rax
  8004d2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004d6:	8b 12                	mov    (%rdx),%edx
  8004d8:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8004db:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004df:	89 0a                	mov    %ecx,(%rdx)
  8004e1:	eb 14                	jmp    8004f7 <getuint+0xf9>
  8004e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004e7:	48 8b 40 08          	mov    0x8(%rax),%rax
  8004eb:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8004ef:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8004f3:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8004f7:	8b 00                	mov    (%rax),%eax
  8004f9:	89 c0                	mov    %eax,%eax
  8004fb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8004ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800503:	c9                   	leaveq 
  800504:	c3                   	retq   

0000000000800505 <getint>:
  800505:	55                   	push   %rbp
  800506:	48 89 e5             	mov    %rsp,%rbp
  800509:	48 83 ec 20          	sub    $0x20,%rsp
  80050d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800511:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800514:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800518:	7e 4f                	jle    800569 <getint+0x64>
  80051a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80051e:	8b 00                	mov    (%rax),%eax
  800520:	83 f8 30             	cmp    $0x30,%eax
  800523:	73 24                	jae    800549 <getint+0x44>
  800525:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800529:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80052d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800531:	8b 00                	mov    (%rax),%eax
  800533:	89 c0                	mov    %eax,%eax
  800535:	48 01 d0             	add    %rdx,%rax
  800538:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80053c:	8b 12                	mov    (%rdx),%edx
  80053e:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800541:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800545:	89 0a                	mov    %ecx,(%rdx)
  800547:	eb 14                	jmp    80055d <getint+0x58>
  800549:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80054d:	48 8b 40 08          	mov    0x8(%rax),%rax
  800551:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800555:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800559:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80055d:	48 8b 00             	mov    (%rax),%rax
  800560:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800564:	e9 9d 00 00 00       	jmpq   800606 <getint+0x101>
  800569:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80056d:	74 4c                	je     8005bb <getint+0xb6>
  80056f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800573:	8b 00                	mov    (%rax),%eax
  800575:	83 f8 30             	cmp    $0x30,%eax
  800578:	73 24                	jae    80059e <getint+0x99>
  80057a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80057e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800582:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800586:	8b 00                	mov    (%rax),%eax
  800588:	89 c0                	mov    %eax,%eax
  80058a:	48 01 d0             	add    %rdx,%rax
  80058d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800591:	8b 12                	mov    (%rdx),%edx
  800593:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800596:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80059a:	89 0a                	mov    %ecx,(%rdx)
  80059c:	eb 14                	jmp    8005b2 <getint+0xad>
  80059e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005a2:	48 8b 40 08          	mov    0x8(%rax),%rax
  8005a6:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8005aa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005ae:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005b2:	48 8b 00             	mov    (%rax),%rax
  8005b5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005b9:	eb 4b                	jmp    800606 <getint+0x101>
  8005bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005bf:	8b 00                	mov    (%rax),%eax
  8005c1:	83 f8 30             	cmp    $0x30,%eax
  8005c4:	73 24                	jae    8005ea <getint+0xe5>
  8005c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ca:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005d2:	8b 00                	mov    (%rax),%eax
  8005d4:	89 c0                	mov    %eax,%eax
  8005d6:	48 01 d0             	add    %rdx,%rax
  8005d9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005dd:	8b 12                	mov    (%rdx),%edx
  8005df:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005e2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005e6:	89 0a                	mov    %ecx,(%rdx)
  8005e8:	eb 14                	jmp    8005fe <getint+0xf9>
  8005ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ee:	48 8b 40 08          	mov    0x8(%rax),%rax
  8005f2:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8005f6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005fa:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005fe:	8b 00                	mov    (%rax),%eax
  800600:	48 98                	cltq   
  800602:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800606:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80060a:	c9                   	leaveq 
  80060b:	c3                   	retq   

000000000080060c <vprintfmt>:
  80060c:	55                   	push   %rbp
  80060d:	48 89 e5             	mov    %rsp,%rbp
  800610:	41 54                	push   %r12
  800612:	53                   	push   %rbx
  800613:	48 83 ec 60          	sub    $0x60,%rsp
  800617:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80061b:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80061f:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800623:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800627:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80062b:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  80062f:	48 8b 0a             	mov    (%rdx),%rcx
  800632:	48 89 08             	mov    %rcx,(%rax)
  800635:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800639:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80063d:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800641:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800645:	eb 17                	jmp    80065e <vprintfmt+0x52>
  800647:	85 db                	test   %ebx,%ebx
  800649:	0f 84 b9 04 00 00    	je     800b08 <vprintfmt+0x4fc>
  80064f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800653:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800657:	48 89 d6             	mov    %rdx,%rsi
  80065a:	89 df                	mov    %ebx,%edi
  80065c:	ff d0                	callq  *%rax
  80065e:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800662:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800666:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80066a:	0f b6 00             	movzbl (%rax),%eax
  80066d:	0f b6 d8             	movzbl %al,%ebx
  800670:	83 fb 25             	cmp    $0x25,%ebx
  800673:	75 d2                	jne    800647 <vprintfmt+0x3b>
  800675:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800679:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800680:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800687:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80068e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800695:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800699:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80069d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8006a1:	0f b6 00             	movzbl (%rax),%eax
  8006a4:	0f b6 d8             	movzbl %al,%ebx
  8006a7:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8006aa:	83 f8 55             	cmp    $0x55,%eax
  8006ad:	0f 87 22 04 00 00    	ja     800ad5 <vprintfmt+0x4c9>
  8006b3:	89 c0                	mov    %eax,%eax
  8006b5:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8006bc:	00 
  8006bd:	48 b8 18 42 80 00 00 	movabs $0x804218,%rax
  8006c4:	00 00 00 
  8006c7:	48 01 d0             	add    %rdx,%rax
  8006ca:	48 8b 00             	mov    (%rax),%rax
  8006cd:	ff e0                	jmpq   *%rax
  8006cf:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8006d3:	eb c0                	jmp    800695 <vprintfmt+0x89>
  8006d5:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8006d9:	eb ba                	jmp    800695 <vprintfmt+0x89>
  8006db:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  8006e2:	8b 55 d8             	mov    -0x28(%rbp),%edx
  8006e5:	89 d0                	mov    %edx,%eax
  8006e7:	c1 e0 02             	shl    $0x2,%eax
  8006ea:	01 d0                	add    %edx,%eax
  8006ec:	01 c0                	add    %eax,%eax
  8006ee:	01 d8                	add    %ebx,%eax
  8006f0:	83 e8 30             	sub    $0x30,%eax
  8006f3:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8006f6:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8006fa:	0f b6 00             	movzbl (%rax),%eax
  8006fd:	0f be d8             	movsbl %al,%ebx
  800700:	83 fb 2f             	cmp    $0x2f,%ebx
  800703:	7e 60                	jle    800765 <vprintfmt+0x159>
  800705:	83 fb 39             	cmp    $0x39,%ebx
  800708:	7f 5b                	jg     800765 <vprintfmt+0x159>
  80070a:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80070f:	eb d1                	jmp    8006e2 <vprintfmt+0xd6>
  800711:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800714:	83 f8 30             	cmp    $0x30,%eax
  800717:	73 17                	jae    800730 <vprintfmt+0x124>
  800719:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80071d:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800720:	89 d2                	mov    %edx,%edx
  800722:	48 01 d0             	add    %rdx,%rax
  800725:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800728:	83 c2 08             	add    $0x8,%edx
  80072b:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80072e:	eb 0c                	jmp    80073c <vprintfmt+0x130>
  800730:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800734:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800738:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80073c:	8b 00                	mov    (%rax),%eax
  80073e:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800741:	eb 23                	jmp    800766 <vprintfmt+0x15a>
  800743:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800747:	0f 89 48 ff ff ff    	jns    800695 <vprintfmt+0x89>
  80074d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800754:	e9 3c ff ff ff       	jmpq   800695 <vprintfmt+0x89>
  800759:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800760:	e9 30 ff ff ff       	jmpq   800695 <vprintfmt+0x89>
  800765:	90                   	nop
  800766:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80076a:	0f 89 25 ff ff ff    	jns    800695 <vprintfmt+0x89>
  800770:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800773:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800776:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  80077d:	e9 13 ff ff ff       	jmpq   800695 <vprintfmt+0x89>
  800782:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800786:	e9 0a ff ff ff       	jmpq   800695 <vprintfmt+0x89>
  80078b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80078e:	83 f8 30             	cmp    $0x30,%eax
  800791:	73 17                	jae    8007aa <vprintfmt+0x19e>
  800793:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800797:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80079a:	89 d2                	mov    %edx,%edx
  80079c:	48 01 d0             	add    %rdx,%rax
  80079f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8007a2:	83 c2 08             	add    $0x8,%edx
  8007a5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8007a8:	eb 0c                	jmp    8007b6 <vprintfmt+0x1aa>
  8007aa:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8007ae:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8007b2:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8007b6:	8b 10                	mov    (%rax),%edx
  8007b8:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8007bc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8007c0:	48 89 ce             	mov    %rcx,%rsi
  8007c3:	89 d7                	mov    %edx,%edi
  8007c5:	ff d0                	callq  *%rax
  8007c7:	e9 37 03 00 00       	jmpq   800b03 <vprintfmt+0x4f7>
  8007cc:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8007cf:	83 f8 30             	cmp    $0x30,%eax
  8007d2:	73 17                	jae    8007eb <vprintfmt+0x1df>
  8007d4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8007d8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8007db:	89 d2                	mov    %edx,%edx
  8007dd:	48 01 d0             	add    %rdx,%rax
  8007e0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8007e3:	83 c2 08             	add    $0x8,%edx
  8007e6:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8007e9:	eb 0c                	jmp    8007f7 <vprintfmt+0x1eb>
  8007eb:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8007ef:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8007f3:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8007f7:	8b 18                	mov    (%rax),%ebx
  8007f9:	85 db                	test   %ebx,%ebx
  8007fb:	79 02                	jns    8007ff <vprintfmt+0x1f3>
  8007fd:	f7 db                	neg    %ebx
  8007ff:	83 fb 15             	cmp    $0x15,%ebx
  800802:	7f 16                	jg     80081a <vprintfmt+0x20e>
  800804:	48 b8 40 41 80 00 00 	movabs $0x804140,%rax
  80080b:	00 00 00 
  80080e:	48 63 d3             	movslq %ebx,%rdx
  800811:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800815:	4d 85 e4             	test   %r12,%r12
  800818:	75 2e                	jne    800848 <vprintfmt+0x23c>
  80081a:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80081e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800822:	89 d9                	mov    %ebx,%ecx
  800824:	48 ba 01 42 80 00 00 	movabs $0x804201,%rdx
  80082b:	00 00 00 
  80082e:	48 89 c7             	mov    %rax,%rdi
  800831:	b8 00 00 00 00       	mov    $0x0,%eax
  800836:	49 b8 12 0b 80 00 00 	movabs $0x800b12,%r8
  80083d:	00 00 00 
  800840:	41 ff d0             	callq  *%r8
  800843:	e9 bb 02 00 00       	jmpq   800b03 <vprintfmt+0x4f7>
  800848:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  80084c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800850:	4c 89 e1             	mov    %r12,%rcx
  800853:	48 ba 0a 42 80 00 00 	movabs $0x80420a,%rdx
  80085a:	00 00 00 
  80085d:	48 89 c7             	mov    %rax,%rdi
  800860:	b8 00 00 00 00       	mov    $0x0,%eax
  800865:	49 b8 12 0b 80 00 00 	movabs $0x800b12,%r8
  80086c:	00 00 00 
  80086f:	41 ff d0             	callq  *%r8
  800872:	e9 8c 02 00 00       	jmpq   800b03 <vprintfmt+0x4f7>
  800877:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80087a:	83 f8 30             	cmp    $0x30,%eax
  80087d:	73 17                	jae    800896 <vprintfmt+0x28a>
  80087f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800883:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800886:	89 d2                	mov    %edx,%edx
  800888:	48 01 d0             	add    %rdx,%rax
  80088b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80088e:	83 c2 08             	add    $0x8,%edx
  800891:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800894:	eb 0c                	jmp    8008a2 <vprintfmt+0x296>
  800896:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80089a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80089e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8008a2:	4c 8b 20             	mov    (%rax),%r12
  8008a5:	4d 85 e4             	test   %r12,%r12
  8008a8:	75 0a                	jne    8008b4 <vprintfmt+0x2a8>
  8008aa:	49 bc 0d 42 80 00 00 	movabs $0x80420d,%r12
  8008b1:	00 00 00 
  8008b4:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8008b8:	7e 78                	jle    800932 <vprintfmt+0x326>
  8008ba:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8008be:	74 72                	je     800932 <vprintfmt+0x326>
  8008c0:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8008c3:	48 98                	cltq   
  8008c5:	48 89 c6             	mov    %rax,%rsi
  8008c8:	4c 89 e7             	mov    %r12,%rdi
  8008cb:	48 b8 c0 0d 80 00 00 	movabs $0x800dc0,%rax
  8008d2:	00 00 00 
  8008d5:	ff d0                	callq  *%rax
  8008d7:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8008da:	eb 17                	jmp    8008f3 <vprintfmt+0x2e7>
  8008dc:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  8008e0:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8008e4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008e8:	48 89 ce             	mov    %rcx,%rsi
  8008eb:	89 d7                	mov    %edx,%edi
  8008ed:	ff d0                	callq  *%rax
  8008ef:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  8008f3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8008f7:	7f e3                	jg     8008dc <vprintfmt+0x2d0>
  8008f9:	eb 37                	jmp    800932 <vprintfmt+0x326>
  8008fb:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  8008ff:	74 1e                	je     80091f <vprintfmt+0x313>
  800901:	83 fb 1f             	cmp    $0x1f,%ebx
  800904:	7e 05                	jle    80090b <vprintfmt+0x2ff>
  800906:	83 fb 7e             	cmp    $0x7e,%ebx
  800909:	7e 14                	jle    80091f <vprintfmt+0x313>
  80090b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80090f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800913:	48 89 d6             	mov    %rdx,%rsi
  800916:	bf 3f 00 00 00       	mov    $0x3f,%edi
  80091b:	ff d0                	callq  *%rax
  80091d:	eb 0f                	jmp    80092e <vprintfmt+0x322>
  80091f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800923:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800927:	48 89 d6             	mov    %rdx,%rsi
  80092a:	89 df                	mov    %ebx,%edi
  80092c:	ff d0                	callq  *%rax
  80092e:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800932:	4c 89 e0             	mov    %r12,%rax
  800935:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800939:	0f b6 00             	movzbl (%rax),%eax
  80093c:	0f be d8             	movsbl %al,%ebx
  80093f:	85 db                	test   %ebx,%ebx
  800941:	74 28                	je     80096b <vprintfmt+0x35f>
  800943:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800947:	78 b2                	js     8008fb <vprintfmt+0x2ef>
  800949:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80094d:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800951:	79 a8                	jns    8008fb <vprintfmt+0x2ef>
  800953:	eb 16                	jmp    80096b <vprintfmt+0x35f>
  800955:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800959:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80095d:	48 89 d6             	mov    %rdx,%rsi
  800960:	bf 20 00 00 00       	mov    $0x20,%edi
  800965:	ff d0                	callq  *%rax
  800967:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  80096b:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80096f:	7f e4                	jg     800955 <vprintfmt+0x349>
  800971:	e9 8d 01 00 00       	jmpq   800b03 <vprintfmt+0x4f7>
  800976:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80097a:	be 03 00 00 00       	mov    $0x3,%esi
  80097f:	48 89 c7             	mov    %rax,%rdi
  800982:	48 b8 05 05 80 00 00 	movabs $0x800505,%rax
  800989:	00 00 00 
  80098c:	ff d0                	callq  *%rax
  80098e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800992:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800996:	48 85 c0             	test   %rax,%rax
  800999:	79 1d                	jns    8009b8 <vprintfmt+0x3ac>
  80099b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80099f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8009a3:	48 89 d6             	mov    %rdx,%rsi
  8009a6:	bf 2d 00 00 00       	mov    $0x2d,%edi
  8009ab:	ff d0                	callq  *%rax
  8009ad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b1:	48 f7 d8             	neg    %rax
  8009b4:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8009b8:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8009bf:	e9 d2 00 00 00       	jmpq   800a96 <vprintfmt+0x48a>
  8009c4:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8009c8:	be 03 00 00 00       	mov    $0x3,%esi
  8009cd:	48 89 c7             	mov    %rax,%rdi
  8009d0:	48 b8 fe 03 80 00 00 	movabs $0x8003fe,%rax
  8009d7:	00 00 00 
  8009da:	ff d0                	callq  *%rax
  8009dc:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8009e0:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8009e7:	e9 aa 00 00 00       	jmpq   800a96 <vprintfmt+0x48a>
  8009ec:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8009f0:	be 03 00 00 00       	mov    $0x3,%esi
  8009f5:	48 89 c7             	mov    %rax,%rdi
  8009f8:	48 b8 fe 03 80 00 00 	movabs $0x8003fe,%rax
  8009ff:	00 00 00 
  800a02:	ff d0                	callq  *%rax
  800a04:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a08:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800a0f:	e9 82 00 00 00       	jmpq   800a96 <vprintfmt+0x48a>
  800a14:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a18:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a1c:	48 89 d6             	mov    %rdx,%rsi
  800a1f:	bf 30 00 00 00       	mov    $0x30,%edi
  800a24:	ff d0                	callq  *%rax
  800a26:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a2a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a2e:	48 89 d6             	mov    %rdx,%rsi
  800a31:	bf 78 00 00 00       	mov    $0x78,%edi
  800a36:	ff d0                	callq  *%rax
  800a38:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a3b:	83 f8 30             	cmp    $0x30,%eax
  800a3e:	73 17                	jae    800a57 <vprintfmt+0x44b>
  800a40:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a44:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a47:	89 d2                	mov    %edx,%edx
  800a49:	48 01 d0             	add    %rdx,%rax
  800a4c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a4f:	83 c2 08             	add    $0x8,%edx
  800a52:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a55:	eb 0c                	jmp    800a63 <vprintfmt+0x457>
  800a57:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a5b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a5f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a63:	48 8b 00             	mov    (%rax),%rax
  800a66:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a6a:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800a71:	eb 23                	jmp    800a96 <vprintfmt+0x48a>
  800a73:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a77:	be 03 00 00 00       	mov    $0x3,%esi
  800a7c:	48 89 c7             	mov    %rax,%rdi
  800a7f:	48 b8 fe 03 80 00 00 	movabs $0x8003fe,%rax
  800a86:	00 00 00 
  800a89:	ff d0                	callq  *%rax
  800a8b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800a8f:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800a96:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800a9b:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800a9e:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800aa1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800aa5:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800aa9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800aad:	45 89 c1             	mov    %r8d,%r9d
  800ab0:	41 89 f8             	mov    %edi,%r8d
  800ab3:	48 89 c7             	mov    %rax,%rdi
  800ab6:	48 b8 46 03 80 00 00 	movabs $0x800346,%rax
  800abd:	00 00 00 
  800ac0:	ff d0                	callq  *%rax
  800ac2:	eb 3f                	jmp    800b03 <vprintfmt+0x4f7>
  800ac4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ac8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800acc:	48 89 d6             	mov    %rdx,%rsi
  800acf:	89 df                	mov    %ebx,%edi
  800ad1:	ff d0                	callq  *%rax
  800ad3:	eb 2e                	jmp    800b03 <vprintfmt+0x4f7>
  800ad5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ad9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800add:	48 89 d6             	mov    %rdx,%rsi
  800ae0:	bf 25 00 00 00       	mov    $0x25,%edi
  800ae5:	ff d0                	callq  *%rax
  800ae7:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800aec:	eb 05                	jmp    800af3 <vprintfmt+0x4e7>
  800aee:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800af3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800af7:	48 83 e8 01          	sub    $0x1,%rax
  800afb:	0f b6 00             	movzbl (%rax),%eax
  800afe:	3c 25                	cmp    $0x25,%al
  800b00:	75 ec                	jne    800aee <vprintfmt+0x4e2>
  800b02:	90                   	nop
  800b03:	e9 3d fb ff ff       	jmpq   800645 <vprintfmt+0x39>
  800b08:	90                   	nop
  800b09:	48 83 c4 60          	add    $0x60,%rsp
  800b0d:	5b                   	pop    %rbx
  800b0e:	41 5c                	pop    %r12
  800b10:	5d                   	pop    %rbp
  800b11:	c3                   	retq   

0000000000800b12 <printfmt>:
  800b12:	55                   	push   %rbp
  800b13:	48 89 e5             	mov    %rsp,%rbp
  800b16:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800b1d:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800b24:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800b2b:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800b32:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800b39:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800b40:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800b47:	84 c0                	test   %al,%al
  800b49:	74 20                	je     800b6b <printfmt+0x59>
  800b4b:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800b4f:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800b53:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800b57:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800b5b:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800b5f:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800b63:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800b67:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800b6b:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800b72:	00 00 00 
  800b75:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800b7c:	00 00 00 
  800b7f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800b83:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800b8a:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800b91:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800b98:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800b9f:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800ba6:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800bad:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800bb4:	48 89 c7             	mov    %rax,%rdi
  800bb7:	48 b8 0c 06 80 00 00 	movabs $0x80060c,%rax
  800bbe:	00 00 00 
  800bc1:	ff d0                	callq  *%rax
  800bc3:	90                   	nop
  800bc4:	c9                   	leaveq 
  800bc5:	c3                   	retq   

0000000000800bc6 <sprintputch>:
  800bc6:	55                   	push   %rbp
  800bc7:	48 89 e5             	mov    %rsp,%rbp
  800bca:	48 83 ec 10          	sub    $0x10,%rsp
  800bce:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800bd1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800bd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800bd9:	8b 40 10             	mov    0x10(%rax),%eax
  800bdc:	8d 50 01             	lea    0x1(%rax),%edx
  800bdf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800be3:	89 50 10             	mov    %edx,0x10(%rax)
  800be6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800bea:	48 8b 10             	mov    (%rax),%rdx
  800bed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800bf1:	48 8b 40 08          	mov    0x8(%rax),%rax
  800bf5:	48 39 c2             	cmp    %rax,%rdx
  800bf8:	73 17                	jae    800c11 <sprintputch+0x4b>
  800bfa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800bfe:	48 8b 00             	mov    (%rax),%rax
  800c01:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800c05:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800c09:	48 89 0a             	mov    %rcx,(%rdx)
  800c0c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800c0f:	88 10                	mov    %dl,(%rax)
  800c11:	90                   	nop
  800c12:	c9                   	leaveq 
  800c13:	c3                   	retq   

0000000000800c14 <vsnprintf>:
  800c14:	55                   	push   %rbp
  800c15:	48 89 e5             	mov    %rsp,%rbp
  800c18:	48 83 ec 50          	sub    $0x50,%rsp
  800c1c:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800c20:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800c23:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800c27:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800c2b:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800c2f:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800c33:	48 8b 0a             	mov    (%rdx),%rcx
  800c36:	48 89 08             	mov    %rcx,(%rax)
  800c39:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800c3d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800c41:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800c45:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800c49:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c4d:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800c51:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800c54:	48 98                	cltq   
  800c56:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800c5a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800c5e:	48 01 d0             	add    %rdx,%rax
  800c61:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800c65:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800c6c:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800c71:	74 06                	je     800c79 <vsnprintf+0x65>
  800c73:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800c77:	7f 07                	jg     800c80 <vsnprintf+0x6c>
  800c79:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800c7e:	eb 2f                	jmp    800caf <vsnprintf+0x9b>
  800c80:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800c84:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800c88:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800c8c:	48 89 c6             	mov    %rax,%rsi
  800c8f:	48 bf c6 0b 80 00 00 	movabs $0x800bc6,%rdi
  800c96:	00 00 00 
  800c99:	48 b8 0c 06 80 00 00 	movabs $0x80060c,%rax
  800ca0:	00 00 00 
  800ca3:	ff d0                	callq  *%rax
  800ca5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800ca9:	c6 00 00             	movb   $0x0,(%rax)
  800cac:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800caf:	c9                   	leaveq 
  800cb0:	c3                   	retq   

0000000000800cb1 <snprintf>:
  800cb1:	55                   	push   %rbp
  800cb2:	48 89 e5             	mov    %rsp,%rbp
  800cb5:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800cbc:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800cc3:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800cc9:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800cd0:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800cd7:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800cde:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800ce5:	84 c0                	test   %al,%al
  800ce7:	74 20                	je     800d09 <snprintf+0x58>
  800ce9:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800ced:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800cf1:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800cf5:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800cf9:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800cfd:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800d01:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800d05:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800d09:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800d10:	00 00 00 
  800d13:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800d1a:	00 00 00 
  800d1d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800d21:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800d28:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800d2f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800d36:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800d3d:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800d44:	48 8b 0a             	mov    (%rdx),%rcx
  800d47:	48 89 08             	mov    %rcx,(%rax)
  800d4a:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d4e:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800d52:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800d56:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800d5a:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800d61:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800d68:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800d6e:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800d75:	48 89 c7             	mov    %rax,%rdi
  800d78:	48 b8 14 0c 80 00 00 	movabs $0x800c14,%rax
  800d7f:	00 00 00 
  800d82:	ff d0                	callq  *%rax
  800d84:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800d8a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800d90:	c9                   	leaveq 
  800d91:	c3                   	retq   

0000000000800d92 <strlen>:
  800d92:	55                   	push   %rbp
  800d93:	48 89 e5             	mov    %rsp,%rbp
  800d96:	48 83 ec 18          	sub    $0x18,%rsp
  800d9a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800d9e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800da5:	eb 09                	jmp    800db0 <strlen+0x1e>
  800da7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800dab:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800db0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800db4:	0f b6 00             	movzbl (%rax),%eax
  800db7:	84 c0                	test   %al,%al
  800db9:	75 ec                	jne    800da7 <strlen+0x15>
  800dbb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800dbe:	c9                   	leaveq 
  800dbf:	c3                   	retq   

0000000000800dc0 <strnlen>:
  800dc0:	55                   	push   %rbp
  800dc1:	48 89 e5             	mov    %rsp,%rbp
  800dc4:	48 83 ec 20          	sub    $0x20,%rsp
  800dc8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800dcc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800dd0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800dd7:	eb 0e                	jmp    800de7 <strnlen+0x27>
  800dd9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800ddd:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800de2:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800de7:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800dec:	74 0b                	je     800df9 <strnlen+0x39>
  800dee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800df2:	0f b6 00             	movzbl (%rax),%eax
  800df5:	84 c0                	test   %al,%al
  800df7:	75 e0                	jne    800dd9 <strnlen+0x19>
  800df9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800dfc:	c9                   	leaveq 
  800dfd:	c3                   	retq   

0000000000800dfe <strcpy>:
  800dfe:	55                   	push   %rbp
  800dff:	48 89 e5             	mov    %rsp,%rbp
  800e02:	48 83 ec 20          	sub    $0x20,%rsp
  800e06:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e0a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800e0e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e12:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800e16:	90                   	nop
  800e17:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e1b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800e1f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800e23:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800e27:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800e2b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800e2f:	0f b6 12             	movzbl (%rdx),%edx
  800e32:	88 10                	mov    %dl,(%rax)
  800e34:	0f b6 00             	movzbl (%rax),%eax
  800e37:	84 c0                	test   %al,%al
  800e39:	75 dc                	jne    800e17 <strcpy+0x19>
  800e3b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800e3f:	c9                   	leaveq 
  800e40:	c3                   	retq   

0000000000800e41 <strcat>:
  800e41:	55                   	push   %rbp
  800e42:	48 89 e5             	mov    %rsp,%rbp
  800e45:	48 83 ec 20          	sub    $0x20,%rsp
  800e49:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e4d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800e51:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e55:	48 89 c7             	mov    %rax,%rdi
  800e58:	48 b8 92 0d 80 00 00 	movabs $0x800d92,%rax
  800e5f:	00 00 00 
  800e62:	ff d0                	callq  *%rax
  800e64:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800e67:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800e6a:	48 63 d0             	movslq %eax,%rdx
  800e6d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e71:	48 01 c2             	add    %rax,%rdx
  800e74:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800e78:	48 89 c6             	mov    %rax,%rsi
  800e7b:	48 89 d7             	mov    %rdx,%rdi
  800e7e:	48 b8 fe 0d 80 00 00 	movabs $0x800dfe,%rax
  800e85:	00 00 00 
  800e88:	ff d0                	callq  *%rax
  800e8a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800e8e:	c9                   	leaveq 
  800e8f:	c3                   	retq   

0000000000800e90 <strncpy>:
  800e90:	55                   	push   %rbp
  800e91:	48 89 e5             	mov    %rsp,%rbp
  800e94:	48 83 ec 28          	sub    $0x28,%rsp
  800e98:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800e9c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800ea0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800ea4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ea8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800eac:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  800eb3:	00 
  800eb4:	eb 2a                	jmp    800ee0 <strncpy+0x50>
  800eb6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800eba:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800ebe:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800ec2:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800ec6:	0f b6 12             	movzbl (%rdx),%edx
  800ec9:	88 10                	mov    %dl,(%rax)
  800ecb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800ecf:	0f b6 00             	movzbl (%rax),%eax
  800ed2:	84 c0                	test   %al,%al
  800ed4:	74 05                	je     800edb <strncpy+0x4b>
  800ed6:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  800edb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800ee0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800ee4:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  800ee8:	72 cc                	jb     800eb6 <strncpy+0x26>
  800eea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800eee:	c9                   	leaveq 
  800eef:	c3                   	retq   

0000000000800ef0 <strlcpy>:
  800ef0:	55                   	push   %rbp
  800ef1:	48 89 e5             	mov    %rsp,%rbp
  800ef4:	48 83 ec 28          	sub    $0x28,%rsp
  800ef8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800efc:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f00:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800f04:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f08:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f0c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800f11:	74 3d                	je     800f50 <strlcpy+0x60>
  800f13:	eb 1d                	jmp    800f32 <strlcpy+0x42>
  800f15:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f19:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f1d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800f21:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800f25:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800f29:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800f2d:	0f b6 12             	movzbl (%rdx),%edx
  800f30:	88 10                	mov    %dl,(%rax)
  800f32:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  800f37:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800f3c:	74 0b                	je     800f49 <strlcpy+0x59>
  800f3e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800f42:	0f b6 00             	movzbl (%rax),%eax
  800f45:	84 c0                	test   %al,%al
  800f47:	75 cc                	jne    800f15 <strlcpy+0x25>
  800f49:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f4d:	c6 00 00             	movb   $0x0,(%rax)
  800f50:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800f54:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f58:	48 29 c2             	sub    %rax,%rdx
  800f5b:	48 89 d0             	mov    %rdx,%rax
  800f5e:	c9                   	leaveq 
  800f5f:	c3                   	retq   

0000000000800f60 <strcmp>:
  800f60:	55                   	push   %rbp
  800f61:	48 89 e5             	mov    %rsp,%rbp
  800f64:	48 83 ec 10          	sub    $0x10,%rsp
  800f68:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800f6c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800f70:	eb 0a                	jmp    800f7c <strcmp+0x1c>
  800f72:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800f77:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  800f7c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f80:	0f b6 00             	movzbl (%rax),%eax
  800f83:	84 c0                	test   %al,%al
  800f85:	74 12                	je     800f99 <strcmp+0x39>
  800f87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f8b:	0f b6 10             	movzbl (%rax),%edx
  800f8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800f92:	0f b6 00             	movzbl (%rax),%eax
  800f95:	38 c2                	cmp    %al,%dl
  800f97:	74 d9                	je     800f72 <strcmp+0x12>
  800f99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f9d:	0f b6 00             	movzbl (%rax),%eax
  800fa0:	0f b6 d0             	movzbl %al,%edx
  800fa3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800fa7:	0f b6 00             	movzbl (%rax),%eax
  800faa:	0f b6 c0             	movzbl %al,%eax
  800fad:	29 c2                	sub    %eax,%edx
  800faf:	89 d0                	mov    %edx,%eax
  800fb1:	c9                   	leaveq 
  800fb2:	c3                   	retq   

0000000000800fb3 <strncmp>:
  800fb3:	55                   	push   %rbp
  800fb4:	48 89 e5             	mov    %rsp,%rbp
  800fb7:	48 83 ec 18          	sub    $0x18,%rsp
  800fbb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800fbf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800fc3:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800fc7:	eb 0f                	jmp    800fd8 <strncmp+0x25>
  800fc9:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  800fce:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  800fd3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  800fd8:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  800fdd:	74 1d                	je     800ffc <strncmp+0x49>
  800fdf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fe3:	0f b6 00             	movzbl (%rax),%eax
  800fe6:	84 c0                	test   %al,%al
  800fe8:	74 12                	je     800ffc <strncmp+0x49>
  800fea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800fee:	0f b6 10             	movzbl (%rax),%edx
  800ff1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800ff5:	0f b6 00             	movzbl (%rax),%eax
  800ff8:	38 c2                	cmp    %al,%dl
  800ffa:	74 cd                	je     800fc9 <strncmp+0x16>
  800ffc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801001:	75 07                	jne    80100a <strncmp+0x57>
  801003:	b8 00 00 00 00       	mov    $0x0,%eax
  801008:	eb 18                	jmp    801022 <strncmp+0x6f>
  80100a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80100e:	0f b6 00             	movzbl (%rax),%eax
  801011:	0f b6 d0             	movzbl %al,%edx
  801014:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801018:	0f b6 00             	movzbl (%rax),%eax
  80101b:	0f b6 c0             	movzbl %al,%eax
  80101e:	29 c2                	sub    %eax,%edx
  801020:	89 d0                	mov    %edx,%eax
  801022:	c9                   	leaveq 
  801023:	c3                   	retq   

0000000000801024 <strchr>:
  801024:	55                   	push   %rbp
  801025:	48 89 e5             	mov    %rsp,%rbp
  801028:	48 83 ec 10          	sub    $0x10,%rsp
  80102c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801030:	89 f0                	mov    %esi,%eax
  801032:	88 45 f4             	mov    %al,-0xc(%rbp)
  801035:	eb 17                	jmp    80104e <strchr+0x2a>
  801037:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80103b:	0f b6 00             	movzbl (%rax),%eax
  80103e:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801041:	75 06                	jne    801049 <strchr+0x25>
  801043:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801047:	eb 15                	jmp    80105e <strchr+0x3a>
  801049:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80104e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801052:	0f b6 00             	movzbl (%rax),%eax
  801055:	84 c0                	test   %al,%al
  801057:	75 de                	jne    801037 <strchr+0x13>
  801059:	b8 00 00 00 00       	mov    $0x0,%eax
  80105e:	c9                   	leaveq 
  80105f:	c3                   	retq   

0000000000801060 <strfind>:
  801060:	55                   	push   %rbp
  801061:	48 89 e5             	mov    %rsp,%rbp
  801064:	48 83 ec 10          	sub    $0x10,%rsp
  801068:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80106c:	89 f0                	mov    %esi,%eax
  80106e:	88 45 f4             	mov    %al,-0xc(%rbp)
  801071:	eb 11                	jmp    801084 <strfind+0x24>
  801073:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801077:	0f b6 00             	movzbl (%rax),%eax
  80107a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80107d:	74 12                	je     801091 <strfind+0x31>
  80107f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801084:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801088:	0f b6 00             	movzbl (%rax),%eax
  80108b:	84 c0                	test   %al,%al
  80108d:	75 e4                	jne    801073 <strfind+0x13>
  80108f:	eb 01                	jmp    801092 <strfind+0x32>
  801091:	90                   	nop
  801092:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801096:	c9                   	leaveq 
  801097:	c3                   	retq   

0000000000801098 <memset>:
  801098:	55                   	push   %rbp
  801099:	48 89 e5             	mov    %rsp,%rbp
  80109c:	48 83 ec 18          	sub    $0x18,%rsp
  8010a0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010a4:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8010a7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010ab:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8010b0:	75 06                	jne    8010b8 <memset+0x20>
  8010b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010b6:	eb 69                	jmp    801121 <memset+0x89>
  8010b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010bc:	83 e0 03             	and    $0x3,%eax
  8010bf:	48 85 c0             	test   %rax,%rax
  8010c2:	75 48                	jne    80110c <memset+0x74>
  8010c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010c8:	83 e0 03             	and    $0x3,%eax
  8010cb:	48 85 c0             	test   %rax,%rax
  8010ce:	75 3c                	jne    80110c <memset+0x74>
  8010d0:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8010d7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8010da:	c1 e0 18             	shl    $0x18,%eax
  8010dd:	89 c2                	mov    %eax,%edx
  8010df:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8010e2:	c1 e0 10             	shl    $0x10,%eax
  8010e5:	09 c2                	or     %eax,%edx
  8010e7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8010ea:	c1 e0 08             	shl    $0x8,%eax
  8010ed:	09 d0                	or     %edx,%eax
  8010ef:	09 45 f4             	or     %eax,-0xc(%rbp)
  8010f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010f6:	48 c1 e8 02          	shr    $0x2,%rax
  8010fa:	48 89 c1             	mov    %rax,%rcx
  8010fd:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801101:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801104:	48 89 d7             	mov    %rdx,%rdi
  801107:	fc                   	cld    
  801108:	f3 ab                	rep stos %eax,%es:(%rdi)
  80110a:	eb 11                	jmp    80111d <memset+0x85>
  80110c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801110:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801113:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801117:	48 89 d7             	mov    %rdx,%rdi
  80111a:	fc                   	cld    
  80111b:	f3 aa                	rep stos %al,%es:(%rdi)
  80111d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801121:	c9                   	leaveq 
  801122:	c3                   	retq   

0000000000801123 <memmove>:
  801123:	55                   	push   %rbp
  801124:	48 89 e5             	mov    %rsp,%rbp
  801127:	48 83 ec 28          	sub    $0x28,%rsp
  80112b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80112f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801133:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801137:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80113b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80113f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801143:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801147:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80114b:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80114f:	0f 83 88 00 00 00    	jae    8011dd <memmove+0xba>
  801155:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801159:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80115d:	48 01 d0             	add    %rdx,%rax
  801160:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801164:	76 77                	jbe    8011dd <memmove+0xba>
  801166:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80116a:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80116e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801172:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801176:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80117a:	83 e0 03             	and    $0x3,%eax
  80117d:	48 85 c0             	test   %rax,%rax
  801180:	75 3b                	jne    8011bd <memmove+0x9a>
  801182:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801186:	83 e0 03             	and    $0x3,%eax
  801189:	48 85 c0             	test   %rax,%rax
  80118c:	75 2f                	jne    8011bd <memmove+0x9a>
  80118e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801192:	83 e0 03             	and    $0x3,%eax
  801195:	48 85 c0             	test   %rax,%rax
  801198:	75 23                	jne    8011bd <memmove+0x9a>
  80119a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80119e:	48 83 e8 04          	sub    $0x4,%rax
  8011a2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8011a6:	48 83 ea 04          	sub    $0x4,%rdx
  8011aa:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8011ae:	48 c1 e9 02          	shr    $0x2,%rcx
  8011b2:	48 89 c7             	mov    %rax,%rdi
  8011b5:	48 89 d6             	mov    %rdx,%rsi
  8011b8:	fd                   	std    
  8011b9:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8011bb:	eb 1d                	jmp    8011da <memmove+0xb7>
  8011bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011c1:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8011c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011c9:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8011cd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8011d1:	48 89 d7             	mov    %rdx,%rdi
  8011d4:	48 89 c1             	mov    %rax,%rcx
  8011d7:	fd                   	std    
  8011d8:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8011da:	fc                   	cld    
  8011db:	eb 57                	jmp    801234 <memmove+0x111>
  8011dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011e1:	83 e0 03             	and    $0x3,%eax
  8011e4:	48 85 c0             	test   %rax,%rax
  8011e7:	75 36                	jne    80121f <memmove+0xfc>
  8011e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8011ed:	83 e0 03             	and    $0x3,%eax
  8011f0:	48 85 c0             	test   %rax,%rax
  8011f3:	75 2a                	jne    80121f <memmove+0xfc>
  8011f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8011f9:	83 e0 03             	and    $0x3,%eax
  8011fc:	48 85 c0             	test   %rax,%rax
  8011ff:	75 1e                	jne    80121f <memmove+0xfc>
  801201:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801205:	48 c1 e8 02          	shr    $0x2,%rax
  801209:	48 89 c1             	mov    %rax,%rcx
  80120c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801210:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801214:	48 89 c7             	mov    %rax,%rdi
  801217:	48 89 d6             	mov    %rdx,%rsi
  80121a:	fc                   	cld    
  80121b:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80121d:	eb 15                	jmp    801234 <memmove+0x111>
  80121f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801223:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801227:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80122b:	48 89 c7             	mov    %rax,%rdi
  80122e:	48 89 d6             	mov    %rdx,%rsi
  801231:	fc                   	cld    
  801232:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801234:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801238:	c9                   	leaveq 
  801239:	c3                   	retq   

000000000080123a <memcpy>:
  80123a:	55                   	push   %rbp
  80123b:	48 89 e5             	mov    %rsp,%rbp
  80123e:	48 83 ec 18          	sub    $0x18,%rsp
  801242:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801246:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80124a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80124e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801252:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801256:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80125a:	48 89 ce             	mov    %rcx,%rsi
  80125d:	48 89 c7             	mov    %rax,%rdi
  801260:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  801267:	00 00 00 
  80126a:	ff d0                	callq  *%rax
  80126c:	c9                   	leaveq 
  80126d:	c3                   	retq   

000000000080126e <memcmp>:
  80126e:	55                   	push   %rbp
  80126f:	48 89 e5             	mov    %rsp,%rbp
  801272:	48 83 ec 28          	sub    $0x28,%rsp
  801276:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80127a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80127e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801282:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801286:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80128a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80128e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801292:	eb 36                	jmp    8012ca <memcmp+0x5c>
  801294:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801298:	0f b6 10             	movzbl (%rax),%edx
  80129b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80129f:	0f b6 00             	movzbl (%rax),%eax
  8012a2:	38 c2                	cmp    %al,%dl
  8012a4:	74 1a                	je     8012c0 <memcmp+0x52>
  8012a6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012aa:	0f b6 00             	movzbl (%rax),%eax
  8012ad:	0f b6 d0             	movzbl %al,%edx
  8012b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012b4:	0f b6 00             	movzbl (%rax),%eax
  8012b7:	0f b6 c0             	movzbl %al,%eax
  8012ba:	29 c2                	sub    %eax,%edx
  8012bc:	89 d0                	mov    %edx,%eax
  8012be:	eb 20                	jmp    8012e0 <memcmp+0x72>
  8012c0:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012c5:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8012ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012ce:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8012d2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012d6:	48 85 c0             	test   %rax,%rax
  8012d9:	75 b9                	jne    801294 <memcmp+0x26>
  8012db:	b8 00 00 00 00       	mov    $0x0,%eax
  8012e0:	c9                   	leaveq 
  8012e1:	c3                   	retq   

00000000008012e2 <memfind>:
  8012e2:	55                   	push   %rbp
  8012e3:	48 89 e5             	mov    %rsp,%rbp
  8012e6:	48 83 ec 28          	sub    $0x28,%rsp
  8012ea:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8012ee:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8012f1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8012f5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8012f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012fd:	48 01 d0             	add    %rdx,%rax
  801300:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801304:	eb 13                	jmp    801319 <memfind+0x37>
  801306:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80130a:	0f b6 00             	movzbl (%rax),%eax
  80130d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801310:	38 d0                	cmp    %dl,%al
  801312:	74 11                	je     801325 <memfind+0x43>
  801314:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801319:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80131d:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801321:	72 e3                	jb     801306 <memfind+0x24>
  801323:	eb 01                	jmp    801326 <memfind+0x44>
  801325:	90                   	nop
  801326:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80132a:	c9                   	leaveq 
  80132b:	c3                   	retq   

000000000080132c <strtol>:
  80132c:	55                   	push   %rbp
  80132d:	48 89 e5             	mov    %rsp,%rbp
  801330:	48 83 ec 38          	sub    $0x38,%rsp
  801334:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801338:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80133c:	89 55 cc             	mov    %edx,-0x34(%rbp)
  80133f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801346:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  80134d:	00 
  80134e:	eb 05                	jmp    801355 <strtol+0x29>
  801350:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801355:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801359:	0f b6 00             	movzbl (%rax),%eax
  80135c:	3c 20                	cmp    $0x20,%al
  80135e:	74 f0                	je     801350 <strtol+0x24>
  801360:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801364:	0f b6 00             	movzbl (%rax),%eax
  801367:	3c 09                	cmp    $0x9,%al
  801369:	74 e5                	je     801350 <strtol+0x24>
  80136b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80136f:	0f b6 00             	movzbl (%rax),%eax
  801372:	3c 2b                	cmp    $0x2b,%al
  801374:	75 07                	jne    80137d <strtol+0x51>
  801376:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80137b:	eb 17                	jmp    801394 <strtol+0x68>
  80137d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801381:	0f b6 00             	movzbl (%rax),%eax
  801384:	3c 2d                	cmp    $0x2d,%al
  801386:	75 0c                	jne    801394 <strtol+0x68>
  801388:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80138d:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801394:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801398:	74 06                	je     8013a0 <strtol+0x74>
  80139a:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80139e:	75 28                	jne    8013c8 <strtol+0x9c>
  8013a0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013a4:	0f b6 00             	movzbl (%rax),%eax
  8013a7:	3c 30                	cmp    $0x30,%al
  8013a9:	75 1d                	jne    8013c8 <strtol+0x9c>
  8013ab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013af:	48 83 c0 01          	add    $0x1,%rax
  8013b3:	0f b6 00             	movzbl (%rax),%eax
  8013b6:	3c 78                	cmp    $0x78,%al
  8013b8:	75 0e                	jne    8013c8 <strtol+0x9c>
  8013ba:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8013bf:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8013c6:	eb 2c                	jmp    8013f4 <strtol+0xc8>
  8013c8:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8013cc:	75 19                	jne    8013e7 <strtol+0xbb>
  8013ce:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013d2:	0f b6 00             	movzbl (%rax),%eax
  8013d5:	3c 30                	cmp    $0x30,%al
  8013d7:	75 0e                	jne    8013e7 <strtol+0xbb>
  8013d9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8013de:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  8013e5:	eb 0d                	jmp    8013f4 <strtol+0xc8>
  8013e7:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8013eb:	75 07                	jne    8013f4 <strtol+0xc8>
  8013ed:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  8013f4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f8:	0f b6 00             	movzbl (%rax),%eax
  8013fb:	3c 2f                	cmp    $0x2f,%al
  8013fd:	7e 1d                	jle    80141c <strtol+0xf0>
  8013ff:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801403:	0f b6 00             	movzbl (%rax),%eax
  801406:	3c 39                	cmp    $0x39,%al
  801408:	7f 12                	jg     80141c <strtol+0xf0>
  80140a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80140e:	0f b6 00             	movzbl (%rax),%eax
  801411:	0f be c0             	movsbl %al,%eax
  801414:	83 e8 30             	sub    $0x30,%eax
  801417:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80141a:	eb 4e                	jmp    80146a <strtol+0x13e>
  80141c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801420:	0f b6 00             	movzbl (%rax),%eax
  801423:	3c 60                	cmp    $0x60,%al
  801425:	7e 1d                	jle    801444 <strtol+0x118>
  801427:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80142b:	0f b6 00             	movzbl (%rax),%eax
  80142e:	3c 7a                	cmp    $0x7a,%al
  801430:	7f 12                	jg     801444 <strtol+0x118>
  801432:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801436:	0f b6 00             	movzbl (%rax),%eax
  801439:	0f be c0             	movsbl %al,%eax
  80143c:	83 e8 57             	sub    $0x57,%eax
  80143f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801442:	eb 26                	jmp    80146a <strtol+0x13e>
  801444:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801448:	0f b6 00             	movzbl (%rax),%eax
  80144b:	3c 40                	cmp    $0x40,%al
  80144d:	7e 47                	jle    801496 <strtol+0x16a>
  80144f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801453:	0f b6 00             	movzbl (%rax),%eax
  801456:	3c 5a                	cmp    $0x5a,%al
  801458:	7f 3c                	jg     801496 <strtol+0x16a>
  80145a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80145e:	0f b6 00             	movzbl (%rax),%eax
  801461:	0f be c0             	movsbl %al,%eax
  801464:	83 e8 37             	sub    $0x37,%eax
  801467:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80146a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80146d:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801470:	7d 23                	jge    801495 <strtol+0x169>
  801472:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801477:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80147a:	48 98                	cltq   
  80147c:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801481:	48 89 c2             	mov    %rax,%rdx
  801484:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801487:	48 98                	cltq   
  801489:	48 01 d0             	add    %rdx,%rax
  80148c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801490:	e9 5f ff ff ff       	jmpq   8013f4 <strtol+0xc8>
  801495:	90                   	nop
  801496:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  80149b:	74 0b                	je     8014a8 <strtol+0x17c>
  80149d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8014a1:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8014a5:	48 89 10             	mov    %rdx,(%rax)
  8014a8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8014ac:	74 09                	je     8014b7 <strtol+0x18b>
  8014ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014b2:	48 f7 d8             	neg    %rax
  8014b5:	eb 04                	jmp    8014bb <strtol+0x18f>
  8014b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8014bb:	c9                   	leaveq 
  8014bc:	c3                   	retq   

00000000008014bd <strstr>:
  8014bd:	55                   	push   %rbp
  8014be:	48 89 e5             	mov    %rsp,%rbp
  8014c1:	48 83 ec 30          	sub    $0x30,%rsp
  8014c5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8014c9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8014cd:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8014d1:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8014d5:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8014d9:	0f b6 00             	movzbl (%rax),%eax
  8014dc:	88 45 ff             	mov    %al,-0x1(%rbp)
  8014df:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  8014e3:	75 06                	jne    8014eb <strstr+0x2e>
  8014e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014e9:	eb 6b                	jmp    801556 <strstr+0x99>
  8014eb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8014ef:	48 89 c7             	mov    %rax,%rdi
  8014f2:	48 b8 92 0d 80 00 00 	movabs $0x800d92,%rax
  8014f9:	00 00 00 
  8014fc:	ff d0                	callq  *%rax
  8014fe:	48 98                	cltq   
  801500:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801504:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801508:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80150c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801510:	0f b6 00             	movzbl (%rax),%eax
  801513:	88 45 ef             	mov    %al,-0x11(%rbp)
  801516:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80151a:	75 07                	jne    801523 <strstr+0x66>
  80151c:	b8 00 00 00 00       	mov    $0x0,%eax
  801521:	eb 33                	jmp    801556 <strstr+0x99>
  801523:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801527:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80152a:	75 d8                	jne    801504 <strstr+0x47>
  80152c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801530:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801534:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801538:	48 89 ce             	mov    %rcx,%rsi
  80153b:	48 89 c7             	mov    %rax,%rdi
  80153e:	48 b8 b3 0f 80 00 00 	movabs $0x800fb3,%rax
  801545:	00 00 00 
  801548:	ff d0                	callq  *%rax
  80154a:	85 c0                	test   %eax,%eax
  80154c:	75 b6                	jne    801504 <strstr+0x47>
  80154e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801552:	48 83 e8 01          	sub    $0x1,%rax
  801556:	c9                   	leaveq 
  801557:	c3                   	retq   

0000000000801558 <syscall>:
  801558:	55                   	push   %rbp
  801559:	48 89 e5             	mov    %rsp,%rbp
  80155c:	53                   	push   %rbx
  80155d:	48 83 ec 48          	sub    $0x48,%rsp
  801561:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801564:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801567:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80156b:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  80156f:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801573:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801577:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80157a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  80157e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801582:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801586:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  80158a:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80158e:	4c 89 c3             	mov    %r8,%rbx
  801591:	cd 30                	int    $0x30
  801593:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801597:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80159b:	74 3e                	je     8015db <syscall+0x83>
  80159d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8015a2:	7e 37                	jle    8015db <syscall+0x83>
  8015a4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8015a8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8015ab:	49 89 d0             	mov    %rdx,%r8
  8015ae:	89 c1                	mov    %eax,%ecx
  8015b0:	48 ba c8 44 80 00 00 	movabs $0x8044c8,%rdx
  8015b7:	00 00 00 
  8015ba:	be 24 00 00 00       	mov    $0x24,%esi
  8015bf:	48 bf e5 44 80 00 00 	movabs $0x8044e5,%rdi
  8015c6:	00 00 00 
  8015c9:	b8 00 00 00 00       	mov    $0x0,%eax
  8015ce:	49 b9 d8 3b 80 00 00 	movabs $0x803bd8,%r9
  8015d5:	00 00 00 
  8015d8:	41 ff d1             	callq  *%r9
  8015db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015df:	48 83 c4 48          	add    $0x48,%rsp
  8015e3:	5b                   	pop    %rbx
  8015e4:	5d                   	pop    %rbp
  8015e5:	c3                   	retq   

00000000008015e6 <sys_cputs>:
  8015e6:	55                   	push   %rbp
  8015e7:	48 89 e5             	mov    %rsp,%rbp
  8015ea:	48 83 ec 10          	sub    $0x10,%rsp
  8015ee:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015f2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8015f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015fa:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8015fe:	48 83 ec 08          	sub    $0x8,%rsp
  801602:	6a 00                	pushq  $0x0
  801604:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80160a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801610:	48 89 d1             	mov    %rdx,%rcx
  801613:	48 89 c2             	mov    %rax,%rdx
  801616:	be 00 00 00 00       	mov    $0x0,%esi
  80161b:	bf 00 00 00 00       	mov    $0x0,%edi
  801620:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801627:	00 00 00 
  80162a:	ff d0                	callq  *%rax
  80162c:	48 83 c4 10          	add    $0x10,%rsp
  801630:	90                   	nop
  801631:	c9                   	leaveq 
  801632:	c3                   	retq   

0000000000801633 <sys_cgetc>:
  801633:	55                   	push   %rbp
  801634:	48 89 e5             	mov    %rsp,%rbp
  801637:	48 83 ec 08          	sub    $0x8,%rsp
  80163b:	6a 00                	pushq  $0x0
  80163d:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801643:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801649:	b9 00 00 00 00       	mov    $0x0,%ecx
  80164e:	ba 00 00 00 00       	mov    $0x0,%edx
  801653:	be 00 00 00 00       	mov    $0x0,%esi
  801658:	bf 01 00 00 00       	mov    $0x1,%edi
  80165d:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801664:	00 00 00 
  801667:	ff d0                	callq  *%rax
  801669:	48 83 c4 10          	add    $0x10,%rsp
  80166d:	c9                   	leaveq 
  80166e:	c3                   	retq   

000000000080166f <sys_env_destroy>:
  80166f:	55                   	push   %rbp
  801670:	48 89 e5             	mov    %rsp,%rbp
  801673:	48 83 ec 10          	sub    $0x10,%rsp
  801677:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80167a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80167d:	48 98                	cltq   
  80167f:	48 83 ec 08          	sub    $0x8,%rsp
  801683:	6a 00                	pushq  $0x0
  801685:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80168b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801691:	b9 00 00 00 00       	mov    $0x0,%ecx
  801696:	48 89 c2             	mov    %rax,%rdx
  801699:	be 01 00 00 00       	mov    $0x1,%esi
  80169e:	bf 03 00 00 00       	mov    $0x3,%edi
  8016a3:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  8016aa:	00 00 00 
  8016ad:	ff d0                	callq  *%rax
  8016af:	48 83 c4 10          	add    $0x10,%rsp
  8016b3:	c9                   	leaveq 
  8016b4:	c3                   	retq   

00000000008016b5 <sys_getenvid>:
  8016b5:	55                   	push   %rbp
  8016b6:	48 89 e5             	mov    %rsp,%rbp
  8016b9:	48 83 ec 08          	sub    $0x8,%rsp
  8016bd:	6a 00                	pushq  $0x0
  8016bf:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8016c5:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8016cb:	b9 00 00 00 00       	mov    $0x0,%ecx
  8016d0:	ba 00 00 00 00       	mov    $0x0,%edx
  8016d5:	be 00 00 00 00       	mov    $0x0,%esi
  8016da:	bf 02 00 00 00       	mov    $0x2,%edi
  8016df:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  8016e6:	00 00 00 
  8016e9:	ff d0                	callq  *%rax
  8016eb:	48 83 c4 10          	add    $0x10,%rsp
  8016ef:	c9                   	leaveq 
  8016f0:	c3                   	retq   

00000000008016f1 <sys_yield>:
  8016f1:	55                   	push   %rbp
  8016f2:	48 89 e5             	mov    %rsp,%rbp
  8016f5:	48 83 ec 08          	sub    $0x8,%rsp
  8016f9:	6a 00                	pushq  $0x0
  8016fb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801701:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801707:	b9 00 00 00 00       	mov    $0x0,%ecx
  80170c:	ba 00 00 00 00       	mov    $0x0,%edx
  801711:	be 00 00 00 00       	mov    $0x0,%esi
  801716:	bf 0b 00 00 00       	mov    $0xb,%edi
  80171b:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801722:	00 00 00 
  801725:	ff d0                	callq  *%rax
  801727:	48 83 c4 10          	add    $0x10,%rsp
  80172b:	90                   	nop
  80172c:	c9                   	leaveq 
  80172d:	c3                   	retq   

000000000080172e <sys_page_alloc>:
  80172e:	55                   	push   %rbp
  80172f:	48 89 e5             	mov    %rsp,%rbp
  801732:	48 83 ec 10          	sub    $0x10,%rsp
  801736:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801739:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80173d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801740:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801743:	48 63 c8             	movslq %eax,%rcx
  801746:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80174a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80174d:	48 98                	cltq   
  80174f:	48 83 ec 08          	sub    $0x8,%rsp
  801753:	6a 00                	pushq  $0x0
  801755:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80175b:	49 89 c8             	mov    %rcx,%r8
  80175e:	48 89 d1             	mov    %rdx,%rcx
  801761:	48 89 c2             	mov    %rax,%rdx
  801764:	be 01 00 00 00       	mov    $0x1,%esi
  801769:	bf 04 00 00 00       	mov    $0x4,%edi
  80176e:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801775:	00 00 00 
  801778:	ff d0                	callq  *%rax
  80177a:	48 83 c4 10          	add    $0x10,%rsp
  80177e:	c9                   	leaveq 
  80177f:	c3                   	retq   

0000000000801780 <sys_page_map>:
  801780:	55                   	push   %rbp
  801781:	48 89 e5             	mov    %rsp,%rbp
  801784:	48 83 ec 20          	sub    $0x20,%rsp
  801788:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80178b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80178f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801792:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801796:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  80179a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80179d:	48 63 c8             	movslq %eax,%rcx
  8017a0:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8017a4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8017a7:	48 63 f0             	movslq %eax,%rsi
  8017aa:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017b1:	48 98                	cltq   
  8017b3:	48 83 ec 08          	sub    $0x8,%rsp
  8017b7:	51                   	push   %rcx
  8017b8:	49 89 f9             	mov    %rdi,%r9
  8017bb:	49 89 f0             	mov    %rsi,%r8
  8017be:	48 89 d1             	mov    %rdx,%rcx
  8017c1:	48 89 c2             	mov    %rax,%rdx
  8017c4:	be 01 00 00 00       	mov    $0x1,%esi
  8017c9:	bf 05 00 00 00       	mov    $0x5,%edi
  8017ce:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  8017d5:	00 00 00 
  8017d8:	ff d0                	callq  *%rax
  8017da:	48 83 c4 10          	add    $0x10,%rsp
  8017de:	c9                   	leaveq 
  8017df:	c3                   	retq   

00000000008017e0 <sys_page_unmap>:
  8017e0:	55                   	push   %rbp
  8017e1:	48 89 e5             	mov    %rsp,%rbp
  8017e4:	48 83 ec 10          	sub    $0x10,%rsp
  8017e8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8017eb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8017ef:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017f3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017f6:	48 98                	cltq   
  8017f8:	48 83 ec 08          	sub    $0x8,%rsp
  8017fc:	6a 00                	pushq  $0x0
  8017fe:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801804:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80180a:	48 89 d1             	mov    %rdx,%rcx
  80180d:	48 89 c2             	mov    %rax,%rdx
  801810:	be 01 00 00 00       	mov    $0x1,%esi
  801815:	bf 06 00 00 00       	mov    $0x6,%edi
  80181a:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801821:	00 00 00 
  801824:	ff d0                	callq  *%rax
  801826:	48 83 c4 10          	add    $0x10,%rsp
  80182a:	c9                   	leaveq 
  80182b:	c3                   	retq   

000000000080182c <sys_env_set_status>:
  80182c:	55                   	push   %rbp
  80182d:	48 89 e5             	mov    %rsp,%rbp
  801830:	48 83 ec 10          	sub    $0x10,%rsp
  801834:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801837:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80183a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80183d:	48 63 d0             	movslq %eax,%rdx
  801840:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801843:	48 98                	cltq   
  801845:	48 83 ec 08          	sub    $0x8,%rsp
  801849:	6a 00                	pushq  $0x0
  80184b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801851:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801857:	48 89 d1             	mov    %rdx,%rcx
  80185a:	48 89 c2             	mov    %rax,%rdx
  80185d:	be 01 00 00 00       	mov    $0x1,%esi
  801862:	bf 08 00 00 00       	mov    $0x8,%edi
  801867:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  80186e:	00 00 00 
  801871:	ff d0                	callq  *%rax
  801873:	48 83 c4 10          	add    $0x10,%rsp
  801877:	c9                   	leaveq 
  801878:	c3                   	retq   

0000000000801879 <sys_env_set_trapframe>:
  801879:	55                   	push   %rbp
  80187a:	48 89 e5             	mov    %rsp,%rbp
  80187d:	48 83 ec 10          	sub    $0x10,%rsp
  801881:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801884:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801888:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80188c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80188f:	48 98                	cltq   
  801891:	48 83 ec 08          	sub    $0x8,%rsp
  801895:	6a 00                	pushq  $0x0
  801897:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80189d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018a3:	48 89 d1             	mov    %rdx,%rcx
  8018a6:	48 89 c2             	mov    %rax,%rdx
  8018a9:	be 01 00 00 00       	mov    $0x1,%esi
  8018ae:	bf 09 00 00 00       	mov    $0x9,%edi
  8018b3:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  8018ba:	00 00 00 
  8018bd:	ff d0                	callq  *%rax
  8018bf:	48 83 c4 10          	add    $0x10,%rsp
  8018c3:	c9                   	leaveq 
  8018c4:	c3                   	retq   

00000000008018c5 <sys_env_set_pgfault_upcall>:
  8018c5:	55                   	push   %rbp
  8018c6:	48 89 e5             	mov    %rsp,%rbp
  8018c9:	48 83 ec 10          	sub    $0x10,%rsp
  8018cd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018d0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018d4:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018db:	48 98                	cltq   
  8018dd:	48 83 ec 08          	sub    $0x8,%rsp
  8018e1:	6a 00                	pushq  $0x0
  8018e3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018e9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018ef:	48 89 d1             	mov    %rdx,%rcx
  8018f2:	48 89 c2             	mov    %rax,%rdx
  8018f5:	be 01 00 00 00       	mov    $0x1,%esi
  8018fa:	bf 0a 00 00 00       	mov    $0xa,%edi
  8018ff:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801906:	00 00 00 
  801909:	ff d0                	callq  *%rax
  80190b:	48 83 c4 10          	add    $0x10,%rsp
  80190f:	c9                   	leaveq 
  801910:	c3                   	retq   

0000000000801911 <sys_ipc_try_send>:
  801911:	55                   	push   %rbp
  801912:	48 89 e5             	mov    %rsp,%rbp
  801915:	48 83 ec 20          	sub    $0x20,%rsp
  801919:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80191c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801920:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801924:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801927:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80192a:	48 63 f0             	movslq %eax,%rsi
  80192d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801931:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801934:	48 98                	cltq   
  801936:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80193a:	48 83 ec 08          	sub    $0x8,%rsp
  80193e:	6a 00                	pushq  $0x0
  801940:	49 89 f1             	mov    %rsi,%r9
  801943:	49 89 c8             	mov    %rcx,%r8
  801946:	48 89 d1             	mov    %rdx,%rcx
  801949:	48 89 c2             	mov    %rax,%rdx
  80194c:	be 00 00 00 00       	mov    $0x0,%esi
  801951:	bf 0c 00 00 00       	mov    $0xc,%edi
  801956:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  80195d:	00 00 00 
  801960:	ff d0                	callq  *%rax
  801962:	48 83 c4 10          	add    $0x10,%rsp
  801966:	c9                   	leaveq 
  801967:	c3                   	retq   

0000000000801968 <sys_ipc_recv>:
  801968:	55                   	push   %rbp
  801969:	48 89 e5             	mov    %rsp,%rbp
  80196c:	48 83 ec 10          	sub    $0x10,%rsp
  801970:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801974:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801978:	48 83 ec 08          	sub    $0x8,%rsp
  80197c:	6a 00                	pushq  $0x0
  80197e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801984:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80198a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80198f:	48 89 c2             	mov    %rax,%rdx
  801992:	be 01 00 00 00       	mov    $0x1,%esi
  801997:	bf 0d 00 00 00       	mov    $0xd,%edi
  80199c:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  8019a3:	00 00 00 
  8019a6:	ff d0                	callq  *%rax
  8019a8:	48 83 c4 10          	add    $0x10,%rsp
  8019ac:	c9                   	leaveq 
  8019ad:	c3                   	retq   

00000000008019ae <sys_time_msec>:
  8019ae:	55                   	push   %rbp
  8019af:	48 89 e5             	mov    %rsp,%rbp
  8019b2:	48 83 ec 08          	sub    $0x8,%rsp
  8019b6:	6a 00                	pushq  $0x0
  8019b8:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019be:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019c4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8019c9:	ba 00 00 00 00       	mov    $0x0,%edx
  8019ce:	be 00 00 00 00       	mov    $0x0,%esi
  8019d3:	bf 0e 00 00 00       	mov    $0xe,%edi
  8019d8:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  8019df:	00 00 00 
  8019e2:	ff d0                	callq  *%rax
  8019e4:	48 83 c4 10          	add    $0x10,%rsp
  8019e8:	c9                   	leaveq 
  8019e9:	c3                   	retq   

00000000008019ea <sys_net_transmit>:
  8019ea:	55                   	push   %rbp
  8019eb:	48 89 e5             	mov    %rsp,%rbp
  8019ee:	48 83 ec 10          	sub    $0x10,%rsp
  8019f2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8019f6:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8019f9:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8019fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a00:	48 83 ec 08          	sub    $0x8,%rsp
  801a04:	6a 00                	pushq  $0x0
  801a06:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a0c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a12:	48 89 d1             	mov    %rdx,%rcx
  801a15:	48 89 c2             	mov    %rax,%rdx
  801a18:	be 00 00 00 00       	mov    $0x0,%esi
  801a1d:	bf 0f 00 00 00       	mov    $0xf,%edi
  801a22:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801a29:	00 00 00 
  801a2c:	ff d0                	callq  *%rax
  801a2e:	48 83 c4 10          	add    $0x10,%rsp
  801a32:	c9                   	leaveq 
  801a33:	c3                   	retq   

0000000000801a34 <sys_net_receive>:
  801a34:	55                   	push   %rbp
  801a35:	48 89 e5             	mov    %rsp,%rbp
  801a38:	48 83 ec 10          	sub    $0x10,%rsp
  801a3c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a40:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801a43:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801a46:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a4a:	48 83 ec 08          	sub    $0x8,%rsp
  801a4e:	6a 00                	pushq  $0x0
  801a50:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a56:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a5c:	48 89 d1             	mov    %rdx,%rcx
  801a5f:	48 89 c2             	mov    %rax,%rdx
  801a62:	be 00 00 00 00       	mov    $0x0,%esi
  801a67:	bf 10 00 00 00       	mov    $0x10,%edi
  801a6c:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801a73:	00 00 00 
  801a76:	ff d0                	callq  *%rax
  801a78:	48 83 c4 10          	add    $0x10,%rsp
  801a7c:	c9                   	leaveq 
  801a7d:	c3                   	retq   

0000000000801a7e <sys_ept_map>:
  801a7e:	55                   	push   %rbp
  801a7f:	48 89 e5             	mov    %rsp,%rbp
  801a82:	48 83 ec 20          	sub    $0x20,%rsp
  801a86:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a89:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a8d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a90:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a94:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a98:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a9b:	48 63 c8             	movslq %eax,%rcx
  801a9e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801aa2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801aa5:	48 63 f0             	movslq %eax,%rsi
  801aa8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801aac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801aaf:	48 98                	cltq   
  801ab1:	48 83 ec 08          	sub    $0x8,%rsp
  801ab5:	51                   	push   %rcx
  801ab6:	49 89 f9             	mov    %rdi,%r9
  801ab9:	49 89 f0             	mov    %rsi,%r8
  801abc:	48 89 d1             	mov    %rdx,%rcx
  801abf:	48 89 c2             	mov    %rax,%rdx
  801ac2:	be 00 00 00 00       	mov    $0x0,%esi
  801ac7:	bf 11 00 00 00       	mov    $0x11,%edi
  801acc:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801ad3:	00 00 00 
  801ad6:	ff d0                	callq  *%rax
  801ad8:	48 83 c4 10          	add    $0x10,%rsp
  801adc:	c9                   	leaveq 
  801add:	c3                   	retq   

0000000000801ade <sys_env_mkguest>:
  801ade:	55                   	push   %rbp
  801adf:	48 89 e5             	mov    %rsp,%rbp
  801ae2:	48 83 ec 10          	sub    $0x10,%rsp
  801ae6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801aea:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801aee:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801af2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801af6:	48 83 ec 08          	sub    $0x8,%rsp
  801afa:	6a 00                	pushq  $0x0
  801afc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b02:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b08:	48 89 d1             	mov    %rdx,%rcx
  801b0b:	48 89 c2             	mov    %rax,%rdx
  801b0e:	be 00 00 00 00       	mov    $0x0,%esi
  801b13:	bf 12 00 00 00       	mov    $0x12,%edi
  801b18:	48 b8 58 15 80 00 00 	movabs $0x801558,%rax
  801b1f:	00 00 00 
  801b22:	ff d0                	callq  *%rax
  801b24:	48 83 c4 10          	add    $0x10,%rsp
  801b28:	c9                   	leaveq 
  801b29:	c3                   	retq   

0000000000801b2a <fd2num>:
  801b2a:	55                   	push   %rbp
  801b2b:	48 89 e5             	mov    %rsp,%rbp
  801b2e:	48 83 ec 08          	sub    $0x8,%rsp
  801b32:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b36:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801b3a:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801b41:	ff ff ff 
  801b44:	48 01 d0             	add    %rdx,%rax
  801b47:	48 c1 e8 0c          	shr    $0xc,%rax
  801b4b:	c9                   	leaveq 
  801b4c:	c3                   	retq   

0000000000801b4d <fd2data>:
  801b4d:	55                   	push   %rbp
  801b4e:	48 89 e5             	mov    %rsp,%rbp
  801b51:	48 83 ec 08          	sub    $0x8,%rsp
  801b55:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b5d:	48 89 c7             	mov    %rax,%rdi
  801b60:	48 b8 2a 1b 80 00 00 	movabs $0x801b2a,%rax
  801b67:	00 00 00 
  801b6a:	ff d0                	callq  *%rax
  801b6c:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801b72:	48 c1 e0 0c          	shl    $0xc,%rax
  801b76:	c9                   	leaveq 
  801b77:	c3                   	retq   

0000000000801b78 <fd_alloc>:
  801b78:	55                   	push   %rbp
  801b79:	48 89 e5             	mov    %rsp,%rbp
  801b7c:	48 83 ec 18          	sub    $0x18,%rsp
  801b80:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801b84:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801b8b:	eb 6b                	jmp    801bf8 <fd_alloc+0x80>
  801b8d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b90:	48 98                	cltq   
  801b92:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801b98:	48 c1 e0 0c          	shl    $0xc,%rax
  801b9c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ba0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ba4:	48 c1 e8 15          	shr    $0x15,%rax
  801ba8:	48 89 c2             	mov    %rax,%rdx
  801bab:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801bb2:	01 00 00 
  801bb5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801bb9:	83 e0 01             	and    $0x1,%eax
  801bbc:	48 85 c0             	test   %rax,%rax
  801bbf:	74 21                	je     801be2 <fd_alloc+0x6a>
  801bc1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bc5:	48 c1 e8 0c          	shr    $0xc,%rax
  801bc9:	48 89 c2             	mov    %rax,%rdx
  801bcc:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801bd3:	01 00 00 
  801bd6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801bda:	83 e0 01             	and    $0x1,%eax
  801bdd:	48 85 c0             	test   %rax,%rax
  801be0:	75 12                	jne    801bf4 <fd_alloc+0x7c>
  801be2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801be6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bea:	48 89 10             	mov    %rdx,(%rax)
  801bed:	b8 00 00 00 00       	mov    $0x0,%eax
  801bf2:	eb 1a                	jmp    801c0e <fd_alloc+0x96>
  801bf4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801bf8:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801bfc:	7e 8f                	jle    801b8d <fd_alloc+0x15>
  801bfe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c02:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801c09:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801c0e:	c9                   	leaveq 
  801c0f:	c3                   	retq   

0000000000801c10 <fd_lookup>:
  801c10:	55                   	push   %rbp
  801c11:	48 89 e5             	mov    %rsp,%rbp
  801c14:	48 83 ec 20          	sub    $0x20,%rsp
  801c18:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801c1b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801c1f:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801c23:	78 06                	js     801c2b <fd_lookup+0x1b>
  801c25:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801c29:	7e 07                	jle    801c32 <fd_lookup+0x22>
  801c2b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801c30:	eb 6c                	jmp    801c9e <fd_lookup+0x8e>
  801c32:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801c35:	48 98                	cltq   
  801c37:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801c3d:	48 c1 e0 0c          	shl    $0xc,%rax
  801c41:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801c45:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c49:	48 c1 e8 15          	shr    $0x15,%rax
  801c4d:	48 89 c2             	mov    %rax,%rdx
  801c50:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801c57:	01 00 00 
  801c5a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801c5e:	83 e0 01             	and    $0x1,%eax
  801c61:	48 85 c0             	test   %rax,%rax
  801c64:	74 21                	je     801c87 <fd_lookup+0x77>
  801c66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c6a:	48 c1 e8 0c          	shr    $0xc,%rax
  801c6e:	48 89 c2             	mov    %rax,%rdx
  801c71:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801c78:	01 00 00 
  801c7b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801c7f:	83 e0 01             	and    $0x1,%eax
  801c82:	48 85 c0             	test   %rax,%rax
  801c85:	75 07                	jne    801c8e <fd_lookup+0x7e>
  801c87:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801c8c:	eb 10                	jmp    801c9e <fd_lookup+0x8e>
  801c8e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801c92:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c96:	48 89 10             	mov    %rdx,(%rax)
  801c99:	b8 00 00 00 00       	mov    $0x0,%eax
  801c9e:	c9                   	leaveq 
  801c9f:	c3                   	retq   

0000000000801ca0 <fd_close>:
  801ca0:	55                   	push   %rbp
  801ca1:	48 89 e5             	mov    %rsp,%rbp
  801ca4:	48 83 ec 30          	sub    $0x30,%rsp
  801ca8:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801cac:	89 f0                	mov    %esi,%eax
  801cae:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801cb1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801cb5:	48 89 c7             	mov    %rax,%rdi
  801cb8:	48 b8 2a 1b 80 00 00 	movabs $0x801b2a,%rax
  801cbf:	00 00 00 
  801cc2:	ff d0                	callq  *%rax
  801cc4:	89 c2                	mov    %eax,%edx
  801cc6:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801cca:	48 89 c6             	mov    %rax,%rsi
  801ccd:	89 d7                	mov    %edx,%edi
  801ccf:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  801cd6:	00 00 00 
  801cd9:	ff d0                	callq  *%rax
  801cdb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801cde:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801ce2:	78 0a                	js     801cee <fd_close+0x4e>
  801ce4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801ce8:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801cec:	74 12                	je     801d00 <fd_close+0x60>
  801cee:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801cf2:	74 05                	je     801cf9 <fd_close+0x59>
  801cf4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cf7:	eb 70                	jmp    801d69 <fd_close+0xc9>
  801cf9:	b8 00 00 00 00       	mov    $0x0,%eax
  801cfe:	eb 69                	jmp    801d69 <fd_close+0xc9>
  801d00:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d04:	8b 00                	mov    (%rax),%eax
  801d06:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801d0a:	48 89 d6             	mov    %rdx,%rsi
  801d0d:	89 c7                	mov    %eax,%edi
  801d0f:	48 b8 6b 1d 80 00 00 	movabs $0x801d6b,%rax
  801d16:	00 00 00 
  801d19:	ff d0                	callq  *%rax
  801d1b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801d1e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801d22:	78 2a                	js     801d4e <fd_close+0xae>
  801d24:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d28:	48 8b 40 20          	mov    0x20(%rax),%rax
  801d2c:	48 85 c0             	test   %rax,%rax
  801d2f:	74 16                	je     801d47 <fd_close+0xa7>
  801d31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d35:	48 8b 40 20          	mov    0x20(%rax),%rax
  801d39:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801d3d:	48 89 d7             	mov    %rdx,%rdi
  801d40:	ff d0                	callq  *%rax
  801d42:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801d45:	eb 07                	jmp    801d4e <fd_close+0xae>
  801d47:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801d4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801d52:	48 89 c6             	mov    %rax,%rsi
  801d55:	bf 00 00 00 00       	mov    $0x0,%edi
  801d5a:	48 b8 e0 17 80 00 00 	movabs $0x8017e0,%rax
  801d61:	00 00 00 
  801d64:	ff d0                	callq  *%rax
  801d66:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d69:	c9                   	leaveq 
  801d6a:	c3                   	retq   

0000000000801d6b <dev_lookup>:
  801d6b:	55                   	push   %rbp
  801d6c:	48 89 e5             	mov    %rsp,%rbp
  801d6f:	48 83 ec 20          	sub    $0x20,%rsp
  801d73:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801d76:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801d7a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801d81:	eb 41                	jmp    801dc4 <dev_lookup+0x59>
  801d83:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801d8a:	00 00 00 
  801d8d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801d90:	48 63 d2             	movslq %edx,%rdx
  801d93:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801d97:	8b 00                	mov    (%rax),%eax
  801d99:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  801d9c:	75 22                	jne    801dc0 <dev_lookup+0x55>
  801d9e:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801da5:	00 00 00 
  801da8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801dab:	48 63 d2             	movslq %edx,%rdx
  801dae:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  801db2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801db6:	48 89 10             	mov    %rdx,(%rax)
  801db9:	b8 00 00 00 00       	mov    $0x0,%eax
  801dbe:	eb 60                	jmp    801e20 <dev_lookup+0xb5>
  801dc0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801dc4:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  801dcb:	00 00 00 
  801dce:	8b 55 fc             	mov    -0x4(%rbp),%edx
  801dd1:	48 63 d2             	movslq %edx,%rdx
  801dd4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801dd8:	48 85 c0             	test   %rax,%rax
  801ddb:	75 a6                	jne    801d83 <dev_lookup+0x18>
  801ddd:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  801de4:	00 00 00 
  801de7:	48 8b 00             	mov    (%rax),%rax
  801dea:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  801df0:	8b 55 ec             	mov    -0x14(%rbp),%edx
  801df3:	89 c6                	mov    %eax,%esi
  801df5:	48 bf f8 44 80 00 00 	movabs $0x8044f8,%rdi
  801dfc:	00 00 00 
  801dff:	b8 00 00 00 00       	mov    $0x0,%eax
  801e04:	48 b9 6e 02 80 00 00 	movabs $0x80026e,%rcx
  801e0b:	00 00 00 
  801e0e:	ff d1                	callq  *%rcx
  801e10:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801e14:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801e1b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801e20:	c9                   	leaveq 
  801e21:	c3                   	retq   

0000000000801e22 <close>:
  801e22:	55                   	push   %rbp
  801e23:	48 89 e5             	mov    %rsp,%rbp
  801e26:	48 83 ec 20          	sub    $0x20,%rsp
  801e2a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801e2d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  801e31:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801e34:	48 89 d6             	mov    %rdx,%rsi
  801e37:	89 c7                	mov    %eax,%edi
  801e39:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  801e40:	00 00 00 
  801e43:	ff d0                	callq  *%rax
  801e45:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801e48:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801e4c:	79 05                	jns    801e53 <close+0x31>
  801e4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e51:	eb 18                	jmp    801e6b <close+0x49>
  801e53:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e57:	be 01 00 00 00       	mov    $0x1,%esi
  801e5c:	48 89 c7             	mov    %rax,%rdi
  801e5f:	48 b8 a0 1c 80 00 00 	movabs $0x801ca0,%rax
  801e66:	00 00 00 
  801e69:	ff d0                	callq  *%rax
  801e6b:	c9                   	leaveq 
  801e6c:	c3                   	retq   

0000000000801e6d <close_all>:
  801e6d:	55                   	push   %rbp
  801e6e:	48 89 e5             	mov    %rsp,%rbp
  801e71:	48 83 ec 10          	sub    $0x10,%rsp
  801e75:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e7c:	eb 15                	jmp    801e93 <close_all+0x26>
  801e7e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e81:	89 c7                	mov    %eax,%edi
  801e83:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  801e8a:	00 00 00 
  801e8d:	ff d0                	callq  *%rax
  801e8f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801e93:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801e97:	7e e5                	jle    801e7e <close_all+0x11>
  801e99:	90                   	nop
  801e9a:	c9                   	leaveq 
  801e9b:	c3                   	retq   

0000000000801e9c <dup>:
  801e9c:	55                   	push   %rbp
  801e9d:	48 89 e5             	mov    %rsp,%rbp
  801ea0:	48 83 ec 40          	sub    $0x40,%rsp
  801ea4:	89 7d cc             	mov    %edi,-0x34(%rbp)
  801ea7:	89 75 c8             	mov    %esi,-0x38(%rbp)
  801eaa:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  801eae:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801eb1:	48 89 d6             	mov    %rdx,%rsi
  801eb4:	89 c7                	mov    %eax,%edi
  801eb6:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  801ebd:	00 00 00 
  801ec0:	ff d0                	callq  *%rax
  801ec2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ec5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801ec9:	79 08                	jns    801ed3 <dup+0x37>
  801ecb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ece:	e9 70 01 00 00       	jmpq   802043 <dup+0x1a7>
  801ed3:	8b 45 c8             	mov    -0x38(%rbp),%eax
  801ed6:	89 c7                	mov    %eax,%edi
  801ed8:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  801edf:	00 00 00 
  801ee2:	ff d0                	callq  *%rax
  801ee4:	8b 45 c8             	mov    -0x38(%rbp),%eax
  801ee7:	48 98                	cltq   
  801ee9:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801eef:	48 c1 e0 0c          	shl    $0xc,%rax
  801ef3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801ef7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801efb:	48 89 c7             	mov    %rax,%rdi
  801efe:	48 b8 4d 1b 80 00 00 	movabs $0x801b4d,%rax
  801f05:	00 00 00 
  801f08:	ff d0                	callq  *%rax
  801f0a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801f0e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f12:	48 89 c7             	mov    %rax,%rdi
  801f15:	48 b8 4d 1b 80 00 00 	movabs $0x801b4d,%rax
  801f1c:	00 00 00 
  801f1f:	ff d0                	callq  *%rax
  801f21:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  801f25:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f29:	48 c1 e8 15          	shr    $0x15,%rax
  801f2d:	48 89 c2             	mov    %rax,%rdx
  801f30:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801f37:	01 00 00 
  801f3a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f3e:	83 e0 01             	and    $0x1,%eax
  801f41:	48 85 c0             	test   %rax,%rax
  801f44:	74 71                	je     801fb7 <dup+0x11b>
  801f46:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f4a:	48 c1 e8 0c          	shr    $0xc,%rax
  801f4e:	48 89 c2             	mov    %rax,%rdx
  801f51:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f58:	01 00 00 
  801f5b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f5f:	83 e0 01             	and    $0x1,%eax
  801f62:	48 85 c0             	test   %rax,%rax
  801f65:	74 50                	je     801fb7 <dup+0x11b>
  801f67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f6b:	48 c1 e8 0c          	shr    $0xc,%rax
  801f6f:	48 89 c2             	mov    %rax,%rdx
  801f72:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801f79:	01 00 00 
  801f7c:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801f80:	25 07 0e 00 00       	and    $0xe07,%eax
  801f85:	89 c1                	mov    %eax,%ecx
  801f87:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801f8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801f8f:	41 89 c8             	mov    %ecx,%r8d
  801f92:	48 89 d1             	mov    %rdx,%rcx
  801f95:	ba 00 00 00 00       	mov    $0x0,%edx
  801f9a:	48 89 c6             	mov    %rax,%rsi
  801f9d:	bf 00 00 00 00       	mov    $0x0,%edi
  801fa2:	48 b8 80 17 80 00 00 	movabs $0x801780,%rax
  801fa9:	00 00 00 
  801fac:	ff d0                	callq  *%rax
  801fae:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fb1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801fb5:	78 55                	js     80200c <dup+0x170>
  801fb7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fbb:	48 c1 e8 0c          	shr    $0xc,%rax
  801fbf:	48 89 c2             	mov    %rax,%rdx
  801fc2:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fc9:	01 00 00 
  801fcc:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fd0:	25 07 0e 00 00       	and    $0xe07,%eax
  801fd5:	89 c1                	mov    %eax,%ecx
  801fd7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fdb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801fdf:	41 89 c8             	mov    %ecx,%r8d
  801fe2:	48 89 d1             	mov    %rdx,%rcx
  801fe5:	ba 00 00 00 00       	mov    $0x0,%edx
  801fea:	48 89 c6             	mov    %rax,%rsi
  801fed:	bf 00 00 00 00       	mov    $0x0,%edi
  801ff2:	48 b8 80 17 80 00 00 	movabs $0x801780,%rax
  801ff9:	00 00 00 
  801ffc:	ff d0                	callq  *%rax
  801ffe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802001:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802005:	78 08                	js     80200f <dup+0x173>
  802007:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80200a:	eb 37                	jmp    802043 <dup+0x1a7>
  80200c:	90                   	nop
  80200d:	eb 01                	jmp    802010 <dup+0x174>
  80200f:	90                   	nop
  802010:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802014:	48 89 c6             	mov    %rax,%rsi
  802017:	bf 00 00 00 00       	mov    $0x0,%edi
  80201c:	48 b8 e0 17 80 00 00 	movabs $0x8017e0,%rax
  802023:	00 00 00 
  802026:	ff d0                	callq  *%rax
  802028:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80202c:	48 89 c6             	mov    %rax,%rsi
  80202f:	bf 00 00 00 00       	mov    $0x0,%edi
  802034:	48 b8 e0 17 80 00 00 	movabs $0x8017e0,%rax
  80203b:	00 00 00 
  80203e:	ff d0                	callq  *%rax
  802040:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802043:	c9                   	leaveq 
  802044:	c3                   	retq   

0000000000802045 <read>:
  802045:	55                   	push   %rbp
  802046:	48 89 e5             	mov    %rsp,%rbp
  802049:	48 83 ec 40          	sub    $0x40,%rsp
  80204d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802050:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802054:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802058:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80205c:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80205f:	48 89 d6             	mov    %rdx,%rsi
  802062:	89 c7                	mov    %eax,%edi
  802064:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  80206b:	00 00 00 
  80206e:	ff d0                	callq  *%rax
  802070:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802073:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802077:	78 24                	js     80209d <read+0x58>
  802079:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80207d:	8b 00                	mov    (%rax),%eax
  80207f:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802083:	48 89 d6             	mov    %rdx,%rsi
  802086:	89 c7                	mov    %eax,%edi
  802088:	48 b8 6b 1d 80 00 00 	movabs $0x801d6b,%rax
  80208f:	00 00 00 
  802092:	ff d0                	callq  *%rax
  802094:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802097:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80209b:	79 05                	jns    8020a2 <read+0x5d>
  80209d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020a0:	eb 76                	jmp    802118 <read+0xd3>
  8020a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020a6:	8b 40 08             	mov    0x8(%rax),%eax
  8020a9:	83 e0 03             	and    $0x3,%eax
  8020ac:	83 f8 01             	cmp    $0x1,%eax
  8020af:	75 3a                	jne    8020eb <read+0xa6>
  8020b1:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8020b8:	00 00 00 
  8020bb:	48 8b 00             	mov    (%rax),%rax
  8020be:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8020c4:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8020c7:	89 c6                	mov    %eax,%esi
  8020c9:	48 bf 17 45 80 00 00 	movabs $0x804517,%rdi
  8020d0:	00 00 00 
  8020d3:	b8 00 00 00 00       	mov    $0x0,%eax
  8020d8:	48 b9 6e 02 80 00 00 	movabs $0x80026e,%rcx
  8020df:	00 00 00 
  8020e2:	ff d1                	callq  *%rcx
  8020e4:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8020e9:	eb 2d                	jmp    802118 <read+0xd3>
  8020eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020ef:	48 8b 40 10          	mov    0x10(%rax),%rax
  8020f3:	48 85 c0             	test   %rax,%rax
  8020f6:	75 07                	jne    8020ff <read+0xba>
  8020f8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8020fd:	eb 19                	jmp    802118 <read+0xd3>
  8020ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802103:	48 8b 40 10          	mov    0x10(%rax),%rax
  802107:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80210b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80210f:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802113:	48 89 cf             	mov    %rcx,%rdi
  802116:	ff d0                	callq  *%rax
  802118:	c9                   	leaveq 
  802119:	c3                   	retq   

000000000080211a <readn>:
  80211a:	55                   	push   %rbp
  80211b:	48 89 e5             	mov    %rsp,%rbp
  80211e:	48 83 ec 30          	sub    $0x30,%rsp
  802122:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802125:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802129:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80212d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802134:	eb 47                	jmp    80217d <readn+0x63>
  802136:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802139:	48 98                	cltq   
  80213b:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80213f:	48 29 c2             	sub    %rax,%rdx
  802142:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802145:	48 63 c8             	movslq %eax,%rcx
  802148:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80214c:	48 01 c1             	add    %rax,%rcx
  80214f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802152:	48 89 ce             	mov    %rcx,%rsi
  802155:	89 c7                	mov    %eax,%edi
  802157:	48 b8 45 20 80 00 00 	movabs $0x802045,%rax
  80215e:	00 00 00 
  802161:	ff d0                	callq  *%rax
  802163:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802166:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80216a:	79 05                	jns    802171 <readn+0x57>
  80216c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80216f:	eb 1d                	jmp    80218e <readn+0x74>
  802171:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802175:	74 13                	je     80218a <readn+0x70>
  802177:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80217a:	01 45 fc             	add    %eax,-0x4(%rbp)
  80217d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802180:	48 98                	cltq   
  802182:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802186:	72 ae                	jb     802136 <readn+0x1c>
  802188:	eb 01                	jmp    80218b <readn+0x71>
  80218a:	90                   	nop
  80218b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80218e:	c9                   	leaveq 
  80218f:	c3                   	retq   

0000000000802190 <write>:
  802190:	55                   	push   %rbp
  802191:	48 89 e5             	mov    %rsp,%rbp
  802194:	48 83 ec 40          	sub    $0x40,%rsp
  802198:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80219b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80219f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8021a3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8021a7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8021aa:	48 89 d6             	mov    %rdx,%rsi
  8021ad:	89 c7                	mov    %eax,%edi
  8021af:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  8021b6:	00 00 00 
  8021b9:	ff d0                	callq  *%rax
  8021bb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021be:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021c2:	78 24                	js     8021e8 <write+0x58>
  8021c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021c8:	8b 00                	mov    (%rax),%eax
  8021ca:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8021ce:	48 89 d6             	mov    %rdx,%rsi
  8021d1:	89 c7                	mov    %eax,%edi
  8021d3:	48 b8 6b 1d 80 00 00 	movabs $0x801d6b,%rax
  8021da:	00 00 00 
  8021dd:	ff d0                	callq  *%rax
  8021df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8021e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8021e6:	79 05                	jns    8021ed <write+0x5d>
  8021e8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021eb:	eb 75                	jmp    802262 <write+0xd2>
  8021ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021f1:	8b 40 08             	mov    0x8(%rax),%eax
  8021f4:	83 e0 03             	and    $0x3,%eax
  8021f7:	85 c0                	test   %eax,%eax
  8021f9:	75 3a                	jne    802235 <write+0xa5>
  8021fb:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802202:	00 00 00 
  802205:	48 8b 00             	mov    (%rax),%rax
  802208:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80220e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802211:	89 c6                	mov    %eax,%esi
  802213:	48 bf 33 45 80 00 00 	movabs $0x804533,%rdi
  80221a:	00 00 00 
  80221d:	b8 00 00 00 00       	mov    $0x0,%eax
  802222:	48 b9 6e 02 80 00 00 	movabs $0x80026e,%rcx
  802229:	00 00 00 
  80222c:	ff d1                	callq  *%rcx
  80222e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802233:	eb 2d                	jmp    802262 <write+0xd2>
  802235:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802239:	48 8b 40 18          	mov    0x18(%rax),%rax
  80223d:	48 85 c0             	test   %rax,%rax
  802240:	75 07                	jne    802249 <write+0xb9>
  802242:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802247:	eb 19                	jmp    802262 <write+0xd2>
  802249:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80224d:	48 8b 40 18          	mov    0x18(%rax),%rax
  802251:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802255:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802259:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80225d:	48 89 cf             	mov    %rcx,%rdi
  802260:	ff d0                	callq  *%rax
  802262:	c9                   	leaveq 
  802263:	c3                   	retq   

0000000000802264 <seek>:
  802264:	55                   	push   %rbp
  802265:	48 89 e5             	mov    %rsp,%rbp
  802268:	48 83 ec 18          	sub    $0x18,%rsp
  80226c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80226f:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802272:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802276:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802279:	48 89 d6             	mov    %rdx,%rsi
  80227c:	89 c7                	mov    %eax,%edi
  80227e:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  802285:	00 00 00 
  802288:	ff d0                	callq  *%rax
  80228a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80228d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802291:	79 05                	jns    802298 <seek+0x34>
  802293:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802296:	eb 0f                	jmp    8022a7 <seek+0x43>
  802298:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80229c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80229f:	89 50 04             	mov    %edx,0x4(%rax)
  8022a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8022a7:	c9                   	leaveq 
  8022a8:	c3                   	retq   

00000000008022a9 <ftruncate>:
  8022a9:	55                   	push   %rbp
  8022aa:	48 89 e5             	mov    %rsp,%rbp
  8022ad:	48 83 ec 30          	sub    $0x30,%rsp
  8022b1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8022b4:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8022b7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8022bb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8022be:	48 89 d6             	mov    %rdx,%rsi
  8022c1:	89 c7                	mov    %eax,%edi
  8022c3:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  8022ca:	00 00 00 
  8022cd:	ff d0                	callq  *%rax
  8022cf:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022d2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022d6:	78 24                	js     8022fc <ftruncate+0x53>
  8022d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022dc:	8b 00                	mov    (%rax),%eax
  8022de:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8022e2:	48 89 d6             	mov    %rdx,%rsi
  8022e5:	89 c7                	mov    %eax,%edi
  8022e7:	48 b8 6b 1d 80 00 00 	movabs $0x801d6b,%rax
  8022ee:	00 00 00 
  8022f1:	ff d0                	callq  *%rax
  8022f3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022f6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022fa:	79 05                	jns    802301 <ftruncate+0x58>
  8022fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022ff:	eb 72                	jmp    802373 <ftruncate+0xca>
  802301:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802305:	8b 40 08             	mov    0x8(%rax),%eax
  802308:	83 e0 03             	and    $0x3,%eax
  80230b:	85 c0                	test   %eax,%eax
  80230d:	75 3a                	jne    802349 <ftruncate+0xa0>
  80230f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802316:	00 00 00 
  802319:	48 8b 00             	mov    (%rax),%rax
  80231c:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802322:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802325:	89 c6                	mov    %eax,%esi
  802327:	48 bf 50 45 80 00 00 	movabs $0x804550,%rdi
  80232e:	00 00 00 
  802331:	b8 00 00 00 00       	mov    $0x0,%eax
  802336:	48 b9 6e 02 80 00 00 	movabs $0x80026e,%rcx
  80233d:	00 00 00 
  802340:	ff d1                	callq  *%rcx
  802342:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802347:	eb 2a                	jmp    802373 <ftruncate+0xca>
  802349:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80234d:	48 8b 40 30          	mov    0x30(%rax),%rax
  802351:	48 85 c0             	test   %rax,%rax
  802354:	75 07                	jne    80235d <ftruncate+0xb4>
  802356:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80235b:	eb 16                	jmp    802373 <ftruncate+0xca>
  80235d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802361:	48 8b 40 30          	mov    0x30(%rax),%rax
  802365:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802369:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80236c:	89 ce                	mov    %ecx,%esi
  80236e:	48 89 d7             	mov    %rdx,%rdi
  802371:	ff d0                	callq  *%rax
  802373:	c9                   	leaveq 
  802374:	c3                   	retq   

0000000000802375 <fstat>:
  802375:	55                   	push   %rbp
  802376:	48 89 e5             	mov    %rsp,%rbp
  802379:	48 83 ec 30          	sub    $0x30,%rsp
  80237d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802380:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802384:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802388:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80238b:	48 89 d6             	mov    %rdx,%rsi
  80238e:	89 c7                	mov    %eax,%edi
  802390:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  802397:	00 00 00 
  80239a:	ff d0                	callq  *%rax
  80239c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80239f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023a3:	78 24                	js     8023c9 <fstat+0x54>
  8023a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8023a9:	8b 00                	mov    (%rax),%eax
  8023ab:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8023af:	48 89 d6             	mov    %rdx,%rsi
  8023b2:	89 c7                	mov    %eax,%edi
  8023b4:	48 b8 6b 1d 80 00 00 	movabs $0x801d6b,%rax
  8023bb:	00 00 00 
  8023be:	ff d0                	callq  *%rax
  8023c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023c7:	79 05                	jns    8023ce <fstat+0x59>
  8023c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023cc:	eb 5e                	jmp    80242c <fstat+0xb7>
  8023ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8023d2:	48 8b 40 28          	mov    0x28(%rax),%rax
  8023d6:	48 85 c0             	test   %rax,%rax
  8023d9:	75 07                	jne    8023e2 <fstat+0x6d>
  8023db:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8023e0:	eb 4a                	jmp    80242c <fstat+0xb7>
  8023e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8023e6:	c6 00 00             	movb   $0x0,(%rax)
  8023e9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8023ed:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8023f4:	00 00 00 
  8023f7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8023fb:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802402:	00 00 00 
  802405:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802409:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80240d:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802414:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802418:	48 8b 40 28          	mov    0x28(%rax),%rax
  80241c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802420:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802424:	48 89 ce             	mov    %rcx,%rsi
  802427:	48 89 d7             	mov    %rdx,%rdi
  80242a:	ff d0                	callq  *%rax
  80242c:	c9                   	leaveq 
  80242d:	c3                   	retq   

000000000080242e <stat>:
  80242e:	55                   	push   %rbp
  80242f:	48 89 e5             	mov    %rsp,%rbp
  802432:	48 83 ec 20          	sub    $0x20,%rsp
  802436:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80243a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80243e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802442:	be 00 00 00 00       	mov    $0x0,%esi
  802447:	48 89 c7             	mov    %rax,%rdi
  80244a:	48 b8 1e 25 80 00 00 	movabs $0x80251e,%rax
  802451:	00 00 00 
  802454:	ff d0                	callq  *%rax
  802456:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802459:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80245d:	79 05                	jns    802464 <stat+0x36>
  80245f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802462:	eb 2f                	jmp    802493 <stat+0x65>
  802464:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802468:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80246b:	48 89 d6             	mov    %rdx,%rsi
  80246e:	89 c7                	mov    %eax,%edi
  802470:	48 b8 75 23 80 00 00 	movabs $0x802375,%rax
  802477:	00 00 00 
  80247a:	ff d0                	callq  *%rax
  80247c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80247f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802482:	89 c7                	mov    %eax,%edi
  802484:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  80248b:	00 00 00 
  80248e:	ff d0                	callq  *%rax
  802490:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802493:	c9                   	leaveq 
  802494:	c3                   	retq   

0000000000802495 <fsipc>:
  802495:	55                   	push   %rbp
  802496:	48 89 e5             	mov    %rsp,%rbp
  802499:	48 83 ec 10          	sub    $0x10,%rsp
  80249d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8024a0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8024a4:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8024ab:	00 00 00 
  8024ae:	8b 00                	mov    (%rax),%eax
  8024b0:	85 c0                	test   %eax,%eax
  8024b2:	75 1f                	jne    8024d3 <fsipc+0x3e>
  8024b4:	bf 01 00 00 00       	mov    $0x1,%edi
  8024b9:	48 b8 b7 3e 80 00 00 	movabs $0x803eb7,%rax
  8024c0:	00 00 00 
  8024c3:	ff d0                	callq  *%rax
  8024c5:	89 c2                	mov    %eax,%edx
  8024c7:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8024ce:	00 00 00 
  8024d1:	89 10                	mov    %edx,(%rax)
  8024d3:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8024da:	00 00 00 
  8024dd:	8b 00                	mov    (%rax),%eax
  8024df:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8024e2:	b9 07 00 00 00       	mov    $0x7,%ecx
  8024e7:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8024ee:	00 00 00 
  8024f1:	89 c7                	mov    %eax,%edi
  8024f3:	48 b8 ad 3d 80 00 00 	movabs $0x803dad,%rax
  8024fa:	00 00 00 
  8024fd:	ff d0                	callq  *%rax
  8024ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802503:	ba 00 00 00 00       	mov    $0x0,%edx
  802508:	48 89 c6             	mov    %rax,%rsi
  80250b:	bf 00 00 00 00       	mov    $0x0,%edi
  802510:	48 b8 ec 3c 80 00 00 	movabs $0x803cec,%rax
  802517:	00 00 00 
  80251a:	ff d0                	callq  *%rax
  80251c:	c9                   	leaveq 
  80251d:	c3                   	retq   

000000000080251e <open>:
  80251e:	55                   	push   %rbp
  80251f:	48 89 e5             	mov    %rsp,%rbp
  802522:	48 83 ec 20          	sub    $0x20,%rsp
  802526:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80252a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80252d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802531:	48 89 c7             	mov    %rax,%rdi
  802534:	48 b8 92 0d 80 00 00 	movabs $0x800d92,%rax
  80253b:	00 00 00 
  80253e:	ff d0                	callq  *%rax
  802540:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802545:	7e 0a                	jle    802551 <open+0x33>
  802547:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80254c:	e9 a5 00 00 00       	jmpq   8025f6 <open+0xd8>
  802551:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802555:	48 89 c7             	mov    %rax,%rdi
  802558:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  80255f:	00 00 00 
  802562:	ff d0                	callq  *%rax
  802564:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802567:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80256b:	79 08                	jns    802575 <open+0x57>
  80256d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802570:	e9 81 00 00 00       	jmpq   8025f6 <open+0xd8>
  802575:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802579:	48 89 c6             	mov    %rax,%rsi
  80257c:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802583:	00 00 00 
  802586:	48 b8 fe 0d 80 00 00 	movabs $0x800dfe,%rax
  80258d:	00 00 00 
  802590:	ff d0                	callq  *%rax
  802592:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802599:	00 00 00 
  80259c:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80259f:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8025a5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025a9:	48 89 c6             	mov    %rax,%rsi
  8025ac:	bf 01 00 00 00       	mov    $0x1,%edi
  8025b1:	48 b8 95 24 80 00 00 	movabs $0x802495,%rax
  8025b8:	00 00 00 
  8025bb:	ff d0                	callq  *%rax
  8025bd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025c0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025c4:	79 1d                	jns    8025e3 <open+0xc5>
  8025c6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025ca:	be 00 00 00 00       	mov    $0x0,%esi
  8025cf:	48 89 c7             	mov    %rax,%rdi
  8025d2:	48 b8 a0 1c 80 00 00 	movabs $0x801ca0,%rax
  8025d9:	00 00 00 
  8025dc:	ff d0                	callq  *%rax
  8025de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025e1:	eb 13                	jmp    8025f6 <open+0xd8>
  8025e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025e7:	48 89 c7             	mov    %rax,%rdi
  8025ea:	48 b8 2a 1b 80 00 00 	movabs $0x801b2a,%rax
  8025f1:	00 00 00 
  8025f4:	ff d0                	callq  *%rax
  8025f6:	c9                   	leaveq 
  8025f7:	c3                   	retq   

00000000008025f8 <devfile_flush>:
  8025f8:	55                   	push   %rbp
  8025f9:	48 89 e5             	mov    %rsp,%rbp
  8025fc:	48 83 ec 10          	sub    $0x10,%rsp
  802600:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802604:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802608:	8b 50 0c             	mov    0xc(%rax),%edx
  80260b:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802612:	00 00 00 
  802615:	89 10                	mov    %edx,(%rax)
  802617:	be 00 00 00 00       	mov    $0x0,%esi
  80261c:	bf 06 00 00 00       	mov    $0x6,%edi
  802621:	48 b8 95 24 80 00 00 	movabs $0x802495,%rax
  802628:	00 00 00 
  80262b:	ff d0                	callq  *%rax
  80262d:	c9                   	leaveq 
  80262e:	c3                   	retq   

000000000080262f <devfile_read>:
  80262f:	55                   	push   %rbp
  802630:	48 89 e5             	mov    %rsp,%rbp
  802633:	48 83 ec 30          	sub    $0x30,%rsp
  802637:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80263b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80263f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802643:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802647:	8b 50 0c             	mov    0xc(%rax),%edx
  80264a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802651:	00 00 00 
  802654:	89 10                	mov    %edx,(%rax)
  802656:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80265d:	00 00 00 
  802660:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802664:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802668:	be 00 00 00 00       	mov    $0x0,%esi
  80266d:	bf 03 00 00 00       	mov    $0x3,%edi
  802672:	48 b8 95 24 80 00 00 	movabs $0x802495,%rax
  802679:	00 00 00 
  80267c:	ff d0                	callq  *%rax
  80267e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802681:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802685:	79 08                	jns    80268f <devfile_read+0x60>
  802687:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80268a:	e9 a4 00 00 00       	jmpq   802733 <devfile_read+0x104>
  80268f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802692:	48 98                	cltq   
  802694:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802698:	76 35                	jbe    8026cf <devfile_read+0xa0>
  80269a:	48 b9 76 45 80 00 00 	movabs $0x804576,%rcx
  8026a1:	00 00 00 
  8026a4:	48 ba 7d 45 80 00 00 	movabs $0x80457d,%rdx
  8026ab:	00 00 00 
  8026ae:	be 89 00 00 00       	mov    $0x89,%esi
  8026b3:	48 bf 92 45 80 00 00 	movabs $0x804592,%rdi
  8026ba:	00 00 00 
  8026bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8026c2:	49 b8 d8 3b 80 00 00 	movabs $0x803bd8,%r8
  8026c9:	00 00 00 
  8026cc:	41 ff d0             	callq  *%r8
  8026cf:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  8026d6:	7e 35                	jle    80270d <devfile_read+0xde>
  8026d8:	48 b9 a0 45 80 00 00 	movabs $0x8045a0,%rcx
  8026df:	00 00 00 
  8026e2:	48 ba 7d 45 80 00 00 	movabs $0x80457d,%rdx
  8026e9:	00 00 00 
  8026ec:	be 8a 00 00 00       	mov    $0x8a,%esi
  8026f1:	48 bf 92 45 80 00 00 	movabs $0x804592,%rdi
  8026f8:	00 00 00 
  8026fb:	b8 00 00 00 00       	mov    $0x0,%eax
  802700:	49 b8 d8 3b 80 00 00 	movabs $0x803bd8,%r8
  802707:	00 00 00 
  80270a:	41 ff d0             	callq  *%r8
  80270d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802710:	48 63 d0             	movslq %eax,%rdx
  802713:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802717:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  80271e:	00 00 00 
  802721:	48 89 c7             	mov    %rax,%rdi
  802724:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  80272b:	00 00 00 
  80272e:	ff d0                	callq  *%rax
  802730:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802733:	c9                   	leaveq 
  802734:	c3                   	retq   

0000000000802735 <devfile_write>:
  802735:	55                   	push   %rbp
  802736:	48 89 e5             	mov    %rsp,%rbp
  802739:	48 83 ec 40          	sub    $0x40,%rsp
  80273d:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802741:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802745:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802749:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80274d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802751:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802758:	00 
  802759:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80275d:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802761:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802766:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  80276a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80276e:	8b 50 0c             	mov    0xc(%rax),%edx
  802771:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802778:	00 00 00 
  80277b:	89 10                	mov    %edx,(%rax)
  80277d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802784:	00 00 00 
  802787:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80278b:	48 89 50 08          	mov    %rdx,0x8(%rax)
  80278f:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802793:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802797:	48 89 c6             	mov    %rax,%rsi
  80279a:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  8027a1:	00 00 00 
  8027a4:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  8027ab:	00 00 00 
  8027ae:	ff d0                	callq  *%rax
  8027b0:	be 00 00 00 00       	mov    $0x0,%esi
  8027b5:	bf 04 00 00 00       	mov    $0x4,%edi
  8027ba:	48 b8 95 24 80 00 00 	movabs $0x802495,%rax
  8027c1:	00 00 00 
  8027c4:	ff d0                	callq  *%rax
  8027c6:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8027c9:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8027cd:	79 05                	jns    8027d4 <devfile_write+0x9f>
  8027cf:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027d2:	eb 43                	jmp    802817 <devfile_write+0xe2>
  8027d4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8027d7:	48 98                	cltq   
  8027d9:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8027dd:	76 35                	jbe    802814 <devfile_write+0xdf>
  8027df:	48 b9 76 45 80 00 00 	movabs $0x804576,%rcx
  8027e6:	00 00 00 
  8027e9:	48 ba 7d 45 80 00 00 	movabs $0x80457d,%rdx
  8027f0:	00 00 00 
  8027f3:	be a8 00 00 00       	mov    $0xa8,%esi
  8027f8:	48 bf 92 45 80 00 00 	movabs $0x804592,%rdi
  8027ff:	00 00 00 
  802802:	b8 00 00 00 00       	mov    $0x0,%eax
  802807:	49 b8 d8 3b 80 00 00 	movabs $0x803bd8,%r8
  80280e:	00 00 00 
  802811:	41 ff d0             	callq  *%r8
  802814:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802817:	c9                   	leaveq 
  802818:	c3                   	retq   

0000000000802819 <devfile_stat>:
  802819:	55                   	push   %rbp
  80281a:	48 89 e5             	mov    %rsp,%rbp
  80281d:	48 83 ec 20          	sub    $0x20,%rsp
  802821:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802825:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802829:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80282d:	8b 50 0c             	mov    0xc(%rax),%edx
  802830:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802837:	00 00 00 
  80283a:	89 10                	mov    %edx,(%rax)
  80283c:	be 00 00 00 00       	mov    $0x0,%esi
  802841:	bf 05 00 00 00       	mov    $0x5,%edi
  802846:	48 b8 95 24 80 00 00 	movabs $0x802495,%rax
  80284d:	00 00 00 
  802850:	ff d0                	callq  *%rax
  802852:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802855:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802859:	79 05                	jns    802860 <devfile_stat+0x47>
  80285b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80285e:	eb 56                	jmp    8028b6 <devfile_stat+0x9d>
  802860:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802864:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  80286b:	00 00 00 
  80286e:	48 89 c7             	mov    %rax,%rdi
  802871:	48 b8 fe 0d 80 00 00 	movabs $0x800dfe,%rax
  802878:	00 00 00 
  80287b:	ff d0                	callq  *%rax
  80287d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802884:	00 00 00 
  802887:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  80288d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802891:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802897:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80289e:	00 00 00 
  8028a1:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  8028a7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8028ab:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  8028b1:	b8 00 00 00 00       	mov    $0x0,%eax
  8028b6:	c9                   	leaveq 
  8028b7:	c3                   	retq   

00000000008028b8 <devfile_trunc>:
  8028b8:	55                   	push   %rbp
  8028b9:	48 89 e5             	mov    %rsp,%rbp
  8028bc:	48 83 ec 10          	sub    $0x10,%rsp
  8028c0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8028c4:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8028c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8028cb:	8b 50 0c             	mov    0xc(%rax),%edx
  8028ce:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028d5:	00 00 00 
  8028d8:	89 10                	mov    %edx,(%rax)
  8028da:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028e1:	00 00 00 
  8028e4:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8028e7:	89 50 04             	mov    %edx,0x4(%rax)
  8028ea:	be 00 00 00 00       	mov    $0x0,%esi
  8028ef:	bf 02 00 00 00       	mov    $0x2,%edi
  8028f4:	48 b8 95 24 80 00 00 	movabs $0x802495,%rax
  8028fb:	00 00 00 
  8028fe:	ff d0                	callq  *%rax
  802900:	c9                   	leaveq 
  802901:	c3                   	retq   

0000000000802902 <remove>:
  802902:	55                   	push   %rbp
  802903:	48 89 e5             	mov    %rsp,%rbp
  802906:	48 83 ec 10          	sub    $0x10,%rsp
  80290a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80290e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802912:	48 89 c7             	mov    %rax,%rdi
  802915:	48 b8 92 0d 80 00 00 	movabs $0x800d92,%rax
  80291c:	00 00 00 
  80291f:	ff d0                	callq  *%rax
  802921:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802926:	7e 07                	jle    80292f <remove+0x2d>
  802928:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80292d:	eb 33                	jmp    802962 <remove+0x60>
  80292f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802933:	48 89 c6             	mov    %rax,%rsi
  802936:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  80293d:	00 00 00 
  802940:	48 b8 fe 0d 80 00 00 	movabs $0x800dfe,%rax
  802947:	00 00 00 
  80294a:	ff d0                	callq  *%rax
  80294c:	be 00 00 00 00       	mov    $0x0,%esi
  802951:	bf 07 00 00 00       	mov    $0x7,%edi
  802956:	48 b8 95 24 80 00 00 	movabs $0x802495,%rax
  80295d:	00 00 00 
  802960:	ff d0                	callq  *%rax
  802962:	c9                   	leaveq 
  802963:	c3                   	retq   

0000000000802964 <sync>:
  802964:	55                   	push   %rbp
  802965:	48 89 e5             	mov    %rsp,%rbp
  802968:	be 00 00 00 00       	mov    $0x0,%esi
  80296d:	bf 08 00 00 00       	mov    $0x8,%edi
  802972:	48 b8 95 24 80 00 00 	movabs $0x802495,%rax
  802979:	00 00 00 
  80297c:	ff d0                	callq  *%rax
  80297e:	5d                   	pop    %rbp
  80297f:	c3                   	retq   

0000000000802980 <copy>:
  802980:	55                   	push   %rbp
  802981:	48 89 e5             	mov    %rsp,%rbp
  802984:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  80298b:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802992:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802999:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8029a0:	be 00 00 00 00       	mov    $0x0,%esi
  8029a5:	48 89 c7             	mov    %rax,%rdi
  8029a8:	48 b8 1e 25 80 00 00 	movabs $0x80251e,%rax
  8029af:	00 00 00 
  8029b2:	ff d0                	callq  *%rax
  8029b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029bb:	79 28                	jns    8029e5 <copy+0x65>
  8029bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029c0:	89 c6                	mov    %eax,%esi
  8029c2:	48 bf ac 45 80 00 00 	movabs $0x8045ac,%rdi
  8029c9:	00 00 00 
  8029cc:	b8 00 00 00 00       	mov    $0x0,%eax
  8029d1:	48 ba 6e 02 80 00 00 	movabs $0x80026e,%rdx
  8029d8:	00 00 00 
  8029db:	ff d2                	callq  *%rdx
  8029dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029e0:	e9 76 01 00 00       	jmpq   802b5b <copy+0x1db>
  8029e5:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  8029ec:	be 01 01 00 00       	mov    $0x101,%esi
  8029f1:	48 89 c7             	mov    %rax,%rdi
  8029f4:	48 b8 1e 25 80 00 00 	movabs $0x80251e,%rax
  8029fb:	00 00 00 
  8029fe:	ff d0                	callq  *%rax
  802a00:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802a03:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802a07:	0f 89 ad 00 00 00    	jns    802aba <copy+0x13a>
  802a0d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802a10:	89 c6                	mov    %eax,%esi
  802a12:	48 bf c2 45 80 00 00 	movabs $0x8045c2,%rdi
  802a19:	00 00 00 
  802a1c:	b8 00 00 00 00       	mov    $0x0,%eax
  802a21:	48 ba 6e 02 80 00 00 	movabs $0x80026e,%rdx
  802a28:	00 00 00 
  802a2b:	ff d2                	callq  *%rdx
  802a2d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a30:	89 c7                	mov    %eax,%edi
  802a32:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  802a39:	00 00 00 
  802a3c:	ff d0                	callq  *%rax
  802a3e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802a41:	e9 15 01 00 00       	jmpq   802b5b <copy+0x1db>
  802a46:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802a49:	48 63 d0             	movslq %eax,%rdx
  802a4c:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802a53:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802a56:	48 89 ce             	mov    %rcx,%rsi
  802a59:	89 c7                	mov    %eax,%edi
  802a5b:	48 b8 90 21 80 00 00 	movabs $0x802190,%rax
  802a62:	00 00 00 
  802a65:	ff d0                	callq  *%rax
  802a67:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802a6a:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802a6e:	79 4a                	jns    802aba <copy+0x13a>
  802a70:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802a73:	89 c6                	mov    %eax,%esi
  802a75:	48 bf dc 45 80 00 00 	movabs $0x8045dc,%rdi
  802a7c:	00 00 00 
  802a7f:	b8 00 00 00 00       	mov    $0x0,%eax
  802a84:	48 ba 6e 02 80 00 00 	movabs $0x80026e,%rdx
  802a8b:	00 00 00 
  802a8e:	ff d2                	callq  *%rdx
  802a90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a93:	89 c7                	mov    %eax,%edi
  802a95:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  802a9c:	00 00 00 
  802a9f:	ff d0                	callq  *%rax
  802aa1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802aa4:	89 c7                	mov    %eax,%edi
  802aa6:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  802aad:	00 00 00 
  802ab0:	ff d0                	callq  *%rax
  802ab2:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802ab5:	e9 a1 00 00 00       	jmpq   802b5b <copy+0x1db>
  802aba:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802ac1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ac4:	ba 00 02 00 00       	mov    $0x200,%edx
  802ac9:	48 89 ce             	mov    %rcx,%rsi
  802acc:	89 c7                	mov    %eax,%edi
  802ace:	48 b8 45 20 80 00 00 	movabs $0x802045,%rax
  802ad5:	00 00 00 
  802ad8:	ff d0                	callq  *%rax
  802ada:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802add:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802ae1:	0f 8f 5f ff ff ff    	jg     802a46 <copy+0xc6>
  802ae7:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802aeb:	79 47                	jns    802b34 <copy+0x1b4>
  802aed:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802af0:	89 c6                	mov    %eax,%esi
  802af2:	48 bf ef 45 80 00 00 	movabs $0x8045ef,%rdi
  802af9:	00 00 00 
  802afc:	b8 00 00 00 00       	mov    $0x0,%eax
  802b01:	48 ba 6e 02 80 00 00 	movabs $0x80026e,%rdx
  802b08:	00 00 00 
  802b0b:	ff d2                	callq  *%rdx
  802b0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b10:	89 c7                	mov    %eax,%edi
  802b12:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  802b19:	00 00 00 
  802b1c:	ff d0                	callq  *%rax
  802b1e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b21:	89 c7                	mov    %eax,%edi
  802b23:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  802b2a:	00 00 00 
  802b2d:	ff d0                	callq  *%rax
  802b2f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802b32:	eb 27                	jmp    802b5b <copy+0x1db>
  802b34:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b37:	89 c7                	mov    %eax,%edi
  802b39:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  802b40:	00 00 00 
  802b43:	ff d0                	callq  *%rax
  802b45:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802b48:	89 c7                	mov    %eax,%edi
  802b4a:	48 b8 22 1e 80 00 00 	movabs $0x801e22,%rax
  802b51:	00 00 00 
  802b54:	ff d0                	callq  *%rax
  802b56:	b8 00 00 00 00       	mov    $0x0,%eax
  802b5b:	c9                   	leaveq 
  802b5c:	c3                   	retq   

0000000000802b5d <fd2sockid>:
  802b5d:	55                   	push   %rbp
  802b5e:	48 89 e5             	mov    %rsp,%rbp
  802b61:	48 83 ec 20          	sub    $0x20,%rsp
  802b65:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802b68:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b6c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802b6f:	48 89 d6             	mov    %rdx,%rsi
  802b72:	89 c7                	mov    %eax,%edi
  802b74:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  802b7b:	00 00 00 
  802b7e:	ff d0                	callq  *%rax
  802b80:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b83:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b87:	79 05                	jns    802b8e <fd2sockid+0x31>
  802b89:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b8c:	eb 24                	jmp    802bb2 <fd2sockid+0x55>
  802b8e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b92:	8b 10                	mov    (%rax),%edx
  802b94:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802b9b:	00 00 00 
  802b9e:	8b 00                	mov    (%rax),%eax
  802ba0:	39 c2                	cmp    %eax,%edx
  802ba2:	74 07                	je     802bab <fd2sockid+0x4e>
  802ba4:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ba9:	eb 07                	jmp    802bb2 <fd2sockid+0x55>
  802bab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802baf:	8b 40 0c             	mov    0xc(%rax),%eax
  802bb2:	c9                   	leaveq 
  802bb3:	c3                   	retq   

0000000000802bb4 <alloc_sockfd>:
  802bb4:	55                   	push   %rbp
  802bb5:	48 89 e5             	mov    %rsp,%rbp
  802bb8:	48 83 ec 20          	sub    $0x20,%rsp
  802bbc:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802bbf:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802bc3:	48 89 c7             	mov    %rax,%rdi
  802bc6:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  802bcd:	00 00 00 
  802bd0:	ff d0                	callq  *%rax
  802bd2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bd5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bd9:	78 26                	js     802c01 <alloc_sockfd+0x4d>
  802bdb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bdf:	ba 07 04 00 00       	mov    $0x407,%edx
  802be4:	48 89 c6             	mov    %rax,%rsi
  802be7:	bf 00 00 00 00       	mov    $0x0,%edi
  802bec:	48 b8 2e 17 80 00 00 	movabs $0x80172e,%rax
  802bf3:	00 00 00 
  802bf6:	ff d0                	callq  *%rax
  802bf8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802bfb:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802bff:	79 16                	jns    802c17 <alloc_sockfd+0x63>
  802c01:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c04:	89 c7                	mov    %eax,%edi
  802c06:	48 b8 c3 30 80 00 00 	movabs $0x8030c3,%rax
  802c0d:	00 00 00 
  802c10:	ff d0                	callq  *%rax
  802c12:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c15:	eb 3a                	jmp    802c51 <alloc_sockfd+0x9d>
  802c17:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c1b:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  802c22:	00 00 00 
  802c25:	8b 12                	mov    (%rdx),%edx
  802c27:	89 10                	mov    %edx,(%rax)
  802c29:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c2d:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802c34:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c38:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802c3b:	89 50 0c             	mov    %edx,0xc(%rax)
  802c3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c42:	48 89 c7             	mov    %rax,%rdi
  802c45:	48 b8 2a 1b 80 00 00 	movabs $0x801b2a,%rax
  802c4c:	00 00 00 
  802c4f:	ff d0                	callq  *%rax
  802c51:	c9                   	leaveq 
  802c52:	c3                   	retq   

0000000000802c53 <accept>:
  802c53:	55                   	push   %rbp
  802c54:	48 89 e5             	mov    %rsp,%rbp
  802c57:	48 83 ec 30          	sub    $0x30,%rsp
  802c5b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802c5e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c62:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802c66:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c69:	89 c7                	mov    %eax,%edi
  802c6b:	48 b8 5d 2b 80 00 00 	movabs $0x802b5d,%rax
  802c72:	00 00 00 
  802c75:	ff d0                	callq  *%rax
  802c77:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c7a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c7e:	79 05                	jns    802c85 <accept+0x32>
  802c80:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c83:	eb 3b                	jmp    802cc0 <accept+0x6d>
  802c85:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802c89:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802c8d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c90:	48 89 ce             	mov    %rcx,%rsi
  802c93:	89 c7                	mov    %eax,%edi
  802c95:	48 b8 a0 2f 80 00 00 	movabs $0x802fa0,%rax
  802c9c:	00 00 00 
  802c9f:	ff d0                	callq  *%rax
  802ca1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ca4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ca8:	79 05                	jns    802caf <accept+0x5c>
  802caa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cad:	eb 11                	jmp    802cc0 <accept+0x6d>
  802caf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cb2:	89 c7                	mov    %eax,%edi
  802cb4:	48 b8 b4 2b 80 00 00 	movabs $0x802bb4,%rax
  802cbb:	00 00 00 
  802cbe:	ff d0                	callq  *%rax
  802cc0:	c9                   	leaveq 
  802cc1:	c3                   	retq   

0000000000802cc2 <bind>:
  802cc2:	55                   	push   %rbp
  802cc3:	48 89 e5             	mov    %rsp,%rbp
  802cc6:	48 83 ec 20          	sub    $0x20,%rsp
  802cca:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ccd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802cd1:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802cd4:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802cd7:	89 c7                	mov    %eax,%edi
  802cd9:	48 b8 5d 2b 80 00 00 	movabs $0x802b5d,%rax
  802ce0:	00 00 00 
  802ce3:	ff d0                	callq  *%rax
  802ce5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ce8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802cec:	79 05                	jns    802cf3 <bind+0x31>
  802cee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cf1:	eb 1b                	jmp    802d0e <bind+0x4c>
  802cf3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802cf6:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802cfa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cfd:	48 89 ce             	mov    %rcx,%rsi
  802d00:	89 c7                	mov    %eax,%edi
  802d02:	48 b8 1f 30 80 00 00 	movabs $0x80301f,%rax
  802d09:	00 00 00 
  802d0c:	ff d0                	callq  *%rax
  802d0e:	c9                   	leaveq 
  802d0f:	c3                   	retq   

0000000000802d10 <shutdown>:
  802d10:	55                   	push   %rbp
  802d11:	48 89 e5             	mov    %rsp,%rbp
  802d14:	48 83 ec 20          	sub    $0x20,%rsp
  802d18:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802d1b:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802d1e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802d21:	89 c7                	mov    %eax,%edi
  802d23:	48 b8 5d 2b 80 00 00 	movabs $0x802b5d,%rax
  802d2a:	00 00 00 
  802d2d:	ff d0                	callq  *%rax
  802d2f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d32:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802d36:	79 05                	jns    802d3d <shutdown+0x2d>
  802d38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d3b:	eb 16                	jmp    802d53 <shutdown+0x43>
  802d3d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802d40:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d43:	89 d6                	mov    %edx,%esi
  802d45:	89 c7                	mov    %eax,%edi
  802d47:	48 b8 83 30 80 00 00 	movabs $0x803083,%rax
  802d4e:	00 00 00 
  802d51:	ff d0                	callq  *%rax
  802d53:	c9                   	leaveq 
  802d54:	c3                   	retq   

0000000000802d55 <devsock_close>:
  802d55:	55                   	push   %rbp
  802d56:	48 89 e5             	mov    %rsp,%rbp
  802d59:	48 83 ec 10          	sub    $0x10,%rsp
  802d5d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802d61:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d65:	48 89 c7             	mov    %rax,%rdi
  802d68:	48 b8 28 3f 80 00 00 	movabs $0x803f28,%rax
  802d6f:	00 00 00 
  802d72:	ff d0                	callq  *%rax
  802d74:	83 f8 01             	cmp    $0x1,%eax
  802d77:	75 17                	jne    802d90 <devsock_close+0x3b>
  802d79:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d7d:	8b 40 0c             	mov    0xc(%rax),%eax
  802d80:	89 c7                	mov    %eax,%edi
  802d82:	48 b8 c3 30 80 00 00 	movabs $0x8030c3,%rax
  802d89:	00 00 00 
  802d8c:	ff d0                	callq  *%rax
  802d8e:	eb 05                	jmp    802d95 <devsock_close+0x40>
  802d90:	b8 00 00 00 00       	mov    $0x0,%eax
  802d95:	c9                   	leaveq 
  802d96:	c3                   	retq   

0000000000802d97 <connect>:
  802d97:	55                   	push   %rbp
  802d98:	48 89 e5             	mov    %rsp,%rbp
  802d9b:	48 83 ec 20          	sub    $0x20,%rsp
  802d9f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802da2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802da6:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802da9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802dac:	89 c7                	mov    %eax,%edi
  802dae:	48 b8 5d 2b 80 00 00 	movabs $0x802b5d,%rax
  802db5:	00 00 00 
  802db8:	ff d0                	callq  *%rax
  802dba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dbd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dc1:	79 05                	jns    802dc8 <connect+0x31>
  802dc3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dc6:	eb 1b                	jmp    802de3 <connect+0x4c>
  802dc8:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802dcb:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802dcf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dd2:	48 89 ce             	mov    %rcx,%rsi
  802dd5:	89 c7                	mov    %eax,%edi
  802dd7:	48 b8 f0 30 80 00 00 	movabs $0x8030f0,%rax
  802dde:	00 00 00 
  802de1:	ff d0                	callq  *%rax
  802de3:	c9                   	leaveq 
  802de4:	c3                   	retq   

0000000000802de5 <listen>:
  802de5:	55                   	push   %rbp
  802de6:	48 89 e5             	mov    %rsp,%rbp
  802de9:	48 83 ec 20          	sub    $0x20,%rsp
  802ded:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802df0:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802df3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802df6:	89 c7                	mov    %eax,%edi
  802df8:	48 b8 5d 2b 80 00 00 	movabs $0x802b5d,%rax
  802dff:	00 00 00 
  802e02:	ff d0                	callq  *%rax
  802e04:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e07:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e0b:	79 05                	jns    802e12 <listen+0x2d>
  802e0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e10:	eb 16                	jmp    802e28 <listen+0x43>
  802e12:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802e15:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e18:	89 d6                	mov    %edx,%esi
  802e1a:	89 c7                	mov    %eax,%edi
  802e1c:	48 b8 54 31 80 00 00 	movabs $0x803154,%rax
  802e23:	00 00 00 
  802e26:	ff d0                	callq  *%rax
  802e28:	c9                   	leaveq 
  802e29:	c3                   	retq   

0000000000802e2a <devsock_read>:
  802e2a:	55                   	push   %rbp
  802e2b:	48 89 e5             	mov    %rsp,%rbp
  802e2e:	48 83 ec 20          	sub    $0x20,%rsp
  802e32:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e36:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802e3a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802e3e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e42:	89 c2                	mov    %eax,%edx
  802e44:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e48:	8b 40 0c             	mov    0xc(%rax),%eax
  802e4b:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  802e4f:	b9 00 00 00 00       	mov    $0x0,%ecx
  802e54:	89 c7                	mov    %eax,%edi
  802e56:	48 b8 94 31 80 00 00 	movabs $0x803194,%rax
  802e5d:	00 00 00 
  802e60:	ff d0                	callq  *%rax
  802e62:	c9                   	leaveq 
  802e63:	c3                   	retq   

0000000000802e64 <devsock_write>:
  802e64:	55                   	push   %rbp
  802e65:	48 89 e5             	mov    %rsp,%rbp
  802e68:	48 83 ec 20          	sub    $0x20,%rsp
  802e6c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802e74:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802e78:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802e7c:	89 c2                	mov    %eax,%edx
  802e7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e82:	8b 40 0c             	mov    0xc(%rax),%eax
  802e85:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  802e89:	b9 00 00 00 00       	mov    $0x0,%ecx
  802e8e:	89 c7                	mov    %eax,%edi
  802e90:	48 b8 60 32 80 00 00 	movabs $0x803260,%rax
  802e97:	00 00 00 
  802e9a:	ff d0                	callq  *%rax
  802e9c:	c9                   	leaveq 
  802e9d:	c3                   	retq   

0000000000802e9e <devsock_stat>:
  802e9e:	55                   	push   %rbp
  802e9f:	48 89 e5             	mov    %rsp,%rbp
  802ea2:	48 83 ec 10          	sub    $0x10,%rsp
  802ea6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802eaa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802eae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802eb2:	48 be 0a 46 80 00 00 	movabs $0x80460a,%rsi
  802eb9:	00 00 00 
  802ebc:	48 89 c7             	mov    %rax,%rdi
  802ebf:	48 b8 fe 0d 80 00 00 	movabs $0x800dfe,%rax
  802ec6:	00 00 00 
  802ec9:	ff d0                	callq  *%rax
  802ecb:	b8 00 00 00 00       	mov    $0x0,%eax
  802ed0:	c9                   	leaveq 
  802ed1:	c3                   	retq   

0000000000802ed2 <socket>:
  802ed2:	55                   	push   %rbp
  802ed3:	48 89 e5             	mov    %rsp,%rbp
  802ed6:	48 83 ec 20          	sub    $0x20,%rsp
  802eda:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802edd:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802ee0:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  802ee3:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802ee6:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  802ee9:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802eec:	89 ce                	mov    %ecx,%esi
  802eee:	89 c7                	mov    %eax,%edi
  802ef0:	48 b8 18 33 80 00 00 	movabs $0x803318,%rax
  802ef7:	00 00 00 
  802efa:	ff d0                	callq  *%rax
  802efc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802eff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f03:	79 05                	jns    802f0a <socket+0x38>
  802f05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f08:	eb 11                	jmp    802f1b <socket+0x49>
  802f0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f0d:	89 c7                	mov    %eax,%edi
  802f0f:	48 b8 b4 2b 80 00 00 	movabs $0x802bb4,%rax
  802f16:	00 00 00 
  802f19:	ff d0                	callq  *%rax
  802f1b:	c9                   	leaveq 
  802f1c:	c3                   	retq   

0000000000802f1d <nsipc>:
  802f1d:	55                   	push   %rbp
  802f1e:	48 89 e5             	mov    %rsp,%rbp
  802f21:	48 83 ec 10          	sub    $0x10,%rsp
  802f25:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802f28:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  802f2f:	00 00 00 
  802f32:	8b 00                	mov    (%rax),%eax
  802f34:	85 c0                	test   %eax,%eax
  802f36:	75 1f                	jne    802f57 <nsipc+0x3a>
  802f38:	bf 02 00 00 00       	mov    $0x2,%edi
  802f3d:	48 b8 b7 3e 80 00 00 	movabs $0x803eb7,%rax
  802f44:	00 00 00 
  802f47:	ff d0                	callq  *%rax
  802f49:	89 c2                	mov    %eax,%edx
  802f4b:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  802f52:	00 00 00 
  802f55:	89 10                	mov    %edx,(%rax)
  802f57:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  802f5e:	00 00 00 
  802f61:	8b 00                	mov    (%rax),%eax
  802f63:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802f66:	b9 07 00 00 00       	mov    $0x7,%ecx
  802f6b:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  802f72:	00 00 00 
  802f75:	89 c7                	mov    %eax,%edi
  802f77:	48 b8 ad 3d 80 00 00 	movabs $0x803dad,%rax
  802f7e:	00 00 00 
  802f81:	ff d0                	callq  *%rax
  802f83:	ba 00 00 00 00       	mov    $0x0,%edx
  802f88:	be 00 00 00 00       	mov    $0x0,%esi
  802f8d:	bf 00 00 00 00       	mov    $0x0,%edi
  802f92:	48 b8 ec 3c 80 00 00 	movabs $0x803cec,%rax
  802f99:	00 00 00 
  802f9c:	ff d0                	callq  *%rax
  802f9e:	c9                   	leaveq 
  802f9f:	c3                   	retq   

0000000000802fa0 <nsipc_accept>:
  802fa0:	55                   	push   %rbp
  802fa1:	48 89 e5             	mov    %rsp,%rbp
  802fa4:	48 83 ec 30          	sub    $0x30,%rsp
  802fa8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802faf:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802fb3:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802fba:	00 00 00 
  802fbd:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802fc0:	89 10                	mov    %edx,(%rax)
  802fc2:	bf 01 00 00 00       	mov    $0x1,%edi
  802fc7:	48 b8 1d 2f 80 00 00 	movabs $0x802f1d,%rax
  802fce:	00 00 00 
  802fd1:	ff d0                	callq  *%rax
  802fd3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fd6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fda:	78 3e                	js     80301a <nsipc_accept+0x7a>
  802fdc:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  802fe3:	00 00 00 
  802fe6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802fea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fee:	8b 40 10             	mov    0x10(%rax),%eax
  802ff1:	89 c2                	mov    %eax,%edx
  802ff3:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  802ff7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ffb:	48 89 ce             	mov    %rcx,%rsi
  802ffe:	48 89 c7             	mov    %rax,%rdi
  803001:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  803008:	00 00 00 
  80300b:	ff d0                	callq  *%rax
  80300d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803011:	8b 50 10             	mov    0x10(%rax),%edx
  803014:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803018:	89 10                	mov    %edx,(%rax)
  80301a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80301d:	c9                   	leaveq 
  80301e:	c3                   	retq   

000000000080301f <nsipc_bind>:
  80301f:	55                   	push   %rbp
  803020:	48 89 e5             	mov    %rsp,%rbp
  803023:	48 83 ec 10          	sub    $0x10,%rsp
  803027:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80302a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80302e:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803031:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803038:	00 00 00 
  80303b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80303e:	89 10                	mov    %edx,(%rax)
  803040:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803043:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803047:	48 89 c6             	mov    %rax,%rsi
  80304a:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803051:	00 00 00 
  803054:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  80305b:	00 00 00 
  80305e:	ff d0                	callq  *%rax
  803060:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803067:	00 00 00 
  80306a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80306d:	89 50 14             	mov    %edx,0x14(%rax)
  803070:	bf 02 00 00 00       	mov    $0x2,%edi
  803075:	48 b8 1d 2f 80 00 00 	movabs $0x802f1d,%rax
  80307c:	00 00 00 
  80307f:	ff d0                	callq  *%rax
  803081:	c9                   	leaveq 
  803082:	c3                   	retq   

0000000000803083 <nsipc_shutdown>:
  803083:	55                   	push   %rbp
  803084:	48 89 e5             	mov    %rsp,%rbp
  803087:	48 83 ec 10          	sub    $0x10,%rsp
  80308b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80308e:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803091:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803098:	00 00 00 
  80309b:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80309e:	89 10                	mov    %edx,(%rax)
  8030a0:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8030a7:	00 00 00 
  8030aa:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8030ad:	89 50 04             	mov    %edx,0x4(%rax)
  8030b0:	bf 03 00 00 00       	mov    $0x3,%edi
  8030b5:	48 b8 1d 2f 80 00 00 	movabs $0x802f1d,%rax
  8030bc:	00 00 00 
  8030bf:	ff d0                	callq  *%rax
  8030c1:	c9                   	leaveq 
  8030c2:	c3                   	retq   

00000000008030c3 <nsipc_close>:
  8030c3:	55                   	push   %rbp
  8030c4:	48 89 e5             	mov    %rsp,%rbp
  8030c7:	48 83 ec 10          	sub    $0x10,%rsp
  8030cb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8030ce:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8030d5:	00 00 00 
  8030d8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8030db:	89 10                	mov    %edx,(%rax)
  8030dd:	bf 04 00 00 00       	mov    $0x4,%edi
  8030e2:	48 b8 1d 2f 80 00 00 	movabs $0x802f1d,%rax
  8030e9:	00 00 00 
  8030ec:	ff d0                	callq  *%rax
  8030ee:	c9                   	leaveq 
  8030ef:	c3                   	retq   

00000000008030f0 <nsipc_connect>:
  8030f0:	55                   	push   %rbp
  8030f1:	48 89 e5             	mov    %rsp,%rbp
  8030f4:	48 83 ec 10          	sub    $0x10,%rsp
  8030f8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8030fb:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8030ff:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803102:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803109:	00 00 00 
  80310c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80310f:	89 10                	mov    %edx,(%rax)
  803111:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803114:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803118:	48 89 c6             	mov    %rax,%rsi
  80311b:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  803122:	00 00 00 
  803125:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  80312c:	00 00 00 
  80312f:	ff d0                	callq  *%rax
  803131:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803138:	00 00 00 
  80313b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80313e:	89 50 14             	mov    %edx,0x14(%rax)
  803141:	bf 05 00 00 00       	mov    $0x5,%edi
  803146:	48 b8 1d 2f 80 00 00 	movabs $0x802f1d,%rax
  80314d:	00 00 00 
  803150:	ff d0                	callq  *%rax
  803152:	c9                   	leaveq 
  803153:	c3                   	retq   

0000000000803154 <nsipc_listen>:
  803154:	55                   	push   %rbp
  803155:	48 89 e5             	mov    %rsp,%rbp
  803158:	48 83 ec 10          	sub    $0x10,%rsp
  80315c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80315f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803162:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803169:	00 00 00 
  80316c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80316f:	89 10                	mov    %edx,(%rax)
  803171:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803178:	00 00 00 
  80317b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80317e:	89 50 04             	mov    %edx,0x4(%rax)
  803181:	bf 06 00 00 00       	mov    $0x6,%edi
  803186:	48 b8 1d 2f 80 00 00 	movabs $0x802f1d,%rax
  80318d:	00 00 00 
  803190:	ff d0                	callq  *%rax
  803192:	c9                   	leaveq 
  803193:	c3                   	retq   

0000000000803194 <nsipc_recv>:
  803194:	55                   	push   %rbp
  803195:	48 89 e5             	mov    %rsp,%rbp
  803198:	48 83 ec 30          	sub    $0x30,%rsp
  80319c:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80319f:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8031a3:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8031a6:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8031a9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031b0:	00 00 00 
  8031b3:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8031b6:	89 10                	mov    %edx,(%rax)
  8031b8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031bf:	00 00 00 
  8031c2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8031c5:	89 50 04             	mov    %edx,0x4(%rax)
  8031c8:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8031cf:	00 00 00 
  8031d2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8031d5:	89 50 08             	mov    %edx,0x8(%rax)
  8031d8:	bf 07 00 00 00       	mov    $0x7,%edi
  8031dd:	48 b8 1d 2f 80 00 00 	movabs $0x802f1d,%rax
  8031e4:	00 00 00 
  8031e7:	ff d0                	callq  *%rax
  8031e9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8031ec:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8031f0:	78 69                	js     80325b <nsipc_recv+0xc7>
  8031f2:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  8031f9:	7f 08                	jg     803203 <nsipc_recv+0x6f>
  8031fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031fe:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803201:	7e 35                	jle    803238 <nsipc_recv+0xa4>
  803203:	48 b9 11 46 80 00 00 	movabs $0x804611,%rcx
  80320a:	00 00 00 
  80320d:	48 ba 26 46 80 00 00 	movabs $0x804626,%rdx
  803214:	00 00 00 
  803217:	be 62 00 00 00       	mov    $0x62,%esi
  80321c:	48 bf 3b 46 80 00 00 	movabs $0x80463b,%rdi
  803223:	00 00 00 
  803226:	b8 00 00 00 00       	mov    $0x0,%eax
  80322b:	49 b8 d8 3b 80 00 00 	movabs $0x803bd8,%r8
  803232:	00 00 00 
  803235:	41 ff d0             	callq  *%r8
  803238:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80323b:	48 63 d0             	movslq %eax,%rdx
  80323e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803242:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803249:	00 00 00 
  80324c:	48 89 c7             	mov    %rax,%rdi
  80324f:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  803256:	00 00 00 
  803259:	ff d0                	callq  *%rax
  80325b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80325e:	c9                   	leaveq 
  80325f:	c3                   	retq   

0000000000803260 <nsipc_send>:
  803260:	55                   	push   %rbp
  803261:	48 89 e5             	mov    %rsp,%rbp
  803264:	48 83 ec 20          	sub    $0x20,%rsp
  803268:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80326b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80326f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803272:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803275:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80327c:	00 00 00 
  80327f:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803282:	89 10                	mov    %edx,(%rax)
  803284:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  80328b:	7e 35                	jle    8032c2 <nsipc_send+0x62>
  80328d:	48 b9 4a 46 80 00 00 	movabs $0x80464a,%rcx
  803294:	00 00 00 
  803297:	48 ba 26 46 80 00 00 	movabs $0x804626,%rdx
  80329e:	00 00 00 
  8032a1:	be 6d 00 00 00       	mov    $0x6d,%esi
  8032a6:	48 bf 3b 46 80 00 00 	movabs $0x80463b,%rdi
  8032ad:	00 00 00 
  8032b0:	b8 00 00 00 00       	mov    $0x0,%eax
  8032b5:	49 b8 d8 3b 80 00 00 	movabs $0x803bd8,%r8
  8032bc:	00 00 00 
  8032bf:	41 ff d0             	callq  *%r8
  8032c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8032c5:	48 63 d0             	movslq %eax,%rdx
  8032c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032cc:	48 89 c6             	mov    %rax,%rsi
  8032cf:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  8032d6:	00 00 00 
  8032d9:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  8032e0:	00 00 00 
  8032e3:	ff d0                	callq  *%rax
  8032e5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032ec:	00 00 00 
  8032ef:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8032f2:	89 50 04             	mov    %edx,0x4(%rax)
  8032f5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032fc:	00 00 00 
  8032ff:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803302:	89 50 08             	mov    %edx,0x8(%rax)
  803305:	bf 08 00 00 00       	mov    $0x8,%edi
  80330a:	48 b8 1d 2f 80 00 00 	movabs $0x802f1d,%rax
  803311:	00 00 00 
  803314:	ff d0                	callq  *%rax
  803316:	c9                   	leaveq 
  803317:	c3                   	retq   

0000000000803318 <nsipc_socket>:
  803318:	55                   	push   %rbp
  803319:	48 89 e5             	mov    %rsp,%rbp
  80331c:	48 83 ec 10          	sub    $0x10,%rsp
  803320:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803323:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803326:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803329:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803330:	00 00 00 
  803333:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803336:	89 10                	mov    %edx,(%rax)
  803338:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80333f:	00 00 00 
  803342:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803345:	89 50 04             	mov    %edx,0x4(%rax)
  803348:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80334f:	00 00 00 
  803352:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803355:	89 50 08             	mov    %edx,0x8(%rax)
  803358:	bf 09 00 00 00       	mov    $0x9,%edi
  80335d:	48 b8 1d 2f 80 00 00 	movabs $0x802f1d,%rax
  803364:	00 00 00 
  803367:	ff d0                	callq  *%rax
  803369:	c9                   	leaveq 
  80336a:	c3                   	retq   

000000000080336b <pipe>:
  80336b:	55                   	push   %rbp
  80336c:	48 89 e5             	mov    %rsp,%rbp
  80336f:	53                   	push   %rbx
  803370:	48 83 ec 38          	sub    $0x38,%rsp
  803374:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803378:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  80337c:	48 89 c7             	mov    %rax,%rdi
  80337f:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  803386:	00 00 00 
  803389:	ff d0                	callq  *%rax
  80338b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80338e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803392:	0f 88 bf 01 00 00    	js     803557 <pipe+0x1ec>
  803398:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80339c:	ba 07 04 00 00       	mov    $0x407,%edx
  8033a1:	48 89 c6             	mov    %rax,%rsi
  8033a4:	bf 00 00 00 00       	mov    $0x0,%edi
  8033a9:	48 b8 2e 17 80 00 00 	movabs $0x80172e,%rax
  8033b0:	00 00 00 
  8033b3:	ff d0                	callq  *%rax
  8033b5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8033b8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8033bc:	0f 88 95 01 00 00    	js     803557 <pipe+0x1ec>
  8033c2:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8033c6:	48 89 c7             	mov    %rax,%rdi
  8033c9:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  8033d0:	00 00 00 
  8033d3:	ff d0                	callq  *%rax
  8033d5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8033d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8033dc:	0f 88 5d 01 00 00    	js     80353f <pipe+0x1d4>
  8033e2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8033e6:	ba 07 04 00 00       	mov    $0x407,%edx
  8033eb:	48 89 c6             	mov    %rax,%rsi
  8033ee:	bf 00 00 00 00       	mov    $0x0,%edi
  8033f3:	48 b8 2e 17 80 00 00 	movabs $0x80172e,%rax
  8033fa:	00 00 00 
  8033fd:	ff d0                	callq  *%rax
  8033ff:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803402:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803406:	0f 88 33 01 00 00    	js     80353f <pipe+0x1d4>
  80340c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803410:	48 89 c7             	mov    %rax,%rdi
  803413:	48 b8 4d 1b 80 00 00 	movabs $0x801b4d,%rax
  80341a:	00 00 00 
  80341d:	ff d0                	callq  *%rax
  80341f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803423:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803427:	ba 07 04 00 00       	mov    $0x407,%edx
  80342c:	48 89 c6             	mov    %rax,%rsi
  80342f:	bf 00 00 00 00       	mov    $0x0,%edi
  803434:	48 b8 2e 17 80 00 00 	movabs $0x80172e,%rax
  80343b:	00 00 00 
  80343e:	ff d0                	callq  *%rax
  803440:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803443:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803447:	0f 88 d9 00 00 00    	js     803526 <pipe+0x1bb>
  80344d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803451:	48 89 c7             	mov    %rax,%rdi
  803454:	48 b8 4d 1b 80 00 00 	movabs $0x801b4d,%rax
  80345b:	00 00 00 
  80345e:	ff d0                	callq  *%rax
  803460:	48 89 c2             	mov    %rax,%rdx
  803463:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803467:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  80346d:	48 89 d1             	mov    %rdx,%rcx
  803470:	ba 00 00 00 00       	mov    $0x0,%edx
  803475:	48 89 c6             	mov    %rax,%rsi
  803478:	bf 00 00 00 00       	mov    $0x0,%edi
  80347d:	48 b8 80 17 80 00 00 	movabs $0x801780,%rax
  803484:	00 00 00 
  803487:	ff d0                	callq  *%rax
  803489:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80348c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803490:	78 79                	js     80350b <pipe+0x1a0>
  803492:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803496:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  80349d:	00 00 00 
  8034a0:	8b 12                	mov    (%rdx),%edx
  8034a2:	89 10                	mov    %edx,(%rax)
  8034a4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8034a8:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  8034af:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8034b3:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  8034ba:	00 00 00 
  8034bd:	8b 12                	mov    (%rdx),%edx
  8034bf:	89 10                	mov    %edx,(%rax)
  8034c1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8034c5:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  8034cc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8034d0:	48 89 c7             	mov    %rax,%rdi
  8034d3:	48 b8 2a 1b 80 00 00 	movabs $0x801b2a,%rax
  8034da:	00 00 00 
  8034dd:	ff d0                	callq  *%rax
  8034df:	89 c2                	mov    %eax,%edx
  8034e1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8034e5:	89 10                	mov    %edx,(%rax)
  8034e7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8034eb:	48 8d 58 04          	lea    0x4(%rax),%rbx
  8034ef:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8034f3:	48 89 c7             	mov    %rax,%rdi
  8034f6:	48 b8 2a 1b 80 00 00 	movabs $0x801b2a,%rax
  8034fd:	00 00 00 
  803500:	ff d0                	callq  *%rax
  803502:	89 03                	mov    %eax,(%rbx)
  803504:	b8 00 00 00 00       	mov    $0x0,%eax
  803509:	eb 4f                	jmp    80355a <pipe+0x1ef>
  80350b:	90                   	nop
  80350c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803510:	48 89 c6             	mov    %rax,%rsi
  803513:	bf 00 00 00 00       	mov    $0x0,%edi
  803518:	48 b8 e0 17 80 00 00 	movabs $0x8017e0,%rax
  80351f:	00 00 00 
  803522:	ff d0                	callq  *%rax
  803524:	eb 01                	jmp    803527 <pipe+0x1bc>
  803526:	90                   	nop
  803527:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80352b:	48 89 c6             	mov    %rax,%rsi
  80352e:	bf 00 00 00 00       	mov    $0x0,%edi
  803533:	48 b8 e0 17 80 00 00 	movabs $0x8017e0,%rax
  80353a:	00 00 00 
  80353d:	ff d0                	callq  *%rax
  80353f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803543:	48 89 c6             	mov    %rax,%rsi
  803546:	bf 00 00 00 00       	mov    $0x0,%edi
  80354b:	48 b8 e0 17 80 00 00 	movabs $0x8017e0,%rax
  803552:	00 00 00 
  803555:	ff d0                	callq  *%rax
  803557:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80355a:	48 83 c4 38          	add    $0x38,%rsp
  80355e:	5b                   	pop    %rbx
  80355f:	5d                   	pop    %rbp
  803560:	c3                   	retq   

0000000000803561 <_pipeisclosed>:
  803561:	55                   	push   %rbp
  803562:	48 89 e5             	mov    %rsp,%rbp
  803565:	53                   	push   %rbx
  803566:	48 83 ec 28          	sub    $0x28,%rsp
  80356a:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80356e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803572:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803579:	00 00 00 
  80357c:	48 8b 00             	mov    (%rax),%rax
  80357f:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803585:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803588:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80358c:	48 89 c7             	mov    %rax,%rdi
  80358f:	48 b8 28 3f 80 00 00 	movabs $0x803f28,%rax
  803596:	00 00 00 
  803599:	ff d0                	callq  *%rax
  80359b:	89 c3                	mov    %eax,%ebx
  80359d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8035a1:	48 89 c7             	mov    %rax,%rdi
  8035a4:	48 b8 28 3f 80 00 00 	movabs $0x803f28,%rax
  8035ab:	00 00 00 
  8035ae:	ff d0                	callq  *%rax
  8035b0:	39 c3                	cmp    %eax,%ebx
  8035b2:	0f 94 c0             	sete   %al
  8035b5:	0f b6 c0             	movzbl %al,%eax
  8035b8:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8035bb:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8035c2:	00 00 00 
  8035c5:	48 8b 00             	mov    (%rax),%rax
  8035c8:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8035ce:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8035d1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035d4:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8035d7:	75 05                	jne    8035de <_pipeisclosed+0x7d>
  8035d9:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8035dc:	eb 4a                	jmp    803628 <_pipeisclosed+0xc7>
  8035de:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035e1:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  8035e4:	74 8c                	je     803572 <_pipeisclosed+0x11>
  8035e6:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  8035ea:	75 86                	jne    803572 <_pipeisclosed+0x11>
  8035ec:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8035f3:	00 00 00 
  8035f6:	48 8b 00             	mov    (%rax),%rax
  8035f9:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  8035ff:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803602:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803605:	89 c6                	mov    %eax,%esi
  803607:	48 bf 5b 46 80 00 00 	movabs $0x80465b,%rdi
  80360e:	00 00 00 
  803611:	b8 00 00 00 00       	mov    $0x0,%eax
  803616:	49 b8 6e 02 80 00 00 	movabs $0x80026e,%r8
  80361d:	00 00 00 
  803620:	41 ff d0             	callq  *%r8
  803623:	e9 4a ff ff ff       	jmpq   803572 <_pipeisclosed+0x11>
  803628:	48 83 c4 28          	add    $0x28,%rsp
  80362c:	5b                   	pop    %rbx
  80362d:	5d                   	pop    %rbp
  80362e:	c3                   	retq   

000000000080362f <pipeisclosed>:
  80362f:	55                   	push   %rbp
  803630:	48 89 e5             	mov    %rsp,%rbp
  803633:	48 83 ec 30          	sub    $0x30,%rsp
  803637:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80363a:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80363e:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803641:	48 89 d6             	mov    %rdx,%rsi
  803644:	89 c7                	mov    %eax,%edi
  803646:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  80364d:	00 00 00 
  803650:	ff d0                	callq  *%rax
  803652:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803655:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803659:	79 05                	jns    803660 <pipeisclosed+0x31>
  80365b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80365e:	eb 31                	jmp    803691 <pipeisclosed+0x62>
  803660:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803664:	48 89 c7             	mov    %rax,%rdi
  803667:	48 b8 4d 1b 80 00 00 	movabs $0x801b4d,%rax
  80366e:	00 00 00 
  803671:	ff d0                	callq  *%rax
  803673:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803677:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80367b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80367f:	48 89 d6             	mov    %rdx,%rsi
  803682:	48 89 c7             	mov    %rax,%rdi
  803685:	48 b8 61 35 80 00 00 	movabs $0x803561,%rax
  80368c:	00 00 00 
  80368f:	ff d0                	callq  *%rax
  803691:	c9                   	leaveq 
  803692:	c3                   	retq   

0000000000803693 <devpipe_read>:
  803693:	55                   	push   %rbp
  803694:	48 89 e5             	mov    %rsp,%rbp
  803697:	48 83 ec 40          	sub    $0x40,%rsp
  80369b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80369f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8036a3:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8036a7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036ab:	48 89 c7             	mov    %rax,%rdi
  8036ae:	48 b8 4d 1b 80 00 00 	movabs $0x801b4d,%rax
  8036b5:	00 00 00 
  8036b8:	ff d0                	callq  *%rax
  8036ba:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8036be:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036c2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8036c6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8036cd:	00 
  8036ce:	e9 90 00 00 00       	jmpq   803763 <devpipe_read+0xd0>
  8036d3:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  8036d8:	74 09                	je     8036e3 <devpipe_read+0x50>
  8036da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8036de:	e9 8e 00 00 00       	jmpq   803771 <devpipe_read+0xde>
  8036e3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8036e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8036eb:	48 89 d6             	mov    %rdx,%rsi
  8036ee:	48 89 c7             	mov    %rax,%rdi
  8036f1:	48 b8 61 35 80 00 00 	movabs $0x803561,%rax
  8036f8:	00 00 00 
  8036fb:	ff d0                	callq  *%rax
  8036fd:	85 c0                	test   %eax,%eax
  8036ff:	74 07                	je     803708 <devpipe_read+0x75>
  803701:	b8 00 00 00 00       	mov    $0x0,%eax
  803706:	eb 69                	jmp    803771 <devpipe_read+0xde>
  803708:	48 b8 f1 16 80 00 00 	movabs $0x8016f1,%rax
  80370f:	00 00 00 
  803712:	ff d0                	callq  *%rax
  803714:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803718:	8b 10                	mov    (%rax),%edx
  80371a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80371e:	8b 40 04             	mov    0x4(%rax),%eax
  803721:	39 c2                	cmp    %eax,%edx
  803723:	74 ae                	je     8036d3 <devpipe_read+0x40>
  803725:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803729:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80372d:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803731:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803735:	8b 00                	mov    (%rax),%eax
  803737:	99                   	cltd   
  803738:	c1 ea 1b             	shr    $0x1b,%edx
  80373b:	01 d0                	add    %edx,%eax
  80373d:	83 e0 1f             	and    $0x1f,%eax
  803740:	29 d0                	sub    %edx,%eax
  803742:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803746:	48 98                	cltq   
  803748:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  80374d:	88 01                	mov    %al,(%rcx)
  80374f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803753:	8b 00                	mov    (%rax),%eax
  803755:	8d 50 01             	lea    0x1(%rax),%edx
  803758:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80375c:	89 10                	mov    %edx,(%rax)
  80375e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803763:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803767:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80376b:	72 a7                	jb     803714 <devpipe_read+0x81>
  80376d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803771:	c9                   	leaveq 
  803772:	c3                   	retq   

0000000000803773 <devpipe_write>:
  803773:	55                   	push   %rbp
  803774:	48 89 e5             	mov    %rsp,%rbp
  803777:	48 83 ec 40          	sub    $0x40,%rsp
  80377b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80377f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803783:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803787:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80378b:	48 89 c7             	mov    %rax,%rdi
  80378e:	48 b8 4d 1b 80 00 00 	movabs $0x801b4d,%rax
  803795:	00 00 00 
  803798:	ff d0                	callq  *%rax
  80379a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80379e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037a2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8037a6:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8037ad:	00 
  8037ae:	e9 8f 00 00 00       	jmpq   803842 <devpipe_write+0xcf>
  8037b3:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8037b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037bb:	48 89 d6             	mov    %rdx,%rsi
  8037be:	48 89 c7             	mov    %rax,%rdi
  8037c1:	48 b8 61 35 80 00 00 	movabs $0x803561,%rax
  8037c8:	00 00 00 
  8037cb:	ff d0                	callq  *%rax
  8037cd:	85 c0                	test   %eax,%eax
  8037cf:	74 07                	je     8037d8 <devpipe_write+0x65>
  8037d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8037d6:	eb 78                	jmp    803850 <devpipe_write+0xdd>
  8037d8:	48 b8 f1 16 80 00 00 	movabs $0x8016f1,%rax
  8037df:	00 00 00 
  8037e2:	ff d0                	callq  *%rax
  8037e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037e8:	8b 40 04             	mov    0x4(%rax),%eax
  8037eb:	48 63 d0             	movslq %eax,%rdx
  8037ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037f2:	8b 00                	mov    (%rax),%eax
  8037f4:	48 98                	cltq   
  8037f6:	48 83 c0 20          	add    $0x20,%rax
  8037fa:	48 39 c2             	cmp    %rax,%rdx
  8037fd:	73 b4                	jae    8037b3 <devpipe_write+0x40>
  8037ff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803803:	8b 40 04             	mov    0x4(%rax),%eax
  803806:	99                   	cltd   
  803807:	c1 ea 1b             	shr    $0x1b,%edx
  80380a:	01 d0                	add    %edx,%eax
  80380c:	83 e0 1f             	and    $0x1f,%eax
  80380f:	29 d0                	sub    %edx,%eax
  803811:	89 c6                	mov    %eax,%esi
  803813:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803817:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80381b:	48 01 d0             	add    %rdx,%rax
  80381e:	0f b6 08             	movzbl (%rax),%ecx
  803821:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803825:	48 63 c6             	movslq %esi,%rax
  803828:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  80382c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803830:	8b 40 04             	mov    0x4(%rax),%eax
  803833:	8d 50 01             	lea    0x1(%rax),%edx
  803836:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80383a:	89 50 04             	mov    %edx,0x4(%rax)
  80383d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803842:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803846:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80384a:	72 98                	jb     8037e4 <devpipe_write+0x71>
  80384c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803850:	c9                   	leaveq 
  803851:	c3                   	retq   

0000000000803852 <devpipe_stat>:
  803852:	55                   	push   %rbp
  803853:	48 89 e5             	mov    %rsp,%rbp
  803856:	48 83 ec 20          	sub    $0x20,%rsp
  80385a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80385e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803862:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803866:	48 89 c7             	mov    %rax,%rdi
  803869:	48 b8 4d 1b 80 00 00 	movabs $0x801b4d,%rax
  803870:	00 00 00 
  803873:	ff d0                	callq  *%rax
  803875:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803879:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80387d:	48 be 6e 46 80 00 00 	movabs $0x80466e,%rsi
  803884:	00 00 00 
  803887:	48 89 c7             	mov    %rax,%rdi
  80388a:	48 b8 fe 0d 80 00 00 	movabs $0x800dfe,%rax
  803891:	00 00 00 
  803894:	ff d0                	callq  *%rax
  803896:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80389a:	8b 50 04             	mov    0x4(%rax),%edx
  80389d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038a1:	8b 00                	mov    (%rax),%eax
  8038a3:	29 c2                	sub    %eax,%edx
  8038a5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038a9:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  8038af:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038b3:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  8038ba:	00 00 00 
  8038bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038c1:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  8038c8:	00 00 00 
  8038cb:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  8038d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8038d7:	c9                   	leaveq 
  8038d8:	c3                   	retq   

00000000008038d9 <devpipe_close>:
  8038d9:	55                   	push   %rbp
  8038da:	48 89 e5             	mov    %rsp,%rbp
  8038dd:	48 83 ec 10          	sub    $0x10,%rsp
  8038e1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038e9:	48 89 c6             	mov    %rax,%rsi
  8038ec:	bf 00 00 00 00       	mov    $0x0,%edi
  8038f1:	48 b8 e0 17 80 00 00 	movabs $0x8017e0,%rax
  8038f8:	00 00 00 
  8038fb:	ff d0                	callq  *%rax
  8038fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803901:	48 89 c7             	mov    %rax,%rdi
  803904:	48 b8 4d 1b 80 00 00 	movabs $0x801b4d,%rax
  80390b:	00 00 00 
  80390e:	ff d0                	callq  *%rax
  803910:	48 89 c6             	mov    %rax,%rsi
  803913:	bf 00 00 00 00       	mov    $0x0,%edi
  803918:	48 b8 e0 17 80 00 00 	movabs $0x8017e0,%rax
  80391f:	00 00 00 
  803922:	ff d0                	callq  *%rax
  803924:	c9                   	leaveq 
  803925:	c3                   	retq   

0000000000803926 <cputchar>:
  803926:	55                   	push   %rbp
  803927:	48 89 e5             	mov    %rsp,%rbp
  80392a:	48 83 ec 20          	sub    $0x20,%rsp
  80392e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803931:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803934:	88 45 ff             	mov    %al,-0x1(%rbp)
  803937:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  80393b:	be 01 00 00 00       	mov    $0x1,%esi
  803940:	48 89 c7             	mov    %rax,%rdi
  803943:	48 b8 e6 15 80 00 00 	movabs $0x8015e6,%rax
  80394a:	00 00 00 
  80394d:	ff d0                	callq  *%rax
  80394f:	90                   	nop
  803950:	c9                   	leaveq 
  803951:	c3                   	retq   

0000000000803952 <getchar>:
  803952:	55                   	push   %rbp
  803953:	48 89 e5             	mov    %rsp,%rbp
  803956:	48 83 ec 10          	sub    $0x10,%rsp
  80395a:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  80395e:	ba 01 00 00 00       	mov    $0x1,%edx
  803963:	48 89 c6             	mov    %rax,%rsi
  803966:	bf 00 00 00 00       	mov    $0x0,%edi
  80396b:	48 b8 45 20 80 00 00 	movabs $0x802045,%rax
  803972:	00 00 00 
  803975:	ff d0                	callq  *%rax
  803977:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80397a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80397e:	79 05                	jns    803985 <getchar+0x33>
  803980:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803983:	eb 14                	jmp    803999 <getchar+0x47>
  803985:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803989:	7f 07                	jg     803992 <getchar+0x40>
  80398b:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803990:	eb 07                	jmp    803999 <getchar+0x47>
  803992:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803996:	0f b6 c0             	movzbl %al,%eax
  803999:	c9                   	leaveq 
  80399a:	c3                   	retq   

000000000080399b <iscons>:
  80399b:	55                   	push   %rbp
  80399c:	48 89 e5             	mov    %rsp,%rbp
  80399f:	48 83 ec 20          	sub    $0x20,%rsp
  8039a3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8039a6:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8039aa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8039ad:	48 89 d6             	mov    %rdx,%rsi
  8039b0:	89 c7                	mov    %eax,%edi
  8039b2:	48 b8 10 1c 80 00 00 	movabs $0x801c10,%rax
  8039b9:	00 00 00 
  8039bc:	ff d0                	callq  *%rax
  8039be:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8039c1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8039c5:	79 05                	jns    8039cc <iscons+0x31>
  8039c7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8039ca:	eb 1a                	jmp    8039e6 <iscons+0x4b>
  8039cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039d0:	8b 10                	mov    (%rax),%edx
  8039d2:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  8039d9:	00 00 00 
  8039dc:	8b 00                	mov    (%rax),%eax
  8039de:	39 c2                	cmp    %eax,%edx
  8039e0:	0f 94 c0             	sete   %al
  8039e3:	0f b6 c0             	movzbl %al,%eax
  8039e6:	c9                   	leaveq 
  8039e7:	c3                   	retq   

00000000008039e8 <opencons>:
  8039e8:	55                   	push   %rbp
  8039e9:	48 89 e5             	mov    %rsp,%rbp
  8039ec:	48 83 ec 10          	sub    $0x10,%rsp
  8039f0:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8039f4:	48 89 c7             	mov    %rax,%rdi
  8039f7:	48 b8 78 1b 80 00 00 	movabs $0x801b78,%rax
  8039fe:	00 00 00 
  803a01:	ff d0                	callq  *%rax
  803a03:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a06:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a0a:	79 05                	jns    803a11 <opencons+0x29>
  803a0c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a0f:	eb 5b                	jmp    803a6c <opencons+0x84>
  803a11:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a15:	ba 07 04 00 00       	mov    $0x407,%edx
  803a1a:	48 89 c6             	mov    %rax,%rsi
  803a1d:	bf 00 00 00 00       	mov    $0x0,%edi
  803a22:	48 b8 2e 17 80 00 00 	movabs $0x80172e,%rax
  803a29:	00 00 00 
  803a2c:	ff d0                	callq  *%rax
  803a2e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a31:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a35:	79 05                	jns    803a3c <opencons+0x54>
  803a37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a3a:	eb 30                	jmp    803a6c <opencons+0x84>
  803a3c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a40:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803a47:	00 00 00 
  803a4a:	8b 12                	mov    (%rdx),%edx
  803a4c:	89 10                	mov    %edx,(%rax)
  803a4e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a52:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803a59:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a5d:	48 89 c7             	mov    %rax,%rdi
  803a60:	48 b8 2a 1b 80 00 00 	movabs $0x801b2a,%rax
  803a67:	00 00 00 
  803a6a:	ff d0                	callq  *%rax
  803a6c:	c9                   	leaveq 
  803a6d:	c3                   	retq   

0000000000803a6e <devcons_read>:
  803a6e:	55                   	push   %rbp
  803a6f:	48 89 e5             	mov    %rsp,%rbp
  803a72:	48 83 ec 30          	sub    $0x30,%rsp
  803a76:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803a7a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803a7e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803a82:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803a87:	75 13                	jne    803a9c <devcons_read+0x2e>
  803a89:	b8 00 00 00 00       	mov    $0x0,%eax
  803a8e:	eb 49                	jmp    803ad9 <devcons_read+0x6b>
  803a90:	48 b8 f1 16 80 00 00 	movabs $0x8016f1,%rax
  803a97:	00 00 00 
  803a9a:	ff d0                	callq  *%rax
  803a9c:	48 b8 33 16 80 00 00 	movabs $0x801633,%rax
  803aa3:	00 00 00 
  803aa6:	ff d0                	callq  *%rax
  803aa8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803aab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803aaf:	74 df                	je     803a90 <devcons_read+0x22>
  803ab1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803ab5:	79 05                	jns    803abc <devcons_read+0x4e>
  803ab7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803aba:	eb 1d                	jmp    803ad9 <devcons_read+0x6b>
  803abc:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803ac0:	75 07                	jne    803ac9 <devcons_read+0x5b>
  803ac2:	b8 00 00 00 00       	mov    $0x0,%eax
  803ac7:	eb 10                	jmp    803ad9 <devcons_read+0x6b>
  803ac9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803acc:	89 c2                	mov    %eax,%edx
  803ace:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803ad2:	88 10                	mov    %dl,(%rax)
  803ad4:	b8 01 00 00 00       	mov    $0x1,%eax
  803ad9:	c9                   	leaveq 
  803ada:	c3                   	retq   

0000000000803adb <devcons_write>:
  803adb:	55                   	push   %rbp
  803adc:	48 89 e5             	mov    %rsp,%rbp
  803adf:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803ae6:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803aed:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803af4:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803afb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803b02:	eb 76                	jmp    803b7a <devcons_write+0x9f>
  803b04:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803b0b:	89 c2                	mov    %eax,%edx
  803b0d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b10:	29 c2                	sub    %eax,%edx
  803b12:	89 d0                	mov    %edx,%eax
  803b14:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803b17:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803b1a:	83 f8 7f             	cmp    $0x7f,%eax
  803b1d:	76 07                	jbe    803b26 <devcons_write+0x4b>
  803b1f:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803b26:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803b29:	48 63 d0             	movslq %eax,%rdx
  803b2c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b2f:	48 63 c8             	movslq %eax,%rcx
  803b32:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803b39:	48 01 c1             	add    %rax,%rcx
  803b3c:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803b43:	48 89 ce             	mov    %rcx,%rsi
  803b46:	48 89 c7             	mov    %rax,%rdi
  803b49:	48 b8 23 11 80 00 00 	movabs $0x801123,%rax
  803b50:	00 00 00 
  803b53:	ff d0                	callq  *%rax
  803b55:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803b58:	48 63 d0             	movslq %eax,%rdx
  803b5b:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803b62:	48 89 d6             	mov    %rdx,%rsi
  803b65:	48 89 c7             	mov    %rax,%rdi
  803b68:	48 b8 e6 15 80 00 00 	movabs $0x8015e6,%rax
  803b6f:	00 00 00 
  803b72:	ff d0                	callq  *%rax
  803b74:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803b77:	01 45 fc             	add    %eax,-0x4(%rbp)
  803b7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b7d:	48 98                	cltq   
  803b7f:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803b86:	0f 82 78 ff ff ff    	jb     803b04 <devcons_write+0x29>
  803b8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b8f:	c9                   	leaveq 
  803b90:	c3                   	retq   

0000000000803b91 <devcons_close>:
  803b91:	55                   	push   %rbp
  803b92:	48 89 e5             	mov    %rsp,%rbp
  803b95:	48 83 ec 08          	sub    $0x8,%rsp
  803b99:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b9d:	b8 00 00 00 00       	mov    $0x0,%eax
  803ba2:	c9                   	leaveq 
  803ba3:	c3                   	retq   

0000000000803ba4 <devcons_stat>:
  803ba4:	55                   	push   %rbp
  803ba5:	48 89 e5             	mov    %rsp,%rbp
  803ba8:	48 83 ec 10          	sub    $0x10,%rsp
  803bac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803bb0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803bb4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803bb8:	48 be 7a 46 80 00 00 	movabs $0x80467a,%rsi
  803bbf:	00 00 00 
  803bc2:	48 89 c7             	mov    %rax,%rdi
  803bc5:	48 b8 fe 0d 80 00 00 	movabs $0x800dfe,%rax
  803bcc:	00 00 00 
  803bcf:	ff d0                	callq  *%rax
  803bd1:	b8 00 00 00 00       	mov    $0x0,%eax
  803bd6:	c9                   	leaveq 
  803bd7:	c3                   	retq   

0000000000803bd8 <_panic>:
  803bd8:	55                   	push   %rbp
  803bd9:	48 89 e5             	mov    %rsp,%rbp
  803bdc:	53                   	push   %rbx
  803bdd:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803be4:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803beb:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  803bf1:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803bf8:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803bff:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  803c06:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803c0d:	84 c0                	test   %al,%al
  803c0f:	74 23                	je     803c34 <_panic+0x5c>
  803c11:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803c18:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803c1c:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803c20:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  803c24:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803c28:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803c2c:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803c30:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  803c34:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803c3b:	00 00 00 
  803c3e:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  803c45:	00 00 00 
  803c48:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803c4c:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  803c53:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  803c5a:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803c61:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  803c68:	00 00 00 
  803c6b:	48 8b 18             	mov    (%rax),%rbx
  803c6e:	48 b8 b5 16 80 00 00 	movabs $0x8016b5,%rax
  803c75:	00 00 00 
  803c78:	ff d0                	callq  *%rax
  803c7a:	89 c6                	mov    %eax,%esi
  803c7c:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  803c82:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803c89:	41 89 d0             	mov    %edx,%r8d
  803c8c:	48 89 c1             	mov    %rax,%rcx
  803c8f:	48 89 da             	mov    %rbx,%rdx
  803c92:	48 bf 88 46 80 00 00 	movabs $0x804688,%rdi
  803c99:	00 00 00 
  803c9c:	b8 00 00 00 00       	mov    $0x0,%eax
  803ca1:	49 b9 6e 02 80 00 00 	movabs $0x80026e,%r9
  803ca8:	00 00 00 
  803cab:	41 ff d1             	callq  *%r9
  803cae:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  803cb5:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803cbc:	48 89 d6             	mov    %rdx,%rsi
  803cbf:	48 89 c7             	mov    %rax,%rdi
  803cc2:	48 b8 c2 01 80 00 00 	movabs $0x8001c2,%rax
  803cc9:	00 00 00 
  803ccc:	ff d0                	callq  *%rax
  803cce:	48 bf ab 46 80 00 00 	movabs $0x8046ab,%rdi
  803cd5:	00 00 00 
  803cd8:	b8 00 00 00 00       	mov    $0x0,%eax
  803cdd:	48 ba 6e 02 80 00 00 	movabs $0x80026e,%rdx
  803ce4:	00 00 00 
  803ce7:	ff d2                	callq  *%rdx
  803ce9:	cc                   	int3   
  803cea:	eb fd                	jmp    803ce9 <_panic+0x111>

0000000000803cec <ipc_recv>:
  803cec:	55                   	push   %rbp
  803ced:	48 89 e5             	mov    %rsp,%rbp
  803cf0:	48 83 ec 30          	sub    $0x30,%rsp
  803cf4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803cf8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803cfc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803d00:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803d05:	75 0e                	jne    803d15 <ipc_recv+0x29>
  803d07:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803d0e:	00 00 00 
  803d11:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803d15:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803d19:	48 89 c7             	mov    %rax,%rdi
  803d1c:	48 b8 68 19 80 00 00 	movabs $0x801968,%rax
  803d23:	00 00 00 
  803d26:	ff d0                	callq  *%rax
  803d28:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d2b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d2f:	79 27                	jns    803d58 <ipc_recv+0x6c>
  803d31:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803d36:	74 0a                	je     803d42 <ipc_recv+0x56>
  803d38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d3c:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803d42:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803d47:	74 0a                	je     803d53 <ipc_recv+0x67>
  803d49:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d4d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803d53:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d56:	eb 53                	jmp    803dab <ipc_recv+0xbf>
  803d58:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803d5d:	74 19                	je     803d78 <ipc_recv+0x8c>
  803d5f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803d66:	00 00 00 
  803d69:	48 8b 00             	mov    (%rax),%rax
  803d6c:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803d72:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d76:	89 10                	mov    %edx,(%rax)
  803d78:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803d7d:	74 19                	je     803d98 <ipc_recv+0xac>
  803d7f:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803d86:	00 00 00 
  803d89:	48 8b 00             	mov    (%rax),%rax
  803d8c:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  803d92:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803d96:	89 10                	mov    %edx,(%rax)
  803d98:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803d9f:	00 00 00 
  803da2:	48 8b 00             	mov    (%rax),%rax
  803da5:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  803dab:	c9                   	leaveq 
  803dac:	c3                   	retq   

0000000000803dad <ipc_send>:
  803dad:	55                   	push   %rbp
  803dae:	48 89 e5             	mov    %rsp,%rbp
  803db1:	48 83 ec 30          	sub    $0x30,%rsp
  803db5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803db8:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803dbb:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  803dbf:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803dc2:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803dc7:	75 1c                	jne    803de5 <ipc_send+0x38>
  803dc9:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803dd0:	00 00 00 
  803dd3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803dd7:	eb 0c                	jmp    803de5 <ipc_send+0x38>
  803dd9:	48 b8 f1 16 80 00 00 	movabs $0x8016f1,%rax
  803de0:	00 00 00 
  803de3:	ff d0                	callq  *%rax
  803de5:	8b 75 e8             	mov    -0x18(%rbp),%esi
  803de8:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  803deb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803def:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803df2:	89 c7                	mov    %eax,%edi
  803df4:	48 b8 11 19 80 00 00 	movabs $0x801911,%rax
  803dfb:	00 00 00 
  803dfe:	ff d0                	callq  *%rax
  803e00:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e03:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  803e07:	74 d0                	je     803dd9 <ipc_send+0x2c>
  803e09:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e0d:	79 30                	jns    803e3f <ipc_send+0x92>
  803e0f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e12:	89 c1                	mov    %eax,%ecx
  803e14:	48 ba b0 46 80 00 00 	movabs $0x8046b0,%rdx
  803e1b:	00 00 00 
  803e1e:	be 44 00 00 00       	mov    $0x44,%esi
  803e23:	48 bf c6 46 80 00 00 	movabs $0x8046c6,%rdi
  803e2a:	00 00 00 
  803e2d:	b8 00 00 00 00       	mov    $0x0,%eax
  803e32:	49 b8 d8 3b 80 00 00 	movabs $0x803bd8,%r8
  803e39:	00 00 00 
  803e3c:	41 ff d0             	callq  *%r8
  803e3f:	90                   	nop
  803e40:	c9                   	leaveq 
  803e41:	c3                   	retq   

0000000000803e42 <ipc_host_recv>:
  803e42:	55                   	push   %rbp
  803e43:	48 89 e5             	mov    %rsp,%rbp
  803e46:	48 83 ec 10          	sub    $0x10,%rsp
  803e4a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e4e:	48 ba d8 46 80 00 00 	movabs $0x8046d8,%rdx
  803e55:	00 00 00 
  803e58:	be 4e 00 00 00       	mov    $0x4e,%esi
  803e5d:	48 bf c6 46 80 00 00 	movabs $0x8046c6,%rdi
  803e64:	00 00 00 
  803e67:	b8 00 00 00 00       	mov    $0x0,%eax
  803e6c:	48 b9 d8 3b 80 00 00 	movabs $0x803bd8,%rcx
  803e73:	00 00 00 
  803e76:	ff d1                	callq  *%rcx

0000000000803e78 <ipc_host_send>:
  803e78:	55                   	push   %rbp
  803e79:	48 89 e5             	mov    %rsp,%rbp
  803e7c:	48 83 ec 20          	sub    $0x20,%rsp
  803e80:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e83:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e86:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  803e8a:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803e8d:	48 ba f8 46 80 00 00 	movabs $0x8046f8,%rdx
  803e94:	00 00 00 
  803e97:	be 58 00 00 00       	mov    $0x58,%esi
  803e9c:	48 bf c6 46 80 00 00 	movabs $0x8046c6,%rdi
  803ea3:	00 00 00 
  803ea6:	b8 00 00 00 00       	mov    $0x0,%eax
  803eab:	48 b9 d8 3b 80 00 00 	movabs $0x803bd8,%rcx
  803eb2:	00 00 00 
  803eb5:	ff d1                	callq  *%rcx

0000000000803eb7 <ipc_find_env>:
  803eb7:	55                   	push   %rbp
  803eb8:	48 89 e5             	mov    %rsp,%rbp
  803ebb:	48 83 ec 18          	sub    $0x18,%rsp
  803ebf:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ec2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803ec9:	eb 4d                	jmp    803f18 <ipc_find_env+0x61>
  803ecb:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803ed2:	00 00 00 
  803ed5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803ed8:	48 98                	cltq   
  803eda:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803ee1:	48 01 d0             	add    %rdx,%rax
  803ee4:	48 05 d0 00 00 00    	add    $0xd0,%rax
  803eea:	8b 00                	mov    (%rax),%eax
  803eec:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  803eef:	75 23                	jne    803f14 <ipc_find_env+0x5d>
  803ef1:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  803ef8:	00 00 00 
  803efb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803efe:	48 98                	cltq   
  803f00:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803f07:	48 01 d0             	add    %rdx,%rax
  803f0a:	48 05 c8 00 00 00    	add    $0xc8,%rax
  803f10:	8b 00                	mov    (%rax),%eax
  803f12:	eb 12                	jmp    803f26 <ipc_find_env+0x6f>
  803f14:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803f18:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  803f1f:	7e aa                	jle    803ecb <ipc_find_env+0x14>
  803f21:	b8 00 00 00 00       	mov    $0x0,%eax
  803f26:	c9                   	leaveq 
  803f27:	c3                   	retq   

0000000000803f28 <pageref>:
  803f28:	55                   	push   %rbp
  803f29:	48 89 e5             	mov    %rsp,%rbp
  803f2c:	48 83 ec 18          	sub    $0x18,%rsp
  803f30:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f34:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f38:	48 c1 e8 15          	shr    $0x15,%rax
  803f3c:	48 89 c2             	mov    %rax,%rdx
  803f3f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803f46:	01 00 00 
  803f49:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803f4d:	83 e0 01             	and    $0x1,%eax
  803f50:	48 85 c0             	test   %rax,%rax
  803f53:	75 07                	jne    803f5c <pageref+0x34>
  803f55:	b8 00 00 00 00       	mov    $0x0,%eax
  803f5a:	eb 56                	jmp    803fb2 <pageref+0x8a>
  803f5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f60:	48 c1 e8 0c          	shr    $0xc,%rax
  803f64:	48 89 c2             	mov    %rax,%rdx
  803f67:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803f6e:	01 00 00 
  803f71:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803f75:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803f79:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f7d:	83 e0 01             	and    $0x1,%eax
  803f80:	48 85 c0             	test   %rax,%rax
  803f83:	75 07                	jne    803f8c <pageref+0x64>
  803f85:	b8 00 00 00 00       	mov    $0x0,%eax
  803f8a:	eb 26                	jmp    803fb2 <pageref+0x8a>
  803f8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f90:	48 c1 e8 0c          	shr    $0xc,%rax
  803f94:	48 89 c2             	mov    %rax,%rdx
  803f97:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  803f9e:	00 00 00 
  803fa1:	48 c1 e2 04          	shl    $0x4,%rdx
  803fa5:	48 01 d0             	add    %rdx,%rax
  803fa8:	48 83 c0 08          	add    $0x8,%rax
  803fac:	0f b7 00             	movzwl (%rax),%eax
  803faf:	0f b7 c0             	movzwl %ax,%eax
  803fb2:	c9                   	leaveq 
  803fb3:	c3                   	retq   
