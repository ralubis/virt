
vmm/guest/obj/user/lsfd:     file format elf64-x86-64


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
  80003c:	e8 83 01 00 00       	callq  8001c4 <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <usage>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 bf c0 46 80 00 00 	movabs $0x8046c0,%rdi
  80004e:	00 00 00 
  800051:	b8 00 00 00 00       	mov    $0x0,%eax
  800056:	48 ba 92 03 80 00 00 	movabs $0x800392,%rdx
  80005d:	00 00 00 
  800060:	ff d2                	callq  *%rdx
  800062:	48 b8 48 02 80 00 00 	movabs $0x800248,%rax
  800069:	00 00 00 
  80006c:	ff d0                	callq  *%rax
  80006e:	90                   	nop
  80006f:	5d                   	pop    %rbp
  800070:	c3                   	retq   

0000000000800071 <umain>:
  800071:	55                   	push   %rbp
  800072:	48 89 e5             	mov    %rsp,%rbp
  800075:	48 81 ec d0 00 00 00 	sub    $0xd0,%rsp
  80007c:	89 bd 3c ff ff ff    	mov    %edi,-0xc4(%rbp)
  800082:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
  800089:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  800090:	48 8d 95 40 ff ff ff 	lea    -0xc0(%rbp),%rdx
  800097:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
  80009e:	48 8d 85 3c ff ff ff 	lea    -0xc4(%rbp),%rax
  8000a5:	48 89 ce             	mov    %rcx,%rsi
  8000a8:	48 89 c7             	mov    %rax,%rdi
  8000ab:	48 b8 4e 1c 80 00 00 	movabs $0x801c4e,%rax
  8000b2:	00 00 00 
  8000b5:	ff d0                	callq  *%rax
  8000b7:	eb 1b                	jmp    8000d4 <umain+0x63>
  8000b9:	83 7d fc 31          	cmpl   $0x31,-0x4(%rbp)
  8000bd:	75 09                	jne    8000c8 <umain+0x57>
  8000bf:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
  8000c6:	eb 0c                	jmp    8000d4 <umain+0x63>
  8000c8:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000cf:	00 00 00 
  8000d2:	ff d0                	callq  *%rax
  8000d4:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8000db:	48 89 c7             	mov    %rax,%rdi
  8000de:	48 b8 b3 1c 80 00 00 	movabs $0x801cb3,%rax
  8000e5:	00 00 00 
  8000e8:	ff d0                	callq  *%rax
  8000ea:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8000ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8000f1:	79 c6                	jns    8000b9 <umain+0x48>
  8000f3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8000fa:	e9 b8 00 00 00       	jmpq   8001b7 <umain+0x146>
  8000ff:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  800106:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800109:	48 89 d6             	mov    %rdx,%rsi
  80010c:	89 c7                	mov    %eax,%edi
  80010e:	48 b8 78 27 80 00 00 	movabs $0x802778,%rax
  800115:	00 00 00 
  800118:	ff d0                	callq  *%rax
  80011a:	85 c0                	test   %eax,%eax
  80011c:	0f 88 91 00 00 00    	js     8001b3 <umain+0x142>
  800122:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800126:	74 4f                	je     800177 <umain+0x106>
  800128:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80012c:	48 8b 48 08          	mov    0x8(%rax),%rcx
  800130:	8b 7d e0             	mov    -0x20(%rbp),%edi
  800133:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800136:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  80013d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800140:	48 83 ec 08          	sub    $0x8,%rsp
  800144:	51                   	push   %rcx
  800145:	41 89 f9             	mov    %edi,%r9d
  800148:	41 89 f0             	mov    %esi,%r8d
  80014b:	48 89 d1             	mov    %rdx,%rcx
  80014e:	89 c2                	mov    %eax,%edx
  800150:	48 be d8 46 80 00 00 	movabs $0x8046d8,%rsi
  800157:	00 00 00 
  80015a:	bf 01 00 00 00       	mov    $0x1,%edi
  80015f:	b8 00 00 00 00       	mov    $0x0,%eax
  800164:	49 ba f8 30 80 00 00 	movabs $0x8030f8,%r10
  80016b:	00 00 00 
  80016e:	41 ff d2             	callq  *%r10
  800171:	48 83 c4 10          	add    $0x10,%rsp
  800175:	eb 3c                	jmp    8001b3 <umain+0x142>
  800177:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80017b:	48 8b 78 08          	mov    0x8(%rax),%rdi
  80017f:	8b 75 e0             	mov    -0x20(%rbp),%esi
  800182:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800185:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  80018c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80018f:	49 89 f9             	mov    %rdi,%r9
  800192:	41 89 f0             	mov    %esi,%r8d
  800195:	89 c6                	mov    %eax,%esi
  800197:	48 bf d8 46 80 00 00 	movabs $0x8046d8,%rdi
  80019e:	00 00 00 
  8001a1:	b8 00 00 00 00       	mov    $0x0,%eax
  8001a6:	49 ba 92 03 80 00 00 	movabs $0x800392,%r10
  8001ad:	00 00 00 
  8001b0:	41 ff d2             	callq  *%r10
  8001b3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8001b7:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8001bb:	0f 8e 3e ff ff ff    	jle    8000ff <umain+0x8e>
  8001c1:	90                   	nop
  8001c2:	c9                   	leaveq 
  8001c3:	c3                   	retq   

00000000008001c4 <libmain>:
  8001c4:	55                   	push   %rbp
  8001c5:	48 89 e5             	mov    %rsp,%rbp
  8001c8:	48 83 ec 10          	sub    $0x10,%rsp
  8001cc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8001cf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8001d3:	48 b8 d9 17 80 00 00 	movabs $0x8017d9,%rax
  8001da:	00 00 00 
  8001dd:	ff d0                	callq  *%rax
  8001df:	25 ff 03 00 00       	and    $0x3ff,%eax
  8001e4:	48 98                	cltq   
  8001e6:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8001ed:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8001f4:	00 00 00 
  8001f7:	48 01 c2             	add    %rax,%rdx
  8001fa:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  800201:	00 00 00 
  800204:	48 89 10             	mov    %rdx,(%rax)
  800207:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80020b:	7e 14                	jle    800221 <libmain+0x5d>
  80020d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800211:	48 8b 10             	mov    (%rax),%rdx
  800214:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  80021b:	00 00 00 
  80021e:	48 89 10             	mov    %rdx,(%rax)
  800221:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800225:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800228:	48 89 d6             	mov    %rdx,%rsi
  80022b:	89 c7                	mov    %eax,%edi
  80022d:	48 b8 71 00 80 00 00 	movabs $0x800071,%rax
  800234:	00 00 00 
  800237:	ff d0                	callq  *%rax
  800239:	48 b8 48 02 80 00 00 	movabs $0x800248,%rax
  800240:	00 00 00 
  800243:	ff d0                	callq  *%rax
  800245:	90                   	nop
  800246:	c9                   	leaveq 
  800247:	c3                   	retq   

0000000000800248 <exit>:
  800248:	55                   	push   %rbp
  800249:	48 89 e5             	mov    %rsp,%rbp
  80024c:	48 b8 70 22 80 00 00 	movabs $0x802270,%rax
  800253:	00 00 00 
  800256:	ff d0                	callq  *%rax
  800258:	bf 00 00 00 00       	mov    $0x0,%edi
  80025d:	48 b8 93 17 80 00 00 	movabs $0x801793,%rax
  800264:	00 00 00 
  800267:	ff d0                	callq  *%rax
  800269:	90                   	nop
  80026a:	5d                   	pop    %rbp
  80026b:	c3                   	retq   

000000000080026c <putch>:
  80026c:	55                   	push   %rbp
  80026d:	48 89 e5             	mov    %rsp,%rbp
  800270:	48 83 ec 10          	sub    $0x10,%rsp
  800274:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800277:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80027b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80027f:	8b 00                	mov    (%rax),%eax
  800281:	8d 48 01             	lea    0x1(%rax),%ecx
  800284:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800288:	89 0a                	mov    %ecx,(%rdx)
  80028a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80028d:	89 d1                	mov    %edx,%ecx
  80028f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800293:	48 98                	cltq   
  800295:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800299:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80029d:	8b 00                	mov    (%rax),%eax
  80029f:	3d ff 00 00 00       	cmp    $0xff,%eax
  8002a4:	75 2c                	jne    8002d2 <putch+0x66>
  8002a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002aa:	8b 00                	mov    (%rax),%eax
  8002ac:	48 98                	cltq   
  8002ae:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8002b2:	48 83 c2 08          	add    $0x8,%rdx
  8002b6:	48 89 c6             	mov    %rax,%rsi
  8002b9:	48 89 d7             	mov    %rdx,%rdi
  8002bc:	48 b8 0a 17 80 00 00 	movabs $0x80170a,%rax
  8002c3:	00 00 00 
  8002c6:	ff d0                	callq  *%rax
  8002c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002cc:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8002d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002d6:	8b 40 04             	mov    0x4(%rax),%eax
  8002d9:	8d 50 01             	lea    0x1(%rax),%edx
  8002dc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8002e0:	89 50 04             	mov    %edx,0x4(%rax)
  8002e3:	90                   	nop
  8002e4:	c9                   	leaveq 
  8002e5:	c3                   	retq   

00000000008002e6 <vcprintf>:
  8002e6:	55                   	push   %rbp
  8002e7:	48 89 e5             	mov    %rsp,%rbp
  8002ea:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8002f1:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8002f8:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8002ff:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800306:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  80030d:	48 8b 0a             	mov    (%rdx),%rcx
  800310:	48 89 08             	mov    %rcx,(%rax)
  800313:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800317:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80031b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80031f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800323:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  80032a:	00 00 00 
  80032d:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  800334:	00 00 00 
  800337:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  80033e:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  800345:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  80034c:	48 89 c6             	mov    %rax,%rsi
  80034f:	48 bf 6c 02 80 00 00 	movabs $0x80026c,%rdi
  800356:	00 00 00 
  800359:	48 b8 30 07 80 00 00 	movabs $0x800730,%rax
  800360:	00 00 00 
  800363:	ff d0                	callq  *%rax
  800365:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  80036b:	48 98                	cltq   
  80036d:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  800374:	48 83 c2 08          	add    $0x8,%rdx
  800378:	48 89 c6             	mov    %rax,%rsi
  80037b:	48 89 d7             	mov    %rdx,%rdi
  80037e:	48 b8 0a 17 80 00 00 	movabs $0x80170a,%rax
  800385:	00 00 00 
  800388:	ff d0                	callq  *%rax
  80038a:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  800390:	c9                   	leaveq 
  800391:	c3                   	retq   

0000000000800392 <cprintf>:
  800392:	55                   	push   %rbp
  800393:	48 89 e5             	mov    %rsp,%rbp
  800396:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  80039d:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8003a4:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8003ab:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8003b2:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8003b9:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8003c0:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8003c7:	84 c0                	test   %al,%al
  8003c9:	74 20                	je     8003eb <cprintf+0x59>
  8003cb:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8003cf:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8003d3:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8003d7:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8003db:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8003df:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8003e3:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8003e7:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8003eb:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8003f2:	00 00 00 
  8003f5:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8003fc:	00 00 00 
  8003ff:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800403:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80040a:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800411:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800418:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80041f:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800426:	48 8b 0a             	mov    (%rdx),%rcx
  800429:	48 89 08             	mov    %rcx,(%rax)
  80042c:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800430:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800434:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800438:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80043c:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800443:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  80044a:	48 89 d6             	mov    %rdx,%rsi
  80044d:	48 89 c7             	mov    %rax,%rdi
  800450:	48 b8 e6 02 80 00 00 	movabs $0x8002e6,%rax
  800457:	00 00 00 
  80045a:	ff d0                	callq  *%rax
  80045c:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800462:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800468:	c9                   	leaveq 
  800469:	c3                   	retq   

000000000080046a <printnum>:
  80046a:	55                   	push   %rbp
  80046b:	48 89 e5             	mov    %rsp,%rbp
  80046e:	48 83 ec 30          	sub    $0x30,%rsp
  800472:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800476:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80047a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80047e:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  800481:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800485:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800489:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80048c:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800490:	77 54                	ja     8004e6 <printnum+0x7c>
  800492:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800495:	8d 78 ff             	lea    -0x1(%rax),%edi
  800498:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  80049b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80049f:	ba 00 00 00 00       	mov    $0x0,%edx
  8004a4:	48 f7 f6             	div    %rsi
  8004a7:	49 89 c2             	mov    %rax,%r10
  8004aa:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8004ad:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8004b0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8004b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004b8:	41 89 c9             	mov    %ecx,%r9d
  8004bb:	41 89 f8             	mov    %edi,%r8d
  8004be:	89 d1                	mov    %edx,%ecx
  8004c0:	4c 89 d2             	mov    %r10,%rdx
  8004c3:	48 89 c7             	mov    %rax,%rdi
  8004c6:	48 b8 6a 04 80 00 00 	movabs $0x80046a,%rax
  8004cd:	00 00 00 
  8004d0:	ff d0                	callq  *%rax
  8004d2:	eb 1c                	jmp    8004f0 <printnum+0x86>
  8004d4:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8004d8:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8004db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8004df:	48 89 ce             	mov    %rcx,%rsi
  8004e2:	89 d7                	mov    %edx,%edi
  8004e4:	ff d0                	callq  *%rax
  8004e6:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  8004ea:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  8004ee:	7f e4                	jg     8004d4 <printnum+0x6a>
  8004f0:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8004f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8004f7:	ba 00 00 00 00       	mov    $0x0,%edx
  8004fc:	48 f7 f1             	div    %rcx
  8004ff:	48 b8 10 49 80 00 00 	movabs $0x804910,%rax
  800506:	00 00 00 
  800509:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  80050d:	0f be d0             	movsbl %al,%edx
  800510:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800514:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800518:	48 89 ce             	mov    %rcx,%rsi
  80051b:	89 d7                	mov    %edx,%edi
  80051d:	ff d0                	callq  *%rax
  80051f:	90                   	nop
  800520:	c9                   	leaveq 
  800521:	c3                   	retq   

0000000000800522 <getuint>:
  800522:	55                   	push   %rbp
  800523:	48 89 e5             	mov    %rsp,%rbp
  800526:	48 83 ec 20          	sub    $0x20,%rsp
  80052a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80052e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800531:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800535:	7e 4f                	jle    800586 <getuint+0x64>
  800537:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80053b:	8b 00                	mov    (%rax),%eax
  80053d:	83 f8 30             	cmp    $0x30,%eax
  800540:	73 24                	jae    800566 <getuint+0x44>
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
  800564:	eb 14                	jmp    80057a <getuint+0x58>
  800566:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80056a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80056e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800572:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800576:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80057a:	48 8b 00             	mov    (%rax),%rax
  80057d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800581:	e9 9d 00 00 00       	jmpq   800623 <getuint+0x101>
  800586:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  80058a:	74 4c                	je     8005d8 <getuint+0xb6>
  80058c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800590:	8b 00                	mov    (%rax),%eax
  800592:	83 f8 30             	cmp    $0x30,%eax
  800595:	73 24                	jae    8005bb <getuint+0x99>
  800597:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80059b:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80059f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005a3:	8b 00                	mov    (%rax),%eax
  8005a5:	89 c0                	mov    %eax,%eax
  8005a7:	48 01 d0             	add    %rdx,%rax
  8005aa:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005ae:	8b 12                	mov    (%rdx),%edx
  8005b0:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005b3:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005b7:	89 0a                	mov    %ecx,(%rdx)
  8005b9:	eb 14                	jmp    8005cf <getuint+0xad>
  8005bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005bf:	48 8b 40 08          	mov    0x8(%rax),%rax
  8005c3:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8005c7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005cb:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8005cf:	48 8b 00             	mov    (%rax),%rax
  8005d2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8005d6:	eb 4b                	jmp    800623 <getuint+0x101>
  8005d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005dc:	8b 00                	mov    (%rax),%eax
  8005de:	83 f8 30             	cmp    $0x30,%eax
  8005e1:	73 24                	jae    800607 <getuint+0xe5>
  8005e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005e7:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8005eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005ef:	8b 00                	mov    (%rax),%eax
  8005f1:	89 c0                	mov    %eax,%eax
  8005f3:	48 01 d0             	add    %rdx,%rax
  8005f6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8005fa:	8b 12                	mov    (%rdx),%edx
  8005fc:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8005ff:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800603:	89 0a                	mov    %ecx,(%rdx)
  800605:	eb 14                	jmp    80061b <getuint+0xf9>
  800607:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80060b:	48 8b 40 08          	mov    0x8(%rax),%rax
  80060f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800613:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800617:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80061b:	8b 00                	mov    (%rax),%eax
  80061d:	89 c0                	mov    %eax,%eax
  80061f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800623:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800627:	c9                   	leaveq 
  800628:	c3                   	retq   

0000000000800629 <getint>:
  800629:	55                   	push   %rbp
  80062a:	48 89 e5             	mov    %rsp,%rbp
  80062d:	48 83 ec 20          	sub    $0x20,%rsp
  800631:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800635:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800638:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80063c:	7e 4f                	jle    80068d <getint+0x64>
  80063e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800642:	8b 00                	mov    (%rax),%eax
  800644:	83 f8 30             	cmp    $0x30,%eax
  800647:	73 24                	jae    80066d <getint+0x44>
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
  80066b:	eb 14                	jmp    800681 <getint+0x58>
  80066d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800671:	48 8b 40 08          	mov    0x8(%rax),%rax
  800675:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800679:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80067d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800681:	48 8b 00             	mov    (%rax),%rax
  800684:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800688:	e9 9d 00 00 00       	jmpq   80072a <getint+0x101>
  80068d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800691:	74 4c                	je     8006df <getint+0xb6>
  800693:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800697:	8b 00                	mov    (%rax),%eax
  800699:	83 f8 30             	cmp    $0x30,%eax
  80069c:	73 24                	jae    8006c2 <getint+0x99>
  80069e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006aa:	8b 00                	mov    (%rax),%eax
  8006ac:	89 c0                	mov    %eax,%eax
  8006ae:	48 01 d0             	add    %rdx,%rax
  8006b1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b5:	8b 12                	mov    (%rdx),%edx
  8006b7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006ba:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006be:	89 0a                	mov    %ecx,(%rdx)
  8006c0:	eb 14                	jmp    8006d6 <getint+0xad>
  8006c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c6:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006ca:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8006ce:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006d2:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006d6:	48 8b 00             	mov    (%rax),%rax
  8006d9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006dd:	eb 4b                	jmp    80072a <getint+0x101>
  8006df:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e3:	8b 00                	mov    (%rax),%eax
  8006e5:	83 f8 30             	cmp    $0x30,%eax
  8006e8:	73 24                	jae    80070e <getint+0xe5>
  8006ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006ee:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006f2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f6:	8b 00                	mov    (%rax),%eax
  8006f8:	89 c0                	mov    %eax,%eax
  8006fa:	48 01 d0             	add    %rdx,%rax
  8006fd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800701:	8b 12                	mov    (%rdx),%edx
  800703:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800706:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80070a:	89 0a                	mov    %ecx,(%rdx)
  80070c:	eb 14                	jmp    800722 <getint+0xf9>
  80070e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800712:	48 8b 40 08          	mov    0x8(%rax),%rax
  800716:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80071a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80071e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800722:	8b 00                	mov    (%rax),%eax
  800724:	48 98                	cltq   
  800726:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80072a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80072e:	c9                   	leaveq 
  80072f:	c3                   	retq   

0000000000800730 <vprintfmt>:
  800730:	55                   	push   %rbp
  800731:	48 89 e5             	mov    %rsp,%rbp
  800734:	41 54                	push   %r12
  800736:	53                   	push   %rbx
  800737:	48 83 ec 60          	sub    $0x60,%rsp
  80073b:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  80073f:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800743:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800747:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  80074b:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80074f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800753:	48 8b 0a             	mov    (%rdx),%rcx
  800756:	48 89 08             	mov    %rcx,(%rax)
  800759:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80075d:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800761:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800765:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800769:	eb 17                	jmp    800782 <vprintfmt+0x52>
  80076b:	85 db                	test   %ebx,%ebx
  80076d:	0f 84 b9 04 00 00    	je     800c2c <vprintfmt+0x4fc>
  800773:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800777:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80077b:	48 89 d6             	mov    %rdx,%rsi
  80077e:	89 df                	mov    %ebx,%edi
  800780:	ff d0                	callq  *%rax
  800782:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800786:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80078a:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80078e:	0f b6 00             	movzbl (%rax),%eax
  800791:	0f b6 d8             	movzbl %al,%ebx
  800794:	83 fb 25             	cmp    $0x25,%ebx
  800797:	75 d2                	jne    80076b <vprintfmt+0x3b>
  800799:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  80079d:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8007a4:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8007ab:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8007b2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  8007b9:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8007bd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8007c1:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8007c5:	0f b6 00             	movzbl (%rax),%eax
  8007c8:	0f b6 d8             	movzbl %al,%ebx
  8007cb:	8d 43 dd             	lea    -0x23(%rbx),%eax
  8007ce:	83 f8 55             	cmp    $0x55,%eax
  8007d1:	0f 87 22 04 00 00    	ja     800bf9 <vprintfmt+0x4c9>
  8007d7:	89 c0                	mov    %eax,%eax
  8007d9:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8007e0:	00 
  8007e1:	48 b8 38 49 80 00 00 	movabs $0x804938,%rax
  8007e8:	00 00 00 
  8007eb:	48 01 d0             	add    %rdx,%rax
  8007ee:	48 8b 00             	mov    (%rax),%rax
  8007f1:	ff e0                	jmpq   *%rax
  8007f3:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  8007f7:	eb c0                	jmp    8007b9 <vprintfmt+0x89>
  8007f9:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  8007fd:	eb ba                	jmp    8007b9 <vprintfmt+0x89>
  8007ff:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800806:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800809:	89 d0                	mov    %edx,%eax
  80080b:	c1 e0 02             	shl    $0x2,%eax
  80080e:	01 d0                	add    %edx,%eax
  800810:	01 c0                	add    %eax,%eax
  800812:	01 d8                	add    %ebx,%eax
  800814:	83 e8 30             	sub    $0x30,%eax
  800817:	89 45 d8             	mov    %eax,-0x28(%rbp)
  80081a:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  80081e:	0f b6 00             	movzbl (%rax),%eax
  800821:	0f be d8             	movsbl %al,%ebx
  800824:	83 fb 2f             	cmp    $0x2f,%ebx
  800827:	7e 60                	jle    800889 <vprintfmt+0x159>
  800829:	83 fb 39             	cmp    $0x39,%ebx
  80082c:	7f 5b                	jg     800889 <vprintfmt+0x159>
  80082e:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800833:	eb d1                	jmp    800806 <vprintfmt+0xd6>
  800835:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800838:	83 f8 30             	cmp    $0x30,%eax
  80083b:	73 17                	jae    800854 <vprintfmt+0x124>
  80083d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800841:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800844:	89 d2                	mov    %edx,%edx
  800846:	48 01 d0             	add    %rdx,%rax
  800849:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80084c:	83 c2 08             	add    $0x8,%edx
  80084f:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800852:	eb 0c                	jmp    800860 <vprintfmt+0x130>
  800854:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800858:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80085c:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800860:	8b 00                	mov    (%rax),%eax
  800862:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800865:	eb 23                	jmp    80088a <vprintfmt+0x15a>
  800867:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80086b:	0f 89 48 ff ff ff    	jns    8007b9 <vprintfmt+0x89>
  800871:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800878:	e9 3c ff ff ff       	jmpq   8007b9 <vprintfmt+0x89>
  80087d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800884:	e9 30 ff ff ff       	jmpq   8007b9 <vprintfmt+0x89>
  800889:	90                   	nop
  80088a:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80088e:	0f 89 25 ff ff ff    	jns    8007b9 <vprintfmt+0x89>
  800894:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800897:	89 45 dc             	mov    %eax,-0x24(%rbp)
  80089a:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8008a1:	e9 13 ff ff ff       	jmpq   8007b9 <vprintfmt+0x89>
  8008a6:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  8008aa:	e9 0a ff ff ff       	jmpq   8007b9 <vprintfmt+0x89>
  8008af:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8008b2:	83 f8 30             	cmp    $0x30,%eax
  8008b5:	73 17                	jae    8008ce <vprintfmt+0x19e>
  8008b7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8008bb:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008be:	89 d2                	mov    %edx,%edx
  8008c0:	48 01 d0             	add    %rdx,%rax
  8008c3:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008c6:	83 c2 08             	add    $0x8,%edx
  8008c9:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8008cc:	eb 0c                	jmp    8008da <vprintfmt+0x1aa>
  8008ce:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8008d2:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8008d6:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8008da:	8b 10                	mov    (%rax),%edx
  8008dc:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  8008e0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008e4:	48 89 ce             	mov    %rcx,%rsi
  8008e7:	89 d7                	mov    %edx,%edi
  8008e9:	ff d0                	callq  *%rax
  8008eb:	e9 37 03 00 00       	jmpq   800c27 <vprintfmt+0x4f7>
  8008f0:	8b 45 b8             	mov    -0x48(%rbp),%eax
  8008f3:	83 f8 30             	cmp    $0x30,%eax
  8008f6:	73 17                	jae    80090f <vprintfmt+0x1df>
  8008f8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8008fc:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8008ff:	89 d2                	mov    %edx,%edx
  800901:	48 01 d0             	add    %rdx,%rax
  800904:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800907:	83 c2 08             	add    $0x8,%edx
  80090a:	89 55 b8             	mov    %edx,-0x48(%rbp)
  80090d:	eb 0c                	jmp    80091b <vprintfmt+0x1eb>
  80090f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800913:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800917:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  80091b:	8b 18                	mov    (%rax),%ebx
  80091d:	85 db                	test   %ebx,%ebx
  80091f:	79 02                	jns    800923 <vprintfmt+0x1f3>
  800921:	f7 db                	neg    %ebx
  800923:	83 fb 15             	cmp    $0x15,%ebx
  800926:	7f 16                	jg     80093e <vprintfmt+0x20e>
  800928:	48 b8 60 48 80 00 00 	movabs $0x804860,%rax
  80092f:	00 00 00 
  800932:	48 63 d3             	movslq %ebx,%rdx
  800935:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800939:	4d 85 e4             	test   %r12,%r12
  80093c:	75 2e                	jne    80096c <vprintfmt+0x23c>
  80093e:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800942:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800946:	89 d9                	mov    %ebx,%ecx
  800948:	48 ba 21 49 80 00 00 	movabs $0x804921,%rdx
  80094f:	00 00 00 
  800952:	48 89 c7             	mov    %rax,%rdi
  800955:	b8 00 00 00 00       	mov    $0x0,%eax
  80095a:	49 b8 36 0c 80 00 00 	movabs $0x800c36,%r8
  800961:	00 00 00 
  800964:	41 ff d0             	callq  *%r8
  800967:	e9 bb 02 00 00       	jmpq   800c27 <vprintfmt+0x4f7>
  80096c:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800970:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800974:	4c 89 e1             	mov    %r12,%rcx
  800977:	48 ba 2a 49 80 00 00 	movabs $0x80492a,%rdx
  80097e:	00 00 00 
  800981:	48 89 c7             	mov    %rax,%rdi
  800984:	b8 00 00 00 00       	mov    $0x0,%eax
  800989:	49 b8 36 0c 80 00 00 	movabs $0x800c36,%r8
  800990:	00 00 00 
  800993:	41 ff d0             	callq  *%r8
  800996:	e9 8c 02 00 00       	jmpq   800c27 <vprintfmt+0x4f7>
  80099b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  80099e:	83 f8 30             	cmp    $0x30,%eax
  8009a1:	73 17                	jae    8009ba <vprintfmt+0x28a>
  8009a3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8009a7:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009aa:	89 d2                	mov    %edx,%edx
  8009ac:	48 01 d0             	add    %rdx,%rax
  8009af:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009b2:	83 c2 08             	add    $0x8,%edx
  8009b5:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009b8:	eb 0c                	jmp    8009c6 <vprintfmt+0x296>
  8009ba:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8009be:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8009c2:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009c6:	4c 8b 20             	mov    (%rax),%r12
  8009c9:	4d 85 e4             	test   %r12,%r12
  8009cc:	75 0a                	jne    8009d8 <vprintfmt+0x2a8>
  8009ce:	49 bc 2d 49 80 00 00 	movabs $0x80492d,%r12
  8009d5:	00 00 00 
  8009d8:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009dc:	7e 78                	jle    800a56 <vprintfmt+0x326>
  8009de:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  8009e2:	74 72                	je     800a56 <vprintfmt+0x326>
  8009e4:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8009e7:	48 98                	cltq   
  8009e9:	48 89 c6             	mov    %rax,%rsi
  8009ec:	4c 89 e7             	mov    %r12,%rdi
  8009ef:	48 b8 e4 0e 80 00 00 	movabs $0x800ee4,%rax
  8009f6:	00 00 00 
  8009f9:	ff d0                	callq  *%rax
  8009fb:	29 45 dc             	sub    %eax,-0x24(%rbp)
  8009fe:	eb 17                	jmp    800a17 <vprintfmt+0x2e7>
  800a00:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800a04:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a08:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a0c:	48 89 ce             	mov    %rcx,%rsi
  800a0f:	89 d7                	mov    %edx,%edi
  800a11:	ff d0                	callq  *%rax
  800a13:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a17:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a1b:	7f e3                	jg     800a00 <vprintfmt+0x2d0>
  800a1d:	eb 37                	jmp    800a56 <vprintfmt+0x326>
  800a1f:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800a23:	74 1e                	je     800a43 <vprintfmt+0x313>
  800a25:	83 fb 1f             	cmp    $0x1f,%ebx
  800a28:	7e 05                	jle    800a2f <vprintfmt+0x2ff>
  800a2a:	83 fb 7e             	cmp    $0x7e,%ebx
  800a2d:	7e 14                	jle    800a43 <vprintfmt+0x313>
  800a2f:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a33:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a37:	48 89 d6             	mov    %rdx,%rsi
  800a3a:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800a3f:	ff d0                	callq  *%rax
  800a41:	eb 0f                	jmp    800a52 <vprintfmt+0x322>
  800a43:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a47:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a4b:	48 89 d6             	mov    %rdx,%rsi
  800a4e:	89 df                	mov    %ebx,%edi
  800a50:	ff d0                	callq  *%rax
  800a52:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a56:	4c 89 e0             	mov    %r12,%rax
  800a59:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800a5d:	0f b6 00             	movzbl (%rax),%eax
  800a60:	0f be d8             	movsbl %al,%ebx
  800a63:	85 db                	test   %ebx,%ebx
  800a65:	74 28                	je     800a8f <vprintfmt+0x35f>
  800a67:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a6b:	78 b2                	js     800a1f <vprintfmt+0x2ef>
  800a6d:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800a71:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800a75:	79 a8                	jns    800a1f <vprintfmt+0x2ef>
  800a77:	eb 16                	jmp    800a8f <vprintfmt+0x35f>
  800a79:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800a7d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a81:	48 89 d6             	mov    %rdx,%rsi
  800a84:	bf 20 00 00 00       	mov    $0x20,%edi
  800a89:	ff d0                	callq  *%rax
  800a8b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800a8f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800a93:	7f e4                	jg     800a79 <vprintfmt+0x349>
  800a95:	e9 8d 01 00 00       	jmpq   800c27 <vprintfmt+0x4f7>
  800a9a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800a9e:	be 03 00 00 00       	mov    $0x3,%esi
  800aa3:	48 89 c7             	mov    %rax,%rdi
  800aa6:	48 b8 29 06 80 00 00 	movabs $0x800629,%rax
  800aad:	00 00 00 
  800ab0:	ff d0                	callq  *%rax
  800ab2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ab6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aba:	48 85 c0             	test   %rax,%rax
  800abd:	79 1d                	jns    800adc <vprintfmt+0x3ac>
  800abf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ac3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ac7:	48 89 d6             	mov    %rdx,%rsi
  800aca:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800acf:	ff d0                	callq  *%rax
  800ad1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ad5:	48 f7 d8             	neg    %rax
  800ad8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800adc:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800ae3:	e9 d2 00 00 00       	jmpq   800bba <vprintfmt+0x48a>
  800ae8:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800aec:	be 03 00 00 00       	mov    $0x3,%esi
  800af1:	48 89 c7             	mov    %rax,%rdi
  800af4:	48 b8 22 05 80 00 00 	movabs $0x800522,%rax
  800afb:	00 00 00 
  800afe:	ff d0                	callq  *%rax
  800b00:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b04:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800b0b:	e9 aa 00 00 00       	jmpq   800bba <vprintfmt+0x48a>
  800b10:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b14:	be 03 00 00 00       	mov    $0x3,%esi
  800b19:	48 89 c7             	mov    %rax,%rdi
  800b1c:	48 b8 22 05 80 00 00 	movabs $0x800522,%rax
  800b23:	00 00 00 
  800b26:	ff d0                	callq  *%rax
  800b28:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b2c:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800b33:	e9 82 00 00 00       	jmpq   800bba <vprintfmt+0x48a>
  800b38:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b3c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b40:	48 89 d6             	mov    %rdx,%rsi
  800b43:	bf 30 00 00 00       	mov    $0x30,%edi
  800b48:	ff d0                	callq  *%rax
  800b4a:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b4e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b52:	48 89 d6             	mov    %rdx,%rsi
  800b55:	bf 78 00 00 00       	mov    $0x78,%edi
  800b5a:	ff d0                	callq  *%rax
  800b5c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800b5f:	83 f8 30             	cmp    $0x30,%eax
  800b62:	73 17                	jae    800b7b <vprintfmt+0x44b>
  800b64:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800b68:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b6b:	89 d2                	mov    %edx,%edx
  800b6d:	48 01 d0             	add    %rdx,%rax
  800b70:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b73:	83 c2 08             	add    $0x8,%edx
  800b76:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b79:	eb 0c                	jmp    800b87 <vprintfmt+0x457>
  800b7b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b7f:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b83:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b87:	48 8b 00             	mov    (%rax),%rax
  800b8a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800b8e:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800b95:	eb 23                	jmp    800bba <vprintfmt+0x48a>
  800b97:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800b9b:	be 03 00 00 00       	mov    $0x3,%esi
  800ba0:	48 89 c7             	mov    %rax,%rdi
  800ba3:	48 b8 22 05 80 00 00 	movabs $0x800522,%rax
  800baa:	00 00 00 
  800bad:	ff d0                	callq  *%rax
  800baf:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800bb3:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800bba:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800bbf:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800bc2:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800bc5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bc9:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800bcd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bd1:	45 89 c1             	mov    %r8d,%r9d
  800bd4:	41 89 f8             	mov    %edi,%r8d
  800bd7:	48 89 c7             	mov    %rax,%rdi
  800bda:	48 b8 6a 04 80 00 00 	movabs $0x80046a,%rax
  800be1:	00 00 00 
  800be4:	ff d0                	callq  *%rax
  800be6:	eb 3f                	jmp    800c27 <vprintfmt+0x4f7>
  800be8:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bec:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bf0:	48 89 d6             	mov    %rdx,%rsi
  800bf3:	89 df                	mov    %ebx,%edi
  800bf5:	ff d0                	callq  *%rax
  800bf7:	eb 2e                	jmp    800c27 <vprintfmt+0x4f7>
  800bf9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bfd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c01:	48 89 d6             	mov    %rdx,%rsi
  800c04:	bf 25 00 00 00       	mov    $0x25,%edi
  800c09:	ff d0                	callq  *%rax
  800c0b:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c10:	eb 05                	jmp    800c17 <vprintfmt+0x4e7>
  800c12:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800c17:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c1b:	48 83 e8 01          	sub    $0x1,%rax
  800c1f:	0f b6 00             	movzbl (%rax),%eax
  800c22:	3c 25                	cmp    $0x25,%al
  800c24:	75 ec                	jne    800c12 <vprintfmt+0x4e2>
  800c26:	90                   	nop
  800c27:	e9 3d fb ff ff       	jmpq   800769 <vprintfmt+0x39>
  800c2c:	90                   	nop
  800c2d:	48 83 c4 60          	add    $0x60,%rsp
  800c31:	5b                   	pop    %rbx
  800c32:	41 5c                	pop    %r12
  800c34:	5d                   	pop    %rbp
  800c35:	c3                   	retq   

0000000000800c36 <printfmt>:
  800c36:	55                   	push   %rbp
  800c37:	48 89 e5             	mov    %rsp,%rbp
  800c3a:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800c41:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800c48:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800c4f:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800c56:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800c5d:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800c64:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800c6b:	84 c0                	test   %al,%al
  800c6d:	74 20                	je     800c8f <printfmt+0x59>
  800c6f:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800c73:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800c77:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800c7b:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800c7f:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800c83:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800c87:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800c8b:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800c8f:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800c96:	00 00 00 
  800c99:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800ca0:	00 00 00 
  800ca3:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800ca7:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800cae:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800cb5:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800cbc:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800cc3:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800cca:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800cd1:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800cd8:	48 89 c7             	mov    %rax,%rdi
  800cdb:	48 b8 30 07 80 00 00 	movabs $0x800730,%rax
  800ce2:	00 00 00 
  800ce5:	ff d0                	callq  *%rax
  800ce7:	90                   	nop
  800ce8:	c9                   	leaveq 
  800ce9:	c3                   	retq   

0000000000800cea <sprintputch>:
  800cea:	55                   	push   %rbp
  800ceb:	48 89 e5             	mov    %rsp,%rbp
  800cee:	48 83 ec 10          	sub    $0x10,%rsp
  800cf2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800cf5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800cf9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800cfd:	8b 40 10             	mov    0x10(%rax),%eax
  800d00:	8d 50 01             	lea    0x1(%rax),%edx
  800d03:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d07:	89 50 10             	mov    %edx,0x10(%rax)
  800d0a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d0e:	48 8b 10             	mov    (%rax),%rdx
  800d11:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d15:	48 8b 40 08          	mov    0x8(%rax),%rax
  800d19:	48 39 c2             	cmp    %rax,%rdx
  800d1c:	73 17                	jae    800d35 <sprintputch+0x4b>
  800d1e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800d22:	48 8b 00             	mov    (%rax),%rax
  800d25:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800d29:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800d2d:	48 89 0a             	mov    %rcx,(%rdx)
  800d30:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800d33:	88 10                	mov    %dl,(%rax)
  800d35:	90                   	nop
  800d36:	c9                   	leaveq 
  800d37:	c3                   	retq   

0000000000800d38 <vsnprintf>:
  800d38:	55                   	push   %rbp
  800d39:	48 89 e5             	mov    %rsp,%rbp
  800d3c:	48 83 ec 50          	sub    $0x50,%rsp
  800d40:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800d44:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800d47:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800d4b:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800d4f:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800d53:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800d57:	48 8b 0a             	mov    (%rdx),%rcx
  800d5a:	48 89 08             	mov    %rcx,(%rax)
  800d5d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d61:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800d65:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800d69:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800d6d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d71:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800d75:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800d78:	48 98                	cltq   
  800d7a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800d7e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d82:	48 01 d0             	add    %rdx,%rax
  800d85:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800d89:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800d90:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800d95:	74 06                	je     800d9d <vsnprintf+0x65>
  800d97:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800d9b:	7f 07                	jg     800da4 <vsnprintf+0x6c>
  800d9d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800da2:	eb 2f                	jmp    800dd3 <vsnprintf+0x9b>
  800da4:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800da8:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800dac:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800db0:	48 89 c6             	mov    %rax,%rsi
  800db3:	48 bf ea 0c 80 00 00 	movabs $0x800cea,%rdi
  800dba:	00 00 00 
  800dbd:	48 b8 30 07 80 00 00 	movabs $0x800730,%rax
  800dc4:	00 00 00 
  800dc7:	ff d0                	callq  *%rax
  800dc9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800dcd:	c6 00 00             	movb   $0x0,(%rax)
  800dd0:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800dd3:	c9                   	leaveq 
  800dd4:	c3                   	retq   

0000000000800dd5 <snprintf>:
  800dd5:	55                   	push   %rbp
  800dd6:	48 89 e5             	mov    %rsp,%rbp
  800dd9:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800de0:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800de7:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800ded:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800df4:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800dfb:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800e02:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800e09:	84 c0                	test   %al,%al
  800e0b:	74 20                	je     800e2d <snprintf+0x58>
  800e0d:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800e11:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800e15:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800e19:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800e1d:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800e21:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800e25:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800e29:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800e2d:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800e34:	00 00 00 
  800e37:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800e3e:	00 00 00 
  800e41:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800e45:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800e4c:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e53:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e5a:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800e61:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800e68:	48 8b 0a             	mov    (%rdx),%rcx
  800e6b:	48 89 08             	mov    %rcx,(%rax)
  800e6e:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800e72:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800e76:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800e7a:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800e7e:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800e85:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800e8c:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800e92:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800e99:	48 89 c7             	mov    %rax,%rdi
  800e9c:	48 b8 38 0d 80 00 00 	movabs $0x800d38,%rax
  800ea3:	00 00 00 
  800ea6:	ff d0                	callq  *%rax
  800ea8:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800eae:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800eb4:	c9                   	leaveq 
  800eb5:	c3                   	retq   

0000000000800eb6 <strlen>:
  800eb6:	55                   	push   %rbp
  800eb7:	48 89 e5             	mov    %rsp,%rbp
  800eba:	48 83 ec 18          	sub    $0x18,%rsp
  800ebe:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ec2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800ec9:	eb 09                	jmp    800ed4 <strlen+0x1e>
  800ecb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800ecf:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800ed4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ed8:	0f b6 00             	movzbl (%rax),%eax
  800edb:	84 c0                	test   %al,%al
  800edd:	75 ec                	jne    800ecb <strlen+0x15>
  800edf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800ee2:	c9                   	leaveq 
  800ee3:	c3                   	retq   

0000000000800ee4 <strnlen>:
  800ee4:	55                   	push   %rbp
  800ee5:	48 89 e5             	mov    %rsp,%rbp
  800ee8:	48 83 ec 20          	sub    $0x20,%rsp
  800eec:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800ef0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800ef4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800efb:	eb 0e                	jmp    800f0b <strnlen+0x27>
  800efd:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800f01:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  800f06:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  800f0b:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  800f10:	74 0b                	je     800f1d <strnlen+0x39>
  800f12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f16:	0f b6 00             	movzbl (%rax),%eax
  800f19:	84 c0                	test   %al,%al
  800f1b:	75 e0                	jne    800efd <strnlen+0x19>
  800f1d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f20:	c9                   	leaveq 
  800f21:	c3                   	retq   

0000000000800f22 <strcpy>:
  800f22:	55                   	push   %rbp
  800f23:	48 89 e5             	mov    %rsp,%rbp
  800f26:	48 83 ec 20          	sub    $0x20,%rsp
  800f2a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f2e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f32:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f36:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800f3a:	90                   	nop
  800f3b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f3f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800f43:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800f47:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800f4b:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  800f4f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  800f53:	0f b6 12             	movzbl (%rdx),%edx
  800f56:	88 10                	mov    %dl,(%rax)
  800f58:	0f b6 00             	movzbl (%rax),%eax
  800f5b:	84 c0                	test   %al,%al
  800f5d:	75 dc                	jne    800f3b <strcpy+0x19>
  800f5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800f63:	c9                   	leaveq 
  800f64:	c3                   	retq   

0000000000800f65 <strcat>:
  800f65:	55                   	push   %rbp
  800f66:	48 89 e5             	mov    %rsp,%rbp
  800f69:	48 83 ec 20          	sub    $0x20,%rsp
  800f6d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800f71:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800f75:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f79:	48 89 c7             	mov    %rax,%rdi
  800f7c:	48 b8 b6 0e 80 00 00 	movabs $0x800eb6,%rax
  800f83:	00 00 00 
  800f86:	ff d0                	callq  *%rax
  800f88:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800f8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800f8e:	48 63 d0             	movslq %eax,%rdx
  800f91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f95:	48 01 c2             	add    %rax,%rdx
  800f98:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800f9c:	48 89 c6             	mov    %rax,%rsi
  800f9f:	48 89 d7             	mov    %rdx,%rdi
  800fa2:	48 b8 22 0f 80 00 00 	movabs $0x800f22,%rax
  800fa9:	00 00 00 
  800fac:	ff d0                	callq  *%rax
  800fae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fb2:	c9                   	leaveq 
  800fb3:	c3                   	retq   

0000000000800fb4 <strncpy>:
  800fb4:	55                   	push   %rbp
  800fb5:	48 89 e5             	mov    %rsp,%rbp
  800fb8:	48 83 ec 28          	sub    $0x28,%rsp
  800fbc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800fc0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800fc4:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800fc8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fcc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  800fd0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  800fd7:	00 
  800fd8:	eb 2a                	jmp    801004 <strncpy+0x50>
  800fda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800fde:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800fe2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800fe6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  800fea:	0f b6 12             	movzbl (%rdx),%edx
  800fed:	88 10                	mov    %dl,(%rax)
  800fef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  800ff3:	0f b6 00             	movzbl (%rax),%eax
  800ff6:	84 c0                	test   %al,%al
  800ff8:	74 05                	je     800fff <strncpy+0x4b>
  800ffa:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  800fff:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801004:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801008:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  80100c:	72 cc                	jb     800fda <strncpy+0x26>
  80100e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801012:	c9                   	leaveq 
  801013:	c3                   	retq   

0000000000801014 <strlcpy>:
  801014:	55                   	push   %rbp
  801015:	48 89 e5             	mov    %rsp,%rbp
  801018:	48 83 ec 28          	sub    $0x28,%rsp
  80101c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801020:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801024:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801028:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80102c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801030:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801035:	74 3d                	je     801074 <strlcpy+0x60>
  801037:	eb 1d                	jmp    801056 <strlcpy+0x42>
  801039:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80103d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801041:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801045:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801049:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  80104d:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  801051:	0f b6 12             	movzbl (%rdx),%edx
  801054:	88 10                	mov    %dl,(%rax)
  801056:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  80105b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  801060:	74 0b                	je     80106d <strlcpy+0x59>
  801062:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801066:	0f b6 00             	movzbl (%rax),%eax
  801069:	84 c0                	test   %al,%al
  80106b:	75 cc                	jne    801039 <strlcpy+0x25>
  80106d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801071:	c6 00 00             	movb   $0x0,(%rax)
  801074:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801078:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80107c:	48 29 c2             	sub    %rax,%rdx
  80107f:	48 89 d0             	mov    %rdx,%rax
  801082:	c9                   	leaveq 
  801083:	c3                   	retq   

0000000000801084 <strcmp>:
  801084:	55                   	push   %rbp
  801085:	48 89 e5             	mov    %rsp,%rbp
  801088:	48 83 ec 10          	sub    $0x10,%rsp
  80108c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801090:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801094:	eb 0a                	jmp    8010a0 <strcmp+0x1c>
  801096:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80109b:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8010a0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010a4:	0f b6 00             	movzbl (%rax),%eax
  8010a7:	84 c0                	test   %al,%al
  8010a9:	74 12                	je     8010bd <strcmp+0x39>
  8010ab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010af:	0f b6 10             	movzbl (%rax),%edx
  8010b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010b6:	0f b6 00             	movzbl (%rax),%eax
  8010b9:	38 c2                	cmp    %al,%dl
  8010bb:	74 d9                	je     801096 <strcmp+0x12>
  8010bd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010c1:	0f b6 00             	movzbl (%rax),%eax
  8010c4:	0f b6 d0             	movzbl %al,%edx
  8010c7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8010cb:	0f b6 00             	movzbl (%rax),%eax
  8010ce:	0f b6 c0             	movzbl %al,%eax
  8010d1:	29 c2                	sub    %eax,%edx
  8010d3:	89 d0                	mov    %edx,%eax
  8010d5:	c9                   	leaveq 
  8010d6:	c3                   	retq   

00000000008010d7 <strncmp>:
  8010d7:	55                   	push   %rbp
  8010d8:	48 89 e5             	mov    %rsp,%rbp
  8010db:	48 83 ec 18          	sub    $0x18,%rsp
  8010df:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8010e3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8010e7:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8010eb:	eb 0f                	jmp    8010fc <strncmp+0x25>
  8010ed:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8010f2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8010f7:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8010fc:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801101:	74 1d                	je     801120 <strncmp+0x49>
  801103:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801107:	0f b6 00             	movzbl (%rax),%eax
  80110a:	84 c0                	test   %al,%al
  80110c:	74 12                	je     801120 <strncmp+0x49>
  80110e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801112:	0f b6 10             	movzbl (%rax),%edx
  801115:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801119:	0f b6 00             	movzbl (%rax),%eax
  80111c:	38 c2                	cmp    %al,%dl
  80111e:	74 cd                	je     8010ed <strncmp+0x16>
  801120:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801125:	75 07                	jne    80112e <strncmp+0x57>
  801127:	b8 00 00 00 00       	mov    $0x0,%eax
  80112c:	eb 18                	jmp    801146 <strncmp+0x6f>
  80112e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801132:	0f b6 00             	movzbl (%rax),%eax
  801135:	0f b6 d0             	movzbl %al,%edx
  801138:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80113c:	0f b6 00             	movzbl (%rax),%eax
  80113f:	0f b6 c0             	movzbl %al,%eax
  801142:	29 c2                	sub    %eax,%edx
  801144:	89 d0                	mov    %edx,%eax
  801146:	c9                   	leaveq 
  801147:	c3                   	retq   

0000000000801148 <strchr>:
  801148:	55                   	push   %rbp
  801149:	48 89 e5             	mov    %rsp,%rbp
  80114c:	48 83 ec 10          	sub    $0x10,%rsp
  801150:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801154:	89 f0                	mov    %esi,%eax
  801156:	88 45 f4             	mov    %al,-0xc(%rbp)
  801159:	eb 17                	jmp    801172 <strchr+0x2a>
  80115b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80115f:	0f b6 00             	movzbl (%rax),%eax
  801162:	3a 45 f4             	cmp    -0xc(%rbp),%al
  801165:	75 06                	jne    80116d <strchr+0x25>
  801167:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80116b:	eb 15                	jmp    801182 <strchr+0x3a>
  80116d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801172:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801176:	0f b6 00             	movzbl (%rax),%eax
  801179:	84 c0                	test   %al,%al
  80117b:	75 de                	jne    80115b <strchr+0x13>
  80117d:	b8 00 00 00 00       	mov    $0x0,%eax
  801182:	c9                   	leaveq 
  801183:	c3                   	retq   

0000000000801184 <strfind>:
  801184:	55                   	push   %rbp
  801185:	48 89 e5             	mov    %rsp,%rbp
  801188:	48 83 ec 10          	sub    $0x10,%rsp
  80118c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801190:	89 f0                	mov    %esi,%eax
  801192:	88 45 f4             	mov    %al,-0xc(%rbp)
  801195:	eb 11                	jmp    8011a8 <strfind+0x24>
  801197:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80119b:	0f b6 00             	movzbl (%rax),%eax
  80119e:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8011a1:	74 12                	je     8011b5 <strfind+0x31>
  8011a3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ac:	0f b6 00             	movzbl (%rax),%eax
  8011af:	84 c0                	test   %al,%al
  8011b1:	75 e4                	jne    801197 <strfind+0x13>
  8011b3:	eb 01                	jmp    8011b6 <strfind+0x32>
  8011b5:	90                   	nop
  8011b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011ba:	c9                   	leaveq 
  8011bb:	c3                   	retq   

00000000008011bc <memset>:
  8011bc:	55                   	push   %rbp
  8011bd:	48 89 e5             	mov    %rsp,%rbp
  8011c0:	48 83 ec 18          	sub    $0x18,%rsp
  8011c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011c8:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8011cb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8011cf:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8011d4:	75 06                	jne    8011dc <memset+0x20>
  8011d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011da:	eb 69                	jmp    801245 <memset+0x89>
  8011dc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011e0:	83 e0 03             	and    $0x3,%eax
  8011e3:	48 85 c0             	test   %rax,%rax
  8011e6:	75 48                	jne    801230 <memset+0x74>
  8011e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011ec:	83 e0 03             	and    $0x3,%eax
  8011ef:	48 85 c0             	test   %rax,%rax
  8011f2:	75 3c                	jne    801230 <memset+0x74>
  8011f4:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8011fb:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8011fe:	c1 e0 18             	shl    $0x18,%eax
  801201:	89 c2                	mov    %eax,%edx
  801203:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801206:	c1 e0 10             	shl    $0x10,%eax
  801209:	09 c2                	or     %eax,%edx
  80120b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80120e:	c1 e0 08             	shl    $0x8,%eax
  801211:	09 d0                	or     %edx,%eax
  801213:	09 45 f4             	or     %eax,-0xc(%rbp)
  801216:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80121a:	48 c1 e8 02          	shr    $0x2,%rax
  80121e:	48 89 c1             	mov    %rax,%rcx
  801221:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801225:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801228:	48 89 d7             	mov    %rdx,%rdi
  80122b:	fc                   	cld    
  80122c:	f3 ab                	rep stos %eax,%es:(%rdi)
  80122e:	eb 11                	jmp    801241 <memset+0x85>
  801230:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801234:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801237:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80123b:	48 89 d7             	mov    %rdx,%rdi
  80123e:	fc                   	cld    
  80123f:	f3 aa                	rep stos %al,%es:(%rdi)
  801241:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801245:	c9                   	leaveq 
  801246:	c3                   	retq   

0000000000801247 <memmove>:
  801247:	55                   	push   %rbp
  801248:	48 89 e5             	mov    %rsp,%rbp
  80124b:	48 83 ec 28          	sub    $0x28,%rsp
  80124f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801253:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801257:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80125b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80125f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801263:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801267:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80126b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80126f:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801273:	0f 83 88 00 00 00    	jae    801301 <memmove+0xba>
  801279:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80127d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801281:	48 01 d0             	add    %rdx,%rax
  801284:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801288:	76 77                	jbe    801301 <memmove+0xba>
  80128a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80128e:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  801292:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801296:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  80129a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80129e:	83 e0 03             	and    $0x3,%eax
  8012a1:	48 85 c0             	test   %rax,%rax
  8012a4:	75 3b                	jne    8012e1 <memmove+0x9a>
  8012a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012aa:	83 e0 03             	and    $0x3,%eax
  8012ad:	48 85 c0             	test   %rax,%rax
  8012b0:	75 2f                	jne    8012e1 <memmove+0x9a>
  8012b2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012b6:	83 e0 03             	and    $0x3,%eax
  8012b9:	48 85 c0             	test   %rax,%rax
  8012bc:	75 23                	jne    8012e1 <memmove+0x9a>
  8012be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012c2:	48 83 e8 04          	sub    $0x4,%rax
  8012c6:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8012ca:	48 83 ea 04          	sub    $0x4,%rdx
  8012ce:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8012d2:	48 c1 e9 02          	shr    $0x2,%rcx
  8012d6:	48 89 c7             	mov    %rax,%rdi
  8012d9:	48 89 d6             	mov    %rdx,%rsi
  8012dc:	fd                   	std    
  8012dd:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8012df:	eb 1d                	jmp    8012fe <memmove+0xb7>
  8012e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012e5:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8012e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ed:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8012f1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8012f5:	48 89 d7             	mov    %rdx,%rdi
  8012f8:	48 89 c1             	mov    %rax,%rcx
  8012fb:	fd                   	std    
  8012fc:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8012fe:	fc                   	cld    
  8012ff:	eb 57                	jmp    801358 <memmove+0x111>
  801301:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801305:	83 e0 03             	and    $0x3,%eax
  801308:	48 85 c0             	test   %rax,%rax
  80130b:	75 36                	jne    801343 <memmove+0xfc>
  80130d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801311:	83 e0 03             	and    $0x3,%eax
  801314:	48 85 c0             	test   %rax,%rax
  801317:	75 2a                	jne    801343 <memmove+0xfc>
  801319:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80131d:	83 e0 03             	and    $0x3,%eax
  801320:	48 85 c0             	test   %rax,%rax
  801323:	75 1e                	jne    801343 <memmove+0xfc>
  801325:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801329:	48 c1 e8 02          	shr    $0x2,%rax
  80132d:	48 89 c1             	mov    %rax,%rcx
  801330:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801334:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801338:	48 89 c7             	mov    %rax,%rdi
  80133b:	48 89 d6             	mov    %rdx,%rsi
  80133e:	fc                   	cld    
  80133f:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801341:	eb 15                	jmp    801358 <memmove+0x111>
  801343:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801347:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80134b:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80134f:	48 89 c7             	mov    %rax,%rdi
  801352:	48 89 d6             	mov    %rdx,%rsi
  801355:	fc                   	cld    
  801356:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801358:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80135c:	c9                   	leaveq 
  80135d:	c3                   	retq   

000000000080135e <memcpy>:
  80135e:	55                   	push   %rbp
  80135f:	48 89 e5             	mov    %rsp,%rbp
  801362:	48 83 ec 18          	sub    $0x18,%rsp
  801366:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80136a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80136e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801372:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801376:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80137a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80137e:	48 89 ce             	mov    %rcx,%rsi
  801381:	48 89 c7             	mov    %rax,%rdi
  801384:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  80138b:	00 00 00 
  80138e:	ff d0                	callq  *%rax
  801390:	c9                   	leaveq 
  801391:	c3                   	retq   

0000000000801392 <memcmp>:
  801392:	55                   	push   %rbp
  801393:	48 89 e5             	mov    %rsp,%rbp
  801396:	48 83 ec 28          	sub    $0x28,%rsp
  80139a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80139e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013a2:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013aa:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013ae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013b2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8013b6:	eb 36                	jmp    8013ee <memcmp+0x5c>
  8013b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013bc:	0f b6 10             	movzbl (%rax),%edx
  8013bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013c3:	0f b6 00             	movzbl (%rax),%eax
  8013c6:	38 c2                	cmp    %al,%dl
  8013c8:	74 1a                	je     8013e4 <memcmp+0x52>
  8013ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013ce:	0f b6 00             	movzbl (%rax),%eax
  8013d1:	0f b6 d0             	movzbl %al,%edx
  8013d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8013d8:	0f b6 00             	movzbl (%rax),%eax
  8013db:	0f b6 c0             	movzbl %al,%eax
  8013de:	29 c2                	sub    %eax,%edx
  8013e0:	89 d0                	mov    %edx,%eax
  8013e2:	eb 20                	jmp    801404 <memcmp+0x72>
  8013e4:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8013e9:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8013ee:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013f2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8013f6:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013fa:	48 85 c0             	test   %rax,%rax
  8013fd:	75 b9                	jne    8013b8 <memcmp+0x26>
  8013ff:	b8 00 00 00 00       	mov    $0x0,%eax
  801404:	c9                   	leaveq 
  801405:	c3                   	retq   

0000000000801406 <memfind>:
  801406:	55                   	push   %rbp
  801407:	48 89 e5             	mov    %rsp,%rbp
  80140a:	48 83 ec 28          	sub    $0x28,%rsp
  80140e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801412:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801415:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801419:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80141d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801421:	48 01 d0             	add    %rdx,%rax
  801424:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801428:	eb 13                	jmp    80143d <memfind+0x37>
  80142a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80142e:	0f b6 00             	movzbl (%rax),%eax
  801431:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801434:	38 d0                	cmp    %dl,%al
  801436:	74 11                	je     801449 <memfind+0x43>
  801438:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80143d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801441:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801445:	72 e3                	jb     80142a <memfind+0x24>
  801447:	eb 01                	jmp    80144a <memfind+0x44>
  801449:	90                   	nop
  80144a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80144e:	c9                   	leaveq 
  80144f:	c3                   	retq   

0000000000801450 <strtol>:
  801450:	55                   	push   %rbp
  801451:	48 89 e5             	mov    %rsp,%rbp
  801454:	48 83 ec 38          	sub    $0x38,%rsp
  801458:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80145c:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801460:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801463:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80146a:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801471:	00 
  801472:	eb 05                	jmp    801479 <strtol+0x29>
  801474:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801479:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80147d:	0f b6 00             	movzbl (%rax),%eax
  801480:	3c 20                	cmp    $0x20,%al
  801482:	74 f0                	je     801474 <strtol+0x24>
  801484:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801488:	0f b6 00             	movzbl (%rax),%eax
  80148b:	3c 09                	cmp    $0x9,%al
  80148d:	74 e5                	je     801474 <strtol+0x24>
  80148f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801493:	0f b6 00             	movzbl (%rax),%eax
  801496:	3c 2b                	cmp    $0x2b,%al
  801498:	75 07                	jne    8014a1 <strtol+0x51>
  80149a:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80149f:	eb 17                	jmp    8014b8 <strtol+0x68>
  8014a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014a5:	0f b6 00             	movzbl (%rax),%eax
  8014a8:	3c 2d                	cmp    $0x2d,%al
  8014aa:	75 0c                	jne    8014b8 <strtol+0x68>
  8014ac:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8014b1:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8014b8:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8014bc:	74 06                	je     8014c4 <strtol+0x74>
  8014be:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  8014c2:	75 28                	jne    8014ec <strtol+0x9c>
  8014c4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014c8:	0f b6 00             	movzbl (%rax),%eax
  8014cb:	3c 30                	cmp    $0x30,%al
  8014cd:	75 1d                	jne    8014ec <strtol+0x9c>
  8014cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014d3:	48 83 c0 01          	add    $0x1,%rax
  8014d7:	0f b6 00             	movzbl (%rax),%eax
  8014da:	3c 78                	cmp    $0x78,%al
  8014dc:	75 0e                	jne    8014ec <strtol+0x9c>
  8014de:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  8014e3:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  8014ea:	eb 2c                	jmp    801518 <strtol+0xc8>
  8014ec:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  8014f0:	75 19                	jne    80150b <strtol+0xbb>
  8014f2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8014f6:	0f b6 00             	movzbl (%rax),%eax
  8014f9:	3c 30                	cmp    $0x30,%al
  8014fb:	75 0e                	jne    80150b <strtol+0xbb>
  8014fd:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801502:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801509:	eb 0d                	jmp    801518 <strtol+0xc8>
  80150b:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80150f:	75 07                	jne    801518 <strtol+0xc8>
  801511:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801518:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80151c:	0f b6 00             	movzbl (%rax),%eax
  80151f:	3c 2f                	cmp    $0x2f,%al
  801521:	7e 1d                	jle    801540 <strtol+0xf0>
  801523:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801527:	0f b6 00             	movzbl (%rax),%eax
  80152a:	3c 39                	cmp    $0x39,%al
  80152c:	7f 12                	jg     801540 <strtol+0xf0>
  80152e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801532:	0f b6 00             	movzbl (%rax),%eax
  801535:	0f be c0             	movsbl %al,%eax
  801538:	83 e8 30             	sub    $0x30,%eax
  80153b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80153e:	eb 4e                	jmp    80158e <strtol+0x13e>
  801540:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801544:	0f b6 00             	movzbl (%rax),%eax
  801547:	3c 60                	cmp    $0x60,%al
  801549:	7e 1d                	jle    801568 <strtol+0x118>
  80154b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80154f:	0f b6 00             	movzbl (%rax),%eax
  801552:	3c 7a                	cmp    $0x7a,%al
  801554:	7f 12                	jg     801568 <strtol+0x118>
  801556:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80155a:	0f b6 00             	movzbl (%rax),%eax
  80155d:	0f be c0             	movsbl %al,%eax
  801560:	83 e8 57             	sub    $0x57,%eax
  801563:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801566:	eb 26                	jmp    80158e <strtol+0x13e>
  801568:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80156c:	0f b6 00             	movzbl (%rax),%eax
  80156f:	3c 40                	cmp    $0x40,%al
  801571:	7e 47                	jle    8015ba <strtol+0x16a>
  801573:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801577:	0f b6 00             	movzbl (%rax),%eax
  80157a:	3c 5a                	cmp    $0x5a,%al
  80157c:	7f 3c                	jg     8015ba <strtol+0x16a>
  80157e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801582:	0f b6 00             	movzbl (%rax),%eax
  801585:	0f be c0             	movsbl %al,%eax
  801588:	83 e8 37             	sub    $0x37,%eax
  80158b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80158e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801591:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801594:	7d 23                	jge    8015b9 <strtol+0x169>
  801596:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80159b:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80159e:	48 98                	cltq   
  8015a0:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8015a5:	48 89 c2             	mov    %rax,%rdx
  8015a8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8015ab:	48 98                	cltq   
  8015ad:	48 01 d0             	add    %rdx,%rax
  8015b0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015b4:	e9 5f ff ff ff       	jmpq   801518 <strtol+0xc8>
  8015b9:	90                   	nop
  8015ba:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  8015bf:	74 0b                	je     8015cc <strtol+0x17c>
  8015c1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8015c5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8015c9:	48 89 10             	mov    %rdx,(%rax)
  8015cc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8015d0:	74 09                	je     8015db <strtol+0x18b>
  8015d2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015d6:	48 f7 d8             	neg    %rax
  8015d9:	eb 04                	jmp    8015df <strtol+0x18f>
  8015db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015df:	c9                   	leaveq 
  8015e0:	c3                   	retq   

00000000008015e1 <strstr>:
  8015e1:	55                   	push   %rbp
  8015e2:	48 89 e5             	mov    %rsp,%rbp
  8015e5:	48 83 ec 30          	sub    $0x30,%rsp
  8015e9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8015ed:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8015f1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8015f5:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8015f9:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8015fd:	0f b6 00             	movzbl (%rax),%eax
  801600:	88 45 ff             	mov    %al,-0x1(%rbp)
  801603:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801607:	75 06                	jne    80160f <strstr+0x2e>
  801609:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80160d:	eb 6b                	jmp    80167a <strstr+0x99>
  80160f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801613:	48 89 c7             	mov    %rax,%rdi
  801616:	48 b8 b6 0e 80 00 00 	movabs $0x800eb6,%rax
  80161d:	00 00 00 
  801620:	ff d0                	callq  *%rax
  801622:	48 98                	cltq   
  801624:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801628:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80162c:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801630:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801634:	0f b6 00             	movzbl (%rax),%eax
  801637:	88 45 ef             	mov    %al,-0x11(%rbp)
  80163a:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  80163e:	75 07                	jne    801647 <strstr+0x66>
  801640:	b8 00 00 00 00       	mov    $0x0,%eax
  801645:	eb 33                	jmp    80167a <strstr+0x99>
  801647:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  80164b:	3a 45 ff             	cmp    -0x1(%rbp),%al
  80164e:	75 d8                	jne    801628 <strstr+0x47>
  801650:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801654:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801658:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80165c:	48 89 ce             	mov    %rcx,%rsi
  80165f:	48 89 c7             	mov    %rax,%rdi
  801662:	48 b8 d7 10 80 00 00 	movabs $0x8010d7,%rax
  801669:	00 00 00 
  80166c:	ff d0                	callq  *%rax
  80166e:	85 c0                	test   %eax,%eax
  801670:	75 b6                	jne    801628 <strstr+0x47>
  801672:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801676:	48 83 e8 01          	sub    $0x1,%rax
  80167a:	c9                   	leaveq 
  80167b:	c3                   	retq   

000000000080167c <syscall>:
  80167c:	55                   	push   %rbp
  80167d:	48 89 e5             	mov    %rsp,%rbp
  801680:	53                   	push   %rbx
  801681:	48 83 ec 48          	sub    $0x48,%rsp
  801685:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801688:	89 75 d8             	mov    %esi,-0x28(%rbp)
  80168b:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  80168f:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801693:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801697:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  80169b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80169e:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8016a2:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8016a6:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  8016aa:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  8016ae:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  8016b2:	4c 89 c3             	mov    %r8,%rbx
  8016b5:	cd 30                	int    $0x30
  8016b7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8016bb:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  8016bf:	74 3e                	je     8016ff <syscall+0x83>
  8016c1:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8016c6:	7e 37                	jle    8016ff <syscall+0x83>
  8016c8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8016cc:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8016cf:	49 89 d0             	mov    %rdx,%r8
  8016d2:	89 c1                	mov    %eax,%ecx
  8016d4:	48 ba e8 4b 80 00 00 	movabs $0x804be8,%rdx
  8016db:	00 00 00 
  8016de:	be 24 00 00 00       	mov    $0x24,%esi
  8016e3:	48 bf 05 4c 80 00 00 	movabs $0x804c05,%rdi
  8016ea:	00 00 00 
  8016ed:	b8 00 00 00 00       	mov    $0x0,%eax
  8016f2:	49 b9 e1 42 80 00 00 	movabs $0x8042e1,%r9
  8016f9:	00 00 00 
  8016fc:	41 ff d1             	callq  *%r9
  8016ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801703:	48 83 c4 48          	add    $0x48,%rsp
  801707:	5b                   	pop    %rbx
  801708:	5d                   	pop    %rbp
  801709:	c3                   	retq   

000000000080170a <sys_cputs>:
  80170a:	55                   	push   %rbp
  80170b:	48 89 e5             	mov    %rsp,%rbp
  80170e:	48 83 ec 10          	sub    $0x10,%rsp
  801712:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801716:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80171a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80171e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801722:	48 83 ec 08          	sub    $0x8,%rsp
  801726:	6a 00                	pushq  $0x0
  801728:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80172e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801734:	48 89 d1             	mov    %rdx,%rcx
  801737:	48 89 c2             	mov    %rax,%rdx
  80173a:	be 00 00 00 00       	mov    $0x0,%esi
  80173f:	bf 00 00 00 00       	mov    $0x0,%edi
  801744:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  80174b:	00 00 00 
  80174e:	ff d0                	callq  *%rax
  801750:	48 83 c4 10          	add    $0x10,%rsp
  801754:	90                   	nop
  801755:	c9                   	leaveq 
  801756:	c3                   	retq   

0000000000801757 <sys_cgetc>:
  801757:	55                   	push   %rbp
  801758:	48 89 e5             	mov    %rsp,%rbp
  80175b:	48 83 ec 08          	sub    $0x8,%rsp
  80175f:	6a 00                	pushq  $0x0
  801761:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801767:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80176d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801772:	ba 00 00 00 00       	mov    $0x0,%edx
  801777:	be 00 00 00 00       	mov    $0x0,%esi
  80177c:	bf 01 00 00 00       	mov    $0x1,%edi
  801781:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801788:	00 00 00 
  80178b:	ff d0                	callq  *%rax
  80178d:	48 83 c4 10          	add    $0x10,%rsp
  801791:	c9                   	leaveq 
  801792:	c3                   	retq   

0000000000801793 <sys_env_destroy>:
  801793:	55                   	push   %rbp
  801794:	48 89 e5             	mov    %rsp,%rbp
  801797:	48 83 ec 10          	sub    $0x10,%rsp
  80179b:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80179e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8017a1:	48 98                	cltq   
  8017a3:	48 83 ec 08          	sub    $0x8,%rsp
  8017a7:	6a 00                	pushq  $0x0
  8017a9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017af:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017b5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017ba:	48 89 c2             	mov    %rax,%rdx
  8017bd:	be 01 00 00 00       	mov    $0x1,%esi
  8017c2:	bf 03 00 00 00       	mov    $0x3,%edi
  8017c7:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  8017ce:	00 00 00 
  8017d1:	ff d0                	callq  *%rax
  8017d3:	48 83 c4 10          	add    $0x10,%rsp
  8017d7:	c9                   	leaveq 
  8017d8:	c3                   	retq   

00000000008017d9 <sys_getenvid>:
  8017d9:	55                   	push   %rbp
  8017da:	48 89 e5             	mov    %rsp,%rbp
  8017dd:	48 83 ec 08          	sub    $0x8,%rsp
  8017e1:	6a 00                	pushq  $0x0
  8017e3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8017e9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8017ef:	b9 00 00 00 00       	mov    $0x0,%ecx
  8017f4:	ba 00 00 00 00       	mov    $0x0,%edx
  8017f9:	be 00 00 00 00       	mov    $0x0,%esi
  8017fe:	bf 02 00 00 00       	mov    $0x2,%edi
  801803:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  80180a:	00 00 00 
  80180d:	ff d0                	callq  *%rax
  80180f:	48 83 c4 10          	add    $0x10,%rsp
  801813:	c9                   	leaveq 
  801814:	c3                   	retq   

0000000000801815 <sys_yield>:
  801815:	55                   	push   %rbp
  801816:	48 89 e5             	mov    %rsp,%rbp
  801819:	48 83 ec 08          	sub    $0x8,%rsp
  80181d:	6a 00                	pushq  $0x0
  80181f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801825:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80182b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801830:	ba 00 00 00 00       	mov    $0x0,%edx
  801835:	be 00 00 00 00       	mov    $0x0,%esi
  80183a:	bf 0b 00 00 00       	mov    $0xb,%edi
  80183f:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801846:	00 00 00 
  801849:	ff d0                	callq  *%rax
  80184b:	48 83 c4 10          	add    $0x10,%rsp
  80184f:	90                   	nop
  801850:	c9                   	leaveq 
  801851:	c3                   	retq   

0000000000801852 <sys_page_alloc>:
  801852:	55                   	push   %rbp
  801853:	48 89 e5             	mov    %rsp,%rbp
  801856:	48 83 ec 10          	sub    $0x10,%rsp
  80185a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80185d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801861:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801864:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801867:	48 63 c8             	movslq %eax,%rcx
  80186a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80186e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801871:	48 98                	cltq   
  801873:	48 83 ec 08          	sub    $0x8,%rsp
  801877:	6a 00                	pushq  $0x0
  801879:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80187f:	49 89 c8             	mov    %rcx,%r8
  801882:	48 89 d1             	mov    %rdx,%rcx
  801885:	48 89 c2             	mov    %rax,%rdx
  801888:	be 01 00 00 00       	mov    $0x1,%esi
  80188d:	bf 04 00 00 00       	mov    $0x4,%edi
  801892:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801899:	00 00 00 
  80189c:	ff d0                	callq  *%rax
  80189e:	48 83 c4 10          	add    $0x10,%rsp
  8018a2:	c9                   	leaveq 
  8018a3:	c3                   	retq   

00000000008018a4 <sys_page_map>:
  8018a4:	55                   	push   %rbp
  8018a5:	48 89 e5             	mov    %rsp,%rbp
  8018a8:	48 83 ec 20          	sub    $0x20,%rsp
  8018ac:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018af:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8018b3:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8018b6:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8018ba:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8018be:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8018c1:	48 63 c8             	movslq %eax,%rcx
  8018c4:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8018c8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8018cb:	48 63 f0             	movslq %eax,%rsi
  8018ce:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8018d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018d5:	48 98                	cltq   
  8018d7:	48 83 ec 08          	sub    $0x8,%rsp
  8018db:	51                   	push   %rcx
  8018dc:	49 89 f9             	mov    %rdi,%r9
  8018df:	49 89 f0             	mov    %rsi,%r8
  8018e2:	48 89 d1             	mov    %rdx,%rcx
  8018e5:	48 89 c2             	mov    %rax,%rdx
  8018e8:	be 01 00 00 00       	mov    $0x1,%esi
  8018ed:	bf 05 00 00 00       	mov    $0x5,%edi
  8018f2:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  8018f9:	00 00 00 
  8018fc:	ff d0                	callq  *%rax
  8018fe:	48 83 c4 10          	add    $0x10,%rsp
  801902:	c9                   	leaveq 
  801903:	c3                   	retq   

0000000000801904 <sys_page_unmap>:
  801904:	55                   	push   %rbp
  801905:	48 89 e5             	mov    %rsp,%rbp
  801908:	48 83 ec 10          	sub    $0x10,%rsp
  80190c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80190f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801913:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801917:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80191a:	48 98                	cltq   
  80191c:	48 83 ec 08          	sub    $0x8,%rsp
  801920:	6a 00                	pushq  $0x0
  801922:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801928:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80192e:	48 89 d1             	mov    %rdx,%rcx
  801931:	48 89 c2             	mov    %rax,%rdx
  801934:	be 01 00 00 00       	mov    $0x1,%esi
  801939:	bf 06 00 00 00       	mov    $0x6,%edi
  80193e:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801945:	00 00 00 
  801948:	ff d0                	callq  *%rax
  80194a:	48 83 c4 10          	add    $0x10,%rsp
  80194e:	c9                   	leaveq 
  80194f:	c3                   	retq   

0000000000801950 <sys_env_set_status>:
  801950:	55                   	push   %rbp
  801951:	48 89 e5             	mov    %rsp,%rbp
  801954:	48 83 ec 10          	sub    $0x10,%rsp
  801958:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80195b:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80195e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801961:	48 63 d0             	movslq %eax,%rdx
  801964:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801967:	48 98                	cltq   
  801969:	48 83 ec 08          	sub    $0x8,%rsp
  80196d:	6a 00                	pushq  $0x0
  80196f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801975:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80197b:	48 89 d1             	mov    %rdx,%rcx
  80197e:	48 89 c2             	mov    %rax,%rdx
  801981:	be 01 00 00 00       	mov    $0x1,%esi
  801986:	bf 08 00 00 00       	mov    $0x8,%edi
  80198b:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801992:	00 00 00 
  801995:	ff d0                	callq  *%rax
  801997:	48 83 c4 10          	add    $0x10,%rsp
  80199b:	c9                   	leaveq 
  80199c:	c3                   	retq   

000000000080199d <sys_env_set_trapframe>:
  80199d:	55                   	push   %rbp
  80199e:	48 89 e5             	mov    %rsp,%rbp
  8019a1:	48 83 ec 10          	sub    $0x10,%rsp
  8019a5:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019a8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019ac:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019b3:	48 98                	cltq   
  8019b5:	48 83 ec 08          	sub    $0x8,%rsp
  8019b9:	6a 00                	pushq  $0x0
  8019bb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019c1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8019c7:	48 89 d1             	mov    %rdx,%rcx
  8019ca:	48 89 c2             	mov    %rax,%rdx
  8019cd:	be 01 00 00 00       	mov    $0x1,%esi
  8019d2:	bf 09 00 00 00       	mov    $0x9,%edi
  8019d7:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  8019de:	00 00 00 
  8019e1:	ff d0                	callq  *%rax
  8019e3:	48 83 c4 10          	add    $0x10,%rsp
  8019e7:	c9                   	leaveq 
  8019e8:	c3                   	retq   

00000000008019e9 <sys_env_set_pgfault_upcall>:
  8019e9:	55                   	push   %rbp
  8019ea:	48 89 e5             	mov    %rsp,%rbp
  8019ed:	48 83 ec 10          	sub    $0x10,%rsp
  8019f1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019f4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019f8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019ff:	48 98                	cltq   
  801a01:	48 83 ec 08          	sub    $0x8,%rsp
  801a05:	6a 00                	pushq  $0x0
  801a07:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a0d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a13:	48 89 d1             	mov    %rdx,%rcx
  801a16:	48 89 c2             	mov    %rax,%rdx
  801a19:	be 01 00 00 00       	mov    $0x1,%esi
  801a1e:	bf 0a 00 00 00       	mov    $0xa,%edi
  801a23:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801a2a:	00 00 00 
  801a2d:	ff d0                	callq  *%rax
  801a2f:	48 83 c4 10          	add    $0x10,%rsp
  801a33:	c9                   	leaveq 
  801a34:	c3                   	retq   

0000000000801a35 <sys_ipc_try_send>:
  801a35:	55                   	push   %rbp
  801a36:	48 89 e5             	mov    %rsp,%rbp
  801a39:	48 83 ec 20          	sub    $0x20,%rsp
  801a3d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a40:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a44:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801a48:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801a4b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a4e:	48 63 f0             	movslq %eax,%rsi
  801a51:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801a55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a58:	48 98                	cltq   
  801a5a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a5e:	48 83 ec 08          	sub    $0x8,%rsp
  801a62:	6a 00                	pushq  $0x0
  801a64:	49 89 f1             	mov    %rsi,%r9
  801a67:	49 89 c8             	mov    %rcx,%r8
  801a6a:	48 89 d1             	mov    %rdx,%rcx
  801a6d:	48 89 c2             	mov    %rax,%rdx
  801a70:	be 00 00 00 00       	mov    $0x0,%esi
  801a75:	bf 0c 00 00 00       	mov    $0xc,%edi
  801a7a:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801a81:	00 00 00 
  801a84:	ff d0                	callq  *%rax
  801a86:	48 83 c4 10          	add    $0x10,%rsp
  801a8a:	c9                   	leaveq 
  801a8b:	c3                   	retq   

0000000000801a8c <sys_ipc_recv>:
  801a8c:	55                   	push   %rbp
  801a8d:	48 89 e5             	mov    %rsp,%rbp
  801a90:	48 83 ec 10          	sub    $0x10,%rsp
  801a94:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801a98:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801a9c:	48 83 ec 08          	sub    $0x8,%rsp
  801aa0:	6a 00                	pushq  $0x0
  801aa2:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801aa8:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801aae:	b9 00 00 00 00       	mov    $0x0,%ecx
  801ab3:	48 89 c2             	mov    %rax,%rdx
  801ab6:	be 01 00 00 00       	mov    $0x1,%esi
  801abb:	bf 0d 00 00 00       	mov    $0xd,%edi
  801ac0:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801ac7:	00 00 00 
  801aca:	ff d0                	callq  *%rax
  801acc:	48 83 c4 10          	add    $0x10,%rsp
  801ad0:	c9                   	leaveq 
  801ad1:	c3                   	retq   

0000000000801ad2 <sys_time_msec>:
  801ad2:	55                   	push   %rbp
  801ad3:	48 89 e5             	mov    %rsp,%rbp
  801ad6:	48 83 ec 08          	sub    $0x8,%rsp
  801ada:	6a 00                	pushq  $0x0
  801adc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ae2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ae8:	b9 00 00 00 00       	mov    $0x0,%ecx
  801aed:	ba 00 00 00 00       	mov    $0x0,%edx
  801af2:	be 00 00 00 00       	mov    $0x0,%esi
  801af7:	bf 0e 00 00 00       	mov    $0xe,%edi
  801afc:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801b03:	00 00 00 
  801b06:	ff d0                	callq  *%rax
  801b08:	48 83 c4 10          	add    $0x10,%rsp
  801b0c:	c9                   	leaveq 
  801b0d:	c3                   	retq   

0000000000801b0e <sys_net_transmit>:
  801b0e:	55                   	push   %rbp
  801b0f:	48 89 e5             	mov    %rsp,%rbp
  801b12:	48 83 ec 10          	sub    $0x10,%rsp
  801b16:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b1a:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b1d:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801b20:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b24:	48 83 ec 08          	sub    $0x8,%rsp
  801b28:	6a 00                	pushq  $0x0
  801b2a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b30:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b36:	48 89 d1             	mov    %rdx,%rcx
  801b39:	48 89 c2             	mov    %rax,%rdx
  801b3c:	be 00 00 00 00       	mov    $0x0,%esi
  801b41:	bf 0f 00 00 00       	mov    $0xf,%edi
  801b46:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801b4d:	00 00 00 
  801b50:	ff d0                	callq  *%rax
  801b52:	48 83 c4 10          	add    $0x10,%rsp
  801b56:	c9                   	leaveq 
  801b57:	c3                   	retq   

0000000000801b58 <sys_net_receive>:
  801b58:	55                   	push   %rbp
  801b59:	48 89 e5             	mov    %rsp,%rbp
  801b5c:	48 83 ec 10          	sub    $0x10,%rsp
  801b60:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b64:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801b67:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801b6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b6e:	48 83 ec 08          	sub    $0x8,%rsp
  801b72:	6a 00                	pushq  $0x0
  801b74:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b7a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b80:	48 89 d1             	mov    %rdx,%rcx
  801b83:	48 89 c2             	mov    %rax,%rdx
  801b86:	be 00 00 00 00       	mov    $0x0,%esi
  801b8b:	bf 10 00 00 00       	mov    $0x10,%edi
  801b90:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801b97:	00 00 00 
  801b9a:	ff d0                	callq  *%rax
  801b9c:	48 83 c4 10          	add    $0x10,%rsp
  801ba0:	c9                   	leaveq 
  801ba1:	c3                   	retq   

0000000000801ba2 <sys_ept_map>:
  801ba2:	55                   	push   %rbp
  801ba3:	48 89 e5             	mov    %rsp,%rbp
  801ba6:	48 83 ec 20          	sub    $0x20,%rsp
  801baa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801bad:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801bb1:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801bb4:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801bb8:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801bbc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801bbf:	48 63 c8             	movslq %eax,%rcx
  801bc2:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801bc6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801bc9:	48 63 f0             	movslq %eax,%rsi
  801bcc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bd3:	48 98                	cltq   
  801bd5:	48 83 ec 08          	sub    $0x8,%rsp
  801bd9:	51                   	push   %rcx
  801bda:	49 89 f9             	mov    %rdi,%r9
  801bdd:	49 89 f0             	mov    %rsi,%r8
  801be0:	48 89 d1             	mov    %rdx,%rcx
  801be3:	48 89 c2             	mov    %rax,%rdx
  801be6:	be 00 00 00 00       	mov    $0x0,%esi
  801beb:	bf 11 00 00 00       	mov    $0x11,%edi
  801bf0:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801bf7:	00 00 00 
  801bfa:	ff d0                	callq  *%rax
  801bfc:	48 83 c4 10          	add    $0x10,%rsp
  801c00:	c9                   	leaveq 
  801c01:	c3                   	retq   

0000000000801c02 <sys_env_mkguest>:
  801c02:	55                   	push   %rbp
  801c03:	48 89 e5             	mov    %rsp,%rbp
  801c06:	48 83 ec 10          	sub    $0x10,%rsp
  801c0a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c0e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c12:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c16:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c1a:	48 83 ec 08          	sub    $0x8,%rsp
  801c1e:	6a 00                	pushq  $0x0
  801c20:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c26:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c2c:	48 89 d1             	mov    %rdx,%rcx
  801c2f:	48 89 c2             	mov    %rax,%rdx
  801c32:	be 00 00 00 00       	mov    $0x0,%esi
  801c37:	bf 12 00 00 00       	mov    $0x12,%edi
  801c3c:	48 b8 7c 16 80 00 00 	movabs $0x80167c,%rax
  801c43:	00 00 00 
  801c46:	ff d0                	callq  *%rax
  801c48:	48 83 c4 10          	add    $0x10,%rsp
  801c4c:	c9                   	leaveq 
  801c4d:	c3                   	retq   

0000000000801c4e <argstart>:
  801c4e:	55                   	push   %rbp
  801c4f:	48 89 e5             	mov    %rsp,%rbp
  801c52:	48 83 ec 18          	sub    $0x18,%rsp
  801c56:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c5a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801c5e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801c62:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c66:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801c6a:	48 89 10             	mov    %rdx,(%rax)
  801c6d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801c71:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c75:	48 89 50 08          	mov    %rdx,0x8(%rax)
  801c79:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c7d:	8b 00                	mov    (%rax),%eax
  801c7f:	83 f8 01             	cmp    $0x1,%eax
  801c82:	7e 13                	jle    801c97 <argstart+0x49>
  801c84:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  801c89:	74 0c                	je     801c97 <argstart+0x49>
  801c8b:	48 b8 16 4c 80 00 00 	movabs $0x804c16,%rax
  801c92:	00 00 00 
  801c95:	eb 05                	jmp    801c9c <argstart+0x4e>
  801c97:	b8 00 00 00 00       	mov    $0x0,%eax
  801c9c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801ca0:	48 89 42 10          	mov    %rax,0x10(%rdx)
  801ca4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ca8:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  801caf:	00 
  801cb0:	90                   	nop
  801cb1:	c9                   	leaveq 
  801cb2:	c3                   	retq   

0000000000801cb3 <argnext>:
  801cb3:	55                   	push   %rbp
  801cb4:	48 89 e5             	mov    %rsp,%rbp
  801cb7:	48 83 ec 20          	sub    $0x20,%rsp
  801cbb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801cbf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cc3:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  801cca:	00 
  801ccb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ccf:	48 8b 40 10          	mov    0x10(%rax),%rax
  801cd3:	48 85 c0             	test   %rax,%rax
  801cd6:	75 0a                	jne    801ce2 <argnext+0x2f>
  801cd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  801cdd:	e9 24 01 00 00       	jmpq   801e06 <argnext+0x153>
  801ce2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ce6:	48 8b 40 10          	mov    0x10(%rax),%rax
  801cea:	0f b6 00             	movzbl (%rax),%eax
  801ced:	84 c0                	test   %al,%al
  801cef:	0f 85 d5 00 00 00    	jne    801dca <argnext+0x117>
  801cf5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cf9:	48 8b 00             	mov    (%rax),%rax
  801cfc:	8b 00                	mov    (%rax),%eax
  801cfe:	83 f8 01             	cmp    $0x1,%eax
  801d01:	0f 84 ee 00 00 00    	je     801df5 <argnext+0x142>
  801d07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d0b:	48 8b 40 08          	mov    0x8(%rax),%rax
  801d0f:	48 83 c0 08          	add    $0x8,%rax
  801d13:	48 8b 00             	mov    (%rax),%rax
  801d16:	0f b6 00             	movzbl (%rax),%eax
  801d19:	3c 2d                	cmp    $0x2d,%al
  801d1b:	0f 85 d4 00 00 00    	jne    801df5 <argnext+0x142>
  801d21:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d25:	48 8b 40 08          	mov    0x8(%rax),%rax
  801d29:	48 83 c0 08          	add    $0x8,%rax
  801d2d:	48 8b 00             	mov    (%rax),%rax
  801d30:	48 83 c0 01          	add    $0x1,%rax
  801d34:	0f b6 00             	movzbl (%rax),%eax
  801d37:	84 c0                	test   %al,%al
  801d39:	0f 84 b6 00 00 00    	je     801df5 <argnext+0x142>
  801d3f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d43:	48 8b 40 08          	mov    0x8(%rax),%rax
  801d47:	48 83 c0 08          	add    $0x8,%rax
  801d4b:	48 8b 00             	mov    (%rax),%rax
  801d4e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801d52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d56:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801d5a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d5e:	48 8b 00             	mov    (%rax),%rax
  801d61:	8b 00                	mov    (%rax),%eax
  801d63:	83 e8 01             	sub    $0x1,%eax
  801d66:	48 98                	cltq   
  801d68:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  801d6f:	00 
  801d70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d74:	48 8b 40 08          	mov    0x8(%rax),%rax
  801d78:	48 8d 48 10          	lea    0x10(%rax),%rcx
  801d7c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d80:	48 8b 40 08          	mov    0x8(%rax),%rax
  801d84:	48 83 c0 08          	add    $0x8,%rax
  801d88:	48 89 ce             	mov    %rcx,%rsi
  801d8b:	48 89 c7             	mov    %rax,%rdi
  801d8e:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  801d95:	00 00 00 
  801d98:	ff d0                	callq  *%rax
  801d9a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801d9e:	48 8b 00             	mov    (%rax),%rax
  801da1:	8b 10                	mov    (%rax),%edx
  801da3:	83 ea 01             	sub    $0x1,%edx
  801da6:	89 10                	mov    %edx,(%rax)
  801da8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dac:	48 8b 40 10          	mov    0x10(%rax),%rax
  801db0:	0f b6 00             	movzbl (%rax),%eax
  801db3:	3c 2d                	cmp    $0x2d,%al
  801db5:	75 13                	jne    801dca <argnext+0x117>
  801db7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dbb:	48 8b 40 10          	mov    0x10(%rax),%rax
  801dbf:	48 83 c0 01          	add    $0x1,%rax
  801dc3:	0f b6 00             	movzbl (%rax),%eax
  801dc6:	84 c0                	test   %al,%al
  801dc8:	74 2a                	je     801df4 <argnext+0x141>
  801dca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801dce:	48 8b 40 10          	mov    0x10(%rax),%rax
  801dd2:	0f b6 00             	movzbl (%rax),%eax
  801dd5:	0f b6 c0             	movzbl %al,%eax
  801dd8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801ddb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801ddf:	48 8b 40 10          	mov    0x10(%rax),%rax
  801de3:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801de7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801deb:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801def:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801df2:	eb 12                	jmp    801e06 <argnext+0x153>
  801df4:	90                   	nop
  801df5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801df9:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  801e00:	00 
  801e01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  801e06:	c9                   	leaveq 
  801e07:	c3                   	retq   

0000000000801e08 <argvalue>:
  801e08:	55                   	push   %rbp
  801e09:	48 89 e5             	mov    %rsp,%rbp
  801e0c:	48 83 ec 10          	sub    $0x10,%rsp
  801e10:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e18:	48 8b 40 18          	mov    0x18(%rax),%rax
  801e1c:	48 85 c0             	test   %rax,%rax
  801e1f:	74 0a                	je     801e2b <argvalue+0x23>
  801e21:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e25:	48 8b 40 18          	mov    0x18(%rax),%rax
  801e29:	eb 13                	jmp    801e3e <argvalue+0x36>
  801e2b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e2f:	48 89 c7             	mov    %rax,%rdi
  801e32:	48 b8 40 1e 80 00 00 	movabs $0x801e40,%rax
  801e39:	00 00 00 
  801e3c:	ff d0                	callq  *%rax
  801e3e:	c9                   	leaveq 
  801e3f:	c3                   	retq   

0000000000801e40 <argnextvalue>:
  801e40:	55                   	push   %rbp
  801e41:	48 89 e5             	mov    %rsp,%rbp
  801e44:	48 83 ec 10          	sub    $0x10,%rsp
  801e48:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801e4c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e50:	48 8b 40 10          	mov    0x10(%rax),%rax
  801e54:	48 85 c0             	test   %rax,%rax
  801e57:	75 0a                	jne    801e63 <argnextvalue+0x23>
  801e59:	b8 00 00 00 00       	mov    $0x0,%eax
  801e5e:	e9 c8 00 00 00       	jmpq   801f2b <argnextvalue+0xeb>
  801e63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e67:	48 8b 40 10          	mov    0x10(%rax),%rax
  801e6b:	0f b6 00             	movzbl (%rax),%eax
  801e6e:	84 c0                	test   %al,%al
  801e70:	74 27                	je     801e99 <argnextvalue+0x59>
  801e72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e76:	48 8b 50 10          	mov    0x10(%rax),%rdx
  801e7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e7e:	48 89 50 18          	mov    %rdx,0x18(%rax)
  801e82:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e86:	48 be 16 4c 80 00 00 	movabs $0x804c16,%rsi
  801e8d:	00 00 00 
  801e90:	48 89 70 10          	mov    %rsi,0x10(%rax)
  801e94:	e9 8a 00 00 00       	jmpq   801f23 <argnextvalue+0xe3>
  801e99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801e9d:	48 8b 00             	mov    (%rax),%rax
  801ea0:	8b 00                	mov    (%rax),%eax
  801ea2:	83 f8 01             	cmp    $0x1,%eax
  801ea5:	7e 64                	jle    801f0b <argnextvalue+0xcb>
  801ea7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801eab:	48 8b 40 08          	mov    0x8(%rax),%rax
  801eaf:	48 8b 50 08          	mov    0x8(%rax),%rdx
  801eb3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801eb7:	48 89 50 18          	mov    %rdx,0x18(%rax)
  801ebb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ebf:	48 8b 00             	mov    (%rax),%rax
  801ec2:	8b 00                	mov    (%rax),%eax
  801ec4:	83 e8 01             	sub    $0x1,%eax
  801ec7:	48 98                	cltq   
  801ec9:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  801ed0:	00 
  801ed1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ed5:	48 8b 40 08          	mov    0x8(%rax),%rax
  801ed9:	48 8d 48 10          	lea    0x10(%rax),%rcx
  801edd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ee1:	48 8b 40 08          	mov    0x8(%rax),%rax
  801ee5:	48 83 c0 08          	add    $0x8,%rax
  801ee9:	48 89 ce             	mov    %rcx,%rsi
  801eec:	48 89 c7             	mov    %rax,%rdi
  801eef:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  801ef6:	00 00 00 
  801ef9:	ff d0                	callq  *%rax
  801efb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801eff:	48 8b 00             	mov    (%rax),%rax
  801f02:	8b 10                	mov    (%rax),%edx
  801f04:	83 ea 01             	sub    $0x1,%edx
  801f07:	89 10                	mov    %edx,(%rax)
  801f09:	eb 18                	jmp    801f23 <argnextvalue+0xe3>
  801f0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f0f:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  801f16:	00 
  801f17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f1b:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  801f22:	00 
  801f23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f27:	48 8b 40 18          	mov    0x18(%rax),%rax
  801f2b:	c9                   	leaveq 
  801f2c:	c3                   	retq   

0000000000801f2d <fd2num>:
  801f2d:	55                   	push   %rbp
  801f2e:	48 89 e5             	mov    %rsp,%rbp
  801f31:	48 83 ec 08          	sub    $0x8,%rsp
  801f35:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f39:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f3d:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801f44:	ff ff ff 
  801f47:	48 01 d0             	add    %rdx,%rax
  801f4a:	48 c1 e8 0c          	shr    $0xc,%rax
  801f4e:	c9                   	leaveq 
  801f4f:	c3                   	retq   

0000000000801f50 <fd2data>:
  801f50:	55                   	push   %rbp
  801f51:	48 89 e5             	mov    %rsp,%rbp
  801f54:	48 83 ec 08          	sub    $0x8,%rsp
  801f58:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f5c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f60:	48 89 c7             	mov    %rax,%rdi
  801f63:	48 b8 2d 1f 80 00 00 	movabs $0x801f2d,%rax
  801f6a:	00 00 00 
  801f6d:	ff d0                	callq  *%rax
  801f6f:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801f75:	48 c1 e0 0c          	shl    $0xc,%rax
  801f79:	c9                   	leaveq 
  801f7a:	c3                   	retq   

0000000000801f7b <fd_alloc>:
  801f7b:	55                   	push   %rbp
  801f7c:	48 89 e5             	mov    %rsp,%rbp
  801f7f:	48 83 ec 18          	sub    $0x18,%rsp
  801f83:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801f87:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801f8e:	eb 6b                	jmp    801ffb <fd_alloc+0x80>
  801f90:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f93:	48 98                	cltq   
  801f95:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801f9b:	48 c1 e0 0c          	shl    $0xc,%rax
  801f9f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801fa3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fa7:	48 c1 e8 15          	shr    $0x15,%rax
  801fab:	48 89 c2             	mov    %rax,%rdx
  801fae:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801fb5:	01 00 00 
  801fb8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fbc:	83 e0 01             	and    $0x1,%eax
  801fbf:	48 85 c0             	test   %rax,%rax
  801fc2:	74 21                	je     801fe5 <fd_alloc+0x6a>
  801fc4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801fc8:	48 c1 e8 0c          	shr    $0xc,%rax
  801fcc:	48 89 c2             	mov    %rax,%rdx
  801fcf:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801fd6:	01 00 00 
  801fd9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801fdd:	83 e0 01             	and    $0x1,%eax
  801fe0:	48 85 c0             	test   %rax,%rax
  801fe3:	75 12                	jne    801ff7 <fd_alloc+0x7c>
  801fe5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fe9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801fed:	48 89 10             	mov    %rdx,(%rax)
  801ff0:	b8 00 00 00 00       	mov    $0x0,%eax
  801ff5:	eb 1a                	jmp    802011 <fd_alloc+0x96>
  801ff7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801ffb:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801fff:	7e 8f                	jle    801f90 <fd_alloc+0x15>
  802001:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802005:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80200c:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  802011:	c9                   	leaveq 
  802012:	c3                   	retq   

0000000000802013 <fd_lookup>:
  802013:	55                   	push   %rbp
  802014:	48 89 e5             	mov    %rsp,%rbp
  802017:	48 83 ec 20          	sub    $0x20,%rsp
  80201b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80201e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802022:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802026:	78 06                	js     80202e <fd_lookup+0x1b>
  802028:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  80202c:	7e 07                	jle    802035 <fd_lookup+0x22>
  80202e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802033:	eb 6c                	jmp    8020a1 <fd_lookup+0x8e>
  802035:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802038:	48 98                	cltq   
  80203a:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802040:	48 c1 e0 0c          	shl    $0xc,%rax
  802044:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802048:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80204c:	48 c1 e8 15          	shr    $0x15,%rax
  802050:	48 89 c2             	mov    %rax,%rdx
  802053:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80205a:	01 00 00 
  80205d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802061:	83 e0 01             	and    $0x1,%eax
  802064:	48 85 c0             	test   %rax,%rax
  802067:	74 21                	je     80208a <fd_lookup+0x77>
  802069:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80206d:	48 c1 e8 0c          	shr    $0xc,%rax
  802071:	48 89 c2             	mov    %rax,%rdx
  802074:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80207b:	01 00 00 
  80207e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802082:	83 e0 01             	and    $0x1,%eax
  802085:	48 85 c0             	test   %rax,%rax
  802088:	75 07                	jne    802091 <fd_lookup+0x7e>
  80208a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80208f:	eb 10                	jmp    8020a1 <fd_lookup+0x8e>
  802091:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802095:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802099:	48 89 10             	mov    %rdx,(%rax)
  80209c:	b8 00 00 00 00       	mov    $0x0,%eax
  8020a1:	c9                   	leaveq 
  8020a2:	c3                   	retq   

00000000008020a3 <fd_close>:
  8020a3:	55                   	push   %rbp
  8020a4:	48 89 e5             	mov    %rsp,%rbp
  8020a7:	48 83 ec 30          	sub    $0x30,%rsp
  8020ab:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8020af:	89 f0                	mov    %esi,%eax
  8020b1:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8020b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8020b8:	48 89 c7             	mov    %rax,%rdi
  8020bb:	48 b8 2d 1f 80 00 00 	movabs $0x801f2d,%rax
  8020c2:	00 00 00 
  8020c5:	ff d0                	callq  *%rax
  8020c7:	89 c2                	mov    %eax,%edx
  8020c9:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8020cd:	48 89 c6             	mov    %rax,%rsi
  8020d0:	89 d7                	mov    %edx,%edi
  8020d2:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  8020d9:	00 00 00 
  8020dc:	ff d0                	callq  *%rax
  8020de:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020e1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020e5:	78 0a                	js     8020f1 <fd_close+0x4e>
  8020e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020eb:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  8020ef:	74 12                	je     802103 <fd_close+0x60>
  8020f1:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  8020f5:	74 05                	je     8020fc <fd_close+0x59>
  8020f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020fa:	eb 70                	jmp    80216c <fd_close+0xc9>
  8020fc:	b8 00 00 00 00       	mov    $0x0,%eax
  802101:	eb 69                	jmp    80216c <fd_close+0xc9>
  802103:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802107:	8b 00                	mov    (%rax),%eax
  802109:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80210d:	48 89 d6             	mov    %rdx,%rsi
  802110:	89 c7                	mov    %eax,%edi
  802112:	48 b8 6e 21 80 00 00 	movabs $0x80216e,%rax
  802119:	00 00 00 
  80211c:	ff d0                	callq  *%rax
  80211e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802121:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802125:	78 2a                	js     802151 <fd_close+0xae>
  802127:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80212b:	48 8b 40 20          	mov    0x20(%rax),%rax
  80212f:	48 85 c0             	test   %rax,%rax
  802132:	74 16                	je     80214a <fd_close+0xa7>
  802134:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802138:	48 8b 40 20          	mov    0x20(%rax),%rax
  80213c:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802140:	48 89 d7             	mov    %rdx,%rdi
  802143:	ff d0                	callq  *%rax
  802145:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802148:	eb 07                	jmp    802151 <fd_close+0xae>
  80214a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802151:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802155:	48 89 c6             	mov    %rax,%rsi
  802158:	bf 00 00 00 00       	mov    $0x0,%edi
  80215d:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  802164:	00 00 00 
  802167:	ff d0                	callq  *%rax
  802169:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80216c:	c9                   	leaveq 
  80216d:	c3                   	retq   

000000000080216e <dev_lookup>:
  80216e:	55                   	push   %rbp
  80216f:	48 89 e5             	mov    %rsp,%rbp
  802172:	48 83 ec 20          	sub    $0x20,%rsp
  802176:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802179:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80217d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802184:	eb 41                	jmp    8021c7 <dev_lookup+0x59>
  802186:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  80218d:	00 00 00 
  802190:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802193:	48 63 d2             	movslq %edx,%rdx
  802196:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80219a:	8b 00                	mov    (%rax),%eax
  80219c:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80219f:	75 22                	jne    8021c3 <dev_lookup+0x55>
  8021a1:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8021a8:	00 00 00 
  8021ab:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8021ae:	48 63 d2             	movslq %edx,%rdx
  8021b1:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8021b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8021b9:	48 89 10             	mov    %rdx,(%rax)
  8021bc:	b8 00 00 00 00       	mov    $0x0,%eax
  8021c1:	eb 60                	jmp    802223 <dev_lookup+0xb5>
  8021c3:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8021c7:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  8021ce:	00 00 00 
  8021d1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8021d4:	48 63 d2             	movslq %edx,%rdx
  8021d7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021db:	48 85 c0             	test   %rax,%rax
  8021de:	75 a6                	jne    802186 <dev_lookup+0x18>
  8021e0:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8021e7:	00 00 00 
  8021ea:	48 8b 00             	mov    (%rax),%rax
  8021ed:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8021f3:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8021f6:	89 c6                	mov    %eax,%esi
  8021f8:	48 bf 18 4c 80 00 00 	movabs $0x804c18,%rdi
  8021ff:	00 00 00 
  802202:	b8 00 00 00 00       	mov    $0x0,%eax
  802207:	48 b9 92 03 80 00 00 	movabs $0x800392,%rcx
  80220e:	00 00 00 
  802211:	ff d1                	callq  *%rcx
  802213:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802217:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80221e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802223:	c9                   	leaveq 
  802224:	c3                   	retq   

0000000000802225 <close>:
  802225:	55                   	push   %rbp
  802226:	48 89 e5             	mov    %rsp,%rbp
  802229:	48 83 ec 20          	sub    $0x20,%rsp
  80222d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802230:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802234:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802237:	48 89 d6             	mov    %rdx,%rsi
  80223a:	89 c7                	mov    %eax,%edi
  80223c:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  802243:	00 00 00 
  802246:	ff d0                	callq  *%rax
  802248:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80224b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80224f:	79 05                	jns    802256 <close+0x31>
  802251:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802254:	eb 18                	jmp    80226e <close+0x49>
  802256:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80225a:	be 01 00 00 00       	mov    $0x1,%esi
  80225f:	48 89 c7             	mov    %rax,%rdi
  802262:	48 b8 a3 20 80 00 00 	movabs $0x8020a3,%rax
  802269:	00 00 00 
  80226c:	ff d0                	callq  *%rax
  80226e:	c9                   	leaveq 
  80226f:	c3                   	retq   

0000000000802270 <close_all>:
  802270:	55                   	push   %rbp
  802271:	48 89 e5             	mov    %rsp,%rbp
  802274:	48 83 ec 10          	sub    $0x10,%rsp
  802278:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80227f:	eb 15                	jmp    802296 <close_all+0x26>
  802281:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802284:	89 c7                	mov    %eax,%edi
  802286:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  80228d:	00 00 00 
  802290:	ff d0                	callq  *%rax
  802292:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802296:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80229a:	7e e5                	jle    802281 <close_all+0x11>
  80229c:	90                   	nop
  80229d:	c9                   	leaveq 
  80229e:	c3                   	retq   

000000000080229f <dup>:
  80229f:	55                   	push   %rbp
  8022a0:	48 89 e5             	mov    %rsp,%rbp
  8022a3:	48 83 ec 40          	sub    $0x40,%rsp
  8022a7:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8022aa:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8022ad:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8022b1:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8022b4:	48 89 d6             	mov    %rdx,%rsi
  8022b7:	89 c7                	mov    %eax,%edi
  8022b9:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  8022c0:	00 00 00 
  8022c3:	ff d0                	callq  *%rax
  8022c5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022c8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022cc:	79 08                	jns    8022d6 <dup+0x37>
  8022ce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022d1:	e9 70 01 00 00       	jmpq   802446 <dup+0x1a7>
  8022d6:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022d9:	89 c7                	mov    %eax,%edi
  8022db:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  8022e2:	00 00 00 
  8022e5:	ff d0                	callq  *%rax
  8022e7:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8022ea:	48 98                	cltq   
  8022ec:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8022f2:	48 c1 e0 0c          	shl    $0xc,%rax
  8022f6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8022fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8022fe:	48 89 c7             	mov    %rax,%rdi
  802301:	48 b8 50 1f 80 00 00 	movabs $0x801f50,%rax
  802308:	00 00 00 
  80230b:	ff d0                	callq  *%rax
  80230d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  802311:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802315:	48 89 c7             	mov    %rax,%rdi
  802318:	48 b8 50 1f 80 00 00 	movabs $0x801f50,%rax
  80231f:	00 00 00 
  802322:	ff d0                	callq  *%rax
  802324:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802328:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80232c:	48 c1 e8 15          	shr    $0x15,%rax
  802330:	48 89 c2             	mov    %rax,%rdx
  802333:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80233a:	01 00 00 
  80233d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802341:	83 e0 01             	and    $0x1,%eax
  802344:	48 85 c0             	test   %rax,%rax
  802347:	74 71                	je     8023ba <dup+0x11b>
  802349:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80234d:	48 c1 e8 0c          	shr    $0xc,%rax
  802351:	48 89 c2             	mov    %rax,%rdx
  802354:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80235b:	01 00 00 
  80235e:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802362:	83 e0 01             	and    $0x1,%eax
  802365:	48 85 c0             	test   %rax,%rax
  802368:	74 50                	je     8023ba <dup+0x11b>
  80236a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80236e:	48 c1 e8 0c          	shr    $0xc,%rax
  802372:	48 89 c2             	mov    %rax,%rdx
  802375:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  80237c:	01 00 00 
  80237f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802383:	25 07 0e 00 00       	and    $0xe07,%eax
  802388:	89 c1                	mov    %eax,%ecx
  80238a:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80238e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802392:	41 89 c8             	mov    %ecx,%r8d
  802395:	48 89 d1             	mov    %rdx,%rcx
  802398:	ba 00 00 00 00       	mov    $0x0,%edx
  80239d:	48 89 c6             	mov    %rax,%rsi
  8023a0:	bf 00 00 00 00       	mov    $0x0,%edi
  8023a5:	48 b8 a4 18 80 00 00 	movabs $0x8018a4,%rax
  8023ac:	00 00 00 
  8023af:	ff d0                	callq  *%rax
  8023b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023b4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8023b8:	78 55                	js     80240f <dup+0x170>
  8023ba:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023be:	48 c1 e8 0c          	shr    $0xc,%rax
  8023c2:	48 89 c2             	mov    %rax,%rdx
  8023c5:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8023cc:	01 00 00 
  8023cf:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8023d3:	25 07 0e 00 00       	and    $0xe07,%eax
  8023d8:	89 c1                	mov    %eax,%ecx
  8023da:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023de:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8023e2:	41 89 c8             	mov    %ecx,%r8d
  8023e5:	48 89 d1             	mov    %rdx,%rcx
  8023e8:	ba 00 00 00 00       	mov    $0x0,%edx
  8023ed:	48 89 c6             	mov    %rax,%rsi
  8023f0:	bf 00 00 00 00       	mov    $0x0,%edi
  8023f5:	48 b8 a4 18 80 00 00 	movabs $0x8018a4,%rax
  8023fc:	00 00 00 
  8023ff:	ff d0                	callq  *%rax
  802401:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802404:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802408:	78 08                	js     802412 <dup+0x173>
  80240a:	8b 45 c8             	mov    -0x38(%rbp),%eax
  80240d:	eb 37                	jmp    802446 <dup+0x1a7>
  80240f:	90                   	nop
  802410:	eb 01                	jmp    802413 <dup+0x174>
  802412:	90                   	nop
  802413:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802417:	48 89 c6             	mov    %rax,%rsi
  80241a:	bf 00 00 00 00       	mov    $0x0,%edi
  80241f:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  802426:	00 00 00 
  802429:	ff d0                	callq  *%rax
  80242b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80242f:	48 89 c6             	mov    %rax,%rsi
  802432:	bf 00 00 00 00       	mov    $0x0,%edi
  802437:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  80243e:	00 00 00 
  802441:	ff d0                	callq  *%rax
  802443:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802446:	c9                   	leaveq 
  802447:	c3                   	retq   

0000000000802448 <read>:
  802448:	55                   	push   %rbp
  802449:	48 89 e5             	mov    %rsp,%rbp
  80244c:	48 83 ec 40          	sub    $0x40,%rsp
  802450:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802453:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802457:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80245b:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80245f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802462:	48 89 d6             	mov    %rdx,%rsi
  802465:	89 c7                	mov    %eax,%edi
  802467:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  80246e:	00 00 00 
  802471:	ff d0                	callq  *%rax
  802473:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802476:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80247a:	78 24                	js     8024a0 <read+0x58>
  80247c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802480:	8b 00                	mov    (%rax),%eax
  802482:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802486:	48 89 d6             	mov    %rdx,%rsi
  802489:	89 c7                	mov    %eax,%edi
  80248b:	48 b8 6e 21 80 00 00 	movabs $0x80216e,%rax
  802492:	00 00 00 
  802495:	ff d0                	callq  *%rax
  802497:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80249a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80249e:	79 05                	jns    8024a5 <read+0x5d>
  8024a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8024a3:	eb 76                	jmp    80251b <read+0xd3>
  8024a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8024a9:	8b 40 08             	mov    0x8(%rax),%eax
  8024ac:	83 e0 03             	and    $0x3,%eax
  8024af:	83 f8 01             	cmp    $0x1,%eax
  8024b2:	75 3a                	jne    8024ee <read+0xa6>
  8024b4:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8024bb:	00 00 00 
  8024be:	48 8b 00             	mov    (%rax),%rax
  8024c1:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8024c7:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8024ca:	89 c6                	mov    %eax,%esi
  8024cc:	48 bf 37 4c 80 00 00 	movabs $0x804c37,%rdi
  8024d3:	00 00 00 
  8024d6:	b8 00 00 00 00       	mov    $0x0,%eax
  8024db:	48 b9 92 03 80 00 00 	movabs $0x800392,%rcx
  8024e2:	00 00 00 
  8024e5:	ff d1                	callq  *%rcx
  8024e7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024ec:	eb 2d                	jmp    80251b <read+0xd3>
  8024ee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024f2:	48 8b 40 10          	mov    0x10(%rax),%rax
  8024f6:	48 85 c0             	test   %rax,%rax
  8024f9:	75 07                	jne    802502 <read+0xba>
  8024fb:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802500:	eb 19                	jmp    80251b <read+0xd3>
  802502:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802506:	48 8b 40 10          	mov    0x10(%rax),%rax
  80250a:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80250e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802512:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802516:	48 89 cf             	mov    %rcx,%rdi
  802519:	ff d0                	callq  *%rax
  80251b:	c9                   	leaveq 
  80251c:	c3                   	retq   

000000000080251d <readn>:
  80251d:	55                   	push   %rbp
  80251e:	48 89 e5             	mov    %rsp,%rbp
  802521:	48 83 ec 30          	sub    $0x30,%rsp
  802525:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802528:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80252c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802530:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802537:	eb 47                	jmp    802580 <readn+0x63>
  802539:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80253c:	48 98                	cltq   
  80253e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802542:	48 29 c2             	sub    %rax,%rdx
  802545:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802548:	48 63 c8             	movslq %eax,%rcx
  80254b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80254f:	48 01 c1             	add    %rax,%rcx
  802552:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802555:	48 89 ce             	mov    %rcx,%rsi
  802558:	89 c7                	mov    %eax,%edi
  80255a:	48 b8 48 24 80 00 00 	movabs $0x802448,%rax
  802561:	00 00 00 
  802564:	ff d0                	callq  *%rax
  802566:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802569:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80256d:	79 05                	jns    802574 <readn+0x57>
  80256f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802572:	eb 1d                	jmp    802591 <readn+0x74>
  802574:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802578:	74 13                	je     80258d <readn+0x70>
  80257a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80257d:	01 45 fc             	add    %eax,-0x4(%rbp)
  802580:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802583:	48 98                	cltq   
  802585:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802589:	72 ae                	jb     802539 <readn+0x1c>
  80258b:	eb 01                	jmp    80258e <readn+0x71>
  80258d:	90                   	nop
  80258e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802591:	c9                   	leaveq 
  802592:	c3                   	retq   

0000000000802593 <write>:
  802593:	55                   	push   %rbp
  802594:	48 89 e5             	mov    %rsp,%rbp
  802597:	48 83 ec 40          	sub    $0x40,%rsp
  80259b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80259e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8025a2:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8025a6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8025aa:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8025ad:	48 89 d6             	mov    %rdx,%rsi
  8025b0:	89 c7                	mov    %eax,%edi
  8025b2:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  8025b9:	00 00 00 
  8025bc:	ff d0                	callq  *%rax
  8025be:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025c1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025c5:	78 24                	js     8025eb <write+0x58>
  8025c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025cb:	8b 00                	mov    (%rax),%eax
  8025cd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8025d1:	48 89 d6             	mov    %rdx,%rsi
  8025d4:	89 c7                	mov    %eax,%edi
  8025d6:	48 b8 6e 21 80 00 00 	movabs $0x80216e,%rax
  8025dd:	00 00 00 
  8025e0:	ff d0                	callq  *%rax
  8025e2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025e5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025e9:	79 05                	jns    8025f0 <write+0x5d>
  8025eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025ee:	eb 75                	jmp    802665 <write+0xd2>
  8025f0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025f4:	8b 40 08             	mov    0x8(%rax),%eax
  8025f7:	83 e0 03             	and    $0x3,%eax
  8025fa:	85 c0                	test   %eax,%eax
  8025fc:	75 3a                	jne    802638 <write+0xa5>
  8025fe:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802605:	00 00 00 
  802608:	48 8b 00             	mov    (%rax),%rax
  80260b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802611:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802614:	89 c6                	mov    %eax,%esi
  802616:	48 bf 53 4c 80 00 00 	movabs $0x804c53,%rdi
  80261d:	00 00 00 
  802620:	b8 00 00 00 00       	mov    $0x0,%eax
  802625:	48 b9 92 03 80 00 00 	movabs $0x800392,%rcx
  80262c:	00 00 00 
  80262f:	ff d1                	callq  *%rcx
  802631:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802636:	eb 2d                	jmp    802665 <write+0xd2>
  802638:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80263c:	48 8b 40 18          	mov    0x18(%rax),%rax
  802640:	48 85 c0             	test   %rax,%rax
  802643:	75 07                	jne    80264c <write+0xb9>
  802645:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80264a:	eb 19                	jmp    802665 <write+0xd2>
  80264c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802650:	48 8b 40 18          	mov    0x18(%rax),%rax
  802654:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802658:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80265c:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802660:	48 89 cf             	mov    %rcx,%rdi
  802663:	ff d0                	callq  *%rax
  802665:	c9                   	leaveq 
  802666:	c3                   	retq   

0000000000802667 <seek>:
  802667:	55                   	push   %rbp
  802668:	48 89 e5             	mov    %rsp,%rbp
  80266b:	48 83 ec 18          	sub    $0x18,%rsp
  80266f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802672:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802675:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802679:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80267c:	48 89 d6             	mov    %rdx,%rsi
  80267f:	89 c7                	mov    %eax,%edi
  802681:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  802688:	00 00 00 
  80268b:	ff d0                	callq  *%rax
  80268d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802690:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802694:	79 05                	jns    80269b <seek+0x34>
  802696:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802699:	eb 0f                	jmp    8026aa <seek+0x43>
  80269b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80269f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8026a2:	89 50 04             	mov    %edx,0x4(%rax)
  8026a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8026aa:	c9                   	leaveq 
  8026ab:	c3                   	retq   

00000000008026ac <ftruncate>:
  8026ac:	55                   	push   %rbp
  8026ad:	48 89 e5             	mov    %rsp,%rbp
  8026b0:	48 83 ec 30          	sub    $0x30,%rsp
  8026b4:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8026b7:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8026ba:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8026be:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8026c1:	48 89 d6             	mov    %rdx,%rsi
  8026c4:	89 c7                	mov    %eax,%edi
  8026c6:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  8026cd:	00 00 00 
  8026d0:	ff d0                	callq  *%rax
  8026d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026d9:	78 24                	js     8026ff <ftruncate+0x53>
  8026db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026df:	8b 00                	mov    (%rax),%eax
  8026e1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026e5:	48 89 d6             	mov    %rdx,%rsi
  8026e8:	89 c7                	mov    %eax,%edi
  8026ea:	48 b8 6e 21 80 00 00 	movabs $0x80216e,%rax
  8026f1:	00 00 00 
  8026f4:	ff d0                	callq  *%rax
  8026f6:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026f9:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026fd:	79 05                	jns    802704 <ftruncate+0x58>
  8026ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802702:	eb 72                	jmp    802776 <ftruncate+0xca>
  802704:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802708:	8b 40 08             	mov    0x8(%rax),%eax
  80270b:	83 e0 03             	and    $0x3,%eax
  80270e:	85 c0                	test   %eax,%eax
  802710:	75 3a                	jne    80274c <ftruncate+0xa0>
  802712:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  802719:	00 00 00 
  80271c:	48 8b 00             	mov    (%rax),%rax
  80271f:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802725:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802728:	89 c6                	mov    %eax,%esi
  80272a:	48 bf 70 4c 80 00 00 	movabs $0x804c70,%rdi
  802731:	00 00 00 
  802734:	b8 00 00 00 00       	mov    $0x0,%eax
  802739:	48 b9 92 03 80 00 00 	movabs $0x800392,%rcx
  802740:	00 00 00 
  802743:	ff d1                	callq  *%rcx
  802745:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80274a:	eb 2a                	jmp    802776 <ftruncate+0xca>
  80274c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802750:	48 8b 40 30          	mov    0x30(%rax),%rax
  802754:	48 85 c0             	test   %rax,%rax
  802757:	75 07                	jne    802760 <ftruncate+0xb4>
  802759:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80275e:	eb 16                	jmp    802776 <ftruncate+0xca>
  802760:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802764:	48 8b 40 30          	mov    0x30(%rax),%rax
  802768:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80276c:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  80276f:	89 ce                	mov    %ecx,%esi
  802771:	48 89 d7             	mov    %rdx,%rdi
  802774:	ff d0                	callq  *%rax
  802776:	c9                   	leaveq 
  802777:	c3                   	retq   

0000000000802778 <fstat>:
  802778:	55                   	push   %rbp
  802779:	48 89 e5             	mov    %rsp,%rbp
  80277c:	48 83 ec 30          	sub    $0x30,%rsp
  802780:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802783:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802787:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80278b:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80278e:	48 89 d6             	mov    %rdx,%rsi
  802791:	89 c7                	mov    %eax,%edi
  802793:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  80279a:	00 00 00 
  80279d:	ff d0                	callq  *%rax
  80279f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027a2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027a6:	78 24                	js     8027cc <fstat+0x54>
  8027a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027ac:	8b 00                	mov    (%rax),%eax
  8027ae:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027b2:	48 89 d6             	mov    %rdx,%rsi
  8027b5:	89 c7                	mov    %eax,%edi
  8027b7:	48 b8 6e 21 80 00 00 	movabs $0x80216e,%rax
  8027be:	00 00 00 
  8027c1:	ff d0                	callq  *%rax
  8027c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027ca:	79 05                	jns    8027d1 <fstat+0x59>
  8027cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027cf:	eb 5e                	jmp    80282f <fstat+0xb7>
  8027d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8027d5:	48 8b 40 28          	mov    0x28(%rax),%rax
  8027d9:	48 85 c0             	test   %rax,%rax
  8027dc:	75 07                	jne    8027e5 <fstat+0x6d>
  8027de:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8027e3:	eb 4a                	jmp    80282f <fstat+0xb7>
  8027e5:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027e9:	c6 00 00             	movb   $0x0,(%rax)
  8027ec:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027f0:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  8027f7:	00 00 00 
  8027fa:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8027fe:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802805:	00 00 00 
  802808:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80280c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802810:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802817:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80281b:	48 8b 40 28          	mov    0x28(%rax),%rax
  80281f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802823:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802827:	48 89 ce             	mov    %rcx,%rsi
  80282a:	48 89 d7             	mov    %rdx,%rdi
  80282d:	ff d0                	callq  *%rax
  80282f:	c9                   	leaveq 
  802830:	c3                   	retq   

0000000000802831 <stat>:
  802831:	55                   	push   %rbp
  802832:	48 89 e5             	mov    %rsp,%rbp
  802835:	48 83 ec 20          	sub    $0x20,%rsp
  802839:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80283d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802841:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802845:	be 00 00 00 00       	mov    $0x0,%esi
  80284a:	48 89 c7             	mov    %rax,%rdi
  80284d:	48 b8 21 29 80 00 00 	movabs $0x802921,%rax
  802854:	00 00 00 
  802857:	ff d0                	callq  *%rax
  802859:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80285c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802860:	79 05                	jns    802867 <stat+0x36>
  802862:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802865:	eb 2f                	jmp    802896 <stat+0x65>
  802867:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80286b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80286e:	48 89 d6             	mov    %rdx,%rsi
  802871:	89 c7                	mov    %eax,%edi
  802873:	48 b8 78 27 80 00 00 	movabs $0x802778,%rax
  80287a:	00 00 00 
  80287d:	ff d0                	callq  *%rax
  80287f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802882:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802885:	89 c7                	mov    %eax,%edi
  802887:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  80288e:	00 00 00 
  802891:	ff d0                	callq  *%rax
  802893:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802896:	c9                   	leaveq 
  802897:	c3                   	retq   

0000000000802898 <fsipc>:
  802898:	55                   	push   %rbp
  802899:	48 89 e5             	mov    %rsp,%rbp
  80289c:	48 83 ec 10          	sub    $0x10,%rsp
  8028a0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8028a3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8028a7:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8028ae:	00 00 00 
  8028b1:	8b 00                	mov    (%rax),%eax
  8028b3:	85 c0                	test   %eax,%eax
  8028b5:	75 1f                	jne    8028d6 <fsipc+0x3e>
  8028b7:	bf 01 00 00 00       	mov    $0x1,%edi
  8028bc:	48 b8 c0 45 80 00 00 	movabs $0x8045c0,%rax
  8028c3:	00 00 00 
  8028c6:	ff d0                	callq  *%rax
  8028c8:	89 c2                	mov    %eax,%edx
  8028ca:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8028d1:	00 00 00 
  8028d4:	89 10                	mov    %edx,(%rax)
  8028d6:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  8028dd:	00 00 00 
  8028e0:	8b 00                	mov    (%rax),%eax
  8028e2:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8028e5:	b9 07 00 00 00       	mov    $0x7,%ecx
  8028ea:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  8028f1:	00 00 00 
  8028f4:	89 c7                	mov    %eax,%edi
  8028f6:	48 b8 b6 44 80 00 00 	movabs $0x8044b6,%rax
  8028fd:	00 00 00 
  802900:	ff d0                	callq  *%rax
  802902:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802906:	ba 00 00 00 00       	mov    $0x0,%edx
  80290b:	48 89 c6             	mov    %rax,%rsi
  80290e:	bf 00 00 00 00       	mov    $0x0,%edi
  802913:	48 b8 f5 43 80 00 00 	movabs $0x8043f5,%rax
  80291a:	00 00 00 
  80291d:	ff d0                	callq  *%rax
  80291f:	c9                   	leaveq 
  802920:	c3                   	retq   

0000000000802921 <open>:
  802921:	55                   	push   %rbp
  802922:	48 89 e5             	mov    %rsp,%rbp
  802925:	48 83 ec 20          	sub    $0x20,%rsp
  802929:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80292d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802930:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802934:	48 89 c7             	mov    %rax,%rdi
  802937:	48 b8 b6 0e 80 00 00 	movabs $0x800eb6,%rax
  80293e:	00 00 00 
  802941:	ff d0                	callq  *%rax
  802943:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802948:	7e 0a                	jle    802954 <open+0x33>
  80294a:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80294f:	e9 a5 00 00 00       	jmpq   8029f9 <open+0xd8>
  802954:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802958:	48 89 c7             	mov    %rax,%rdi
  80295b:	48 b8 7b 1f 80 00 00 	movabs $0x801f7b,%rax
  802962:	00 00 00 
  802965:	ff d0                	callq  *%rax
  802967:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80296a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80296e:	79 08                	jns    802978 <open+0x57>
  802970:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802973:	e9 81 00 00 00       	jmpq   8029f9 <open+0xd8>
  802978:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80297c:	48 89 c6             	mov    %rax,%rsi
  80297f:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802986:	00 00 00 
  802989:	48 b8 22 0f 80 00 00 	movabs $0x800f22,%rax
  802990:	00 00 00 
  802993:	ff d0                	callq  *%rax
  802995:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80299c:	00 00 00 
  80299f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8029a2:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  8029a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029ac:	48 89 c6             	mov    %rax,%rsi
  8029af:	bf 01 00 00 00       	mov    $0x1,%edi
  8029b4:	48 b8 98 28 80 00 00 	movabs $0x802898,%rax
  8029bb:	00 00 00 
  8029be:	ff d0                	callq  *%rax
  8029c0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029c3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029c7:	79 1d                	jns    8029e6 <open+0xc5>
  8029c9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029cd:	be 00 00 00 00       	mov    $0x0,%esi
  8029d2:	48 89 c7             	mov    %rax,%rdi
  8029d5:	48 b8 a3 20 80 00 00 	movabs $0x8020a3,%rax
  8029dc:	00 00 00 
  8029df:	ff d0                	callq  *%rax
  8029e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029e4:	eb 13                	jmp    8029f9 <open+0xd8>
  8029e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029ea:	48 89 c7             	mov    %rax,%rdi
  8029ed:	48 b8 2d 1f 80 00 00 	movabs $0x801f2d,%rax
  8029f4:	00 00 00 
  8029f7:	ff d0                	callq  *%rax
  8029f9:	c9                   	leaveq 
  8029fa:	c3                   	retq   

00000000008029fb <devfile_flush>:
  8029fb:	55                   	push   %rbp
  8029fc:	48 89 e5             	mov    %rsp,%rbp
  8029ff:	48 83 ec 10          	sub    $0x10,%rsp
  802a03:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802a07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802a0b:	8b 50 0c             	mov    0xc(%rax),%edx
  802a0e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a15:	00 00 00 
  802a18:	89 10                	mov    %edx,(%rax)
  802a1a:	be 00 00 00 00       	mov    $0x0,%esi
  802a1f:	bf 06 00 00 00       	mov    $0x6,%edi
  802a24:	48 b8 98 28 80 00 00 	movabs $0x802898,%rax
  802a2b:	00 00 00 
  802a2e:	ff d0                	callq  *%rax
  802a30:	c9                   	leaveq 
  802a31:	c3                   	retq   

0000000000802a32 <devfile_read>:
  802a32:	55                   	push   %rbp
  802a33:	48 89 e5             	mov    %rsp,%rbp
  802a36:	48 83 ec 30          	sub    $0x30,%rsp
  802a3a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802a3e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802a42:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802a46:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a4a:	8b 50 0c             	mov    0xc(%rax),%edx
  802a4d:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a54:	00 00 00 
  802a57:	89 10                	mov    %edx,(%rax)
  802a59:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a60:	00 00 00 
  802a63:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802a67:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802a6b:	be 00 00 00 00       	mov    $0x0,%esi
  802a70:	bf 03 00 00 00       	mov    $0x3,%edi
  802a75:	48 b8 98 28 80 00 00 	movabs $0x802898,%rax
  802a7c:	00 00 00 
  802a7f:	ff d0                	callq  *%rax
  802a81:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a84:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a88:	79 08                	jns    802a92 <devfile_read+0x60>
  802a8a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a8d:	e9 a4 00 00 00       	jmpq   802b36 <devfile_read+0x104>
  802a92:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a95:	48 98                	cltq   
  802a97:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802a9b:	76 35                	jbe    802ad2 <devfile_read+0xa0>
  802a9d:	48 b9 96 4c 80 00 00 	movabs $0x804c96,%rcx
  802aa4:	00 00 00 
  802aa7:	48 ba 9d 4c 80 00 00 	movabs $0x804c9d,%rdx
  802aae:	00 00 00 
  802ab1:	be 89 00 00 00       	mov    $0x89,%esi
  802ab6:	48 bf b2 4c 80 00 00 	movabs $0x804cb2,%rdi
  802abd:	00 00 00 
  802ac0:	b8 00 00 00 00       	mov    $0x0,%eax
  802ac5:	49 b8 e1 42 80 00 00 	movabs $0x8042e1,%r8
  802acc:	00 00 00 
  802acf:	41 ff d0             	callq  *%r8
  802ad2:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802ad9:	7e 35                	jle    802b10 <devfile_read+0xde>
  802adb:	48 b9 c0 4c 80 00 00 	movabs $0x804cc0,%rcx
  802ae2:	00 00 00 
  802ae5:	48 ba 9d 4c 80 00 00 	movabs $0x804c9d,%rdx
  802aec:	00 00 00 
  802aef:	be 8a 00 00 00       	mov    $0x8a,%esi
  802af4:	48 bf b2 4c 80 00 00 	movabs $0x804cb2,%rdi
  802afb:	00 00 00 
  802afe:	b8 00 00 00 00       	mov    $0x0,%eax
  802b03:	49 b8 e1 42 80 00 00 	movabs $0x8042e1,%r8
  802b0a:	00 00 00 
  802b0d:	41 ff d0             	callq  *%r8
  802b10:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b13:	48 63 d0             	movslq %eax,%rdx
  802b16:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b1a:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802b21:	00 00 00 
  802b24:	48 89 c7             	mov    %rax,%rdi
  802b27:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  802b2e:	00 00 00 
  802b31:	ff d0                	callq  *%rax
  802b33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b36:	c9                   	leaveq 
  802b37:	c3                   	retq   

0000000000802b38 <devfile_write>:
  802b38:	55                   	push   %rbp
  802b39:	48 89 e5             	mov    %rsp,%rbp
  802b3c:	48 83 ec 40          	sub    $0x40,%rsp
  802b40:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802b44:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802b48:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802b4c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802b50:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802b54:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802b5b:	00 
  802b5c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b60:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802b64:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802b69:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802b6d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802b71:	8b 50 0c             	mov    0xc(%rax),%edx
  802b74:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b7b:	00 00 00 
  802b7e:	89 10                	mov    %edx,(%rax)
  802b80:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b87:	00 00 00 
  802b8a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b8e:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802b92:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802b96:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b9a:	48 89 c6             	mov    %rax,%rsi
  802b9d:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802ba4:	00 00 00 
  802ba7:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  802bae:	00 00 00 
  802bb1:	ff d0                	callq  *%rax
  802bb3:	be 00 00 00 00       	mov    $0x0,%esi
  802bb8:	bf 04 00 00 00       	mov    $0x4,%edi
  802bbd:	48 b8 98 28 80 00 00 	movabs $0x802898,%rax
  802bc4:	00 00 00 
  802bc7:	ff d0                	callq  *%rax
  802bc9:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802bcc:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802bd0:	79 05                	jns    802bd7 <devfile_write+0x9f>
  802bd2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bd5:	eb 43                	jmp    802c1a <devfile_write+0xe2>
  802bd7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802bda:	48 98                	cltq   
  802bdc:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802be0:	76 35                	jbe    802c17 <devfile_write+0xdf>
  802be2:	48 b9 96 4c 80 00 00 	movabs $0x804c96,%rcx
  802be9:	00 00 00 
  802bec:	48 ba 9d 4c 80 00 00 	movabs $0x804c9d,%rdx
  802bf3:	00 00 00 
  802bf6:	be a8 00 00 00       	mov    $0xa8,%esi
  802bfb:	48 bf b2 4c 80 00 00 	movabs $0x804cb2,%rdi
  802c02:	00 00 00 
  802c05:	b8 00 00 00 00       	mov    $0x0,%eax
  802c0a:	49 b8 e1 42 80 00 00 	movabs $0x8042e1,%r8
  802c11:	00 00 00 
  802c14:	41 ff d0             	callq  *%r8
  802c17:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802c1a:	c9                   	leaveq 
  802c1b:	c3                   	retq   

0000000000802c1c <devfile_stat>:
  802c1c:	55                   	push   %rbp
  802c1d:	48 89 e5             	mov    %rsp,%rbp
  802c20:	48 83 ec 20          	sub    $0x20,%rsp
  802c24:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c28:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802c2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c30:	8b 50 0c             	mov    0xc(%rax),%edx
  802c33:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c3a:	00 00 00 
  802c3d:	89 10                	mov    %edx,(%rax)
  802c3f:	be 00 00 00 00       	mov    $0x0,%esi
  802c44:	bf 05 00 00 00       	mov    $0x5,%edi
  802c49:	48 b8 98 28 80 00 00 	movabs $0x802898,%rax
  802c50:	00 00 00 
  802c53:	ff d0                	callq  *%rax
  802c55:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c58:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c5c:	79 05                	jns    802c63 <devfile_stat+0x47>
  802c5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c61:	eb 56                	jmp    802cb9 <devfile_stat+0x9d>
  802c63:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c67:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802c6e:	00 00 00 
  802c71:	48 89 c7             	mov    %rax,%rdi
  802c74:	48 b8 22 0f 80 00 00 	movabs $0x800f22,%rax
  802c7b:	00 00 00 
  802c7e:	ff d0                	callq  *%rax
  802c80:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802c87:	00 00 00 
  802c8a:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802c90:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802c94:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802c9a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ca1:	00 00 00 
  802ca4:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802caa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802cae:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802cb4:	b8 00 00 00 00       	mov    $0x0,%eax
  802cb9:	c9                   	leaveq 
  802cba:	c3                   	retq   

0000000000802cbb <devfile_trunc>:
  802cbb:	55                   	push   %rbp
  802cbc:	48 89 e5             	mov    %rsp,%rbp
  802cbf:	48 83 ec 10          	sub    $0x10,%rsp
  802cc3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802cc7:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802cca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802cce:	8b 50 0c             	mov    0xc(%rax),%edx
  802cd1:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802cd8:	00 00 00 
  802cdb:	89 10                	mov    %edx,(%rax)
  802cdd:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ce4:	00 00 00 
  802ce7:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802cea:	89 50 04             	mov    %edx,0x4(%rax)
  802ced:	be 00 00 00 00       	mov    $0x0,%esi
  802cf2:	bf 02 00 00 00       	mov    $0x2,%edi
  802cf7:	48 b8 98 28 80 00 00 	movabs $0x802898,%rax
  802cfe:	00 00 00 
  802d01:	ff d0                	callq  *%rax
  802d03:	c9                   	leaveq 
  802d04:	c3                   	retq   

0000000000802d05 <remove>:
  802d05:	55                   	push   %rbp
  802d06:	48 89 e5             	mov    %rsp,%rbp
  802d09:	48 83 ec 10          	sub    $0x10,%rsp
  802d0d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802d11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d15:	48 89 c7             	mov    %rax,%rdi
  802d18:	48 b8 b6 0e 80 00 00 	movabs $0x800eb6,%rax
  802d1f:	00 00 00 
  802d22:	ff d0                	callq  *%rax
  802d24:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802d29:	7e 07                	jle    802d32 <remove+0x2d>
  802d2b:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802d30:	eb 33                	jmp    802d65 <remove+0x60>
  802d32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d36:	48 89 c6             	mov    %rax,%rsi
  802d39:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802d40:	00 00 00 
  802d43:	48 b8 22 0f 80 00 00 	movabs $0x800f22,%rax
  802d4a:	00 00 00 
  802d4d:	ff d0                	callq  *%rax
  802d4f:	be 00 00 00 00       	mov    $0x0,%esi
  802d54:	bf 07 00 00 00       	mov    $0x7,%edi
  802d59:	48 b8 98 28 80 00 00 	movabs $0x802898,%rax
  802d60:	00 00 00 
  802d63:	ff d0                	callq  *%rax
  802d65:	c9                   	leaveq 
  802d66:	c3                   	retq   

0000000000802d67 <sync>:
  802d67:	55                   	push   %rbp
  802d68:	48 89 e5             	mov    %rsp,%rbp
  802d6b:	be 00 00 00 00       	mov    $0x0,%esi
  802d70:	bf 08 00 00 00       	mov    $0x8,%edi
  802d75:	48 b8 98 28 80 00 00 	movabs $0x802898,%rax
  802d7c:	00 00 00 
  802d7f:	ff d0                	callq  *%rax
  802d81:	5d                   	pop    %rbp
  802d82:	c3                   	retq   

0000000000802d83 <copy>:
  802d83:	55                   	push   %rbp
  802d84:	48 89 e5             	mov    %rsp,%rbp
  802d87:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802d8e:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802d95:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802d9c:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802da3:	be 00 00 00 00       	mov    $0x0,%esi
  802da8:	48 89 c7             	mov    %rax,%rdi
  802dab:	48 b8 21 29 80 00 00 	movabs $0x802921,%rax
  802db2:	00 00 00 
  802db5:	ff d0                	callq  *%rax
  802db7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dbe:	79 28                	jns    802de8 <copy+0x65>
  802dc0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802dc3:	89 c6                	mov    %eax,%esi
  802dc5:	48 bf cc 4c 80 00 00 	movabs $0x804ccc,%rdi
  802dcc:	00 00 00 
  802dcf:	b8 00 00 00 00       	mov    $0x0,%eax
  802dd4:	48 ba 92 03 80 00 00 	movabs $0x800392,%rdx
  802ddb:	00 00 00 
  802dde:	ff d2                	callq  *%rdx
  802de0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802de3:	e9 76 01 00 00       	jmpq   802f5e <copy+0x1db>
  802de8:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802def:	be 01 01 00 00       	mov    $0x101,%esi
  802df4:	48 89 c7             	mov    %rax,%rdi
  802df7:	48 b8 21 29 80 00 00 	movabs $0x802921,%rax
  802dfe:	00 00 00 
  802e01:	ff d0                	callq  *%rax
  802e03:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802e06:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802e0a:	0f 89 ad 00 00 00    	jns    802ebd <copy+0x13a>
  802e10:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e13:	89 c6                	mov    %eax,%esi
  802e15:	48 bf e2 4c 80 00 00 	movabs $0x804ce2,%rdi
  802e1c:	00 00 00 
  802e1f:	b8 00 00 00 00       	mov    $0x0,%eax
  802e24:	48 ba 92 03 80 00 00 	movabs $0x800392,%rdx
  802e2b:	00 00 00 
  802e2e:	ff d2                	callq  *%rdx
  802e30:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e33:	89 c7                	mov    %eax,%edi
  802e35:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  802e3c:	00 00 00 
  802e3f:	ff d0                	callq  *%rax
  802e41:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e44:	e9 15 01 00 00       	jmpq   802f5e <copy+0x1db>
  802e49:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802e4c:	48 63 d0             	movslq %eax,%rdx
  802e4f:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802e56:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802e59:	48 89 ce             	mov    %rcx,%rsi
  802e5c:	89 c7                	mov    %eax,%edi
  802e5e:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  802e65:	00 00 00 
  802e68:	ff d0                	callq  *%rax
  802e6a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802e6d:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802e71:	79 4a                	jns    802ebd <copy+0x13a>
  802e73:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802e76:	89 c6                	mov    %eax,%esi
  802e78:	48 bf fc 4c 80 00 00 	movabs $0x804cfc,%rdi
  802e7f:	00 00 00 
  802e82:	b8 00 00 00 00       	mov    $0x0,%eax
  802e87:	48 ba 92 03 80 00 00 	movabs $0x800392,%rdx
  802e8e:	00 00 00 
  802e91:	ff d2                	callq  *%rdx
  802e93:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e96:	89 c7                	mov    %eax,%edi
  802e98:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  802e9f:	00 00 00 
  802ea2:	ff d0                	callq  *%rax
  802ea4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802ea7:	89 c7                	mov    %eax,%edi
  802ea9:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  802eb0:	00 00 00 
  802eb3:	ff d0                	callq  *%rax
  802eb5:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802eb8:	e9 a1 00 00 00       	jmpq   802f5e <copy+0x1db>
  802ebd:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802ec4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ec7:	ba 00 02 00 00       	mov    $0x200,%edx
  802ecc:	48 89 ce             	mov    %rcx,%rsi
  802ecf:	89 c7                	mov    %eax,%edi
  802ed1:	48 b8 48 24 80 00 00 	movabs $0x802448,%rax
  802ed8:	00 00 00 
  802edb:	ff d0                	callq  *%rax
  802edd:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802ee0:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802ee4:	0f 8f 5f ff ff ff    	jg     802e49 <copy+0xc6>
  802eea:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802eee:	79 47                	jns    802f37 <copy+0x1b4>
  802ef0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802ef3:	89 c6                	mov    %eax,%esi
  802ef5:	48 bf 0f 4d 80 00 00 	movabs $0x804d0f,%rdi
  802efc:	00 00 00 
  802eff:	b8 00 00 00 00       	mov    $0x0,%eax
  802f04:	48 ba 92 03 80 00 00 	movabs $0x800392,%rdx
  802f0b:	00 00 00 
  802f0e:	ff d2                	callq  *%rdx
  802f10:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f13:	89 c7                	mov    %eax,%edi
  802f15:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  802f1c:	00 00 00 
  802f1f:	ff d0                	callq  *%rax
  802f21:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f24:	89 c7                	mov    %eax,%edi
  802f26:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  802f2d:	00 00 00 
  802f30:	ff d0                	callq  *%rax
  802f32:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802f35:	eb 27                	jmp    802f5e <copy+0x1db>
  802f37:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f3a:	89 c7                	mov    %eax,%edi
  802f3c:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  802f43:	00 00 00 
  802f46:	ff d0                	callq  *%rax
  802f48:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802f4b:	89 c7                	mov    %eax,%edi
  802f4d:	48 b8 25 22 80 00 00 	movabs $0x802225,%rax
  802f54:	00 00 00 
  802f57:	ff d0                	callq  *%rax
  802f59:	b8 00 00 00 00       	mov    $0x0,%eax
  802f5e:	c9                   	leaveq 
  802f5f:	c3                   	retq   

0000000000802f60 <writebuf>:
  802f60:	55                   	push   %rbp
  802f61:	48 89 e5             	mov    %rsp,%rbp
  802f64:	48 83 ec 20          	sub    $0x20,%rsp
  802f68:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802f6c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f70:	8b 40 0c             	mov    0xc(%rax),%eax
  802f73:	85 c0                	test   %eax,%eax
  802f75:	7e 67                	jle    802fde <writebuf+0x7e>
  802f77:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f7b:	8b 40 04             	mov    0x4(%rax),%eax
  802f7e:	48 63 d0             	movslq %eax,%rdx
  802f81:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f85:	48 8d 48 10          	lea    0x10(%rax),%rcx
  802f89:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f8d:	8b 00                	mov    (%rax),%eax
  802f8f:	48 89 ce             	mov    %rcx,%rsi
  802f92:	89 c7                	mov    %eax,%edi
  802f94:	48 b8 93 25 80 00 00 	movabs $0x802593,%rax
  802f9b:	00 00 00 
  802f9e:	ff d0                	callq  *%rax
  802fa0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fa3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fa7:	7e 13                	jle    802fbc <writebuf+0x5c>
  802fa9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fad:	8b 50 08             	mov    0x8(%rax),%edx
  802fb0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fb3:	01 c2                	add    %eax,%edx
  802fb5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fb9:	89 50 08             	mov    %edx,0x8(%rax)
  802fbc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fc0:	8b 40 04             	mov    0x4(%rax),%eax
  802fc3:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  802fc6:	74 16                	je     802fde <writebuf+0x7e>
  802fc8:	b8 00 00 00 00       	mov    $0x0,%eax
  802fcd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fd1:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  802fd5:	89 c2                	mov    %eax,%edx
  802fd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802fdb:	89 50 0c             	mov    %edx,0xc(%rax)
  802fde:	90                   	nop
  802fdf:	c9                   	leaveq 
  802fe0:	c3                   	retq   

0000000000802fe1 <putch>:
  802fe1:	55                   	push   %rbp
  802fe2:	48 89 e5             	mov    %rsp,%rbp
  802fe5:	48 83 ec 20          	sub    $0x20,%rsp
  802fe9:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802fec:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ff0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ff4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802ff8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ffc:	8b 40 04             	mov    0x4(%rax),%eax
  802fff:	8d 48 01             	lea    0x1(%rax),%ecx
  803002:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803006:	89 4a 04             	mov    %ecx,0x4(%rdx)
  803009:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80300c:	89 d1                	mov    %edx,%ecx
  80300e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803012:	48 98                	cltq   
  803014:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  803018:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80301c:	8b 40 04             	mov    0x4(%rax),%eax
  80301f:	3d 00 01 00 00       	cmp    $0x100,%eax
  803024:	75 1e                	jne    803044 <putch+0x63>
  803026:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80302a:	48 89 c7             	mov    %rax,%rdi
  80302d:	48 b8 60 2f 80 00 00 	movabs $0x802f60,%rax
  803034:	00 00 00 
  803037:	ff d0                	callq  *%rax
  803039:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80303d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  803044:	90                   	nop
  803045:	c9                   	leaveq 
  803046:	c3                   	retq   

0000000000803047 <vfprintf>:
  803047:	55                   	push   %rbp
  803048:	48 89 e5             	mov    %rsp,%rbp
  80304b:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  803052:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  803058:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  80305f:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  803066:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  80306c:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  803072:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  803079:	00 00 00 
  80307c:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  803083:	00 00 00 
  803086:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  80308d:	00 00 00 
  803090:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  803097:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  80309e:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8030a5:	48 89 c6             	mov    %rax,%rsi
  8030a8:	48 bf e1 2f 80 00 00 	movabs $0x802fe1,%rdi
  8030af:	00 00 00 
  8030b2:	48 b8 30 07 80 00 00 	movabs $0x800730,%rax
  8030b9:	00 00 00 
  8030bc:	ff d0                	callq  *%rax
  8030be:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8030c4:	85 c0                	test   %eax,%eax
  8030c6:	7e 16                	jle    8030de <vfprintf+0x97>
  8030c8:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8030cf:	48 89 c7             	mov    %rax,%rdi
  8030d2:	48 b8 60 2f 80 00 00 	movabs $0x802f60,%rax
  8030d9:	00 00 00 
  8030dc:	ff d0                	callq  *%rax
  8030de:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  8030e4:	85 c0                	test   %eax,%eax
  8030e6:	74 08                	je     8030f0 <vfprintf+0xa9>
  8030e8:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  8030ee:	eb 06                	jmp    8030f6 <vfprintf+0xaf>
  8030f0:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  8030f6:	c9                   	leaveq 
  8030f7:	c3                   	retq   

00000000008030f8 <fprintf>:
  8030f8:	55                   	push   %rbp
  8030f9:	48 89 e5             	mov    %rsp,%rbp
  8030fc:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  803103:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  803109:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  803110:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803117:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80311e:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803125:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80312c:	84 c0                	test   %al,%al
  80312e:	74 20                	je     803150 <fprintf+0x58>
  803130:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803134:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  803138:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80313c:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803140:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803144:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803148:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80314c:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803150:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  803157:	00 00 00 
  80315a:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803161:	00 00 00 
  803164:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803168:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80316f:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  803176:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80317d:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  803184:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  80318b:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  803191:	48 89 ce             	mov    %rcx,%rsi
  803194:	89 c7                	mov    %eax,%edi
  803196:	48 b8 47 30 80 00 00 	movabs $0x803047,%rax
  80319d:	00 00 00 
  8031a0:	ff d0                	callq  *%rax
  8031a2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8031a8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8031ae:	c9                   	leaveq 
  8031af:	c3                   	retq   

00000000008031b0 <printf>:
  8031b0:	55                   	push   %rbp
  8031b1:	48 89 e5             	mov    %rsp,%rbp
  8031b4:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  8031bb:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8031c2:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8031c9:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8031d0:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8031d7:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8031de:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8031e5:	84 c0                	test   %al,%al
  8031e7:	74 20                	je     803209 <printf+0x59>
  8031e9:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8031ed:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8031f1:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8031f5:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8031f9:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8031fd:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  803201:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803205:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803209:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  803210:	00 00 00 
  803213:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  80321a:	00 00 00 
  80321d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803221:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803228:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80322f:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  803236:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80323d:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  803244:	48 89 c6             	mov    %rax,%rsi
  803247:	bf 01 00 00 00       	mov    $0x1,%edi
  80324c:	48 b8 47 30 80 00 00 	movabs $0x803047,%rax
  803253:	00 00 00 
  803256:	ff d0                	callq  *%rax
  803258:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80325e:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  803264:	c9                   	leaveq 
  803265:	c3                   	retq   

0000000000803266 <fd2sockid>:
  803266:	55                   	push   %rbp
  803267:	48 89 e5             	mov    %rsp,%rbp
  80326a:	48 83 ec 20          	sub    $0x20,%rsp
  80326e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803271:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803275:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803278:	48 89 d6             	mov    %rdx,%rsi
  80327b:	89 c7                	mov    %eax,%edi
  80327d:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  803284:	00 00 00 
  803287:	ff d0                	callq  *%rax
  803289:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80328c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803290:	79 05                	jns    803297 <fd2sockid+0x31>
  803292:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803295:	eb 24                	jmp    8032bb <fd2sockid+0x55>
  803297:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80329b:	8b 10                	mov    (%rax),%edx
  80329d:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  8032a4:	00 00 00 
  8032a7:	8b 00                	mov    (%rax),%eax
  8032a9:	39 c2                	cmp    %eax,%edx
  8032ab:	74 07                	je     8032b4 <fd2sockid+0x4e>
  8032ad:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8032b2:	eb 07                	jmp    8032bb <fd2sockid+0x55>
  8032b4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032b8:	8b 40 0c             	mov    0xc(%rax),%eax
  8032bb:	c9                   	leaveq 
  8032bc:	c3                   	retq   

00000000008032bd <alloc_sockfd>:
  8032bd:	55                   	push   %rbp
  8032be:	48 89 e5             	mov    %rsp,%rbp
  8032c1:	48 83 ec 20          	sub    $0x20,%rsp
  8032c5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8032c8:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8032cc:	48 89 c7             	mov    %rax,%rdi
  8032cf:	48 b8 7b 1f 80 00 00 	movabs $0x801f7b,%rax
  8032d6:	00 00 00 
  8032d9:	ff d0                	callq  *%rax
  8032db:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8032de:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8032e2:	78 26                	js     80330a <alloc_sockfd+0x4d>
  8032e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032e8:	ba 07 04 00 00       	mov    $0x407,%edx
  8032ed:	48 89 c6             	mov    %rax,%rsi
  8032f0:	bf 00 00 00 00       	mov    $0x0,%edi
  8032f5:	48 b8 52 18 80 00 00 	movabs $0x801852,%rax
  8032fc:	00 00 00 
  8032ff:	ff d0                	callq  *%rax
  803301:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803304:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803308:	79 16                	jns    803320 <alloc_sockfd+0x63>
  80330a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80330d:	89 c7                	mov    %eax,%edi
  80330f:	48 b8 cc 37 80 00 00 	movabs $0x8037cc,%rax
  803316:	00 00 00 
  803319:	ff d0                	callq  *%rax
  80331b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80331e:	eb 3a                	jmp    80335a <alloc_sockfd+0x9d>
  803320:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803324:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  80332b:	00 00 00 
  80332e:	8b 12                	mov    (%rdx),%edx
  803330:	89 10                	mov    %edx,(%rax)
  803332:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803336:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80333d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803341:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803344:	89 50 0c             	mov    %edx,0xc(%rax)
  803347:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80334b:	48 89 c7             	mov    %rax,%rdi
  80334e:	48 b8 2d 1f 80 00 00 	movabs $0x801f2d,%rax
  803355:	00 00 00 
  803358:	ff d0                	callq  *%rax
  80335a:	c9                   	leaveq 
  80335b:	c3                   	retq   

000000000080335c <accept>:
  80335c:	55                   	push   %rbp
  80335d:	48 89 e5             	mov    %rsp,%rbp
  803360:	48 83 ec 30          	sub    $0x30,%rsp
  803364:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803367:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80336b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80336f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803372:	89 c7                	mov    %eax,%edi
  803374:	48 b8 66 32 80 00 00 	movabs $0x803266,%rax
  80337b:	00 00 00 
  80337e:	ff d0                	callq  *%rax
  803380:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803383:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803387:	79 05                	jns    80338e <accept+0x32>
  803389:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80338c:	eb 3b                	jmp    8033c9 <accept+0x6d>
  80338e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803392:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803396:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803399:	48 89 ce             	mov    %rcx,%rsi
  80339c:	89 c7                	mov    %eax,%edi
  80339e:	48 b8 a9 36 80 00 00 	movabs $0x8036a9,%rax
  8033a5:	00 00 00 
  8033a8:	ff d0                	callq  *%rax
  8033aa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033ad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033b1:	79 05                	jns    8033b8 <accept+0x5c>
  8033b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033b6:	eb 11                	jmp    8033c9 <accept+0x6d>
  8033b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033bb:	89 c7                	mov    %eax,%edi
  8033bd:	48 b8 bd 32 80 00 00 	movabs $0x8032bd,%rax
  8033c4:	00 00 00 
  8033c7:	ff d0                	callq  *%rax
  8033c9:	c9                   	leaveq 
  8033ca:	c3                   	retq   

00000000008033cb <bind>:
  8033cb:	55                   	push   %rbp
  8033cc:	48 89 e5             	mov    %rsp,%rbp
  8033cf:	48 83 ec 20          	sub    $0x20,%rsp
  8033d3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8033d6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8033da:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8033dd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8033e0:	89 c7                	mov    %eax,%edi
  8033e2:	48 b8 66 32 80 00 00 	movabs $0x803266,%rax
  8033e9:	00 00 00 
  8033ec:	ff d0                	callq  *%rax
  8033ee:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8033f1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8033f5:	79 05                	jns    8033fc <bind+0x31>
  8033f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033fa:	eb 1b                	jmp    803417 <bind+0x4c>
  8033fc:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8033ff:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803403:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803406:	48 89 ce             	mov    %rcx,%rsi
  803409:	89 c7                	mov    %eax,%edi
  80340b:	48 b8 28 37 80 00 00 	movabs $0x803728,%rax
  803412:	00 00 00 
  803415:	ff d0                	callq  *%rax
  803417:	c9                   	leaveq 
  803418:	c3                   	retq   

0000000000803419 <shutdown>:
  803419:	55                   	push   %rbp
  80341a:	48 89 e5             	mov    %rsp,%rbp
  80341d:	48 83 ec 20          	sub    $0x20,%rsp
  803421:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803424:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803427:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80342a:	89 c7                	mov    %eax,%edi
  80342c:	48 b8 66 32 80 00 00 	movabs $0x803266,%rax
  803433:	00 00 00 
  803436:	ff d0                	callq  *%rax
  803438:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80343b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80343f:	79 05                	jns    803446 <shutdown+0x2d>
  803441:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803444:	eb 16                	jmp    80345c <shutdown+0x43>
  803446:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803449:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80344c:	89 d6                	mov    %edx,%esi
  80344e:	89 c7                	mov    %eax,%edi
  803450:	48 b8 8c 37 80 00 00 	movabs $0x80378c,%rax
  803457:	00 00 00 
  80345a:	ff d0                	callq  *%rax
  80345c:	c9                   	leaveq 
  80345d:	c3                   	retq   

000000000080345e <devsock_close>:
  80345e:	55                   	push   %rbp
  80345f:	48 89 e5             	mov    %rsp,%rbp
  803462:	48 83 ec 10          	sub    $0x10,%rsp
  803466:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80346a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80346e:	48 89 c7             	mov    %rax,%rdi
  803471:	48 b8 31 46 80 00 00 	movabs $0x804631,%rax
  803478:	00 00 00 
  80347b:	ff d0                	callq  *%rax
  80347d:	83 f8 01             	cmp    $0x1,%eax
  803480:	75 17                	jne    803499 <devsock_close+0x3b>
  803482:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803486:	8b 40 0c             	mov    0xc(%rax),%eax
  803489:	89 c7                	mov    %eax,%edi
  80348b:	48 b8 cc 37 80 00 00 	movabs $0x8037cc,%rax
  803492:	00 00 00 
  803495:	ff d0                	callq  *%rax
  803497:	eb 05                	jmp    80349e <devsock_close+0x40>
  803499:	b8 00 00 00 00       	mov    $0x0,%eax
  80349e:	c9                   	leaveq 
  80349f:	c3                   	retq   

00000000008034a0 <connect>:
  8034a0:	55                   	push   %rbp
  8034a1:	48 89 e5             	mov    %rsp,%rbp
  8034a4:	48 83 ec 20          	sub    $0x20,%rsp
  8034a8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034ab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8034af:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8034b2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034b5:	89 c7                	mov    %eax,%edi
  8034b7:	48 b8 66 32 80 00 00 	movabs $0x803266,%rax
  8034be:	00 00 00 
  8034c1:	ff d0                	callq  *%rax
  8034c3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8034c6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8034ca:	79 05                	jns    8034d1 <connect+0x31>
  8034cc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034cf:	eb 1b                	jmp    8034ec <connect+0x4c>
  8034d1:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8034d4:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  8034d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034db:	48 89 ce             	mov    %rcx,%rsi
  8034de:	89 c7                	mov    %eax,%edi
  8034e0:	48 b8 f9 37 80 00 00 	movabs $0x8037f9,%rax
  8034e7:	00 00 00 
  8034ea:	ff d0                	callq  *%rax
  8034ec:	c9                   	leaveq 
  8034ed:	c3                   	retq   

00000000008034ee <listen>:
  8034ee:	55                   	push   %rbp
  8034ef:	48 89 e5             	mov    %rsp,%rbp
  8034f2:	48 83 ec 20          	sub    $0x20,%rsp
  8034f6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8034f9:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8034fc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8034ff:	89 c7                	mov    %eax,%edi
  803501:	48 b8 66 32 80 00 00 	movabs $0x803266,%rax
  803508:	00 00 00 
  80350b:	ff d0                	callq  *%rax
  80350d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803510:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803514:	79 05                	jns    80351b <listen+0x2d>
  803516:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803519:	eb 16                	jmp    803531 <listen+0x43>
  80351b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80351e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803521:	89 d6                	mov    %edx,%esi
  803523:	89 c7                	mov    %eax,%edi
  803525:	48 b8 5d 38 80 00 00 	movabs $0x80385d,%rax
  80352c:	00 00 00 
  80352f:	ff d0                	callq  *%rax
  803531:	c9                   	leaveq 
  803532:	c3                   	retq   

0000000000803533 <devsock_read>:
  803533:	55                   	push   %rbp
  803534:	48 89 e5             	mov    %rsp,%rbp
  803537:	48 83 ec 20          	sub    $0x20,%rsp
  80353b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80353f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803543:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803547:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80354b:	89 c2                	mov    %eax,%edx
  80354d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803551:	8b 40 0c             	mov    0xc(%rax),%eax
  803554:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803558:	b9 00 00 00 00       	mov    $0x0,%ecx
  80355d:	89 c7                	mov    %eax,%edi
  80355f:	48 b8 9d 38 80 00 00 	movabs $0x80389d,%rax
  803566:	00 00 00 
  803569:	ff d0                	callq  *%rax
  80356b:	c9                   	leaveq 
  80356c:	c3                   	retq   

000000000080356d <devsock_write>:
  80356d:	55                   	push   %rbp
  80356e:	48 89 e5             	mov    %rsp,%rbp
  803571:	48 83 ec 20          	sub    $0x20,%rsp
  803575:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803579:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80357d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  803581:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803585:	89 c2                	mov    %eax,%edx
  803587:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80358b:	8b 40 0c             	mov    0xc(%rax),%eax
  80358e:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803592:	b9 00 00 00 00       	mov    $0x0,%ecx
  803597:	89 c7                	mov    %eax,%edi
  803599:	48 b8 69 39 80 00 00 	movabs $0x803969,%rax
  8035a0:	00 00 00 
  8035a3:	ff d0                	callq  *%rax
  8035a5:	c9                   	leaveq 
  8035a6:	c3                   	retq   

00000000008035a7 <devsock_stat>:
  8035a7:	55                   	push   %rbp
  8035a8:	48 89 e5             	mov    %rsp,%rbp
  8035ab:	48 83 ec 10          	sub    $0x10,%rsp
  8035af:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8035b3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8035b7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8035bb:	48 be 2a 4d 80 00 00 	movabs $0x804d2a,%rsi
  8035c2:	00 00 00 
  8035c5:	48 89 c7             	mov    %rax,%rdi
  8035c8:	48 b8 22 0f 80 00 00 	movabs $0x800f22,%rax
  8035cf:	00 00 00 
  8035d2:	ff d0                	callq  *%rax
  8035d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8035d9:	c9                   	leaveq 
  8035da:	c3                   	retq   

00000000008035db <socket>:
  8035db:	55                   	push   %rbp
  8035dc:	48 89 e5             	mov    %rsp,%rbp
  8035df:	48 83 ec 20          	sub    $0x20,%rsp
  8035e3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8035e6:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8035e9:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  8035ec:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8035ef:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  8035f2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8035f5:	89 ce                	mov    %ecx,%esi
  8035f7:	89 c7                	mov    %eax,%edi
  8035f9:	48 b8 21 3a 80 00 00 	movabs $0x803a21,%rax
  803600:	00 00 00 
  803603:	ff d0                	callq  *%rax
  803605:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803608:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80360c:	79 05                	jns    803613 <socket+0x38>
  80360e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803611:	eb 11                	jmp    803624 <socket+0x49>
  803613:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803616:	89 c7                	mov    %eax,%edi
  803618:	48 b8 bd 32 80 00 00 	movabs $0x8032bd,%rax
  80361f:	00 00 00 
  803622:	ff d0                	callq  *%rax
  803624:	c9                   	leaveq 
  803625:	c3                   	retq   

0000000000803626 <nsipc>:
  803626:	55                   	push   %rbp
  803627:	48 89 e5             	mov    %rsp,%rbp
  80362a:	48 83 ec 10          	sub    $0x10,%rsp
  80362e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803631:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803638:	00 00 00 
  80363b:	8b 00                	mov    (%rax),%eax
  80363d:	85 c0                	test   %eax,%eax
  80363f:	75 1f                	jne    803660 <nsipc+0x3a>
  803641:	bf 02 00 00 00       	mov    $0x2,%edi
  803646:	48 b8 c0 45 80 00 00 	movabs $0x8045c0,%rax
  80364d:	00 00 00 
  803650:	ff d0                	callq  *%rax
  803652:	89 c2                	mov    %eax,%edx
  803654:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  80365b:	00 00 00 
  80365e:	89 10                	mov    %edx,(%rax)
  803660:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  803667:	00 00 00 
  80366a:	8b 00                	mov    (%rax),%eax
  80366c:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80366f:	b9 07 00 00 00       	mov    $0x7,%ecx
  803674:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  80367b:	00 00 00 
  80367e:	89 c7                	mov    %eax,%edi
  803680:	48 b8 b6 44 80 00 00 	movabs $0x8044b6,%rax
  803687:	00 00 00 
  80368a:	ff d0                	callq  *%rax
  80368c:	ba 00 00 00 00       	mov    $0x0,%edx
  803691:	be 00 00 00 00       	mov    $0x0,%esi
  803696:	bf 00 00 00 00       	mov    $0x0,%edi
  80369b:	48 b8 f5 43 80 00 00 	movabs $0x8043f5,%rax
  8036a2:	00 00 00 
  8036a5:	ff d0                	callq  *%rax
  8036a7:	c9                   	leaveq 
  8036a8:	c3                   	retq   

00000000008036a9 <nsipc_accept>:
  8036a9:	55                   	push   %rbp
  8036aa:	48 89 e5             	mov    %rsp,%rbp
  8036ad:	48 83 ec 30          	sub    $0x30,%rsp
  8036b1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036b4:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8036b8:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8036bc:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036c3:	00 00 00 
  8036c6:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8036c9:	89 10                	mov    %edx,(%rax)
  8036cb:	bf 01 00 00 00       	mov    $0x1,%edi
  8036d0:	48 b8 26 36 80 00 00 	movabs $0x803626,%rax
  8036d7:	00 00 00 
  8036da:	ff d0                	callq  *%rax
  8036dc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036df:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036e3:	78 3e                	js     803723 <nsipc_accept+0x7a>
  8036e5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8036ec:	00 00 00 
  8036ef:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8036f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8036f7:	8b 40 10             	mov    0x10(%rax),%eax
  8036fa:	89 c2                	mov    %eax,%edx
  8036fc:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803700:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803704:	48 89 ce             	mov    %rcx,%rsi
  803707:	48 89 c7             	mov    %rax,%rdi
  80370a:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  803711:	00 00 00 
  803714:	ff d0                	callq  *%rax
  803716:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80371a:	8b 50 10             	mov    0x10(%rax),%edx
  80371d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803721:	89 10                	mov    %edx,(%rax)
  803723:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803726:	c9                   	leaveq 
  803727:	c3                   	retq   

0000000000803728 <nsipc_bind>:
  803728:	55                   	push   %rbp
  803729:	48 89 e5             	mov    %rsp,%rbp
  80372c:	48 83 ec 10          	sub    $0x10,%rsp
  803730:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803733:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803737:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80373a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803741:	00 00 00 
  803744:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803747:	89 10                	mov    %edx,(%rax)
  803749:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80374c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803750:	48 89 c6             	mov    %rax,%rsi
  803753:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80375a:	00 00 00 
  80375d:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  803764:	00 00 00 
  803767:	ff d0                	callq  *%rax
  803769:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803770:	00 00 00 
  803773:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803776:	89 50 14             	mov    %edx,0x14(%rax)
  803779:	bf 02 00 00 00       	mov    $0x2,%edi
  80377e:	48 b8 26 36 80 00 00 	movabs $0x803626,%rax
  803785:	00 00 00 
  803788:	ff d0                	callq  *%rax
  80378a:	c9                   	leaveq 
  80378b:	c3                   	retq   

000000000080378c <nsipc_shutdown>:
  80378c:	55                   	push   %rbp
  80378d:	48 89 e5             	mov    %rsp,%rbp
  803790:	48 83 ec 10          	sub    $0x10,%rsp
  803794:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803797:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80379a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037a1:	00 00 00 
  8037a4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8037a7:	89 10                	mov    %edx,(%rax)
  8037a9:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037b0:	00 00 00 
  8037b3:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8037b6:	89 50 04             	mov    %edx,0x4(%rax)
  8037b9:	bf 03 00 00 00       	mov    $0x3,%edi
  8037be:	48 b8 26 36 80 00 00 	movabs $0x803626,%rax
  8037c5:	00 00 00 
  8037c8:	ff d0                	callq  *%rax
  8037ca:	c9                   	leaveq 
  8037cb:	c3                   	retq   

00000000008037cc <nsipc_close>:
  8037cc:	55                   	push   %rbp
  8037cd:	48 89 e5             	mov    %rsp,%rbp
  8037d0:	48 83 ec 10          	sub    $0x10,%rsp
  8037d4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8037d7:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8037de:	00 00 00 
  8037e1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8037e4:	89 10                	mov    %edx,(%rax)
  8037e6:	bf 04 00 00 00       	mov    $0x4,%edi
  8037eb:	48 b8 26 36 80 00 00 	movabs $0x803626,%rax
  8037f2:	00 00 00 
  8037f5:	ff d0                	callq  *%rax
  8037f7:	c9                   	leaveq 
  8037f8:	c3                   	retq   

00000000008037f9 <nsipc_connect>:
  8037f9:	55                   	push   %rbp
  8037fa:	48 89 e5             	mov    %rsp,%rbp
  8037fd:	48 83 ec 10          	sub    $0x10,%rsp
  803801:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803804:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803808:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80380b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803812:	00 00 00 
  803815:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803818:	89 10                	mov    %edx,(%rax)
  80381a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80381d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803821:	48 89 c6             	mov    %rax,%rsi
  803824:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80382b:	00 00 00 
  80382e:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  803835:	00 00 00 
  803838:	ff d0                	callq  *%rax
  80383a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803841:	00 00 00 
  803844:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803847:	89 50 14             	mov    %edx,0x14(%rax)
  80384a:	bf 05 00 00 00       	mov    $0x5,%edi
  80384f:	48 b8 26 36 80 00 00 	movabs $0x803626,%rax
  803856:	00 00 00 
  803859:	ff d0                	callq  *%rax
  80385b:	c9                   	leaveq 
  80385c:	c3                   	retq   

000000000080385d <nsipc_listen>:
  80385d:	55                   	push   %rbp
  80385e:	48 89 e5             	mov    %rsp,%rbp
  803861:	48 83 ec 10          	sub    $0x10,%rsp
  803865:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803868:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80386b:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803872:	00 00 00 
  803875:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803878:	89 10                	mov    %edx,(%rax)
  80387a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803881:	00 00 00 
  803884:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803887:	89 50 04             	mov    %edx,0x4(%rax)
  80388a:	bf 06 00 00 00       	mov    $0x6,%edi
  80388f:	48 b8 26 36 80 00 00 	movabs $0x803626,%rax
  803896:	00 00 00 
  803899:	ff d0                	callq  *%rax
  80389b:	c9                   	leaveq 
  80389c:	c3                   	retq   

000000000080389d <nsipc_recv>:
  80389d:	55                   	push   %rbp
  80389e:	48 89 e5             	mov    %rsp,%rbp
  8038a1:	48 83 ec 30          	sub    $0x30,%rsp
  8038a5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8038a8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8038ac:	89 55 e8             	mov    %edx,-0x18(%rbp)
  8038af:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8038b2:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038b9:	00 00 00 
  8038bc:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8038bf:	89 10                	mov    %edx,(%rax)
  8038c1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038c8:	00 00 00 
  8038cb:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038ce:	89 50 04             	mov    %edx,0x4(%rax)
  8038d1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8038d8:	00 00 00 
  8038db:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8038de:	89 50 08             	mov    %edx,0x8(%rax)
  8038e1:	bf 07 00 00 00       	mov    $0x7,%edi
  8038e6:	48 b8 26 36 80 00 00 	movabs $0x803626,%rax
  8038ed:	00 00 00 
  8038f0:	ff d0                	callq  *%rax
  8038f2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038f5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038f9:	78 69                	js     803964 <nsipc_recv+0xc7>
  8038fb:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803902:	7f 08                	jg     80390c <nsipc_recv+0x6f>
  803904:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803907:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80390a:	7e 35                	jle    803941 <nsipc_recv+0xa4>
  80390c:	48 b9 31 4d 80 00 00 	movabs $0x804d31,%rcx
  803913:	00 00 00 
  803916:	48 ba 46 4d 80 00 00 	movabs $0x804d46,%rdx
  80391d:	00 00 00 
  803920:	be 62 00 00 00       	mov    $0x62,%esi
  803925:	48 bf 5b 4d 80 00 00 	movabs $0x804d5b,%rdi
  80392c:	00 00 00 
  80392f:	b8 00 00 00 00       	mov    $0x0,%eax
  803934:	49 b8 e1 42 80 00 00 	movabs $0x8042e1,%r8
  80393b:	00 00 00 
  80393e:	41 ff d0             	callq  *%r8
  803941:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803944:	48 63 d0             	movslq %eax,%rdx
  803947:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80394b:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  803952:	00 00 00 
  803955:	48 89 c7             	mov    %rax,%rdi
  803958:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  80395f:	00 00 00 
  803962:	ff d0                	callq  *%rax
  803964:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803967:	c9                   	leaveq 
  803968:	c3                   	retq   

0000000000803969 <nsipc_send>:
  803969:	55                   	push   %rbp
  80396a:	48 89 e5             	mov    %rsp,%rbp
  80396d:	48 83 ec 20          	sub    $0x20,%rsp
  803971:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803974:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803978:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80397b:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  80397e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803985:	00 00 00 
  803988:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80398b:	89 10                	mov    %edx,(%rax)
  80398d:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803994:	7e 35                	jle    8039cb <nsipc_send+0x62>
  803996:	48 b9 6a 4d 80 00 00 	movabs $0x804d6a,%rcx
  80399d:	00 00 00 
  8039a0:	48 ba 46 4d 80 00 00 	movabs $0x804d46,%rdx
  8039a7:	00 00 00 
  8039aa:	be 6d 00 00 00       	mov    $0x6d,%esi
  8039af:	48 bf 5b 4d 80 00 00 	movabs $0x804d5b,%rdi
  8039b6:	00 00 00 
  8039b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8039be:	49 b8 e1 42 80 00 00 	movabs $0x8042e1,%r8
  8039c5:	00 00 00 
  8039c8:	41 ff d0             	callq  *%r8
  8039cb:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8039ce:	48 63 d0             	movslq %eax,%rdx
  8039d1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039d5:	48 89 c6             	mov    %rax,%rsi
  8039d8:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  8039df:	00 00 00 
  8039e2:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  8039e9:	00 00 00 
  8039ec:	ff d0                	callq  *%rax
  8039ee:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8039f5:	00 00 00 
  8039f8:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8039fb:	89 50 04             	mov    %edx,0x4(%rax)
  8039fe:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a05:	00 00 00 
  803a08:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803a0b:	89 50 08             	mov    %edx,0x8(%rax)
  803a0e:	bf 08 00 00 00       	mov    $0x8,%edi
  803a13:	48 b8 26 36 80 00 00 	movabs $0x803626,%rax
  803a1a:	00 00 00 
  803a1d:	ff d0                	callq  *%rax
  803a1f:	c9                   	leaveq 
  803a20:	c3                   	retq   

0000000000803a21 <nsipc_socket>:
  803a21:	55                   	push   %rbp
  803a22:	48 89 e5             	mov    %rsp,%rbp
  803a25:	48 83 ec 10          	sub    $0x10,%rsp
  803a29:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a2c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803a2f:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803a32:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a39:	00 00 00 
  803a3c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803a3f:	89 10                	mov    %edx,(%rax)
  803a41:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a48:	00 00 00 
  803a4b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803a4e:	89 50 04             	mov    %edx,0x4(%rax)
  803a51:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803a58:	00 00 00 
  803a5b:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803a5e:	89 50 08             	mov    %edx,0x8(%rax)
  803a61:	bf 09 00 00 00       	mov    $0x9,%edi
  803a66:	48 b8 26 36 80 00 00 	movabs $0x803626,%rax
  803a6d:	00 00 00 
  803a70:	ff d0                	callq  *%rax
  803a72:	c9                   	leaveq 
  803a73:	c3                   	retq   

0000000000803a74 <pipe>:
  803a74:	55                   	push   %rbp
  803a75:	48 89 e5             	mov    %rsp,%rbp
  803a78:	53                   	push   %rbx
  803a79:	48 83 ec 38          	sub    $0x38,%rsp
  803a7d:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803a81:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803a85:	48 89 c7             	mov    %rax,%rdi
  803a88:	48 b8 7b 1f 80 00 00 	movabs $0x801f7b,%rax
  803a8f:	00 00 00 
  803a92:	ff d0                	callq  *%rax
  803a94:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a97:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a9b:	0f 88 bf 01 00 00    	js     803c60 <pipe+0x1ec>
  803aa1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803aa5:	ba 07 04 00 00       	mov    $0x407,%edx
  803aaa:	48 89 c6             	mov    %rax,%rsi
  803aad:	bf 00 00 00 00       	mov    $0x0,%edi
  803ab2:	48 b8 52 18 80 00 00 	movabs $0x801852,%rax
  803ab9:	00 00 00 
  803abc:	ff d0                	callq  *%rax
  803abe:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ac1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ac5:	0f 88 95 01 00 00    	js     803c60 <pipe+0x1ec>
  803acb:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803acf:	48 89 c7             	mov    %rax,%rdi
  803ad2:	48 b8 7b 1f 80 00 00 	movabs $0x801f7b,%rax
  803ad9:	00 00 00 
  803adc:	ff d0                	callq  *%rax
  803ade:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ae1:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ae5:	0f 88 5d 01 00 00    	js     803c48 <pipe+0x1d4>
  803aeb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803aef:	ba 07 04 00 00       	mov    $0x407,%edx
  803af4:	48 89 c6             	mov    %rax,%rsi
  803af7:	bf 00 00 00 00       	mov    $0x0,%edi
  803afc:	48 b8 52 18 80 00 00 	movabs $0x801852,%rax
  803b03:	00 00 00 
  803b06:	ff d0                	callq  *%rax
  803b08:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b0b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b0f:	0f 88 33 01 00 00    	js     803c48 <pipe+0x1d4>
  803b15:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b19:	48 89 c7             	mov    %rax,%rdi
  803b1c:	48 b8 50 1f 80 00 00 	movabs $0x801f50,%rax
  803b23:	00 00 00 
  803b26:	ff d0                	callq  *%rax
  803b28:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803b2c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b30:	ba 07 04 00 00       	mov    $0x407,%edx
  803b35:	48 89 c6             	mov    %rax,%rsi
  803b38:	bf 00 00 00 00       	mov    $0x0,%edi
  803b3d:	48 b8 52 18 80 00 00 	movabs $0x801852,%rax
  803b44:	00 00 00 
  803b47:	ff d0                	callq  *%rax
  803b49:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b4c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b50:	0f 88 d9 00 00 00    	js     803c2f <pipe+0x1bb>
  803b56:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b5a:	48 89 c7             	mov    %rax,%rdi
  803b5d:	48 b8 50 1f 80 00 00 	movabs $0x801f50,%rax
  803b64:	00 00 00 
  803b67:	ff d0                	callq  *%rax
  803b69:	48 89 c2             	mov    %rax,%rdx
  803b6c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b70:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803b76:	48 89 d1             	mov    %rdx,%rcx
  803b79:	ba 00 00 00 00       	mov    $0x0,%edx
  803b7e:	48 89 c6             	mov    %rax,%rsi
  803b81:	bf 00 00 00 00       	mov    $0x0,%edi
  803b86:	48 b8 a4 18 80 00 00 	movabs $0x8018a4,%rax
  803b8d:	00 00 00 
  803b90:	ff d0                	callq  *%rax
  803b92:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803b95:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803b99:	78 79                	js     803c14 <pipe+0x1a0>
  803b9b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b9f:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803ba6:	00 00 00 
  803ba9:	8b 12                	mov    (%rdx),%edx
  803bab:	89 10                	mov    %edx,(%rax)
  803bad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bb1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  803bb8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bbc:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803bc3:	00 00 00 
  803bc6:	8b 12                	mov    (%rdx),%edx
  803bc8:	89 10                	mov    %edx,(%rax)
  803bca:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bce:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803bd5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803bd9:	48 89 c7             	mov    %rax,%rdi
  803bdc:	48 b8 2d 1f 80 00 00 	movabs $0x801f2d,%rax
  803be3:	00 00 00 
  803be6:	ff d0                	callq  *%rax
  803be8:	89 c2                	mov    %eax,%edx
  803bea:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803bee:	89 10                	mov    %edx,(%rax)
  803bf0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803bf4:	48 8d 58 04          	lea    0x4(%rax),%rbx
  803bf8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803bfc:	48 89 c7             	mov    %rax,%rdi
  803bff:	48 b8 2d 1f 80 00 00 	movabs $0x801f2d,%rax
  803c06:	00 00 00 
  803c09:	ff d0                	callq  *%rax
  803c0b:	89 03                	mov    %eax,(%rbx)
  803c0d:	b8 00 00 00 00       	mov    $0x0,%eax
  803c12:	eb 4f                	jmp    803c63 <pipe+0x1ef>
  803c14:	90                   	nop
  803c15:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803c19:	48 89 c6             	mov    %rax,%rsi
  803c1c:	bf 00 00 00 00       	mov    $0x0,%edi
  803c21:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  803c28:	00 00 00 
  803c2b:	ff d0                	callq  *%rax
  803c2d:	eb 01                	jmp    803c30 <pipe+0x1bc>
  803c2f:	90                   	nop
  803c30:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c34:	48 89 c6             	mov    %rax,%rsi
  803c37:	bf 00 00 00 00       	mov    $0x0,%edi
  803c3c:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  803c43:	00 00 00 
  803c46:	ff d0                	callq  *%rax
  803c48:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c4c:	48 89 c6             	mov    %rax,%rsi
  803c4f:	bf 00 00 00 00       	mov    $0x0,%edi
  803c54:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  803c5b:	00 00 00 
  803c5e:	ff d0                	callq  *%rax
  803c60:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c63:	48 83 c4 38          	add    $0x38,%rsp
  803c67:	5b                   	pop    %rbx
  803c68:	5d                   	pop    %rbp
  803c69:	c3                   	retq   

0000000000803c6a <_pipeisclosed>:
  803c6a:	55                   	push   %rbp
  803c6b:	48 89 e5             	mov    %rsp,%rbp
  803c6e:	53                   	push   %rbx
  803c6f:	48 83 ec 28          	sub    $0x28,%rsp
  803c73:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803c77:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803c7b:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803c82:	00 00 00 
  803c85:	48 8b 00             	mov    (%rax),%rax
  803c88:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803c8e:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803c91:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803c95:	48 89 c7             	mov    %rax,%rdi
  803c98:	48 b8 31 46 80 00 00 	movabs $0x804631,%rax
  803c9f:	00 00 00 
  803ca2:	ff d0                	callq  *%rax
  803ca4:	89 c3                	mov    %eax,%ebx
  803ca6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803caa:	48 89 c7             	mov    %rax,%rdi
  803cad:	48 b8 31 46 80 00 00 	movabs $0x804631,%rax
  803cb4:	00 00 00 
  803cb7:	ff d0                	callq  *%rax
  803cb9:	39 c3                	cmp    %eax,%ebx
  803cbb:	0f 94 c0             	sete   %al
  803cbe:	0f b6 c0             	movzbl %al,%eax
  803cc1:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803cc4:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803ccb:	00 00 00 
  803cce:	48 8b 00             	mov    (%rax),%rax
  803cd1:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803cd7:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  803cda:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cdd:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803ce0:	75 05                	jne    803ce7 <_pipeisclosed+0x7d>
  803ce2:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803ce5:	eb 4a                	jmp    803d31 <_pipeisclosed+0xc7>
  803ce7:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803cea:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803ced:	74 8c                	je     803c7b <_pipeisclosed+0x11>
  803cef:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803cf3:	75 86                	jne    803c7b <_pipeisclosed+0x11>
  803cf5:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  803cfc:	00 00 00 
  803cff:	48 8b 00             	mov    (%rax),%rax
  803d02:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  803d08:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803d0b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803d0e:	89 c6                	mov    %eax,%esi
  803d10:	48 bf 7b 4d 80 00 00 	movabs $0x804d7b,%rdi
  803d17:	00 00 00 
  803d1a:	b8 00 00 00 00       	mov    $0x0,%eax
  803d1f:	49 b8 92 03 80 00 00 	movabs $0x800392,%r8
  803d26:	00 00 00 
  803d29:	41 ff d0             	callq  *%r8
  803d2c:	e9 4a ff ff ff       	jmpq   803c7b <_pipeisclosed+0x11>
  803d31:	48 83 c4 28          	add    $0x28,%rsp
  803d35:	5b                   	pop    %rbx
  803d36:	5d                   	pop    %rbp
  803d37:	c3                   	retq   

0000000000803d38 <pipeisclosed>:
  803d38:	55                   	push   %rbp
  803d39:	48 89 e5             	mov    %rsp,%rbp
  803d3c:	48 83 ec 30          	sub    $0x30,%rsp
  803d40:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803d43:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  803d47:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803d4a:	48 89 d6             	mov    %rdx,%rsi
  803d4d:	89 c7                	mov    %eax,%edi
  803d4f:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  803d56:	00 00 00 
  803d59:	ff d0                	callq  *%rax
  803d5b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d5e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d62:	79 05                	jns    803d69 <pipeisclosed+0x31>
  803d64:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d67:	eb 31                	jmp    803d9a <pipeisclosed+0x62>
  803d69:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d6d:	48 89 c7             	mov    %rax,%rdi
  803d70:	48 b8 50 1f 80 00 00 	movabs $0x801f50,%rax
  803d77:	00 00 00 
  803d7a:	ff d0                	callq  *%rax
  803d7c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d80:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d84:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803d88:	48 89 d6             	mov    %rdx,%rsi
  803d8b:	48 89 c7             	mov    %rax,%rdi
  803d8e:	48 b8 6a 3c 80 00 00 	movabs $0x803c6a,%rax
  803d95:	00 00 00 
  803d98:	ff d0                	callq  *%rax
  803d9a:	c9                   	leaveq 
  803d9b:	c3                   	retq   

0000000000803d9c <devpipe_read>:
  803d9c:	55                   	push   %rbp
  803d9d:	48 89 e5             	mov    %rsp,%rbp
  803da0:	48 83 ec 40          	sub    $0x40,%rsp
  803da4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803da8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803dac:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803db0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803db4:	48 89 c7             	mov    %rax,%rdi
  803db7:	48 b8 50 1f 80 00 00 	movabs $0x801f50,%rax
  803dbe:	00 00 00 
  803dc1:	ff d0                	callq  *%rax
  803dc3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803dc7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803dcb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803dcf:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803dd6:	00 
  803dd7:	e9 90 00 00 00       	jmpq   803e6c <devpipe_read+0xd0>
  803ddc:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803de1:	74 09                	je     803dec <devpipe_read+0x50>
  803de3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803de7:	e9 8e 00 00 00       	jmpq   803e7a <devpipe_read+0xde>
  803dec:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803df0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803df4:	48 89 d6             	mov    %rdx,%rsi
  803df7:	48 89 c7             	mov    %rax,%rdi
  803dfa:	48 b8 6a 3c 80 00 00 	movabs $0x803c6a,%rax
  803e01:	00 00 00 
  803e04:	ff d0                	callq  *%rax
  803e06:	85 c0                	test   %eax,%eax
  803e08:	74 07                	je     803e11 <devpipe_read+0x75>
  803e0a:	b8 00 00 00 00       	mov    $0x0,%eax
  803e0f:	eb 69                	jmp    803e7a <devpipe_read+0xde>
  803e11:	48 b8 15 18 80 00 00 	movabs $0x801815,%rax
  803e18:	00 00 00 
  803e1b:	ff d0                	callq  *%rax
  803e1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e21:	8b 10                	mov    (%rax),%edx
  803e23:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e27:	8b 40 04             	mov    0x4(%rax),%eax
  803e2a:	39 c2                	cmp    %eax,%edx
  803e2c:	74 ae                	je     803ddc <devpipe_read+0x40>
  803e2e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803e32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e36:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  803e3a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e3e:	8b 00                	mov    (%rax),%eax
  803e40:	99                   	cltd   
  803e41:	c1 ea 1b             	shr    $0x1b,%edx
  803e44:	01 d0                	add    %edx,%eax
  803e46:	83 e0 1f             	and    $0x1f,%eax
  803e49:	29 d0                	sub    %edx,%eax
  803e4b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803e4f:	48 98                	cltq   
  803e51:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  803e56:	88 01                	mov    %al,(%rcx)
  803e58:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e5c:	8b 00                	mov    (%rax),%eax
  803e5e:	8d 50 01             	lea    0x1(%rax),%edx
  803e61:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e65:	89 10                	mov    %edx,(%rax)
  803e67:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803e6c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e70:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803e74:	72 a7                	jb     803e1d <devpipe_read+0x81>
  803e76:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803e7a:	c9                   	leaveq 
  803e7b:	c3                   	retq   

0000000000803e7c <devpipe_write>:
  803e7c:	55                   	push   %rbp
  803e7d:	48 89 e5             	mov    %rsp,%rbp
  803e80:	48 83 ec 40          	sub    $0x40,%rsp
  803e84:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  803e88:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803e8c:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803e90:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803e94:	48 89 c7             	mov    %rax,%rdi
  803e97:	48 b8 50 1f 80 00 00 	movabs $0x801f50,%rax
  803e9e:	00 00 00 
  803ea1:	ff d0                	callq  *%rax
  803ea3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803ea7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803eab:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803eaf:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803eb6:	00 
  803eb7:	e9 8f 00 00 00       	jmpq   803f4b <devpipe_write+0xcf>
  803ebc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803ec0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803ec4:	48 89 d6             	mov    %rdx,%rsi
  803ec7:	48 89 c7             	mov    %rax,%rdi
  803eca:	48 b8 6a 3c 80 00 00 	movabs $0x803c6a,%rax
  803ed1:	00 00 00 
  803ed4:	ff d0                	callq  *%rax
  803ed6:	85 c0                	test   %eax,%eax
  803ed8:	74 07                	je     803ee1 <devpipe_write+0x65>
  803eda:	b8 00 00 00 00       	mov    $0x0,%eax
  803edf:	eb 78                	jmp    803f59 <devpipe_write+0xdd>
  803ee1:	48 b8 15 18 80 00 00 	movabs $0x801815,%rax
  803ee8:	00 00 00 
  803eeb:	ff d0                	callq  *%rax
  803eed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ef1:	8b 40 04             	mov    0x4(%rax),%eax
  803ef4:	48 63 d0             	movslq %eax,%rdx
  803ef7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803efb:	8b 00                	mov    (%rax),%eax
  803efd:	48 98                	cltq   
  803eff:	48 83 c0 20          	add    $0x20,%rax
  803f03:	48 39 c2             	cmp    %rax,%rdx
  803f06:	73 b4                	jae    803ebc <devpipe_write+0x40>
  803f08:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f0c:	8b 40 04             	mov    0x4(%rax),%eax
  803f0f:	99                   	cltd   
  803f10:	c1 ea 1b             	shr    $0x1b,%edx
  803f13:	01 d0                	add    %edx,%eax
  803f15:	83 e0 1f             	and    $0x1f,%eax
  803f18:	29 d0                	sub    %edx,%eax
  803f1a:	89 c6                	mov    %eax,%esi
  803f1c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803f20:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f24:	48 01 d0             	add    %rdx,%rax
  803f27:	0f b6 08             	movzbl (%rax),%ecx
  803f2a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803f2e:	48 63 c6             	movslq %esi,%rax
  803f31:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803f35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f39:	8b 40 04             	mov    0x4(%rax),%eax
  803f3c:	8d 50 01             	lea    0x1(%rax),%edx
  803f3f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803f43:	89 50 04             	mov    %edx,0x4(%rax)
  803f46:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803f4b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f4f:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803f53:	72 98                	jb     803eed <devpipe_write+0x71>
  803f55:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803f59:	c9                   	leaveq 
  803f5a:	c3                   	retq   

0000000000803f5b <devpipe_stat>:
  803f5b:	55                   	push   %rbp
  803f5c:	48 89 e5             	mov    %rsp,%rbp
  803f5f:	48 83 ec 20          	sub    $0x20,%rsp
  803f63:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f67:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f6b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803f6f:	48 89 c7             	mov    %rax,%rdi
  803f72:	48 b8 50 1f 80 00 00 	movabs $0x801f50,%rax
  803f79:	00 00 00 
  803f7c:	ff d0                	callq  *%rax
  803f7e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803f82:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f86:	48 be 8e 4d 80 00 00 	movabs $0x804d8e,%rsi
  803f8d:	00 00 00 
  803f90:	48 89 c7             	mov    %rax,%rdi
  803f93:	48 b8 22 0f 80 00 00 	movabs $0x800f22,%rax
  803f9a:	00 00 00 
  803f9d:	ff d0                	callq  *%rax
  803f9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fa3:	8b 50 04             	mov    0x4(%rax),%edx
  803fa6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803faa:	8b 00                	mov    (%rax),%eax
  803fac:	29 c2                	sub    %eax,%edx
  803fae:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fb2:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803fb8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fbc:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803fc3:	00 00 00 
  803fc6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fca:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803fd1:	00 00 00 
  803fd4:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803fdb:	b8 00 00 00 00       	mov    $0x0,%eax
  803fe0:	c9                   	leaveq 
  803fe1:	c3                   	retq   

0000000000803fe2 <devpipe_close>:
  803fe2:	55                   	push   %rbp
  803fe3:	48 89 e5             	mov    %rsp,%rbp
  803fe6:	48 83 ec 10          	sub    $0x10,%rsp
  803fea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803fee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ff2:	48 89 c6             	mov    %rax,%rsi
  803ff5:	bf 00 00 00 00       	mov    $0x0,%edi
  803ffa:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  804001:	00 00 00 
  804004:	ff d0                	callq  *%rax
  804006:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80400a:	48 89 c7             	mov    %rax,%rdi
  80400d:	48 b8 50 1f 80 00 00 	movabs $0x801f50,%rax
  804014:	00 00 00 
  804017:	ff d0                	callq  *%rax
  804019:	48 89 c6             	mov    %rax,%rsi
  80401c:	bf 00 00 00 00       	mov    $0x0,%edi
  804021:	48 b8 04 19 80 00 00 	movabs $0x801904,%rax
  804028:	00 00 00 
  80402b:	ff d0                	callq  *%rax
  80402d:	c9                   	leaveq 
  80402e:	c3                   	retq   

000000000080402f <cputchar>:
  80402f:	55                   	push   %rbp
  804030:	48 89 e5             	mov    %rsp,%rbp
  804033:	48 83 ec 20          	sub    $0x20,%rsp
  804037:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80403a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80403d:	88 45 ff             	mov    %al,-0x1(%rbp)
  804040:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  804044:	be 01 00 00 00       	mov    $0x1,%esi
  804049:	48 89 c7             	mov    %rax,%rdi
  80404c:	48 b8 0a 17 80 00 00 	movabs $0x80170a,%rax
  804053:	00 00 00 
  804056:	ff d0                	callq  *%rax
  804058:	90                   	nop
  804059:	c9                   	leaveq 
  80405a:	c3                   	retq   

000000000080405b <getchar>:
  80405b:	55                   	push   %rbp
  80405c:	48 89 e5             	mov    %rsp,%rbp
  80405f:	48 83 ec 10          	sub    $0x10,%rsp
  804063:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  804067:	ba 01 00 00 00       	mov    $0x1,%edx
  80406c:	48 89 c6             	mov    %rax,%rsi
  80406f:	bf 00 00 00 00       	mov    $0x0,%edi
  804074:	48 b8 48 24 80 00 00 	movabs $0x802448,%rax
  80407b:	00 00 00 
  80407e:	ff d0                	callq  *%rax
  804080:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804083:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804087:	79 05                	jns    80408e <getchar+0x33>
  804089:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80408c:	eb 14                	jmp    8040a2 <getchar+0x47>
  80408e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804092:	7f 07                	jg     80409b <getchar+0x40>
  804094:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804099:	eb 07                	jmp    8040a2 <getchar+0x47>
  80409b:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  80409f:	0f b6 c0             	movzbl %al,%eax
  8040a2:	c9                   	leaveq 
  8040a3:	c3                   	retq   

00000000008040a4 <iscons>:
  8040a4:	55                   	push   %rbp
  8040a5:	48 89 e5             	mov    %rsp,%rbp
  8040a8:	48 83 ec 20          	sub    $0x20,%rsp
  8040ac:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8040af:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8040b3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040b6:	48 89 d6             	mov    %rdx,%rsi
  8040b9:	89 c7                	mov    %eax,%edi
  8040bb:	48 b8 13 20 80 00 00 	movabs $0x802013,%rax
  8040c2:	00 00 00 
  8040c5:	ff d0                	callq  *%rax
  8040c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8040ca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8040ce:	79 05                	jns    8040d5 <iscons+0x31>
  8040d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040d3:	eb 1a                	jmp    8040ef <iscons+0x4b>
  8040d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8040d9:	8b 10                	mov    (%rax),%edx
  8040db:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  8040e2:	00 00 00 
  8040e5:	8b 00                	mov    (%rax),%eax
  8040e7:	39 c2                	cmp    %eax,%edx
  8040e9:	0f 94 c0             	sete   %al
  8040ec:	0f b6 c0             	movzbl %al,%eax
  8040ef:	c9                   	leaveq 
  8040f0:	c3                   	retq   

00000000008040f1 <opencons>:
  8040f1:	55                   	push   %rbp
  8040f2:	48 89 e5             	mov    %rsp,%rbp
  8040f5:	48 83 ec 10          	sub    $0x10,%rsp
  8040f9:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8040fd:	48 89 c7             	mov    %rax,%rdi
  804100:	48 b8 7b 1f 80 00 00 	movabs $0x801f7b,%rax
  804107:	00 00 00 
  80410a:	ff d0                	callq  *%rax
  80410c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80410f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804113:	79 05                	jns    80411a <opencons+0x29>
  804115:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804118:	eb 5b                	jmp    804175 <opencons+0x84>
  80411a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80411e:	ba 07 04 00 00       	mov    $0x407,%edx
  804123:	48 89 c6             	mov    %rax,%rsi
  804126:	bf 00 00 00 00       	mov    $0x0,%edi
  80412b:	48 b8 52 18 80 00 00 	movabs $0x801852,%rax
  804132:	00 00 00 
  804135:	ff d0                	callq  *%rax
  804137:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80413a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80413e:	79 05                	jns    804145 <opencons+0x54>
  804140:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804143:	eb 30                	jmp    804175 <opencons+0x84>
  804145:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804149:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  804150:	00 00 00 
  804153:	8b 12                	mov    (%rdx),%edx
  804155:	89 10                	mov    %edx,(%rax)
  804157:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80415b:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  804162:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804166:	48 89 c7             	mov    %rax,%rdi
  804169:	48 b8 2d 1f 80 00 00 	movabs $0x801f2d,%rax
  804170:	00 00 00 
  804173:	ff d0                	callq  *%rax
  804175:	c9                   	leaveq 
  804176:	c3                   	retq   

0000000000804177 <devcons_read>:
  804177:	55                   	push   %rbp
  804178:	48 89 e5             	mov    %rsp,%rbp
  80417b:	48 83 ec 30          	sub    $0x30,%rsp
  80417f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804183:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804187:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80418b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804190:	75 13                	jne    8041a5 <devcons_read+0x2e>
  804192:	b8 00 00 00 00       	mov    $0x0,%eax
  804197:	eb 49                	jmp    8041e2 <devcons_read+0x6b>
  804199:	48 b8 15 18 80 00 00 	movabs $0x801815,%rax
  8041a0:	00 00 00 
  8041a3:	ff d0                	callq  *%rax
  8041a5:	48 b8 57 17 80 00 00 	movabs $0x801757,%rax
  8041ac:	00 00 00 
  8041af:	ff d0                	callq  *%rax
  8041b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041b4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041b8:	74 df                	je     804199 <devcons_read+0x22>
  8041ba:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041be:	79 05                	jns    8041c5 <devcons_read+0x4e>
  8041c0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041c3:	eb 1d                	jmp    8041e2 <devcons_read+0x6b>
  8041c5:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  8041c9:	75 07                	jne    8041d2 <devcons_read+0x5b>
  8041cb:	b8 00 00 00 00       	mov    $0x0,%eax
  8041d0:	eb 10                	jmp    8041e2 <devcons_read+0x6b>
  8041d2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041d5:	89 c2                	mov    %eax,%edx
  8041d7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8041db:	88 10                	mov    %dl,(%rax)
  8041dd:	b8 01 00 00 00       	mov    $0x1,%eax
  8041e2:	c9                   	leaveq 
  8041e3:	c3                   	retq   

00000000008041e4 <devcons_write>:
  8041e4:	55                   	push   %rbp
  8041e5:	48 89 e5             	mov    %rsp,%rbp
  8041e8:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8041ef:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8041f6:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8041fd:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804204:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80420b:	eb 76                	jmp    804283 <devcons_write+0x9f>
  80420d:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804214:	89 c2                	mov    %eax,%edx
  804216:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804219:	29 c2                	sub    %eax,%edx
  80421b:	89 d0                	mov    %edx,%eax
  80421d:	89 45 f8             	mov    %eax,-0x8(%rbp)
  804220:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804223:	83 f8 7f             	cmp    $0x7f,%eax
  804226:	76 07                	jbe    80422f <devcons_write+0x4b>
  804228:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80422f:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804232:	48 63 d0             	movslq %eax,%rdx
  804235:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804238:	48 63 c8             	movslq %eax,%rcx
  80423b:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  804242:	48 01 c1             	add    %rax,%rcx
  804245:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80424c:	48 89 ce             	mov    %rcx,%rsi
  80424f:	48 89 c7             	mov    %rax,%rdi
  804252:	48 b8 47 12 80 00 00 	movabs $0x801247,%rax
  804259:	00 00 00 
  80425c:	ff d0                	callq  *%rax
  80425e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804261:	48 63 d0             	movslq %eax,%rdx
  804264:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  80426b:	48 89 d6             	mov    %rdx,%rsi
  80426e:	48 89 c7             	mov    %rax,%rdi
  804271:	48 b8 0a 17 80 00 00 	movabs $0x80170a,%rax
  804278:	00 00 00 
  80427b:	ff d0                	callq  *%rax
  80427d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804280:	01 45 fc             	add    %eax,-0x4(%rbp)
  804283:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804286:	48 98                	cltq   
  804288:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  80428f:	0f 82 78 ff ff ff    	jb     80420d <devcons_write+0x29>
  804295:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804298:	c9                   	leaveq 
  804299:	c3                   	retq   

000000000080429a <devcons_close>:
  80429a:	55                   	push   %rbp
  80429b:	48 89 e5             	mov    %rsp,%rbp
  80429e:	48 83 ec 08          	sub    $0x8,%rsp
  8042a2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8042a6:	b8 00 00 00 00       	mov    $0x0,%eax
  8042ab:	c9                   	leaveq 
  8042ac:	c3                   	retq   

00000000008042ad <devcons_stat>:
  8042ad:	55                   	push   %rbp
  8042ae:	48 89 e5             	mov    %rsp,%rbp
  8042b1:	48 83 ec 10          	sub    $0x10,%rsp
  8042b5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8042b9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8042bd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042c1:	48 be 9a 4d 80 00 00 	movabs $0x804d9a,%rsi
  8042c8:	00 00 00 
  8042cb:	48 89 c7             	mov    %rax,%rdi
  8042ce:	48 b8 22 0f 80 00 00 	movabs $0x800f22,%rax
  8042d5:	00 00 00 
  8042d8:	ff d0                	callq  *%rax
  8042da:	b8 00 00 00 00       	mov    $0x0,%eax
  8042df:	c9                   	leaveq 
  8042e0:	c3                   	retq   

00000000008042e1 <_panic>:
  8042e1:	55                   	push   %rbp
  8042e2:	48 89 e5             	mov    %rsp,%rbp
  8042e5:	53                   	push   %rbx
  8042e6:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8042ed:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8042f4:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8042fa:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  804301:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  804308:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  80430f:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  804316:	84 c0                	test   %al,%al
  804318:	74 23                	je     80433d <_panic+0x5c>
  80431a:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  804321:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  804325:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  804329:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80432d:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  804331:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  804335:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  804339:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  80433d:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  804344:	00 00 00 
  804347:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  80434e:	00 00 00 
  804351:	48 8d 45 10          	lea    0x10(%rbp),%rax
  804355:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80435c:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  804363:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80436a:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  804371:	00 00 00 
  804374:	48 8b 18             	mov    (%rax),%rbx
  804377:	48 b8 d9 17 80 00 00 	movabs $0x8017d9,%rax
  80437e:	00 00 00 
  804381:	ff d0                	callq  *%rax
  804383:	89 c6                	mov    %eax,%esi
  804385:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  80438b:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  804392:	41 89 d0             	mov    %edx,%r8d
  804395:	48 89 c1             	mov    %rax,%rcx
  804398:	48 89 da             	mov    %rbx,%rdx
  80439b:	48 bf a8 4d 80 00 00 	movabs $0x804da8,%rdi
  8043a2:	00 00 00 
  8043a5:	b8 00 00 00 00       	mov    $0x0,%eax
  8043aa:	49 b9 92 03 80 00 00 	movabs $0x800392,%r9
  8043b1:	00 00 00 
  8043b4:	41 ff d1             	callq  *%r9
  8043b7:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8043be:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8043c5:	48 89 d6             	mov    %rdx,%rsi
  8043c8:	48 89 c7             	mov    %rax,%rdi
  8043cb:	48 b8 e6 02 80 00 00 	movabs $0x8002e6,%rax
  8043d2:	00 00 00 
  8043d5:	ff d0                	callq  *%rax
  8043d7:	48 bf cb 4d 80 00 00 	movabs $0x804dcb,%rdi
  8043de:	00 00 00 
  8043e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8043e6:	48 ba 92 03 80 00 00 	movabs $0x800392,%rdx
  8043ed:	00 00 00 
  8043f0:	ff d2                	callq  *%rdx
  8043f2:	cc                   	int3   
  8043f3:	eb fd                	jmp    8043f2 <_panic+0x111>

00000000008043f5 <ipc_recv>:
  8043f5:	55                   	push   %rbp
  8043f6:	48 89 e5             	mov    %rsp,%rbp
  8043f9:	48 83 ec 30          	sub    $0x30,%rsp
  8043fd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804401:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804405:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804409:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80440e:	75 0e                	jne    80441e <ipc_recv+0x29>
  804410:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804417:	00 00 00 
  80441a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80441e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804422:	48 89 c7             	mov    %rax,%rdi
  804425:	48 b8 8c 1a 80 00 00 	movabs $0x801a8c,%rax
  80442c:	00 00 00 
  80442f:	ff d0                	callq  *%rax
  804431:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804434:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804438:	79 27                	jns    804461 <ipc_recv+0x6c>
  80443a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80443f:	74 0a                	je     80444b <ipc_recv+0x56>
  804441:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804445:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80444b:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804450:	74 0a                	je     80445c <ipc_recv+0x67>
  804452:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804456:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80445c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80445f:	eb 53                	jmp    8044b4 <ipc_recv+0xbf>
  804461:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804466:	74 19                	je     804481 <ipc_recv+0x8c>
  804468:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80446f:	00 00 00 
  804472:	48 8b 00             	mov    (%rax),%rax
  804475:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  80447b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80447f:	89 10                	mov    %edx,(%rax)
  804481:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804486:	74 19                	je     8044a1 <ipc_recv+0xac>
  804488:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  80448f:	00 00 00 
  804492:	48 8b 00             	mov    (%rax),%rax
  804495:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80449b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80449f:	89 10                	mov    %edx,(%rax)
  8044a1:	48 b8 08 70 80 00 00 	movabs $0x807008,%rax
  8044a8:	00 00 00 
  8044ab:	48 8b 00             	mov    (%rax),%rax
  8044ae:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  8044b4:	c9                   	leaveq 
  8044b5:	c3                   	retq   

00000000008044b6 <ipc_send>:
  8044b6:	55                   	push   %rbp
  8044b7:	48 89 e5             	mov    %rsp,%rbp
  8044ba:	48 83 ec 30          	sub    $0x30,%rsp
  8044be:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8044c1:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8044c4:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  8044c8:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  8044cb:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  8044d0:	75 1c                	jne    8044ee <ipc_send+0x38>
  8044d2:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8044d9:	00 00 00 
  8044dc:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8044e0:	eb 0c                	jmp    8044ee <ipc_send+0x38>
  8044e2:	48 b8 15 18 80 00 00 	movabs $0x801815,%rax
  8044e9:	00 00 00 
  8044ec:	ff d0                	callq  *%rax
  8044ee:	8b 75 e8             	mov    -0x18(%rbp),%esi
  8044f1:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  8044f4:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8044f8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044fb:	89 c7                	mov    %eax,%edi
  8044fd:	48 b8 35 1a 80 00 00 	movabs $0x801a35,%rax
  804504:	00 00 00 
  804507:	ff d0                	callq  *%rax
  804509:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80450c:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804510:	74 d0                	je     8044e2 <ipc_send+0x2c>
  804512:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804516:	79 30                	jns    804548 <ipc_send+0x92>
  804518:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80451b:	89 c1                	mov    %eax,%ecx
  80451d:	48 ba d0 4d 80 00 00 	movabs $0x804dd0,%rdx
  804524:	00 00 00 
  804527:	be 44 00 00 00       	mov    $0x44,%esi
  80452c:	48 bf e6 4d 80 00 00 	movabs $0x804de6,%rdi
  804533:	00 00 00 
  804536:	b8 00 00 00 00       	mov    $0x0,%eax
  80453b:	49 b8 e1 42 80 00 00 	movabs $0x8042e1,%r8
  804542:	00 00 00 
  804545:	41 ff d0             	callq  *%r8
  804548:	90                   	nop
  804549:	c9                   	leaveq 
  80454a:	c3                   	retq   

000000000080454b <ipc_host_recv>:
  80454b:	55                   	push   %rbp
  80454c:	48 89 e5             	mov    %rsp,%rbp
  80454f:	48 83 ec 10          	sub    $0x10,%rsp
  804553:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804557:	48 ba f8 4d 80 00 00 	movabs $0x804df8,%rdx
  80455e:	00 00 00 
  804561:	be 4e 00 00 00       	mov    $0x4e,%esi
  804566:	48 bf e6 4d 80 00 00 	movabs $0x804de6,%rdi
  80456d:	00 00 00 
  804570:	b8 00 00 00 00       	mov    $0x0,%eax
  804575:	48 b9 e1 42 80 00 00 	movabs $0x8042e1,%rcx
  80457c:	00 00 00 
  80457f:	ff d1                	callq  *%rcx

0000000000804581 <ipc_host_send>:
  804581:	55                   	push   %rbp
  804582:	48 89 e5             	mov    %rsp,%rbp
  804585:	48 83 ec 20          	sub    $0x20,%rsp
  804589:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80458c:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80458f:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804593:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804596:	48 ba 18 4e 80 00 00 	movabs $0x804e18,%rdx
  80459d:	00 00 00 
  8045a0:	be 58 00 00 00       	mov    $0x58,%esi
  8045a5:	48 bf e6 4d 80 00 00 	movabs $0x804de6,%rdi
  8045ac:	00 00 00 
  8045af:	b8 00 00 00 00       	mov    $0x0,%eax
  8045b4:	48 b9 e1 42 80 00 00 	movabs $0x8042e1,%rcx
  8045bb:	00 00 00 
  8045be:	ff d1                	callq  *%rcx

00000000008045c0 <ipc_find_env>:
  8045c0:	55                   	push   %rbp
  8045c1:	48 89 e5             	mov    %rsp,%rbp
  8045c4:	48 83 ec 18          	sub    $0x18,%rsp
  8045c8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8045cb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8045d2:	eb 4d                	jmp    804621 <ipc_find_env+0x61>
  8045d4:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  8045db:	00 00 00 
  8045de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045e1:	48 98                	cltq   
  8045e3:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  8045ea:	48 01 d0             	add    %rdx,%rax
  8045ed:	48 05 d0 00 00 00    	add    $0xd0,%rax
  8045f3:	8b 00                	mov    (%rax),%eax
  8045f5:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8045f8:	75 23                	jne    80461d <ipc_find_env+0x5d>
  8045fa:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804601:	00 00 00 
  804604:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804607:	48 98                	cltq   
  804609:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804610:	48 01 d0             	add    %rdx,%rax
  804613:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804619:	8b 00                	mov    (%rax),%eax
  80461b:	eb 12                	jmp    80462f <ipc_find_env+0x6f>
  80461d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804621:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804628:	7e aa                	jle    8045d4 <ipc_find_env+0x14>
  80462a:	b8 00 00 00 00       	mov    $0x0,%eax
  80462f:	c9                   	leaveq 
  804630:	c3                   	retq   

0000000000804631 <pageref>:
  804631:	55                   	push   %rbp
  804632:	48 89 e5             	mov    %rsp,%rbp
  804635:	48 83 ec 18          	sub    $0x18,%rsp
  804639:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80463d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804641:	48 c1 e8 15          	shr    $0x15,%rax
  804645:	48 89 c2             	mov    %rax,%rdx
  804648:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  80464f:	01 00 00 
  804652:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804656:	83 e0 01             	and    $0x1,%eax
  804659:	48 85 c0             	test   %rax,%rax
  80465c:	75 07                	jne    804665 <pageref+0x34>
  80465e:	b8 00 00 00 00       	mov    $0x0,%eax
  804663:	eb 56                	jmp    8046bb <pageref+0x8a>
  804665:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804669:	48 c1 e8 0c          	shr    $0xc,%rax
  80466d:	48 89 c2             	mov    %rax,%rdx
  804670:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804677:	01 00 00 
  80467a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80467e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804682:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804686:	83 e0 01             	and    $0x1,%eax
  804689:	48 85 c0             	test   %rax,%rax
  80468c:	75 07                	jne    804695 <pageref+0x64>
  80468e:	b8 00 00 00 00       	mov    $0x0,%eax
  804693:	eb 26                	jmp    8046bb <pageref+0x8a>
  804695:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804699:	48 c1 e8 0c          	shr    $0xc,%rax
  80469d:	48 89 c2             	mov    %rax,%rdx
  8046a0:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8046a7:	00 00 00 
  8046aa:	48 c1 e2 04          	shl    $0x4,%rdx
  8046ae:	48 01 d0             	add    %rdx,%rax
  8046b1:	48 83 c0 08          	add    $0x8,%rax
  8046b5:	0f b7 00             	movzwl (%rax),%eax
  8046b8:	0f b7 c0             	movzwl %ax,%eax
  8046bb:	c9                   	leaveq 
  8046bc:	c3                   	retq   
