
vmm/guest/obj/user/init:     file format elf64-x86-64


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
  80003c:	e8 69 06 00 00       	callq  8006aa <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <sum>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 20          	sub    $0x20,%rsp
  80004b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80004f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800052:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
  800059:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800060:	eb 1e                	jmp    800080 <sum+0x3d>
  800062:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800065:	48 63 d0             	movslq %eax,%rdx
  800068:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80006c:	48 01 d0             	add    %rdx,%rax
  80006f:	0f b6 00             	movzbl (%rax),%eax
  800072:	0f be c0             	movsbl %al,%eax
  800075:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  800079:	31 45 f8             	xor    %eax,-0x8(%rbp)
  80007c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  800080:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800083:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  800086:	7c da                	jl     800062 <sum+0x1f>
  800088:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80008b:	c9                   	leaveq 
  80008c:	c3                   	retq   

000000000080008d <umain>:
  80008d:	55                   	push   %rbp
  80008e:	48 89 e5             	mov    %rsp,%rbp
  800091:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
  800098:	89 bd ec fe ff ff    	mov    %edi,-0x114(%rbp)
  80009e:	48 89 b5 e0 fe ff ff 	mov    %rsi,-0x120(%rbp)
  8000a5:	48 bf 20 4f 80 00 00 	movabs $0x804f20,%rdi
  8000ac:	00 00 00 
  8000af:	b8 00 00 00 00       	mov    $0x0,%eax
  8000b4:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8000bb:	00 00 00 
  8000be:	ff d2                	callq  *%rdx
  8000c0:	c7 45 f8 9e 98 0f 00 	movl   $0xf989e,-0x8(%rbp)
  8000c7:	be 70 17 00 00       	mov    $0x1770,%esi
  8000cc:	48 bf 00 70 80 00 00 	movabs $0x807000,%rdi
  8000d3:	00 00 00 
  8000d6:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8000dd:	00 00 00 
  8000e0:	ff d0                	callq  *%rax
  8000e2:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8000e5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8000e8:	3b 45 f8             	cmp    -0x8(%rbp),%eax
  8000eb:	74 25                	je     800112 <umain+0x85>
  8000ed:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8000f0:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8000f3:	89 c6                	mov    %eax,%esi
  8000f5:	48 bf 30 4f 80 00 00 	movabs $0x804f30,%rdi
  8000fc:	00 00 00 
  8000ff:	b8 00 00 00 00       	mov    $0x0,%eax
  800104:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  80010b:	00 00 00 
  80010e:	ff d1                	callq  *%rcx
  800110:	eb 1b                	jmp    80012d <umain+0xa0>
  800112:	48 bf 69 4f 80 00 00 	movabs $0x804f69,%rdi
  800119:	00 00 00 
  80011c:	b8 00 00 00 00       	mov    $0x0,%eax
  800121:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  800128:	00 00 00 
  80012b:	ff d2                	callq  *%rdx
  80012d:	be 70 17 00 00       	mov    $0x1770,%esi
  800132:	48 bf 20 90 80 00 00 	movabs $0x809020,%rdi
  800139:	00 00 00 
  80013c:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800143:	00 00 00 
  800146:	ff d0                	callq  *%rax
  800148:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80014b:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  80014f:	74 22                	je     800173 <umain+0xe6>
  800151:	8b 45 f4             	mov    -0xc(%rbp),%eax
  800154:	89 c6                	mov    %eax,%esi
  800156:	48 bf 80 4f 80 00 00 	movabs $0x804f80,%rdi
  80015d:	00 00 00 
  800160:	b8 00 00 00 00       	mov    $0x0,%eax
  800165:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  80016c:	00 00 00 
  80016f:	ff d2                	callq  *%rdx
  800171:	eb 1b                	jmp    80018e <umain+0x101>
  800173:	48 bf af 4f 80 00 00 	movabs $0x804faf,%rdi
  80017a:	00 00 00 
  80017d:	b8 00 00 00 00       	mov    $0x0,%eax
  800182:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  800189:	00 00 00 
  80018c:	ff d2                	callq  *%rdx
  80018e:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800195:	48 be c5 4f 80 00 00 	movabs $0x804fc5,%rsi
  80019c:	00 00 00 
  80019f:	48 89 c7             	mov    %rax,%rdi
  8001a2:	48 b8 5f 15 80 00 00 	movabs $0x80155f,%rax
  8001a9:	00 00 00 
  8001ac:	ff d0                	callq  *%rax
  8001ae:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8001b5:	eb 77                	jmp    80022e <umain+0x1a1>
  8001b7:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8001be:	48 be d1 4f 80 00 00 	movabs $0x804fd1,%rsi
  8001c5:	00 00 00 
  8001c8:	48 89 c7             	mov    %rax,%rdi
  8001cb:	48 b8 5f 15 80 00 00 	movabs $0x80155f,%rax
  8001d2:	00 00 00 
  8001d5:	ff d0                	callq  *%rax
  8001d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8001da:	48 98                	cltq   
  8001dc:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8001e3:	00 
  8001e4:	48 8b 85 e0 fe ff ff 	mov    -0x120(%rbp),%rax
  8001eb:	48 01 d0             	add    %rdx,%rax
  8001ee:	48 8b 10             	mov    (%rax),%rdx
  8001f1:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8001f8:	48 89 d6             	mov    %rdx,%rsi
  8001fb:	48 89 c7             	mov    %rax,%rdi
  8001fe:	48 b8 5f 15 80 00 00 	movabs $0x80155f,%rax
  800205:	00 00 00 
  800208:	ff d0                	callq  *%rax
  80020a:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800211:	48 be d4 4f 80 00 00 	movabs $0x804fd4,%rsi
  800218:	00 00 00 
  80021b:	48 89 c7             	mov    %rax,%rdi
  80021e:	48 b8 5f 15 80 00 00 	movabs $0x80155f,%rax
  800225:	00 00 00 
  800228:	ff d0                	callq  *%rax
  80022a:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80022e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800231:	3b 85 ec fe ff ff    	cmp    -0x114(%rbp),%eax
  800237:	0f 8c 7a ff ff ff    	jl     8001b7 <umain+0x12a>
  80023d:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800244:	48 89 c6             	mov    %rax,%rsi
  800247:	48 bf d6 4f 80 00 00 	movabs $0x804fd6,%rdi
  80024e:	00 00 00 
  800251:	b8 00 00 00 00       	mov    $0x0,%eax
  800256:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  80025d:	00 00 00 
  800260:	ff d2                	callq  *%rdx
  800262:	48 bf da 4f 80 00 00 	movabs $0x804fda,%rdi
  800269:	00 00 00 
  80026c:	b8 00 00 00 00       	mov    $0x0,%eax
  800271:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  800278:	00 00 00 
  80027b:	ff d2                	callq  *%rdx
  80027d:	bf 00 00 00 00       	mov    $0x0,%edi
  800282:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  800289:	00 00 00 
  80028c:	ff d0                	callq  *%rax
  80028e:	48 b8 ba 04 80 00 00 	movabs $0x8004ba,%rax
  800295:	00 00 00 
  800298:	ff d0                	callq  *%rax
  80029a:	89 45 f0             	mov    %eax,-0x10(%rbp)
  80029d:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8002a1:	79 30                	jns    8002d3 <umain+0x246>
  8002a3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002a6:	89 c1                	mov    %eax,%ecx
  8002a8:	48 ba ec 4f 80 00 00 	movabs $0x804fec,%rdx
  8002af:	00 00 00 
  8002b2:	be 39 00 00 00       	mov    $0x39,%esi
  8002b7:	48 bf f9 4f 80 00 00 	movabs $0x804ff9,%rdi
  8002be:	00 00 00 
  8002c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8002c6:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  8002cd:	00 00 00 
  8002d0:	41 ff d0             	callq  *%r8
  8002d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8002d7:	74 30                	je     800309 <umain+0x27c>
  8002d9:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002dc:	89 c1                	mov    %eax,%ecx
  8002de:	48 ba 08 50 80 00 00 	movabs $0x805008,%rdx
  8002e5:	00 00 00 
  8002e8:	be 3b 00 00 00       	mov    $0x3b,%esi
  8002ed:	48 bf f9 4f 80 00 00 	movabs $0x804ff9,%rdi
  8002f4:	00 00 00 
  8002f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8002fc:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  800303:	00 00 00 
  800306:	41 ff d0             	callq  *%r8
  800309:	be 01 00 00 00       	mov    $0x1,%esi
  80030e:	bf 00 00 00 00       	mov    $0x0,%edi
  800313:	48 b8 ba 25 80 00 00 	movabs $0x8025ba,%rax
  80031a:	00 00 00 
  80031d:	ff d0                	callq  *%rax
  80031f:	89 45 f0             	mov    %eax,-0x10(%rbp)
  800322:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  800326:	79 30                	jns    800358 <umain+0x2cb>
  800328:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80032b:	89 c1                	mov    %eax,%ecx
  80032d:	48 ba 22 50 80 00 00 	movabs $0x805022,%rdx
  800334:	00 00 00 
  800337:	be 3d 00 00 00       	mov    $0x3d,%esi
  80033c:	48 bf f9 4f 80 00 00 	movabs $0x804ff9,%rdi
  800343:	00 00 00 
  800346:	b8 00 00 00 00       	mov    $0x0,%eax
  80034b:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  800352:	00 00 00 
  800355:	41 ff d0             	callq  *%r8
  800358:	48 bf 2a 50 80 00 00 	movabs $0x80502a,%rdi
  80035f:	00 00 00 
  800362:	b8 00 00 00 00       	mov    $0x0,%eax
  800367:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  80036e:	00 00 00 
  800371:	ff d2                	callq  *%rdx
  800373:	ba 00 00 00 00       	mov    $0x0,%edx
  800378:	48 be 3d 50 80 00 00 	movabs $0x80503d,%rsi
  80037f:	00 00 00 
  800382:	48 bf 40 50 80 00 00 	movabs $0x805040,%rdi
  800389:	00 00 00 
  80038c:	b8 00 00 00 00       	mov    $0x0,%eax
  800391:	48 b9 d3 35 80 00 00 	movabs $0x8035d3,%rcx
  800398:	00 00 00 
  80039b:	ff d1                	callq  *%rcx
  80039d:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8003a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8003a4:	79 22                	jns    8003c8 <umain+0x33b>
  8003a6:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8003a9:	89 c6                	mov    %eax,%esi
  8003ab:	48 bf 48 50 80 00 00 	movabs $0x805048,%rdi
  8003b2:	00 00 00 
  8003b5:	b8 00 00 00 00       	mov    $0x0,%eax
  8003ba:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8003c1:	00 00 00 
  8003c4:	ff d2                	callq  *%rdx
  8003c6:	eb 90                	jmp    800358 <umain+0x2cb>
  8003c8:	48 bf 5c 50 80 00 00 	movabs $0x80505c,%rdi
  8003cf:	00 00 00 
  8003d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d7:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8003de:	00 00 00 
  8003e1:	ff d2                	callq  *%rdx
  8003e3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8003e6:	89 c7                	mov    %eax,%edi
  8003e8:	48 b8 b0 4b 80 00 00 	movabs $0x804bb0,%rax
  8003ef:	00 00 00 
  8003f2:	ff d0                	callq  *%rax
  8003f4:	90                   	nop
  8003f5:	90                   	nop
  8003f6:	c9                   	leaveq 
  8003f7:	c3                   	retq   

00000000008003f8 <cputchar>:
  8003f8:	55                   	push   %rbp
  8003f9:	48 89 e5             	mov    %rsp,%rbp
  8003fc:	48 83 ec 20          	sub    $0x20,%rsp
  800400:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800403:	8b 45 ec             	mov    -0x14(%rbp),%eax
  800406:	88 45 ff             	mov    %al,-0x1(%rbp)
  800409:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  80040d:	be 01 00 00 00       	mov    $0x1,%esi
  800412:	48 89 c7             	mov    %rax,%rdi
  800415:	48 b8 04 1d 80 00 00 	movabs $0x801d04,%rax
  80041c:	00 00 00 
  80041f:	ff d0                	callq  *%rax
  800421:	90                   	nop
  800422:	c9                   	leaveq 
  800423:	c3                   	retq   

0000000000800424 <getchar>:
  800424:	55                   	push   %rbp
  800425:	48 89 e5             	mov    %rsp,%rbp
  800428:	48 83 ec 10          	sub    $0x10,%rsp
  80042c:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  800430:	ba 01 00 00 00       	mov    $0x1,%edx
  800435:	48 89 c6             	mov    %rax,%rsi
  800438:	bf 00 00 00 00       	mov    $0x0,%edi
  80043d:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  800444:	00 00 00 
  800447:	ff d0                	callq  *%rax
  800449:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80044c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800450:	79 05                	jns    800457 <getchar+0x33>
  800452:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800455:	eb 14                	jmp    80046b <getchar+0x47>
  800457:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80045b:	7f 07                	jg     800464 <getchar+0x40>
  80045d:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  800462:	eb 07                	jmp    80046b <getchar+0x47>
  800464:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  800468:	0f b6 c0             	movzbl %al,%eax
  80046b:	c9                   	leaveq 
  80046c:	c3                   	retq   

000000000080046d <iscons>:
  80046d:	55                   	push   %rbp
  80046e:	48 89 e5             	mov    %rsp,%rbp
  800471:	48 83 ec 20          	sub    $0x20,%rsp
  800475:	89 7d ec             	mov    %edi,-0x14(%rbp)
  800478:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80047c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80047f:	48 89 d6             	mov    %rdx,%rsi
  800482:	89 c7                	mov    %eax,%edi
  800484:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  80048b:	00 00 00 
  80048e:	ff d0                	callq  *%rax
  800490:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800493:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800497:	79 05                	jns    80049e <iscons+0x31>
  800499:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80049c:	eb 1a                	jmp    8004b8 <iscons+0x4b>
  80049e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004a2:	8b 10                	mov    (%rax),%edx
  8004a4:	48 b8 80 87 80 00 00 	movabs $0x808780,%rax
  8004ab:	00 00 00 
  8004ae:	8b 00                	mov    (%rax),%eax
  8004b0:	39 c2                	cmp    %eax,%edx
  8004b2:	0f 94 c0             	sete   %al
  8004b5:	0f b6 c0             	movzbl %al,%eax
  8004b8:	c9                   	leaveq 
  8004b9:	c3                   	retq   

00000000008004ba <opencons>:
  8004ba:	55                   	push   %rbp
  8004bb:	48 89 e5             	mov    %rsp,%rbp
  8004be:	48 83 ec 10          	sub    $0x10,%rsp
  8004c2:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8004c6:	48 89 c7             	mov    %rax,%rdi
  8004c9:	48 b8 96 22 80 00 00 	movabs $0x802296,%rax
  8004d0:	00 00 00 
  8004d3:	ff d0                	callq  *%rax
  8004d5:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8004d8:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8004dc:	79 05                	jns    8004e3 <opencons+0x29>
  8004de:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8004e1:	eb 5b                	jmp    80053e <opencons+0x84>
  8004e3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8004e7:	ba 07 04 00 00       	mov    $0x407,%edx
  8004ec:	48 89 c6             	mov    %rax,%rsi
  8004ef:	bf 00 00 00 00       	mov    $0x0,%edi
  8004f4:	48 b8 4c 1e 80 00 00 	movabs $0x801e4c,%rax
  8004fb:	00 00 00 
  8004fe:	ff d0                	callq  *%rax
  800500:	89 45 fc             	mov    %eax,-0x4(%rbp)
  800503:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800507:	79 05                	jns    80050e <opencons+0x54>
  800509:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80050c:	eb 30                	jmp    80053e <opencons+0x84>
  80050e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800512:	48 ba 80 87 80 00 00 	movabs $0x808780,%rdx
  800519:	00 00 00 
  80051c:	8b 12                	mov    (%rdx),%edx
  80051e:	89 10                	mov    %edx,(%rax)
  800520:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800524:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  80052b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80052f:	48 89 c7             	mov    %rax,%rdi
  800532:	48 b8 48 22 80 00 00 	movabs $0x802248,%rax
  800539:	00 00 00 
  80053c:	ff d0                	callq  *%rax
  80053e:	c9                   	leaveq 
  80053f:	c3                   	retq   

0000000000800540 <devcons_read>:
  800540:	55                   	push   %rbp
  800541:	48 89 e5             	mov    %rsp,%rbp
  800544:	48 83 ec 30          	sub    $0x30,%rsp
  800548:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80054c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  800550:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  800554:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  800559:	75 13                	jne    80056e <devcons_read+0x2e>
  80055b:	b8 00 00 00 00       	mov    $0x0,%eax
  800560:	eb 49                	jmp    8005ab <devcons_read+0x6b>
  800562:	48 b8 0f 1e 80 00 00 	movabs $0x801e0f,%rax
  800569:	00 00 00 
  80056c:	ff d0                	callq  *%rax
  80056e:	48 b8 51 1d 80 00 00 	movabs $0x801d51,%rax
  800575:	00 00 00 
  800578:	ff d0                	callq  *%rax
  80057a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80057d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800581:	74 df                	je     800562 <devcons_read+0x22>
  800583:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800587:	79 05                	jns    80058e <devcons_read+0x4e>
  800589:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80058c:	eb 1d                	jmp    8005ab <devcons_read+0x6b>
  80058e:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  800592:	75 07                	jne    80059b <devcons_read+0x5b>
  800594:	b8 00 00 00 00       	mov    $0x0,%eax
  800599:	eb 10                	jmp    8005ab <devcons_read+0x6b>
  80059b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80059e:	89 c2                	mov    %eax,%edx
  8005a0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8005a4:	88 10                	mov    %dl,(%rax)
  8005a6:	b8 01 00 00 00       	mov    $0x1,%eax
  8005ab:	c9                   	leaveq 
  8005ac:	c3                   	retq   

00000000008005ad <devcons_write>:
  8005ad:	55                   	push   %rbp
  8005ae:	48 89 e5             	mov    %rsp,%rbp
  8005b1:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  8005b8:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  8005bf:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  8005c6:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  8005cd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8005d4:	eb 76                	jmp    80064c <devcons_write+0x9f>
  8005d6:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  8005dd:	89 c2                	mov    %eax,%edx
  8005df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8005e2:	29 c2                	sub    %eax,%edx
  8005e4:	89 d0                	mov    %edx,%eax
  8005e6:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8005e9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8005ec:	83 f8 7f             	cmp    $0x7f,%eax
  8005ef:	76 07                	jbe    8005f8 <devcons_write+0x4b>
  8005f1:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  8005f8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8005fb:	48 63 d0             	movslq %eax,%rdx
  8005fe:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800601:	48 63 c8             	movslq %eax,%rcx
  800604:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  80060b:	48 01 c1             	add    %rax,%rcx
  80060e:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  800615:	48 89 ce             	mov    %rcx,%rsi
  800618:	48 89 c7             	mov    %rax,%rdi
  80061b:	48 b8 41 18 80 00 00 	movabs $0x801841,%rax
  800622:	00 00 00 
  800625:	ff d0                	callq  *%rax
  800627:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80062a:	48 63 d0             	movslq %eax,%rdx
  80062d:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  800634:	48 89 d6             	mov    %rdx,%rsi
  800637:	48 89 c7             	mov    %rax,%rdi
  80063a:	48 b8 04 1d 80 00 00 	movabs $0x801d04,%rax
  800641:	00 00 00 
  800644:	ff d0                	callq  *%rax
  800646:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800649:	01 45 fc             	add    %eax,-0x4(%rbp)
  80064c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80064f:	48 98                	cltq   
  800651:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  800658:	0f 82 78 ff ff ff    	jb     8005d6 <devcons_write+0x29>
  80065e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800661:	c9                   	leaveq 
  800662:	c3                   	retq   

0000000000800663 <devcons_close>:
  800663:	55                   	push   %rbp
  800664:	48 89 e5             	mov    %rsp,%rbp
  800667:	48 83 ec 08          	sub    $0x8,%rsp
  80066b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80066f:	b8 00 00 00 00       	mov    $0x0,%eax
  800674:	c9                   	leaveq 
  800675:	c3                   	retq   

0000000000800676 <devcons_stat>:
  800676:	55                   	push   %rbp
  800677:	48 89 e5             	mov    %rsp,%rbp
  80067a:	48 83 ec 10          	sub    $0x10,%rsp
  80067e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800682:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800686:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80068a:	48 be 6f 50 80 00 00 	movabs $0x80506f,%rsi
  800691:	00 00 00 
  800694:	48 89 c7             	mov    %rax,%rdi
  800697:	48 b8 1c 15 80 00 00 	movabs $0x80151c,%rax
  80069e:	00 00 00 
  8006a1:	ff d0                	callq  *%rax
  8006a3:	b8 00 00 00 00       	mov    $0x0,%eax
  8006a8:	c9                   	leaveq 
  8006a9:	c3                   	retq   

00000000008006aa <libmain>:
  8006aa:	55                   	push   %rbp
  8006ab:	48 89 e5             	mov    %rsp,%rbp
  8006ae:	48 83 ec 10          	sub    $0x10,%rsp
  8006b2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8006b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8006b9:	48 b8 d3 1d 80 00 00 	movabs $0x801dd3,%rax
  8006c0:	00 00 00 
  8006c3:	ff d0                	callq  *%rax
  8006c5:	25 ff 03 00 00       	and    $0x3ff,%eax
  8006ca:	48 98                	cltq   
  8006cc:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  8006d3:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  8006da:	00 00 00 
  8006dd:	48 01 c2             	add    %rax,%rdx
  8006e0:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  8006e7:	00 00 00 
  8006ea:	48 89 10             	mov    %rdx,(%rax)
  8006ed:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8006f1:	7e 14                	jle    800707 <libmain+0x5d>
  8006f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8006f7:	48 8b 10             	mov    (%rax),%rdx
  8006fa:	48 b8 b8 87 80 00 00 	movabs $0x8087b8,%rax
  800701:	00 00 00 
  800704:	48 89 10             	mov    %rdx,(%rax)
  800707:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80070b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80070e:	48 89 d6             	mov    %rdx,%rsi
  800711:	89 c7                	mov    %eax,%edi
  800713:	48 b8 8d 00 80 00 00 	movabs $0x80008d,%rax
  80071a:	00 00 00 
  80071d:	ff d0                	callq  *%rax
  80071f:	48 b8 2e 07 80 00 00 	movabs $0x80072e,%rax
  800726:	00 00 00 
  800729:	ff d0                	callq  *%rax
  80072b:	90                   	nop
  80072c:	c9                   	leaveq 
  80072d:	c3                   	retq   

000000000080072e <exit>:
  80072e:	55                   	push   %rbp
  80072f:	48 89 e5             	mov    %rsp,%rbp
  800732:	48 b8 8b 25 80 00 00 	movabs $0x80258b,%rax
  800739:	00 00 00 
  80073c:	ff d0                	callq  *%rax
  80073e:	bf 00 00 00 00       	mov    $0x0,%edi
  800743:	48 b8 8d 1d 80 00 00 	movabs $0x801d8d,%rax
  80074a:	00 00 00 
  80074d:	ff d0                	callq  *%rax
  80074f:	90                   	nop
  800750:	5d                   	pop    %rbp
  800751:	c3                   	retq   

0000000000800752 <_panic>:
  800752:	55                   	push   %rbp
  800753:	48 89 e5             	mov    %rsp,%rbp
  800756:	53                   	push   %rbx
  800757:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  80075e:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  800765:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  80076b:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  800772:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  800779:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  800780:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  800787:	84 c0                	test   %al,%al
  800789:	74 23                	je     8007ae <_panic+0x5c>
  80078b:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  800792:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  800796:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  80079a:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  80079e:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  8007a2:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  8007a6:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  8007aa:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  8007ae:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  8007b5:	00 00 00 
  8007b8:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  8007bf:	00 00 00 
  8007c2:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8007c6:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  8007cd:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  8007d4:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  8007db:	48 b8 b8 87 80 00 00 	movabs $0x8087b8,%rax
  8007e2:	00 00 00 
  8007e5:	48 8b 18             	mov    (%rax),%rbx
  8007e8:	48 b8 d3 1d 80 00 00 	movabs $0x801dd3,%rax
  8007ef:	00 00 00 
  8007f2:	ff d0                	callq  *%rax
  8007f4:	89 c6                	mov    %eax,%esi
  8007f6:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  8007fc:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  800803:	41 89 d0             	mov    %edx,%r8d
  800806:	48 89 c1             	mov    %rax,%rcx
  800809:	48 89 da             	mov    %rbx,%rdx
  80080c:	48 bf 80 50 80 00 00 	movabs $0x805080,%rdi
  800813:	00 00 00 
  800816:	b8 00 00 00 00       	mov    $0x0,%eax
  80081b:	49 b9 8c 09 80 00 00 	movabs $0x80098c,%r9
  800822:	00 00 00 
  800825:	41 ff d1             	callq  *%r9
  800828:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  80082f:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800836:	48 89 d6             	mov    %rdx,%rsi
  800839:	48 89 c7             	mov    %rax,%rdi
  80083c:	48 b8 e0 08 80 00 00 	movabs $0x8008e0,%rax
  800843:	00 00 00 
  800846:	ff d0                	callq  *%rax
  800848:	48 bf a3 50 80 00 00 	movabs $0x8050a3,%rdi
  80084f:	00 00 00 
  800852:	b8 00 00 00 00       	mov    $0x0,%eax
  800857:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  80085e:	00 00 00 
  800861:	ff d2                	callq  *%rdx
  800863:	cc                   	int3   
  800864:	eb fd                	jmp    800863 <_panic+0x111>

0000000000800866 <putch>:
  800866:	55                   	push   %rbp
  800867:	48 89 e5             	mov    %rsp,%rbp
  80086a:	48 83 ec 10          	sub    $0x10,%rsp
  80086e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800871:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800875:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800879:	8b 00                	mov    (%rax),%eax
  80087b:	8d 48 01             	lea    0x1(%rax),%ecx
  80087e:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800882:	89 0a                	mov    %ecx,(%rdx)
  800884:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800887:	89 d1                	mov    %edx,%ecx
  800889:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80088d:	48 98                	cltq   
  80088f:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  800893:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800897:	8b 00                	mov    (%rax),%eax
  800899:	3d ff 00 00 00       	cmp    $0xff,%eax
  80089e:	75 2c                	jne    8008cc <putch+0x66>
  8008a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008a4:	8b 00                	mov    (%rax),%eax
  8008a6:	48 98                	cltq   
  8008a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8008ac:	48 83 c2 08          	add    $0x8,%rdx
  8008b0:	48 89 c6             	mov    %rax,%rsi
  8008b3:	48 89 d7             	mov    %rdx,%rdi
  8008b6:	48 b8 04 1d 80 00 00 	movabs $0x801d04,%rax
  8008bd:	00 00 00 
  8008c0:	ff d0                	callq  *%rax
  8008c2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008c6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  8008cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008d0:	8b 40 04             	mov    0x4(%rax),%eax
  8008d3:	8d 50 01             	lea    0x1(%rax),%edx
  8008d6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8008da:	89 50 04             	mov    %edx,0x4(%rax)
  8008dd:	90                   	nop
  8008de:	c9                   	leaveq 
  8008df:	c3                   	retq   

00000000008008e0 <vcprintf>:
  8008e0:	55                   	push   %rbp
  8008e1:	48 89 e5             	mov    %rsp,%rbp
  8008e4:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  8008eb:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  8008f2:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  8008f9:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  800900:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800907:	48 8b 0a             	mov    (%rdx),%rcx
  80090a:	48 89 08             	mov    %rcx,(%rax)
  80090d:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800911:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800915:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800919:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80091d:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800924:	00 00 00 
  800927:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80092e:	00 00 00 
  800931:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800938:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80093f:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  800946:	48 89 c6             	mov    %rax,%rsi
  800949:	48 bf 66 08 80 00 00 	movabs $0x800866,%rdi
  800950:	00 00 00 
  800953:	48 b8 2a 0d 80 00 00 	movabs $0x800d2a,%rax
  80095a:	00 00 00 
  80095d:	ff d0                	callq  *%rax
  80095f:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  800965:	48 98                	cltq   
  800967:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  80096e:	48 83 c2 08          	add    $0x8,%rdx
  800972:	48 89 c6             	mov    %rax,%rsi
  800975:	48 89 d7             	mov    %rdx,%rdi
  800978:	48 b8 04 1d 80 00 00 	movabs $0x801d04,%rax
  80097f:	00 00 00 
  800982:	ff d0                	callq  *%rax
  800984:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  80098a:	c9                   	leaveq 
  80098b:	c3                   	retq   

000000000080098c <cprintf>:
  80098c:	55                   	push   %rbp
  80098d:	48 89 e5             	mov    %rsp,%rbp
  800990:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  800997:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  80099e:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  8009a5:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  8009ac:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8009b3:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8009ba:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  8009c1:	84 c0                	test   %al,%al
  8009c3:	74 20                	je     8009e5 <cprintf+0x59>
  8009c5:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  8009c9:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  8009cd:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  8009d1:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  8009d5:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  8009d9:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  8009dd:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  8009e1:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  8009e5:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  8009ec:	00 00 00 
  8009ef:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  8009f6:	00 00 00 
  8009f9:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8009fd:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800a04:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800a0b:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800a12:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800a19:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800a20:	48 8b 0a             	mov    (%rdx),%rcx
  800a23:	48 89 08             	mov    %rcx,(%rax)
  800a26:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800a2a:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800a2e:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800a32:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800a36:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  800a3d:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800a44:	48 89 d6             	mov    %rdx,%rsi
  800a47:	48 89 c7             	mov    %rax,%rdi
  800a4a:	48 b8 e0 08 80 00 00 	movabs $0x8008e0,%rax
  800a51:	00 00 00 
  800a54:	ff d0                	callq  *%rax
  800a56:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  800a5c:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  800a62:	c9                   	leaveq 
  800a63:	c3                   	retq   

0000000000800a64 <printnum>:
  800a64:	55                   	push   %rbp
  800a65:	48 89 e5             	mov    %rsp,%rbp
  800a68:	48 83 ec 30          	sub    $0x30,%rsp
  800a6c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  800a70:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800a74:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  800a78:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  800a7b:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  800a7f:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  800a83:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  800a86:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  800a8a:	77 54                	ja     800ae0 <printnum+0x7c>
  800a8c:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800a8f:	8d 78 ff             	lea    -0x1(%rax),%edi
  800a92:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  800a95:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800a99:	ba 00 00 00 00       	mov    $0x0,%edx
  800a9e:	48 f7 f6             	div    %rsi
  800aa1:	49 89 c2             	mov    %rax,%r10
  800aa4:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800aa7:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800aaa:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  800aae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800ab2:	41 89 c9             	mov    %ecx,%r9d
  800ab5:	41 89 f8             	mov    %edi,%r8d
  800ab8:	89 d1                	mov    %edx,%ecx
  800aba:	4c 89 d2             	mov    %r10,%rdx
  800abd:	48 89 c7             	mov    %rax,%rdi
  800ac0:	48 b8 64 0a 80 00 00 	movabs $0x800a64,%rax
  800ac7:	00 00 00 
  800aca:	ff d0                	callq  *%rax
  800acc:	eb 1c                	jmp    800aea <printnum+0x86>
  800ace:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800ad2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800ad5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800ad9:	48 89 ce             	mov    %rcx,%rsi
  800adc:	89 d7                	mov    %edx,%edi
  800ade:	ff d0                	callq  *%rax
  800ae0:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800ae4:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800ae8:	7f e4                	jg     800ace <printnum+0x6a>
  800aea:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800aed:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800af1:	ba 00 00 00 00       	mov    $0x0,%edx
  800af6:	48 f7 f1             	div    %rcx
  800af9:	48 b8 b0 52 80 00 00 	movabs $0x8052b0,%rax
  800b00:	00 00 00 
  800b03:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800b07:	0f be d0             	movsbl %al,%edx
  800b0a:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800b0e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800b12:	48 89 ce             	mov    %rcx,%rsi
  800b15:	89 d7                	mov    %edx,%edi
  800b17:	ff d0                	callq  *%rax
  800b19:	90                   	nop
  800b1a:	c9                   	leaveq 
  800b1b:	c3                   	retq   

0000000000800b1c <getuint>:
  800b1c:	55                   	push   %rbp
  800b1d:	48 89 e5             	mov    %rsp,%rbp
  800b20:	48 83 ec 20          	sub    $0x20,%rsp
  800b24:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800b28:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800b2b:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800b2f:	7e 4f                	jle    800b80 <getuint+0x64>
  800b31:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b35:	8b 00                	mov    (%rax),%eax
  800b37:	83 f8 30             	cmp    $0x30,%eax
  800b3a:	73 24                	jae    800b60 <getuint+0x44>
  800b3c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b40:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b48:	8b 00                	mov    (%rax),%eax
  800b4a:	89 c0                	mov    %eax,%eax
  800b4c:	48 01 d0             	add    %rdx,%rax
  800b4f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b53:	8b 12                	mov    (%rdx),%edx
  800b55:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800b58:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b5c:	89 0a                	mov    %ecx,(%rdx)
  800b5e:	eb 14                	jmp    800b74 <getuint+0x58>
  800b60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b64:	48 8b 40 08          	mov    0x8(%rax),%rax
  800b68:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800b6c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800b70:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800b74:	48 8b 00             	mov    (%rax),%rax
  800b77:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800b7b:	e9 9d 00 00 00       	jmpq   800c1d <getuint+0x101>
  800b80:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800b84:	74 4c                	je     800bd2 <getuint+0xb6>
  800b86:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b8a:	8b 00                	mov    (%rax),%eax
  800b8c:	83 f8 30             	cmp    $0x30,%eax
  800b8f:	73 24                	jae    800bb5 <getuint+0x99>
  800b91:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b95:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800b99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800b9d:	8b 00                	mov    (%rax),%eax
  800b9f:	89 c0                	mov    %eax,%eax
  800ba1:	48 01 d0             	add    %rdx,%rax
  800ba4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ba8:	8b 12                	mov    (%rdx),%edx
  800baa:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800bad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bb1:	89 0a                	mov    %ecx,(%rdx)
  800bb3:	eb 14                	jmp    800bc9 <getuint+0xad>
  800bb5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bb9:	48 8b 40 08          	mov    0x8(%rax),%rax
  800bbd:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800bc1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bc5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800bc9:	48 8b 00             	mov    (%rax),%rax
  800bcc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800bd0:	eb 4b                	jmp    800c1d <getuint+0x101>
  800bd2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800bd6:	8b 00                	mov    (%rax),%eax
  800bd8:	83 f8 30             	cmp    $0x30,%eax
  800bdb:	73 24                	jae    800c01 <getuint+0xe5>
  800bdd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800be1:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800be5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800be9:	8b 00                	mov    (%rax),%eax
  800beb:	89 c0                	mov    %eax,%eax
  800bed:	48 01 d0             	add    %rdx,%rax
  800bf0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bf4:	8b 12                	mov    (%rdx),%edx
  800bf6:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800bf9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800bfd:	89 0a                	mov    %ecx,(%rdx)
  800bff:	eb 14                	jmp    800c15 <getuint+0xf9>
  800c01:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c05:	48 8b 40 08          	mov    0x8(%rax),%rax
  800c09:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800c0d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c11:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800c15:	8b 00                	mov    (%rax),%eax
  800c17:	89 c0                	mov    %eax,%eax
  800c19:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800c1d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800c21:	c9                   	leaveq 
  800c22:	c3                   	retq   

0000000000800c23 <getint>:
  800c23:	55                   	push   %rbp
  800c24:	48 89 e5             	mov    %rsp,%rbp
  800c27:	48 83 ec 20          	sub    $0x20,%rsp
  800c2b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800c2f:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800c32:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800c36:	7e 4f                	jle    800c87 <getint+0x64>
  800c38:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c3c:	8b 00                	mov    (%rax),%eax
  800c3e:	83 f8 30             	cmp    $0x30,%eax
  800c41:	73 24                	jae    800c67 <getint+0x44>
  800c43:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c47:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800c4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c4f:	8b 00                	mov    (%rax),%eax
  800c51:	89 c0                	mov    %eax,%eax
  800c53:	48 01 d0             	add    %rdx,%rax
  800c56:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c5a:	8b 12                	mov    (%rdx),%edx
  800c5c:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800c5f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c63:	89 0a                	mov    %ecx,(%rdx)
  800c65:	eb 14                	jmp    800c7b <getint+0x58>
  800c67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c6b:	48 8b 40 08          	mov    0x8(%rax),%rax
  800c6f:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800c73:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800c77:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800c7b:	48 8b 00             	mov    (%rax),%rax
  800c7e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800c82:	e9 9d 00 00 00       	jmpq   800d24 <getint+0x101>
  800c87:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  800c8b:	74 4c                	je     800cd9 <getint+0xb6>
  800c8d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c91:	8b 00                	mov    (%rax),%eax
  800c93:	83 f8 30             	cmp    $0x30,%eax
  800c96:	73 24                	jae    800cbc <getint+0x99>
  800c98:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c9c:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800ca0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ca4:	8b 00                	mov    (%rax),%eax
  800ca6:	89 c0                	mov    %eax,%eax
  800ca8:	48 01 d0             	add    %rdx,%rax
  800cab:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800caf:	8b 12                	mov    (%rdx),%edx
  800cb1:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800cb4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cb8:	89 0a                	mov    %ecx,(%rdx)
  800cba:	eb 14                	jmp    800cd0 <getint+0xad>
  800cbc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cc0:	48 8b 40 08          	mov    0x8(%rax),%rax
  800cc4:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800cc8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800ccc:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800cd0:	48 8b 00             	mov    (%rax),%rax
  800cd3:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800cd7:	eb 4b                	jmp    800d24 <getint+0x101>
  800cd9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cdd:	8b 00                	mov    (%rax),%eax
  800cdf:	83 f8 30             	cmp    $0x30,%eax
  800ce2:	73 24                	jae    800d08 <getint+0xe5>
  800ce4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800ce8:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800cec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800cf0:	8b 00                	mov    (%rax),%eax
  800cf2:	89 c0                	mov    %eax,%eax
  800cf4:	48 01 d0             	add    %rdx,%rax
  800cf7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800cfb:	8b 12                	mov    (%rdx),%edx
  800cfd:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800d00:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d04:	89 0a                	mov    %ecx,(%rdx)
  800d06:	eb 14                	jmp    800d1c <getint+0xf9>
  800d08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800d0c:	48 8b 40 08          	mov    0x8(%rax),%rax
  800d10:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800d14:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d18:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800d1c:	8b 00                	mov    (%rax),%eax
  800d1e:	48 98                	cltq   
  800d20:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800d24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800d28:	c9                   	leaveq 
  800d29:	c3                   	retq   

0000000000800d2a <vprintfmt>:
  800d2a:	55                   	push   %rbp
  800d2b:	48 89 e5             	mov    %rsp,%rbp
  800d2e:	41 54                	push   %r12
  800d30:	53                   	push   %rbx
  800d31:	48 83 ec 60          	sub    $0x60,%rsp
  800d35:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800d39:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  800d3d:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800d41:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  800d45:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800d49:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  800d4d:	48 8b 0a             	mov    (%rdx),%rcx
  800d50:	48 89 08             	mov    %rcx,(%rax)
  800d53:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800d57:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800d5b:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800d5f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800d63:	eb 17                	jmp    800d7c <vprintfmt+0x52>
  800d65:	85 db                	test   %ebx,%ebx
  800d67:	0f 84 b9 04 00 00    	je     801226 <vprintfmt+0x4fc>
  800d6d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d71:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d75:	48 89 d6             	mov    %rdx,%rsi
  800d78:	89 df                	mov    %ebx,%edi
  800d7a:	ff d0                	callq  *%rax
  800d7c:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d80:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800d84:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800d88:	0f b6 00             	movzbl (%rax),%eax
  800d8b:	0f b6 d8             	movzbl %al,%ebx
  800d8e:	83 fb 25             	cmp    $0x25,%ebx
  800d91:	75 d2                	jne    800d65 <vprintfmt+0x3b>
  800d93:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  800d97:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  800d9e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800da5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800dac:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800db3:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800db7:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800dbb:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  800dbf:	0f b6 00             	movzbl (%rax),%eax
  800dc2:	0f b6 d8             	movzbl %al,%ebx
  800dc5:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800dc8:	83 f8 55             	cmp    $0x55,%eax
  800dcb:	0f 87 22 04 00 00    	ja     8011f3 <vprintfmt+0x4c9>
  800dd1:	89 c0                	mov    %eax,%eax
  800dd3:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800dda:	00 
  800ddb:	48 b8 d8 52 80 00 00 	movabs $0x8052d8,%rax
  800de2:	00 00 00 
  800de5:	48 01 d0             	add    %rdx,%rax
  800de8:	48 8b 00             	mov    (%rax),%rax
  800deb:	ff e0                	jmpq   *%rax
  800ded:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  800df1:	eb c0                	jmp    800db3 <vprintfmt+0x89>
  800df3:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800df7:	eb ba                	jmp    800db3 <vprintfmt+0x89>
  800df9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  800e00:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800e03:	89 d0                	mov    %edx,%eax
  800e05:	c1 e0 02             	shl    $0x2,%eax
  800e08:	01 d0                	add    %edx,%eax
  800e0a:	01 c0                	add    %eax,%eax
  800e0c:	01 d8                	add    %ebx,%eax
  800e0e:	83 e8 30             	sub    $0x30,%eax
  800e11:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800e14:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800e18:	0f b6 00             	movzbl (%rax),%eax
  800e1b:	0f be d8             	movsbl %al,%ebx
  800e1e:	83 fb 2f             	cmp    $0x2f,%ebx
  800e21:	7e 60                	jle    800e83 <vprintfmt+0x159>
  800e23:	83 fb 39             	cmp    $0x39,%ebx
  800e26:	7f 5b                	jg     800e83 <vprintfmt+0x159>
  800e28:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  800e2d:	eb d1                	jmp    800e00 <vprintfmt+0xd6>
  800e2f:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800e32:	83 f8 30             	cmp    $0x30,%eax
  800e35:	73 17                	jae    800e4e <vprintfmt+0x124>
  800e37:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800e3b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e3e:	89 d2                	mov    %edx,%edx
  800e40:	48 01 d0             	add    %rdx,%rax
  800e43:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800e46:	83 c2 08             	add    $0x8,%edx
  800e49:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800e4c:	eb 0c                	jmp    800e5a <vprintfmt+0x130>
  800e4e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800e52:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800e56:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800e5a:	8b 00                	mov    (%rax),%eax
  800e5c:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800e5f:	eb 23                	jmp    800e84 <vprintfmt+0x15a>
  800e61:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e65:	0f 89 48 ff ff ff    	jns    800db3 <vprintfmt+0x89>
  800e6b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  800e72:	e9 3c ff ff ff       	jmpq   800db3 <vprintfmt+0x89>
  800e77:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  800e7e:	e9 30 ff ff ff       	jmpq   800db3 <vprintfmt+0x89>
  800e83:	90                   	nop
  800e84:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800e88:	0f 89 25 ff ff ff    	jns    800db3 <vprintfmt+0x89>
  800e8e:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800e91:	89 45 dc             	mov    %eax,-0x24(%rbp)
  800e94:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800e9b:	e9 13 ff ff ff       	jmpq   800db3 <vprintfmt+0x89>
  800ea0:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800ea4:	e9 0a ff ff ff       	jmpq   800db3 <vprintfmt+0x89>
  800ea9:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800eac:	83 f8 30             	cmp    $0x30,%eax
  800eaf:	73 17                	jae    800ec8 <vprintfmt+0x19e>
  800eb1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800eb5:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800eb8:	89 d2                	mov    %edx,%edx
  800eba:	48 01 d0             	add    %rdx,%rax
  800ebd:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ec0:	83 c2 08             	add    $0x8,%edx
  800ec3:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800ec6:	eb 0c                	jmp    800ed4 <vprintfmt+0x1aa>
  800ec8:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800ecc:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800ed0:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800ed4:	8b 10                	mov    (%rax),%edx
  800ed6:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800eda:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ede:	48 89 ce             	mov    %rcx,%rsi
  800ee1:	89 d7                	mov    %edx,%edi
  800ee3:	ff d0                	callq  *%rax
  800ee5:	e9 37 03 00 00       	jmpq   801221 <vprintfmt+0x4f7>
  800eea:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800eed:	83 f8 30             	cmp    $0x30,%eax
  800ef0:	73 17                	jae    800f09 <vprintfmt+0x1df>
  800ef2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ef6:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ef9:	89 d2                	mov    %edx,%edx
  800efb:	48 01 d0             	add    %rdx,%rax
  800efe:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800f01:	83 c2 08             	add    $0x8,%edx
  800f04:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800f07:	eb 0c                	jmp    800f15 <vprintfmt+0x1eb>
  800f09:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800f0d:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800f11:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800f15:	8b 18                	mov    (%rax),%ebx
  800f17:	85 db                	test   %ebx,%ebx
  800f19:	79 02                	jns    800f1d <vprintfmt+0x1f3>
  800f1b:	f7 db                	neg    %ebx
  800f1d:	83 fb 15             	cmp    $0x15,%ebx
  800f20:	7f 16                	jg     800f38 <vprintfmt+0x20e>
  800f22:	48 b8 00 52 80 00 00 	movabs $0x805200,%rax
  800f29:	00 00 00 
  800f2c:	48 63 d3             	movslq %ebx,%rdx
  800f2f:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800f33:	4d 85 e4             	test   %r12,%r12
  800f36:	75 2e                	jne    800f66 <vprintfmt+0x23c>
  800f38:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800f3c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f40:	89 d9                	mov    %ebx,%ecx
  800f42:	48 ba c1 52 80 00 00 	movabs $0x8052c1,%rdx
  800f49:	00 00 00 
  800f4c:	48 89 c7             	mov    %rax,%rdi
  800f4f:	b8 00 00 00 00       	mov    $0x0,%eax
  800f54:	49 b8 30 12 80 00 00 	movabs $0x801230,%r8
  800f5b:	00 00 00 
  800f5e:	41 ff d0             	callq  *%r8
  800f61:	e9 bb 02 00 00       	jmpq   801221 <vprintfmt+0x4f7>
  800f66:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800f6a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800f6e:	4c 89 e1             	mov    %r12,%rcx
  800f71:	48 ba ca 52 80 00 00 	movabs $0x8052ca,%rdx
  800f78:	00 00 00 
  800f7b:	48 89 c7             	mov    %rax,%rdi
  800f7e:	b8 00 00 00 00       	mov    $0x0,%eax
  800f83:	49 b8 30 12 80 00 00 	movabs $0x801230,%r8
  800f8a:	00 00 00 
  800f8d:	41 ff d0             	callq  *%r8
  800f90:	e9 8c 02 00 00       	jmpq   801221 <vprintfmt+0x4f7>
  800f95:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800f98:	83 f8 30             	cmp    $0x30,%eax
  800f9b:	73 17                	jae    800fb4 <vprintfmt+0x28a>
  800f9d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800fa1:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fa4:	89 d2                	mov    %edx,%edx
  800fa6:	48 01 d0             	add    %rdx,%rax
  800fa9:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800fac:	83 c2 08             	add    $0x8,%edx
  800faf:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800fb2:	eb 0c                	jmp    800fc0 <vprintfmt+0x296>
  800fb4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800fb8:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800fbc:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800fc0:	4c 8b 20             	mov    (%rax),%r12
  800fc3:	4d 85 e4             	test   %r12,%r12
  800fc6:	75 0a                	jne    800fd2 <vprintfmt+0x2a8>
  800fc8:	49 bc cd 52 80 00 00 	movabs $0x8052cd,%r12
  800fcf:	00 00 00 
  800fd2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800fd6:	7e 78                	jle    801050 <vprintfmt+0x326>
  800fd8:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800fdc:	74 72                	je     801050 <vprintfmt+0x326>
  800fde:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800fe1:	48 98                	cltq   
  800fe3:	48 89 c6             	mov    %rax,%rsi
  800fe6:	4c 89 e7             	mov    %r12,%rdi
  800fe9:	48 b8 de 14 80 00 00 	movabs $0x8014de,%rax
  800ff0:	00 00 00 
  800ff3:	ff d0                	callq  *%rax
  800ff5:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800ff8:	eb 17                	jmp    801011 <vprintfmt+0x2e7>
  800ffa:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800ffe:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  801002:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801006:	48 89 ce             	mov    %rcx,%rsi
  801009:	89 d7                	mov    %edx,%edi
  80100b:	ff d0                	callq  *%rax
  80100d:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801011:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  801015:	7f e3                	jg     800ffa <vprintfmt+0x2d0>
  801017:	eb 37                	jmp    801050 <vprintfmt+0x326>
  801019:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  80101d:	74 1e                	je     80103d <vprintfmt+0x313>
  80101f:	83 fb 1f             	cmp    $0x1f,%ebx
  801022:	7e 05                	jle    801029 <vprintfmt+0x2ff>
  801024:	83 fb 7e             	cmp    $0x7e,%ebx
  801027:	7e 14                	jle    80103d <vprintfmt+0x313>
  801029:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  80102d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801031:	48 89 d6             	mov    %rdx,%rsi
  801034:	bf 3f 00 00 00       	mov    $0x3f,%edi
  801039:	ff d0                	callq  *%rax
  80103b:	eb 0f                	jmp    80104c <vprintfmt+0x322>
  80103d:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801041:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  801045:	48 89 d6             	mov    %rdx,%rsi
  801048:	89 df                	mov    %ebx,%edi
  80104a:	ff d0                	callq  *%rax
  80104c:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801050:	4c 89 e0             	mov    %r12,%rax
  801053:	4c 8d 60 01          	lea    0x1(%rax),%r12
  801057:	0f b6 00             	movzbl (%rax),%eax
  80105a:	0f be d8             	movsbl %al,%ebx
  80105d:	85 db                	test   %ebx,%ebx
  80105f:	74 28                	je     801089 <vprintfmt+0x35f>
  801061:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801065:	78 b2                	js     801019 <vprintfmt+0x2ef>
  801067:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  80106b:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  80106f:	79 a8                	jns    801019 <vprintfmt+0x2ef>
  801071:	eb 16                	jmp    801089 <vprintfmt+0x35f>
  801073:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801077:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80107b:	48 89 d6             	mov    %rdx,%rsi
  80107e:	bf 20 00 00 00       	mov    $0x20,%edi
  801083:	ff d0                	callq  *%rax
  801085:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  801089:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  80108d:	7f e4                	jg     801073 <vprintfmt+0x349>
  80108f:	e9 8d 01 00 00       	jmpq   801221 <vprintfmt+0x4f7>
  801094:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801098:	be 03 00 00 00       	mov    $0x3,%esi
  80109d:	48 89 c7             	mov    %rax,%rdi
  8010a0:	48 b8 23 0c 80 00 00 	movabs $0x800c23,%rax
  8010a7:	00 00 00 
  8010aa:	ff d0                	callq  *%rax
  8010ac:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8010b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010b4:	48 85 c0             	test   %rax,%rax
  8010b7:	79 1d                	jns    8010d6 <vprintfmt+0x3ac>
  8010b9:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8010bd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8010c1:	48 89 d6             	mov    %rdx,%rsi
  8010c4:	bf 2d 00 00 00       	mov    $0x2d,%edi
  8010c9:	ff d0                	callq  *%rax
  8010cb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010cf:	48 f7 d8             	neg    %rax
  8010d2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8010d6:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  8010dd:	e9 d2 00 00 00       	jmpq   8011b4 <vprintfmt+0x48a>
  8010e2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8010e6:	be 03 00 00 00       	mov    $0x3,%esi
  8010eb:	48 89 c7             	mov    %rax,%rdi
  8010ee:	48 b8 1c 0b 80 00 00 	movabs $0x800b1c,%rax
  8010f5:	00 00 00 
  8010f8:	ff d0                	callq  *%rax
  8010fa:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8010fe:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  801105:	e9 aa 00 00 00       	jmpq   8011b4 <vprintfmt+0x48a>
  80110a:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  80110e:	be 03 00 00 00       	mov    $0x3,%esi
  801113:	48 89 c7             	mov    %rax,%rdi
  801116:	48 b8 1c 0b 80 00 00 	movabs $0x800b1c,%rax
  80111d:	00 00 00 
  801120:	ff d0                	callq  *%rax
  801122:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801126:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  80112d:	e9 82 00 00 00       	jmpq   8011b4 <vprintfmt+0x48a>
  801132:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801136:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80113a:	48 89 d6             	mov    %rdx,%rsi
  80113d:	bf 30 00 00 00       	mov    $0x30,%edi
  801142:	ff d0                	callq  *%rax
  801144:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  801148:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  80114c:	48 89 d6             	mov    %rdx,%rsi
  80114f:	bf 78 00 00 00       	mov    $0x78,%edi
  801154:	ff d0                	callq  *%rax
  801156:	8b 45 b8             	mov    -0x48(%rbp),%eax
  801159:	83 f8 30             	cmp    $0x30,%eax
  80115c:	73 17                	jae    801175 <vprintfmt+0x44b>
  80115e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  801162:	8b 55 b8             	mov    -0x48(%rbp),%edx
  801165:	89 d2                	mov    %edx,%edx
  801167:	48 01 d0             	add    %rdx,%rax
  80116a:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80116d:	83 c2 08             	add    $0x8,%edx
  801170:	89 55 b8             	mov    %edx,-0x48(%rbp)
  801173:	eb 0c                	jmp    801181 <vprintfmt+0x457>
  801175:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  801179:	48 8d 50 08          	lea    0x8(%rax),%rdx
  80117d:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  801181:	48 8b 00             	mov    (%rax),%rax
  801184:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801188:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  80118f:	eb 23                	jmp    8011b4 <vprintfmt+0x48a>
  801191:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  801195:	be 03 00 00 00       	mov    $0x3,%esi
  80119a:	48 89 c7             	mov    %rax,%rdi
  80119d:	48 b8 1c 0b 80 00 00 	movabs $0x800b1c,%rax
  8011a4:	00 00 00 
  8011a7:	ff d0                	callq  *%rax
  8011a9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  8011ad:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  8011b4:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  8011b9:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  8011bc:	8b 7d dc             	mov    -0x24(%rbp),%edi
  8011bf:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011c3:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  8011c7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8011cb:	45 89 c1             	mov    %r8d,%r9d
  8011ce:	41 89 f8             	mov    %edi,%r8d
  8011d1:	48 89 c7             	mov    %rax,%rdi
  8011d4:	48 b8 64 0a 80 00 00 	movabs $0x800a64,%rax
  8011db:	00 00 00 
  8011de:	ff d0                	callq  *%rax
  8011e0:	eb 3f                	jmp    801221 <vprintfmt+0x4f7>
  8011e2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8011e6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8011ea:	48 89 d6             	mov    %rdx,%rsi
  8011ed:	89 df                	mov    %ebx,%edi
  8011ef:	ff d0                	callq  *%rax
  8011f1:	eb 2e                	jmp    801221 <vprintfmt+0x4f7>
  8011f3:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8011f7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8011fb:	48 89 d6             	mov    %rdx,%rsi
  8011fe:	bf 25 00 00 00       	mov    $0x25,%edi
  801203:	ff d0                	callq  *%rax
  801205:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  80120a:	eb 05                	jmp    801211 <vprintfmt+0x4e7>
  80120c:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  801211:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  801215:	48 83 e8 01          	sub    $0x1,%rax
  801219:	0f b6 00             	movzbl (%rax),%eax
  80121c:	3c 25                	cmp    $0x25,%al
  80121e:	75 ec                	jne    80120c <vprintfmt+0x4e2>
  801220:	90                   	nop
  801221:	e9 3d fb ff ff       	jmpq   800d63 <vprintfmt+0x39>
  801226:	90                   	nop
  801227:	48 83 c4 60          	add    $0x60,%rsp
  80122b:	5b                   	pop    %rbx
  80122c:	41 5c                	pop    %r12
  80122e:	5d                   	pop    %rbp
  80122f:	c3                   	retq   

0000000000801230 <printfmt>:
  801230:	55                   	push   %rbp
  801231:	48 89 e5             	mov    %rsp,%rbp
  801234:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  80123b:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  801242:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  801249:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  801250:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  801257:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  80125e:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801265:	84 c0                	test   %al,%al
  801267:	74 20                	je     801289 <printfmt+0x59>
  801269:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80126d:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  801271:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801275:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801279:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80127d:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  801281:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801285:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801289:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  801290:	00 00 00 
  801293:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  80129a:	00 00 00 
  80129d:	48 8d 45 10          	lea    0x10(%rbp),%rax
  8012a1:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  8012a8:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  8012af:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  8012b6:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  8012bd:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  8012c4:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  8012cb:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  8012d2:	48 89 c7             	mov    %rax,%rdi
  8012d5:	48 b8 2a 0d 80 00 00 	movabs $0x800d2a,%rax
  8012dc:	00 00 00 
  8012df:	ff d0                	callq  *%rax
  8012e1:	90                   	nop
  8012e2:	c9                   	leaveq 
  8012e3:	c3                   	retq   

00000000008012e4 <sprintputch>:
  8012e4:	55                   	push   %rbp
  8012e5:	48 89 e5             	mov    %rsp,%rbp
  8012e8:	48 83 ec 10          	sub    $0x10,%rsp
  8012ec:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8012ef:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8012f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8012f7:	8b 40 10             	mov    0x10(%rax),%eax
  8012fa:	8d 50 01             	lea    0x1(%rax),%edx
  8012fd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801301:	89 50 10             	mov    %edx,0x10(%rax)
  801304:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801308:	48 8b 10             	mov    (%rax),%rdx
  80130b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80130f:	48 8b 40 08          	mov    0x8(%rax),%rax
  801313:	48 39 c2             	cmp    %rax,%rdx
  801316:	73 17                	jae    80132f <sprintputch+0x4b>
  801318:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80131c:	48 8b 00             	mov    (%rax),%rax
  80131f:	48 8d 48 01          	lea    0x1(%rax),%rcx
  801323:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801327:	48 89 0a             	mov    %rcx,(%rdx)
  80132a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80132d:	88 10                	mov    %dl,(%rax)
  80132f:	90                   	nop
  801330:	c9                   	leaveq 
  801331:	c3                   	retq   

0000000000801332 <vsnprintf>:
  801332:	55                   	push   %rbp
  801333:	48 89 e5             	mov    %rsp,%rbp
  801336:	48 83 ec 50          	sub    $0x50,%rsp
  80133a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  80133e:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  801341:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  801345:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  801349:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  80134d:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  801351:	48 8b 0a             	mov    (%rdx),%rcx
  801354:	48 89 08             	mov    %rcx,(%rax)
  801357:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80135b:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80135f:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801363:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801367:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80136b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  80136f:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  801372:	48 98                	cltq   
  801374:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801378:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80137c:	48 01 d0             	add    %rdx,%rax
  80137f:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  801383:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80138a:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  80138f:	74 06                	je     801397 <vsnprintf+0x65>
  801391:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  801395:	7f 07                	jg     80139e <vsnprintf+0x6c>
  801397:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80139c:	eb 2f                	jmp    8013cd <vsnprintf+0x9b>
  80139e:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  8013a2:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  8013a6:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8013aa:	48 89 c6             	mov    %rax,%rsi
  8013ad:	48 bf e4 12 80 00 00 	movabs $0x8012e4,%rdi
  8013b4:	00 00 00 
  8013b7:	48 b8 2a 0d 80 00 00 	movabs $0x800d2a,%rax
  8013be:	00 00 00 
  8013c1:	ff d0                	callq  *%rax
  8013c3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8013c7:	c6 00 00             	movb   $0x0,(%rax)
  8013ca:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8013cd:	c9                   	leaveq 
  8013ce:	c3                   	retq   

00000000008013cf <snprintf>:
  8013cf:	55                   	push   %rbp
  8013d0:	48 89 e5             	mov    %rsp,%rbp
  8013d3:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  8013da:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8013e1:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  8013e7:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  8013ee:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  8013f5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  8013fc:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  801403:	84 c0                	test   %al,%al
  801405:	74 20                	je     801427 <snprintf+0x58>
  801407:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  80140b:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80140f:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  801413:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  801417:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  80141b:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80141f:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  801423:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  801427:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  80142e:	00 00 00 
  801431:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  801438:	00 00 00 
  80143b:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80143f:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  801446:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  80144d:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  801454:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  80145b:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  801462:	48 8b 0a             	mov    (%rdx),%rcx
  801465:	48 89 08             	mov    %rcx,(%rax)
  801468:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80146c:	48 89 48 08          	mov    %rcx,0x8(%rax)
  801470:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  801474:	48 89 50 10          	mov    %rdx,0x10(%rax)
  801478:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  80147f:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  801486:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  80148c:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  801493:	48 89 c7             	mov    %rax,%rdi
  801496:	48 b8 32 13 80 00 00 	movabs $0x801332,%rax
  80149d:	00 00 00 
  8014a0:	ff d0                	callq  *%rax
  8014a2:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8014a8:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8014ae:	c9                   	leaveq 
  8014af:	c3                   	retq   

00000000008014b0 <strlen>:
  8014b0:	55                   	push   %rbp
  8014b1:	48 89 e5             	mov    %rsp,%rbp
  8014b4:	48 83 ec 18          	sub    $0x18,%rsp
  8014b8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8014c3:	eb 09                	jmp    8014ce <strlen+0x1e>
  8014c5:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8014c9:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  8014ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014d2:	0f b6 00             	movzbl (%rax),%eax
  8014d5:	84 c0                	test   %al,%al
  8014d7:	75 ec                	jne    8014c5 <strlen+0x15>
  8014d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8014dc:	c9                   	leaveq 
  8014dd:	c3                   	retq   

00000000008014de <strnlen>:
  8014de:	55                   	push   %rbp
  8014df:	48 89 e5             	mov    %rsp,%rbp
  8014e2:	48 83 ec 20          	sub    $0x20,%rsp
  8014e6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014ea:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8014f5:	eb 0e                	jmp    801505 <strnlen+0x27>
  8014f7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8014fb:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801500:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801505:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  80150a:	74 0b                	je     801517 <strnlen+0x39>
  80150c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801510:	0f b6 00             	movzbl (%rax),%eax
  801513:	84 c0                	test   %al,%al
  801515:	75 e0                	jne    8014f7 <strnlen+0x19>
  801517:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80151a:	c9                   	leaveq 
  80151b:	c3                   	retq   

000000000080151c <strcpy>:
  80151c:	55                   	push   %rbp
  80151d:	48 89 e5             	mov    %rsp,%rbp
  801520:	48 83 ec 20          	sub    $0x20,%rsp
  801524:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801528:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80152c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801530:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801534:	90                   	nop
  801535:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801539:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80153d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801541:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801545:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801549:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80154d:	0f b6 12             	movzbl (%rdx),%edx
  801550:	88 10                	mov    %dl,(%rax)
  801552:	0f b6 00             	movzbl (%rax),%eax
  801555:	84 c0                	test   %al,%al
  801557:	75 dc                	jne    801535 <strcpy+0x19>
  801559:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80155d:	c9                   	leaveq 
  80155e:	c3                   	retq   

000000000080155f <strcat>:
  80155f:	55                   	push   %rbp
  801560:	48 89 e5             	mov    %rsp,%rbp
  801563:	48 83 ec 20          	sub    $0x20,%rsp
  801567:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80156b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80156f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801573:	48 89 c7             	mov    %rax,%rdi
  801576:	48 b8 b0 14 80 00 00 	movabs $0x8014b0,%rax
  80157d:	00 00 00 
  801580:	ff d0                	callq  *%rax
  801582:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801585:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801588:	48 63 d0             	movslq %eax,%rdx
  80158b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80158f:	48 01 c2             	add    %rax,%rdx
  801592:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801596:	48 89 c6             	mov    %rax,%rsi
  801599:	48 89 d7             	mov    %rdx,%rdi
  80159c:	48 b8 1c 15 80 00 00 	movabs $0x80151c,%rax
  8015a3:	00 00 00 
  8015a6:	ff d0                	callq  *%rax
  8015a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015ac:	c9                   	leaveq 
  8015ad:	c3                   	retq   

00000000008015ae <strncpy>:
  8015ae:	55                   	push   %rbp
  8015af:	48 89 e5             	mov    %rsp,%rbp
  8015b2:	48 83 ec 28          	sub    $0x28,%rsp
  8015b6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8015ba:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8015be:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8015c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015c6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8015ca:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  8015d1:	00 
  8015d2:	eb 2a                	jmp    8015fe <strncpy+0x50>
  8015d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015d8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8015dc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8015e0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8015e4:	0f b6 12             	movzbl (%rdx),%edx
  8015e7:	88 10                	mov    %dl,(%rax)
  8015e9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8015ed:	0f b6 00             	movzbl (%rax),%eax
  8015f0:	84 c0                	test   %al,%al
  8015f2:	74 05                	je     8015f9 <strncpy+0x4b>
  8015f4:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  8015f9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8015fe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801602:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801606:	72 cc                	jb     8015d4 <strncpy+0x26>
  801608:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80160c:	c9                   	leaveq 
  80160d:	c3                   	retq   

000000000080160e <strlcpy>:
  80160e:	55                   	push   %rbp
  80160f:	48 89 e5             	mov    %rsp,%rbp
  801612:	48 83 ec 28          	sub    $0x28,%rsp
  801616:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80161a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80161e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801622:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801626:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80162a:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80162f:	74 3d                	je     80166e <strlcpy+0x60>
  801631:	eb 1d                	jmp    801650 <strlcpy+0x42>
  801633:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801637:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80163b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80163f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801643:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  801647:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  80164b:	0f b6 12             	movzbl (%rdx),%edx
  80164e:	88 10                	mov    %dl,(%rax)
  801650:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  801655:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80165a:	74 0b                	je     801667 <strlcpy+0x59>
  80165c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801660:	0f b6 00             	movzbl (%rax),%eax
  801663:	84 c0                	test   %al,%al
  801665:	75 cc                	jne    801633 <strlcpy+0x25>
  801667:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80166b:	c6 00 00             	movb   $0x0,(%rax)
  80166e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801672:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801676:	48 29 c2             	sub    %rax,%rdx
  801679:	48 89 d0             	mov    %rdx,%rax
  80167c:	c9                   	leaveq 
  80167d:	c3                   	retq   

000000000080167e <strcmp>:
  80167e:	55                   	push   %rbp
  80167f:	48 89 e5             	mov    %rsp,%rbp
  801682:	48 83 ec 10          	sub    $0x10,%rsp
  801686:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80168a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80168e:	eb 0a                	jmp    80169a <strcmp+0x1c>
  801690:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801695:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  80169a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80169e:	0f b6 00             	movzbl (%rax),%eax
  8016a1:	84 c0                	test   %al,%al
  8016a3:	74 12                	je     8016b7 <strcmp+0x39>
  8016a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016a9:	0f b6 10             	movzbl (%rax),%edx
  8016ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016b0:	0f b6 00             	movzbl (%rax),%eax
  8016b3:	38 c2                	cmp    %al,%dl
  8016b5:	74 d9                	je     801690 <strcmp+0x12>
  8016b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8016bb:	0f b6 00             	movzbl (%rax),%eax
  8016be:	0f b6 d0             	movzbl %al,%edx
  8016c1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8016c5:	0f b6 00             	movzbl (%rax),%eax
  8016c8:	0f b6 c0             	movzbl %al,%eax
  8016cb:	29 c2                	sub    %eax,%edx
  8016cd:	89 d0                	mov    %edx,%eax
  8016cf:	c9                   	leaveq 
  8016d0:	c3                   	retq   

00000000008016d1 <strncmp>:
  8016d1:	55                   	push   %rbp
  8016d2:	48 89 e5             	mov    %rsp,%rbp
  8016d5:	48 83 ec 18          	sub    $0x18,%rsp
  8016d9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8016dd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8016e1:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8016e5:	eb 0f                	jmp    8016f6 <strncmp+0x25>
  8016e7:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  8016ec:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8016f1:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8016f6:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8016fb:	74 1d                	je     80171a <strncmp+0x49>
  8016fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801701:	0f b6 00             	movzbl (%rax),%eax
  801704:	84 c0                	test   %al,%al
  801706:	74 12                	je     80171a <strncmp+0x49>
  801708:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80170c:	0f b6 10             	movzbl (%rax),%edx
  80170f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801713:	0f b6 00             	movzbl (%rax),%eax
  801716:	38 c2                	cmp    %al,%dl
  801718:	74 cd                	je     8016e7 <strncmp+0x16>
  80171a:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80171f:	75 07                	jne    801728 <strncmp+0x57>
  801721:	b8 00 00 00 00       	mov    $0x0,%eax
  801726:	eb 18                	jmp    801740 <strncmp+0x6f>
  801728:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80172c:	0f b6 00             	movzbl (%rax),%eax
  80172f:	0f b6 d0             	movzbl %al,%edx
  801732:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801736:	0f b6 00             	movzbl (%rax),%eax
  801739:	0f b6 c0             	movzbl %al,%eax
  80173c:	29 c2                	sub    %eax,%edx
  80173e:	89 d0                	mov    %edx,%eax
  801740:	c9                   	leaveq 
  801741:	c3                   	retq   

0000000000801742 <strchr>:
  801742:	55                   	push   %rbp
  801743:	48 89 e5             	mov    %rsp,%rbp
  801746:	48 83 ec 10          	sub    $0x10,%rsp
  80174a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80174e:	89 f0                	mov    %esi,%eax
  801750:	88 45 f4             	mov    %al,-0xc(%rbp)
  801753:	eb 17                	jmp    80176c <strchr+0x2a>
  801755:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801759:	0f b6 00             	movzbl (%rax),%eax
  80175c:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80175f:	75 06                	jne    801767 <strchr+0x25>
  801761:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801765:	eb 15                	jmp    80177c <strchr+0x3a>
  801767:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80176c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801770:	0f b6 00             	movzbl (%rax),%eax
  801773:	84 c0                	test   %al,%al
  801775:	75 de                	jne    801755 <strchr+0x13>
  801777:	b8 00 00 00 00       	mov    $0x0,%eax
  80177c:	c9                   	leaveq 
  80177d:	c3                   	retq   

000000000080177e <strfind>:
  80177e:	55                   	push   %rbp
  80177f:	48 89 e5             	mov    %rsp,%rbp
  801782:	48 83 ec 10          	sub    $0x10,%rsp
  801786:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80178a:	89 f0                	mov    %esi,%eax
  80178c:	88 45 f4             	mov    %al,-0xc(%rbp)
  80178f:	eb 11                	jmp    8017a2 <strfind+0x24>
  801791:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801795:	0f b6 00             	movzbl (%rax),%eax
  801798:	3a 45 f4             	cmp    -0xc(%rbp),%al
  80179b:	74 12                	je     8017af <strfind+0x31>
  80179d:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8017a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017a6:	0f b6 00             	movzbl (%rax),%eax
  8017a9:	84 c0                	test   %al,%al
  8017ab:	75 e4                	jne    801791 <strfind+0x13>
  8017ad:	eb 01                	jmp    8017b0 <strfind+0x32>
  8017af:	90                   	nop
  8017b0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017b4:	c9                   	leaveq 
  8017b5:	c3                   	retq   

00000000008017b6 <memset>:
  8017b6:	55                   	push   %rbp
  8017b7:	48 89 e5             	mov    %rsp,%rbp
  8017ba:	48 83 ec 18          	sub    $0x18,%rsp
  8017be:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8017c2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  8017c5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8017c9:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  8017ce:	75 06                	jne    8017d6 <memset+0x20>
  8017d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017d4:	eb 69                	jmp    80183f <memset+0x89>
  8017d6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8017da:	83 e0 03             	and    $0x3,%eax
  8017dd:	48 85 c0             	test   %rax,%rax
  8017e0:	75 48                	jne    80182a <memset+0x74>
  8017e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8017e6:	83 e0 03             	and    $0x3,%eax
  8017e9:	48 85 c0             	test   %rax,%rax
  8017ec:	75 3c                	jne    80182a <memset+0x74>
  8017ee:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  8017f5:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8017f8:	c1 e0 18             	shl    $0x18,%eax
  8017fb:	89 c2                	mov    %eax,%edx
  8017fd:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801800:	c1 e0 10             	shl    $0x10,%eax
  801803:	09 c2                	or     %eax,%edx
  801805:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801808:	c1 e0 08             	shl    $0x8,%eax
  80180b:	09 d0                	or     %edx,%eax
  80180d:	09 45 f4             	or     %eax,-0xc(%rbp)
  801810:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801814:	48 c1 e8 02          	shr    $0x2,%rax
  801818:	48 89 c1             	mov    %rax,%rcx
  80181b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80181f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801822:	48 89 d7             	mov    %rdx,%rdi
  801825:	fc                   	cld    
  801826:	f3 ab                	rep stos %eax,%es:(%rdi)
  801828:	eb 11                	jmp    80183b <memset+0x85>
  80182a:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80182e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801831:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801835:	48 89 d7             	mov    %rdx,%rdi
  801838:	fc                   	cld    
  801839:	f3 aa                	rep stos %al,%es:(%rdi)
  80183b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80183f:	c9                   	leaveq 
  801840:	c3                   	retq   

0000000000801841 <memmove>:
  801841:	55                   	push   %rbp
  801842:	48 89 e5             	mov    %rsp,%rbp
  801845:	48 83 ec 28          	sub    $0x28,%rsp
  801849:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80184d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801851:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801855:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801859:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80185d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801861:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801865:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801869:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  80186d:	0f 83 88 00 00 00    	jae    8018fb <memmove+0xba>
  801873:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801877:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80187b:	48 01 d0             	add    %rdx,%rax
  80187e:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  801882:	76 77                	jbe    8018fb <memmove+0xba>
  801884:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801888:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  80188c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801890:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  801894:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801898:	83 e0 03             	and    $0x3,%eax
  80189b:	48 85 c0             	test   %rax,%rax
  80189e:	75 3b                	jne    8018db <memmove+0x9a>
  8018a0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018a4:	83 e0 03             	and    $0x3,%eax
  8018a7:	48 85 c0             	test   %rax,%rax
  8018aa:	75 2f                	jne    8018db <memmove+0x9a>
  8018ac:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018b0:	83 e0 03             	and    $0x3,%eax
  8018b3:	48 85 c0             	test   %rax,%rax
  8018b6:	75 23                	jne    8018db <memmove+0x9a>
  8018b8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018bc:	48 83 e8 04          	sub    $0x4,%rax
  8018c0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8018c4:	48 83 ea 04          	sub    $0x4,%rdx
  8018c8:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8018cc:	48 c1 e9 02          	shr    $0x2,%rcx
  8018d0:	48 89 c7             	mov    %rax,%rdi
  8018d3:	48 89 d6             	mov    %rdx,%rsi
  8018d6:	fd                   	std    
  8018d7:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  8018d9:	eb 1d                	jmp    8018f8 <memmove+0xb7>
  8018db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8018df:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8018e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018e7:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  8018eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8018ef:	48 89 d7             	mov    %rdx,%rdi
  8018f2:	48 89 c1             	mov    %rax,%rcx
  8018f5:	fd                   	std    
  8018f6:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8018f8:	fc                   	cld    
  8018f9:	eb 57                	jmp    801952 <memmove+0x111>
  8018fb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8018ff:	83 e0 03             	and    $0x3,%eax
  801902:	48 85 c0             	test   %rax,%rax
  801905:	75 36                	jne    80193d <memmove+0xfc>
  801907:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80190b:	83 e0 03             	and    $0x3,%eax
  80190e:	48 85 c0             	test   %rax,%rax
  801911:	75 2a                	jne    80193d <memmove+0xfc>
  801913:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801917:	83 e0 03             	and    $0x3,%eax
  80191a:	48 85 c0             	test   %rax,%rax
  80191d:	75 1e                	jne    80193d <memmove+0xfc>
  80191f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801923:	48 c1 e8 02          	shr    $0x2,%rax
  801927:	48 89 c1             	mov    %rax,%rcx
  80192a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80192e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801932:	48 89 c7             	mov    %rax,%rdi
  801935:	48 89 d6             	mov    %rdx,%rsi
  801938:	fc                   	cld    
  801939:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  80193b:	eb 15                	jmp    801952 <memmove+0x111>
  80193d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801941:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801945:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  801949:	48 89 c7             	mov    %rax,%rdi
  80194c:	48 89 d6             	mov    %rdx,%rsi
  80194f:	fc                   	cld    
  801950:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801952:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801956:	c9                   	leaveq 
  801957:	c3                   	retq   

0000000000801958 <memcpy>:
  801958:	55                   	push   %rbp
  801959:	48 89 e5             	mov    %rsp,%rbp
  80195c:	48 83 ec 18          	sub    $0x18,%rsp
  801960:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801964:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801968:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80196c:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801970:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  801974:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801978:	48 89 ce             	mov    %rcx,%rsi
  80197b:	48 89 c7             	mov    %rax,%rdi
  80197e:	48 b8 41 18 80 00 00 	movabs $0x801841,%rax
  801985:	00 00 00 
  801988:	ff d0                	callq  *%rax
  80198a:	c9                   	leaveq 
  80198b:	c3                   	retq   

000000000080198c <memcmp>:
  80198c:	55                   	push   %rbp
  80198d:	48 89 e5             	mov    %rsp,%rbp
  801990:	48 83 ec 28          	sub    $0x28,%rsp
  801994:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801998:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80199c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8019a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8019a4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8019a8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8019ac:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8019b0:	eb 36                	jmp    8019e8 <memcmp+0x5c>
  8019b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019b6:	0f b6 10             	movzbl (%rax),%edx
  8019b9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8019bd:	0f b6 00             	movzbl (%rax),%eax
  8019c0:	38 c2                	cmp    %al,%dl
  8019c2:	74 1a                	je     8019de <memcmp+0x52>
  8019c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8019c8:	0f b6 00             	movzbl (%rax),%eax
  8019cb:	0f b6 d0             	movzbl %al,%edx
  8019ce:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8019d2:	0f b6 00             	movzbl (%rax),%eax
  8019d5:	0f b6 c0             	movzbl %al,%eax
  8019d8:	29 c2                	sub    %eax,%edx
  8019da:	89 d0                	mov    %edx,%eax
  8019dc:	eb 20                	jmp    8019fe <memcmp+0x72>
  8019de:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8019e3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8019e8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8019ec:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  8019f0:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8019f4:	48 85 c0             	test   %rax,%rax
  8019f7:	75 b9                	jne    8019b2 <memcmp+0x26>
  8019f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8019fe:	c9                   	leaveq 
  8019ff:	c3                   	retq   

0000000000801a00 <memfind>:
  801a00:	55                   	push   %rbp
  801a01:	48 89 e5             	mov    %rsp,%rbp
  801a04:	48 83 ec 28          	sub    $0x28,%rsp
  801a08:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801a0c:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  801a0f:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801a13:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801a17:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a1b:	48 01 d0             	add    %rdx,%rax
  801a1e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801a22:	eb 13                	jmp    801a37 <memfind+0x37>
  801a24:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a28:	0f b6 00             	movzbl (%rax),%eax
  801a2b:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  801a2e:	38 d0                	cmp    %dl,%al
  801a30:	74 11                	je     801a43 <memfind+0x43>
  801a32:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801a37:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a3b:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  801a3f:	72 e3                	jb     801a24 <memfind+0x24>
  801a41:	eb 01                	jmp    801a44 <memfind+0x44>
  801a43:	90                   	nop
  801a44:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801a48:	c9                   	leaveq 
  801a49:	c3                   	retq   

0000000000801a4a <strtol>:
  801a4a:	55                   	push   %rbp
  801a4b:	48 89 e5             	mov    %rsp,%rbp
  801a4e:	48 83 ec 38          	sub    $0x38,%rsp
  801a52:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801a56:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801a5a:	89 55 cc             	mov    %edx,-0x34(%rbp)
  801a5d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801a64:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  801a6b:	00 
  801a6c:	eb 05                	jmp    801a73 <strtol+0x29>
  801a6e:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a73:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a77:	0f b6 00             	movzbl (%rax),%eax
  801a7a:	3c 20                	cmp    $0x20,%al
  801a7c:	74 f0                	je     801a6e <strtol+0x24>
  801a7e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a82:	0f b6 00             	movzbl (%rax),%eax
  801a85:	3c 09                	cmp    $0x9,%al
  801a87:	74 e5                	je     801a6e <strtol+0x24>
  801a89:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a8d:	0f b6 00             	movzbl (%rax),%eax
  801a90:	3c 2b                	cmp    $0x2b,%al
  801a92:	75 07                	jne    801a9b <strtol+0x51>
  801a94:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801a99:	eb 17                	jmp    801ab2 <strtol+0x68>
  801a9b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801a9f:	0f b6 00             	movzbl (%rax),%eax
  801aa2:	3c 2d                	cmp    $0x2d,%al
  801aa4:	75 0c                	jne    801ab2 <strtol+0x68>
  801aa6:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801aab:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801ab2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801ab6:	74 06                	je     801abe <strtol+0x74>
  801ab8:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  801abc:	75 28                	jne    801ae6 <strtol+0x9c>
  801abe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801ac2:	0f b6 00             	movzbl (%rax),%eax
  801ac5:	3c 30                	cmp    $0x30,%al
  801ac7:	75 1d                	jne    801ae6 <strtol+0x9c>
  801ac9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801acd:	48 83 c0 01          	add    $0x1,%rax
  801ad1:	0f b6 00             	movzbl (%rax),%eax
  801ad4:	3c 78                	cmp    $0x78,%al
  801ad6:	75 0e                	jne    801ae6 <strtol+0x9c>
  801ad8:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  801add:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801ae4:	eb 2c                	jmp    801b12 <strtol+0xc8>
  801ae6:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801aea:	75 19                	jne    801b05 <strtol+0xbb>
  801aec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801af0:	0f b6 00             	movzbl (%rax),%eax
  801af3:	3c 30                	cmp    $0x30,%al
  801af5:	75 0e                	jne    801b05 <strtol+0xbb>
  801af7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801afc:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801b03:	eb 0d                	jmp    801b12 <strtol+0xc8>
  801b05:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801b09:	75 07                	jne    801b12 <strtol+0xc8>
  801b0b:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801b12:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b16:	0f b6 00             	movzbl (%rax),%eax
  801b19:	3c 2f                	cmp    $0x2f,%al
  801b1b:	7e 1d                	jle    801b3a <strtol+0xf0>
  801b1d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b21:	0f b6 00             	movzbl (%rax),%eax
  801b24:	3c 39                	cmp    $0x39,%al
  801b26:	7f 12                	jg     801b3a <strtol+0xf0>
  801b28:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b2c:	0f b6 00             	movzbl (%rax),%eax
  801b2f:	0f be c0             	movsbl %al,%eax
  801b32:	83 e8 30             	sub    $0x30,%eax
  801b35:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801b38:	eb 4e                	jmp    801b88 <strtol+0x13e>
  801b3a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b3e:	0f b6 00             	movzbl (%rax),%eax
  801b41:	3c 60                	cmp    $0x60,%al
  801b43:	7e 1d                	jle    801b62 <strtol+0x118>
  801b45:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b49:	0f b6 00             	movzbl (%rax),%eax
  801b4c:	3c 7a                	cmp    $0x7a,%al
  801b4e:	7f 12                	jg     801b62 <strtol+0x118>
  801b50:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b54:	0f b6 00             	movzbl (%rax),%eax
  801b57:	0f be c0             	movsbl %al,%eax
  801b5a:	83 e8 57             	sub    $0x57,%eax
  801b5d:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801b60:	eb 26                	jmp    801b88 <strtol+0x13e>
  801b62:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b66:	0f b6 00             	movzbl (%rax),%eax
  801b69:	3c 40                	cmp    $0x40,%al
  801b6b:	7e 47                	jle    801bb4 <strtol+0x16a>
  801b6d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b71:	0f b6 00             	movzbl (%rax),%eax
  801b74:	3c 5a                	cmp    $0x5a,%al
  801b76:	7f 3c                	jg     801bb4 <strtol+0x16a>
  801b78:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801b7c:	0f b6 00             	movzbl (%rax),%eax
  801b7f:	0f be c0             	movsbl %al,%eax
  801b82:	83 e8 37             	sub    $0x37,%eax
  801b85:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801b88:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801b8b:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  801b8e:	7d 23                	jge    801bb3 <strtol+0x169>
  801b90:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801b95:	8b 45 cc             	mov    -0x34(%rbp),%eax
  801b98:	48 98                	cltq   
  801b9a:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  801b9f:	48 89 c2             	mov    %rax,%rdx
  801ba2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801ba5:	48 98                	cltq   
  801ba7:	48 01 d0             	add    %rdx,%rax
  801baa:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801bae:	e9 5f ff ff ff       	jmpq   801b12 <strtol+0xc8>
  801bb3:	90                   	nop
  801bb4:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801bb9:	74 0b                	je     801bc6 <strtol+0x17c>
  801bbb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801bbf:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801bc3:	48 89 10             	mov    %rdx,(%rax)
  801bc6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801bca:	74 09                	je     801bd5 <strtol+0x18b>
  801bcc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bd0:	48 f7 d8             	neg    %rax
  801bd3:	eb 04                	jmp    801bd9 <strtol+0x18f>
  801bd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801bd9:	c9                   	leaveq 
  801bda:	c3                   	retq   

0000000000801bdb <strstr>:
  801bdb:	55                   	push   %rbp
  801bdc:	48 89 e5             	mov    %rsp,%rbp
  801bdf:	48 83 ec 30          	sub    $0x30,%rsp
  801be3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801be7:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801beb:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801bef:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801bf3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801bf7:	0f b6 00             	movzbl (%rax),%eax
  801bfa:	88 45 ff             	mov    %al,-0x1(%rbp)
  801bfd:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  801c01:	75 06                	jne    801c09 <strstr+0x2e>
  801c03:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c07:	eb 6b                	jmp    801c74 <strstr+0x99>
  801c09:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  801c0d:	48 89 c7             	mov    %rax,%rdi
  801c10:	48 b8 b0 14 80 00 00 	movabs $0x8014b0,%rax
  801c17:	00 00 00 
  801c1a:	ff d0                	callq  *%rax
  801c1c:	48 98                	cltq   
  801c1e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801c22:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c26:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801c2a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801c2e:	0f b6 00             	movzbl (%rax),%eax
  801c31:	88 45 ef             	mov    %al,-0x11(%rbp)
  801c34:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801c38:	75 07                	jne    801c41 <strstr+0x66>
  801c3a:	b8 00 00 00 00       	mov    $0x0,%eax
  801c3f:	eb 33                	jmp    801c74 <strstr+0x99>
  801c41:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  801c45:	3a 45 ff             	cmp    -0x1(%rbp),%al
  801c48:	75 d8                	jne    801c22 <strstr+0x47>
  801c4a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801c4e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  801c52:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c56:	48 89 ce             	mov    %rcx,%rsi
  801c59:	48 89 c7             	mov    %rax,%rdi
  801c5c:	48 b8 d1 16 80 00 00 	movabs $0x8016d1,%rax
  801c63:	00 00 00 
  801c66:	ff d0                	callq  *%rax
  801c68:	85 c0                	test   %eax,%eax
  801c6a:	75 b6                	jne    801c22 <strstr+0x47>
  801c6c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801c70:	48 83 e8 01          	sub    $0x1,%rax
  801c74:	c9                   	leaveq 
  801c75:	c3                   	retq   

0000000000801c76 <syscall>:
  801c76:	55                   	push   %rbp
  801c77:	48 89 e5             	mov    %rsp,%rbp
  801c7a:	53                   	push   %rbx
  801c7b:	48 83 ec 48          	sub    $0x48,%rsp
  801c7f:	89 7d dc             	mov    %edi,-0x24(%rbp)
  801c82:	89 75 d8             	mov    %esi,-0x28(%rbp)
  801c85:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801c89:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  801c8d:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  801c91:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  801c95:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801c98:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  801c9c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  801ca0:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801ca4:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801ca8:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  801cac:	4c 89 c3             	mov    %r8,%rbx
  801caf:	cd 30                	int    $0x30
  801cb1:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801cb5:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801cb9:	74 3e                	je     801cf9 <syscall+0x83>
  801cbb:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801cc0:	7e 37                	jle    801cf9 <syscall+0x83>
  801cc2:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801cc6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801cc9:	49 89 d0             	mov    %rdx,%r8
  801ccc:	89 c1                	mov    %eax,%ecx
  801cce:	48 ba 88 55 80 00 00 	movabs $0x805588,%rdx
  801cd5:	00 00 00 
  801cd8:	be 24 00 00 00       	mov    $0x24,%esi
  801cdd:	48 bf a5 55 80 00 00 	movabs $0x8055a5,%rdi
  801ce4:	00 00 00 
  801ce7:	b8 00 00 00 00       	mov    $0x0,%eax
  801cec:	49 b9 52 07 80 00 00 	movabs $0x800752,%r9
  801cf3:	00 00 00 
  801cf6:	41 ff d1             	callq  *%r9
  801cf9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801cfd:	48 83 c4 48          	add    $0x48,%rsp
  801d01:	5b                   	pop    %rbx
  801d02:	5d                   	pop    %rbp
  801d03:	c3                   	retq   

0000000000801d04 <sys_cputs>:
  801d04:	55                   	push   %rbp
  801d05:	48 89 e5             	mov    %rsp,%rbp
  801d08:	48 83 ec 10          	sub    $0x10,%rsp
  801d0c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d10:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d14:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d18:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d1c:	48 83 ec 08          	sub    $0x8,%rsp
  801d20:	6a 00                	pushq  $0x0
  801d22:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d28:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d2e:	48 89 d1             	mov    %rdx,%rcx
  801d31:	48 89 c2             	mov    %rax,%rdx
  801d34:	be 00 00 00 00       	mov    $0x0,%esi
  801d39:	bf 00 00 00 00       	mov    $0x0,%edi
  801d3e:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801d45:	00 00 00 
  801d48:	ff d0                	callq  *%rax
  801d4a:	48 83 c4 10          	add    $0x10,%rsp
  801d4e:	90                   	nop
  801d4f:	c9                   	leaveq 
  801d50:	c3                   	retq   

0000000000801d51 <sys_cgetc>:
  801d51:	55                   	push   %rbp
  801d52:	48 89 e5             	mov    %rsp,%rbp
  801d55:	48 83 ec 08          	sub    $0x8,%rsp
  801d59:	6a 00                	pushq  $0x0
  801d5b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d61:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d67:	b9 00 00 00 00       	mov    $0x0,%ecx
  801d6c:	ba 00 00 00 00       	mov    $0x0,%edx
  801d71:	be 00 00 00 00       	mov    $0x0,%esi
  801d76:	bf 01 00 00 00       	mov    $0x1,%edi
  801d7b:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801d82:	00 00 00 
  801d85:	ff d0                	callq  *%rax
  801d87:	48 83 c4 10          	add    $0x10,%rsp
  801d8b:	c9                   	leaveq 
  801d8c:	c3                   	retq   

0000000000801d8d <sys_env_destroy>:
  801d8d:	55                   	push   %rbp
  801d8e:	48 89 e5             	mov    %rsp,%rbp
  801d91:	48 83 ec 10          	sub    $0x10,%rsp
  801d95:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d98:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d9b:	48 98                	cltq   
  801d9d:	48 83 ec 08          	sub    $0x8,%rsp
  801da1:	6a 00                	pushq  $0x0
  801da3:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801da9:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801daf:	b9 00 00 00 00       	mov    $0x0,%ecx
  801db4:	48 89 c2             	mov    %rax,%rdx
  801db7:	be 01 00 00 00       	mov    $0x1,%esi
  801dbc:	bf 03 00 00 00       	mov    $0x3,%edi
  801dc1:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801dc8:	00 00 00 
  801dcb:	ff d0                	callq  *%rax
  801dcd:	48 83 c4 10          	add    $0x10,%rsp
  801dd1:	c9                   	leaveq 
  801dd2:	c3                   	retq   

0000000000801dd3 <sys_getenvid>:
  801dd3:	55                   	push   %rbp
  801dd4:	48 89 e5             	mov    %rsp,%rbp
  801dd7:	48 83 ec 08          	sub    $0x8,%rsp
  801ddb:	6a 00                	pushq  $0x0
  801ddd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801de3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801de9:	b9 00 00 00 00       	mov    $0x0,%ecx
  801dee:	ba 00 00 00 00       	mov    $0x0,%edx
  801df3:	be 00 00 00 00       	mov    $0x0,%esi
  801df8:	bf 02 00 00 00       	mov    $0x2,%edi
  801dfd:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801e04:	00 00 00 
  801e07:	ff d0                	callq  *%rax
  801e09:	48 83 c4 10          	add    $0x10,%rsp
  801e0d:	c9                   	leaveq 
  801e0e:	c3                   	retq   

0000000000801e0f <sys_yield>:
  801e0f:	55                   	push   %rbp
  801e10:	48 89 e5             	mov    %rsp,%rbp
  801e13:	48 83 ec 08          	sub    $0x8,%rsp
  801e17:	6a 00                	pushq  $0x0
  801e19:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e1f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801e25:	b9 00 00 00 00       	mov    $0x0,%ecx
  801e2a:	ba 00 00 00 00       	mov    $0x0,%edx
  801e2f:	be 00 00 00 00       	mov    $0x0,%esi
  801e34:	bf 0b 00 00 00       	mov    $0xb,%edi
  801e39:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801e40:	00 00 00 
  801e43:	ff d0                	callq  *%rax
  801e45:	48 83 c4 10          	add    $0x10,%rsp
  801e49:	90                   	nop
  801e4a:	c9                   	leaveq 
  801e4b:	c3                   	retq   

0000000000801e4c <sys_page_alloc>:
  801e4c:	55                   	push   %rbp
  801e4d:	48 89 e5             	mov    %rsp,%rbp
  801e50:	48 83 ec 10          	sub    $0x10,%rsp
  801e54:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801e57:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801e5b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801e5e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801e61:	48 63 c8             	movslq %eax,%rcx
  801e64:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e68:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e6b:	48 98                	cltq   
  801e6d:	48 83 ec 08          	sub    $0x8,%rsp
  801e71:	6a 00                	pushq  $0x0
  801e73:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801e79:	49 89 c8             	mov    %rcx,%r8
  801e7c:	48 89 d1             	mov    %rdx,%rcx
  801e7f:	48 89 c2             	mov    %rax,%rdx
  801e82:	be 01 00 00 00       	mov    $0x1,%esi
  801e87:	bf 04 00 00 00       	mov    $0x4,%edi
  801e8c:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801e93:	00 00 00 
  801e96:	ff d0                	callq  *%rax
  801e98:	48 83 c4 10          	add    $0x10,%rsp
  801e9c:	c9                   	leaveq 
  801e9d:	c3                   	retq   

0000000000801e9e <sys_page_map>:
  801e9e:	55                   	push   %rbp
  801e9f:	48 89 e5             	mov    %rsp,%rbp
  801ea2:	48 83 ec 20          	sub    $0x20,%rsp
  801ea6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ea9:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ead:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801eb0:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801eb4:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801eb8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801ebb:	48 63 c8             	movslq %eax,%rcx
  801ebe:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801ec2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ec5:	48 63 f0             	movslq %eax,%rsi
  801ec8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ecc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ecf:	48 98                	cltq   
  801ed1:	48 83 ec 08          	sub    $0x8,%rsp
  801ed5:	51                   	push   %rcx
  801ed6:	49 89 f9             	mov    %rdi,%r9
  801ed9:	49 89 f0             	mov    %rsi,%r8
  801edc:	48 89 d1             	mov    %rdx,%rcx
  801edf:	48 89 c2             	mov    %rax,%rdx
  801ee2:	be 01 00 00 00       	mov    $0x1,%esi
  801ee7:	bf 05 00 00 00       	mov    $0x5,%edi
  801eec:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801ef3:	00 00 00 
  801ef6:	ff d0                	callq  *%rax
  801ef8:	48 83 c4 10          	add    $0x10,%rsp
  801efc:	c9                   	leaveq 
  801efd:	c3                   	retq   

0000000000801efe <sys_page_unmap>:
  801efe:	55                   	push   %rbp
  801eff:	48 89 e5             	mov    %rsp,%rbp
  801f02:	48 83 ec 10          	sub    $0x10,%rsp
  801f06:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f09:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801f0d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801f11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f14:	48 98                	cltq   
  801f16:	48 83 ec 08          	sub    $0x8,%rsp
  801f1a:	6a 00                	pushq  $0x0
  801f1c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f22:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f28:	48 89 d1             	mov    %rdx,%rcx
  801f2b:	48 89 c2             	mov    %rax,%rdx
  801f2e:	be 01 00 00 00       	mov    $0x1,%esi
  801f33:	bf 06 00 00 00       	mov    $0x6,%edi
  801f38:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801f3f:	00 00 00 
  801f42:	ff d0                	callq  *%rax
  801f44:	48 83 c4 10          	add    $0x10,%rsp
  801f48:	c9                   	leaveq 
  801f49:	c3                   	retq   

0000000000801f4a <sys_env_set_status>:
  801f4a:	55                   	push   %rbp
  801f4b:	48 89 e5             	mov    %rsp,%rbp
  801f4e:	48 83 ec 10          	sub    $0x10,%rsp
  801f52:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801f55:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801f58:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801f5b:	48 63 d0             	movslq %eax,%rdx
  801f5e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f61:	48 98                	cltq   
  801f63:	48 83 ec 08          	sub    $0x8,%rsp
  801f67:	6a 00                	pushq  $0x0
  801f69:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801f6f:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801f75:	48 89 d1             	mov    %rdx,%rcx
  801f78:	48 89 c2             	mov    %rax,%rdx
  801f7b:	be 01 00 00 00       	mov    $0x1,%esi
  801f80:	bf 08 00 00 00       	mov    $0x8,%edi
  801f85:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801f8c:	00 00 00 
  801f8f:	ff d0                	callq  *%rax
  801f91:	48 83 c4 10          	add    $0x10,%rsp
  801f95:	c9                   	leaveq 
  801f96:	c3                   	retq   

0000000000801f97 <sys_env_set_trapframe>:
  801f97:	55                   	push   %rbp
  801f98:	48 89 e5             	mov    %rsp,%rbp
  801f9b:	48 83 ec 10          	sub    $0x10,%rsp
  801f9f:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801fa2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801fa6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801faa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fad:	48 98                	cltq   
  801faf:	48 83 ec 08          	sub    $0x8,%rsp
  801fb3:	6a 00                	pushq  $0x0
  801fb5:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801fbb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801fc1:	48 89 d1             	mov    %rdx,%rcx
  801fc4:	48 89 c2             	mov    %rax,%rdx
  801fc7:	be 01 00 00 00       	mov    $0x1,%esi
  801fcc:	bf 09 00 00 00       	mov    $0x9,%edi
  801fd1:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  801fd8:	00 00 00 
  801fdb:	ff d0                	callq  *%rax
  801fdd:	48 83 c4 10          	add    $0x10,%rsp
  801fe1:	c9                   	leaveq 
  801fe2:	c3                   	retq   

0000000000801fe3 <sys_env_set_pgfault_upcall>:
  801fe3:	55                   	push   %rbp
  801fe4:	48 89 e5             	mov    %rsp,%rbp
  801fe7:	48 83 ec 10          	sub    $0x10,%rsp
  801feb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801fee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801ff2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801ff6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801ff9:	48 98                	cltq   
  801ffb:	48 83 ec 08          	sub    $0x8,%rsp
  801fff:	6a 00                	pushq  $0x0
  802001:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802007:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80200d:	48 89 d1             	mov    %rdx,%rcx
  802010:	48 89 c2             	mov    %rax,%rdx
  802013:	be 01 00 00 00       	mov    $0x1,%esi
  802018:	bf 0a 00 00 00       	mov    $0xa,%edi
  80201d:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  802024:	00 00 00 
  802027:	ff d0                	callq  *%rax
  802029:	48 83 c4 10          	add    $0x10,%rsp
  80202d:	c9                   	leaveq 
  80202e:	c3                   	retq   

000000000080202f <sys_ipc_try_send>:
  80202f:	55                   	push   %rbp
  802030:	48 89 e5             	mov    %rsp,%rbp
  802033:	48 83 ec 20          	sub    $0x20,%rsp
  802037:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80203a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80203e:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  802042:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  802045:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802048:	48 63 f0             	movslq %eax,%rsi
  80204b:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  80204f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802052:	48 98                	cltq   
  802054:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802058:	48 83 ec 08          	sub    $0x8,%rsp
  80205c:	6a 00                	pushq  $0x0
  80205e:	49 89 f1             	mov    %rsi,%r9
  802061:	49 89 c8             	mov    %rcx,%r8
  802064:	48 89 d1             	mov    %rdx,%rcx
  802067:	48 89 c2             	mov    %rax,%rdx
  80206a:	be 00 00 00 00       	mov    $0x0,%esi
  80206f:	bf 0c 00 00 00       	mov    $0xc,%edi
  802074:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  80207b:	00 00 00 
  80207e:	ff d0                	callq  *%rax
  802080:	48 83 c4 10          	add    $0x10,%rsp
  802084:	c9                   	leaveq 
  802085:	c3                   	retq   

0000000000802086 <sys_ipc_recv>:
  802086:	55                   	push   %rbp
  802087:	48 89 e5             	mov    %rsp,%rbp
  80208a:	48 83 ec 10          	sub    $0x10,%rsp
  80208e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802092:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802096:	48 83 ec 08          	sub    $0x8,%rsp
  80209a:	6a 00                	pushq  $0x0
  80209c:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020a2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020a8:	b9 00 00 00 00       	mov    $0x0,%ecx
  8020ad:	48 89 c2             	mov    %rax,%rdx
  8020b0:	be 01 00 00 00       	mov    $0x1,%esi
  8020b5:	bf 0d 00 00 00       	mov    $0xd,%edi
  8020ba:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  8020c1:	00 00 00 
  8020c4:	ff d0                	callq  *%rax
  8020c6:	48 83 c4 10          	add    $0x10,%rsp
  8020ca:	c9                   	leaveq 
  8020cb:	c3                   	retq   

00000000008020cc <sys_time_msec>:
  8020cc:	55                   	push   %rbp
  8020cd:	48 89 e5             	mov    %rsp,%rbp
  8020d0:	48 83 ec 08          	sub    $0x8,%rsp
  8020d4:	6a 00                	pushq  $0x0
  8020d6:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8020dc:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8020e2:	b9 00 00 00 00       	mov    $0x0,%ecx
  8020e7:	ba 00 00 00 00       	mov    $0x0,%edx
  8020ec:	be 00 00 00 00       	mov    $0x0,%esi
  8020f1:	bf 0e 00 00 00       	mov    $0xe,%edi
  8020f6:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  8020fd:	00 00 00 
  802100:	ff d0                	callq  *%rax
  802102:	48 83 c4 10          	add    $0x10,%rsp
  802106:	c9                   	leaveq 
  802107:	c3                   	retq   

0000000000802108 <sys_net_transmit>:
  802108:	55                   	push   %rbp
  802109:	48 89 e5             	mov    %rsp,%rbp
  80210c:	48 83 ec 10          	sub    $0x10,%rsp
  802110:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802114:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802117:	8b 55 f4             	mov    -0xc(%rbp),%edx
  80211a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80211e:	48 83 ec 08          	sub    $0x8,%rsp
  802122:	6a 00                	pushq  $0x0
  802124:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80212a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802130:	48 89 d1             	mov    %rdx,%rcx
  802133:	48 89 c2             	mov    %rax,%rdx
  802136:	be 00 00 00 00       	mov    $0x0,%esi
  80213b:	bf 0f 00 00 00       	mov    $0xf,%edi
  802140:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  802147:	00 00 00 
  80214a:	ff d0                	callq  *%rax
  80214c:	48 83 c4 10          	add    $0x10,%rsp
  802150:	c9                   	leaveq 
  802151:	c3                   	retq   

0000000000802152 <sys_net_receive>:
  802152:	55                   	push   %rbp
  802153:	48 89 e5             	mov    %rsp,%rbp
  802156:	48 83 ec 10          	sub    $0x10,%rsp
  80215a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80215e:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802161:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802164:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802168:	48 83 ec 08          	sub    $0x8,%rsp
  80216c:	6a 00                	pushq  $0x0
  80216e:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802174:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80217a:	48 89 d1             	mov    %rdx,%rcx
  80217d:	48 89 c2             	mov    %rax,%rdx
  802180:	be 00 00 00 00       	mov    $0x0,%esi
  802185:	bf 10 00 00 00       	mov    $0x10,%edi
  80218a:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  802191:	00 00 00 
  802194:	ff d0                	callq  *%rax
  802196:	48 83 c4 10          	add    $0x10,%rsp
  80219a:	c9                   	leaveq 
  80219b:	c3                   	retq   

000000000080219c <sys_ept_map>:
  80219c:	55                   	push   %rbp
  80219d:	48 89 e5             	mov    %rsp,%rbp
  8021a0:	48 83 ec 20          	sub    $0x20,%rsp
  8021a4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8021a7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8021ab:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8021ae:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  8021b2:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  8021b6:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8021b9:	48 63 c8             	movslq %eax,%rcx
  8021bc:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  8021c0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8021c3:	48 63 f0             	movslq %eax,%rsi
  8021c6:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8021ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8021cd:	48 98                	cltq   
  8021cf:	48 83 ec 08          	sub    $0x8,%rsp
  8021d3:	51                   	push   %rcx
  8021d4:	49 89 f9             	mov    %rdi,%r9
  8021d7:	49 89 f0             	mov    %rsi,%r8
  8021da:	48 89 d1             	mov    %rdx,%rcx
  8021dd:	48 89 c2             	mov    %rax,%rdx
  8021e0:	be 00 00 00 00       	mov    $0x0,%esi
  8021e5:	bf 11 00 00 00       	mov    $0x11,%edi
  8021ea:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  8021f1:	00 00 00 
  8021f4:	ff d0                	callq  *%rax
  8021f6:	48 83 c4 10          	add    $0x10,%rsp
  8021fa:	c9                   	leaveq 
  8021fb:	c3                   	retq   

00000000008021fc <sys_env_mkguest>:
  8021fc:	55                   	push   %rbp
  8021fd:	48 89 e5             	mov    %rsp,%rbp
  802200:	48 83 ec 10          	sub    $0x10,%rsp
  802204:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802208:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80220c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802210:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802214:	48 83 ec 08          	sub    $0x8,%rsp
  802218:	6a 00                	pushq  $0x0
  80221a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  802220:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  802226:	48 89 d1             	mov    %rdx,%rcx
  802229:	48 89 c2             	mov    %rax,%rdx
  80222c:	be 00 00 00 00       	mov    $0x0,%esi
  802231:	bf 12 00 00 00       	mov    $0x12,%edi
  802236:	48 b8 76 1c 80 00 00 	movabs $0x801c76,%rax
  80223d:	00 00 00 
  802240:	ff d0                	callq  *%rax
  802242:	48 83 c4 10          	add    $0x10,%rsp
  802246:	c9                   	leaveq 
  802247:	c3                   	retq   

0000000000802248 <fd2num>:
  802248:	55                   	push   %rbp
  802249:	48 89 e5             	mov    %rsp,%rbp
  80224c:	48 83 ec 08          	sub    $0x8,%rsp
  802250:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802254:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  802258:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  80225f:	ff ff ff 
  802262:	48 01 d0             	add    %rdx,%rax
  802265:	48 c1 e8 0c          	shr    $0xc,%rax
  802269:	c9                   	leaveq 
  80226a:	c3                   	retq   

000000000080226b <fd2data>:
  80226b:	55                   	push   %rbp
  80226c:	48 89 e5             	mov    %rsp,%rbp
  80226f:	48 83 ec 08          	sub    $0x8,%rsp
  802273:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802277:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80227b:	48 89 c7             	mov    %rax,%rdi
  80227e:	48 b8 48 22 80 00 00 	movabs $0x802248,%rax
  802285:	00 00 00 
  802288:	ff d0                	callq  *%rax
  80228a:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  802290:	48 c1 e0 0c          	shl    $0xc,%rax
  802294:	c9                   	leaveq 
  802295:	c3                   	retq   

0000000000802296 <fd_alloc>:
  802296:	55                   	push   %rbp
  802297:	48 89 e5             	mov    %rsp,%rbp
  80229a:	48 83 ec 18          	sub    $0x18,%rsp
  80229e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8022a2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8022a9:	eb 6b                	jmp    802316 <fd_alloc+0x80>
  8022ab:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022ae:	48 98                	cltq   
  8022b0:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  8022b6:	48 c1 e0 0c          	shl    $0xc,%rax
  8022ba:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8022be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022c2:	48 c1 e8 15          	shr    $0x15,%rax
  8022c6:	48 89 c2             	mov    %rax,%rdx
  8022c9:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8022d0:	01 00 00 
  8022d3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022d7:	83 e0 01             	and    $0x1,%eax
  8022da:	48 85 c0             	test   %rax,%rax
  8022dd:	74 21                	je     802300 <fd_alloc+0x6a>
  8022df:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8022e3:	48 c1 e8 0c          	shr    $0xc,%rax
  8022e7:	48 89 c2             	mov    %rax,%rdx
  8022ea:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8022f1:	01 00 00 
  8022f4:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8022f8:	83 e0 01             	and    $0x1,%eax
  8022fb:	48 85 c0             	test   %rax,%rax
  8022fe:	75 12                	jne    802312 <fd_alloc+0x7c>
  802300:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802304:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802308:	48 89 10             	mov    %rdx,(%rax)
  80230b:	b8 00 00 00 00       	mov    $0x0,%eax
  802310:	eb 1a                	jmp    80232c <fd_alloc+0x96>
  802312:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802316:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  80231a:	7e 8f                	jle    8022ab <fd_alloc+0x15>
  80231c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802320:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802327:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  80232c:	c9                   	leaveq 
  80232d:	c3                   	retq   

000000000080232e <fd_lookup>:
  80232e:	55                   	push   %rbp
  80232f:	48 89 e5             	mov    %rsp,%rbp
  802332:	48 83 ec 20          	sub    $0x20,%rsp
  802336:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802339:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80233d:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802341:	78 06                	js     802349 <fd_lookup+0x1b>
  802343:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  802347:	7e 07                	jle    802350 <fd_lookup+0x22>
  802349:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80234e:	eb 6c                	jmp    8023bc <fd_lookup+0x8e>
  802350:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802353:	48 98                	cltq   
  802355:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80235b:	48 c1 e0 0c          	shl    $0xc,%rax
  80235f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802363:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802367:	48 c1 e8 15          	shr    $0x15,%rax
  80236b:	48 89 c2             	mov    %rax,%rdx
  80236e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802375:	01 00 00 
  802378:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80237c:	83 e0 01             	and    $0x1,%eax
  80237f:	48 85 c0             	test   %rax,%rax
  802382:	74 21                	je     8023a5 <fd_lookup+0x77>
  802384:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802388:	48 c1 e8 0c          	shr    $0xc,%rax
  80238c:	48 89 c2             	mov    %rax,%rdx
  80238f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802396:	01 00 00 
  802399:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80239d:	83 e0 01             	and    $0x1,%eax
  8023a0:	48 85 c0             	test   %rax,%rax
  8023a3:	75 07                	jne    8023ac <fd_lookup+0x7e>
  8023a5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8023aa:	eb 10                	jmp    8023bc <fd_lookup+0x8e>
  8023ac:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023b0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8023b4:	48 89 10             	mov    %rdx,(%rax)
  8023b7:	b8 00 00 00 00       	mov    $0x0,%eax
  8023bc:	c9                   	leaveq 
  8023bd:	c3                   	retq   

00000000008023be <fd_close>:
  8023be:	55                   	push   %rbp
  8023bf:	48 89 e5             	mov    %rsp,%rbp
  8023c2:	48 83 ec 30          	sub    $0x30,%rsp
  8023c6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8023ca:	89 f0                	mov    %esi,%eax
  8023cc:	88 45 d4             	mov    %al,-0x2c(%rbp)
  8023cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8023d3:	48 89 c7             	mov    %rax,%rdi
  8023d6:	48 b8 48 22 80 00 00 	movabs $0x802248,%rax
  8023dd:	00 00 00 
  8023e0:	ff d0                	callq  *%rax
  8023e2:	89 c2                	mov    %eax,%edx
  8023e4:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8023e8:	48 89 c6             	mov    %rax,%rsi
  8023eb:	89 d7                	mov    %edx,%edi
  8023ed:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  8023f4:	00 00 00 
  8023f7:	ff d0                	callq  *%rax
  8023f9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8023fc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802400:	78 0a                	js     80240c <fd_close+0x4e>
  802402:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802406:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  80240a:	74 12                	je     80241e <fd_close+0x60>
  80240c:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  802410:	74 05                	je     802417 <fd_close+0x59>
  802412:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802415:	eb 70                	jmp    802487 <fd_close+0xc9>
  802417:	b8 00 00 00 00       	mov    $0x0,%eax
  80241c:	eb 69                	jmp    802487 <fd_close+0xc9>
  80241e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802422:	8b 00                	mov    (%rax),%eax
  802424:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802428:	48 89 d6             	mov    %rdx,%rsi
  80242b:	89 c7                	mov    %eax,%edi
  80242d:	48 b8 89 24 80 00 00 	movabs $0x802489,%rax
  802434:	00 00 00 
  802437:	ff d0                	callq  *%rax
  802439:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80243c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802440:	78 2a                	js     80246c <fd_close+0xae>
  802442:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802446:	48 8b 40 20          	mov    0x20(%rax),%rax
  80244a:	48 85 c0             	test   %rax,%rax
  80244d:	74 16                	je     802465 <fd_close+0xa7>
  80244f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802453:	48 8b 40 20          	mov    0x20(%rax),%rax
  802457:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80245b:	48 89 d7             	mov    %rdx,%rdi
  80245e:	ff d0                	callq  *%rax
  802460:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802463:	eb 07                	jmp    80246c <fd_close+0xae>
  802465:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80246c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802470:	48 89 c6             	mov    %rax,%rsi
  802473:	bf 00 00 00 00       	mov    $0x0,%edi
  802478:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  80247f:	00 00 00 
  802482:	ff d0                	callq  *%rax
  802484:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802487:	c9                   	leaveq 
  802488:	c3                   	retq   

0000000000802489 <dev_lookup>:
  802489:	55                   	push   %rbp
  80248a:	48 89 e5             	mov    %rsp,%rbp
  80248d:	48 83 ec 20          	sub    $0x20,%rsp
  802491:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802494:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802498:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80249f:	eb 41                	jmp    8024e2 <dev_lookup+0x59>
  8024a1:	48 b8 c0 87 80 00 00 	movabs $0x8087c0,%rax
  8024a8:	00 00 00 
  8024ab:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024ae:	48 63 d2             	movslq %edx,%rdx
  8024b1:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024b5:	8b 00                	mov    (%rax),%eax
  8024b7:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  8024ba:	75 22                	jne    8024de <dev_lookup+0x55>
  8024bc:	48 b8 c0 87 80 00 00 	movabs $0x8087c0,%rax
  8024c3:	00 00 00 
  8024c6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024c9:	48 63 d2             	movslq %edx,%rdx
  8024cc:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  8024d0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8024d4:	48 89 10             	mov    %rdx,(%rax)
  8024d7:	b8 00 00 00 00       	mov    $0x0,%eax
  8024dc:	eb 60                	jmp    80253e <dev_lookup+0xb5>
  8024de:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8024e2:	48 b8 c0 87 80 00 00 	movabs $0x8087c0,%rax
  8024e9:	00 00 00 
  8024ec:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8024ef:	48 63 d2             	movslq %edx,%rdx
  8024f2:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8024f6:	48 85 c0             	test   %rax,%rax
  8024f9:	75 a6                	jne    8024a1 <dev_lookup+0x18>
  8024fb:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  802502:	00 00 00 
  802505:	48 8b 00             	mov    (%rax),%rax
  802508:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80250e:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802511:	89 c6                	mov    %eax,%esi
  802513:	48 bf b8 55 80 00 00 	movabs $0x8055b8,%rdi
  80251a:	00 00 00 
  80251d:	b8 00 00 00 00       	mov    $0x0,%eax
  802522:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  802529:	00 00 00 
  80252c:	ff d1                	callq  *%rcx
  80252e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802532:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802539:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80253e:	c9                   	leaveq 
  80253f:	c3                   	retq   

0000000000802540 <close>:
  802540:	55                   	push   %rbp
  802541:	48 89 e5             	mov    %rsp,%rbp
  802544:	48 83 ec 20          	sub    $0x20,%rsp
  802548:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80254b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80254f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802552:	48 89 d6             	mov    %rdx,%rsi
  802555:	89 c7                	mov    %eax,%edi
  802557:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  80255e:	00 00 00 
  802561:	ff d0                	callq  *%rax
  802563:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802566:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80256a:	79 05                	jns    802571 <close+0x31>
  80256c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80256f:	eb 18                	jmp    802589 <close+0x49>
  802571:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802575:	be 01 00 00 00       	mov    $0x1,%esi
  80257a:	48 89 c7             	mov    %rax,%rdi
  80257d:	48 b8 be 23 80 00 00 	movabs $0x8023be,%rax
  802584:	00 00 00 
  802587:	ff d0                	callq  *%rax
  802589:	c9                   	leaveq 
  80258a:	c3                   	retq   

000000000080258b <close_all>:
  80258b:	55                   	push   %rbp
  80258c:	48 89 e5             	mov    %rsp,%rbp
  80258f:	48 83 ec 10          	sub    $0x10,%rsp
  802593:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  80259a:	eb 15                	jmp    8025b1 <close_all+0x26>
  80259c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80259f:	89 c7                	mov    %eax,%edi
  8025a1:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  8025a8:	00 00 00 
  8025ab:	ff d0                	callq  *%rax
  8025ad:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  8025b1:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  8025b5:	7e e5                	jle    80259c <close_all+0x11>
  8025b7:	90                   	nop
  8025b8:	c9                   	leaveq 
  8025b9:	c3                   	retq   

00000000008025ba <dup>:
  8025ba:	55                   	push   %rbp
  8025bb:	48 89 e5             	mov    %rsp,%rbp
  8025be:	48 83 ec 40          	sub    $0x40,%rsp
  8025c2:	89 7d cc             	mov    %edi,-0x34(%rbp)
  8025c5:	89 75 c8             	mov    %esi,-0x38(%rbp)
  8025c8:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  8025cc:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8025cf:	48 89 d6             	mov    %rdx,%rsi
  8025d2:	89 c7                	mov    %eax,%edi
  8025d4:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  8025db:	00 00 00 
  8025de:	ff d0                	callq  *%rax
  8025e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8025e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8025e7:	79 08                	jns    8025f1 <dup+0x37>
  8025e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8025ec:	e9 70 01 00 00       	jmpq   802761 <dup+0x1a7>
  8025f1:	8b 45 c8             	mov    -0x38(%rbp),%eax
  8025f4:	89 c7                	mov    %eax,%edi
  8025f6:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  8025fd:	00 00 00 
  802600:	ff d0                	callq  *%rax
  802602:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802605:	48 98                	cltq   
  802607:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80260d:	48 c1 e0 0c          	shl    $0xc,%rax
  802611:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802615:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802619:	48 89 c7             	mov    %rax,%rdi
  80261c:	48 b8 6b 22 80 00 00 	movabs $0x80226b,%rax
  802623:	00 00 00 
  802626:	ff d0                	callq  *%rax
  802628:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80262c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802630:	48 89 c7             	mov    %rax,%rdi
  802633:	48 b8 6b 22 80 00 00 	movabs $0x80226b,%rax
  80263a:	00 00 00 
  80263d:	ff d0                	callq  *%rax
  80263f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  802643:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802647:	48 c1 e8 15          	shr    $0x15,%rax
  80264b:	48 89 c2             	mov    %rax,%rdx
  80264e:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  802655:	01 00 00 
  802658:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80265c:	83 e0 01             	and    $0x1,%eax
  80265f:	48 85 c0             	test   %rax,%rax
  802662:	74 71                	je     8026d5 <dup+0x11b>
  802664:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802668:	48 c1 e8 0c          	shr    $0xc,%rax
  80266c:	48 89 c2             	mov    %rax,%rdx
  80266f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802676:	01 00 00 
  802679:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80267d:	83 e0 01             	and    $0x1,%eax
  802680:	48 85 c0             	test   %rax,%rax
  802683:	74 50                	je     8026d5 <dup+0x11b>
  802685:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802689:	48 c1 e8 0c          	shr    $0xc,%rax
  80268d:	48 89 c2             	mov    %rax,%rdx
  802690:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802697:	01 00 00 
  80269a:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80269e:	25 07 0e 00 00       	and    $0xe07,%eax
  8026a3:	89 c1                	mov    %eax,%ecx
  8026a5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8026a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026ad:	41 89 c8             	mov    %ecx,%r8d
  8026b0:	48 89 d1             	mov    %rdx,%rcx
  8026b3:	ba 00 00 00 00       	mov    $0x0,%edx
  8026b8:	48 89 c6             	mov    %rax,%rsi
  8026bb:	bf 00 00 00 00       	mov    $0x0,%edi
  8026c0:	48 b8 9e 1e 80 00 00 	movabs $0x801e9e,%rax
  8026c7:	00 00 00 
  8026ca:	ff d0                	callq  *%rax
  8026cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026cf:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026d3:	78 55                	js     80272a <dup+0x170>
  8026d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026d9:	48 c1 e8 0c          	shr    $0xc,%rax
  8026dd:	48 89 c2             	mov    %rax,%rdx
  8026e0:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8026e7:	01 00 00 
  8026ea:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8026ee:	25 07 0e 00 00       	and    $0xe07,%eax
  8026f3:	89 c1                	mov    %eax,%ecx
  8026f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8026f9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8026fd:	41 89 c8             	mov    %ecx,%r8d
  802700:	48 89 d1             	mov    %rdx,%rcx
  802703:	ba 00 00 00 00       	mov    $0x0,%edx
  802708:	48 89 c6             	mov    %rax,%rsi
  80270b:	bf 00 00 00 00       	mov    $0x0,%edi
  802710:	48 b8 9e 1e 80 00 00 	movabs $0x801e9e,%rax
  802717:	00 00 00 
  80271a:	ff d0                	callq  *%rax
  80271c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80271f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802723:	78 08                	js     80272d <dup+0x173>
  802725:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802728:	eb 37                	jmp    802761 <dup+0x1a7>
  80272a:	90                   	nop
  80272b:	eb 01                	jmp    80272e <dup+0x174>
  80272d:	90                   	nop
  80272e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802732:	48 89 c6             	mov    %rax,%rsi
  802735:	bf 00 00 00 00       	mov    $0x0,%edi
  80273a:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  802741:	00 00 00 
  802744:	ff d0                	callq  *%rax
  802746:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80274a:	48 89 c6             	mov    %rax,%rsi
  80274d:	bf 00 00 00 00       	mov    $0x0,%edi
  802752:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  802759:	00 00 00 
  80275c:	ff d0                	callq  *%rax
  80275e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802761:	c9                   	leaveq 
  802762:	c3                   	retq   

0000000000802763 <read>:
  802763:	55                   	push   %rbp
  802764:	48 89 e5             	mov    %rsp,%rbp
  802767:	48 83 ec 40          	sub    $0x40,%rsp
  80276b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80276e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802772:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802776:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  80277a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80277d:	48 89 d6             	mov    %rdx,%rsi
  802780:	89 c7                	mov    %eax,%edi
  802782:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  802789:	00 00 00 
  80278c:	ff d0                	callq  *%rax
  80278e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802791:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802795:	78 24                	js     8027bb <read+0x58>
  802797:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80279b:	8b 00                	mov    (%rax),%eax
  80279d:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8027a1:	48 89 d6             	mov    %rdx,%rsi
  8027a4:	89 c7                	mov    %eax,%edi
  8027a6:	48 b8 89 24 80 00 00 	movabs $0x802489,%rax
  8027ad:	00 00 00 
  8027b0:	ff d0                	callq  *%rax
  8027b2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027b5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027b9:	79 05                	jns    8027c0 <read+0x5d>
  8027bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027be:	eb 76                	jmp    802836 <read+0xd3>
  8027c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027c4:	8b 40 08             	mov    0x8(%rax),%eax
  8027c7:	83 e0 03             	and    $0x3,%eax
  8027ca:	83 f8 01             	cmp    $0x1,%eax
  8027cd:	75 3a                	jne    802809 <read+0xa6>
  8027cf:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  8027d6:	00 00 00 
  8027d9:	48 8b 00             	mov    (%rax),%rax
  8027dc:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  8027e2:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8027e5:	89 c6                	mov    %eax,%esi
  8027e7:	48 bf d7 55 80 00 00 	movabs $0x8055d7,%rdi
  8027ee:	00 00 00 
  8027f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8027f6:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  8027fd:	00 00 00 
  802800:	ff d1                	callq  *%rcx
  802802:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802807:	eb 2d                	jmp    802836 <read+0xd3>
  802809:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80280d:	48 8b 40 10          	mov    0x10(%rax),%rax
  802811:	48 85 c0             	test   %rax,%rax
  802814:	75 07                	jne    80281d <read+0xba>
  802816:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80281b:	eb 19                	jmp    802836 <read+0xd3>
  80281d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802821:	48 8b 40 10          	mov    0x10(%rax),%rax
  802825:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802829:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80282d:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  802831:	48 89 cf             	mov    %rcx,%rdi
  802834:	ff d0                	callq  *%rax
  802836:	c9                   	leaveq 
  802837:	c3                   	retq   

0000000000802838 <readn>:
  802838:	55                   	push   %rbp
  802839:	48 89 e5             	mov    %rsp,%rbp
  80283c:	48 83 ec 30          	sub    $0x30,%rsp
  802840:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802843:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802847:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80284b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  802852:	eb 47                	jmp    80289b <readn+0x63>
  802854:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802857:	48 98                	cltq   
  802859:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  80285d:	48 29 c2             	sub    %rax,%rdx
  802860:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802863:	48 63 c8             	movslq %eax,%rcx
  802866:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80286a:	48 01 c1             	add    %rax,%rcx
  80286d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802870:	48 89 ce             	mov    %rcx,%rsi
  802873:	89 c7                	mov    %eax,%edi
  802875:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  80287c:	00 00 00 
  80287f:	ff d0                	callq  *%rax
  802881:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802884:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802888:	79 05                	jns    80288f <readn+0x57>
  80288a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80288d:	eb 1d                	jmp    8028ac <readn+0x74>
  80288f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802893:	74 13                	je     8028a8 <readn+0x70>
  802895:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802898:	01 45 fc             	add    %eax,-0x4(%rbp)
  80289b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80289e:	48 98                	cltq   
  8028a0:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  8028a4:	72 ae                	jb     802854 <readn+0x1c>
  8028a6:	eb 01                	jmp    8028a9 <readn+0x71>
  8028a8:	90                   	nop
  8028a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8028ac:	c9                   	leaveq 
  8028ad:	c3                   	retq   

00000000008028ae <write>:
  8028ae:	55                   	push   %rbp
  8028af:	48 89 e5             	mov    %rsp,%rbp
  8028b2:	48 83 ec 40          	sub    $0x40,%rsp
  8028b6:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8028b9:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8028bd:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8028c1:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8028c5:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8028c8:	48 89 d6             	mov    %rdx,%rsi
  8028cb:	89 c7                	mov    %eax,%edi
  8028cd:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  8028d4:	00 00 00 
  8028d7:	ff d0                	callq  *%rax
  8028d9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8028e0:	78 24                	js     802906 <write+0x58>
  8028e2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028e6:	8b 00                	mov    (%rax),%eax
  8028e8:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8028ec:	48 89 d6             	mov    %rdx,%rsi
  8028ef:	89 c7                	mov    %eax,%edi
  8028f1:	48 b8 89 24 80 00 00 	movabs $0x802489,%rax
  8028f8:	00 00 00 
  8028fb:	ff d0                	callq  *%rax
  8028fd:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802900:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802904:	79 05                	jns    80290b <write+0x5d>
  802906:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802909:	eb 75                	jmp    802980 <write+0xd2>
  80290b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80290f:	8b 40 08             	mov    0x8(%rax),%eax
  802912:	83 e0 03             	and    $0x3,%eax
  802915:	85 c0                	test   %eax,%eax
  802917:	75 3a                	jne    802953 <write+0xa5>
  802919:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  802920:	00 00 00 
  802923:	48 8b 00             	mov    (%rax),%rax
  802926:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80292c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80292f:	89 c6                	mov    %eax,%esi
  802931:	48 bf f3 55 80 00 00 	movabs $0x8055f3,%rdi
  802938:	00 00 00 
  80293b:	b8 00 00 00 00       	mov    $0x0,%eax
  802940:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  802947:	00 00 00 
  80294a:	ff d1                	callq  *%rcx
  80294c:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802951:	eb 2d                	jmp    802980 <write+0xd2>
  802953:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802957:	48 8b 40 18          	mov    0x18(%rax),%rax
  80295b:	48 85 c0             	test   %rax,%rax
  80295e:	75 07                	jne    802967 <write+0xb9>
  802960:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802965:	eb 19                	jmp    802980 <write+0xd2>
  802967:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80296b:	48 8b 40 18          	mov    0x18(%rax),%rax
  80296f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802973:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802977:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80297b:	48 89 cf             	mov    %rcx,%rdi
  80297e:	ff d0                	callq  *%rax
  802980:	c9                   	leaveq 
  802981:	c3                   	retq   

0000000000802982 <seek>:
  802982:	55                   	push   %rbp
  802983:	48 89 e5             	mov    %rsp,%rbp
  802986:	48 83 ec 18          	sub    $0x18,%rsp
  80298a:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80298d:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802990:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802994:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802997:	48 89 d6             	mov    %rdx,%rsi
  80299a:	89 c7                	mov    %eax,%edi
  80299c:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  8029a3:	00 00 00 
  8029a6:	ff d0                	callq  *%rax
  8029a8:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029ab:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029af:	79 05                	jns    8029b6 <seek+0x34>
  8029b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029b4:	eb 0f                	jmp    8029c5 <seek+0x43>
  8029b6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029ba:	8b 55 e8             	mov    -0x18(%rbp),%edx
  8029bd:	89 50 04             	mov    %edx,0x4(%rax)
  8029c0:	b8 00 00 00 00       	mov    $0x0,%eax
  8029c5:	c9                   	leaveq 
  8029c6:	c3                   	retq   

00000000008029c7 <ftruncate>:
  8029c7:	55                   	push   %rbp
  8029c8:	48 89 e5             	mov    %rsp,%rbp
  8029cb:	48 83 ec 30          	sub    $0x30,%rsp
  8029cf:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8029d2:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8029d5:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8029d9:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8029dc:	48 89 d6             	mov    %rdx,%rsi
  8029df:	89 c7                	mov    %eax,%edi
  8029e1:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  8029e8:	00 00 00 
  8029eb:	ff d0                	callq  *%rax
  8029ed:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8029f0:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8029f4:	78 24                	js     802a1a <ftruncate+0x53>
  8029f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8029fa:	8b 00                	mov    (%rax),%eax
  8029fc:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802a00:	48 89 d6             	mov    %rdx,%rsi
  802a03:	89 c7                	mov    %eax,%edi
  802a05:	48 b8 89 24 80 00 00 	movabs $0x802489,%rax
  802a0c:	00 00 00 
  802a0f:	ff d0                	callq  *%rax
  802a11:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802a14:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802a18:	79 05                	jns    802a1f <ftruncate+0x58>
  802a1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802a1d:	eb 72                	jmp    802a91 <ftruncate+0xca>
  802a1f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802a23:	8b 40 08             	mov    0x8(%rax),%eax
  802a26:	83 e0 03             	and    $0x3,%eax
  802a29:	85 c0                	test   %eax,%eax
  802a2b:	75 3a                	jne    802a67 <ftruncate+0xa0>
  802a2d:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  802a34:	00 00 00 
  802a37:	48 8b 00             	mov    (%rax),%rax
  802a3a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802a40:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802a43:	89 c6                	mov    %eax,%esi
  802a45:	48 bf 10 56 80 00 00 	movabs $0x805610,%rdi
  802a4c:	00 00 00 
  802a4f:	b8 00 00 00 00       	mov    $0x0,%eax
  802a54:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  802a5b:	00 00 00 
  802a5e:	ff d1                	callq  *%rcx
  802a60:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802a65:	eb 2a                	jmp    802a91 <ftruncate+0xca>
  802a67:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a6b:	48 8b 40 30          	mov    0x30(%rax),%rax
  802a6f:	48 85 c0             	test   %rax,%rax
  802a72:	75 07                	jne    802a7b <ftruncate+0xb4>
  802a74:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802a79:	eb 16                	jmp    802a91 <ftruncate+0xca>
  802a7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802a7f:	48 8b 40 30          	mov    0x30(%rax),%rax
  802a83:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802a87:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  802a8a:	89 ce                	mov    %ecx,%esi
  802a8c:	48 89 d7             	mov    %rdx,%rdi
  802a8f:	ff d0                	callq  *%rax
  802a91:	c9                   	leaveq 
  802a92:	c3                   	retq   

0000000000802a93 <fstat>:
  802a93:	55                   	push   %rbp
  802a94:	48 89 e5             	mov    %rsp,%rbp
  802a97:	48 83 ec 30          	sub    $0x30,%rsp
  802a9b:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802a9e:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802aa2:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802aa6:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802aa9:	48 89 d6             	mov    %rdx,%rsi
  802aac:	89 c7                	mov    %eax,%edi
  802aae:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  802ab5:	00 00 00 
  802ab8:	ff d0                	callq  *%rax
  802aba:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802abd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ac1:	78 24                	js     802ae7 <fstat+0x54>
  802ac3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802ac7:	8b 00                	mov    (%rax),%eax
  802ac9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802acd:	48 89 d6             	mov    %rdx,%rsi
  802ad0:	89 c7                	mov    %eax,%edi
  802ad2:	48 b8 89 24 80 00 00 	movabs $0x802489,%rax
  802ad9:	00 00 00 
  802adc:	ff d0                	callq  *%rax
  802ade:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ae1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ae5:	79 05                	jns    802aec <fstat+0x59>
  802ae7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802aea:	eb 5e                	jmp    802b4a <fstat+0xb7>
  802aec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802af0:	48 8b 40 28          	mov    0x28(%rax),%rax
  802af4:	48 85 c0             	test   %rax,%rax
  802af7:	75 07                	jne    802b00 <fstat+0x6d>
  802af9:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802afe:	eb 4a                	jmp    802b4a <fstat+0xb7>
  802b00:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b04:	c6 00 00             	movb   $0x0,(%rax)
  802b07:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b0b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802b12:	00 00 00 
  802b15:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b19:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  802b20:	00 00 00 
  802b23:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802b27:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802b2b:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802b32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802b36:	48 8b 40 28          	mov    0x28(%rax),%rax
  802b3a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  802b3e:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  802b42:	48 89 ce             	mov    %rcx,%rsi
  802b45:	48 89 d7             	mov    %rdx,%rdi
  802b48:	ff d0                	callq  *%rax
  802b4a:	c9                   	leaveq 
  802b4b:	c3                   	retq   

0000000000802b4c <stat>:
  802b4c:	55                   	push   %rbp
  802b4d:	48 89 e5             	mov    %rsp,%rbp
  802b50:	48 83 ec 20          	sub    $0x20,%rsp
  802b54:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802b58:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802b5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802b60:	be 00 00 00 00       	mov    $0x0,%esi
  802b65:	48 89 c7             	mov    %rax,%rdi
  802b68:	48 b8 3c 2c 80 00 00 	movabs $0x802c3c,%rax
  802b6f:	00 00 00 
  802b72:	ff d0                	callq  *%rax
  802b74:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802b77:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802b7b:	79 05                	jns    802b82 <stat+0x36>
  802b7d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b80:	eb 2f                	jmp    802bb1 <stat+0x65>
  802b82:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802b86:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802b89:	48 89 d6             	mov    %rdx,%rsi
  802b8c:	89 c7                	mov    %eax,%edi
  802b8e:	48 b8 93 2a 80 00 00 	movabs $0x802a93,%rax
  802b95:	00 00 00 
  802b98:	ff d0                	callq  *%rax
  802b9a:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802b9d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ba0:	89 c7                	mov    %eax,%edi
  802ba2:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  802ba9:	00 00 00 
  802bac:	ff d0                	callq  *%rax
  802bae:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802bb1:	c9                   	leaveq 
  802bb2:	c3                   	retq   

0000000000802bb3 <fsipc>:
  802bb3:	55                   	push   %rbp
  802bb4:	48 89 e5             	mov    %rsp,%rbp
  802bb7:	48 83 ec 10          	sub    $0x10,%rsp
  802bbb:	89 7d fc             	mov    %edi,-0x4(%rbp)
  802bbe:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802bc2:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802bc9:	00 00 00 
  802bcc:	8b 00                	mov    (%rax),%eax
  802bce:	85 c0                	test   %eax,%eax
  802bd0:	75 1f                	jne    802bf1 <fsipc+0x3e>
  802bd2:	bf 01 00 00 00       	mov    $0x1,%edi
  802bd7:	48 b8 11 4e 80 00 00 	movabs $0x804e11,%rax
  802bde:	00 00 00 
  802be1:	ff d0                	callq  *%rax
  802be3:	89 c2                	mov    %eax,%edx
  802be5:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802bec:	00 00 00 
  802bef:	89 10                	mov    %edx,(%rax)
  802bf1:	48 b8 00 90 80 00 00 	movabs $0x809000,%rax
  802bf8:	00 00 00 
  802bfb:	8b 00                	mov    (%rax),%eax
  802bfd:	8b 75 fc             	mov    -0x4(%rbp),%esi
  802c00:	b9 07 00 00 00       	mov    $0x7,%ecx
  802c05:	48 ba 00 b0 80 00 00 	movabs $0x80b000,%rdx
  802c0c:	00 00 00 
  802c0f:	89 c7                	mov    %eax,%edi
  802c11:	48 b8 07 4d 80 00 00 	movabs $0x804d07,%rax
  802c18:	00 00 00 
  802c1b:	ff d0                	callq  *%rax
  802c1d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802c21:	ba 00 00 00 00       	mov    $0x0,%edx
  802c26:	48 89 c6             	mov    %rax,%rsi
  802c29:	bf 00 00 00 00       	mov    $0x0,%edi
  802c2e:	48 b8 46 4c 80 00 00 	movabs $0x804c46,%rax
  802c35:	00 00 00 
  802c38:	ff d0                	callq  *%rax
  802c3a:	c9                   	leaveq 
  802c3b:	c3                   	retq   

0000000000802c3c <open>:
  802c3c:	55                   	push   %rbp
  802c3d:	48 89 e5             	mov    %rsp,%rbp
  802c40:	48 83 ec 20          	sub    $0x20,%rsp
  802c44:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802c48:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  802c4b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c4f:	48 89 c7             	mov    %rax,%rdi
  802c52:	48 b8 b0 14 80 00 00 	movabs $0x8014b0,%rax
  802c59:	00 00 00 
  802c5c:	ff d0                	callq  *%rax
  802c5e:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802c63:	7e 0a                	jle    802c6f <open+0x33>
  802c65:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802c6a:	e9 a5 00 00 00       	jmpq   802d14 <open+0xd8>
  802c6f:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802c73:	48 89 c7             	mov    %rax,%rdi
  802c76:	48 b8 96 22 80 00 00 	movabs $0x802296,%rax
  802c7d:	00 00 00 
  802c80:	ff d0                	callq  *%rax
  802c82:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c85:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c89:	79 08                	jns    802c93 <open+0x57>
  802c8b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c8e:	e9 81 00 00 00       	jmpq   802d14 <open+0xd8>
  802c93:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802c97:	48 89 c6             	mov    %rax,%rsi
  802c9a:	48 bf 00 b0 80 00 00 	movabs $0x80b000,%rdi
  802ca1:	00 00 00 
  802ca4:	48 b8 1c 15 80 00 00 	movabs $0x80151c,%rax
  802cab:	00 00 00 
  802cae:	ff d0                	callq  *%rax
  802cb0:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802cb7:	00 00 00 
  802cba:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  802cbd:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802cc3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802cc7:	48 89 c6             	mov    %rax,%rsi
  802cca:	bf 01 00 00 00       	mov    $0x1,%edi
  802ccf:	48 b8 b3 2b 80 00 00 	movabs $0x802bb3,%rax
  802cd6:	00 00 00 
  802cd9:	ff d0                	callq  *%rax
  802cdb:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802cde:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ce2:	79 1d                	jns    802d01 <open+0xc5>
  802ce4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ce8:	be 00 00 00 00       	mov    $0x0,%esi
  802ced:	48 89 c7             	mov    %rax,%rdi
  802cf0:	48 b8 be 23 80 00 00 	movabs $0x8023be,%rax
  802cf7:	00 00 00 
  802cfa:	ff d0                	callq  *%rax
  802cfc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cff:	eb 13                	jmp    802d14 <open+0xd8>
  802d01:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802d05:	48 89 c7             	mov    %rax,%rdi
  802d08:	48 b8 48 22 80 00 00 	movabs $0x802248,%rax
  802d0f:	00 00 00 
  802d12:	ff d0                	callq  *%rax
  802d14:	c9                   	leaveq 
  802d15:	c3                   	retq   

0000000000802d16 <devfile_flush>:
  802d16:	55                   	push   %rbp
  802d17:	48 89 e5             	mov    %rsp,%rbp
  802d1a:	48 83 ec 10          	sub    $0x10,%rsp
  802d1e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802d22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802d26:	8b 50 0c             	mov    0xc(%rax),%edx
  802d29:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802d30:	00 00 00 
  802d33:	89 10                	mov    %edx,(%rax)
  802d35:	be 00 00 00 00       	mov    $0x0,%esi
  802d3a:	bf 06 00 00 00       	mov    $0x6,%edi
  802d3f:	48 b8 b3 2b 80 00 00 	movabs $0x802bb3,%rax
  802d46:	00 00 00 
  802d49:	ff d0                	callq  *%rax
  802d4b:	c9                   	leaveq 
  802d4c:	c3                   	retq   

0000000000802d4d <devfile_read>:
  802d4d:	55                   	push   %rbp
  802d4e:	48 89 e5             	mov    %rsp,%rbp
  802d51:	48 83 ec 30          	sub    $0x30,%rsp
  802d55:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802d59:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802d5d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802d61:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802d65:	8b 50 0c             	mov    0xc(%rax),%edx
  802d68:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802d6f:	00 00 00 
  802d72:	89 10                	mov    %edx,(%rax)
  802d74:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802d7b:	00 00 00 
  802d7e:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802d82:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802d86:	be 00 00 00 00       	mov    $0x0,%esi
  802d8b:	bf 03 00 00 00       	mov    $0x3,%edi
  802d90:	48 b8 b3 2b 80 00 00 	movabs $0x802bb3,%rax
  802d97:	00 00 00 
  802d9a:	ff d0                	callq  *%rax
  802d9c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802d9f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802da3:	79 08                	jns    802dad <devfile_read+0x60>
  802da5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802da8:	e9 a4 00 00 00       	jmpq   802e51 <devfile_read+0x104>
  802dad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802db0:	48 98                	cltq   
  802db2:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802db6:	76 35                	jbe    802ded <devfile_read+0xa0>
  802db8:	48 b9 36 56 80 00 00 	movabs $0x805636,%rcx
  802dbf:	00 00 00 
  802dc2:	48 ba 3d 56 80 00 00 	movabs $0x80563d,%rdx
  802dc9:	00 00 00 
  802dcc:	be 89 00 00 00       	mov    $0x89,%esi
  802dd1:	48 bf 52 56 80 00 00 	movabs $0x805652,%rdi
  802dd8:	00 00 00 
  802ddb:	b8 00 00 00 00       	mov    $0x0,%eax
  802de0:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  802de7:	00 00 00 
  802dea:	41 ff d0             	callq  *%r8
  802ded:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802df4:	7e 35                	jle    802e2b <devfile_read+0xde>
  802df6:	48 b9 60 56 80 00 00 	movabs $0x805660,%rcx
  802dfd:	00 00 00 
  802e00:	48 ba 3d 56 80 00 00 	movabs $0x80563d,%rdx
  802e07:	00 00 00 
  802e0a:	be 8a 00 00 00       	mov    $0x8a,%esi
  802e0f:	48 bf 52 56 80 00 00 	movabs $0x805652,%rdi
  802e16:	00 00 00 
  802e19:	b8 00 00 00 00       	mov    $0x0,%eax
  802e1e:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  802e25:	00 00 00 
  802e28:	41 ff d0             	callq  *%r8
  802e2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e2e:	48 63 d0             	movslq %eax,%rdx
  802e31:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802e35:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  802e3c:	00 00 00 
  802e3f:	48 89 c7             	mov    %rax,%rdi
  802e42:	48 b8 41 18 80 00 00 	movabs $0x801841,%rax
  802e49:	00 00 00 
  802e4c:	ff d0                	callq  *%rax
  802e4e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e51:	c9                   	leaveq 
  802e52:	c3                   	retq   

0000000000802e53 <devfile_write>:
  802e53:	55                   	push   %rbp
  802e54:	48 89 e5             	mov    %rsp,%rbp
  802e57:	48 83 ec 40          	sub    $0x40,%rsp
  802e5b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  802e5f:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802e63:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  802e67:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  802e6b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  802e6f:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  802e76:	00 
  802e77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e7b:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  802e7f:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  802e84:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  802e88:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802e8c:	8b 50 0c             	mov    0xc(%rax),%edx
  802e8f:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802e96:	00 00 00 
  802e99:	89 10                	mov    %edx,(%rax)
  802e9b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802ea2:	00 00 00 
  802ea5:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802ea9:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802ead:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802eb1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802eb5:	48 89 c6             	mov    %rax,%rsi
  802eb8:	48 bf 10 b0 80 00 00 	movabs $0x80b010,%rdi
  802ebf:	00 00 00 
  802ec2:	48 b8 41 18 80 00 00 	movabs $0x801841,%rax
  802ec9:	00 00 00 
  802ecc:	ff d0                	callq  *%rax
  802ece:	be 00 00 00 00       	mov    $0x0,%esi
  802ed3:	bf 04 00 00 00       	mov    $0x4,%edi
  802ed8:	48 b8 b3 2b 80 00 00 	movabs $0x802bb3,%rax
  802edf:	00 00 00 
  802ee2:	ff d0                	callq  *%rax
  802ee4:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802ee7:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802eeb:	79 05                	jns    802ef2 <devfile_write+0x9f>
  802eed:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ef0:	eb 43                	jmp    802f35 <devfile_write+0xe2>
  802ef2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ef5:	48 98                	cltq   
  802ef7:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802efb:	76 35                	jbe    802f32 <devfile_write+0xdf>
  802efd:	48 b9 36 56 80 00 00 	movabs $0x805636,%rcx
  802f04:	00 00 00 
  802f07:	48 ba 3d 56 80 00 00 	movabs $0x80563d,%rdx
  802f0e:	00 00 00 
  802f11:	be a8 00 00 00       	mov    $0xa8,%esi
  802f16:	48 bf 52 56 80 00 00 	movabs $0x805652,%rdi
  802f1d:	00 00 00 
  802f20:	b8 00 00 00 00       	mov    $0x0,%eax
  802f25:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  802f2c:	00 00 00 
  802f2f:	41 ff d0             	callq  *%r8
  802f32:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f35:	c9                   	leaveq 
  802f36:	c3                   	retq   

0000000000802f37 <devfile_stat>:
  802f37:	55                   	push   %rbp
  802f38:	48 89 e5             	mov    %rsp,%rbp
  802f3b:	48 83 ec 20          	sub    $0x20,%rsp
  802f3f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802f43:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802f4b:	8b 50 0c             	mov    0xc(%rax),%edx
  802f4e:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802f55:	00 00 00 
  802f58:	89 10                	mov    %edx,(%rax)
  802f5a:	be 00 00 00 00       	mov    $0x0,%esi
  802f5f:	bf 05 00 00 00       	mov    $0x5,%edi
  802f64:	48 b8 b3 2b 80 00 00 	movabs $0x802bb3,%rax
  802f6b:	00 00 00 
  802f6e:	ff d0                	callq  *%rax
  802f70:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f73:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f77:	79 05                	jns    802f7e <devfile_stat+0x47>
  802f79:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f7c:	eb 56                	jmp    802fd4 <devfile_stat+0x9d>
  802f7e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802f82:	48 be 00 b0 80 00 00 	movabs $0x80b000,%rsi
  802f89:	00 00 00 
  802f8c:	48 89 c7             	mov    %rax,%rdi
  802f8f:	48 b8 1c 15 80 00 00 	movabs $0x80151c,%rax
  802f96:	00 00 00 
  802f99:	ff d0                	callq  *%rax
  802f9b:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802fa2:	00 00 00 
  802fa5:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802fab:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802faf:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802fb5:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802fbc:	00 00 00 
  802fbf:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802fc5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802fc9:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802fcf:	b8 00 00 00 00       	mov    $0x0,%eax
  802fd4:	c9                   	leaveq 
  802fd5:	c3                   	retq   

0000000000802fd6 <devfile_trunc>:
  802fd6:	55                   	push   %rbp
  802fd7:	48 89 e5             	mov    %rsp,%rbp
  802fda:	48 83 ec 10          	sub    $0x10,%rsp
  802fde:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802fe2:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802fe5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fe9:	8b 50 0c             	mov    0xc(%rax),%edx
  802fec:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802ff3:	00 00 00 
  802ff6:	89 10                	mov    %edx,(%rax)
  802ff8:	48 b8 00 b0 80 00 00 	movabs $0x80b000,%rax
  802fff:	00 00 00 
  803002:	8b 55 f4             	mov    -0xc(%rbp),%edx
  803005:	89 50 04             	mov    %edx,0x4(%rax)
  803008:	be 00 00 00 00       	mov    $0x0,%esi
  80300d:	bf 02 00 00 00       	mov    $0x2,%edi
  803012:	48 b8 b3 2b 80 00 00 	movabs $0x802bb3,%rax
  803019:	00 00 00 
  80301c:	ff d0                	callq  *%rax
  80301e:	c9                   	leaveq 
  80301f:	c3                   	retq   

0000000000803020 <remove>:
  803020:	55                   	push   %rbp
  803021:	48 89 e5             	mov    %rsp,%rbp
  803024:	48 83 ec 10          	sub    $0x10,%rsp
  803028:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80302c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803030:	48 89 c7             	mov    %rax,%rdi
  803033:	48 b8 b0 14 80 00 00 	movabs $0x8014b0,%rax
  80303a:	00 00 00 
  80303d:	ff d0                	callq  *%rax
  80303f:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  803044:	7e 07                	jle    80304d <remove+0x2d>
  803046:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  80304b:	eb 33                	jmp    803080 <remove+0x60>
  80304d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803051:	48 89 c6             	mov    %rax,%rsi
  803054:	48 bf 00 b0 80 00 00 	movabs $0x80b000,%rdi
  80305b:	00 00 00 
  80305e:	48 b8 1c 15 80 00 00 	movabs $0x80151c,%rax
  803065:	00 00 00 
  803068:	ff d0                	callq  *%rax
  80306a:	be 00 00 00 00       	mov    $0x0,%esi
  80306f:	bf 07 00 00 00       	mov    $0x7,%edi
  803074:	48 b8 b3 2b 80 00 00 	movabs $0x802bb3,%rax
  80307b:	00 00 00 
  80307e:	ff d0                	callq  *%rax
  803080:	c9                   	leaveq 
  803081:	c3                   	retq   

0000000000803082 <sync>:
  803082:	55                   	push   %rbp
  803083:	48 89 e5             	mov    %rsp,%rbp
  803086:	be 00 00 00 00       	mov    $0x0,%esi
  80308b:	bf 08 00 00 00       	mov    $0x8,%edi
  803090:	48 b8 b3 2b 80 00 00 	movabs $0x802bb3,%rax
  803097:	00 00 00 
  80309a:	ff d0                	callq  *%rax
  80309c:	5d                   	pop    %rbp
  80309d:	c3                   	retq   

000000000080309e <copy>:
  80309e:	55                   	push   %rbp
  80309f:	48 89 e5             	mov    %rsp,%rbp
  8030a2:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  8030a9:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  8030b0:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  8030b7:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  8030be:	be 00 00 00 00       	mov    $0x0,%esi
  8030c3:	48 89 c7             	mov    %rax,%rdi
  8030c6:	48 b8 3c 2c 80 00 00 	movabs $0x802c3c,%rax
  8030cd:	00 00 00 
  8030d0:	ff d0                	callq  *%rax
  8030d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8030d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8030d9:	79 28                	jns    803103 <copy+0x65>
  8030db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030de:	89 c6                	mov    %eax,%esi
  8030e0:	48 bf 6c 56 80 00 00 	movabs $0x80566c,%rdi
  8030e7:	00 00 00 
  8030ea:	b8 00 00 00 00       	mov    $0x0,%eax
  8030ef:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8030f6:	00 00 00 
  8030f9:	ff d2                	callq  *%rdx
  8030fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8030fe:	e9 76 01 00 00       	jmpq   803279 <copy+0x1db>
  803103:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  80310a:	be 01 01 00 00       	mov    $0x101,%esi
  80310f:	48 89 c7             	mov    %rax,%rdi
  803112:	48 b8 3c 2c 80 00 00 	movabs $0x802c3c,%rax
  803119:	00 00 00 
  80311c:	ff d0                	callq  *%rax
  80311e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803121:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803125:	0f 89 ad 00 00 00    	jns    8031d8 <copy+0x13a>
  80312b:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80312e:	89 c6                	mov    %eax,%esi
  803130:	48 bf 82 56 80 00 00 	movabs $0x805682,%rdi
  803137:	00 00 00 
  80313a:	b8 00 00 00 00       	mov    $0x0,%eax
  80313f:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  803146:	00 00 00 
  803149:	ff d2                	callq  *%rdx
  80314b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80314e:	89 c7                	mov    %eax,%edi
  803150:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  803157:	00 00 00 
  80315a:	ff d0                	callq  *%rax
  80315c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80315f:	e9 15 01 00 00       	jmpq   803279 <copy+0x1db>
  803164:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803167:	48 63 d0             	movslq %eax,%rdx
  80316a:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  803171:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803174:	48 89 ce             	mov    %rcx,%rsi
  803177:	89 c7                	mov    %eax,%edi
  803179:	48 b8 ae 28 80 00 00 	movabs $0x8028ae,%rax
  803180:	00 00 00 
  803183:	ff d0                	callq  *%rax
  803185:	89 45 f0             	mov    %eax,-0x10(%rbp)
  803188:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  80318c:	79 4a                	jns    8031d8 <copy+0x13a>
  80318e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803191:	89 c6                	mov    %eax,%esi
  803193:	48 bf 9c 56 80 00 00 	movabs $0x80569c,%rdi
  80319a:	00 00 00 
  80319d:	b8 00 00 00 00       	mov    $0x0,%eax
  8031a2:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  8031a9:	00 00 00 
  8031ac:	ff d2                	callq  *%rdx
  8031ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031b1:	89 c7                	mov    %eax,%edi
  8031b3:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  8031ba:	00 00 00 
  8031bd:	ff d0                	callq  *%rax
  8031bf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8031c2:	89 c7                	mov    %eax,%edi
  8031c4:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  8031cb:	00 00 00 
  8031ce:	ff d0                	callq  *%rax
  8031d0:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8031d3:	e9 a1 00 00 00       	jmpq   803279 <copy+0x1db>
  8031d8:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  8031df:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8031e2:	ba 00 02 00 00       	mov    $0x200,%edx
  8031e7:	48 89 ce             	mov    %rcx,%rsi
  8031ea:	89 c7                	mov    %eax,%edi
  8031ec:	48 b8 63 27 80 00 00 	movabs $0x802763,%rax
  8031f3:	00 00 00 
  8031f6:	ff d0                	callq  *%rax
  8031f8:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8031fb:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8031ff:	0f 8f 5f ff ff ff    	jg     803164 <copy+0xc6>
  803205:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  803209:	79 47                	jns    803252 <copy+0x1b4>
  80320b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80320e:	89 c6                	mov    %eax,%esi
  803210:	48 bf af 56 80 00 00 	movabs $0x8056af,%rdi
  803217:	00 00 00 
  80321a:	b8 00 00 00 00       	mov    $0x0,%eax
  80321f:	48 ba 8c 09 80 00 00 	movabs $0x80098c,%rdx
  803226:	00 00 00 
  803229:	ff d2                	callq  *%rdx
  80322b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80322e:	89 c7                	mov    %eax,%edi
  803230:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  803237:	00 00 00 
  80323a:	ff d0                	callq  *%rax
  80323c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80323f:	89 c7                	mov    %eax,%edi
  803241:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  803248:	00 00 00 
  80324b:	ff d0                	callq  *%rax
  80324d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803250:	eb 27                	jmp    803279 <copy+0x1db>
  803252:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803255:	89 c7                	mov    %eax,%edi
  803257:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  80325e:	00 00 00 
  803261:	ff d0                	callq  *%rax
  803263:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803266:	89 c7                	mov    %eax,%edi
  803268:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  80326f:	00 00 00 
  803272:	ff d0                	callq  *%rax
  803274:	b8 00 00 00 00       	mov    $0x0,%eax
  803279:	c9                   	leaveq 
  80327a:	c3                   	retq   

000000000080327b <spawn>:
  80327b:	55                   	push   %rbp
  80327c:	48 89 e5             	mov    %rsp,%rbp
  80327f:	48 81 ec 00 03 00 00 	sub    $0x300,%rsp
  803286:	48 89 bd 08 fd ff ff 	mov    %rdi,-0x2f8(%rbp)
  80328d:	48 89 b5 00 fd ff ff 	mov    %rsi,-0x300(%rbp)
  803294:	48 8b 85 08 fd ff ff 	mov    -0x2f8(%rbp),%rax
  80329b:	be 00 00 00 00       	mov    $0x0,%esi
  8032a0:	48 89 c7             	mov    %rax,%rdi
  8032a3:	48 b8 3c 2c 80 00 00 	movabs $0x802c3c,%rax
  8032aa:	00 00 00 
  8032ad:	ff d0                	callq  *%rax
  8032af:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8032b2:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8032b6:	79 08                	jns    8032c0 <spawn+0x45>
  8032b8:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8032bb:	e9 11 03 00 00       	jmpq   8035d1 <spawn+0x356>
  8032c0:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8032c3:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  8032c6:	48 8d 85 d0 fd ff ff 	lea    -0x230(%rbp),%rax
  8032cd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8032d1:	48 8d 8d d0 fd ff ff 	lea    -0x230(%rbp),%rcx
  8032d8:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8032db:	ba 00 02 00 00       	mov    $0x200,%edx
  8032e0:	48 89 ce             	mov    %rcx,%rsi
  8032e3:	89 c7                	mov    %eax,%edi
  8032e5:	48 b8 38 28 80 00 00 	movabs $0x802838,%rax
  8032ec:	00 00 00 
  8032ef:	ff d0                	callq  *%rax
  8032f1:	3d 00 02 00 00       	cmp    $0x200,%eax
  8032f6:	75 0d                	jne    803305 <spawn+0x8a>
  8032f8:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8032fc:	8b 00                	mov    (%rax),%eax
  8032fe:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  803303:	74 43                	je     803348 <spawn+0xcd>
  803305:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  803308:	89 c7                	mov    %eax,%edi
  80330a:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  803311:	00 00 00 
  803314:	ff d0                	callq  *%rax
  803316:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80331a:	8b 00                	mov    (%rax),%eax
  80331c:	ba 7f 45 4c 46       	mov    $0x464c457f,%edx
  803321:	89 c6                	mov    %eax,%esi
  803323:	48 bf c8 56 80 00 00 	movabs $0x8056c8,%rdi
  80332a:	00 00 00 
  80332d:	b8 00 00 00 00       	mov    $0x0,%eax
  803332:	48 b9 8c 09 80 00 00 	movabs $0x80098c,%rcx
  803339:	00 00 00 
  80333c:	ff d1                	callq  *%rcx
  80333e:	b8 f1 ff ff ff       	mov    $0xfffffff1,%eax
  803343:	e9 89 02 00 00       	jmpq   8035d1 <spawn+0x356>
  803348:	b8 07 00 00 00       	mov    $0x7,%eax
  80334d:	cd 30                	int    $0x30
  80334f:	89 45 d0             	mov    %eax,-0x30(%rbp)
  803352:	8b 45 d0             	mov    -0x30(%rbp),%eax
  803355:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803358:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80335c:	79 08                	jns    803366 <spawn+0xeb>
  80335e:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803361:	e9 6b 02 00 00       	jmpq   8035d1 <spawn+0x356>
  803366:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803369:	89 45 d4             	mov    %eax,-0x2c(%rbp)
  80336c:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80336f:	25 ff 03 00 00       	and    $0x3ff,%eax
  803374:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80337b:	00 00 00 
  80337e:	48 98                	cltq   
  803380:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  803387:	48 01 c2             	add    %rax,%rdx
  80338a:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  803391:	48 89 d6             	mov    %rdx,%rsi
  803394:	ba 18 00 00 00       	mov    $0x18,%edx
  803399:	48 89 c7             	mov    %rax,%rdi
  80339c:	48 89 d1             	mov    %rdx,%rcx
  80339f:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  8033a2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8033a6:	48 8b 40 18          	mov    0x18(%rax),%rax
  8033aa:	48 89 85 a8 fd ff ff 	mov    %rax,-0x258(%rbp)
  8033b1:	48 8d 85 10 fd ff ff 	lea    -0x2f0(%rbp),%rax
  8033b8:	48 8d 90 b0 00 00 00 	lea    0xb0(%rax),%rdx
  8033bf:	48 8b 8d 00 fd ff ff 	mov    -0x300(%rbp),%rcx
  8033c6:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8033c9:	48 89 ce             	mov    %rcx,%rsi
  8033cc:	89 c7                	mov    %eax,%edi
  8033ce:	48 b8 35 38 80 00 00 	movabs $0x803835,%rax
  8033d5:	00 00 00 
  8033d8:	ff d0                	callq  *%rax
  8033da:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8033dd:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8033e1:	79 08                	jns    8033eb <spawn+0x170>
  8033e3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8033e6:	e9 e6 01 00 00       	jmpq   8035d1 <spawn+0x356>
  8033eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8033ef:	48 8b 40 20          	mov    0x20(%rax),%rax
  8033f3:	48 8d 95 d0 fd ff ff 	lea    -0x230(%rbp),%rdx
  8033fa:	48 01 d0             	add    %rdx,%rax
  8033fd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803401:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803408:	e9 80 00 00 00       	jmpq   80348d <spawn+0x212>
  80340d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803411:	8b 00                	mov    (%rax),%eax
  803413:	83 f8 01             	cmp    $0x1,%eax
  803416:	75 6b                	jne    803483 <spawn+0x208>
  803418:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%rbp)
  80341f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803423:	8b 40 04             	mov    0x4(%rax),%eax
  803426:	83 e0 02             	and    $0x2,%eax
  803429:	85 c0                	test   %eax,%eax
  80342b:	74 04                	je     803431 <spawn+0x1b6>
  80342d:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
  803431:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803435:	48 8b 40 08          	mov    0x8(%rax),%rax
  803439:	41 89 c1             	mov    %eax,%r9d
  80343c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803440:	4c 8b 40 20          	mov    0x20(%rax),%r8
  803444:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803448:	48 8b 50 28          	mov    0x28(%rax),%rdx
  80344c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803450:	48 8b 70 10          	mov    0x10(%rax),%rsi
  803454:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  803457:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80345a:	48 83 ec 08          	sub    $0x8,%rsp
  80345e:	8b 7d ec             	mov    -0x14(%rbp),%edi
  803461:	57                   	push   %rdi
  803462:	89 c7                	mov    %eax,%edi
  803464:	48 b8 e1 3a 80 00 00 	movabs $0x803ae1,%rax
  80346b:	00 00 00 
  80346e:	ff d0                	callq  *%rax
  803470:	48 83 c4 10          	add    $0x10,%rsp
  803474:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803477:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  80347b:	0f 88 2a 01 00 00    	js     8035ab <spawn+0x330>
  803481:	eb 01                	jmp    803484 <spawn+0x209>
  803483:	90                   	nop
  803484:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  803488:	48 83 45 f0 38       	addq   $0x38,-0x10(%rbp)
  80348d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803491:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  803495:	0f b7 c0             	movzwl %ax,%eax
  803498:	3b 45 fc             	cmp    -0x4(%rbp),%eax
  80349b:	0f 8f 6c ff ff ff    	jg     80340d <spawn+0x192>
  8034a1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8034a4:	89 c7                	mov    %eax,%edi
  8034a6:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  8034ad:	00 00 00 
  8034b0:	ff d0                	callq  *%rax
  8034b2:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
  8034b9:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8034bc:	89 c7                	mov    %eax,%edi
  8034be:	48 b8 cd 3c 80 00 00 	movabs $0x803ccd,%rax
  8034c5:	00 00 00 
  8034c8:	ff d0                	callq  *%rax
  8034ca:	89 45 e8             	mov    %eax,-0x18(%rbp)
  8034cd:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  8034d1:	79 30                	jns    803503 <spawn+0x288>
  8034d3:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8034d6:	89 c1                	mov    %eax,%ecx
  8034d8:	48 ba e2 56 80 00 00 	movabs $0x8056e2,%rdx
  8034df:	00 00 00 
  8034e2:	be 86 00 00 00       	mov    $0x86,%esi
  8034e7:	48 bf f8 56 80 00 00 	movabs $0x8056f8,%rdi
  8034ee:	00 00 00 
  8034f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8034f6:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  8034fd:	00 00 00 
  803500:	41 ff d0             	callq  *%r8
  803503:	48 8d 95 10 fd ff ff 	lea    -0x2f0(%rbp),%rdx
  80350a:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80350d:	48 89 d6             	mov    %rdx,%rsi
  803510:	89 c7                	mov    %eax,%edi
  803512:	48 b8 97 1f 80 00 00 	movabs $0x801f97,%rax
  803519:	00 00 00 
  80351c:	ff d0                	callq  *%rax
  80351e:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803521:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803525:	79 30                	jns    803557 <spawn+0x2dc>
  803527:	8b 45 e8             	mov    -0x18(%rbp),%eax
  80352a:	89 c1                	mov    %eax,%ecx
  80352c:	48 ba 07 57 80 00 00 	movabs $0x805707,%rdx
  803533:	00 00 00 
  803536:	be 8a 00 00 00       	mov    $0x8a,%esi
  80353b:	48 bf f8 56 80 00 00 	movabs $0x8056f8,%rdi
  803542:	00 00 00 
  803545:	b8 00 00 00 00       	mov    $0x0,%eax
  80354a:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  803551:	00 00 00 
  803554:	41 ff d0             	callq  *%r8
  803557:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  80355a:	be 02 00 00 00       	mov    $0x2,%esi
  80355f:	89 c7                	mov    %eax,%edi
  803561:	48 b8 4a 1f 80 00 00 	movabs $0x801f4a,%rax
  803568:	00 00 00 
  80356b:	ff d0                	callq  *%rax
  80356d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803570:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
  803574:	79 30                	jns    8035a6 <spawn+0x32b>
  803576:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803579:	89 c1                	mov    %eax,%ecx
  80357b:	48 ba 21 57 80 00 00 	movabs $0x805721,%rdx
  803582:	00 00 00 
  803585:	be 8d 00 00 00       	mov    $0x8d,%esi
  80358a:	48 bf f8 56 80 00 00 	movabs $0x8056f8,%rdi
  803591:	00 00 00 
  803594:	b8 00 00 00 00       	mov    $0x0,%eax
  803599:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  8035a0:	00 00 00 
  8035a3:	41 ff d0             	callq  *%r8
  8035a6:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8035a9:	eb 26                	jmp    8035d1 <spawn+0x356>
  8035ab:	90                   	nop
  8035ac:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8035af:	89 c7                	mov    %eax,%edi
  8035b1:	48 b8 8d 1d 80 00 00 	movabs $0x801d8d,%rax
  8035b8:	00 00 00 
  8035bb:	ff d0                	callq  *%rax
  8035bd:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8035c0:	89 c7                	mov    %eax,%edi
  8035c2:	48 b8 40 25 80 00 00 	movabs $0x802540,%rax
  8035c9:	00 00 00 
  8035cc:	ff d0                	callq  *%rax
  8035ce:	8b 45 e8             	mov    -0x18(%rbp),%eax
  8035d1:	c9                   	leaveq 
  8035d2:	c3                   	retq   

00000000008035d3 <spawnl>:
  8035d3:	55                   	push   %rbp
  8035d4:	48 89 e5             	mov    %rsp,%rbp
  8035d7:	41 55                	push   %r13
  8035d9:	41 54                	push   %r12
  8035db:	53                   	push   %rbx
  8035dc:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  8035e3:	48 89 bd f8 fe ff ff 	mov    %rdi,-0x108(%rbp)
  8035ea:	48 89 b5 f0 fe ff ff 	mov    %rsi,-0x110(%rbp)
  8035f1:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  8035f8:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  8035ff:	4c 89 85 50 ff ff ff 	mov    %r8,-0xb0(%rbp)
  803606:	4c 89 8d 58 ff ff ff 	mov    %r9,-0xa8(%rbp)
  80360d:	84 c0                	test   %al,%al
  80360f:	74 26                	je     803637 <spawnl+0x64>
  803611:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
  803618:	0f 29 8d 70 ff ff ff 	movaps %xmm1,-0x90(%rbp)
  80361f:	0f 29 55 80          	movaps %xmm2,-0x80(%rbp)
  803623:	0f 29 5d 90          	movaps %xmm3,-0x70(%rbp)
  803627:	0f 29 65 a0          	movaps %xmm4,-0x60(%rbp)
  80362b:	0f 29 6d b0          	movaps %xmm5,-0x50(%rbp)
  80362f:	0f 29 75 c0          	movaps %xmm6,-0x40(%rbp)
  803633:	0f 29 7d d0          	movaps %xmm7,-0x30(%rbp)
  803637:	c7 85 2c ff ff ff 00 	movl   $0x0,-0xd4(%rbp)
  80363e:	00 00 00 
  803641:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803648:	00 00 00 
  80364b:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803652:	00 00 00 
  803655:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803659:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  803660:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803667:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  80366e:	eb 07                	jmp    803677 <spawnl+0xa4>
  803670:	83 85 2c ff ff ff 01 	addl   $0x1,-0xd4(%rbp)
  803677:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  80367d:	83 f8 30             	cmp    $0x30,%eax
  803680:	73 23                	jae    8036a5 <spawnl+0xd2>
  803682:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  803689:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  80368f:	89 d2                	mov    %edx,%edx
  803691:	48 01 d0             	add    %rdx,%rax
  803694:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  80369a:	83 c2 08             	add    $0x8,%edx
  80369d:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8036a3:	eb 12                	jmp    8036b7 <spawnl+0xe4>
  8036a5:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8036ac:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8036b0:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8036b7:	48 8b 00             	mov    (%rax),%rax
  8036ba:	48 85 c0             	test   %rax,%rax
  8036bd:	75 b1                	jne    803670 <spawnl+0x9d>
  8036bf:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8036c5:	83 c0 02             	add    $0x2,%eax
  8036c8:	48 89 e2             	mov    %rsp,%rdx
  8036cb:	48 89 d3             	mov    %rdx,%rbx
  8036ce:	48 63 d0             	movslq %eax,%rdx
  8036d1:	48 83 ea 01          	sub    $0x1,%rdx
  8036d5:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  8036dc:	48 63 d0             	movslq %eax,%rdx
  8036df:	49 89 d4             	mov    %rdx,%r12
  8036e2:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  8036e8:	48 63 d0             	movslq %eax,%rdx
  8036eb:	49 89 d2             	mov    %rdx,%r10
  8036ee:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  8036f4:	48 98                	cltq   
  8036f6:	48 c1 e0 03          	shl    $0x3,%rax
  8036fa:	48 8d 50 07          	lea    0x7(%rax),%rdx
  8036fe:	b8 10 00 00 00       	mov    $0x10,%eax
  803703:	48 83 e8 01          	sub    $0x1,%rax
  803707:	48 01 d0             	add    %rdx,%rax
  80370a:	be 10 00 00 00       	mov    $0x10,%esi
  80370f:	ba 00 00 00 00       	mov    $0x0,%edx
  803714:	48 f7 f6             	div    %rsi
  803717:	48 6b c0 10          	imul   $0x10,%rax,%rax
  80371b:	48 29 c4             	sub    %rax,%rsp
  80371e:	48 89 e0             	mov    %rsp,%rax
  803721:	48 83 c0 07          	add    $0x7,%rax
  803725:	48 c1 e8 03          	shr    $0x3,%rax
  803729:	48 c1 e0 03          	shl    $0x3,%rax
  80372d:	48 89 85 18 ff ff ff 	mov    %rax,-0xe8(%rbp)
  803734:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  80373b:	48 8b 95 f0 fe ff ff 	mov    -0x110(%rbp),%rdx
  803742:	48 89 10             	mov    %rdx,(%rax)
  803745:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  80374b:	8d 50 01             	lea    0x1(%rax),%edx
  80374e:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803755:	48 63 d2             	movslq %edx,%rdx
  803758:	48 c7 04 d0 00 00 00 	movq   $0x0,(%rax,%rdx,8)
  80375f:	00 
  803760:	c7 85 00 ff ff ff 10 	movl   $0x10,-0x100(%rbp)
  803767:	00 00 00 
  80376a:	c7 85 04 ff ff ff 30 	movl   $0x30,-0xfc(%rbp)
  803771:	00 00 00 
  803774:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803778:	48 89 85 08 ff ff ff 	mov    %rax,-0xf8(%rbp)
  80377f:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
  803786:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
  80378d:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%rbp)
  803794:	00 00 00 
  803797:	eb 60                	jmp    8037f9 <spawnl+0x226>
  803799:	8b 85 28 ff ff ff    	mov    -0xd8(%rbp),%eax
  80379f:	8d 48 01             	lea    0x1(%rax),%ecx
  8037a2:	8b 85 00 ff ff ff    	mov    -0x100(%rbp),%eax
  8037a8:	83 f8 30             	cmp    $0x30,%eax
  8037ab:	73 23                	jae    8037d0 <spawnl+0x1fd>
  8037ad:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
  8037b4:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8037ba:	89 d2                	mov    %edx,%edx
  8037bc:	48 01 d0             	add    %rdx,%rax
  8037bf:	8b 95 00 ff ff ff    	mov    -0x100(%rbp),%edx
  8037c5:	83 c2 08             	add    $0x8,%edx
  8037c8:	89 95 00 ff ff ff    	mov    %edx,-0x100(%rbp)
  8037ce:	eb 12                	jmp    8037e2 <spawnl+0x20f>
  8037d0:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8037d7:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8037db:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  8037e2:	48 8b 10             	mov    (%rax),%rdx
  8037e5:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  8037ec:	89 c9                	mov    %ecx,%ecx
  8037ee:	48 89 14 c8          	mov    %rdx,(%rax,%rcx,8)
  8037f2:	83 85 28 ff ff ff 01 	addl   $0x1,-0xd8(%rbp)
  8037f9:	8b 85 2c ff ff ff    	mov    -0xd4(%rbp),%eax
  8037ff:	39 85 28 ff ff ff    	cmp    %eax,-0xd8(%rbp)
  803805:	72 92                	jb     803799 <spawnl+0x1c6>
  803807:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  80380e:	48 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%rax
  803815:	48 89 d6             	mov    %rdx,%rsi
  803818:	48 89 c7             	mov    %rax,%rdi
  80381b:	48 b8 7b 32 80 00 00 	movabs $0x80327b,%rax
  803822:	00 00 00 
  803825:	ff d0                	callq  *%rax
  803827:	48 89 dc             	mov    %rbx,%rsp
  80382a:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  80382e:	5b                   	pop    %rbx
  80382f:	41 5c                	pop    %r12
  803831:	41 5d                	pop    %r13
  803833:	5d                   	pop    %rbp
  803834:	c3                   	retq   

0000000000803835 <init_stack>:
  803835:	55                   	push   %rbp
  803836:	48 89 e5             	mov    %rsp,%rbp
  803839:	48 83 ec 50          	sub    $0x50,%rsp
  80383d:	89 7d cc             	mov    %edi,-0x34(%rbp)
  803840:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  803844:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  803848:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80384f:	00 
  803850:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  803857:	eb 33                	jmp    80388c <init_stack+0x57>
  803859:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80385c:	48 98                	cltq   
  80385e:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803865:	00 
  803866:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80386a:	48 01 d0             	add    %rdx,%rax
  80386d:	48 8b 00             	mov    (%rax),%rax
  803870:	48 89 c7             	mov    %rax,%rdi
  803873:	48 b8 b0 14 80 00 00 	movabs $0x8014b0,%rax
  80387a:	00 00 00 
  80387d:	ff d0                	callq  *%rax
  80387f:	83 c0 01             	add    $0x1,%eax
  803882:	48 98                	cltq   
  803884:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  803888:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  80388c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80388f:	48 98                	cltq   
  803891:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803898:	00 
  803899:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80389d:	48 01 d0             	add    %rdx,%rax
  8038a0:	48 8b 00             	mov    (%rax),%rax
  8038a3:	48 85 c0             	test   %rax,%rax
  8038a6:	75 b1                	jne    803859 <init_stack+0x24>
  8038a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8038ac:	48 f7 d8             	neg    %rax
  8038af:	48 05 00 10 40 00    	add    $0x401000,%rax
  8038b5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8038b9:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8038bd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  8038c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8038c5:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
  8038c9:	48 89 c2             	mov    %rax,%rdx
  8038cc:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8038cf:	83 c0 01             	add    $0x1,%eax
  8038d2:	c1 e0 03             	shl    $0x3,%eax
  8038d5:	48 98                	cltq   
  8038d7:	48 f7 d8             	neg    %rax
  8038da:	48 01 d0             	add    %rdx,%rax
  8038dd:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  8038e1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8038e5:	48 83 e8 10          	sub    $0x10,%rax
  8038e9:	48 3d ff ff 3f 00    	cmp    $0x3fffff,%rax
  8038ef:	77 0a                	ja     8038fb <init_stack+0xc6>
  8038f1:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  8038f6:	e9 e4 01 00 00       	jmpq   803adf <init_stack+0x2aa>
  8038fb:	ba 07 00 00 00       	mov    $0x7,%edx
  803900:	be 00 00 40 00       	mov    $0x400000,%esi
  803905:	bf 00 00 00 00       	mov    $0x0,%edi
  80390a:	48 b8 4c 1e 80 00 00 	movabs $0x801e4c,%rax
  803911:	00 00 00 
  803914:	ff d0                	callq  *%rax
  803916:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803919:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80391d:	79 08                	jns    803927 <init_stack+0xf2>
  80391f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803922:	e9 b8 01 00 00       	jmpq   803adf <init_stack+0x2aa>
  803927:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  80392e:	e9 8a 00 00 00       	jmpq   8039bd <init_stack+0x188>
  803933:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803936:	48 98                	cltq   
  803938:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80393f:	00 
  803940:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803944:	48 01 d0             	add    %rdx,%rax
  803947:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  80394c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  803950:	48 01 ca             	add    %rcx,%rdx
  803953:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  80395a:	48 89 10             	mov    %rdx,(%rax)
  80395d:	8b 45 f0             	mov    -0x10(%rbp),%eax
  803960:	48 98                	cltq   
  803962:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803969:	00 
  80396a:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80396e:	48 01 d0             	add    %rdx,%rax
  803971:	48 8b 10             	mov    (%rax),%rdx
  803974:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803978:	48 89 d6             	mov    %rdx,%rsi
  80397b:	48 89 c7             	mov    %rax,%rdi
  80397e:	48 b8 1c 15 80 00 00 	movabs $0x80151c,%rax
  803985:	00 00 00 
  803988:	ff d0                	callq  *%rax
  80398a:	8b 45 f0             	mov    -0x10(%rbp),%eax
  80398d:	48 98                	cltq   
  80398f:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  803996:	00 
  803997:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  80399b:	48 01 d0             	add    %rdx,%rax
  80399e:	48 8b 00             	mov    (%rax),%rax
  8039a1:	48 89 c7             	mov    %rax,%rdi
  8039a4:	48 b8 b0 14 80 00 00 	movabs $0x8014b0,%rax
  8039ab:	00 00 00 
  8039ae:	ff d0                	callq  *%rax
  8039b0:	83 c0 01             	add    $0x1,%eax
  8039b3:	48 98                	cltq   
  8039b5:	48 01 45 e0          	add    %rax,-0x20(%rbp)
  8039b9:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
  8039bd:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8039c0:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8039c3:	0f 8c 6a ff ff ff    	jl     803933 <init_stack+0xfe>
  8039c9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8039cc:	48 98                	cltq   
  8039ce:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  8039d5:	00 
  8039d6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8039da:	48 01 d0             	add    %rdx,%rax
  8039dd:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  8039e4:	48 81 7d e0 00 10 40 	cmpq   $0x401000,-0x20(%rbp)
  8039eb:	00 
  8039ec:	74 35                	je     803a23 <init_stack+0x1ee>
  8039ee:	48 b9 38 57 80 00 00 	movabs $0x805738,%rcx
  8039f5:	00 00 00 
  8039f8:	48 ba 5e 57 80 00 00 	movabs $0x80575e,%rdx
  8039ff:	00 00 00 
  803a02:	be f6 00 00 00       	mov    $0xf6,%esi
  803a07:	48 bf f8 56 80 00 00 	movabs $0x8056f8,%rdi
  803a0e:	00 00 00 
  803a11:	b8 00 00 00 00       	mov    $0x0,%eax
  803a16:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  803a1d:	00 00 00 
  803a20:	41 ff d0             	callq  *%r8
  803a23:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a27:	48 83 e8 08          	sub    $0x8,%rax
  803a2b:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803a30:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  803a34:	48 01 ca             	add    %rcx,%rdx
  803a37:	48 81 ea 00 00 40 00 	sub    $0x400000,%rdx
  803a3e:	48 89 10             	mov    %rdx,(%rax)
  803a41:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a45:	48 8d 50 f0          	lea    -0x10(%rax),%rdx
  803a49:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803a4c:	48 98                	cltq   
  803a4e:	48 89 02             	mov    %rax,(%rdx)
  803a51:	ba f0 cf 7f ef       	mov    $0xef7fcff0,%edx
  803a56:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a5a:	48 01 d0             	add    %rdx,%rax
  803a5d:	48 2d 00 00 40 00    	sub    $0x400000,%rax
  803a63:	48 89 c2             	mov    %rax,%rdx
  803a66:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  803a6a:	48 89 10             	mov    %rdx,(%rax)
  803a6d:	8b 45 cc             	mov    -0x34(%rbp),%eax
  803a70:	41 b8 07 00 00 00    	mov    $0x7,%r8d
  803a76:	b9 00 d0 7f ef       	mov    $0xef7fd000,%ecx
  803a7b:	89 c2                	mov    %eax,%edx
  803a7d:	be 00 00 40 00       	mov    $0x400000,%esi
  803a82:	bf 00 00 00 00       	mov    $0x0,%edi
  803a87:	48 b8 9e 1e 80 00 00 	movabs $0x801e9e,%rax
  803a8e:	00 00 00 
  803a91:	ff d0                	callq  *%rax
  803a93:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803a96:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803a9a:	78 26                	js     803ac2 <init_stack+0x28d>
  803a9c:	be 00 00 40 00       	mov    $0x400000,%esi
  803aa1:	bf 00 00 00 00       	mov    $0x0,%edi
  803aa6:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  803aad:	00 00 00 
  803ab0:	ff d0                	callq  *%rax
  803ab2:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803ab5:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803ab9:	78 0a                	js     803ac5 <init_stack+0x290>
  803abb:	b8 00 00 00 00       	mov    $0x0,%eax
  803ac0:	eb 1d                	jmp    803adf <init_stack+0x2aa>
  803ac2:	90                   	nop
  803ac3:	eb 01                	jmp    803ac6 <init_stack+0x291>
  803ac5:	90                   	nop
  803ac6:	be 00 00 40 00       	mov    $0x400000,%esi
  803acb:	bf 00 00 00 00       	mov    $0x0,%edi
  803ad0:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  803ad7:	00 00 00 
  803ada:	ff d0                	callq  *%rax
  803adc:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803adf:	c9                   	leaveq 
  803ae0:	c3                   	retq   

0000000000803ae1 <map_segment>:
  803ae1:	55                   	push   %rbp
  803ae2:	48 89 e5             	mov    %rsp,%rbp
  803ae5:	48 83 ec 50          	sub    $0x50,%rsp
  803ae9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803aec:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  803af0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803af4:	89 4d d8             	mov    %ecx,-0x28(%rbp)
  803af7:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  803afb:	44 89 4d bc          	mov    %r9d,-0x44(%rbp)
  803aff:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b03:	25 ff 0f 00 00       	and    $0xfff,%eax
  803b08:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803b0b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803b0f:	74 21                	je     803b32 <map_segment+0x51>
  803b11:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b14:	48 98                	cltq   
  803b16:	48 29 45 d0          	sub    %rax,-0x30(%rbp)
  803b1a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b1d:	48 98                	cltq   
  803b1f:	48 01 45 c8          	add    %rax,-0x38(%rbp)
  803b23:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b26:	48 98                	cltq   
  803b28:	48 01 45 c0          	add    %rax,-0x40(%rbp)
  803b2c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b2f:	29 45 bc             	sub    %eax,-0x44(%rbp)
  803b32:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803b39:	e9 79 01 00 00       	jmpq   803cb7 <map_segment+0x1d6>
  803b3e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b41:	48 98                	cltq   
  803b43:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
  803b47:	72 3c                	jb     803b85 <map_segment+0xa4>
  803b49:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803b4c:	48 63 d0             	movslq %eax,%rdx
  803b4f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803b53:	48 01 d0             	add    %rdx,%rax
  803b56:	48 89 c1             	mov    %rax,%rcx
  803b59:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803b5c:	8b 55 10             	mov    0x10(%rbp),%edx
  803b5f:	48 89 ce             	mov    %rcx,%rsi
  803b62:	89 c7                	mov    %eax,%edi
  803b64:	48 b8 4c 1e 80 00 00 	movabs $0x801e4c,%rax
  803b6b:	00 00 00 
  803b6e:	ff d0                	callq  *%rax
  803b70:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803b73:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803b77:	0f 89 33 01 00 00    	jns    803cb0 <map_segment+0x1cf>
  803b7d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803b80:	e9 46 01 00 00       	jmpq   803ccb <map_segment+0x1ea>
  803b85:	ba 07 00 00 00       	mov    $0x7,%edx
  803b8a:	be 00 00 40 00       	mov    $0x400000,%esi
  803b8f:	bf 00 00 00 00       	mov    $0x0,%edi
  803b94:	48 b8 4c 1e 80 00 00 	movabs $0x801e4c,%rax
  803b9b:	00 00 00 
  803b9e:	ff d0                	callq  *%rax
  803ba0:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803ba3:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803ba7:	79 08                	jns    803bb1 <map_segment+0xd0>
  803ba9:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803bac:	e9 1a 01 00 00       	jmpq   803ccb <map_segment+0x1ea>
  803bb1:	8b 55 bc             	mov    -0x44(%rbp),%edx
  803bb4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bb7:	01 c2                	add    %eax,%edx
  803bb9:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803bbc:	89 d6                	mov    %edx,%esi
  803bbe:	89 c7                	mov    %eax,%edi
  803bc0:	48 b8 82 29 80 00 00 	movabs $0x802982,%rax
  803bc7:	00 00 00 
  803bca:	ff d0                	callq  *%rax
  803bcc:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803bcf:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803bd3:	79 08                	jns    803bdd <map_segment+0xfc>
  803bd5:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803bd8:	e9 ee 00 00 00       	jmpq   803ccb <map_segment+0x1ea>
  803bdd:	c7 45 f4 00 10 00 00 	movl   $0x1000,-0xc(%rbp)
  803be4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803be7:	48 98                	cltq   
  803be9:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  803bed:	48 29 c2             	sub    %rax,%rdx
  803bf0:	48 89 d0             	mov    %rdx,%rax
  803bf3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803bf7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  803bfa:	48 63 d0             	movslq %eax,%rdx
  803bfd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803c01:	48 39 c2             	cmp    %rax,%rdx
  803c04:	48 0f 47 d0          	cmova  %rax,%rdx
  803c08:	8b 45 d8             	mov    -0x28(%rbp),%eax
  803c0b:	be 00 00 40 00       	mov    $0x400000,%esi
  803c10:	89 c7                	mov    %eax,%edi
  803c12:	48 b8 38 28 80 00 00 	movabs $0x802838,%rax
  803c19:	00 00 00 
  803c1c:	ff d0                	callq  *%rax
  803c1e:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803c21:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803c25:	79 08                	jns    803c2f <map_segment+0x14e>
  803c27:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c2a:	e9 9c 00 00 00       	jmpq   803ccb <map_segment+0x1ea>
  803c2f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c32:	48 63 d0             	movslq %eax,%rdx
  803c35:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803c39:	48 01 d0             	add    %rdx,%rax
  803c3c:	48 89 c2             	mov    %rax,%rdx
  803c3f:	8b 45 dc             	mov    -0x24(%rbp),%eax
  803c42:	44 8b 45 10          	mov    0x10(%rbp),%r8d
  803c46:	48 89 d1             	mov    %rdx,%rcx
  803c49:	89 c2                	mov    %eax,%edx
  803c4b:	be 00 00 40 00       	mov    $0x400000,%esi
  803c50:	bf 00 00 00 00       	mov    $0x0,%edi
  803c55:	48 b8 9e 1e 80 00 00 	movabs $0x801e9e,%rax
  803c5c:	00 00 00 
  803c5f:	ff d0                	callq  *%rax
  803c61:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803c64:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  803c68:	79 30                	jns    803c9a <map_segment+0x1b9>
  803c6a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803c6d:	89 c1                	mov    %eax,%ecx
  803c6f:	48 ba 73 57 80 00 00 	movabs $0x805773,%rdx
  803c76:	00 00 00 
  803c79:	be 29 01 00 00       	mov    $0x129,%esi
  803c7e:	48 bf f8 56 80 00 00 	movabs $0x8056f8,%rdi
  803c85:	00 00 00 
  803c88:	b8 00 00 00 00       	mov    $0x0,%eax
  803c8d:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  803c94:	00 00 00 
  803c97:	41 ff d0             	callq  *%r8
  803c9a:	be 00 00 40 00       	mov    $0x400000,%esi
  803c9f:	bf 00 00 00 00       	mov    $0x0,%edi
  803ca4:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  803cab:	00 00 00 
  803cae:	ff d0                	callq  *%rax
  803cb0:	81 45 fc 00 10 00 00 	addl   $0x1000,-0x4(%rbp)
  803cb7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cba:	48 98                	cltq   
  803cbc:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803cc0:	0f 82 78 fe ff ff    	jb     803b3e <map_segment+0x5d>
  803cc6:	b8 00 00 00 00       	mov    $0x0,%eax
  803ccb:	c9                   	leaveq 
  803ccc:	c3                   	retq   

0000000000803ccd <copy_shared_pages>:
  803ccd:	55                   	push   %rbp
  803cce:	48 89 e5             	mov    %rsp,%rbp
  803cd1:	48 83 ec 30          	sub    $0x30,%rsp
  803cd5:	89 7d dc             	mov    %edi,-0x24(%rbp)
  803cd8:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803cdf:	00 
  803ce0:	e9 eb 00 00 00       	jmpq   803dd0 <copy_shared_pages+0x103>
  803ce5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ce9:	48 c1 f8 12          	sar    $0x12,%rax
  803ced:	48 89 c2             	mov    %rax,%rdx
  803cf0:	48 b8 00 00 40 80 00 	movabs $0x10080400000,%rax
  803cf7:	01 00 00 
  803cfa:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803cfe:	83 e0 01             	and    $0x1,%eax
  803d01:	48 85 c0             	test   %rax,%rax
  803d04:	74 21                	je     803d27 <copy_shared_pages+0x5a>
  803d06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d0a:	48 c1 f8 09          	sar    $0x9,%rax
  803d0e:	48 89 c2             	mov    %rax,%rdx
  803d11:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  803d18:	01 00 00 
  803d1b:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803d1f:	83 e0 01             	and    $0x1,%eax
  803d22:	48 85 c0             	test   %rax,%rax
  803d25:	75 0d                	jne    803d34 <copy_shared_pages+0x67>
  803d27:	48 81 45 f8 00 02 00 	addq   $0x200,-0x8(%rbp)
  803d2e:	00 
  803d2f:	e9 9c 00 00 00       	jmpq   803dd0 <copy_shared_pages+0x103>
  803d34:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d38:	48 05 00 02 00 00    	add    $0x200,%rax
  803d3e:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803d42:	eb 7e                	jmp    803dc2 <copy_shared_pages+0xf5>
  803d44:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803d4b:	01 00 00 
  803d4e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803d52:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803d56:	25 01 04 00 00       	and    $0x401,%eax
  803d5b:	48 3d 01 04 00 00    	cmp    $0x401,%rax
  803d61:	75 5a                	jne    803dbd <copy_shared_pages+0xf0>
  803d63:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803d67:	48 c1 e0 0c          	shl    $0xc,%rax
  803d6b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803d6f:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  803d76:	01 00 00 
  803d79:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  803d7d:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  803d81:	25 07 0e 00 00       	and    $0xe07,%eax
  803d86:	89 c6                	mov    %eax,%esi
  803d88:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  803d8c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803d8f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803d93:	41 89 f0             	mov    %esi,%r8d
  803d96:	48 89 c6             	mov    %rax,%rsi
  803d99:	bf 00 00 00 00       	mov    $0x0,%edi
  803d9e:	48 b8 9e 1e 80 00 00 	movabs $0x801e9e,%rax
  803da5:	00 00 00 
  803da8:	ff d0                	callq  *%rax
  803daa:	48 98                	cltq   
  803dac:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803db0:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803db5:	79 06                	jns    803dbd <copy_shared_pages+0xf0>
  803db7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803dbb:	eb 28                	jmp    803de5 <copy_shared_pages+0x118>
  803dbd:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803dc2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dc6:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  803dca:	0f 8c 74 ff ff ff    	jl     803d44 <copy_shared_pages+0x77>
  803dd0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803dd4:	48 3d ff 07 00 08    	cmp    $0x80007ff,%rax
  803dda:	0f 86 05 ff ff ff    	jbe    803ce5 <copy_shared_pages+0x18>
  803de0:	b8 00 00 00 00       	mov    $0x0,%eax
  803de5:	c9                   	leaveq 
  803de6:	c3                   	retq   

0000000000803de7 <fd2sockid>:
  803de7:	55                   	push   %rbp
  803de8:	48 89 e5             	mov    %rsp,%rbp
  803deb:	48 83 ec 20          	sub    $0x20,%rsp
  803def:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803df2:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803df6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803df9:	48 89 d6             	mov    %rdx,%rsi
  803dfc:	89 c7                	mov    %eax,%edi
  803dfe:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  803e05:	00 00 00 
  803e08:	ff d0                	callq  *%rax
  803e0a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e0d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e11:	79 05                	jns    803e18 <fd2sockid+0x31>
  803e13:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e16:	eb 24                	jmp    803e3c <fd2sockid+0x55>
  803e18:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e1c:	8b 10                	mov    (%rax),%edx
  803e1e:	48 b8 40 88 80 00 00 	movabs $0x808840,%rax
  803e25:	00 00 00 
  803e28:	8b 00                	mov    (%rax),%eax
  803e2a:	39 c2                	cmp    %eax,%edx
  803e2c:	74 07                	je     803e35 <fd2sockid+0x4e>
  803e2e:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  803e33:	eb 07                	jmp    803e3c <fd2sockid+0x55>
  803e35:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e39:	8b 40 0c             	mov    0xc(%rax),%eax
  803e3c:	c9                   	leaveq 
  803e3d:	c3                   	retq   

0000000000803e3e <alloc_sockfd>:
  803e3e:	55                   	push   %rbp
  803e3f:	48 89 e5             	mov    %rsp,%rbp
  803e42:	48 83 ec 20          	sub    $0x20,%rsp
  803e46:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803e49:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803e4d:	48 89 c7             	mov    %rax,%rdi
  803e50:	48 b8 96 22 80 00 00 	movabs $0x802296,%rax
  803e57:	00 00 00 
  803e5a:	ff d0                	callq  *%rax
  803e5c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e5f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e63:	78 26                	js     803e8b <alloc_sockfd+0x4d>
  803e65:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e69:	ba 07 04 00 00       	mov    $0x407,%edx
  803e6e:	48 89 c6             	mov    %rax,%rsi
  803e71:	bf 00 00 00 00       	mov    $0x0,%edi
  803e76:	48 b8 4c 1e 80 00 00 	movabs $0x801e4c,%rax
  803e7d:	00 00 00 
  803e80:	ff d0                	callq  *%rax
  803e82:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803e85:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803e89:	79 16                	jns    803ea1 <alloc_sockfd+0x63>
  803e8b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803e8e:	89 c7                	mov    %eax,%edi
  803e90:	48 b8 4d 43 80 00 00 	movabs $0x80434d,%rax
  803e97:	00 00 00 
  803e9a:	ff d0                	callq  *%rax
  803e9c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e9f:	eb 3a                	jmp    803edb <alloc_sockfd+0x9d>
  803ea1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ea5:	48 ba 40 88 80 00 00 	movabs $0x808840,%rdx
  803eac:	00 00 00 
  803eaf:	8b 12                	mov    (%rdx),%edx
  803eb1:	89 10                	mov    %edx,(%rax)
  803eb3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803eb7:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803ebe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ec2:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803ec5:	89 50 0c             	mov    %edx,0xc(%rax)
  803ec8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ecc:	48 89 c7             	mov    %rax,%rdi
  803ecf:	48 b8 48 22 80 00 00 	movabs $0x802248,%rax
  803ed6:	00 00 00 
  803ed9:	ff d0                	callq  *%rax
  803edb:	c9                   	leaveq 
  803edc:	c3                   	retq   

0000000000803edd <accept>:
  803edd:	55                   	push   %rbp
  803ede:	48 89 e5             	mov    %rsp,%rbp
  803ee1:	48 83 ec 30          	sub    $0x30,%rsp
  803ee5:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803ee8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803eec:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803ef0:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803ef3:	89 c7                	mov    %eax,%edi
  803ef5:	48 b8 e7 3d 80 00 00 	movabs $0x803de7,%rax
  803efc:	00 00 00 
  803eff:	ff d0                	callq  *%rax
  803f01:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f04:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f08:	79 05                	jns    803f0f <accept+0x32>
  803f0a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f0d:	eb 3b                	jmp    803f4a <accept+0x6d>
  803f0f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  803f13:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803f17:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f1a:	48 89 ce             	mov    %rcx,%rsi
  803f1d:	89 c7                	mov    %eax,%edi
  803f1f:	48 b8 2a 42 80 00 00 	movabs $0x80422a,%rax
  803f26:	00 00 00 
  803f29:	ff d0                	callq  *%rax
  803f2b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f2e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f32:	79 05                	jns    803f39 <accept+0x5c>
  803f34:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f37:	eb 11                	jmp    803f4a <accept+0x6d>
  803f39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f3c:	89 c7                	mov    %eax,%edi
  803f3e:	48 b8 3e 3e 80 00 00 	movabs $0x803e3e,%rax
  803f45:	00 00 00 
  803f48:	ff d0                	callq  *%rax
  803f4a:	c9                   	leaveq 
  803f4b:	c3                   	retq   

0000000000803f4c <bind>:
  803f4c:	55                   	push   %rbp
  803f4d:	48 89 e5             	mov    %rsp,%rbp
  803f50:	48 83 ec 20          	sub    $0x20,%rsp
  803f54:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803f57:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f5b:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803f5e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803f61:	89 c7                	mov    %eax,%edi
  803f63:	48 b8 e7 3d 80 00 00 	movabs $0x803de7,%rax
  803f6a:	00 00 00 
  803f6d:	ff d0                	callq  *%rax
  803f6f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803f72:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803f76:	79 05                	jns    803f7d <bind+0x31>
  803f78:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f7b:	eb 1b                	jmp    803f98 <bind+0x4c>
  803f7d:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803f80:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  803f84:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803f87:	48 89 ce             	mov    %rcx,%rsi
  803f8a:	89 c7                	mov    %eax,%edi
  803f8c:	48 b8 a9 42 80 00 00 	movabs $0x8042a9,%rax
  803f93:	00 00 00 
  803f96:	ff d0                	callq  *%rax
  803f98:	c9                   	leaveq 
  803f99:	c3                   	retq   

0000000000803f9a <shutdown>:
  803f9a:	55                   	push   %rbp
  803f9b:	48 89 e5             	mov    %rsp,%rbp
  803f9e:	48 83 ec 20          	sub    $0x20,%rsp
  803fa2:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803fa5:	89 75 e8             	mov    %esi,-0x18(%rbp)
  803fa8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803fab:	89 c7                	mov    %eax,%edi
  803fad:	48 b8 e7 3d 80 00 00 	movabs $0x803de7,%rax
  803fb4:	00 00 00 
  803fb7:	ff d0                	callq  *%rax
  803fb9:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fbc:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fc0:	79 05                	jns    803fc7 <shutdown+0x2d>
  803fc2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fc5:	eb 16                	jmp    803fdd <shutdown+0x43>
  803fc7:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803fca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fcd:	89 d6                	mov    %edx,%esi
  803fcf:	89 c7                	mov    %eax,%edi
  803fd1:	48 b8 0d 43 80 00 00 	movabs $0x80430d,%rax
  803fd8:	00 00 00 
  803fdb:	ff d0                	callq  *%rax
  803fdd:	c9                   	leaveq 
  803fde:	c3                   	retq   

0000000000803fdf <devsock_close>:
  803fdf:	55                   	push   %rbp
  803fe0:	48 89 e5             	mov    %rsp,%rbp
  803fe3:	48 83 ec 10          	sub    $0x10,%rsp
  803fe7:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803feb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803fef:	48 89 c7             	mov    %rax,%rdi
  803ff2:	48 b8 82 4e 80 00 00 	movabs $0x804e82,%rax
  803ff9:	00 00 00 
  803ffc:	ff d0                	callq  *%rax
  803ffe:	83 f8 01             	cmp    $0x1,%eax
  804001:	75 17                	jne    80401a <devsock_close+0x3b>
  804003:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804007:	8b 40 0c             	mov    0xc(%rax),%eax
  80400a:	89 c7                	mov    %eax,%edi
  80400c:	48 b8 4d 43 80 00 00 	movabs $0x80434d,%rax
  804013:	00 00 00 
  804016:	ff d0                	callq  *%rax
  804018:	eb 05                	jmp    80401f <devsock_close+0x40>
  80401a:	b8 00 00 00 00       	mov    $0x0,%eax
  80401f:	c9                   	leaveq 
  804020:	c3                   	retq   

0000000000804021 <connect>:
  804021:	55                   	push   %rbp
  804022:	48 89 e5             	mov    %rsp,%rbp
  804025:	48 83 ec 20          	sub    $0x20,%rsp
  804029:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80402c:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804030:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804033:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804036:	89 c7                	mov    %eax,%edi
  804038:	48 b8 e7 3d 80 00 00 	movabs $0x803de7,%rax
  80403f:	00 00 00 
  804042:	ff d0                	callq  *%rax
  804044:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804047:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80404b:	79 05                	jns    804052 <connect+0x31>
  80404d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804050:	eb 1b                	jmp    80406d <connect+0x4c>
  804052:	8b 55 e8             	mov    -0x18(%rbp),%edx
  804055:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  804059:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80405c:	48 89 ce             	mov    %rcx,%rsi
  80405f:	89 c7                	mov    %eax,%edi
  804061:	48 b8 7a 43 80 00 00 	movabs $0x80437a,%rax
  804068:	00 00 00 
  80406b:	ff d0                	callq  *%rax
  80406d:	c9                   	leaveq 
  80406e:	c3                   	retq   

000000000080406f <listen>:
  80406f:	55                   	push   %rbp
  804070:	48 89 e5             	mov    %rsp,%rbp
  804073:	48 83 ec 20          	sub    $0x20,%rsp
  804077:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80407a:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80407d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804080:	89 c7                	mov    %eax,%edi
  804082:	48 b8 e7 3d 80 00 00 	movabs $0x803de7,%rax
  804089:	00 00 00 
  80408c:	ff d0                	callq  *%rax
  80408e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804091:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804095:	79 05                	jns    80409c <listen+0x2d>
  804097:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80409a:	eb 16                	jmp    8040b2 <listen+0x43>
  80409c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80409f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8040a2:	89 d6                	mov    %edx,%esi
  8040a4:	89 c7                	mov    %eax,%edi
  8040a6:	48 b8 de 43 80 00 00 	movabs $0x8043de,%rax
  8040ad:	00 00 00 
  8040b0:	ff d0                	callq  *%rax
  8040b2:	c9                   	leaveq 
  8040b3:	c3                   	retq   

00000000008040b4 <devsock_read>:
  8040b4:	55                   	push   %rbp
  8040b5:	48 89 e5             	mov    %rsp,%rbp
  8040b8:	48 83 ec 20          	sub    $0x20,%rsp
  8040bc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040c0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8040c4:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8040c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8040cc:	89 c2                	mov    %eax,%edx
  8040ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8040d2:	8b 40 0c             	mov    0xc(%rax),%eax
  8040d5:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8040d9:	b9 00 00 00 00       	mov    $0x0,%ecx
  8040de:	89 c7                	mov    %eax,%edi
  8040e0:	48 b8 1e 44 80 00 00 	movabs $0x80441e,%rax
  8040e7:	00 00 00 
  8040ea:	ff d0                	callq  *%rax
  8040ec:	c9                   	leaveq 
  8040ed:	c3                   	retq   

00000000008040ee <devsock_write>:
  8040ee:	55                   	push   %rbp
  8040ef:	48 89 e5             	mov    %rsp,%rbp
  8040f2:	48 83 ec 20          	sub    $0x20,%rsp
  8040f6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040fa:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8040fe:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  804102:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804106:	89 c2                	mov    %eax,%edx
  804108:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80410c:	8b 40 0c             	mov    0xc(%rax),%eax
  80410f:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  804113:	b9 00 00 00 00       	mov    $0x0,%ecx
  804118:	89 c7                	mov    %eax,%edi
  80411a:	48 b8 ea 44 80 00 00 	movabs $0x8044ea,%rax
  804121:	00 00 00 
  804124:	ff d0                	callq  *%rax
  804126:	c9                   	leaveq 
  804127:	c3                   	retq   

0000000000804128 <devsock_stat>:
  804128:	55                   	push   %rbp
  804129:	48 89 e5             	mov    %rsp,%rbp
  80412c:	48 83 ec 10          	sub    $0x10,%rsp
  804130:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804134:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804138:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80413c:	48 be 95 57 80 00 00 	movabs $0x805795,%rsi
  804143:	00 00 00 
  804146:	48 89 c7             	mov    %rax,%rdi
  804149:	48 b8 1c 15 80 00 00 	movabs $0x80151c,%rax
  804150:	00 00 00 
  804153:	ff d0                	callq  *%rax
  804155:	b8 00 00 00 00       	mov    $0x0,%eax
  80415a:	c9                   	leaveq 
  80415b:	c3                   	retq   

000000000080415c <socket>:
  80415c:	55                   	push   %rbp
  80415d:	48 89 e5             	mov    %rsp,%rbp
  804160:	48 83 ec 20          	sub    $0x20,%rsp
  804164:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804167:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80416a:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80416d:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  804170:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  804173:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804176:	89 ce                	mov    %ecx,%esi
  804178:	89 c7                	mov    %eax,%edi
  80417a:	48 b8 a2 45 80 00 00 	movabs $0x8045a2,%rax
  804181:	00 00 00 
  804184:	ff d0                	callq  *%rax
  804186:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804189:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80418d:	79 05                	jns    804194 <socket+0x38>
  80418f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804192:	eb 11                	jmp    8041a5 <socket+0x49>
  804194:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804197:	89 c7                	mov    %eax,%edi
  804199:	48 b8 3e 3e 80 00 00 	movabs $0x803e3e,%rax
  8041a0:	00 00 00 
  8041a3:	ff d0                	callq  *%rax
  8041a5:	c9                   	leaveq 
  8041a6:	c3                   	retq   

00000000008041a7 <nsipc>:
  8041a7:	55                   	push   %rbp
  8041a8:	48 89 e5             	mov    %rsp,%rbp
  8041ab:	48 83 ec 10          	sub    $0x10,%rsp
  8041af:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8041b2:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  8041b9:	00 00 00 
  8041bc:	8b 00                	mov    (%rax),%eax
  8041be:	85 c0                	test   %eax,%eax
  8041c0:	75 1f                	jne    8041e1 <nsipc+0x3a>
  8041c2:	bf 02 00 00 00       	mov    $0x2,%edi
  8041c7:	48 b8 11 4e 80 00 00 	movabs $0x804e11,%rax
  8041ce:	00 00 00 
  8041d1:	ff d0                	callq  *%rax
  8041d3:	89 c2                	mov    %eax,%edx
  8041d5:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  8041dc:	00 00 00 
  8041df:	89 10                	mov    %edx,(%rax)
  8041e1:	48 b8 04 90 80 00 00 	movabs $0x809004,%rax
  8041e8:	00 00 00 
  8041eb:	8b 00                	mov    (%rax),%eax
  8041ed:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8041f0:	b9 07 00 00 00       	mov    $0x7,%ecx
  8041f5:	48 ba 00 d0 80 00 00 	movabs $0x80d000,%rdx
  8041fc:	00 00 00 
  8041ff:	89 c7                	mov    %eax,%edi
  804201:	48 b8 07 4d 80 00 00 	movabs $0x804d07,%rax
  804208:	00 00 00 
  80420b:	ff d0                	callq  *%rax
  80420d:	ba 00 00 00 00       	mov    $0x0,%edx
  804212:	be 00 00 00 00       	mov    $0x0,%esi
  804217:	bf 00 00 00 00       	mov    $0x0,%edi
  80421c:	48 b8 46 4c 80 00 00 	movabs $0x804c46,%rax
  804223:	00 00 00 
  804226:	ff d0                	callq  *%rax
  804228:	c9                   	leaveq 
  804229:	c3                   	retq   

000000000080422a <nsipc_accept>:
  80422a:	55                   	push   %rbp
  80422b:	48 89 e5             	mov    %rsp,%rbp
  80422e:	48 83 ec 30          	sub    $0x30,%rsp
  804232:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804235:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804239:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80423d:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804244:	00 00 00 
  804247:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80424a:	89 10                	mov    %edx,(%rax)
  80424c:	bf 01 00 00 00       	mov    $0x1,%edi
  804251:	48 b8 a7 41 80 00 00 	movabs $0x8041a7,%rax
  804258:	00 00 00 
  80425b:	ff d0                	callq  *%rax
  80425d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804260:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804264:	78 3e                	js     8042a4 <nsipc_accept+0x7a>
  804266:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80426d:	00 00 00 
  804270:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804274:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804278:	8b 40 10             	mov    0x10(%rax),%eax
  80427b:	89 c2                	mov    %eax,%edx
  80427d:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  804281:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804285:	48 89 ce             	mov    %rcx,%rsi
  804288:	48 89 c7             	mov    %rax,%rdi
  80428b:	48 b8 41 18 80 00 00 	movabs $0x801841,%rax
  804292:	00 00 00 
  804295:	ff d0                	callq  *%rax
  804297:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80429b:	8b 50 10             	mov    0x10(%rax),%edx
  80429e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8042a2:	89 10                	mov    %edx,(%rax)
  8042a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8042a7:	c9                   	leaveq 
  8042a8:	c3                   	retq   

00000000008042a9 <nsipc_bind>:
  8042a9:	55                   	push   %rbp
  8042aa:	48 89 e5             	mov    %rsp,%rbp
  8042ad:	48 83 ec 10          	sub    $0x10,%rsp
  8042b1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8042b4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8042b8:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8042bb:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8042c2:	00 00 00 
  8042c5:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8042c8:	89 10                	mov    %edx,(%rax)
  8042ca:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8042cd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8042d1:	48 89 c6             	mov    %rax,%rsi
  8042d4:	48 bf 04 d0 80 00 00 	movabs $0x80d004,%rdi
  8042db:	00 00 00 
  8042de:	48 b8 41 18 80 00 00 	movabs $0x801841,%rax
  8042e5:	00 00 00 
  8042e8:	ff d0                	callq  *%rax
  8042ea:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8042f1:	00 00 00 
  8042f4:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8042f7:	89 50 14             	mov    %edx,0x14(%rax)
  8042fa:	bf 02 00 00 00       	mov    $0x2,%edi
  8042ff:	48 b8 a7 41 80 00 00 	movabs $0x8041a7,%rax
  804306:	00 00 00 
  804309:	ff d0                	callq  *%rax
  80430b:	c9                   	leaveq 
  80430c:	c3                   	retq   

000000000080430d <nsipc_shutdown>:
  80430d:	55                   	push   %rbp
  80430e:	48 89 e5             	mov    %rsp,%rbp
  804311:	48 83 ec 10          	sub    $0x10,%rsp
  804315:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804318:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80431b:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804322:	00 00 00 
  804325:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804328:	89 10                	mov    %edx,(%rax)
  80432a:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804331:	00 00 00 
  804334:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804337:	89 50 04             	mov    %edx,0x4(%rax)
  80433a:	bf 03 00 00 00       	mov    $0x3,%edi
  80433f:	48 b8 a7 41 80 00 00 	movabs $0x8041a7,%rax
  804346:	00 00 00 
  804349:	ff d0                	callq  *%rax
  80434b:	c9                   	leaveq 
  80434c:	c3                   	retq   

000000000080434d <nsipc_close>:
  80434d:	55                   	push   %rbp
  80434e:	48 89 e5             	mov    %rsp,%rbp
  804351:	48 83 ec 10          	sub    $0x10,%rsp
  804355:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804358:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80435f:	00 00 00 
  804362:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804365:	89 10                	mov    %edx,(%rax)
  804367:	bf 04 00 00 00       	mov    $0x4,%edi
  80436c:	48 b8 a7 41 80 00 00 	movabs $0x8041a7,%rax
  804373:	00 00 00 
  804376:	ff d0                	callq  *%rax
  804378:	c9                   	leaveq 
  804379:	c3                   	retq   

000000000080437a <nsipc_connect>:
  80437a:	55                   	push   %rbp
  80437b:	48 89 e5             	mov    %rsp,%rbp
  80437e:	48 83 ec 10          	sub    $0x10,%rsp
  804382:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804385:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  804389:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80438c:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804393:	00 00 00 
  804396:	8b 55 fc             	mov    -0x4(%rbp),%edx
  804399:	89 10                	mov    %edx,(%rax)
  80439b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80439e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8043a2:	48 89 c6             	mov    %rax,%rsi
  8043a5:	48 bf 04 d0 80 00 00 	movabs $0x80d004,%rdi
  8043ac:	00 00 00 
  8043af:	48 b8 41 18 80 00 00 	movabs $0x801841,%rax
  8043b6:	00 00 00 
  8043b9:	ff d0                	callq  *%rax
  8043bb:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8043c2:	00 00 00 
  8043c5:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8043c8:	89 50 14             	mov    %edx,0x14(%rax)
  8043cb:	bf 05 00 00 00       	mov    $0x5,%edi
  8043d0:	48 b8 a7 41 80 00 00 	movabs $0x8041a7,%rax
  8043d7:	00 00 00 
  8043da:	ff d0                	callq  *%rax
  8043dc:	c9                   	leaveq 
  8043dd:	c3                   	retq   

00000000008043de <nsipc_listen>:
  8043de:	55                   	push   %rbp
  8043df:	48 89 e5             	mov    %rsp,%rbp
  8043e2:	48 83 ec 10          	sub    $0x10,%rsp
  8043e6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8043e9:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8043ec:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8043f3:	00 00 00 
  8043f6:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8043f9:	89 10                	mov    %edx,(%rax)
  8043fb:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804402:	00 00 00 
  804405:	8b 55 f8             	mov    -0x8(%rbp),%edx
  804408:	89 50 04             	mov    %edx,0x4(%rax)
  80440b:	bf 06 00 00 00       	mov    $0x6,%edi
  804410:	48 b8 a7 41 80 00 00 	movabs $0x8041a7,%rax
  804417:	00 00 00 
  80441a:	ff d0                	callq  *%rax
  80441c:	c9                   	leaveq 
  80441d:	c3                   	retq   

000000000080441e <nsipc_recv>:
  80441e:	55                   	push   %rbp
  80441f:	48 89 e5             	mov    %rsp,%rbp
  804422:	48 83 ec 30          	sub    $0x30,%rsp
  804426:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804429:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80442d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  804430:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804433:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  80443a:	00 00 00 
  80443d:	8b 55 ec             	mov    -0x14(%rbp),%edx
  804440:	89 10                	mov    %edx,(%rax)
  804442:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804449:	00 00 00 
  80444c:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80444f:	89 50 04             	mov    %edx,0x4(%rax)
  804452:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804459:	00 00 00 
  80445c:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80445f:	89 50 08             	mov    %edx,0x8(%rax)
  804462:	bf 07 00 00 00       	mov    $0x7,%edi
  804467:	48 b8 a7 41 80 00 00 	movabs $0x8041a7,%rax
  80446e:	00 00 00 
  804471:	ff d0                	callq  *%rax
  804473:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804476:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80447a:	78 69                	js     8044e5 <nsipc_recv+0xc7>
  80447c:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  804483:	7f 08                	jg     80448d <nsipc_recv+0x6f>
  804485:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804488:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80448b:	7e 35                	jle    8044c2 <nsipc_recv+0xa4>
  80448d:	48 b9 9c 57 80 00 00 	movabs $0x80579c,%rcx
  804494:	00 00 00 
  804497:	48 ba b1 57 80 00 00 	movabs $0x8057b1,%rdx
  80449e:	00 00 00 
  8044a1:	be 62 00 00 00       	mov    $0x62,%esi
  8044a6:	48 bf c6 57 80 00 00 	movabs $0x8057c6,%rdi
  8044ad:	00 00 00 
  8044b0:	b8 00 00 00 00       	mov    $0x0,%eax
  8044b5:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  8044bc:	00 00 00 
  8044bf:	41 ff d0             	callq  *%r8
  8044c2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044c5:	48 63 d0             	movslq %eax,%rdx
  8044c8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8044cc:	48 be 00 d0 80 00 00 	movabs $0x80d000,%rsi
  8044d3:	00 00 00 
  8044d6:	48 89 c7             	mov    %rax,%rdi
  8044d9:	48 b8 41 18 80 00 00 	movabs $0x801841,%rax
  8044e0:	00 00 00 
  8044e3:	ff d0                	callq  *%rax
  8044e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044e8:	c9                   	leaveq 
  8044e9:	c3                   	retq   

00000000008044ea <nsipc_send>:
  8044ea:	55                   	push   %rbp
  8044eb:	48 89 e5             	mov    %rsp,%rbp
  8044ee:	48 83 ec 20          	sub    $0x20,%rsp
  8044f2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8044f5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8044f9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8044fc:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8044ff:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804506:	00 00 00 
  804509:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80450c:	89 10                	mov    %edx,(%rax)
  80450e:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  804515:	7e 35                	jle    80454c <nsipc_send+0x62>
  804517:	48 b9 d5 57 80 00 00 	movabs $0x8057d5,%rcx
  80451e:	00 00 00 
  804521:	48 ba b1 57 80 00 00 	movabs $0x8057b1,%rdx
  804528:	00 00 00 
  80452b:	be 6d 00 00 00       	mov    $0x6d,%esi
  804530:	48 bf c6 57 80 00 00 	movabs $0x8057c6,%rdi
  804537:	00 00 00 
  80453a:	b8 00 00 00 00       	mov    $0x0,%eax
  80453f:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  804546:	00 00 00 
  804549:	41 ff d0             	callq  *%r8
  80454c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80454f:	48 63 d0             	movslq %eax,%rdx
  804552:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804556:	48 89 c6             	mov    %rax,%rsi
  804559:	48 bf 0c d0 80 00 00 	movabs $0x80d00c,%rdi
  804560:	00 00 00 
  804563:	48 b8 41 18 80 00 00 	movabs $0x801841,%rax
  80456a:	00 00 00 
  80456d:	ff d0                	callq  *%rax
  80456f:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804576:	00 00 00 
  804579:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80457c:	89 50 04             	mov    %edx,0x4(%rax)
  80457f:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  804586:	00 00 00 
  804589:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80458c:	89 50 08             	mov    %edx,0x8(%rax)
  80458f:	bf 08 00 00 00       	mov    $0x8,%edi
  804594:	48 b8 a7 41 80 00 00 	movabs $0x8041a7,%rax
  80459b:	00 00 00 
  80459e:	ff d0                	callq  *%rax
  8045a0:	c9                   	leaveq 
  8045a1:	c3                   	retq   

00000000008045a2 <nsipc_socket>:
  8045a2:	55                   	push   %rbp
  8045a3:	48 89 e5             	mov    %rsp,%rbp
  8045a6:	48 83 ec 10          	sub    $0x10,%rsp
  8045aa:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8045ad:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8045b0:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8045b3:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8045ba:	00 00 00 
  8045bd:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8045c0:	89 10                	mov    %edx,(%rax)
  8045c2:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8045c9:	00 00 00 
  8045cc:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8045cf:	89 50 04             	mov    %edx,0x4(%rax)
  8045d2:	48 b8 00 d0 80 00 00 	movabs $0x80d000,%rax
  8045d9:	00 00 00 
  8045dc:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8045df:	89 50 08             	mov    %edx,0x8(%rax)
  8045e2:	bf 09 00 00 00       	mov    $0x9,%edi
  8045e7:	48 b8 a7 41 80 00 00 	movabs $0x8041a7,%rax
  8045ee:	00 00 00 
  8045f1:	ff d0                	callq  *%rax
  8045f3:	c9                   	leaveq 
  8045f4:	c3                   	retq   

00000000008045f5 <pipe>:
  8045f5:	55                   	push   %rbp
  8045f6:	48 89 e5             	mov    %rsp,%rbp
  8045f9:	53                   	push   %rbx
  8045fa:	48 83 ec 38          	sub    $0x38,%rsp
  8045fe:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804602:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  804606:	48 89 c7             	mov    %rax,%rdi
  804609:	48 b8 96 22 80 00 00 	movabs $0x802296,%rax
  804610:	00 00 00 
  804613:	ff d0                	callq  *%rax
  804615:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804618:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80461c:	0f 88 bf 01 00 00    	js     8047e1 <pipe+0x1ec>
  804622:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804626:	ba 07 04 00 00       	mov    $0x407,%edx
  80462b:	48 89 c6             	mov    %rax,%rsi
  80462e:	bf 00 00 00 00       	mov    $0x0,%edi
  804633:	48 b8 4c 1e 80 00 00 	movabs $0x801e4c,%rax
  80463a:	00 00 00 
  80463d:	ff d0                	callq  *%rax
  80463f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804642:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804646:	0f 88 95 01 00 00    	js     8047e1 <pipe+0x1ec>
  80464c:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804650:	48 89 c7             	mov    %rax,%rdi
  804653:	48 b8 96 22 80 00 00 	movabs $0x802296,%rax
  80465a:	00 00 00 
  80465d:	ff d0                	callq  *%rax
  80465f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804662:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804666:	0f 88 5d 01 00 00    	js     8047c9 <pipe+0x1d4>
  80466c:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804670:	ba 07 04 00 00       	mov    $0x407,%edx
  804675:	48 89 c6             	mov    %rax,%rsi
  804678:	bf 00 00 00 00       	mov    $0x0,%edi
  80467d:	48 b8 4c 1e 80 00 00 	movabs $0x801e4c,%rax
  804684:	00 00 00 
  804687:	ff d0                	callq  *%rax
  804689:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80468c:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804690:	0f 88 33 01 00 00    	js     8047c9 <pipe+0x1d4>
  804696:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80469a:	48 89 c7             	mov    %rax,%rdi
  80469d:	48 b8 6b 22 80 00 00 	movabs $0x80226b,%rax
  8046a4:	00 00 00 
  8046a7:	ff d0                	callq  *%rax
  8046a9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8046ad:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046b1:	ba 07 04 00 00       	mov    $0x407,%edx
  8046b6:	48 89 c6             	mov    %rax,%rsi
  8046b9:	bf 00 00 00 00       	mov    $0x0,%edi
  8046be:	48 b8 4c 1e 80 00 00 	movabs $0x801e4c,%rax
  8046c5:	00 00 00 
  8046c8:	ff d0                	callq  *%rax
  8046ca:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8046cd:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8046d1:	0f 88 d9 00 00 00    	js     8047b0 <pipe+0x1bb>
  8046d7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8046db:	48 89 c7             	mov    %rax,%rdi
  8046de:	48 b8 6b 22 80 00 00 	movabs $0x80226b,%rax
  8046e5:	00 00 00 
  8046e8:	ff d0                	callq  *%rax
  8046ea:	48 89 c2             	mov    %rax,%rdx
  8046ed:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8046f1:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8046f7:	48 89 d1             	mov    %rdx,%rcx
  8046fa:	ba 00 00 00 00       	mov    $0x0,%edx
  8046ff:	48 89 c6             	mov    %rax,%rsi
  804702:	bf 00 00 00 00       	mov    $0x0,%edi
  804707:	48 b8 9e 1e 80 00 00 	movabs $0x801e9e,%rax
  80470e:	00 00 00 
  804711:	ff d0                	callq  *%rax
  804713:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804716:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80471a:	78 79                	js     804795 <pipe+0x1a0>
  80471c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804720:	48 ba 80 88 80 00 00 	movabs $0x808880,%rdx
  804727:	00 00 00 
  80472a:	8b 12                	mov    (%rdx),%edx
  80472c:	89 10                	mov    %edx,(%rax)
  80472e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804732:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  804739:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80473d:	48 ba 80 88 80 00 00 	movabs $0x808880,%rdx
  804744:	00 00 00 
  804747:	8b 12                	mov    (%rdx),%edx
  804749:	89 10                	mov    %edx,(%rax)
  80474b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80474f:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  804756:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80475a:	48 89 c7             	mov    %rax,%rdi
  80475d:	48 b8 48 22 80 00 00 	movabs $0x802248,%rax
  804764:	00 00 00 
  804767:	ff d0                	callq  *%rax
  804769:	89 c2                	mov    %eax,%edx
  80476b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  80476f:	89 10                	mov    %edx,(%rax)
  804771:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804775:	48 8d 58 04          	lea    0x4(%rax),%rbx
  804779:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80477d:	48 89 c7             	mov    %rax,%rdi
  804780:	48 b8 48 22 80 00 00 	movabs $0x802248,%rax
  804787:	00 00 00 
  80478a:	ff d0                	callq  *%rax
  80478c:	89 03                	mov    %eax,(%rbx)
  80478e:	b8 00 00 00 00       	mov    $0x0,%eax
  804793:	eb 4f                	jmp    8047e4 <pipe+0x1ef>
  804795:	90                   	nop
  804796:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80479a:	48 89 c6             	mov    %rax,%rsi
  80479d:	bf 00 00 00 00       	mov    $0x0,%edi
  8047a2:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  8047a9:	00 00 00 
  8047ac:	ff d0                	callq  *%rax
  8047ae:	eb 01                	jmp    8047b1 <pipe+0x1bc>
  8047b0:	90                   	nop
  8047b1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8047b5:	48 89 c6             	mov    %rax,%rsi
  8047b8:	bf 00 00 00 00       	mov    $0x0,%edi
  8047bd:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  8047c4:	00 00 00 
  8047c7:	ff d0                	callq  *%rax
  8047c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8047cd:	48 89 c6             	mov    %rax,%rsi
  8047d0:	bf 00 00 00 00       	mov    $0x0,%edi
  8047d5:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  8047dc:	00 00 00 
  8047df:	ff d0                	callq  *%rax
  8047e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8047e4:	48 83 c4 38          	add    $0x38,%rsp
  8047e8:	5b                   	pop    %rbx
  8047e9:	5d                   	pop    %rbp
  8047ea:	c3                   	retq   

00000000008047eb <_pipeisclosed>:
  8047eb:	55                   	push   %rbp
  8047ec:	48 89 e5             	mov    %rsp,%rbp
  8047ef:	53                   	push   %rbx
  8047f0:	48 83 ec 28          	sub    $0x28,%rsp
  8047f4:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8047f8:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8047fc:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  804803:	00 00 00 
  804806:	48 8b 00             	mov    (%rax),%rax
  804809:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  80480f:	89 45 ec             	mov    %eax,-0x14(%rbp)
  804812:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804816:	48 89 c7             	mov    %rax,%rdi
  804819:	48 b8 82 4e 80 00 00 	movabs $0x804e82,%rax
  804820:	00 00 00 
  804823:	ff d0                	callq  *%rax
  804825:	89 c3                	mov    %eax,%ebx
  804827:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80482b:	48 89 c7             	mov    %rax,%rdi
  80482e:	48 b8 82 4e 80 00 00 	movabs $0x804e82,%rax
  804835:	00 00 00 
  804838:	ff d0                	callq  *%rax
  80483a:	39 c3                	cmp    %eax,%ebx
  80483c:	0f 94 c0             	sete   %al
  80483f:	0f b6 c0             	movzbl %al,%eax
  804842:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804845:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  80484c:	00 00 00 
  80484f:	48 8b 00             	mov    (%rax),%rax
  804852:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  804858:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80485b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80485e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  804861:	75 05                	jne    804868 <_pipeisclosed+0x7d>
  804863:	8b 45 e8             	mov    -0x18(%rbp),%eax
  804866:	eb 4a                	jmp    8048b2 <_pipeisclosed+0xc7>
  804868:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80486b:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  80486e:	74 8c                	je     8047fc <_pipeisclosed+0x11>
  804870:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  804874:	75 86                	jne    8047fc <_pipeisclosed+0x11>
  804876:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  80487d:	00 00 00 
  804880:	48 8b 00             	mov    (%rax),%rax
  804883:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  804889:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80488c:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80488f:	89 c6                	mov    %eax,%esi
  804891:	48 bf e6 57 80 00 00 	movabs $0x8057e6,%rdi
  804898:	00 00 00 
  80489b:	b8 00 00 00 00       	mov    $0x0,%eax
  8048a0:	49 b8 8c 09 80 00 00 	movabs $0x80098c,%r8
  8048a7:	00 00 00 
  8048aa:	41 ff d0             	callq  *%r8
  8048ad:	e9 4a ff ff ff       	jmpq   8047fc <_pipeisclosed+0x11>
  8048b2:	48 83 c4 28          	add    $0x28,%rsp
  8048b6:	5b                   	pop    %rbx
  8048b7:	5d                   	pop    %rbp
  8048b8:	c3                   	retq   

00000000008048b9 <pipeisclosed>:
  8048b9:	55                   	push   %rbp
  8048ba:	48 89 e5             	mov    %rsp,%rbp
  8048bd:	48 83 ec 30          	sub    $0x30,%rsp
  8048c1:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8048c4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8048c8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8048cb:	48 89 d6             	mov    %rdx,%rsi
  8048ce:	89 c7                	mov    %eax,%edi
  8048d0:	48 b8 2e 23 80 00 00 	movabs $0x80232e,%rax
  8048d7:	00 00 00 
  8048da:	ff d0                	callq  *%rax
  8048dc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8048df:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8048e3:	79 05                	jns    8048ea <pipeisclosed+0x31>
  8048e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8048e8:	eb 31                	jmp    80491b <pipeisclosed+0x62>
  8048ea:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8048ee:	48 89 c7             	mov    %rax,%rdi
  8048f1:	48 b8 6b 22 80 00 00 	movabs $0x80226b,%rax
  8048f8:	00 00 00 
  8048fb:	ff d0                	callq  *%rax
  8048fd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804901:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804905:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804909:	48 89 d6             	mov    %rdx,%rsi
  80490c:	48 89 c7             	mov    %rax,%rdi
  80490f:	48 b8 eb 47 80 00 00 	movabs $0x8047eb,%rax
  804916:	00 00 00 
  804919:	ff d0                	callq  *%rax
  80491b:	c9                   	leaveq 
  80491c:	c3                   	retq   

000000000080491d <devpipe_read>:
  80491d:	55                   	push   %rbp
  80491e:	48 89 e5             	mov    %rsp,%rbp
  804921:	48 83 ec 40          	sub    $0x40,%rsp
  804925:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804929:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80492d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804931:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804935:	48 89 c7             	mov    %rax,%rdi
  804938:	48 b8 6b 22 80 00 00 	movabs $0x80226b,%rax
  80493f:	00 00 00 
  804942:	ff d0                	callq  *%rax
  804944:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804948:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80494c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804950:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804957:	00 
  804958:	e9 90 00 00 00       	jmpq   8049ed <devpipe_read+0xd0>
  80495d:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  804962:	74 09                	je     80496d <devpipe_read+0x50>
  804964:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804968:	e9 8e 00 00 00       	jmpq   8049fb <devpipe_read+0xde>
  80496d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804971:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804975:	48 89 d6             	mov    %rdx,%rsi
  804978:	48 89 c7             	mov    %rax,%rdi
  80497b:	48 b8 eb 47 80 00 00 	movabs $0x8047eb,%rax
  804982:	00 00 00 
  804985:	ff d0                	callq  *%rax
  804987:	85 c0                	test   %eax,%eax
  804989:	74 07                	je     804992 <devpipe_read+0x75>
  80498b:	b8 00 00 00 00       	mov    $0x0,%eax
  804990:	eb 69                	jmp    8049fb <devpipe_read+0xde>
  804992:	48 b8 0f 1e 80 00 00 	movabs $0x801e0f,%rax
  804999:	00 00 00 
  80499c:	ff d0                	callq  *%rax
  80499e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049a2:	8b 10                	mov    (%rax),%edx
  8049a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049a8:	8b 40 04             	mov    0x4(%rax),%eax
  8049ab:	39 c2                	cmp    %eax,%edx
  8049ad:	74 ae                	je     80495d <devpipe_read+0x40>
  8049af:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8049b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049b7:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8049bb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049bf:	8b 00                	mov    (%rax),%eax
  8049c1:	99                   	cltd   
  8049c2:	c1 ea 1b             	shr    $0x1b,%edx
  8049c5:	01 d0                	add    %edx,%eax
  8049c7:	83 e0 1f             	and    $0x1f,%eax
  8049ca:	29 d0                	sub    %edx,%eax
  8049cc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8049d0:	48 98                	cltq   
  8049d2:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8049d7:	88 01                	mov    %al,(%rcx)
  8049d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049dd:	8b 00                	mov    (%rax),%eax
  8049df:	8d 50 01             	lea    0x1(%rax),%edx
  8049e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8049e6:	89 10                	mov    %edx,(%rax)
  8049e8:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8049ed:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049f1:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8049f5:	72 a7                	jb     80499e <devpipe_read+0x81>
  8049f7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8049fb:	c9                   	leaveq 
  8049fc:	c3                   	retq   

00000000008049fd <devpipe_write>:
  8049fd:	55                   	push   %rbp
  8049fe:	48 89 e5             	mov    %rsp,%rbp
  804a01:	48 83 ec 40          	sub    $0x40,%rsp
  804a05:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  804a09:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  804a0d:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  804a11:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a15:	48 89 c7             	mov    %rax,%rdi
  804a18:	48 b8 6b 22 80 00 00 	movabs $0x80226b,%rax
  804a1f:	00 00 00 
  804a22:	ff d0                	callq  *%rax
  804a24:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804a28:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  804a2c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  804a30:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  804a37:	00 
  804a38:	e9 8f 00 00 00       	jmpq   804acc <devpipe_write+0xcf>
  804a3d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804a41:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804a45:	48 89 d6             	mov    %rdx,%rsi
  804a48:	48 89 c7             	mov    %rax,%rdi
  804a4b:	48 b8 eb 47 80 00 00 	movabs $0x8047eb,%rax
  804a52:	00 00 00 
  804a55:	ff d0                	callq  *%rax
  804a57:	85 c0                	test   %eax,%eax
  804a59:	74 07                	je     804a62 <devpipe_write+0x65>
  804a5b:	b8 00 00 00 00       	mov    $0x0,%eax
  804a60:	eb 78                	jmp    804ada <devpipe_write+0xdd>
  804a62:	48 b8 0f 1e 80 00 00 	movabs $0x801e0f,%rax
  804a69:	00 00 00 
  804a6c:	ff d0                	callq  *%rax
  804a6e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a72:	8b 40 04             	mov    0x4(%rax),%eax
  804a75:	48 63 d0             	movslq %eax,%rdx
  804a78:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a7c:	8b 00                	mov    (%rax),%eax
  804a7e:	48 98                	cltq   
  804a80:	48 83 c0 20          	add    $0x20,%rax
  804a84:	48 39 c2             	cmp    %rax,%rdx
  804a87:	73 b4                	jae    804a3d <devpipe_write+0x40>
  804a89:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804a8d:	8b 40 04             	mov    0x4(%rax),%eax
  804a90:	99                   	cltd   
  804a91:	c1 ea 1b             	shr    $0x1b,%edx
  804a94:	01 d0                	add    %edx,%eax
  804a96:	83 e0 1f             	and    $0x1f,%eax
  804a99:	29 d0                	sub    %edx,%eax
  804a9b:	89 c6                	mov    %eax,%esi
  804a9d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804aa1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804aa5:	48 01 d0             	add    %rdx,%rax
  804aa8:	0f b6 08             	movzbl (%rax),%ecx
  804aab:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  804aaf:	48 63 c6             	movslq %esi,%rax
  804ab2:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  804ab6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804aba:	8b 40 04             	mov    0x4(%rax),%eax
  804abd:	8d 50 01             	lea    0x1(%rax),%edx
  804ac0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804ac4:	89 50 04             	mov    %edx,0x4(%rax)
  804ac7:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  804acc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ad0:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  804ad4:	72 98                	jb     804a6e <devpipe_write+0x71>
  804ad6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ada:	c9                   	leaveq 
  804adb:	c3                   	retq   

0000000000804adc <devpipe_stat>:
  804adc:	55                   	push   %rbp
  804add:	48 89 e5             	mov    %rsp,%rbp
  804ae0:	48 83 ec 20          	sub    $0x20,%rsp
  804ae4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804ae8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804aec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804af0:	48 89 c7             	mov    %rax,%rdi
  804af3:	48 b8 6b 22 80 00 00 	movabs $0x80226b,%rax
  804afa:	00 00 00 
  804afd:	ff d0                	callq  *%rax
  804aff:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804b03:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804b07:	48 be f9 57 80 00 00 	movabs $0x8057f9,%rsi
  804b0e:	00 00 00 
  804b11:	48 89 c7             	mov    %rax,%rdi
  804b14:	48 b8 1c 15 80 00 00 	movabs $0x80151c,%rax
  804b1b:	00 00 00 
  804b1e:	ff d0                	callq  *%rax
  804b20:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b24:	8b 50 04             	mov    0x4(%rax),%edx
  804b27:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b2b:	8b 00                	mov    (%rax),%eax
  804b2d:	29 c2                	sub    %eax,%edx
  804b2f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804b33:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  804b39:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804b3d:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  804b44:	00 00 00 
  804b47:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804b4b:	48 b9 80 88 80 00 00 	movabs $0x808880,%rcx
  804b52:	00 00 00 
  804b55:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  804b5c:	b8 00 00 00 00       	mov    $0x0,%eax
  804b61:	c9                   	leaveq 
  804b62:	c3                   	retq   

0000000000804b63 <devpipe_close>:
  804b63:	55                   	push   %rbp
  804b64:	48 89 e5             	mov    %rsp,%rbp
  804b67:	48 83 ec 10          	sub    $0x10,%rsp
  804b6b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804b6f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b73:	48 89 c6             	mov    %rax,%rsi
  804b76:	bf 00 00 00 00       	mov    $0x0,%edi
  804b7b:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  804b82:	00 00 00 
  804b85:	ff d0                	callq  *%rax
  804b87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804b8b:	48 89 c7             	mov    %rax,%rdi
  804b8e:	48 b8 6b 22 80 00 00 	movabs $0x80226b,%rax
  804b95:	00 00 00 
  804b98:	ff d0                	callq  *%rax
  804b9a:	48 89 c6             	mov    %rax,%rsi
  804b9d:	bf 00 00 00 00       	mov    $0x0,%edi
  804ba2:	48 b8 fe 1e 80 00 00 	movabs $0x801efe,%rax
  804ba9:	00 00 00 
  804bac:	ff d0                	callq  *%rax
  804bae:	c9                   	leaveq 
  804baf:	c3                   	retq   

0000000000804bb0 <wait>:
  804bb0:	55                   	push   %rbp
  804bb1:	48 89 e5             	mov    %rsp,%rbp
  804bb4:	48 83 ec 20          	sub    $0x20,%rsp
  804bb8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804bbb:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  804bbf:	75 35                	jne    804bf6 <wait+0x46>
  804bc1:	48 b9 00 58 80 00 00 	movabs $0x805800,%rcx
  804bc8:	00 00 00 
  804bcb:	48 ba 0b 58 80 00 00 	movabs $0x80580b,%rdx
  804bd2:	00 00 00 
  804bd5:	be 0a 00 00 00       	mov    $0xa,%esi
  804bda:	48 bf 20 58 80 00 00 	movabs $0x805820,%rdi
  804be1:	00 00 00 
  804be4:	b8 00 00 00 00       	mov    $0x0,%eax
  804be9:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  804bf0:	00 00 00 
  804bf3:	41 ff d0             	callq  *%r8
  804bf6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804bf9:	25 ff 03 00 00       	and    $0x3ff,%eax
  804bfe:	48 98                	cltq   
  804c00:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  804c07:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804c0e:	00 00 00 
  804c11:	48 01 d0             	add    %rdx,%rax
  804c14:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804c18:	eb 0c                	jmp    804c26 <wait+0x76>
  804c1a:	48 b8 0f 1e 80 00 00 	movabs $0x801e0f,%rax
  804c21:	00 00 00 
  804c24:	ff d0                	callq  *%rax
  804c26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c2a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  804c30:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804c33:	75 0e                	jne    804c43 <wait+0x93>
  804c35:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804c39:	8b 80 d4 00 00 00    	mov    0xd4(%rax),%eax
  804c3f:	85 c0                	test   %eax,%eax
  804c41:	75 d7                	jne    804c1a <wait+0x6a>
  804c43:	90                   	nop
  804c44:	c9                   	leaveq 
  804c45:	c3                   	retq   

0000000000804c46 <ipc_recv>:
  804c46:	55                   	push   %rbp
  804c47:	48 89 e5             	mov    %rsp,%rbp
  804c4a:	48 83 ec 30          	sub    $0x30,%rsp
  804c4e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804c52:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  804c56:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  804c5a:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804c5f:	75 0e                	jne    804c6f <ipc_recv+0x29>
  804c61:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804c68:	00 00 00 
  804c6b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804c6f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  804c73:	48 89 c7             	mov    %rax,%rdi
  804c76:	48 b8 86 20 80 00 00 	movabs $0x802086,%rax
  804c7d:	00 00 00 
  804c80:	ff d0                	callq  *%rax
  804c82:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804c85:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804c89:	79 27                	jns    804cb2 <ipc_recv+0x6c>
  804c8b:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804c90:	74 0a                	je     804c9c <ipc_recv+0x56>
  804c92:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804c96:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804c9c:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804ca1:	74 0a                	je     804cad <ipc_recv+0x67>
  804ca3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804ca7:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  804cad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804cb0:	eb 53                	jmp    804d05 <ipc_recv+0xbf>
  804cb2:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  804cb7:	74 19                	je     804cd2 <ipc_recv+0x8c>
  804cb9:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  804cc0:	00 00 00 
  804cc3:	48 8b 00             	mov    (%rax),%rax
  804cc6:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  804ccc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804cd0:	89 10                	mov    %edx,(%rax)
  804cd2:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  804cd7:	74 19                	je     804cf2 <ipc_recv+0xac>
  804cd9:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  804ce0:	00 00 00 
  804ce3:	48 8b 00             	mov    (%rax),%rax
  804ce6:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  804cec:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804cf0:	89 10                	mov    %edx,(%rax)
  804cf2:	48 b8 90 a7 80 00 00 	movabs $0x80a790,%rax
  804cf9:	00 00 00 
  804cfc:	48 8b 00             	mov    (%rax),%rax
  804cff:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804d05:	c9                   	leaveq 
  804d06:	c3                   	retq   

0000000000804d07 <ipc_send>:
  804d07:	55                   	push   %rbp
  804d08:	48 89 e5             	mov    %rsp,%rbp
  804d0b:	48 83 ec 30          	sub    $0x30,%rsp
  804d0f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804d12:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804d15:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  804d19:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  804d1c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804d21:	75 1c                	jne    804d3f <ipc_send+0x38>
  804d23:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  804d2a:	00 00 00 
  804d2d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804d31:	eb 0c                	jmp    804d3f <ipc_send+0x38>
  804d33:	48 b8 0f 1e 80 00 00 	movabs $0x801e0f,%rax
  804d3a:	00 00 00 
  804d3d:	ff d0                	callq  *%rax
  804d3f:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804d42:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804d45:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  804d49:	8b 45 ec             	mov    -0x14(%rbp),%eax
  804d4c:	89 c7                	mov    %eax,%edi
  804d4e:	48 b8 2f 20 80 00 00 	movabs $0x80202f,%rax
  804d55:	00 00 00 
  804d58:	ff d0                	callq  *%rax
  804d5a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804d5d:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804d61:	74 d0                	je     804d33 <ipc_send+0x2c>
  804d63:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804d67:	79 30                	jns    804d99 <ipc_send+0x92>
  804d69:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804d6c:	89 c1                	mov    %eax,%ecx
  804d6e:	48 ba 30 58 80 00 00 	movabs $0x805830,%rdx
  804d75:	00 00 00 
  804d78:	be 44 00 00 00       	mov    $0x44,%esi
  804d7d:	48 bf 46 58 80 00 00 	movabs $0x805846,%rdi
  804d84:	00 00 00 
  804d87:	b8 00 00 00 00       	mov    $0x0,%eax
  804d8c:	49 b8 52 07 80 00 00 	movabs $0x800752,%r8
  804d93:	00 00 00 
  804d96:	41 ff d0             	callq  *%r8
  804d99:	90                   	nop
  804d9a:	c9                   	leaveq 
  804d9b:	c3                   	retq   

0000000000804d9c <ipc_host_recv>:
  804d9c:	55                   	push   %rbp
  804d9d:	48 89 e5             	mov    %rsp,%rbp
  804da0:	48 83 ec 10          	sub    $0x10,%rsp
  804da4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  804da8:	48 ba 58 58 80 00 00 	movabs $0x805858,%rdx
  804daf:	00 00 00 
  804db2:	be 4e 00 00 00       	mov    $0x4e,%esi
  804db7:	48 bf 46 58 80 00 00 	movabs $0x805846,%rdi
  804dbe:	00 00 00 
  804dc1:	b8 00 00 00 00       	mov    $0x0,%eax
  804dc6:	48 b9 52 07 80 00 00 	movabs $0x800752,%rcx
  804dcd:	00 00 00 
  804dd0:	ff d1                	callq  *%rcx

0000000000804dd2 <ipc_host_send>:
  804dd2:	55                   	push   %rbp
  804dd3:	48 89 e5             	mov    %rsp,%rbp
  804dd6:	48 83 ec 20          	sub    $0x20,%rsp
  804dda:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804ddd:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804de0:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804de4:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804de7:	48 ba 78 58 80 00 00 	movabs $0x805878,%rdx
  804dee:	00 00 00 
  804df1:	be 58 00 00 00       	mov    $0x58,%esi
  804df6:	48 bf 46 58 80 00 00 	movabs $0x805846,%rdi
  804dfd:	00 00 00 
  804e00:	b8 00 00 00 00       	mov    $0x0,%eax
  804e05:	48 b9 52 07 80 00 00 	movabs $0x800752,%rcx
  804e0c:	00 00 00 
  804e0f:	ff d1                	callq  *%rcx

0000000000804e11 <ipc_find_env>:
  804e11:	55                   	push   %rbp
  804e12:	48 89 e5             	mov    %rsp,%rbp
  804e15:	48 83 ec 18          	sub    $0x18,%rsp
  804e19:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804e1c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804e23:	eb 4d                	jmp    804e72 <ipc_find_env+0x61>
  804e25:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804e2c:	00 00 00 
  804e2f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e32:	48 98                	cltq   
  804e34:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804e3b:	48 01 d0             	add    %rdx,%rax
  804e3e:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804e44:	8b 00                	mov    (%rax),%eax
  804e46:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  804e49:	75 23                	jne    804e6e <ipc_find_env+0x5d>
  804e4b:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804e52:	00 00 00 
  804e55:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804e58:	48 98                	cltq   
  804e5a:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804e61:	48 01 d0             	add    %rdx,%rax
  804e64:	48 05 c8 00 00 00    	add    $0xc8,%rax
  804e6a:	8b 00                	mov    (%rax),%eax
  804e6c:	eb 12                	jmp    804e80 <ipc_find_env+0x6f>
  804e6e:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804e72:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  804e79:	7e aa                	jle    804e25 <ipc_find_env+0x14>
  804e7b:	b8 00 00 00 00       	mov    $0x0,%eax
  804e80:	c9                   	leaveq 
  804e81:	c3                   	retq   

0000000000804e82 <pageref>:
  804e82:	55                   	push   %rbp
  804e83:	48 89 e5             	mov    %rsp,%rbp
  804e86:	48 83 ec 18          	sub    $0x18,%rsp
  804e8a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  804e8e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804e92:	48 c1 e8 15          	shr    $0x15,%rax
  804e96:	48 89 c2             	mov    %rax,%rdx
  804e99:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  804ea0:	01 00 00 
  804ea3:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804ea7:	83 e0 01             	and    $0x1,%eax
  804eaa:	48 85 c0             	test   %rax,%rax
  804ead:	75 07                	jne    804eb6 <pageref+0x34>
  804eaf:	b8 00 00 00 00       	mov    $0x0,%eax
  804eb4:	eb 56                	jmp    804f0c <pageref+0x8a>
  804eb6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804eba:	48 c1 e8 0c          	shr    $0xc,%rax
  804ebe:	48 89 c2             	mov    %rax,%rdx
  804ec1:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  804ec8:	01 00 00 
  804ecb:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  804ecf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  804ed3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804ed7:	83 e0 01             	and    $0x1,%eax
  804eda:	48 85 c0             	test   %rax,%rax
  804edd:	75 07                	jne    804ee6 <pageref+0x64>
  804edf:	b8 00 00 00 00       	mov    $0x0,%eax
  804ee4:	eb 26                	jmp    804f0c <pageref+0x8a>
  804ee6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804eea:	48 c1 e8 0c          	shr    $0xc,%rax
  804eee:	48 89 c2             	mov    %rax,%rdx
  804ef1:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  804ef8:	00 00 00 
  804efb:	48 c1 e2 04          	shl    $0x4,%rdx
  804eff:	48 01 d0             	add    %rdx,%rax
  804f02:	48 83 c0 08          	add    $0x8,%rax
  804f06:	0f b7 00             	movzwl (%rax),%eax
  804f09:	0f b7 c0             	movzwl %ax,%eax
  804f0c:	c9                   	leaveq 
  804f0d:	c3                   	retq   
