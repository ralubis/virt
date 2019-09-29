
vmm/guest/obj/user/ls:     file format elf64-x86-64


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
  80003c:	e8 db 04 00 00       	callq  80051c <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <ls>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80004e:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
  800055:	48 89 b5 50 ff ff ff 	mov    %rsi,-0xb0(%rbp)
  80005c:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  800063:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80006a:	48 89 d6             	mov    %rdx,%rsi
  80006d:	48 89 c7             	mov    %rax,%rdi
  800070:	48 b8 9d 2c 80 00 00 	movabs $0x802c9d,%rax
  800077:	00 00 00 
  80007a:	ff d0                	callq  *%rax
  80007c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80007f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800083:	79 3b                	jns    8000c0 <ls+0x7d>
  800085:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800088:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  80008f:	41 89 d0             	mov    %edx,%r8d
  800092:	48 89 c1             	mov    %rax,%rcx
  800095:	48 ba 20 4a 80 00 00 	movabs $0x804a20,%rdx
  80009c:	00 00 00 
  80009f:	be 10 00 00 00       	mov    $0x10,%esi
  8000a4:	48 bf 2c 4a 80 00 00 	movabs $0x804a2c,%rdi
  8000ab:	00 00 00 
  8000ae:	b8 00 00 00 00       	mov    $0x0,%eax
  8000b3:	49 b9 c4 05 80 00 00 	movabs $0x8005c4,%r9
  8000ba:	00 00 00 
  8000bd:	41 ff d1             	callq  *%r9
  8000c0:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8000c3:	85 c0                	test   %eax,%eax
  8000c5:	74 36                	je     8000fd <ls+0xba>
  8000c7:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8000ce:	00 00 00 
  8000d1:	8b 80 90 01 00 00    	mov    0x190(%rax),%eax
  8000d7:	85 c0                	test   %eax,%eax
  8000d9:	75 22                	jne    8000fd <ls+0xba>
  8000db:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
  8000e2:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8000e9:	48 89 d6             	mov    %rdx,%rsi
  8000ec:	48 89 c7             	mov    %rax,%rdi
  8000ef:	48 b8 28 01 80 00 00 	movabs $0x800128,%rax
  8000f6:	00 00 00 
  8000f9:	ff d0                	callq  *%rax
  8000fb:	eb 28                	jmp    800125 <ls+0xe2>
  8000fd:	8b 55 e0             	mov    -0x20(%rbp),%edx
  800100:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800103:	85 c0                	test   %eax,%eax
  800105:	0f 95 c0             	setne  %al
  800108:	0f b6 c0             	movzbl %al,%eax
  80010b:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
  800112:	89 c6                	mov    %eax,%esi
  800114:	bf 00 00 00 00       	mov    $0x0,%edi
  800119:	48 b8 88 02 80 00 00 	movabs $0x800288,%rax
  800120:	00 00 00 
  800123:	ff d0                	callq  *%rax
  800125:	90                   	nop
  800126:	c9                   	leaveq 
  800127:	c3                   	retq   

0000000000800128 <lsdir>:
  800128:	55                   	push   %rbp
  800129:	48 89 e5             	mov    %rsp,%rbp
  80012c:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
  800133:	48 89 bd e8 fe ff ff 	mov    %rdi,-0x118(%rbp)
  80013a:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  800141:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  800148:	be 00 00 00 00       	mov    $0x0,%esi
  80014d:	48 89 c7             	mov    %rax,%rdi
  800150:	48 b8 8d 2d 80 00 00 	movabs $0x802d8d,%rax
  800157:	00 00 00 
  80015a:	ff d0                	callq  *%rax
  80015c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80015f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800163:	79 78                	jns    8001dd <lsdir+0xb5>
  800165:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800168:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  80016f:	41 89 d0             	mov    %edx,%r8d
  800172:	48 89 c1             	mov    %rax,%rcx
  800175:	48 ba 39 4a 80 00 00 	movabs $0x804a39,%rdx
  80017c:	00 00 00 
  80017f:	be 1e 00 00 00       	mov    $0x1e,%esi
  800184:	48 bf 2c 4a 80 00 00 	movabs $0x804a2c,%rdi
  80018b:	00 00 00 
  80018e:	b8 00 00 00 00       	mov    $0x0,%eax
  800193:	49 b9 c4 05 80 00 00 	movabs $0x8005c4,%r9
  80019a:	00 00 00 
  80019d:	41 ff d1             	callq  *%r9
  8001a0:	0f b6 85 f0 fe ff ff 	movzbl -0x110(%rbp),%eax
  8001a7:	84 c0                	test   %al,%al
  8001a9:	74 32                	je     8001dd <lsdir+0xb5>
  8001ab:	8b 95 70 ff ff ff    	mov    -0x90(%rbp),%edx
  8001b1:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
  8001b7:	83 f8 01             	cmp    $0x1,%eax
  8001ba:	0f 94 c0             	sete   %al
  8001bd:	0f b6 f0             	movzbl %al,%esi
  8001c0:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  8001c7:	48 8b 85 e0 fe ff ff 	mov    -0x120(%rbp),%rax
  8001ce:	48 89 c7             	mov    %rax,%rdi
  8001d1:	48 b8 88 02 80 00 00 	movabs $0x800288,%rax
  8001d8:	00 00 00 
  8001db:	ff d0                	callq  *%rax
  8001dd:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  8001e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001e7:	ba 00 01 00 00       	mov    $0x100,%edx
  8001ec:	48 89 ce             	mov    %rcx,%rsi
  8001ef:	89 c7                	mov    %eax,%edi
  8001f1:	48 b8 89 29 80 00 00 	movabs $0x802989,%rax
  8001f8:	00 00 00 
  8001fb:	ff d0                	callq  *%rax
  8001fd:	89 45 f8             	mov    %eax,-0x8(%rbp)
  800200:	81 7d f8 00 01 00 00 	cmpl   $0x100,-0x8(%rbp)
  800207:	74 97                	je     8001a0 <lsdir+0x78>
  800209:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  80020d:	7e 35                	jle    800244 <lsdir+0x11c>
  80020f:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  800216:	48 89 c1             	mov    %rax,%rcx
  800219:	48 ba 45 4a 80 00 00 	movabs $0x804a45,%rdx
  800220:	00 00 00 
  800223:	be 23 00 00 00       	mov    $0x23,%esi
  800228:	48 bf 2c 4a 80 00 00 	movabs $0x804a2c,%rdi
  80022f:	00 00 00 
  800232:	b8 00 00 00 00       	mov    $0x0,%eax
  800237:	49 b8 c4 05 80 00 00 	movabs $0x8005c4,%r8
  80023e:	00 00 00 
  800241:	41 ff d0             	callq  *%r8
  800244:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800248:	79 3b                	jns    800285 <lsdir+0x15d>
  80024a:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80024d:	48 8b 85 e8 fe ff ff 	mov    -0x118(%rbp),%rax
  800254:	41 89 d0             	mov    %edx,%r8d
  800257:	48 89 c1             	mov    %rax,%rcx
  80025a:	48 ba 60 4a 80 00 00 	movabs $0x804a60,%rdx
  800261:	00 00 00 
  800264:	be 25 00 00 00       	mov    $0x25,%esi
  800269:	48 bf 2c 4a 80 00 00 	movabs $0x804a2c,%rdi
  800270:	00 00 00 
  800273:	b8 00 00 00 00       	mov    $0x0,%eax
  800278:	49 b9 c4 05 80 00 00 	movabs $0x8005c4,%r9
  80027f:	00 00 00 
  800282:	41 ff d1             	callq  *%r9
  800285:	90                   	nop
  800286:	c9                   	leaveq 
  800287:	c3                   	retq   

0000000000800288 <ls1>:
  800288:	55                   	push   %rbp
  800289:	48 89 e5             	mov    %rsp,%rbp
  80028c:	48 83 ec 30          	sub    $0x30,%rsp
  800290:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800294:	89 f0                	mov    %esi,%eax
  800296:	89 55 e0             	mov    %edx,-0x20(%rbp)
  800299:	48 89 4d d8          	mov    %rcx,-0x28(%rbp)
  80029d:	88 45 e4             	mov    %al,-0x1c(%rbp)
  8002a0:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  8002a7:	00 00 00 
  8002aa:	8b 80 b0 01 00 00    	mov    0x1b0(%rax),%eax
  8002b0:	85 c0                	test   %eax,%eax
  8002b2:	74 32                	je     8002e6 <ls1+0x5e>
  8002b4:	80 7d e4 00          	cmpb   $0x0,-0x1c(%rbp)
  8002b8:	74 07                	je     8002c1 <ls1+0x39>
  8002ba:	ba 64 00 00 00       	mov    $0x64,%edx
  8002bf:	eb 05                	jmp    8002c6 <ls1+0x3e>
  8002c1:	ba 2d 00 00 00       	mov    $0x2d,%edx
  8002c6:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8002c9:	89 c6                	mov    %eax,%esi
  8002cb:	48 bf 7f 4a 80 00 00 	movabs $0x804a7f,%rdi
  8002d2:	00 00 00 
  8002d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8002da:	48 b9 1c 36 80 00 00 	movabs $0x80361c,%rcx
  8002e1:	00 00 00 
  8002e4:	ff d1                	callq  *%rcx
  8002e6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8002eb:	74 76                	je     800363 <ls1+0xdb>
  8002ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002f1:	0f b6 00             	movzbl (%rax),%eax
  8002f4:	84 c0                	test   %al,%al
  8002f6:	74 37                	je     80032f <ls1+0xa7>
  8002f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8002fc:	48 89 c7             	mov    %rax,%rdi
  8002ff:	48 b8 22 13 80 00 00 	movabs $0x801322,%rax
  800306:	00 00 00 
  800309:	ff d0                	callq  *%rax
  80030b:	48 98                	cltq   
  80030d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800311:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800315:	48 01 d0             	add    %rdx,%rax
  800318:	0f b6 00             	movzbl (%rax),%eax
  80031b:	3c 2f                	cmp    $0x2f,%al
  80031d:	74 10                	je     80032f <ls1+0xa7>
  80031f:	48 b8 88 4a 80 00 00 	movabs $0x804a88,%rax
  800326:	00 00 00 
  800329:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80032d:	eb 0e                	jmp    80033d <ls1+0xb5>
  80032f:	48 b8 8a 4a 80 00 00 	movabs $0x804a8a,%rax
  800336:	00 00 00 
  800339:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80033d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  800341:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800345:	48 89 c6             	mov    %rax,%rsi
  800348:	48 bf 8b 4a 80 00 00 	movabs $0x804a8b,%rdi
  80034f:	00 00 00 
  800352:	b8 00 00 00 00       	mov    $0x0,%eax
  800357:	48 b9 1c 36 80 00 00 	movabs $0x80361c,%rcx
  80035e:	00 00 00 
  800361:	ff d1                	callq  *%rcx
  800363:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  800367:	48 89 c6             	mov    %rax,%rsi
  80036a:	48 bf 90 4a 80 00 00 	movabs $0x804a90,%rdi
  800371:	00 00 00 
  800374:	b8 00 00 00 00       	mov    $0x0,%eax
  800379:	48 ba 1c 36 80 00 00 	movabs $0x80361c,%rdx
  800380:	00 00 00 
  800383:	ff d2                	callq  *%rdx
  800385:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80038c:	00 00 00 
  80038f:	8b 80 18 01 00 00    	mov    0x118(%rax),%eax
  800395:	85 c0                	test   %eax,%eax
  800397:	74 21                	je     8003ba <ls1+0x132>
  800399:	80 7d e4 00          	cmpb   $0x0,-0x1c(%rbp)
  80039d:	74 1b                	je     8003ba <ls1+0x132>
  80039f:	48 bf 88 4a 80 00 00 	movabs $0x804a88,%rdi
  8003a6:	00 00 00 
  8003a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8003ae:	48 ba 1c 36 80 00 00 	movabs $0x80361c,%rdx
  8003b5:	00 00 00 
  8003b8:	ff d2                	callq  *%rdx
  8003ba:	48 bf 93 4a 80 00 00 	movabs $0x804a93,%rdi
  8003c1:	00 00 00 
  8003c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8003c9:	48 ba 1c 36 80 00 00 	movabs $0x80361c,%rdx
  8003d0:	00 00 00 
  8003d3:	ff d2                	callq  *%rdx
  8003d5:	90                   	nop
  8003d6:	c9                   	leaveq 
  8003d7:	c3                   	retq   

00000000008003d8 <usage>:
  8003d8:	55                   	push   %rbp
  8003d9:	48 89 e5             	mov    %rsp,%rbp
  8003dc:	48 bf 95 4a 80 00 00 	movabs $0x804a95,%rdi
  8003e3:	00 00 00 
  8003e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8003eb:	48 ba 1c 36 80 00 00 	movabs $0x80361c,%rdx
  8003f2:	00 00 00 
  8003f5:	ff d2                	callq  *%rdx
  8003f7:	48 b8 a0 05 80 00 00 	movabs $0x8005a0,%rax
  8003fe:	00 00 00 
  800401:	ff d0                	callq  *%rax
  800403:	90                   	nop
  800404:	5d                   	pop    %rbp
  800405:	c3                   	retq   

0000000000800406 <umain>:
  800406:	55                   	push   %rbp
  800407:	48 89 e5             	mov    %rsp,%rbp
  80040a:	48 83 ec 40          	sub    $0x40,%rsp
  80040e:	89 7d cc             	mov    %edi,-0x34(%rbp)
  800411:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  800415:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
  800419:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
  80041d:	48 8d 45 cc          	lea    -0x34(%rbp),%rax
  800421:	48 89 ce             	mov    %rcx,%rsi
  800424:	48 89 c7             	mov    %rax,%rdi
  800427:	48 b8 ba 20 80 00 00 	movabs $0x8020ba,%rax
  80042e:	00 00 00 
  800431:	ff d0                	callq  *%rax
  800433:	eb 49                	jmp    80047e <umain+0x78>
  800435:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800438:	83 f8 64             	cmp    $0x64,%eax
  80043b:	74 0a                	je     800447 <umain+0x41>
  80043d:	83 f8 6c             	cmp    $0x6c,%eax
  800440:	74 05                	je     800447 <umain+0x41>
  800442:	83 f8 46             	cmp    $0x46,%eax
  800445:	75 2b                	jne    800472 <umain+0x6c>
  800447:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  80044e:	00 00 00 
  800451:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800454:	48 63 d2             	movslq %edx,%rdx
  800457:	8b 04 90             	mov    (%rax,%rdx,4),%eax
  80045a:	8d 48 01             	lea    0x1(%rax),%ecx
  80045d:	48 b8 20 80 80 00 00 	movabs $0x808020,%rax
  800464:	00 00 00 
  800467:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80046a:	48 63 d2             	movslq %edx,%rdx
  80046d:	89 0c 90             	mov    %ecx,(%rax,%rdx,4)
  800470:	eb 0c                	jmp    80047e <umain+0x78>
  800472:	48 b8 d8 03 80 00 00 	movabs $0x8003d8,%rax
  800479:	00 00 00 
  80047c:	ff d0                	callq  *%rax
  80047e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800482:	48 89 c7             	mov    %rax,%rdi
  800485:	48 b8 1f 21 80 00 00 	movabs $0x80211f,%rax
  80048c:	00 00 00 
  80048f:	ff d0                	callq  *%rax
  800491:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800494:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800498:	79 9b                	jns    800435 <umain+0x2f>
  80049a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80049d:	83 f8 01             	cmp    $0x1,%eax
  8004a0:	75 22                	jne    8004c4 <umain+0xbe>
  8004a2:	48 be 8a 4a 80 00 00 	movabs $0x804a8a,%rsi
  8004a9:	00 00 00 
  8004ac:	48 bf 88 4a 80 00 00 	movabs $0x804a88,%rdi
  8004b3:	00 00 00 
  8004b6:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8004bd:	00 00 00 
  8004c0:	ff d0                	callq  *%rax
  8004c2:	eb 55                	jmp    800519 <umain+0x113>
  8004c4:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  8004cb:	eb 44                	jmp    800511 <umain+0x10b>
  8004cd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004d0:	48 98                	cltq   
  8004d2:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8004d9:	00 
  8004da:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8004de:	48 01 d0             	add    %rdx,%rax
  8004e1:	48 8b 10             	mov    (%rax),%rdx
  8004e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004e7:	48 98                	cltq   
  8004e9:	48 8d 0c c5 00 00 00 	lea    0x0(,%rax,8),%rcx
  8004f0:	00 
  8004f1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8004f5:	48 01 c8             	add    %rcx,%rax
  8004f8:	48 8b 00             	mov    (%rax),%rax
  8004fb:	48 89 d6             	mov    %rdx,%rsi
  8004fe:	48 89 c7             	mov    %rax,%rdi
  800501:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800508:	00 00 00 
  80050b:	ff d0                	callq  *%rax
  80050d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800511:	8b 45 cc             	mov    -0x34(%rbp),%eax
  800514:	39 45 fc             	cmp    %eax,-0x4(%rbp)
  800517:	7c b4                	jl     8004cd <umain+0xc7>
  800519:	90                   	nop
  80051a:	c9                   	leaveq 
  80051b:	c3                   	retq   

000000000080051c <libmain>:
  80051c:	55                   	push   %rbp
  80051d:	48 89 e5             	mov    %rsp,%rbp
  800520:	48 83 ec 10          	sub    $0x10,%rsp
  800524:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800527:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80052b:	48 b8 45 1c 80 00 00 	movabs $0x801c45,%rax
  800532:	00 00 00 
  800535:	ff d0                	callq  *%rax
  800537:	25 ff 03 00 00       	and    $0x3ff,%eax
  80053c:	48 98                	cltq   
  80053e:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800545:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80054c:	00 00 00 
  80054f:	48 01 c2             	add    %rax,%rdx
  800552:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  800559:	00 00 00 
  80055c:	48 89 10             	mov    %rdx,(%rax)
  80055f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800563:	7e 14                	jle    800579 <libmain+0x5d>
  800565:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800569:	48 8b 10             	mov    (%rax),%rdx
  80056c:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800573:	00 00 00 
  800576:	48 89 10             	mov    %rdx,(%rax)
  800579:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80057d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800580:	48 89 d6             	mov    %rdx,%rsi
  800583:	89 c7                	mov    %eax,%edi
  800585:	48 b8 06 04 80 00 00 	movabs $0x800406,%rax
  80058c:	00 00 00 
  80058f:	ff d0                	callq  *%rax
  800591:	48 b8 a0 05 80 00 00 	movabs $0x8005a0,%rax
  800598:	00 00 00 
  80059b:	ff d0                	callq  *%rax
  80059d:	90                   	nop
  80059e:	c9                   	leaveq 
  80059f:	c3                   	retq   

00000000008005a0 <exit>:
  8005a0:	55                   	push   %rbp
  8005a1:	48 89 e5             	mov    %rsp,%rbp
  8005a4:	48 b8 dc 26 80 00 00 	movabs $0x8026dc,%rax
  8005ab:	00 00 00 
  8005ae:	ff d0                	callq  *%rax
  8005b0:	bf 00 00 00 00       	mov    $0x0,%edi
  8005b5:	48 b8 ff 1b 80 00 00 	movabs $0x801bff,%rax
  8005bc:	00 00 00 
  8005bf:	ff d0                	callq  *%rax
  8005c1:	90                   	nop
  8005c2:	5d                   	pop    %rbp
  8005c3:	c3                   	retq   

00000000008005c4 <_panic>:
  8005c4:	55                   	push   %rbp
  8005c5:	48 89 e5             	mov    %rsp,%rbp
  8005c8:	53                   	push   %rbx
  8005c9:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8005d0:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  8005d7:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  8005dd:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8005e4:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  8005eb:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  8005f2:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  8005f9:	84 c0                	test   %al,%al
  8005fb:	74 23                	je     800620 <_panic+0x5c>
  8005fd:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800604:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800608:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80060c:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  800610:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  800614:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  800618:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  80061c:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  800620:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  800627:	00 00 00 
  80062a:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  800631:	00 00 00 
  800634:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800638:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  80063f:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  800646:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  80064d:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  800654:	00 00 00 
  800657:	48 8b 18             	mov    (%rax),%rbx
  80065a:	48 b8 45 1c 80 00 00 	movabs $0x801c45,%rax
  800661:	00 00 00 
  800664:	ff d0                	callq  *%rax
  800666:	89 c6                	mov    %eax,%esi
  800668:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  80066e:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800675:	41 89 d0             	mov    %edx,%r8d
  800678:	48 89 c1             	mov    %rax,%rcx
  80067b:	48 89 da             	mov    %rbx,%rdx
  80067e:	48 bf c0 4a 80 00 00 	movabs $0x804ac0,%rdi
  800685:	00 00 00 
  800688:	b8 00 00 00 00       	mov    $0x0,%eax
  80068d:	49 b9 fe 07 80 00 00 	movabs $0x8007fe,%r9
  800694:	00 00 00 
  800697:	41 ff d1             	callq  *%r9
  80069a:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  8006a1:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8006a8:	48 89 d6             	mov    %rdx,%rsi
  8006ab:	48 89 c7             	mov    %rax,%rdi
  8006ae:	48 b8 52 07 80 00 00 	movabs $0x800752,%rax
  8006b5:	00 00 00 
  8006b8:	ff d0                	callq  *%rax
  8006ba:	48 bf e3 4a 80 00 00 	movabs $0x804ae3,%rdi
  8006c1:	00 00 00 
  8006c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c9:	48 ba fe 07 80 00 00 	movabs $0x8007fe,%rdx
  8006d0:	00 00 00 
  8006d3:	ff d2                	callq  *%rdx
  8006d5:	cc                   	int3   
  8006d6:	eb fd                	jmp    8006d5 <_panic+0x111>

00000000008006d8 <putch>:
  8006d8:	55                   	push   %rbp
  8006d9:	48 89 e5             	mov    %rsp,%rbp
  8006dc:	48 83 ec 10          	sub    $0x10,%rsp
  8006e0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8006e3:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8006e7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006eb:	8b 00                	mov    (%rax),%eax
  8006ed:	8d 48 01             	lea    0x1(%rax),%ecx
  8006f0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8006f4:	89 0a                	mov    %ecx,(%rdx)
  8006f6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8006f9:	89 d1                	mov    %edx,%ecx
  8006fb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8006ff:	48 98                	cltq   
  800701:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800705:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800709:	8b 00                	mov    (%rax),%eax
  80070b:	3d ff 00 00 00       	cmp    $0xff,%eax
  800710:	75 2c                	jne    80073e <putch+0x66>
  800712:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800716:	8b 00                	mov    (%rax),%eax
  800718:	48 98                	cltq   
  80071a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80071e:	48 83 c2 08          	add    $0x8,%rdx
  800722:	48 89 c6             	mov    %rax,%rsi
  800725:	48 89 d7             	mov    %rdx,%rdi
  800728:	48 b8 76 1b 80 00 00 	movabs $0x801b76,%rax
  80072f:	00 00 00 
  800732:	ff d0                	callq  *%rax
  800734:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800738:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80073e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800742:	8b 40 04             	mov    0x4(%rax),%eax
  800745:	8d 50 01             	lea    0x1(%rax),%edx
  800748:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80074c:	89 50 04             	mov    %edx,0x4(%rax)
  80074f:	90                   	nop
  800750:	c9                   	leaveq 
  800751:	c3                   	retq   

0000000000800752 <vcprintf>:
  800752:	55                   	push   %rbp
  800753:	48 89 e5             	mov    %rsp,%rbp
  800756:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  80075d:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800764:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  80076b:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800772:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800779:	48 8b 0a             	mov    (%rdx),%rcx
  80077c:	48 89 08             	mov    %rcx,(%rax)
  80077f:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800783:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800787:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  80078b:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80078f:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800796:	00 00 00 
  800799:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8007a0:	00 00 00 
  8007a3:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  8007aa:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  8007b1:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8007b8:	48 89 c6             	mov    %rax,%rsi
  8007bb:	48 bf d8 06 80 00 00 	movabs $0x8006d8,%rdi
  8007c2:	00 00 00 
  8007c5:	48 b8 9c 0b 80 00 00 	movabs $0x800b9c,%rax
  8007cc:	00 00 00 
  8007cf:	ff d0                	callq  *%rax
  8007d1:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8007d7:	48 98                	cltq   
  8007d9:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8007e0:	48 83 c2 08          	add    $0x8,%rdx
  8007e4:	48 89 c6             	mov    %rax,%rsi
  8007e7:	48 89 d7             	mov    %rdx,%rdi
  8007ea:	48 b8 76 1b 80 00 00 	movabs $0x801b76,%rax
  8007f1:	00 00 00 
  8007f4:	ff d0                	callq  *%rax
  8007f6:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8007fc:	c9                   	leaveq 
  8007fd:	c3                   	retq   

00000000008007fe <cprintf>:
  8007fe:	55                   	push   %rbp
  8007ff:	48 89 e5             	mov    %rsp,%rbp
  800802:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800809:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800810:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800817:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80081e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800825:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80082c:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800833:	84 c0                	test   %al,%al
  800835:	74 20                	je     800857 <cprintf+0x59>
  800837:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80083b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80083f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800843:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800847:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80084b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80084f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800853:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800857:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80085e:	00 00 00 
  800861:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800868:	00 00 00 
  80086b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80086f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800876:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80087d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800884:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80088b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800892:	48 8b 0a             	mov    (%rdx),%rcx
  800895:	48 89 08             	mov    %rcx,(%rax)
  800898:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80089c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8008a0:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8008a4:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8008a8:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  8008af:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8008b6:	48 89 d6             	mov    %rdx,%rsi
  8008b9:	48 89 c7             	mov    %rax,%rdi
  8008bc:	48 b8 52 07 80 00 00 	movabs $0x800752,%rax
  8008c3:	00 00 00 
  8008c6:	ff d0                	callq  *%rax
  8008c8:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8008ce:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8008d4:	c9                   	leaveq 
  8008d5:	c3                   	retq   

00000000008008d6 <printnum>:
  8008d6:	55                   	push   %rbp
  8008d7:	48 89 e5             	mov    %rsp,%rbp
  8008da:	48 83 ec 30          	sub    $0x30,%rsp
  8008de:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8008e2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8008e6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8008ea:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  8008ed:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8008f1:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  8008f5:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8008f8:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8008fc:	77 54                	ja     800952 <printnum+0x7c>
  8008fe:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800901:	8d 78 ff             	lea    -0x1(%rax),%edi
  800904:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800907:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80090b:	ba 00 00 00 00       	mov    $0x0,%edx
  800910:	48 f7 f6             	div    %rsi
  800913:	49 89 c2             	mov    %rax,%r10
  800916:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800919:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80091c:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800920:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800924:	41 89 c9             	mov    %ecx,%r9d
  800927:	41 89 f8             	mov    %edi,%r8d
  80092a:	89 d1                	mov    %edx,%ecx
  80092c:	4c 89 d2             	mov    %r10,%rdx
  80092f:	48 89 c7             	mov    %rax,%rdi
  800932:	48 b8 d6 08 80 00 00 	movabs $0x8008d6,%rax
  800939:	00 00 00 
  80093c:	ff d0                	callq  *%rax
  80093e:	eb 1c                	jmp    80095c <printnum+0x86>
  800940:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800944:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800947:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80094b:	48 89 ce             	mov    %rcx,%rsi
  80094e:	89 d7                	mov    %edx,%edi
  800950:	ff d0                	callq  *%rax
  800952:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800956:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  80095a:	7f e4                	jg     800940 <printnum+0x6a>
  80095c:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80095f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800963:	ba 00 00 00 00       	mov    $0x0,%edx
  800968:	48 f7 f1             	div    %rcx
  80096b:	48 b8 f0 4c 80 00 00 	movabs $0x804cf0,%rax
  800972:	00 00 00 
  800975:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800979:	0f be d0             	movsbl %al,%edx
  80097c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800980:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800984:	48 89 ce             	mov    %rcx,%rsi
  800987:	89 d7                	mov    %edx,%edi
  800989:	ff d0                	callq  *%rax
  80098b:	90                   	nop
  80098c:	c9                   	leaveq 
  80098d:	c3                   	retq   

000000000080098e <getuint>:
  80098e:	55                   	push   %rbp
  80098f:	48 89 e5             	mov    %rsp,%rbp
  800992:	48 83 ec 20          	sub    $0x20,%rsp
  800996:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80099a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80099d:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  8009a1:	7e 4f                	jle    8009f2 <getuint+0x64>
  8009a3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009a7:	8b 00                	mov    (%rax),%eax
  8009a9:	83 f8 30             	cmp    $0x30,%eax
  8009ac:	73 24                	jae    8009d2 <getuint+0x44>
  8009ae:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009b2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8009b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009ba:	8b 00                	mov    (%rax),%eax
  8009bc:	89 c0                	mov    %eax,%eax
  8009be:	48 01 d0             	add    %rdx,%rax
  8009c1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009c5:	8b 12                	mov    (%rdx),%edx
  8009c7:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8009ca:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009ce:	89 0a                	mov    %ecx,(%rdx)
  8009d0:	eb 14                	jmp    8009e6 <getuint+0x58>
  8009d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009d6:	48 8b 40 08          	mov    0x8(%rax),%rax
  8009da:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8009de:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8009e2:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8009e6:	48 8b 00             	mov    (%rax),%rax
  8009e9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8009ed:	e9 9d 00 00 00       	jmpq   800a8f <getuint+0x101>
  8009f2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8009f6:	74 4c                	je     800a44 <getuint+0xb6>
  8009f8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8009fc:	8b 00                	mov    (%rax),%eax
  8009fe:	83 f8 30             	cmp    $0x30,%eax
  800a01:	73 24                	jae    800a27 <getuint+0x99>
  800a03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a07:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a0b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a0f:	8b 00                	mov    (%rax),%eax
  800a11:	89 c0                	mov    %eax,%eax
  800a13:	48 01 d0             	add    %rdx,%rax
  800a16:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a1a:	8b 12                	mov    (%rdx),%edx
  800a1c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a1f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a23:	89 0a                	mov    %ecx,(%rdx)
  800a25:	eb 14                	jmp    800a3b <getuint+0xad>
  800a27:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a2b:	48 8b 40 08          	mov    0x8(%rax),%rax
  800a2f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800a33:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a37:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a3b:	48 8b 00             	mov    (%rax),%rax
  800a3e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a42:	eb 4b                	jmp    800a8f <getuint+0x101>
  800a44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a48:	8b 00                	mov    (%rax),%eax
  800a4a:	83 f8 30             	cmp    $0x30,%eax
  800a4d:	73 24                	jae    800a73 <getuint+0xe5>
  800a4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a53:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800a57:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a5b:	8b 00                	mov    (%rax),%eax
  800a5d:	89 c0                	mov    %eax,%eax
  800a5f:	48 01 d0             	add    %rdx,%rax
  800a62:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a66:	8b 12                	mov    (%rdx),%edx
  800a68:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800a6b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a6f:	89 0a                	mov    %ecx,(%rdx)
  800a71:	eb 14                	jmp    800a87 <getuint+0xf9>
  800a73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a77:	48 8b 40 08          	mov    0x8(%rax),%rax
  800a7b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800a7f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800a83:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800a87:	8b 00                	mov    (%rax),%eax
  800a89:	89 c0                	mov    %eax,%eax
  800a8b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800a8f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800a93:	c9                   	leaveq 
  800a94:	c3                   	retq   

0000000000800a95 <getint>:
  800a95:	55                   	push   %rbp
  800a96:	48 89 e5             	mov    %rsp,%rbp
  800a99:	48 83 ec 20          	sub    $0x20,%rsp
  800a9d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800aa1:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800aa4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800aa8:	7e 4f                	jle    800af9 <getint+0x64>
  800aaa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800aae:	8b 00                	mov    (%rax),%eax
  800ab0:	83 f8 30             	cmp    $0x30,%eax
  800ab3:	73 24                	jae    800ad9 <getint+0x44>
  800ab5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ab9:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800abd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ac1:	8b 00                	mov    (%rax),%eax
  800ac3:	89 c0                	mov    %eax,%eax
  800ac5:	48 01 d0             	add    %rdx,%rax
  800ac8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800acc:	8b 12                	mov    (%rdx),%edx
  800ace:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800ad1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ad5:	89 0a                	mov    %ecx,(%rdx)
  800ad7:	eb 14                	jmp    800aed <getint+0x58>
  800ad9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800add:	48 8b 40 08          	mov    0x8(%rax),%rax
  800ae1:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800ae5:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ae9:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800aed:	48 8b 00             	mov    (%rax),%rax
  800af0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800af4:	e9 9d 00 00 00       	jmpq   800b96 <getint+0x101>
  800af9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800afd:	74 4c                	je     800b4b <getint+0xb6>
  800aff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b03:	8b 00                	mov    (%rax),%eax
  800b05:	83 f8 30             	cmp    $0x30,%eax
  800b08:	73 24                	jae    800b2e <getint+0x99>
  800b0a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b0e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b12:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b16:	8b 00                	mov    (%rax),%eax
  800b18:	89 c0                	mov    %eax,%eax
  800b1a:	48 01 d0             	add    %rdx,%rax
  800b1d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b21:	8b 12                	mov    (%rdx),%edx
  800b23:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b26:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b2a:	89 0a                	mov    %ecx,(%rdx)
  800b2c:	eb 14                	jmp    800b42 <getint+0xad>
  800b2e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b32:	48 8b 40 08          	mov    0x8(%rax),%rax
  800b36:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800b3a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b3e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b42:	48 8b 00             	mov    (%rax),%rax
  800b45:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b49:	eb 4b                	jmp    800b96 <getint+0x101>
  800b4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b4f:	8b 00                	mov    (%rax),%eax
  800b51:	83 f8 30             	cmp    $0x30,%eax
  800b54:	73 24                	jae    800b7a <getint+0xe5>
  800b56:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b5a:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b62:	8b 00                	mov    (%rax),%eax
  800b64:	89 c0                	mov    %eax,%eax
  800b66:	48 01 d0             	add    %rdx,%rax
  800b69:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b6d:	8b 12                	mov    (%rdx),%edx
  800b6f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b72:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b76:	89 0a                	mov    %ecx,(%rdx)
  800b78:	eb 14                	jmp    800b8e <getint+0xf9>
  800b7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b7e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800b82:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800b86:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b8a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b8e:	8b 00                	mov    (%rax),%eax
  800b90:	48 98                	cltq   
  800b92:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800b9a:	c9                   	leaveq 
  800b9b:	c3                   	retq   

0000000000800b9c <vprintfmt>:
  800b9c:	55                   	push   %rbp
  800b9d:	48 89 e5             	mov    %rsp,%rbp
  800ba0:	41 54                	push   %r12
  800ba2:	53                   	push   %rbx
  800ba3:	48 83 ec 60          	sub    $0x60,%rsp
  800ba7:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800bab:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800baf:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800bb3:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800bb7:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bbb:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800bbf:	48 8b 0a             	mov    (%rdx),%rcx
  800bc2:	48 89 08             	mov    %rcx,(%rax)
  800bc5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800bc9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800bcd:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800bd1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800bd5:	eb 17                	jmp    800bee <vprintfmt+0x52>
  800bd7:	85 db                	test   %ebx,%ebx
  800bd9:	0f 84 b9 04 00 00    	je     801098 <vprintfmt+0x4fc>
  800bdf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800be3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800be7:	48 89 d6             	mov    %rdx,%rsi
  800bea:	89 df                	mov    %ebx,%edi
  800bec:	ff d0                	callq  *%rax
  800bee:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800bf2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800bf6:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800bfa:	0f b6 00             	movzbl (%rax),%eax
  800bfd:	0f b6 d8             	movzbl %al,%ebx
  800c00:	83 fb 25             	cmp    $0x25,%ebx
  800c03:	75 d2                	jne    800bd7 <vprintfmt+0x3b>
  800c05:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800c09:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800c10:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800c17:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800c1e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800c25:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c29:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800c2d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800c31:	0f b6 00             	movzbl (%rax),%eax
  800c34:	0f b6 d8             	movzbl %al,%ebx
  800c37:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800c3a:	83 f8 55             	cmp    $0x55,%eax
  800c3d:	0f 87 22 04 00 00    	ja     801065 <vprintfmt+0x4c9>
  800c43:	89 c0                	mov    %eax,%eax
  800c45:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800c4c:	00 
  800c4d:	48 b8 18 4d 80 00 00 	movabs $0x804d18,%rax
  800c54:	00 00 00 
  800c57:	48 01 d0             	add    %rdx,%rax
  800c5a:	48 8b 00             	mov    (%rax),%rax
  800c5d:	ff e0                	jmpq   *%rax
  800c5f:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800c63:	eb c0                	jmp    800c25 <vprintfmt+0x89>
  800c65:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800c69:	eb ba                	jmp    800c25 <vprintfmt+0x89>
  800c6b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800c72:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800c75:	89 d0                	mov    %edx,%eax
  800c77:	c1 e0 02             	shl    $0x2,%eax
  800c7a:	01 d0                	add    %edx,%eax
  800c7c:	01 c0                	add    %eax,%eax
  800c7e:	01 d8                	add    %ebx,%eax
  800c80:	83 e8 30             	sub    $0x30,%eax
  800c83:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800c86:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800c8a:	0f b6 00             	movzbl (%rax),%eax
  800c8d:	0f be d8             	movsbl %al,%ebx
  800c90:	83 fb 2f             	cmp    $0x2f,%ebx
  800c93:	7e 60                	jle    800cf5 <vprintfmt+0x159>
  800c95:	83 fb 39             	cmp    $0x39,%ebx
  800c98:	7f 5b                	jg     800cf5 <vprintfmt+0x159>
  800c9a:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800c9f:	eb d1                	jmp    800c72 <vprintfmt+0xd6>
  800ca1:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800ca4:	83 f8 30             	cmp    $0x30,%eax
  800ca7:	73 17                	jae    800cc0 <vprintfmt+0x124>
  800ca9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800cad:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cb0:	89 d2                	mov    %edx,%edx
  800cb2:	48 01 d0             	add    %rdx,%rax
  800cb5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cb8:	83 c2 08             	add    $0x8,%edx
  800cbb:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cbe:	eb 0c                	jmp    800ccc <vprintfmt+0x130>
  800cc0:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800cc4:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800cc8:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ccc:	8b 00                	mov    (%rax),%eax
  800cce:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800cd1:	eb 23                	jmp    800cf6 <vprintfmt+0x15a>
  800cd3:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cd7:	0f 89 48 ff ff ff    	jns    800c25 <vprintfmt+0x89>
  800cdd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800ce4:	e9 3c ff ff ff       	jmpq   800c25 <vprintfmt+0x89>
  800ce9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800cf0:	e9 30 ff ff ff       	jmpq   800c25 <vprintfmt+0x89>
  800cf5:	90                   	nop
  800cf6:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800cfa:	0f 89 25 ff ff ff    	jns    800c25 <vprintfmt+0x89>
  800d00:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800d03:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800d06:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800d0d:	e9 13 ff ff ff       	jmpq   800c25 <vprintfmt+0x89>
  800d12:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800d16:	e9 0a ff ff ff       	jmpq   800c25 <vprintfmt+0x89>
  800d1b:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d1e:	83 f8 30             	cmp    $0x30,%eax
  800d21:	73 17                	jae    800d3a <vprintfmt+0x19e>
  800d23:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d27:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d2a:	89 d2                	mov    %edx,%edx
  800d2c:	48 01 d0             	add    %rdx,%rax
  800d2f:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d32:	83 c2 08             	add    $0x8,%edx
  800d35:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d38:	eb 0c                	jmp    800d46 <vprintfmt+0x1aa>
  800d3a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d3e:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d42:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d46:	8b 10                	mov    (%rax),%edx
  800d48:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800d4c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d50:	48 89 ce             	mov    %rcx,%rsi
  800d53:	89 d7                	mov    %edx,%edi
  800d55:	ff d0                	callq  *%rax
  800d57:	e9 37 03 00 00       	jmpq   801093 <vprintfmt+0x4f7>
  800d5c:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800d5f:	83 f8 30             	cmp    $0x30,%eax
  800d62:	73 17                	jae    800d7b <vprintfmt+0x1df>
  800d64:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800d68:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d6b:	89 d2                	mov    %edx,%edx
  800d6d:	48 01 d0             	add    %rdx,%rax
  800d70:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800d73:	83 c2 08             	add    $0x8,%edx
  800d76:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800d79:	eb 0c                	jmp    800d87 <vprintfmt+0x1eb>
  800d7b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800d7f:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800d83:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800d87:	8b 18                	mov    (%rax),%ebx
  800d89:	85 db                	test   %ebx,%ebx
  800d8b:	79 02                	jns    800d8f <vprintfmt+0x1f3>
  800d8d:	f7 db                	neg    %ebx
  800d8f:	83 fb 15             	cmp    $0x15,%ebx
  800d92:	7f 16                	jg     800daa <vprintfmt+0x20e>
  800d94:	48 b8 40 4c 80 00 00 	movabs $0x804c40,%rax
  800d9b:	00 00 00 
  800d9e:	48 63 d3             	movslq %ebx,%rdx
  800da1:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800da5:	4d 85 e4             	test   %r12,%r12
  800da8:	75 2e                	jne    800dd8 <vprintfmt+0x23c>
  800daa:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800dae:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800db2:	89 d9                	mov    %ebx,%ecx
  800db4:	48 ba 01 4d 80 00 00 	movabs $0x804d01,%rdx
  800dbb:	00 00 00 
  800dbe:	48 89 c7             	mov    %rax,%rdi
  800dc1:	b8 00 00 00 00       	mov    $0x0,%eax
  800dc6:	49 b8 a2 10 80 00 00 	movabs $0x8010a2,%r8
  800dcd:	00 00 00 
  800dd0:	41 ff d0             	callq  *%r8
  800dd3:	e9 bb 02 00 00       	jmpq   801093 <vprintfmt+0x4f7>
  800dd8:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ddc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800de0:	4c 89 e1             	mov    %r12,%rcx
  800de3:	48 ba 0a 4d 80 00 00 	movabs $0x804d0a,%rdx
  800dea:	00 00 00 
  800ded:	48 89 c7             	mov    %rax,%rdi
  800df0:	b8 00 00 00 00       	mov    $0x0,%eax
  800df5:	49 b8 a2 10 80 00 00 	movabs $0x8010a2,%r8
  800dfc:	00 00 00 
  800dff:	41 ff d0             	callq  *%r8
  800e02:	e9 8c 02 00 00       	jmpq   801093 <vprintfmt+0x4f7>
  800e07:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e0a:	83 f8 30             	cmp    $0x30,%eax
  800e0d:	73 17                	jae    800e26 <vprintfmt+0x28a>
  800e0f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e13:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e16:	89 d2                	mov    %edx,%edx
  800e18:	48 01 d0             	add    %rdx,%rax
  800e1b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e1e:	83 c2 08             	add    $0x8,%edx
  800e21:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e24:	eb 0c                	jmp    800e32 <vprintfmt+0x296>
  800e26:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800e2a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800e2e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e32:	4c 8b 20             	mov    (%rax),%r12
  800e35:	4d 85 e4             	test   %r12,%r12
  800e38:	75 0a                	jne    800e44 <vprintfmt+0x2a8>
  800e3a:	49 bc 0d 4d 80 00 00 	movabs $0x804d0d,%r12
  800e41:	00 00 00 
  800e44:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e48:	7e 78                	jle    800ec2 <vprintfmt+0x326>
  800e4a:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800e4e:	74 72                	je     800ec2 <vprintfmt+0x326>
  800e50:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800e53:	48 98                	cltq   
  800e55:	48 89 c6             	mov    %rax,%rsi
  800e58:	4c 89 e7             	mov    %r12,%rdi
  800e5b:	48 b8 50 13 80 00 00 	movabs $0x801350,%rax
  800e62:	00 00 00 
  800e65:	ff d0                	callq  *%rax
  800e67:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800e6a:	eb 17                	jmp    800e83 <vprintfmt+0x2e7>
  800e6c:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800e70:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800e74:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800e78:	48 89 ce             	mov    %rcx,%rsi
  800e7b:	89 d7                	mov    %edx,%edi
  800e7d:	ff d0                	callq  *%rax
  800e7f:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800e83:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e87:	7f e3                	jg     800e6c <vprintfmt+0x2d0>
  800e89:	eb 37                	jmp    800ec2 <vprintfmt+0x326>
  800e8b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800e8f:	74 1e                	je     800eaf <vprintfmt+0x313>
  800e91:	83 fb 1f             	cmp    $0x1f,%ebx
  800e94:	7e 05                	jle    800e9b <vprintfmt+0x2ff>
  800e96:	83 fb 7e             	cmp    $0x7e,%ebx
  800e99:	7e 14                	jle    800eaf <vprintfmt+0x313>
  800e9b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800e9f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ea3:	48 89 d6             	mov    %rdx,%rsi
  800ea6:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800eab:	ff d0                	callq  *%rax
  800ead:	eb 0f                	jmp    800ebe <vprintfmt+0x322>
  800eaf:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800eb3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800eb7:	48 89 d6             	mov    %rdx,%rsi
  800eba:	89 df                	mov    %ebx,%edi
  800ebc:	ff d0                	callq  *%rax
  800ebe:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800ec2:	4c 89 e0             	mov    %r12,%rax
  800ec5:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800ec9:	0f b6 00             	movzbl (%rax),%eax
  800ecc:	0f be d8             	movsbl %al,%ebx
  800ecf:	85 db                	test   %ebx,%ebx
  800ed1:	74 28                	je     800efb <vprintfmt+0x35f>
  800ed3:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800ed7:	78 b2                	js     800e8b <vprintfmt+0x2ef>
  800ed9:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800edd:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800ee1:	79 a8                	jns    800e8b <vprintfmt+0x2ef>
  800ee3:	eb 16                	jmp    800efb <vprintfmt+0x35f>
  800ee5:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ee9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800eed:	48 89 d6             	mov    %rdx,%rsi
  800ef0:	bf 20 00 00 00       	mov    $0x20,%edi
  800ef5:	ff d0                	callq  *%rax
  800ef7:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800efb:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800eff:	7f e4                	jg     800ee5 <vprintfmt+0x349>
  800f01:	e9 8d 01 00 00       	jmpq   801093 <vprintfmt+0x4f7>
  800f06:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f0a:	be 03 00 00 00       	mov    $0x3,%esi
  800f0f:	48 89 c7             	mov    %rax,%rdi
  800f12:	48 b8 95 0a 80 00 00 	movabs $0x800a95,%rax
  800f19:	00 00 00 
  800f1c:	ff d0                	callq  *%rax
  800f1e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f22:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f26:	48 85 c0             	test   %rax,%rax
  800f29:	79 1d                	jns    800f48 <vprintfmt+0x3ac>
  800f2b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800f2f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f33:	48 89 d6             	mov    %rdx,%rsi
  800f36:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800f3b:	ff d0                	callq  *%rax
  800f3d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800f41:	48 f7 d8             	neg    %rax
  800f44:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f48:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800f4f:	e9 d2 00 00 00       	jmpq   801026 <vprintfmt+0x48a>
  800f54:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f58:	be 03 00 00 00       	mov    $0x3,%esi
  800f5d:	48 89 c7             	mov    %rax,%rdi
  800f60:	48 b8 8e 09 80 00 00 	movabs $0x80098e,%rax
  800f67:	00 00 00 
  800f6a:	ff d0                	callq  *%rax
  800f6c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f70:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800f77:	e9 aa 00 00 00       	jmpq   801026 <vprintfmt+0x48a>
  800f7c:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800f80:	be 03 00 00 00       	mov    $0x3,%esi
  800f85:	48 89 c7             	mov    %rax,%rdi
  800f88:	48 b8 8e 09 80 00 00 	movabs $0x80098e,%rax
  800f8f:	00 00 00 
  800f92:	ff d0                	callq  *%rax
  800f94:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800f98:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800f9f:	e9 82 00 00 00       	jmpq   801026 <vprintfmt+0x48a>
  800fa4:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fa8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fac:	48 89 d6             	mov    %rdx,%rsi
  800faf:	bf 30 00 00 00       	mov    $0x30,%edi
  800fb4:	ff d0                	callq  *%rax
  800fb6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800fba:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800fbe:	48 89 d6             	mov    %rdx,%rsi
  800fc1:	bf 78 00 00 00       	mov    $0x78,%edi
  800fc6:	ff d0                	callq  *%rax
  800fc8:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800fcb:	83 f8 30             	cmp    $0x30,%eax
  800fce:	73 17                	jae    800fe7 <vprintfmt+0x44b>
  800fd0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800fd4:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fd7:	89 d2                	mov    %edx,%edx
  800fd9:	48 01 d0             	add    %rdx,%rax
  800fdc:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fdf:	83 c2 08             	add    $0x8,%edx
  800fe2:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800fe5:	eb 0c                	jmp    800ff3 <vprintfmt+0x457>
  800fe7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800feb:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800fef:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ff3:	48 8b 00             	mov    (%rax),%rax
  800ff6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ffa:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801001:	eb 23                	jmp    801026 <vprintfmt+0x48a>
  801003:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801007:	be 03 00 00 00       	mov    $0x3,%esi
  80100c:	48 89 c7             	mov    %rax,%rdi
  80100f:	48 b8 8e 09 80 00 00 	movabs $0x80098e,%rax
  801016:	00 00 00 
  801019:	ff d0                	callq  *%rax
  80101b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80101f:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  801026:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  80102b:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80102e:	8b 7d dc             	mov    -0x24(%rbp),%edi
  801031:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801035:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  801039:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80103d:	45 89 c1             	mov    %r8d,%r9d
  801040:	41 89 f8             	mov    %edi,%r8d
  801043:	48 89 c7             	mov    %rax,%rdi
  801046:	48 b8 d6 08 80 00 00 	movabs $0x8008d6,%rax
  80104d:	00 00 00 
  801050:	ff d0                	callq  *%rax
  801052:	eb 3f                	jmp    801093 <vprintfmt+0x4f7>
  801054:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801058:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80105c:	48 89 d6             	mov    %rdx,%rsi
  80105f:	89 df                	mov    %ebx,%edi
  801061:	ff d0                	callq  *%rax
  801063:	eb 2e                	jmp    801093 <vprintfmt+0x4f7>
  801065:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801069:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80106d:	48 89 d6             	mov    %rdx,%rsi
  801070:	bf 25 00 00 00       	mov    $0x25,%edi
  801075:	ff d0                	callq  *%rax
  801077:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80107c:	eb 05                	jmp    801083 <vprintfmt+0x4e7>
  80107e:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801083:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801087:	48 83 e8 01          	sub    $0x1,%rax
  80108b:	0f b6 00             	movzbl (%rax),%eax
  80108e:	3c 25                	cmp    $0x25,%al
  801090:	75 ec                	jne    80107e <vprintfmt+0x4e2>
  801092:	90                   	nop
  801093:	e9 3d fb ff ff       	jmpq   800bd5 <vprintfmt+0x39>
  801098:	90                   	nop
  801099:	48 83 c4 60          	add    $0x60,%rsp
  80109d:	5b                   	pop    %rbx
  80109e:	41 5c                	pop    %r12
  8010a0:	5d                   	pop    %rbp
  8010a1:	c3                   	retq   

00000000008010a2 <printfmt>:
  8010a2:	55                   	push   %rbp
  8010a3:	48 89 e5             	mov    %rsp,%rbp
  8010a6:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  8010ad:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  8010b4:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  8010bb:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  8010c2:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8010c9:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8010d0:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8010d7:	84 c0                	test   %al,%al
  8010d9:	74 20                	je     8010fb <printfmt+0x59>
  8010db:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8010df:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8010e3:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8010e7:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8010eb:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8010ef:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8010f3:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8010f7:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8010fb:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801102:	00 00 00 
  801105:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80110c:	00 00 00 
  80110f:	48 8d 45 10          	lea    0x10(%rbp),%rax
  801113:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  80111a:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  801121:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  801128:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  80112f:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  801136:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  80113d:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  801144:	48 89 c7             	mov    %rax,%rdi
  801147:	48 b8 9c 0b 80 00 00 	movabs $0x800b9c,%rax
  80114e:	00 00 00 
  801151:	ff d0                	callq  *%rax
  801153:	90                   	nop
  801154:	c9                   	leaveq 
  801155:	c3                   	retq   

0000000000801156 <sprintputch>:
  801156:	55                   	push   %rbp
  801157:	48 89 e5             	mov    %rsp,%rbp
  80115a:	48 83 ec 10          	sub    $0x10,%rsp
  80115e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801161:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801165:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801169:	8b 40 10             	mov    0x10(%rax),%eax
  80116c:	8d 50 01             	lea    0x1(%rax),%edx
  80116f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801173:	89 50 10             	mov    %edx,0x10(%rax)
  801176:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80117a:	48 8b 10             	mov    (%rax),%rdx
  80117d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801181:	48 8b 40 08          	mov    0x8(%rax),%rax
  801185:	48 39 c2             	cmp    %rax,%rdx
  801188:	73 17                	jae    8011a1 <sprintputch+0x4b>
  80118a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80118e:	48 8b 00             	mov    (%rax),%rax
  801191:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801195:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801199:	48 89 0a             	mov    %rcx,(%rdx)
  80119c:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80119f:	88 10                	mov    %dl,(%rax)
  8011a1:	90                   	nop
  8011a2:	c9                   	leaveq 
  8011a3:	c3                   	retq   

00000000008011a4 <vsnprintf>:
  8011a4:	55                   	push   %rbp
  8011a5:	48 89 e5             	mov    %rsp,%rbp
  8011a8:	48 83 ec 50          	sub    $0x50,%rsp
  8011ac:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8011b0:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  8011b3:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  8011b7:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  8011bb:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  8011bf:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  8011c3:	48 8b 0a             	mov    (%rdx),%rcx
  8011c6:	48 89 08             	mov    %rcx,(%rax)
  8011c9:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8011cd:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8011d1:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8011d5:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8011d9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8011dd:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8011e1:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  8011e4:	48 98                	cltq   
  8011e6:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8011ea:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8011ee:	48 01 d0             	add    %rdx,%rax
  8011f1:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8011f5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  8011fc:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  801201:	74 06                	je     801209 <vsnprintf+0x65>
  801203:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801207:	7f 07                	jg     801210 <vsnprintf+0x6c>
  801209:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80120e:	eb 2f                	jmp    80123f <vsnprintf+0x9b>
  801210:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  801214:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  801218:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80121c:	48 89 c6             	mov    %rax,%rsi
  80121f:	48 bf 56 11 80 00 00 	movabs $0x801156,%rdi
  801226:	00 00 00 
  801229:	48 b8 9c 0b 80 00 00 	movabs $0x800b9c,%rax
  801230:	00 00 00 
  801233:	ff d0                	callq  *%rax
  801235:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801239:	c6 00 00             	movb   $0x0,(%rax)
  80123c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  80123f:	c9                   	leaveq 
  801240:	c3                   	retq   

0000000000801241 <snprintf>:
  801241:	55                   	push   %rbp
  801242:	48 89 e5             	mov    %rsp,%rbp
  801245:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  80124c:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  801253:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  801259:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  801260:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801267:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80126e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801275:	84 c0                	test   %al,%al
  801277:	74 20                	je     801299 <snprintf+0x58>
  801279:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80127d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801281:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801285:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801289:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80128d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801291:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801295:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801299:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  8012a0:	00 00 00 
  8012a3:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8012aa:	00 00 00 
  8012ad:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8012b1:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8012b8:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8012bf:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8012c6:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  8012cd:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8012d4:	48 8b 0a             	mov    (%rdx),%rcx
  8012d7:	48 89 08             	mov    %rcx,(%rax)
  8012da:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8012de:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8012e2:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8012e6:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8012ea:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  8012f1:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  8012f8:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  8012fe:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801305:	48 89 c7             	mov    %rax,%rdi
  801308:	48 b8 a4 11 80 00 00 	movabs $0x8011a4,%rax
  80130f:	00 00 00 
  801312:	ff d0                	callq  *%rax
  801314:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  80131a:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  801320:	c9                   	leaveq 
  801321:	c3                   	retq   

0000000000801322 <strlen>:
  801322:	55                   	push   %rbp
  801323:	48 89 e5             	mov    %rsp,%rbp
  801326:	48 83 ec 18          	sub    $0x18,%rsp
  80132a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80132e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801335:	eb 09                	jmp    801340 <strlen+0x1e>
  801337:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80133b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801340:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801344:	0f b6 00             	movzbl (%rax),%eax
  801347:	84 c0                	test   %al,%al
  801349:	75 ec                	jne    801337 <strlen+0x15>
  80134b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80134e:	c9                   	leaveq 
  80134f:	c3                   	retq   

0000000000801350 <strnlen>:
  801350:	55                   	push   %rbp
  801351:	48 89 e5             	mov    %rsp,%rbp
  801354:	48 83 ec 20          	sub    $0x20,%rsp
  801358:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80135c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801360:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801367:	eb 0e                	jmp    801377 <strnlen+0x27>
  801369:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80136d:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801372:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801377:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80137c:	74 0b                	je     801389 <strnlen+0x39>
  80137e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801382:	0f b6 00             	movzbl (%rax),%eax
  801385:	84 c0                	test   %al,%al
  801387:	75 e0                	jne    801369 <strnlen+0x19>
  801389:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80138c:	c9                   	leaveq 
  80138d:	c3                   	retq   

000000000080138e <strcpy>:
  80138e:	55                   	push   %rbp
  80138f:	48 89 e5             	mov    %rsp,%rbp
  801392:	48 83 ec 20          	sub    $0x20,%rsp
  801396:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80139a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80139e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013a2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013a6:	90                   	nop
  8013a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013ab:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8013af:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8013b3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8013b7:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8013bb:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8013bf:	0f b6 12             	movzbl (%rdx),%edx
  8013c2:	88 10                	mov    %dl,(%rax)
  8013c4:	0f b6 00             	movzbl (%rax),%eax
  8013c7:	84 c0                	test   %al,%al
  8013c9:	75 dc                	jne    8013a7 <strcpy+0x19>
  8013cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013cf:	c9                   	leaveq 
  8013d0:	c3                   	retq   

00000000008013d1 <strcat>:
  8013d1:	55                   	push   %rbp
  8013d2:	48 89 e5             	mov    %rsp,%rbp
  8013d5:	48 83 ec 20          	sub    $0x20,%rsp
  8013d9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013dd:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013e1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013e5:	48 89 c7             	mov    %rax,%rdi
  8013e8:	48 b8 22 13 80 00 00 	movabs $0x801322,%rax
  8013ef:	00 00 00 
  8013f2:	ff d0                	callq  *%rax
  8013f4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8013f7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8013fa:	48 63 d0             	movslq %eax,%rdx
  8013fd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801401:	48 01 c2             	add    %rax,%rdx
  801404:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801408:	48 89 c6             	mov    %rax,%rsi
  80140b:	48 89 d7             	mov    %rdx,%rdi
  80140e:	48 b8 8e 13 80 00 00 	movabs $0x80138e,%rax
  801415:	00 00 00 
  801418:	ff d0                	callq  *%rax
  80141a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80141e:	c9                   	leaveq 
  80141f:	c3                   	retq   

0000000000801420 <strncpy>:
  801420:	55                   	push   %rbp
  801421:	48 89 e5             	mov    %rsp,%rbp
  801424:	48 83 ec 28          	sub    $0x28,%rsp
  801428:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80142c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801430:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801434:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801438:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80143c:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  801443:	00 
  801444:	eb 2a                	jmp    801470 <strncpy+0x50>
  801446:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80144a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80144e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801452:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801456:	0f b6 12             	movzbl (%rdx),%edx
  801459:	88 10                	mov    %dl,(%rax)
  80145b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80145f:	0f b6 00             	movzbl (%rax),%eax
  801462:	84 c0                	test   %al,%al
  801464:	74 05                	je     80146b <strncpy+0x4b>
  801466:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  80146b:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801470:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801474:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801478:	72 cc                	jb     801446 <strncpy+0x26>
  80147a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80147e:	c9                   	leaveq 
  80147f:	c3                   	retq   

0000000000801480 <strlcpy>:
  801480:	55                   	push   %rbp
  801481:	48 89 e5             	mov    %rsp,%rbp
  801484:	48 83 ec 28          	sub    $0x28,%rsp
  801488:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80148c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801490:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801494:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801498:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80149c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8014a1:	74 3d                	je     8014e0 <strlcpy+0x60>
  8014a3:	eb 1d                	jmp    8014c2 <strlcpy+0x42>
  8014a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014a9:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8014ad:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014b1:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8014b5:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8014b9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8014bd:	0f b6 12             	movzbl (%rdx),%edx
  8014c0:	88 10                	mov    %dl,(%rax)
  8014c2:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8014c7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8014cc:	74 0b                	je     8014d9 <strlcpy+0x59>
  8014ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8014d2:	0f b6 00             	movzbl (%rax),%eax
  8014d5:	84 c0                	test   %al,%al
  8014d7:	75 cc                	jne    8014a5 <strlcpy+0x25>
  8014d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014dd:	c6 00 00             	movb   $0x0,(%rax)
  8014e0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014e4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014e8:	48 29 c2             	sub    %rax,%rdx
  8014eb:	48 89 d0             	mov    %rdx,%rax
  8014ee:	c9                   	leaveq 
  8014ef:	c3                   	retq   

00000000008014f0 <strcmp>:
  8014f0:	55                   	push   %rbp
  8014f1:	48 89 e5             	mov    %rsp,%rbp
  8014f4:	48 83 ec 10          	sub    $0x10,%rsp
  8014f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014fc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801500:	eb 0a                	jmp    80150c <strcmp+0x1c>
  801502:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801507:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80150c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801510:	0f b6 00             	movzbl (%rax),%eax
  801513:	84 c0                	test   %al,%al
  801515:	74 12                	je     801529 <strcmp+0x39>
  801517:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80151b:	0f b6 10             	movzbl (%rax),%edx
  80151e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801522:	0f b6 00             	movzbl (%rax),%eax
  801525:	38 c2                	cmp    %al,%dl
  801527:	74 d9                	je     801502 <strcmp+0x12>
  801529:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80152d:	0f b6 00             	movzbl (%rax),%eax
  801530:	0f b6 d0             	movzbl %al,%edx
  801533:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801537:	0f b6 00             	movzbl (%rax),%eax
  80153a:	0f b6 c0             	movzbl %al,%eax
  80153d:	29 c2                	sub    %eax,%edx
  80153f:	89 d0                	mov    %edx,%eax
  801541:	c9                   	leaveq 
  801542:	c3                   	retq   

0000000000801543 <strncmp>:
  801543:	55                   	push   %rbp
  801544:	48 89 e5             	mov    %rsp,%rbp
  801547:	48 83 ec 18          	sub    $0x18,%rsp
  80154b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80154f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801553:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801557:	eb 0f                	jmp    801568 <strncmp+0x25>
  801559:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80155e:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801563:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801568:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80156d:	74 1d                	je     80158c <strncmp+0x49>
  80156f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801573:	0f b6 00             	movzbl (%rax),%eax
  801576:	84 c0                	test   %al,%al
  801578:	74 12                	je     80158c <strncmp+0x49>
  80157a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80157e:	0f b6 10             	movzbl (%rax),%edx
  801581:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801585:	0f b6 00             	movzbl (%rax),%eax
  801588:	38 c2                	cmp    %al,%dl
  80158a:	74 cd                	je     801559 <strncmp+0x16>
  80158c:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801591:	75 07                	jne    80159a <strncmp+0x57>
  801593:	b8 00 00 00 00       	mov    $0x0,%eax
  801598:	eb 18                	jmp    8015b2 <strncmp+0x6f>
  80159a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80159e:	0f b6 00             	movzbl (%rax),%eax
  8015a1:	0f b6 d0             	movzbl %al,%edx
  8015a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8015a8:	0f b6 00             	movzbl (%rax),%eax
  8015ab:	0f b6 c0             	movzbl %al,%eax
  8015ae:	29 c2                	sub    %eax,%edx
  8015b0:	89 d0                	mov    %edx,%eax
  8015b2:	c9                   	leaveq 
  8015b3:	c3                   	retq   

00000000008015b4 <strchr>:
  8015b4:	55                   	push   %rbp
  8015b5:	48 89 e5             	mov    %rsp,%rbp
  8015b8:	48 83 ec 10          	sub    $0x10,%rsp
  8015bc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015c0:	89 f0                	mov    %esi,%eax
  8015c2:	88 45 f4             	mov    %al,-0xc(%rbp)
  8015c5:	eb 17                	jmp    8015de <strchr+0x2a>
  8015c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015cb:	0f b6 00             	movzbl (%rax),%eax
  8015ce:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8015d1:	75 06                	jne    8015d9 <strchr+0x25>
  8015d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015d7:	eb 15                	jmp    8015ee <strchr+0x3a>
  8015d9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8015e2:	0f b6 00             	movzbl (%rax),%eax
  8015e5:	84 c0                	test   %al,%al
  8015e7:	75 de                	jne    8015c7 <strchr+0x13>
  8015e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8015ee:	c9                   	leaveq 
  8015ef:	c3                   	retq   

00000000008015f0 <strfind>:
  8015f0:	55                   	push   %rbp
  8015f1:	48 89 e5             	mov    %rsp,%rbp
  8015f4:	48 83 ec 10          	sub    $0x10,%rsp
  8015f8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8015fc:	89 f0                	mov    %esi,%eax
  8015fe:	88 45 f4             	mov    %al,-0xc(%rbp)
  801601:	eb 11                	jmp    801614 <strfind+0x24>
  801603:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801607:	0f b6 00             	movzbl (%rax),%eax
  80160a:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80160d:	74 12                	je     801621 <strfind+0x31>
  80160f:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801614:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801618:	0f b6 00             	movzbl (%rax),%eax
  80161b:	84 c0                	test   %al,%al
  80161d:	75 e4                	jne    801603 <strfind+0x13>
  80161f:	eb 01                	jmp    801622 <strfind+0x32>
  801621:	90                   	nop
  801622:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801626:	c9                   	leaveq 
  801627:	c3                   	retq   

0000000000801628 <memset>:
  801628:	55                   	push   %rbp
  801629:	48 89 e5             	mov    %rsp,%rbp
  80162c:	48 83 ec 18          	sub    $0x18,%rsp
  801630:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801634:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801637:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80163b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801640:	75 06                	jne    801648 <memset+0x20>
  801642:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801646:	eb 69                	jmp    8016b1 <memset+0x89>
  801648:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80164c:	83 e0 03             	and    $0x3,%eax
  80164f:	48 85 c0             	test   %rax,%rax
  801652:	75 48                	jne    80169c <memset+0x74>
  801654:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801658:	83 e0 03             	and    $0x3,%eax
  80165b:	48 85 c0             	test   %rax,%rax
  80165e:	75 3c                	jne    80169c <memset+0x74>
  801660:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801667:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80166a:	c1 e0 18             	shl    $0x18,%eax
  80166d:	89 c2                	mov    %eax,%edx
  80166f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801672:	c1 e0 10             	shl    $0x10,%eax
  801675:	09 c2                	or     %eax,%edx
  801677:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80167a:	c1 e0 08             	shl    $0x8,%eax
  80167d:	09 d0                	or     %edx,%eax
  80167f:	09 45 f4             	or     %eax,-0xc(%rbp)
  801682:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801686:	48 c1 e8 02          	shr    $0x2,%rax
  80168a:	48 89 c1             	mov    %rax,%rcx
  80168d:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801691:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801694:	48 89 d7             	mov    %rdx,%rdi
  801697:	fc                   	cld    
  801698:	f3 ab                	rep stos %eax,%es:(%rdi)
  80169a:	eb 11                	jmp    8016ad <memset+0x85>
  80169c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016a0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8016a3:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8016a7:	48 89 d7             	mov    %rdx,%rdi
  8016aa:	fc                   	cld    
  8016ab:	f3 aa                	rep stos %al,%es:(%rdi)
  8016ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016b1:	c9                   	leaveq 
  8016b2:	c3                   	retq   

00000000008016b3 <memmove>:
  8016b3:	55                   	push   %rbp
  8016b4:	48 89 e5             	mov    %rsp,%rbp
  8016b7:	48 83 ec 28          	sub    $0x28,%rsp
  8016bb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8016bf:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8016c3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8016c7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8016cb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8016cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8016d3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8016d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016db:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8016df:	0f 83 88 00 00 00    	jae    80176d <memmove+0xba>
  8016e5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8016e9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016ed:	48 01 d0             	add    %rdx,%rax
  8016f0:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8016f4:	76 77                	jbe    80176d <memmove+0xba>
  8016f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016fa:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8016fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801702:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801706:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80170a:	83 e0 03             	and    $0x3,%eax
  80170d:	48 85 c0             	test   %rax,%rax
  801710:	75 3b                	jne    80174d <memmove+0x9a>
  801712:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801716:	83 e0 03             	and    $0x3,%eax
  801719:	48 85 c0             	test   %rax,%rax
  80171c:	75 2f                	jne    80174d <memmove+0x9a>
  80171e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801722:	83 e0 03             	and    $0x3,%eax
  801725:	48 85 c0             	test   %rax,%rax
  801728:	75 23                	jne    80174d <memmove+0x9a>
  80172a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80172e:	48 83 e8 04          	sub    $0x4,%rax
  801732:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801736:	48 83 ea 04          	sub    $0x4,%rdx
  80173a:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80173e:	48 c1 e9 02          	shr    $0x2,%rcx
  801742:	48 89 c7             	mov    %rax,%rdi
  801745:	48 89 d6             	mov    %rdx,%rsi
  801748:	fd                   	std    
  801749:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80174b:	eb 1d                	jmp    80176a <memmove+0xb7>
  80174d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801751:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801755:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801759:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  80175d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801761:	48 89 d7             	mov    %rdx,%rdi
  801764:	48 89 c1             	mov    %rax,%rcx
  801767:	fd                   	std    
  801768:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  80176a:	fc                   	cld    
  80176b:	eb 57                	jmp    8017c4 <memmove+0x111>
  80176d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801771:	83 e0 03             	and    $0x3,%eax
  801774:	48 85 c0             	test   %rax,%rax
  801777:	75 36                	jne    8017af <memmove+0xfc>
  801779:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80177d:	83 e0 03             	and    $0x3,%eax
  801780:	48 85 c0             	test   %rax,%rax
  801783:	75 2a                	jne    8017af <memmove+0xfc>
  801785:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801789:	83 e0 03             	and    $0x3,%eax
  80178c:	48 85 c0             	test   %rax,%rax
  80178f:	75 1e                	jne    8017af <memmove+0xfc>
  801791:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801795:	48 c1 e8 02          	shr    $0x2,%rax
  801799:	48 89 c1             	mov    %rax,%rcx
  80179c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017a0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017a4:	48 89 c7             	mov    %rax,%rdi
  8017a7:	48 89 d6             	mov    %rdx,%rsi
  8017aa:	fc                   	cld    
  8017ab:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8017ad:	eb 15                	jmp    8017c4 <memmove+0x111>
  8017af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8017b3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8017b7:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8017bb:	48 89 c7             	mov    %rax,%rdi
  8017be:	48 89 d6             	mov    %rdx,%rsi
  8017c1:	fc                   	cld    
  8017c2:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8017c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017c8:	c9                   	leaveq 
  8017c9:	c3                   	retq   

00000000008017ca <memcpy>:
  8017ca:	55                   	push   %rbp
  8017cb:	48 89 e5             	mov    %rsp,%rbp
  8017ce:	48 83 ec 18          	sub    $0x18,%rsp
  8017d2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8017d6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8017da:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8017de:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8017e2:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8017e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017ea:	48 89 ce             	mov    %rcx,%rsi
  8017ed:	48 89 c7             	mov    %rax,%rdi
  8017f0:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  8017f7:	00 00 00 
  8017fa:	ff d0                	callq  *%rax
  8017fc:	c9                   	leaveq 
  8017fd:	c3                   	retq   

00000000008017fe <memcmp>:
  8017fe:	55                   	push   %rbp
  8017ff:	48 89 e5             	mov    %rsp,%rbp
  801802:	48 83 ec 28          	sub    $0x28,%rsp
  801806:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80180a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80180e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801812:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801816:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80181a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80181e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801822:	eb 36                	jmp    80185a <memcmp+0x5c>
  801824:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801828:	0f b6 10             	movzbl (%rax),%edx
  80182b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80182f:	0f b6 00             	movzbl (%rax),%eax
  801832:	38 c2                	cmp    %al,%dl
  801834:	74 1a                	je     801850 <memcmp+0x52>
  801836:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80183a:	0f b6 00             	movzbl (%rax),%eax
  80183d:	0f b6 d0             	movzbl %al,%edx
  801840:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801844:	0f b6 00             	movzbl (%rax),%eax
  801847:	0f b6 c0             	movzbl %al,%eax
  80184a:	29 c2                	sub    %eax,%edx
  80184c:	89 d0                	mov    %edx,%eax
  80184e:	eb 20                	jmp    801870 <memcmp+0x72>
  801850:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801855:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80185a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80185e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801862:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801866:	48 85 c0             	test   %rax,%rax
  801869:	75 b9                	jne    801824 <memcmp+0x26>
  80186b:	b8 00 00 00 00       	mov    $0x0,%eax
  801870:	c9                   	leaveq 
  801871:	c3                   	retq   

0000000000801872 <memfind>:
  801872:	55                   	push   %rbp
  801873:	48 89 e5             	mov    %rsp,%rbp
  801876:	48 83 ec 28          	sub    $0x28,%rsp
  80187a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80187e:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801881:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801885:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801889:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80188d:	48 01 d0             	add    %rdx,%rax
  801890:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801894:	eb 13                	jmp    8018a9 <memfind+0x37>
  801896:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80189a:	0f b6 00             	movzbl (%rax),%eax
  80189d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  8018a0:	38 d0                	cmp    %dl,%al
  8018a2:	74 11                	je     8018b5 <memfind+0x43>
  8018a4:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8018a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018ad:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  8018b1:	72 e3                	jb     801896 <memfind+0x24>
  8018b3:	eb 01                	jmp    8018b6 <memfind+0x44>
  8018b5:	90                   	nop
  8018b6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8018ba:	c9                   	leaveq 
  8018bb:	c3                   	retq   

00000000008018bc <strtol>:
  8018bc:	55                   	push   %rbp
  8018bd:	48 89 e5             	mov    %rsp,%rbp
  8018c0:	48 83 ec 38          	sub    $0x38,%rsp
  8018c4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8018c8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8018cc:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8018cf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8018d6:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8018dd:	00 
  8018de:	eb 05                	jmp    8018e5 <strtol+0x29>
  8018e0:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8018e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018e9:	0f b6 00             	movzbl (%rax),%eax
  8018ec:	3c 20                	cmp    $0x20,%al
  8018ee:	74 f0                	je     8018e0 <strtol+0x24>
  8018f0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018f4:	0f b6 00             	movzbl (%rax),%eax
  8018f7:	3c 09                	cmp    $0x9,%al
  8018f9:	74 e5                	je     8018e0 <strtol+0x24>
  8018fb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018ff:	0f b6 00             	movzbl (%rax),%eax
  801902:	3c 2b                	cmp    $0x2b,%al
  801904:	75 07                	jne    80190d <strtol+0x51>
  801906:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80190b:	eb 17                	jmp    801924 <strtol+0x68>
  80190d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801911:	0f b6 00             	movzbl (%rax),%eax
  801914:	3c 2d                	cmp    $0x2d,%al
  801916:	75 0c                	jne    801924 <strtol+0x68>
  801918:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80191d:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801924:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801928:	74 06                	je     801930 <strtol+0x74>
  80192a:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80192e:	75 28                	jne    801958 <strtol+0x9c>
  801930:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801934:	0f b6 00             	movzbl (%rax),%eax
  801937:	3c 30                	cmp    $0x30,%al
  801939:	75 1d                	jne    801958 <strtol+0x9c>
  80193b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80193f:	48 83 c0 01          	add    $0x1,%rax
  801943:	0f b6 00             	movzbl (%rax),%eax
  801946:	3c 78                	cmp    $0x78,%al
  801948:	75 0e                	jne    801958 <strtol+0x9c>
  80194a:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80194f:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801956:	eb 2c                	jmp    801984 <strtol+0xc8>
  801958:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80195c:	75 19                	jne    801977 <strtol+0xbb>
  80195e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801962:	0f b6 00             	movzbl (%rax),%eax
  801965:	3c 30                	cmp    $0x30,%al
  801967:	75 0e                	jne    801977 <strtol+0xbb>
  801969:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80196e:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801975:	eb 0d                	jmp    801984 <strtol+0xc8>
  801977:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  80197b:	75 07                	jne    801984 <strtol+0xc8>
  80197d:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801984:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801988:	0f b6 00             	movzbl (%rax),%eax
  80198b:	3c 2f                	cmp    $0x2f,%al
  80198d:	7e 1d                	jle    8019ac <strtol+0xf0>
  80198f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801993:	0f b6 00             	movzbl (%rax),%eax
  801996:	3c 39                	cmp    $0x39,%al
  801998:	7f 12                	jg     8019ac <strtol+0xf0>
  80199a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80199e:	0f b6 00             	movzbl (%rax),%eax
  8019a1:	0f be c0             	movsbl %al,%eax
  8019a4:	83 e8 30             	sub    $0x30,%eax
  8019a7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8019aa:	eb 4e                	jmp    8019fa <strtol+0x13e>
  8019ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019b0:	0f b6 00             	movzbl (%rax),%eax
  8019b3:	3c 60                	cmp    $0x60,%al
  8019b5:	7e 1d                	jle    8019d4 <strtol+0x118>
  8019b7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019bb:	0f b6 00             	movzbl (%rax),%eax
  8019be:	3c 7a                	cmp    $0x7a,%al
  8019c0:	7f 12                	jg     8019d4 <strtol+0x118>
  8019c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019c6:	0f b6 00             	movzbl (%rax),%eax
  8019c9:	0f be c0             	movsbl %al,%eax
  8019cc:	83 e8 57             	sub    $0x57,%eax
  8019cf:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8019d2:	eb 26                	jmp    8019fa <strtol+0x13e>
  8019d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019d8:	0f b6 00             	movzbl (%rax),%eax
  8019db:	3c 40                	cmp    $0x40,%al
  8019dd:	7e 47                	jle    801a26 <strtol+0x16a>
  8019df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019e3:	0f b6 00             	movzbl (%rax),%eax
  8019e6:	3c 5a                	cmp    $0x5a,%al
  8019e8:	7f 3c                	jg     801a26 <strtol+0x16a>
  8019ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019ee:	0f b6 00             	movzbl (%rax),%eax
  8019f1:	0f be c0             	movsbl %al,%eax
  8019f4:	83 e8 37             	sub    $0x37,%eax
  8019f7:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8019fa:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8019fd:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801a00:	7d 23                	jge    801a25 <strtol+0x169>
  801a02:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a07:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801a0a:	48 98                	cltq   
  801a0c:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801a11:	48 89 c2             	mov    %rax,%rdx
  801a14:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801a17:	48 98                	cltq   
  801a19:	48 01 d0             	add    %rdx,%rax
  801a1c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801a20:	e9 5f ff ff ff       	jmpq   801984 <strtol+0xc8>
  801a25:	90                   	nop
  801a26:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801a2b:	74 0b                	je     801a38 <strtol+0x17c>
  801a2d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a31:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801a35:	48 89 10             	mov    %rdx,(%rax)
  801a38:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801a3c:	74 09                	je     801a47 <strtol+0x18b>
  801a3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a42:	48 f7 d8             	neg    %rax
  801a45:	eb 04                	jmp    801a4b <strtol+0x18f>
  801a47:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801a4b:	c9                   	leaveq 
  801a4c:	c3                   	retq   

0000000000801a4d <strstr>:
  801a4d:	55                   	push   %rbp
  801a4e:	48 89 e5             	mov    %rsp,%rbp
  801a51:	48 83 ec 30          	sub    $0x30,%rsp
  801a55:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801a59:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801a5d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a61:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801a65:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801a69:	0f b6 00             	movzbl (%rax),%eax
  801a6c:	88 45 ff             	mov    %al,-0x1(%rbp)
  801a6f:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801a73:	75 06                	jne    801a7b <strstr+0x2e>
  801a75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a79:	eb 6b                	jmp    801ae6 <strstr+0x99>
  801a7b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801a7f:	48 89 c7             	mov    %rax,%rdi
  801a82:	48 b8 22 13 80 00 00 	movabs $0x801322,%rax
  801a89:	00 00 00 
  801a8c:	ff d0                	callq  *%rax
  801a8e:	48 98                	cltq   
  801a90:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801a94:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a98:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801a9c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801aa0:	0f b6 00             	movzbl (%rax),%eax
  801aa3:	88 45 ef             	mov    %al,-0x11(%rbp)
  801aa6:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801aaa:	75 07                	jne    801ab3 <strstr+0x66>
  801aac:	b8 00 00 00 00       	mov    $0x0,%eax
  801ab1:	eb 33                	jmp    801ae6 <strstr+0x99>
  801ab3:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801ab7:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801aba:	75 d8                	jne    801a94 <strstr+0x47>
  801abc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ac0:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801ac4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ac8:	48 89 ce             	mov    %rcx,%rsi
  801acb:	48 89 c7             	mov    %rax,%rdi
  801ace:	48 b8 43 15 80 00 00 	movabs $0x801543,%rax
  801ad5:	00 00 00 
  801ad8:	ff d0                	callq  *%rax
  801ada:	85 c0                	test   %eax,%eax
  801adc:	75 b6                	jne    801a94 <strstr+0x47>
  801ade:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ae2:	48 83 e8 01          	sub    $0x1,%rax
  801ae6:	c9                   	leaveq 
  801ae7:	c3                   	retq   

0000000000801ae8 <syscall>:
  801ae8:	55                   	push   %rbp
  801ae9:	48 89 e5             	mov    %rsp,%rbp
  801aec:	53                   	push   %rbx
  801aed:	48 83 ec 48          	sub    $0x48,%rsp
  801af1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801af4:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801af7:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801afb:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801aff:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801b03:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801b07:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801b0a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801b0e:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801b12:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801b16:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801b1a:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801b1e:	4c 89 c3             	mov    %r8,%rbx
  801b21:	cd 30                	int    $0x30
  801b23:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801b27:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801b2b:	74 3e                	je     801b6b <syscall+0x83>
  801b2d:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801b32:	7e 37                	jle    801b6b <syscall+0x83>
  801b34:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801b38:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801b3b:	49 89 d0             	mov    %rdx,%r8
  801b3e:	89 c1                	mov    %eax,%ecx
  801b40:	48 ba c8 4f 80 00 00 	movabs $0x804fc8,%rdx
  801b47:	00 00 00 
  801b4a:	be 24 00 00 00       	mov    $0x24,%esi
  801b4f:	48 bf e5 4f 80 00 00 	movabs $0x804fe5,%rdi
  801b56:	00 00 00 
  801b59:	b8 00 00 00 00       	mov    $0x0,%eax
  801b5e:	49 b9 c4 05 80 00 00 	movabs $0x8005c4,%r9
  801b65:	00 00 00 
  801b68:	41 ff d1             	callq  *%r9
  801b6b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801b6f:	48 83 c4 48          	add    $0x48,%rsp
  801b73:	5b                   	pop    %rbx
  801b74:	5d                   	pop    %rbp
  801b75:	c3                   	retq   

0000000000801b76 <sys_cputs>:
  801b76:	55                   	push   %rbp
  801b77:	48 89 e5             	mov    %rsp,%rbp
  801b7a:	48 83 ec 10          	sub    $0x10,%rsp
  801b7e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801b82:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b86:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801b8a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b8e:	48 83 ec 08          	sub    $0x8,%rsp
  801b92:	6a 00                	pushq  $0x0
  801b94:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b9a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ba0:	48 89 d1             	mov    %rdx,%rcx
  801ba3:	48 89 c2             	mov    %rax,%rdx
  801ba6:	be 00 00 00 00       	mov    $0x0,%esi
  801bab:	bf 00 00 00 00       	mov    $0x0,%edi
  801bb0:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801bb7:	00 00 00 
  801bba:	ff d0                	callq  *%rax
  801bbc:	48 83 c4 10          	add    $0x10,%rsp
  801bc0:	90                   	nop
  801bc1:	c9                   	leaveq 
  801bc2:	c3                   	retq   

0000000000801bc3 <sys_cgetc>:
  801bc3:	55                   	push   %rbp
  801bc4:	48 89 e5             	mov    %rsp,%rbp
  801bc7:	48 83 ec 08          	sub    $0x8,%rsp
  801bcb:	6a 00                	pushq  $0x0
  801bcd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801bd3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801bd9:	b9 00 00 00 00       	mov    $0x0,%ecx
  801bde:	ba 00 00 00 00       	mov    $0x0,%edx
  801be3:	be 00 00 00 00       	mov    $0x0,%esi
  801be8:	bf 01 00 00 00       	mov    $0x1,%edi
  801bed:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801bf4:	00 00 00 
  801bf7:	ff d0                	callq  *%rax
  801bf9:	48 83 c4 10          	add    $0x10,%rsp
  801bfd:	c9                   	leaveq 
  801bfe:	c3                   	retq   

0000000000801bff <sys_env_destroy>:
  801bff:	55                   	push   %rbp
  801c00:	48 89 e5             	mov    %rsp,%rbp
  801c03:	48 83 ec 10          	sub    $0x10,%rsp
  801c07:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801c0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801c0d:	48 98                	cltq   
  801c0f:	48 83 ec 08          	sub    $0x8,%rsp
  801c13:	6a 00                	pushq  $0x0
  801c15:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c1b:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c21:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c26:	48 89 c2             	mov    %rax,%rdx
  801c29:	be 01 00 00 00       	mov    $0x1,%esi
  801c2e:	bf 03 00 00 00       	mov    $0x3,%edi
  801c33:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801c3a:	00 00 00 
  801c3d:	ff d0                	callq  *%rax
  801c3f:	48 83 c4 10          	add    $0x10,%rsp
  801c43:	c9                   	leaveq 
  801c44:	c3                   	retq   

0000000000801c45 <sys_getenvid>:
  801c45:	55                   	push   %rbp
  801c46:	48 89 e5             	mov    %rsp,%rbp
  801c49:	48 83 ec 08          	sub    $0x8,%rsp
  801c4d:	6a 00                	pushq  $0x0
  801c4f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c55:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c5b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c60:	ba 00 00 00 00       	mov    $0x0,%edx
  801c65:	be 00 00 00 00       	mov    $0x0,%esi
  801c6a:	bf 02 00 00 00       	mov    $0x2,%edi
  801c6f:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801c76:	00 00 00 
  801c79:	ff d0                	callq  *%rax
  801c7b:	48 83 c4 10          	add    $0x10,%rsp
  801c7f:	c9                   	leaveq 
  801c80:	c3                   	retq   

0000000000801c81 <sys_yield>:
  801c81:	55                   	push   %rbp
  801c82:	48 89 e5             	mov    %rsp,%rbp
  801c85:	48 83 ec 08          	sub    $0x8,%rsp
  801c89:	6a 00                	pushq  $0x0
  801c8b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c91:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c97:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c9c:	ba 00 00 00 00       	mov    $0x0,%edx
  801ca1:	be 00 00 00 00       	mov    $0x0,%esi
  801ca6:	bf 0b 00 00 00       	mov    $0xb,%edi
  801cab:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801cb2:	00 00 00 
  801cb5:	ff d0                	callq  *%rax
  801cb7:	48 83 c4 10          	add    $0x10,%rsp
  801cbb:	90                   	nop
  801cbc:	c9                   	leaveq 
  801cbd:	c3                   	retq   

0000000000801cbe <sys_page_alloc>:
  801cbe:	55                   	push   %rbp
  801cbf:	48 89 e5             	mov    %rsp,%rbp
  801cc2:	48 83 ec 10          	sub    $0x10,%rsp
  801cc6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801cc9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ccd:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801cd0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801cd3:	48 63 c8             	movslq %eax,%rcx
  801cd6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801cda:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801cdd:	48 98                	cltq   
  801cdf:	48 83 ec 08          	sub    $0x8,%rsp
  801ce3:	6a 00                	pushq  $0x0
  801ce5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801ceb:	49 89 c8             	mov    %rcx,%r8
  801cee:	48 89 d1             	mov    %rdx,%rcx
  801cf1:	48 89 c2             	mov    %rax,%rdx
  801cf4:	be 01 00 00 00       	mov    $0x1,%esi
  801cf9:	bf 04 00 00 00       	mov    $0x4,%edi
  801cfe:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801d05:	00 00 00 
  801d08:	ff d0                	callq  *%rax
  801d0a:	48 83 c4 10          	add    $0x10,%rsp
  801d0e:	c9                   	leaveq 
  801d0f:	c3                   	retq   

0000000000801d10 <sys_page_map>:
  801d10:	55                   	push   %rbp
  801d11:	48 89 e5             	mov    %rsp,%rbp
  801d14:	48 83 ec 20          	sub    $0x20,%rsp
  801d18:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d1b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d1f:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d22:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d26:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d2a:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d2d:	48 63 c8             	movslq %eax,%rcx
  801d30:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d34:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d37:	48 63 f0             	movslq %eax,%rsi
  801d3a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d3e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d41:	48 98                	cltq   
  801d43:	48 83 ec 08          	sub    $0x8,%rsp
  801d47:	51                   	push   %rcx
  801d48:	49 89 f9             	mov    %rdi,%r9
  801d4b:	49 89 f0             	mov    %rsi,%r8
  801d4e:	48 89 d1             	mov    %rdx,%rcx
  801d51:	48 89 c2             	mov    %rax,%rdx
  801d54:	be 01 00 00 00       	mov    $0x1,%esi
  801d59:	bf 05 00 00 00       	mov    $0x5,%edi
  801d5e:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801d65:	00 00 00 
  801d68:	ff d0                	callq  *%rax
  801d6a:	48 83 c4 10          	add    $0x10,%rsp
  801d6e:	c9                   	leaveq 
  801d6f:	c3                   	retq   

0000000000801d70 <sys_page_unmap>:
  801d70:	55                   	push   %rbp
  801d71:	48 89 e5             	mov    %rsp,%rbp
  801d74:	48 83 ec 10          	sub    $0x10,%rsp
  801d78:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d7b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d7f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d83:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d86:	48 98                	cltq   
  801d88:	48 83 ec 08          	sub    $0x8,%rsp
  801d8c:	6a 00                	pushq  $0x0
  801d8e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d94:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d9a:	48 89 d1             	mov    %rdx,%rcx
  801d9d:	48 89 c2             	mov    %rax,%rdx
  801da0:	be 01 00 00 00       	mov    $0x1,%esi
  801da5:	bf 06 00 00 00       	mov    $0x6,%edi
  801daa:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801db1:	00 00 00 
  801db4:	ff d0                	callq  *%rax
  801db6:	48 83 c4 10          	add    $0x10,%rsp
  801dba:	c9                   	leaveq 
  801dbb:	c3                   	retq   

0000000000801dbc <sys_env_set_status>:
  801dbc:	55                   	push   %rbp
  801dbd:	48 89 e5             	mov    %rsp,%rbp
  801dc0:	48 83 ec 10          	sub    $0x10,%rsp
  801dc4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801dc7:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801dca:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801dcd:	48 63 d0             	movslq %eax,%rdx
  801dd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801dd3:	48 98                	cltq   
  801dd5:	48 83 ec 08          	sub    $0x8,%rsp
  801dd9:	6a 00                	pushq  $0x0
  801ddb:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801de1:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801de7:	48 89 d1             	mov    %rdx,%rcx
  801dea:	48 89 c2             	mov    %rax,%rdx
  801ded:	be 01 00 00 00       	mov    $0x1,%esi
  801df2:	bf 08 00 00 00       	mov    $0x8,%edi
  801df7:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801dfe:	00 00 00 
  801e01:	ff d0                	callq  *%rax
  801e03:	48 83 c4 10          	add    $0x10,%rsp
  801e07:	c9                   	leaveq 
  801e08:	c3                   	retq   

0000000000801e09 <sys_env_set_trapframe>:
  801e09:	55                   	push   %rbp
  801e0a:	48 89 e5             	mov    %rsp,%rbp
  801e0d:	48 83 ec 10          	sub    $0x10,%rsp
  801e11:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e14:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e18:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e1c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e1f:	48 98                	cltq   
  801e21:	48 83 ec 08          	sub    $0x8,%rsp
  801e25:	6a 00                	pushq  $0x0
  801e27:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e2d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e33:	48 89 d1             	mov    %rdx,%rcx
  801e36:	48 89 c2             	mov    %rax,%rdx
  801e39:	be 01 00 00 00       	mov    $0x1,%esi
  801e3e:	bf 09 00 00 00       	mov    $0x9,%edi
  801e43:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801e4a:	00 00 00 
  801e4d:	ff d0                	callq  *%rax
  801e4f:	48 83 c4 10          	add    $0x10,%rsp
  801e53:	c9                   	leaveq 
  801e54:	c3                   	retq   

0000000000801e55 <sys_env_set_pgfault_upcall>:
  801e55:	55                   	push   %rbp
  801e56:	48 89 e5             	mov    %rsp,%rbp
  801e59:	48 83 ec 10          	sub    $0x10,%rsp
  801e5d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e60:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e64:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e68:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e6b:	48 98                	cltq   
  801e6d:	48 83 ec 08          	sub    $0x8,%rsp
  801e71:	6a 00                	pushq  $0x0
  801e73:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e79:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e7f:	48 89 d1             	mov    %rdx,%rcx
  801e82:	48 89 c2             	mov    %rax,%rdx
  801e85:	be 01 00 00 00       	mov    $0x1,%esi
  801e8a:	bf 0a 00 00 00       	mov    $0xa,%edi
  801e8f:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801e96:	00 00 00 
  801e99:	ff d0                	callq  *%rax
  801e9b:	48 83 c4 10          	add    $0x10,%rsp
  801e9f:	c9                   	leaveq 
  801ea0:	c3                   	retq   

0000000000801ea1 <sys_ipc_try_send>:
  801ea1:	55                   	push   %rbp
  801ea2:	48 89 e5             	mov    %rsp,%rbp
  801ea5:	48 83 ec 20          	sub    $0x20,%rsp
  801ea9:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801eac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801eb0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801eb4:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801eb7:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801eba:	48 63 f0             	movslq %eax,%rsi
  801ebd:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801ec1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ec4:	48 98                	cltq   
  801ec6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801eca:	48 83 ec 08          	sub    $0x8,%rsp
  801ece:	6a 00                	pushq  $0x0
  801ed0:	49 89 f1             	mov    %rsi,%r9
  801ed3:	49 89 c8             	mov    %rcx,%r8
  801ed6:	48 89 d1             	mov    %rdx,%rcx
  801ed9:	48 89 c2             	mov    %rax,%rdx
  801edc:	be 00 00 00 00       	mov    $0x0,%esi
  801ee1:	bf 0c 00 00 00       	mov    $0xc,%edi
  801ee6:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801eed:	00 00 00 
  801ef0:	ff d0                	callq  *%rax
  801ef2:	48 83 c4 10          	add    $0x10,%rsp
  801ef6:	c9                   	leaveq 
  801ef7:	c3                   	retq   

0000000000801ef8 <sys_ipc_recv>:
  801ef8:	55                   	push   %rbp
  801ef9:	48 89 e5             	mov    %rsp,%rbp
  801efc:	48 83 ec 10          	sub    $0x10,%rsp
  801f00:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f04:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f08:	48 83 ec 08          	sub    $0x8,%rsp
  801f0c:	6a 00                	pushq  $0x0
  801f0e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f14:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f1a:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f1f:	48 89 c2             	mov    %rax,%rdx
  801f22:	be 01 00 00 00       	mov    $0x1,%esi
  801f27:	bf 0d 00 00 00       	mov    $0xd,%edi
  801f2c:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801f33:	00 00 00 
  801f36:	ff d0                	callq  *%rax
  801f38:	48 83 c4 10          	add    $0x10,%rsp
  801f3c:	c9                   	leaveq 
  801f3d:	c3                   	retq   

0000000000801f3e <sys_time_msec>:
  801f3e:	55                   	push   %rbp
  801f3f:	48 89 e5             	mov    %rsp,%rbp
  801f42:	48 83 ec 08          	sub    $0x8,%rsp
  801f46:	6a 00                	pushq  $0x0
  801f48:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f4e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f54:	b9 00 00 00 00       	mov    $0x0,%ecx
  801f59:	ba 00 00 00 00       	mov    $0x0,%edx
  801f5e:	be 00 00 00 00       	mov    $0x0,%esi
  801f63:	bf 0e 00 00 00       	mov    $0xe,%edi
  801f68:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801f6f:	00 00 00 
  801f72:	ff d0                	callq  *%rax
  801f74:	48 83 c4 10          	add    $0x10,%rsp
  801f78:	c9                   	leaveq 
  801f79:	c3                   	retq   

0000000000801f7a <sys_net_transmit>:
  801f7a:	55                   	push   %rbp
  801f7b:	48 89 e5             	mov    %rsp,%rbp
  801f7e:	48 83 ec 10          	sub    $0x10,%rsp
  801f82:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801f86:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801f89:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801f8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801f90:	48 83 ec 08          	sub    $0x8,%rsp
  801f94:	6a 00                	pushq  $0x0
  801f96:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f9c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fa2:	48 89 d1             	mov    %rdx,%rcx
  801fa5:	48 89 c2             	mov    %rax,%rdx
  801fa8:	be 00 00 00 00       	mov    $0x0,%esi
  801fad:	bf 0f 00 00 00       	mov    $0xf,%edi
  801fb2:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  801fb9:	00 00 00 
  801fbc:	ff d0                	callq  *%rax
  801fbe:	48 83 c4 10          	add    $0x10,%rsp
  801fc2:	c9                   	leaveq 
  801fc3:	c3                   	retq   

0000000000801fc4 <sys_net_receive>:
  801fc4:	55                   	push   %rbp
  801fc5:	48 89 e5             	mov    %rsp,%rbp
  801fc8:	48 83 ec 10          	sub    $0x10,%rsp
  801fcc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801fd0:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801fd3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801fd6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801fda:	48 83 ec 08          	sub    $0x8,%rsp
  801fde:	6a 00                	pushq  $0x0
  801fe0:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fe6:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fec:	48 89 d1             	mov    %rdx,%rcx
  801fef:	48 89 c2             	mov    %rax,%rdx
  801ff2:	be 00 00 00 00       	mov    $0x0,%esi
  801ff7:	bf 10 00 00 00       	mov    $0x10,%edi
  801ffc:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  802003:	00 00 00 
  802006:	ff d0                	callq  *%rax
  802008:	48 83 c4 10          	add    $0x10,%rsp
  80200c:	c9                   	leaveq 
  80200d:	c3                   	retq   

000000000080200e <sys_ept_map>:
  80200e:	55                   	push   %rbp
  80200f:	48 89 e5             	mov    %rsp,%rbp
  802012:	48 83 ec 20          	sub    $0x20,%rsp
  802016:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802019:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80201d:	89 55 f8             	mov    %edx,-0x8(%rbp)
  802020:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  802024:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  802028:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  80202b:	48 63 c8             	movslq %eax,%rcx
  80202e:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  802032:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802035:	48 63 f0             	movslq %eax,%rsi
  802038:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80203c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80203f:	48 98                	cltq   
  802041:	48 83 ec 08          	sub    $0x8,%rsp
  802045:	51                   	push   %rcx
  802046:	49 89 f9             	mov    %rdi,%r9
  802049:	49 89 f0             	mov    %rsi,%r8
  80204c:	48 89 d1             	mov    %rdx,%rcx
  80204f:	48 89 c2             	mov    %rax,%rdx
  802052:	be 00 00 00 00       	mov    $0x0,%esi
  802057:	bf 11 00 00 00       	mov    $0x11,%edi
  80205c:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  802063:	00 00 00 
  802066:	ff d0                	callq  *%rax
  802068:	48 83 c4 10          	add    $0x10,%rsp
  80206c:	c9                   	leaveq 
  80206d:	c3                   	retq   

000000000080206e <sys_env_mkguest>:
  80206e:	55                   	push   %rbp
  80206f:	48 89 e5             	mov    %rsp,%rbp
  802072:	48 83 ec 10          	sub    $0x10,%rsp
  802076:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80207a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80207e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802082:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802086:	48 83 ec 08          	sub    $0x8,%rsp
  80208a:	6a 00                	pushq  $0x0
  80208c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802092:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802098:	48 89 d1             	mov    %rdx,%rcx
  80209b:	48 89 c2             	mov    %rax,%rdx
  80209e:	be 00 00 00 00       	mov    $0x0,%esi
  8020a3:	bf 12 00 00 00       	mov    $0x12,%edi
  8020a8:	48 b8 e8 1a 80 00 00 	movabs $0x801ae8,%rax
  8020af:	00 00 00 
  8020b2:	ff d0                	callq  *%rax
  8020b4:	48 83 c4 10          	add    $0x10,%rsp
  8020b8:	c9                   	leaveq 
  8020b9:	c3                   	retq   

00000000008020ba <argstart>:
  8020ba:	55                   	push   %rbp
  8020bb:	48 89 e5             	mov    %rsp,%rbp
  8020be:	48 83 ec 18          	sub    $0x18,%rsp
  8020c2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8020c6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8020ca:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8020ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020d2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8020d6:	48 89 10             	mov    %rdx,(%rax)
  8020d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8020dd:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8020e1:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8020e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8020e9:	8b 00                	mov    (%rax),%eax
  8020eb:	83 f8 01             	cmp    $0x1,%eax
  8020ee:	7e 13                	jle    802103 <argstart+0x49>
  8020f0:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
  8020f5:	74 0c                	je     802103 <argstart+0x49>
  8020f7:	48 b8 f6 4f 80 00 00 	movabs $0x804ff6,%rax
  8020fe:	00 00 00 
  802101:	eb 05                	jmp    802108 <argstart+0x4e>
  802103:	b8 00 00 00 00       	mov    $0x0,%eax
  802108:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80210c:	48 89 42 10          	mov    %rax,0x10(%rdx)
  802110:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802114:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  80211b:	00 
  80211c:	90                   	nop
  80211d:	c9                   	leaveq 
  80211e:	c3                   	retq   

000000000080211f <argnext>:
  80211f:	55                   	push   %rbp
  802120:	48 89 e5             	mov    %rsp,%rbp
  802123:	48 83 ec 20          	sub    $0x20,%rsp
  802127:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80212b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80212f:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  802136:	00 
  802137:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80213b:	48 8b 40 10          	mov    0x10(%rax),%rax
  80213f:	48 85 c0             	test   %rax,%rax
  802142:	75 0a                	jne    80214e <argnext+0x2f>
  802144:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  802149:	e9 24 01 00 00       	jmpq   802272 <argnext+0x153>
  80214e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802152:	48 8b 40 10          	mov    0x10(%rax),%rax
  802156:	0f b6 00             	movzbl (%rax),%eax
  802159:	84 c0                	test   %al,%al
  80215b:	0f 85 d5 00 00 00    	jne    802236 <argnext+0x117>
  802161:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802165:	48 8b 00             	mov    (%rax),%rax
  802168:	8b 00                	mov    (%rax),%eax
  80216a:	83 f8 01             	cmp    $0x1,%eax
  80216d:	0f 84 ee 00 00 00    	je     802261 <argnext+0x142>
  802173:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802177:	48 8b 40 08          	mov    0x8(%rax),%rax
  80217b:	48 83 c0 08          	add    $0x8,%rax
  80217f:	48 8b 00             	mov    (%rax),%rax
  802182:	0f b6 00             	movzbl (%rax),%eax
  802185:	3c 2d                	cmp    $0x2d,%al
  802187:	0f 85 d4 00 00 00    	jne    802261 <argnext+0x142>
  80218d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802191:	48 8b 40 08          	mov    0x8(%rax),%rax
  802195:	48 83 c0 08          	add    $0x8,%rax
  802199:	48 8b 00             	mov    (%rax),%rax
  80219c:	48 83 c0 01          	add    $0x1,%rax
  8021a0:	0f b6 00             	movzbl (%rax),%eax
  8021a3:	84 c0                	test   %al,%al
  8021a5:	0f 84 b6 00 00 00    	je     802261 <argnext+0x142>
  8021ab:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021af:	48 8b 40 08          	mov    0x8(%rax),%rax
  8021b3:	48 83 c0 08          	add    $0x8,%rax
  8021b7:	48 8b 00             	mov    (%rax),%rax
  8021ba:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8021be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021c2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8021c6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021ca:	48 8b 00             	mov    (%rax),%rax
  8021cd:	8b 00                	mov    (%rax),%eax
  8021cf:	83 e8 01             	sub    $0x1,%eax
  8021d2:	48 98                	cltq   
  8021d4:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8021db:	00 
  8021dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021e0:	48 8b 40 08          	mov    0x8(%rax),%rax
  8021e4:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8021e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021ec:	48 8b 40 08          	mov    0x8(%rax),%rax
  8021f0:	48 83 c0 08          	add    $0x8,%rax
  8021f4:	48 89 ce             	mov    %rcx,%rsi
  8021f7:	48 89 c7             	mov    %rax,%rdi
  8021fa:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  802201:	00 00 00 
  802204:	ff d0                	callq  *%rax
  802206:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80220a:	48 8b 00             	mov    (%rax),%rax
  80220d:	8b 10                	mov    (%rax),%edx
  80220f:	83 ea 01             	sub    $0x1,%edx
  802212:	89 10                	mov    %edx,(%rax)
  802214:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802218:	48 8b 40 10          	mov    0x10(%rax),%rax
  80221c:	0f b6 00             	movzbl (%rax),%eax
  80221f:	3c 2d                	cmp    $0x2d,%al
  802221:	75 13                	jne    802236 <argnext+0x117>
  802223:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802227:	48 8b 40 10          	mov    0x10(%rax),%rax
  80222b:	48 83 c0 01          	add    $0x1,%rax
  80222f:	0f b6 00             	movzbl (%rax),%eax
  802232:	84 c0                	test   %al,%al
  802234:	74 2a                	je     802260 <argnext+0x141>
  802236:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80223a:	48 8b 40 10          	mov    0x10(%rax),%rax
  80223e:	0f b6 00             	movzbl (%rax),%eax
  802241:	0f b6 c0             	movzbl %al,%eax
  802244:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802247:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80224b:	48 8b 40 10          	mov    0x10(%rax),%rax
  80224f:	48 8d 50 01          	lea    0x1(%rax),%rdx
  802253:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802257:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80225b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80225e:	eb 12                	jmp    802272 <argnext+0x153>
  802260:	90                   	nop
  802261:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802265:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  80226c:	00 
  80226d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  802272:	c9                   	leaveq 
  802273:	c3                   	retq   

0000000000802274 <argvalue>:
  802274:	55                   	push   %rbp
  802275:	48 89 e5             	mov    %rsp,%rbp
  802278:	48 83 ec 10          	sub    $0x10,%rsp
  80227c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802280:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802284:	48 8b 40 18          	mov    0x18(%rax),%rax
  802288:	48 85 c0             	test   %rax,%rax
  80228b:	74 0a                	je     802297 <argvalue+0x23>
  80228d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802291:	48 8b 40 18          	mov    0x18(%rax),%rax
  802295:	eb 13                	jmp    8022aa <argvalue+0x36>
  802297:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80229b:	48 89 c7             	mov    %rax,%rdi
  80229e:	48 b8 ac 22 80 00 00 	movabs $0x8022ac,%rax
  8022a5:	00 00 00 
  8022a8:	ff d0                	callq  *%rax
  8022aa:	c9                   	leaveq 
  8022ab:	c3                   	retq   

00000000008022ac <argnextvalue>:
  8022ac:	55                   	push   %rbp
  8022ad:	48 89 e5             	mov    %rsp,%rbp
  8022b0:	48 83 ec 10          	sub    $0x10,%rsp
  8022b4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8022b8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022bc:	48 8b 40 10          	mov    0x10(%rax),%rax
  8022c0:	48 85 c0             	test   %rax,%rax
  8022c3:	75 0a                	jne    8022cf <argnextvalue+0x23>
  8022c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8022ca:	e9 c8 00 00 00       	jmpq   802397 <argnextvalue+0xeb>
  8022cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022d3:	48 8b 40 10          	mov    0x10(%rax),%rax
  8022d7:	0f b6 00             	movzbl (%rax),%eax
  8022da:	84 c0                	test   %al,%al
  8022dc:	74 27                	je     802305 <argnextvalue+0x59>
  8022de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022e2:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8022e6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022ea:	48 89 50 18          	mov    %rdx,0x18(%rax)
  8022ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8022f2:	48 be f6 4f 80 00 00 	movabs $0x804ff6,%rsi
  8022f9:	00 00 00 
  8022fc:	48 89 70 10          	mov    %rsi,0x10(%rax)
  802300:	e9 8a 00 00 00       	jmpq   80238f <argnextvalue+0xe3>
  802305:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802309:	48 8b 00             	mov    (%rax),%rax
  80230c:	8b 00                	mov    (%rax),%eax
  80230e:	83 f8 01             	cmp    $0x1,%eax
  802311:	7e 64                	jle    802377 <argnextvalue+0xcb>
  802313:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802317:	48 8b 40 08          	mov    0x8(%rax),%rax
  80231b:	48 8b 50 08          	mov    0x8(%rax),%rdx
  80231f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802323:	48 89 50 18          	mov    %rdx,0x18(%rax)
  802327:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80232b:	48 8b 00             	mov    (%rax),%rax
  80232e:	8b 00                	mov    (%rax),%eax
  802330:	83 e8 01             	sub    $0x1,%eax
  802333:	48 98                	cltq   
  802335:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80233c:	00 
  80233d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802341:	48 8b 40 08          	mov    0x8(%rax),%rax
  802345:	48 8d 48 10          	lea    0x10(%rax),%rcx
  802349:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80234d:	48 8b 40 08          	mov    0x8(%rax),%rax
  802351:	48 83 c0 08          	add    $0x8,%rax
  802355:	48 89 ce             	mov    %rcx,%rsi
  802358:	48 89 c7             	mov    %rax,%rdi
  80235b:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  802362:	00 00 00 
  802365:	ff d0                	callq  *%rax
  802367:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80236b:	48 8b 00             	mov    (%rax),%rax
  80236e:	8b 10                	mov    (%rax),%edx
  802370:	83 ea 01             	sub    $0x1,%edx
  802373:	89 10                	mov    %edx,(%rax)
  802375:	eb 18                	jmp    80238f <argnextvalue+0xe3>
  802377:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80237b:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
  802382:	00 
  802383:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802387:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
  80238e:	00 
  80238f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802393:	48 8b 40 18          	mov    0x18(%rax),%rax
  802397:	c9                   	leaveq 
  802398:	c3                   	retq   

0000000000802399 <fd2num>:
  802399:	55                   	push   %rbp
  80239a:	48 89 e5             	mov    %rsp,%rbp
  80239d:	48 83 ec 08          	sub    $0x8,%rsp
  8023a1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8023a5:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8023a9:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  8023b0:	ff ff ff 
  8023b3:	48 01 d0             	add    %rdx,%rax
  8023b6:	48 c1 e8 0c          	shr    $0xc,%rax
  8023ba:	c9                   	leaveq 
  8023bb:	c3                   	retq   

00000000008023bc <fd2data>:
  8023bc:	55                   	push   %rbp
  8023bd:	48 89 e5             	mov    %rsp,%rbp
  8023c0:	48 83 ec 08          	sub    $0x8,%rsp
  8023c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8023c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8023cc:	48 89 c7             	mov    %rax,%rdi
  8023cf:	48 b8 99 23 80 00 00 	movabs $0x802399,%rax
  8023d6:	00 00 00 
  8023d9:	ff d0                	callq  *%rax
  8023db:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  8023e1:	48 c1 e0 0c          	shl    $0xc,%rax
  8023e5:	c9                   	leaveq 
  8023e6:	c3                   	retq   

00000000008023e7 <fd_alloc>:
  8023e7:	55                   	push   %rbp
  8023e8:	48 89 e5             	mov    %rsp,%rbp
  8023eb:	48 83 ec 18          	sub    $0x18,%rsp
  8023ef:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8023f3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8023fa:	eb 6b                	jmp    802467 <fd_alloc+0x80>
  8023fc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023ff:	48 98                	cltq   
  802401:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  802407:	48 c1 e0 0c          	shl    $0xc,%rax
  80240b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80240f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802413:	48 c1 e8 15          	shr    $0x15,%rax
  802417:	48 89 c2             	mov    %rax,%rdx
  80241a:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802421:	01 00 00 
  802424:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802428:	83 e0 01             	and    $0x1,%eax
  80242b:	48 85 c0             	test   %rax,%rax
  80242e:	74 21                	je     802451 <fd_alloc+0x6a>
  802430:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802434:	48 c1 e8 0c          	shr    $0xc,%rax
  802438:	48 89 c2             	mov    %rax,%rdx
  80243b:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802442:	01 00 00 
  802445:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802449:	83 e0 01             	and    $0x1,%eax
  80244c:	48 85 c0             	test   %rax,%rax
  80244f:	75 12                	jne    802463 <fd_alloc+0x7c>
  802451:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802455:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802459:	48 89 10             	mov    %rdx,(%rax)
  80245c:	b8 00 00 00 00       	mov    $0x0,%eax
  802461:	eb 1a                	jmp    80247d <fd_alloc+0x96>
  802463:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802467:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80246b:	7e 8f                	jle    8023fc <fd_alloc+0x15>
  80246d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802471:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802478:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  80247d:	c9                   	leaveq 
  80247e:	c3                   	retq   

000000000080247f <fd_lookup>:
  80247f:	55                   	push   %rbp
  802480:	48 89 e5             	mov    %rsp,%rbp
  802483:	48 83 ec 20          	sub    $0x20,%rsp
  802487:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80248a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80248e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802492:	78 06                	js     80249a <fd_lookup+0x1b>
  802494:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802498:	7e 07                	jle    8024a1 <fd_lookup+0x22>
  80249a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80249f:	eb 6c                	jmp    80250d <fd_lookup+0x8e>
  8024a1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024a4:	48 98                	cltq   
  8024a6:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8024ac:	48 c1 e0 0c          	shl    $0xc,%rax
  8024b0:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8024b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024b8:	48 c1 e8 15          	shr    $0x15,%rax
  8024bc:	48 89 c2             	mov    %rax,%rdx
  8024bf:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8024c6:	01 00 00 
  8024c9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024cd:	83 e0 01             	and    $0x1,%eax
  8024d0:	48 85 c0             	test   %rax,%rax
  8024d3:	74 21                	je     8024f6 <fd_lookup+0x77>
  8024d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8024d9:	48 c1 e8 0c          	shr    $0xc,%rax
  8024dd:	48 89 c2             	mov    %rax,%rdx
  8024e0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8024e7:	01 00 00 
  8024ea:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024ee:	83 e0 01             	and    $0x1,%eax
  8024f1:	48 85 c0             	test   %rax,%rax
  8024f4:	75 07                	jne    8024fd <fd_lookup+0x7e>
  8024f6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024fb:	eb 10                	jmp    80250d <fd_lookup+0x8e>
  8024fd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802501:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802505:	48 89 10             	mov    %rdx,(%rax)
  802508:	b8 00 00 00 00       	mov    $0x0,%eax
  80250d:	c9                   	leaveq 
  80250e:	c3                   	retq   

000000000080250f <fd_close>:
  80250f:	55                   	push   %rbp
  802510:	48 89 e5             	mov    %rsp,%rbp
  802513:	48 83 ec 30          	sub    $0x30,%rsp
  802517:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80251b:	89 f0                	mov    %esi,%eax
  80251d:	88 45 d4             	mov    %al,-0x2c(%rbp)
  802520:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802524:	48 89 c7             	mov    %rax,%rdi
  802527:	48 b8 99 23 80 00 00 	movabs $0x802399,%rax
  80252e:	00 00 00 
  802531:	ff d0                	callq  *%rax
  802533:	89 c2                	mov    %eax,%edx
  802535:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802539:	48 89 c6             	mov    %rax,%rsi
  80253c:	89 d7                	mov    %edx,%edi
  80253e:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  802545:	00 00 00 
  802548:	ff d0                	callq  *%rax
  80254a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80254d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802551:	78 0a                	js     80255d <fd_close+0x4e>
  802553:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802557:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80255b:	74 12                	je     80256f <fd_close+0x60>
  80255d:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802561:	74 05                	je     802568 <fd_close+0x59>
  802563:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802566:	eb 70                	jmp    8025d8 <fd_close+0xc9>
  802568:	b8 00 00 00 00       	mov    $0x0,%eax
  80256d:	eb 69                	jmp    8025d8 <fd_close+0xc9>
  80256f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802573:	8b 00                	mov    (%rax),%eax
  802575:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802579:	48 89 d6             	mov    %rdx,%rsi
  80257c:	89 c7                	mov    %eax,%edi
  80257e:	48 b8 da 25 80 00 00 	movabs $0x8025da,%rax
  802585:	00 00 00 
  802588:	ff d0                	callq  *%rax
  80258a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80258d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802591:	78 2a                	js     8025bd <fd_close+0xae>
  802593:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802597:	48 8b 40 20          	mov    0x20(%rax),%rax
  80259b:	48 85 c0             	test   %rax,%rax
  80259e:	74 16                	je     8025b6 <fd_close+0xa7>
  8025a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8025a4:	48 8b 40 20          	mov    0x20(%rax),%rax
  8025a8:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8025ac:	48 89 d7             	mov    %rdx,%rdi
  8025af:	ff d0                	callq  *%rax
  8025b1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025b4:	eb 07                	jmp    8025bd <fd_close+0xae>
  8025b6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8025bd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8025c1:	48 89 c6             	mov    %rax,%rsi
  8025c4:	bf 00 00 00 00       	mov    $0x0,%edi
  8025c9:	48 b8 70 1d 80 00 00 	movabs $0x801d70,%rax
  8025d0:	00 00 00 
  8025d3:	ff d0                	callq  *%rax
  8025d5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025d8:	c9                   	leaveq 
  8025d9:	c3                   	retq   

00000000008025da <dev_lookup>:
  8025da:	55                   	push   %rbp
  8025db:	48 89 e5             	mov    %rsp,%rbp
  8025de:	48 83 ec 20          	sub    $0x20,%rsp
  8025e2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8025e5:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8025e9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8025f0:	eb 41                	jmp    802633 <dev_lookup+0x59>
  8025f2:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8025f9:	00 00 00 
  8025fc:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8025ff:	48 63 d2             	movslq %edx,%rdx
  802602:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802606:	8b 00                	mov    (%rax),%eax
  802608:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80260b:	75 22                	jne    80262f <dev_lookup+0x55>
  80260d:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802614:	00 00 00 
  802617:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80261a:	48 63 d2             	movslq %edx,%rdx
  80261d:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  802621:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802625:	48 89 10             	mov    %rdx,(%rax)
  802628:	b8 00 00 00 00       	mov    $0x0,%eax
  80262d:	eb 60                	jmp    80268f <dev_lookup+0xb5>
  80262f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802633:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80263a:	00 00 00 
  80263d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802640:	48 63 d2             	movslq %edx,%rdx
  802643:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802647:	48 85 c0             	test   %rax,%rax
  80264a:	75 a6                	jne    8025f2 <dev_lookup+0x18>
  80264c:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802653:	00 00 00 
  802656:	48 8b 00             	mov    (%rax),%rax
  802659:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80265f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802662:	89 c6                	mov    %eax,%esi
  802664:	48 bf f8 4f 80 00 00 	movabs $0x804ff8,%rdi
  80266b:	00 00 00 
  80266e:	b8 00 00 00 00       	mov    $0x0,%eax
  802673:	48 b9 fe 07 80 00 00 	movabs $0x8007fe,%rcx
  80267a:	00 00 00 
  80267d:	ff d1                	callq  *%rcx
  80267f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802683:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  80268a:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80268f:	c9                   	leaveq 
  802690:	c3                   	retq   

0000000000802691 <close>:
  802691:	55                   	push   %rbp
  802692:	48 89 e5             	mov    %rsp,%rbp
  802695:	48 83 ec 20          	sub    $0x20,%rsp
  802699:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80269c:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8026a0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8026a3:	48 89 d6             	mov    %rdx,%rsi
  8026a6:	89 c7                	mov    %eax,%edi
  8026a8:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  8026af:	00 00 00 
  8026b2:	ff d0                	callq  *%rax
  8026b4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026b7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026bb:	79 05                	jns    8026c2 <close+0x31>
  8026bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026c0:	eb 18                	jmp    8026da <close+0x49>
  8026c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8026c6:	be 01 00 00 00       	mov    $0x1,%esi
  8026cb:	48 89 c7             	mov    %rax,%rdi
  8026ce:	48 b8 0f 25 80 00 00 	movabs $0x80250f,%rax
  8026d5:	00 00 00 
  8026d8:	ff d0                	callq  *%rax
  8026da:	c9                   	leaveq 
  8026db:	c3                   	retq   

00000000008026dc <close_all>:
  8026dc:	55                   	push   %rbp
  8026dd:	48 89 e5             	mov    %rsp,%rbp
  8026e0:	48 83 ec 10          	sub    $0x10,%rsp
  8026e4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8026eb:	eb 15                	jmp    802702 <close_all+0x26>
  8026ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026f0:	89 c7                	mov    %eax,%edi
  8026f2:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  8026f9:	00 00 00 
  8026fc:	ff d0                	callq  *%rax
  8026fe:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802702:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802706:	7e e5                	jle    8026ed <close_all+0x11>
  802708:	90                   	nop
  802709:	c9                   	leaveq 
  80270a:	c3                   	retq   

000000000080270b <dup>:
  80270b:	55                   	push   %rbp
  80270c:	48 89 e5             	mov    %rsp,%rbp
  80270f:	48 83 ec 40          	sub    $0x40,%rsp
  802713:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802716:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802719:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80271d:	8b 45 cc             	mov    -0x34(%rbp),%eax
  802720:	48 89 d6             	mov    %rdx,%rsi
  802723:	89 c7                	mov    %eax,%edi
  802725:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  80272c:	00 00 00 
  80272f:	ff d0                	callq  *%rax
  802731:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802734:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802738:	79 08                	jns    802742 <dup+0x37>
  80273a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80273d:	e9 70 01 00 00       	jmpq   8028b2 <dup+0x1a7>
  802742:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802745:	89 c7                	mov    %eax,%edi
  802747:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  80274e:	00 00 00 
  802751:	ff d0                	callq  *%rax
  802753:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802756:	48 98                	cltq   
  802758:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80275e:	48 c1 e0 0c          	shl    $0xc,%rax
  802762:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802766:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80276a:	48 89 c7             	mov    %rax,%rdi
  80276d:	48 b8 bc 23 80 00 00 	movabs $0x8023bc,%rax
  802774:	00 00 00 
  802777:	ff d0                	callq  *%rax
  802779:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80277d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802781:	48 89 c7             	mov    %rax,%rdi
  802784:	48 b8 bc 23 80 00 00 	movabs $0x8023bc,%rax
  80278b:	00 00 00 
  80278e:	ff d0                	callq  *%rax
  802790:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802794:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802798:	48 c1 e8 15          	shr    $0x15,%rax
  80279c:	48 89 c2             	mov    %rax,%rdx
  80279f:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8027a6:	01 00 00 
  8027a9:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027ad:	83 e0 01             	and    $0x1,%eax
  8027b0:	48 85 c0             	test   %rax,%rax
  8027b3:	74 71                	je     802826 <dup+0x11b>
  8027b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027b9:	48 c1 e8 0c          	shr    $0xc,%rax
  8027bd:	48 89 c2             	mov    %rax,%rdx
  8027c0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8027c7:	01 00 00 
  8027ca:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027ce:	83 e0 01             	and    $0x1,%eax
  8027d1:	48 85 c0             	test   %rax,%rax
  8027d4:	74 50                	je     802826 <dup+0x11b>
  8027d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027da:	48 c1 e8 0c          	shr    $0xc,%rax
  8027de:	48 89 c2             	mov    %rax,%rdx
  8027e1:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8027e8:	01 00 00 
  8027eb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8027ef:	25 07 0e 00 00       	and    $0xe07,%eax
  8027f4:	89 c1                	mov    %eax,%ecx
  8027f6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8027fa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027fe:	41 89 c8             	mov    %ecx,%r8d
  802801:	48 89 d1             	mov    %rdx,%rcx
  802804:	ba 00 00 00 00       	mov    $0x0,%edx
  802809:	48 89 c6             	mov    %rax,%rsi
  80280c:	bf 00 00 00 00       	mov    $0x0,%edi
  802811:	48 b8 10 1d 80 00 00 	movabs $0x801d10,%rax
  802818:	00 00 00 
  80281b:	ff d0                	callq  *%rax
  80281d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802820:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802824:	78 55                	js     80287b <dup+0x170>
  802826:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80282a:	48 c1 e8 0c          	shr    $0xc,%rax
  80282e:	48 89 c2             	mov    %rax,%rdx
  802831:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802838:	01 00 00 
  80283b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80283f:	25 07 0e 00 00       	and    $0xe07,%eax
  802844:	89 c1                	mov    %eax,%ecx
  802846:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80284a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80284e:	41 89 c8             	mov    %ecx,%r8d
  802851:	48 89 d1             	mov    %rdx,%rcx
  802854:	ba 00 00 00 00       	mov    $0x0,%edx
  802859:	48 89 c6             	mov    %rax,%rsi
  80285c:	bf 00 00 00 00       	mov    $0x0,%edi
  802861:	48 b8 10 1d 80 00 00 	movabs $0x801d10,%rax
  802868:	00 00 00 
  80286b:	ff d0                	callq  *%rax
  80286d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802870:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802874:	78 08                	js     80287e <dup+0x173>
  802876:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802879:	eb 37                	jmp    8028b2 <dup+0x1a7>
  80287b:	90                   	nop
  80287c:	eb 01                	jmp    80287f <dup+0x174>
  80287e:	90                   	nop
  80287f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802883:	48 89 c6             	mov    %rax,%rsi
  802886:	bf 00 00 00 00       	mov    $0x0,%edi
  80288b:	48 b8 70 1d 80 00 00 	movabs $0x801d70,%rax
  802892:	00 00 00 
  802895:	ff d0                	callq  *%rax
  802897:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80289b:	48 89 c6             	mov    %rax,%rsi
  80289e:	bf 00 00 00 00       	mov    $0x0,%edi
  8028a3:	48 b8 70 1d 80 00 00 	movabs $0x801d70,%rax
  8028aa:	00 00 00 
  8028ad:	ff d0                	callq  *%rax
  8028af:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028b2:	c9                   	leaveq 
  8028b3:	c3                   	retq   

00000000008028b4 <read>:
  8028b4:	55                   	push   %rbp
  8028b5:	48 89 e5             	mov    %rsp,%rbp
  8028b8:	48 83 ec 40          	sub    $0x40,%rsp
  8028bc:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8028bf:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8028c3:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8028c7:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8028cb:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8028ce:	48 89 d6             	mov    %rdx,%rsi
  8028d1:	89 c7                	mov    %eax,%edi
  8028d3:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  8028da:	00 00 00 
  8028dd:	ff d0                	callq  *%rax
  8028df:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028e2:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028e6:	78 24                	js     80290c <read+0x58>
  8028e8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028ec:	8b 00                	mov    (%rax),%eax
  8028ee:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028f2:	48 89 d6             	mov    %rdx,%rsi
  8028f5:	89 c7                	mov    %eax,%edi
  8028f7:	48 b8 da 25 80 00 00 	movabs $0x8025da,%rax
  8028fe:	00 00 00 
  802901:	ff d0                	callq  *%rax
  802903:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802906:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80290a:	79 05                	jns    802911 <read+0x5d>
  80290c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80290f:	eb 76                	jmp    802987 <read+0xd3>
  802911:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802915:	8b 40 08             	mov    0x8(%rax),%eax
  802918:	83 e0 03             	and    $0x3,%eax
  80291b:	83 f8 01             	cmp    $0x1,%eax
  80291e:	75 3a                	jne    80295a <read+0xa6>
  802920:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802927:	00 00 00 
  80292a:	48 8b 00             	mov    (%rax),%rax
  80292d:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802933:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802936:	89 c6                	mov    %eax,%esi
  802938:	48 bf 17 50 80 00 00 	movabs $0x805017,%rdi
  80293f:	00 00 00 
  802942:	b8 00 00 00 00       	mov    $0x0,%eax
  802947:	48 b9 fe 07 80 00 00 	movabs $0x8007fe,%rcx
  80294e:	00 00 00 
  802951:	ff d1                	callq  *%rcx
  802953:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802958:	eb 2d                	jmp    802987 <read+0xd3>
  80295a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80295e:	48 8b 40 10          	mov    0x10(%rax),%rax
  802962:	48 85 c0             	test   %rax,%rax
  802965:	75 07                	jne    80296e <read+0xba>
  802967:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80296c:	eb 19                	jmp    802987 <read+0xd3>
  80296e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802972:	48 8b 40 10          	mov    0x10(%rax),%rax
  802976:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80297a:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80297e:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802982:	48 89 cf             	mov    %rcx,%rdi
  802985:	ff d0                	callq  *%rax
  802987:	c9                   	leaveq 
  802988:	c3                   	retq   

0000000000802989 <readn>:
  802989:	55                   	push   %rbp
  80298a:	48 89 e5             	mov    %rsp,%rbp
  80298d:	48 83 ec 30          	sub    $0x30,%rsp
  802991:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802994:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802998:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80299c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8029a3:	eb 47                	jmp    8029ec <readn+0x63>
  8029a5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029a8:	48 98                	cltq   
  8029aa:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8029ae:	48 29 c2             	sub    %rax,%rdx
  8029b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029b4:	48 63 c8             	movslq %eax,%rcx
  8029b7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8029bb:	48 01 c1             	add    %rax,%rcx
  8029be:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8029c1:	48 89 ce             	mov    %rcx,%rsi
  8029c4:	89 c7                	mov    %eax,%edi
  8029c6:	48 b8 b4 28 80 00 00 	movabs $0x8028b4,%rax
  8029cd:	00 00 00 
  8029d0:	ff d0                	callq  *%rax
  8029d2:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8029d5:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8029d9:	79 05                	jns    8029e0 <readn+0x57>
  8029db:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8029de:	eb 1d                	jmp    8029fd <readn+0x74>
  8029e0:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8029e4:	74 13                	je     8029f9 <readn+0x70>
  8029e6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8029e9:	01 45 fc             	add    %eax,-0x4(%rbp)
  8029ec:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029ef:	48 98                	cltq   
  8029f1:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8029f5:	72 ae                	jb     8029a5 <readn+0x1c>
  8029f7:	eb 01                	jmp    8029fa <readn+0x71>
  8029f9:	90                   	nop
  8029fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029fd:	c9                   	leaveq 
  8029fe:	c3                   	retq   

00000000008029ff <write>:
  8029ff:	55                   	push   %rbp
  802a00:	48 89 e5             	mov    %rsp,%rbp
  802a03:	48 83 ec 40          	sub    $0x40,%rsp
  802a07:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802a0a:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802a0e:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802a12:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802a16:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802a19:	48 89 d6             	mov    %rdx,%rsi
  802a1c:	89 c7                	mov    %eax,%edi
  802a1e:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  802a25:	00 00 00 
  802a28:	ff d0                	callq  *%rax
  802a2a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a2d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a31:	78 24                	js     802a57 <write+0x58>
  802a33:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a37:	8b 00                	mov    (%rax),%eax
  802a39:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a3d:	48 89 d6             	mov    %rdx,%rsi
  802a40:	89 c7                	mov    %eax,%edi
  802a42:	48 b8 da 25 80 00 00 	movabs $0x8025da,%rax
  802a49:	00 00 00 
  802a4c:	ff d0                	callq  *%rax
  802a4e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a51:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a55:	79 05                	jns    802a5c <write+0x5d>
  802a57:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a5a:	eb 75                	jmp    802ad1 <write+0xd2>
  802a5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a60:	8b 40 08             	mov    0x8(%rax),%eax
  802a63:	83 e0 03             	and    $0x3,%eax
  802a66:	85 c0                	test   %eax,%eax
  802a68:	75 3a                	jne    802aa4 <write+0xa5>
  802a6a:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802a71:	00 00 00 
  802a74:	48 8b 00             	mov    (%rax),%rax
  802a77:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a7d:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802a80:	89 c6                	mov    %eax,%esi
  802a82:	48 bf 33 50 80 00 00 	movabs $0x805033,%rdi
  802a89:	00 00 00 
  802a8c:	b8 00 00 00 00       	mov    $0x0,%eax
  802a91:	48 b9 fe 07 80 00 00 	movabs $0x8007fe,%rcx
  802a98:	00 00 00 
  802a9b:	ff d1                	callq  *%rcx
  802a9d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802aa2:	eb 2d                	jmp    802ad1 <write+0xd2>
  802aa4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802aa8:	48 8b 40 18          	mov    0x18(%rax),%rax
  802aac:	48 85 c0             	test   %rax,%rax
  802aaf:	75 07                	jne    802ab8 <write+0xb9>
  802ab1:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802ab6:	eb 19                	jmp    802ad1 <write+0xd2>
  802ab8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802abc:	48 8b 40 18          	mov    0x18(%rax),%rax
  802ac0:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802ac4:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ac8:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802acc:	48 89 cf             	mov    %rcx,%rdi
  802acf:	ff d0                	callq  *%rax
  802ad1:	c9                   	leaveq 
  802ad2:	c3                   	retq   

0000000000802ad3 <seek>:
  802ad3:	55                   	push   %rbp
  802ad4:	48 89 e5             	mov    %rsp,%rbp
  802ad7:	48 83 ec 18          	sub    $0x18,%rsp
  802adb:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802ade:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802ae1:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802ae5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ae8:	48 89 d6             	mov    %rdx,%rsi
  802aeb:	89 c7                	mov    %eax,%edi
  802aed:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  802af4:	00 00 00 
  802af7:	ff d0                	callq  *%rax
  802af9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802afc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b00:	79 05                	jns    802b07 <seek+0x34>
  802b02:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b05:	eb 0f                	jmp    802b16 <seek+0x43>
  802b07:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b0b:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802b0e:	89 50 04             	mov    %edx,0x4(%rax)
  802b11:	b8 00 00 00 00       	mov    $0x0,%eax
  802b16:	c9                   	leaveq 
  802b17:	c3                   	retq   

0000000000802b18 <ftruncate>:
  802b18:	55                   	push   %rbp
  802b19:	48 89 e5             	mov    %rsp,%rbp
  802b1c:	48 83 ec 30          	sub    $0x30,%rsp
  802b20:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802b23:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802b26:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802b2a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802b2d:	48 89 d6             	mov    %rdx,%rsi
  802b30:	89 c7                	mov    %eax,%edi
  802b32:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  802b39:	00 00 00 
  802b3c:	ff d0                	callq  *%rax
  802b3e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b41:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b45:	78 24                	js     802b6b <ftruncate+0x53>
  802b47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b4b:	8b 00                	mov    (%rax),%eax
  802b4d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802b51:	48 89 d6             	mov    %rdx,%rsi
  802b54:	89 c7                	mov    %eax,%edi
  802b56:	48 b8 da 25 80 00 00 	movabs $0x8025da,%rax
  802b5d:	00 00 00 
  802b60:	ff d0                	callq  *%rax
  802b62:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b65:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b69:	79 05                	jns    802b70 <ftruncate+0x58>
  802b6b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b6e:	eb 72                	jmp    802be2 <ftruncate+0xca>
  802b70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b74:	8b 40 08             	mov    0x8(%rax),%eax
  802b77:	83 e0 03             	and    $0x3,%eax
  802b7a:	85 c0                	test   %eax,%eax
  802b7c:	75 3a                	jne    802bb8 <ftruncate+0xa0>
  802b7e:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  802b85:	00 00 00 
  802b88:	48 8b 00             	mov    (%rax),%rax
  802b8b:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802b91:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802b94:	89 c6                	mov    %eax,%esi
  802b96:	48 bf 50 50 80 00 00 	movabs $0x805050,%rdi
  802b9d:	00 00 00 
  802ba0:	b8 00 00 00 00       	mov    $0x0,%eax
  802ba5:	48 b9 fe 07 80 00 00 	movabs $0x8007fe,%rcx
  802bac:	00 00 00 
  802baf:	ff d1                	callq  *%rcx
  802bb1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802bb6:	eb 2a                	jmp    802be2 <ftruncate+0xca>
  802bb8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bbc:	48 8b 40 30          	mov    0x30(%rax),%rax
  802bc0:	48 85 c0             	test   %rax,%rax
  802bc3:	75 07                	jne    802bcc <ftruncate+0xb4>
  802bc5:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802bca:	eb 16                	jmp    802be2 <ftruncate+0xca>
  802bcc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802bd0:	48 8b 40 30          	mov    0x30(%rax),%rax
  802bd4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802bd8:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802bdb:	89 ce                	mov    %ecx,%esi
  802bdd:	48 89 d7             	mov    %rdx,%rdi
  802be0:	ff d0                	callq  *%rax
  802be2:	c9                   	leaveq 
  802be3:	c3                   	retq   

0000000000802be4 <fstat>:
  802be4:	55                   	push   %rbp
  802be5:	48 89 e5             	mov    %rsp,%rbp
  802be8:	48 83 ec 30          	sub    $0x30,%rsp
  802bec:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802bef:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802bf3:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802bf7:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802bfa:	48 89 d6             	mov    %rdx,%rsi
  802bfd:	89 c7                	mov    %eax,%edi
  802bff:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  802c06:	00 00 00 
  802c09:	ff d0                	callq  *%rax
  802c0b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c0e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c12:	78 24                	js     802c38 <fstat+0x54>
  802c14:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c18:	8b 00                	mov    (%rax),%eax
  802c1a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802c1e:	48 89 d6             	mov    %rdx,%rsi
  802c21:	89 c7                	mov    %eax,%edi
  802c23:	48 b8 da 25 80 00 00 	movabs $0x8025da,%rax
  802c2a:	00 00 00 
  802c2d:	ff d0                	callq  *%rax
  802c2f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c32:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c36:	79 05                	jns    802c3d <fstat+0x59>
  802c38:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c3b:	eb 5e                	jmp    802c9b <fstat+0xb7>
  802c3d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c41:	48 8b 40 28          	mov    0x28(%rax),%rax
  802c45:	48 85 c0             	test   %rax,%rax
  802c48:	75 07                	jne    802c51 <fstat+0x6d>
  802c4a:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802c4f:	eb 4a                	jmp    802c9b <fstat+0xb7>
  802c51:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c55:	c6 00 00             	movb   $0x0,(%rax)
  802c58:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c5c:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802c63:	00 00 00 
  802c66:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c6a:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802c71:	00 00 00 
  802c74:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802c78:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802c7c:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802c83:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c87:	48 8b 40 28          	mov    0x28(%rax),%rax
  802c8b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802c8f:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802c93:	48 89 ce             	mov    %rcx,%rsi
  802c96:	48 89 d7             	mov    %rdx,%rdi
  802c99:	ff d0                	callq  *%rax
  802c9b:	c9                   	leaveq 
  802c9c:	c3                   	retq   

0000000000802c9d <stat>:
  802c9d:	55                   	push   %rbp
  802c9e:	48 89 e5             	mov    %rsp,%rbp
  802ca1:	48 83 ec 20          	sub    $0x20,%rsp
  802ca5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802ca9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802cad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802cb1:	be 00 00 00 00       	mov    $0x0,%esi
  802cb6:	48 89 c7             	mov    %rax,%rdi
  802cb9:	48 b8 8d 2d 80 00 00 	movabs $0x802d8d,%rax
  802cc0:	00 00 00 
  802cc3:	ff d0                	callq  *%rax
  802cc5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cc8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ccc:	79 05                	jns    802cd3 <stat+0x36>
  802cce:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cd1:	eb 2f                	jmp    802d02 <stat+0x65>
  802cd3:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802cd7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cda:	48 89 d6             	mov    %rdx,%rsi
  802cdd:	89 c7                	mov    %eax,%edi
  802cdf:	48 b8 e4 2b 80 00 00 	movabs $0x802be4,%rax
  802ce6:	00 00 00 
  802ce9:	ff d0                	callq  *%rax
  802ceb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802cee:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cf1:	89 c7                	mov    %eax,%edi
  802cf3:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  802cfa:	00 00 00 
  802cfd:	ff d0                	callq  *%rax
  802cff:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d02:	c9                   	leaveq 
  802d03:	c3                   	retq   

0000000000802d04 <fsipc>:
  802d04:	55                   	push   %rbp
  802d05:	48 89 e5             	mov    %rsp,%rbp
  802d08:	48 83 ec 10          	sub    $0x10,%rsp
  802d0c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802d0f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802d13:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d1a:	00 00 00 
  802d1d:	8b 00                	mov    (%rax),%eax
  802d1f:	85 c0                	test   %eax,%eax
  802d21:	75 1f                	jne    802d42 <fsipc+0x3e>
  802d23:	bf 01 00 00 00       	mov    $0x1,%edi
  802d28:	48 b8 18 49 80 00 00 	movabs $0x804918,%rax
  802d2f:	00 00 00 
  802d32:	ff d0                	callq  *%rax
  802d34:	89 c2                	mov    %eax,%edx
  802d36:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d3d:	00 00 00 
  802d40:	89 10                	mov    %edx,(%rax)
  802d42:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802d49:	00 00 00 
  802d4c:	8b 00                	mov    (%rax),%eax
  802d4e:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802d51:	b9 07 00 00 00       	mov    $0x7,%ecx
  802d56:	48 ba 00 90 80 00 00 	movabs $0x809000,%rdx
  802d5d:	00 00 00 
  802d60:	89 c7                	mov    %eax,%edi
  802d62:	48 b8 0e 48 80 00 00 	movabs $0x80480e,%rax
  802d69:	00 00 00 
  802d6c:	ff d0                	callq  *%rax
  802d6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d72:	ba 00 00 00 00       	mov    $0x0,%edx
  802d77:	48 89 c6             	mov    %rax,%rsi
  802d7a:	bf 00 00 00 00       	mov    $0x0,%edi
  802d7f:	48 b8 4d 47 80 00 00 	movabs $0x80474d,%rax
  802d86:	00 00 00 
  802d89:	ff d0                	callq  *%rax
  802d8b:	c9                   	leaveq 
  802d8c:	c3                   	retq   

0000000000802d8d <open>:
  802d8d:	55                   	push   %rbp
  802d8e:	48 89 e5             	mov    %rsp,%rbp
  802d91:	48 83 ec 20          	sub    $0x20,%rsp
  802d95:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d99:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802d9c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802da0:	48 89 c7             	mov    %rax,%rdi
  802da3:	48 b8 22 13 80 00 00 	movabs $0x801322,%rax
  802daa:	00 00 00 
  802dad:	ff d0                	callq  *%rax
  802daf:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802db4:	7e 0a                	jle    802dc0 <open+0x33>
  802db6:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802dbb:	e9 a5 00 00 00       	jmpq   802e65 <open+0xd8>
  802dc0:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802dc4:	48 89 c7             	mov    %rax,%rdi
  802dc7:	48 b8 e7 23 80 00 00 	movabs $0x8023e7,%rax
  802dce:	00 00 00 
  802dd1:	ff d0                	callq  *%rax
  802dd3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dd6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802dda:	79 08                	jns    802de4 <open+0x57>
  802ddc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ddf:	e9 81 00 00 00       	jmpq   802e65 <open+0xd8>
  802de4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802de8:	48 89 c6             	mov    %rax,%rsi
  802deb:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  802df2:	00 00 00 
  802df5:	48 b8 8e 13 80 00 00 	movabs $0x80138e,%rax
  802dfc:	00 00 00 
  802dff:	ff d0                	callq  *%rax
  802e01:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802e08:	00 00 00 
  802e0b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802e0e:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802e14:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e18:	48 89 c6             	mov    %rax,%rsi
  802e1b:	bf 01 00 00 00       	mov    $0x1,%edi
  802e20:	48 b8 04 2d 80 00 00 	movabs $0x802d04,%rax
  802e27:	00 00 00 
  802e2a:	ff d0                	callq  *%rax
  802e2c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e2f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e33:	79 1d                	jns    802e52 <open+0xc5>
  802e35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e39:	be 00 00 00 00       	mov    $0x0,%esi
  802e3e:	48 89 c7             	mov    %rax,%rdi
  802e41:	48 b8 0f 25 80 00 00 	movabs $0x80250f,%rax
  802e48:	00 00 00 
  802e4b:	ff d0                	callq  *%rax
  802e4d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e50:	eb 13                	jmp    802e65 <open+0xd8>
  802e52:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e56:	48 89 c7             	mov    %rax,%rdi
  802e59:	48 b8 99 23 80 00 00 	movabs $0x802399,%rax
  802e60:	00 00 00 
  802e63:	ff d0                	callq  *%rax
  802e65:	c9                   	leaveq 
  802e66:	c3                   	retq   

0000000000802e67 <devfile_flush>:
  802e67:	55                   	push   %rbp
  802e68:	48 89 e5             	mov    %rsp,%rbp
  802e6b:	48 83 ec 10          	sub    $0x10,%rsp
  802e6f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802e73:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802e77:	8b 50 0c             	mov    0xc(%rax),%edx
  802e7a:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802e81:	00 00 00 
  802e84:	89 10                	mov    %edx,(%rax)
  802e86:	be 00 00 00 00       	mov    $0x0,%esi
  802e8b:	bf 06 00 00 00       	mov    $0x6,%edi
  802e90:	48 b8 04 2d 80 00 00 	movabs $0x802d04,%rax
  802e97:	00 00 00 
  802e9a:	ff d0                	callq  *%rax
  802e9c:	c9                   	leaveq 
  802e9d:	c3                   	retq   

0000000000802e9e <devfile_read>:
  802e9e:	55                   	push   %rbp
  802e9f:	48 89 e5             	mov    %rsp,%rbp
  802ea2:	48 83 ec 30          	sub    $0x30,%rsp
  802ea6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802eaa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802eae:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802eb2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802eb6:	8b 50 0c             	mov    0xc(%rax),%edx
  802eb9:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802ec0:	00 00 00 
  802ec3:	89 10                	mov    %edx,(%rax)
  802ec5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802ecc:	00 00 00 
  802ecf:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802ed3:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802ed7:	be 00 00 00 00       	mov    $0x0,%esi
  802edc:	bf 03 00 00 00       	mov    $0x3,%edi
  802ee1:	48 b8 04 2d 80 00 00 	movabs $0x802d04,%rax
  802ee8:	00 00 00 
  802eeb:	ff d0                	callq  *%rax
  802eed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ef0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ef4:	79 08                	jns    802efe <devfile_read+0x60>
  802ef6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ef9:	e9 a4 00 00 00       	jmpq   802fa2 <devfile_read+0x104>
  802efe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f01:	48 98                	cltq   
  802f03:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802f07:	76 35                	jbe    802f3e <devfile_read+0xa0>
  802f09:	48 b9 76 50 80 00 00 	movabs $0x805076,%rcx
  802f10:	00 00 00 
  802f13:	48 ba 7d 50 80 00 00 	movabs $0x80507d,%rdx
  802f1a:	00 00 00 
  802f1d:	be 89 00 00 00       	mov    $0x89,%esi
  802f22:	48 bf 92 50 80 00 00 	movabs $0x805092,%rdi
  802f29:	00 00 00 
  802f2c:	b8 00 00 00 00       	mov    $0x0,%eax
  802f31:	49 b8 c4 05 80 00 00 	movabs $0x8005c4,%r8
  802f38:	00 00 00 
  802f3b:	41 ff d0             	callq  *%r8
  802f3e:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802f45:	7e 35                	jle    802f7c <devfile_read+0xde>
  802f47:	48 b9 a0 50 80 00 00 	movabs $0x8050a0,%rcx
  802f4e:	00 00 00 
  802f51:	48 ba 7d 50 80 00 00 	movabs $0x80507d,%rdx
  802f58:	00 00 00 
  802f5b:	be 8a 00 00 00       	mov    $0x8a,%esi
  802f60:	48 bf 92 50 80 00 00 	movabs $0x805092,%rdi
  802f67:	00 00 00 
  802f6a:	b8 00 00 00 00       	mov    $0x0,%eax
  802f6f:	49 b8 c4 05 80 00 00 	movabs $0x8005c4,%r8
  802f76:	00 00 00 
  802f79:	41 ff d0             	callq  *%r8
  802f7c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f7f:	48 63 d0             	movslq %eax,%rdx
  802f82:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f86:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  802f8d:	00 00 00 
  802f90:	48 89 c7             	mov    %rax,%rdi
  802f93:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  802f9a:	00 00 00 
  802f9d:	ff d0                	callq  *%rax
  802f9f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fa2:	c9                   	leaveq 
  802fa3:	c3                   	retq   

0000000000802fa4 <devfile_write>:
  802fa4:	55                   	push   %rbp
  802fa5:	48 89 e5             	mov    %rsp,%rbp
  802fa8:	48 83 ec 40          	sub    $0x40,%rsp
  802fac:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802fb0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802fb4:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802fb8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802fbc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802fc0:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802fc7:	00 
  802fc8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802fcc:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802fd0:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802fd5:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802fd9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802fdd:	8b 50 0c             	mov    0xc(%rax),%edx
  802fe0:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802fe7:	00 00 00 
  802fea:	89 10                	mov    %edx,(%rax)
  802fec:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802ff3:	00 00 00 
  802ff6:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ffa:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802ffe:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  803002:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803006:	48 89 c6             	mov    %rax,%rsi
  803009:	48 bf 10 90 80 00 00 	movabs $0x809010,%rdi
  803010:	00 00 00 
  803013:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  80301a:	00 00 00 
  80301d:	ff d0                	callq  *%rax
  80301f:	be 00 00 00 00       	mov    $0x0,%esi
  803024:	bf 04 00 00 00       	mov    $0x4,%edi
  803029:	48 b8 04 2d 80 00 00 	movabs $0x802d04,%rax
  803030:	00 00 00 
  803033:	ff d0                	callq  *%rax
  803035:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803038:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80303c:	79 05                	jns    803043 <devfile_write+0x9f>
  80303e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803041:	eb 43                	jmp    803086 <devfile_write+0xe2>
  803043:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803046:	48 98                	cltq   
  803048:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  80304c:	76 35                	jbe    803083 <devfile_write+0xdf>
  80304e:	48 b9 76 50 80 00 00 	movabs $0x805076,%rcx
  803055:	00 00 00 
  803058:	48 ba 7d 50 80 00 00 	movabs $0x80507d,%rdx
  80305f:	00 00 00 
  803062:	be a8 00 00 00       	mov    $0xa8,%esi
  803067:	48 bf 92 50 80 00 00 	movabs $0x805092,%rdi
  80306e:	00 00 00 
  803071:	b8 00 00 00 00       	mov    $0x0,%eax
  803076:	49 b8 c4 05 80 00 00 	movabs $0x8005c4,%r8
  80307d:	00 00 00 
  803080:	41 ff d0             	callq  *%r8
  803083:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803086:	c9                   	leaveq 
  803087:	c3                   	retq   

0000000000803088 <devfile_stat>:
  803088:	55                   	push   %rbp
  803089:	48 89 e5             	mov    %rsp,%rbp
  80308c:	48 83 ec 20          	sub    $0x20,%rsp
  803090:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803094:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803098:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80309c:	8b 50 0c             	mov    0xc(%rax),%edx
  80309f:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030a6:	00 00 00 
  8030a9:	89 10                	mov    %edx,(%rax)
  8030ab:	be 00 00 00 00       	mov    $0x0,%esi
  8030b0:	bf 05 00 00 00       	mov    $0x5,%edi
  8030b5:	48 b8 04 2d 80 00 00 	movabs $0x802d04,%rax
  8030bc:	00 00 00 
  8030bf:	ff d0                	callq  *%rax
  8030c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030c8:	79 05                	jns    8030cf <devfile_stat+0x47>
  8030ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030cd:	eb 56                	jmp    803125 <devfile_stat+0x9d>
  8030cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8030d3:	48 be 00 90 80 00 00 	movabs $0x809000,%rsi
  8030da:	00 00 00 
  8030dd:	48 89 c7             	mov    %rax,%rdi
  8030e0:	48 b8 8e 13 80 00 00 	movabs $0x80138e,%rax
  8030e7:	00 00 00 
  8030ea:	ff d0                	callq  *%rax
  8030ec:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  8030f3:	00 00 00 
  8030f6:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  8030fc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803100:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803106:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  80310d:	00 00 00 
  803110:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  803116:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80311a:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  803120:	b8 00 00 00 00       	mov    $0x0,%eax
  803125:	c9                   	leaveq 
  803126:	c3                   	retq   

0000000000803127 <devfile_trunc>:
  803127:	55                   	push   %rbp
  803128:	48 89 e5             	mov    %rsp,%rbp
  80312b:	48 83 ec 10          	sub    $0x10,%rsp
  80312f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803133:	89 75 f4             	mov    %esi,-0xc(%rbp)
  803136:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80313a:	8b 50 0c             	mov    0xc(%rax),%edx
  80313d:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803144:	00 00 00 
  803147:	89 10                	mov    %edx,(%rax)
  803149:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  803150:	00 00 00 
  803153:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803156:	89 50 04             	mov    %edx,0x4(%rax)
  803159:	be 00 00 00 00       	mov    $0x0,%esi
  80315e:	bf 02 00 00 00       	mov    $0x2,%edi
  803163:	48 b8 04 2d 80 00 00 	movabs $0x802d04,%rax
  80316a:	00 00 00 
  80316d:	ff d0                	callq  *%rax
  80316f:	c9                   	leaveq 
  803170:	c3                   	retq   

0000000000803171 <remove>:
  803171:	55                   	push   %rbp
  803172:	48 89 e5             	mov    %rsp,%rbp
  803175:	48 83 ec 10          	sub    $0x10,%rsp
  803179:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80317d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803181:	48 89 c7             	mov    %rax,%rdi
  803184:	48 b8 22 13 80 00 00 	movabs $0x801322,%rax
  80318b:	00 00 00 
  80318e:	ff d0                	callq  *%rax
  803190:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803195:	7e 07                	jle    80319e <remove+0x2d>
  803197:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80319c:	eb 33                	jmp    8031d1 <remove+0x60>
  80319e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8031a2:	48 89 c6             	mov    %rax,%rsi
  8031a5:	48 bf 00 90 80 00 00 	movabs $0x809000,%rdi
  8031ac:	00 00 00 
  8031af:	48 b8 8e 13 80 00 00 	movabs $0x80138e,%rax
  8031b6:	00 00 00 
  8031b9:	ff d0                	callq  *%rax
  8031bb:	be 00 00 00 00       	mov    $0x0,%esi
  8031c0:	bf 07 00 00 00       	mov    $0x7,%edi
  8031c5:	48 b8 04 2d 80 00 00 	movabs $0x802d04,%rax
  8031cc:	00 00 00 
  8031cf:	ff d0                	callq  *%rax
  8031d1:	c9                   	leaveq 
  8031d2:	c3                   	retq   

00000000008031d3 <sync>:
  8031d3:	55                   	push   %rbp
  8031d4:	48 89 e5             	mov    %rsp,%rbp
  8031d7:	be 00 00 00 00       	mov    $0x0,%esi
  8031dc:	bf 08 00 00 00       	mov    $0x8,%edi
  8031e1:	48 b8 04 2d 80 00 00 	movabs $0x802d04,%rax
  8031e8:	00 00 00 
  8031eb:	ff d0                	callq  *%rax
  8031ed:	5d                   	pop    %rbp
  8031ee:	c3                   	retq   

00000000008031ef <copy>:
  8031ef:	55                   	push   %rbp
  8031f0:	48 89 e5             	mov    %rsp,%rbp
  8031f3:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8031fa:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  803201:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  803208:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  80320f:	be 00 00 00 00       	mov    $0x0,%esi
  803214:	48 89 c7             	mov    %rax,%rdi
  803217:	48 b8 8d 2d 80 00 00 	movabs $0x802d8d,%rax
  80321e:	00 00 00 
  803221:	ff d0                	callq  *%rax
  803223:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803226:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80322a:	79 28                	jns    803254 <copy+0x65>
  80322c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80322f:	89 c6                	mov    %eax,%esi
  803231:	48 bf ac 50 80 00 00 	movabs $0x8050ac,%rdi
  803238:	00 00 00 
  80323b:	b8 00 00 00 00       	mov    $0x0,%eax
  803240:	48 ba fe 07 80 00 00 	movabs $0x8007fe,%rdx
  803247:	00 00 00 
  80324a:	ff d2                	callq  *%rdx
  80324c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80324f:	e9 76 01 00 00       	jmpq   8033ca <copy+0x1db>
  803254:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80325b:	be 01 01 00 00       	mov    $0x101,%esi
  803260:	48 89 c7             	mov    %rax,%rdi
  803263:	48 b8 8d 2d 80 00 00 	movabs $0x802d8d,%rax
  80326a:	00 00 00 
  80326d:	ff d0                	callq  *%rax
  80326f:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803272:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803276:	0f 89 ad 00 00 00    	jns    803329 <copy+0x13a>
  80327c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80327f:	89 c6                	mov    %eax,%esi
  803281:	48 bf c2 50 80 00 00 	movabs $0x8050c2,%rdi
  803288:	00 00 00 
  80328b:	b8 00 00 00 00       	mov    $0x0,%eax
  803290:	48 ba fe 07 80 00 00 	movabs $0x8007fe,%rdx
  803297:	00 00 00 
  80329a:	ff d2                	callq  *%rdx
  80329c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80329f:	89 c7                	mov    %eax,%edi
  8032a1:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  8032a8:	00 00 00 
  8032ab:	ff d0                	callq  *%rax
  8032ad:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8032b0:	e9 15 01 00 00       	jmpq   8033ca <copy+0x1db>
  8032b5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8032b8:	48 63 d0             	movslq %eax,%rdx
  8032bb:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8032c2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8032c5:	48 89 ce             	mov    %rcx,%rsi
  8032c8:	89 c7                	mov    %eax,%edi
  8032ca:	48 b8 ff 29 80 00 00 	movabs $0x8029ff,%rax
  8032d1:	00 00 00 
  8032d4:	ff d0                	callq  *%rax
  8032d6:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8032d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8032dd:	79 4a                	jns    803329 <copy+0x13a>
  8032df:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8032e2:	89 c6                	mov    %eax,%esi
  8032e4:	48 bf dc 50 80 00 00 	movabs $0x8050dc,%rdi
  8032eb:	00 00 00 
  8032ee:	b8 00 00 00 00       	mov    $0x0,%eax
  8032f3:	48 ba fe 07 80 00 00 	movabs $0x8007fe,%rdx
  8032fa:	00 00 00 
  8032fd:	ff d2                	callq  *%rdx
  8032ff:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803302:	89 c7                	mov    %eax,%edi
  803304:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  80330b:	00 00 00 
  80330e:	ff d0                	callq  *%rax
  803310:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803313:	89 c7                	mov    %eax,%edi
  803315:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  80331c:	00 00 00 
  80331f:	ff d0                	callq  *%rax
  803321:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803324:	e9 a1 00 00 00       	jmpq   8033ca <copy+0x1db>
  803329:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803330:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803333:	ba 00 02 00 00       	mov    $0x200,%edx
  803338:	48 89 ce             	mov    %rcx,%rsi
  80333b:	89 c7                	mov    %eax,%edi
  80333d:	48 b8 b4 28 80 00 00 	movabs $0x8028b4,%rax
  803344:	00 00 00 
  803347:	ff d0                	callq  *%rax
  803349:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80334c:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803350:	0f 8f 5f ff ff ff    	jg     8032b5 <copy+0xc6>
  803356:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80335a:	79 47                	jns    8033a3 <copy+0x1b4>
  80335c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80335f:	89 c6                	mov    %eax,%esi
  803361:	48 bf ef 50 80 00 00 	movabs $0x8050ef,%rdi
  803368:	00 00 00 
  80336b:	b8 00 00 00 00       	mov    $0x0,%eax
  803370:	48 ba fe 07 80 00 00 	movabs $0x8007fe,%rdx
  803377:	00 00 00 
  80337a:	ff d2                	callq  *%rdx
  80337c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80337f:	89 c7                	mov    %eax,%edi
  803381:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  803388:	00 00 00 
  80338b:	ff d0                	callq  *%rax
  80338d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803390:	89 c7                	mov    %eax,%edi
  803392:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  803399:	00 00 00 
  80339c:	ff d0                	callq  *%rax
  80339e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8033a1:	eb 27                	jmp    8033ca <copy+0x1db>
  8033a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8033a6:	89 c7                	mov    %eax,%edi
  8033a8:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  8033af:	00 00 00 
  8033b2:	ff d0                	callq  *%rax
  8033b4:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8033b7:	89 c7                	mov    %eax,%edi
  8033b9:	48 b8 91 26 80 00 00 	movabs $0x802691,%rax
  8033c0:	00 00 00 
  8033c3:	ff d0                	callq  *%rax
  8033c5:	b8 00 00 00 00       	mov    $0x0,%eax
  8033ca:	c9                   	leaveq 
  8033cb:	c3                   	retq   

00000000008033cc <writebuf>:
  8033cc:	55                   	push   %rbp
  8033cd:	48 89 e5             	mov    %rsp,%rbp
  8033d0:	48 83 ec 20          	sub    $0x20,%rsp
  8033d4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8033d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033dc:	8b 40 0c             	mov    0xc(%rax),%eax
  8033df:	85 c0                	test   %eax,%eax
  8033e1:	7e 67                	jle    80344a <writebuf+0x7e>
  8033e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033e7:	8b 40 04             	mov    0x4(%rax),%eax
  8033ea:	48 63 d0             	movslq %eax,%rdx
  8033ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033f1:	48 8d 48 10          	lea    0x10(%rax),%rcx
  8033f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8033f9:	8b 00                	mov    (%rax),%eax
  8033fb:	48 89 ce             	mov    %rcx,%rsi
  8033fe:	89 c7                	mov    %eax,%edi
  803400:	48 b8 ff 29 80 00 00 	movabs $0x8029ff,%rax
  803407:	00 00 00 
  80340a:	ff d0                	callq  *%rax
  80340c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80340f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803413:	7e 13                	jle    803428 <writebuf+0x5c>
  803415:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803419:	8b 50 08             	mov    0x8(%rax),%edx
  80341c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80341f:	01 c2                	add    %eax,%edx
  803421:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803425:	89 50 08             	mov    %edx,0x8(%rax)
  803428:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80342c:	8b 40 04             	mov    0x4(%rax),%eax
  80342f:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  803432:	74 16                	je     80344a <writebuf+0x7e>
  803434:	b8 00 00 00 00       	mov    $0x0,%eax
  803439:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80343d:	0f 4e 45 fc          	cmovle -0x4(%rbp),%eax
  803441:	89 c2                	mov    %eax,%edx
  803443:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803447:	89 50 0c             	mov    %edx,0xc(%rax)
  80344a:	90                   	nop
  80344b:	c9                   	leaveq 
  80344c:	c3                   	retq   

000000000080344d <putch>:
  80344d:	55                   	push   %rbp
  80344e:	48 89 e5             	mov    %rsp,%rbp
  803451:	48 83 ec 20          	sub    $0x20,%rsp
  803455:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803458:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80345c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803460:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803464:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803468:	8b 40 04             	mov    0x4(%rax),%eax
  80346b:	8d 48 01             	lea    0x1(%rax),%ecx
  80346e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803472:	89 4a 04             	mov    %ecx,0x4(%rdx)
  803475:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803478:	89 d1                	mov    %edx,%ecx
  80347a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80347e:	48 98                	cltq   
  803480:	88 4c 02 10          	mov    %cl,0x10(%rdx,%rax,1)
  803484:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803488:	8b 40 04             	mov    0x4(%rax),%eax
  80348b:	3d 00 01 00 00       	cmp    $0x100,%eax
  803490:	75 1e                	jne    8034b0 <putch+0x63>
  803492:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803496:	48 89 c7             	mov    %rax,%rdi
  803499:	48 b8 cc 33 80 00 00 	movabs $0x8033cc,%rax
  8034a0:	00 00 00 
  8034a3:	ff d0                	callq  *%rax
  8034a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8034a9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%rax)
  8034b0:	90                   	nop
  8034b1:	c9                   	leaveq 
  8034b2:	c3                   	retq   

00000000008034b3 <vfprintf>:
  8034b3:	55                   	push   %rbp
  8034b4:	48 89 e5             	mov    %rsp,%rbp
  8034b7:	48 81 ec 30 01 00 00 	sub    $0x130,%rsp
  8034be:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  8034c4:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  8034cb:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  8034d2:	8b 85 ec fe ff ff    	mov    -0x114(%rbp),%eax
  8034d8:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%rbp)
  8034de:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  8034e5:	00 00 00 
  8034e8:	c7 85 f8 fe ff ff 00 	movl   $0x0,-0x108(%rbp)
  8034ef:	00 00 00 
  8034f2:	c7 85 fc fe ff ff 01 	movl   $0x1,-0x104(%rbp)
  8034f9:	00 00 00 
  8034fc:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  803503:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  80350a:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  803511:	48 89 c6             	mov    %rax,%rsi
  803514:	48 bf 4d 34 80 00 00 	movabs $0x80344d,%rdi
  80351b:	00 00 00 
  80351e:	48 b8 9c 0b 80 00 00 	movabs $0x800b9c,%rax
  803525:	00 00 00 
  803528:	ff d0                	callq  *%rax
  80352a:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  803530:	85 c0                	test   %eax,%eax
  803532:	7e 16                	jle    80354a <vfprintf+0x97>
  803534:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  80353b:	48 89 c7             	mov    %rax,%rdi
  80353e:	48 b8 cc 33 80 00 00 	movabs $0x8033cc,%rax
  803545:	00 00 00 
  803548:	ff d0                	callq  *%rax
  80354a:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  803550:	85 c0                	test   %eax,%eax
  803552:	74 08                	je     80355c <vfprintf+0xa9>
  803554:	8b 85 f8 fe ff ff    	mov    -0x108(%rbp),%eax
  80355a:	eb 06                	jmp    803562 <vfprintf+0xaf>
  80355c:	8b 85 fc fe ff ff    	mov    -0x104(%rbp),%eax
  803562:	c9                   	leaveq 
  803563:	c3                   	retq   

0000000000803564 <fprintf>:
  803564:	55                   	push   %rbp
  803565:	48 89 e5             	mov    %rsp,%rbp
  803568:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  80356f:	89 bd 2c ff ff ff    	mov    %edi,-0xd4(%rbp)
  803575:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  80357c:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  803583:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  80358a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  803591:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803598:	84 c0                	test   %al,%al
  80359a:	74 20                	je     8035bc <fprintf+0x58>
  80359c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8035a0:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8035a4:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8035a8:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8035ac:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8035b0:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8035b4:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8035b8:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8035bc:	c7 85 30 ff ff ff 10 	movl   $0x10,-0xd0(%rbp)
  8035c3:	00 00 00 
  8035c6:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8035cd:	00 00 00 
  8035d0:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8035d4:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8035db:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8035e2:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8035e9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8035f0:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
  8035f7:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8035fd:	48 89 ce             	mov    %rcx,%rsi
  803600:	89 c7                	mov    %eax,%edi
  803602:	48 b8 b3 34 80 00 00 	movabs $0x8034b3,%rax
  803609:	00 00 00 
  80360c:	ff d0                	callq  *%rax
  80360e:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  803614:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80361a:	c9                   	leaveq 
  80361b:	c3                   	retq   

000000000080361c <printf>:
  80361c:	55                   	push   %rbp
  80361d:	48 89 e5             	mov    %rsp,%rbp
  803620:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
  803627:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  80362e:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  803635:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80363c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  803643:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80364a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  803651:	84 c0                	test   %al,%al
  803653:	74 20                	je     803675 <printf+0x59>
  803655:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  803659:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80365d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  803661:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  803665:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  803669:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80366d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  803671:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  803675:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80367c:	00 00 00 
  80367f:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  803686:	00 00 00 
  803689:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80368d:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803694:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80369b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8036a2:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  8036a9:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8036b0:	48 89 c6             	mov    %rax,%rsi
  8036b3:	bf 01 00 00 00       	mov    $0x1,%edi
  8036b8:	48 b8 b3 34 80 00 00 	movabs $0x8034b3,%rax
  8036bf:	00 00 00 
  8036c2:	ff d0                	callq  *%rax
  8036c4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8036ca:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8036d0:	c9                   	leaveq 
  8036d1:	c3                   	retq   

00000000008036d2 <fd2sockid>:
  8036d2:	55                   	push   %rbp
  8036d3:	48 89 e5             	mov    %rsp,%rbp
  8036d6:	48 83 ec 20          	sub    $0x20,%rsp
  8036da:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8036dd:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8036e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8036e4:	48 89 d6             	mov    %rdx,%rsi
  8036e7:	89 c7                	mov    %eax,%edi
  8036e9:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  8036f0:	00 00 00 
  8036f3:	ff d0                	callq  *%rax
  8036f5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8036f8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8036fc:	79 05                	jns    803703 <fd2sockid+0x31>
  8036fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803701:	eb 24                	jmp    803727 <fd2sockid+0x55>
  803703:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803707:	8b 10                	mov    (%rax),%edx
  803709:	48 b8 a0 70 80 00 00 	movabs $0x8070a0,%rax
  803710:	00 00 00 
  803713:	8b 00                	mov    (%rax),%eax
  803715:	39 c2                	cmp    %eax,%edx
  803717:	74 07                	je     803720 <fd2sockid+0x4e>
  803719:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80371e:	eb 07                	jmp    803727 <fd2sockid+0x55>
  803720:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803724:	8b 40 0c             	mov    0xc(%rax),%eax
  803727:	c9                   	leaveq 
  803728:	c3                   	retq   

0000000000803729 <alloc_sockfd>:
  803729:	55                   	push   %rbp
  80372a:	48 89 e5             	mov    %rsp,%rbp
  80372d:	48 83 ec 20          	sub    $0x20,%rsp
  803731:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803734:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803738:	48 89 c7             	mov    %rax,%rdi
  80373b:	48 b8 e7 23 80 00 00 	movabs $0x8023e7,%rax
  803742:	00 00 00 
  803745:	ff d0                	callq  *%rax
  803747:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80374a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80374e:	78 26                	js     803776 <alloc_sockfd+0x4d>
  803750:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803754:	ba 07 04 00 00       	mov    $0x407,%edx
  803759:	48 89 c6             	mov    %rax,%rsi
  80375c:	bf 00 00 00 00       	mov    $0x0,%edi
  803761:	48 b8 be 1c 80 00 00 	movabs $0x801cbe,%rax
  803768:	00 00 00 
  80376b:	ff d0                	callq  *%rax
  80376d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803770:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803774:	79 16                	jns    80378c <alloc_sockfd+0x63>
  803776:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803779:	89 c7                	mov    %eax,%edi
  80377b:	48 b8 38 3c 80 00 00 	movabs $0x803c38,%rax
  803782:	00 00 00 
  803785:	ff d0                	callq  *%rax
  803787:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80378a:	eb 3a                	jmp    8037c6 <alloc_sockfd+0x9d>
  80378c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803790:	48 ba a0 70 80 00 00 	movabs $0x8070a0,%rdx
  803797:	00 00 00 
  80379a:	8b 12                	mov    (%rdx),%edx
  80379c:	89 10                	mov    %edx,(%rax)
  80379e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037a2:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8037a9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037ad:	8b 55 ec             	mov    -0x14(%rbp),%edx
  8037b0:	89 50 0c             	mov    %edx,0xc(%rax)
  8037b3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8037b7:	48 89 c7             	mov    %rax,%rdi
  8037ba:	48 b8 99 23 80 00 00 	movabs $0x802399,%rax
  8037c1:	00 00 00 
  8037c4:	ff d0                	callq  *%rax
  8037c6:	c9                   	leaveq 
  8037c7:	c3                   	retq   

00000000008037c8 <accept>:
  8037c8:	55                   	push   %rbp
  8037c9:	48 89 e5             	mov    %rsp,%rbp
  8037cc:	48 83 ec 30          	sub    $0x30,%rsp
  8037d0:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8037d3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8037d7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8037db:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037de:	89 c7                	mov    %eax,%edi
  8037e0:	48 b8 d2 36 80 00 00 	movabs $0x8036d2,%rax
  8037e7:	00 00 00 
  8037ea:	ff d0                	callq  *%rax
  8037ec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8037ef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8037f3:	79 05                	jns    8037fa <accept+0x32>
  8037f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8037f8:	eb 3b                	jmp    803835 <accept+0x6d>
  8037fa:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8037fe:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803802:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803805:	48 89 ce             	mov    %rcx,%rsi
  803808:	89 c7                	mov    %eax,%edi
  80380a:	48 b8 15 3b 80 00 00 	movabs $0x803b15,%rax
  803811:	00 00 00 
  803814:	ff d0                	callq  *%rax
  803816:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803819:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80381d:	79 05                	jns    803824 <accept+0x5c>
  80381f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803822:	eb 11                	jmp    803835 <accept+0x6d>
  803824:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803827:	89 c7                	mov    %eax,%edi
  803829:	48 b8 29 37 80 00 00 	movabs $0x803729,%rax
  803830:	00 00 00 
  803833:	ff d0                	callq  *%rax
  803835:	c9                   	leaveq 
  803836:	c3                   	retq   

0000000000803837 <bind>:
  803837:	55                   	push   %rbp
  803838:	48 89 e5             	mov    %rsp,%rbp
  80383b:	48 83 ec 20          	sub    $0x20,%rsp
  80383f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803842:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803846:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803849:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80384c:	89 c7                	mov    %eax,%edi
  80384e:	48 b8 d2 36 80 00 00 	movabs $0x8036d2,%rax
  803855:	00 00 00 
  803858:	ff d0                	callq  *%rax
  80385a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80385d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803861:	79 05                	jns    803868 <bind+0x31>
  803863:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803866:	eb 1b                	jmp    803883 <bind+0x4c>
  803868:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80386b:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80386f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803872:	48 89 ce             	mov    %rcx,%rsi
  803875:	89 c7                	mov    %eax,%edi
  803877:	48 b8 94 3b 80 00 00 	movabs $0x803b94,%rax
  80387e:	00 00 00 
  803881:	ff d0                	callq  *%rax
  803883:	c9                   	leaveq 
  803884:	c3                   	retq   

0000000000803885 <shutdown>:
  803885:	55                   	push   %rbp
  803886:	48 89 e5             	mov    %rsp,%rbp
  803889:	48 83 ec 20          	sub    $0x20,%rsp
  80388d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803890:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803893:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803896:	89 c7                	mov    %eax,%edi
  803898:	48 b8 d2 36 80 00 00 	movabs $0x8036d2,%rax
  80389f:	00 00 00 
  8038a2:	ff d0                	callq  *%rax
  8038a4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038a7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038ab:	79 05                	jns    8038b2 <shutdown+0x2d>
  8038ad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038b0:	eb 16                	jmp    8038c8 <shutdown+0x43>
  8038b2:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8038b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038b8:	89 d6                	mov    %edx,%esi
  8038ba:	89 c7                	mov    %eax,%edi
  8038bc:	48 b8 f8 3b 80 00 00 	movabs $0x803bf8,%rax
  8038c3:	00 00 00 
  8038c6:	ff d0                	callq  *%rax
  8038c8:	c9                   	leaveq 
  8038c9:	c3                   	retq   

00000000008038ca <devsock_close>:
  8038ca:	55                   	push   %rbp
  8038cb:	48 89 e5             	mov    %rsp,%rbp
  8038ce:	48 83 ec 10          	sub    $0x10,%rsp
  8038d2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8038d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038da:	48 89 c7             	mov    %rax,%rdi
  8038dd:	48 b8 89 49 80 00 00 	movabs $0x804989,%rax
  8038e4:	00 00 00 
  8038e7:	ff d0                	callq  *%rax
  8038e9:	83 f8 01             	cmp    $0x1,%eax
  8038ec:	75 17                	jne    803905 <devsock_close+0x3b>
  8038ee:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038f2:	8b 40 0c             	mov    0xc(%rax),%eax
  8038f5:	89 c7                	mov    %eax,%edi
  8038f7:	48 b8 38 3c 80 00 00 	movabs $0x803c38,%rax
  8038fe:	00 00 00 
  803901:	ff d0                	callq  *%rax
  803903:	eb 05                	jmp    80390a <devsock_close+0x40>
  803905:	b8 00 00 00 00       	mov    $0x0,%eax
  80390a:	c9                   	leaveq 
  80390b:	c3                   	retq   

000000000080390c <connect>:
  80390c:	55                   	push   %rbp
  80390d:	48 89 e5             	mov    %rsp,%rbp
  803910:	48 83 ec 20          	sub    $0x20,%rsp
  803914:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803917:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80391b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  80391e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803921:	89 c7                	mov    %eax,%edi
  803923:	48 b8 d2 36 80 00 00 	movabs $0x8036d2,%rax
  80392a:	00 00 00 
  80392d:	ff d0                	callq  *%rax
  80392f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803932:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803936:	79 05                	jns    80393d <connect+0x31>
  803938:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80393b:	eb 1b                	jmp    803958 <connect+0x4c>
  80393d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803940:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803944:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803947:	48 89 ce             	mov    %rcx,%rsi
  80394a:	89 c7                	mov    %eax,%edi
  80394c:	48 b8 65 3c 80 00 00 	movabs $0x803c65,%rax
  803953:	00 00 00 
  803956:	ff d0                	callq  *%rax
  803958:	c9                   	leaveq 
  803959:	c3                   	retq   

000000000080395a <listen>:
  80395a:	55                   	push   %rbp
  80395b:	48 89 e5             	mov    %rsp,%rbp
  80395e:	48 83 ec 20          	sub    $0x20,%rsp
  803962:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803965:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803968:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80396b:	89 c7                	mov    %eax,%edi
  80396d:	48 b8 d2 36 80 00 00 	movabs $0x8036d2,%rax
  803974:	00 00 00 
  803977:	ff d0                	callq  *%rax
  803979:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80397c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803980:	79 05                	jns    803987 <listen+0x2d>
  803982:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803985:	eb 16                	jmp    80399d <listen+0x43>
  803987:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80398a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80398d:	89 d6                	mov    %edx,%esi
  80398f:	89 c7                	mov    %eax,%edi
  803991:	48 b8 c9 3c 80 00 00 	movabs $0x803cc9,%rax
  803998:	00 00 00 
  80399b:	ff d0                	callq  *%rax
  80399d:	c9                   	leaveq 
  80399e:	c3                   	retq   

000000000080399f <devsock_read>:
  80399f:	55                   	push   %rbp
  8039a0:	48 89 e5             	mov    %rsp,%rbp
  8039a3:	48 83 ec 20          	sub    $0x20,%rsp
  8039a7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039ab:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039af:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8039b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039b7:	89 c2                	mov    %eax,%edx
  8039b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039bd:	8b 40 0c             	mov    0xc(%rax),%eax
  8039c0:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8039c4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8039c9:	89 c7                	mov    %eax,%edi
  8039cb:	48 b8 09 3d 80 00 00 	movabs $0x803d09,%rax
  8039d2:	00 00 00 
  8039d5:	ff d0                	callq  *%rax
  8039d7:	c9                   	leaveq 
  8039d8:	c3                   	retq   

00000000008039d9 <devsock_write>:
  8039d9:	55                   	push   %rbp
  8039da:	48 89 e5             	mov    %rsp,%rbp
  8039dd:	48 83 ec 20          	sub    $0x20,%rsp
  8039e1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8039e5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8039e9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8039ed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8039f1:	89 c2                	mov    %eax,%edx
  8039f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039f7:	8b 40 0c             	mov    0xc(%rax),%eax
  8039fa:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8039fe:	b9 00 00 00 00       	mov    $0x0,%ecx
  803a03:	89 c7                	mov    %eax,%edi
  803a05:	48 b8 d5 3d 80 00 00 	movabs $0x803dd5,%rax
  803a0c:	00 00 00 
  803a0f:	ff d0                	callq  *%rax
  803a11:	c9                   	leaveq 
  803a12:	c3                   	retq   

0000000000803a13 <devsock_stat>:
  803a13:	55                   	push   %rbp
  803a14:	48 89 e5             	mov    %rsp,%rbp
  803a17:	48 83 ec 10          	sub    $0x10,%rsp
  803a1b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803a1f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803a23:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a27:	48 be 0a 51 80 00 00 	movabs $0x80510a,%rsi
  803a2e:	00 00 00 
  803a31:	48 89 c7             	mov    %rax,%rdi
  803a34:	48 b8 8e 13 80 00 00 	movabs $0x80138e,%rax
  803a3b:	00 00 00 
  803a3e:	ff d0                	callq  *%rax
  803a40:	b8 00 00 00 00       	mov    $0x0,%eax
  803a45:	c9                   	leaveq 
  803a46:	c3                   	retq   

0000000000803a47 <socket>:
  803a47:	55                   	push   %rbp
  803a48:	48 89 e5             	mov    %rsp,%rbp
  803a4b:	48 83 ec 20          	sub    $0x20,%rsp
  803a4f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803a52:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803a55:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  803a58:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803a5b:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803a5e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803a61:	89 ce                	mov    %ecx,%esi
  803a63:	89 c7                	mov    %eax,%edi
  803a65:	48 b8 8d 3e 80 00 00 	movabs $0x803e8d,%rax
  803a6c:	00 00 00 
  803a6f:	ff d0                	callq  *%rax
  803a71:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803a74:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803a78:	79 05                	jns    803a7f <socket+0x38>
  803a7a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a7d:	eb 11                	jmp    803a90 <socket+0x49>
  803a7f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803a82:	89 c7                	mov    %eax,%edi
  803a84:	48 b8 29 37 80 00 00 	movabs $0x803729,%rax
  803a8b:	00 00 00 
  803a8e:	ff d0                	callq  *%rax
  803a90:	c9                   	leaveq 
  803a91:	c3                   	retq   

0000000000803a92 <nsipc>:
  803a92:	55                   	push   %rbp
  803a93:	48 89 e5             	mov    %rsp,%rbp
  803a96:	48 83 ec 10          	sub    $0x10,%rsp
  803a9a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803a9d:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803aa4:	00 00 00 
  803aa7:	8b 00                	mov    (%rax),%eax
  803aa9:	85 c0                	test   %eax,%eax
  803aab:	75 1f                	jne    803acc <nsipc+0x3a>
  803aad:	bf 02 00 00 00       	mov    $0x2,%edi
  803ab2:	48 b8 18 49 80 00 00 	movabs $0x804918,%rax
  803ab9:	00 00 00 
  803abc:	ff d0                	callq  *%rax
  803abe:	89 c2                	mov    %eax,%edx
  803ac0:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803ac7:	00 00 00 
  803aca:	89 10                	mov    %edx,(%rax)
  803acc:	48 b8 04 80 80 00 00 	movabs $0x808004,%rax
  803ad3:	00 00 00 
  803ad6:	8b 00                	mov    (%rax),%eax
  803ad8:	8b 75 fc             	mov    -0x4(%rbp),%esi
  803adb:	b9 07 00 00 00       	mov    $0x7,%ecx
  803ae0:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  803ae7:	00 00 00 
  803aea:	89 c7                	mov    %eax,%edi
  803aec:	48 b8 0e 48 80 00 00 	movabs $0x80480e,%rax
  803af3:	00 00 00 
  803af6:	ff d0                	callq  *%rax
  803af8:	ba 00 00 00 00       	mov    $0x0,%edx
  803afd:	be 00 00 00 00       	mov    $0x0,%esi
  803b02:	bf 00 00 00 00       	mov    $0x0,%edi
  803b07:	48 b8 4d 47 80 00 00 	movabs $0x80474d,%rax
  803b0e:	00 00 00 
  803b11:	ff d0                	callq  *%rax
  803b13:	c9                   	leaveq 
  803b14:	c3                   	retq   

0000000000803b15 <nsipc_accept>:
  803b15:	55                   	push   %rbp
  803b16:	48 89 e5             	mov    %rsp,%rbp
  803b19:	48 83 ec 30          	sub    $0x30,%rsp
  803b1d:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803b20:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803b24:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803b28:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b2f:	00 00 00 
  803b32:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803b35:	89 10                	mov    %edx,(%rax)
  803b37:	bf 01 00 00 00       	mov    $0x1,%edi
  803b3c:	48 b8 92 3a 80 00 00 	movabs $0x803a92,%rax
  803b43:	00 00 00 
  803b46:	ff d0                	callq  *%rax
  803b48:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b4b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b4f:	78 3e                	js     803b8f <nsipc_accept+0x7a>
  803b51:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803b58:	00 00 00 
  803b5b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803b5f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b63:	8b 40 10             	mov    0x10(%rax),%eax
  803b66:	89 c2                	mov    %eax,%edx
  803b68:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803b6c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b70:	48 89 ce             	mov    %rcx,%rsi
  803b73:	48 89 c7             	mov    %rax,%rdi
  803b76:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  803b7d:	00 00 00 
  803b80:	ff d0                	callq  *%rax
  803b82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803b86:	8b 50 10             	mov    0x10(%rax),%edx
  803b89:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803b8d:	89 10                	mov    %edx,(%rax)
  803b8f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b92:	c9                   	leaveq 
  803b93:	c3                   	retq   

0000000000803b94 <nsipc_bind>:
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
  803bc9:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  803bd0:	00 00 00 
  803bd3:	ff d0                	callq  *%rax
  803bd5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803bdc:	00 00 00 
  803bdf:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803be2:	89 50 14             	mov    %edx,0x14(%rax)
  803be5:	bf 02 00 00 00       	mov    $0x2,%edi
  803bea:	48 b8 92 3a 80 00 00 	movabs $0x803a92,%rax
  803bf1:	00 00 00 
  803bf4:	ff d0                	callq  *%rax
  803bf6:	c9                   	leaveq 
  803bf7:	c3                   	retq   

0000000000803bf8 <nsipc_shutdown>:
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
  803c25:	bf 03 00 00 00       	mov    $0x3,%edi
  803c2a:	48 b8 92 3a 80 00 00 	movabs $0x803a92,%rax
  803c31:	00 00 00 
  803c34:	ff d0                	callq  *%rax
  803c36:	c9                   	leaveq 
  803c37:	c3                   	retq   

0000000000803c38 <nsipc_close>:
  803c38:	55                   	push   %rbp
  803c39:	48 89 e5             	mov    %rsp,%rbp
  803c3c:	48 83 ec 10          	sub    $0x10,%rsp
  803c40:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c43:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c4a:	00 00 00 
  803c4d:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c50:	89 10                	mov    %edx,(%rax)
  803c52:	bf 04 00 00 00       	mov    $0x4,%edi
  803c57:	48 b8 92 3a 80 00 00 	movabs $0x803a92,%rax
  803c5e:	00 00 00 
  803c61:	ff d0                	callq  *%rax
  803c63:	c9                   	leaveq 
  803c64:	c3                   	retq   

0000000000803c65 <nsipc_connect>:
  803c65:	55                   	push   %rbp
  803c66:	48 89 e5             	mov    %rsp,%rbp
  803c69:	48 83 ec 10          	sub    $0x10,%rsp
  803c6d:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803c70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803c74:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803c77:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803c7e:	00 00 00 
  803c81:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803c84:	89 10                	mov    %edx,(%rax)
  803c86:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803c89:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c8d:	48 89 c6             	mov    %rax,%rsi
  803c90:	48 bf 04 b0 80 00 00 	movabs $0x80b004,%rdi
  803c97:	00 00 00 
  803c9a:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  803ca1:	00 00 00 
  803ca4:	ff d0                	callq  *%rax
  803ca6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cad:	00 00 00 
  803cb0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cb3:	89 50 14             	mov    %edx,0x14(%rax)
  803cb6:	bf 05 00 00 00       	mov    $0x5,%edi
  803cbb:	48 b8 92 3a 80 00 00 	movabs $0x803a92,%rax
  803cc2:	00 00 00 
  803cc5:	ff d0                	callq  *%rax
  803cc7:	c9                   	leaveq 
  803cc8:	c3                   	retq   

0000000000803cc9 <nsipc_listen>:
  803cc9:	55                   	push   %rbp
  803cca:	48 89 e5             	mov    %rsp,%rbp
  803ccd:	48 83 ec 10          	sub    $0x10,%rsp
  803cd1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803cd4:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803cd7:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803cde:	00 00 00 
  803ce1:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803ce4:	89 10                	mov    %edx,(%rax)
  803ce6:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ced:	00 00 00 
  803cf0:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803cf3:	89 50 04             	mov    %edx,0x4(%rax)
  803cf6:	bf 06 00 00 00       	mov    $0x6,%edi
  803cfb:	48 b8 92 3a 80 00 00 	movabs $0x803a92,%rax
  803d02:	00 00 00 
  803d05:	ff d0                	callq  *%rax
  803d07:	c9                   	leaveq 
  803d08:	c3                   	retq   

0000000000803d09 <nsipc_recv>:
  803d09:	55                   	push   %rbp
  803d0a:	48 89 e5             	mov    %rsp,%rbp
  803d0d:	48 83 ec 30          	sub    $0x30,%rsp
  803d11:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803d14:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803d18:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803d1b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803d1e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d25:	00 00 00 
  803d28:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803d2b:	89 10                	mov    %edx,(%rax)
  803d2d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d34:	00 00 00 
  803d37:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803d3a:	89 50 04             	mov    %edx,0x4(%rax)
  803d3d:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803d44:	00 00 00 
  803d47:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803d4a:	89 50 08             	mov    %edx,0x8(%rax)
  803d4d:	bf 07 00 00 00       	mov    $0x7,%edi
  803d52:	48 b8 92 3a 80 00 00 	movabs $0x803a92,%rax
  803d59:	00 00 00 
  803d5c:	ff d0                	callq  *%rax
  803d5e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d61:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d65:	78 69                	js     803dd0 <nsipc_recv+0xc7>
  803d67:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803d6e:	7f 08                	jg     803d78 <nsipc_recv+0x6f>
  803d70:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d73:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  803d76:	7e 35                	jle    803dad <nsipc_recv+0xa4>
  803d78:	48 b9 11 51 80 00 00 	movabs $0x805111,%rcx
  803d7f:	00 00 00 
  803d82:	48 ba 26 51 80 00 00 	movabs $0x805126,%rdx
  803d89:	00 00 00 
  803d8c:	be 62 00 00 00       	mov    $0x62,%esi
  803d91:	48 bf 3b 51 80 00 00 	movabs $0x80513b,%rdi
  803d98:	00 00 00 
  803d9b:	b8 00 00 00 00       	mov    $0x0,%eax
  803da0:	49 b8 c4 05 80 00 00 	movabs $0x8005c4,%r8
  803da7:	00 00 00 
  803daa:	41 ff d0             	callq  *%r8
  803dad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803db0:	48 63 d0             	movslq %eax,%rdx
  803db3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803db7:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  803dbe:	00 00 00 
  803dc1:	48 89 c7             	mov    %rax,%rdi
  803dc4:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  803dcb:	00 00 00 
  803dce:	ff d0                	callq  *%rax
  803dd0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dd3:	c9                   	leaveq 
  803dd4:	c3                   	retq   

0000000000803dd5 <nsipc_send>:
  803dd5:	55                   	push   %rbp
  803dd6:	48 89 e5             	mov    %rsp,%rbp
  803dd9:	48 83 ec 20          	sub    $0x20,%rsp
  803ddd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803de0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803de4:	89 55 f8             	mov    %edx,-0x8(%rbp)
  803de7:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  803dea:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803df1:	00 00 00 
  803df4:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803df7:	89 10                	mov    %edx,(%rax)
  803df9:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803e00:	7e 35                	jle    803e37 <nsipc_send+0x62>
  803e02:	48 b9 4a 51 80 00 00 	movabs $0x80514a,%rcx
  803e09:	00 00 00 
  803e0c:	48 ba 26 51 80 00 00 	movabs $0x805126,%rdx
  803e13:	00 00 00 
  803e16:	be 6d 00 00 00       	mov    $0x6d,%esi
  803e1b:	48 bf 3b 51 80 00 00 	movabs $0x80513b,%rdi
  803e22:	00 00 00 
  803e25:	b8 00 00 00 00       	mov    $0x0,%eax
  803e2a:	49 b8 c4 05 80 00 00 	movabs $0x8005c4,%r8
  803e31:	00 00 00 
  803e34:	41 ff d0             	callq  *%r8
  803e37:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803e3a:	48 63 d0             	movslq %eax,%rdx
  803e3d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e41:	48 89 c6             	mov    %rax,%rsi
  803e44:	48 bf 0c b0 80 00 00 	movabs $0x80b00c,%rdi
  803e4b:	00 00 00 
  803e4e:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  803e55:	00 00 00 
  803e58:	ff d0                	callq  *%rax
  803e5a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e61:	00 00 00 
  803e64:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803e67:	89 50 04             	mov    %edx,0x4(%rax)
  803e6a:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803e71:	00 00 00 
  803e74:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803e77:	89 50 08             	mov    %edx,0x8(%rax)
  803e7a:	bf 08 00 00 00       	mov    $0x8,%edi
  803e7f:	48 b8 92 3a 80 00 00 	movabs $0x803a92,%rax
  803e86:	00 00 00 
  803e89:	ff d0                	callq  *%rax
  803e8b:	c9                   	leaveq 
  803e8c:	c3                   	retq   

0000000000803e8d <nsipc_socket>:
  803e8d:	55                   	push   %rbp
  803e8e:	48 89 e5             	mov    %rsp,%rbp
  803e91:	48 83 ec 10          	sub    $0x10,%rsp
  803e95:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803e98:	89 75 f8             	mov    %esi,-0x8(%rbp)
  803e9b:	89 55 f4             	mov    %edx,-0xc(%rbp)
  803e9e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ea5:	00 00 00 
  803ea8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803eab:	89 10                	mov    %edx,(%rax)
  803ead:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803eb4:	00 00 00 
  803eb7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803eba:	89 50 04             	mov    %edx,0x4(%rax)
  803ebd:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  803ec4:	00 00 00 
  803ec7:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803eca:	89 50 08             	mov    %edx,0x8(%rax)
  803ecd:	bf 09 00 00 00       	mov    $0x9,%edi
  803ed2:	48 b8 92 3a 80 00 00 	movabs $0x803a92,%rax
  803ed9:	00 00 00 
  803edc:	ff d0                	callq  *%rax
  803ede:	c9                   	leaveq 
  803edf:	c3                   	retq   

0000000000803ee0 <pipe>:
  803ee0:	55                   	push   %rbp
  803ee1:	48 89 e5             	mov    %rsp,%rbp
  803ee4:	53                   	push   %rbx
  803ee5:	48 83 ec 38          	sub    $0x38,%rsp
  803ee9:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  803eed:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  803ef1:	48 89 c7             	mov    %rax,%rdi
  803ef4:	48 b8 e7 23 80 00 00 	movabs $0x8023e7,%rax
  803efb:	00 00 00 
  803efe:	ff d0                	callq  *%rax
  803f00:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f03:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f07:	0f 88 bf 01 00 00    	js     8040cc <pipe+0x1ec>
  803f0d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f11:	ba 07 04 00 00       	mov    $0x407,%edx
  803f16:	48 89 c6             	mov    %rax,%rsi
  803f19:	bf 00 00 00 00       	mov    $0x0,%edi
  803f1e:	48 b8 be 1c 80 00 00 	movabs $0x801cbe,%rax
  803f25:	00 00 00 
  803f28:	ff d0                	callq  *%rax
  803f2a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f2d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f31:	0f 88 95 01 00 00    	js     8040cc <pipe+0x1ec>
  803f37:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803f3b:	48 89 c7             	mov    %rax,%rdi
  803f3e:	48 b8 e7 23 80 00 00 	movabs $0x8023e7,%rax
  803f45:	00 00 00 
  803f48:	ff d0                	callq  *%rax
  803f4a:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f4d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f51:	0f 88 5d 01 00 00    	js     8040b4 <pipe+0x1d4>
  803f57:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803f5b:	ba 07 04 00 00       	mov    $0x407,%edx
  803f60:	48 89 c6             	mov    %rax,%rsi
  803f63:	bf 00 00 00 00       	mov    $0x0,%edi
  803f68:	48 b8 be 1c 80 00 00 	movabs $0x801cbe,%rax
  803f6f:	00 00 00 
  803f72:	ff d0                	callq  *%rax
  803f74:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803f77:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803f7b:	0f 88 33 01 00 00    	js     8040b4 <pipe+0x1d4>
  803f81:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803f85:	48 89 c7             	mov    %rax,%rdi
  803f88:	48 b8 bc 23 80 00 00 	movabs $0x8023bc,%rax
  803f8f:	00 00 00 
  803f92:	ff d0                	callq  *%rax
  803f94:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803f98:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f9c:	ba 07 04 00 00       	mov    $0x407,%edx
  803fa1:	48 89 c6             	mov    %rax,%rsi
  803fa4:	bf 00 00 00 00       	mov    $0x0,%edi
  803fa9:	48 b8 be 1c 80 00 00 	movabs $0x801cbe,%rax
  803fb0:	00 00 00 
  803fb3:	ff d0                	callq  *%rax
  803fb5:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803fb8:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803fbc:	0f 88 d9 00 00 00    	js     80409b <pipe+0x1bb>
  803fc2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803fc6:	48 89 c7             	mov    %rax,%rdi
  803fc9:	48 b8 bc 23 80 00 00 	movabs $0x8023bc,%rax
  803fd0:	00 00 00 
  803fd3:	ff d0                	callq  *%rax
  803fd5:	48 89 c2             	mov    %rax,%rdx
  803fd8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803fdc:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  803fe2:	48 89 d1             	mov    %rdx,%rcx
  803fe5:	ba 00 00 00 00       	mov    $0x0,%edx
  803fea:	48 89 c6             	mov    %rax,%rsi
  803fed:	bf 00 00 00 00       	mov    $0x0,%edi
  803ff2:	48 b8 10 1d 80 00 00 	movabs $0x801d10,%rax
  803ff9:	00 00 00 
  803ffc:	ff d0                	callq  *%rax
  803ffe:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804001:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804005:	78 79                	js     804080 <pipe+0x1a0>
  804007:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80400b:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  804012:	00 00 00 
  804015:	8b 12                	mov    (%rdx),%edx
  804017:	89 10                	mov    %edx,(%rax)
  804019:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80401d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804024:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804028:	48 ba e0 70 80 00 00 	movabs $0x8070e0,%rdx
  80402f:	00 00 00 
  804032:	8b 12                	mov    (%rdx),%edx
  804034:	89 10                	mov    %edx,(%rax)
  804036:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80403a:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804041:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804045:	48 89 c7             	mov    %rax,%rdi
  804048:	48 b8 99 23 80 00 00 	movabs $0x802399,%rax
  80404f:	00 00 00 
  804052:	ff d0                	callq  *%rax
  804054:	89 c2                	mov    %eax,%edx
  804056:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80405a:	89 10                	mov    %edx,(%rax)
  80405c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804060:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804064:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804068:	48 89 c7             	mov    %rax,%rdi
  80406b:	48 b8 99 23 80 00 00 	movabs $0x802399,%rax
  804072:	00 00 00 
  804075:	ff d0                	callq  *%rax
  804077:	89 03                	mov    %eax,(%rbx)
  804079:	b8 00 00 00 00       	mov    $0x0,%eax
  80407e:	eb 4f                	jmp    8040cf <pipe+0x1ef>
  804080:	90                   	nop
  804081:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804085:	48 89 c6             	mov    %rax,%rsi
  804088:	bf 00 00 00 00       	mov    $0x0,%edi
  80408d:	48 b8 70 1d 80 00 00 	movabs $0x801d70,%rax
  804094:	00 00 00 
  804097:	ff d0                	callq  *%rax
  804099:	eb 01                	jmp    80409c <pipe+0x1bc>
  80409b:	90                   	nop
  80409c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8040a0:	48 89 c6             	mov    %rax,%rsi
  8040a3:	bf 00 00 00 00       	mov    $0x0,%edi
  8040a8:	48 b8 70 1d 80 00 00 	movabs $0x801d70,%rax
  8040af:	00 00 00 
  8040b2:	ff d0                	callq  *%rax
  8040b4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8040b8:	48 89 c6             	mov    %rax,%rsi
  8040bb:	bf 00 00 00 00       	mov    $0x0,%edi
  8040c0:	48 b8 70 1d 80 00 00 	movabs $0x801d70,%rax
  8040c7:	00 00 00 
  8040ca:	ff d0                	callq  *%rax
  8040cc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8040cf:	48 83 c4 38          	add    $0x38,%rsp
  8040d3:	5b                   	pop    %rbx
  8040d4:	5d                   	pop    %rbp
  8040d5:	c3                   	retq   

00000000008040d6 <_pipeisclosed>:
  8040d6:	55                   	push   %rbp
  8040d7:	48 89 e5             	mov    %rsp,%rbp
  8040da:	53                   	push   %rbx
  8040db:	48 83 ec 28          	sub    $0x28,%rsp
  8040df:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8040e3:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8040e7:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8040ee:	00 00 00 
  8040f1:	48 8b 00             	mov    (%rax),%rax
  8040f4:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  8040fa:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8040fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804101:	48 89 c7             	mov    %rax,%rdi
  804104:	48 b8 89 49 80 00 00 	movabs $0x804989,%rax
  80410b:	00 00 00 
  80410e:	ff d0                	callq  *%rax
  804110:	89 c3                	mov    %eax,%ebx
  804112:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804116:	48 89 c7             	mov    %rax,%rdi
  804119:	48 b8 89 49 80 00 00 	movabs $0x804989,%rax
  804120:	00 00 00 
  804123:	ff d0                	callq  *%rax
  804125:	39 c3                	cmp    %eax,%ebx
  804127:	0f 94 c0             	sete   %al
  80412a:	0f b6 c0             	movzbl %al,%eax
  80412d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804130:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  804137:	00 00 00 
  80413a:	48 8b 00             	mov    (%rax),%rax
  80413d:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804143:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804146:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804149:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80414c:	75 05                	jne    804153 <_pipeisclosed+0x7d>
  80414e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804151:	eb 4a                	jmp    80419d <_pipeisclosed+0xc7>
  804153:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804156:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804159:	74 8c                	je     8040e7 <_pipeisclosed+0x11>
  80415b:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  80415f:	75 86                	jne    8040e7 <_pipeisclosed+0x11>
  804161:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  804168:	00 00 00 
  80416b:	48 8b 00             	mov    (%rax),%rax
  80416e:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804174:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804177:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80417a:	89 c6                	mov    %eax,%esi
  80417c:	48 bf 5b 51 80 00 00 	movabs $0x80515b,%rdi
  804183:	00 00 00 
  804186:	b8 00 00 00 00       	mov    $0x0,%eax
  80418b:	49 b8 fe 07 80 00 00 	movabs $0x8007fe,%r8
  804192:	00 00 00 
  804195:	41 ff d0             	callq  *%r8
  804198:	e9 4a ff ff ff       	jmpq   8040e7 <_pipeisclosed+0x11>
  80419d:	48 83 c4 28          	add    $0x28,%rsp
  8041a1:	5b                   	pop    %rbx
  8041a2:	5d                   	pop    %rbp
  8041a3:	c3                   	retq   

00000000008041a4 <pipeisclosed>:
  8041a4:	55                   	push   %rbp
  8041a5:	48 89 e5             	mov    %rsp,%rbp
  8041a8:	48 83 ec 30          	sub    $0x30,%rsp
  8041ac:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8041af:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8041b3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8041b6:	48 89 d6             	mov    %rdx,%rsi
  8041b9:	89 c7                	mov    %eax,%edi
  8041bb:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  8041c2:	00 00 00 
  8041c5:	ff d0                	callq  *%rax
  8041c7:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8041ca:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8041ce:	79 05                	jns    8041d5 <pipeisclosed+0x31>
  8041d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8041d3:	eb 31                	jmp    804206 <pipeisclosed+0x62>
  8041d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041d9:	48 89 c7             	mov    %rax,%rdi
  8041dc:	48 b8 bc 23 80 00 00 	movabs $0x8023bc,%rax
  8041e3:	00 00 00 
  8041e6:	ff d0                	callq  *%rax
  8041e8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8041ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041f0:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8041f4:	48 89 d6             	mov    %rdx,%rsi
  8041f7:	48 89 c7             	mov    %rax,%rdi
  8041fa:	48 b8 d6 40 80 00 00 	movabs $0x8040d6,%rax
  804201:	00 00 00 
  804204:	ff d0                	callq  *%rax
  804206:	c9                   	leaveq 
  804207:	c3                   	retq   

0000000000804208 <devpipe_read>:
  804208:	55                   	push   %rbp
  804209:	48 89 e5             	mov    %rsp,%rbp
  80420c:	48 83 ec 40          	sub    $0x40,%rsp
  804210:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804214:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804218:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80421c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804220:	48 89 c7             	mov    %rax,%rdi
  804223:	48 b8 bc 23 80 00 00 	movabs $0x8023bc,%rax
  80422a:	00 00 00 
  80422d:	ff d0                	callq  *%rax
  80422f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804233:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804237:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80423b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804242:	00 
  804243:	e9 90 00 00 00       	jmpq   8042d8 <devpipe_read+0xd0>
  804248:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  80424d:	74 09                	je     804258 <devpipe_read+0x50>
  80424f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804253:	e9 8e 00 00 00       	jmpq   8042e6 <devpipe_read+0xde>
  804258:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80425c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804260:	48 89 d6             	mov    %rdx,%rsi
  804263:	48 89 c7             	mov    %rax,%rdi
  804266:	48 b8 d6 40 80 00 00 	movabs $0x8040d6,%rax
  80426d:	00 00 00 
  804270:	ff d0                	callq  *%rax
  804272:	85 c0                	test   %eax,%eax
  804274:	74 07                	je     80427d <devpipe_read+0x75>
  804276:	b8 00 00 00 00       	mov    $0x0,%eax
  80427b:	eb 69                	jmp    8042e6 <devpipe_read+0xde>
  80427d:	48 b8 81 1c 80 00 00 	movabs $0x801c81,%rax
  804284:	00 00 00 
  804287:	ff d0                	callq  *%rax
  804289:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80428d:	8b 10                	mov    (%rax),%edx
  80428f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804293:	8b 40 04             	mov    0x4(%rax),%eax
  804296:	39 c2                	cmp    %eax,%edx
  804298:	74 ae                	je     804248 <devpipe_read+0x40>
  80429a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80429e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042a2:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8042a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042aa:	8b 00                	mov    (%rax),%eax
  8042ac:	99                   	cltd   
  8042ad:	c1 ea 1b             	shr    $0x1b,%edx
  8042b0:	01 d0                	add    %edx,%eax
  8042b2:	83 e0 1f             	and    $0x1f,%eax
  8042b5:	29 d0                	sub    %edx,%eax
  8042b7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8042bb:	48 98                	cltq   
  8042bd:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8042c2:	88 01                	mov    %al,(%rcx)
  8042c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042c8:	8b 00                	mov    (%rax),%eax
  8042ca:	8d 50 01             	lea    0x1(%rax),%edx
  8042cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042d1:	89 10                	mov    %edx,(%rax)
  8042d3:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8042d8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042dc:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8042e0:	72 a7                	jb     804289 <devpipe_read+0x81>
  8042e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8042e6:	c9                   	leaveq 
  8042e7:	c3                   	retq   

00000000008042e8 <devpipe_write>:
  8042e8:	55                   	push   %rbp
  8042e9:	48 89 e5             	mov    %rsp,%rbp
  8042ec:	48 83 ec 40          	sub    $0x40,%rsp
  8042f0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8042f4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8042f8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8042fc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804300:	48 89 c7             	mov    %rax,%rdi
  804303:	48 b8 bc 23 80 00 00 	movabs $0x8023bc,%rax
  80430a:	00 00 00 
  80430d:	ff d0                	callq  *%rax
  80430f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804313:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804317:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80431b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804322:	00 
  804323:	e9 8f 00 00 00       	jmpq   8043b7 <devpipe_write+0xcf>
  804328:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80432c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804330:	48 89 d6             	mov    %rdx,%rsi
  804333:	48 89 c7             	mov    %rax,%rdi
  804336:	48 b8 d6 40 80 00 00 	movabs $0x8040d6,%rax
  80433d:	00 00 00 
  804340:	ff d0                	callq  *%rax
  804342:	85 c0                	test   %eax,%eax
  804344:	74 07                	je     80434d <devpipe_write+0x65>
  804346:	b8 00 00 00 00       	mov    $0x0,%eax
  80434b:	eb 78                	jmp    8043c5 <devpipe_write+0xdd>
  80434d:	48 b8 81 1c 80 00 00 	movabs $0x801c81,%rax
  804354:	00 00 00 
  804357:	ff d0                	callq  *%rax
  804359:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80435d:	8b 40 04             	mov    0x4(%rax),%eax
  804360:	48 63 d0             	movslq %eax,%rdx
  804363:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804367:	8b 00                	mov    (%rax),%eax
  804369:	48 98                	cltq   
  80436b:	48 83 c0 20          	add    $0x20,%rax
  80436f:	48 39 c2             	cmp    %rax,%rdx
  804372:	73 b4                	jae    804328 <devpipe_write+0x40>
  804374:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804378:	8b 40 04             	mov    0x4(%rax),%eax
  80437b:	99                   	cltd   
  80437c:	c1 ea 1b             	shr    $0x1b,%edx
  80437f:	01 d0                	add    %edx,%eax
  804381:	83 e0 1f             	and    $0x1f,%eax
  804384:	29 d0                	sub    %edx,%eax
  804386:	89 c6                	mov    %eax,%esi
  804388:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80438c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804390:	48 01 d0             	add    %rdx,%rax
  804393:	0f b6 08             	movzbl (%rax),%ecx
  804396:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80439a:	48 63 c6             	movslq %esi,%rax
  80439d:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8043a1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043a5:	8b 40 04             	mov    0x4(%rax),%eax
  8043a8:	8d 50 01             	lea    0x1(%rax),%edx
  8043ab:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043af:	89 50 04             	mov    %edx,0x4(%rax)
  8043b2:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8043b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043bb:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8043bf:	72 98                	jb     804359 <devpipe_write+0x71>
  8043c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8043c5:	c9                   	leaveq 
  8043c6:	c3                   	retq   

00000000008043c7 <devpipe_stat>:
  8043c7:	55                   	push   %rbp
  8043c8:	48 89 e5             	mov    %rsp,%rbp
  8043cb:	48 83 ec 20          	sub    $0x20,%rsp
  8043cf:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8043d3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8043d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043db:	48 89 c7             	mov    %rax,%rdi
  8043de:	48 b8 bc 23 80 00 00 	movabs $0x8023bc,%rax
  8043e5:	00 00 00 
  8043e8:	ff d0                	callq  *%rax
  8043ea:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8043ee:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8043f2:	48 be 6e 51 80 00 00 	movabs $0x80516e,%rsi
  8043f9:	00 00 00 
  8043fc:	48 89 c7             	mov    %rax,%rdi
  8043ff:	48 b8 8e 13 80 00 00 	movabs $0x80138e,%rax
  804406:	00 00 00 
  804409:	ff d0                	callq  *%rax
  80440b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80440f:	8b 50 04             	mov    0x4(%rax),%edx
  804412:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804416:	8b 00                	mov    (%rax),%eax
  804418:	29 c2                	sub    %eax,%edx
  80441a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80441e:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804424:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804428:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80442f:	00 00 00 
  804432:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804436:	48 b9 e0 70 80 00 00 	movabs $0x8070e0,%rcx
  80443d:	00 00 00 
  804440:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804447:	b8 00 00 00 00       	mov    $0x0,%eax
  80444c:	c9                   	leaveq 
  80444d:	c3                   	retq   

000000000080444e <devpipe_close>:
  80444e:	55                   	push   %rbp
  80444f:	48 89 e5             	mov    %rsp,%rbp
  804452:	48 83 ec 10          	sub    $0x10,%rsp
  804456:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80445a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80445e:	48 89 c6             	mov    %rax,%rsi
  804461:	bf 00 00 00 00       	mov    $0x0,%edi
  804466:	48 b8 70 1d 80 00 00 	movabs $0x801d70,%rax
  80446d:	00 00 00 
  804470:	ff d0                	callq  *%rax
  804472:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804476:	48 89 c7             	mov    %rax,%rdi
  804479:	48 b8 bc 23 80 00 00 	movabs $0x8023bc,%rax
  804480:	00 00 00 
  804483:	ff d0                	callq  *%rax
  804485:	48 89 c6             	mov    %rax,%rsi
  804488:	bf 00 00 00 00       	mov    $0x0,%edi
  80448d:	48 b8 70 1d 80 00 00 	movabs $0x801d70,%rax
  804494:	00 00 00 
  804497:	ff d0                	callq  *%rax
  804499:	c9                   	leaveq 
  80449a:	c3                   	retq   

000000000080449b <cputchar>:
  80449b:	55                   	push   %rbp
  80449c:	48 89 e5             	mov    %rsp,%rbp
  80449f:	48 83 ec 20          	sub    $0x20,%rsp
  8044a3:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8044a6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8044a9:	88 45 ff             	mov    %al,-0x1(%rbp)
  8044ac:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  8044b0:	be 01 00 00 00       	mov    $0x1,%esi
  8044b5:	48 89 c7             	mov    %rax,%rdi
  8044b8:	48 b8 76 1b 80 00 00 	movabs $0x801b76,%rax
  8044bf:	00 00 00 
  8044c2:	ff d0                	callq  *%rax
  8044c4:	90                   	nop
  8044c5:	c9                   	leaveq 
  8044c6:	c3                   	retq   

00000000008044c7 <getchar>:
  8044c7:	55                   	push   %rbp
  8044c8:	48 89 e5             	mov    %rsp,%rbp
  8044cb:	48 83 ec 10          	sub    $0x10,%rsp
  8044cf:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  8044d3:	ba 01 00 00 00       	mov    $0x1,%edx
  8044d8:	48 89 c6             	mov    %rax,%rsi
  8044db:	bf 00 00 00 00       	mov    $0x0,%edi
  8044e0:	48 b8 b4 28 80 00 00 	movabs $0x8028b4,%rax
  8044e7:	00 00 00 
  8044ea:	ff d0                	callq  *%rax
  8044ec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8044ef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044f3:	79 05                	jns    8044fa <getchar+0x33>
  8044f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044f8:	eb 14                	jmp    80450e <getchar+0x47>
  8044fa:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8044fe:	7f 07                	jg     804507 <getchar+0x40>
  804500:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  804505:	eb 07                	jmp    80450e <getchar+0x47>
  804507:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  80450b:	0f b6 c0             	movzbl %al,%eax
  80450e:	c9                   	leaveq 
  80450f:	c3                   	retq   

0000000000804510 <iscons>:
  804510:	55                   	push   %rbp
  804511:	48 89 e5             	mov    %rsp,%rbp
  804514:	48 83 ec 20          	sub    $0x20,%rsp
  804518:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80451b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80451f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804522:	48 89 d6             	mov    %rdx,%rsi
  804525:	89 c7                	mov    %eax,%edi
  804527:	48 b8 7f 24 80 00 00 	movabs $0x80247f,%rax
  80452e:	00 00 00 
  804531:	ff d0                	callq  *%rax
  804533:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804536:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80453a:	79 05                	jns    804541 <iscons+0x31>
  80453c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80453f:	eb 1a                	jmp    80455b <iscons+0x4b>
  804541:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804545:	8b 10                	mov    (%rax),%edx
  804547:	48 b8 20 71 80 00 00 	movabs $0x807120,%rax
  80454e:	00 00 00 
  804551:	8b 00                	mov    (%rax),%eax
  804553:	39 c2                	cmp    %eax,%edx
  804555:	0f 94 c0             	sete   %al
  804558:	0f b6 c0             	movzbl %al,%eax
  80455b:	c9                   	leaveq 
  80455c:	c3                   	retq   

000000000080455d <opencons>:
  80455d:	55                   	push   %rbp
  80455e:	48 89 e5             	mov    %rsp,%rbp
  804561:	48 83 ec 10          	sub    $0x10,%rsp
  804565:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  804569:	48 89 c7             	mov    %rax,%rdi
  80456c:	48 b8 e7 23 80 00 00 	movabs $0x8023e7,%rax
  804573:	00 00 00 
  804576:	ff d0                	callq  *%rax
  804578:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80457b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80457f:	79 05                	jns    804586 <opencons+0x29>
  804581:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804584:	eb 5b                	jmp    8045e1 <opencons+0x84>
  804586:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80458a:	ba 07 04 00 00       	mov    $0x407,%edx
  80458f:	48 89 c6             	mov    %rax,%rsi
  804592:	bf 00 00 00 00       	mov    $0x0,%edi
  804597:	48 b8 be 1c 80 00 00 	movabs $0x801cbe,%rax
  80459e:	00 00 00 
  8045a1:	ff d0                	callq  *%rax
  8045a3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8045a6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8045aa:	79 05                	jns    8045b1 <opencons+0x54>
  8045ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8045af:	eb 30                	jmp    8045e1 <opencons+0x84>
  8045b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045b5:	48 ba 20 71 80 00 00 	movabs $0x807120,%rdx
  8045bc:	00 00 00 
  8045bf:	8b 12                	mov    (%rdx),%edx
  8045c1:	89 10                	mov    %edx,(%rax)
  8045c3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045c7:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  8045ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045d2:	48 89 c7             	mov    %rax,%rdi
  8045d5:	48 b8 99 23 80 00 00 	movabs $0x802399,%rax
  8045dc:	00 00 00 
  8045df:	ff d0                	callq  *%rax
  8045e1:	c9                   	leaveq 
  8045e2:	c3                   	retq   

00000000008045e3 <devcons_read>:
  8045e3:	55                   	push   %rbp
  8045e4:	48 89 e5             	mov    %rsp,%rbp
  8045e7:	48 83 ec 30          	sub    $0x30,%rsp
  8045eb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8045ef:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8045f3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8045f7:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8045fc:	75 13                	jne    804611 <devcons_read+0x2e>
  8045fe:	b8 00 00 00 00       	mov    $0x0,%eax
  804603:	eb 49                	jmp    80464e <devcons_read+0x6b>
  804605:	48 b8 81 1c 80 00 00 	movabs $0x801c81,%rax
  80460c:	00 00 00 
  80460f:	ff d0                	callq  *%rax
  804611:	48 b8 c3 1b 80 00 00 	movabs $0x801bc3,%rax
  804618:	00 00 00 
  80461b:	ff d0                	callq  *%rax
  80461d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804620:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804624:	74 df                	je     804605 <devcons_read+0x22>
  804626:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80462a:	79 05                	jns    804631 <devcons_read+0x4e>
  80462c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80462f:	eb 1d                	jmp    80464e <devcons_read+0x6b>
  804631:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  804635:	75 07                	jne    80463e <devcons_read+0x5b>
  804637:	b8 00 00 00 00       	mov    $0x0,%eax
  80463c:	eb 10                	jmp    80464e <devcons_read+0x6b>
  80463e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804641:	89 c2                	mov    %eax,%edx
  804643:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804647:	88 10                	mov    %dl,(%rax)
  804649:	b8 01 00 00 00       	mov    $0x1,%eax
  80464e:	c9                   	leaveq 
  80464f:	c3                   	retq   

0000000000804650 <devcons_write>:
  804650:	55                   	push   %rbp
  804651:	48 89 e5             	mov    %rsp,%rbp
  804654:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  80465b:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  804662:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  804669:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  804670:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804677:	eb 76                	jmp    8046ef <devcons_write+0x9f>
  804679:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  804680:	89 c2                	mov    %eax,%edx
  804682:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804685:	29 c2                	sub    %eax,%edx
  804687:	89 d0                	mov    %edx,%eax
  804689:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80468c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80468f:	83 f8 7f             	cmp    $0x7f,%eax
  804692:	76 07                	jbe    80469b <devcons_write+0x4b>
  804694:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  80469b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80469e:	48 63 d0             	movslq %eax,%rdx
  8046a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046a4:	48 63 c8             	movslq %eax,%rcx
  8046a7:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  8046ae:	48 01 c1             	add    %rax,%rcx
  8046b1:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8046b8:	48 89 ce             	mov    %rcx,%rsi
  8046bb:	48 89 c7             	mov    %rax,%rdi
  8046be:	48 b8 b3 16 80 00 00 	movabs $0x8016b3,%rax
  8046c5:	00 00 00 
  8046c8:	ff d0                	callq  *%rax
  8046ca:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046cd:	48 63 d0             	movslq %eax,%rdx
  8046d0:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  8046d7:	48 89 d6             	mov    %rdx,%rsi
  8046da:	48 89 c7             	mov    %rax,%rdi
  8046dd:	48 b8 76 1b 80 00 00 	movabs $0x801b76,%rax
  8046e4:	00 00 00 
  8046e7:	ff d0                	callq  *%rax
  8046e9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8046ec:	01 45 fc             	add    %eax,-0x4(%rbp)
  8046ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046f2:	48 98                	cltq   
  8046f4:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  8046fb:	0f 82 78 ff ff ff    	jb     804679 <devcons_write+0x29>
  804701:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804704:	c9                   	leaveq 
  804705:	c3                   	retq   

0000000000804706 <devcons_close>:
  804706:	55                   	push   %rbp
  804707:	48 89 e5             	mov    %rsp,%rbp
  80470a:	48 83 ec 08          	sub    $0x8,%rsp
  80470e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804712:	b8 00 00 00 00       	mov    $0x0,%eax
  804717:	c9                   	leaveq 
  804718:	c3                   	retq   

0000000000804719 <devcons_stat>:
  804719:	55                   	push   %rbp
  80471a:	48 89 e5             	mov    %rsp,%rbp
  80471d:	48 83 ec 10          	sub    $0x10,%rsp
  804721:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804725:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804729:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80472d:	48 be 7a 51 80 00 00 	movabs $0x80517a,%rsi
  804734:	00 00 00 
  804737:	48 89 c7             	mov    %rax,%rdi
  80473a:	48 b8 8e 13 80 00 00 	movabs $0x80138e,%rax
  804741:	00 00 00 
  804744:	ff d0                	callq  *%rax
  804746:	b8 00 00 00 00       	mov    $0x0,%eax
  80474b:	c9                   	leaveq 
  80474c:	c3                   	retq   

000000000080474d <ipc_recv>:
  80474d:	55                   	push   %rbp
  80474e:	48 89 e5             	mov    %rsp,%rbp
  804751:	48 83 ec 30          	sub    $0x30,%rsp
  804755:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804759:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80475d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804761:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804766:	75 0e                	jne    804776 <ipc_recv+0x29>
  804768:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80476f:	00 00 00 
  804772:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804776:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80477a:	48 89 c7             	mov    %rax,%rdi
  80477d:	48 b8 f8 1e 80 00 00 	movabs $0x801ef8,%rax
  804784:	00 00 00 
  804787:	ff d0                	callq  *%rax
  804789:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80478c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804790:	79 27                	jns    8047b9 <ipc_recv+0x6c>
  804792:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804797:	74 0a                	je     8047a3 <ipc_recv+0x56>
  804799:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80479d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8047a3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8047a8:	74 0a                	je     8047b4 <ipc_recv+0x67>
  8047aa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047ae:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8047b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8047b7:	eb 53                	jmp    80480c <ipc_recv+0xbf>
  8047b9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8047be:	74 19                	je     8047d9 <ipc_recv+0x8c>
  8047c0:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8047c7:	00 00 00 
  8047ca:	48 8b 00             	mov    (%rax),%rax
  8047cd:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  8047d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8047d7:	89 10                	mov    %edx,(%rax)
  8047d9:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8047de:	74 19                	je     8047f9 <ipc_recv+0xac>
  8047e0:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  8047e7:	00 00 00 
  8047ea:	48 8b 00             	mov    (%rax),%rax
  8047ed:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  8047f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047f7:	89 10                	mov    %edx,(%rax)
  8047f9:	48 b8 20 84 80 00 00 	movabs $0x808420,%rax
  804800:	00 00 00 
  804803:	48 8b 00             	mov    (%rax),%rax
  804806:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  80480c:	c9                   	leaveq 
  80480d:	c3                   	retq   

000000000080480e <ipc_send>:
  80480e:	55                   	push   %rbp
  80480f:	48 89 e5             	mov    %rsp,%rbp
  804812:	48 83 ec 30          	sub    $0x30,%rsp
  804816:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804819:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80481c:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804820:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804823:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804828:	75 1c                	jne    804846 <ipc_send+0x38>
  80482a:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804831:	00 00 00 
  804834:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804838:	eb 0c                	jmp    804846 <ipc_send+0x38>
  80483a:	48 b8 81 1c 80 00 00 	movabs $0x801c81,%rax
  804841:	00 00 00 
  804844:	ff d0                	callq  *%rax
  804846:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804849:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  80484c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804850:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804853:	89 c7                	mov    %eax,%edi
  804855:	48 b8 a1 1e 80 00 00 	movabs $0x801ea1,%rax
  80485c:	00 00 00 
  80485f:	ff d0                	callq  *%rax
  804861:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804864:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804868:	74 d0                	je     80483a <ipc_send+0x2c>
  80486a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80486e:	79 30                	jns    8048a0 <ipc_send+0x92>
  804870:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804873:	89 c1                	mov    %eax,%ecx
  804875:	48 ba 88 51 80 00 00 	movabs $0x805188,%rdx
  80487c:	00 00 00 
  80487f:	be 44 00 00 00       	mov    $0x44,%esi
  804884:	48 bf 9e 51 80 00 00 	movabs $0x80519e,%rdi
  80488b:	00 00 00 
  80488e:	b8 00 00 00 00       	mov    $0x0,%eax
  804893:	49 b8 c4 05 80 00 00 	movabs $0x8005c4,%r8
  80489a:	00 00 00 
  80489d:	41 ff d0             	callq  *%r8
  8048a0:	90                   	nop
  8048a1:	c9                   	leaveq 
  8048a2:	c3                   	retq   

00000000008048a3 <ipc_host_recv>:
  8048a3:	55                   	push   %rbp
  8048a4:	48 89 e5             	mov    %rsp,%rbp
  8048a7:	48 83 ec 10          	sub    $0x10,%rsp
  8048ab:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8048af:	48 ba b0 51 80 00 00 	movabs $0x8051b0,%rdx
  8048b6:	00 00 00 
  8048b9:	be 4e 00 00 00       	mov    $0x4e,%esi
  8048be:	48 bf 9e 51 80 00 00 	movabs $0x80519e,%rdi
  8048c5:	00 00 00 
  8048c8:	b8 00 00 00 00       	mov    $0x0,%eax
  8048cd:	48 b9 c4 05 80 00 00 	movabs $0x8005c4,%rcx
  8048d4:	00 00 00 
  8048d7:	ff d1                	callq  *%rcx

00000000008048d9 <ipc_host_send>:
  8048d9:	55                   	push   %rbp
  8048da:	48 89 e5             	mov    %rsp,%rbp
  8048dd:	48 83 ec 20          	sub    $0x20,%rsp
  8048e1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8048e4:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8048e7:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  8048eb:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8048ee:	48 ba d0 51 80 00 00 	movabs $0x8051d0,%rdx
  8048f5:	00 00 00 
  8048f8:	be 58 00 00 00       	mov    $0x58,%esi
  8048fd:	48 bf 9e 51 80 00 00 	movabs $0x80519e,%rdi
  804904:	00 00 00 
  804907:	b8 00 00 00 00       	mov    $0x0,%eax
  80490c:	48 b9 c4 05 80 00 00 	movabs $0x8005c4,%rcx
  804913:	00 00 00 
  804916:	ff d1                	callq  *%rcx

0000000000804918 <ipc_find_env>:
  804918:	55                   	push   %rbp
  804919:	48 89 e5             	mov    %rsp,%rbp
  80491c:	48 83 ec 18          	sub    $0x18,%rsp
  804920:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804923:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80492a:	eb 4d                	jmp    804979 <ipc_find_env+0x61>
  80492c:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804933:	00 00 00 
  804936:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804939:	48 98                	cltq   
  80493b:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804942:	48 01 d0             	add    %rdx,%rax
  804945:	48 05 d0 00 00 00    	add    $0xd0,%rax
  80494b:	8b 00                	mov    (%rax),%eax
  80494d:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804950:	75 23                	jne    804975 <ipc_find_env+0x5d>
  804952:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804959:	00 00 00 
  80495c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80495f:	48 98                	cltq   
  804961:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804968:	48 01 d0             	add    %rdx,%rax
  80496b:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804971:	8b 00                	mov    (%rax),%eax
  804973:	eb 12                	jmp    804987 <ipc_find_env+0x6f>
  804975:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804979:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804980:	7e aa                	jle    80492c <ipc_find_env+0x14>
  804982:	b8 00 00 00 00       	mov    $0x0,%eax
  804987:	c9                   	leaveq 
  804988:	c3                   	retq   

0000000000804989 <pageref>:
  804989:	55                   	push   %rbp
  80498a:	48 89 e5             	mov    %rsp,%rbp
  80498d:	48 83 ec 18          	sub    $0x18,%rsp
  804991:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804995:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804999:	48 c1 e8 15          	shr    $0x15,%rax
  80499d:	48 89 c2             	mov    %rax,%rdx
  8049a0:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8049a7:	01 00 00 
  8049aa:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8049ae:	83 e0 01             	and    $0x1,%eax
  8049b1:	48 85 c0             	test   %rax,%rax
  8049b4:	75 07                	jne    8049bd <pageref+0x34>
  8049b6:	b8 00 00 00 00       	mov    $0x0,%eax
  8049bb:	eb 56                	jmp    804a13 <pageref+0x8a>
  8049bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8049c1:	48 c1 e8 0c          	shr    $0xc,%rax
  8049c5:	48 89 c2             	mov    %rax,%rdx
  8049c8:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8049cf:	01 00 00 
  8049d2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8049d6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8049da:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049de:	83 e0 01             	and    $0x1,%eax
  8049e1:	48 85 c0             	test   %rax,%rax
  8049e4:	75 07                	jne    8049ed <pageref+0x64>
  8049e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8049eb:	eb 26                	jmp    804a13 <pageref+0x8a>
  8049ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049f1:	48 c1 e8 0c          	shr    $0xc,%rax
  8049f5:	48 89 c2             	mov    %rax,%rdx
  8049f8:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  8049ff:	00 00 00 
  804a02:	48 c1 e2 04          	shl    $0x4,%rdx
  804a06:	48 01 d0             	add    %rdx,%rax
  804a09:	48 83 c0 08          	add    $0x8,%rax
  804a0d:	0f b7 00             	movzwl (%rax),%eax
  804a10:	0f b7 c0             	movzwl %ax,%eax
  804a13:	c9                   	leaveq 
  804a14:	c3                   	retq   
