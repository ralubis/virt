
vmm/guest/obj/user/echotest:     file format elf64-x86-64


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
  80003c:	e8 db 02 00 00       	callq  80031c <libmain>
1:	jmp 1b
  800041:	eb fe                	jmp    800041 <args_exist+0xe>

0000000000800043 <die>:
  800043:	55                   	push   %rbp
  800044:	48 89 e5             	mov    %rsp,%rbp
  800047:	48 83 ec 10          	sub    $0x10,%rsp
  80004b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80004f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800053:	48 89 c6             	mov    %rax,%rsi
  800056:	48 bf ee 46 80 00 00 	movabs $0x8046ee,%rdi
  80005d:	00 00 00 
  800060:	b8 00 00 00 00       	mov    $0x0,%eax
  800065:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  80006c:	00 00 00 
  80006f:	ff d2                	callq  *%rdx
  800071:	48 b8 a0 03 80 00 00 	movabs $0x8003a0,%rax
  800078:	00 00 00 
  80007b:	ff d0                	callq  *%rax
  80007d:	90                   	nop
  80007e:	c9                   	leaveq 
  80007f:	c3                   	retq   

0000000000800080 <umain>:
  800080:	55                   	push   %rbp
  800081:	48 89 e5             	mov    %rsp,%rbp
  800084:	48 83 ec 50          	sub    $0x50,%rsp
  800088:	89 7d bc             	mov    %edi,-0x44(%rbp)
  80008b:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
  80008f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  800096:	48 bf f2 46 80 00 00 	movabs $0x8046f2,%rdi
  80009d:	00 00 00 
  8000a0:	b8 00 00 00 00       	mov    $0x0,%eax
  8000a5:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  8000ac:	00 00 00 
  8000af:	ff d2                	callq  *%rdx
  8000b1:	48 bf 02 47 80 00 00 	movabs $0x804702,%rdi
  8000b8:	00 00 00 
  8000bb:	48 b8 30 42 80 00 00 	movabs $0x804230,%rax
  8000c2:	00 00 00 
  8000c5:	ff d0                	callq  *%rax
  8000c7:	89 c2                	mov    %eax,%edx
  8000c9:	48 be 02 47 80 00 00 	movabs $0x804702,%rsi
  8000d0:	00 00 00 
  8000d3:	48 bf 0c 47 80 00 00 	movabs $0x80470c,%rdi
  8000da:	00 00 00 
  8000dd:	b8 00 00 00 00       	mov    $0x0,%eax
  8000e2:	48 b9 ea 04 80 00 00 	movabs $0x8004ea,%rcx
  8000e9:	00 00 00 
  8000ec:	ff d1                	callq  *%rcx
  8000ee:	ba 06 00 00 00       	mov    $0x6,%edx
  8000f3:	be 01 00 00 00       	mov    $0x1,%esi
  8000f8:	bf 02 00 00 00       	mov    $0x2,%edi
  8000fd:	48 b8 4e 31 80 00 00 	movabs $0x80314e,%rax
  800104:	00 00 00 
  800107:	ff d0                	callq  *%rax
  800109:	89 45 f8             	mov    %eax,-0x8(%rbp)
  80010c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  800110:	79 16                	jns    800128 <umain+0xa8>
  800112:	48 bf 21 47 80 00 00 	movabs $0x804721,%rdi
  800119:	00 00 00 
  80011c:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800123:	00 00 00 
  800126:	ff d0                	callq  *%rax
  800128:	48 bf 39 47 80 00 00 	movabs $0x804739,%rdi
  80012f:	00 00 00 
  800132:	b8 00 00 00 00       	mov    $0x0,%eax
  800137:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  80013e:	00 00 00 
  800141:	ff d2                	callq  *%rdx
  800143:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  800147:	ba 10 00 00 00       	mov    $0x10,%edx
  80014c:	be 00 00 00 00       	mov    $0x0,%esi
  800151:	48 89 c7             	mov    %rax,%rdi
  800154:	48 b8 14 13 80 00 00 	movabs $0x801314,%rax
  80015b:	00 00 00 
  80015e:	ff d0                	callq  *%rax
  800160:	c6 45 e1 02          	movb   $0x2,-0x1f(%rbp)
  800164:	48 bf 02 47 80 00 00 	movabs $0x804702,%rdi
  80016b:	00 00 00 
  80016e:	48 b8 30 42 80 00 00 	movabs $0x804230,%rax
  800175:	00 00 00 
  800178:	ff d0                	callq  *%rax
  80017a:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80017d:	bf 10 27 00 00       	mov    $0x2710,%edi
  800182:	48 b8 41 46 80 00 00 	movabs $0x804641,%rax
  800189:	00 00 00 
  80018c:	ff d0                	callq  *%rax
  80018e:	66 89 45 e2          	mov    %ax,-0x1e(%rbp)
  800192:	48 bf 48 47 80 00 00 	movabs $0x804748,%rdi
  800199:	00 00 00 
  80019c:	b8 00 00 00 00       	mov    $0x0,%eax
  8001a1:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  8001a8:	00 00 00 
  8001ab:	ff d2                	callq  *%rdx
  8001ad:	48 8d 4d e0          	lea    -0x20(%rbp),%rcx
  8001b1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8001b4:	ba 10 00 00 00       	mov    $0x10,%edx
  8001b9:	48 89 ce             	mov    %rcx,%rsi
  8001bc:	89 c7                	mov    %eax,%edi
  8001be:	48 b8 13 30 80 00 00 	movabs $0x803013,%rax
  8001c5:	00 00 00 
  8001c8:	ff d0                	callq  *%rax
  8001ca:	85 c0                	test   %eax,%eax
  8001cc:	79 16                	jns    8001e4 <umain+0x164>
  8001ce:	48 bf 65 47 80 00 00 	movabs $0x804765,%rdi
  8001d5:	00 00 00 
  8001d8:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8001df:	00 00 00 
  8001e2:	ff d0                	callq  *%rax
  8001e4:	48 bf 83 47 80 00 00 	movabs $0x804783,%rdi
  8001eb:	00 00 00 
  8001ee:	b8 00 00 00 00       	mov    $0x0,%eax
  8001f3:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  8001fa:	00 00 00 
  8001fd:	ff d2                	callq  *%rdx
  8001ff:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800206:	00 00 00 
  800209:	48 8b 00             	mov    (%rax),%rax
  80020c:	48 89 c7             	mov    %rax,%rdi
  80020f:	48 b8 0e 10 80 00 00 	movabs $0x80100e,%rax
  800216:	00 00 00 
  800219:	ff d0                	callq  *%rax
  80021b:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80021e:	8b 55 f4             	mov    -0xc(%rbp),%edx
  800221:	48 b8 00 60 80 00 00 	movabs $0x806000,%rax
  800228:	00 00 00 
  80022b:	48 8b 08             	mov    (%rax),%rcx
  80022e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800231:	48 89 ce             	mov    %rcx,%rsi
  800234:	89 c7                	mov    %eax,%edi
  800236:	48 b8 0c 24 80 00 00 	movabs $0x80240c,%rax
  80023d:	00 00 00 
  800240:	ff d0                	callq  *%rax
  800242:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  800245:	74 16                	je     80025d <umain+0x1dd>
  800247:	48 bf 98 47 80 00 00 	movabs $0x804798,%rdi
  80024e:	00 00 00 
  800251:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  800258:	00 00 00 
  80025b:	ff d0                	callq  *%rax
  80025d:	48 bf b9 47 80 00 00 	movabs $0x8047b9,%rdi
  800264:	00 00 00 
  800267:	b8 00 00 00 00       	mov    $0x0,%eax
  80026c:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  800273:	00 00 00 
  800276:	ff d2                	callq  *%rdx
  800278:	eb 6b                	jmp    8002e5 <umain+0x265>
  80027a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
  800281:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
  800285:	8b 45 f8             	mov    -0x8(%rbp),%eax
  800288:	ba 1f 00 00 00       	mov    $0x1f,%edx
  80028d:	48 89 ce             	mov    %rcx,%rsi
  800290:	89 c7                	mov    %eax,%edi
  800292:	48 b8 c1 22 80 00 00 	movabs $0x8022c1,%rax
  800299:	00 00 00 
  80029c:	ff d0                	callq  *%rax
  80029e:	89 45 f0             	mov    %eax,-0x10(%rbp)
  8002a1:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  8002a5:	7f 16                	jg     8002bd <umain+0x23d>
  8002a7:	48 bf c8 47 80 00 00 	movabs $0x8047c8,%rdi
  8002ae:	00 00 00 
  8002b1:	48 b8 43 00 80 00 00 	movabs $0x800043,%rax
  8002b8:	00 00 00 
  8002bb:	ff d0                	callq  *%rax
  8002bd:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002c0:	01 45 fc             	add    %eax,-0x4(%rbp)
  8002c3:	8b 45 f0             	mov    -0x10(%rbp),%eax
  8002c6:	48 98                	cltq   
  8002c8:	c6 44 05 c0 00       	movb   $0x0,-0x40(%rbp,%rax,1)
  8002cd:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  8002d1:	48 89 c7             	mov    %rax,%rdi
  8002d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8002d9:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  8002e0:	00 00 00 
  8002e3:	ff d2                	callq  *%rdx
  8002e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8002e8:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  8002eb:	72 8d                	jb     80027a <umain+0x1fa>
  8002ed:	48 bf ec 47 80 00 00 	movabs $0x8047ec,%rdi
  8002f4:	00 00 00 
  8002f7:	b8 00 00 00 00       	mov    $0x0,%eax
  8002fc:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  800303:	00 00 00 
  800306:	ff d2                	callq  *%rdx
  800308:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80030b:	89 c7                	mov    %eax,%edi
  80030d:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  800314:	00 00 00 
  800317:	ff d0                	callq  *%rax
  800319:	90                   	nop
  80031a:	c9                   	leaveq 
  80031b:	c3                   	retq   

000000000080031c <libmain>:
  80031c:	55                   	push   %rbp
  80031d:	48 89 e5             	mov    %rsp,%rbp
  800320:	48 83 ec 10          	sub    $0x10,%rsp
  800324:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800327:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80032b:	48 b8 31 19 80 00 00 	movabs $0x801931,%rax
  800332:	00 00 00 
  800335:	ff d0                	callq  *%rax
  800337:	25 ff 03 00 00       	and    $0x3ff,%eax
  80033c:	48 98                	cltq   
  80033e:	48 69 d0 68 01 00 00 	imul   $0x168,%rax,%rdx
  800345:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80034c:	00 00 00 
  80034f:	48 01 c2             	add    %rax,%rdx
  800352:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  800359:	00 00 00 
  80035c:	48 89 10             	mov    %rdx,(%rax)
  80035f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  800363:	7e 14                	jle    800379 <libmain+0x5d>
  800365:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800369:	48 8b 10             	mov    (%rax),%rdx
  80036c:	48 b8 08 60 80 00 00 	movabs $0x806008,%rax
  800373:	00 00 00 
  800376:	48 89 10             	mov    %rdx,(%rax)
  800379:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80037d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  800380:	48 89 d6             	mov    %rdx,%rsi
  800383:	89 c7                	mov    %eax,%edi
  800385:	48 b8 80 00 80 00 00 	movabs $0x800080,%rax
  80038c:	00 00 00 
  80038f:	ff d0                	callq  *%rax
  800391:	48 b8 a0 03 80 00 00 	movabs $0x8003a0,%rax
  800398:	00 00 00 
  80039b:	ff d0                	callq  *%rax
  80039d:	90                   	nop
  80039e:	c9                   	leaveq 
  80039f:	c3                   	retq   

00000000008003a0 <exit>:
  8003a0:	55                   	push   %rbp
  8003a1:	48 89 e5             	mov    %rsp,%rbp
  8003a4:	48 b8 e9 20 80 00 00 	movabs $0x8020e9,%rax
  8003ab:	00 00 00 
  8003ae:	ff d0                	callq  *%rax
  8003b0:	bf 00 00 00 00       	mov    $0x0,%edi
  8003b5:	48 b8 eb 18 80 00 00 	movabs $0x8018eb,%rax
  8003bc:	00 00 00 
  8003bf:	ff d0                	callq  *%rax
  8003c1:	90                   	nop
  8003c2:	5d                   	pop    %rbp
  8003c3:	c3                   	retq   

00000000008003c4 <putch>:
  8003c4:	55                   	push   %rbp
  8003c5:	48 89 e5             	mov    %rsp,%rbp
  8003c8:	48 83 ec 10          	sub    $0x10,%rsp
  8003cc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8003cf:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8003d3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003d7:	8b 00                	mov    (%rax),%eax
  8003d9:	8d 48 01             	lea    0x1(%rax),%ecx
  8003dc:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003e0:	89 0a                	mov    %ecx,(%rdx)
  8003e2:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8003e5:	89 d1                	mov    %edx,%ecx
  8003e7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8003eb:	48 98                	cltq   
  8003ed:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  8003f1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8003f5:	8b 00                	mov    (%rax),%eax
  8003f7:	3d ff 00 00 00       	cmp    $0xff,%eax
  8003fc:	75 2c                	jne    80042a <putch+0x66>
  8003fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800402:	8b 00                	mov    (%rax),%eax
  800404:	48 98                	cltq   
  800406:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80040a:	48 83 c2 08          	add    $0x8,%rdx
  80040e:	48 89 c6             	mov    %rax,%rsi
  800411:	48 89 d7             	mov    %rdx,%rdi
  800414:	48 b8 62 18 80 00 00 	movabs $0x801862,%rax
  80041b:	00 00 00 
  80041e:	ff d0                	callq  *%rax
  800420:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800424:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  80042a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80042e:	8b 40 04             	mov    0x4(%rax),%eax
  800431:	8d 50 01             	lea    0x1(%rax),%edx
  800434:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800438:	89 50 04             	mov    %edx,0x4(%rax)
  80043b:	90                   	nop
  80043c:	c9                   	leaveq 
  80043d:	c3                   	retq   

000000000080043e <vcprintf>:
  80043e:	55                   	push   %rbp
  80043f:	48 89 e5             	mov    %rsp,%rbp
  800442:	48 81 ec 40 01 00 00 	sub    $0x140,%rsp
  800449:	48 89 bd c8 fe ff ff 	mov    %rdi,-0x138(%rbp)
  800450:	48 89 b5 c0 fe ff ff 	mov    %rsi,-0x140(%rbp)
  800457:	48 8d 85 d8 fe ff ff 	lea    -0x128(%rbp),%rax
  80045e:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
  800465:	48 8b 0a             	mov    (%rdx),%rcx
  800468:	48 89 08             	mov    %rcx,(%rax)
  80046b:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  80046f:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800473:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800477:	48 89 50 10          	mov    %rdx,0x10(%rax)
  80047b:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%rbp)
  800482:	00 00 00 
  800485:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%rbp)
  80048c:	00 00 00 
  80048f:	48 8d 8d d8 fe ff ff 	lea    -0x128(%rbp),%rcx
  800496:	48 8b 95 c8 fe ff ff 	mov    -0x138(%rbp),%rdx
  80049d:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
  8004a4:	48 89 c6             	mov    %rax,%rsi
  8004a7:	48 bf c4 03 80 00 00 	movabs $0x8003c4,%rdi
  8004ae:	00 00 00 
  8004b1:	48 b8 88 08 80 00 00 	movabs $0x800888,%rax
  8004b8:	00 00 00 
  8004bb:	ff d0                	callq  *%rax
  8004bd:	8b 85 f0 fe ff ff    	mov    -0x110(%rbp),%eax
  8004c3:	48 98                	cltq   
  8004c5:	48 8d 95 f0 fe ff ff 	lea    -0x110(%rbp),%rdx
  8004cc:	48 83 c2 08          	add    $0x8,%rdx
  8004d0:	48 89 c6             	mov    %rax,%rsi
  8004d3:	48 89 d7             	mov    %rdx,%rdi
  8004d6:	48 b8 62 18 80 00 00 	movabs $0x801862,%rax
  8004dd:	00 00 00 
  8004e0:	ff d0                	callq  *%rax
  8004e2:	8b 85 f4 fe ff ff    	mov    -0x10c(%rbp),%eax
  8004e8:	c9                   	leaveq 
  8004e9:	c3                   	retq   

00000000008004ea <cprintf>:
  8004ea:	55                   	push   %rbp
  8004eb:	48 89 e5             	mov    %rsp,%rbp
  8004ee:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  8004f5:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  8004fc:	48 89 b5 58 ff ff ff 	mov    %rsi,-0xa8(%rbp)
  800503:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  80050a:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800511:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800518:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  80051f:	84 c0                	test   %al,%al
  800521:	74 20                	je     800543 <cprintf+0x59>
  800523:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800527:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  80052b:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  80052f:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800533:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800537:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  80053b:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  80053f:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800543:	c7 85 30 ff ff ff 08 	movl   $0x8,-0xd0(%rbp)
  80054a:	00 00 00 
  80054d:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800554:	00 00 00 
  800557:	48 8d 45 10          	lea    0x10(%rbp),%rax
  80055b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800562:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800569:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800570:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800577:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  80057e:	48 8b 0a             	mov    (%rdx),%rcx
  800581:	48 89 08             	mov    %rcx,(%rax)
  800584:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800588:	48 89 48 08          	mov    %rcx,0x8(%rax)
  80058c:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800590:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800594:	48 8d 95 18 ff ff ff 	lea    -0xe8(%rbp),%rdx
  80059b:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  8005a2:	48 89 d6             	mov    %rdx,%rsi
  8005a5:	48 89 c7             	mov    %rax,%rdi
  8005a8:	48 b8 3e 04 80 00 00 	movabs $0x80043e,%rax
  8005af:	00 00 00 
  8005b2:	ff d0                	callq  *%rax
  8005b4:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  8005ba:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  8005c0:	c9                   	leaveq 
  8005c1:	c3                   	retq   

00000000008005c2 <printnum>:
  8005c2:	55                   	push   %rbp
  8005c3:	48 89 e5             	mov    %rsp,%rbp
  8005c6:	48 83 ec 30          	sub    $0x30,%rsp
  8005ca:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8005ce:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8005d2:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8005d6:	89 4d e4             	mov    %ecx,-0x1c(%rbp)
  8005d9:	44 89 45 e0          	mov    %r8d,-0x20(%rbp)
  8005dd:	44 89 4d dc          	mov    %r9d,-0x24(%rbp)
  8005e1:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  8005e4:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8005e8:	77 54                	ja     80063e <printnum+0x7c>
  8005ea:	8b 45 e0             	mov    -0x20(%rbp),%eax
  8005ed:	8d 78 ff             	lea    -0x1(%rax),%edi
  8005f0:	8b 75 e4             	mov    -0x1c(%rbp),%esi
  8005f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8005f7:	ba 00 00 00 00       	mov    $0x0,%edx
  8005fc:	48 f7 f6             	div    %rsi
  8005ff:	49 89 c2             	mov    %rax,%r10
  800602:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  800605:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  800608:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  80060c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800610:	41 89 c9             	mov    %ecx,%r9d
  800613:	41 89 f8             	mov    %edi,%r8d
  800616:	89 d1                	mov    %edx,%ecx
  800618:	4c 89 d2             	mov    %r10,%rdx
  80061b:	48 89 c7             	mov    %rax,%rdi
  80061e:	48 b8 c2 05 80 00 00 	movabs $0x8005c2,%rax
  800625:	00 00 00 
  800628:	ff d0                	callq  *%rax
  80062a:	eb 1c                	jmp    800648 <printnum+0x86>
  80062c:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  800630:	8b 55 dc             	mov    -0x24(%rbp),%edx
  800633:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800637:	48 89 ce             	mov    %rcx,%rsi
  80063a:	89 d7                	mov    %edx,%edi
  80063c:	ff d0                	callq  *%rax
  80063e:	83 6d e0 01          	subl   $0x1,-0x20(%rbp)
  800642:	83 7d e0 00          	cmpl   $0x0,-0x20(%rbp)
  800646:	7f e4                	jg     80062c <printnum+0x6a>
  800648:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  80064b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80064f:	ba 00 00 00 00       	mov    $0x0,%edx
  800654:	48 f7 f1             	div    %rcx
  800657:	48 b8 f0 49 80 00 00 	movabs $0x8049f0,%rax
  80065e:	00 00 00 
  800661:	0f b6 04 10          	movzbl (%rax,%rdx,1),%eax
  800665:	0f be d0             	movsbl %al,%edx
  800668:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  80066c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800670:	48 89 ce             	mov    %rcx,%rsi
  800673:	89 d7                	mov    %edx,%edi
  800675:	ff d0                	callq  *%rax
  800677:	90                   	nop
  800678:	c9                   	leaveq 
  800679:	c3                   	retq   

000000000080067a <getuint>:
  80067a:	55                   	push   %rbp
  80067b:	48 89 e5             	mov    %rsp,%rbp
  80067e:	48 83 ec 20          	sub    $0x20,%rsp
  800682:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  800686:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800689:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  80068d:	7e 4f                	jle    8006de <getuint+0x64>
  80068f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800693:	8b 00                	mov    (%rax),%eax
  800695:	83 f8 30             	cmp    $0x30,%eax
  800698:	73 24                	jae    8006be <getuint+0x44>
  80069a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80069e:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006a6:	8b 00                	mov    (%rax),%eax
  8006a8:	89 c0                	mov    %eax,%eax
  8006aa:	48 01 d0             	add    %rdx,%rax
  8006ad:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006b1:	8b 12                	mov    (%rdx),%edx
  8006b3:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8006b6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ba:	89 0a                	mov    %ecx,(%rdx)
  8006bc:	eb 14                	jmp    8006d2 <getuint+0x58>
  8006be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006c2:	48 8b 40 08          	mov    0x8(%rax),%rax
  8006c6:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8006ca:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8006ce:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8006d2:	48 8b 00             	mov    (%rax),%rax
  8006d5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8006d9:	e9 9d 00 00 00       	jmpq   80077b <getuint+0x101>
  8006de:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8006e2:	74 4c                	je     800730 <getuint+0xb6>
  8006e4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006e8:	8b 00                	mov    (%rax),%eax
  8006ea:	83 f8 30             	cmp    $0x30,%eax
  8006ed:	73 24                	jae    800713 <getuint+0x99>
  8006ef:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006f3:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8006f7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8006fb:	8b 00                	mov    (%rax),%eax
  8006fd:	89 c0                	mov    %eax,%eax
  8006ff:	48 01 d0             	add    %rdx,%rax
  800702:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800706:	8b 12                	mov    (%rdx),%edx
  800708:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80070b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80070f:	89 0a                	mov    %ecx,(%rdx)
  800711:	eb 14                	jmp    800727 <getuint+0xad>
  800713:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800717:	48 8b 40 08          	mov    0x8(%rax),%rax
  80071b:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80071f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800723:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800727:	48 8b 00             	mov    (%rax),%rax
  80072a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80072e:	eb 4b                	jmp    80077b <getuint+0x101>
  800730:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800734:	8b 00                	mov    (%rax),%eax
  800736:	83 f8 30             	cmp    $0x30,%eax
  800739:	73 24                	jae    80075f <getuint+0xe5>
  80073b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80073f:	48 8b 50 10          	mov    0x10(%rax),%rdx
  800743:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800747:	8b 00                	mov    (%rax),%eax
  800749:	89 c0                	mov    %eax,%eax
  80074b:	48 01 d0             	add    %rdx,%rax
  80074e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800752:	8b 12                	mov    (%rdx),%edx
  800754:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800757:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80075b:	89 0a                	mov    %ecx,(%rdx)
  80075d:	eb 14                	jmp    800773 <getuint+0xf9>
  80075f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800763:	48 8b 40 08          	mov    0x8(%rax),%rax
  800767:	48 8d 48 08          	lea    0x8(%rax),%rcx
  80076b:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80076f:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  800773:	8b 00                	mov    (%rax),%eax
  800775:	89 c0                	mov    %eax,%eax
  800777:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80077b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80077f:	c9                   	leaveq 
  800780:	c3                   	retq   

0000000000800781 <getint>:
  800781:	55                   	push   %rbp
  800782:	48 89 e5             	mov    %rsp,%rbp
  800785:	48 83 ec 20          	sub    $0x20,%rsp
  800789:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80078d:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  800790:	83 7d e4 01          	cmpl   $0x1,-0x1c(%rbp)
  800794:	7e 4f                	jle    8007e5 <getint+0x64>
  800796:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80079a:	8b 00                	mov    (%rax),%eax
  80079c:	83 f8 30             	cmp    $0x30,%eax
  80079f:	73 24                	jae    8007c5 <getint+0x44>
  8007a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007a5:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ad:	8b 00                	mov    (%rax),%eax
  8007af:	89 c0                	mov    %eax,%eax
  8007b1:	48 01 d0             	add    %rdx,%rax
  8007b4:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007b8:	8b 12                	mov    (%rdx),%edx
  8007ba:	8d 4a 08             	lea    0x8(%rdx),%ecx
  8007bd:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007c1:	89 0a                	mov    %ecx,(%rdx)
  8007c3:	eb 14                	jmp    8007d9 <getint+0x58>
  8007c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007c9:	48 8b 40 08          	mov    0x8(%rax),%rax
  8007cd:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8007d1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8007d5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  8007d9:	48 8b 00             	mov    (%rax),%rax
  8007dc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8007e0:	e9 9d 00 00 00       	jmpq   800882 <getint+0x101>
  8007e5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
  8007e9:	74 4c                	je     800837 <getint+0xb6>
  8007eb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007ef:	8b 00                	mov    (%rax),%eax
  8007f1:	83 f8 30             	cmp    $0x30,%eax
  8007f4:	73 24                	jae    80081a <getint+0x99>
  8007f6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8007fa:	48 8b 50 10          	mov    0x10(%rax),%rdx
  8007fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800802:	8b 00                	mov    (%rax),%eax
  800804:	89 c0                	mov    %eax,%eax
  800806:	48 01 d0             	add    %rdx,%rax
  800809:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80080d:	8b 12                	mov    (%rdx),%edx
  80080f:	8d 4a 08             	lea    0x8(%rdx),%ecx
  800812:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800816:	89 0a                	mov    %ecx,(%rdx)
  800818:	eb 14                	jmp    80082e <getint+0xad>
  80081a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80081e:	48 8b 40 08          	mov    0x8(%rax),%rax
  800822:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800826:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80082a:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80082e:	48 8b 00             	mov    (%rax),%rax
  800831:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800835:	eb 4b                	jmp    800882 <getint+0x101>
  800837:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80083b:	8b 00                	mov    (%rax),%eax
  80083d:	83 f8 30             	cmp    $0x30,%eax
  800840:	73 24                	jae    800866 <getint+0xe5>
  800842:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800846:	48 8b 50 10          	mov    0x10(%rax),%rdx
  80084a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80084e:	8b 00                	mov    (%rax),%eax
  800850:	89 c0                	mov    %eax,%eax
  800852:	48 01 d0             	add    %rdx,%rax
  800855:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800859:	8b 12                	mov    (%rdx),%edx
  80085b:	8d 4a 08             	lea    0x8(%rdx),%ecx
  80085e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800862:	89 0a                	mov    %ecx,(%rdx)
  800864:	eb 14                	jmp    80087a <getint+0xf9>
  800866:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80086a:	48 8b 40 08          	mov    0x8(%rax),%rax
  80086e:	48 8d 48 08          	lea    0x8(%rax),%rcx
  800872:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800876:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
  80087a:	8b 00                	mov    (%rax),%eax
  80087c:	48 98                	cltq   
  80087e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  800882:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  800886:	c9                   	leaveq 
  800887:	c3                   	retq   

0000000000800888 <vprintfmt>:
  800888:	55                   	push   %rbp
  800889:	48 89 e5             	mov    %rsp,%rbp
  80088c:	41 54                	push   %r12
  80088e:	53                   	push   %rbx
  80088f:	48 83 ec 60          	sub    $0x60,%rsp
  800893:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  800897:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
  80089b:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80089f:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
  8008a3:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  8008a7:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  8008ab:	48 8b 0a             	mov    (%rdx),%rcx
  8008ae:	48 89 08             	mov    %rcx,(%rax)
  8008b1:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  8008b5:	48 89 48 08          	mov    %rcx,0x8(%rax)
  8008b9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  8008bd:	48 89 50 10          	mov    %rdx,0x10(%rax)
  8008c1:	eb 17                	jmp    8008da <vprintfmt+0x52>
  8008c3:	85 db                	test   %ebx,%ebx
  8008c5:	0f 84 b9 04 00 00    	je     800d84 <vprintfmt+0x4fc>
  8008cb:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  8008cf:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  8008d3:	48 89 d6             	mov    %rdx,%rsi
  8008d6:	89 df                	mov    %ebx,%edi
  8008d8:	ff d0                	callq  *%rax
  8008da:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  8008de:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8008e2:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  8008e6:	0f b6 00             	movzbl (%rax),%eax
  8008e9:	0f b6 d8             	movzbl %al,%ebx
  8008ec:	83 fb 25             	cmp    $0x25,%ebx
  8008ef:	75 d2                	jne    8008c3 <vprintfmt+0x3b>
  8008f1:	c6 45 d3 20          	movb   $0x20,-0x2d(%rbp)
  8008f5:	c7 45 dc ff ff ff ff 	movl   $0xffffffff,-0x24(%rbp)
  8008fc:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  800903:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  80090a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%rbp)
  800911:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800915:	48 8d 50 01          	lea    0x1(%rax),%rdx
  800919:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  80091d:	0f b6 00             	movzbl (%rax),%eax
  800920:	0f b6 d8             	movzbl %al,%ebx
  800923:	8d 43 dd             	lea    -0x23(%rbx),%eax
  800926:	83 f8 55             	cmp    $0x55,%eax
  800929:	0f 87 22 04 00 00    	ja     800d51 <vprintfmt+0x4c9>
  80092f:	89 c0                	mov    %eax,%eax
  800931:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  800938:	00 
  800939:	48 b8 18 4a 80 00 00 	movabs $0x804a18,%rax
  800940:	00 00 00 
  800943:	48 01 d0             	add    %rdx,%rax
  800946:	48 8b 00             	mov    (%rax),%rax
  800949:	ff e0                	jmpq   *%rax
  80094b:	c6 45 d3 2d          	movb   $0x2d,-0x2d(%rbp)
  80094f:	eb c0                	jmp    800911 <vprintfmt+0x89>
  800951:	c6 45 d3 30          	movb   $0x30,-0x2d(%rbp)
  800955:	eb ba                	jmp    800911 <vprintfmt+0x89>
  800957:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
  80095e:	8b 55 d8             	mov    -0x28(%rbp),%edx
  800961:	89 d0                	mov    %edx,%eax
  800963:	c1 e0 02             	shl    $0x2,%eax
  800966:	01 d0                	add    %edx,%eax
  800968:	01 c0                	add    %eax,%eax
  80096a:	01 d8                	add    %ebx,%eax
  80096c:	83 e8 30             	sub    $0x30,%eax
  80096f:	89 45 d8             	mov    %eax,-0x28(%rbp)
  800972:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800976:	0f b6 00             	movzbl (%rax),%eax
  800979:	0f be d8             	movsbl %al,%ebx
  80097c:	83 fb 2f             	cmp    $0x2f,%ebx
  80097f:	7e 60                	jle    8009e1 <vprintfmt+0x159>
  800981:	83 fb 39             	cmp    $0x39,%ebx
  800984:	7f 5b                	jg     8009e1 <vprintfmt+0x159>
  800986:	48 83 45 98 01       	addq   $0x1,-0x68(%rbp)
  80098b:	eb d1                	jmp    80095e <vprintfmt+0xd6>
  80098d:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800990:	83 f8 30             	cmp    $0x30,%eax
  800993:	73 17                	jae    8009ac <vprintfmt+0x124>
  800995:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800999:	8b 55 b8             	mov    -0x48(%rbp),%edx
  80099c:	89 d2                	mov    %edx,%edx
  80099e:	48 01 d0             	add    %rdx,%rax
  8009a1:	8b 55 b8             	mov    -0x48(%rbp),%edx
  8009a4:	83 c2 08             	add    $0x8,%edx
  8009a7:	89 55 b8             	mov    %edx,-0x48(%rbp)
  8009aa:	eb 0c                	jmp    8009b8 <vprintfmt+0x130>
  8009ac:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  8009b0:	48 8d 50 08          	lea    0x8(%rax),%rdx
  8009b4:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  8009b8:	8b 00                	mov    (%rax),%eax
  8009ba:	89 45 d8             	mov    %eax,-0x28(%rbp)
  8009bd:	eb 23                	jmp    8009e2 <vprintfmt+0x15a>
  8009bf:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009c3:	0f 89 48 ff ff ff    	jns    800911 <vprintfmt+0x89>
  8009c9:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  8009d0:	e9 3c ff ff ff       	jmpq   800911 <vprintfmt+0x89>
  8009d5:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%rbp)
  8009dc:	e9 30 ff ff ff       	jmpq   800911 <vprintfmt+0x89>
  8009e1:	90                   	nop
  8009e2:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  8009e6:	0f 89 25 ff ff ff    	jns    800911 <vprintfmt+0x89>
  8009ec:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8009ef:	89 45 dc             	mov    %eax,-0x24(%rbp)
  8009f2:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
  8009f9:	e9 13 ff ff ff       	jmpq   800911 <vprintfmt+0x89>
  8009fe:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
  800a02:	e9 0a ff ff ff       	jmpq   800911 <vprintfmt+0x89>
  800a07:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a0a:	83 f8 30             	cmp    $0x30,%eax
  800a0d:	73 17                	jae    800a26 <vprintfmt+0x19e>
  800a0f:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a13:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a16:	89 d2                	mov    %edx,%edx
  800a18:	48 01 d0             	add    %rdx,%rax
  800a1b:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a1e:	83 c2 08             	add    $0x8,%edx
  800a21:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a24:	eb 0c                	jmp    800a32 <vprintfmt+0x1aa>
  800a26:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a2a:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a2e:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a32:	8b 10                	mov    (%rax),%edx
  800a34:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800a38:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a3c:	48 89 ce             	mov    %rcx,%rsi
  800a3f:	89 d7                	mov    %edx,%edi
  800a41:	ff d0                	callq  *%rax
  800a43:	e9 37 03 00 00       	jmpq   800d7f <vprintfmt+0x4f7>
  800a48:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800a4b:	83 f8 30             	cmp    $0x30,%eax
  800a4e:	73 17                	jae    800a67 <vprintfmt+0x1df>
  800a50:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800a54:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a57:	89 d2                	mov    %edx,%edx
  800a59:	48 01 d0             	add    %rdx,%rax
  800a5c:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800a5f:	83 c2 08             	add    $0x8,%edx
  800a62:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800a65:	eb 0c                	jmp    800a73 <vprintfmt+0x1eb>
  800a67:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800a6b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800a6f:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800a73:	8b 18                	mov    (%rax),%ebx
  800a75:	85 db                	test   %ebx,%ebx
  800a77:	79 02                	jns    800a7b <vprintfmt+0x1f3>
  800a79:	f7 db                	neg    %ebx
  800a7b:	83 fb 15             	cmp    $0x15,%ebx
  800a7e:	7f 16                	jg     800a96 <vprintfmt+0x20e>
  800a80:	48 b8 40 49 80 00 00 	movabs $0x804940,%rax
  800a87:	00 00 00 
  800a8a:	48 63 d3             	movslq %ebx,%rdx
  800a8d:	4c 8b 24 d0          	mov    (%rax,%rdx,8),%r12
  800a91:	4d 85 e4             	test   %r12,%r12
  800a94:	75 2e                	jne    800ac4 <vprintfmt+0x23c>
  800a96:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800a9a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800a9e:	89 d9                	mov    %ebx,%ecx
  800aa0:	48 ba 01 4a 80 00 00 	movabs $0x804a01,%rdx
  800aa7:	00 00 00 
  800aaa:	48 89 c7             	mov    %rax,%rdi
  800aad:	b8 00 00 00 00       	mov    $0x0,%eax
  800ab2:	49 b8 8e 0d 80 00 00 	movabs $0x800d8e,%r8
  800ab9:	00 00 00 
  800abc:	41 ff d0             	callq  *%r8
  800abf:	e9 bb 02 00 00       	jmpq   800d7f <vprintfmt+0x4f7>
  800ac4:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800ac8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800acc:	4c 89 e1             	mov    %r12,%rcx
  800acf:	48 ba 0a 4a 80 00 00 	movabs $0x804a0a,%rdx
  800ad6:	00 00 00 
  800ad9:	48 89 c7             	mov    %rax,%rdi
  800adc:	b8 00 00 00 00       	mov    $0x0,%eax
  800ae1:	49 b8 8e 0d 80 00 00 	movabs $0x800d8e,%r8
  800ae8:	00 00 00 
  800aeb:	41 ff d0             	callq  *%r8
  800aee:	e9 8c 02 00 00       	jmpq   800d7f <vprintfmt+0x4f7>
  800af3:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800af6:	83 f8 30             	cmp    $0x30,%eax
  800af9:	73 17                	jae    800b12 <vprintfmt+0x28a>
  800afb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800aff:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b02:	89 d2                	mov    %edx,%edx
  800b04:	48 01 d0             	add    %rdx,%rax
  800b07:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800b0a:	83 c2 08             	add    $0x8,%edx
  800b0d:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800b10:	eb 0c                	jmp    800b1e <vprintfmt+0x296>
  800b12:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800b16:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800b1a:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800b1e:	4c 8b 20             	mov    (%rax),%r12
  800b21:	4d 85 e4             	test   %r12,%r12
  800b24:	75 0a                	jne    800b30 <vprintfmt+0x2a8>
  800b26:	49 bc 0d 4a 80 00 00 	movabs $0x804a0d,%r12
  800b2d:	00 00 00 
  800b30:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b34:	7e 78                	jle    800bae <vprintfmt+0x326>
  800b36:	80 7d d3 2d          	cmpb   $0x2d,-0x2d(%rbp)
  800b3a:	74 72                	je     800bae <vprintfmt+0x326>
  800b3c:	8b 45 d8             	mov    -0x28(%rbp),%eax
  800b3f:	48 98                	cltq   
  800b41:	48 89 c6             	mov    %rax,%rsi
  800b44:	4c 89 e7             	mov    %r12,%rdi
  800b47:	48 b8 3c 10 80 00 00 	movabs $0x80103c,%rax
  800b4e:	00 00 00 
  800b51:	ff d0                	callq  *%rax
  800b53:	29 45 dc             	sub    %eax,-0x24(%rbp)
  800b56:	eb 17                	jmp    800b6f <vprintfmt+0x2e7>
  800b58:	0f be 55 d3          	movsbl -0x2d(%rbp),%edx
  800b5c:	48 8b 4d a0          	mov    -0x60(%rbp),%rcx
  800b60:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b64:	48 89 ce             	mov    %rcx,%rsi
  800b67:	89 d7                	mov    %edx,%edi
  800b69:	ff d0                	callq  *%rax
  800b6b:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800b6f:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800b73:	7f e3                	jg     800b58 <vprintfmt+0x2d0>
  800b75:	eb 37                	jmp    800bae <vprintfmt+0x326>
  800b77:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  800b7b:	74 1e                	je     800b9b <vprintfmt+0x313>
  800b7d:	83 fb 1f             	cmp    $0x1f,%ebx
  800b80:	7e 05                	jle    800b87 <vprintfmt+0x2ff>
  800b82:	83 fb 7e             	cmp    $0x7e,%ebx
  800b85:	7e 14                	jle    800b9b <vprintfmt+0x313>
  800b87:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b8b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800b8f:	48 89 d6             	mov    %rdx,%rsi
  800b92:	bf 3f 00 00 00       	mov    $0x3f,%edi
  800b97:	ff d0                	callq  *%rax
  800b99:	eb 0f                	jmp    800baa <vprintfmt+0x322>
  800b9b:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800b9f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800ba3:	48 89 d6             	mov    %rdx,%rsi
  800ba6:	89 df                	mov    %ebx,%edi
  800ba8:	ff d0                	callq  *%rax
  800baa:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800bae:	4c 89 e0             	mov    %r12,%rax
  800bb1:	4c 8d 60 01          	lea    0x1(%rax),%r12
  800bb5:	0f b6 00             	movzbl (%rax),%eax
  800bb8:	0f be d8             	movsbl %al,%ebx
  800bbb:	85 db                	test   %ebx,%ebx
  800bbd:	74 28                	je     800be7 <vprintfmt+0x35f>
  800bbf:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800bc3:	78 b2                	js     800b77 <vprintfmt+0x2ef>
  800bc5:	83 6d d8 01          	subl   $0x1,-0x28(%rbp)
  800bc9:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  800bcd:	79 a8                	jns    800b77 <vprintfmt+0x2ef>
  800bcf:	eb 16                	jmp    800be7 <vprintfmt+0x35f>
  800bd1:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800bd5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800bd9:	48 89 d6             	mov    %rdx,%rsi
  800bdc:	bf 20 00 00 00       	mov    $0x20,%edi
  800be1:	ff d0                	callq  *%rax
  800be3:	83 6d dc 01          	subl   $0x1,-0x24(%rbp)
  800be7:	83 7d dc 00          	cmpl   $0x0,-0x24(%rbp)
  800beb:	7f e4                	jg     800bd1 <vprintfmt+0x349>
  800bed:	e9 8d 01 00 00       	jmpq   800d7f <vprintfmt+0x4f7>
  800bf2:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800bf6:	be 03 00 00 00       	mov    $0x3,%esi
  800bfb:	48 89 c7             	mov    %rax,%rdi
  800bfe:	48 b8 81 07 80 00 00 	movabs $0x800781,%rax
  800c05:	00 00 00 
  800c08:	ff d0                	callq  *%rax
  800c0a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c0e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c12:	48 85 c0             	test   %rax,%rax
  800c15:	79 1d                	jns    800c34 <vprintfmt+0x3ac>
  800c17:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c1b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c1f:	48 89 d6             	mov    %rdx,%rsi
  800c22:	bf 2d 00 00 00       	mov    $0x2d,%edi
  800c27:	ff d0                	callq  *%rax
  800c29:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  800c2d:	48 f7 d8             	neg    %rax
  800c30:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c34:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c3b:	e9 d2 00 00 00       	jmpq   800d12 <vprintfmt+0x48a>
  800c40:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c44:	be 03 00 00 00       	mov    $0x3,%esi
  800c49:	48 89 c7             	mov    %rax,%rdi
  800c4c:	48 b8 7a 06 80 00 00 	movabs $0x80067a,%rax
  800c53:	00 00 00 
  800c56:	ff d0                	callq  *%rax
  800c58:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c5c:	c7 45 e4 0a 00 00 00 	movl   $0xa,-0x1c(%rbp)
  800c63:	e9 aa 00 00 00       	jmpq   800d12 <vprintfmt+0x48a>
  800c68:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800c6c:	be 03 00 00 00       	mov    $0x3,%esi
  800c71:	48 89 c7             	mov    %rax,%rdi
  800c74:	48 b8 7a 06 80 00 00 	movabs $0x80067a,%rax
  800c7b:	00 00 00 
  800c7e:	ff d0                	callq  *%rax
  800c80:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800c84:	c7 45 e4 08 00 00 00 	movl   $0x8,-0x1c(%rbp)
  800c8b:	e9 82 00 00 00       	jmpq   800d12 <vprintfmt+0x48a>
  800c90:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800c94:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800c98:	48 89 d6             	mov    %rdx,%rsi
  800c9b:	bf 30 00 00 00       	mov    $0x30,%edi
  800ca0:	ff d0                	callq  *%rax
  800ca2:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800ca6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800caa:	48 89 d6             	mov    %rdx,%rsi
  800cad:	bf 78 00 00 00       	mov    $0x78,%edi
  800cb2:	ff d0                	callq  *%rax
  800cb4:	8b 45 b8             	mov    -0x48(%rbp),%eax
  800cb7:	83 f8 30             	cmp    $0x30,%eax
  800cba:	73 17                	jae    800cd3 <vprintfmt+0x44b>
  800cbc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800cc0:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800cc3:	89 d2                	mov    %edx,%edx
  800cc5:	48 01 d0             	add    %rdx,%rax
  800cc8:	8b 55 b8             	mov    -0x48(%rbp),%edx
  800ccb:	83 c2 08             	add    $0x8,%edx
  800cce:	89 55 b8             	mov    %edx,-0x48(%rbp)
  800cd1:	eb 0c                	jmp    800cdf <vprintfmt+0x457>
  800cd3:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  800cd7:	48 8d 50 08          	lea    0x8(%rax),%rdx
  800cdb:	48 89 55 c0          	mov    %rdx,-0x40(%rbp)
  800cdf:	48 8b 00             	mov    (%rax),%rax
  800ce2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800ce6:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800ced:	eb 23                	jmp    800d12 <vprintfmt+0x48a>
  800cef:	48 8d 45 b8          	lea    -0x48(%rbp),%rax
  800cf3:	be 03 00 00 00       	mov    $0x3,%esi
  800cf8:	48 89 c7             	mov    %rax,%rdi
  800cfb:	48 b8 7a 06 80 00 00 	movabs $0x80067a,%rax
  800d02:	00 00 00 
  800d05:	ff d0                	callq  *%rax
  800d07:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  800d0b:	c7 45 e4 10 00 00 00 	movl   $0x10,-0x1c(%rbp)
  800d12:	44 0f be 45 d3       	movsbl -0x2d(%rbp),%r8d
  800d17:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  800d1a:	8b 7d dc             	mov    -0x24(%rbp),%edi
  800d1d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  800d21:	48 8b 75 a0          	mov    -0x60(%rbp),%rsi
  800d25:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d29:	45 89 c1             	mov    %r8d,%r9d
  800d2c:	41 89 f8             	mov    %edi,%r8d
  800d2f:	48 89 c7             	mov    %rax,%rdi
  800d32:	48 b8 c2 05 80 00 00 	movabs $0x8005c2,%rax
  800d39:	00 00 00 
  800d3c:	ff d0                	callq  *%rax
  800d3e:	eb 3f                	jmp    800d7f <vprintfmt+0x4f7>
  800d40:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d44:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d48:	48 89 d6             	mov    %rdx,%rsi
  800d4b:	89 df                	mov    %ebx,%edi
  800d4d:	ff d0                	callq  *%rax
  800d4f:	eb 2e                	jmp    800d7f <vprintfmt+0x4f7>
  800d51:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  800d55:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  800d59:	48 89 d6             	mov    %rdx,%rsi
  800d5c:	bf 25 00 00 00       	mov    $0x25,%edi
  800d61:	ff d0                	callq  *%rax
  800d63:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d68:	eb 05                	jmp    800d6f <vprintfmt+0x4e7>
  800d6a:	48 83 6d 98 01       	subq   $0x1,-0x68(%rbp)
  800d6f:	48 8b 45 98          	mov    -0x68(%rbp),%rax
  800d73:	48 83 e8 01          	sub    $0x1,%rax
  800d77:	0f b6 00             	movzbl (%rax),%eax
  800d7a:	3c 25                	cmp    $0x25,%al
  800d7c:	75 ec                	jne    800d6a <vprintfmt+0x4e2>
  800d7e:	90                   	nop
  800d7f:	e9 3d fb ff ff       	jmpq   8008c1 <vprintfmt+0x39>
  800d84:	90                   	nop
  800d85:	48 83 c4 60          	add    $0x60,%rsp
  800d89:	5b                   	pop    %rbx
  800d8a:	41 5c                	pop    %r12
  800d8c:	5d                   	pop    %rbp
  800d8d:	c3                   	retq   

0000000000800d8e <printfmt>:
  800d8e:	55                   	push   %rbp
  800d8f:	48 89 e5             	mov    %rsp,%rbp
  800d92:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  800d99:	48 89 bd 28 ff ff ff 	mov    %rdi,-0xd8(%rbp)
  800da0:	48 89 b5 20 ff ff ff 	mov    %rsi,-0xe0(%rbp)
  800da7:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
  800dae:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800db5:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800dbc:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800dc3:	84 c0                	test   %al,%al
  800dc5:	74 20                	je     800de7 <printfmt+0x59>
  800dc7:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800dcb:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800dcf:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800dd3:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800dd7:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800ddb:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800ddf:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800de3:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800de7:	c7 85 38 ff ff ff 18 	movl   $0x18,-0xc8(%rbp)
  800dee:	00 00 00 
  800df1:	c7 85 3c ff ff ff 30 	movl   $0x30,-0xc4(%rbp)
  800df8:	00 00 00 
  800dfb:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800dff:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800e06:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800e0d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  800e14:	48 8d 8d 38 ff ff ff 	lea    -0xc8(%rbp),%rcx
  800e1b:	48 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%rdx
  800e22:	48 8b b5 20 ff ff ff 	mov    -0xe0(%rbp),%rsi
  800e29:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
  800e30:	48 89 c7             	mov    %rax,%rdi
  800e33:	48 b8 88 08 80 00 00 	movabs $0x800888,%rax
  800e3a:	00 00 00 
  800e3d:	ff d0                	callq  *%rax
  800e3f:	90                   	nop
  800e40:	c9                   	leaveq 
  800e41:	c3                   	retq   

0000000000800e42 <sprintputch>:
  800e42:	55                   	push   %rbp
  800e43:	48 89 e5             	mov    %rsp,%rbp
  800e46:	48 83 ec 10          	sub    $0x10,%rsp
  800e4a:	89 7d fc             	mov    %edi,-0x4(%rbp)
  800e4d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  800e51:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e55:	8b 40 10             	mov    0x10(%rax),%eax
  800e58:	8d 50 01             	lea    0x1(%rax),%edx
  800e5b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e5f:	89 50 10             	mov    %edx,0x10(%rax)
  800e62:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e66:	48 8b 10             	mov    (%rax),%rdx
  800e69:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e6d:	48 8b 40 08          	mov    0x8(%rax),%rax
  800e71:	48 39 c2             	cmp    %rax,%rdx
  800e74:	73 17                	jae    800e8d <sprintputch+0x4b>
  800e76:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  800e7a:	48 8b 00             	mov    (%rax),%rax
  800e7d:	48 8d 48 01          	lea    0x1(%rax),%rcx
  800e81:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  800e85:	48 89 0a             	mov    %rcx,(%rdx)
  800e88:	8b 55 fc             	mov    -0x4(%rbp),%edx
  800e8b:	88 10                	mov    %dl,(%rax)
  800e8d:	90                   	nop
  800e8e:	c9                   	leaveq 
  800e8f:	c3                   	retq   

0000000000800e90 <vsnprintf>:
  800e90:	55                   	push   %rbp
  800e91:	48 89 e5             	mov    %rsp,%rbp
  800e94:	48 83 ec 50          	sub    $0x50,%rsp
  800e98:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  800e9c:	89 75 c4             	mov    %esi,-0x3c(%rbp)
  800e9f:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
  800ea3:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  800ea7:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  800eab:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
  800eaf:	48 8b 0a             	mov    (%rdx),%rcx
  800eb2:	48 89 08             	mov    %rcx,(%rax)
  800eb5:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800eb9:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800ebd:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800ec1:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800ec5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800ec9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  800ecd:	8b 45 c4             	mov    -0x3c(%rbp),%eax
  800ed0:	48 98                	cltq   
  800ed2:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  800ed6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  800eda:	48 01 d0             	add    %rdx,%rax
  800edd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  800ee1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  800ee8:	48 83 7d c8 00       	cmpq   $0x0,-0x38(%rbp)
  800eed:	74 06                	je     800ef5 <vsnprintf+0x65>
  800eef:	83 7d c4 00          	cmpl   $0x0,-0x3c(%rbp)
  800ef3:	7f 07                	jg     800efc <vsnprintf+0x6c>
  800ef5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800efa:	eb 2f                	jmp    800f2b <vsnprintf+0x9b>
  800efc:	48 8d 4d e8          	lea    -0x18(%rbp),%rcx
  800f00:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  800f04:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  800f08:	48 89 c6             	mov    %rax,%rsi
  800f0b:	48 bf 42 0e 80 00 00 	movabs $0x800e42,%rdi
  800f12:	00 00 00 
  800f15:	48 b8 88 08 80 00 00 	movabs $0x800888,%rax
  800f1c:	00 00 00 
  800f1f:	ff d0                	callq  *%rax
  800f21:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  800f25:	c6 00 00             	movb   $0x0,(%rax)
  800f28:	8b 45 e0             	mov    -0x20(%rbp),%eax
  800f2b:	c9                   	leaveq 
  800f2c:	c3                   	retq   

0000000000800f2d <snprintf>:
  800f2d:	55                   	push   %rbp
  800f2e:	48 89 e5             	mov    %rsp,%rbp
  800f31:	48 81 ec 10 01 00 00 	sub    $0x110,%rsp
  800f38:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  800f3f:	89 b5 04 ff ff ff    	mov    %esi,-0xfc(%rbp)
  800f45:	48 89 95 f8 fe ff ff 	mov    %rdx,-0x108(%rbp)
  800f4c:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
  800f53:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
  800f5a:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
  800f61:	84 c0                	test   %al,%al
  800f63:	74 20                	je     800f85 <snprintf+0x58>
  800f65:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
  800f69:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
  800f6d:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
  800f71:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
  800f75:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
  800f79:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
  800f7d:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
  800f81:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
  800f85:	c7 85 30 ff ff ff 18 	movl   $0x18,-0xd0(%rbp)
  800f8c:	00 00 00 
  800f8f:	c7 85 34 ff ff ff 30 	movl   $0x30,-0xcc(%rbp)
  800f96:	00 00 00 
  800f99:	48 8d 45 10          	lea    0x10(%rbp),%rax
  800f9d:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  800fa4:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
  800fab:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  800fb2:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
  800fb9:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
  800fc0:	48 8b 0a             	mov    (%rdx),%rcx
  800fc3:	48 89 08             	mov    %rcx,(%rax)
  800fc6:	48 8b 4a 08          	mov    0x8(%rdx),%rcx
  800fca:	48 89 48 08          	mov    %rcx,0x8(%rax)
  800fce:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  800fd2:	48 89 50 10          	mov    %rdx,0x10(%rax)
  800fd6:	48 8d 8d 18 ff ff ff 	lea    -0xe8(%rbp),%rcx
  800fdd:	48 8b 95 f8 fe ff ff 	mov    -0x108(%rbp),%rdx
  800fe4:	8b b5 04 ff ff ff    	mov    -0xfc(%rbp),%esi
  800fea:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  800ff1:	48 89 c7             	mov    %rax,%rdi
  800ff4:	48 b8 90 0e 80 00 00 	movabs $0x800e90,%rax
  800ffb:	00 00 00 
  800ffe:	ff d0                	callq  *%rax
  801000:	89 85 4c ff ff ff    	mov    %eax,-0xb4(%rbp)
  801006:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
  80100c:	c9                   	leaveq 
  80100d:	c3                   	retq   

000000000080100e <strlen>:
  80100e:	55                   	push   %rbp
  80100f:	48 89 e5             	mov    %rsp,%rbp
  801012:	48 83 ec 18          	sub    $0x18,%rsp
  801016:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80101a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801021:	eb 09                	jmp    80102c <strlen+0x1e>
  801023:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801027:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80102c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801030:	0f b6 00             	movzbl (%rax),%eax
  801033:	84 c0                	test   %al,%al
  801035:	75 ec                	jne    801023 <strlen+0x15>
  801037:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80103a:	c9                   	leaveq 
  80103b:	c3                   	retq   

000000000080103c <strnlen>:
  80103c:	55                   	push   %rbp
  80103d:	48 89 e5             	mov    %rsp,%rbp
  801040:	48 83 ec 20          	sub    $0x20,%rsp
  801044:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801048:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80104c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801053:	eb 0e                	jmp    801063 <strnlen+0x27>
  801055:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801059:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  80105e:	48 83 6d e0 01       	subq   $0x1,-0x20(%rbp)
  801063:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  801068:	74 0b                	je     801075 <strnlen+0x39>
  80106a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80106e:	0f b6 00             	movzbl (%rax),%eax
  801071:	84 c0                	test   %al,%al
  801073:	75 e0                	jne    801055 <strnlen+0x19>
  801075:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801078:	c9                   	leaveq 
  801079:	c3                   	retq   

000000000080107a <strcpy>:
  80107a:	55                   	push   %rbp
  80107b:	48 89 e5             	mov    %rsp,%rbp
  80107e:	48 83 ec 20          	sub    $0x20,%rsp
  801082:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801086:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80108a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80108e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801092:	90                   	nop
  801093:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801097:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80109b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80109f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8010a3:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8010a7:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8010ab:	0f b6 12             	movzbl (%rdx),%edx
  8010ae:	88 10                	mov    %dl,(%rax)
  8010b0:	0f b6 00             	movzbl (%rax),%eax
  8010b3:	84 c0                	test   %al,%al
  8010b5:	75 dc                	jne    801093 <strcpy+0x19>
  8010b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8010bb:	c9                   	leaveq 
  8010bc:	c3                   	retq   

00000000008010bd <strcat>:
  8010bd:	55                   	push   %rbp
  8010be:	48 89 e5             	mov    %rsp,%rbp
  8010c1:	48 83 ec 20          	sub    $0x20,%rsp
  8010c5:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8010c9:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8010cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010d1:	48 89 c7             	mov    %rax,%rdi
  8010d4:	48 b8 0e 10 80 00 00 	movabs $0x80100e,%rax
  8010db:	00 00 00 
  8010de:	ff d0                	callq  *%rax
  8010e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8010e3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8010e6:	48 63 d0             	movslq %eax,%rdx
  8010e9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8010ed:	48 01 c2             	add    %rax,%rdx
  8010f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8010f4:	48 89 c6             	mov    %rax,%rsi
  8010f7:	48 89 d7             	mov    %rdx,%rdi
  8010fa:	48 b8 7a 10 80 00 00 	movabs $0x80107a,%rax
  801101:	00 00 00 
  801104:	ff d0                	callq  *%rax
  801106:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80110a:	c9                   	leaveq 
  80110b:	c3                   	retq   

000000000080110c <strncpy>:
  80110c:	55                   	push   %rbp
  80110d:	48 89 e5             	mov    %rsp,%rbp
  801110:	48 83 ec 28          	sub    $0x28,%rsp
  801114:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801118:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80111c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801120:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801124:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801128:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  80112f:	00 
  801130:	eb 2a                	jmp    80115c <strncpy+0x50>
  801132:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801136:	48 8d 50 01          	lea    0x1(%rax),%rdx
  80113a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80113e:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  801142:	0f b6 12             	movzbl (%rdx),%edx
  801145:	88 10                	mov    %dl,(%rax)
  801147:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80114b:	0f b6 00             	movzbl (%rax),%eax
  80114e:	84 c0                	test   %al,%al
  801150:	74 05                	je     801157 <strncpy+0x4b>
  801152:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
  801157:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80115c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801160:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  801164:	72 cc                	jb     801132 <strncpy+0x26>
  801166:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80116a:	c9                   	leaveq 
  80116b:	c3                   	retq   

000000000080116c <strlcpy>:
  80116c:	55                   	push   %rbp
  80116d:	48 89 e5             	mov    %rsp,%rbp
  801170:	48 83 ec 28          	sub    $0x28,%rsp
  801174:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801178:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80117c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801180:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801184:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801188:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  80118d:	74 3d                	je     8011cc <strlcpy+0x60>
  80118f:	eb 1d                	jmp    8011ae <strlcpy+0x42>
  801191:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801195:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801199:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  80119d:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8011a1:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  8011a5:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  8011a9:	0f b6 12             	movzbl (%rdx),%edx
  8011ac:	88 10                	mov    %dl,(%rax)
  8011ae:	48 83 6d d8 01       	subq   $0x1,-0x28(%rbp)
  8011b3:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  8011b8:	74 0b                	je     8011c5 <strlcpy+0x59>
  8011ba:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8011be:	0f b6 00             	movzbl (%rax),%eax
  8011c1:	84 c0                	test   %al,%al
  8011c3:	75 cc                	jne    801191 <strlcpy+0x25>
  8011c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8011c9:	c6 00 00             	movb   $0x0,(%rax)
  8011cc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8011d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011d4:	48 29 c2             	sub    %rax,%rdx
  8011d7:	48 89 d0             	mov    %rdx,%rax
  8011da:	c9                   	leaveq 
  8011db:	c3                   	retq   

00000000008011dc <strcmp>:
  8011dc:	55                   	push   %rbp
  8011dd:	48 89 e5             	mov    %rsp,%rbp
  8011e0:	48 83 ec 10          	sub    $0x10,%rsp
  8011e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8011e8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8011ec:	eb 0a                	jmp    8011f8 <strcmp+0x1c>
  8011ee:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8011f3:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  8011f8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8011fc:	0f b6 00             	movzbl (%rax),%eax
  8011ff:	84 c0                	test   %al,%al
  801201:	74 12                	je     801215 <strcmp+0x39>
  801203:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801207:	0f b6 10             	movzbl (%rax),%edx
  80120a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80120e:	0f b6 00             	movzbl (%rax),%eax
  801211:	38 c2                	cmp    %al,%dl
  801213:	74 d9                	je     8011ee <strcmp+0x12>
  801215:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801219:	0f b6 00             	movzbl (%rax),%eax
  80121c:	0f b6 d0             	movzbl %al,%edx
  80121f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801223:	0f b6 00             	movzbl (%rax),%eax
  801226:	0f b6 c0             	movzbl %al,%eax
  801229:	29 c2                	sub    %eax,%edx
  80122b:	89 d0                	mov    %edx,%eax
  80122d:	c9                   	leaveq 
  80122e:	c3                   	retq   

000000000080122f <strncmp>:
  80122f:	55                   	push   %rbp
  801230:	48 89 e5             	mov    %rsp,%rbp
  801233:	48 83 ec 18          	sub    $0x18,%rsp
  801237:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80123b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80123f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801243:	eb 0f                	jmp    801254 <strncmp+0x25>
  801245:	48 83 6d e8 01       	subq   $0x1,-0x18(%rbp)
  80124a:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  80124f:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801254:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  801259:	74 1d                	je     801278 <strncmp+0x49>
  80125b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80125f:	0f b6 00             	movzbl (%rax),%eax
  801262:	84 c0                	test   %al,%al
  801264:	74 12                	je     801278 <strncmp+0x49>
  801266:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80126a:	0f b6 10             	movzbl (%rax),%edx
  80126d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801271:	0f b6 00             	movzbl (%rax),%eax
  801274:	38 c2                	cmp    %al,%dl
  801276:	74 cd                	je     801245 <strncmp+0x16>
  801278:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80127d:	75 07                	jne    801286 <strncmp+0x57>
  80127f:	b8 00 00 00 00       	mov    $0x0,%eax
  801284:	eb 18                	jmp    80129e <strncmp+0x6f>
  801286:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80128a:	0f b6 00             	movzbl (%rax),%eax
  80128d:	0f b6 d0             	movzbl %al,%edx
  801290:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801294:	0f b6 00             	movzbl (%rax),%eax
  801297:	0f b6 c0             	movzbl %al,%eax
  80129a:	29 c2                	sub    %eax,%edx
  80129c:	89 d0                	mov    %edx,%eax
  80129e:	c9                   	leaveq 
  80129f:	c3                   	retq   

00000000008012a0 <strchr>:
  8012a0:	55                   	push   %rbp
  8012a1:	48 89 e5             	mov    %rsp,%rbp
  8012a4:	48 83 ec 10          	sub    $0x10,%rsp
  8012a8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012ac:	89 f0                	mov    %esi,%eax
  8012ae:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012b1:	eb 17                	jmp    8012ca <strchr+0x2a>
  8012b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012b7:	0f b6 00             	movzbl (%rax),%eax
  8012ba:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012bd:	75 06                	jne    8012c5 <strchr+0x25>
  8012bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012c3:	eb 15                	jmp    8012da <strchr+0x3a>
  8012c5:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8012ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012ce:	0f b6 00             	movzbl (%rax),%eax
  8012d1:	84 c0                	test   %al,%al
  8012d3:	75 de                	jne    8012b3 <strchr+0x13>
  8012d5:	b8 00 00 00 00       	mov    $0x0,%eax
  8012da:	c9                   	leaveq 
  8012db:	c3                   	retq   

00000000008012dc <strfind>:
  8012dc:	55                   	push   %rbp
  8012dd:	48 89 e5             	mov    %rsp,%rbp
  8012e0:	48 83 ec 10          	sub    $0x10,%rsp
  8012e4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8012e8:	89 f0                	mov    %esi,%eax
  8012ea:	88 45 f4             	mov    %al,-0xc(%rbp)
  8012ed:	eb 11                	jmp    801300 <strfind+0x24>
  8012ef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8012f3:	0f b6 00             	movzbl (%rax),%eax
  8012f6:	3a 45 f4             	cmp    -0xc(%rbp),%al
  8012f9:	74 12                	je     80130d <strfind+0x31>
  8012fb:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801300:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801304:	0f b6 00             	movzbl (%rax),%eax
  801307:	84 c0                	test   %al,%al
  801309:	75 e4                	jne    8012ef <strfind+0x13>
  80130b:	eb 01                	jmp    80130e <strfind+0x32>
  80130d:	90                   	nop
  80130e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801312:	c9                   	leaveq 
  801313:	c3                   	retq   

0000000000801314 <memset>:
  801314:	55                   	push   %rbp
  801315:	48 89 e5             	mov    %rsp,%rbp
  801318:	48 83 ec 18          	sub    $0x18,%rsp
  80131c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801320:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801323:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801327:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80132c:	75 06                	jne    801334 <memset+0x20>
  80132e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801332:	eb 69                	jmp    80139d <memset+0x89>
  801334:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801338:	83 e0 03             	and    $0x3,%eax
  80133b:	48 85 c0             	test   %rax,%rax
  80133e:	75 48                	jne    801388 <memset+0x74>
  801340:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801344:	83 e0 03             	and    $0x3,%eax
  801347:	48 85 c0             	test   %rax,%rax
  80134a:	75 3c                	jne    801388 <memset+0x74>
  80134c:	81 65 f4 ff 00 00 00 	andl   $0xff,-0xc(%rbp)
  801353:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801356:	c1 e0 18             	shl    $0x18,%eax
  801359:	89 c2                	mov    %eax,%edx
  80135b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80135e:	c1 e0 10             	shl    $0x10,%eax
  801361:	09 c2                	or     %eax,%edx
  801363:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801366:	c1 e0 08             	shl    $0x8,%eax
  801369:	09 d0                	or     %edx,%eax
  80136b:	09 45 f4             	or     %eax,-0xc(%rbp)
  80136e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801372:	48 c1 e8 02          	shr    $0x2,%rax
  801376:	48 89 c1             	mov    %rax,%rcx
  801379:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80137d:	8b 45 f4             	mov    -0xc(%rbp),%eax
  801380:	48 89 d7             	mov    %rdx,%rdi
  801383:	fc                   	cld    
  801384:	f3 ab                	rep stos %eax,%es:(%rdi)
  801386:	eb 11                	jmp    801399 <memset+0x85>
  801388:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  80138c:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80138f:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801393:	48 89 d7             	mov    %rdx,%rdi
  801396:	fc                   	cld    
  801397:	f3 aa                	rep stos %al,%es:(%rdi)
  801399:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80139d:	c9                   	leaveq 
  80139e:	c3                   	retq   

000000000080139f <memmove>:
  80139f:	55                   	push   %rbp
  8013a0:	48 89 e5             	mov    %rsp,%rbp
  8013a3:	48 83 ec 28          	sub    $0x28,%rsp
  8013a7:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8013ab:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8013af:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8013b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8013b7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8013bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8013bf:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8013c3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013c7:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013cb:	0f 83 88 00 00 00    	jae    801459 <memmove+0xba>
  8013d1:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8013d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013d9:	48 01 d0             	add    %rdx,%rax
  8013dc:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
  8013e0:	76 77                	jbe    801459 <memmove+0xba>
  8013e2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013e6:	48 01 45 f8          	add    %rax,-0x8(%rbp)
  8013ea:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8013ee:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  8013f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8013f6:	83 e0 03             	and    $0x3,%eax
  8013f9:	48 85 c0             	test   %rax,%rax
  8013fc:	75 3b                	jne    801439 <memmove+0x9a>
  8013fe:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801402:	83 e0 03             	and    $0x3,%eax
  801405:	48 85 c0             	test   %rax,%rax
  801408:	75 2f                	jne    801439 <memmove+0x9a>
  80140a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80140e:	83 e0 03             	and    $0x3,%eax
  801411:	48 85 c0             	test   %rax,%rax
  801414:	75 23                	jne    801439 <memmove+0x9a>
  801416:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80141a:	48 83 e8 04          	sub    $0x4,%rax
  80141e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801422:	48 83 ea 04          	sub    $0x4,%rdx
  801426:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  80142a:	48 c1 e9 02          	shr    $0x2,%rcx
  80142e:	48 89 c7             	mov    %rax,%rdi
  801431:	48 89 d6             	mov    %rdx,%rsi
  801434:	fd                   	std    
  801435:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801437:	eb 1d                	jmp    801456 <memmove+0xb7>
  801439:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80143d:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  801441:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801445:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  801449:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80144d:	48 89 d7             	mov    %rdx,%rdi
  801450:	48 89 c1             	mov    %rax,%rcx
  801453:	fd                   	std    
  801454:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  801456:	fc                   	cld    
  801457:	eb 57                	jmp    8014b0 <memmove+0x111>
  801459:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80145d:	83 e0 03             	and    $0x3,%eax
  801460:	48 85 c0             	test   %rax,%rax
  801463:	75 36                	jne    80149b <memmove+0xfc>
  801465:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801469:	83 e0 03             	and    $0x3,%eax
  80146c:	48 85 c0             	test   %rax,%rax
  80146f:	75 2a                	jne    80149b <memmove+0xfc>
  801471:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801475:	83 e0 03             	and    $0x3,%eax
  801478:	48 85 c0             	test   %rax,%rax
  80147b:	75 1e                	jne    80149b <memmove+0xfc>
  80147d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801481:	48 c1 e8 02          	shr    $0x2,%rax
  801485:	48 89 c1             	mov    %rax,%rcx
  801488:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80148c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801490:	48 89 c7             	mov    %rax,%rdi
  801493:	48 89 d6             	mov    %rdx,%rsi
  801496:	fc                   	cld    
  801497:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  801499:	eb 15                	jmp    8014b0 <memmove+0x111>
  80149b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80149f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  8014a3:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
  8014a7:	48 89 c7             	mov    %rax,%rdi
  8014aa:	48 89 d6             	mov    %rdx,%rsi
  8014ad:	fc                   	cld    
  8014ae:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  8014b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8014b4:	c9                   	leaveq 
  8014b5:	c3                   	retq   

00000000008014b6 <memcpy>:
  8014b6:	55                   	push   %rbp
  8014b7:	48 89 e5             	mov    %rsp,%rbp
  8014ba:	48 83 ec 18          	sub    $0x18,%rsp
  8014be:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8014c2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8014c6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8014ca:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8014ce:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  8014d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8014d6:	48 89 ce             	mov    %rcx,%rsi
  8014d9:	48 89 c7             	mov    %rax,%rdi
  8014dc:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  8014e3:	00 00 00 
  8014e6:	ff d0                	callq  *%rax
  8014e8:	c9                   	leaveq 
  8014e9:	c3                   	retq   

00000000008014ea <memcmp>:
  8014ea:	55                   	push   %rbp
  8014eb:	48 89 e5             	mov    %rsp,%rbp
  8014ee:	48 83 ec 28          	sub    $0x28,%rsp
  8014f2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8014f6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8014fa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8014fe:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801502:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801506:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80150a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80150e:	eb 36                	jmp    801546 <memcmp+0x5c>
  801510:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801514:	0f b6 10             	movzbl (%rax),%edx
  801517:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80151b:	0f b6 00             	movzbl (%rax),%eax
  80151e:	38 c2                	cmp    %al,%dl
  801520:	74 1a                	je     80153c <memcmp+0x52>
  801522:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801526:	0f b6 00             	movzbl (%rax),%eax
  801529:	0f b6 d0             	movzbl %al,%edx
  80152c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801530:	0f b6 00             	movzbl (%rax),%eax
  801533:	0f b6 c0             	movzbl %al,%eax
  801536:	29 c2                	sub    %eax,%edx
  801538:	89 d0                	mov    %edx,%eax
  80153a:	eb 20                	jmp    80155c <memcmp+0x72>
  80153c:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  801541:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  801546:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80154a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  80154e:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801552:	48 85 c0             	test   %rax,%rax
  801555:	75 b9                	jne    801510 <memcmp+0x26>
  801557:	b8 00 00 00 00       	mov    $0x0,%eax
  80155c:	c9                   	leaveq 
  80155d:	c3                   	retq   

000000000080155e <memfind>:
  80155e:	55                   	push   %rbp
  80155f:	48 89 e5             	mov    %rsp,%rbp
  801562:	48 83 ec 28          	sub    $0x28,%rsp
  801566:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80156a:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  80156d:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  801571:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801575:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801579:	48 01 d0             	add    %rdx,%rax
  80157c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801580:	eb 13                	jmp    801595 <memfind+0x37>
  801582:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801586:	0f b6 00             	movzbl (%rax),%eax
  801589:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80158c:	38 d0                	cmp    %dl,%al
  80158e:	74 11                	je     8015a1 <memfind+0x43>
  801590:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
  801595:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801599:	48 3b 45 f8          	cmp    -0x8(%rbp),%rax
  80159d:	72 e3                	jb     801582 <memfind+0x24>
  80159f:	eb 01                	jmp    8015a2 <memfind+0x44>
  8015a1:	90                   	nop
  8015a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8015a6:	c9                   	leaveq 
  8015a7:	c3                   	retq   

00000000008015a8 <strtol>:
  8015a8:	55                   	push   %rbp
  8015a9:	48 89 e5             	mov    %rsp,%rbp
  8015ac:	48 83 ec 38          	sub    $0x38,%rsp
  8015b0:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8015b4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8015b8:	89 55 cc             	mov    %edx,-0x34(%rbp)
  8015bb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8015c2:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
  8015c9:	00 
  8015ca:	eb 05                	jmp    8015d1 <strtol+0x29>
  8015cc:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015d1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015d5:	0f b6 00             	movzbl (%rax),%eax
  8015d8:	3c 20                	cmp    $0x20,%al
  8015da:	74 f0                	je     8015cc <strtol+0x24>
  8015dc:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015e0:	0f b6 00             	movzbl (%rax),%eax
  8015e3:	3c 09                	cmp    $0x9,%al
  8015e5:	74 e5                	je     8015cc <strtol+0x24>
  8015e7:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015eb:	0f b6 00             	movzbl (%rax),%eax
  8015ee:	3c 2b                	cmp    $0x2b,%al
  8015f0:	75 07                	jne    8015f9 <strtol+0x51>
  8015f2:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8015f7:	eb 17                	jmp    801610 <strtol+0x68>
  8015f9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8015fd:	0f b6 00             	movzbl (%rax),%eax
  801600:	3c 2d                	cmp    $0x2d,%al
  801602:	75 0c                	jne    801610 <strtol+0x68>
  801604:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  801609:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  801610:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801614:	74 06                	je     80161c <strtol+0x74>
  801616:	83 7d cc 10          	cmpl   $0x10,-0x34(%rbp)
  80161a:	75 28                	jne    801644 <strtol+0x9c>
  80161c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801620:	0f b6 00             	movzbl (%rax),%eax
  801623:	3c 30                	cmp    $0x30,%al
  801625:	75 1d                	jne    801644 <strtol+0x9c>
  801627:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80162b:	48 83 c0 01          	add    $0x1,%rax
  80162f:	0f b6 00             	movzbl (%rax),%eax
  801632:	3c 78                	cmp    $0x78,%al
  801634:	75 0e                	jne    801644 <strtol+0x9c>
  801636:	48 83 45 d8 02       	addq   $0x2,-0x28(%rbp)
  80163b:	c7 45 cc 10 00 00 00 	movl   $0x10,-0x34(%rbp)
  801642:	eb 2c                	jmp    801670 <strtol+0xc8>
  801644:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801648:	75 19                	jne    801663 <strtol+0xbb>
  80164a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80164e:	0f b6 00             	movzbl (%rax),%eax
  801651:	3c 30                	cmp    $0x30,%al
  801653:	75 0e                	jne    801663 <strtol+0xbb>
  801655:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  80165a:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%rbp)
  801661:	eb 0d                	jmp    801670 <strtol+0xc8>
  801663:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
  801667:	75 07                	jne    801670 <strtol+0xc8>
  801669:	c7 45 cc 0a 00 00 00 	movl   $0xa,-0x34(%rbp)
  801670:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801674:	0f b6 00             	movzbl (%rax),%eax
  801677:	3c 2f                	cmp    $0x2f,%al
  801679:	7e 1d                	jle    801698 <strtol+0xf0>
  80167b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80167f:	0f b6 00             	movzbl (%rax),%eax
  801682:	3c 39                	cmp    $0x39,%al
  801684:	7f 12                	jg     801698 <strtol+0xf0>
  801686:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80168a:	0f b6 00             	movzbl (%rax),%eax
  80168d:	0f be c0             	movsbl %al,%eax
  801690:	83 e8 30             	sub    $0x30,%eax
  801693:	89 45 ec             	mov    %eax,-0x14(%rbp)
  801696:	eb 4e                	jmp    8016e6 <strtol+0x13e>
  801698:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80169c:	0f b6 00             	movzbl (%rax),%eax
  80169f:	3c 60                	cmp    $0x60,%al
  8016a1:	7e 1d                	jle    8016c0 <strtol+0x118>
  8016a3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016a7:	0f b6 00             	movzbl (%rax),%eax
  8016aa:	3c 7a                	cmp    $0x7a,%al
  8016ac:	7f 12                	jg     8016c0 <strtol+0x118>
  8016ae:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016b2:	0f b6 00             	movzbl (%rax),%eax
  8016b5:	0f be c0             	movsbl %al,%eax
  8016b8:	83 e8 57             	sub    $0x57,%eax
  8016bb:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016be:	eb 26                	jmp    8016e6 <strtol+0x13e>
  8016c0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016c4:	0f b6 00             	movzbl (%rax),%eax
  8016c7:	3c 40                	cmp    $0x40,%al
  8016c9:	7e 47                	jle    801712 <strtol+0x16a>
  8016cb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016cf:	0f b6 00             	movzbl (%rax),%eax
  8016d2:	3c 5a                	cmp    $0x5a,%al
  8016d4:	7f 3c                	jg     801712 <strtol+0x16a>
  8016d6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8016da:	0f b6 00             	movzbl (%rax),%eax
  8016dd:	0f be c0             	movsbl %al,%eax
  8016e0:	83 e8 37             	sub    $0x37,%eax
  8016e3:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8016e6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8016e9:	3b 45 cc             	cmp    -0x34(%rbp),%eax
  8016ec:	7d 23                	jge    801711 <strtol+0x169>
  8016ee:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
  8016f3:	8b 45 cc             	mov    -0x34(%rbp),%eax
  8016f6:	48 98                	cltq   
  8016f8:	48 0f af 45 f0       	imul   -0x10(%rbp),%rax
  8016fd:	48 89 c2             	mov    %rax,%rdx
  801700:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801703:	48 98                	cltq   
  801705:	48 01 d0             	add    %rdx,%rax
  801708:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80170c:	e9 5f ff ff ff       	jmpq   801670 <strtol+0xc8>
  801711:	90                   	nop
  801712:	48 83 7d d0 00       	cmpq   $0x0,-0x30(%rbp)
  801717:	74 0b                	je     801724 <strtol+0x17c>
  801719:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80171d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801721:	48 89 10             	mov    %rdx,(%rax)
  801724:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801728:	74 09                	je     801733 <strtol+0x18b>
  80172a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80172e:	48 f7 d8             	neg    %rax
  801731:	eb 04                	jmp    801737 <strtol+0x18f>
  801733:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801737:	c9                   	leaveq 
  801738:	c3                   	retq   

0000000000801739 <strstr>:
  801739:	55                   	push   %rbp
  80173a:	48 89 e5             	mov    %rsp,%rbp
  80173d:	48 83 ec 30          	sub    $0x30,%rsp
  801741:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801745:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  801749:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80174d:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801751:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  801755:	0f b6 00             	movzbl (%rax),%eax
  801758:	88 45 ff             	mov    %al,-0x1(%rbp)
  80175b:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
  80175f:	75 06                	jne    801767 <strstr+0x2e>
  801761:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801765:	eb 6b                	jmp    8017d2 <strstr+0x99>
  801767:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80176b:	48 89 c7             	mov    %rax,%rdi
  80176e:	48 b8 0e 10 80 00 00 	movabs $0x80100e,%rax
  801775:	00 00 00 
  801778:	ff d0                	callq  *%rax
  80177a:	48 98                	cltq   
  80177c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801780:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801784:	48 8d 50 01          	lea    0x1(%rax),%rdx
  801788:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80178c:	0f b6 00             	movzbl (%rax),%eax
  80178f:	88 45 ef             	mov    %al,-0x11(%rbp)
  801792:	80 7d ef 00          	cmpb   $0x0,-0x11(%rbp)
  801796:	75 07                	jne    80179f <strstr+0x66>
  801798:	b8 00 00 00 00       	mov    $0x0,%eax
  80179d:	eb 33                	jmp    8017d2 <strstr+0x99>
  80179f:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  8017a3:	3a 45 ff             	cmp    -0x1(%rbp),%al
  8017a6:	75 d8                	jne    801780 <strstr+0x47>
  8017a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8017ac:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8017b0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017b4:	48 89 ce             	mov    %rcx,%rsi
  8017b7:	48 89 c7             	mov    %rax,%rdi
  8017ba:	48 b8 2f 12 80 00 00 	movabs $0x80122f,%rax
  8017c1:	00 00 00 
  8017c4:	ff d0                	callq  *%rax
  8017c6:	85 c0                	test   %eax,%eax
  8017c8:	75 b6                	jne    801780 <strstr+0x47>
  8017ca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8017ce:	48 83 e8 01          	sub    $0x1,%rax
  8017d2:	c9                   	leaveq 
  8017d3:	c3                   	retq   

00000000008017d4 <syscall>:
  8017d4:	55                   	push   %rbp
  8017d5:	48 89 e5             	mov    %rsp,%rbp
  8017d8:	53                   	push   %rbx
  8017d9:	48 83 ec 48          	sub    $0x48,%rsp
  8017dd:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8017e0:	89 75 d8             	mov    %esi,-0x28(%rbp)
  8017e3:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
  8017e7:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  8017eb:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
  8017ef:	4c 89 4d b8          	mov    %r9,-0x48(%rbp)
  8017f3:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8017f6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  8017fa:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  8017fe:	4c 8b 45 c0          	mov    -0x40(%rbp),%r8
  801802:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  801806:	48 8b 75 10          	mov    0x10(%rbp),%rsi
  80180a:	4c 89 c3             	mov    %r8,%rbx
  80180d:	cd 30                	int    $0x30
  80180f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  801813:	83 7d d8 00          	cmpl   $0x0,-0x28(%rbp)
  801817:	74 3e                	je     801857 <syscall+0x83>
  801819:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  80181e:	7e 37                	jle    801857 <syscall+0x83>
  801820:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  801824:	8b 45 dc             	mov    -0x24(%rbp),%eax
  801827:	49 89 d0             	mov    %rdx,%r8
  80182a:	89 c1                	mov    %eax,%ecx
  80182c:	48 ba c8 4c 80 00 00 	movabs $0x804cc8,%rdx
  801833:	00 00 00 
  801836:	be 24 00 00 00       	mov    $0x24,%esi
  80183b:	48 bf e5 4c 80 00 00 	movabs $0x804ce5,%rdi
  801842:	00 00 00 
  801845:	b8 00 00 00 00       	mov    $0x0,%eax
  80184a:	49 b9 54 3e 80 00 00 	movabs $0x803e54,%r9
  801851:	00 00 00 
  801854:	41 ff d1             	callq  *%r9
  801857:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80185b:	48 83 c4 48          	add    $0x48,%rsp
  80185f:	5b                   	pop    %rbx
  801860:	5d                   	pop    %rbp
  801861:	c3                   	retq   

0000000000801862 <sys_cputs>:
  801862:	55                   	push   %rbp
  801863:	48 89 e5             	mov    %rsp,%rbp
  801866:	48 83 ec 10          	sub    $0x10,%rsp
  80186a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  80186e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801872:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801876:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80187a:	48 83 ec 08          	sub    $0x8,%rsp
  80187e:	6a 00                	pushq  $0x0
  801880:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801886:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80188c:	48 89 d1             	mov    %rdx,%rcx
  80188f:	48 89 c2             	mov    %rax,%rdx
  801892:	be 00 00 00 00       	mov    $0x0,%esi
  801897:	bf 00 00 00 00       	mov    $0x0,%edi
  80189c:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  8018a3:	00 00 00 
  8018a6:	ff d0                	callq  *%rax
  8018a8:	48 83 c4 10          	add    $0x10,%rsp
  8018ac:	90                   	nop
  8018ad:	c9                   	leaveq 
  8018ae:	c3                   	retq   

00000000008018af <sys_cgetc>:
  8018af:	55                   	push   %rbp
  8018b0:	48 89 e5             	mov    %rsp,%rbp
  8018b3:	48 83 ec 08          	sub    $0x8,%rsp
  8018b7:	6a 00                	pushq  $0x0
  8018b9:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8018bf:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  8018c5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8018ca:	ba 00 00 00 00       	mov    $0x0,%edx
  8018cf:	be 00 00 00 00       	mov    $0x0,%esi
  8018d4:	bf 01 00 00 00       	mov    $0x1,%edi
  8018d9:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  8018e0:	00 00 00 
  8018e3:	ff d0                	callq  *%rax
  8018e5:	48 83 c4 10          	add    $0x10,%rsp
  8018e9:	c9                   	leaveq 
  8018ea:	c3                   	retq   

00000000008018eb <sys_env_destroy>:
  8018eb:	55                   	push   %rbp
  8018ec:	48 89 e5             	mov    %rsp,%rbp
  8018ef:	48 83 ec 10          	sub    $0x10,%rsp
  8018f3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8018f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8018f9:	48 98                	cltq   
  8018fb:	48 83 ec 08          	sub    $0x8,%rsp
  8018ff:	6a 00                	pushq  $0x0
  801901:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801907:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  80190d:	b9 00 00 00 00       	mov    $0x0,%ecx
  801912:	48 89 c2             	mov    %rax,%rdx
  801915:	be 01 00 00 00       	mov    $0x1,%esi
  80191a:	bf 03 00 00 00       	mov    $0x3,%edi
  80191f:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801926:	00 00 00 
  801929:	ff d0                	callq  *%rax
  80192b:	48 83 c4 10          	add    $0x10,%rsp
  80192f:	c9                   	leaveq 
  801930:	c3                   	retq   

0000000000801931 <sys_getenvid>:
  801931:	55                   	push   %rbp
  801932:	48 89 e5             	mov    %rsp,%rbp
  801935:	48 83 ec 08          	sub    $0x8,%rsp
  801939:	6a 00                	pushq  $0x0
  80193b:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801941:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801947:	b9 00 00 00 00       	mov    $0x0,%ecx
  80194c:	ba 00 00 00 00       	mov    $0x0,%edx
  801951:	be 00 00 00 00       	mov    $0x0,%esi
  801956:	bf 02 00 00 00       	mov    $0x2,%edi
  80195b:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801962:	00 00 00 
  801965:	ff d0                	callq  *%rax
  801967:	48 83 c4 10          	add    $0x10,%rsp
  80196b:	c9                   	leaveq 
  80196c:	c3                   	retq   

000000000080196d <sys_yield>:
  80196d:	55                   	push   %rbp
  80196e:	48 89 e5             	mov    %rsp,%rbp
  801971:	48 83 ec 08          	sub    $0x8,%rsp
  801975:	6a 00                	pushq  $0x0
  801977:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  80197d:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801983:	b9 00 00 00 00       	mov    $0x0,%ecx
  801988:	ba 00 00 00 00       	mov    $0x0,%edx
  80198d:	be 00 00 00 00       	mov    $0x0,%esi
  801992:	bf 0b 00 00 00       	mov    $0xb,%edi
  801997:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  80199e:	00 00 00 
  8019a1:	ff d0                	callq  *%rax
  8019a3:	48 83 c4 10          	add    $0x10,%rsp
  8019a7:	90                   	nop
  8019a8:	c9                   	leaveq 
  8019a9:	c3                   	retq   

00000000008019aa <sys_page_alloc>:
  8019aa:	55                   	push   %rbp
  8019ab:	48 89 e5             	mov    %rsp,%rbp
  8019ae:	48 83 ec 10          	sub    $0x10,%rsp
  8019b2:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8019b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8019b9:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8019bc:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8019bf:	48 63 c8             	movslq %eax,%rcx
  8019c2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8019c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8019c9:	48 98                	cltq   
  8019cb:	48 83 ec 08          	sub    $0x8,%rsp
  8019cf:	6a 00                	pushq  $0x0
  8019d1:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  8019d7:	49 89 c8             	mov    %rcx,%r8
  8019da:	48 89 d1             	mov    %rdx,%rcx
  8019dd:	48 89 c2             	mov    %rax,%rdx
  8019e0:	be 01 00 00 00       	mov    $0x1,%esi
  8019e5:	bf 04 00 00 00       	mov    $0x4,%edi
  8019ea:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  8019f1:	00 00 00 
  8019f4:	ff d0                	callq  *%rax
  8019f6:	48 83 c4 10          	add    $0x10,%rsp
  8019fa:	c9                   	leaveq 
  8019fb:	c3                   	retq   

00000000008019fc <sys_page_map>:
  8019fc:	55                   	push   %rbp
  8019fd:	48 89 e5             	mov    %rsp,%rbp
  801a00:	48 83 ec 20          	sub    $0x20,%rsp
  801a04:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a07:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a0b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801a0e:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801a12:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801a16:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801a19:	48 63 c8             	movslq %eax,%rcx
  801a1c:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801a20:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801a23:	48 63 f0             	movslq %eax,%rsi
  801a26:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a2a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a2d:	48 98                	cltq   
  801a2f:	48 83 ec 08          	sub    $0x8,%rsp
  801a33:	51                   	push   %rcx
  801a34:	49 89 f9             	mov    %rdi,%r9
  801a37:	49 89 f0             	mov    %rsi,%r8
  801a3a:	48 89 d1             	mov    %rdx,%rcx
  801a3d:	48 89 c2             	mov    %rax,%rdx
  801a40:	be 01 00 00 00       	mov    $0x1,%esi
  801a45:	bf 05 00 00 00       	mov    $0x5,%edi
  801a4a:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801a51:	00 00 00 
  801a54:	ff d0                	callq  *%rax
  801a56:	48 83 c4 10          	add    $0x10,%rsp
  801a5a:	c9                   	leaveq 
  801a5b:	c3                   	retq   

0000000000801a5c <sys_page_unmap>:
  801a5c:	55                   	push   %rbp
  801a5d:	48 89 e5             	mov    %rsp,%rbp
  801a60:	48 83 ec 10          	sub    $0x10,%rsp
  801a64:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801a67:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801a6b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801a6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801a72:	48 98                	cltq   
  801a74:	48 83 ec 08          	sub    $0x8,%rsp
  801a78:	6a 00                	pushq  $0x0
  801a7a:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801a80:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801a86:	48 89 d1             	mov    %rdx,%rcx
  801a89:	48 89 c2             	mov    %rax,%rdx
  801a8c:	be 01 00 00 00       	mov    $0x1,%esi
  801a91:	bf 06 00 00 00       	mov    $0x6,%edi
  801a96:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801a9d:	00 00 00 
  801aa0:	ff d0                	callq  *%rax
  801aa2:	48 83 c4 10          	add    $0x10,%rsp
  801aa6:	c9                   	leaveq 
  801aa7:	c3                   	retq   

0000000000801aa8 <sys_env_set_status>:
  801aa8:	55                   	push   %rbp
  801aa9:	48 89 e5             	mov    %rsp,%rbp
  801aac:	48 83 ec 10          	sub    $0x10,%rsp
  801ab0:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801ab3:	89 75 f8             	mov    %esi,-0x8(%rbp)
  801ab6:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ab9:	48 63 d0             	movslq %eax,%rdx
  801abc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801abf:	48 98                	cltq   
  801ac1:	48 83 ec 08          	sub    $0x8,%rsp
  801ac5:	6a 00                	pushq  $0x0
  801ac7:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801acd:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801ad3:	48 89 d1             	mov    %rdx,%rcx
  801ad6:	48 89 c2             	mov    %rax,%rdx
  801ad9:	be 01 00 00 00       	mov    $0x1,%esi
  801ade:	bf 08 00 00 00       	mov    $0x8,%edi
  801ae3:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801aea:	00 00 00 
  801aed:	ff d0                	callq  *%rax
  801aef:	48 83 c4 10          	add    $0x10,%rsp
  801af3:	c9                   	leaveq 
  801af4:	c3                   	retq   

0000000000801af5 <sys_env_set_trapframe>:
  801af5:	55                   	push   %rbp
  801af6:	48 89 e5             	mov    %rsp,%rbp
  801af9:	48 83 ec 10          	sub    $0x10,%rsp
  801afd:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b00:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b04:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b0b:	48 98                	cltq   
  801b0d:	48 83 ec 08          	sub    $0x8,%rsp
  801b11:	6a 00                	pushq  $0x0
  801b13:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b19:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b1f:	48 89 d1             	mov    %rdx,%rcx
  801b22:	48 89 c2             	mov    %rax,%rdx
  801b25:	be 01 00 00 00       	mov    $0x1,%esi
  801b2a:	bf 09 00 00 00       	mov    $0x9,%edi
  801b2f:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801b36:	00 00 00 
  801b39:	ff d0                	callq  *%rax
  801b3b:	48 83 c4 10          	add    $0x10,%rsp
  801b3f:	c9                   	leaveq 
  801b40:	c3                   	retq   

0000000000801b41 <sys_env_set_pgfault_upcall>:
  801b41:	55                   	push   %rbp
  801b42:	48 89 e5             	mov    %rsp,%rbp
  801b45:	48 83 ec 10          	sub    $0x10,%rsp
  801b49:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b4c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b50:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801b54:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801b57:	48 98                	cltq   
  801b59:	48 83 ec 08          	sub    $0x8,%rsp
  801b5d:	6a 00                	pushq  $0x0
  801b5f:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801b65:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801b6b:	48 89 d1             	mov    %rdx,%rcx
  801b6e:	48 89 c2             	mov    %rax,%rdx
  801b71:	be 01 00 00 00       	mov    $0x1,%esi
  801b76:	bf 0a 00 00 00       	mov    $0xa,%edi
  801b7b:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801b82:	00 00 00 
  801b85:	ff d0                	callq  *%rax
  801b87:	48 83 c4 10          	add    $0x10,%rsp
  801b8b:	c9                   	leaveq 
  801b8c:	c3                   	retq   

0000000000801b8d <sys_ipc_try_send>:
  801b8d:	55                   	push   %rbp
  801b8e:	48 89 e5             	mov    %rsp,%rbp
  801b91:	48 83 ec 20          	sub    $0x20,%rsp
  801b95:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801b98:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801b9c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  801ba0:	89 4d f8             	mov    %ecx,-0x8(%rbp)
  801ba3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801ba6:	48 63 f0             	movslq %eax,%rsi
  801ba9:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  801bad:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801bb0:	48 98                	cltq   
  801bb2:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801bb6:	48 83 ec 08          	sub    $0x8,%rsp
  801bba:	6a 00                	pushq  $0x0
  801bbc:	49 89 f1             	mov    %rsi,%r9
  801bbf:	49 89 c8             	mov    %rcx,%r8
  801bc2:	48 89 d1             	mov    %rdx,%rcx
  801bc5:	48 89 c2             	mov    %rax,%rdx
  801bc8:	be 00 00 00 00       	mov    $0x0,%esi
  801bcd:	bf 0c 00 00 00       	mov    $0xc,%edi
  801bd2:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801bd9:	00 00 00 
  801bdc:	ff d0                	callq  *%rax
  801bde:	48 83 c4 10          	add    $0x10,%rsp
  801be2:	c9                   	leaveq 
  801be3:	c3                   	retq   

0000000000801be4 <sys_ipc_recv>:
  801be4:	55                   	push   %rbp
  801be5:	48 89 e5             	mov    %rsp,%rbp
  801be8:	48 83 ec 10          	sub    $0x10,%rsp
  801bec:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801bf0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801bf4:	48 83 ec 08          	sub    $0x8,%rsp
  801bf8:	6a 00                	pushq  $0x0
  801bfa:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c00:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c06:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c0b:	48 89 c2             	mov    %rax,%rdx
  801c0e:	be 01 00 00 00       	mov    $0x1,%esi
  801c13:	bf 0d 00 00 00       	mov    $0xd,%edi
  801c18:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801c1f:	00 00 00 
  801c22:	ff d0                	callq  *%rax
  801c24:	48 83 c4 10          	add    $0x10,%rsp
  801c28:	c9                   	leaveq 
  801c29:	c3                   	retq   

0000000000801c2a <sys_time_msec>:
  801c2a:	55                   	push   %rbp
  801c2b:	48 89 e5             	mov    %rsp,%rbp
  801c2e:	48 83 ec 08          	sub    $0x8,%rsp
  801c32:	6a 00                	pushq  $0x0
  801c34:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c3a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c40:	b9 00 00 00 00       	mov    $0x0,%ecx
  801c45:	ba 00 00 00 00       	mov    $0x0,%edx
  801c4a:	be 00 00 00 00       	mov    $0x0,%esi
  801c4f:	bf 0e 00 00 00       	mov    $0xe,%edi
  801c54:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801c5b:	00 00 00 
  801c5e:	ff d0                	callq  *%rax
  801c60:	48 83 c4 10          	add    $0x10,%rsp
  801c64:	c9                   	leaveq 
  801c65:	c3                   	retq   

0000000000801c66 <sys_net_transmit>:
  801c66:	55                   	push   %rbp
  801c67:	48 89 e5             	mov    %rsp,%rbp
  801c6a:	48 83 ec 10          	sub    $0x10,%rsp
  801c6e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801c72:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801c75:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801c78:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801c7c:	48 83 ec 08          	sub    $0x8,%rsp
  801c80:	6a 00                	pushq  $0x0
  801c82:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801c88:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801c8e:	48 89 d1             	mov    %rdx,%rcx
  801c91:	48 89 c2             	mov    %rax,%rdx
  801c94:	be 00 00 00 00       	mov    $0x0,%esi
  801c99:	bf 0f 00 00 00       	mov    $0xf,%edi
  801c9e:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801ca5:	00 00 00 
  801ca8:	ff d0                	callq  *%rax
  801caa:	48 83 c4 10          	add    $0x10,%rsp
  801cae:	c9                   	leaveq 
  801caf:	c3                   	retq   

0000000000801cb0 <sys_net_receive>:
  801cb0:	55                   	push   %rbp
  801cb1:	48 89 e5             	mov    %rsp,%rbp
  801cb4:	48 83 ec 10          	sub    $0x10,%rsp
  801cb8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801cbc:	89 75 f4             	mov    %esi,-0xc(%rbp)
  801cbf:	8b 55 f4             	mov    -0xc(%rbp),%edx
  801cc2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801cc6:	48 83 ec 08          	sub    $0x8,%rsp
  801cca:	6a 00                	pushq  $0x0
  801ccc:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801cd2:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801cd8:	48 89 d1             	mov    %rdx,%rcx
  801cdb:	48 89 c2             	mov    %rax,%rdx
  801cde:	be 00 00 00 00       	mov    $0x0,%esi
  801ce3:	bf 10 00 00 00       	mov    $0x10,%edi
  801ce8:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801cef:	00 00 00 
  801cf2:	ff d0                	callq  *%rax
  801cf4:	48 83 c4 10          	add    $0x10,%rsp
  801cf8:	c9                   	leaveq 
  801cf9:	c3                   	retq   

0000000000801cfa <sys_ept_map>:
  801cfa:	55                   	push   %rbp
  801cfb:	48 89 e5             	mov    %rsp,%rbp
  801cfe:	48 83 ec 20          	sub    $0x20,%rsp
  801d02:	89 7d fc             	mov    %edi,-0x4(%rbp)
  801d05:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d09:	89 55 f8             	mov    %edx,-0x8(%rbp)
  801d0c:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  801d10:	44 89 45 e4          	mov    %r8d,-0x1c(%rbp)
  801d14:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  801d17:	48 63 c8             	movslq %eax,%rcx
  801d1a:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  801d1e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  801d21:	48 63 f0             	movslq %eax,%rsi
  801d24:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d28:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801d2b:	48 98                	cltq   
  801d2d:	48 83 ec 08          	sub    $0x8,%rsp
  801d31:	51                   	push   %rcx
  801d32:	49 89 f9             	mov    %rdi,%r9
  801d35:	49 89 f0             	mov    %rsi,%r8
  801d38:	48 89 d1             	mov    %rdx,%rcx
  801d3b:	48 89 c2             	mov    %rax,%rdx
  801d3e:	be 00 00 00 00       	mov    $0x0,%esi
  801d43:	bf 11 00 00 00       	mov    $0x11,%edi
  801d48:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801d4f:	00 00 00 
  801d52:	ff d0                	callq  *%rax
  801d54:	48 83 c4 10          	add    $0x10,%rsp
  801d58:	c9                   	leaveq 
  801d59:	c3                   	retq   

0000000000801d5a <sys_env_mkguest>:
  801d5a:	55                   	push   %rbp
  801d5b:	48 89 e5             	mov    %rsp,%rbp
  801d5e:	48 83 ec 10          	sub    $0x10,%rsp
  801d62:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801d66:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  801d6a:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801d6e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801d72:	48 83 ec 08          	sub    $0x8,%rsp
  801d76:	6a 00                	pushq  $0x0
  801d78:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  801d7e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  801d84:	48 89 d1             	mov    %rdx,%rcx
  801d87:	48 89 c2             	mov    %rax,%rdx
  801d8a:	be 00 00 00 00       	mov    $0x0,%esi
  801d8f:	bf 12 00 00 00       	mov    $0x12,%edi
  801d94:	48 b8 d4 17 80 00 00 	movabs $0x8017d4,%rax
  801d9b:	00 00 00 
  801d9e:	ff d0                	callq  *%rax
  801da0:	48 83 c4 10          	add    $0x10,%rsp
  801da4:	c9                   	leaveq 
  801da5:	c3                   	retq   

0000000000801da6 <fd2num>:
  801da6:	55                   	push   %rbp
  801da7:	48 89 e5             	mov    %rsp,%rbp
  801daa:	48 83 ec 08          	sub    $0x8,%rsp
  801dae:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801db2:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801db6:	48 b8 00 00 00 30 ff 	movabs $0xffffffff30000000,%rax
  801dbd:	ff ff ff 
  801dc0:	48 01 d0             	add    %rdx,%rax
  801dc3:	48 c1 e8 0c          	shr    $0xc,%rax
  801dc7:	c9                   	leaveq 
  801dc8:	c3                   	retq   

0000000000801dc9 <fd2data>:
  801dc9:	55                   	push   %rbp
  801dca:	48 89 e5             	mov    %rsp,%rbp
  801dcd:	48 83 ec 08          	sub    $0x8,%rsp
  801dd1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  801dd5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801dd9:	48 89 c7             	mov    %rax,%rdi
  801ddc:	48 b8 a6 1d 80 00 00 	movabs $0x801da6,%rax
  801de3:	00 00 00 
  801de6:	ff d0                	callq  *%rax
  801de8:	48 05 20 00 0d 00    	add    $0xd0020,%rax
  801dee:	48 c1 e0 0c          	shl    $0xc,%rax
  801df2:	c9                   	leaveq 
  801df3:	c3                   	retq   

0000000000801df4 <fd_alloc>:
  801df4:	55                   	push   %rbp
  801df5:	48 89 e5             	mov    %rsp,%rbp
  801df8:	48 83 ec 18          	sub    $0x18,%rsp
  801dfc:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  801e00:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801e07:	eb 6b                	jmp    801e74 <fd_alloc+0x80>
  801e09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801e0c:	48 98                	cltq   
  801e0e:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801e14:	48 c1 e0 0c          	shl    $0xc,%rax
  801e18:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  801e1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e20:	48 c1 e8 15          	shr    $0x15,%rax
  801e24:	48 89 c2             	mov    %rax,%rdx
  801e27:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801e2e:	01 00 00 
  801e31:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e35:	83 e0 01             	and    $0x1,%eax
  801e38:	48 85 c0             	test   %rax,%rax
  801e3b:	74 21                	je     801e5e <fd_alloc+0x6a>
  801e3d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801e41:	48 c1 e8 0c          	shr    $0xc,%rax
  801e45:	48 89 c2             	mov    %rax,%rdx
  801e48:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801e4f:	01 00 00 
  801e52:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801e56:	83 e0 01             	and    $0x1,%eax
  801e59:	48 85 c0             	test   %rax,%rax
  801e5c:	75 12                	jne    801e70 <fd_alloc+0x7c>
  801e5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e62:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  801e66:	48 89 10             	mov    %rdx,(%rax)
  801e69:	b8 00 00 00 00       	mov    $0x0,%eax
  801e6e:	eb 1a                	jmp    801e8a <fd_alloc+0x96>
  801e70:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  801e74:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  801e78:	7e 8f                	jle    801e09 <fd_alloc+0x15>
  801e7a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801e7e:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  801e85:	b8 f5 ff ff ff       	mov    $0xfffffff5,%eax
  801e8a:	c9                   	leaveq 
  801e8b:	c3                   	retq   

0000000000801e8c <fd_lookup>:
  801e8c:	55                   	push   %rbp
  801e8d:	48 89 e5             	mov    %rsp,%rbp
  801e90:	48 83 ec 20          	sub    $0x20,%rsp
  801e94:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801e97:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801e9b:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  801e9f:	78 06                	js     801ea7 <fd_lookup+0x1b>
  801ea1:	83 7d ec 1f          	cmpl   $0x1f,-0x14(%rbp)
  801ea5:	7e 07                	jle    801eae <fd_lookup+0x22>
  801ea7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801eac:	eb 6c                	jmp    801f1a <fd_lookup+0x8e>
  801eae:	8b 45 ec             	mov    -0x14(%rbp),%eax
  801eb1:	48 98                	cltq   
  801eb3:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  801eb9:	48 c1 e0 0c          	shl    $0xc,%rax
  801ebd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  801ec1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ec5:	48 c1 e8 15          	shr    $0x15,%rax
  801ec9:	48 89 c2             	mov    %rax,%rdx
  801ecc:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  801ed3:	01 00 00 
  801ed6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801eda:	83 e0 01             	and    $0x1,%eax
  801edd:	48 85 c0             	test   %rax,%rax
  801ee0:	74 21                	je     801f03 <fd_lookup+0x77>
  801ee2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  801ee6:	48 c1 e8 0c          	shr    $0xc,%rax
  801eea:	48 89 c2             	mov    %rax,%rdx
  801eed:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  801ef4:	01 00 00 
  801ef7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  801efb:	83 e0 01             	and    $0x1,%eax
  801efe:	48 85 c0             	test   %rax,%rax
  801f01:	75 07                	jne    801f0a <fd_lookup+0x7e>
  801f03:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  801f08:	eb 10                	jmp    801f1a <fd_lookup+0x8e>
  801f0a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  801f0e:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  801f12:	48 89 10             	mov    %rdx,(%rax)
  801f15:	b8 00 00 00 00       	mov    $0x0,%eax
  801f1a:	c9                   	leaveq 
  801f1b:	c3                   	retq   

0000000000801f1c <fd_close>:
  801f1c:	55                   	push   %rbp
  801f1d:	48 89 e5             	mov    %rsp,%rbp
  801f20:	48 83 ec 30          	sub    $0x30,%rsp
  801f24:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  801f28:	89 f0                	mov    %esi,%eax
  801f2a:	88 45 d4             	mov    %al,-0x2c(%rbp)
  801f2d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f31:	48 89 c7             	mov    %rax,%rdi
  801f34:	48 b8 a6 1d 80 00 00 	movabs $0x801da6,%rax
  801f3b:	00 00 00 
  801f3e:	ff d0                	callq  *%rax
  801f40:	89 c2                	mov    %eax,%edx
  801f42:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  801f46:	48 89 c6             	mov    %rax,%rsi
  801f49:	89 d7                	mov    %edx,%edi
  801f4b:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  801f52:	00 00 00 
  801f55:	ff d0                	callq  *%rax
  801f57:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f5a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f5e:	78 0a                	js     801f6a <fd_close+0x4e>
  801f60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  801f64:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
  801f68:	74 12                	je     801f7c <fd_close+0x60>
  801f6a:	80 7d d4 00          	cmpb   $0x0,-0x2c(%rbp)
  801f6e:	74 05                	je     801f75 <fd_close+0x59>
  801f70:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801f73:	eb 70                	jmp    801fe5 <fd_close+0xc9>
  801f75:	b8 00 00 00 00       	mov    $0x0,%eax
  801f7a:	eb 69                	jmp    801fe5 <fd_close+0xc9>
  801f7c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801f80:	8b 00                	mov    (%rax),%eax
  801f82:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  801f86:	48 89 d6             	mov    %rdx,%rsi
  801f89:	89 c7                	mov    %eax,%edi
  801f8b:	48 b8 e7 1f 80 00 00 	movabs $0x801fe7,%rax
  801f92:	00 00 00 
  801f95:	ff d0                	callq  *%rax
  801f97:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801f9a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  801f9e:	78 2a                	js     801fca <fd_close+0xae>
  801fa0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fa4:	48 8b 40 20          	mov    0x20(%rax),%rax
  801fa8:	48 85 c0             	test   %rax,%rax
  801fab:	74 16                	je     801fc3 <fd_close+0xa7>
  801fad:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  801fb1:	48 8b 40 20          	mov    0x20(%rax),%rax
  801fb5:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  801fb9:	48 89 d7             	mov    %rdx,%rdi
  801fbc:	ff d0                	callq  *%rax
  801fbe:	89 45 fc             	mov    %eax,-0x4(%rbp)
  801fc1:	eb 07                	jmp    801fca <fd_close+0xae>
  801fc3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801fca:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  801fce:	48 89 c6             	mov    %rax,%rsi
  801fd1:	bf 00 00 00 00       	mov    $0x0,%edi
  801fd6:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  801fdd:	00 00 00 
  801fe0:	ff d0                	callq  *%rax
  801fe2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  801fe5:	c9                   	leaveq 
  801fe6:	c3                   	retq   

0000000000801fe7 <dev_lookup>:
  801fe7:	55                   	push   %rbp
  801fe8:	48 89 e5             	mov    %rsp,%rbp
  801feb:	48 83 ec 20          	sub    $0x20,%rsp
  801fef:	89 7d ec             	mov    %edi,-0x14(%rbp)
  801ff2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  801ff6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  801ffd:	eb 41                	jmp    802040 <dev_lookup+0x59>
  801fff:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802006:	00 00 00 
  802009:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80200c:	48 63 d2             	movslq %edx,%rdx
  80200f:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802013:	8b 00                	mov    (%rax),%eax
  802015:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  802018:	75 22                	jne    80203c <dev_lookup+0x55>
  80201a:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802021:	00 00 00 
  802024:	8b 55 fc             	mov    -0x4(%rbp),%edx
  802027:	48 63 d2             	movslq %edx,%rdx
  80202a:	48 8b 14 d0          	mov    (%rax,%rdx,8),%rdx
  80202e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802032:	48 89 10             	mov    %rdx,(%rax)
  802035:	b8 00 00 00 00       	mov    $0x0,%eax
  80203a:	eb 60                	jmp    80209c <dev_lookup+0xb5>
  80203c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  802040:	48 b8 20 60 80 00 00 	movabs $0x806020,%rax
  802047:	00 00 00 
  80204a:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80204d:	48 63 d2             	movslq %edx,%rdx
  802050:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  802054:	48 85 c0             	test   %rax,%rax
  802057:	75 a6                	jne    801fff <dev_lookup+0x18>
  802059:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802060:	00 00 00 
  802063:	48 8b 00             	mov    (%rax),%rax
  802066:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80206c:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80206f:	89 c6                	mov    %eax,%esi
  802071:	48 bf f8 4c 80 00 00 	movabs $0x804cf8,%rdi
  802078:	00 00 00 
  80207b:	b8 00 00 00 00       	mov    $0x0,%eax
  802080:	48 b9 ea 04 80 00 00 	movabs $0x8004ea,%rcx
  802087:	00 00 00 
  80208a:	ff d1                	callq  *%rcx
  80208c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802090:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
  802097:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80209c:	c9                   	leaveq 
  80209d:	c3                   	retq   

000000000080209e <close>:
  80209e:	55                   	push   %rbp
  80209f:	48 89 e5             	mov    %rsp,%rbp
  8020a2:	48 83 ec 20          	sub    $0x20,%rsp
  8020a6:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8020a9:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8020ad:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8020b0:	48 89 d6             	mov    %rdx,%rsi
  8020b3:	89 c7                	mov    %eax,%edi
  8020b5:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  8020bc:	00 00 00 
  8020bf:	ff d0                	callq  *%rax
  8020c1:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8020c4:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8020c8:	79 05                	jns    8020cf <close+0x31>
  8020ca:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020cd:	eb 18                	jmp    8020e7 <close+0x49>
  8020cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8020d3:	be 01 00 00 00       	mov    $0x1,%esi
  8020d8:	48 89 c7             	mov    %rax,%rdi
  8020db:	48 b8 1c 1f 80 00 00 	movabs $0x801f1c,%rax
  8020e2:	00 00 00 
  8020e5:	ff d0                	callq  *%rax
  8020e7:	c9                   	leaveq 
  8020e8:	c3                   	retq   

00000000008020e9 <close_all>:
  8020e9:	55                   	push   %rbp
  8020ea:	48 89 e5             	mov    %rsp,%rbp
  8020ed:	48 83 ec 10          	sub    $0x10,%rsp
  8020f1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8020f8:	eb 15                	jmp    80210f <close_all+0x26>
  8020fa:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8020fd:	89 c7                	mov    %eax,%edi
  8020ff:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  802106:	00 00 00 
  802109:	ff d0                	callq  *%rax
  80210b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  80210f:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
  802113:	7e e5                	jle    8020fa <close_all+0x11>
  802115:	90                   	nop
  802116:	c9                   	leaveq 
  802117:	c3                   	retq   

0000000000802118 <dup>:
  802118:	55                   	push   %rbp
  802119:	48 89 e5             	mov    %rsp,%rbp
  80211c:	48 83 ec 40          	sub    $0x40,%rsp
  802120:	89 7d cc             	mov    %edi,-0x34(%rbp)
  802123:	89 75 c8             	mov    %esi,-0x38(%rbp)
  802126:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
  80212a:	8b 45 cc             	mov    -0x34(%rbp),%eax
  80212d:	48 89 d6             	mov    %rdx,%rsi
  802130:	89 c7                	mov    %eax,%edi
  802132:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  802139:	00 00 00 
  80213c:	ff d0                	callq  *%rax
  80213e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802141:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802145:	79 08                	jns    80214f <dup+0x37>
  802147:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80214a:	e9 70 01 00 00       	jmpq   8022bf <dup+0x1a7>
  80214f:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802152:	89 c7                	mov    %eax,%edi
  802154:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  80215b:	00 00 00 
  80215e:	ff d0                	callq  *%rax
  802160:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802163:	48 98                	cltq   
  802165:	48 05 00 00 0d 00    	add    $0xd0000,%rax
  80216b:	48 c1 e0 0c          	shl    $0xc,%rax
  80216f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  802173:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802177:	48 89 c7             	mov    %rax,%rdi
  80217a:	48 b8 c9 1d 80 00 00 	movabs $0x801dc9,%rax
  802181:	00 00 00 
  802184:	ff d0                	callq  *%rax
  802186:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80218a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80218e:	48 89 c7             	mov    %rax,%rdi
  802191:	48 b8 c9 1d 80 00 00 	movabs $0x801dc9,%rax
  802198:	00 00 00 
  80219b:	ff d0                	callq  *%rax
  80219d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  8021a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021a5:	48 c1 e8 15          	shr    $0x15,%rax
  8021a9:	48 89 c2             	mov    %rax,%rdx
  8021ac:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8021b3:	01 00 00 
  8021b6:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021ba:	83 e0 01             	and    $0x1,%eax
  8021bd:	48 85 c0             	test   %rax,%rax
  8021c0:	74 71                	je     802233 <dup+0x11b>
  8021c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021c6:	48 c1 e8 0c          	shr    $0xc,%rax
  8021ca:	48 89 c2             	mov    %rax,%rdx
  8021cd:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021d4:	01 00 00 
  8021d7:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021db:	83 e0 01             	and    $0x1,%eax
  8021de:	48 85 c0             	test   %rax,%rax
  8021e1:	74 50                	je     802233 <dup+0x11b>
  8021e3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8021e7:	48 c1 e8 0c          	shr    $0xc,%rax
  8021eb:	48 89 c2             	mov    %rax,%rdx
  8021ee:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8021f5:	01 00 00 
  8021f8:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8021fc:	25 07 0e 00 00       	and    $0xe07,%eax
  802201:	89 c1                	mov    %eax,%ecx
  802203:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  802207:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80220b:	41 89 c8             	mov    %ecx,%r8d
  80220e:	48 89 d1             	mov    %rdx,%rcx
  802211:	ba 00 00 00 00       	mov    $0x0,%edx
  802216:	48 89 c6             	mov    %rax,%rsi
  802219:	bf 00 00 00 00       	mov    $0x0,%edi
  80221e:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  802225:	00 00 00 
  802228:	ff d0                	callq  *%rax
  80222a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80222d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802231:	78 55                	js     802288 <dup+0x170>
  802233:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802237:	48 c1 e8 0c          	shr    $0xc,%rax
  80223b:	48 89 c2             	mov    %rax,%rdx
  80223e:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  802245:	01 00 00 
  802248:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  80224c:	25 07 0e 00 00       	and    $0xe07,%eax
  802251:	89 c1                	mov    %eax,%ecx
  802253:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  802257:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  80225b:	41 89 c8             	mov    %ecx,%r8d
  80225e:	48 89 d1             	mov    %rdx,%rcx
  802261:	ba 00 00 00 00       	mov    $0x0,%edx
  802266:	48 89 c6             	mov    %rax,%rsi
  802269:	bf 00 00 00 00       	mov    $0x0,%edi
  80226e:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  802275:	00 00 00 
  802278:	ff d0                	callq  *%rax
  80227a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80227d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802281:	78 08                	js     80228b <dup+0x173>
  802283:	8b 45 c8             	mov    -0x38(%rbp),%eax
  802286:	eb 37                	jmp    8022bf <dup+0x1a7>
  802288:	90                   	nop
  802289:	eb 01                	jmp    80228c <dup+0x174>
  80228b:	90                   	nop
  80228c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802290:	48 89 c6             	mov    %rax,%rsi
  802293:	bf 00 00 00 00       	mov    $0x0,%edi
  802298:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  80229f:	00 00 00 
  8022a2:	ff d0                	callq  *%rax
  8022a4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8022a8:	48 89 c6             	mov    %rax,%rsi
  8022ab:	bf 00 00 00 00       	mov    $0x0,%edi
  8022b0:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  8022b7:	00 00 00 
  8022ba:	ff d0                	callq  *%rax
  8022bc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8022bf:	c9                   	leaveq 
  8022c0:	c3                   	retq   

00000000008022c1 <read>:
  8022c1:	55                   	push   %rbp
  8022c2:	48 89 e5             	mov    %rsp,%rbp
  8022c5:	48 83 ec 40          	sub    $0x40,%rsp
  8022c9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8022cc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8022d0:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8022d4:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8022d8:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8022db:	48 89 d6             	mov    %rdx,%rsi
  8022de:	89 c7                	mov    %eax,%edi
  8022e0:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  8022e7:	00 00 00 
  8022ea:	ff d0                	callq  *%rax
  8022ec:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8022ef:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8022f3:	78 24                	js     802319 <read+0x58>
  8022f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8022f9:	8b 00                	mov    (%rax),%eax
  8022fb:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8022ff:	48 89 d6             	mov    %rdx,%rsi
  802302:	89 c7                	mov    %eax,%edi
  802304:	48 b8 e7 1f 80 00 00 	movabs $0x801fe7,%rax
  80230b:	00 00 00 
  80230e:	ff d0                	callq  *%rax
  802310:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802313:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802317:	79 05                	jns    80231e <read+0x5d>
  802319:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80231c:	eb 76                	jmp    802394 <read+0xd3>
  80231e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802322:	8b 40 08             	mov    0x8(%rax),%eax
  802325:	83 e0 03             	and    $0x3,%eax
  802328:	83 f8 01             	cmp    $0x1,%eax
  80232b:	75 3a                	jne    802367 <read+0xa6>
  80232d:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802334:	00 00 00 
  802337:	48 8b 00             	mov    (%rax),%rax
  80233a:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  802340:	8b 55 dc             	mov    -0x24(%rbp),%edx
  802343:	89 c6                	mov    %eax,%esi
  802345:	48 bf 17 4d 80 00 00 	movabs $0x804d17,%rdi
  80234c:	00 00 00 
  80234f:	b8 00 00 00 00       	mov    $0x0,%eax
  802354:	48 b9 ea 04 80 00 00 	movabs $0x8004ea,%rcx
  80235b:	00 00 00 
  80235e:	ff d1                	callq  *%rcx
  802360:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  802365:	eb 2d                	jmp    802394 <read+0xd3>
  802367:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80236b:	48 8b 40 10          	mov    0x10(%rax),%rax
  80236f:	48 85 c0             	test   %rax,%rax
  802372:	75 07                	jne    80237b <read+0xba>
  802374:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802379:	eb 19                	jmp    802394 <read+0xd3>
  80237b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80237f:	48 8b 40 10          	mov    0x10(%rax),%rax
  802383:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  802387:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  80238b:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  80238f:	48 89 cf             	mov    %rcx,%rdi
  802392:	ff d0                	callq  *%rax
  802394:	c9                   	leaveq 
  802395:	c3                   	retq   

0000000000802396 <readn>:
  802396:	55                   	push   %rbp
  802397:	48 89 e5             	mov    %rsp,%rbp
  80239a:	48 83 ec 30          	sub    $0x30,%rsp
  80239e:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8023a1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8023a5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8023a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8023b0:	eb 47                	jmp    8023f9 <readn+0x63>
  8023b2:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023b5:	48 98                	cltq   
  8023b7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8023bb:	48 29 c2             	sub    %rax,%rdx
  8023be:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023c1:	48 63 c8             	movslq %eax,%rcx
  8023c4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8023c8:	48 01 c1             	add    %rax,%rcx
  8023cb:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8023ce:	48 89 ce             	mov    %rcx,%rsi
  8023d1:	89 c7                	mov    %eax,%edi
  8023d3:	48 b8 c1 22 80 00 00 	movabs $0x8022c1,%rax
  8023da:	00 00 00 
  8023dd:	ff d0                	callq  *%rax
  8023df:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8023e2:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023e6:	79 05                	jns    8023ed <readn+0x57>
  8023e8:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023eb:	eb 1d                	jmp    80240a <readn+0x74>
  8023ed:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  8023f1:	74 13                	je     802406 <readn+0x70>
  8023f3:	8b 45 f8             	mov    -0x8(%rbp),%eax
  8023f6:	01 45 fc             	add    %eax,-0x4(%rbp)
  8023f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8023fc:	48 98                	cltq   
  8023fe:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802402:	72 ae                	jb     8023b2 <readn+0x1c>
  802404:	eb 01                	jmp    802407 <readn+0x71>
  802406:	90                   	nop
  802407:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80240a:	c9                   	leaveq 
  80240b:	c3                   	retq   

000000000080240c <write>:
  80240c:	55                   	push   %rbp
  80240d:	48 89 e5             	mov    %rsp,%rbp
  802410:	48 83 ec 40          	sub    $0x40,%rsp
  802414:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802417:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80241b:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  80241f:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802423:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802426:	48 89 d6             	mov    %rdx,%rsi
  802429:	89 c7                	mov    %eax,%edi
  80242b:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  802432:	00 00 00 
  802435:	ff d0                	callq  *%rax
  802437:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80243a:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80243e:	78 24                	js     802464 <write+0x58>
  802440:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802444:	8b 00                	mov    (%rax),%eax
  802446:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80244a:	48 89 d6             	mov    %rdx,%rsi
  80244d:	89 c7                	mov    %eax,%edi
  80244f:	48 b8 e7 1f 80 00 00 	movabs $0x801fe7,%rax
  802456:	00 00 00 
  802459:	ff d0                	callq  *%rax
  80245b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80245e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802462:	79 05                	jns    802469 <write+0x5d>
  802464:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802467:	eb 75                	jmp    8024de <write+0xd2>
  802469:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  80246d:	8b 40 08             	mov    0x8(%rax),%eax
  802470:	83 e0 03             	and    $0x3,%eax
  802473:	85 c0                	test   %eax,%eax
  802475:	75 3a                	jne    8024b1 <write+0xa5>
  802477:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80247e:	00 00 00 
  802481:	48 8b 00             	mov    (%rax),%rax
  802484:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80248a:	8b 55 dc             	mov    -0x24(%rbp),%edx
  80248d:	89 c6                	mov    %eax,%esi
  80248f:	48 bf 33 4d 80 00 00 	movabs $0x804d33,%rdi
  802496:	00 00 00 
  802499:	b8 00 00 00 00       	mov    $0x0,%eax
  80249e:	48 b9 ea 04 80 00 00 	movabs $0x8004ea,%rcx
  8024a5:	00 00 00 
  8024a8:	ff d1                	callq  *%rcx
  8024aa:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8024af:	eb 2d                	jmp    8024de <write+0xd2>
  8024b1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024b5:	48 8b 40 18          	mov    0x18(%rax),%rax
  8024b9:	48 85 c0             	test   %rax,%rax
  8024bc:	75 07                	jne    8024c5 <write+0xb9>
  8024be:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8024c3:	eb 19                	jmp    8024de <write+0xd2>
  8024c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8024c9:	48 8b 40 18          	mov    0x18(%rax),%rax
  8024cd:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
  8024d1:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  8024d5:	48 8b 75 d0          	mov    -0x30(%rbp),%rsi
  8024d9:	48 89 cf             	mov    %rcx,%rdi
  8024dc:	ff d0                	callq  *%rax
  8024de:	c9                   	leaveq 
  8024df:	c3                   	retq   

00000000008024e0 <seek>:
  8024e0:	55                   	push   %rbp
  8024e1:	48 89 e5             	mov    %rsp,%rbp
  8024e4:	48 83 ec 18          	sub    $0x18,%rsp
  8024e8:	89 7d ec             	mov    %edi,-0x14(%rbp)
  8024eb:	89 75 e8             	mov    %esi,-0x18(%rbp)
  8024ee:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  8024f2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8024f5:	48 89 d6             	mov    %rdx,%rsi
  8024f8:	89 c7                	mov    %eax,%edi
  8024fa:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  802501:	00 00 00 
  802504:	ff d0                	callq  *%rax
  802506:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802509:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80250d:	79 05                	jns    802514 <seek+0x34>
  80250f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802512:	eb 0f                	jmp    802523 <seek+0x43>
  802514:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802518:	8b 55 e8             	mov    -0x18(%rbp),%edx
  80251b:	89 50 04             	mov    %edx,0x4(%rax)
  80251e:	b8 00 00 00 00       	mov    $0x0,%eax
  802523:	c9                   	leaveq 
  802524:	c3                   	retq   

0000000000802525 <ftruncate>:
  802525:	55                   	push   %rbp
  802526:	48 89 e5             	mov    %rsp,%rbp
  802529:	48 83 ec 30          	sub    $0x30,%rsp
  80252d:	89 7d dc             	mov    %edi,-0x24(%rbp)
  802530:	89 75 d8             	mov    %esi,-0x28(%rbp)
  802533:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802537:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80253a:	48 89 d6             	mov    %rdx,%rsi
  80253d:	89 c7                	mov    %eax,%edi
  80253f:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  802546:	00 00 00 
  802549:	ff d0                	callq  *%rax
  80254b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80254e:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802552:	78 24                	js     802578 <ftruncate+0x53>
  802554:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802558:	8b 00                	mov    (%rax),%eax
  80255a:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80255e:	48 89 d6             	mov    %rdx,%rsi
  802561:	89 c7                	mov    %eax,%edi
  802563:	48 b8 e7 1f 80 00 00 	movabs $0x801fe7,%rax
  80256a:	00 00 00 
  80256d:	ff d0                	callq  *%rax
  80256f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802572:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802576:	79 05                	jns    80257d <ftruncate+0x58>
  802578:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80257b:	eb 72                	jmp    8025ef <ftruncate+0xca>
  80257d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802581:	8b 40 08             	mov    0x8(%rax),%eax
  802584:	83 e0 03             	and    $0x3,%eax
  802587:	85 c0                	test   %eax,%eax
  802589:	75 3a                	jne    8025c5 <ftruncate+0xa0>
  80258b:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  802592:	00 00 00 
  802595:	48 8b 00             	mov    (%rax),%rax
  802598:	8b 80 c8 00 00 00    	mov    0xc8(%rax),%eax
  80259e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  8025a1:	89 c6                	mov    %eax,%esi
  8025a3:	48 bf 50 4d 80 00 00 	movabs $0x804d50,%rdi
  8025aa:	00 00 00 
  8025ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8025b2:	48 b9 ea 04 80 00 00 	movabs $0x8004ea,%rcx
  8025b9:	00 00 00 
  8025bc:	ff d1                	callq  *%rcx
  8025be:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8025c3:	eb 2a                	jmp    8025ef <ftruncate+0xca>
  8025c5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025c9:	48 8b 40 30          	mov    0x30(%rax),%rax
  8025cd:	48 85 c0             	test   %rax,%rax
  8025d0:	75 07                	jne    8025d9 <ftruncate+0xb4>
  8025d2:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  8025d7:	eb 16                	jmp    8025ef <ftruncate+0xca>
  8025d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8025dd:	48 8b 40 30          	mov    0x30(%rax),%rax
  8025e1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8025e5:	8b 4d d8             	mov    -0x28(%rbp),%ecx
  8025e8:	89 ce                	mov    %ecx,%esi
  8025ea:	48 89 d7             	mov    %rdx,%rdi
  8025ed:	ff d0                	callq  *%rax
  8025ef:	c9                   	leaveq 
  8025f0:	c3                   	retq   

00000000008025f1 <fstat>:
  8025f1:	55                   	push   %rbp
  8025f2:	48 89 e5             	mov    %rsp,%rbp
  8025f5:	48 83 ec 30          	sub    $0x30,%rsp
  8025f9:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8025fc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  802600:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  802604:	8b 45 dc             	mov    -0x24(%rbp),%eax
  802607:	48 89 d6             	mov    %rdx,%rsi
  80260a:	89 c7                	mov    %eax,%edi
  80260c:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  802613:	00 00 00 
  802616:	ff d0                	callq  *%rax
  802618:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80261b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80261f:	78 24                	js     802645 <fstat+0x54>
  802621:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802625:	8b 00                	mov    (%rax),%eax
  802627:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  80262b:	48 89 d6             	mov    %rdx,%rsi
  80262e:	89 c7                	mov    %eax,%edi
  802630:	48 b8 e7 1f 80 00 00 	movabs $0x801fe7,%rax
  802637:	00 00 00 
  80263a:	ff d0                	callq  *%rax
  80263c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80263f:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802643:	79 05                	jns    80264a <fstat+0x59>
  802645:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802648:	eb 5e                	jmp    8026a8 <fstat+0xb7>
  80264a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80264e:	48 8b 40 28          	mov    0x28(%rax),%rax
  802652:	48 85 c0             	test   %rax,%rax
  802655:	75 07                	jne    80265e <fstat+0x6d>
  802657:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  80265c:	eb 4a                	jmp    8026a8 <fstat+0xb7>
  80265e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802662:	c6 00 00             	movb   $0x0,(%rax)
  802665:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802669:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%rax)
  802670:	00 00 00 
  802673:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802677:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  80267e:	00 00 00 
  802681:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  802685:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802689:	48 89 90 88 00 00 00 	mov    %rdx,0x88(%rax)
  802690:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802694:	48 8b 40 28          	mov    0x28(%rax),%rax
  802698:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  80269c:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  8026a0:	48 89 ce             	mov    %rcx,%rsi
  8026a3:	48 89 d7             	mov    %rdx,%rdi
  8026a6:	ff d0                	callq  *%rax
  8026a8:	c9                   	leaveq 
  8026a9:	c3                   	retq   

00000000008026aa <stat>:
  8026aa:	55                   	push   %rbp
  8026ab:	48 89 e5             	mov    %rsp,%rbp
  8026ae:	48 83 ec 20          	sub    $0x20,%rsp
  8026b2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8026b6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8026ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8026be:	be 00 00 00 00       	mov    $0x0,%esi
  8026c3:	48 89 c7             	mov    %rax,%rdi
  8026c6:	48 b8 9a 27 80 00 00 	movabs $0x80279a,%rax
  8026cd:	00 00 00 
  8026d0:	ff d0                	callq  *%rax
  8026d2:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8026d5:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8026d9:	79 05                	jns    8026e0 <stat+0x36>
  8026db:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026de:	eb 2f                	jmp    80270f <stat+0x65>
  8026e0:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  8026e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026e7:	48 89 d6             	mov    %rdx,%rsi
  8026ea:	89 c7                	mov    %eax,%edi
  8026ec:	48 b8 f1 25 80 00 00 	movabs $0x8025f1,%rax
  8026f3:	00 00 00 
  8026f6:	ff d0                	callq  *%rax
  8026f8:	89 45 f8             	mov    %eax,-0x8(%rbp)
  8026fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8026fe:	89 c7                	mov    %eax,%edi
  802700:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  802707:	00 00 00 
  80270a:	ff d0                	callq  *%rax
  80270c:	8b 45 f8             	mov    -0x8(%rbp),%eax
  80270f:	c9                   	leaveq 
  802710:	c3                   	retq   

0000000000802711 <fsipc>:
  802711:	55                   	push   %rbp
  802712:	48 89 e5             	mov    %rsp,%rbp
  802715:	48 83 ec 10          	sub    $0x10,%rsp
  802719:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80271c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  802720:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802727:	00 00 00 
  80272a:	8b 00                	mov    (%rax),%eax
  80272c:	85 c0                	test   %eax,%eax
  80272e:	75 1f                	jne    80274f <fsipc+0x3e>
  802730:	bf 01 00 00 00       	mov    $0x1,%edi
  802735:	48 b8 33 41 80 00 00 	movabs $0x804133,%rax
  80273c:	00 00 00 
  80273f:	ff d0                	callq  *%rax
  802741:	89 c2                	mov    %eax,%edx
  802743:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  80274a:	00 00 00 
  80274d:	89 10                	mov    %edx,(%rax)
  80274f:	48 b8 00 70 80 00 00 	movabs $0x807000,%rax
  802756:	00 00 00 
  802759:	8b 00                	mov    (%rax),%eax
  80275b:	8b 75 fc             	mov    -0x4(%rbp),%esi
  80275e:	b9 07 00 00 00       	mov    $0x7,%ecx
  802763:	48 ba 00 80 80 00 00 	movabs $0x808000,%rdx
  80276a:	00 00 00 
  80276d:	89 c7                	mov    %eax,%edi
  80276f:	48 b8 29 40 80 00 00 	movabs $0x804029,%rax
  802776:	00 00 00 
  802779:	ff d0                	callq  *%rax
  80277b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80277f:	ba 00 00 00 00       	mov    $0x0,%edx
  802784:	48 89 c6             	mov    %rax,%rsi
  802787:	bf 00 00 00 00       	mov    $0x0,%edi
  80278c:	48 b8 68 3f 80 00 00 	movabs $0x803f68,%rax
  802793:	00 00 00 
  802796:	ff d0                	callq  *%rax
  802798:	c9                   	leaveq 
  802799:	c3                   	retq   

000000000080279a <open>:
  80279a:	55                   	push   %rbp
  80279b:	48 89 e5             	mov    %rsp,%rbp
  80279e:	48 83 ec 20          	sub    $0x20,%rsp
  8027a2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8027a6:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  8027a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027ad:	48 89 c7             	mov    %rax,%rdi
  8027b0:	48 b8 0e 10 80 00 00 	movabs $0x80100e,%rax
  8027b7:	00 00 00 
  8027ba:	ff d0                	callq  *%rax
  8027bc:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  8027c1:	7e 0a                	jle    8027cd <open+0x33>
  8027c3:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  8027c8:	e9 a5 00 00 00       	jmpq   802872 <open+0xd8>
  8027cd:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  8027d1:	48 89 c7             	mov    %rax,%rdi
  8027d4:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  8027db:	00 00 00 
  8027de:	ff d0                	callq  *%rax
  8027e0:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8027e3:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8027e7:	79 08                	jns    8027f1 <open+0x57>
  8027e9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8027ec:	e9 81 00 00 00       	jmpq   802872 <open+0xd8>
  8027f1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8027f5:	48 89 c6             	mov    %rax,%rsi
  8027f8:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  8027ff:	00 00 00 
  802802:	48 b8 7a 10 80 00 00 	movabs $0x80107a,%rax
  802809:	00 00 00 
  80280c:	ff d0                	callq  *%rax
  80280e:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802815:	00 00 00 
  802818:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  80281b:	89 90 00 04 00 00    	mov    %edx,0x400(%rax)
  802821:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802825:	48 89 c6             	mov    %rax,%rsi
  802828:	bf 01 00 00 00       	mov    $0x1,%edi
  80282d:	48 b8 11 27 80 00 00 	movabs $0x802711,%rax
  802834:	00 00 00 
  802837:	ff d0                	callq  *%rax
  802839:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80283c:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802840:	79 1d                	jns    80285f <open+0xc5>
  802842:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802846:	be 00 00 00 00       	mov    $0x0,%esi
  80284b:	48 89 c7             	mov    %rax,%rdi
  80284e:	48 b8 1c 1f 80 00 00 	movabs $0x801f1c,%rax
  802855:	00 00 00 
  802858:	ff d0                	callq  *%rax
  80285a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80285d:	eb 13                	jmp    802872 <open+0xd8>
  80285f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802863:	48 89 c7             	mov    %rax,%rdi
  802866:	48 b8 a6 1d 80 00 00 	movabs $0x801da6,%rax
  80286d:	00 00 00 
  802870:	ff d0                	callq  *%rax
  802872:	c9                   	leaveq 
  802873:	c3                   	retq   

0000000000802874 <devfile_flush>:
  802874:	55                   	push   %rbp
  802875:	48 89 e5             	mov    %rsp,%rbp
  802878:	48 83 ec 10          	sub    $0x10,%rsp
  80287c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802880:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802884:	8b 50 0c             	mov    0xc(%rax),%edx
  802887:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  80288e:	00 00 00 
  802891:	89 10                	mov    %edx,(%rax)
  802893:	be 00 00 00 00       	mov    $0x0,%esi
  802898:	bf 06 00 00 00       	mov    $0x6,%edi
  80289d:	48 b8 11 27 80 00 00 	movabs $0x802711,%rax
  8028a4:	00 00 00 
  8028a7:	ff d0                	callq  *%rax
  8028a9:	c9                   	leaveq 
  8028aa:	c3                   	retq   

00000000008028ab <devfile_read>:
  8028ab:	55                   	push   %rbp
  8028ac:	48 89 e5             	mov    %rsp,%rbp
  8028af:	48 83 ec 30          	sub    $0x30,%rsp
  8028b3:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8028b7:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  8028bb:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  8028bf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8028c3:	8b 50 0c             	mov    0xc(%rax),%edx
  8028c6:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028cd:	00 00 00 
  8028d0:	89 10                	mov    %edx,(%rax)
  8028d2:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8028d9:	00 00 00 
  8028dc:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  8028e0:	48 89 50 08          	mov    %rdx,0x8(%rax)
  8028e4:	be 00 00 00 00       	mov    $0x0,%esi
  8028e9:	bf 03 00 00 00       	mov    $0x3,%edi
  8028ee:	48 b8 11 27 80 00 00 	movabs $0x802711,%rax
  8028f5:	00 00 00 
  8028f8:	ff d0                	callq  *%rax
  8028fa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8028fd:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802901:	79 08                	jns    80290b <devfile_read+0x60>
  802903:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802906:	e9 a4 00 00 00       	jmpq   8029af <devfile_read+0x104>
  80290b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80290e:	48 98                	cltq   
  802910:	48 3b 45 d8          	cmp    -0x28(%rbp),%rax
  802914:	76 35                	jbe    80294b <devfile_read+0xa0>
  802916:	48 b9 76 4d 80 00 00 	movabs $0x804d76,%rcx
  80291d:	00 00 00 
  802920:	48 ba 7d 4d 80 00 00 	movabs $0x804d7d,%rdx
  802927:	00 00 00 
  80292a:	be 89 00 00 00       	mov    $0x89,%esi
  80292f:	48 bf 92 4d 80 00 00 	movabs $0x804d92,%rdi
  802936:	00 00 00 
  802939:	b8 00 00 00 00       	mov    $0x0,%eax
  80293e:	49 b8 54 3e 80 00 00 	movabs $0x803e54,%r8
  802945:	00 00 00 
  802948:	41 ff d0             	callq  *%r8
  80294b:	81 7d fc 00 10 00 00 	cmpl   $0x1000,-0x4(%rbp)
  802952:	7e 35                	jle    802989 <devfile_read+0xde>
  802954:	48 b9 a0 4d 80 00 00 	movabs $0x804da0,%rcx
  80295b:	00 00 00 
  80295e:	48 ba 7d 4d 80 00 00 	movabs $0x804d7d,%rdx
  802965:	00 00 00 
  802968:	be 8a 00 00 00       	mov    $0x8a,%esi
  80296d:	48 bf 92 4d 80 00 00 	movabs $0x804d92,%rdi
  802974:	00 00 00 
  802977:	b8 00 00 00 00       	mov    $0x0,%eax
  80297c:	49 b8 54 3e 80 00 00 	movabs $0x803e54,%r8
  802983:	00 00 00 
  802986:	41 ff d0             	callq  *%r8
  802989:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80298c:	48 63 d0             	movslq %eax,%rdx
  80298f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802993:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  80299a:	00 00 00 
  80299d:	48 89 c7             	mov    %rax,%rdi
  8029a0:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  8029a7:	00 00 00 
  8029aa:	ff d0                	callq  *%rax
  8029ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8029af:	c9                   	leaveq 
  8029b0:	c3                   	retq   

00000000008029b1 <devfile_write>:
  8029b1:	55                   	push   %rbp
  8029b2:	48 89 e5             	mov    %rsp,%rbp
  8029b5:	48 83 ec 40          	sub    $0x40,%rsp
  8029b9:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8029bd:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8029c1:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  8029c5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8029c9:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8029cd:	48 c7 45 f0 f4 0f 00 	movq   $0xff4,-0x10(%rbp)
  8029d4:	00 
  8029d5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8029d9:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
  8029dd:	48 0f 46 45 f8       	cmovbe -0x8(%rbp),%rax
  8029e2:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  8029e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8029ea:	8b 50 0c             	mov    0xc(%rax),%edx
  8029ed:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  8029f4:	00 00 00 
  8029f7:	89 10                	mov    %edx,(%rax)
  8029f9:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802a00:	00 00 00 
  802a03:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a07:	48 89 50 08          	mov    %rdx,0x8(%rax)
  802a0b:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  802a0f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  802a13:	48 89 c6             	mov    %rax,%rsi
  802a16:	48 bf 10 80 80 00 00 	movabs $0x808010,%rdi
  802a1d:	00 00 00 
  802a20:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  802a27:	00 00 00 
  802a2a:	ff d0                	callq  *%rax
  802a2c:	be 00 00 00 00       	mov    $0x0,%esi
  802a31:	bf 04 00 00 00       	mov    $0x4,%edi
  802a36:	48 b8 11 27 80 00 00 	movabs $0x802711,%rax
  802a3d:	00 00 00 
  802a40:	ff d0                	callq  *%rax
  802a42:	89 45 ec             	mov    %eax,-0x14(%rbp)
  802a45:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  802a49:	79 05                	jns    802a50 <devfile_write+0x9f>
  802a4b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a4e:	eb 43                	jmp    802a93 <devfile_write+0xe2>
  802a50:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a53:	48 98                	cltq   
  802a55:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  802a59:	76 35                	jbe    802a90 <devfile_write+0xdf>
  802a5b:	48 b9 76 4d 80 00 00 	movabs $0x804d76,%rcx
  802a62:	00 00 00 
  802a65:	48 ba 7d 4d 80 00 00 	movabs $0x804d7d,%rdx
  802a6c:	00 00 00 
  802a6f:	be a8 00 00 00       	mov    $0xa8,%esi
  802a74:	48 bf 92 4d 80 00 00 	movabs $0x804d92,%rdi
  802a7b:	00 00 00 
  802a7e:	b8 00 00 00 00       	mov    $0x0,%eax
  802a83:	49 b8 54 3e 80 00 00 	movabs $0x803e54,%r8
  802a8a:	00 00 00 
  802a8d:	41 ff d0             	callq  *%r8
  802a90:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802a93:	c9                   	leaveq 
  802a94:	c3                   	retq   

0000000000802a95 <devfile_stat>:
  802a95:	55                   	push   %rbp
  802a96:	48 89 e5             	mov    %rsp,%rbp
  802a99:	48 83 ec 20          	sub    $0x20,%rsp
  802a9d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  802aa1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802aa5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  802aa9:	8b 50 0c             	mov    0xc(%rax),%edx
  802aac:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802ab3:	00 00 00 
  802ab6:	89 10                	mov    %edx,(%rax)
  802ab8:	be 00 00 00 00       	mov    $0x0,%esi
  802abd:	bf 05 00 00 00       	mov    $0x5,%edi
  802ac2:	48 b8 11 27 80 00 00 	movabs $0x802711,%rax
  802ac9:	00 00 00 
  802acc:	ff d0                	callq  *%rax
  802ace:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ad1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802ad5:	79 05                	jns    802adc <devfile_stat+0x47>
  802ad7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802ada:	eb 56                	jmp    802b32 <devfile_stat+0x9d>
  802adc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802ae0:	48 be 00 80 80 00 00 	movabs $0x808000,%rsi
  802ae7:	00 00 00 
  802aea:	48 89 c7             	mov    %rax,%rdi
  802aed:	48 b8 7a 10 80 00 00 	movabs $0x80107a,%rax
  802af4:	00 00 00 
  802af7:	ff d0                	callq  *%rax
  802af9:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b00:	00 00 00 
  802b03:	8b 90 80 00 00 00    	mov    0x80(%rax),%edx
  802b09:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b0d:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  802b13:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b1a:	00 00 00 
  802b1d:	8b 90 84 00 00 00    	mov    0x84(%rax),%edx
  802b23:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  802b27:	89 90 84 00 00 00    	mov    %edx,0x84(%rax)
  802b2d:	b8 00 00 00 00       	mov    $0x0,%eax
  802b32:	c9                   	leaveq 
  802b33:	c3                   	retq   

0000000000802b34 <devfile_trunc>:
  802b34:	55                   	push   %rbp
  802b35:	48 89 e5             	mov    %rsp,%rbp
  802b38:	48 83 ec 10          	sub    $0x10,%rsp
  802b3c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b40:	89 75 f4             	mov    %esi,-0xc(%rbp)
  802b43:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b47:	8b 50 0c             	mov    0xc(%rax),%edx
  802b4a:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b51:	00 00 00 
  802b54:	89 10                	mov    %edx,(%rax)
  802b56:	48 b8 00 80 80 00 00 	movabs $0x808000,%rax
  802b5d:	00 00 00 
  802b60:	8b 55 f4             	mov    -0xc(%rbp),%edx
  802b63:	89 50 04             	mov    %edx,0x4(%rax)
  802b66:	be 00 00 00 00       	mov    $0x0,%esi
  802b6b:	bf 02 00 00 00       	mov    $0x2,%edi
  802b70:	48 b8 11 27 80 00 00 	movabs $0x802711,%rax
  802b77:	00 00 00 
  802b7a:	ff d0                	callq  *%rax
  802b7c:	c9                   	leaveq 
  802b7d:	c3                   	retq   

0000000000802b7e <remove>:
  802b7e:	55                   	push   %rbp
  802b7f:	48 89 e5             	mov    %rsp,%rbp
  802b82:	48 83 ec 10          	sub    $0x10,%rsp
  802b86:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802b8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802b8e:	48 89 c7             	mov    %rax,%rdi
  802b91:	48 b8 0e 10 80 00 00 	movabs $0x80100e,%rax
  802b98:	00 00 00 
  802b9b:	ff d0                	callq  *%rax
  802b9d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  802ba2:	7e 07                	jle    802bab <remove+0x2d>
  802ba4:	b8 f3 ff ff ff       	mov    $0xfffffff3,%eax
  802ba9:	eb 33                	jmp    802bde <remove+0x60>
  802bab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802baf:	48 89 c6             	mov    %rax,%rsi
  802bb2:	48 bf 00 80 80 00 00 	movabs $0x808000,%rdi
  802bb9:	00 00 00 
  802bbc:	48 b8 7a 10 80 00 00 	movabs $0x80107a,%rax
  802bc3:	00 00 00 
  802bc6:	ff d0                	callq  *%rax
  802bc8:	be 00 00 00 00       	mov    $0x0,%esi
  802bcd:	bf 07 00 00 00       	mov    $0x7,%edi
  802bd2:	48 b8 11 27 80 00 00 	movabs $0x802711,%rax
  802bd9:	00 00 00 
  802bdc:	ff d0                	callq  *%rax
  802bde:	c9                   	leaveq 
  802bdf:	c3                   	retq   

0000000000802be0 <sync>:
  802be0:	55                   	push   %rbp
  802be1:	48 89 e5             	mov    %rsp,%rbp
  802be4:	be 00 00 00 00       	mov    $0x0,%esi
  802be9:	bf 08 00 00 00       	mov    $0x8,%edi
  802bee:	48 b8 11 27 80 00 00 	movabs $0x802711,%rax
  802bf5:	00 00 00 
  802bf8:	ff d0                	callq  *%rax
  802bfa:	5d                   	pop    %rbp
  802bfb:	c3                   	retq   

0000000000802bfc <copy>:
  802bfc:	55                   	push   %rbp
  802bfd:	48 89 e5             	mov    %rsp,%rbp
  802c00:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
  802c07:	48 89 bd e8 fd ff ff 	mov    %rdi,-0x218(%rbp)
  802c0e:	48 89 b5 e0 fd ff ff 	mov    %rsi,-0x220(%rbp)
  802c15:	48 8b 85 e8 fd ff ff 	mov    -0x218(%rbp),%rax
  802c1c:	be 00 00 00 00       	mov    $0x0,%esi
  802c21:	48 89 c7             	mov    %rax,%rdi
  802c24:	48 b8 9a 27 80 00 00 	movabs $0x80279a,%rax
  802c2b:	00 00 00 
  802c2e:	ff d0                	callq  *%rax
  802c30:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802c33:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802c37:	79 28                	jns    802c61 <copy+0x65>
  802c39:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c3c:	89 c6                	mov    %eax,%esi
  802c3e:	48 bf ac 4d 80 00 00 	movabs $0x804dac,%rdi
  802c45:	00 00 00 
  802c48:	b8 00 00 00 00       	mov    $0x0,%eax
  802c4d:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  802c54:	00 00 00 
  802c57:	ff d2                	callq  *%rdx
  802c59:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802c5c:	e9 76 01 00 00       	jmpq   802dd7 <copy+0x1db>
  802c61:	48 8b 85 e0 fd ff ff 	mov    -0x220(%rbp),%rax
  802c68:	be 01 01 00 00       	mov    $0x101,%esi
  802c6d:	48 89 c7             	mov    %rax,%rdi
  802c70:	48 b8 9a 27 80 00 00 	movabs $0x80279a,%rax
  802c77:	00 00 00 
  802c7a:	ff d0                	callq  *%rax
  802c7c:	89 45 f8             	mov    %eax,-0x8(%rbp)
  802c7f:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
  802c83:	0f 89 ad 00 00 00    	jns    802d36 <copy+0x13a>
  802c89:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802c8c:	89 c6                	mov    %eax,%esi
  802c8e:	48 bf c2 4d 80 00 00 	movabs $0x804dc2,%rdi
  802c95:	00 00 00 
  802c98:	b8 00 00 00 00       	mov    $0x0,%eax
  802c9d:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  802ca4:	00 00 00 
  802ca7:	ff d2                	callq  *%rdx
  802ca9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802cac:	89 c7                	mov    %eax,%edi
  802cae:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  802cb5:	00 00 00 
  802cb8:	ff d0                	callq  *%rax
  802cba:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cbd:	e9 15 01 00 00       	jmpq   802dd7 <copy+0x1db>
  802cc2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802cc5:	48 63 d0             	movslq %eax,%rdx
  802cc8:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802ccf:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802cd2:	48 89 ce             	mov    %rcx,%rsi
  802cd5:	89 c7                	mov    %eax,%edi
  802cd7:	48 b8 0c 24 80 00 00 	movabs $0x80240c,%rax
  802cde:	00 00 00 
  802ce1:	ff d0                	callq  *%rax
  802ce3:	89 45 f0             	mov    %eax,-0x10(%rbp)
  802ce6:	83 7d f0 00          	cmpl   $0x0,-0x10(%rbp)
  802cea:	79 4a                	jns    802d36 <copy+0x13a>
  802cec:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802cef:	89 c6                	mov    %eax,%esi
  802cf1:	48 bf dc 4d 80 00 00 	movabs $0x804ddc,%rdi
  802cf8:	00 00 00 
  802cfb:	b8 00 00 00 00       	mov    $0x0,%eax
  802d00:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  802d07:	00 00 00 
  802d0a:	ff d2                	callq  *%rdx
  802d0c:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d0f:	89 c7                	mov    %eax,%edi
  802d11:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  802d18:	00 00 00 
  802d1b:	ff d0                	callq  *%rax
  802d1d:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d20:	89 c7                	mov    %eax,%edi
  802d22:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  802d29:	00 00 00 
  802d2c:	ff d0                	callq  *%rax
  802d2e:	8b 45 f0             	mov    -0x10(%rbp),%eax
  802d31:	e9 a1 00 00 00       	jmpq   802dd7 <copy+0x1db>
  802d36:	48 8d 8d f0 fd ff ff 	lea    -0x210(%rbp),%rcx
  802d3d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d40:	ba 00 02 00 00       	mov    $0x200,%edx
  802d45:	48 89 ce             	mov    %rcx,%rsi
  802d48:	89 c7                	mov    %eax,%edi
  802d4a:	48 b8 c1 22 80 00 00 	movabs $0x8022c1,%rax
  802d51:	00 00 00 
  802d54:	ff d0                	callq  *%rax
  802d56:	89 45 f4             	mov    %eax,-0xc(%rbp)
  802d59:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802d5d:	0f 8f 5f ff ff ff    	jg     802cc2 <copy+0xc6>
  802d63:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  802d67:	79 47                	jns    802db0 <copy+0x1b4>
  802d69:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802d6c:	89 c6                	mov    %eax,%esi
  802d6e:	48 bf ef 4d 80 00 00 	movabs $0x804def,%rdi
  802d75:	00 00 00 
  802d78:	b8 00 00 00 00       	mov    $0x0,%eax
  802d7d:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  802d84:	00 00 00 
  802d87:	ff d2                	callq  *%rdx
  802d89:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802d8c:	89 c7                	mov    %eax,%edi
  802d8e:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  802d95:	00 00 00 
  802d98:	ff d0                	callq  *%rax
  802d9a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802d9d:	89 c7                	mov    %eax,%edi
  802d9f:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  802da6:	00 00 00 
  802da9:	ff d0                	callq  *%rax
  802dab:	8b 45 f4             	mov    -0xc(%rbp),%eax
  802dae:	eb 27                	jmp    802dd7 <copy+0x1db>
  802db0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802db3:	89 c7                	mov    %eax,%edi
  802db5:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  802dbc:	00 00 00 
  802dbf:	ff d0                	callq  *%rax
  802dc1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  802dc4:	89 c7                	mov    %eax,%edi
  802dc6:	48 b8 9e 20 80 00 00 	movabs $0x80209e,%rax
  802dcd:	00 00 00 
  802dd0:	ff d0                	callq  *%rax
  802dd2:	b8 00 00 00 00       	mov    $0x0,%eax
  802dd7:	c9                   	leaveq 
  802dd8:	c3                   	retq   

0000000000802dd9 <fd2sockid>:
  802dd9:	55                   	push   %rbp
  802dda:	48 89 e5             	mov    %rsp,%rbp
  802ddd:	48 83 ec 20          	sub    $0x20,%rsp
  802de1:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802de4:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  802de8:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802deb:	48 89 d6             	mov    %rdx,%rsi
  802dee:	89 c7                	mov    %eax,%edi
  802df0:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  802df7:	00 00 00 
  802dfa:	ff d0                	callq  *%rax
  802dfc:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802dff:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e03:	79 05                	jns    802e0a <fd2sockid+0x31>
  802e05:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e08:	eb 24                	jmp    802e2e <fd2sockid+0x55>
  802e0a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e0e:	8b 10                	mov    (%rax),%edx
  802e10:	48 b8 a0 60 80 00 00 	movabs $0x8060a0,%rax
  802e17:	00 00 00 
  802e1a:	8b 00                	mov    (%rax),%eax
  802e1c:	39 c2                	cmp    %eax,%edx
  802e1e:	74 07                	je     802e27 <fd2sockid+0x4e>
  802e20:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  802e25:	eb 07                	jmp    802e2e <fd2sockid+0x55>
  802e27:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e2b:	8b 40 0c             	mov    0xc(%rax),%eax
  802e2e:	c9                   	leaveq 
  802e2f:	c3                   	retq   

0000000000802e30 <alloc_sockfd>:
  802e30:	55                   	push   %rbp
  802e31:	48 89 e5             	mov    %rsp,%rbp
  802e34:	48 83 ec 20          	sub    $0x20,%rsp
  802e38:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802e3b:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  802e3f:	48 89 c7             	mov    %rax,%rdi
  802e42:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  802e49:	00 00 00 
  802e4c:	ff d0                	callq  *%rax
  802e4e:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e51:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e55:	78 26                	js     802e7d <alloc_sockfd+0x4d>
  802e57:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e5b:	ba 07 04 00 00       	mov    $0x407,%edx
  802e60:	48 89 c6             	mov    %rax,%rsi
  802e63:	bf 00 00 00 00       	mov    $0x0,%edi
  802e68:	48 b8 aa 19 80 00 00 	movabs $0x8019aa,%rax
  802e6f:	00 00 00 
  802e72:	ff d0                	callq  *%rax
  802e74:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802e77:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802e7b:	79 16                	jns    802e93 <alloc_sockfd+0x63>
  802e7d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802e80:	89 c7                	mov    %eax,%edi
  802e82:	48 b8 3f 33 80 00 00 	movabs $0x80333f,%rax
  802e89:	00 00 00 
  802e8c:	ff d0                	callq  *%rax
  802e8e:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802e91:	eb 3a                	jmp    802ecd <alloc_sockfd+0x9d>
  802e93:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802e97:	48 ba a0 60 80 00 00 	movabs $0x8060a0,%rdx
  802e9e:	00 00 00 
  802ea1:	8b 12                	mov    (%rdx),%edx
  802ea3:	89 10                	mov    %edx,(%rax)
  802ea5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ea9:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  802eb0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802eb4:	8b 55 ec             	mov    -0x14(%rbp),%edx
  802eb7:	89 50 0c             	mov    %edx,0xc(%rax)
  802eba:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  802ebe:	48 89 c7             	mov    %rax,%rdi
  802ec1:	48 b8 a6 1d 80 00 00 	movabs $0x801da6,%rax
  802ec8:	00 00 00 
  802ecb:	ff d0                	callq  *%rax
  802ecd:	c9                   	leaveq 
  802ece:	c3                   	retq   

0000000000802ecf <accept>:
  802ecf:	55                   	push   %rbp
  802ed0:	48 89 e5             	mov    %rsp,%rbp
  802ed3:	48 83 ec 30          	sub    $0x30,%rsp
  802ed7:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802eda:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802ede:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  802ee2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802ee5:	89 c7                	mov    %eax,%edi
  802ee7:	48 b8 d9 2d 80 00 00 	movabs $0x802dd9,%rax
  802eee:	00 00 00 
  802ef1:	ff d0                	callq  *%rax
  802ef3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802ef6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802efa:	79 05                	jns    802f01 <accept+0x32>
  802efc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802eff:	eb 3b                	jmp    802f3c <accept+0x6d>
  802f01:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  802f05:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802f09:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f0c:	48 89 ce             	mov    %rcx,%rsi
  802f0f:	89 c7                	mov    %eax,%edi
  802f11:	48 b8 1c 32 80 00 00 	movabs $0x80321c,%rax
  802f18:	00 00 00 
  802f1b:	ff d0                	callq  *%rax
  802f1d:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f20:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f24:	79 05                	jns    802f2b <accept+0x5c>
  802f26:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f29:	eb 11                	jmp    802f3c <accept+0x6d>
  802f2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f2e:	89 c7                	mov    %eax,%edi
  802f30:	48 b8 30 2e 80 00 00 	movabs $0x802e30,%rax
  802f37:	00 00 00 
  802f3a:	ff d0                	callq  *%rax
  802f3c:	c9                   	leaveq 
  802f3d:	c3                   	retq   

0000000000802f3e <bind>:
  802f3e:	55                   	push   %rbp
  802f3f:	48 89 e5             	mov    %rsp,%rbp
  802f42:	48 83 ec 20          	sub    $0x20,%rsp
  802f46:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f49:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  802f4d:	89 55 e8             	mov    %edx,-0x18(%rbp)
  802f50:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f53:	89 c7                	mov    %eax,%edi
  802f55:	48 b8 d9 2d 80 00 00 	movabs $0x802dd9,%rax
  802f5c:	00 00 00 
  802f5f:	ff d0                	callq  *%rax
  802f61:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802f64:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802f68:	79 05                	jns    802f6f <bind+0x31>
  802f6a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f6d:	eb 1b                	jmp    802f8a <bind+0x4c>
  802f6f:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802f72:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  802f76:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802f79:	48 89 ce             	mov    %rcx,%rsi
  802f7c:	89 c7                	mov    %eax,%edi
  802f7e:	48 b8 9b 32 80 00 00 	movabs $0x80329b,%rax
  802f85:	00 00 00 
  802f88:	ff d0                	callq  *%rax
  802f8a:	c9                   	leaveq 
  802f8b:	c3                   	retq   

0000000000802f8c <shutdown>:
  802f8c:	55                   	push   %rbp
  802f8d:	48 89 e5             	mov    %rsp,%rbp
  802f90:	48 83 ec 20          	sub    $0x20,%rsp
  802f94:	89 7d ec             	mov    %edi,-0x14(%rbp)
  802f97:	89 75 e8             	mov    %esi,-0x18(%rbp)
  802f9a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  802f9d:	89 c7                	mov    %eax,%edi
  802f9f:	48 b8 d9 2d 80 00 00 	movabs $0x802dd9,%rax
  802fa6:	00 00 00 
  802fa9:	ff d0                	callq  *%rax
  802fab:	89 45 fc             	mov    %eax,-0x4(%rbp)
  802fae:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  802fb2:	79 05                	jns    802fb9 <shutdown+0x2d>
  802fb4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fb7:	eb 16                	jmp    802fcf <shutdown+0x43>
  802fb9:	8b 55 e8             	mov    -0x18(%rbp),%edx
  802fbc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  802fbf:	89 d6                	mov    %edx,%esi
  802fc1:	89 c7                	mov    %eax,%edi
  802fc3:	48 b8 ff 32 80 00 00 	movabs $0x8032ff,%rax
  802fca:	00 00 00 
  802fcd:	ff d0                	callq  *%rax
  802fcf:	c9                   	leaveq 
  802fd0:	c3                   	retq   

0000000000802fd1 <devsock_close>:
  802fd1:	55                   	push   %rbp
  802fd2:	48 89 e5             	mov    %rsp,%rbp
  802fd5:	48 83 ec 10          	sub    $0x10,%rsp
  802fd9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  802fdd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802fe1:	48 89 c7             	mov    %rax,%rdi
  802fe4:	48 b8 a4 41 80 00 00 	movabs $0x8041a4,%rax
  802feb:	00 00 00 
  802fee:	ff d0                	callq  *%rax
  802ff0:	83 f8 01             	cmp    $0x1,%eax
  802ff3:	75 17                	jne    80300c <devsock_close+0x3b>
  802ff5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  802ff9:	8b 40 0c             	mov    0xc(%rax),%eax
  802ffc:	89 c7                	mov    %eax,%edi
  802ffe:	48 b8 3f 33 80 00 00 	movabs $0x80333f,%rax
  803005:	00 00 00 
  803008:	ff d0                	callq  *%rax
  80300a:	eb 05                	jmp    803011 <devsock_close+0x40>
  80300c:	b8 00 00 00 00       	mov    $0x0,%eax
  803011:	c9                   	leaveq 
  803012:	c3                   	retq   

0000000000803013 <connect>:
  803013:	55                   	push   %rbp
  803014:	48 89 e5             	mov    %rsp,%rbp
  803017:	48 83 ec 20          	sub    $0x20,%rsp
  80301b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80301e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803022:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803025:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803028:	89 c7                	mov    %eax,%edi
  80302a:	48 b8 d9 2d 80 00 00 	movabs $0x802dd9,%rax
  803031:	00 00 00 
  803034:	ff d0                	callq  *%rax
  803036:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803039:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80303d:	79 05                	jns    803044 <connect+0x31>
  80303f:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803042:	eb 1b                	jmp    80305f <connect+0x4c>
  803044:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803047:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
  80304b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80304e:	48 89 ce             	mov    %rcx,%rsi
  803051:	89 c7                	mov    %eax,%edi
  803053:	48 b8 6c 33 80 00 00 	movabs $0x80336c,%rax
  80305a:	00 00 00 
  80305d:	ff d0                	callq  *%rax
  80305f:	c9                   	leaveq 
  803060:	c3                   	retq   

0000000000803061 <listen>:
  803061:	55                   	push   %rbp
  803062:	48 89 e5             	mov    %rsp,%rbp
  803065:	48 83 ec 20          	sub    $0x20,%rsp
  803069:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80306c:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80306f:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803072:	89 c7                	mov    %eax,%edi
  803074:	48 b8 d9 2d 80 00 00 	movabs $0x802dd9,%rax
  80307b:	00 00 00 
  80307e:	ff d0                	callq  *%rax
  803080:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803083:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803087:	79 05                	jns    80308e <listen+0x2d>
  803089:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80308c:	eb 16                	jmp    8030a4 <listen+0x43>
  80308e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803091:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803094:	89 d6                	mov    %edx,%esi
  803096:	89 c7                	mov    %eax,%edi
  803098:	48 b8 d0 33 80 00 00 	movabs $0x8033d0,%rax
  80309f:	00 00 00 
  8030a2:	ff d0                	callq  *%rax
  8030a4:	c9                   	leaveq 
  8030a5:	c3                   	retq   

00000000008030a6 <devsock_read>:
  8030a6:	55                   	push   %rbp
  8030a7:	48 89 e5             	mov    %rsp,%rbp
  8030aa:	48 83 ec 20          	sub    $0x20,%rsp
  8030ae:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030b2:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8030b6:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8030ba:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030be:	89 c2                	mov    %eax,%edx
  8030c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030c4:	8b 40 0c             	mov    0xc(%rax),%eax
  8030c7:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  8030cb:	b9 00 00 00 00       	mov    $0x0,%ecx
  8030d0:	89 c7                	mov    %eax,%edi
  8030d2:	48 b8 10 34 80 00 00 	movabs $0x803410,%rax
  8030d9:	00 00 00 
  8030dc:	ff d0                	callq  *%rax
  8030de:	c9                   	leaveq 
  8030df:	c3                   	retq   

00000000008030e0 <devsock_write>:
  8030e0:	55                   	push   %rbp
  8030e1:	48 89 e5             	mov    %rsp,%rbp
  8030e4:	48 83 ec 20          	sub    $0x20,%rsp
  8030e8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8030ec:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8030f0:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8030f4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8030f8:	89 c2                	mov    %eax,%edx
  8030fa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8030fe:	8b 40 0c             	mov    0xc(%rax),%eax
  803101:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  803105:	b9 00 00 00 00       	mov    $0x0,%ecx
  80310a:	89 c7                	mov    %eax,%edi
  80310c:	48 b8 dc 34 80 00 00 	movabs $0x8034dc,%rax
  803113:	00 00 00 
  803116:	ff d0                	callq  *%rax
  803118:	c9                   	leaveq 
  803119:	c3                   	retq   

000000000080311a <devsock_stat>:
  80311a:	55                   	push   %rbp
  80311b:	48 89 e5             	mov    %rsp,%rbp
  80311e:	48 83 ec 10          	sub    $0x10,%rsp
  803122:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803126:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80312a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80312e:	48 be 0a 4e 80 00 00 	movabs $0x804e0a,%rsi
  803135:	00 00 00 
  803138:	48 89 c7             	mov    %rax,%rdi
  80313b:	48 b8 7a 10 80 00 00 	movabs $0x80107a,%rax
  803142:	00 00 00 
  803145:	ff d0                	callq  *%rax
  803147:	b8 00 00 00 00       	mov    $0x0,%eax
  80314c:	c9                   	leaveq 
  80314d:	c3                   	retq   

000000000080314e <socket>:
  80314e:	55                   	push   %rbp
  80314f:	48 89 e5             	mov    %rsp,%rbp
  803152:	48 83 ec 20          	sub    $0x20,%rsp
  803156:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803159:	89 75 e8             	mov    %esi,-0x18(%rbp)
  80315c:	89 55 e4             	mov    %edx,-0x1c(%rbp)
  80315f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  803162:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  803165:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803168:	89 ce                	mov    %ecx,%esi
  80316a:	89 c7                	mov    %eax,%edi
  80316c:	48 b8 94 35 80 00 00 	movabs $0x803594,%rax
  803173:	00 00 00 
  803176:	ff d0                	callq  *%rax
  803178:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80317b:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80317f:	79 05                	jns    803186 <socket+0x38>
  803181:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803184:	eb 11                	jmp    803197 <socket+0x49>
  803186:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803189:	89 c7                	mov    %eax,%edi
  80318b:	48 b8 30 2e 80 00 00 	movabs $0x802e30,%rax
  803192:	00 00 00 
  803195:	ff d0                	callq  *%rax
  803197:	c9                   	leaveq 
  803198:	c3                   	retq   

0000000000803199 <nsipc>:
  803199:	55                   	push   %rbp
  80319a:	48 89 e5             	mov    %rsp,%rbp
  80319d:	48 83 ec 10          	sub    $0x10,%rsp
  8031a1:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8031a4:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8031ab:	00 00 00 
  8031ae:	8b 00                	mov    (%rax),%eax
  8031b0:	85 c0                	test   %eax,%eax
  8031b2:	75 1f                	jne    8031d3 <nsipc+0x3a>
  8031b4:	bf 02 00 00 00       	mov    $0x2,%edi
  8031b9:	48 b8 33 41 80 00 00 	movabs $0x804133,%rax
  8031c0:	00 00 00 
  8031c3:	ff d0                	callq  *%rax
  8031c5:	89 c2                	mov    %eax,%edx
  8031c7:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8031ce:	00 00 00 
  8031d1:	89 10                	mov    %edx,(%rax)
  8031d3:	48 b8 04 70 80 00 00 	movabs $0x807004,%rax
  8031da:	00 00 00 
  8031dd:	8b 00                	mov    (%rax),%eax
  8031df:	8b 75 fc             	mov    -0x4(%rbp),%esi
  8031e2:	b9 07 00 00 00       	mov    $0x7,%ecx
  8031e7:	48 ba 00 a0 80 00 00 	movabs $0x80a000,%rdx
  8031ee:	00 00 00 
  8031f1:	89 c7                	mov    %eax,%edi
  8031f3:	48 b8 29 40 80 00 00 	movabs $0x804029,%rax
  8031fa:	00 00 00 
  8031fd:	ff d0                	callq  *%rax
  8031ff:	ba 00 00 00 00       	mov    $0x0,%edx
  803204:	be 00 00 00 00       	mov    $0x0,%esi
  803209:	bf 00 00 00 00       	mov    $0x0,%edi
  80320e:	48 b8 68 3f 80 00 00 	movabs $0x803f68,%rax
  803215:	00 00 00 
  803218:	ff d0                	callq  *%rax
  80321a:	c9                   	leaveq 
  80321b:	c3                   	retq   

000000000080321c <nsipc_accept>:
  80321c:	55                   	push   %rbp
  80321d:	48 89 e5             	mov    %rsp,%rbp
  803220:	48 83 ec 30          	sub    $0x30,%rsp
  803224:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803227:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80322b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  80322f:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803236:	00 00 00 
  803239:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80323c:	89 10                	mov    %edx,(%rax)
  80323e:	bf 01 00 00 00       	mov    $0x1,%edi
  803243:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  80324a:	00 00 00 
  80324d:	ff d0                	callq  *%rax
  80324f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803252:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803256:	78 3e                	js     803296 <nsipc_accept+0x7a>
  803258:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80325f:	00 00 00 
  803262:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803266:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80326a:	8b 40 10             	mov    0x10(%rax),%eax
  80326d:	89 c2                	mov    %eax,%edx
  80326f:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
  803273:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803277:	48 89 ce             	mov    %rcx,%rsi
  80327a:	48 89 c7             	mov    %rax,%rdi
  80327d:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  803284:	00 00 00 
  803287:	ff d0                	callq  *%rax
  803289:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80328d:	8b 50 10             	mov    0x10(%rax),%edx
  803290:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803294:	89 10                	mov    %edx,(%rax)
  803296:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803299:	c9                   	leaveq 
  80329a:	c3                   	retq   

000000000080329b <nsipc_bind>:
  80329b:	55                   	push   %rbp
  80329c:	48 89 e5             	mov    %rsp,%rbp
  80329f:	48 83 ec 10          	sub    $0x10,%rsp
  8032a3:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8032a6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8032aa:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8032ad:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032b4:	00 00 00 
  8032b7:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8032ba:	89 10                	mov    %edx,(%rax)
  8032bc:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8032bf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8032c3:	48 89 c6             	mov    %rax,%rsi
  8032c6:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  8032cd:	00 00 00 
  8032d0:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  8032d7:	00 00 00 
  8032da:	ff d0                	callq  *%rax
  8032dc:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8032e3:	00 00 00 
  8032e6:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8032e9:	89 50 14             	mov    %edx,0x14(%rax)
  8032ec:	bf 02 00 00 00       	mov    $0x2,%edi
  8032f1:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  8032f8:	00 00 00 
  8032fb:	ff d0                	callq  *%rax
  8032fd:	c9                   	leaveq 
  8032fe:	c3                   	retq   

00000000008032ff <nsipc_shutdown>:
  8032ff:	55                   	push   %rbp
  803300:	48 89 e5             	mov    %rsp,%rbp
  803303:	48 83 ec 10          	sub    $0x10,%rsp
  803307:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80330a:	89 75 f8             	mov    %esi,-0x8(%rbp)
  80330d:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803314:	00 00 00 
  803317:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80331a:	89 10                	mov    %edx,(%rax)
  80331c:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803323:	00 00 00 
  803326:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803329:	89 50 04             	mov    %edx,0x4(%rax)
  80332c:	bf 03 00 00 00       	mov    $0x3,%edi
  803331:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  803338:	00 00 00 
  80333b:	ff d0                	callq  *%rax
  80333d:	c9                   	leaveq 
  80333e:	c3                   	retq   

000000000080333f <nsipc_close>:
  80333f:	55                   	push   %rbp
  803340:	48 89 e5             	mov    %rsp,%rbp
  803343:	48 83 ec 10          	sub    $0x10,%rsp
  803347:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80334a:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803351:	00 00 00 
  803354:	8b 55 fc             	mov    -0x4(%rbp),%edx
  803357:	89 10                	mov    %edx,(%rax)
  803359:	bf 04 00 00 00       	mov    $0x4,%edi
  80335e:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  803365:	00 00 00 
  803368:	ff d0                	callq  *%rax
  80336a:	c9                   	leaveq 
  80336b:	c3                   	retq   

000000000080336c <nsipc_connect>:
  80336c:	55                   	push   %rbp
  80336d:	48 89 e5             	mov    %rsp,%rbp
  803370:	48 83 ec 10          	sub    $0x10,%rsp
  803374:	89 7d fc             	mov    %edi,-0x4(%rbp)
  803377:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  80337b:	89 55 f8             	mov    %edx,-0x8(%rbp)
  80337e:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803385:	00 00 00 
  803388:	8b 55 fc             	mov    -0x4(%rbp),%edx
  80338b:	89 10                	mov    %edx,(%rax)
  80338d:	8b 55 f8             	mov    -0x8(%rbp),%edx
  803390:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803394:	48 89 c6             	mov    %rax,%rsi
  803397:	48 bf 04 a0 80 00 00 	movabs $0x80a004,%rdi
  80339e:	00 00 00 
  8033a1:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  8033a8:	00 00 00 
  8033ab:	ff d0                	callq  *%rax
  8033ad:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033b4:	00 00 00 
  8033b7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033ba:	89 50 14             	mov    %edx,0x14(%rax)
  8033bd:	bf 05 00 00 00       	mov    $0x5,%edi
  8033c2:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  8033c9:	00 00 00 
  8033cc:	ff d0                	callq  *%rax
  8033ce:	c9                   	leaveq 
  8033cf:	c3                   	retq   

00000000008033d0 <nsipc_listen>:
  8033d0:	55                   	push   %rbp
  8033d1:	48 89 e5             	mov    %rsp,%rbp
  8033d4:	48 83 ec 10          	sub    $0x10,%rsp
  8033d8:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8033db:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8033de:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033e5:	00 00 00 
  8033e8:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8033eb:	89 10                	mov    %edx,(%rax)
  8033ed:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8033f4:	00 00 00 
  8033f7:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8033fa:	89 50 04             	mov    %edx,0x4(%rax)
  8033fd:	bf 06 00 00 00       	mov    $0x6,%edi
  803402:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  803409:	00 00 00 
  80340c:	ff d0                	callq  *%rax
  80340e:	c9                   	leaveq 
  80340f:	c3                   	retq   

0000000000803410 <nsipc_recv>:
  803410:	55                   	push   %rbp
  803411:	48 89 e5             	mov    %rsp,%rbp
  803414:	48 83 ec 30          	sub    $0x30,%rsp
  803418:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80341b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  80341f:	89 55 e8             	mov    %edx,-0x18(%rbp)
  803422:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  803425:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80342c:	00 00 00 
  80342f:	8b 55 ec             	mov    -0x14(%rbp),%edx
  803432:	89 10                	mov    %edx,(%rax)
  803434:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80343b:	00 00 00 
  80343e:	8b 55 e8             	mov    -0x18(%rbp),%edx
  803441:	89 50 04             	mov    %edx,0x4(%rax)
  803444:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  80344b:	00 00 00 
  80344e:	8b 55 dc             	mov    -0x24(%rbp),%edx
  803451:	89 50 08             	mov    %edx,0x8(%rax)
  803454:	bf 07 00 00 00       	mov    $0x7,%edi
  803459:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  803460:	00 00 00 
  803463:	ff d0                	callq  *%rax
  803465:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803468:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  80346c:	78 69                	js     8034d7 <nsipc_recv+0xc7>
  80346e:	81 7d fc 3f 06 00 00 	cmpl   $0x63f,-0x4(%rbp)
  803475:	7f 08                	jg     80347f <nsipc_recv+0x6f>
  803477:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80347a:	3b 45 e8             	cmp    -0x18(%rbp),%eax
  80347d:	7e 35                	jle    8034b4 <nsipc_recv+0xa4>
  80347f:	48 b9 11 4e 80 00 00 	movabs $0x804e11,%rcx
  803486:	00 00 00 
  803489:	48 ba 26 4e 80 00 00 	movabs $0x804e26,%rdx
  803490:	00 00 00 
  803493:	be 62 00 00 00       	mov    $0x62,%esi
  803498:	48 bf 3b 4e 80 00 00 	movabs $0x804e3b,%rdi
  80349f:	00 00 00 
  8034a2:	b8 00 00 00 00       	mov    $0x0,%eax
  8034a7:	49 b8 54 3e 80 00 00 	movabs $0x803e54,%r8
  8034ae:	00 00 00 
  8034b1:	41 ff d0             	callq  *%r8
  8034b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034b7:	48 63 d0             	movslq %eax,%rdx
  8034ba:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8034be:	48 be 00 a0 80 00 00 	movabs $0x80a000,%rsi
  8034c5:	00 00 00 
  8034c8:	48 89 c7             	mov    %rax,%rdi
  8034cb:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  8034d2:	00 00 00 
  8034d5:	ff d0                	callq  *%rax
  8034d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8034da:	c9                   	leaveq 
  8034db:	c3                   	retq   

00000000008034dc <nsipc_send>:
  8034dc:	55                   	push   %rbp
  8034dd:	48 89 e5             	mov    %rsp,%rbp
  8034e0:	48 83 ec 20          	sub    $0x20,%rsp
  8034e4:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8034e7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  8034eb:	89 55 f8             	mov    %edx,-0x8(%rbp)
  8034ee:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  8034f1:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8034f8:	00 00 00 
  8034fb:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8034fe:	89 10                	mov    %edx,(%rax)
  803500:	81 7d f8 3f 06 00 00 	cmpl   $0x63f,-0x8(%rbp)
  803507:	7e 35                	jle    80353e <nsipc_send+0x62>
  803509:	48 b9 4a 4e 80 00 00 	movabs $0x804e4a,%rcx
  803510:	00 00 00 
  803513:	48 ba 26 4e 80 00 00 	movabs $0x804e26,%rdx
  80351a:	00 00 00 
  80351d:	be 6d 00 00 00       	mov    $0x6d,%esi
  803522:	48 bf 3b 4e 80 00 00 	movabs $0x804e3b,%rdi
  803529:	00 00 00 
  80352c:	b8 00 00 00 00       	mov    $0x0,%eax
  803531:	49 b8 54 3e 80 00 00 	movabs $0x803e54,%r8
  803538:	00 00 00 
  80353b:	41 ff d0             	callq  *%r8
  80353e:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803541:	48 63 d0             	movslq %eax,%rdx
  803544:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803548:	48 89 c6             	mov    %rax,%rsi
  80354b:	48 bf 0c a0 80 00 00 	movabs $0x80a00c,%rdi
  803552:	00 00 00 
  803555:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  80355c:	00 00 00 
  80355f:	ff d0                	callq  *%rax
  803561:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803568:	00 00 00 
  80356b:	8b 55 f8             	mov    -0x8(%rbp),%edx
  80356e:	89 50 04             	mov    %edx,0x4(%rax)
  803571:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  803578:	00 00 00 
  80357b:	8b 55 ec             	mov    -0x14(%rbp),%edx
  80357e:	89 50 08             	mov    %edx,0x8(%rax)
  803581:	bf 08 00 00 00       	mov    $0x8,%edi
  803586:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  80358d:	00 00 00 
  803590:	ff d0                	callq  *%rax
  803592:	c9                   	leaveq 
  803593:	c3                   	retq   

0000000000803594 <nsipc_socket>:
  803594:	55                   	push   %rbp
  803595:	48 89 e5             	mov    %rsp,%rbp
  803598:	48 83 ec 10          	sub    $0x10,%rsp
  80359c:	89 7d fc             	mov    %edi,-0x4(%rbp)
  80359f:	89 75 f8             	mov    %esi,-0x8(%rbp)
  8035a2:	89 55 f4             	mov    %edx,-0xc(%rbp)
  8035a5:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035ac:	00 00 00 
  8035af:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8035b2:	89 10                	mov    %edx,(%rax)
  8035b4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035bb:	00 00 00 
  8035be:	8b 55 f8             	mov    -0x8(%rbp),%edx
  8035c1:	89 50 04             	mov    %edx,0x4(%rax)
  8035c4:	48 b8 00 a0 80 00 00 	movabs $0x80a000,%rax
  8035cb:	00 00 00 
  8035ce:	8b 55 f4             	mov    -0xc(%rbp),%edx
  8035d1:	89 50 08             	mov    %edx,0x8(%rax)
  8035d4:	bf 09 00 00 00       	mov    $0x9,%edi
  8035d9:	48 b8 99 31 80 00 00 	movabs $0x803199,%rax
  8035e0:	00 00 00 
  8035e3:	ff d0                	callq  *%rax
  8035e5:	c9                   	leaveq 
  8035e6:	c3                   	retq   

00000000008035e7 <pipe>:
  8035e7:	55                   	push   %rbp
  8035e8:	48 89 e5             	mov    %rsp,%rbp
  8035eb:	53                   	push   %rbx
  8035ec:	48 83 ec 38          	sub    $0x38,%rsp
  8035f0:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  8035f4:	48 8d 45 d8          	lea    -0x28(%rbp),%rax
  8035f8:	48 89 c7             	mov    %rax,%rdi
  8035fb:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  803602:	00 00 00 
  803605:	ff d0                	callq  *%rax
  803607:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80360a:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80360e:	0f 88 bf 01 00 00    	js     8037d3 <pipe+0x1ec>
  803614:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803618:	ba 07 04 00 00       	mov    $0x407,%edx
  80361d:	48 89 c6             	mov    %rax,%rsi
  803620:	bf 00 00 00 00       	mov    $0x0,%edi
  803625:	48 b8 aa 19 80 00 00 	movabs $0x8019aa,%rax
  80362c:	00 00 00 
  80362f:	ff d0                	callq  *%rax
  803631:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803634:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803638:	0f 88 95 01 00 00    	js     8037d3 <pipe+0x1ec>
  80363e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  803642:	48 89 c7             	mov    %rax,%rdi
  803645:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  80364c:	00 00 00 
  80364f:	ff d0                	callq  *%rax
  803651:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803654:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803658:	0f 88 5d 01 00 00    	js     8037bb <pipe+0x1d4>
  80365e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803662:	ba 07 04 00 00       	mov    $0x407,%edx
  803667:	48 89 c6             	mov    %rax,%rsi
  80366a:	bf 00 00 00 00       	mov    $0x0,%edi
  80366f:	48 b8 aa 19 80 00 00 	movabs $0x8019aa,%rax
  803676:	00 00 00 
  803679:	ff d0                	callq  *%rax
  80367b:	89 45 ec             	mov    %eax,-0x14(%rbp)
  80367e:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  803682:	0f 88 33 01 00 00    	js     8037bb <pipe+0x1d4>
  803688:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80368c:	48 89 c7             	mov    %rax,%rdi
  80368f:	48 b8 c9 1d 80 00 00 	movabs $0x801dc9,%rax
  803696:	00 00 00 
  803699:	ff d0                	callq  *%rax
  80369b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  80369f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036a3:	ba 07 04 00 00       	mov    $0x407,%edx
  8036a8:	48 89 c6             	mov    %rax,%rsi
  8036ab:	bf 00 00 00 00       	mov    $0x0,%edi
  8036b0:	48 b8 aa 19 80 00 00 	movabs $0x8019aa,%rax
  8036b7:	00 00 00 
  8036ba:	ff d0                	callq  *%rax
  8036bc:	89 45 ec             	mov    %eax,-0x14(%rbp)
  8036bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  8036c3:	0f 88 d9 00 00 00    	js     8037a2 <pipe+0x1bb>
  8036c9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8036cd:	48 89 c7             	mov    %rax,%rdi
  8036d0:	48 b8 c9 1d 80 00 00 	movabs $0x801dc9,%rax
  8036d7:	00 00 00 
  8036da:	ff d0                	callq  *%rax
  8036dc:	48 89 c2             	mov    %rax,%rdx
  8036df:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  8036e3:	41 b8 07 04 00 00    	mov    $0x407,%r8d
  8036e9:	48 89 d1             	mov    %rdx,%rcx
  8036ec:	ba 00 00 00 00       	mov    $0x0,%edx
  8036f1:	48 89 c6             	mov    %rax,%rsi
  8036f4:	bf 00 00 00 00       	mov    $0x0,%edi
  8036f9:	48 b8 fc 19 80 00 00 	movabs $0x8019fc,%rax
  803700:	00 00 00 
  803703:	ff d0                	callq  *%rax
  803705:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803708:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
  80370c:	78 79                	js     803787 <pipe+0x1a0>
  80370e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803712:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803719:	00 00 00 
  80371c:	8b 12                	mov    (%rdx),%edx
  80371e:	89 10                	mov    %edx,(%rax)
  803720:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803724:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
  80372b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80372f:	48 ba e0 60 80 00 00 	movabs $0x8060e0,%rdx
  803736:	00 00 00 
  803739:	8b 12                	mov    (%rdx),%edx
  80373b:	89 10                	mov    %edx,(%rax)
  80373d:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803741:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%rax)
  803748:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  80374c:	48 89 c7             	mov    %rax,%rdi
  80374f:	48 b8 a6 1d 80 00 00 	movabs $0x801da6,%rax
  803756:	00 00 00 
  803759:	ff d0                	callq  *%rax
  80375b:	89 c2                	mov    %eax,%edx
  80375d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803761:	89 10                	mov    %edx,(%rax)
  803763:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  803767:	48 8d 58 04          	lea    0x4(%rax),%rbx
  80376b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80376f:	48 89 c7             	mov    %rax,%rdi
  803772:	48 b8 a6 1d 80 00 00 	movabs $0x801da6,%rax
  803779:	00 00 00 
  80377c:	ff d0                	callq  *%rax
  80377e:	89 03                	mov    %eax,(%rbx)
  803780:	b8 00 00 00 00       	mov    $0x0,%eax
  803785:	eb 4f                	jmp    8037d6 <pipe+0x1ef>
  803787:	90                   	nop
  803788:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  80378c:	48 89 c6             	mov    %rax,%rsi
  80378f:	bf 00 00 00 00       	mov    $0x0,%edi
  803794:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  80379b:	00 00 00 
  80379e:	ff d0                	callq  *%rax
  8037a0:	eb 01                	jmp    8037a3 <pipe+0x1bc>
  8037a2:	90                   	nop
  8037a3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  8037a7:	48 89 c6             	mov    %rax,%rsi
  8037aa:	bf 00 00 00 00       	mov    $0x0,%edi
  8037af:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  8037b6:	00 00 00 
  8037b9:	ff d0                	callq  *%rax
  8037bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  8037bf:	48 89 c6             	mov    %rax,%rsi
  8037c2:	bf 00 00 00 00       	mov    $0x0,%edi
  8037c7:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  8037ce:	00 00 00 
  8037d1:	ff d0                	callq  *%rax
  8037d3:	8b 45 ec             	mov    -0x14(%rbp),%eax
  8037d6:	48 83 c4 38          	add    $0x38,%rsp
  8037da:	5b                   	pop    %rbx
  8037db:	5d                   	pop    %rbp
  8037dc:	c3                   	retq   

00000000008037dd <_pipeisclosed>:
  8037dd:	55                   	push   %rbp
  8037de:	48 89 e5             	mov    %rsp,%rbp
  8037e1:	53                   	push   %rbx
  8037e2:	48 83 ec 28          	sub    $0x28,%rsp
  8037e6:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8037ea:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8037ee:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  8037f5:	00 00 00 
  8037f8:	48 8b 00             	mov    (%rax),%rax
  8037fb:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  803801:	89 45 ec             	mov    %eax,-0x14(%rbp)
  803804:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803808:	48 89 c7             	mov    %rax,%rdi
  80380b:	48 b8 a4 41 80 00 00 	movabs $0x8041a4,%rax
  803812:	00 00 00 
  803815:	ff d0                	callq  *%rax
  803817:	89 c3                	mov    %eax,%ebx
  803819:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80381d:	48 89 c7             	mov    %rax,%rdi
  803820:	48 b8 a4 41 80 00 00 	movabs $0x8041a4,%rax
  803827:	00 00 00 
  80382a:	ff d0                	callq  *%rax
  80382c:	39 c3                	cmp    %eax,%ebx
  80382e:	0f 94 c0             	sete   %al
  803831:	0f b6 c0             	movzbl %al,%eax
  803834:	89 45 e8             	mov    %eax,-0x18(%rbp)
  803837:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80383e:	00 00 00 
  803841:	48 8b 00             	mov    (%rax),%rax
  803844:	8b 80 d8 00 00 00    	mov    0xd8(%rax),%eax
  80384a:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  80384d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803850:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803853:	75 05                	jne    80385a <_pipeisclosed+0x7d>
  803855:	8b 45 e8             	mov    -0x18(%rbp),%eax
  803858:	eb 4a                	jmp    8038a4 <_pipeisclosed+0xc7>
  80385a:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80385d:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
  803860:	74 8c                	je     8037ee <_pipeisclosed+0x11>
  803862:	83 7d e8 01          	cmpl   $0x1,-0x18(%rbp)
  803866:	75 86                	jne    8037ee <_pipeisclosed+0x11>
  803868:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80386f:	00 00 00 
  803872:	48 8b 00             	mov    (%rax),%rax
  803875:	8b 90 d8 00 00 00    	mov    0xd8(%rax),%edx
  80387b:	8b 4d e8             	mov    -0x18(%rbp),%ecx
  80387e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803881:	89 c6                	mov    %eax,%esi
  803883:	48 bf 5b 4e 80 00 00 	movabs $0x804e5b,%rdi
  80388a:	00 00 00 
  80388d:	b8 00 00 00 00       	mov    $0x0,%eax
  803892:	49 b8 ea 04 80 00 00 	movabs $0x8004ea,%r8
  803899:	00 00 00 
  80389c:	41 ff d0             	callq  *%r8
  80389f:	e9 4a ff ff ff       	jmpq   8037ee <_pipeisclosed+0x11>
  8038a4:	48 83 c4 28          	add    $0x28,%rsp
  8038a8:	5b                   	pop    %rbx
  8038a9:	5d                   	pop    %rbp
  8038aa:	c3                   	retq   

00000000008038ab <pipeisclosed>:
  8038ab:	55                   	push   %rbp
  8038ac:	48 89 e5             	mov    %rsp,%rbp
  8038af:	48 83 ec 30          	sub    $0x30,%rsp
  8038b3:	89 7d dc             	mov    %edi,-0x24(%rbp)
  8038b6:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
  8038ba:	8b 45 dc             	mov    -0x24(%rbp),%eax
  8038bd:	48 89 d6             	mov    %rdx,%rsi
  8038c0:	89 c7                	mov    %eax,%edi
  8038c2:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  8038c9:	00 00 00 
  8038cc:	ff d0                	callq  *%rax
  8038ce:	89 45 fc             	mov    %eax,-0x4(%rbp)
  8038d1:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  8038d5:	79 05                	jns    8038dc <pipeisclosed+0x31>
  8038d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8038da:	eb 31                	jmp    80390d <pipeisclosed+0x62>
  8038dc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038e0:	48 89 c7             	mov    %rax,%rdi
  8038e3:	48 b8 c9 1d 80 00 00 	movabs $0x801dc9,%rax
  8038ea:	00 00 00 
  8038ed:	ff d0                	callq  *%rax
  8038ef:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  8038f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8038f7:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8038fb:	48 89 d6             	mov    %rdx,%rsi
  8038fe:	48 89 c7             	mov    %rax,%rdi
  803901:	48 b8 dd 37 80 00 00 	movabs $0x8037dd,%rax
  803908:	00 00 00 
  80390b:	ff d0                	callq  *%rax
  80390d:	c9                   	leaveq 
  80390e:	c3                   	retq   

000000000080390f <devpipe_read>:
  80390f:	55                   	push   %rbp
  803910:	48 89 e5             	mov    %rsp,%rbp
  803913:	48 83 ec 40          	sub    $0x40,%rsp
  803917:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  80391b:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  80391f:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803923:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803927:	48 89 c7             	mov    %rax,%rdi
  80392a:	48 b8 c9 1d 80 00 00 	movabs $0x801dc9,%rax
  803931:	00 00 00 
  803934:	ff d0                	callq  *%rax
  803936:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  80393a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  80393e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803942:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803949:	00 
  80394a:	e9 90 00 00 00       	jmpq   8039df <devpipe_read+0xd0>
  80394f:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  803954:	74 09                	je     80395f <devpipe_read+0x50>
  803956:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80395a:	e9 8e 00 00 00       	jmpq   8039ed <devpipe_read+0xde>
  80395f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803963:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803967:	48 89 d6             	mov    %rdx,%rsi
  80396a:	48 89 c7             	mov    %rax,%rdi
  80396d:	48 b8 dd 37 80 00 00 	movabs $0x8037dd,%rax
  803974:	00 00 00 
  803977:	ff d0                	callq  *%rax
  803979:	85 c0                	test   %eax,%eax
  80397b:	74 07                	je     803984 <devpipe_read+0x75>
  80397d:	b8 00 00 00 00       	mov    $0x0,%eax
  803982:	eb 69                	jmp    8039ed <devpipe_read+0xde>
  803984:	48 b8 6d 19 80 00 00 	movabs $0x80196d,%rax
  80398b:	00 00 00 
  80398e:	ff d0                	callq  *%rax
  803990:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803994:	8b 10                	mov    (%rax),%edx
  803996:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  80399a:	8b 40 04             	mov    0x4(%rax),%eax
  80399d:	39 c2                	cmp    %eax,%edx
  80399f:	74 ae                	je     80394f <devpipe_read+0x40>
  8039a1:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  8039a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039a9:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
  8039ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039b1:	8b 00                	mov    (%rax),%eax
  8039b3:	99                   	cltd   
  8039b4:	c1 ea 1b             	shr    $0x1b,%edx
  8039b7:	01 d0                	add    %edx,%eax
  8039b9:	83 e0 1f             	and    $0x1f,%eax
  8039bc:	29 d0                	sub    %edx,%eax
  8039be:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8039c2:	48 98                	cltq   
  8039c4:	0f b6 44 02 08       	movzbl 0x8(%rdx,%rax,1),%eax
  8039c9:	88 01                	mov    %al,(%rcx)
  8039cb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039cf:	8b 00                	mov    (%rax),%eax
  8039d1:	8d 50 01             	lea    0x1(%rax),%edx
  8039d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8039d8:	89 10                	mov    %edx,(%rax)
  8039da:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  8039df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039e3:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  8039e7:	72 a7                	jb     803990 <devpipe_read+0x81>
  8039e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8039ed:	c9                   	leaveq 
  8039ee:	c3                   	retq   

00000000008039ef <devpipe_write>:
  8039ef:	55                   	push   %rbp
  8039f0:	48 89 e5             	mov    %rsp,%rbp
  8039f3:	48 83 ec 40          	sub    $0x40,%rsp
  8039f7:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  8039fb:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  8039ff:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  803a03:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a07:	48 89 c7             	mov    %rax,%rdi
  803a0a:	48 b8 c9 1d 80 00 00 	movabs $0x801dc9,%rax
  803a11:	00 00 00 
  803a14:	ff d0                	callq  *%rax
  803a16:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  803a1a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  803a1e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  803a22:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  803a29:	00 
  803a2a:	e9 8f 00 00 00       	jmpq   803abe <devpipe_write+0xcf>
  803a2f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803a33:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803a37:	48 89 d6             	mov    %rdx,%rsi
  803a3a:	48 89 c7             	mov    %rax,%rdi
  803a3d:	48 b8 dd 37 80 00 00 	movabs $0x8037dd,%rax
  803a44:	00 00 00 
  803a47:	ff d0                	callq  *%rax
  803a49:	85 c0                	test   %eax,%eax
  803a4b:	74 07                	je     803a54 <devpipe_write+0x65>
  803a4d:	b8 00 00 00 00       	mov    $0x0,%eax
  803a52:	eb 78                	jmp    803acc <devpipe_write+0xdd>
  803a54:	48 b8 6d 19 80 00 00 	movabs $0x80196d,%rax
  803a5b:	00 00 00 
  803a5e:	ff d0                	callq  *%rax
  803a60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a64:	8b 40 04             	mov    0x4(%rax),%eax
  803a67:	48 63 d0             	movslq %eax,%rdx
  803a6a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a6e:	8b 00                	mov    (%rax),%eax
  803a70:	48 98                	cltq   
  803a72:	48 83 c0 20          	add    $0x20,%rax
  803a76:	48 39 c2             	cmp    %rax,%rdx
  803a79:	73 b4                	jae    803a2f <devpipe_write+0x40>
  803a7b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803a7f:	8b 40 04             	mov    0x4(%rax),%eax
  803a82:	99                   	cltd   
  803a83:	c1 ea 1b             	shr    $0x1b,%edx
  803a86:	01 d0                	add    %edx,%eax
  803a88:	83 e0 1f             	and    $0x1f,%eax
  803a8b:	29 d0                	sub    %edx,%eax
  803a8d:	89 c6                	mov    %eax,%esi
  803a8f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  803a93:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803a97:	48 01 d0             	add    %rdx,%rax
  803a9a:	0f b6 08             	movzbl (%rax),%ecx
  803a9d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  803aa1:	48 63 c6             	movslq %esi,%rax
  803aa4:	88 4c 02 08          	mov    %cl,0x8(%rdx,%rax,1)
  803aa8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803aac:	8b 40 04             	mov    0x4(%rax),%eax
  803aaf:	8d 50 01             	lea    0x1(%rax),%edx
  803ab2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803ab6:	89 50 04             	mov    %edx,0x4(%rax)
  803ab9:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
  803abe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803ac2:	48 3b 45 c8          	cmp    -0x38(%rbp),%rax
  803ac6:	72 98                	jb     803a60 <devpipe_write+0x71>
  803ac8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803acc:	c9                   	leaveq 
  803acd:	c3                   	retq   

0000000000803ace <devpipe_stat>:
  803ace:	55                   	push   %rbp
  803acf:	48 89 e5             	mov    %rsp,%rbp
  803ad2:	48 83 ec 20          	sub    $0x20,%rsp
  803ad6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803ada:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803ade:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ae2:	48 89 c7             	mov    %rax,%rdi
  803ae5:	48 b8 c9 1d 80 00 00 	movabs $0x801dc9,%rax
  803aec:	00 00 00 
  803aef:	ff d0                	callq  *%rax
  803af1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  803af5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803af9:	48 be 6e 4e 80 00 00 	movabs $0x804e6e,%rsi
  803b00:	00 00 00 
  803b03:	48 89 c7             	mov    %rax,%rdi
  803b06:	48 b8 7a 10 80 00 00 	movabs $0x80107a,%rax
  803b0d:	00 00 00 
  803b10:	ff d0                	callq  *%rax
  803b12:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b16:	8b 50 04             	mov    0x4(%rax),%edx
  803b19:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b1d:	8b 00                	mov    (%rax),%eax
  803b1f:	29 c2                	sub    %eax,%edx
  803b21:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b25:	89 90 80 00 00 00    	mov    %edx,0x80(%rax)
  803b2b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b2f:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%rax)
  803b36:	00 00 00 
  803b39:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803b3d:	48 b9 e0 60 80 00 00 	movabs $0x8060e0,%rcx
  803b44:	00 00 00 
  803b47:	48 89 88 88 00 00 00 	mov    %rcx,0x88(%rax)
  803b4e:	b8 00 00 00 00       	mov    $0x0,%eax
  803b53:	c9                   	leaveq 
  803b54:	c3                   	retq   

0000000000803b55 <devpipe_close>:
  803b55:	55                   	push   %rbp
  803b56:	48 89 e5             	mov    %rsp,%rbp
  803b59:	48 83 ec 10          	sub    $0x10,%rsp
  803b5d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803b61:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b65:	48 89 c6             	mov    %rax,%rsi
  803b68:	bf 00 00 00 00       	mov    $0x0,%edi
  803b6d:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  803b74:	00 00 00 
  803b77:	ff d0                	callq  *%rax
  803b79:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  803b7d:	48 89 c7             	mov    %rax,%rdi
  803b80:	48 b8 c9 1d 80 00 00 	movabs $0x801dc9,%rax
  803b87:	00 00 00 
  803b8a:	ff d0                	callq  *%rax
  803b8c:	48 89 c6             	mov    %rax,%rsi
  803b8f:	bf 00 00 00 00       	mov    $0x0,%edi
  803b94:	48 b8 5c 1a 80 00 00 	movabs $0x801a5c,%rax
  803b9b:	00 00 00 
  803b9e:	ff d0                	callq  *%rax
  803ba0:	c9                   	leaveq 
  803ba1:	c3                   	retq   

0000000000803ba2 <cputchar>:
  803ba2:	55                   	push   %rbp
  803ba3:	48 89 e5             	mov    %rsp,%rbp
  803ba6:	48 83 ec 20          	sub    $0x20,%rsp
  803baa:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803bad:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803bb0:	88 45 ff             	mov    %al,-0x1(%rbp)
  803bb3:	48 8d 45 ff          	lea    -0x1(%rbp),%rax
  803bb7:	be 01 00 00 00       	mov    $0x1,%esi
  803bbc:	48 89 c7             	mov    %rax,%rdi
  803bbf:	48 b8 62 18 80 00 00 	movabs $0x801862,%rax
  803bc6:	00 00 00 
  803bc9:	ff d0                	callq  *%rax
  803bcb:	90                   	nop
  803bcc:	c9                   	leaveq 
  803bcd:	c3                   	retq   

0000000000803bce <getchar>:
  803bce:	55                   	push   %rbp
  803bcf:	48 89 e5             	mov    %rsp,%rbp
  803bd2:	48 83 ec 10          	sub    $0x10,%rsp
  803bd6:	48 8d 45 fb          	lea    -0x5(%rbp),%rax
  803bda:	ba 01 00 00 00       	mov    $0x1,%edx
  803bdf:	48 89 c6             	mov    %rax,%rsi
  803be2:	bf 00 00 00 00       	mov    $0x0,%edi
  803be7:	48 b8 c1 22 80 00 00 	movabs $0x8022c1,%rax
  803bee:	00 00 00 
  803bf1:	ff d0                	callq  *%rax
  803bf3:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803bf6:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803bfa:	79 05                	jns    803c01 <getchar+0x33>
  803bfc:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803bff:	eb 14                	jmp    803c15 <getchar+0x47>
  803c01:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c05:	7f 07                	jg     803c0e <getchar+0x40>
  803c07:	b8 f7 ff ff ff       	mov    $0xfffffff7,%eax
  803c0c:	eb 07                	jmp    803c15 <getchar+0x47>
  803c0e:	0f b6 45 fb          	movzbl -0x5(%rbp),%eax
  803c12:	0f b6 c0             	movzbl %al,%eax
  803c15:	c9                   	leaveq 
  803c16:	c3                   	retq   

0000000000803c17 <iscons>:
  803c17:	55                   	push   %rbp
  803c18:	48 89 e5             	mov    %rsp,%rbp
  803c1b:	48 83 ec 20          	sub    $0x20,%rsp
  803c1f:	89 7d ec             	mov    %edi,-0x14(%rbp)
  803c22:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
  803c26:	8b 45 ec             	mov    -0x14(%rbp),%eax
  803c29:	48 89 d6             	mov    %rdx,%rsi
  803c2c:	89 c7                	mov    %eax,%edi
  803c2e:	48 b8 8c 1e 80 00 00 	movabs $0x801e8c,%rax
  803c35:	00 00 00 
  803c38:	ff d0                	callq  *%rax
  803c3a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c3d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c41:	79 05                	jns    803c48 <iscons+0x31>
  803c43:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c46:	eb 1a                	jmp    803c62 <iscons+0x4b>
  803c48:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c4c:	8b 10                	mov    (%rax),%edx
  803c4e:	48 b8 20 61 80 00 00 	movabs $0x806120,%rax
  803c55:	00 00 00 
  803c58:	8b 00                	mov    (%rax),%eax
  803c5a:	39 c2                	cmp    %eax,%edx
  803c5c:	0f 94 c0             	sete   %al
  803c5f:	0f b6 c0             	movzbl %al,%eax
  803c62:	c9                   	leaveq 
  803c63:	c3                   	retq   

0000000000803c64 <opencons>:
  803c64:	55                   	push   %rbp
  803c65:	48 89 e5             	mov    %rsp,%rbp
  803c68:	48 83 ec 10          	sub    $0x10,%rsp
  803c6c:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
  803c70:	48 89 c7             	mov    %rax,%rdi
  803c73:	48 b8 f4 1d 80 00 00 	movabs $0x801df4,%rax
  803c7a:	00 00 00 
  803c7d:	ff d0                	callq  *%rax
  803c7f:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803c82:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803c86:	79 05                	jns    803c8d <opencons+0x29>
  803c88:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803c8b:	eb 5b                	jmp    803ce8 <opencons+0x84>
  803c8d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803c91:	ba 07 04 00 00       	mov    $0x407,%edx
  803c96:	48 89 c6             	mov    %rax,%rsi
  803c99:	bf 00 00 00 00       	mov    $0x0,%edi
  803c9e:	48 b8 aa 19 80 00 00 	movabs $0x8019aa,%rax
  803ca5:	00 00 00 
  803ca8:	ff d0                	callq  *%rax
  803caa:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803cad:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803cb1:	79 05                	jns    803cb8 <opencons+0x54>
  803cb3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803cb6:	eb 30                	jmp    803ce8 <opencons+0x84>
  803cb8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cbc:	48 ba 20 61 80 00 00 	movabs $0x806120,%rdx
  803cc3:	00 00 00 
  803cc6:	8b 12                	mov    (%rdx),%edx
  803cc8:	89 10                	mov    %edx,(%rax)
  803cca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cce:	c7 40 08 02 00 00 00 	movl   $0x2,0x8(%rax)
  803cd5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803cd9:	48 89 c7             	mov    %rax,%rdi
  803cdc:	48 b8 a6 1d 80 00 00 	movabs $0x801da6,%rax
  803ce3:	00 00 00 
  803ce6:	ff d0                	callq  *%rax
  803ce8:	c9                   	leaveq 
  803ce9:	c3                   	retq   

0000000000803cea <devcons_read>:
  803cea:	55                   	push   %rbp
  803ceb:	48 89 e5             	mov    %rsp,%rbp
  803cee:	48 83 ec 30          	sub    $0x30,%rsp
  803cf2:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803cf6:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803cfa:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803cfe:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803d03:	75 13                	jne    803d18 <devcons_read+0x2e>
  803d05:	b8 00 00 00 00       	mov    $0x0,%eax
  803d0a:	eb 49                	jmp    803d55 <devcons_read+0x6b>
  803d0c:	48 b8 6d 19 80 00 00 	movabs $0x80196d,%rax
  803d13:	00 00 00 
  803d16:	ff d0                	callq  *%rax
  803d18:	48 b8 af 18 80 00 00 	movabs $0x8018af,%rax
  803d1f:	00 00 00 
  803d22:	ff d0                	callq  *%rax
  803d24:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803d27:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d2b:	74 df                	je     803d0c <devcons_read+0x22>
  803d2d:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803d31:	79 05                	jns    803d38 <devcons_read+0x4e>
  803d33:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d36:	eb 1d                	jmp    803d55 <devcons_read+0x6b>
  803d38:	83 7d fc 04          	cmpl   $0x4,-0x4(%rbp)
  803d3c:	75 07                	jne    803d45 <devcons_read+0x5b>
  803d3e:	b8 00 00 00 00       	mov    $0x0,%eax
  803d43:	eb 10                	jmp    803d55 <devcons_read+0x6b>
  803d45:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d48:	89 c2                	mov    %eax,%edx
  803d4a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803d4e:	88 10                	mov    %dl,(%rax)
  803d50:	b8 01 00 00 00       	mov    $0x1,%eax
  803d55:	c9                   	leaveq 
  803d56:	c3                   	retq   

0000000000803d57 <devcons_write>:
  803d57:	55                   	push   %rbp
  803d58:	48 89 e5             	mov    %rsp,%rbp
  803d5b:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  803d62:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
  803d69:	48 89 b5 60 ff ff ff 	mov    %rsi,-0xa0(%rbp)
  803d70:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  803d77:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  803d7e:	eb 76                	jmp    803df6 <devcons_write+0x9f>
  803d80:	48 8b 85 58 ff ff ff 	mov    -0xa8(%rbp),%rax
  803d87:	89 c2                	mov    %eax,%edx
  803d89:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803d8c:	29 c2                	sub    %eax,%edx
  803d8e:	89 d0                	mov    %edx,%eax
  803d90:	89 45 f8             	mov    %eax,-0x8(%rbp)
  803d93:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803d96:	83 f8 7f             	cmp    $0x7f,%eax
  803d99:	76 07                	jbe    803da2 <devcons_write+0x4b>
  803d9b:	c7 45 f8 7f 00 00 00 	movl   $0x7f,-0x8(%rbp)
  803da2:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803da5:	48 63 d0             	movslq %eax,%rdx
  803da8:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803dab:	48 63 c8             	movslq %eax,%rcx
  803dae:	48 8b 85 60 ff ff ff 	mov    -0xa0(%rbp),%rax
  803db5:	48 01 c1             	add    %rax,%rcx
  803db8:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803dbf:	48 89 ce             	mov    %rcx,%rsi
  803dc2:	48 89 c7             	mov    %rax,%rdi
  803dc5:	48 b8 9f 13 80 00 00 	movabs $0x80139f,%rax
  803dcc:	00 00 00 
  803dcf:	ff d0                	callq  *%rax
  803dd1:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803dd4:	48 63 d0             	movslq %eax,%rdx
  803dd7:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
  803dde:	48 89 d6             	mov    %rdx,%rsi
  803de1:	48 89 c7             	mov    %rax,%rdi
  803de4:	48 b8 62 18 80 00 00 	movabs $0x801862,%rax
  803deb:	00 00 00 
  803dee:	ff d0                	callq  *%rax
  803df0:	8b 45 f8             	mov    -0x8(%rbp),%eax
  803df3:	01 45 fc             	add    %eax,-0x4(%rbp)
  803df6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803df9:	48 98                	cltq   
  803dfb:	48 3b 85 58 ff ff ff 	cmp    -0xa8(%rbp),%rax
  803e02:	0f 82 78 ff ff ff    	jb     803d80 <devcons_write+0x29>
  803e08:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803e0b:	c9                   	leaveq 
  803e0c:	c3                   	retq   

0000000000803e0d <devcons_close>:
  803e0d:	55                   	push   %rbp
  803e0e:	48 89 e5             	mov    %rsp,%rbp
  803e11:	48 83 ec 08          	sub    $0x8,%rsp
  803e15:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e19:	b8 00 00 00 00       	mov    $0x0,%eax
  803e1e:	c9                   	leaveq 
  803e1f:	c3                   	retq   

0000000000803e20 <devcons_stat>:
  803e20:	55                   	push   %rbp
  803e21:	48 89 e5             	mov    %rsp,%rbp
  803e24:	48 83 ec 10          	sub    $0x10,%rsp
  803e28:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  803e2c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  803e30:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  803e34:	48 be 7a 4e 80 00 00 	movabs $0x804e7a,%rsi
  803e3b:	00 00 00 
  803e3e:	48 89 c7             	mov    %rax,%rdi
  803e41:	48 b8 7a 10 80 00 00 	movabs $0x80107a,%rax
  803e48:	00 00 00 
  803e4b:	ff d0                	callq  *%rax
  803e4d:	b8 00 00 00 00       	mov    $0x0,%eax
  803e52:	c9                   	leaveq 
  803e53:	c3                   	retq   

0000000000803e54 <_panic>:
  803e54:	55                   	push   %rbp
  803e55:	48 89 e5             	mov    %rsp,%rbp
  803e58:	53                   	push   %rbx
  803e59:	48 81 ec f8 00 00 00 	sub    $0xf8,%rsp
  803e60:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  803e67:	89 b5 14 ff ff ff    	mov    %esi,-0xec(%rbp)
  803e6d:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  803e74:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
  803e7b:	4c 89 85 60 ff ff ff 	mov    %r8,-0xa0(%rbp)
  803e82:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  803e89:	84 c0                	test   %al,%al
  803e8b:	74 23                	je     803eb0 <_panic+0x5c>
  803e8d:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
  803e94:	0f 29 4d 80          	movaps %xmm1,-0x80(%rbp)
  803e98:	0f 29 55 90          	movaps %xmm2,-0x70(%rbp)
  803e9c:	0f 29 5d a0          	movaps %xmm3,-0x60(%rbp)
  803ea0:	0f 29 65 b0          	movaps %xmm4,-0x50(%rbp)
  803ea4:	0f 29 6d c0          	movaps %xmm5,-0x40(%rbp)
  803ea8:	0f 29 75 d0          	movaps %xmm6,-0x30(%rbp)
  803eac:	0f 29 7d e0          	movaps %xmm7,-0x20(%rbp)
  803eb0:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
  803eb7:	00 00 00 
  803eba:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
  803ec1:	00 00 00 
  803ec4:	48 8d 45 10          	lea    0x10(%rbp),%rax
  803ec8:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
  803ecf:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
  803ed6:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  803edd:	48 b8 08 60 80 00 00 	movabs $0x806008,%rax
  803ee4:	00 00 00 
  803ee7:	48 8b 18             	mov    (%rax),%rbx
  803eea:	48 b8 31 19 80 00 00 	movabs $0x801931,%rax
  803ef1:	00 00 00 
  803ef4:	ff d0                	callq  *%rax
  803ef6:	89 c6                	mov    %eax,%esi
  803ef8:	8b 95 14 ff ff ff    	mov    -0xec(%rbp),%edx
  803efe:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
  803f05:	41 89 d0             	mov    %edx,%r8d
  803f08:	48 89 c1             	mov    %rax,%rcx
  803f0b:	48 89 da             	mov    %rbx,%rdx
  803f0e:	48 bf 88 4e 80 00 00 	movabs $0x804e88,%rdi
  803f15:	00 00 00 
  803f18:	b8 00 00 00 00       	mov    $0x0,%eax
  803f1d:	49 b9 ea 04 80 00 00 	movabs $0x8004ea,%r9
  803f24:	00 00 00 
  803f27:	41 ff d1             	callq  *%r9
  803f2a:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
  803f31:	48 8b 85 08 ff ff ff 	mov    -0xf8(%rbp),%rax
  803f38:	48 89 d6             	mov    %rdx,%rsi
  803f3b:	48 89 c7             	mov    %rax,%rdi
  803f3e:	48 b8 3e 04 80 00 00 	movabs $0x80043e,%rax
  803f45:	00 00 00 
  803f48:	ff d0                	callq  *%rax
  803f4a:	48 bf ab 4e 80 00 00 	movabs $0x804eab,%rdi
  803f51:	00 00 00 
  803f54:	b8 00 00 00 00       	mov    $0x0,%eax
  803f59:	48 ba ea 04 80 00 00 	movabs $0x8004ea,%rdx
  803f60:	00 00 00 
  803f63:	ff d2                	callq  *%rdx
  803f65:	cc                   	int3   
  803f66:	eb fd                	jmp    803f65 <_panic+0x111>

0000000000803f68 <ipc_recv>:
  803f68:	55                   	push   %rbp
  803f69:	48 89 e5             	mov    %rsp,%rbp
  803f6c:	48 83 ec 30          	sub    $0x30,%rsp
  803f70:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  803f74:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  803f78:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  803f7c:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  803f81:	75 0e                	jne    803f91 <ipc_recv+0x29>
  803f83:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  803f8a:	00 00 00 
  803f8d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  803f91:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  803f95:	48 89 c7             	mov    %rax,%rdi
  803f98:	48 b8 e4 1b 80 00 00 	movabs $0x801be4,%rax
  803f9f:	00 00 00 
  803fa2:	ff d0                	callq  *%rax
  803fa4:	89 45 fc             	mov    %eax,-0x4(%rbp)
  803fa7:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  803fab:	79 27                	jns    803fd4 <ipc_recv+0x6c>
  803fad:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803fb2:	74 0a                	je     803fbe <ipc_recv+0x56>
  803fb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803fb8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803fbe:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803fc3:	74 0a                	je     803fcf <ipc_recv+0x67>
  803fc5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  803fc9:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
  803fcf:	8b 45 fc             	mov    -0x4(%rbp),%eax
  803fd2:	eb 53                	jmp    804027 <ipc_recv+0xbf>
  803fd4:	48 83 7d e8 00       	cmpq   $0x0,-0x18(%rbp)
  803fd9:	74 19                	je     803ff4 <ipc_recv+0x8c>
  803fdb:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  803fe2:	00 00 00 
  803fe5:	48 8b 00             	mov    (%rax),%rax
  803fe8:	8b 90 0c 01 00 00    	mov    0x10c(%rax),%edx
  803fee:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  803ff2:	89 10                	mov    %edx,(%rax)
  803ff4:	48 83 7d d8 00       	cmpq   $0x0,-0x28(%rbp)
  803ff9:	74 19                	je     804014 <ipc_recv+0xac>
  803ffb:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  804002:	00 00 00 
  804005:	48 8b 00             	mov    (%rax),%rax
  804008:	8b 90 10 01 00 00    	mov    0x110(%rax),%edx
  80400e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  804012:	89 10                	mov    %edx,(%rax)
  804014:	48 b8 20 70 80 00 00 	movabs $0x807020,%rax
  80401b:	00 00 00 
  80401e:	48 8b 00             	mov    (%rax),%rax
  804021:	8b 80 08 01 00 00    	mov    0x108(%rax),%eax
  804027:	c9                   	leaveq 
  804028:	c3                   	retq   

0000000000804029 <ipc_send>:
  804029:	55                   	push   %rbp
  80402a:	48 89 e5             	mov    %rsp,%rbp
  80402d:	48 83 ec 30          	sub    $0x30,%rsp
  804031:	89 7d ec             	mov    %edi,-0x14(%rbp)
  804034:	89 75 e8             	mov    %esi,-0x18(%rbp)
  804037:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  80403b:	89 4d dc             	mov    %ecx,-0x24(%rbp)
  80403e:	48 83 7d e0 00       	cmpq   $0x0,-0x20(%rbp)
  804043:	75 1c                	jne    804061 <ipc_send+0x38>
  804045:	48 b8 00 00 80 00 80 	movabs $0x8000800000,%rax
  80404c:	00 00 00 
  80404f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  804053:	eb 0c                	jmp    804061 <ipc_send+0x38>
  804055:	48 b8 6d 19 80 00 00 	movabs $0x80196d,%rax
  80405c:	00 00 00 
  80405f:	ff d0                	callq  *%rax
  804061:	8b 75 e8             	mov    -0x18(%rbp),%esi
  804064:	8b 4d dc             	mov    -0x24(%rbp),%ecx
  804067:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  80406b:	8b 45 ec             	mov    -0x14(%rbp),%eax
  80406e:	89 c7                	mov    %eax,%edi
  804070:	48 b8 8d 1b 80 00 00 	movabs $0x801b8d,%rax
  804077:	00 00 00 
  80407a:	ff d0                	callq  *%rax
  80407c:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80407f:	83 7d fc f8          	cmpl   $0xfffffff8,-0x4(%rbp)
  804083:	74 d0                	je     804055 <ipc_send+0x2c>
  804085:	83 7d fc 00          	cmpl   $0x0,-0x4(%rbp)
  804089:	79 30                	jns    8040bb <ipc_send+0x92>
  80408b:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80408e:	89 c1                	mov    %eax,%ecx
  804090:	48 ba b0 4e 80 00 00 	movabs $0x804eb0,%rdx
  804097:	00 00 00 
  80409a:	be 44 00 00 00       	mov    $0x44,%esi
  80409f:	48 bf c6 4e 80 00 00 	movabs $0x804ec6,%rdi
  8040a6:	00 00 00 
  8040a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8040ae:	49 b8 54 3e 80 00 00 	movabs $0x803e54,%r8
  8040b5:	00 00 00 
  8040b8:	41 ff d0             	callq  *%r8
  8040bb:	90                   	nop
  8040bc:	c9                   	leaveq 
  8040bd:	c3                   	retq   

00000000008040be <ipc_host_recv>:
  8040be:	55                   	push   %rbp
  8040bf:	48 89 e5             	mov    %rsp,%rbp
  8040c2:	48 83 ec 10          	sub    $0x10,%rsp
  8040c6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  8040ca:	48 ba d8 4e 80 00 00 	movabs $0x804ed8,%rdx
  8040d1:	00 00 00 
  8040d4:	be 4e 00 00 00       	mov    $0x4e,%esi
  8040d9:	48 bf c6 4e 80 00 00 	movabs $0x804ec6,%rdi
  8040e0:	00 00 00 
  8040e3:	b8 00 00 00 00       	mov    $0x0,%eax
  8040e8:	48 b9 54 3e 80 00 00 	movabs $0x803e54,%rcx
  8040ef:	00 00 00 
  8040f2:	ff d1                	callq  *%rcx

00000000008040f4 <ipc_host_send>:
  8040f4:	55                   	push   %rbp
  8040f5:	48 89 e5             	mov    %rsp,%rbp
  8040f8:	48 83 ec 20          	sub    $0x20,%rsp
  8040fc:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8040ff:	89 75 f8             	mov    %esi,-0x8(%rbp)
  804102:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  804106:	89 4d ec             	mov    %ecx,-0x14(%rbp)
  804109:	48 ba f8 4e 80 00 00 	movabs $0x804ef8,%rdx
  804110:	00 00 00 
  804113:	be 58 00 00 00       	mov    $0x58,%esi
  804118:	48 bf c6 4e 80 00 00 	movabs $0x804ec6,%rdi
  80411f:	00 00 00 
  804122:	b8 00 00 00 00       	mov    $0x0,%eax
  804127:	48 b9 54 3e 80 00 00 	movabs $0x803e54,%rcx
  80412e:	00 00 00 
  804131:	ff d1                	callq  *%rcx

0000000000804133 <ipc_find_env>:
  804133:	55                   	push   %rbp
  804134:	48 89 e5             	mov    %rsp,%rbp
  804137:	48 83 ec 18          	sub    $0x18,%rsp
  80413b:	89 7d ec             	mov    %edi,-0x14(%rbp)
  80413e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  804145:	eb 4d                	jmp    804194 <ipc_find_env+0x61>
  804147:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  80414e:	00 00 00 
  804151:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804154:	48 98                	cltq   
  804156:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  80415d:	48 01 d0             	add    %rdx,%rax
  804160:	48 05 d0 00 00 00    	add    $0xd0,%rax
  804166:	8b 00                	mov    (%rax),%eax
  804168:	3b 45 ec             	cmp    -0x14(%rbp),%eax
  80416b:	75 23                	jne    804190 <ipc_find_env+0x5d>
  80416d:	48 ba 00 00 80 00 80 	movabs $0x8000800000,%rdx
  804174:	00 00 00 
  804177:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80417a:	48 98                	cltq   
  80417c:	48 69 c0 68 01 00 00 	imul   $0x168,%rax,%rax
  804183:	48 01 d0             	add    %rdx,%rax
  804186:	48 05 c8 00 00 00    	add    $0xc8,%rax
  80418c:	8b 00                	mov    (%rax),%eax
  80418e:	eb 12                	jmp    8041a2 <ipc_find_env+0x6f>
  804190:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  804194:	81 7d fc ff 03 00 00 	cmpl   $0x3ff,-0x4(%rbp)
  80419b:	7e aa                	jle    804147 <ipc_find_env+0x14>
  80419d:	b8 00 00 00 00       	mov    $0x0,%eax
  8041a2:	c9                   	leaveq 
  8041a3:	c3                   	retq   

00000000008041a4 <pageref>:
  8041a4:	55                   	push   %rbp
  8041a5:	48 89 e5             	mov    %rsp,%rbp
  8041a8:	48 83 ec 18          	sub    $0x18,%rsp
  8041ac:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  8041b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041b4:	48 c1 e8 15          	shr    $0x15,%rax
  8041b8:	48 89 c2             	mov    %rax,%rdx
  8041bb:	48 b8 00 00 00 80 00 	movabs $0x10080000000,%rax
  8041c2:	01 00 00 
  8041c5:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8041c9:	83 e0 01             	and    $0x1,%eax
  8041cc:	48 85 c0             	test   %rax,%rax
  8041cf:	75 07                	jne    8041d8 <pageref+0x34>
  8041d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8041d6:	eb 56                	jmp    80422e <pageref+0x8a>
  8041d8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8041dc:	48 c1 e8 0c          	shr    $0xc,%rax
  8041e0:	48 89 c2             	mov    %rax,%rdx
  8041e3:	48 b8 00 00 00 00 00 	movabs $0x10000000000,%rax
  8041ea:	01 00 00 
  8041ed:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  8041f1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  8041f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8041f9:	83 e0 01             	and    $0x1,%eax
  8041fc:	48 85 c0             	test   %rax,%rax
  8041ff:	75 07                	jne    804208 <pageref+0x64>
  804201:	b8 00 00 00 00       	mov    $0x0,%eax
  804206:	eb 26                	jmp    80422e <pageref+0x8a>
  804208:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  80420c:	48 c1 e8 0c          	shr    $0xc,%rax
  804210:	48 89 c2             	mov    %rax,%rdx
  804213:	48 b8 00 00 a0 00 80 	movabs $0x8000a00000,%rax
  80421a:	00 00 00 
  80421d:	48 c1 e2 04          	shl    $0x4,%rdx
  804221:	48 01 d0             	add    %rdx,%rax
  804224:	48 83 c0 08          	add    $0x8,%rax
  804228:	0f b7 00             	movzwl (%rax),%eax
  80422b:	0f b7 c0             	movzwl %ax,%eax
  80422e:	c9                   	leaveq 
  80422f:	c3                   	retq   

0000000000804230 <inet_addr>:
  804230:	55                   	push   %rbp
  804231:	48 89 e5             	mov    %rsp,%rbp
  804234:	48 83 ec 20          	sub    $0x20,%rsp
  804238:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  80423c:	48 8d 55 fc          	lea    -0x4(%rbp),%rdx
  804240:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  804244:	48 89 d6             	mov    %rdx,%rsi
  804247:	48 89 c7             	mov    %rax,%rdi
  80424a:	48 b8 66 42 80 00 00 	movabs $0x804266,%rax
  804251:	00 00 00 
  804254:	ff d0                	callq  *%rax
  804256:	85 c0                	test   %eax,%eax
  804258:	74 05                	je     80425f <inet_addr+0x2f>
  80425a:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80425d:	eb 05                	jmp    804264 <inet_addr+0x34>
  80425f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  804264:	c9                   	leaveq 
  804265:	c3                   	retq   

0000000000804266 <inet_aton>:
  804266:	55                   	push   %rbp
  804267:	48 89 e5             	mov    %rsp,%rbp
  80426a:	48 83 ec 40          	sub    $0x40,%rsp
  80426e:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  804272:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
  804276:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  80427a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  80427e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804282:	0f b6 00             	movzbl (%rax),%eax
  804285:	0f be c0             	movsbl %al,%eax
  804288:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80428b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80428e:	3c 2f                	cmp    $0x2f,%al
  804290:	76 07                	jbe    804299 <inet_aton+0x33>
  804292:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804295:	3c 39                	cmp    $0x39,%al
  804297:	76 0a                	jbe    8042a3 <inet_aton+0x3d>
  804299:	b8 00 00 00 00       	mov    $0x0,%eax
  80429e:	e9 6a 02 00 00       	jmpq   80450d <inet_aton+0x2a7>
  8042a3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  8042aa:	c7 45 f8 0a 00 00 00 	movl   $0xa,-0x8(%rbp)
  8042b1:	83 7d f4 30          	cmpl   $0x30,-0xc(%rbp)
  8042b5:	75 40                	jne    8042f7 <inet_aton+0x91>
  8042b7:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8042bc:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8042c0:	0f b6 00             	movzbl (%rax),%eax
  8042c3:	0f be c0             	movsbl %al,%eax
  8042c6:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8042c9:	83 7d f4 78          	cmpl   $0x78,-0xc(%rbp)
  8042cd:	74 06                	je     8042d5 <inet_aton+0x6f>
  8042cf:	83 7d f4 58          	cmpl   $0x58,-0xc(%rbp)
  8042d3:	75 1b                	jne    8042f0 <inet_aton+0x8a>
  8042d5:	c7 45 f8 10 00 00 00 	movl   $0x10,-0x8(%rbp)
  8042dc:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8042e1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8042e5:	0f b6 00             	movzbl (%rax),%eax
  8042e8:	0f be c0             	movsbl %al,%eax
  8042eb:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8042ee:	eb 07                	jmp    8042f7 <inet_aton+0x91>
  8042f0:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%rbp)
  8042f7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8042fa:	3c 2f                	cmp    $0x2f,%al
  8042fc:	76 2f                	jbe    80432d <inet_aton+0xc7>
  8042fe:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804301:	3c 39                	cmp    $0x39,%al
  804303:	77 28                	ja     80432d <inet_aton+0xc7>
  804305:	8b 45 f8             	mov    -0x8(%rbp),%eax
  804308:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  80430c:	89 c2                	mov    %eax,%edx
  80430e:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804311:	01 d0                	add    %edx,%eax
  804313:	83 e8 30             	sub    $0x30,%eax
  804316:	89 45 fc             	mov    %eax,-0x4(%rbp)
  804319:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  80431e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804322:	0f b6 00             	movzbl (%rax),%eax
  804325:	0f be c0             	movsbl %al,%eax
  804328:	89 45 f4             	mov    %eax,-0xc(%rbp)
  80432b:	eb 73                	jmp    8043a0 <inet_aton+0x13a>
  80432d:	83 7d f8 10          	cmpl   $0x10,-0x8(%rbp)
  804331:	75 72                	jne    8043a5 <inet_aton+0x13f>
  804333:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804336:	3c 2f                	cmp    $0x2f,%al
  804338:	76 07                	jbe    804341 <inet_aton+0xdb>
  80433a:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80433d:	3c 39                	cmp    $0x39,%al
  80433f:	76 1c                	jbe    80435d <inet_aton+0xf7>
  804341:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804344:	3c 60                	cmp    $0x60,%al
  804346:	76 07                	jbe    80434f <inet_aton+0xe9>
  804348:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80434b:	3c 66                	cmp    $0x66,%al
  80434d:	76 0e                	jbe    80435d <inet_aton+0xf7>
  80434f:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804352:	3c 40                	cmp    $0x40,%al
  804354:	76 4f                	jbe    8043a5 <inet_aton+0x13f>
  804356:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804359:	3c 46                	cmp    $0x46,%al
  80435b:	77 48                	ja     8043a5 <inet_aton+0x13f>
  80435d:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804360:	c1 e0 04             	shl    $0x4,%eax
  804363:	89 c2                	mov    %eax,%edx
  804365:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804368:	8d 48 0a             	lea    0xa(%rax),%ecx
  80436b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  80436e:	3c 60                	cmp    $0x60,%al
  804370:	76 0e                	jbe    804380 <inet_aton+0x11a>
  804372:	8b 45 f4             	mov    -0xc(%rbp),%eax
  804375:	3c 7a                	cmp    $0x7a,%al
  804377:	77 07                	ja     804380 <inet_aton+0x11a>
  804379:	b8 61 00 00 00       	mov    $0x61,%eax
  80437e:	eb 05                	jmp    804385 <inet_aton+0x11f>
  804380:	b8 41 00 00 00       	mov    $0x41,%eax
  804385:	29 c1                	sub    %eax,%ecx
  804387:	89 c8                	mov    %ecx,%eax
  804389:	09 d0                	or     %edx,%eax
  80438b:	89 45 fc             	mov    %eax,-0x4(%rbp)
  80438e:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  804393:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  804397:	0f b6 00             	movzbl (%rax),%eax
  80439a:	0f be c0             	movsbl %al,%eax
  80439d:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8043a0:	e9 52 ff ff ff       	jmpq   8042f7 <inet_aton+0x91>
  8043a5:	83 7d f4 2e          	cmpl   $0x2e,-0xc(%rbp)
  8043a9:	75 40                	jne    8043eb <inet_aton+0x185>
  8043ab:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  8043af:	48 83 c0 0c          	add    $0xc,%rax
  8043b3:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
  8043b7:	77 0a                	ja     8043c3 <inet_aton+0x15d>
  8043b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8043be:	e9 4a 01 00 00       	jmpq   80450d <inet_aton+0x2a7>
  8043c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  8043c7:	48 8d 50 04          	lea    0x4(%rax),%rdx
  8043cb:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  8043cf:	8b 55 fc             	mov    -0x4(%rbp),%edx
  8043d2:	89 10                	mov    %edx,(%rax)
  8043d4:	48 83 45 c8 01       	addq   $0x1,-0x38(%rbp)
  8043d9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  8043dd:	0f b6 00             	movzbl (%rax),%eax
  8043e0:	0f be c0             	movsbl %al,%eax
  8043e3:	89 45 f4             	mov    %eax,-0xc(%rbp)
  8043e6:	e9 a0 fe ff ff       	jmpq   80428b <inet_aton+0x25>
  8043eb:	90                   	nop
  8043ec:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
  8043f0:	74 3c                	je     80442e <inet_aton+0x1c8>
  8043f2:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043f5:	3c 1f                	cmp    $0x1f,%al
  8043f7:	76 2b                	jbe    804424 <inet_aton+0x1be>
  8043f9:	8b 45 f4             	mov    -0xc(%rbp),%eax
  8043fc:	84 c0                	test   %al,%al
  8043fe:	78 24                	js     804424 <inet_aton+0x1be>
  804400:	83 7d f4 20          	cmpl   $0x20,-0xc(%rbp)
  804404:	74 28                	je     80442e <inet_aton+0x1c8>
  804406:	83 7d f4 0c          	cmpl   $0xc,-0xc(%rbp)
  80440a:	74 22                	je     80442e <inet_aton+0x1c8>
  80440c:	83 7d f4 0a          	cmpl   $0xa,-0xc(%rbp)
  804410:	74 1c                	je     80442e <inet_aton+0x1c8>
  804412:	83 7d f4 0d          	cmpl   $0xd,-0xc(%rbp)
  804416:	74 16                	je     80442e <inet_aton+0x1c8>
  804418:	83 7d f4 09          	cmpl   $0x9,-0xc(%rbp)
  80441c:	74 10                	je     80442e <inet_aton+0x1c8>
  80441e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%rbp)
  804422:	74 0a                	je     80442e <inet_aton+0x1c8>
  804424:	b8 00 00 00 00       	mov    $0x0,%eax
  804429:	e9 df 00 00 00       	jmpq   80450d <inet_aton+0x2a7>
  80442e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  804432:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  804436:	48 29 c2             	sub    %rax,%rdx
  804439:	48 89 d0             	mov    %rdx,%rax
  80443c:	48 c1 f8 02          	sar    $0x2,%rax
  804440:	83 c0 01             	add    $0x1,%eax
  804443:	89 45 e4             	mov    %eax,-0x1c(%rbp)
  804446:	83 7d e4 04          	cmpl   $0x4,-0x1c(%rbp)
  80444a:	0f 87 98 00 00 00    	ja     8044e8 <inet_aton+0x282>
  804450:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  804453:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
  80445a:	00 
  80445b:	48 b8 18 4f 80 00 00 	movabs $0x804f18,%rax
  804462:	00 00 00 
  804465:	48 01 d0             	add    %rdx,%rax
  804468:	48 8b 00             	mov    (%rax),%rax
  80446b:	ff e0                	jmpq   *%rax
  80446d:	b8 00 00 00 00       	mov    $0x0,%eax
  804472:	e9 96 00 00 00       	jmpq   80450d <inet_aton+0x2a7>
  804477:	81 7d fc ff ff ff 00 	cmpl   $0xffffff,-0x4(%rbp)
  80447e:	76 0a                	jbe    80448a <inet_aton+0x224>
  804480:	b8 00 00 00 00       	mov    $0x0,%eax
  804485:	e9 83 00 00 00       	jmpq   80450d <inet_aton+0x2a7>
  80448a:	8b 45 d0             	mov    -0x30(%rbp),%eax
  80448d:	c1 e0 18             	shl    $0x18,%eax
  804490:	09 45 fc             	or     %eax,-0x4(%rbp)
  804493:	eb 53                	jmp    8044e8 <inet_aton+0x282>
  804495:	81 7d fc ff ff 00 00 	cmpl   $0xffff,-0x4(%rbp)
  80449c:	76 07                	jbe    8044a5 <inet_aton+0x23f>
  80449e:	b8 00 00 00 00       	mov    $0x0,%eax
  8044a3:	eb 68                	jmp    80450d <inet_aton+0x2a7>
  8044a5:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8044a8:	c1 e0 18             	shl    $0x18,%eax
  8044ab:	89 c2                	mov    %eax,%edx
  8044ad:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8044b0:	c1 e0 10             	shl    $0x10,%eax
  8044b3:	09 d0                	or     %edx,%eax
  8044b5:	09 45 fc             	or     %eax,-0x4(%rbp)
  8044b8:	eb 2e                	jmp    8044e8 <inet_aton+0x282>
  8044ba:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%rbp)
  8044c1:	76 07                	jbe    8044ca <inet_aton+0x264>
  8044c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8044c8:	eb 43                	jmp    80450d <inet_aton+0x2a7>
  8044ca:	8b 45 d0             	mov    -0x30(%rbp),%eax
  8044cd:	c1 e0 18             	shl    $0x18,%eax
  8044d0:	89 c2                	mov    %eax,%edx
  8044d2:	8b 45 d4             	mov    -0x2c(%rbp),%eax
  8044d5:	c1 e0 10             	shl    $0x10,%eax
  8044d8:	09 c2                	or     %eax,%edx
  8044da:	8b 45 d8             	mov    -0x28(%rbp),%eax
  8044dd:	c1 e0 08             	shl    $0x8,%eax
  8044e0:	09 d0                	or     %edx,%eax
  8044e2:	09 45 fc             	or     %eax,-0x4(%rbp)
  8044e5:	eb 01                	jmp    8044e8 <inet_aton+0x282>
  8044e7:	90                   	nop
  8044e8:	48 83 7d c0 00       	cmpq   $0x0,-0x40(%rbp)
  8044ed:	74 19                	je     804508 <inet_aton+0x2a2>
  8044ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8044f2:	89 c7                	mov    %eax,%edi
  8044f4:	48 b8 86 46 80 00 00 	movabs $0x804686,%rax
  8044fb:	00 00 00 
  8044fe:	ff d0                	callq  *%rax
  804500:	89 c2                	mov    %eax,%edx
  804502:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  804506:	89 10                	mov    %edx,(%rax)
  804508:	b8 01 00 00 00       	mov    $0x1,%eax
  80450d:	c9                   	leaveq 
  80450e:	c3                   	retq   

000000000080450f <inet_ntoa>:
  80450f:	55                   	push   %rbp
  804510:	48 89 e5             	mov    %rsp,%rbp
  804513:	48 83 ec 28          	sub    $0x28,%rsp
  804517:	89 7d dc             	mov    %edi,-0x24(%rbp)
  80451a:	8b 45 dc             	mov    -0x24(%rbp),%eax
  80451d:	89 45 e8             	mov    %eax,-0x18(%rbp)
  804520:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  804527:	00 00 00 
  80452a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  80452e:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
  804532:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  804536:	c6 45 ef 00          	movb   $0x0,-0x11(%rbp)
  80453a:	e9 e0 00 00 00       	jmpq   80461f <inet_ntoa+0x110>
  80453f:	c6 45 ee 00          	movb   $0x0,-0x12(%rbp)
  804543:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804547:	0f b6 08             	movzbl (%rax),%ecx
  80454a:	0f b6 d1             	movzbl %cl,%edx
  80454d:	89 d0                	mov    %edx,%eax
  80454f:	c1 e0 02             	shl    $0x2,%eax
  804552:	01 d0                	add    %edx,%eax
  804554:	c1 e0 03             	shl    $0x3,%eax
  804557:	01 d0                	add    %edx,%eax
  804559:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  804560:	01 d0                	add    %edx,%eax
  804562:	66 c1 e8 08          	shr    $0x8,%ax
  804566:	c0 e8 03             	shr    $0x3,%al
  804569:	88 45 ed             	mov    %al,-0x13(%rbp)
  80456c:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  804570:	89 d0                	mov    %edx,%eax
  804572:	c1 e0 02             	shl    $0x2,%eax
  804575:	01 d0                	add    %edx,%eax
  804577:	01 c0                	add    %eax,%eax
  804579:	29 c1                	sub    %eax,%ecx
  80457b:	89 c8                	mov    %ecx,%eax
  80457d:	88 45 ed             	mov    %al,-0x13(%rbp)
  804580:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  804584:	0f b6 00             	movzbl (%rax),%eax
  804587:	0f b6 d0             	movzbl %al,%edx
  80458a:	89 d0                	mov    %edx,%eax
  80458c:	c1 e0 02             	shl    $0x2,%eax
  80458f:	01 d0                	add    %edx,%eax
  804591:	c1 e0 03             	shl    $0x3,%eax
  804594:	01 d0                	add    %edx,%eax
  804596:	8d 14 85 00 00 00 00 	lea    0x0(,%rax,4),%edx
  80459d:	01 d0                	add    %edx,%eax
  80459f:	66 c1 e8 08          	shr    $0x8,%ax
  8045a3:	89 c2                	mov    %eax,%edx
  8045a5:	c0 ea 03             	shr    $0x3,%dl
  8045a8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045ac:	88 10                	mov    %dl,(%rax)
  8045ae:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  8045b2:	8d 50 01             	lea    0x1(%rax),%edx
  8045b5:	88 55 ee             	mov    %dl,-0x12(%rbp)
  8045b8:	0f b6 c0             	movzbl %al,%eax
  8045bb:	0f b6 55 ed          	movzbl -0x13(%rbp),%edx
  8045bf:	83 c2 30             	add    $0x30,%edx
  8045c2:	48 98                	cltq   
  8045c4:	88 54 05 e5          	mov    %dl,-0x1b(%rbp,%rax,1)
  8045c8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  8045cc:	0f b6 00             	movzbl (%rax),%eax
  8045cf:	84 c0                	test   %al,%al
  8045d1:	0f 85 6c ff ff ff    	jne    804543 <inet_ntoa+0x34>
  8045d7:	eb 1a                	jmp    8045f3 <inet_ntoa+0xe4>
  8045d9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8045dd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  8045e1:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  8045e5:	0f b6 55 ee          	movzbl -0x12(%rbp),%edx
  8045e9:	48 63 d2             	movslq %edx,%rdx
  8045ec:	0f b6 54 15 e5       	movzbl -0x1b(%rbp,%rdx,1),%edx
  8045f1:	88 10                	mov    %dl,(%rax)
  8045f3:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
  8045f7:	8d 50 ff             	lea    -0x1(%rax),%edx
  8045fa:	88 55 ee             	mov    %dl,-0x12(%rbp)
  8045fd:	84 c0                	test   %al,%al
  8045ff:	75 d8                	jne    8045d9 <inet_ntoa+0xca>
  804601:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804605:	48 8d 50 01          	lea    0x1(%rax),%rdx
  804609:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
  80460d:	c6 00 2e             	movb   $0x2e,(%rax)
  804610:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
  804615:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
  804619:	83 c0 01             	add    $0x1,%eax
  80461c:	88 45 ef             	mov    %al,-0x11(%rbp)
  80461f:	80 7d ef 03          	cmpb   $0x3,-0x11(%rbp)
  804623:	0f 86 16 ff ff ff    	jbe    80453f <inet_ntoa+0x30>
  804629:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
  80462e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  804632:	c6 00 00             	movb   $0x0,(%rax)
  804635:	48 b8 10 70 80 00 00 	movabs $0x807010,%rax
  80463c:	00 00 00 
  80463f:	c9                   	leaveq 
  804640:	c3                   	retq   

0000000000804641 <htons>:
  804641:	55                   	push   %rbp
  804642:	48 89 e5             	mov    %rsp,%rbp
  804645:	48 83 ec 08          	sub    $0x8,%rsp
  804649:	89 f8                	mov    %edi,%eax
  80464b:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  80464f:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  804653:	c1 e0 08             	shl    $0x8,%eax
  804656:	89 c2                	mov    %eax,%edx
  804658:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  80465c:	66 c1 e8 08          	shr    $0x8,%ax
  804660:	09 d0                	or     %edx,%eax
  804662:	c9                   	leaveq 
  804663:	c3                   	retq   

0000000000804664 <ntohs>:
  804664:	55                   	push   %rbp
  804665:	48 89 e5             	mov    %rsp,%rbp
  804668:	48 83 ec 08          	sub    $0x8,%rsp
  80466c:	89 f8                	mov    %edi,%eax
  80466e:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  804672:	0f b7 45 fc          	movzwl -0x4(%rbp),%eax
  804676:	89 c7                	mov    %eax,%edi
  804678:	48 b8 41 46 80 00 00 	movabs $0x804641,%rax
  80467f:	00 00 00 
  804682:	ff d0                	callq  *%rax
  804684:	c9                   	leaveq 
  804685:	c3                   	retq   

0000000000804686 <htonl>:
  804686:	55                   	push   %rbp
  804687:	48 89 e5             	mov    %rsp,%rbp
  80468a:	48 83 ec 08          	sub    $0x8,%rsp
  80468e:	89 7d fc             	mov    %edi,-0x4(%rbp)
  804691:	8b 45 fc             	mov    -0x4(%rbp),%eax
  804694:	c1 e0 18             	shl    $0x18,%eax
  804697:	89 c2                	mov    %eax,%edx
  804699:	8b 45 fc             	mov    -0x4(%rbp),%eax
  80469c:	25 00 ff 00 00       	and    $0xff00,%eax
  8046a1:	c1 e0 08             	shl    $0x8,%eax
  8046a4:	09 c2                	or     %eax,%edx
  8046a6:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046a9:	25 00 00 ff 00       	and    $0xff0000,%eax
  8046ae:	48 c1 e8 08          	shr    $0x8,%rax
  8046b2:	09 c2                	or     %eax,%edx
  8046b4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046b7:	c1 e8 18             	shr    $0x18,%eax
  8046ba:	09 d0                	or     %edx,%eax
  8046bc:	c9                   	leaveq 
  8046bd:	c3                   	retq   

00000000008046be <ntohl>:
  8046be:	55                   	push   %rbp
  8046bf:	48 89 e5             	mov    %rsp,%rbp
  8046c2:	48 83 ec 08          	sub    $0x8,%rsp
  8046c6:	89 7d fc             	mov    %edi,-0x4(%rbp)
  8046c9:	8b 45 fc             	mov    -0x4(%rbp),%eax
  8046cc:	89 c7                	mov    %eax,%edi
  8046ce:	48 b8 86 46 80 00 00 	movabs $0x804686,%rax
  8046d5:	00 00 00 
  8046d8:	ff d0                	callq  *%rax
  8046da:	c9                   	leaveq 
  8046db:	c3                   	retq   
